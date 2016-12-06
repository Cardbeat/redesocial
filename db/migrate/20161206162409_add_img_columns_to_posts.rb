class AddImgColumnsToPosts < ActiveRecord::Migration[5.0]
  def up
		add_attachment :posts, :img
  end

	def down
		remove_attachment :posts, :img
	end
end
