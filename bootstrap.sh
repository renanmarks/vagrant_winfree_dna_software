#!/usr/bin/env bash

# Install base packages
sudo apt-get update
sudo apt-get install -y  python python2.7 python2.7-dev python-setuptools python-pip python-virtualenv python-pandas python-seaborn python-sympy python-networkx python-future python-matplotlib python-xlrd cmake g++ #python3-pip python3-virtualenv 
sudo apt-get install -y python3.8 python3.8-dev python3-setuptools python3-pip python3-virtualenv python3-networkx python3-future python3-xlrd
sudo apt-get purge -y python3-numpy

# Make dir to hold all the software
mkdir winfree
cd winfree

# Clone the repos
git clone https://github.com/DNA-and-Natural-Algorithms-Group/multistrand.git
git clone https://github.com/DNA-and-Natural-Algorithms-Group/KinDA.git
git clone https://github.com/DNA-and-Natural-Algorithms-Group/peppercornenumerator.git
git clone --branch v0.8  https://github.com/DNA-and-Natural-Algorithms-Group/nuskell.git

# Get the Nupack software
cp /vagrant/nupack-3.2.2.tar.gz .
#cp /vagrant/nupack-4.0.0.27.zip .

# Build Nupack 3.2.2
tar xvf nupack-3.2.2.tar.gz
cd nupack3.2.2/
mkdir build
cd build
cmake ../
make
sudo make install

# Set up the env variable
export NUPACKHOME='/home/vagrant/winfree/nupack3.2.2/'
echo "export NUPACKHOME='/home/vagrant/winfree/nupack3.2.2/'" >> ~/.bashrc

# Build Multistrand
cd ../../multistrand
make
sudo make install

# ... without these, the "python tutorials/misc/sample_trace.py" command do not run
# pip2 install numpy scipy matplotlib xlrd

# Also need to create a dir containing a symbolic link to the files needed by sample_trace.py
mkdir /usr/local/share/nupack/parameters
cd /usr/local/share/nupack/parameters
ln -s ../?na* .

# Build and install peppercornenumerator
cd /home/vagrant/winfree/peppercornenumerator
#sudo apt install python-pandas python-seaborn python-sympy #python3-pandas python3-seaborn python3-sympy
git checkout v0.9
python setup.py build
sudo python setup.py install

# Build and install KinDA

cd ../KinDA
#sudo apt install python-networkx python-future
python setup.py build
sudo python setup.py install

# Build and install Nuskell

cd ../nuskell
pip3 install numpy==1.15.4 versioneer pandas matplotlib scipy seaborn
sudo python3.8 setup.py install
