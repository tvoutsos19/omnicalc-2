class ApplicationController < ActionController::Base
  
  def add
    render ({ :template => "operations/addition.html.erb" })   
  end

  def add_results
    # Parameters: {"first_num"=>"3", "second_num"=>"4"}
    @first = params.fetch("first_num").to_f
    @second = params.fetch("second_num").to_f
    @results = (@first+@second)
    render ({ :template => "operations/add_results.html.erb" })   
  end

  def subtract
    render ({ :template => "operations/subtraction.html.erb" })
  end

  def subtract_results
    @first = params.fetch("first_num").to_f
    @second = params.fetch("second_num").to_f
    @results = (@first - @second)
    render ({ :template => "operations/subtract_results.html.erb" })
  end

  def multiply
    render ({ :template => "operations/multiplication.html.erb" })
  end

  def multiply_results
    @first = params.fetch("first_num").to_f
    @second = params.fetch("second_num").to_f
    @results = (@first * @second)
    render ({ :template => "operations/multiply_results.html.erb"})

  end

  def divide
    render ({ :template => "operations/division.html.erb" })
  end 

  def divide_results
    @first = params.fetch("first_num").to_f
    @second = params.fetch("second_num").to_f
    @results = (@first / @second)
    render ({ :template => "operations/divide_results.html.erb"})

  end

  def street_coords
    render ({ :template => "operations/street_coords.html.erb"})

  end

end
