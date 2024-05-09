
## Some samples programmes (with linux miniterm at 4800 bauds)

```console
miniterm /dev/ttyUSB0 4800 -e
```

- From G-Pascal video [demos](https://vimeo.com/682663375)

- After launching minicom press the green NMI button

---

# Displays hello in the console (G-Pascal)

![hellopas](hello_pas_serial.gif "hello G-Pascal")

---

# Displays hello in the console (ASM)

![helloasm](hello_asm.gif "hello ASM")

---

# Displays HEX code in the console (ASM)

![helloasmlst](hello_asm_list.gif "hello ASM LIST")

---

# Blink PA4 led (G-Pascal)

- LED test on PA4 active low level


```console
var i : integer;
begin
  pinmode (4, 1);
  for i := 1 to 10 do
    begin
    digitalwrite (4, 1);
    delay (1000);
    digitalwrite (4, 0);
    delay (1000);
    end
end .
```

![ledpas](pa4_pas.gif "led G-Pascal")

---

# Blink PA4 led (ASM)

```console
;
;  digitalWrite example
;
  jmp start     ; skip the variable declarations

counter   dfb 0     ; how many toggles we did
pin_state dfb 0     ; current pin state

ITERATIONS = 20     ; how many times to loop (this will be 10 flashes)

start:

  stz pin_state
  stz counter

;
;  set PA4 to output
;
  lda #4   ; Port PA4
  ldx #1   ; write mode
  jsr pinmode


write_loop:
;
;  write to PA4
;
  lda pin_state
  eor #1   ; toggle state
  sta pin_state
  tax
  lda #4   ; Port PA4
  jsr digitalwrite
;
;  delay 500 ms
;
  ldx #<500
  ldy #>500
  jsr delay
;
;  do it ITERATIONS times
;
  inc counter
  lda counter
  cmp #ITERATIONS
  bcc write_loop
;
;  all done
;
  rts
```

![ledasm](pa4_asm.gif "led ASM")

---

# Displays prime numbers in the console (G-Pascal)

![prime](prime_number.gif "prime G-Pascal")

