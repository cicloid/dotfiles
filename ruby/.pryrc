[
 'awesome_print',
 'hirb',
 'bond',
 'interactive_editor',
 'nokogiri',
 'pry-byebug',
 'pry-debugger',
 'pry-stack_explorer',
 'pry-doc',
 'what_methods',
 'wirb'
].each { |lib| begin; require lib; rescue LoadError; end }

if defined? Bundler
  Gem.post_reset_hooks.reject! { |hook| hook.source_location.first =~ %r{/bundler/} }
  Gem::Specification.reset
  warn_level = $VERBOSE
  $VERBOSE = nil
  load 'rubygems/core_ext/kernel_require.rb'
  $VERBOSE = warn_level
end

if ENV['TERM'] == 'xterm'
  Pry.config.color = false
  AwesomePrint.defaults = {
    plain: true,
    sort_keys: true
  }
else
  Pry.config.theme = "monokai"
  Pry.config.ls.heading_color          = :blue
  Pry.config.ls.public_method_color    = :green
  Pry.config.ls.protected_method_color = :yellow
  Pry.config.ls.private_method_color   = :bright_black
  Pry.config.ls.class_constant_color   = :cyan

  AwesomePrint.defaults = {
    plain: true,
    sort_keys: true
  }
end

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

#gem_path = "#{ENV['HOME']}/.rvm/gems/#{`rvm current`.split('@')[0]}@debugging"

{
  c: 'continue',
  s: 'step',
  n: 'next',
  f: 'finish',
  w: 'whereami',
  t: 'hist --tail 50 --no-numbers',
  vi: :edit
}.each { |k, v| begin; Pry.config.commands.alias_command k, v; rescue; end }

Hirb.enable if defined? Hirb
Wirb.start if defined? Wirb

Pry.config.print = proc { |output, value|
  Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)
} if defined? AwesomePrint

Pry.config.prompt_name = File.basename(Dir.pwd)
Pry.config.prompt = Pry::NAV_PROMPT
#Pry::SIMPLE_PROMPT = [proc { "   " }, proc { "   " }]

class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end
