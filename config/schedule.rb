# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

set :output, "/path/to/my/cron_log.log"

every 1.day, at: '12:00' do
  # Rails 内のメソッド実行例
  runner 'PagesController.check'
end

# Learn more: http://github.com/javan/whenever
