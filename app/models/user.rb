class User < ApplicationRecord
	attr_accessor :remember_token, :activation_token, :reset_token
	before_save :downcase_email
	before_create :create_activation_digest
	mount_uploader :picture, PictureUploader
	validates :name, presence: true, length: { minimum:3, maximum: 25 }
	# validates :mobile, presence: true, length: { minimum: 10, maximum: 13 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	VALID_PASSWORD_REGEX = /\A([^\W]|[-])*\z/

	validates :email, presence: true, length: {maximum: 255 }, format: { with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false }

	before_save { self.email = self.email.downcase }

	has_secure_password
	validates :password, presence: true, length: {minimum: 8, maximum: 20 }, format: { with: VALID_PASSWORD_REGEX}, allow_nil: true

	# Returns the hash digest of the given string.
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
							 BCrypt::Engine.cost
		BCrypt::Password.create(string,cost: cost)
	end

	# @return a random token
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	# Activates an account.
	def activate
		update_attribute(:activated,true)
		update_attribute(:activated_at, Time.zone.now)
	end

	def send_activation_email
		UserMailer.account_activation(self).deliver_now
	end

	def create_reset_digest
		self.reset_token= User.new_token
		update_columns(reset_digest: User.digest(reset_token),reset_sent_at: Time.zone.now)
	end

	def send_password_reset_email
		UserMailer.password_reset(self).deliver_now
	end

	def created_date
		return created_at.localtime.strftime '%Y-%m-%d %H:%M:%S'
	end

	# Remembers a user in the database for use in persistent sessions.
	def remember
		self.remember_token = User.new_token
				update_attribute(:remember_digest, User.digest(remember_token))
	end

	def recent_posts
		posts = NewsPost.all
		own_posts = Array.new
		posts.each do |post|
			if post.author_id == id
				own_posts.push post
			end
		end
		own_posts = own_posts.sort_by(&:created_at).reverse
		return own_posts
	end

	def avatar
		if self.picture.length > 0
			return self.picture.url
		else
			return "avatar.png"
		end
	end

	# Forgets a user.
	def forget
		update_attribute(:remember_digest,nil)
	end

	# Returns true if the given token matches the digest.
	def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	end

	# Returns true if a password reset has expired.
	def password_reset_expired?
		reset_sent_at<2.hours.ago
	end

	private

	def downcase_email
		self.email = email.downcase
	end

	def create_activation_digest
		self.activation_token = User.new_token
		self.activation_digest = User.digest(activation_token)
	end

end
