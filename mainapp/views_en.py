"""
from django.shortcuts import render, HttpResponse,redirect
from datetime import datetime
from .models import Reporte, Punto
import folium
import geocoder
import openrouteservice
import requests
import json
from geopy.distance import geodesic

client = openrouteservice.Client(key='5b3ce3597851110001cf6248efd6cfca11f74654ad8473fb3608c8f9')
"""
from .views import *

# Create your views here.
def index_en(request):
    return render((request),'en/index_en.html',{
        'titleHead':'Start',
        'title':'Choose an option',
        'desc':'We offer the following services to make your trip safer'
    })

def report(request):
    return render(request, 'en/reporte_en.html',{
        'titleHead':'New report',
        'title':'Did you have any incidence?',
        'desc':'Sent a report'
    })

def sent_report(request):

    if request.method =='POST' :

        patrulla = request.POST['numeroPatrulla']
        sexo = request.POST['customRadio']
        lugar = request.POST['lugarFiltro']
        incidente = request.POST['incidencia']
        foto = request.FILES.get('imagen')

        reporte = Reporte(
            patrulla = patrulla,
            sexo = sexo,
            lugar = lugar,
            incidente = incidente,
            fecha = datetime.now(),
            foto = foto
        )

        reporte.save()

        return redirect('message')

    else:

        return HttpResponse("""
        <!doctype html>
        <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
            <title>Error</title>
        </head>
        <body>
            <div class="alert alert-danger" role="alert"> A simple danger alert—check it out!</div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
        </body>
        </html>        
        """)

def message(request):
    return render(request, 'en/mensaje_en.html',{
        'titleHead':'Report Sent'
    })

def filters(request):

    latitude = 0
    longitude = 0

    #Create custom marker icon
    icon_url = 'https://cdn0.iconfinder.com/data/icons/users-android-l-lollipop-icon-pack/24/police-256.png'
    
    #Data from model
    punto = Punto.objects.filter(categoria='filtro')
        
    #Create object
    m1 = folium.Map(location=[27.442054, -102.318994],zoom_start=6)

    #Draw points
    for p in punto:
        icon = folium.features.CustomIcon(icon_url,icon_size=(28, 30))# Creating a custom Icon
        folium.Marker([p.lat,p.Lng],tooltip='<strong>'+p.desc+'</strong>',popup=p.nombre,icon=icon).add_to(m1)

    #Get current location and draw route
    if request.method == 'POST':
        latitude = request.POST['lat']
        longitude  = request.POST['lon']

        #Create bucle to find route nearby
        distances = []
        points = []
        for p in punto:
            p1 = (latitude,longitude)
            p2 = (p.lat,p.Lng)
            distances.append(geodesic(p1,p2))
            points.append(p2)
        #print(distances)
        #print(min(distances))
        index = distances.index(min(distances))
        #print(points[index])
        min_lat = points[index][0]
        min_lon = points[index][1]
        #coordinates = [[longitude,latitude], [-100.996879,25.439519]]

        coordinates = [[longitude,latitude], [min_lon,min_lat]]
        folium.Marker([latitude, longitude], popup="<i>Tu estas aqui</i>").add_to(m1)
        route = client.directions(coordinates=coordinates, profile='driving-car', format='geojson')
        folium.GeoJson(route, name='route').add_to(m1)  
        folium.LayerControl().add_to(m1)
        m1.location = [latitude,longitude]

    #Data HTML
    m1 = m1._repr_html_()
    
    return render(request,'en/mapa_en.html',{
        'titleHead':'Security filters',
        'title':'Security filters',
        'desc':'See security points installed on roads',
        'm': m1,
        'latitude': latitude,
        'longitude': longitude
    })

def fiscalias_en(request):

    latitude = 0
    longitude = 0

    icon_url = 'https://cdn0.iconfinder.com/data/icons/ie_Financial_set/256/21.png'
    punto = Punto.objects.filter(categoria='fiscalia')
    m2 = folium.Map(location=[27.442054, -102.318994],zoom_start=6)
    for p in punto:
        icon = folium.features.CustomIcon(icon_url,icon_size=(28, 30))# Creating a custom Icon
        folium.Marker([p.lat,p.Lng],tooltip='<strong>'+p.desc+'</strong>',popup=p.nombre,icon=icon).add_to(m2)

    if request.method == 'POST':
        latitude = request.POST['lat']
        longitude  = request.POST['lon']
        distances = []
        points = []

        for p in punto:
            p1 = (latitude,longitude)
            p2 = (p.lat,p.Lng)
            distances.append(geodesic(p1,p2))
            points.append(p2)

        index = distances.index(min(distances))
        min_lat = points[index][0]
        min_lon = points[index][1]
        coordinates = [[longitude,latitude], [min_lon,min_lat]]

        folium.Marker([latitude, longitude], popup="<i>Tu estas aqui</i>").add_to(m2)
        route = client.directions(coordinates=coordinates, profile='driving-car', format='geojson')
        folium.GeoJson(route, name='route').add_to(m2)  
        folium.LayerControl().add_to(m2)
        m2.location = [latitude,longitude]

    m2 = m2._repr_html_()
    return render(request,'en/mapa_en.html',{
        'titleHead':'Policia del estado de Coahuila',
        'title':'Security filters',
        'desc':'Location of police',
        'm': m2,
        'latitude': latitude,
        'longitude': longitude
    })

def gas_stations(request):

    latitude = 0
    longitude = 0
    
    icon_url = 'https://cdn0.iconfinder.com/data/icons/energy-free/32/Energy_Energy_Fuel_Gas_Station_Gasolin-256.png'
    punto = Punto.objects.filter(categoria='gasolinera')
    m3 = folium.Map(location=[27.442054, -102.318994],zoom_start=6)
    for p in punto:
        icon = folium.features.CustomIcon(icon_url,icon_size=(28, 30))# Creating a custom Icon
        folium.Marker([p.lat,p.Lng],tooltip='<strong>'+p.desc+'</strong>',popup=p.nombre,icon=icon).add_to(m3)
    
    if request.method == 'POST':
        latitude = request.POST['lat']
        longitude  = request.POST['lon']
        distances = []
        points = []

        for p in punto:
            p1 = (latitude,longitude)
            p2 = (p.lat,p.Lng)
            distances.append(geodesic(p1,p2))
            points.append(p2)

        index = distances.index(min(distances))
        min_lat = points[index][0]
        min_lon = points[index][1]
        coordinates = [[longitude,latitude], [min_lon,min_lat]]

        folium.Marker([latitude, longitude], popup="<i>Tu estas aqui</i>").add_to(m3)
        route = client.directions(coordinates=coordinates, profile='driving-car', format='geojson')
        folium.GeoJson(route, name='route').add_to(m3)  
        folium.LayerControl().add_to(m3)
        m3.location = [latitude,longitude]

    m3 = m3._repr_html_()
    return render(request,'en/mapa_en.html',{
        'titleHead':'Gas stations',
        'title':'Location of gas stations',
        'desc':'See the location of gas stations on the road',
        'm': m3,
        'latitude': latitude,
        'longitude': longitude
    })

def casetas_en(request):

    latitude = 0
    longitude = 0

    icon_url = 'https://cdn2.iconfinder.com/data/icons/public-services-filledoutline/64/TOLL-toll_road-barriers-barrier-secure-security-stop-512.png'
    punto = Punto.objects.filter(categoria='caseta')
    m4 = folium.Map(location=[27.442054, -102.318994],zoom_start=6)
    for p in punto:
        icon = folium.features.CustomIcon(icon_url,icon_size=(28, 30))# Creating a custom Icon
        folium.Marker([p.lat,p.Lng],tooltip='<strong>'+p.desc+'</strong>',popup=p.nombre,icon=icon).add_to(m4)

    if request.method == 'POST':
        latitude = request.POST['lat']
        longitude  = request.POST['lon']
        distances = []
        points = []

        for p in punto:
            p1 = (latitude,longitude)
            p2 = (p.lat,p.Lng)
            distances.append(geodesic(p1,p2))
            points.append(p2)

        index = distances.index(min(distances))
        min_lat = points[index][0]
        min_lon = points[index][1]
        coordinates = [[longitude,latitude], [min_lon,min_lat]]

        folium.Marker([latitude, longitude], popup="<i>Tu estas aqui</i>").add_to(m4)
        route = client.directions(coordinates=coordinates, profile='driving-car', format='geojson')
        folium.GeoJson(route, name='route').add_to(m4)
        folium.LayerControl().add_to(m4)
        m4.location = [latitude,longitude]  
    
    m4 = m4._repr_html_()
    return render(request,'en/mapa_en.html',{
        'titleHead':'Tollbooths',
        'title':'Tollbooths',
        'desc':'See the location of the toll booths',
        'm': m4,
        'latitude': latitude,
        'longitude': longitude
    })

def page_en (request,slug):

    mapa = Mapa.objects.get(slug=slug)

    return render (request,'en/map_en.html',{
        "page": mapa
    })

def pages_en(request):
    return render((request),'en/paginas_en.html',{
        'titleHead':'Emergency points',
        'title':'Choose an option',
        'desc':'We show emergency points where you can request help at any time of your trip'
    })