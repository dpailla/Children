# -*- coding: utf-8 -*-
from django.db import models

# Create your models here.


class Nino(models.Model):
    cedula = models.CharField(max_length=10)
    codigo = models.CharField(max_length=10,unique=True,verbose_name='Código')
    edad = models.IntegerField()
    es_apadrinado = models.BooleanField(default=True)
    activo = models.BooleanField(default=True)


    def __str__(self):
        return self.codigo
