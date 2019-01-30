class AddPhoneToProfessors < ActiveRecord::Migration[5.2]
  def change
    add_column :professors, :phone, :string
  end
end
