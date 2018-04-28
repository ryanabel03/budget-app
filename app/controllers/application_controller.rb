class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from Exception, with: :internal_error


  def internal_error(e)
    puts e.message
    puts e.backtrace
    raise e
  end
end
