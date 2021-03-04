class User < ApplicationRecord

    validates :name, presence: true, length: {minimum:1, maximum:30}
    validates :last_name, presence: true, length: {minimum:1, maximum:30}
    VALID_EMAIL_REGEX = /[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+/.freeze
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

    validates :password, presence: :true, length: {minimum:6}
    has_secure_password
    
    validates :username, presence: true, length: {minimum:1, maximum:15}
    validates_inclusion_of :gender, in: %w[Male Female], allow_nil: true
    validates :bio, length: {maximum:255}

    before_create :add_token

    has_many :posts

    # Will return an array of follows for the given user instance
  has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"

  # Will return an array of users who follow the user instance
  has_many :followers, through: :received_follows, source: :follower

   # returns an array of follows a user gave to someone else
   has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
  
   # returns an array of other users who the user has followed
   has_many :followings, through: :given_follows, source: :followed_user

  def create_token
    random_token = SecureRandom.urlsafe_base64
    Digest::SHA1.hexdigest(random_token.to_s)
  end

  def add_token
    self.token = create_token
  end

  def change_token
    update_attribute(:token, create_token)    
  end

end
