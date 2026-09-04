class config:
    SECRET_KEY = "RANFLA_NUEVA2026"
    DEBUG      = True
    
    class DevelopmentConfig(Config):
        mysql_host = 'localhost'
        mysql_user = 'root'
        mysql_password = 'mysql'
        mysql_database = 'taller'
        
        config = {
            "Development": DevelopmentConfig
        }