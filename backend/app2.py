import os
# import pyrebase
from flask import Flask, request, jsonify, session, Response

import pandas as pd
import numpy as np
from itertools import chain
from sklearn.feature_extraction.text import CountVectorizer 
from sklearn.metrics.pairwise import cosine_similarity 

data = pd.read_csv('../v-recipes.txt', sep=':', header = None)
data[1] = data[1].str.replace(",", " ")

count_vect_category = CountVectorizer(min_df=0, ngram_range=(1,2))
place_category = count_vect_category.fit_transform(data[1]) 
place_simi_cate = cosine_similarity(place_category, place_category) 
place_simi_cate_sorted_ind = place_simi_cate.argsort()[:, ::-1]
pd.DataFrame(place_simi_cate_sorted_ind)

def find_simi_place(df, sorted_ind, place_name, top_n=10):
    place_title = data[data[0] == place_name]
    place_index = place_title.index.values
    similar_indexes = sorted_ind[place_index, :(top_n)]
    similar_indexes = similar_indexes.reshape(-1)
    return df.iloc[similar_indexes]



app = Flask(__name__)

# config = {
#   "apiKey": "AIzaSyAG6QwyEiDmFV4pWQHQn-1q5J4Y6mlJcEI",
#   "authDomain": "lav1ne-sample.firebaseapp.com",
#   "projectId": "lav1ne-sample",
#   "storageBucket": "lav1ne-sample.appspot.com",
#   "messagingSenderId": "374481316324",
#   "appId": "1:374481316324:web:169065ccd71cc6db733ff1",
#   "measurementId": "G-3DE8YQ5DBG",
#   "databaseURL": ""
# }


# firebase = pyrebase.initialize_app(config)
# auth = firebase.auth()

app.secret_key='secret'


# @app.route('/login', methods = ['POST'])
# def signin():
#     email = request.json.get('email')
#     password = request.json.get('password')
#     if email is None or password is None:
#         return {"message": "Missing email or password"}, 400
    
#     try: 
#         user = auth.sign_in_with_email_and_password(email=email, password=password)
#         print (email)
#         user_id = auth.get_account_info(user['idToken'])
#         session['user'] = user_id
#         return {"message": f"User name: {user_id}"}, 200
#     except Exception as e:
#         return f"An Error Occurred: {e}"


# @app.route('/logout', methods = ['GET'])
# def logout():
#     # print (auth.current_user)
#     current_user = auth.current_user
#     if current_user is None:
#         return {"message":"No users signed in"}, 400

#     auth.current_user = None
#     return {"message": f"{current_user['email']} signed out"}, 200



# @app.route('/register', methods = ['GET','POST'])
# def register():
#     if request.method == 'POST':
#         email = request.json.get('email')
#         password = request.json.get('password')
#         if email is None or password is None:
#             return {"message": "Missing email or password"}, 400

#         try: 
#             auth.create_user_with_email_and_password(email=email, password=password)
#             return {"message": "Successfully registered"}, 200  
#         except Exception as e:
#             return f"An Error Occurred: {e}"


@app.route('/findSimilar', methods = ['POST'])
def findSimilar():
    # if auth.current_user is None:
    #     return {'message': 'No users signed in'}, 400
    # return {'message': 'aaaaaaaaaaaaa'},200
    try:
        food_input = request.json.get('food')
        ingredient_input = request.json.get('ingredient')
        similar_dishes_list = food_input + ingredient_input
        return {"similar_dishes": f"{similar_dishes_list}"}, 200  
    except Exception as e:
        return f"An Error Occurred: {e}", 400

    # input_list = []
    # for i in range(len(data)):
    #     if food_input in data[0][i]:
    #         input_list.append(data[0][i])

    # tmp_dishes_list = []
    # for user_input in input_list:
    #     recipes = find_simi_place(data, place_simi_cate_sorted_ind, user_input, 5)
    #     tmp_dishes_list.append(recipes[0].astype(str).tolist())

    # similar_dishes_list = list(chain.from_iterable(tmp_dishes_list))
    # list(set(similar_dishes_list))
    

if __name__ == '__main__':
    app.run(host = '0.0.0.0', port = 5000)