import QtQuick 2.1

/**
 * Simple area that can grab input to increase or decrease numbers
 */
Item {
    id: root

    signal changed(int delta)
    property int shiftChangeValue: 10

    Rectangle {
        id: ground
        anchors.centerIn: parent
        width: parent.width+2
        height: parent.height+2
        border {
            width: 1
            color: "black"
        }
        visible: false
        color: "#6600ff00"
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        onEntered: ground.visible = true
        onExited: ground.visible = false
        onWheel: {
            var delta = wheel.angleDelta.y/Math.abs(wheel.angleDelta.y)
            if( wheel.modifiers & Qt.ShiftModifier )
                delta *= shiftChangeValue
            changed(delta)
        }
    }
}
