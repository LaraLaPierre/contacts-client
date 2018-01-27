module ContactsController
  def contacts_index_action
    response = Unirest.get("http://localhost:3000/contacts")
    contacts_hashes = response.body
    contacts = []

    contacts_hashes.each do |contact_hash|
      contacts << Contact.new(contact_hash)
    end

    contacts_index_view(contacts)

  end 

  def contacts_show_action
    print "Enter an id: "
    input_id = gets.chomp

    response = Unirest.get("http://localhost:3000/contacts/#{input_id}")
    contact_hash = response.body
    contact = Contact.new(contact_hash)

    contacts_show_view(contact)
  end 

  def contacts_create_action
    client_params = {}

    print "First Name: "
    client_params[:first_name] = gets.chomp

    print "Middle Name: "
    client_params[:middle_name] = gets.chomp

    print "Last Name: "
    client_params[:last_name] = gets.chomp

    print "Email: "
    client_params[:email] = gets.chomp 

    print "Phone Number: "
    client_params[:phone_number] = gets.chomp 

    print "Bio: "
    client_params[:bio] = gets.chomp

    response = Unirest.post(
                            "http://localhost:3000/contacts",
                            parameters: client_params
                            )

    if response.code == 200
      contact_data = response.body
      puts JSON.pretty_generate(contact_data)
    else 
      errors = response.body["errors"]
      errors.each do |error|
        puts error
      end 
    end 
  end

  def contacts_update_action
    print "Enter an id: "
    input_id = gets.chomp

    response = Unirest.get("http://localhost:3000/contacts/#{input_id}")
    contact = response.body

    client_params = {}

    print "First Name (#{contact["first_name"]}): "
    client_params[:first_name] = gets.chomp

    print "Middle Name (#{contact["middle_name"]}): "
    client_params[:last_name] = gets.chomp

    print "Last Name (#{contact["last_name"]}): "
    client_params[:last_name] = gets.chomp

    print "Email (#{contact["email"]}): "
    client_params[:email] = gets.chomp

    print "Phone Number (#{contact["phone_number"]}): "
    client_params[:phone_number] = gets.chomp 

    print "Bio (#{contact["bio"]}): "
    client_params[:bio] = gets.chomp 

    response = Unirest.patch(
                            "http://localhost:3000/contacts/#{input_id}",
                            parameters: client_params
                            )

    client_params.delete_if { |key, value| value.empty? }

    if response.code == 200 
      contact_data = response.body
      puts JSON.pretty_generate(contact_data)
    else 
      errors = response.body["errors"]
      errors.each do |error|
        puts error
      end 
    end
  end 

  def contacts_destroy_action
      print "Enter an id: "
      input_id = gets.chomp

      response = Unirest.delete("http://localhost:3000/contacts/#{input_id}")
      contact_data = response.body 
      puts contact_data["message"]
  end 

end 

