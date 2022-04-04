class colorForm {
  private int x; //center_x 
  private int y; //center_y
  private int lifetime;

  protected int min_x;
  protected int min_y;
  protected int max_x;
  protected int max_y;

  protected ArrayList<Long> frm_field;

  public colorForm(int x, int y) {
    this.x = x;
    this.y = y;
    lifetime = 100;
  }

  public boolean contains(int x, int y) {    
    return ((x >= min_x) && (x < max_x) && (y >= min_y) && (y < max_y));
  }

  public int getElement(int x, int y) {
    return 0;
  }
  
  public void tick() {
    lifetime--;
  }

  public long getColor(int x, int y) {
    if (frm_field == null) return 0;
    if ((x < min_x) || (x > max_x) ||
      (y < min_y) || (y > max_y)) return 0;

    return frm_field.get(getElement(x, y));
  }
  
  public boolean dead() {
    return (lifetime <= 0);
  }
}
