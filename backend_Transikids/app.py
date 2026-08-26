from flask import Flask, request

app = Flask(__name__)

@app.route("/")
def inicio():
    return "Backend funcionando correctamente"

@app.route("/saludo")
def saludo():
    return "Hola desde mi API"

@app.route("/users", methods=["GET"])
def obtener_usuarios():
    return {
        "mensaje": "Lista de usuarios",
        "usuarios": []
    }

@app.route("/users", methods=["POST"])
def crear_usuario():
    datos = request.get_json()

    return {
        "mensaje": "Usuario recibido correctamente",
        "usuario": datos
    }

if __name__ == "__main__":
    app.run(debug=True)