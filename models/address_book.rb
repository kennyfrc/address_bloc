require_relative "entry.rb"
require "csv"

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0
    @entries.each do |entry|
      if name < entry.name # if a name lexicographically proceeds entry.name
                           # then you've found the index on where to insert
                           # with the result being an arranged sequence
        break
      end
      index += 1
    end
    @entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name)
    return "entries is already empty" if entries.size == 0
    @entries.delete_if { |e| e.name == name}
  end

  def import_from_csv(file_name) # this used to be a stub. it's just something that we wan tto test first.
    csv_text = File.read(file_name) # reads the file 
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true) # we then parse the file -> a CSV::Table

    csv.each do |row|
      row_hash   = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end
end