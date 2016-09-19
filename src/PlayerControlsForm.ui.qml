import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Item {
	id: root

	property alias __playButton: playButton
	property alias __pauseButton: pauseButton
	property alias __stopButton: stopButton
	property alias __timeLabel: timeLabel
	property alias __timeSlider: timeSlider
	property alias __volumeSlider: volumeSlider

	width: 800
	height: 500

	ColumnLayout {
		id: columnLayout1
		anchors.fill: root

		Slider {
			id: volumeSlider
			Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
			Layout.margins: 30
			Layout.fillHeight: true
			style: SliderStyle {}
			orientation: Qt.Vertical
		}

		RowLayout {
			Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
			Layout.fillWidth: true
			spacing: 50

			Button {
				id: playButton
				style: ButtonStyle{}
				text: qsTr("Play")
			}
			Button {
				id: pauseButton
				style: ButtonStyle{}
				text: qsTr("Pause")
			}
			Button {
				id: stopButton
				style: ButtonStyle{}
				text: qsTr("Stop")
			}
		}


		RowLayout {
			Layout.margins: 30
			Label {
				id: timeLabel
				width: 50
				text: qsTr("00:00:00")
				Layout.minimumHeight: 20
				Layout.minimumWidth: 60
				Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
				horizontalAlignment: Text.AlignHCenter
				verticalAlignment: Text.AlignVCenter
			}

			Slider {
				id: timeSlider
				style: SliderStyle {}
				Layout.fillWidth: true
			}
		}

	}
}
