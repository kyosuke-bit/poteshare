class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :login_required
    
    def search
        query = { adress_cont: params[:adress], room_introduction_cont: params[:room_introduction] }
        search = Room.ransack(query)
        @rooms = search.result
    end
    
    private
    
    def current_user
        @q = Room.all.ransack(params[:q])
        @rooms = @q.result(distinct: true).recent
        
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def login_required
        redirect_to login_url unless current_user
    end
end
