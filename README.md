# ld-preload-practice
Practicing LD_PRELOAD

- Try running `test.sh` in each directory for some `LD_PRELOAD` magic

##  Installation
This project was built on [NCSU ARC Cluster](https://arcb.csc.ncsu.edu/~mueller/cluster/arc/), which uses CentOS Linux 7 (Core) x87_64. You might need to add some needed dependancies that don't exist on your system. Try `cat fetch.txt` for more system information.

### Memkind Library
See [memkind#building-and-installing](https://github.com/memkind/memkind#building-and-installing).

Because I don't have root permissions, I am installing in `$HOME/.local`.
```
./autogen.sh
./configure --prefix=$HOME/.local
make
make install
```
You can choose to install it at a system level, or to another directory. You might need to modify some of the scripts to account for this change. I recommend running the following command at the top-level of the repo to find where `.local` is hardcoded:
```
grep -r '[.]local'
```
