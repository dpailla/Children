function ProductoClass(nombre, ubicacion){
this.nombre=nombre;
this.ubicacion=ubicacion;
}

ProductoClass.prototype.setnombre=function setnombre(value){this.nombre=value;}
ProductoClass.prototype.setubicacion=function setubicacion(value){this.ubicacion=value;}


ProductoClass.prototype.getnombre=function getnombre(){return this.nombre;}
ProductoClass.prototype.getubicacion=function getubicacion(){return this.ubicacion;}
