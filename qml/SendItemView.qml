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
            text: qsTr("发送快递页")
            font.pixelSize: 17
            horizontalAlignment: Text.AlignHCenter
        }

        CusTextField {
            id: dstNameField
            placeholderText: "收件人用户名"
        }

        ComboBox {
            id: typeBox
            width: 400
            height: 40
            model: [ " ", "易碎物", "书籍", "普通快递" ]
        }

        CusTextField {
            id: amountField
            placeholderText: "数量"
        }


        CusTextField {
            id: descriptionField
            placeholderText: "描述"
        }

        BigButton {
            source: "/Images/right"
            anchors.horizontalCenter: parent.horizontalCenter
            mouseArea.onClicked: {
                const ret = gui.sendReq(dstNameField.value, typeBox.currentIndex, amountField.value, descriptionField.value)
                gui.queryReq(1,"","","","","","","","","","","")
                info.text = ret
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
