require "crxmake"
require "pathname"

task :all_compile do
  assets_make
  crx_make
end

task :crx do
  crx_make
end

def assets_make
  coffee = "/Users/fuji_seal/.npm/coffee-script/1.4.0/package/bin/coffee" #TODO hard coding
  sh "haml src/popup.haml src/popup.html"
  sh "#{coffee} -c assets/popup.coffee"
  sh "mv assets/popup.js src/javascripts/popup.js"
  sh "#{coffee} -c assets/background.coffee"
  sh "mv assets/background.js src/javascripts/background.js"
  puts "compile haml and coffee"
end

def crx_make
  src = Pathname.new("src")
  out = Pathname.new("pkg/coding_star.crx")
  CrxMake.send(
    :make,
    :ignoredir  => /^\.git$/,
    :verbose    => true,
    :ex_dir     => src,
    :crx_output => out
  )
  puts "create crx"
end

task default: :all_compile
