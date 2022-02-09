class PostIndex
  include SearchFlip::Index

  def self.index_name
    "posts"
  end

  def self.model
    Post
  end

  def self.serialize(post)
    {
      id: post.id,
      title: post.title,
      body: post.body,
      author: post.author
    }
  end
end
