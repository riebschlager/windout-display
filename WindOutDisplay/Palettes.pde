class Palettes {

  ArrayList<color[]> colors = new ArrayList<color[]>();
  int currentPalette = 0;

  public Palettes() {
    // http://design-seeds.com/
    colors.add(colorsFromList(#3A3D40, #1D1D1D, #D14A31, #C7C6C1, #C9D04F, #718E15));
    colors.add(colorsFromList(#E0E0D7, #E1CB72, #9A7652, #424032, #3D7F3C, #8DC876));
    colors.add(colorsFromList(#CEAC7C, #B34245, #7A0024, #312927, #304614, #8B766F));
  }
  
  public void nextColor(){
    currentPalette = (currentPalette < colors.size()-1) ? currentPalette + 1 : 0;
  }

  public color[] colorsFromList(color... args) {
    color[] colorList = new color[args.length];
    for (int i = 0; i < args.length; i++) {
      colorList[i] = args[i];
    }
    return colorList;
  }
}

