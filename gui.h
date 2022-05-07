/**
 * @file gui.h
 * @author Haolin Yang
 * @brief GUI交互类的声明 用户和快递物品数据结构
 * @version 0.1
 * @date 2022-05-06
 *
 * @copyright Copyright (c) 2022
 *
 */

#ifndef GUI_H
#define GUI_H

#include <QHostAddress>
#include <QObject>

#include "client.h"

class GUI : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool userActive READ userActive NOTIFY userActiveChanged)

public:
    GUI(QObject *parent, quint16 _port) : QObject(parent), client(this, _port) {}

    virtual ~GUI() = default;

    bool userActive() const
    {
        return m_userActive;
    }

    Q_INVOKABLE QString userLogin(QString username, QString password);

Q_SIGNALS:
    void userActiveChanged();

private:
    Client client;

    bool m_userActive;    // 是否登录
    User *m_singleUser;   // 用户数据 用于个人详细页面
    QList<User *> m_user; //用户数据 用于用户列表

    /**
     * @brief 检查服务端返回的json中status字段
     * @param ret 服务端返回的json
     * @return QString 如果status字段为false则返回错误信息，否则返回payload。
     */
    QString checkStatus(const QJsonObject &ret) const;
};

// 用户数据结构 用于在UI上展示数据
class User : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString username READ username CONSTANT)
    Q_PROPERTY(int balance READ balance CONSTANT)
    Q_PROPERTY(int type READ type CONSTANT)

public:
    User(QString _username, int _balance, int _type, QString _name, QString _phoneNumber, QString _address) : m_username(std::move(_username)), m_type(_type), m_balance(_balance), m_name(_name), m_phoneNumber(_phoneNumber), m_address(_address) {}

    /**
     * @brief 获得用户名
     * @return QString 用户名
     */
    QString username() const { return m_username; }

    /**
     * @brief 获得用户余额
     * @return int 余额
     */
    int balance() const { return m_balance; }

    /**
     * @brief 获得用户类型
     * @return int 用户类型
     */
    int type() const { return m_type; }

    /**
     * @brief 获得姓名
     * @return QString 姓名
     */
    QString name() const { return m_name; }

    /**
     * @brief 获得电话号码
     * @return QString 电话号码
     */
    QString phoneNumber() const { return m_phoneNumber; }

    /**
     * @brief 获得地址
     * @return QString 地址
     */
    QString address() const { return m_address; }

private:
    QString m_username;    // 用户名
    int m_balance;         // 用户余额
    int m_type;            // 用户类型
    QString m_name;        //姓名
    QString m_phoneNumber; //电话号码
    QString m_address;     //地址
};

// 快递物品数据结构 用于在UI上展示数据

class Item : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int id READ id CONSTANT)
    Q_PROPERTY(int cost READ cost CONSTANT)
    Q_PROPERTY(int type READ type CONSTANT)
    Q_PROPERTY(int state READ state CONSTANT)
    Q_PROPERTY(int sendingTime_Year READ sendingTime_Year CONSTANT)
    Q_PROPERTY(int sendingTime_Month READ sendingTime_Month CONSTANT)
    Q_PROPERTY(int sendingTime_Day READ sendingTime_Day CONSTANT)
    Q_PROPERTY(int receivingTime_Year READ receivingTime_Year CONSTANT)
    Q_PROPERTY(int receivingTime_Month READ receivingTime_Month CONSTANT)
    Q_PROPERTY(int receivingTime_Day READ receivingTime_Day CONSTANT)
    Q_PROPERTY(QString srcName READ srcName CONSTANT)
    Q_PROPERTY(QString dstName READ dstName CONSTANT)
    Q_PROPERTY(QString expressman READ expressman CONSTANT)
    Q_PROPERTY(QString description READ description CONSTANT)



public:
    /**
     * @brief 获得物品id
     * @return int 物品id
     */
    int id() const { return m_id; }

    /**
     * @brief 获得物品总花费
     * @return int 物品总花费
     */
    int cost() const { return m_cost; };

    /**
     * @brief 获得物品类型
     * @return int 物品类型
     */
    int type() const { return m_type; };

    /**
     * @brief 获得物品状态
     * @return int 物品状态
     */
    int state() const { return m_state; }

    /**
     * @brief 获得寄送时间 年
     * @return int 寄送时间 年
     */
    int sendingTime_Year() const { return m_sendingTime_Year; }
    /**
     * @brief 获得寄送时间 月
     * @return int 寄送时间 月
     */
    int sendingTime_Month() const { return m_sendingTime_Month; }
    /**
     * @brief 获得寄送时间 日
     * @return int 寄送时间 日
     */
    int sendingTime_Day() const { return m_sendingTime_Day; }

    /**
     * @brief 获得寄件用户的用户名
     * @return QString 寄件用户的用户名
     */
    QString srcName() const { return m_srcName; }

    /**
     * @brief 获得收件用户的用户名
     * @return QString 收件用户的用户名
     */
    QString dstName() const { return m_dstName; }

    /**
     * @brief 获得快递员的用户名
     * @return QString 快递员的用户名
     */
    QString expressman() const { return m_expressman; }

    /**
     * @brief 获得描述信息
     * @return QString 描述信息
     */
    QString description() const { return m_description; }

private:
    int m_id;                  // 物品ID 主键
    int m_cost;                //总花费
    int m_type;                //物品种类
    int m_state;               //物品状态
    int m_sendingTime_Year;    //寄送时间 年
    int m_sendingTime_Month;   //寄送时间 月
    int m_sendingTime_Day;     //寄送时间 日
    int m_receivingTime_Year;  //接收时间 年
    int m_receivingTime_Month; //接收时间 月
    int m_receivingTime_Day;   //接收时间 日
    QString m_srcName;         //寄件用户的用户名
    QString m_dstName;         //收件用户的用户名
    QString m_expressman;      //快递员
    QString m_description;     //物品描述
};

#endif
