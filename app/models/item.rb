class Item < ActiveRecord::Base

	belongs_to :category    
    has_many :line_items

    def self.available_items
    	a_items = []
    	Item.all.each do |item|
    		if item.inventory > 0
    			a_items << item
    		end
    	end
    	a_items
    end



end
