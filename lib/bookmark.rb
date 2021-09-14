require 'pg'
require 'dotenv'

class Bookmark

  Dotenv.load

  puts ENV['DBNAME']

  def self.all
    [
      "http://www.makersacademy.com",
      "https://github.com"
     ]
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

