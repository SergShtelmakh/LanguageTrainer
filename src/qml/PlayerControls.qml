import QtQuick 2.4
import QtMultimedia 5.5

import QmlVlc 0.1

PlayerControlsForm {
	id: root

	property VlcPlayer source

	function updateControlsTimeLabel() {
		var seconds = Math.round(source.time / 1000);
		var minutes = Math.round(seconds / 60);
		var hours = Math.round(minutes / 60);
		timeLabel.text = "%1:%2:%3".arg(hours).arg(minutes).arg(seconds);
	}

	function updateControlsTimeSlider() {
		if (!timeSlider.pressed) {
			timeSlider.value = source.position;
		}
	}

	function updateSourcePosition() {
		if (timeSlider.pressed) {
			source.position = timeSlider.value;
		}
	}

	function updateSourceVolume() {
		source.volume = volumeSlider.value;
	}


	Connections {
		target: source

		onPositionChanged: {
			updateControlsTimeLabel();
			updateControlsTimeSlider();
		}
	}

	playButton.onClicked: source.play()
	pauseButton.onClicked: source.pause()
	stopButton.onClicked: source.stop()
	timeSlider.onValueChanged: updateSourcePosition()
	volumeSlider.onValueChanged: updateSourceVolume()

	onSourceChanged: {
		if (source) {
			timeSlider.value = source.position;
			volumeSlider.value = source.volume;
		}
	}
}
