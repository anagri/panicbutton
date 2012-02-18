class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :start_session

  def start_session
    if session[:session_id].blank?
      session[:session_id] = (0...8).map{65.+(rand(25)).chr}.join
    end
  end
end
