function OrdenClass(numero, horaLlegada, cliente, plato){
	this.numero=numero;
	this.horaLlegada=horaLlegada;
	this.horaAtendida=0;
	this.cliente=cliente; 
	this.plato=plato;
	this.estado="ORDENADO"; //ORDENADO, EN ESPERA, ATENDIDO, ERRADA
}

OrdenClass.prototype.setnumero=function setnumero(value){this.numero=value;}
OrdenClass.prototype.sethoraLlegada=function sethoraLlegada(value){this.horaLlegada=value;}
OrdenClass.prototype.sethoraAtendida=function sethoraAtendida(value){this.horaAtendida=value;}
OrdenClass.prototype.setcliente=function setcliente(value){this.cliente=value;}
OrdenClass.prototype.setplato=function setplato(value){this.plato=value;}
OrdenClass.prototype.setestado=function setestado(value){this.estado=value;}

OrdenClass.prototype.getnumero=function getnumero(){return this.numero;}
OrdenClass.prototype.gethoraLlegada=function gethoraLlegada(){return this.horaLlegada;}
OrdenClass.prototype.gethoraAtendida=function gethoraAtendida(){return this.horaAtendida;}
OrdenClass.prototype.getcliente=function getcliente(){return this.cliente;}
OrdenClass.prototype.getplato=function getplato(){return this.plato;}
OrdenClass.prototype.getestado=function getestado(){return this.estado;}

