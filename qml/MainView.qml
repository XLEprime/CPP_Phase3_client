import QtQuick 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.15

Item {
    id: root
    anchors.fill: parent

    onFocusChanged: {
        if(focus) {
            gui.timeReq()
        }
    }

    BannerText {
        id: banner
        text: qsTr("主页")
    }

    Row {
        id: main
        width: 500
        height: 50
        anchors.top: banner.bottom
        anchors.topMargin: 200
        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.verticalCenter: parent.verticalCenter
        spacing: 50

        BigButton {
            source: "/Images/customer"
            mouseArea.onClicked: {
                if(gui.singleUserActive)
                {
                    if (gui.singleUser.type === 1)
                        stackView.push("CustomerView.qml")
                    else
                    {
                        error.text = "只有普通用户能进入用户页"
                        error.open()
                    }
                }
                else
                {
                    stackView.push("LoginView.qml")
                }
            }
        }

        BigButton {
            source: "/Images/expressman"
            mouseArea.onClicked: {
                if(gui.singleUserActive)
                {
                    if (gui.singleUser.type === 3)
                        stackView.push("ExpressmanView.qml")
                    else
                    {
                        error.text = "只有快递员能进入快递员页"
                        error.open()
                    }

                }
                else
                {
                    stackView.push("LoginView.qml")
                }
            }
        }

        BigButton {
            source: "/Images/manager"
            mouseArea.onClicked: {
                if(gui.singleUserActive)
                {
                    if (gui.singleUser.type === 2)
                        stackView.push("AdminView.qml")
                    else
                    {
                        error.text = "只有管理员能进入管理员页"
                        error.open()
                    }
                }
                else
                {
                    stackView.push("LoginView.qml")
                }
            }
        }

        BigButton {
            source: "/Images/info"
            mouseArea.onClicked: {
                if(gui.singleUserActive)
                {
                    gui.infoReq()
                    stackView.push("UserInfoView.qml")
                }
                else
                {
                    stackView.push("LoginView.qml")
                }
            }
        }

        BigButton {
            source: "/Images/clock"
            mouseArea.onClicked: {
                if(gui.singleUserActive)
                {
                    gui.timeReq()
                    stackView.push("Time.qml")
                }
                else
                {
                    stackView.push("LoginView.qml")
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
