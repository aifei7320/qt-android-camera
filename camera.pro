##############################################
## App Configuration
##############################################

TEMPLATE    = app
VERSION     = 0.0.1



##############################################
## Build Configuration
##############################################

CONFIG += c++11

## Including OpenCV dependencies
android {
    OPENCV_ROOT = $(ANDROID_OPENCV)
    isEmpty(OPENCV_ROOT){
        warning("The ANDROID_OPENCV should be set with the OpenCV SDK folder.")
    } else {
        message("OpenCV SDK folder: $$OPENCV_ROOT")

        INCLUDEPATH += $$OPENCV_ROOT/sdk/native/jni/include

        OPENCV_LIB_PATH = $$OPENCV_ROOT/sdk/native/libs/armeabi-v7a

        LIBS        += $$OPENCV_LIB_PATH/libopencv_imgproc.a
        LIBS        += $$OPENCV_LIB_PATH/libopencv_core.a
        LIBS        += $$OPENCV_LIB_PATH/libopencv_imgcodecs.a
        LIBS        += $$OPENCV_ROOT/sdk/native/3rdparty/libs/armeabi-v7a/libtbb.a
        LIBS        += -lz -lm
    }
} else {
    CONFIG += link_pkgconfig
    PKGCONFIG += opencv
}




##############################################
## Dependencies
##############################################

QT += core qml quick multimedia

INCLUDEPATH += include

##############################################
## Code
##############################################

SOURCES += main.cpp \
    src/FilterTest.cpp

HEADERS += \
    include/FilterTest.h

RESOURCES += qml.qrc
