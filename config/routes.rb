Rails.application.routes.draw do

  get("/add", { :controller => "application", :action => "add"})

  get("/add/result", { :controller => "application", :action => "add_results"})

  get("/subtract/", { :controller => "application", :action => "subtract"})

  get("/subtract/result", { :controller=> "application", :action => "subtract_results"})

  get("/multiply", { :controller => "application", :action => "multiply"})

  get("/multiply/result", { :controller => "application", :action => "multiply_results"})

  get("/divide", { :controller => "application", :action => "divide"})

  get("/divide/result", { :controller => "application", :action => "divide_results"})

  get("/street_to_coords/new", { :controller => "geocoding", :action => "street_coords"})

  get("/street_to_coords/results", { :controller => "geocoding", :action => "get_latlon"})

  get("/coords_to_weather/new", { :controller => "geocoding", :action => "weather_coords"})

   get("/coords_to_weather/results", { :controller => "geocoding", :action => "get_weather"})

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
