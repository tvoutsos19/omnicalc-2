class ApplicationController < ActionController::Base

  def render_form
    render({ :template => "application/render_form.html.erb"})
  end
  
  def submit_form
    @result = params.fetch("input")
    render({ :template => "application/form_results.html.erb"})
  end
end
