Rails 7 実用サンプルベース
==========================

[![Build status][shield-build]](#)
[![MIT licensed][shield-license]](#)
[![Rails][shield-rails]][rails]

Rails で実用的なサンプルを作成するためのベース

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
$ git clone git@github.com:kyuuki/sample-rails7-base.git sample-rails7-practical-base
$ cd sample-rails7-practical-base
```

### GitHub

- GitHub に sample-rails7-practical-base という名前でリポジトリ追加


```sh
git remote set-url origin git@github.com:kyuuki/sample-rails7-practical-base.git
git push
```

### Minitest 導入

- factory_bot 導入
- システムテスト追加

### GitHub Action 設定

- GitHub で Ruby on Rails 用のワークフローを作成
- ワークフローを編集

### 設定ファイル追加

- config/setting.yml 作成
- config/setting.yml を設定ファイルとして読み込むようにする
- ルートページで設定ファイルの内容を表示

### dotenv 導入

- Gem 追加
- config/credentials.yml.enc 削除

### Slim 導入

- Gem 追加
- ルートページを Slim 化

## Usage

```sh
$ git clone git@github.com:kyuuki/sample-rails7-practical-base.git
$ cd sample-rails7-practical-base
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
