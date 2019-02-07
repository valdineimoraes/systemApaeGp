class Admins::AcademicsController < Admins::BaseController
  before_action :set_academic, only: [:edit, :update, :destroy]
  before_action :load_date, only: [:new, :create, :edit, :update]

  add_breadcrumb I18n.t('breadcrumbs.academics.name'), :admins_academics_path
  add_breadcrumb I18n.t('breadcrumbs.academics.new'),
                 :new_admins_academic_path, only: [:new, :create]

  def index
    @academics = Academic.order(created_at: :desc).page params[:page]
  end

  def new
    @academic = Academic.new
  end

  def show
    add_breadcrumb I18n.t('breadcrumbs.academics.show',
                          name: "##{@academic.id}"), :admins_academic_path
  end

  def create
    @academic = Academic.new(academic_params)
    if @academic.save
      success_create_message
      redirect_to admins_academics_path
    else
      error_message
      render :new
    end
  end

  def edit
    add_breadcrumb I18n.t('breadcrumbs.academics.edit', name: "##{@academic.id}"),
                   :edit_admins_academic_path
  end

  def update
    if @academic.update(academic_params)
      success_update_message
      redirect_to admins_academics_path
    else
      add_breadcrumb I18n.t('breadcrumbs.academics.edit', name: "##{@academic.id}"),
                     :edit_admins_academic_path

      error_message
      render :edit
    end
  end

  def destroy
    @academic.destroy
    success_destroy_message
    redirect_to admins_academics_path
  end

  protected

  def academic_params
    params.require(:academic).permit(:name,
                                     :image,
                                     :registration,
                                     :entry_date,
                                     :cod_sere,
                                     :birth_date,
                                     :birth_certificate,
                                     :rg_student,
                                     :expedition_rg_student,
                                     :cpf_student,
                                     :card_sus_number,
                                     :breed,
                                     :phone_student,
                                     :contact,
                                     :naturalness,
                                     :street,
                                     :neighborhood,
                                     :reference_point,
                                     :cep_student,
                                     :family_income,
                                     :image_cache,
                                     :graduated)
  end

  def set_academic
    @academic = Academic.find(params[:id])
  end

  def load_date
    @years = (1930..Time.zone.today.year).to_a.reverse
  end
end
