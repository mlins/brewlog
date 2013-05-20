class YeastsController < ApplicationController

  def index
    @search = current_user.yeasts.search(params[:q])
    @yeasts   = @search.result(:distinct => true)
  end

  def new
    @yeast = current_user.yeasts.build
  end

  def create
    @yeast = current_user.yeasts.build(yeast_params)

    if @yeast.save
      flash[:notice] = "#{@yeast.name} was successfully created."
      redirect_to :action => :index
    else
      render action: "new"
    end
  end

  def edit
    @yeast = current_user.yeasts.find(params[:id])
  end

  def update
    @yeast = current_user.yeasts.find(params[:id])

    if @yeasts.update_attributes(yeast_params)
      flash[:notice] = "#{@yeast.name} was successfully updated."
      redirect_to :action => :index
    else
      render action: "edit"
    end
  end

  def destroy
    @yeast = current_user.yeasts.find(params[:id])
    flash[:notice] = "#{@yeast.name} was deleted."
    @yeast.destroy
    redirect_to yeasts_path
  end

  private

  def yeast_params
    params.require(:yeast).permit(
      :name, :laboratory, :description, :form, :product_id,
      :min_temperature, :max_temperature, :min_attenuation,
      :max_attenuation, :flocculation, :notes
    )
  end
end
