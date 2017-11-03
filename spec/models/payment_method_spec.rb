require './app/models/payment_method.rb'

describe PaymentMethod do
    context 'When testing the list_all_payment_methods' do

        it "should return an array from the database" do

            pm = PaymentMethod.new
            pay_array = pm.list_all_payment_methods
            expect(pay_array).to be_an(Array)


        end
    end
end