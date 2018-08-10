class CollaborationsController < ApplicationController
  def create
    # @collaboration = Collaboration.new(user_id: current_user.id, repo_id: params[:repo_id], accepted: false)
    collaboration = Collaboration.new(collaboration_params)
    collaboration.user_id = current_user.id
    collaboration.accepted = false

    if collaboration.save
      redirect_to repo_path(params[:repo_id])
    else
      raise
    end
  end

  def update

  end

  def destroy
    collaboration = Collaboration.find_by(repo_id: params[:repo_id], user_id: current_user.id)
    collaboration.destroy

    redirect_to repo_path(params[:repo_id])
  end

  private

  def collaboration_params
    params.permit(:repo_id)
  end
end
