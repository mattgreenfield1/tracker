class MmaDefinitionsController < ApplicationController
  before_action :set_mma_definition, only: [:show, :edit, :update, :destroy]

  # GET /mma_definitions
  # GET /mma_definitions.json
  def index
    @mma_definitions = MmaDefinition.all
  end

  # GET /mma_definitions/1
  # GET /mma_definitions/1.json
  def show
  end

  # GET /mma_definitions/new
  def new
    @mma_definition = MmaDefinition.new
  end

  # GET /mma_definitions/1/edit
  def edit
  end

  # POST /mma_definitions
  # POST /mma_definitions.json
  def create
    @mma_definition = MmaDefinition.new(mma_definition_params)

    respond_to do |format|
      if @mma_definition.save
        format.html { redirect_to @mma_definition, notice: 'Mma definition was successfully created.' }
        format.json { render :show, status: :created, location: @mma_definition }
      else
        format.html { render :new }
        format.json { render json: @mma_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mma_definitions/1
  # PATCH/PUT /mma_definitions/1.json
  def update
    respond_to do |format|
      if @mma_definition.update(mma_definition_params)
        format.html { redirect_to @mma_definition, notice: 'Mma definition was successfully updated.' }
        format.json { render :show, status: :ok, location: @mma_definition }
      else
        format.html { render :edit }
        format.json { render json: @mma_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mma_definitions/1
  # DELETE /mma_definitions/1.json
  def destroy
    @mma_definition.destroy
    respond_to do |format|
      format.html { redirect_to mma_definitions_url, notice: 'Mma definition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mma_definition
      @mma_definition = MmaDefinition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mma_definition_params
      params.require(:mma_definition).permit(:name)
    end
end
