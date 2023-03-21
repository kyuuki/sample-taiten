雑 Taiten
=========

[![Build status][shield-build]](#)
[![MIT licensed][shield-license]](#)
[![Rails][shield-rails]][rails]

Rails で Bootstrap を利用した、実用的なサンプルを作成するためのベース

## Table of Contents

* [Technologies](#technologies)
* [How to make](#how-to-make)
* [Usage](#usage)
* [References](#references)
* [License](#license)

## Technologies

* [Rails][rails] 7.0.4.3
* [PostgreSQL][postgresql]
* [Bootstrap][bootstrap] 4.6.2

## How to make

### Rails アプリケーション作成

```sh
$ git clone git@github.com:kyuuki/sample-rails7-practical-base.git sample-rails7-practical-bootstrap
$ cd sample-rails7-practical-bootstrap
```

### GitHub

- GitHub に sample-rails7-practical-bootstrap という名前でリポジトリ追加


```sh
git remote set-url origin git@github.com:kyuuki/sample-rails7-practical-bootstrap.git
git push
```

### Bootstrap 4 導入

以下を参考にして組み込み。

- Bootstrap 4 の [Starter template](https://getbootstrap.com/docs/4.6/getting-started/introduction/#starter-template)
- Bootstrap 4 の [Sticky footer with fixed navbar](https://getbootstrap.com/docs/4.6/examples/sticky-footer-navbar/)

## Usage

```sh
$ git clone git@github.com:kyuuki/sample-rails7-practical-bootstrap.git
$ cd sample-rails7-practical-bootstrap
$ bundle install
$ rails db:create
$ rails s -b 0.0.0.0
```

## References

* [Ruby on Rails Guides (v7.0.x) (英)](https://guides.rubyonrails.org/v7.0/)
* [Ruby on Rails ガイド (日)](https://railsguides.jp/)
* [Bootstrap Documentation (4.6) ](https://getbootstrap.com/docs/4.6/getting-started/introduction/)

## License

This is licensed under the [MIT](https://choosealicense.com/licenses/mit/) license.  
Copyright &copy; 2023 [Fuji Programming Laboratory](https://fuji-labo.com/)



[rails]: https://rubyonrails.org/
[postgresql]: https://www.postgresql.org/
[bootstrap]: https://getbootstrap.com/

[shield-build]: https://img.shields.io/badge/build-passing-brightgreen.svg
[shield-license]: https://img.shields.io/badge/license-MIT-blue.svg
[shield-rails]: https://img.shields.io/badge/-Rails-CC0000.svg?logo=ruby-on-rails&style=flat
