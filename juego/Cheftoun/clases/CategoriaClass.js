function CategoriaClass(nombre, horaInicio1,horaFin1, horaInicio2, horaFin2 , horaActual){
	this.nombre=nombre;
	this.horaInicio1=horaInicio1;
	this.horaFin1=horaFin1;
	this.horaInicio2=horaInicio2;
	this.horaFin2=horaFin2;
	
	if((horaActual>=this.horaInicio1 && horaActual <= this.horaFin1)||(horaActual>=this.horaInicio2 && horaActual <= this.horaFin2)){
		this.estado='VIGENTE';
	}else{
		this.estado = 'BLOQUEADO'
	}
	this.listPlatos = new Array();
}

CategoriaClass.prototype.setnombre=function setnombre(value){this.nombre=value;}
CategoriaClass.prototype.sethoraInicio1=function sethoraInicio1(value){this.horaInicio1=value;}
CategoriaClass.prototype.sethoraFin1=function sethoraFin1(value){this.horaFin1=value;}
CategoriaClass.prototype.sethoraInicio2=function sethoraInicio2(value){this.horaInicio2=value;}
CategoriaClass.prototype.sethoraFin2=function sethoraFin2(value){this.horaFin2=value;}
CategoriaClass.prototype.setestado=function setestado(value){this.estado=value;}
CategoriaClass.prototype.setlistPlatos=function setlistPlatos(value){this.listPlatos=value;}

CategoriaClass.prototype.getnombre=function getnombre(){return this.nombre;}
CategoriaClass.prototype.gethoraInicio1=function gethoraInicio1(){return this.horaInicio1;}
CategoriaClass.prototype.gethoraFin1=function gethoraFin1(){return this.horaFin1;}
CategoriaClass.prototype.gethoraInicio2=function gethoraInicio2(){return this.horaInicio2;}
CategoriaClass.prototype.gethoraFin2=function gethoraFin2(){return this.horaFin2;}
CategoriaClass.prototype.getestado=function getestado(){return this.estado;}
CategoriaClass.prototype.getlistPlatos=function getlistPlatos(){return this.listPlatos;}


//Otras Funciones
CategoriaClass.prototype.print=function print(){
	alert(this.nombre);
}