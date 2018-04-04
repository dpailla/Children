from django.contrib import admin
import nested_admin

from .models import *

class ConfigElementoInline(nested_admin.NestedTabularInline):
    model = ConfiguracionElementosClave

class ConfigCasaInline(nested_admin.NestedTabularInline):
    model = ConfiguracionCasas

class ConfigActividadInline(nested_admin.NestedTabularInline):
    model = ConfiguracionActividades

class ConfigProgramaInline(nested_admin.NestedStackedInline):
    model = ConfiguracionPrograma
    inlines = [ConfigElementoInline,ConfigActividadInline,ConfigCasaInline]


class ClubAdmin(nested_admin.NestedModelAdmin):
    model = Club
    inlines = [ConfigProgramaInline,]



admin.site.register(Club,ClubAdmin)
admin.site.register(Programa)
admin.site.register(ElementoClave)
admin.site.register(Casa)
admin.site.register(Actividad)

