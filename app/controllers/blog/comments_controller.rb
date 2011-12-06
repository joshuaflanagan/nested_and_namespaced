class Blog::CommentsController < ApplicationController
  def index

  end

  def new
    @blog_comment = Blog::Post.find(params[:post_id]).comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog_comment }
    end
  end

  def create
    @blog_comment = Blog::Post.find(params[:post_id]).comments.build(params[:blog_comment])

    respond_to do |format|
      if @blog_comment.save
        format.html { redirect_to blog_post_path(@blog_comment.post), notice: 'Comment was successfully created.' }
        format.json { render json: @blog_comment, status: :created, location: @blog_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @blog_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @blog_comment = Blog::Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog_comment }
    end
  end
end
