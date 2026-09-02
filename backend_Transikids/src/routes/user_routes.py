from flask import Blueprint, request, jsonify
from src.config.firebase_config import db

user_bp = Blueprint('users', __name__, url_prefix='/api/v1/users')

@user_bp.route('/login', methods=['POST'])
def login():
    datos = request.get_json()

    if not datos:
        return jsonify({"status": "error", "message": "No se enviaron datos en la solicitud"}), 400

    cedula_input = datos.get('cedula') or datos.get('usuario')
    password = datos.get('password')

    if not cedula_input or not password:
        return jsonify({"status": "error", "message": "Falta la cédula o la contraseña"}), 400

    cedula_str = str(cedula_input).strip()
    if not cedula_str.isdigit():
        return jsonify({
            "status": "error",
            "message": "La cédula de ciudadanía debe contener únicamente números"
        }), 400

    try:
        usuarios_ref = db.collection('usuarios')
        query = usuarios_ref.where('cedula', '==', cedula_str).stream()

        usuario_doc = None
        for doc in query:
            usuario_doc = doc.to_dict()
            break

        if usuario_doc and str(usuario_doc.get('password')) == str(password):
            return jsonify({
                "status": "success",
                "message": "Inicio de sesión exitoso",
                "data": {
                    "cedula": usuario_doc.get('cedula'),
                    "nombre": usuario_doc.get('nombre'),
                    "rol": usuario_doc.get('rol', 'acudiente'),
                    "proveedor": usuario_doc.get('proveedor', 'local')
                }
            }), 200
        else:
            return jsonify({
                "status": "error",
                "message": "Cédula o contraseña incorrectas"
            }), 401

    except Exception as e:
        return jsonify({
            "status": "error",
            "message": f"Error interno en el servidor: {str(e)}"
        }), 500