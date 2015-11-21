require_relative "../models/address_book.rb"

 RSpec.describe AddressBook do
   context "attributes" do
    it "should respond to entries" do
      address_book = AddressBook.new
      expect(address_book).to respond_to(:entries)
    end

    it "should initialize entries into an Array" do
      address_book = AddressBook.new
      expect(address_book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      address_book = AddressBook.new
      expect(address_book.entries.size).to eq(0)
    end
   end

    context "#add_entry" do
      it "adds only one entry to the address book" do
        address_book = AddressBook.new
        address_book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        expect(address_book.entries.size).to eq(1)
      end
      
      it "adds the correct information to entries" do
        address_book = AddressBook.new
        address_book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        new_entry = address_book.entries[0]

        expect(new_entry.name).to eq("Ada Lovelace")
        expect(new_entry.phone_number).to eq("010.012.1815")
        expect(new_entry.email).to eq("augusta.king@lovelace.com")
    end
  end

 end