# Optional, but recommended for Rails
ActionController::Base.send(:include, FriendSitesController)
ActionController::Base.send(:include, SitesCategoriesController)
ActionController::Base.view_paths.unshift File.join(directory, 'views')

# Include this module into views, too.
ActionController::Base.helper(FriendSitesHelper)
ActionController::Base.helper(SitesCategoriesHelper)

