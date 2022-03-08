ActiveAdmin.register Blog do
  permit_params :title, :body, :user_id

  index do
    selectable_column
    id_column
    column :title
    column :body
    column :user
    actions
  end
  show do |f|
    h3 "Body"
    div do
     f.body
   end
   h5 "User email- " + f.user.email
 end
 
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :body, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
