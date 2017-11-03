require_relative 'products_controller'

class MainMenuController

  attr_accessor :active_customer

  def initialize
    @product = ProductsController.new(active_customer)
  end

  def display_main_menu
    loop do
      # Main menu presented to the user
      puts "*************************************************"
      puts "Welcome to Bangazon! Command Line Ordering System"
      puts "*************************************************"
      puts "1. Create a customer account"
      puts "2. Choose active customer"
      puts "3. Create a product"
      puts "4. List products"
      puts "12. Leave Bangazon!"

      puts "> "
      puts " "
      user_input = gets.chomp
      puts " "

      case user_input
      when "1"
        # Call the method that will diplay the prompts for creating a new customer here.
      when "2"
        @product.list_customers
      when "3"
        @product.add_product
      when "4"
        @product.get_all_products
      when "12"
        break
      end
    end
  end
end
