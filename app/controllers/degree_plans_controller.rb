class DegreePlansController < ApplicationController
  before_action :require_authentication
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  def index
    @plans = Current.user.degree_plans.order(created_at: :desc)
  end

  def new
    @plan = Current.user.degree_plans.build(branch: "ECE", scheme: "2019", title: "My Degree Plan")
  end

  def create
    @plan = Current.user.degree_plans.build(plan_params)
    if @plan.save
      redirect_to edit_degree_plan_path(@plan), notice: "Plan created. Pick your electives below."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    load_curriculum_for_view
  end

  def edit
    load_curriculum_for_view
  end

  def update
    if @plan.update(plan_params.except(:selections))
      save_elective_selections(params.dig(:degree_plan, :selections) || {})
      redirect_to @plan, notice: "Saved your picks."
    else
      load_curriculum_for_view
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plan.destroy
    redirect_to degree_plans_path, notice: "Plan deleted."
  end

  private

  def set_plan
    @plan = Current.user.degree_plans.find(params[:id])
  end

  def plan_params
    params.expect(degree_plan: [:title, :branch, :scheme])
  end

  def load_curriculum_for_view
    @subjects = Subject.for_program(branch: @plan.branch, scheme: @plan.scheme).order(:semester, :id)
    @by_semester = @subjects.where.not(kind: "elective_option").group_by(&:semester)
    @options_by_group = Subject.where(branch: @plan.branch, scheme: @plan.scheme, kind: "elective_option")
                               .order(:name).group_by(&:elective_group)
    @selections_by_group = @plan.plan_selections.includes(:subject).index_by(&:elective_group)
  end

  def save_elective_selections(selections_params)
    selections_params.each do |elective_group, subject_id|
      existing = @plan.plan_selections.find_by(elective_group: elective_group)

      if subject_id.blank?
        existing&.destroy
        next
      end

      subject = Subject.find_by(id: subject_id, elective_group: elective_group, kind: "elective_option")
      next unless subject

      if existing
        existing.update(subject: subject)
      else
        @plan.plan_selections.create(subject: subject, elective_group: elective_group)
      end
    end
  end
end
