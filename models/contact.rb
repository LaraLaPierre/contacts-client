class Contact
  attr_accessor :id, :first_name, :middle_name, :last_name, :full_name :email, :phone_number, :bio
  def initialize(input_options)
    @id = input_options["id"]
    @first_name = input_options["first_name"]
    @middle_name = input_options["last_name"]
    @full_name = input_options["full_name"]
    @email = input_options["email"]
    @phone_number = input_options["phone_number"]
    @bio = input_options["bio"]
  end 
end 