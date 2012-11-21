#init environment
ROOT_PATH =  File.expand_path(".")
ENV["RACK_ENV"] ||= "development"
Bundler.require(:default, ENV["RACK_ENV"].to_sym) 

Sequel.connect(:adapter=>'mysql2', :host=>'localhost', :database=>'blog', :user=>'sequel', :password=>'test') if ENV["RACK_ENV"] == 'development'
Sequel.connect('sqlite://./blog.db') if  ENV["RACK_ENV"] == 'test'
