import multiply
from flask import Flask
from flask import request
from flask import Response
import json

app = Flask(__name__)

@app.route('/multiply')
def hello():

    data = {}
    rStatus = 200

    try:
        
        x = request.args.get('x')
        y = request.args.get('y')
        ans = multiply.mply(x,y)
        strEquation = "%s*%s=%s" % (x, y, ans)
        data = {"Errors": False, "Equation": strEquation, "Answer": ans }

    except:

        rStatus = 400
        data = { "Error": True, "Equation": None, "Answer": None }
    
    reply = json.dumps(data)
    r = Response(response=reply, status=rStatus, mimetype="application/json")
    r.headers["Content-Type"]="application/json"
    r.headers["Access-Control"]="*"
    return r

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)