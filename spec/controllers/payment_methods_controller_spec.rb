require './app/controllers/payment_methods_controller.rb'

describe "initialize" do
  context "when called" do
    it "has a valid active_customer" do
      @pmc = PaymentMethodsController.new(@active_customer = 1)
      expect(@active_customer).to be_an(Integer)
      expect(@active_customer).to eq(1)
    end
  end
end

describe "initialize" do
  context "when called" do
    it "is a valid instance of PaymentMethodsController" do
      @pmc = PaymentMethodsController.new(@active_customer = 1)
      expect(@pmc).to be_an_instance_of(PaymentMethodsController)
    end
  end
end

describe "get_all_payment_methods" do
  context "when called" do
    it "returns an Array from the database" do
      @pmc = PaymentMethodsController.new(@active_customer = 1)
      array = @pmc.get_all_payment_methods
      expect(array).to be_an(Array)
    end
  end
end
