ActiveAdmin.register Link do

  index do 
    id_column
    
    column :category
    column :name
    column :url
    column :created_at
    default_actions
    
  end
  
end
