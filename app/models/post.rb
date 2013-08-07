class Post < ActiveRecord::Base
  belongs_to :category
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true
  validates :email, presence: true

  def self.create_post(params)
    Post.create(title: params[:title], price: params[:price], email: params[:email], description: params[:description],
                category_id: params[:category_id])
  end

  def self.find_posts(id)
    Post.where(category_id: id)
  end
end
