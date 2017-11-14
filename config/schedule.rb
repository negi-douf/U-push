# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

set :output, "log/cron_log.log"
set :environment, :development

every 1.day, at: "21:30" do
  # Rails 内のメソッド実行例
  runner "PagesController.check"
end

# Learn more: http://github.com/javan/whenever
