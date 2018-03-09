# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.utils import timezone

class Nino(models.Model):
	codigo = models.CharField(max_length=10,blank=False, unique=True)
	nickname = models.CharField(max_length=30,blank=True)
	def __str__(self):
		return str(self.codigo)

class Puntaje(models.Model):
	nino = models.ForeignKey(Nino,null=False)
	puntaje = models.IntegerField(default=0)
	fecha = models.DateTimeField(default=timezone.now)
	def __str__(self):
		return str(self.nino) + " " + str(self.puntaje)

class TipoPlato(models.Model):
	tipo = models.CharField(max_length=30)
	costo = models.FloatField()
	propina = models.FloatField()
	state = models.BooleanField(default=True)
	def __str__(self):
		return str(self.tipo)

class Horario(models.Model):
	horaInicio = models.TimeField()
	horaFinal = models.TimeField()
	def __str__(self):
		return str(self.horaInicio) + " - " + str(self.horaFinal)
	
class HorarioTipoPlato(models.Model):
	horario = models.ForeignKey(Horario)
	tipoPlato = models.ForeignKey(TipoPlato)
	def __str__(self):
		return str(self.horario) + " | " + str(self.tipoPlato)

class Plato(models.Model):
	nombre = models.CharField(max_length=60)
	foto = models.CharField(max_length=120)
	tipoPlato = models.ForeignKey(TipoPlato)
	state = models.BooleanField(default=True)
	def __str__(self):
		return str(self.nombre)

class Ubicacion(models.Model):
	ubicacion = models.CharField(max_length=60)
	def __str__(self):
		return str(self.ubicacion)


class Ingrediente(models.Model):
	ingrediente = models.CharField(max_length=60)
	cantidad = models.IntegerField()
	cantidadInicial = models.IntegerField()
	esUnitario = models.BooleanField(default=True)
	unidades = models.IntegerField(default=0)
	ubicacion = models.ForeignKey(Ubicacion)
	icon = models.CharField(max_length=200)
	def __str__(self):
		return str(self.ingrediente)

class IngredientePlato(models.Model):
	ingrediente = models.ForeignKey(Ingrediente)
	plato = models.ForeignKey(Plato)
	cantidad = models.IntegerField()
	def __str__(self):
		return str(self.ingrediente) + " " + str(self.plato)
		




