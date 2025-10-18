from robot.api.deco import keyword
from pymongo import MongoClient

client = MongoClient('mongodb+srv://qa:xperience@cluster0.wfsifkv.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0')

db = client['markdb']

@keyword("Remove User from Database")
def remove_user(email):
    users = db['users']
    users.delete_many({'email': email})
    print(f"Removing user by:" + email)

@keyword("Insert User in Database")
def insert_user(user):
    users = db['users']  # garanta que o nome da coleção esteja correto
    users.insert_one(user)
    print(f"Inserting user: {user}") 
    