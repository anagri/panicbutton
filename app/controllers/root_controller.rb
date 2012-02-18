class RootController < ApplicationController
  def index
    if Alert.find_by_session(session[:session_id]).present?
      render 'panic'
    end
  end

  def panic
    alert = Alert.all.empty? ? Alert.new : Alert.first
    alert.update_attributes({
                                :user => session[:session_id],
                                :session => session[:session_id],
                                :message => 'Help Me!!!',
                                :geo_code => 'London, UK'
                            })

    alert.save!
  end

  def notifications
    @alerts = Alert.all
  end

  def stop
    @alert = Alert.find_by_session(session[:session_id])
    @alert.destroy if @alert
    redirect_to :action => :index
  end
end