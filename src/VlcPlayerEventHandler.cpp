#include "VlcPlayerEventHandler.h"

VlcPlayerEventHandler::VlcPlayerEventHandler(QObject *parent)
	: QObject(parent)
{
}

QmlVlcPlayer *VlcPlayerEventHandler::mainPlayer() const
{
	return m_mainPlayer.data();
}

void VlcPlayerEventHandler::setMainPlayer(QmlVlcPlayer *player)
{
	if (m_mainPlayer != player) {
		if (m_mainPlayer) {
			m_mainPlayer->disconnect();
		}

		m_mainPlayer = player;
		m_mainPlayer->setObjectName("Main player");
		connectToPlayer(m_mainPlayer);
		emit mainPlayerChanged(player);
	}
}

QmlVlcPlayer *VlcPlayerEventHandler::secondaryPlayer() const
{
	return m_secondaryPlayer.data();
}

void VlcPlayerEventHandler::setSecondaryPlayer(QmlVlcPlayer *player)
{
	if (m_secondaryPlayer != player) {
		if (m_secondaryPlayer) {
			m_secondaryPlayer->disconnect();
		}

		m_secondaryPlayer = player;
		m_secondaryPlayer->setObjectName("Secondary player");
		connectToPlayer(m_secondaryPlayer);
		emit secondaryPlayerChanged(player);
	}
}

void VlcPlayerEventHandler::connectToPlayer(const QPointer<QmlVlcPlayer> &player)
{
	const auto onMediaChanged = [player] {
		qDebug() << player->objectName() << "Media changed";
	};

	const auto onNothingSpecial = [player] {
		qDebug() << player->objectName() << "Nothing special";
	};

	const auto onOpening = [player] {
		qDebug() << player->objectName() << "Opening";
	};

	const auto onBuffering = [player](float p) {
		qDebug() << player->objectName() << "Buffering" << p;
	};

	const auto onPlaying = [player] {
		qDebug() << player->objectName() << "Playing";
	};

	const auto onPaused = [player] {
		qDebug() << player->objectName() << "Paused";
	};

	const auto onForward = [player] {
		qDebug() << player->objectName() << "Forward";
	};

	const auto onBackward = [player] {
		qDebug() << player->objectName() << "Backward";
	};

	const auto onEncounteredError = [player] {
		qDebug() << player->objectName() << "Encountered error";
	};

	const auto onEndReached = [player] {
		qDebug() << player->objectName() << "End reached";
	};

	const auto onStopped = [player] {
		qDebug() << player->objectName() << "Stopped";
	};

	const auto onTitleChanged = [player] {
		qDebug() << player->objectName() << "Title changed";
	};

	const auto onTimeChanged = [player](double time) {
//		qDebug() << player->objectName() << "Time changed" << time;
	};

	const auto onPositionChanged = [player](float position) {
//		qDebug() << player->objectName() << "Position changed" << position;
	};

	const auto onSeekableChanged = [player](bool seekable) {
		qDebug() << player->objectName() << "Seekable changed" << seekable;
	};

	const auto onPausableChanged = [player](bool pausable) {
		qDebug() << player->objectName() << "Pausable changed" << pausable;
	};

	const auto onLengthChanged = [player](double length) {
		qDebug() << player->objectName() << "Length changed" << length;
	};

	const auto onVolumeChanged = [player] {
		qDebug() << player->objectName() << "Volume changed" << player->get_volume();
	};

//	m_mainPlayer->get_audio()->set_track(2);

	connect(player, &QmlVlcPlayer::mediaPlayerMediaChanged, this, onMediaChanged);
	connect(player, &QmlVlcPlayer::mediaPlayerNothingSpecial, this, onNothingSpecial);
	connect(player, &QmlVlcPlayer::mediaPlayerOpening, this, onOpening);
	connect(player, &QmlVlcPlayer::mediaPlayerBuffering, this, onBuffering);
	connect(player, &QmlVlcPlayer::mediaPlayerPlaying, this, onPlaying);
	connect(player, &QmlVlcPlayer::mediaPlayerPaused, this, onPaused);
	connect(player, &QmlVlcPlayer::mediaPlayerForward, this, onForward);
	connect(player, &QmlVlcPlayer::mediaPlayerBackward, this, onBackward);
	connect(player, &QmlVlcPlayer::mediaPlayerEncounteredError, this, onEncounteredError);
	connect(player, &QmlVlcPlayer::mediaPlayerEndReached, this, onEndReached);
	connect(player, &QmlVlcPlayer::mediaPlayerStopped, this, onStopped);
	connect(player, &QmlVlcPlayer::mediaPlayerTitleChanged, this, onTitleChanged);
	connect(player, &QmlVlcPlayer::mediaPlayerTimeChanged, this, onTimeChanged);
	connect(player, &QmlVlcPlayer::mediaPlayerPositionChanged, this, onPositionChanged);
	connect(player, &QmlVlcPlayer::mediaPlayerSeekableChanged, this, onSeekableChanged);
	connect(player, &QmlVlcPlayer::mediaPlayerPausableChanged, this, onPausableChanged);
	connect(player, &QmlVlcPlayer::mediaPlayerLengthChanged, this, onLengthChanged);
	connect(player, &QmlVlcPlayer::volumeChanged, this, onVolumeChanged);
}
