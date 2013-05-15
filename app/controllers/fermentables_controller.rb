class FermentablesController < ApplicationController

  def index
    @search       = current_user.fermentables.search(params[:q])
    @fermentables = @search.result(:distinct => true)
  end

  def new
    @fermentable = current_user.fermentables.build
  end

  def create
    @fermentable = current_user.fermentables.build(fermentable_params)

    if @fermentable.save
      redirect_to :action => :index,
        notice: "Fermentable was successfully created."
    else
      render action: "new"
    end
  end

  def edit
    @fermentable = current_user.fermentables.find(params[:id])
  end

  def update
    @fermentable = current_user.fermentables.find(params[:id])

    if @fermentable.update_attributes(fermentable_params)
      redirect_to :action => :index,
        notice: "Fermentable was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @fermentable = current_user.fermentables.find(params[:id])
    @fermentable.destroy
    redirect_to fermentables_path
  end

  private

  def fermentable_params
    params.require(:fermentable).permit(
      :name, :origin, :supplier, :description, :max_in_batch,
      :potential, :yield, :coarse_fine_difference, :moisture,
      :diastatic_power, :protein, :ibu, :color, :recommended_mash,
      :add_after_boil, :notes
    )
  end

end
