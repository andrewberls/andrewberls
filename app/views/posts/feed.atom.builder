atom_feed :language => 'en-US' do |feed|
  feed.title @title

  @posts.each do |post|

    feed.entry( post ) do |entry|
      entry.url post_url(post)
      entry.title post.title
      entry.content post.body, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(post.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))

    end
  end
end
