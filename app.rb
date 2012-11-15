#this is sinatra and sequel demo
#require 'sinatra/reloader' not to do this, why?
#require 'sinatra/json'
require 'sinatra/reloader'
require './models/article.rb'

#class App  < Sinatra::Base
 #set :views, File.dirname(__FILE__) + '/../views'
 #DB=Sequel.connect('mysql2://sequel:test@localhost:3306/blog')

  #set :views,File.dirname(__FILE__) + '/views'
  #this is first create table,
  #DB.create_table :articles do
    #primary_key :id
    #String :title
    #String :content
    # Time   :date
  #end

 # module Validations
 #   def valid_id?(id)
 #    id && id.to_s =~ /^\d+$/
 #   end
 # end

  #articles = DB[:articles]
 # enable :sessions

  before '/' do
   redirect '/new' unless Article.count != 0
  end

  get '/new', :provides => 'html' do
    erb :new
  end

  post '/' do
    time = Time.new
    Article.insert(:title => params[:title],:content => params[:content],
                  :date => time.strftime("%Y-%m-%d %H:%M:%S")
                 )
  end

  get '/' do
     @articles = Article.all
     erb :index
  end

  get '/update' do
     @article =  Article[:id => params[:id].to_i]
     erb :update 
  end

  put '/' do
     Article.where('id = ?',params[:id]).update(:title => params[:title],:content => params[:content])
     redirect '/'
  end

  delete '/' do
     Article.where('id = ?', params[:id]).delete
     redirect '/'
  end

 get '/api/:id'  do
    content_type :json

    @article = Article[:id => params[:id].to_i]
    tmp = {:id => @article.id,:title => @article.title,:content => @article.content,:date => @article.date}
    json  :article => tmp.to_json
 end

  not_found do
    'this is nothing for you'
  end

  error 400..510 do
    'some error for you'
  end
#end
