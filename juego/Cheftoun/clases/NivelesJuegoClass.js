function NivelesJuegoClass(){
	this.listNiveles=new Array();

//Cargado NivelClasses
	this.listNiveles.push(new NivelClass(1, 1000, "¡Tus primeras mil monedas! ¡Muy Bien!", 10));
	this.listNiveles.push(new NivelClass(2, 2000, "¡2", 9));
	this.listNiveles.push(new NivelClass(3, 3000, "3", 8));
	this.listNiveles.push(new NivelClass(4, 4000, "4", 7));
	this.listNiveles.push(new NivelClass(5, 5000, "5", 6));
	this.listNiveles.push(new NivelClass(6, 6000, "6", 5));
	this.listNiveles.push(new NivelClass(7, 7000, "7", 5));
	this.listNiveles.push(new NivelClass(8, 8000, "8", 5));
	this.listNiveles.push(new NivelClass(9, 9000, "9", 5));
    this.listNiveles.push(new NivelClass(10, 10000, "10", 5));

}

//Devuelve un objeto de tipo NivelClass
NivelesJuegoClass.prototype.getNivelById=
function getNivelById(value){
	var ret 
	for(var i=0; i <this.listNiveles.length; i++){
		if(this.listNiveles[i].getid()==value){
			ret = this.listNiveles[i];
		}
	}
	return ret;
}
