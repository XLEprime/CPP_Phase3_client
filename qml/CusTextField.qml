import QtQuick 2.0
import QtQuick.Controls 2.12

TextField {
    width: 400
    height: 30
    property string value: ""
    onTextChanged: value = text
}
