from flask import Flask, flash, render_template, request, redirect, url_for, flash
from models.entities.User import User 
from flask_mysqldb import MySQL
from flask_login import LoginManager , login_user, login_required, current_user
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
        usuario = User(request.form['nombre'], request.form['correo'], request.form['clave'], None)
        usuarioAutenticado = ModelUser.signin(db, usuario)
        if usuarioAutenticado is not None:
            login_user(usuarioAutenticado)
            if usuarioAutenticado.clave:
                if usuarioAutenticado.perfil == 'A':
                    return render_template('admin.html')
                else:
                    return render_template('home.html')
            else:
                flash('Contraseña incorrecta')
                return redirect(url_for('home'))
        else:
            flash('Usuario inexistente')
            return redirect(url_for('home'))
    else:
        return render_template('home.html')

@tallerApp.route('/sUsuario', methods=['GET', 'POST'])
@login_required
def sUsuario():
    if current_user.perfil == 'A':
        selUsurio = db.connection.cursor()
        selUsurio.execute("SELECT * FROM usuario")
        u= selUsurio.fetchall()
        selUsurio.close()
        return render_template('users.html')
    else:
        flash('No tienes permisos para acceder a esta página')
        return redirect(url_for('home'))

@tallerApp.route('/iUsuario', methods=['GET', 'POST'])
@login_required
def iUsuario():
        if request.method == 'POST' and current_user.perfil == 'A':
            nombre = request.form['nombre']
            correo = request.form['correo']
            clave = request.form['clave']
            perfil = request.form['perfil']
            claveCifrada = generate_password_hash(clave)
            regUsuario = db.connection.cursor()
            regUsuario.execute("INSERT INTO usuario (nombre, correo, clave, perfil) VALUES (%s,%s,%s,%s)", (nombre, correo, claveCifrada))
            db.connection.commit()
            regUsuario.close()
            flash('Usuario registrado correctamente')
            return redirect(url_for('sUsuario'))
        else:
            return redirect(url_for('home'))
        
@tallerApp.route('/uUsuario/<int:id>', methods=['GET', 'POST'])
@login_required
def uUsuario(id):
        if request.method == 'POST' and current_user.perfil == 'A':
            nombre = request.form['nombre']
            correo = request.form['correo']
            perfil = request.form['perfil']
            actUsuario = db.connection.cursor()
            actUsuario.execute("UPDATE usuario SET nombre=%s, correo=%s, perfil=%s WHERE id=%s")
            db.connection.commit()
            actUsuario.close()
            flash("Usuario correctamente actualizado")
            return redirect(url_for('sUsuario'))
        else:
             return redirect(url_for('home'))

@tallerApp.route('/dUsuario/<int:id>', methods=['GET', 'POST'])
@login_required
def dUsuario(id):
        if request.method == 'POST' and current_user.perfil == 'A':
            delUsuario = db.connection.cursor()
            delUsuario.execute("DELETE FROM usuario WHERE id=%s",(id))
            db.connection.commit()
            delUsuario.close()
            flash("Usuario correctamente eliminado")
            return redirect(url_for('sUsuario'))
        else:
             return redirect(url_for('home'))





if __name__ == "__main__":
    tallerApp.run(port=5000, debug=True)
