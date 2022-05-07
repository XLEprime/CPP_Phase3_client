/**
 * @file client.cpp
 * @author Haolin Yang
 * @brief 客户端类的实现
 * @version 0.1
 * @date 2022-05-06
 *
 * @copyright Copyright (c) 2022
 *
 */

#include "client.h"

#include <QJsonDocument>
#include <QNetworkDatagram>

QJsonObject Client::sendMessage(const QJsonObject &msg)
{
    QJsonObject ret;
    qDebug() << QByteArray(QJsonDocument(msg).toJson(QJsonDocument::Compact));
    if (socket.writeDatagram(QByteArray(QJsonDocument(msg).toJson(QJsonDocument::Compact)), QHostAddress::LocalHost, port) == -1)
    {
        ret.insert("status", false);
        ret.insert("payload", "UDP socket错误");
        return ret;
    }
    socket.waitForReadyRead();
    QNetworkDatagram datagram = socket.receiveDatagram();
    qDebug() << QJsonDocument::fromJson(datagram.data()).object();
    return QJsonDocument::fromJson(datagram.data()).object();
}

QJsonObject Client::loginReq(const QJsonObject &payload)
{
    QJsonObject req;
    req.insert("type", login);
    req.insert("payload", payload);
    QJsonObject ret = sendMessage(req);
    if (ret["status"].toBool() == true)
    {
        token = ret["payload"].toString();
        ret.remove("token");
    }
    return ret;
}

void Client::logoutReq()
{
    QJsonObject payload;
    payload.insert("token", token);
    QJsonObject req;
    req.insert("type", logout);
    req.insert("payload", payload);
    sendMessage(req);
    token = "";
}

QJsonObject Client::request(RequestType type, QJsonObject &payload, bool needToken)
{
    if (needToken)
        payload.insert("token", token);
    QJsonObject req;
    req.insert("type", type);
    req.insert("payload", payload);
    return sendMessage(req);
}
