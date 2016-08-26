task default: %w[build]

desc "Launch preview environment"
task :preview => [:buildCV] do
  system "jekyll serve -w"
end # task :preview

desc "Build CV PDF"
task :buildCV do
  system "latexmk Moyer_cv"
  system "mv Moyer_cv.pdf files/"
end # task :buildCV

desc "Build page"
task :build => [:buildCV] do
  system "jekyll build"
end # task :build

desc "Clean up files"
task :clean do
  system "latexmk -c Moyer_cv"
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
