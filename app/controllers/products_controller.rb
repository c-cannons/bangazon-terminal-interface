require_relative "../models/product"

class ProductsController

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

    def display_products
      puts " "
      puts "Product List:"
      count = 1
      @product_list_hash = Hash.new
      @products_arr.each do |product|
        puts "#{count}. #{product[1]}"
        @product_list_hash[count] = product
        count += 1
      end
      puts " "
      puts "Type 'exit' to Exit Product List"
    end

    def select_products_for_cart(active_order_arg)
      exit_to_main = false
      active_order = active_order_arg
      puts " "

      user_input = gets.chomp
      @product_list_hash.each do |key, val|
        if user_input.downcase.to_s == 'exit'
          puts " "
          puts "heading back to menu"
          exit_to_main = true
          break
        end

        if user_input.to_s == key.to_s
          puts "Do you want to Add #{val[1]}? (y/n)"
          puts " "
          confirm_user_input = gets.chomp
          if confirm_user_input.downcase.to_s == "y"
            @order_line.add_order_line(@product_list_hash[key][0], active_order)
            puts " "
            puts "#{val[1]} was added to #{@active_customer[1]}'s Shopping Cart"
            break
          else
            puts " "
            puts "#{val[1]} was NOT added."
            break
          end
        end

      end


      if exit_to_main == false
        puts " "
        puts "Do you want to continue shopping #{@active_customer[1]}? (y/n)"
        confirm_user_input = gets.chomp
        if confirm_user_input.downcase.to_s == 'y'
          display_products
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
        puts "Name of product?"
        @product_name = gets.chomp
        puts "Price of Product?"
        @product_price = gets.chomp
        puts "Product description?"
        @product_desc = gets.chomp
        @product.add_product(@product_name, @product_price, @product_desc)
    end

end
