class Blog::PostsController < ApplicationController
  # GET /blog/posts
  # GET /blog/posts.json
  def index
    @blog_posts = Blog::Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blog_posts }
    end
  end

  # GET /blog/posts/1
  # GET /blog/posts/1.json
  def show
    @blog_post = Blog::Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog_post }
    end
  end

  # GET /blog/posts/new
  # GET /blog/posts/new.json
  def new
    @blog_post = Blog::Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog_post }
    end
  end

  # GET /blog/posts/1/edit
  def edit
    @blog_post = Blog::Post.find(params[:id])
  end

  # POST /blog/posts
  # POST /blog/posts.json
  def create
    @blog_post = Blog::Post.new(params[:blog_post])

    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to @blog_post, notice: 'Post was successfully created.' }
        format.json { render json: @blog_post, status: :created, location: @blog_post }
      else
        format.html { render action: "new" }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blog/posts/1
  # PUT /blog/posts/1.json
  def update
    @blog_post = Blog::Post.find(params[:id])

    respond_to do |format|
      if @blog_post.update_attributes(params[:blog_post])
        format.html { redirect_to @blog_post, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog/posts/1
  # DELETE /blog/posts/1.json
  def destroy
    @blog_post = Blog::Post.find(params[:id])
    @blog_post.destroy

    respond_to do |format|
      format.html { redirect_to blog_posts_url }
      format.json { head :ok }
    end
  end
end
