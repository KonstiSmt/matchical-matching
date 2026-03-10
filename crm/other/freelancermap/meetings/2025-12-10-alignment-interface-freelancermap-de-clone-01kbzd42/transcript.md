# Alignment Interface freelancermap.de (Clone)

**Konsti | matchicalcom** [00:02 - 00:03]: Hallo zusammen.
**Michael Fossler** [00:03 - 00:06]: Hallo, hallo, hallo, hallo.
**Konsti | matchicalcom** [00:06 - 00:07]: Hi Michael.
**Konsti | matchicalcom** [00:08 - 00:09]: Hi Mark News, here we go again.
**Magnus Gernlein** [00:10 - 00:11]: Servus.
**Magnus Gernlein** [00:12 - 00:13]: Hi Tommy.
**Konsti | matchicalcom** [00:14 - 00:15]: Du bist noch mute.
**Tommy | matchicalcom** [00:15 - 00:16]: Ich bin mute.
**Tommy | matchicalcom** [00:16 - 00:19]: Jetzt bin ich da ab vier Leute, glaube ich.
**Tommy | matchicalcom** [00:19 - 00:20]: Grüß euch.
**Tommy | matchicalcom** [00:20 - 00:20]: Servus.
**Tommy | matchicalcom** [00:21 - 00:22]: Hi Michael.
**Magnus Gernlein** [00:23 - 00:29]: Ich habe mal den Michael mitgebracht, weil er sozusagen unser Experte für die ganzen Importgeschichten ist.
**Magnus Gernlein** [00:30 - 00:32]: Michi, ich hatte dich ja schon vorgewarnt.
**Magnus Gernlein** [00:32 - 00:38]: Es geht heute im Endeffekt darum, dass wir so ein bisschen grob einschätzen, wie hoch der Aufwand praktisch ist, es zu implementieren.
**Magnus Gernlein** [00:40 - 00:43]: Grob gesagt, klassischer Import, Bewerbungen per API verschicken.
**Magnus Gernlein** [00:43 - 00:44]: Ich hatte dich ja schon informiert.
**Magnus Gernlein** [00:45 - 00:47]: Genau, genau.
**Magnus Gernlein** [00:47 - 00:51]: Und jetzt würde ich sagen, überlasse ich euch mal das Gespräch, weil beim Technischen halte ich mich raus.
**Tommy | matchicalcom** [00:52 - 00:53]: Haltest du dich raus?
**Tommy | matchicalcom** [00:54 - 00:57]: Wir versuchen es auch uns rauszuhalten.
**Tommy | matchicalcom** [00:58 - 00:59]: Also genau.
**Tommy | matchicalcom** [00:59 - 01:01]: Vielen Dank Magnus, fürs fürs Einführen.
**Tommy | matchicalcom** [01:01 - 01:06]: Also genau, vielleicht gibt es überhaupt so viel mehr zu sagen.
**Tommy | matchicalcom** [01:07 - 01:13]: Vielleicht erklären wir mal, was wir gelernt haben von Magnus auch und dass wir das vielleicht kurz einmal klären auch.
**Tommy | matchicalcom** [01:13 - 01:15]: Michael, der Punkt war.
**Tommy | matchicalcom** [01:18 - 01:21]: Klassisch über ein XML-Feed weiterhin zu gehen.
**Tommy | matchicalcom** [01:21 - 01:22]: Beim Importen.
**Tommy | matchicalcom** [01:23 - 01:28]: Ja, das kann man ja so machen oder URL pro Tenant, fertig.
**Tommy | matchicalcom** [01:28 - 01:46]: Ihr holt euch das ab, wir können uns ausmachen, wie oft ihr das abholt und und wir könnten uns auch überlegen, ob man vielleicht noch einmal so ein bisschen State Management auch macht, also über das eine oder andere XML Attribut, quasi sowas wie Status, Updated, New, deleted oder was auch immer.
**Tommy | matchicalcom** [01:46 - 01:53]: Das wäre ein bisschen so auch, weil das wäre quasi so ein bisschen der Mittelweg aus.
**Tommy | matchicalcom** [01:55 - 02:14]: Schönen REST Endpunkten und dem XML, weil wir haben einfach das Problem, also ich habe es bei Wavestone jahrelang gemacht, jetzt ja mit Magical, aber der XML Feed ist halt insofern ein bisschen unflexibel, weil wir nie wussten, okay, jetzt haben wir ein Projekt geändert, wird es jetzt auch wirklich upgedatet oder was auch immer.
**Tommy | matchicalcom** [02:15 - 02:18]: Das ist halt so ein bisschen die Geschichte bis jetzt gewesen.
**Tommy | matchicalcom** [02:18 - 02:23]: Dann haben wir uns halt geholfen, dass wir intern neue Nummern vergeben haben und.
**Tommy | matchicalcom** [02:25 - 02:28]: Weil ihr, wenn ihr eine neue Nummer bekommt, habt, gepostet habt und.
**Tommy | matchicalcom** [02:31 - 02:35]: Dem Workaround wollen wir ein bisschen aus dem Weg gehen, wenn wir bei XML bleiben.
**Tommy | matchicalcom** [02:35 - 02:40]: Also dass wir einfach klar definieren, welche States gibt es, die von uns kommen im XML.
**Michael Fossler** [02:41 - 02:42]: Ja, das wäre kein Problem.
**Tommy | matchicalcom** [02:43 - 02:46]: Okay, das wäre mal, also das wäre.
**Michael Fossler** [02:47 - 02:51]: Welche Actions gibt es und dann, was ich tun soll, dementsprechend und dann können wir das machen.
**Tommy | matchicalcom** [02:51 - 02:53]: Okay, das wäre okay.
**Tommy | matchicalcom** [02:53 - 02:57]: Wahrscheinlich ist das new updated, deleted, wahrscheinlich.
**Tommy | matchicalcom** [02:59 - 03:00]: Selbst sprechen.
**Tommy | matchicalcom** [03:03 - 03:04]: Aber ihr habt es bis jetzt so nicht, oder?
**Tommy | matchicalcom** [03:04 - 03:10]: Oder habt ihr das also im Standard Import oder habt ihr es bei manchen Kunden individuell auch so gemacht?
**Michael Fossler** [03:10 - 03:13]: Also bei ein paar Kunden gibt es schon, die schicken uns halt ein deleted.
**Michael Fossler** [03:13 - 03:17]: Deswegen hat, also manche nennen es der eine Satellite, der andere removed, der andere, keine Ahnung.
**Michael Fossler** [03:23 - 03:26]: Aber ein paar Kunden machen das schon, deswegen ist das an sich kein Problem.
**Tommy | matchicalcom** [03:27 - 03:29]: Okay, perfekt.
**Tommy | matchicalcom** [03:32 - 03:34]: Dann ist ja nur die Frage.
**Tommy | matchicalcom** [03:34 - 03:38]: Genau, eine kleine Rückfrage habe ich dann doch noch.
**Tommy | matchicalcom** [03:38 - 03:40]: Wenn ihr das XML importiert habt.
**Tommy | matchicalcom** [03:42 - 03:45]: Haben wir ja aktuell, kriegen wir nichts zurück.
**Tommy | matchicalcom** [03:45 - 03:52]: Also ich bin noch bei der Position quasi jetzt oder bei den Stellen, was natürlich irgendwie in weiterer Folge.
**Tommy | matchicalcom** [03:53 - 04:01]: Eine Idee wär, dass wir irgendwie herausfinden, habt ihr es verarbeitet und welche ID sind es bei euch auch?
**Tommy | matchicalcom** [04:01 - 04:07]: Also weißt du, das wäre so ein bisschen die Folgefrage daraus, die wir uns einmal stellen müssten.
**Tommy | matchicalcom** [04:09 - 04:11]: Weil das ist ja im Moment nicht gegeben.
**Tommy | matchicalcom** [04:13 - 04:19]: Habt ihr das irgendwie schon einmal sowas gemacht, wenn ihr es verarbeitet habt, dass ihr irgendwo was hingeschickt habt oder sowas?
**Tommy | matchicalcom** [04:19 - 04:19]: Also.
**Tommy | matchicalcom** [04:21 - 04:22]: Bis jetzt noch nicht, aber je.
**Michael Fossler** [04:22 - 04:24]: Nach Umfang wäre das an sich auch kein Problem.
**Michael Fossler** [04:25 - 04:28]: Ihr braucht ja eh eine API, wo wir dann die Bewerbungen hinschicken.
**Tommy | matchicalcom** [04:28 - 04:28]: Genau.
**Tommy | matchicalcom** [04:31 - 04:33]: Das wäre so die Überlegung quasi.
**Tommy | matchicalcom** [04:33 - 04:37]: Also so eine Art Webhook Gedanke hätte ich da.
**Tommy | matchicalcom** [04:37 - 04:54]: Also weißt du, also sozusagen, du hast das XML verarbeitet, dann loopst ja wahrscheinlich durch oder pro Dings, schickst einfach zurück, hey, das war eure IT, das ist unsere neue IT und das war die Action, die ich gemacht habe quasi und wir nennen dir einfach einen Endpunkt dafür auf unserer Seite.
**Tommy | matchicalcom** [04:54 - 04:58]: Da postest du es einfach hin und wir verarbeiten es dann weiter und wissen, es ist passiert oder nicht passiert.
**Michael Fossler** [04:59 - 05:02]: Wäre möglich, denke ich.
**Tommy | matchicalcom** [05:02 - 05:03]: Keine große Sache, oder?
**Tommy | matchicalcom** [05:03 - 05:08]: Aber das wäre so, glaube ich, bei der Stelle das Einzige, was wir, denke ich, noch einmal.
**Tommy | matchicalcom** [05:10 - 05:19]: Auch noch mitdenken sollten ein bisschen oder vielleicht auch, oder war ein Error, das hat es ja manchmal auch, oder da passt irgendwas nicht, aber das wäre jetzt auch gar nicht so schlimm.
**Tommy | matchicalcom** [05:19 - 05:25]: Aber das könnten wir uns einmal auch überlegen an der Stelle, weil manchmal ist es ja auch so, dass du sagst, da war jetzt irgendwas komisches drinnen oder.
**Michael Fossler** [05:27 - 05:32]: Klassiker, sowas wie Country Codes bei uns nicht da oder irgendwie Klaschi Deutschland drin anstatt ISO 2.
**Tommy | matchicalcom** [05:33 - 05:34]: Ja, ja, ja, genau.
**Tommy | matchicalcom** [05:34 - 05:38]: Sowas wäre vielleicht ganz gut, wenn wir so einen Flow hätten.
**Tommy | matchicalcom** [05:38 - 05:50]: Dann müsste man die API nicht komplett umbauen, sondern quasi XML lassen, States rein und wenn verarbeitet, kurze Meldungen an uns, Endpunkt definieren wir und halt mit den Attributen.
**Tommy | matchicalcom** [05:50 - 05:52]: Das ist glaube ich auch keine große Sache.
**Michael Fossler** [05:53 - 05:55]: Seid ihr da vom Payload her flexibel?
**Michael Fossler** [05:55 - 05:56]: Soll ich da einfach mal einen Vorschlag machen?
**Tommy | matchicalcom** [05:57 - 05:59]: Ja, wir sind auf komplett flexibel.
**Tommy | matchicalcom** [05:59 - 06:02]: Kannst du komplett, kannst du einfach einen Vorschlag machen, was du schicken würdest.
**Tommy | matchicalcom** [06:02 - 06:17]: Wichtig ist ja nur, wir haben eine ID von uns und eure ID, dass wir das Wissen quasi, dass wir zuordnen können, weil dann können wir ein System auch zurückschreiben, hey, das ist unter der ID jetzt bei Freelancer Map gepostet.
**Tommy | matchicalcom** [06:17 - 06:21]: Das ist ja immer das Beste eigentlich am Ende des Tages.
**Tommy | matchicalcom** [06:22 - 06:25]: Werden wir vielleicht eh brauchen, wenn wir zu den Bewerbungen kommen, oder?
**Tommy | matchicalcom** [06:25 - 06:35]: Weil dann ist die Stelle ja gepostet und dann gibt es Bewerbungen und dann wäre es natürlich cool, wenn wir einen Endpunkt hätten im ersten Schritt vielleicht.
**Tommy | matchicalcom** [06:35 - 06:37]: Zwei Endpunkte würden wahrscheinlich sogar reichen.
**Tommy | matchicalcom** [06:37 - 06:42]: Einmal fürs Erste, dass wir einfach Applications abrufen können.
**Tommy | matchicalcom** [06:45 - 06:49]: Oder im Idealfall, im Idealfall wieder Webhook.
**Tommy | matchicalcom** [06:50 - 06:55]: Es kommt eine Bewerbung rein und du schickst sie gleich an einen Endpunkt, den wir definiert haben, weiter.
**Tommy | matchicalcom** [06:55 - 06:57]: Es wäre vielleicht sogar noch schöner am.
**Michael Fossler** [06:57 - 07:07]: Ende des Tages unsere Methode, die wir bei vielen Kunden schon haben, also der nächste Endpunkt jetzt wo mit allen Bewerbungen hätten wir jetzt nicht, aber wir können euch halt praktisch in Echtzeit.
**Michael Fossler** [07:08 - 07:14]: In den Webhook schicken wieder und dann halt mit den Bewerbungsdaten, keine Ahnung, Bilder als Base codiert oder ich weiß nicht, was da Standard ist.
**Tommy | matchicalcom** [07:14 - 07:17]: Ja, das ist können wir eigentlich mit allem.
**Tommy | matchicalcom** [07:17 - 07:27]: Genau, also wir würden ja, habt ihr wahrscheinlich so ein Stammdatum wie, also vielleicht auch wieder habt ihr SoWas wie eure Freelancer Map ID, habt wahrscheinlich Vorname, Nachname, E Mail Adresse und eben das.
**Tommy | matchicalcom** [07:29 - 07:34]: Kann man da immer ein oder mehrere Dokumente mitschicken, Weiß ich nicht, mehrere.
**Tommy | matchicalcom** [07:34 - 07:35]: Muss er die kategorisieren?
**Michael Fossler** [07:36 - 07:44]: Ne, man kann Anhänge auswählen oder praktisch aus so einem Profil schon welche hochgeladen auswählen und noch so eine vCard mit senden, aber das war's dann.
**Tommy | matchicalcom** [07:45 - 07:47]: Die VK braucht man nicht, weil es ja registriert.
**Tommy | matchicalcom** [07:47 - 07:56]: Ihr habt ja da die Vorname, Nachname und die ID auch oder ihr werdet ja auch eine ID eure interne ID mitschicken können quasi und eben die Anhänge mit.
**Tommy | matchicalcom** [07:56 - 07:56]: Ja genau.
**Tommy | matchicalcom** [07:59 - 07:59]: Das war's.
**Tommy | matchicalcom** [07:59 - 08:08]: Und natürlich auf welche Stelle und da halt, da ist geil die Freelancer ID mit eurer Freelancer Map ID mitzuschicken, weil die ist ja bei euch eindeutig.
**Tommy | matchicalcom** [08:08 - 08:10]: Die haben wir dann bei uns im System schon.
**Michael Fossler** [08:14 - 08:23]: Bei den meisten Kunden machen wir es halt so, wir haben also die schicken uns in dem Feed ihre ID und dann ist es meistens halt irgendwie Project und dann die eure ID, wo wir das hinschicken.
**Konsti | matchicalcom** [08:23 - 08:34]: Aber eine Sache vielleicht, Michael, wir bräuchten das ganze multitenant, also weil wir selber sind nicht aktiv, sondern wir haben eine Software und unsere Kunden haben wiederum dann die Posten.
**Konsti | matchicalcom** [08:34 - 08:36]: Das heißt, wir bräuchten auch noch die Tenant ID.
**Tommy | matchicalcom** [08:36 - 08:37]: Achso, stimmt.
**Michael Fossler** [08:39 - 08:40]: Wie unterscheidet sich das?
**Michael Fossler** [08:40 - 08:44]: Ist es dann eine andere URL, eine andere oder wie ist es noch?
**Konsti | matchicalcom** [08:44 - 09:11]: Also an sich der Endpunkt wäre der gleiche, Du müsstest uns einfach mitsenden oder das müsstest du uns auch sagen, wie wir das dann machen, Initial auch am senden, aber wir müssten ja sozusagen von unseren Kunden, die dann ja auch automatisch eure Kunden sind, die müssen ja bei euch dedizierte Credentials haben, darum kümmern wir uns, dass wir andere Credentials für die, oder also noch besser wäre natürlich, weil wir uns auch in der Zukunft durchaus vorstellen könnten, dass wir euch Kunden bringen, ohne dass die überhaupt davor Kunden bei euch waren.
**Konsti | matchicalcom** [09:11 - 09:21]: Und dann wahrscheinlich am Anfang würden wir es nicht machen, dass wir das dann über euch, dass wir das dann für euch abrechnen und so weiter, sondern wir würden machen, das wären dann auch eure Kunden und wir machen vielleicht irgendwie ein Referral Ding oder sonst was.
**Konsti | matchicalcom** [09:21 - 09:30]: Aber gehen wir mal im ersten Szenario davon aus, dass die bei euch einen eigenen Tenant haben und wir nur der Gateway sind.
**Michael Fossler** [09:34 - 09:40]: Weil praktisch, also es wären dann bei uns eigene Importkunden sozusagen und pro Import Kunden können wir natürlich eine.
**Konsti | matchicalcom** [09:40 - 09:50]: Eigene Konfiguration hinterlegen und ihr müsstet uns dann im Webhook, also wir können alle den gleichen Webhook machen, aber wir bräuchten halt beim Webhook bräuchten wir die Info, welcher Kunde ist das bei euch, also sozusagen welcher Tenant bei uns?
**Tommy | matchicalcom** [09:51 - 09:52]: Ja, das wäre kein Problem.
**Tommy | matchicalcom** [09:53 - 09:54]: Das wäre kein Problem.
**Tommy | matchicalcom** [09:54 - 10:11]: Und Auch für die XML URL quasi, die würde man ja dann pro Import, also die kommt dann schon von Magical App, Magical Com keine On FirstSolution, I don't know, Cassini, Wavestone, I don't know.
**Tommy | matchicalcom** [10:11 - 10:17]: Und dann würdest wissen, okay, das ist für den definierten Tenant und beim Zurückschicken würdest.
**Tommy | matchicalcom** [10:17 - 10:21]: Ja genau, wir würden dir auch auf unserem Webhook.
**Tommy | matchicalcom** [10:22 - 10:24]: Webhook würden wir aber schon so machen, dass wir.
**Tommy | matchicalcom** [10:24 - 10:34]: Ja, natürlich müssen wir, geben wir dir unsere Credentials, weil du musst, dann musst du halt einfach nur die Tenant ID oder irgendwas in der Payload noch mitgeben, um welche Konfiguration sich.
**Konsti | matchicalcom** [10:35 - 10:37]: Was meintest du gerade mit Dings?
**Konsti | matchicalcom** [10:37 - 10:38]: Was meinst du damit?
**Tommy | matchicalcom** [10:40 - 10:49]: Das Stellenposting funktioniert über eine URL und die URL macht ein Get und rendert ein XML aus am Ende des Tages.
**Tommy | matchicalcom** [10:49 - 10:52]: Und da gibt es eine vorgegeben XML Structure und.
**Tommy | matchicalcom** [10:54 - 11:04]: Die klaubt sich quasi die Jobs zusammen und gibt sie gesammelt und Freelancer Map holt sich die alle Stunden.
**Tommy | matchicalcom** [11:04 - 11:05]: Achso, da gibt es auch nicht dieses.
**Konsti | matchicalcom** [11:05 - 11:07]: API Ding, sondern da ist es, da.
**Tommy | matchicalcom** [11:07 - 11:08]: Gibt es kein API Ding.
**Tommy | matchicalcom** [11:08 - 11:11]: Nein, das ist ein XML Feed, der erstellt wird am Ende des Tages.
**Tommy | matchicalcom** [11:11 - 11:15]: Zumindest so kenne ich es ja bis jetzt.
**Tommy | matchicalcom** [11:15 - 11:18]: Was funktioniert eigentlich ganz gut am Ende.
**Magnus Gernlein** [11:19 - 11:24]: Ponzi, weil du vorhin gemeint hast, wegen Kunden, die ihr uns eventuell bringen werdet.
**Magnus Gernlein** [11:25 - 11:26]: Ich habe da intern mal gesprochen.
**Magnus Gernlein** [11:27 - 11:37]: Ihr müsst bedenken, es ist immer Voraussetzung, auch wenn jetzt ein Kunde über ein anderes System kommt, wie jetzt Magical, Michi, das geht ja wahrscheinlich ein bisschen in die Richtung, wie es bei Broad Bean ähnlich ist.
**Magnus Gernlein** [11:38 - 11:44]: Trotzdem ist Voraussetzung, dass einer bei uns importiert, dass der bei uns den Enterprise Tarif hat, ganz egal, wo der herkommt.
**Magnus Gernlein** [11:44 - 11:45]: Nur dass sie das wissen.
**Konsti | matchicalcom** [11:45 - 11:50]: Ja, ja, aber das meine ich ja mit eben, wir bringen Kunden zur Enterprise, die nach vorne nicht ein.
**Magnus Gernlein** [11:50 - 11:55]: Genau, aber dieser Enterprise Tarif muss stehen, sobald der Import bei dem Kunden läuft.
**Magnus Gernlein** [11:55 - 11:56]: Das meinte ich nur.
**Tommy | matchicalcom** [11:56 - 11:57]: Ja, das muss man.
**Tommy | matchicalcom** [11:57 - 12:08]: Also da würden wir ja alle, also alle Kunden, die wir jetzt anbinden, Magnus, würden wir mal in einen Call, also mit dir gehen und einmal, dann wird man das einmal alles aufsetzen und fertig machen.
**Tommy | matchicalcom** [12:08 - 12:25]: Und also ich glaube, eure Quoten, eure Quoten, selbst wenn die noch kein Enterprise sind, sind oder eure Chancen bei 95 Prozent, wenn wir ihnen das so anbieten können, dass sie quasi automatisierte Bewerbungen ins System kriegen, wird es also kein.
**Tommy | matchicalcom** [12:25 - 12:27]: Ich kann mir nicht vorstellen, dass man das nicht macht.
**Magnus Gernlein** [12:27 - 12:32]: Dann weißt du, ich habe auch intern da mal gesprochen, da hat man es im letzten Gespräch drüber.
**Magnus Gernlein** [12:32 - 12:37]: Wir können da gerne sowas einfädeln, dass die zum Beispiel, wenn sie über euch kommen, irgendwie einen Rabatt auf diese Enterprise bekommen oder sowas.
**Magnus Gernlein** [12:38 - 12:39]: Also das sprechen wir dann noch durch.
**Magnus Gernlein** [12:39 - 12:42]: Jetzt geht es erstmal nur um die initiale Anbindung.
**Tommy | matchicalcom** [12:42 - 12:43]: Ja, das schauen wir mal.
**Tommy | matchicalcom** [12:43 - 12:50]: Also genau, aber am Ende des Tages, so simpel sind unsere Anforderungen.
**Tommy | matchicalcom** [12:50 - 12:55]: Das Einzige vielleicht noch einen Endpunkt wird man vielleicht dann noch brauchen, dass wir zurückmelden können.
**Tommy | matchicalcom** [12:55 - 12:59]: Wir haben die Bewerbung erhalten und bearbeitet oder sowas.
**Tommy | matchicalcom** [12:59 - 13:03]: Irgend sowas in der Richtung, weißt du, Weil sonst schickst du uns immer, weil wenn du nur.
**Michael Fossler** [13:05 - 13:07]: Kann der Webhook gleich was zurückgeben.
**Tommy | matchicalcom** [13:07 - 13:12]: Das könnte man machen, klar, könnte man auch machen, wenn wir es proceeded haben.
**Tommy | matchicalcom** [13:12 - 13:27]: Also wir würden es ja sowieso bei uns in eine Queue schreiben, aber man weiß ja nie, man weiß ja nie, was passiert, weil was ist, wenn dir mal breakt oder so, dann gebe ich dir Oerror zurück und dann darfst du bei dir nicht als bearbeitet markieren quasi halt.
**Michael Fossler** [13:27 - 13:31]: Achso, ja okay, Wenn ihr es eh nicht mit Cue habt, dann geht es ja gar nicht mit der direkten Response.
**Tommy | matchicalcom** [13:31 - 13:33]: Also brauchen wir doch, doch, doch, doch, doch, doch.
**Tommy | matchicalcom** [13:33 - 13:34]: Das würde schon machen.
**Tommy | matchicalcom** [13:35 - 13:39]: Würde sagen, wir haben es zumindest angenommen, weißt du, wenn wir dann intern.
**Tommy | matchicalcom** [13:39 - 13:47]: Ja, wenn wir dann intern, wenn wir dann intern beim Verarbeiten merken oder gibt es ein Problem, dann müssen wir sowieso schauen, was mit dem Datensatz los ist.
**Tommy | matchicalcom** [13:47 - 13:54]: Aber ich glaube, weil das bringt uns eh relativ wenig, weil was würde es bedeuten am Ende des Tages, wenn ich dir zurückgehe?
**Tommy | matchicalcom** [13:54 - 14:03]: Da gibt es ein Problem beim Datensatz, wenn ich ihn direkt verarbeite, wenn wir es nicht gleich solven können, dann schickst du es mir alle 5 Minuten gefühlt wieder.
**Tommy | matchicalcom** [14:05 - 14:15]: Wir müssen ja da irgendwo einen Stopp reinhauen und sagen, okay, da hat was, lasst mal genauer hinschauen, weil da haben wir irgendein Problem, weißt du, so bisschen von der Logik her am Ende des.
**Michael Fossler** [14:15 - 14:19]: Tages, dann würde ich einfach sagen, ich erwarte praktisch ein okay als Jason.
**Tommy | matchicalcom** [14:19 - 14:20]: Genau, genau.
**Tommy | matchicalcom** [14:20 - 14:27]: Sagst heiß, okay, irgend sowas sagst du gerne zurückkommen, willst ja völlig wurscht, da sind wir sehr flexibel.
**Michael Fossler** [14:27 - 14:28]: Perfekt.
**Tommy | matchicalcom** [14:29 - 14:30]: Ja, das wäre es.
**Tommy | matchicalcom** [14:30 - 14:38]: Also eigentlich so simple, wie sich's gerade anhört, so ist es auch und bringt mega Mehrwert kurz für mich zusammen.
**Michael Fossler** [14:38 - 14:44]: Also es gibt keinen großen Feed, wie ich es am Anfang angenommen habe, sondern praktisch pro Kunde gibt es einen eigenen Feed.
**Michael Fossler** [14:44 - 14:51]: Der Feed wird eine Konfiguration haben, wo dann pro Kunde die Credentials drin stehen, die dann an eure Wir können auch.
**Konsti | matchicalcom** [14:51 - 14:54]: Einen Feed für alle Kunden machen, je nachdem.
**Tommy | matchicalcom** [14:55 - 14:57]: Na, das ist doof, das würde ich nicht tun.
**Magnus Gernlein** [14:58 - 15:00]: Das gleiche Problem hatten wir mit Broadbean.
**Tommy | matchicalcom** [15:00 - 15:01]: Nein, das machen wir nicht.
**Tommy | matchicalcom** [15:04 - 15:06]: Davon abgesehen musst du sonst immer alles zusammenholen.
**Tommy | matchicalcom** [15:06 - 15:07]: Also es macht ja keinen Sinn.
**Tommy | matchicalcom** [15:07 - 15:12]: Also weißt du, und außerdem, vielleicht gibt es auch Kunden, die unterschiedlich konfiguriert sein wollen.
**Tommy | matchicalcom** [15:12 - 15:23]: Also wenn man den XML, manche sagen vielleicht, naja, ich will alle vier Stunden posten, andere sagen, naja, machen wir alle halbe Stunde sogar, weil ich will öfter, dass es abgerufen wird oder so.
**Tommy | matchicalcom** [15:23 - 15:26]: Ich weiß nicht, was ist denn euer Standard da?
**Tommy | matchicalcom** [15:26 - 15:27]: Was macht es denn da immer?
**Magnus Gernlein** [15:27 - 15:29]: Pro Stunde machen wir eine Stunde, würde ich sagen, oder?
**Tommy | matchicalcom** [15:31 - 15:32]: Das wäre perfekt.
**Michael Fossler** [15:33 - 15:36]: Wir sind wirklich flexibel, also je nachdem, wie groß die Feeds natürlich sind.
**Michael Fossler** [15:36 - 15:38]: Wenn 1000 Projekte sind, wird minütlich ein.
**Tommy | matchicalcom** [15:38 - 15:38]: Bisschen schwer, aber.
**Tommy | matchicalcom** [15:40 - 15:41]: Hat ja keiner.
**Tommy | matchicalcom** [15:41 - 15:42]: Hat ja keiner, hat ja keiner.
**Tommy | matchicalcom** [15:42 - 15:44]: Was ist denn der Standard?
**Tommy | matchicalcom** [15:44 - 15:49]: Also Wavestone ist schon gar nicht so klein und ich sehe dann immer so im Durchschnitt so 20 Projekte.
**Tommy | matchicalcom** [15:50 - 15:53]: Ständig ausgeschrieben, keine Haze oder so.
**Tommy | matchicalcom** [15:53 - 15:59]: Die haben wahrscheinlich so 50 bis 100, aber viel mehr, viel mehr nicht, oder.
**Michael Fossler** [16:03 - 16:05]: Ich sage nur falsch, weil man muss es ja bedenken, falls es manchmal.
**Tommy | matchicalcom** [16:10 - 16:14]: Wenn wir den Kunden haben, dann haben wir eh alle Freude oder.
**Michael Fossler** [16:18 - 16:23]: Mit den geräten Feeds besser, dann hätten wir auch mehr granulare Steuerung über die Kunden und halt über die Feeds und über die APIs.
**Michael Fossler** [16:24 - 16:32]: Genau, also wir bauen einen Queue auf, wo wir euch das hinschicken und solange es kein OK von euch gibt, dann schicken wir es euch wieder, bis ein OK kommt.
**Tommy | matchicalcom** [16:32 - 16:33]: Genau.
**Magnus Gernlein** [16:33 - 16:36]: Für dich wäre es ja dann bei neuen Kunden einfach wieder nur eine Config.
**Michael Fossler** [16:36 - 16:45]: Geschichte, oder Michi mit diesen mehreren Feeds wirklich die bessere Lösung auch für uns halt, weil sonst müssen wir da rumfuseln und spezielle Configs und so weiter in einem Ding anlegen.
**Tommy | matchicalcom** [16:45 - 16:47]: Und so hätten wir das System schon.
**Tommy | matchicalcom** [16:49 - 16:51]: Also ich fasse für mich auch kurz zusammen.
**Tommy | matchicalcom** [16:51 - 16:55]: Wir machen pro Kunde quasi eine URL, die wird dann festgelegt, individuell.
**Tommy | matchicalcom** [16:56 - 17:09]: Das machen wir uns dann aus, oder das besprechen wir, wenn wir neue haben, die wir anbinden, zack, zack, zack, dann machen wir uns da quasi aus, wie die URL heißt ihr holt euch das ab, wir machen die Attribute noch rein, das ist das Einzige, was noch rein muss.
**Tommy | matchicalcom** [17:09 - 17:21]: Und dann gibt es aber quasi einen Webhook, also eine Webhook API, die zurückkommt, Aber da sagen wir einfach, okay, das ist der und der Tenant zum Beispiel oder wir sagen dir, das ist die ID für den Kunden.
**Tommy | matchicalcom** [17:21 - 17:37]: Also Wavestone hat zum Beispiel die ID oder was auch immer, dann die musst du uns bitte mitschicken oder sowas, wenn du uns eine Bewerbung schickst, damit wir wissen, für welchen Tenant, welche Stelle und wer ist derjenige überhaupt Und dann liefern wir zurück.
**Tommy | matchicalcom** [17:37 - 17:42]: Ja, das ist die ID, die du uns geschickt hast, die du generiert hast, die ist okay.
**Tommy | matchicalcom** [17:42 - 17:45]: Success true mit der und dann kannst du es für dich ablegen.
**Tommy | matchicalcom** [17:46 - 17:46]: Genau.
**Tommy | matchicalcom** [17:46 - 17:48]: Und für dich ist es, wenn ihr.
**Michael Fossler** [17:48 - 17:52]: Mir halt mal ein Beispiel schickt von dem URL Aufbau oder wie die Authentication funktioniert.
**Michael Fossler** [17:52 - 17:54]: Ich weiß nicht, ob das OAuth, keine Ahnung, API Token.
**Tommy | matchicalcom** [17:56 - 17:58]: Ich weiß nicht, was schickt man am besten mit.
**Tommy | matchicalcom** [17:58 - 18:02]: Also bei Books, wenn man, was machen wir?
**Tommy | matchicalcom** [18:02 - 18:04]: Ich würde wahrscheinlich mit einer Basic aufgehen oder?
**Tommy | matchicalcom** [18:04 - 18:07]: Ich würde eine Basic aufnehmen, die reicht doch aus, oder?
**Tommy | matchicalcom** [18:07 - 18:11]: Also so sind ja quasi keine geheimen Daten oder?
**Tommy | matchicalcom** [18:11 - 18:12]: Also nichts großartiges.
**Michael Fossler** [18:12 - 18:15]: Ich kann auch mit Abi Talk, ich kann auch ohne Credentials leben.
**Tommy | matchicalcom** [18:17 - 18:19]: Ohne Credentials finde ich jetzt ein bisschen.
**Tommy | matchicalcom** [18:20 - 18:22]: Dann wissen wir nie vom.
**Tommy | matchicalcom** [18:22 - 18:28]: Wenn es dann wirklich einmal wer rausfindet und uns einen Trash schickt, das sollte man schon abfangen am Ende des Tages.
**Konsti | matchicalcom** [18:29 - 18:31]: Ich würde einfach API Token.
**Michael Fossler** [18:32 - 18:33]: Ja genau, das wäre einfach so auch.
**Tommy | matchicalcom** [18:33 - 18:34]: Für uns ein Bearer Token.
**Tommy | matchicalcom** [18:34 - 18:36]: Okay, dann schicken wir halt ein Bearer.
**Konsti | matchicalcom** [18:36 - 18:39]: Mit Beer, Beer, beer, beer, beer, beer.
**Tommy | matchicalcom** [18:41 - 18:41]: Ich inter.
**Tommy | matchicalcom** [18:44 - 18:46]: Das finde ich gut.
**Konsti | matchicalcom** [18:54 - 18:56]: Du hast den Einsatz verpasst.
**Tommy | matchicalcom** [18:59 - 19:03]: Ich glaube eher Iron Maiden oder so vielleicht ein bisschen.
**Tommy | matchicalcom** [19:06 - 19:07]: Das kannst du nicht verbergen.
**Tommy | matchicalcom** [19:08 - 19:11]: Was verrät mich alles?
**Tommy | matchicalcom** [19:16 - 19:20]: Wäre cool, wenn du es einmal durchschätzen könntest und Magnus, du uns kurz Bescheid gibst.
**Tommy | matchicalcom** [19:20 - 19:22]: Also was da der Aufwand ist.
**Tommy | matchicalcom** [19:23 - 19:24]: Wir sind da echt.
**Tommy | matchicalcom** [19:24 - 19:25]: Wir würden das gerne einfach.
**Tommy | matchicalcom** [19:25 - 19:25]: Genau.
**Konsti | matchicalcom** [19:28 - 19:34]: Wir können es noch nicht konkret sagen, aber auf jeden Fall Ziel irgendwann Q, dass wir das auf die Beine gestellt bekommen.
**Magnus Gernlein** [19:34 - 19:37]: Ja, ja, wir machen es so.
**Magnus Gernlein** [19:37 - 19:43]: Schick dem Michi alle Daten, die er braucht, dann kann er mir eine Einschätzung geben und dann gebe ich euch Bescheid.
**Konsti | matchicalcom** [19:44 - 19:44]: Perfekt.
**Tommy | matchicalcom** [19:45 - 19:51]: Dann würde ich noch einmal heute oder morgen eine kurze Zusammenfassung von dem machen, was wir brauchen, oder?
**Tommy | matchicalcom** [19:51 - 19:53]: Dann kannst du es einschätzen, dann schickst du es zurück.
**Tommy | matchicalcom** [19:53 - 19:59]: Dann sagen wir, genau, dann geben wir unser Go, solange wir nicht aus den Wolken fallen preistechnisch.
**Tommy | matchicalcom** [19:59 - 20:01]: Und dann wird man es einfach umsetzen.
**Magnus Gernlein** [20:01 - 20:03]: Wird nicht passieren, Da hatten wir es im letzten Gespräch schon drüber.
**Magnus Gernlein** [20:04 - 20:05]: Das wird im Rahmen bleiben.
**Tommy | matchicalcom** [20:05 - 20:06]: Perfekt, das wäre einfach gut.
**Tommy | matchicalcom** [20:06 - 20:08]: Wir wollen es natürlich auch.
**Michael Fossler** [20:08 - 20:13]: Vergleich halt irgendwelche Beispiel Requests und Payloads, wenn ihr schon habt, mit drin.
**Michael Fossler** [20:13 - 20:14]: Ansonsten überlege ich mir was.
**Konsti | matchicalcom** [20:16 - 20:17]: Da können wir uns nach dir richten.
**Konsti | matchicalcom** [20:17 - 20:19]: Also dann ist es völlig convenient.
**Konsti | matchicalcom** [20:19 - 20:21]: Aber wir müssen den Endpunkt auf unserer Seite erst noch bauen.
**Konsti | matchicalcom** [20:23 - 20:25]: Also den XML Feed, der ist ja definiert, Tommy, oder?
**Konsti | matchicalcom** [20:25 - 20:26]: Damit kennst du dich aus.
**Konsti | matchicalcom** [20:26 - 20:28]: Da gibt es einen fixen Standard, dem folgen wir einfach.
**Konsti | matchicalcom** [20:30 - 20:31]: Alles, was ihr habt.
**Konsti | matchicalcom** [20:31 - 20:33]: Wir nehmen gerne mal alle Daten oder.
**Michael Fossler** [20:33 - 20:34]: Wie die URL schon aufgebaut ist.
**Michael Fossler** [20:34 - 20:35]: Irgendwie sowas.
**Michael Fossler** [20:35 - 20:38]: Also je mehr ihr schon drin habt in dem Beispiel, desto besser.
**Tommy | matchicalcom** [20:39 - 20:40]: Ja, wir überlegen uns was.
**Magnus Gernlein** [20:40 - 20:45]: Genau, Michi, magst du ihnen vielleicht mal so ein Sample schicken von den Feldern, die wir brauchen?
**Michael Fossler** [20:47 - 20:48]: Kann ich machen.
**Tommy | matchicalcom** [20:51 - 20:53]: Perfekt, perfekt.
**Tommy | matchicalcom** [20:55 - 20:56]: Alles klar.
**Magnus Gernlein** [20:57 - 21:00]: Dann warten wir auf deine Zusammenfassung.
**Magnus Gernlein** [21:00 - 21:00]: Tommy.
**Tommy | matchicalcom** [21:01 - 21:02]: Kommt heute oder morgen?
**Tommy | matchicalcom** [21:02 - 21:03]: Tendenziell eher morgen.
**Tommy | matchicalcom** [21:03 - 21:05]: Ich würde es eher morgen schaffen.
**Tommy | matchicalcom** [21:05 - 21:06]: Ich bin heute ein bisschen.
**Magnus Gernlein** [21:07 - 21:13]: Ja, dann schauen wir, dass wir das noch vor Weihnachten in die Wege leiten und dann peilen wir mal Q an.
**Magnus Gernlein** [21:13 - 21:15]: Januar, Februar bis zur Fertigstellung, meine ich.
**Tommy | matchicalcom** [21:15 - 21:17]: Ja, absolut.
**Magnus Gernlein** [21:19 - 21:23]: Wenn wir es jetzt auf den Weg bringen, dann haben wir gute Chancen, dass wir es im Januar oder Februar über die Bühne kriegen.
**Tommy | matchicalcom** [21:23 - 21:24]: Das wäre super.
**Tommy | matchicalcom** [21:24 - 21:25]: Das wäre super.
**Tommy | matchicalcom** [21:26 - 21:26]: Das wäre für uns super.
**Michael Fossler** [21:26 - 21:27]: Perfekt.
**Tommy | matchicalcom** [21:27 - 21:27]: Super.
**Tommy | matchicalcom** [21:28 - 21:30]: Dann danke ich euch und wir hören uns.
**Tommy | matchicalcom** [21:30 - 21:30]: Bis dann.
