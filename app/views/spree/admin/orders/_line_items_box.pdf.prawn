column_widths = nil
align = nil
hide_prices = @hide_prices
order = @order
if @hide_prices
  column_widths = { 0 => 100, 1 => 165, 2 => 75, 3 => 75 } 
  align = { 0 => :left, 1 => :left, 2 => :right, 3 => :right }
else
  column_widths = { 0 => 75, 1 => 205, 2 => 75, 3 => 50, 4 => 75, 5 => 60 } 
  align = { 0 => :left, 1 => :left, 2 => :left, 3 => :right, 4 => :right, 5 => :right}
end

# Line Items
move_down 2
header =  [make_cell( :content => t(:sku), :font_style => :bold),
           make_cell( :content => t(:item_description), :font_style => :bold ) ]
header <<  make_cell( :content => t(:options), :font_style => :bold ) 
header <<  make_cell( :content => t(:price), :font_style => :bold ) unless @hide_prices
header <<  make_cell( :content => t(:qty), :font_style => :bold, :align => 1 )
header <<  make_cell( :content => t(:total), :font_style => :bold ) unless @hide_prices
    
table [header],
  :position => :center,
  :cell_style => {
    :border_width => 1,
    :padding   =>[2,6],
    :size => 9
  },
:column_widths => column_widths  do
  align.each do |k,v| 
    column(k).style :align => v
  end
end

move_down 4

content = []

order.line_items.each do |item|
	row = [ item.variant.product.sku, item.variant.product.name]
	row << item.variant.option_values.map {|ov| "#{ov.option_type.presentation}: #{ov.presentation}"}.concat(item.respond_to?('ad_hoc_option_values') ? item.ad_hoc_option_values.map {|pov| "#{pov.option_value.option_type.presentation}: #{pov.option_value.presentation}"} : []).join(', ')
	row << number_to_currency(item.price) unless hide_prices
	row << item.quantity
	row << number_to_currency(item.price * item.quantity) unless hide_prices
	content << row
end

table content, :position => :center,
	   :cell_style => {
	      :border_width => 0.5,
	      :padding   => [5,6],
	      :size => 9
	   },
	   :column_widths => column_widths do

  align.each do |k,v|
    column(k).style :align => v
  end
end

font "Helvetica", :size => 9

bounding_box [20,cursor], :width => 400 do
  render(:partial => "bye",:locals=>{:pdf=>pdf}) unless hide_prices
end

render(:partial => "totals", :locals=>{:pdf=>pdf})  unless hide_prices
  
move_down 2

stroke do
  line_width 0.5
  line bounds.top_left, bounds.top_right
  line bounds.top_left, bounds.bottom_left
  line bounds.top_right, bounds.bottom_right
  line bounds.bottom_left, bounds.bottom_right
end
