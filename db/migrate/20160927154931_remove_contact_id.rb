class RemoveContactId < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :contact_id, :integer
  end
end
