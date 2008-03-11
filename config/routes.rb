ActionController::Routing::Routes.draw do |map|
  # Install the default routes as the lowest priority.
  map.home '/', :controller => 'home', :action => 'index'
  #map.belier '/belier', :controller => 'home', :action => 'belier'
  map.sign '/:sign/:period', :controller => 'home', :action => 'sign',
    :period => nil, :conditions => {:period => /(jour|mois|semaine|^$)/, 
      :sign => /(belier|taureau|gemeaux|cancer|lion|vierge|balance|scorpion|sagittaire|capricorne|verseau|poissons)/}
end