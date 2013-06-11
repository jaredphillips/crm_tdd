
require_relative 'helper_test'

class TestDatabase < Test::Unit::TestCase

  def setup
    #puts ""
    @contact = Contact.new(5, "Will", "Richman", "will@bitmakerlabs.com", "note")
    @db = Database.new
    @db.add @contact
  end

  def test_modify_contact_successfully_modifies_lastname
    contact = @db.modify_contact("Will", :lastname, "Schumaker")
    assert_equal "Schumaker", @contact.lastname
    assert_equal contact, @db.contacts_array.first
  end

  def test_modify_contact_returns_nil_for_unknown_contact
    contact = @db.modify_contact("Jared", :firstname, "Filip")
    assert_equal nil, contact
  end


  def test_checking_total_number_of_conntacts_in_data_base
    #new setup . starting with 0 contacts
    db = Database.new
    contact = Contact.new(2,"randomname","rundomsurname","randomemail","randomnote")

    assert_equal 0, db.size
    db.add contact
    assert_equal 1, db.size
  end

  def test_deleting_contact_removes_it_from_db
    @db.delete_contact(@contact)
    assert_equal 0, @db.size
  end

  def test_displaying_single_attribute_of_all_contacts
    #new setup. adding new contacts
    contact2 = Contact.new(65, "Will2", "Richman2", "will@bitmakerlabs.com2", "note2")
    contact3 = Contact.new(77, "Will3", "Richman3", "will@bitmakerlabs.com3", "note3")
    @db.add contact2
    @db.add contact3

    assert_equal "5, 65, 77", @db.display_all(:id)
    assert_equal "Will, Will2, Will3", @db.display_all(:firstname)
    assert_equal "Richman, Richman2, Richman3", @db.display_all(:lastname)
    assert_equal "will@bitmakerlabs.com, will@bitmakerlabs.com2, will@bitmakerlabs.com3",@db.display_all(:email)
    assert_equal "note\nnote2\nnote3", @db.display_all(:notes)
    # assert_equal nil,@db.display_all(:no_name_of_variable)
  end

  def test_modify_contact_successfully_modifies_firstname
    contact = @db.modify_contact("Will", :firstname, "Jared")
    assert_equal "Jared", @contact.firstname
    assert_equal contact, @db.contacts_array.first
  end

  def test_modify_contact_successfully_modifies_email
    contact = @db.modify_contact("Will", :email, "Schumaker")
    assert_equal "Schumaker", @contact.email
    assert_equal contact, @db.contacts_array.first
  end

  def test_modify_contact_successfully_modifies_notes
    contact = @db.modify_contact("Will", :notes, "Schumaker")
    assert_equal "Schumaker", @contact.notes
    assert_equal contact, @db.contacts_array.first
  end

  def test_modify_contact_successfully_modifies_id_shouldnt_change
    contact = @db.modify_contact("Will", :id, 12)
    assert_equal 5, @contact.id
    assert_equal contact, @db.contacts_array.first
  end

  def test_modify_contact_by_selecting_one_of_its_attributes
    contact = @db.modify_contact("Will", :email, "Schumaker")
    assert_equal "Schumaker", @contact.email
    contact = @db.modify_contact("Will", :lastname, "Schumaker")
    assert_equal "Schumaker", @contact.lastname
    contact = @db.modify_contact("Will", :email, "Schumaker")
    assert_equal "Schumaker", @contact.email
    contact = @db.modify_contact("Will", :notes, "Schumaker")
    assert_equal "Schumaker", @contact.notes
    contact = @db.modify_contact("Will", :firstname, "Schumaker")
    assert_equal "Schumaker", @contact.firstname
    assert_equal contact, @db.contacts_array.first
  end
  
end