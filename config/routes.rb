Rails.application.routes.draw do
  localized do
    root to: 'home#index'
    get '/static_pages/:permalink', to: 'static_pages#index', as: 'static_page'
    get '/static_pages/:static_page_id/history', to: 'static_pages#history', as: 'static_page_history'
    get '/tcc', to: 'static_pages#tcc'
    get '/monitors', to: 'static_pages#monitor', as: 'activity_monitors'
    get '/course_about', to: 'static_pages#course_about', as: 'course_about'
    get '/extension_activity', to: 'static_pages#extension_activity', as: 'extension_activity'
    get '/be_our_student', to: 'static_pages#be_our_student', as: 'be_our_student'
    get '/instruction_subscription', to: 'static_pages#instruction_subscription', as: 'instruction_subscription'
    resources :professors, only: [:index, :show]
    resources :companies, only: [:index, :show]
    resources :trainees, only: [:index, :show]
    resources :activities, only: [:index, :show]
    resources :discipline_monitors, only: [:index, :show]

    resources :professors,
              :trainees,
              :companies,
              :activities,
              :discipline_monitors do
      get 'page/:page', action: :index, on: :collection
    end

    #========================================
    # Admin
    #========================================
    as :admin do
      get '/admins/edit' => 'admins/registrations#edit', :as => 'edit_admin_registration'
      put '/admins' => 'admins/registrations#update', :as => 'admin_registration'
    end

    devise_for :admins
    authenticate :admin do
      namespace :admins do
        root to: 'dashboard#index'

        resources :category_recommendations, excepty: [:show]
        resources :recommendations, excepty: [:show]
        resources :academics
        resources :professors
        resources :companies
        resources :activities
        resources :activity_professors, excepty: [:show]
        resources :matrices, :periods, :disciplines
        resources :faqs
        resources :static_pages, excepty: [:show] do
          get 'history', to: 'static_pages#history'
        end
        resources :discipline_monitors
        resources :monitor_types
        resources :trainees
        get '/static_page/trainee', to: 'static_pages#trainee'
        get '/static_page/tcc', to: 'static_pages#tcc'
        get '/static_page/monitor', to: 'static_pages#monitor'
        get '/static_page/instruction_subscription', to: 'static_pages#instruction_subscription'
        get '/static_page/be_our_student', to: 'static_pages#be_our_student'
        get '/static_page/extension_activity', to: 'static_pages#extension_activity'
        get '/static_page/course_about', to: 'static_pages#course_about'

        resources :category_recommendations,
                  :recommendations,
                  :academics,
                  :professors,
                  :companies,
                  :activities,
                  :activity_professors,
                  :matrices,
                  :faqs,
                  :static_pages,
                  :discipline_monitors,
                  :monitor_types,
                  :trainees do
          get 'page/:page', action: :index, on: :collection
        end
      end
    end
  end
end
