require_relative "../models/product"

class ProductsController

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
            puts "#{count}. #{product[0]} - #{product[1]}: #{product[2]}"
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

    # References the `get_customers` method of ProductModel. Takes that data and prints each item to the terminal
    # def list_customers
    #     customers = @product.get_customers
    #     customers.each do |customer| 
    #        puts "#{customer[0]}. #{customer[1]} #{customer[2]}"
    #     end

    #     puts " "
    #     puts "Choose from these #{customers.length} customers."
    #     puts " "

    #     user_input = gets.chomp

    #     # If the user enters a number that's higher than the menu's length, return this statement and revert back to customer menu
    #     if user_input.to_i > customers.length
    #         puts " "
    #         puts "That choice is not on the menu. Please choose a customer on the list."
    #         puts " "
    #         list_customers
    #     else
    #         # If the user input matches a customer ID, display the first name (customer[1]) and last_name (customer[2])
    #         customers.each do |customer|
    #             if user_input == customer[0].to_s
    #                 puts " "
    #                 puts "You chose #{customer[1]} #{customer[2]}"
    #                 puts " "
    #             end
    #         end
    #     end
    # end
end

# product_list = ProductsController.new
# product_list.get_all_products
# product_list.add_product