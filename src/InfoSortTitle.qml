import QtQuick 2.0
import "../Framework"

Item {
    property int nrFoundUsers: 3 //:TODO:Mo this has to be set from the search result
    property int nrTotalUsers: 13 //:TODO:Mo this has to be set from the total number of users in the model

    Image {
        id: labelImg
        width: 16
        height: 16
        verticalAlignment: Image.AlignVCenter
        source: "qrc:/Images/ico-info.png"
    }

    Text {
        id: infoLabelText
        width: parent.width - 26
        height: 16
        anchors.left: labelImg.right
        anchors.leftMargin: 10
        verticalAlignment: Text.AlignVCenter
        text: "UNDER DEVELOPMENT"//qsTr("Found %3 %1 %4 of %3 %2 %4 userscdsavsavavfsvsfvdvsvdfvasfdvsfvsffsvasfv").arg(nrFoundUsers).arg(nrTotalUsers).arg("<font color=\"#4c4c4c\">").arg("</font>")
        font.family: FWTheme.fontFamily
        font.pixelSize: FWTheme.infoArea.fontSize
        font.weight: FWTheme.infoArea.fontWeightLight
        color: FWTheme.infoArea.fontColorLight
        elide: Text.ElideRight
    }

    Rectangle {
        id: borderup
        width: parent.width
        height: FWTheme.infoArea.border
        anchors.top: infoLabelText.bottom
        anchors.topMargin: 23
        color: FWTheme.infoArea.borderColor
    }
}

