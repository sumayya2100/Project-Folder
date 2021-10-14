from flask import Flask, jsonify
app = Flask(__name__)

coaches = [
    { 'firstName': "Abe", 'lastName': "Junya"  },
    { 'firstName': "Aly", 'lastName': "Kamal"  }
]
athletes = [
    { 'id': "1", 'firstName': "AAlerud", 'lastName': "Katrine"  },
    { 'id': "2",'firstName': "Abad", 'lastName': "Nestor"  },
    { 'id': "3",'firstName': "Abagnale", 'lastName': "Giovanni"  },
    { 'id': "4",'firstName': "Abalde", 'lastName': "Alberto"  },
    { 'id': "5",'firstName': "Abalde", 'lastName': "Tamara"  }
]

@app.route('/hello')
def hello():
    greeting = "Gear up everyone!"
    return greeting

@app.route('/coaches', methods=["GET"])
def getCoaches():
    return jsonify(coaches)

@app.route('/athletes', methods=["GET"])
def getAthletes():
    return jsonify(athletes)

@app.route('/coach/<id>', methods=["GET"])
def getCoach(id):
    id = int(id) - 1
    return jsonify(coaches[id])

@app.route('/athlete/<id>', methods=["GET"])
def getAthlete(id):
    id = int(id) - 1
    return jsonify(athletes[id])

if __name__ == "__main__":
    app.run(host="0.0.0.0",port=8080)