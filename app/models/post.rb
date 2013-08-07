class Post < ActiveRecord::Base
  belongs_to :category
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true
  validates :email, presence: true

  def self.generate_url
    8.times.map { (rand(0..25) + 97).chr }.join
  end

  def assign_url(key)
    self.access_url = key
  end
  
  def self.create_post(params)
    new_post = Post.new(title: params[:title], price: params[:price], email: params[:email], description: params[:description],
                category_id: params[:category_id])
    key = Post.generate_url
    new_post.assign_url(key)
    new_post.save
  end

  def self.find_posts(id)
    Post.where(category_id: id)
  end
end
