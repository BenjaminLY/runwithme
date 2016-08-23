class AddDetailsToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :name_of_contact, :string
    add_column :companies, :phone_number, :string
    add_column :companies, :email, :string
  end
end
