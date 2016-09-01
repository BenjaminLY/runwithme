# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
DEFAULT_META = YAML.load_file(Rails.root.join('config/meta.yml'))
