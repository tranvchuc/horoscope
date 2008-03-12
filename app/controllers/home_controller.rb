class HomeController < ApplicationController
  caches_action :index  => { :ttl => 24.hours }
  caches_action :sign  => { :ttl => 2.hours, :if => :cacheable? }
  
  def cacheable?
    @sign = params[:sign]
    unless signs.collect(&:first).include?(@sign)
      render :nothing => true, :status => 404
      return false
    end
    (params[:period] = 'jour') if params[:period].blank?
    @period = params[:period] if periods.include?(params[:period])
    
    @sign && @period
  end
  
  public
  def sign
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
