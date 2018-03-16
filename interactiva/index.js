// inject global phaser variables
import 'pixi.js';
import 'p2';
import 'phaser';
import 'phaser-input';
import BootState from './BootState.ts';
import VideoState from './VideoState.ts';
import GameState from './GameState.ts';
import LoginState from './LoginState.ts';
import BoyGirlState from './BoyGirlState.ts';
import LoadState from './LoadState.ts';
import { ancho, alto } from './dimens.ts';
import AflatounAstronauta from './AflatounAstronauta.ts';
import DefinisteTuSueno from './DefinisteTuSueno.ts';
import ProfesionesArrastrables from './ProfesionesArrastrables.js';
import Video1 from './assets/video1.mp4';
function start() {
    const game = new Phaser.Game(ancho, alto, Phaser.AUTO, 'game');
    game.add.plugin(PhaserInput.Plugin);
    game.state.add('Boot', new BootState());
    game.state.add('Login', new LoginState());
    game.state.add('Preload', new LoadState());
    game.state.add('Game', new GameState());
    game.state.add('BoyGirl', new BoyGirlState());
    game.state.add('Video', new VideoState(Video1));
    game.state.add('AflatounAstronauta', new AflatounAstronauta());
    game.state.add('ProfesionesArrastrables', ProfesionesArrastrables);
    game.state.add('DefinisteTuSueno', DefinisteTuSueno);
    game.state.start('Boot');
}
start();
//# sourceMappingURL=index.js.map