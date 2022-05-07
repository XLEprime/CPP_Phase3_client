import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2

Item {
    anchors.fill: parent

    BackButton {}

    Column {
        width: 400
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 50
        spacing: 20

        RegularText {
            width: 400
            text: qsTr("创建新商品")
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
        }

        CusTextField {
            id: nameField
            placeholderText: "名称"
        }

        CusTextField {
            id: introField
            placeholderText: "介绍"
        }

        ComboBox {
            id: typeBox
            width: 400
            height: 30
            model: [ "服饰", "书籍", "电子产品" ]
        }

        CusTextField {
            id: priceField
            placeholderText: "价格"
        }

        CusTextField {
            id: amountField
            placeholderText: "数量"
        }

        Row {
            width: 300
            height: 50
            spacing: 200
            anchors.horizontalCenter: parent.horizontalCenter

            BigButton {
                source: "/Images/check"
                mouseArea.onClicked: {
                    const msg = client_model.itemAdd(nameField.value, introField.value, typeBox.currentIndex, priceField.value, amountField.value)
                    if(msg) {
                        error.text = "添加失败，" + msg
                        error.open()
                    }
                    else {
                        stackView.pop()
                    }
                }
            }

            BigButton {
                source: "/Images/delete"
                mouseArea.onClicked: {
                    stackView.pop()
                }
            }
        }
    }

    MessageDialog {
        id: error
        icon: StandardIcon.Warning
        title: "错误"
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
