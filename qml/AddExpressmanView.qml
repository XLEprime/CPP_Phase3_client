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
            text: qsTr("添加快递员页")
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

        CusTextField {
            id: nameField
            placeholderText: "姓名"
        }

        CusTextField {
            id: phoneNumberField
            placeholderText: "电话号码"
        }

        CusTextField {
            id: addressField
            placeholderText: "地址"
        }

        BigButton {
            source: "/Images/right"
            anchors.horizontalCenter: parent.horizontalCenter
            mouseArea.onClicked: {
                const ret = gui.addExpressmanReq(usernameField.value, passwdField.value, nameField.value, phoneNumberField.value, addressField.value)
                if(ret)
                {
                    error.text = "添加失败，" + ret
                    error.open()
                }
                else
                {
                    info.text = "添加成功"
                    info.open()
                    gui.allUserInfoReq()
                    stackView.pop()
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
