class PostsController < ApplicationController
	def show
		@posts = Post.find(parms[:id])
	end
	def index
		@post = Post.all.order(‘creater_at DESC’)
	end
	
	def new
	end
	def create
	@post = Post.new(post_params)
	@post.save

		redirect_to @post
	end

private
		def post_params
			params.require(:post).permit(:title, :body)
		end
end
