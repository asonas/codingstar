require "crxmake"
require "pathname"

task :crx do
  coffee = "/Users/fuji_seal/.npm/coffee-script/1.4.0/package/bin/coffee" #TODO hard coding
  sh "haml src/popup.haml src/popup.html"
  sh "#{coffee} -c src/javascripts/popup.coffee"
  sh "#{coffee} -c src/javascripts/background.coffee"
  puts "compile haml and coffee"

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

task default: :crx
