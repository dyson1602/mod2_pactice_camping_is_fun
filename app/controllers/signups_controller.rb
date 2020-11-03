class SignupsController < ApplicationController
    # before_action :set_signup, only: [:create]
    
    def new
        @signup = Signup.new
        render :new
    end

    def create
        @signup = Signup.create(signup_params)
        redirect_to camper_path(@signup.camper)
    end
  
    private
  
    def set_signup
        @signup = Signup.find(params[:id])
    end

    def signup_params
        params.require(:signup).permit(:camper_id, :activity_id, :time)
    end

  end
  