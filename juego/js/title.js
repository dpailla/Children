

//primera vez que ingresa al juego
var primeraVez = true;


var titleState = {
	preload:function(){
		game.add.sprite(0,0, 'menuback');
	},

	create: function (){
		console.log('title state');
		var botonInicioESP = utils.makeButton("ESPAÑOL",function(){
			idioma.setidioma("ESP");
			//ver si el niño ha ingresado algunav vez
			rest.getPuntaje(1,function(puntajeNino){
				if (puntajeNino.length>0) {
					//existe un puntaje
					primeraVez = false;
					console.log("Ya ha ingresado");
					game.state.start('menu');

				}else{
					var ingresoLabel = game.add.text(0,50,'Primera vez que ingresa.\nSe muestra Guía interactiva',{font:'20px Verdana',fill:'#ffffff'});
					ingresoLabel.x = game.world.centerX - (ingresoLabel.width / 2);
				}

			});
		},this);
	
	
		
		var botonInicioING = utils.makeButton("ENGLISH",function(){
            idioma.setidioma("ENG");
			//ver si el niño ha ingresado algunav vez
			rest.getPuntaje(1,function(puntajeNino){
				if (puntajeNino.length>0) {
					//existe un puntaje
					primeraVez = false;
					console.log("Ya ha ingresado");
					game.state.start('menu');

				}else{
					var ingresoLabel = game.add.text(0,50,'Primera vez que ingresa.\nSe muestra Guía interactiva',{font:'20px Verdana',fill:'#ffffff'});
					ingresoLabel.x = game.world.centerX - (ingresoLabel.width / 2);
				}

			});
		},this);


	
		botonInicioESP.x=game.world.centerX;
		botonInicioING.x=game.world.centerX;

		botonInicioESP.y=150;
		botonInicioING.y=250;

		game.input.activePointer.capture = true;
		game.stage.backgroundColor = colorFondo;


		
	},
	update: function(){
		if (game.input.activePointer.isDown) {
			//game.state.start('play');
		}
	}
}