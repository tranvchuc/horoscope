# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def adsense
    %(<center><script type="text/javascript"><!--
      google_ad_client = "pub-6234708166037492";
      /* 728x90, date de création 09/03/08 */
      google_ad_slot = "7663203358";
      google_ad_width = 728;
      google_ad_height = 90;
      //-->
      </script>
      <script type="text/javascript"
      src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script></center>)
  end
  
  def adsense_vertical
    %(<script type="text/javascript"><!--
      google_ad_client = "pub-6234708166037492";
      /* 160x600, date de création 09/03/08 */
      google_ad_slot = "5733586931";
      google_ad_width = 160;
      google_ad_height = 600;
      //-->
      </script>
      <script type="text/javascript"
      src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>)
  end
  
  def google_analytics
    <<-EOF
      <script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
      </script>
      <script type="text/javascript">
      _uacct = "UA-77556-6";
      urchinTracker();
      </script>
    EOF
  end
end
