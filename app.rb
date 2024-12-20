require 'dotenv/load'
require 'sinatra'
require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'])

class Person < Sequel::Model
end

class App < Sinatra::Base
    
    get '/' do
        erb :index, :locals => {:people => Person.all}
    end

end