class InternshipRegistrationsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  
  def index
    @internship_registrations = InternshipRegistration.all.group_by(&:internship_recruitment)

    @internship_assignment = InternshipAssignment.new
    @internship_assignment.assignments.build

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
    @internship_registration = InternshipRegistration.find params[:id]
  end

  def update
    @internship_registration = InternshipRegistration.find params[:id]
    if @internship_registration.update_attributes internship_registration_params
      flash[:success] = "Internship Registration updated successful"
      redirect_to internship_registrations_path

    else
      flash[:danger] = "Internship Registration can not updated"
      redirect_to[:back]
    end


  end

  def destroy
    @internship_registration = InternshipRegistration.find params[:id]
    if @internship_registration.destroy
      flash[:success] = "Register successful!"
      redirect_to internship_recruitments_path
    else
      flash[:danger] = "Can not cancel registration"
    end

  end

  private
  	def internship_registration_params
  		params.require(:internship_registration).permit :internship_recruitment_id, :user_id, :status
  	end
end
