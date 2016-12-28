include( 3rdParty/qmlVlc/QmlVlc.pri )

INCLUDEPATH += 3rdParty

QT += qml quick multimedia

CONFIG += c++11

SOURCES += src/main.cpp

RESOURCES += src/qml.qrc

DEFINES += QMLVLC_QTMULTIMEDIA_ENABLE

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = 3rdParty

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
