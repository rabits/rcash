import QtQuick 2.1
import QtQuick.Controls 1.0

/**
 * Simple area that can grab input to increase or decrease numbers
 */
Item {
    id: root

    property int fontSize: 14
    property date value: new Date()

    function setValue(dateArray) {
        if( dateArray !== null )
            value = new Date(dateArray[2], dateArray[1]-1, dateArray[0], dateArray[3], dateArray[4])
        return Qt.formatDateTime(value, "dd/MM/yyyy hh:mm")
    }

    width: edit.implicitWidth
    height: edit.implicitHeight

    TextField {
        id: edit
        anchors.left: parent.left
        horizontalAlignment: TextInput.AlignHCenter
        width: 150
        inputMask: "99/99/9999 99:99"
        font.family: "monospace"
        text: setValue(null)

        Keys.onEscapePressed: setValue(text.split(/[\/ :]/))
        Keys.onReturnPressed: setValue(text.split(/[\/ :]/))
        onFocusChanged: if( !focus ) setValue(text.split(/[\/ :]/))
    }

    Text {
        id: area
        anchors.centerIn: edit
        horizontalAlignment: TextInput.AlignHCenter
        visible: false
        font.family: "monospace"
        text: "## ## #### ## ##"
    }

    property real _charWidth: area.width/16
    property real _charHeight: area.height

    ChangeArea {
        id: day
        x: area.x
        y: area.y
        shiftChangeValue: 7
        height: _charHeight
        width: _charWidth*2
        onChanged: setValue([value.getDate()+delta, value.getMonth()+1, value.getFullYear(), value.getHours(), value.getMinutes()])
    }
    ChangeArea {
        id: month
        x: day.x+_charWidth*3
        y: area.y
        shiftChangeValue: 3
        height: _charHeight
        width: _charWidth*2
        onChanged: setValue([value.getDate(), value.getMonth()+1+delta, value.getFullYear(), value.getHours(), value.getMinutes()])
    }
    ChangeArea {
        id: year
        x: month.x+_charWidth*3
        y: area.y
        height: _charHeight
        width: _charWidth*4
        onChanged: setValue([value.getDate(), value.getMonth()+1, value.getFullYear()+delta, value.getHours(), value.getMinutes()])
    }
    ChangeArea {
        id: hour
        x: year.x+_charWidth*5
        y: area.y
        shiftChangeValue: 6
        height: _charHeight
        width: _charWidth*2
        onChanged: setValue([value.getDate(), value.getMonth()+1, value.getFullYear(), value.getHours()+delta, value.getMinutes()])
    }
    ChangeArea {
        id: minute
        x: hour.x+_charWidth*3
        y: area.y
        height: _charHeight
        width: _charWidth*2
        onChanged: setValue([value.getDate(), value.getMonth()+1, value.getFullYear(), value.getHours(), value.getMinutes()+delta])
    }
}
