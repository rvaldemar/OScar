class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.token = auth.credentials.token
    user.avatar = auth.info.image
    user.name = auth.info.name
    user.nickname = auth.info.nickname
    user.github = auth.info.GitHub
    user.repos_url = auth.info.repos_url
  end
end

end
