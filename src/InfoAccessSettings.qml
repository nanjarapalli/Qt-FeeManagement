import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2
import "../Framework"

Rectangle {
    width: 340
    height: 308
    color: FWTheme.infoArea.backgroundColor

    property var viewsModel: [
        {"name": "Main", "isStartView": true, "accessLevel": "readOnly"},
        {"name": "View1", "isStartView": false, "accessLevel": "full"},
        {"name": "View4", "isStartView": false, "accessLevel": "none"},
        {"name": "View5", "isStartView": false, "accessLevel": "full"},
    ]

    Text {
        id: label
        height: 14
        anchors.right: parent.right
        anchors.rightMargin: 42
        anchors.top: parent.top
        anchors.topMargin: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        text: qsTr("ACCESS RIGHTS")
        font.family: FWTheme.fontFamily
        font.pixelSize: FWTheme.infoArea.labelFontSize
        color: FWTheme.infoArea.fontColorLight
        clip: true
        elide: Text.ElideRight
    }

    Text {
        id: startTitle
        width: 45
        height: 16
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: label.bottom
        anchors.topMargin: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        text: qsTr("START")
        font.family: FWTheme.fontFamily
        font.pixelSize: FWTheme.infoArea.labelFontSize
        color: FWTheme.infoArea.fontColorLight
        clip: true
        elide: Text.ElideRight
    }

    Text {
        id: viewTitle
        width: 85
        height: 16
        anchors.left: startTitle.right
        anchors.leftMargin: 35
        anchors.top: startTitle.top
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        text: qsTr("VIEW")
        font.family: FWTheme.fontFamily
        font.pixelSize: FWTheme.infoArea.labelFontSize
        color: FWTheme.infoArea.fontColorLight
        clip: true
        elide: Text.ElideRight
    }

    Item {
        id: accessImageHolder
        width: 81
        height: 16
        anchors.right: parent.right
        anchors.rightMargin: 53
        anchors.top: viewTitle.top

        Image {
            id: noAccessImg
            width: 16
            height: 16
            anchors.left: parent.left
            anchors.top: parent.top
            verticalAlignment: Image.AlignVCenter
            source: "qrc:/Images/ico-no-access.png"
        }

        Image{
            id: viewImg
            width: 16
            height: 16
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            verticalAlignment: Image.AlignVCenter
            source: "qrc:/Images/ico-view.png"
        }

        Image {
            id: interactImg
            width: 16
            height: 16
            anchors.right: parent.right
            anchors.top: parent.top
            verticalAlignment: Image.AlignVCenter
            source: "qrc:/Images/ico-interact.png"
        }
    }

    Rectangle {
        id: borderFirst
        width: parent.width - 40
        height: FWTheme.infoArea.border
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: accessImageHolder.bottom
        anchors.topMargin: 12
        color: FWTheme.infoArea.borderColor
    }

    Component {
        id: settingDelegate
        Item {
            width: settingList.width
            height: 40

            FWRadioButton {
                id: selectBtn
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                exclusiveGroup: settingGroup
                checked: viewsModel[index].isStartView ? true : false
            }

            Text {
                id: viewText
                width: 85
                height: 16
                anchors.left: selectBtn.right
                anchors.leftMargin: 55
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                text: viewsModel[index].name//qsTr("VIEW 1")
                font.family: FWTheme.fontFamily
                font.pixelSize: FWTheme.infoArea.fontSize
                color: FWTheme.infoArea.fontColorBold
                clip: true
                elide: Text.ElideRight
            }

            FWSlider {
                anchors.right: parent.right
                anchors.rightMargin: 33
                anchors.verticalCenter: parent.verticalCenter
                accessLevel: viewsModel[index].accessLevel
            }

            Rectangle {
                id: borderItem
                width: parent.width
                height: FWTheme.infoArea.border
                anchors.bottom: parent.bottom
                color: FWTheme.infoArea.borderColor
            }
        }
    }
    ListView {
        id: settingList
        width: parent.width - 40
        height: 240
        anchors.left: borderFirst.left
        anchors.top: borderFirst.bottom
        model: viewsModel
        delegate: settingDelegate
        boundsBehavior: Flickable.StopAtBounds
        ExclusiveGroup { id: settingGroup }
    }
}

