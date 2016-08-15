class WorkoutTransactionsController < ApplicationController
  before_action :set_workout_transaction, only: [:show, :edit, :update, :destroy]

  # GET /workout_transactions
  # GET /workout_transactions.json
  def index
    @workout_transactions = WorkoutTransaction.all
  end

  # GET /workout_transactions/1
  # GET /workout_transactions/1.json
  def show
  end

  # GET /workout_transactions/new
  def new
    @workout_transaction = WorkoutTransaction.new
  end

  # GET /workout_transactions/1/edit
  def edit
  end

  # POST /workout_transactions
  # POST /workout_transactions.json
  def create
    @workout_transaction = WorkoutTransaction.new(workout_transaction_params)
    txn = params['workout_transaction']

    # Will look something like ['','1','2','3'] for defs 1, 2, and 3
    defs = txn['workout_definitions']
    # We need to remove the ''
    defs.reject!{|w| w == ''}
    # Then set our txn's defs.
    @workout_transaction.workout_definitions = WorkoutDefinition.find(defs)

    # Our time is also set in a format like {1=>year,2=>month,3=>day,4=>hour,5=>minute}
    # We just want the hour/minute
    @workout_transaction.time = "#{txn['time(4i)']}:#{txn['time(5i)']}"

    respond_to do |format|
      if @workout_transaction.save
        format.html { redirect_to @workout_transaction, notice: 'Workout transaction was successfully created.' }
        format.json { render :show, status: :created, location: @workout_transaction }
      else
        format.html { render :new }
        format.json { render json: @workout_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workout_transactions/1
  # PATCH/PUT /workout_transactions/1.json
  def update
    respond_to do |format|
      if @workout_transaction.update(workout_transaction_params)
        format.html { redirect_to @workout_transaction, notice: 'Workout transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout_transaction }
      else
        format.html { render :edit }
        format.json { render json: @workout_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_transactions/1
  # DELETE /workout_transactions/1.json
  def destroy
    @workout_transaction.destroy
    respond_to do |format|
      format.html { redirect_to workout_transactions_url, notice: 'Workout transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_transaction
      @workout_transaction = WorkoutTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_transaction_params
      params.require(:workout_transaction).permit(:details, :date, :time, :workout_definitions)
    end
end
