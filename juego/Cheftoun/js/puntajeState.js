var scroller;

var puntajeState = {
	create: function (){
		console.log('puntaje state');
		//console.log(puntaje);
		game.stage.backgroundColor =colorFondo;

		
		
		var a = new Array();
		var valor1= 0;
		var valor2=0;
		var valor3 = 0;
		fLen = puntajes.length;
		for (i = 0; i < fLen; i++) {
			valor2= puntajes[i].id;
			valor1= puntajes[i].puntaje;
			valor3 = valor1*100000+valor2;
			a.push(valor3);
		}
		a.sort(function(a, b){return b-a});
		console.log(a);
		
		
		var bpmText;
		var text = "GAMER 1 ................ 100 PTS";
		var bVolver = utils.makeButton(idioma.getTraduccion("REGRESAR"),function(){
			game.state.start('menu');
		},this);

		bVolver.x=150;
		bVolver.y = 100;

	    var purged = 100;

	   /* game.add.bitmapText(100, 200, 'gem', "JUGADOR 1................." + purged + " PUNTOS", 32);
	    game.add.bitmapText(100, 240, 'gem', "JUGADOR 2................." + purged + " PUNTOS", 32);
	    game.add.bitmapText(100, 280, 'gem', "JUGADOR 3................." + purged + " PUNTOS", 32);
	    game.add.bitmapText(100, 320, 'gem', "JUGADOR 4................." + purged + " PUNTOS", 32);
*/

	    game.add.bitmapText(100, 200, 'gem', "JUGADOR"+  (a[0]%10000) +"................." + Math.trunc(a[0]/100000)+ " PUNTOS", 32);
	    game.add.bitmapText(100, 240, 'gem', "JUGADOR"+  (a[1]%10000) +"................." + Math.trunc(a[1]/100000)+ " PUNTOS", 32);
	    game.add.bitmapText(100, 280, 'gem', "JUGADOR"+  (a[2]%10000) +"................." + Math.trunc(a[2]/100000)+ " PUNTOS", 32);
	    game.add.bitmapText(100, 320, 'gem', "JUGADOR"+  (a[3]%10000) +"................." + Math.trunc(a[3]/100000)+ " PUNTOS", 32);
	    game.add.bitmapText(100, 360, 'gem', "JUGADOR"+  (a[4]%10000) +"................." + Math.trunc(a[4]/100000)+ " PUNTOS", 32);





	    var params = {
	    	horizontalScroll : true,
	    };
	 //    scroller = game.add.existing(new ScrollableArea(0, 400, 500, 300, params));
	 //    var textStyle = {font:"30px Arial", fill:"#ffff00"};
		// for (var i=0;i<10;i++) {
		// 	for (var j=0;j<80;j++) {
		// 		var text = game.make.text(i*330, j*30, "Yes, everything scrolls", textStyle);
		// 		scroller.addChild(text);
		// 	}
		// }
		// scroller.start();


	},

	update: function(){
		
	}

}


