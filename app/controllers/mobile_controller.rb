class MobileController < ActionController::Base
  protect_from_forgery

  layout "mobile"

  #helper_method :deals

  #def deals
  #  Deal.all(:order => "vendor")
  #end

  def report
    #@address = Address.new
  end

  def respond
  end
end
