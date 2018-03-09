

//primera vez que ingresa al juego


var menuState = {
	preload:function(){
		game.add.sprite(0,0, 'menuback');
	},
	create: function (){
		console.log('menu state');
		var bJugar = utils.makeButton(idioma.getTraduccion("JUGAR"),function(){
			//jugar
			game.state.start('play');
		},this);

		var bRanking = utils.makeButton(idioma.getTraduccion("PUNTAJE"),function(){
			game.state.start('puntajeState');
		},this);

		var bTutorial = utils.makeButton(idioma.getTraduccion("TUTORIAL"),function(){
			game.state.start('tutorialState');
		},this);

		bJugar.x=game.world.centerX;
		bRanking.x=game.world.centerX;
		bTutorial.x=game.world.centerX;

		bJugar.y = 150;
		bRanking.y = 250;
		bTutorial.y = 350;
		
		game.input.activePointer.capture = true;
		
	},
	update: function(){

	}
}