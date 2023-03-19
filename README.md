Rails 7 サンプルベース
======================

[![Build status][shield-build]](#)
[![MIT licensed][shield-license]](#)
[![Rails][shield-rails]][rails]

Rails サンプルを作成するためのベース

## Table of Contents

* [Technologies](#technologies)
* [How to make](#how-to-make)
* [Usage](#usage)
* [References](#references)
* [License](#license)

## Technologies

* [Rails][rails] 7.0.4.3
* [PostgreSQL][postgresql]

## How to make

### Rails アプリケーション作成

```sh
$ rails _7.0.4.3_ new sample-rails7-base -d postgresql --skip-hotwire
$ cd sample-rails7-base
$ git add .
$ git commit -m "Initial commit"
```

### GitHub

- GitHub に sample-rails7-base という名前でリポジトリ追加


```sh
$ git remote add origin git@github.com:kyuuki/sample-rails7-base.git
$ git branch -M main
$ git push -u origin main
```

### データベース設定変更

- データベース設定ファイル [config/database.yml](config/database.yml) を変更

### 開発用にホスト認証を無効にする

- [config/environments/development.rb](config/environments/development.rb) に `config.hosts.clear` を追加

### RuboCop 導入

- Gemfile に RuboCop 関連の Gem を追加
- RuboCop 用設定ファイル [.rubocop.yml](.rubocop.yml) を作成

### ルートページ作成

- [config/routes.rb](config/routes.rb) を編集

```ruby
Rails.application.routes.draw do
  ...
  root 'static_page#root'
  ...
end
```

- [app/controllers/static_page_controller.rb](app/controllers/static_page_controller.rb) を作成

```ruby
class StaticPageController < ApplicationController
  def root
    # render :root  # これが省略されている
  end
end
```

- [app/views/static_page/root.html.erb](app/views/static_page/root.html.erb) を作成

```erb
<h1>ルートページ</h1>

<p>
  ルートページの内容。
</p>
```

## Usage

```sh
$ git clone git@github.com:kyuuki/sample-rails7-base.git
$ cd sample-rails7-base
$ bundle install
$ rails db:create
$ rails s -b 0.0.0.0
```

## References

* [Ruby on Rails Guides (v7.0.x) (英)](https://guides.rubyonrails.org/v7.0/)
* [Ruby on Rails ガイド (日)](https://railsguides.jp/)

## License

This is licensed under the [MIT](https://choosealicense.com/licenses/mit/) license.  
Copyright &copy; 2023 [Fuji Programming Laboratory](https://fuji-labo.com/)



[rails]: https://rubyonrails.org/
[postgresql]: https://www.postgresql.org/

[shield-build]: https://img.shields.io/badge/build-passing-brightgreen.svg
[shield-license]: https://img.shields.io/badge/license-MIT-blue.svg
[shield-rails]: https://img.shields.io/badge/-Rails-CC0000.svg?logo=ruby-on-rails&style=flat
