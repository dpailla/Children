function UtilClass(){
	this.var;
}

UtilClass.prototype.getRandomInt=
function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

