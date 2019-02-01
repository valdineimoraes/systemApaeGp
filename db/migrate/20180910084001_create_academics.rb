class CreateAcademics < ActiveRecord::Migration[5.2]
  def change
    create_table :academics do |t|
      t.string :registration
      t.date   :entry_date
      t.integer :cod_sere
      t.string :name
      t.string :image
      t.date :birth_date
      t.string :birth_certificate
      t.string :rg_student
      t.date :expedition_rg_student
      t.integer :cpf_student
      t.string :card_sus_number
      t.string :breed
      t.string :phone_student
      t.string :contact
      t.string :naturalness
      t.string :street
      t.string :neighborhood
      t.string :reference_point
      t.string :cep_student
      t.string :family_income
      t.boolean :graduated, default: false
      t.timestamps
    end
  end
end
