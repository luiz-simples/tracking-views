# tracking-pages
Tracking Pages

[DEMO](https://tracking-pages.herokuapp.com/)


## How to contribute?

Environment with:

* [RUBY 2.2](http://ruby-doc.org/)
* [RAILS 4.2](http://guides.rubyonrails.org/v4.2/)
* [DOCKER](https://docs.docker.com/)
* [DEBIAN](https://www.debian.org/releases/stable/)


Docker install (only linux environment):

```sh
$ curl -sSL https://get.docker.com/ | sh
```


Make tasks of environment (only docker environment)

* Build docker image - ```$ make build-image```
* Build container (only first build) - ```$ make build-container```
* Attach container (after first build) - ```$ make attach-container```


First steps after environment success (Ruby 2.2)
```sh
rd@dev/rails$ bundle install
rd@dev/rails$ rake test
rd@dev/rails$ puma -p 3000
```
