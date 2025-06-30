food = []

price = []

total = 0
while true:
    food = input("enter a food to buy or press q to quit: ")
    if food.lower() == 'q' :
        break
    else:
        price = float(input(f"enter the price of the {food}:R"))
        foods.append(food)
        price.append(price)
        
        print("------YOUR CARE-----")
        
        for food in foods:
            print(food,end= "")
            
            for price in price:
                total +=price
                
        print("/n")
        print(f"your total is: R{total}")
    