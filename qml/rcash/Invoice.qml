import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "common"

Rectangle {
    id: invoice
    color: "transparent"

    ColumnLayout {
        anchors {
            fill: parent
            margins: 20
        }
        GridLayout {
            anchors {
                fill: parent
            }
            columnSpacing: 40
            columns: 2

            Text {
                id: date_label
                font {
                    weight: Font.Bold
                    pointSize: 14
                }
                text: qsTr("Income date:")
                color: "#000"
            }
            DatePicker {
                id: date_value
                fontSize: 14
            }
            Text {
                id: provider_label
                font {
                    weight: Font.Bold
                    pointSize: 14
                }
                text: qsTr("Provider:")
                color: "#000"
            }
            TextField {
                id: provider_value
                Layout.fillWidth: true
            }
        }
        GroupBox {
            Layout.rowSpan: 1
            Layout.fillWidth: true
            Layout.fillHeight: true
            flat: true

            TableView {
                anchors.fill: parent
                TableViewColumn{ role: "id" ; title: qsTr("ID") ;  width: 50 }
                TableViewColumn{ role: "name"  ; title: qsTr("Name") ; width: 200 }
                TableViewColumn{ role: "name"  ; title: qsTr("Group") ; width: 100 }
            }
        }
        RowLayout {
            anchors.right: parent.right
            Button {
                id: clean_button
                text: qsTr("Clean")
            }
            Button {
                id: save_button
                text: qsTr("Save")
            }
        }
    }
}
