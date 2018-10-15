# start 
def start 
    # sum coin
    sum = 0
    # all price
    allPrice = 0
    # 
    $aa = 0
    
    # array
    $juice = [
        [1, "コーラ", 120, 5],
    ]

    loop do
        print "★insert coin (Press 'N' juice select) : "
        # user input -> 'N' -> end / 'number' -> start
        userHandle = gets.chomp()
        
        # juice select
        if userHandle == 'N'
            break
        end
        # insert coin And sum
        if coinInsert(userHandle)
            sum += userHandle.to_i;
            puts "Current Coin : #{sum}"  
        else
            puts "Change Coin  : #{userHandle}"  
        end
    end
    
    # buy loop
    loop do 
        #print
        printview(allPrice, sum);
        # juice view
        juiceArray = juiceManagement(sum, $juice)
        # juice buy(arr, coin)
        sum, allPrice, $juice = buyJuice(juiceArray, sum, allPrice)

        $aa = allPrice
        if !sum
            $aa = allPrice
            break;
        end
    end
    
    # Manager Page
    input = managerPage
    if input == "1"
        allPriceView($aa)
        managerPage
    else 
        $juice = addJuice($juice)
        
        puts("  -   |   Juice    |   Price    |   Mount   ")
        $juice.each do |(count, name, price, mount)|
            puts("  #{count}   |   #{name}   |   #{price}円    |    #{mount}個    ")
        end

    end

    

    
end

def printview(allPrice, sum) 
    puts "---------------- Juice Select ------------------"
    puts "                              Current Coin : #{sum}"
end


# user insrt coint function
def coinInsert(coin)
    # 50 100 500 1000 -> sum / else -> change
    if coin == "10" or coin == "50" or coin == "100" or coin == "500" or coin == "1000"
        return true;
    else 
        return false
    end
end

# juice manage
def juiceManagement(sum, juice)
    # Message
    puts("  -   |   Juice    |   Price    |   Mount   |   State   ")

    # juice view
    juice.each do |(count, name, price, mount)|
        if sum > price and mount > 0
            puts("  #{count}   |   #{name}   |   #{price}円    |    #{mount}個    |     O  ") 
        else
            puts("  #{count}   |   #{name}   |   #{price}円    |    #{mount}個    |     X  ") 
        end
    end

    return juice
end

# buy juice 
def buyJuice(arr, sum, allPrice) 
    # juice array 
    juice = arr;

    currentCoin = 0;
    sumPrice    = allPrice;
    i = 0;

    print("Please select juice (Press M -> Manager Page) : ")
    selectNumber = gets.chomp();

    juice.each do |(count, name, price, mount)|
        
    
        if selectNumber == "M"
            return [false, sumPrice, juice];
        end

        if count == selectNumber.to_i and sum > price and mount > 0
            # mount -- 
            juice[i][3] = mount - 1;
            # sum - price
            currentCoin = sum - price
            sumPrice += price;
        else 
            currentCoin = sum
        end
        i += 1
    end

    return [currentCoin, sumPrice, juice]
    
end

# Manager Page
def managerPage()
    puts "----------- Manager Page -----------"
    puts "1. all Price          2. Add Juice List"

    print "Select 1 or 2 : "
    input = gets.chomp();

    return input
end

# allPrice View
def allPriceView(allPrice)
    puts allPrice
    allPrice = allPrice;
    puts "----------- Manager Page -----------"
    puts "all Price       ->          #{allPrice}"
end

# Juice Add
def addJuice(juice)
    print "Add juice Name : "
    juiceName = gets.chomp();
    print "Add juice Price : "
    juicePrice = gets.chomp();
    print "Add juice Mount : "
    juiceMount = gets.chomp();
    count = juice.length;
    juice.push([count + 1, juiceName, juicePrice.to_i, juiceMount.to_i])
    
    return juice
end


# 自販機スタート
start
