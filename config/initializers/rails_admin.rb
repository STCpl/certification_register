RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'Incident', 'PaperTrail::Version' # PaperTrail >= 3.0.0

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
    history_index
    history_show
  end

  config.model 'Incident' do
    weight -10
    navigation_label 'Incidents related'
    
    list do
      field :date
      field :name
      field :summary
      field :job
    end

    edit do
      group :job_location do        
        field :job
      end
      group :incident_details do
        field :person
        field :date
        field :site_location do label "Where abouts on site did this occur?" end
        field :summary do label "A statement of what happend" end
        field :injury
        field :outcome
      end

      group :attachments do
        field :attachment_1
        field :attachment_2
        field :attachment_3
        field :attachment_4
        field :attachment_5
      end
    end

    show do
      field :person
      field :date
      field :job
      field :site_location
      field :summary
      field :injury
      field :outcome

     group :attachments do
        field :attachment_1
        field :attachment_2
        field :attachment_3
        field :attachment_4
        field :attachment_5
      end
    end
  end


  config.model 'Injury' do
    navigation_label 'Incidents related'
    label "Injury Types"
    weight +1
    list do
      field :name
    end

    edit do
      group :default do
        label "Types of injuries"
        help "Not quite sure what should go here - jb"
        field :name do
          label "Injury name"          
        end
      end
    end
  end

  config.model 'Outcome' do
    navigation_label 'Incidents related'
    label "Outcome Types"
    weight +1
    
    list do
      field :name
      field :description
    end

    edit do
      group :default do
        field :name do
          label "Abbreviation"
        end
        field :decription do
          label "Long name for what it is"
        end
      end
    end
  end


  config.model 'Job' do
    weight +10
    list do
      field :name
      field :state      
    end

  end


  config.model 'State' do
    weight +10
    list do
      field :name
    end

    edit do
      group :default do
        field :name do
          label "State name"
        end
      end
    end
  end

  config.model 'Person' do
    list do
      field :name      
    end
 
    edit do
      group :default do
        label "Team information"
        help "Please fill all information related to your team..."
        field :name do label "Name of person" end
        field :job_title
        field :company
        field :email
        field :phone_number
        field :mobile_number
        field :state
      end
    end
  end


end
