class AppsController < ApplicationController
  def index
    content = Content.find_by(name: params[:content_name])

    if content
      @apps = App.where(content_id: content.id)
    else
      @apps = []
    end
  end


  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
