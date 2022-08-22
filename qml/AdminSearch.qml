import QtQuick 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.15

Item {
    id: root
    anchors.fill: parent

    BackButton { }

    BannerText {
        id: banner
        text: qsTr("所有快递 搜索页")
    }

    Column {
        anchors.top: banner.bottom
        width: 400
        spacing: 20
        anchors.horizontalCenter: parent.horizontalCenter

        Row{
            spacing: 30

            RegularText {
                width: 30
                text: qsTr("运单号")
                font.pixelSize: 17
                horizontalAlignment: Text.AlignHCenter
            }

            CusTextField {
                id: idField
                placeholderText: "运单号"
            }

        }

        Row{
            spacing: 30

            RegularText {
                width: 30
                text: qsTr("寄送状态")
                font.pixelSize: 17
                horizontalAlignment: Text.AlignHCenter
            }

            ComboBox {
                        id: stateBox
                        width: 400
                        height: 30
                        model: [ " ", "待揽收", "待签收", "已签收" ]
                    }

        }



        Row{
            spacing: 30

            RegularText {
                width: 30
                text: qsTr("寄送时间")
                font.pixelSize: 17
                horizontalAlignment: Text.AlignHCenter
            }

            CusTextField {
                width: 100
                id: sendingTimeYearField
                placeholderText: "年"
            }

            CusTextField {
                width: 100
                id: sendingTimeMonthField
                placeholderText: "月"
            }

            CusTextField {
                width: 100
                id: sendingTimeDayField
                placeholderText: "日"
            }
        }

        Row{
            spacing: 30

            RegularText {
                width: 30
                text: qsTr("签收时间")
                font.pixelSize: 17
                horizontalAlignment: Text.AlignHCenter
            }

            CusTextField {
                width: 100
                id: receivingTimeYearField
                placeholderText: "年"
            }

            CusTextField {
                width: 100
                id: receivingTimeMonthField
                placeholderText: "月"
            }

            CusTextField {
                width: 100
                id: receivingTimeDayField
                placeholderText: "日"
            }
        }

        Row{
            spacing: 30

            RegularText {
                width: 30
                text: qsTr("寄件人")
                font.pixelSize: 17
                horizontalAlignment: Text.AlignHCenter
            }

            CusTextField {
                id: srcNameField
                placeholderText: "寄件人"
            }

        }

        Row{
            spacing: 30

            RegularText {
                width: 30
                text: qsTr("收件人")
                font.pixelSize: 17
                horizontalAlignment: Text.AlignHCenter
            }

            CusTextField {
                id: dstNameField
                placeholderText: "收件人"
            }

        }

        Row{
            spacing: 30

            RegularText {
                width: 30
                text: qsTr("快递员")
                font.pixelSize: 17
                horizontalAlignment: Text.AlignHCenter
            }

            CusTextField {
                id: expressmanField
                placeholderText: "快递员"
            }

        }

        BigButton {
            source: "/Images/search"
            anchors.horizontalCenter: parent.horizontalCenter
            mouseArea.onClicked: {
                gui.queryReq(0, idField.value, stateBox.currentIndex, sendingTimeYearField.value, sendingTimeMonthField.value, sendingTimeDayField.value, receivingTimeYearField.value, receivingTimeMonthField.value, receivingTimeDayField.value, srcNameField.value, dstNameField.value, expressmanField.value)
                stackView.push("AllItemView.qml")
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
