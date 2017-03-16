cmake_minimum_required(VERSION 3.1)

project(LanguageTrainer)

set(PROJECT_VERSION "1.0")

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y")
set(CXX_STANDARD 14)

find_package(Qt5Core REQUIRED)
find_package(Qt5Gui REQUIRED)
find_package(Qt5Qml REQUIRED)

# 3rd party libs
add_subdirectory(3rdParty/qmlVlc)
include_directories(3rdParty/qmlVlc)
include_directories(3rdParty/qmlVlc/libvlc_wrapper/libvlc-sdk/include)

# libs
add_subdirectory(libs/Subtitle-lib)

#
# TODO move to subdirectory
set(source
    src/core/VlcPlayerEventHandler.cpp
    )

set(headers
    src/core/VlcPlayerEventHandler.h
    )

add_library(languageTrainerLib STATIC ${source} ${headers})
target_link_libraries(languageTrainerLib Qt5::Core Qt5::Gui Qt5::Qml subtitlesLib QmlVlc)

add_executable(LanguageTrainer src/main.cpp  src/qml.qrc)
target_link_libraries(LanguageTrainer languageTrainerLib)
