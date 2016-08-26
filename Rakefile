task default: %w[build]

desc "Launch preview environment"
task :preview do
  system "latexmk Moyer_cv"
  system "mv Moyer_cv.pdf files/"
  system "jekyll serve -w"
end # task :preview

desc "Build page"
task :build do
  system "latexmk -outdir=files Moyer_cv"
  system "jekyll build"
end # task :build

desc "Clean up files"
task :clean do
  system "latexmk -c Moyer_cv"
  system "jekyll clean"
end

def ask(message, valid_options)
  if valid_options
    answer = get_stdin("#{message} #{valid_options.to_s.gsub(/"/, '').gsub(/, /,'/')} ") while !valid_options.include?(answer)
  else
    answer = get_stdin(message)
  end
  answer
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
end
