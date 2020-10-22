class GeocodingController < ApplicationController

  def get_latlon

    @address_from_user = params.fetch("street_address")

    gmaps_key = ENV.fetch("GMAPS_KEY")

    @gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + @address_from_user + "&key=" + gmaps_key

    @raw_data = open(@gmaps_url).read

    @parsed_data = JSON.parse(@raw_data)

    results_array = @parsed_data.fetch("results")

    first_result = results_array.at(0)

    geometry_hash = first_result.fetch("geometry")

    location_hash = geometry_hash.fetch("location")

    @latitude = location_hash.fetch("lat")
    @longitude = location_hash.fetch("lng")

    render({ :template =>"weather_templates/geocoding_results.html.erb"})
  end

  def street_coords
    render ({ :template => "weather_templates/street_coords.html.erb"})
  end

  def get_weather
    @latitude = params.fetch("latitude")
    @longitude = params.fetch("longitude")

    dark_sky_key = ENV.fetch("DARK_SKY")

    @dark_sky = "https://api.darksky.net/forecast/" + dark_sky_key + "/" + @latitude + "," + @longitude

    render ({ :template => "weather_templates/weather_results.html.erb"})

  end

  def weather_coords
    render ({ :template => "weather_templates/weather_page.html.erb"})
  end

end