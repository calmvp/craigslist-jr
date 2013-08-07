get "/" do
  @categories = Category.order("name ASC")
  @title = "Welcome to CageList"
  erb :"/index"
end

get "/posts/create" do
  @title = "Create Post"
  @post = Post.new
  erb :"posts/create"
end

post "/posts" do
  @post = Post.create_post(params[:post])
  redirect "/categories/#{params[:post][:category_id]}"
  if @post.save
    redirect "posts/#{@post.id}", :notice => 'Congrats! Excellent new post.'
  else
    redirect "posts/create", :error => 'Something went wrong. Try again.'
  end
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  @title = @post.title
  @email = @post.email
  @description = @post.description
  @price = @post.price
  erb :"posts/view"
end

get "/categories/:id" do
  @posts = Post.find_posts(params[:id])
  erb :"category"
end

helpers do
  def title
    if @title
      "#{@title}"
    else
      "Welcome."
    end
  end
end

