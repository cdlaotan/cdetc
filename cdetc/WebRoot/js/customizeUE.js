UE.registerUI('addblank',function(editor,uiName){
    //注册按钮执行时的command命令，使用命令默认就会带有回退操作
    editor.registerCommand(uiName,{
        execCommand:function(){
            //alert('execCommand:' + uiName)
        	//editor.execCommand('inserthtml', '<span><input></span>');
        }
    });

    //创建一个button
    var btn = new UE.ui.Button({
        //按钮的名字
        name:uiName,
        //提示
        title:"增加填空",
        //需要添加的额外样式，指定icon图标，这里默认使用一个重复的icon
        cssRules :'background-position: -500px 0;',
        //点击时执行的命令
        onclick:function () {
            //这里可以不用执行命令,做你自己的操作也可
        	editor.execCommand('inserthtml', '<span><input type="text" name="answer"></span>');
        }
    });
    return btn;
},26,'content');