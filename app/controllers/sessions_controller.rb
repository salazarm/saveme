class SessionsController < ApplicationController
	
	def create
   user = Person.find_by_email(params[:email].downcase)
   if user && user.authenticate(params[:password])
     cookies[:auth_token] = user.id
     render :json => user, :only => ["id" ,"name"], :status => 200
   else
     render :json => {:msg => "Invalid Login"}, :status => 404
   end
  end
  
  def destroy
   cookies[:auth_token] = nil
   redirect_to root_url
  end

end
