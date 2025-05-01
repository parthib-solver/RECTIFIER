
import os.path
import uuid
import werkzeug
from flask import Flask, render_template, request, session, jsonify, redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
import json
import random
from sqlalchemy import func
from web3 import Web3

with open("config.json", "r") as c:
    params = json.load(c)["Params"]

app = Flask(__name__)
app.secret_key = "Re"
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:0019@localhost/Rectifier'
app.config["ThumbnailStorage"] = params["ThumbnailStorage"]
app.config["VideoStorage"] = params["VideoStorage"]
app.config["TrailerStorage"] = params["TrailerStorage"]
app.config["ProfilePic"] = params["ProfilePic"]
db = SQLAlchemy(app)
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['GmailName'],
    MAIL_PASSWORD=params['GmailPassword']
)
mail = Mail(app)


class Userinfo(db.Model):
    UNAME = db.Column(db.String(80), nullable=False)
    Gmail = db.Column(db.String(20), nullable=False, primary_key=True)


class Mainfeedback(db.Model):
    UGmail = db.Column(db.String(50), nullable=False)
    Thumbnail = db.Column(db.String(50), nullable=False)
    Trailer = db.Column(db.String(50), nullable=False)
    Catagory = db.Column(db.String(50), nullable=False)
    Content = db.Column(db.String(50), nullable=False, primary_key=True)
    Title = db.Column(db.String(50), nullable=False)
    pros = db.Column(db.String(50), nullable=False)
    cons = db.Column(db.String(50), nullable=False)
    Value = db.Column(db.Float, nullable=False)


class Aboutofuser(db.Model):
    About = db.Column(db.String(50), nullable=False)
    Gmail = db.Column(db.String(50), primary_key=True)


class Profilepic(db.Model):
    PPic = db.Column(db.String(50), nullable=False)
    UGmail = db.Column(db.String(50), primary_key=True)


class Comments(db.Model):
    Sno = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Comment = db.Column(db.String(500), nullable=False)
    UName = db.Column(db.String(50), nullable=False)
    Content = db.Column(db.String(50), nullable=False)
    PPic = db.Column(db.String(50), nullable=False)


class Likes(db.Model):
    Sno = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Thumbnail = db.Column(db.String(50), nullable=False)
    Content = db.Column(db.String(50), nullable=False)
    Title = db.Column(db.String(50), nullable=False)
    Gmail = db.Column(db.String(50), nullable=False)
    Profilepic = db.Column(db.String(50), nullable=False)
    CreatorsName = db.Column(db.String(50), nullable=False)
    DateTime = db.Column(db.String(50), nullable=True, default=db.func.current_timestamp())


class History(db.Model):
    Sno = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Thumbnail = db.Column(db.String(50), nullable=False)
    Content = db.Column(db.String(50), nullable=False)
    Title = db.Column(db.String(250), nullable=False)
    Gmail = db.Column(db.String(50), nullable=False)
    Profilepic = db.Column(db.String(50), nullable=False)
    CreatorsName = db.Column(db.String(50), nullable=False)
    DateTime = db.Column(db.String(50), nullable=True, default=db.func.current_timestamp())


class Payments(db.Model):
    ClinetEmail = db.Column(db.String(50), nullable=False)
    CreatersName = db.Column(db.String(50), nullable=False)
    CreatersEmail = db.Column(db.String(50), nullable=False)
    Thumbnail = db.Column(db.String(50), nullable=False)
    CreatersProfilePic = db.Column(db.String(50), nullable=False)
    Title = db.Column(db.String(50), nullable=False)
    DateTime = db.Column(db.String(50), nullable=True, primary_key=True, default=db.func.current_timestamp())


with app.app_context():
    most_liked_content = db.session.query(Likes.Content, func.count(Likes.Sno).label('likes_count')) \
        .group_by(Likes.Content) \
        .order_by(func.count(Likes.Sno).desc()) \
        .all()

    if most_liked_content:
        print("Most liked content:")
        for content, likes_count in most_liked_content:
            print(f"Content: '{content}', Likes: {likes_count}")
    else:
        print("No likes found.")


Otp = random.randrange(100000, 999999)

print(Otp)


def generate_unique_filename(filename):
    ext = ''
    if '.' in filename:
        ext = filename.rsplit('.', 1)[1]  # Get the file extension
    new_filename = f"{uuid.uuid4().hex}.{ext}"
    return new_filename


def mathingWordsR(sentence1, sentence2):
    words1 = sentence1.strip().split("/")
    sentenc2 = sentence2.Catagory
    words2 = sentenc2.strip().split("/")
    score = 0
    for word1 in words1:
        for word2 in words2:
            # print(f"Matching {word1} with {word2}")
            if word1.lower() == word2.lower():
                score += 1
    return score


def mathingWords(sentence1, sentence2):
    words1 = sentence1.strip().split(" ")
    sentenc2 = sentence2.Title
    words2 = sentenc2.strip().split(" ")
    score = 0
    for word1 in words1:
        for word2 in words2:
            # print(f"Matching {word1} with {word2}")
            if word1.lower() == word2.lower():
                score += 1
    return score


def duplicate_remover(ErroedList):
    DuplicateRemovedList = []
    for Errored in ErroedList:
        if not any(wc.Content.split(".")[0] == Errored.Content.split(".")[0] for wc in DuplicateRemovedList):
            DuplicateRemovedList.append(Errored)
    return DuplicateRemovedList


def most_liked_content(table_name):
    # Get the table class dynamically based on the provided table name
    table_class = globals()[table_name]

    # Query to get the most liked content and their like counts
    query = db.session.query(
        table_class.Content,
        db.func.any_value(table_class.Thumbnail).label('Thumbnail'),
        db.func.any_value(table_class.Gmail).label('Gmail'),
        db.func.any_value(table_class.Title).label('Title'),
        db.func.any_value(table_class.Profilepic).label('Profilepic'),
        db.func.any_value(table_class.CreatorsName).label('CreatorsName'),
        db.func.count(table_class.Content).label('LikesCount')
    ).group_by(table_class.Content).order_by(db.desc('LikesCount'))

    # Execute the query and fetch the results
    result = query.all()

    # Retrieve the content with the highest count
    most_liked_content = result[0][0]

    # Retrieve all rows associated with the most liked content
    rows = table_class.query.filter_by(Content=most_liked_content).all()

    # Retrieve the remaining liked content and their counts
    remaining_contents = result[1:]

    # Sort the remaining contents based on their like counts in descending order
    sorted_contents = sorted(remaining_contents, key=lambda x: x[1], reverse=True)

    # Use a set to store unique content names
    unique_content = {most_liked_content}

    # Retrieve all rows associated with the remaining liked content and add them to the unique_content set
    for content in sorted_contents:
        rows += table_class.query.filter_by(Content=content[0]).all()
        unique_content.add(content[0])

    # Remove duplicates based on the Content column
    rows = list({row.Content: row for row in rows}.values())

    return rows


@app.route("/registration", methods=["GET", "POST"])  # Registration BAr
def Log_in_bar():
    if request.method == "POST":
        name = request.form.get("Name")
        email = request.form.get("Email")
        DbEmail = Userinfo.query.filter_by(Gmail=email).order_by(Userinfo.UNAME).all()
        G = ""
        for i in DbEmail:
            G += i.Gmail
        if name == G:
            mg = "This email id is already existing"
            return render_template("registration.html", Msg=mg)
        try:
            mail.send_message('New message for ' + name,
                              sender=[params['GmailName'], params['GmailAddress']],
                              recipients=[email],
                              body='your OTP ' + str(Otp)
                              )
        except Exception as e:
            return render_template("registration.html", Msg="Opps, internet is not available")

        return render_template('OtpVerification.html', Uname=name, email=email)
    return render_template('registration.html')


@app.route("/OtpVerification", methods=["POST", "GET"])  # Verification
def Verification():
    name = request.form.get("Uname")
    email = request.form.get("U_Email")
    OTP = request.form.get("Verification")
    otpe = int(OTP)
    if Otp == otpe:
        LocalEmail = Userinfo.query.filter_by(Gmail=email).order_by(Userinfo.Gmail).all()
        if LocalEmail == []:
            mail.send_message('We have got a new user named ' + name,
                              sender=[params['GmailName'], params['GmailAddress']],
                              recipients=[params["ParthibAccount"]],
                              body='I have made a new user ' + name
                              )
            entry = Userinfo(UNAME=name, Gmail=email)
            db.session.add(entry)
            db.session.commit()
            session["E-user"] = email
            print(email)
            session["user"] = name
            return render_template("SucceedMassage.html", Sm="Verification Succeed")
        else:
            session["E-user"] = email
            session["user"] = name
            return render_template("SucceedMassage.html", Sm="Verification Succeed")
    else:
        return render_template("failed attempt.html", Sm="Verification failed")


@app.route("/logInBar", methods=["GET", "POST"])  # LOginBar
def LBAr():
    if 'user' in session and 'E-user' in session:
        UId = session['user']
        PP = UId[0]
        email = session['E-user']
        print(email)
        Comment = Profilepic.query.filter_by(UGmail=email).first()
        return render_template("Profile.html", PP=PP, Uname=UId, Email=email, Comment=Comment)
    elif request.method == "POST":
        name = request.form.get("Name")
        email = request.form.get("Email")
        G = ""
        y = ""
        DbEmail = Userinfo.query.filter_by(Gmail=email).order_by(Userinfo.Gmail).all()
        DbUName = Userinfo.query.filter_by(Gmail=email).order_by(Userinfo.UNAME).all()
        for i in DbUName:
            y += i.UNAME
        for i in DbEmail:
            G += i.Gmail
        if G == email and y == name:
            try:
                mail.send_message('New message for ' + name,
                                  sender=[params['GmailName'], params['GmailAddress']],
                                  recipients=[email],
                                  body='your OTP ' + str(Otp)
                                  )
                user_agent = request.headers.get('User-Agent')
                if 'Macintosh' in user_agent:
                    return render_template("OtpVerification.html", Uname=name, email=G)
                elif 'Windows' in user_agent:
                    return render_template("OtpVerification.html", Uname=name, email=G)
                else:
                    return render_template("OtpVerificationforTabs.html", Uname=name, email=G)
            except Exception as e:
                return render_template("registration.html", Msg="Opps, internet is not available")
        else:
            msge = "you have no Account sign in at first,please"
            return render_template('registration.html', Msg=msge)
    else:
        user_agent = request.headers.get('User-Agent')
        if 'Macintosh' in user_agent:
            return render_template("LogIn.html")
        elif 'Windows' in user_agent:
            return render_template("LogIn.html")
        else:
            return render_template("LoginforTabs.html")


@app.route("/LogOut")  # LOg out
def logOut():
    session.pop('user', None)
    session.pop('E-user', None)
    return render_template("Login.html")


@app.route("/Watched")  # Backend Pop up
def backed():
    if "user" in session:
        VHistory = History.query.filter_by(Gmail=session['E-user']).all()
        Comment = Profilepic.query.filter_by(UGmail=session['E-user']).first()
        return render_template('WatchedPopUp.html', VHistory=reversed(VHistory), Comment=Comment)

    massage = "Please, Login at first"
    user_agent = request.headers.get('User-Agent')
    if 'Macintosh' in user_agent:
        return render_template("LogIn.html", Msg=massage)
    elif 'Windows' in user_agent:
        return render_template("LogIn.html", Msg=massage)
    else:
        return render_template("LoginforTabs.html", Msg=massage)


@app.route("/AboutInput", methods=["Get", "POST"])
def AboutInput():
    if 'user' in session:
        if request.method == "POST":
            About = request.form.get("About_Write")
            Gmail = session["E-user"]
            Uinfo = Aboutofuser.query.filter_by(Gmail=Gmail).all()
            if len(Uinfo) == 0:
                entry = Aboutofuser(About=About, Gmail=Gmail)
                db.session.add(entry)
                db.session.commit()
                return redirect('/studios')
            else:
                Uinfo = Aboutofuser.query.filter_by(Gmail=Gmail).first()
                Uinfo.About = About
                db.session.commit()
                return redirect('/studios')
        MyName = session['user']
        MYEmail = session['E-user']
        About = Aboutofuser.query.filter_by(Gmail=MYEmail).all()
        Contents = Mainfeedback.query.filter_by(Gmail=MYEmail).all()
        PP = Profilepic.query.filter_by(Gmail=MYEmail).all()
        return render_template('StudioUpload.html', name=MyName, Contents=Contents, Abouts=About, PPs=PP)
    else:
        massage = "Please, Login at first"
        return render_template('Login.html', Msg=massage)


@app.route("/ProfilePic", methods=["Get", "POST"])
def ProfilePic():
    if 'user' in session:
        if request.method == "POST":
            Profilepi = request.files["ProfilePic"]
            Gmail = session["E-user"]
            Uinfo = Profilepic.query.filter_by(UGmail=Gmail).all()
            NewProfilePic = generate_unique_filename(Profilepi.filename)
            if len(Uinfo) == 0:
                Profilepi.save(os.path.join(app.config["ProfilePic"], NewProfilePic))
                entry = Profilepic(PPic=NewProfilePic, UGmail=Gmail)
                db.session.add(entry)
                db.session.commit()
                return redirect('/studios')
            else:
                Uinfo = Profilepic.query.filter_by(Gmail=Gmail).first()
                Uinfo.PPic = NewProfilePic
                db.session.commit()
                return redirect('/studios')

        MyName = session['user']
        MYEmail = session['E-user']
        About = Aboutofuser.query.filter_by(Gmail=MYEmail).all()
        Contents = Mainfeedback.query.filter_by(Gmail=MYEmail).all()
        PP = Profilepic.query.filter_by(Gmail=MYEmail).all()
        return render_template('StudioUpload.html', name=MyName, Contents=Contents, Abouts=About, PPs=PP)
    else:
        massage = "Please, Login at first"
        return render_template('Login.html', Msg=massage)


@app.route("/uploading", methods=['GET', 'POST'])  # UPloading Video
def uploading():
    if 'user' in session and 'E-user' in session:
        if request.method == "POST":
            try:
                Thumbnail = request.files.get("Thumbnail")
                Video = request.files.get("Video")
                Trailer = request.files.get("TrailerV")
                Pros = request.form.get("Pros")
                Cons = request.form.get("Cons")
                Catagory =request.form.get("Catagory")
                Value = request.form.get("PurchesValue")
                Title = request.form.get("title")
            except werkzeug.exceptions.BadRequestKeyError:
                return jsonify({'status': 'error', 'message': 'Missing file parameter'}), 400
            I_Thumbnail = generate_unique_filename(Thumbnail.filename)
            I_video = generate_unique_filename(Video.filename)
            I_Trailer = generate_unique_filename(Trailer.filename)


            # Video detail store
            gmail = session['E-user']

            entry = Mainfeedback(Thumbnail=I_Thumbnail, UGmail=gmail, Content=I_video, Trailer=I_Trailer, pros=Pros,
                             cons=Cons, Catagory=Catagory, Value=float(Value), Title=Title)
            db.session.add(entry)
            db.session.commit()

            # file uploading here
            PP = Profilepic.query.filter_by(UGmail=session['E-user']).first()
            About = Aboutofuser.query.filter_by(Gmail=session['E-user']).first()

            Thumbnail.save(os.path.join(app.config["ThumbnailStorage"], I_Thumbnail))
            Video.save(os.path.join(app.config["VideoStorage"], I_video))
            Trailer.save(os.path.join(app.config["TrailerStorage"], I_Trailer))
            return render_template("/SUM.html", Sm="you have Successfully Uploaded your Feedback",ProfilePic=PP, Abouts=About)
    PP = Profilepic.query.filter_by(UGmail=session['E-user']).first()
    About = Aboutofuser.query.filter_by(Gmail=session['E-user']).first()
    return render_template('FeedBackUpload.html', ProfilePic=PP, Abouts=About)


@app.route("/studios", methods=["GET", "POST"])  # STudios
def studios():
    if 'user' in session and 'E-user' in session:
        MyName = session['user']
        MYEmail = session['E-user']
        About = Aboutofuser.query.filter_by(Gmail=MYEmail).first()
        PP = Profilepic.query.filter_by(UGmail=MYEmail).first()
        Contents = Mainfeedback.query.filter_by(UGmail=MYEmail).all()
        return render_template('StudioUpload.html', name=MyName, Contents=Contents, Abouts=About, ProfilePic=PP)
    else:
        massage = "Please, Login at first"
        return render_template('Login.html', Msg=massage)


@app.route("/VideoPlayer/<string:Content>")
def VideoPlayer(Content):
    # Video Content
    if "E-user" in session:
        print(Content)
        Current_Url = request.url
        Trequest = request.args.get("Trequest")
        VContent = Mainfeedback.query.filter_by(Content=Content).first()
        Thumbnail=VContent.Thumbnail
        Email = Mainfeedback.query.filter_by(Content=Content).first()
        E = Email.UGmail
        PP = Profilepic.query.filter_by(UGmail=E).first()
        Name = Userinfo.query.filter_by(Gmail=E).first()
        UName=Name.UNAME
        #Histry saver
        entry = History(Title=VContent.Title, Profilepic=PP.PPic, Content=VContent.Content, CreatorsName=UName, Thumbnail=Thumbnail, Gmail=session['E-user'])
        db.session.add(entry)
        db.session.commit()
        #Comments
        Commentts = Comments.query.filter_by(Content=Content).all()
        Reverce = reversed(Commentts)
        # likes
        like = Likes.query.filter_by(Content=Content).all()
        INtLIke = len(like)
        Y = 0
        if len(like) == 0:
            Y += 1
        else:
            for i in like:
                if i.Gmail == session['E-user']:
                    Y *= 0
                    break
                else:
                    Y += 1
        #primium Cheaking
        Primium_Count = Payments.query.filter_by(ClinetEmail=session['E-user'], Thumbnail=VContent.Thumbnail).first()
        print(type(Primium_Count))
        if Primium_Count is None or Trequest == "Trailer":
                return render_template('/PlayerTrailer.html', content=VContent, Name=UName, PP=PP, Comments=Reverce, Likes=INtLIke, iGmail=Y, LU=like, UGmail=session['E-user'], ShereUrl=Current_Url)
        else:
            return render_template('/PlayerPrimium.html', content=VContent, Name=UName, PP=PP, Comments=Reverce,
                                   Likes=INtLIke, iGmail=Y, LU=like, UGmail=session['E-user'], ShereUrl=Current_Url)

    massage = "Please, Login at first"
    user_agent = request.headers.get('User-Agent')
    if 'Macintosh' in user_agent:
        return render_template("LogIn.html", Msg=massage)
    elif 'Windows' in user_agent:
        return render_template("LogIn.html", Msg=massage)
    else:
        return render_template("LoginforTabs.html", Msg=massage)


@app.route("/Comments", methods=['POST'])
def Comment():
    if 'user' in session:
        Title = request.form.get("Title")
        Arts = request.form.get("Arts")
        Commentts = request.form.get("Comment")
        UName = session['user']
        print(Title)
        UEmail = session['E-user']
        PPs = Profilepic.query.filter_by(UGmail=UEmail).first()
        PP = PPs.PPic
        entry = Comments(Comment=Commentts, UName=UName, Content=Arts, PPic=PP)
        db.session.add(entry)
        db.session.commit()
        return redirect("/VideoPlayer/{}".format(Arts))
    return render_template("/Login.html", Msg="Please, make your Account first")


@app.route("/Liked", methods=['GET'])
def liked():
    if 'user' in session:
        Content = Likes.query.filter_by(Gmail=session['E-user']).all()
        a = reversed(Content)
        Comment = Profilepic.query.filter_by(UGmail=session['E-user']).first()
        return render_template('/LIKED.html', LHistory=a, Comment=Comment)

    return render_template("/Login.html", Msg="Please,Log in atfirst")


@app.route("/Like", methods=['GET'])
def like():
    if 'user' in session:
        Name = session['E-user']
        Content = request.args.get('Content')
        C = Mainfeedback.query.filter_by(Content=Content).first()
        Profilepice = Profilepic.query.filter_by(UGmail=C.UGmail).first()
        Uname = Userinfo.query.filter_by(Gmail=C.UGmail).first()
        entry = Likes(Gmail=Name, Content=Content, Thumbnail=C.Thumbnail, Title=C.Title, CreatorsName=Uname.UNAME,
                      Profilepic=Profilepice.PPic)
        db.session.add(entry)
        db.session.commit()
        return redirect("/VideoPlayer/{}".format(Content))
    return render_template("/Login.html", Msg="Please, make your Account first")


@app.route("/")  # Main Home page
def hello():
    # Check if the user is in the session
    if "E-user" in session:
        # Fetch the user's liked and watched content based on their email ID
        user_email = session["E-user"]
        liked_contents = Likes.query.filter_by(Gmail=user_email).all()
        #watched content
        watched_contents = duplicate_remover(History.query.filter_by(Gmail=user_email).all())

        # Create a list to store the matched contents from Mainfeedback
        PList = []

        # Find matching contents from Mainfeedback based on Likes and History
        for liked_content in liked_contents:
            matching_content = Mainfeedback.query.filter_by(Content=liked_content.Content).first()
            if matching_content:
                PList.append(matching_content)

        for watched_content in watched_contents:
            matching_content = Mainfeedback.query.filter_by(Content=watched_content.Content).first()
            if matching_content:
                PList.append(matching_content)


        # Create a list to store the final filtered content
        FContent = []

        # Compare categories and filter the contents
        for main_content in Mainfeedback.query.all():
            for PContent in PList:
                matching_score = mathingWordsR(main_content.Catagory, PContent)
                if matching_score >= 0.5:
                    FContent.append(main_content)
        print(len(FContent))
        # Remove contents already in Likes and History
        NFContent = duplicate_remover(FContent)
        user_agent = request.headers.get('User-Agent')
        e = most_liked_content("Likes")
        h = most_liked_content("History")
        allcont = Mainfeedback.query.all()
        Comment = Profilepic.query.filter_by(UGmail=session["E-user"]).first()
        if 'Macintosh' in user_agent:
            return render_template("index.html", Lcontents=NFContent, Comment=Comment, contents=e, MostWatched=h, allcont=allcont)
        elif 'Windows' in user_agent:
            return render_template("index.html", Lcontents=NFContent, contents=e, MostWatched=h, Comment=Comment, allcont=allcont)
        else:
            return render_template("indexfortabs.html", Lcontents=NFContent, contents=e, MostWatched=h, Comment=Comment, allcont=allcont)
    else:
        e = most_liked_content("Likes")
        h = most_liked_content("History")
        allcont = Mainfeedback.query.all()
        user_agent = request.headers.get('User-Agent')
        print(user_agent)
        if 'Macintosh' in user_agent:
            return render_template("index.html", contents=e, MostWatched=h, allcont=allcont, Comment=None)
        elif 'Windows' in user_agent:
            return render_template("index.html", contents=e, MostWatched=h, allcont=allcont, Comment=None)
        else:
            return render_template("indexfortabs.html", contents=e, MostWatched=h, allcont=allcont, Comment=None)


@app.route("/Search", methods=['POST', 'GET'])
def search():
   if request.method == "POST":
       SearchItem = request.form.get("Search")
       SearchableItems = Mainfeedback.query.all()
       C = Mainfeedback.query.all()

       #    Codded for  Actual search and for title

       scores = [mathingWords(SearchItem, sentence) for sentence in SearchableItems]
       sortedSentScore = sorted(zip(scores, SearchableItems), reverse=True, key=lambda x: x[0])
       sortedSentScore = [(score, sentence) for score, sentence in sortedSentScore if score != 0]
       print(f"{len(sortedSentScore)} results found!")

       #    Codded for related search and for catagoy

       for score, item in sortedSentScore:
           scores = [mathingWordsR(item.Catagory, sentence) for sentence in SearchableItems]
           R_SortedSentScore = sorted(zip(scores, SearchableItems), reverse=True, key=lambda x: x[0])
           R_SortedSentScore = [(score, sentence) for score, sentence in R_SortedSentScore if score != 0]
           print(f"{len(R_SortedSentScore)} results found!")

       # Extract content names from sortedSentScore
       sorted_content_names = []
       for item in sortedSentScore:
           if isinstance(item, (list, tuple)) and len(item) > 0 and isinstance(item[0], (list, tuple)):
               sorted_content_names.append(item[0][0])
           else:
               print("Invalid format in sortedSentScore:", item)

       # Filter R_SortedSentScore based on content names
       filtered_R_SortedSentScore = [
           item for item in R_SortedSentScore if
           isinstance(item, (list, tuple)) and len(item) > 0 and isinstance(item[0], (list, tuple)) and (
               item[0][0] not in sorted_content_names if isinstance(item[0], (list, tuple)) else True)
       ]
       Comment = Profilepic.query.filter_by(UGmail=session["E-user"]).first()
       return render_template("/Searched.html", ASearch=sortedSentScore,Comment=Comment, RSearch=R_SortedSentScore, OSearch=C, searchedItem=SearchItem)


@app.route("/DelPPic", methods=['GET'])
def delpic():
    Cname = request.args.get("Cname")
    Doption = Profilepic.query.filter_by(PPic=Cname).first()
    db.session.delete(Doption)
    db.session.commit()
    return redirect("/studios")


@app.route("/EditFeedback", methods=['POST', 'GET'])
def EditFeedback():
    if request.method == "POST":
        Content = request.form.get("Content")
        Thumbnaill = request.files.get("Thumbnail")
        Trailerr = request.files.get("TrailerV")
        Pros = request.form.get("Pros")
        Cons = request.form.get("Cons")
        Catagory = request.form.get("Catagory")
        Value = request.form.get("PurchesValue")
        Title = request.form.get("title")
        Feedback = Mainfeedback.query.filter_by(Content=Content).first()
        #Privious Thumb and Trailer
        Thumb = request.form.get("thumb")
        Trail = request.form.get("Trail")
        AThumb =""
        ATrail =""
        print(Thumbnaill.filename)

        if Trailerr.filename != "":
            print("for only trailer")
            I_Trailer = generate_unique_filename(Trailerr.filename)
            Trailerr.save(os.path.join(app.config["TrailerStorage"], I_Trailer))
            ATrail += I_Trailer
        else:
            ATrail += Trail
        if Thumbnaill.filename != "":
            print("for only thumb")
            I_Thumbnail = generate_unique_filename(Thumbnaill.filename)
            Thumbnaill.save(os.path.join(app.config["ThumbnailStorage"], I_Thumbnail))
            AThumb += I_Thumbnail
        else:
            AThumb += Thumb
        Feedback.Thumbnail = AThumb
        Feedback.Trailer = ATrail
        Feedback.pros = Pros
        Feedback.cons = Cons
        Feedback.Catagory = Catagory
        Feedback.Value = Value
        Feedback.Title = Title
        db.session.commit()
        return redirect("/studios")
    else:
        Content = request.args.get("Content")
        print(Content)
        FBack = Mainfeedback.query.filter_by(Content=Content).first()
        PP = Profilepic.query.filter_by(UGmail=session['E-user']).first()
        About = Aboutofuser.query.filter_by(Gmail=session['E-user']).first()
        return render_template('FeedBackUploadedEdit.html', ProfilePic=PP, Abouts=About, Content=Content, FBack=FBack)


@app.route("/DelAbout", methods=['GET'])
def delAbout():
    Cname = request.args.get("Cname")
    print(Cname)
    Doption = Aboutofuser.query.filter_by(About=Cname).first()
    print(Doption)
    db.session.delete(Doption)
    db.session.commit()
    return redirect("/studios")


@app.route("/Transaction", methods=["POST", "GET"])
def Transfer():
    if request.method == "POST":
        try:
            #Data collection
            Content = request.form.get("Thumbnail")
            print(Content)
            from_Account = request.form.get("AccountNumber")
            '''
            #Value = request.form.get("Value")
            Value = 0.000001
            #transaction and proccecing
            web = Web3(Web3.HTTPProvider("https://mainnet.infura.io/v3/61a4bd94e1964fc5a7f07df852d94b0a"))
            To_account = params["AccountNumboffund"]  # Account_name
            Privet_Key = params["Privet_key"]         # private key
            A2 = web.to_checksum_address(To_account)
            try:                                      # Account existance error
                A1 = web.to_checksum_address(from_Account)
            except Exception as e:
                return render_template("Payment.html", )

            nonce = web.eth.get_transaction_count(A1)
            tx = {
                'nonce': nonce,
                'to': A2,
                'value': web.to_wei(float(Value), 'ether'),
                'gas': 21000,
                'gasPrice': web.to_wei(40, "gwei")
            }
            signed_tx = web.eth.account.sign_transaction(tx, Privet_Key)
            web.eth.send_raw_transaction(signed_tx.rawTransaction)
            '''
            # database entry
            Feedbackinfo=Mainfeedback.query.filter_by(Thumbnail=Content).first()
            print(Feedbackinfo)
            Creatersname=Userinfo.query.filter_by(Gmail=Feedbackinfo.UGmail).first()
            ProfilP = Profilepic.query.filter_by(UGmail=Feedbackinfo.UGmail).first()
            entry = Payments(ClinetEmail=session['E-user'], CreatersName=Creatersname.UNAME,
                             CreatersEmail=Feedbackinfo.UGmail, Thumbnail=Feedbackinfo.Thumbnail,
                             CreatersProfilePic=ProfilP.PPic, Title=Feedbackinfo.Title)
            db.session.add(entry)
            db.session.commit()
            print("sfdj",Feedbackinfo.Content)
            return redirect("/VideoPlayer/{}".format(Feedbackinfo.Content))

        except Exception as e:
            # Log the error or perform any necessary actions
            print(f"Error: {e}")

            # Render a custom error template or redirect to a different page
            return render_template('error.html')
    else:
        Content = request.args.get("ContentName")
        Primium = Mainfeedback.query.filter_by(Trailer=Content).first()
        Name = Userinfo.query.filter_by(Gmail=Primium.UGmail).first()
        return render_template("Payment.html", Primium=Primium, Name=Name.UNAME, Purcheser=session['user'],
                               PurcheserEmail=session['E-user'])


app.run(debug=True)
