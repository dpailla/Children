var colorFondo = "#87CEFA";

var config = {
    width: 800,
    height: 600,
    renderer: Phaser.CANVAS,
    antialias: true,
    multiTexture: false,
}

//variables del juego de ChefToun
var platos = undefined;
var ingredientes = undefined;
var puntajes = undefined;

var niveles = new NivelesJuegoClass();

var listEsp = new Array("JUGAR","PUNTAJE","TUTORIAL","REGRESAR");
var listEng = new Array("PLAY","RANKING","TUTORIAL","BACK");
var idioma = new IdiomaClass("ESP",listEsp, listEng);


var game = new Phaser.Game(config);

game.state.add('tutorialState',tutorialState);
game.state.add('puntajeState',puntajeState);
game.state.add('boot',bootState);
game.state.add('load',loadState);
game.state.add('title',titleState);
game.state.add('menu',menuState);
game.state.add('play',playState);

game.state.start('boot');




