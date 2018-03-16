import { alto, ancho } from './dimens.ts';
import backgroundPath from './assets/login_bg.png';
import childrenLogoPath from './assets/logo-children.png';
class LoginState extends Phaser.State {
    preload() {
        this.game.load.image('login_bg', backgroundPath);
        this.game.load.image('children_logo', childrenLogoPath);
    }
    createLoginBox() {
        const loginBox = this.game.add.graphics();
        loginBox.beginFill(0xFFFFFF);
        loginBox.fillAlpha = 0.85;
        loginBox.drawRect(ancho * 3 / 16, alto * 3 / 16, ancho * 10 / 16, alto * 10 / 16);
        loginBox.endFill();
        this.game.add.tileSprite((ancho - 312) / 2, alto * 3 / 16 + 20, 312, 86, 'children_logo');
        this.game.add.inputField(10, 90);
    }
    create() {
        const bg = this.game.add.tileSprite(0, 0, ancho, alto, 'login_bg');
        this.createLoginBox();
    }
}
export default LoginState;
//# sourceMappingURL=LoginState.js.map