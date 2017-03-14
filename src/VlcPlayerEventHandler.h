#pragma once

#include <QObject>

#include "QmlVlcPlayer.h"

class VlcPlayerEventHandler : public QObject
{
	Q_PROPERTY(QmlVlcPlayer * mainPlayer READ mainPlayer WRITE setMainPlayer NOTIFY mainPlayerChanged)
	Q_PROPERTY(QmlVlcPlayer * secondaryPlayer READ secondaryPlayer WRITE setSecondaryPlayer NOTIFY secondaryPlayerChanged)

	Q_OBJECT
public:
	explicit VlcPlayerEventHandler(QObject *parent = 0);

	QmlVlcPlayer *mainPlayer() const;
	void setMainPlayer(QmlVlcPlayer *mainPlayer);

	QmlVlcPlayer *secondaryPlayer() const;
	void setSecondaryPlayer(QmlVlcPlayer *secondaryPlayer);

public slots:
	void loadSubtitles(const QUrl &url);

signals:
	void mainPlayerChanged(QmlVlcPlayer *);
	void secondaryPlayerChanged(QmlVlcPlayer *);

private:
	void connectToPlayer(const QPointer<QmlVlcPlayer> &player);

	QPointer<QmlVlcPlayer> m_mainPlayer;
	QPointer<QmlVlcPlayer> m_secondaryPlayer;

	QList<QMetaObject::Connection> m_playerConnections;
};
