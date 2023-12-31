# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'


file_path = File.join(Rails.root, "db", "data", "omdb_sample.csv")
data = CSV.parse(File.read(file_path), headers: true)

puts "Movie CSV import started ..."

data.each do |row|
  name = row['title']
  subtitle = row["tagline"] || row['title']
  released_date = Date.parse(row["release_date"] || "9999-12-31")
  rating_avg = row["vote_average"].to_f
  rating_count = row["vote_count"].to_i

  Movie.create!(name: name, subtitle: subtitle, released_date: released_date, rating_avg: rating_avg, rating_count: rating_count)
end

puts "Movie import is finished: (#{Movie.count})"
