class RootController < ApplicationController
  def index
  end

  def panic
    alert = Alert.all.empty? ? Alert.new : Alert.first
    alert.update_attributes({
                                :user => session[:session_id],
                                :message => 'Help Me!!!',
                                :geo_code => 'London, UK'
                            })

    alert.save!
  end

  def notifications
    @alerts = Alert.all
  end
end