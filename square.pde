class square extends colorForm {
  private int frm_width;
  private int frm_height;
  private long col;
  
  public square(int x, int y, int w, int h, long c) {
    super(x,y);
    min_x = (x - round((w/2)));
    min_y = (y - round((h/2)));
    max_x = (x + round((w/2)));
    max_y = (y + round((h/2)));
    col = c;
        
    frm_field = new ArrayList<Long>();
    for(int size = w*h; size > 0; size--) {
      frm_field.add(col);
    }
  }
  

}  
