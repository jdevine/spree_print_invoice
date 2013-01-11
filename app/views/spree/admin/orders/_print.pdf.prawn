require 'prawn/layout'

font "Helvetica"
im = "#{Rails.root.to_s}/app/assets/images/#{Spree::PrintInvoice::Config[:print_invoice_logo_path]}"

puts("cursor before image: #{cursor.to_s}")

image im , :at => [5,717] , :scale => 0.30

fill_color "E99323"

bounding_box( [bounds.width - 300 ,cursor], :width=>296 ) do
        move_down 4
	if @hide_prices
	  text I18n.t(:packaging_slip), :align => :right, :style => :bold, :size => 16, :padding=>[3,3,0,0]
	else
	  text I18n.t(:customer_invoice), :align => :right, :style => :bold, :size => 16, :padding=>[3,3,0,0]
	end
	puts("cursor after title: #{cursor.to_s}")

	fill_color "000000"

	move_down 4

	font "Helvetica",  :size => 9,  :style => :bold

	text "#{I18n.t(:order_number)} #{@order.number}", :align => :right
	puts("cursor after order_number: #{cursor.to_s}")

	move_down 2

	font "Helvetica", :size => 9
	text "#{I18n.l @order.completed_at.to_date}", :align => :right

end

puts("cursor before address: #{cursor.to_s}")
puts("object_id in _print = #{object_id}")
render :partial => "address"
puts("cursor after address: #{cursor.to_s}")

move_down 30

puts("cursor before line_item_box: #{cursor.to_s}")
render :partial => "line_items_box"

puts("cursor before footer: #{cursor.to_s}")
move_down 8
puts("cursor before footer: #{cursor.to_s}")
# Footer
# render :partial => "footer"
