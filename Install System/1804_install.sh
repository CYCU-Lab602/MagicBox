#!/bin/bash 

# 2021.01.19 version final
# ubuntu opencv install bash
# by Show & Wei-Yao & Kai & LeeHao

# work for ubuntu 18.04
#	   cuda 10.2
#	   cudnn 8.0.4
   
declare -A cudnnDownloadlink=( 	["7.3.0_10.0"]="1FnAuVQKB07bOco0eHxoitNrutbV9b9Hq" ["7.3.1_10.0"]="10fA5He6jvtGrBWdcqmxu3S0yEsQfThP9" ["7.4.1_10.0"]="1BIGMG26ORYwfa_IzePDRZ5Gk0yocHW6T" 
                            	["7.4.2_10.0"]="13PUVDQNmWEFNL_4sxBZgCnNHGneS4caL" ["7.5.0_10.0"]="1SRKy7ApsD8Nx3UMfcahnKhGj055Qn9TK" ["7.5.0_10.1"]="1nX6k7i5ecmUBmQFb8Slqpghsr1Z5u3OK"                                  
							   	["7.5.1_10.0"]="1UjNE8r9XfMjC8QsRFmPllLqB7p1RKyi5" ["7.5.1_10.1"]="1e6ZEvFO3fvdo4-ZXBhTlk6S8XylDfdhU" ["7.6.0_10.0"]="1SptXee8rQnbYIw0TI26gJjaiGBvB4oLL"
                              	["7.6.0_10.1"]="1a-XVMBfgg7IZiR0MufOdVnePqvjLZWVJ" ["7.6.1_10.0"]="1puCmYXJV2VrsE3jqFUq0o682AHXdHukY" ["7.6.1_10.1"]="1R55qJ7XWzFlpgk03Z6no183p_XN_MLtB"
							  	["7.6.2_10.0"]="1AAwwPxHaoKfPinD1S2JeknIHj4F_Vmi6" ["7.6.2_10.1"]="1iAi90KT95Ad5yQUYkUNk3aPB_IFaoYEW" ["7.6.3_10.0"]="17H1uNdItUFD-i6ReASpX_IqM-7AIHbLh"
                              	["7.6.3_10.1"]="1WGofH9TnE3haJOUAGgVTDC5Ms1NzPho-" ["7.6.4_10.0"]="1j1Bwn2qp_gqyzHIs0m3F4xzxpT6vfwaQ" ["7.6.4_10.1"]="19GFuYgj8ty1Vq1Ex-LTZVWKficKAGCKL"
								["7.6.5_10.0"]="1oUOQQKZfg9ZGfEMe4ZUbeQ90WZO1-lqe" ["7.6.5_10.1"]="1dP2jlSAhzOWt_FKY8tfzN9NPAsXY0ylp" ["7.6.5_10.2"]="1EMbHQ-fnvdnZd4hKmMFhD5mu34kjiUnd" 
                              	["8.0.2_10.1"]="1nrTMjzmqDsK9BDwl8w9zkwlfpRn2wpeB" ["8.0.2_10.2"]="1MZLkYGSFwK6XBqhxt3Y2b9753-qmmw5s" ["8.0.4_10.2"]="1KR7YEsdx_Ha1p3CvPvr8PbNFRcBNKeDB")






read -p "-- Please enter the CUDA version(10.2) : " version
read -p "-- Please enter the CUDNN version(8.0.4) : " cudnnVersion
while [ true ] 
do
	if [ "${cudnnDownloadlink["$cudnnVersion"_"$version"]}" != "" ] ; then
		break
	else
		read -p "-- No match version please enter correct CUDNN version(7.3.0 ~ 8.0.2) : " cudnnVersion
	fi
done

read -p "-- Please enter the opencv version : " openVersion

if [ "$version" = "10.0" ] ; then
#**********************************************************
#*********************Cuda10.0 install*********************
#**********************************************************


elif [ "$version" = "10.1" ] ; then
#**********************************************************
#*********************Cuda10.1 install*********************
#**********************************************************


elif [ "$version" = "10.2" ] ; then
#**********************************************************
#*********************Cuda10.2 install*********************
#**********************************************************
	wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
	mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
	wget https://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
	dpkg -i cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
	apt-key add /var/cuda-repo-10-2-local-10.2.89-440.33.01/7fa2af80.pub
	apt-get update
	apt-get -y install cuda
	echo "export PATH=/usr/local/cuda-10.0/bin:\$PATH" | tee -a ~/.bashrc
	echo "export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:\$LD_LIBRARY_PATH" | tee -a ~/.bashrc
	source ~/.bashrc
fi


#******************************************************
#*********************Cudnn intall*********************
#******************************************************

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id="${cudnnDownloadlink["$cudnnVersion"_"$version"]}"" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id="${cudnnDownloadlink["$cudnnVersion"_"$version"]}"" -O "Cudnn"$cudnnVersion"_cuda"$version"" && rm -rf /tmp/cookies.txt

unzip "Cudnn"$cudnnVersion"_cuda"$version""
chmod +x ""$cudnnVersion"+cuda"$version".deb"
chmod +x "dev_"$cudnnVersion"+cuda"$version".deb"
chmod +x "doc_"$cudnnVersion"+cuda"$version".deb"
dpkg -i ""$cudnnVersion"+cuda"$version".deb"
dpkg -i "dev_"$cudnnVersion"+cuda"$version".deb"
dpkg -i "doc_"$cudnnVersion"+cuda"$version".deb"

rm "Cudnn"$cudnnVersion"_cuda"$version""
rm ""$cudnnVersion"+cuda"$version".deb"
rm "dev_"$cudnnVersion"+cuda"$version".deb"
rm "doc_"$cudnnVersion"+cuda"$version".deb"
rm cuda-repo*

# ********************************************************
# *********************install opencv*********************
# ********************************************************

# First of all install update and upgrade your system
apt-get update -y
apt-get upgrade -y

# Generic tools
apt-get install -y build-essential cmake pkg-config unzip yasm git checkinstall

# Image I/O libs
apt-get install -y libjpeg-dev libpng-dev libtiff-dev

# Video/Audio Libs - FFMPEG, GSTREAMER, x264 and so on.
apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libavresample-dev
apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
apt-get install -y libxvidcore-dev x264 libx264-dev libfaac-dev libmp3lame-dev libtheora-dev libvorbis-dev

# OpenCore - Adaptive Multi Rate Narrow Band (AMRNB) and Wide Band (AMRWB) speech codec
apt-get install -y libopencore-amrnb-dev libopencore-amrwb-dev

# GTK lib for the graphical user functionalites coming from OpenCV highghui module
apt-get install -y libgtk-3-dev

# Python libraries for python3
apt-get install -y python3-dev python3-pip python3-numpy
apt install -y python3-testresources

# Parallelism library C++ for CPU
apt-get install -y libtbb-dev

# Optimization libraries for OpenCV
apt-get install -y libatlas-base-dev gfortran

# Optional libraries
apt-get install -y libprotobuf-dev protobuf-compiler
apt-get install -y libgoogle-glog-dev libgflags-dev
apt-get install -y libgphoto2-dev libeigen3-dev libhdf5-dev doxygen


wget -O opencv_${openVersion}.zip https://github.com/opencv/opencv/archive/${openVersion}.zip
wget -O opencv_contrib_${openVersion}.zip https://github.com/opencv/opencv_contrib/archive/${openVersion}.zip
unzip opencv_${openVersion}.zip
unzip opencv_contrib_${openVersion}.zip
rm opencv_${openVersion}.zip
rm opencv_contrib_${openVersion}.zip
cd opencv-${openVersion}
mkdir build
cd build
cmake   -D CMAKE_BUILD_TYPE=RELEASE \
		-D OPENCV_GENERATE_PKGCONFIG=ON \
		-D CMAKE_C_COMPILER=/usr/bin/gcc-6 \
		-D CMAKE_INSTALL_PREFIX=/usr/local \
		-D INSTALL_PYTHON_EXAMPLES=ON \
		-D INSTALL_C_EXAMPLES=OFF \
		-D WITH_TBB=ON \
		-D WITH_CUDA=ON \
		-D BUILD_opencv_cudacodec=OFF \
		-D ENABLE_FAST_MATH=1 \
		-D CUDA_FAST_MATH=1 \
		-D WITH_CUBLAS=1 \
		-D WITH_V4L=ON \
		-D WITH_QT=OFF \
		-D WITH_OPENGL=ON \
		-D WITH_GSTREAMER=ON \
		-D OPENCV_PC_FILE_NAME=opencv.pc
		-D OPENCV_ENABLE_NONFREE=ON \
		-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-${openVersion}/modules \
		-D WITH_CUDNN=ON \
		-D OPENCV_DNN_CUDA=ON \
		-D CUDA_ARCH_BIN=7.5 \
		..

make -j$(nproc)
make install
echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf
ldconfig
echo "PKG_CONFIG_PATH=\$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig" | sudo tee -a /etc/bash.bashrc
echo "export PKG_CONFIG_PATH" | sudo tee -a /etc/bash.bashrc
source /etc/bash.bashrc
pkg-config opencv --modversion

# reboot

