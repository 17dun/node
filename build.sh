#! /bin/sh
#openwise install 
#script name : build.sh

SELF_NAME="build.sh"
VERSION="1.0.0.0"
BUG_FIX=0
FILE_NAME="node-tcwise"
#BUILD_NAME="${FILE_NAME}_${VERSION}.tar.gz"
BUILD_NAME="${FILE_NAME}.tar.gz"
CURR_DIR=`pwd`
DEST_DIR="${FILE_NAME}_${VERSION}"
TMP_BUILD_NAME="${BUILD_NAME}.tmp"	
echo "start building ......"
rm -f $TMP_BUILD_NAME
rm -f $BUILD_NAME
rm -rf $DEST_DIR
tar czf $BUILD_NAME \
--exclude */.svn \
--exclude tmp \
--exclude build.sh \
--exclude .svn  *
if [ $? -ne 0 ]
then 
	echo "building failed!create tmp tar file error!"
	exit 1
fi
#rm -rf mis
#mkdir $DEST_DIR
#if [ $? -ne 0 ]
#then
#	echo "building failed!create tmp directory  error!"
#	exit 2
#fi
#tar xzf $TMP_BUILD_NAME -C  $DEST_DIR
#if [ $? -ne 0 ]
#then 
#	echo "building failed!extract files to $DEST_DIR error!"
#	exit 3
#fi
#rm -f $TMP_BUILD_NAME
#rm -f $BUILD_NAME
#tar czf $BUILD_NAME $DEST_DIR
#if [ $? -ne 0 ]
#then 
#	echo "building failed!create tar file $BUILD_NAME error!"
#	exit 4
#fi
#rm -rf $DEST_DIR

mkdir output/
mv $BUILD_NAME output

echo "$BUILD_NAME has been created at current dir $CURR_DIR !"
echo "build succeed!"
exit 0
	
