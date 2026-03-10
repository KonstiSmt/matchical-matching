# Management board

**Konsti | matchicalcom** [00:00 - 00:00]: Bitteschön.
**Konsti | matchicalcom** [00:01 - 00:02]: Richtig nice, oder?
**Niklas | matchicalcom** [00:02 - 00:04]: Ja, Caro hat die eigentlich gehabt.
**Niklas | matchicalcom** [00:04 - 00:05]: Ich hab mir dann genau die gleiche Nr.
**Niklas | matchicalcom** [00:05 - 00:08]: Gekauft, also bestellt im Internet.
**Niklas | matchicalcom** [00:13 - 00:14]: So, ich bin jetzt gleich schon da.
**Niklas | matchicalcom** [00:14 - 00:16]: Das ist ziemlich nice, da muss ich nicht im Bus sein.
**Tommy | matchicalcom** [00:17 - 00:18]: Easy.
**Tommy | matchicalcom** [00:18 - 00:18]: Cool.
**Konsti | matchicalcom** [00:19 - 00:20]: Wie läuft es bei dir?
**Konsti | matchicalcom** [00:21 - 00:24]: Gut, ich bin jetzt gerade dabei, ein bisschen den Hammer wieder zu springen.
**Konsti | matchicalcom** [00:24 - 00:30]: Also ich mache jetzt wirklich Changes, die nicht mehr kompatibel sind, weil es zu aufwendig ist, da Feature Toggles einzubauen.
**Niklas | matchicalcom** [00:32 - 00:34]: Changes im Backend oder was für AI Optimization?
**Konsti | matchicalcom** [00:35 - 00:36]: Backend und frontend.
**Konsti | matchicalcom** [00:37 - 00:39]: Also frontend kommt dann auch.
**Konsti | matchicalcom** [00:39 - 00:45]: Also momentan, wie gesagt, die Focus Areas und diese Requirement Specification und so weiter, haben wir davor alle in Entities gespeichert.
**Konsti | matchicalcom** [00:45 - 00:47]: Und jetzt hole ich sie einfach on the fly.
**Konsti | matchicalcom** [00:47 - 00:50]: Bis auf diese Requirement Certification mache ich ein bisschen anders.
**Niklas | matchicalcom** [00:51 - 00:52]: Ich bin gespannt.
**Niklas | matchicalcom** [00:52 - 00:54]: Aber die neue Structure, super, die wir implementiert haben, finde ich.
**Konsti | matchicalcom** [00:55 - 01:02]: Ja, an ein paar Stellen können wir die wahrscheinlich dann noch ein bisschen leaner machen, was du ja auch schon gesagt hast, einfach nur noch die Text Values übergeben und Co.
**Konsti | matchicalcom** [01:03 - 01:04]: Aber das machen wir nicht jetzt.
**Niklas | matchicalcom** [01:05 - 01:06]: Ja, ne, voll.
**Niklas | matchicalcom** [01:06 - 01:07]: Genau.
**Konsti | matchicalcom** [01:08 - 01:10]: Bei den Focus Areas ist es z.b.
**Konsti | matchicalcom** [01:10 - 01:21]: so, dass ich die demand based Focus Areas, die erstelle ich gar nicht mehr, sondern die tue ich ja nur noch einfach als JSON zurückgeben.
**Konsti | matchicalcom** [01:21 - 01:26]: Die sind nicht mehr, die kommen nicht mehr aus der Datenbank, dadurch haben sie keine ID mehr.
**Konsti | matchicalcom** [01:26 - 01:31]: Und ich habe gesehen, dass deine Sort Logik funktioniert, aber mit der ID, die benutzt du als Sort.
**Konsti | matchicalcom** [01:33 - 01:37]: Deswegen habe ich ihnen eine random id generieren lassen, dass die eine haben.
**Konsti | matchicalcom** [01:37 - 01:40]: Aber deswegen, wir müssen solche Sachen gucken, wo.
**Konsti | matchicalcom** [01:40 - 01:43]: Ich sag dir dann später, wo vielleicht ids weggefallen sind.
**Niklas | matchicalcom** [01:45 - 01:51]: Kannst du IDs nicht wegmachen, weil da gibt es ja die Order, auf die man anpassen kann im Consultant Detail.
**Niklas | matchicalcom** [01:51 - 01:57]: Das heißt, das muss synchronisiert sein bei der Education, die kann man ja sortieren, auch in der Consultant Detail.
**Konsti | matchicalcom** [01:57 - 01:59]: Ja, aber die Education sind ja nicht AI.
**Konsti | matchicalcom** [02:00 - 02:01]: Es geht nur um die ai Sachen.
**Niklas | matchicalcom** [02:01 - 02:04]: Education ist ja nicht AI eine Sache.
**Niklas | matchicalcom** [02:04 - 02:05]: Ja, aber nur eine Kleinigkeit.
**Niklas | matchicalcom** [02:06 - 02:10]: Momentan heißen die Sachen demand based, exec summary, demand based, bla bla bla.
**Niklas | matchicalcom** [02:10 - 02:12]: Aber wenn es ja später AI Optimize.
**Konsti | matchicalcom** [02:12 - 02:14]: Gibt, wollten wir sie alle umbenennen.
**Niklas | matchicalcom** [02:14 - 02:16]: Ja, ja, vom Naming.
**Niklas | matchicalcom** [02:16 - 02:19]: Oder es gibt ein zusätzliches, weil es gibt ja Demand und AI optimized.
**Niklas | matchicalcom** [02:19 - 02:21]: Oder lässt einfach einen anderen Prompt.
**Konsti | matchicalcom** [02:21 - 02:23]: Ne, ne, da machen wir einfach AI optimize.
**Niklas | matchicalcom** [02:23 - 02:24]: Okay.
**Niklas | matchicalcom** [02:24 - 02:26]: Ja, das war so bei mir noch im Kopf.
**Niklas | matchicalcom** [02:26 - 02:27]: Morgen, Thomas, by the way.
**Konsti | matchicalcom** [02:27 - 02:32]: Alright, Leute, ich würde sagen, wir starten, weil wir wissen ja nicht, ob der Migi das vielleicht nicht auf dem Schirm hat oder.
**Niklas | matchicalcom** [02:34 - 02:35]: Ein guter Mann.
**Tommy | matchicalcom** [02:41 - 02:41]: Oder.
**Konsti | matchicalcom** [02:41 - 02:44]: Wie lange brauchst du noch, bis du zu der einen Zahl kommst?
**Konsti | matchicalcom** [02:44 - 02:44]: Mr.
**Konsti | matchicalcom** [02:44 - 02:45]: De Bauer?
**Tommy | matchicalcom** [02:52 - 02:53]: Zu der einen Zahl?
**Tommy | matchicalcom** [02:53 - 02:53]: Du meinst.
**Konsti | matchicalcom** [02:55 - 02:56]: 1 s?
**Konsti | matchicalcom** [02:56 - 02:57]: Dann bin ich da.
**Niklas | matchicalcom** [02:58 - 03:00]: Zu welcher Zahl meinst du, Konz?
**Niklas | matchicalcom** [03:03 - 03:04]: Ich weiß auch nicht.
**Niklas | matchicalcom** [03:04 - 03:05]: Welche Zahl kannst du nennen?
**Konsti | matchicalcom** [03:13 - 03:15]: Nutzer hat einen KI Fehler gemeldet.
**Konsti | matchicalcom** [03:15 - 03:16]: Wir hatten den Scheiß übersetzt.
**Tommy | matchicalcom** [03:20 - 03:21]: Das weiß ich nicht.
**Niklas | matchicalcom** [03:25 - 03:28]: Gut Leute, wollen wir gleich mal rein starten, sonst sind wir wieder.
**Konsti | matchicalcom** [03:34 - 03:35]: Legen wir los.
**Konsti | matchicalcom** [03:37 - 03:39]: Also wenn Thomas ready ist.
**Niklas | matchicalcom** [03:39 - 03:41]: Achso, Thomas, du wirst.
**Konsti | matchicalcom** [03:41 - 03:46]: Ich gehe schnell pissen, dann hat er endlich zu sein.
**Tommy | matchicalcom** [03:51 - 03:53]: Geh nur pissen, dann bin ich fertig.
**Niklas | matchicalcom** [03:54 - 03:55]: Und was bist du dran?
**Niklas | matchicalcom** [03:56 - 03:57]: Da kannst du da nicht sehen.
**GIRKE Michael** [04:02 - 04:02]: Aber.
**Tommy | matchicalcom** [04:02 - 04:03]: Kriegst jetzt nicht fertig.
**Tommy | matchicalcom** [04:03 - 04:06]: Aber vielleicht hat der Migi das wirklich verpasst.
**Niklas | matchicalcom** [04:08 - 04:11]: Sonst ist Migi relativ konsistent mit seinem.
**Niklas | matchicalcom** [04:11 - 04:13]: Wahrscheinlich hat er den Kalender einfach noch nicht.
**Niklas | matchicalcom** [04:18 - 04:19]: Dann schreib ihn halt neu.
**Niklas | matchicalcom** [04:29 - 04:30]: Ah, jetzt Wartebereich.
**Niklas | matchicalcom** [04:30 - 04:31]: Da ist er.
**Niklas | matchicalcom** [04:32 - 04:34]: Thomas, ich lasse ihn zu.
**Tommy | matchicalcom** [04:50 - 04:53]: Wir hören dich, aber dein Internet ist irgendwie.
**GIRKE Michael** [04:56 - 04:56]: Hört ihr mich?
**GIRKE Michael** [04:59 - 05:00]: Hört ihr mich?
**GIRKE Michael** [05:01 - 05:02]: Aber ich weiß nicht.
**GIRKE Michael** [05:04 - 05:10]: Okay, ich hab gutes WLAN, aber ich kann meine Kamera gar nicht anmachen.
**Tommy | matchicalcom** [05:11 - 05:14]: Wir sehen dich ganz verpixelt auf der Name.
**Konsti | matchicalcom** [05:16 - 05:17]: Eure Stimme ist klar.
**Konsti | matchicalcom** [05:17 - 05:20]: Jetzt echt?
**Tommy | matchicalcom** [05:21 - 05:22]: Nein, bei mir komplett weg jetzt.
**Tommy | matchicalcom** [05:22 - 05:24]: Bei mir ist es weg, weil er.
**Konsti | matchicalcom** [05:24 - 05:24]: Gar nichts gesagt hat.
**GIRKE Michael** [05:26 - 05:28]: Ich sag gerade nichts, aber wieso bin ich denn nicht.
**GIRKE Michael** [05:28 - 05:29]: Ich sehe mich selber nicht.
**GIRKE Michael** [05:29 - 05:30]: Zumindest.
**GIRKE Michael** [05:30 - 05:32]: Also ich sehe mich nicht, aber seht ihr mich oder was?
**Tommy | matchicalcom** [05:32 - 05:33]: Nein.
**Tommy | matchicalcom** [05:38 - 05:39]: Geh noch mal raus und rein.
**Niklas | matchicalcom** [05:41 - 05:42]: Wahrscheinlich bin Teams.
**Konsti | matchicalcom** [05:44 - 05:45]: Oft.
**Niklas | matchicalcom** [05:49 - 05:51]: Ich hab übrigens die Jobboards angeguckt, Thors.
**Niklas | matchicalcom** [05:51 - 05:53]: Ich habe noch eine Memo dazu gemacht.
**Niklas | matchicalcom** [05:55 - 05:56]: Ist es ja nicht zu viel.
**Niklas | matchicalcom** [05:56 - 06:02]: Deswegen habe ich mir jetzt nicht den Aufwand gemacht, Kommentare extra zu schreiben, weil ich glaube das Wording und wie man es rüberbringt ist vor allem entscheidend.
**Tommy | matchicalcom** [06:03 - 06:03]: Was?
**Tommy | matchicalcom** [06:03 - 06:07]: Die Jobboards oder du meinst die Ausschreibungen?
**Tommy | matchicalcom** [06:07 - 06:09]: Ja, okay, das ist was anderes wieder.
**Niklas | matchicalcom** [06:09 - 06:10]: Sorry.
**Niklas | matchicalcom** [06:10 - 06:12]: Die Ausschreibung, mein Naming.
**Konsti | matchicalcom** [06:14 - 06:15]: Ich fand ein bisschen fauler.
**Konsti | matchicalcom** [06:15 - 06:20]: Ich bin einmal drüber geflogen und habe da meinen Haken dran gesetzt, weil ich mir gedacht habe, es passt eigentlich schon.
**Niklas | matchicalcom** [06:22 - 06:23]: Also ich habe es in der Memo gesagt.
**Niklas | matchicalcom** [06:23 - 06:25]: Wir können es ja dann besprechen, wenn wir durchgehen.
**Niklas | matchicalcom** [06:25 - 06:31]: Ich glaube, es geht halt um die richtige Kommunikation, dass man eigenständig ist und innovativ.
**Tommy | matchicalcom** [06:32 - 06:35]: Das müssen wir dann sowieso auch sagen, weißt du?
**Tommy | matchicalcom** [06:35 - 06:37]: Also da kommen wahrscheinlich eh nicht drumherum.
**Niklas | matchicalcom** [06:40 - 06:41]: Ich glaube die zwei Stellen sind gut.
**Niklas | matchicalcom** [06:41 - 06:42]: Auf jeden Fall.
**Niklas | matchicalcom** [06:42 - 06:43]: UX UI und Dev.
**Niklas | matchicalcom** [06:44 - 06:49]: Ich würde wahrscheinlich Systems Kenntnisse hinschreiben beim UI UX, weil braucht man eigentlich.
**Tommy | matchicalcom** [06:52 - 06:53]: Haben wir das stehen?
**Tommy | matchicalcom** [06:53 - 06:54]: Haben wir das stehen, oder.
**Niklas | matchicalcom** [06:54 - 06:55]: Das steht drin.
**Niklas | matchicalcom** [06:55 - 06:56]: Ja, das steht drin.
**Niklas | matchicalcom** [06:57 - 06:59]: Wären von Vorteil, aber das will ich einfach rausspringen.
**Niklas | matchicalcom** [06:59 - 07:02]: Bei Out Systems kannst du nichts mit der UI anfangen.
**Niklas | matchicalcom** [07:02 - 07:03]: Es sieht hässlich aus in.
**Konsti | matchicalcom** [07:05 - 07:15]: Mein einziges Thema wäre, ob man, dass man hat gleich einen guten Filter, wenn man die Compensation direkt rein kommuniziert, wo wir sagen, was ist die Range?
**Tommy | matchicalcom** [07:20 - 07:22]: Da bin ich mir total unsicher, ob.
**Konsti | matchicalcom** [07:22 - 07:25]: Ich viel unnötige Gespräche.
**Tommy | matchicalcom** [07:25 - 07:26]: Warum?
**Tommy | matchicalcom** [07:26 - 07:27]: Du weißt ja noch gar nicht.
**Tommy | matchicalcom** [07:27 - 07:28]: Du gibst.
**Tommy | matchicalcom** [07:28 - 07:29]: Nein, du gibst.
**Tommy | matchicalcom** [07:29 - 07:30]: Nein, du gibst im Zweifel nennen.
**Tommy | matchicalcom** [07:30 - 07:33]: Aber gerne.
**Tommy | matchicalcom** [07:33 - 07:37]: Lass uns total gerne strukturiert angehen.
**Tommy | matchicalcom** [07:37 - 07:41]: Also hi Migi, geht's jetzt dein Video.
**Konsti | matchicalcom** [07:41 - 07:42]: Nicht, aber die Stimme hören wir.
**Konsti | matchicalcom** [07:42 - 07:43]: Das ist schon mal wichtig.
**Niklas | matchicalcom** [07:48 - 07:49]: Jetzt ist er komplett raus, oder?
**Niklas | matchicalcom** [07:53 - 07:55]: Ne, jetzt ist er wieder.
**GIRKE Michael** [08:14 - 08:17]: Ich bin in einer neuen Environment und funktioniert.
**GIRKE Michael** [08:17 - 08:18]: Aber geht es jetzt?
**Konsti | matchicalcom** [08:18 - 08:20]: Jetzt hat sich die Kamera aber gerade bewegt.
**Konsti | matchicalcom** [08:21 - 08:22]: 1 s.
**GIRKE Michael** [08:24 - 08:27]: Echt nur oder sehe mich oder geht nicht?
**Konsti | matchicalcom** [08:28 - 08:29]: Ne, geht nicht.
**Konsti | matchicalcom** [08:29 - 08:29]: Steht wieder.
**GIRKE Michael** [08:30 - 08:31]: Ihr hört mich gar nicht, oder?
**Konsti | matchicalcom** [08:31 - 08:33]: Aber hören tun würde ich.
**Tommy | matchicalcom** [08:35 - 08:36]: Abgeschnitten.
**Tommy | matchicalcom** [08:36 - 08:38]: Aber okay.
**GIRKE Michael** [08:39 - 08:40]: Und jetzt?
**Konsti | matchicalcom** [08:42 - 08:43]: Ja, Sound.
**Konsti | matchicalcom** [08:43 - 08:44]: Es geht.
**GIRKE Michael** [08:44 - 08:47]: Also und jetzt müsste es doch anders gehen, oder?
**GIRKE Michael** [08:47 - 08:48]: Jetzt.
**GIRKE Michael** [08:48 - 08:48]: Hallo?
**GIRKE Michael** [08:48 - 08:49]: Hallo.
**GIRKE Michael** [08:51 - 08:52]: Immer noch nicht sehen.
**GIRKE Michael** [08:52 - 08:53]: Sehen geht immer noch nicht.
**Tommy | matchicalcom** [08:53 - 08:54]: Bist komplett.
**Tommy | matchicalcom** [08:54 - 08:56]: Du bist frozen.
**GIRKE Michael** [08:58 - 08:59]: Was liegt das?
**GIRKE Michael** [08:59 - 09:00]: Voller Ausschlag.
**GIRKE Michael** [09:00 - 09:01]: An was liegt es?
**Tommy | matchicalcom** [09:05 - 09:08]: Heb deine rechte Hand, aber streck sie nicht aus.
**Tommy | matchicalcom** [09:13 - 09:13]: Hi.
**Tommy | matchicalcom** [09:13 - 09:14]: Jetzt geht's.
**GIRKE Michael** [09:15 - 09:16]: Jetzt geht's.
**GIRKE Michael** [09:16 - 09:16]: Okay, sehr gut.
**GIRKE Michael** [09:17 - 09:18]: Wie geht's euch?
**Tommy | matchicalcom** [09:19 - 09:19]: Guten Morgen.
**GIRKE Michael** [09:19 - 09:20]: Sorry.
**GIRKE Michael** [09:20 - 09:27]: Genau, ich bin bei meinen Eltern und da hat jetzt alles gedauert, dass ich mich hier mal einlogge.
**GIRKE Michael** [09:27 - 09:28]: Vielleicht bin ich da ab und zu mal.
**GIRKE Michael** [09:28 - 09:29]: Dann ist doch gut zu wissen.
**Tommy | matchicalcom** [09:29 - 09:30]: Wie geht's dir?
**Tommy | matchicalcom** [09:30 - 09:31]: Wie geht's dir?
**GIRKE Michael** [09:31 - 09:32]: Mir geht's gut.
**GIRKE Michael** [09:34 - 09:35]: Mir geht's gut.
**GIRKE Michael** [09:35 - 09:35]: Heißes.
**GIRKE Michael** [09:35 - 09:37]: Aber das glaube ich ist ja eben.
**Tommy | matchicalcom** [09:38 - 09:39]: Hast viel zu tun.
**GIRKE Michael** [09:41 - 09:41]: Ich hatte noch.
**GIRKE Michael** [09:41 - 09:43]: Ich habe noch sehr viel zu tun jetzt tatsächlich.
**GIRKE Michael** [09:43 - 09:45]: Also ich musste z.B.
**GIRKE Michael** [09:45 - 09:51]: noch am Freitag, Donnerstag mit allen Webstone Partnern war ich dann in einem.
**GIRKE Michael** [09:51 - 09:57]: Also die hatten ja so ein Partner Workshop und da haben sie noch mal netterweise irgendwas für mich jetzt da gemacht.
**GIRKE Michael** [09:58 - 09:59]: Da war ich z.b.
**GIRKE Michael** [09:59 - 10:04]: sonst war ich ja, bin ja da noch Beirat in so einer Familienfirma.
**GIRKE Michael** [10:04 - 10:05]: Da war ich übers Wochenende.
**GIRKE Michael** [10:06 - 10:07]: Es war Freitag, Samstag.
**GIRKE Michael** [10:08 - 10:09]: Genau.
**GIRKE Michael** [10:09 - 10:12]: Und ansonsten muss ich nächste Woche über die Alpen radeln.
**GIRKE Michael** [10:12 - 10:14]: Das ist jetzt das größte Stressfaktor.
**Konsti | matchicalcom** [10:17 - 10:18]: Das sucht man sich aus, oder?
**GIRKE Michael** [10:19 - 10:20]: Das sucht man sich aus, genau.
**GIRKE Michael** [10:20 - 10:24]: Und dann habe ich tatsächlich auch noch, habe ich glaube ich schon erzählt oder?
**GIRKE Michael** [10:24 - 10:29]: So ein kleinen bei einem Beratungsunternehmen jetzt auch so eine Art Beiratsmandat.
**GIRKE Michael** [10:29 - 10:30]: Da war ich gestern auch.
**GIRKE Michael** [10:34 - 10:35]: Jetzt muss man schauen.
**GIRKE Michael** [10:35 - 10:36]: Also ist unklar.
**GIRKE Michael** [10:36 - 10:41]: Also ich weiß jetzt Salesforce bereit.
**GIRKE Michael** [10:41 - 10:42]: Läuft im Moment nicht so gut.
**GIRKE Michael** [10:42 - 10:43]: Kann ich berichten.
**Tommy | matchicalcom** [10:48 - 10:49]: Die haben schon länger Probleme.
**Tommy | matchicalcom** [10:49 - 10:58]: Also das habe ich schon seit ein, zwei Jahren, weil die Preise, die haben so krasse Preisprobleme, das ist abartig, wirklich.
**Tommy | matchicalcom** [10:58 - 10:58]: Weil die einfach.
**GIRKE Michael** [10:58 - 10:59]: Die Beratung.
**GIRKE Michael** [10:59 - 11:01]: Die Beratung oder die Lizenzen?
**Tommy | matchicalcom** [11:02 - 11:03]: Ja, beides eigentlich, oder?
**Tommy | matchicalcom** [11:03 - 11:04]: Also ich habe.
**Tommy | matchicalcom** [11:04 - 11:06]: Also die Lizenzen sind ja sau teuer.
**Tommy | matchicalcom** [11:06 - 11:14]: Da kostet eine volle user Lizenz, Chico, und das ist nur eine User Lizenz, €190 im Monat.
**Tommy | matchicalcom** [11:15 - 11:16]: Und da hast du aber noch keine.
**Tommy | matchicalcom** [11:16 - 11:17]: Da hast du noch.
**Tommy | matchicalcom** [11:17 - 11:19]: Ja, ja, das ist geisteskrank.
**Niklas | matchicalcom** [11:19 - 11:20]: Dann kannst du nichts damit machen.
**Tommy | matchicalcom** [11:20 - 11:25]: Oder wie Salesforce einmal nutzen und dann brauchst du erst die Lösung dazu.
**Tommy | matchicalcom** [11:25 - 11:26]: Die nehmen dann manchmal auch noch.
**Tommy | matchicalcom** [11:26 - 11:38]: Und so ein Salesforce Consultant, also ich weiß es ja nur von der Endero, die nehmen für ihre Junioren, die quasi sich einloggen können dort und ein bisschen was customizen können, €1300 aufwärts.
**Tommy | matchicalcom** [11:39 - 11:41]: Und die Preise kriegen es halt nicht mehr durchgesetzt.
**Tommy | matchicalcom** [11:43 - 11:48]: Ich weiß nicht, ob dir das auch berichtet wird, Migi, aber das ist mein aktueller Stand.
**GIRKE Michael** [11:48 - 11:49]: Deckungsgleich.
**GIRKE Michael** [11:49 - 11:54]: Vor zwei Jahren voll der Hype und jetzt irgendwie viel weniger interessant.
**GIRKE Michael** [11:54 - 11:55]: Ja, super.
**GIRKE Michael** [11:55 - 11:56]: Du, aber viel wichtiger, wie geht es euch?
**Konsti | matchicalcom** [12:00 - 12:07]: Wir haben es jetzt letzte Woche auch ausgelassen, weil wir zum einen Thomas war krank, die Woche davor war ein bisschen Urlaub bei Thomas und Chico.
**Konsti | matchicalcom** [12:07 - 12:09]: Und ansonsten lief aber eigentlich ziemlich viel.
**Konsti | matchicalcom** [12:09 - 12:16]: Wir hatten einige Termine, wir haben unseren Development Modus wieder richtig gefunden und haben jetzt wieder ein neues Setup sozusagen.
**Konsti | matchicalcom** [12:16 - 12:17]: Kommt auch gleich in den Details.
**Konsti | matchicalcom** [12:17 - 12:21]: Aber all in all würden wir sagen, alle Ampeln auf dem Grün.
**Tommy | matchicalcom** [12:21 - 12:23]: Wir haben halt viel zu viel zu tun.
**GIRKE Michael** [12:26 - 12:27]: Das ist gut.
**Niklas | matchicalcom** [12:27 - 12:31]: Bekannte Skalierungsprobleme, aber vom Prinzip her geht es uns.
**Tommy | matchicalcom** [12:32 - 12:40]: Und das Ziel wäre jetzt quasi, wir gehen einfach jetzt gemeinsam durch die Agenda quasi und besprechen die Dinge, oder?
**Tommy | matchicalcom** [12:40 - 12:45]: Also wir sehen das jetzt quasi als Management Board an der Stelle.
**GIRKE Michael** [12:45 - 12:46]: Perfekt.
**Konsti | matchicalcom** [12:46 - 12:46]: Gut.
**GIRKE Michael** [12:48 - 12:51]: Das nächste Mal schaffen wir das auch in 2 Minuten Setup Zeit, oder?
**Konsti | matchicalcom** [12:51 - 12:52]: Aber ja.
**Tommy | matchicalcom** [12:54 - 12:56]: Ganz, ganz ohne Finanzen Cashflow.
**Tommy | matchicalcom** [12:56 - 12:59]: Mingi, vielen Dank für die Übermittlung der Excel.
**Tommy | matchicalcom** [12:59 - 13:00]: Ich bin gerade schon dabei.
**Tommy | matchicalcom** [13:00 - 13:04]: Ich habe heute damit begonnen, sie zu adaptieren.
**Tommy | matchicalcom** [13:04 - 13:05]: Die macht total viel Sinn.
**Tommy | matchicalcom** [13:05 - 13:13]: Also für euch ganz kurz, Jungs, nächste Woche haben wir da einen Stand, den wir schon besprechen können.
**Tommy | matchicalcom** [13:13 - 13:16]: Zwei, drei Kleinigkeiten muss man ein bisschen anders machen, Migi.
**Tommy | matchicalcom** [13:16 - 13:20]: Du hast die Probability einmal mit monthly revenue und einmal.
**Tommy | matchicalcom** [13:20 - 13:23]: Das wird bei uns nicht funktionieren, weil das bei uns schon ziemlich.
**Tommy | matchicalcom** [13:23 - 13:28]: Also weil das Jahr sehr variabel bei uns ist quasi.
**Tommy | matchicalcom** [13:28 - 13:30]: Aber das ist egal, das sind Kleinigkeiten.
**GIRKE Michael** [13:34 - 13:38]: Wir haben dann einfach bei den kleineren Startups rechts dann einfach überschrieben, weißt du?
**GIRKE Michael** [13:38 - 13:40]: Also dann rechnet es halt nicht.
**GIRKE Michael** [13:40 - 13:44]: Also es geht ja dann darum, nicht zu viel over engineeren.
**GIRKE Michael** [13:44 - 13:55]: Deswegen, also auch wenn dann diese Berechnung Probability von im Monat gibt, man aber das Gefühl hat, das stimmt nicht, dann schreibt man halt hinten was anderes drüber, nur als empfohlen.
**Konsti | matchicalcom** [13:55 - 13:56]: Das kann man natürlich auch machen.
**GIRKE Michael** [13:57 - 14:02]: Das muss nicht alles berechnet sein bei so einer Situation, wie ihr sie habt.
**GIRKE Michael** [14:02 - 14:05]: Also hauptsache man kann ja noch zeilenweise drüber gehen.
**GIRKE Michael** [14:05 - 14:07]: Ihr habt ja jetzt mehr als drei Kunden, habt ihr immer noch nicht.
**GIRKE Michael** [14:07 - 14:07]: Oder vier wahrscheinlich.
**Konsti | matchicalcom** [14:07 - 14:10]: Oder drei, vier, je nachdem, wie man es rechnet.
**Konsti | matchicalcom** [14:10 - 14:15]: Also was wir in der Pipeline haben, wo wir relativ sicher sind, dass es kommen wird, sind wir eigentlich schon fast bei fünf.
**GIRKE Michael** [14:16 - 14:19]: Egal, aber alles was unter 20 ist, sozusagen.
**GIRKE Michael** [14:19 - 14:24]: 20 kann man ja noch, muss nicht alles automatisch berechnet werden und so weiter.
**Tommy | matchicalcom** [14:25 - 14:27]: Aber keine Frage auf jeden Fall.
**Tommy | matchicalcom** [14:28 - 14:29]: Danke, Migi.
**Tommy | matchicalcom** [14:29 - 14:33]: Ich kann da total viel daraus ziehen, wie du es schon geschrieben hast, ist eine alte Version.
**Tommy | matchicalcom** [14:33 - 14:38]: Ich ziehe es um, adaptiere es, werde es vielleicht versuchen auf ein Sheet sogar zu bekommen.
**Tommy | matchicalcom** [14:38 - 14:41]: Weißt du, bei der Zentralreiter, vielleicht kriegen wir es auf einem hin.
**Tommy | matchicalcom** [14:41 - 14:47]: Wir müssen ja keine Deckungsbeiträge für uns Mitarbeiter rechnen, die haben wir ja nicht, die du da drinnen hattest.
**Tommy | matchicalcom** [14:47 - 14:51]: Da kann man nächste Woche, haben wir dann einen Stand, den wir dann diskutieren können.
**Tommy | matchicalcom** [14:51 - 14:57]: Also vielleicht kannst du kurz ergänzen, dass das bis nächste Woche definitiv da ist.
**Konsti | matchicalcom** [14:57 - 15:00]: Also da nächste Woche.
**Tommy | matchicalcom** [15:03 - 15:05]: Genau, machen wir.
**Niklas | matchicalcom** [15:05 - 15:09]: Es dann wieder am Dienstag oder Mittwoch, oder?
**GIRKE Michael** [15:10 - 15:15]: Nächste Woche bin ich tatsächlich einfach nicht da, sage ich jetzt gleich mal ab.
**GIRKE Michael** [15:15 - 15:16]: Das ist der neunte hier.
**GIRKE Michael** [15:16 - 15:18]: Der neunte, habt ihr den eingetragen?
**Tommy | matchicalcom** [15:18 - 15:20]: Ah, der neunte, ja, ja, mach neunte bitte, Konsti.
**Tommy | matchicalcom** [15:20 - 15:24]: Neunte, den sage ich jetzt ab, nur zur Sicherheit, dann bist du übernächste Woche.
**Konsti | matchicalcom** [15:24 - 15:26]: Wieder da, oder Thomas?
**Konsti | matchicalcom** [15:26 - 15:29]: Weil an dem Neunte haben wir den Call mit Nosa.
**Tommy | matchicalcom** [15:31 - 15:34]: Den habe ich noch nicht im Kalender, den habe ich dir.
**Konsti | matchicalcom** [15:34 - 15:36]: Eigentlich weitergeleitet, aber den schicke ich dir nochmal.
**Tommy | matchicalcom** [15:36 - 15:37]: Okay.
**Tommy | matchicalcom** [15:41 - 15:45]: Terminorganisation machen wir später, aber Migi, du bist dann übernächste Woche wieder da, oder?
**GIRKE Michael** [15:45 - 15:48]: Da bin ich wieder da, da habe ich es drinstehen, 16.
**GIRKE Michael** [15:48 - 15:50]: Mittwoch bis.
**Konsti | matchicalcom** [15:56 - 15:57]: Thema Hiring.
**Tommy | matchicalcom** [15:58 - 15:59]: Ja, weil es mein Thema war.
**Tommy | matchicalcom** [15:59 - 16:06]: Genau, wir haben festgelegt, zwei Jobprofile, die wir eigentlich benötigen würden.
**Tommy | matchicalcom** [16:07 - 16:11]: Einmal einen Outsystems Entwickler und einen UX UI Designer.
**Tommy | matchicalcom** [16:12 - 16:16]: Wir haben da Stellenanforderungen einmal definiert.
**Tommy | matchicalcom** [16:16 - 16:22]: Wir haben schon einmal bis im eigenen Netzwerk geschaut, kommen dann aber zum Conclusio, oder was haben wir gemacht?
**Tommy | matchicalcom** [16:22 - 16:26]: Wir haben Quellen, genau, von Jobboards, das ist erledigt.
**Tommy | matchicalcom** [16:26 - 16:33]: Da gibt es ja eine erste Indikation, die kosten aber einiges an Geld.
**Tommy | matchicalcom** [16:33 - 16:36]: Wir müssen uns einfach überlegen, wo wir die klug ausschreiben.
**Tommy | matchicalcom** [16:36 - 16:44]: Wir schauen jetzt Richtung Polen und Bord Portugal einmal, weil das quasi die Hotspots sind, Outsystems kommt aus Portugal.
**Tommy | matchicalcom** [16:44 - 16:48]: Wer dumm da nicht nach Leuten zu suchen, was Outsystems angeht.
**Tommy | matchicalcom** [16:48 - 16:53]: Und ux Ui ist Polen auch Hochland.
**Tommy | matchicalcom** [16:54 - 17:02]: Wir haben da eigentlich mit der Designbude theoretisch eine Möglichkeit, über die einzukaufen.
**Tommy | matchicalcom** [17:02 - 17:07]: Wir haben jetzt auch letzte Woche wieder für Design dazu gekauft.
**Tommy | matchicalcom** [17:07 - 17:16]: Also wir haben da mal wieder jemanden dazu genommen und wir haben auch wieder gemerkt, dass das quasi wie eine Schlüsselrolle für uns ist.
**Tommy | matchicalcom** [17:16 - 17:30]: Also das ist so der Connect zwischen du hast eine Idee und du kannst es in die Entwicklung geben, ist genau dieser UX UI Bereich, der uns extrem, der uns extrem boostet, um den Connect zu bringen, oder?
**Konsti | matchicalcom** [17:30 - 17:33]: Also Jungs, ihr stimmt zu auf jeden Fall.
**Tommy | matchicalcom** [17:38 - 17:39]: Genau.
**Tommy | matchicalcom** [17:39 - 17:42]: Und auch auf der Entwicklungsseite ist es genau das gleiche.
**Tommy | matchicalcom** [17:42 - 17:47]: Umso besser, umso schneller wir da mehr Kapazitäten kriegen und sich kannst du um die wichtigen Dinge kümmern.
**Tommy | matchicalcom** [17:47 - 17:54]: Also wichtigen Dinge, AI Sachen und die Core Entwicklung im Backend quasi, wenn man die übergeben können.
**Tommy | matchicalcom** [17:55 - 17:56]: Das sind die zwei Dinge.
**Tommy | matchicalcom** [17:56 - 17:56]: Wir sind da dran.
**Tommy | matchicalcom** [17:57 - 18:04]: Wir würden jetzt einmal ausschreiben und die Stellenprofile sind auch definiert.
**Tommy | matchicalcom** [18:04 - 18:06]: Und wir nehmen einmal die Jobboards, die kostenlos sind.
**Tommy | matchicalcom** [18:06 - 18:11]: Wir haben jetzt eine Liste von Jobboards, die wir recherchiert haben, da schreiben wir kostenlos aus.
**Tommy | matchicalcom** [18:11 - 18:24]: Dann wird man mal vielleicht ein, zwei Wochen warten und wenn dann nichts kommt, dann müssen wir überlegen, ob man invest gehen und einfach einmal oder das wäre so jetzt mein Vorschlag an der Stelle.
**Konsti | matchicalcom** [18:26 - 18:34]: Das einzige offene Thema, das wir da hatten, Micky, wo wir vielleicht auch mal kurz gerne deine Meinung hören wollen, ist eben das, was wir letzte Woche gemacht haben.
**Konsti | matchicalcom** [18:34 - 18:37]: Das war eher so opportunity bedingt, weil wir kennen die ganz gut.
**Konsti | matchicalcom** [18:37 - 18:48]: Und mich hat der Kollege angehauen, der Dimitri von dieser Agency und hat gemeint, ein Kunde hat spontan Sommerpause eingelegt und sie hätten jetzt einen Designer, der für uns schon ein paar mal abgestellt war, übrig.
**Konsti | matchicalcom** [18:48 - 18:51]: Und dann habe ich mit ihm eigentlich €45 als Rate ausgemacht.
**Konsti | matchicalcom** [18:52 - 18:56]: Sie rechnen dann immer ein bisschen was drauf mit extra Zeit und so weiter, um dann doch wieder hochzukommen.
**Konsti | matchicalcom** [18:56 - 18:57]: Das ist ja meistens egal.
**Konsti | matchicalcom** [18:57 - 18:59]: Was ist im Endeffekt wichtig?
**Konsti | matchicalcom** [18:59 - 19:04]: Wir denken so der Value von Money, also der Designer ist derjenige, der uns bisher am meisten schon geliefert hat.
**Konsti | matchicalcom** [19:05 - 19:13]: Und wir könnten da auch kurzfristig Design einkaufen, wissen aber, wenn wir das vergleichen mit wir würden jemanden hiren, zahlen wir halt einfach Faktor zwei, weil Agency ist ja klar.
**Konsti | matchicalcom** [19:15 - 19:20]: Unsere Frage ist, die ist konkreter zu beantworten, haben wir auch gesagt, wir schauen uns unsere Cashflow Excel an, wenn wir sie haben.
**Konsti | matchicalcom** [19:20 - 19:25]: Jetzt haben wir es so grob im Kopf und wissen, okay, der Cashflow steigt auf jeden Fall um ein gutes Stück.
**Konsti | matchicalcom** [19:25 - 19:35]: Aber trotzdem, was wäre denn deine Meinung bezüglich, weil ein Higher ist halt einfach noch wahrscheinlich ein paar Monate entfernt, bis man ihn wirklich gefunden hat, der aus seinem Job raus ist und whatever.
**Konsti | matchicalcom** [19:35 - 19:42]: Deswegen, wie stehst du dazu, wenn wir okay, der Speed, den wir jetzt einkaufen, ist zum Teil echt immens, sogar dann, wenn Cashflow tight ist.
**Konsti | matchicalcom** [19:42 - 19:44]: Würdest du sagen, wenn es sinnvoll ist, macht es immer Sinn?
**Konsti | matchicalcom** [19:45 - 19:46]: Ich würde sagen, es macht immer Sinn.
**GIRKE Michael** [19:47 - 19:48]: Ihr seid ja in einem.
**GIRKE Michael** [19:48 - 19:55]: Also wenn ihr jetzt erfolgreich seid, dann ist das ja, dann ist doch alles dafür zu tun, diesen Erfolg zu stützen.
**GIRKE Michael** [19:55 - 19:58]: Und da ist Sparsamkeit aus meiner Sicht der falsche Weg.
**GIRKE Michael** [19:58 - 20:04]: Also praktisch der falsche Weg, weil man hat ja nur so Windows of Opportunities.
**GIRKE Michael** [20:04 - 20:06]: Vielleicht ist auch erst länger, aber vielleicht ist es auch kurz.
**GIRKE Michael** [20:06 - 20:10]: Also deswegen würde ich da reinbuttern, was geht, wenn ich jetzt und dann.
**GIRKE Michael** [20:10 - 20:16]: Und wenn ihr jemand habt, mit dem ihr schon eingearbeitet seid, das ist ja auch das.
**GIRKE Michael** [20:16 - 20:23]: Also wenn neuen externen, das wisst ihr auch selber, das kostet manchmal so viel Zeit, wieder einen neuen externen onzuboarden, dann ist der erste schlecht.
**GIRKE Michael** [20:23 - 20:34]: Also würde ich lange rede, also das Geld würde ich sofort ausgeben, wenn ich es hätte in Richtung Wachstum, abarbeiten von Dingen, wenn das die Frage war.
**Tommy | matchicalcom** [20:37 - 20:38]: Ja, das war die Frage.
**Tommy | matchicalcom** [20:40 - 20:46]: Das war ganz klar die Frage und wir haben sie auch schon so beantwortet, dass wir es tun, auch wenn wir halt das Doppelte dafür bezahlen.
**Tommy | matchicalcom** [20:46 - 20:51]: Also Karl heißt der gute Mann, wir kriegen da echt guten Input.
**Tommy | matchicalcom** [20:52 - 20:59]: Aber nichtsdestotrotz sollten wir trotzdem, glaube ich, versuchen, die Key Rolle dann intern zu besser mit der Zeit, oder?
**GIRKE Michael** [21:00 - 21:01]: Das wäre das zweite.
**GIRKE Michael** [21:01 - 21:07]: Also weil wenn du sagst, es ist eine Key Rolle, ja, dann müsst ihr so schnell wie möglich besetzen, weil es dann ja ein Schlüssel ist.
**GIRKE Michael** [21:09 - 21:14]: Wenn ihr sagt Schlüssel für das Design, für die Lösung, dass er weitergekauft wird, dann braucht er das natürlich in Haus.
**Tommy | matchicalcom** [21:15 - 21:19]: Das Thema ist vielleicht um es noch mal kurz zu erklären, was da der Punkt ist.
**Tommy | matchicalcom** [21:20 - 21:29]: Also was wir einfach merken ist die Lösung wieder größer und größer und wir haben einfach viele Features.
**Tommy | matchicalcom** [21:29 - 21:45]: Wir haben verhältnismäßig noch wenige Features drinnen, aber wir tun uns jetzt schon teilweise schwer, dass die User von alleine überhaupt schon verstehen, wie die Features funktionieren, weil obwohl wir schon sehr gutes Design haben, ist es noch immer nicht immer intuitiv genug.
**Tommy | matchicalcom** [21:46 - 21:47]: Und das ist das erste.
**Tommy | matchicalcom** [21:47 - 21:50]: Also da gibt es an der redesign Front schon einiges zu tun.
**Tommy | matchicalcom** [21:50 - 22:04]: Plus, wenn wir Ideen haben, Kons wie ich, wir sprechen über einen Workflow, dann ist es extrem schwer aktuell das Richtung Chico zu transportieren, ohne dass wir ganz viel auf.
**Tommy | matchicalcom** [22:05 - 22:10]: Wenn wir keine guten Mockups haben und die Mockups sind genau das Mittelding.
**Tommy | matchicalcom** [22:10 - 22:18]: Wenn jemand ein gutes Design System aufgebaut hat, schießt er die Screens raus und wir können sofort sagen ja, das ist richtig, das ist falsch oder haben wir was übersehen?
**Tommy | matchicalcom** [22:18 - 22:19]: Wie muss das funktionieren?
**Tommy | matchicalcom** [22:20 - 22:26]: Und quasi Chico hat dann schon Pixel Perfect Mockups mehr oder minder und ist in der Entwicklung vom Frontend.
**Tommy | matchicalcom** [22:27 - 22:31]: Faktor 10 ist vielleicht jetzt übertrieben, aber Faktor fünf sicher, oder?
**Tommy | matchicalcom** [22:31 - 22:34]: Also du bist sicher fünfmal so schnell.
**Niklas | matchicalcom** [22:35 - 22:37]: Die Prozesse werden schneller klarer.
**GIRKE Michael** [22:38 - 22:39]: Klingt doch super.
**GIRKE Michael** [22:40 - 22:42]: Klingt doch noch ein super Weg.
**GIRKE Michael** [22:42 - 22:47]: Also genau so zweistufiges Design und das erste über das Mockup, wenn es bei euch gut hinhaut.
**GIRKE Michael** [22:47 - 22:54]: Ich kann mir das gut vorstellen und wenn der euch auch gut versteht zum Schluss ist ja häufig echt tatsächlich auch eine Qualität von Menschenfrage.
**GIRKE Michael** [22:55 - 22:56]: Probierst du das mit dem nächsten?
**GIRKE Michael** [22:56 - 22:58]: Sagst du der Prozess ist scheiße, weil der.
**Konsti | matchicalcom** [22:59 - 23:00]: Das ist genau das.
**Konsti | matchicalcom** [23:00 - 23:02]: Wir haben das jetzt schon zweimal gemacht.
**Konsti | matchicalcom** [23:02 - 23:05]: Also beim ersten Mal so, da hat es auch schon geholfen.
**Konsti | matchicalcom** [23:05 - 23:07]: Da hatten wir uns aber zu wenig Gedanken davor gemacht.
**Konsti | matchicalcom** [23:07 - 23:08]: Und diesmal war es jetzt.
**Konsti | matchicalcom** [23:08 - 23:17]: Das war letzte Woche so in der Phase oder was vorletztes Woche, das wirklich die uns davor DDC Zeit genommen haben mit was wollen wir eigentlich in Auftrag geben?
**Konsti | matchicalcom** [23:17 - 23:22]: Das ein bisschen konkreter auch ausformuliert haben und ich in dem Video auch länger erklärt habe mit dem Call besser gesagt.
**Konsti | matchicalcom** [23:22 - 23:26]: Und dann habe ich mit denen jeden Tag 20 Minuten Check in gemacht, halbe h Check in.
**Konsti | matchicalcom** [23:26 - 23:27]: Das hat super geholfen.
**Konsti | matchicalcom** [23:27 - 23:28]: Also die Outputs waren wirklich.
**Konsti | matchicalcom** [23:28 - 23:32]: Diesmal haben wir wirklich gute Results bekommen in kürzester Zeit.
**GIRKE Michael** [23:33 - 23:36]: Deswegen gibt es noch keine andere Wahl.
**GIRKE Michael** [23:36 - 23:44]: Also da müsst ihr den jetzt, da müsst ihr den jetzt warm halten für €45 einfach mitnehmen auf die Reise und dann werbt er den halt ab.
**GIRKE Michael** [23:44 - 23:45]: Das ist da eine Idee.
**Konsti | matchicalcom** [23:48 - 23:49]: Das wird nicht funktionieren.
**Tommy | matchicalcom** [23:51 - 23:56]: Für das ist der Konstitu mit den Firmen in Hawa.
**Konsti | matchicalcom** [23:56 - 23:59]: Also das ist auch schon seit 10 Jahren oder sowas.
**Tommy | matchicalcom** [24:04 - 24:08]: Unter zwei und der zweite Case und der Dev ist auch klar, der macht auch total viel Sinn.
**Tommy | matchicalcom** [24:09 - 24:11]: Da Konsti erstes Gespräch geführt.
**Tommy | matchicalcom** [24:13 - 24:16]: Also wir haben da zwei vielleicht einer war gar nichts.
**Tommy | matchicalcom** [24:16 - 24:17]: Einer war gar nichts.
**Tommy | matchicalcom** [24:17 - 24:32]: Der wollte irgendwie auch aus Portugal aus Remote irgendwie €90 in der h und das war eher so ein Freelancer, aber konnte vor einem Jahr oder eineinhalb Jahren mit jemandem auf der Autism Seite eine Agentur schon gearbeitet.
**Tommy | matchicalcom** [24:33 - 24:34]: Du hast mit dem schon einmal gesprochen.
**Tommy | matchicalcom** [24:34 - 24:35]: Genau.
**Konsti | matchicalcom** [24:35 - 24:38]: Heißt der, mit dem habe ich schon mal drei Monate zusammengearbeitet.
**Konsti | matchicalcom** [24:38 - 24:46]: Der ist gut, der hat eine schnelle Auffassungsgabe, der denkt sich rein und kann genau den tech Stack von uns.
**Konsti | matchicalcom** [24:46 - 24:49]: Also deswegen, den müssten wir halt abwerben.
**Konsti | matchicalcom** [24:49 - 24:52]: Aus der Consultancy, mit denen ich eigentlich auch ein bisschen Kontakte habe.
**Konsti | matchicalcom** [24:52 - 24:55]: Ist ein bisschen shady, aber wir sind ein Startup, mein Gott, so machen die das.
**Konsti | matchicalcom** [24:57 - 25:02]: Und ja, mit dem sind wir jetzt mal so verblieben, dass er schaut sich das auch ein bisschen an, was wären denn die Modelle, wie könnte man es machen?
**Konsti | matchicalcom** [25:02 - 25:07]: Am besten wäre nicht, dass wir ihn über einen Payroller hiren, sondern dass er irgendwie Freelancer ist, in Anführungszeichen.
**Konsti | matchicalcom** [25:07 - 25:09]: Wäre auch für ihn steuerlich von Vorteil.
**Konsti | matchicalcom** [25:11 - 25:13]: Momentan hat er gesagt, er ist gerade dabei ein Haus zu kaufen.
**Konsti | matchicalcom** [25:13 - 25:21]: Das wäre für die Bank nicht optimal, aber so in einem Zeitfenster von drei bis vier, fünf Monaten kann man auf jeden Fall konkreter werden.
**Konsti | matchicalcom** [25:22 - 25:24]: Also da ist auf jeden Fall jemand in der Pipeline.
**Konsti | matchicalcom** [25:24 - 25:35]: Aber jetzt auch in Bezug auf unseren Dev Prozess, muss ich ganz ehrlich sagen, ich bin der Meinung, wenn wir die Designflanke besser gelöst haben, ist die DevPower, die wir eigentlich haben, auch schon ziemlich impressive.
**Konsti | matchicalcom** [25:35 - 25:39]: Also ich habe davor die Prio höher gesehen beim Dev als beim Designer.
**Konsti | matchicalcom** [25:39 - 25:45]: Jetzt bin ich eigentlich wieder andersrum, weil den Dev musst du ja auch koordinieren und die Codebase, die muss von der Qualität her immer hoch bleiben.
**Konsti | matchicalcom** [25:45 - 25:47]: Beim Design sieht man sofort, wenn Floors drin sind, beim Code nicht.
**Konsti | matchicalcom** [25:48 - 25:53]: Deswegen, kleineres Dev Team hat schon auch seine Vorteile und momentan haben wir kein krasses Speed Bottleneck.
**GIRKE Michael** [25:55 - 25:58]: Gut, aber es klingt alles total vernünftig.
**GIRKE Michael** [25:58 - 26:02]: Genau, weil es schafft ja immer Entropie, einfach zu viele Leute zu haben.
**GIRKE Michael** [26:03 - 26:05]: Kein guter Faktor für Qualität.
**Tommy | matchicalcom** [26:05 - 26:06]: Nein, absolut.
**Tommy | matchicalcom** [26:06 - 26:08]: Aber der Punkt ist, wir sollten es mal ausschreiben.
**Tommy | matchicalcom** [26:08 - 26:10]: Wir sollten schauen, was mit Video passiert.
**Tommy | matchicalcom** [26:10 - 26:11]: Ux, ui.
**Tommy | matchicalcom** [26:11 - 26:14]: Absolut auf die Prio setzen, da haben wir ja Möglichkeiten.
**Tommy | matchicalcom** [26:14 - 26:18]: Aber den Dev sollte man, wer weiß, wie lange es dauert, bis da wirklich der passende dabei ist.
**Tommy | matchicalcom** [26:18 - 26:23]: Wir haben auch gesagt, es ist auch so, if it's not a hell, yes, it's a hell no.
**Tommy | matchicalcom** [26:23 - 26:39]: Also es ist wirklich, es ist einfach, wir brauchen ganz klar Leute an der Stelle, die wirklich, also 100 % ist jetzt übertrieben, aber die einen sehr, sehr hohen fit auf der menschlichen als auch auf der inhaltlichen Seite mitbringen.
**Tommy | matchicalcom** [26:40 - 26:42]: Vor allem, weil wir so klein sind.
**Tommy | matchicalcom** [26:43 - 26:49]: Wenn da einer ist, der nicht, nicht ganz gut dazu passt, wird es sofort schwierig, weißt du?
**Tommy | matchicalcom** [26:49 - 26:53]: Also haben wir beim Lukas gemerkt, der war jetzt kein.
**Tommy | matchicalcom** [26:53 - 26:53]: Ja, genau.
**Tommy | matchicalcom** [26:53 - 26:55]: Ja, das zieht sofort runter.
**GIRKE Michael** [26:55 - 27:00]: Ja, nee, aber es klingt doch gut übrigens, fällt mir gerade ein, also ihr seid doch antizyklisch jetzt unterwegs.
**GIRKE Michael** [27:00 - 27:02]: Also es ist ja eher weniger los am Jobmarkt.
**GIRKE Michael** [27:02 - 27:11]: Also es ist doch gut, jetzt vielleicht die Angel rauszuwerfen und vielleicht kommt ja wirklich der top Kandidat mir fällt gerade ein, habt ihr vielleicht mitgekriegt, dass z.B.
**GIRKE Michael** [27:11 - 27:13]: monster, die waren früher zumindest mal bekannt.
**GIRKE Michael** [27:13 - 27:14]: Kennt ihr die noch?
**GIRKE Michael** [27:14 - 27:15]: Monster als.
**Tommy | matchicalcom** [27:16 - 27:17]: Nein, Monster.
**GIRKE Michael** [27:21 - 27:22]: Die Plattform.
**GIRKE Michael** [27:22 - 27:23]: Also die Plattform Monster.
**GIRKE Michael** [27:26 - 27:27]: Also die war jetzt beim.
**GIRKE Michael** [27:27 - 27:32]: Also die war vor 1010 Jahren vielleicht mal so, die sind pleite gegangen.
**GIRKE Michael** [27:32 - 27:34]: Das ist erstaunlich, was so alles passiert in der Industrie.
**GIRKE Michael** [27:34 - 27:41]: Aber da, wer weiß, könnte man sogar gezielt schauen, weil die müssen ja ähnliche Programmiererfahrung haben, so Plattformen.
**GIRKE Michael** [27:43 - 27:44]: Aber es ist natürlich international Monster.
**GIRKE Michael** [27:44 - 27:47]: Ich glaube, ich war eine amerikanische Firma.
**Tommy | matchicalcom** [27:47 - 27:48]: Ja, ich wusste nicht, dass die k.
**Tommy | matchicalcom** [27:48 - 27:48]: O.
**Tommy | matchicalcom** [27:48 - 27:49]: Sind.
**GIRKE Michael** [27:49 - 27:51]: Also war eine Meldung, dass die insolvent sind.
**GIRKE Michael** [27:51 - 27:57]: Also die werden ja manchmal nach der Insolvenz wieder gerettet, aber erstmal sind sie insolvent.
**Tommy | matchicalcom** [27:58 - 28:04]: Wundert mich nicht, wenn man so sieht, was die schon verlangen, wenn du nur Jobs ausschreiben willst, wie teuer das ist.
**Tommy | matchicalcom** [28:07 - 28:10]: Aber passt, dann hat man den Punkt abgeschlossen.
**Tommy | matchicalcom** [28:11 - 28:14]: Collaboration haben wir gesagt, nach dem Perfekt.
**Tommy | matchicalcom** [28:14 - 28:16]: Aber was haben wir Produktentwicklung gemacht?
**Tommy | matchicalcom** [28:16 - 28:19]: Ah, Chico, du musst rein, du musst raus.
**Niklas | matchicalcom** [28:21 - 28:22]: Aber ich war kurz gemutet.
**Niklas | matchicalcom** [28:22 - 28:28]: Aber wir sollten uns vielleicht noch Gedanken machen, ob wir für UX UI noch andere Leute in unserem Netzwerk kennen oder halt Entwickler.
**Niklas | matchicalcom** [28:28 - 28:32]: Oder glaubt ihr, wir haben schon relativ unser Netzwerk abgeklappert?
**Konsti | matchicalcom** [28:33 - 28:37]: Also Outsystems Entwicklernetzwerk ist relativ abgeklappert, würde ich sagen.
**Konsti | matchicalcom** [28:38 - 28:45]: Also man kann da vom Netzwerk her weitergehen, aber an sich ist es ja schon wirklich am besten Chancen hat man eigentlich bei den Leuten, die auch einen Job suchen.
**Konsti | matchicalcom** [28:45 - 28:46]: Also macht ja auch Sinn vom Timing.
**Niklas | matchicalcom** [28:48 - 28:50]: Weil das persönlich ja sehr wichtig ist.
**Tommy | matchicalcom** [28:52 - 29:00]: Und auf der UX UI Seite natürlich könnte man jetzt irgendwo auf Freelance oder irgendwo aufschauen und auch in Deutschland es die gerade um €50.
**Tommy | matchicalcom** [29:00 - 29:15]: Ich muss ehrlicherweise sagen, ich denke, es ist so wichtig, dass wir da keine Projekthure suchen, sondern wirklich jemanden, der Bock hat, das Produkt zu gestalten für die nächsten Jahre quasi.
**Tommy | matchicalcom** [29:15 - 29:22]: Das ist so etwas, das ist ein anderes Mindset, was wir da suchen, der wirklich da wirklich tief in diese Thematik rein will.
**Tommy | matchicalcom** [29:22 - 29:28]: Und darum denke ich, sollte man das schon wirklich in Richtung Festanstellung suchen.
**Tommy | matchicalcom** [29:29 - 29:33]: Und da habe ich kein Netzwerk externer.
**Tommy | matchicalcom** [29:33 - 29:39]: Ja, es gibt, sagte Manu, er kriegt ein bisschen was, er sucht sofort jemanden und schickt uns drei Profile in zwei Tagen.
**Tommy | matchicalcom** [29:39 - 29:43]: Aber ich glaube, das ist nicht das, wo wir hin sollten.
**Niklas | matchicalcom** [29:44 - 29:45]: Voll, denke ich.
**Niklas | matchicalcom** [29:45 - 29:45]: Genau.
**Konsti | matchicalcom** [29:45 - 29:45]: Gleich.
**Tommy | matchicalcom** [29:50 - 29:52]: Nächste Produktentwicklung.
**Tommy | matchicalcom** [29:52 - 29:53]: Also Chico, du bist jetzt raus, oder?
**Niklas | matchicalcom** [29:54 - 29:55]: Ich muss jetzt leider raus, genau.
**Niklas | matchicalcom** [29:55 - 29:59]: Ich habe jetzt ein Uni Meeting, deswegen besprechen wir uns aber falls irgendwas gibt.
**Tommy | matchicalcom** [30:00 - 30:01]: Ja, wir hören uns später.
**Tommy | matchicalcom** [30:01 - 30:01]: Bis später.
**Konsti | matchicalcom** [30:06 - 30:06]: Genau.
**Konsti | matchicalcom** [30:06 - 30:08]: Was ist für Produktentwicklung wichtig?
**Konsti | matchicalcom** [30:08 - 30:19]: Wir haben unseren, also können wir nur vielleicht kurz zusammenfassen, weil da sind wir ziemlich up to date Migi, aber wir haben im Endeffekt, also wir haben unseren Prozess aufgegleist, den wir haben wollen.
**Konsti | matchicalcom** [30:19 - 30:21]: Einfach ein bisschen mehr so ein Scrum Prozess, wie man klassisch entwickelt.
**Konsti | matchicalcom** [30:21 - 30:23]: Thomas, kannst du vielleicht ganz kurz den Korinth Filter reinmachen?
**Tommy | matchicalcom** [30:23 - 30:24]: Danke dir.
**Konsti | matchicalcom** [30:27 - 30:28]: Das läuft an sich gut.
**Konsti | matchicalcom** [30:28 - 30:33]: Also wie gesagt, wir sind jetzt deutlich mehr, davor waren wir eher jo, es fliegt im Kopf rum und sonst was.
**Konsti | matchicalcom** [30:33 - 30:35]: Jetzt haben wir wirklich einen ganz klaren Backlog.
**Konsti | matchicalcom** [30:35 - 30:42]: Wir haben zu dem Backlog auch noch ein bisschen höher gefasst, die Roadmap auch sogar mal auf dem Slide Deck, weil festgestellt haben, die Unternehmensberatungen wollen Slide sehen.
**Konsti | matchicalcom** [30:45 - 30:46]: Und genau da sind wir eigentlich ziemlich.
**GIRKE Michael** [30:46 - 30:50]: Und jetzt sind wir auch und das kommt an und okay, super.
**GIRKE Michael** [30:51 - 30:55]: Und was nutzt dafür jetzt genau eigentlich als Assistent?
**Konsti | matchicalcom** [30:55 - 30:58]: Wir nehmen hier Notion, das ist dieses eine, da managen wir gerade alles.
**Konsti | matchicalcom** [30:58 - 31:04]: Da haben wir unsere Dokumente drin, da sind legal Sachen drin, da sind eben Financials.
**Konsti | matchicalcom** [31:04 - 31:06]: Das ist das einzige, wo wir sagen, ich mache ein Excel, obviously.
**Konsti | matchicalcom** [31:06 - 31:15]: Aber hier können wir auch unsere, also ganz simpel, ich meine am Ende braucht man ein Board, wo die Items drinstehen, man reinschreibt, was Sache ist und sie auch weiterzieht und fertig.
**GIRKE Michael** [31:15 - 31:20]: Und blöde Frage, also fürs Coding nutzt ihr da schon AI Sachen und Testing?
**Konsti | matchicalcom** [31:23 - 31:33]: Fürs Coding nutzen wir AI Sachen im Programmieren selbst nicht, einfach aus den Gründen, dass unsere Technologie da nicht in Anführungszeichen mit den AI Coding Sachen kompatibel ist.
**Konsti | matchicalcom** [31:34 - 31:46]: Aber bei der sozusagen, also alles was mit den AI Flows und so zu tun hat, Prompts und so weiter, nutzen wir die ganze Zeit AI logischerweise und auch Denken, Architektur und Co.
**Konsti | matchicalcom** [31:47 - 31:48]: Da nutzen wir auch viel.
**Konsti | matchicalcom** [31:48 - 31:57]: Also wir benutzen AI überall da, außer wir tun kein Code produzieren, aber ich schaue mir das immer ziemlich intensiv an und schaue mir Interviews meine.
**GIRKE Michael** [32:01 - 32:01]: Es ist.
**Konsti | matchicalcom** [32:01 - 32:05]: Nichts, wo man gerade momentan stabil Enterprise Software drauf aufbauen kann.
**Konsti | matchicalcom** [32:05 - 32:05]: Noch nicht.
**GIRKE Michael** [32:06 - 32:08]: Okay, verstehe ich, verstehe ich, verstehe ich gut.
**Tommy | matchicalcom** [32:10 - 32:35]: Kann ich von meiner Seite auch sagen, weil ich kümmere mich ja um das ganze CV Export Thema, das ist ausgelagert, da sind wir auf Python unterwegs und auch da, also es hilft schon mal, um eine Idee zu bekommen, aber ich würde niemals mich traue, eine ganze Funktion oder sowas da ins Produktiv reinzuhängen, weil das einfach schon noch nicht genau das tut, was es tun soll.
**Tommy | matchicalcom** [32:35 - 32:43]: Also du kriegst eine erste Idee und er sagt, das kannst du so so lösen, aber wenn es dann genauer hinschaust, findest immer irgendwas, was nicht läuft.
**Tommy | matchicalcom** [32:43 - 32:55]: Und weißt du, wenn du halt dann auf einmal 200, 300 Zeilen hast und du weißt nicht, wo ist der Fehler und du hast es nicht selbst geschrieben, dann hast du keine Chance mehr zu finden.
**GIRKE Michael** [32:55 - 33:05]: Das verstehe ich auch total, weil genau, auch wenn du vielleicht ein bisschen langsamer bist, zumindest hast du es im Kopf, wo was ist und du hast sofort Zusammenhänge, wenn was schief läuft.
**GIRKE Michael** [33:05 - 33:06]: Das ist verständlich.
**Tommy | matchicalcom** [33:06 - 33:06]: Danke.
**Konsti | matchicalcom** [33:09 - 33:10]: Das monitoren wir auf jeden Fall.
**Konsti | matchicalcom** [33:10 - 33:16]: Wir sind ein bisschen limitiert von unserer Technologie, aber die Limitation ist eigentlich immer noch ein Win, weil das Abstraction Layer ist höher.
**Konsti | matchicalcom** [33:16 - 33:19]: Wir sind wahnsinnig schnell, was Programmieren angeht, bin ich der Meinung.
**Konsti | matchicalcom** [33:21 - 33:30]: Genau, Sales wise, genau, CRM haben wir uns auch darauf geeinigt, machen wir jetzt mal noch nicht so richtig, weil wir sind ja noch nicht so richtig im.
**Konsti | matchicalcom** [33:30 - 33:32]: Wir hauen hunderte Leads an und whatever.
**Konsti | matchicalcom** [33:32 - 33:40]: Der Daniel hat da ein bisschen im Prozess, der hat sich das in LinkedIn und Google Sheet dafür gemacht, wo er das ein bisschen trackt.
**Konsti | matchicalcom** [33:40 - 33:47]: Aber ansonsten haben wir einfach hier bei uns in Notion sozusagen für jeden Kunden auch irgendwo ein Item, wo wir okay, was haben wir mit dem Kunden ausgemacht?
**Konsti | matchicalcom** [33:47 - 33:49]: Was sind die Milestones für den Kunden und so weiter.
**Konsti | matchicalcom** [33:52 - 33:54]: Aktive Kunden, Wavestone, Wavestone passiert jetzt langsam was.
**Konsti | matchicalcom** [33:55 - 34:02]: Der Thomas war ja sehr bemüht eigentlich über lange Zeit auch zu zeigen, dass mehr Potenzial da ist.
**Konsti | matchicalcom** [34:02 - 34:08]: Und eben bei SCS, bei allen wird es immer mehr angenommen und jetzt wollen sie auch weitermachen.
**Konsti | matchicalcom** [34:08 - 34:19]: Das haben wir mit Oliver inzwischen ausgemacht, dass die gesamten intern von Beta reinkommen, damit STS sozusagen die interne Suche auch über Magical machen kann und sie das Matching mehr suchen.
**Konsti | matchicalcom** [34:19 - 34:21]: Also da geht es langsam einen Schritt mal vorwärts.
**Tommy | matchicalcom** [34:22 - 34:26]: Das vielleicht kurz dazuschreiben unter upscale flachplan im Juni.
**Tommy | matchicalcom** [34:26 - 34:30]: Also gebe ganz kurz dann genau, was der Konzi gesagt hat.
**Tommy | matchicalcom** [34:30 - 34:30]: Perfekt.
**Tommy | matchicalcom** [34:30 - 34:33]: Also es trägt Früchte.
**Tommy | matchicalcom** [34:33 - 34:37]: Ich denke, Manu und Inessa haben wir wirklich für uns gewonnen.
**Tommy | matchicalcom** [34:37 - 34:39]: Manu ist wirklich ein Fanboy.
**Tommy | matchicalcom** [34:39 - 34:46]: Also nicht, weil wir einen Bezirk haben, sondern weil er es einfach sieht, was es tut kann für ihn.
**Tommy | matchicalcom** [34:47 - 34:57]: Die Inessa hat auch verstanden, weil die haben sich jetzt Nata Wus und Nata Wus und Stuff oder so heißt das.
**Tommy | matchicalcom** [34:57 - 35:00]: Also nicht stuffit pro, sondern irgendwas französisches.
**Tommy | matchicalcom** [35:00 - 35:08]: Das ist halt ganz, also Napda beispielsweise ist ja sehr stark auf Billability, Chargeability.
**Tommy | matchicalcom** [35:08 - 35:13]: Also die sind sehr stark da ausgerichtet, die die haben quasi sehr, sehr, sehr wenig.
**Tommy | matchicalcom** [35:13 - 35:20]: Also Inessa und Manu mir berichtet für ihren, für den SDS Case oder für das ganze suchen und so absolut irrelevant.
**Tommy | matchicalcom** [35:20 - 35:22]: Und der Oliver hat das jetzt auch schon verstanden.
**Tommy | matchicalcom** [35:22 - 35:28]: Wir haben den Oliver quasi bei den beiden Terminen, also Termine stehen noch an, die Termine sind vorbei, aktueller Stand.
**Tommy | matchicalcom** [35:29 - 35:32]: Das hat total geholfen, ihm zu zeigen, wie entwickeln wir.
**Tommy | matchicalcom** [35:32 - 35:38]: Wir haben einen Showcase durch Magical gegeben, hat er verstanden, oh mein Gott, funktioniert ja.
**Tommy | matchicalcom** [35:38 - 35:43]: Einen Tag drauf haben sie Profile für Zeppelin gebraucht, die haben wir durch Magical gelassen.
**Tommy | matchicalcom** [35:43 - 35:49]: Der Oliver konnte in 12 Stunden maßgefertigte Profile anbieten, fand er super.
**Tommy | matchicalcom** [35:50 - 35:59]: Jetzt machen wir nächste Woche noch ein Update, aber jetzt ist ausgemacht, wir dürfen alle internen migrieren auf unser Beraterbudget.
**Tommy | matchicalcom** [35:59 - 36:04]: Also wir kriegen da fünf oder sechs Tage im Juli jetzt auf unser Beraterbudget, weil sie es anders nicht bekommen.
**Tommy | matchicalcom** [36:04 - 36:07]: Also sie fahren mit ihren anderen Sachen zurück.
**Tommy | matchicalcom** [36:07 - 36:08]: Eigentlich lächerlich, aber ist egal.
**Tommy | matchicalcom** [36:08 - 36:16]: Der Manu schreibt mir vor, eine kurze Klammer auf, er braucht nur €4000 für id Jobs wegen dem neuen Rahmenvertrag von der SBB.
**Tommy | matchicalcom** [36:17 - 36:23]: Es ist fast unmöglich, jetzt ein Budget von Euro zu bekommen, dass er Jobboards testen darf.
**Tommy | matchicalcom** [36:23 - 36:30]: Also es ist einfach nur, es tut mir leid, also das finde ich echt eine ganz traurige Geschichte eigentlich.
**Tommy | matchicalcom** [36:31 - 36:34]: Also Geld hin oder her, aber das behindert doch das Business.
**Konsti | matchicalcom** [36:39 - 36:51]: Eine konkrete Frage, Thomas, weil da bin ich gerade gar nicht up to date, aber eigentlich hatten wir mit Oliver, also das Angebot, das wir ihr geschickt haben, war, ihr kriegt die mal drei Monate rein und Die Migration und die drei Monate Nutzung kosten €5000.
**Konsti | matchicalcom** [36:51 - 36:53]: Jetzt machen wir es halt einfach über die Beauftragung.
**Konsti | matchicalcom** [36:53 - 36:55]: Aber danach haben wir gesagt, nein, da.
**Tommy | matchicalcom** [36:55 - 36:56]: Werden wir nichts bekommen.
**Tommy | matchicalcom** [36:56 - 36:58]: Nein, nein, nein, da kriegen wir nichts.
**Tommy | matchicalcom** [36:58 - 36:59]: Da werden wir nichts bekommen.
**Tommy | matchicalcom** [37:00 - 37:03]: Das müssen wir dann schauen, wenn wir dann im April oder so losstarten.
**Tommy | matchicalcom** [37:03 - 37:06]: Jetzt geht es einmal darum, dass sie einmal das Matching einmal testen wollen.
**GIRKE Michael** [37:06 - 37:13]: Also wir jetzt ist wahrscheinlich gut, ich mein, irgendwann könnte, müsste dann ja schon sagen, so, jetzt schalten wir das halt wieder ab, wenn er wirklich nichts zahlt.
**GIRKE Michael** [37:13 - 37:26]: Also irgendwie so, wird schon immer noch gut, jetzt noch die anzufüttern, weil Waveson ist ja immer noch einer der Top Kunden, jetzt auch immer noch auf der Liste und auch noch ein top Kandidat für nächstes Jahr mehr Budget.
**GIRKE Michael** [37:27 - 37:31]: Von daher ist es ja für euch auch bezahlte Akquise irgendwie so.
**GIRKE Michael** [37:33 - 37:43]: Aber irgendwann muss man denen vielleicht auch Druck machen, also weil sonst werden sie jetzt immer weiterkommen mit diesem Argument, weißt du, also so ein Tokschler, also sonst verselbstständigt sich das ja, du weißt ja, wir kriegen kein Budget.
**Konsti | matchicalcom** [37:44 - 37:50]: Ja, das Psychologische auch, weißt du, die machen wir wirklich.
**Tommy | matchicalcom** [37:53 - 38:06]: Ich glaube, es wäre jetzt keine gute Idee, wenn wir einen Teil Erfolg haben, quasi, dass das jetzt heißt, nehmt fünf oder sechs Tage von dem Beraterbudget, ihr könnt intern migrieren, wir wollen das Matching testen und wir oh, schön, aber das ist uns zu wenig.
**Tommy | matchicalcom** [38:06 - 38:10]: In drei Monaten wollen wir gleich sagen, wir wollen gleich €3 haben.
**GIRKE Michael** [38:12 - 38:14]: Nicht gleich, aber in drei Monaten würde ich das schon sagen.
**GIRKE Michael** [38:17 - 38:20]: Also wir haben das jetzt alles nicht gemacht, aber jetzt hier müssen wir schauen, wo wir bleiben.
**GIRKE Michael** [38:21 - 38:33]: Und da muss man vielleicht den Druck ein bisschen erhöhen, weil sonst wird immer dieses psychologische Element so, ja, du weißt ja, wir haben kein Budget, dann denken alle, der Tommy macht das alles halt für die 11 Tage und es wird immer so sein.
**GIRKE Michael** [38:34 - 38:36]: Und vielleicht muss man sie unter Druck setzen irgendwo.
**GIRKE Michael** [38:37 - 38:46]: Das hilft dann vielleicht dem Oliver auch wieder, wenn unter Druck ist und sagt, okay, jetzt müsste er irgendwas nicht nutzen, was wirklich was bringt vielleicht, dann wird er schon beim Carsten ein Budget kriegen.
**Konsti | matchicalcom** [38:48 - 38:50]: Also dann warten wir mal, dann lassen wir das erstmal machen.
**Konsti | matchicalcom** [38:50 - 38:55]: Wir geben das in zweieinhalb Monaten und dann klingeln wir an, dass das eigentlich in zwei Wochen läuft, ihre drei Monate.
**Tommy | matchicalcom** [38:56 - 38:57]: Das ist ja total cool.
**Tommy | matchicalcom** [38:57 - 39:04]: Und vielleicht auch der Manu sagt zu uns, hey, könnt ihr mir bitte gute Fragen geben?
**Tommy | matchicalcom** [39:04 - 39:07]: Ich will magical, ich will das auch mit euch machen.
**Tommy | matchicalcom** [39:08 - 39:17]: Und wenn ich einen Ausbieteranwalt, also wenn ich in Evaluierung kann ich dann schon gute Fragen stellen, damit die merken, das passt nicht.
**Tommy | matchicalcom** [39:17 - 39:21]: Also wir haben beste Situation, die man.
**GIRKE Michael** [39:21 - 39:25]: Haben kann, wenn der Kunde mitmacht, den Fragebogen zu definieren.
**Tommy | matchicalcom** [39:27 - 39:27]: So ist es.
**Tommy | matchicalcom** [39:27 - 39:35]: Und wir haben jetzt auch die Bianca, genau wie auch, da hat sich der Eddie und der Thorsten einmal auch, glaube ich, ein bisschen schuldig gefühlt.
**Tommy | matchicalcom** [39:35 - 39:36]: Auch da geht was weiter.
**Tommy | matchicalcom** [39:37 - 39:42]: Also wir, wie gesagt, ich glaube, da haben wir jetzt die richtigen Schritte initiiert, oder?
**Tommy | matchicalcom** [39:42 - 39:47]: Also am Ende des Tages, also da stehen wir jetzt einmal, kommen wir weiter.
**Tommy | matchicalcom** [39:47 - 39:49]: Mühsam, aber wir kommen weiter.
**Tommy | matchicalcom** [39:49 - 39:50]: Passt gut.
**Tommy | matchicalcom** [39:51 - 39:53]: Vielleicht magst du Cassini sagen, wo wir da stehen.
**Konsti | matchicalcom** [39:54 - 39:55]: Bei Cassini.
**Konsti | matchicalcom** [39:55 - 39:59]: Wir haben mit Cassini damals, als wir jetzt in Frankfurt waren, haben wir mit ihnen Milestones definiert.
**Konsti | matchicalcom** [40:00 - 40:02]: Die sind wir gerade dran.
**Konsti | matchicalcom** [40:02 - 40:03]: Die meisten halten wir für sehr realistisch.
**Konsti | matchicalcom** [40:03 - 40:11]: Eigentlich war unser erster Intent so, wir haben jetzt mal Milestones für die nächsten drei Monate fixiert und machen jetzt in vier Wochen fertig und dann machen wir weiter.
**Konsti | matchicalcom** [40:11 - 40:13]: Aber das wird wahrscheinlich nicht klappen.
**Konsti | matchicalcom** [40:15 - 40:18]: Aber wir werden wahrscheinlich schon schauen, dass wir auf jeden Fall mal easy zwei Wochen vorher fertig sind.
**Konsti | matchicalcom** [40:19 - 40:24]: Da haben wir jetzt nächste Woche, haben wir eigentlich das erste Jour fix oder ist diese Woche Freitag?
**Tommy | matchicalcom** [40:24 - 40:25]: Freitag.
**Tommy | matchicalcom** [40:25 - 40:25]: Freitag.
**Konsti | matchicalcom** [40:25 - 40:27]: Also in drei Tagen oder was?
**Konsti | matchicalcom** [40:27 - 40:28]: Freitag ist in drei Tagen.
**Konsti | matchicalcom** [40:29 - 40:30]: Vierte.
**Konsti | matchicalcom** [40:30 - 40:32]: Das ist am 4.
**Konsti | matchicalcom** [40:32 - 40:32]: Jun.
**Konsti | matchicalcom** [40:32 - 40:32]: 4.
**Konsti | matchicalcom** [40:32 - 40:34]: Jul.
**Konsti | matchicalcom** [40:34 - 40:35]: Genau.
**Konsti | matchicalcom** [40:36 - 40:37]: Internes Meeting.
**Konsti | matchicalcom** [40:37 - 40:42]: Wir haben schon mal drüber geredet, aber wir sollten das noch mal dediziert vielleicht nach dem Jour fix angehen.
**Konsti | matchicalcom** [40:42 - 40:49]: Also lasst es vielleicht direkt Montag oder am Dienstag machen oder eigentlich zum Sprint Planning.
**Konsti | matchicalcom** [40:49 - 40:49]: Das können wir.
**Konsti | matchicalcom** [40:49 - 40:51]: Oder wir machen sogar noch direkt am vierte.
**Konsti | matchicalcom** [40:51 - 40:53]: Lass es uns am vierte machen, nach dem Casini Call.
**Tommy | matchicalcom** [40:56 - 40:56]: Vielleicht.
**Tommy | matchicalcom** [40:56 - 40:58]: Aber kurzes Update dazu.
**Tommy | matchicalcom** [40:58 - 41:02]: Wir haben da, also es geht schon ein bisschen weiter, auch für dich Migi wichtig.
**Tommy | matchicalcom** [41:02 - 41:04]: Wir haben, also die nutzen das total.
**Tommy | matchicalcom** [41:05 - 41:18]: Wir haben dann noch für Data Board, also wir haben eigentlich nur deutsche Bahn bei Casenia mal in im POC drinnen gehabt, dann hat sich das anscheinend rumgesprochen, sind wir zu dem public Data Board Team gekommen.
**Tommy | matchicalcom** [41:18 - 41:24]: Data Board, der größte im Norden, kannte ich nicht, aber das ist doch okay.
**Tommy | matchicalcom** [41:24 - 41:25]: Kennst du?
**GIRKE Michael** [41:25 - 41:28]: Ich kenne es, also gibt es ja auch, gab es große öffentliche Ausschreibungen.
**Tommy | matchicalcom** [41:28 - 41:32]: Ja, genau, die Cassini hat da gewonnen und ist halt als GU da auch teilweise dabei.
**Konsti | matchicalcom** [41:33 - 41:33]: Die gehen über den GU.
**Tommy | matchicalcom** [41:34 - 41:38]: Die gehen über den GU, über die, die kriegen da ganz viele Ausschreibungen davon.
**Tommy | matchicalcom** [41:38 - 41:46]: Da haben wir jetzt auch schon, also da haben wir das Template schnell implementiert, sind wir auch schon auf dem 90 % Stand, da haben wir schon die Arme ausgefahren.
**Tommy | matchicalcom** [41:47 - 41:53]: Die finden das auch super, die sind auch wieder im Bereich mit 150 und der deutsche Bahnbereich ist sowieso klasse.
**Tommy | matchicalcom** [41:53 - 42:02]: Und auch der Konsti hat den Markus Iwanowski, das ist der Geschäftsführer von der Aleri, also die quasi das Stuffing machen.
**Tommy | matchicalcom** [42:02 - 42:22]: Der hatte so einen internen Vortrag und wir haben so ein kleines Promovideo von Magical geschickt, das hat er im Hintergrund laufen gelassen und den Matt, also wo man ja mit unserem, wo man über den Berater sprechen kann, hat er auch noch vor der ganzen Mannschaft präsentiert und dann hat er uns auch Feedback gegeben, dass jetzt ganz cassini quasi magical verrückt ist quasi.
**Konsti | matchicalcom** [42:25 - 42:28]: Es war auch schon vereinbart, dass sie ihre ganzen internen reinladen.
**Konsti | matchicalcom** [42:28 - 42:38]: Das heißt wirklich, und das wissen sie, dass perspektivisch, wenn jetzt der POC ausläuft, also wir werden jetzt die Rechnung stellen für den POC von den für den letzten Monat, den Monat und den nächsten Monat sozusagen.
**Konsti | matchicalcom** [42:38 - 42:51]: Also haben sie jeden Monat drei, drei und wenn das ausläuft sozusagen, dann wissen sie, also müssen wir dann aber eigentlich gemäß unserer Pricing Matrix landen sie dann eigentlich sogar bei Euro.
**Konsti | matchicalcom** [42:51 - 43:01]: Das heißt, wenn wir sie dann irgendwie schauen, mal gucken, im Monat werden sie wahrscheinlich noch nicht bereit sein zu setzen, aber wenn wir sie auf acht oder so bekommen, das halten wir schon für sehr realistisch, dass es long soll.
**GIRKE Michael** [43:01 - 43:01]: Perfekt.
**GIRKE Michael** [43:03 - 43:15]: Kann man den UX Designer bezahlen oder UI erstmal steht auch mal eine Idee.
**Konsti | matchicalcom** [43:17 - 43:31]: Das haben wir uns überlegt und wenn wir halt am Anfang, wo wir noch kein UX Designer haben, wenn wir sagen, wir haben einen hohen Hebel und wir sagen, wir zacken uns 2 K im Monat ab, um einfach immer eine Woche pro Monat einen kleinen Designsprint zu haben mit dem externen, dann könnte das auch ein ziemlich guter Case sein.
**Tommy | matchicalcom** [43:31 - 43:32]: Schauen wir mal.
**Tommy | matchicalcom** [43:32 - 43:37]: Aber es ist trotzdem schon einmal, es ist trotzdem die Botschaft per se, oder?
**Tommy | matchicalcom** [43:37 - 43:41]: Dass da nicht sehr wahrscheinlich Bescheid ist, so viel Geld zu bezahlen.
**Tommy | matchicalcom** [43:41 - 43:43]: Ist doch schon Wahnsinn.
**Tommy | matchicalcom** [43:43 - 43:46]: Valantik, Konzi, da musst du vielleicht noch, du musst da noch.
**GIRKE Michael** [43:49 - 43:53]: Genau Valantic, das ist ja alles, also Vertragssetser da drin.
**Konsti | matchicalcom** [43:55 - 43:56]: Verschrieben.
**Tommy | matchicalcom** [43:57 - 44:03]: Wir haben da jetzt vereinbart, über die nächsten geht über die nächsten sechs Monate.
**Tommy | matchicalcom** [44:03 - 44:13]: Die nächsten drei Monate kriegen wir 2000 und die weiteren drei Monate 2400 pro Monat und danach wollen sie einen Jahresvertrag machen.
**Tommy | matchicalcom** [44:13 - 44:17]: Also das ist eigentlich alles auch cool.
**Tommy | matchicalcom** [44:17 - 44:25]: Und wir haben keinen Aufwand, keine aktuellen mehr damit und kriegen im Monat unsere Kosten sind vielleicht, keine Ahnung, kannst die €20.
**Konsti | matchicalcom** [44:29 - 44:30]: Mal gucken ganz schnell.
**Konsti | matchicalcom** [44:31 - 44:34]: Ich habe noch nicht den Tenant Filter eingebaut.
**Konsti | matchicalcom** [44:34 - 44:38]: Ne, sehen wir noch nicht nach Tenant, aber die kosten uns nicht viel.
**Tommy | matchicalcom** [44:39 - 44:40]: Aber cool oder?
**Tommy | matchicalcom** [44:40 - 44:42]: Eigentlich, dass man das.
**Tommy | matchicalcom** [44:42 - 44:43]: Die sind mega happy.
**Tommy | matchicalcom** [44:47 - 44:48]: Die sind happy, genau.
**Tommy | matchicalcom** [44:48 - 44:50]: Dann haben wir noch Touring.
**Tommy | matchicalcom** [44:50 - 44:52]: Kannst du eine Kleinigkeit einmal vergessen?
**Tommy | matchicalcom** [44:55 - 45:04]: Bridging ist auch, Bridging haben wir schon die Verträge geschickt, da starten wir am fünfzehnter August mit einem BOC, einem vollwertigen.
**Tommy | matchicalcom** [45:05 - 45:10]: Die haben auch 800 Leute, die sind ungefähr in der Beta Größe tatsächlich.
**GIRKE Michael** [45:10 - 45:12]: Ja, die haben ja z.B.
**GIRKE Michael** [45:12 - 45:15]: deutsche Bahn und EnBW ist bei denen auch so ein Riesenkunde.
**Tommy | matchicalcom** [45:15 - 45:17]: Korrekt, das sind die zwei wichtigsten.
**Tommy | matchicalcom** [45:17 - 45:17]: Genau.
**Tommy | matchicalcom** [45:19 - 45:22]: Und da machen wir es auch gleich so, der will das gleich ordentlich machen.
**Tommy | matchicalcom** [45:22 - 45:27]: Wir haben da mit dem Simon gesprochen, Dillinger, da muss ich noch kurz dazu.
**Konsti | matchicalcom** [45:27 - 45:33]: Sagen, die haben ein internes System, um ihre Skills zu pflegen sozusagen, wo sie auch CVs sogar rauslassen können.
**Konsti | matchicalcom** [45:33 - 45:39]: Das haben die selbst gebaut und das war deutlich besser als Profilemap, wie es aussah und was es konnte.
**Konsti | matchicalcom** [45:39 - 45:49]: Und die sagen trotzdem ne, das schießt ab, das ist uns zu viel Depth, zu viel Inhouse Entwicklung und geht nicht weiter und wir können da nicht weiterentwickeln, bis wir da sind, wo ihr jetzt schon seid, seit zwei Jahren weiter.
**Konsti | matchicalcom** [45:50 - 45:52]: Und deswegen wollen die da auf den Zug aufspringen.
**Konsti | matchicalcom** [45:52 - 45:53]: Ist richtig cool.
**GIRKE Michael** [45:54 - 45:54]: Das ist sehr gut.
**Tommy | matchicalcom** [45:56 - 45:59]: Er will auch gleich bis fünfzehnter August auch gleich.
**Tommy | matchicalcom** [45:59 - 46:02]: Wir machen gleich auch eine Stammdatenintegration quasi.
**Tommy | matchicalcom** [46:02 - 46:06]: Also er will auch gleich alle Profile rüber bekommen quasi.
**Tommy | matchicalcom** [46:06 - 46:14]: Also dann starten wir Mitte August, er hat schon alle Daten, die Verträge liegen schon bei Lidl und wir haben ihm auch schon die Übersicht geschickt, was wir alles haben.
**Tommy | matchicalcom** [46:15 - 46:22]: Und jetzt warten wir da noch, da kannst du vielleicht noch dazu schreiben, Reminder bitte schicken, weil er hat sich jetzt eineinhalb Wochen nicht gemeldet, er wollte mit einem Termin kommen.
**Tommy | matchicalcom** [46:22 - 46:27]: Dem schreiben wir jetzt einmal einen Reminder, damit wir mal die Migration planen beginnen mit ihm.
**Tommy | matchicalcom** [46:27 - 46:33]: Also da geht es darum, dass ihr die ganzen Profile, die internen, das ist ja die beste Ausgangssituation, die wir haben eigentlich.
**Tommy | matchicalcom** [46:33 - 46:38]: Wenn sie 800, sie kennen die Preise, 800 mal 12, dann lassen wir uns halt auf 10 runter verhandeln.
**Tommy | matchicalcom** [46:38 - 46:43]: Keine Ahnung, scheißegal, ist noch immer guter Deal für uns.
**GIRKE Michael** [46:44 - 46:45]: Klingt doch toll.
**GIRKE Michael** [46:45 - 46:45]: Also doch super.
**GIRKE Michael** [46:45 - 46:46]: Also ist doch super.
**GIRKE Michael** [46:47 - 46:50]: Ist ja keine Eintagsfliege mehr, das heißt es doch alles, ne?
**Tommy | matchicalcom** [46:51 - 46:53]: Quested, quested, quested.
**Tommy | matchicalcom** [46:53 - 46:54]: Kannst du auch noch dazu schreiben.
**Konsti | matchicalcom** [46:54 - 46:55]: Quest it.
**Konsti | matchicalcom** [46:55 - 47:01]: Stimmt, die sind aber noch keine, die sind noch Potential Client, die haben noch nichts, die wollen ja, stimmt, stimmt, stimmt, stimmt.
**Konsti | matchicalcom** [47:01 - 47:15]: Also Thorsten, genau, da haben wir den Showcase mit eben Thorsten, so ein interner Kontakt über einen Kumpel von mir und der hat uns jetzt endlich was eingebucht mit eigentlich drei, vier Key Decision makern.
**Konsti | matchicalcom** [47:15 - 47:19]: Also nach dem Showcase, den wir jetzt ja übermorgen haben, wenn mich nicht alles täuscht, an die nächste Woche.
**Tommy | matchicalcom** [47:20 - 47:23]: Du hast noch was vergessen oben Albinum.
**Konsti | matchicalcom** [47:24 - 47:26]: Die sind aber auch Potential, die sind auch noch nicht close.
**Tommy | matchicalcom** [47:27 - 47:28]: Ja, aber ziemlich gut.
**Tommy | matchicalcom** [47:28 - 47:32]: Schon vor die bridging id, die musst.
**GIRKE Michael** [47:32 - 47:33]: Du dann da unten rausnehmen.
**Tommy | matchicalcom** [47:33 - 47:34]: Ja, die kannst du unten.
**Konsti | matchicalcom** [47:37 - 47:38]: Die kann hier raus.
**Konsti | matchicalcom** [47:42 - 47:42]: Genau.
**Konsti | matchicalcom** [47:42 - 47:46]: Aber da haben wir den Showcase am neunte und da könnte Zuschlag sein.
**Konsti | matchicalcom** [47:47 - 47:51]: Sönke ist ein bisschen eine Labertasche, aber da kann man mal.
**Tommy | matchicalcom** [47:51 - 47:54]: Der war kurz bei wechseln, Maggie, ein halbes Jahr.
**GIRKE Michael** [47:54 - 47:56]: Sönke Patzke, oder nicht der?
**Tommy | matchicalcom** [47:56 - 47:57]: Nein, pink.
**Tommy | matchicalcom** [47:57 - 47:58]: Blink, blink, blink.
**GIRKE Michael** [47:59 - 48:00]: Okay, kenne ich nicht.
**Konsti | matchicalcom** [48:01 - 48:02]: Den haue ich mal an.
**Konsti | matchicalcom** [48:03 - 48:24]: Der auf jeden Fall, der möchte uns, der arbeitet für Adesso, also aber externer hilft denen manchmal ein bisschen bei dem Stuffing von deutschen Bahn, eben Rahmenvertrag, Bewirtschaftung, hat aber zum Teil auch ein bisschen sein eigenes Agency Business am Laufen und liefert manchmal von seinem Netzwerk da direkt ein.
**Konsti | matchicalcom** [48:24 - 48:36]: Und mit dem haben wir sozusagen so einen Deal, weil er schon sagt, man kann da viel machen und sie machen alles gerade von Hand, manuell, mit viel e Mail und hier und da, dass er uns eigentlich hilft, bei Adesso zu landen, mit den richtigen Leuten, connected und Co.
**GIRKE Michael** [48:36 - 48:39]: Dann kriegt er irgendeine Vertriebsprovision oder nicht.
**Konsti | matchicalcom** [48:39 - 48:47]: Mal, sondern wir haben einfach, du kriegst dann einfach unsere Software auch, aber for free, weißt du, dann hat er die halt für seine Ein Mann Bude, da müssen wir nicht mal was zahlen.
**Tommy | matchicalcom** [48:50 - 48:50]: Und.
**Konsti | matchicalcom** [48:50 - 48:51]: Er fand es total cool.
**GIRKE Michael** [48:54 - 48:54]: Genau.
**Konsti | matchicalcom** [48:54 - 48:56]: Aber den haue ich mal an, das macht Sinn.
**Konsti | matchicalcom** [48:56 - 48:57]: Maria Tam.
**Tommy | matchicalcom** [48:59 - 49:01]: Alexander Tam, da kam gar nichts mehr.
**Tommy | matchicalcom** [49:01 - 49:02]: Die kannst du mal runternehmen.
**Tommy | matchicalcom** [49:02 - 49:04]: Da kam einfach nichts.
**Tommy | matchicalcom** [49:05 - 49:06]: Die haben einfach keinen.
**Tommy | matchicalcom** [49:07 - 49:09]: Aber dann haben wir noch zwei Sachen.
**Tommy | matchicalcom** [49:09 - 49:10]: Musst noch dazuschreiben.
**Tommy | matchicalcom** [49:10 - 49:10]: Konzipieren.
**Tommy | matchicalcom** [49:11 - 49:14]: Einmal Alpinum und einmal Underground bitte.
**Konsti | matchicalcom** [49:14 - 49:15]: Alpinum.
**Tommy | matchicalcom** [49:17 - 49:23]: Der Walter Konsti schreibt Albinum Solutions eine Personalberatung im legal Umfeld.
**Tommy | matchicalcom** [49:23 - 49:30]: Tatsächlich haben wir über einen Kontakt bekommen, der ist super switched on.
**Tommy | matchicalcom** [49:30 - 49:32]: Der hat jetzt 200 Profile reingeladen.
**Tommy | matchicalcom** [49:34 - 49:41]: Das Gute ist, unser ganzes Rollen und Skill System hat sich wirklich von alleine erweitert quasi.
**Tommy | matchicalcom** [49:41 - 49:47]: Wir mussten da glaube ich einmal zwei oder 3 Stunden investieren, um die Rollen einmal zu refactoren.
**Tommy | matchicalcom** [49:47 - 49:48]: Aber wir haben da über.
**Tommy | matchicalcom** [49:49 - 49:52]: Also sie nur einmal ein bisschen anpassen.
**Tommy | matchicalcom** [49:52 - 49:56]: Wir haben dann einmal mit ihm gesprochen und haben gesagt ja, wie würdest du das gerne kategorisieren?
**Tommy | matchicalcom** [49:56 - 49:58]: Und seitdem ist das gelaufen.
**Tommy | matchicalcom** [49:58 - 50:04]: Das heißt, wir haben quasi in einem Nachmittag quasi eine neue Branche reinbekommen.
**Tommy | matchicalcom** [50:04 - 50:07]: Skill und rollentechnisch, weißt du, das ist schon super.
**Tommy | matchicalcom** [50:07 - 50:12]: Und er gibt uns jetzt testet er findet das alles super.
**Tommy | matchicalcom** [50:13 - 50:17]: Da haben wir halt eine klassische Beratung, eine ganz klassische Beratung.
**Tommy | matchicalcom** [50:17 - 50:20]: Circa 4000 Kandidaten in der Datenbank.
**Tommy | matchicalcom** [50:22 - 50:24]: Könnte wirklich gut ausschauen, dass wir den zu einem B.
**Tommy | matchicalcom** [50:24 - 50:26]: Genau wie es der Consi da.
**Tommy | matchicalcom** [50:27 - 50:34]: So wie es aussieht, können wir den wirklich auch converten zu einem BOC und dann in weiterer Folge vielleicht zum Kunden machen.
**Tommy | matchicalcom** [50:34 - 50:35]: Genau.
**GIRKE Michael** [50:37 - 50:37]: Cool.
**Konsti | matchicalcom** [50:40 - 50:42]: Undergon war leicht defensiv.
**Konsti | matchicalcom** [50:43 - 50:45]: Wäre ein Showcase eigentlich.
**Konsti | matchicalcom** [50:45 - 50:54]: Die fanden das schon cool, aber die waren so ein bisschen einfach nicht so energisch.
**Konsti | matchicalcom** [50:54 - 50:57]: Also manche sind da deutlich mehr vom Ausschlag.
**Konsti | matchicalcom** [50:59 - 51:00]: Aber warte mal, Undergon.
**Konsti | matchicalcom** [51:00 - 51:00]: Welche waren die?
**Konsti | matchicalcom** [51:00 - 51:03]: Einen der mit dem älteren Kollegen.
**Tommy | matchicalcom** [51:06 - 51:07]: Die müssen wir auch noch aufschreiben.
**Tommy | matchicalcom** [51:07 - 51:07]: S N.
**Tommy | matchicalcom** [51:08 - 51:11]: S n Event, dann mit dem Vormich haben wir gesprochen.
**Tommy | matchicalcom** [51:11 - 51:13]: Kennst du oder Michael?
**GIRKE Michael** [51:15 - 51:15]: Ich weiß nicht.
**GIRKE Michael** [51:15 - 51:16]: S n sagt mir was.
**Tommy | matchicalcom** [51:17 - 51:18]: Ja, das große.
**Tommy | matchicalcom** [51:18 - 51:23]: Ganz viel haben wir mit S n ganz viel Partner Business gemacht.
**Tommy | matchicalcom** [51:23 - 51:24]: S n mäßig.
**Tommy | matchicalcom** [51:30 - 51:31]: Den haue ich an den Gear.
**Tommy | matchicalcom** [51:32 - 51:32]: Geil.
**Tommy | matchicalcom** [51:35 - 51:36]: Jetzt musst du aber noch.
**Tommy | matchicalcom** [51:36 - 51:38]: Entschuldigung kannst jetzt musst noch kurz ergänzen.
**Tommy | matchicalcom** [51:39 - 51:41]: Quest it und s n muss bitte noch ergänzen.
**Tommy | matchicalcom** [51:42 - 51:43]: Dann sind wir mal da durch.
**Tommy | matchicalcom** [51:45 - 51:49]: Habe ich quested.
**Tommy | matchicalcom** [51:49 - 51:50]: Die sind auch motiviert.
**Tommy | matchicalcom** [51:54 - 51:55]: Die melden sich.
**Tommy | matchicalcom** [51:55 - 51:55]: Genau.
**GIRKE Michael** [51:56 - 51:57]: Sind interessiert.
**Konsti | matchicalcom** [51:58 - 52:00]: Die sind auf jeden Fall interessiert.
**Konsti | matchicalcom** [52:00 - 52:01]: Die waren ein bisschen speziell.
**GIRKE Michael** [52:03 - 52:07]: Undergon ist sehr klein oder erscheint 200 Leute.
**Tommy | matchicalcom** [52:08 - 52:11]: 200 ungefähr sind die.
**Tommy | matchicalcom** [52:12 - 52:13]: Ja, Westin ist auch.
**GIRKE Michael** [52:14 - 52:15]: Da wirst du nicht so viele.
**GIRKE Michael** [52:17 - 52:19]: Es ist noch so kein Massenprozess.
**GIRKE Michael** [52:19 - 52:20]: Vielleicht sind sie deswegen weißt du?
**Tommy | matchicalcom** [52:22 - 52:27]: Ja, ja, wobei sie auch, weil sie auch sagen, sie haben keine Ahnung, was sie tun.
**Tommy | matchicalcom** [52:27 - 52:33]: Und S N hat auch fünf oder 600 Leute und die haben auch nichts.
**Tommy | matchicalcom** [52:33 - 52:34]: Also die haben gar nichts.
**Tommy | matchicalcom** [52:34 - 52:35]: Die hatten mal stuffy Bro.
**Tommy | matchicalcom** [52:35 - 52:36]: Das haben sie abgeschlossen.
**Tommy | matchicalcom** [52:36 - 52:42]: Die sind nur auf Excel und auf Sharepoint unterwegs und queste das halt auch so in der Größe von Underground.
**Tommy | matchicalcom** [52:42 - 52:45]: Aber die sind interessiert, das sind coole Leute.
**Tommy | matchicalcom** [52:45 - 52:57]: Und vor allem, da ist auch einer dabei, der Marco, der Sales Tude, der hat auch so interessante Insights, also Insights, so interessante Aspekte, mit denen macht man am siebter Juli ein Onboarding.
**Tommy | matchicalcom** [52:59 - 53:00]: Genau, genau.
**Tommy | matchicalcom** [53:00 - 53:10]: Und den hätte ich insofern gerne, auch wenn die nicht so viel revenue, aber zur Produktentwicklung könnte der sehr sinnvoll sein, weißt du, so ein bisschen, wenn er Input gibt.
**Konsti | matchicalcom** [53:13 - 53:14]: Die haben wir alle erledigt.
**Konsti | matchicalcom** [53:14 - 53:20]: Genau, bei Pika kam, Pika haben wir hier noch eigentlich, den haue ich mal wieder an.
**Konsti | matchicalcom** [53:20 - 53:23]: Der wollte uns mit irgendeinem anderen Vertragspartner verbinden.
**Tommy | matchicalcom** [53:24 - 53:27]: Ja, mit der Isacon wollte uns verbinden.
**Konsti | matchicalcom** [53:28 - 53:34]: Und wir haben im Gegenzug angeboten, dass wir irgendeinem Dev von ihm ein kleines AI Coaching lesen.
**Tommy | matchicalcom** [53:34 - 53:38]: Genau, das war unser Tipp, den wir da anbieten wollten.
**Tommy | matchicalcom** [53:40 - 53:44]: Gut, und jetzt kommt, musst du rausnehmen.
**GIRKE Michael** [53:44 - 53:45]: Dass er durchgestrichen ist oder was ist das immer?
**GIRKE Michael** [53:45 - 53:48]: Also wenn du den Haken machst, dann wird es automatisch durchgestrichen.
**Tommy | matchicalcom** [53:48 - 53:54]: Und jetzt kommt's, wir haben das erste mal einen aktiven unsere Homepage für heute am Nachmittag.
**Konsti | matchicalcom** [53:57 - 54:13]: Sind auf unsere Seite gekommen, haben sich eingehen gebucht, haben gesagt so jo, sie suchen gerade nach Tools und wollten sich mal unsere Lösung anhören mit dem ganzen Team, also auch Geschäftsführer und die sind irgendwie 200 Mann stark, aber eine reine Stuffing Bude und haben eine.
**GIRKE Michael** [54:13 - 54:16]: Datenbank, Openbook 100 % openbooken werden.
**Tommy | matchicalcom** [54:18 - 54:20]: Personalberatung halt der klassische.
**Konsti | matchicalcom** [54:20 - 54:24]: Aber wenn die 2 Stunden die Joker.
**Tommy | matchicalcom** [54:24 - 54:26]: Ist ja um 14 Uhr.
**Konsti | matchicalcom** [54:28 - 54:28]: Genau.
**Konsti | matchicalcom** [54:28 - 54:30]: Nosa Group, neunter Juli.
**Konsti | matchicalcom** [54:30 - 54:32]: Ansonsten stehen keine Showcases mehr an gerade, gell?
**Tommy | matchicalcom** [54:33 - 54:37]: Das reicht eher mal fürs erste Inhaberunternehmen.
**GIRKE Michael** [54:37 - 54:39]: Mit rund 280 Mitarbeitenden.
**GIRKE Michael** [54:39 - 54:42]: Aber das sind dann ja viele, weil die ja alle in dem, also diese.
**Tommy | matchicalcom** [54:42 - 54:47]: Lage, die haben sicher eine große Datenbank, das wäre sicher spannend.
**Tommy | matchicalcom** [54:48 - 55:01]: Und vor allem die haben sicher noch, also die werden von unserem CV Basa noch viel krasser den Mehrwert sehen, weil die haben ja keine internen Profile, sondern da kann man ja konzi, das kann man wirklich machen.
**Tommy | matchicalcom** [55:01 - 55:09]: Gebt uns doch bitte zwei externe Profile und die basen wir dann auch mal, weil für die wird der CV, da brauchen wir nicht so dezidiert auf die deutsche Bahn.
**Tommy | matchicalcom** [55:09 - 55:18]: Da sollte man vielleicht heute ein bisschen mehr auf das CV Basing eingehen, weißt du, in unserem Showcase vielleicht, aber kann man uns noch überlegen.
**Tommy | matchicalcom** [55:18 - 55:19]: Besprechen wir uns noch vor.
**Konsti | matchicalcom** [55:21 - 55:21]: Genau.
**Tommy | matchicalcom** [55:21 - 55:26]: Aber da stehen wir jetzt gerade kundentechnisch.
**GIRKE Michael** [55:29 - 55:31]: Das ist doch mehr als gut, oder?
**GIRKE Michael** [55:32 - 55:36]: Lustiger Unternehmen dabei, der Wahnsinn.
**Konsti | matchicalcom** [55:37 - 55:42]: Ja doch, also es läuft echt ziemlich gut, also läuft auch relativ stabil generell.
**Konsti | matchicalcom** [55:42 - 55:43]: Wie ist es generell?
**Konsti | matchicalcom** [55:44 - 55:55]: Wir haben noch mal ein paar Sachen gedreht und jetzt ist es so, unser System ist nochmal deutlich stabiler geworden, vor allem auch, weil einige AI Provider jetzt diese Modelle auch im Stable released haben.
**Konsti | matchicalcom** [55:56 - 55:59]: Das heißt also sieht alles ziemlich gut aus.
**Konsti | matchicalcom** [55:59 - 56:11]: Also wir haben mehr Fokuszeit wieder, um vorwärts zu machen, haben eigentlich ganz klare Roadmap, was wir bei welchen Kunden tun müssen, um da weiter vorwärts zu kommen.
**Konsti | matchicalcom** [56:11 - 56:18]: Und wir hatten ja letztes Mal, als wir geredet hatten, war ja die Idee, oder nee, also hier war es, dass man mal avisiert, irgendwie um die 10 Kunden monthly revenue.
**Konsti | matchicalcom** [56:19 - 56:32]: Ich würde nicht sagen, dass wir gerade on track sind, dass wir schon im Dezember monthly haben, aber ich glaube, wir sind sehr gut on track, dass wir mit der Pipeline, die wir bis zum Dezember haben, wahrscheinlich Ende Q um die monthly haben können.
**Tommy | matchicalcom** [56:33 - 56:33]: Ist doch super.
**GIRKE Michael** [56:37 - 56:46]: Pain points im Sinne des Hebels da mit den Leuten, dass er da schon schaut, ist doch gut, passt doch alles.
**Tommy | matchicalcom** [56:46 - 56:46]: Ja genau.
**GIRKE Michael** [56:46 - 57:00]: Und dann muss man irgendwann dann springen mit den Leuten einstellen und ich finde es auch gut, Tommy, du hast vorher gesagt, lieber jetzt schon mal schauen, auch nach Leuten, wenn man einen guten kriegt, vielleicht lieber zu früh einzustellen, als zu spät so auch zu agieren.
**GIRKE Michael** [57:02 - 57:06]: Also natürlich muss für euch natürlich irgendwann jetzt schon auch noch mal was rauskommen.
**Konsti | matchicalcom** [57:07 - 57:16]: Ja, also wie man es nimmt, also es fließt vielleicht jetzt noch nicht so viel Geld auf unser Konto und wir haben viel reingezahlt und auch lange auf Gehalt in Anführungszeichen verzichtet, oder?
**Konsti | matchicalcom** [57:16 - 57:37]: Ich rede von meiner Seite auch, aber auch wenn der return on investment Cashflow wise noch nicht da ist, wenn man guckt, wie sich gerade unser Cashflow entwickelt und dann hochrechnet, was ist eigentlich dieses Konstrukt schon wert, diese Software, die Company, die wir da im Shapen sind, dann würde ich sagen, wir sind auf jeden Fall schon positiv in der Amortisationsrechnung.
**Tommy | matchicalcom** [57:38 - 57:43]: Wie würdest du das, wenn du jetzt von draußen so drauf kommst, also kannst du uns da kurz Feedback geben?
**Tommy | matchicalcom** [57:44 - 57:45]: Geben sind wir da?
**GIRKE Michael** [57:45 - 58:03]: Ich gebe ja laufend Feedback, also ich habe kein zusätzliches, also ich finde das eine super Entwicklung, also habe ich schon von vornherein gesagt, dass das jetzt was an das Produkt ist interessant, einfach die Use Cases, auf die wir jetzt da von Wavestone Seite drauf gesetzt haben, das ist mal das wichtigste, das Produkt irgendwie Sinn macht.
**GIRKE Michael** [58:03 - 58:13]: Das scheint Sinn zu machen, dann ist es sehr gut, einfach diese Anzahl der Kunden, einfach top.
**GIRKE Michael** [58:13 - 58:23]: Ich meine, ist ja nicht zu erwarten, häufig hast du ja einen und dann und das dann wirklich einen zweiten gleich close und dritten POC ist auch noch mal was anderes, als wenn die dann wirklich einen Vertrag machen.
**GIRKE Michael** [58:23 - 58:25]: Also POC hast du immer mal schnell.
**GIRKE Michael** [58:27 - 58:36]: Also sehr gute Zeichen, dass ihr relevant seid, dass ihr das richtig macht, weil die Kunden geben ja keine Verträge aus, wenn sie nicht einen Nutzen davon haben.
**GIRKE Michael** [58:37 - 58:38]: Sind alles gute Sachen.
**GIRKE Michael** [58:38 - 58:41]: Und genau jetzt müsste halt diesen Hebel da entwickeln.
**GIRKE Michael** [58:41 - 58:48]: Und was ich nicht beurteilen kann, das frage ich mich so die ganze Zeit mitlaufend, wo sind die Substitutionsgefahren?
**GIRKE Michael** [58:53 - 58:53]: Genau.
**GIRKE Michael** [58:54 - 58:58]: Also es ist ja immer noch so, also ihr seid super schlaue Köpfe, das ist keine Frage.
**GIRKE Michael** [59:00 - 59:08]: Aber wenn jetzt irgendein Player beschließt, das ist sowieso in meinem Scope, ich setze da jetzt ein Team von 20 Leuten dran, weißt du, also ein Google oder so.
**GIRKE Michael** [59:09 - 59:13]: Das ist jetzt hier dann guter Punkt.
**Konsti | matchicalcom** [59:14 - 59:19]: Wir haben uns genau damit beschäftigt, als ich auch mal mit einem Kollegen gesprochen habe, der bei einem großen VC auch arbeitet.
**Konsti | matchicalcom** [59:20 - 59:27]: Und die Sache ist, wenn wir, du hast es ja selber damals schon gesagt, Professional Services Automation, das ist unser Markt für Unternehmensberatung.
**Konsti | matchicalcom** [59:27 - 59:37]: Der Markt, egal wie man es dreht und wendet, sonst was, verschiedene Analysen macht, aber der bewegt sich so zwischen drei, der ist nicht größer.
**Konsti | matchicalcom** [59:37 - 59:43]: Und was wir ja liefern, was unser Produkt besonders macht, ist nicht, wir bauen ein bisschen besser Software, sondern wir haben auch viel AI drin.
**Konsti | matchicalcom** [59:43 - 59:46]: Dafür braucht es auch relativ viel Talent und man muss sich ziemlich gut auskennen.
**Konsti | matchicalcom** [59:46 - 59:51]: Die Leute, die jetzt das Talent und das Geld mobilisieren, die gehen nicht in so einen kleinen Pissmarkt.
**Konsti | matchicalcom** [59:51 - 59:52]: Doof.
**Konsti | matchicalcom** [59:54 - 59:57]: Und deswegen denken wir, wir haben eigentlich ein ziemlich gutes Fahrwasser.
**Konsti | matchicalcom** [59:57 - 59:59]: Wir müssen da gar nicht so Angst haben.
**Konsti | matchicalcom** [59:59 - 01:00:01]: Die Großen, die gehen nicht auf so einen ganz kleinen Markt.
**Konsti | matchicalcom** [01:00:01 - 01:00:05]: Die wollen Microsoft Dynamics neu erfinden für alle Companies, so in der Art.
**Konsti | matchicalcom** [01:00:05 - 01:00:07]: Oder hr, aber doch nicht hr stuffing.
**Konsti | matchicalcom** [01:00:07 - 01:00:10]: Extern Projektgeschäft führen nur Beratungen.
**Konsti | matchicalcom** [01:00:11 - 01:00:16]: Deswegen denken wir, wir haben genug Zeit, um uns einen Vorsprung aufzubauen.
**Konsti | matchicalcom** [01:00:16 - 01:00:20]: Und unsere einzigen Konkurrenten, die wir fürchten müssen, sind die, die da sind.
**Konsti | matchicalcom** [01:00:20 - 01:00:24]: Das ist dieses Cnode, diese Staffits, dieses Napda, dieses whatever.
**Konsti | matchicalcom** [01:00:24 - 01:00:25]: Und die haben wir uns alle mal angeguckt.
**Konsti | matchicalcom** [01:00:25 - 01:00:28]: Die sind alle schon mindestens acht Jahre alt.
**Konsti | matchicalcom** [01:00:28 - 01:00:32]: Man sieht sofort, dass sie ziemlich sicher auf einer Legacy Code Base sitzen.
**Konsti | matchicalcom** [01:00:32 - 01:00:35]: Man merkt ja auch bei DC Dalo haben wir den Newsletter abonniert.
**Konsti | matchicalcom** [01:00:35 - 01:00:37]: Die machen jeden Monat, schicken den Newsletter, was neu drin ist.
**Konsti | matchicalcom** [01:00:37 - 01:00:38]: Wir screenen kurz rüber.
**Konsti | matchicalcom** [01:00:38 - 01:00:47]: Dann denke ich mir, unser Speed ist, also was die in einem Monat machen, machen wir in vier fokussierten Tagen, weil wir halt noch viel schlanker und agiler sind, unsere Software wahrscheinlich besser aufgestellt ist.
**Konsti | matchicalcom** [01:00:47 - 01:00:51]: Und wir merken ja jetzt schon, dass wir Kunden abwerben, die zum Teil auf desto dalo sind.
**Konsti | matchicalcom** [01:00:52 - 01:01:02]: Eben Cassini hatte Starfit pro, die neue Web Version im Einsatz, eben Bridging hatte eine sehr gute internen Portale im Einsatz, dann gab es noch irgendjemanden, die waren auf Profile Map Broaching hat auch Profile Map in der Evolution.
**Konsti | matchicalcom** [01:01:02 - 01:01:07]: Also wir tun gerade von den etablierten Playern, quest it hat C Node im Einsatz.
**Konsti | matchicalcom** [01:01:07 - 01:01:14]: Wir tun wirklich von den etablierten Playern tun wir schon direkt nicht nur bei den offenen Türen ein Rennen, die gar nichts haben, sondern auch die, die was haben.
**Konsti | matchicalcom** [01:01:16 - 01:01:17]: Jo, wir wollen das ausprobieren, finden das geil.
**GIRKE Michael** [01:01:21 - 01:01:24]: OK und die replacen sozusagen ihre.
**GIRKE Michael** [01:01:24 - 01:01:25]: Also z.b.
**GIRKE Michael** [01:01:25 - 01:01:30]: jetzt wenn du Steffit pro nimmst, das wäre jetzt ja der Wavestone Case, die ersetzen das.
**GIRKE Michael** [01:01:30 - 01:01:32]: Das kann ich jetzt.
**GIRKE Michael** [01:01:32 - 01:01:41]: Da habe ich vielleicht was mitgekriegt bei eurer Feature Entwicklung nicht, weil da ist ja jetzt, also da ist ja dann auch noch diese, da fehlen noch Sachen.
**GIRKE Michael** [01:01:41 - 01:01:48]: Brot und Butter, also Brot und Butter Workflow Unterstützung im Sinne hab ein Interview und keine Ahnung was ist der Stand.
**Tommy | matchicalcom** [01:01:49 - 01:01:50]: Das ist noch nicht da, oder?
**Konsti | matchicalcom** [01:01:51 - 01:01:54]: Cassini hat nur Teile aus Staff benutzt, mehr so für Datenbank und Co.
**Konsti | matchicalcom** [01:01:54 - 01:01:59]: Und da sagen sie, der Kollege, der das am meisten genutzt hat, hat gesagt, er schaut immer weniger rein.
**Konsti | matchicalcom** [01:01:59 - 01:02:08]: Und Ziel des ein Milestone ist auch, den haben wir nicht direkt aufgeschrieben, aber Ziel sollte sein, dass sie perspektivisch SIP dann auch relativ schnell loswerden können, wenn sie es immer weniger nutzen.
**Konsti | matchicalcom** [01:02:08 - 01:02:10]: Aber wir brauchen dafür schon noch ein bisschen was.
**Konsti | matchicalcom** [01:02:10 - 01:02:11]: Das ist ja das.
**GIRKE Michael** [01:02:13 - 01:02:29]: Okay, aber das wäre doch auch vielleicht dann das strategische Ziel zu sagen, es gibt so vier, fünf Player in dem Markt, also und ihr werdet oder seid schon einer und jetzt werdet die anderen verdrängen in dieser Nische, weil da wird eine Google oder so kein.
**GIRKE Michael** [01:02:29 - 01:02:31]: Das sehen die gar nicht den Markt.
**Tommy | matchicalcom** [01:02:34 - 01:02:35]: Er ist noch immer groß genug.
**Tommy | matchicalcom** [01:02:35 - 01:02:56]: Also vielleicht jetzt, wenn wir nur ganz kurz noch spendieren, es ist jetzt ein bisschen zu früh über das zu sinieren, aber wenn wir keine Ahnung, der Markt ist 500 Millionen groß, wenn du in der Nische drinnen bist, kannst du vielleicht 10 bis 20 % bekommen davon, dann bist du noch immer irgendwo bei zwischen 50 und 100 Millionen weltweit.
**GIRKE Michael** [01:02:56 - 01:02:58]: Seid ihr jetzt weltweit oder?
**Konsti | matchicalcom** [01:02:58 - 01:02:59]: Das ist weltweit, ja.
**Konsti | matchicalcom** [01:02:59 - 01:03:03]: Ja, der europäische Anteil sind wahrscheinlich eher so.
**Konsti | matchicalcom** [01:03:03 - 01:03:04]: War gar nicht so schlecht.
**Konsti | matchicalcom** [01:03:04 - 01:03:07]: 150 Millionen davon waren glaube ich europäisch die Amis groß.
**Konsti | matchicalcom** [01:03:07 - 01:03:08]: Bei den asiatischen war es gar nicht.
**Konsti | matchicalcom** [01:03:08 - 01:03:10]: Ich weiß nicht, haben die asiatischen groß Consulting?
**Konsti | matchicalcom** [01:03:10 - 01:03:12]: Ich frage mich das manchmal immer bei.
**GIRKE Michael** [01:03:14 - 01:03:16]: Es ist alles top und weißt du.
**Tommy | matchicalcom** [01:03:16 - 01:03:32]: Miki, letzter Gedanke du kannst sofort führen, auch wenn es 150 Millionen sind in Europa, wenn wir 1015 % halten, 1020 % Marktanteil haben, dann sind wir irgendwo 15 bis dreiig.
**Tommy | matchicalcom** [01:03:32 - 01:03:44]: Wir haben AI Business, wenn man sich die Hebel anschaut, also wenn man jetzt perspektivisch ein bisschen an Exit denkt, halt so perspektivisch mit einem Hebel von 10, werden wir auf das ARR schon schielen können.
**Tommy | matchicalcom** [01:03:45 - 01:03:46]: Das wäre Monster.
**Tommy | matchicalcom** [01:03:47 - 01:03:48]: Gute Bewertung.
**Tommy | matchicalcom** [01:03:48 - 01:03:55]: Und wenn man die durchschnittlichen Tickets auch anschaut, die ARRs, wir werden wahrscheinlich irgendwo uns bei im Monat irgendwo einpendeln.
**Tommy | matchicalcom** [01:03:55 - 01:04:00]: Also im Durchschnitt, dass ein Kunde für die Software im Monat bezahlt.
**Tommy | matchicalcom** [01:04:00 - 01:04:18]: Das ist schon so, wenn man es jetzt so durchrechnet, ungefähr der Durchschnitt, das sind im Jahr, wenn wir da 100 Kunden haben und das ist nicht unrealistisch, das in den nächsten paar Jahren zu erreichen, dann wäre das schon eine super Sache für uns.
**Tommy | matchicalcom** [01:04:18 - 01:04:24]: Und da glauben wir, dass da halt weniger reingehen, weil das halt klein ist.
**GIRKE Michael** [01:04:26 - 01:04:27]: Wenn man in der Nische bleibt.
**GIRKE Michael** [01:04:27 - 01:04:28]: Sorry.
**Tommy | matchicalcom** [01:04:28 - 01:04:34]: Und wenn man dann weiterdenkt, kann man doch immer sagen, wenn wir dann die Basis haben und wir haben Bock.
**Konsti | matchicalcom** [01:04:39 - 01:04:44]: Workforce transformiert sich, es ist immer mehr Projektgeschäft in den Unternehmen drin, weil immer mehr automatisiert wird.
**Konsti | matchicalcom** [01:04:44 - 01:04:51]: Also da ist ein Markt, auf dem man auch spielen kann oder man macht so ein bisschen auch mit.
**Konsti | matchicalcom** [01:04:51 - 01:04:54]: Du findest niemanden in deiner Datenbank, frag doch mal alle anderen, die es nutzen.
**Konsti | matchicalcom** [01:04:54 - 01:04:58]: Also es gibt da, also langweilig wird uns in dem Markt auch nicht.
**Konsti | matchicalcom** [01:05:00 - 01:05:07]: Und man muss auch bedenken, wir haben darüber unterhalten, haben eigentlich festgestellt, das ist der perfekte Fit.
**Konsti | matchicalcom** [01:05:07 - 01:05:14]: Wir kennen uns in dem Markt ziemlich gut aus, wir fühlen uns wohl, wir haben Kontakte, wir sind drin gelandet und die amerikanischen Player werden da nicht reinkommen.
**Konsti | matchicalcom** [01:05:14 - 01:05:16]: Erst recht sowieso nicht in den deutschen oder europäischen Markt.
**Konsti | matchicalcom** [01:05:18 - 01:05:26]: Wir müssen keine Angst haben, dass wir nicht mit dem Silicon Valley Startup mithalten können, weil wir nicht 50 Millionen Funding in der Seed Runde raisen können.
**Konsti | matchicalcom** [01:05:26 - 01:05:34]: Also deswegen, gleichzeitig ist die Upside nicht so unendlich hoch, aber dafür ist, also man muss immer upside mal risikomultiplier.
**Konsti | matchicalcom** [01:05:34 - 01:05:42]: Und ich habe viel lieber das, als dass ich jetzt sage, wir machen jetzt irgendeine Sales AI Automation Software, wie ungefähr andere gerade.
**GIRKE Michael** [01:05:46 - 01:05:48]: Klingt alles vernünftig, ist ein guter Plan, ein guter Weg.
**GIRKE Michael** [01:05:48 - 01:05:51]: Die Nische ist ein gewisser Schutz, eine gewisse Begrenzung.
**GIRKE Michael** [01:05:51 - 01:06:02]: Aber genau wie du sagst, doch unternehmerisch jetzt vielleicht ganz geschickt, jetzt erstmal voll in diese Nische reinzugehen, die bietet ja jetzt erstmal gefühlt unendlich Potenzial, wird dann irgendwann vielleicht endlich sein.
**GIRKE Michael** [01:06:04 - 01:06:04]: Ist doch toll.
**GIRKE Michael** [01:06:04 - 01:06:07]: Also lange Antwort bzw.
**GIRKE Michael** [01:06:07 - 01:06:09]: Auch weitergeredet, macht auch einen sehr guten Eindruck.
**GIRKE Michael** [01:06:10 - 01:06:13]: Bin stolz auf euch, was ihr da alle schafft.
**Konsti | matchicalcom** [01:06:16 - 01:06:24]: Wir sind auch immer wieder, merken wir es, also wir haben auch viel Struggle und das ist auch sehr intensiv, aber wir sind immer wieder mal, wenn wir Inhalte sind, merken wir, wir sind echt auch proud, was wir da so am aufbauen sind.
**Konsti | matchicalcom** [01:06:24 - 01:06:26]: Also haben wir uns schon auch echt ordentlich entwickelt.
**Tommy | matchicalcom** [01:06:28 - 01:06:34]: Und es gibt aber auch Momente, wo ich da sitzen würde, wo sind meine ganzen Zettel?
**Tommy | matchicalcom** [01:06:34 - 01:06:36]: Ich weiß gar nicht mehr, wo soll ich jetzt eigentlich beginnen?
**Tommy | matchicalcom** [01:06:37 - 01:06:38]: Aber das macht Spaß.
**Tommy | matchicalcom** [01:06:41 - 01:06:45]: Vielleicht, wenn wir dann das Excel haben, das nächste Mal, wenn du da bist, da haben wir es ja hundertprozentig.
**Tommy | matchicalcom** [01:06:45 - 01:06:51]: Dann macht es einfach einmal Sinn, auf die Cashflows zu schauen und einmal wirklich einmal weiter, weiter zu überlegen, oder?
**Tommy | matchicalcom** [01:06:51 - 01:06:54]: Das ist ja einfach so gefragt, also.
**GIRKE Michael** [01:06:54 - 01:07:01]: Dass man dann noch mal sagt, also von den Zahlen auch sagt, okay, wie kann man jetzt diesen, also wie kann man jetzt den Hebel da entwickeln?
**Tommy | matchicalcom** [01:07:02 - 01:07:02]: Genau.
**GIRKE Michael** [01:07:02 - 01:07:04]: Scaling sozusagen.
**Tommy | matchicalcom** [01:07:05 - 01:07:06]: Genau, genau, genau.
**Tommy | matchicalcom** [01:07:06 - 01:07:10]: Und genau, ich denke, dann wird es ja auch, dann können wir auch mal einfach.
**Tommy | matchicalcom** [01:07:11 - 01:07:19]: Genau, weil wir auch das sehr zu schätzen wissen, dass du ja deine Zeit da auch investierst und uns da immer zuhörst, dass wir da auch, macht das ja auch noch Spaß.
**GIRKE Michael** [01:07:19 - 01:07:20]: Also ich.
**Tommy | matchicalcom** [01:07:21 - 01:07:22]: Super.
**Tommy | matchicalcom** [01:07:22 - 01:07:23]: Das ist ja umso besser.
**Tommy | matchicalcom** [01:07:23 - 01:07:24]: Aber das wird auch, ne, das ist doch gut, oder?
**GIRKE Michael** [01:07:24 - 01:07:27]: Jetzt auch vielleicht zu diesem Setup jetzt die h für euch.
**GIRKE Michael** [01:07:27 - 01:07:28]: Macht ja auch Sinn.
**GIRKE Michael** [01:07:28 - 01:07:36]: Also das heißt, also jetzt gar kein Overhead, im Gegenteil, für alle Beteiligten ganz interessant.
**GIRKE Michael** [01:07:36 - 01:07:36]: Okay, super.
**GIRKE Michael** [01:07:39 - 01:07:41]: In dem Sinne, übernächste Woche bin ich dann wieder dabei.
**Tommy | matchicalcom** [01:07:42 - 01:07:42]: Ja, genau.
**Konsti | matchicalcom** [01:07:42 - 01:07:42]: Perfekt.
**Tommy | matchicalcom** [01:07:42 - 01:07:44]: Wir freuen uns und dann hören wir uns.
**Tommy | matchicalcom** [01:07:44 - 01:07:44]: Genau.
**Tommy | matchicalcom** [01:07:44 - 01:07:46]: Alles bis dann.
**Tommy | matchicalcom** [01:07:46 - 01:07:47]: Ciao.
**Tommy | matchicalcom** [01:07:48 - 01:07:49]: Gute Zeit.
**Tommy | matchicalcom** [01:07:49 - 01:07:50]: Ciao, ciao.
**GIRKE Michael** [01:07:50 - 01:07:50]: Danke.
**GIRKE Michael** [01:07:50 - 01:07:51]: Ciao.
