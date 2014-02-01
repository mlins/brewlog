class StylesController < ApplicationController

  def index
    @search = current_user.styles.search(params[:q])
    @styles = @search.result(distinct: true)
  end

  def new
    @style = current_user.styles.build
  end

  def create
    @style = current_user.styles.build(style_params)

    if @style.save
      flash[:notice] = "#{@style.name} was successfully created."
      redirect_to action: :index
    else
      render action: "new"
    end
  end

  def edit
    @style = current_user.styles.find(params[:id])
  end

  def update
    @style = current_user.styles.find(params[:id])

    if @style.update_attributes(style_params)
      flash[:notice] = "#{@style.name} was successfully updated."
      redirect_to action: :index
    else
      render action: "edit"
    end
  end

  def destroy
    @style = current_user.styles.find(params[:id])
    flash[:notice] = "#{@style.name} was deleted."
    @style.destroy
    redirect_to styles_path
  end

  private

  def style_params
    params.require(:style).permit(
      :abv_max, :abv_min, :carb_max, :carb_min, :category, 
      :category_number, :color_max, :color_min, :description, 
      :examples, :fg_max, :fg_min, :ibu_max, :ibu_min, :ingredients, 
      :name, :notes, :og_max, :og_min, :profile, :style_guide, 
      :style_letter
    )
  end
end
