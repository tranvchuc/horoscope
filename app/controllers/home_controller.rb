class HomeController < ApplicationController
  public
  def sign
    @sign = params[:sign]
    unless signs.collect(&:first).include?(@sign)
      render :nothing => true, :status => 404
      return false
    end
    
    @period = periods.include?(params[:period]) ? params[:period] : 'jour'
    
    #sweeper_manager
    
    feed_url = case @period
    when 'semaine'
      "http://www.asiaflash.com/horoscope/rss_hebdo_#{@sign}.xml"
    when 'mois'
      "http://www.asiaflash.com/horoscope/rss_mensuel_#{@sign}.xml"
    else
      "http://www.asiaflash.com/horoscope/rss_horojour_#{@sign}.xml"
    end
    
    open(feed_url) do |http|
      response = http.read
      result   = RSS::Parser.parse(response, false)
      @item    = result.items.first
    end
  end
end
