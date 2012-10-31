Scavenger.controllers  do
  layout :main

  get :index do
    render :index
  end

  get :level, :with => :id do
    config = YAML.load_file("config.yml")
    template = config["levels"][params[:id]]

    render :"levels/#{template}"
  end

  get :login do
    if Padrino.env == :development
      redirect "/auth/developer"
    else
      redirect "/auth/github"
    end
  end

  get :logout do
    session.clear

    redirect "/"
  end

  # For development testing
  post "/auth/developer/callback" do
    auth = request.env["omniauth.auth"]
    auth = auth.info
    logger.push(" Developer: #{auth.inspect}", :devel)

    session[:username] = auth["name"]
    session[:email] = auth["email"]

    redirect "/"
  end

  # Github callback
  get "/auth/github/callback" do
    auth = request.env["omniauth.auth"]
    auth = auth.info
    logger.push(" Github: #{auth.inspect}", :devel)


    session["email"] = auth["email"]
    session["username"] = auth["nickname"]

    redirect "/"
  end

  get "/auth/failure" do
    flash[:notice] = params[:message]
    redirect "/"
  end
end
