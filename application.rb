Dir["./models/*.rb"].each{|model| require model}

  configure do
   # Sequel.connect('mysql2://sequel:test@localhost:3306/blog')
    set :root, File.dirname(__FILE__)
    set :template, :erb
  end

  # Mysql2.configure do |config|
   #  config.master = Mysql2::Connection.from_uri("mysql2://sequel:test@localhost:3306").db("blog")
   #end
  use Demo

  get '/' do
    #redirect '/index'
    'hello sinatra'
  end

  #run! if app_file == $0
