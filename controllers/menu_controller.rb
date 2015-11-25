require_relative "../models/address_book"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - View entry number n"
    puts "6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i # gets asks the user to provide some inputs

    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      system "clear"
      view_entry
      main_menu
    when 6
      puts "Bye!"
      exit(0)
    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end

  def create_entry
    system "clear"
    puts "Create a new AddressBloc Entry"
    print "Name: "
    name = gets.chomp
    print "Email: "
    email = gets.chomp
    print "Phone: "
    phone = gets.chomp

    @address_book.add_entry(name, phone, email)

    system "clear"
    puts "New Entry Created"
  end

  def view_all_entries
    @address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
        entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end

  def entry_submenu(entry)
    # next entry
    # delete entry
    # edit entry
    # return to main menu

    selection = gets.chomp

    case selection

    when "n"
    when "d"
    when "e"
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entries_submenu(entry)
    end
  end

  def view_entry
    system "clear"
    print "Entry Number: "
    entry = gets.chomp.to_i
    puts "Invalid number. The entry number you choose exceed the numbers of entries." if entry > @address_book.entries.count
    puts @address_book.entries[entry - 1].to_s #no exception handling yet
    puts "-------------"
  end
end
