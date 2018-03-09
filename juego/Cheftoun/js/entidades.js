var Cliente = {
	init : function(idcliente){
		//setear apariencia


		this.horaDeOrden = 0;
		this.idcliente = idcliente;
		this.bebidaEntregada = false;
		this.platoEntregado = false;
		this.pedirInterval = undefined;
		this.clienteSprite = undefined;
		this.timebar = undefined;

		//elegir plato acorde a hora.
		var platosPosibles = [];
		var bebidasPosibles = [];

		platos.forEach(function(plato,index){
			//añadir si es que es bedidas
			if (plato.tipoPlato.tipo == "Bebidas") {
				bebidasPosibles.push(plato);
			}else{
				posible = false;
				plato.horarios.forEach(function(horario,indexHorario){
					
					inicio = parseInt(horario.horario.horaInicio.substring(0,2));
					final = parseInt(horario.horario.horaFinal.substring(0,2));
					if (horaReloj >= inicio && horaReloj < final) {
						posible = true;
					}
				});
				if (posible) {
					platosPosibles.push(plato);
				}
			}
		});
		

		//seleccionar bebida
		if (bebidasPosibles.length>0) {
			random = utils.randomIntFromInterval(0,bebidasPosibles.length-1);
			this.bebidaSeleccionada = bebidasPosibles[random];
		}
		
		//seleccionar plato
		if (platosPosibles.length>0) {
			random = utils.randomIntFromInterval(0,platosPosibles.length-1);
			this.platoSeleccionado = platosPosibles[random];
		}

		


		return this;
	},
	ingresoAnimacion:function(){

		//cliente imagen
		this.clienteSprite = game.add.sprite(-93, 230, 'client1');
		var walk = this.clienteSprite.animations.add('play');
	    this.clienteSprite.animations.play('play', 5, true);
	    this.ingresoAnimacionTween = game.add.tween(this.clienteSprite).to( { x: [ 50 ], y: [ 240,230, 240,230 ] }, 3000, "Sine.easeInOut", true);
	    this.pedirInterval = new Timer.timeOutTimer(function (client) {
	    	if (client.timebar==undefined) {
	    		client.pedirOrden();
	    	}
		}, 3000,this);


	},
	pedirOrden:function(){
		//asignar tiempo de espera propio
		this.ordenEntregada = false;
		//tiene 60 segundos para recibir la orden
		// var interval = setInterval(function(client){ 
		// 	client.horaDeOrden = client.horaDeOrden + 1;
		// 	if (client.horaDeOrden==60) {
				
		// 	}

		// }, 1000,this);
		// this.interval = interval;

		

		//tiene 60 segundos para recibir la orden
		this.timebar = utils.timeBar(0.5,0.5,-1,tiempoEsperaCliente,this,function(client){
			console.log("timebar cliente:"+ client.idcliente);
			console.log("cola cliente:"+ clientesEnCola[0].idcliente);
			if (client.ordenEntregada == false && clientesEnCola[0].idcliente == client.idcliente) {
				//qutiar cliente y bajar puntos
				 


				for (var i = clientesEnCola.length - 1; i >= 0; i--) {
					if (clientesEnCola[i].idcliente == client.idcliente){
						//if (clientesEnCola[i].getTimeToExpire()==0) {
							//limpiar todo1
							if (clienteSeleccionado!=undefined) {
								if (clienteSeleccionado.icons!=undefined) {
									clienteSeleccionado.icons.destroy();
								}
								
							}
							
							clienteSeleccionado = undefined;
							ingredienteSeleccionado = undefined;
							objectoSeleccionado = {'objeto': null,'tipo':'0'};
							vaso.limpiar();
							plato.limpiar();
							licuadora.limpiar();
							sarten.limpiar();
							tabla.limpiar();
							if (clientesEnCola[i].timebar.children[1]!=undefined) {
								game.tweens.remove(clientesEnCola[i].timebar.children[1].tween);
							}
							
							clientesEnCola[i].timebar.destroy();
							clientesEnCola[i].timebar = undefined;
							clientesEnCola[i].iconComida.destroy();
							
							//clientesEnCola[i].clienteSprite.destroy();
							clientesEnCola[i].ingresoAnimacionTween = game.add.tween(clientesEnCola[i].clienteSprite).to( { x: [ -100 ], y: [ 230,240, 230,240 ] }, 2000, "Sine.easeInOut", true);
							clientesEnCola[i].ingresoAnimacionTween.onComplete.add(function(twobj,pointer){
								twobj.destroy();
								if (firstTime) {
									firstTime = false;
									game.state.states[game.state.current].stopGame();
									var backgroundGlobo = game.add.image(0,0,'whiteBack');
								    var textoGlobo = game.add.text(0,0,"¡Perdimos al cliente! pero no importa sigamos intentándolo. Recuerda que puedes comprar y vender ingredientes en la tienda",
								    	{ font: 'bold 20pt Arial', fill: 'black', align: 'left', wordWrap: true, wordWrapWidth: 450 });
							        backgroundGlobo.anchor.set(0.5,0.5);
							        textoGlobo.anchor.set(0.5,0.5);
							        var globo=game.add.group();
							        globo.add(backgroundGlobo);
							        globo.add(textoGlobo);
							        backgroundGlobo.width = globo.width + 50;
							        backgroundGlobo.height = globo.height+ 40;
							        textoGlobo.x+=10;
							        textoGlobo.y+=10;
							        globo.x = 400;
							        globo.y= 300;
							        game.state.states[game.state.current].globo = globo;
							        game.state.states[game.state.current].globo.children[0].inputEnabled = true;
							        game.state.states[game.state.current].globo.children[0].events.onInputDown.add(function(icon,pointer,gameobj){
							        	if (game.state.states[game.state.current].globo) {
											game.state.states[game.state.current].globo.destroy();
											game.state.states[game.state.current].resumeGame();
										}
									},null,0,this);
							        
								}

							});
							clientesEnCola.splice(i, 1);
						//}
					}
				}
				fxbell.play();
				cuentaBancaria = cuentaBancaria - client.bebidaSeleccionada.tipoPlato.costo -  client.platoSeleccionado.tipoPlato.costo;
				checkNivel();
			
			}
		});
		this.timebar.x = 80;
		this.timebar.y = 205;

		//add icon food
		this.iconComida = utils.makeIcon("icon_comida");
		this.iconComida.x = 20;
		//this.iconComida.y = 200*(clientesEnCola.length) - 10;
		this.iconComida.y = 200 - 10;
		this.iconComida.inputEnabled = true;

		this.iconComida.events.onInputDown.add(function(icon,pointer,client){
			if (game.state.states[game.state.current].globo) {
				game.state.states[game.state.current].globo.destroy();
			}
			
			
			
			var foto = game.make.image(0,0,'foodph');
	        foto.frame=0;
	        foto.scale.setTo(0.6,0.6);

	        var listaString = client.platoSeleccionado.nombre + "\n";

	        for (var i = client.platoSeleccionado.ingredientes.length - 1; i >= 0; i--) {
	        	var platoTemp = client.platoSeleccionado.ingredientes[i];
	        	listaString+= '('+platoTemp.cantidad+') '+platoTemp.ingrediente.ingrediente+'\n';

	        }

	        listaString+= '\n'+client.bebidaSeleccionada.nombre  + "\n";
	        for (var i = client.bebidaSeleccionada.ingredientes.length - 1; i >= 0; i--) {
	        	var platoTemp = client.bebidaSeleccionada.ingredientes[i];
	        	listaString+= '('+platoTemp.cantidad+') '+platoTemp.ingrediente.ingrediente+'\n';

	        }

	        var lista = game.make.text(0,0, listaString,{
				font:'20px',
			});


	        //
	        var popUp = utils.popUp();

			//boton realizar pedido
			var btomarPedido = utils.makeButton("Tomar pedido",function(imagen,pointer,parameters){
				//jugar
				if (firstTime && clienteSeleccionado==undefined) {
					game.state.states[game.state.current].resumeGame();
					game.time.events.add(Phaser.Timer.SECOND * 1, function(){
						game.state.states[game.state.current].stopGame();
						var backgroundGlobo = game.add.image(0,0,'whiteBack');
					    var textoGlobo = game.add.text(0,0,"Para preparar un plato selecciona los ingredientes dentro de la refrigeradora.",
					    	{ font: 'bold 20pt Arial', fill: 'black', align: 'left', wordWrap: true, wordWrapWidth: 450 });

				        backgroundGlobo.anchor.set(0.5,0.5);
				        textoGlobo.anchor.set(0.5,0.5);
				        var globo=game.add.group();
				        globo.add(backgroundGlobo);
				        globo.add(textoGlobo);
				        backgroundGlobo.width = globo.width + 50;
				        backgroundGlobo.height = globo.height+ 40;
				        textoGlobo.x+=10;
				        textoGlobo.y+=10;
				        globo.x = 400;
				        globo.y= 450;
				        game.state.states[game.state.current].globo = globo;
						game.world.bringToTop(game.state.states[game.state.current].refri);
					}, this);
				}
				fxselect.play();
				if (clienteSeleccionado==undefined) {
					clienteSeleccionado = parameters[0];
					clienteSeleccionado.mostrarIngredientes();

				}else{
					clienteSeleccionado = parameters[0];
				}
				parameters[1].popup.close(parameters[1]);

			},this,[client,popUp]);
			btomarPedido.scale.setTo(0.5,0.5);


			popUp.popup.open(false,foto,lista,btomarPedido);

		},null,0,this);


		//tutorial first time
		if (firstTime) {
			game.state.states[game.state.current].stopGame();
			var backgroundGlobo = game.add.image(0,0,'whiteBack');
		    var textoGlobo = game.add.text(0,0,"¡Bienvenido a tu Cocina! Para preparar un plato primero debes seleccionar el pedido de un cliente. Haz click en el ícono de la izquierda y toma el pedido",
		    	{ font: 'bold 20pt Arial', fill: 'black', align: 'left', wordWrap: true, wordWrapWidth: 450 });

	        backgroundGlobo.anchor.set(0.5,0.5);
	        textoGlobo.anchor.set(0.5,0.5);
	        var globo=game.add.group();
	        globo.add(backgroundGlobo);
	        globo.add(textoGlobo);
	        backgroundGlobo.width = globo.width + 50;
	        backgroundGlobo.height = globo.height+ 40;
	        textoGlobo.x+=10;
	        textoGlobo.y+=10;
	        globo.x = 400;
	        globo.y= 250;
	        game.state.states[game.state.current].globo = globo;
	        game.state.states[game.state.current].globo.children[0].inputEnabled = true;
			game.state.states[game.state.current].globo.children[0].events.onInputDown.add(function(icon,pointer,gameobj){
	        	if (game.state.states[game.state.current].globo) {
					game.state.states[game.state.current].globo.destroy();
					game.state.states[game.state.current].resumeGame();
				}
			},null,0,this);

			game.world.bringToTop(this.iconComida);
		}
		
	},
	recibirOrden:function(){
		//chequear plato
		if (this.platoEntregado && this.bebidaEntregada) {
			clienteSeleccionado.icons.destroy();
			//plato es correcto se aumenta la cuenta y se quita de la cola
			fxmoney.play();
			
			if (this.ordenEntregada!=undefined) {
				this.ordenEntregada = true;
				for (var i = clientesEnCola.length - 1; i >= 0; i--) {
					if (clientesEnCola[i].idcliente == this.idcliente){
						//clientesEnCola[i].tiempExpired.destroy();
						if (clientesEnCola[i].timebar.children[1]!=undefined) {
							game.tweens.remove(clientesEnCola[i].timebar.children[1].tween);
						}
						
						clientesEnCola[i].timebar.destroy();
						clientesEnCola[i].timebar = undefined;
						clientesEnCola[i].iconComida.destroy();
						//clientesEnCola[i].clienteSprite.destroy();
						clientesEnCola[i].ingresoAnimacionTween = game.add.tween(clientesEnCola[i].clienteSprite).to( { x: [ -100 ], y: [ 230,240, 230,240 ] }, 2000, "Sine.easeInOut", true);
						clientesEnCola[i].ingresoAnimacionTween.onComplete.add(function(twobj,pointer){
							twobj.destroy();
							if (firstTime) {
								firstTime = false;
								game.state.states[game.state.current].stopGame();
								var backgroundGlobo = game.add.image(0,0,'whiteBack');
							    var textoGlobo = game.add.text(0,0,"¡FELICIDADES! entregaste tu primer plato. Sigue así para ganar el juego. Recuerda que puedes comprar y vender ingredientes en la tienda",
							    	{ font: 'bold 20pt Arial', fill: 'black', align: 'left', wordWrap: true, wordWrapWidth: 450 });

						        backgroundGlobo.anchor.set(0.5,0.5);
						        textoGlobo.anchor.set(0.5,0.5);
						        var globo=game.add.group();
						        globo.add(backgroundGlobo);
						        globo.add(textoGlobo);
						        backgroundGlobo.width = globo.width + 50;
						        backgroundGlobo.height = globo.height+ 40;
						        textoGlobo.x+=10;
						        textoGlobo.y+=10;
						        globo.x = 400;
						        globo.y= 300;
						        game.state.states[game.state.current].globo = globo;
						        game.state.states[game.state.current].globo.children[0].inputEnabled = true;
						        game.state.states[game.state.current].globo.children[0].events.onInputDown.add(function(icon,pointer,gameobj){
						        	if (game.state.states[game.state.current].globo) {
										game.state.states[game.state.current].globo.destroy();
										game.state.states[game.state.current].resumeGame();
									}
								},null,0,this);
							}

						});
						clientesEnCola.splice(i, 1);
					}
				}
				cuentaBancaria = cuentaBancaria + this.bebidaSeleccionada.tipoPlato.costo +  this.platoSeleccionado.tipoPlato.costo;
				clienteSeleccionado = undefined;
				ingredienteSeleccionado = undefined;
				objectoSeleccionado = {'objeto': null,'tipo':'0'};
				vaso.limpiar();
				plato.limpiar();
				licuadora.limpiar();
				sarten.limpiar();
				tabla.limpiar();
				checkNivel();
			}
			
		}

	},
	getTimeToExpire:function(){
		if (this.horaDeOrden != 0) {
			return (60 - this.horaDeOrden);
		}
		return 0;
		
	},
	checkOrden:function(tipo){
		if (tipo=="plato") {
			this.platoEntregado = true;
		}
		if (tipo=="bebida") {
			this.bebidaEntregada = true;
		}
		this.recibirOrden();
	},
	pause:function(){
		if (this.ingresoAnimacionTween!=undefined){this.ingresoAnimacionTween.pause()};
		if (this.pedirInterval){this.pedirInterval.pause()};
		if (this.timebar!=undefined){this.timebar.children[1].tween.pause()};		

	},
	resume:function(){
		if (this.ingresoAnimacionTween!=undefined){this.ingresoAnimacionTween.resume()};
		if (this.pedirInterval){this.pedirInterval.resume()};
		if (this.timebar!=undefined){this.timebar.children[1].tween.resume()};
		
	},
	mostrarIngredientes:function(){
		var ingredientesPlato = this.platoSeleccionado.ingredientes;
		var ingredientesBebida = this.bebidaSeleccionada.ingredientes;
		var groupIcons = game.add.group();
		for (var i = 0; i < ingredientesPlato.length; i++) {
			var groupIconsIn = game.add.group();
			var ingrediente = ingredientesPlato[i].ingrediente;
			var backgroundI = game.add.image(i * 60 + 5 ,5,'whiteBack');
		    backgroundI.width = 50;
		    backgroundI.height = 45;
		    backgroundI.frame=0;

			var imagenIngrediente = game.add.image(i * 60+ 5,4,ingrediente.icon);
	        imagenIngrediente.frame=0;
	        imagenIngrediente.scale.setTo(0.3,0.3);

	        groupIconsIn.add(backgroundI);
	        groupIconsIn.add(imagenIngrediente);
	        groupIconsIn.identificador = "plato-"+ingrediente.id;
	        groupIcons.add(groupIconsIn);
	    }
	    for (var i = 0; i < ingredientesBebida.length; i++) {
			var groupIconsIn = game.add.group();
			var ingrediente = ingredientesBebida[i].ingrediente;
			var backgroundI = game.add.image((i + ingredientesPlato.length) * 60 + 5 ,5,'whiteBack');
		    backgroundI.width = 50;
		    backgroundI.height = 45;
		    backgroundI.frame=0;

			var imagenIngrediente = game.add.image((i + ingredientesPlato.length) * 60+ 5,4,ingrediente.icon);
	        imagenIngrediente.frame=0;
	        imagenIngrediente.scale.setTo(0.3,0.3);

	        groupIconsIn.add(backgroundI);
	        groupIconsIn.add(imagenIngrediente);
	        groupIconsIn.identificador = "bebida-"+ingrediente.id;
	        groupIcons.add(groupIconsIn);
	    }
	    groupIcons.x = game.world.centerX - (groupIcons.width/2);
	    this.icons = groupIcons;
	}
}

var menuIngredientes = {
	init : function(){
		this.scroller = undefined;

		return this;
	},
	unselect:function(){
		ingredienteSeleccionado = undefined;
		this.scroller.fselect.alpha = 0;
	},
	configureScroller : function(arrayIngredientes,x,y,w,h){
		var params = {
	    	horizontalScroll : true,
	    	verticalScroll:false,
			kineticMovement:false,
			verticalWheel:false,
	    };

	    //popupmenu
	    this.popupmenu=game.add.group();

	    //background
	    var background = game.add.image(x-100,y+20,'menuRefriBack');
	    background.width = w+200;
	    background.height = h - 30;

		this.scroller = game.add.existing(new ScrollableArea(x,y,w,h, params));
		this.scroller.fselect = game.add.image(0,0,"fselect");
        this.scroller.fselect.frame=0;
        this.scroller.fselect.scale.setTo(0.8,0.8);
        this.scroller.fselect.alpha = 0;
        this.scroller.fselect.y = 0;
		var posX = 0; 
		var posY = 1;


		var sliderGroup=game.add.group();
        var temporalScroller = this.scroller;

        sliderGroup.add(this.scroller.fselect);
		arrayIngredientes.forEach(function(ingrediente,index){
			//if (ingrediente.icon!='icon-default.png') {
				ingrediente.imagen = game.add.image(0,0,ingrediente.icon);
		        ingrediente.imagen.frame=0;
		        ingrediente.imagen.scale.setTo(0.5,0.5);
		       
		        //console.log(posX * 60);
		        if ((posX+1) * 75 >= game.world.width) {
		        	//posX = 0;
		        	//posY = posY + 1;
		        }
		        ingrediente.imagen.y = 5 * posY;
		        ingrediente.imagen.x = posX * 75;

		        //badge ingrediente
		        ingrediente.badge = utils.makeBadge(ingrediente.cantidad,'badge');
		        ingrediente.badge.x = ingrediente.imagen.x + (ingrediente.imagen.width/2);
		        ingrediente.badge.y = ingrediente.imagen.y + ingrediente.imagen.height;
		        

		        posX = posX + 1;

		        ingrediente.imagen.inputEnabled = true;

		        ingrediente.imagen.events.onInputDown.add(function(icon,pointer,ingred,scrollview){
		        	
		        	
		        	setTimeout(function(){ 
						if (scrollview.dragging==false) {
							scrollview.fselect.alpha = 1;
							scrollview.fselect.x = icon.x+5;
							ingredienteSeleccionado = ingred;
							if (firstTime && firstIngredient) {
								firstIngredient = false;
								game.state.states[game.state.current].stopGame();
								var backgroundGlobo = game.add.image(0,0,'whiteBack');
							    var textoGlobo = game.add.text(0,0,"Los ingredientes del plato se mezclan en la tabla y los ingredientes de las bebidas en la licuadora",
							    	{ font: 'bold 20pt Arial', fill: 'black', align: 'left', wordWrap: true, wordWrapWidth: 450 });

						        backgroundGlobo.anchor.set(0.5,0.5);
						        textoGlobo.anchor.set(0.5,0.5);
						        var globo=game.add.group();
						        globo.add(backgroundGlobo);
						        globo.add(textoGlobo);
						        backgroundGlobo.width = globo.width + 50;
						        backgroundGlobo.height = globo.height+ 40;
						        textoGlobo.x+=10;
						        textoGlobo.y+=10;
						        globo.x = 400;
						        globo.y= 300;
						        game.state.states[game.state.current].globo = globo;
						        game.state.states[game.state.current].globo.children[0].inputEnabled = true;
						        game.state.states[game.state.current].globo.children[0].events.onInputDown.add(function(icon,pointer,gameobj){
							    	if (game.state.states[game.state.current].globo) {
										game.state.states[game.state.current].globo.destroy();
										game.state.states[game.state.current].resumeGame();
									}
								},null,0,this);

								game.world.bringToTop(licuadora.licuadora);
								game.world.bringToTop(licuadora.badge);
								game.world.bringToTop(tabla.tabla);
								game.world.bringToTop(tabla.btnPreparar);
							}
						}
					}, 50);
		        },null,0,ingrediente,temporalScroller);

        		sliderGroup.add(ingrediente.imagen);
        		sliderGroup.add(ingrediente.badge);
			    // ingrediente.imagen.input.enableDrag();
			    // ingrediente.imagen.events.onDragStart.add(onDragStart, this);
			    // ingrediente.imagen.events.onDragStop.add(onDragStop, this);
			    
			//}
		});
		this.scroller.addChild(sliderGroup);
		this.scroller.start();

		this.popupmenu.add(background);
		this.popupmenu.add(this.scroller);


		//  And click the close button to close it down again
        var closeButton = game.make.sprite(game.world.centerX + 150, game.world.centerY - 100, 'closeIcon');
        closeButton.inputEnabled = true;
        closeButton.scale.setTo(0.3,0.3);
        closeButton.input.priorityID = 1;
        closeButton.input.useHandCursor = true;
        closeButton.events.onInputDown.add(function(closeIcon,pointer,winPopUp) {
            if (winPopUp.tween && winPopUp.tween.isRunning || winPopUp.scale.x === 0.1){
                return;
            }
            //winPopUp.tween = game.add.tween(winPopUp.scale).to( { x: 0, y: 0 }, 200, Phaser.Easing.Back.In, true);
            winPopUp.scale.setTo(0,0);
        }, null,0, this.popupmenu);
        this.popupmenu.add(closeButton);

        this.popupmenu.scale.set(0);
		
	},
	openMenu :function() {
		if (game.state.states[game.state.current].globo) {
			game.state.states[game.state.current].globo.destroy();
			game.state.states[game.state.current].resumeGame();
			game.world.bringToTop(game.state.states[game.state.current].aflachef);
			game.world.bringToTop(this.popupmenu);
		}
        if (this.popupmenu.tween !== null && this.popupmenu.tween != undefined){
            if (this.popupmenu.tween.isRunning || this.popupmenu.scale.x === 1) {
                return;
            }
            
        }
        //this.popupmenu.tween = game.add.tween(this.popupmenu.scale).to( { x: 1, y: 1 }, 500, Phaser.Easing.Back.Out, true);
        this.popupmenu.scale.setTo(1,1);
    }

}

var Store = {
	init : function(){
		this.scroller = undefined;
		ingredientesComprar = [];
		this.total = 0;
		this.totalVenta = 0;
		return this;
	},
	configureScroller : function(arrayIngredientes,x,y,w,h,gameobj){

		var params = {
	    	horizontalScroll : false,
	    	verticalScroll:true,
			kineticMovement:false,
			verticalWheel:false,
	    };

	    //popupmenu
	    this.popupmenu=game.add.group();

	    
	    var background = game.add.image(x,y,'storeback');
	    background.width = w;
	    background.height = h;
	    background.alpha = 1;
	    background.inputEnabled = true;
	    var tamanoScrollX = w-130;
	    var tamanoScrollY = h-120;
		this.scroller = game.add.existing(new ScrollableArea(x,y+110,tamanoScrollX,tamanoScrollY,params));
		
		var sliderGroup=game.add.group();
        var temporalScroller = this.scroller;

		//arrayIngredientes.forEach(function(ingrediente,index){
		for (var i = 0; i < arrayIngredientes.length; i++) {
				var ingrediente = arrayIngredientes[i];
			//if (ingrediente.icon!='icon-default.png') {
				var ingredienteTemporal = ingrediente;
				ingredienteTemporal.comprar = 0;
				ingredientesComprar.push(ingredienteTemporal);

				var ingredienteGroup = game.add.group();
				
				var backgroundI = game.add.image(0,0,'whiteBack');
			    backgroundI.width = tamanoScrollX;
			    backgroundI.height = 70;
			    backgroundI.frame=0;
			    backgroundI.alpha = 0.8;
		        //backgroundI.anchor.set(0.5);

				ingrediente.imagen = game.add.image(5,5,ingrediente.icon);
		        ingrediente.imagen.frame=0;
		        ingrediente.imagen.scale.setTo(0.4,0.4);

		        //badge ingrediente
		        ingrediente.badgeStore = utils.makeBadge(ingrediente.cantidad,'badge');
		        ingrediente.badgeStore.x = ingrediente.imagen.x + (ingrediente.imagen.width);
		        ingrediente.badgeStore.y = ingrediente.imagen.y + ingrediente.imagen.height - 10;



		        //nombre de ingrediente
		        var labelNombre = game.add.text(90,25,ingrediente.ingrediente,{
					font:'20px',
					fill: '#000000'
				});
				var labelCosto = game.add.text(250,25,'25 monedas',{
					font:'20px',
					fill: '#000000'
				});

				var unidadesAComprar = game.add.text(438,25,'0',{
					font:'20px',
					fill: '#000000'
				});

				var iconMinus = game.add.image(400,25,'minusicon');
		        iconMinus.frame=0;
		        iconMinus.scale.setTo(0.5,0.5);
		        iconMinus.inputEnabled = true;
		        iconMinus.events.onInputDown.add(function(icon,pointer,parameters){
		        	if (ingredientesComprar[parameters[0]].comprar - 1 >=0) {
		        		fxselect.play();
		        		ingredientesComprar[parameters[0]].comprar = ingredientesComprar[parameters[0]].comprar - 1;
		        		parameters[2].text = ingredientesComprar[parameters[0]].comprar;
		        		parameters[1].makeCount();
		        	}
				},null,0,[i,this,unidadesAComprar]);

				
				var iconAdd = game.add.image(460,25,'addicon');
		        iconAdd.frame=0;
		        iconAdd.scale.setTo(0.5,0.5);
		        iconAdd.inputEnabled = true;
		        iconAdd.events.onInputDown.add(function(icon,pointer,parameters){
		        	fxselect.play();
		        	ingredientesComprar[parameters[0]].comprar = ingredientesComprar[parameters[0]].comprar + 1;
		        	parameters[2].text = ingredientesComprar[parameters[0]].comprar;
		        	parameters[1].makeCount();

				},null,0,[i,this,unidadesAComprar]);

		       	
		       	ingredienteGroup.add(backgroundI);
		   		ingredienteGroup.add(ingrediente.imagen);
		   		ingredienteGroup.add(ingrediente.badgeStore);
		   		ingredienteGroup.add(labelNombre);
		   		ingredienteGroup.add(labelCosto);
		   		ingredienteGroup.add(iconMinus);
		   		ingredienteGroup.add(unidadesAComprar);
		   		ingredienteGroup.add(iconAdd);
		     
		        ingredienteGroup.y = (75 * i) + 5;
		        ingredienteGroup.x = 20;

		        //badge ingrediente
		        // ingrediente.badge = utils.makeBadge(ingrediente.cantidad,'badge');
		        // ingrediente.badge.x = ingrediente.imagen.x + (ingrediente.imagen.width/2);
		        // ingrediente.badge.y = ingrediente.imagen.y + ingrediente.imagen.height;
		        

		   //      ingrediente.imagen.inputEnabled = true;
		   //      ingrediente.imagen.events.onInputDown.add(function(icon,pointer,ingred,scrollview){
		        	
		        	
		   //      	setTimeout(function(){ 
					// 	if (scrollview.dragging==false) {
					// 		scrollview.fselect.alpha = 1;
					// 		scrollview.fselect.x = icon.x+5;
					// 		ingredienteSeleccionado = ingred;
					// 		console.log(ingredienteSeleccionado);

					// 	}
					// }, 50);
		   //      },null,0,ingrediente,temporalScroller);
		   		
        		sliderGroup.add(ingredienteGroup);
        		//sliderGroup.add(ingrediente.badge);
			    // ingrediente.imagen.input.enableDrag();
			    // ingrediente.imagen.events.onDragStart.add(onDragStart, this);
			    // ingrediente.imagen.events.onDragStop.add(onDragStop, this);
			    
			//}
		//});
		}	
		this.scroller.addChild(sliderGroup);
		this.scroller.start();




		this.labelComprar = game.add.text(this.scroller.width + 20.,170,'COMPRAR:\n'+ this.total+' monedas',{
			font:'20px',
			fill: '#000000'
		});

		this.btn_comprar =  utils.makeButton("Comprar",function(imagen,pointer2,parameters){
			parameters[0].comprar(parameters[1]);
		},this,[this,gameobj]);
		this.btn_comprar.scale.setTo(0.4,0.4);
		this.btn_comprar.x = this.scroller.width + 70;
		this.btn_comprar.y = 250;

		//vender
		this.labelVender = game.add.text(this.scroller.width + 20.,380,'VENDER:\n'+ this.totalVenta +' monedas',{
			font:'20px',
			fill: '#000000'
		});

		this.btn_vender =  utils.makeButton("Vender",function(imagen,pointer2,parameters){
			parameters[0].vender(parameters[1]);
		},this,[this,gameobj]);
		this.btn_vender.scale.setTo(0.4,0.4);
		this.btn_vender.x = this.scroller.width + 70;
		this.btn_vender.y = 460;



		this.popupmenu.add(background);
		this.popupmenu.add(this.scroller);
		this.popupmenu.add(this.labelComprar);
		this.popupmenu.add(this.btn_comprar);
		this.popupmenu.add(this.labelVender);
		this.popupmenu.add(this.btn_vender);

		//  And click the close button to close it down again
        var closeButton = game.make.sprite(game.world.width*0.78, 20, 'closeIcon');
        closeButton.inputEnabled = true;
        closeButton.scale.setTo(0.3,0.3);
        closeButton.input.priorityID = 1;
        closeButton.input.useHandCursor = true;
        closeButton.events.onInputDown.add(function(closeIcon,pointer,winPopUp) {
            winPopUp.close();
            gameobj.resumeGame();
        }, null,0, this);
        this.popupmenu.add(closeButton);

        //this.popupmenu.anchor.set(0.5,0.5);
        //this.popupmenu.x = game.world.centerX - (this.popupmenu.children[0].width/2);
        //this.popupmenu.y = 100;
        //this.scroller.x = this.scroller.x + game.world.centerX - (this.popupmenu.children[0].width/2);
        //this.scroller.y = this.scroller.y + 100;


		game.world.bringToTop(this.popupmenu);
		
	},
	comprar:function(gameobj){
		if (this.total <= cuentaBancaria) {
			//comprar
			for (var i = 0; i < ingredientes.length; i++) {
				for (var z = 0; z < ingredientesComprar.length; z++) {
					var ingComprar = ingredientesComprar[z];
					var ing = ingredientes[i];
					if (ing.id==ingComprar.id && ingComprar.comprar>0) {
						ingredientes[i].cantidad = ing.cantidad + ingComprar.comprar;
						ingredientes[i].badge.children[1].text = ingredientes[i].cantidad;
					}
				}
			}

			cuentaBancaria = cuentaBancaria - this.total;
			fxcashier.play();
			this.close();
			gameobj.resumeGame();
			checkNivel();
		}else{
			fxselect.play();
		}

		
	},
	vender:function(gameobj){
		//verificar que el producto este disponible para vender
		var algunProductoEscaso = false;
		for (var i = 0; i < ingredientes.length; i++) {
			for (var z = 0; z < ingredientesComprar.length; z++) {
				var ingComprar = ingredientesComprar[z];
				var ing = ingredientes[i];
				if (ing.id==ingComprar.id && ingComprar.comprar>0) {
					if (ing.cantidad < ingComprar.comprar) {
						algunProductoEscaso = true
					}
					
				}
			}
		}
		if (algunProductoEscaso==false) {
			for (var i = 0; i < ingredientes.length; i++) {
				for (var z = 0; z < ingredientesComprar.length; z++) {
					var ingComprar = ingredientesComprar[z];
					var ing = ingredientes[i];
					if (ing.id==ingComprar.id && ingComprar.comprar>0) {
						ingredientes[i].cantidad =  ing.cantidad - ingComprar.comprar;
						ingredientes[i].badge.children[1].text = ingredientes[i].cantidad;
					}
				}
			}
			cuentaBancaria = cuentaBancaria + this.totalVenta;
			fxcashier.play();
			this.close();
			gameobj.resumeGame();
			checkNivel();
		}else{
			fxselect.play();
		}
	},
	makeCount:function(){
		
		var suma = 0;
		var sumaVenta = 0;
		for (var i = 0; i < ingredientesComprar.length; i++) {
			var ing = ingredientesComprar[i];
			suma+= ing.comprar * 25; 
			sumaVenta+= ing.comprar*20;
		}
		this.total = suma;
		this.totalVenta = sumaVenta;
		this.labelComprar.text= 'COMPRAR:\n'+ this.total+' monedas';
		this.labelVender.text= 'VENDER:\n'+ this.totalVenta+' monedas';

	},
	openMenu :function() {

        if (this.popupmenu.tween !== null && this.popupmenu.tween != undefined){
            if (this.popupmenu.tween.isRunning || this.popupmenu.scale.x === 1) {
                return;
            }
            
        }
        this.popupmenu.tween = game.add.tween(this.popupmenu.scale).to( { x: 1, y: 1 }, 500, Phaser.Easing.Back.Out, true);
    },
    close:function(){
    	//this.popupmenu.removeAll(false,false);
    	this.popupmenu.scale.setTo(0,0);

    	//this.popupmenu.alpha = 0;
    }
}

var LicuadoraClass = {
	init:function(){
		//licuadora
		this.licuadora=game.add.image(0,0,'licuadora');
        this.licuadora.frame=0;
        this.licuadora.scale.setTo(0.7,0.7);
        this.licuadora.y= game.world.centerY;
        this.licuadora.x= game.world.width * 0.85;

        this.ingredientes = [];
        this.listaParaServir = false;

        //audio
        this.fx = game.add.audio('sfx-licuadora');
        this.fxselect = game.add.audio('sfx-selectobj');


        //badge
        this.badge = utils.makeBadge(0,'badgegreen');
        this.badge.x = this.licuadora.x + this.licuadora.width - 20;
        this.badge.y = this.licuadora.y + this.licuadora.height - 5;



        this.licuadora.inputEnabled = true;
        this.licuadora.events.onInputDown.add(function(icon,pointer,licuadoraObj){
        	//licuadoraObj.licuadora.frame = 1;

        	if (game.state.states[game.state.current].globo) {
				game.state.states[game.state.current].globo.destroy();
				game.state.states[game.state.current].resumeGame();
			}

        	if ((ingredienteSeleccionado!=undefined || licuadoraObj.listaParaServir==true)&& clienteSeleccionado!=undefined) {
        		

        		if (licuadoraObj.ingredientes.length<2) {
        			var controlEjecutar = true;
        			var controlCoincide = false;
        			clienteSeleccionado.bebidaSeleccionada.ingredientes.forEach(function(ingredient,index){
	    				if (ingredienteSeleccionado.id == ingredient.ingrediente.id){

	    					controlCoincide = true;
	    					licuadoraObj.ingredientes.forEach(function(tablaIngrediente,indextabla){
	        					if ( tablaIngrediente.id == ingredient.ingrediente.id){
	        						controlEjecutar = false;
	        					}
	        				});
	    					var valorInventario = ingredienteSeleccionado.cantidad - ingredient.cantidad;
	    					if (valorInventario>=0 && controlEjecutar==true) {
	    						ingredienteSeleccionado.cantidad = valorInventario;
	    						ingredienteSeleccionado.badge.children[1].text =valorInventario;
	    						for (var i = 0; i < clienteSeleccionado.icons.children.length; i++) {
		    						var grupoIngrediente = clienteSeleccionado.icons.children[i];
		    						if (grupoIngrediente.identificador == "bebida-"+ingredient.ingrediente.id) {
		    							grupoIngrediente.destroy();
		    						}

		    							
		    					}
	    						
	    					}else{
	    						controlEjecutar = false;
	    					}
	    				}
	    				
	    			});

        	// 		if (!controlCoincide) {
        	// 			var valorInventario = ingredienteSeleccionado.cantidad - 1;
    					// if (valorInventario>=0) {
    					// 	ingredienteSeleccionado.cantidad = valorInventario;
    					// 	ingredienteSeleccionado.badge.children[1].text =valorInventario;
    						
    					// }else{
    					// 	controlEjecutar = false;
    					// }
        	// 		}

        			if (controlEjecutar && controlCoincide) {
        				


        				licuadoraObj.fxselect.play();
        				licuadoraObj.ingredientes.push(ingredienteSeleccionado);
        				licuadoraObj.badge.children[1].text = licuadoraObj.ingredientes.length;
        				if (licuadoraObj.ingredientes.length==2){
			        		//licuar
			        		licuadoraObj.licuar();
			        	}

			        	//quitar selección del ingrediente
        				menuRefri.unselect();
        			}else{
        				fxnegative.play();
        				menuRefri.unselect();
        			}
        		}else{
        			//ya no se puede añadir mas ingredienes
        			if (objectoSeleccionado.tipo!='0') {
        				objectoSeleccionado.objeto.icont.frame = 0;
        			}
        			fxselect.play();
	        		objectoSeleccionado = {'objeto': licuadoraObj,'tipo':'licuadora'};
	        		licuadoraObj.icont.frame = 1;
        		}
        	}
        },null,0,this);


        return this;
	},
	licuar:function(){
		this.timebar = utils.timeBar(0.3,0.3,1,6000,this,function(licuadoraObj){
			licuadoraObj.listaParaServir = true;
			licuadoraObj.icont = utils.iconTween(0.5,0.5,'alerta');
			licuadoraObj.icont.x = licuadoraObj.licuadora.x + ((licuadoraObj.licuadora.width - licuadoraObj.timebar.width) / 2 );
			licuadoraObj.icont.y = licuadoraObj.licuadora.y - 20;
			//icont.x = game.world.centerX;
			//icont.y = 400;
			licuadoraObj.icont.makeTween();
			if (licuadoraObj.timebar.children[1]!=undefined) {
				game.tweens.remove(licuadoraObj.timebar.children[1].tween);
			}
			
			licuadoraObj.timebar.destroy();
			licuadoraObj.fx.pause();
		});
		this.timebar.x = this.licuadora.x + ((this.licuadora.width - this.timebar.width) / 2 );
		this.timebar.y = this.licuadora.y - 10;
		this.fx.play();
	},
	limpiar:function(){
		this.ingredientes = [];
		if (this.icont!=undefined) {
			this.icont.destroy();
		}
		if (this.timebar!=undefined) {
			if (this.timebar.children[1]!=undefined) {
				game.tweens.remove(this.timebar.children[1].tween);
			}
			
			this.timebar.destroy();
			this.fx.pause();
		}
		ingredienteSeleccionado = undefined;
		this.badge.children[1].text =0;
		this.listaParaServir = false;
	}
}

var SartenClass = {
	init:function(){
		//licuadora
		this.sarten=game.add.image(0,0,'sarten');
        this.sarten.frame=0;
        this.sarten.scale.setTo(0.7,0.7);
        this.sarten.y= game.world.height - 130;
        this.sarten.x= game.world.width * 0.70;

        this.ingredientes = [];
        this.listaParaServir = false;

        //audio
        this.fx = game.add.audio('sfx-freir');
        this.fxselect = game.add.audio('sfx-selectobj');

        //badge
        this.badge = utils.makeBadge(0,'badgegreen');
        this.badge.x = this.sarten.x + this.sarten.width - 40;
        this.badge.y = this.sarten.y + this.sarten.height - 30;



        this.sarten.inputEnabled = true;
        this.sarten.events.onInputDown.add(function(icon,pointer,sartenObj){

        	if ((ingredienteSeleccionado!=undefined || sartenObj.listaParaServir==true) && clienteSeleccionado!=undefined) {
        		if (sartenObj.ingredientes.length<1) {
        			var controlEjecutar = true;
        			var controlCoincide = false;
        			clienteSeleccionado.platoSeleccionado.ingredientes.forEach(function(ingredient,index){
	    				if (ingredienteSeleccionado.id == ingredient.ingrediente.id){
	    					controlCoincide = true;
	    					var valorInventario = ingredienteSeleccionado.cantidad - ingredient.cantidad;
	    					if (valorInventario>=0) {
	    						ingredienteSeleccionado.cantidad = valorInventario;
	    						ingredienteSeleccionado.badge.children[1].text =valorInventario;
	    						
	    					}else{
	    						controlEjecutar = false;
	    					}


	    				}
	    			});
        			if (!controlCoincide) {
        				var valorInventario = ingredienteSeleccionado.cantidad - 1;
    					if (valorInventario>=0) {
    						ingredienteSeleccionado.cantidad = valorInventario;
    						ingredienteSeleccionado.badge.children[1].text =valorInventario;
    						
    					}else{
    						controlEjecutar = false;
    					}
        			}

        			if (controlEjecutar) {

        				sartenObj.fxselect.play();
        				sartenObj.ingredientes.push(ingredienteSeleccionado);
        				sartenObj.badge.children[1].text = sartenObj.ingredientes.length;
			        	sartenObj.freir();
        			}else{
        				fxnegative.play();
        			}
        		}else{
        			//ya no se puede añadir mas ingredienes
        			if (objectoSeleccionado.tipo!='0') {
        				objectoSeleccionado.objeto.icont.frame = 0;
        			}
        			fxselect.play();
	        		objectoSeleccionado = {'objeto': sartenObj,'tipo':'sarten'};
	        		sartenObj.icont.frame = 1;
        		}
        	}
        },null,0,this);


        return this;
	},
	freir:function(){
		this.timebar = utils.timeBar(0.3,0.3,1,6000,this,function(sartenObj){
			sartenObj.listaParaServir = true;
			sartenObj.icont = utils.iconTween(0.5,0.5,'alerta');
			sartenObj.icont.x = sartenObj.sarten.x + ((sartenObj.sarten.width - sartenObj.timebar.width) / 2 );
			sartenObj.icont.y = sartenObj.sarten.y - 20;
			//icont.x = game.world.centerX;
			//icont.y = 400;
			sartenObj.icont.makeTween();
			if (sartenObj.timebar.children[1]!=undefined) {
				game.tweens.remove(sartenObj.timebar.children[1].tween);
			}
			
			sartenObj.timebar.destroy();
			sartenObj.fx.pause();
		});
		this.timebar.x = this.sarten.x + ((this.sarten.width - this.timebar.width) / 2 );
		this.timebar.y = this.sarten.y - 10;
		this.fx.play();
		//quitar selección del ingrediente
        menuRefri.unselect();
	},
	limpiar:function(){
		this.ingredientes = [];
		if (this.icont!=undefined) {
			this.icont.destroy();
		}
		if (this.timebar!=undefined) {
			if (this.timebar.children[1]!=undefined) {
				game.tweens.remove(this.timebar.children[1].tween);
			}
			
			this.timebar.destroy();
			this.fx.pause();
		}
		ingredienteSeleccionado = undefined;
		this.badge.children[1].text = 0;
		this.listaParaServir = false;
	}
}

var TablaClass = {
	init:function(){
		this.tabla=game.add.image(0,0,'tablacortar');
        this.tabla.frame=0;
        this.tabla.scale.setTo(0.7,0.7);
        this.tabla.y= game.world.height * 0.85;
        this.tabla.x= game.world.centerX - 50;
        this.tabla.inputEnabled = true;

        this.ingredientes = [];
        this.listaParaServir = false;

        //audio
        this.fx = game.add.audio('sfx-cuttable');
        this.fxselect = game.add.audio('sfx-selectobj');


        //badge
        this.badge = utils.makeBadge(0,'badgegreen');
        this.badge.x = this.tabla.x + this.tabla.width - 20;
        this.badge.y = this.tabla.y + this.tabla.height - 5;

        this.btnPreparar = utils.makeSmallButton("preparar",function(obj,pointer,tablaObj){
        	tablaObj.btnPreparar.scale.setTo(0,0);
			tablaObj.unir();
		},null,this);
		this.btnPreparar.x = this.tabla.x +20;
		this.btnPreparar.y = this.tabla.y + 30;
		this.btnPreparar.scale.setTo(0,0);



        this.tabla.inputEnabled = true;
        this.tabla.events.onInputDown.add(function(icon,pointer,tablaObj){
        	if (game.state.states[game.state.current].globo) {
				game.state.states[game.state.current].globo.destroy();
				game.state.states[game.state.current].resumeGame();
			}
        	//tablaObj.tabla.frame = 1;
        	if ((ingredienteSeleccionado!=undefined && tablaObj.listaParaServir==false) && clienteSeleccionado!=undefined) {



        		
    			var controlEjecutar = true;
    			var controlCoincide = false;
    			clienteSeleccionado.platoSeleccionado.ingredientes.forEach(function(ingredient,index){
    				if (ingredienteSeleccionado.id == ingredient.ingrediente.id){
    					controlCoincide = true;

    					tablaObj.ingredientes.forEach(function(tablaIngrediente,indextabla){
        					if ( tablaIngrediente.id == ingredient.ingrediente.id){
        						controlEjecutar = false;
        					}
        				});
    					var valorInventario = ingredienteSeleccionado.cantidad - ingredient.cantidad;
    					if (valorInventario>=0 && controlEjecutar==true) {
    						ingredienteSeleccionado.cantidad = valorInventario;
    						ingredienteSeleccionado.badge.children[1].text =valorInventario;

    						for (var i = 0; i < clienteSeleccionado.icons.children.length; i++) {
	    						var grupoIngrediente = clienteSeleccionado.icons.children[i];
	    						if (grupoIngrediente.identificador == "plato-"+ingredient.ingrediente.id) {
	    							grupoIngrediente.destroy();
	    						}	
	    					}
    						
    					}else{
    						controlEjecutar = false;
    					}

    					
    				}
    			});

    	// 		if (!controlCoincide) {
    	// 			var valorInventario = ingredienteSeleccionado.cantidad - 1;
					// if (valorInventario>=0) {
					// 	ingredienteSeleccionado.cantidad = valorInventario;
					// 	ingredienteSeleccionado.badge.children[1].text =valorInventario;
						
					// }else{
					// 	controlEjecutar = false;
					// }
    	// 		}

    			if (controlEjecutar && controlCoincide) {
    				tablaObj.fxselect.play();
    				tablaObj.ingredientes.push(ingredienteSeleccionado);
    				tablaObj.badge.children[1].text = tablaObj.ingredientes.length;

    				//quitar selección del ingrediente
        			menuRefri.unselect();

        			//check if plato is complete
        			
        			var coincidencias = 0;
        			clienteSeleccionado.platoSeleccionado.ingredientes.forEach(function(ingredientTest,indexTest){
        				tablaObj.ingredientes.forEach(function(tablaIngrediente,indextabla){
        					if ( tablaIngrediente.id == ingredientTest.ingrediente.id){
        						coincidencias++;
        					}
        				});
        			});
        			if (coincidencias==clienteSeleccionado.platoSeleccionado.ingredientes.length) {
        				tablaObj.btnPreparar.scale.setTo(0.5,0.5);
        			}

    			}else{
    				fxnegative.play();
    				menuRefri.unselect();
    			}
        	}else if(tablaObj.listaParaServir==true){

        		//ya no se puede añadir mas ingredienes
    			if (objectoSeleccionado.tipo!='0') {
    				objectoSeleccionado.objeto.icont.frame = 0;
    			}
    			fxselect.play();
        		objectoSeleccionado = {'objeto': tablaObj,'tipo':'tabla'};
        		tablaObj.icont.frame = 1;
        	}
        },null,0,this);


        return this;
	},
	unir:function(){
		this.timebar = utils.timeBar(0.3,0.3,1,6000,this,function(tablaObj){
			tablaObj.listaParaServir = true;
			tablaObj.icont = utils.iconTween(0.5,0.5,'alerta');
			tablaObj.icont.x = tablaObj.tabla.x + ((tablaObj.tabla.width - tablaObj.timebar.width) / 2 );
			tablaObj.icont.y = tablaObj.tabla.y - 20;
			//icont.x = game.world.centerX;
			//icont.y = 400;
			tablaObj.icont.makeTween();
			if (tablaObj.timebar.children[1]!=undefined) {
				game.tweens.remove(tablaObj.timebar.children[1].tween);
			}
			
			tablaObj.timebar.destroy();
			tablaObj.fx.pause();
		});
		this.timebar.x = this.tabla.x + ((this.tabla.width - this.timebar.width) / 2 );
		this.timebar.y = this.tabla.y - 10;
		this.fx.play();
	},
	limpiar:function(){
		this.ingredientes = [];
		if (this.icont!=undefined) {
			this.icont.destroy();
		}
		if (this.timebar!=undefined) {
			if (this.timebar.children[1]!=undefined) {
				game.tweens.remove(this.timebar.children[1].tween);
			}
			
			this.timebar.destroy();
			this.fx.pause();
		}
		ingredienteSeleccionado = undefined;
		this.badge.children[1].text =0;
		this.listaParaServir = false;
	}
}



var VasoClass = {
	init:function(){
		this.vaso=game.add.image(0,0,'vaso');
        this.vaso.frame=0;
        this.vaso.scale.setTo(0.4,0.4);
        this.vaso.y= game.world.centerY + 50;
        this.vaso.x= 100;
        this.vaso.inputEnabled = true;

        this.negative = game.add.audio('sfx-negative');
        this.fxcorrect = game.add.audio('sfx-correct');


        this.vaso.events.onInputDown.add(function(icon,pointer,vasoObj){
        	var coincidencias = 0;

        	if (objectoSeleccionado.tipo=='licuadora') {
        		if (clienteSeleccionado!=undefined && objectoSeleccionado.objeto.listaParaServir==true) {

        			clienteSeleccionado.bebidaSeleccionada.ingredientes.forEach(function(ingredient,index){
        				if ( objectoSeleccionado.objeto.ingredientes[0].id == ingredient.ingrediente.id ||
        					objectoSeleccionado.objeto.ingredientes[1].id == ingredient.ingrediente.id){
        					coincidencias++;
        				}
        			});

        			if (coincidencias==2) {
        				//se preparo correctamente
        				vasoObj.fxcorrect.play();
        				vasoObj.vaso.frame=1;
        				//limpiar licuadora
        				objectoSeleccionado.objeto.limpiar();
        				clienteSeleccionado.checkOrden("bebida");
        			}else{
        				//no se preparo correctamente
        				vasoObj.negative.play();
        				objectoSeleccionado.objeto.limpiar();

        			}
        		}
        	}

        },null,0,this);

        return this;
	},
	limpiar:function(){
		this.vaso.frame=0;
	}
}

var PlatoClass = {
	init:function(){
		this.plato=game.add.image(0,0,'plato');
        this.plato.frame=0;
        this.plato.scale.setTo(0.35,0.35);
        this.plato.y = game.world.centerY + 120;
        this.plato.x = 40;
        this.plato.inputEnabled = true;

        this.negative = game.add.audio('sfx-negative');
        this.fxcorrect = game.add.audio('sfx-correct');

        this.plato.events.onInputDown.add(function(icon,pointer,platoObj){
        	var coincidencias = 0;
        	if (objectoSeleccionado.tipo=='tabla') {
        		if (clienteSeleccionado!=undefined && objectoSeleccionado.objeto.listaParaServir==true) {
        			clienteSeleccionado.platoSeleccionado.ingredientes.forEach(function(ingredient,index){
        				objectoSeleccionado.objeto.ingredientes.forEach(function(tablaIngrediente,indextabla){
        					if ( tablaIngrediente.id == ingredient.ingrediente.id){
        						coincidencias++;
        					}
        				});
        			});

        			if (coincidencias==clienteSeleccionado.platoSeleccionado.ingredientes.length) {
        				//se preparo correctamente
        				platoObj.fxcorrect.play();
        				platoObj.plato.frame=1;
        				//limpiar licuadora
        				objectoSeleccionado.objeto.limpiar();

        				clienteSeleccionado.checkOrden("plato");

        			}else{
        				//no se preparo correctamente
        				platoObj.negative.play();
        				objectoSeleccionado.objeto.limpiar();
        			}
        		}
        	}

        },null,0,this);

        return this;
	},
	limpiar:function(){
		this.plato.frame=0;
	}
}










