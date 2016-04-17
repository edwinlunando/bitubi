ActiveAdmin.register Promotion do

  # actions :all, except: [:destroy]

  permit_params :action_type, :promotion_type, :code, :global_usage_limit, :usage, :active, :amount

  index do
    selectable_column
    id_column
    column :action_type
    column :promotion_type
    column :code
    column :global_usage_limit
    column :usage
    column :amount
    column :active
    actions
  end

  filter :code

  form do |f|
    f.inputs 'Promotion' do
      f.input :action_type, as: :select, collection: Promotion.action_types.keys.to_a
      f.input :promotion_type, as: :select, collection: Promotion.promotion_types.keys.to_a
      f.input :code
      f.input :global_usage_limit
      f.input :usage
      f.input :amount
      f.input :active
    end
    f.actions
  end

end
