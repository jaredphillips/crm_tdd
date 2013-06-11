require_relative 'crm_contact'
class Database

	attr_accessor :contact, :contacts_array

	def initialize
		@contacts_array = []
	end


	def add(contact)
		@contacts_array << contact
	end

	def modify_contact(selection, attribute, new_value)
		@contacts_array.each do |contact|
  			if (contact.id == selection) || (contact.firstname == selection) || (contact.lastname == selection) || (contact.email == selection) || (contact.notes == selection)
	  	# instance_variables.map(&method(:instance_variable_get))#.any?{ |value| value == selection }
		    contact.send(attribute.to_s + "=", new_value) unless attribute==:id
		    return contact
		  	end
  		end 
  	nil
  end

  def size 
  	@contacts_array.size
  end

  def delete_contact(requested_contact)
  	contact_to_delete = @contacts_array.find { |contact| contact.id == requested_contact.id }
  	@contacts_array.delete(contact_to_delete)
  end

  def display_all(key)
  	result = []
  	@contacts_array.each{|contact| result << contact.send(key)}  		
  	result.join :notes !=key ? (", ") : ("\n")		
	end
end