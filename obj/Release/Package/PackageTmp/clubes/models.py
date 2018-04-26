from django.db import models


class Programa(models.Model):

    choices = (
        ('INF','Informativo'),
        ('INT','Interactivo')
    )

    codigo = models.CharField(max_length=10)
    nombre = models.CharField(max_length=100)
    edad_minima = models.IntegerField(max_length=2,verbose_name='Edad inicial')
    edad_maxima = models.IntegerField(max_length=2, verbose_name='Edad final')
    objetivo = models.TextField()
    tipo = models.CharField(choices=choices,max_length=3)

    def __str__(self):
        return self.nombre

class ElementoClave(models.Model):
    nombre = models.CharField(max_length=100)
    programa = models.ForeignKey(Programa,on_delete=models.CASCADE)

    class Meta:
        verbose_name_plural = "Elementos clave"
        verbose_name = "Elemento clave"

    def __str__(self):
        return self.nombre

class Casa(models.Model):
    nombre = models.CharField(max_length=100)
    elemento_clave = models.ForeignKey(ElementoClave,on_delete=models.PROTECT)

    class Meta:
        verbose_name_plural = "Casas"
        verbose_name = "Casa"

    def __str__(self):
        return self.nombre

class Actividad(models.Model):
    nombre = models.CharField(max_length=100)
    casa = models.ForeignKey(Casa,on_delete=models.PROTECT)

    class Meta:
        verbose_name_plural = "Actividades"
        verbose_name = "Actividad"

    def __str__(self):
        return self.nombre


class ConfiguracionPrograma(models.Model):
    club = models.ForeignKey('clubes.Club',on_delete=models.CASCADE)
    programa = models.ForeignKey(Programa,on_delete=models.CASCADE)

    def __str__(self):
        return self.club.nombre



class ConfiguracionActividades(models.Model):
    actividad = models.ForeignKey(Actividad,on_delete=models.CASCADE)
    activo = models.BooleanField(default=True)
    configuracion_programa = models.ForeignKey(ConfiguracionPrograma,on_delete=models.CASCADE)

class ConfiguracionCasas(models.Model):
    casa = models.ForeignKey(Casa,on_delete=models.CASCADE)
    activo = models.BooleanField(default=True)
    configuracion_programa = models.ForeignKey(ConfiguracionPrograma, on_delete=models.CASCADE)


class ConfiguracionElementosClave(models.Model):
    elemento_clave = models.ForeignKey(ElementoClave,on_delete=models.CASCADE)
    activo = models.BooleanField(default=True)
    configuracion_programa = models.ForeignKey(ConfiguracionPrograma, on_delete=models.CASCADE)




class Club(models.Model):
    nombre = models.CharField(max_length=100)
    ninos_cuenta = models.IntegerField(verbose_name="Total de niños")
    ninos = models.ManyToManyField('niños.Niño',verbose_name="Niños")

    class Meta:
        verbose_name_plural = "Clubes"
        verbose_name = "Club"

    def __str__(self):
        return self.nombre




