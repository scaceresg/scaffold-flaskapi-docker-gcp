import uuid
from flask import Flask, jsonify, request

# Create flask app
app = Flask(__name__)

user_data = {}

# Get: Request data from a specified resource
@app.route('/')
def home():
    return jsonify({'data': "Hello there!"}), 200

@app.route('/get-users', methods=['GET'])
def get_users():
    if len(user_data) == 0:
        return jsonify({'user_data': "There are no users!"})
    else:
        return jsonify(user_data), 200

# Post: Create a resource
@app.route('/create-user', methods=['POST'])
def create_user():
    
    user_id = len(user_data) + 1
    if request.method == "POST":
        data = request.get_json()     
        
        user_data[user_id] = data
        
        return jsonify(user_data), 201

# Put: Update a resource

# Delete: Delete a resource 

if __name__ == '__main__':
    app.run(debug=True)