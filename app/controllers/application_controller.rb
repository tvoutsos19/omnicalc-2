class ApplicationController < ActionController::Base
  
  def add
    render ({ :template => "operations/addition.html.erb" })   
  end

  def add_results
    # Parameters: {"first_num"=>"3", "second_num"=>"4"}
    @first = params.fetch("first_num")
    @second = params.fetch("second_num")
    @results = (@first.to_f+@second.to_f).to_f
    render ({ :template => "operations/add_results.html.erb" })   
  end

  def subtract
    render ({ :template => "operations/subtraction.html.erb" })
  end

  def subtract_results
    @first = params.fetch("first_num")
    @second = params.fetch("second_num")
    @results = (@first.to_f - @second.to_f).to_f
    render ({ :template => "operations/subtract_results.html.erb" })
  end

  def multiply
    render ({ :template => "operations/multiplication.html.erb" })
  end

  def mutliply_results
    @first = params.fetch("first_num")
    @second = params.fetch("second_num")
    @results = (@first.to_f * @second.to_f).to_f
    render ({ :template => "operations/multiply_results.html.erb"})

  end

  def divide
    render ({ :template => "operations/division.html.erb" })
  end 

end
