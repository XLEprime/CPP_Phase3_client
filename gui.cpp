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
#include <cmath>

 QString GUI::timeReq()
 {
     QJsonObject payload;
     QJsonObject ret = client.request(Client::time, payload, false);
     if (ret["status"].toBool() == true)
     {
         QJsonObject retPayload = ret["payload"].toObject();
         m_curYear = retPayload["year"].toInt();
         m_curMonth = retPayload["month"].toInt();
         m_curDay = retPayload["day"].toInt();
         emit timeChanged();
         return {};
     }
     else
         return ret["payload"].toString();
 }

 QString GUI::addTimeReq(QString days)
 {
     if (!days.isEmpty())
     {
         bool ok = false;
         if (days.toInt(&ok) <= 0 || !ok)
             return "请输入一个合法的天数 <正整数>";
     }
     QJsonObject payload;
     payload.insert("days", days.toInt());
     QJsonObject ret = client.request(Client::addTime, payload, false);
     return checkStatus(ret);
 }

QString GUI::userRegisterReq(QString username, QString password, QString name, QString phoneNumber, QString address)
{
    if (username.isEmpty() || password.isEmpty() || name.isEmpty() || phoneNumber.isEmpty() || address.isEmpty())
        return "信息不能为空";
    QJsonObject payload;
    payload.insert("username", username);
    payload.insert("password", password);
    payload.insert("type", CUSTOMER);
    payload.insert("name", name);
    payload.insert("phonenumber", phoneNumber);
    payload.insert("address", address);

    QJsonObject ret = client.request(Client::userRegister, payload, false);
    return checkStatus(ret);
}

QString GUI::loginReq(QString username, QString password)
{
    if (username.isEmpty() || password.isEmpty())
        return "用户名和密码不能为空";
    QJsonObject payload;
    payload.insert("username", username);
    payload.insert("password", password);

    QJsonObject ret = client.loginReq(payload);
    if (ret["status"].toBool() == true)
    {
        m_singleUserActive = true;
        emit singleUserActiveChanged();
        return {};
    }
    else
        return ret["payload"].toString();
}

void GUI::logoutReq()
{
    client.logoutReq();
    m_singleUserActive = false;
    emit singleUserActiveChanged();
}

QString GUI::changePasswordReq(QString password)
{
    if (password.isEmpty())
        return "密码不能为空";
    QJsonObject payload;
    payload.insert("password", password);
    QJsonObject ret = client.request(Client::changePassword, payload, true);
    return checkStatus(ret);
}

QString GUI::infoReq()
{
    QJsonObject payload;
    QJsonObject ret = client.request(Client::info, payload, true);
    if (ret["status"].toBool() == true)
    {
        QJsonObject retPayload = ret["payload"].toObject();
        if (m_singleUser != nullptr)
            delete m_singleUser;
        m_singleUser = new User(retPayload["username"].toString(), retPayload["balance"].toInt(), retPayload["type"].toInt(), retPayload["name"].toString(), retPayload["phonenumber"].toString(), retPayload["address"].toString());
        emit singleUserChanged();
        return {};
    }
    else
        return ret["payload"].toString();
}

QString GUI::allUserInfoReq()
{
    QJsonObject payload;
    QJsonObject ret = client.request(Client::allUserInfo, payload, true);
    if (ret["status"].toBool() == true)
    {
        clearUser();
        QJsonArray arrUserInfo = ret["payload"].toArray();
        for (auto i = arrUserInfo.begin(); i != arrUserInfo.end(); ++i)
        {
            QJsonObject userInfo = i->toObject();
            m_user.append(new User(userInfo["username"].toString(), userInfo["balance"].toInt(), userInfo["type"].toInt(), userInfo["name"].toString(), userInfo["phonenumber"].toString(), userInfo["address"].toString()));
        }
        m_userSize = arrUserInfo.size();
        emit userChanged();
        emit userSizeChanged();
        return {};
    }
    else
        return ret["payload"].toString();
}

QString GUI::addExpressmanReq(QString username, QString password, QString name, QString phoneNumber, QString address)
{
    if (username.isEmpty() || password.isEmpty() || name.isEmpty() || phoneNumber.isEmpty() || address.isEmpty())
        return "信息不能为空";
    QJsonObject payload;
    payload.insert("username", username);
    payload.insert("password", password);
    payload.insert("type", EXPRESSMAN);
    payload.insert("name", name);
    payload.insert("phonenumber", phoneNumber);
    payload.insert("address", address);

    QJsonObject ret = client.request(Client::addExpressman, payload, true);
    return checkStatus(ret);
}

QString GUI::deleteExpressmanReq(QString username)
{
    if (username.isEmpty())
        return "快递员用户名不能为空";
    QJsonObject payload;
    payload.insert("username", username);

    QJsonObject ret = client.request(Client::deleteExpressman, payload, true);
    return checkStatus(ret);
}

QString GUI::assignReq(QString expressman, QString itemId)
{
    if (expressman.isEmpty())
        return "快递员用户名不能为空";
    if (itemId.isEmpty())
        return "快递运单号不能为空";
    else
    {
        bool ok = false;
        if (itemId.toInt(&ok) <= 0 || !ok)
            return "请输入一个合法的快递运单号 <正整数>";
    }

    QJsonObject payload;
    payload.insert("expressman", expressman);
    payload.insert("itemId", itemId.toInt());

    QJsonObject ret = client.request(Client::assign, payload, true);
    return checkStatus(ret);
}

QString GUI::deliveryReq(QString itemId)
{
    if (itemId.isEmpty())
        return "快递运单号不能为空";
    else
    {
        bool ok = false;
        if (itemId.toInt(&ok) <= 0 || !ok)
            return "请输入一个合法的快递运单号 <正整数>";
    }
    QJsonObject payload;
    payload.insert("itemId", itemId.toInt());

    QJsonObject ret = client.request(Client::delivery, payload, true);
    return checkStatus(ret);
}

QString GUI::addBalanceReq(QString money)
{
    if (money.isEmpty())
        return "金额不能为空";
    bool ok = false;
    if (money.toInt(&ok) <= 0 || !ok)
        return "请输入一个合法的金额数量 <正整数>";

    QJsonObject payload;
    payload.insert("money", money.toInt());
    QJsonObject ret = client.request(Client::addBalance, payload, true);
    return checkStatus(ret);
}

QString GUI::queryReq(int type, QString id, int state, QString sendingTime_Year, QString sendingTime_Month, QString sendingTime_Day, QString receivingTime_Year, QString receivingTime_Month, QString receivingTime_Day, QString srcName, QString dstName, QString expressman)
{
    QJsonObject payload;

    payload.insert("type", type);

    if (!id.isEmpty())
    {
        bool ok = false;
        if (id.toInt(&ok) <= 0 || !ok)
            return "请输入一个合法的快递运单号 <正整数>";
        payload.insert("id", id.toInt());
    }

    if (state != 0)
    {
        payload.insert("state", state);
    }

    if (!sendingTime_Year.isEmpty())
    {
        bool ok = false;
        if (sendingTime_Year.toInt(&ok) < 0 || !ok)
            return "请输入一个合法的寄送时间 年 <正整数>";
        payload.insert("sendingTime_Year", sendingTime_Year.toInt());
    }

    if (!sendingTime_Month.isEmpty())
    {
        bool ok = false;
        if (sendingTime_Month.toInt(&ok) < 0 || !ok)
            return "请输入一个合法的寄送时间 月 <正整数>";
        payload.insert("sendingTime_Month", sendingTime_Month.toInt());
    }

    if (!sendingTime_Day.isEmpty())
    {
        bool ok = false;
        if (sendingTime_Day.toInt(&ok) < 0 || !ok)
            return "请输入一个合法的寄送时间 日 <正整数>";
        payload.insert("sendingTime_Day", sendingTime_Day.toInt());
    }

    if (!receivingTime_Year.isEmpty())
    {
        bool ok = false;
        if (receivingTime_Year.toInt(&ok) < 0 || !ok)
            return "请输入一个合法的接收时间 年 <正整数>";
        payload.insert("receivingTime_Year", receivingTime_Year.toInt());
    }

    if (!receivingTime_Month.isEmpty())
    {
        bool ok = false;
        if (receivingTime_Month.toInt(&ok) < 0 || !ok)
            return "请输入一个合法的接收时间 月 <正整数>";
        payload.insert("receivingTime_Month", receivingTime_Month.toInt());
    }

    if (!receivingTime_Day.isEmpty())
    {
        bool ok = false;
        if (receivingTime_Day.toInt(&ok) < 0 || !ok)
            return "请输入一个合法的接收时间 日 <正整数>";
        payload.insert("receivingTime_Day", receivingTime_Day.toInt());
    }

    if (!srcName.isEmpty())
        payload.insert("srcName", srcName);

    if (!dstName.isEmpty())
        payload.insert("dstName", dstName);

    if (!expressman.isEmpty())
        payload.insert("expressman", expressman);

    QJsonObject ret = client.request(Client::query, payload, true);

    if (ret["status"].toBool() == true)
    {
        clearItem();
        QJsonArray arrItemInfo = ret["payload"].toArray();
        for (auto i = arrItemInfo.begin(); i != arrItemInfo.end(); ++i)
        {
            QJsonObject itemInfo = i->toObject();
            m_item.append(new Item(itemInfo["id"].toInt(), itemInfo["cost"].toInt(), itemInfo["type"].toInt(), itemInfo["state"].toInt(), itemInfo["sendingTime_Year"].toInt(), itemInfo["sendingTime_Month"].toInt(), itemInfo["sendingTime_Day"].toInt(), itemInfo["receivingTime_Year"].toInt(), itemInfo["receivingTime_Month"].toInt(), itemInfo["receivingTime_Day"].toInt(), itemInfo["srcName"].toString(), itemInfo["dstName"].toString(), itemInfo["expressman"].toString(), itemInfo["description"].toString()));
        }
        m_itemSize = arrItemInfo.size();
        emit itemChanged();
        emit itemSizeChanged();
        return {};
    }
    else
        return ret["payload"].toString();
}

QString GUI::queryDetailReq(int type, QString id)
{
    QJsonObject payload;

    payload.insert("type", type);

    if (!id.isEmpty())
    {
        bool ok = false;
        if (id.toInt(&ok) <= 0 || !ok)
            return "请输入一个合法的快递运单号 <正整数>";
        payload.insert("id", id.toInt());
    }

    QJsonObject ret = client.request(Client::query, payload, true);

    if (ret["status"].toBool() == true)
    {
        QJsonArray arrItemInfo = ret["payload"].toArray();
        for (auto i = arrItemInfo.begin(); i != arrItemInfo.end(); ++i)
        {
            QJsonObject itemInfo = i->toObject();
            if (m_singleItem)
                delete m_singleItem;
            m_singleItem = nullptr;
            m_singleItem = new Item(itemInfo["id"].toInt(), itemInfo["cost"].toInt(), itemInfo["type"].toInt(), itemInfo["state"].toInt(), itemInfo["sendingTime_Year"].toInt(), itemInfo["sendingTime_Month"].toInt(), itemInfo["sendingTime_Day"].toInt(), itemInfo["receivingTime_Year"].toInt(), itemInfo["receivingTime_Month"].toInt(), itemInfo["receivingTime_Day"].toInt(), itemInfo["srcName"].toString(), itemInfo["dstName"].toString(), itemInfo["expressman"].toString(), itemInfo["description"].toString());
        }
        emit singleItemChanged();
        return {};
    }
    else
        return ret["payload"].toString();
}

QString GUI::sendReq(QString dstName, int type, QString strAmount, QString description)
{
    if (dstName.isEmpty() || strAmount.isEmpty() || description.isEmpty())
        return "用户名、数量和描述不能为空";

    int amount = 0;
    bool ok = false;

    if(strAmount.toDouble(&ok) <= 0 || !ok)
        return "数量输入有误，必须为<正数>";
    if (type != BOOK)
        amount = ceil(strAmount.toDouble()); //向上取整
    else if (strAmount.toInt(&ok) && ok)
        amount = strAmount.toInt();
    else
        return "图书只支持整本寄出";

    QJsonObject payload;
    payload.insert("dstName", dstName);
    payload.insert("type", type);
    payload.insert("amount", amount);
    payload.insert("description", description);

    QJsonObject ret = client.request(Client::send, payload, true);
    if (ret["status"].toBool() == true)
    {
        QString retStr = "寄送成功，共花费" + QString::number(ret["payload"].toInt()) + "元";
        return retStr;
    }
    else
        return ret["payload"].toString();
}

QString GUI::receiveReq(QString id)
{
    if (!id.isEmpty())
    {
        bool ok = false;
        if (id.toInt(&ok) <= 0 || !ok)
            return "请输入一个合法的快递运单号 <正整数>";
    }
    else
        return "请输入一个合法的快递运单号 <正整数>";

    QJsonObject payload;
    payload.insert("id", id.toInt());
    QJsonObject ret = client.request(Client::receive, payload, true);
    return checkStatus(ret);
}

QString GUI::deleteItemReq(QString id)
{
    if (id.isEmpty())
        return "快递运单号不能为空";
    else
    {
        bool ok = false;
        if (id.toInt(&ok) <= 0 || !ok)
            return "请输入一个合法的快递运单号 <正整数>";
    }

    QJsonObject payload;
    payload.insert("id", id.toInt());

    QJsonObject ret = client.request(Client::deleteItem, payload, true);
    return checkStatus(ret);
}

QString GUI::checkStatus(const QJsonObject &ret) const
{
    if (ret["status"].toBool() == true)
        return {};
    else
        return ret["payload"].toString();
}

void GUI::clearUser()
{
    for (auto i = m_user.begin(); i != m_user.end(); ++i)
        if (*i != nullptr)
            delete *i;
    m_user.clear();
}

void GUI::clearItem()
{
    for (auto i = m_item.begin(); i != m_item.end(); ++i)
        if (*i != nullptr)
            delete *i;
    m_item.clear();
}
