Deface::Override.new(:virtual_path => "spree/admin/orders/show",
                     :name => "print_buttons",
                     :insert_top => "[data-hook='toolbar'] ul.inline-menu, #toolbar[data-hook] ul.inline-menu",
                     :partial => "spree/admin/orders/print_buttons",
                     :disabled => false)
