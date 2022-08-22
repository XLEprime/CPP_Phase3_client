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
        text: qsTr("我所属的快递")
    }

    RegularText{
        anchors.top: banner.bottom
        id: infoText
        text: qsTr("点击左侧icon可查看详细信息，下方icon可运送快递")
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
            spacing: 20
            RegularText {
                text: qsTr("")
                width: 40
            }
            RegularText {
                text: qsTr("运单号")
                width: 50
            }
            RegularText {
                text: qsTr("类型")
                width: 80
                horizontalAlignment: Text.AlignRight
            }
            RegularText {
                text: qsTr("状态")
                width: 50
                horizontalAlignment: Text.AlignRight
            }
            RegularText {
                text: qsTr("寄件人")
                width: 50
                horizontalAlignment: Text.AlignRight
            }
            RegularText {
                text: qsTr("收件人")
                width: 50
                horizontalAlignment: Text.AlignRight
            }
            RegularText {
                text: qsTr("快递员")
                width: 50
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
                model:gui.item
                spacing: 20
                delegate: Item {
                    height: 40
                    Row {
                        height: 40
                        spacing: infoRow.spacing

                        ExpressItemIcon {}

                        RegularText {
                            text: modelData.id
                            width: 50
                            horizontalAlignment: Text.AlignRight
                        }

                        RegularText {
                            text:
                            {
                                if (modelData.type === 1)
                                    return "易碎品"
                                else if (modelData.type === 2)
                                    return "图书"
                                else if (modelData.type === 3)
                                    return "普通快递"
                            }
                            width: 80
                            horizontalAlignment: Text.AlignRight
                        }

                        RegularText {
                            text:
                            {
                                if (modelData.state === 1)
                                    return "待揽收"
                                else if (modelData.state === 2)
                                    return "待签收"
                                else if (modelData.state === 3)
                                    return "已签收"
                            }
                            width: 50
                            horizontalAlignment: Text.AlignRight
                        }

                        RegularText {
                            text: modelData.srcName
                            width: 50
                            horizontalAlignment: Text.AlignRight
                        }

                        RegularText {
                            text: modelData.dstName
                            width: 50
                            horizontalAlignment: Text.AlignRight
                        }

                        RegularText {
                            text: modelData.expressman
                            width: 50
                            horizontalAlignment: Text.AlignRight
                        }

                    }
                }
            }
        }

        BigButton {
            anchors.horizontalCenter: parent.horizontalCenter
            source: "/Images/transfer"
            mouseArea.onClicked: {
                receiveDialog.open()
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
        id: receiveDialog
        title: "运送快递页"
        textField.placeholderText: qsTr("需运送快递的运单号")
        onAccepted : {
            const ret = gui.deliveryReq(receiveDialog.textField.value);
            if(ret) {
                error.text = "运送失败，" + ret
                error.open()
            }
            else {
                info.text = "运送成功"
                info.open()
                stackView.pop()
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
