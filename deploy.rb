base = File.dirname(File.expand_path(__FILE__))
hostname = `hostname`.chop

files = Dir['*'] - ["locals", "deploy.rb"]

home = ENV["HOME"]

def exists?(path)
  File.exists?(path)or File.symlink?(path)or File.directory?(path)
end

def recreate_symlink(input, output)
  File.delete(output) if exists? output

  puts "#{input} -> #{output}"
  File.symlink(input, output)
end

files.each do |file|
  input = File.join(base, file)
  output = File.join(home, "." + file)

  recreate_symlink(input, output)
end
