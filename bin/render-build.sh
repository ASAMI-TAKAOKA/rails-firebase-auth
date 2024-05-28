#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rails db:seed
bundle exec rake db:migrate
# DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:migrate:reset # デプロイの際にデータベースをリセット。 # 一度リセットしたらコメントアウトしてbundle exec rake db:migrateとbundle exec rails db:seedを元に戻すこと！

# 参考:
# https://qiita.com/hashioga2017/items/b69cb070c0073e9c26c7
# https://memorandums.hatenablog.com/entry/2023/01/17/211750