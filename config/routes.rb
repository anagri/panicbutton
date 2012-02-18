Panicbutton::Application.routes.draw do
  root :to => 'root#index'
  match '/panic' => 'root#panic'
  match '/notifications' => 'root#notifications'
  match '/stop' => 'root#stop'

  match '/mobile' => 'mobile#index'
  match '/mobile/panic' => 'mobile#panic'
  match '/mobile/notifications' => 'mobile#notifications'
  match '/mobile/stop' => 'mobile#stop'
end
