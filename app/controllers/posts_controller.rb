class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :authorized_user, only: [:edit, :update, :destroy]

  # GET /links
  # GET /links.json
  skip_before_action :verify_authenticity_token, only: :upload #不验证token

  def upload
    @imgFile = params[:imgFile] #取文件
    unless @imgFile.nil?
      begin
        uploader = ImageUploader.new
        uploader.store!(@imgFile)
        file_url = uploader.url 
        if ENV['RAILS_RELATIVE_URL_ROOT']
          file_url = ENV['RAILS_RELATIVE_URL_ROOT'] + file_url
        end
        render(plain: file_url) and return #上传七牛成功后返回图片地址
      rescue CarrierWave::UploadError => e
        show_error(e.message) and return
      rescue Exception => e
        show_error(e.to_s) and return
      end
    else
      show_error("No File Selected!") and return
    end
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @post = current_user.posts.build
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_from current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def authorized_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_path, notice: "Not authorized to edit this post" if @post.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
    def show_error(msg)
      render plain: "error|#{msg}" #失败后返回'error|XXXXX'格式的内容
    end
end
