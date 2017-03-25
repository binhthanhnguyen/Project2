class InternshipRecruitmentsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource
  def index
  	@internship_recruitments = InternshipRecruitment.paginate(page: params[:page])
  end

  def new
  	@user = current_user;
  	@internship_recruitment = @user.internship_recruitments.build
  end

  def create
  	@user = current_user;
  	@internship_recruitment = @user.internship_recruitments.build internship_recruitment_params
  	if @internship_recruitment.save
  		flash[:success] = "Internship Recruitment created."
  		redirect_to internship_recruitments_path
  	else
  		render :new
  	end
  end

  def show
  	@internship_recruitment = InternshipRecruitment.find(params[:id])
  end

  def edit
  	@internship_recruitment = InternshipRecruitment.find(params[:id])
  end

  def update
  	@internship_recruitment = InternshipRecruitment.find(params[:id])
  	if @internship_recruitment.update_attributes internship_recruitment_params
  		flash[:success] = "Internship Recruitement updated."
  		redirect_to internship_recruitments_path
  	else
  		render :edit
  	end
  end

  private
  	def internship_recruitment_params
  		params.require(:internship_recruitment).permit :title, :content
  	end
end
