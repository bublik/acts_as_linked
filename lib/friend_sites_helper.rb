module FriendSitesHelper
  def site_title
    'Site title - override site_title method this in your application_helper.rb'
  end
  def site_description
    'Site Description - override site_title method this in your application_helper.rb'
  end
  include ApplicationHelper
end
