class Cart < ActiveRecord::Base

	has_many :line_items
	has_many :items, through: :line_items 
	
	
	belongs_to :user

		
	#def line_items	
	#	line_items = []
	#	LineItem.all.each do |item|
	#		if item.id == self.id				
	#			line_items << item
	#		end
	#	end		
		
	#end

	def total
		t = 0
		self.items.each do |item|
			t+=item.price
			
		end
		t
	end

	def add_item(item_id)		
		found_item = line_items.find_by(:item_id => item_id)
		if !found_item
			line_items.new(:item_id => item_id)
		else
			found_item.quantity +=1
			found_item
		end
	end






end
