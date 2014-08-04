require 'rubygems'
require 'sqlite3'
$db = SQLite3::Database.open("development.sqlite3")
$db.results_as_hash = true

# create the table
#$db.execute %q{
#	CREATE TABLE books (
#	id integer primary key,
#	title varchar (50),
#	author varchar (50),
#	country varchar (50),
#	language varchar (50),
#	subject varchar (50),
#	year integer);
#}

# imports a properly formatted text file with book data into an SQL database

puts "Enter the name of the file you want to import"
filename = gets.chomp

File.open("#{filename}", "r").each do |line|
#	$db.execute("INSERT INTO books (title, author, country, language, subject, year) VALUES (?, ?, ?, ?, ?, ?)", line.split("|")[1], line.split("|")[2], line.split("|")[3], line.split("|")[4], line.split("|")[5], line.split("|")[6])
	$db.execute("INSERT INTO authors (name) VALUES (?)", line.chomp)
end
