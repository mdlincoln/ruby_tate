require 'mongo'
require 'json'

collection = Mongo::MongoClient.new['arth']['tate_artists']

file_list = Dir.glob('artists/**/*.json')

file_list.each do |file|
	data = JSON.parse(File.read(file))
	# data['_id'] = data['acno']
	collection.insert(data)
	puts "#{file} inserted"
end

puts "Done"
