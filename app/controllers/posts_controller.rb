class PostsController < ApplicationController
	def index
		@post = current_user.posts.build
		@posts_feed = current_user.feed
		@posts_deef += current_user.inverse_feed
	end

	def show
		@post = Post.find(params[:id])
		@post_build = current_user.build_post(post_params)
	end

	def create
		@post = current_user.build_post(post_params)

		if @post.save
			redirect_to root_url
		end

	end

	private

	def post_params
		params.require(:post).permit(:body)
	end

	def load_po

end

