module PostsHelper

  def post_link(post, options={})
    link_to post.title, post_path(post.url_alias), options
  end

  # Transform each element of the tag array into a link
  def render_tags(tags, options={})
    commas = options.fetch(:commas, false)

    if tags.blank? && commas
      "-"
    else
      sep = commas ? ", " : ""
      raw tags.map { |t| link_to(t.name, tag_path(t.name), class: "tag") }.join(sep)
    end
  end

end
