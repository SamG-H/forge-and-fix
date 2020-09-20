class SignedInController < ApplicationController
  before_action :redirect_to_signin?, except: [:index, :show]
end