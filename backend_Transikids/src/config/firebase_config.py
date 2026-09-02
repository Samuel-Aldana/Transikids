import os
import firebase_admin
from firebase_admin import credentials, firestore

# Busca firebase_credentials.json subiendo de config -> src -> backend_Transikids
base_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
cred_path = os.path.join(base_dir, 'firebase_credentials.json')

# Si está guardado dentro de src/, ajusta la ruta automáticamente
if not os.path.exists(cred_path):
    cred_path = os.path.join(base_dir, '..', 'firebase_credentials.json')

# Evita la advertencia de duplicación al reiniciar Flask
if not firebase_admin._apps:
    if os.path.exists(cred_path):
        cred = credentials.Certificate(cred_path)
        firebase_admin.initialize_app(cred)
    else:
        print(f"Error: No se encontró el archivo de credenciales en {cred_path}")

db = firestore.client()
