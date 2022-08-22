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
        text: qsTr("我的寄出")
    }

    RegularText{
        anchors.top: banner.bottom
        id: infoText
        text: qsTr("点击左侧icon可查看详细信息，下方icon可发送快递")
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
            spacing: 50
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
                text: qsTr("收件人")
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

                        SendItemIcon {}

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
                            text: modelData.dstName
                            width: 50
                            horizontalAlignment: Text.AlignRight
                        }

                    }
                }
            }
        }

        BigButton {
            anchors.horizontalCenter: parent.horizontalCenter
            source: "/Images/sendItem"
            mouseArea.onClicked: {
                stackView.push("SendItemView.qml")
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
