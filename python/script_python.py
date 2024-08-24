import os

#### carpeta data set ####
location = "C:/Users/gabri/Desktop/Cursos/Data Analytics-CERTUS/DataOps/Proyecto_Parcial/python/dataset"

#### Validar si existe la carpeta ###
if not os.path.exists(location):  # si no existe
    ## creo carpeta
    os.mkdir(location)
else: # si existe la carpeta
    ## borramos contenido
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root, name)) ## eliminar archivos
        for name in dirs:
            os.rmdir(os.path.join(root, name)) ## eliminar carpetas

#### Descargar dataset ####
from kaggle.api.kaggle_api_extended import KaggleApi

#### Autentificarnos Kaggle ####
api = KaggleApi()
api.authenticate()

#### listas todos los dataset disponibles ####
#print(api.dataset_list(search=''))

#### descargar un dataset ####
api.dataset_download_files('youssefismail20/olympic-games-1994-2024', path=location, force=True, quiet=False, unzip=True)