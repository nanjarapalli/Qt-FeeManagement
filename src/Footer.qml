import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "../Framework"

Rectangle {
    id: footer
    color: "#EFF3F4"

    Rectangle {
        width: parent.width
        height: FWTheme.footer.border
        color: FWTheme.footer.borderColor
    }

    FWButton {
        id: cancelBtn
        anchors.right: parent.right
        anchors.rightMargin: 40
        anchors.verticalCenter: parent.verticalCenter
        text: qsTr("Close")
        img: "qrc:/Images/ico-cancel.png"
        inActive: disableOnEditMode
        onButtonClicked: {
            console.log("Application closed by calling Qt.quit")
            Qt.quit()
        }
    }
}
