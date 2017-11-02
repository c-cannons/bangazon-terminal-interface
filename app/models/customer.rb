class Customer
  attr_accessor :first_name, :last_name, :street_address, :city, :state, :postal_code, :phone_number

  def info(firstname, lastname, street_address, city, state, postal_code, phone_number)
    @first_name = firstname
    @last_name = lastname
    @street_address = street_address
    @city = city
    @state = state
    @postal_code = postal_code
    @phone_number = phone_number
  end

  def save
    puts "SAVE CALLED - This will be pushed the db: #{@first_name}, #{@last_name}, #{@street_address}, #{@city}, #{@state}, #{@postal_code}, #{@phone_number}"
  end

  def get_customers
  puts "These are the customers"  
  end
    
end