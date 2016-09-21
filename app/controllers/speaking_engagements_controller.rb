class SpeakingEngagementsController < ApplicationController
  helper_attr_accessor :speaking_engagement

  before_action :require_developer
  before_action :set_speaking_engagement, only: [:edit, :update]

  def new
    self.speaking_engagement = SpeakingEngagement.new
  end

  def update
    if speaking_engagement.update(speaking_engagement_params)
      redirect_to '/about', notice: 'Speaking Engagement updated'
    else
      flash.now[:notice] = speaking_engagement.errors.full_messages
      render :edit
    end
  end

  def create
    self.speaking_engagement = SpeakingEngagement.new(speaking_engagement_params)
    if speaking_engagement.save
      redirect_to '/about', notice: 'Speaking Engagement created'
    else
      flash.now[:notice] = speaking_engagement.errors.full_messages
      render :new
    end
  end

  private

  def set_speaking_engagement
    self.speaking_engagement = SpeakingEngagement.find_by_id!(params[:id])
  end

  def speaking_engagement_params
    params.require(:speaking_engagement).permit :title, :location, :date, :hyperlink
  end
end
