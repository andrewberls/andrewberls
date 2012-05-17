class Post < ActiveRecord::Base
  
  has_and_belongs_to_many :tags
  belongs_to :user
  
  validates_presence_of :title
  validates_presence_of :body
  
  def tag_list
    self.tags.map {|t| t.name }.join(", ")
  end
  
  def tag_list=(tag_list)
    self.tags.clear
    tags = tag_list.split(",").collect{|s| s.strip.downcase}    
    tags.each do |tag_name|
      tag = Tag.find_or_create_by_name(tag_name)
      tag.name = tag_name      
      self.tags << tag
    end  
  end

  def url_alias=(url_alias)
    self[:url_alias] = url_alias.strip.chomp.gsub(" ", "-")
  end
  
end
