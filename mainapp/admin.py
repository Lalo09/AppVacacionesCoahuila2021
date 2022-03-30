from django.contrib import admin
from .models import Reporte, Punto, Mapa

# Campos de solo lectura
class ReporteAdmin(admin.ModelAdmin):
    readonly_fields = ('fecha','patrulla','sexo','lugar','incidente','foto',)

admin.site.register(Reporte,ReporteAdmin)
admin.site.register(Punto)
admin.site.register(Mapa)

#Configuracion del panel
title = "Gestion de aplicacion"
subtitle = "Panel de gestion"

admin.site.site_header = title
admin.site.site_header = title
admin.site.index_title = subtitle