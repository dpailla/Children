from django.db import models

# Create your models here.

class Cita(models.Model):
    club = models.ForeignKey('clubes.Club',on_delete=models.CASCADE)
    fecha = models.DateField(verbose_name='Fecha y hora')
    evento = models.CharField(max_length=200)


