from mainapp.models import Mapa

def get_pages(request): #Acceder a datos de una pagina desde cualquier lugar
    pages = Mapa.objects.values_list('id','nombre','slug','contenido','idioma')
    return {
        'pages' : pages
    }