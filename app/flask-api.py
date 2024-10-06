from flask import Flask, jsonify, request

# Create flask app
app = Flask(__name__)

# Get health in route '/'
@app.route('/')
def home():
    return jsonify({'data': "Hello there!"})

if __name__ == '__main__':
    app.run(debug=True)