import QtQuick 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.15

Item {
    id: root
    anchors.fill: parent

    BackButton { }

    BannerText {
        id: banner
        text: qsTr("时间页")
    }

    Column {
        id: main
        width: 500
        height: 50
        anchors.top: banner.bottom
        anchors.topMargin: 100
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 100

        Row{
            spacing: 50

            RegularText {
                width: 30
                text: qsTr("系统时间")
                font.pixelSize: 17
                horizontalAlignment: Text.AlignHCenter
            }

            RegularText {
                width: 80
                text: gui.curYear + '/' + gui.curMonth + '/' + gui.curDay
            }

        }

        BigButton {
            source: "/Images/plus"
            mouseArea.onClicked: {
                addDayDialog.open()
            }
        }
    }

    TextDialog {
        id: addDayDialog
        title: "加快时间页"
        textField.placeholderText: qsTr("增加天数")
        onAccepted : {
            const ret = gui.addTimeReq(addDayDialog.textField.value);
            if(ret) {
                error.text = "加快时间失败，" + ret
                error.open()
            }
            else {
                info.text = "加快时间成功"
                gui.timeReq()
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
