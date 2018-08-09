class ReposController < ApplicationController
  def index
    @repos = Repo.all
  end

  def show
    @repo = Repo.find(params[:id])
    collabs = @repo.collaborations
    @users = collabs.map(&:user)
  end
end
