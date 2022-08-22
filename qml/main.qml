import QtQuick 2.12
import QtQuick.Controls 2.15

ApplicationWindow {
    width: 800
    height: 600
    visible: true
    title: qsTr("物流管理系统")
    minimumWidth: 800
    minimumHeight: 600
    property alias stackView: stackView

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainView
    }

    Connections {
        target: gui
    }

    MainView {
        id: mainView
    }
}
