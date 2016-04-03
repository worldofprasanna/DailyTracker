# frozen_string_literal: true
require 'rake/packagetask'

task :delete_pkg do
  FileUtils.rm_rf('pkg')
end

Rake::PackageTask.new('thegoodtracker', Rails.env) do |p|
  Rake::Task['delete_pkg'].invoke

  p.need_zip = true
  p.package_files = FileList['*', '**/*']
  p.package_files.exclude('.git', 'pkg/*', '.project', '.settings', '.gitignore', 'data/store/*', 'docs', 'docs/*')
end
