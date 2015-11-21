require_relative "entry.rb"

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
end