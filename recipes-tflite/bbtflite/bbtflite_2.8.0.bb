#
# TensorFlow Lite Cpp
#

DESCRIPTION = "TensorFlow Lite Cpp"
SECTION = "tflite"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=c7e17cca1ef4230861fb7868e96c387e"

# Compute branch info from ${PV} as Base PV...
BPV = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
DPV = "${@'.'.join(d.getVar('PV').split('.')[0:3])}"
# Since they tag off of something resembling ${PV}, use it.
SRCREV = "v${PV}"

SRC_URI = "git://github.com/tensorflow/tensorflow.git;protocol=https;tag=v${BPV};nobranch=1"

S = "${WORKDIR}/git/tensorflow/lite"

inherit cmake

DEPENDS += " unzip-native python3-native python3-numpy-native"

TUNE_CCARGS = ""

EXTRA_OECMAKE = "\
    -DCMAKE_BUILD_TYPE=Release \
    -DTFLITE_ENABLE_XNNPACK=OFF \
    -DCMAKE_SYSTEM_NAME=Linux \
    -DCMAKE_SYSTEM_PROCESSOR=aarch64 \
    -DBUILD_SHARED_LIBS=ON \
"

do_compile_append(){
    cmake --build . -j -t benchmark_model
    cmake --build . -j -t label_image
}

do_install(){
    install -d ${D}${bindir}

    install -m 755 examples/label_image/label_image ${D}${bindir}
    install -m 755 tools/benchmark/benchmark_model ${D}${bindir}
}
