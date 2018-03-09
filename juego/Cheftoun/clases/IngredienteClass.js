function IngredienteClass(cantidad, producto){
	this.cantidad=cantidad;
	this.producto=producto;
}

IngredienteClass.prototype.setcantidad=function setcantidad(value){this.cantidad=value;}
IngredienteClass.prototype.setproducto=function setproducto(value){this.producto=value;}

IngredienteClass.prototype.getcantidad=function getcantidad(){return this.cantidad;}
IngredienteClass.prototype.getproducto=function getproducto(){return this.producto;}

