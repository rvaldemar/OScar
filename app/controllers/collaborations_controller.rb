class CollaborationsController < ApplicationController
  def create
    collaboration = Collaboration.new(collaboration_params)
    collaboration.user_id = current_user.id
    collaboration.accepted = false

    if collaboration.save
      redirect_to repo_path(params[:repo_id])
    else
      render repo_path(params[:repo_id])
    end
  end

  def update
    collaboration = Collaboration.find_by(collaboration_params)
    collaboration.accepted = true

    if collaboration.save
      redirect_to repo_path(params[:repo_id])
    else
      render repo_path(params[:repo_id])
    end

  end

  def destroy
    collaboration = Collaboration.find_by(collaboration_params) if params[:user_id]
    collaboration = Collaboration.find_by(repo_id: params[:repo_id], user_id: current_user.id) unless params[:user_id]

    collaboration.destroy

    redirect_to repo_path(params[:repo_id])
  end

  private

  def collaboration_params
    params.permit(:repo_id, :user_id)
  end
end
