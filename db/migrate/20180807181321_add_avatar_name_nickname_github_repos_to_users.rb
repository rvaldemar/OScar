class AddAvatarNameNicknameGithubReposToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :text
    add_column :users, :nickname, :text
    add_column :users, :github, :text
    add_column :users, :repos_url, :text
  end
end
