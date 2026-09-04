from flask import Flask, render_template # type: ignore
from flask_mysqldb import MySQL
from config import config
tallerApp = Flask(__name__)

tallerApp.config.from_object(config['Development'])
db = MySQL(tallerApp)
@tallerApp.route("/")
def home():
    return render_template(home.html)
if __name__ == "__main__":
    tallerApp.run(debug=True,port=5000)