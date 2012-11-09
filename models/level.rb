class Level < Struct.new(:name)

  def template
    return "../../levels/#{self.name}/index.erb"
  end

  def self.get name
    config = YAML.load_file("config.yml")

    # TODO(icco): Remove
    return Level.new name
  end

  def self.all
    config = YAML.load_file("config.yml")
    return config["levels"]
  end
end
