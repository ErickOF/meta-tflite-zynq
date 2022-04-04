#
# TensorFlow Lite Cpp
#

DESCRIPTION = "TensorFlow Lite Cpp"
SECTION = "tflite"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

# Compute branch info from ${PV} as Base PV...
BPV = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
DPV = "${@'.'.join(d.getVar('PV').split('.')[0:3])}"
# Since they tag off of something resembling ${PV}, use it.
SRCREV = "v${PV}"

SRC_URI = " \
    git://github.com/ErickOF/tensorflow.git;protocol=https;tag=v${PV};nobranch=1 \
    file://axcnna_toolchain.cmake \
    "

S = "${WORKDIR}/git/tensorflow/lite"
TF = "${WORKDIR}/git/tensorflow"

inherit pkgconfig cmake

DEPENDS += " unzip-native python3-native python3-numpy-native"

EXTRA_OECMAKE = " \
    -DCMAKE_CXX_FLAGS_ALL_WARNINGS:STRING='-Wno-psabi' \
    -DCMAKE_BUILD_TYPE=Release \
    -DTFLITE_ENABLE_XNNPACK=OFF \
    -DCMAKE_SYSTEM_NAME=Linux \
    -DCMAKE_SYSTEM_PROCESSOR=armv7 \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/axcnna-toolchain.cmake \
"

RDEPENDS_${PN} += "bash"
RDEPENDS_${PN} += "make"

do_install() {
    install -d ${D}/home/root/lib
    install -d ${D}/home/root/tensorflow/lite
    install -d ${D}/home/root/tensorflow/core
    install -d ${D}/home/root/flatbuffers

    cp -r ${TF}/lite ${D}/home/root/tensorflow
    cp -r ${TF}/core ${D}/home/root/tensorflow
    cp -r ${WORKDIR}/build/flatbuffers/include/flatbuffers ${D}/home/root

    install -m 755 ${WORKDIR}/build/_deps/cpuinfo-build/libcpuinfo.so ${D}${libdir}
    install -m 755 ${WORKDIR}/build/_deps/farmhash-build/libfarmhash.so ${D}/home/root/lib
    install -m 755 ${WORKDIR}/build/_deps/fft2d-build/libfft2d_fftsg.so ${D}/home/root/lib
    install -m 755 ${WORKDIR}/build/_deps/fft2d-build/libfft2d_fftsg2d.so ${D}/home/root/lib
    install -m 755 ${WORKDIR}/build/libtensorflow-lite.so ${D}/home/root/lib
}

SOLIBS = ".so"
SOLIBS += ".so.*"
FILES_SOLIBSDEV = ""

FILES_${PN} += "/home/root/lib"
FILES_${PN} += "/home/root/flatbuffers"
FILES_${PN} += "/home/root/tensorflow"
${PN}-dev += "/home/root/lib/*.so"

FILES_${PN}-statucdev += "/home/root/tensorflow/lite/ios/testdata/duplicate_names/input.a"
FILES_${PN}-statucdev += "/home/root/tensorflow/lite/ios/testdata/extended_filename/input.a"
FILES_${PN}-statucdev += "/home/root/tensorflow/lite/ios/testdata/odd_bytes/input.a"
FILES_${PN}-statucdev += "/home/root/tensorflow/lite/ios/testdata/simple/input.a"
FILES_${PN}-statucdev += "/home/root/tensorflow/lite/ios/testdata/skip_same_fil/input.a"
