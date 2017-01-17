#include "VlcPlayerEventHandler.h"

VlcPlayerEventHandler::VlcPlayerEventHandler(QObject *parent)
	: QObject(parent)
{
}

QmlVlcPlayer *VlcPlayerEventHandler::player() const
{
	return m_player.data();
}

void VlcPlayerEventHandler::setPlayer(QmlVlcPlayer *player)
{
	if (m_player != player) {
		m_player = player;
		emit playerChanged(player);

		connetToPlayer();
	}
}

void VlcPlayerEventHandler::connetToPlayer()
{
	const auto onMediaChanged = [] {
		qDebug() << "Media changed";
	};

	const auto onNothingSpecial = [] {
		qDebug() << "Nothing special";
	};

	const auto onOpening = [] {
		qDebug() << "Opening";
	};

	const auto onBuffering = [](float p) {
		qDebug() << "Buffering" << p;
	};

	const auto onPlaying = [] {
		qDebug() << "Playing";
	};

	const auto onPaused = [] {
		qDebug() << "Paused";
	};

	const auto onForward = [] {
		qDebug() << "Forward";
	};

	const auto onBackward = [] {
		qDebug() << "Backward";
	};

	const auto onEncounteredError = [] {
		qDebug() << "Encountered error";
	};

	const auto onEndReached = [] {
		qDebug() << "End reached";
	};

	const auto onStopped = [] {
		qDebug() << "Stopped";
	};

	const auto onTitleChanged = [] {
		qDebug() << "Title changed";
	};

	const auto onTimeChanged = [](double time) {
//		qDebug() << "Time changed" << time;
	};

	const auto onPositionChanged = [](float position) {
//		qDebug() << "Position changed" << position;
	};

	const auto onSeekableChanged = [](bool seekable) {
		qDebug() << "Seekable changed" << seekable;
	};

	const auto onPausableChanged = [](bool pausable) {
		qDebug() << "Pausable changed" << pausable;
	};

	const auto onLengthChanged = [](double length) {
		qDebug() << "Length changed" << length;
	};

	const auto onVolumeChanged = [this] {
		qDebug() << "Volume changed" << m_player->get_volume();
	};

	for (const auto &con : m_playerConnections) {
		disconnect(con);
	}
	m_playerConnections.clear();

	if (m_player.isNull()) {
		return;
	}

	m_playerConnections
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerMediaChanged, this, onMediaChanged)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerNothingSpecial, this, onNothingSpecial)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerOpening, this, onOpening)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerBuffering, this, onBuffering)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerPlaying, this, onPlaying)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerPaused, this, onPaused)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerForward, this, onForward)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerBackward, this, onBackward)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerEncounteredError, this, onEncounteredError)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerEndReached, this, onEndReached)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerStopped, this, onStopped)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerTitleChanged, this, onTitleChanged)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerTimeChanged, this, onTimeChanged)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerPositionChanged, this, onPositionChanged)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerSeekableChanged, this, onSeekableChanged)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerPausableChanged, this, onPausableChanged)
			<< connect(m_player, &QmlVlcPlayer::mediaPlayerLengthChanged, this, onLengthChanged)
			<< connect(m_player, &QmlVlcPlayer::volumeChanged, this, onVolumeChanged);
}
