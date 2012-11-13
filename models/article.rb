DB = Sequel.connect("mysql2://sequel:test@localhost:3306/blog")

class Article < Sequel::Model
 set_dataset DB[:articles]
 
 def date_iso8601
    date_published.strftime("%Y-%m-%dT%H:%M:%SZ")
 end

end
