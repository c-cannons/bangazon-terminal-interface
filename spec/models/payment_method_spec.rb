require './app/models/payment_method.rb'

describe PaymentMethod do

    def setup
        @pm = PaymentMethod.new
    end
    # variables that will store id integers of the example entries so they can be idetified and deleted
    id_1 = 0
    id_2 = 0

    context 'When testing the list_all_payment_methods' do
        it "should return an array from the database" do
            setup
            pay_array = @pm.list_all_payment_methods
            expect(pay_array).to be_an(Array)
        end
    end

    context 'When testing add_payment_method:' do

        it "should check that a record for Criminal Bank doesn't exist " do
            setup
            pm_array_1 = @pm.list_all_payment_methods
            expect(pm_array_1.flatten).not_to include("Criminal Bank")
        end

        it "adds a product and check that the fields are correct" do
            setup
            pay_method = @pm.add_payment_method("Criminal Bank", 1000000000000000)
            
            expect(pay_method).to be_an(Array)
            expect(pay_method.flatten[0]).to be_an(Integer)
            expect(pay_method.flatten[1]).to eq("Criminal Bank")
            expect(pay_method.flatten[2]).to eq(1000000000000000)
            #sets id_1 to delete this example record at the end of the tests
            id_1 = pay_method.flatten[0]
        end

        it "should check that a record for Criminal Bank DOES exist " do
            setup
            pm_array_1 = @pm.list_all_payment_methods
            expect(pm_array_1.flatten).to include("Criminal Bank")
        end

        it "should have arguments of the correct type" do
            setup
            pay_integer = @pm.add_payment_method(@payment_type = "Criminal Bank", @account_number = 1000000000000000)

            expect(@payment_type).to be_a(String)
            expect(@payment_type).to eq("Criminal Bank")
            expect(@account_number).to be_an(Integer)
            expect(@account_number).to eq(1000000000000000)
            #sets id_2 to delete this example record at the end of the tests
            id_2 = pay_integer.flatten[0]
        end

        it "should remove the example entries" do
            setup
            @pm.delete_pay_method(id_1)
            setup
            @pm.delete_pay_method(id_2)
        end
    end
    
end
