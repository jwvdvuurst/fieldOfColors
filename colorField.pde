class colorField {

  private int fld_width;
  private int fld_height;
  private color fld_background;
  private ArrayList<Long> field;
  private ArrayList<colorForm> forms;
  private PApplet pa;

  private int calcElement( int x, int y ) {
    if ((x < 0) || (x > fld_width) ||
      (y < 0) || (y > fld_height)) return 0;

    return (y*fld_width) + x;
  }

  public colorField( PApplet pa, int w, int h, color bg ) {
    fld_width = w;
    fld_height = h;
    fld_background = bg;
    this.pa = pa;

    field = new ArrayList<Long>();
    for ( int i=fld_width * fld_height; i != 0; i-- ) field.add(fld_background);

    forms = new ArrayList<colorForm>();
  }

  public void draw() {
    for ( int y=1; y<fld_height; y++ ) {
      for ( int x=1; x<fld_width; x++ ) {
        float red=0;
        float green=0;
        float blue=0;
        float number=0.0;
        for ( colorForm cf : forms) {
          if (cf.contains(x, y)) {
            color c = cf.getColor(x, y);
            red += red(c);
            green += green(c);
            blue += blue(c);
            number++;
          }
        }

        pa.stroke(red/number, green/number, blue/number);
        pa.point(x, y);
      }
    }
  }
}
