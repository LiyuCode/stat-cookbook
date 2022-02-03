
## Perparation on Ubuntu 20.04

### Install R on Ubuntu

```bash
sudo apt install -y dirmngr gnupg apt-transport-https ca-certificates software-properties-common
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'

sudo apt install r-base
```

Then, complie:

### Compile
```bash
cd STAT-COOKBOOK
make # or 'sudo make' for the 1st time
```