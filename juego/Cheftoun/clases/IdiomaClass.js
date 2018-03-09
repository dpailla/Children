function IdiomaClass(idioma, listesp, listeng ){
this.idioma=idioma;
this.listaespanol= listesp;
this.listingles = listeng;
}

IdiomaClass.prototype.setidioma=function setidioma(value){this.idioma=value;}
IdiomaClass.prototype.getidioma=function getidioma(){return this.idioma;}


//Devuelve un objeto de tipo NivelClass
IdiomaClass.prototype.getTraduccion=
function getTraduccion(value){
	//valida el idiomaActual
	if(this.idioma=="ENG"){

		var indiceEsp = 0;
		var ret ;

		for(var i=0; i <this.listaespanol.length; i++){
			if(this.listaespanol[i]==value){
				indiceEsp = i;
			}
		}
		ret = this.listingles[indiceEsp];
		return ret;
	}else{ //caso contrario retorna el idioma por default espanol
		return value;
	}

	
}
