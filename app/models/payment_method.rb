require 'sqlite3'

class PaymentMethod

    def initialize
        @db = SQLite3::Database.open(ENV["BANGAZONTI"])
    end

    def list_all_payment_methods
        pay_array = @db.execute "SELECT * FROM Payment_methods;"
        @db.close
        return pay_array
    end

    def add_payment_method(payment_type, account_number)
        @db.execute "INSERT INTO Payment_methods VALUES (null, '#{payment_type}', #{account_number});"
        new_id = @db.last_insert_row_id
        added_pay_method = @db.execute "SELECT * FROM Payment_methods WHERE pay_method_id = #{new_id};"
        @db.close
        return added_pay_method
    end

    def delete_pay_method(id)
        @db.execute "DELETE FROM Payment_methods WHERE pay_method_id = #{id};"
        @db.close
    end
end
