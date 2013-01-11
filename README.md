SUMMARY
=======

This extension provides a "Print Invoice" button on the Admin Orders view screen which generates a PDF of the order details.

Adapted from spree/spree_print_invoice_

Wanted to use it with spree 1.3, so updated the gemspec. 

Didn't know prawn, so I figured if I was going to have to learn that, I might as well learn the lastest version (1.0.0.rc1)

Changes include: pull logo from app/assets instead of public so behavior consistant in dev/prod enviroments...

prawn syntax changes to work with latest version...

render at end of prawn template instead of after each partial so cursor wouldn't reset to top of page.


 
INSTALLATION
============

1. The gem relies only on the prawn gem, to install you need to add the following lines to your Gemfile

    gem 'spree_print_invoice' , :git => 'git://github.com/jdevine/spree_print_invoice.git'

2. run bundler

    bundle install
  
3. Enjoy! now displays the items variant options 

Configuration
==============

1. Set the logo path preference to include your store / company logo.

    Spree::PrintInvoice::Config.set(:print_invoice_logo_path => "company-logo.png")

    if "company-logo.png" is at /app/assets/images/

2. Add your own own footer texts to the locale. The current footer works with :footer_left1 , :footer_left2 and :footer_right1, :footer_right2 where the 1 version is on the left in bold, and the 2 version the "value" on the right.

3. Override any of the partial templates. they are address, footer, totals, header, bye , and the line_items. In bye the text :thanks is printed.  The :extra_note hook has been deprecated as Spree no longer supports hooks.

4. Set :suppress_anonymous_address option to get blank addresses for anonymous email addresses (as created by my spree_last_address extension for empty/unknown user info)

5. Enable packaging slips, by setting 

  Spree::PrintInvoice::Config.set(:print_buttons => "invoice,packaging_slip")  #comma separated list

  Use above feature for your own template if you want. For each button_name, define button_name_print text in your locale.
