class WorkoutDefinitionsController < ApplicationController
  before_action :set_workout_definition, only: [:show, :edit, :update, :destroy]

  # GET /workout_definitions
  # GET /workout_definitions.json
  def index
    @workout_definitions = WorkoutDefinition.all
  end

  # GET /workout_definitions/1
  # GET /workout_definitions/1.json
  def show
  end

  # GET /workout_definitions/new
  def new
    @workout_definition = WorkoutDefinition.new
  end

  # GET /workout_definitions/1/edit
  def edit
  end

  # POST /workout_definitions
  # POST /workout_definitions.json
  def create
    @workout_definition = WorkoutDefinition.new(workout_definition_params)

    respond_to do |format|
      if @workout_definition.save
        format.html { redirect_to @workout_definition, notice: 'Workout definition was successfully created.' }
        format.json { render :show, status: :created, location: @workout_definition }
      else
        format.html { render :new }
        format.json { render json: @workout_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workout_definitions/1
  # PATCH/PUT /workout_definitions/1.json
  def update
    respond_to do |format|
      if @workout_definition.update(workout_definition_params)
        format.html { redirect_to @workout_definition, notice: 'Workout definition was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout_definition }
      else
        format.html { render :edit }
        format.json { render json: @workout_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_definitions/1
  # DELETE /workout_definitions/1.json
  def destroy
    @workout_definition.destroy
    respond_to do |format|
      format.html { redirect_to workout_definitions_url, notice: 'Workout definition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_definition
      @workout_definition = WorkoutDefinition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_definition_params
      params.require(:workout_definition).permit(:name, :type)
    end
end
