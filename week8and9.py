try:
    print(x)
except NameError:
    print("x not define")
    
else:
    print("everything went wrong")
    
    x = -1
    if x < 0:
        raise Exception("sorry, no numbers below zero")
    
