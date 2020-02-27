class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @toilets = Toilet.geocoded

    @markers = @toilets.map do |toilet|
      {
        lat: toilet.latitude,
        lng: toilet.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { toilet: toilet }),
      }
    end
    # @ip_location = ""
    # binding.pry
    # if request.env['ipinfo'].respond_to?(:loc)
    #   @ip_location = request.env['ipinfo'].loc
    # end

   end
end
