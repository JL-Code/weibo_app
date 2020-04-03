import 'home_timeline_response.dart' show User;

class CommentResponse {
  List<Comments> comments;
  bool hasvisible;
  int previousCursor;
  int nextCursor;
  String previousCursorStr;
  String nextCursorStr;
  int totalNumber;
  int sinceId;
  int maxId;
  String sinceIdStr;
  String maxIdStr;
  Status status;

  CommentResponse(
      {this.comments,
      this.hasvisible,
      this.previousCursor,
      this.nextCursor,
      this.previousCursorStr,
      this.nextCursorStr,
      this.totalNumber,
      this.sinceId,
      this.maxId,
      this.sinceIdStr,
      this.maxIdStr,
      this.status});

  CommentResponse.fromJson(Map<String, dynamic> json) {
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    hasvisible = json['hasvisible'];
    previousCursor = json['previous_cursor'];
    nextCursor = json['next_cursor'];
    previousCursorStr = json['previous_cursor_str'];
    nextCursorStr = json['next_cursor_str'];
    totalNumber = json['total_number'];
    sinceId = json['since_id'];
    maxId = json['max_id'];
    sinceIdStr = json['since_id_str'];
    maxIdStr = json['max_id_str'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['hasvisible'] = this.hasvisible;
    data['previous_cursor'] = this.previousCursor;
    data['next_cursor'] = this.nextCursor;
    data['previous_cursor_str'] = this.previousCursorStr;
    data['next_cursor_str'] = this.nextCursorStr;
    data['total_number'] = this.totalNumber;
    data['since_id'] = this.sinceId;
    data['max_id'] = this.maxId;
    data['since_id_str'] = this.sinceIdStr;
    data['max_id_str'] = this.maxIdStr;
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    return data;
  }
}

class Comments {
  String createdAt;
  int id;
  int rootid;
  String rootidstr;
  int floorNumber;
  String text;
  int disableReply;
  User user;
  String mid;
  String idstr;
  Status status;
  String readtimetype;

  Comments(
      {this.createdAt,
      this.id,
      this.rootid,
      this.rootidstr,
      this.floorNumber,
      this.text,
      this.disableReply,
      this.user,
      this.mid,
      this.idstr,
      this.status,
      this.readtimetype});

  Comments.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    id = json['id'];
    rootid = json['rootid'];
    rootidstr = json['rootidstr'];
    floorNumber = json['floor_number'];
    text = json['text'];
    disableReply = json['disable_reply'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    mid = json['mid'];
    idstr = json['idstr'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    readtimetype = json['readtimetype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['rootid'] = this.rootid;
    data['rootidstr'] = this.rootidstr;
    data['floor_number'] = this.floorNumber;
    data['text'] = this.text;
    data['disable_reply'] = this.disableReply;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['mid'] = this.mid;
    data['idstr'] = this.idstr;
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    data['readtimetype'] = this.readtimetype;
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

class Status {
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
  Null geo;
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
  int userType;
  int moreInfoType;
  String cardid;
  int positiveRecomFlag;
  int contentAuth;
  String gifIds;
  int isShowBulletin;
  CommentManageInfo commentManageInfo;
  int picNum;

  Status(
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
      this.userType,
      this.moreInfoType,
      this.cardid,
      this.positiveRecomFlag,
      this.contentAuth,
      this.gifIds,
      this.isShowBulletin,
      this.commentManageInfo,
      this.picNum});

  Status.fromJson(Map<String, dynamic> json) {
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
    if (json['pic_urls'] != null) {
      picUrls = new List<PicUrls>();
      json['pic_urls'].forEach((v) {
        picUrls.add(new PicUrls.fromJson(v));
      });
    }
    thumbnailPic = json['thumbnail_pic'];
    bmiddlePic = json['bmiddle_pic'];
    originalPic = json['original_pic'];
    geo = json['geo'];
    isPaid = json['is_paid'];
    mblogVipType = json['mblog_vip_type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['annotations'] != null) {
      annotations = new List<Annotations>();
      json['annotations'].forEach((v) {
        annotations.add(new Annotations.fromJson(v));
      });
    }
    repostsCount = json['reposts_count'];
    commentsCount = json['comments_count'];
    attitudesCount = json['attitudes_count'];
    pendingApprovalCount = json['pending_approval_count'];
    isLongText = json['isLongText'];
    rewardExhibitionType = json['reward_exhibition_type'];
    hideFlag = json['hide_flag'];
    mlevel = json['mlevel'];
    visible =
        json['visible'] != null ? new Visible.fromJson(json['visible']) : null;
    bizFeature = json['biz_feature'];
    hasActionTypeCard = json['hasActionTypeCard'];
    mblogtype = json['mblogtype'];
    userType = json['userType'];
    moreInfoType = json['more_info_type'];
    cardid = json['cardid'];
    positiveRecomFlag = json['positive_recom_flag'];
    contentAuth = json['content_auth'];
    gifIds = json['gif_ids'];
    isShowBulletin = json['is_show_bulletin'];
    commentManageInfo = json['comment_manage_info'] != null
        ? new CommentManageInfo.fromJson(json['comment_manage_info'])
        : null;
    picNum = json['pic_num'];
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

class Annotations {
  String uid;
  bool withVideo;
  String itemId;
  int time;
  String type;

  Annotations({this.uid, this.withVideo, this.itemId, this.time, this.type});

  Annotations.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    withVideo = json['with_video'];
    itemId = json['item_id'];
    time = json['time'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['with_video'] = this.withVideo;
    data['item_id'] = this.itemId;
    data['time'] = this.time;
    data['type'] = this.type;
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
