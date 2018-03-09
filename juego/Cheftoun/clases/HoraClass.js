function HoraClass(hora, minuto){
	this.hora=hora;
	this.minuto=minuto;
	if(minuto<10){
		this.horaString = String(this.hora) +":0" +String(this.minuto) ;
	}else{
		this.horaString = String(this.hora) +":" +String(this.minuto) ;
	}
}

HoraClass.prototype.sethora=function sethora(value){this.hora=value;}
HoraClass.prototype.setminuto=function setminuto(value){this.minuto=value;}
HoraClass.prototype.sethoraString=function sethoraString(value){this.horaString=value;}

HoraClass.prototype.gethora=function gethora(){return this.hora;}
HoraClass.prototype.getminuto=function getminuto(){return this.minuto;}
HoraClass.prototype.gethoraString=function gethoraString(){return this.horaString;}

//Otras Funciones
HoraClass.prototype.printHora=function gethoraString(){
	alert(this.horaString);
}
