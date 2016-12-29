#pragma once

#include <QObject>

#include <3rdParty/qmlVlc/QmlVlcPlayer.h>

class VlcPlayerEventHandler : public QObject
{
	Q_PROPERTY(QmlVlcPlayer * player READ player WRITE setPlayer NOTIFY playerChanged)

	Q_OBJECT
public:
	explicit VlcPlayerEventHandler(QObject *parent = 0);

	QmlVlcPlayer *player() const;
	void setPlayer(QmlVlcPlayer *player);

signals:
	void playerChanged(QmlVlcPlayer *);

private:
	void connetToPlayer();

	QPointer<QmlVlcPlayer> m_player;

	QList<QMetaObject::Connection> m_playerConnections;
};
