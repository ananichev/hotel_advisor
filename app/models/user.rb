class User < ActiveRecord::Base
	
  before_save { email.downcase! }
  before_create :create_remember_token

  has_many  :hotels
  has_many  :comments
  
  validates :name,     presence: true, length: { maximum: 50 }
  validates :email,    presence: true
  validates :password, length: { minimum: 8 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
  has_secure_password

  mount_uploader :avatar, ImageUploader
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
  
end
