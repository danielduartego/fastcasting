class CalendarsController < ApplicationController

  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user


  # GET /calendars
  # GET /calendars.json
  def index
    @calendars = Calendar.all
    @calendar = Calendar.new
  end

  # GET /calendars/1
  # GET /calendars/1.json
  def show

  end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit
  end


  # POST /calendars
  # POST /calendars.json
  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.user = current_user
    respond_to do |format|
      if @calendar.save
        format.html { redirect_to current_user }
        #format.json { render :show, status: :created, location: @calendar }
      else
        format.html { render :new }
        #format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendars/1
  # PATCH/PUT /calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to @calendar, notice: 'Calendar was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.json
  def destroy
    if @calendar.destroy
      respond_to do |format|
        format.html { redirect_to current_user }
        format.json { head :no_content }
      end
    else
      redirect_to current_user, alert: "You cant' delete!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_params
      params.require(:calendar).permit(:name, :start_time)
    end
end
