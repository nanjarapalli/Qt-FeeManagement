import QtQuick 2.9
import QtQuick.Window 2.2
import "./src"

Window {
    id: root
    visible: true

    title: qsTr("Qt-FeeManagement")

    minimumWidth: 1040
    minimumHeight: 788
    FeeManagement {
        anchors.fill: parent
    }

}
