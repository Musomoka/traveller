class OrganisationsController < ApplicationController
  def new
    @page_title = "Add New Place"
    @organisation = Organisation.new
  end

  def create
      @organisation = Organisation.new(organisation_params)
    
   
     if @organisation.save
       
       flash[:notice] = "Tourism Organisation successfully created" 
      
      redirect_to categories_path 
      
    else
       flash[:alert] = "Tourism Orgisation unsuccesfully created" 
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end



    def organisation_params
          params.require(:organisation).permit(:name)
    end
    

    
end
