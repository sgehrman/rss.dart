# rss.dart

This is a fork of https://github.com/sudame/dart-rss (which itself is a fork of https://github.com/witochandra/webfeed) :fork_and_knife: :fork_and_knife: that is updated for Dart 3.

We publish this updated package under rss_dart.

A dart package for parsing RSS1.0 / RSS2.0 / Atom feed.

### Features

- [x] RSS 1.0
- [x] RSS 2.0
- [x] Atom
- [x] Namespaces
  - [x] Media RSS
  - [x] Dublin Core
  - [x] Podcast

### Installing

Add this line into your `pubspec.yaml`

```
rss_dart: ^1.0.8
```

Import the package into your dart code using:

```
import 'package:rss_dart_fixed/dart_rss.dart';
```

### Example

To parse string into `RssFeed` object use:

```
var rssFeed = new RssFeed.parse(xmlString); // for parsing RSS 2.0 feed
var atomFeed = new AtomFeed.parse(xmlString); // for parsing Atom feed
var rss1Feed = new Rss1Feed.parse(xmlString); // for parsing RSS 1.0 feed
```

### Preview

**RSS**

```
feed.title
feed.description
feed.link
feed.author
feed.items
feed.image
feed.cloud
feed.categories
feed.skipDays
feed.skipHours
feed.lastBuildDate
feed.language
feed.generator
feed.copyright
feed.docs
feed.managingEditor
feed.rating
feed.medium
feed.webMaster
feed.ttl
feed.dc

RssItem item = feed.items.first;
item.title
item.description
item.link
item.categories
item.guid
item.pubDate
item.author
item.comments
item.source
item.media
item.enclosure
item.dc
```

**Atom**

```
feed.id
feed.title
feed.updated
feed.items
feed.links
feed.authors
feed.contributors
feed.categories
feed.generator
feed.icon
feed.logo
feed.rights
feed.subtitle

AtomItem item = feed.items.first;
item.id
item.title
item.updated
item.authors
item.links
item.categories
item.contributors
item.source
item.published
item.content
item.summary
item.rights
item.media
```

**RSS 1.0**

```
feed.title
feed.description
feed.link
feed.items
feed.image
feed.updatePeriod
feed.updateFrequency
feed.updateBase
feed.dc

Rss1Item item = feed.items.first;
item.title
item.description
item.link
item.dc
item.content
```

## License

rss_dart is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details

## Thanks

This package is forked from [WebFeed](https://pub.dev/packages/webfeed) and dart_rss.
