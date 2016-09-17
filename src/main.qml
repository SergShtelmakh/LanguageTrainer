import QtQuick 2.7
import QtQuick.Controls 2.0
import QtMultimedia 5.5

ApplicationWindow {
    id: root

    visible: true
    width: 640
    height: 480

    VideoOutput {
        anchors.fill: root
        source: player
    }

    MediaPlayer {
        id: player
        source: "D:/Projects/LanguageTrainerVideoPlayer/testDatatest.avi"
    }

    Component.onCompleted: {
        console.log(player.source)
        player.play();
    }
}
