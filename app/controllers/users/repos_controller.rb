class Users::ReposController < ApplicationController
  def my_repos_index
    @repos = Repo.where(user_id: current_user.id)
  end

  def my_collaborations_index
    @collabs = current_user.collaborations
    @collab_repos = @collabs.map(&:repo)
  end
end
