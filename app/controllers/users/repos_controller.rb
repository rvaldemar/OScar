class Users::ReposController < ApplicationController
  def my_repos_index
    @repos = Repo.where(user_id: current_user.id)
  end

  def my_collaborations_index
  end
end
