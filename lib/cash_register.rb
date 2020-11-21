require 'pry'

class CashRegister

    attr_accessor :total, :discount, :items, :new_transaction 

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @new_transaction = 0.0
    end

    def add_item(title, price, quantity = 1)
        @new_transaction = (price * quantity)
        @total += @new_transaction
        quantity.times do
            @items << title 
        end
    end

    def apply_discount
        if self.discount > 0
            new_total = @total -= (@total * (@discount.to_f / 100.to_f))
            "After the discount, the total comes to $#{new_total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @items.pop()
        @total -= @new_transaction
    end

end

#new_customer = CashRegister.new(0)
#binding.pry
0
