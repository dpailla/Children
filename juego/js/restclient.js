
var rest = {
	//baseUrl : 'https://cheftoun.herokuapp.com/',
	baseUrl : 'https://bc-juego.azurewebsites.net/',

	makePost : function(url,jsonSend,callback){
		// Envío y recibo de datos en JSON
		var xhr = new XMLHttpRequest();
		xhr.open("POST", this.baseUrl+url, true);
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.onreadystatechange = function () {
		    if (xhr.readyState === 4 && xhr.status === 200) {
		        var json = JSON.parse(xhr.responseText);
		        callback(json);
		    }
		};
		var data = JSON.stringify(jsonSend);
		xhr.send(data);
	},
	makeGet : function(url,callback){
		//recibo de datos en JSON
		var xhr = new XMLHttpRequest();
		xhr.open("GET", this.baseUrl+url, true);
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.onreadystatechange = function () {
		    if (xhr.readyState === 4 && xhr.status === 200) {
		        var json = JSON.parse(xhr.responseText);
		        callback(json);
		    }
		};
		xhr.send();

	},

	getPlatos : function(){
		this.makeGet('plato/',function(platosRespuesta){
			if (platosRespuesta.length>0) {
				platos = platosRespuesta
			}
			isLoaded = true;
		});
	},
	getIngredientes : function(){
		this.makeGet('ingrediente/',function(ingredienteRespuesta){
			if (ingredienteRespuesta.length>0) {
				ingredientes = ingredienteRespuesta
			}
		});
	},

	getPuntaje2 : function(){
		this.makeGet('puntaje/',function(puntajeRespuesta){
			if (puntajeRespuesta.length>0) {
				puntajes = puntajeRespuesta
			}
		});
	},





	getPuntaje : function(idNino,callback){
		this.makePost('puntajeNino/',{'nino':idNino},function(puntajeNino){
			callback(puntajeNino);
		});
	},

	setPuntaje : function(idNino,puntaje,callback){
		this.makePost('setPuntajeNino/',{'nino':idNino,'puntaje':puntaje},function(resPuntajeNino){
			callback(resPuntajeNino);
		});
	},


}
