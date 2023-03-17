import datetime
from flask import Flask, flash, render_template, request, redirect, url_for, session
import mysql.connector
from werkzeug.utils import secure_filename
import os
app = Flask(__name__)
app.secret_key = 'secret_key'

UPLOAD_FOLDER = 'static/uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
connection = mysql.connector.connect(user="root", database="hello_guys")

@app.route("/")
def home():
    return redirect(url_for('login'))

#login page
@app.route("/login", methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        #check if the phonenumber is correct
        Name = request.form['Name']
        Phone = request.form['Phone']
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM account WHERE Name='" + Name + "' AND Phone='" + Phone + "'")
        user = cursor.fetchone()
        if user:

            session["un"] = user[1]
            session["img"] = user[0]
            session["des"] = user[3]
            return redirect(url_for("content"))
        else:
            flash('Invalid username or phonenumber')
            return render_template('login.html')
    return render_template('login.html')

#profile page
@app.route("/start")
def start():
    cur=connection.cursor()
    cur.execute("select * from account")
    result=cur.fetchall()
    cur.close()
    return render_template("start.html",data=result)



#message page
@app.route("/header")
def header():
    return render_template("header.html")

#message page
@app.route("/menu")
def menu():
    cur=connection.cursor()
    cur.execute("select * from account")
    result=cur.fetchall()
    cur.close()
    return render_template("menu.html",data=result)

#register page
@app.route("/accountsave", methods = ["GET","POST"])
def accountsave():

    if request.method == 'POST':
        file = request.files["file"]
        if file:
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        b = request.form["Name"]
        c = request.form["Phone"]
        d = request.form["des"]
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM account WHERE Phone='" + c + "'")
        user = cursor.fetchone()
        if user:
            flash("Phonenumber is already taken")
            return render_template('login.html')
        elif len(c) != 10:

            return redirect(url_for("login"))
        else:
            cursor = connection.cursor()
            cursor.execute("insert into account values('" + filename + "','" + b + "','" + c + "','" + d + "')")
            connection.commit()
            return redirect(url_for("login"))


#profile page delete
@app.route("/frontpagedelete", methods=["POST", "GET"])
def frontpagedelete():
        id = request.args.get("RN")
        cur = connection.cursor()
        cur.execute("delete from account where id = '" + id + "'")
        connection.commit()
        cur.close()
        return redirect(url_for("start"))

#---------------------------------
#        MESSAGE
#---------------------------------

@app.route("/content", methods=["POST", "GET"])
def content():
    uname = request.args.get("uname")
    if uname == "":
        uname = session["un2"]
    session["un2"] = uname
    cur=connection.cursor()
    cur.execute("select * from content where sender='" + str(uname) + "' or receiver='" + str(uname) + "'")
    result=cur.fetchall()
    cur.close()


    cur1 = connection.cursor()
    cur1.execute("select * from account")
    result1 = cur1.fetchall()
    cur1.close()
    return render_template("message.html", data=result, data1=result1)

@app.route("/messagesave",methods=["POST","GET"])
def message():
    if request.method == "POST":
        msg = request.form["message"]
        cur = connection.cursor()
        cur.execute("insert into content values('1','"+ session["un"] +"','"+ session["un2"] +"','"+msg+"','"+ str(datetime.datetime.now()) +"')")
        connection.commit()
        return redirect('http://127.0.0.1:5000/content?uname='+ session["un2"])

@app.route("/messagedelete", methods=["POST", "GET"])
def messagedelete():
        message = request.args.get("RN")
        cur = connection.cursor()
        cur.execute("delete from content where message = '" + message + "'")
        connection.commit()
        cur.close()
        return redirect(url_for("header"))
#---------------------------------
#        User Module
#---------------------------------


#add contact friends
@app.route("/addcontact")
def addcontact():
    return render_template("addcontact.html")

@app.route("/save",methods=["POST","GET"])
def save():
    if request.method == "POST":
        a = request.form["id"]
        b = request.form["profile"]
        c = request.form["Name"]
        d = request.form["phnumber"]
        e = request.form["des"]
        cur = connection.cursor()
        cur.execute("insert into userinfo values('"+a+"','"+b+"','"+c+"','"+d+"','"+e+"')")
        connection.commit()
        return redirect(url_for("header"))

@app.route("/editcontact")
def editcontact():
    id = request.args.get("RN")
    cur = connection.cursor()
    cur.execute("select * from userinfo where id = '" + id + "'")
    result = cur.fetchall()
    cur.close()
    return render_template("editcontact.html", data=result)

@app.route("/contactupdate", methods = ["POST","GET"])
def contact_update():
    if request.method == "POST":
        a = request.form["id"]
        b = request.form["profile"]
        c = request.form["Name"]
        d = request.form["phnumber"]
        e = request.form["des"]
        cur = connection.cursor()
        cur.execute("update userinfo set profile='"+b+"', Name='"+c+"', phnumber='"+d+"', description='"+e+"' where id='"+a+"'")
        connection.commit()
        return redirect(url_for("header"))

@app.route("/contactdelete", methods=["POST", "GET"])
def contact_delete():
        id = request.args.get("RN")
        cur = connection.cursor()
        cur.execute("delete from userinfo where id = '" + id + "'")
        connection.commit()
        cur.close()
        return redirect(url_for("header"))


if __name__=="__main__":
    app.run(debug=True)
