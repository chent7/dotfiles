store.set_global_value("x",True)
try:
    while store.get_global_value("x") == True:
        keyboard.send_key("e")
        time.sleep(0.1)
except:
    pass