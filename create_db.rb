require 'rubygems'
require 'sequel'

DB = Sequel.sqlite('blog.db')

DB.create_table :articles do
           primary_key :id,     :integer
           column      :title,  :varchar
           column      :content,:varchar
           column      :date,   :timestamp
           end

DB[:articles] << {:title =>"hello",
                  :content => "this is sinatra project",
                  :date => Time.now} 
