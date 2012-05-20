class Post < ActiveRecord::Base
  
  has_and_belongs_to_many :tags
  belongs_to :user
  
  validates_presence_of :title
  validates_presence_of :body
  
  def tag_list
    self.tags.collect { |t| t.name }.join(", ")
  end
  
  def tag_list=(tag_list)
    self.tags.clear
    tags = tag_list.split(",").collect { |s| s.strip.downcase }

    tags.each do |tag_name|
      tag = Tag.find_or_create_by_name(tag_name)
      tag.name = tag_name      
      self.tags << tag
    end

  end

  def url_alias=(url_alias)
    self[:url_alias] = url_alias.strip.chomp.gsub(" ", "-")
  end

  def has_pagebreak?
    self[:body].include? '<break />'
  end

  BREAK_TAG = '<break />'

  def render_teaser
    # Render body until a break tag or the end

    body = self[:body]

    if self.has_pagebreak?               
      # Slice up until the start of the break tag
      endchar = body.index(BREAK_TAG) - 1         
      body = body[0..endchar]    
    end
    
    body.html_safe
  end

  def render_full
    # Remove break tag and return full post
    self[:body].slice BREAK_TAG
    body.html_safe
  end
  
end
