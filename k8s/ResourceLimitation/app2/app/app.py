from flask import Flask, request, render_template
import psutil
import subprocess
app = Flask(__name__)


@app.route('/')
@app.route('/app2/')
def liveness1():
    return render_template('index.html', body="Check the Pod memory status on", link="/app2/mem")


@app.route('/app2/mem')
def mem():
    available = psutil.virtual_memory()
    body = "Total: %dMB\tAvailable: %dMB" % (
        available.total / 1024 / 1024, available.available / 1024 / 1024)
    return render_template('index.html', body=body)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8081)
