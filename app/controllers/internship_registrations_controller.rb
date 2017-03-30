class InternshipRegistrationsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  
  def index
  end

  def new
  	@internship_registration = current_user.internship_registrations.build
  	@internship_recruitment = InternshipRecruitment.find params[:internship_recruitment_id]
  end

  def create
  	@internship_registration = current_user.internship_registrations.build(internship_registration_params)
    @internship_recruitment = @internship_registration.internship_recruitment
  	if @internship_registration.save 
  		flash[:success] = "Register successful!"
  		redirect_to internship_recruitments_path
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  end

  private
  	def internship_registration_params
  		params.require(:internship_registration).permit :internship_recruitment_id, :user_id 
  	end
end
