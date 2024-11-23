Rails.application.routes.draw do
  root "news#new" # This should point to your form page
  post 'verify', to: 'news#verify' # Ensure the POST route is pointing to verify action
end
