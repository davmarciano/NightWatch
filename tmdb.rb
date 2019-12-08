require 'uri'
require 'net/http'
require 'json'

token = "2b1bd731b0e8a09e7f1cb8a5f851a0e3"

url = URI("https://api.themoviedb.org/3/movie/#{imdb_id.first}/images?api_key=#{token}")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request.body = "{}"

response = http.request(request).read_body
file_path = JSON.parse(response)["backdrops"][0]["file_path"]

"https://image.tmdb.org/t/p/original#{file_path}"
