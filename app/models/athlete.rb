class Athlete < ActiveRecord::Base
  acts_as_token_authenticatable
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
          
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |athlete|
      athlete.provider = auth.provider
      athlete.uid = auth.uid
      athlete.email = auth.info.email
      athlete.password = Devise.friendly_token[0,20]
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
