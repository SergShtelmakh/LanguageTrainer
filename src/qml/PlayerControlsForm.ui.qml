import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Item {
	id: root

	property alias playButton: playButton
	property alias pauseButton: pauseButton
	property alias stopButton: stopButton

	property alias timeLabel: timeLabel
	property alias timeSlider: timeSlider
	property alias volumeSlider: volumeSlider

	width: 800
	height: 500

	ColumnLayout {
		id: columnLayout

		anchors.fill: root

		Slider {
			id: volumeSlider
			Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
			Layout.margins: 30
			Layout.fillHeight: true
			maximumValue: 100
			minimumValue: 0
			style: SliderStyle {}
			orientation: Qt.Vertical
		}

		RowLayout {
			transformOrigin: Item.Center
			Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
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
				color: "white"
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
