require "ptools"

task default: %w[build]

desc "Launch preview environment"
task :preview do
  system "jekyll serve -w"
end # task :preview

desc "Build CV PDF"
task :buildCV do
  system "cd files; latexrun --bibtex-cmd biber Moyer_cv.tex"
end # task :buildCV

desc "Build page"
task :build => [:buildCV] do
  system "jekyll build"
end # task :build

desc "Clean up files"
task :clean do
  system "cd files; latexrun --clean-all"
  system "jekyll clean"
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
