from flask_mysqldb import MySQL
from config import config

tallerApp.config.from_object(config['Development'])
db = MySQL(tallerApp)
