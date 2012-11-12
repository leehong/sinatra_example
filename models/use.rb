require  'sinatra/base'

class Show < Sinatra::Base
    get '/show' do 
      'show sinatra use method usage'
    end
end

class Test  < Sinatra::Base
   # middleware will run before filters
  use Show
  #use Demo  

  get '/' do
    "<a href='/show'>show</a>. <a href='/add'>add</a>"
  end

  not_found do
    'you are not usage sinatra use method'
  end
  run! if app_file == $0
end
