class HomeTimelineResponse {
  List<Statuses> statuses;
  bool hasvisible;
  int previousCursor;
  int nextCursor;
  String previousCursorStr;
  String nextCursorStr;
  int totalNumber;
  int interval;
  int uveBlank;
  int sinceId;
  String sinceIdStr;
  int maxId;
  String maxIdStr;
  int hasUnread;

  HomeTimelineResponse(
      {this.statuses,
      this.hasvisible,
      this.previousCursor,
      this.nextCursor,
      this.previousCursorStr,
      this.nextCursorStr,
      this.totalNumber,
      this.interval,
      this.uveBlank,
      this.sinceId,
      this.sinceIdStr,
      this.maxId,
      this.maxIdStr,
      this.hasUnread});

  HomeTimelineResponse.fromJson(Map<String, dynamic> json) {
    if (json['statuses'] != null) {
      statuses = new List<Statuses>();
      json['statuses'].forEach((v) {
        statuses.add(new Statuses.fromJson(v));
      });
    }
    hasvisible = json['hasvisible'];
    previousCursor = json['previous_cursor'];
    nextCursor = json['next_cursor'];
    previousCursorStr = json['previous_cursor_str'];
    nextCursorStr = json['next_cursor_str'];
    totalNumber = json['total_number'];
    interval = json['interval'];
    uveBlank = json['uve_blank'];
    sinceId = json['since_id'];
    sinceIdStr = json['since_id_str'];
    maxId = json['max_id'];
    maxIdStr = json['max_id_str'];
    hasUnread = json['has_unread'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.statuses != null) {
      data['statuses'] = this.statuses.map((v) => v.toJson()).toList();
    }
    data['hasvisible'] = this.hasvisible;
    data['previous_cursor'] = this.previousCursor;
    data['next_cursor'] = this.nextCursor;
    data['previous_cursor_str'] = this.previousCursorStr;
    data['next_cursor_str'] = this.nextCursorStr;
    data['total_number'] = this.totalNumber;
    data['interval'] = this.interval;
    data['uve_blank'] = this.uveBlank;
    data['since_id'] = this.sinceId;
    data['since_id_str'] = this.sinceIdStr;
    data['max_id'] = this.maxId;
    data['max_id_str'] = this.maxIdStr;
    data['has_unread'] = this.hasUnread;
    return data;
  }
}

class Statuses {
  String createdAt;
  int id;
  String idstr;
  String mid;
  bool canEdit;
  int showAdditionalIndication;
  String text;
  int textLength;
  int sourceAllowclick;
  int sourceType;
  String source;
  bool favorited;
  bool truncated;
  String inReplyToStatusId;
  String inReplyToUserId;
  String inReplyToScreenName;
  List<PicUrls> picUrls;
  String thumbnailPic;
  String bmiddlePic;
  String originalPic;
  Geo geo;
  bool isPaid;
  int mblogVipType;
  User user;
  List<Annotations> annotations;
  int repostsCount;
  int commentsCount;
  int attitudesCount;
  int pendingApprovalCount;
  bool isLongText;
  int rewardExhibitionType;
  int hideFlag;
  int mlevel;
  Visible visible;
  int bizFeature;
  int hasActionTypeCard;
  int mblogtype;
  String rid;
  int userType;
  int moreInfoType;
  String cardid;
  int positiveRecomFlag;
  int contentAuth;
  String gifIds;
  int isShowBulletin;
  CommentManageInfo commentManageInfo;
  int picNum;

  Statuses(
      {this.createdAt,
      this.id,
      this.idstr,
      this.mid,
      this.canEdit,
      this.showAdditionalIndication,
      this.text,
      this.textLength,
      this.sourceAllowclick,
      this.sourceType,
      this.source,
      this.favorited,
      this.truncated,
      this.inReplyToStatusId,
      this.inReplyToUserId,
      this.inReplyToScreenName,
      this.picUrls,
      this.thumbnailPic,
      this.bmiddlePic,
      this.originalPic,
      this.geo,
      this.isPaid,
      this.mblogVipType,
      this.user,
      this.annotations,
      this.repostsCount,
      this.commentsCount,
      this.attitudesCount,
      this.pendingApprovalCount,
      this.isLongText,
      this.rewardExhibitionType,
      this.hideFlag,
      this.mlevel,
      this.visible,
      this.bizFeature,
      this.hasActionTypeCard,
      this.mblogtype,
      this.rid,
      this.userType,
      this.moreInfoType,
      this.cardid,
      this.positiveRecomFlag,
      this.contentAuth,
      this.gifIds,
      this.isShowBulletin,
      this.commentManageInfo,
      this.picNum});

  Statuses.fromJson(Map<String, dynamic> json) {
    try {
      createdAt = json['created_at'];
      id = json['id'];
      idstr = json['idstr'];
      mid = json['mid'];
      canEdit = json['can_edit'];
      showAdditionalIndication = json['show_additional_indication'];
      text = json['text'];
      textLength = json['textLength'];
      sourceAllowclick = json['source_allowclick'];
      sourceType = json['source_type'];
      source = json['source'];
      favorited = json['favorited'];
      truncated = json['truncated'];
      inReplyToStatusId = json['in_reply_to_status_id'];
      inReplyToUserId = json['in_reply_to_user_id'];
      inReplyToScreenName = json['in_reply_to_screen_name'];
      thumbnailPic = json['thumbnail_pic'];
      bmiddlePic = json['bmiddle_pic'];
      originalPic = json['original_pic'];
      geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
      isPaid = json['is_paid'];
      mblogVipType = json['mblog_vip_type'];
      repostsCount = json['reposts_count'];
      commentsCount = json['comments_count'];
      attitudesCount = json['attitudes_count'];
      pendingApprovalCount = json['pending_approval_count'];
      isLongText = json['isLongText'];
      rewardExhibitionType = json['reward_exhibition_type'];
      hideFlag = json['hide_flag'];
      mlevel = json['mlevel'];
      bizFeature = json['biz_feature'];
      hasActionTypeCard = json['hasActionTypeCard'];
      mblogtype = json['mblogtype'];
      rid = json['rid'];
      userType = json['userType'];
      moreInfoType = json['more_info_type'];
      cardid = json['cardid'];
      positiveRecomFlag = json['positive_recom_flag'];
      contentAuth = json['content_auth'];
      gifIds = json['gif_ids'];
      isShowBulletin = json['is_show_bulletin'];
      picNum = json['pic_num'];

      user = json['user'] != null ? new User.fromJson(json['user']) : null;
      if (json['annotations'] != null) {
        annotations = new List<Annotations>();
        json['annotations'].forEach((v) {
          annotations.add(new Annotations.fromJson(v));
        });
      }
      if (json['pic_urls'] != null) {
        picUrls = new List<PicUrls>();
        json['pic_urls'].forEach((v) {
          picUrls.add(new PicUrls.fromJson(v));
        });
      }
      visible = json['visible'] != null
          ? new Visible.fromJson(json['visible'])
          : null;
      visible = null;
      commentManageInfo = json['comment_manage_info'] != null
          ? new CommentManageInfo.fromJson(json['comment_manage_info'])
          : null;
    } catch (e) {
      print(e);
      print(json);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['idstr'] = this.idstr;
    data['mid'] = this.mid;
    data['can_edit'] = this.canEdit;
    data['show_additional_indication'] = this.showAdditionalIndication;
    data['text'] = this.text;
    data['textLength'] = this.textLength;
    data['source_allowclick'] = this.sourceAllowclick;
    data['source_type'] = this.sourceType;
    data['source'] = this.source;
    data['favorited'] = this.favorited;
    data['truncated'] = this.truncated;
    data['in_reply_to_status_id'] = this.inReplyToStatusId;
    data['in_reply_to_user_id'] = this.inReplyToUserId;
    data['in_reply_to_screen_name'] = this.inReplyToScreenName;
    if (this.picUrls != null) {
      data['pic_urls'] = this.picUrls.map((v) => v.toJson()).toList();
    }
    data['thumbnail_pic'] = this.thumbnailPic;
    data['bmiddle_pic'] = this.bmiddlePic;
    data['original_pic'] = this.originalPic;
    data['geo'] = this.geo;
    data['is_paid'] = this.isPaid;
    data['mblog_vip_type'] = this.mblogVipType;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.annotations != null) {
      data['annotations'] = this.annotations.map((v) => v.toJson()).toList();
    }
    data['reposts_count'] = this.repostsCount;
    data['comments_count'] = this.commentsCount;
    data['attitudes_count'] = this.attitudesCount;
    data['pending_approval_count'] = this.pendingApprovalCount;
    data['isLongText'] = this.isLongText;
    data['reward_exhibition_type'] = this.rewardExhibitionType;
    data['hide_flag'] = this.hideFlag;
    data['mlevel'] = this.mlevel;
    if (this.visible != null) {
      data['visible'] = this.visible.toJson();
    }
    data['biz_feature'] = this.bizFeature;
    data['hasActionTypeCard'] = this.hasActionTypeCard;
    data['mblogtype'] = this.mblogtype;
    data['rid'] = this.rid;
    data['userType'] = this.userType;
    data['more_info_type'] = this.moreInfoType;
    data['cardid'] = this.cardid;
    data['positive_recom_flag'] = this.positiveRecomFlag;
    data['content_auth'] = this.contentAuth;
    data['gif_ids'] = this.gifIds;
    data['is_show_bulletin'] = this.isShowBulletin;
    if (this.commentManageInfo != null) {
      data['comment_manage_info'] = this.commentManageInfo.toJson();
    }
    data['pic_num'] = this.picNum;
    return data;
  }
}

class PicUrls {
  String thumbnailPic;

  PicUrls({this.thumbnailPic});

  PicUrls.fromJson(Map<String, dynamic> json) {
    thumbnailPic = json['thumbnail_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail_pic'] = this.thumbnailPic;
    return data;
  }
}

class User {
  int id;
  String idstr;
  int classNum;
  String screenName;
  String name;
  String province;
  String city;
  String location;
  String description;
  String url;
  String profileImageUrl;
  String coverImage;
  String coverImagePhone;
  String profileUrl;
  String domain;
  String weihao;
  String gender;
  int followersCount;
  int friendsCount;
  int pagefriendsCount;
  int statusesCount;
  int videoStatusCount;
  int favouritesCount;
  String createdAt;
  bool following;
  bool allowAllActMsg;
  bool geoEnabled;
  bool verified;
  int verifiedType;
  String remark;
  Insecurity insecurity;
  int ptype;
  bool allowAllComment;
  String avatarLarge;
  String avatarHd;
  String verifiedReason;
  String verifiedTrade;
  String verifiedReasonUrl;
  String verifiedSource;
  String verifiedSourceUrl;
  int verifiedState;
  int verifiedLevel;
  int verifiedTypeExt;
  bool hasServiceTel;
  String verifiedReasonModified;
  String verifiedContactName;
  String verifiedContactEmail;
  String verifiedContactMobile;
  bool followMe;
  bool like;
  bool likeMe;
  int onlineStatus;
  int biFollowersCount;
  String lang;
  int star;
  int mbtype;
  int mbrank;
  int blockWord;
  int blockApp;
  String dianping;
  int creditScore;
  int userAbility;
  String cardid;
  int urank;
  int storyReadState;
  int vclubMember;
  int isTeenager;
  int isGuardian;
  int isTeenagerList;
  String tabManage;

  User(
      {this.id,
      this.idstr,
      this.classNum,
      this.screenName,
      this.name,
      this.province,
      this.city,
      this.location,
      this.description,
      this.url,
      this.profileImageUrl,
      this.coverImage,
      this.coverImagePhone,
      this.profileUrl,
      this.domain,
      this.weihao,
      this.gender,
      this.followersCount,
      this.friendsCount,
      this.pagefriendsCount,
      this.statusesCount,
      this.videoStatusCount,
      this.favouritesCount,
      this.createdAt,
      this.following,
      this.allowAllActMsg,
      this.geoEnabled,
      this.verified,
      this.verifiedType,
      this.remark,
      this.insecurity,
      this.ptype,
      this.allowAllComment,
      this.avatarLarge,
      this.avatarHd,
      this.verifiedReason,
      this.verifiedTrade,
      this.verifiedReasonUrl,
      this.verifiedSource,
      this.verifiedSourceUrl,
      this.verifiedState,
      this.verifiedLevel,
      this.verifiedTypeExt,
      this.hasServiceTel,
      this.verifiedReasonModified,
      this.verifiedContactName,
      this.verifiedContactEmail,
      this.verifiedContactMobile,
      this.followMe,
      this.like,
      this.likeMe,
      this.onlineStatus,
      this.biFollowersCount,
      this.lang,
      this.star,
      this.mbtype,
      this.mbrank,
      this.blockWord,
      this.blockApp,
      this.dianping,
      this.creditScore,
      this.userAbility,
      this.cardid,
      this.urank,
      this.storyReadState,
      this.vclubMember,
      this.isTeenager,
      this.isGuardian,
      this.isTeenagerList,
      this.tabManage});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idstr = json['idstr'];
    classNum = json['class_num'];
    screenName = json['screen_name'];
    name = json['name'];
    province = json['province'];
    city = json['city'];
    location = json['location'];
    description = json['description'];
    url = json['url'];
    profileImageUrl = json['profile_image_url'];
    coverImage = json['cover_image'];
    coverImagePhone = json['cover_image_phone'];
    profileUrl = json['profile_url'];
    domain = json['domain'];
    weihao = json['weihao'];
    gender = json['gender'];
    followersCount = json['followers_count'];
    friendsCount = json['friends_count'];
    pagefriendsCount = json['pagefriends_count'];
    statusesCount = json['statuses_count'];
    videoStatusCount = json['video_status_count'];
    favouritesCount = json['favourites_count'];
    createdAt = json['created_at'];
    following = json['following'];
    allowAllActMsg = json['allow_all_act_msg'];
    geoEnabled = json['geo_enabled'];
    verified = json['verified'];
    verifiedType = json['verified_type'];
    remark = json['remark'];
    insecurity = json['insecurity'] != null
        ? new Insecurity.fromJson(json['insecurity'])
        : null;
    ptype = json['ptype'];
    allowAllComment = json['allow_all_comment'];
    avatarLarge = json['avatar_large'];
    avatarHd = json['avatar_hd'];
    verifiedReason = json['verified_reason'];
    verifiedTrade = json['verified_trade'];
    verifiedReasonUrl = json['verified_reason_url'];
    verifiedSource = json['verified_source'];
    verifiedSourceUrl = json['verified_source_url'];
    verifiedState = json['verified_state'];
    verifiedLevel = json['verified_level'];
    verifiedTypeExt = json['verified_type_ext'];
    hasServiceTel = json['has_service_tel'];
    verifiedReasonModified = json['verified_reason_modified'];
    verifiedContactName = json['verified_contact_name'];
    verifiedContactEmail = json['verified_contact_email'];
    verifiedContactMobile = json['verified_contact_mobile'];
    followMe = json['follow_me'];
    like = json['like'];
    likeMe = json['like_me'];
    onlineStatus = json['online_status'];
    biFollowersCount = json['bi_followers_count'];
    lang = json['lang'];
    star = json['star'];
    mbtype = json['mbtype'];
    mbrank = json['mbrank'];
    blockWord = json['block_word'];
    blockApp = json['block_app'];
    dianping = json['dianping'];
    creditScore = json['credit_score'];
    userAbility = json['user_ability'];
    cardid = json['cardid'];
    urank = json['urank'];
    storyReadState = json['story_read_state'];
    vclubMember = json['vclub_member'];
    isTeenager = json['is_teenager'];
    isGuardian = json['is_guardian'];
    isTeenagerList = json['is_teenager_list'];
    tabManage = json['tab_manage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idstr'] = this.idstr;
    data['class_num'] = this.classNum;
    data['screen_name'] = this.screenName;
    data['name'] = this.name;
    data['province'] = this.province;
    data['city'] = this.city;
    data['location'] = this.location;
    data['description'] = this.description;
    data['url'] = this.url;
    data['profile_image_url'] = this.profileImageUrl;
    data['cover_image'] = this.coverImage;
    data['cover_image_phone'] = this.coverImagePhone;
    data['profile_url'] = this.profileUrl;
    data['domain'] = this.domain;
    data['weihao'] = this.weihao;
    data['gender'] = this.gender;
    data['followers_count'] = this.followersCount;
    data['friends_count'] = this.friendsCount;
    data['pagefriends_count'] = this.pagefriendsCount;
    data['statuses_count'] = this.statusesCount;
    data['video_status_count'] = this.videoStatusCount;
    data['favourites_count'] = this.favouritesCount;
    data['created_at'] = this.createdAt;
    data['following'] = this.following;
    data['allow_all_act_msg'] = this.allowAllActMsg;
    data['geo_enabled'] = this.geoEnabled;
    data['verified'] = this.verified;
    data['verified_type'] = this.verifiedType;
    data['remark'] = this.remark;
    if (this.insecurity != null) {
      data['insecurity'] = this.insecurity.toJson();
    }
    data['ptype'] = this.ptype;
    data['allow_all_comment'] = this.allowAllComment;
    data['avatar_large'] = this.avatarLarge;
    data['avatar_hd'] = this.avatarHd;
    data['verified_reason'] = this.verifiedReason;
    data['verified_trade'] = this.verifiedTrade;
    data['verified_reason_url'] = this.verifiedReasonUrl;
    data['verified_source'] = this.verifiedSource;
    data['verified_source_url'] = this.verifiedSourceUrl;
    data['verified_state'] = this.verifiedState;
    data['verified_level'] = this.verifiedLevel;
    data['verified_type_ext'] = this.verifiedTypeExt;
    data['has_service_tel'] = this.hasServiceTel;
    data['verified_reason_modified'] = this.verifiedReasonModified;
    data['verified_contact_name'] = this.verifiedContactName;
    data['verified_contact_email'] = this.verifiedContactEmail;
    data['verified_contact_mobile'] = this.verifiedContactMobile;
    data['follow_me'] = this.followMe;
    data['like'] = this.like;
    data['like_me'] = this.likeMe;
    data['online_status'] = this.onlineStatus;
    data['bi_followers_count'] = this.biFollowersCount;
    data['lang'] = this.lang;
    data['star'] = this.star;
    data['mbtype'] = this.mbtype;
    data['mbrank'] = this.mbrank;
    data['block_word'] = this.blockWord;
    data['block_app'] = this.blockApp;
    data['dianping'] = this.dianping;
    data['credit_score'] = this.creditScore;
    data['user_ability'] = this.userAbility;
    data['cardid'] = this.cardid;
    data['urank'] = this.urank;
    data['story_read_state'] = this.storyReadState;
    data['vclub_member'] = this.vclubMember;
    data['is_teenager'] = this.isTeenager;
    data['is_guardian'] = this.isGuardian;
    data['is_teenager_list'] = this.isTeenagerList;
    data['tab_manage'] = this.tabManage;
    return data;
  }
}

class Insecurity {
  bool sexualContent;

  Insecurity({this.sexualContent});

  Insecurity.fromJson(Map<String, dynamic> json) {
    sexualContent = json['sexual_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sexual_content'] = this.sexualContent;
    return data;
  }
}

class Visible {
  int type;
  int listId;

  Visible({this.type, this.listId});

  Visible.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    listId = json['list_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['list_id'] = this.listId;
    return data;
  }
}

class CommentManageInfo {
  int commentPermissionType;
  int approvalCommentType;

  CommentManageInfo({this.commentPermissionType, this.approvalCommentType});

  CommentManageInfo.fromJson(Map<String, dynamic> json) {
    commentPermissionType = json['comment_permission_type'];
    approvalCommentType = json['approval_comment_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_permission_type'] = this.commentPermissionType;
    data['approval_comment_type'] = this.approvalCommentType;
    return data;
  }
}

class Geo {
  String type;
  List<double> coordinates;

  Geo({this.type, this.coordinates});

  Geo.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Annotations {
  Place place;
  String clientMblogid;

  Annotations({this.place, this.clientMblogid});

  Annotations.fromJson(Map<String, dynamic> json) {
    place = json['place'] != null ? new Place.fromJson(json['place']) : null;
    clientMblogid = json['client_mblogid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.place != null) {
      data['place'] = this.place.toJson();
    }
    data['client_mblogid'] = this.clientMblogid;
    return data;
  }
}

class Place {
  String poiid;
  String title;
  String type;

  Place({this.poiid, this.title, this.type});

  Place.fromJson(Map<String, dynamic> json) {
    poiid = json['poiid'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poiid'] = this.poiid;
    data['title'] = this.title;
    data['type'] = this.type;
    return data;
  }
}
