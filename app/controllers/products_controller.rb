require_relative "../models/product"

class ProductsController

  attr_accessor :active_customer

    # Sets @product to an instance of the class ProductModel
    def initialize
        @active_customer = active_customer
        @product = ProductModel.new
    end

    # References the `get_products` method of ProductModel. Pulls product details for all items in the Products table
    def get_all_products
       products = @product.get_products
        count = 1
        products.each do |product|
            puts "#{count}. #{product[2]} - $#{product[3]}: #{product[4]}"
            count += 1
        end
        puts " "
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

    def add_to_cart
      print "Choose an item: "
      user_input = gets.chomp
      @product_arr = @product.get_products
      puts @product_arr.length
      # p @product_arr
      @product_arr.each do |product|
        if user_input == product[0].to_s
          puts "You chose #{product[2]}"
          puts "This product is $#{product[3]}. Would you like to add to your cart? (Y/N)"
        end
      end
      next_user_input = gets.chomp
      case next_user_input.downcase
      when "y"
      puts "Added to cart!"
      when "n"
        puts " "
        puts "Something else maybe?"
        get_all_products
      end
    end


end

product_list = ProductsController.new
product_list.get_all_products
# product_list.add_product
product_list.add_to_cart
