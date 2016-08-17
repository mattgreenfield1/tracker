class WorkoutClassesController < ApplicationController
  before_action :set_workout_class, only: [:show, :edit, :update, :destroy]

  # GET /workout_classes
  # GET /workout_classes.json
  def index
    @workout_classes = WorkoutClass.all
  end

  # GET /workout_classes/1
  # GET /workout_classes/1.json
  def show
  end

  # GET /workout_classes/new
  def new
    @workout_class = WorkoutClass.new
  end

  # GET /workout_classes/1/edit
  def edit
  end

  # POST /workout_classes
  # POST /workout_classes.json
  def create
    @workout_class = WorkoutClass.new(workout_class_params)

    respond_to do |format|
      if @workout_class.save
        format.html { redirect_to @workout_class, notice: 'Workout class was successfully created.' }
        format.json { render :show, status: :created, location: @workout_class }
      else
        format.html { render :new }
        format.json { render json: @workout_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workout_classes/1
  # PATCH/PUT /workout_classes/1.json
  def update
    respond_to do |format|
      if @workout_class.update(workout_class_params)
        format.html { redirect_to @workout_class, notice: 'Workout class was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout_class }
      else
        format.html { render :edit }
        format.json { render json: @workout_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_classes/1
  # DELETE /workout_classes/1.json
  def destroy
    @workout_class.destroy
    respond_to do |format|
      format.html { redirect_to workout_classes_url, notice: 'Workout class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_class
      @workout_class = WorkoutClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_class_params
      params.require(:workout_class).permit(:details, :workout_definition_id, :time, :day)
    end
end
