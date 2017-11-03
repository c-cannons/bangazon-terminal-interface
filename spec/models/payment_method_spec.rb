require './app/models/payment_method.rb'

describe PaymentMethod do

    context 'When testing the list_all_payment_methods' do
        it "should return an array from the database" do
            pm = PaymentMethod.new
            pay_array = pm.list_all_payment_methods
            expect(pay_array).to be_an(Array)
        end
    end

    context 'When testing add_payment_method' do

        it "should return an integer from the database" do
            pm = PaymentMethod.new
            pay_integer = pm.add_payment_method("Criminal Bank", 1000000000000000)

            expect(pay_integer).to be_an(Integer)
        end

        it "should have arguments of the correct type" do
            pm = PaymentMethod.new
            pay_integer = pm.add_payment_method(@payment_type = "Criminal Bank", @account_number = 1000000000000000)

            expect(@payment_type).to be_a(String)
            expect(@payment_type).to eq("Criminal Bank")
            expect(@account_number).to be_an(Integer)
            expect(@account_number).to eq(1000000000000000)
        end
    end
    
end