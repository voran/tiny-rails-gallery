Gallery::Application.routes.draw do
  match "/browse(.:format)/(/*dir)" => "application#browse", :via => :get, :as => :browse
  root :to => redirect("/browse/")
end
