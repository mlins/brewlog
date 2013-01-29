class HopsController < ApplicationController

  def index
    @search = Hop.search(params[:q])
    @hops   = @search.result(:distinct => true)
  end

end
