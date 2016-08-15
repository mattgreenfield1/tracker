class CardioDefinitionsController < ApplicationController
  before_action :set_cardio_definition, only: [:show, :edit, :update, :destroy]

  # GET /cardio_definitions
  # GET /cardio_definitions.json
  def index
    @cardio_definitions = CardioDefinition.all
  end

  # GET /cardio_definitions/1
  # GET /cardio_definitions/1.json
  def show
  end

  # GET /cardio_definitions/new
  def new
    @cardio_definition = CardioDefinition.new
  end

  # GET /cardio_definitions/1/edit
  def edit
  end

  # POST /cardio_definitions
  # POST /cardio_definitions.json
  def create
    @cardio_definition = CardioDefinition.new(cardio_definition_params)

    respond_to do |format|
      if @cardio_definition.save
        format.html { redirect_to @cardio_definition, notice: 'Cardio definition was successfully created.' }
        format.json { render :show, status: :created, location: @cardio_definition }
      else
        format.html { render :new }
        format.json { render json: @cardio_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cardio_definitions/1
  # PATCH/PUT /cardio_definitions/1.json
  def update
    respond_to do |format|
      if @cardio_definition.update(cardio_definition_params)
        format.html { redirect_to @cardio_definition, notice: 'Cardio definition was successfully updated.' }
        format.json { render :show, status: :ok, location: @cardio_definition }
      else
        format.html { render :edit }
        format.json { render json: @cardio_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cardio_definitions/1
  # DELETE /cardio_definitions/1.json
  def destroy
    @cardio_definition.destroy
    respond_to do |format|
      format.html { redirect_to cardio_definitions_url, notice: 'Cardio definition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cardio_definition
      @cardio_definition = CardioDefinition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cardio_definition_params
      params.require(:cardio_definition).permit(:name)
    end
end
