from flask import Flask, request, render_template
import psutil
import subprocess
app = Flask(__name__)


class Content(object):
    pass


content1 = Content()
content1.body = "Check the Pod memory status"
content1.link = '/app1/mem'

content2 = Content()
content2.body = "Allocate most of the available memory of the running Pods for 10 secs"
content2.link = '/app1/stress'

content3 = Content()
content3.body = "Manually increase memory by setting # of MB to allocate and time to run (in secs)"
content3.link = '/app1/allocate?MBs=100&Secs=10'
sanityContents = [content1, content2, content3]
@app.route('/')
@app.route('/app1/')
def liveness1():
    return render_template('index.html', contents=sanityContents)


@app.route('/app1/allocate')
def allocate():
    mbToAllocate = request.args.get('MBs')
    secs = request.args.get('Secs')
    ret = subprocess.call(['stress-ng', '--vm', '1', '--vm-bytes',
                           mbToAllocate + 'M', '--timeout', str(secs) + 's', '--vm-keep', '-m', '1'])

    content = Content()
    if ret == 0:
        content.body = "Allocated " + mbToAllocate + "MB"
    else:
        content.body = "Failed to allocate " + mbToAllocate + "MB"
    return render_template('index.html', contents=[content])


@app.route('/app1/stress')
def stress():
    secs = 20
    mem = psutil.virtual_memory()
    k = mem.available / 1024
    subprocess.call(['stress-ng', '--vm', '1', '--vm-bytes',
                     str(k) + 'k', '--timeout', str(secs) + 's', '--vm-keep', '-m', '1'])

    content = Content()
    content.body = "Allocated " + str(k / 1024) + "MB"
    return render_template('index.html', contents=[content])


@app.route('/app1/mem')
def mem():
    available = psutil.virtual_memory()
    content = Content()
    content.body = "Total: %dMB\tAvailable: %dMB" % (
        available.total / 1024 / 1024, available.available / 1024 / 1024)
    return render_template('index.html', contents=[content])


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8081)
