require './app/controllers/payment_methods_controller.rb'

describe PaymentMethodsController do

    context "When testing the initialization of PaymentMethodsController" do
        it "has a valid active_customer" do
            pmc = PaymentMethodsController.new(@active_customer = 1)

            expect(@active_customer).to be_an(Integer)
            expect(@active_customer).to eq(1)
        end
    end

    context "When testing get_all_payment_methods" do
        it "gets an array from the database" do
            pmc = PaymentMethodsController.new(1)
            array = pmc.get_all_payment_methods

            expect(array).to be_an(Array)
        end
    end

    # context "When testing add_payment_method" do
    #     it "adds the payment method to the database and returns it" do
    #         pmc = PaymentMethodsController.new(1)
    #         added_payment_method = pmc.add_payment_method
    #         # puts added_payment_method

    #         # expect(add_payment_method).to be_an(Array)
    #     end
    # end

end