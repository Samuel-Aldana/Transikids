from flask import Flask
from src.config.firebase_config import db
from src.routes.user_routes import user_bp

app = Flask(__name__)

# Registrar la ruta de usuarios
app.register_blueprint(user_bp)

@app.route('/')
def index():
    return {"status": "ok", "message": "API de Transitkids corriendo correctamente"}, 200

if __name__ == '__main__':
    app.run(debug=True, port=5000)