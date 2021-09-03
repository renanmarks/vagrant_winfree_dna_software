# Create a Vagrant VM containing DNA DSD Software

This repository contains a Vagrant file and bootstrap.sh script to provision NuPack 3.2.2, Multistrand, Peppercorn Enumerator and KinDA softwares.

## Requirements

The bootstrap.sh script downloads all the software, excluding the NuPack 3.2.2 software which you must download and save it in the same directory of the Vagrant and bootstrap.sh files.

## Installation

* **Step 1**: You must install [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/docs/installation) on your system
* **Step 2**: To setup the VM, open an terminal and run the command: `vagrant up`
* **Step 3**: After the VM been installed and provisioned, to access the VM run the command: `vagrant ssh`
