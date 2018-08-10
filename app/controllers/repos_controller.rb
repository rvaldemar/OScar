class ReposController < ApplicationController
  def index
    @search_results = false
    if params[:query].present?
      @search_results = true
      @collaborations = Collaboration.global_search(params[:query])
    else
      @repos = Repo.all
    end
  end

  def show
    @repo = Repo.find(params[:id])
    collabs = @repo.collaborations
    @users = collabs.map(&:user)
  end

  def create
  end

  def update
  end

  def destroy
  end
end
