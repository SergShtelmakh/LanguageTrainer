import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
	id: root

	visible: true
	width: 640
	height: 480
	color: "black"

	CustomVideoPlayer {
		anchors.fill: parent
	}
}
