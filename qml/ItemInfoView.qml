import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.1

Item {
    id: root
    anchors.fill: parent

    BackButton {}

    Column {
        width: 400
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        RegularText {
            id: banner
            width: 400
            text: qsTr("快递物品详细信息页")
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
        }

        Row {
            height: 40
            spacing: 50
            RegularText {
                text: qsTr("快递运单号")
                width: 60
            }
            RegularText {
                text: gui.singleItem.id
                width: 150
            }
        }

        Row {
            height: 40
            spacing: 50

            RegularText {
                text: qsTr("花费")
                width: 60
            }

            RegularText {
                text: gui.singleItem.cost
                width: 150
            }
        }

        Row {
            height: 40
            spacing: 50
            RegularText {
                text: qsTr("快递类型")
                width: 60
            }
            RegularText {
                text: gui.singleItem.type === 1 ? "易碎物" : gui.singleItem.type === 2 ? "图书" : "普通快递"
                width: 150
            }
        }

        Row {
            height: 40
            spacing: 50
            RegularText {
                text: qsTr("状态")
                width: 60
            }

            RegularText {
                text:
                {
                    if (gui.singleItem.state === 1)
                        return "待揽收"
                    else if (gui.singleItem.state === 2)
                        return "待签收"
                    else if (gui.singleItem.state === 3)
                        return "已签收"
                }
                width: 150
            }
        }

        Row {
            height: 40
            spacing: 50
            RegularText {
                text: qsTr("寄送时间")
                width: 60
            }
            RegularText {
                text:
                {
                    if(gui.singleItem.sendingTime_Year === -1 && gui.singleItem.sendingTime_Month === -1 && gui.singleItem.sendingTime_Month === -1)
                        return "未寄送"
                    else
                        gui.singleItem.sendingTime_Year + '/' + gui.singleItem.sendingTime_Month + '/' + gui.singleItem.sendingTime_Day
                }
                width: 150
            }
        }

        Row {
            height: 40
            spacing: 50
            RegularText {
                text: qsTr("签收时间")
                width: 60
            }
            RegularText {
                text:
                {
                    if(gui.singleItem.receivingTime_Year === -1 && gui.singleItem.receivingTime_Month === -1 && gui.singleItem.receivingTime_Month === -1)
                        return "未签收"
                    else
                        gui.singleItem.receivingTime_Year + '/' + gui.singleItem.receivingTime_Month + '/' + gui.singleItem.receivingTime_Day
                }
                width: 150
            }
        }

        Row {
            height: 40
            spacing: 50
            RegularText {
                text: qsTr("发件人")
                width: 60
            }
            RegularText {
                text: gui.singleItem.srcName
                width: 150
            }
        }

        Row {
            height: 40
            spacing: 50
            RegularText {
                text: qsTr("收件人")
                width: 60
            }
            RegularText {
                text: gui.singleItem.dstName
                width: 150
            }
        }

        Row {
            height: 40
            spacing: 50
            RegularText {
                text: qsTr("快递员")
                width: 60
            }
            RegularText {
                text: gui.singleItem.expressman
                width: 150
            }
        }

        Row {
            height: 40
            spacing: 50
            RegularText {
                text: qsTr("描述")
                width: 60
            }
            RegularText {
                text: gui.singleItem.description
                width: 150
            }
        }
    }
}
