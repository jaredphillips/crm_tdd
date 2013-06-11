class Contact
	attr_accessor :id, :firstname, :lastname, :email, :notes

	def initialize(id,firstname,lastname,email,notes)
		@id = id
		@firstname = firstname
		@lastname = lastname
		@email = email
		@notes = notes
	end

end