module ApplicationHelper
		def toggle_like_button(picture, user)
		if user.flagged?(picture, :like)
			link_to "Unlike", like_picture_path(picture)

		else
			link_to "Like", like_picture_path(picture) 

		end
	end
end
