require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :title,  String
  property :url,    String

end
# Now let's set up a connection with a database
DataMapper.setup(:default, ENV['postgres://keawipgiereusg:GbPWb2YsMPLcw2ROpii4HklF1j@ec2-184-73-202-229.compute-1.amazonaws.com:5432/d8688odvu532hm'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# Let's check that everything we wrote in our models was OK
DataMapper.finalize
# And let's build any new columns or tables we added
DataMapper.auto_upgrade!
