class Customer
  attr_accessor :first_name, :last_name, :street_address, :city, :state, :postal_code, :phone_number

  def initialize
    @db = SQLite3::Database.open("/Users/ericpalmieri/workspace/bangazon-c-cannons/bangazon-terminal-interface/bangazon_cli.db") 
  end

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
    @date = Date.today
    begin 
      @db.execute "INSERT INTO Customers VALUES (null,?,?,?,?,?,?,?,'#{@date}',0);", @first_name, @last_name, @street_address, @city, @state, @postal_code, @phone_number
      
      puts "Customer #{@first_name} Saved: #{@first_name}, #{@last_name}, #{@street_address}, #{@city}, #{@state}, #{@postal_code}, #{@phone_number}"
    rescue SQLite3::Exception => e
      p "Exeception with database query: #{e}"
      db.rollback
    end
  end

  def get_customers
    puts "These are the customers"
  end
    
end