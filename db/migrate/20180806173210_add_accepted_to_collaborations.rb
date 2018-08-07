class AddAcceptedToCollaborations < ActiveRecord::Migration[5.2]
  def change
    add_column :collaborations, :accepted, :boolean
  end
end
