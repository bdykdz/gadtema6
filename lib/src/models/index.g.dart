// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Picture$ _$$Picture$FromJson(Map<String, dynamic> json) => _$Picture$(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
      promotedAt: json['promoted_at'] == null ? null : DateTime.parse(json['promoted_at'] as String),
      width: json['width'] as int,
      height: json['height'] as int,
      color: json['color'] as String,
      blurHash: json['blur_hash'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      urls: Urls.fromJson(json['urls'] as Map<String, dynamic>),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
      likes: json['likes'] as int,
    );

Map<String, dynamic> _$$Picture$ToJson(_$Picture$ instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'promoted_at': instance.promotedAt?.toIso8601String(),
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'blur_hash': instance.blurHash,
      'user': instance.user,
      'urls': instance.urls,
      'links': instance.links,
      'likes': instance.likes,
    };

_$Urls$ _$$Urls$FromJson(Map<String, dynamic> json) => _$Urls$(
      raw: json['raw'] as String,
      full: json['full'] as String,
      regular: json['regular'] as String,
      small: json['small'] as String,
      thumb: json['thumb'] as String,
      smallS3: json['small_s3'] as String,
    );

Map<String, dynamic> _$$Urls$ToJson(_$Urls$ instance) => <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
      'thumb': instance.thumb,
      'small_s3': instance.smallS3,
    };

_$Links$ _$$Links$FromJson(Map<String, dynamic> json) => _$Links$(
      self: json['self'] as String,
      html: json['html'] as String?,
      download: json['download'] as String?,
      downloadLocation: json['download_location'] as String,
    );

Map<String, dynamic> _$$Links$ToJson(_$Links$ instance) => <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'download': instance.download,
      'download_location': instance.downloadLocation,
    };

_$User$ _$$User$FromJson(Map<String, dynamic> json) => _$User$(
      id: json['id'] as String,
      username: json['username'] as String,
      name: json['name'] as String,
      profileImage: UserProfileImages.fromJson(json['profile_image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$User$ToJson(_$User$ instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'profile_image': instance.profileImage,
    };

_$UserProfileImages$ _$$UserProfileImages$FromJson(Map<String, dynamic> json) => _$UserProfileImages$(
      small: json['small'] as String,
      medium: json['medium'] as String,
      large: json['large'] as String,
    );

Map<String, dynamic> _$$UserProfileImages$ToJson(_$UserProfileImages$ instance) => <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };

_$AppState$ _$$AppState$FromJson(Map<String, dynamic> json) => _$AppState$(
      images: (json['images'] as List<dynamic>?)?.map((e) => Picture.fromJson(e as Map<String, dynamic>)).toList() ??
          const <Picture>[],
      isLoading: json['isLoading'] as bool? ?? false,
      hasMore: json['hasMore'] as bool? ?? true,
      searchTerm: json['searchTerm'] as String? ?? 'Travis Scott',
      page: json['page'] as int? ?? 1,
    );

Map<String, dynamic> _$$AppState$ToJson(_$AppState$ instance) => <String, dynamic>{
      'images': instance.images,
      'isLoading': instance.isLoading,
      'hasMore': instance.hasMore,
      'searchTerm': instance.searchTerm,
      'page': instance.page,
    };
