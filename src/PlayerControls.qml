import QtQuick 2.4
import QtMultimedia 5.5

PlayerControlsForm {
	id: root

	property MediaPlayer source

	function createTimeMark(position) {
		var seconds = Math.round(position / 1000);
		var minutes = Math.round(seconds / 60);
		var hours = Math.round(minutes / 60);
		return "%1:%2:%3".arg(hours).arg(minutes).arg(seconds)
	}

	Connections {
		target: source

		onPositionChanged: {
			__timeLabel.text = createTimeMark(source.position);
			if (!__timeSlider.pressed) {
				__timeSlider.value = source.position;
			}
		}
	}

	__playButton.onClicked: source.play()
	__pauseButton.onClicked: source.pause()
	__stopButton.onClicked: source.stop()
	__timeSlider.onValueChanged: {
		if (__timeSlider.pressed) {
			source.seek(__timeSlider.value)
		}
	}
	__volumeSlider.onValueChanged: source.volume = __volumeSlider.value

	onSourceChanged: {
		if (source) {
			__timeSlider.minimumValue = 0;
			// TODO: get correct max val
			__timeSlider.maximumValue = 1324000;
			__timeSlider.stepSize = 1;
			__timeSlider.value = 0;
			__volumeSlider.value = source.volume
		}
	}
}
