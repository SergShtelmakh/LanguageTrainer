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

	PlayerControls {
		id: controls

		anchors.bottom: root.bottom
		anchors.left: root.left
		anchors.right: root.right

		source: player
	}
}
