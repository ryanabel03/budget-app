ActiveAdmin.register Category do
  permit_params :name, :description, :limit
end
