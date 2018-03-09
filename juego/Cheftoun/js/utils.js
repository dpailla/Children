
var utils = {
    makeButton:function(text,buttonClicked,element,parameter1){
        //create the back for the button
        var back=game.add.image(0,0,"boton");
        back.frame=0;
        back.scale.setTo(0.4,0.4);
        //create the label for the button
        //and set the text to the text parameter passed down
        var label=game.add.text(0,0,text);

        back.anchor.set(0.5,0.5);
        label.anchor.set(0.5,0.5);

        //create the group
        var buttonGroup=game.add.group();

        //add the sprite and the label to the group
        buttonGroup.add(back);
        buttonGroup.add(label);

        //groups can not take input so we need to add the
        //listener for the click 
        back.inputEnabled=true;
        if (parameter1!=undefined) {
            back.events.onInputDown.add(buttonClicked,element,0,parameter1);
        }else{
            back.events.onInputDown.add(buttonClicked,element);
        }
        
        //return the group as the button
        return buttonGroup;

    },
    makeSmallButton:function(text,buttonClicked,element,parameter1){
        //create the back for the button
        var back=game.add.image(0,0,"boton");
        back.frame=0;
        back.scale.setTo(0.2,0.2);
        //create the label for the button
        //and set the text to the text parameter passed down
        var label=game.add.text(0,0,text);

        back.anchor.set(0.5,0.5);
        label.anchor.set(0.5,0.5);

        //create the group
        var buttonGroup=game.add.group();

        //add the sprite and the label to the group
        buttonGroup.add(back);
        buttonGroup.add(label);

        //groups can not take input so we need to add the
        //listener for the click 
        back.inputEnabled=true;
        if (parameter1!=undefined) {
            back.events.onInputDown.add(buttonClicked,element,0,parameter1);
        }else{
            back.events.onInputDown.add(buttonClicked,element);
        }
        
        //return the group as the button
        return buttonGroup;
    },

    randomIntFromInterval:function(min,max){
        return Math.floor(Math.random()*(max-min+1)+min);
    },
    makeIcon:function(iconName){
        var back=game.add.image(0,0,iconName);
        back.frame=0;
        back.scale.setTo(0.3,0.3);
        return back;
    },
    getRelativeSize:function(size){
        return game.world.width /size;
    },
    popUp:function(){
        //  You can drag the pop-up window around
        //add Background to window
        var groupPop = {};


        var bg = game.add.tileSprite(0, 0, game.world.width, game.world.height, 'blackTiled', 0);
        bg.alpha = 0.5;
        bg.inputEnabled = true;

        var popup = game.add.image(game.world.centerX, game.world.centerY, 'popupBg');
        popup.frame=0;
        popup.alpha = 1;
        popup.anchor.set(0.5);
        popup.inputEnabled = true;
       
        popup.input.enableDrag();

        groupPop.bg = bg;
        groupPop.popup = popup;

        //  Position the close button to the top-right of the popup sprite (minus 8px for spacing)
        var pw = (popup.width / 2) - 30;
        var ph = (popup.height / 2) +15;

        //  And click the close button to close it down again
        var closeButton = game.make.sprite(pw, -ph, 'closeIcon');
        closeButton.inputEnabled = true;
        closeButton.scale.setTo(0.4,0.4);
        closeButton.input.priorityID = 1;
        closeButton.input.useHandCursor = true;
        closeButton.events.onInputDown.add(function(closeIcon,pointer,winPopUp) {
            winPopUp.popup.close(winPopUp);
        }, null,0, groupPop);

        //  Add the "close button" to the popup window image
        popup.addChild(closeButton);

        //  Hide it awaiting a click
        popup.scale.set(0.1);

        //close function
        popup.close = function(winPopUp){
            if (winPopUp.popup.tween && winPopUp.popup.tween.isRunning || winPopUp.popup.scale.x === 0.1){
                return;
            }
            winPopUp.popup.tween = game.add.tween(winPopUp.popup.scale).to( { x: 0, y: 0 }, 200, Phaser.Easing.Linear.In, true);
            winPopUp.popup.tween.onComplete.add(function(tweenobj,pointer,winPopUpOn){
                winPopUpOn.bg.destroy();
                winPopUpOn.popup.destroy();
                winPopUp = undefined;
            },null,0,winPopUp);
        }


        //openFunction
        popup.open = function(isCustom,imagen,texto,boton) {
            //add content
            var realWidth = this.width * 10;
            var realHeight = this.height * 10;
            if(!isCustom){
                console.log(this.width);
                
                console.log(realWidth);

                imagen.anchor.set(0.5);
                imagen.x = - (realWidth / 4);
                //imagen.y = - realHeight / 2;

                texto.anchor.set(0.5);
                texto.x = (realWidth / 4);
                //texto.y = - realHeight / 2;
            }

            popup.addChild(imagen);
            popup.addChild(texto);

            if (boton!=undefined) {
                boton.x = (realWidth / 4);
                boton.y = (realHeight/2) - 50;
                popup.addChild(boton);
            }
            if (this.tween !== null && this.tween != undefined){
                if (this.tween.isRunning || this.scale.x === 1) {
                    return;
                }
                
            }
            this.tween = game.add.tween(this.scale).to( { x: 0.8, y: 0.8 }, 500, Phaser.Easing.Bounce.Out, true);
        }
        return groupPop;
    },

    timeBar : function(scaleX,scaleY,direction,timeToFill,parameter,callback){

        var timebar = game.add.group();
        var backtime = game.add.image(0,0, 'timebarback');
        backtime.frame=0;
        var backtimegreen = game.add.image(0,0, 'timebargreen');
        backtimegreen.frame=0;

        timebar.add(backtime);
        timebar.add(backtimegreen);
        timebar.scale.setTo(scaleX,scaleY);
        if (direction<0) {
            //decrece
            //backtimegreen.anchor.set(1);
            backtimegreen.tween = game.add.tween(backtimegreen.scale).to( { x: 0, y: 1 }, timeToFill, "Sine.easeInOut", true);
        }else{
            backtimegreen.scale.setTo(0,1);
            backtimegreen.tween = game.add.tween(backtimegreen.scale).to( { x: 1, y: 1 }, timeToFill,"Sine.easeInOut", true);
        }
        backtimegreen.tween.onComplete.add(function(tweenobj,pointer){
            console.log("complete");
            callback(parameter);
        },null,0);

        
        return timebar;
    },

    iconTween:function(scaleX,scaleY,iconName){
        var icon=game.add.image(0,0,iconName);
        icon.frame=0;
        icon.scale.setTo(scaleX,scaleY);
        
        icon.makeTween = function(){
            this.tween = game.add.tween(this).to( { y: this.y - 15 }, 500, "Sine.easeInOut", true);
            this.tween.onComplete.add(function(tweenobj,pointer){
                this.tween = game.add.tween(this).to( { y: this.y + 15 }, 500, "Sine.easeInOut", true);
                this.tween.onComplete.add(function(tweenobj,pointer){
                    this.makeTween();
                },tweenobj);
            },this);
        }

        return icon;
    },
    makeBadge:function(number,badge){
        var icon=game.add.image(0,0,badge);
        icon.frame=0;
        icon.scale.setTo(0.5,0.5);

        var label=game.add.text(0,3,number,{
             font:'14px',
             fill: '#FFFFFF'
        });

        icon.anchor.set(0.5,0.5);
        label.anchor.set(0.5,0.5);

        var buttonGroup=game.add.group();
        buttonGroup.add(icon);
        buttonGroup.add(label);

        return buttonGroup;
    },

}
var Timer = {
    invervalTimer:function(callback, interval) {
        var timerId, startTime, remaining = 0;
        var state = 0; //  0 = idle, 1 = running, 2 = paused, 3= resumed

        this.pause = function () {
            if (state != 1) return;

            remaining = interval - (new Date() - startTime);
            window.clearInterval(timerId);
            state = 2;
        };

        this.resume = function () {
            if (state != 2) return;

            state = 3;
            window.setTimeout(this.timeoutCallback, remaining);
        };

        this.timeoutCallback = function () {
            if (state != 3) return;

            callback();

            startTime = new Date();
            timerId = window.setInterval(callback, interval);
            state = 1;
        };

        startTime = new Date();
        timerId = window.setInterval(callback, interval);
        state = 1;
    },
    timeOutTimer:function(callback, delay,parameter) {
        var timerId, start, remaining = delay;
        this.pause = function() {
            window.clearTimeout(timerId);
            remaining -= new Date() - start;
        };
        this.resume = function() {
            start = new Date();
            window.clearTimeout(timerId);
            timerId = window.setTimeout(callback, remaining,parameter);
        };
        this.resume();
    }
}
