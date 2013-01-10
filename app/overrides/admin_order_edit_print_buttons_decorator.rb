Deface::Override.new(:virtual_path => "spree/admin/orders/edit",
                     :name => "print_buttons",
                     :insert_top => "[data-hook='toolbar'] ul, #toolbar[data-hook] ul",
                     :partial => "spree/admin/orders/print_buttons",
                     :disabled => false)
