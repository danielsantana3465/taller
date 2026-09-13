class Config:
    SECRET_KEY = "RANFLA_NUEVA2026"
    DEBUG = True


class DevelopmentConfig(Config):
    MYSQL_HOST = 'localhost'
    MYSQL_USER = 'root'
    MYSQL_PASSWORD = 'mysql'
    MYSQL_DATABASE = 'taller'


config = {
    "Development": DevelopmentConfig
}