import QtQuick 2.0
import QtMultimedia 5.5
import QtQuick.Layouts 1.1

import QmlVlc 0.1

Item {
	id: root

	VlcPlayer {
		id: player
		mrl: "file:///D:/Projects/LanguageTrainerVideoPlayer/testData/test.avi"
//		mrl: "http://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_480p_stereo.avi"
	}

	VideoOutput {
		id: output

		anchors.fill: root
		source: player

		PlayerControls {
			anchors.fill: parent
			source: output.source
		}
	}

	Component.onCompleted: vlcPlayerEventHandler.player = player
}
