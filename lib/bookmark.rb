require 'pg'
require 'dotenv'

class Bookmark

 Dotenv.load

  puts ENV['DBNAME']

  def self.all()
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'bookmark_manager_test')
    # else 
    #   connection = PG.connect(dbname: 'bookmark_manager')
    # end 

    connection = PG.connect(dbname: 'bookmark_manager_test')
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url']}
  end

  def self.create(url:)

    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end

  # def self.connect
  #   begin
  #     con = PG.connect :dbname => ENV['DBNAME'], :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
  #   rescue PG::Error => e
  #     puts e.message 
  #   ensure
  #     con.close if con
  #   end
  # end
end

