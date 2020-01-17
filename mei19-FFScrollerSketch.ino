// Goede code om rotary encoder uit te lezen (met ingebowude debounce) van John Main
// Zie: https://www.best-microcontroller-projects.com/rotary-encoder.html
#include <Keyboard.h>

#define CLK 2
#define DATA 8
#define PUSHBUTTON 9

void setup() {
 pinMode(CLK, INPUT);
 pinMode(CLK, INPUT_PULLUP);
 pinMode(DATA, INPUT);
 pinMode(DATA,INPUT_PULLUP); 
 pinMode(PUSHBUTTON,INPUT_PULLUP); 
}

static uint8_t prevNextCode = 0;
static uint16_t store=0;

int Tel=0;
void loop() { 
 if(read_rotary()) {  
  if(prevNextCode==0x0b) 
   Tel++;
  else if(prevNextCode==0x07) 
   Tel--;

  if(abs(Tel)>0) {
   char Toets = Tel>0? '9' : '0';
   Tel=0;
   Keyboard.press(KEY_LEFT_CTRL);
   Keyboard.press(KEY_LEFT_SHIFT);
   Keyboard.press(Toets);
   delay(100);
   Keyboard.releaseAll();
  }
 }
 if(digitalRead(PUSHBUTTON)==LOW) {
  Keyboard.press(KEY_LEFT_ALT);
  Keyboard.press(KEY_F12);
  delay(100);
  Keyboard.releaseAll();
 }
}

int8_t read_rotary() {
 static int8_t rot_enc_table[] = {0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0};

 prevNextCode <<= 2;
 if (digitalRead(DATA)) prevNextCode |= 0x02;
 if (digitalRead(CLK)) prevNextCode |= 0x01;
 prevNextCode &= 0x0f;

 // If valid then store as 16 bit data.
 if  (rot_enc_table[prevNextCode] ) {
  store <<= 4;
  store |= prevNextCode;
  if ((store&0xff)==0x2b) return -1;
  if ((store&0xff)==0x17) return 1;
 }
 return 0;
}
