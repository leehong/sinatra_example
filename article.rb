class Article < Sequel::Model
 set_dataset DB[:articles]
 
 set_schema do
   primary_key :id,     :integer
   column      :title,  :varchar
   column      :content,:varchar
   column      :date,   :timestamp
 end 

 after_initialize do
   if @new
     {
       :title => "no title",
       :content => "no content"
     }.each do |key,value|
       @values[key] = value if @values[key].nil? or @values[key].empty?
     end
   end
 end

 def date_iso8601
    date_published.strftime("%Y-%m-%dT%H:%M:%SZ")
 end

end
