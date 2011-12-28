class DailyStandingsController < ApplicationController
  # GET /dailyStanding
  # GET /dailyStanding.json
  def index
    @dailyStanding = DailyStanding.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @dailyStanding }
    end
  end

  # GET /dailyStanding/1
  # GET /dailyStanding/1.json
  def show
    @dailyStanding = DailyStanding.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @dailyStanding }
    end
  end

  # GET /dailyStanding/new
  # GET /dailyStanding/new.json
  def new
    @dailyStanding = DailyStanding.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @dailyStanding }
    end
  end

  # GET /dailyStanding/1/edit
  def edit
    @dailyStanding = DailyStanding.find(params[:id])
  end

  # POST /dailyStanding
  # POST /dailyStanding.json
  def create
    @dailyStanding = DailyStanding.new(params[:dailyStanding])

    respond_to do |format|
      if @dailyStanding.save
        format.html { redirect_to @dailyStanding, :notice => 'DailyStanding was successfully created.' }
        format.json { render :json => @dailyStanding, :status => :created, :location => @dailyStanding }
      else
        format.html { render :action => "new" }
        format.json { render :json => @dailyStanding.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dailyStanding/1
  # PUT /dailyStanding/1.json
  def update
    @dailyStanding = DailyStanding.find(params[:id])

    respond_to do |format|
      if @dailyStanding.update_attributes(params[:dailyStanding])
        format.html { redirect_to @dailyStanding, :notice => 'DailyStanding was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @dailyStanding.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dailyStanding/1
  # DELETE /dailyStanding/1.json
  def destroy
    @dailyStanding = DailyStanding.find(params[:id])
    @dailyStanding.destroy

    respond_to do |format|
      format.html { redirect_to dailyStanding_url }
      format.json { head :ok }
    end
  end
end
