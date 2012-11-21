class Article <Sequel::Model
  #set the table name, not used Sequel Model classes
  # Article.set_dataset :articles  
  
 # def validate
  #  super
   # errors.add(:title, 'cannot be empty') if !Article.title || Article.empty?
  #end

  def date_iso8601
    date_published.strftime("%Y-%m-%dT%H:%M:%SZ")
  end
end
