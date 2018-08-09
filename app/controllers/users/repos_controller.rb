class Users::ReposController < ApplicationController
  def my_repos_index
    @repos = Repo.where(user_id: current_user.id)
    @repo = Repo.new
  end

  def my_collaborations_index
  end

  def create

  end

  def update
  end

  def destroy
  end
end
