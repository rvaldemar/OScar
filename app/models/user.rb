require 'json'
require 'open-uri'

class User < ApplicationRecord
  has_many :collaborations
  has_many :repos, through: :collaborations
  after_create :create_user_repos

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
    user.github = auth.info.urls.GitHub
    user.repos_url = auth[:extra].raw_info.repos_url
  end
end

# def create_user_repos
#     url = u.repos_url
#     repos_serialized = open(url).read
#     repos = JSON.parse(repos_serialized)

#     repos.each do |repo|
#       repository = Repo.new()
#       repository.name = repo['name']
#       repository.description = repo['description']
#       repository.user_id = u.id
#       repository.save
#     end
>>>>>>> b15f8a59852e426755033a27a6c2aad896f7e987

#   end
end

