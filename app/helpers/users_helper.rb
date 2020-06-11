module UsersHelper

	# Returns the Gravatar for the given user.
	def gravatar_for(user,size: 80)
		gravatar_id=Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url="avatar" +  gravatar_id%10.clamp(1,9)
		link_to image_tag("avatar.png",alt: user.name, class: "gravatar"), user
	end


	def comments_of_user(user)
		comments = Comment.all
		userComments = Array.new

		comments.each do |comment|
			if comment.user_id == user.id
				userComments.push(comment)
			end
		end

		return userComments.sort_by(&:created_at).reverse
	end

	def card_of_user(user)
		cards = Card.all

		cards.each do |card|
			if card.user_id == user.id
				return card
			end
		end
	end


end
