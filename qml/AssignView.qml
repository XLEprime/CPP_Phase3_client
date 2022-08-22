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
            text: qsTr("指派快递员页")
            font.pixelSize: 17
            horizontalAlignment: Text.AlignHCenter
        }

        CusTextField {
            id: expressmanField
            placeholderText: "快递员用户名"
        }

        CusTextField {
            id: idField
            placeholderText: "快递运单号"
        }

        BigButton {
            source: "/Images/right"
            anchors.horizontalCenter: parent.horizontalCenter
            mouseArea.onClicked: {
                const ret = gui.assignReq(expressmanField.value, idField.value)
                if(ret)
                {
                    error.text = "指派失败，" + ret
                    error.open()
                }
                else
                {
                    gui.queryReq(0, "", "", "", "", "", "", "", "", "", "", "")
                    info.text = "指派成功"
                    info.open()
                    stackView.pop("AdminSearch.qml")
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
