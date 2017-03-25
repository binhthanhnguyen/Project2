class CurriculumVitaesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
  	@user = current_user
  	@curriculum_vitae = current_user.curriculum_vitae
  end

  def new
  	@user = current_user
  	@curriculum_vitae = current_user.build_curriculum_vitae
  end

  def create
  	@curriculum_vitae = current_user.build_curriculum_vitae(curriculum_vitae_params)
  	if @curriculum_vitae.save
  		flash[:success] = "Curriculum Vitae created!"
  		redirect_to user_curriculum_vitaes_path
  	else
  		render :new
  	end
  end

  def show
  	@curriculum_vitae = current_user.curriculum_vitae
  end

  def edit
  	@user = current_user
  	@curriculum_vitae = current_user.curriculum_vitae
  end

  def update
  	@user = current_user
  	@curriculum_vitae = @user.curriculum_vitae
  	if @curriculum_vitae.update_attributes curriculum_vitae_params
  		flash[:success] = "Curriculum Vitae updated!"
  		redirect_to user_curriculum_vitaes_path
  	else 
  		render :edit
  	end
  end

  private 
  	def curriculum_vitae_params
  		params.require(:curriculum_vitae).permit(:title, :content)
  	end

end
