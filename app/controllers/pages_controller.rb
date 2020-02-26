class PagesController < ApplicationController
  def home
    @toilets = Toilet.geocoded

    @markers = @toilets.map do |toilet|
      {
        lat: toilet.latitude,
        lng: toilet.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { toilet: toilet }),
      }
    end
  end
end
