org $018000

; one of the several routines at table $AE89
$01/8000 BB          TYX              ;
$01/8001 60          RTS              ;

init_hookbill:
$01/8002 B4 18       LDY $18,x  [$00:0018]   ; current spot into init table
$01/8004 BB          TYX                     ;
$01/8005 FC 15 80    JSR ($8015,x)[$00:008D] ; table sub
$01/8008 AD 39 00    LDA $0039  [$00:0039]   ;
$01/800B 8D 18 7E    STA $7E18  [$00:7E18]   ;
$01/800E A9 02 00    LDA #$0002              ;
$01/8011 9D 00 6F    STA $6F00,x[$00:6F00]   ;
$01/8014 6B          RTL                     ;

; this table contains each state of the fog opening
; to hookbill
.hookbill_init_ptr
CODE_018015:         dw $8025                ; 02: start fog sequence
CODE_018017:         dw $8041                ; 04: fog moving left to cover whole screen
CODE_018019:         dw $8103                ; 06: stays foggy for a time
CODE_01801B:         dw $8174                ; 08: fog fades away
CODE_01801D:         dw $81A8                ; 0A: graphics loading
CODE_01801F:         dw $81B2                ; 0C: more graphics loading
CODE_018021:         dw $81C5                ; 0E: prepares sprites like kamek etc.
CODE_018023:         dw $8236                ; 10: does init on the boss sprite himself

hookbill_init_fog:
$01/8025 A6 12       LDX $12                 ;
$01/8027 9C 98 60    STZ $6098  [$00:6098]   ;
$01/802A 9C 41 00    STZ $0041  [$00:0041]   ;
$01/802D 9C A0 60    STZ $60A0  [$00:60A0]   ;
$01/8030 9C 43 00    STZ $0043  [$00:0043]   ;
$01/8033 A9 04 13    LDA #$1304              ;
$01/8036 8D 67 09    STA $0967  [$00:0967]   ;
$01/8039 A0 24       LDY #$24                ;
$01/803B 8C 6C 09    STY $096C  [$04:096C]   ;
$01/803E 4C 9F 81    JMP $819F  [$04:819F]   ;

hookbill_init_fog_left:
$01/8041 A6 12       LDX $12                 ;
$01/8043 BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/8046 D0 09       BNE $09    [$8051]      ;
$01/8048 A9 04 00    LDA #$0004              ;
$01/804B 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/804E DE E2 70    DEC $70E2,x[$00:70E2]   ;
$01/8051 C2 10       REP #$10                ;
$01/8053 A0 00 00    LDY #$0000              ;
$01/8056 BD 80 76    LDA $7680,x[$00:7680]   ;
$01/8059 38          SEC                     ;
$01/805A E9 20 01    SBC #$0120              ;
$01/805D 49 FF FF    EOR #$FFFF              ;
$01/8060 1A          INC A                   ;
$01/8061 10 03       BPL $03    [$8066]      ;
$01/8063 A9 00 00    LDA #$0000              ;
$01/8066 C9 E0 00    CMP #$00E0              ;
$01/8069 90 4E       BCC $4E    [$80B9]      ;
$01/806B A0 00 01    LDY #$0100              ;
$01/806E E9 E0 00    SBC #$00E0              ;
$01/8071 C9 E0 00    CMP #$00E0              ;
$01/8074 90 43       BCC $43    [$80B9]      ;
$01/8076 5A          PHY                     ;
$01/8077 A9 00 20    LDA #$2000              ;
$01/807A 8D 02 30    STA $3002  [$00:3002]   ;
$01/807D A9 6C 2F    LDA #$2F6C              ;
$01/8080 8D 04 30    STA $3004  [$00:3004]   ;
$01/8083 A9 00 02    LDA #$0200              ;
$01/8086 8D 18 30    STA $3018  [$00:3018]   ;
$01/8089 E2 10       SEP #$10                ;
$01/808B A2 08       LDX #$08                ;
$01/808D A9 7F AA    LDA #$AA7F              ;
$01/8090 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; gsu code at $08/AA7F
$01/8094 A9 FF 7F    LDA #$7FFF              ;
$01/8097 8F 8C 2F 70 STA $702F8C[$70:2F8C]   ;
$01/809B A2 1C       LDX #$1C                ;
$01/809D 9F 2E 30 70 STA $70302E,x[$70:302E] ;
$01/80A1 9F 4E 30 70 STA $70304E,x[$70:304E] ;
$01/80A5 CA          DEX                     ;
$01/80A6 CA          DEX                     ;
$01/80A7 10 F4       BPL $F4    [$809D]      ;
$01/80A9 A9 00 00    LDA #$0000              ;
$01/80AC 8F 6C 33 70 STA $70336C[$70:336C]   ;
$01/80B0 20 9F 81    JSR $819F  [$00:819F]   ;
$01/80B3 C2 10       REP #$10                ;
$01/80B5 7A          PLY                     ;
$01/80B6 A9 E0 00    LDA #$00E0              ;
$01/80B9 8C A0 60    STY $60A0  [$00:60A0]   ;
$01/80BC 8C 43 00    STY $0043  [$00:0043]   ;
$01/80BF 8D 98 60    STA $6098  [$00:6098]   ;
$01/80C2 8D 41 00    STA $0041  [$00:0041]   ;
$01/80C5 8D 02 30    STA $3002  [$00:3002]   ;
$01/80C8 A5 14       LDA $14    [$00:0014]   ;
$01/80CA 4A          LSR A                   ;
$01/80CB 8D 04 30    STA $3004  [$00:3004]   ;
$01/80CE A9 70 00    LDA #$0070              ;
$01/80D1 8D 06 30    STA $3006  [$00:3006]   ;
$01/80D4 A9 0F 00    LDA #$000F              ;
$01/80D7 8D 08 30    STA $3008  [$00:3008]   ;
$01/80DA 9C 0A 30    STZ $300A  [$00:300A]   ;
$01/80DD A9 BA 36    LDA #$36BA              ;
$01/80E0 8D 0C 30    STA $300C  [$00:300C]   ;
$01/80E3 E2 10       SEP #$10                ;
$01/80E5 A2 08       LDX #$08                ;
$01/80E7 A9 08 92    LDA #$9208              ;
$01/80EA 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; gsu code at $08/9208
$01/80EE 22 39 BE 00 JSL $00BE39[$00:BE39]   ;

; DMA args
DATA_0180F2:         dl $7E51E4, $7036BA
DATA_0180F8:         dw $0348

$01/80FA A9 08 00    LDA #$0008              ;
$01/80FD 0C 4A 09    TSB $094A  [$00:094A]   ;
$01/8100 A6 12       LDX $12    [$00:0012]   ;
$01/8102 60          RTS                     ;

hookbill_init_fog_stay:
$01/8103 A5 14       LDA $14    [$00:0014]   ;
$01/8105 29 07 00    AND #$0007              ;
$01/8108 D0 27       BNE $27    [$8131]      ;
$01/810A AF 6C 33 70 LDA $70336C[$70:336C]   ;
$01/810E C9 20 00    CMP #$0020              ;
$01/8111 B0 21       BCS $21    [$8134]      ;
$01/8113 A9 6C 2D    LDA #$2D6C              ;
$01/8116 8F 6E 33 70 STA $70336E[$70:336E]   ;
$01/811A A9 6C 2F    LDA #$2F6C              ;
$01/811D 8F 70 33 70 STA $703370[$70:3370]   ;
$01/8121 A2 08       LDX #$08                ;
$01/8123 A9 A9 B4    LDA #$B4A9              ;
$01/8126 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/812A AF 20 20 70 LDA $702020[$70:2020]   ;
$01/812E 8D 48 09    STA $0948  [$00:0948]   ;
$01/8131 A6 12       LDX $12    [$00:0012]   ;
$01/8133 60          RTS                     ;

$01/8134 A9 08 00    LDA #$0008              ;
$01/8137 1C 4A 09    TRB $094A  [$00:094A]   ;
$01/813A A9 02 00    LDA #$0002              ;
$01/813D 1C 68 09    TRB $0968  [$00:0968]   ;
$01/8140 A9 00 00    LDA #$0000              ;
$01/8143 8F 6E 2F 70 STA $702F6E[$70:2F6E]   ;
$01/8147 8F 70 2F 70 STA $702F70[$70:2F70]   ;
$01/814B 8F 72 2F 70 STA $702F72[$70:2F72]   ;
$01/814F 8F 6C 33 70 STA $70336C[$70:336C]   ;
$01/8153 A2 1C       LDX #$1C                ;
$01/8155 BF C0 DA 5F LDA $5FDAC0,x[$5F:DAC0] ;
$01/8159 9F 4E 31 70 STA $70314E,x[$70:314E] ;
$01/815D CA          DEX                     ;
$01/815E CA          DEX                     ;
$01/815F 10 F4       BPL $F4    [$8155]      ;
$01/8161 AF BE DA 5F LDA $5FDABE[$5F:DABE]   ;
$01/8165 8F 4C 31 70 STA $70314C[$70:314C]   ;
$01/8169 20 9F 81    JSR $819F  [$00:819F]   ;
$01/816C A9 D5 00    LDA #$00D5              ;
$01/816F 22 4C A3 03 JSL $03A34C[$03:A34C]   ;
$01/8173 60          RTS                     ;

hookbill_init_fog_fade:
$01/8174 A5 14       LDA $14    [$00:0014]   ;
$01/8176 29 07 00    AND #$0007              ;
$01/8179 D0 B6       BNE $B6    [$8131]      ;
$01/817B AF 6C 33 70 LDA $70336C[$70:336C]   ;
$01/817F C9 20 00    CMP #$0020              ;
$01/8182 90 8F       BCC $8F    [$8113]      ;
$01/8184 A6 12       LDX $12    [$00:0012]   ;
$01/8186 22 E4 D5 03 JSL $03D5E4[$03:D5E4]   ;
$01/818A 9C 14 0C    STZ $0C14  [$00:0C14]   ;
$01/818D 9C 16 0C    STZ $0C16  [$00:0C16]   ;
$01/8190 A9 04 00    LDA #$0004              ;
$01/8193 8D 48 01    STA $0148  [$00:0148]   ;
$01/8196 9C 4A 01    STZ $014A  [$00:014A]   ;
$01/8199 9C 2B 0D    STZ $0D2B  [$00:0D2B]   ;
$01/819C 9C 3B 0D    STZ $0D3B  [$00:0D3B]   ;
$01/819F E2 10       SEP #$10                ; entry point
$01/81A1 A6 12       LDX $12    [$00:0012]   ;
$01/81A3 F6 18       INC $18,x  [$00:0018]   ;
$01/81A5 F6 18       INC $18,x  [$00:0018]   ;
$01/81A7 60          RTS                     ;

hookbill_init_graphics:
$01/81A8 A9 4D 00    LDA #$004D              ; compressed file index
$01/81AB C2 10       REP #$10                ;
$01/81AD A0 00 28    LDY #$2800              ; VRAM destination
$01/81B0 80 08       BRA $08    [$81BA]      ;

hookbill_init_graphics_2:
$01/81B2 A9 4E 00    LDA #$004E              ; comp. file index
$01/81B5 C2 10       REP #$10                ;
$01/81B7 A0 00 2C    LDY #$2C00              ; VRAM dest.
$01/81BA 20 1D 82    JSR $821D  [$00:821D]   ;
$01/81BD A9 04 04    LDA #$0404              ;
$01/81C0 1C 67 09    TRB $0967  [$00:0967]   ;
$01/81C3 80 DA       BRA $DA    [$819F]      ;

hookbill_init_sprites:
$01/81C5 22 FB 81 01 JSL $0181FB[$01:81FB]   ;
$01/81C9 A9 F1 00    LDA #$00F1              ;
$01/81CC 8D 4D 00    STA $004D  [$00:004D]   ;
$01/81CF A9 DD 00    LDA #$00DD              ;
$01/81D2 22 64 A3 03 JSL $03A364[$03:A364]   ; init "closer" sprite
$01/81D6 A9 42 00    LDA #$0042              ;
$01/81D9 99 78 79    STA $7978,y[$00:7978]   ;
$01/81DC A9 74 00    LDA #$0074              ;
$01/81DF 99 02 79    STA $7902,y[$00:7902]   ;
$01/81E2 9C 5A 10    STZ $105A  [$00:105A]   ;
$01/81E5 EE 7B 0B    INC $0B7B  [$00:0B7B]   ;
$01/81E8 A9 48 00    LDA #$0048              ;
$01/81EB 22 4C A3 03 JSL $03A34C[$03:A34C]   ; init kamek sprite
$01/81EF A9 10 00    LDA #$0010              ;
$01/81F2 99 E2 70    STA $70E2,y[$00:70E2]   ;
$01/81F5 22 4A F7 04 JSL $04F74A[$04:F74A]   ;
$01/81F9 80 A4       BRA $A4    [$819F]      ;

; l sub
$01/81FB C2 10       REP #$10                ;
$01/81FD A9 F8 00    LDA #$00F8              ; comp. file index
$01/8200 A0 00 34    LDY #$3400              ; VRAM dest. (BG3 tilemap)
$01/8203 20 1D 82    JSR $821D  [$00:821D]   ;
$01/8206 A2 0C       LDX #$0C                ;
$01/8208 BF 3A C1 5F LDA $5FC13A,x           ;
$01/820C 9F 7E 2D 70 STA $702D7E,x[$70:2D7E] ;
$01/8210 9F 12 20 70 STA $702012,x[$70:2012] ;
$01/8214 9F 7E 2F 70 STA $702F7E,x[$70:2F7E] ;
$01/8218 CA          DEX                     ;
$01/8219 CA          DEX                     ;
$01/821A 10 EC       BPL $EC    [$8208]      ;
$01/821C 6B          RTL                     ;

hookbill_decompress_gfx:
$01/821D 5A          PHY                     ;
$01/821E A2 00 68    LDX #$6800              ;
$01/8221 22 56 B7 00 JSL $00B756[$00:B756]   ;
$01/8225 7A          PLY                     ;
$01/8226 A2 70 00    LDX #$0070              ;
$01/8229 8E 01 00    STX $0001  [$00:0001]   ;
$01/822C A2 00 68    LDX #$6800              ;
$01/822F 22 A6 BE 00 JSL $00BEA6[$00:BEA6]   ;
$01/8233 E2 10       SEP #$10                ;
$01/8235 60          RTS                     ;

hookbill_init_boss:
$01/8236 A6 12       LDX $12    [$00:0012]   ;
$01/8238 9C C4 60    STZ $60C4  [$00:60C4]   ;
$01/823B AC 5A 10    LDY $105A  [$00:105A]   ;
$01/823E F0 F5       BEQ $F5    [$8235]      ;
$01/8240 9C CC 7E    STZ $7ECC  [$00:7ECC]   ;
$01/8243 AD 39 00    LDA $0039  [$00:0039]   ;
$01/8246 18          CLC                     ;
$01/8247 69 20 01    ADC #$0120              ;
$01/824A 9D E2 70    STA $70E2,x[$00:70E2]   ;
$01/824D AD 90 60    LDA $6090  [$00:6090]   ;
$01/8250 9D 82 71    STA $7182,x[$00:7182]   ;
$01/8253 9C 1E 0C    STZ $0C1E  [$00:0C1E]   ;
$01/8256 AD 39 00    LDA $0039  [$00:0039]   ;
$01/8259 8D 18 7E    STA $7E18  [$00:7E18]   ;
$01/825C 18          CLC                     ;
$01/825D 69 00 01    ADC #$0100              ;
$01/8260 8D 82 10    STA $1082  [$00:1082]   ;
$01/8263 8D 1A 7E    STA $7E1A  [$00:7E1A]   ;
$01/8266 A9 40 00    LDA #$0040              ;
$01/8269 9D 42 75    STA $7542,x[$00:7542]   ;
$01/826C A9 00 04    LDA #$0400              ;
$01/826F 9D E2 75    STA $75E2,x[$00:75E2]   ;
$01/8272 8D 6E 10    STA $106E  [$00:106E]   ;
$01/8275 EB          XBA                     ;
$01/8276 9D A2 74    STA $74A2,x[$00:74A2]   ;
$01/8279 A9 80 FF    LDA #$FF80              ;
$01/827C 9D 20 72    STA $7220,x[$00:7220]   ;
$01/827F 9C 80 10    STZ $1080  [$00:1080]   ;
$01/8282 9C A0 60    STZ $60A0  [$00:60A0]   ;
$01/8285 A9 15 00    LDA #$0015              ;
$01/8288 8D 67 09    STA $0967  [$00:0967]   ;
$01/828B A9 09 00    LDA #$0009              ;
$01/828E 8D 4D 00    STA $004D  [$00:004D]   ;
$01/8291 A0 2B       LDY #$2B                ;
$01/8293 94 76       STY $76,x  [$00:0076]   ;
$01/8295 68          PLA                     ; \ skips the RTS
$01/8296 6B          RTL                     ; / and goes back one in stack


; hookbill table (used by gsu)
; each separate chunk represents one of hookbill's
; frames, contains info about them
;
; the chunks are divided into 7 5-byte subchunks
; each one represents a different part of his body:
; first subchunk:   near leg
; second subchunk:  near arm
; third subchunk:   tail
; fourth subchunk:  head
; fifth subchunk:   far arm
; sixth subchunk:   far leg
; seventh subchunk: shell
;
; the subchunks are as follows:
; first byte: index into $8B46 tables
; second byte: angle 1
; third byte: radius 1
; fourth byte: angle 2
; fifth byte: radius 2
; the angles & radii are used to determine
; positional information for the body part
; relative to an "origin" in the center of him
;
DATA_018297:         db $02, $DF, $14, $B9, $06
DATA_01829C:         db $00, $B4, $0E, $D8, $09
DATA_0182A1:         db $00, $FF, $20, $DF, $07
DATA_0182A6:         db $00, $90, $16, $7A, $0C
DATA_0182AB:         db $01, $9B, $15, $BC, $07
DATA_0182B0:         db $00, $EA, $1A, $D3, $08
DATA_0182B5:         db $00, $F3, $06, $00, $00

DATA_0182BA:         db $02, $E5, $17, $B9, $06
DATA_0182BF:         db $00, $A4, $0C, $D9, $08
DATA_0182C4:         db $00, $FD, $1F, $E2, $07
DATA_0182C9:         db $00, $8A, $15, $79, $0C
DATA_0182CE:         db $01, $A0, $13, $B9, $07
DATA_0182D3:         db $00, $EC, $14, $D7, $08
DATA_0182D8:         db $00, $02, $06, $00, $00

DATA_0182DD:         db $02, $E8, $1A, $BC, $06
DATA_0182E2:         db $01, $A2, $0C, $B0, $08
DATA_0182E7:         db $00, $FC, $1E, $E1, $07
DATA_0182EC:         db $00, $85, $14, $7B, $0D
DATA_0182F1:         db $01, $A6, $10, $BD, $07
DATA_0182F6:         db $02, $F0, $14, $B6, $06
DATA_0182FB:         db $00, $0C, $06, $00, $00

DATA_018300:         db $02, $EC, $1D, $BA, $06
DATA_018305:         db $02, $A4, $0C, $AD, $06
DATA_01830A:         db $00, $FC, $1D, $DD, $07
DATA_01830F:         db $00, $89, $17, $7A, $0C
DATA_018314:         db $01, $B0, $0E, $B9, $07
DATA_018319:         db $01, $EF, $14, $AF, $09
DATA_01831E:         db $00, $02, $06, $00, $00

DATA_018323:         db $00, $EC, $1D, $D5, $07
DATA_018328:         db $01, $9F, $13, $B8, $07
DATA_01832D:         db $00, $FB, $1C, $E1, $07
DATA_018332:         db $00, $8E, $17, $7A, $0C
DATA_018337:         db $00, $AE, $0E, $D4, $08
DATA_01833C:         db $02, $DE, $12, $BB, $06
DATA_018341:         db $00, $F3, $06, $00, $00

DATA_018346:         db $00, $EF, $18, $D0, $07
DATA_01834B:         db $01, $A5, $11, $BC, $07
DATA_018350:         db $00, $FC, $1D, $E3, $07
DATA_018355:         db $00, $89, $17, $79, $0C
DATA_01835A:         db $01, $9E, $0E, $CC, $07
DATA_01835F:         db $02, $E1, $15, $B4, $05
DATA_018364:         db $00, $02, $06, $00, $00

DATA_018369:         db $02, $F2, $17, $BA, $06
DATA_01836E:         db $01, $AF, $0E, $B9, $07
DATA_018373:         db $00, $FC, $1E, $DE, $07
DATA_018378:         db $00, $84, $15, $79, $0C
DATA_01837D:         db $01, $9C, $0B, $BC, $07
DATA_018382:         db $02, $E6, $18, $BA, $06
DATA_018387:         db $00, $0C, $06, $00, $00

DATA_01838C:         db $01, $F0, $18, $A8, $08
DATA_018391:         db $01, $B9, $0D, $BC, $07
DATA_018396:         db $00, $FD, $1F, $DF, $07
DATA_01839B:         db $00, $8A, $15, $79, $0C
DATA_0183A0:         db $02, $9D, $0E, $AF, $08
DATA_0183A5:         db $02, $EA, $1B, $B7, $06
DATA_0183AA:         db $00, $02, $06, $00, $00

DATA_0183AF:         db $02, $AD, $0E, $BA, $07
DATA_0183B4:         db $03, $63, $0F, $B2, $06
DATA_0183B9:         db $00, $E2, $0F, $DF, $08
DATA_0183BE:         db $00, $57, $1C, $78, $0C
DATA_0183C3:         db $05, $76, $14, $A6, $09
DATA_0183C8:         db $00, $C9, $0E, $D5, $07
DATA_0183CD:         db $00, $24, $07, $00, $00

DATA_0183D2:         db $02, $B9, $0D, $BA, $07
DATA_0183D7:         db $04, $64, $0E, $AA, $08
DATA_0183DC:         db $00, $E1, $10, $E0, $08
DATA_0183E1:         db $00, $53, $1D, $78, $0C
DATA_0183E6:         db $04, $73, $13, $A9, $08
DATA_0183EB:         db $00, $BC, $0A, $D2, $07
DATA_0183F0:         db $00, $27, $09, $00, $00

DATA_0183F5:         db $02, $C5, $0D, $B7, $07
DATA_0183FA:         db $04, $6D, $0F, $AB, $08
DATA_0183FF:         db $00, $E4, $11, $E0, $09
DATA_018404:         db $00, $50, $1E, $78, $0C
DATA_018409:         db $04, $70, $11, $AA, $08
DATA_01840E:         db $02, $BC, $07, $BC, $07
DATA_018413:         db $00, $2A, $0B, $00, $00

DATA_018418:         db $02, $D1, $0E, $BB, $07
DATA_01841D:         db $05, $6D, $0F, $A5, $0A
DATA_018422:         db $00, $E6, $12, $E1, $08
DATA_018427:         db $00, $53, $1D, $7A, $0C
DATA_01842C:         db $03, $6F, $13, $BB, $07
DATA_018431:         db $01, $B9, $04, $AA, $09
DATA_018436:         db $00, $27, $09, $00, $00

DATA_01843B:         db $00, $D0, $0F, $D4, $07
DATA_018440:         db $05, $70, $10, $A6, $0A
DATA_018445:         db $00, $E8, $12, $E1, $08
DATA_01844A:         db $00, $57, $1C, $7A, $0C
DATA_01844F:         db $03, $6A, $11, $B8, $07
DATA_018454:         db $02, $A8, $10, $B9, $07
DATA_018459:         db $00, $24, $07, $00, $00

DATA_01845E:         db $00, $CA, $0A, $D4, $07
DATA_018463:         db $04, $70, $10, $AB, $08
DATA_018468:         db $00, $E6, $12, $DF, $08
DATA_01846D:         db $00, $53, $1D, $79, $0C
DATA_018472:         db $04, $6C, $10, $AA, $08
DATA_018477:         db $02, $B2, $0E, $BB, $07
DATA_01847C:         db $00, $27, $09, $00, $00

DATA_018481:         db $02, $CE, $07, $B9, $07
DATA_018486:         db $04, $6B, $0F, $AB, $08
DATA_01848B:         db $00, $E4, $11, $E1, $08
DATA_018490:         db $00, $4F, $1E, $78, $0C
DATA_018495:         db $04, $70, $11, $A8, $08
DATA_01849A:         db $02, $BC, $0D, $BB, $07
DATA_01849F:         db $00, $2A, $0B, $00, $00

DATA_0184A4:         db $01, $DD, $05, $A6, $0A
DATA_0184A9:         db $03, $6B, $0F, $B2, $06
DATA_0184AE:         db $00, $E1, $10, $E1, $08
DATA_0184B3:         db $00, $53, $1D, $79, $0C
DATA_0184B8:         db $05, $72, $12, $A8, $09
DATA_0184BD:         db $02, $CB, $0D, $BC, $07
DATA_0184C2:         db $00, $27, $09, $00, $00

DATA_0184C7:         db $01, $C7, $10, $A5, $0A
DATA_0184CC:         db $05, $B8, $0A, $A6, $0A
DATA_0184D1:         db $00, $F4, $1C, $D7, $07
DATA_0184D6:         db $00, $6E, $15, $78, $0C
DATA_0184DB:         db $03, $81, $0F, $B3, $06
DATA_0184E0:         db $00, $E9, $1B, $D2, $07
DATA_0184E5:         db $00, $13, $07, $00, $00

DATA_0184EA:         db $02, $CE, $12, $B8, $07
DATA_0184EF:         db $04, $A5, $0A, $AD, $08
DATA_0184F4:         db $00, $F2, $1B, $D6, $07
DATA_0184F9:         db $00, $6D, $15, $7A, $0C
DATA_0184FE:         db $04, $87, $0C, $AC, $08
DATA_018503:         db $00, $E8, $12, $D3, $07
DATA_018508:         db $00, $14, $09, $00, $00

DATA_01850D:         db $02, $DD, $16, $BA, $07
DATA_018512:         db $04, $98, $09, $AC, $08
DATA_018517:         db $00, $EF, $19, $D9, $07
DATA_01851C:         db $00, $69, $14, $7A, $0C
DATA_018521:         db $04, $92, $0B, $A9, $08
DATA_018526:         db $02, $E0, $10, $BA, $07
DATA_01852B:         db $00, $13, $0B, $00, $00

DATA_018530:         db $00, $E1, $19, $D0, $08
DATA_018535:         db $03, $89, $0C, $B5, $06
DATA_01853A:         db $00, $ED, $17, $D7, $07
DATA_01853F:         db $00, $65, $14, $78, $0C
DATA_018544:         db $05, $A3, $09, $A8, $0A
DATA_018549:         db $01, $D8, $0E, $A4, $0A
DATA_01854E:         db $00, $13, $0D, $00, $00

DATA_018553:         db $00, $ED, $1D, $D1, $08
DATA_018558:         db $03, $92, $0F, $B5, $06
DATA_01855D:         db $00, $EF, $15, $D6, $07
DATA_018562:         db $00, $6F, $15, $78, $0C
DATA_018567:         db $05, $AD, $0B, $A5, $0A
DATA_01856C:         db $01, $C0, $10, $A7, $0A
DATA_018571:         db $00, $13, $07, $00, $00

DATA_018576:         db $00, $EC, $14, $D1, $08
DATA_01857B:         db $04, $89, $09, $A8, $08
DATA_018580:         db $00, $ED, $17, $DA, $07
DATA_018585:         db $00, $6B, $15, $79, $0C
DATA_01858A:         db $04, $9D, $0C, $AA, $08
DATA_01858F:         db $02, $C8, $11, $BD, $07
DATA_018594:         db $00, $14, $09, $00, $00

DATA_018599:         db $02, $E9, $10, $BA, $07
DATA_01859E:         db $04, $98, $09, $AB, $08
DATA_0185A3:         db $00, $F0, $19, $D6, $07
DATA_0185A8:         db $00, $68, $14, $79, $0C
DATA_0185AD:         db $04, $93, $0B, $A9, $08
DATA_0185B2:         db $02, $D7, $14, $BD, $07
DATA_0185B7:         db $00, $13, $0B, $00, $00

DATA_0185BC:         db $01, $DE, $10, $A4, $0A
DATA_0185C1:         db $05, $B1, $07, $A7, $0A
DATA_0185C6:         db $00, $F2, $1B, $D7, $07
DATA_0185CB:         db $00, $66, $14, $7A, $0C
DATA_0185D0:         db $03, $88, $0F, $B3, $06
DATA_0185D5:         db $00, $DC, $17, $D1, $07
DATA_0185DA:         db $00, $13, $0D, $00, $00

DATA_0185DF:         db $02, $C0, $0C, $00, $00
DATA_0185E4:         db $05, $60, $08, $00, $00
DATA_0185E9:         db $00, $80, $08, $00, $00
DATA_0185EE:         db $00, $00, $00, $00, $00
DATA_0185F3:         db $05, $60, $08, $00, $00
DATA_0185F8:         db $02, $C0, $0C, $00, $00
DATA_0185FD:         db $00, $00, $00, $00, $00

DATA_018602:         db $02, $00, $00, $00, $00
DATA_018607:         db $05, $00, $00, $00, $00
DATA_01860C:         db $00, $00, $00, $00, $00
DATA_018611:         db $00, $80, $05, $00, $00
DATA_018616:         db $05, $00, $00, $00, $00
DATA_01861B:         db $02, $00, $00, $00, $00
DATA_018620:         db $00, $00, $00, $00, $00

DATA_018625:         db $02, $F2, $24, $00, $00
DATA_01862A:         db $05, $8C, $24, $00, $00
DATA_01862F:         db $00, $0C, $22, $00, $00
DATA_018634:         db $00, $84, $2B, $00, $00
DATA_018639:         db $05, $86, $15, $00, $00
DATA_01863E:         db $02, $01, $22, $00, $00
DATA_018643:         db $00, $00, $00, $00, $00

DATA_018648:         db $02, $FC, $22, $00, $00
DATA_01864D:         db $05, $8B, $1E, $00, $00
DATA_018652:         db $00, $04, $1B, $00, $00
DATA_018657:         db $00, $83, $28, $00, $00
DATA_01865C:         db $05, $87, $24, $00, $00
DATA_018661:         db $02, $01, $21, $00, $00
DATA_018666:         db $00, $00, $00, $00, $00

DATA_01866B:         db $02, $06, $22, $00, $00
DATA_018670:         db $05, $8A, $23, $00, $00
DATA_018675:         db $00, $14, $22, $00, $00
DATA_01867A:         db $00, $82, $27, $00, $00
DATA_01867F:         db $05, $84, $20, $00, $00
DATA_018684:         db $02, $0F, $1D, $00, $00
DATA_018689:         db $00, $00, $00, $00, $00

DATA_01868E:         db $02, $BD, $1F, $B9, $04
DATA_018693:         db $05, $64, $1F, $43, $05
DATA_018698:         db $00, $CE, $20, $B4, $00
DATA_01869D:         db $00, $53, $28, $2A, $06
DATA_0186A2:         db $05, $5A, $21, $50, $09
DATA_0186A7:         db $01, $9A, $20, $C6, $03
DATA_0186AC:         db $00, $00, $00, $00, $00

DATA_0186B1:         db $02, $BD, $1F, $A8, $04
DATA_0186B6:         db $05, $64, $1F, $9D, $05
DATA_0186BB:         db $00, $CE, $20, $01, $04
DATA_0186C0:         db $00, $53, $28, $1A, $08
DATA_0186C5:         db $05, $5A, $21, $BF, $09
DATA_0186CA:         db $01, $9A, $20, $BF, $06
DATA_0186CF:         db $00, $00, $00, $00, $00

DATA_0186D4:         db $02, $AF, $23, $9A, $04
DATA_0186D9:         db $05, $54, $20, $37, $05
DATA_0186DE:         db $00, $C3, $1D, $D2, $04
DATA_0186E3:         db $00, $40, $28, $3E, $02
DATA_0186E8:         db $05, $4C, $22, $4E, $07
DATA_0186ED:         db $01, $9B, $23, $64, $07
DATA_0186F2:         db $00, $00, $00, $00, $00

DATA_0186F7:         db $02, $AF, $23, $6B, $03
DATA_0186FC:         db $05, $54, $20, $90, $08
DATA_018701:         db $00, $C3, $1D, $99, $04
DATA_018706:         db $00, $40, $28, $F7, $04
DATA_01870B:         db $05, $4C, $22, $93, $08
DATA_018710:         db $01, $9B, $23, $60, $0A
DATA_018715:         db $00, $00, $00, $00, $00

DATA_01871A:         db $02, $75, $23, $4F, $04
DATA_01871F:         db $05, $0D, $1D, $17, $06
DATA_018724:         db $00, $7B, $22, $98, $04
DATA_018729:         db $00, $0A, $22, $07, $03
DATA_01872E:         db $05, $11, $20, $1B, $08
DATA_018733:         db $02, $6B, $1C, $50, $0B
DATA_018738:         db $00, $00, $00, $00, $00

DATA_01873D:         db $02, $75, $23, $A9, $04
DATA_018742:         db $05, $0D, $1D, $EC, $0A
DATA_018747:         db $00, $7B, $22, $C0, $0A
DATA_01874C:         db $00, $0A, $22, $EB, $08
DATA_018751:         db $05, $11, $20, $F0, $08
DATA_018756:         db $02, $6B, $1C, $AB, $0A
DATA_01875B:         db $00, $00, $00, $00, $00

DATA_018760:         db $02, $5F, $1B, $29, $08
DATA_018765:         db $05, $F6, $23, $F7, $04
DATA_01876A:         db $00, $65, $1A, $73, $07
DATA_01876F:         db $00, $EF, $21, $16, $07
DATA_018774:         db $05, $F5, $25, $35, $07
DATA_018779:         db $02, $4E, $1A, $3E, $04
DATA_01877E:         db $00, $00, $00, $00, $00

DATA_018783:         db $02, $67, $1D, $3B, $04
DATA_018788:         db $05, $16, $1D, $3C, $07
DATA_01878D:         db $00, $77, $1D, $5F, $04
DATA_018792:         db $00, $16, $25, $5D, $04
DATA_018797:         db $05, $12, $1E, $3C, $07
DATA_01879C:         db $02, $58, $1D, $74, $04
DATA_0187A1:         db $00, $00, $00, $00, $00

DATA_0187A6:         db $02, $00, $00, $00, $00
DATA_0187AB:         db $05, $00, $00, $00, $00
DATA_0187B0:         db $00, $00, $00, $00, $00
DATA_0187B5:         db $00, $00, $00, $00, $00
DATA_0187BA:         db $05, $00, $00, $00, $00
DATA_0187BF:         db $02, $00, $00, $00, $00
DATA_0187C4:         db $00, $00, $00, $00, $00

DATA_0187C9:         db $02, $C0, $0C, $00, $00
DATA_0187CE:         db $05, $60, $08, $00, $00
DATA_0187D3:         db $00, $80, $08, $00, $00
DATA_0187D8:         db $00, $00, $00, $00, $00
DATA_0187DD:         db $05, $60, $08, $00, $00
DATA_0187E2:         db $02, $C0, $0C, $00, $00
DATA_0187E7:         db $00, $00, $00, $00, $00

DATA_0187EC:         db $02, $80, $08, $00, $00
DATA_0187F1:         db $05, $80, $08, $00, $00
DATA_0187F6:         db $00, $00, $00, $00, $00
DATA_0187FB:         db $00, $80, $08, $00, $00
DATA_018800:         db $05, $80, $08, $00, $00
DATA_018805:         db $02, $80, $08, $00, $00
DATA_01880A:         db $00, $00, $00, $00, $00

DATA_01880F:         db $02, $DF, $14, $B9, $06
DATA_018814:         db $00, $B4, $0E, $D8, $09
DATA_018819:         db $00, $F2, $20, $DF, $07
DATA_01881E:         db $00, $A0, $16, $7A, $0C
DATA_018823:         db $01, $9B, $15, $BC, $07
DATA_018828:         db $00, $EA, $1A, $D3, $08
DATA_01882D:         db $00, $E0, $08, $00, $00

DATA_018832:         db $02, $E5, $17, $B9, $06
DATA_018837:         db $00, $A4, $0C, $D9, $08
DATA_01883C:         db $00, $F0, $1F, $E2, $07
DATA_018841:         db $00, $9A, $15, $79, $0C
DATA_018846:         db $01, $A0, $13, $B9, $07
DATA_01884B:         db $00, $EC, $14, $D7, $08
DATA_018850:         db $00, $EF, $08, $00, $00

DATA_018855:         db $02, $E8, $1A, $BC, $06
DATA_01885A:         db $01, $A2, $0C, $B0, $08
DATA_01885F:         db $00, $EF, $1E, $E1, $07
DATA_018864:         db $00, $95, $14, $7B, $0D
DATA_018869:         db $01, $A6, $10, $BD, $07
DATA_01886E:         db $02, $F0, $14, $B6, $06
DATA_018873:         db $00, $F9, $08, $00, $00

DATA_018878:         db $02, $EC, $1D, $BA, $06
DATA_01887D:         db $02, $A4, $0C, $AD, $06
DATA_018882:         db $00, $EF, $1D, $DD, $07
DATA_018887:         db $00, $99, $17, $7A, $0C
DATA_01888C:         db $01, $B0, $0E, $B9, $07
DATA_018891:         db $01, $EF, $14, $AF, $09
DATA_018896:         db $00, $EF, $08, $00, $00

DATA_01889B:         db $00, $EC, $1D, $D5, $07
DATA_0188A0:         db $01, $9F, $13, $B8, $07
DATA_0188A5:         db $00, $EE, $1C, $E1, $07
DATA_0188AA:         db $00, $9E, $17, $7A, $0C
DATA_0188AF:         db $00, $AE, $0E, $D4, $08
DATA_0188B4:         db $02, $DE, $12, $BB, $06
DATA_0188B9:         db $00, $E0, $08, $00, $00

DATA_0188BE:         db $00, $EF, $18, $D0, $07
DATA_0188C3:         db $01, $A5, $11, $BC, $07
DATA_0188C8:         db $00, $EF, $1D, $E3, $07
DATA_0188CD:         db $00, $99, $17, $79, $0C
DATA_0188D2:         db $01, $9E, $0E, $CC, $07
DATA_0188D7:         db $02, $E1, $15, $B4, $05
DATA_0188DC:         db $00, $EF, $08, $00, $00

DATA_0188E1:         db $02, $F2, $17, $BA, $06
DATA_0188E6:         db $01, $AF, $0E, $B9, $07
DATA_0188EB:         db $00, $EF, $1E, $DE, $07
DATA_0188F0:         db $00, $94, $15, $79, $0C
DATA_0188F5:         db $01, $9C, $0B, $BC, $07
DATA_0188FA:         db $02, $E6, $18, $BA, $06
DATA_0188FF:         db $00, $F9, $08, $00, $00

DATA_018904:         db $01, $F0, $18, $A8, $08
DATA_018909:         db $01, $B9, $0D, $BC, $07
DATA_01890E:         db $00, $F0, $1F, $DF, $07
DATA_018913:         db $00, $9A, $15, $79, $0C
DATA_018918:         db $02, $9D, $0E, $AF, $08
DATA_01891D:         db $02, $EA, $1B, $B7, $06
DATA_018922:         db $00, $EF, $08, $00, $00
; end body part frames table

; hookbill rotational values for body parts
; each chunk of 5 bytes is one frame
; each byte is an angle (how rotated it is)
; this is used by GSU when drawing
; the 5 bytes are laid out as follows:
; byte 1: legs
; byte 2: arms
; byte 3: tail
; byte 4: head
; byte 5: shell
DATA_018927:         db $00, $00, $00, $00, $F6
DATA_01892C:         db $00, $00, $00, $00, $D5
DATA_018931:         db $00, $00, $00, $00, $EC
DATA_018936:         db $C0, $40, $C0, $20, $00
DATA_01893B:         db $95, $15, $95, $20, $D5
DATA_018940:         db $60, $F0, $40, $E0, $00
DATA_018945:         db $70, $E0, $00, $10, $00
DATA_01894A:         db $60, $D0, $40, $E8, $0C
DATA_01894F:         db $00, $A0, $00, $C0, $C8
DATA_018954:         db $FC, $E0, $10, $C0, $C4
DATA_018959:         db $00, $A0, $00, $B0, $B0
DATA_01895E:         db $F0, $C0, $10, $B0, $A8
DATA_018963:         db $AC, $5C, $AC, $7C, $7C
DATA_018968:         db $E4, $54, $C4, $64, $84
DATA_01896D:         db $78, $50, $70, $88, $70
DATA_018972:         db $88, $80, $80, $98, $80
DATA_018977:         db $40, $C0, $40, $A0, $80
DATA_01897C:         db $30, $B0, $30, $90, $70
DATA_018981:         db $C0, $40, $A0, $60, $00
DATA_018986:         db $00, $00, $00, $00, $E0
DATA_01898B:         db $00, $00, $00, $00, $20
DATA_018990:         db $40, $C0, $40, $D0, $80
DATA_018995:         db $00, $00, $00, $00, $80
DATA_01899A:         db $00, $00, $00, $10, $F6
DATA_01899F:         db $00, $00, $04, $10, $F6


hookbill_state_ptr:
; crawl sequence:
CODE_0189A4:         dw $9312       ; 00: restart crawl sequence - check if run needed (if yoshi is close)
CODE_0189A6:         dw $9367       ; 01: crawling a little bit on all fours

; jumping on head sequence:
CODE_0189A8:         dw $9400       ; 02: spit egg (head goes down a bit)
CODE_0189AA:         dw $9417       ; 03: head nudge back up
CODE_0189AC:         dw $9428       ; 04: head go back to normal, stay frozen a bit, go back to 01

; jumping on shell sequence:
CODE_0189AE:         dw $9439       ; 05: spit egg (head goes down a bit)
CODE_0189B0:         dw $9459       ; 06: head nudge back up
CODE_0189B2:         dw $9428       ; 07: head go back to normal, stay frozen a bit, go back to 01

; run sequence:
CODE_0189B4:         dw $946A       ; 08: bob head slightly up (from the crawl)
CODE_0189B6:         dw $9473       ; 09: stare forward not moving for a few
CODE_0189B8:         dw $946A       ; 0A: stand up
CODE_0189BA:         dw $9494       ; 0B: walk forward until yoshi close
CODE_0189BC:         dw $9529       ; 0C: hunch forward
CODE_0189BE:         dw $9540       ; 0D: (hit with egg while in the midst of standing up, closes eyes for a bit and skips to 0A afterward)
CODE_0189C0:         dw $9563       ; 0E: run forward until yoshi close
CODE_0189C2:         dw $96AE       ; 0F: dives at yoshi
CODE_0189C4:         dw $96EC       ; 10: landing on ground, bobbing a bit
CODE_0189C6:         dw $9709       ; 11: more landing/bobbing
CODE_0189C8:         dw $973D       ; 12: more landing/bobbing
CODE_0189CA:         dw $9772       ; 13: more landing/bobbing
CODE_0189CC:         dw $9780       ; 14: blinking after landing
CODE_0189CE:         dw $97B8       ; 15: gets up back to a crawl

; turn around on all fours sequence:
CODE_0189D0:         dw $97C9       ; 16: body into shell
CODE_0189D2:         dw $97E3       ; 17: jump up and turn around

; turn around while standing sequence:
CODE_0189D4:         dw $981D       ; 18: jump up and retract body into shell
CODE_0189D6:         dw $983D       ; 19: rotate slightly
CODE_0189D8:         dw $983D       ; 1A: rotate again, turning fully around
CODE_0189DA:         dw $9876       ; 1B: fall back down and body comes back out, switch to 09

; getting egged sequence:
CODE_0189DC:         dw $9898       ; 1C: first two egg hits (init & jump to 1D immediately)
CODE_0189DE:         dw $98A6       ; 1D: angle backward, cry & wobble arms, ready for the next hit
CODE_0189E0:         dw $98E8       ; 1E: if not egged again, retract back to standing, switch to 09
CODE_0189E2:         dw $9903       ; 1F: third egg hit (init & jump to 20 immediately)
CODE_0189E4:         dw $9931       ; 20: hop up in the air from the third egg hit
CODE_0189E6:         dw $994A       ; 21: fall back down while leaning backward
CODE_0189E8:         dw $9991       ; 22: lean back to center
CODE_0189EA:         dw $99AE       ; 23: wobbling on back helpless
CODE_0189EC:         dw $99FB       ; 24: frozen on back

; hopping in shell sequence:
CODE_0189EE:         dw $9A31       ; 25: wobbling back and forth after getting hit
CODE_0189F0:         dw $9A92       ; 26: one hop toward yoshi, turning around 180 degrees
CODE_0189F2:         dw $9B23       ; 27: two hops toward yoshi in the same fashion
CODE_0189F4:         dw $9BA4       ; 28: pound onto ground, wait a bit, body come out of shell

; ground pounded sequence:
CODE_0189F6:         dw $9BF9       ; 29: initial hit, squishes & turns yellow
CODE_0189F8:         dw $9C51       ; 2A: flashes yellow then stretches back to normal

; beginning cinematic sequence:
CODE_0189FA:         dw $9CC9       ; 2B: small hookbill walking over
CODE_0189FC:         dw $9CF7       ; 2C: waits on kamek routine to finish (via a flag)
CODE_0189FE:         dw $9D0F       ; 2D: init/prep for growing
CODE_018A00:         dw $9DE7       ; 2E: init/prep for growing
CODE_018A02:         dw $9EB6       ; 2F: small hookbill crouching down ready to grow
CODE_018A04:         dw $9F57       ; 30: turns into real hookbill shell
CODE_018A06:         dw $9F7A       ; 31: shell growing (and bobbing back and forth)
CODE_018A08:         dw $9BA4       ; 32: body comes out of shell, fight begin prep

; death sequence:
CODE_018A0A:         dw $9BF9       ; 33: initially dead, turn yellow
CODE_018A0C:         dw $9FE5       ; 34: flashes yellow and squishes down a bit
CODE_018A0E:         dw $A099       ; 35: squishes down and down into a pancake
CODE_018A10:         dw $A1DC       ; 36: shell break, small koopa goes up then down middle
CODE_018A12:         dw $A226       ; 37: dead, final state, do boss key bullshit etc.

.main_hookbill
$01/8A14 AC 80 10    LDY $1080  [$17:1080]   ;
$01/8A17 F0 0B       BEQ $0B    [$8A24]      ;
$01/8A19 88          DEY                     ;
$01/8A1A D0 0D       BNE $0D    [$8A29]      ;
$01/8A1C 20 1C 8D    JSR $8D1C  [$00:8D1C]   ;
$01/8A1F 20 50 8A    JSR $8A50  [$00:8A50]   ;
$01/8A22 80 08       BRA $08    [$8A2C]      ;

$01/8A24 20 D8 8C    JSR $8CD8  [$00:8CD8]   ;
$01/8A27 80 03       BRA $03    [$8A2C]      ;

$01/8A29 20 C7 8C    JSR $8CC7  [$00:8CC7]   ;
$01/8A2C 22 23 AF 03 JSL $03AF23[$03:AF23]   ;
$01/8A30 9B          TXY                     ;
$01/8A31 B5 76       LDA $76,x  [$00:0076]   ;
$01/8A33 0A          ASL A                   ;
$01/8A34 AA          TAX                     ;
$01/8A35 FC A4 89    JSR ($89A4,x)[$00:7A36] ; pointer table
$01/8A38 AC 80 10    LDY $1080  [$00:1080]   ;
$01/8A3B F0 12       BEQ $12    [$8A4F]      ;
$01/8A3D 88          DEY                     ;
$01/8A3E D0 0F       BNE $0F    [$8A4F]      ;
$01/8A40 20 BB 91    JSR $91BB  [$00:91BB]   ;
$01/8A43 20 2A 92    JSR $922A  [$00:922A]   ;
$01/8A46 20 95 8A    JSR $8A95  [$00:8A95]   ;
$01/8A49 20 4D 92    JSR $924D  [$00:924D]   ;
$01/8A4C 20 DA 92    JSR $92DA  [$00:92DA]   ;
$01/8A4F 6B          RTL                     ;

; hookbill s sub
$01/8A50 AD 60 10    LDA $1060  [$00:1060]   ;
$01/8A53 0A          ASL A                   ;
$01/8A54 BC 00 74    LDY $7400,x[$00:7400]   ;
$01/8A57 F0 07       BEQ $07    [$8A60]      ;
$01/8A59 49 FF FF    EOR #$FFFF              ;
$01/8A5C 1A          INC A                   ;
$01/8A5D 29 FE 01    AND #$01FE              ;
$01/8A60 8D 02 30    STA $3002  [$00:3002]   ;
$01/8A63 AD 76 10    LDA $1076  [$00:1076]   ;
$01/8A66 0A          ASL A                   ;
$01/8A67 8D 0C 30    STA $300C  [$00:300C]   ;
$01/8A6A AD 78 10    LDA $1078  [$00:1078]   ;
$01/8A6D 0A          ASL A                   ;
$01/8A6E 8D 04 30    STA $3004  [$00:3004]   ;
$01/8A71 A2 08       LDX #$08                ;
$01/8A73 A9 00 A0    LDA #$A000              ;
$01/8A76 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/8A7A AD 06 30    LDA $3006  [$00:3006]   ;
$01/8A7D 8D 51 09    STA $0951  [$00:0951]   ;
$01/8A80 AD 0A 30    LDA $300A  [$00:300A]   ;
$01/8A83 8D 4F 09    STA $094F  [$00:094F]   ;
$01/8A86 AD 0E 30    LDA $300E  [$00:300E]   ;
$01/8A89 8D 53 09    STA $0953  [$00:0953]   ;
$01/8A8C AD 10 30    LDA $3010  [$00:3010]   ;
$01/8A8F 8D 55 09    STA $0955  [$00:0955]   ;
$01/8A92 A6 12       LDX $12    [$00:0012]   ;
$01/8A94 60          RTS                     ;

; hookbill s sub
$01/8A95 AC 70 10    LDY $1070  [$00:1070]   ;
$01/8A98 F0 1B       BEQ $1B    [$8AB5]      ;
$01/8A9A AD 74 79    LDA $7974  [$00:7974]   ;
$01/8A9D 29 01 00    AND #$0001              ;
$01/8AA0 F0 08       BEQ $08    [$8AAA]      ;
$01/8AA2 20 C9 8A    JSR $8AC9  [$00:8AC9]   ;
$01/8AA5 20 E1 8A    JSR $8AE1  [$00:8AE1]   ;
$01/8AA8 80 06       BRA $06    [$8AB0]      ;

$01/8AAA 20 B6 8A    JSR $8AB6  [$00:8AB6]   ;
$01/8AAD 20 15 8B    JSR $8B15  [$00:8B15]   ;
$01/8AB0 EE F9 0C    INC $0CF9  [$00:0CF9]   ;
$01/8AB3 A6 12       LDX $12    [$00:0012]   ;
$01/8AB5 60          RTS                     ;

; hookbill routine: draw arm
$01/8AB6 A9 E1 E0    LDA #$E0E1              ; arm graphic
$01/8AB9 8D 18 30    STA $3018  [$00:3018]   ;
$01/8ABC A0 54       LDY #$54                ;
$01/8ABE A9 60 00    LDA #$0060              ;
$01/8AC1 8D 06 30    STA $3006  [$00:3006]   ;
$01/8AC4 AD 62 10    LDA $1062  [$00:1062]   ;
$01/8AC7 80 2C       BRA $2C    [$8AF5]      ;

; hookbill routine: draw leg
$01/8AC9 A9 81 E0    LDA #$E081              ; leg graphic
$01/8ACC 8D 18 30    STA $3018  [$00:3018]   ;
$01/8ACF A0 54       LDY #$54                ;
$01/8AD1 9C 06 30    STZ $3006  [$00:3006]   ;
$01/8AD4 AD 64 10    LDA $1064  [$00:1064]   ;
$01/8AD7 80 1C       BRA $1C    [$8AF5]      ;

; hookbill: different head animation frames
; these are addresses of bank $29
CODE_018AD9:         dw $E0C1                ; default head
CODE_018ADB:         dw $C0C1                ; spitting egg
CODE_018ADD:         dw $C081                ; crying
CODE_018ADF:         dw $C0A1                ; closing his eyes

; hookbill routine: draw head
$01/8AE1 AC 74 10    LDY $1074  [$00:1074]   ; head animation frame
$01/8AE4 B9 D9 8A    LDA $8AD9,y[$00:8AD9]   ;
$01/8AE7 8D 18 30    STA $3018  [$00:3018]   ;
$01/8AEA A0 54       LDY #$54                ; rom bank
$01/8AEC A9 40 00    LDA #$0040              ;
$01/8AEF 8D 06 30    STA $3006  [$00:3006]   ;
$01/8AF2 AD 68 10    LDA $1068  [$00:1068]   ;
$01/8AF5 8D 0A 30    STA $300A  [$00:300A]   ;
$01/8AF8 98          TYA                     ;
$01/8AF9 8D 1A 30    STA $301A  [$00:301A]   ;
$01/8AFC AD 76 10    LDA $1076  [$00:1076]   ;
$01/8AFF 8D 0C 30    STA $300C  [$00:300C]   ;
$01/8B02 AD 78 10    LDA $1078  [$00:1078]   ;
$01/8B05 8D 16 30    STA $3016  [$00:3016]   ;
$01/8B08 9C 04 30    STZ $3004  [$00:3004]   ;
$01/8B0B A2 08       LDX #$08                ;
$01/8B0D A9 A5 84    LDA #$84A5              ;
$01/8B10 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; gsu drawing routine
$01/8B14 60          RTS                     ;

; hookbill routine: draw tail
$01/8B15 A9 A1 E0    LDA #$E0A1              ; tail graphic
$01/8B18 8D 18 30    STA $3018  [$00:3018]   ;
$01/8B1B A9 54 00    LDA #$0054              ;
$01/8B1E 8D 1A 30    STA $301A  [$00:301A]   ;
$01/8B21 AD 66 10    LDA $1066  [$00:1066]   ;
$01/8B24 8D 0A 30    STA $300A  [$00:300A]   ;
$01/8B27 AD 76 10    LDA $1076  [$00:1076]   ;
$01/8B2A 8D 0C 30    STA $300C  [$00:300C]   ;
$01/8B2D AD 78 10    LDA $1078  [$00:1078]   ;
$01/8B30 8D 16 30    STA $3016  [$00:3016]   ;
$01/8B33 A9 20 00    LDA #$0020              ;
$01/8B36 8D 06 30    STA $3006  [$00:3006]   ;
$01/8B39 9C 04 30    STZ $3004  [$00:3004]   ;
$01/8B3C A2 08       LDX #$08                ;
$01/8B3E A9 5F 85    LDA #$855F              ;
$01/8B41 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; gsu drawing routine
$01/8B45 60          RTS                     ;

; hookbill OAM stuff used by gsu
; split up into hookbill's body parts
;
; each body part is made up of 4 OAM
; entries, except tail has only 1
; each body part is split up into one or more frames
; each frame contains information for
; each individual OAM entry that composes
; the full body part
;
; each frame consists of:
; byte  1: OAM x offset relative to body part
; byte  2: OAM y offset relative to body part
; bytes 3 & 4: same as OAM bytes 3 & 4
; byte  5: OAM size (00 or 02)

; near leg
DATA_018B46:         db $FC, $FC, $20, $0D, $00
DATA_018B4B:         db $0C, $0C, $1E, $0D, $00
DATA_018B50:         db $FC, $04, $0C, $0D, $02
DATA_018B55:         db $04, $FC, $0E, $0D, $02

DATA_018B5A:         db $FC, $FC, $3A, $0D, $00
DATA_018B5F:         db $0C, $0C, $1A, $0D, $00
DATA_018B64:         db $FC, $04, $08, $0D, $02
DATA_018B69:         db $04, $FC, $0A, $0D, $02

DATA_018B6E:         db $F8, $F8, $C0, $0D, $02
DATA_018B73:         db $08, $F8, $C2, $0D, $02
DATA_018B78:         db $F8, $08, $E0, $0D, $02
DATA_018B7D:         db $08, $08, $E2, $0D, $02


; near arm
DATA_018B82:         db $FC, $0C, $35, $0D, $00
DATA_018B87:         db $04, $04, $26, $0D, $02
DATA_018B8C:         db $FC, $FC, $24, $0D, $02
DATA_018B91:         db $FC, $FC, $24, $0D, $00

DATA_018B96:         db $04, $FC, $22, $0D, $02
DATA_018B9B:         db $FC, $0C, $2C, $0D, $00
DATA_018BA0:         db $04, $04, $20, $0D, $02
DATA_018BA5:         db $04, $04, $20, $0D, $00

DATA_018BAA:         db $0C, $0C, $21, $0D, $00
DATA_018BAF:         db $FC, $04, $28, $0D, $02
DATA_018BB4:         db $04, $FC, $2A, $0D, $02
DATA_018BB9:         db $04, $FC, $2A, $0D, $00

DATA_018BBE:         db $FC, $04, $00, $0D, $02
DATA_018BC3:         db $0C, $0C, $12, $0D, $00
DATA_018BC8:         db $04, $FC, $02, $0D, $02
DATA_018BCD:         db $04, $FC, $02, $0D, $00

DATA_018BD2:         db $0C, $0C, $16, $0D, $00
DATA_018BD7:         db $FC, $04, $04, $0D, $02
DATA_018BDC:         db $04, $FC, $06, $0D, $02
DATA_018BE1:         db $04, $FC, $06, $0D, $00

DATA_018BE6:         db $F8, $F8, $CC, $0D, $02
DATA_018BEB:         db $08, $F8, $CE, $0D, $02
DATA_018BF0:         db $F8, $08, $EC, $0D, $02
DATA_018BF5:         db $08, $08, $EE, $0D, $02


; tail
DATA_018BFA:         db $00, $00, $D5, $0D, $02


; head
DATA_018BFF:         db $F8, $F8, $C8, $0D, $02
DATA_018C04:         db $08, $F8, $CA, $0D, $02
DATA_018C09:         db $F8, $08, $E8, $0D, $02
DATA_018C0E:         db $08, $08, $EA, $0D, $02


; far arm
DATA_018C13:         db $FC, $0C, $35, $0F, $00
DATA_018C18:         db $04, $04, $26, $0F, $02
DATA_018C1D:         db $FC, $FC, $24, $0F, $02
DATA_018C22:         db $FC, $FC, $24, $0F, $00

DATA_018C27:         db $04, $FC, $22, $0F, $02
DATA_018C2C:         db $FC, $0C, $2C, $0F, $00
DATA_018C31:         db $04, $04, $20, $0F, $02
DATA_018C36:         db $04, $04, $20, $0F, $00

DATA_018C3B:         db $0C, $0C, $21, $0F, $00
DATA_018C40:         db $FC, $04, $28, $0F, $02
DATA_018C45:         db $04, $FC, $2A, $0F, $02
DATA_018C4A:         db $04, $FC, $2A, $0F, $00

DATA_018C4F:         db $FC, $04, $00, $0F, $02
DATA_018C54:         db $0C, $0C, $12, $0F, $00
DATA_018C59:         db $04, $FC, $02, $0F, $02
DATA_018C5E:         db $04, $FC, $02, $0F, $00

DATA_018C63:         db $0C, $0C, $16, $0F, $00
DATA_018C68:         db $FC, $04, $04, $0F, $02
DATA_018C6D:         db $04, $FC, $06, $0F, $02
DATA_018C72:         db $04, $FC, $06, $0F, $00

DATA_018C77:         db $F8, $F8, $CC, $0F, $02
DATA_018C7C:         db $08, $F8, $CE, $0F, $02
DATA_018C81:         db $F8, $08, $EC, $0F, $02
DATA_018C86:         db $08, $08, $EE, $0F, $02


; far leg
DATA_018C8B:         db $FC, $FC, $20, $0F, $00
DATA_018C90:         db $0C, $0C, $1E, $0F, $00
DATA_018C95:         db $FC, $04, $0C, $0F, $02
DATA_018C9A:         db $04, $FC, $0E, $0F, $02

DATA_018C9F:         db $FC, $FC, $3A, $0F, $00
DATA_018CA4:         db $0C, $0C, $1A, $0F, $00
DATA_018CA9:         db $FC, $04, $08, $0F, $02
DATA_018CAE:         db $04, $FC, $0A, $0F, $02

DATA_018CB3:         db $F8, $F8, $C0, $0F, $02
DATA_018CB8:         db $08, $F8, $C2, $0F, $02
DATA_018CBD:         db $F8, $08, $E0, $0F, $02
DATA_018CC2:         db $08, $08, $E2, $0F, $02


; hookbill s sub
$01/8CC7 C2 10       REP #$10                ;
$01/8CC9 BC 62 73    LDY $7362,x[$04:7362]   ;
$01/8CCC B9 24 60    LDA $6024,y[$04:6064]   ;
$01/8CCF 29 F0 FF    AND #$FFF0              ;
$01/8CD2 09 04 00    ORA #$0004              ;
$01/8CD5 99 24 60    STA $6024,y[$00:6024]   ;
$01/8CD8 C2 10       REP #$10                ; entry point
$01/8CDA A9 06 00    LDA #$0006              ;
$01/8CDD 85 00       STA $00    [$00:0000]   ;
$01/8CDF BC 62 73    LDY $7362,x[$00:7362]   ;
$01/8CE2 AD 15 10    LDA $1015  [$00:1015]   ;
$01/8CE5 C9 02 00    CMP #$0002              ;
$01/8CE8 F0 19       BEQ $19    [$8D03]      ;
$01/8CEA B9 04 60    LDA $6004,y[$00:6004]   ;
$01/8CED 29 FF F1    AND #$F1FF              ;
$01/8CF0 09 00 02    ORA #$0200              ;
$01/8CF3 99 04 60    STA $6004,y[$00:6004]   ;
$01/8CF6 98          TYA                     ;
$01/8CF7 18          CLC                     ;
$01/8CF8 69 08 00    ADC #$0008              ;
$01/8CFB A8          TAY                     ;
$01/8CFC C6 00       DEC $00    [$00:0000]   ;
$01/8CFE D0 EA       BNE $EA    [$8CEA]      ;
$01/8D00 E2 10       SEP #$10                ;
$01/8D02 60          RTS                     ;

$01/8D03 B9 04 60    LDA $6004,y[$00:6004]   ;
$01/8D06 29 FF F1    AND #$F1FF              ;
$01/8D09 09 00 0C    ORA #$0C00              ;
$01/8D0C 99 04 60    STA $6004,y[$00:6004]   ;
$01/8D0F 98          TYA                     ;
$01/8D10 18          CLC                     ;
$01/8D11 69 08 00    ADC #$0008              ;
$01/8D14 A8          TAY                     ;
$01/8D15 C6 00       DEC $00    [$00:0000]   ;
$01/8D17 D0 EA       BNE $EA    [$8D03]      ;
$01/8D19 E2 10       SEP #$10                ;
$01/8D1B 60          RTS                     ;

; hookbill s sub
$01/8D1C 8A          TXA                     ;
$01/8D1D 8D 14 30    STA $3014  [$00:3014]   ;
$01/8D20 A9 01 00    LDA #$0001              ; \
$01/8D23 8D 00 60    STA $6000  [$00:6000]   ; / pass in rom bank
$01/8D26 BD 02 74    LDA $7402,x[$00:7402]   ;
$01/8D29 8D 02 60    STA $6002  [$00:6002]   ;
$01/8D2C B4 78       LDY $78,x  [$00:0078]   ;
$01/8D2E 98          TYA                     ;
$01/8D2F 8D 04 60    STA $6004  [$00:6004]   ;
$01/8D32 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/8D35 8D 06 60    STA $6006  [$00:6006]   ;
$01/8D38 BD 38 7A    LDA $7A38,x[$00:7A38]   ;
$01/8D3B 8D 08 60    STA $6008  [$00:6008]   ;
$01/8D3E BD 00 79    LDA $7900,x[$00:7900]   ;
$01/8D41 8D 0A 60    STA $600A  [$00:600A]   ;
$01/8D44 BD 80 76    LDA $7680,x[$00:7680]   ;
$01/8D47 18          CLC                     ;
$01/8D48 69 08 00    ADC #$0008              ;
$01/8D4B 8D 0E 60    STA $600E  [$00:600E]   ;
$01/8D4E BD 82 76    LDA $7682,x[$00:7682]   ;
$01/8D51 18          CLC                     ;
$01/8D52 69 08 00    ADC #$0008              ;
$01/8D55 8D 10 60    STA $6010  [$00:6010]   ;
$01/8D58 A9 46 8B    LDA #$8B46              ;
$01/8D5B 8D 12 60    STA $6012  [$00:6012]   ;
$01/8D5E A9 82 8B    LDA #$8B82              ;
$01/8D61 8D 14 60    STA $6014  [$00:6014]   ;
$01/8D64 A9 FA 8B    LDA #$8BFA              ;
$01/8D67 8D 16 60    STA $6016  [$00:6016]   ;
$01/8D6A A9 FF 8B    LDA #$8BFF              ;
$01/8D6D 8D 18 60    STA $6018  [$00:6018]   ;
$01/8D70 A9 13 8C    LDA #$8C13              ;
$01/8D73 8D 1A 60    STA $601A  [$00:601A]   ;
$01/8D76 A9 8B 8C    LDA #$8C8B              ;
$01/8D79 8D 1C 60    STA $601C  [$00:601C]   ;
$01/8D7C A9 97 82    LDA #$8297              ;
$01/8D7F 8D 1E 60    STA $601E  [$00:601E]   ;
$01/8D82 AD 6A 10    LDA $106A  [$00:106A]   ;
$01/8D85 8D 26 60    STA $6026  [$00:6026]   ;
$01/8D88 AD 6C 10    LDA $106C  [$00:106C]   ;
$01/8D8B 8D 28 60    STA $6028  [$00:6028]   ;
$01/8D8E AD 5C 10    LDA $105C  [$00:105C]   ;
$01/8D91 8D 2A 60    STA $602A  [$00:602A]   ;
$01/8D94 AD 5E 10    LDA $105E  [$00:105E]   ;
$01/8D97 8D 2C 60    STA $602C  [$00:602C]   ;
$01/8D9A A9 27 89    LDA #$8927              ;
$01/8D9D 8D 2E 60    STA $602E  [$00:602E]   ;
$01/8DA0 BD 02 79    LDA $7902,x[$00:7902]   ;
$01/8DA3 8D 30 60    STA $6030  [$00:6030]   ;
$01/8DA6 AD 6E 10    LDA $106E  [$00:106E]   ;
$01/8DA9 8D 32 60    STA $6032  [$00:6032]   ;
$01/8DAC AD 7A 10    LDA $107A  [$00:107A]   ;
$01/8DAF 8D 46 60    STA $6046  [$00:6046]   ;
$01/8DB2 AD 76 10    LDA $1076  [$00:1076]   ;
$01/8DB5 8D 50 60    STA $6050  [$00:6050]   ;
$01/8DB8 AD 78 10    LDA $1078  [$00:1078]   ;
$01/8DBB 8D 52 60    STA $6052  [$00:6052]   ;
$01/8DBE A2 08       LDX #$08                ;
$01/8DC0 A9 BA A3    LDA #$A3BA              ;
$01/8DC3 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/8DC7 A6 12       LDX $12    [$00:0012]   ;
$01/8DC9 AD 26 60    LDA $6026  [$00:6026]   ;
$01/8DCC 8D 6A 10    STA $106A  [$00:106A]   ;
$01/8DCF AD 28 60    LDA $6028  [$00:6028]   ;
$01/8DD2 8D 6C 10    STA $106C  [$00:106C]   ;
$01/8DD5 AD 34 60    LDA $6034  [$00:6034]   ;
$01/8DD8 8D 64 10    STA $1064  [$00:1064]   ;
$01/8DDB AD 36 60    LDA $6036  [$00:6036]   ;
$01/8DDE 8D 62 10    STA $1062  [$00:1062]   ;
$01/8DE1 AD 38 60    LDA $6038  [$00:6038]   ;
$01/8DE4 8D 66 10    STA $1066  [$00:1066]   ;
$01/8DE7 AD 3A 60    LDA $603A  [$00:603A]   ;
$01/8DEA 8D 68 10    STA $1068  [$00:1068]   ;
$01/8DED AD 3C 60    LDA $603C  [$00:603C]   ;
$01/8DF0 8D 60 10    STA $1060  [$00:1060]   ;
$01/8DF3 20 9B 90    JSR $909B  [$00:909B]   ;
$01/8DF6 AC 72 10    LDY $1072  [$00:1072]   ;
$01/8DF9 D0 2A       BNE $2A    [$8E25]      ;
$01/8DFB BD 20 77    LDA $7720,x[$00:7720]   ;
$01/8DFE 85 00       STA $00    [$00:0000]   ;
$01/8E00 AD 3E 60    LDA $603E  [$00:603E]   ;
$01/8E03 38          SEC                     ;
$01/8E04 FD 82 76    SBC $7682,x[$00:7682]   ;
$01/8E07 18          CLC                     ;
$01/8E08 69 FB FF    ADC #$FFFB              ;
$01/8E0B 9D 20 77    STA $7720,x[$00:7720]   ;
$01/8E0E 38          SEC                     ;
$01/8E0F E5 00       SBC $00    [$00:0000]   ;
$01/8E11 85 00       STA $00    [$00:0000]   ;
$01/8E13 18          CLC                     ;
$01/8E14 69 04 00    ADC #$0004              ;
$01/8E17 C9 08 00    CMP #$0008              ;
$01/8E1A 90 09       BCC $09    [$8E25]      ;
$01/8E1C BD 82 71    LDA $7182,x[$00:7182]   ;
$01/8E1F 38          SEC                     ;
$01/8E20 E5 00       SBC $00    [$00:0000]   ;
$01/8E22 9D 82 71    STA $7182,x[$00:7182]   ;
$01/8E25 AD 22 60    LDA $6022  [$00:6022]   ;
$01/8E28 85 0A       STA $0A    [$00:000A]   ;
$01/8E2A AD 24 60    LDA $6024  [$00:6024]   ;
$01/8E2D 85 0C       STA $0C    [$00:000C]   ;
$01/8E2F BD 80 76    LDA $7680,x[$00:7680]   ;
$01/8E32 18          CLC                     ;
$01/8E33 69 60 00    ADC #$0060              ;
$01/8E36 C9 C0 01    CMP #$01C0              ;
$01/8E39 90 08       BCC $08    [$8E43]      ;
$01/8E3B A9 60 01    LDA #$0160              ;
$01/8E3E 8D 41 00    STA $0041  [$00:0041]   ;
$01/8E41 80 12       BRA $12    [$8E55]      ;

$01/8E43 A9 20 00    LDA #$0020              ;
$01/8E46 38          SEC                     ;
$01/8E47 E5 0A       SBC $0A    [$00:000A]   ;
$01/8E49 8D 41 00    STA $0041  [$00:0041]   ;
$01/8E4C A9 1C 00    LDA #$001C              ;
$01/8E4F 38          SEC                     ;
$01/8E50 E5 0C       SBC $0C    [$00:000C]   ;
$01/8E52 8D 43 00    STA $0043  [$00:0043]   ;
$01/8E55 A5 0A       LDA $0A    [$00:000A]   ;
$01/8E57 38          SEC                     ;
$01/8E58 FD 80 76    SBC $7680,x[$00:7680]   ;
$01/8E5B 9D 56 7B    STA $7B56,x[$00:7B56]   ;
$01/8E5E A5 0C       LDA $0C    [$00:000C]   ;
$01/8E60 38          SEC                     ;
$01/8E61 FD 82 76    SBC $7682,x[$00:7682]   ;
$01/8E64 9D 58 7B    STA $7B58,x[$00:7B58]   ;
$01/8E67 A9 11 00    LDA #$0011              ;
$01/8E6A 8D 83 0B    STA $0B83  [$00:0B83]   ;
$01/8E6D AD 6E 10    LDA $106E  [$00:106E]   ;
$01/8E70 29 00 FF    AND #$FF00              ;
$01/8E73 F0 03       BEQ $03    [$8E78]      ;
$01/8E75 9C 6E 10    STZ $106E  [$00:106E]   ;
$01/8E78 B4 76       LDY $76,x  [$00:0076]   ;
$01/8E7A C0 33       CPY #$33                ;
$01/8E7C 30 0D       BMI $0D    [$8E8B]      ;
$01/8E7E AD 58 60    LDA $6058  [$00:6058]   ;
$01/8E81 38          SEC                     ;
$01/8E82 ED 56 60    SBC $6056  [$00:6056]   ;
$01/8E85 38          SEC                     ;
$01/8E86 ED 22 61    SBC $6122  [$00:6122]   ;
$01/8E89 80 33       BRA $33    [$8EBE]      ;

$01/8E8B AD 5A 60    LDA $605A  [$00:605A]   ;
$01/8E8E 89 01 00    BIT #$0001              ;
$01/8E91 F0 01       BEQ $01    [$8E94]      ;
$01/8E93 60          RTS                     ;

$01/8E94 C9 08 00    CMP #$0008              ;
$01/8E97 D0 05       BNE $05    [$8E9E]      ;
$01/8E99 AD 58 60    LDA $6058  [$00:6058]   ;
$01/8E9C 10 03       BPL $03    [$8EA1]      ;
$01/8E9E 4C 72 8F    JMP $8F72  [$00:8F72]   ;

$01/8EA1 38          SEC                     ;
$01/8EA2 ED 56 60    SBC $6056  [$00:6056]   ;
$01/8EA5 38          SEC                     ;
$01/8EA6 ED 22 61    SBC $6122  [$00:6122]   ;
$01/8EA9 C9 F4 FF    CMP #$FFF4              ;
$01/8EAC 90 F0       BCC $F0    [$8E9E]      ;
$01/8EAE AC AB 60    LDY $60AB  [$00:60AB]   ;
$01/8EB1 30 E0       BMI $E0    [$8E93]      ;
$01/8EB3 BC 02 74    LDY $7402,x[$00:7402]   ;
$01/8EB6 C0 28       CPY #$28                ;
$01/8EB8 10 7E       BPL $7E    [$8F38]      ;
$01/8EBA C0 21       CPY #$21                ;
$01/8EBC 30 7A       BMI $7A    [$8F38]      ;
$01/8EBE 18          CLC                     ;
$01/8EBF 69 03 00    ADC #$0003              ;
$01/8EC2 18          CLC                     ;
$01/8EC3 6D 90 60    ADC $6090  [$00:6090]   ;
$01/8EC6 8D 90 60    STA $6090  [$00:6090]   ;
$01/8EC9 9C AA 60    STZ $60AA  [$00:60AA]   ;
$01/8ECC 9C C0 60    STZ $60C0  [$00:60C0]   ;
$01/8ECF EE B4 61    INC $61B4  [$00:61B4]   ;
$01/8ED2 B4 76       LDY $76,x  [$00:0076]   ;
$01/8ED4 C0 29       CPY #$29                ;
$01/8ED6 F0 08       BEQ $08    [$8EE0]      ;
$01/8ED8 C0 2A       CPY #$2A                ;
$01/8EDA F0 04       BEQ $04    [$8EE0]      ;
$01/8EDC C0 33       CPY #$33                ;
$01/8EDE 30 07       BMI $07    [$8EE7]      ;
$01/8EE0 A9 29 00    LDA #$0029              ;
$01/8EE3 8D BE 60    STA $60BE  [$00:60BE]   ;
$01/8EE6 60          RTS                     ;

$01/8EE7 AC D4 60    LDY $60D4  [$00:60D4]   ;
$01/8EEA F0 4B       BEQ $4B    [$8F37]      ;
$01/8EEC AC 7E 10    LDY $107E  [$00:107E]   ;
$01/8EEF CC 7C 10    CPY $107C  [$00:107C]   ;
$01/8EF2 D0 43       BNE $43    [$8F37]      ;
$01/8EF4 A9 60 00    LDA #$0060              ;
$01/8EF7 9D F6 7A    STA $7AF6,x[$00:7AF6]   ;
$01/8EFA A9 02 00    LDA #$0002              ;
$01/8EFD 8D AC 60    STA $60AC  [$00:60AC]   ;
$01/8F00 A9 29 00    LDA #$0029              ;
$01/8F03 EE 7C 10    INC $107C  [$00:107C]   ;
$01/8F06 EE 7C 10    INC $107C  [$00:107C]   ;
$01/8F09 AC 7C 10    LDY $107C  [$00:107C]   ;
$01/8F0C C0 06       CPY #$06                ;
$01/8F0E D0 0A       BNE $0A    [$8F1A]      ;
$01/8F10 22 82 A9 02 JSL $02A982[$02:A982]   ;
$01/8F14 EE 7B 0B    INC $0B7B  [$00:0B7B]   ;
$01/8F17 A9 33 00    LDA #$0033              ;
$01/8F1A 95 76       STA $76,x  [$00:0076]   ;
$01/8F1C A9 01 00    LDA #$0001              ;
$01/8F1F 9D 36 7A    STA $7A36,x[$00:7A36]   ;
$01/8F22 A0 24       LDY #$24                ;
$01/8F24 94 78       STY $78,x  [$00:0078]   ;
$01/8F26 A0 0F       LDY #$0F                ;
$01/8F28 8C 5E 10    STY $105E  [$00:105E]   ;
$01/8F2B A9 30 00    LDA #$0030              ;
$01/8F2E 95 18       STA $18,x  [$00:0018]   ;
$01/8F30 A9 80 00    LDA #$0080              ;\ play sound #$0080
$01/8F33 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/8F37 60          RTS                     ;

$01/8F38 A9 1C 00    LDA #$001C              ;\ play sound #$001C
$01/8F3B 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/8F3F B4 76       LDY $76,x  [$00:0076]   ;
$01/8F41 C0 0A       CPY #$0A                ;
$01/8F43 30 16       BMI $16    [$8F5B]      ;
$01/8F45 A9 00 FC    LDA #$FC00              ;
$01/8F48 8D AA 60    STA $60AA  [$00:60AA]   ;
$01/8F4B A9 06 00    LDA #$0006              ;
$01/8F4E 8D C0 60    STA $60C0  [$00:60C0]   ;
$01/8F51 A9 01 80    LDA #$8001              ;
$01/8F54 8D D2 60    STA $60D2  [$00:60D2]   ;
$01/8F57 9C D4 60    STZ $60D4  [$00:60D4]   ;
$01/8F5A 60          RTS                     ;

$01/8F5B 20 E3 8F    JSR $8FE3  [$00:8FE3]   ;
$01/8F5E BD 02 74    LDA $7402,x[$00:7402]   ;
$01/8F61 29 07 00    AND #$0007              ;
$01/8F64 18          CLC                     ;
$01/8F65 69 28 00    ADC #$0028              ;
$01/8F68 95 78       STA $78,x  [$00:0078]   ;
$01/8F6A A0 05       LDY #$05                ;
$01/8F6C 94 76       STY $76,x  [$00:0076]   ;
$01/8F6E A0 18       LDY #$18                ;
$01/8F70 80 4B       BRA $4B    [$8FBD]      ;

$01/8F72 C9 06 00    CMP #$0006              ;
$01/8F75 D0 05       BNE $05    [$8F7C]      ;
$01/8F77 AD 58 60    LDA $6058  [$00:6058]   ;
$01/8F7A 10 03       BPL $03    [$8F7F]      ;
$01/8F7C 4C D4 8F    JMP $8FD4  [$00:8FD4]   ;

$01/8F7F 38          SEC                     ;
$01/8F80 ED 56 60    SBC $6056  [$00:6056]   ;
$01/8F83 38          SEC                     ;
$01/8F84 ED 22 61    SBC $6122  [$00:6122]   ;
$01/8F87 C9 F4 FF    CMP #$FFF4              ;
$01/8F8A 90 F0       BCC $F0    [$8F7C]      ;
$01/8F8C B4 76       LDY $76,x  [$00:0076]   ;
$01/8F8E C0 0A       CPY #$0A                ;
$01/8F90 30 16       BMI $16    [$8FA8]      ;
$01/8F92 A9 00 FB    LDA #$FB00              ;
$01/8F95 8D AA 60    STA $60AA  [$00:60AA]   ;
$01/8F98 A9 06 00    LDA #$0006              ;
$01/8F9B 8D C0 60    STA $60C0  [$00:60C0]   ;
$01/8F9E A9 01 80    LDA #$8001              ;
$01/8FA1 8D D2 60    STA $60D2  [$00:60D2]   ;
$01/8FA4 9C D4 60    STZ $60D4  [$00:60D4]   ;
$01/8FA7 60          RTS                     ;

$01/8FA8 AC AB 60    LDY $60AB  [$00:60AB]   ;
$01/8FAB 30 8A       BMI $8A    [$8F37]      ;
$01/8FAD 20 E3 8F    JSR $8FE3  [$00:8FE3]   ;
$01/8FB0 A9 39 00    LDA #$0039              ;\ play sound #$0039
$01/8FB3 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/8FB7 A0 02       LDY #$02                ;
$01/8FB9 94 76       STY $76,x  [$00:0076]   ;
$01/8FBB A0 17       LDY #$17                ;
$01/8FBD 8C 5E 10    STY $105E  [$00:105E]   ;
$01/8FC0 A9 01 00    LDA #$0001              ;
$01/8FC3 9D 36 7A    STA $7A36,x[$00:7A36]   ;
$01/8FC6 EE 70 10    INC $1070  [$00:1070]   ;
$01/8FC9 A0 02       LDY #$02                ;
$01/8FCB 8C 74 10    STY $1074  [$00:1074]   ;
$01/8FCE A9 40 00    LDA #$0040              ;
$01/8FD1 95 18       STA $18,x  [$00:0018]   ;
$01/8FD3 60          RTS                     ;

$01/8FD4 B4 76       LDY $76,x  [$00:0076]   ;
$01/8FD6 C0 1C       CPY #$1C                ;
$01/8FD8 30 04       BMI $04    [$8FDE]      ;
$01/8FDA C0 27       CPY #$27                ;
$01/8FDC 30 04       BMI $04    [$8FE2]      ;
$01/8FDE 22 58 A8 03 JSL $03A858[$03:A858]   ;
$01/8FE2 60          RTS                     ;

; hookbill s sub
$01/8FE3 A9 00 FB    LDA #$FB00              ;
$01/8FE6 8D AA 60    STA $60AA  [$00:60AA]   ;
$01/8FE9 A9 06 00    LDA #$0006              ;
$01/8FEC 8D C0 60    STA $60C0  [$00:60C0]   ;
$01/8FEF A9 01 80    LDA #$8001              ;
$01/8FF2 8D D2 60    STA $60D2  [$00:60D2]   ;
$01/8FF5 9C D4 60    STZ $60D4  [$00:60D4]   ;
$01/8FF8 A5 10       LDA $10    [$00:0010]   ;
$01/8FFA 29 3E 00    AND #$003E              ;
$01/8FFD 8D 02 30    STA $3002  [$00:3002]   ;
$01/9000 A9 00 FD    LDA #$FD00              ;
$01/9003 8D 0C 30    STA $300C  [$00:300C]   ;
$01/9006 A2 0B       LDX #$0B                ;
$01/9008 A9 95 85    LDA #$8595              ;
$01/900B 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/900F A6 12       LDX $12    [$00:0012]   ;
$01/9011 AD 00 30    LDA $3000  [$00:3000]   ;
$01/9014 BC 00 74    LDY $7400,x[$00:7400]   ;
$01/9017 F0 04       BEQ $04    [$901D]      ;
$01/9019 49 FF FF    EOR #$FFFF              ;
$01/901C 1A          INC A                   ;
$01/901D 85 00       STA $00    [$00:0000]   ;
$01/901F AD 02 30    LDA $3002  [$00:3002]   ;
$01/9022 85 04       STA $04    [$00:0004]   ;
$01/9024 BD D6 7C    LDA $7CD6,x[$00:7CD6]   ;
$01/9027 18          CLC                     ;
$01/9028 6D 40 60    ADC $6040  [$00:6040]   ;
$01/902B 38          SEC                     ;
$01/902C E9 08 00    SBC #$0008              ;
$01/902F 85 0A       STA $0A    [$00:000A]   ;
$01/9031 BD D8 7C    LDA $7CD8,x[$00:7CD8]   ;
$01/9034 18          CLC                     ;
$01/9035 6D 54 60    ADC $6054  [$00:6054]   ;
$01/9038 38          SEC                     ;
$01/9039 E9 04 00    SBC #$0004              ;
$01/903C 85 0C       STA $0C    [$00:000C]   ;
$01/903E A2 09       LDX #$09                ;
$01/9040 A9 D5 91    LDA #$91D5              ;
$01/9043 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/9047 A6 12       LDX $12    [$00:0012]   ;
$01/9049 AC 0C 30    LDY $300C  [$00:300C]   ;
$01/904C C0 06       CPY #$06                ;
$01/904E 30 27       BMI $27    [$9077]      ;
$01/9050 64 02       STZ $02    [$00:0002]   ;
$01/9052 22 FA EB 0E JSL $0EEBFA[$0E:EBFA]   ;
$01/9056 A5 04       LDA $04    [$00:0004]   ;
$01/9058 99 E2 71    STA $71E2,y[$00:71E2]   ;
$01/905B A9 28 00    LDA #$0028              ;
$01/905E 99 02 70    STA $7002,y[$00:7002]   ;
$01/9061 A9 05 00    LDA #$0005              ;
$01/9064 99 62 74    STA $7462,y[$00:7462]   ;
$01/9067 A9 00 00    LDA #$0000              ;
$01/906A 99 A2 75    STA $75A2,y[$00:75A2]   ;
$01/906D A9 08 00    LDA #$0008              ;
$01/9070 99 02 75    STA $7502,y[$00:7502]   ;
$01/9073 99 00 75    STA $7500,y[$00:7500]   ;
$01/9076 60          RTS                     ;

$01/9077 A9 25 00    LDA #$0025              ;
$01/907A 22 64 A3 03 JSL $03A364[$03:A364]   ; spawn egg
$01/907E 90 D0       BCC $D0    [$9050]      ;
$01/9080 A5 0A       LDA $0A    [$00:000A]   ;
$01/9082 99 E2 70    STA $70E2,y[$00:70E2]   ;
$01/9085 A5 0C       LDA $0C    [$00:000C]   ;
$01/9087 99 82 71    STA $7182,y[$00:7182]   ;
$01/908A A5 00       LDA $00    [$00:0000]   ;
$01/908C 99 20 72    STA $7220,y[$00:7220]   ;
$01/908F A5 04       LDA $04    [$00:0004]   ;
$01/9091 99 22 72    STA $7222,y[$00:7222]   ;
$01/9094 A9 40 00    LDA #$0040              ;
$01/9097 99 42 75    STA $7542,y[$00:7542]   ;
$01/909A 60          RTS                     ;

; hookbill s sub
$01/909B BD D6 7C    LDA $7CD6,x[$00:7CD6]   ;
$01/909E 48          PHA                     ;
$01/909F 18          CLC                     ;
$01/90A0 6D 40 60    ADC $6040  [$00:6040]   ;
$01/90A3 9D D6 7C    STA $7CD6,x[$00:7CD6]   ;
$01/90A6 BD D8 7C    LDA $7CD8,x[$00:7CD8]   ;
$01/90A9 48          PHA                     ;
$01/90AA 18          CLC                     ;
$01/90AB 6D 54 60    ADC $6054  [$00:6054]   ;
$01/90AE 9D D8 7C    STA $7CD8,x[$00:7CD8]   ;
$01/90B1 BD B6 7B    LDA $7BB6,x[$00:7BB6]   ;
$01/90B4 48          PHA                     ;
$01/90B5 BD B8 7B    LDA $7BB8,x[$00:7BB8]   ;
$01/90B8 48          PHA                     ;
$01/90B9 A9 0C 00    LDA #$000C              ;
$01/90BC 9D B6 7B    STA $7BB6,x[$00:7BB6]   ;
$01/90BF 9D B8 7B    STA $7BB8,x[$00:7BB8]   ;
$01/90C2 8A          TXA                     ;
$01/90C3 8D 02 30    STA $3002  [$00:3002]   ;
$01/90C6 A2 09       LDX #$09                ;
$01/90C8 A9 11 90    LDA #$9011              ;
$01/90CB 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/90CF 80 09       BRA $09    [$90DA]      ;

$01/90D1 A2 09       LDX #$09                ;
$01/90D3 AD 1E 30    LDA $301E  [$00:301E]   ;
$01/90D6 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/90DA A6 12       LDX $12    [$00:0012]   ;
$01/90DC AC 1C 30    LDY $301C  [$00:301C]   ;
$01/90DF 30 42       BMI $42    [$9123]      ;
$01/90E1 F0 40       BEQ $40    [$9123]      ;
$01/90E3 B9 38 7D    LDA $7D38,y[$00:7D38]   ;
$01/90E6 F0 E9       BEQ $E9    [$90D1]      ;
$01/90E8 B9 20 72    LDA $7220,y[$00:7220]   ;
$01/90EB 85 00       STA $00    [$00:0000]   ;
$01/90ED B9 42 75    LDA $7542,y[$00:7542]   ;
$01/90F0 85 02       STA $02    [$00:0002]   ;
$01/90F2 BB          TYX                     ;
$01/90F3 22 4B B2 03 JSL $03B24B[$03:B24B]   ;
$01/90F7 B4 76       LDY $76,x  [$00:0076]   ;
$01/90F9 C0 0B       CPY #$0B                ;
$01/90FB 10 23       BPL $23    [$9120]      ;
$01/90FD EE 70 10    INC $1070  [$00:1070]   ;
$01/9100 A0 06       LDY #$06                ;
$01/9102 8C 74 10    STY $1074  [$00:1074]   ;
$01/9105 A0 17       LDY #$17                ;
$01/9107 8C 5E 10    STY $105E  [$00:105E]   ;
$01/910A A9 20 00    LDA #$0020              ;
$01/910D 95 18       STA $18,x  [$00:0018]   ;
$01/910F 4A          LSR A                   ;
$01/9110 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/9113 A0 0D       LDY #$0D                ;
$01/9115 94 76       STY $76,x  [$00:0076]   ;
$01/9117 A9 3F 00    LDA #$003F              ;\ play sound #$003F
$01/911A 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/911E 80 03       BRA $03    [$9123]      ;

$01/9120 20 3C 91    JSR $913C  [$00:913C]   ;
$01/9123 68          PLA                     ;
$01/9124 9D B8 7B    STA $7BB8,x[$00:7BB8]   ;
$01/9127 68          PLA                     ;
$01/9128 9D B6 7B    STA $7BB6,x[$00:7BB6]   ;
$01/912B 68          PLA                     ;
$01/912C 9D D8 7C    STA $7CD8,x[$00:7CD8]   ;
$01/912F 68          PLA                     ;
$01/9130 9D D6 7C    STA $7CD6,x[$00:7CD6]   ;
$01/9133 60          RTS                     ;

; hookbill animation frames
CODE_019134:         db $1D, $1F

; hookbill second set of frames
CODE_019136:         db $08, $0A

; data table
CODE_019138:         dw $0200
CODE_01913A:         dw $FE00

; hookbill s sub
$01/913C A5 02       LDA $02    [$00:0002]   ;
$01/913E D0 F3       BNE $F3    [$9133]      ;
$01/9140 BD 00 74    LDA $7400,x[$00:7400]   ;
$01/9143 3A          DEC A                   ;
$01/9144 45 00       EOR $00    [$00:0000]   ;
$01/9146 10 EB       BPL $EB    [$9133]      ;
$01/9148 B4 76       LDY $76,x  [$00:0076]   ;
$01/914A C0 0F       CPY #$0F                ;
$01/914C 30 08       BMI $08    [$9156]      ;
$01/914E C0 1C       CPY #$1C                ;
$01/9150 30 68       BMI $68    [$91BA]      ;
$01/9152 C0 1F       CPY #$1F                ;
$01/9154 10 64       BPL $64    [$91BA]      ;
$01/9156 EE 70 10    INC $1070  [$00:1070]   ; entry point
$01/9159 A9 00 FE    LDA #$FE00              ;
$01/915C 9D 00 79    STA $7900,x[$00:7900]   ;
$01/915F 9E 38 7A    STZ $7A38,x[$00:7A38]   ;
$01/9162 9E 36 7A    STZ $7A36,x[$00:7A36]   ;
$01/9165 EE 7A 10    INC $107A  [$00:107A]   ;
$01/9168 AC 7A 10    LDY $107A  [$00:107A]   ;
$01/916B C0 03       CPY #$03                ;
$01/916D 30 2E       BMI $2E    [$919D]      ;
$01/916F BC 00 74    LDY $7400,x[$00:7400]   ;
$01/9172 B9 38 91    LDA $9138,y[$00:9138]   ;
$01/9175 9D 20 72    STA $7220,x[$00:7220]   ;
$01/9178 EE 6E 10    INC $106E  [$00:106E]   ;
$01/917B EE 72 10    INC $1072  [$00:1072]   ;
$01/917E A9 12 00    LDA #$0012              ;
$01/9181 9D 20 77    STA $7720,x[$00:7720]   ;
$01/9184 A0 21       LDY #$21                ;
$01/9186 94 78       STY $78,x  [$00:0078]   ;
$01/9188 A0 0C       LDY #$0C                ;
$01/918A 8C 5E 10    STY $105E  [$00:105E]   ;
$01/918D A9 00 FC    LDA #$FC00              ;
$01/9190 9D 22 72    STA $7222,x[$00:7222]   ;
$01/9193 A9 20 00    LDA #$0020              ;
$01/9196 95 18       STA $18,x  [$00:0018]   ;
$01/9198 A0 1F       LDY #$1F                ;
$01/919A 94 76       STY $76,x  [$00:0076]   ;
$01/919C 60          RTS                     ;

$01/919D E2 20       SEP #$20                ;
$01/919F B9 33 91    LDA $9133,y[$00:9133]   ; table
$01/91A2 95 78       STA $78,x  [$00:0078]   ;
$01/91A4 B9 35 91    LDA $9135,y[$00:9135]   ; table
$01/91A7 8D 5E 10    STA $105E  [$00:105E]   ;
$01/91AA C2 20       REP #$20                ;
$01/91AC A9 20 00    LDA #$0020              ;
$01/91AF 95 18       STA $18,x  [$00:0018]   ;
$01/91B1 A0 04       LDY #$04                ;
$01/91B3 8C 74 10    STY $1074  [$00:1074]   ;
$01/91B6 A0 1C       LDY #$1C                ;
$01/91B8 94 76       STY $76,x  [$00:0076]   ;
$01/91BA 60          RTS                     ;

; hookbill s sub
$01/91BB 8A          TXA                     ;
$01/91BC 8D 02 30    STA $3002  [$00:3002]   ;
$01/91BF A2 09       LDX #$09                ;
$01/91C1 A9 11 90    LDA #$9011              ;
$01/91C4 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/91C8 80 09       BRA $09    [$91D3]      ;

$01/91CA A2 09       LDX #$09                ;
$01/91CC AD 1E 30    LDA $301E  [$00:301E]   ;
$01/91CF 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; gsu : picking up where left off?
$01/91D3 A6 12       LDX $12    [$00:0012]   ;
$01/91D5 AC 1C 30    LDY $301C  [$00:301C]   ;
$01/91D8 30 E0       BMI $E0    [$91BA]      ;
$01/91DA F0 DE       BEQ $DE    [$91BA]      ;
$01/91DC B9 00 6F    LDA $6F00,y[$00:6F00]   ;
$01/91DF C9 10 00    CMP #$0010              ;
$01/91E2 D0 E6       BNE $E6    [$91CA]      ;
$01/91E4 B9 38 7D    LDA $7D38,y[$00:7D38]   ;
$01/91E7 F0 E1       BEQ $E1    [$91CA]      ;
$01/91E9 B9 42 75    LDA $7542,y[$00:7542]   ;
$01/91EC 85 00       STA $00    [$00:0000]   ;
$01/91EE B9 20 72    LDA $7220,y[$00:7220]   ;
$01/91F1 85 02       STA $02    [$00:0002]   ;
$01/91F3 BB          TYX                     ;
$01/91F4 5A          PHY                     ;
$01/91F5 22 4B B2 03 JSL $03B24B[$03:B24B]   ;
$01/91F9 7A          PLY                     ;
$01/91FA A5 00       LDA $00    [$00:0000]   ;
$01/91FC D0 CC       BNE $CC    [$91CA]      ;
$01/91FE BD 00 74    LDA $7400,x[$00:7400]   ;
$01/9201 3A          DEC A                   ;
$01/9202 45 02       EOR $02    [$00:0002]   ;
$01/9204 10 C4       BPL $C4    [$91CA]      ;
$01/9206 B9 D8 7C    LDA $7CD8,y[$00:7CD8]   ;
$01/9209 38          SEC                     ;
$01/920A FD D8 7C    SBC $7CD8,x[$00:7CD8]   ;
$01/920D 10 BB       BPL $BB    [$91CA]      ;
$01/920F A9 3F 00    LDA #$003F              ;\ play sound #$003F
$01/9212 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/9216 AC 7A 10    LDY $107A  [$00:107A]   ;
$01/9219 C0 02       CPY #$02                ;
$01/921B 30 AD       BMI $AD    [$91CA]      ;
$01/921D B4 76       LDY $76,x  [$00:0076]   ;
$01/921F C0 1C       CPY #$1C                ;
$01/9221 30 A7       BMI $A7    [$91CA]      ;
$01/9223 C0 1F       CPY #$1F                ;
$01/9225 10 A3       BPL $A3    [$91CA]      ;
$01/9227 4C 56 91    JMP $9156  [$00:9156]   ;

; hookbill s sub
$01/922A BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/922D 18          CLC                     ;
$01/922E 75 18       ADC $18,x  [$00:0018]   ;
$01/9230 C9 00 01    CMP #$0100              ;
$01/9233 30 14       BMI $14    [$9249]      ;
$01/9235 E2 20       SEP #$20                ;
$01/9237 B5 78       LDA $78,x  [$00:0078]   ;
$01/9239 9D 02 74    STA $7402,x[$00:7402]   ; previous animation frame into 7402,x
$01/923C C2 20       REP #$20                ;
$01/923E AD 5E 10    LDA $105E  [$00:105E]   ;
$01/9241 8D 5C 10    STA $105C  [$00:105C]   ; loads previous 105E frame value into 105C
$01/9244 A9 00 00    LDA #$0000              ;
$01/9247 95 18       STA $18,x  [$00:0018]   ;
$01/9249 9D 36 7A    STA $7A36,x[$00:7A36]   ;
$01/924C 60          RTS                     ;

; hookbill s sub
$01/924D BD F6 7A    LDA $7AF6,x[$00:7AF6]   ;
$01/9250 F0 FA       BEQ $FA    [$924C]      ;
$01/9252 3A          DEC A                   ;
$01/9253 F0 3C       BEQ $3C    [$9291]      ;
$01/9255 29 04 00    AND #$0004              ;
$01/9258 D0 37       BNE $37    [$9291]      ;
$01/925A A2 14       LDX #$14                ;
$01/925C BF 70 A5 5F LDA $5FA570,x[$5F:A570] ;
$01/9260 9F 6E 2D 70 STA $702D6E,x[$70:2D6E] ;
$01/9264 9F 02 20 70 STA $702002,x[$70:2002] ;
$01/9268 9F 2E 2F 70 STA $702F2E,x[$70:2F2E] ;
$01/926C 9F C2 21 70 STA $7021C2,x[$70:21C2] ;
$01/9270 9F 4E 2F 70 STA $702F4E,x[$70:2F4E] ;
$01/9274 9F E2 21 70 STA $7021E2,x[$70:21E2] ;
$01/9278 CA          DEX                     ;
$01/9279 CA          DEX                     ;
$01/927A 10 E0       BPL $E0    [$925C]      ;
$01/927C A2 06       LDX #$06                ;
$01/927E BF 86 A5 5F LDA $5FA586,x[$5F:A586] ;
$01/9282 9F 84 2D 70 STA $702D84,x[$70:2D84] ;
$01/9286 9F 18 20 70 STA $702018,x[$70:2018] ;
$01/928A CA          DEX                     ;
$01/928B CA          DEX                     ;
$01/928C 10 F0       BPL $F0    [$927E]      ;
$01/928E A6 12       LDX $12    [$00:0012]   ;
$01/9290 60          RTS                     ;

$01/9291 A2 1C       LDX #$1C                ;
$01/9293 BF 80 DA 5F LDA $5FDA80,x[$5F:DA80] ;
$01/9297 9F 6E 2D 70 STA $702D6E,x[$70:2D6E] ;
$01/929B 9F 02 20 70 STA $702002,x[$70:2002] ;
$01/929F BF A0 DA 5F LDA $5FDAA0,x[$5F:DAA0] ;
$01/92A3 9F 2E 2F 70 STA $702F2E,x[$70:2F2E] ;
$01/92A7 9F C2 21 70 STA $7021C2,x[$70:21C2] ;
$01/92AB BF C0 DA 5F LDA $5FDAC0,x[$5F:DAC0] ;
$01/92AF 9F 4E 2F 70 STA $702F4E,x[$70:2F4E] ;
$01/92B3 9F E2 21 70 STA $7021E2,x[$70:21E2] ;
$01/92B7 CA          DEX                     ;
$01/92B8 CA          DEX                     ;
$01/92B9 10 D8       BPL $D8    [$9293]      ;
$01/92BB AF 9E DA 5F LDA $5FDA9E[$5F:DA9E]   ;
$01/92BF 8F 2C 2F 70 STA $702F2C[$70:2F2C]   ;
$01/92C3 8F C0 21 70 STA $7021C0[$70:21C0]   ;
$01/92C7 AF BE DA 5F LDA $5FDABE[$5F:DABE]   ;
$01/92CB 8F 4C 2F 70 STA $702F4C[$70:2F4C]   ;
$01/92CF 8F E0 21 70 STA $7021E0[$70:21E0]   ;
$01/92D3 A6 12       LDX $12    [$00:0012]   ;
$01/92D5 60          RTS                     ;

; data table
CODE_0192D6:         dw $FF20
CODE_0192D8:         dw $00E0

; hookbill s sub
$01/92DA BD E2 70    LDA $70E2,x             ;
$01/92DD 38          SEC                     ;
$01/92DE ED 82 10    SBC $1082  [$00:1082]   ;
$01/92E1 18          CLC                     ;
$01/92E2 69 E0 00    ADC #$00E0              ;
$01/92E5 C9 C0 01    CMP #$01C0              ;
$01/92E8 90 27       BCC $27    [$9311]      ;
$01/92EA 85 00       STA $00    [$00:0000]   ;
$01/92EC BD 20 72    LDA $7220,x[$00:7220]   ;
$01/92EF D0 04       BNE $04    [$92F5]      ;
$01/92F1 BD 00 74    LDA $7400,x[$00:7400]   ;
$01/92F4 3A          DEC A                   ;
$01/92F5 45 00       EOR $00    [$00:0000]   ;
$01/92F7 30 18       BMI $18    [$9311]      ;
$01/92F9 A0 00       LDY #$00                ;
$01/92FB A5 00       LDA $00    [$00:0000]   ;
$01/92FD 30 02       BMI $02    [$9301]      ;
$01/92FF C8          INY                     ;
$01/9300 C8          INY                     ;
$01/9301 AD 82 10    LDA $1082  [$00:1082]   ;
$01/9304 18          CLC                     ;
$01/9305 79 D6 92    ADC $92D6,y[$00:92D6]   ; table
$01/9308 9D E2 70    STA $70E2,x[$00:70E2]   ;
$01/930B 9E 20 72    STZ $7220,x[$00:7220]   ;
$01/930E 9E 40 75    STZ $7540,x[$00:7540]   ;
$01/9311 60          RTS                     ;

hookbill_start_crawl:
$01/9312 BB          TYX                     ;
$01/9313 A0 01       LDY #$01                ;
$01/9315 94 76       STY $76,x  [$00:0076]   ;
$01/9317 A9 40 00    LDA #$0040              ;
$01/931A 9D 98 7A    STA $7A98,x[$04:7A98]   ;
$01/931D A5 10       LDA $10    [$00:0010]   ;
$01/931F 29 01 00    AND #$0001              ;
$01/9322 F0 42       BEQ $42    [$9366]      ;
$01/9324 BD E2 70    LDA $70E2,x[$04:70E2]   ;
$01/9327 38          SEC                     ;
$01/9328 ED 82 10    SBC $1082  [$04:1082]   ;
$01/932B 18          CLC                     ;
$01/932C 69 A0 00    ADC #$00A0              ;
$01/932F C9 40 01    CMP #$0140              ;
$01/9332 90 0A       BCC $0A    [$933E]      ;
$01/9334 85 00       STA $00    [$00:0000]   ;
$01/9336 BD 00 74    LDA $7400,x[$04:7400]   ;
$01/9339 3A          DEC A                   ;
$01/933A 45 00       EOR $00    [$00:0000]   ;
$01/933C 10 28       BPL $28    [$9366]      ;
$01/933E B5 78       LDA $78,x  [$00:0078]   ;
$01/9340 29 07 00    AND #$0007              ;
$01/9343 18          CLC                     ;
$01/9344 69 28 00    ADC #$0028              ;
$01/9347 95 78       STA $78,x  [$00:0078]   ;
$01/9349 A0 18       LDY #$18                ;
$01/934B 8C 5E 10    STY $105E  [$04:105E]   ;
$01/934E A9 01 00    LDA #$0001              ;
$01/9351 9D 36 7A    STA $7A36,x[$04:7A36]   ;
$01/9354 EE 70 10    INC $1070  [$04:1070]   ;
$01/9357 A9 20 00    LDA #$0020              ;
$01/935A 95 18       STA $18,x  [$00:0018]   ;
$01/935C A9 40 00    LDA #$0040              ;
$01/935F 9D 96 7A    STA $7A96,x[$04:7A96]   ;
$01/9362 A0 08       LDY #$08                ;
$01/9364 94 76       STY $76,x  [$00:0076]   ;
$01/9366 60          RTS                     ;

hookbill_crawl_forward:
$01/9367 BB          TYX                     ;
$01/9368 9C 5C 10    STZ $105C  [$04:105C]   ;
$01/936B 9C 5E 10    STZ $105E  [$04:105E]   ;
$01/936E 9C 70 10    STZ $1070  [$04:1070]   ;
$01/9371 A9 00 FE    LDA #$FE00              ;
$01/9374 9D 00 79    STA $7900,x[$04:7900]   ;
$01/9377 9E 38 7A    STZ $7A38,x[$04:7A38]   ;
$01/937A BD 96 7A    LDA $7A96,x[$04:7A96]   ;
$01/937D D0 37       BNE $37    [$93B6]      ;
$01/937F A9 20 00    LDA #$0020              ;
$01/9382 95 18       STA $18,x  [$00:0018]   ;
$01/9384 BD 36 7A    LDA $7A36,x[$04:7A36]   ;
$01/9387 D0 2D       BNE $2D    [$93B6]      ;
$01/9389 BD 98 7A    LDA $7A98,x[$04:7A98]   ;
$01/938C D0 03       BNE $03    [$9391]      ;
$01/938E 74 76       STZ $76,x  [$00:0076]   ;
$01/9390 60          RTS                     ;

$01/9391 E2 20       SEP #$20                ;
$01/9393 B5 78       LDA $78,x  [$00:0078]   ;
$01/9395 1A          INC A                   ;
$01/9396 29 07       AND #$07                ;
$01/9398 95 78       STA $78,x  [$00:0078]   ;
$01/939A C2 20       REP #$20                ;
$01/939C BD 02 74    LDA $7402,x[$04:7402]   ;
$01/939F 29 03 00    AND #$0003              ;
$01/93A2 D0 12       BNE $12    [$93B6]      ;
$01/93A4 A9 08 00    LDA #$0008              ;
$01/93A7 9D 96 7A    STA $7A96,x[$04:7A96]   ;
$01/93AA A9 56 00    LDA #$0056              ;\ play sound #$0056
$01/93AD 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/93B1 FE 36 7A    INC $7A36,x[$04:7A36]   ;
$01/93B4 74 18       STZ $18,x  [$00:0018]   ;
$01/93B6 20 BA 93    JSR $93BA  [$04:93BA]   ;
$01/93B9 60          RTS                     ;

; hookbill s sub
$01/93BA BD C2 77    LDA $77C2,x[$00:77C2]   ;
$01/93BD 29 FF 00    AND #$00FF              ;
$01/93C0 DD 00 74    CMP $7400,x[$00:7400]   ;
$01/93C3 F0 3A       BEQ $3A    [$93FF]      ;
$01/93C5 EE 70 10    INC $1070  [$00:1070]   ;
$01/93C8 EE 6E 10    INC $106E  [$00:106E]   ;
$01/93CB A9 00 FE    LDA #$FE00              ;
$01/93CE 9D 00 79    STA $7900,x[$00:7900]   ;
$01/93D1 9E 38 7A    STZ $7A38,x[$00:7A38]   ;
$01/93D4 9E 36 7A    STZ $7A36,x[$00:7A36]   ;
$01/93D7 A0 18       LDY #$18                ;
$01/93D9 94 78       STY $78,x  [$00:0078]   ;
$01/93DB A0 03       LDY #$03                ;
$01/93DD 8C 5E 10    STY $105E  [$00:105E]   ;
$01/93E0 A9 10 00    LDA #$0010              ;
$01/93E3 95 18       STA $18,x  [$00:0018]   ;
$01/93E5 B4 76       LDY $76,x  [$00:0076]   ;
$01/93E7 C0 01       CPY #$01                ;
$01/93E9 D0 05       BNE $05    [$93F0]      ;
$01/93EB A0 16       LDY #$16                ;
$01/93ED 94 76       STY $76,x  [$00:0076]   ;
$01/93EF 60          RTS                     ;

$01/93F0 A9 00 FC    LDA #$FC00              ;
$01/93F3 9D 22 72    STA $7222,x[$00:7222]   ;
$01/93F6 F6 78       INC $78,x  [$00:0078]   ;
$01/93F8 EE 5E 10    INC $105E  [$00:105E]   ;
$01/93FB A0 18       LDY #$18                ;
$01/93FD 94 76       STY $76,x  [$00:0076]   ;
$01/93FF 60          RTS                     ;

; when jumping on his head as opposed to shell
hookbill_head_spit_egg:
$01/9400 BB          TYX                     ;
$01/9401 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9404 D0 10       BNE $10    [$9416]      ;
$01/9406 9C 5E 10    STZ $105E  [$00:105E]   ;
$01/9409 A9 40 00    LDA #$0040              ;
$01/940C 95 18       STA $18,x  [$00:0018]   ;
$01/940E A9 30 00    LDA #$0030              ;
$01/9411 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/9414 F6 76       INC $76,x  [$00:0076]   ;
$01/9416 60          RTS                     ;

hookbill_head_nudge_up:
$01/9417 BB          TYX                     ;
$01/9418 BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/941B D0 0A       BNE $0A    [$9427]      ;
$01/941D 9C 74 10    STZ $1074  [$00:1074]   ;
$01/9420 A9 80 00    LDA #$0080              ;
$01/9423 95 18       STA $18,x  [$00:0018]   ;
$01/9425 F6 76       INC $76,x  [$00:0076]   ;
$01/9427 60          RTS                     ;

hookbill_head_back:
$01/9428 BB          TYX                     ;
$01/9429 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/942C D0 0A       BNE $0A    [$9438]      ;
$01/942E A9 40 00    LDA #$0040              ;
$01/9431 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/9434 A0 01       LDY #$01                ;
$01/9436 94 76       STY $76,x  [$00:0076]   ;
$01/9438 60          RTS                     ;

; when jumping on his shell as opposed to head
hookbill_shell_spit_egg:
$01/9439 BB          TYX                     ;
$01/943A BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/943D D0 19       BNE $19    [$9458]      ;
$01/943F BD 02 74    LDA $7402,x[$00:7402]   ;
$01/9442 38          SEC                     ;
$01/9443 E9 28 00    SBC #$0028              ;
$01/9446 95 78       STA $78,x  [$00:0078]   ;
$01/9448 9C 5E 10    STZ $105E  [$00:105E]   ;
$01/944B A9 40 00    LDA #$0040              ;
$01/944E 95 18       STA $18,x  [$00:0018]   ;
$01/9450 A9 30 00    LDA #$0030              ;
$01/9453 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/9456 F6 76       INC $76,x  [$00:0076]   ;
$01/9458 60          RTS                     ;

hookbill_shell_nudge_up:
$01/9459 BB          TYX                     ;
$01/945A BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/945D D0 0A       BNE $0A    [$9469]      ;
$01/945F 9C 74 10    STZ $1074  [$00:1074]   ;
$01/9462 A9 80 00    LDA #$0080              ;
$01/9465 95 18       STA $18,x  [$00:0018]   ;
$01/9467 F6 76       INC $76,x  [$00:0076]   ;
$01/9469 60          RTS                     ;

hookbill_stand_up:
$01/946A BB          TYX                     ;
$01/946B BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/946E D0 02       BNE $02    [$9472]      ;
$01/9470 F6 76       INC $76,x  [$00:0076]   ;
$01/9472 60          RTS                     ;

hookbill_stare_forward:
$01/9473 BB          TYX                     ;
$01/9474 BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/9477 D0 1A       BNE $1A    [$9493]      ;
$01/9479 F6 76       INC $76,x  [$00:0076]   ;
$01/947B B5 78       LDA $78,x  [$00:0078]   ; entry point
$01/947D 38          SEC                     ;
$01/947E E9 29 00    SBC #$0029              ;
$01/9481 29 07 00    AND #$0007              ;
$01/9484 09 08 00    ORA #$0008              ;
$01/9487 95 78       STA $78,x  [$00:0078]   ;
$01/9489 A0 01       LDY #$01                ;
$01/948B 8C 5E 10    STY $105E  [$00:105E]   ;
$01/948E A9 08 00    LDA #$0008              ;
$01/9491 95 18       STA $18,x  [$00:0018]   ;
$01/9493 60          RTS                     ;

hookbill_walk_forward:
$01/9494 BB          TYX                     ;
$01/9495 A9 01 00    LDA #$0001              ;
$01/9498 8D 5C 10    STA $105C  [$00:105C]   ;
$01/949B 8D 5E 10    STA $105E  [$00:105E]   ;
$01/949E 9C 6E 10    STZ $106E  [$00:106E]   ;
$01/94A1 AD 74 79    LDA $7974  [$00:7974]   ;
$01/94A4 29 01 00    AND #$0001              ;
$01/94A7 D0 03       BNE $03    [$94AC]      ;
$01/94A9 9C 70 10    STZ $1070  [$00:1070]   ;
$01/94AC A9 00 FE    LDA #$FE00              ;
$01/94AF 9D 00 79    STA $7900,x[$00:7900]   ;
$01/94B2 9E 38 7A    STZ $7A38,x[$00:7A38]   ;
$01/94B5 BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/94B8 F0 03       BEQ $03    [$94BD]      ;
$01/94BA 4C 25 95    JMP $9525  [$00:9525]   ;

$01/94BD A9 20 00    LDA #$0020              ;
$01/94C0 95 18       STA $18,x  [$00:0018]   ;
$01/94C2 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/94C5 D0 5E       BNE $5E    [$9525]      ;
$01/94C7 BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/94CA D0 32       BNE $32    [$94FE]      ;
$01/94CC BC C2 77    LDY $77C2,x[$00:77C2]   ;
$01/94CF 98          TYA                     ;
$01/94D0 DD 00 74    CMP $7400,x[$00:7400]   ;
$01/94D3 D0 29       BNE $29    [$94FE]      ;
$01/94D5 BD 16 7C    LDA $7C16,x[$00:7C16]   ;
$01/94D8 18          CLC                     ;
$01/94D9 69 70 00    ADC #$0070              ;
$01/94DC C9 E0 00    CMP #$00E0              ;
$01/94DF B0 1D       BCS $1D    [$94FE]      ;
$01/94E1 E2 20       SEP #$20                ;
$01/94E3 B5 78       LDA $78,x  [$00:0078]   ;
$01/94E5 1A          INC A                   ;
$01/94E6 29 07       AND #$07                ;
$01/94E8 09 10       ORA #$10                ;
$01/94EA 95 78       STA $78,x  [$00:0078]   ;
$01/94EC C2 20       REP #$20                ;
$01/94EE A0 02       LDY #$02                ;
$01/94F0 8C 5E 10    STY $105E  [$00:105E]   ;
$01/94F3 8C 74 10    STY $1074  [$00:1074]   ;
$01/94F6 A9 20 00    LDA #$0020              ;
$01/94F9 95 18       STA $18,x  [$00:0018]   ;
$01/94FB F6 76       INC $76,x  [$00:0076]   ;
$01/94FD 60          RTS                     ;

$01/94FE E2 20       SEP #$20                ;
$01/9500 B5 78       LDA $78,x  [$00:0078]   ;
$01/9502 1A          INC A                   ;
$01/9503 29 07       AND #$07                ;
$01/9505 09 08       ORA #$08                ;
$01/9507 95 78       STA $78,x  [$00:0078]   ;
$01/9509 C2 20       REP #$20                ;
$01/950B BD 02 74    LDA $7402,x[$00:7402]   ;
$01/950E 29 03 00    AND #$0003              ;
$01/9511 D0 12       BNE $12    [$9525]      ;
$01/9513 A9 08 00    LDA #$0008              ;
$01/9516 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/9519 A9 56 00    LDA #$0056              ;\ play sound #$0056
$01/951C 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/9520 FE 36 7A    INC $7A36,x[$00:7A36]   ;
$01/9523 74 18       STZ $18,x  [$00:0018]   ;
$01/9525 20 BA 93    JSR $93BA  [$00:93BA]   ;
$01/9528 60          RTS                     ;

hookbill_hunch_forward:
$01/9529 BB          TYX                     ;
$01/952A BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/952D D0 10       BNE $10    [$953F]      ;
$01/952F A9 40 00    LDA #$0040              ;
$01/9532 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/9535 A9 C0 00    LDA #$00C0              ;
$01/9538 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/953B A0 0E       LDY #$0E                ;
$01/953D 94 76       STY $76,x  [$00:0076]   ;
$01/953F 60          RTS                     ;

hookbill_egg_hit_while_running:
$01/9540 BB          TYX                     ;
$01/9541 BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/9544 D0 F9       BNE $F9    [$953F]      ;
$01/9546 EE 70 10    INC $1070  [$00:1070]   ;
$01/9549 9C 74 10    STZ $1074  [$00:1074]   ;
$01/954C A0 0A       LDY #$0A                ;
$01/954E 94 76       STY $76,x  [$00:0076]   ;
$01/9550 4C 7B 94    JMP $947B  [$00:947B]   ;

; data table
CODE_019553:         dw $0500
CODE_019555:         dw $0060

; data table
CODE_019557:         dw $FD80
CODE_019559:         dw $0280
CODE_01955B:         dw $FF40
CODE_01955D:         dw $00C0
CODE_01955F:         dw $FF00
CODE_019561:         dw $0100

hookbill_run_forward:
$01/9563 BB          TYX                     ;
$01/9564 A9 02 00    LDA #$0002              ;
$01/9567 8D 5C 10    STA $105C  [$00:105C]   ;
$01/956A 8D 5E 10    STA $105E  [$00:105E]   ;
$01/956D A9 00 FE    LDA #$FE00              ;
$01/9570 9D 00 79    STA $7900,x[$00:7900]   ;
$01/9573 A9 40 00    LDA #$0040              ;
$01/9576 95 18       STA $18,x  [$00:0018]   ;
$01/9578 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/957B D0 C2       BNE $C2    [$953F]      ;
$01/957D E2 20       SEP #$20                ;
$01/957F B5 78       LDA $78,x  [$00:0078]   ;
$01/9581 1A          INC A                   ;
$01/9582 29 07       AND #$07                ;
$01/9584 09 10       ORA #$10                ;
$01/9586 95 78       STA $78,x  [$00:0078]   ;
$01/9588 C2 20       REP #$20                ;
$01/958A BD 02 74    LDA $7402,x[$00:7402]   ;
$01/958D 29 03 00    AND #$0003              ;
$01/9590 D0 07       BNE $07    [$9599]      ;
$01/9592 A9 56 00    LDA #$0056              ;\ play sound #$0056
$01/9595 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/9599 A0 08       LDY #$08                ;
$01/959B BD 00 74    LDA $7400,x[$00:7400]   ;
$01/959E F0 0D       BEQ $0D    [$95AD]      ;
$01/95A0 C8          INY                     ;
$01/95A1 C8          INY                     ;
$01/95A2 38          SEC                     ;
$01/95A3 E9 20 00    SBC #$0020              ;
$01/95A6 CD 1A 7E    CMP $7E1A  [$00:7E1A]   ;
$01/95A9 10 2B       BPL $2B    [$95D6]      ;
$01/95AB 80 0E       BRA $0E    [$95BB]      ;

$01/95AD A0 08       LDY #$08                ;
$01/95AF BD E2 70    LDA $70E2,x[$00:70E2]   ;
$01/95B2 38          SEC                     ;
$01/95B3 E9 70 00    SBC #$0070              ;
$01/95B6 CD 18 7E    CMP $7E18  [$00:7E18]   ;
$01/95B9 30 1B       BMI $1B    [$95D6]      ;
$01/95BB BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/95BE D0 28       BNE $28    [$95E8]      ;
$01/95C0 BC C2 77    LDY $77C2,x[$00:77C2]   ;
$01/95C3 98          TYA                     ;
$01/95C4 DD 00 74    CMP $7400,x[$00:7400]   ;
$01/95C7 F0 10       BEQ $10    [$95D9]      ;
$01/95C9 BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/95CC D0 1A       BNE $1A    [$95E8]      ;
$01/95CE BD 00 74    LDA $7400,x[$00:7400]   ;
$01/95D1 18          CLC                     ;
$01/95D2 69 04 00    ADC #$0004              ;
$01/95D5 A8          TAY                     ;
$01/95D6 4C 69 96    JMP $9669  [$00:9669]   ;

$01/95D9 BD 16 7C    LDA $7C16,x[$00:7C16]   ;
$01/95DC 8D 02 30    STA $3002  [$00:3002]   ;
$01/95DF 18          CLC                     ;
$01/95E0 69 50 00    ADC #$0050              ;
$01/95E3 C9 A0 00    CMP #$00A0              ;
$01/95E6 90 01       BCC $01    [$95E9]      ;
$01/95E8 60          RTS                     ;

$01/95E9 18          CLC                     ;
$01/95EA 69 D0 FF    ADC #$FFD0              ;
$01/95ED C9 40 00    CMP #$0040              ;
$01/95F0 90 F6       BCC $F6    [$95E8]      ;
$01/95F2 AD A8 60    LDA $60A8  [$00:60A8]   ;
$01/95F5 30 04       BMI $04    [$95FB]      ;
$01/95F7 49 FF FF    EOR #$FFFF              ;
$01/95FA 1A          INC A                   ;
$01/95FB 8D 0C 30    STA $300C  [$00:300C]   ;
$01/95FE A0 00       LDY #$00                ;
$01/9600 AD A8 60    LDA $60A8  [$00:60A8]   ;
$01/9603 4D 02 30    EOR $3002  [$00:3002]   ;
$01/9606 30 02       BMI $02    [$960A]      ;
$01/9608 C8          INY                     ;
$01/9609 C8          INY                     ;
$01/960A B9 53 95    LDA $9553,y[$00:9553]   ; table
$01/960D 8D 00 30    STA $3000  [$00:3000]   ;
$01/9610 A2 0B       LDX #$0B                ;
$01/9612 A9 B6 86    LDA #$86B6              ;
$01/9615 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/9619 AD 02 30    LDA $3002  [$00:3002]   ;
$01/961C 8D 0C 30    STA $300C  [$00:300C]   ;
$01/961F AD 00 30    LDA $3000  [$00:3000]   ;
$01/9622 38          SEC                     ;
$01/9623 E9 00 01    SBC #$0100              ;
$01/9626 8D 00 30    STA $3000  [$00:3000]   ;
$01/9629 A2 0B       LDX #$0B                ;
$01/962B A9 B6 86    LDA #$86B6              ;
$01/962E 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/9632 A6 12       LDX $12    [$00:0012]   ;
$01/9634 AD 00 30    LDA $3000  [$00:3000]   ;
$01/9637 9D 20 72    STA $7220,x[$00:7220]   ;
$01/963A D0 0A       BNE $0A    [$9646]      ;
$01/963C BD 00 74    LDA $7400,x[$00:7400]   ;
$01/963F 18          CLC                     ;
$01/9640 69 04 00    ADC #$0004              ;
$01/9643 A8          TAY                     ;
$01/9644 80 23       BRA $23    [$9669]      ;

$01/9646 A0 00       LDY #$00                ;
$01/9648 18          CLC                     ;
$01/9649 69 00 04    ADC #$0400              ;
$01/964C C9 00 08    CMP #$0800              ;
$01/964F 90 06       BCC $06    [$9657]      ;
$01/9651 30 16       BMI $16    [$9669]      ;
$01/9653 C8          INY                     ;
$01/9654 C8          INY                     ;
$01/9655 80 12       BRA $12    [$9669]      ;

$01/9657 18          CLC                     ;
$01/9658 69 C0 FC    ADC #$FCC0              ;
$01/965B C9 80 01    CMP #$0180              ;
$01/965E B0 0F       BCS $0F    [$966F]      ;
$01/9660 A0 04       LDY #$04                ;
$01/9662 C9 C0 00    CMP #$00C0              ;
$01/9665 30 02       BMI $02    [$9669]      ;
$01/9667 C8          INY                     ;
$01/9668 C8          INY                     ;
$01/9669 B9 57 95    LDA $9557,y[$00:9557]   ; table
$01/966C 9D 20 72    STA $7220,x[$00:7220]   ;
$01/966F EE 70 10    INC $1070  [$00:1070]   ;
$01/9672 EE 6E 10    INC $106E  [$00:106E]   ;
$01/9675 EE 72 10    INC $1072  [$00:1072]   ;
$01/9678 A9 0A 00    LDA #$000A              ;
$01/967B 9D 20 77    STA $7720,x[$00:7720]   ;
$01/967E A9 00 FE    LDA #$FE00              ;
$01/9681 9D 00 79    STA $7900,x[$00:7900]   ;
$01/9684 9E 38 7A    STZ $7A38,x[$00:7A38]   ;
$01/9687 A0 1A       LDY #$1A                ;
$01/9689 94 78       STY $78,x  [$00:0078]   ;
$01/968B A9 00 FB    LDA #$FB00              ;
$01/968E 9D 22 72    STA $7222,x[$00:7222]   ;
$01/9691 A9 80 02    LDA #$0280              ;
$01/9694 9D E2 75    STA $75E2,x[$00:75E2]   ;
$01/9697 A9 28 00    LDA #$0028              ;
$01/969A 9D 42 75    STA $7542,x[$00:7542]   ;
$01/969D A0 05       LDY #$05                ;
$01/969F 8C 5E 10    STY $105E  [$00:105E]   ;
$01/96A2 A9 10 00    LDA #$0010              ;
$01/96A5 95 18       STA $18,x  [$00:0018]   ;
$01/96A7 F6 76       INC $76,x  [$00:0076]   ;
$01/96A9 60          RTS                     ;

; data table
CODE_0196AA:         dw $FF00
CODE_0196AC:         dw $0100

hookbill_dive:
$01/96AE BB          TYX                     ;
$01/96AF BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/96B2 D0 37       BNE $37    [$96EB]      ;
$01/96B4 BD 60 78    LDA $7860,x[$00:7860]   ;
$01/96B7 29 01 00    AND #$0001              ;
$01/96BA F0 2F       BEQ $2F    [$96EB]      ;
$01/96BC BC 00 74    LDY $7400,x[$00:7400]   ;
$01/96BF B9 AA 96    LDA $96AA,y[$00:96AA]   ; table
$01/96C2 9D 20 72    STA $7220,x[$00:7220]   ;
$01/96C5 A9 00 04    LDA #$0400              ;
$01/96C8 9D E2 75    STA $75E2,x[$00:75E2]   ;
$01/96CB A9 40 00    LDA #$0040              ;
$01/96CE 9D 42 75    STA $7542,x[$00:7542]   ;
$01/96D1 A0 1B       LDY #$1B                ;
$01/96D3 94 78       STY $78,x  [$00:0078]   ;
$01/96D5 A0 06       LDY #$06                ;
$01/96D7 8C 5E 10    STY $105E  [$00:105E]   ;
$01/96DA A9 20 00    LDA #$0020              ;
$01/96DD 95 18       STA $18,x  [$00:0018]   ;
$01/96DF 8D C6 61    STA $61C6  [$00:61C6]   ;
$01/96E2 A9 47 00    LDA #$0047              ;\ play sound #$0047
$01/96E5 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/96E9 F6 76       INC $76,x  [$00:0076]   ;
$01/96EB 60          RTS                     ;

hookbill_dive_land:
$01/96EC BB          TYX                     ;
$01/96ED BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/96F0 D0 16       BNE $16    [$9708]      ;
$01/96F2 A0 1A       LDY #$1A                ;
$01/96F4 94 78       STY $78,x  [$00:0078]   ;
$01/96F6 A0 05       LDY #$05                ;
$01/96F8 8C 5E 10    STY $105E  [$00:105E]   ;
$01/96FB A9 10 00    LDA #$0010              ;
$01/96FE 95 18       STA $18,x  [$00:0018]   ;
$01/9700 A9 00 FE    LDA #$FE00              ;
$01/9703 9D 22 72    STA $7222,x[$00:7222]   ;
$01/9706 F6 76       INC $76,x  [$00:0076]   ;
$01/9708 60          RTS                     ;

hookbill_dive_land_2:
$01/9709 BB          TYX                     ;
$01/970A BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/970D D0 2D       BNE $2D    [$973C]      ;
$01/970F BD 60 78    LDA $7860,x[$00:7860]   ;
$01/9712 29 01 00    AND #$0001              ;
$01/9715 F0 25       BEQ $25    [$973C]      ;
$01/9717 A0 06       LDY #$06                ;
$01/9719 8C 74 10    STY $1074  [$00:1074]   ;
$01/971C A9 08 00    LDA #$0008              ;
$01/971F 9D 40 75    STA $7540,x[$00:7540]   ;
$01/9722 A0 1C       LDY #$1C                ;
$01/9724 94 78       STY $78,x  [$00:0078]   ;
$01/9726 A0 07       LDY #$07                ;
$01/9728 8C 5E 10    STY $105E  [$00:105E]   ;
$01/972B A9 20 00    LDA #$0020              ;
$01/972E 95 18       STA $18,x  [$00:0018]   ;
$01/9730 8D C6 61    STA $61C6  [$00:61C6]   ;
$01/9733 A9 47 00    LDA #$0047              ;\ play sound #$0047
$01/9736 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/973A F6 76       INC $76,x  [$00:0076]   ;
$01/973C 60          RTS                     ;

hookbill_dive_land_3:
$01/973D BB          TYX                     ;
$01/973E A0 02       LDY #$02                ;
$01/9740 84 00       STY $00    [$00:0000]   ;
$01/9742 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9745 D0 02       BNE $02    [$9749]      ;
$01/9747 C6 00       DEC $00    [$00:0000]   ;
$01/9749 BD 20 72    LDA $7220,x[$00:7220]   ;
$01/974C 18          CLC                     ;
$01/974D 69 08 00    ADC #$0008              ;
$01/9750 C9 10 00    CMP #$0010              ;
$01/9753 B0 08       BCS $08    [$975D]      ;
$01/9755 9E 40 75    STZ $7540,x[$00:7540]   ;
$01/9758 9E 20 72    STZ $7220,x[$00:7220]   ;
$01/975B C6 00       DEC $00    [$00:0000]   ;
$01/975D A4 00       LDY $00    [$00:0000]   ;
$01/975F D0 10       BNE $10    [$9771]      ;
$01/9761 A0 1A       LDY #$1A                ;
$01/9763 94 78       STY $78,x  [$00:0078]   ;
$01/9765 A0 05       LDY #$05                ;
$01/9767 8C 5E 10    STY $105E  [$00:105E]   ;
$01/976A A9 08 00    LDA #$0008              ;
$01/976D 95 18       STA $18,x  [$00:0018]   ;
$01/976F F6 76       INC $76,x  [$00:0076]   ;
$01/9771 60          RTS                     ;

hookbill_dive_land_4:
$01/9772 BB          TYX                     ;
$01/9773 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9776 D0 07       BNE $07    [$977F]      ;
$01/9778 A9 08 00    LDA #$0008              ;
$01/977B 95 16       STA $16,x  [$00:0016]   ;
$01/977D F6 76       INC $76,x  [$00:0076]   ;
$01/977F 60          RTS                     ;

hookbill_dive_blink:
$01/9780 BB          TYX                     ;
$01/9781 BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/9784 D0 31       BNE $31    [$97B7]      ;
$01/9786 D6 16       DEC $16,x  [$00:0016]   ;
$01/9788 10 1E       BPL $1E    [$97A8]      ;
$01/978A A0 03       LDY #$03                ;
$01/978C 94 78       STY $78,x  [$00:0078]   ;
$01/978E 9C 5E 10    STZ $105E  [$00:105E]   ;
$01/9791 A9 10 00    LDA #$0010              ;
$01/9794 95 18       STA $18,x  [$00:0018]   ;
$01/9796 AD 6E 10    LDA $106E  [$00:106E]   ;
$01/9799 09 00 FF    ORA #$FF00              ;
$01/979C 8D 6E 10    STA $106E  [$00:106E]   ;
$01/979F 9C 72 10    STZ $1072  [$00:1072]   ;
$01/97A2 9C 74 10    STZ $1074  [$00:1074]   ;
$01/97A5 F6 76       INC $76,x  [$00:0076]   ;
$01/97A7 60          RTS                     ;

$01/97A8 AD 74 10    LDA $1074  [$00:1074]   ;
$01/97AB 49 06 00    EOR #$0006              ;
$01/97AE 8D 74 10    STA $1074  [$00:1074]   ;
$01/97B1 A9 08 00    LDA #$0008              ;
$01/97B4 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/97B7 60          RTS                     ;

hookbill_dive_get_up:
$01/97B8 BB          TYX                     ;
$01/97B9 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/97BC D0 0A       BNE $0A    [$97C8]      ;
$01/97BE A9 40 00    LDA #$0040              ;
$01/97C1 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/97C4 A0 01       LDY #$01                ;
$01/97C6 94 76       STY $76,x  [$00:0076]   ;
$01/97C8 60          RTS                     ;

hookbill_turnaround_retract:
$01/97C9 BB          TYX                     ;
$01/97CA BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/97CD D0 13       BNE $13    [$97E2]      ;
$01/97CF BD 00 74    LDA $7400,x[$00:7400]   ;
$01/97D2 49 02 00    EOR #$0002              ;
$01/97D5 9D 00 74    STA $7400,x[$00:7400]   ;
$01/97D8 A9 00 FC    LDA #$FC00              ;
$01/97DB 9D 22 72    STA $7222,x[$00:7222]   ;
$01/97DE 95 16       STA $16,x  [$00:0016]   ;
$01/97E0 F6 76       INC $76,x  [$00:0076]   ;
$01/97E2 60          RTS                     ;

hookbill_turnaround_jump:
$01/97E3 BB          TYX                     ;
$01/97E4 BC 23 72    LDY $7223,x[$00:7223]   ;
$01/97E7 30 33       BMI $33    [$981C]      ;
$01/97E9 B5 16       LDA $16,x  [$00:0016]   ;
$01/97EB F0 0F       BEQ $0F    [$97FC]      ;
$01/97ED 74 16       STZ $16,x  [$00:0016]   ;
$01/97EF A0 02       LDY #$02                ;
$01/97F1 94 78       STY $78,x  [$00:0078]   ;
$01/97F3 9C 5E 10    STZ $105E  [$00:105E]   ;
$01/97F6 A9 10 00    LDA #$0010              ;
$01/97F9 95 18       STA $18,x  [$00:0018]   ;
$01/97FB 60          RTS                     ;

$01/97FC BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/97FF D0 1B       BNE $1B    [$981C]      ;
$01/9801 BD 60 78    LDA $7860,x[$00:7860]   ;
$01/9804 29 01 00    AND #$0001              ;
$01/9807 F0 13       BEQ $13    [$981C]      ;
$01/9809 AD 6E 10    LDA $106E  [$00:106E]   ;
$01/980C 09 00 FF    ORA #$FF00              ;
$01/980F 8D 6E 10    STA $106E  [$00:106E]   ;
$01/9812 A9 40 00    LDA #$0040              ;
$01/9815 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/9818 A0 01       LDY #$01                ;
$01/981A 94 76       STY $76,x  [$00:0076]   ;
$01/981C 60          RTS                     ;

hookbill_turnaround_stand_retract:
$01/981D BB          TYX                     ;
$01/981E BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9821 D0 19       BNE $19    [$983C]      ;
$01/9823 BC 23 72    LDY $7223,x[$00:7223]   ;
$01/9826 30 14       BMI $14    [$983C]      ;
$01/9828 9E 22 72    STZ $7222,x[$00:7222]   ;
$01/982B 9E 42 75    STZ $7542,x[$00:7542]   ;
$01/982E D6 78       DEC $78,x  [$00:0078]   ;
$01/9830 A0 03       LDY #$03                ;
$01/9832 8C 5E 10    STY $105E  [$00:105E]   ;
$01/9835 A9 20 00    LDA #$0020              ;
$01/9838 95 18       STA $18,x  [$00:0018]   ;
$01/983A F6 76       INC $76,x  [$00:0076]   ;
$01/983C 60          RTS                     ;

hookbill_turnaround_stand_rotate:
$01/983D BB          TYX                     ;
$01/983E BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9841 D0 32       BNE $32    [$9875]      ;
$01/9843 B4 76       LDY $76,x  [$00:0076]   ;
$01/9845 C0 19       CPY #$19                ;
$01/9847 F0 14       BEQ $14    [$985D]      ;
$01/9849 A0 0A       LDY #$0A                ;
$01/984B 94 78       STY $78,x  [$00:0078]   ;
$01/984D A9 40 00    LDA #$0040              ;
$01/9850 9D 42 75    STA $7542,x[$00:7542]   ;
$01/9853 A9 10 00    LDA #$0010              ;
$01/9856 95 18       STA $18,x  [$00:0018]   ;
$01/9858 A9 01 00    LDA #$0001              ;
$01/985B 80 13       BRA $13    [$9870]      ;

$01/985D F6 78       INC $78,x  [$00:0078]   ;
$01/985F BD 00 74    LDA $7400,x[$00:7400]   ;
$01/9862 49 02 00    EOR #$0002              ;
$01/9865 9D 00 74    STA $7400,x[$00:7400]   ;
$01/9868 A9 20 00    LDA #$0020              ;
$01/986B 95 18       STA $18,x  [$00:0018]   ;
$01/986D A9 04 00    LDA #$0004              ;
$01/9870 8D 5E 10    STA $105E  [$00:105E]   ;
$01/9873 F6 76       INC $76,x  [$00:0076]   ;
$01/9875 60          RTS                     ;

hookbill_turnaround_fall:
$01/9876 BB          TYX                     ;
$01/9877 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/987A D0 1B       BNE $1B    [$9897]      ;
$01/987C BD 60 78    LDA $7860,x[$00:7860]   ;
$01/987F 29 01 00    AND #$0001              ;
$01/9882 F0 13       BEQ $13    [$9897]      ;
$01/9884 AD 6E 10    LDA $106E  [$00:106E]   ;
$01/9887 09 00 FF    ORA #$FF00              ;
$01/988A 8D 6E 10    STA $106E  [$00:106E]   ;
$01/988D A9 40 00    LDA #$0040              ;
$01/9890 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/9893 A0 09       LDY #$09                ;
$01/9895 94 76       STY $76,x  [$00:0076]   ;
$01/9897 60          RTS                     ;

hookbill_egg_hit_init:
$01/9898 BB          TYX                     ;
$01/9899 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/989C D0 07       BNE $07    [$98A5]      ;
$01/989E A9 14 00    LDA #$0014              ;
$01/98A1 95 16       STA $16,x  [$00:0016]   ;
$01/98A3 F6 76       INC $76,x  [$00:0076]   ;
$01/98A5 60          RTS                     ;

hookbill_egg_hit_cry:
$01/98A6 BB          TYX                     ;
$01/98A7 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/98AA D0 3B       BNE $3B    [$98E7]      ;
$01/98AC D6 16       DEC $16,x  [$00:0016]   ;
$01/98AE 10 17       BPL $17    [$98C7]      ;
$01/98B0 A0 06       LDY #$06                ;
$01/98B2 8C 74 10    STY $1074  [$00:1074]   ;
$01/98B5 A0 0A       LDY #$0A                ;
$01/98B7 94 78       STY $78,x  [$00:0078]   ;
$01/98B9 A9 01 00    LDA #$0001              ;
$01/98BC 8D 5E 10    STA $105E  [$00:105E]   ;
$01/98BF A9 10 00    LDA #$0010              ;
$01/98C2 95 18       STA $18,x  [$00:0018]   ;
$01/98C4 F6 76       INC $76,x  [$00:0076]   ;
$01/98C6 60          RTS                     ;

$01/98C7 B5 16       LDA $16,x  [$00:0016]   ;
$01/98C9 29 01 00    AND #$0001              ;
$01/98CC 0A          ASL A                   ;
$01/98CD 3A          DEC A                   ;
$01/98CE 85 00       STA $00    [$00:0000]   ;
$01/98D0 18          CLC                     ;
$01/98D1 6D 5E 10    ADC $105E  [$00:105E]   ;
$01/98D4 8D 5E 10    STA $105E  [$00:105E]   ;
$01/98D7 E2 20       SEP #$20                ;
$01/98D9 B5 78       LDA $78,x  [$00:0078]   ;
$01/98DB 18          CLC                     ;
$01/98DC 65 00       ADC $00    [$00:0000]   ;
$01/98DE 95 78       STA $78,x  [$00:0078]   ;
$01/98E0 C2 20       REP #$20                ;
$01/98E2 A9 20 00    LDA #$0020              ;
$01/98E5 95 18       STA $18,x  [$00:0018]   ;
$01/98E7 60          RTS                     ;

hookbill_egg_hit_not_egged_again:
$01/98E8 BB          TYX                     ;
$01/98E9 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/98EC D0 10       BNE $10    [$98FE]      ;
$01/98EE 9C 74 10    STZ $1074  [$00:1074]   ;
$01/98F1 9C 7A 10    STZ $107A  [$00:107A]   ;
$01/98F4 A9 40 00    LDA #$0040              ;
$01/98F7 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/98FA A0 09       LDY #$09                ;
$01/98FC 94 76       STY $76,x  [$00:0076]   ;
$01/98FE 60          RTS                     ;

; data table
CODE_0198FF:         dw $0100
CODE_019901:         dw $FF00

hookbill_egg_hit_final_init:
$01/9903 BB          TYX                     ;
$01/9904 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9907 D0 27       BNE $27    [$9930]      ;
$01/9909 BD 60 78    LDA $7860,x[$00:7860]   ;
$01/990C 29 01 00    AND #$0001              ;
$01/990F F0 1F       BEQ $1F    [$9930]      ;
$01/9911 BC 00 74    LDY $7400,x[$00:7400]   ;
$01/9914 B9 FF 98    LDA $98FF,y[$00:98FF]   ; table
$01/9917 9D 20 72    STA $7220,x[$00:7220]   ;
$01/991A F6 78       INC $78,x  [$00:0078]   ;
$01/991C EE 5E 10    INC $105E  [$00:105E]   ;
$01/991F A9 20 00    LDA #$0020              ;
$01/9922 95 18       STA $18,x  [$00:0018]   ;
$01/9924 8D C6 61    STA $61C6  [$00:61C6]   ;
$01/9927 A9 47 00    LDA #$0047              ;\ play sound #$0047
$01/992A 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/992E F6 76       INC $76,x  [$00:0076]   ;
$01/9930 60          RTS                     ;

hookbill_egg_hit_final_hop:
$01/9931 BB          TYX                     ;
$01/9932 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9935 D0 12       BNE $12    [$9949]      ;
$01/9937 F6 78       INC $78,x  [$00:0078]   ;
$01/9939 EE 5E 10    INC $105E  [$00:105E]   ;
$01/993C A9 10 00    LDA #$0010              ;
$01/993F 95 18       STA $18,x  [$00:0018]   ;
$01/9941 A9 00 FE    LDA #$FE00              ;
$01/9944 9D 22 72    STA $7222,x[$00:7222]   ;
$01/9947 F6 76       INC $76,x  [$00:0076]   ;
$01/9949 60          RTS                     ;

hookbill_egg_hit_final_fall:
$01/994A BB          TYX                     ;
$01/994B BD 60 78    LDA $7860,x[$00:7860]   ;
$01/994E 29 01 00    AND #$0001              ;
$01/9951 F0 3D       BEQ $3D    [$9990]      ;
$01/9953 A0 06       LDY #$06                ;
$01/9955 CC 74 10    CPY $1074  [$00:1074]   ;
$01/9958 F0 0A       BEQ $0A    [$9964]      ;
$01/995A 8C 74 10    STY $1074  [$00:1074]   ;
$01/995D A9 47 00    LDA #$0047              ;\ play sound #$0047
$01/9960 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/9964 A9 08 00    LDA #$0008              ;
$01/9967 9D 40 75    STA $7540,x[$00:7540]   ;
$01/996A 18          CLC                     ;
$01/996B 7D 20 72    ADC $7220,x[$00:7220]   ;
$01/996E C9 10 00    CMP #$0010              ;
$01/9971 B0 1D       BCS $1D    [$9990]      ;
$01/9973 9E 40 75    STZ $7540,x[$00:7540]   ;
$01/9976 9E 20 72    STZ $7220,x[$00:7220]   ;
$01/9979 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/997C D0 12       BNE $12    [$9990]      ;
$01/997E D6 78       DEC $78,x  [$00:0078]   ;
$01/9980 CE 5E 10    DEC $105E  [$00:105E]   ;
$01/9983 A9 08 00    LDA #$0008              ;
$01/9986 95 18       STA $18,x  [$00:0018]   ;
$01/9988 A9 20 00    LDA #$0020              ;
$01/998B 8D C6 61    STA $61C6  [$00:61C6]   ;
$01/998E F6 76       INC $76,x  [$00:0076]   ;
$01/9990 60          RTS                     ;

hookbill_egg_hit_final_lean:
$01/9991 BB          TYX                     ;
$01/9992 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9995 D0 16       BNE $16    [$99AD]      ;
$01/9997 A9 14 00    LDA #$0014              ;
$01/999A 95 16       STA $16,x  [$00:0016]   ;
$01/999C A0 04       LDY #$04                ;
$01/999E 8C 74 10    STY $1074  [$00:1074]   ;
$01/99A1 D6 78       DEC $78,x  [$00:0078]   ;
$01/99A3 CE 5E 10    DEC $105E  [$00:105E]   ;
$01/99A6 A9 20 00    LDA #$0020              ;
$01/99A9 95 18       STA $18,x  [$00:0018]   ;
$01/99AB F6 76       INC $76,x  [$00:0076]   ;
$01/99AD 60          RTS                     ;

hookbill_egg_hit_final_wobble:
$01/99AE BB          TYX                     ;
$01/99AF BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/99B2 D0 3B       BNE $3B    [$99EF]      ;
$01/99B4 D6 16       DEC $16,x  [$00:0016]   ;
$01/99B6 10 17       BPL $17    [$99CF]      ;
$01/99B8 A0 02       LDY #$02                ;
$01/99BA 8C 74 10    STY $1074  [$00:1074]   ;
$01/99BD A9 40 00    LDA #$0040              ;
$01/99C0 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/99C3 A0 18       LDY #$18                ;
$01/99C5 94 78       STY $78,x  [$00:0078]   ;
$01/99C7 A0 10       LDY #$10                ;
$01/99C9 8C 5E 10    STY $105E  [$00:105E]   ;
$01/99CC F6 76       INC $76,x  [$00:0076]   ;
$01/99CE 60          RTS                     ;

$01/99CF B5 16       LDA $16,x  [$00:0016]   ;
$01/99D1 29 01 00    AND #$0001              ;
$01/99D4 0A          ASL A                   ;
$01/99D5 3A          DEC A                   ;
$01/99D6 85 00       STA $00    [$00:0000]   ;
$01/99D8 18          CLC                     ;
$01/99D9 6D 5E 10    ADC $105E  [$00:105E]   ;
$01/99DC 8D 5E 10    STA $105E  [$00:105E]   ;
$01/99DF E2 20       SEP #$20                ;
$01/99E1 B5 78       LDA $78,x  [$00:0078]   ;
$01/99E3 18          CLC                     ;
$01/99E4 65 00       ADC $00    [$00:0000]   ;
$01/99E6 95 78       STA $78,x  [$00:0078]   ;
$01/99E8 C2 20       REP #$20                ;
$01/99EA A9 20 00    LDA #$0020              ;
$01/99ED 95 18       STA $18,x  [$00:0018]   ;
$01/99EF BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/99F2 D0 06       BNE $06    [$99FA]      ;
$01/99F4 A9 08 00    LDA #$0008              ;
$01/99F7 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/99FA 60          RTS                     ;

hookbill_egg_hit_final_freeze:
$01/99FB BB          TYX                     ;
$01/99FC BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/99FF D0 2B       BNE $2B    [$9A2C]      ;
$01/9A01 B5 16       LDA $16,x  [$00:0016]   ;
$01/9A03 F0 08       BEQ $08    [$9A0D]      ;
$01/9A05 74 16       STZ $16,x  [$00:0016]   ;
$01/9A07 A9 20 00    LDA #$0020              ;
$01/9A0A 95 18       STA $18,x  [$00:0018]   ;
$01/9A0C 60          RTS                     ;

$01/9A0D BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9A10 D0 1A       BNE $1A    [$9A2C]      ;
$01/9A12 A9 0C 00    LDA #$000C              ;
$01/9A15 95 16       STA $16,x  [$00:0016]   ;
$01/9A17 AD 60 10    LDA $1060  [$00:1060]   ;
$01/9A1A 38          SEC                     ;
$01/9A1B E9 80 00    SBC #$0080              ;
$01/9A1E BC 00 74    LDY $7400,x[$00:7400]   ;
$01/9A21 D0 04       BNE $04    [$9A27]      ;
$01/9A23 49 FF FF    EOR #$FFFF              ;
$01/9A26 1A          INC A                   ;
$01/9A27 8D 88 10    STA $1088  [$00:1088]   ;
$01/9A2A F6 76       INC $76,x  [$00:0076]   ;
$01/9A2C 60          RTS                     ;

; data table
CODE_019A2D:         dw $FE00
CODE_019A2F:         dw $0200

hookbill_hop_wobble:
$01/9A31 BB          TYX                     ;
$01/9A32 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9A35 D0 2D       BNE $2D    [$9A64]      ;
$01/9A37 D6 16       DEC $16,x  [$00:0016]   ;
$01/9A39 10 09       BPL $09    [$9A44]      ;
$01/9A3B A9 08 00    LDA #$0008              ;
$01/9A3E 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/9A41 F6 76       INC $76,x  [$00:0076]   ;
$01/9A43 60          RTS                     ;

$01/9A44 B5 16       LDA $16,x  [$00:0016]   ;
$01/9A46 29 01 00    AND #$0001              ;
$01/9A49 08          PHP                     ;
$01/9A4A 0A          ASL A                   ;
$01/9A4B 3A          DEC A                   ;
$01/9A4C 18          CLC                     ;
$01/9A4D 6D 5E 10    ADC $105E  [$00:105E]   ;
$01/9A50 8D 5E 10    STA $105E  [$00:105E]   ;
$01/9A53 A9 30 00    LDA #$0030              ;
$01/9A56 95 18       STA $18,x  [$00:0018]   ;
$01/9A58 28          PLP                     ;
$01/9A59 F0 09       BEQ $09    [$9A64]      ;
$01/9A5B BD 00 74    LDA $7400,x[$00:7400]   ;
$01/9A5E 49 02 00    EOR #$0002              ;
$01/9A61 9D 00 74    STA $7400,x[$00:7400]   ;
$01/9A64 AD 60 10    LDA $1060  [$00:1060]   ;
$01/9A67 8D 02 30    STA $3002  [$00:3002]   ;
$01/9A6A AD 88 10    LDA $1088  [$00:1088]   ;
$01/9A6D 8D 04 30    STA $3004  [$00:3004]   ;
$01/9A70 A9 80 00    LDA #$0080              ;
$01/9A73 8D 06 30    STA $3006  [$00:3006]   ;
$01/9A76 A9 48 00    LDA #$0048              ;
$01/9A79 8D 0C 30    STA $300C  [$00:300C]   ;
$01/9A7C 8A          TXA                     ;
$01/9A7D 8D 14 30    STA $3014  [$00:3014]   ;
$01/9A80 A2 08       LDX #$08                ;
$01/9A82 A9 29 A9    LDA #$A929              ;
$01/9A85 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/9A89 A6 12       LDX $12    [$00:0012]   ;
$01/9A8B AD 02 30    LDA $3002  [$00:3002]   ;
$01/9A8E 8D 88 10    STA $1088  [$00:1088]   ;
$01/9A91 60          RTS                     ;

hookbill_hop_one:
$01/9A92 BB          TYX                     ;
$01/9A93 BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/9A96 D0 F9       BNE $F9    [$9A91]      ;
$01/9A98 B4 16       LDY $16,x  [$00:0016]   ;
$01/9A9A F0 22       BEQ $22    [$9ABE]      ;
$01/9A9C 74 16       STZ $16,x  [$00:0016]   ;
$01/9A9E BC C2 77    LDY $77C2,x[$00:77C2]   ;
$01/9AA1 B9 2D 9A    LDA $9A2D,y[$00:9A2D]   ; table
$01/9AA4 9D 20 72    STA $7220,x[$00:7220]   ;
$01/9AA7 A9 00 FA    LDA #$FA00              ;
$01/9AAA 9D 22 72    STA $7222,x[$00:7222]   ;
$01/9AAD A0 03       LDY #$03                ;
$01/9AAF 8C 5E 10    STY $105E  [$00:105E]   ;
$01/9AB2 A9 08 00    LDA #$0008              ;
$01/9AB5 95 18       STA $18,x  [$00:0018]   ;
$01/9AB7 9E 38 7A    STZ $7A38,x[$00:7A38]   ;
$01/9ABA 9E 02 79    STZ $7902,x[$00:7902]   ;
$01/9ABD 60          RTS                     ;

$01/9ABE BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9AC1 D0 55       BNE $55    [$9B18]      ;
$01/9AC3 9E 20 72    STZ $7220,x[$00:7220]   ;
$01/9AC6 9E 22 72    STZ $7222,x[$00:7222]   ;
$01/9AC9 9E 42 75    STZ $7542,x[$00:7542]   ;
$01/9ACC BD E0 75    LDA $75E0,x[$00:75E0]   ;
$01/9ACF D0 10       BNE $10    [$9AE1]      ;
$01/9AD1 A9 20 00    LDA #$0020              ;
$01/9AD4 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/9AD7 9D E0 75    STA $75E0,x[$00:75E0]   ;
$01/9ADA A9 0C 00    LDA #$000C              ;
$01/9ADD 9D 20 77    STA $7720,x[$00:7720]   ;
$01/9AE0 60          RTS                     ;

$01/9AE1 A9 60 00    LDA #$0060              ;
$01/9AE4 9D 42 75    STA $7542,x[$00:7542]   ;
$01/9AE7 A9 00 08    LDA #$0800              ;
$01/9AEA 9D 22 72    STA $7222,x[$00:7222]   ;
$01/9AED 9D E2 75    STA $75E2,x[$00:75E2]   ;
$01/9AF0 BD 60 78    LDA $7860,x[$00:7860]   ;
$01/9AF3 29 01 00    AND #$0001              ;
$01/9AF6 F0 20       BEQ $20    [$9B18]      ;
$01/9AF8 A9 03 00    LDA #$0003              ;
$01/9AFB 95 16       STA $16,x  [$00:0016]   ;
$01/9AFD 9E E0 75    STZ $75E0,x[$00:75E0]   ;
$01/9B00 A9 20 00    LDA #$0020              ;
$01/9B03 8D C8 61    STA $61C8  [$00:61C8]   ;
$01/9B06 A9 04 00    LDA #$0004              ;
$01/9B09 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/9B0C 9C 74 10    STZ $1074  [$00:1074]   ;
$01/9B0F A9 47 00    LDA #$0047              ;\ play sound #$0047
$01/9B12 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/9B16 F6 76       INC $76,x  [$00:0076]   ;
$01/9B18 60          RTS                     ;

; data table
CODE_019B19:         dw $FE00
CODE_019B1B:         dw $0200

; data table
CODE_019B1D:         db $03, $10
CODE_019B1F:         db $00, $00
CODE_019B21:         db $00, $FC

hookbill_hop_two:
$01/9B23 BB          TYX                     ;
$01/9B24 BD 60 78    LDA $7860,x[$00:7860]   ;
$01/9B27 29 01 00    AND #$0001              ;
$01/9B2A F0 77       BEQ $77    [$9BA3]      ;
$01/9B2C BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/9B2F D0 72       BNE $72    [$9BA3]      ;
$01/9B31 B5 16       LDA $16,x  [$00:0016]   ;
$01/9B33 29 01 00    AND #$0001              ;
$01/9B36 D0 38       BNE $38    [$9B70]      ;
$01/9B38 9E 20 72    STZ $7220,x[$00:7220]   ;
$01/9B3B A9 20 00    LDA #$0020              ;
$01/9B3E 8D C8 61    STA $61C8  [$00:61C8]   ;
$01/9B41 A9 04 00    LDA #$0004              ;
$01/9B44 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/9B47 A9 47 00    LDA #$0047              ;\ play sound #$0047
$01/9B4A 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/9B4E D6 16       DEC $16,x  [$00:0016]   ;
$01/9B50 10 51       BPL $51    [$9BA3]      ;
$01/9B52 A9 80 00    LDA #$0080              ;
$01/9B55 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/9B58 9C 72 10    STZ $1072  [$00:1072]   ;
$01/9B5B A9 40 00    LDA #$0040              ;
$01/9B5E 9D 42 75    STA $7542,x[$00:7542]   ;
$01/9B61 A9 00 04    LDA #$0400              ;
$01/9B64 9D E2 75    STA $75E2,x[$00:75E2]   ;
$01/9B67 9E 38 7A    STZ $7A38,x[$00:7A38]   ;
$01/9B6A 9E 02 79    STZ $7902,x[$00:7902]   ;
$01/9B6D F6 76       INC $76,x  [$00:0076]   ;
$01/9B6F 60          RTS                     ;

$01/9B70 D6 16       DEC $16,x  [$00:0016]   ;
$01/9B72 B5 16       LDA $16,x  [$00:0016]   ;
$01/9B74 4A          LSR A                   ;
$01/9B75 A8          TAY                     ;
$01/9B76 E2 20       SEP #$20                ;
$01/9B78 B9 1D 9B    LDA $9B1D,y[$00:9B1D]   ; table
$01/9B7B 8D 5E 10    STA $105E  [$00:105E]   ;
$01/9B7E C2 20       REP #$20                ;
$01/9B80 B4 16       LDY $16,x  [$00:0016]   ;
$01/9B82 B9 1F 9B    LDA $9B1F,y[$00:9B1F]   ;
$01/9B85 9D 38 7A    STA $7A38,x[$00:7A38]   ;
$01/9B88 9D 02 79    STA $7902,x[$00:7902]   ;
$01/9B8B A9 08 00    LDA #$0008              ;
$01/9B8E 95 18       STA $18,x  [$00:0018]   ;
$01/9B90 A9 00 F8    LDA #$F800              ;
$01/9B93 9D 22 72    STA $7222,x[$00:7222]   ;
$01/9B96 BC C2 77    LDY $77C2,x[$00:77C2]   ;
$01/9B99 B9 19 9B    LDA $9B19,y[$00:9B19]   ; table
$01/9B9C 9D 20 72    STA $7220,x[$00:7220]   ;
$01/9B9F 98          TYA                     ;
$01/9BA0 9D 00 74    STA $7400,x[$00:7400]   ;
$01/9BA3 60          RTS                     ;

hookbill_ground_pound_and_body_out:
$01/9BA4 BB          TYX                     ;
$01/9BA5 BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/9BA8 D0 4E       BNE $4E    [$9BF8]      ;
$01/9BAA B5 16       LDA $16,x  [$00:0016]   ;
$01/9BAC F0 0F       BEQ $0F    [$9BBD]      ;
$01/9BAE 74 16       STZ $16,x  [$00:0016]   ;
$01/9BB0 A0 02       LDY #$02                ;
$01/9BB2 94 78       STY $78,x  [$00:0078]   ;
$01/9BB4 9C 5E 10    STZ $105E  [$00:105E]   ;
$01/9BB7 A9 08 00    LDA #$0008              ;
$01/9BBA 95 18       STA $18,x  [$00:0018]   ;
$01/9BBC 60          RTS                     ;

$01/9BBD BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9BC0 D0 36       BNE $36    [$9BF8]      ;
$01/9BC2 BD 60 78    LDA $7860,x[$00:7860]   ;
$01/9BC5 29 01 00    AND #$0001              ;
$01/9BC8 F0 2E       BEQ $2E    [$9BF8]      ;
$01/9BCA AD 6E 10    LDA $106E  [$00:106E]   ;
$01/9BCD 09 00 FF    ORA #$FF00              ;
$01/9BD0 8D 6E 10    STA $106E  [$00:106E]   ;
$01/9BD3 9C 7A 10    STZ $107A  [$00:107A]   ;
$01/9BD6 AC 7C 10    LDY $107C  [$00:107C]   ;
$01/9BD9 8C 7E 10    STY $107E  [$00:107E]   ;
$01/9BDC A9 40 00    LDA #$0040              ;
$01/9BDF 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/9BE2 A9 80 00    LDA #$0080              ;
$01/9BE5 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/9BE8 B4 76       LDY $76,x  [$00:0076]   ;
$01/9BEA C0 28       CPY #$28                ;
$01/9BEC F0 06       BEQ $06    [$9BF4]      ;
$01/9BEE 9C AC 60    STZ $60AC  [$00:60AC]   ;
$01/9BF1 9C 7B 0B    STZ $0B7B  [$00:0B7B]   ;
$01/9BF4 A0 01       LDY #$01                ;
$01/9BF6 94 76       STY $76,x  [$00:0076]   ;
$01/9BF8 60          RTS                     ;

hookbill_ground_pounded_init:
$01/9BF9 BB          TYX                     ;
$01/9BFA BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9BFD D0 24       BNE $24    [$9C23]      ;
$01/9BFF B4 76       LDY $76,x  [$00:0076]   ;
$01/9C01 C0 29       CPY #$29                ;
$01/9C03 F0 14       BEQ $14    [$9C19]      ;
$01/9C05 A0 27       LDY #$27                ;
$01/9C07 94 78       STY $78,x  [$00:0078]   ;
$01/9C09 A0 15       LDY #$15                ;
$01/9C0B 8C 5E 10    STY $105E  [$00:105E]   ;
$01/9C0E A9 01 00    LDA #$0001              ;
$01/9C11 9D 36 7A    STA $7A36,x[$00:7A36]   ;
$01/9C14 A9 40 00    LDA #$0040              ;
$01/9C17 80 05       BRA $05    [$9C1E]      ;

$01/9C19 74 16       STZ $16,x  [$00:0016]   ;
$01/9C1B A9 20 00    LDA #$0020              ;
$01/9C1E 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/9C21 F6 76       INC $76,x  [$00:0076]   ;
$01/9C23 AD 78 10    LDA $1078  [$00:1078]   ;
$01/9C26 38          SEC                     ;
$01/9C27 E9 08 00    SBC #$0008              ;
$01/9C2A C9 C0 00    CMP #$00C0              ;
$01/9C2D 30 1D       BMI $1D    [$9C4C]      ;
$01/9C2F 8D 78 10    STA $1078  [$00:1078]   ;
$01/9C32 8D 00 30    STA $3000  [$00:3000]   ;
$01/9C35 A9 12 00    LDA #$0012              ;
$01/9C38 8D 0C 30    STA $300C  [$00:300C]   ;
$01/9C3B A2 0B       LDX #$0B                ;
$01/9C3D A9 B6 86    LDA #$86B6              ;
$01/9C40 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/9C44 A6 12       LDX $12    [$00:0012]   ;
$01/9C46 AD 00 30    LDA $3000  [$00:3000]   ;
$01/9C49 9D 20 77    STA $7720,x[$00:7720]   ;
$01/9C4C 60          RTS                     ;

; data table
CODE_019C4D:         dw $FC00
CODE_019C4F:         dw $0400

hookbill_ground_pounded_flash:
$01/9C51 BB          TYX                     ;
$01/9C52 BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/9C55 D0 71       BNE $71    [$9CC8]      ;
$01/9C57 AD 78 10    LDA $1078  [$00:1078]   ;
$01/9C5A 18          CLC                     ;
$01/9C5B 69 08 00    ADC #$0008              ;
$01/9C5E C9 01 01    CMP #$0101              ;
$01/9C61 30 48       BMI $48    [$9CAB]      ;
$01/9C63 9C AC 60    STZ $60AC  [$00:60AC]   ;
$01/9C66 A0 00       LDY #$00                ;
$01/9C68 BD 80 76    LDA $7680,x[$00:7680]   ;
$01/9C6B C9 80 00    CMP #$0080              ;
$01/9C6E 10 02       BPL $02    [$9C72]      ;
$01/9C70 C8          INY                     ;
$01/9C71 C8          INY                     ;
$01/9C72 B9 4D 9C    LDA $9C4D,y[$00:9C4D]   ; table
$01/9C75 8D A8 60    STA $60A8  [$00:60A8]   ;
$01/9C78 8D B4 60    STA $60B4  [$00:60B4]   ;
$01/9C7B A9 00 FA    LDA #$FA00              ;
$01/9C7E 8D AA 60    STA $60AA  [$00:60AA]   ;
$01/9C81 A9 06 00    LDA #$0006              ;
$01/9C84 8D C0 60    STA $60C0  [$00:60C0]   ;
$01/9C87 A9 01 80    LDA #$8001              ;
$01/9C8A 8D D2 60    STA $60D2  [$00:60D2]   ;
$01/9C8D 9C B4 61    STZ $61B4  [$00:61B4]   ;
$01/9C90 A0 02       LDY #$02                ;
$01/9C92 8C 74 10    STY $1074  [$00:1074]   ;
$01/9C95 94 16       STY $16,x  [$00:0016]   ;
$01/9C97 A9 20 00    LDA #$0020              ;
$01/9C9A 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/9C9D A0 18       LDY #$18                ;
$01/9C9F 94 78       STY $78,x  [$00:0078]   ;
$01/9CA1 A0 10       LDY #$10                ;
$01/9CA3 8C 5E 10    STY $105E  [$00:105E]   ;
$01/9CA6 A0 24       LDY #$24                ;
$01/9CA8 94 76       STY $76,x  [$00:0076]   ;
$01/9CAA 60          RTS                     ;

$01/9CAB 8D 78 10    STA $1078  [$00:1078]   ;
$01/9CAE 8D 00 30    STA $3000  [$00:3000]   ;
$01/9CB1 A9 12 00    LDA #$0012              ;
$01/9CB4 8D 0C 30    STA $300C  [$00:300C]   ;
$01/9CB7 A2 0B       LDX #$0B                ;
$01/9CB9 A9 B6 86    LDA #$86B6              ;
$01/9CBC 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/9CC0 A6 12       LDX $12    [$00:0012]   ;
$01/9CC2 AD 00 30    LDA $3000  [$00:3000]   ;
$01/9CC5 9D 20 77    STA $7720,x[$00:7720]   ;
$01/9CC8 60          RTS                     ;

hookbill_begin_koopa_walking:
$01/9CC9 BB          TYX                     ;
$01/9CCA BD 16 7C    LDA $7C16,x[$00:7C16]   ;
$01/9CCD C9 A0 00    CMP #$00A0              ;
$01/9CD0 10 0F       BPL $0F    [$9CE1]      ;
$01/9CD2 A9 08 00    LDA #$0008              ;
$01/9CD5 9D 02 74    STA $7402,x[$00:7402]   ;
$01/9CD8 9E 20 72    STZ $7220,x[$00:7220]   ;
$01/9CDB EE 15 10    INC $1015  [$00:1015]   ;
$01/9CDE F6 76       INC $76,x  [$00:0076]   ;
$01/9CE0 60          RTS                     ;

$01/9CE1 BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/9CE4 D0 10       BNE $10    [$9CF6]      ;
$01/9CE6 A9 05 00    LDA #$0005              ;
$01/9CE9 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/9CEC BD 02 74    LDA $7402,x[$00:7402]   ;
$01/9CEF 1A          INC A                   ; continue walking over
$01/9CF0 29 07 00    AND #$0007              ;
$01/9CF3 9D 02 74    STA $7402,x[$00:7402]   ;
$01/9CF6 60          RTS                     ;

hookbill_begin_kamek:
$01/9CF7 BB          TYX                     ;
$01/9CF8 AD 15 10    LDA $1015  [$00:1015]   ;
$01/9CFB 10 05       BPL $05    [$9D02]      ;
$01/9CFD 9C 15 10    STZ $1015  [$00:1015]   ;
$01/9D00 F6 76       INC $76,x  [$00:0076]   ;
$01/9D02 60          RTS                     ;

; data table
CODE_019D03:         dw $0000
CODE_019D05:         dw $1000

; data table
CODE_019D07:         db $00, $70, $00, $70

; data table
CODE_019D0B:         dw $00B7
CODE_019D0D:         dw $00B8

hookbill_begin_init1:
$01/9D0F C2 10       REP #$10                ;
$01/9D11 A9 00 08    LDA #$0800              ;
$01/9D14 85 00       STA $00    [$00:0000]   ;
$01/9D16 AD 16 0C    LDA $0C16  [$00:0C16]   ;
$01/9D19 D0 46       BNE $46    [$9D61]      ;
$01/9D1B AD 14 0C    LDA $0C14  [$00:0C14]   ;
$01/9D1E C9 02 00    CMP #$0002              ;
$01/9D21 90 0A       BCC $0A    [$9D2D]      ;
$01/9D23 9C 18 0C    STZ $0C18  [$00:0C18]   ;
$01/9D26 E2 10       SEP #$10                ;
$01/9D28 A6 12       LDX $12    [$00:0012]   ;
$01/9D2A F6 76       INC $76,x  [$00:0076]   ;
$01/9D2C 60          RTS                     ;

$01/9D2D 0A          ASL A                   ;
$01/9D2E A8          TAY                     ;
$01/9D2F B9 03 9D    LDA $9D03,y[$00:9D03]   ; table
$01/9D32 8D 18 0C    STA $0C18  [$00:0C18]   ;
$01/9D35 A9 00 68    LDA #$6800              ;
$01/9D38 8D 1A 0C    STA $0C1A  [$00:0C1A]   ;
$01/9D3B BE 07 9D    LDX $9D07,y[$00:9D07]   ; table
$01/9D3E B9 0B 9D    LDA $9D0B,y[$00:9D0B]   ; table
$01/9D41 22 56 B7 00 JSL $00B756[$00:B756]   ;
$01/9D45 8D 16 0C    STA $0C16  [$00:0C16]   ;
$01/9D48 EE 14 0C    INC $0C14  [$00:0C14]   ;
$01/9D4B 48          PHA                     ;
$01/9D4C E2 10       SEP #$10                ;
$01/9D4E 8D 18 30    STA $3018  [$00:3018]   ;
$01/9D51 A2 08       LDX #$08                ;
$01/9D53 A9 5F AA    LDA #$AA5F              ;
$01/9D56 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/9D5A C2 10       REP #$10                ;
$01/9D5C 68          PLA                     ;
$01/9D5D 0A          ASL A                   ;
$01/9D5E 8D 16 0C    STA $0C16  [$00:0C16]   ;
$01/9D61 38          SEC                     ;
$01/9D62 E9 00 08    SBC #$0800              ;
$01/9D65 B0 08       BCS $08    [$9D6F]      ;
$01/9D67 69 00 08    ADC #$0800              ;
$01/9D6A 85 00       STA $00    [$00:0000]   ;
$01/9D6C A9 00 00    LDA #$0000              ;
$01/9D6F 8D 16 0C    STA $0C16  [$00:0C16]   ;
$01/9D72 AE 1A 0C    LDX $0C1A  [$00:0C1A]   ;
$01/9D75 8A          TXA                     ;
$01/9D76 18          CLC                     ;
$01/9D77 65 00       ADC $00    [$00:0000]   ;
$01/9D79 8D 1A 0C    STA $0C1A  [$00:0C1A]   ;
$01/9D7C A9 70 00    LDA #$0070              ;
$01/9D7F 8D 01 00    STA $0001  [$00:0001]   ;
$01/9D82 AC 18 0C    LDY $0C18  [$00:0C18]   ;
$01/9D85 A5 00       LDA $00    [$00:0000]   ;
$01/9D87 22 86 BF 00 JSL $00BF86[$00:BF86]   ;
$01/9D8B A5 00       LDA $00    [$00:0000]   ;
$01/9D8D 18          CLC                     ;
$01/9D8E 6D 18 0C    ADC $0C18  [$00:0C18]   ;
$01/9D91 8D 18 0C    STA $0C18  [$00:0C18]   ;
$01/9D94 E2 10       SEP #$10                ;
$01/9D96 A6 12       LDX $12    [$00:0012]   ;
$01/9D98 60          RTS                     ;

; hookbill: gets DMA'd to VRAM
DATA_019D99:         db $00, $01, $02, $03, $04, $05, $06, $00
DATA_019DA1:         db $10, $11, $12, $13, $14, $15, $16, $17
DATA_019DA9:         db $20, $21, $22, $23, $24, $25, $26, $27
DATA_019DB1:         db $30, $31, $32, $33, $34, $35, $36, $37
DATA_019DB9:         db $40, $41, $42, $43, $44, $45, $46, $47
DATA_019DC1:         db $00, $51, $52, $53, $54, $55, $56, $00
DATA_019DC9:         db $00, $00, $62, $63, $64, $65, $00, $00

; data table
CODE_019DD1:         db $00
CODE_019DD2:         db $05
CODE_019DD3:         db $40
CODE_019DD4:         db $50
CODE_019DD5:         db $7E

; data table
CODE_019DD6:         db $70
CODE_019DD7:         db $07
CODE_019DD8:         db $2B
CODE_019DD9:         db $07
CODE_019DDA:         db $01
CODE_019DDB:         db $49
CODE_019DDC:         db $00

; data table
CODE_019DDD:         db $70
CODE_019DDE:         db $11
CODE_019DDF:         db $00
CODE_019DE0:         db $2B
CODE_019DE1:         db $11
CODE_019DE2:         db $00
CODE_019DE3:         db $01
CODE_019DE4:         db $12
CODE_019DE5:         db $00
CODE_019DE6:         db $00

hookbill_begin_init2:
$01/9DE7 C2 10       REP #$10                ;
$01/9DE9 AD 18 0C    LDA $0C18  [$00:0C18]   ;
$01/9DEC C9 00 40    CMP #$4000              ;
$01/9DEF B0 16       BCS $16    [$9E07]      ;
$01/9DF1 A8          TAY                     ;
$01/9DF2 69 00 08    ADC #$0800              ;
$01/9DF5 8D 18 0C    STA $0C18  [$00:0C18]   ;
$01/9DF8 A9 00 08    LDA #$0800              ;
$01/9DFB A2 00 00    LDX #$0000              ;
$01/9DFE 22 4A BF 00 JSL $00BF4A[$00:BF4A]   ;
$01/9E02 E2 10       SEP #$10                ;
$01/9E04 A6 12       LDX $12    [$00:0012]   ;
$01/9E06 60          RTS                     ;

$01/9E07 A9 00 00    LDA #$0000              ;
$01/9E0A 85 00       STA $00    [$00:0000]   ;
$01/9E0C A9 99 9D    LDA #$9D99              ; table...?
$01/9E0F 85 02       STA $02    [$00:0002]   ;
$01/9E11 A9 01 00    LDA #$0001              ;
$01/9E14 8D 01 00    STA $0001  [$00:0001]   ;
$01/9E17 A9 07 00    LDA #$0007              ;
$01/9E1A 85 04       STA $04    [$00:0004]   ;
$01/9E1C A4 00       LDY $00    [$00:0000]   ;
$01/9E1E 98          TYA                     ;
$01/9E1F 18          CLC                     ;
$01/9E20 69 80 00    ADC #$0080              ;
$01/9E23 85 00       STA $00    [$00:0000]   ;
$01/9E25 A6 02       LDX $02    [$00:0002]   ;
$01/9E27 8A          TXA                     ;
$01/9E28 18          CLC                     ;
$01/9E29 69 08 00    ADC #$0008              ;
$01/9E2C 85 02       STA $02    [$00:0002]   ;
$01/9E2E A9 08 00    LDA #$0008              ;
$01/9E31 22 16 BF 00 JSL $00BF16[$00:BF16]   ;
$01/9E35 C6 04       DEC $04    [$00:0004]   ;
$01/9E37 D0 E3       BNE $E3    [$9E1C]      ;
$01/9E39 E2 10       SEP #$10                ;
$01/9E3B 20 91 92    JSR $9291  [$00:9291]   ;
$01/9E3E C2 10       REP #$10                ;
$01/9E40 E2 20       SEP #$20                ;
$01/9E42 A2 04 00    LDX #$0004              ;
$01/9E45 BD D1 9D    LDA $9DD1,x[$00:9DD1]   ; table
$01/9E48 9D 70 43    STA $4370,x[$00:4370]   ;
$01/9E4B CA          DEX                     ;
$01/9E4C 10 F7       BPL $F7    [$9E45]      ;
$01/9E4E A2 09 00    LDX #$0009              ;
$01/9E51 BD D6 9D    LDA $9DD6,x[$00:9DD6]   ; table
$01/9E54 9F 40 50 7E STA $7E5040,x[$7E:5040] ;
$01/9E58 BD DD 9D    LDA $9DDD,x[$00:9DDD]   ; table
$01/9E5B 9F E4 51 7E STA $7E51E4,x[$7E:51E4] ;
$01/9E5F CA          DEX                     ;
$01/9E60 10 EF       BPL $EF    [$9E51]      ;
$01/9E62 A9 C0       LDA #$C0                ;
$01/9E64 0C 4A 09    TSB $094A  [$00:094A]   ;
$01/9E67 A9 0A       LDA #$0A                ;
$01/9E69 8D 1C 01    STA $011C  [$00:011C]   ;
$01/9E6C A9 69       LDA #$69                ;
$01/9E6E 8D 60 09    STA $0960  [$00:0960]   ;
$01/9E71 C2 20       REP #$20                ;
$01/9E73 A9 12 00    LDA #$0012              ;
$01/9E76 8D 67 09    STA $0967  [$00:0967]   ;
$01/9E79 A9 00 01    LDA #$0100              ;
$01/9E7C 8D 4F 09    STA $094F  [$00:094F]   ;
$01/9E7F 8D 55 09    STA $0955  [$00:0955]   ;
$01/9E82 9C 51 09    STZ $0951  [$00:0951]   ;
$01/9E85 9C 53 09    STZ $0953  [$00:0953]   ;
$01/9E88 A9 20 00    LDA #$0020              ;
$01/9E8B 8D 57 09    STA $0957  [$00:0957]   ;
$01/9E8E A9 1C 00    LDA #$001C              ;
$01/9E91 8D 59 09    STA $0959  [$00:0959]   ;
$01/9E94 A9 80 00    LDA #$0080              ;
$01/9E97 8D 43 00    STA $0043  [$00:0043]   ;
$01/9E9A E2 10       SEP #$10                ;
$01/9E9C A6 12       LDX $12    [$00:0012]   ;
$01/9E9E A9 04 00    LDA #$0004              ;
$01/9EA1 95 16       STA $16,x  [$00:0016]   ;
$01/9EA3 A9 00 FD    LDA #$FD00              ;
$01/9EA6 9D 22 72    STA $7222,x[$00:7222]   ;
$01/9EA9 A9 0A 00    LDA #$000A              ;
$01/9EAC 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/9EAF F6 76       INC $76,x  [$00:0076]   ;
$01/9EB1 60          RTS                     ;

; data table
CODE_019EB2:         dw $0B0F
CODE_019EB4:         dw $0D0C

hookbill_begin_koopa_crouch:
$01/9EB6 BB          TYX                     ;
$01/9EB7 BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/9EBA D0 F5       BNE $F5    [$9EB1]      ;
$01/9EBC D6 16       DEC $16,x  [$00:0016]   ;
$01/9EBE 30 12       BMI $12    [$9ED2]      ;
$01/9EC0 B4 16       LDY $16,x  [$00:0016]   ;
$01/9EC2 B9 B2 9E    LDA $9EB2,y[$00:9EB2]   ; table
$01/9EC5 29 FF 00    AND #$00FF              ;
$01/9EC8 9D 02 74    STA $7402,x[$00:7402]   ;
$01/9ECB A9 04 00    LDA #$0004              ;
$01/9ECE 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/9ED1 60          RTS                     ;

$01/9ED2 BD 60 78    LDA $7860,x[$00:7860]   ;
$01/9ED5 F0 FA       BEQ $FA    [$9ED1]      ;
$01/9ED7 A9 6C 6E    LDA #$6E6C              ;
$01/9EDA 9D A0 6F    STA $6FA0,x[$00:6FA0]   ;
$01/9EDD A9 41 20    LDA #$2041              ;
$01/9EE0 9D A2 6F    STA $6FA2,x[$00:6FA2]   ;
$01/9EE3 A9 02 A9    LDA #$A902              ;
$01/9EE6 9D 40 70    STA $7040,x[$00:7040]   ;
$01/9EE9 EE 80 10    INC $1080  [$00:1080]   ;
$01/9EEC BD E2 70    LDA $70E2,x[$00:70E2]   ;
$01/9EEF 38          SEC                     ;
$01/9EF0 E9 02 00    SBC #$0002              ;
$01/9EF3 9D E2 70    STA $70E2,x[$00:70E2]   ;
$01/9EF6 BD 82 71    LDA $7182,x[$00:7182]   ;
$01/9EF9 18          CLC                     ;
$01/9EFA 69 04 00    ADC #$0004              ;
$01/9EFD 9D 82 71    STA $7182,x[$00:7182]   ;
$01/9F00 74 18       STZ $18,x  [$00:0018]   ;
$01/9F02 9E 36 7A    STZ $7A36,x[$00:7A36]   ;
$01/9F05 9E 42 70    STZ $7042,x[$00:7042]   ;
$01/9F08 74 16       STZ $16,x  [$00:0016]   ;
$01/9F0A A9 50 00    LDA #$0050              ;
$01/9F0D 8D 76 10    STA $1076  [$00:1076]   ;
$01/9F10 8D 78 10    STA $1078  [$00:1078]   ;
$01/9F13 20 C9 8A    JSR $8AC9  [$00:8AC9]   ;
$01/9F16 20 B6 8A    JSR $8AB6  [$00:8AB6]   ;
$01/9F19 20 E1 8A    JSR $8AE1  [$00:8AE1]   ;
$01/9F1C 20 15 8B    JSR $8B15  [$00:8B15]   ;
$01/9F1F EE F9 0C    INC $0CF9  [$00:0CF9]   ;
$01/9F22 A6 12       LDX $12    [$00:0012]   ;
$01/9F24 EE 70 10    INC $1070  [$00:1070]   ;
$01/9F27 A9 01 00    LDA #$0001              ;
$01/9F2A 8D 6E 10    STA $106E  [$00:106E]   ;
$01/9F2D EE 72 10    INC $1072  [$00:1072]   ;
$01/9F30 A9 FE FF    LDA #$FFFE              ;
$01/9F33 9D 20 77    STA $7720,x[$00:7720]   ;
$01/9F36 A9 00 FE    LDA #$FE00              ;
$01/9F39 9D 00 79    STA $7900,x[$00:7900]   ;
$01/9F3C 9E 38 7A    STZ $7A38,x[$00:7A38]   ;
$01/9F3F 9E 36 7A    STZ $7A36,x[$00:7A36]   ;
$01/9F42 A9 25 00    LDA #$0025              ;
$01/9F45 9D 02 74    STA $7402,x[$00:7402]   ;
$01/9F48 A8          TAY                     ;
$01/9F49 94 78       STY $78,x  [$00:0078]   ;
$01/9F4B A0 12       LDY #$12                ;
$01/9F4D 8C 5C 10    STY $105C  [$00:105C]   ;
$01/9F50 8C 5E 10    STY $105E  [$00:105E]   ;
$01/9F53 F6 76       INC $76,x  [$00:0076]   ;
$01/9F55 68          PLA                     ; \ skips the RTS
$01/9F56 6B          RTL                     ; / and goes back one in stack

hookbill_begin_shell_init:
$01/9F57 BB          TYX                     ;
$01/9F58 BD 60 78    LDA $7860,x[$00:7860]   ;
$01/9F5B 29 01 00    AND #$0001              ;
$01/9F5E F0 19       BEQ $19    [$9F79]      ;
$01/9F60 A9 10 00    LDA #$0010              ;
$01/9F63 95 16       STA $16,x  [$00:0016]   ;
$01/9F65 9E 36 7A    STZ $7A36,x[$00:7A36]   ;
$01/9F68 EE 5E 10    INC $105E  [$00:105E]   ;
$01/9F6B A9 18 00    LDA #$0018              ;
$01/9F6E 95 18       STA $18,x  [$00:0018]   ;
$01/9F70 A9 87 00    LDA #$0087              ;\ play sound #$0087
$01/9F73 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/9F77 F6 76       INC $76,x  [$00:0076]   ;
$01/9F79 60          RTS                     ;

hookbill_begin_shell_grow:
$01/9F7A BB          TYX                     ;
$01/9F7B BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9F7E D0 31       BNE $31    [$9FB1]      ;
$01/9F80 B5 16       LDA $16,x  [$00:0016]   ;
$01/9F82 10 0C       BPL $0C    [$9F90]      ;
$01/9F84 9C 72 10    STZ $1072  [$00:1072]   ;
$01/9F87 A9 80 00    LDA #$0080              ;
$01/9F8A 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/9F8D F6 76       INC $76,x  [$00:0076]   ;
$01/9F8F 60          RTS                     ;

$01/9F90 D6 16       DEC $16,x  [$00:0016]   ;
$01/9F92 10 07       BPL $07    [$9F9B]      ;
$01/9F94 F6 78       INC $78,x  [$00:0078]   ;
$01/9F96 A9 12 00    LDA #$0012              ;
$01/9F99 80 0B       BRA $0B    [$9FA6]      ;

$01/9F9B B5 16       LDA $16,x  [$00:0016]   ;
$01/9F9D 29 01 00    AND #$0001              ;
$01/9FA0 0A          ASL A                   ;
$01/9FA1 3A          DEC A                   ;
$01/9FA2 18          CLC                     ;
$01/9FA3 6D 5E 10    ADC $105E  [$00:105E]   ;
$01/9FA6 8D 5E 10    STA $105E  [$00:105E]   ;
$01/9FA9 A9 18 00    LDA #$0018              ;
$01/9FAC 95 18       STA $18,x  [$00:0018]   ;
$01/9FAE 9E 36 7A    STZ $7A36,x[$00:7A36]   ;
$01/9FB1 AD 76 10    LDA $1076  [$00:1076]   ;
$01/9FB4 18          CLC                     ;
$01/9FB5 69 01 00    ADC #$0001              ;
$01/9FB8 C9 00 01    CMP #$0100              ;
$01/9FBB 30 03       BMI $03    [$9FC0]      ;
$01/9FBD A9 00 01    LDA #$0100              ;
$01/9FC0 8D 76 10    STA $1076  [$00:1076]   ;
$01/9FC3 8D 78 10    STA $1078  [$00:1078]   ;
$01/9FC6 8D 0C 30    STA $300C  [$00:300C]   ;
$01/9FC9 A9 16 00    LDA #$0016              ;
$01/9FCC 8D 00 30    STA $3000  [$00:3000]   ;
$01/9FCF A2 0B       LDX #$0B                ;
$01/9FD1 A9 B6 86    LDA #$86B6              ;
$01/9FD4 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/9FD8 A6 12       LDX $12    [$00:0012]   ;
$01/9FDA AD 00 30    LDA $3000  [$00:3000]   ;
$01/9FDD 38          SEC                     ;
$01/9FDE E9 08 00    SBC #$0008              ;
$01/9FE1 9D 20 77    STA $7720,x[$00:7720]   ;
$01/9FE4 60          RTS                     ;

hookbill_dead_squish_down:
$01/9FE5 BB          TYX                     ;
$01/9FE6 BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/9FE9 D0 29       BNE $29    [$A014]      ;
$01/9FEB BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/9FEE D0 1F       BNE $1F    [$A00F]      ;
$01/9FF0 A9 0A 00    LDA #$000A              ;
$01/9FF3 95 16       STA $16,x  [$00:0016]   ;
$01/9FF5 EE 59 0B    INC $0B59  [$00:0B59]   ;
$01/9FF8 EE 5C 10    INC $105C  [$00:105C]   ;
$01/9FFB F6 76       INC $76,x  [$00:0076]   ;
$01/9FFD BD E2 70    LDA $70E2,x[$00:70E2]   ;
$01/A000 85 00       STA $00    [$00:0000]   ;
$01/A002 BD 82 71    LDA $7182,x[$00:7182]   ;
$01/A005 85 02       STA $02    [$00:0002]   ;
$01/A007 A9 40 03    LDA #$0340              ;
$01/A00A 22 A6 E1 02 JSL $02E1A6[$02:E1A6]   ;
$01/A00E 60          RTS                     ;

$01/A00F A9 08 00    LDA #$0008              ;
$01/A012 95 18       STA $18,x  [$00:0018]   ;
$01/A014 60          RTS                     ;

; data table
CODE_01A015:         dw $0003
CODE_01A017:         dw $FFFE
CODE_01A019:         dw $0002
CODE_01A01B:         dw $FFFF
CODE_01A01D:         dw $0001
CODE_01A01F:         dw $FFFD
CODE_01A021:         dw $0002
CODE_01A023:         dw $FFFE
CODE_01A025:         dw $0001
CODE_01A027:         dw $FFFF

; data table
CODE_01A029:         dw $0004
CODE_01A02B:         dw $0008
CODE_01A02D:         dw $000E
CODE_01A02F:         dw $0014
CODE_01A031:         dw $001C
CODE_01A033:         dw $0020
CODE_01A035:         dw $0028
CODE_01A037:         dw $002C

; data table
CODE_01A039:         dw $FFFC
CODE_01A03B:         dw $FFF8
CODE_01A03D:         dw $0000
CODE_01A03F:         dw $FFF0
CODE_01A041:         dw $FFF4
CODE_01A043:         dw $0008
CODE_01A045:         dw $0002
CODE_01A047:         dw $FFFC

; data table
CODE_01A049:         dw $0000
CODE_01A04B:         dw $0001
CODE_01A04D:         dw $0002
CODE_01A04F:         dw $0001
CODE_01A051:         dw $0000
CODE_01A053:         dw $0001
CODE_01A055:         dw $0000
CODE_01A057:         dw $0002

; data table
CODE_01A059:         dw $0100
CODE_01A05B:         dw $0480
CODE_01A05D:         dw $0180
CODE_01A05F:         dw $0300
CODE_01A061:         dw $01C0
CODE_01A063:         dw $0240
CODE_01A065:         dw $0080
CODE_01A067:         dw $0200
CODE_01A069:         dw $FD00
CODE_01A06B:         dw $FF00
CODE_01A06D:         dw $FE00
CODE_01A06F:         dw $F840
CODE_01A071:         dw $FD80
CODE_01A073:         dw $FF80
CODE_01A075:         dw $FAC0
CODE_01A077:         dw $FE80

; data table
CODE_01A079:         dw $FA00
CODE_01A07B:         dw $FD80
CODE_01A07D:         dw $FC00
CODE_01A07F:         dw $FF80
CODE_01A081:         dw $FC80
CODE_01A083:         dw $FB00
CODE_01A085:         dw $F780
CODE_01A087:         dw $FE00
CODE_01A089:         dw $FB80
CODE_01A08B:         dw $FF00
CODE_01A08D:         dw $F800
CODE_01A08F:         dw $FB00
CODE_01A091:         dw $FE80
CODE_01A093:         dw $FD00
CODE_01A095:         dw $FB80
CODE_01A097:         dw $FA80

; flatten this mothafucka to a pancake
hookbill_dead_pancake:
$01/A099 BB          TYX                     ;
$01/A09A BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/A09D D0 5E       BNE $5E    [$A0FD]      ;
$01/A09F BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/A0A2 D0 13       BNE $13    [$A0B7]      ;
$01/A0A4 D6 16       DEC $16,x  [$00:0016]   ;
$01/A0A6 D6 16       DEC $16,x  [$00:0016]   ;
$01/A0A8 30 54       BMI $54    [$A0FE]      ;
$01/A0AA D0 05       BNE $05    [$A0B1]      ;
$01/A0AC A9 40 00    LDA #$0040              ;
$01/A0AF 80 03       BRA $03    [$A0B4]      ;

$01/A0B1 A9 20 00    LDA #$0020              ;
$01/A0B4 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/A0B7 B5 16       LDA $16,x  [$00:0016]   ;
$01/A0B9 D0 0C       BNE $0C    [$A0C7]      ;
$01/A0BB AD 74 79    LDA $7974  [$00:7974]   ;
$01/A0BE 29 01 00    AND #$0001              ;
$01/A0C1 D0 3A       BNE $3A    [$A0FD]      ;
$01/A0C3 A0 04       LDY #$04                ;
$01/A0C5 80 04       BRA $04    [$A0CB]      ;

$01/A0C7 29 02 00    AND #$0002              ;
$01/A0CA A8          TAY                     ;
$01/A0CB B9 15 A0    LDA $A015,y[$00:A015]   ; table
$01/A0CE 18          CLC                     ;
$01/A0CF 6D 76 10    ADC $1076  [$00:1076]   ;
$01/A0D2 8D 76 10    STA $1076  [$00:1076]   ;
$01/A0D5 B9 1F A0    LDA $A01F,y[$00:A01F]   ;
$01/A0D8 18          CLC                     ;
$01/A0D9 6D 78 10    ADC $1078  [$00:1078]   ;
$01/A0DC 8D 78 10    STA $1078  [$00:1078]   ;
$01/A0DF 8D 00 30    STA $3000  [$00:3000]   ;
$01/A0E2 A9 16 00    LDA #$0016              ;
$01/A0E5 8D 0C 30    STA $300C  [$00:300C]   ;
$01/A0E8 A2 0B       LDX #$0B                ;
$01/A0EA A9 B6 86    LDA #$86B6              ;
$01/A0ED 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/A0F1 A6 12       LDX $12    [$00:0012]   ;
$01/A0F3 AD 00 30    LDA $3000  [$00:3000]   ;
$01/A0F6 38          SEC                     ;
$01/A0F7 E9 08 00    SBC #$0008              ;
$01/A0FA 9D 20 77    STA $7720,x[$00:7720]   ;
$01/A0FD 60          RTS                     ;

$01/A0FE BD E2 70    LDA $70E2,x[$00:70E2]   ;
$01/A101 8D 84 10    STA $1084  [$00:1084]   ;
$01/A104 BD 82 71    LDA $7182,x[$00:7182]   ;
$01/A107 8D 86 10    STA $1086  [$00:1086]   ;
$01/A10A EE 80 10    INC $1080  [$00:1080]   ;
$01/A10D A9 A1 E0    LDA #$E0A1              ;
$01/A110 8D 18 30    STA $3018  [$00:3018]   ;
$01/A113 A9 54 00    LDA #$0054              ;
$01/A116 8D 1A 30    STA $301A  [$00:301A]   ;
$01/A119 A9 10 00    LDA #$0010              ;
$01/A11C 8D 10 30    STA $3010  [$00:3010]   ;
$01/A11F 8D 12 30    STA $3012  [$00:3012]   ;
$01/A122 A9 00 01    LDA #$0100              ;
$01/A125 8D 0C 30    STA $300C  [$00:300C]   ;
$01/A128 9C 06 30    STZ $3006  [$00:3006]   ;
$01/A12B 9C 04 30    STZ $3004  [$00:3004]   ;
$01/A12E A2 08       LDX #$08                ;
$01/A130 A9 93 82    LDA #$8293              ;
$01/A133 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/A137 EE F9 0C    INC $0CF9  [$00:0CF9]   ;
$01/A13A A6 12       LDX $12    [$00:0012]   ;
$01/A13C A9 6C 6E    LDA #$6E6C              ;
$01/A13F 9D A0 6F    STA $6FA0,x[$00:6FA0]   ;
$01/A142 A9 40 20    LDA #$2040              ;
$01/A145 9D A2 6F    STA $6FA2,x[$00:6FA2]   ;
$01/A148 A9 01 31    LDA #$3101              ;
$01/A14B 9D 40 70    STA $7040,x[$00:7040]   ;
$01/A14E A9 0C 00    LDA #$000C              ;
$01/A151 9D 02 74    STA $7402,x[$00:7402]   ;
$01/A154 A9 00 FB    LDA #$FB00              ;
$01/A157 9D 22 72    STA $7222,x[$00:7222]   ;
$01/A15A A9 0A 00    LDA #$000A              ;
$01/A15D 9D 42 75    STA $7542,x[$00:7542]   ;
$01/A160 A9 20 00    LDA #$0020              ;
$01/A163 9D 42 70    STA $7042,x[$00:7042]   ;
$01/A166 A9 1E 00    LDA #$001E              ;
$01/A169 85 00       STA $00    [$00:0000]   ;
$01/A16B A8          TAY                     ;
$01/A16C B9 59 A0    LDA $A059,y[$00:A059]   ; table
$01/A16F 85 04       STA $04    [$00:0004]   ;
$01/A171 B9 79 A0    LDA $A079,y[$00:A079]   ; table
$01/A174 85 08       STA $08    [$00:0008]   ;
$01/A176 98          TYA                     ;
$01/A177 89 10 00    BIT #$0010              ;
$01/A17A D0 05       BNE $05    [$A181]      ;
$01/A17C B9 29 A0    LDA $A029,y[$00:A029]   ; table
$01/A17F 80 0B       BRA $0B    [$A18C]      ;

$01/A181 29 0E 00    AND #$000E              ;
$01/A184 A8          TAY                     ;
$01/A185 B9 29 A0    LDA $A029,y[$00:A029]   ; table
$01/A188 49 FF FF    EOR #$FFFF              ;
$01/A18B 1A          INC A                   ;
$01/A18C 85 02       STA $02    [$00:0002]   ;
$01/A18E B9 39 A0    LDA $A039,y[$00:A039]   ; table
$01/A191 85 06       STA $06    [$00:0006]   ;
$01/A193 B9 49 A0    LDA $A049,y[$00:A049]   ; table
$01/A196 85 0A       STA $0A    [$00:000A]   ;
$01/A198 A9 23 02    LDA #$0223              ;
$01/A19B 22 21 8B 00 JSL $008B21[$00:8B21]   ;
$01/A19F AD 84 10    LDA $1084  [$00:1084]   ;
$01/A1A2 18          CLC                     ;
$01/A1A3 65 02       ADC $02    [$00:0002]   ;
$01/A1A5 99 A2 70    STA $70A2,y[$00:70A2]   ;
$01/A1A8 AD 86 10    LDA $1086  [$00:1086]   ;
$01/A1AB 18          CLC                     ;
$01/A1AC 65 06       ADC $06    [$00:0006]   ;
$01/A1AE 99 42 71    STA $7142,y[$00:7142]   ;
$01/A1B1 A9 80 00    LDA #$0080              ;
$01/A1B4 99 82 77    STA $7782,y[$00:7782]   ;
$01/A1B7 A5 04       LDA $04    [$00:0004]   ;
$01/A1B9 99 E0 71    STA $71E0,y[$00:71E0]   ;
$01/A1BC A5 08       LDA $08    [$00:0008]   ;
$01/A1BE 99 E2 71    STA $71E2,y[$00:71E2]   ;
$01/A1C1 A9 04 00    LDA #$0004              ;
$01/A1C4 99 00 75    STA $7500,y[$00:7500]   ;
$01/A1C7 A5 0A       LDA $0A    [$00:000A]   ;
$01/A1C9 99 C2 73    STA $73C2,y[$00:73C2]   ;
$01/A1CC A5 00       LDA $00    [$00:0000]   ;
$01/A1CE 3A          DEC A                   ;
$01/A1CF 3A          DEC A                   ;
$01/A1D0 10 97       BPL $97    [$A169]      ;
$01/A1D2 A9 47 00    LDA #$0047              ;\ play sound #$0047
$01/A1D5 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/A1D9 F6 76       INC $76,x  [$00:0076]   ;
$01/A1DB 60          RTS                     ;

hookbill_dead_shell_break:
$01/A1DC BB          TYX                     ;
$01/A1DD BC 23 72    LDY $7223,x[$00:7223]   ;
$01/A1E0 30 43       BMI $43    [$A225]      ;
$01/A1E2 BD 42 70    LDA $7042,x[$00:7042]   ;
$01/A1E5 89 80 00    BIT #$0080              ;
$01/A1E8 D0 2D       BNE $2D    [$A217]      ;
$01/A1EA 09 80 00    ORA #$0080              ;
$01/A1ED 9D 42 70    STA $7042,x[$00:7042]   ;
$01/A1F0 A9 10 00    LDA #$0010              ;
$01/A1F3 9D 42 75    STA $7542,x[$00:7542]   ;
$01/A1F6 AD 94 60    LDA $6094  [$00:6094]   ;
$01/A1F9 18          CLC                     ;
$01/A1FA 69 80 00    ADC #$0080              ;
$01/A1FD 9D E2 70    STA $70E2,x[$00:70E2]   ;
$01/A200 AD 9C 60    LDA $609C  [$00:609C]   ;
$01/A203 38          SEC                     ;
$01/A204 E9 18 00    SBC #$0018              ;
$01/A207 9D 82 71    STA $7182,x[$00:7182]   ;
$01/A20A A9 00 04    LDA #$0400              ;
$01/A20D 9D 22 72    STA $7222,x[$00:7222]   ;
$01/A210 A9 82 00    LDA #$0082              ;\ play sound #$0082
$01/A213 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/A217 BC 83 76    LDY $7683,x[$00:7683]   ;
$01/A21A 88          DEY                     ;
$01/A21B 30 08       BMI $08    [$A225]      ;
$01/A21D A9 60 00    LDA #$0060              ;
$01/A220 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/A223 F6 76       INC $76,x  [$00:0076]   ;
$01/A225 60          RTS                     ;

hookbill_final:
$01/A226 BB          TYX                     ;
$01/A227 BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/A22A D0 F9       BNE $F9    [$A225]      ;
$01/A22C E2 20       SEP #$20                ;
$01/A22E A9 C0       LDA #$C0                ;
$01/A230 1C 4A 09    TRB $094A  [$00:094A]   ;
$01/A233 C2 20       REP #$20                ;
$01/A235 A0 02       LDY #$02                ;
$01/A237 8C 1C 01    STY $011C  [$00:011C]   ;
$01/A23A A9 11 00    LDA #$0011              ;
$01/A23D 8D 67 09    STA $0967  [$00:0967]   ;
$01/A240 9C CC 7E    STZ $7ECC  [$00:7ECC]   ;
$01/A243 68          PLA                     ;
$01/A244 5C 2E A3 03 JMP $03A32E[$03:A32E]   ;

.init_naval_closer
$01/A248 6B          RTL                     ;

; sub table
CODE_01A249:         dw $A32D
CODE_01A24B:         dw $A337
CODE_01A24D:         dw $A35D
CODE_01A24F:         dw $A39C
CODE_01A251:         dw $A3A9
CODE_01A253:         dw $A3E4
CODE_01A255:         dw $A494
CODE_01A257:         dw $A51F

; data table
CODE_01A259:         dw $0005
CODE_01A25B:         dw $FFFF
CODE_01A25D:         dw $01A0
CODE_01A25F:         dw $0760
CODE_01A261:         dw $0000
CODE_01A263:         dw $0000
CODE_01A265:         dw $0020
CODE_01A267:         dw $0000
CODE_01A269:         dw $0002
CODE_01A26B:         dw $FFFF
CODE_01A26D:         dw $00C0
CODE_01A26F:         dw $01A0
CODE_01A271:         dw $0001
CODE_01A273:         dw $0003
CODE_01A275:         dw $0001
CODE_01A277:         dw $01A0
CODE_01A279:         dw $7FFF
CODE_01A27B:         dw $0004
CODE_01A27D:         dw $0001
CODE_01A27F:         dw $0006
CODE_01A281:         dw $FFFF
CODE_01A283:         dw $02B0
CODE_01A285:         dw $07D0
CODE_01A287:         dw $0005
CODE_01A289:         dw $0002
CODE_01A28B:         dw $FFFF
CODE_01A28D:         dw $00C0
CODE_01A28F:         dw $02B0
CODE_01A291:         dw $0001
CODE_01A293:         dw $0003
CODE_01A295:         dw $0001
CODE_01A297:         dw $02B0
CODE_01A299:         dw $02F0
CODE_01A29B:         dw $0000
CODE_01A29D:         dw $0002
CODE_01A29F:         dw $0000
CODE_01A2A1:         dw $0001
CODE_01A2A3:         dw $FFFF
CODE_01A2A5:         dw $0080
CODE_01A2A7:         dw $0000
CODE_01A2A9:         dw $0020
CODE_01A2AB:         dw $0000
CODE_01A2AD:         dw $0007
CODE_01A2AF:         dw $FFFF
CODE_01A2B1:         dw $0000
CODE_01A2B3:         dw $0000
CODE_01A2B5:         dw $0001
CODE_01A2B7:         dw $0100
CODE_01A2B9:         dw $0000
CODE_01A2BB:         dw $0020
CODE_01A2BD:         dw $0000
CODE_01A2BF:         dw $0001
CODE_01A2C1:         dw $FFFF
CODE_01A2C3:         dw $0020
CODE_01A2C5:         dw $0004
CODE_01A2C7:         dw $0001
CODE_01A2C9:         dw $0020
CODE_01A2CB:         dw $00B0

; data table
CODE_01A2CD:         dw $0606
CODE_01A2CF:         dw $080A
CODE_01A2D1:         dw $0A04
CODE_01A2D3:         dw $060A

.main_naval_closer
$01/A2D5 22 23 AF 03 JSL $03AF23[$03:AF23]   ;
$01/A2D9 BD 96 7A    LDA $7A96,x             ;
$01/A2DC D0 46       BNE $46    [$A324]      ;
$01/A2DE 9C 7A 61    STZ $617A  [$00:617A]   ;
$01/A2E1 9C 7C 61    STZ $617C  [$00:617C]   ;
$01/A2E4 B5 18       LDA $18,x  [$00:0018]   ;
$01/A2E6 DD 02 79    CMP $7902,x[$00:7902]   ;
$01/A2E9 D0 0A       BNE $0A    [$A2F5]      ;
$01/A2EB A9 00 00    LDA #$0000              ;
$01/A2EE 8D AC 60    STA $60AC  [$00:60AC]   ;
$01/A2F1 5C 1E A3 03 JMP $03A31E[$03:A31E]   ;

$01/A2F5 C2 10       REP #$10                ;
$01/A2F7 B4 18       LDY $18,x  [$00:0018]   ;
$01/A2F9 B9 59 A2    LDA $A259,y[$00:A259]   ; table
$01/A2FC 95 76       STA $76,x  [$00:0076]   ;
$01/A2FE B9 5D A2    LDA $A25D,y[$00:A25D]   ; table
$01/A301 95 78       STA $78,x  [$00:0078]   ;
$01/A303 B9 5F A2    LDA $A25F,y[$00:A25F]   ; table
$01/A306 9D 36 7A    STA $7A36,x[$00:7A36]   ;
$01/A309 B9 61 A2    LDA $A261,y[$00:A261]   ; table
$01/A30C 9D 38 7A    STA $7A38,x[$00:7A38]   ;
$01/A30F B9 5B A2    LDA $A25B,y[$00:A25B]   ; table
$01/A312 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/A315 B4 76       LDY $76,x  [$00:0076]   ;
$01/A317 B9 CD A2    LDA $A2CD,y[$00:A2CD]   ; table
$01/A31A 29 FF 00    AND #$00FF              ;
$01/A31D 18          CLC                     ;
$01/A31E 75 18       ADC $18,x  [$00:0018]   ;
$01/A320 95 18       STA $18,x  [$00:0018]   ;
$01/A322 E2 10       SEP #$10                ;
$01/A324 9B          TXY                     ;
$01/A325 B5 76       LDA $76,x  [$00:0076]   ;
$01/A327 0A          ASL A                   ;
$01/A328 AA          TAX                     ;
$01/A329 FC 49 A2    JSR ($A249,x)[$00:0040] ; sub table
$01/A32C 6B          RTL                     ;

; ; ; $A249 table sub
$01/A32D BB          TYX                     ;
$01/A32E B5 78       LDA $78,x  [$00:0078]   ;
$01/A330 8D 7A 61    STA $617A  [$00:617A]   ;
$01/A333 8D 7C 61    STA $617C  [$00:617C]   ;
$01/A336 60          RTS                     ;

 ; ; ; $A249 table sub
$01/A337 BB          TYX                     ;
$01/A338 8C 1E 0C    STY $0C1E  [$00:0C1E]   ;
$01/A33B A9 02 00    LDA #$0002              ;
$01/A33E 8D AC 60    STA $60AC  [$00:60AC]   ;
$01/A341 AD B0 60    LDA $60B0  [$00:60B0]   ;
$01/A344 D5 78       CMP $78,x  [$00:0078]   ;
$01/A346 D0 04       BNE $04    [$A34C]      ;
$01/A348 9E 96 7A    STZ $7A96,x[$00:7A96]   ;
$01/A34B 60          RTS                     ;

$01/A34C 10 05       BPL $05    [$A353]      ;
$01/A34E CE 39 00    DEC $0039  [$00:0039]   ;
$01/A351 80 03       BRA $03    [$A356]      ;

$01/A353 EE 39 00    INC $0039  [$00:0039]   ;
$01/A356 AD 39 00    LDA $0039  [$00:0039]   ;
$01/A359 8D 23 0C    STA $0C23  [$00:0C23]   ;
$01/A35C 60          RTS                     ;

; ; ; $A249 table sub
$01/A35D BB          TYX                     ;
$01/A35E 8C 1E 0C    STY $0C1E  [$00:0C1E]   ;
$01/A361 BD 00 79    LDA $7900,x[$00:7900]   ;
$01/A364 18          CLC                     ;
$01/A365 75 78       ADC $78,x  [$00:0078]   ;
$01/A367 C9 00 01    CMP #$0100              ;
$01/A36A 30 26       BMI $26    [$A392]      ;
$01/A36C 38          SEC                     ;
$01/A36D E9 00 01    SBC #$0100              ;
$01/A370 48          PHA                     ;
$01/A371 AD 39 00    LDA $0039  [$00:0039]   ;
$01/A374 38          SEC                     ;
$01/A375 FD 36 7A    SBC $7A36,x[$00:7A36]   ;
$01/A378 5D 38 7A    EOR $7A38,x[$00:7A38]   ;
$01/A37B 30 08       BMI $08    [$A385]      ;
$01/A37D 68          PLA                     ;
$01/A37E 9E 96 7A    STZ $7A96,x[$00:7A96]   ;
$01/A381 9C 1E 0C    STZ $0C1E  [$00:0C1E]   ;
$01/A384 60          RTS                     ;

$01/A385 AD 39 00    LDA $0039  [$00:0039]   ;
$01/A388 18          CLC                     ;
$01/A389 7D 38 7A    ADC $7A38,x[$00:7A38]   ;
$01/A38C 8D 39 00    STA $0039  [$00:0039]   ;
$01/A38F 68          PLA                     ;
$01/A390 80 D5       BRA $D5    [$A367]      ;

$01/A392 9D 00 79    STA $7900,x[$00:7900]   ;
$01/A395 AD 39 00    LDA $0039  [$00:0039]   ;
$01/A398 8D 23 0C    STA $0C23  [$00:0C23]   ;
$01/A39B 60          RTS                     ;

; ; ; $A249 table sub
$01/A39C BB          TYX                     ;
$01/A39D B5 78       LDA $78,x  [$00:0078]   ;
$01/A39F 8D 18 7E    STA $7E18  [$00:7E18]   ;
$01/A3A2 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/A3A5 8D 1A 7E    STA $7E1A  [$00:7E1A]   ;
$01/A3A8 60          RTS                     ;

; ; ; $A249 table sub
$01/A3A9 BB          TYX                     ;
$01/A3AA EE 5A 10    INC $105A  [$00:105A]   ;
$01/A3AD 68          PLA                     ;
$01/A3AE 5C 1E A3 03 JMP $03A31E[$03:A31E]   ;

; data table
CODE_01A3B2:         dw $0020
CODE_01A3B4:         dw $0000
CODE_01A3B6:         dw $001F
CODE_01A3B8:         dw $0020
CODE_01A3BA:         dw $0020

; data table
CODE_01A3BC:         dw $015C
CODE_01A3BE:         dw $015A
CODE_01A3C0:         dw $015B
CODE_01A3C2:         dw $015C
CODE_01A3C4:         dw $015C

; data table
CODE_01A3C6:         dw $0000
CODE_01A3C8:         dw $0010
CODE_01A3CA:         dw $FFF0
CODE_01A3CC:         dw $0010
CODE_01A3CE:         dw $FFF0

; data table
CODE_01A3D0:         dw $0000
CODE_01A3D2:         dw $0000
CODE_01A3D4:         dw $0010
CODE_01A3D6:         dw $0000
CODE_01A3D8:         dw $0010

; data table
CODE_01A3DA:         dw $0001
CODE_01A3DC:         dw $0000
CODE_01A3DE:         dw $0001
CODE_01A3E0:         dw $0001
CODE_01A3E2:         dw $0001

; $A249 table sub
$01/A3E4 BB          TYX
$01/A3E5 BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/A3E8 D0 BE       BNE $BE    [$A3A8]      ;
$01/A3EA BC 38 7A    LDY $7A38,x[$00:7A38]   ;
$01/A3ED B9 B2 A3    LDA $A3B2,y[$00:A3B2]   ; table
$01/A3F0 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/A3F3 B9 DA A3    LDA $A3DA,y[$00:A3DA]   ; table
$01/A3F6 08          PHP                     ;
$01/A3F7 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/A3FA 8D 93 00    STA $0093  [$00:0093]   ;
$01/A3FD 18          CLC                     ;
$01/A3FE 79 D0 A3    ADC $A3D0,y[$00:A3D0]   ; table
$01/A401 9D 36 7A    STA $7A36,x[$00:7A36]   ;
$01/A404 B5 78       LDA $78,x  [$00:0078]   ;
$01/A406 8D 91 00    STA $0091  [$00:0091]   ;
$01/A409 18          CLC                     ;
$01/A40A 79 C6 A3    ADC $A3C6,y[$00:A3C6]   ; table
$01/A40D 95 78       STA $78,x  [$00:0078]   ;
$01/A40F B9 BC A3    LDA $A3BC,y[$00:A3BC]   ; table
$01/A412 8D 95 00    STA $0095  [$00:0095]   ;
$01/A415 A9 01 00    LDA #$0001              ;
$01/A418 8D 8F 00    STA $008F  [$00:008F]   ;
$01/A41B 22 95 92 10 JSL $109295[$10:9295]   ;
$01/A41F A6 12       LDX $12    [$00:0012]   ;
$01/A421 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/A424 C9 B0 07    CMP #$07B0              ;
$01/A427 D0 0A       BNE $0A    [$A433]      ;
$01/A429 B5 78       LDA $78,x  [$00:0078]   ;
$01/A42B C9 A0 01    CMP #$01A0              ;
$01/A42E D0 03       BNE $03    [$A433]      ;
$01/A430 9E 96 7A    STZ $7A96,x[$00:7A96]   ;
$01/A433 BD 38 7A    LDA $7A38,x[$00:7A38]   ;
$01/A436 1A          INC A                   ;
$01/A437 1A          INC A                   ;
$01/A438 C9 0A 00    CMP #$000A              ;
$01/A43B 30 03       BMI $03    [$A440]      ;
$01/A43D A9 00 00    LDA #$0000              ;
$01/A440 9D 38 7A    STA $7A38,x[$00:7A38]   ;
$01/A443 28          PLP                     ;
$01/A444 F0 31       BEQ $31    [$A477]      ;
$01/A446 A9 47 00    LDA #$0047              ;\ play sound #$0047
$01/A449 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/A44D A9 E6 01    LDA #$01E6              ;
$01/A450 22 21 8B 00 JSL $008B21[$00:8B21]   ;
$01/A454 AD 91 00    LDA $0091  [$00:0091]   ;
$01/A457 18          CLC                     ;
$01/A458 69 08 00    ADC #$0008              ;
$01/A45B 99 A2 70    STA $70A2,y[$00:70A2]   ;
$01/A45E AD 93 00    LDA $0093  [$00:0093]   ;
$01/A461 18          CLC                     ;
$01/A462 69 08 00    ADC #$0008              ;
$01/A465 99 42 71    STA $7142,y[$00:7142]   ;
$01/A468 A9 04 00    LDA #$0004              ;
$01/A46B 99 82 77    STA $7782,y[$00:7782]   ;
$01/A46E A9 06 00    LDA #$0006              ;
$01/A471 99 C2 73    STA $73C2,y[$00:73C2]   ;
$01/A474 99 4C 7E    STA $7E4C,y[$00:7E4C]   ;
$01/A477 60          RTS                     ;

; data (address?) table
CODE_01A478:         dw $7978
CODE_01A47A:         dw $7979
CODE_01A47C:         dw $797A
CODE_01A47E:         dw $797B
CODE_01A480:         dw $0000
CODE_01A482:         dw $793C
CODE_01A484:         dw $793D
CODE_01A486:         dw $793E
CODE_01A488:         dw $793F
CODE_01A48A:         dw $7940
CODE_01A48C:         dw $7942
CODE_01A48E:         dw $7943
CODE_01A490:         dw $0000
CODE_01A492:         dw $793C

; $A249 table sub
$01/A494 BB          TYX
$01/A495 BD F8 7A    LDA $7AF8,x[$00:7AF8]   ;
$01/A498 D0 DD       BNE $DD    [$A477]      ;
$01/A49A A9 20 00    LDA #$0020              ;
$01/A49D 9D F8 7A    STA $7AF8,x[$00:7AF8]   ;
$01/A4A0 A9 47 00    LDA #$0047              ;\ play sound #$0047
$01/A4A3 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/A4A7 B5 78       LDA $78,x  [$00:0078]   ;
$01/A4A9 8D 91 00    STA $0091  [$00:0091]   ;
$01/A4AC 85 04       STA $04    [$00:0004]   ;
$01/A4AE BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/A4B1 8D 93 00    STA $0093  [$00:0093]   ;
$01/A4B4 A9 01 00    LDA #$0001              ;
$01/A4B7 8D 8F 00    STA $008F  [$00:008F]   ;
$01/A4BA A9 06 00    LDA #$0006              ;
$01/A4BD 38          SEC                     ;
$01/A4BE FD 38 7A    SBC $7A38,x[$00:7A38]   ;
$01/A4C1 0A          ASL A                   ;
$01/A4C2 0A          ASL A                   ;
$01/A4C3 18          CLC                     ;
$01/A4C4 69 08 00    ADC #$0008              ;
$01/A4C7 85 00       STA $00    [$00:0000]   ;
$01/A4C9 85 02       STA $02    [$00:0002]   ;
$01/A4CB A5 02       LDA $02    [$00:0002]   ;
$01/A4CD 38          SEC                     ;
$01/A4CE E5 00       SBC $00    [$00:0000]   ;
$01/A4D0 A8          TAY                     ;
$01/A4D1 B9 78 A4    LDA $A478,y[$00:A478]   ; table
$01/A4D4 8D 95 00    STA $0095  [$00:0095]   ;
$01/A4D7 22 95 92 10 JSL $109295[$10:9295]   ;
$01/A4DB AD 91 00    LDA $0091  [$00:0091]   ;
$01/A4DE 18          CLC                     ;
$01/A4DF 69 10 00    ADC #$0010              ;
$01/A4E2 8D 91 00    STA $0091  [$00:0091]   ;
$01/A4E5 A5 00       LDA $00    [$00:0000]   ;
$01/A4E7 29 02 00    AND #$0002              ;
$01/A4EA F0 0F       BEQ $0F    [$A4FB]      ;
$01/A4EC A5 04       LDA $04    [$00:0004]   ;
$01/A4EE 8D 91 00    STA $0091  [$00:0091]   ;
$01/A4F1 AD 93 00    LDA $0093  [$00:0093]   ;
$01/A4F4 18          CLC                     ;
$01/A4F5 69 10 00    ADC #$0010              ;
$01/A4F8 8D 93 00    STA $0093  [$00:0093]   ;
$01/A4FB C6 00       DEC $00    [$00:0000]   ;
$01/A4FD C6 00       DEC $00    [$00:0000]   ;
$01/A4FF D0 CA       BNE $CA    [$A4CB]      ;
$01/A501 A6 12       LDX $12    [$00:0012]   ;
$01/A503 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/A506 38          SEC                     ;
$01/A507 E9 10 00    SBC #$0010              ;
$01/A50A 9D 36 7A    STA $7A36,x[$00:7A36]   ;
$01/A50D DE 38 7A    DEC $7A38,x[$00:7A38]   ;
$01/A510 D0 0C       BNE $0C    [$A51E]      ;
$01/A512 9C A8 60    STZ $60A8  [$00:60A8]   ;
$01/A515 9C B4 60    STZ $60B4  [$00:60B4]   ;
$01/A518 9E 96 7A    STZ $7A96,x[$00:7A96]   ;
$01/A51B EE 5A 10    INC $105A  [$00:105A]   ;
$01/A51E 60          RTS                     ;

; $A249 table sub
$01/A51F BB          TYX                     ;
$01/A520 BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/A523 D0 F9       BNE $F9    [$A51E]      ;
$01/A525 B5 78       LDA $78,x  [$00:0078]   ;
$01/A527 D0 18       BNE $18    [$A541]      ;
$01/A529 A9 03 00    LDA #$0003              ;
$01/A52C 9D 00 79    STA $7900,x[$00:7900]   ;
$01/A52F AD 39 00    LDA $0039  [$00:0039]   ;
$01/A532 29 E0 FF    AND #$FFE0              ;
$01/A535 95 78       STA $78,x  [$00:0078]   ;
$01/A537 AD 3B 00    LDA $003B  [$00:003B]   ;
$01/A53A 18          CLC                     ;
$01/A53B 69 B0 00    ADC #$00B0              ;
$01/A53E 9D 36 7A    STA $7A36,x[$00:7A36]   ;
$01/A541 B5 78       LDA $78,x  [$00:0078]   ;
$01/A543 8D 91 00    STA $0091  [$00:0091]   ;
$01/A546 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/A549 8D 93 00    STA $0093  [$00:0093]   ;
$01/A54C A9 01 00    LDA #$0001              ;
$01/A54F 8D 8F 00    STA $008F  [$00:008F]   ;
$01/A552 A9 00 00    LDA #$0000              ;
$01/A555 8D 95 00    STA $0095  [$00:0095]   ;
$01/A558 22 95 92 10 JSL $109295[$10:9295]   ;
$01/A55C AD 93 00    LDA $0093  [$00:0093]   ;
$01/A55F 18          CLC                     ;
$01/A560 69 10 00    ADC #$0010              ;
$01/A563 8D 93 00    STA $0093  [$00:0093]   ;
$01/A566 22 95 92 10 JSL $109295[$10:9295]   ;
$01/A56A AD 91 00    LDA $0091  [$00:0091]   ;
$01/A56D 18          CLC                     ;
$01/A56E 69 10 00    ADC #$0010              ;
$01/A571 8D 91 00    STA $0091  [$00:0091]   ;
$01/A574 22 95 92 10 JSL $109295[$10:9295]   ;
$01/A578 AD 93 00    LDA $0093  [$00:0093]   ;
$01/A57B 38          SEC                     ;
$01/A57C E9 10 00    SBC #$0010              ;
$01/A57F 8D 93 00    STA $0093  [$00:0093]   ;
$01/A582 22 95 92 10 JSL $109295[$10:9295]   ;
$01/A586 A6 12       LDX $12    [$00:0012]   ;
$01/A588 A9 0C 02    LDA #$020C              ;
$01/A58B 22 21 8B 00 JSL $008B21[$00:8B21]   ;
$01/A58F B5 78       LDA $78,x  [$00:0078]   ;
$01/A591 99 A2 70    STA $70A2,y[$00:70A2]   ;
$01/A594 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/A597 99 42 71    STA $7142,y[$00:7142]   ;
$01/A59A A9 02 00    LDA #$0002              ;
$01/A59D 99 82 77    STA $7782,y[$00:7782]   ;
$01/A5A0 A9 0D 00    LDA #$000D              ;
$01/A5A3 99 C2 73    STA $73C2,y[$00:73C2]   ;
$01/A5A6 A9 36 00    LDA #$0036              ;
$01/A5A9 99 02 70    STA $7002,y[$00:7002]   ;
$01/A5AC A9 47 00    LDA #$0047              ;\ play sound #$0047
$01/A5AF 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/A5B3 DE 00 79    DEC $7900,x[$00:7900]   ;
$01/A5B6 D0 04       BNE $04    [$A5BC]      ;
$01/A5B8 9E 96 7A    STZ $7A96,x[$00:7A96]   ;
$01/A5BB 60          RTS                     ;

$01/A5BC A9 10 00    LDA #$0010              ;
$01/A5BF 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/A5C2 0A          ASL A                   ;
$01/A5C3 18          CLC                     ;
$01/A5C4 75 78       ADC $78,x  [$00:0078]   ;
$01/A5C6 95 78       STA $78,x  [$00:0078]   ;
$01/A5C8 60          RTS                     ;

init_flan:
$01/A5C9 BD 00 79    LDA $7900,x[$00:7900]   ;
$01/A5CC DD 02 79    CMP $7902,x[$00:7902]   ;
$01/A5CF D0 0E       BNE $0E    [$A5DF]      ;
$01/A5D1 DE 00 79    DEC $7900,x[$00:7900]   ;
$01/A5D4 95 76       STA $76,x  [$00:0076]   ;
$01/A5D6 A9 02 00    LDA #$0002              ;
$01/A5D9 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/A5DC FE 02 74    INC $7402,x[$00:7402]   ;
$01/A5DF 6B          RTL                     ;

; flan pointer table
CODE_01A5E0:         dw $A830
CODE_01A5E2:         dw $A889
CODE_01A5E4:         dw $A8C0
CODE_01A5E6:         dw $A8F2
CODE_01A5E8:         dw $AA1F
CODE_01A5EA:         dw $AA6B

main_flan:
$01/A5EC 22 0B A6 01 JSL $01A60B[$01:A60B]   ;
$01/A5F0 20 40 A7    JSR $A740  [$00:A740]   ;
$01/A5F3 9B          TXY                     ;
$01/A5F4 B5 76       LDA $76,x  [$00:0076]   ;
$01/A5F6 0A          ASL A                   ;
$01/A5F7 AA          TAX                     ;
$01/A5F8 FC E0 A5    JSR ($A5E0,x)[$00:2018] ; flan table
$01/A5FB A9 20 06    LDA #$0620              ;
$01/A5FE B4 76       LDY $76,x  [$00:0076]   ;
$01/A600 C0 02       CPY #$02                ;
$01/A602 30 03       BMI $03    [$A607]      ;
$01/A604 A9 60 06    LDA #$0660              ;
$01/A607 9D A0 6F    STA $6FA0,x[$00:6FA0]   ;
$01/A60A 6B          RTL                     ;

; flan l sub
$01/A60B AD B0 61    LDA $61B0  [$00:61B0]   ;
$01/A60E 0D 55 0B    ORA $0B55  [$00:0B55]   ;
$01/A611 0D 98 03    ORA $0398  [$00:0398]   ;
$01/A614 F0 03       BEQ $03    [$A619]      ;
$01/A616 7A          PLY                     ;   \
$01/A617 68          PLA                     ;    | skips the RTL
$01/A618 6B          RTL                     ; /  and goes back one long in stack

$01/A619 BD A2 6F    LDA $6FA2,x[$00:6FA2]   ;
$01/A61C 29 E1 FF    AND #$FFE1              ;
$01/A61F BC 38 7D    LDY $7D38,x[$00:7D38]   ;
$01/A622 D0 09       BNE $09    [$A62D]      ;
$01/A624 09 08 00    ORA #$0008              ;
$01/A627 9D A2 6F    STA $6FA2,x[$00:6FA2]   ;
$01/A62A 4C 15 A7    JMP $A715  [$00:A715]   ;

$01/A62D 9D A2 6F    STA $6FA2,x[$00:6FA2]   ;
$01/A630 64 0E       STZ $0E    [$00:000E]   ;
$01/A632 8A          TXA                     ;
$01/A633 8D 02 30    STA $3002  [$00:3002]   ;
$01/A636 A2 09       LDX #$09                ;
$01/A638 A9 11 90    LDA #$9011              ;
$01/A63B 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/A63F A6 12       LDX $12    [$00:0012]   ;
$01/A641 AC 1C 30    LDY $301C  [$00:301C]   ;
$01/A644 30 5A       BMI $5A    [$A6A0]      ;
$01/A646 F0 58       BEQ $58    [$A6A0]      ;
$01/A648 B9 00 6F    LDA $6F00,y[$00:6F00]   ;
$01/A64B C9 10 00    CMP #$0010              ;
$01/A64E D0 69       BNE $69    [$A6B9]      ;
$01/A650 B9 A2 6F    LDA $6FA2,y[$00:6FA2]   ;
$01/A653 29 00 08    AND #$0800              ;
$01/A656 F0 48       BEQ $48    [$A6A0]      ;
$01/A658 B9 60 73    LDA $7360,y[$00:7360]   ;
$01/A65B C9 09 01    CMP #$0109              ;
$01/A65E F0 40       BEQ $40    [$A6A0]      ;
$01/A660 C9 0A 01    CMP #$010A              ;
$01/A663 F0 3B       BEQ $3B    [$A6A0]      ;
$01/A665 C9 0B 01    CMP #$010B              ;
$01/A668 F0 36       BEQ $36    [$A6A0]      ;
$01/A66A 5A          PHY                     ;
$01/A66B BB          TYX                     ;
$01/A66C 22 4B B2 03 JSL $03B24B[$03:B24B]   ;
$01/A670 7A          PLY                     ;
$01/A671 A9 00 00    LDA #$0000              ;
$01/A674 99 40 75    STA $7540,y[$00:7540]   ;
$01/A677 A9 00 FE    LDA #$FE00              ;
$01/A67A 99 22 72    STA $7222,y[$00:7222]   ;
$01/A67D E6 0E       INC $0E    [$00:000E]   ;
$01/A67F A6 12       LDX $12    [$00:0012]   ;
$01/A681 A9 40 00    LDA #$0040              ;
$01/A684 99 42 75    STA $7542,y[$00:7542]   ;
$01/A687 BD 20 72    LDA $7220,x[$00:7220]   ;
$01/A68A C9 00 80    CMP #$8000              ;
$01/A68D 6A          ROR A                   ;
$01/A68E 99 20 72    STA $7220,y[$00:7220]   ;
$01/A691 22 3D B5 03 JSL $03B53D[$03:B53D]   ;
$01/A695 A2 09       LDX #$09                ;
$01/A697 AD 1E 30    LDA $301E  [$00:301E]   ;
$01/A69A 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; gsu (continue from previous?)
$01/A69E 80 9F       BRA $9F    [$A63F]      ;

$01/A6A0 A4 0E       LDY $0E    [$00:000E]   ;
$01/A6A2 F0 15       BEQ $15    [$A6B9]      ;
$01/A6A4 9B          TXY                     ;
$01/A6A5 BD 60 73    LDA $7360,x[$00:7360]   ;
$01/A6A8 22 77 A3 03 JSL $03A377[$03:A377]   ;
$01/A6AC A9 6C 9A    LDA #$9A6C              ;
$01/A6AF 85 00       STA $00    [$00:0000]   ;
$01/A6B1 A9 03 00    LDA #$0003              ;
$01/A6B4 85 02       STA $02    [$00:0002]   ;
$01/A6B6 DC 60 79    JML [$7960][$06:CF1A]   ;

$01/A6B9 BD 60 78    LDA $7860,x[$00:7860]   ;
$01/A6BC 29 0C 00    AND #$000C              ;
$01/A6BF F0 08       BEQ $08    [$A6C9]      ;
$01/A6C1 FE 00 79    INC $7900,x[$00:7900]   ;
$01/A6C4 FE 02 79    INC $7902,x[$00:7902]   ;
$01/A6C7 80 DB       BRA $DB    [$A6A4]      ;

$01/A6C9 BD 60 78    LDA $7860,x[$00:7860]   ;
$01/A6CC 29 01 00    AND #$0001              ;
$01/A6CF F0 26       BEQ $26    [$A6F7]      ;
$01/A6D1 22 90 A5 03 JSL $03A590[$03:A590]   ;
$01/A6D5 B5 18       LDA $18,x  [$00:0018]   ;
$01/A6D7 C9 02 00    CMP #$0002              ;
$01/A6DA 90 0D       BCC $0D    [$A6E9]      ;
$01/A6DC BD 20 72    LDA $7220,x[$00:7220]   ;
$01/A6DF D0 0A       BNE $0A    [$A6EB]      ;
$01/A6E1 BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/A6E4 F0 BE       BEQ $BE    [$A6A4]      ;
$01/A6E6 7A          PLY                     ;\
$01/A6E7 68          PLA                     ; | skips the RTL
$01/A6E8 6B          RTL                     ;/  and goes back one long in stack

$01/A6E9 F6 18       INC $18,x  [$00:0018]   ;
$01/A6EB A9 80 FD    LDA #$FD80              ;
$01/A6EE 9D 22 72    STA $7222,x[$00:7222]   ;
$01/A6F1 A9 40 00    LDA #$0040              ;
$01/A6F4 9D 42 75    STA $7542,x[$00:7542]   ;
$01/A6F7 BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/A6FA 29 03 00    AND #$0003              ;
$01/A6FD D0 13       BNE $13    [$A712]      ;
$01/A6FF A9 04 00    LDA #$0004              ;
$01/A702 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/A705 BD 02 74    LDA $7402,x[$00:7402]   ;
$01/A708 1A          INC A                   ;
$01/A709 29 03 00    AND #$0003              ;
$01/A70C 09 04 00    ORA #$0004              ;
$01/A70F 9D 02 74    STA $7402,x[$00:7402]   ;
$01/A712 7A          PLY                     ;\
$01/A713 68          PLA                     ; | skips the RTL
$01/A714 6B          RTL                     ;/  and goes back one long in stack

$01/A715 BD 00 6F    LDA $6F00,x[$00:6F00]   ;
$01/A718 C9 10 00    CMP #$0010              ;
$01/A71B F0 F7       BEQ $F7    [$A714]      ;
$01/A71D C9 08 00    CMP #$0008              ;
$01/A720 D0 1B       BNE $1B    [$A73D]      ;
$01/A722 BC A2 74    LDY $74A2,x[$00:74A2]   ;
$01/A725 10 16       BPL $16    [$A73D]      ;
$01/A727 BD A2 6F    LDA $6FA2,x[$00:6FA2]   ;
$01/A72A 29 FF FC    AND #$FCFF              ;
$01/A72D 9D A2 6F    STA $6FA2,x[$00:6FA2]   ;
$01/A730 A9 02 00    LDA #$0002              ;
$01/A733 9D 00 79    STA $7900,x[$00:7900]   ;
$01/A736 9D 02 79    STA $7902,x[$00:7902]   ;
$01/A739 0A          ASL A                   ;
$01/A73A 9D 02 74    STA $7402,x[$00:7402]   ;
$01/A73D 7A          PLY                     ;
$01/A73E 68          PLA                     ;
$01/A73F 6B          RTL                     ;

; flan s sub
$01/A740 BC 02 74    LDY $7402,x[$00:7402]   ;
$01/A743 C0 04       CPY #$04                ;
$01/A745 10 59       BPL $59    [$A7A0]      ;
$01/A747 BC 36 7D    LDY $7D36,x[$00:7D36]   ;
$01/A74A 10 55       BPL $55    [$A7A1]      ;
$01/A74C B4 76       LDY $76,x  [$00:0076]   ;
$01/A74E C0 03       CPY #$03                ;
$01/A750 10 4E       BPL $4E    [$A7A0]      ;
$01/A752 BD 18 7C    LDA $7C18,x[$00:7C18]   ;
$01/A755 38          SEC                     ;
$01/A756 ED 22 61    SBC $6122  [$00:6122]   ;
$01/A759 38          SEC                     ;
$01/A75A FD B8 7B    SBC $7BB8,x[$00:7BB8]   ;
$01/A75D C9 F8 FF    CMP #$FFF8              ;
$01/A760 90 3A       BCC $3A    [$A79C]      ;
$01/A762 AC C0 60    LDY $60C0  [$00:60C0]   ;
$01/A765 F0 39       BEQ $39    [$A7A0]      ;
$01/A767 AC AB 60    LDY $60AB  [$00:60AB]   ;
$01/A76A 30 34       BMI $34    [$A7A0]      ;
$01/A76C 9C A8 60    STZ $60A8  [$00:60A8]   ;
$01/A76F 9C B4 60    STZ $60B4  [$00:60B4]   ;
$01/A772 9C AA 60    STZ $60AA  [$00:60AA]   ;
$01/A775 9C D4 60    STZ $60D4  [$00:60D4]   ;
$01/A778 EE B4 61    INC $61B4  [$00:61B4]   ;
$01/A77B BD 82 71    LDA $7182,x[$00:7182]   ;
$01/A77E 18          CLC                     ;
$01/A77F 69 E8 FF    ADC #$FFE8              ;
$01/A782 8D 90 60    STA $6090  [$00:6090]   ;
$01/A785 FE 36 7A    INC $7A36,x[$00:7A36]   ;
$01/A788 74 16       STZ $16,x  [$00:0016]   ;
$01/A78A 9E 20 72    STZ $7220,x[$00:7220]   ;
$01/A78D 9E 98 7A    STZ $7A98,x[$00:7A98]   ;
$01/A790 A0 03       LDY #$03                ;
$01/A792 94 76       STY $76,x  [$00:0076]   ;
$01/A794 A9 5F 00    LDA #$005F              ;\ play sound #$005F
$01/A797 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/A79B 60          RTS                     ;

$01/A79C 22 58 A8 03 JSL $03A858[$03:A858]   ;
$01/A7A0 60          RTS                     ;

$01/A7A1 F0 FD       BEQ $FD    [$A7A0]      ;
$01/A7A3 BD F6 7A    LDA $7AF6,x[$00:7AF6]   ;
$01/A7A6 D0 F8       BNE $F8    [$A7A0]      ;
$01/A7A8 B9 37 7D    LDA $7D37,y[$00:7D37]   ;
$01/A7AB F0 F3       BEQ $F3    [$A7A0]      ;
$01/A7AD B9 41 75    LDA $7541,y[$00:7541]   ;
$01/A7B0 C9 40 00    CMP #$0040              ;
$01/A7B3 30 D3       BMI $D3    [$A788]      ;
$01/A7B5 B5 76       LDA $76,x  [$00:0076]   ;
$01/A7B7 C9 01 00    CMP #$0001              ;
$01/A7BA F0 1E       BEQ $1E    [$A7DA]      ;
$01/A7BC C9 03 00    CMP #$0003              ;
$01/A7BF F0 19       BEQ $19    [$A7DA]      ;
$01/A7C1 A9 01 00    LDA #$0001              ;
$01/A7C4 95 76       STA $76,x  [$00:0076]   ;
$01/A7C6 9E 02 74    STZ $7402,x[$00:7402]   ;
$01/A7C9 74 16       STZ $16,x  [$00:0016]   ;
$01/A7CB A9 03 00    LDA #$0003              ;
$01/A7CE 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/A7D1 5A          PHY                     ;
$01/A7D2 A9 13 00    LDA #$0013              ;\ play sound #$0013
$01/A7D5 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/A7D9 7A          PLY                     ;
$01/A7DA A9 40 00    LDA #$0040              ;
$01/A7DD 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/A7E0 A9 00 FE    LDA #$FE00              ;
$01/A7E3 99 21 72    STA $7221,y[$00:7221]   ;
$01/A7E6 B9 1F 72    LDA $721F,y[$00:721F]   ;
$01/A7E9 18          CLC                     ;
$01/A7EA 69 80 00    ADC #$0080              ;
$01/A7ED C9 00 01    CMP #$0100              ;
$01/A7F0 B0 20       BCS $20    [$A812]      ;
$01/A7F2 A9 10 00    LDA #$0010              ;
$01/A7F5 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/A7F8 0A          ASL A                   ;
$01/A7F9 9D F6 7A    STA $7AF6,x[$00:7AF6]   ;
$01/A7FC A9 00 FC    LDA #$FC00              ;
$01/A7FF 99 21 72    STA $7221,y[$00:7221]   ;
$01/A802 BD 00 74    LDA $7400,x[$00:7400]   ;
$01/A805 3A          DEC A                   ;
$01/A806 08          PHP                     ;
$01/A807 A9 00 FE    LDA #$FE00              ;
$01/A80A 28          PLP                     ;
$01/A80B 10 0C       BPL $0C    [$A819]      ;
$01/A80D A9 00 02    LDA #$0200              ;
$01/A810 80 07       BRA $07    [$A819]      ;

$01/A812 B9 1F 72    LDA $721F,y[$00:721F]   ;
$01/A815 49 FF FF    EOR #$FFFF              ;
$01/A818 1A          INC A                   ;
$01/A819 99 1F 72    STA $721F,y[$00:721F]   ;
$01/A81C 9E 20 72    STZ $7220,x[$00:7220]   ;
$01/A81F 60          RTS                     ;

; data table
CODE_01A820:         dw $FFC0
CODE_01A822:         dw $0040

; data table
CODE_01A824:         db $00
CODE_01A825:         db $01
CODE_01A826:         db $02
CODE_01A827:         db $03
CODE_01A828:         db $02
CODE_01A829:         db $01

; data table
CODE_01A82A:         db $08
CODE_01A82B:         db $06
CODE_01A82C:         db $06
CODE_01A82D:         db $08
CODE_01A82E:         db $06
CODE_01A82F:         db $06

; flan table sub
$01/A830 BB          TYX                     ;
$01/A831 BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/A834 D0 2C       BNE $2C    [$A862]      ;
$01/A836 BC 00 74    LDY $7400,x[$00:7400]   ;
$01/A839 B9 20 A8    LDA $A820,y[$00:A820]   ; table
$01/A83C 9D 20 72    STA $7220,x[$00:7220]   ;
$01/A83F BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/A842 D0 1E       BNE $1E    [$A862]      ;
$01/A844 F6 16       INC $16,x  [$00:0016]   ;
$01/A846 B4 16       LDY $16,x  [$00:0016]   ;
$01/A848 C0 06       CPY #$06                ;
$01/A84A 30 04       BMI $04    [$A850]      ;
$01/A84C 74 16       STZ $16,x  [$00:0016]   ;
$01/A84E A0 00       LDY #$00                ;
$01/A850 B9 24 A8    LDA $A824,y[$00:A824]   ; table
$01/A853 29 FF 00    AND #$00FF              ;
$01/A856 9D 02 74    STA $7402,x[$00:7402]   ;
$01/A859 B9 2A A8    LDA $A82A,y[$00:A82A]   ; table
$01/A85C 29 FF 00    AND #$00FF              ;
$01/A85F 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/A862 60          RTS                     ;

; data table (starts from $A862 in code)
CODE_01A863:         db $01
CODE_01A864:         db $02
CODE_01A865:         db $03
CODE_01A866:         db $02
CODE_01A867:         db $01
CODE_01A868:         db $00
CODE_01A869:         db $01
CODE_01A86A:         db $02
CODE_01A86B:         db $03
CODE_01A86C:         db $02
CODE_01A86D:         db $01
CODE_01A86E:         db $02
CODE_01A86F:         db $03
CODE_01A870:         db $02
CODE_01A871:         db $01
CODE_01A872:         db $02
CODE_01A873:         db $03
CODE_01A874:         db $02
CODE_01A875:         db $01

; data table (starts from $A875 in code)
CODE_01A876:         db $03
CODE_01A877:         db $03
CODE_01A878:         db $03
CODE_01A879:         db $03
CODE_01A87A:         db $03
CODE_01A87B:         db $03
CODE_01A87C:         db $03
CODE_01A87D:         db $03
CODE_01A87E:         db $04
CODE_01A87F:         db $04
CODE_01A880:         db $04
CODE_01A881:         db $04
CODE_01A882:         db $04
CODE_01A883:         db $06
CODE_01A884:         db $06
CODE_01A885:         db $06
CODE_01A886:         db $10
CODE_01A887:         db $06
CODE_01A888:         db $06

; flan table sub
$01/A889 BB          TYX                     ;
$01/A88A BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/A88D D0 28       BNE $28    [$A8B7]      ;
$01/A88F F6 16       INC $16,x  [$00:0016]   ;
$01/A891 B4 16       LDY $16,x  [$00:0016]   ;
$01/A893 C0 14       CPY #$14                ;
$01/A895 30 0E       BMI $0E    [$A8A5]      ;
$01/A897 9E 02 74    STZ $7402,x[$00:7402]   ;
$01/A89A 74 16       STZ $16,x  [$00:0016]   ;
$01/A89C A9 08 00    LDA #$0008              ;
$01/A89F 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/A8A2 74 76       STZ $76,x  [$00:0076]   ;
$01/A8A4 60          RTS                     ;

$01/A8A5 B9 62 A8    LDA $A862,y[$00:A862]   ; table
$01/A8A8 29 FF 00    AND #$00FF              ;
$01/A8AB 9D 02 74    STA $7402,x[$00:7402]   ;
$01/A8AE B9 75 A8    LDA $A875,y[$00:A875]   ; table
$01/A8B1 29 FF 00    AND #$00FF              ;
$01/A8B4 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/A8B7 60          RTS                     ;

; data table (starts from $A8B7 in code)
CODE_01A8B8:         db $02, $03
CODE_01A8BA:         db $02, $01

; data table (starts from $A8BB in code)
CODE_01A8BC:         db $02, $10
CODE_01A8BE:         db $06, $06

; flan table sub
$01/A8C0 BB          TYX                     ;
$01/A8C1 BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/A8C4 D0 1A       BNE $1A    [$A8E0]      ;
$01/A8C6 F6 16       INC $16,x  [$00:0016]   ;
$01/A8C8 B4 16       LDY $16,x  [$00:0016]   ;
$01/A8CA C0 05       CPY #$05                ;
$01/A8CC 10 C9       BPL $C9    [$A897]      ;
$01/A8CE B9 B7 A8    LDA $A8B7,y[$00:A8B7]   ; table
$01/A8D1 29 FF 00    AND #$00FF              ;
$01/A8D4 9D 02 74    STA $7402,x[$00:7402]   ;
$01/A8D7 B9 BB A8    LDA $A8BB,y[$00:A8BB]   ; table
$01/A8DA 29 FF 00    AND #$00FF              ;
$01/A8DD 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/A8E0 60          RTS                     ;

; data table (starts from $A8E0 in code)
CODE_01A8E1:         db $0C
CODE_01A8E2:         db $0B
CODE_01A8E3:         db $08
CODE_01A8E4:         db $09
CODE_01A8E5:         db $0A
CODE_01A8E6:         db $09
CODE_01A8E7:         db $08

; data table (starts from $A8E7 in code)
CODE_01A8E8:         db $04
CODE_01A8E9:         db $02
CODE_01A8EA:         db $04
CODE_01A8EB:         db $04
CODE_01A8EC:         db $04
CODE_01A8ED:         db $04
CODE_01A8EE:         db $60

; data table
CODE_01A8EF:         db $08
CODE_01A8F0:         db $0A
CODE_01A8F1:         db $0C

; flan table sub
$01/A8F2 BB          TYX                     ;
$01/A8F3 BD 98 7A    LDA $7A98,x
$01/A8F6 F0 03       BEQ $03    [$A8FB]      ;
$01/A8F8 4C F2 A9    JMP $A9F2  [$00:A9F2]   ;

$01/A8FB F6 16       INC $16,x  [$00:0016]   ;
$01/A8FD B4 16       LDY $16,x  [$00:0016]   ;
$01/A8FF C0 03       CPY #$03                ;
$01/A901 F0 03       BEQ $03    [$A906]      ;
$01/A903 4C C8 A9    JMP $A9C8  [$00:A9C8]   ;

$01/A906 A9 F4 01    LDA #$01F4              ;
$01/A909 22 21 8B 00 JSL $008B21[$00:8B21]   ;
$01/A90D A9 08 00    LDA #$0008              ;
$01/A910 99 C2 73    STA $73C2,y[$00:73C2]   ;
$01/A913 18          CLC                     ;
$01/A914 7D E2 70    ADC $70E2,x[$00:70E2]   ;
$01/A917 99 A2 70    STA $70A2,y[$00:70A2]   ;
$01/A91A BD 82 71    LDA $7182,x[$00:7182]   ;
$01/A91D 18          CLC                     ;
$01/A91E 69 04 00    ADC #$0004              ;
$01/A921 99 42 71    STA $7142,y[$00:7142]   ;
$01/A924 A9 02 00    LDA #$0002              ;
$01/A927 99 82 77    STA $7782,y[$00:7782]   ;
$01/A92A A5 10       LDA $10    [$00:0010]   ;
$01/A92C 85 06       STA $06    [$00:0006]   ;
$01/A92E EB          XBA                     ;
$01/A92F 85 08       STA $08    [$00:0008]   ;
$01/A931 BD E2 70    LDA $70E2,x[$00:70E2]   ;
$01/A934 85 0A       STA $0A    [$00:000A]   ;
$01/A936 BD 82 71    LDA $7182,x[$00:7182]   ;
$01/A939 85 0C       STA $0C    [$00:000C]   ;
$01/A93B A0 03       LDY #$03                ;
$01/A93D 5A          PHY                     ;
$01/A93E A9 12 01    LDA #$0112              ;
$01/A941 22 64 A3 03 JSL $03A364[$03:A364]   ;
$01/A945 90 7C       BCC $7C    [$A9C3]      ;
$01/A947 A5 06       LDA $06    [$00:0006]   ;
$01/A949 29 3F 00    AND #$003F              ;
$01/A94C 38          SEC                     ;
$01/A94D E9 1C 00    SBC #$001C              ;
$01/A950 85 04       STA $04    [$00:0004]   ;
$01/A952 18          CLC                     ;
$01/A953 65 0A       ADC $0A    [$00:000A]   ;
$01/A955 99 E2 70    STA $70E2,y[$00:70E2]   ;
$01/A958 18          CLC                     ;
$01/A959 69 08 00    ADC #$0008              ;
$01/A95C 8D 10 30    STA $3010  [$00:3010]   ;
$01/A95F A5 08       LDA $08    [$00:0008]   ;
$01/A961 29 1F 00    AND #$001F              ;
$01/A964 49 FF FF    EOR #$FFFF              ;
$01/A967 38          SEC                     ;
$01/A968 E9 03 00    SBC #$0003              ;
$01/A96B 85 02       STA $02    [$00:0002]   ;
$01/A96D 18          CLC                     ;
$01/A96E 65 0C       ADC $0C    [$00:000C]   ;
$01/A970 99 82 71    STA $7182,y[$00:7182]   ;
$01/A973 18          CLC                     ;
$01/A974 69 08 00    ADC #$0008              ;
$01/A977 8D 00 30    STA $3000  [$00:3000]   ;
$01/A97A 5A          PHY                     ;
$01/A97B A2 0A       LDX #$0A                ;
$01/A97D A9 2F CE    LDA #$CE2F              ;
$01/A980 22 91 DE 7E JSL $7EDE91[$7E:DE91]   ; GSU init
$01/A984 A6 12       LDX $12    [$00:0012]   ;
$01/A986 7A          PLY                     ;
$01/A987 AD 0C 30    LDA $300C  [$00:300C]   ;
$01/A98A C9 00 00    CMP #$0000              ;
$01/A98D D0 09       BNE $09    [$A998]      ;
$01/A98F BB          TYX                     ;
$01/A990 22 1E A3 03 JSL $03A31E[$03:A31E]   ;
$01/A994 A6 12       LDX $12    [$00:0012]   ;
$01/A996 80 0D       BRA $0D    [$A9A5]      ;

$01/A998 A5 06       LDA $06    [$00:0006]   ;
$01/A99A EB          XBA                     ;
$01/A99B 29 1F 00    AND #$001F              ;
$01/A99E 18          CLC                     ;
$01/A99F 69 50 00    ADC #$0050              ;
$01/A9A2 99 96 7A    STA $7A96,y[$00:7A96]   ;
$01/A9A5 A5 06       LDA $06    [$00:0006]   ;
$01/A9A7 49 FF FF    EOR #$FFFF              ;
$01/A9AA 6A          ROR A                   ;
$01/A9AB 6A          ROR A                   ;
$01/A9AC 6A          ROR A                   ;
$01/A9AD 6A          ROR A                   ;
$01/A9AE 1A          INC A                   ;
$01/A9AF 85 06       STA $06    [$00:0006]   ;
$01/A9B1 A5 08       LDA $08    [$00:0008]   ;
$01/A9B3 6A          ROR A                   ;
$01/A9B4 6A          ROR A                   ;
$01/A9B5 6A          ROR A                   ;
$01/A9B6 49 FF FF    EOR #$FFFF              ;
$01/A9B9 3A          DEC A                   ;
$01/A9BA 85 08       STA $08    [$00:0008]   ;
$01/A9BC 7A          PLY                     ;
$01/A9BD 88          DEY                     ;
$01/A9BE F0 04       BEQ $04    [$A9C4]      ;
$01/A9C0 4C 3D A9    JMP $A93D  [$00:A93D]   ;

$01/A9C3 7A          PLY                     ;
$01/A9C4 B4 16       LDY $16,x  [$00:0016]   ;
$01/A9C6 80 18       BRA $18    [$A9E0]      ;

$01/A9C8 C0 08       CPY #$08                ;
$01/A9CA 30 14       BMI $14    [$A9E0]      ;
$01/A9CC A9 09 00    LDA #$0009              ;
$01/A9CF 9D 02 74    STA $7402,x[$00:7402]   ;
$01/A9D2 A9 04 00    LDA #$0004              ;
$01/A9D5 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/A9D8 1A          INC A                   ;
$01/A9D9 95 78       STA $78,x  [$00:0078]   ;
$01/A9DB 74 16       STZ $16,x  [$00:0016]   ;
$01/A9DD F6 76       INC $76,x  [$00:0076]   ;
$01/A9DF 60          RTS                     ;

$01/A9E0 B9 E0 A8    LDA $A8E0,y[$00:A8E0]   ; table
$01/A9E3 29 FF 00    AND #$00FF              ;
$01/A9E6 9D 02 74    STA $7402,x[$00:7402]   ;
$01/A9E9 B9 E7 A8    LDA $A8E7,y[$00:A8E7]   ; table
$01/A9EC 29 FF 00    AND #$00FF              ;
$01/A9EF 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/A9F2 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/A9F5 F0 23       BEQ $23    [$AA1A]      ;
$01/A9F7 B4 16       LDY $16,x  [$00:0016]   ;
$01/A9F9 C0 03       CPY #$03                ;
$01/A9FB 10 1D       BPL $1D    [$AA1A]      ;
$01/A9FD B9 EF A8    LDA $A8EF,y[$00:A8EF]   ; table
$01/AA00 29 FF 00    AND #$00FF              ;
$01/AA03 38          SEC                     ;
$01/AA04 E9 20 00    SBC #$0020              ;
$01/AA07 18          CLC                     ;
$01/AA08 7D 82 71    ADC $7182,x[$00:7182]   ;
$01/AA0B 8D 90 60    STA $6090  [$00:6090]   ;
$01/AA0E 9C A8 60    STZ $60A8  [$00:60A8]   ;
$01/AA11 9C B4 60    STZ $60B4  [$00:60B4]   ;
$01/AA14 9C AA 60    STZ $60AA  [$00:60AA]   ;
$01/AA17 EE B4 61    INC $61B4  [$00:61B4]   ;
$01/AA1A 60          RTS                     ;

; data table
CODE_01AA1B:         db $09, $0A, $09, $08

; flan table sub
$01/AA1F BB          TYX                     ;
$01/AA20 BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/AA23 D0 37       BNE $37    [$AA5C]      ;
$01/AA25 F6 16       INC $16,x  [$00:0016]   ;
$01/AA27 B4 16       LDY $16,x  [$00:0016]   ;
$01/AA29 C0 04       CPY #$04                ;
$01/AA2B 30 20       BMI $20    [$AA4D]      ;
$01/AA2D A9 03 00    LDA #$0003              ;\ play sound #$0003
$01/AA30 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/AA34 74 16       STZ $16,x  [$00:0016]   ;
$01/AA36 A0 00       LDY #$00                ;
$01/AA38 D6 78       DEC $78,x  [$00:0078]   ;
$01/AA3A D0 11       BNE $11    [$AA4D]      ;
$01/AA3C A9 0B 00    LDA #$000B              ;
$01/AA3F 9D 02 74    STA $7402,x[$00:7402]   ;
$01/AA42 A9 03 00    LDA #$0003              ;
$01/AA45 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/AA48 95 16       STA $16,x  [$00:0016]   ;
$01/AA4A F6 76       INC $76,x  [$00:0076]   ;
$01/AA4C 60          RTS                     ;

$01/AA4D B9 1B AA    LDA $AA1B,y[$00:AA1B]   ; table
$01/AA50 29 FF 00    AND #$00FF              ;
$01/AA53 9D 02 74    STA $7402,x[$00:7402]   ;
$01/AA56 A9 04 00    LDA #$0004              ;
$01/AA59 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/AA5C 60          RTS                     ;

; data table (starts from $AA5C in code)
CODE_01AA5D:         db $0C, $00, $0D, $0E
CODE_01AA61:         db $0F, $10, $0F, $0E
CODE_01AA65:         db $0D, $00, $02, $03
CODE_01AA69:         db $02, $01

; flan table sub
$01/AA6B BB          TYX                     ;
$01/AA6C BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/AA6F D0 2B       BNE $2B    [$AA9C]      ;
$01/AA71 F6 16       INC $16,x  [$00:0016]   ;
$01/AA73 B4 16       LDY $16,x  [$00:0016]   ;
$01/AA75 C0 0F       CPY #$0F                ;
$01/AA77 30 14       BMI $14    [$AA8D]      ;
$01/AA79 9E 02 74    STZ $7402,x[$00:7402]   ;
$01/AA7C 74 16       STZ $16,x  [$00:0016]   ;
$01/AA7E A9 40 00    LDA #$0040              ;
$01/AA81 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/AA84 A9 43 00    LDA #$0043              ;
$01/AA87 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/AA8A 74 76       STZ $76,x  [$00:0076]   ;
$01/AA8C 60          RTS                     ;

$01/AA8D B9 5C AA    LDA $AA5C,y[$00:AA5C]   ; table
$01/AA90 29 FF 00    AND #$00FF              ;
$01/AA93 9D 02 74    STA $7402,x[$00:7402]   ;
$01/AA96 A9 03 00    LDA #$0003              ;
$01/AA99 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/AA9C 60          RTS                     ;

; do nothing
$01/AA9D 6B          RTL                     ;

main_splashed_flan:
$01/AA9E 22 23 AF 03 JSL $03AF23[$03:AF23]   ;
$01/AAA2 B4 76       LDY $76,x  [$00:0076]   ;
$01/AAA4 D0 03       BNE $03    [$AAA9]      ;
$01/AAA6 F6 76       INC $76,x  [$00:0076]   ;
$01/AAA8 6B          RTL                     ;

$01/AAA9 BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/AAAC D0 27       BNE $27    [$AAD5]      ;
$01/AAAE B4 18       LDY $18,x  [$00:0018]   ;
$01/AAB0 D0 0E       BNE $0E    [$AAC0]      ;
$01/AAB2 A9 20 00    LDA #$0020              ;
$01/AAB5 9D 42 75    STA $7542,x[$00:7542]   ;
$01/AAB8 A9 08 00    LDA #$0008              ;
$01/AABB 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/AABE F6 18       INC $18,x  [$00:0018]   ;
$01/AAC0 BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/AAC3 D0 10       BNE $10    [$AAD5]      ;
$01/AAC5 A9 08 00    LDA #$0008              ;
$01/AAC8 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/AACB BC 02 74    LDY $7402,x[$00:7402]   ;
$01/AACE C0 02       CPY #$02                ;
$01/AAD0 10 03       BPL $03    [$AAD5]      ;
$01/AAD2 FE 02 74    INC $7402,x[$00:7402]   ;
$01/AAD5 A9 06 00    LDA #$0006              ;
$01/AAD8 9D A2 74    STA $74A2,x[$00:74A2]   ;
$01/AADB BD 60 78    LDA $7860,x[$00:7860]   ;
$01/AADE 29 01 00    AND #$0001              ;
$01/AAE1 F0 C5       BEQ $C5    [$AAA8]      ;
$01/AAE3 5C 1E A3 03 JMP $03A31E[$03:A31E]   ;

.init_hedgehog
$01/AAE7 6B          RTL                     ;

; hedgehog pointer table
CODE_01AAE8:         dw $AB6A
CODE_01AAEA:         dw $AC06

.main_hedgehog
$01/AAEC BD 40 70    LDA $7040,x[$00:7040]   ;
$01/AAEF 4A          LSR A                   ;
$01/AAF0 90 04       BCC $04    [$AAF6]      ;
$01/AAF2 22 52 AA 03 JSL $03AA52[$03:AA52]   ;
$01/AAF6 22 23 AF 03 JSL $03AF23[$03:AF23]   ;
$01/AAFA 9B          TXY                     ;
$01/AAFB B5 76       LDA $76,x  [$00:0076]   ;
$01/AAFD 0A          ASL A                   ;
$01/AAFE AA          TAX                     ;
$01/AAFF FC E8 AA    JSR ($AAE8,x)[$00:0302] ; pointer table
$01/AB02 20 13 AB    JSR $AB13  [$00:AB13]   ;
$01/AB05 BC 36 7D    LDY $7D36,x[$00:7D36]   ;
$01/AB08 10 04       BPL $04    [$AB0E]      ;
$01/AB0A 22 58 A8 03 JSL $03A858[$03:A858]   ;
$01/AB0E 6B          RTL                     ;

; data table
CODE_01AB0F:         dw $E000
CODE_01AB11:         dw $E020

; hedgehog s sub
$01/AB13 BD 40 70    LDA $7040,x[$00:7040]   ;
$01/AB16 4A          LSR A                   ;
$01/AB17 90 48       BCC $48    [$AB61]      ;
$01/AB19 8A          TXA                     ;
$01/AB1A 8D 14 30    STA $3014  [$00:3014]   ;
$01/AB1D A9 00 0C    LDA #$0C00              ;
$01/AB20 8D 00 30    STA $3000  [$00:3000]   ;
$01/AB23 BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/AB26 8D 0C 30    STA $300C  [$00:300C]   ;
$01/AB29 B4 18       LDY $18,x  [$00:0018]   ;
$01/AB2B B9 0F AB    LDA $AB0F,y[$00:AB0F]   ; table
$01/AB2E 8D 18 30    STA $3018  [$00:3018]   ;
$01/AB31 A9 54 00    LDA #$0054              ;
$01/AB34 8D 1A 30    STA $301A  [$00:301A]   ;
$01/AB37 A9 10 00    LDA #$0010              ;
$01/AB3A 8D 10 30    STA $3010  [$00:3010]   ;
$01/AB3D 0A          ASL A                   ;
$01/AB3E 8D 12 30    STA $3012  [$00:3012]   ;
$01/AB41 BC 22 77    LDY $7722,x[$00:7722]   ;
$01/AB44 BB          TYX                     ;
$01/AB45 BF CE A9 03 LDA $03A9CE,x[$03:A9CE] ; f table
$01/AB49 8D 06 30    STA $3006  [$00:3006]   ;
$01/AB4C BF EE A9 03 LDA $03A9EE,x[$03:A9EE] ; f table
$01/AB50 8D 04 30    STA $3004  [$00:3004]   ;
$01/AB53 A2 08       LDX #$08                ;
$01/AB55 A9 64 D9    LDA #$D964              ;
$01/AB58 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/AB5C A6 12       LDX $12    [$00:0012]   ;
$01/AB5E EE F9 0C    INC $0CF9  [$00:0CF9]   ;
$01/AB61 60          RTS                     ;

$01/AB62 80 FE       BRA $FE    [$AB62]      ;

$01/AB64 80 01       BRA $01    [$AB67]      ;

$01/AB66 10 00       BPL $00    [$AB68]      ;
$01/AB68 F8          SED                     ;
$01/AB69 FF 

; hedgehog table sub
$01/AB6A BB          TYX                     ;
$01/AB6B BC 00 74    LDY $7400,x[$00:7400]   ;
$01/AB6E B9 62 AB    LDA $AB62,y[$00:AB62]   ;
$01/AB71 9D E0 75    STA $75E0,x[$00:75E0]   ;
$01/AB74 A9 20 00    LDA #$0020              ;
$01/AB77 9D 40 75    STA $7540,x[$00:7540]   ;
$01/AB7A BC F8 7A    LDY $7AF8,x[$00:7AF8]   ;
$01/AB7D D0 42       BNE $42    [$ABC1]      ;
$01/AB7F BD 16 7C    LDA $7C16,x[$00:7C16]   ;
$01/AB82 18          CLC                     ;
$01/AB83 69 20 00    ADC #$0020              ;
$01/AB86 C9 40 00    CMP #$0040              ;
$01/AB89 B0 36       BCS $36    [$ABC1]      ;
$01/AB8B BD 18 7C    LDA $7C18,x[$00:7C18]   ;
$01/AB8E 18          CLC                     ;
$01/AB8F 69 40 00    ADC #$0040              ;
$01/AB92 C9 80 00    CMP #$0080              ;
$01/AB95 B0 2A       BCS $2A    [$ABC1]      ;
$01/AB97 22 74 AD 03 JSL $03AD74[$03:AD74]   ;
$01/AB9B 90 24       BCC $24    [$ABC1]      ;
$01/AB9D A9 60 7C    LDA #$7C60              ;
$01/ABA0 9D A0 6F    STA $6FA0,x[$00:6FA0]   ;
$01/ABA3 A9 75 21    LDA #$2175              ;
$01/ABA6 9D 40 70    STA $7040,x[$00:7040]   ;
$01/ABA9 9E 02 74    STZ $7402,x[$00:7402]   ;
$01/ABAC A9 80 00    LDA #$0080              ;
$01/ABAF 9D 36 7A    STA $7A36,x[$00:7A36]   ;
$01/ABB2 9E 20 72    STZ $7220,x[$00:7220]   ;
$01/ABB5 9E 40 75    STZ $7540,x[$00:7540]   ;
$01/ABB8 A9 40 00    LDA #$0040              ;
$01/ABBB 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/ABBE F6 76       INC $76,x  [$00:0076]   ;
$01/ABC0 60          RTS                     ;


$01/ABC1 BC 98 7A    LDY $7A98,x[$00:7A98]   ;
$01/ABC4 D0 0F       BNE $0F    [$ABD5]      ;
$01/ABC6 A9 04 00    LDA #$0004              ;
$01/ABC9 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/ABCC BD 02 74    LDA $7402,x[$00:7402]   ;
$01/ABCF 49 01 00    EOR #$0001              ;
$01/ABD2 9D 02 74    STA $7402,x[$00:7402]   ;
$01/ABD5 BC F6 7A    LDY $7AF6,x[$00:7AF6]   ;
$01/ABD8 D0 2B       BNE $2B    [$AC05]      ;
$01/ABDA A9 04 00    LDA #$0004              ;
$01/ABDD 9D F6 7A    STA $7AF6,x[$00:7AF6]   ;
$01/ABE0 A9 D8 01    LDA #$01D8              ;
$01/ABE3 22 21 8B 00 JSL $008B21[$00:8B21]   ;
$01/ABE7 BD 00 74    LDA $7400,x[$00:7400]   ;
$01/ABEA 99 C0 73    STA $73C0,y[$00:73C0]   ;
$01/ABED BD E2 70    LDA $70E2,x[$00:70E2]   ;
$01/ABF0 99 A2 70    STA $70A2,y[$00:70A2]   ;
$01/ABF3 A9 02 00    LDA #$0002              ;
$01/ABF6 99 82 77    STA $7782,y[$00:7782]   ;
$01/ABF9 1A          INC A                   ;
$01/ABFA 99 4C 7E    STA $7E4C,y[$00:7E4C]   ;
$01/ABFD 0A          ASL A                   ;
$01/ABFE 18          CLC                     ;
$01/ABFF 7D 82 71    ADC $7182,x[$00:7182]   ;
$01/AC02 99 42 71    STA $7142,y[$00:7142]   ;
$01/AC05 60          RTS                     ;

; hedgehog table sub
$01/AC06 BB          TYX                     ;
$01/AC07 BC C2 77    LDY $77C2,x[$00:77C2]   ;
$01/AC0A 98          TYA                     ;
$01/AC0B 9D 00 74    STA $7400,x[$00:7400]   ;
$01/AC0E BC 36 7D    LDY $7D36,x[$00:7D36]   ;
$01/AC11 88          DEY                     ;
$01/AC12 30 15       BMI $15    [$AC29]      ;
$01/AC14 B9 00 6F    LDA $6F00,y[$00:6F00]   ;
$01/AC17 C9 10 00    CMP #$0010              ;
$01/AC1A D0 0D       BNE $0D    [$AC29]      ;
$01/AC1C B9 38 7D    LDA $7D38,y[$00:7D38]   ;
$01/AC1F F0 08       BEQ $08    [$AC29]      ;
$01/AC21 BB          TYX                     ;
$01/AC22 22 5B B2 03 JSL $03B25B[$03:B25B]   ;
$01/AC26 9E 96 7A    STZ $7A96,x[$00:7A96]   ;
$01/AC29 BC 96 7A    LDY $7A96,x[$00:7A96]   ;
$01/AC2C F0 11       BEQ $11    [$AC3F]      ;
$01/AC2E BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/AC31 18          CLC                     ;
$01/AC32 69 10 00    ADC #$0010              ;
$01/AC35 C9 00 01    CMP #$0100              ;
$01/AC38 30 2C       BMI $2C    [$AC66]      ;
$01/AC3A A9 00 01    LDA #$0100              ;
$01/AC3D 80 27       BRA $27    [$AC66]      ;

$01/AC3F BD 36 7A    LDA $7A36,x[$00:7A36]   ;
$01/AC42 38          SEC                     ;
$01/AC43 E9 10 00    SBC #$0010              ;
$01/AC46 C9 80 00    CMP #$0080              ;
$01/AC49 10 1B       BPL $1B    [$AC66]      ;
$01/AC4B A9 40 00    LDA #$0040              ;
$01/AC4E 9D F8 7A    STA $7AF8,x[$00:7AF8]   ;
$01/AC51 74 76       STZ $76,x  [$00:0076]   ;
$01/AC53 A9 00 7E    LDA #$7E00              ;
$01/AC56 9D A0 6F    STA $6FA0,x[$00:6FA0]   ;
$01/AC59 A9 74 09    LDA #$0974              ;
$01/AC5C 9D 40 70    STA $7040,x[$00:7040]   ;
$01/AC5F 22 FD AE 03 JSL $03AEFD[$03:AEFD]   ;
$01/AC63 A9 80 00    LDA #$0080              ;
$01/AC66 9D 36 7A    STA $7A36,x[$00:7A36]   ;
$01/AC69 BC 98 7A    LDY $7A98,x[$00:7A98]   ;
$01/AC6C D0 0B       BNE $0B    [$AC79]      ;
$01/AC6E A9 04 00    LDA #$0004              ;
$01/AC71 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/AC74 4A          LSR A                   ;
$01/AC75 55 18       EOR $18,x  [$00:0018]   ;
$01/AC77 95 18       STA $18,x  [$00:0018]   ;
$01/AC79 60          RTS                     ;

; data table
CODE_01AC7A:         dw $FE00
CODE_01AC7C:         dw $0200
CODE_01AC7E:         dw $FD00
CODE_01AC80:         dw $0300

; data table
CODE_01AC82:         dw $0004
CODE_01AC84:         dw $0006
CODE_01AC86:         dw $0008
CODE_01AC88:         dw $000C

; data table
CODE_01AC8A:         dw $FFD0
CODE_01AC8C:         dw $0120

init_gusty:
$01/AC8E BD 82 71    LDA $7182,x[$00:7182]   ;
$01/AC91 89 10 00    BIT #$0010              ;
$01/AC94 F0 39       BEQ $39    [$ACCF]      ;
$01/AC96 29 E0 FF    AND #$FFE0              ;
$01/AC99 9D 02 79    STA $7902,x[$00:7902]   ;
$01/AC9C BD E2 70    LDA $70E2,x[$00:70E2]   ;
$01/AC9F 29 10 00    AND #$0010              ;
$01/ACA2 4A          LSR A                   ;
$01/ACA3 4A          LSR A                   ;
$01/ACA4 4A          LSR A                   ;
$01/ACA5 A8          TAY                     ;
$01/ACA6 B9 8A AC    LDA $AC8A,y[$00:AC8A]   ; table
$01/ACA9 9D 00 79    STA $7900,x[$00:7900]   ;
$01/ACAC A9 FF 00    LDA #$00FF              ;
$01/ACAF 9D A2 74    STA $74A2,x[$00:74A2]   ;
$01/ACB2 A9 60 00    LDA #$0060              ;
$01/ACB5 9D A0 6F    STA $6FA0,x[$00:6FA0]   ;
$01/ACB8 A9 00 40    LDA #$4000              ;
$01/ACBB 9D A2 6F    STA $6FA2,x[$00:6FA2]   ;
$01/ACBE A9 02 00    LDA #$0002              ;
$01/ACC1 9D 40 70    STA $7040,x[$00:7040]   ;
$01/ACC4 F6 76       INC $76,x  [$00:0076]   ;
$01/ACC6 AC 3A 0C    LDY $0C3A  [$00:0C3A]   ;
$01/ACC9 D0 03       BNE $03    [$ACCE]      ;
$01/ACCB EE 3A 0C    INC $0C3A  [$00:0C3A]   ;
$01/ACCE 6B          RTL                     ;

$01/ACCF BD E2 70    LDA $70E2,x[$00:70E2]   ;
$01/ACD2 48          PHA                     ;
$01/ACD3 38          SEC                     ;
$01/ACD4 ED 94 60    SBC $6094  [$00:6094]   ;
$01/ACD7 85 00       STA $00    [$00:0000]   ;
$01/ACD9 68          PLA                     ;
$01/ACDA 29 10 00    AND #$0010              ;
$01/ACDD 3A          DEC A                   ;
$01/ACDE 45 00       EOR $00    [$00:0000]   ;
$01/ACE0 30 04       BMI $04    [$ACE6]      ;
$01/ACE2 5C 1E A3 03 JMP $03A31E[$03:A31E]   ;

$01/ACE6 A5 10       LDA $10    [$00:0010]   ;
$01/ACE8 29 04 00    AND #$0004              ;
$01/ACEB 85 00       STA $00    [$00:0000]   ;
$01/ACED BD E2 70    LDA $70E2,x[$00:70E2]   ;
$01/ACF0 29 10 00    AND #$0010              ;
$01/ACF3 4A          LSR A                   ;
$01/ACF4 4A          LSR A                   ;
$01/ACF5 4A          LSR A                   ;
$01/ACF6 9D 00 74    STA $7400,x[$00:7400]   ;
$01/ACF9 05 00       ORA $00    [$00:0000]   ; entry point
$01/ACFB A8          TAY                     ;
$01/ACFC B9 7A AC    LDA $AC7A,y[$00:AC7A]   ; table
$01/ACFF 9D E0 75    STA $75E0,x[$00:75E0]   ;
$01/AD02 A5 00       LDA $00    [$00:0000]   ;
$01/AD04 4A          LSR A                   ;
$01/AD05 95 78       STA $78,x  [$00:0078]   ;
$01/AD07 A8          TAY                     ;
$01/AD08 B9 82 AC    LDA $AC82,y[$00:AC82]   ; table
$01/AD0B 9D 40 75    STA $7540,x[$00:7540]   ;
$01/AD0E 6B          RTL                     ;

; data table
CODE_01AD0F:         dw $FE00
CODE_01AD11:         dw $0200
CODE_01AD13:         dw $FE00
CODE_01AD15:         dw $0200

main_gusty:
$01/AD17 BC 38 7D    LDY $7D38,x[$00:7D38]   ;
$01/AD1A F0 14       BEQ $14    [$AD30]      ;
$01/AD1C A5 10       LDA $10    [$00:0010]   ;
$01/AD1E 29 04 00    AND #$0004              ;
$01/AD21 85 00       STA $00    [$00:0000]   ;
$01/AD23 BD 00 74    LDA $7400,x[$00:7400]   ;
$01/AD26 22 F9 AC 01 JSL $01ACF9[$01:ACF9]   ;
$01/AD2A 9E 38 7D    STZ $7D38,x[$00:7D38]   ;
$01/AD2D 9E E2 75    STZ $75E2,x[$00:75E2]   ;
$01/AD30 22 23 AF 03 JSL $03AF23[$03:AF23]   ;
$01/AD34 B4 76       LDY $76,x  [$00:0076]   ;
$01/AD36 F0 03       BEQ $03    [$AD3B]      ;
$01/AD38 4C C2 AD    JMP $ADC2  [$00:ADC2]   ;

$01/AD3B BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/AD3E D0 52       BNE $52    [$AD92]      ;
$01/AD40 BC 36 7D    LDY $7D36,x[$00:7D36]   ;
$01/AD43 10 4D       BPL $4D    [$AD92]      ;
$01/AD45 BD 18 7C    LDA $7C18,x[$00:7C18]   ;
$01/AD48 38          SEC                     ;
$01/AD49 ED 22 61    SBC $6122  [$00:6122]   ;
$01/AD4C 38          SEC                     ;
$01/AD4D FD B8 7B    SBC $7BB8,x[$00:7BB8]   ;
$01/AD50 C9 F6 FF    CMP #$FFF6              ;
$01/AD53 90 0F       BCC $0F    [$AD64]      ;
$01/AD55 AC AB 60    LDY $60AB  [$00:60AB]   ;
$01/AD58 30 38       BMI $38    [$AD92]      ;
$01/AD5A AC C0 60    LDY $60C0  [$00:60C0]   ;
$01/AD5D F0 05       BEQ $05    [$AD64]      ;
$01/AD5F 22 B7 A5 03 JSL $03A5B7[$03:A5B7]   ;
$01/AD63 6B          RTL                     ;

$01/AD64 22 58 A8 03 JSL $03A858[$03:A858]   ;
$01/AD68 AD B2 61    LDA $61B2  [$00:61B2]   ;
$01/AD6B 10 25       BPL $25    [$AD92]      ;
$01/AD6D 29 FF 0F    AND #$0FFF              ;
$01/AD70 8D B2 61    STA $61B2  [$00:61B2]   ;
$01/AD73 A9 40 00    LDA #$0040              ;
$01/AD76 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/AD79 0A          ASL A                   ;
$01/AD7A 0A          ASL A                   ;
$01/AD7B 8D 4A 61    STA $614A  [$00:614A]   ;
$01/AD7E BC 00 74    LDY $7400,x[$00:7400]   ;
$01/AD81 B9 13 AD    LDA $AD13,y[$00:AD13]   ; table
$01/AD84 18          CLC                     ;
$01/AD85 6D A8 60    ADC $60A8  [$00:60A8]   ;
$01/AD88 8D A8 60    STA $60A8  [$00:60A8]   ;
$01/AD8B 8D B4 60    STA $60B4  [$00:60B4]   ;
$01/AD8E 22 C1 BE 06 JSL $06BEC1[$06:BEC1]   ;
$01/AD92 BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/AD95 D0 10       BNE $10    [$ADA7]      ;
$01/AD97 A9 06 00    LDA #$0006              ;
$01/AD9A 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/AD9D BD 02 74    LDA $7402,x[$00:7402]   ;
$01/ADA0 1A          INC A                   ;
$01/ADA1 29 03 00    AND #$0003              ;
$01/ADA4 9D 02 74    STA $7402,x[$00:7402]   ;
$01/ADA7 B4 78       LDY $78,x  [$00:0078]   ;
$01/ADA9 BD 80 76    LDA $7680,x[$00:7680]   ;
$01/ADAC 38          SEC                     ;
$01/ADAD E9 40 00    SBC #$0040              ;
$01/ADB0 C9 80 00    CMP #$0080              ;
$01/ADB3 B0 06       BCS $06    [$ADBB]      ;
$01/ADB5 98          TYA                     ;
$01/ADB6 18          CLC                     ;
$01/ADB7 69 04 00    ADC #$0004              ;
$01/ADBA A8          TAY                     ;
$01/ADBB B9 82 AC    LDA $AC82,y[$00:AC82]   ; table
$01/ADBE 9D 40 75    STA $7540,x[$00:7540]   ;
$01/ADC1 6B          RTL                     ;

$01/ADC2 AC 3A 0C    LDY $0C3A  [$00:0C3A]   ;
$01/ADC5 F0 0F       BEQ $0F    [$ADD6]      ;
$01/ADC7 BD 82 76    LDA $7682,x[$00:7682]   ;
$01/ADCA 18          CLC                     ;
$01/ADCB 69 40 00    ADC #$0040              ;
$01/ADCE C9 80 01    CMP #$0180              ;
$01/ADD1 90 07       BCC $07    [$ADDA]      ;
$01/ADD3 9C 3A 0C    STZ $0C3A  [$00:0C3A]   ;
$01/ADD6 5C 1E A3 03 JMP $03A31E[$03:A31E]   ;

$01/ADDA B4 18       LDY $18,x  [$00:0018]   ;
$01/ADDC F0 10       BEQ $10    [$ADEE]      ;
$01/ADDE B9 00 6F    LDA $6F00,y[$00:6F00]   ;
$01/ADE1 C9 10 00    CMP #$0010              ;
$01/ADE4 D0 0D       BNE $0D    [$ADF3]      ;
$01/ADE6 B9 60 73    LDA $7360,y[$00:7360]   ;
$01/ADE9 C9 E6 00    CMP #$00E6              ;
$01/ADEC D0 05       BNE $05    [$ADF3]      ;
$01/ADEE BD 96 7A    LDA $7A96,x[$00:7A96]   ;
$01/ADF1 D0 24       BNE $24    [$AE17]      ;
$01/ADF3 A9 E6 00    LDA #$00E6              ;
$01/ADF6 22 4C A3 03 JSL $03A34C[$03:A34C]   ;
$01/ADFA 90 1B       BCC $1B    [$AE17]      ;
$01/ADFC AD 94 60    LDA $6094  [$00:6094]   ;
$01/ADFF 29 EF FF    AND #$FFEF              ;
$01/AE02 18          CLC                     ;
$01/AE03 7D 00 79    ADC $7900,x[$00:7900]   ;
$01/AE06 99 E2 70    STA $70E2,y[$00:70E2]   ;
$01/AE09 BD 02 79    LDA $7902,x[$00:7902]   ;
$01/AE0C 99 82 71    STA $7182,y[$00:7182]   ;
$01/AE0F 94 18       STY $18,x  [$00:0018]   ;
$01/AE11 A9 00 01    LDA #$0100              ;
$01/AE14 9D 96 7A    STA $7A96,x[$00:7A96]   ;
$01/AE17 6B          RTL                     ;

; do nothing
$01/AE18 6B          RTL                     ;

main_seed:
$01/AE19 BC 60 78    LDY $7860,x[$00:7860]   ;
$01/AE1C F0 36       BEQ $36    [$AE54]      ;
$01/AE1E A9 29 02    LDA #$0229              ;
$01/AE21 22 21 8B 00 JSL $008B21[$00:8B21]   ;
$01/AE25 BD E2 70    LDA $70E2,x[$00:70E2]   ;
$01/AE28 99 A2 70    STA $70A2,y[$00:70A2]   ;
$01/AE2B BD 82 71    LDA $7182,x[$00:7182]   ;
$01/AE2E 99 42 71    STA $7142,y[$00:7142]   ;
$01/AE31 BD 20 72    LDA $7220,x[$00:7220]   ;
$01/AE34 99 E0 71    STA $71E0,y[$00:71E0]   ;
$01/AE37 F0 0E       BEQ $0E    [$AE47]      ;
$01/AE39 C9 00 80    CMP #$8000              ;
$01/AE3C 6A          ROR A                   ;
$01/AE3D 49 FF FF    EOR #$FFFF              ;
$01/AE40 1A          INC A                   ;
$01/AE41 99 E0 71    STA $71E0,y[$00:71E0]   ;
$01/AE44 A9 80 FD    LDA #$FD80              ;
$01/AE47 99 E2 71    STA $71E2,y[$00:71E2]   ;
$01/AE4A A9 FF FF    LDA #$FFFF              ;
$01/AE4D 99 82 77    STA $7782,y[$00:7782]   ;
$01/AE50 5C 1E A3 03 JMP $03A31E[$03:A31E]   ;

$01/AE54 BD 38 7A    LDA $7A38,x[$00:7A38]   ;
$01/AE57 F0 18       BEQ $18    [$AE71]      ;
$01/AE59 BC 36 7D    LDY $7D36,x[$00:7D36]   ;
$01/AE5C 10 13       BPL $13    [$AE71]      ;
$01/AE5E AD D6 61    LDA $61D6  [$00:61D6]   ;
$01/AE61 D0 0E       BNE $0E    [$AE71]      ;
$01/AE63 22 58 A8 03 JSL $03A858[$03:A858]   ;
$01/AE67 22 5B B2 03 JSL $03B25B[$03:B25B]   ;
$01/AE6B A9 01 00    LDA #$0001              ;
$01/AE6E 8D BC 03    STA $03BC  [$00:03BC]   ;
$01/AE71 22 23 AF 03 JSL $03AF23[$03:AF23]   ;
$01/AE75 6B          RTL                     ;

init_pulley_guy:
$01/AE76 BD E2 70    LDA $70E2,x[$00:70E2]   ;
$01/AE79 29 10 00    AND #$0010              ;
$01/AE7C 4A          LSR A                   ;
$01/AE7D 4A          LSR A                   ;
$01/AE7E 4A          LSR A                   ;
$01/AE7F 9D 00 74    STA $7400,x[$00:7400]   ;
$01/AE82 A9 85 18    LDA #$1885              ;
$01/AE85 9D 40 70    STA $7040,x[$00:7040]   ;
$01/AE88 6B          RTL                     ;

; pulley guy pointer table
$01/AE89             dw $AEB9, $AEDA, $AEFD, $8000
$01/AE91             dw $AF10, $AF49

main_pulley_guy:
$01/AE95 22 23 AF 03 JSL $03AF23[$03:AF23]   ;
$01/AE99 9B          TXY                     ;
$01/AE9A B5 76       LDA $76,x  [$00:0076]   ;
$01/AE9C 0A          ASL A                   ;
$01/AE9D AA          TAX                     ;
$01/AE9E FC 89 AE    JSR ($AE89,x)[$00:3800] ; table sub
$01/AEA1 B4 76       LDY $76,x  [$00:0076]   ;
$01/AEA3 F0 04       BEQ $04    [$AEA9]      ;
$01/AEA5 C0 05       CPY #$05                ;
$01/AEA7 30 0F       BMI $0F    [$AEB8]      ;
$01/AEA9 AD 74 79    LDA $7974  [$00:7974]   ;
$01/AEAC 29 03 00    AND #$0003              ;
$01/AEAF D0 07       BNE $07    [$AEB8]      ;
$01/AEB1 A9 5A 00    LDA #$005A              ;\ play sound #$005A
$01/AEB4 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/AEB8 6B          RTL                     ;

; pulley guy table sub
$01/AEB9 BB          TYX                     ;
$01/AEBA BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/AEBD D0 13       BNE $13    [$AED2]      ;
$01/AEBF A9 04 00    LDA #$0004              ;
$01/AEC2 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/AEC5 FE 02 74    INC $7402,x[$00:7402]   ;
$01/AEC8 BC 02 74    LDY $7402,x[$00:7402]   ;
$01/AECB C0 0C       CPY #$0C                ;
$01/AECD D0 03       BNE $03    [$AED2]      ;
$01/AECF 9E 02 74    STZ $7402,x[$00:7402]   ;
$01/AED2 60          RTS                     ;

; data table - starts from $AEC6 in code
$01/AED3             .db $04, $03, $02, $01, $01, $01, $01

; pulley guy table sub
$01/AEDA BB          TYX                     ;
$01/AEDB BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/AEDE D0 1C       BNE $1C    [$AEFC]      ;
$01/AEE0 FE 02 74    INC $7402,x[$00:7402]   ;
$01/AEE3 BC 02 74    LDY $7402,x[$00:7402]   ;
$01/AEE6 C0 14       CPY #$14                ;
$01/AEE8 D0 09       BNE $09    [$AEF3]      ;
$01/AEEA A9 10 00    LDA #$0010              ;
$01/AEED 9D 02 74    STA $7402,x[$00:7402]   ;
$01/AEF0 F6 76       INC $76,x  [$00:0076]   ;
$01/AEF2 60          RTS                     ;

$01/AEF3 B9 C6 AE    LDA $AEC6,y[$00:AEC6]   ; table
$01/AEF6 29 FF 00    AND #$00FF              ;
$01/AEF9 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/AEFC 60          RTS                     ;

; pulley guy table sub
$01/AEFD BB          TYX                     ;
$01/AEFE BD 02 74    LDA $7402,x[$00:7402]   ;
$01/AF01 1A          INC A                   ;
$01/AF02 29 03 00    AND #$0003              ;
$01/AF05 09 10 00    ORA #$0010              ;
$01/AF08 9D 02 74    STA $7402,x[$00:7402]   ;
$01/AF0B 60          RTS                     ;

; data table - starts from $AF0B in code
$01/AF0C             .db $20, $04, $04, $04

; pulley guy table sub
$01/AF10 BB          TYX                     ;
$01/AF11 BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/AF14 D0 28       BNE $28    [$AF3E]      ;
$01/AF16 D6 16       DEC $16,x  [$00:0016]   ;
$01/AF18 D0 10       BNE $10    [$AF2A]      ;
$01/AF1A A9 08 00    LDA #$0008              ;
$01/AF1D 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/AF20 A0 0B       LDY #$0B                ;
$01/AF22 94 16       STY $16,x  [$00:0016]   ;
$01/AF24 9E 02 74    STZ $7402,x[$00:7402]   ;
$01/AF27 F6 76       INC $76,x  [$00:0076]   ;
$01/AF29 60          RTS                     ;

$01/AF2A B4 16       LDY $16,x  [$00:0016]   ;
$01/AF2C B9 0B AF    LDA $AF0B,y[$00:AF0B]   ; table
$01/AF2F 29 FF 00    AND #$00FF              ;
$01/AF32 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/AF35 BD 02 74    LDA $7402,x[$00:7402]   ;
$01/AF38 49 07 00    EOR #$0007              ;
$01/AF3B 9D 02 74    STA $7402,x[$00:7402]   ;
$01/AF3E 60          RTS                     ;

; data table - starts from $AF3E in code
$01/AF3F             .db $04, $05, $06, $07, $08
$01/AF44             .db $08, $08, $08, $08, $08

; pulley guy table sub
$01/AF49 BB          TYX                     ;
$01/AF4A BD 98 7A    LDA $7A98,x[$00:7A98]   ;
$01/AF4D D0 1E       BNE $1E    [$AF6D]      ;
$01/AF4F D6 16       DEC $16,x  [$00:0016]   ;
$01/AF51 D0 0C       BNE $0C    [$AF5F]      ;
$01/AF53 A9 04 00    LDA #$0004              ;
$01/AF56 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/AF59 9E 02 74    STZ $7402,x[$00:7402]   ;
$01/AF5C 74 76       STZ $76,x  [$00:0076]   ;
$01/AF5E 60          RTS                     ;

$01/AF5F B4 16       LDY $16,x  [$00:0016]   ;
$01/AF61 B9 3E AF    LDA $AF3E,y[$00:AF3E]   ;
$01/AF64 29 FF 00    AND #$00FF              ;
$01/AF67 9D 98 7A    STA $7A98,x[$00:7A98]   ;
$01/AF6A FE 02 74    INC $7402,x[$00:7402]   ;
$01/AF6D 60          RTS                     ;

; l sub
$01/AF6E 22 1C 83 00 JSL $00831C[$00:831C]   ;
$01/AF72 C2 20       REP #$20                ;
$01/AF74 A9 00 40    LDA #$4000              ;
$01/AF77 8D BC 61    STA $61BC  [$00:61BC]   ;
$01/AF7A 9C 04 7E    STZ $7E04  [$00:7E04]   ;
$01/AF7D E2 20       SEP #$20                ;
$01/AF7F 6B          RTL                     ;

; data table
CODE_01AF80:         db $04, $06, $08, $0A
CODE_01AF84:         db $0C, $0E, $10, $12
CODE_01AF88:         db $14, $16, $18, $1A
CODE_01AF8C:         db $1C, $1E, $20, $22

.gamemode0C
$01/AF90 22 77 82 00 JSL $008277[$00:8277]   ;
$01/AF94 22 6E AF 01 JSL $01AF6E[$01:AF6E]   ;
$01/AF98 22 B8 94 03 JSL $0394B8[$03:94B8]   ;
$01/AF9C AD 8C 03    LDA $038C  [$00:038C]   ;
$01/AF9F F0 03       BEQ $03    [$AFA4]      ;
$01/AFA1 4C 1B B0    JMP $B01B  [$00:B01B]   ;

$01/AFA4 C2 20       REP #$20                ;
$01/AFA6 A0 00       LDY #$00                ;
$01/AFA8 64 21       STZ $21    [$00:0021]   ;
$01/AFAA A9 92 03    LDA #$0392              ;
$01/AFAD 85 20       STA $20    [$00:0020]   ;
$01/AFAF A9 2E 02    LDA #$022E              ;
$01/AFB2 22 AB 82 00 JSL $0082AB[$00:82AB]   ;

$01/AFB6 E2 20       SEP #$20                ;
$01/AFB8 C2 30       REP #$30                ;
$01/AFBA 9C 06 7E    STZ $7E06  [$00:7E06]   ;
$01/AFBD A2 3E 00    LDX #$003E              ;
$01/AFC0 9E C0 03    STZ $03C0,x[$00:03C0]   ;
$01/AFC3 9E 00 04    STZ $0400,x[$00:0400]   ;
$01/AFC6 9E 40 04    STZ $0440,x[$00:0440]   ;
$01/AFC9 9E 80 04    STZ $0480,x[$00:0480]   ;
$01/AFCC 9E C0 04    STZ $04C0,x[$00:04C0]   ;
$01/AFCF 9E 00 05    STZ $0500,x[$00:0500]   ;
$01/AFD2 9E 40 05    STZ $0540,x[$00:0540]   ;
$01/AFD5 9E 80 05    STZ $0580,x[$00:0580]   ;
$01/AFD8 CA          DEX                     ;
$01/AFD9 CA          DEX                     ;
$01/AFDA 10 E4       BPL $E4    [$AFC0]      ;
$01/AFDC A9 64 00    LDA #$0064              ;
$01/AFDF 8D B6 03    STA $03B6  [$00:03B6]   ;
$01/AFE2 9C A5 03    STZ $03A5  [$00:03A5]   ;
$01/AFE5 9C A3 03    STZ $03A3  [$00:03A3]   ;
$01/AFE8 A9 01 00    LDA #$0001              ;
$01/AFEB 8D A1 03    STA $03A1  [$00:03A1]   ;
$01/AFEE AD 1A 02    LDA $021A  [$00:021A]   ;
$01/AFF1 0A          ASL A                   ;
$01/AFF2 AA          TAX                     ;
$01/AFF3 BF E7 F3 17 LDA $17F3E7,x[$17:F3E7] ;
$01/AFF7 AA          TAX                     ;
$01/AFF8 BF 72 F4 17 LDA $17F472,x[$17:F472] ;\
$01/AFFC 29 FF 00    AND #$00FF              ; |
$01/AFFF 0A          ASL A                   ; |
$01/B000 0A          ASL A                   ; | Set initial X position in a level
$01/B001 0A          ASL A                   ; |
$01/B002 0A          ASL A                   ; |
$01/B003 8D 8C 60    STA $608C  [$00:608C]   ;/
$01/B006 BF 73 F4 17 LDA $17F473,x[$17:F473] ;\
$01/B00A 29 FF 00    AND #$00FF              ; |
$01/B00D 0A          ASL A                   ; |
$01/B00E 0A          ASL A                   ; | Set initial Y position in a level
$01/B00F 0A          ASL A                   ; |
$01/B010 0A          ASL A                   ; |
$01/B011 8D 90 60    STA $6090  [$00:6090]   ;/
$01/B014 BF 71 F4 17 LDA $17F471,x[$17:F471] ; Load level number
$01/B018 4C 84 B0    JMP $B084  [$00:B084]   ;

$01/B01B C2 30       REP #$30                ;
$01/B01D 9C 96 03    STZ $0396  [$00:0396]   ;
$01/B020 AD 8C 03    LDA $038C  [$00:038C]   ;
$01/B023 3A          DEC A                   ;
$01/B024 F0 03       BEQ $03    [$B029]      ;
$01/B026 4C AD B0    JMP $B0AD  [$00:B0AD]   ;

$01/B029 AE 8E 03    LDX $038E  [$00:038E]   ;
$01/B02C BF 00 7E 7F LDA $7F7E00,x[$7F:7E00] ;
$01/B030 29 FF 00    AND #$00FF              ;
$01/B033 C9 DE 00    CMP #$00DE              ;
$01/B036 90 22       BCC $22    [$B05A]      ;
$01/B038 E9 DE 00    SBC #$00DE              ;
$01/B03B 0A          ASL A                   ;
$01/B03C 8D A7 03    STA $03A7  [$00:03A7]   ;
$01/B03F BF 03 7E 7F LDA $7F7E03,x[$7F:7E03] ;
$01/B043 29 FF 00    AND #$00FF              ;
$01/B046 8D 74 03    STA $0374  [$00:0374]   ;
$01/B049 BF 01 7E 7F LDA $7F7E01,x[$7F:7E01] ;
$01/B04D 8D 75 03    STA $0375  [$00:0375]   ;
$01/B050 AD B6 03    LDA $03B6  [$00:03B6]   ;
$01/B053 8D 77 03    STA $0377  [$00:0377]   ;
$01/B056 5C 00 80 11 JMP $118000[$11:8000]   ;

$01/B05A BF 01 7E 7F LDA $7F7E01,x[$7F:7E01] ;\
$01/B05E 29 FF 00    AND #$00FF              ; |
$01/B061 0A          ASL A                   ; |
$01/B062 0A          ASL A                   ; | Set midway X position in a level
$01/B063 0A          ASL A                   ; |
$01/B064 0A          ASL A                   ; |
$01/B065 8D 8C 60    STA $608C  [$00:608C]   ;/
$01/B068 BF 02 7E 7F LDA $7F7E02,x[$7F:7E02] ;\
$01/B06C 29 FF 00    AND #$00FF              ; |
$01/B06F 0A          ASL A                   ; |
$01/B070 0A          ASL A                   ; | Set midway Y position in a level
$01/B071 0A          ASL A                   ; |
$01/B072 0A          ASL A                   ; |
$01/B073 8D 90 60    STA $6090  [$00:6090]   ;/
$01/B076 BF 03 7E 7F LDA $7F7E03,x[$7F:7E03] ;
$01/B07A 29 FF 00    AND #$00FF              ;
$01/B07D 8D AC 60    STA $60AC  [$00:60AC]   ;

$01/B080 BF 00 7E 7F LDA $7F7E00,x[$7F:7E00] ; Level you start in after a midring
$01/B084 29 FF 00    AND #$00FF              ;\
$01/B087 0A          ASL A                   ; |
$01/B088 85 00       STA $00    [$00:0000]   ; | Sets the level number as an index for object and sprite data
$01/B08A 0A          ASL A                   ; |
$01/B08B 65 00       ADC $00    [$00:0000]   ; |
$01/B08D AA          TAX                     ;/
$01/B08E BF C3 F7 17 LDA $17F7C3,x[$17:F7C3] ;\
$01/B092 85 32       STA $32    [$00:0032]   ; | Set up the pointer to the current level's header
$01/B094 BF C4 F7 17 LDA $17F7C4,x[$17:F7C4] ; |
$01/B098 85 33       STA $33    [$00:0033]   ;/
$01/B09A BF C6 F7 17 LDA $17F7C6,x[$17:F7C6] ;
$01/B09E 8F 00 26 70 STA $702600[$70:2600]   ;
$01/B0A2 BF C8 F7 17 LDA $17F7C8,x[$17:F7C8] ;
$01/B0A6 29 FF 00    AND #$00FF              ;
$01/B0A9 8F 02 26 70 STA $702602[$70:2602]   ;

$01/B0AD 9C 85 03    STZ $0385  [$00:0385]   ;
$01/B0B0 E2 30       SEP #$30                ;
$01/B0B2 22 15 8B 10 JSL $108B15[$10:8B15]   ; unpack header info
$01/B0B6 C2 20       REP #$20                ;
$01/B0B8 A9 B0 07    LDA #$07B0              ;
$01/B0BB AE 3E 01    LDX $013E  [$00:013E]   ;
$01/B0BE E0 13       CPX #$13                ;
$01/B0C0 F0 07       BEQ $07    [$B0C9]      ;
$01/B0C2 E0 1D       CPX #$1D                ;
$01/B0C4 D0 06       BNE $06    [$B0CC]      ;
$01/B0C6 A9 00 07    LDA #$0700              ;
$01/B0C9 8D BC 61    STA $61BC  [$00:61BC]   ;
$01/B0CC E2 20       SEP #$20                ;
$01/B0CE AD 1A 02    LDA $021A  [$00:021A]   ;
$01/B0D1 C9 0B       CMP #$0B                ;
$01/B0D3 D0 05       BNE $05    [$B0DA]      ;
$01/B0D5 A9 11       LDA #$11                ;
$01/B0D7 8D 4E 01    STA $014E  [$00:014E]   ;
$01/B0DA 22 46 85 00 JSL $008546[$00:8546]   ;
$01/B0DE AD 46 01    LDA $0146  [$00:0146]   ;
$01/B0E1 C9 09       CMP #$09                ;
$01/B0E3 D0 05       BNE $05    [$B0EA]      ;
$01/B0E5 20 35 B3    JSR $B335  [$00:B335]   ;
$01/B0E8 80 2E       BRA $2E    [$B118]      ;

$01/B0EA C9 0A       CMP #$0A                ;
$01/B0EC D0 0A       BNE $0A    [$B0F8]      ;
$01/B0EE 22 D3 B4 00 JSL $00B4D3[$00:B4D3]   ;
$01/B0F2 22 90 BB 00 JSL $00BB90[$00:BB90]   ;
$01/B0F6 80 20       BRA $20    [$B118]      ;

$01/B0F8 22 39 B3 00 JSL $00B339[$00:B339]   ;
$01/B0FC 22 71 D5 00 JSL $00D571[$00:D571]   ;
$01/B100 AD 36 01    LDA $0136  [$00:0136]   ;
$01/B103 C9 03       CMP #$03                ;
$01/B105 D0 03       BNE $03    [$B10A]      ;
$01/B107 20 A3 B4    JSR $B4A3  [$00:B4A3]   ;
$01/B10A 22 24 BA 00 JSL $00BA24[$00:BA24]   ;
$01/B10E AC 46 01    LDY $0146  [$00:0146]   ;
$01/B111 BE 80 AF    LDX $AF80,y[$00:AF80]   ; table
$01/B114 22 A2 BD 00 JSL $00BDA2[$00:BDA2]   ;

$01/B118 22 B3 D5 01 JSL $01D5B3[$01:D5B3]   ;
$01/B11C AD 46 01    LDA $0146  [$00:0146]   ;
$01/B11F C9 09       CMP #$09                ;
$01/B121 F0 0A       BEQ $0A    [$B12D]      ;
$01/B123 C9 0A       CMP #$0A                ;
$01/B125 F0 06       BEQ $06    [$B12D]      ;
$01/B127 20 0A E8    JSR $E80A  [$00:E80A]   ;
$01/B12A 20 F5 E9    JSR $E9F5  [$00:E9F5]   ;
$01/B12D 22 26 BE 00 JSL $00BE26[$00:BE26]   ;
$01/B131 AD 8C 03    LDA $038C  [$00:038C]   ;
$01/B134 F0 03       BEQ $03    [$B139]      ;
$01/B136 4C F3 B1    JMP $B1F3  [$00:B1F3]   ;

$01/B139 A9 0F       LDA #$0F                ;
$01/B13B 8D 00 02    STA $0200  [$00:0200]   ;
$01/B13E A9 01       LDA #$01                ;
$01/B140 8D 01 02    STA $0201  [$00:0201]   ;
$01/B143 22 D6 8F 10 JSL $108FD6[$10:8FD6]   ;
$01/B147 A2 7F       LDX #$7F                ;
$01/B149 9E AA 6C    STZ $6CAA,x[$00:6CAA]   ;
$01/B14C CA          DEX                     ;
$01/B14D 10 FA       BPL $FA    [$B149]      ;
$01/B14F C2 20       REP #$20                ;
$01/B151 AD 8C 60    LDA $608C  [$00:608C]   ;\
$01/B154 38          SEC                     ; | yoshi's x-position -= #$0090
$01/B155 E9 90 00    SBC #$0090              ; |
$01/B158 8D 8C 60    STA $608C  [$00:608C]   ;/
$01/B15B 18          CLC                     ;
$01/B15C 69 18 00    ADC #$0018              ;
$01/B15F 8D 94 60    STA $6094  [$00:6094]   ;
$01/B162 AD 90 60    LDA $6090  [$00:6090]   ;\
$01/B165 38          SEC                     ; | yoshi's y-position -= #$0094
$01/B166 E9 94 00    SBC #$0094              ; |
$01/B169 8D 9C 60    STA $609C  [$00:609C]   ;/
$01/B16C EE C0 60    INC $60C0  [$00:60C0]   ;
$01/B16F 22 28 DC 04 JSL $04DC28[$04:DC28]   ;
$01/B173 C2 20       REP #$20                ;
$01/B175 A9 06 00    LDA #$0006              ;
$01/B178 8D C0 60    STA $60C0  [$00:60C0]   ;
$01/B17B A9 80 02    LDA #$0280              ;
$01/B17E 8D B4 60    STA $60B4  [$00:60B4]   ;
$01/B181 A9 00 FC    LDA #$FC00              ;
$01/B184 8D AA 60    STA $60AA  [$00:60AA]   ;
$01/B187 A9 16 00    LDA #$0016              ;
$01/B18A 8D AC 60    STA $60AC  [$00:60AC]   ;
$01/B18D E2 20       SEP #$20                ;
$01/B18F 22 7B B2 01 JSL $01B27B[$01:B27B]   ;
$01/B193 A9 01       LDA #$01                ;
$01/B195 8D 54 0B    STA $0B54  [$00:0B54]   ;
$01/B198 C2 20       REP #$20                ;
$01/B19A A9 02 00    LDA #$0002              ;
$01/B19D 8D 21 01    STA $0121  [$00:0121]   ;
$01/B1A0 A9 20 01    LDA #$0120              ;
$01/B1A3 8D 4C 0B    STA $0B4C  [$00:0B4C]   ;
$01/B1A6 22 49 8F 10 JSL $108F49[$10:8F49]   ;
$01/B1AA A9 03       LDA #$03                ;
$01/B1AC 85 4D       STA $4D    [$00:004D]   ;
$01/B1AE A9 02       LDA #$02                ;
$01/B1B0 8D 25 01    STA $0125  [$01:0125]   ;
$01/B1B3 A9 50       LDA #$50                ;\ set h-timer low byte
$01/B1B5 8D 07 42    STA $4207  [$01:4207]   ;/
$01/B1B8 A9 D8       LDA #$D8                ;\ set v-timer low byte
$01/B1BA 8D 09 42    STA $4209  [$01:4209]   ;/
$01/B1BD A9 B1       LDA #$B1                ;\ set all IRQ flags
$01/B1BF 8D 00 42    STA $4200  [$01:4200]   ;/
$01/B1C2 22 61 8B 10 JSL $108B61[$10:8B61]   ;
$01/B1C6 C2 20       REP #$20                ;
$01/B1C8 AD 23 0D    LDA $0D23  [$01:0D23]   ;
$01/B1CB C9 C0 00    CMP #$00C0              ;
$01/B1CE 90 F8       BCC $F8    [$B1C8]      ;
$01/B1D0 A9 FF 7F    LDA #$7FFF              ;
$01/B1D3 8F 04 21 70 STA $702104[$70:2104]   ;
$01/B1D7 E2 20       SEP #$20                ;
$01/B1D9 9C 21 01    STZ $0121  [$01:0121]   ;
$01/B1DC C2 20       REP #$20                ;
$01/B1DE A5 3B       LDA $3B    [$00:003B]   ;
$01/B1E0 8D A6 60    STA $60A6  [$00:60A6]   ;
$01/B1E3 A5 39       LDA $39    [$00:0039]   ;
$01/B1E5 38          SEC                     ;
$01/B1E6 E9 00 01    SBC #$0100              ;
$01/B1E9 8D A4 60    STA $60A4  [$00:60A4]   ;
$01/B1EC E2 20       SEP #$20                ;
$01/B1EE EE 18 01    INC $0118  [$00:0118]   ; change game mode
$01/B1F1 80 3C       BRA $3C    [$B22F]      ;

$01/B1F3 3A          DEC A                   ;
$01/B1F4 D0 04       BNE $04    [$B1FA]      ;
$01/B1F6 22 61 8B 10 JSL $108B61[$10:8B61]   ;
$01/B1FA 22 68 DB 04 JSL $04DB68[$04:DB68]   ;
$01/B1FE 22 4E 95 03 JSL $03954E[$03:954E]   ;
$01/B202 AD 1A 7E    LDA $7E1A  [$00:7E1A]   ;
$01/B205 C9 0F       CMP #$0F                ;
$01/B207 F0 08       BEQ $08    [$B211]      ;
$01/B209 22 C4 DC 04 JSL $04DCC4[$04:DCC4]   ;
$01/B20D 22 4E 95 03 JSL $03954E[$03:954E]   ;
$01/B211 22 D6 8F 10 JSL $108FD6[$10:8FD6]   ;
$01/B215 9C 8C 03    STZ $038C  [$00:038C]   ;
$01/B218 9C 21 01    STZ $0121  [$00:0121]   ;
$01/B21B A9 02       LDA #$02                ;
$01/B21D 8D 25 01    STA $0125  [$00:0125]   ;
$01/B220 A9 50       LDA #$50                ;\ set h-timer low byte
$01/B222 8D 07 42    STA $4207  [$00:4207]   ;/
$01/B225 A9 D8       LDA #$D8                ;\ set v-timer low byte
$01/B227 8D 09 42    STA $4209  [$00:4209]   ;/
$01/B22A A9 B1       LDA #$B1                ;\ set all IRQ flags
$01/B22C 8D 00 42    STA $4200  [$00:4200]   ;/
$01/B22F C2 30       REP #$30                ;
$01/B231 22 F9 DC 04 JSL $04DCF9[$04:DCF9]   ;
$01/B235 E2 30       SEP #$30                ;
$01/B237 AD 5E 09    LDA $095E  [$00:095E]   ;
$01/B23A 29 07       AND #$07                ;
$01/B23C C9 02       CMP #$02                ;
$01/B23E D0 03       BNE $03    [$B243]      ;
$01/B240 EE CA 61    INC $61CA  [$00:61CA]   ;
$01/B243 22 5E B2 01 JSL $01B25E[$01:B25E]   ;
$01/B247 5C E2 83 10 JMP $1083E2[$10:83E2]   ;

; table of music values to use for each level music setting
DATA_01B24B:         db $01, $01, $01, $01
DATA_01B24F:         db $01, $09, $01, $01
DATA_01B253:         db $09, $0C, $01, $02
DATA_01B257:         db $00, $01, $00, $00
DATA_01B25B:         db $00, $02, $01

; l sub
$01/B25E 08          PHP
$01/B25F E2 30       SEP #$30                ;
$01/B261 AD 05 02    LDA $0205  [$00:0205]   ;
$01/B264 D0 0D       BNE $0D    [$B273]      ;
$01/B266 AE 03 02    LDX $0203  [$00:0203]   ;
$01/B269 BF 4A B2 01 LDA $01B24A,x[$01:B24A] ; table
$01/B26D 8D 4D 00    STA $004D  [$00:004D]   ;
$01/B270 8D 05 02    STA $0205  [$00:0205]   ;
$01/B273 9C 53 00    STZ $0053  [$00:0053]   ;
$01/B276 9C 57 00    STZ $0057  [$00:0057]   ;
$01/B279 28          PLP                     ;
$01/B27A 6B          RTL                     ;

$01/B27B A9 70       LDA #$70                ;
$01/B27D 85 22       STA $22    [$00:0022]   ;
$01/B27F C2 20       REP #$20                ;
$01/B281 A9 00 58    LDA #$5800              ;
$01/B284 85 20       STA $20    [$00:0020]   ;
$01/B286 A9 00 08    LDA #$0800              ;
$01/B289 A0 00       LDY #$00                ;
$01/B28B 22 AB 82 00 JSL $0082AB[$00:82AB]   ;
$01/B28F E2 20       SEP #$20                ;
$01/B291 6B          RTL                     ;

$01/B292 C2 30       REP #$30                ;
$01/B294 A2 0C 02    LDX #$020C              ;
$01/B297 BF A6 79 7E LDA $7E79A6,x[$7E:79A6] ;
$01/B29B 9D B2 03    STA $03B2,x[$00:03B2]   ;
$01/B29E CA          DEX                     ;
$01/B29F CA          DEX                     ;
$01/B2A0 10 F5       BPL $F5    [$B297]      ;
$01/B2A2 9C F6 7D    STZ $7DF6  [$00:7DF6]   ;
$01/B2A5 A2 0C 00    LDX #$000C              ;
$01/B2A8 BF B0 7B 7E LDA $7E7BB0,x[$7E:7BB0] ;
$01/B2AC 9F 98 5D 7E STA $7E5D98,x[$7E:5D98] ;
$01/B2B0 CA          DEX                     ;
$01/B2B1 CA          DEX                     ;
$01/B2B2 10 F4       BPL $F4    [$B2A8]      ;
$01/B2B4 E2 30       SEP #$30                ;
$01/B2B6 60          RTS                     ;

$01/B2B7 08          PHP                     ;
$01/B2B8 C2 20       REP #$20                ;
$01/B2BA E2 10       SEP #$10                ;
$01/B2BC AD F6 7D    LDA $7DF6  [$00:7DF6]   ;
$01/B2BF 8F 98 5D 7E STA $7E5D98[$7E:5D98]   ;
$01/B2C3 F0 0F       BEQ $0F    [$B2D4]      ;
$01/B2C5 AA          TAX                     ;
$01/B2C6 BC F6 7D    LDY $7DF6,x[$00:7DF6]   ;
$01/B2C9 B9 60 73    LDA $7360,y[$00:7360]   ;
$01/B2CC 9F 98 5D 7E STA $7E5D98,x[$7E:5D98] ;
$01/B2D0 CA          DEX                     ;
$01/B2D1 CA          DEX                     ;
$01/B2D2 D0 F2       BNE $F2    [$B2C6]      ;
$01/B2D4 28          PLP                     ;
$01/B2D5 6B          RTL                     ;

$01/B2D6 08          PHP                     ;
$01/B2D7 C2 20       REP #$20                ;
$01/B2D9 E2 10       SEP #$10                ;
$01/B2DB 9C F6 7D    STZ $7DF6  [$00:7DF6]   ;
$01/B2DE AF 98 5D 7E LDA $7E5D98[$7E:5D98]   ;
$01/B2E2 F0 4F       BEQ $4F    [$B333]      ;
$01/B2E4 85 00       STA $00    [$00:0000]   ;
$01/B2E6 0B          PHD                     ;
$01/B2E7 A9 60 79    LDA #$7960              ;
$01/B2EA 5B          TCD                     ;
$01/B2EB A2 00       LDX #$00                ;
$01/B2ED DA          PHX                     ;
$01/B2EE BF 9A 5D 7E LDA $7E5D9A,x[$7E:5D9A] ;
$01/B2F2 C9 29 00    CMP #$0029              ;
$01/B2F5 F0 2C       BEQ $2C    [$B323]      ;
$01/B2F7 22 64 A3 03 JSL $03A364[$03:A364]   ;
$01/B2FB 90 26       BCC $26    [$B323]      ;
$01/B2FD BB          TYX                     ;
$01/B2FE AD 8C 60    LDA $608C  [$00:608C]   ;
$01/B301 9D E2 70    STA $70E2,x[$00:70E2]   ;
$01/B304 AD 90 60    LDA $6090  [$00:6090]   ;
$01/B307 18          CLC                     ;
$01/B308 69 10 00    ADC #$0010              ;
$01/B30B 9D 82 71    STA $7182,x[$00:7182]   ;
$01/B30E BD 42 70    LDA $7042,x[$00:7042]   ;
$01/B311 29 CF 00    AND #$00CF              ;
$01/B314 0D 26 61    ORA $6126  [$00:6126]   ;
$01/B317 9D 42 70    STA $7042,x[$00:7042]   ;
$01/B31A 86 12       STX $12    [$00:0012]   ;
$01/B31C 22 B9 BE 03 JSL $03BEB9[$03:BEB9]   ;
$01/B320 9C 57 00    STZ $0057  [$00:0057]   ;
$01/B323 FA          PLX                     ;
$01/B324 E8          INX                     ;
$01/B325 E8          INX                     ;
$01/B326 EC 00 00    CPX $0000  [$00:0000]   ;
$01/B329 90 C2       BCC $C2    [$B2ED]      ;
$01/B32B 2B          PLD                     ;
$01/B32C A9 00 00    LDA #$0000              ;
$01/B32F 8F 98 5D 7E STA $7E5D98[$7E:5D98]   ;
$01/B333 28          PLP                     ;
$01/B334 6B          RTL                     ;

$01/B335 22 24 BA 00 JSL $00BA24[$00:BA24]   ;
$01/B339 A9 B9       LDA #$B9                ;
$01/B33B 85 10       STA $10    [$00:0010]   ;
$01/B33D A9 BA       LDA #$BA                ;
$01/B33F 85 11       STA $11    [$00:0011]   ;
$01/B341 A9 BB       LDA #$BB                ;
$01/B343 85 12       STA $12    [$00:0012]   ;
$01/B345 A9 BC       LDA #$BC                ;
$01/B347 85 13       STA $13    [$00:0013]   ;
$01/B349 A9 BD       LDA #$BD                ;
$01/B34B 85 14       STA $14    [$00:0014]   ;
$01/B34D C2 30       REP #$30                ;
$01/B34F A2 00 00    LDX #$0000              ;
$01/B352 BF EA E3 5F LDA $5FE3EA,x[$5F:E3EA] ;
$01/B356 9F 00 20 70 STA $702000,x[$70:2000] ;
$01/B35A 9F 6C 2D 70 STA $702D6C,x[$70:2D6C] ;
$01/B35E BF 0A E4 5F LDA $5FE40A,x[$5F:E40A] ;
$01/B362 9F 20 20 70 STA $702020,x[$70:2020] ;
$01/B366 9F 8C 2D 70 STA $702D8C,x[$70:2D8C] ;
$01/B36A BF 2A E4 5F LDA $5FE42A,x[$5F:E42A] ;
$01/B36E 9F 40 20 70 STA $702040,x[$70:2040] ;
$01/B372 9F AC 2D 70 STA $702DAC,x[$70:2DAC] ;
$01/B376 BF 4A E4 5F LDA $5FE44A,x[$5F:E44A] ;
$01/B37A 9F 60 20 70 STA $702060,x[$70:2060] ;
$01/B37E 9F CC 2D 70 STA $702DCC,x[$70:2DCC] ;
$01/B382 BF 6A E4 5F LDA $5FE46A,x[$5F:E46A] ;
$01/B386 9F 80 20 70 STA $702080,x[$70:2080] ;
$01/B38A 9F EC 2D 70 STA $702DEC,x[$70:2DEC] ;
$01/B38E E8          INX                     ;
$01/B38F E8          INX                     ;
$01/B390 E0 20 00    CPX #$0020              ;
$01/B393 90 BD       BCC $BD    [$B352]      ;
$01/B395 E2 20       SEP #$20                ;
$01/B397 A9 2D       LDA #$2D                ;
$01/B399 8D B6 6E    STA $6EB6  [$01:6EB6]   ;
$01/B39C 85 15       STA $15    [$00:0015]   ;
$01/B39E A9 1B       LDA #$1B                ;
$01/B3A0 8D B7 6E    STA $6EB7  [$01:6EB7]   ;
$01/B3A3 85 16       STA $16    [$00:0016]   ;
$01/B3A5 A9 1C       LDA #$1C                ;
$01/B3A7 8D B8 6E    STA $6EB8  [$01:6EB8]   ;
$01/B3AA 85 17       STA $17    [$00:0017]   ;
$01/B3AC A9 34       LDA #$34                ;
$01/B3AE 8D B9 6E    STA $6EB9  [$01:6EB9]   ;
$01/B3B1 85 18       STA $18    [$00:0018]   ;
$01/B3B3 85 19       STA $19    [$00:0019]   ;
$01/B3B5 85 1A       STA $1A    [$00:001A]   ;
$01/B3B7 A9 FF       LDA #$FF                ;
$01/B3B9 8D BA 6E    STA $6EBA  [$01:6EBA]   ;
$01/B3BC 8D BB 6E    STA $6EBB  [$01:6EBB]   ;
$01/B3BF A0 54 01    LDY #$0154              ;
$01/B3C2 22 EE B3 00 JSL $00B3EE[$00:B3EE]   ;
$01/B3C6 E2 10       SEP #$10                ;
$01/B3C8 AC 46 01    LDY $0146  [$01:0146]   ;
$01/B3CB BE 80 AF    LDX $AF80,y[$01:C1C2]   ;
$01/B3CE 22 A2 BD 00 JSL $00BDA2[$00:BDA2]   ;
$01/B3D2 C2 20       REP #$20                ;
$01/B3D4 A9 80 00    LDA #$0080              ;
$01/B3D7 8D 41 00    STA $0041  [$01:0041]   ;
$01/B3DA 8D 98 60    STA $6098  [$01:6098]   ;
$01/B3DD 8D 43 00    STA $0043  [$01:0043]   ;
$01/B3E0 8D A0 60    STA $60A0  [$01:60A0]   ;
$01/B3E3 A9 00 01    LDA #$0100              ;
$01/B3E6 8D 57 09    STA $0957  [$01:0957]   ;
$01/B3E9 A9 F8 00    LDA #$00F8              ;
$01/B3EC 8D 59 09    STA $0959  [$01:0959]   ;
$01/B3EF EE 1E 0C    INC $0C1E  [$01:0C1E]   ;
$01/B3F2 EE 20 0C    INC $0C20  [$01:0C20]   ;
$01/B3F5 22 03 B4 01 JSL $01B403[$01:B403]   ;
$01/B3F9 A9 0C 00    LDA #$000C              ;
$01/B3FC 22 4C A3 03 JSL $03A34C[$03:A34C]   ;
$01/B400 E2 20       SEP #$20                ;
$01/B402 60          RTS                     ;

$01/B403 22 7C B4 01 JSL $01B47C[$01:B47C]   ;
$01/B407 AD AC 60    LDA $60AC  [$01:60AC]   ;
$01/B40A C9 20 00    CMP #$0020              ;
$01/B40D F0 6C       BEQ $6C    [$B47B]      ;
$01/B40F AD 8C 60    LDA $608C  [$01:608C]   ;
$01/B412 C9 20 01    CMP #$0120              ;
$01/B415 10 04       BPL $04    [$B41B]      ;
$01/B417 18          CLC                     ;
$01/B418 69 40 01    ADC #$0140              ;
$01/B41B C9 60 02    CMP #$0260              ;
$01/B41E 30 04       BMI $04    [$B424]      ;
$01/B420 38          SEC                     ;
$01/B421 E9 40 01    SBC #$0140              ;
$01/B424 8D 8C 60    STA $608C  [$01:608C]   ;
$01/B427 38          SEC                     ;
$01/B428 E9 20 01    SBC #$0120              ;
$01/B42B E2 20       SEP #$20                ;
$01/B42D 8D 02 42    STA $4202  [$01:4202]   ;
$01/B430 A0 CD       LDY #$CD                ;
$01/B432 8C 03 42    STY $4203  [$01:4203]   ;
$01/B435 EA          NOP                     ;
$01/B436 EA          NOP                     ;
$01/B437 A9 A0       LDA #$A0                ;
$01/B439 18          CLC                     ;
$01/B43A 6D 16 42    ADC $4216  [$01:4216]   ;
$01/B43D AD 17 42    LDA $4217  [$01:4217]   ;
$01/B440 69 00       ADC #$00                ;
$01/B442 48          PHA                     ;
$01/B443 EB          XBA                     ;
$01/B444 8D 02 42    STA $4202  [$01:4202]   ;
$01/B447 8C 03 42    STY $4203  [$01:4203]   ;
$01/B44A EA          NOP                     ;
$01/B44B EA          NOP                     ;
$01/B44C 68          PLA                     ;
$01/B44D 18          CLC                     ;
$01/B44E 6D 16 42    ADC $4216  [$01:4216]   ;
$01/B451 38          SEC                     ;
$01/B452 E9 1A       SBC #$1A                ;
$01/B454 29 FF       AND #$FF                ;
$01/B456 8D 05 0D    STA $0D05  [$01:0D05]   ;
$01/B459 C2 20       REP #$20                ;
$01/B45B AD 8C 60    LDA $608C  [$01:608C]   ;
$01/B45E 38          SEC                     ;
$01/B45F E9 78 00    SBC #$0078              ;
$01/B462 8D 23 0C    STA $0C23  [$01:0C23]   ;
$01/B465 8D 39 00    STA $0039  [$01:0039]   ;
$01/B468 8D 94 60    STA $6094  [$01:6094]   ;
$01/B46B AD A0 60    LDA $60A0  [$01:60A0]   ;
$01/B46E 18          CLC                     ;
$01/B46F 69 26 00    ADC #$0026              ;
$01/B472 8D 27 0C    STA $0C27  [$01:0C27]   ;
$01/B475 8D 3B 00    STA $003B  [$01:003B]   ;
$01/B478 8D 9C 60    STA $609C  [$01:609C]   ;
$01/B47B 6B          RTL                     ;

$01/B47C DA          PHX                     ;
$01/B47D AD 05 0D    LDA $0D05  [$01:0D05]   ;
$01/B480 29 FF 00    AND #$00FF              ;
$01/B483 0A          ASL A                   ;
$01/B484 C2 10       REP #$10                ;
$01/B486 AA          TAX                     ;
$01/B487 BF 54 E9 00 LDA $00E954,x[$00:EA53] ;
$01/B48B 8D 4F 09    STA $094F  [$01:094F]   ;
$01/B48E 8D 55 09    STA $0955  [$01:0955]   ;
$01/B491 BF D4 E9 00 LDA $00E9D4,x[$00:EAD3] ;
$01/B495 8D 51 09    STA $0951  [$01:0951]   ;
$01/B498 49 FF FF    EOR #$FFFF              ;
$01/B49B 1A          INC A                   ;
$01/B49C 8D 53 09    STA $0953  [$01:0953]   ;
$01/B49F E2 10       SEP #$10                ;
$01/B4A1 FA          PLX                     ;
$01/B4A2 6B          RTL                     ;

$01/B4A3 C2 20       REP #$20                ;
$01/B4A5 A2 80       LDX #$80                ;
$01/B4A7 8E 15 21    STX $2115  [$01:2115]   ;
$01/B4AA A9 01 18    LDA #$1801              ;
$01/B4AD 8D 00 43    STA $4300  [$01:4300]   ;
$01/B4B0 A2 52       LDX #$52                ;
$01/B4B2 8E 04 43    STX $4304  [$01:4304]   ;
$01/B4B5 A0 01       LDY #$01                ;
$01/B4B7 A9 80 42    LDA #$4280              ;
$01/B4BA 8D 16 21    STA $2116  [$01:2116]   ;
$01/B4BD A9 80 1D    LDA #$1D80              ;
$01/B4C0 8D 02 43    STA $4302  [$01:4302]   ;
$01/B4C3 A9 80 00    LDA #$0080              ;
$01/B4C6 8D 05 43    STA $4305  [$01:4305]   ;
$01/B4C9 8C 0B 42    STY $420B  [$01:420B]   ;
$01/B4CC 8D 05 43    STA $4305  [$01:4305]   ;
$01/B4CF A9 80 43    LDA #$4380              ;
$01/B4D2 8D 16 21    STA $2116  [$01:2116]   ;
$01/B4D5 A9 80 1F    LDA #$1F80              ;
$01/B4D8 8D 02 43    STA $4302  [$01:4302]   ;
$01/B4DB 8C 0B 42    STY $420B  [$01:420B]   ;
$01/B4DE E2 20       SEP #$20                ;
$01/B4E0 60          RTS                     ;

; .gamemode0D
$01/B4E1 A9 01       LDA #$01                ;
$01/B4E3 8D AE 61    STA $61AE  [$00:61AE]   ;
$01/B4E6 8D B0 61    STA $61B0  [$00:61B0]   ;
$01/B4E9 22 CE C0 01 JSL $01C0CE[$01:C0CE]   ;
$01/B4ED C2 20       REP #$20                ;
$01/B4EF AD 4A 0B    LDA $0B4A  [$00:0B4A]   ;
$01/B4F2 8D 02 30    STA $3002  [$00:3002]   ;
$01/B4F5 1A          INC A                   ;
$01/B4F6 8D 04 30    STA $3004  [$00:3004]   ;
$01/B4F9 AD 4C 0B    LDA $0B4C  [$00:0B4C]   ;
$01/B4FC 8D 0C 30    STA $300C  [$00:300C]   ;
$01/B4FF A2 08       LDX #$08                ;
$01/B501 A9 48 8E    LDA #$8E48              ;
$01/B504 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/B508 AD 4C 0B    LDA $0B4C  [$00:0B4C]   ;
$01/B50B 18          CLC                     ;
$01/B50C 69 08 00    ADC #$0008              ;
$01/B50F 8D 4C 0B    STA $0B4C  [$00:0B4C]   ;
$01/B512 C9 01 01    CMP #$0101              ;
$01/B515 90 31       BCC $31    [$B548]      ;
$01/B517 9C 4C 0B    STZ $0B4C  [$00:0B4C]   ;
$01/B51A EE 4A 0B    INC $0B4A  [$00:0B4A]   ;
$01/B51D AD 4A 0B    LDA $0B4A  [$00:0B4A]   ;
$01/B520 C9 02 00    CMP #$0002              ;
$01/B523 90 23       BCC $23    [$B548]      ;
$01/B525 E2 20       SEP #$20                ;
$01/B527 9C 69 09    STZ $0969  [$00:0969]   ;
$01/B52A 9C 6A 09    STZ $096A  [$00:096A]   ;
$01/B52D 9C 64 09    STZ $0964  [$00:0964]   ;
$01/B530 9C 65 09    STZ $0965  [$00:0965]   ;
$01/B533 9C 66 09    STZ $0966  [$00:0966]   ;
$01/B536 A9 20       LDA #$20                ;
$01/B538 1C 4A 09    TRB $094A  [$00:094A]   ;
$01/B53B 9C AE 61    STZ $61AE  [$00:61AE]   ;
$01/B53E 9C B0 61    STZ $61B0  [$00:61B0]   ;
$01/B541 EE 18 01    INC $0118  [$00:0118]   ;
$01/B544 5C E2 83 10 JMP $1083E2[$10:83E2]   ;

;
$01/B548 22 39 BE 00 JSL $00BE39[$00:BE39]   ;

; DMA args
DATA_01B54C:         dl $7E56D0, $703A02
DATA_01B552:         dw $0348

$01/B554 E2 20       SEP #$20                ;
$01/B556 A9 1F       LDA #$1F                ;
$01/B558 8D 69 09    STA $0969  [$00:0969]   ;
$01/B55B 8D 6A 09    STA $096A  [$00:096A]   ;
$01/B55E A9 33       LDA #$33                ;
$01/B560 8D 64 09    STA $0964  [$00:0964]   ;
$01/B563 8D 65 09    STA $0965  [$00:0965]   ;
$01/B566 8D 66 09    STA $0966  [$00:0966]   ;
$01/B569 9C 4C 09    STZ $094C  [$00:094C]   ;
$01/B56C 9C 2B 21    STZ $212B  [$00:212B]   ;
$01/B56F A9 20       LDA #$20                ;
$01/B571 0C 4A 09    TSB $094A  [$00:094A]   ;
$01/B574 A9 0F       LDA #$0F                ;
$01/B576 8D 00 02    STA $0200  [$00:0200]   ;
$01/B579 A9 01       LDA #$01                ;
$01/B57B 8D 01 02    STA $0201  [$00:0201]   ;
$01/B57E AB          PLB                     ;
$01/B57F 6B          RTL                     ;

.gamemode10
$01/B580 AE 57 0B    LDX $0B57  [$00:0B57]   ;
$01/B583 E0 0D       CPX #$0D                ;
$01/B585 B0 07       BCS $07    [$B58E]      ;
$01/B587 22 CE C0 01 JSL $01C0CE[$01:C0CE]   ;
$01/B58B AE 57 0B    LDX $0B57  [$00:0B57]   ;
$01/B58E FC 92 B5    JSR ($B592,x)[$00:00A2] ;

$01/B591 AB          PLB                     ;
$01/B592 6B          RTL                     ;

DATA_01B593:         dw $E2BF
DATA_01B595:         dw $B5D7
DATA_01B597:         dw $B5D7
DATA_01B599:         dw $B5D8
DATA_01B59B:         dw $E378
DATA_01B59D:         dw $E442
DATA_01B59F:         dw $B5E4
DATA_01B5A1:         dw $B6B9
DATA_01B5A3:         dw $B6C9
DATA_01B5A5:         dw $B95B
DATA_01B5A7:         dw $B9BA
DATA_01B5A9:         dw $E4A0
DATA_01B5AB:         dw $BA1C
DATA_01B5AD:         dw $BA2F
DATA_01B5AF:         dw $BA1C
DATA_01B5B1:         dw $BAD0
DATA_01B5B3:         dw $BA1C
DATA_01B5B5:         dw $BB5D
DATA_01B5B7:         dw $BA1C
DATA_01B5B9:         dw $BCBD
DATA_01B5BB:         dw $BA1C
DATA_01B5BD:         dw $BCF8
DATA_01B5BF:         dw $BA1C
DATA_01B5C1:         dw $BD50
DATA_01B5C3:         dw $BA1C
DATA_01B5C5:         dw $BDC3
DATA_01B5C7:         dw $BDCA
DATA_01B5C9:         dw $BA1C
DATA_01B5CB:         dw $BE00
DATA_01B5CD:         dw $BE63
DATA_01B5CF:         dw $BE9D

$01/B5D1 EE 57 0B    INC $0B57  [$00:0B57]   ;
$01/B5D4 EE 57 0B    INC $0B57  [$00:0B57]   ;
$01/B5D7 60          RTS                     ;

$01/B5D8 AD 4A 09    LDA $094A  [$00:094A]   ;
$01/B5DB 48          PHA                     ;
$01/B5DC 20 F0 E2    JSR $E2F0  [$00:E2F0]   ;
$01/B5DF 68          PLA                     ;
$01/B5E0 0C 4A 09    TSB $094A  [$00:094A]   ;
$01/B5E3 60          RTS                     ;

$01/B5E4 C2 20       REP #$20                ;
$01/B5E6 8B          PHB                     ;
$01/B5E7 A2 7E       LDX #$7E                ;
$01/B5E9 DA          PHX                     ;
$01/B5EA AB          PLB                     ;
$01/B5EB A2 00       LDX #$00                ;
$01/B5ED A9 7F 01    LDA #$017F              ;
$01/B5F0 9D A6 5D    STA $5DA6,x[$00:5DA6]   ;
$01/B5F3 9D A6 5E    STA $5EA6,x[$00:5EA6]   ;
$01/B5F6 9D A6 5F    STA $5FA6,x[$00:5FA6]   ;
$01/B5F9 9D A6 60    STA $60A6,x[$00:60A6]   ;
$01/B5FC 9D 26 61    STA $6126,x[$00:6126]   ;
$01/B5FF CA          DEX                     ;
$01/B600 CA          DEX                     ;
$01/B601 D0 ED       BNE $ED    [$B5F0]      ;
$01/B603 AB          PLB                     ;
$01/B604 A2 00       LDX #$00                ;
$01/B606 BD 59 B6    LDA $B659,x[$00:B659]   ;
$01/B609 9F 2E 5E 7E STA $7E5E2E,x[$7E:5E2E] ;
$01/B60D BD 89 B6    LDA $B689,x[$00:B689]   ;
$01/B610 9F EE 60 7E STA $7E60EE,x[$7E:60EE] ;
$01/B614 E8          INX                     ;
$01/B615 E8          INX                     ;
$01/B616 E0 30       CPX #$30                ;
$01/B618 90 EC       BCC $EC    [$B606]      ;
$01/B61A A9 04 00    LDA #$0004              ;
$01/B61D 8D 48 01    STA $0148  [$00:0148]   ;
$01/B620 9C 4A 01    STZ $014A  [$00:014A]   ;
$01/B623 E2 20       SEP #$20                ;
$01/B625 A9 0C       LDA #$0C                ;
$01/B627 8D 27 01    STA $0127  [$00:0127]   ;
$01/B62A 4C D1 B5    JMP $B5D1  [$00:B5D1]   ;

DATA_01B62D:         dw $6800, $40BF, $18EE, $68A0
DATA_01B635:         dw $447F, $1A11, $6860, $C029
DATA_01B63D:         dw $18EE, $6861, $C029, $18EE
DATA_01B645:         dw $687E, $C029, $18EE, $687F
DATA_01B64D:         dw $C029, $18EE, $6B00, $413F
DATA_01B655:         dw $18EE, $FFFF

DATA_01B659:         dw $0145, $0146, $8145, $C146
DATA_01B661:         dw $4145, $4146, $0145, $0146
DATA_01B669:         dw $8145, $8146, $4145, $0146
DATA_01B671:         dw $0145, $8146, $0145, $0146
DATA_01B679:         dw $0145, $0146, $8145, $C146
DATA_01B681:         dw $0145, $0146, $8145, $0146

DATA_01B689:         dw $0145, $0146, $8145, $8146
DATA_01B691:         dw $0145, $0146, $0145, $0146
DATA_01B699:         dw $8145, $8146, $0145, $8146
DATA_01B6A1:         dw $0145, $8146, $8145, $0146
DATA_01B6A9:         dw $4145, $0146, $8145, $0146
DATA_01B6B1:         dw $0145, $8146, $0145, $0146

$01/B6B9 A9 18       LDA #$18                ;
$01/B6BB 8D 27 01    STA $0127  [$00:0127]   ;
$01/B6BE 4C D1 B5    JMP $B5D1  [$00:B5D1]   ;

DATA_01B6C1:         dw $3400, $47FF, $117F, $FFFF

$01/B6C9 C2 30       REP #$30                ;
$01/B6CB A2 0A 00    LDX #$000A              ;
$01/B6CE A0 00 00    LDY #$0000              ;
$01/B6D1 64 00       STZ $00    [$00:0000]   ;
$01/B6D3 B9 D7 B7    LDA $B7D7,y[$00:B7D7]   ;
$01/B6D6 20 85 B7    JSR $B785  [$00:B785]   ;
$01/B6D9 C0 16 00    CPY #$0016              ;
$01/B6DC 90 F5       BCC $F5    [$B6D3]      ;
$01/B6DE 20 A1 B7    JSR $B7A1  [$00:B7A1]   ;
$01/B6E1 20 B3 B7    JSR $B7B3  [$00:B7B3]   ;
$01/B6E4 20 C5 B7    JSR $B7C5  [$00:B7C5]   ;
$01/B6E7 A2 CE 03    LDX #$03CE              ;
$01/B6EA A0 00 00    LDY #$0000              ;
$01/B6ED 64 00       STZ $00    [$00:0000]   ;
$01/B6EF B9 35 B8    LDA $B835,y[$00:B835]   ;
$01/B6F2 20 85 B7    JSR $B785  [$00:B785]   ;
$01/B6F5 C0 15 00    CPY #$0015              ;
$01/B6F8 90 F5       BCC $F5    [$B6EF]      ;
$01/B6FA E2 30       SEP #$30                ;
$01/B6FC AE 1A 02    LDX $021A  [$00:021A]   ;
$01/B6FF BD B8 02    LDA $02B8,x[$00:02BA]   ;
$01/B702 C2 30       REP #$30                ;
$01/B704 29 FF 00    AND #$00FF              ;
$01/B707 8D 0C 03    STA $030C  [$00:030C]   ;
$01/B70A 64 00       STZ $00    [$00:0000]   ;
$01/B70C AD 0C 03    LDA $030C  [$00:030C]   ;
$01/B70F C9 64 00    CMP #$0064              ;
$01/B712 90 08       BCC $08    [$B71C]      ;
$01/B714 A9 0B 00    LDA #$000B              ;
$01/B717 85 00       STA $00    [$00:0000]   ;
$01/B719 3A          DEC A                   ;
$01/B71A 80 0C       BRA $0C    [$B728]      ;

$01/B71C C9 0A 00    CMP #$000A              ;
$01/B71F 90 07       BCC $07    [$B728]      ;
$01/B721 E6 00       INC $00    [$00:0000]   ;
$01/B723 E9 0A 00    SBC #$000A              ;
$01/B726 80 F4       BRA $F4    [$B71C]      ;

$01/B728 0A          ASL A                   ;
$01/B729 A8          TAY                     ;
$01/B72A B9 AF B8    LDA $B8AF,y[$00:B8AF]   ;
$01/B72D 8F D4 5D 7E STA $7E5DD4[$7E:5DD4]   ;
$01/B731 B9 2D B9    LDA $B92D,y[$00:B92D]   ;
$01/B734 8F 14 5E 7E STA $7E5E14[$7E:5E14]   ;
$01/B738 A5 00       LDA $00    [$00:0000]   ;
$01/B73A 0A          ASL A                   ;
$01/B73B A8          TAY                     ;
$01/B73C B9 AF B8    LDA $B8AF,y[$00:B8AF]   ;
$01/B73F 8F D2 5D 7E STA $7E5DD2[$7E:5DD2]   ;
$01/B743 B9 2D B9    LDA $B92D,y[$00:B92D]   ;
$01/B746 8F 12 5E 7E STA $7E5E12[$7E:5E12]   ;
$01/B74A A9 56 00    LDA #$0056              ;
$01/B74D 85 01       STA $01    [$00:0001]   ;
$01/B74F A0 00 28    LDY #$2800              ;
$01/B752 A2 00 D0    LDX #$D000              ;
$01/B755 A9 00 08    LDA #$0800              ;
$01/B758 22 A6 BE 00 JSL $00BEA6[$00:BEA6]   ;
$01/B75C A9 52 00    LDA #$0052              ;
$01/B75F 85 01       STA $01    [$00:0001]   ;
$01/B761 A0 00 10    LDY #$1000              ;
$01/B764 A2 00 1E    LDX #$1E00              ;
$01/B767 A9 00 01    LDA #$0100              ;
$01/B76A 22 A6 BE 00 JSL $00BEA6[$00:BEA6]   ;
$01/B76E A9 52 00    LDA #$0052              ;
$01/B771 85 01       STA $01    [$00:0001]   ;
$01/B773 A0 00 11    LDY #$1100              ;
$01/B776 A2 C0 1E    LDX #$1EC0              ;
$01/B779 A9 00 01    LDA #$0100              ;
$01/B77C 22 A6 BE 00 JSL $00BEA6[$00:BEA6]   ;
$01/B780 E2 30       SEP #$30                ;
$01/B782 4C D1 B5    JMP $B5D1  [$00:B5D1]   ;

$01/B785 5A          PHY                     ;
$01/B786 29 FF 00    AND #$00FF              ;
$01/B789 A8          TAY                     ;
$01/B78A B9 5F B8    LDA $B85F,y[$00:B85F]   ;
$01/B78D 05 00       ORA $00    [$00:0000]   ;
$01/B78F 9F A6 5D 7E STA $7E5DA6,x[$7E:5DA8] ;
$01/B793 B9 DD B8    LDA $B8DD,y[$00:B8DD]   ;
$01/B796 05 00       ORA $00    [$00:0000]   ;
$01/B798 9F E6 5D 7E STA $7E5DE6,x[$7E:5DE8] ;
$01/B79C E8          INX                     ;
$01/B79D E8          INX                     ;
$01/B79E 7A          PLY                     ;
$01/B79F C8          INY                     ;
$01/B7A0 60          RTS                     ;

$01/B7A1 A2 08 01    LDX #$0108              ;
$01/B7A4 A0 00 00    LDY #$0000              ;
$01/B7A7 B9 ED B7    LDA $B7ED,y[$00:B7ED]   ;
$01/B7AA 20 85 B7    JSR $B785  [$00:B785]   ;
$01/B7AD C0 18 00    CPY #$0018              ;
$01/B7B0 90 F5       BCC $F5    [$B7A7]      ;
$01/B7B2 60          RTS                     ;

$01/B7B3 A2 C8 01    LDX #$01C8              ;
$01/B7B6 A0 00 00    LDY #$0000              ;
$01/B7B9 B9 05 B8    LDA $B805,y[$00:B805]   ;
$01/B7BC 20 85 B7    JSR $B785  [$00:B785]   ;
$01/B7BF C0 18 00    CPY #$0018              ;
$01/B7C2 90 F5       BCC $F5    [$B7B9]      ;
$01/B7C4 60          RTS                     ;

$01/B7C5 A2 88 02    LDX #$0288              ;
$01/B7C8 A0 00 00    LDY #$0000              ;
$01/B7CB B9 1D B8    LDA $B81D,y[$00:B81D]   ;
$01/B7CE 20 85 B7    JSR $B785  [$00:B785]   ;
$01/B7D1 C0 18 00    CPY #$0018              ;
$01/B7D4 90 F5       BCC $F5    [$B7CB]      ;
$01/B7D6 60          RTS                     ;

DATA_01B7D7:         db $3A, $3C, $4E, $0E, $10, $0C, $0E, $4E
DATA_01B7DF:         db $24, $04, $1C, $22, $08, $36, $36, $36
DATA_01B7E7:         db $36, $54, $5C, $4E, $3A, $3C

DATA_01B7ED:         db $3E, $40, $4E, $24, $26, $00, $22, $24
DATA_01B7F5:         db $36, $36, $36, $36, $36, $36, $50, $34
DATA_01B7FD:         db $56, $50, $68, $6A, $4E, $50, $6C, $6E

DATA_01B805:         db $46, $48, $4E, $04, $1C, $10, $1A, $24
DATA_01B80D:         db $36, $36, $36, $36, $36, $36, $50, $34
DATA_01B815:         db $54, $50, $68, $6A, $4E, $50, $6C, $6E

DATA_01B81D:         db $42, $44, $4E, $0A, $16, $1C, $2C, $08
DATA_01B825:         db $22, $24, $36, $36, $36, $36, $36, $50
DATA_01B82D:         db $34, $5A, $68, $6A, $4E, $50, $6C, $6E

DATA_01B835:         db $26, $1C, $26, $00, $16, $4E, $1E, $1C
DATA_01B83D:         db $10, $1A, $26, $24, $36, $36, $36, $36
DATA_01B845:         db $36, $36, $50, $6C, $6E

DATA_01B84A:         db $4E, $0E, $10, $0C, $0E, $4E, $24, $04
DATA_01B852:         db $1C, $22, $08, $36, $36, $36, $36, $36
DATA_01B85A:         db $36, $36, $50, $6C, $6E

DATA_01B85F:         dw $010A, $010B, $010C, $010D
DATA_01B867:         dw $010E, $4106, $0120, $0121
DATA_01B86F:         dw $0122, $0123, $0124, $C116
DATA_01B877:         dw $0126, $0127, $0109, $0128
DATA_01B87F:         dw $0129, $0128, $4102, $012C
DATA_01B887:         dw $012D, $012E, $8136, $0101
DATA_01B88F:         dw $0101, $0142, $0144, $0143
DATA_01B897:         dw $017F, $012A, $012B, $0548
DATA_01B89F:         dw $0549, $054A, $054B, $054C
DATA_01B8A7:         dw $054D, $054E, $054F, $017F

DATA_01B8AF:         dw $0109, $0100, $0102, $0102
DATA_01B8B7:         dw $0103, $0104, $0105, $0106
DATA_01B8BF:         dw $0107, $C115, $0168, $0167
DATA_01B8C7:         dw $0175, $0176, $017F, $017F
DATA_01B8CF:         dw $01C4, $010F, $01D6, $0164
DATA_01B8D7:         dw $0174, $016E, $017F

DATA_01B8DD:         dw $011A, $011B, $011C, $011D
DATA_01B8E5:         dw $011E, $011F, $0130, $0131
DATA_01B8ED:         dw $0132, $0133, $0134, $C106
DATA_01B8F5:         dw $0136, $0137, $0119, $0138
DATA_01B8FD:         dw $0139, $0140, $0112, $013C
DATA_01B905:         dw $013D, $013E, $8126, $0111
DATA_01B90D:         dw $013C, $C142, $C144, $017F
DATA_01B915:         dw $0141, $013A, $013B, $0508
DATA_01B91D:         dw $0518, $0525, $0535, $052F
DATA_01B925:         dw $053F, $050F, $0547, $017F

DATA_01B92D:         dw $0119, $0110, $C142, $0112
DATA_01B935:         dw $0113, $0114, $0115, $0116
DATA_01B93D:         dw $0117, $C105, $0178, $0177
DATA_01B945:         dw $0179, $017A, $015F, $017B
DATA_01B94D:         dw $01D4, $013D, $01D7, $011E
DATA_01B955:         dw $011E, $017E, $0158

$01/B95B C2 20       REP #$20                ;
$01/B95D 9C 92 03    STZ $0392  [$00:0392]   ;
$01/B960 9C 5F 0B    STZ $0B5F  [$00:0B5F]   ;
$01/B963 9C 61 0B    STZ $0B61  [$00:0B61]   ;
$01/B966 9C 63 0B    STZ $0B63  [$00:0B63]   ;
$01/B969 9C 81 03    STZ $0381  [$00:0381]   ;
$01/B96C E2 20       SEP #$20                ;
$01/B96E A9 0F       LDA #$0F                ;
$01/B970 8D 27 01    STA $0127  [$00:0127]   ;
$01/B973 4C D1 B5    JMP $B5D1  [$00:B5D1]   ;

DATA_01B976:         dw $6862, $0001, $1A02, $6863
DATA_01B97E:         dw $4033, $1A03, $687D, $0001
DATA_01B986:         dw $1A04, $6882, $C025, $1A05
DATA_01B98E:         dw $6883, $0001, $1A00, $6884
DATA_01B996:         dw $4031, $1A01, $689D, $C025
DATA_01B99E:         dw $1A15, $68A3, $C023, $1A10
DATA_01B9A6:         dw $6AE2, $0001, $1A12, $6AE3
DATA_01B9AE:         dw $4033, $1A13, $6AFD, $0001
DATA_01B9B6:         dw $1A14, $FFFF

$01/B9BA C2 30       REP #$30                ;
$01/B9BC A9 7E 00    LDA #$007E              ;
$01/B9BF 85 01       STA $01    [$00:0001]   ;
$01/B9C1 A0 A0 34    LDY #$34A0              ;
$01/B9C4 A2 A6 5D    LDX #$5DA6              ;
$01/B9C7 A9 80 04    LDA #$0480              ;
$01/B9CA 22 A6 BE 00 JSL $00BEA6[$00:BEA6]   ;
$01/B9CE A2 1C 00    LDX #$001C              ;
$01/B9D1 BF 94 C0 5F LDA $5FC094,x[$5F:C096] ;
$01/B9D5 9F 02 20 70 STA $702002,x[$70:2004] ;
$01/B9D9 BF 1A B3 5F LDA $5FB31A,x[$5F:B31C] ;
$01/B9DD 9F C2 20 70 STA $7020C2,x[$70:20C4] ;
$01/B9E1 BF 3A B3 5F LDA $5FB33A,x[$5F:B33C] ;
$01/B9E5 9F E2 20 70 STA $7020E2,x[$70:20E4] ;
$01/B9E9 CA          DEX                     ;
$01/B9EA CA          DEX                     ;
$01/B9EB 10 E4       BPL $E4    [$B9D1]      ;
$01/B9ED 64 39       STZ $39    [$00:0039]   ;
$01/B9EF 64 3B       STZ $3B    [$00:003B]   ;
$01/B9F1 64 41       STZ $41    [$00:0041]   ;
$01/B9F3 64 43       STZ $43    [$00:0043]   ;
$01/B9F5 9C 48 09    STZ $0948  [$00:0948]   ;
$01/B9F8 A9 00 00    LDA #$0000              ;
$01/B9FB 8F 00 20 70 STA $702000[$70:2000]   ;
$01/B9FF 9C 5B 0B    STZ $0B5B  [$00:0B5B]   ;
$01/BA02 9C 5D 0B    STZ $0B5D  [$00:0B5D]   ;
$01/BA05 E2 30       SEP #$30                ;
$01/BA07 AD 5E 09    LDA $095E  [$00:095E]   ;
$01/BA0A 29 0F       AND #$0F                ;
$01/BA0C 8D 5E 09    STA $095E  [$00:095E]   ;
$01/BA0F A9 04       LDA #$04                ;
$01/BA11 8D 67 09    STA $0967  [$00:0967]   ;
$01/BA14 A9 01       LDA #$01                ;
$01/BA16 8D 68 09    STA $0968  [$00:0968]   ;
$01/BA19 4C D1 B5    JMP $B5D1  [$00:B5D1]   ;

$01/BA1C 20 E4 BE    JSR $BEE4  [$00:BEE4]   ;
$01/BA1F CE 8B 03    DEC $038B  [$00:038B]   ;
$01/BA22 D0 0A       BNE $0A    [$BA2E]      ;
$01/BA24 20 D1 B5    JSR $B5D1  [$00:B5D1]   ;
$01/BA27 AD 57 0B    LDA $0B57  [$00:0B57]   ;
$01/BA2A C9 29       CMP #$29                ;
$01/BA2C B0 00       BCS $00    [$BA2E]      ;
$01/BA2E 60          RTS                     ;

$01/BA2F 20 E4 BE    JSR $BEE4  [$00:BEE4]   ;
$01/BA32 C2 30       REP #$30                ;
$01/BA34 AD B6 03    LDA $03B6  [$00:03B6]   ;
$01/BA37 38          SEC                     ;
$01/BA38 E9 0A 00    SBC #$000A              ;
$01/BA3B 8D B6 03    STA $03B6  [$00:03B6]   ;
$01/BA3E 10 29       BPL $29    [$BA69]      ;
$01/BA40 9C B6 03    STZ $03B6  [$00:03B6]   ;
$01/BA43 E2 30       SEP #$30                ;
$01/BA45 A9 20       LDA #$20                ;
$01/BA47 8D 8B 03    STA $038B  [$00:038B]   ;
$01/BA4A AD B4 03    LDA $03B4  [$00:03B4]   ;
$01/BA4D 0D B5 03    ORA $03B5  [$00:03B5]   ;
$01/BA50 D0 14       BNE $14    [$BA66]      ;
$01/BA52 20 D1 B5    JSR $B5D1  [$00:B5D1]   ;
$01/BA55 20 D1 B5    JSR $B5D1  [$00:B5D1]   ;
$01/BA58 AD B8 03    LDA $03B8  [$00:03B8]   ;
$01/BA5B 0D B9 03    ORA $03B9  [$00:03B9]   ;
$01/BA5E D0 06       BNE $06    [$BA66]      ;
$01/BA60 20 D1 B5    JSR $B5D1  [$00:B5D1]   ;
$01/BA63 20 D1 B5    JSR $B5D1  [$00:B5D1]   ;
$01/BA66 4C D1 B5    JMP $B5D1  [$00:B5D1]   ;

$01/BA69 64 02       STZ $02    [$00:0002]   ;
$01/BA6B EE 92 03    INC $0392  [$00:0392]   ;
$01/BA6E 9C 92 03    STZ $0392  [$00:0392]   ;
$01/BA71 AD 5F 0B    LDA $0B5F  [$00:0B5F]   ;
$01/BA74 1A          INC A                   ;
$01/BA75 C9 1E 00    CMP #$001E              ;
$01/BA78 90 0F       BCC $0F    [$BA89]      ;
$01/BA7A A9 00 04    LDA #$0400              ;
$01/BA7D 85 00       STA $00    [$00:0000]   ;
$01/BA7F 85 02       STA $02    [$00:0002]   ;
$01/BA81 20 A1 B7    JSR $B7A1  [$00:B7A1]   ;
$01/BA84 A9 1E 00    LDA #$001E              ;
$01/BA87 80 0C       BRA $0C    [$BA95]      ;

$01/BA89 48          PHA                     ;
$01/BA8A E2 30       SEP #$30                ;
$01/BA8C A9 5A       LDA #$5A                ;\ play sound #$005A
$01/BA8E 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/BA92 C2 30       REP #$30                ;
$01/BA94 68          PLA                     ;
$01/BA95 8D 5F 0B    STA $0B5F  [$00:0B5F]   ;
$01/BA98 A2 00 00    LDX #$0000              ;
$01/BA9B C9 0A 00    CMP #$000A              ;
$01/BA9E 90 06       BCC $06    [$BAA6]      ;
$01/BAA0 E8          INX                     ;
$01/BAA1 E9 0A 00    SBC #$000A              ;
$01/BAA4 80 F5       BRA $F5    [$BA9B]      ;

$01/BAA6 85 00       STA $00    [$00:0000]   ;
$01/BAA8 A9 7E 00    LDA #$007E              ;
$01/BAAB 85 06       STA $06    [$00:0006]   ;
$01/BAAD 85 09       STA $09    [$00:0009]   ;
$01/BAAF 85 12       STA $12    [$00:0012]   ;
$01/BAB1 85 15       STA $15    [$00:0015]   ;
$01/BAB3 A9 C8 5E    LDA #$5EC8              ;
$01/BAB6 85 04       STA $04    [$00:0004]   ;
$01/BAB8 18          CLC                     ;
$01/BAB9 69 0E 00    ADC #$000E              ;
$01/BABC 8D 10 00    STA $0010  [$00:0010]   ;
$01/BABF A9 08 5F    LDA #$5F08              ;
$01/BAC2 85 07       STA $07    [$00:0007]   ;
$01/BAC4 18          CLC                     ;
$01/BAC5 69 0E 00    ADC #$000E              ;
$01/BAC8 85 13       STA $13    [$00:0013]   ;
$01/BACA 20 D4 BB    JSR $BBD4  [$00:BBD4]   ;
$01/BACD E2 30       SEP #$30                ;
$01/BACF 60          RTS                     ;

$01/BAD0 20 E4 BE    JSR $BEE4  [$00:BEE4]   ;
$01/BAD3 C2 30       REP #$30                ;
$01/BAD5 AD 61 0B    LDA $0B61  [$00:0B61]   ;
$01/BAD8 C9 14 00    CMP #$0014              ;
$01/BADB B0 08       BCS $08    [$BAE5]      ;
$01/BADD CE B4 03    DEC $03B4  [$00:03B4]   ;
$01/BAE0 AD B4 03    LDA $03B4  [$00:03B4]   ;
$01/BAE3 10 18       BPL $18    [$BAFD]      ;
$01/BAE5 E2 30       SEP #$30                ;
$01/BAE7 A9 20       LDA #$20                ;
$01/BAE9 8D 8B 03    STA $038B  [$00:038B]   ;
$01/BAEC AD B8 03    LDA $03B8  [$00:03B8]   ;
$01/BAEF 0D B9 03    ORA $03B9  [$00:03B9]   ;
$01/BAF2 D0 06       BNE $06    [$BAFA]      ;
$01/BAF4 20 D1 B5    JSR $B5D1  [$00:B5D1]   ;
$01/BAF7 20 D1 B5    JSR $B5D1  [$00:B5D1]   ;
$01/BAFA 4C D1 B5    JMP $B5D1  [$00:B5D1]   ;

$01/BAFD 64 02       STZ $02    [$00:0002]   ;
$01/BAFF AD 61 0B    LDA $0B61  [$00:0B61]   ;
$01/BB02 1A          INC A                   ;
$01/BB03 C9 14 00    CMP #$0014              ;
$01/BB06 90 0F       BCC $0F    [$BB17]      ;
$01/BB08 A9 00 04    LDA #$0400              ;
$01/BB0B 85 00       STA $00    [$00:0000]   ;
$01/BB0D 85 02       STA $02    [$00:0002]   ;
$01/BB0F 20 B3 B7    JSR $B7B3  [$00:B7B3]   ;
$01/BB12 A9 14 00    LDA #$0014              ;
$01/BB15 80 0C       BRA $0C    [$BB23]      ;

$01/BB17 48          PHA                     ;
$01/BB18 E2 30       SEP #$30                ;
$01/BB1A A9 5A       LDA #$5A                ;\ play sound #$005A
$01/BB1C 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/BB20 C2 30       REP #$30                ;
$01/BB22 68          PLA                     ;
$01/BB23 8D 61 0B    STA $0B61  [$00:0B61]   ;
$01/BB26 A2 00 00    LDX #$0000              ;
$01/BB29 C9 0A 00    CMP #$000A              ;
$01/BB2C 90 06       BCC $06    [$BB34]      ;
$01/BB2E E8          INX                     ;
$01/BB2F E9 0A 00    SBC #$000A              ;
$01/BB32 80 F5       BRA $F5    [$BB29]      ;

$01/BB34 85 00       STA $00    [$00:0000]   ;
$01/BB36 A9 7E 00    LDA #$007E              ;
$01/BB39 85 06       STA $06    [$00:0006]   ;
$01/BB3B 85 09       STA $09    [$00:0009]   ;
$01/BB3D 85 12       STA $12    [$00:0012]   ;
$01/BB3F 85 15       STA $15    [$00:0015]   ;
$01/BB41 A9 88 5F    LDA #$5F88              ;
$01/BB44 85 04       STA $04    [$00:0004]   ;
$01/BB46 18          CLC                     ;
$01/BB47 69 0E 00    ADC #$000E              ;
$01/BB4A 85 10       STA $10    [$00:0010]   ;
$01/BB4C A9 C8 5F    LDA #$5FC8              ;
$01/BB4F 85 07       STA $07    [$00:0007]   ;
$01/BB51 18          CLC                     ;
$01/BB52 69 0E 00    ADC #$000E              ;
$01/BB55 85 13       STA $13    [$00:0013]   ;
$01/BB57 20 D4 BB    JSR $BBD4  [$00:BBD4]   ;
$01/BB5A E2 30       SEP #$30                ;
$01/BB5C 60          RTS                     ;

$01/BB5D 20 E4 BE    JSR $BEE4  [$00:BEE4]   ;
$01/BB60 C2 30       REP #$30                ;
$01/BB62 CE B8 03    DEC $03B8  [$00:03B8]   ;
$01/BB65 AD B8 03    LDA $03B8  [$00:03B8]   ;
$01/BB68 10 0D       BPL $0D    [$BB77]      ;
$01/BB6A 9C B8 03    STZ $03B8  [$00:03B8]   ;
$01/BB6D E2 30       SEP #$30                ;
$01/BB6F A9 20       LDA #$20                ;
$01/BB71 8D 8B 03    STA $038B  [$00:038B]   ;
$01/BB74 4C D1 B5    JMP $B5D1  [$00:B5D1]   ;

$01/BB77 64 02       STZ $02    [$00:0002]   ;
$01/BB79 AD 63 0B    LDA $0B63  [$00:0B63]   ;
$01/BB7C 18          CLC                     ;
$01/BB7D 69 0A 00    ADC #$000A              ;
$01/BB80 8D 63 0B    STA $0B63  [$00:0B63]   ;
$01/BB83 A2 00 00    LDX #$0000              ;
$01/BB86 C9 0A 00    CMP #$000A              ;
$01/BB89 90 06       BCC $06    [$BB91]      ;
$01/BB8B E8          INX                     ;
$01/BB8C E9 0A 00    SBC #$000A              ;
$01/BB8F 80 F5       BRA $F5    [$BB86]      ;

$01/BB91 E0 05 00    CPX #$0005              ;
$01/BB94 90 0C       BCC $0C    [$BBA2]      ;
$01/BB96 DA          PHX                     ;
$01/BB97 A9 00 04    LDA #$0400              ;
$01/BB9A 85 00       STA $00    [$00:0000]   ;
$01/BB9C 85 02       STA $02    [$00:0002]   ;
$01/BB9E 20 C5 B7    JSR $B7C5  [$00:B7C5]   ;
$01/BBA1 FA          PLX                     ;
$01/BBA2 A9 FF FF    LDA #$FFFF              ;
$01/BBA5 85 00       STA $00    [$00:0000]   ;
$01/BBA7 A9 7E 00    LDA #$007E              ;
$01/BBAA 85 06       STA $06    [$00:0006]   ;
$01/BBAC 85 09       STA $09    [$00:0009]   ;
$01/BBAE 85 12       STA $12    [$00:0012]   ;
$01/BBB0 85 15       STA $15    [$00:0015]   ;
$01/BBB2 A9 4C 60    LDA #$604C              ;
$01/BBB5 85 04       STA $04    [$00:0004]   ;
$01/BBB7 18          CLC                     ;
$01/BBB8 69 0A 00    ADC #$000A              ;
$01/BBBB 85 10       STA $10    [$00:0010]   ;
$01/BBBD A9 8C 60    LDA #$608C              ;
$01/BBC0 85 07       STA $07    [$00:0007]   ;
$01/BBC2 18          CLC                     ;
$01/BBC3 69 0A 00    ADC #$000A              ;
$01/BBC6 85 13       STA $13    [$00:0013]   ;
$01/BBC8 20 D4 BB    JSR $BBD4  [$00:BBD4]   ;
$01/BBCB E2 30       SEP #$30                ;
$01/BBCD A9 5A       LDA #$5A                ;\ play sound #$005A
$01/BBCF 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/BBD3 60          RTS                     ;

$01/BBD4 DA          PHX                     ;
$01/BBD5 8A          TXA                     ;
$01/BBD6 F0 14       BEQ $14    [$BBEC]      ;
$01/BBD8 0A          ASL A                   ;
$01/BBD9 AA          TAX                     ;
$01/BBDA BD AF B8    LDA $B8AF,x[$00:B8B1]   ;
$01/BBDD 05 02       ORA $02    [$00:0002]   ;
$01/BBDF 87 04       STA [$04]  [$00:4802]   ;
$01/BBE1 87 10       STA [$10]  [$00:0000]   ;
$01/BBE3 BD 2D B9    LDA $B92D,x[$00:B92F]   ;
$01/BBE6 05 02       ORA $02    [$00:0002]   ;
$01/BBE8 87 07       STA [$07]  [$00:2A00]   ;
$01/BBEA 87 13       STA [$13]  [$2C:AE0C]   ;
$01/BBEC A0 02 00    LDY #$0002              ;
$01/BBEF A5 00       LDA $00    [$00:0000]   ;
$01/BBF1 30 14       BMI $14    [$BC07]      ;
$01/BBF3 0A          ASL A                   ;
$01/BBF4 AA          TAX                     ;
$01/BBF5 BD AF B8    LDA $B8AF,x[$00:B8B1]   ;
$01/BBF8 05 02       ORA $02    [$00:0002]   ;
$01/BBFA 97 04       STA [$04],y[$00:4802]   ;
$01/BBFC 97 10       STA [$10],y[$00:0000]   ;
$01/BBFE BD 2D B9    LDA $B92D,x[$00:B92F]   ;
$01/BC01 05 02       ORA $02    [$00:0002]   ;
$01/BC03 97 07       STA [$07],y[$00:2A00]   ;
$01/BC05 97 13       STA [$13],y[$2C:AE0C]   ;
$01/BC07 FA          PLX                     ;
$01/BC08 A5 00       LDA $00    [$00:0000]   ;
$01/BC0A 10 02       BPL $02    [$BC0E]      ;
$01/BC0C 64 00       STZ $00    [$00:0000]   ;
$01/BC0E E6 00       INC $00    [$00:0000]   ;
$01/BC10 A5 13       LDA $13    [$00:0013]   ;
$01/BC12 18          CLC                     ;
$01/BC13 69 06 00    ADC #$0006              ;
$01/BC16 85 13       STA $13    [$00:0013]   ;
$01/BC18 20 AA BC    JSR $BCAA  [$00:BCAA]   ;
$01/BC1B 64 00       STZ $00    [$00:0000]   ;
$01/BC1D 64 02       STZ $02    [$00:0002]   ;
$01/BC1F A2 04 00    LDX #$0004              ;
$01/BC22 AD 5F 0B    LDA $0B5F  [$00:0B5F]   ;
$01/BC25 18          CLC                     ;
$01/BC26 6D 61 0B    ADC $0B61  [$00:0B61]   ;
$01/BC29 18          CLC                     ;
$01/BC2A 6D 63 0B    ADC $0B63  [$00:0B63]   ;
$01/BC2D C9 64 00    CMP #$0064              ;
$01/BC30 90 03       BCC $03    [$BC35]      ;
$01/BC32 A9 64 00    LDA #$0064              ;
$01/BC35 8D 81 03    STA $0381  [$00:0381]   ;
$01/BC38 C9 64 00    CMP #$0064              ;
$01/BC3B 90 08       BCC $08    [$BC45]      ;
$01/BC3D A9 0B 00    LDA #$000B              ;
$01/BC40 85 00       STA $00    [$00:0000]   ;
$01/BC42 3A          DEC A                   ;
$01/BC43 80 0C       BRA $0C    [$BC51]      ;

$01/BC45 C9 0A 00    CMP #$000A              ;
$01/BC48 90 07       BCC $07    [$BC51]      ;
$01/BC4A E6 00       INC $00    [$00:0000]   ;
$01/BC4C E9 0A 00    SBC #$000A              ;
$01/BC4F 80 F4       BRA $F4    [$BC45]      ;

$01/BC51 0A          ASL A                   ;
$01/BC52 AA          TAX                     ;
$01/BC53 BD AF B8    LDA $B8AF,x[$00:B8B1]   ;
$01/BC56 8F 98 61 7E STA $7E6198[$7E:6198]   ;
$01/BC5A BD 2D B9    LDA $B92D,x[$00:B92F]   ;
$01/BC5D 8F D8 61 7E STA $7E61D8[$7E:61D8]   ;
$01/BC61 A5 00       LDA $00    [$00:0000]   ;
$01/BC63 F0 10       BEQ $10    [$BC75]      ;
$01/BC65 0A          ASL A                   ;
$01/BC66 A8          TAY                     ;
$01/BC67 B9 AF B8    LDA $B8AF,y[$00:B8AF]   ;
$01/BC6A 8F 96 61 7E STA $7E6196[$7E:6196]   ;
$01/BC6E B9 2D B9    LDA $B92D,y[$00:B92D]   ;
$01/BC71 8F D6 61 7E STA $7E61D6[$7E:61D6]   ;
$01/BC75 A5 02       LDA $02    [$00:0002]   ;
$01/BC77 0A          ASL A                   ;
$01/BC78 A8          TAY                     ;
$01/BC79 F0 0E       BEQ $0E    [$BC89]      ;
$01/BC7B B9 AF B8    LDA $B8AF,y[$00:B8AF]   ;
$01/BC7E 8F 94 61 7E STA $7E6194[$7E:6194]   ;
$01/BC82 B9 2D B9    LDA $B92D,y[$00:B92D]   ;
$01/BC85 8F D4 61 7E STA $7E61D4[$7E:61D4]   ;
$01/BC89 8A          TXA                     ;
$01/BC8A 05 02       ORA $02    [$00:0002]   ;
$01/BC8C AA          TAX                     ;
$01/BC8D 64 02       STZ $02    [$00:0002]   ;
$01/BC8F A9 DC 61    LDA #$61DC              ;
$01/BC92 85 13       STA $13    [$00:0013]   ;
$01/BC94 20 AA BC    JSR $BCAA  [$00:BCAA]   ;
$01/BC97 A9 7E 00    LDA #$007E              ;
$01/BC9A 85 01       STA $01    [$00:0001]   ;
$01/BC9C A0 A0 34    LDY #$34A0              ;
$01/BC9F A2 A6 5D    LDX #$5DA6              ;
$01/BCA2 A9 80 04    LDA #$0480              ;
$01/BCA5 22 A6 BE 00 JSL $00BEA6[$00:BEA6]   ;
$01/BCA9 60          RTS                     ;

$01/BCAA 8A          TXA                     ;
$01/BCAB D0 08       BNE $08    [$BCB5]      ;
$01/BCAD A5 00       LDA $00    [$00:0000]   ;
$01/BCAF F0 0B       BEQ $0B    [$BCBC]      ;
$01/BCB1 3A          DEC A                   ;
$01/BCB2 3A          DEC A                   ;
$01/BCB3 F0 07       BEQ $07    [$BCBC]      ;
$01/BCB5 A9 6F 01    LDA #$016F              ;
$01/BCB8 05 02       ORA $02    [$00:0002]   ;
$01/BCBA 87 13       STA [$13]  [$2C:AE0C]   ;
$01/BCBC 60          RTS                     ;

$01/BCBD 20 E4 BE    JSR $BEE4  [$00:BEE4]   ;
$01/BCC0 A9 30       LDA #$30                ;
$01/BCC2 8D 8B 03    STA $038B  [$00:038B]   ;
$01/BCC5 C2 30       REP #$30                ;
$01/BCC7 9C BA 03    STZ $03BA  [$00:03BA]   ;
$01/BCCA A2 29 00    LDX #$0029              ;
$01/BCCD AD 81 03    LDA $0381  [$00:0381]   ;
$01/BCD0 30 08       BMI $08    [$BCDA]      ;
$01/BCD2 CD 0C 03    CMP $030C  [$00:030C]   ;
$01/BCD5 90 03       BCC $03    [$BCDA]      ;
$01/BCD7 A2 2D 00    LDX #$002D              ;
$01/BCDA 8E 57 0B    STX $0B57  [$00:0B57]   ;
$01/BCDD E2 30       SEP #$30                ;
$01/BCDF 60          RTS                     ;

DATA_01BCE0:         dw $6218, $621A, $621C, $61DA
DATA_01BCE8:         dw $621A, $621C

DATA_01BCEC:         dw $0555, $0556, $0557, $015F
DATA_01BCF4:         dw $0565, $0566

$01/BCF8 20 E4 BE    JSR $BEE4  [$00:BEE4]   ;
$01/BCFB A9 7E       LDA #$7E                ;
$01/BCFD 85 02       STA $02    [$00:0002]   ;
$01/BCFF C2 30       REP #$30                ;
$01/BD01 AD BA 03    LDA $03BA  [$00:03BA]   ;
$01/BD04 29 FE 00    AND #$00FE              ;
$01/BD07 AA          TAX                     ;
$01/BD08 E0 0C 00    CPX #$000C              ;
$01/BD0B 90 08       BCC $08    [$BD15]      ;
$01/BD0D A9 3D 00    LDA #$003D              ;
$01/BD10 8D 57 0B    STA $0B57  [$00:0B57]   ;
$01/BD13 80 10       BRA $10    [$BD25]      ;

$01/BD15 BD E0 BC    LDA $BCE0,x[$00:BCE0]   ;
$01/BD18 85 00       STA $00    [$00:0000]   ;
$01/BD1A BD EC BC    LDA $BCEC,x[$00:BCEC]   ;
$01/BD1D 87 00       STA [$00]  [$55:5555]   ;
$01/BD1F EE BA 03    INC $03BA  [$00:03BA]   ;
$01/BD22 20 89 BC    JSR $BC89  [$00:BC89]   ;
$01/BD25 E2 30       SEP #$30                ;
$01/BD27 60          RTS                     ;

DATA_01BD28:         dw $6218, $6216, $6214, $61D4
DATA_01BD30:         dw $6194, $6156, $6158, $615A
DATA_01BD38:         dw $619A, $61DA

DATA_01BD3C:         dw $0562, $0561, $0560, $0563
DATA_01BD44:         dw $0553, $0550, $0551, $0552
DATA_01BD4C:         dw $0554, $015F

$01/BD50 20 E4 BE    JSR $BEE4  [$00:BEE4]   ;
$01/BD53 A9 7E       LDA #$7E                ;
$01/BD55 85 02       STA $02    [$00:0002]   ;
$01/BD57 A9 30       LDA #$30                ;
$01/BD59 8D 8B 03    STA $038B  [$00:038B]   ;
$01/BD5C C2 30       REP #$30                ;
$01/BD5E AD BA 03    LDA $03BA  [$00:03BA]   ;
$01/BD61 29 FE 00    AND #$00FE              ;
$01/BD64 AA          TAX                     ;
$01/BD65 E0 14 00    CPX #$0014              ;
$01/BD68 90 16       BCC $16    [$BD80]      ;
$01/BD6A A2 37 00    LDX #$0037              ;
$01/BD6D AD 81 03    LDA $0381  [$00:0381]   ;
$01/BD70 C9 64 00    CMP #$0064              ;
$01/BD73 D0 06       BNE $06    [$BD7B]      ;
$01/BD75 9C BA 03    STZ $03BA  [$00:03BA]   ;
$01/BD78 A2 31 00    LDX #$0031              ;
$01/BD7B 8E 57 0B    STX $0B57  [$00:0B57]   ;
$01/BD7E 80 10       BRA $10    [$BD90]      ;

$01/BD80 BD 28 BD    LDA $BD28,x[$00:BD28]   ;
$01/BD83 85 00       STA $00    [$00:0000]   ;
$01/BD85 BD 3C BD    LDA $BD3C,x[$00:BD3C]   ;
$01/BD88 87 00       STA [$00]  [$55:5555]   ;
$01/BD8A EE BA 03    INC $03BA  [$00:03BA]   ;
$01/BD8D 20 89 BC    JSR $BC89  [$00:BC89]   ;
$01/BD90 E2 30       SEP #$30                ;
$01/BD92 60          RTS                     ;

DATA_01BD93:         dw $6218, $6216, $6214, $61D4
DATA_01BD9B:         dw $6194, $6154, $6156, $6158
DATA_01BDA3:         dw $615A, $619A, $61DA, $621A

DATA_01BDAB:         dw $056B, $056A, $0569, $056D
DATA_01BDB3:         dw $055D, $0559, $055A, $055B
DATA_01BDBB:         dw $055C, $055E, $015F, $056C

$01/BDC3 A9 95       LDA #$95                ;
$01/BDC5 85 53       STA $53    [$00:0053]   ;
$01/BDC7 20 D1 B5    JSR $B5D1  [$00:B5D1]   ;
$01/BDCA 20 E4 BE    JSR $BEE4  [$00:BEE4]   ;
$01/BDCD A9 7E       LDA #$7E                ;
$01/BDCF 85 02       STA $02    [$00:0002]   ;
$01/BDD1 C2 30       REP #$30                ;
$01/BDD3 AD BA 03    LDA $03BA  [$00:03BA]   ;
$01/BDD6 29 FE 00    AND #$00FE              ;
$01/BDD9 AA          TAX                     ;
$01/BDDA E0 18 00    CPX #$0018              ;
$01/BDDD 90 0E       BCC $0E    [$BDED]      ;
$01/BDDF A9 37 00    LDA #$0037              ;
$01/BDE2 8D 57 0B    STA $0B57  [$00:0B57]   ;
$01/BDE5 A9 30 00    LDA #$0030              ;
$01/BDE8 8D 8B 03    STA $038B  [$00:038B]   ;
$01/BDEB 80 10       BRA $10    [$BDFD]      ;

$01/BDED BD 93 BD    LDA $BD93,x[$00:BD93]   ;
$01/BDF0 85 00       STA $00    [$00:0000]   ;
$01/BDF2 BD AB BD    LDA $BDAB,x[$00:BDAB]   ;
$01/BDF5 87 00       STA [$00]  [$55:5555]   ;
$01/BDF7 EE BA 03    INC $03BA  [$00:03BA]   ;
$01/BDFA 20 89 BC    JSR $BC89  [$00:BC89]   ;
$01/BDFD E2 30       SEP #$30                ;
$01/BDFF 60          RTS                     ;

$01/BE00 20 E4 BE    JSR $BEE4  [$00:BEE4]   ;
$01/BE03 C2 30       REP #$30                ;
$01/BE05 AD 81 03    LDA $0381  [$00:0381]   ;
$01/BE08 CD 0C 03    CMP $030C  [$00:030C]   ;
$01/BE0B B0 08       BCS $08    [$BE15]      ;
$01/BE0D A9 3D 00    LDA #$003D              ;
$01/BE10 8D 57 0B    STA $0B57  [$00:0B57]   ;
$01/BE13 80 4B       BRA $4B    [$BE60]      ;

$01/BE15 8D 0C 03    STA $030C  [$00:030C]   ;
$01/BE18 64 00       STZ $00    [$00:0000]   ;
$01/BE1A C9 64 00    CMP #$0064              ;
$01/BE1D 90 08       BCC $08    [$BE27]      ;
$01/BE1F A9 0B 00    LDA #$000B              ;
$01/BE22 85 00       STA $00    [$00:0000]   ;
$01/BE24 3A          DEC A                   ;
$01/BE25 80 0C       BRA $0C    [$BE33]      ;

$01/BE27 C9 0A 00    CMP #$000A              ;
$01/BE2A 90 07       BCC $07    [$BE33]      ;
$01/BE2C E6 00       INC $00    [$00:0000]   ;
$01/BE2E E9 0A 00    SBC #$000A              ;
$01/BE31 80 F4       BRA $F4    [$BE27]      ;

$01/BE33 0A          ASL A                   ;
$01/BE34 A8          TAY                     ;
$01/BE35 B9 AF B8    LDA $B8AF,y[$00:B8AF]   ;
$01/BE38 8F D4 5D 7E STA $7E5DD4[$7E:5DD4]   ;
$01/BE3C B9 2D B9    LDA $B92D,y[$00:B92D]   ;
$01/BE3F 8F 14 5E 7E STA $7E5E14[$7E:5E14]   ;
$01/BE43 A5 00       LDA $00    [$00:0000]   ;
$01/BE45 0A          ASL A                   ;
$01/BE46 A8          TAY                     ;
$01/BE47 F0 11       BEQ $11    [$BE5A]      ;
$01/BE49 B9 AF B8    LDA $B8AF,y[$00:B8AF]   ;
$01/BE4C 8F D2 5D 7E STA $7E5DD2[$7E:5DD2]   ;
$01/BE50 B9 2D B9    LDA $B92D,y[$00:B92D]   ;
$01/BE53 8F 12 5E 7E STA $7E5E12[$7E:5E12]   ;
$01/BE57 20 89 BC    JSR $BC89  [$00:BC89]   ;
$01/BE5A EE 57 0B    INC $0B57  [$00:0B57]   ;
$01/BE5D EE 57 0B    INC $0B57  [$00:0B57]   ;
$01/BE60 E2 30       SEP #$30                ;
$01/BE62 60          RTS                     ;

$01/BE63 C2 30       REP #$30                ;
$01/BE65 A9 70 05    LDA #$0570              ;
$01/BE68 8F B0 5D 7E STA $7E5DB0[$7E:5DB0]   ;
$01/BE6C 8F D8 5D 7E STA $7E5DD8[$7E:5DD8]   ;
$01/BE70 A9 72 05    LDA #$0572              ;
$01/BE73 8F F0 5D 7E STA $7E5DF0[$7E:5DF0]   ;
$01/BE77 8F 18 5E 7E STA $7E5E18[$7E:5E18]   ;
$01/BE7B A9 71 05    LDA #$0571              ;
$01/BE7E 8F B2 5D 7E STA $7E5DB2[$7E:5DB2]   ;
$01/BE82 8F DA 5D 7E STA $7E5DDA[$7E:5DDA]   ;
$01/BE86 A9 73 05    LDA #$0573              ;
$01/BE89 8F F2 5D 7E STA $7E5DF2[$7E:5DF2]   ;
$01/BE8D 8F 1A 5E 7E STA $7E5E1A[$7E:5E1A]   ;
$01/BE91 20 89 BC    JSR $BC89  [$00:BC89]   ;
$01/BE94 EE 57 0B    INC $0B57  [$00:0B57]   ;
$01/BE97 EE 57 0B    INC $0B57  [$00:0B57]   ;
$01/BE9A E2 30       SEP #$30                ;
$01/BE9C 60          RTS                     ;

; save high score loop
$01/BE9D 20 E4 BE    JSR $BEE4  [$00:BEE4]   ;
$01/BEA0 A5 36       LDA $36    [$00:0036]   ;
$01/BEA2 05 35       ORA $35    [$00:0035]   ;
$01/BEA4 29 F0       AND #$F0                ;
$01/BEA6 F0 3B       BEQ $3B    [$BEE3]      ;
$01/BEA8 22 B7 B2 01 JSL $01B2B7[$01:B2B7]   ;
$01/BEAC A2 1F       LDX #$1F                ;
$01/BEAE AD 85 03    LDA $0385  [$00:0385]   ;\
$01/BEB1 10 05       BPL $05    [$BEB8]      ; |
$01/BEB3 20 38 BF    JSR $BF38  [$00:BF38]   ; | if bonus, go to bonus game
$01/BEB6 A2 29       LDX #$29                ; |
$01/BEB8 8E 18 01    STX $0118  [$00:0118]   ;/ 
$01/BEBB A9 F1       LDA #$F1                ;
$01/BEBD 85 4D       STA $4D    [$00:004D]   ;
$01/BEBF EE 20 02    INC $0220  [$00:0220]   ;
$01/BEC2 AE 1A 02    LDX $021A  [$00:021A]   ; load level ID
$01/BEC5 AD 0C 03    LDA $030C  [$00:030C]   ; load current or high score (whichever is higher)
$01/BEC8 DD B8 02    CMP $02B8,x[$00:02B8]   ;\ compare to high score
$01/BECB F0 13       BEQ $13    [$BEE0]      ; | branch if you didn't get a high score

$01/BECD 90 11       BCC $11    [$BEE0]      ;/
$01/BECF 48          PHA                     ; push high score
$01/BED0 BD 22 02    LDA $0222,x[$00:0222]   ;\
$01/BED3 29 7F       AND #$7F                ; | branch if you have beat the level before

$01/BED5 F0 08       BEQ $08    [$BEDF]      ;/
$01/BED7 BD B8 02    LDA $02B8,x[$00:02B8]   ;\
$01/BEDA 09 80       ORA #$80                ; | store old score for the overworld score change (when you get a new high score)
$01/BEDC 8D 20 02    STA $0220  [$00:0220]   ;/
$01/BEDF 68          PLA                     ; pull high score
$01/BEE0 9D B8 02    STA $02B8,x[$00:02B8]   ; store new high score
$01/BEE3 60          RTS                     ; return

$01/BEE4 AD 57 0B    LDA $0B57  [$00:0B57]   ;
$01/BEE7 C9 3D       CMP #$3D                ;
$01/BEE9 90 37       BCC $37    [$BF22]      ;
$01/BEEB CE 5D 0B    DEC $0B5D  [$00:0B5D]   ;
$01/BEEE 10 32       BPL $32    [$BF22]      ;
$01/BEF0 A9 05       LDA #$05                ;
$01/BEF2 8D 5D 0B    STA $0B5D  [$00:0B5D]   ;
$01/BEF5 C2 30       REP #$30                ;
$01/BEF7 AD 5B 0B    LDA $0B5B  [$00:0B5B]   ;
$01/BEFA AA          TAX                     ;
$01/BEFB BD 25 BF    LDA $BF25,x[$00:BF25]   ;
$01/BEFE 29 FF 00    AND #$00FF              ;
$01/BF01 85 01       STA $01    [$00:0001]   ;
$01/BF03 A0 00 28    LDY #$2800              ;
$01/BF06 BD 23 BF    LDA $BF23,x[$00:BF23]   ;
$01/BF09 AA          TAX                     ;
$01/BF0A A9 00 08    LDA #$0800              ;
$01/BF0D 22 A6 BE 00 JSL $00BEA6[$00:BEA6]   ;
$01/BF11 E2 30       SEP #$30                ;
$01/BF13 AD 5B 0B    LDA $0B5B  [$00:0B5B]   ;
$01/BF16 1A          INC A                   ;
$01/BF17 1A          INC A                   ;
$01/BF18 1A          INC A                   ;
$01/BF19 C9 09       CMP #$09                ;
$01/BF1B 90 02       BCC $02    [$BF1F]      ;
$01/BF1D A9 00       LDA #$00                ;
$01/BF1F 8D 5B 0B    STA $0B5B  [$00:0B5B]   ;
$01/BF22 60          RTS                     ;

DATA_01BF23:         db $00, $D0

DATA_01BF25:         db $56, $00, $D8, $56, $00

DATA_01BF2B:         db $E0, $00, $02, $04, $0A, $06, $08, $04
DATA_01BF33:         db $02, $00, $08, $06, $0A, $22, $08, $84
DATA_01BF3B:         db $00, $29, $01, $85, $00

$01/BF40 AD 18 02    LDA $0218  [$00:0218]   ;
$01/BF43 18          CLC                     ;
$01/BF44 65 00       ADC $00    [$00:0000]   ;
$01/BF46 AA          TAX                     ;
$01/BF47 BD 2C BF    LDA $BF2C,x[$00:BF2C]   ;
$01/BF4A 8D 12 02    STA $0212  [$00:0212]   ;
$01/BF4D C9 08       CMP #$08                ;
$01/BF4F D0 0C       BNE $0C    [$BF5D]      ;
$01/BF51 AD 79 03    LDA $0379  [$00:0379]   ;
$01/BF54 3A          DEC A                   ;
$01/BF55 D0 06       BNE $06    [$BF5D]      ;
$01/BF57 BD 2B BF    LDA $BF2B,x[$00:BF2B]   ;
$01/BF5A 8D 12 02    STA $0212  [$00:0212]   ;
$01/BF5D 60          RTS                     ;

DATA_01BF5E:         dw $4000, $4040, $4080, $40C0
DATA_01BF66:         dw $4100, $4140, $4180, $41C0
DATA_01BF6E:         dw $4400, $4440

DATA_01BF72:         dw $1600, $1620, $1640, $1660
DATA_01BF7A:         dw $1A00, $1A20, $1A40, $1A60
DATA_01BF82:         dw $1A80, $1AA0

DATA_01BF86:         db $12, $26

; star counter, left side of the screen
DATA_01BF88:         db $28, $28, $0C, $32
DATA_01BF8C:         db $20, $20, $C8, $32
DATA_01BF90:         db $30, $20, $C8, $72
DATA_01BF94:         db $20, $30, $C8, $B2
DATA_01BF98:         db $30, $30, $C8, $F2

; star counter, right side of the screen
DATA_01BF9C:         db $C8, $28, $0C, $32
DATA_01BFA0:         db $C0, $20, $C8, $32
DATA_01BFA4:         db $D0, $20, $C8, $72
DATA_01BFA8:         db $C0, $30, $C8, $B2
DATA_01BFAC:         db $D0, $30, $C8, $F2

DATA_01BFB0:         db $F0, $FF, $10, $00
DATA_01BFB4:         db $00, $00, $00, $00
DATA_01BFB8:         db $EA, $FF, $10, $00

; OAM slots 5-8
DATA_01BFBC:         db $00, $03, $C4, $30
DATA_01BFC0:         db $08, $00, $D5, $30
DATA_01BFC4:         db $00, $05, $C4, $B0
DATA_01BFC8:         db $08, $08, $D5, $B0

DATA_01BFCC:         db $00, $00, $D5, $70
DATA_01BFD0:         db $08, $03, $C4, $70
DATA_01BFD4:         db $00, $08, $D5, $F0
DATA_01BFD8:         db $08, $05, $C4, $F0
DATA_01BFDC:         db $03, $00, $C4, $30
DATA_01BFE0:         db $05, $00, $C4, $70
DATA_01BFE4:         db $00, $08, $C5, $F0
DATA_01BFE8:         db $08, $08, $C5, $B0
DATA_01BFEC:         db $00, $00, $C5, $70
DATA_01BFF0:         db $08, $00, $C5, $30
DATA_01BFF4:         db $03, $08, $C4, $B0
DATA_01BFF8:         db $05, $08, $C4, $F0
DATA_01BFFC:         db $FF, $03, $3F, $02
DATA_01C000:         db $1F, $00, $10, $40
DATA_01C004:         db $00, $7C, $00, $7E
DATA_01C008:         db $E0, $47, $F4, $03
DATA_01C00C:         db $FF, $03, $3F, $02
DATA_01C010:         db $1F, $00, $93, $7D
DATA_01C014:         db $FF, $7F, $FF, $7F
DATA_01C018:         db $FF, $7F, $F5, $7D
DATA_01C01C:         db $F7, $7F, $F9, $7F
DATA_01C020:         db $F5, $7D, $F9, $7F
DATA_01C024:         db $FF, $7F, $00, $00
DATA_01C028:         db $00, $00, $00, $00
DATA_01C02C:         db $00, $00, $00, $00
DATA_01C030:         db $00, $00, $93, $7D
DATA_01C034:         db $FF, $7F, $FF, $7F
DATA_01C038:         db $BA, $7E, $17, $7E
DATA_01C03C:         db $F7, $7F, $18, $7F
DATA_01C040:         db $76, $7E, $FB, $7F
DATA_01C044:         db $FD, $7F, $00, $00
DATA_01C048:         db $00, $00, $00, $00
DATA_01C04C:         db $00, $00, $00, $00
DATA_01C050:         db $00, $00, $93, $7D
DATA_01C054:         db $FF, $7F, $FF, $7F
DATA_01C058:         db $17, $7E, $BA, $7E
DATA_01C05C:         db $F7, $7F, $76, $7E
DATA_01C060:         db $18, $7F, $FD, $7F
DATA_01C064:         db $FB, $7F, $00, $00
DATA_01C068:         db $00, $00, $00, $00
DATA_01C06C:         db $00, $00, $00, $00
DATA_01C070:         db $00, $00, $93, $7D
DATA_01C074:         db $FF, $7F, $FF, $7F
DATA_01C078:         db $F5, $7D, $FF, $7F
DATA_01C07C:         db $F7, $7F, $F5, $7D
DATA_01C080:         db $F9, $7F, $FF, $7F
DATA_01C084:         db $F9, $7F, $00, $00
DATA_01C088:         db $00, $00, $00, $00
DATA_01C08C:         db $00, $00, $00, $00
DATA_01C090:         db $00, $00, $1D, $3B
DATA_01C094:         db $59, $77, $59, $3B

DATA_01C098:         dw $0001, $0000
DATA_01C09C:         dw $FFFF, $0000
DATA_01C0A0:         dw $FFFE, $0000
DATA_01C0A4:         dw $FFFF, $0000

DATA_01C0A8:         dw $FFFE, $0000
DATA_01C0AC:         dw $0002, $0000
DATA_01C0B0:         dw $FFFE, $0000
DATA_01C0B4:         dw $FFFC, $0000

DATA_01C0B8:         dw $0707, $1717
DATA_01C0BC:         dw $2727, $3737
DATA_01C0C0:         dw $4747, $5757
DATA_01C0C4:         dw $6767, $7777

DATA_01C0C8:         dw $01FF, $02FE, $2800

$01/C0CE 8B          PHB                     ;
$01/C0CF 4B          PHK                     ;
$01/C0D0 AB          PLB                     ;
$01/C0D1 64 36       STZ $36    [$00:0036]   ;
$01/C0D3 64 35       STZ $35    [$00:0035]   ;
$01/C0D5 64 38       STZ $38    [$00:0038]   ;
$01/C0D7 64 37       STZ $37    [$00:0037]   ;
 
.gamemode0F
$01/C0D9 A9 10       LDA #$10                ;
$01/C0DB 8D 83 0B    STA $0B83  [$00:0B83]   ;
$01/C0DE 9C 84 0B    STZ $0B84  [$00:0B84]   ;
$01/C0E1 AD 0F 0D    LDA $0D0F  [$00:0D0F]   ;
$01/C0E4 F0 19       BEQ $19    [$C0FF]      ;
$01/C0E6 22 5A DE 01 JSL $01DE5A[$01:DE5A]   ;
$01/C0EA 4C 6E C1    JMP $C16E  [$00:C16E]   ;

DATA_01C0ED:         dw $DAC3
DATA_01C0EF:         dw $DAE6
DATA_01C0F1:         dw $DAEB
DATA_01C0F3:         dw $DB0E
DATA_01C0F5:         dw $DB00
DATA_01C0F7:         dw $DB25
DATA_01C0F9:         dw $DB5C
DATA_01C0FB:         dw $DB79
DATA_01C0FD:         dw $DB7E

$01/C0FF AD 0F 0B    LDA $0B0F  [$00:0B0F]   ;
$01/C102 D0 33       BNE $33    [$C137]      ;
$01/C104 A5 38       LDA $38    [$00:0038]   ;
$01/C106 29 10       AND #$10                ;
$01/C108 F0 1B       BEQ $1B    [$C125]      ;
$01/C10A AD EA 7F    LDA $7FEA  [$00:7FEA]   ;
$01/C10D 0D 65 0B    ORA $0B65  [$00:0B65]   ;
$01/C110 0D 59 0B    ORA $0B59  [$00:0B59]   ;
$01/C113 0D 98 03    ORA $0398  [$00:0398]   ;
$01/C116 0D AE 61    ORA $61AE  [$00:61AE]   ;
$01/C119 0D B0 61    ORA $61B0  [$00:61B0]   ;
$01/C11C D0 07       BNE $07    [$C125]      ;
$01/C11E AD AC 60    LDA $60AC  [$00:60AC]   ;
$01/C121 C9 06       CMP #$06                ;
$01/C123 90 03       BCC $03    [$C128]      ;
$01/C125 4C 6E C1    JMP $C16E  [$00:C16E]   ;

$01/C128 AD 10 0B    LDA $0B10  [$00:0B10]   ;
$01/C12B 49 01       EOR #$01                ;
$01/C12D 29 01       AND #$01                ;
$01/C12F 8D 10 0B    STA $0B10  [$00:0B10]   ;
$01/C132 A9 01       LDA #$01                ;
$01/C134 8D 0F 0B    STA $0B0F  [$00:0B0F]   ;
$01/C137 A5 38       LDA $38    [$00:0038]   ;
$01/C139 29 20       AND #$20                ;
$01/C13B F0 2E       BEQ $2E    [$C16B]      ;
$01/C13D 80 0C       BRA $0C    [$C14B]      ;

$01/C13F AD 0E 03    LDA $030E  [$00:030E]   ;
$01/C142 C9 02       CMP #$02                ;
$01/C144 D0 05       BNE $05    [$C14B]      ;
$01/C146 EE 20 02    INC $0220  [$00:0220]   ;
$01/C149 80 0A       BRA $0A    [$C155]      ;

$01/C14B AE 1A 02    LDX $021A  [$00:021A]   ;
$01/C14E BD 22 02    LDA $0222,x[$00:0222]   ;
$01/C151 29 7F       AND #$7F                ;
$01/C153 F0 16       BEQ $16    [$C16B]      ;
$01/C155 A9 F0       LDA #$F0                ;
$01/C157 85 4D       STA $4D    [$00:004D]   ;
$01/C159 A9 01       LDA #$01                ;
$01/C15B 85 53       STA $53    [$00:0053]   ;
$01/C15D E0 0B       CPX #$0B                ;
$01/C15F D0 03       BNE $03    [$C164]      ;
$01/C161 9C 1A 02    STZ $021A  [$00:021A]   ;
$01/C164 A9 1E       LDA #$1E                ;\ something something start+select out of a level
$01/C166 8D 18 01    STA $0118  [$00:0118]   ;/
$01/C169 AB          PLB                     ;
$01/C16A 6B          RTL                     ;

$01/C16B 4C 9B CA    JMP $CA9B  [$00:CA9B]   ;

$01/C16E AD 98 03    LDA $0398  [$00:0398]   ;
$01/C171 F0 18       BEQ $18    [$C18B]      ;
$01/C173 AE 9C 03    LDX $039C  [$00:039C]   ;
$01/C176 F0 05       BEQ $05    [$C17D]      ;
$01/C178 CE 9C 03    DEC $039C  [$00:039C]   ;
$01/C17B 80 0E       BRA $0E    [$C18B]      ;

$01/C17D 0A          ASL A                   ;
$01/C17E AA          TAX                     ;
$01/C17F C2 20       REP #$20                ;
$01/C181 FC EB C0    JSR ($C0EB,x)[$00:118D] ;

$01/C184 E2 20       SEP #$20                ;
$01/C186 80 03       BRA $03    [$C18B]      ;

$01/C188 8B          PHB                     ;
$01/C189 4B          PHK                     ;
$01/C18A AB          PLB                     ;
$01/C18B 22 59 82 00 JSL $008259[$00:8259]   ; init OAM buffer
$01/C18F 22 28 FD 04 JSL $04FD28[$04:FD28]   ;
$01/C193 22 58 90 10 JSL $109058[$10:9058]   ;
$01/C197 22 9A 8C 10 JSL $108C9A[$10:8C9A]   ;
$01/C19B C2 20       REP #$20                ;
$01/C19D A5 3B       LDA $3B    [$00:003B]   ;
$01/C19F 48          PHA                     ;
$01/C1A0 AD B0 61    LDA $61B0  [$00:61B0]   ;
$01/C1A3 0D 55 0B    ORA $0B55  [$00:0B55]   ;
$01/C1A6 0D 98 03    ORA $0398  [$00:0398]   ;
$01/C1A9 D0 4D       BNE $4D    [$C1F8]      ;
$01/C1AB AD C8 61    LDA $61C8  [$00:61C8]   ;
$01/C1AE F0 17       BEQ $17    [$C1C7]      ;
$01/C1B0 48          PHA                     ;
$01/C1B1 AD C6 61    LDA $61C6  [$00:61C6]   ;
$01/C1B4 F0 03       BEQ $03    [$C1B9]      ;
$01/C1B6 CE C6 61    DEC $61C6  [$00:61C6]   ;
$01/C1B9 68          PLA                     ;
$01/C1BA CE C8 61    DEC $61C8  [$00:61C8]   ;
$01/C1BD 29 07 00    AND #$0007              ;
$01/C1C0 0A          ASL A                   ;
$01/C1C1 A8          TAY                     ;
$01/C1C2 B9 A8 C0    LDA $C0A8,y[$00:C0A8]   ;
$01/C1C5 80 10       BRA $10    [$C1D7]      ;

$01/C1C7 AD C6 61    LDA $61C6  [$00:61C6]   ;
$01/C1CA F0 2C       BEQ $2C    [$C1F8]      ;
$01/C1CC CE C6 61    DEC $61C6  [$00:61C6]   ;
$01/C1CF 29 07 00    AND #$0007              ;
$01/C1D2 0A          ASL A                   ;
$01/C1D3 A8          TAY                     ;
$01/C1D4 B9 98 C0    LDA $C098,y[$00:C098]   ;
$01/C1D7 8D B0 0C    STA $0CB0  [$00:0CB0]   ;
$01/C1DA 18          CLC                     ;
$01/C1DB 65 3B       ADC $3B    [$00:003B]   ;
$01/C1DD 85 3B       STA $3B    [$00:003B]   ;
$01/C1DF 8D 9C 60    STA $609C  [$00:609C]   ;
$01/C1E2 AC 3E 01    LDY $013E  [$00:013E]   ;
$01/C1E5 C0 09       CPY #$09                ;
$01/C1E7 F0 04       BEQ $04    [$C1ED]      ;
$01/C1E9 C0 0A       CPY #$0A                ;
$01/C1EB D0 0B       BNE $0B    [$C1F8]      ;
$01/C1ED AD B0 0C    LDA $0CB0  [$00:0CB0]   ;
$01/C1F0 18          CLC                     ;
$01/C1F1 65 43       ADC $43    [$00:0043]   ;
$01/C1F3 85 43       STA $43    [$00:0043]   ;
$01/C1F5 8D A0 60    STA $60A0  [$00:60A0]   ;
$01/C1F8 E2 20       SEP #$20                ;
$01/C1FA AE CA 61    LDX $61CA  [$00:61CA]   ;
$01/C1FD F0 03       BEQ $03    [$C202]      ;
$01/C1FF FC 15 D9    JSR ($D915,x)[$00:0100] ;

$01/C202 22 D3 94 03 JSL $0394D3[$03:94D3]   ;
$01/C206 22 67 FA 04 JSL $04FA67[$04:FA67]   ;
$01/C20A 22 9E DD 04 JSL $04DD9E[$04:DD9E]   ;
$01/C20E 22 DF 97 03 JSL $0397DF[$03:97DF]   ;
$01/C212 20 B1 D6    JSR $D6B1  [$00:D6B1]   ;
$01/C215 AD 46 01    LDA $0146  [$00:0146]   ;
$01/C218 C9 09       CMP #$09                ;
$01/C21A F0 08       BEQ $08    [$C224]      ;
$01/C21C AD 4A 01    LDA $014A  [$00:014A]   ;
$01/C21F 0A          ASL A                   ;
$01/C220 AA          TAX                     ;
$01/C221 FC 54 C4    JSR ($C454,x)[$00:A942] ;

$01/C224 AD 55 0B    LDA $0B55  [$00:0B55]   ;
$01/C227 F0 09       BEQ $09    [$C232]      ;
$01/C229 CE 55 0B    DEC $0B55  [$00:0B55]   ;
$01/C22C 29 0F       AND #$0F                ;
$01/C22E AA          TAX                     ;
$01/C22F BD B8 C0    LDA $C0B8,x[$00:C0B8]   ;
$01/C232 8D 5B 09    STA $095B  [$00:095B]   ;
$01/C235 C2 20       REP #$20                ;
$01/C237 68          PLA                     ;
$01/C238 85 3B       STA $3B    [$00:003B]   ;
$01/C23A 8D 9C 60    STA $609C  [$00:609C]   ;
$01/C23D AD B2 61    LDA $61B2  [$00:61B2]   ;
$01/C240 29 00 A0    AND #$A000              ;
$01/C243 8D 87 03    STA $0387  [$00:0387]   ;
$01/C246 AD 8A 0C    LDA $0C8A  [$00:0C8A]   ;
$01/C249 0D 4E 61    ORA $614E  [$00:614E]   ;
$01/C24C 0D 4C 0B    ORA $0B4C  [$00:0B4C]   ;
$01/C24F 0D B0 61    ORA $61B0  [$00:61B0]   ;
$01/C252 0D 57 0B    ORA $0B57  [$00:0B57]   ;
$01/C255 0D 59 0B    ORA $0B59  [$00:0B59]   ;
$01/C258 0D 98 03    ORA $0398  [$00:0398]   ;
$01/C25B F0 03       BEQ $03    [$C260]      ;
$01/C25D A9 01 00    LDA #$0001              ;
$01/C260 0D 87 03    ORA $0387  [$00:0387]   ;
$01/C263 8D 87 03    STA $0387  [$00:0387]   ;
$01/C266 D0 35       BNE $35    [$C29D]      ;
$01/C268 AD 89 03    LDA $0389  [$00:0389]   ;
$01/C26B F0 30       BEQ $30    [$C29D]      ;
$01/C26D AD B6 03    LDA $03B6  [$00:03B6]   ;
$01/C270 C9 6E 00    CMP #$006E              ;
$01/C273 A9 57 00    LDA #$0057              ;
$01/C276 B0 03       BCS $03    [$C27B]      ;
$01/C278 A9 58 00    LDA #$0058              ;\ play sound #$0058
$01/C27B 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/C27F AC 72 03    LDY $0372  [$00:0372]   ;
$01/C282 30 19       BMI $19    [$C29D]      ;
$01/C284 AC 1A 02    LDY $021A  [$00:021A]   ;
$01/C287 F0 04       BEQ $04    [$C28D]      ;
$01/C289 C0 0B       CPY #$0B                ;
$01/C28B D0 10       BNE $10    [$C29D]      ;
$01/C28D A9 80 00    LDA #$0080              ;
$01/C290 0C 72 03    TSB $0372  [$00:0372]   ;
$01/C293 EE 0F 0D    INC $0D0F  [$00:0D0F]   ;
$01/C296 A9 2C 00    LDA #$002C              ;
$01/C299 8F 70 40 70 STA $704070[$70:4070]   ;
$01/C29D A2 08       LDX #$08                ;
$01/C29F A9 EF B1    LDA #$B1EF              ;
$01/C2A2 22 67 DE 7E JSL $7EDE67[$7E:DE67]   ; copy OAM buffer
$01/C2A6 AD 7F 0B    LDA $0B7F  [$00:0B7F]   ;
$01/C2A9 F0 03       BEQ $03    [$C2AE]      ;
$01/C2AB CE 7F 0B    DEC $0B7F  [$00:0B7F]   ;
$01/C2AE AD 4C 0B    LDA $0B4C  [$00:0B4C]   ;
$01/C2B1 0D 57 0B    ORA $0B57  [$00:0B57]   ;
$01/C2B4 0D 59 0B    ORA $0B59  [$00:0B59]   ;
$01/C2B7 D0 29       BNE $29    [$C2E2]      ;
$01/C2B9 AD B6 03    LDA $03B6  [$00:03B6]   ;
$01/C2BC C9 6D 00    CMP #$006D              ;
$01/C2BF 90 31       BCC $31    [$C2F2]      ;
$01/C2C1 AD 87 03    LDA $0387  [$00:0387]   ;
$01/C2C4 F0 34       BEQ $34    [$C2FA]      ;
$01/C2C6 AD 7F 0B    LDA $0B7F  [$00:0B7F]   ;
$01/C2C9 D0 24       BNE $24    [$C2EF]      ;
$01/C2CB A5 35       LDA $35    [$00:0035]   ;
$01/C2CD 0D AC 60    ORA $60AC  [$00:60AC]   ;
$01/C2D0 0D 0F 0D    ORA $0D0F  [$00:0D0F]   ;
$01/C2D3 D0 0D       BNE $0D    [$C2E2]      ;
$01/C2D5 AD 7D 0B    LDA $0B7D  [$00:0B7D]   ; \  test idle timer
$01/C2D8 C9 60 00    CMP #$0060              ;  | >= $60 frames
$01/C2DB B0 12       BCS $12    [$C2EF]      ; /  jump to star counter drawing if so
$01/C2DD EE 7D 0B    INC $0B7D  [$00:0B7D]   ; \  increment idle timer if not
$01/C2E0 80 03       BRA $03    [$C2E5]      ; /

$01/C2E2 9C 7D 0B    STZ $0B7D  [$00:0B7D]   ;
$01/C2E5 AC 46 01    LDY $0146  [$00:0146]   ;
$01/C2E8 C0 0D       CPY #$0D                ;
$01/C2EA F0 03       BEQ $03    [$C2EF]      ;
$01/C2EC 4C 50 C4    JMP $C450  [$00:C450]   ;

$01/C2EF 4C C7 C3    JMP $C3C7  [$00:C3C7]   ;

$01/C2F2 9C 7D 0B    STZ $0B7D  [$00:0B7D]   ;
$01/C2F5 AD 87 03    LDA $0387  [$00:0387]   ;
$01/C2F8 D0 F5       BNE $F5    [$C2EF]      ;
$01/C2FA A2 04       LDX #$04                ;
$01/C2FC AD 80 76    LDA $7680  [$00:7680]   ;
$01/C2FF 38          SEC                     ;
$01/C300 E9 08 00    SBC #$0008              ;
$01/C303 C9 E0 00    CMP #$00E0              ;
$01/C306 B0 0C       BCS $0C    [$C314]      ;
$01/C308 AD 82 76    LDA $7682  [$00:7682]   ;
$01/C30B 38          SEC                     ;
$01/C30C E9 10 00    SBC #$0010              ;
$01/C30F C9 C1 00    CMP #$00C1              ;
$01/C312 90 2E       BCC $2E    [$C342]      ;
$01/C314 AD 82 76    LDA $7682  [$00:7682]   ;
$01/C317 38          SEC                     ;
$01/C318 E9 64 00    SBC #$0064              ;
$01/C31B 85 04       STA $04    [$00:0004]   ;
$01/C31D 10 04       BPL $04    [$C323]      ;
$01/C31F 49 FF FF    EOR #$FFFF              ;
$01/C322 1A          INC A                   ;
$01/C323 85 06       STA $06    [$00:0006]   ;
$01/C325 AD 80 76    LDA $7680  [$00:7680]   ;
$01/C328 38          SEC                     ;
$01/C329 E9 78 00    SBC #$0078              ;
$01/C32C 85 00       STA $00    [$00:0000]   ;
$01/C32E 10 04       BPL $04    [$C334]      ;
$01/C330 49 FF FF    EOR #$FFFF              ;
$01/C333 1A          INC A                   ;
$01/C334 85 02       STA $02    [$00:0002]   ;
$01/C336 C5 06       CMP $06    [$00:0006]   ;
$01/C338 90 02       BCC $02    [$C33C]      ;
$01/C33A A2 00       LDX #$00                ;
$01/C33C B5 00       LDA $00,x  [$00:0000]   ;
$01/C33E 10 02       BPL $02    [$C342]      ;
$01/C340 E8          INX                     ;
$01/C341 E8          INX                     ;
$01/C342 AD 80 76    LDA $7680  [$00:7680]   ;
$01/C345 18          CLC                     ;
$01/C346 7D B0 BF    ADC $BFB0,x[$00:BFB0]   ;
$01/C349 C9 02 00    CMP #$0002              ;
$01/C34C 10 03       BPL $03    [$C351]      ;
$01/C34E A9 02 00    LDA #$0002              ;
$01/C351 C9 EF 00    CMP #$00EF              ;
$01/C354 30 03       BMI $03    [$C359]      ;
$01/C356 A9 EE 00    LDA #$00EE              ;
$01/C359 85 02       STA $02    [$00:0002]   ;
$01/C35B AD 82 76    LDA $7682  [$00:7682]   ;
$01/C35E 18          CLC                     ;
$01/C35F 7D B4 BF    ADC $BFB4,x[$00:BFB4]   ;
$01/C362 C9 0A 00    CMP #$000A              ;
$01/C365 10 03       BPL $03    [$C36A]      ;
$01/C367 A9 0A 00    LDA #$000A              ;
$01/C36A C9 C8 00    CMP #$00C8              ;
$01/C36D 30 03       BMI $03    [$C372]      ;
$01/C36F A9 C7 00    LDA #$00C7              ;
$01/C372 85 03       STA $03    [$00:0003]   ;
$01/C374 8A          TXA                     ;
$01/C375 0A          ASL A                   ;
$01/C376 0A          ASL A                   ;
$01/C377 0A          ASL A                   ;
$01/C378 AA          TAX                     ;
$01/C379 AD 74 79    LDA $7974  [$00:7974]   ;
$01/C37C 29 04 00    AND #$0004              ;
$01/C37F 4A          LSR A                   ;
$01/C380 69 02 00    ADC #$0002              ;
$01/C383 EB          XBA                     ;
$01/C384 85 00       STA $00    [$00:0000]   ;
$01/C386 18          CLC                     ;
$01/C387 A5 02       LDA $02    [$00:0002]   ;
$01/C389 7D BC BF    ADC $BFBC,x[$00:BFBC]   ;
$01/C38C 8D 14 6A    STA $6A14  [$00:6A14]   ;
$01/C38F BD BE BF    LDA $BFBE,x[$00:BFBE]   ;
$01/C392 05 00       ORA $00    [$00:0000]   ;
$01/C394 8D 16 6A    STA $6A16  [$00:6A16]   ;
$01/C397 A5 02       LDA $02    [$00:0002]   ;
$01/C399 7D C0 BF    ADC $BFC0,x[$00:BFC0]   ;
$01/C39C 8D 18 6A    STA $6A18  [$00:6A18]   ;
$01/C39F BD C2 BF    LDA $BFC2,x[$00:BFC2]   ;
$01/C3A2 05 00       ORA $00    [$00:0000]   ;
$01/C3A4 8D 1A 6A    STA $6A1A  [$00:6A1A]   ;
$01/C3A7 A5 02       LDA $02    [$00:0002]   ;
$01/C3A9 7D C4 BF    ADC $BFC4,x[$00:BFC4]   ;
$01/C3AC 8D 1C 6A    STA $6A1C  [$00:6A1C]   ;
$01/C3AF BD C6 BF    LDA $BFC6,x[$00:BFC6]   ;
$01/C3B2 05 00       ORA $00    [$00:0000]   ;
$01/C3B4 8D 1E 6A    STA $6A1E  [$00:6A1E]   ;
$01/C3B7 A5 02       LDA $02    [$00:0002]   ;
$01/C3B9 7D C8 BF    ADC $BFC8,x[$00:BFC8]   ;
$01/C3BC 8D 20 6A    STA $6A20  [$00:6A20]   ;
$01/C3BF BD CA BF    LDA $BFCA,x[$00:BFCA]   ;
$01/C3C2 05 00       ORA $00    [$00:0000]   ;
$01/C3C4 8D 22 6A    STA $6A22  [$00:6A22]   ;
$01/C3C7 AD A1 03    LDA $03A1  [$00:03A1]   ;
$01/C3CA F0 20       BEQ $20    [$C3EC]      ;
$01/C3CC 0A          ASL A                   ;
$01/C3CD AA          TAX                     ;
$01/C3CE BD 72 BF    LDA $BF72,x[$00:BF72]   ;
$01/C3D1 8D 40 61    STA $6140  [$00:6140]   ;
$01/C3D4 EB          XBA                     ;
$01/C3D5 AA          TAX                     ;
$01/C3D6 E8          INX                     ;
$01/C3D7 E8          INX                     ;
$01/C3D8 8E 43 61    STX $6143  [$00:6143]   ;
$01/C3DB AD A3 03    LDA $03A3  [$00:03A3]   ;
$01/C3DE 0A          ASL A                   ;
$01/C3DF AA          TAX                     ;
$01/C3E0 BD 72 BF    LDA $BF72,x[$00:BF72]   ;
$01/C3E3 8D 44 61    STA $6144  [$00:6144]   ;
$01/C3E6 EB          XBA                     ;
$01/C3E7 AA          TAX                     ;
$01/C3E8 E8          INX                     ;
$01/C3E9 E8          INX                     ;
$01/C3EA 80 19       BRA $19    [$C405]      ;

$01/C3EC AD A3 03    LDA $03A3  [$00:03A3]   ;
$01/C3EF 0A          ASL A                   ;
$01/C3F0 AA          TAX                     ;
$01/C3F1 BD 5E BF    LDA $BF5E,x[$00:BF5E]   ;
$01/C3F4 8D 40 61    STA $6140  [$00:6140]   ;
$01/C3F7 18          CLC                     ;
$01/C3F8 69 20 00    ADC #$0020              ;
$01/C3FB 8D 44 61    STA $6144  [$00:6144]   ;
$01/C3FE EB          XBA                     ;
$01/C3FF AA          TAX                     ;
$01/C400 E8          INX                     ;
$01/C401 E8          INX                     ;
$01/C402 8E 43 61    STX $6143  [$00:6143]   ;
$01/C405 8E 47 61    STX $6147  [$00:6147]   ;
$01/C408 A2 52       LDX #$52                ;
$01/C40A 8E 42 61    STX $6142  [$00:6142]   ;
$01/C40D 8E 46 61    STX $6146  [$00:6146]   ;
$01/C410 A9 AA 02    LDA #$02AA              ;
$01/C413 8D 00 6C    STA $6C00  [$00:6C00]   ;
$01/C416 9C 02 6C    STZ $6C02  [$00:6C02]   ;
$01/C419 AC 46 01    LDY $0146  [$00:0146]   ;
$01/C41C C0 0D       CPY #$0D                ;
$01/C41E F0 17       BEQ $17    [$C437]      ;
$01/C420 AD B0 60    LDA $60B0  [$00:60B0]   ;
$01/C423 38          SEC                     ;
$01/C424 E9 58 00    SBC #$0058              ;
$01/C427 C9 40 00    CMP #$0040              ;
$01/C42A 90 10       BCC $10    [$C43C]      ;
$01/C42C A2 00       LDX #$00                ;
$01/C42E AD B0 60    LDA $60B0  [$00:60B0]   ;
$01/C431 38          SEC                     ;
$01/C432 E9 78 00    SBC #$0078              ;
$01/C435 10 02       BPL $02    [$C439]      ;
$01/C437 A2 01       LDX #$01                ;
$01/C439 8E 81 0B    STX $0B81  [$00:0B81]   ;
$01/C43C AE 81 0B    LDX $0B81  [$00:0B81]   ;\
$01/C43F BC 86 BF    LDY $BF86,x[$00:BF86]   ; |
$01/C442 A2 12       LDX #$12                ; |
$01/C444 B9 88 BF    LDA $BF88,y[$00:BF88]   ; |
$01/C447 9D 00 6A    STA $6A00,x[$00:6A00]   ; | init star counter OAM slots
$01/C44A 88          DEY                     ; |
$01/C44B 88          DEY                     ; |
$01/C44C CA          DEX                     ; |
$01/C44D CA          DEX                     ; |
$01/C44E 10 F4       BPL $F4    [$C444]      ;/
$01/C450 E2 20       SEP #$20                ;
$01/C452 AB          PLB                     ;
$01/C453 6B          RTL                     ;

DATA_01C454:         dw $C47E
DATA_01C456:         dw $C493
DATA_01C458:         dw $C4D9
DATA_01C45A:         dw $C54D
DATA_01C45C:         dw $C584
DATA_01C45E:         dw $C5BE
DATA_01C460:         dw $C5F2
DATA_01C462:         dw $C62D
DATA_01C464:         dw $C682
DATA_01C466:         dw $C6BB
DATA_01C468:         dw $C702
DATA_01C46A:         dw $C728
DATA_01C46C:         dw $C783
DATA_01C46E:         dw $C7F2
DATA_01C470:         dw $C84E
DATA_01C472:         dw $C897
DATA_01C474:         dw $C8CB
DATA_01C476:         dw $C906
DATA_01C478:         dw $C955
DATA_01C47A:         dw $C968
DATA_01C47C:         dw $C968

$01/C47E 60          RTS                     ;

DATA_01C47F:         dw $EB4A, $EB64, $EB7E, $EB98
DATA_01C487:         dw $EBB2, $EBCC, $EBE6, $EC00

DATA_01C48F:         db $30, $10, $50, $10

$01/C493 C2 20       REP #$20                ;
$01/C495 CE 75 0B    DEC $0B75  [$00:0B75]   ;
$01/C498 AD 75 0B    LDA $0B75  [$00:0B75]   ;
$01/C49B 10 23       BPL $23    [$C4C0]      ;
$01/C49D AD 73 0B    LDA $0B73  [$00:0B73]   ;
$01/C4A0 1A          INC A                   ;
$01/C4A1 1A          INC A                   ;
$01/C4A2 29 0E 00    AND #$000E              ;
$01/C4A5 8D 73 0B    STA $0B73  [$00:0B73]   ;
$01/C4A8 D0 10       BNE $10    [$C4BA]      ;
$01/C4AA 22 75 88 12 JSL $128875[$12:8875]   ;
$01/C4AE 29 03 00    AND #$0003              ;
$01/C4B1 AA          TAX                     ;
$01/C4B2 BD 8F C4    LDA $C48F,x[$00:C48F]   ;
$01/C4B5 29 FF 00    AND #$00FF              ;
$01/C4B8 80 03       BRA $03    [$C4BD]      ;

$01/C4BA A9 04 00    LDA #$0004              ;
$01/C4BD 8D 75 0B    STA $0B75  [$00:0B75]   ;
$01/C4C0 AE 73 0B    LDX $0B73  [$00:0B73]   ;
$01/C4C3 BD 7F C4    LDA $C47F,x[$00:C47F]   ;
$01/C4C6 85 00       STA $00    [$00:0000]   ;
$01/C4C8 A9 1A 00    LDA #$001A              ;
$01/C4CB 85 0E       STA $0E    [$00:000E]   ;
$01/C4CD A2 86       LDX #$86                ;
$01/C4CF 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C4D2 E2 20       SEP #$20                ;
$01/C4D4 60          RTS                     ;

DATA_01C4D5:         db $00, $40, $40, $40

$01/C4D9 C2 10       REP #$10                ;
$01/C4DB AD 8C 60    LDA $608C  [$00:608C]   ;
$01/C4DE 38          SEC                     ;
$01/C4DF ED 12 7E    SBC $7E12  [$00:7E12]   ;
$01/C4E2 30 17       BMI $17    [$C4FB]      ;
$01/C4E4 D0 12       BNE $12    [$C4F8]      ;
$01/C4E6 AC A8 60    LDY $60A8  [$00:60A8]   ;
$01/C4E9 D0 0B       BNE $0B    [$C4F6]      ;
$01/C4EB AE 73 0B    LDX $0B73  [$00:0B73]   ;
$01/C4EE E0 01 00    CPX #$0001              ;
$01/C4F1 F0 0B       BEQ $0B    [$C4FE]      ;
$01/C4F3 9C 75 0B    STZ $0B75  [$00:0B75]   ;
$01/C4F6 A9 01       LDA #$01                ;
$01/C4F8 49 FF       EOR #$FF                ;
$01/C4FA 1A          INC A                   ;
$01/C4FB 38          SEC                     ;
$01/C4FC E9 06       SBC #$06                ;
$01/C4FE E2 10       SEP #$10                ;
$01/C500 18          CLC                     ;
$01/C501 6D 75 0B    ADC $0B75  [$00:0B75]   ;
$01/C504 8D 75 0B    STA $0B75  [$00:0B75]   ;
$01/C507 10 43       BPL $43    [$C54C]      ;
$01/C509 AE 73 0B    LDX $0B73  [$00:0B73]   ;
$01/C50C E8          INX                     ;
$01/C50D E0 04       CPX #$04                ;
$01/C50F 90 02       BCC $02    [$C513]      ;
$01/C511 A2 00       LDX #$00                ;
$01/C513 8E 73 0B    STX $0B73  [$00:0B73]   ;
$01/C516 BF D5 C4 01 LDA $01C4D5,x[$01:C4D5] ;
$01/C51A D0 08       BNE $08    [$C524]      ;
$01/C51C AD 70 79    LDA $7970  [$00:7970]   ;
$01/C51F 29 E0       AND #$E0                ;
$01/C521 18          CLC                     ;
$01/C522 69 20       ADC #$20                ;
$01/C524 8D 75 0B    STA $0B75  [$00:0B75]   ;
$01/C527 8A          TXA                     ;
$01/C528 0A          ASL A                   ;
$01/C529 6D 73 0B    ADC $0B73  [$00:0B73]   ;
$01/C52C 0A          ASL A                   ;
$01/C52D AA          TAX                     ;
$01/C52E 8B          PHB                     ;
$01/C52F A9 70       LDA #$70                ;
$01/C531 48          PHA                     ;
$01/C532 AB          PLB                     ;
$01/C533 C2 20       REP #$20                ;
$01/C535 A0 00       LDY #$00                ;
$01/C537 BF 90 A1 5F LDA $5FA190,x[$5F:A190] ;
$01/C53B 99 76 2D    STA $2D76,y[$00:2D76]   ;
$01/C53E 99 0A 20    STA $200A,y[$00:200A]   ;
$01/C541 E8          INX                     ;
$01/C542 E8          INX                     ;
$01/C543 C8          INY                     ;
$01/C544 C8          INY                     ;
$01/C545 C0 06       CPY #$06                ;
$01/C547 90 EE       BCC $EE    [$C537]      ;
$01/C549 E2 20       SEP #$20                ;
$01/C54B AB          PLB                     ;
$01/C54C 60          RTS                     ;

$01/C54D AD 74 79    LDA $7974  [$00:7974]   ;
$01/C550 29 18       AND #$18                ;
$01/C552 0A          ASL A                   ;
$01/C553 0A          ASL A                   ;
$01/C554 69 1E       ADC #$1E                ;
$01/C556 AA          TAX                     ;
$01/C557 8B          PHB                     ;
$01/C558 A9 70       LDA #$70                ;
$01/C55A 48          PHA                     ;
$01/C55B AB          PLB                     ;
$01/C55C C2 20       REP #$20                ;
$01/C55E A0 1E       LDY #$1E                ;
$01/C560 BF EA CC 5F LDA $5FCCEA,x[$5F:CCEA] ;
$01/C564 99 4C 2E    STA $2E4C,y[$00:2E4C]   ;
$01/C567 99 E0 20    STA $20E0,y[$00:20E0]   ;
$01/C56A CA          DEX                     ;
$01/C56B CA          DEX                     ;
$01/C56C 88          DEY                     ;
$01/C56D 88          DEY                     ;
$01/C56E 10 F0       BPL $F0    [$C560]      ;
$01/C570 E2 20       SEP #$20                ;
$01/C572 AB          PLB                     ;
$01/C573 60          RTS                     ;

DATA_01C574:         dw $EA5A, $EA78, $EA96, $EAB4
DATA_01C57C:         dw $EAD2, $EAF0, $EB0E, $EB2C

$01/C584 AD 74 79    LDA $7974  [$00:7974]   ;
$01/C587 29 1C       AND #$1C                ;
$01/C589 4A          LSR A                   ;
$01/C58A AA          TAX                     ;
$01/C58B A9 5F       LDA #$5F                ;
$01/C58D 85 02       STA $02    [$00:0002]   ;
$01/C58F C2 20       REP #$20                ;
$01/C591 AD E4 7F    LDA $7FE4  [$00:7FE4]   ;
$01/C594 18          CLC                     ;
$01/C595 69 00 00    ADC #$0000              ;
$01/C598 8D E4 7F    STA $7FE4  [$00:7FE4]   ;
$01/C59B BD 74 C5    LDA $C574,x[$00:C574]   ;
$01/C59E 85 00       STA $00    [$00:0000]   ;
$01/C5A0 8B          PHB                     ;
$01/C5A1 A0 70       LDY #$70                ;
$01/C5A3 5A          PHY                     ;
$01/C5A4 AB          PLB                     ;
$01/C5A5 A0 00       LDY #$00                ;
$01/C5A7 B7 00       LDA [$00],y[$55:5555]   ;
$01/C5A9 99 4E 2E    STA $2E4E,y[$00:2E4E]   ;
$01/C5AC 99 E2 20    STA $20E2,y[$00:20E2]   ;
$01/C5AF C8          INY                     ;
$01/C5B0 C8          INY                     ;
$01/C5B1 C0 1E       CPY #$1E                ;
$01/C5B3 90 F2       BCC $F2    [$C5A7]      ;
$01/C5B5 E2 20       SEP #$20                ;
$01/C5B7 AB          PLB                     ;
$01/C5B8 A9 10       LDA #$10                ;
$01/C5BA 8D 43 0D    STA $0D43  [$00:0D43]   ;
$01/C5BD 60          RTS                     ;

$01/C5BE 20 44 C6    JSR $C644  [$00:C644]   ;
$01/C5C1 EE 73 0B    INC $0B73  [$00:0B73]   ;
$01/C5C4 AD 73 0B    LDA $0B73  [$00:0B73]   ;
$01/C5C7 29 38       AND #$38                ;
$01/C5C9 0A          ASL A                   ;
$01/C5CA AA          TAX                     ;
$01/C5CB 8B          PHB                     ;
$01/C5CC A9 70       LDA #$70                ;
$01/C5CE 48          PHA                     ;
$01/C5CF AB          PLB                     ;
$01/C5D0 C2 20       REP #$20                ;
$01/C5D2 A0 00       LDY #$00                ;
$01/C5D4 BF 00 DA 5F LDA $5FDA00,x[$5F:DA00] ;
$01/C5D8 99 4E 2E    STA $2E4E,y[$00:2E4E]   ;
$01/C5DB 99 E2 20    STA $20E2,y[$00:20E2]   ;
$01/C5DE E8          INX                     ;
$01/C5DF E8          INX                     ;
$01/C5E0 C8          INY                     ;
$01/C5E1 C8          INY                     ;
$01/C5E2 C0 10       CPY #$10                ;
$01/C5E4 90 EE       BCC $EE    [$C5D4]      ;
$01/C5E6 E2 20       SEP #$20                ;
$01/C5E8 AB          PLB                     ;
$01/C5E9 60          RTS                     ;

DATA_01C5EA:         dw $A150, $A158, $A160, $A168

$01/C5F2 20 C1 C5    JSR $C5C1  [$00:C5C1]   ;
$01/C5F5 C2 20       REP #$20                ;
$01/C5F7 AD 74 79    LDA $7974  [$00:7974]   ;
$01/C5FA 29 38 00    AND #$0038              ;
$01/C5FD 4A          LSR A                   ;
$01/C5FE 4A          LSR A                   ;
$01/C5FF AA          TAX                     ;
$01/C600 BD 34 C6    LDA $C634,x[$00:C634]   ;
$01/C603 85 00       STA $00    [$00:0000]   ;
$01/C605 A2 86       LDX #$86                ;
$01/C607 A9 1A 00    LDA #$001A              ;
$01/C60A 85 0E       STA $0E    [$00:000E]   ;
$01/C60C 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C60F E2 20       SEP #$20                ;
$01/C611 AD 74 79    LDA $7974  [$00:7974]   ;
$01/C614 29 18       AND #$18                ;
$01/C616 4A          LSR A                   ;
$01/C617 4A          LSR A                   ;
$01/C618 AA          TAX                     ;
$01/C619 C2 20       REP #$20                ;
$01/C61B BD EA C5    LDA $C5EA,x[$00:C5EA]   ;
$01/C61E 85 00       STA $00    [$00:0000]   ;
$01/C620 A2 A6       LDX #$A6                ;
$01/C622 A9 08 00    LDA #$0008              ;
$01/C625 85 0E       STA $0E    [$00:000E]   ;
$01/C627 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C62A E2 20       SEP #$20                ;
$01/C62C 60          RTS                     ;

$01/C62D 20 C1 C5    JSR $C5C1  [$00:C5C1]   ;
$01/C630 20 F2 C5    JSR $C5F2  [$00:C5F2]   ;
$01/C633 60          RTS                     ;

DATA_01C634:         dw $F5CE, $F5F4, $F61A, $F640
DATA_01C63C:         dw $F666, $F68C, $F6B2, $F6D8

$01/C644 AD 36 01    LDA $0136  [$00:0136]   ;
$01/C647 29 07       AND #$07                ;
$01/C649 D0 2E       BNE $2E    [$C679]      ;
$01/C64B C2 20       REP #$20                ;

$01/C64D AD 74 79    LDA $7974  [$00:7974]   ;
$01/C650 29 38 00    AND #$0038              ;
$01/C653 4A          LSR A                   ;
$01/C654 4A          LSR A                   ;
$01/C655 AA          TAX                     ;
$01/C656 BD 34 C6    LDA $C634,x[$00:C634]   ;
$01/C659 85 00       STA $00    [$00:0000]   ;
$01/C65B A2 86       LDX #$86                ;
$01/C65D A9 1A 00    LDA #$001A              ;
$01/C660 85 0E       STA $0E    [$00:000E]   ;
$01/C662 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C665 A5 00       LDA $00    [$00:0000]   ;
$01/C667 18          CLC                     ;
$01/C668 69 1A 00    ADC #$001A              ;
$01/C66B 85 00       STA $00    [$00:0000]   ;
$01/C66D A2 04       LDX #$04                ;
$01/C66F A9 0C 00    LDA #$000C              ;
$01/C672 85 0E       STA $0E    [$00:000E]   ;
$01/C674 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C677 E2 20       SEP #$20                ;
$01/C679 60          RTS                     ;

DATA_01C67A:         dw $A170, $A178, $A180, $A188

$01/C682 AD 74 79    LDA $7974  [$00:7974]   ;
$01/C685 29 0C       AND #$0C                ;
$01/C687 4A          LSR A                   ;
$01/C688 AA          TAX                     ;
$01/C689 C2 20       REP #$20                ;
$01/C68B BD 7A C6    LDA $C67A,x[$00:C67A]   ;
$01/C68E 85 00       STA $00    [$00:0000]   ;
$01/C690 A2 A6       LDX #$A6                ;
$01/C692 A9 08 00    LDA #$0008              ;
$01/C695 85 0E       STA $0E    [$00:000E]   ;
$01/C697 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C69A AD 36 01    LDA $0136  [$00:0136]   ;
$01/C69D C9 0B 00    CMP #$000B              ;
$01/C6A0 D0 06       BNE $06    [$C6A8]      ;
$01/C6A2 A9 24 00    LDA #$0024              ;
$01/C6A5 8D 51 00    STA $0051  [$00:0051]   ;
$01/C6A8 E2 20       SEP #$20                ;
$01/C6AA 60          RTS                     ;

DATA_01C6AB:         dw $C932, $C934, $C936, $C938
DATA_01C6B3:         dw $C93A, $C938, $C936, $C934

$01/C6BB A9 5F       LDA #$5F                ;
$01/C6BD 85 02       STA $02    [$00:0002]   ;
$01/C6BF AD 75 0B    LDA $0B75  [$00:0B75]   ;
$01/C6C2 1A          INC A                   ;
$01/C6C3 8D 75 0B    STA $0B75  [$00:0B75]   ;
$01/C6C6 C9 06       CMP #$06                ;
$01/C6C8 90 0D       BCC $0D    [$C6D7]      ;
$01/C6CA 9C 75 0B    STZ $0B75  [$00:0B75]   ;
$01/C6CD AD 73 0B    LDA $0B73  [$00:0B73]   ;
$01/C6D0 1A          INC A                   ;
$01/C6D1 1A          INC A                   ;
$01/C6D2 29 0E       AND #$0E                ;
$01/C6D4 8D 73 0B    STA $0B73  [$00:0B73]   ;
$01/C6D7 AE 73 0B    LDX $0B73  [$00:0B73]   ;
$01/C6DA A9 5F       LDA #$5F                ;
$01/C6DC 85 02       STA $02    [$00:0002]   ;
$01/C6DE C2 20       REP #$20                ;
$01/C6E0 BD AB C6    LDA $C6AB,x[$00:C6AB]   ;
$01/C6E3 85 00       STA $00    [$00:0000]   ;
$01/C6E5 A7 00       LDA [$00]  [$55:5555]   ;
$01/C6E7 8F 6E 2D 70 STA $702D6E[$70:2D6E]   ;
$01/C6EB 8F 02 20 70 STA $702002[$70:2002]   ;
$01/C6EF 8F 7E 2D 70 STA $702D7E[$70:2D7E]   ;
$01/C6F3 8F 12 20 70 STA $702012[$70:2012]   ;
$01/C6F7 E2 20       SEP #$20                ;
$01/C6F9 60          RTS                     ;

DATA_01C6FA:         dw $E2EC, $E2F4, $E2FC, $E304

$01/C702 AD 74 79    LDA $7974  [$00:7974]   ;
$01/C705 29 18       AND #$18                ;
$01/C707 4A          LSR A                   ;
$01/C708 4A          LSR A                   ;
$01/C709 AA          TAX                     ;
$01/C70A A9 5F       LDA #$5F                ;
$01/C70C 85 02       STA $02    [$00:0002]   ;
$01/C70E C2 20       REP #$20                ;
$01/C710 BD FA C6    LDA $C6FA,x[$00:C6FA]   ;
$01/C713 85 00       STA $00    [$00:0000]   ;
$01/C715 4C 90 C6    JMP $C690  [$00:C690]   ;

DATA_01C718:         dw $E336, $E330, $E32A, $E324
DATA_01C720:         dw $E31E, $E318, $E312, $E30C

$01/C728 C2 20       REP #$20                ;
$01/C72A AD 75 0B    LDA $0B75  [$00:0B75]   ;
$01/C72D 1A          INC A                   ;
$01/C72E C9 70 00    CMP #$0070              ;
$01/C731 B0 05       BCS $05    [$C738]      ;
$01/C733 8D 75 0B    STA $0B75  [$00:0B75]   ;
$01/C736 80 38       BRA $38    [$C770]      ;

$01/C738 AD 74 79    LDA $7974  [$00:7974]   ;
$01/C73B 29 7F 00    AND #$007F              ;
$01/C73E D0 30       BNE $30    [$C770]      ;
$01/C740 E2 20       SEP #$20                ;
$01/C742 A9 04       LDA #$04                ;
$01/C744 8D 67 09    STA $0967  [$00:0967]   ;
$01/C747 A9 13       LDA #$13                ;
$01/C749 8D 68 09    STA $0968  [$00:0968]   ;
$01/C74C A9 24       LDA #$24                ;
$01/C74E 8D 6C 09    STA $096C  [$00:096C]   ;
$01/C751 C2 20       REP #$20                ;
$01/C753 AD 73 0B    LDA $0B73  [$00:0B73]   ;
$01/C756 1A          INC A                   ;
$01/C757 C9 08 00    CMP #$0008              ;
$01/C75A B0 14       BCS $14    [$C770]      ;
$01/C75C 8D 73 0B    STA $0B73  [$00:0B73]   ;
$01/C75F 0A          ASL A                   ;
$01/C760 A8          TAY                     ;
$01/C761 B9 18 C7    LDA $C718,y[$00:C718]   ;
$01/C764 85 00       STA $00    [$00:0000]   ;
$01/C766 A2 02       LDX #$02                ;
$01/C768 A9 06 00    LDA #$0006              ;
$01/C76B 85 0E       STA $0E    [$00:000E]   ;
$01/C76D 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C770 E2 20       SEP #$20                ;
$01/C772 60          RTS                     ;

DATA_01C773:         dw $E30C, $E312, $E318, $E31E
DATA_01C77B:         dw $E324, $E32A, $E330, $E336

$01/C783 C2 20       REP #$20                ;
$01/C785 AD 75 0B    LDA $0B75  [$00:0B75]   ;
$01/C788 1A          INC A                   ;
$01/C789 C9 A0 01    CMP #$01A0              ;
$01/C78C B0 05       BCS $05    [$C793]      ;
$01/C78E 8D 75 0B    STA $0B75  [$00:0B75]   ;
$01/C791 80 3C       BRA $3C    [$C7CF]      ;

$01/C793 AD 74 79    LDA $7974  [$00:7974]   ;
$01/C796 29 3F 00    AND #$003F              ;
$01/C799 D0 D5       BNE $D5    [$C770]      ;
$01/C79B AD 73 0B    LDA $0B73  [$00:0B73]   ;
$01/C79E 1A          INC A                   ;
$01/C79F C9 08 00    CMP #$0008              ;
$01/C7A2 B0 16       BCS $16    [$C7BA]      ;
$01/C7A4 8D 73 0B    STA $0B73  [$00:0B73]   ;
$01/C7A7 0A          ASL A                   ;
$01/C7A8 A8          TAY                     ;
$01/C7A9 B9 73 C7    LDA $C773,y[$00:C773]   ;
$01/C7AC 85 00       STA $00    [$00:0000]   ;
$01/C7AE A2 02       LDX #$02                ;
$01/C7B0 A9 06 00    LDA #$0006              ;
$01/C7B3 85 0E       STA $0E    [$00:000E]   ;
$01/C7B5 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C7B8 80 15       BRA $15    [$C7CF]      ;

$01/C7BA AD 67 09    LDA $0967  [$00:0967]   ;
$01/C7BD 49 04 00    EOR #$0004              ;
$01/C7C0 8D 67 09    STA $0967  [$00:0967]   ;
$01/C7C3 AD 6C 09    LDA $096C  [$00:096C]   ;
$01/C7C6 49 04 00    EOR #$0004              ;
$01/C7C9 8D 6C 09    STA $096C  [$00:096C]   ;
$01/C7CC 9C 4A 01    STZ $014A  [$00:014A]   ;
$01/C7CF E2 20       SEP #$20                ;
$01/C7D1 60          RTS                     ;

DATA_01C7D2:         dw $EC1A, $EC20, $EC26, $EC2C
DATA_01C7DA:         dw $EC2C, $EC26, $EC20, $EC1A

DATA_01C7E2:         dw $EC32, $EC38, $EC3E, $EC44
DATA_01C7EA:         dw $EC44, $EC3E, $EC38, $EC32

$01/C7F2 AD 75 0B    LDA $0B75  [$00:0B75]   ;
$01/C7F5 1A          INC A                   ;
$01/C7F6 C9 0C       CMP #$0C                ;
$01/C7F8 90 05       BCC $05    [$C7FF]      ;
$01/C7FA EE 73 0B    INC $0B73  [$00:0B73]   ;
$01/C7FD A9 00       LDA #$00                ;
$01/C7FF 8D 75 0B    STA $0B75  [$00:0B75]   ;
$01/C802 AD 73 0B    LDA $0B73  [$00:0B73]   ;
$01/C805 29 07       AND #$07                ;
$01/C807 0A          ASL A                   ;
$01/C808 A8          TAY                     ;
$01/C809 C2 20       REP #$20                ;
$01/C80B AD 40 01    LDA $0140  [$00:0140]   ;
$01/C80E 29 01 00    AND #$0001              ;
$01/C811 D0 05       BNE $05    [$C818]      ;
$01/C813 B9 D2 C7    LDA $C7D2,y[$00:C7D2]   ;
$01/C816 80 03       BRA $03    [$C81B]      ;

$01/C818 B9 E2 C7    LDA $C7E2,y[$00:C7E2]   ;
$01/C81B 85 00       STA $00    [$00:0000]   ;
$01/C81D A2 02       LDX #$02                ;
$01/C81F A9 06 00    LDA #$0006              ;
$01/C822 85 0E       STA $0E    [$00:000E]   ;
$01/C824 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C827 A9 02 00    LDA #$0002              ;
$01/C82A 8D 43 0D    STA $0D43  [$00:0D43]   ;
$01/C82D A9 02 00    LDA #$0002              ;
$01/C830 8D 4B 0D    STA $0D4B  [$00:0D4B]   ;
$01/C833 E2 20       SEP #$20                ;
$01/C835 60          RTS                     ;

DATA_01C836:         dw $F76E, $F78E, $F7AE, $F7CE
DATA_01C83E:         dw $F7EE, $F80E, $F82E, $F84E

DATA_01C846:         dw $00D0, $00C8

DATA_01C84A:         dw $001C, $0038

$01/C84E AD 36 01    LDA $0136  [$00:0136]   ;
$01/C851 C9 08       CMP #$08                ;
$01/C853 D0 05       BNE $05    [$C85A]      ;
$01/C855 20 02 C7    JSR $C702  [$00:C702]   ;
$01/C858 80 03       BRA $03    [$C85D]      ;

$01/C85A 20 11 C6    JSR $C611  [$00:C611]   ;
$01/C85D C2 20       REP #$20                ;
$01/C85F AD 3C 01    LDA $013C  [$00:013C]   ;
$01/C862 29 01 00    AND #$0001              ;
$01/C865 0A          ASL A                   ;
$01/C866 A8          TAY                     ;
$01/C867 0A          ASL A                   ;
$01/C868 0A          ASL A                   ;
$01/C869 0A          ASL A                   ;
$01/C86A 85 00       STA $00    [$00:0000]   ;
$01/C86C B9 46 C8    LDA $C846,y[$00:C846]   ;
$01/C86F AA          TAX                     ;
$01/C870 B9 4A C8    LDA $C84A,y[$00:C84A]   ;
$01/C873 2D 74 79    AND $7974  [$00:7974]   ;
$01/C876 88          DEY                     ;
$01/C877 30 01       BMI $01    [$C87A]      ;
$01/C879 4A          LSR A                   ;
$01/C87A 4A          LSR A                   ;
$01/C87B A8          TAY                     ;
$01/C87C B9 36 C8    LDA $C836,y[$00:C836]   ;
$01/C87F 18          CLC                     ;
$01/C880 65 00       ADC $00    [$00:0000]   ;
$01/C882 85 00       STA $00    [$00:0000]   ;
$01/C884 A9 10 00    LDA #$0010              ;
$01/C887 85 0E       STA $0E    [$00:000E]   ;
$01/C889 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C88C E2 20       SEP #$20                ;
$01/C88E 60          RTS                     ;

DATA_01C88F:         dw $F46A, $F470, $F476, $F47C

$01/C897 C2 20       REP #$20                ;
$01/C899 AD 74 79    LDA $7974  [$00:7974]   ;
$01/C89C 29 0C 00    AND #$000C              ;
$01/C89F 4A          LSR A                   ;
$01/C8A0 AA          TAX                     ;
$01/C8A1 BD 8F C8    LDA $C88F,x[$00:C891]   ;
$01/C8A4 85 00       STA $00    [$00:0000]   ;
$01/C8A6 A9 06 00    LDA #$0006              ;
$01/C8A9 85 0E       STA $0E    [$00:000E]   ;
$01/C8AB A2 0A       LDX #$0A                ;
$01/C8AD 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C8B0 E2 20       SEP #$20                ;
$01/C8B2 60          RTS                     ;

DATA_01C8B3:         dw $F760, $F752, $F744, $F736
DATA_01C8BB:         dw $F728, $F71A, $F70C, $F6FE

DATA_01C8C3:         dw $00C0, $00A0, $00E0, $00A0

$01/C8CB C2 20       REP #$20                ;
$01/C8CD AD 77 0B    LDA $0B77  [$00:0B77]   ;
$01/C8D0 C9 80 00    CMP #$0080              ;
$01/C8D3 B0 15       BCS $15    [$C8EA]      ;
$01/C8D5 4A          LSR A                   ;
$01/C8D6 4A          LSR A                   ;
$01/C8D7 29 0E 00    AND #$000E              ;
$01/C8DA AA          TAX                     ;
$01/C8DB BD B3 C8    LDA $C8B3,x[$00:C8B5]   ;
$01/C8DE 85 00       STA $00    [$00:0000]   ;
$01/C8E0 A9 0E 00    LDA #$000E              ;
$01/C8E3 85 0E       STA $0E    [$00:000E]   ;
$01/C8E5 A2 92       LDX #$92                ;
$01/C8E7 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C8EA CE 77 0B    DEC $0B77  [$00:0B77]   ;
$01/C8ED 10 11       BPL $11    [$C900]      ;
$01/C8EF 22 75 88 12 JSL $128875[$12:8875]   ;
$01/C8F3 65 30       ADC $30    [$00:0030]   ;
$01/C8F5 29 03 00    AND #$0003              ;
$01/C8F8 0A          ASL A                   ;
$01/C8F9 AA          TAX                     ;
$01/C8FA BD C3 C8    LDA $C8C3,x[$00:C8C5]   ;
$01/C8FD 8D 77 0B    STA $0B77  [$00:0B77]   ;
$01/C900 E2 20       SEP #$20                ;
$01/C902 20 C1 C5    JSR $C5C1  [$00:C5C1]   ;
$01/C905 60          RTS                     ;

$01/C906 20 4E C8    JSR $C84E  [$00:C84E]   ;
$01/C909 C2 20       REP #$20                ;
$01/C90B A9 5E F9    LDA #$F95E              ;
$01/C90E 85 00       STA $00    [$00:0000]   ;
$01/C910 E2 20       SEP #$20                ;
$01/C912 C2 20       REP #$20                ;
$01/C914 AD 79 0B    LDA $0B79  [$00:0B79]   ;
$01/C917 C9 20 03    CMP #$0320              ;
$01/C91A 90 2A       BCC $2A    [$C946]      ;
$01/C91C C9 20 05    CMP #$0520              ;
$01/C91F B0 31       BCS $31    [$C952]      ;
$01/C921 E9 1F 03    SBC #$031F              ;
$01/C924 29 E0 FF    AND #$FFE0              ;
$01/C927 4A          LSR A                   ;
$01/C928 4A          LSR A                   ;
$01/C929 65 00       ADC $00    [$00:0000]   ;
$01/C92B 85 00       STA $00    [$00:0000]   ;
$01/C92D A9 08 00    LDA #$0008              ;
$01/C930 85 0E       STA $0E    [$00:000E]   ;
$01/C932 A2 00       LDX #$00                ;
$01/C934 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C937 A9 04 13    LDA #$1304              ;
$01/C93A 8D 67 09    STA $0967  [$00:0967]   ;
$01/C93D AD 6C 09    LDA $096C  [$00:096C]   ;
$01/C940 09 04 00    ORA #$0004              ;
$01/C943 8D 6C 09    STA $096C  [$00:096C]   ;
$01/C946 18          CLC                     ;
$01/C947 F8          SED                     ;
$01/C948 AD 79 0B    LDA $0B79  [$00:0B79]   ;
$01/C94B 69 01 00    ADC #$0001              ;
$01/C94E 8D 79 0B    STA $0B79  [$00:0B79]   ;
$01/C951 D8          CLD                     ;
$01/C952 E2 20       SEP #$20                ;
$01/C954 60          RTS                     ;

$01/C955 20 02 C7    JSR $C702  [$00:C702]   ;
$01/C958 20 CB C8    JSR $C8CB  [$00:C8CB]   ;
$01/C95B C2 20       REP #$20                ;
$01/C95D A9 DE F9    LDA #$F9DE              ;
$01/C960 85 00       STA $00    [$00:0000]   ;
$01/C962 E2 20       SEP #$20                ;
$01/C964 20 12 C9    JSR $C912  [$00:C912]   ;
$01/C967 60          RTS                     ;

$01/C968 20 D9 C4    JSR $C4D9  [$00:C4D9]   ;
$01/C96B 20 5D C8    JSR $C85D  [$00:C85D]   ;
$01/C96E C2 20       REP #$20                ;
$01/C970 AD 74 79    LDA $7974  [$00:7974]   ;
$01/C973 29 38 00    AND #$0038              ;
$01/C976 4A          LSR A                   ;
$01/C977 4A          LSR A                   ;
$01/C978 AA          TAX                     ;
$01/C979 BD 34 C6    LDA $C634,x[$00:C634]   ;
$01/C97C 85 00       STA $00    [$00:0000]   ;
$01/C97E A2 86       LDX #$86                ;
$01/C980 A9 1A 00    LDA #$001A              ;
$01/C983 85 0E       STA $0E    [$00:000E]   ;
$01/C985 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C988 E2 20       SEP #$20                ;
$01/C98A 60          RTS                     ;

$01/C98B C2 20       REP #$20                ;
$01/C98D AD 79 0B    LDA $0B79  [$00:0B79]   ;
$01/C990 C9 20 03    CMP #$0320              ;
$01/C993 90 2B       BCC $2B    [$C9C0]      ;
$01/C995 C9 20 05    CMP #$0520              ;
$01/C998 B0 32       BCS $32    [$C9CC]      ;
$01/C99A E9 1F 03    SBC #$031F              ;
$01/C99D 29 E0 FF    AND #$FFE0              ;
$01/C9A0 4A          LSR A                   ;
$01/C9A1 4A          LSR A                   ;
$01/C9A2 69 DE F9    ADC #$F9DE              ;
$01/C9A5 85 00       STA $00    [$00:0000]   ;
$01/C9A7 A9 08 00    LDA #$0008              ;
$01/C9AA 85 0E       STA $0E    [$00:000E]   ;
$01/C9AC A2 00       LDX #$00                ;
$01/C9AE 20 CF C9    JSR $C9CF  [$00:C9CF]   ;
$01/C9B1 A9 04 13    LDA #$1304              ;
$01/C9B4 8D 67 09    STA $0967  [$00:0967]   ;
$01/C9B7 AD 6C 09    LDA $096C  [$00:096C]   ;
$01/C9BA 09 04 00    ORA #$0004              ;
$01/C9BD 8D 6C 09    STA $096C  [$00:096C]   ;
$01/C9C0 18          CLC                     ;
$01/C9C1 F8          SED                     ;
$01/C9C2 AD 79 0B    LDA $0B79  [$00:0B79]   ;
$01/C9C5 69 01 00    ADC #$0001              ;
$01/C9C8 8D 79 0B    STA $0B79  [$00:0B79]   ;
$01/C9CB D8          CLD                     ;
$01/C9CC E2 20       SEP #$20                ;
$01/C9CE 60          RTS                     ;

$01/C9CF A9 5F 00    LDA #$005F              ;
$01/C9D2 85 02       STA $02    [$00:0002]   ;
$01/C9D4 8B          PHB                     ;
$01/C9D5 A0 70       LDY #$70                ;
$01/C9D7 5A          PHY                     ;
$01/C9D8 AB          PLB                     ;
$01/C9D9 A0 00       LDY #$00                ;
$01/C9DB B7 00       LDA [$00],y[$00:707E]   ;
$01/C9DD 9D 6C 2D    STA $2D6C,x[$00:2D6E]   ;
$01/C9E0 9D 00 20    STA $2000,x[$00:2002]   ;
$01/C9E3 E8          INX                     ;
$01/C9E4 E8          INX                     ;
$01/C9E5 C8          INY                     ;
$01/C9E6 C8          INY                     ;
$01/C9E7 C4 0E       CPY $0E    [$00:000E]   ;
$01/C9E9 90 F0       BCC $F0    [$C9DB]      ;
$01/C9EB AB          PLB                     ;
$01/C9EC 60          RTS                     ;

DATA_01C9ED:         db $2A, $14, $E0, $30
DATA_01C9F1:         db $3A, $14, $E2, $30
DATA_01C9F5:         db $2A, $24, $00, $31
DATA_01C9F9:         db $3A, $24, $02, $31
DATA_01C9FD:         db $46, $14, $E4, $30
DATA_01CA01:         db $56, $14, $E6, $30
DATA_01CA05:         db $46, $24, $04, $31
DATA_01CA09:         db $56, $24, $06, $31
DATA_01CA0D:         db $62, $14, $E8, $30
DATA_01CA11:         db $72, $14, $EA, $30
DATA_01CA15:         db $62, $24, $08, $31
DATA_01CA19:         db $72, $24, $0A, $31
DATA_01CA1D:         db $7E, $14, $EC, $30
DATA_01CA21:         db $8E, $14, $EE, $30
DATA_01CA25:         db $7E, $24, $0C, $31
DATA_01CA29:         db $8E, $24, $0E, $31
DATA_01CA2D:         db $9A, $14, $20, $31
DATA_01CA31:         db $AA, $14, $22, $31
DATA_01CA35:         db $9A, $24, $28, $31
DATA_01CA39:         db $AA, $24, $2A, $31

DATA_01CA3D:         dw $0400, $0C08, $FC10, $FC04
DATA_01CA45:         dw $FC04, $FC04, $FC04, $FC04
DATA_01CA4D:         dw $0001, $3420, $3420, $3420
DATA_01CA55:         dw $3420, $3420, $3420, $0400
DATA_01CA5D:         dw $40FF, $0010, $0201, $0403
DATA_01CA65:         dw $3010, $7050, $5010, $5050
DATA_01CA6D:         dw $7050, $0001, $0002

; pause screen transition pointers: per frame
DATA_01CA73:         dw $CAF7
DATA_01CA75:         dw $CB2F
DATA_01CA77:         dw $CB60
DATA_01CA79:         dw $CB7C
DATA_01CA7B:         dw $CBA9
DATA_01CA7D:         dw $CBBF
DATA_01CA7F:         dw $CC0B
DATA_01CA81:         dw $CC2F
DATA_01CA83:         dw $CC5C
DATA_01CA85:         dw $CC8E
DATA_01CA87:         dw $CAEE
DATA_01CA89:         dw $CC98
DATA_01CA8B:         dw $CC98
DATA_01CA8D:         dw $CC98
DATA_01CA8F:         dw $CC98
DATA_01CA91:         dw $CC98
DATA_01CA93:         dw $CC98
DATA_01CA95:         dw $CC98
DATA_01CA97:         dw $CCB1
DATA_01CA99:         dw $CE34

$01/CA9B C2 30       REP #$30                ;
$01/CA9D AD 0F 0B    LDA $0B0F  [$00:0B0F]   ;
$01/CAA0 29 FF 00    AND #$00FF              ;
$01/CAA3 0A          ASL A                   ;
$01/CAA4 AA          TAX                     ;
$01/CAA5 AD 10 0B    LDA $0B10  [$00:0B10]   ;
$01/CAA8 29 FF 00    AND #$00FF              ;
$01/CAAB 0A          ASL A                   ;
$01/CAAC A8          TAY                     ;
$01/CAAD FC 71 CA    JSR ($CA71,x)[$00:7A85] ;

$01/CAB0 E2 30       SEP #$30                ;
$01/CAB2 AD 0F 0B    LDA $0B0F  [$00:0B0F]   ;
$01/CAB5 C9 0B       CMP #$0B                ;
$01/CAB7 90 0B       BCC $0B    [$CAC4]      ;
$01/CAB9 AD F6 0C    LDA $0CF6  [$00:0CF6]   ;
$01/CABC F0 06       BEQ $06    [$CAC4]      ;
$01/CABE 20 0A DE    JSR $DE0A  [$00:DE0A]   ;
$01/CAC1 20 D6 CA    JSR $CAD6  [$00:CAD6]   ;
$01/CAC4 AB          PLB                     ;
$01/CAC5 6B          RTL                     ;

DATA_01CAC6:         dw $7C00, $7C1F, $001F, $03FF
DATA_01CACE:         dw $03E0, $03FF, $001F, $7C1F

$01/CAD6 C2 20       REP #$20                ;
$01/CAD8 A5 30       LDA $30    [$00:0030]   ;
$01/CADA 29 38 00    AND #$0038              ;
$01/CADD 4A          LSR A                   ;
$01/CADE 4A          LSR A                   ;
$01/CADF AA          TAX                     ;
$01/CAE0 BD C6 CA    LDA $CAC6,x[$01:CAC1]   ;
$01/CAE3 8F 3C 20 70 STA $70203C[$70:203C]   ;
$01/CAE7 E2 20       SEP #$20                ;
$01/CAE9 60          RTS                     ;

DATA_01CAEA:         dw $CB1E, $CB13

$01/CAEE E2 30       SEP #$30                ;
$01/CAF0 AD 10 0B    LDA $0B10  [$00:0B10]   ;
$01/CAF3 49 01       EOR #$01                ;
$01/CAF5 80 05       BRA $05    [$CAFC]      ;

$01/CAF7 E2 30       SEP #$30                ;
$01/CAF9 AD 10 0B    LDA $0B10  [$00:0B10]   ;
$01/CAFC 48          PHA                     ;
$01/CAFD 0A          ASL A                   ;
$01/CAFE AA          TAX                     ;
$01/CAFF AD 00 02    LDA $0200  [$00:0200]   ;
$01/CB02 FC EA CA    JSR ($CAEA,x)[$00:BF6D] ;

$01/CB05 68          PLA                     ;
$01/CB06 4D 10 0B    EOR $0B10  [$00:0B10]   ;
$01/CB09 F0 01       BEQ $01    [$CB0C]      ;
$01/CB0B 60          RTS                     ;

$01/CB0C C2 20       REP #$20                ;
$01/CB0E 68          PLA                     ;
$01/CB0F 5C E2 C2 01 JMP $01C2E2[$01:C2E2]   ;

$01/CB13 3A          DEC A                   ;
$01/CB14 3A          DEC A                   ;
$01/CB15 10 14       BPL $14    [$CB2B]      ;
$01/CB17 20 5D CE    JSR $CE5D  [$00:CE5D]   ;
$01/CB1A A9 80 80    LDA #$8080              ;
$01/CB1D 0D 29 0F    ORA $0F29  [$00:0F29]   ;
$01/CB20 1A          INC A                   ;
$01/CB21 1A          INC A                   ;
$01/CB22 C9 0F 90    CMP #$900F              ;
$01/CB25 05 20       ORA $20    [$00:0020]   ;
$01/CB27 5D CE A9    EOR $A9CE,x[$00:A9CE]   ;
$01/CB2A 0F 8D 00 02 ORA $02008D[$02:008D]   ;
$01/CB2E 60          RTS                     ;

$01/CB2F E2 30       SEP #$30                ;
$01/CB31 22 4B 82 00 JSL $00824B[$00:824B]   ;
$01/CB35 C2 30       REP #$30                ;
$01/CB37 AD 10 0B    LDA $0B10  [$00:0B10]   ;
$01/CB3A D0 18       BNE $18    [$CB54]      ;
$01/CB3C 9C 3C 09    STZ $093C  [$00:093C]   ;
$01/CB3F 9C 3E 09    STZ $093E  [$00:093E]   ;
$01/CB42 9C 40 09    STZ $0940  [$00:0940]   ;
$01/CB45 9C 42 09    STZ $0942  [$00:0942]   ;
$01/CB48 64 35       STZ $35    [$00:0035]   ;
$01/CB4A 64 37       STZ $37    [$00:0037]   ;
$01/CB4C E2 30       SEP #$30                ;
$01/CB4E 22 88 C1 01 JSL $01C188[$01:C188]   ;
$01/CB52 C2 30       REP #$30                ;
$01/CB54 20 5D CE    JSR $CE5D  [$00:CE5D]   ;
$01/CB57 60          RTS                     ;

DATA_01CB58:         dw $5400, $D400

DATA_01CB5C:         dw $1000, $1002

$01/CB60 BB          TYX                     ;
$01/CB61 BD 6F CA    LDA $CA6F,x[$00:CA6F]   ;
$01/CB64 85 53       STA $53    [$00:0053]   ;
$01/CB66 A9 BE 7B    LDA #$7BBE              ;
$01/CB69 85 00       STA $00    [$00:0000]   ;
$01/CB6B BC 5C CB    LDY $CB5C,x[$00:CB5C]   ;
$01/CB6E BD 58 CB    LDA $CB58,x[$00:CB58]   ;
$01/CB71 4C CB CB    JMP $CBCB  [$00:CBCB]   ;

DATA_01CB74:         dw $4E00, $CE00

DATA_01CB78:         dw $0C00, $0C02

$01/CB7C E2 30       SEP #$30                ;
$01/CB7E A2 35       LDX #$35                ;
$01/CB80 9E 12 0B    STZ $0B12,x[$00:0B12]   ;
$01/CB83 CA          DEX                     ;
$01/CB84 10 FA       BPL $FA    [$CB80]      ;
$01/CB86 A2 04       LDX #$04                ;
$01/CB88 BD 3D CA    LDA $CA3D,x[$00:CA3D]   ;
$01/CB8B 9D 42 0B    STA $0B42,x[$00:0B42]   ;
$01/CB8E CA          DEX                     ;
$01/CB8F 10 F7       BPL $F7    [$CB88]      ;
$01/CB91 C2 30       REP #$30                ;
$01/CB93 BB          TYX                     ;
$01/CB94 A9 BE 7B    LDA #$7BBE              ;
$01/CB97 18          CLC                     ;
$01/CB98 6D 5E CB    ADC $CB5E  [$00:CB5E]   ;
$01/CB9B 85 00       STA $00    [$00:0000]   ;
$01/CB9D BC 78 CB    LDY $CB78,x[$00:CB78]   ;
$01/CBA0 BD 74 CB    LDA $CB74,x[$00:CB74]   ;
$01/CBA3 80 26       BRA $26    [$CBCB]      ;

DATA_01CBA5:         dw $2800, $A800

$01/CBA9 BB          TYX                     ;
$01/CBAA A9 C4 97    LDA #$97C4              ;
$01/CBAD 85 00       STA $00    [$00:0000]   ;
$01/CBAF BC 5C CB    LDY $CB5C,x[$00:CB5C]   ;
$01/CBB2 BD A5 CB    LDA $CBA5,x[$00:CBA5]   ;
$01/CBB5 80 14       BRA $14    [$CBCB]      ;

DATA_01CBB7:         dw $3400, $B400

DATA_01CBBB:         dw $0800, $0802

$01/CBBF BB          TYX                     ;
$01/CBC0 A9 C6 A7    LDA #$A7C6              ;
$01/CBC3 85 00       STA $00    [$00:0000]   ;
$01/CBC5 BC BB CB    LDY $CBBB,x[$00:CBBB]   ;
$01/CBC8 BD B7 CB    LDA $CBB7,x[$00:CBB7]   ;
$01/CBCB 8B          PHB                     ;
$01/CBCC F4 48 7E    PEA $7E48               ;
$01/CBCF AB          PLB                     ;
$01/CBD0 AB          PLB                     ;
$01/CBD1 AE 00 48    LDX $4800  [$00:4800]   ;
$01/CBD4 9D 00 00    STA $0000,x[$00:0000]   ;
$01/CBD7 0A          ASL A                   ;
$01/CBD8 A9 80 00    LDA #$0080              ;
$01/CBDB 9D 02 00    STA $0002,x[$00:0002]   ;
$01/CBDE A9 7E 00    LDA #$007E              ;
$01/CBE1 9D 07 00    STA $0007,x[$00:0007]   ;
$01/CBE4 98          TYA                     ;
$01/CBE5 9D 08 00    STA $0008,x[$00:0008]   ;
$01/CBE8 A9 81 39    LDA #$3981              ;
$01/CBEB A4 00       LDY $00    [$00:0000]   ;
$01/CBED B0 05       BCS $05    [$CBF4]      ;
$01/CBEF A9 01 18    LDA #$1801              ;
$01/CBF2 C8          INY                     ;
$01/CBF3 C8          INY                     ;
$01/CBF4 9D 03 00    STA $0003,x[$00:0003]   ;
$01/CBF7 98          TYA                     ;
$01/CBF8 9D 05 00    STA $0005,x[$00:0005]   ;
$01/CBFB 8A          TXA                     ;
$01/CBFC 18          CLC                     ;
$01/CBFD 69 0C 00    ADC #$000C              ;
$01/CC00 9D 0A 00    STA $000A,x[$00:000A]   ;
$01/CC03 8D 00 48    STA $4800  [$00:4800]   ;
$01/CC06 AB          PLB                     ;
$01/CC07 20 5D CE    JSR $CE5D  [$00:CE5D]   ;
$01/CC0A 60          RTS                     ;

$01/CC0B 98          TYA                     ;
$01/CC0C F0 1D       BEQ $1D    [$CC2B]      ;
$01/CC0E A2 00 E8    LDX #$E800              ;
$01/CC11 A9 56 00    LDA #$0056              ;
$01/CC14 AC 48 0B    LDY $0B48  [$00:0B48]   ;
$01/CC17 F0 06       BEQ $06    [$CC1F]      ;
$01/CC19 A2 00 B0    LDX #$B000              ;
$01/CC1C A9 52 00    LDA #$0052              ;
$01/CC1F 85 01       STA $01    [$00:0001]   ;
$01/CC21 A0 00 54    LDY #$5400              ;
$01/CC24 A9 00 04    LDA #$0400              ;
$01/CC27 22 A6 BE 00 JSL $00BEA6[$00:BEA6]   ;
$01/CC2B 20 5D CE    JSR $CE5D  [$00:CE5D]   ;
$01/CC2E 60          RTS                     ;

$01/CC2F 98          TYA                     ;
$01/CC30 F0 16       BEQ $16    [$CC48]      ;
$01/CC32 A9 4F 00    LDA #$004F              ;
$01/CC35 22 53 B7 00 JSL $00B753[$00:B753]   ;
$01/CC39 A2 70 00    LDX #$0070              ;
$01/CC3C 86 01       STX $01    [$00:0001]   ;
$01/CC3E A2 00 68    LDX #$6800              ;
$01/CC41 A0 00 2C    LDY #$2C00              ;
$01/CC44 22 A6 BE 00 JSL $00BEA6[$00:BEA6]   ;
$01/CC48 20 5D CE    JSR $CE5D  [$00:CE5D]   ;
$01/CC4B 60          RTS                     ;

DATA_01CC4C:         dw $007E, $0000, $007E

DATA_01CC52:         dw $AFC8, $095E, $AFC8, $CE83
DATA_01CC5A:         dw $CEB7, $5D20, $BBCE, $58FC
DATA_01CC62:         dw $B9CC, $CC4C, $0285

$01/CC68 B9 52 CC    LDA $CC52,y[$00:CC52]   ;
$01/CC6B 85 00       STA $00    [$00:0000]   ;
$01/CC6D C8          INY                     ;
$01/CC6E C8          INY                     ;
$01/CC6F B9 4C CC    LDA $CC4C,y[$00:CC4C]   ;
$01/CC72 85 05       STA $05    [$00:0005]   ;
$01/CC74 B9 52 CC    LDA $CC52,y[$00:CC52]   ;
$01/CC77 85 03       STA $03    [$00:0003]   ;
$01/CC79 A0 00 00    LDY #$0000              ;
$01/CC7C BB          TYX                     ;
$01/CC7D E2 20       SEP #$20                ;
$01/CC7F B7 00       LDA [$00],y[$55:5555]   ;
$01/CC81 97 03       STA [$03],y[$55:5555]   ;
$01/CC83 C8          INY                     ;
$01/CC84 C0 0E 00    CPY #$000E              ;
$01/CC87 90 F6       BCC $F6    [$CC7F]      ;
$01/CC89 60          RTS                     ;

DATA_01CC8A:         dw $CF07
DATA_01CC8C:         dw $CF1F

$01/CC8E 20 5D CE    JSR $CE5D  [$00:CE5D]   ;
$01/CC91 8B          PHB                     ;
$01/CC92 E2 10       SEP #$10                ;
$01/CC94 BB          TYX                     ;
$01/CC95 7C 8A CC    JMP ($CC8A,x)[$00:F50C] ;

$01/CC98 20 5D CE    JSR $CE5D  [$00:CE5D]   ;
$01/CC9B E2 30       SEP #$30                ;
$01/CC9D AD 0F 0B    LDA $0B0F  [$00:0B0F]   ;
$01/CCA0 38          SEC                     ;
$01/CCA1 E9 0C       SBC #$0C                ;
$01/CCA3 0A          ASL A                   ;
$01/CCA4 0A          ASL A                   ;
$01/CCA5 0A          ASL A                   ;
$01/CCA6 A2 04       LDX #$04                ;
$01/CCA8 9D 36 0B    STA $0B36,x[$00:0B36]   ;
$01/CCAB CA          DEX                     ;
$01/CCAC 10 FA       BPL $FA    [$CCA8]      ;
$01/CCAE 4C 56 CD    JMP $CD56  [$00:CD56]   ;

$01/CCB1 E2 30       SEP #$30                ;
$01/CCB3 AD 57 03    LDA $0357  [$00:0357]   ;
$01/CCB6 F0 03       BEQ $03    [$CCBB]      ;
$01/CCB8 20 D5 DB    JSR $DBD5  [$00:DBD5]   ;
$01/CCBB AD 98 03    LDA $0398  [$00:0398]   ;
$01/CCBE F0 06       BEQ $06    [$CCC6]      ;
$01/CCC0 A5 37       LDA $37    [$00:0037]   ;
$01/CCC2 29 80       AND #$80                ;
$01/CCC4 D0 06       BNE $06    [$CCCC]      ;
$01/CCC6 05 38       ORA $38    [$00:0038]   ;
$01/CCC8 29 90       AND #$90                ;
$01/CCCA F0 03       BEQ $03    [$CCCF]      ;
$01/CCCC 20 5D CE    JSR $CE5D  [$00:CE5D]   ;
$01/CCCF A2 04       LDX #$04                ;
$01/CCD1 BD 42 0B    LDA $0B42,x[$00:0B42]   ;
$01/CCD4 F0 0B       BEQ $0B    [$CCE1]      ;
$01/CCD6 A5 30       LDA $30    [$00:0030]   ;
$01/CCD8 29 03       AND #$03                ;
$01/CCDA D0 74       BNE $74    [$CD50]      ;
$01/CCDC DE 42 0B    DEC $0B42,x[$00:0B42]   ;
$01/CCDF 80 6F       BRA $6F    [$CD50]      ;

$01/CCE1 BC 3C 0B    LDY $0B3C,x[$00:0B3C]   ;
$01/CCE4 A5 30       LDA $30    [$00:0030]   ;
$01/CCE6 29 03       AND #$03                ;
$01/CCE8 D0 12       BNE $12    [$CCFC]      ;
$01/CCEA BD 36 0B    LDA $0B36,x[$00:0B36]   ;
$01/CCED 18          CLC                     ;
$01/CCEE 79 42 CA    ADC $CA42,y[$00:CA42]   ;
$01/CCF1 9D 36 0B    STA $0B36,x[$00:0B36]   ;
$01/CCF4 D9 4F CA    CMP $CA4F,y[$00:CA4F]   ;
$01/CCF7 D0 03       BNE $03    [$CCFC]      ;
$01/CCF9 FE 3C 0B    INC $0B3C,x[$00:0B3C]   ;
$01/CCFC C0 0B       CPY #$0B                ;
$01/CCFE 90 50       BCC $50    [$CD50]      ;
$01/CD00 BD 1E 0B    LDA $0B1E,x[$00:0B1E]   ;
$01/CD03 D9 53 CA    CMP $CA53,y[$00:CA53]   ;
$01/CD06 D0 19       BNE $19    [$CD21]      ;
$01/CD08 C0 0B       CPY #$0B                ;
$01/CD0A F0 24       BEQ $24    [$CD30]      ;
$01/CD0C BD 12 0B    LDA $0B12,x[$00:0B12]   ;
$01/CD0F D0 1F       BNE $1F    [$CD30]      ;
$01/CD11 9E 3C 0B    STZ $0B3C,x[$00:0B3C]   ;
$01/CD14 9E 1E 0B    STZ $0B1E,x[$00:0B1E]   ;
$01/CD17 9E 2A 0B    STZ $0B2A,x[$00:0B2A]   ;
$01/CD1A A9 20       LDA #$20                ;
$01/CD1C 9D 42 0B    STA $0B42,x[$00:0B42]   ;
$01/CD1F 80 35       BRA $35    [$CD56]      ;

$01/CD21 A5 30       LDA $30    [$00:0030]   ;
$01/CD23 4A          LSR A                   ;
$01/CD24 B0 0A       BCS $0A    [$CD30]      ;
$01/CD26 BD 1E 0B    LDA $0B1E,x[$00:0B1E]   ;
$01/CD29 18          CLC                     ;
$01/CD2A 79 51 CA    ADC $CA51,y[$00:CA51]   ;
$01/CD2D 9D 1E 0B    STA $0B1E,x[$00:0B1E]   ;
$01/CD30 BD 1E 0B    LDA $0B1E,x[$00:0B1E]   ;
$01/CD33 A8          TAY                     ;
$01/CD34 0A          ASL A                   ;
$01/CD35 0A          ASL A                   ;
$01/CD36 0A          ASL A                   ;
$01/CD37 0A          ASL A                   ;
$01/CD38 18          CLC                     ;
$01/CD39 7D 2A 0B    ADC $0B2A,x[$00:0B2A]   ;
$01/CD3C 9D 2A 0B    STA $0B2A,x[$00:0B2A]   ;
$01/CD3F 98          TYA                     ;
$01/CD40 08          PHP                     ;
$01/CD41 4A          LSR A                   ;
$01/CD42 4A          LSR A                   ;
$01/CD43 4A          LSR A                   ;
$01/CD44 4A          LSR A                   ;
$01/CD45 28          PLP                     ;
$01/CD46 10 02       BPL $02    [$CD4A]      ;
$01/CD48 09 F0       ORA #$F0                ;
$01/CD4A 7D 12 0B    ADC $0B12,x[$00:0B12]   ;
$01/CD4D 9D 12 0B    STA $0B12,x[$00:0B12]   ;
$01/CD50 CA          DEX                     ;
$01/CD51 30 03       BMI $03    [$CD56]      ;
$01/CD53 4C D1 CC    JMP $CCD1  [$00:CCD1]   ;

$01/CD56 C2 20       REP #$20                ;
$01/CD58 A9 00 68    LDA #$6800              ;
$01/CD5B 8D 02 30    STA $3002  [$00:3002]   ;
$01/CD5E A9 00 08    LDA #$0800              ;
$01/CD61 8D 18 30    STA $3018  [$00:3018]   ;
$01/CD64 A2 08       LDX #$08                ;
$01/CD66 A9 F1 D2    LDA #$D2F1              ;
$01/CD69 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/CD6D A2 04       LDX #$04                ;
$01/CD6F BD 60 CA    LDA $CA60,x[$00:CA60]   ;
$01/CD72 29 FF 00    AND #$00FF              ;
$01/CD75 8D 02 30    STA $3002  [$00:3002]   ;
$01/CD78 BD 12 0B    LDA $0B12,x[$00:0B12]   ;
$01/CD7B 29 FF 00    AND #$00FF              ;
$01/CD7E 8D 04 30    STA $3004  [$00:3004]   ;
$01/CD81 8D 06 30    STA $3006  [$00:3006]   ;
$01/CD84 BD 65 CA    LDA $CA65,x[$00:CA65]   ;
$01/CD87 29 FF 00    AND #$00FF              ;
$01/CD8A 8D 08 30    STA $3008  [$00:3008]   ;
$01/CD8D BD 6A CA    LDA $CA6A,x[$00:CA6A]   ;
$01/CD90 29 FF 00    AND #$00FF              ;
$01/CD93 8D 0A 30    STA $300A  [$00:300A]   ;
$01/CD96 BD 36 0B    LDA $0B36,x[$00:0B36]   ;
$01/CD99 29 FF 00    AND #$00FF              ;
$01/CD9C 8D 0C 30    STA $300C  [$00:300C]   ;
$01/CD9F DA          PHX                     ;
$01/CDA0 A2 08       LDX #$08                ;
$01/CDA2 A9 65 F1    LDA #$F165              ;
$01/CDA5 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/CDA9 FA          PLX                     ;
$01/CDAA CA          DEX                     ;
$01/CDAB 10 C2       BPL $C2    [$CD6F]      ;
$01/CDAD A9 00 74    LDA #$7400              ;
$01/CDB0 8D 02 30    STA $3002  [$00:3002]   ;
$01/CDB3 A9 00 71    LDA #$7100              ;
$01/CDB6 8D 04 30    STA $3004  [$00:3004]   ;
$01/CDB9 A9 80 00    LDA #$0080              ;
$01/CDBC 8D 06 30    STA $3006  [$00:3006]   ;
$01/CDBF A9 01 00    LDA #$0001              ;
$01/CDC2 8D 08 30    STA $3008  [$00:3008]   ;
$01/CDC5 A2 08       LDX #$08                ;
$01/CDC7 A9 FB D2    LDA #$D2FB              ;
$01/CDCA 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/CDCE A9 00 76    LDA #$7600              ;
$01/CDD1 8D 02 30    STA $3002  [$00:3002]   ;
$01/CDD4 A9 00 73    LDA #$7300              ;
$01/CDD7 8D 04 30    STA $3004  [$00:3004]   ;
$01/CDDA A9 80 00    LDA #$0080              ;
$01/CDDD 8D 06 30    STA $3006  [$00:3006]   ;
$01/CDE0 A9 01 00    LDA #$0001              ;
$01/CDE3 8D 08 30    STA $3008  [$00:3008]   ;
$01/CDE6 A2 08       LDX #$08                ;
$01/CDE8 A9 FB D2    LDA #$D2FB              ;
$01/CDEB 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/CDEF A9 AA AA    LDA #$AAAA              ;
$01/CDF2 8F 00 6C 00 STA $006C00[$00:6C00]   ;
$01/CDF6 8F 02 6C 00 STA $006C02[$00:6C02]   ;
$01/CDFA 8F 04 6C 00 STA $006C04[$00:6C04]   ;
$01/CDFE 8F 06 6C 00 STA $006C06[$00:6C06]   ;
$01/CE02 E2 20       SEP #$20                ;
$01/CE04 64 00       STZ $00    [$00:0000]   ;
$01/CE06 A9 10       LDA #$10                ;
$01/CE08 85 00       STA $00    [$00:0000]   ;
$01/CE0A A2 00       LDX #$00                ;
$01/CE0C BD ED C9    LDA $C9ED,x[$00:C9ED]   ;
$01/CE0F 18          CLC                     ;
$01/CE10 65 00       ADC $00    [$00:0000]   ;
$01/CE12 9F 00 6A 00 STA $006A00,x[$00:6A00] ;
$01/CE16 BD EE C9    LDA $C9EE,x[$00:C9EE]   ;
$01/CE19 9F 01 6A 00 STA $006A01,x[$00:6A01] ;
$01/CE1D BD EF C9    LDA $C9EF,x[$00:C9EF]   ;
$01/CE20 9F 02 6A 00 STA $006A02,x[$00:6A02] ;
$01/CE24 BD F0 C9    LDA $C9F0,x[$00:C9F0]   ;
$01/CE27 9F 03 6A 00 STA $006A03,x[$00:6A03] ;
$01/CE2B E8          INX                     ;
$01/CE2C E8          INX                     ;
$01/CE2D E8          INX                     ;
$01/CE2E E8          INX                     ;
$01/CE2F E0 50       CPX #$50                ;
$01/CE31 90 D9       BCC $D9    [$CE0C]      ;
$01/CE33 60          RTS                     ;

$01/CE34 E2 30       SEP #$30                ;
$01/CE36 AD 98 03    LDA $0398  [$00:0398]   ;
$01/CE39 F0 0D       BEQ $0D    [$CE48]      ;
$01/CE3B EE 11 0B    INC $0B11  [$00:0B11]   ;
$01/CE3E AD 11 0B    LDA $0B11  [$00:0B11]   ;
$01/CE41 C9 20       CMP #$20                ;
$01/CE43 90 13       BCC $13    [$CE58]      ;
$01/CE45 9C 11 0B    STZ $0B11  [$00:0B11]   ;
$01/CE48 AD 10 0B    LDA $0B10  [$00:0B10]   ; \
$01/CE4B 49 01       EOR #$01                ;  | inverts pause flag
$01/CE4D 29 01       AND #$01                ;  |
$01/CE4F 8D 10 0B    STA $0B10  [$00:0B10]   ; /
$01/CE52 20 5D CE    JSR $CE5D  [$00:CE5D]   ;
$01/CE55 20 5D CE    JSR $CE5D  [$00:CE5D]   ; 2x speed for pause transition
$01/CE58 4C 56 CD    JMP $CD56  [$00:CD56]   ;

$01/CE5B             db $FF, $01

$01/CE5D 5A          PHY
$01/CE5E 08          PHP
$01/CE5F E2 20       SEP #$20                ;
$01/CE61 AC 10 0B    LDY $0B10  [$00:0B10]   ;
$01/CE64 AD 0F 0B    LDA $0B0F  [$00:0B0F]   ;
$01/CE67 18          CLC                     ;
$01/CE68 79 5B CE    ADC $CE5B,y[$00:CE5B]   ; increment or decrement
$01/CE6B 8D 0F 0B    STA $0B0F  [$00:0B0F]   ; if unpaused or paused
$01/CE6E D0 10       BNE $10    [$CE80]      ;
$01/CE70 AD 98 03    LDA $0398  [$00:0398]   ; unpausing finished
$01/CE73 F0 0B       BEQ $0B    [$CE80]      ; also check this flag
$01/CE75 A9 27       LDA #$27                ;\ play sound #$0027
$01/CE77 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/CE7B A9 40       LDA #$40                ;
$01/CE7D 8D 9C 03    STA $039C  [$00:039C]   ;
$01/CE80 28          PLP                     ;
$01/CE81 7A          PLY                     ;
$01/CE82 60          RTS                     ;

$01/CE83 AF D7 AF 7E LDA $7EAFD7[$7E:AFD7]   ;
$01/CE87 85 41       STA $41    [$00:0041]   ;
$01/CE89 AF D9 AF 7E LDA $7EAFD9[$7E:AFD9]   ;
$01/CE8D 85 43       STA $43    [$00:0043]   ;
$01/CE8F AF DB AF 7E LDA $7EAFDB[$7E:AFDB]   ;
$01/CE93 8D 4A 09    STA $094A  [$00:094A]   ;
$01/CE96 AF DD AF 7E LDA $7EAFDD[$7E:AFDD]   ;
$01/CE9A 8D 48 09    STA $0948  [$00:0948]   ;
$01/CE9D E2 20       SEP #$20                ;
$01/CE9F AF DF B6 7E LDA $7EB6DF[$7E:B6DF]   ;
$01/CEA3 8D 1C 01    STA $011C  [$00:011C]   ;
$01/CEA6 AF E0 B8 7E LDA $7EB8E0[$7E:B8E0]   ;
$01/CEAA 8D 5B 09    STA $095B  [$00:095B]   ;
$01/CEAD AF E1 B8 7E LDA $7EB8E1[$7E:B8E1]   ;
$01/CEB1 8D 6C 09    STA $096C  [$00:096C]   ;
$01/CEB4 C2 20       REP #$20                ;
$01/CEB6 60          RTS                     ;

$01/CEB7 A5 41       LDA $41    [$00:0041]   ;
$01/CEB9 8F D7 AF 7E STA $7EAFD7[$7E:AFD7]   ;
$01/CEBD A5 43       LDA $43    [$00:0043]   ;
$01/CEBF 8F D9 AF 7E STA $7EAFD9[$7E:AFD9]   ;
$01/CEC3 AD 4A 09    LDA $094A  [$00:094A]   ;
$01/CEC6 8F DB AF 7E STA $7EAFDB[$7E:AFDB]   ;
$01/CECA AD 48 09    LDA $0948  [$00:0948]   ;
$01/CECD 8F DD AF 7E STA $7EAFDD[$7E:AFDD]   ;
$01/CED1 E2 20       SEP #$20                ;
$01/CED3 AD 1C 01    LDA $011C  [$00:011C]   ;
$01/CED6 8F DF B6 7E STA $7EB6DF[$7E:B6DF]   ;
$01/CEDA AD 5B 09    LDA $095B  [$00:095B]   ;
$01/CEDD 8F E0 B8 7E STA $7EB8E0[$7E:B8E0]   ;
$01/CEE1 9C 5B 09    STZ $095B  [$00:095B]   ;
$01/CEE4 AD 6C 09    LDA $096C  [$00:096C]   ;
$01/CEE7 8F E1 B8 7E STA $7EB8E1[$7E:B8E1]   ;
$01/CEEB A9 20       LDA #$20                ;
$01/CEED 8D 6C 09    STA $096C  [$00:096C]   ;
$01/CEF0 C2 20       REP #$20                ;
$01/CEF2 5A          PHY                     ;
$01/CEF3 A9 56 00    LDA #$0056              ;
$01/CEF6 85 01       STA $01    [$00:0001]   ;
$01/CEF8 A0 00 28    LDY #$2800              ;
$01/CEFB A2 00 D0    LDX #$D000              ;
$01/CEFE A9 00 08    LDA #$0800              ;
$01/CF01 22 A6 BE 00 JSL $00BEA6[$00:BEA6]   ;
$01/CF05 7A          PLY                     ;
$01/CF06 60          RTS                     ;

$01/CF07 A2 00       LDX #$00                ;
$01/CF09 BF E0 B6 7E LDA $7EB6E0,x[$7E:B6E0] ;
$01/CF0D 9F 00 20 70 STA $702000,x[$70:2000] ;
$01/CF11 BF E0 B7 7E LDA $7EB7E0,x[$7E:B7E0] ;
$01/CF15 9F 00 21 70 STA $702100,x[$70:2100] ;
$01/CF19 E8          INX                     ;
$01/CF1A E8          INX                     ;
$01/CF1B D0 EC       BNE $EC    [$CF09]      ;
$01/CF1D AB          PLB                     ;
$01/CF1E 60          RTS                     ;
;
$01/CF1F A9 00 00    LDA #$0000              ;
$01/CF22 85 41       STA $41    [$00:0041]   ;
$01/CF24 85 43       STA $43    [$00:0043]   ;
$01/CF26 8D 48 09    STA $0948  [$00:0948]   ;
$01/CF29 AA          TAX                     ;
$01/CF2A 8E 4A 09    STX $094A  [$00:094A]   ;
$01/CF2D A0 70       LDY #$70                ;
$01/CF2F 5A          PHY                     ;
$01/CF30 AB          PLB                     ;
$01/CF31 BD 00 20    LDA $2000,x[$00:2000]   ;
$01/CF34 9F E0 B6 7E STA $7EB6E0,x[$7E:B6E0] ;
$01/CF38 BD 00 21    LDA $2100,x[$00:2100]   ;
$01/CF3B 9F E0 B7 7E STA $7EB7E0,x[$7E:B7E0] ;
$01/CF3F E8          INX                     ;
$01/CF40 E8          INX                     ;
$01/CF41 D0 EE       BNE $EE    [$CF31]      ;
$01/CF43 A9 00 00    LDA #$0000              ;
$01/CF46 AA          TAX                     ;
$01/CF47 9B          TXY                     ;
$01/CF48 9D 00 20    STA $2000,x[$00:2000]   ;
$01/CF4B 9D 00 21    STA $2100,x[$00:2100]   ;
$01/CF4E E8          INX                     ;
$01/CF4F E8          INX                     ;
$01/CF50 D0 F6       BNE $F6    [$CF48]      ;
$01/CF52 BB          TYX                     ;
$01/CF53 BF 02 A0 5F LDA $5FA002,x[$5F:A002] ;
$01/CF57 9D 02 20    STA $2002,x[$00:2002]   ;
$01/CF5A BF 22 A0 5F LDA $5FA022,x[$5F:A022] ;
$01/CF5E 9D 22 20    STA $2022,x[$00:2022]   ;
$01/CF61 BF C8 A1 5F LDA $5FA1C8,x[$5F:A1C8] ;
$01/CF65 9D 02 21    STA $2102,x[$00:2102]   ;
$01/CF68 BF E6 A1 5F LDA $5FA1E6,x[$5F:A1E6] ;
$01/CF6C 9D 22 21    STA $2122,x[$00:2122]   ;
$01/CF6F BF 04 A2 5F LDA $5FA204,x[$5F:A204] ;
$01/CF73 9D 42 21    STA $2142,x[$00:2142]   ;
$01/CF76 E8          INX                     ;
$01/CF77 E8          INX                     ;
$01/CF78 E0 1E       CPX #$1E                ;
$01/CF7A 90 D7       BCC $D7    [$CF53]      ;
$01/CF7C A2 7E       LDX #$7E                ;
$01/CF7E DA          PHX                     ;
$01/CF7F AB          PLB                     ;
$01/CF80 A2 00       LDX #$00                ;
$01/CF82 A9 7F 21    LDA #$217F              ;
$01/CF85 9D DF AF    STA $AFDF,x[$00:AFDF]   ;
$01/CF88 9D DF B0    STA $B0DF,x[$00:B0DF]   ;
$01/CF8B 9D DF B1    STA $B1DF,x[$00:B1DF]   ;
$01/CF8E 9D DF B2    STA $B2DF,x[$00:B2DF]   ;
$01/CF91 9D DF B3    STA $B3DF,x[$00:B3DF]   ;
$01/CF94 9D DF B4    STA $B4DF,x[$00:B4DF]   ;
$01/CF97 9D DF B5    STA $B5DF,x[$00:B5DF]   ;
$01/CF9A E8          INX                     ;
$01/CF9B E8          INX                     ;
$01/CF9C D0 E7       BNE $E7    [$CF85]      ;
$01/CF9E A2 00       LDX #$00                ;
$01/CFA0 86 00       STX $00    [$00:0000]   ;
$01/CFA2 9B          TXY                     ;
$01/CFA3 A5 00       LDA $00    [$00:0000]   ;
$01/CFA5 0A          ASL A                   ;
$01/CFA6 AA          TAX                     ;
$01/CFA7 BF 89 B6 01 LDA $01B689,x[$01:B689] ;
$01/CFAB 99 E7 B3    STA $B3E7,y[$00:B3E7]   ;
$01/CFAE A6 00       LDX $00    [$00:0000]   ;
$01/CFB0 E0 15       CPX #$15                ;
$01/CFB2 B0 16       BCS $16    [$CFCA]      ;
$01/CFB4 BF 35 B8 01 LDA $01B835,x[$01:B835] ;
$01/CFB8 29 FF 00    AND #$00FF              ;
$01/CFBB AA          TAX                     ;
$01/CFBC BF 5F B8 01 LDA $01B85F,x[$01:B85F] ;
$01/CFC0 99 2D B4    STA $B42D,y[$00:B42D]   ;
$01/CFC3 BF DD B8 01 LDA $01B8DD,x[$01:B8DD] ;
$01/CFC7 99 6D B4    STA $B46D,y[$00:B46D]   ;
$01/CFCA A6 00       LDX $00    [$00:0000]   ;
$01/CFCC E0 15       CPX #$15                ;
$01/CFCE B0 16       BCS $16    [$CFE6]      ;
$01/CFD0 BF 4A B8 01 LDA $01B84A,x[$01:B84A] ;
$01/CFD4 29 FF 00    AND #$00FF              ;
$01/CFD7 AA          TAX                     ;
$01/CFD8 BF 5F B8 01 LDA $01B85F,x[$01:B85F] ;
$01/CFDC 99 ED B4    STA $B4ED,y[$00:B4ED]   ;
$01/CFDF BF DD B8 01 LDA $01B8DD,x[$01:B8DD] ;
$01/CFE3 99 2D B5    STA $B52D,y[$00:B52D]   ;
$01/CFE6 C8          INY                     ;
$01/CFE7 C8          INY                     ;
$01/CFE8 E6 00       INC $00    [$00:0000]   ;
$01/CFEA A6 00       LDX $00    [$00:0000]   ;
$01/CFEC E0 18       CPX #$18                ;
$01/CFEE 90 B3       BCC $B3    [$CFA3]      ;
$01/CFF0 20 35 D0    JSR $D035  [$00:D035]   ;
$01/CFF3 20 DE D0    JSR $D0DE  [$00:D0DE]   ;
$01/CFF6 20 7A D1    JSR $D17A  [$00:D17A]   ;
$01/CFF9 20 03 D2    JSR $D203  [$00:D203]   ;
$01/CFFC 20 75 D2    JSR $D275  [$00:D275]   ;
$01/CFFF 20 5B D3    JSR $D35B  [$00:D35B]   ;
$01/D002 20 E0 D2    JSR $D2E0  [$00:D2E0]   ;
$01/D005 C2 10       REP #$10                ;
$01/D007 A0 7E 00    LDY #$007E              ;
$01/D00A 84 01       STY $01    [$00:0001]   ;
$01/D00C A0 00 34    LDY #$3400              ;
$01/D00F A2 DF AF    LDX #$AFDF              ;
$01/D012 A9 00 07    LDA #$0700              ;
$01/D015 22 A6 BE 00 JSL $00BEA6[$00:BEA6]   ;
$01/D019 E2 10       SEP #$10                ;
$01/D01B AB          PLB                     ;
$01/D01C A2 09       LDX #$09                ;
$01/D01E 8E 5E 09    STX $095E  [$00:095E]   ;
$01/D021 A2 34       LDX #$34                ;
$01/D023 8E 61 09    STX $0961  [$00:0961]   ;
$01/D026 A2 02       LDX #$02                ;
$01/D028 8E 63 09    STX $0963  [$00:0963]   ;
$01/D02B 8E 1C 01    STX $011C  [$00:011C]   ;
$01/D02E A9 14 00    LDA #$0014              ;
$01/D031 8D 67 09    STA $0967  [$00:0967]   ;
$01/D034 60          RTS                     ;

$01/D035 64 18       STZ $18    [$00:0018]   ;
$01/D037 A0 00       LDY #$00                ;
$01/D039 64 00       STZ $00    [$00:0000]   ;
$01/D03B AF B6 03 00 LDA $0003B6[$00:03B6]   ;
$01/D03F F0 1C       BEQ $1C    [$D05D]      ;
$01/D041 C9 0A 00    CMP #$000A              ;
$01/D044 90 08       BCC $08    [$D04E]      ;
$01/D046 38          SEC                     ;
$01/D047 E9 0A 00    SBC #$000A              ;
$01/D04A E6 00       INC $00    [$00:0000]   ;
$01/D04C 80 F3       BRA $F3    [$D041]      ;

$01/D04E A5 00       LDA $00    [$00:0000]   ;
$01/D050 C9 1E 00    CMP #$001E              ;
$01/D053 90 08       BCC $08    [$D05D]      ;
$01/D055 A9 00 04    LDA #$0400              ;
$01/D058 85 18       STA $18    [$00:0018]   ;
$01/D05A A9 1E 00    LDA #$001E              ;
$01/D05D 85 00       STA $00    [$00:0000]   ;
$01/D05F C9 0A 00    CMP #$000A              ;
$01/D062 90 06       BCC $06    [$D06A]      ;
$01/D064 E9 0A 00    SBC #$000A              ;
$01/D067 C8          INY                     ;
$01/D068 80 F5       BRA $F5    [$D05F]      ;

$01/D06A 0A          ASL A                   ;
$01/D06B AA          TAX                     ;
$01/D06C DA          PHX                     ;
$01/D06D 5A          PHY                     ;
$01/D06E A2 00       LDX #$00                ;
$01/D070 9B          TXY                     ;
$01/D071 DA          PHX                     ;
$01/D072 BF ED B7 01 LDA $01B7ED,x[$01:B7ED] ;
$01/D076 29 FF 00    AND #$00FF              ;
$01/D079 AA          TAX                     ;
$01/D07A BF 5F B8 01 LDA $01B85F,x[$01:B85F] ;
$01/D07E 05 18       ORA $18    [$00:0018]   ;
$01/D080 99 A7 B1    STA $B1A7,y[$00:B1A7]   ;
$01/D083 BF DD B8 01 LDA $01B8DD,x[$01:B8DD] ;
$01/D087 05 18       ORA $18    [$00:0018]   ;
$01/D089 99 E7 B1    STA $B1E7,y[$00:B1E7]   ;
$01/D08C FA          PLX                     ;
$01/D08D C8          INY                     ;
$01/D08E C8          INY                     ;
$01/D08F E8          INX                     ;
$01/D090 E0 18       CPX #$18                ;
$01/D092 90 DD       BCC $DD    [$D071]      ;
$01/D094 7A          PLY                     ;
$01/D095 FA          PLX                     ;
$01/D096 A5 00       LDA $00    [$00:0000]   ;
$01/D098 48          PHA                     ;
$01/D099 C2 10       REP #$10                ;
$01/D09B DA          PHX                     ;
$01/D09C 5A          PHY                     ;
$01/D09D E2 10       SEP #$10                ;
$01/D09F A9 C1 B1    LDA #$B1C1              ;
$01/D0A2 85 10       STA $10    [$00:0010]   ;
$01/D0A4 A9 CF B1    LDA #$B1CF              ;
$01/D0A7 85 12       STA $12    [$00:0012]   ;
$01/D0A9 A9 01 B2    LDA #$B201              ;
$01/D0AC 85 14       STA $14    [$00:0014]   ;
$01/D0AE A9 0F B2    LDA #$B20F              ;
$01/D0B1 85 16       STA $16    [$00:0016]   ;
$01/D0B3 20 5E D4    JSR $D45E  [$00:D45E]   ;
$01/D0B6 C2 10       REP #$10                ;
$01/D0B8 68          PLA                     ;
$01/D0B9 29 FF 00    AND #$00FF              ;
$01/D0BC AA          TAX                     ;
$01/D0BD 68          PLA                     ;
$01/D0BE 29 FF 00    AND #$00FF              ;
$01/D0C1 85 00       STA $00    [$00:0000]   ;
$01/D0C3 A5 18       LDA $18    [$00:0018]   ;
$01/D0C5 85 02       STA $02    [$00:0002]   ;
$01/D0C7 A9 7E 00    LDA #$007E              ;
$01/D0CA 85 15       STA $15    [$00:0015]   ;
$01/D0CC A9 15 B2    LDA #$B215              ;
$01/D0CF 85 13       STA $13    [$00:0013]   ;
$01/D0D1 8B          PHB                     ;
$01/D0D2 4B          PHK                     ;
$01/D0D3 AB          PLB                     ;
$01/D0D4 20 AA BC    JSR $BCAA  [$00:BCAA]   ;
$01/D0D7 AB          PLB                     ;
$01/D0D8 E2 10       SEP #$10                ;
$01/D0DA 68          PLA                     ;
$01/D0DB 85 00       STA $00    [$00:0000]   ;
$01/D0DD 60          RTS                     ;

$01/D0DE 64 18       STZ $18    [$00:0018]   ;
$01/D0E0 A0 00       LDY #$00                ;
$01/D0E2 AF B4 03 00 LDA $0003B4[$00:03B4]   ;
$01/D0E6 C9 14 00    CMP #$0014              ;
$01/D0E9 90 08       BCC $08    [$D0F3]      ;
$01/D0EB A9 00 04    LDA #$0400              ;
$01/D0EE 85 18       STA $18    [$00:0018]   ;
$01/D0F0 A9 14 00    LDA #$0014              ;
$01/D0F3 85 02       STA $02    [$00:0002]   ;
$01/D0F5 C9 0A 00    CMP #$000A              ;
$01/D0F8 90 06       BCC $06    [$D100]      ;
$01/D0FA E9 0A 00    SBC #$000A              ;
$01/D0FD C8          INY                     ;
$01/D0FE 80 F5       BRA $F5    [$D0F5]      ;

$01/D100 0A          ASL A                   ;
$01/D101 AA          TAX                     ;
$01/D102 DA          PHX                     ;
$01/D103 5A          PHY                     ;
$01/D104 A2 00       LDX #$00                ;
$01/D106 9B          TXY                     ;
$01/D107 DA          PHX                     ;
$01/D108 BF 05 B8 01 LDA $01B805,x[$01:B805] ;
$01/D10C 29 FF 00    AND #$00FF              ;
$01/D10F AA          TAX                     ;
$01/D110 BF 5F B8 01 LDA $01B85F,x[$01:B85F] ;
$01/D114 05 18       ORA $18    [$00:0018]   ;
$01/D116 99 67 B2    STA $B267,y[$00:B267]   ;
$01/D119 BF DD B8 01 LDA $01B8DD,x[$01:B8DD] ;
$01/D11D 05 18       ORA $18    [$00:0018]   ;
$01/D11F 99 A7 B2    STA $B2A7,y[$00:B2A7]   ;
$01/D122 FA          PLX                     ;
$01/D123 C8          INY                     ;
$01/D124 C8          INY                     ;
$01/D125 E8          INX                     ;
$01/D126 E0 18       CPX #$18                ;
$01/D128 90 DD       BCC $DD    [$D107]      ;
$01/D12A 7A          PLY                     ;
$01/D12B FA          PLX                     ;
$01/D12C A5 00       LDA $00    [$00:0000]   ;
$01/D12E 48          PHA                     ;
$01/D12F A5 02       LDA $02    [$00:0002]   ;
$01/D131 48          PHA                     ;
$01/D132 C2 10       REP #$10                ;
$01/D134 DA          PHX                     ;
$01/D135 5A          PHY                     ;
$01/D136 E2 10       SEP #$10                ;
$01/D138 A9 81 B2    LDA #$B281              ;
$01/D13B 85 10       STA $10    [$00:0010]   ;
$01/D13D A9 8F B2    LDA #$B28F              ;
$01/D140 85 12       STA $12    [$00:0012]   ;
$01/D142 A9 C1 B2    LDA #$B2C1              ;
$01/D145 85 14       STA $14    [$00:0014]   ;
$01/D147 A9 CF B2    LDA #$B2CF              ;
$01/D14A 85 16       STA $16    [$00:0016]   ;
$01/D14C 20 5E D4    JSR $D45E  [$00:D45E]   ;
$01/D14F C2 10       REP #$10                ;
$01/D151 68          PLA                     ;
$01/D152 29 FF 00    AND #$00FF              ;
$01/D155 AA          TAX                     ;
$01/D156 68          PLA                     ;
$01/D157 29 FF 00    AND #$00FF              ;
$01/D15A 85 00       STA $00    [$00:0000]   ;
$01/D15C A5 18       LDA $18    [$00:0018]   ;
$01/D15E 85 02       STA $02    [$00:0002]   ;
$01/D160 A9 7E 00    LDA #$007E              ;
$01/D163 85 15       STA $15    [$00:0015]   ;
$01/D165 A9 D5 B2    LDA #$B2D5              ;
$01/D168 85 13       STA $13    [$00:0013]   ;
$01/D16A 8B          PHB                     ;
$01/D16B 4B          PHK                     ;
$01/D16C AB          PLB                     ;
$01/D16D 20 AA BC    JSR $BCAA  [$00:BCAA]   ;
$01/D170 AB          PLB                     ;
$01/D171 E2 10       SEP #$10                ;
$01/D173 68          PLA                     ;
$01/D174 85 02       STA $02    [$00:0002]   ;
$01/D176 68          PLA                     ;
$01/D177 85 00       STA $00    [$00:0000]   ;
$01/D179 60          RTS                     ;

$01/D17A 64 18       STZ $18    [$00:0018]   ;
$01/D17C AF B8 03 00 LDA $0003B8[$00:03B8]   ;
$01/D180 0A          ASL A                   ;
$01/D181 AA          TAX                     ;
$01/D182 E0 0A       CPX #$0A                ;
$01/D184 90 05       BCC $05    [$D18B]      ;
$01/D186 A9 00 04    LDA #$0400              ;
$01/D189 85 18       STA $18    [$00:0018]   ;
$01/D18B DA          PHX                     ;
$01/D18C A2 00       LDX #$00                ;
$01/D18E 9B          TXY                     ;
$01/D18F DA          PHX                     ;
$01/D190 BF 1D B8 01 LDA $01B81D,x[$01:B81D] ;
$01/D194 29 FF 00    AND #$00FF              ;
$01/D197 AA          TAX                     ;
$01/D198 BF 5F B8 01 LDA $01B85F,x[$01:B85F] ;
$01/D19C 05 18       ORA $18    [$00:0018]   ;
$01/D19E 99 27 B3    STA $B327,y[$00:B327]   ;
$01/D1A1 BF DD B8 01 LDA $01B8DD,x[$01:B8DD] ;
$01/D1A5 05 18       ORA $18    [$00:0018]   ;
$01/D1A7 99 67 B3    STA $B367,y[$00:B367]   ;
$01/D1AA FA          PLX                     ;
$01/D1AB C8          INY                     ;
$01/D1AC C8          INY                     ;
$01/D1AD E8          INX                     ;
$01/D1AE E0 18       CPX #$18                ;
$01/D1B0 90 DD       BCC $DD    [$D18F]      ;
$01/D1B2 FA          PLX                     ;
$01/D1B3 A5 00       LDA $00    [$00:0000]   ;
$01/D1B5 48          PHA                     ;
$01/D1B6 A5 02       LDA $02    [$00:0002]   ;
$01/D1B8 48          PHA                     ;
$01/D1B9 C2 10       REP #$10                ;
$01/D1BB DA          PHX                     ;
$01/D1BC E2 10       SEP #$10                ;
$01/D1BE BF AF B8 01 LDA $01B8AF,x[$01:B8AF] ;
$01/D1C2 05 18       ORA $18    [$00:0018]   ;
$01/D1C4 8D 45 B3    STA $B345  [$00:B345]   ;
$01/D1C7 9B          TXY                     ;
$01/D1C8 F0 03       BEQ $03    [$D1CD]      ;
$01/D1CA 8D 4F B3    STA $B34F  [$00:B34F]   ;
$01/D1CD BF 2D B9 01 LDA $01B92D,x[$01:B92D] ;
$01/D1D1 05 18       ORA $18    [$00:0018]   ;
$01/D1D3 8D 85 B3    STA $B385  [$00:B385]   ;
$01/D1D6 9B          TXY                     ;
$01/D1D7 F0 03       BEQ $03    [$D1DC]      ;
$01/D1D9 8D 8F B3    STA $B38F  [$00:B38F]   ;
$01/D1DC C2 10       REP #$10                ;
$01/D1DE 68          PLA                     ;
$01/D1DF 29 FF 00    AND #$00FF              ;
$01/D1E2 AA          TAX                     ;
$01/D1E3 86 00       STX $00    [$00:0000]   ;
$01/D1E5 A5 18       LDA $18    [$00:0018]   ;
$01/D1E7 85 02       STA $02    [$00:0002]   ;
$01/D1E9 A9 7E 00    LDA #$007E              ;
$01/D1EC 85 15       STA $15    [$00:0015]   ;
$01/D1EE A9 95 B3    LDA #$B395              ;
$01/D1F1 85 13       STA $13    [$00:0013]   ;
$01/D1F3 8B          PHB                     ;
$01/D1F4 4B          PHK                     ;
$01/D1F5 AB          PLB                     ;
$01/D1F6 20 AA BC    JSR $BCAA  [$00:BCAA]   ;
$01/D1F9 AB          PLB                     ;
$01/D1FA E2 10       SEP #$10                ;
$01/D1FC 68          PLA                     ;
$01/D1FD 85 02       STA $02    [$00:0002]   ;
$01/D1FF 68          PLA                     ;
$01/D200 85 00       STA $00    [$00:0000]   ;
$01/D202 60          RTS                     ;

$01/D203 64 18       STZ $18    [$00:0018]   ;
$01/D205 A0 00       LDY #$00                ;
$01/D207 AF B8 03 00 LDA $0003B8[$00:03B8]   ;
$01/D20B 0A          ASL A                   ;
$01/D20C 85 0E       STA $0E    [$00:000E]   ;
$01/D20E 0A          ASL A                   ;
$01/D20F 0A          ASL A                   ;
$01/D210 65 0E       ADC $0E    [$00:000E]   ;
$01/D212 18          CLC                     ;
$01/D213 65 00       ADC $00    [$00:0000]   ;
$01/D215 18          CLC                     ;
$01/D216 65 02       ADC $02    [$00:0002]   ;
$01/D218 85 00       STA $00    [$00:0000]   ;
$01/D21A C9 64 00    CMP #$0064              ;
$01/D21D 90 07       BCC $07    [$D226]      ;
$01/D21F A9 0A 00    LDA #$000A              ;
$01/D222 A8          TAY                     ;
$01/D223 C8          INY                     ;
$01/D224 80 0B       BRA $0B    [$D231]      ;

$01/D226 C9 0A 00    CMP #$000A              ;
$01/D229 90 06       BCC $06    [$D231]      ;
$01/D22B E9 0A 00    SBC #$000A              ;
$01/D22E C8          INY                     ;
$01/D22F 80 F5       BRA $F5    [$D226]      ;

$01/D231 0A          ASL A                   ;
$01/D232 AA          TAX                     ;
$01/D233 A5 00       LDA $00    [$00:0000]   ;
$01/D235 48          PHA                     ;
$01/D236 C2 10       REP #$10                ;
$01/D238 DA          PHX                     ;
$01/D239 5A          PHY                     ;
$01/D23A E2 10       SEP #$10                ;
$01/D23C A9 4F B4    LDA #$B44F              ;
$01/D23F 85 10       STA $10    [$00:0010]   ;
$01/D241 85 12       STA $12    [$00:0012]   ;
$01/D243 A9 8F B4    LDA #$B48F              ;
$01/D246 85 14       STA $14    [$00:0014]   ;
$01/D248 85 16       STA $16    [$00:0016]   ;
$01/D24A 20 5E D4    JSR $D45E  [$00:D45E]   ;
$01/D24D C2 10       REP #$10                ;
$01/D24F 68          PLA                     ;
$01/D250 29 FF 00    AND #$00FF              ;
$01/D253 AA          TAX                     ;
$01/D254 68          PLA                     ;
$01/D255 29 FF 00    AND #$00FF              ;
$01/D258 85 00       STA $00    [$00:0000]   ;
$01/D25A A5 18       LDA $18    [$00:0018]   ;
$01/D25C 85 02       STA $02    [$00:0002]   ;
$01/D25E A9 7E 00    LDA #$007E              ;
$01/D261 85 15       STA $15    [$00:0015]   ;
$01/D263 A9 95 B4    LDA #$B495              ;
$01/D266 85 13       STA $13    [$00:0013]   ;
$01/D268 8B          PHB                     ;
$01/D269 4B          PHK                     ;
$01/D26A AB          PLB                     ;
$01/D26B 20 AA BC    JSR $BCAA  [$00:BCAA]   ;
$01/D26E AB          PLB                     ;
$01/D26F E2 10       SEP #$10                ;
$01/D271 68          PLA                     ;
$01/D272 85 00       STA $00    [$00:0000]   ;
$01/D274 60          RTS                     ;

$01/D275 A0 00       LDY #$00                ;
$01/D277 AF 1A 02 00 LDA $00021A[$00:021A]   ;
$01/D27B AA          TAX                     ;
$01/D27C BF B8 02 00 LDA $0002B8,x[$00:02B8] ;
$01/D280 29 FF 00    AND #$00FF              ;
$01/D283 C5 00       CMP $00    [$00:0000]   ;
$01/D285 B0 02       BCS $02    [$D289]      ;
$01/D287 A5 00       LDA $00    [$00:0000]   ;
$01/D289 C9 64 00    CMP #$0064              ;
$01/D28C 90 07       BCC $07    [$D295]      ;
$01/D28E A9 0A 00    LDA #$000A              ;
$01/D291 A8          TAY                     ;
$01/D292 C8          INY                     ;
$01/D293 80 0B       BRA $0B    [$D2A0]      ;

$01/D295 C9 0A 00    CMP #$000A              ;
$01/D298 90 06       BCC $06    [$D2A0]      ;
$01/D29A E9 0A 00    SBC #$000A              ;
$01/D29D C8          INY                     ;
$01/D29E 80 F5       BRA $F5    [$D295]      ;

$01/D2A0 0A          ASL A                   ;
$01/D2A1 AA          TAX                     ;
$01/D2A2 C2 10       REP #$10                ;
$01/D2A4 DA          PHX                     ;
$01/D2A5 5A          PHY                     ;
$01/D2A6 E2 10       SEP #$10                ;
$01/D2A8 A9 0F B5    LDA #$B50F              ;
$01/D2AB 85 10       STA $10    [$00:0010]   ;
$01/D2AD 85 12       STA $12    [$00:0012]   ;
$01/D2AF A9 4F B5    LDA #$B54F              ;
$01/D2B2 85 14       STA $14    [$00:0014]   ;
$01/D2B4 85 16       STA $16    [$00:0016]   ;
$01/D2B6 64 18       STZ $18    [$00:0018]   ;
$01/D2B8 20 5E D4    JSR $D45E  [$00:D45E]   ;
$01/D2BB C2 10       REP #$10                ;
$01/D2BD 68          PLA                     ;
$01/D2BE 29 FF 00    AND #$00FF              ;
$01/D2C1 AA          TAX                     ;
$01/D2C2 68          PLA                     ;
$01/D2C3 29 FF 00    AND #$00FF              ;
$01/D2C6 85 00       STA $00    [$00:0000]   ;
$01/D2C8 A5 18       LDA $18    [$00:0018]   ;
$01/D2CA 85 02       STA $02    [$00:0002]   ;
$01/D2CC A9 7E 00    LDA #$007E              ;
$01/D2CF 85 15       STA $15    [$00:0015]   ;
$01/D2D1 A9 55 B5    LDA #$B555              ;
$01/D2D4 85 13       STA $13    [$00:0013]   ;
$01/D2D6 8B          PHB                     ;
$01/D2D7 4B          PHK                     ;
$01/D2D8 AB          PLB                     ;
$01/D2D9 20 AA BC    JSR $BCAA  [$00:BCAA]   ;
$01/D2DC AB          PLB                     ;
$01/D2DD E2 10       SEP #$10                ;
$01/D2DF 60          RTS                     ;

$01/D2E0 8B          PHB                     ;
$01/D2E1 4B          PHK                     ;
$01/D2E2 AB          PLB                     ;
$01/D2E3 9C F6 0C    STZ $0CF6  [$00:0CF6]   ;
$01/D2E6 9C F7 0C    STZ $0CF7  [$00:0CF7]   ;
$01/D2E9 E2 20       SEP #$20                ;
$01/D2EB A2 00       LDX #$00                ;
$01/D2ED 9B          TXY                     ;
$01/D2EE BD 57 03    LDA $0357,x[$00:0357]   ;
$01/D2F1 29 0F       AND #$0F                ;
$01/D2F3 F0 04       BEQ $04    [$D2F9]      ;
$01/D2F5 99 57 03    STA $0357,y[$00:0357]   ;
$01/D2F8 C8          INY                     ;
$01/D2F9 E8          INX                     ;
$01/D2FA E0 1B       CPX #$1B                ;
$01/D2FC 90 F0       BCC $F0    [$D2EE]      ;
$01/D2FE BB          TYX                     ;
$01/D2FF E0 1B       CPX #$1B                ;
$01/D301 B0 06       BCS $06    [$D309]      ;
$01/D303 9E 57 03    STZ $0357,x[$00:0357]   ;
$01/D306 E8          INX                     ;
$01/D307 80 F6       BRA $F6    [$D2FF]      ;

$01/D309 AD 57 03    LDA $0357  [$00:0357]   ;
$01/D30C F0 21       BEQ $21    [$D32F]      ;
$01/D30E A0 00       LDY #$00                ;
$01/D310 AD F4 0C    LDA $0CF4  [$00:0CF4]   ;
$01/D313 D0 06       BNE $06    [$D31B]      ;
$01/D315 9C F5 0C    STZ $0CF5  [$00:0CF5]   ;
$01/D318 EE F4 0C    INC $0CF4  [$00:0CF4]   ;
$01/D31B AE F5 0C    LDX $0CF5  [$00:0CF5]   ;
$01/D31E BD 57 03    LDA $0357,x[$00:0357]   ;
$01/D321 99 F6 0C    STA $0CF6,y[$00:0CF6]   ;
$01/D324 E8          INX                     ;
$01/D325 C8          INY                     ;
$01/D326 C0 03       CPY #$03                ;
$01/D328 90 F4       BCC $F4    [$D31E]      ;
$01/D32A C2 20       REP #$20                ;
$01/D32C 20 B0 DD    JSR $DDB0  [$00:DDB0]   ;
$01/D32F C2 20       REP #$20                ;
$01/D331 AB          PLB                     ;
$01/D332 60          RTS                     ;

DATA_01D333:         dw $1DA8, $1D80, $1D82, $1D84
DATA_01D33B:         dw $1D86, $1D88, $1DA0, $1DA2
DATA_01D343:         dw $1DA4, $1DA6

DATA_01D347:         dw $1DB8, $1D90, $1D92, $1D94
DATA_01D34F:         dw $1D96, $1D98, $1DB0, $1DB2
DATA_01D357:         dw $1DB4, $1DB6

$01/D35B A2 00       LDX #$00                ;
$01/D35D A9 8B 9D    LDA #$9D8B              ;
$01/D360 9D 9F B5    STA $B59F,x[$00:B59F]   ;
$01/D363 A9 8B 1D    LDA #$1D8B              ;
$01/D366 9D 5F B6    STA $B65F,x[$00:B65F]   ;
$01/D369 A9 AF 09    LDA #$09AF              ;
$01/D36C 9D DF B5    STA $B5DF,x[$00:B5DF]   ;
$01/D36F 9D 1F B6    STA $B61F,x[$00:B61F]   ;
$01/D372 E8          INX                     ;
$01/D373 E8          INX                     ;
$01/D374 E0 40       CPX #$40                ;
$01/D376 90 E5       BCC $E5    [$D35D]      ;
$01/D378 A9 8C 09    LDA #$098C              ;
$01/D37B 8D E1 B5    STA $B5E1  [$00:B5E1]   ;
$01/D37E 1A          INC A                   ;
$01/D37F 8D E3 B5    STA $B5E3  [$00:B5E3]   ;
$01/D382 1A          INC A                   ;
$01/D383 8D 21 B6    STA $B621  [$00:B621]   ;
$01/D386 1A          INC A                   ;
$01/D387 8D 23 B6    STA $B623  [$00:B623]   ;
$01/D38A A2 00       LDX #$00                ;
$01/D38C 9B          TXY                     ;
$01/D38D AF 79 03 00 LDA $000379[$00:0379]   ;
$01/D391 C9 64 00    CMP #$0064              ;
$01/D394 90 06       BCC $06    [$D39C]      ;
$01/D396 E9 64 00    SBC #$0064              ;
$01/D399 C8          INY                     ;
$01/D39A 80 F5       BRA $F5    [$D391]      ;

$01/D39C C9 0A 00    CMP #$000A              ;
$01/D39F 90 06       BCC $06    [$D3A7]      ;
$01/D3A1 E9 0A 00    SBC #$000A              ;
$01/D3A4 E8          INX                     ;
$01/D3A5 80 F5       BRA $F5    [$D39C]      ;

$01/D3A7 C0 00       CPY #$00                ;
$01/D3A9 D0 0E       BNE $0E    [$D3B9]      ;
$01/D3AB 9B          TXY                     ;
$01/D3AC AA          TAX                     ;
$01/D3AD A9 0A 00    LDA #$000A              ;
$01/D3B0 C0 00       CPY #$00                ;
$01/D3B2 D0 05       BNE $05    [$D3B9]      ;
$01/D3B4 9B          TXY                     ;
$01/D3B5 AA          TAX                     ;
$01/D3B6 A9 0A 00    LDA #$000A              ;
$01/D3B9 09 C0 0D    ORA #$0DC0              ;
$01/D3BC 8D 29 B6    STA $B629  [$00:B629]   ;
$01/D3BF 8A          TXA                     ;
$01/D3C0 09 C0 0D    ORA #$0DC0              ;
$01/D3C3 8D 27 B6    STA $B627  [$00:B627]   ;
$01/D3C6 98          TYA                     ;
$01/D3C7 09 C0 0D    ORA #$0DC0              ;
$01/D3CA 8D 25 B6    STA $B625  [$00:B625]   ;
$01/D3CD A9 D2 0D    LDA #$0DD2              ;
$01/D3D0 8D EB B5    STA $B5EB  [$00:B5EB]   ;
$01/D3D3 1A          INC A                   ;
$01/D3D4 8D ED B5    STA $B5ED  [$00:B5ED]   ;
$01/D3D7 1A          INC A                   ;
$01/D3D8 8D 2B B6    STA $B62B  [$00:B62B]   ;
$01/D3DB 1A          INC A                   ;
$01/D3DC 8D 2D B6    STA $B62D  [$00:B62D]   ;
$01/D3DF A2 00       LDX #$00                ;
$01/D3E1 AF 7B 03 00 LDA $00037B[$00:037B]   ;
$01/D3E5 C9 0A 00    CMP #$000A              ;
$01/D3E8 90 06       BCC $06    [$D3F0]      ;
$01/D3EA E9 0A 00    SBC #$000A              ;
$01/D3ED E8          INX                     ;
$01/D3EE 80 F5       BRA $F5    [$D3E5]      ;

$01/D3F0 E0 00       CPX #$00                ;
$01/D3F2 D0 04       BNE $04    [$D3F8]      ;
$01/D3F4 AA          TAX                     ;
$01/D3F5 A9 0A 00    LDA #$000A              ;
$01/D3F8 09 C0 0D    ORA #$0DC0              ;
$01/D3FB 8D 31 B6    STA $B631  [$00:B631]   ;
$01/D3FE 8A          TXA                     ;
$01/D3FF 09 C0 0D    ORA #$0DC0              ;
$01/D402 8D 2F B6    STA $B62F  [$00:B62F]   ;
$01/D405 A9 CB 0D    LDA #$0DCB              ;
$01/D408 8D F5 B5    STA $B5F5  [$00:B5F5]   ;
$01/D40B 1A          INC A                   ;
$01/D40C 8D F7 B5    STA $B5F7  [$00:B5F7]   ;
$01/D40F 1A          INC A                   ;
$01/D410 8D 35 B6    STA $B635  [$00:B635]   ;
$01/D413 1A          INC A                   ;
$01/D414 8D 37 B6    STA $B637  [$00:B637]   ;
$01/D417 AF A1 03 00 LDA $0003A1[$00:03A1]   ;
$01/D41B 0A          ASL A                   ;
$01/D41C AA          TAX                     ;
$01/D41D BF 33 D3 01 LDA $01D333,x[$01:D333] ;
$01/D421 8D F9 B5    STA $B5F9  [$00:B5F9]   ;
$01/D424 1A          INC A                   ;
$01/D425 8D FB B5    STA $B5FB  [$00:B5FB]   ;
$01/D428 BF 47 D3 01 LDA $01D347,x[$01:D347] ;
$01/D42C 8D 39 B6    STA $B639  [$00:B639]   ;
$01/D42F 1A          INC A                   ;
$01/D430 8D 3B B6    STA $B63B  [$00:B63B]   ;
$01/D433 AF A3 03 00 LDA $0003A3[$00:03A3]   ;
$01/D437 0A          ASL A                   ;
$01/D438 AA          TAX                     ;
$01/D439 BF 33 D3 01 LDA $01D333,x[$01:D333] ;
$01/D43D 8D FD B5    STA $B5FD  [$00:B5FD]   ;
$01/D440 1A          INC A                   ;
$01/D441 8D FF B5    STA $B5FF  [$00:B5FF]   ;
$01/D444 BF 47 D3 01 LDA $01D347,x[$01:D347] ;
$01/D448 8D 3D B6    STA $B63D  [$00:B63D]   ;
$01/D44B 1A          INC A                   ;
$01/D44C 8D 3F B6    STA $B63F  [$00:B63F]   ;
$01/D44F 20 90 D4    JSR $D490  [$00:D490]   ;
$01/D452 E2 20       SEP #$20                ;
$01/D454 8B          PHB                     ;
$01/D455 4B          PHK                     ;
$01/D456 AB          PLB                     ;
$01/D457 20 E0 DC    JSR $DCE0  [$00:DCE0]   ;
$01/D45A AB          PLB                     ;
$01/D45B C2 20       REP #$20                ;
$01/D45D 60          RTS                     ;

$01/D45E 5A          PHY                     ;
$01/D45F A0 02       LDY #$02                ;
$01/D461 BF AF B8 01 LDA $01B8AF,x[$01:B8AF] ;
$01/D465 05 18       ORA $18    [$00:0018]   ;
$01/D467 91 10       STA ($10),y[$00:5555]   ;
$01/D469 91 12       STA ($12),y[$00:5555]   ;
$01/D46B BF 2D B9 01 LDA $01B92D,x[$01:B92D] ;
$01/D46F 05 18       ORA $18    [$00:0018]   ;
$01/D471 91 14       STA ($14),y[$00:5555]   ;
$01/D473 91 16       STA ($16),y[$00:5555]   ;
$01/D475 7A          PLY                     ;
$01/D476 F0 17       BEQ $17    [$D48F]      ;
$01/D478 98          TYA                     ;
$01/D479 0A          ASL A                   ;
$01/D47A AA          TAX                     ;
$01/D47B BF AF B8 01 LDA $01B8AF,x[$01:B8AF] ;
$01/D47F 05 18       ORA $18    [$00:0018]   ;
$01/D481 92 10       STA ($10)  [$00:5555]   ;
$01/D483 92 12       STA ($12)  [$00:5555]   ;
$01/D485 BF 2D B9 01 LDA $01B92D,x[$01:B92D] ;
$01/D489 05 18       ORA $18    [$00:0018]   ;
$01/D48B 92 14       STA ($14)  [$00:5555]   ;
$01/D48D 92 16       STA ($16)  [$00:5555]   ;
$01/D48F 60          RTS                     ;

$01/D490 A9 AC 1D    LDA #$1DAC              ;
$01/D493 8D C7 B5    STA $B5C7  [$00:B5C7]   ;
$01/D496 A9 9C 1D    LDA #$1D9C              ;
$01/D499 8D 07 B6    STA $B607  [$00:B607]   ;
$01/D49C 8D 47 B6    STA $B647  [$00:B647]   ;
$01/D49F A9 AC 9D    LDA #$9DAC              ;
$01/D4A2 8D 87 B6    STA $B687  [$00:B687]   ;
$01/D4A5 A9 AD 1D    LDA #$1DAD              ;
$01/D4A8 8D C9 B5    STA $B5C9  [$00:B5C9]   ;
$01/D4AB 8D CF B5    STA $B5CF  [$00:B5CF]   ;
$01/D4AE 8D D5 B5    STA $B5D5  [$00:B5D5]   ;
$01/D4B1 A9 AD 5D    LDA #$5DAD              ;
$01/D4B4 8D CB B5    STA $B5CB  [$00:B5CB]   ;
$01/D4B7 8D D1 B5    STA $B5D1  [$00:B5D1]   ;
$01/D4BA 8D D7 B5    STA $B5D7  [$00:B5D7]   ;
$01/D4BD A9 AD 9D    LDA #$9DAD              ;
$01/D4C0 8D 89 B6    STA $B689  [$00:B689]   ;
$01/D4C3 8D 8F B6    STA $B68F  [$00:B68F]   ;
$01/D4C6 8D 95 B6    STA $B695  [$00:B695]   ;
$01/D4C9 A9 AD DD    LDA #$DDAD              ;
$01/D4CC 8D 8B B6    STA $B68B  [$00:B68B]   ;
$01/D4CF 8D 91 B6    STA $B691  [$00:B691]   ;
$01/D4D2 8D 97 B6    STA $B697  [$00:B697]   ;
$01/D4D5 A9 AE 1D    LDA #$1DAE              ;
$01/D4D8 8D CD B5    STA $B5CD  [$00:B5CD]   ;
$01/D4DB 8D D3 B5    STA $B5D3  [$00:B5D3]   ;
$01/D4DE A9 AE 9D    LDA #$9DAE              ;
$01/D4E1 8D 8D B6    STA $B68D  [$00:B68D]   ;
$01/D4E4 8D 93 B6    STA $B693  [$00:B693]   ;
$01/D4E7 A9 9E 1D    LDA #$1D9E              ;
$01/D4EA 8D 0D B6    STA $B60D  [$00:B60D]   ;
$01/D4ED 8D 13 B6    STA $B613  [$00:B613]   ;
$01/D4F0 8D 4D B6    STA $B64D  [$00:B64D]   ;
$01/D4F3 8D 53 B6    STA $B653  [$00:B653]   ;
$01/D4F6 A9 AC 5D    LDA #$5DAC              ;
$01/D4F9 8D D9 B5    STA $B5D9  [$00:B5D9]   ;
$01/D4FC A9 9C 5D    LDA #$5D9C              ;
$01/D4FF 8D 19 B6    STA $B619  [$00:B619]   ;
$01/D502 8D 59 B6    STA $B659  [$00:B659]   ;
$01/D505 A9 AC DD    LDA #$DDAC              ;
$01/D508 8D 99 B6    STA $B699  [$00:B699]   ;
$01/D50B A9 7F 11    LDA #$117F              ;
$01/D50E 8D 09 B6    STA $B609  [$00:B609]   ;
$01/D511 8D 49 B6    STA $B649  [$00:B649]   ;
$01/D514 8D 0B B6    STA $B60B  [$00:B60B]   ;
$01/D517 8D 4B B6    STA $B64B  [$00:B64B]   ;
$01/D51A 8D 0F B6    STA $B60F  [$00:B60F]   ;
$01/D51D 8D 4F B6    STA $B64F  [$00:B64F]   ;
$01/D520 8D 11 B6    STA $B611  [$00:B611]   ;
$01/D523 8D 51 B6    STA $B651  [$00:B651]   ;
$01/D526 8D 15 B6    STA $B615  [$00:B615]   ;
$01/D529 8D 55 B6    STA $B655  [$00:B655]   ;
$01/D52C 8D 17 B6    STA $B617  [$00:B617]   ;
$01/D52F 8D 57 B6    STA $B657  [$00:B657]   ;
$01/D532 60          RTS                     ;

$01/D533 8B          PHB                     ;
$01/D534 F4 48 7E    PEA $7E48               ;
$01/D537 AB          PLB                     ;
$01/D538 AB          PLB                     ;
$01/D539 AE 00 48    LDX $4800  [$00:4800]   ;
$01/D53C 9D 00 00    STA $0000,x[$00:0000]   ;
$01/D53F 0A          ASL A                   ;
$01/D540 A9 80 00    LDA #$0080              ;
$01/D543 9D 02 00    STA $0002,x[$00:0002]   ;
$01/D546 A9 7E 00    LDA #$007E              ;
$01/D549 9D 07 00    STA $0007,x[$00:0007]   ;
$01/D54C 98          TYA                     ;
$01/D54D 9D 08 00    STA $0008,x[$00:0008]   ;
$01/D550 A9 81 39    LDA #$3981              ;
$01/D553 A0 BE       LDY #$BE                ;
$01/D555 7B          TDC                     ;
$01/D556 B0 05       BCS $05    [$D55D]      ;
$01/D558 A9 01 18    LDA #$1801              ;
$01/D55B C8          INY                     ;
$01/D55C C8          INY                     ;
$01/D55D 9D 03 00    STA $0003,x[$00:0003]   ;
$01/D560 98          TYA                     ;
$01/D561 9D 05 00    STA $0005,x[$00:0005]   ;
$01/D564 8A          TXA                     ;
$01/D565 18          CLC                     ;
$01/D566 69 0C 00    ADC #$000C              ;
$01/D569 9D 0A 00    STA $000A,x[$00:000A]   ;
$01/D56C 8D 00 48    STA $4800  [$00:4800]   ;
$01/D56F E2 30       SEP #$30                ;
$01/D571 AB          PLB                     ;
$01/D572 60          RTS                     ;

; BG gradient pointer table
DATA_01D573:         dw $005F, $D64C
DATA_01D577:         dw $005F, $D67C
DATA_01D57B:         dw $005F, $D6AC
DATA_01D57F:         dw $005F, $D6DC
DATA_01D583:         dw $005F, $D70C
DATA_01D587:         dw $005F, $D73C
DATA_01D58B:         dw $005F, $D76C
DATA_01D58F:         dw $005F, $D79C
DATA_01D593:         dw $005F, $D7CC
DATA_01D597:         dw $005F, $D7FC
DATA_01D59B:         dw $005F, $D82C
DATA_01D59F:         dw $005F, $D85C
DATA_01D5A3:         dw $005F, $D88C
DATA_01D5A7:         dw $005F, $D8BC
DATA_01D5AB:         dw $005F, $D8EC
DATA_01D5AF:         dw $005F, $D91C

$01/D5B3 8B          PHB                     ;
$01/D5B4 4B          PHK                     ;
$01/D5B5 AB          PLB                     ;
$01/D5B6 A2 04       LDX #$04                ;
$01/D5B8 BD 6B D6    LDA $D66B,x[$00:D66B]   ;
$01/D5BB 9D 60 43    STA $4360,x[$00:4360]   ;
$01/D5BE BD 70 D6    LDA $D670,x[$00:D670]   ;
$01/D5C1 9D 70 43    STA $4370,x[$00:4370]   ;
$01/D5C4 BD 75 D6    LDA $D675,x[$00:D675]   ;
$01/D5C7 9D 50 43    STA $4350,x[$00:4350]   ;
$01/D5CA BD 81 D6    LDA $D681,x[$00:D681]   ;
$01/D5CD 9D 40 43    STA $4340,x[$00:4340]   ;
$01/D5D0 BD 8D D6    LDA $D68D,x[$00:D68D]   ;
$01/D5D3 9D 30 43    STA $4330,x[$00:4330]   ;
$01/D5D6 BD 99 D6    LDA $D699,x[$00:D699]   ;
$01/D5D9 9D 20 43    STA $4320,x[$00:4320]   ;
$01/D5DC BD A5 D6    LDA $D6A5,x[$00:D6A5]   ;
$01/D5DF 9D 10 43    STA $4310,x[$00:4310]   ;
$01/D5E2 CA          DEX                     ;
$01/D5E3 10 D3       BPL $D3    [$D5B8]      ;
$01/D5E5 A9 7E       LDA #$7E                ;
$01/D5E7 8D 67 43    STA $4367  [$00:4367]   ;
$01/D5EA 8D 77 43    STA $4377  [$00:4377]   ;
$01/D5ED 8D 57 43    STA $4357  [$00:4357]   ;
$01/D5F0 8D 47 43    STA $4347  [$00:4347]   ;
$01/D5F3 8D 37 43    STA $4337  [$00:4337]   ;
$01/D5F6 A9 7F       LDA #$7F                ;
$01/D5F8 8D 27 43    STA $4327  [$00:4327]   ;
$01/D5FB 8D 17 43    STA $4317  [$00:4317]   ;
$01/D5FE A2 06       LDX #$06                ;
$01/D600 BD 7A D6    LDA $D67A,x[$00:D67A]   ;
$01/D603 9F 18 5B 7E STA $7E5B18,x[$7E:5B18] ;
$01/D607 BD 86 D6    LDA $D686,x[$00:D686]   ;
$01/D60A 9F 98 5B 7E STA $7E5B98,x[$7E:5B98] ;
$01/D60E BD 92 D6    LDA $D692,x[$00:D692]   ;
$01/D611 9F 18 5C 7E STA $7E5C18,x[$7E:5C18] ;
$01/D615 BD 9E D6    LDA $D69E,x[$00:D69E]   ;
$01/D618 9F 98 5C 7E STA $7E5C98,x[$7E:5C98] ;
$01/D61C BD AA D6    LDA $D6AA,x[$00:D6AA]   ;
$01/D61F 9F 18 5D 7E STA $7E5D18,x[$7E:5D18] ;
$01/D623 CA          DEX                     ;
$01/D624 10 DA       BPL $DA    [$D600]      ;
$01/D626 A2 00       LDX #$00                ;
$01/D628 AD 34 01    LDA $0134  [$00:0134]   ;
$01/D62B C9 10       CMP #$10                ;
$01/D62D 90 37       BCC $37    [$D666]      ;
$01/D62F 0A          ASL A                   ;
$01/D630 0A          ASL A                   ;
$01/D631 A8          TAY                     ;
$01/D632 C2 20       REP #$20                ;
$01/D634 B9 33 D5    LDA $D533,y[$00:D533]   ;
$01/D637 8D 00 30    STA $3000  [$00:3000]   ;
$01/D63A B9 35 D5    LDA $D535,y[$00:D535]   ;
$01/D63D 8D 02 30    STA $3002  [$00:3002]   ;
$01/D640 A2 08       LDX #$08                ;
$01/D642 A9 E7 90    LDA #$90E7              ;
$01/D645 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/D649 A9 DE 56    LDA #$56DE              ;
$01/D64C 85 20       STA $20    [$00:0020]   ;
$01/D64E A0 7F       LDY #$7F                ;
$01/D650 84 22       STY $22    [$00:0022]   ;
$01/D652 A9 00 58    LDA #$5800              ;
$01/D655 85 23       STA $23    [$00:0023]   ;
$01/D657 A0 70       LDY #$70                ;
$01/D659 84 25       STY $25    [$00:0025]   ;
$01/D65B A9 22 05    LDA #$0522              ;
$01/D65E 22 88 82 00 JSL $008288[$00:8288]   ;
$01/D662 E2 20       SEP #$20                ;
$01/D664 A2 06       LDX #$06                ;
$01/D666 8E 4A 09    STX $094A  [$00:094A]   ;
$01/D669 AB          PLB                     ;
$01/D66A 6B          RTL                     ;

DATA_01D66B:         db $01, $2C, $E4, $51, $7E

DATA_01D670:         db $03, $11, $2C, $55, $7E

DATA_01D675:         db $44, $26, $18, $5B, $7E

DATA_01D67A:         db $E9, $D0, $56, $E9, $74, $58, $00

DATA_01D681:         db $42, $12, $98, $5B, $7E

DATA_01D686:         db $E9, $40, $50, $E9, $12, $51, $00

DATA_01D68D:         db $42, $11, $18, $5C, $7E

DATA_01D692:         db $E9, $E4, $51, $E9, $B6, $52, $00

; baby bowser stuff (state 0x18)
DATA_01D699:         db $42, $32, $98, $5C, $7E

DATA_01D69E:         db $E9, $94, $58, $E9, $66, $59, $00

DATA_01D6A5:         db $40, $32, $18, $5D, $7E

DATA_01D6AA:         db $E9, $DE, $56, $E9, $47, $57, $00

$01/D6B1 AD 2D 0D    LDA $0D2D  [$01:0D2D]   ;
$01/D6B4 F0 05       BEQ $05    [$D6BB]      ;
$01/D6B6 20 CD D7    JSR $D7CD  [$00:D7CD]   ;
$01/D6B9 80 08       BRA $08    [$D6C3]      ;

$01/D6BB AD 3D 0D    LDA $0D3D  [$01:0D3D]   ;
$01/D6BE F0 03       BEQ $03    [$D6C3]      ;
$01/D6C0 20 6D D8    JSR $D86D  [$00:D86D]   ;
$01/D6C3 AE 27 0D    LDX $0D27  [$00:0D27]   ;
$01/D6C6 F0 05       BEQ $05    [$D6CD]      ;
$01/D6C8 20 95 D7    JSR $D795  [$00:D795]   ;
$01/D6CB 80 12       BRA $12    [$D6DF]      ;

$01/D6CD AD 2B 0D    LDA $0D2B  [$00:0D2B]   ;
$01/D6D0 F0 05       BEQ $05    [$D6D7]      ;
$01/D6D2 20 1D D8    JSR $D81D  [$00:D81D]   ;
$01/D6D5 80 08       BRA $08    [$D6DF]      ;

$01/D6D7 AD 45 0D    LDA $0D45  [$00:0D45]   ;
$01/D6DA F0 03       BEQ $03    [$D6DF]      ;
$01/D6DC 20 C6 D8    JSR $D8C6  [$00:D8C6]   ;
$01/D6DF AE 3B 0D    LDX $0D3B  [$00:0D3B]   ;
$01/D6E2 D0 01       BNE $01    [$D6E5]      ;
$01/D6E4 60          RTS                     ;

$01/D6E5 C2 20       REP #$20                ;
$01/D6E7 BD 9A 60    LDA $609A,x[$00:609A]   ;
$01/D6EA 8D 04 30    STA $3004  [$00:3004]   ;
$01/D6ED A2 08       LDX #$08                ;
$01/D6EF A9 12 BE    LDA #$BE12              ;
$01/D6F2 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/D6F6 AD 02 30    LDA $3002  [$00:3002]   ;
$01/D6F9 38          SEC                     ;
$01/D6FA E9 5E 38    SBC #$385E              ;
$01/D6FD 22 71 BE 00 JSL $00BE71[$00:BE71]   ;

DATA_01D701:         dw $552C, $5E7E, $7038

$01/D707 AD 3E 01    LDA $013E  [$00:013E]   ;
$01/D70A C9 01 00    CMP #$0001              ;
$01/D70D F0 06       BEQ $06    [$D715]      ;
$01/D70F E2 20       SEP #$20                ;
$01/D711 A9 80       LDA #$80                ;
$01/D713 80 7C       BRA $7C    [$D791]      ;

$01/D715 A9 FF 06    LDA #$06FF              ;
$01/D718 38          SEC                     ;
$01/D719 E5 3B       SBC $3B    [$00:003B]   ;
$01/D71B B0 07       BCS $07    [$D724]      ;
$01/D71D E2 20       SEP #$20                ;
$01/D71F AD 67 09    LDA $0967  [$01:0967]   ;
$01/D722 80 09       BRA $09    [$D72D]      ;

$01/D724 C9 D2 00    CMP #$00D2              ;
$01/D727 E2 20       SEP #$20                ;
$01/D729 90 1C       BCC $1C    [$D747]      ;
$01/D72B A9 17       LDA #$17                ;
$01/D72D 8F E5 51 7E STA $7E51E5[$7E:51E5]   ;
$01/D731 49 04       EOR #$04                ;
$01/D733 29 04       AND #$04                ;
$01/D735 8F E6 51 7E STA $7E51E6[$7E:51E6]   ;
$01/D739 A9 01       LDA #$01                ;
$01/D73B 8F E4 51 7E STA $7E51E4[$7E:51E4]   ;
$01/D73F A9 00       LDA #$00                ;
$01/D741 8F E7 51 7E STA $7E51E7[$7E:51E7]   ;
$01/D745 80 48       BRA $48    [$D78F]      ;

$01/D747 A2 00       LDX #$00                ;
$01/D749 C9 80       CMP #$80                ;
$01/D74B 90 19       BCC $19    [$D766]      ;
$01/D74D E9 7F       SBC #$7F                ;
$01/D74F 48          PHA                     ;
$01/D750 A9 7F       LDA #$7F                ;
$01/D752 9F E4 51 7E STA $7E51E4,x[$7E:51DF] ;
$01/D756 A9 17       LDA #$17                ;
$01/D758 9F E5 51 7E STA $7E51E5,x[$7E:51E0] ;
$01/D75C A9 00       LDA #$00                ;
$01/D75E 9F E6 51 7E STA $7E51E6,x[$7E:51E1] ;
$01/D762 68          PLA                     ;
$01/D763 E8          INX                     ;
$01/D764 E8          INX                     ;
$01/D765 E8          INX                     ;
$01/D766 9F E4 51 7E STA $7E51E4,x[$7E:51DF] ;
$01/D76A A9 01       LDA #$01                ;
$01/D76C 9F E7 51 7E STA $7E51E7,x[$7E:51E2] ;
$01/D770 AD 67 09    LDA $0967  [$01:0967]   ;
$01/D773 9F E8 51 7E STA $7E51E8,x[$7E:51E3] ;
$01/D777 A9 04       LDA #$04                ;
$01/D779 9F E9 51 7E STA $7E51E9,x[$7E:51E4] ;
$01/D77D A9 17       LDA #$17                ;
$01/D77F 9F E5 51 7E STA $7E51E5,x[$7E:51E0] ;
$01/D783 A9 00       LDA #$00                ;
$01/D785 9F E6 51 7E STA $7E51E6,x[$7E:51E1] ;
$01/D789 A9 00       LDA #$00                ;
$01/D78B 9F EA 51 7E STA $7E51EA,x[$7E:51E5] ;
$01/D78F A9 C0       LDA #$C0                ;
$01/D791 0C 4A 09    TSB $094A  [$01:094A]   ;
$01/D794 60          RTS                     ;

$01/D795 C2 20       REP #$20                ;
$01/D797 CA          DEX                     ;
$01/D798 B5 3B       LDA $3B,x  [$00:003B]   ;
$01/D79A 8D 04 30    STA $3004  [$00:3004]   ;
$01/D79D A9 01 00    LDA #$0001              ;
$01/D7A0 8D 00 30    STA $3000  [$00:3000]   ;
$01/D7A3 AD 28 0D    LDA $0D28  [$00:0D28]   ;
$01/D7A6 8D 12 30    STA $3012  [$00:3012]   ;
$01/D7A9 A9 72 33    LDA #$3372              ;
$01/D7AC 8D 14 30    STA $3014  [$00:3014]   ;
$01/D7AF A2 08       LDX #$08                ;
$01/D7B1 A9 26 DC    LDA #$DC26              ;
$01/D7B4 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/D7B8 A9 A4 01    LDA #$01A4              ;
$01/D7BB 22 71 BE 00 JSL $00BE71[$00:BE71]   ;

DATA_01D7BF:         dw $5040, $727E, $7033

$01/D7C5 E2 20       SEP #$20                ;
$01/D7C7 A9 10       LDA #$10                ;
$01/D7C9 0C 4A 09    TSB $094A  [$00:094A]   ;
$01/D7CC 60          RTS                     ;

$01/D7CD C2 20       REP #$20                ;
$01/D7CF AD 2D 0D    LDA $0D2D  [$00:0D2D]   ;
$01/D7D2 29 02 00    AND #$0002              ;
$01/D7D5 8D 02 30    STA $3002  [$00:3002]   ;
$01/D7D8 AD 9E 60    LDA $609E  [$00:609E]   ;
$01/D7DB 8D 04 30    STA $3004  [$00:3004]   ;
$01/D7DE AD 39 0D    LDA $0D39  [$00:0D39]   ;
$01/D7E1 8D 06 30    STA $3006  [$00:3006]   ;
$01/D7E4 AD 31 0D    LDA $0D31  [$00:0D31]   ;
$01/D7E7 8D 0E 30    STA $300E  [$00:300E]   ;
$01/D7EA A9 01 00    LDA #$0001              ;
$01/D7ED 8D 10 30    STA $3010  [$00:3010]   ;
$01/D7F0 A9 BA 36    LDA #$36BA              ;
$01/D7F3 8D 14 30    STA $3014  [$00:3014]   ;
$01/D7F6 AD B0 61    LDA $61B0  [$00:61B0]   ;
$01/D7F9 29 FF 00    AND #$00FF              ;
$01/D7FC 8D 16 30    STA $3016  [$00:3016]   ;
$01/D7FF A2 08       LDX #$08                ;
$01/D801 A9 23 DD    LDA #$DD23              ;
$01/D804 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/D808 A9 A4 01    LDA #$01A4              ;
$01/D80B 22 71 BE 00 JSL $00BE71[$00:BE71]   ;

DATA_01D80F:         dw $51E4, $BA7E, $7036

$01/D815 E2 20       SEP #$20                ;
$01/D817 A9 08       LDA #$08                ;
$01/D819 0C 4A 09    TSB $094A  [$00:094A]   ;
$01/D81C 60          RTS                     ;

$01/D81D C2 20       REP #$20                ;
$01/D81F AD 2B 0D    LDA $0D2B  [$00:0D2B]   ;
$01/D822 29 02 00    AND #$0002              ;
$01/D825 8D 02 30    STA $3002  [$00:3002]   ;
$01/D828 AD 37 0D    LDA $0D37  [$00:0D37]   ;
$01/D82B 8D 00 60    STA $6000  [$00:6000]   ;
$01/D82E AD 9E 60    LDA $609E  [$00:609E]   ;
$01/D831 8D 04 30    STA $3004  [$00:3004]   ;
$01/D834 AD 2F 0D    LDA $0D2F  [$00:0D2F]   ;
$01/D837 8D 06 30    STA $3006  [$00:3006]   ;
$01/D83A A9 01 00    LDA #$0001              ;
$01/D83D 8D 08 30    STA $3008  [$00:3008]   ;
$01/D840 A9 72 33    LDA #$3372              ;
$01/D843 8D 14 30    STA $3014  [$00:3014]   ;
$01/D846 AD B0 61    LDA $61B0  [$00:61B0]   ;
$01/D849 29 FF 00    AND #$00FF              ;
$01/D84C 8D 16 30    STA $3016  [$00:3016]   ;
$01/D84F A2 08       LDX #$08                ;
$01/D851 A9 4D DC    LDA #$DC4D              ;
$01/D854 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/D858 A9 A4 01    LDA #$01A4              ;
$01/D85B 22 71 BE 00 JSL $00BE71[$00:BE71]   ;

DATA_01D85F:         dw $5040, $727E, $7033

$01/D865 E2 20       SEP #$20                ;
$01/D867 A9 10       LDA #$10                ;
$01/D869 0C 4A 09    TSB $094A  [$00:094A]   ;
$01/D86C 60          RTS                     ;

$01/D86D C2 20       REP #$20                ;
$01/D86F AD 3D 0D    LDA $0D3D  [$00:0D3D]   ;
$01/D872 29 02 00    AND #$0002              ;
$01/D875 8D 02 30    STA $3002  [$00:3002]   ;
$01/D878 AD 43 0D    LDA $0D43  [$00:0D43]   ;
$01/D87B 8D 00 60    STA $6000  [$00:6000]   ;
$01/D87E AD A0 60    LDA $60A0  [$00:60A0]   ;
$01/D881 8D 04 30    STA $3004  [$00:3004]   ;
$01/D884 AD 3F 0D    LDA $0D3F  [$00:0D3F]   ;
$01/D887 8D 06 30    STA $3006  [$00:3006]   ;
$01/D88A A9 01 00    LDA #$0001              ;
$01/D88D 8D 08 30    STA $3008  [$00:3008]   ;
$01/D890 A9 BA 36    LDA #$36BA              ;
$01/D893 8D 14 30    STA $3014  [$00:3014]   ;
$01/D896 AD B0 61    LDA $61B0  [$00:61B0]   ;
$01/D899 29 FF 00    AND #$00FF              ;
$01/D89C 8D 16 30    STA $3016  [$00:3016]   ;
$01/D89F A2 08       LDX #$08                ;
$01/D8A1 A9 4D DC    LDA #$DC4D              ;
$01/D8A4 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/D8A8 A9 A4 01    LDA #$01A4              ;
$01/D8AB 22 71 BE 00 JSL $00BE71[$00:BE71]   ;

DATA_01D8AF:         dw $51E4, $BA7E, $7036

$01/D8B5 AF BA 36 70 LDA $7036BA[$70:36BA]   ;
$01/D8B9 8D 98 60    STA $6098  [$00:6098]   ;
$01/D8BC 85 41       STA $41    [$00:0041]   ;
$01/D8BE E2 20       SEP #$20                ;
$01/D8C0 A9 08       LDA #$08                ;
$01/D8C2 0C 4A 09    TSB $094A  [$00:094A]   ;
$01/D8C5 60          RTS                     ;

$01/D8C6 C2 20       REP #$20                ;
$01/D8C8 AD 45 0D    LDA $0D45  [$00:0D45]   ;
$01/D8CB 29 02 00    AND #$0002              ;
$01/D8CE 8D 02 30    STA $3002  [$00:3002]   ;
$01/D8D1 AD A0 60    LDA $60A0  [$00:60A0]   ;
$01/D8D4 8D 04 30    STA $3004  [$00:3004]   ;
$01/D8D7 AD 4B 0D    LDA $0D4B  [$00:0D4B]   ;
$01/D8DA 8D 06 30    STA $3006  [$00:3006]   ;
$01/D8DD AD 47 0D    LDA $0D47  [$00:0D47]   ;
$01/D8E0 8D 0E 30    STA $300E  [$00:300E]   ;
$01/D8E3 A9 01 00    LDA #$0001              ;
$01/D8E6 8D 10 30    STA $3010  [$00:3010]   ;
$01/D8E9 A9 72 33    LDA #$3372              ;
$01/D8EC 8D 14 30    STA $3014  [$00:3014]   ;
$01/D8EF AD B0 61    LDA $61B0  [$00:61B0]   ;
$01/D8F2 29 FF 00    AND #$00FF              ;
$01/D8F5 8D 16 30    STA $3016  [$00:3016]   ;
$01/D8F8 A2 08       LDX #$08                ;
$01/D8FA A9 23 DD    LDA #$DD23              ;
$01/D8FD 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/D901 A9 A4 01    LDA #$01A4              ;
$01/D904 22 71 BE 00 JSL $00BE71[$00:BE71]   ;

DATA_01D908:         dw $5040, $727E, $7033

$01/D90E E2 20       SEP #$20                ;
$01/D910 A9 10       LDA #$10                ;
$01/D912 0C 4A 09    TSB $094A  [$00:094A]   ;
$01/D915 60          RTS                     ;

DATA_01D916:         dw $DA69
DATA_01D918:         dw $D92C
DATA_01D91A:         dw $DA98

DATA_01D91C:         dw $1402, $2000, $00E0, $00C3
DATA_01D924:         dw $00A5, $0008, $0804, $1004

$01/D92C 9C 67 09    STZ $0967  [$00:0967]   ;
$01/D92F A9 13 8D    LDA #$8D13              ;
$01/D932 68          PLA                     ;
$01/D933 09 C2 20    ORA #$20C2              ;
$01/D936 AD B0 61    LDA $61B0  [$00:61B0]   ;
$01/D939 0D 55 0B    ORA $0B55  [$00:0B55]   ;
$01/D93C 0D 98 03    ORA $0398  [$00:0398]   ;
$01/D93F D0 05       BNE $05    [$D946]      ;
$01/D941 AD E8 7F    LDA $7FE8  [$00:7FE8]   ;
$01/D944 D0 1A       BNE $1A    [$D960]      ;
$01/D946 AD 37 0D    LDA $0D37  [$00:0D37]   ;
$01/D949 0D 39 0D    ORA $0D39  [$00:0D39]   ;
$01/D94C D0 0F       BNE $0F    [$D95D]      ;
$01/D94E 9C 2B 0D    STZ $0D2B  [$00:0D2B]   ;
$01/D951 9C 2D 0D    STZ $0D2D  [$00:0D2D]   ;
$01/D954 AD 4A 09    LDA $094A  [$00:094A]   ;
$01/D957 29 E7 FF    AND #$FFE7              ;
$01/D95A 8D 4A 09    STA $094A  [$00:094A]   ;
$01/D95D 4C 51 DA    JMP $DA51  [$00:DA51]   ;

$01/D960 3A          DEC A                   ;
$01/D961 D0 5A       BNE $5A    [$D9BD]      ;
$01/D963 AD FF 0C    LDA $0CFF  [$00:0CFF]   ;
$01/D966 F0 0C       BEQ $0C    [$D974]      ;
$01/D968 38          SEC                     ;
$01/D969 E9 00 01    SBC #$0100              ;
$01/D96C 8D FF 0C    STA $0CFF  [$00:0CFF]   ;
$01/D96F 10 03       BPL $03    [$D974]      ;
$01/D971 9C FF 0C    STZ $0CFF  [$00:0CFF]   ;
$01/D974 AD 03 0D    LDA $0D03  [$00:0D03]   ;
$01/D977 29 FF 00    AND #$00FF              ;
$01/D97A F0 03       BEQ $03    [$D97F]      ;
$01/D97C 4C 1C DA    JMP $DA1C  [$00:DA1C]   ;

$01/D97F AF 6C 2F 70 LDA $702F6C[$70:2F6C]   ;
$01/D983 D0 2F       BNE $2F    [$D9B4]      ;
$01/D985 AD FF 0C    LDA $0CFF  [$00:0CFF]   ;
$01/D988 D0 12       BNE $12    [$D99C]      ;
$01/D98A A9 22 00    LDA #$0022              ;\ play sound #$0022
$01/D98D 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/D991 9C E8 7F    STZ $7FE8  [$00:7FE8]   ;
$01/D994 9C 37 0D    STZ $0D37  [$00:0D37]   ;
$01/D997 9C 39 0D    STZ $0D39  [$00:0D39]   ;
$01/D99A 80 15       BRA $15    [$D9B1]      ;

$01/D99C 29 00 01    AND #$0100              ;
$01/D99F D0 10       BNE $10    [$D9B1]      ;
$01/D9A1 CE 37 0D    DEC $0D37  [$00:0D37]   ;
$01/D9A4 10 03       BPL $03    [$D9A9]      ;
$01/D9A6 9C 37 0D    STZ $0D37  [$00:0D37]   ;
$01/D9A9 CE 39 0D    DEC $0D39  [$00:0D39]   ;
$01/D9AC 10 03       BPL $03    [$D9B1]      ;
$01/D9AE 9C 39 0D    STZ $0D39  [$00:0D39]   ;
$01/D9B1 4C 47 DA    JMP $DA47  [$00:DA47]   ;

$01/D9B4 A9 00 00    LDA #$0000              ;
$01/D9B7 8F 6C 2F 70 STA $702F6C[$70:2F6C]   ;
$01/D9BB 80 54       BRA $54    [$DA11]      ;

$01/D9BD CE E8 7F    DEC $7FE8  [$00:7FE8]   ;
$01/D9C0 AD FF 0C    LDA $0CFF  [$00:0CFF]   ;
$01/D9C3 18          CLC                     ;
$01/D9C4 69 80 00    ADC #$0080              ;
$01/D9C7 C9 00 60    CMP #$6000              ;
$01/D9CA 90 03       BCC $03    [$D9CF]      ;
$01/D9CC A9 00 60    LDA #$6000              ;
$01/D9CF 8D FF 0C    STA $0CFF  [$00:0CFF]   ;
$01/D9D2 29 80 03    AND #$0380              ;
$01/D9D5 D0 18       BNE $18    [$D9EF]      ;
$01/D9D7 AD 37 0D    LDA $0D37  [$00:0D37]   ;
$01/D9DA 1A          INC A                   ;
$01/D9DB C9 18 00    CMP #$0018              ;
$01/D9DE B0 03       BCS $03    [$D9E3]      ;
$01/D9E0 8D 37 0D    STA $0D37  [$00:0D37]   ;
$01/D9E3 AD 39 0D    LDA $0D39  [$00:0D39]   ;
$01/D9E6 1A          INC A                   ;
$01/D9E7 C9 0C 00    CMP #$000C              ;
$01/D9EA B0 03       BCS $03    [$D9EF]      ;
$01/D9EC 8D 39 0D    STA $0D39  [$00:0D39]   ;
$01/D9EF A9 03 00    LDA #$0003              ;
$01/D9F2 8D 2B 0D    STA $0D2B  [$00:0D2B]   ;
$01/D9F5 A9 01 00    LDA #$0001              ;
$01/D9F8 8D 2D 0D    STA $0D2D  [$00:0D2D]   ;
$01/D9FB AD 03 0D    LDA $0D03  [$00:0D03]   ;
$01/D9FE 29 FF 00    AND #$00FF              ;
$01/DA01 D0 19       BNE $19    [$DA1C]      ;
$01/DA03 AD 70 79    LDA $7970  [$00:7970]   ;
$01/DA06 29 0E 00    AND #$000E              ;
$01/DA09 AA          TAX                     ;
$01/DA0A BD 1C D9    LDA $D91C,x[$00:D91C]   ;
$01/DA0D 8F 6C 2F 70 STA $702F6C[$70:2F6C]   ;
$01/DA11 9C 03 0D    STZ $0D03  [$00:0D03]   ;
$01/DA14 AF 00 20 70 LDA $702000[$70:2000]   ;
$01/DA18 8F 6C 2D 70 STA $702D6C[$70:2D6C]   ;
$01/DA1C AD 03 0D    LDA $0D03  [$00:0D03]   ;
$01/DA1F 18          CLC                     ;
$01/DA20 69 08 00    ADC #$0008              ;
$01/DA23 8D 03 0D    STA $0D03  [$00:0D03]   ;
$01/DA26 8D 0C 30    STA $300C  [$00:300C]   ;
$01/DA29 AF 6C 2D 70 LDA $702D6C[$70:2D6C]   ;
$01/DA2D 8D 02 30    STA $3002  [$00:3002]   ;
$01/DA30 AF 6C 2F 70 LDA $702F6C[$70:2F6C]   ;
$01/DA34 8D 04 30    STA $3004  [$00:3004]   ;
$01/DA37 A2 08       LDX #$08                ;
$01/DA39 A9 32 E1    LDA #$E132              ;
$01/DA3C 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/DA40 AD 06 30    LDA $3006  [$00:3006]   ;
$01/DA43 8F 00 20 70 STA $702000[$70:2000]   ;
$01/DA47 AD 01 0D    LDA $0D01  [$00:0D01]   ;
$01/DA4A 18          CLC                     ;
$01/DA4B 69 20 00    ADC #$0020              ;
$01/DA4E 8D 01 0D    STA $0D01  [$00:0D01]   ;

$01/DA51 AD FF 0C    LDA $0CFF  [$00:0CFF]   ;
$01/DA54 8D 02 30    STA $3002  [$00:3002]   ;
$01/DA57 AD 01 0D    LDA $0D01  [$00:0D01]   ;
$01/DA5A 8D 04 30    STA $3004  [$00:3004]   ;
$01/DA5D A2 08       LDX #$08                ;
$01/DA5F A9 18 95    LDA #$9518              ;
$01/DA62 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/DA66 E2 20       SEP #$20                ;
$01/DA68 60          RTS                     ;

$01/DA69 C2 20       REP #$20                ;
$01/DA6B AD B0 61    LDA $61B0  [$00:61B0]   ;
$01/DA6E 0D 98 03    ORA $0398  [$00:0398]   ;
$01/DA71 D0 06       BNE $06    [$DA79]      ;
$01/DA73 CE FD 0C    DEC $0CFD  [$00:0CFD]   ;
$01/DA76 CE FD 0C    DEC $0CFD  [$00:0CFD]   ;
$01/DA79 AD FD 0C    LDA $0CFD  [$00:0CFD]   ;
$01/DA7C 8D 0E 30    STA $300E  [$00:300E]   ;
$01/DA7F A5 39       LDA $39    [$00:0039]   ;
$01/DA81 8D EE 7E    STA $7EEE  [$00:7EEE]   ;
$01/DA84 8D 10 30    STA $3010  [$00:3010]   ; r8
$01/DA87 A5 3B       LDA $3B    [$00:003B]   ;
$01/DA89 8D 12 30    STA $3012  [$00:3012]   ; r9
$01/DA8C A2 08       LDX #$08                ;
$01/DA8E A9 CE 9D    LDA #$9DCE              ;
$01/DA91 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/DA95 E2 20       SEP #$20                ;
$01/DA97 60          RTS                     ;

$01/DA98 C2 20       REP #$20                ;
$01/DA9A EE FD 0C    INC $0CFD  [$00:0CFD]   ;
$01/DA9D AD FD 0C    LDA $0CFD  [$00:0CFD]   ;
$01/DAA0 C9 60 00    CMP #$0060              ;
$01/DAA3 90 06       BCC $06    [$DAAB]      ;
$01/DAA5 A9 00 00    LDA #$0000              ;
$01/DAA8 8D FD 0C    STA $0CFD  [$00:0CFD]   ;
$01/DAAB 4A          LSR A                   ;
$01/DAAC 4A          LSR A                   ;
$01/DAAD 4A          LSR A                   ;
$01/DAAE 8D 0E 30    STA $300E  [$00:300E]   ;
$01/DAB1 AD B0 60    LDA $60B0  [$00:60B0]   ;
$01/DAB4 8D 12 30    STA $3012  [$00:3012]   ;
$01/DAB7 A2 0B       LDX #$0B                ;
$01/DAB9 A9 C3 96    LDA #$96C3              ;
$01/DABC 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/DAC0 E2 20       SEP #$20                ;
$01/DAC2 60          RTS                     ;

$01/DAC3 A9 64 00    LDA #$0064              ;
$01/DAC6 AC 9A 03    LDY $039A  [$00:039A]   ;
$01/DAC9 D0 12       BNE $12    [$DADD]      ;
$01/DACB 18          CLC                     ;
$01/DACC 6D 96 03    ADC $0396  [$00:0396]   ;
$01/DACF 8D 96 03    STA $0396  [$00:0396]   ;
$01/DAD2 18          CLC                     ;
$01/DAD3 69 78 00    ADC #$0078              ;
$01/DAD6 8D 7F 0B    STA $0B7F  [$00:0B7F]   ;
$01/DAD9 EE 9A 03    INC $039A  [$00:039A]   ;
$01/DADC 60          RTS                     ;

$01/DADD AD 96 03    LDA $0396  [$00:0396]   ;
$01/DAE0 D0 03       BNE $03    [$DAE5]      ;
$01/DAE2 9C 98 03    STZ $0398  [$00:0398]   ;
$01/DAE5 60          RTS                     ;

$01/DAE6 A9 C8 00    LDA #$00C8              ;
$01/DAE9 80 DB       BRA $DB    [$DAC6]      ;

$01/DAEB 22 B4 94 02 JSL $0294B4[$02:94B4]   ;
$01/DAEF A9 47 00    LDA #$0047              ;\ play sound #$0047
$01/DAF2 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/DAF6 A9 20 00    LDA #$0020              ;
$01/DAF9 8D C6 61    STA $61C6  [$00:61C6]   ;
$01/DAFC 9C 98 03    STZ $0398  [$00:0398]   ;
$01/DAFF 60          RTS                     ;

$01/DB00 EE 06 7E    INC $7E06  [$00:7E06]   ;
$01/DB03 A9 04 00    LDA #$0004              ;\ play sound #$0004
$01/DB06 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/DB0A 9C 98 03    STZ $0398  [$00:0398]   ;
$01/DB0D 60          RTS                     ;

$01/DB0E AC 9A 03    LDY $039A  [$00:039A]   ;
$01/DB11 D0 11       BNE $11    [$DB24]      ;
$01/DB13 A9 AB 00    LDA #$00AB              ;
$01/DB16 22 64 A3 03 JSL $03A364[$03:A364]   ;
$01/DB1A 90 08       BCC $08    [$DB24]      ;
$01/DB1C BB          TYX                     ;
$01/DB1D 22 C6 9A 02 JSL $029AC6[$02:9AC6]   ;
$01/DB21 EE 9A 03    INC $039A  [$00:039A]   ;
$01/DB24 60          RTS                     ;

$01/DB25 A2 5C       LDX #$5C                ;
$01/DB27 BD 00 6F    LDA $6F00,x[$00:6F02]   ;
$01/DB2A C9 0E 00    CMP #$000E              ;
$01/DB2D 90 1C       BCC $1C    [$DB4B]      ;
$01/DB2F BD A2 6F    LDA $6FA2,x[$00:6FA4]   ;
$01/DB32 29 00 60    AND #$6000              ;
$01/DB35 D0 14       BNE $14    [$DB4B]      ;
$01/DB37 EC B6 61    CPX $61B6  [$00:61B6]   ;
$01/DB3A D0 03       BNE $03    [$DB3F]      ;
$01/DB3C 9C B6 61    STZ $61B6  [$00:61B6]   ;
$01/DB3F A9 06 00    LDA #$0006              ;
$01/DB42 9D 00 6F    STA $6F00,x[$00:6F02]   ;
$01/DB45 A9 CB 00    LDA #$00CB              ;
$01/DB48 9D 91 0B    STA $0B91,x[$00:0B93]   ;
$01/DB4B CA          DEX                     ;
$01/DB4C CA          DEX                     ;
$01/DB4D CA          DEX                     ;
$01/DB4E CA          DEX                     ;
$01/DB4F 10 D6       BPL $D6    [$DB27]      ;
$01/DB51 A9 3B 00    LDA #$003B              ;\ play sound #$003B
$01/DB54 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/DB58 9C 98 03    STZ $0398  [$00:0398]   ;
$01/DB5B 60          RTS                     ;

$01/DB5C A9 03 00    LDA #$0003              ;
$01/DB5F 8D 6A 61    STA $616A  [$00:616A]   ;
$01/DB62 EE 62 61    INC $6162  [$00:6162]   ;
$01/DB65 EE 68 61    INC $6168  [$00:6168]   ;
$01/DB68 A9 5A 00    LDA #$005A              ;
$01/DB6B 8D 70 61    STA $6170  [$00:6170]   ;
$01/DB6E A9 14 00    LDA #$0014              ;\ play sound #$0014
$01/DB71 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/DB75 9C 98 03    STZ $0398  [$00:0398]   ;
$01/DB78 60          RTS                     ;

$01/DB79 A9 04 00    LDA #$0004              ;
$01/DB7C 80 E1       BRA $E1    [$DB5F]      ;

$01/DB7E A9 01 00    LDA #$0001              ;
$01/DB81 80 DC       BRA $DC    [$DB5F]      ;

$01/DB83 AD F4 0C    LDA $0CF4  [$00:0CF4]   ;
$01/DB86 18          CLC                     ;
$01/DB87 6D F5 0C    ADC $0CF5  [$00:0CF5]   ;
$01/DB8A AA          TAX                     ;
$01/DB8B F0 2C       BEQ $2C    [$DBB9]      ;
$01/DB8D 9E 56 03    STZ $0356,x[$00:0356]   ;
$01/DB90 9B          TXY                     ;
$01/DB91 88          DEY                     ;
$01/DB92 E0 1B       CPX #$1B                ;
$01/DB94 B0 11       BCS $11    [$DBA7]      ;
$01/DB96 BD 57 03    LDA $0357,x[$00:0357]   ;
$01/DB99 29 0F       AND #$0F                ;
$01/DB9B F0 07       BEQ $07    [$DBA4]      ;
$01/DB9D 99 57 03    STA $0357,y[$00:0357]   ;
$01/DBA0 9E 57 03    STZ $0357,x[$00:0357]   ;
$01/DBA3 C8          INY                     ;
$01/DBA4 E8          INX                     ;
$01/DBA5 80 EB       BRA $EB    [$DB92]      ;

$01/DBA7 AD F5 0C    LDA $0CF5  [$00:0CF5]   ;
$01/DBAA F0 05       BEQ $05    [$DBB1]      ;
$01/DBAC CE F5 0C    DEC $0CF5  [$00:0CF5]   ;
$01/DBAF 80 08       BRA $08    [$DBB9]      ;

$01/DBB1 CE F4 0C    DEC $0CF4  [$00:0CF4]   ;
$01/DBB4 D0 03       BNE $03    [$DBB9]      ;
$01/DBB6 EE F4 0C    INC $0CF4  [$00:0CF4]   ;
$01/DBB9 60          RTS                     ;

DATA_01DBBA:         dw $DC8B
DATA_01DBBC:         dw $DC8B
DATA_01DBBE:         dw $DCA0
DATA_01DBC0:         dw $DCA1
DATA_01DBC2:         dw $DC97
DATA_01DBC4:         dw $DCA0
DATA_01DBC6:         dw $DCB2
DATA_01DBC8:         dw $DCB2
DATA_01DBCA:         dw $DCB2

DATA_01DBCC:         db $01, $FF, $FF, $03, $FF, $FF, $1B, $FF
DATA_01DBD4:         db $FF

$01/DBD5 A5 38       LDA $38    [$00:0038]   ;
$01/DBD7 29 03       AND #$03                ;
$01/DBD9 F0 70       BEQ $70    [$DC4B]      ;
$01/DBDB AA          TAX                     ;
$01/DBDC AD F4 0C    LDA $0CF4  [$01:0CF4]   ;
$01/DBDF D0 03       BNE $03    [$DBE4]      ;
$01/DBE1 4C 8A DC    JMP $DC8A  [$00:DC8A]   ;

$01/DBE4 3A          DEC A                   ;
$01/DBE5 85 00       STA $00    [$00:0000]   ;
$01/DBE7 18          CLC                     ;
$01/DBE8 7D CB DB    ADC $DBCB,x[$00:DBCB]   ;
$01/DBEB DD CE DB    CMP $DBCE,x[$00:DBCE]   ;
$01/DBEE F0 0A       BEQ $0A    [$DBFA]      ;
$01/DBF0 1A          INC A                   ;
$01/DBF1 8D F4 0C    STA $0CF4  [$00:0CF4]   ;
$01/DBF4 A9 5C       LDA #$5C                ;
$01/DBF6 85 53       STA $53    [$00:0053]   ;
$01/DBF8 80 22       BRA $22    [$DC1C]      ;

$01/DBFA A5 00       LDA $00    [$00:0000]   ;
$01/DBFC 18          CLC                     ;
$01/DBFD 6D F5 0C    ADC $0CF5  [$00:0CF5]   ;
$01/DC00 18          CLC                     ;
$01/DC01 7D CB DB    ADC $DBCB,x[$00:DBCB]   ;
$01/DC04 DD D1 DB    CMP $DBD1,x[$00:DBD1]   ;
$01/DC07 D0 05       BNE $05    [$DC0E]      ;
$01/DC09 AD F5 0C    LDA $0CF5  [$00:0CF5]   ;
$01/DC0C 80 0E       BRA $0E    [$DC1C]      ;

$01/DC0E A9 5C       LDA #$5C                ;
$01/DC10 85 53       STA $53    [$00:0053]   ;
$01/DC12 AD F5 0C    LDA $0CF5  [$00:0CF5]   ;
$01/DC15 18          CLC                     ;
$01/DC16 7D CB DB    ADC $DBCB,x[$00:DBCB]   ;
$01/DC19 8D F5 0C    STA $0CF5  [$00:0CF5]   ;
$01/DC1C AD F4 0C    LDA $0CF4  [$00:0CF4]   ;
$01/DC1F 18          CLC                     ;
$01/DC20 6D F5 0C    ADC $0CF5  [$00:0CF5]   ;
$01/DC23 AA          TAX                     ;
$01/DC24 E0 1B       CPX #$1B                ;
$01/DC26 B0 1A       BCS $1A    [$DC42]      ;
$01/DC28 CA          DEX                     ;
$01/DC29 BD 57 03    LDA $0357,x[$00:0357]   ;
$01/DC2C D0 14       BNE $14    [$DC42]      ;
$01/DC2E CE F5 0C    DEC $0CF5  [$00:0CF5]   ;
$01/DC31 10 0D       BPL $0D    [$DC40]      ;
$01/DC33 9C F5 0C    STZ $0CF5  [$00:0CF5]   ;
$01/DC36 CE F4 0C    DEC $0CF4  [$00:0CF4]   ;
$01/DC39 10 05       BPL $05    [$DC40]      ;
$01/DC3B 9C F4 0C    STZ $0CF4  [$00:0CF4]   ;
$01/DC3E 80 02       BRA $02    [$DC42]      ;

$01/DC40 64 53       STZ $53    [$00:0053]   ;
$01/DC42 20 C6 DC    JSR $DCC6  [$00:DCC6]   ;
$01/DC45 20 8B DD    JSR $DD8B  [$00:DD8B]   ;
$01/DC48 20 E0 DC    JSR $DCE0  [$00:DCE0]   ;
$01/DC4B AD 98 03    LDA $0398  [$00:0398]   ;
$01/DC4E D0 3A       BNE $3A    [$DC8A]      ;
$01/DC50 A5 37       LDA $37    [$00:0037]   ;
$01/DC52 29 80       AND #$80                ;
$01/DC54 F0 34       BEQ $34    [$DC8A]      ;
$01/DC56 AD 48 0B    LDA $0B48  [$00:0B48]   ;
$01/DC59 D0 19       BNE $19    [$DC74]      ;
$01/DC5B AD F5 0C    LDA $0CF5  [$00:0CF5]   ;
$01/DC5E 18          CLC                     ;
$01/DC5F 6D F4 0C    ADC $0CF4  [$00:0CF4]   ;
$01/DC62 AA          TAX                     ;
$01/DC63 BD 56 03    LDA $0356,x[$00:0356]   ;
$01/DC66 8D 98 03    STA $0398  [$00:0398]   ;
$01/DC69 F0 09       BEQ $09    [$DC74]      ;
$01/DC6B 0A          ASL A                   ;
$01/DC6C AA          TAX                     ;
$01/DC6D C2 20       REP #$20                ;
$01/DC6F FC B8 DB    JSR ($DBB8,x)[$00:6DAA] ;

$01/DC72 E2 20       SEP #$20                ;
$01/DC74 AD 98 03    LDA $0398  [$00:0398]   ;
$01/DC77 F0 0D       BEQ $0D    [$DC86]      ;
$01/DC79 A9 43       LDA #$43                ;
$01/DC7B 85 53       STA $53    [$00:0053]   ;
$01/DC7D 9C 9A 03    STZ $039A  [$00:039A]   ;
$01/DC80 9C 9B 03    STZ $039B  [$00:039B]   ;
$01/DC83 4C 83 DB    JMP $DB83  [$00:DB83]   ;

$01/DC86 A9 90       LDA #$90                ;
$01/DC88 85 53       STA $53    [$00:0053]   ;
$01/DC8A 60          RTS                     ;

$01/DC8B AD B6 03    LDA $03B6  [$01:03B6]   ;
$01/DC8E C9 2C 01    CMP #$012C              ;
$01/DC91 90 03       BCC $03    [$DC96]      ;
$01/DC93 9C 98 03    STZ $0398  [$01:0398]   ;
$01/DC96 60          RTS                     ;

$01/DC97 AD 06 7E    LDA $7E06  [$01:7E06]   ;
$01/DC9A F0 03       BEQ $03    [$DC9F]      ;
$01/DC9C 9C 98 03    STZ $0398  [$01:0398]   ;
$01/DC9F 60          RTS                     ;

$01/DCA0 60          RTS                     ;

$01/DCA1 AD AE 60    LDA $60AE  [$01:60AE]   ;
$01/DCA4 D0 08       BNE $08    [$DCAE]      ;
$01/DCA6 AD F6 7D    LDA $7DF6  [$01:7DF6]   ;
$01/DCA9 C9 0C 00    CMP #$000C              ;
$01/DCAC 90 03       BCC $03    [$DCB1]      ;
$01/DCAE 9C 98 03    STZ $0398  [$01:0398]   ;
$01/DCB1 60          RTS                     ;

$01/DCB2 AD AE 60    LDA $60AE  [$01:60AE]   ;
$01/DCB5 0D 62 61    ORA $6162  [$01:6162]   ;
$01/DCB8 0D 68 61    ORA $6168  [$01:6168]   ;
$01/DCBB F0 04       BEQ $04    [$DCC1]      ;
$01/DCBD 9C 98 03    STZ $0398  [$01:0398]   ;
$01/DCC0 60          RTS                     ;

$01/DCC1 22 4A F7 04 JSL $04F74A[$04:F74A]   ;
$01/DCC5 60          RTS                     ;

$01/DCC6 A2 00       LDX #$00                ;
$01/DCC8 AC F5 0C    LDY $0CF5  [$00:0CF5]   ;
$01/DCCB B9 57 03    LDA $0357,y[$00:0357]   ;
$01/DCCE 9D F6 0C    STA $0CF6,x[$00:0CF6]   ;
$01/DCD1 C8          INY                     ;
$01/DCD2 E8          INX                     ;
$01/DCD3 E0 03       CPX #$03                ;
$01/DCD5 90 F4       BCC $F4    [$DCCB]      ;
$01/DCD7 60          RTS                     ;

DATA_01DCD8:         dw $09AF, $499D

DATA_01DCDC:         dw $09AF, $099D

$01/DCE0 A2 00       LDX #$00                ;
$01/DCE2 AD F5 0C    LDA $0CF5  [$00:0CF5]   ;
$01/DCE5 F0 02       BEQ $02    [$DCE9]      ;
$01/DCE7 E8          INX                     ;
$01/DCE8 E8          INX                     ;
$01/DCE9 C2 20       REP #$20                ;
$01/DCEB BD D8 DC    LDA $DCD8,x[$00:DCD8]   ;
$01/DCEE 8F 05 B6 7E STA $7EB605[$7E:B605]   ;
$01/DCF2 09 00 80    ORA #$8000              ;
$01/DCF5 8F 45 B6 7E STA $7EB645[$7E:B645]   ;
$01/DCF9 E2 20       SEP #$20                ;
$01/DCFB A2 00       LDX #$00                ;
$01/DCFD AD F5 0C    LDA $0CF5  [$00:0CF5]   ;
$01/DD00 18          CLC                     ;
$01/DD01 69 03       ADC #$03                ;
$01/DD03 C9 1B       CMP #$1B                ;
$01/DD05 B0 08       BCS $08    [$DD0F]      ;
$01/DD07 A8          TAY                     ;
$01/DD08 B9 57 03    LDA $0357,y[$00:0357]   ;
$01/DD0B F0 02       BEQ $02    [$DD0F]      ;
$01/DD0D E8          INX                     ;
$01/DD0E E8          INX                     ;
$01/DD0F C2 20       REP #$20                ;
$01/DD11 BD DC DC    LDA $DCDC,x[$00:DCDC]   ;
$01/DD14 8F 1B B6 7E STA $7EB61B[$7E:B61B]   ;
$01/DD18 09 00 80    ORA #$8000              ;
$01/DD1B 8F 5B B6 7E STA $7EB65B[$7E:B65B]   ;
$01/DD1F E2 20       SEP #$20                ;
$01/DD21 60          RTS                     ;

DATA_01DD22:         dw $1DBB, $1DBC, $1DBC, $1DBE
DATA_01DD2A:         dw $1DD1, $417F, $417F, $1DBF
DATA_01DD32:         dw $1DD1, $417F, $417F, $1DBF
DATA_01DD3A:         dw $9DBB, $9DBC, $9DBC, $9DBE
DATA_01DD42:         dw $5DBE, $1DBC, $1DBC, $1DBE
DATA_01DD4A:         dw $5DBF, $417F, $417F, $1DBF
DATA_01DD52:         dw $5DBF, $417F, $417F, $1DBF
DATA_01DD5A:         dw $DDBE, $9DBC, $9DBC, $9DBE
DATA_01DD62:         dw $5DBE, $1DBC, $1DBC, $5DBB
DATA_01DD6A:         dw $5DBF, $417F, $417F, $5DD1
DATA_01DD72:         dw $5DBF, $417F, $417F, $5DD1
DATA_01DD7A:         dw $DDBE, $9DBC, $9DBC

DATA_01DD80:         db $BB, $DD, $22, $DD, $42, $DD, $62

DATA_01DD87:         db $DD, $00, $06, $0C

$01/DD8B C2 20       REP #$20                ;
$01/DD8D 8B          PHB                     ;
$01/DD8E A2 7E       LDX #$7E                ;
$01/DD90 DA          PHX                     ;
$01/DD91 AB          PLB                     ;
$01/DD92 20 90 D4    JSR $D490  [$00:D490]   ;
$01/DD95 AB          PLB                     ;
$01/DD96 20 B0 DD    JSR $DDB0  [$00:DDB0]   ;
$01/DD99 C2 10       REP #$10                ;
$01/DD9B A0 7E 00    LDY #$007E              ;
$01/DD9E 84 01       STY $01    [$00:0001]   ;
$01/DDA0 A0 E0 36    LDY #$36E0              ;
$01/DDA3 A2 9F B5    LDX #$B59F              ;
$01/DDA6 A9 00 01    LDA #$0100              ;
$01/DDA9 22 A6 BE 00 JSL $00BEA6[$00:BEA6]   ;
$01/DDAD E2 30       SEP #$30                ;
$01/DDAF 60          RTS                     ;

$01/DDB0 AD F4 0C    LDA $0CF4  [$01:0CF4]   ;
$01/DDB3 29 FF 00    AND #$00FF              ;
$01/DDB6 A8          TAY                     ;
$01/DDB7 0A          ASL A                   ;
$01/DDB8 AA          TAX                     ;
$01/DDB9 B9 87 DD    LDA $DD87,y[$01:EFC9]   ;
$01/DDBC A8          TAY                     ;
$01/DDBD BD 80 DD    LDA $DD80,x[$01:DD7B]   ;
$01/DDC0 85 00       STA $00    [$00:0000]   ;
$01/DDC2 18          CLC                     ;
$01/DDC3 69 08 00    ADC #$0008              ;
$01/DDC6 85 02       STA $02    [$00:0002]   ;
$01/DDC8 18          CLC                     ;
$01/DDC9 69 08 00    ADC #$0008              ;
$01/DDCC 85 04       STA $04    [$00:0004]   ;
$01/DDCE 18          CLC                     ;
$01/DDCF 69 08 00    ADC #$0008              ;
$01/DDD2 85 06       STA $06    [$00:0006]   ;
$01/DDD4 BB          TYX                     ;
$01/DDD5 A0 00       LDY #$00                ;
$01/DDD7 B1 00       LDA ($00),y[$01:FEC7]   ;
$01/DDD9 9F C7 B5 7E STA $7EB5C7,x[$7E:B5C2] ;
$01/DDDD B1 02       LDA ($02),y[$01:9790]   ;
$01/DDDF 9F 07 B6 7E STA $7EB607,x[$7E:B602] ;
$01/DDE3 B1 04       LDA ($04),y[$01:612E]   ;
$01/DDE5 9F 47 B6 7E STA $7EB647,x[$7E:B642] ;
$01/DDE9 B1 06       LDA ($06),y[$01:E812]   ;
$01/DDEB 9F 87 B6 7E STA $7EB687,x[$7E:B682] ;
$01/DDEF E8          INX                     ;
$01/DDF0 E8          INX                     ;
$01/DDF1 C8          INY                     ;
$01/DDF2 C8          INY                     ;
$01/DDF3 C0 08       CPY #$08                ;
$01/DDF5 90 E0       BCC $E0    [$DDD7]      ;
$01/DDF7 60          RTS                     ;

DATA_01DDF8:         dw $3540, $3542, $3144, $3146
DATA_01DE00:         dw $3148, $314A, $314C, $314E
DATA_01DE08:         dw $334C

$01/DE0A C2 20       REP #$20                ;
$01/DE0C A9 A8 BF    LDA #$BFA8              ;
$01/DE0F 85 00       STA $00    [$00:0000]   ;
$01/DE11 A2 00       LDX #$00                ;
$01/DE13 9B          TXY                     ;
$01/DE14 B9 F6 0C    LDA $0CF6,y[$01:1F38]   ;
$01/DE17 29 FF 00    AND #$00FF              ;
$01/DE1A F0 20       BEQ $20    [$DE3C]      ;
$01/DE1C 5A          PHY                     ;
$01/DE1D 0A          ASL A                   ;
$01/DE1E A8          TAY                     ;
$01/DE1F B9 F6 DD    LDA $DDF6,y[$01:F038]   ;
$01/DE22 9F 82 6A 00 STA $006A82,x[$00:6A7D] ;
$01/DE26 7A          PLY                     ;
$01/DE27 A5 00       LDA $00    [$00:0000]   ;
$01/DE29 9F 80 6A 00 STA $006A80,x[$00:6A7B] ;
$01/DE2D 18          CLC                     ;
$01/DE2E 69 18 00    ADC #$0018              ;
$01/DE31 85 00       STA $00    [$00:0000]   ;
$01/DE33 E8          INX                     ;
$01/DE34 E8          INX                     ;
$01/DE35 E8          INX                     ;
$01/DE36 E8          INX                     ;
$01/DE37 C8          INY                     ;
$01/DE38 C0 03       CPY #$03                ;
$01/DE3A 90 D8       BCC $D8    [$DE14]      ;
$01/DE3C A9 AA AA    LDA #$AAAA              ;
$01/DE3F 8F 08 6C 00 STA $006C08[$00:6C08]   ;
$01/DE43 E2 20       SEP #$20                ;
$01/DE45 60          RTS                     ;

DATA_01DE46:         db $00, $02, $02, $0B, $0B, $0B, $02

DATA_01DE4D:         db $00, $22, $22, $88, $88, $88, $22

$01/DE54 A9 01       LDA #$01                ;
$01/DE56 85 10       STA $10    [$00:0010]   ;
$01/DE58 80 02       BRA $02    [$DE5C]      ;

$01/DE5A 64 10       STZ $10    [$00:0010]   ;
$01/DE5C 8B          PHB                     ;
$01/DE5D 4B          PHK                     ;
$01/DE5E AB          PLB                     ;
$01/DE5F AE 0F 0D    LDX $0D0F  [$00:0D0F]   ;
$01/DE62 A5 10       LDA $10    [$00:0010]   ;
$01/DE64 D0 1A       BNE $1A    [$DE80]      ;
$01/DE66 8A          TXA                     ;
$01/DE67 4A          LSR A                   ;
$01/DE68 A8          TAY                     ;
$01/DE69 B9 46 DE    LDA $DE46,y[$00:DE46]   ;
$01/DE6C 8D 65 09    STA $0965  [$00:0965]   ;
$01/DE6F B9 4D DE    LDA $DE4D,y[$00:DE4D]   ;
$01/DE72 8D 64 09    STA $0964  [$00:0964]   ;
$01/DE75 8D 66 09    STA $0966  [$00:0966]   ;
$01/DE78 A9 01       LDA #$01                ;
$01/DE7A 8D AE 61    STA $61AE  [$00:61AE]   ;
$01/DE7D 8D B0 61    STA $61B0  [$00:61B0]   ;
$01/DE80 FC 84 DE    JSR ($DE84,x)[$00:0020] ;

$01/DE83 AB          PLB                     ;
$01/DE84 6B          RTL                     ;

DATA_01DE85:         dw $DE93
DATA_01DE87:         dw $DEA9
DATA_01DE89:         dw $DED0
DATA_01DE8B:         dw $DEA9
DATA_01DE8D:         dw $DEE0
DATA_01DE8F:         dw $DEB9
DATA_01DE91:         dw $DEB9

$01/DE93 A9 50       LDA #$50                ;\ play sound #$0050
$01/DE95 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/DE99 9C 19 0D    STZ $0D19  [$00:0D19]   ;
$01/DE9C 9C 1A 0D    STZ $0D1A  [$00:0D1A]   ;
$01/DE9F 9C 1B 0D    STZ $0D1B  [$00:0D1B]   ;
$01/DEA2 EE 0F 0D    INC $0D0F  [$00:0D0F]   ;
$01/DEA5 EE 0F 0D    INC $0D0F  [$00:0D0F]   ;
$01/DEA8 60          RTS                     ;

$01/DEA9 A0 00       LDY #$00                ;
$01/DEAB E0 03       CPX #$03                ;
$01/DEAD D0 04       BNE $04    [$DEB3]      ;
$01/DEAF A5 10       LDA $10    [$00:0010]   ;
$01/DEB1 D0 10       BNE $10    [$DEC3]      ;
$01/DEB3 AE 11 0D    LDX $0D11  [$00:0D11]   ;
$01/DEB6 7C F5 DE    JMP ($DEF5,x)[$00:0000] ;

$01/DEB9 A0 02       LDY #$02                ;
$01/DEBB E0 0D       CPX #$0D                ;
$01/DEBD D0 F4       BNE $F4    [$DEB3]      ;
$01/DEBF A5 10       LDA $10    [$00:0010]   ;
$01/DEC1 F0 F0       BEQ $F0    [$DEB3]      ;
$01/DEC3 C2 20       REP #$20                ;
$01/DEC5 AD 19 0D    LDA $0D19  [$00:0D19]   ;
$01/DEC8 8D 08 30    STA $3008  [$00:3008]   ;
$01/DECB E2 20       SEP #$20                ;
$01/DECD 4C 18 DF    JMP $DF18  [$00:DF18]   ;

$01/DED0 C2 20       REP #$20                ;
$01/DED2 A9 00 00    LDA #$0000              ;
$01/DED5 8F 6E 40 70 STA $70406E[$70:406E]   ;
$01/DED9 E2 20       SEP #$20                ;
$01/DEDB 20 80 E1    JSR $E180  [$00:E180]   ;
$01/DEDE 80 C2       BRA $C2    [$DEA2]      ;

$01/DEE0 20 80 E1    JSR $E180  [$00:E180]   ;
$01/DEE3 AF 6E 40 70 LDA $70406E[$70:406E]   ;
$01/DEE7 C9 02       CMP #$02                ;
$01/DEE9 90 09       BCC $09    [$DEF4]      ;
$01/DEEB A9 56       LDA #$56                ;\ play sound #$0056
$01/DEED 22 D2 85 00 JSL $0085D2[$00:85D2]   ;/
$01/DEF1 20 A2 DE    JSR $DEA2  [$00:DEA2]   ;
$01/DEF4 60          RTS                     ;

DATA_01DEF5:         dw $DEFF

DATA_01DEF7:         dw $0100, $0000

DATA_01DEFB:         dw $0010, $FFF0

$01/DEFF C2 20       REP #$20                ;
$01/DF01 AD 19 0D    LDA $0D19  [$00:0D19]   ;
$01/DF04 18          CLC                     ;
$01/DF05 79 FB DE    ADC $DEFB,y[$00:DEFB]   ;
$01/DF08 8D 19 0D    STA $0D19  [$00:0D19]   ;
$01/DF0B 8D 08 30    STA $3008  [$00:3008]   ;
$01/DF0E D9 F7 DE    CMP $DEF7,y[$00:DEF7]   ;
$01/DF11 E2 20       SEP #$20                ;
$01/DF13 F0 03       BEQ $03    [$DF18]      ;
$01/DF15 4C 48 E0    JMP $E048  [$00:E048]   ;

$01/DF18 20 A2 DE    JSR $DEA2  [$00:DEA2]   ;
$01/DF1B AD 0F 0D    LDA $0D0F  [$00:0D0F]   ;
$01/DF1E C9 0F       CMP #$0F                ;
$01/DF20 D0 23       BNE $23    [$DF45]      ;
$01/DF22 9C 0F 0D    STZ $0D0F  [$00:0D0F]   ;
$01/DF25 A5 10       LDA $10    [$00:0010]   ;
$01/DF27 D0 1B       BNE $1B    [$DF44]      ;
$01/DF29 9C 64 09    STZ $0964  [$00:0964]   ;
$01/DF2C 9C 65 09    STZ $0965  [$00:0965]   ;
$01/DF2F 9C 66 09    STZ $0966  [$00:0966]   ;
$01/DF32 9C B0 61    STZ $61B0  [$00:61B0]   ;
$01/DF35 AD 8C 03    LDA $038C  [$00:038C]   ;
$01/DF38 F0 07       BEQ $07    [$DF41]      ;
$01/DF3A 24 35       BIT $35    [$00:0035]   ;
$01/DF3C 70 06       BVS $06    [$DF44]      ;
$01/DF3E 9C 8C 03    STZ $038C  [$00:038C]   ;
$01/DF41 9C AE 61    STZ $61AE  [$00:61AE]   ;
$01/DF44 60          RTS                     ;

$01/DF45 C9 0D       CMP #$0D                ;
$01/DF47 D0 45       BNE $45    [$DF8E]      ;
$01/DF49 C2 30       REP #$30                ;
$01/DF4B A9 00 01    LDA #$0100              ;
$01/DF4E 8D 19 0D    STA $0D19  [$00:0D19]   ;
$01/DF51 A0 80 01    LDY #$0180              ;
$01/DF54 AD 17 0D    LDA $0D17  [$00:0D17]   ;
$01/DF57 18          CLC                     ;
$01/DF58 69 C0 00    ADC #$00C0              ;
$01/DF5B C9 00 38    CMP #$3800              ;
$01/DF5E F0 0A       BEQ $0A    [$DF6A]      ;
$01/DF60 90 08       BCC $08    [$DF6A]      ;
$01/DF62 A9 00 38    LDA #$3800              ;
$01/DF65 ED 17 0D    SBC $0D17  [$00:0D17]   ;
$01/DF68 0A          ASL A                   ;
$01/DF69 A8          TAY                     ;
$01/DF6A AD 17 0D    LDA $0D17  [$00:0D17]   ;
$01/DF6D 20 33 D5    JSR $D533  [$00:D533]   ;
$01/DF70 C2 30       REP #$30                ;
$01/DF72 AD 17 0D    LDA $0D17  [$00:0D17]   ;
$01/DF75 18          CLC                     ;
$01/DF76 69 C0 00    ADC #$00C0              ;
$01/DF79 38          SEC                     ;
$01/DF7A E9 00 38    SBC #$3800              ;
$01/DF7D F0 0A       BEQ $0A    [$DF89]      ;
$01/DF7F 30 08       BMI $08    [$DF89]      ;
$01/DF81 0A          ASL A                   ;
$01/DF82 A8          TAY                     ;
$01/DF83 A9 00 34    LDA #$3400              ;
$01/DF86 20 33 D5    JSR $D533  [$00:D533]   ;
$01/DF89 E2 30       SEP #$30                ;
$01/DF8B 4C 48 E0    JMP $E048  [$00:E048]   ;

$01/DF8E C9 05       CMP #$05                ;
$01/DF90 D0 F9       BNE $F9    [$DF8B]      ;
$01/DF92 C2 30       REP #$30                ;
$01/DF94 9C 19 0D    STZ $0D19  [$00:0D19]   ;
$01/DF97 A0 82 01    LDY #$0182              ;
$01/DF9A A5 43       LDA $43    [$00:0043]   ;
$01/DF9C 18          CLC                     ;
$01/DF9D 69 18 00    ADC #$0018              ;
$01/DFA0 29 F0 01    AND #$01F0              ;
$01/DFA3 0A          ASL A                   ;
$01/DFA4 09 00 34    ORA #$3400              ;
$01/DFA7 8D 17 0D    STA $0D17  [$00:0D17]   ;
$01/DFAA 18          CLC                     ;
$01/DFAB 69 C0 00    ADC #$00C0              ;
$01/DFAE C9 00 38    CMP #$3800              ;
$01/DFB1 F0 0C       BEQ $0C    [$DFBF]      ;
$01/DFB3 90 0A       BCC $0A    [$DFBF]      ;
$01/DFB5 A9 00 38    LDA #$3800              ;
$01/DFB8 ED 17 0D    SBC $0D17  [$00:0D17]   ;
$01/DFBB 0A          ASL A                   ;
$01/DFBC 1A          INC A                   ;
$01/DFBD 1A          INC A                   ;
$01/DFBE A8          TAY                     ;
$01/DFBF AD 17 0D    LDA $0D17  [$00:0D17]   ;
$01/DFC2 09 00 80    ORA #$8000              ;
$01/DFC5 20 33 D5    JSR $D533  [$00:D533]   ;
$01/DFC8 C2 30       REP #$30                ;
$01/DFCA AD 17 0D    LDA $0D17  [$00:0D17]   ;
$01/DFCD 18          CLC                     ;
$01/DFCE 69 C0 00    ADC #$00C0              ;
$01/DFD1 38          SEC                     ;
$01/DFD2 E9 00 38    SBC #$3800              ;
$01/DFD5 F0 0C       BEQ $0C    [$DFE3]      ;
$01/DFD7 30 0A       BMI $0A    [$DFE3]      ;
$01/DFD9 0A          ASL A                   ;
$01/DFDA 1A          INC A                   ;
$01/DFDB 1A          INC A                   ;
$01/DFDC A8          TAY                     ;
$01/DFDD A9 00 B4    LDA #$B400              ;
$01/DFE0 20 33 D5    JSR $D533  [$00:D533]   ;
$01/DFE3 E2 30       SEP #$30                ;
$01/DFE5 8B          PHB                     ;
$01/DFE6 A9 7E       LDA #$7E                ;
$01/DFE8 48          PHA                     ;
$01/DFE9 AB          PLB                     ;
$01/DFEA C2 30       REP #$30                ;
$01/DFEC A5 41       LDA $41    [$00:0041]   ;
$01/DFEE 18          CLC                     ;
$01/DFEF 69 38 00    ADC #$0038              ;
$01/DFF2 29 F0 01    AND #$01F0              ;
$01/DFF5 4A          LSR A                   ;
$01/DFF6 4A          LSR A                   ;
$01/DFF7 4A          LSR A                   ;
$01/DFF8 4A          LSR A                   ;
$01/DFF9 85 02       STA $02    [$00:0002]   ;
$01/DFFB 49 1F 00    EOR #$001F              ;
$01/DFFE 1A          INC A                   ;
$01/DFFF C9 0A 00    CMP #$000A              ;
$01/E002 90 03       BCC $03    [$E007]      ;
$01/E004 A9 0A 00    LDA #$000A              ;
$01/E007 85 04       STA $04    [$00:0004]   ;
$01/E009 64 08       STZ $08    [$00:0008]   ;
$01/E00B A9 00 2A    LDA #$2A00              ;
$01/E00E 85 06       STA $06    [$00:0006]   ;
$01/E010 AF 17 0D 00 LDA $000D17[$00:0D17]   ;
$01/E014 18          CLC                     ;
$01/E015 65 02       ADC $02    [$00:0002]   ;
$01/E017 85 02       STA $02    [$00:0002]   ;
$01/E019 20 BF E0    JSR $E0BF  [$00:E0BF]   ;
$01/E01C E6 08       INC $08    [$00:0008]   ;
$01/E01E A5 04       LDA $04    [$00:0004]   ;
$01/E020 C9 0A 00    CMP #$000A              ;
$01/E023 B0 1A       BCS $1A    [$E03F]      ;
$01/E025 3A          DEC A                   ;
$01/E026 0A          ASL A                   ;
$01/E027 18          CLC                     ;
$01/E028 69 00 2A    ADC #$2A00              ;
$01/E02B 85 06       STA $06    [$00:0006]   ;
$01/E02D A9 0A 00    LDA #$000A              ;
$01/E030 38          SEC                     ;
$01/E031 E5 04       SBC $04    [$00:0004]   ;
$01/E033 85 04       STA $04    [$00:0004]   ;
$01/E035 A5 02       LDA $02    [$00:0002]   ;
$01/E037 29 E0 FF    AND #$FFE0              ;
$01/E03A 85 02       STA $02    [$00:0002]   ;
$01/E03C 20 BF E0    JSR $E0BF  [$00:E0BF]   ;
$01/E03F A9 FF FF    LDA #$FFFF              ;
$01/E042 9D 02 40    STA $4002,x[$00:4002]   ;
$01/E045 E2 30       SEP #$30                ;
$01/E047 AB          PLB                     ;

$01/E048 C2 20       REP #$20                ;
$01/E04A 9C 02 30    STZ $3002  [$00:3002]   ;
$01/E04D 9C 04 30    STZ $3004  [$00:3004]   ;
$01/E050 9C 06 30    STZ $3006  [$00:3006]   ;
$01/E053 A5 41       LDA $41    [$00:0041]   ;
$01/E055 29 0F 00    AND #$000F              ;
$01/E058 C9 08 00    CMP #$0008              ;
$01/E05B B0 03       BCS $03    [$E060]      ;
$01/E05D 09 10 00    ORA #$0010              ;
$01/E060 49 FF FF    EOR #$FFFF              ;
$01/E063 1A          INC A                   ;
$01/E064 18          CLC                     ;
$01/E065 69 90 00    ADC #$0090              ;
$01/E068 8D 0A 30    STA $300A  [$00:300A]   ;
$01/E06B A5 43       LDA $43    [$00:0043]   ;
$01/E06D 29 0F 00    AND #$000F              ;
$01/E070 C9 08 00    CMP #$0008              ;
$01/E073 B0 03       BCS $03    [$E078]      ;
$01/E075 09 10 00    ORA #$0010              ;
$01/E078 49 FF FF    EOR #$FFFF              ;
$01/E07B 1A          INC A                   ;
$01/E07C 18          CLC                     ;
$01/E07D 69 47 00    ADC #$0047              ;
$01/E080 8D 0C 30    STA $300C  [$00:300C]   ;
$01/E083 A9 02 80    LDA #$8002              ;
$01/E086 A6 10       LDX $10    [$00:0010]   ;
$01/E088 F0 03       BEQ $03    [$E08D]      ;
$01/E08A A9 40 80    LDA #$8040              ;
$01/E08D A2 08       LDX #$08                ;
$01/E08F 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/E093 E2 20       SEP #$20                ;
$01/E095 A5 10       LDA $10    [$00:0010]   ;
$01/E097 D0 25       BNE $25    [$E0BE]      ;
$01/E099 22 39 BE 00 JSL $00BE39[$00:BE39]   ;

; DMA args
DATA_01E09D:         dl $7E56D0, $703A02
DATA_01E0A3:         dw $0348

$01/E0A5 AD 67 09    LDA $0967  [$00:0967]   ;
$01/E0A8 8D 69 09    STA $0969  [$00:0969]   ;
$01/E0AB AD 68 09    LDA $0968  [$00:0968]   ;
$01/E0AE 8D 6A 09    STA $096A  [$00:096A]   ;
$01/E0B1 A9 30       LDA #$30                ;
$01/E0B3 8D 4C 09    STA $094C  [$00:094C]   ;
$01/E0B6 9C 2B 21    STZ $212B  [$00:212B]   ;
$01/E0B9 A9 20       LDA #$20                ;
$01/E0BB 0C 4A 09    TSB $094A  [$00:094A]   ;
$01/E0BE 60          RTS                     ;

$01/E0BF A9 06 00    LDA #$0006              ;
$01/E0C2 85 00       STA $00    [$00:0000]   ;
$01/E0C4 AE 00 40    LDX $4000  [$00:4000]   ;
$01/E0C7 A5 02       LDA $02    [$00:0002]   ;
$01/E0C9 9D 02 40    STA $4002,x[$00:4004]   ;
$01/E0CC 48          PHA                     ;
$01/E0CD A5 04       LDA $04    [$00:0004]   ;
$01/E0CF 0A          ASL A                   ;
$01/E0D0 3A          DEC A                   ;
$01/E0D1 9D 04 40    STA $4004,x[$00:4006]   ;
$01/E0D4 A5 00       LDA $00    [$00:0000]   ;
$01/E0D6 3A          DEC A                   ;
$01/E0D7 F0 12       BEQ $12    [$E0EB]      ;
$01/E0D9 C9 05 00    CMP #$0005              ;
$01/E0DC B0 0D       BCS $0D    [$E0EB]      ;
$01/E0DE 20 07 E1    JSR $E107  [$00:E107]   ;
$01/E0E1 A5 06       LDA $06    [$00:0006]   ;
$01/E0E3 18          CLC                     ;
$01/E0E4 69 20 00    ADC #$0020              ;
$01/E0E7 85 06       STA $06    [$00:0006]   ;
$01/E0E9 80 03       BRA $03    [$E0EE]      ;

$01/E0EB 20 36 E1    JSR $E136  [$00:E136]   ;
$01/E0EE 8A          TXA                     ;
$01/E0EF 18          CLC                     ;
$01/E0F0 69 04 00    ADC #$0004              ;
$01/E0F3 AA          TAX                     ;
$01/E0F4 68          PLA                     ;
$01/E0F5 18          CLC                     ;
$01/E0F6 69 20 00    ADC #$0020              ;
$01/E0F9 29 FF F7    AND #$F7FF              ;
$01/E0FC 09 00 04    ORA #$0400              ;
$01/E0FF C6 00       DEC $00    [$00:0000]   ;
$01/E101 D0 C6       BNE $C6    [$E0C9]      ;
$01/E103 8E 00 40    STX $4000  [$00:4000]   ;
$01/E106 60          RTS                     ;

$01/E107 A4 04       LDY $04    [$00:0004]   ;
$01/E109 A5 08       LDA $08    [$00:0008]   ;
$01/E10B D0 0B       BNE $0B    [$E118]      ;
$01/E10D A9 C3 2D    LDA #$2DC3              ;
$01/E110 9D 06 40    STA $4006,x[$00:4008]   ;
$01/E113 E8          INX                     ;
$01/E114 E8          INX                     ;
$01/E115 88          DEY                     ;
$01/E116 F0 1D       BEQ $1D    [$E135]      ;
$01/E118 A5 06       LDA $06    [$00:0006]   ;
$01/E11A 9D 06 40    STA $4006,x[$00:4008]   ;
$01/E11D 1A          INC A                   ;
$01/E11E 1A          INC A                   ;
$01/E11F E8          INX                     ;
$01/E120 E8          INX                     ;
$01/E121 88          DEY                     ;
$01/E122 D0 F6       BNE $F6    [$E11A]      ;
$01/E124 A5 08       LDA $08    [$00:0008]   ;
$01/E126 D0 07       BNE $07    [$E12F]      ;
$01/E128 A5 04       LDA $04    [$00:0004]   ;
$01/E12A C9 0A 00    CMP #$000A              ;
$01/E12D 90 06       BCC $06    [$E135]      ;
$01/E12F A9 C3 6D    LDA #$6DC3              ;
$01/E132 9D 04 40    STA $4004,x[$00:4006]   ;
$01/E135 60          RTS                     ;

$01/E136 A4 04       LDY $04    [$00:0004]   ;
$01/E138 A5 08       LDA $08    [$00:0008]   ;
$01/E13A D0 15       BNE $15    [$E151]      ;
$01/E13C A5 00       LDA $00    [$00:0000]   ;
$01/E13E 3A          DEC A                   ;
$01/E13F D0 05       BNE $05    [$E146]      ;
$01/E141 A9 C0 AD    LDA #$ADC0              ;
$01/E144 80 03       BRA $03    [$E149]      ;

$01/E146 A9 C0 2D    LDA #$2DC0              ;
$01/E149 9D 06 40    STA $4006,x[$00:4008]   ;
$01/E14C E8          INX                     ;
$01/E14D E8          INX                     ;
$01/E14E 88          DEY                     ;
$01/E14F F0 2E       BEQ $2E    [$E17F]      ;
$01/E151 A5 00       LDA $00    [$00:0000]   ;
$01/E153 3A          DEC A                   ;
$01/E154 D0 05       BNE $05    [$E15B]      ;
$01/E156 A9 C1 AD    LDA #$ADC1              ;
$01/E159 80 03       BRA $03    [$E15E]      ;

$01/E15B A9 C1 2D    LDA #$2DC1              ;
$01/E15E 9D 06 40    STA $4006,x[$00:4008]   ;
$01/E161 E8          INX                     ;
$01/E162 E8          INX                     ;
$01/E163 88          DEY                     ;
$01/E164 D0 F8       BNE $F8    [$E15E]      ;
$01/E166 A5 08       LDA $08    [$00:0008]   ;
$01/E168 D0 07       BNE $07    [$E171]      ;
$01/E16A A5 04       LDA $04    [$00:0004]   ;
$01/E16C C9 0A 00    CMP #$000A              ;
$01/E16F 90 0E       BCC $0E    [$E17F]      ;
$01/E171 A9 C0 6D    LDA #$6DC0              ;
$01/E174 A4 00       LDY $00    [$00:0000]   ;
$01/E176 88          DEY                     ;
$01/E177 D0 03       BNE $03    [$E17C]      ;
$01/E179 A9 C0 ED    LDA #$EDC0              ;
$01/E17C 9D 04 40    STA $4004,x[$00:4006]   ;
$01/E17F 60          RTS                     ;

$01/E180 AD 2D 01    LDA $012D  [$00:012D]   ;
$01/E183 48          PHA                     ;
$01/E184 AD 2E 01    LDA $012E  [$00:012E]   ;
$01/E187 48          PHA                     ;
$01/E188 A9 13       LDA #$13                ;
$01/E18A 8D 2D 01    STA $012D  [$00:012D]   ;
$01/E18D A9 3C       LDA #$3C                ;
$01/E18F 8D 2E 01    STA $012E  [$00:012E]   ;
$01/E192 C2 30       REP #$30                ;
$01/E194 AF 70 40 70 LDA $704070[$70:4070]   ;
$01/E198 0A          ASL A                   ;
$01/E199 AA          TAX                     ;
$01/E19A BF DB 10 51 LDA $5110DB,x[$51:10DB] ;
$01/E19E 8F 96 40 70 STA $704096[$70:4096]   ;
$01/E1A2 A9 51 00    LDA #$0051              ;
$01/E1A5 8F 98 40 70 STA $704098[$70:4098]   ;
$01/E1A9 AD 79 03    LDA $0379  [$00:0379]   ;
$01/E1AC 8F 9A 40 70 STA $70409A[$70:409A]   ;
$01/E1B0 E2 10       SEP #$10                ;
$01/E1B2 A9 00 00    LDA #$0000              ;
$01/E1B5 8F 74 40 70 STA $704074[$70:4074]   ;
$01/E1B9 8F 76 40 70 STA $704076[$70:4076]   ;
$01/E1BD AD 71 00    LDA $0071  [$00:0071]   ;
$01/E1C0 D0 14       BNE $14    [$E1D6]      ;
$01/E1C2 AD 3C 09    LDA $093C  [$00:093C]   ;
$01/E1C5 29 80 0F    AND #$0F80              ;
$01/E1C8 8F 74 40 70 STA $704074[$70:4074]   ;
$01/E1CC AD 3E 09    LDA $093E  [$00:093E]   ;
$01/E1CF 29 80 0F    AND #$0F80              ;
$01/E1D2 8F 76 40 70 STA $704076[$70:4076]   ;
$01/E1D6 A2 09       LDX #$09                ;
$01/E1D8 A9 3E B0    LDA #$B03E              ;
$01/E1DB 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/E1DF E2 20       SEP #$20                ;
$01/E1E1 68          PLA                     ;
$01/E1E2 8D 2E 01    STA $012E  [$00:012E]   ;
$01/E1E5 68          PLA                     ;
$01/E1E6 8D 2D 01    STA $012D  [$00:012D]   ;
$01/E1E9 AD 7A 60    LDA $607A  [$00:607A]   ;
$01/E1EC F0 04       BEQ $04    [$E1F2]      ;
$01/E1EE 22 D2 85 00 JSL $0085D2[$00:85D2]   ;
$01/E1F2 EE 15 0D    INC $0D15  [$00:0D15]   ;
$01/E1F5 20 F9 E1    JSR $E1F9  [$00:E1F9]   ;
$01/E1F8 60          RTS                     ;

$01/E1F9 8B          PHB                     ;
$01/E1FA A9 7E       LDA #$7E                ;
$01/E1FC 48          PHA                     ;
$01/E1FD AB          PLB                     ;
$01/E1FE C2 30       REP #$30                ;
$01/E200 AE 00 40    LDX $4000  [$00:4000]   ;
$01/E203 A5 43       LDA $43    [$00:0043]   ;
$01/E205 18          CLC                     ;
$01/E206 69 68 00    ADC #$0068              ;
$01/E209 29 F0 01    AND #$01F0              ;
$01/E20C 0A          ASL A                   ;
$01/E20D 09 00 34    ORA #$3400              ;
$01/E210 85 00       STA $00    [$00:0000]   ;
$01/E212 A5 41       LDA $41    [$00:0041]   ;
$01/E214 18          CLC                     ;
$01/E215 69 B8 00    ADC #$00B8              ;
$01/E218 29 F0 01    AND #$01F0              ;
$01/E21B 4A          LSR A                   ;
$01/E21C 4A          LSR A                   ;
$01/E21D 4A          LSR A                   ;
$01/E21E 4A          LSR A                   ;
$01/E21F 65 00       ADC $00    [$00:0000]   ;
$01/E221 9D 02 40    STA $4002,x[$00:4002]   ;
$01/E224 A9 01 00    LDA #$0001              ;
$01/E227 9D 04 40    STA $4004,x[$00:4004]   ;
$01/E22A AF 73 40 70 LDA $704073[$70:4073]   ;
$01/E22E 29 FF 00    AND #$00FF              ;
$01/E231 C9 0F 00    CMP #$000F              ;
$01/E234 F0 1A       BEQ $1A    [$E250]      ;
$01/E236 C9 51 00    CMP #$0051              ;
$01/E239 F0 15       BEQ $15    [$E250]      ;
$01/E23B C9 FF 00    CMP #$00FF              ;
$01/E23E F0 10       BEQ $10    [$E250]      ;
$01/E240 AF 6E 40 70 LDA $70406E[$70:406E]   ;
$01/E244 C9 02 00    CMP #$0002              ;
$01/E247 B0 07       BCS $07    [$E250]      ;
$01/E249 A5 30       LDA $30    [$00:0030]   ;
$01/E24B 29 10 00    AND #$0010              ;
$01/E24E F0 05       BEQ $05    [$E255]      ;
$01/E250 A9 C1 AD    LDA #$ADC1              ;
$01/E253 80 03       BRA $03    [$E258]      ;

$01/E255 A9 C5 2D    LDA #$2DC5              ;
$01/E258 9D 06 40    STA $4006,x[$00:4006]   ;
$01/E25B A9 FF FF    LDA #$FFFF              ;
$01/E25E 9D 08 40    STA $4008,x[$00:4008]   ;
$01/E261 8A          TXA                     ;
$01/E262 18          CLC                     ;
$01/E263 69 06 00    ADC #$0006              ;
$01/E266 8D 00 40    STA $4000  [$00:4000]   ;
$01/E269 E2 30       SEP #$30                ;
$01/E26B AB          PLB                     ;
$01/E26C 60          RTS                     ;

.gamemode31
$01/E26D AE 57 0B    LDX $0B57  [$00:0B57]   ;
$01/E270 FC 91 E2    JSR ($E291,x)[$00:D903] ;

$01/E273 AD 57 0B    LDA $0B57  [$00:0B57]   ;
$01/E276 C9 16       CMP #$16                ;
$01/E278 90 0A       BCC $0A    [$E284]      ;
$01/E27A A9 19       LDA #$19                ;
$01/E27C 8D 57 0B    STA $0B57  [$00:0B57]   ;
$01/E27F A9 10       LDA #$10                ;
$01/E281 8D 18 01    STA $0118  [$00:0118]   ;
$01/E284 AD 57 0B    LDA $0B57  [$00:0B57]   ;
$01/E287 C9 08       CMP #$08                ;
$01/E289 B0 04       BCS $04    [$E28F]      ;
$01/E28B 22 CE C0 01 JSL $01C0CE[$01:C0CE]   ;
$01/E28F AB          PLB                     ;
$01/E290 6B          RTL                     ;

DATA_01E291:         dw $E2A7
DATA_01E293:         dw $E2F0
DATA_01E295:         dw $E378
DATA_01E297:         dw $E442
DATA_01E299:         dw $B5E4
DATA_01E29B:         dw $B6B9
DATA_01E29D:         dw $B6C9
DATA_01E29F:         dw $B95B
DATA_01E2A1:         dw $B9BA
DATA_01E2A3:         dw $E2F0
DATA_01E2A5:         dw $E4A0

$01/E2A7 C2 30       REP #$30                ;
$01/E2A9 AD 46 01    LDA $0146  [$00:0146]   ;
$01/E2AC C9 09 00    CMP #$0009              ;
$01/E2AF F0 10       BEQ $10    [$E2C1]      ;
$01/E2B1 AF 00 20 70 LDA $702000[$70:2000]   ;
$01/E2B5 8D 48 09    STA $0948  [$00:0948]   ;
$01/E2B8 A9 00 00    LDA #$0000              ;
$01/E2BB 8F 00 20 70 STA $702000[$70:2000]   ;
$01/E2BF C2 30       REP #$30                ;
$01/E2C1 A2 00 00    LDX #$0000              ;
$01/E2C4 A9 00 FF    LDA #$FF00              ;
$01/E2C7 9F 02 3A 70 STA $703A02,x[$70:3A02] ;
$01/E2CB E8          INX                     ;
$01/E2CC E8          INX                     ;
$01/E2CD E8          INX                     ;
$01/E2CE E8          INX                     ;
$01/E2CF E0 48 03    CPX #$0348              ;
$01/E2D2 90 F3       BCC $F3    [$E2C7]      ;
$01/E2D4 E2 30       SEP #$30                ;
$01/E2D6 EE 57 0B    INC $0B57  [$00:0B57]   ;
$01/E2D9 EE 57 0B    INC $0B57  [$00:0B57]   ;
$01/E2DC 9C 1F 0D    STZ $0D1F  [$00:0D1F]   ;
$01/E2DF 60          RTS                     ;

DATA_01E2E0:         dw $1F1F, $0104
DATA_01E2E4:         dw $0000, $018C
DATA_01E2E8:         dw $0350, $018C
DATA_01E2EC:         dw $FF00, $9F60

$01/E2F0 EE 1F 0D    INC $0D1F  [$01:0D1F]   ;
$01/E2F3 AD 1F 0D    LDA $0D1F  [$01:0D1F]   ;
$01/E2F6 C9 0A       CMP #$0A                ;
$01/E2F8 90 3E       BCC $3E    [$E338]      ;
$01/E2FA EE 57 0B    INC $0B57  [$00:0B57]   ;
$01/E2FD EE 57 0B    INC $0B57  [$00:0B57]   ;
$01/E300 C2 20       REP #$20                ;
$01/E302 9C 1F 0D    STZ $0D1F  [$00:0D1F]   ;
$01/E305 AE 4E 0B    LDX $0B4E  [$00:0B4E]   ;
$01/E308 BD E0 E2    LDA $E2E0,x[$00:E2E0]   ;
$01/E30B 8D 69 09    STA $0969  [$00:0969]   ;
$01/E30E BD E4 E2    LDA $E2E4,x[$00:E2E4]   ;
$01/E311 8D 23 0D    STA $0D23  [$00:0D23]   ;
$01/E314 BD E8 E2    LDA $E2E8,x[$00:E2E8]   ;
$01/E317 8D 25 0D    STA $0D25  [$00:0D25]   ;
$01/E31A BD EC E2    LDA $E2EC,x[$00:E2EC]   ;
$01/E31D 8D 21 0D    STA $0D21  [$00:0D21]   ;
$01/E320 E2 20       SEP #$20                ;
$01/E322 A9 33       LDA #$33                ;
$01/E324 8D 64 09    STA $0964  [$00:0964]   ;
$01/E327 8D 65 09    STA $0965  [$00:0965]   ;
$01/E32A 8D 66 09    STA $0966  [$00:0966]   ;
$01/E32D A9 22       LDA #$22                ;
$01/E32F 8D 6B 09    STA $096B  [$00:096B]   ;
$01/E332 A9 20       LDA #$20                ;
$01/E334 8D 4A 09    STA $094A  [$00:094A]   ;
$01/E337 60          RTS                     ;

$01/E338 3A          DEC A                   ;
$01/E339 D0 0D       BNE $0D    [$E348]      ;
$01/E33B 22 39 BE 00 JSL $00BE39[$00:BE39]   ;

DATA_01E33F:         dw $56D0, $027E, $703A, $00D2

$01/E347 60          RTS

$01/E348 3A          DEC A                   ;
$01/E349 D0 0D       BNE $0D    [$E358]      ;
$01/E34B 22 39 BE 00 JSL $00BE39[$00:BE39]   ;

DATA_01E34F:         dw $57A2, $D47E, $703A, $00D2

$01/E357 60          RTS

$01/E358 3A          DEC A                   ;
$01/E359 D0 0D       BNE $0D    [$E368]      ;
$01/E35B 22 39 BE 00 JSL $00BE39[$00:BE39]   ;

DATA_01E35F:         dw $5874, $A67E, $703B, $00D2

$01/E367 60          RTS

$01/E368 3A          DEC A                   ;
$01/E369 D0 0C       BNE $0C    [$E377]      ;
$01/E36B 22 39 BE 00 JSL $00BE39[$00:BE39]   ;

DATA_01E36F:         dw $5946, $787E, $703C, $00D2

$01/E377 60          RTS

$01/E378 20 AF E3    JSR $E3AF  [$00:E3AF]   ;
$01/E37B C2 20       REP #$20                ;
$01/E37D AD 25 0D    LDA $0D25  [$00:0D25]   ;
$01/E380 38          SEC                     ;
$01/E381 ED 23 0D    SBC $0D23  [$00:0D23]   ;
$01/E384 C9 08 00    CMP #$0008              ;
$01/E387 B0 1B       BCS $1B    [$E3A4]      ;
$01/E389 EE 4E 0B    INC $0B4E  [$00:0B4E]   ;
$01/E38C EE 4E 0B    INC $0B4E  [$00:0B4E]   ;
$01/E38F EE 57 0B    INC $0B57  [$00:0B57]   ;
$01/E392 EE 57 0B    INC $0B57  [$00:0B57]   ;
$01/E395 22 B8 94 03 JSL $0394B8[$03:94B8]   ;
$01/E399 22 59 82 00 JSL $008259[$00:8259]   ;
$01/E39D E2 20       SEP #$20                ;
$01/E39F A9 20       LDA #$20                ;
$01/E3A1 8D 4A 09    STA $094A  [$00:094A]   ;
$01/E3A4 E2 20       SEP #$20                ;
$01/E3A6 60          RTS                     ;

DATA_01E3A7:         dw $0008, $FFF8

DATA_01E3AB:         dw $0002, $FFFE

$01/E3AF C2 30       REP #$30                ;
$01/E3B1 AD 4E 0B    LDA $0B4E  [$01:0B4E]   ;
$01/E3B4 29 02 00    AND #$0002              ;
$01/E3B7 A8          TAY                     ;
$01/E3B8 A2 00 00    LDX #$0000              ;
$01/E3BB A9 FF 00    LDA #$00FF              ;
$01/E3BE EC 23 0D    CPX $0D23  [$01:0D23]   ;
$01/E3C1 B0 0A       BCS $0A    [$E3CD]      ;
$01/E3C3 9F 02 3A 70 STA $703A02,x[$70:39FD] ;
$01/E3C7 E8          INX                     ;
$01/E3C8 E8          INX                     ;
$01/E3C9 E8          INX                     ;
$01/E3CA E8          INX                     ;
$01/E3CB 80 F1       BRA $F1    [$E3BE]      ;

$01/E3CD AD 21 0D    LDA $0D21  [$00:0D21]   ;
$01/E3D0 EC 25 0D    CPX $0D25  [$00:0D25]   ;
$01/E3D3 B0 0A       BCS $0A    [$E3DF]      ;
$01/E3D5 9F 02 3A 70 STA $703A02,x[$70:3A02] ;
$01/E3D9 E8          INX                     ;
$01/E3DA E8          INX                     ;
$01/E3DB E8          INX                     ;
$01/E3DC E8          INX                     ;
$01/E3DD 80 F1       BRA $F1    [$E3D0]      ;

$01/E3DF A9 FF 00    LDA #$00FF              ;
$01/E3E2 E0 48 03    CPX #$0348              ;
$01/E3E5 B0 0A       BCS $0A    [$E3F1]      ;
$01/E3E7 9F 02 3A 70 STA $703A02,x[$70:39FD] ;
$01/E3EB E8          INX                     ;
$01/E3EC E8          INX                     ;
$01/E3ED E8          INX                     ;
$01/E3EE E8          INX                     ;
$01/E3EF 80 F1       BRA $F1    [$E3E2]      ;

$01/E3F1 A9 00 FF    LDA #$FF00              ;
$01/E3F4 E0 48 03    CPX #$0348              ;
$01/E3F7 B0 0A       BCS $0A    [$E403]      ;
$01/E3F9 9F 02 3A 70 STA $703A02,x[$70:39FD] ;
$01/E3FD E8          INX                     ;
$01/E3FE E8          INX                     ;
$01/E3FF E8          INX                     ;
$01/E400 E8          INX                     ;
$01/E401 80 F1       BRA $F1    [$E3F4]      ;

$01/E403 AD 23 0D    LDA $0D23  [$00:0D23]   ;
$01/E406 18          CLC                     ;
$01/E407 79 A7 E3    ADC $E3A7,y[$00:E3A7]   ;
$01/E40A 8D 23 0D    STA $0D23  [$00:0D23]   ;
$01/E40D AD 25 0D    LDA $0D25  [$00:0D25]   ;
$01/E410 38          SEC                     ;
$01/E411 F9 A7 E3    SBC $E3A7,y[$00:E3A7]   ;
$01/E414 8D 25 0D    STA $0D25  [$00:0D25]   ;
$01/E417 E2 30       SEP #$30                ;
$01/E419 AD 21 0D    LDA $0D21  [$00:0D21]   ;
$01/E41C 18          CLC                     ;
$01/E41D 79 AB E3    ADC $E3AB,y[$00:E3AB]   ;
$01/E420 8D 21 0D    STA $0D21  [$00:0D21]   ;
$01/E423 AD 22 0D    LDA $0D22  [$00:0D22]   ;
$01/E426 38          SEC                     ;
$01/E427 F9 AB E3    SBC $E3AB,y[$00:E3AB]   ;
$01/E42A 8D 22 0D    STA $0D22  [$00:0D22]   ;
$01/E42D 22 39 BE 00 JSL $00BE39[$00:BE39]   ;

DATA_01E431:         dw $56D0, $027E, $703A, $0348

$01/E439 AD 4A 09    LDA $094A  [$01:094A]   ;
$01/E43C 09 20       ORA #$20                ;
$01/E43E 8D 4A 09    STA $094A  [$01:094A]   ;
$01/E441 60          RTS                     ;

$01/E442 C2 30       REP #$30                ;
$01/E444 A2 00 00    LDX #$0000              ;
$01/E447 A9 FF 00    LDA #$00FF              ;
$01/E44A 9F 02 3A 70 STA $703A02,x[$70:39FD] ;
$01/E44E E8          INX                     ;
$01/E44F E8          INX                     ;
$01/E450 E8          INX                     ;
$01/E451 E8          INX                     ;
$01/E452 E0 48 03    CPX #$0348              ;
$01/E455 90 F3       BCC $F3    [$E44A]      ;
$01/E457 E2 30       SEP #$30                ;
$01/E459 22 39 BE 00 JSL $00BE39[$00:BE39]   ;

DATA_01E45D:         dw $56D0, $027E, $703A, $0348

$01/E465 A9 09       LDA #$09                ;
$01/E467 8D 5E 09    STA $095E  [$01:095E]   ;
$01/E46A A9 69       LDA #$69                ;
$01/E46C 8D 5F 09    STA $095F  [$01:095F]   ;
$01/E46F A9 34       LDA #$34                ;
$01/E471 8D 61 09    STA $0961  [$01:0961]   ;
$01/E474 A9 02       LDA #$02                ;
$01/E476 8D 1C 01    STA $011C  [$01:011C]   ;
$01/E479 A9 20       LDA #$20                ;
$01/E47B 8D 6C 09    STA $096C  [$01:096C]   ;
$01/E47E C2 20       REP #$20                ;
$01/E480 9C 2D 0D    STZ $0D2D  [$01:0D2D]   ;
$01/E483 9C 2B 0D    STZ $0D2B  [$01:0D2B]   ;
$01/E486 9C CA 61    STZ $61CA  [$01:61CA]   ;
$01/E489 A9 77 02    LDA #$0277              ;
$01/E48C 8D 62 09    STA $0962  [$01:0962]   ;
$01/E48F 64 39       STZ $39    [$00:0039]   ;
$01/E491 64 3B       STZ $3B    [$00:003B]   ;
$01/E493 64 41       STZ $41    [$00:0041]   ;
$01/E495 64 43       STZ $43    [$00:0043]   ;
$01/E497 E2 20       SEP #$20                ;
$01/E499 EE 57 0B    INC $0B57  [$01:0B57]   ;
$01/E49C EE 57 0B    INC $0B57  [$01:0B57]   ;
$01/E49F 60          RTS                     ;

$01/E4A0 20 AF E3    JSR $E3AF  [$00:E3AF]   ;
$01/E4A3 C2 20       REP #$20                ;
$01/E4A5 AD 23 0D    LDA $0D23  [$00:0D23]   ;
$01/E4A8 10 27       BPL $27    [$E4D1]      ;
$01/E4AA EE 57 0B    INC $0B57  [$00:0B57]   ;
$01/E4AD EE 57 0B    INC $0B57  [$00:0B57]   ;
$01/E4B0 9C 92 03    STZ $0392  [$00:0392]   ;
$01/E4B3 9C 5F 0B    STZ $0B5F  [$00:0B5F]   ;
$01/E4B6 9C 61 0B    STZ $0B61  [$00:0B61]   ;
$01/E4B9 9C 63 0B    STZ $0B63  [$00:0B63]   ;
$01/E4BC 9C 81 03    STZ $0381  [$00:0381]   ;
$01/E4BF 9C 69 09    STZ $0969  [$00:0969]   ;
$01/E4C2 9C 64 09    STZ $0964  [$00:0964]   ;
$01/E4C5 9C 65 09    STZ $0965  [$00:0965]   ;
$01/E4C8 E2 20       SEP #$20                ;
$01/E4CA A9 30       LDA #$30                ;
$01/E4CC 8D 8B 03    STA $038B  [$00:038B]   ;
$01/E4CF C2 20       REP #$20                ;
$01/E4D1 E2 20       SEP #$20                ;
$01/E4D3 A9 20       LDA #$20                ;
$01/E4D5 8D 4A 09    STA $094A  [$00:094A]   ;
$01/E4D8 60          RTS                     ;

DATA_01E4D9:         dw $03C0, $0440, $04C0, $0540

DATA_01E4E1:         dw $8000, $4000, $2000, $1000
DATA_01E4E9:         dw $0800, $0400, $0200, $0100
DATA_01E4F1:         dw $0080, $0040, $0020, $0010
DATA_01E4F9:         dw $0008, $0004, $0002, $0001

$01/E501 DA          PHX                     ;
$01/E502 8A          TXA                     ;
$01/E503 29 1E 00    AND #$001E              ;
$01/E506 AA          TAX                     ;
$01/E507 BF E1 E4 01 LDA $01E4E1,x[$01:E4DC] ;
$01/E50B 85 02       STA $02    [$00:0002]   ;
$01/E50D AD 50 01    LDA $0150  [$01:0150]   ;
$01/E510 0A          ASL A                   ;
$01/E511 AA          TAX                     ;
$01/E512 BF D9 E4 01 LDA $01E4D9,x[$01:E4D4] ;
$01/E516 85 00       STA $00    [$00:0000]   ;
$01/E518 FA          PLX                     ;
$01/E519 A5 1B       LDA $1B    [$00:001B]   ;
$01/E51B EB          XBA                     ;
$01/E51C 29 FF 00    AND #$00FF              ;
$01/E51F A8          TAY                     ;
$01/E520 B9 AA 6C    LDA $6CAA,y[$01:7EEC]   ;
$01/E523 29 3F 00    AND #$003F              ;
$01/E526 0A          ASL A                   ;
$01/E527 A8          TAY                     ;
$01/E528 B1 00       LDA ($00),y[$01:FEC7]   ;
$01/E52A 25 02       AND $02    [$00:0002]   ;
$01/E52C 6B          RTL                     ;

.gamemode33
$01/E52D 22 77 82 00 JSL $008277[$00:8277]   ;
$01/E531 22 1C 83 00 JSL $00831C[$00:831C]   ;
$01/E535 A9 2E       LDA #$2E                ;
$01/E537 8F 70 40 70 STA $704070[$70:4070]   ;
$01/E53B 20 9A E5    JSR $E59A  [$00:E59A]   ;
$01/E53E 5C E2 83 10 JMP $1083E2[$10:83E2]   ;

DATA_01E542:         dw $3400, $47FF, $2A6E, $3485
DATA_01E54A:         dw $000F, $2A00, $2A02, $2A04
DATA_01E552:         dw $2A06, $2A08, $2A0A, $2A0C
DATA_01E55A:         dw $2A0E, $34A5, $000F, $2A20
DATA_01E562:         dw $2A22, $2A24, $2A26, $2A28
DATA_01E56A:         dw $2A2A, $2A2C, $2A2E, $34C5
DATA_01E572:         dw $000F, $2A40, $2A42, $2A44
DATA_01E57A:         dw $2A46, $2A48, $2A4A, $2A4C
DATA_01E582:         dw $2A4E, $34E5, $000F, $2A60
DATA_01E58A:         dw $2A62, $2A64, $2A66, $2A68
DATA_01E592:         dw $2A6A, $2A6C, $2A6E, $FFFF

$01/E59A 22 B8 94 03 JSL $0394B8[$03:94B8]   ;
$01/E59E 22 59 82 00 JSL $008259[$00:8259]   ; init OAM buffer
$01/E5A2 AE 80 AF    LDX $AF80  [$00:AF80]   ;
$01/E5A5 22 A2 BD 00 JSL $00BDA2[$00:BDA2]   ;
$01/E5A9 A2 70       LDX #$70                ;
$01/E5AB DA          PHX                     ;
$01/E5AC AB          PLB                     ;
$01/E5AD C2 20       REP #$20                ;
$01/E5AF A2 7E       LDX #$7E                ;
$01/E5B1 9E 00 20    STZ $2000,x[$00:2000]   ;
$01/E5B4 9E 80 20    STZ $2080,x[$00:2080]   ;
$01/E5B7 9E 00 21    STZ $2100,x[$00:2100]   ;
$01/E5BA 9E 80 21    STZ $2180,x[$00:2180]   ;
$01/E5BD CA          DEX                     ;
$01/E5BE CA          DEX                     ;
$01/E5BF 10 F0       BPL $F0    [$E5B1]      ;
$01/E5C1 A9 FF 7F    LDA #$7FFF              ;
$01/E5C4 8D 16 20    STA $2016  [$00:2016]   ;
$01/E5C7 E2 20       SEP #$20                ;
$01/E5C9 4B          PHK                     ;
$01/E5CA AB          PLB                     ;
$01/E5CB A9 1E       LDA #$1E                ;
$01/E5CD 8D 27 01    STA $0127  [$00:0127]   ;
$01/E5D0 22 7B E3 00 JSL $00E37B[$00:E37B]   ;
$01/E5D4 20 89 E6    JSR $E689  [$00:E689]   ;
$01/E5D7 A9 02       LDA #$02                ;
$01/E5D9 8D 25 01    STA $0125  [$00:0125]   ;
$01/E5DC A9 50       LDA #$50                ;
$01/E5DE 8D 07 42    STA $4207  [$00:4207]   ;
$01/E5E1 A9 D8       LDA #$D8                ;
$01/E5E3 A9 B1       LDA #$B1                ;
$01/E5E5 8D 00 42    STA $4200  [$00:4200]   ;
$01/E5E8 60          RTS                     ;

.gamemode35
$01/E5E9 A9 2E       LDA #$2E                ;
$01/E5EB 8F 70 40 70 STA $704070[$70:4070]   ;
$01/E5EF 20 89 E6    JSR $E689  [$00:E689]   ;
$01/E5F2 AD 37 00    LDA $0037  [$00:0037]   ;
$01/E5F5 29 80       AND #$80                ;
$01/E5F7 0D 38 00    ORA $0038  [$00:0038]   ;
$01/E5FA 29 90       AND #$90                ;
$01/E5FC D0 03       BNE $03    [$E601]      ;
$01/E5FE 4C 87 E6    JMP $E687  [$00:E687]   ;

$01/E601 AD 37 00    LDA $0037  [$00:0037]   ;
$01/E604 29 80       AND #$80                ;
$01/E606 D0 0A       BNE $0A    [$E612]      ;
$01/E608 AF 94 40 70 LDA $704094[$70:4094]   ;
$01/E60C AA          TAX                     ;
$01/E60D BD B7 E6    LDA $E6B7,x[$00:E6B7]   ;
$01/E610 85 53       STA $53    [$00:0053]   ;
$01/E612 A9 10       LDA #$10                ;
$01/E614 85 8F       STA $8F    [$00:008F]   ;
$01/E616 EE 18 01    INC $0118  [$00:0118]   ;
$01/E619 9C 8C 03    STZ $038C  [$00:038C]   ;
$01/E61C 8A          TXA                     ;
$01/E61D D0 68       BNE $68    [$E687]      ;
$01/E61F A9 01       LDA #$01                ;
$01/E621 8D 8C 03    STA $038C  [$00:038C]   ;
$01/E624 20 92 B2    JSR $B292  [$00:B292]   ;
$01/E627 C2 20       REP #$20                ;
$01/E629 9C 06 7E    STZ $7E06  [$00:7E06]   ;
$01/E62C 9C A1 03    STZ $03A1  [$00:03A1]   ;
$01/E62F 9C A3 03    STZ $03A3  [$00:03A3]   ;
$01/E632 9C A5 03    STZ $03A5  [$00:03A5]   ;
$01/E635 AD B6 03    LDA $03B6  [$00:03B6]   ;
$01/E638 C9 64 00    CMP #$0064              ;
$01/E63B 90 08       BCC $08    [$E645]      ;
$01/E63D E9 64 00    SBC #$0064              ;
$01/E640 EE A1 03    INC $03A1  [$00:03A1]   ;
$01/E643 80 F3       BRA $F3    [$E638]      ;

$01/E645 C9 0A 00    CMP #$000A              ;
$01/E648 90 08       BCC $08    [$E652]      ;
$01/E64A E9 0A 00    SBC #$000A              ;
$01/E64D EE A3 03    INC $03A3  [$00:03A3]   ;
$01/E650 80 F3       BRA $F3    [$E645]      ;

$01/E652 8D A5 03    STA $03A5  [$00:03A5]   ;
$01/E655 8B          PHB                     ;
$01/E656 A0 17       LDY #$17                ;
$01/E658 5A          PHY                     ;
$01/E659 AB          PLB                     ;
$01/E65A C2 30       REP #$30                ;
$01/E65C 9C 8E 03    STZ $038E  [$00:038E]   ;
$01/E65F AD 1A 02    LDA $021A  [$00:021A]   ;
$01/E662 0A          ASL A                   ;
$01/E663 A8          TAY                     ;
$01/E664 AD BE 03    LDA $03BE  [$00:03BE]   ;
$01/E667 0A          ASL A                   ;
$01/E668 0A          ASL A                   ;
$01/E669 79 51 F5    ADC $F551,y[$00:F551]   ;
$01/E66C A8          TAY                     ;
$01/E66D B9 DC F5    LDA $F5DC,y[$00:F5DC]   ;
$01/E670 8F 01 7E 7F STA $7F7E01[$7F:7E01]   ;
$01/E674 E2 20       SEP #$20                ;
$01/E676 B9 DB F5    LDA $F5DB,y[$00:F5DB]   ;
$01/E679 8F 00 7E 7F STA $7F7E00[$7F:7E00]   ;
$01/E67D B9 DE F5    LDA $F5DE,y[$00:F5DE]   ;
$01/E680 8F 03 7E 7F STA $7F7E03[$7F:7E03]   ;
$01/E684 E2 10       SEP #$10                ;
$01/E686 AB          PLB                     ;
$01/E687 AB          PLB                     ;
$01/E688 6B          RTL                     ;

$01/E689 20 80 E1    JSR $E180  [$00:E180]   ;
$01/E68C AF 94 40 70 LDA $704094[$70:4094]   ;
$01/E690 AA          TAX                     ;
$01/E691 C2 30       REP #$30                ;
$01/E693 A9 00 00    LDA #$0000              ;
$01/E696 8F 00 40 7E STA $7E4000[$7E:4000]   ;
$01/E69A 3A          DEC A                   ;
$01/E69B 8F 02 40 7E STA $7E4002[$7E:4002]   ;
$01/E69F E2 30       SEP #$30                ;
$01/E6A1 60          RTS                     ;

.gamemode3B
$01/E6A2 22 77 82 00 JSL $008277[$00:8277]   ;
$01/E6A6 22 1C 83 00 JSL $00831C[$00:831C]   ;
$01/E6AA A9 21       LDA #$21                ;
$01/E6AC 8F 70 40 70 STA $704070[$70:4070]   ;
$01/E6B0 20 9A E5    JSR $E59A  [$00:E59A]   ;
$01/E6B3 5C E2 83 10 JMP $1083E2[$10:83E2]   ;

DATA_01E6B7:         db $43, $2E

.gamemode3D
$01/E6B9 A9 21       LDA #$21                ;
$01/E6BB 8F 70 40 70 STA $704070[$70:4070]   ;
$01/E6BF 20 89 E6    JSR $E689  [$00:E689]   ;
$01/E6C2 AD 37 00    LDA $0037  [$00:0037]   ;
$01/E6C5 29 80       AND #$80                ;
$01/E6C7 0D 38 00    ORA $0038  [$00:0038]   ;
$01/E6CA 29 90       AND #$90                ;
$01/E6CC F0 1E       BEQ $1E    [$E6EC]      ;
$01/E6CE AD 37 00    LDA $0037  [$00:0037]   ;
$01/E6D1 29 80       AND #$80                ;
$01/E6D3 D0 0A       BNE $0A    [$E6DF]      ;
$01/E6D5 AF 94 40 70 LDA $704094[$70:4094]   ;
$01/E6D9 AA          TAX                     ;
$01/E6DA BD B7 E6    LDA $E6B7,x[$00:E6B7]   ;
$01/E6DD 85 53       STA $53    [$00:0053]   ;
$01/E6DF EE 18 01    INC $0118  [$00:0118]   ;
$01/E6E2 A9 10       LDA #$10                ;
$01/E6E4 85 8F       STA $8F    [$00:008F]   ;
$01/E6E6 8A          TXA                     ;
$01/E6E7 D0 03       BNE $03    [$E6EC]      ;
$01/E6E9 9C 8C 03    STZ $038C  [$00:038C]   ;
$01/E6EC AB          PLB                     ;
$01/E6ED 6B          RTL                     ;

DATA_01E6EE:         db $0B, $1F

.gamemode36
$01/E6F0 C6 8F       DEC $8F    [$00:008F]   ;
$01/E6F2 D0 1B       BNE $1B    [$E70F]      ;
$01/E6F4 AF 94 40 70 LDA $704094[$70:4094]   ;
$01/E6F8 AA          TAX                     ;
$01/E6F9 BD EE E6    LDA $E6EE,x[$01:E6E9]   ;
$01/E6FC 8D 18 01    STA $0118  [$01:0118]   ;
$01/E6FF CA          DEX                     ;
$01/E700 30 0A       BMI $0A    [$E70C]      ;
$01/E702 AD 1A 02    LDA $021A  [$01:021A]   ;
$01/E705 C9 0B       CMP #$0B                ;
$01/E707 D0 03       BNE $03    [$E70C]      ;
$01/E709 9C 1A 02    STZ $021A  [$01:021A]   ;
$01/E70C 9C 03 02    STZ $0203  [$01:0203]   ;
$01/E70F AB          PLB                     ;
$01/E710 6B          RTL                     ;

DATA_01E711:         dw $0000, $0002, $0004, $0006
DATA_01E719:         dw $0008, $000A, $003D, $003F
DATA_01E721:         dw $0041, $0043, $0045, $0047
DATA_01E729:         dw $0049, $004B, $004D, $004F
DATA_01E731:         dw $0087, $0089, $008B, $008D
DATA_01E739:         dw $0099, $009B, $009D, $009F
DATA_01E741:         dw $009F, $00A1, $00A3, $00A5
DATA_01E749:         dw $00A7, $00AB, $00AD, $00AF

DATA_01E751:         db $00, $BE, $00, $BF, $00, $C0, $00, $C1
DATA_01E759:         db $00, $C2, $04, $C3, $01, $00, $61, $E7
DATA_01E761:         db $00, $B0, $00, $F7, $02, $00, $A0, $00
DATA_01E769:         db $07, $03, $00, $90, $00, $17, $03, $00
DATA_01E771:         db $80, $00, $27, $03, $00, $70, $00, $37
DATA_01E779:         db $03, $00, $60, $00, $47, $03, $00, $50
DATA_01E781:         db $00, $57, $03, $00, $40, $00, $67, $03
DATA_01E789:         db $00, $C0, $00, $00, $08, $00, $C4, $00
DATA_01E791:         db $C5, $00, $C6, $00, $CD, $00, $C7, $00
DATA_01E799:         db $C8, $00, $C9, $00, $CA, $00, $CB, $04
DATA_01E7A1:         db $CC, $01, $00, $A6, $E7, $00, $28, $00
DATA_01E7A9:         db $97, $01, $00, $16, $00, $B7, $01, $00
DATA_01E7B1:         db $28, $00, $D7, $01, $00, $16, $00, $F7
DATA_01E7B9:         db $01, $00, $28, $00, $17, $02, $00, $16
DATA_01E7C1:         db $00, $37, $02, $00, $28, $00, $57, $02
DATA_01E7C9:         db $00, $28, $00, $77, $02, $00, $40, $00
DATA_01E7D1:         db $B7, $02, $00, $80, $00, $00, $04, $00
DATA_01E7D9:         db $CD, $00, $CC, $00, $CE, $00, $CF, $01
DATA_01E7E1:         db $02, $C7, $02, $04, $57, $03, $02, $00
DATA_01E7E9:         db $04, $00, $D0, $00, $D1, $00, $D7, $00
DATA_01E7F1:         db $D2, $00, $D3, $00, $D4, $00, $D5, $04
DATA_01E7F9:         db $D6, $00, $00, $00, $D9, $00, $DA, $00
DATA_01E801:         db $DB, $00, $76, $00, $6E, $00, $66, $00
DATA_01E809:         db $5E

$01/E80A AD 46 01    LDA $0146  [$00:0146]   ;
$01/E80D C9 0A       CMP #$0A                ;
$01/E80F D0 03       BNE $03    [$E814]      ;
$01/E811 4C 8F E8    JMP $E88F  [$00:E88F]   ;

$01/E814 9C 2B 0D    STZ $0D2B  [$00:0D2B]   ;
$01/E817 9C 2D 0D    STZ $0D2D  [$00:0D2D]   ;
$01/E81A 9C 37 0D    STZ $0D37  [$00:0D37]   ;
$01/E81D 9C 39 0D    STZ $0D39  [$00:0D39]   ;
$01/E820 C2 30       REP #$30                ;
$01/E822 AD 3A 01    LDA $013A  [$00:013A]   ;
$01/E825 0A          ASL A                   ;
$01/E826 AA          TAX                     ;
$01/E827 BC 11 E7    LDY $E711,x[$00:E711]   ;
$01/E82A B9 51 E7    LDA $E751,y[$00:E751]   ;
$01/E82D 29 FF 00    AND #$00FF              ;
$01/E830 AA          TAX                     ;
$01/E831 7C 34 E8    JMP ($E834,x)[$00:00B1] ;

DATA_01E834:         dw $E84F
DATA_01E836:         dw $0000
DATA_01E838:         dw $E83A

$01/E83A E2 20       SEP #$20                ;
$01/E83C A9 0F       LDA #$0F                ;
$01/E83E 8D 41 43    STA $4341  [$00:4341]   ;
$01/E841 B9 53 E7    LDA $E753,y[$00:E753]   ;
$01/E844 8D 2B 0D    STA $0D2B  [$00:0D2B]   ;
$01/E847 C2 20       REP #$20                ;
$01/E849 B9 55 E7    LDA $E755,y[$00:E755]   ;
$01/E84C 8D 2F 0D    STA $0D2F  [$00:0D2F]   ;

$01/E84F B9 52 E7    LDA $E752,y[$00:E752]   ;
$01/E852 29 FF 00    AND #$00FF              ;
$01/E855 A2 00 58    LDX #$5800              ;
$01/E858 22 56 B7 00 JSL $00B756[$00:B756]   ;
$01/E85C 8D 05 43    STA $4305  [$00:4305]   ;
$01/E85F E2 10       SEP #$10                ;
$01/E861 A2 80       LDX #$80                ;
$01/E863 8E 15 21    STX $2115  [$00:2115]   ;
$01/E866 A9 00 38    LDA #$3800              ;
$01/E869 8D 16 21    STA $2116  [$00:2116]   ;
$01/E86C A9 01 18    LDA #$1801              ;
$01/E86F 8D 00 43    STA $4300  [$00:4300]   ;
$01/E872 A9 00 58    LDA #$5800              ;
$01/E875 8D 02 43    STA $4302  [$00:4302]   ;
$01/E878 A2 70       LDX #$70                ;
$01/E87A 8E 04 43    STX $4304  [$00:4304]   ;
$01/E87D A2 01       LDX #$01                ;
$01/E87F 8E 0B 42    STX $420B  [$00:420B]   ;
$01/E882 E2 20       SEP #$20                ;
$01/E884 AD 46 01    LDA $0146  [$00:0146]   ;
$01/E887 C9 03       CMP #$03                ;
$01/E889 D0 03       BNE $03    [$E88E]      ;
$01/E88B 20 D1 E8    JSR $E8D1  [$00:E8D1]   ;
$01/E88E 60          RTS                     ;

$01/E88F C2 30       REP #$30                ;
$01/E891 A9 F2 00    LDA #$00F2              ;
$01/E894 29 FF 00    AND #$00FF              ;
$01/E897 A2 00 58    LDX #$5800              ;
$01/E89A 22 56 B7 00 JSL $00B756[$00:B756]   ;
$01/E89E 8D 05 43    STA $4305  [$00:4305]   ;
$01/E8A1 E2 10       SEP #$10                ;
$01/E8A3 A2 80       LDX #$80                ;
$01/E8A5 8E 15 21    STX $2115  [$00:2115]   ;
$01/E8A8 A9 00 38    LDA #$3800              ;
$01/E8AB 8D 16 21    STA $2116  [$00:2116]   ;
$01/E8AE A9 01 18    LDA #$1801              ;
$01/E8B1 8D 00 43    STA $4300  [$00:4300]   ;
$01/E8B4 A9 00 58    LDA #$5800              ;
$01/E8B7 8D 02 43    STA $4302  [$00:4302]   ;
$01/E8BA A2 70       LDX #$70                ;
$01/E8BC 8E 04 43    STX $4304  [$00:4304]   ;
$01/E8BF A2 01       LDX #$01                ;
$01/E8C1 8E 0B 42    STX $420B  [$00:420B]   ;
$01/E8C4 E2 20       SEP #$20                ;
$01/E8C6 60          RTS                     ;

DATA_01E8C7:         dw $8000, $0000, $0208, $0001
DATA_01E8CF:         dw $FF08

$01/E8D1 A9 0F       LDA #$0F                ;
$01/E8D3 8D 41 43    STA $4341  [$01:4341]   ;
$01/E8D6 A9 10       LDA #$10                ;
$01/E8D8 8D 31 43    STA $4331  [$00:4331]   ;
$01/E8DB 9C 2B 0D    STZ $0D2B  [$00:0D2B]   ;
$01/E8DE 9C 2D 0D    STZ $0D2D  [$00:0D2D]   ;
$01/E8E1 C2 20       REP #$20                ;
$01/E8E3 A9 C7 E8    LDA #$E8C7              ;
$01/E8E6 8D 2F 0D    STA $0D2F  [$00:0D2F]   ;
$01/E8E9 A9 CD E8    LDA #$E8CD              ;
$01/E8EC 8D 31 0D    STA $0D31  [$00:0D31]   ;
$01/E8EF E2 20       SEP #$20                ;
$01/E8F1 60          RTS                     ;

DATA_01E8F2:         dw $3400, $47FF, $01CE, $FFFF
DATA_01E8FA:         dw $3400, $47FF, $0111, $FFFF
DATA_01E902:         dw $3400, $47FF, $01CE, $FFFF

DATA_01E90A:         dw $00DC, $DD01, $FF00, $00E5
DATA_01E912:         dw $E500, $0000, $00DE, $DFFF
DATA_01E91A:         dw $FF00, $00E0, $E4FF, $FF00
DATA_01E922:         dw $0000, $0000, $0000, $00E1
DATA_01E92A:         dw $E6FF, $0000, $00E7, $E800
DATA_01E932:         dw $1B00, $00E9, $EA26, $0000
DATA_01E93A:         dw $00EB, $ECFF, $0000, $00ED
DATA_01E942:         dw $EE80, $3100, $00EF, $F000
DATA_01E94A:         dw $0000, $00F1, $F200, $0000
DATA_01E952:         dw $00F3, $F400, $0000, $00F5
DATA_01E95A:         dw $F600, $0000, $00ED, $F73C
DATA_01E962:         dw $8100, $00F8, $F900, $8200
DATA_01E96A:         dw $00FB, $FC00, $8300, $00FD
DATA_01E972:         dw $FE84, $8500, $00FF, $0000
DATA_01E97A:         dw $0001, $0101, $0200, $0001
DATA_01E982:         dw $0103, $0400, $8601, $0105
DATA_01E98A:         dw $0600, $8701, $0106, $0700
DATA_01E992:         dw $0001, $0108, $0000, $0000
DATA_01E99A:         dw $0000, $0000, $0000, $0000
DATA_01E9A2:         dw $0000, $0000, $0000, $0000
DATA_01E9AA:         dw $0000, $0000, $0200, $0010
DATA_01E9B2:         dw $1004, $0400, $0010, $1004
DATA_01E9BA:         dw $0400, $0010, $1004, $0400
DATA_01E9C2:         dw $0010, $1204, $0010, $0600
DATA_01E9CA:         dw $008A, $0A04, $0400, $0A16
DATA_01E9D2:         dw $0006, $8A06, $0400, $0009
DATA_01E9DA:         dw $1704, $0609, $0600, $0090
DATA_01E9E2:         dw $0604, $040D, $130C, $0006
DATA_01E9EA:         dw $F506, $0400, $0181, $8904
DATA_01E9F2:         dw $0402, $A000, $AD09, $013E
DATA_01E9FA:         dw $3DF0, $6D0A, $013E

$01/EA00 A8          TAY                     ;
$01/EA01 C2 20       REP #$20                ;
$01/EA03 B9 07 E9    LDA $E907,y[$00:E907]   ;
$01/EA06 F0 38       BEQ $38    [$EA40]      ;
$01/EA08 C2 10       REP #$10                ;
$01/EA0A A2 00 58    LDX #$5800              ;
$01/EA0D 5A          PHY                     ;
$01/EA0E 22 56 B7 00 JSL $00B756[$00:B756]   ;
$01/EA12 7A          PLY                     ;
$01/EA13 AE 3E 01    LDX $013E  [$00:013E]   ;
$01/EA16 E0 16 00    CPX #$0016              ;
$01/EA19 D0 28       BNE $28    [$EA43]      ;
$01/EA1B A2 A6 5D    LDX #$5DA6              ;
$01/EA1E 86 20       STX $20    [$00:0020]   ;
$01/EA20 A2 7E 00    LDX #$007E              ;
$01/EA23 86 22       STX $22    [$00:0022]   ;
$01/EA25 A2 00 58    LDX #$5800              ;
$01/EA28 86 23       STX $23    [$00:0023]   ;
$01/EA2A A2 70 00    LDX #$0070              ;
$01/EA2D 86 25       STX $25    [$00:0025]   ;
$01/EA2F E2 10       SEP #$10                ;
$01/EA31 22 88 82 00 JSL $008288[$00:8288]   ;
$01/EA35 E2 20       SEP #$20                ;
$01/EA37 A0 1B       LDY #$1B                ;
$01/EA39 8C 27 01    STY $0127  [$00:0127]   ;
$01/EA3C 22 7B E3 00 JSL $00E37B[$00:E37B]   ;
$01/EA40 E2 20       SEP #$20                ;
$01/EA42 60          RTS                     ;

$01/EA43 E2 10       SEP #$10                ;
$01/EA45 8D 05 43    STA $4305  [$01:4305]   ;
$01/EA48 85 00       STA $00    [$00:0000]   ;
$01/EA4A A2 80       LDX #$80                ;
$01/EA4C 8E 15 21    STX $2115  [$01:2115]   ;
$01/EA4F A9 00 34    LDA #$3400              ;
$01/EA52 8D 16 21    STA $2116  [$01:2116]   ;
$01/EA55 A9 01 18    LDA #$1801              ;
$01/EA58 8D 00 43    STA $4300  [$01:4300]   ;
$01/EA5B A9 00 58    LDA #$5800              ;
$01/EA5E 8D 02 43    STA $4302  [$01:4302]   ;
$01/EA61 A2 70       LDX #$70                ;
$01/EA63 8E 04 43    STX $4304  [$01:4304]   ;
$01/EA66 A2 01       LDX #$01                ;
$01/EA68 8E 0B 42    STX $420B  [$01:420B]   ;
$01/EA6B AD 46 01    LDA $0146  [$01:0146]   ;
$01/EA6E C9 0A 00    CMP #$000A              ;
$01/EA71 D0 14       BNE $14    [$EA87]      ;
$01/EA73 A5 00       LDA $00    [$00:0000]   ;
$01/EA75 8D 05 43    STA $4305  [$01:4305]   ;
$01/EA78 A9 00 00    LDA #$0000              ;
$01/EA7B 8D 16 21    STA $2116  [$01:2116]   ;
$01/EA7E A9 00 58    LDA #$5800              ;
$01/EA81 8D 02 43    STA $4302  [$01:4302]   ;
$01/EA84 8E 0B 42    STX $420B  [$01:420B]   ;
$01/EA87 E2 20       SEP #$20                ;
$01/EA89 BE 09 E9    LDX $E909,y[$01:FB4B]   ;
$01/EA8C F0 B2       BEQ $B2    [$EA40]      ;
$01/EA8E E0 FF       CPX #$FF                ;
$01/EA90 F0 0E       BEQ $0E    [$EAA0]      ;
$01/EA92 8A          TXA                     ;
$01/EA93 10 14       BPL $14    [$EAA9]      ;
$01/EA95 0A          ASL A                   ;
$01/EA96 C9 10       CMP #$10                ;
$01/EA98 B0 06       BCS $06    [$EAA0]      ;
$01/EA9A AA          TAX                     ;
$01/EA9B FC 29 EB    JSR ($EB29,x)[$00:00D5] ;

$01/EA9E 80 A0       BRA $A0    [$EA40]      ;

$01/EAA0 A9 04       LDA #$04                ;
$01/EAA2 1C 67 09    TRB $0967  [$01:0967]   ;
$01/EAA5 1C 68 09    TRB $0968  [$01:0968]   ;
$01/EAA8 60          RTS                     ;

$01/EAA9 BF AE E9 01 LDA $01E9AE,x[$01:E9AE] ;
$01/EAAD 8D 3B 0D    STA $0D3B  [$00:0D3B]   ;
$01/EAB0 8B          PHB                     ;
$01/EAB1 A9 70       LDA #$70                ;
$01/EAB3 48          PHA                     ;
$01/EAB4 AB          PLB                     ;
$01/EAB5 C2 10       REP #$10                ;
$01/EAB7 A0 00 00    LDY #$0000              ;
$01/EABA 64 08       STZ $08    [$00:0008]   ;
$01/EABC BF AF E9 01 LDA $01E9AF,x[$01:E9AF] ;
$01/EAC0 F0 63       BEQ $63    [$EB25]      ;
$01/EAC2 85 01       STA $01    [$00:0001]   ;
$01/EAC4 C2 20       REP #$20                ;
$01/EAC6 29 7F 00    AND #$007F              ;
$01/EAC9 0A          ASL A                   ;
$01/EACA 0A          ASL A                   ;
$01/EACB 0A          ASL A                   ;
$01/EACC 0A          ASL A                   ;
$01/EACD 85 02       STA $02    [$00:0002]   ;
$01/EACF BF B0 E9 01 LDA $01E9B0,x[$01:E9B0] ;
$01/EAD3 29 FF 00    AND #$00FF              ;
$01/EAD6 0A          ASL A                   ;
$01/EAD7 0A          ASL A                   ;
$01/EAD8 0A          ASL A                   ;
$01/EAD9 0A          ASL A                   ;
$01/EADA 85 04       STA $04    [$00:0004]   ;
$01/EADC BF B1 E9 01 LDA $01E9B1,x[$01:E9B1] ;
$01/EAE0 29 FF 00    AND #$00FF              ;
$01/EAE3 85 06       STA $06    [$00:0006]   ;
$01/EAE5 A5 04       LDA $04    [$00:0004]   ;
$01/EAE7 38          SEC                     ;
$01/EAE8 E5 08       SBC $08    [$00:0008]   ;
$01/EAEA 99 4C 3D    STA $3D4C,y[$00:3D4C]   ;
$01/EAED A9 10 00    LDA #$0010              ;
$01/EAF0 24 00       BIT $00    [$00:0000]   ;
$01/EAF2 30 0A       BMI $0A    [$EAFE]      ;
$01/EAF4 A5 04       LDA $04    [$00:0004]   ;
$01/EAF6 18          CLC                     ;
$01/EAF7 69 10 00    ADC #$0010              ;
$01/EAFA 85 04       STA $04    [$00:0004]   ;
$01/EAFC A5 02       LDA $02    [$00:0002]   ;
$01/EAFE 99 4A 3D    STA $3D4A,y[$00:3D4A]   ;
$01/EB01 A5 08       LDA $08    [$00:0008]   ;
$01/EB03 18          CLC                     ;
$01/EB04 69 10 00    ADC #$0010              ;
$01/EB07 85 08       STA $08    [$00:0008]   ;
$01/EB09 A5 06       LDA $06    [$00:0006]   ;
$01/EB0B 99 4E 3D    STA $3D4E,y[$00:3D4E]   ;
$01/EB0E 98          TYA                     ;
$01/EB0F 18          CLC                     ;
$01/EB10 69 06 00    ADC #$0006              ;
$01/EB13 A8          TAY                     ;
$01/EB14 A5 02       LDA $02    [$00:0002]   ;
$01/EB16 38          SEC                     ;
$01/EB17 E9 10 00    SBC #$0010              ;
$01/EB1A 85 02       STA $02    [$00:0002]   ;
$01/EB1C D0 C7       BNE $C7    [$EAE5]      ;
$01/EB1E E2 20       SEP #$20                ;
$01/EB20 E8          INX                     ;
$01/EB21 E8          INX                     ;
$01/EB22 E8          INX                     ;
$01/EB23 80 97       BRA $97    [$EABC]      ;

$01/EB25 AB          PLB                     ;
$01/EB26 E2 10       SEP #$10                ;
$01/EB28 60          RTS                     ;

DATA_01EB29:         dw $EB3D
DATA_01EB2B:         dw $EC86
DATA_01EB2D:         dw $EC7F
DATA_01EB2F:         dw $ED77
DATA_01EB31:         dw $ED14
DATA_01EB33:         dw $ED8C
DATA_01EB35:         dw $EC86
DATA_01EB37:         dw $EC78

DATA_01EB39:         db $40, $37

DATA_01EB3B:         db $80, $06

$01/EB3D DA          PHX
$01/EB3E A0 21       LDY #$21                ;
$01/EB40 8C 27 01    STY $0127  [$00:0127]   ;
$01/EB43 22 7B E3 00 JSL $00E37B[$00:E37B]   ;
$01/EB47 68          PLA                     ;
$01/EB48 C2 20       REP #$20                ;
$01/EB4A 29 FF 00    AND #$00FF              ;
$01/EB4D 0A          ASL A                   ;
$01/EB4E AA          TAX                     ;
$01/EB4F BD 39 EB    LDA $EB39,x[$00:EB39]   ;
$01/EB52 8D 16 21    STA $2116  [$00:2116]   ;
$01/EB55 A9 00 08    LDA #$0800              ;
$01/EB58 38          SEC                     ;
$01/EB59 FD 3B EB    SBC $EB3B,x[$00:EB3B]   ;
$01/EB5C 8D 05 43    STA $4305  [$00:4305]   ;
$01/EB5F A2 80       LDX #$80                ;
$01/EB61 8E 15 21    STX $2115  [$00:2115]   ;
$01/EB64 A9 01 18    LDA #$1801              ;
$01/EB67 8D 00 43    STA $4300  [$00:4300]   ;
$01/EB6A A2 70       LDX #$70                ;
$01/EB6C 8E 04 43    STX $4304  [$00:4304]   ;
$01/EB6F A9 00 58    LDA #$5800              ;
$01/EB72 8D 02 43    STA $4302  [$00:4302]   ;
$01/EB75 A2 01       LDX #$01                ;
$01/EB77 8E 0B 42    STX $420B  [$00:420B]   ;
$01/EB7A E2 20       SEP #$20                ;
$01/EB7C 60          RTS                     ;

DATA_01EB7D:         db $00, $20, $00, $07, $00, $00, $30, $00
DATA_01EB85:         db $27, $00, $00, $20, $00, $37, $00, $00
DATA_01EB8D:         db $2E, $00, $57, $00, $00, $20, $00, $67
DATA_01EB95:         db $00, $00, $2C, $00, $87, $00, $00, $20
DATA_01EB9D:         db $00, $97, $00, $00, $2A, $00, $B7, $00
DATA_01EBA5:         db $00, $10, $00, $37, $01, $00, $28, $00
DATA_01EBAD:         db $57, $01, $00, $20, $00, $67, $01, $00
DATA_01EBB5:         db $40, $00, $00, $08

DATA_01EBB9:         db $00, $1A, $00, $17, $06, $00, $2E, $00
DATA_01EBC1:         db $57, $06, $00, $19, $00, $77, $06, $00
DATA_01EBC9:         db $2C, $00, $C7, $06, $00, $18, $00, $D7
DATA_01EBD1:         db $06, $00, $2A, $00, $07, $07, $00, $17
DATA_01EBD9:         db $00, $17, $07, $00, $28, $00, $57, $07
DATA_01EBE1:         db $00, $16, $00, $67, $07, $00, $C0, $00
DATA_01EBE9:         db $B7, $07, $00, $40, $01, $00, $08

DATA_01EBF0:         db $00, $16, $00, $77, $07, $82, $00, $90
DATA_01EBF8:         db $00, $00, $08, $A0

DATA_01EBFC:         db $00, $2A, $00, $27, $00, $00, $1A, $00
DATA_01EC04:         db $57, $00, $00, $28, $00, $87, $00, $00
DATA_01EC0C:         db $18, $00, $B7, $00, $00, $26, $00, $E7
DATA_01EC14:         db $00, $00, $16, $00, $07, $01, $00, $12
DATA_01EC1C:         db $00, $27, $01, $82, $00, $10, $00, $67
DATA_01EC24:         db $01, $10, $80, $00, $20, $00, $87, $01
DATA_01EC2C:         db $00, $30, $00, $00, $08

DATA_01EC31:         db $00, $00, $00, $17, $00, $00, $20, $00
DATA_01EC39:         db $37, $00, $00, $00, $00, $47, $00, $00
DATA_01EC41:         db $00, $00, $67, $00, $00, $1C, $00, $97
DATA_01EC49:         db $00, $00, $1A, $00, $C7, $00, $00, $00
DATA_01EC51:         db $00, $C7, $00, $00, $18, $00, $E7, $00
DATA_01EC59:         db $00, $00, $00, $67, $01, $00, $40, $00
DATA_01EC61:         db $00, $08

DATA_01EC63:         db $82, $00, $00, $01, $00

DATA_01EC68:         dw $0808, $EB7D, $EBB9, $EBF0
DATA_01EC70:         dw $EBFC, $0000, $EC31, $EC63

$01/EC78 A9 04       LDA #$04                ;
$01/EC7A 8D 43 0D    STA $0D43  [$00:0D43]   ;
$01/EC7D 80 07       BRA $07    [$EC86]      ;

$01/EC7F DA          PHX                     ;
$01/EC80 A2 00       LDX #$00                ;
$01/EC82 20 AE EC    JSR $ECAE  [$00:ECAE]   ;
$01/EC85 FA          PLX                     ;

$01/EC86 A9 01       LDA #$01                ;
$01/EC88 8D 3D 0D    STA $0D3D  [$00:0D3D]   ;
$01/EC8B C2 20       REP #$20                ;
$01/EC8D BD 68 EC    LDA $EC68,x[$00:EC68]   ;
$01/EC90 8D 3F 0D    STA $0D3F  [$00:0D3F]   ;
$01/EC93 E2 30       SEP #$30                ;
$01/EC95 60          RTS                     ;

DATA_01EC96:         dw $0611, $07B7, $0215, $0800

DATA_01EC9E:         dw $2022, $0787, $6222, $0800
DATA_01ECA6:         dw $0808

DATA_01ECA8:         dw $EC96, $EC9E

DATA_01ECAC:         db $2C, $30

$01/ECAE BD A6 EC    LDA $ECA6,x[$01:ECA1]   ;
$01/ECB1 1A          INC A                   ;
$01/ECB2 8D 27 0D    STA $0D27  [$01:0D27]   ;
$01/ECB5 C2 20       REP #$20                ;
$01/ECB7 8A          TXA                     ;
$01/ECB8 29 FF 00    AND #$00FF              ;
$01/ECBB A8          TAY                     ;
$01/ECBC 0A          ASL A                   ;
$01/ECBD AA          TAX                     ;
$01/ECBE BD A8 EC    LDA $ECA8,x[$00:ECA8]   ;
$01/ECC1 8D 28 0D    STA $0D28  [$00:0D28]   ;
$01/ECC4 E2 20       SEP #$20                ;
$01/ECC6 A9 41       LDA #$41                ;
$01/ECC8 8D 40 43    STA $4340  [$00:4340]   ;
$01/ECCB B9 AC EC    LDA $ECAC,y[$00:ECAC]   ;
$01/ECCE 8D 41 43    STA $4341  [$00:4341]   ;
$01/ECD1 60          RTS                     ;

DATA_01ECD2:         dw $2900, $0107, $0765, $0000
DATA_01ECDA:         dw $FF08

DATA_01ECDC:         dw $000C, $000C, $00E0, $0019
DATA_01ECE4:         dw $121F, $0040, $121F, $0019
DATA_01ECEC:         dw $0040, $000C, $000C, $0050
DATA_01ECF4:         dw $FFFF

DATA_01ECF6:         dw $5E2C, $5E2C, $00E0, $6EEE
DATA_01ECFE:         dw $6EF8, $0040, $6EF8, $6EEE
DATA_01ED06:         dw $0040, $5E2C, $5E2C, $0050
DATA_01ED0E:         dw $FFFF

DATA_01ED10:         dw $ECDC, $ECF6

$01/ED14 20 86 EC    JSR $EC86  [$00:EC86]   ;
$01/ED17 A0 00       LDY #$00                ;
$01/ED19 AD 40 01    LDA $0140  [$00:0140]   ;
$01/ED1C 29 01       AND #$01                ;
$01/ED1E F0 02       BEQ $02    [$ED22]      ;
$01/ED20 A0 02       LDY #$02                ;
$01/ED22 C2 20       REP #$20                ;
$01/ED24 A9 01 00    LDA #$0001              ;
$01/ED27 8D 00 30    STA $3000  [$00:3000]   ;
$01/ED2A B9 10 ED    LDA $ED10,y[$00:ED10]   ;
$01/ED2D 8D 12 30    STA $3012  [$00:3012]   ;
$01/ED30 A2 08       LDX #$08                ;
$01/ED32 A9 B5 EB    LDA #$EBB5              ;
$01/ED35 22 44 DE 7E JSL $7EDE44[$7E:DE44]   ; GSU init
$01/ED39 A9 DE 56    LDA #$56DE              ;
$01/ED3C 85 20       STA $20    [$00:0020]   ;
$01/ED3E A0 7F       LDY #$7F                ;
$01/ED40 84 22       STY $22    [$00:0022]   ;
$01/ED42 A9 00 58    LDA #$5800              ;
$01/ED45 85 23       STA $23    [$00:0023]   ;
$01/ED47 A0 70       LDY #$70                ;
$01/ED49 84 25       STY $25    [$00:0025]   ;
$01/ED4B A9 22 05    LDA #$0522              ;
$01/ED4E 22 88 82 00 JSL $008288[$00:8288]   ;
$01/ED52 A9 D2 EC    LDA #$ECD2              ;
$01/ED55 8D 47 0D    STA $0D47  [$00:0D47]   ;
$01/ED58 9C 4B 0D    STZ $0D4B  [$00:0D4B]   ;
$01/ED5B 9C 2B 0D    STZ $0D2B  [$00:0D2B]   ;
$01/ED5E 9C 2D 0D    STZ $0D2D  [$00:0D2D]   ;
$01/ED61 E2 20       SEP #$20                ;
$01/ED63 A9 12       LDA #$12                ;
$01/ED65 8D 41 43    STA $4341  [$00:4341]   ;
$01/ED68 EE 0D 0D    INC $0D0D  [$00:0D0D]   ;
$01/ED6B AD 4A 09    LDA $094A  [$00:094A]   ;
$01/ED6E 09 06       ORA #$06                ;
$01/ED70 8D 4A 09    STA $094A  [$00:094A]   ;
$01/ED73 EE 45 0D    INC $0D45  [$00:0D45]   ;
$01/ED76 60          RTS                     ;

$01/ED77 A9 17       LDA #$17                ;
$01/ED79 8D 67 09    STA $0967  [$00:0967]   ;
$01/ED7C A9 04       LDA #$04                ;
$01/ED7E 8D 68 09    STA $0968  [$00:0968]   ;
$01/ED81 A2 01       LDX #$01                ;
$01/ED83 20 AE EC    JSR $ECAE  [$00:ECAE]   ;
$01/ED86 A2 06       LDX #$06                ;
$01/ED88 20 86 EC    JSR $EC86  [$00:EC86]   ;
$01/ED8B 60          RTS                     ;

$01/ED8C A9 A0       LDA #$A0                ;
$01/ED8E 8D 6B 09    STA $096B  [$00:096B]   ;
$01/ED91 A9 64       LDA #$64                ;
$01/ED93 8D 6C 09    STA $096C  [$00:096C]   ;
$01/ED96 60          RTS                     ;

$01/ED97 9B          TXY                     ;
$01/ED98 ED A5 ED    SBC $EDA5  [$00:EDA5]   ;
$01/ED9B FF 20 BD B2 SBC $B2BD20,x[$B2:BD20] ;
$01/ED9F B6 AE       LDX $AE,y  [$00:00AE]   ;
$01/EDA1 D0 BE       BNE $BE    [$ED61]      ;
$01/EDA3 B9 FD FF    LDA $FFFD,y[$00:FFFD]   ;
$01/EDA6 20 C2 B8    JSR $B8C2  [$00:B8C2]   ;
$01/EDA9 BE D0 B5    LDX $B5D0,y[$00:B5D0]   ;
$01/EDAC B8          CLV                     ;
$01/EDAD BC BD FD    LDY $FDBD,x[$00:FDBD]   ;

; freespace
DATA_01EDB0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EDB8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EDC0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EDC8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EDD0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EDD8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EDE0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EDE8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EDF0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EDF8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE00:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE08:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE10:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE18:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE20:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE28:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE30:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE38:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE40:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE48:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE50:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE58:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE60:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE68:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE70:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE78:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE80:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE88:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE90:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EE98:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EEA0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EEA8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EEB0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EEB8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EEC0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EEC8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EED0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EED8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EEE0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EEE8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EEF0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EEF8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF00:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF08:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF10:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF18:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF20:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF28:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF30:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF38:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF40:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF48:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF50:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF58:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF60:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF68:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF70:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF78:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF80:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF88:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF90:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EF98:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EFA0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EFA8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EFB0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EFB8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EFC0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EFC8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EFD0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EFD8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EFE0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EFE8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EFF0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01EFF8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F000:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F008:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F010:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F018:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F020:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F028:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F030:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F038:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F040:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F048:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F050:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F058:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F060:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F068:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F070:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F078:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F080:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F088:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F090:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F098:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F0A0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F0A8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F0B0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F0B8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F0C0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F0C8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F0D0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F0D8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F0E0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F0E8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F0F0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F0F8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F100:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F108:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F110:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F118:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F120:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F128:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F130:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F138:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F140:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F148:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F150:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F158:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F160:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F168:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F170:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F178:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F180:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F188:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F190:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F198:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F1A0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F1A8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F1B0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F1B8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F1C0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F1C8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F1D0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F1D8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F1E0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F1E8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F1F0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F1F8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F200:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F208:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F210:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F218:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F220:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F228:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F230:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F238:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F240:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F248:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F250:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F258:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F260:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F268:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F270:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F278:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F280:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F288:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F290:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F298:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F2A0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F2A8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F2B0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F2B8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F2C0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F2C8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F2D0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F2D8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F2E0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F2E8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F2F0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F2F8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F300:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F308:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F310:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F318:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F320:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F328:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F330:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F338:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F340:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F348:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F350:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F358:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F360:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F368:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F370:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F378:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F380:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F388:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F390:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F398:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F3A0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F3A8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F3B0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F3B8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F3C0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F3C8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F3D0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F3D8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F3E0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F3E8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F3F0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F3F8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F400:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F408:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F410:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F418:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F420:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F428:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F430:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F438:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F440:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F448:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F450:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F458:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F460:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F468:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F470:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F478:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F480:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F488:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F490:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F498:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F4A0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F4A8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F4B0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F4B8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F4C0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F4C8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F4D0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F4D8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F4E0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F4E8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F4F0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F4F8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F500:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F508:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F510:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F518:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F520:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F528:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F530:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F538:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F540:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F548:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F550:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F558:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F560:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F568:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F570:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F578:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F580:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F588:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F590:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F598:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F5A0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F5A8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F5B0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F5B8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F5C0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F5C8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F5D0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F5D8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F5E0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F5E8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F5F0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F5F8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F600:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F608:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F610:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F618:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F620:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F628:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F630:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F638:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F640:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F648:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F650:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F658:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F660:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F668:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F670:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F678:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F680:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F688:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F690:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F698:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F6A0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F6A8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F6B0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F6B8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F6C0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F6C8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F6D0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F6D8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F6E0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F6E8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F6F0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F6F8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F700:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F708:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F710:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F718:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F720:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F728:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F730:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F738:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F740:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F748:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F750:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F758:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F760:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F768:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F770:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F778:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F780:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F788:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F790:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F798:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F7A0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F7A8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F7B0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F7B8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F7C0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F7C8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F7D0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F7D8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F7E0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F7E8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F7F0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F7F8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F800:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F808:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F810:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F818:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F820:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F828:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F830:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F838:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F840:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F848:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F850:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F858:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F860:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F868:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F870:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F878:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F880:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F888:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F890:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F898:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F8A0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F8A8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F8B0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F8B8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F8C0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F8C8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F8D0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F8D8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F8E0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F8E8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F8F0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F8F8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F900:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F908:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F910:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F918:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F920:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F928:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F930:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F938:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F940:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F948:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F950:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F958:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F960:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F968:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F970:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F978:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F980:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F988:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F990:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F998:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F9A0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F9A8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F9B0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F9B8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F9C0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F9C8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F9D0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F9D8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F9E0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F9E8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F9F0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01F9F8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA00:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA08:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA10:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA18:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA20:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA28:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA30:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA38:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA40:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA48:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA50:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA58:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA60:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA68:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA70:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA78:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA80:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA88:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA90:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FA98:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FAA0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FAA8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FAB0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FAB8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FAC0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FAC8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FAD0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FAD8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FAE0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FAE8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FAF0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FAF8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB00:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB08:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB10:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB18:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB20:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB28:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB30:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB38:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB40:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB48:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB50:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB58:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB60:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB68:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB70:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB78:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB80:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB88:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB90:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FB98:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FBA0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FBA8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FBB0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FBB8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FBC0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FBC8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FBD0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FBD8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FBE0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FBE8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FBF0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FBF8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC00:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC08:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC10:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC18:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC20:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC28:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC30:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC38:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC40:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC48:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC50:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC58:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC60:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC68:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC70:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC78:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC80:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC88:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC90:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FC98:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FCA0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FCA8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FCB0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FCB8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FCC0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FCC8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FCD0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FCD8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FCE0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FCE8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FCF0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FCF8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD00:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD08:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD10:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD18:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD20:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD28:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD30:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD38:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD40:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD48:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD50:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD58:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD60:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD68:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD70:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD78:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD80:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD88:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD90:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FD98:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FDA0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FDA8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FDB0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FDB8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FDC0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FDC8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FDD0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FDD8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FDE0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FDE8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FDF0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FDF8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE00:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE08:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE10:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE18:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE20:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE28:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE30:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE38:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE40:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE48:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE50:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE58:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE60:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE68:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE70:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE78:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE80:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE88:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE90:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FE98:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FEA0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FEA8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FEB0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FEB8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FEC0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FEC8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FED0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FED8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FEE0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FEE8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FEF0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FEF8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF00:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF08:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF10:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF18:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF20:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF28:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF30:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF38:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF40:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF48:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF50:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF58:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF60:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF68:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF70:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF78:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF80:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF88:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF90:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FF98:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FFA0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FFA8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FFB0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FFB8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FFC0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FFC8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FFD0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FFD8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FFE0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FFE8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FFF0:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
DATA_01FFF8:         db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF