require './app/controllers/payment_methods_controller.rb'

def setup
    @pmc = PaymentMethodsController.new(@active_customer = 1)
end

describe "initialize" do
    context "when called" do
        it "has a valid active_customer" do
            setup
            expect(@active_customer).to be_an(Integer)
            expect(@active_customer).to eq(1)
        end
    end
end

describe "initialize" do
    context "when called" do
        it "is a valid instance of PaymentMethodsController" do
            setup
            expect(@pmc).to be_an_instance_of(PaymentMethodsController)
        end
    end
end

describe "get_all_payment_methods" do
    context "when called" do    
        it "returns an Array from the database" do
            setup
            array = @pmc.get_all_payment_methods
            expect(array).to be_an(Array)
        end
    end
end
