class AddWebsiteaddressToActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :website_address, :string
  end
end
