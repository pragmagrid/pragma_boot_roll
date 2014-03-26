#!/bin/bash
#
#
#
#


. /opt/rocks/share/devel/src/roll/etc/bootstrap-functions.sh 

function fatal_error(){
	echo Error boostrapping: $1
	exit 1
}

base_dir=`pwd`

dir=`mktemp -d`
cd $dir
yumdownloader --resolve --enablerepo base,update python-setuptools || \
			fatal_error "unable to download python-setup"


rpm -Uvh *.rpm || fatal_error "unable to install python-setup"
cd -

# let's add the RPM to the current roll
mkdir -p RPMS/x86_64/
cp $dir/*.rpm RPMS/x86_64/
#rm -rf $dir

