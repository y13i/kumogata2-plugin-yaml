require "kumogata2"
require "yaml"

class Kumogata2::Plugin::YAML
  Kumogata2::Plugin.register(:yaml, ["yml", "yaml"], self)

  def initialize(options)
    @options = options
  end

  def parse(str)
    YAML.load(str)
  end

  def dump(hash)
    YAML.dump(hash).colorize_as(:yaml)
  end
end
