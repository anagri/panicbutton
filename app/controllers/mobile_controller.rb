class MobileController < ApplicationController
  layout nil

  def index
    alert = Alert.find_by_session(session[:session_id])
    if alert.present?
      render :json => alert, :status => 200
      return
    end
    render :nothing => true, :status => 204
  end

  def panic
    alert = Alert.find_by_session(session[:session_id])
    if alert.nil?
      alert = Alert.new
      alert.update_attributes({
                                  :user => session[:session_id],
                                  :session => session[:session_id],
                                  :message => 'Help Me!!!',
                                  :geo_code => 'London, UK'
                              })

      alert.save!
      render :json => alert, :status => 201
      return
    end
    render :json => alert, :status => 200

  end

  def notifications
    @alerts = Alert.all
    render :json => @alerts
  end

  def stop
    @alert = Alert.find_by_session(session[:session_id])
    @alert.destroy if @alert
    render :status => 200, :nothing => true
  end
end