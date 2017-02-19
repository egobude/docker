# egobude/elasticsearch:2.4-alpine

Elasticsearch is a powerful open source search and analytics engine that makes data easy to explore.

## Basic usage

```docker run -d -p 9200:9200 -p 9300:9300 egobude/elasticsearch:2.4-alpine``

## Plugins

You can install one or more plugins before startup by passing a comma-separated list of plugins.

```-e PLUGINS=ID[,ID]```

In this example, it will install the Marvel plugin

```-e PLUGINS=elasticsearch/marvel/latest```

Many more plugins are available here: https://www.elastic.co/guide/en/elasticsearch/plugins/5.1/index.html
