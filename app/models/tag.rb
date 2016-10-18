

require 'data_mapper'
require 'dm-postgres-adapter'

class Tag
  include DataMapper::Resource

  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :name,  String

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# Let's check that everything we wrote in our models was OK
DataMapper.finalize
# And let's build any new columns or tables we added
DataMapper.auto_upgrade!
