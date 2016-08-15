class WeightliftingDefinitionsController < ApplicationController
  before_action :set_weightlifting_definition, only: [:show, :edit, :update, :destroy]

  # GET /weightlifting_definitions
  # GET /weightlifting_definitions.json
  def index
    @weightlifting_definitions = WeightliftingDefinition.all
  end

  # GET /weightlifting_definitions/1
  # GET /weightlifting_definitions/1.json
  def show
  end

  # GET /weightlifting_definitions/new
  def new
    @weightlifting_definition = WeightliftingDefinition.new
  end

  # GET /weightlifting_definitions/1/edit
  def edit
  end

  # POST /weightlifting_definitions
  # POST /weightlifting_definitions.json
  def create
    @weightlifting_definition = WeightliftingDefinition.new(weightlifting_definition_params)

    respond_to do |format|
      if @weightlifting_definition.save
        format.html { redirect_to @weightlifting_definition, notice: 'Weightlifting definition was successfully created.' }
        format.json { render :show, status: :created, location: @weightlifting_definition }
      else
        format.html { render :new }
        format.json { render json: @weightlifting_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weightlifting_definitions/1
  # PATCH/PUT /weightlifting_definitions/1.json
  def update
    respond_to do |format|
      if @weightlifting_definition.update(weightlifting_definition_params)
        format.html { redirect_to @weightlifting_definition, notice: 'Weightlifting definition was successfully updated.' }
        format.json { render :show, status: :ok, location: @weightlifting_definition }
      else
        format.html { render :edit }
        format.json { render json: @weightlifting_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weightlifting_definitions/1
  # DELETE /weightlifting_definitions/1.json
  def destroy
    @weightlifting_definition.destroy
    respond_to do |format|
      format.html { redirect_to weightlifting_definitions_url, notice: 'Weightlifting definition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weightlifting_definition
      @weightlifting_definition = WeightliftingDefinition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weightlifting_definition_params
      params.require(:weightlifting_definition).permit(:name)
    end
end
