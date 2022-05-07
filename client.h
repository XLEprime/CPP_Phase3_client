/**
 * @file client.h
 * @author Haolin Yang
 * @brief 客户端类的声明
 * @version 0.1
 * @date 2022-05-06
 *
 * @copyright Copyright (c) 2022
 *
 */
#ifndef CLIENT_H
#define CLIENT_H

#include <QObject>
#include <QUdpSocket>
#include <QJsonObject>

/// 客户端类
class Client : public QObject
{
    Q_OBJECT
public:
    enum RequestType
    {
        time,             //查询系统时间
        addTime,          //加快系统时间
        userRegister,     //注册
        login,            //登录
        logout,           //登出
        changePassword,   //修改密码
        info,             //查看个人信息
        allUserInfo,      //查看所有用户信息
        addExpressman,    //添加快递员
        deleteExpressman, //删除快递员
        assign,           //为一个快递指定快递员
        delivery,         //运送一个快递
        addBalance,       //充值
        query,            //查询符合条件的快递
        send,             //发送快递
        receive           //接收快递
    };

    Client(QObject *parent, quint16 _port) : QObject(parent), socket(this), port(_port) {}

    /**
     * @brief 登录
     * @param payload 有效负载
     * @return QJsonObject
     */
    QJsonObject loginReq(const QJsonObject &payload);

    /**
     * @brief 登出
     */
    void logoutReq();

    /**
     * @brief 发送请求
     * @param type 请求类型
     * @param payload 有效负载
     * @param needToken 是否需要附加token
     * @return 服务端的内容
     */
    QJsonObject request(RequestType type, QJsonObject &payload, bool needToken = false);

private:
    /**
     * @brief 向服务端发送报文
     * @param msg 报文
     * @return 服务端的内容
     */
    QJsonObject sendMessage(const QJsonObject &msg);

    QUdpSocket socket; ///< 与服务端通信的socket
    quint16 port;      ///< 服务端端口
    QString token;     ///< 用户凭据
};

#endif
