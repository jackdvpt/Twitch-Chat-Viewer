from bottle import route, template, redirect, static_file, error, run
import config
from twitchAPI.twitch import Twitch
from enum import unique
from bottle import Bottle, template, request
from chat_downloader import ChatDownloader
import math
import helper
app = Bottle()

@app.route('/home')
def show_home():
    return template('home')

@app.route('/css/<filename>')
def send_css(filename):
    return static_file(filename, root='static/css')


@app.error(404)
def error404(error):
    return template('error', error_msg='404 error. Nothing to see here')


@app.route('/')
def index():
    """Home Page"""
    info = {'title': "temp",
            'content': "temp", 
            'col':'red'
            }
    return template("search.tpl", info)


@app.route('/list/<name>')
def searchtwitch():

    # create instance of twitch API
    twitch = Twitch(config.one, config.two)
    twitch.authenticate_app([])
    
    blah = name
    # get ID of user
    user_info = twitch.get_users(logins=[blah])
    user_id = user_info['data'][0]['id']
    
    vid = twitch.get_videos(user_id=user_id)
    info = {
        'title': vid["data"],
        'person':blah.upper()
            }

    return template("lister.tpl", info)




@app.route('/vod/<id>')
def formhandler(id):
    
    #"1160590614"
    """Handle the form submission"""

    blah = id
    url = 'https://www.twitch.tv/videos/'+blah
    comments = ChatDownloader().get_chat(url)       # create a generator

    engagement = dict()
    outs = []
    a = []
    print("starting")
    for c in comments:
      
        col = "red"
        badg=""
        if "badges" in c["author"]:
            badges = c["author"]["badges"]
            for b in badges:
                badg+= """<img src=" """+b["icons"][0]["url"]+""" ">"""
        if "colour" in c["author"]:
            col =  c["author"]["colour"]    
        a.append((c["author"]["name"], col))
        
        hours=str(math.trunc(c["time_in_seconds"]//3600))
        minutes=str(math.trunc((c["time_in_seconds"]%3600)//60))
        seconds=str(math.trunc((c["time_in_seconds"]%3600)%60))
        d="{}h{}m{}s".format(hours, minutes, seconds)
        text = helper.emotes(c)
        timeForChart = "{}h{}m".format(hours, minutes)
        outs.append((d, c["author"]["name"], text,col, badg))
        #engagement
        if timeForChart not in engagement:
            engagement[timeForChart] = 1
        else:
            engagement[timeForChart] = engagement[timeForChart] +1
    chatTotal = len(outs)
    eng = helper.engagementChart(engagement)



    finalNames = []
    uniqueNames = list(set(a))
    for name in uniqueNames:
        count = 0
        for message in outs:
            if str(name[0]) in message[1]:
                count+=1
        finalNames.append((name[0], name[1], count))
    finalNames.sort(key=lambda x:x[2] , reverse =True)
    print(finalNames)
    

    info = {
        'engagement': eng,
        'title': finalNames,
            'content': outs, 
            'col':'red', 
            'total':chatTotal, 
        'id': blah,
        'id_real':id
            }

    return template("simple.tpl", info)




@app.route('/vodid')
def formhandler(id):
    
    #"1160590614"
    """Handle the form submission"""

    blah = request.query.get('first')
    url = 'https://www.twitch.tv/videos/'+blah
    comments = ChatDownloader().get_chat(url)       # create a generator
    
    outs = []
    a = []
    for c in comments:
        #print(c)
        col = "red"
        badg=""
        if "badges" in c["author"]:
            badges = c["author"]["badges"]
            for b in badges:
                badg+= """<img src=" """+b["icons"][0]["url"]+""" ">"""
        if "colour" in c["author"]:
            col =  c["author"]["colour"]    
        a.append((c["author"]["name"], col))
        hours=str(math.trunc(c["time_in_seconds"]//3600))
        minutes=str(math.trunc((c["time_in_seconds"]%3600)//60))
        seconds=str(math.trunc((c["time_in_seconds"]%3600)%60))
        d="{}h{}m{}s".format(hours, minutes, seconds)
        text = helper.emotes(c)
        outs.append((d, c["author"]["name"], text,col, badg))
    chatTotal = len(outs)

    finalNames = []
    uniqueNames = list(set(a))
    for name in uniqueNames:
        count = 0
        for message in outs:
            if str(name[0]) in message[1]:
                count+=1
        finalNames.append((name[0], name[1], count))
    finalNames.sort(key=lambda x:x[2] , reverse =True)
    info = {
        'title': finalNames,
            'content': outs, 
            'col':'red', 
            'total':chatTotal, 
        'id': blah
            }

    return template("simple.tpl", info)


if __name__ == '__main__': 
    app.run(host='localhost', port=8080, debug=True)
