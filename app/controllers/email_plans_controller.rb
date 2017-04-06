class EmailPlansController < ApplicationController
  before_action :set_email_plan, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /email_plans
  # GET /email_plans.json
  def index
    # @email_plans = EmailPlan.all
    @email_plans = EmailPlan.search(params[:term]).order("#{sort_column} #{sort_direction}").page params[:page]
  end

  # GET /email_plans/1
  # GET /email_plans/1.json
  def show
  end

  # GET /email_plans/new
  def new
    @email_plan = EmailPlan.new
  end

  # GET /email_plans/1/edit
  def edit
  end

  # POST /email_plans
  # POST /email_plans.json
  def create
    @email_plan = EmailPlan.new(email_plan_params)

    respond_to do |format|
      if @email_plan.save
        format.html { redirect_to @email_plan, notice: 'Email plan was successfully created.' }
        format.json { render :show, status: :created, location: @email_plan }
      else
        format.html { render :new }
        format.json { render json: @email_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_plans/1
  # PATCH/PUT /email_plans/1.json
  def update
    respond_to do |format|
      if @email_plan.update(email_plan_params)
        format.html { redirect_to @email_plan, notice: 'Email plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_plan }
      else
        format.html { render :edit }
        format.json { render json: @email_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_plans/1
  # DELETE /email_plans/1.json
  def destroy
    @email_plan.destroy
    respond_to do |format|
      format.html { redirect_to email_plans_url, notice: 'Email plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_plan
      @email_plan = EmailPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_plan_params
      params.require(:email_plan).permit(:name, :expiration)
    end

    # Sortable
    def sortable_columns
      ["name", "expiration"]
    end

    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
