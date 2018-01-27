require 'unirest'
require_relative 'controllers/contacts_controller'
require_relative 'models/contact'
require_relative 'views/contacs_views'




class Frontend
  include ContactsController
  include ContactsViews


  def run 
    system "clear"

    puts "============================"
    puts "Welcome to my Contacts app!"
    puts "============================"

    puts "Choose an option:"
    puts "      [1] Show all contacts"
    puts "        [1.1] Search contacts by first name"
    puts "        [1.2] Sort contacts by middle name  "
    puts "        [1.3] Sort contacts by last name "
    puts "        [1.4] Sort contacts by email  "
    puts "        [1.5] Sort contacts by phone number "
    puts "        [1.6] Sort contacts by bio  "
    puts "      [2] Show one contact"
    puts "      [3] Create a contact"
    puts "      [4] Update a contact"
    puts "      [5] Delete a contact"

    input_option = gets.chomp

    if input_option == "1"
      contacts_index_action

    elsif input_option == "1.1"
      print "Enter a first name to search by: "
      search_term = gets.chomp

      response = Unirest.get("http://localhost:3000/contacts?search=#{search_term}")
      contacts = response.body
      puts JSON.pretty_generate(contacts)

    elsif input_option == "1.2"
      response = Unirest.get("http://localhost:3000/contacts?sort=middle_name")
      contacts = response.body
      puts JSON.pretty_generate(contacts)

    elsif input_option == "1.3"
      response = Unirest.get("http://localhost:3000/contacts?sort=last_name")
      contacts = response.body
      puts JSON.pretty_generate(contacts)

    elsif input_option == "1.4"
      response = Unirest.get("http://localhost:3000/contacts?sort=email")
      contacts = response.body
      puts JSON.pretty_generate(contacts)

    elsif input_option == "1.5"
      response = Unirest.get("http://localhost:3000/contacts?sort=phone_number")
      contacts = response.body
      puts JSON.pretty_generate(contacts)

    elsif input_option == "1.6"
      response = Unirest.get("http://localhost:3000/contacts?sort=bio")
      contacts = response.body
      puts JSON.pretty_generate(contacts)

    elsif input_option == "2"
      contacts_show_action

    elsif input_option == "3"
      contacts_create_action

    elsif input_option == "4"
      contacts_update_action
      
    elsif input_option == "5"
      contacts_destroy_action
    
    end  
  end 
  

end 