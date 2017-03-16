import QtQuick 2.0
import QtMultimedia 5.5
import QtQuick.Layouts 1.1

import QmlVlc 0.1

Item {
	id: root

	property var url: "file:///D:/Projects/LanguageTrainerVideoPlayer/testData/test.avi"

	VlcPlayer {
		id: mainPlayer
		mrl: root.url
//		mrl: "http://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_480p_stereo.avi"
	}

	VlcPlayer {
		id: secondaryPlayer
		mrl: root.url
//		mrl: "file:///D:/Projects/LanguageTrainerVideoPlayer/testData/test.avi"

//		mrl: "http://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_480p_stereo.avi"
	}

	VideoOutput {
		id: output

		anchors.fill: root
		source: mainPlayer

		PlayerControls {
			anchors.fill: parent
			source: output.source
		}
	}

	Component.onCompleted: {
		vlcPlayerEventHandler.mainPlayer = mainPlayer;
		vlcPlayerEventHandler.secondaryPlayer = secondaryPlayer;
	}
}
