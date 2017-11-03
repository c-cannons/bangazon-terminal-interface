require "/Users/ericpalmieri/workspace/bangazon-c-cannons/bangazon-terminal-interface/app/models/customer.rb"

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
        @customer.info(@firstname, @lastname, @street_address, @city, @state, @postal_code, @phone_number)

        expect(@firstname).to be_a(String)
        expect(@lastname).to be_a(String)
        expect(@street_address).to be_a(String)
        expect(@city).to be_a(String)
        expect(@state).to be_a(String)
        expect(@postal_code).to be_an(Integer)
        expect(@phone_number).to be_an(String) #Integer #Error
    end
  end

  # context "When saving a customer" do
  #   it "should pass 10 arguments to the database table Customer" do
  #       customer = Customer.new
  #       return_from = pt.save_new_payment_type("CRIMINAL BANK", 0000000000000000)
  #       expect(return_from).to be_an(Integer)
  #   end
  # end

  # context "When saving a new payment type" do
  #   it "should write to the database and check that the information is correct" do
  #       pt = PaymentType.new
  #       return_from = pt.save_new_payment_type("CRIMINAL BANK", 0000000000000000)
  #       expect(return_from).to be_an(Integer)
  #   end
  # end
end