class AddImporterToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :for, :string, default: "", index: true
  end
end
