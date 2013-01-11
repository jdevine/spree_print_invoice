require 'prawn/layout'

font "Helvetica"
im = "#{Rails.root.to_s}/app/assets/images/#{Spree::PrintInvoice::Config[:print_invoice_logo_path]}"

image im , :at => [5,717] , :scale => 0.30

fill_color "E99323"

bounding_box( [bounds.width - 300 ,cursor], :width=>296 ) do
        move_down 4
	if @hide_prices
	  text I18n.t(:packaging_slip), :align => :right, :style => :bold, :size => 16, :padding=>[3,3,0,0]
	else
	  text I18n.t(:customer_invoice), :align => :right, :style => :bold, :size => 16, :padding=>[3,3,0,0]
	end

	fill_color "000000"

	move_down 4

	font "Helvetica",  :size => 9,  :style => :bold

	text "#{I18n.t(:order_number)} #{@order.number}", :align => :right

	move_down 2

	font "Helvetica", :size => 9
	text "#{I18n.l @order.completed_at.to_date}", :align => :right

end

render :partial => "address"

move_down 30

render :partial => "line_items_box"

move_down 8

# Footer
# render :partial => "footer"
