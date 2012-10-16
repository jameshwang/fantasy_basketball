class DailyStandingsController < ApplicationController
  # GET /dailyStanding
  # GET /dailyStanding.json
  def index
    
    # TODO: make sure to add the rounding here instead of in the view
    @dailyStanding = DailyStanding.all
    @fg_avg = DailyStanding.average('fg')
    @ft_avg = DailyStanding.average('ft')
    @three_avg = DailyStanding.average('three_pm')
    @reb_avg = DailyStanding.average('reb')
    @ast_avg = DailyStanding.average('ast')
    @stl_avg = DailyStanding.average('stl')
    @blk_avg = DailyStanding.average('blk')
    @to_avg = DailyStanding.average('to')
    @pts_avg = DailyStanding.average('pts')
    
    # Calculate the standard dev of each metric
    @fg_stdev = 0
    @ft_stdev = 0
    @three_stdev = 0
    @reb_stdev = 0
    @ast_stdev = 0
    @stl_stdev = 0
    @blk_stdev = 0
    @to_stdev = 0
    @pts_stdev = 0
    
    @dailyStanding.each do |ds|
      @fg_stdev += (ds.fg - @fg_avg)**2
      @ft_stdev += (ds.ft - @ft_avg)**2
      @three_stdev += (ds.three_pm - @three_avg)**2
      @reb_stdev += (ds.reb - @reb_avg)**2
      @ast_stdev += (ds.ast - @ast_avg)**2
      @stl_stdev += (ds.stl - @stl_avg)**2
      @blk_stdev += (ds.blk - @blk_avg)**2
      @to_stdev += (ds.to - @to_avg)**2
      @pts_stdev += (ds.pts - @pts_avg)**2
    end
    
    @fg_stdev = round_to_4(Math.sqrt(@fg_stdev / 9))
    @ft_stdev = round_to_4(Math.sqrt(@ft_stdev / 9))
    @three_stdev = round_to_2(Math.sqrt(@three_stdev / 9))
    @reb_stdev = round_to_2(Math.sqrt(@reb_stdev / 9))
    @ast_stdev = round_to_2(Math.sqrt(@ast_stdev / 9))
    @stl_stdev = round_to_2(Math.sqrt(@stl_stdev / 9))
    @blk_stdev = round_to_2(Math.sqrt(@blk_stdev / 9))
    @to_stdev = round_to_2(Math.sqrt(@to_stdev / 9))
    @pts_stdev = round_to_2(Math.sqrt(@pts_stdev / 9))
    


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
  
  def round_to_2(number)
    return (number * 100).round / 100.0
  end
  
  def round_to_4(number)
    return (number * 10000).round / 10000.0
  end
end
