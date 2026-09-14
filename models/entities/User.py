from flask_login import UserMixin
from werkzeug.security import check_password_hash

class User(UserMixin):
    def __init__(self, id, nombre, correo, clave):
        self.id = id
        self.nombre = nombre
        self.correo = correo
        self.clave = clave

    def validar_clave(self, clave):
        return check_password_hash(self.clave, password)