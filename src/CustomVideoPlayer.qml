import QtQuick 2.0
import QtMultimedia 5.5
import QtQuick.Layouts 1.1

import QmlVlc 0.1

Item {
	id: root

	VlcPlayer {
		id: player
		mrl: "file:///D:/Projects/LanguageTrainerVideoPlayer/testData/test.avi"
	}

	VideoOutput {
		anchors.fill: root
		source: player
	}

	PlayerControls {
		anchors.fill: root
		source: player
	}
}
