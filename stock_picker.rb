# stock_picker takes in an array of stock prices,
# one for each day.
# returns a pair of days [best_buy_day, best_sell_day]
def stock_picker(prices)
  max_profit = [0, 0, 0] # [profit, min_price, max_price]

  prices.length.times do |day|
    min_price = [prices[day], day] # [price, index]
    max_price = [0, day]
    
    sub_prices = prices[day + 1, prices.length - (day + 1)]

    sub_prices.length.times do |new_day|
      if sub_prices[new_day] > min_price[0] && max_price[0] < sub_prices[new_day]
        max_price = [sub_prices[new_day], new_day + day + 1]
      end
    end

    new_profit = max_price[0] - min_price[0]

    if max_profit[0] < new_profit
      max_profit = [new_profit, min_price[1], max_price[1]]
    end
  end

  [max_profit[1], max_profit[2]]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
