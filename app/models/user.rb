class User < ActiveRecord::Base
  acts_as_token_authenticatable
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
          
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
    end
  end

  def as_json(options={})
    {
      id: self.id,
      email: self.email
      #auth_token: self.auth_token
    }
  end
  has_many :exercises
  has_many :blogs
end
