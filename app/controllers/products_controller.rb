require_relative "../models/product"
require_relative "../models/order_line"

class ProductsController

  attr_accessor :active_customer, :product, :order_line

    # Sets @product to an instance of the class ProductModel
    def initialize(active_customer)
        @active_customer = active_customer
        @product = ProductModel.new
        @order_line = OrderLineModel.new
    end
    # References the `get_products` method of ProductModel. Pulls product details for all items in the Products table
    def get_all_products
      @products_arr = @product.get_products
      display_products
    end

    #Displays products in @products_arr from get_all_products method
    def display_products
      puts " "
      puts "Product List:"
      count = 1
      @product_list_hash = Hash.new
      @products_arr.each do |product|
        puts "#{count}. #{product[2]}"
        @product_list_hash[count] = product
        count += 1
      end
      puts " "
      puts "Type 'exit' to Exit Product List"
    end

    # Gets active customer input to select products and creates an orderline for selected products
    def select_products_for_cart(active_order_arg)
      exit_to_main = false
      active_order = active_order_arg
      puts " "

      user_input = gets.chomp
      # START LOOP
      @product_list_hash.each do |key, val|
        # Allows user to exit
        if user_input.downcase.to_s == 'exit'
          puts " "
          puts "heading back to menu"
          exit_to_main = true
          break
        end

        if user_input.to_s == key.to_s
          puts "Do you want to Add #{val[2]}? (y/n)"
          puts " "
          confirm_user_input = gets.chomp
          if confirm_user_input.downcase.to_s == "y"
            @order_line.add_order_line(@product_list_hash[key][0], active_order)
            puts " "
            puts "#{val[2]} was added to #{@active_customer[1]}'s Shopping Cart"
            break
          else
            puts " "
            puts "#{val[2]} was NOT added."
            break
          end
        end
      end # END OF LOOP

      if exit_to_main == false
        puts " "
        puts "Do you want to continue shopping #{@active_customer[1]}? (y/n)"
        confirm_user_input = gets.chomp
        if confirm_user_input.downcase.to_s == 'y'
          display_products
          # START Select Product LOOP AGAIN
          select_products_for_cart(active_order)
        else
          puts " "
          puts "heading back to menu"
        end
      end

      puts " "
    end
    # References the `add_product` method of ProductModel. Takes user input and inserts it to the Products table
    def add_product
        @active_customer = active_customer[0]
        puts "Name of product?"
        @product_name = gets.chomp
        puts "Price of Product?"
        @product_price = gets.chomp
        puts "Product description?"
        @product_desc = gets.chomp
        @product.add_product(@active_customer, @product_name, @product_price, @product_desc)
    end
    #logic to change product information
    def update_product
      exit_update = false
      @product_arr = @product.get_products_by_customer(@active_customer[0])
      puts "Which item would you like to update?"
      #loop puts a list of products associated with the customer
      #creates a hash with the count as a key and the product array as the value
      count = 1
      @product_hash = Hash.new
      @product_arr.each do |product|
          puts "#{count}. #{product[2]}"
          @product_hash[count] = product
          count += 1
      end
      # puts @product_hash
      puts ""
      puts "Select a product or type 'exit' to exit."
      puts ">"
      #user enters an integer that matched a has key
      user_input = gets.chomp
      #iterated through the hash and asks about each updatable field.
      @product_hash.each do |key, val|
        if user_input.downcase.to_s == 'exit'
          puts " "
          puts "Heading back to menu"
          exit_update = true
          break
        end
        #logic to update products
        if user_input.to_s == key.to_s
            @product_id = val[0]
            puts "The current Product Name is '#{val[2]}'.  What would you like the new Product Name to be?"
            @product_name = gets.chomp
            puts "The current Product Price is '#{val[3]}'.  What would you like the new Product Price to be?"
            @product_price = gets.chomp
            puts "The current Product Description is '#{val[4]}'.  What would you like the new Product Description to be?"
            @product_desc = gets.chomp
            #calls the database transaction
            @product.update_product(@product_id, @active_customer, @product_name, @product_price.to_f, @product_desc)
        end
      end
        if exit_update == false
          puts "Invalid command, please select a product or type 'exit' to exit."
          puts ""
          update_product
        end
    end

    def delete_customer_product
      @product_arr = @product.get_products_by_customer(@active_customer[0])
      puts "Choose an item to delete"
      count = 1
      @product_hash = Hash.new
      @product_arr.each do |product|
          puts "#{count}. #{product[2]}"
          @product_hash[count] = product
          count += 1
      end

      puts " "
      user_input = gets.chomp
      @product_hash.each do |key, val|
        if user_input.to_s == key.to_s
          @orders = @order_line.get_products_from_current_orders.flatten
          if @orders.include?(val[0])
            puts " "
            puts "Can't delete #{val[2]} because it is in an active order."
            puts " "
          else
            puts " "
            puts "Do you want to delete #{val[2]}? (Y/N)"
            next_user_input = gets.chomp
            case next_user_input.downcase.to_s
            when "y"
              puts " "
              puts "#{@product_hash[key][2]} has been deleted!"
              puts " "
              puts "Press any key to return to main menu."
              puts " "
              @product.delete_product(@product_hash[key][0])
              gets.chomp
            when "n"
              break
            end
          end
        end
      end
    end

end

# order = ProductsController.new(1)
# p order.check_current_orders
