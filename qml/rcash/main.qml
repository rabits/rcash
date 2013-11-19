import QtQuick 2.1
import QtQuick.Controls 1.0

Rectangle {
    width: 800
    height: 600

    TabView {
        anchors {
            fill: parent
        }
        Tab {
            title: qsTr("Invoice")
            Invoice {
                anchors.fill: parent
            }
        }
        Tab {
            title: qsTr("Products")
        }
        Tab {
            title: qsTr("Reports")
        }
    }
}
