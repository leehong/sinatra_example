#this is sinatra and sequel demo

require 'sinatra'
require 'sequel'
require 'erb'
require 'sinatra/reloader'

set :views, File.dirname(__FILE__) + '/views'
DB=Sequel.connect('mysql2://root:admaster@localhost:3306/blog')

#this is first create table,
#DB.create_table :articles do
 # primary_key :id
  #String :title
  #String :content
 # Time   :date
#end

articles = DB[:articles]

get '/' do
 erb :index
end

post '/' do
  time = Time.new
  articles.insert(:title => params[:title],:content => params[:content],
                  :date => time.strftime("%Y-%m-%d %H:%M:%S")
                 )
  redirect '/item'
end

get '/item' do
   @articles = articles.all
   erb :article
end

get '/show' do
   @article =  articles[:id => params[:id].to_i]
  erb :update 
end

put '/' do
   articles.where('id = ?',params[:id]).update(:title => params[:title],:content => params[:content])
  redirect '/item'
end

delete '/' do
   articles.where('id = ?', params[:id]).delete
  redirect '/item'
end
