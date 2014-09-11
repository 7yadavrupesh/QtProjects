#-------------------------------------------------
#
# Project created by QtCreator 2014-09-10T13:21:31
#
#-------------------------------------------------

QT = core network
CONFIG += console
CONFIG -= app_bundle

HEADERS += textprogressbar.h downloadmanager.h
SOURCES += main.cpp textprogressbar.cpp downloadmanager.cpp

# install
target.path = $$[QT_INSTALL_EXAMPLES]/network/downloadmanager
INSTALLS += target

OTHER_FILES += \
    debian/changelog \
    debian/compat \
    debian/control \
    debian/copyright \
    debian/README \
    debian/rules
