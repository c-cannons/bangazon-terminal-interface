require_relative "../../app/models/customer"

describe Customer do

  context "When creating a new customer" do
    it "should accept seven arguments" do
        #setup
        customer = Customer.new
        #arguments
        @firstname = "First"
        @lastname = "Last"
        @street_address = "123 Street Lane"
        @city = "Nash City"
        @state = "TN"
        @postal_code = 12345
        @phone_number = 1234567890

        #info method
        customer.info(@firstname, @lastname, @street_address, @city, @state, @postal_code, @phone_number)

        expect(@firstname).to be_a(String)
        expect(@lastname).to be_a(String)
        expect(@street_address).to be_a(String)
        expect(@city).to be_a(String)
        expect(@state).to be_a(String)
        expect(@postal_code).to be_an(Integer)
        expect(@phone_number).to be_an(Integer)
    end
  end

  context "When saving a customer" do
    it "Check the array of Customers to make sure 'Test Customer' is NOT included" do
      customer = Customer.new
      customers = customer.get_customers
      expect(customers.flatten).not_to include("Test Customer")
    end

    it "should pass 10 arguments to the database table Customer" do
        #setup
        customer = Customer.new
        # Argument 1 the id generated by the db
        # Arguments 2 - 8
        @firstname = "Test Customer"
        @lastname = "Last"
        @street_address = "123 Street Lane"
        @city = "Nash City"
        @state = "TN"
        @postal_code = 12345
        @phone_number = 1234567890
        # Argument 9 is the current date - generated by customer.save
        # Argument 10 is a hard-coded 0

        customer.info(@firstname, @lastname, @street_address, @city, @state, @postal_code, @phone_number)

        #save method
        customer.save
    end
    it "Check the array of Customers to make sure 'Test Customer' is included" do
      customer = Customer.new
      customers = customer.get_customers
      expect(customers.flatten).to include("Test Customer")
    end
  end
end
