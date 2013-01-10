Deface::Override.new(:virtual_path => "spree/admin/shared/_order_tabs",
                     :name => "print_buttons",
                     :insert_bottom => "ul[data-hook='admin_order_tabs']",
                     :partial => "spree/admin/orders/print_buttons",
                     :disabled => false
