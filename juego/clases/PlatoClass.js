function PlatoClass(nombre, costo, propina, ingredientes, listUtensilio){
	this.nombre=nombre;
	this.costo=costo;
	this.propina=propina;
	this.listIngredientes= ingredientes;
	this.listUtensilio=listUtensilio;
}

PlatoClass.prototype.setnombre=function setnombre(value){this.nombre=value;}
PlatoClass.prototype.setcosto=function setcosto(value){this.costo=value;}
PlatoClass.prototype.setpropina=function setpropina(value){this.propina=value;}
PlatoClass.prototype.setlistIngredientes=function setlistIngredientes(value){this.listIngredientes=value;}
PlatoClass.prototype.setlistUtensilio=function setlistUtensilio(value){this.listUtensilio=value;}


PlatoClass.prototype.getnombre=function getnombre(){return this.nombre;}
PlatoClass.prototype.getcosto=function getcosto(){return this.costo;}
PlatoClass.prototype.getpropina=function getpropina(){return this.propina;}
PlatoClass.prototype.getlistIngredientes=function getlistIngredientes(){return this.listIngredientes;}
PlatoClass.prototype.getlistUtensilio=function getlistUtensilio(){return this.listUtensilio;}

