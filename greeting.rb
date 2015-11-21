def greeting
  ARGV.each do |arg|
    puts "Yo #{arg}"
  end
end

greeting