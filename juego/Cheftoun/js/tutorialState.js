

var tutorialState = {
	create: function (){
		console.log('tutorial state');
		console.log(platos);
var video;
var sprite;

		game.stage.backgroundColor =colorFondo;
		video = game.add.video('chrome');
		sprite = video.addToWorld(game.world.centerX, game.world.centerY, 0.5, 0.5, 2, 2);
		//  true = loop
		video.play(true);
		game.input.onDown.add(function (){
    						 video.paused = (video.paused) ? false : true;
		
							}, this);


		var bVolver = utils.makeButton(idioma.getTraduccion("REGRESAR"),function(){
			game.state.start('menu');
		},this);

		bVolver.x=150;
		bVolver.y = 100;



	},

	update: function(){
		
	}

}


