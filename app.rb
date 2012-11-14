#require 'sinatra/base'
#this is sinatra and sequel demo
#require 'sinatra/reloader' not to do this, why?
require './models/article.rb'

#class Demo < Sinatra::Base
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

  #articles = DB[:articles]

  get '/add' do
    erb :add
  end

  post '/' do
    time = Time.new
    Article.insert(:title => params[:title],:content => params[:content],
                  :date => time.strftime("%Y-%m-%d %H:%M:%S")
                 )
    redirect '/'
  end

  get '/' do
     @articles = Article.all
     erb :article
  end

  get '/show' do
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

  not_found do
    'this is nothing for you'
  end

  error 400..510 do
    'some error for you'
  end
