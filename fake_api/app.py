from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return jsonify(message='Hello world'), 200

@app.route('/health')
def health():
    return jsonify(status='Healthy'), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)