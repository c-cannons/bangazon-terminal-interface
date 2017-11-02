class MainMenuController
  attr_accessor :active_customer
  def display_main_menu
    # Main menu presented to the user
    puts "    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
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
      # Call the method that will diplay the prompts for creating a new customer here.
      @customer = CustomerController.new
      @customer.add_new_customer
      puts "*************************************************"
      puts ""
      display_main_menu
    when "2"
      # Call the method that will diplay the prompts for choosing an active customer here.
      @customer = CustomerController.new
      @customer.list_customers
      @active_customer = @customer.active_customer
      puts ""
      active_customer_menu
    when "3"
      # Close App
    end
  end
  
  def active_customer_menu
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
    puts "11. Leave Bangazon!"
    puts "> "

    user_input = gets.chomp

    case user_input
    when "1"
      puts "Create a payment option"
    when "2"
      puts "Add product to sell"
    when "3"
      puts "Add product to shopping cart"
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
    when "11"
      # close Bangazon App
      puts "11. Leave Bangazon!"
    end
  end
end
