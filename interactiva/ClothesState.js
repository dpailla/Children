import cuerpoSpritePath from './assets/cuerpo.png';
import camisetaSpritePath from './assets/camiseta.png';
import pantalonSpritePath from './assets/pantalon.png';
const cuerpoPos = { x: 400, y: 120 };
const camisetaPos = { minX: 480, maxX: 520, minY: 240, maxY: 280 };
const pantalonPos = { minX: 480, maxX: 520, minY: 380, maxY: 420 };
class ClothesState extends Phaser.State {
    constructor() {
        super(...arguments);
        this.draggableSprites = {
            camiseta: { goalPos: camisetaPos, ready: false },
            pantalon: { goalPos: pantalonPos, ready: false },
        };
    }
    preload() {
        this.game.load.image('cuerpo', cuerpoSpritePath);
        this.game.load.image('camiseta', camisetaSpritePath);
        this.game.load.image('pantalon', pantalonSpritePath);
    }
    create() {
        this.game.add.sprite(cuerpoPos.x, cuerpoPos.y, 'cuerpo');
        const group = this.game.add.group();
        group.inputEnableChildren = true;
        const camiseta = group.create(32, 100, 'camiseta');
        camiseta.inputEnabled = true;
        camiseta.input.enableDrag();
        camiseta.events.onDragStop.add(this.onDragStop, this);
        const pantalon = group.create(800, 200, 'pantalon');
        pantalon.inputEnabled = true;
        pantalon.input.enableDrag();
        pantalon.events.onDragStop.add(this.onDragStop, this);
    }
    areAllSpritesReady() {
        const spriteStates = Object.keys(this.draggableSprites);
        return spriteStates.every(key => {
            const state = this.draggableSprites[key];
            return state.ready;
        });
    }
    gameOver() {
        this.game.state.start('Video');
    }
    checkSpriteDraggedAtGoal(spriteState, sprite, pointer) {
        const { goalPos } = spriteState;
        if (pointer.x > goalPos.minX &&
            pointer.x < goalPos.maxX &&
            pointer.y > goalPos.minY &&
            pointer.y < goalPos.maxY) {
            sprite.input.enabled = false;
            spriteState.ready = true;
            if (this.areAllSpritesReady())
                this.gameOver();
        }
    }
    onDragStop(sprite, pointer) {
        const { pantalon, camiseta } = this.draggableSprites;
        switch (sprite.key) {
            case 'pantalon':
                this.checkSpriteDraggedAtGoal(pantalon, sprite, pointer);
                break;
            case 'camiseta':
                this.checkSpriteDraggedAtGoal(camiseta, sprite, pointer);
                break;
        }
    }
}
export default ClothesState;
//# sourceMappingURL=ClothesState.js.map