import QtQuick 2.0
import QtMultimedia 5.5

Item {
	id: root

	MediaPlayer {
		id: player
		source: "D:/Projects/LanguageTrainerVideoPlayer/testData/test.avi"
	}

	VideoOutput {
		anchors.fill: root
		source: player
	}

	MouseArea{
		id: mouse
		anchors.fill: root
		onClicked: {
			if (player.playbackState != MediaPlayer.PlayingState) {
				player.play();
			} else {
				player.pause();
			}
		}
	}
}
