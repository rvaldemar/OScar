require 'rest-client'

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
    url = "https://api.github.com/repos/#{collaboration.repo.user.nickname}/#{collaboration.repo.name}/collaborators/#{collaboration.user.nickname}"
    invitation = RestClient::Request.execute(method: 'put', url: url,
                                headers: { :Authorization => "Bearer #{collaboration.repo.user.token}"})
    parsed = JSON.parse(invitation)
    invitation_id = parsed["id"]
    RestClient::Request.execute(method: 'patch', url: "https://api.github.com/user/repository_invitations/#{invitation_id}",
                                headers: { :Authorization => "Bearer #{collaboration.user.token}" })
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
