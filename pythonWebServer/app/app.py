import multiply
from flask import Flask
from flask import request
from flask import Response
import json

app = Flask(__name__)

@app.route('/multiply')
def hello():
    x = request.args.get('x')
    y = request.args.get('y')
    
    # Error Manament
    # if var not null and var == int
    #   run code
    # else
    # return error = true and restuls = null???
    
    ans = multiply.mply(x,y)
    strEquation = "%s*%s=%s" % (x, y, ans)
    strAns = str(ans)
    error = False

    info = {
        "error": error,
        "string": strEquation,
        "answer": strAns
    }

    reply = json.dumps(info)
    r = Response(response=reply, status=200, mimetype="application/json")
    r.headers["Content-Type"]="application/json"
    r.headers["Access-Contorl"]="*"
    return r

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)