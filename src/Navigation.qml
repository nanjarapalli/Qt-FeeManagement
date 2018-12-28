import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQml.Models 2.1
import "../Framework"

Rectangle {
    id: navigationPane
    color: FWTheme.navigationArea.backgroundColor
    property alias groupIndex : groups.currentIndex


    Rectangle {
        id: rightBorder4r
        width: FWTheme.navigationArea.borderRightWidth
        height: parent.height
        anchors.right: parent.right
        color: FWTheme.navigationArea.borderRightColor
    }

    NavigationDelegate {
        id: _allStudents
        width: parent.width
        height: FWTheme.navigationArea.itemHeight
        anchors.top: parent.top
        anchors.topMargin: 51
        color: groups.currentIndex === -1 ? FWTheme.navigationArea.backgroundSelected : FWTheme.navigationArea.backgroundColor
        selected: groups.currentIndex === -1 ? true : false
        iconImage: "qrc:/Images/ico-group.png"
        notificationvalue: 15
        elementtext: qsTr("All Students")
        MouseArea {
            anchors.fill: parent
            onClicked: {
                selectedGroup = 0
                groupIndex = -1
                console.log("groups.currentIndex", groups.currentIndex)
            }
        }
    }

    Button {
        id: upArrow
        anchors.top: _allStudents.bottom
        anchors.topMargin: 2
        anchors.bottom: groups.top
        anchors.bottomMargin: 2
        width: parent.width
        visible: groups.visibleArea.heightRatio < 1.0
        enabled: groups.currentIndex > 0
        opacity: enabled ? FWTheme.button.opacityActive: FWTheme.button.opacityInactive

        Canvas {
            id: canvasUpArrow

            anchors.centerIn: parent

            height: 14
            width: 20

            antialiasing: true

            onPaint: {
                var ctx = canvasUpArrow.getContext('2d')

                ctx.strokeStyle = "black"
                ctx.lineWidth = 2//canvasUpArrow.height * 0.05
                ctx.beginPath()
                ctx.moveTo(canvasUpArrow.width * 0.05, canvasUpArrow.height)
                ctx.lineTo(canvasUpArrow.width / 2, canvasUpArrow.height * 0.1)
                ctx.lineTo(canvasUpArrow.width * 0.95, canvasUpArrow.height)
                ctx.stroke()
            }
        }
        onClicked: {
            if(groups.currentIndex > 0)
            {
                groupIndex = groups.currentIndex - 1
            }
        }
    }


    Component {
           id: navigationDelegate
           NavigationDelegate {
               id:groupitem
               width: parent.width
               height: FWTheme.navigationArea.itemHeight
               color: groups.currentIndex === index ? FWTheme.navigationArea.backgroundSelected : FWTheme.navigationArea.backgroundColor
               selected: groups.currentIndex === index ? true : false
               iconImage: "qrc:/Images/ico-group.png"
               notificationvalue: 15
               elementtext: name
               MouseArea {
                   id: dragArea
                   anchors.fill: parent
                   property int positionStarted: 0
                   property int positionEnded: 0
                   property int positionsMoved: Math.floor((positionEnded - positionStarted)/groupitem.height)
                   property int newPosition: index + positionsMoved
                   property bool hold: false
                   drag.axis: Drag.YAxis
                   onClicked: {
                       selectedGroup = 1
                       groupSelected = name
                       groupIndex = index
                       console.log("groups.currentIndex", groups.currentIndex)
                   }
                   onPressAndHold: {
                       groupitem.z = 2
                       positionStarted = groupitem.y
                       dragArea.drag.target = groupitem
                       groupitem.opacity = 0.5
                       hold = true
                       drag.maximumY = (groups.height - groupitem.height - 1 + groups.contentY)
                       drag.minimumY = 0
                   }
                   onPositionChanged: {
                       positionEnded = groupitem.y
                   }
                   onReleased: {
                       if (Math.abs(positionsMoved) < 1 && hold == true) {
                           groupitem.y = positionStarted
                           groupitem.opacity = 1
                           dragArea.drag.target = null
                           hold = false
                       } else {
                           if (hold == true) {
                               if (newPosition < 1) {
                                   groupitem.z = 1
                                   classModel.move(index,0,1)
                                   groupitem.opacity = 1
                                   groups.interactive = true
                                   dragArea.drag.target = null
                                   hold = false
                               } else if (newPosition > groups.count - 1) {
                                   groupitem.z = 1
                                   classModel.move(index,groups.count - 1,1)
                                   groupitem.opacity = 1
                                   dragArea.drag.target = null
                                   hold = false
                               }
                               else {
                                   groupitem.z = 1
                                   classModel.move(index,newPosition,1)
                                   groupitem.opacity = 1
                                   dragArea.drag.target = null
                                   hold = false
                               }
                           }
                       }
                   }
               }
           }
       }

    ListView {
        id: groups
        width: parent.width
        model: classModel
        delegate: navigationDelegate
        anchors.left: parent.left
        anchors.top: _allStudents.bottom
        anchors.topMargin: 28
        anchors.bottom: downArrow.top
        anchors.bottomMargin: 38
        clip: true
        interactive: false
        boundsBehavior: Flickable.StopAtBounds
        onCurrentIndexChanged: searchstring = ""
    }

    Button {
        id: downArrow
        height: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 7
        width: parent.width
        visible: groups.visibleArea.heightRatio < 1.0
        enabled: groups.currentIndex < (groups.count - 1)
        opacity: enabled ? FWTheme.button.opacityActive: FWTheme.button.opacityInactive

        Canvas {
            id: canvasDownArrow

            anchors.centerIn: parent

            height: 14
            width: 20

            antialiasing: true

            onPaint: {
                var ctx = canvasDownArrow.getContext('2d')

                ctx.strokeStyle = "black"
                ctx.lineWidth = 2//canvas.height * 0.05
                ctx.beginPath()
                ctx.moveTo(canvasDownArrow.width * 0.05, canvasDownArrow.height * 0.1)
                ctx.lineTo(canvasDownArrow.width / 2, canvasDownArrow.height)
                ctx.lineTo(canvasDownArrow.width * 0.95, canvasDownArrow.height * 0.1)
                ctx.stroke()
            }
        }
        onClicked: {
            if(groups.currentIndex < (groups.count - 1))
            {
                groupIndex = groups.currentIndex + 1
            }
        }
    }

    Component.onCompleted: groups.currentIndex = -1
}
