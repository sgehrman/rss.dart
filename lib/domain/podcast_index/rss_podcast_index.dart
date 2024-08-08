import 'package:rss_dart_fixed/domain/podcast_index/rss_podcast_index_block.dart';
import 'package:rss_dart_fixed/domain/podcast_index/rss_podcast_index_funding.dart';
import 'package:rss_dart_fixed/domain/podcast_index/rss_podcast_index_license.dart';
import 'package:rss_dart_fixed/domain/podcast_index/rss_podcast_index_person.dart';
import 'package:rss_dart_fixed/domain/podcast_index/rss_podcast_index_remote_item.dart';
import 'package:rss_dart_fixed/domain/podcast_index/rss_podcast_index_value.dart';
import 'package:rss_dart_fixed/domain/podcast_index/rss_podcast_index_locked.dart';
import 'package:rss_dart_fixed/util/helpers.dart';
import 'package:xml/xml.dart';

class RssPodcastIndex {
  final String? guid;
  final List<RssPodcastIndexFunding?>? funding;
  final List<RssPodcastIndexPerson?>? persons;
  final List<RssPodcastIndexValue?>? value;
  final List<RssPodcastIndexBlock?>? block;
  final List<RssPodcastIndexRemoteItem?>? remoteItem;
  final RssPodcastIndexLocked? locked;
  final RssPodcastIndexLicense? license;
  final String? medium;

  RssPodcastIndex({
    this.guid,
    this.funding,
    this.persons,
    this.value,
    this.locked,
    this.block,
    this.license,
    this.medium,
    this.remoteItem,
  });

  static RssPodcastIndex? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }

    return RssPodcastIndex(
      guid: findElementOrNull(element, 'podcast:guid')?.innerText,
      funding: element.findElements('podcast:funding').map((e) {
        return RssPodcastIndexFunding.parse(e);
      }).toList(),
      persons: element.findElements('podcast:person').map((e) {
        return RssPodcastIndexPerson.parse(e);
      }).toList(),
      remoteItem: element.findElements('podcast:remoteItem').map((e) {
        return RssPodcastIndexRemoteItem.parse(e);
      }).toList(),
      value: element
          .findElements('podcast:value')
          .map((element) => RssPodcastIndexValue.parse(element))
          .toList(),
      block: element
          .findElements('podcast:block')
          .map((element) => RssPodcastIndexBlock.parse(element))
          .toList(),
      locked: RssPodcastIndexLocked.parse(
        findElementOrNull(element, 'podcast:locked'),
      ),
      license: RssPodcastIndexLicense.parse(
        findElementOrNull(element, 'podcast:license'),
      ),
      medium: findElementOrNull(element, 'podcast:medium')?.innerText,
    );
  }
}
