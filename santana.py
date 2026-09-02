from flask import Flask, render_template # type: ignore
tallerApp = Flask(__name__)

@tallerApp.route("/")
def home():
    return render_template(home.html)
if __name__ == "__main__":
    tallerApp.run(debug=True,port=5000)