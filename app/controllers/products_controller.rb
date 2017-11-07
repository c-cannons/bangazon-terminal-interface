require_relative "../models/product"

class ProductsController

  attr_accessor :active_customer

    # Sets @product to an instance of the class ProductModel
    def initialize(active_customer)
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
      @active_customer = active_customer[0]
        puts "Name of product?"
        @product_name = gets.chomp
        puts "Price of Product?"
        @product_price = gets.chomp
        puts "Product description?"
        @product_desc = gets.chomp
        @product.add_product(@active_customer, @product_name, @product_price, @product_desc)
    end

    def show_products_by_customer(active_customer)
      @product_arr = @product.get_products_by_customer(active_customer)
      p @product_arr
      count = 1
      @product_arr.each do |product|
          puts "#{count}. #{product[2]} - $#{product[3]}: #{product[4]}"
          count += 1
      end
      puts " "
      puts " "
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
          puts "Do you want to delete #{val[2]}? (Y/N)"
          next_user_input = gets.chomp
          if next_user_input.downcase.to_s == "y"
            @product.delete_product(@product_hash[key][0])
          end
        end
      end
    end


end

# product_list = ProductsController.new
# product_list.get_all_products
# # product_list.add_product
# product_list.add_to_cart
