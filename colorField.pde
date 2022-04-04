class colorField {

  private int fld_width;
  private int fld_height;
  private long fld_background;
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
  
  public void add(colorForm cf) {
    forms.add(cf);
  }

  public void draw() {
    background(0);
    for ( int y=1; y<fld_height; y++ ) {
      for ( int x=1; x<fld_width; x++ ) {
        long c = 0;
        float number=0.0;
        for ( colorForm cf : forms) {
          if (!cf.dead() && cf.contains(x, y)) {
            c += cf.getColor(x, y);
            number++;
          }
        }

        color rc = (color)(round(c/number));
        pa.stroke(rc);
        pa.point(x, y);
      }
    }
    for(colorForm cf : forms) cf.tick();
  }
}
