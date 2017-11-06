require 'sqlite3'

class Customer
  attr_accessor :first_name, :last_name, :street_address, :city, :state, :postal_code, :phone_number

  def initialize
<<<<<<< HEAD
    @db = SQLite3::Database.open(ENV["BANGAZONTI"])
=======
    @db = SQLite3::Database.open(ENV["BANGAZONTI"]) 
>>>>>>> 0576cdc0a5a2e9de311aa744e8a87a580bf2067f
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
<<<<<<< HEAD

      @last_id = @db.last_insert_row_id
=======
    
>>>>>>> 0576cdc0a5a2e9de311aa744e8a87a580bf2067f
      puts "Customer #{@first_name} Saved: #{@first_name}, #{@last_name}, #{@street_address}, #{@city}, #{@state}, #{@postal_code}, #{@phone_number}"

      new_id = @db.last_insert_row_id
      added_customer = @db.execute "SELECT * FROM Payment_methods WHERE pay_method_id = #{new_id};"
      return added_customer
    rescue SQLite3::Exception => e
      p "Exeception with database query: #{e}"
      @db.rollback
    end
    @db.close
  end

  def get_customers
    @customers = @db.execute "SELECT customer_id, customer_first_name, customer_last_name FROM Customers"
    @db.close
    return @customers
  end
<<<<<<< HEAD
end
=======
  def delete_customer(id)
    @db.execute "DELETE FROM Customers WHERE customer_id = #{id};"
    @db.close
end
end
>>>>>>> 0576cdc0a5a2e9de311aa744e8a87a580bf2067f
