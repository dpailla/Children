# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from rest_framework import viewsets
from ChefToun.serializers import *
from rest_framework import generics
from rest_framework.decorators import api_view,permission_classes
from rest_framework import authentication, permissions
from rest_framework.response import Response


class NinoViewSet(viewsets.ModelViewSet):
    queryset = Nino.objects.all()
    serializer_class = NinoSerializer


class PuntajeViewSet(viewsets.ModelViewSet):
    queryset = Puntaje.objects.all()
    serializer_class = PuntajeSerializer


class TipoPlatoViewSet(viewsets.ModelViewSet):
    queryset = TipoPlato.objects.all()
    serializer_class = TipoPlatoSerializer



class HorarioViewSet(viewsets.ModelViewSet):
    queryset = Horario.objects.all()
    serializer_class = HorarioSerializer



class PlatoSerializeriewSet(viewsets.ModelViewSet):
    queryset = Plato.objects.all()
    serializer_class = PlatoSerializer



class IngredienteViewSet(viewsets.ModelViewSet):
    queryset = Ingrediente.objects.all()
    serializer_class = IngredienteSerializer


class UbicacionViewSet(viewsets.ModelViewSet):
    queryset = Ubicacion.objects.all()
    serializer_class = UbicacionSerializer



class IngredientePlatoViewSet(viewsets.ModelViewSet):
    queryset = IngredientePlato.objects.all()
    serializer_class = IngredientePlatoSerializer



@api_view(['GET','POST'])
@permission_classes((permissions.AllowAny,))
def PuntajeNino(request):
    if request.method == 'POST':
        puntajeNino = Puntaje.objects.filter(nino_id=request.data.get('nino'))
        puntajes = PuntajeSerializer(puntajeNino, many=True)
        return Response(puntajes.data)
        
        

