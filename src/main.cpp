#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "VlcPlayerEventHandler.h"

#include "QmlVlc.h"

int main(int argc, char *argv[])
{
	RegisterQmlVlc();

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication app(argc, argv);

	QQmlApplicationEngine engine;

	VlcPlayerEventHandler eventHandler;
	engine.rootContext()->setContextProperty("vlcPlayerEventHandler", &eventHandler);

	engine.load(QUrl(QLatin1String("qrc:/main.qml")));
	engine.load(QUrl(QLatin1String("qrc:/SettingsWindow.qml")));

	return app.exec();
}
