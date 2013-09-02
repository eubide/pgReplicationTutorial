pgReplicationTutorial
=====================

This repository contains files for the PostgreSQL Binary
Replication tutorial.

These files are required to perform the hands-on exercises.
Importantly, there is significant setup required in order to
do the hands-on exercises which needs to happen _before_ the
tutorial starts, so please read the below.

**All steps through Vagrant Up should be completed before
getting to the tutorial**

Requirements
=============

Laptop Harware:

* running Linux, OSX, or Windows XP or later
* 64-bit (32-bit may be possible, see below)
* at least 1GB of RAM, 2GB or more preferred
* 300MB free disk space

Software and Wetware:

* terminal program capable of ssh
* familiarity with the bash/linux command line
* familiarity with one or more command-line text editors
* vagrant and virtualbox (see below)

Installing Vagrant and VirtualBox
=================================

Go to http://www.vagrantup.com/

The Vagrant website has download packages, instructions
on how to install and configure vagrant on various OSes, and
a "getting started" guide.  Please install and configure
vagrant _right away_; this will take around an hour.

You will also need VirtualBox. The [Vagrant website has
instructions on installing VirtualBox as
well](http://docs.vagrantup.com/v2/virtualbox/index.html)

Note that you need to have vagrant 1.2.5 or later, so you may
need to upgrade even if you already had Vagrant installed.
If you use an earlier version of vagrant, "vagrant up" will
hang after it finishes provisioning.

Installing Tutorial Exercises
=============================

Install the tutorial exercises on your machine one of two
ways:

**Preferred Method**: Git Checkout from the Github repo. The
repository is here: https://github.com/jberkus/pgReplicationTutorial,
and you can clone it by:

    git clone https://github.com/jberkus/pgReplicationTutorial.git

**Alternate Method**: if you're not comfortable with git, download
the tarball from:

    https://dl.dropboxusercontent.com/u/5132935/pgReplication.tgz

This will require the programs "tar" and "gzip" to expand, as follows:

    tar -p -xvf pgReplication.tgz

We apologize for not providing a "zip" formatted archive, but zip does not
preserve file permissions, which would cause issues.

The ReplicationTutorial directory should be placed somewhere
you have disk space available.

Vagrant Up
==========

The first time you do vagrant up, it will require an internet connection
with significant bandwidth and around 1/2 hour.  As such, you should do
it at home, before you get to the conference or the tutorial.

Open your terminal program. Navigate to pgReplicationTutorial/vagrant
directory. Type the following:

    vagrant up

This will download the "precise64" box (VM), install a bunch of software on
it, and start it up.  Verify that you can log into it with:

    vagrant ssh

Now log out with "exit".  Shut down the VM, but leave it set up in preparation
for the tutorial:

    vagrant suspend

32-Bit Machines
===============

The exercises have not been tested on a 32-bit VM.  However, it's quite possible
that they will work that way.  The way to switch to 32-bit is:

1. open the file "VagrantFile" in a text editor
2. change every instance of "precise64" to "precise32"
3. save
4. run "vagrant up"

If it does not work on a 32-bit machine, please contact josh@pgexperts.com.

Other Files In This Package
===========================

The pgReplicationTutorial package also contains the following files
in the Tutorial directory:

exercises.txt
-------------

This is a set of commands which you will be running during the hands-on
exercises for the tutorial.  These are provided in a text file so that
you can copy & paste, instead of trying to read every letter and dash
from the instructor's screen.

pgReplicationTutorial.odt/pdf
-----------------------------

These are copies of the slides for the tutorial.

interactives.txt
----------------

These are script "notes" for interactive exercises to be done with 
participants on stage to demonstrate various replication concepts as
metaphor.  Right now, these notes are not that understandable on their
own.

The interactions require a deck of playing cards, three ropes, 
and two hats

License
=======

The pgReplicationTutorial is Copyright 2013 Josh Berkus
and PostgreSQL Experts Inc.

All slides, text, instructions and similar content in this tutorial are
licensed [Creative Commons Attribution-ShareAlike 3.0]
(http://creativecommons.org/licenses/by-sa/3.0/us/)

Code exercises and sample databases are licensed under the
[Gnu Public License Version 2]
(http://www.gnu.org/licenses/gpl-2.0.html)

All other rights reserved.
