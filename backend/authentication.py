import pyrebase
import json
from firebase_admin import credentials, auth
from flask import Flask, request

config = {
  "apiKey": "AIzaSyAG6QwyEiDmFV4pWQHQn-1q5J4Y6mlJcEI",
  "authDomain": "lav1ne-sample.firebaseapp.com",
  "projectId": "lav1ne-sample",
  "storageBucket": "lav1ne-sample.appspot.com",
  "messagingSenderId": "374481316324",
  "appId": "1:374481316324:web:169065ccd71cc6db733ff1",
  "measurementId": "G-3DE8YQ5DBG",
  "databaseURL": ""
}


firebase = pyrebase.initialize_app(config)
auth = firebase.auth()

email = "test@gmail.com"
password = "123456"

# user = auth.create_user_with_email_and_password(email, password)

user = auth.sig_user_with_email_and_password(email, password)

print(user)

