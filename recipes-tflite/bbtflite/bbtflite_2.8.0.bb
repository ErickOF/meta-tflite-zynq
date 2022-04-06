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
    install -d ${D}/${libdir}
    install -d ${D}/usr/include/tensorflow/lite
    install -d ${D}/usr/include/tensorflow/core
    install -d ${D}/usr/include/flatbuffers

    install -m 0755 ${TF}/lite ${D}/usr/include/tensorflow
    install -m 0755 ${TF}/core ${D}/usr/include/tensorflow
    install -m 0755 ${WORKDIR}/build/flatbuffers/include/flatbuffers ${D}/usr/include

    install -m 0644 ${WORKDIR}/build/_deps/cpuinfo-build/libcpuinfo.so ${D}/${libdir}
    install -m 0644 ${WORKDIR}/build/_deps/farmhash-build/libfarmhash.so ${D}/${libdir}
    install -m 0644 ${WORKDIR}/build/_deps/fft2d-build/libfft2d_fftsg.so ${D}/${libdir}
    install -m 0644 ${WORKDIR}/build/_deps/fft2d-build/libfft2d_fftsg2d.so ${D}/${libdir}
    install -m 0644 ${WORKDIR}/build/libtensorflow-lite.so ${D}/${libdir}
}

SOLIBS = ".so"
SOLIBS += ".so.*"
FILES_SOLIBSDEV = ""

FILES_${PN} += "${libdir}"
FILES_${PN} += "/usr/include/flatbuffers"
FILES_${PN} += "/usr/include/tensorflow"
${PN}-dev += "${libdir}/*.so"

FILES_${PN}-statucdev += "/usr/include/tensorflow/lite/ios/testdata/duplicate_names/input.a"
FILES_${PN}-statucdev += "/usr/include/tensorflow/lite/ios/testdata/extended_filename/input.a"
FILES_${PN}-statucdev += "/usr/include/tensorflow/lite/ios/testdata/odd_bytes/input.a"
FILES_${PN}-statucdev += "/usr/include/tensorflow/lite/ios/testdata/simple/input.a"
FILES_${PN}-statucdev += "/usr/include/tensorflow/lite/ios/testdata/skip_same_fil/input.a"
