module ApplicationHelper
	#This helper will look for a user.image like the one from facebook and if there is no image it will return the one from the gravatar account
	def gravatar_url(user)
		gravatar_id = Digest::MD5::hexdigest(user.email).downcase
		if user.image
			user.image
		else 
		"https://www.gravatar.com/avatar/#{gravatar_id}.jpg?s=150"
	end 
	end
end
