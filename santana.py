from flask import Flask, render_template, request, redirect # type: ignore
from flask_mysqldb import MySQL
from config import config
from werkzeug.security import generate_password_hash
tallerApp = Flask(__name__)

tallerApp.config.from_object(config['Development'])
db = MySQL(tallerApp)
@tallerApp.route("/")
def home():
    return render_template('home.html')
@tallerApp.route('/signup', methods=['GET', 'POST'])
def signup():
        if request.method == 'POST':
            nombre = request.form['nombre']
            correo = request.form['correo']
            clave = request.form['clave']
            claveCifrada = generate_password_hash(clave)
            regUsuario = db.connection.cursor()
            regUsuario.execute("INSERT INTO usuario (nombre, correo, clave) VALUES (%s,%s,%s)", (nombre, correo, claveCifrada))
            db.connection.commit()
            regUsuario.close()
if __name__ == "__main__":
    tallerApp.run(debug=True,port=5000)