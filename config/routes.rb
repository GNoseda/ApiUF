Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get 'by_date/:date', to: 'ufs#by_date'
    get 'by_name/:name', to: 'clients#by_name'
end
