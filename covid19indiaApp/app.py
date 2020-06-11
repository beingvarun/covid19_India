from flask import Flask
from flask import render_template
import pandas as pd
from wrangler_scripts.wrangler import hello

data = hello()
print(data)
#create instance




app = Flask(__name__)

@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html')


if __name__ == '__main__':
    app.run()
