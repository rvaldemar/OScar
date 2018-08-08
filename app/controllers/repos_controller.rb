class ReposController < ApplicationController
  def index
  end

  def show
    @repo = Repo.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end
end
