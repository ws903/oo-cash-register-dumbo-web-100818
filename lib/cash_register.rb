require 'pry'

class CashRegister
	attr_accessor(:total, :discount)
	attr_reader(:items)

	def initialize(discount = 0)
		@last = 0
		@total = 0
		@discount = discount
		@items = []
	end

	def add_item(name, price, qty=1)
		@total += price * qty
		@last = price * qty
		qty.times {@items.push(name)}
	end

	def void_last_transaction
		@total -= @last
	end

	def apply_discount
		if @discount == 0
			return "There is no discount to apply."
		else
			@total = (@total*(1-(@discount/100.0))).to_i
			return "After the discount, the total comes to $#{@total}."
		end
	end
end