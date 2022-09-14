
def emotes(chat):
    message = chat["message"]
    if "emotes" in chat:
        #print("Containts an emote")
        emotes = chat["emotes"]
        for e in emotes:
            message = message.replace(e["name"],  """<img src=" """+ e["images"][0]["url"]+""" ">"""  )
    return message


def engagementChart(eng):
    print(list(eng)[-1], "is the length of the stream")
    length = list(eng)[-1]
    hours = length.split("h")
    mins = hours[1].split('m')
    print(hours[0], mins[0])
    totalMins = int(hours[0])*60 + int(mins[0])
    newt = dict()
    for x in range(0,totalMins):
        h = x // 60
        m = x % 60
        time = "{}h{}m".format(h, m)
        if time not in eng:
            newt[time] = 0
        else:
            newt[time] = eng[time] +1
    return newt