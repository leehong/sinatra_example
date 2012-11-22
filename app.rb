require 'sinatra/reloader'
require './models/article.rb'

#class App  < Sinatra::Base
 #set :views, File.dirname(__FILE__) + '/../views'
 set :root, File.dirname(__FILE__)

 # module Validations
 #   def valid_id?(id)
 #    id && id.to_s =~ /^\d+$/
 #   end
 # end

 # enable :sessions
 # before '/posts' do
 #   redirect '/posts/new' unless Article.count != 0
 # end

  get '/posts/new', :provides => 'html' do
    erb :new
  end

  post '/posts' do
    time = Time.new
    Article.insert(:title => params[:title],:content => params[:content],
                  :date => time.strftime("%Y-%m-%d %H:%M:%S")
                 )
    status 201
  end

  get '/posts' do
     @articles = Article.all
     erb :index
  end

  get '/posts/update' do
     @article =  Article[:id => params[:id].to_i]
     erb :update 
  end

  put '/posts/:id' do
     Article.where('id = ?',params[:id]).update(:title => params[:title],:content => params[:content])
     status 200
  end

  delete '/posts/:id' do
     Article.where('id = ?', params[:id]).delete
     status 204
  end

  not_found do
    'this is nothing for you'
  end

  error 400..510 do
    'some error for you'
  end
