from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api', methods=['GET'])
def get_status():
    return jsonify({'result': 'SUCCESS'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
