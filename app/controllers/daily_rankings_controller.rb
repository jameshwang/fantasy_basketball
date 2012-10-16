class DailyRankingsController < ApplicationController
  # GET /daily_rankings
  # GET /daily_rankings.json
  def index
    @daily_rankings = DailyRanking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @daily_rankings }
    end
  end

  # GET /daily_rankings/1
  # GET /daily_rankings/1.json
  def show
    @daily_ranking = DailyRanking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @daily_ranking }
    end
  end

  # GET /daily_rankings/new
  # GET /daily_rankings/new.json
  def new
    @daily_ranking = DailyRanking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @daily_ranking }
    end
  end

  # GET /daily_rankings/1/edit
  def edit
    @daily_ranking = DailyRanking.find(params[:id])
  end

  # POST /daily_rankings
  # POST /daily_rankings.json
  def create
    @daily_ranking = DailyRanking.new(params[:daily_ranking])

    respond_to do |format|
      if @daily_ranking.save
        format.html { redirect_to @daily_ranking, :notice => 'Daily ranking was successfully created.' }
        format.json { render :json => @daily_ranking, :status => :created, :location => @daily_ranking }
      else
        format.html { render :action => "new" }
        format.json { render :json => @daily_ranking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /daily_rankings/1
  # PUT /daily_rankings/1.json
  def update
    @daily_ranking = DailyRanking.find(params[:id])

    respond_to do |format|
      if @daily_ranking.update_attributes(params[:daily_ranking])
        format.html { redirect_to @daily_ranking, :notice => 'Daily ranking was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @daily_ranking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_rankings/1
  # DELETE /daily_rankings/1.json
  def destroy
    @daily_ranking = DailyRanking.find(params[:id])
    @daily_ranking.destroy

    respond_to do |format|
      format.html { redirect_to daily_rankings_url }
      format.json { head :ok }
    end
  end
end
