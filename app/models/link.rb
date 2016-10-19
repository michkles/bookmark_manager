<<<<<<< HEAD
=======
# require 'dm-migrations'
>>>>>>> day-threeb
require 'data_mapper'
require 'dm-postgres-adapter'

class Link
<<<<<<< HEAD
  include DataMapper::Resource

  property :id,     Serial # Serial means that it will be auto-incremented for every record
=======

  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id,     Serial
>>>>>>> day-threeb
  property :title,  String
  property :url,    String

end
<<<<<<< HEAD

# Now let's set up a connection with a database
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
# Let's check that everything we wrote in our models was OK
DataMapper.finalize
# And let's build any new columns or tables we added
DataMapper.auto_upgrade!
=======
>>>>>>> day-threeb
