class CombinedController < ApplicationController

  def address_results
    
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

    dark_sky_key = ENV.fetch("DARK_SKY")

    @dark_sky = "https://api.darksky.net/forecast/" + dark_sky_key + "/" + @latitude.to_s + "," + @longitude.to_s

    @raw_weather = open(@dark_sky).read

    @parsed_weather = JSON.parse(@raw_weather)

    @temperature = @parsed_weather.dig("currently","temperature")

    @summary = @parsed_weather.dig("currently","summary")

    @next_sixty = @parsed_weather.dig("minutely","summary")

    @next_several_hours = @parsed_weather.dig("hourly","summary")

    @next_several_days = @parsed_weather.dig("daily","summary")

    render ({ :template => "combined_templates/new_results.html.erb"})

  end

  def new_address
    render ({ :template => "combined_templates/new_address.html.erb"})
  end

end