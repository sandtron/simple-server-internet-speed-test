rm -rf speedtest
git clone https://github.com/sandtron/speedtest.git
bundle install --without development test
APP_ENV=:production ruby main.rb
