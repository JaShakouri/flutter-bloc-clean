/// links : {"self":"http://example.com/articles","next":"http://example.com/articles?page[offset]=2","last":"http://example.com/articles?page[offset]=10"}
/// data : [{"type":"articles","id":"1","attributes":{"title":"JSON:API paints my bikeshed!"},"relationships":{"author":{"links":{"self":"http://example.com/articles/1/relationships/author","related":"http://example.com/articles/1/author"},"data":{"type":"people","id":"9"}},"comments":{"links":{"self":"http://example.com/articles/1/relationships/comments","related":"http://example.com/articles/1/comments"},"data":[{"type":"comments","id":"5"},{"type":"comments","id":"12"}]}},"links":{"self":"http://example.com/articles/1"}}]
/// included : [{"type":"people","id":"9","attributes":{"firstName":"Dan","lastName":"Gebhardt","twitter":"dgeb"},"links":{"self":"http://example.com/people/9"}},{"type":"comments","id":"5","attributes":{"body":"First!"},"relationships":{"author":{"data":{"type":"people","id":"2"}}},"links":{"self":"http://example.com/comments/5"}},{"type":"comments","id":"12","attributes":{"body":"I like XML better"},"relationships":{"author":{"data":{"type":"people","id":"9"}}},"links":{"self":"http://example.com/comments/12"}}]

class History {
  History({
      Links? links, 
      List<Data>? data, 
      List<Included>? included,}){
    _links = links;
    _data = data;
    _included = included;
}

  History.fromJson(dynamic json) {
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    if (json['included'] != null) {
      _included = [];
      json['included'].forEach((v) {
        _included?.add(Included.fromJson(v));
      });
    }
  }
  Links? _links;
  List<Data>? _data;
  List<Included>? _included;
History copyWith({  Links? links,
  List<Data>? data,
  List<Included>? included,
}) => History(  links: links ?? _links,
  data: data ?? _data,
  included: included ?? _included,
);
  Links? get links => _links;
  List<Data>? get data => _data;
  List<Included>? get included => _included;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_links != null) {
      map['links'] = _links?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_included != null) {
      map['included'] = _included?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// type : "people"
/// id : "9"
/// attributes : {"firstName":"Dan","lastName":"Gebhardt","twitter":"dgeb"}
/// links : {"self":"http://example.com/people/9"}

class Included {
  Included({
      String? type, 
      String? id, 
      Attributes? attributes, 
      Links? links,}){
    _type = type;
    _id = id;
    _attributes = attributes;
    _links = links;
}

  Included.fromJson(dynamic json) {
    _type = json['type'];
    _id = json['id'];
    _attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
  String? _type;
  String? _id;
  Attributes? _attributes;
  Links? _links;
Included copyWith({  String? type,
  String? id,
  Attributes? attributes,
  Links? links,
}) => Included(  type: type ?? _type,
  id: id ?? _id,
  attributes: attributes ?? _attributes,
  links: links ?? _links,
);
  String? get type => _type;
  String? get id => _id;
  Attributes? get attributes => _attributes;
  Links? get links => _links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['id'] = _id;
    if (_attributes != null) {
      map['attributes'] = _attributes?.toJson();
    }
    if (_links != null) {
      map['links'] = _links?.toJson();
    }
    return map;
  }

}

/// self : "http://example.com/people/9"

class Links {
  Links({
      String? self,}){
    _self = self;
}

  Links.fromJson(dynamic json) {
    _self = json['self'];
  }
  String? _self;
Links copyWith({  String? self,
}) => Links(  self: self ?? _self,
);
  String? get self => _self;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['self'] = _self;
    return map;
  }

}

/// firstName : "Dan"
/// lastName : "Gebhardt"
/// twitter : "dgeb"

class Attributes {
  Attributes({
      String? firstName, 
      String? lastName, 
      String? twitter,}){
    _firstName = firstName;
    _lastName = lastName;
    _twitter = twitter;
}

  Attributes.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _twitter = json['twitter'];
  }
  String? _firstName;
  String? _lastName;
  String? _twitter;
Attributes copyWith({  String? firstName,
  String? lastName,
  String? twitter,
}) => Attributes(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  twitter: twitter ?? _twitter,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get twitter => _twitter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['twitter'] = _twitter;
    return map;
  }

}

/// type : "articles"
/// id : "1"
/// attributes : {"title":"JSON:API paints my bikeshed!"}
/// relationships : {"author":{"links":{"self":"http://example.com/articles/1/relationships/author","related":"http://example.com/articles/1/author"},"data":{"type":"people","id":"9"}},"comments":{"links":{"self":"http://example.com/articles/1/relationships/comments","related":"http://example.com/articles/1/comments"},"data":[{"type":"comments","id":"5"},{"type":"comments","id":"12"}]}}
/// links : {"self":"http://example.com/articles/1"}

class Data {
  Data({
      String? type, 
      String? id, 
      Attributes? attributes,
      Links? links,}){
    _type = type;
    _id = id;
    _attributes = attributes;
    _links = links;
}

  Data.fromJson(dynamic json) {
    _type = json['type'];
    _id = json['id'];
    _attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
  String? _type;
  String? _id;
  Attributes? _attributes;
  Links? _links;
Data copyWith({  String? type,
  String? id,
  Attributes? attributes,
  Links? links,
}) => Data(  type: type ?? _type,
  id: id ?? _id,
  attributes: attributes ?? _attributes,
  links: links ?? _links,
);
  String? get type => _type;
  String? get id => _id;
  Attributes? get attributes => _attributes;
  Links? get links => _links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['id'] = _id;
    if (_attributes != null) {
      map['attributes'] = _attributes?.toJson();
    }

    if (_links != null) {
      map['links'] = _links?.toJson();
    }
    return map;
  }

}