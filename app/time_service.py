from flask import Flask, request, jsonify
from datetime import datetime
import pytz

app = Flask(__name__)

@app.route("/", methods=["GET"])
def get_time():
    # Convert UTC time to IST
    ist = pytz.timezone("Asia/Kolkata")
    ist_time = datetime.now(ist).isoformat()

    return jsonify({
        "timestamp": ist_time,
        "ip": request.remote_addr
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000, debug=True)
