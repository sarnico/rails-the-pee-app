class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @toilets = Toilet.geocoded

    if request.location.city
      @toilets = Toilet.near(request.location.city, 10)
    end

    @markers = @toilets.map do |toilet|
      {
        lat: toilet.latitude,
        lng: toilet.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { toilet: toilet }),
      }
    end
   end


  def near_toilets
    @toilets = Toilet.near(params[:location_query], 10)
    json = @toilets.map{|toilet|
      {
        attributes: toilet.attributes,
        partial: render_to_string(partial: 'shared/toilet_card', locals: { t: toilet })
      }
    }
    render(json: json, status: 200)
  end
    # @ip_location = ""
    # binding.pry
    # if request.env['ipinfo'].respond_to?(:loc)
    #   @ip_location = request.env['ipinfo'].loc
    # end

end
