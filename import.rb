require 'mongo'
require 'json'

database = Mongo::MongoClient.new['tate']
artists_collection = database['artists']
artworks_collection = database['artworks']

artist_list = Dir.glob('artists/**/*.json')
artworks_list = Dir.glob('artworks/**/*.json')

artist_list.each do |file|
	data = JSON.parse(File.read(file))
	id = data['id']
	data['_id'] = id
	artists_collection.update({'_id' => id }, data, :upsert => true)
	puts "#{file} inserted"
end

artworks_list.each do |file|
	data = JSON.parse(File.read(file))
	id = data['id']
	data['_id'] = id
	artworks_collection.update({'_id' => id }, data, :upsert => true)
	puts "#{file} inserted"
end


puts "Done"
