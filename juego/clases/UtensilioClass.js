function UtensilioClass(nombre, ubicacion){
this.nombre=nombre;
this.estado=estado; //Sucio, Limpio

}

UtensilioClass.prototype.setnombre=function setnombre(value){this.nombre=value;}
UtensilioClass.prototype.setestado=function setestado(value){this.estado=value;}

UtensilioClass.prototype.getnombre=function getnombre(){return this.nombre;}
UtensilioClass.prototype.getestado=function getestado(){return this.estado;}
