require 'rubygems'
require 'sqlite3'
$db = SQLite3::Database.new("development.sqlite3")
$db.results_as_hash = true

puts "Enter the name of the file you want to import"
filename = gets.chomp

File.open("#{filename}", "r").each do |line|
	$db.execute("INSERT INTO books (id, title, subject, year, author_id) VALUES (?, ?, ?, ?, ?)", line.split("|")[0].chomp, line.split("|")[1].chomp, line.split("|")[2].chomp, line.split("|")[4].chomp, line.split("|")[5].chomp)
end
