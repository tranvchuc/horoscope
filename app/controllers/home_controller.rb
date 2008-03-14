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
  
  def fragment_cache_key(*args)
    request.host + request.request_uri
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
      doc = Hpricot(@item.description)
      doc.search("center:first").html = "<img width='100' height='100' src='/images/#{@sign}.gif' alt='#{@sign}'/>"
      doc.search('b').set(:style => 'background-color:#A73894;color:#fff;display:block;padding:0 1em')
      # doc.search("b").wrap("<p></p")
      
      (doc/"br:first").remove
      (doc/"center:last").remove
      
      # (doc/"br").remove
      # (doc/"b").before("<br/><br/>")
      # (doc/"b").after("<br/>")
      @description = doc
    end
  end
end
