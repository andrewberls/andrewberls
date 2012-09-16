class Post < ActiveRecord::Base

  has_and_belongs_to_many :tags
  belongs_to :user

  validates_presence_of :title, :body, :url_alias

  def tag_list
    self.tags.map(&:name).join(", ")
  end

  def extract_tags(tag_str)
    # Collect a tag list from a string delimited by spaces or commas
    spaces_or_commas = /,|\ /
    tag_str.split(spaces_or_commas).reject { |t| t.blank? }.sort.collect { |t| t.strip.downcase }
  end

  def tag_list=(tag_list)
    self.tags.clear
    tag_list = extract_tags(tag_list)

    tag_list.each do |tag|
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

  def teaser
    # Render body until a break tag or the end
    text = body

    if has_pagebreak?
      # Slice up until the start of the break tag
      endchar = text.index(BREAK_TAG) - 1
      text    = text[0..endchar]
    end

    text.strip.html_safe
  end

  def full_text
    # Remove break tag and return full post
    body.gsub(BREAK_TAG, '').html_safe
  end

end
