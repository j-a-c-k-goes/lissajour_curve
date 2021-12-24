PFont font;
int frame_max = 420;
int break_point = 360;
int scale_wave = 300;
float wave_x;
float wave_y;
int second = second();
int minute = minute();
int hour = hour();

void setup() {
  println(hour, minute, second);
  size(1280, 720);
  rectMode(CENTER);
  fill(253, 255, 254);
  noStroke();
  font = createFont("mplus-2p-heavy", 244);
  String[] fontList = PFont.list();
  printArray(fontList);
  background(20, 29, 20, 72);
}

void draw() {
  float shape_w = .5;
  float shape_h = shape_w;
  float driver_offset = 0.88;
  float wave_offset = 0.28;
  for (float i = 0; i < 1; i += .001) {
    wave_x = sin(radians(frameCount * ((driver_offset) * (wave_offset - i)))) * (scale_wave);
    wave_y = cos(radians(frameCount * ((driver_offset) * (wave_offset + i)))) * (scale_wave);
    ellipse((width / 2) + wave_x * i, (height / 2) + wave_y * i, shape_w, shape_h);
    rect((width / 2) - wave_x * i, (height / 2) - wave_y * i, shape_w, shape_h);
  }

  for (float i = 0; i < 1; i += .01) {
    wave_x = cos(radians(frameCount * ((driver_offset) * (wave_offset - i)))) * (scale_wave);
    wave_y = sin(radians(frameCount * ((driver_offset) * (wave_offset + i)))) * (scale_wave);
    rect((width / 2) + wave_y * i, (height / 2) + wave_x * i, shape_w, shape_h);
    ellipse((width / 2) - wave_y * i, (height / 2) - wave_x * i, shape_w, shape_h);
  }

  for (float i = 0; i < 1; i += .1) {
    wave_x = sin(radians(frameCount * ((wave_offset) * (driver_offset + i)))) * (scale_wave);
    wave_y = tan(radians(frameCount * ((driver_offset) * (wave_offset - i)))) * (scale_wave);
    rect((width / 2) + wave_y * i, (height / 2) + wave_x * i, shape_w, shape_h);
    ellipse((width / 2) - wave_y * i, (height / 2) - wave_x * i, shape_w, shape_h);
  }
  if (frameCount % second == 4) {
    background(20, 29, 20, 72);
  }
}
