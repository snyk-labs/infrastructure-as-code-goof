from flask import Flask, request
import psutil
import subprocess
app = Flask(__name__)


@app.route('/app1/allocate')
def allocate():
    mbToAllocate = request.args.get('M')
    secs = request.args.get('sec')
    ret = subprocess.call(['stress-ng', '--vm', '1', '--vm-bytes',
                           mbToAllocate + 'M', '--timeout', str(secs) + 's', '--vm-keep', '-m', '1'])

    if ret == 0:
        return "APP1 !!!!!! Allocated " + mbToAllocate + "MB"
    else:
        return "APP1 !!!!!! Failed to allocate " + mbToAllocate + "MB"


@app.route('/app1/stress')
def stress():
    secs = 20
    mem = psutil.virtual_memory()
    k = mem.available / 1024
    subprocess.call(['stress-ng', '--vm', '1', '--vm-bytes',
                     str(k) + 'k', '--timeout', str(secs) + 's', '--vm-keep', '-m', '1'])

    return "APP1 !!!!!! Allocated " + str(k / 1024) + "MB"


@app.route('/app1/mem')
def mem():
    available = psutil.virtual_memory()
    print(available)
    return "APP1 !!!!!! Total: %dMB\tAvailable: %dMB" % (available.total / 1024 / 1024, available.available / 1024 / 1024)


@app.route('/')
def liveness():
    return "OK"


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8081)
