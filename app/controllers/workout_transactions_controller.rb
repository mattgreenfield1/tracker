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
    unless params[:workout_def].nil?
      @workout_def = WorkoutDefinition.find(params[:workout_def])
      @workout_transaction.workout_definitions.push(@workout_def)
    end
  end

  # GET /workout_transactions/1/edit
  def edit
  end

  def load

  end

  def parse
    input = params[:input]
    # Split by newline characters and reject any line that does not start with a number (date)
    # This will give us an array of strings like
    # 8/16: abs, back
    workouts = input.split(/(\r\n)|(\n)/).reject{|l|l.match /^\D/}
    if workouts.count > 0
      # Grab all different muscle groups by getting the names of all the weight lifting defs
      mgs = WorkoutDefinition.all.map{|w|w.name}
      # Delete all other imported transactions
      to_delete = WorkoutTransaction.where(is_imported: true)
      to_delete.delete_all
      workouts.each do |w|
        txn = WorkoutTransaction.new
        txn.is_imported = true
        date_regex = /([\d]+\/[\d]+):.*/
        # If we match the pattern like "8/16: otherstuff", then grab the 8/16 part and set it as the date
        if w.match(date_regex)
          date_string = w.gsub(date_regex,'\1')
          date_string = w.gsub(date_regex,'\1')
          txn.date = Date.strptime(date_string,'%m/%d')
        end
        txn.save!
        # Grab the different areas (e.g. 'back, abs')
        areas = w.gsub(/[\d]+\/[\d]+:[\s]*/,'').split(/,[\s]*/)
        rejected_areas = areas.clone
        areas.reject!{|a| !(mgs.include?(a))}
        rejected_areas.reject!{|a| mgs.include?(a)}
        unless rejected_areas.empty?
          txn.details = "(#{rejected_areas.join(', ')})"
        end
        # Initialize workout maps if nil
        areas.each do |a|
          wdef = WorkoutDefinition.where(name: a).first
          txn.workout_maps.create(workout_transaction: txn, workout_definition: wdef)
        end
        txn.save!
      end
    end
    redirect_to '/calendar'
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
