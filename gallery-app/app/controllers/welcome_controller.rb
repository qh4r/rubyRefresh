# rails generate controller welcome index
# generuje takze route i widok

#potem generacja w user.rb i   migracje

# rails generate bootstrap:install static
# rails generate bootstrap:layout application
# rails generate devise:views:locale pl
# rails g devise:views:bootstrap_templates

class WelcomeController < ApplicationController
  # skip tego co ejst zdefiniowane w ApplicationControllerze
  skip_before_action :authenticate_user!, only: [:index]
  def index
  end
end
