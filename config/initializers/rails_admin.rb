RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)


  config.authenticate_with do
    warden.authenticate! scope: :user

    redirect_to main_app.root_path unless warden.user.is_admin?

 
  end



  config.model 'Job' do
    edit do
      field :title
      field :description
      field :apply_instruction
      field :category_id
      field :location
      field :created_on
      field :company_name
      field :url
      field :email
      field :lower_bound
      field :higher_bound
      field :token
      field :is_published
      field :ip
    end
  end

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
