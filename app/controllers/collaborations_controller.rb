require 'rest-client'

class CollaborationsController < ApplicationController
  def create
    collaboration = Collaboration.new(collaboration_params)
    collaboration.user_id = current_user.id
    collaboration.accepted = false

    if collaboration.save
      redirect_to repo_path(params[:repo_id])
    else
      redirect_to repo_path(params[:repo_id]), alert: "Failed to create collaboration."
    end
  end

  def update
    collaboration = Collaboration.find_by(collaboration_params)

    if collaboration
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
        redirect_to repo_path(params[:repo_id]), alert: "Failed to confirm collaboration."
      end
    else
      redirect_to repo_path(params[:repo_id]), alert: "Collaboration not found."
    end
  end

  def destroy
    if params[:user_id]
      collaboration = Collaboration.find_by(collaboration_params)
    else
      collaboration = Collaboration.find_by(repo_id: params[:repo_id], user_id: current_user.id)
    end

    collaboration.destroy if collaboration

    redirect_to repo_path(params[:repo_id])
  end

  private

  def collaboration_params
    params.permit(:repo_id, :user_id)
  end
end
