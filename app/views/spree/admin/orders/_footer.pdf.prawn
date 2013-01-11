# To get a simple text, use the line below with your own footer_message
#  text_box footer_message, :at => [margin_box.left -10, margin_box.bottom + 40], :size => 8 , :position => :left

repeat :all do
  table [[make_cell( :content => t(:footer_left), :font_style => :bold ),
            make_cell( :content => t(:footer_left2)),
            make_cell( :content => t(:footer_right), :font_style => :bold ),
            make_cell( :content => t(:footer_right2))]],
            :cell_style {
              :border_width => 0,
              :vertical_padding => [2,0]
              :size => 9,
            },
            :column_widths => { 0 => 80, 1 => 190, 2 => 75, 3 => 190 }
end
