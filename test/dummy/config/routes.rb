Rails.application.routes.draw do
  mount Ckpages::Engine => "/ckpages"
  root to: 'ckpages/pages#index'
end
