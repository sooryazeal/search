class ServicesController < ApplicationController
  
  def autocomplete
    excluded_service = params[:selection].blank? ? [] : params[:selection]
    @entries = Service.autocomplete(params[:term], {:page => params[:page], :page_limit => params[:page_limit], :excluded_city => excluded_service})
    entries_array = @entries.collect {|entry| {"id" => entry.id, "text" => entry.name}}
    render :inline => entries_array.to_json
  end
end