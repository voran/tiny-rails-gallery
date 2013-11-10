Gallery::Application.routes.draw do
  match "/browse(.:format)/(/*dir)" => "application#browse", :via => :get
  root :to => redirect("/browse.html/")
end
