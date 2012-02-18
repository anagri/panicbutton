class RootController < ApplicationController
  def index
    if Alert.find_by_session(session[:session_id]).present?
      render 'panic'
    end
  end

  def panic
    alert = Alert.find_by_session(session[:session_id])
    alert = Alert.new if alert.nil?
    alert.update_attributes({
                                :user => session[:session_id],
                                :session => session[:session_id],
                                :message => params['message'],
                                :geo_code => "#{params['lat']},#{params['long']}"
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
  def messages
  end
  def reset
    Alert.all.map(&:destroy)
    render :nothing => true
  end
end