require 'uri'
require 'open-uri'
require 'nokogiri'
require 'net/http'
require 'openssl'
require 'json'
require "csv"

###### UNCOMMENT ######

puts "DELETING ALL SEEDS ..."

WatchlistMovie.destroy_all
Movie.destroy_all
Follow.destroy_all
Movie.destroy_all
Review.destroy_all
Watchlist.destroy_all
User.destroy_all

puts "DONE!"

#######################

puts "CREATING MOVIES ..."

# parse through csv to get movie's IMDb id + IMDb Alternative API

CSV.foreach("IMDb.csv") do |imdb_id|

  url = URI("https://movie-database-imdb-alternative.p.rapidapi.com/?i=#{imdb_id.first}&r=json")
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'movie-database-imdb-alternative.p.rapidapi.com'
  request["x-rapidapi-key"] = 'a9e7e3bad6mshcb94aa3721ff12dp112d21jsn12f2d81d3dab'
  response = http.request(request).read_body
  title = JSON.parse(response)["Title"]

  next title if Movie.exists?(title: title)

  # get background image url for TMDb API

  # token = "2b1bd731b0e8a09e7f1cb8a5f851a0e3"
  # url = URI("https://api.themoviedb.org/3/movie/#{imdb_id.first}/images?api_key=#{token}")

  # http = Net::HTTP.new(url.host, url.port)
  # http.use_ssl = true
  # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  # request = Net::HTTP::Get.new(url)
  # request.body = "{}"

  # response = http.request(request).read_body
  # file_path = JSON.parse(response)["backdrops"][0]["file_path"]

  # create movie

  Movie.create!(
    title: title,
    year: JSON.parse(response)["Year"],
    genres: JSON.parse(response)["Genre"],
    directors: JSON.parse(response)["Director"],
    actors: JSON.parse(response)["Actors"],
    plot: JSON.parse(response)["Plot"],
    language: JSON.parse(response)["Language"],
    poster: JSON.parse(response)["Poster"],
    imdb_id: imdb_id.first
  )
end

puts "MOVIES CREATED !"


#######################

require 'faker'

40.times do

  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "#{Faker::Name.first_name}-#{Faker::Name.last_name}@mail.com",
    password: "123456",
    profile_picture: "https://source.unsplash.com/featured/?face"
  )

  user.email = "#{user.first_name}-#{user.last_name}@mail.com"
  user.save!
end

