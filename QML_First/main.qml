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
            MouseArea {
                id: mouse_area1
                anchors.fill: parent
                onClicked: {
                    if(index == grid.currentIndex+1){
                        listModel.move(grid.currentIndex,index,1)}
                    if(index == grid.currentIndex+3){
                        listModel.move(grid.currentIndex,index,1)
                        listModel.move(index,grid.currentIndex,1)}
                    if(index == grid.currentIndex-1){
                        listModel.move(grid.currentIndex,index,1)}
                    if(index == grid.currentIndex-3){
                        listModel.move(grid.currentIndex,index,1)
                        listModel.move(index,grid.currentIndex,1)
                    }
                }
            }
        }
    }

    GridView {
        id: grid
        anchors.fill: parent
        cellWidth: 120; cellHeight: 120
        model: listModel
        delegate: contactDelegate
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true
        onActiveFocusChanged: {
            console.log(currentItem.x +" "+currentItem.y);
        }

        Keys.onLeftPressed: {
            if(currentItem.x >= 120){
            moveCurrentIndexLeft();
            console.log("left"+currentIndex)
            }
        }
        Keys.onRightPressed: {
            if(currentItem.x <= 120){
            console.log(currentItem.x)
                moveCurrentIndexRight();
            }
        }
        Keys.onUpPressed: {
            if(currentItem.y >=120){
            moveCurrentIndexUp();
            console.log("Up"+ currentIndex)
            }
        }
        Keys.onDownPressed: {
            if(currentItem.y <= 120){
            moveCurrentIndexDown();
            console.log("Down" + currentIndex)
            }
        }
    }
    ListModel {
        id:listModel;

        ListElement {
            name: "1"
        }
        ListElement {
            name: "2"
        }
        ListElement {
            name: "3"
        }
        ListElement {
            name: "4"
        }
        ListElement {
            name: "5"
        }
        ListElement {
            name: "6"
        }
        ListElement {
            name: "7"
        }
        ListElement {
            name: "8"
        }
        ListElement {
            name: "9"
        }
    }
}

