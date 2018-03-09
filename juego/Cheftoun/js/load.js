
//Función que inicia al ejecutarse el juego.
//Se encarga de traer todos los datos necesarios de la base de datos
var isLoaded = false;

var loadState = {
	preload: function (){

		
		game.add.sprite(0,0, 'menuback');
		var cargando = game.add.sprite(0,160, 'cargando');
		cargando.anchor.setTo(0.5,0.5);
		cargando.x = game.world.centerX;

		game.stage.backgroundColor = colorFondo;
		//var loadingLabel = game.add.text(80,150,'cargando...',{font:'30px Verdana',fill:'#000000'});
		game.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL;
		game.scale.PageAlignHorizontally = true;
		game.scale.PageAlignVertically = true;
		

		//cargar contenido gráfico
		game.load.spritesheet("boton","assets/img/boton.png",640,220);
		game.load.spritesheet("icon_comida","assets/img/icon_comida.png",150,150);
		game.load.spritesheet("popupBg","assets/img/popupBg.jpg",800,480);
		game.load.spritesheet("closeIcon","assets/img/closeIcon.png",150,150);
		game.load.image("blackTiled","assets/img/blackTiled.png",20,20);
		game.load.image("whiteBack","assets/img/whiteBack.png",20,20);
		game.load.image("foodph","assets/img/foodph.jpg",600,600);
		game.load.image("playback","assets/img/cocinabackground.jpg",800,600);
		game.load.video('chrome',"/assets/video/chrome.webm");
	    game.load.bitmapFont('gem', 'assets/fonts/bitmapFonts/gem.png', 'assets/fonts/bitmapFonts/gem.xml');

	    //timebars

	    game.load.image("timebarback","assets/img/timebarback.png",160,15);
	    game.load.image("timebargreen","assets/img/timebargreen.png",160,15);
	    game.load.spritesheet("alerta","assets/img/alert.png",50,50);
	    game.load.spritesheet("badge","assets/img/badge.png",50,50);
	    game.load.spritesheet("badgegreen","assets/img/badgegreen.png",50,50);
	    
		game.load.image("mesa","assets/img/mesa.png",1280,429);
		game.load.image("refri","assets/img/refrigeradora.png",300,493);
		//game.load.image("icon-default.png","assets/img/icon-default.png",300,493);
		game.load.image("fselect","assets/img/frameSelect.png",89,107);
		game.load.image("menuRefriBack","assets/img/refriBackMenu.png",950,113);
		game.load.image("store","assets/img/store.png",250,250);
		game.load.image("storeback","assets/img/storeback.jpg",600,512);
		game.load.image("addicon","assets/img/add.png",50,50);
		game.load.image("minusicon","assets/img/minus.png",50,50);




		game.load.image("licuadora","assets/img/licuadora.png",150,206);
		game.load.image("sarten","assets/img/sarten.png",250,130);
		game.load.image("platoHondo","assets/img/plato-hondo.png",150,150);
		game.load.spritesheet("plato","assets/img/plato.png",315,150);
		game.load.spritesheet("vaso","assets/img/vaso.png",150,150);
		game.load.spritesheet("tablacortar","assets/img/tablacortar.png",250,98);
		game.load.spritesheet("client1","assets/img/client1.png",93,118);
		game.load.spritesheet("aflachef","assets/img/aflachef.png",272,317);



		//ingredientes
		game.load.image("aceite-oliva","assets/img/aceite-oliva.png",150,150);
		game.load.image("aguacate","assets/img/aguacate.png",150,150);
		game.load.image("albondiga","assets/img/albondiga.png",150,150);
		game.load.image("almendra","assets/img/almendra.png",150,150);
		game.load.image("arroz","assets/img/arroz.png",150,150);
		game.load.image("banano","assets/img/banano.png",150,150);
		game.load.image("cereal","assets/img/cereal.png",150,150);		
		game.load.image("cereza","assets/img/cereza.png",150,150);
		game.load.image("coco","assets/img/coco.png",150,150);
		game.load.image("crema-chantilly","assets/img/crema-chantilly.png",150,150);
		game.load.image("dulce-leche","assets/img/dulce-leche.png",150,150);
		game.load.image("durazno","assets/img/durazno.png",150,150);
		game.load.image("fideo-tallarin","assets/img/fideo-tallarin.png",150,150);
		game.load.image("fideo-tornillo","assets/img/fideo-tornillo.png",150,150);
		game.load.image("frutilla","assets/img/frutilla.png",150,150);
		game.load.image("limon","assets/img/limon.png",150,150);
		game.load.image("helado-vainilla","assets/img/helado-vainilla.png",150,150);
		game.load.image("huevo","assets/img/huevo.png",150,150);
		game.load.image("kiwi","assets/img/kiwi.png",150,150);
		game.load.image("leche","assets/img/leche.png",150,150);
		game.load.image("lechuga","assets/img/lechuga.png",150,150);
		game.load.image("lomos-atun","assets/img/lomos-atun.png",150,150);
		game.load.image("manzana","assets/img/manzana.png",150,150);
		game.load.image("mayonesa","assets/img/mayonesa.png",150,150);
		game.load.image("mermelada","assets/img/mermelada.png",150,150);
		game.load.image("miel","assets/img/miel.png",150,150);
		game.load.image("mora","assets/img/mora.png",150,150);
		game.load.image("naranja","assets/img/naranja.png",150,150);
		game.load.image("nuez","assets/img/nuez.png",150,150);
		game.load.image("pan","assets/img/pan.png",150,150);
		game.load.image("pescado","assets/img/pescado.png",150,150);
		game.load.image("pimienta","assets/img/pimienta.png",150,150);
		game.load.image("pimiento-rojo","assets/img/pimiento-rojo.png",150,150);
		game.load.image("pimiento-verde","assets/img/pimiento-verde.png",150,150);
		game.load.image("platano","assets/img/platano.png",150,150);
		game.load.image("pollo","assets/img/pollo.png",150,150);
		game.load.image("queso","assets/img/queso.png",150,150);
		game.load.image("sal","assets/img/sal.png",150,150);
		game.load.image("salsa-cesar","assets/img/salsa-cesar.png",150,150);
		game.load.image("salsa-tomate","assets/img/salsa-tomate.png",150,150);
		game.load.image("sandia","assets/img/sandia.png",150,150);
		game.load.image("tomate","assets/img/tomate.png",150,150);
		game.load.image("uva","assets/img/uvas.png",150,150);
		game.load.image("agua","assets/img/agua.png",150,150);
		
		

		

		//audio
		game.load.audio('sfx-licuadora', 'assets/audio/sfx-licuadora.mp3');
		game.load.audio('sfx-selectobj', 'assets/audio/sfx-selectobj.mp3');
		game.load.audio('sfx-correct', 'assets/audio/sfx-correct.mp3');
		game.load.audio('sfx-negative', 'assets/audio/sfx-negative.mp3');
		game.load.audio('sfx-freir', 'assets/audio/freir.mp3');
		game.load.audio('sfx-cuttable', 'assets/audio/cuttable.mp3');
		game.load.audio('sfx-money', 'assets/audio/money.mp3');
		game.load.audio('sfx-ambient', 'assets/audio/ambient.mp3');
		game.load.audio('sfx-cashier', 'assets/audio/cash.mp3');
		game.load.audio('sfx-bell', 'assets/audio/bell.mp3');
		game.load.audio('sfx-aplausos', 'assets/audio/aplausos.mp3');
		game.load.audio('sfx-perder', 'assets/audio/perder.mp3');



		//cargar contenido de audio


		//cargar contenido de la base de datos por medio del webservice
		console.log("load state");
		rest.getPlatos();
		rest.getIngredientes();
		rest.getPuntaje2(puntajes);
		

	},
	create: function(){
		

	},
	update: function(){
		//is loaded es true cuando ya obtiene todos los datos del webservice
		if (isLoaded) {
			game.state.start('title');
		}
	}
}

