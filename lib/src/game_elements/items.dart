enum Items {
  spielZeug,
  kleidung,
  nahrung,
}

class Item extends Object {
  Items category;
  String location;

  Item(this.category, this.location);
}
