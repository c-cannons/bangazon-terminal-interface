require_relative 'products_controller'
require_relative 'payment_methods_controller'

class MainMenuController

  # :active_customer is an array [customer_id, first_name, last_name]
  attr_accessor :active_customer

  def display_main_menu
    loop do
      # Main menu presented to the user
      puts "
      ---------------------------Chudley Cannons----------------------------
      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMKOXMMMMMMMMMMMMMMMMMMMMMMMMM
      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMx.lNMWWMMMMMMMMMMMMMMMMMMMMM
      MMMMMMMMMMMMMMMMMMMMWKKWMMMMMMMMMMMMMMMMMMx..oNKKMMMMMMMMMMMMMMMMMMMMM
      MMMNXXNKOXWMWXK0O0KNXkoOWMMMMMMMMMMMMMMMMMXc ,KkxXWMMMMMMMMMMMMMMMMMMM
      MMMKkkKKxkNKd;,,,,ck0XOkNMMMMMMMMMMMMMMMMMMNxl0KkONMMMMMMMMMMMMMMMMMMM
      MMWMN0kxk0k:';',,oXMMNkOWMMMMMMMMMMMMMMMMMMMNxOMWNWMMMMMMMMMMMMMMMMMMM
      MMMNd,',,;,',;,',:dkxl:d000KNMMMMMMMMMMMMMMMNoxWMMMMMMMMMMMMMMMMMMMMMM
      MMWO;..',,,,,,,,,'...''''',;cdXMMMWNNXKKKKXN0:oWMMMMMMMMMMMMMMMMMMMMMM
      MWKl',,',,,,'',,''',,,'''.'''.;ddlc:::;;;;;:;.,xXWMMMMMMMMMMMMMMMMMMMM
      MWOl:l:',,'''''.';,,,,,,;,.......',,,,,,,,,,,'.':xNMMMMMMMMMMMMMMMMMMM
      MMKkOkdlcldddo,.,,,,,,,,'..''.',,,,,,,,,,,,,,,,,,,l0WMMMMMMMMMMMMMMMMM
      MMMNXNMWNWMMMWd',,,,,,,..','',,,,,,,,,,,,,,,,,,,,,,:OWMMMMMMMMMMMMMMMM
      MMMMMMMMMMMMMMk,,;,,,'',,,,,,,,,,,,,,,,,,,,,,,,,,,;,:0MMMMMMMMMMMMMMMM
      MMMMMMMMMMMMMMNd;,,,,'.,,,,,,,,,,,,,,,,,,,,,,,,,,,,;'oNMMMMWWWWMMMMMMM
      MMMMMMMMMMMMMMMW0c,,,,,''',,,,,,,,,,,,,,,,,,,,,,,,;::oKNNXKK00000XNWMM
      MMMMMMMMMMMMMMMMMKc,,,,..,,,,,,,,,,,,,,,,,,,,,:odxkO000000KXXXXXK0kKMM
      MMMMMMMMMMMMMMMMMMO:,,'',,,,,,,,,,,,,,,,,,,,,';dxxOOOOOOOOOO00KNXxxNMM
      MMMMMMMMMMMMMMMMMMNd,'',,,,,,,,,,,,,,,,,,,,,,.';c:,...',:ccox0XWM0kNMM
      MMMMMMMMMMMMMMMMMMWO,.',,,,,,,,,,;,,,,,,,,,'''lO0kxxkkO0kkKNWMMMM0kNMM
      MMMMMMMMMMMMMMMMMMWWk;',,,,,,,'......'''''''..oNMMMMMMMMxoXMMMMMM0kWMM
      MMMMMMMMMMMMMMMMMMMMNd,,,,,,,,;cl,...... ...  cNMMMMMMMMOdXMMMMMW0KMMM
      MMMMMMMMMMMMMMMMMMMMMNk:,,'.,o0NNo.   .''''''.cXMMMMMMMM0kNMMMMMK0NMMM
      MMMMMMMMMMMMMMMMMMMMMMWKl,..cXMW0;    ;xOKNNXOxKMMMMMMMM0OWMMMMX0NMMMM
      MMMMMMMMMMMMMMMMMMMMMMWM0:'''xWM0o:;,...,:ccc:cKMMMMMMMXk0WMMWXKNMMMMM
      MMMMMMMMMMMMMMMMMMMMMMMNx;'':0WMW0OKKKOkkxdddloKMMMMMMKdOWWWNXXWMMMMMM
      MMMMMMMMMMMMMMMMMMMMNOo:'',;OMMMMW0xxkXWMMMMMXOKMMMMW0dkXXXXNWMMMMMMMM
      MMMMMMMMMMMMMMMMMMMM0c,;,,,dNMMMMMMMXkkkkkkxdloXMMMWKk0XXNWMMMMMMMMMMM
      MMMMMMMMMMMMMMMMMMMMWNX000KNMMMMMMMMMMMWN0;   .kMMWK0WMMMMMMMMMMMMMMMM
      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNKKOdxOxlkWMNOKMMMMMMMMMMMMMMMMM
      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKkkKXNMWX0NMMWK0OKWMMMMMMMMMMMMMM
      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNkc,:lodxdkNMWNKK0XWMMMMMMMMMMMMMM
      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN0kdoc::lOKKKKXNWMMMMMMMMMMMMMMMM
      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWNNNNNWMMMMMMMMMMMMMMMMMMMMM
      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
      "
      puts "*************************************************"
      puts "Welcome to Bangazon! Command Line Ordering System"
      puts "*************************************************"
      puts "1. Create a customer account"
      puts "2. Choose active customer"
      puts "3. Leave Bangazon!"
      puts "> "
      user_input = gets.chomp

      case user_input
      when "1"
        # User Gets prompted to Create New Customer, then displays the main menu again
        @customer = CustomerController.new
        @customer.add_new_customer
        puts "*************************************************"
        puts ""
        display_main_menu
      when "2"
        # User gets prompted to select an Active Customer, then displays active customer menu
        @customer = CustomerController.new
        @customer.list_customers
        @active_customer = @customer.active_customer
        puts ""
        active_customer_menu
      when "3"
        puts "Goodbye!"
        break
      end
    end
  end

  #Active customer menu  -- pass @active_customer to any instance controller called from here
  def active_customer_menu
    loop do
      puts "*************************************************"
      puts "HELLO #{@active_customer[1]}! What do you want to do?"
      puts "*************************************************"
      puts "1. Create a payment option"
      puts "2. Add product to sell"
      puts "3. Add product to shopping cart"
      puts "4. Complete an order"
      puts "5. Remove customer product"
      puts "6. Update product information"
      puts "7. Show stale products"
      puts "8. Show customer revenue report"
      puts "9. Show overall product popularity"
      puts "10. Choose new Active Customer"
      puts "11. Log Out, Back to Main Menu!"
      puts "> "

      user_input = gets.chomp

      case user_input
      when "1"
        @new_payment_method = PaymentMethodsController.new(@active_customer)
        @new_payment_method.add_payment_method
        puts""
        active_customer_menu
      when "2"
        puts "Add product to sell"
        @products = ProductsController.new(@active_customer)
        @products.add_product
      when "3"
        puts "Add product to shopping cart"
        @cart = ProductsController.new(@active_customer)
        @cart.get_all_products
      when "4"
        puts "Complete an order"
      when "5"
        puts "Remove customer product"
      when "6"
        puts "Update product information"
      when "7"
        puts "Show stale products"
      when "8"
        puts "Show customer revenue report"
      when "9"
        puts "Show overall product popularity"
      when "10"
        puts "Choose new Active Customer"
        @active_customer = []
        break
      when "11"
        # Log Out, Back to Main Menu!
        @active_customer = []
        break
      end
    end
  end
end
