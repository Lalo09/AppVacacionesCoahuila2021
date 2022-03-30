from django.contrib import admin
from django.urls import path
from mainapp import views , views_en
from django.conf import settings

#Listado de url para paginas en español e ingles
urlpatterns = [
    path('admin/', admin.site.urls),
    path('',views.index,name='index'),
    path('index/',views.index,name='index'),
    path('reporte/',views.reporte,name='reporte'),
    path('mensaje/',views.mensaje,name='mensaje'),
    path('enviar-reporte/',views.enviar_reporte,name="enviar-reporte"),
    path('filtros/',views.filtros,name="filtros"),
    path('fiscalias/',views.fiscalias,name="fiscalias"),
    path('gasolineras/',views.gasolineras,name="gasolineras"),
    path('casetas/',views.casetas,name="casetas"),
    path('paginas',views.paginas,name='paginas'),
    path('en/',views_en.index_en,name="index-en"),
    path('en/report',views_en.report,name="report"),
    path('en/message',views_en.message,name="message"),
    path('en/send-report',views_en.sent_report,name="sent-report"),    
    path('en/filter',views_en.filters,name="filter"),
    path('en/police',views_en.fiscalias_en,name="police"),
    path('en/gas-stations',views_en.gas_stations,name="gas-stations"),
    path('en/tollbooths',views_en.casetas_en,name="tollbooths"),      
    path('page/<str:slug>',views.page,name="page"),
    path('page-en/<str:slug>',views_en.page_en,name="page-en"),
    path('en/pages-en',views_en.pages_en,name='pages_en')
]

#Configuracion para imagenes
if settings.DEBUG:
    from django.conf.urls.static import static
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)  