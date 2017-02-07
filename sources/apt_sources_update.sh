#! /bin/bash

# The set -e option instructs bash to immediately exit
# if any command has a non-zero exit status
set -e

ubuntu_codename=`lsb_release -c`
file_name="sources.list"
#absolute path
file_dir_path="/etc/apt"

file_path="${file_dir_path}/${file_name}"
bak_file_time=`date --date='0 days ago' +"%Y%m%d"`
bak_file_name="${file_name}.bak_${bak_file_time}"
bak_file_path="${file_dir_path}/${bak_file_name}"

if [[ ${ubuntu_codename} =~ "trusty" ]]; then
	echo -e "will update the ${file_path} for trusty(ubuntu 14.04)"
	if [ -f "${file_path}" ]; then
		mv ${file_path} ${bak_file_path}
	fi
	echo -e "backup the old sources.list file to ${bak_file_path}"
	cd ${file_dir_path}
	wget -O ${file_name} http://ojarf7dqy.bkt.clouddn.com/sources.list.14
	cd -
elif  [[ ${ubuntu_codename} =~ "xenial" ]]; then
	echo -e "will update the ${file_path} for xenial(ubuntu 16.04)"
	if [ -f "${file_path}" ]; then
		mv ${file_path} ${bak_file_path}
	fi
	mv ${file_path} ${bak_file_path}
	echo -e "backup the old sources.list file to ${bak_file_path}"
	cd ${file_dir_path}
	wget -O ${file_name} http://ojarf7dqy.bkt.clouddn.com/sources.list.16
	cd -
else
	echo -e "only support trusty(ubuntu 14.04) and xenial(ubuntu 16.04)"
fi
exit 0
