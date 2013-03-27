Gallery::Application.routes.draw do
  match "/browse(.:format)/(/*dir)" => "application#browse"
  root :to => redirect("/browse/.html/")
end
