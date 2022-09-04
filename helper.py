
def emotes(chat):
    message = chat["message"]
    if "emotes" in chat:
        #print("Containts an emote")
        emotes = chat["emotes"]
        for e in emotes:
            print( message)
            message = message.replace(e["name"],  """<img src=" """+ e["images"][0]["url"]+""" ">"""  )
            print(message)
    return message