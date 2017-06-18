class CategoriesController < ApplicationController
  def new
    @page_title = "Add New Category"
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
     if @category.save
       
       flash[:notice] = "Category successfully created" 
      
     redirect_to (session['tour_edit_referrer'] || parent_path)
      
    else
       flash[:alert] = "Category unsuccesfully created" 
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
     @categories=Category.all
  end

  def show
   
  end
end


def category_params
      params.require(:category).permit(:name )
    end