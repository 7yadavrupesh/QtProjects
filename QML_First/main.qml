import QtQuick 2.2
import QtQuick.Window 2.1
import "JavaScript.js" as Logic

Window {
    visible: true
    color: "gray";
    opacity: .7
    width: 360
    height: 460
    maximumHeight: 460
    maximumWidth: 360
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
                    if(!Logic.isStarted())
                     {}
                     else{
                        if(index == grid.currentIndex+1){
                            if(grid.currentIndex == 2 || grid.currentIndex == 5 )
                                return;
                            listModel.move(grid.currentIndex,index,1)
                            number.text = number.text*1 +1;
                        }
                        if(index == grid.currentIndex+3){
                            listModel.move(grid.currentIndex,index,1)
                            listModel.move(index,grid.currentIndex,1)
                            number.text = number.text*1 +1;
                        }
                        if(index == grid.currentIndex-1){
                            if(grid.currentIndex == 3 || grid.currentIndex == 6 )
                                return;
                            listModel.move(grid.currentIndex,index,1)
                            number.text = number.text*1 +1;
                        }
                        if(index == grid.currentIndex-3){
                            listModel.move(grid.currentIndex,index,1)
                            listModel.move(index,grid.currentIndex,1)
                            number.text = number.text*1 +1;
                        }
                        if(!Logic.checkComplete(listModel)){
                            startPlaying.text = "Complete";
                        }
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
        highlight: Rectangle { color: "#00FFFF"; radius: 20; border.color: "#863131"; border.width: 5; }

        focus: false;
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

        Text {
            id: text1
            x: 128
            y: 427
            text: qsTr("Number Of Moves: ")
            font.pixelSize: 12
        }

        Text {
            id: number
            x: 239
            y: 427
            text: qsTr("0")
            font.pixelSize: 12
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
            name: " "
        }
        onDataChanged: {
            listModel.clear();
        }
    }
    Text {
        y:361
        width: 114
        height: 50
        x:119
        id: startPlaying
        text: qsTr("Start")
        font.family: ""
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 50
        MouseArea{
            id:startButton
            anchors.fill: parent
            onClicked: {
                Logic.init(grid);
                Logic.arrange(listModel,startPlaying);
                console.log(listModel.get(1));

            }
        }
    }
}

