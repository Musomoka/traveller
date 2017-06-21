class ToursController < ApplicationController
    
    before_action :set_tour, only: [:show, :edit, :update, :destroy]
  
    before_action :authenticate_user!, except: [:index,:show]
    
    # GET /tours
    # GET /tours.json
    def index
      @tours = Tour.all
      @category = Category.new
      @place = Place.new
      
    end
  
    # GET /tours/1
    # GET /tours/1.json
    def show
  
   
    @itineraries = @tour.itinerary
    
    end
  
    # GET /tours/new
    def new
      @tour = current_user.tours.build
      
      
    end
  
    # GET /tours/1/edit
    def edit
      session['tour_edit_referrer'] = request.env["HTTP_REFERER"]
    end
  
    # POST /tours
    # POST /tours.json
    def create
      @tour = current_user.tours.build(tour_params)
      session['tour_edit_referrer'] = request.env['HTTP_REFERER']
        if @tour.save
          redirect_to @tour, notice: 'Tour was successfully created.' 
          
        else
         render :new 
        
        end
        
    end
  
  
    # PATCH/PUT /tours/1
    # PATCH/PUT /tours/1.json
    def update
     
        if @tour.update(tour_params)
         redirect_to @tour, notice: 'Tour was successfully updated.' 
         
        else
          render :edit 
        end
    end
  
    # DELETE /tours/1
    # DELETE /tours/1.json
    def destroy
      @tour.destroy
     
      redirect_to tours_url, notice: 'Tour was successfully destroyed.' 
    end
  
    private
    
      # Use callbacks to share common setup or constraints between actions.
      def set_tour
        @tour = Tour.find(params[:id])
      end
      
     
 
      # Never trust parameters from the scary internet, only allow the white list through.
      def tour_params
        params.require(:tour).permit(:tour_name, :description, :place_attributes => [:name, :gprs], :itinerary_attributes =>[:place_id, :tour_id])
      end
end
