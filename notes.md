User
  fields
    email
    password

  action
    login
    logout
    sign up

  Relationships
    has_many :carts

  def current_cart
    if self.cart.status != "submitted"
      self.cart.current_cart
    end
  end
  
  devise gem

  

Item
  fields 
    Name: list of available items -> line_items? -> item name? 
    Price
    Inventory
    No - this is for line_items ->  quantity? -> >0?  
    

  action
    show user current cart when add item
      redirect_to user_show and user show path should include items added

  Relationships
    - belongs_to :category
    - has_many :line_items

  def available_items
      Items.all.each do |item|
        if item.inventory > 0 
          self << item
        end
      end
  end



  Cart

    field
      status

    action
      user can checkout from their cart 
        add checkout button from cart show page
        price format -> $xx.xx
        after clicking on checkout
          subtract quantity for item in cart, from item inventory
          redirect to user's cart page
          cart.status = "submitted"

    Relationships
      has_many :line_items, through instance method???
      has_many :items, through: :line_items

    Class methods
      def total
        totalitemprice = []
        @cart.items.each do |item|
          subtotal = item.line_item.quantity * item.price
          totalitemprice << subtotal
        end

        totalitemprice.sum
        
      end

      def line_item(item)

        self.line_item << item

      end
    

      def add_item(item)
        if !self.line_item 
          self.line_item << item
        else
          self.line_item.quanity +=1
        end
      end

      
      
Line Item 

join table between cart and item

  fields
    - cart_id
    - item_id
    - quantity => default = 1 

  Relationships
    belongs_to :cart
    belongs_to :item


Category

  fields
    name

  Relationships
    has_many :items
    
  

          
    
Headers/Nav
  username
  signin (if not logged into account) and signout (if logged into account)
  home button
  cart (if user)

FLOW

User signs in or signs up

see store
  the store has all available items, quantity available, and their price
  the user can add an item to their cart by specifying the quantity they want and then hitting submit
  the user it taken to their cart
user cart
  on their cart page, they can see all of their items, quantity, price
  they can see the total 
  they can click a button to check out
  they go back to their empty cart page
  the status of the cart is changed to submitted
  the inventory of line items/items is changed to one less


<!--
<% @categories.each do |category| %>
  <%= link_to category.title, category_path(category) %>
<% end %>

<% @items.each do |item| %>
  <p><%= item.title %> | <%= number_to_currency(item.price) %> | <%= button_to 'Add to Cart', line_items_path(item_id: item) %></p>
<% end %>

--> 



