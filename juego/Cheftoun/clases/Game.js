
Game = function (game) {
	//Mis Objetos
	this.util;
	this.hora;
	this.niveles = new NivelesJuegoClass();
	this.numNivelActual =1; //Inicia con Nivel 1
	this.nivelActual;
	this.listCategoriaAll = new Array();
	this.listProductosAll = new Array(); //para manejo de inventario
	this.listOrdenes = new Array(); //Tendra la lista de ordenes que se iran atendiendo.
	this.config = new ConfigClass();
};

Game.prototype = {

	create: function () {

	//	var bg = this.add.tileSprite(0, 0, this.game.width, this.game.height, 'space');
		//this.player = new Player(this.game, this.game.world.centerX, this.game.world.centerY);
	//	this.asteroids = new Asteroids(this);
		
		this.util = new UtilClass();
		var horaRandom = this.util.getRandomInt(0,23);
		var minutoRandom = this.util.getRandomInt(0,59);
		
		this.hora =  new HoraClass(horaRandom,minutoRandom);
		this.hora.printHora();
		this.config.setidioma("ING");
		
		alert(this.config.getidioma());
		
//Cargado Lista de Productos
	this.listProductosAll.push(new ProductoClass("Lechuga","Refrigeradora", ));
	this.listProductosAll.push(new ProductoClass("Pollo","Refrigeradora"));
	this.listProductosAll.push(new ProductoClass("Pan","Refrigeradora"));
	this.listProductosAll.push(new ProductoClass("Queso","Refrigeradora"));
	this.listProductosAll.push(new ProductoClass("Piminienta","Refrigeradora"));
	this.listProductosAll.push(new ProductoClass("Gotas de Limon","Refrigeradora"));
	this.listProductosAll.push(new ProductoClass("Salsa Cesar","Refrigeradora"));
	
//seguir poniendo


//Cargando Categorias de Menu		
	this.listCategoriaAll.push(new CategoriaClass("Bebidas", 0, 23,null,null,this.hora.gethora()));
	this.listCategoriaAll.push(new CategoriaClass("Ensaldas", 11, 23,null,null,this.hora.gethora()));
	this.listCategoriaAll.push(new CategoriaClass("Platos Fuertes", 13, 15, 19, 23,this.hora.gethora()));
	this.listCategoriaAll.push(new CategoriaClass("Postres", 13, 23,null,null,this.hora.gethora()));
	
	this.listCategoriaAll[0].listPlatos.push(new PlatoClass("JUGO DE MANZANA", 50,5, new Array(new IngredienteClass(2, "MANZANA"), new IngredienteClass(1,"AGUA")),new Array("VASO")));
	this.listCategoriaAll[0].listPlatos.push(new PlatoClass("JUGO DE NARANJA", 50,5, new Array(new IngredienteClass(2, "NARANJA"), new IngredienteClass(1,"AGUA")),new Array("VASO")));
	this.listCategoriaAll[0].listPlatos.push(new PlatoClass("JUGO DE FRUTILLA", 50,5, new Array(new IngredienteClass(6, "FRUTILLA"), new IngredienteClass(1,"AGUA")),new Array("VASO")));
	this.listCategoriaAll[0].listPlatos.push(new PlatoClass("JUGO DE SANDIA", 50,5, new Array(new IngredienteClass(1, "SANDIA"), new IngredienteClass(1,"AGUA")),new Array("VASO")));
	this.listCategoriaAll[0].listPlatos.push(new PlatoClass("BATIDO DE COCO", 50,5, new Array(new IngredienteClass(1, "COCO"), new IngredienteClass(1,"LECHE")),new Array("VASO")));
	this.listCategoriaAll[0].listPlatos.push(new PlatoClass("BATIDO DE BANANO", 50,5, new Array(new IngredienteClass(2, "BANANO"), new IngredienteClass(1,"LECHE")),new Array("VASO")));
	this.listCategoriaAll[0].listPlatos.push(new PlatoClass("BATIDO DE DURAZNO", 50,5, new Array(new IngredienteClass(2, "DURAZNO"), new IngredienteClass(1,"LECHE")),new Array("VASO")));
	this.listCategoriaAll[0].listPlatos.push(new PlatoClass("BATIDO DE MORA", 50,5, new Array(new IngredienteClass(12, "MORA"), new IngredienteClass(1,"LECHE")),new Array("VASO")));
	
	this.listCategoriaAll[1].listPlatos.push(new PlatoClass("ENSALADA 1", 100,10, new Array(new IngredienteClass(1, "LECHUGA"), new IngredienteClass(1,"POLLO"), new IngredienteClass(1,"PAN"), new IngredienteClass(1,"QUESO"), new IngredienteClass(1,"PIMIENTA"), new IngredienteClass(10,"GOTAS DE LIMON"), new IngredienteClass(4,"SALSA CESAR")),new Array("PLATO HONDO")));
	this.listCategoriaAll[1].listPlatos.push(new PlatoClass("ENSALADA 2", 100,10, new Array(new IngredienteClass(1, "FIDEO TORNILLO"), new IngredienteClass(1,"TOMATE"), new IngredienteClass(1,"PIMIENTO ROJO"), new IngredienteClass(1,"PIMIENTO VERDE"), new IngredienteClass(3,"LOMOS DE ATUN"), new IngredienteClass(4,"MAYONESA")),new Array("PLATO HONDO")));
	this.listCategoriaAll[1].listPlatos.push(new PlatoClass("ENSALADA 3", 100,10, new Array(new IngredienteClass(1, "LECHUGA"), new IngredienteClass(3,"TOMATE"), new IngredienteClass(5,"HUEVO"), new IngredienteClass(5,"ACEITE DE OLIVA"), new IngredienteClass(2,"SAL")),new Array("PLATO HONDO")));
	
	
	this.listCategoriaAll[2].listPlatos.push(new PlatoClass("PLATO FUERTE 1", 150,15, new Array(new IngredienteClass(3, "QUESO"), new IngredienteClass(2,"LECHE"), new IngredienteClass(1,"FIDEO TALLARIN"), new IngredienteClass(2,"ARROZ"), new IngredienteClass(1,"PESCADO"), new IngredienteClass(1,"PATACONES")),new Array("PLATO HONDO","PLATO GRANDE")));
	this.listCategoriaAll[2].listPlatos.push(new PlatoClass("PLATO FUERTE 2", 150,15, new Array(new IngredienteClass(2, "AGUACATE"), new IngredienteClass(2,"ARROZ"), new IngredienteClass(1,"POLLO"), new IngredienteClass(4,"SALSA DE TOMATE")),new Array("PLATO GRANDE")));
	this.listCategoriaAll[2].listPlatos.push(new PlatoClass("PLATO FUERTE 3", 150,15, new Array(new IngredienteClass(5, "ALBONDIGAS"), new IngredienteClass(2,"FIDEO TALLARIN")),new Array("PLATO GRANDE")));

	this.listCategoriaAll[3].listPlatos.push(new PlatoClass("POSTRE 1", 50,5, new Array(new IngredienteClass(12, "FRUTILLA"), new IngredienteClass(1,"CREMA CHANTILLY"), new IngredienteClass(1,"CEREZA")),new Array("COPA GRANDE")));
	this.listCategoriaAll[3].listPlatos.push(new PlatoClass("POSTRE 2", 50,5, new Array(new IngredienteClass(12, "FRUTILLA"), new IngredienteClass(1,"CREMA CHANTILLY"), new IngredienteClass(1,"CEREZA")),new Array("COPA GRANDE")));
	this.listCategoriaAll[3].listPlatos.push(new PlatoClass("POSTRE 3", 50,5, new Array(new IngredienteClass(3, "NUEZ"), new IngredienteClass(15,"ALMENDRA"), new IngredienteClass(1,"HELADO VAINILLA"), new IngredienteClass(2,"DULCE DE LECHE")),new Array("COPA GRANDE")));
	
	this.nivelActual = this.niveles.getNivelById(this.numNivelActual);
	alert("hola");
//Cargado NivelClasses
	
	
		
//		for(var i=0; i <this.listCategoriaAll.length; i++){
	//		if(this.listCategoriaAll[i].getestado()=="VIGENTE"){
		//		this.listCategoriaDisponibles.push(this.listCategoriaAll[i]);
		//	}
	//	}
		
		
		
		
		
		
		
		
	//	this.add.existing(this.player.trail);
	//	this.add.existing(this.player.bullets);
//		this.add.existing(this.asteroids);
		//this.add.existing(this.player.muzzle);
	},

	update: function () {

	
	},

	hit: function (bullet, roid) {

	
	},

    render: function () {

    	// this.game.debug.text(this.asteroids.total, 20, 580);

    },

    gameOver: function () {
    },

	quitGame: function () {

		this.state.start('MainMenu');

	}

};
