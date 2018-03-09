from django.conf.urls import url, include
from rest_framework import routers
from ChefToun import views

router = routers.DefaultRouter()
router.register(r'nino', views.NinoViewSet)
router.register(r'puntaje', views.PuntajeViewSet)
router.register(r'tipo_plato', views.TipoPlatoViewSet)
router.register(r'horario', views.HorarioViewSet)
router.register(r'plato', views.PlatoSerializeriewSet)
router.register(r'ingrediente', views.IngredienteViewSet)
router.register(r'ubicacion', views.UbicacionViewSet)
router.register(r'ingrediente_plato', views.IngredientePlatoViewSet)


urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'puntajeNino/', views.PuntajeNino, name='PuntajeNino'),


    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]
