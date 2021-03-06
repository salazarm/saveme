class MobileController < ActionController::Base
  protect_from_forgery

  layout "mobile"

  #helper_method :deals

  #def deals
  #  Deal.all(:order => "vendor")
  #end

  def report
    @incident_report = IncidentReport.new
  end

  def submit_report
    @incident_report = IncidentReport.new(params[:incident_report])
    if @incident_report.save
      render :text => 'Thank you for reporting this incident!'
    else
      render :text => 'Save Failed!'
    end
  end

  def respond
    @incidentReports = IncidentReport.all.reverse
  end

  def help
    @current_user.update_attribute('ip', 'troll')
    render :nothing => true, :status => 200
  end 
end
