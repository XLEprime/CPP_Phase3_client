import QtQuick 2.12
import QtQuick.Controls 2.15

Image {
    height: 40
    width: 40
    source: "/Images/sendItem"
    MouseArea {
        anchors.fill: parent
        onClicked: {
            gui.queryDetailReq(0,modelData.id.toString())
            stackView.push("ItemInfoView.qml")
        }
    }
}
