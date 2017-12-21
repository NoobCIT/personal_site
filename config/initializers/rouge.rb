require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class CustomHtml < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end
