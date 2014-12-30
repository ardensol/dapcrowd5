class PagesController < ApplicationController
  before_filter :check_init
  before_filter :current_user

  def index
    if @settings.default_campaign && ((user_signed_in? && current_user.admin?) || @settings.default_campaign.published_flag)
        redirect_to campaign_home_url(@settings.default_campaign)
    else
      @campaigns = Campaign.order("created_at ASC")
      @labs = Lab.order("created_at ASC")
      render 'theme/views/homepage'
    end
  end

  def wedding
    render 'theme/views/wedding'
  end

  def wedding_sign_up
    @nofooter = true
    @noheader = true
    render 'theme/views/wedding_sign_up'
  end

  def discussion
    render 'theme/views/discussion'
  end

  def fitguide
    render 'theme/views/fitguide'
  end 
  
  def howitworks
    render 'theme/views/howitworks'
  end

  def privacy
    render 'theme/views/privacy'
  end

end
