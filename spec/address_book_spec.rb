require_relative "../models/address_book.rb"

 RSpec.describe AddressBook do

  let(:address_book) { AddressBook.new } # this is to set a "global" instance of AddressBook

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eql expected_name
    expect(entry.phone_number).to eql expected_number
    expect(entry.email).to eql expected_email
  end


   context "attributes" do # context is an alias of describe
    it "should respond to entries" do
      expect(address_book).to respond_to(:entries)
    end

    it "should initialize entries into an Array" do
      expect(address_book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      expect(address_book.entries.size).to eq(0)
    end
   end

   context "#add_entry" do
      it "adds only one entry to the address book" do
        address_book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        expect(address_book.entries.size).to eq(1)
      end
      
      it "adds the correct information to entries" do
        address_book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        new_entry = address_book.entries[0]

        expect(new_entry.name).to eq("Ada Lovelace")
        expect(new_entry.phone_number).to eq("010.012.1815")
        expect(new_entry.email).to eq("augusta.king@lovelace.com")
    end

    context "#remove_entry" do
      it "removes only one entry from the address book" do
        address_book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

        expect(address_book.remove_entry("Ada Lovelace").entries.size).to eq(0)
      end
    end
  end

  context ".import_from_csv" do
    it "imports the correct number of entries" do
      address_book.import_from_csv("entries.csv")
      book_size = address_book.entries.size 

      expect(book_size).to eql 5
    end

    it "imports the first entry" do
      address_book.import_from_csv("entries.csv")

      entry_one = address_book.entries[0]

      check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
    end

    it "imports the second entry" do
      address_book.import_from_csv("entries.csv")

      entry_two = address_book.entries[1]

      check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
    end

    it "imports the third entry" do
      address_book.import_from_csv("entries.csv")

      entry_three = address_book.entries[2]

      check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
    end

    it "imports the fourth entry" do
      address_book.import_from_csv("entries.csv")

      entry_four = address_book.entries[3]

      check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
    end

    it "imports the fifth entry" do
      address_book.import_from_csv("entries.csv")

      entry_five = address_book.entries[4]

      check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
    end
  end

  context ".import_from_csv with a diff csv file" do
    it "imports the correct number of entries" do
      address_book.import_from_csv("entries_2.csv")
      book_size = address_book.entries.size 

      expect(book_size).to eql 3
    end

    it "imports the first entry" do
      address_book.import_from_csv("entries_2.csv")

      entry_one = address_book.entries[0]

      check_entry(entry_one, "Francis", "555-555-4854", "francis@blocmail.com")
    end

    it "imports the second entry" do
      address_book.import_from_csv("entries_2.csv")

      entry_two = address_book.entries[1]

      check_entry(entry_two, "Kenn", "555-555-3660", "kenn@blocmail.com")
    end

    it "imports the third entry" do
      address_book.import_from_csv("entries_2.csv")

      entry_three = address_book.entries[2]

      check_entry(entry_three, "Pefita", "555-555-5415", "pefita@blocmail.com")
    end
  end

 end