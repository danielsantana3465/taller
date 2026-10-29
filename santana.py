from flask import Flask, flash, render_template, request, redirect, url_for, flash
from models.entities.User import User 
from flask_mysqldb import MySQL
from flask_login import LoginManager , login_user, login_required, current_user, logout_user
from config import config
from werkzeug.security import generate_password_hash
from models.ModelUser import ModelUser

tallerApp = Flask(__name__)
tallerApp.config.from_object(config['Development'])
db = MySQL(tallerApp)
adminUsuario = LoginManager(tallerApp)

@adminUsuario.user_loader
def agregarUsuario(id):
    return ModelUser.get_by_id(db, id)


@tallerApp.route("/")
def home():
    return render_template('/home.html')

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
            
            
        
            return render_template('home.html')
        else :
            return render_template('home.html')

@tallerApp.route('/signin', methods=['GET', 'POST'])
def signin():
    if request.method == 'POST':
        usuario = User(0, None, request.form['correo'], request.form['clave'], None)
        usuarioAutenticado = ModelUser.signin(db, usuario)
        if usuarioAutenticado is not None:
            login_user(usuarioAutenticado)
            if usuarioAutenticado.clave:
                if usuarioAutenticado.perfil == 'A':
                    return redirect(url_for('home_admin'))
                else:
                    return redirect(url_for('home_user'))
            else:
                flash('Contraseña incorrecta')
                return redirect(url_for('home'))
        else:
            flash('Usuario inexistente')
            return redirect(url_for('home'))
    else:
        return render_template('home.html')

@tallerApp.route('/signout', methods=['GET', 'POST'])
def signout():
    logout_user()
    return redirect(url_for('home'))

@tallerApp.route('/home_admin', methods=['GET', 'POST'])
def home_admin():
    return render_template('admin.html')

@tallerApp.route('/home_user', methods=['GET', 'POST'])
def home_user():
    return render_template('User.html')

@tallerApp.route('/sUsuario', methods=['GET', 'POST'])
@login_required
def sUsuario():
    return render_template('users.html')









if __name__ == "__main__":
    tallerApp.run(port=5000, debug=True)
