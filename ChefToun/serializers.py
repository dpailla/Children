from rest_framework import serializers
from ChefToun.models import *

class NinoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Nino
        fields = ('id','codigo', 'nickname')


class PuntajeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Puntaje
        fields = ('id','nino', 'puntaje', 'fecha')


class TipoPlatoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoPlato
        fields = ('id','tipo', 'costo', 'propina', 'state')


class HorarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Horario
        fields = ('id','horaInicio', 'horaFinal')




class HorarioTipoPlatoSerializer(serializers.ModelSerializer):
    horario = serializers.SerializerMethodField('getHorario')
    def getHorario(self, htipoPlato):
        horario = Horario.objects.get(pk=htipoPlato.horario.id)
        return HorarioSerializer(horario).data
    class Meta:
        model = HorarioTipoPlato
        fields = ('id','horario', 'tipoPlato')


class PlatoSerializer(serializers.ModelSerializer):
    ingredientes = serializers.SerializerMethodField('getIngredientes')
    tipoPlato = serializers.SerializerMethodField('getTipoPlato')
    horarios = serializers.SerializerMethodField('getHorarios')
    def getIngredientes(self, plato):
        ingredientes = IngredientePlato.objects.filter(plato=plato)
        return IngredientePlatoSerializer(ingredientes,many=True).data
    def getTipoPlato(self, plato):
        tipoP = TipoPlato.objects.get(pk=plato.tipoPlato.id)
        return TipoPlatoSerializer(tipoP).data
    def getHorarios(self, plato):
        horarios = HorarioTipoPlato.objects.filter(tipoPlato=plato.tipoPlato)
        return HorarioTipoPlatoSerializer(horarios,many=True).data
    class Meta:
        model = Plato
        fields = ('id','nombre', 'foto','tipoPlato','state','ingredientes','horarios')

class UbicacionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ubicacion
        fields = ('id','ubicacion')


class IngredienteSerializer(serializers.ModelSerializer):
    ubicacion = serializers.SerializerMethodField('getUbicacion')
    def getUbicacion(self, ingrediente):
        ubicacion = Ubicacion.objects.filter(pk=ingrediente.ubicacion.id)
        return UbicacionSerializer(ubicacion,many=True).data
    class Meta:
        model = Ingrediente
        fields = ('id','ingrediente','cantidad','cantidadInicial','esUnitario','unidades','ubicacion','icon')

class IngredientePlatoSerializer(serializers.ModelSerializer):
    ingrediente = serializers.SerializerMethodField('getNombre')
    def getNombre(self, ingredientePlato):
        ingredienteObj = Ingrediente.objects.get(pk=ingredientePlato.ingrediente.id)
        return IngredienteSerializer(ingredienteObj).data
    class Meta:
        model = IngredientePlato
        fields = ('id','ingrediente','plato','cantidad')




