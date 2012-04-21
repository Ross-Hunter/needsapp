class Admin::ConfigurablesController < ApplicationController

	#include ConfigurableEngine::ConfigurablesController

	before_filter :authenticate_admin



end
