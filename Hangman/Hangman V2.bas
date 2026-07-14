REM initializing word, guess [word] and error arrays
10 DIM W(20), G(20), E(6)
20 FOR I = 0 TO 19 REM <-- reset here
30 		LET W(I) = 0
40		LET G(I) = 0
50 NEXT I
60 FOR I = 0 TO 5
70		LET E(I) = 0
80 NEXT I
REM initializing word and error array size counters
100 LET W0 = 0
110 LET E0 = 0

120 CLS
150 PRINT "Enter a word:"

160 FOR I = 0 TO 19
170	LET L0 = INC
180	IF L0 = 127 GOTO 20 REM reset on ЗБ
190	IF L0 = 13 THEN IF W0>0 GOTO 260 REM break out the loop on ВК
200	IF L0 < 65 GOTO 170
210	IF L0 > 90 GOTO 170
220	GOSUB L0*10
230	LET W(I) = L0
240	LET W0 = W0 + 1
250 NEXT I
REM fill guess table with underscores
260 FOR I = 0 TO W0 - 1
270	LET G(I) = 95
280 NEXT I

REM drawing the gallows
285 CLS
290 DRAWD 0, 54, 0, 34
300 DRAWD 1, 36, 3, 34
310 DRAWD 0, 33, 8, 33
320 DRAWD 8, 34, 8, 36
330 LOCATE 0, 0
340 PRINT "Guess the word:"
341 FOR I = 0 TO W0 - 1
342 	GOSUB G(I) * 10 REM this GOSUB breaks when in a one line FOR loop
343 NEXT I REM draw guessed word at least once before input

350 LET L0 = INC REM <-- no end? go here
360 IF L0 < 65 GOTO 350
370 IF L0 > 90 GOTO 350
REM repeated wrong letter check
380 FOR I = 0 TO E0 - 1
390 	IF L0 = E(I) GOTO 350
400 NEXT I

410 LET M0 = 0 REM match found boolean
420 FOR I = 0 TO W0 - 1
430 	IF L0 = W(I) THEN LET G(I) = L0 : LET M0 = 1
450 NEXT I
460 IF M0 = 0 THEN LET E(E0) = L0 : LET E0 = E0 + 1 : GOTO 520 REM skip on no correct guess
REM drawing the guessed word
480 LOCATE 0, 8
490 FOR I = 0 TO W0 - 1
500 	GOSUB G(I) * 10
510 NEXT I
REM drawing the stick figure
520 IF M0 = 0 THEN GOSUB 634 + E0
REM drawing wrong letters
530 LOCATE 0, 57
540 FOR I = 0 TO E0 - 1
550 	GOSUB E(I) * 10
560 NEXT I

565 LOCATE 21, 41
570 IF E0 < 6 GOTO 590
580 PRINT "You LOST!" : LOCATE 0, 16
583 FOR I = 0 TO W0 - 1
585	GOSUB W(I) * 10
587 NEXT I : GOTO 621
590 FOR I = 0 TO W0 - 1
600 	IF G(I) = 95 GOTO 350
610 NEXT I
620 PRINT "You WON!"

621 LOCATE 0, 24 : PRINT "Play again (Y/N)?"
622 LET L0 = INC
623 IF L0 = 89 GOTO 20
624 IF L0 = 78 GOTO 626
625 GOTO 622

626 CLS
628 DIS
630 END


635 DRAWC 8, 39, 2 : RETURN
636 DRAWD 8, 42, 8, 48 : RETURN
637 DRAWD 7, 43, 5, 45 : RETURN
638 DRAWD 9, 43, 11, 45 : RETURN
639 DRAWD 7, 49, 5, 51 : RETURN
640 DRAWD 9, 49, 11, 51 : RETURN


650 PRINT "A" ; : RETURN
660 PRINT "B" ; : RETURN
670 PRINT "C" ; : RETURN
680 PRINT "D" ; : RETURN
690 PRINT "E" ; : RETURN
700 PRINT "F" ; : RETURN
710 PRINT "G" ; : RETURN
720 PRINT "H" ; : RETURN
730 PRINT "I" ; : RETURN 
740 PRINT "J" ; : RETURN
750 PRINT "K" ; : RETURN
760 PRINT "L" ; : RETURN
770 PRINT "M" ; : RETURN
780 PRINT "N" ; : RETURN
790 PRINT "O" ; : RETURN
800 PRINT "P" ; : RETURN
810 PRINT "Q" ; : RETURN
820 PRINT "R" ; : RETURN
830 PRINT "S" ; : RETURN
840 PRINT "T" ; : RETURN
850 PRINT "U" ; : RETURN
860 PRINT "V" ; : RETURN
870 PRINT "W" ; : RETURN
880 PRINT "X" ; : RETURN
890 PRINT "Y" ; : RETURN
900 PRINT "Z" ; : RETURN
950 PRINT "_" ; : RETURN 