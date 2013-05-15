class HopsController < ApplicationController

  def index
    @search = current_user.hops.search(params[:q])
    @hops   = @search.result(:distinct => true)
  end

  def new
    @hop = current_user.hops.build
  end

  def create
    @hop = current_user.hops.build(hop_params)

    if @hop.save
      flash[:notice] = "#{@hop.name} was successfully created."
      redirect_to :action => :index
    else
      render action: "new"
    end
  end

  def edit
    @hop = current_user.hops.find(params[:id])
  end

  def update
    @hop = current_user.hops.find(params[:id])

    if @hop.update_attributes(hop_params)
      flash[:notice] = "#{@hop.name} was successfully updated."
      redirect_to :action => :index
    else
      render action: "edit"
    end
  end

  def destroy
    @hop = current_user.hops.find(params[:id])
    flash[:notice] = "#{@hop.name} was deleted."
    @hop.destroy
    redirect_to hops_path
  end

  private

  def hop_params
    params.require(:hop).permit(
      :name, :origin, :alpha, :beta, :description,
      :form, :hsi, :humulone, :cohumulone, :adhumulone,
      :lupulone, :colupulone, :adlupulone,
      :humulene, :myrcene, :caryophyllene, :farnese,
      :notes
    )
  end

end
