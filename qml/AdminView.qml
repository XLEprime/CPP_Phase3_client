import QtQuick 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.15

Item {
    id: root
    anchors.fill: parent

    BackButton { }

    BannerText {
        id: banner
        text: qsTr("管理员页")
    }

    Row {
        id: main
        width: 500
        height: 50
        anchors.top: banner.bottom
        anchors.topMargin: 200
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 100

        BigButton {
            source: "/Images/itemList"
            mouseArea.onClicked: {
                stackView.push("AdminSearch.qml")
            }
        }

        BigButton {
            source: "/Images/userList"
            mouseArea.onClicked: {
                gui.allUserInfoReq()
                stackView.push("AllUserView.qml")
            }
        }

    }
}
