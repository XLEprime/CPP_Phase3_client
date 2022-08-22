import QtQuick 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.15

Item{
    id: root
    anchors.fill: parent

    onFocusChanged: {
        if(focus)
        {
            gui.infoReq();
        }
    }

    BackButton { }

    Column {
        width: 400
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        RegularText {
            id: banner
            width: 400
            text: qsTr("用户信息页")
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
        }

        Row {
            height: 40
            spacing: 30
            RegularText {
                text: qsTr("用户名")
                width: 60
            }
            RegularText {
                text: gui.singleUser.username
                width: 150
            }
        }

        Row {
            height: 40
            spacing: 30

            RegularText {
                text: qsTr("余额")
                width: 60
            }

            RegularText {
                text: gui.singleUser.balance
                width: 150
            }

            BigButton {
                source: "/Images/plus"
                mouseArea.onClicked: {
                    addBalanceDialog.open()
                }
            }
        }

        Row {
            height: 40
            spacing: 30
            RegularText {
                text: qsTr("用户类型")
                width: 60
            }
            RegularText {
                text: gui.singleUser.type === 1 ? "普通用户" : gui.singleUser.type === 2 ? "管理员" : "快递员"
                width: 150
            }
        }

        Row {
            height: 40
            spacing: 30
            RegularText {
                text: qsTr("姓名")
                width: 60
            }
            RegularText {
                text: gui.singleUser.name
                width: 150
            }
        }

        Row {
            height: 40
            spacing: 30
            RegularText {
                text: qsTr("电话号码")
                width: 60
            }
            RegularText {
                text: gui.singleUser.phoneNumber
                width: 150
            }
        }

        Row {
            height: 40
            spacing: 30
            RegularText {
                text: qsTr("地址")
                width: 60
            }
            RegularText {
                text: gui.singleUser.address
                width: 150
            }
        }

        Row{
            width: 400
            height: 50
            spacing: 200
            anchors.horizontalCenter: parent.horizontalCenter

            BigButton {
                source: "/Images/changePassword"
                mouseArea.onClicked: {
                    passwordDialog.open()
                }
            }

            BigButton {
                source: "/Images/logout"
                mouseArea.onClicked: {
                    gui.logoutReq()
                    stackView.pop()
                }
            }
        }
    }

    TextDialog {
        id: passwordDialog
        title: "修改密码页"
        textField.placeholderText: qsTr("新密码")
        textField.echoMode: TextInput.Password
        onAccepted : {
            const ret = gui.changePasswordReq(passwordDialog.textField.value);
            if(ret) {
                error.text = "修改密码失败，" + ret
                error.open()
            }
            else {
                info.text = "修改密码成功"
                info.open()
            }
        }
    }

    TextDialog {
        id: addBalanceDialog
        title: "增加余额页"
        textField.placeholderText: qsTr("增加余额值")
        onAccepted : {
            const ret = gui.addBalanceReq(addBalanceDialog.textField.value);
            if(ret) {
                error.text = "增加余额失败，" + ret
                error.open()
            }
            else {
                info.text = "增加余额成功"
                gui.infoReq()
                info.open()
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
