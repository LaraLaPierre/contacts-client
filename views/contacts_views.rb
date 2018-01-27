module ContactsViews
  def contacts_show_view(contact)
    puts
    puts "#{contact.first_name} - ID: #{contact.id}"
    puts 
    puts contact.full_name
    puts 
    puts contact.email 
    puts contact.phone_number
    puts "---------------------------"
    puts contact.bio 
  end 

  def contacts_index_view(contacts)
    contact.each do |contact|
      puts " ============================ "
      contacts_show_view
    end
  end 
