class Post < ActiveRecord::Base

  has_and_belongs_to_many :tags
  belongs_to :user

  validates_presence_of :title, :body, :url_alias

  def tag_list
    self.tags.map(&:name).join(", ")
  end

  def tag_list=(tag_list)
    self.tags.clear
    tags = tag_list.split(",").sort.collect { |s| s.strip.downcase }

    tags.each do |tag|
      self.tags << Tag.find_or_create_by_name(tag)
    end

  end

  def url_alias=(url_alias)
    # Strip trailing whitespace, convert to lowercase, remove punctuation,
    # and convert spaces to hyphens
    self[:url_alias] = url_alias.strip.chomp.downcase.gsub(/[^0-9a-z\-\ ]/i, '').gsub(/\ +/, "-")
  end

  BREAK_TAG = '<break />'

  def has_pagebreak?
    body.include? BREAK_TAG
  end

  def render_teaser
    # Render body until a break tag or the end
    teaser = body

    if has_pagebreak?
      # Slice up until the start of the break tag
      endchar = teaser.index(BREAK_TAG) - 1
      teaser  = teaser[0..endchar]
    end

    teaser.strip.html_safe
  end

  def render_full
    # Remove break tag and return full post
    body.gsub(BREAK_TAG, "").html_safe
  end

end
