function NivelClass(id, monedas, mensajeSuccess, tiempoLlegaCliente){
this.id=id;
this.monedas=monedas;
this.mensajeSuccess=mensajeSuccess;
this.tiempoLlegaCliente=tiempoLlegaCliente;
}

NivelClass.prototype.setid=function setid(value){this.id=value;}
NivelClass.prototype.setmonedas=function setmonedas(value){this.monedas=value;}
NivelClass.prototype.setmensajeSuccess=function setmensajeSuccess(value){this.mensajeSuccess=value;}
NivelClass.prototype.settiempoLlegaCliente=function settiempoLlegaCliente(value){this.tiempoLlegaCliente=value;}

NivelClass.prototype.getid=function getid(){return this.id;}
NivelClass.prototype.getmonedas=function getmonedas(){return this.monedas;}
NivelClass.prototype.getmensajeSuccess=function getmensajeSuccess(){return this.mensajeSuccess;}
NivelClass.prototype.gettiempoLlegaCliente=function gettiempoLlegaCliente(){return this.tiempoLlegaCliente;}
