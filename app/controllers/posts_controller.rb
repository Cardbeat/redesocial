class PostsController < ApplicationController
	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Post criado com sucesso!"
			redirect_to profile_path(current_user)
		end
	end

	def destroy
	end

	private

	def post_params
		params.require(:post).permit(:body)
	end

end
