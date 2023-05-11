#!/bin/bash

# Compiles and runs fake-malloc

# if ! make clean; then
#     echo "Failed to clean"
#     exit 1
# fi

if ! make; then
    echo "Failed to compile"
    exit 1
fi

echo "NORMAL"
./fake-malloc | tee out.txt

echo -e "\nLD_PRELOAD w/ malloc"
LD_PRELOAD=./mymalloc.so ./fake-malloc | tee -a out.txt

# Verify that "41" was printed twice
echo -e "\nTESTING"
if [[ $(grep -c "ptr = 41" out.txt) == 2 ]]; then
    echo "SUCCESS"
else
    echo "FAILURE"
    exit 1
fi

# Verify that "Calling dlsym" happened only once
if [[ $(grep -c "Calling dlsym" out.txt) == 1 ]]; then
    echo "SUCCESS"
else
    echo "FAILURE"
    exit 1
fi

echo -e "\nLD_PRELOAD w/ memkind"
LD_PRELOAD=./optanemalloc.so ./fake-malloc | tee out-optane.txt

# Verify that "41" was printed once
echo -e "\nTESTING memkind"
if [[ $(grep -c "ptr = 41" out-optane.txt) == 1 ]]; then
    echo "SUCCESS"
else
    echo "FAILURE"
    exit 1
fi

# Debugging
# echo -e "\nDEBUGGING"
# if ! make optanemalloc.so; then
#     echo "Failed to compile optanemalloc.so"
#     exit 1
# fi

# echo -e "\nHELLO"
# if ! LD_PRELOAD=./optanemalloc.so exp/empty; then
#     echo "Failed to run empty"
#     exit 1
# fi
