class GallariesController < ApplicationController
  before_action :set_place 
  before_action :set_gallary, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]  
  def new

    @gallary = @place.gallaries.build(gallary_params)
    
    if @gallary.save
      flash[:notice] = "Image succesfully saved" 
   
    
      
      else
      flash[:alert] = "Image Not saved" 
      render :new
    end
      
     
  end

  def create
     
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  
    
    @gallary = @place.gallaries.all
  end 
  
  def show
  end


  private
  
  def gallary_params
        params.require(:gallary).permit(:name,:link,:main_image,:image,:place_id )
  end
  
   # Use callbacks to share common setup or constraints between actions.
    def set_gallary
      @gallary = Gallary.find(params[:id])
    end
    
    
def set_place
      @place = Place.find(params[:place_id])
    end

end
