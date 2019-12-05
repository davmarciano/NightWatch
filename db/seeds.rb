require 'uri'
require 'open-uri'
require 'nokogiri'
require 'net/http'
require 'openssl'
require 'json'

puts "DELETING ALL MOVIES ..."
Movie.destroy_all
puts "all movies deleted"

puts "CREATING NEW MOVIES ..."


url = "https://www.imdb.com/search/title/?count=100&groups=top_1000&sort=user_rating"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.lister-item-header a').each do |element|
  value = element.attribute('href').value
  pattern = /(?<imdb_id>tt\d{1,})/
  imdb_id = value.match(pattern)

  url = URI("https://movie-database-imdb-alternative.p.rapidapi.com/?i=#{imdb_id}&r=json")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'movie-database-imdb-alternative.p.rapidapi.com'
  request["x-rapidapi-key"] = 'a9e7e3bad6mshcb94aa3721ff12dp112d21jsn12f2d81d3dab'
  response = http.request(request).read_body

 Movie.create!(
    title: JSON.parse(response)["Title"],
    year: JSON.parse(response)["Year"],
    genres: JSON.parse(response)["Genre"],
    directors: JSON.parse(response)["Director"],
    actors: JSON.parse(response)["Actors"],
    plot: JSON.parse(response)["Plot"],
    language: JSON.parse(response)["Language"],
    poster: JSON.parse(response)["Poster"],
  )
end

puts "MOVIES CREATED !"


######
require 'faker'

40.times do

  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "#{Faker::Name.first_name}-#{Faker::Name.last_name}@mail.com",
    password: "123456",
    profile_picture: nil
  )

  user.email = "#{user.first_name}-#{user.last_name}@mail.com"
  user.save!
end






