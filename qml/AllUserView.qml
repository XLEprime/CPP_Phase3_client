import QtQuick 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.15

Item {
    id: root
    anchors.fill: parent

    BackButton { }

    onFocusChanged: {
        if(focus) {

        }
    }

    BannerText {
        id: banner
        text: qsTr("所有人员信息页")
    }

    RegularText{
        anchors.top: banner.bottom
        id: infoText
        text: qsTr("点击下方icon可以为增加和删除快递员")
        font.pixelSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Column {
        id: itemTable
        width: 780
        anchors.bottom: parent.bottom
        anchors.top: infoText.bottom
        anchors.bottomMargin: 20
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter

        Row {
            id: infoRow
            height: 40
            spacing: 40
            RegularText {
                text: qsTr("用户名")
                width: 80
            }
            RegularText {
                text: qsTr("类型")
                width: 50
                horizontalAlignment: Text.AlignRight
            }
            RegularText {
                text: qsTr("余额")
                width: 50
                horizontalAlignment: Text.AlignRight
            }
            RegularText {
                text: qsTr("姓名")
                width: 100
                horizontalAlignment: Text.AlignRight
            }
            RegularText {
                text: qsTr("电话号码")
                width: 100
                horizontalAlignment: Text.AlignRight
            }
            RegularText {
                text: qsTr("地址")
                width: 150
                horizontalAlignment: Text.AlignRight
            }
        }

        ScrollView {
            id: itemScroll
            width: itemTable.width
            height: parent.height - 90
            clip: true
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

            ListView {
                anchors.fill: itemScroll
                model:gui.user
                spacing: 20
                delegate: Item {
                    height: 40
                    Row {
                        height: 40
                        spacing: infoRow.spacing
                        RegularText {
                            text: modelData.username
                            width: 80
                            horizontalAlignment: Text.AlignRight
                        }

                        RegularText {
                            text:
                            {
                                if (modelData.type === 1)
                                    return "普通用户"
                                else if (modelData.type === 2)
                                    return "管理员"
                                else if (modelData.type === 3)
                                    return "快递员"
                            }
                            width: 50
                            horizontalAlignment: Text.AlignRight
                        }

                        RegularText {
                            text: modelData.balance
                            width: 50
                            horizontalAlignment: Text.AlignRight
                        }

                        RegularText {
                            text: modelData.name
                            width: 100
                            horizontalAlignment: Text.AlignRight
                        }

                        RegularText {
                            text: modelData.phoneNumber
                            width: 100
                            horizontalAlignment: Text.AlignRight
                        }

                        RegularText {
                            text: modelData.address
                            width: 150
                            horizontalAlignment: Text.AlignRight
                        }

                    }
                }
            }
        }

        Row {
            width: 300
            height: 50
            spacing: 200
            anchors.horizontalCenter: parent.horizontalCenter

            BigButton {
                source: "/Images/addUser"
                mouseArea.onClicked: {
                    stackView.push("AddExpressmanView.qml")
                }
            }

            BigButton {
                source: "/Images/deleteUser"
                 mouseArea.onClicked: {
                     deleteExpressmanDialog.open()
                 }
            }
        }
    }

    Rectangle {
        height: itemTable.height + 10
        width: itemTable.width + 10
        anchors.centerIn: itemTable
        color: "transparent"
        border.color: "lightgrey"
        radius: 5
    }

    TextDialog {
        id: deleteExpressmanDialog
        title: "删除快递员页"
        textField.placeholderText: qsTr("要删除的快递员用户名")
        onAccepted : {
            const ret = gui.deleteExpressmanReq(deleteExpressmanDialog.textField.value);
            if(ret) {
                error.text = "删除失败，" + ret
                error.open()
            }
            else {
                info.text = "删除成功"
                gui.allUserInfoReq()
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
