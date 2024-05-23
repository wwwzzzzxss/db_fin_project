from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
from flask_socketio import SocketIO

app = Flask(__name__)

HOSTNAME = "127.0.0.1"
PORT = 3306
USERNAME = "root"
PASSWORD = "qwe123zxcnmq"
DATABASE = "food"

app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql+pymysql://{USERNAME}:{PASSWORD}@{HOSTNAME}:{PORT}/{DATABASE}?charset=utf8mb4"
app.config['SECRET_KEY'] = 'secret!'  # 你需要設置一個秘密金鑰

db = SQLAlchemy(app)
socketio = SocketIO(app)

class Orders(db.Model):
    __tablename__ = 'orders'
    id = db.Column(db.Integer, primary_key=True)
    customer_id = db.Column(db.Integer)
    total = db.Column(db.Integer)

@app.route('/')
def index():
    items = Orders.query.all()

    print(items)
    return render_template('index.html', items=items)

if __name__ == '__main__':
    
    socketio.run(app, debug=True)
