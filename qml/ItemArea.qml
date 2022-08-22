import QtQuick 2.0

Rectangle {
    id: root
    width: 740
    height: 40
    color: "transparent"
    radius: 10
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
//            parent.color = "blue"
            root.border.color = "lightgrey"
        }
//        onExited: {
//            parent.color = "black"
//            root.border.color = "transparent"
//        }
        onClicked: {
            gui.queryDetailReq(1,modelData.id.toString())
            stackView.push("ItemInfoView.qml")
        }
    }
}

