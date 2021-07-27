rm -rf speedtest
git clone https://github.com/sandtron/speedtest.git
bundle install
APP_ENV=:production ruby main.rb
