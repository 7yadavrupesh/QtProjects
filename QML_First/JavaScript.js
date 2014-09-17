.pragma library

var StaticVariable = 0;

function init(grid){
    if(StaticVariable === 1)
        return;
    grid.moveCurrentIndexDown();
    grid.moveCurrentIndexDown();
    grid.moveCurrentIndexRight();
    grid.moveCurrentIndexRight();

}

function arrange(listModel,startPlaying){
    if(StaticVariable === 1)
        return;

    var arg1 = Math.random(10)*10;
    var arg2 = Math.random(10)*10;
    var arg3 = Math.random(10)*10;
    var arg4 = Math.random(10)*10;
    var arg5 = Math.random(10)*10;
    var arg6 = Math.random(10)*10;
    var arg7 = Math.random(10)*10;
    var arg8 = Math.random(10)*10;

    arg1 = (arg1<9)?arg1-1 :arg1;
    arg2 = (arg2<9)?arg2-1 :arg2;
    arg3 = (arg3<9)?arg3-1 :arg3;
    arg4 = (arg4<9)?arg4-1 :arg4;
    arg5 = (arg5<9)?arg5-1 :arg5;
    arg6 = (arg6<9)?arg6-1 :arg6;
    arg7 = (arg7<9)?arg7-1 :arg7;
    console.log(arg1+" "+arg2+" "+arg3+" "+arg4+" "+arg5+" "+arg6+" "+arg7)
    listModel.move(arg1,arg2,1);
    listModel.move(arg1,arg5,1);
    listModel.move(arg5,arg2,1);
    listModel.move(arg6,arg7,1);
    listModel.move(arg7,arg3,1);
    startPlaying.text = "Play";

    StaticVariable = 1;
}

function checkComplete(listModel){
    var index =0;
    for(index =0; index< 8; index++)
    {
        var data =  listModel.get(index);
        console.log(data.name + " " + index)
        if(index+1 == data.name)
        {
            continue;
        }
        else
        {
            return -1;
        }
    }
    return 0;
}
function isStarted(){
    if(StaticVariable == 0)
        return 0;
    else
        return 1;
}
