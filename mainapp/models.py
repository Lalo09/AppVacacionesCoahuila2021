from django.db import models
from ckeditor.fields import RichTextField

class Reporte(models.Model):
    patrulla = models.CharField(max_length=10, verbose_name="Numero de patrulla")
    sexo = models.CharField(max_length=1,verbose_name="Sexo del policia")
    lugar = models.CharField(max_length=50,verbose_name="Lugar del incidente")
    incidente = models.TextField(verbose_name="Detalles de incidente")
    fecha = models.DateTimeField(auto_now_add=True,verbose_name="Fecha del incidente")
    foto = models.ImageField(default='null',verbose_name = "Foto",upload_to="reportes")

    class Meta:
        verbose_name = "Reporte"
        verbose_name_plural = "Reportes"
    
    def __str__(self):
        return self.lugar + "-" +str(self.fecha)

class Punto(models.Model):
    nombre = models.CharField(max_length=50, verbose_name="Nombre")
    desc = models.CharField(max_length=255, verbose_name='Descripcion')
    lat = models.FloatField(verbose_name='Latitud')
    Lng = models.FloatField(verbose_name='Longitud')
    categoria = models.CharField(max_length=50,verbose_name="Categoria")

    class Meta:
        verbose_name = "Punto"
        verbose_name_plural = "Puntos"

    def __str__(self):
        return self.nombre + " | " + str(self.Lng) + " , " + str(self.lat) + " | " +self.categoria

class Mapa(models.Model):
    nombre = models.CharField(max_length=50, verbose_name="Nombre")
    desc = models.CharField(max_length=255, verbose_name='Descripcion')
    contenido = RichTextField(verbose_name='Contenido')
    slug = models.CharField(verbose_name="URL",unique=True,max_length=150)
    idioma = models.CharField(max_length=60)

    class Meta:
        verbose_name = "Mapa"
        verbose_name_plural = "Mapas"

    def __str__(self):
        return self.nombre + "-" + self.idioma