import QtQuick 2.2
import QtQuick.Window 2.1
import "JavaScript.js" as Logic

Window {
    visible: true
    color: "gray";
    opacity: .9
    width: 360
    height: 360

    Component {
        id: contactDelegate
        Item {
            width: grid.cellWidth; height: grid.cellHeight
            Column {
                anchors.fill: parent
                Text { text: name; anchors.centerIn: parent; font.pixelSize:50; }
            }
        }
    }
    GridView {
        id: grid
        anchors.fill: parent
        cellWidth: 120; cellHeight: 120
        model: ContactModel {}
        delegate: contactDelegate
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true
        Keys.onLeftPressed: {
            grid.moveCurrentIndexLeft();
            console.log("left"+currentIndex)
            grid.model;
        }
        Keys.onRightPressed: {
            grid.moveCurrentIndexRight();
            console.log("Right"+currentIndex)
        }
        Keys.onUpPressed: {
            grid.moveCurrentIndexUp();
            console.log("Up"+ currentIndex)
        }
        Keys.onDownPressed: {
            grid.moveCurrentIndexDown();
            console.log("Down" + currentIndex)
        }
    }
}

