from app import app, db, Order
app.app_context().push()

new_order = Order(description='New order description')
db.session.add(new_order)
db.session.commit()
