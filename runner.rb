require 'unirest'

system "clear"
puts "============================"
puts "Welcome to my Contacts app!"
puts "============================"

puts "Choose an option:"
puts "      [1] Show all contacts"
puts "      [2] Show one contact"
puts "      [3] Create a contact"
puts "      [4] Update a contact"
puts "      [5] Delete a contact"

input_option = gets.chomp

if input_option == "1"
  response = Unirest.get("http://localhost:3000/contacts")
  contacts = response.body
  puts JSON.pretty_generate(contacts)

elsif input_option == "2"
  print "Enter an id: "
  input_id = gets.chomp

  response = Unirest.get("http://localhost:3000/contacts/#{input_id}")
  contacts = response.body
  puts JSON.pretty_generate(contacts)

elsif input_option == "3"
  client_params = {}

  print "First Name: "
  client_params[:first_name] = gets.chomp

  print "Last Name: "
  client_params[:last_name] = gets.chomp

  print "Email: "
  client_params[:email] = gets.chomp 

  print "Phone Number: "
  client_params[:phone_number] = gets.chomp 

  response = Unirest.post(
                          "http://localhost:3000/contacts",
                          parameters: client_params
                          )
  contact_data = response.body

  puts JSON.pretty_generate(contact_data)

elsif input_option == "4"
  print "Enter an id: "
  input_id = gets.chomp

  response = Unirest.get("http://localhost:3000/contacts/#{input_id}")
  contact = response.body

  client_params = {}

  print "First Name (#{contact["first_name"]}): "
  client_params[:first_name] = gets.chomp

  print "Last Name (#{contact["last_name"]}): "
  client_params[:last_name] = gets.chomp

  print "Email (#{contact["email"]}): "
  client_params[:email] = gets.chomp

  print "Phone Number (#{contact["phone_number"]}): "
  client_params[:phone_number] = gets.chomp 

  response = Unirest.patch(
                          "http://localhost:3000/contacts/#{input_id}",
                          parameters: client_params
                          )

  client_params.delete_if { |key, value| value.empty? }

  contact_data = response.body

  puts JSON.pretty_generate(contact_data)

elsif input_option == "5"
  print "Enter an id: "
  input_id = gets.chomp

  response = Unirest.delete("http://localhost:3000/contacts/#{input_id}")
  contact_data = response.body 
  puts contact_data["message"]

end 

