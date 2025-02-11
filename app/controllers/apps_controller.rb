class AppsController < ApplicationController
  def index
    if  params[:content_name] == 'All'
      @apps = App.all.order(original_title: :asc)
    else
      @content = Content.find_by(name: params[:content_name])
      if @content
        @apps = App.where(content_id: @content&.id).order(original_title: :asc)
      else
        @apps = []
      end
    end
    if !@apps.empty?
      if params[:country]
      app_ids = Array.new
      @apps.each do |app|
        availabilities = app.availabilities.select { |a| params[:country].include?(a["market"]) } rescue []
        if availabilities.any?
            app_ids << app.id
        end
      end
      @apps = @apps.where(id: app_ids)
      end
      if params[:type]
        @apps = @apps.joins(:content).where(contents:{name:params[:type]})
      end
    end
    if @content&.name =='Channel'
      @channel_programs_favorites = ChannelProgram.joins(:channel).where(channels:{app_id:@apps.map(&:id)})
      programs = Array.new
      @channel_programs_favorites.each do |ch|
        time = 0
        ch.schedule.select{|a|

        start_date = Time.parse(a["start_time"])
        end_date = Time.parse(a["end_time"])
        seconds_difference = (end_date - start_date).to_i
        time += seconds_difference
        }
        programs << {channel:ch,time:time}
      end
      @channel_programs_favorites = programs.sort_by { |k| k[:time] }.reverse if programs
      @channel_programs_favorites = @channel_programs_favorites.map{|p| p[:channel]} if programs
    end
  end





  def show
    @app = App.find(params[:app_id])
    if @app and @app.content.name == 'Channel'
      @channel_programs = ChannelProgram.joins(:channel).where(channels:{ app_id: @app.id}).order('channels.number ASC')
    elsif @app and @app.content.name == 'TV Show'
      @chapters = Chapter.joins(:season).where(seasons:{app_id: @app.id}).order('seasons.number ASC')
    end

  end

  def create
  end

  def update
  end

  def destroy
  end
end
