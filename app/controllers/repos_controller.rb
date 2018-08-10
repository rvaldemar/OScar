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

    # Temporary variable that saves all accepted collaborations
    collabs = @repo.collaborations.where(accepted: true)

    # Temporary variable that saves all collaborations (accepted or pending)
    all_collabs = @repo.collaborations

    # Variable that saves all the users that have a collaboration request: approved or not
    @all_users = all_collabs.map(&:user)

    # Variable that saves only the users whose collaboration request has been approved
    @users = collabs.map(&:user)
  end
end
