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
    # Add all other options available to the user here.
    puts "12. Leave Bangazon!"

    puts "> "
    user_input = gets.chomp

    case user_input
    when "1"
      # Call the method that will diplay the prompts for creating a new customer here.
      @customer = CustomerController.new
      @customer.add_new_customer
    when "2"
      # Call the method that will diplay the prompts for choosing an active customer here.
      @customer = CustomerController.new
      @customer.list_customers
    when "12"
      # Close App
    end
  end
end
