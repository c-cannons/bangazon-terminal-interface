require './app/models/payment_method.rb'

def setup
  @pm = PaymentMethod.new
end
# variables that will store id integers of the example entries so they can be idetified and deleted
test_id_1 = 0

describe ".list_all_payment_methods" do
  context 'when called' do
    it "returns a type of Array from the database" do
      setup
      pay_array = @pm.list_all_payment_methods
      expect(pay_array).to be_an(Array)
    end
  end
end

describe "checks for test record" do
  context "when test is initiated" do
    it "expects to not to find a record for 'Criminal Bank'" do
      setup
      pm_array_1 = @pm.list_all_payment_methods
      expect(pm_array_1.flatten).not_to include("Criminal Bank")
    end
  end
end

describe ".add_payment_method" do
  context "when called" do
    it "adds a product and verifies the field types and values" do
      setup
      pay_method = @pm.add_payment_method(1, "Criminal Bank", 1000000000000000)

      expect(pay_method).to be_an(Array)
      expect(pay_method.flatten[0]).to be_an(Integer)
      expect(pay_method.flatten[1]).to eq(1)
      expect(pay_method.flatten[2]).to eq("Criminal Bank")
      expect(pay_method.flatten[3]).to eq(1000000000000000)
      #sets test_id_1 to delete this example record at the end of the tests
      test_id_1 = pay_method.flatten[0]
    end
  end
end

describe "confirms that test record was added" do
  context "after add_payment_method is called" do
    it "expects to find a record for 'Criminal Bank'" do
      setup
      pm_array_1 = @pm.list_all_payment_methods
      expect(pm_array_1.flatten).to include("Criminal Bank")
    end
  end
end

describe "delete test entry" do
    context "after test is comlplete"do
        it "successfully removes the test entry" do
            setup
            @pm.delete_pay_method(test_id_1)
        end
    end
end
