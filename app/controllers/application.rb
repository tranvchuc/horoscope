# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include ExceptionNotifiable
  helper :all # include all helpers, all the time
  layout 'layouts/common'
  helper_method :signs, :periods
  session :disabled => true

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  # protect_from_forgery # :secret => '7e1cb3b07c536d55e70052c607ca5861'
  
  protected
  def signs
    [ ['belier','Bélier'],
      ['taureau','Taureau'],
      ['gemeaux','Gémeaux'],
      ['cancer','Cancer'],
      ['lion','Lion'],
      ['vierge','Vierge'],
      ['balance','Balance'],
      ['scorpion','Scorpion'],
      ['sagittaire','Sagittaire'],
      ['capricorne','Capricorne'],
      ['verseau','Verseau'],
      ['poissons', 'Poissons'] ]
  end
  
  def periods
    ['jour','semaine','mois']
  end
end
