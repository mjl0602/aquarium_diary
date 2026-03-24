import 'package:aquarium_diary/database/models/media.dart';
import 'package:aquarium_diary/views/mediaView.dart';
import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:aquarium_diary/database/_isar.dart';
import 'package:aquarium_diary/database/models/creature.dart';
import 'package:aquarium_diary/style/color.dart';
import 'package:aquarium_diary/style/text.dart';
import 'package:aquarium_diary/pages/forms/creature_form_page.dart';

class CreatureDetailPage extends StatefulWidget {
  final Creature creature;

  const CreatureDetailPage({Key? key, required this.creature})
    : super(key: key);

  @override
  _CreatureDetailPageState createState() => _CreatureDetailPageState();
}

class _CreatureDetailPageState extends State<CreatureDetailPage> {
  late Future<List<Media>> _mediaListFuture;
  late Future<Media?> _mainMediaFuture;

  @override
  void initState() {
    super.initState();
    _loadMedia();
  }

  void _loadMedia() {
    _mediaListFuture = isar.medias
        .filter()
        .refTypeEqualTo(RefType.creature)
        .refIdEqualTo(widget.creature.id)
        .sortByCreatedAtDesc()
        .findAll();

    _mainMediaFuture = widget.creature.mainMediaId != null
        ? isar.medias.get(widget.creature.mainMediaId!)
        : Future.value(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Media>>(
        future: _mediaListFuture,
        builder: (context, mediaSnapshot) {
          if (!mediaSnapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final medias = mediaSnapshot.data!;
          final galleryMedias = medias
              .where((m) => m.id != widget.creature.mainMediaId)
              .toList();

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                floating: true,
                pinned: true,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              CreatureFormPage(creature: widget.creature),
                        ),
                      );
                      if (result is Creature && mounted) {
                        setState(() {
                          widget.creature..id = result.id;
                          _loadMedia();
                        });
                      }
                    },
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: FutureBuilder<Media?>(
                    future: _mainMediaFuture,
                    builder: (context, mainMediaSnapshot) {
                      if (!mainMediaSnapshot.hasData) {
                        return Container(color: StColor.lightGray);
                      }
                      return HeaderMedia(media: mainMediaSnapshot.data);
                    },
                  ),
                  collapseMode: CollapseMode.parallax,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StText.big(
                                  widget.creature.speciesName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (widget.creature.nickname != null)
                                  StText.medium(
                                    '（${widget.creature.nickname}）',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                              ],
                            ),
                          ),
                          if (widget.creature.isFavorite)
                            const Icon(Icons.favorite, color: Colors.red),
                        ],
                      ),
                      const SizedBox(height: 16),
                      InfoTags(creature: widget.creature),
                      if (widget.creature.notes != null &&
                          widget.creature.notes!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: StText.medium(
                            '备注：${widget.creature.notes}',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: StText.medium(
                    '照片和视频',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: MediaGrid(medias: galleryMedias),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
            ],
          );
        },
      ),
    );
  }
}

// ====================== 头部主媒体组件 ======================

class HeaderMedia extends StatelessWidget {
  final Media? media;

  const HeaderMedia({Key? key, this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (media == null) {
      return Container(
        height: 300,
        color: StColor.lightGray,
        child: Center(
          child: Icon(
            Icons.image_not_supported,
            size: 64,
            color: Colors.grey[600],
          ),
        ),
      );
    }
    return MediaView(
      media: media!,
      width: double.infinity,
      height: 300,
      fit: BoxFit.cover,
      autoPlay: true,
    );
  }
}

// ====================== 信息标签组件 ======================

class InfoTags extends StatelessWidget {
  final Creature creature;

  const InfoTags({Key? key, required this.creature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> tags = [];

    tags.add(InfoTag(label: '物种', value: creature.speciesName));
    if (creature.nickname != null)
      tags.add(InfoTag(label: '昵称', value: creature.nickname!));
    tags.add(InfoTag(label: '数量', value: '${creature.quantity}'));
    if (creature.sizeCm != null)
      tags.add(InfoTag(label: '尺寸', value: '${creature.sizeCm} cm'));
    tags.add(InfoTag(label: '攻击性', value: creature.aggressiveness.label));
    tags.add(InfoTag(label: '珊瑚兼容性', value: creature.coralCompatibility.label));
    tags.add(InfoTag(label: '状态', value: creature.statusType.label));
    if (creature.entryDate != null)
      tags.add(InfoTag(label: '入缸', value: _formatDate(creature.entryDate!)));
    if (creature.quarantineEndDate != null)
      tags.add(
        InfoTag(label: '检疫到期', value: _formatDate(creature.quarantineEndDate!)),
      );
    if (creature.source != null)
      tags.add(InfoTag(label: '来源', value: creature.source!));
    if (creature.purchaseDate != null)
      tags.add(
        InfoTag(label: '购买日期', value: _formatDate(creature.purchaseDate!)),
      );
    if (creature.totalCost != null)
      tags.add(
        InfoTag(
          label: '总成本',
          value: '¥${creature.totalCost!.toStringAsFixed(2)}',
        ),
      );
    if (creature.tags.isNotEmpty) {
      tags.addAll(creature.tags.map((t) => InfoTag(label: '标签', value: t)));
    }

    return Wrap(spacing: 8, runSpacing: 8, children: tags);
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

class InfoTag extends StatelessWidget {
  final String label;
  final String value;

  const InfoTag({Key? key, required this.label, required this.value})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: StColor.lightGray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: StText.small(
        '$label：$value',
        style: const TextStyle(color: StColor.darkGray),
      ),
    );
  }
}

// ====================== 媒体网格组件（只显示缩略图） ======================

class MediaGrid extends StatelessWidget {
  final List<Media> medias;

  const MediaGrid({Key? key, required this.medias}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (medias.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: const StText.medium('暂无照片或视频'),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 1,
      ),
      itemCount: medias.length,
      itemBuilder: (context, index) {
        final media = medias[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: MediaView(
            media: media,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            autoPlay: false, // 网格内不自动播放
          ),
        );
      },
    );
  }
}
