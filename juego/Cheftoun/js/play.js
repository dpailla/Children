
var horaReloj = 5;
var horaRelojSegundero = 0;
var numeroCliente = 0;
var clientesEnCola = [];
var cuentaBancaria = 450;
var cuentaBancariaAnterior = 450;
var bancoLabel = undefined;
var menuRefri = undefined;
var ingredienteSeleccionado = undefined;
var clienteSeleccionado = undefined;
var objectoSeleccionado = {'objeto': null,'tipo':'0'};

var ingredientesComprar = [];


var vaso;
var plato;
var licuadora;
var sarten;
var tabla;
var fxselect = undefined;
var fxnegative = undefined;
var fxmoney = undefined;
var fxcashier = undefined;
var fxbell = undefined;
var fxaplausos = undefined;
var fxperder = undefined;
var totalPagar = 0;
var firstTime = true;
var firstIngredient = true;
var tiempoEsperaCliente = 120000;

function onDragStart(sprite, pointer) {
    result = "Dragging " + sprite.key;
}

function onDragStop(sprite, pointer) {
    result = sprite.key + " dropped at x:" + pointer.x + " y: " + pointer.y;
}

var playState = {
	create: function (){

		this.backgroundSound = game.add.audio('sfx-ambient');
		//backgroundSound.volume=0.5;
		this.backgroundSound.loopFull();

		console.log('play state');
		fxselect = game.add.audio('sfx-selectobj');
		fxnegative = game.add.audio('sfx-negative');
		fxmoney = game.add.audio('sfx-money');
		fxcashier = game.add.audio('sfx-cashier');
		fxbell = game.add.audio('sfx-bell');
		fxaplausos = game.add.audio('sfx-aplausos');
		fxperder = game.add.audio('sfx-perder');

		var kitchenback = game.add.image(0,0,'playback');
        kitchenback.frame=0;
        kitchenback.width = game.world.width;
        kitchenback.height = game.world.height;

		horaReloj = 5;
		horaRelojSegundero = 0;
		numeroCliente = 0;
		clientesEnCola = [];
		cuentaBancaria = 450;
		bancoLabel = undefined;






		//crear reloj
		var relojLabel = game.add.text(0,10,("0" + horaReloj).slice(-2)+':00',{
			font:'18px',
			fill: '#FFFFFF'
		});
		relojLabel.x = game.world.width - relojLabel.width - 20;

		this.relojIntervalo = new Timer.invervalTimer(function () {
	        //cambiar hora
			horaRelojSegundero = horaRelojSegundero + 1; 
			if (horaRelojSegundero == 60) {
				horaRelojSegundero = 0;
				horaReloj = horaReloj + 1;
				if (horaReloj == 24) {
					horaReloj = 0;
				}
			}
			relojLabel.text =  ("0" + horaReloj).slice(-2)+':'+ ("0" + horaRelojSegundero).slice(-2);
	    }, 500);

		//crear cuenta bancaria
		bancoLabel = game.add.text(20,10,cuentaBancaria+' monedas',{
			font:'18px',
			fill: '#FFFFFF'
		});

		//poner los elementos gráficos
		//mesa
		var mesa=game.add.image(0,0,'mesa');
        mesa.frame=0;
        mesa.scale.setTo(utils.getRelativeSize(mesa.width),utils.getRelativeSize(mesa.width));
        mesa.y= game.world.height - mesa.height;
        //refri
		this.refri=game.add.image(0,0,'refri');
        this.refri.frame=0;
        this.refri.inputEnabled = true;
        this.refri.scale.setTo(0.4,0.4);
        this.refri.y= game.world.centerY - mesa.height*0.5 - 20;
        this.refri.x= game.world.centerX;

		

		//licuadora
		licuadora = LicuadoraClass.init();
		//sarten
		sarten = SartenClass.init();
		//sarten
		tabla = TablaClass.init();
        //vaso
		vaso = VasoClass.init();
		//plato
		plato = PlatoClass.init();

		

        //plato Hondo
		// var platoHondo=game.add.image(0,0,'platoHondo');
  //       platoHondo.frame=0;
  //       platoHondo.scale.setTo(0.35,0.35);
  //       platoHondo.y = game.world.centerY + 30;
  //       platoHondo.x = 160;

        


        menuRefri = menuIngredientes.init();
        //poner los ingredientes
		menuRefri.configureScroller(ingredientes,0,80,this.game.world.width,100);
		this.refri.events.onInputDown.add(function(icon,pointer){
			menuRefri.openMenu();
		},null,0);


		//store icon
		this.storeIcon=game.add.image(0,0,'store');
        this.storeIcon.frame=0;
        this.storeIcon.inputEnabled = true;
        this.storeIcon.scale.setTo(0.3,0.3);
        this.storeIcon.y= game.world.height - 70;
        this.storeIcon.x= 20;
		
		this.storeIcon.events.onInputDown.add(function(icon,pointer,gameobj){
			//game.paused = true;
			gameobj.stopGame();


			//poner los ingredientes
			var popUpStore = Store.init();
			popUpStore.configureScroller(ingredientes,0,40,game.world.width*0.8,game.world.height*0.8,gameobj);
			popUpStore.openMenu();
		},null,0,this);


		this.aflachef = game.add.sprite(game.world.centerX-100,game.world.centerY-30, 'aflachef');
		this.aflachef.scale.setTo(0.7,0.7);
		this.aflachef.animations.add('play');
	    this.aflachef.animations.play('play', 2, true);
		
	},


	update: function(){
		bancoLabel.text = cuentaBancaria+' monedas';



		

		if (clientesEnCola.length==0) {
			//asignar nuevo cliente


			numeroCliente++;

			var ctemp = Cliente.init(numeroCliente);
			
			this.clienteTimeOut = new Timer.timeOutTimer(function(ctempi){
				console.log(ctempi);

				if (ctempi.clienteSprite==undefined) {
					ctempi.ingresoAnimacion() 
				}else if (ctempi.clienteSprite.alive == false){
					ctempi.ingresoAnimacion() 
				}
				
			}, 2000,ctemp);
			
			//label present cliente
			// ctemp.tiempExpired = game.add.text(20,30*(clientesEnCola.length+1),'Cliente #: '+numeroCliente+' | ',{
			// 	font:'18px',
			// 	fill: '#000000'
			// });
			

			clientesEnCola.push(ctemp);
		}
		if (clientesEnCola.length>0) {
			for (var i = clientesEnCola.length - 1; i >= 0; i--) {
				
				//clientesEnCola[i].tiempExpired.text = 'Cliente #: '+clientesEnCola[i].idcliente;

			}
		}
	},

	stopGame:function(){
		this.backgroundSound.volume=0.5;
		this.relojIntervalo.pause();
		if (this.clienteTimeOut!=undefined){this.clienteTimeOut.pause()};
		for (var i = clientesEnCola.length - 1; i >= 0; i--) {
			clientesEnCola[i].pause();
		}

		//fondo negro
		this.FondoNegro = game.add.tileSprite(0, 0, game.world.width, game.world.height, 'blackTiled', 0);
        this.FondoNegro.alpha = 0.5;
        this.FondoNegro.inputEnabled = true;

	},
	resumeGame:function(){
		this.backgroundSound.volume=1;
		this.relojIntervalo.resume();
		if (this.clienteTimeOut!=undefined){this.clienteTimeOut.resume()};
		for (var i = clientesEnCola.length - 1; i >= 0; i--) {
			clientesEnCola[i].resume();
		}


		this.FondoNegro.destroy();
	}
}
function checkNivel(){
	var gano = true;
	if (cuentaBancariaAnterior > cuentaBancaria) {
		gano = false;
	}
	if (cuentaBancaria<0) {
		fxperder.play();
		//perdiste el juego
		alert("PERDISTE");
		
		location.reload();
	}else if(cuentaBancaria>=1000 && cuentaBancaria<2000){
		tiempoEsperaCliente = 90000;
		
		if (gano) {fxaplausos.play();}
	}else if(cuentaBancaria>=2000 && cuentaBancaria<3000){
		tiempoEsperaCliente = 80000;
		if (gano) {fxaplausos.play();}
	}else if(cuentaBancaria>=3000 && cuentaBancaria<4000){
		tiempoEsperaCliente = 70000;
		if (gano) {fxaplausos.play();}
	}else if(cuentaBancaria>=4000 && cuentaBancaria<5000){
		tiempoEsperaCliente = 60000;
		if (gano) {fxaplausos.play();}
	}else if (cuentaBancaria>=5000) {
		fxaplausos.play();
		alert("GANASTE");
		
		location.reload();
	}
}


