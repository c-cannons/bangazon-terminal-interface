class CustomerController
  attr_accessor :first_name, :last_name, :street_address, :city, :state, :postal_code, :phone_number
  def add_new_customer
    puts "*************************************************"
    puts "ADD A NEW CUSTOMER"
    puts "Enter Customer First Name"
    puts ">"
    user_input = gets.chomp
    @first_name = user_input

    puts "Enter Customer Last Name"
    puts ">"
    user_input = gets.chomp
    @last_name = user_input

    puts "Enter Street Address"
    puts ">"
    user_input = gets.chomp
    @street_address = user_input
    
    puts "Enter City"
    puts ">"
    user_input = gets.chomp
    @city = user_input
    
    puts "Enter State (use state abbreviation)"
    puts ">"
    user_input = gets.chomp
    @state = user_input
    
    puts "Enter Postal Code"
    puts ">"
    user_input = Integer(gets.chomp)
    @postal_code = user_input
    
    puts "Enter Phone Number"
    puts ">"
    user_input = Integer(gets.chomp)
    @phone_number = user_input

    puts "Press any key if this Customer Info is Correct.  Type n if this Customer Info needs corrections"
    user_input = gets.chomp
    case user_input
    when "n"
      edit_customer
    else
      @customer = Customer.new
      @customer.info(@first_name, @last_name, @street_address, @city,@state, @postal_code, @phone_number)
      @customer.save
    end
  end

  def edit_customer
    puts "*************************************************"
    puts "EDIT NEW CUSTOMER"
    puts "Edit Customer First Name"
    puts "#{@first_name}"
    puts ">"
    user_input = gets.chomp
    @first_name = user_input

    puts "Edit Customer Last Name"
    puts "#{@last_name}"
    puts ">"
    user_input = gets.chomp
    @last_name = user_input

    puts "Edit Street Address"
    puts "#{@street_address}"
    puts ">"
    user_input = gets.chomp
    @street_address = user_input
    
    puts "Edit City"
    puts "#{@city}"
    puts ">"
    user_input = gets.chomp
    @city = user_input
    
    puts "Edit State (use state abbreviation)"
    puts "#{@state}"
    puts ">"
    user_input = gets.chomp
    @state = user_input
    
    puts "Edit Postal Code"
    puts "#{@postal_code}"
    puts ">"
    user_input = Integer(gets.chomp)
    @postal_code = user_input
    
    puts "Edit Phone Number"
    puts "#{@phone_number}"
    puts ">"
    user_input = Integer(gets.chomp)
    @phone_number = user_input

    puts "Press any key if this Customer Info is Correct.  Type N if this Customer Info needs corrections"
    user_input = gets.chomp
    case user_input
    when "n"
      edit_customer
    else
      @customer = Customer.new
      @customer.info(@first_name, @last_name, @street_address, @city,@state, @postal_code, @phone_number)
      @customer.save
    end
  end

  def list_customers
    puts "*************************************************"
    puts "SELECT CUSTOMER"
    @customer = Customer.new
    customer_list = @customer.get_customers
    customer_list.each do |customer|
      puts "#{customer[0]}. #{customer[1]} #{customer[2]}"
    end

    user_input = gets.chomp
    user_input_int = user_input.to_i
    if user_input_int > customer_list.length
      puts "Choose A Customer (pick from the numbers listed, idiot)"
      list_customers  
    else
      customer_list.each do |customer|
        if user_input == customer[0].to_s
          puts "you chose #{customer[1]} #{customer[2]}"
          @active_customer = customer
        end
      end
    end

  end

  def active_customer
    @active_customer
  end
  
end