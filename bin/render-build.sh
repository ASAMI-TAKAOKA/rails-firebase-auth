#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Starting bundle install..."
bundle install
echo "Bundle install completed."

echo "Precompiling assets..."
bundle exec rake assets:precompile
echo "Assets precompiled."

echo "Cleaning assets..."
bundle exec rake assets:clean
echo "Assets cleaned."

echo "Running migrations..."
bundle exec rake db:migrate
echo "Migrations completed."

echo "Seeding database..."
bundle exec rails db:seed
echo "Database seeding completed."

# 参考:
# https://qiita.com/hashioga2017/items/b69cb070c0073e9c26c7
# https://memorandums.hatenablog.com/entry/2023/01/17/211750