class LawyersController < ApplicationController
  
  def index
  	@location = params[:city].to_s.strip.split(",")
  	@service = params[:service].to_s.strip.split(",")
  	@lawyers = Lawyer.search(@location, @service).paginate(:page => params[:page], :per_page => 10)
  end

  def autocomplete_location
    @entries = Lawyer.autocomplete_results(params[:term])
    entries_array = @entries.collect {|entry| {"id" => entry, "text" => entry}}
    render :inline => entries_array.to_json
  end
end