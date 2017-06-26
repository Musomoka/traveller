class PlacesController < ApplicationController
  before_action :set_place, only:[:show, :edit, :update, :destroy]
 
  
  
  def new
   @place = Place.new
   @address = @place.address.build
     
  end

  def create
    @place = Place.new(place_params)
      if @place.save
       
       flash[:notice] = "Attraction successfully created" 
      
      redirect_to places_path 
      
      else
         flash[:alert] = "Attraction unsuccesfully created" 
        render 'new'
      end
  
  end
  
  def edit
  end

  
  def update
    if @place.update(place_params)
     
    flash[:notice] = "Attraction succesfully updated" 
      
      redirect_to @place 
      
      else
         flash[:alert] = "Attraction unsuccesfully updated" 
        
        render :edit
        
      end

  end

 
    

  def destroy
    @place.destroy
     
      redirect_to places_url, notice: 'Tour was successfully destroyed.' 
  end
  
  def index
    @places = Place.all
    
  end

  def show
   
  end
  
 def address
  @address
 end
 #def photos
  #   @photos = Place.find(params[:id]).photos
 # end

private

  def place_params
        params.require(:place).permit(:name, :gprs,:description,:url,:type, photos_attributes: [:name,:image,:place_id],comments: [:content, :commentable_id, :commentable_type], addresses_attributes: [:place_id,:phy_address1,:phy_address2, :phy_address3, :region, :city, :country] )
  end
  
   # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
     
    end
  
end
