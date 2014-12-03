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
  config.audit_with :paper_trail, 'Certification', 'PaperTrail::Version' # PaperTrail >= 3.0.0

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

 config.navigation_static_links = {
    'Expires in 30 days report' => '/expires_in_one_month'
  }

  config.model 'Certification' do
    weight -10
    navigation_label 'Certifications related'
    
    list do
      scopes [:active?, :non_active?, :expires_within_30days, :expires_within_60days, :everything]

      field :name
      field :attain_date
      field :expiry_date
      field :state
    end

    edit do
      field :person
      field :active
      
      field :classification do
        help 'type of certification'
      end
      field :number do
        help 'example: Drivers license number'
      end
      field :attain_date
      field :expiry_date

      field :notes
      

      group :attachments do
        field :attachment_1
        field :attachment_2
        field :attachment_3
        field :attachment_4
      end      
    end

    show do
      field :person
      field :description
      field :notes
      
      field :active
      field :classification
      field :active
      field :number
      field :attain_date
      field :expiry_date

      group :attachments do
        field :attachment_1
        field :attachment_2
        field :attachment_3
        field :attachment_4
      end  
    end
  end


  config.model 'Classification' do    
    navigation_label 'Certifications related'
    label "Cert Classifcations"
    list do
      field :name
      field :type
     end

    edit do
      field :type
      field :code
      field :notes
    end

    show do
      field :type
      field :code      
      field :notes
      field :certifications
    end
  end


  config.model 'Person' do
    

    list do
      scopes [:active?, :non_active?]
      field :name
      field :state
      field :company      
    end

    show do 
      group :default do        
        field :name do label "Name of person" end

        field :certifications
        field :job_title
        field :company
        field :email
        field :phone_number
        field :mobile_number
        field :state
      end    
    end
 
    edit do
      group :default do        
        field :first_name
        field :last_name        
        field :active
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
