import QtQuick 2.0
import QtQuick.Controls 2.15

TextField {
    width: 400
    height: 40
    property string value: ""
    onTextChanged: value = text
}
