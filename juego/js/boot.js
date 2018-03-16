

//Inicializar librerías o funciones del framework de Phaser

var bootState = {

	preload: function (){
		game.load.spritesheet('cheftountitle', 'assets/cheftountext.png', 104, 91);
		game.load.image('chef', 'assets/aflatounchef.png', 253, 459);
		game.load.image('menuback', 'assets/backgrund-menu.jpg', 800, 600);
		game.load.image('cargando', 'assets/cargando.png', 397, 138);

	},

	create: function (){
		console.log('boot state');
		game.stage.backgroundColor = '#FFFFFF';

		var item;
	    for (var i = 0; i < 8; i++){
	        item = game.add.sprite(150 + 70 * i, -101, 'cheftountitle', i);
	        item.anchor.setTo(0.5,0.5);
	        item.scale.setTo(0.8,0.8);
	        // Add a simple bounce tween to each character's position.
	        game.add.tween(item).to({y: 380}, 2400, Phaser.Easing.Bounce.Out, true, 1000 + 400 * i, 0);

	        // Add another rotation tween to the same character.
	        var res = game.add.tween(item).to({angle: 360}, 2400, Phaser.Easing.Cubic.In, true, 1000 + 400 * i, 0);
	        if (i==7) {
	        	res.onComplete.add(function(twobj,pointer){
	        		setTimeout(function(){ 
	        			game.state.start('load');
	        		},2000);
	        		
	        	});
	        }
	    }

	    item = game.add.sprite(0,200, 'chef');
	    item.anchor.setTo(0.5,0.5);
	    item.scale.setTo(0.5,0.5);
	    item.alpha = 0;
	    item.x = game.world.centerX;
	    game.add.tween(item).to({alpha: 1}, 1400, Phaser.Easing.Cubic.In, true, 0, 0);


	}
}