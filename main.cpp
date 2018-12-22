#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "QmlSortFilterProxyModel.h"
#include <QQmlContext>
#include <QtQml>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QQmlApplicationEngine engine;
    qmlRegisterType<CQmlSortFilterProxyModel>("MUM_Models",0,1,"SortFilterProxyModel");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    engine.setOfflineStoragePath("D:\Qt-FeeManagement");
    qDebug() << engine.offlineStoragePath();
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}
