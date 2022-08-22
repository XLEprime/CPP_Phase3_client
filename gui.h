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

const int CUSTOMER = 1;
const int ADMINISTRATOR = 2;
const int EXPRESSMAN = 3;

const int FRAGILE = 1; //易碎物
const int BOOK = 2;    //图书
const int NORMAL = 3;  //普通快递

// 用户数据结构 用于在UI上展示数据
class User : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString username READ username CONSTANT)
    Q_PROPERTY(int balance READ balance CONSTANT)
    Q_PROPERTY(int type READ type CONSTANT)
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString phoneNumber READ phoneNumber CONSTANT)
    Q_PROPERTY(QString address READ address CONSTANT)

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
    Item(int _id, int _cost, int _type, int _state, int _sendingTime_Year, int _sendingTime_Month, int _sendingTime_Day, int _receivingTime_Year, int _receivingTime_Month, int _receivingTime_Day, QString _srcName, QString _dstName, QString _expressman, QString _description) : m_id(_id), m_cost(_cost), m_type(_type), m_state(_state), m_sendingTime_Year(_sendingTime_Year), m_sendingTime_Month(_sendingTime_Month), m_sendingTime_Day(_sendingTime_Day), m_receivingTime_Year(_receivingTime_Year), m_receivingTime_Month(_receivingTime_Month), m_receivingTime_Day(_receivingTime_Day), m_srcName(_srcName), m_dstName(_dstName), m_expressman(_expressman), m_description(_description) {}

    /**
     * @brief 获得物品id
     * @return int 物品id
     */
    int id() const
    {
        return m_id;
    }

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
     * @brief 获得接收时间 年
     * @return int 接收时间 年
     */
    int receivingTime_Year() const { return m_receivingTime_Year; }
    /**
     * @brief 获得接收时间 月
     * @return int 接收时间 月
     */
    int receivingTime_Month() const { return m_receivingTime_Month; }
    /**
     * @brief 获得接收时间 日
     * @return int 接收时间 日
     */
    int receivingTime_Day() const { return m_receivingTime_Day; }

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
    int m_id;                  // 物品ID 运单号 主键
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

// GUI类 用于交互
class GUI : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool singleUserActive READ singleUserActive NOTIFY singleUserActiveChanged)
    Q_PROPERTY(User *singleUser READ singleUser NOTIFY singleUserChanged)
    Q_PROPERTY(QList<User *> user READ user NOTIFY userChanged)
    Q_PROPERTY(int userSize READ userSize NOTIFY userSizeChanged)

    Q_PROPERTY(Item *singleItem READ singleItem NOTIFY singleItemChanged)
    Q_PROPERTY(QList<Item *> item READ item NOTIFY itemChanged)
    Q_PROPERTY(int itemSize READ itemSize NOTIFY itemSizeChanged)

    Q_PROPERTY(int curYear READ curYear NOTIFY timeChanged)
    Q_PROPERTY(int curMonth READ curMonth NOTIFY timeChanged)
    Q_PROPERTY(int curDay READ curDay NOTIFY timeChanged)

public:
    GUI(QObject *parent, quint16 _port) : QObject(parent), client(this, _port), m_singleUserActive(false), m_singleUser(nullptr),m_singleItem(nullptr), m_userSize(0), m_itemSize(0) {}

    virtual ~GUI() = default;

    /**
     * @brief 获得是否登录状态
     */
    bool singleUserActive() const { return m_singleUserActive; }

    /**
     * @brief 获得用户详细页数据
     */
    User *singleUser() const { return m_singleUser; }

    /**
     * @brief 获得用户列表数据
     */
    QList<User *> user() const { return m_user; }

    /**
     * @brief 获得用户列表的大小
     */
    int userSize() const { return m_userSize; }

    /**
     * @brief 获得物品列表的数据
     */
    Item * singleItem() const { return m_singleItem; }

    /**
     * @brief 获得物品列表的数据
     */
    QList<Item *> item() const { return m_item; }

    /**
     * @brief 获得物品列表的大小
     */
    int itemSize() const { return m_itemSize; }

    /**
     * @brief 获得系统时间 年
     */
    int curYear() const { return m_curYear; }

    /**
     * @brief 获得系统时间 月
     */
    int curMonth() const { return m_curMonth; }

    /**
     * @brief 获得系统时间 日
     */
    int curDay() const { return m_curDay; }

     /**
      * @brief 查询系统时间
      */
     Q_INVOKABLE QString timeReq();

     /**
      * @brief 加快系统时间
      * @param days 要加快的天数
      */
     Q_INVOKABLE QString addTimeReq(QString days);

    /**
     * @brief 注册
     * @param username 用户名
     * @param password 密码
     * @param name 姓名
     * @param phoneNumber 电话
     * @param address 地址
     */
    Q_INVOKABLE QString userRegisterReq(QString username, QString password, QString name, QString phoneNumber, QString address);

    /**
     * @brief 登出
     */
    Q_INVOKABLE void logoutReq();

    /**
     * @brief 登录
     * @param username 用户名
     * @param password 密码
     */
    Q_INVOKABLE QString loginReq(QString username, QString password);

    /**
     * @brief 更改密码
     * @param password 新密码
     */
    Q_INVOKABLE QString changePasswordReq(QString password);

    /**
     * @brief 查看个人信息
     */
    Q_INVOKABLE QString infoReq();

    /**
     * @brief 查看所有个人信息
     * @return Q_INVOKABLE
     */
    Q_INVOKABLE QString allUserInfoReq();

    /**
     * @brief 添加快递员
     * @param username 用户名
     * @param password 密码
     * @param name 姓名
     * @param phoneNumber 电话
     * @param address 地址
     */
    Q_INVOKABLE QString addExpressmanReq(QString username, QString password, QString name, QString phoneNumber, QString address);

    /**
     * @brief 删除快递员
     * @param username 用户名
     */
    Q_INVOKABLE QString deleteExpressmanReq(QString username);

    /**
     * @brief 为一个快递指定快递员
     * @param expressman 快递员的用户名
     * @param itemId 快递运单号
     */
    Q_INVOKABLE QString assignReq(QString expressman, QString itemId);

    /**
     * @brief 运送一个快递
     * @param itemId 快递运单号
     */
    Q_INVOKABLE QString deliveryReq(QString itemId);

    /**
     * @brief 充值
     * @param money 金额
     */
    Q_INVOKABLE QString addBalanceReq(QString money);

    /**
     * @brief 查询快递的详细信息
     * @param type 查询类型 0为管理员查询所有快递 1为用户查询自己发出的快递 2为用户查询自己收到的快递 3为快递员查询自己所属的快递
     * @param id 物品ID 运单号 主键
     */
    Q_INVOKABLE QString queryDetailReq(int type, QString id);

    /**
     * @brief 查询符合条件的快递
     * @param type 查询类型 0为管理员查询所有快递 1为用户查询自己发出的快递 2为用户查询自己收到的快递 3为快递员查询自己所属的快递
     * @param id 物品ID 运单号 主键
     * @param sendingTime_Year 寄送时间 年
     * @param sendingTime_Month 寄送时间 月
     * @param sendingTime_Day 寄送时间 日
     * @param receivingTime_Year 接收时间 年
     * @param receivingTime_Month 接收时间 月
     * @param receivingTime_Day 接收时间 日
     * @param srcName 寄件用户的用户名
     * @param dstName 收件用户的用户名
     * @param expressman 快递员
     */
    Q_INVOKABLE QString queryReq(int type, QString id, int state, QString sendingTime_Year, QString sendingTime_Month, QString sendingTime_Day, QString receivingTime_Year, QString receivingTime_Month, QString receivingTime_Day, QString srcName, QString dstName, QString expressman);

    /**
     * @brief 发送快递
     * @param dstName 收件人用户名
     * @param type 快递类型
     * @param amount 快递数量
     * @param description 快递描述
     */
    Q_INVOKABLE QString sendReq(QString dstName, int type, QString amount, QString description);

    /**
     * @brief 接收快递
     * @param id 快递运单号
     */
    Q_INVOKABLE QString receiveReq(QString id);

    /**
     * @brief 删除快递
     * @param id 快递运单号
     */
    Q_INVOKABLE QString deleteItemReq(QString id);

Q_SIGNALS:
    void singleUserActiveChanged();
    void singleUserChanged();
    void userChanged();
    void userSizeChanged();
    void singleItemChanged();
    void itemChanged();
    void itemSizeChanged();
    void timeChanged();

private:
    Client client;

    bool m_singleUserActive; // 是否登录
    User *m_singleUser;      // 用户数据 用于个人详细页面
    QList<User *> m_user;    //用户数据 用于用户列表
    int m_userSize;          //用户数量

    Item *m_singleItem;        //物品数据 用于物品详细信息
    QList<Item *> m_item;       //物品数据 用于数据列表
    int m_itemSize;            //物品数量

    int m_curYear;          //系统时间 年
    int m_curMonth;          //系统时间 月
    int m_curDay;          //系统时间 日


    /**
     * @brief 检查服务端返回的json中status字段
     * @param ret 服务端返回的json
     * @return QString 如果status字段为false则返回错误信息，否则返回payload。
     */
    QString checkStatus(const QJsonObject &ret) const;

    /**
     * @brief 释放用户列表
     */
    void clearUser();

    /**
     * @brief 释放快递物品列表
     */
    void clearItem();
};

#endif
