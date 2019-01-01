import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "../Framework"

Rectangle {
    color: searchstring == "" ? FWTheme.searchArea.backgroundColorDefault : FWTheme.searchArea.backgroundColorSearch

    RowLayout {
        id:searchRow
        width: parent.width - 298
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 50

        Text {
            id: searchTitle
            text: qsTr("Search Student")
            font.family: FWTheme.fontFamily
            font.pixelSize: FWTheme.searchArea.fontSize
            font.weight: FWTheme.searchArea.fontWeight
            color: FWTheme.searchArea.fontColor
            elide: Text.ElideRight
        }

        Rectangle {
            id: searchBox
            Layout.fillWidth: true
            height: 32
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.rightMargin: 10
            radius: FWTheme.inputText.borderRadius
            border.width: FWTheme.inputText.borderWidth
            border.color: FWTheme.inputText.borderColorDefault


            TextInput {
                id: searchtext
                width: searchBox.width - searchImg.width - 34
                anchors.left: parent.left
                anchors.leftMargin: 12
                anchors.verticalCenter: parent.verticalCenter
                text: searchstring
                font.weight: FWTheme.searchArea.fontWeight
                font.family: FWTheme.fontFamily
                font.pixelSize: FWTheme.searchArea.fontSize
                color: FWTheme.searchArea.fontColor
                clip: true
                onContentSizeChanged: searchstring = searchtext.text
            }

            Image {
                id: searchImg
                width: FWTheme.searchArea.iconSize
                height: FWTheme.searchArea.iconSize
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
                source: searchstring === "" ? "qrc:/Images/ico-search.png" : "qrc:/Images/ico-cancel.png"

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        if(searchstring != "")
                            searchstring = ""
                        console.log("Search button clicked")
                    }
                }
            }
        }
    }
    FWButton {
        id: aboutBtn
        anchors.right: parent.right
        anchors.rightMargin: 40
        anchors.verticalCenter: parent.verticalCenter
        text: qsTr("About")
        inActive: disableOnEditMode
        onButtonClicked: {
            console.log("About is CLicked ")
        }
    }
}
