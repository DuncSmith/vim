# adapted from github.com/mislav/vimfiles
task :default => :link

task :link do
  %w[vimrc gvimrc].each do |script|
    dotfile = File.join(ENV['HOME'], ".#{script}")
    if File.exist?(dotfile) || File.symlink?(dotfile)
      warn "~/.#{script} already exists"
    else
      ln_s File.join('.vim', script), dotfile
    end
  end
end
