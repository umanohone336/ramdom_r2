class ReportsController < ApplicationController
  def generate_instructions
    @clock = Clock.order("RANDOM()").first
    if @clock.nil?
    flash[:error] = "Could not generate instructions. Please create at least one clock record."
    redirect_to "/"
    else
      @time = @clock.time
      @location = Location.order("RANDOM()").first
      @outfit = Outfit.order("RANDOM()").first
      @task = Task.order("RANDOM()").first
    end
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      flash[:success] = "Report created successfully"
      redirect_to @report
    else
      flash.now[:error] = "Report creation failed"
      render :new
    end
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  # private

  # def report_params
  #   params.require(:report).permit(:description, :photo, :video)
  # end
end
