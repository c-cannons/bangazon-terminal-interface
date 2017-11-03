require 'sqlite3'

class PaymentMethod

    def initialize
        @db = SQLite3::Database.open('bangazon_cli.db')
    end

    def list_all_payment_methods
        pay_array = @db.execute "SELECT * FROM Payment_methods;"
        @db.close
        p pay_array
        return pay_array
    end

    def add_payment_method(payment_type, account_number)
        @db.execute "INSERT INTO Payment_methods VALUES (null, '#{payment_type}', #{account_number});"
        new_id = @db.last_insert_row_id
        @db.close
        # p new_id
        return new_id
    end

end