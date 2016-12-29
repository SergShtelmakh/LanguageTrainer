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
		__timeLabel.text = "%1:%2:%3".arg(hours).arg(minutes).arg(seconds);
	}

	function updateControlsTimeSlider() {
		if (!__timeSlider.pressed) {
			__timeSlider.value = source.position;
		}
	}

	function updateSourcePosition() {
		if (__timeSlider.pressed) {
			source.position = __timeSlider.value;
		}
	}

	function updateSourceVolume() {
		source.volume = __volumeSlider.value;
	}


	Connections {
		target: source

		onPositionChanged: {
			updateControlsTimeLabel();
			updateControlsTimeSlider();
		}
	}

	__playButton.onClicked: source.play()
	__pauseButton.onClicked: source.pause()
	__stopButton.onClicked: source.stop()
	__timeSlider.onValueChanged: updateSourcePosition()
	__volumeSlider.onValueChanged: updateSourceVolume()

	onSourceChanged: {
		if (source) {
			__timeSlider.value = source.position
			__volumeSlider.value = source.volume
		}
	}
}
