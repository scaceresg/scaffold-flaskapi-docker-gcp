from flask import Flask, jsonify, request

# Create flask app
app = Flask(__name__)

# Get health in route '/'
@app.route('/')
def index():
    data = "Hello there!"
    return jsonify({'data': data})


if __name__ == '__main__':
    app.run()