require 'dotenv/load'
require 'sinatra'
require 'sequel'

class App < Sinatra::Base

    DB = Sequel.connect(ENV['DATABASE_URL'])

    # create a table
    DB.create_table? :beatles do
        primary_key :id
        String :first_name, null: false
        String :last_name, null: false
    end
    
    # create a dataset from the table
    beatles = DB[:beatles]
    
    # populate the table
    beatles.insert_ignore.insert(id: 1, first_name: 'George', last_name: 'Harrison')
    beatles.insert_ignore.insert(id: 2, first_name: 'John', last_name: 'Lennon')
    beatles.insert_ignore.insert(id: 3, first_name: 'Paul', last_name: 'McCartney')
    beatles.insert_ignore.insert(id: 4, first_name: 'Ringo', last_name: 'Starr')
    
    get '/' do
        erb :index, :locals => {:beatles => beatles.all}
    end
    
end