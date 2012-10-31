Scavenger.controllers  do
  get :index do
    render :index
  end

  get :level, :with => :id do
    config = YAML.load_file('config.yml')
    template = config["levels"][params[:id]]

    render :"levels/#{template}"
  end
end
