class GuidesController < ApplicationController
    
   
  def new
    @page_title = "Add New guide"
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)
 
      if @category.save
       
       flash[:notice] = "Guide successfully created" 
      
      redirect_to guides_path 
      
    else
       flash[:alert] = "Guide unsuccesfully created" 
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


private
  def guide_params
    params.require(:guide).permit(:name, :user_id, :avatar,:bio, :organisation_id)
  end
    
    
    
    
end
