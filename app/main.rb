require_relative 'controllers/main_menu_controller'
require_relative 'controllers/customers_controller'
require_relative 'controllers/orders_controller'
require_relative 'controllers/products_controller'
require_relative 'models/customer'
require_relative 'models/product'
require_relative 'models/order'
require_relative 'models/order_line'
require_relative 'models/payment_type'
require 'sqlite3'


@main_menu = MainMenuController.new
@main_menu.display_main_menu
