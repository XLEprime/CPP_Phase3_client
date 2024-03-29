import QtQuick 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.15

Item {
    id: root
    anchors.fill: parent

    BackButton { }

    Column {
        width: 400
        spacing: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        RegularText {
            id: banner
            width: 400
            text: qsTr("登录页")
            font.pixelSize: 17
            horizontalAlignment: Text.AlignHCenter
        }

        CusTextField {
            id: usernameField
            placeholderText: "用户名"
        }

        CusTextField {
            id: passwdField
            placeholderText: "密码"
            echoMode: TextInput.Password
        }


        Row {
            width: 300
            height: 50
            spacing: 200
            anchors.horizontalCenter: parent.horizontalCenter

            BigButton {
                source: "/Images/right"
                mouseArea.onClicked: {
                    const ret = gui.loginReq(usernameField.value, passwdField.value)
                    if(ret)
                    {
                        error.text = "登录失败，" + ret
                        error.open()
                    }
                    else
                    {
                        gui.infoReq()
                        stackView.pop()
                    }
                }
            }

            BigButton {
                source: "/Images/addUser"
                 mouseArea.onClicked: {
                     stackView.push("RegisterView.qml")
                 }
            }
        }
    }

    MessageDialog {
        id: error
        icon: StandardIcon.Warning
        title: "错误"
    }

    MessageDialog {
        id: info
        icon: StandardIcon.Information
        title: "信息提示"
    }
}
