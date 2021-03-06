class TopicsController < ApplicationController
  before_action :find_topic, only: [:edit, :update, :show, :delete]

  def home

  end
  def index
    @topics = Topic.all
  end
 
  def show
    @topic = Topic.find(params[:id])
  end
 
  def new
    @topic = Topic.new
  end
 
  def edit
    @topic = Topic.find(params[:id])
  end
 
  def create
    @topic = Topic.new(topic_params)
 
    if @topic.save
      redirect_to @topic
    else
      render 'new'
    end
  end
 
  def update
    @topic = Topic.find(params[:id])
 
    if @topic.update(topic_params)
      redirect_to @topic
    else
      render 'edit'
    end
  end
 
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
 
    redirect_to topics_path
  end
 
  private
    def topic_params
      params.require(:topic).permit(:discussion, :details)
    end

    def find_topic
    @topic = Topic.find(params[:id])
  end

end
