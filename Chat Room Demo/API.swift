//  This file was automatically generated and should not be edited.

import AWSAppSync

public final class PostMsgMutation: GraphQLMutation {
  public static let operationString =
    "mutation PostMsg($msgId: Int!, $room: String!, $msg: String!) {\n  postMsg(msgId: $msgId, room: $room, msg: $msg) {\n    __typename\n    msgId\n    room\n    upDate\n    from\n    msg\n    count\n  }\n}"

  public var msgId: Int
  public var room: String
  public var msg: String

  public init(msgId: Int, room: String, msg: String) {
    self.msgId = msgId
    self.room = room
    self.msg = msg
  }

  public var variables: GraphQLMap? {
    return ["msgId": msgId, "room": room, "msg": msg]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("postMsg", arguments: ["msgId": GraphQLVariable("msgId"), "room": GraphQLVariable("room"), "msg": GraphQLVariable("msg")], type: .nonNull(.object(PostMsg.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(postMsg: PostMsg) {
      self.init(snapshot: ["__typename": "Mutation", "postMsg": postMsg.snapshot])
    }

    public var postMsg: PostMsg {
      get {
        return PostMsg(snapshot: snapshot["postMsg"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "postMsg")
      }
    }

    public struct PostMsg: GraphQLSelectionSet {
      public static let possibleTypes = ["Msg"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("msgId", type: .nonNull(.scalar(Int.self))),
        GraphQLField("room", type: .nonNull(.scalar(String.self))),
        GraphQLField("upDate", type: .scalar(String.self)),
        GraphQLField("from", type: .scalar(String.self)),
        GraphQLField("msg", type: .scalar(String.self)),
        GraphQLField("count", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(msgId: Int, room: String, upDate: String? = nil, from: String? = nil, msg: String? = nil, count: Int? = nil) {
        self.init(snapshot: ["__typename": "Msg", "msgId": msgId, "room": room, "upDate": upDate, "from": from, "msg": msg, "count": count])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var msgId: Int {
        get {
          return snapshot["msgId"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "msgId")
        }
      }

      public var room: String {
        get {
          return snapshot["room"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "room")
        }
      }

      public var upDate: String? {
        get {
          return snapshot["upDate"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "upDate")
        }
      }

      public var from: String? {
        get {
          return snapshot["from"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "from")
        }
      }

      public var msg: String? {
        get {
          return snapshot["msg"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "msg")
        }
      }

      public var count: Int? {
        get {
          return snapshot["count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "count")
        }
      }
    }
  }
}

public final class CreateRoomMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateRoom($room: String!) {\n  createRoom(room: $room)\n}"

  public var room: String

  public init(room: String) {
    self.room = room
  }

  public var variables: GraphQLMap? {
    return ["room": room]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createRoom", arguments: ["room": GraphQLVariable("room")], type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createRoom: String) {
      self.init(snapshot: ["__typename": "Mutation", "createRoom": createRoom])
    }

    public var createRoom: String {
      get {
        return snapshot["createRoom"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "createRoom")
      }
    }
  }
}

public final class AsignUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation AsignUser($user: String!, $room: String!) {\n  asignUser(user: $user, room: $room) {\n    __typename\n    user\n    room\n  }\n}"

  public var user: String
  public var room: String

  public init(user: String, room: String) {
    self.user = user
    self.room = room
  }

  public var variables: GraphQLMap? {
    return ["user": user, "room": room]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("asignUser", arguments: ["user": GraphQLVariable("user"), "room": GraphQLVariable("room")], type: .nonNull(.object(AsignUser.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(asignUser: AsignUser) {
      self.init(snapshot: ["__typename": "Mutation", "asignUser": asignUser.snapshot])
    }

    public var asignUser: AsignUser {
      get {
        return AsignUser(snapshot: snapshot["asignUser"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "asignUser")
      }
    }

    public struct AsignUser: GraphQLSelectionSet {
      public static let possibleTypes = ["RoomEntry"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("room", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(user: String, room: String) {
        self.init(snapshot: ["__typename": "RoomEntry", "user": user, "room": room])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var room: String {
        get {
          return snapshot["room"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "room")
        }
      }
    }
  }
}

public final class GetPageQuery: GraphQLQuery {
  public static let operationString =
    "query GetPage($room: String!, $token: String!) {\n  getPage(room: $room, token: $token) {\n    __typename\n    items {\n      __typename\n      msgId\n      room\n      upDate\n      from\n      msg\n      count\n    }\n    scannedCount\n    nextToken\n  }\n}"

  public var room: String
  public var token: String

  public init(room: String, token: String) {
    self.room = room
    self.token = token
  }

  public var variables: GraphQLMap? {
    return ["room": room, "token": token]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getPage", arguments: ["room": GraphQLVariable("room"), "token": GraphQLVariable("token")], type: .nonNull(.object(GetPage.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getPage: GetPage) {
      self.init(snapshot: ["__typename": "Query", "getPage": getPage.snapshot])
    }

    public var getPage: GetPage {
      get {
        return GetPage(snapshot: snapshot["getPage"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "getPage")
      }
    }

    public struct GetPage: GraphQLSelectionSet {
      public static let possibleTypes = ["MsgPage"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("scannedCount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, scannedCount: Int, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "MsgPage", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "scannedCount": scannedCount, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var scannedCount: Int {
        get {
          return snapshot["scannedCount"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "scannedCount")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Msg"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("msgId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("room", type: .nonNull(.scalar(String.self))),
          GraphQLField("upDate", type: .scalar(String.self)),
          GraphQLField("from", type: .scalar(String.self)),
          GraphQLField("msg", type: .scalar(String.self)),
          GraphQLField("count", type: .scalar(Int.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(msgId: Int, room: String, upDate: String? = nil, from: String? = nil, msg: String? = nil, count: Int? = nil) {
          self.init(snapshot: ["__typename": "Msg", "msgId": msgId, "room": room, "upDate": upDate, "from": from, "msg": msg, "count": count])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var msgId: Int {
          get {
            return snapshot["msgId"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "msgId")
          }
        }

        public var room: String {
          get {
            return snapshot["room"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "room")
          }
        }

        public var upDate: String? {
          get {
            return snapshot["upDate"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "upDate")
          }
        }

        public var from: String? {
          get {
            return snapshot["from"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "from")
          }
        }

        public var msg: String? {
          get {
            return snapshot["msg"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "msg")
          }
        }

        public var count: Int? {
          get {
            return snapshot["count"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "count")
          }
        }
      }
    }
  }
}

public final class GetMsgQuery: GraphQLQuery {
  public static let operationString =
    "query GetMsg($msgId: Int!, $room: String!) {\n  getMsg(msgId: $msgId, room: $room) {\n    __typename\n    msgId\n    room\n    upDate\n    from\n    msg\n    count\n  }\n}"

  public var msgId: Int
  public var room: String

  public init(msgId: Int, room: String) {
    self.msgId = msgId
    self.room = room
  }

  public var variables: GraphQLMap? {
    return ["msgId": msgId, "room": room]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getMsg", arguments: ["msgId": GraphQLVariable("msgId"), "room": GraphQLVariable("room")], type: .nonNull(.object(GetMsg.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getMsg: GetMsg) {
      self.init(snapshot: ["__typename": "Query", "getMsg": getMsg.snapshot])
    }

    public var getMsg: GetMsg {
      get {
        return GetMsg(snapshot: snapshot["getMsg"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "getMsg")
      }
    }

    public struct GetMsg: GraphQLSelectionSet {
      public static let possibleTypes = ["Msg"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("msgId", type: .nonNull(.scalar(Int.self))),
        GraphQLField("room", type: .nonNull(.scalar(String.self))),
        GraphQLField("upDate", type: .scalar(String.self)),
        GraphQLField("from", type: .scalar(String.self)),
        GraphQLField("msg", type: .scalar(String.self)),
        GraphQLField("count", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(msgId: Int, room: String, upDate: String? = nil, from: String? = nil, msg: String? = nil, count: Int? = nil) {
        self.init(snapshot: ["__typename": "Msg", "msgId": msgId, "room": room, "upDate": upDate, "from": from, "msg": msg, "count": count])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var msgId: Int {
        get {
          return snapshot["msgId"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "msgId")
        }
      }

      public var room: String {
        get {
          return snapshot["room"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "room")
        }
      }

      public var upDate: String? {
        get {
          return snapshot["upDate"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "upDate")
        }
      }

      public var from: String? {
        get {
          return snapshot["from"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "from")
        }
      }

      public var msg: String? {
        get {
          return snapshot["msg"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "msg")
        }
      }

      public var count: Int? {
        get {
          return snapshot["count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "count")
        }
      }
    }
  }
}

public final class GetRoomsQuery: GraphQLQuery {
  public static let operationString =
    "query GetRooms {\n  getRooms {\n    __typename\n    items {\n      __typename\n      user\n      room\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getRooms", type: .object(GetRoom.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getRooms: GetRoom? = nil) {
      self.init(snapshot: ["__typename": "Query", "getRooms": getRooms.flatMap { $0.snapshot }])
    }

    public var getRooms: GetRoom? {
      get {
        return (snapshot["getRooms"] as? Snapshot).flatMap { GetRoom(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getRooms")
      }
    }

    public struct GetRoom: GraphQLSelectionSet {
      public static let possibleTypes = ["Rooms"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil) {
        self.init(snapshot: ["__typename": "Rooms", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["RoomEntry"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user", type: .nonNull(.scalar(String.self))),
          GraphQLField("room", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(user: String, room: String) {
          self.init(snapshot: ["__typename": "RoomEntry", "user": user, "room": room])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var user: String {
          get {
            return snapshot["user"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "user")
          }
        }

        public var room: String {
          get {
            return snapshot["room"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "room")
          }
        }
      }
    }
  }
}

public final class PostMsgSubSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription PostMsgSub($room: String!) {\n  postMsgSub(room: $room) {\n    __typename\n    msgId\n    room\n    upDate\n    from\n    msg\n    count\n  }\n}"

  public var room: String

  public init(room: String) {
    self.room = room
  }

  public var variables: GraphQLMap? {
    return ["room": room]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("postMsgSub", arguments: ["room": GraphQLVariable("room")], type: .object(PostMsgSub.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(postMsgSub: PostMsgSub? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "postMsgSub": postMsgSub.flatMap { $0.snapshot }])
    }

    public var postMsgSub: PostMsgSub? {
      get {
        return (snapshot["postMsgSub"] as? Snapshot).flatMap { PostMsgSub(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "postMsgSub")
      }
    }

    public struct PostMsgSub: GraphQLSelectionSet {
      public static let possibleTypes = ["Msg"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("msgId", type: .nonNull(.scalar(Int.self))),
        GraphQLField("room", type: .nonNull(.scalar(String.self))),
        GraphQLField("upDate", type: .scalar(String.self)),
        GraphQLField("from", type: .scalar(String.self)),
        GraphQLField("msg", type: .scalar(String.self)),
        GraphQLField("count", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(msgId: Int, room: String, upDate: String? = nil, from: String? = nil, msg: String? = nil, count: Int? = nil) {
        self.init(snapshot: ["__typename": "Msg", "msgId": msgId, "room": room, "upDate": upDate, "from": from, "msg": msg, "count": count])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var msgId: Int {
        get {
          return snapshot["msgId"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "msgId")
        }
      }

      public var room: String {
        get {
          return snapshot["room"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "room")
        }
      }

      public var upDate: String? {
        get {
          return snapshot["upDate"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "upDate")
        }
      }

      public var from: String? {
        get {
          return snapshot["from"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "from")
        }
      }

      public var msg: String? {
        get {
          return snapshot["msg"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "msg")
        }
      }

      public var count: Int? {
        get {
          return snapshot["count"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "count")
        }
      }
    }
  }
}

public final class AsignUserSubSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription AsignUserSub($user: String!) {\n  asignUserSub(user: $user) {\n    __typename\n    user\n    room\n  }\n}"

  public var user: String

  public init(user: String) {
    self.user = user
  }

  public var variables: GraphQLMap? {
    return ["user": user]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("asignUserSub", arguments: ["user": GraphQLVariable("user")], type: .object(AsignUserSub.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(asignUserSub: AsignUserSub? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "asignUserSub": asignUserSub.flatMap { $0.snapshot }])
    }

    public var asignUserSub: AsignUserSub? {
      get {
        return (snapshot["asignUserSub"] as? Snapshot).flatMap { AsignUserSub(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "asignUserSub")
      }
    }

    public struct AsignUserSub: GraphQLSelectionSet {
      public static let possibleTypes = ["RoomEntry"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .nonNull(.scalar(String.self))),
        GraphQLField("room", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(user: String, room: String) {
        self.init(snapshot: ["__typename": "RoomEntry", "user": user, "room": room])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var user: String {
        get {
          return snapshot["user"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "user")
        }
      }

      public var room: String {
        get {
          return snapshot["room"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "room")
        }
      }
    }
  }
}
