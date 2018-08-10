class Users::ReposController < ApplicationController
  def my_repos_index
    @repos = Repo.where(user_id: current_user.id)

    if @repos.empty?
      my_first_repo
      render 'my_first_repo'
    else
      render 'users/repos/my_repos_index'
    end
  end

  def my_first_repo
    @repo = Repo.new

    url = current_user.repos_url
    repos_serialized = open(url + "?client_id=#{ENV['GITHUB_KEY']}&client_secret=#{ENV['GITHUB_SECRET']}").read
    repos = JSON.parse(repos_serialized)

    @new_repos = repos.map do |repo|
      repository = Repo.new()
      repository.name = repo['name']
      repository.description = repo['description']
      repository
    end
  end


  def my_collaborations_index
    @collabs = current_user.collaborations
    @collab_repos = @collabs.map(&:repo)
  end

  def create
    repo_args(first_repos_index).each do |args|
      repo = Repo.new(args)
      repo.user = current_user
      repo.save
    end
    redirect_to my_repos_path(current_user)
  end

  def update
  end

  def destroy
  end

  private

  def first_repos_index
    params.keys.grep(/checkbox_/).map { |x| x[/_.+/][1..-1]  }
  end

  def repo_args(index_list)
    index_list.map do |index|
      {
        name: params["name_#{index}"],
        description: params["description_#{index}"]
      }
    end
  end
end
