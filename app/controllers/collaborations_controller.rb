class CollaborationsController < ApplicationController
  def create

  end

  def update

  end

  def destroy
    collaboration = Collaboration.find_by(repo_id: params[:repo_id], user_id: current_user.id)
    collaboration.destroy

    redirect_to repo_path(params[:repo_id])
  end
end
