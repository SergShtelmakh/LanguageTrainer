import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.0

ApplicationWindow {
	id: root

	visible: true
	width: 500
	height: 600

	Button {
		id: openFileDialog

		text: qsTr("Open subtitles")

		onClicked: fileDialog.open()
	}

	FileDialog {
		id: fileDialog

		title: "Please choose a file"
		onAccepted: {
			vlcPlayerEventHandler.loadSubtitles(fileUrl);
		}
	}
}
