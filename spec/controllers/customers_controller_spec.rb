require './app/controllers/customers_controller.rb'

describe "CustomerController" do
  context "when called" do
    it "is a valid instance of CustomerController" do
      @cc = CustomerController.new
      expect(@cc).to be_an_instance_of(CustomerController)
    end
  end
end

describe "active_customer" do
  context "when called" do    
    it "returns the active from the CustomerController" do
      @cc = CustomerController.new
      active_customer = @cc.active_customer
      expect(active_customer).to eql(nil)
    end
  end
end
