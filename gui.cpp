/**
 * @file gui.cpp
 * @author Haolin Yang
 * @brief GUI交互类的实现
 * @version 0.1
 * @date 2022-05-06
 *
 * @copyright Copyright (c) 2022
 *
 */
#include "gui.h"

#include <QJsonObject>
#include <QJsonArray>

QString GUI::userLogin(QString username, QString password)
{
    if (username.isEmpty() || password.isEmpty())
        return "用户名和密码不能为空";
    QJsonObject payload;
    payload.insert("username", username);
    payload.insert("password", password);
    auto ret = client.loginReq(payload);
    if (ret["status"].toBool() == true)
    {
        m_userActive = true;
        emit userActiveChanged();
        return {};
    }
    else
        return ret["payload"].toString();
}
