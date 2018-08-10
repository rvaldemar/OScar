class Users::ReposController < ApplicationController
  def my_repos_index
    @repos = Repo.where(user_id: current_user.id)
    @repo = Repo.new


    url = current_user.repos_url
    repos_serialized = open(url).read
    repos = JSON.parse(repos_serialized)

    @new_repos = repos.map do |repo|
      repository = Repo.new()
      repository.name = repo['name']
      repository.description = repo['description']
      repository
    end


  end




  def my_collaborations_index
    @collabs = current_user.collaborations
    @collab_repos = @collabs.map(&:repo)
  end

  def create

  end

  def update
  end

  def destroy
  end
end
