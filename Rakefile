require "ptools"

task default: %w[build]

desc "Launch preview environment"
task :preview => [:build] do
  system "bundle exec jekyll serve -w"
end # task :preview

desc "Build page"
task :build do
  system "./build_cv.sh"
  system "bundle exec jekyll build"
end # task :build

desc "Clean up files"
task :clean do
  system "rm -rf latex.out pubs_tex.md pubs.tex activities.tex activites.md pubs.md"
  system "bundle exec jekyll clean"
end # task :clean

def ask(message, valid_options)
  if valid_options
    answer = get_stdin("#{message} #{valid_options.to_s.gsub(/"/, '').gsub(/, /,'/')} ") while !valid_options.include?(answer)
  else
    answer = get_stdin(message)
  end
  answer
end # def ask

def get_stdin(message)
  print message
  STDIN.gets.chomp
end # def get_stdin
