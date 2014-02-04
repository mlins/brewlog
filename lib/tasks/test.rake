namespace :test do
  Rake::TestTask.new(:services) do |t|
    t.libs << "test"
    t.pattern = 'test/services/**/*_test.rb'
  end
end

Rake::Task[:test].enhance { Rake::Task["test:services"].invoke }
