require 'pry'

class CashRegister

    attr_accessor :total, :discount, :item_list, :last_item, :last_price

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @item_list = Array.new
    end

    def add_item(item, price, quantity = 0)
        if (quantity > 0)
            timesed = quantity * price
            @total += timesed
            quantity.times {self.item_list.push(item)}
            self.last_item = item
            self.last_price = timesed
        else 
            @total += price
            self.item_list.push(item)
            self.last_item = item
            self.last_price = price
        end
    end

    def apply_discount
        if (discount > 0)
            floated_discount = discount.to_f / 100
            discounted = self.total * floated_discount
            self.total = self.total - discounted
            discounted_item = self.last_price * floated_discount
            self.last_price = self.last_price - discounted
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        self.item_list
    end
        
    def void_last_transaction
        # binding.pry
        @total -= self.last_price 
        self.total
    end

end