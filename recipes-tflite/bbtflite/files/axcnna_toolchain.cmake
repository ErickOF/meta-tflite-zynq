#
#  Copyright (C) 2022.
#  Approximate Neural Network Accelerator Driver Recipe
#  Author:
#    - Erick A. Obregon Fonseca <erickof@estudiantec.cr>
#  Supervisor:
#    - Luis G. Leon Vega <lleon95@estudiantec.cr>
#

# Cross compilation settings
SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_PROCESSOR armv7)
SET(CMAKE_C_COMPILER arm-xilinx-linux-gnueabi-gcc)
SET(CMAKE_CXX_COMPILER arm-xilinx-linux-gnueabi-g++)
SET(CMAKE_C_COMPILER_LAUNCHER)
SET(CMAKE_CXX_COMPILER_LAUNCHER)
SET(CMAKE_ASM_COMPILER arm-xilinx-linux-gnueabi-gcc)
SET(CMAKE_AR arm-xilinx-linux-gnueabi-gcc-ar CACHE FILEPATH "Archiver")
SET(CMAKE_C_FLAGS " -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0=/usr/src/debug/bbtflite/2.8.0-r0                      -fdebug-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0=/usr/src/debug/bbtflite/2.8.0-r0                      -fdebug-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot=                      -fdebug-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot-native=   -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot" CACHE STRING "CFLAGS")
SET(CMAKE_CXX_FLAGS " -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0=/usr/src/debug/bbtflite/2.8.0-r0                      -fdebug-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0=/usr/src/debug/bbtflite/2.8.0-r0                      -fdebug-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot=                      -fdebug-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot" CACHE STRING "CXXFLAGS")
SET(CMAKE_ASM_FLAGS " -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0=/usr/src/debug/bbtflite/2.8.0-r0                      -fdebug-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0=/usr/src/debug/bbtflite/2.8.0-r0                      -fdebug-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot=                      -fdebug-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot-native=   -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot" CACHE STRING "ASM FLAGS")
SET(CMAKE_C_FLAGS_RELEASE "-DNDEBUG" CACHE STRING "Additional CFLAGS for release")
SET(CMAKE_CXX_FLAGS_RELEASE "-DNDEBUG" CACHE STRING "Additional CXXFLAGS for release")
SET(CMAKE_ASM_FLAGS_RELEASE "-DNDEBUG" CACHE STRING "Additional ASM FLAGS for release")
SET(CMAKE_C_LINK_FLAGS " -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now" CACHE STRING "LDFLAGS")
SET(CMAKE_CXX_LINK_FLAGS " -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0=/usr/src/debug/bbtflite/2.8.0-r0                      -fdebug-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0=/usr/src/debug/bbtflite/2.8.0-r0                      -fdebug-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot=                      -fdebug-prefix-map=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now" CACHE STRING "LDFLAGS")

# Only search in the paths provided
# CMAKE doesnt pick up libraries and tools from the native build machine
SET(CMAKE_FIND_ROOT_PATH <path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot <path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot-native <path/to/img>/build/tmp/hosttools)
SET(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
SET(CMAKE_PROGRAM_PATH "/")

# Use qt.conf settings
SET( ENV{QT_CONF_PATH} <path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/qt.conf )

# Set the rpath to the correct directory as CMAKE does not provide any
# directory as rpath by default
SET(CMAKE_INSTALL_RPATH )

# Use RPATHs relative to build directory for reproducibility
SET(CMAKE_BUILD_RPATH_USE_ORIGIN ON)

# Use our cmake modules
LIST(APPEND CMAKE_MODULE_PATH "<path/to/img>/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/bbtflite/2.8.0-r0/recipe-sysroot/usr/share/cmake/Modules/")

# Add for non /usr/lib libdir, e.g. /usr/lib64
SET(CMAKE_LIBRARY_PATH /usr/lib /lib)

# Add include dir to implicit includes in case it differs from /usr/include
LIST(APPEND CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES /usr/include)
LIST(APPEND CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES /usr/include)
