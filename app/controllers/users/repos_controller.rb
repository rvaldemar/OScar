class Users::ReposController < ApplicationController
  def my_repos_index
    @repos = current_user.repos
  end

  def my_collaborations_index
  end
end
