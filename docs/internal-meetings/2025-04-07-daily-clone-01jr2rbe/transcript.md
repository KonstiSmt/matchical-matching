# Daily (Clone)

**Konsti | matchicalcom** [00:09 - 00:09]: The run.
**Konsti | matchicalcom** [00:09 - 00:10]: Hast du es gesehen?
**Niklas | matchicalcom** [00:12 - 00:15]: Ja, das finde ich äußerst komisch, weil ich habe überall die Translation gemacht.
**Niklas | matchicalcom** [00:15 - 00:16]: Hast du es gesehen?
**Konsti | matchicalcom** [00:17 - 00:18]: Ja, habe ich.
**Konsti | matchicalcom** [00:18 - 00:20]: Aber eine Sache fand ich eh ein bisschen weird.
**Konsti | matchicalcom** [00:20 - 00:24]: Also ich habe es auch nicht so ganz verstanden, aber nur mal ganz generell.
**Konsti | matchicalcom** [00:28 - 00:28]: Also das ist.
**Konsti | matchicalcom** [00:29 - 00:32]: Also ich fand die Idee interessant, aber das ist eigentlich eine bad practice.
**Konsti | matchicalcom** [00:32 - 00:35]: Wenn du die Language übergeben willst, dann übergibst du mit getCurrentLocal.
**Konsti | matchicalcom** [00:36 - 00:42]: Aber einfach zu sagen, ich übergib die Language über einen Code, der en heißt.
**Konsti | matchicalcom** [00:58 - 01:04]: Also sorry, jetzt hier, also das sagst du, die Länge schon im Code, der en heißt und den übersetzt.
**Niklas | matchicalcom** [01:04 - 01:08]: Ich wusste nicht, ob man netcode local hat, deswegen dachte ich, ich mache einfach die leckere.
**Konsti | matchicalcom** [01:08 - 01:09]: Hast du immer.
**Niklas | matchicalcom** [01:11 - 01:12]: Hast du immer.
**Konsti | matchicalcom** [01:12 - 01:14]: Okay, ich würde halt einfach machen.
**Konsti | matchicalcom** [01:15 - 01:19]: Du könntest ja einfach machen, sozusagen hier, dass du den End token.
**Konsti | matchicalcom** [01:21 - 01:24]: Also ich will es jetzt nicht anfassen, weil das musst du bitte kurz machen.
**Niklas | matchicalcom** [01:24 - 01:26]: Ja, aber ich hatte dann.
**Konsti | matchicalcom** [01:26 - 01:27]: Entschuldigung.
**Konsti | matchicalcom** [01:27 - 01:32]: Du könntest einfach auch den End Token mit leerzeichner Go übergeben und den Star Token mit Leerzeichner.
**Niklas | matchicalcom** [01:33 - 01:34]: Das hatte ich zuerst.
**Niklas | matchicalcom** [01:34 - 01:35]: Das hatte ich auch zuerst.
**Niklas | matchicalcom** [01:35 - 01:42]: Das Problem ist aber, im Deutschen hast du jetzt weit, beide Tokens sind Star token vor und nach.
**Niklas | matchicalcom** [01:42 - 01:43]: Du hast gar kein End token.
**Konsti | matchicalcom** [01:44 - 01:48]: Ja, dann lässt du im Deutschen einfach den Leer bei der Übersetzung.
**Niklas | matchicalcom** [01:50 - 01:51]: Ja, ja, ja, genau.
**Niklas | matchicalcom** [01:51 - 01:54]: Aber du brauchst zwei Übersetzungen für den Starttoken bei Deutsch.
**Niklas | matchicalcom** [01:55 - 01:57]: Deswegen müsstest du dann zwei Variablen übergeben.
**Niklas | matchicalcom** [01:57 - 02:01]: Deswegen dachte ich, übergebe einfach language easier.
**Konsti | matchicalcom** [02:06 - 02:10]: Ne, weil wenn wir 10 Languages hätten, müsstest du hier 10 verschiedene Dinge handeln.
**Konsti | matchicalcom** [02:10 - 02:11]: Das ist eigentlich nicht easy.
**Konsti | matchicalcom** [02:13 - 02:15]: Du machst den Code komplexer, wenn du language übergibst.
**Niklas | matchicalcom** [02:15 - 02:17]: Ja gut, das stimmt.
**Niklas | matchicalcom** [02:17 - 02:18]: Dann mache ich halt den.
**Konsti | matchicalcom** [02:19 - 02:20]: Und aus irgendeinem Grund, ich verstehe es nicht.
**Konsti | matchicalcom** [02:20 - 02:25]: Ich habe mir den Code auch angeguckt, er müsste eigentlich funktionieren, aber ich habe hier days.
**Niklas | matchicalcom** [02:28 - 02:33]: Ja, und vor allem, das liegt nicht an getcurrentlocal, weil ich habe ja en.
**Niklas | matchicalcom** [02:33 - 02:35]: Also da muss wohl dein currentLocal.
**Niklas | matchicalcom** [02:35 - 02:37]: Was ist deine Grundlocal?
**Konsti | matchicalcom** [02:37 - 02:38]: En us.
**Konsti | matchicalcom** [02:41 - 02:43]: Current local, nicht en.
**Konsti | matchicalcom** [02:43 - 02:45]: Die current local en us.
**Niklas | matchicalcom** [02:47 - 02:48]: Ja, ich weiß.
**Konsti | matchicalcom** [02:49 - 02:51]: Oder eben hier de.
**Niklas | matchicalcom** [02:56 - 02:58]: Kannst du auch nicht sagen, muss man reinschauen.
**Niklas | matchicalcom** [02:58 - 02:59]: Kann ich dir jetzt nicht im Daily.
**Konsti | matchicalcom** [02:59 - 03:02]: Sagen, ist jetzt nicht super kritisch.
**Konsti | matchicalcom** [03:02 - 03:04]: Reicht mir später anschaust.
**Niklas | matchicalcom** [03:06 - 03:08]: Ich finde es super komisch, aber ja gut, da weiß ich.
**Niklas | matchicalcom** [03:08 - 03:10]: Als Input Variable, da hast du recht.
**Niklas | matchicalcom** [03:14 - 03:24]: Ich hatte es wie gesagt erst so rum, nur dann habe ich gesehen, es gibt zwei vor Parameter und dann dachte ich, OK, shit, da muss ich ja genau den deutschen Case irgendwie handeln.
**Niklas | matchicalcom** [03:25 - 03:27]: Dann wäre das auch so spezifisch German.
**Niklas | matchicalcom** [03:27 - 03:30]: Aber ich habe schon eine Idee, wie man es machen kann.
**Niklas | matchicalcom** [03:34 - 03:35]: Guck mal.
**Konsti | matchicalcom** [03:37 - 03:37]: Equal.
**Konsti | matchicalcom** [03:37 - 03:39]: Equal machen.
**Konsti | matchicalcom** [03:42 - 03:43]: Das ist ja nun eine sign.
**Konsti | matchicalcom** [03:43 - 03:45]: Du müsstest ja so machen, oder?
**Niklas | matchicalcom** [03:46 - 03:47]: Nein.
**Niklas | matchicalcom** [03:47 - 03:48]: Ja, war es doch.
**Konsti | matchicalcom** [03:48 - 03:49]: Nein, es war so.
**Konsti | matchicalcom** [03:51 - 03:52]: Echt?
**Konsti | matchicalcom** [03:52 - 03:54]: Das heißt, du hast nur eine Sign gemacht.
**Konsti | matchicalcom** [03:54 - 03:55]: So, es ist gleich.
**Niklas | matchicalcom** [03:55 - 03:57]: Und das hat er vergessen.
**Niklas | matchicalcom** [03:57 - 03:58]: Das hat er nicht ange.
**Niklas | matchicalcom** [04:00 - 04:01]: Ja, mach so.
**Niklas | matchicalcom** [04:03 - 04:06]: Nee, nee, nee, das hat Autista nicht angelegt.
**Niklas | matchicalcom** [04:06 - 04:07]: Ich hab selber geschrieben.
**Niklas | matchicalcom** [04:07 - 04:09]: Ich habe da kein JTBT verwendet.
**Niklas | matchicalcom** [04:12 - 04:14]: Ja, Mach doppel ist gleich drei.
**Niklas | matchicalcom** [04:14 - 04:17]: Würde ich jetzt nicht machen, weil dann tut er extra abkacken, wenn es kein String ist.
**Niklas | matchicalcom** [04:17 - 04:19]: Aber eigentlich ist immer ein String.
**Niklas | matchicalcom** [04:19 - 04:21]: Warte, stopp mal, stopp mal, stopp mal.
**Niklas | matchicalcom** [04:22 - 04:28]: Geh mal bitte auf Data und tu mal die Translations machen.
**Konsti | matchicalcom** [04:29 - 04:31]: Da habe ich geguckt, ist es Translation.
**Niklas | matchicalcom** [04:33 - 04:34]: Alles gut.
**Niklas | matchicalcom** [04:34 - 04:39]: Stimmt ja, die Translations sind klar.
**Niklas | matchicalcom** [04:39 - 04:41]: Before ist gar nicht translated.
**Konsti | matchicalcom** [04:41 - 04:42]: Richtig.
**Niklas | matchicalcom** [04:42 - 04:43]: Im Englischen.
**Niklas | matchicalcom** [04:43 - 04:45]: Und das ist ja kein Input parameter.
**Niklas | matchicalcom** [04:45 - 04:47]: Das heißt, das war das falsch, was du gerade verbessert hast.
**Niklas | matchicalcom** [04:50 - 04:52]: Im Englischen ist for need translated.
**Niklas | matchicalcom** [04:52 - 04:53]: Das heißt, die.
**Konsti | matchicalcom** [04:55 - 04:56]: Bug war.
**Konsti | matchicalcom** [05:00 - 05:02]: Das hast du bei dem Fall hier nicht getestet.
**Niklas | matchicalcom** [05:03 - 05:04]: Ich habe es auf Deutsch getestet.
**Konsti | matchicalcom** [05:07 - 05:10]: Ich mache was mit Multi Language Support und teste in einer Sprache.
**Konsti | matchicalcom** [05:11 - 05:15]: Das zählt nicht morgen.
**Konsti | matchicalcom** [05:18 - 05:21]: Also ist wie gesagt nicht sauber, aber.
**Niklas | matchicalcom** [05:22 - 05:23]: Ich ändere es ab.
**Niklas | matchicalcom** [05:23 - 05:24]: Alles gut.
**Niklas | matchicalcom** [05:27 - 05:28]: Ein ist gleich nur morgen.
**Konsti | matchicalcom** [05:28 - 05:29]: Thomas.
**Tommy | matchicalcom** [05:32 - 05:36]: Leider, ich weiß nicht, was los ist.
**Tommy | matchicalcom** [05:36 - 05:39]: Wir haben einen Temperatursturz, Leute.
**Tommy | matchicalcom** [05:39 - 05:41]: Ich glaube, ich weiß, woran es liegt.
**Tommy | matchicalcom** [05:42 - 05:44]: Von zwei Tagen um 20 Grad.
**Tommy | matchicalcom** [05:44 - 05:45]: Es hat, wir haben.
**Tommy | matchicalcom** [05:45 - 05:52]: Oder mehr, wir haben am Samstag 23 Grad oder so gehabt, gestern acht oder neun.
**Tommy | matchicalcom** [05:52 - 05:57]: Und jetzt schaue ich gerade, es hat 0,9 Grad und meine Birne verkraftet das gar nicht.
**Tommy | matchicalcom** [05:58 - 06:05]: Diese Luftdruckunterschied da weißt du, diese krassen, so schnellen Unterschiede in der Luft, dann.
**Konsti | matchicalcom** [06:05 - 06:07]: Würdest du wahrscheinlich echt nicht tauchen gehen.
**Tommy | matchicalcom** [06:09 - 06:10]: Es ist wirklich Wahnsinn.
**Tommy | matchicalcom** [06:10 - 06:12]: Also ich kriege schon hin.
**Tommy | matchicalcom** [06:12 - 06:19]: Ich gehe jetzt gleich einmal wieder meine Nebenhöhlen ausinhalieren.
**Niklas | matchicalcom** [06:20 - 06:23]: Aber das funktioniert wahrscheinlich nicht mehr, wenn du schon auf so viel Druck bist.
**Tommy | matchicalcom** [06:26 - 06:28]: Nein, aber es ist echt krass.
**Tommy | matchicalcom** [06:28 - 06:31]: Also die Corinne sagt auch, sie spürt es auch so extrem.
**Tommy | matchicalcom** [06:31 - 06:33]: Also ich glaube, wir sind ein bisschen anfällig.
**Tommy | matchicalcom** [06:34 - 06:36]: Und jetzt lässt sich auch ganz klar.
**Tommy | matchicalcom** [06:36 - 06:41]: Also was krasses, ich höre dann schon wieder auf, Horace, wir haben genug zu tun.
**Tommy | matchicalcom** [06:41 - 06:46]: Aber vor paar Jahren war das bei mir so, dass ich immer gemerkt habe, wenn sich das Wetter ändert.
**Tommy | matchicalcom** [06:46 - 06:55]: Und dann habe ich halt leicht Kopfschmerzen gehabt, einen Tag vorher oder so, weil ich gemerkt habe, scheiße, der Luftdruck verändert sich.
**Tommy | matchicalcom** [06:56 - 06:58]: Ist ja dieser Mythos, das Wetter spüren quasi.
**Tommy | matchicalcom** [06:59 - 07:03]: Weißt du, das sagen die Leute, aber das hätte nur was mit dem Luftdruckunterschied zu tun.
**Tommy | matchicalcom** [07:03 - 07:13]: Und das habe ich jetzt aktuell nicht mehr, sondern wenn sich der Luftdruck geändert hat, spüre ich es halt in meinen Nebenhöhlen und Nebenschmerzen.
**Tommy | matchicalcom** [07:13 - 07:14]: Ich glaube, das kannte ich bis.
**Tommy | matchicalcom** [07:14 - 07:16]: Das habe ich eigentlich noch nie gehabt.
**Tommy | matchicalcom** [07:16 - 07:20]: Und der Konstikant, da glaube ich ein Lied davon singen, oder du hast da ja, nein, oder du hast da ja.
**Konsti | matchicalcom** [07:20 - 07:24]: Ich hatte das chronisch früher jahrelang Probleme, oder?
**Tommy | matchicalcom** [07:24 - 07:25]: Also du weißt ja wie.
**Tommy | matchicalcom** [07:27 - 07:30]: Und aus dem Grund, da muss ich was tun dagegen.
**Tommy | matchicalcom** [07:30 - 07:33]: Ich kriege schon in den Griff, alles gut.
**Tommy | matchicalcom** [07:33 - 07:37]: Aber das ist ja immer wichtig zu verstehen, woher kommt es überhaupt?
**Tommy | matchicalcom** [07:37 - 07:41]: Damit man dann das auch durchzieht, ne.
**Niklas | matchicalcom** [07:41 - 07:43]: Was du da erzählst mit den Kopfschmerzen.
**Niklas | matchicalcom** [07:43 - 07:49]: Das hatte ich früher während der Schule auch, dass sich irgendwie das Wetter extrem geändert hat und dann hatte ich auch echt chronisch Kopfschmerzen.
**Niklas | matchicalcom** [07:49 - 07:51]: Manchmal tagsüber während der Schule.
**Tommy | matchicalcom** [07:53 - 07:56]: Denke ich gell, übelst nervig.
**Niklas | matchicalcom** [07:56 - 07:57]: Zum Glück jetzt gar nichts mehr davon.
**Konsti | matchicalcom** [07:58 - 07:59]: Ich bin auch alles los.
**Konsti | matchicalcom** [08:00 - 08:01]: Aber in Lindau habe ich immer wieder.
**Niklas | matchicalcom** [08:01 - 08:05]: Mit der Nase der Konsole, der hat eine Stauballergie.
**Tommy | matchicalcom** [08:05 - 08:13]: Klar, da fährst du nur hin und bist schon verschnupft oder du brauchst ja nur zum Ort Lindau fahren, um deine n.
**Konsti | matchicalcom** [08:15 - 08:18]: So schlimm ist es nicht, dann wäre es ja echt psychosomatisch.
**Konsti | matchicalcom** [08:19 - 08:21]: Aber es ist wirklich, du musst den.
**Tommy | matchicalcom** [08:21 - 08:24]: Teppich sehen und dann geht's los.
**Konsti | matchicalcom** [08:24 - 08:26]: Es braucht dann schon so vier bis 6 Stunden.
**Konsti | matchicalcom** [08:26 - 08:29]: Also in dem Fall hat es wahrscheinlich echt was mit der Nase zu tun.
**Konsti | matchicalcom** [08:29 - 08:30]: Naja, egal.
**Konsti | matchicalcom** [08:30 - 08:31]: Leute, zwei Sachen.
**Konsti | matchicalcom** [08:33 - 08:48]: Zum einen, ich habe dieses scheiß ding jetzt gespürte Reihenfolge und ihr werdet nicht glauben, der Fix ist genau der gleiche Fix, den ich gemacht habe, wo ich damals gesagt habe, ich habe es gefunden, ich habe es deployed und ich schaue alles durch und am Ende komme ich zu der Stelle hin, stell fest, warum ist die Order da weg?
**Konsti | matchicalcom** [08:49 - 08:50]: Die war aus dem Aggregate wieder raus.
**Konsti | matchicalcom** [08:50 - 08:52]: Also jetzt natürlich no offense, die hat keiner von uns entfernt.
**Konsti | matchicalcom** [08:52 - 09:04]: Aber Niki, wenn du vielleicht gerade zeitlich deployed hast wie ich, wo ich das schnell gemacht habe und ich glaube, wir waren da beide gleichzeitig dran, dann hat vielleicht mein Publish ging durch, ich habe es deployed, wo war ich da dran?
**Niklas | matchicalcom** [09:04 - 09:06]: Ich war da nichts an Order dran.
**Konsti | matchicalcom** [09:06 - 09:09]: Du warst nicht an Orders dran, aber vielleicht lief im Hintergrund ein Merch, ich weiß es nicht.
**Konsti | matchicalcom** [09:09 - 09:18]: Fakt ist auf jeden Fall, ich habe echt geguckt, genau die Änderungen, die ich reingemacht habe, die es resolved hat, war weg und die muss direkt danach wieder weg gewesen sein.
**Konsti | matchicalcom** [09:18 - 09:20]: Also ich check's nicht.
**Niklas | matchicalcom** [09:20 - 09:22]: Ich kann dir ganz klar sagen, ich habe nichts mit Order angefangen.
**Konsti | matchicalcom** [09:22 - 09:23]: Ich weiß, dass du dies gemacht hast, sehr klar.
**Konsti | matchicalcom** [09:23 - 09:27]: Ich habe nur jetzt nur dass ihr wisst, aktuell nur für Admins.
**Tommy | matchicalcom** [09:27 - 09:30]: Schaut mal hier kurz durchaus sein, aber kommt's dir?
**Tommy | matchicalcom** [09:30 - 09:33]: Hast du schon einmal überlegt, dass der out System vielleicht irgendein Problem hat?
**Tommy | matchicalcom** [09:34 - 09:40]: Also weiß ich nicht, aber warum glaube ich, dass es vielleicht sogar kleine Systematik haben könnte?
**Tommy | matchicalcom** [09:40 - 09:47]: Wir haben ja jetzt auch zwei, dreimal festgestellt, dass bei den Tenants auf einmal die aktiven Sprachen umgestellt waren.
**Konsti | matchicalcom** [09:48 - 09:49]: Das ist wieder was anderes.
**Konsti | matchicalcom** [09:49 - 09:53]: Und die aktiven Sprachen sind jetzt nicht mehr umgestellt, wo ich es für alle disabled habe und es niemand mehr darf.
**Konsti | matchicalcom** [09:53 - 09:55]: Also es war ein User.
**Konsti | matchicalcom** [09:57 - 10:00]: Das war ein User, auch wenn es keiner gewesen ist und keiner gecheckt hat.
**Konsti | matchicalcom** [10:00 - 10:01]: Am Ende waren es User.
**Konsti | matchicalcom** [10:01 - 10:02]: Ich habe überall reingeguckt.
**Konsti | matchicalcom** [10:02 - 10:03]: Also ich kann mal schauen.
**Tommy | matchicalcom** [10:03 - 10:07]: Wäre mal spannend, nur bei dem Button einzubauen, wer das ist.
**Tommy | matchicalcom** [10:07 - 10:10]: Ich traue das dem Hanes zu.
**Tommy | matchicalcom** [10:10 - 10:16]: Ich brauche die Mail war ja wirklich eine Frechheit.
**Tommy | matchicalcom** [10:16 - 10:18]: Eigentlich müsste man eben zurückschreiben.
**Tommy | matchicalcom** [10:18 - 10:22]: Also die Mail war ja wirklich hart an der Grenze, oder?
**Konsti | matchicalcom** [10:25 - 10:30]: Seitdem ich verhindert habe, dass User diesen Button ändern können, ist dieser Button nicht mehr geändert worden.
**Konsti | matchicalcom** [10:30 - 10:34]: Also ne, aber nur ganz kurz, Leute, was ich euch schnell sagen möchte ist, damit ihr euch nicht wundert.
**Konsti | matchicalcom** [10:34 - 10:41]: Für Admins ist es momentan so, dass man hier eine sieht, sieht, sieht.
**Konsti | matchicalcom** [10:41 - 10:42]: Das sehen nur wir.
**Konsti | matchicalcom** [10:43 - 10:50]: Das ist sozusagen die vordere Zahl ist die Order von dem und die hintere Zahl ist die Order von dem.
**Konsti | matchicalcom** [10:50 - 10:57]: Das habe ich jetzt gemacht, dass man auf die Schnelle immer wenn wir einen CV Export machen, dass wir direkt ist hier irgendeine Order?
**Konsti | matchicalcom** [10:57 - 11:01]: Nicht gleich, falls es mal der Fall sein sollte, sehen wir den Fehler sofort.
**Konsti | matchicalcom** [11:02 - 11:04]: Aber ich bin mir ziemlich sicher, dass es daran gelegen hat.
**Konsti | matchicalcom** [11:04 - 11:05]: Ich war mir damals ja schon sicher.
**Konsti | matchicalcom** [11:06 - 11:08]: Ich wusste nicht, dass mein Fix wieder weg ist.
**Konsti | matchicalcom** [11:14 - 11:16]: Ansonsten um kurz hier efficient.
**Konsti | matchicalcom** [11:16 - 11:18]: Also das habe ich erledigt.
**Konsti | matchicalcom** [11:18 - 11:26]: Als nächstes kümmere ich mich jetzt direkt darum, dass ich diesem Michael das DocuSign Ding sende und dem Alex kurz noch mal antwort und mich bedankt, dass er das so schnell prozessiert hat alles.
**Konsti | matchicalcom** [11:27 - 11:31]: Und dann mache ich mich an die Companies und das ist mein Tagesziel.
**Konsti | matchicalcom** [11:32 - 11:35]: Ich passe gerade noch ein Prompt an von den Focus Areas, der dafür gefügt hat.
**Konsti | matchicalcom** [11:35 - 11:44]: Das Dings war ansonsten, das mache ich jetzt noch kurz, das braucht noch 10 Minuten Hyper halb durch, aber ansonsten, wie gesagt, Docusign und dann Companies.
**Konsti | matchicalcom** [11:44 - 11:46]: Und das war mein Tages kurz, um das zu erleinen.
**Niklas | matchicalcom** [11:46 - 11:52]: Wenn du dann Companies fertig hast, gibt es dann eine Methode, um Companies zu erstellen und eine andere?
**Konsti | matchicalcom** [11:53 - 11:58]: Ich bin ziemlich sicher, ziemlich zentralisiert, mache da mache ich einen Loom.
**Konsti | matchicalcom** [11:58 - 12:01]: Kann ich jetzt noch nicht hundertprozentig sagen Partner und Client.
**Niklas | matchicalcom** [12:01 - 12:02]: Wenn du einen Partner gut.
**Niklas | matchicalcom** [12:02 - 12:05]: Ja, ja, da eine große wäre richtig nice.
**Konsti | matchicalcom** [12:05 - 12:08]: Genau, wo man einfach drei Booleans übergibt ist.
**Niklas | matchicalcom** [12:09 - 12:15]: Und vielleicht ein bisschen bessere Description, weil bei if Client ist Partner, das war ein bisschen verwirrend, aber.
**Tommy | matchicalcom** [12:17 - 12:24]: Um das noch einmal konzeptionell noch einmal vielleicht zu durchdenken, wenn du soweit bist, oder eher machst du es jetzt mal technisch.
**Konsti | matchicalcom** [12:26 - 12:29]: Also einen Großteil weiß ich schon und da muss ich einfach nur mal umbauen.
**Konsti | matchicalcom** [12:29 - 12:31]: Und wenn ich dann im Feinschliff bin, sage ich dir Bescheid.
**Tommy | matchicalcom** [12:32 - 12:32]: Okay.
**Tommy | matchicalcom** [12:32 - 12:34]: Weil ich habe jetzt gerade.
**Tommy | matchicalcom** [12:34 - 12:36]: Mein Kopf beginnt halt zu laufen, wenn ihr genau sowas sagt.
**Tommy | matchicalcom** [12:38 - 12:39]: Ist ja logisch.
**Tommy | matchicalcom** [12:40 - 12:42]: Aber ich glaube, ich habe da ganz.
**Tommy | matchicalcom** [12:42 - 12:46]: Also ich hätte da glaube ich nicht konkrete Ideen, aber ich glaube ganz ein gutes Bild.
**Tommy | matchicalcom** [12:46 - 12:54]: Und ich halte weiterhin, das wird eine super Sache, dass wir da Companies als Reiter haben und dann kann man ja anzeigen, was die Companies sind gerade im Moment.
**Tommy | matchicalcom** [12:54 - 12:55]: Und dann machst du sie zu Kunden.
**Konsti | matchicalcom** [12:55 - 12:59]: Machst du zu Partnern oder halt zu beiden im Frontend.
**Konsti | matchicalcom** [12:59 - 12:59]: Ja, stimmt.
**Konsti | matchicalcom** [12:59 - 13:03]: Da gibt es ja dann auch noch Implikationen, wie wir dann unsere Informationshierarchie ändern.
**Tommy | matchicalcom** [13:06 - 13:07]: Relativ großen.
**Tommy | matchicalcom** [13:07 - 13:14]: Das hat auch für den Workflow der Stammdaten schon einen massiven Einfluss.
**Tommy | matchicalcom** [13:15 - 13:19]: Jetzt nicht für die Merchview vom Berater, da ändert sich gar nichts.
**Tommy | matchicalcom** [13:20 - 13:24]: Aber in weiterer Folge ändert sich ein bisschen.
**Tommy | matchicalcom** [13:27 - 13:30]: Es wird einfacher, wenn ich schnell darüber nachdenke.
**Konsti | matchicalcom** [13:30 - 13:32]: Lass mal jetzt nicht ins Detail reingehen.
**Konsti | matchicalcom** [13:36 - 13:39]: Mir war wichtig, dass wir mal in eine Routine kommen, was das Daily angeht.
**Konsti | matchicalcom** [13:39 - 13:42]: Wir können uns ja danach noch austauschen, aber um Niki möglichst schnell auch wieder zu entlasten.
**Tommy | matchicalcom** [13:43 - 13:45]: Chico, was steht bei dir?
**Tommy | matchicalcom** [13:45 - 13:48]: Also das machst du heute, Konzi und du meldest dich, wenn du was brauchst.
**Niklas | matchicalcom** [13:50 - 13:52]: Yes, bei mir.
**Niklas | matchicalcom** [13:52 - 13:55]: Also erstmal Thomas, alles Gute dir noch in Person.
**Tommy | matchicalcom** [13:55 - 13:57]: Danke, danke, danke.
**Niklas | matchicalcom** [13:57 - 13:58]: Auf.
**Niklas | matchicalcom** [13:58 - 13:59]: Hat es ein gutes Wochenende?
**Tommy | matchicalcom** [14:00 - 14:01]: Ja, war okay.
**Tommy | matchicalcom** [14:01 - 14:05]: Also Samstag war nicht so gut, aber der Sonntag war dann wieder alles okay.
**Konsti | matchicalcom** [14:05 - 14:09]: Aber das ist ja klar, wenn du Geburtstag hast, Thomas, das kann kein schöner Tag sein.
**Konsti | matchicalcom** [14:09 - 14:12]: Da hat die ganze Menschheit 1 Minute eingelegt.
**Tommy | matchicalcom** [14:12 - 14:13]: So ist es.
**Tommy | matchicalcom** [14:13 - 14:15]: So wie Trump ungefähr.
**Tommy | matchicalcom** [14:15 - 14:18]: Jetzt ist der Arsch noch ein Jahr länger da.
**Niklas | matchicalcom** [14:21 - 14:22]: Ne, gut.
**Niklas | matchicalcom** [14:22 - 14:23]: Ich habe auf jeden Fall Papier getrunken.
**Niklas | matchicalcom** [14:23 - 14:24]: Sogar ein Vino.
**Tommy | matchicalcom** [14:25 - 14:26]: Sehr gut.
**Niklas | matchicalcom** [14:27 - 14:28]: Wow.
**Konsti | matchicalcom** [14:28 - 14:30]: Holy shit.
**Niklas | matchicalcom** [14:31 - 14:31]: Was?
**Konsti | matchicalcom** [14:31 - 14:34]: Ich hab grad mal geguckt, weil es ja dings.
**Konsti | matchicalcom** [14:34 - 14:39]: Übers Wochenende sind sie nochmal über 10 % abgestürzt, die Kurse.
**Niklas | matchicalcom** [14:39 - 14:41]: Ja, wegen den Zöllen jetzt.
**Konsti | matchicalcom** [14:41 - 14:42]: Holy.
**Konsti | matchicalcom** [14:42 - 14:44]: Ja, die sind ja schon am Freitag und Donnerstag.
**Konsti | matchicalcom** [14:44 - 14:45]: Oh mein Gott, Alter.
**Niklas | matchicalcom** [14:46 - 14:47]: Ja gut.
**Tommy | matchicalcom** [14:47 - 14:49]: Ich schau gerade gar nicht.
**Konsti | matchicalcom** [14:49 - 14:50]: Mach's nicht.
**Niklas | matchicalcom** [14:52 - 14:53]: Das ist so hart.
**Niklas | matchicalcom** [14:53 - 14:57]: Aber auf jeden Fall kurz hier zurück.
**Niklas | matchicalcom** [14:57 - 15:02]: Mein Plan ist, wir haben ja letztes Mal dann gesprochen gegen Ende und so.
**Niklas | matchicalcom** [15:02 - 15:13]: Das heißt, ich würde relativ schnell und rough diese Checkboxen reinmachen, diese drei Cases handeln und dann eigentlich die Merchview planen, so im Kopf mal aufräumen.
**Konsti | matchicalcom** [15:16 - 15:18]: Welche Checkboxes meinst du?
**Niklas | matchicalcom** [15:18 - 15:34]: Also wenn du jetzt gerade beim Duplicate Check bist, dann hast du gerade nur eine Liste von Consultants, die du halt auswählen kannst und dass du halt so gesehen dann drei Action triggern kannst, die wir gesagt haben, entweder, hey, der ist completely independent, einfach nur, dass man sie visuell irgendwie hat.
**Niklas | matchicalcom** [15:34 - 15:42]: Vielleicht macht es auch keinen Sinn anzugehen, das ist zumindest noch so ein bisschen im Kopf für diesen Mittelscreen, dass du.
**Tommy | matchicalcom** [15:42 - 15:44]: Auf alle drei Sachen hinkommst, Chico.
**Tommy | matchicalcom** [15:44 - 15:45]: Aber sonst würde ich, ich würde mir.
**Konsti | matchicalcom** [15:45 - 15:47]: Auch erstmal nur einen Entry Point bauen.
**Tommy | matchicalcom** [15:47 - 15:54]: Ja, und wenn du es nur unten mit drei Buttons machst oder so, den Rest überlegen wir uns dann.
**Tommy | matchicalcom** [15:54 - 15:55]: Würde ich machen.
**Konsti | matchicalcom** [15:57 - 16:14]: Gut, dass du sagst, dann schiebe ich das noch dazwischen, bevor ich jetzt Companies angehe, schiebe ich kurz dazwischen diese extra Flag sozusagen und die Logik dazu, dass es die beim CVU auch gibt und so weiter, dass du die Cases schon direkt nachstellen kannst, dass es eine Repass Logik gibt und eine Merge Logik gibt.
**Niklas | matchicalcom** [16:15 - 16:18]: Genau, mach das mal.
**Niklas | matchicalcom** [16:18 - 16:22]: Es ist jetzt nicht urgent urgent, ich werde es wahrscheinlich erst morgen brauchen.
**Niklas | matchicalcom** [16:22 - 16:27]: Aber wenn du sagst, das ist eher was kleines, wäre es natürlich geil, wenn du es jetzt schon machst, weil dann kann ich es gleich richtig denken.
**Konsti | matchicalcom** [16:27 - 16:31]: Ja, eben, deswegen schiebe ich ein, bevor ich jetzt die Company.
**Niklas | matchicalcom** [16:31 - 16:45]: Also mein Ziel primär ist erstmal, sich Gedanken zu machen, wie man das Ganze zumindest grob visuell und prozesstechnisch auflöst und das dann mit euch zu besprechen und dann kann ich richtig in die Def gehen.
**Niklas | matchicalcom** [16:46 - 16:47]: Was haltet ihr davon?
**Konsti | matchicalcom** [16:50 - 16:54]: Was heißt aber du aber einfach links, rechts oder aber, ja, mach dir Gedanken.
**Tommy | matchicalcom** [16:56 - 17:00]: Oder mach es andersrum, wenn du willst.
**Tommy | matchicalcom** [17:00 - 17:06]: Wenn du willst, dann kann ich auch dir die Mockups in 10 Minuten zeichnen, die wir brauchen.
**Tommy | matchicalcom** [17:06 - 17:09]: Also da braucht, ich habe jetzt nicht.
**Niklas | matchicalcom** [17:09 - 17:18]: Gemeint, dass mich das den ganzen Tag blockieren wird, aber ich meine, man muss sich ja schon, sorry, Thomas, quick and.
**Tommy | matchicalcom** [17:18 - 17:19]: Dirty relativ schnell rein.
**Tommy | matchicalcom** [17:20 - 17:23]: Also ich glaube, relativ schnell quick and dirty reinspringen.
**Tommy | matchicalcom** [17:23 - 17:33]: Das einzige, wo man vielleicht einmal 20 Minuten ein bisschen detaillierter darüber nachdenken muss, ist, wie man Engagements miteinander gegenüberstellt.
**Tommy | matchicalcom** [17:33 - 17:35]: Das ist, glaube ich, das einzige.
**Konsti | matchicalcom** [17:36 - 17:38]: Aber Niki, was ich vielleicht machen würde.
**Niklas | matchicalcom** [17:39 - 17:49]: Eine Grundfrage, die man sich fragen muss, ist halt, man hat hier links so gesehen den neuen Berater, man hat rechts den alten Berater und wo machst du jetzt den Merch machst du eine neue Column für den Merch.
**Niklas | matchicalcom** [17:49 - 17:53]: Wäre irgendwie voll dämlich, würde voll links.
**Konsti | matchicalcom** [17:53 - 17:55]: Die Boxen an und rechts die Boxen an.
**Tommy | matchicalcom** [17:55 - 17:56]: Ja, logisch.
**Tommy | matchicalcom** [17:56 - 18:04]: Und dann hast du so welche Optionen wie wähle alles wie übernimm nur.
**Tommy | matchicalcom** [18:04 - 18:09]: Also per Default sollen immer alle bestehenden aktiviert sein.
**Konsti | matchicalcom** [18:10 - 18:13]: Weißt du, was ich glaube, Niki?
**Konsti | matchicalcom** [18:13 - 18:18]: Also was ich zumindest immer mache und was ja am meisten hilft, fang doch immer mit dem an, was die kleinste Unbekannte ist.
**Konsti | matchicalcom** [18:18 - 18:23]: Wenn ich eine ganz klare Vorstellung von Screen habe und nicht weiß, wie die Logik läuft, dann baue ich erstmal den Screen.
**Konsti | matchicalcom** [18:23 - 18:26]: Aber in den meisten Fällen habe ich eine Vorstellung von, wie läuft die Logik und Funktionalität.
**Konsti | matchicalcom** [18:27 - 18:30]: Dann baue ich einfach, ich würde es einfach links in der Liste, aber da.
**Niklas | matchicalcom** [18:30 - 18:31]: Brauche ich erst mal dein Code.
**Niklas | matchicalcom** [18:31 - 18:33]: Das heißt, da bin ich blockiert von dir.
**Konsti | matchicalcom** [18:33 - 18:36]: Deswegen schaue ich, dass ich das fertig habe, bevor du loslegst.
**Konsti | matchicalcom** [18:36 - 18:42]: Und dann machst du links in der Liste, rechts eine Liste, listest die Sachen einfach genauso auf, wie sie jetzt aufgebaut sind, bloß mit einer Checkbox.
**Konsti | matchicalcom** [18:42 - 18:50]: Und es gibt unten einen Button mit Merge sozusagen und dann wird eine Action gecallt, die kann ich vielleicht auch noch machen, wo dann die einen rausfliegen, die.
**Tommy | matchicalcom** [18:50 - 18:57]: Anderen dingsen und das ganze at once, das Stuff, weil das wirst du sicher haben irgendwann einmal, ist sowas wie.
**Tommy | matchicalcom** [18:57 - 19:06]: Und genau, per Default lässt du immer die bestehenden, also die bestehenden aktiviert und die neu gekommen sind, die musst du halt aktiv dazu haken.
**Tommy | matchicalcom** [19:06 - 19:16]: Und dann kann man oben drüber für die einzelnen Settings uns noch so was überlegen wie use only new one sozusagen.
**Tommy | matchicalcom** [19:17 - 19:20]: Dann aktivierst du automatisch die bestehenden und machst nur die neuen.
**Konsti | matchicalcom** [19:20 - 19:21]: Das sind ja die Verfeinerungen.
**Konsti | matchicalcom** [19:21 - 19:23]: Aber ich würde am Anfang wirklich.
**Tommy | matchicalcom** [19:28 - 19:28]: Dann.
**Konsti | matchicalcom** [19:28 - 19:30]: Ist ein guter Checkpoint, um zusammen darüber zu sprechen.
**Tommy | matchicalcom** [19:30 - 19:31]: Ja, genau.
**Tommy | matchicalcom** [19:31 - 19:43]: Aber genau, und bei den Projekteinsätzen habe ich mir auch überlegt, dass wir sowas ähnliches wie die linken Cards machen, nur halt die ein bisschen aufbohren.
**Tommy | matchicalcom** [19:43 - 20:00]: Also dann machen wir dafür keine Descriptions und keine Skills im Detail rein, sondern eben wir geben dir, also wir machen von der Information links und rechts quasi, glaube ich, würde ich machen, dass wir.
**Niklas | matchicalcom** [20:00 - 20:01]: Da hätte ich schon was Gutes.
**Niklas | matchicalcom** [20:01 - 20:03]: Ich glaube, wir brauchen die Detailbox.
**Niklas | matchicalcom** [20:03 - 20:12]: Aber ich glaube, was wir machen können, ist, anstatt dass wir die Projekte untereinander liste, können wir sie eigentlich in Narrow listen.
**Niklas | matchicalcom** [20:12 - 20:14]: Weiß es aber ganz kurz, Leute, ganz.
**Konsti | matchicalcom** [20:14 - 20:17]: Kurz, weil wie gesagt, wir müssen uns nicht besprechen, dass wir uns die nächsten drei Tage nicht mehr austauschen müssen.
**Konsti | matchicalcom** [20:17 - 20:24]: Genau, mit den ganz einfachen Sachen, Languages, Job Experiences, Certificates und Co.
**Tommy | matchicalcom** [20:24 - 20:30]: Mach erstmal die, hast dann kommst und wenn du die hast, dann machen wir.
**Niklas | matchicalcom** [20:31 - 20:35]: Thomas, ich will auch nur sagen, ich habe schon Gedanke zu den Projekten, das kann ich dann mal schen mit euch.
**Konsti | matchicalcom** [20:36 - 20:39]: Lass uns mit dem leichteren und unbekannteren starten.
**Tommy | matchicalcom** [20:39 - 20:45]: Ich habe nämlich auch Gedanken dazu und da kommen sie sicher auch dann, wenn.
**Konsti | matchicalcom** [20:45 - 20:50]: Ihr beide Ideen habt, dann liefere ich euch nur was im Hintergrund braucht und fertig.
**Konsti | matchicalcom** [20:51 - 20:51]: Aber Okay.
**Konsti | matchicalcom** [20:51 - 20:53]: Thomas, was steht bei dir auf der Agenda?
**Niklas | matchicalcom** [20:53 - 20:55]: Nur kurz, Thomas.
**Konsti | matchicalcom** [20:55 - 20:55]: Ja.
**Konsti | matchicalcom** [20:55 - 20:58]: Sagt du erstmal, du musst noch deinen Punkt fertig machen.
**Niklas | matchicalcom** [20:58 - 20:59]: Ja.
**Tommy | matchicalcom** [21:02 - 21:04]: Also das startest du heute aber an, oder?
**Niklas | matchicalcom** [21:05 - 21:14]: Genau, das starte ich heute an und ich bin eigentlich recht zuversichtlich, sobald man das, wie wir gerade schon gesagt haben, aufgelöst haben, kann man da relativ gut durchbrechen.
**Niklas | matchicalcom** [21:14 - 21:28]: Ich werde auch reinmachen als erstes mal, es dürfte nicht lang brauchen, weil wir haben schon drüber nachgedacht, dass man die Sidebar jetzt einklappen kann, dass es eine Funktionalität gibt mit Sidebar einklappen, auf und zu die sidebar.
**Konsti | matchicalcom** [21:29 - 21:29]: Okay.
**Niklas | matchicalcom** [21:30 - 21:31]: Oder was haltet ihr davon?
**Niklas | matchicalcom** [21:31 - 21:33]: Sorry, ich habe das so gesagt, wenn.
**Konsti | matchicalcom** [21:33 - 21:35]: Du einen guten Weg findest, dann ist cool.
**Tommy | matchicalcom** [21:36 - 21:41]: Die View braucht sowieso Fullscreen quasi, also das ist eh klar.
**Niklas | matchicalcom** [21:41 - 21:45]: Genau, ich glaube, das brauchen wir generell jetzt mal die Sidebar einklappen.
**Tommy | matchicalcom** [21:47 - 21:51]: Das haben wir ja schon noch mal geschaut, auf jkb was bauen oder das war jetzt.
**Niklas | matchicalcom** [21:51 - 21:52]: Das geht super einfach.
**Niklas | matchicalcom** [21:52 - 21:54]: Du musst nur eine CSS Variable ändern, konzi.
**Niklas | matchicalcom** [21:55 - 21:59]: Nur die Osui Sidebar, bla bla bla.
**Tommy | matchicalcom** [21:59 - 21:59]: Da war nichts.
**Tommy | matchicalcom** [21:59 - 22:03]: Genau, das war jetzt alles gut.
**Niklas | matchicalcom** [22:03 - 22:03]: Ich check das ab.
**Niklas | matchicalcom** [22:03 - 22:04]: Ich habe schon.
**Konsti | matchicalcom** [22:04 - 22:05]: Da gibt es aber auch nativ.
**Konsti | matchicalcom** [22:05 - 22:09]: Da gibt es aber auch von Outsystems für die Sidebar, weil wir benutzen ja die Outsystems sidebar.
**Niklas | matchicalcom** [22:09 - 22:12]: Ja, ich meine von OutSystems die CSS Variable von der Sidebar.
**Konsti | matchicalcom** [22:12 - 22:15]: Ne, aber du musst mal setzen, es gibt eine JavaScript Action.
**Konsti | matchicalcom** [22:15 - 22:17]: Es gibt eine Action sozusagen.
**Niklas | matchicalcom** [22:17 - 22:19]: Ah ja, ja, glaube ich.
**Niklas | matchicalcom** [22:19 - 22:20]: Die habe ich auch schon gesehen.
**Niklas | matchicalcom** [22:20 - 22:29]: Aber gut, das von der Sidebar gibt es natürlich super, ne?
**Konsti | matchicalcom** [22:30 - 22:33]: Sidebar Close und so weiter ist für die Sidebar, die wir beim Engagement verw.
**Tommy | matchicalcom** [22:37 - 22:38]: Es ist egal.
**Niklas | matchicalcom** [22:40 - 22:42]: Ich untersuch's, Konzi, da musst du dich nicht drum kümmern.
**Niklas | matchicalcom** [22:42 - 22:44]: Ich schaue in Blogeinträgen dies.
**Tommy | matchicalcom** [22:46 - 22:52]: Ich würde keine technische Schuld sehen, wenn wir diese eine CSS Variable.
**Tommy | matchicalcom** [22:53 - 22:55]: Die tut uns nicht weh.
**Tommy | matchicalcom** [22:55 - 23:01]: Also wenn es was gibt, dann gibt es einen Chico, du schaust 3 Minuten nach und sonst passt.
**Niklas | matchicalcom** [23:01 - 23:02]: Genau, ich schau nach.
**Niklas | matchicalcom** [23:02 - 23:04]: Kannst du alles gut mit meins nicht im Daily machen.
**Konsti | matchicalcom** [23:08 - 23:10]: Aber recherchiere das mal noch kurz.
**Niklas | matchicalcom** [23:10 - 23:11]: Auf jeden Fall.
**Niklas | matchicalcom** [23:11 - 23:12]: Ich recherchiere meine Sachen immer.
**Konsti | matchicalcom** [23:13 - 23:15]: Also ich meine outsystems spezifisch.
**Niklas | matchicalcom** [23:15 - 23:18]: Ja, ja, ich schaue schon out systems bei solchen Sachen.
**Niklas | matchicalcom** [23:19 - 23:21]: Und wo machst du.
**Tommy | matchicalcom** [23:21 - 23:22]: Was steht bei mir an.
**Tommy | matchicalcom** [23:22 - 23:30]: Bei mir steht an, dass ich jetzt bei dir haben wir am Donnerstag, Freitag migriert, die lieben Leute von der Waves Gown.
**Tommy | matchicalcom** [23:30 - 23:33]: Ich habe eigentlich gedacht, dass alle jetzt ihre SIP Zugänge haben.
**Tommy | matchicalcom** [23:33 - 23:37]: Jetzt habe ich jetzt schon drei Nachrichten, dass die Leute nicht nach SIP kommen.
**Tommy | matchicalcom** [23:37 - 23:41]: Also das werde ich jetzt schnell abfrühstücken, 5 Stunden chargen.
**Tommy | matchicalcom** [23:41 - 23:47]: Aber ich hoffe, dass mich das in einer, dass ich da in einer Stunde oder maximal zwei durch bin.
**Tommy | matchicalcom** [23:49 - 23:51]: Dann gehe ich das Thema.
**Tommy | matchicalcom** [23:52 - 23:54]: Der Daniel hat nach einer Slide gefragt.
**Tommy | matchicalcom** [23:54 - 24:00]: Ich würde mir da mal gemeinsam mit Corinne vielleicht auch Gedanken machen, wie wir das so eine One Page einmal aufbauen könnten.
**Niklas | matchicalcom** [24:00 - 24:02]: Was hat er für eine Slide gefragt?
**Tommy | matchicalcom** [24:04 - 24:05]: Warst du da gar nicht in der Mail drin?
**Tommy | matchicalcom** [24:05 - 24:17]: Eben nach einem One Badger, den er vor potenzielle Interessenten schicken kann, damit die wissen, was ist magical überhaupt?
**Tommy | matchicalcom** [24:17 - 24:29]: Weil die meisten dann doch wieder halt nicht auf unsere Homepage gehen und sich das anschauen, sondern das klassische Medium von der Präsentation brechen wir halt so schnell nicht auf.
**Tommy | matchicalcom** [24:29 - 24:30]: Das ist halt so.
**Tommy | matchicalcom** [24:30 - 24:35]: Aber das würde ich mir dann anschauen, nachdem ich die SIP Thematik bei den Leuten abgefrühstückt hab.
**Tommy | matchicalcom** [24:37 - 24:41]: Dann weiß ich noch nicht, also dann weiß ich nicht, wie die Reihenfolge ist.
**Tommy | matchicalcom** [24:41 - 24:54]: Aber was bei mir jetzt ansteht, ist, wir haben ja nächste Woche mit dem Oliver einen Termin zu unserer Vision, morgen auch einen Termin zu Michael.
**Tommy | matchicalcom** [24:54 - 25:11]: Da würde ich einmal wirklich auch das, was wir schon gemacht haben, noch einmal aufgreifen und wirklich auch versuchen, in einer Struktur mal zu bekommen, dass wir auch die Sachen, wenn wir sie besprechen, irgendwie auch verorten können.
**Tommy | matchicalcom** [25:12 - 25:14]: Aber ich bin mir noch nicht 100 % sicher, wie ich das Format mache.
**Tommy | matchicalcom** [25:14 - 25:18]: Ich will es aber so einfach wie möglich halten, mit so wenig Aufwand wie möglich.
**Tommy | matchicalcom** [25:19 - 25:25]: Aber ich merke, dass wir es brauchen, dass wir irgendwie einen Platz schaffen.
**Niklas | matchicalcom** [25:27 - 25:27]: Wo.
**Tommy | matchicalcom** [25:27 - 25:37]: Wir unsere Themen reinschreiben können, die wir haben, aber auch schnell eine Visualisierung haben, um mit Leuten darüber zu sprechen, die jetzt nicht so im Topic drinnen sind.
**Tommy | matchicalcom** [25:37 - 25:38]: Wisst ihr was?
**Niklas | matchicalcom** [25:38 - 25:42]: Ich glaube auch, also was runtergeschriebenes, finde ich, wäre persönlich gut.
**Niklas | matchicalcom** [25:42 - 25:49]: Also ich habe ein Video gesehen, Thomas, wie gesagt, ich fand es gut und so, aber das war echt eine high class Vision, was wir bzw.
**Niklas | matchicalcom** [25:49 - 25:52]: Auch schon momentan haben und nicht so im spezifischen.
**Niklas | matchicalcom** [25:52 - 25:56]: Im cv Export kannst du dann deine ganzen Sachen später auch anpassen.
**Tommy | matchicalcom** [25:58 - 26:02]: Da brauchst du ja dann fünf, 20 kleine Videos, weißt du?
**Tommy | matchicalcom** [26:02 - 26:03]: Das ist halt so die Frage.
**Niklas | matchicalcom** [26:03 - 26:05]: Deswegen würde ich kein Video dafür machen.
**Niklas | matchicalcom** [26:05 - 26:09]: Genau, Nini, ich meine, das hast du super gemacht, aber ich glaube, sowas sollten wir mal ein Dokument unterschreiben.
**Tommy | matchicalcom** [26:09 - 26:18]: Ich habe es auch nicht, dass Kritik wahrgenommen ist, sondern ich bin ich bin da noch sehr vage in meiner, sehr, sehr, sehr vage in meiner.
**Tommy | matchicalcom** [26:18 - 26:26]: Ich weiß nicht genau, wie wir es aufbauen, darum, dass das für mich so, da stehe ich noch ein bisschen vor einer Denkaufgabe, aber ich glaube, dass wir es brauchen, weil wir.
**Tommy | matchicalcom** [26:26 - 26:36]: Ich habe jetzt gestern mit dem Konsti kurz drüber haben wir kurz gesprochen und dann kam halt auf die Idee okay, wir müssen jetzt dieses E Mail ändern, z.b.
**Tommy | matchicalcom** [26:37 - 26:48]: das müssen wir irgendwo und das geht im Backlog irgendwie unter und ist dann doch irgendwie ein Feature am Ende des Tages, das dann ja doch irgendwie cool ist, weißt du?
**Tommy | matchicalcom** [26:48 - 26:52]: Und das muss man irgendwo halt schnell im Zug richten.
**Niklas | matchicalcom** [26:52 - 26:52]: Ich glaube auch.
**Tommy | matchicalcom** [26:54 - 27:01]: Und so und so funktioniert es, weil das ist ja auch eine Art Doku von der Software, weißt du?
**Tommy | matchicalcom** [27:01 - 27:12]: Und vielleicht sollten wir uns gleich überlegen, jetzt wo ich 3 Minuten darüber nachdenke, ob wir das gleich so Doku like vielleicht machen, weil dann haben wir immer gleich auch Dokumentation dabei.
**Tommy | matchicalcom** [27:15 - 27:19]: Eine Seite aufbauen, wo man dann immer eine Short Description hat.
**Konsti | matchicalcom** [27:19 - 27:39]: Okay, du musst ja diese typischen Dokumentationsdinger, die auch, also da würde ich mal gucken, da gibt es ja diese Tools, die bei ganz vielen Sachen Standard sind, die dir gleich deine, dein Doku CMS und auch dein API Dings liefern, weißt du, du kennst doch diese typischen API Views und so weiter.
**Niklas | matchicalcom** [27:39 - 27:50]: Aber ich glaube, dass es technisch und Funktionalität gibt und ich würde einfach mal Funktionalität, natürlich muss man sich schon Gedanken.
**Konsti | matchicalcom** [27:50 - 28:01]: Des Zeugs nahe bringen, aber ist ja nicht so, dass er alles verstehen muss, weil danach muss er erstmal setzen, sondern wir geben dir die Möglichkeit, das kostenlos zu testen und boarden sie an.
**Konsti | matchicalcom** [28:01 - 28:03]: Das ist viel mehr wert als jedes.
**Konsti | matchicalcom** [28:04 - 28:13]: Also wir sollten da schon auch dem entgegenkommen, aber auch mal kurz ein bisschen wollen die wirklich irgendwas, was sie genau durchlesen müssen?
**Konsti | matchicalcom** [28:13 - 28:16]: Und davon machen sie dann eine Entscheidung fest, die überhaupt keinen Impact hat.
**Tommy | matchicalcom** [28:16 - 28:18]: Vielleicht auch was für uns in weiterer Folge.
**Niklas | matchicalcom** [28:19 - 28:21]: Ich fände das sehr wichtig für uns, habe ich auch schon drüber nachgedacht.
**Niklas | matchicalcom** [28:21 - 28:23]: Ich persönlich finde es sehr gut in.
**Tommy | matchicalcom** [28:23 - 28:31]: Weiterer Folge alles ab irgendwann einmal fünf, 10 User, wenn du sagen kannst, geh bitte zuerst mal auf den, also du willst deine E Mail ändern.
**Tommy | matchicalcom** [28:32 - 28:44]: Hey Hannes, ich muss dir nicht einmal eine e Mail, ich muss dir quasi nicht einmal E Mail schreiben, sondern kann dich darauf verweisen und kann sagen, da findest du die zwei Klicks, die du machen musst, um deine fucking E Mail zu ändern.
**Tommy | matchicalcom** [28:44 - 28:48]: Oder Passwort vergessen, keine Ahnung, Thomas, aber.
**Konsti | matchicalcom** [28:48 - 28:51]: Dir schreiben doch auch alle wegen Passwort.
**Konsti | matchicalcom** [28:51 - 28:53]: Aber dann kann man ja, die Leute lesen sowas nicht.
**Tommy | matchicalcom** [28:54 - 29:01]: Wenn ich weiß, wo es genau steht, dann würde ich immer darauf verweisen und würde sagen Leute, so viel Self Service kann ich erwarten.
**Tommy | matchicalcom** [29:01 - 29:02]: Ich weiß es ja auch nicht.
**Konsti | matchicalcom** [29:04 - 29:08]: Ich bin bei dir, dass wir früher oder später nicht um eine Dokumentation drumherum kommen.
**Konsti | matchicalcom** [29:09 - 29:17]: Ich bin aber auch gleichzeitig der Meinung, dass wenn wir eine Dokumentation anfangen, dann sollten wir sie gleich richtig aufsetzen müssen, auch nach dem passenden Tool finden, weil am Ende ist das auch ein bisschen eine Toolfrage.
**Konsti | matchicalcom** [29:17 - 29:23]: Aber ich bin auch gleichzeitig wiederum ziemlich klar der Meinung, dass das die meisten User lesen keine Doku ist mein einerdings.
**Konsti | matchicalcom** [29:24 - 29:28]: Und das zweite ist, wir haben bisher noch nicht viele ich weiß nicht, wie ich das Tool bedienen soll fragen.
**Konsti | matchicalcom** [29:29 - 29:32]: Und wenn die Leute nicht mehr fragen, dann werden sie erst recht nicht eine Doku aufmachen.
**Tommy | matchicalcom** [29:33 - 29:40]: Ich sehe da absolut keine Tool für unsere Dokumentation in keinster Art und Weise.
**Tommy | matchicalcom** [29:40 - 29:56]: Die API vielleicht bei der API ja, aber ich sehe das als das ist eine ganz einfache HTML Seite, die wir aufbauen, wo das Feature oben drüber steht und ein Loom Video als Link dabei ist.
**Tommy | matchicalcom** [29:56 - 30:00]: Und vielleicht nehmen wir sogar was loom uns als AI.
**Tommy | matchicalcom** [30:00 - 30:09]: Also da gibt es immer so eine Zusammenfassung, die wir unten noch dazu reinkopieren und das war's im ersten Schritt.
**Tommy | matchicalcom** [30:09 - 30:12]: Im ersten Schritt, nicht mehr und nicht weniger.
**Tommy | matchicalcom** [30:12 - 30:16]: Und das können wir in weiterer Folge sogar als Input nehmen.
**Tommy | matchicalcom** [30:17 - 30:21]: Wenn du matt damit fütterst, dann in weiterer Folge und das war's.
**Tommy | matchicalcom** [30:21 - 30:23]: Und nicht mehr und nicht weniger.
**Niklas | matchicalcom** [30:26 - 30:26]: Ich persönlich.
**Niklas | matchicalcom** [30:26 - 30:29]: Warte kurz, kann ich bitte kurz was sagen dazu?
**Niklas | matchicalcom** [30:30 - 30:33]: Ich persönlich würde das ganz anders sehen.
**Niklas | matchicalcom** [30:33 - 30:36]: Also nicht ganz anders, sondern so wie ich das verstanden habe.
**Niklas | matchicalcom** [30:36 - 30:38]: Was ist ja der Grund, warum du das jetzt angehen willst?
**Niklas | matchicalcom** [30:38 - 30:42]: Ist ja auch ein bisschen, weil der Oliver gesagt hat, der würde gerne Vision haben.
**Niklas | matchicalcom** [30:44 - 30:49]: Das ist doch der Grundpunkt dahinter, Thomas.
**Niklas | matchicalcom** [30:51 - 30:57]: Der Grundgedanke, warum man darüber gerade nachdenkt, ist, weil Oliver ja auch gesagt hat, er würde gerne Vision sehen, oder?
**Tommy | matchicalcom** [31:00 - 31:02]: Ja und nein, es ist auch noch.
**Niklas | matchicalcom** [31:02 - 31:05]: Aber es ist beides.
**Tommy | matchicalcom** [31:05 - 31:10]: Auch für uns sollte das gut sein, dass wir wissen, wo stehen wir, was machen wir als nächstes?
**Niklas | matchicalcom** [31:11 - 31:13]: Und da bin ich auch voll bei dir.
**Niklas | matchicalcom** [31:13 - 31:17]: Aber ich persönlich glaube, wir sollten schauen, was brauchen wir jetzt am besten?
**Niklas | matchicalcom** [31:17 - 31:18]: Und z.b.
**Niklas | matchicalcom** [31:18 - 31:27]: ich habe ja dein Video angeschaut und was ich persönlich, haben wir auch schon gesagt, ist gut, gibt eine Vision, was wir momentan haben, aber eigentlich gibt es keine detaillierte Vision.
**Niklas | matchicalcom** [31:27 - 31:47]: Und ich persönlich fände es gut, wenn wir ein cooles Dokument haben, wo wir aber ganz klar eigentlich dieses technische und dieses Doku Doku Ding und wie du dahin kommst trennen, weil das wird ein zusätzlicher Workload sein und eher da einfach nur niederschreiben, unsere Features, die noch down the road in der Roadmap kommen.
**Niklas | matchicalcom** [31:47 - 31:52]: Aber so high class, also da rede ich jetzt wirklich von high class, also z.B.
**Niklas | matchicalcom** [31:52 - 32:02]: hey, du hast bei uns einen CV Export und da kannst du detailed verschiedene Filter, verschiedene Anpassungen annehmen, die nur für diesen CV übernommen werden.
**Niklas | matchicalcom** [32:02 - 32:07]: Du kannst es genau auf das jeweilige Template matchen mit den Anforderungen, die es dir in dem Template gibt.
**Niklas | matchicalcom** [32:07 - 32:10]: Das heißt, es gibt ein komplexes Template Management.
**Niklas | matchicalcom** [32:10 - 32:19]: Solche Sachen würde ich dann Stichpunkten in verschiedenen Subkategorien runterschreiben und das würde mir persönlich voll helfen.
**Niklas | matchicalcom** [32:19 - 32:25]: Würde ich jetzt magical evaluieren und auch Hey, will ich das nutzen, was kommt da alles noch?
**Niklas | matchicalcom** [32:25 - 32:28]: Und magical besser verstehen, da würde ich ganz klar diese Trennung machen.
**Niklas | matchicalcom** [32:29 - 32:39]: Hey, das sind die Feature und hier ist die, und zwar die großen Features, also in etwa die Epics und hier ist die Funktionalität bzw.
**Niklas | matchicalcom** [32:39 - 32:41]: Die Doku für das Technische.
**Niklas | matchicalcom** [32:42 - 32:43]: Was haltet ihr davon?
**Tommy | matchicalcom** [32:50 - 32:56]: Ich habe in meinem Kopf nie an Technik gedacht, wenn ich an Vision oder an das denke.
**Tommy | matchicalcom** [32:56 - 33:04]: Aber wie gesagt, lasst mich einmal bitte einen Vorschlag machen, bevor wir im Detail über das diskutieren.
**Konsti | matchicalcom** [33:09 - 33:23]: Meine zwei Kerngedanken, die ich vielleicht noch mal sagen möchte, ist zum einen eben, wenn Oliver irgendwas braucht, wir müssen mit ihm in ein Meeting, wir müssen uns untersuchen und so weiter und so fort.
**Konsti | matchicalcom** [33:23 - 33:27]: Aber jeder andere sagt ja, sie möchten es mal testen und das ist ja das normale, oder?
**Niklas | matchicalcom** [33:27 - 33:29]: Aber das kommt ja nicht nur von Oliver.
**Niklas | matchicalcom** [33:29 - 33:31]: Also das, glaube ich, fehlt uns generell.
**Tommy | matchicalcom** [33:32 - 33:39]: Ich beziehe das nicht nur auf Oliver, ich beziehe das auf eben auf uns würde es helfen quasi.
**Tommy | matchicalcom** [33:39 - 33:43]: Und es hilft viele andere fragen ja auch.
**Tommy | matchicalcom** [33:43 - 33:47]: Also der Dirk hat ja auch sieben und dreiig Fragen gehabt, der Thorsten auch.
**Tommy | matchicalcom** [33:47 - 33:53]: Da kann man sowas immer rausziehen und kann ja, schaut her, das ist die Planung am Ende.
**Konsti | matchicalcom** [33:54 - 33:58]: Aber wir haben doch vor kurzem wiederum gesagt, wir planen gar nicht mehr so viel, weil wir es nicht wissen.
**Konsti | matchicalcom** [33:58 - 34:00]: Wir müssen einfach schauen, es entwickelt sich.
**Tommy | matchicalcom** [34:00 - 34:03]: Aber grob, aber grob wissen wir doch unsere Eckpfeiler.
**Tommy | matchicalcom** [34:03 - 34:13]: Also wir wissen ja, dass wir keine, dass wir keine Ahnung, ich weiß jetzt nicht, dass wir kein Jira aufbauen, das wissen wir ja.
**Tommy | matchicalcom** [34:13 - 34:15]: Wir wissen ja unsere, wir wissen, dass.
**Niklas | matchicalcom** [34:15 - 34:19]: Es einen Detail CV Export gibt, wo du Anpassungen machen kannst, filtern kannst.
**Niklas | matchicalcom** [34:19 - 34:25]: Ich glaube, sowas in einem Satz runterzuschreiben, dass sie einfach nur checken, was tun wir alles für Paints abfrisch, das ist interessant.
**Tommy | matchicalcom** [34:26 - 34:32]: Ich weiß gar nicht, ob das sogar schon wieder zu detailliert ist für die, mit denen wir sprechen.
**Tommy | matchicalcom** [34:32 - 34:38]: Aber was sie vielleicht wissen wollen ist, gibt es so ein RFI Management, RFB Management?
**Tommy | matchicalcom** [34:39 - 34:41]: Was ist damit ein bisschen genauer gemeint?
**Tommy | matchicalcom** [34:43 - 34:46]: Kann ich da meine Frame Contract, aber.
**Konsti | matchicalcom** [34:46 - 34:55]: Dann stehen da viele Sachen drauf und dann, okay gut, was er schon gefragt hat, ist, was habt ihr jetzt schon, was habt ihr in einem Monat, was habt ihr drei Monate, was habt ihr in sechs Monaten?
**Niklas | matchicalcom** [34:57 - 34:59]: Vergiss mal Oliver, das kommt nicht nur vom Oliver her.
**Konsti | matchicalcom** [35:00 - 35:08]: Ja, nein, vom Prinzip her wäre es ja schon wichtig, dass man da drin auch abcheckt, was ist jetzt schon da, in welcher State, also wie gut ist das jetzt schon da?
**Niklas | matchicalcom** [35:09 - 35:10]: Vor allem, was denken wir, das checken.
**Konsti | matchicalcom** [35:10 - 35:12]: Aber da reden wir wirklich von einem high level, oder?
**Konsti | matchicalcom** [35:12 - 35:22]: Also halt von einem nicht ganz high level, aber so in der Art CV Export, Projektreferenz Export, CV Export und ein.
**Niklas | matchicalcom** [35:22 - 35:26]: Satz vielleicht detaillierte Anpassungen, Filter Sorting, wenn.
**Tommy | matchicalcom** [35:26 - 35:40]: Es vielleicht detaillierter braucht, dann manche Sachen detaillierter, manche reichen vielleicht die Sachen, die wir haben, die wir schon umgesetzt haben, da haben wir ja die Möglichkeit, ein bisschen detaillierter reinzuschreiben, was es tut und was es nicht tut.
**Tommy | matchicalcom** [35:41 - 35:45]: Das gibt dir dann auch die Möglichkeit, weißt du, also das müssen wir uns einmal.
**Niklas | matchicalcom** [35:46 - 35:51]: Genau, ich persönlich finde es auch sehr gut, Thomas, wenn du meinst, du willst das gerne mal vorbereiten, mach das.
**Niklas | matchicalcom** [35:51 - 35:53]: Meine persönliche Meinung ist nur, ich würde.
**Konsti | matchicalcom** [35:53 - 35:54]: Da.
**Niklas | matchicalcom** [35:56 - 36:11]: Relativ high level drüber gehen und gar nicht schauen, dass du da richtig viel Zeit wieder rein machst, also im Sinne von, dass wir die Planung, die wir so gesehen grob im Kopf haben, nochmal detaillierter runterschreiben, sondern ich würde echt immer nur einen Satz zu jedem auf.
**Tommy | matchicalcom** [36:11 - 36:15]: So welche gut vorbereitet sind, die mehr und mehr kommen, dass wir da einfach.
**Konsti | matchicalcom** [36:15 - 36:33]: Ja, also was ich aber wirklich vielleicht einfach, und der zweite Gedanke, den ich mitgeben wollte, ist dieses andere Thema und das ist für mich wirklich was anderes, also user manual, basically Produktdokumentation im Sinne von user manual, wie mache ich was und so weiter.
**Konsti | matchicalcom** [36:34 - 36:40]: Das ist schon, wir brauchen, das ist klar, hundertprozentig, da wird man nie drumrum kommen.
**Konsti | matchicalcom** [36:40 - 36:57]: Wir müssen uns aber ganz klar entscheiden, zu welchem Zeitpunkt wir das angehen, weil das mal anzufangen und dann nicht immer mitzuziehen, ist Schwachsinn, sondern wir müssen es zu dem Zeitpunkt angehen, wo wir sagen, ab sofort wird es auch immer mitgezogen und das Teil in Anführungszeichen von Akzeptanzkriterien, von neuen Features, dass dieses fucking user manual auch upgedatet wird.
**Konsti | matchicalcom** [36:57 - 37:11]: Und da bin ich ehrlich gesagt schon eher der Meinung, Thomas, da sagt man ganz schnell, ach, das ist nur hier und da, das ist so ein bisschen was, ein bisschen da, aber ne, es gibt so viele Tools draußen für Dokumentation, da ist so viel dahinter, an was man nicht denkt.
**Konsti | matchicalcom** [37:11 - 37:19]: Und wir können wahrscheinlich für, es wird wahrscheinlich schon ein bisschen was kosten, aber es gibt da x Tools, die man einfach reinhängen kann, wo man im Hintergrund CMS hat.
**Konsti | matchicalcom** [37:19 - 37:23]: Da gibt es wahrscheinlich auch AI Features schon out of the box und Language Support und alles möglich ohne.
**Konsti | matchicalcom** [37:23 - 37:26]: Also da kommen wir, glaube ich nicht.
**Niklas | matchicalcom** [37:26 - 37:30]: Also nur kurz, um das vorwegzunehmen, die brauchen wir doch jetzt gar nicht.
**Konsti | matchicalcom** [37:30 - 37:35]: Jetzt gerade nicht, aber generell, wenn wir die mal angehen, dann sollten wir von Anfang an mit dem Tool gehen.
**Konsti | matchicalcom** [37:35 - 37:36]: Alles andere ist nur gebastelt.
**Tommy | matchicalcom** [37:38 - 37:39]: Das weiß ich nicht.
**Tommy | matchicalcom** [37:39 - 37:40]: Ich fühle mich da.
**Tommy | matchicalcom** [37:40 - 37:42]: Ich weiß zu wenig, was es da draußen gibt.
**Tommy | matchicalcom** [37:42 - 37:43]: Ich habe da keine.
**Tommy | matchicalcom** [37:44 - 37:45]: Ich habe da keine.
**Konsti | matchicalcom** [37:45 - 37:48]: Aber ich meine, auf wie vielen Seiten hast du schon Dokumentationen gelesen?
**Tommy | matchicalcom** [37:48 - 37:52]: Ich habe auf keiner, weil ich noch keine gute gefunden habe.
**Konsti | matchicalcom** [37:52 - 37:55]: Also wenn du von irgendeiner API, irgendeinem Tool oder sonst was von Joyn Com.
**Konsti | matchicalcom** [37:55 - 37:58]: Da liest du von Joyn Com jeden Tag die Dokumentation.
**Tommy | matchicalcom** [37:59 - 38:01]: API ist was ganz anderes.
**Tommy | matchicalcom** [38:02 - 38:06]: Ich würde die API Dokumentation von der User Dokumentation trennen.
**Tommy | matchicalcom** [38:06 - 38:09]: Und ich habe noch keine gute Userdokumentation gefunden.
**Tommy | matchicalcom** [38:09 - 38:13]: API Dokumentation, da gibt es sau viel gute.
**Tommy | matchicalcom** [38:13 - 38:15]: Also das ist wurscht, was du nimmst.
**Tommy | matchicalcom** [38:15 - 38:16]: Da kannst du echt.
**Tommy | matchicalcom** [38:16 - 38:17]: Da gibt es.
**Tommy | matchicalcom** [38:18 - 38:23]: Da ist sogar Swagger in der Low Level Version fast schon ausreichend.
**Niklas | matchicalcom** [38:24 - 38:26]: Aber die ist ja zu kompliziert für unsere User.
**Niklas | matchicalcom** [38:26 - 38:30]: Also die richtige API Dokumentation, die checken die alle nicht.
**Tommy | matchicalcom** [38:31 - 38:34]: Bei der API musst du ja die technische Dokumentation haben, ne?
**Niklas | matchicalcom** [38:34 - 38:36]: Genau, das müssen die Developer machen.
**Niklas | matchicalcom** [38:36 - 38:38]: Aber jetzt, um die Funktionalität zu verstehen.
**Konsti | matchicalcom** [38:40 - 38:47]: Beispiel hier bei Voiceflow, die haben hier ihre Guides mit allen Knowledge Bases, das ist ein typisches CMS und so weiter und so fort.
**Konsti | matchicalcom** [38:47 - 38:51]: Du hast hier dieses Rating von den Dings, war da hilfreich und so weiter, diese ganze Kacke drin.
**Konsti | matchicalcom** [38:51 - 38:55]: Und dann hast du nebenbei die API Reference, wo du die verschiedenen.
**Niklas | matchicalcom** [38:57 - 38:58]: Das ist eine strikte Trennung.
**Konsti | matchicalcom** [38:59 - 39:01]: Aber es ist dasselbe Tool.
**Konsti | matchicalcom** [39:01 - 39:02]: Es ist dasselbe Tool.
**Tommy | matchicalcom** [39:05 - 39:08]: Dass das da auf der linken Seite keiner liest, ist ja logisch.
**Konsti | matchicalcom** [39:09 - 39:10]: Readme com.
**Konsti | matchicalcom** [39:10 - 39:11]: Also beispielsweise.
**Konsti | matchicalcom** [39:11 - 39:13]: Ich sag genau, dass VoiceFlow das Beste ist.
**Konsti | matchicalcom** [39:13 - 39:16]: Ich bin mir nicht sicher, ob OpenAI das hier selbst gebaut hat mit den Docs.
**Konsti | matchicalcom** [39:17 - 39:19]: Das haben sie wahrscheinlich selbst gebaut, ja.
**Tommy | matchicalcom** [39:20 - 39:21]: Können wir an der Stelle abbrechen.
**Tommy | matchicalcom** [39:21 - 39:22]: Ich habe was.
**Tommy | matchicalcom** [39:22 - 39:24]: User Dokumentations und Dokument.
**Tommy | matchicalcom** [39:25 - 39:27]: Niemals würde ich das zulassen.
**Tommy | matchicalcom** [39:27 - 39:35]: Der User muss in der App Zugriff auf irgendwas haben und dann sehr eingeschränkt Hilfe bekommen, was er da kriegt.
**Konsti | matchicalcom** [39:35 - 39:38]: In der App willst du alles dokumentiert.
**Tommy | matchicalcom** [39:38 - 39:46]: Haben, dann haben wir eine gute Dokumentation und werden den User helfen zu sagen, öffne eine Dokumentation, da steht alles drinnen.
**Tommy | matchicalcom** [39:47 - 39:48]: Wird nicht funktionieren.
**Tommy | matchicalcom** [39:48 - 39:51]: Die MSG hat super Dokumentation.
**Tommy | matchicalcom** [39:51 - 39:52]: Also wirklich eine.
**Konsti | matchicalcom** [39:52 - 39:54]: Ich sage, in der App wird es auch nicht.
**Konsti | matchicalcom** [39:58 - 40:02]: Vielleicht ist das eine besser als das andere, aber das ist so viel mehr Aufwand.
**Tommy | matchicalcom** [40:04 - 40:06]: Können wir bitte darüber reden, wenn es soweit ist?
**Tommy | matchicalcom** [40:06 - 40:13]: Ich sage nur, ich bin ganz klar bei der API bin ich voll bei dir.
**Tommy | matchicalcom** [40:13 - 40:18]: Was User Dokumentation angeht, ist das keine gute Dokumentation.
**Tommy | matchicalcom** [40:18 - 40:24]: Einfach zu sagen, da sind 1000 Dokumente, klick dich durch 1000 Reiter durch, du wirst schon das Richtige finden.
**Tommy | matchicalcom** [40:25 - 40:27]: Das ist für den User nicht.
**Konsti | matchicalcom** [40:27 - 40:28]: Ja, aber so ist es ja gar nicht.
**Konsti | matchicalcom** [40:28 - 40:33]: Es gibt ja die Search Engines werden ja immer besser und du hast ja eine AI Search auf die user Doku.
**Tommy | matchicalcom** [40:33 - 40:35]: Trotzdem macht es keiner.
**Tommy | matchicalcom** [40:35 - 40:36]: Ich bleibe außer.
**Tommy | matchicalcom** [40:36 - 40:37]: Egal.
**Konsti | matchicalcom** [40:37 - 40:39]: Auf den Help Button drückt auch keiner.
**Konsti | matchicalcom** [40:39 - 40:40]: Das sage ich dann auch wieder.
**Tommy | matchicalcom** [40:40 - 40:44]: Also wir sind da noch nicht, aber wenn wir dort sind, dann wären wir.
**Niklas | matchicalcom** [40:44 - 40:47]: Genau, dann können wir gerne nochmal drüber reden und uns.
**Konsti | matchicalcom** [40:47 - 40:49]: Also warte, warte, warte, ganz kurz, ganz kurz.
**Konsti | matchicalcom** [40:51 - 40:52]: Eine Sache schon.
**Konsti | matchicalcom** [40:52 - 40:56]: Die haben ihre User Doku, auf die sie auch verlinken, wo die Details stehen.
**Konsti | matchicalcom** [40:56 - 41:02]: Aber ich kann auf die User Doku zugreifen in der App durchgehend.
**Tommy | matchicalcom** [41:03 - 41:07]: Aber ich will ja nur das eingeschränkt haben, wo ich gerade bin, was meine Aktionen dann auch sind.
**Konsti | matchicalcom** [41:07 - 41:08]: Ja, richtig.
**Konsti | matchicalcom** [41:09 - 41:14]: Also Thomas, da redest du von, ich möchte was, was unendlich aufwendig ist.
**Konsti | matchicalcom** [41:14 - 41:16]: Hier kann ich einfach ich will ein neues Projekt anlegen.
**Konsti | matchicalcom** [41:16 - 41:17]: Wie funktioniert das?
**Tommy | matchicalcom** [41:19 - 41:28]: Es ist wurscht, wenn es unendlich aufwendig ist, wenn wir uns fünf Mitarbeiter dadurch sparen, weil die User selbst ihre fucking Probleme.
**Konsti | matchicalcom** [41:28 - 41:29]: Ich sage aber doof gesagt, nein.
**Konsti | matchicalcom** [41:29 - 41:31]: Auch dann, wenn der.
**Konsti | matchicalcom** [41:33 - 41:34]: Lass uns nicht darüber reden.
**Niklas | matchicalcom** [41:35 - 41:38]: Wir haben uns doch alle noch gar nicht über dieses Info Feature informiert und alles.
**Tommy | matchicalcom** [41:39 - 41:42]: Ich habe nur gerade gesagt, ein ganzes Dokument funktioniert nicht.
**Tommy | matchicalcom** [41:42 - 41:44]: Und ich weiß jetzt nicht, was jetzt gerade.
**Tommy | matchicalcom** [41:44 - 41:45]: Ehrlich gesagt.
**Tommy | matchicalcom** [41:45 - 41:47]: Wir haben über das gar nicht gesprochen.
**Tommy | matchicalcom** [41:47 - 41:48]: Wir haben das gar nicht gesprochen.
**Tommy | matchicalcom** [41:48 - 41:52]: Ich habe gesagt, ich denke, ich mache mir mal Gedanken, wie wir diese Version besser wegbringen.
**Tommy | matchicalcom** [41:52 - 41:53]: Und jetzt auf einmal sehe ich, du.
**Konsti | matchicalcom** [41:53 - 41:56]: Hast angefangen mit E Mail Flows und wie tue ich meine E Mail ändern?
**Konsti | matchicalcom** [41:56 - 41:58]: Also da hast du schon von User Dokumentation geredet.
**Tommy | matchicalcom** [41:59 - 41:59]: Natürlich.
**Tommy | matchicalcom** [42:00 - 42:03]: Wenn du magst, kannst du gerne sonst diese Tickets in Zukunft bearbeiten.
**Tommy | matchicalcom** [42:03 - 42:05]: Ich krieg ständig so welche Anfragen.
**Tommy | matchicalcom** [42:05 - 42:08]: Du kannst es gerne machen die dir privat.
**Tommy | matchicalcom** [42:08 - 42:09]: Ja, natürlich.
**Tommy | matchicalcom** [42:09 - 42:09]: Weißt du was?
**Tommy | matchicalcom** [42:09 - 42:13]: Ich leite euch ja nur die lustigen Sachen weiter.
**Tommy | matchicalcom** [42:13 - 42:17]: Konsti, falls du glaubst, ich habe keinen User Support zu tätigen.
**Konsti | matchicalcom** [42:18 - 42:22]: Also warte, ist mal für Profile Map oder für Magical.
**Tommy | matchicalcom** [42:23 - 42:28]: Natürlich melden sich die Leute bei bei Magic Lauch und du wirst auch sehen.
**Konsti | matchicalcom** [42:28 - 42:29]: Aber das ist nicht in Ordnung.
**Konsti | matchicalcom** [42:29 - 42:31]: Also das machen auch nur die Wavestone Leute.
**Konsti | matchicalcom** [42:31 - 42:33]: Die sollen in den fucking Channel schreiben.
**Tommy | matchicalcom** [42:33 - 42:36]: Ja, du, da war keiner und der Felix und die Scharla.
**Tommy | matchicalcom** [42:36 - 42:37]: Aber egal, vergesst das bitte.
**Tommy | matchicalcom** [42:38 - 42:51]: Also ich habe gesagt, es wird wichtig sein, das zu dokumentieren, auf irgendeine Art und Weise es zu dokumentieren, dass man dem User das im Scale schnell näher bringen kann, wenn er es machen kann.
**Tommy | matchicalcom** [42:52 - 42:55]: Habe ich jetzt gesagt, dass es jetzt schon in die Software rein muss?
**Tommy | matchicalcom** [42:55 - 43:02]: Nein, aber es wäre gut, wenn, so wie der Chico gesagt hat, irgendwo einmal steht, dass es prinzipiell schon funktioniert und das.
**Niklas | matchicalcom** [43:04 - 43:05]: Funktioniert.
**Tommy | matchicalcom** [43:05 - 43:07]: Macht eigentlich Sinn einmal irgendwie.
**Tommy | matchicalcom** [43:07 - 43:12]: Aber ich habe gesagt, ich mache mir mal Gedanken und ich komme auf euch zu, wenn ich was habe und nicht.
**Tommy | matchicalcom** [43:12 - 43:13]: Ich weiß schon ganz genau.
**Tommy | matchicalcom** [43:13 - 43:18]: Ich glaube, ich habe dreimal gesagt, ich habe mal eine grobe Idee, aber ich weiß es wirklich nicht.
**Tommy | matchicalcom** [43:18 - 43:29]: Und ich will es lean halten, weil ich finde, es ist wichtig, dass wir, wenn wir in die Gespräche gehen, was haben, wo wir uns orientieren können.
**Tommy | matchicalcom** [43:29 - 43:31]: Aber es kann sowieso alles ganz anders kommen.
**Tommy | matchicalcom** [43:32 - 43:36]: Insofern bringt es ja nichts, jetzt alles im Detail runterzuschreiben.
**Tommy | matchicalcom** [43:36 - 43:39]: Und genau das wollte ich sagen.
**Niklas | matchicalcom** [43:39 - 43:42]: Ich würde ganz high level mach dir gerne mal Gedanken.
**Tommy | matchicalcom** [43:43 - 43:46]: Weiß ich nicht, ich schaue es mir an und dann sehen wir es ja eh.
**Tommy | matchicalcom** [43:47 - 43:49]: Okay, aber das ist so meins.
**Tommy | matchicalcom** [43:49 - 43:57]: Und Chico, ich weiß nicht, wie weit du kommst, dann wirst du vielleicht dich auch dann rühren wegen der Merchview, oder?
**Tommy | matchicalcom** [43:57 - 43:59]: Wenn du da mal die ersten Schritte gemacht hast.
**Tommy | matchicalcom** [43:59 - 44:06]: Und Konzi, wenn du bei den Companies bist, macht ja vielleicht auch noch Sinn, wenn ich da vielleicht zur Verfügung stehe.
**Konsti | matchicalcom** [44:06 - 44:11]: Ja, aber doof gesagt, reserviere dir doch nicht Zeit, wo du vielleicht dazu geholt wirst, sondern dann echt schau, dass du.
**Tommy | matchicalcom** [44:11 - 44:14]: Auch andere Dinge auch dann zu tun.
**Tommy | matchicalcom** [44:14 - 44:15]: Also das ist jetzt.
**Tommy | matchicalcom** [44:15 - 44:23]: Ich habe jetzt in der Zwischenzeit wieder fünf Teams Nachrichten bekommen von Wavestone, die alle sick Probleme haben.
**Tommy | matchicalcom** [44:23 - 44:27]: Wer weiß, ich habe keine Ahnung, was da dahinter steckt.
**Konsti | matchicalcom** [44:27 - 44:28]: Schauen wir mal.
**Konsti | matchicalcom** [44:28 - 44:36]: Können wir mal noch kurz gemeinsam zwei oder 3 Minuten jetzt noch zusätzlich spendieren, um über dieses Daily zu reflektieren und wie wir in Zukunft Dailies halten wollen.
**Tommy | matchicalcom** [44:37 - 44:40]: Ich weiß, ich brauche gar nicht reflektieren.
**Tommy | matchicalcom** [44:40 - 44:42]: Ich weiß nicht, warum wir 1 Stunde brauchen.
**Tommy | matchicalcom** [44:42 - 44:45]: Also wir haben, wir wollen halt gerne.
**Niklas | matchicalcom** [44:45 - 44:48]: Immer, weil das so oft ist das unser einziger Call pro Tag?
**Konsti | matchicalcom** [44:48 - 44:48]: Das ist das.
**Konsti | matchicalcom** [44:48 - 44:53]: Also vielleicht sollte man jemand ganz kurz daten, was er wahrgenommen hat, was wir eigentlich gerade besprochen haben.
**Tommy | matchicalcom** [44:56 - 44:59]: Was ich wahrnehme, weil es ganz frisch im Kopf ist.
**Tommy | matchicalcom** [45:00 - 45:16]: Wenn ich was gesagt habe, was dir irgendwie in deinem Kopf widerstrebt, läufst du sofort los und versuchst mir zu sagen, warum ich jetzt falsch bin und versuchst mir das 10 Minuten zu erklären und ich schon eine Viertelstunde versuche zu sagen, ich weiß es noch nicht, ich beschäftige mich erst damit.
**Tommy | matchicalcom** [45:18 - 45:27]: Und dann habe ich da drinnen hat Astro Code geshared beispielsweise.
**Tommy | matchicalcom** [45:28 - 45:34]: Das framet sich ja dann alles gleich ganz anders, weil sich das dann irgendwie wie ein Arbeitsmeeting sofort zu fühlen bekommt.
**Tommy | matchicalcom** [45:34 - 45:36]: Also wir sollten sehr wahrscheinlich.
**Niklas | matchicalcom** [45:37 - 45:39]: Vor allem du bist immer der einzige, der Coach.
**Konsti | matchicalcom** [45:41 - 45:42]: Du hast ja recht.
**Konsti | matchicalcom** [45:42 - 45:43]: Du weißt ja auch, wo es bei mir herkommt.
**Konsti | matchicalcom** [45:43 - 45:47]: Ich habe was gehört, wo ich mir gedacht habe, so oh, willst du das wirklich aufmachen?
**Konsti | matchicalcom** [45:47 - 45:49]: Nein, ich will das eigentlich nicht aufmachen.
**Konsti | matchicalcom** [45:49 - 46:03]: Und dann ist es gleich so dieses aber ich glaube, wir haben zu viel über Pläne geredet und zu wenig über was steht heute an und fertig.
**Tommy | matchicalcom** [46:03 - 46:04]: Genau.
**Niklas | matchicalcom** [46:06 - 46:07]: Sie persönlich genauso.
**Niklas | matchicalcom** [46:07 - 46:10]: Also ich glaube auch, wir sollten im Daily einfach hey, das machen wir heute.
**Niklas | matchicalcom** [46:10 - 46:16]: Wenn es irgendwas gibt, wo man hey, da müssen wir kurz länger drüber reden, wenn nicht alle drei sind.
**Niklas | matchicalcom** [46:16 - 46:21]: Generell machen wir erst mal das Daily fertig und dann kann man hey, wir haben jetzt noch was, was wir zusätzlich bereden müssen.
**Niklas | matchicalcom** [46:21 - 46:26]: Dann machen wir es aber wirklich abgekapselt oder zwei bereden und dann bereden wir das auch danach.
**Niklas | matchicalcom** [46:26 - 46:30]: Aber im Daily finde ich persönlich ganz clear, was sind heute unsere kleine.
**Niklas | matchicalcom** [46:30 - 46:31]: Was haben wir z.B.
**Niklas | matchicalcom** [46:31 - 46:32]: gestern fertig gekriegt?
**Niklas | matchicalcom** [46:32 - 46:34]: Wo sind wir gerade noch blockiert?
**Niklas | matchicalcom** [46:34 - 46:35]: Wo müssen wir kurz mal reden?
**Niklas | matchicalcom** [46:35 - 46:36]: Und genau.
**Niklas | matchicalcom** [46:36 - 46:38]: Also auch nicht so z.b.
**Niklas | matchicalcom** [46:38 - 46:39]: was wir ganz am Anfang gemacht haben.
**Niklas | matchicalcom** [46:39 - 46:41]: Hey, lass mal kurz diesen Bug untersuchen oder so.
**Niklas | matchicalcom** [46:41 - 46:43]: Das macht man danach.
**Konsti | matchicalcom** [46:43 - 46:44]: Ja, ja, das war ja.
**Konsti | matchicalcom** [46:45 - 46:46]: Das hätte ich nicht gemacht, wenn Thomas auch schon da gewesen.
**Konsti | matchicalcom** [46:46 - 46:49]: Doch, wahrscheinlich hätte ich es auch gemacht, wenn Thomas auch schon da gewesen wäre.
**Niklas | matchicalcom** [46:50 - 46:51]: Aber wirklich, also das haben wir.
**Niklas | matchicalcom** [46:51 - 46:53]: Sonst haben wir jedes Daily.
**Niklas | matchicalcom** [46:53 - 46:53]: Das wäre eigentlich.
**Konsti | matchicalcom** [46:54 - 46:55]: Ich weiß, ich weiß, ich weiß.
**Konsti | matchicalcom** [46:55 - 46:58]: Naja gut, aber dann lass uns doch nächstes.
**Konsti | matchicalcom** [46:58 - 46:58]: Finde ich gut.
**Konsti | matchicalcom** [46:58 - 47:07]: Dann lass doch nächstes mal echt probieren, dass wir sagen, eigentlich in 10 Minuten müssen wir das ja durchkriegen, dass wir Time auf 10 Minuten stellen und in 10 Minuten müssen wir unser Daily erledigt haben.
**Konsti | matchicalcom** [47:07 - 47:10]: Wenn wir sagen, jetzt gibt es noch kurz was zu besprechen, dann ist das wirklich.
**Konsti | matchicalcom** [47:10 - 47:12]: Aber wir müssen schaffen, dass wir einen Daily in 10 Minuten.
**Tommy | matchicalcom** [47:13 - 47:14]: Ja, genau.
**Niklas | matchicalcom** [47:14 - 47:15]: So, das kriegen wir hin.
**Niklas | matchicalcom** [47:15 - 47:18]: Aber natürlich kann es sein, dass wir danach noch was besprochen haben.
**Niklas | matchicalcom** [47:18 - 47:19]: Also ich würde nicht sagen, dass wir.
**Tommy | matchicalcom** [47:19 - 47:24]: So Meetings ausmachen für den weiteren Verlauf des Tages.
**Tommy | matchicalcom** [47:24 - 47:25]: Genau, um das geht es.
**Tommy | matchicalcom** [47:26 - 47:27]: Bewegt Dip.
**Tommy | matchicalcom** [47:27 - 47:29]: Okay, Super.
**Niklas | matchicalcom** [47:29 - 47:29]: Cool.
**Niklas | matchicalcom** [47:29 - 47:30]: Leute, legen wir los.
**Niklas | matchicalcom** [47:31 - 47:33]: Zu dem Termin zu Patrick einfach 1 Stunde später, gell?
**Niklas | matchicalcom** [47:33 - 47:34]: Passt für euch.
**Tommy | matchicalcom** [47:35 - 47:36]: Passt für uns.
**Konsti | matchicalcom** [47:37 - 47:40]: H später heißt, der ist dann direkt im Anschlag.
**Konsti | matchicalcom** [47:40 - 47:42]: Von der Tendenz her reden wir meistens mit den Leuten länger.
**Tommy | matchicalcom** [47:43 - 47:45]: Der Migi hat nur 45 Minuten eingeplant.
**Tommy | matchicalcom** [47:45 - 47:48]: Das ist für uns nicht so schlecht, wenn wir harte Anschläge haben, weil das.
**Konsti | matchicalcom** [47:48 - 47:49]: Ist eigentlich echt jahresrecht.
**Niklas | matchicalcom** [47:49 - 47:52]: Dann machst du okay, 1 Stunde später.
**Konsti | matchicalcom** [47:53 - 47:55]: Um 11 ist auf jeden Fall gut.
**Tommy | matchicalcom** [47:55 - 47:57]: Danke, danke.
**Konsti | matchicalcom** [47:59 - 48:02]: Falls du heute mit irgendeinem User sprichst, der öfter Dings nutzt.
**Konsti | matchicalcom** [48:02 - 48:03]: Entschuldigung, last one.
**Konsti | matchicalcom** [48:03 - 48:07]: Ich habe jetzt doch öfter gesehen, dass bei den Zeiten andere Sachen drinstehen als 10 Uhr.
**Konsti | matchicalcom** [48:07 - 48:11]: Ich weiß nicht, ob sie dann echt 11 Uhr reinschreiben oder sonst was, aber bisher hat noch niemand was gesagt.
**Konsti | matchicalcom** [48:11 - 48:21]: Aber wann immer du mit jemandem sprichst, frag ihn mal ganz kurz, ob er bei den Uhrzeiten deadline mäßig irgendein komisches festgestellt hat, was uns einfach nicht gesagt wird.
**Konsti | matchicalcom** [48:21 - 48:23]: Da müssen wir das noch mal untersuchen.
**Konsti | matchicalcom** [48:24 - 48:26]: Aber ich hab komische Zeiten gesehen.
**Konsti | matchicalcom** [48:26 - 48:29]: Also da stand oft 11 Uhr, wo ich mir denke, da steht doch sonst immer 10.
**Tommy | matchicalcom** [48:31 - 48:33]: Vielleicht hat sich das jetzt mit der Zeitverschiebung.
**Konsti | matchicalcom** [48:33 - 48:34]: Ja, aber kann gar nicht sein.
**Konsti | matchicalcom** [48:34 - 48:35]: Ich habe es mir angeguckt, aber.
**Konsti | matchicalcom** [48:35 - 48:36]: Ja, fragt mal die Leute.
**Konsti | matchicalcom** [48:36 - 48:37]: Fragt mal die Leute.
**Konsti | matchicalcom** [48:38 - 48:40]: Und wenn die das bestätigen, dann schauen wir es uns an.
**Tommy | matchicalcom** [48:40 - 48:44]: Abschließend, wenn das vorher, wenn das YouTube.
**Tommy | matchicalcom** [48:44 - 48:47]: Wir sprechen es in der Datenbank als UTC ab, oder?
**Tommy | matchicalcom** [48:47 - 48:49]: Und wenn das ja vorher.
**Tommy | matchicalcom** [48:50 - 48:52]: Also dann muss es ja 10 Uhr bleiben, oder?
**Niklas | matchicalcom** [48:52 - 48:54]: Weil UTC hat sich ja jetzt auch geändert.
**Niklas | matchicalcom** [48:54 - 48:56]: UTC ändert sich nicht.
**Niklas | matchicalcom** [48:56 - 48:57]: Nein, nein, nein, stimmt.
**Niklas | matchicalcom** [48:57 - 49:00]: Meine Zeitzone hat sich auf UTC eins geändert.
**Tommy | matchicalcom** [49:00 - 49:04]: Also was UTC 9 Uhr war, ist dann ja UTC 11, oder?
**Tommy | matchicalcom** [49:04 - 49:11]: Also ist dann ja 11, geht ja dann sogar 1 Stunde von 10 auf 11, oder?
**Tommy | matchicalcom** [49:11 - 49:13]: Oder müsste man noch mal kurz.
**Tommy | matchicalcom** [49:13 - 49:15]: Ich glaube, dass das dann ja schon so ist, oder?
**Tommy | matchicalcom** [49:15 - 49:20]: Aber die UTC bleibt die gleiche, das Datum, oder?
**Tommy | matchicalcom** [49:20 - 49:21]: Das will die deutsche Bahn ja.
**Konsti | matchicalcom** [49:21 - 49:25]: Ja, aber wir haben uns gedacht, weil wir echt nicht wissen, wie die Zeit sind momentan.
**Konsti | matchicalcom** [49:25 - 49:26]: Die Logik.
**Konsti | matchicalcom** [49:26 - 49:36]: Du gibst einfach an, wie spät es ist, und wenn du 10 Uhr sagst, dann ist es immer und überall 10 Uhr, egal ob du nicht Timezone supportet sozusagen, weil sonst checken es.
**Konsti | matchicalcom** [49:36 - 49:38]: Aber wir können auch machen, dass Timezone supported ist.
**Konsti | matchicalcom** [49:38 - 49:43]: Aber das Problem ist, Timezone Supported ist aus dem Grund schwierig, weil dafür müssten wir die Timezone des Kunden kennen.
**Konsti | matchicalcom** [49:44 - 49:46]: Und die kennen wir beim Parsen ganz sicher nicht.
**Niklas | matchicalcom** [49:46 - 49:48]: Also redest du jetzt gerade.
**Niklas | matchicalcom** [49:48 - 49:50]: Bitte erklär das kurz auf.
**Niklas | matchicalcom** [49:50 - 49:51]: Also du redest gerade nur vom Parsen, oder?
**Niklas | matchicalcom** [49:51 - 49:53]: Du redest, wenn der User da 10 Uhr eingebunden hat.
**Konsti | matchicalcom** [49:54 - 50:04]: Generell, wenn der Manuel eine Anfrage anlegt und 10 Uhr reinmacht, weil es 10 Uhr ist, und er den deutschen Bahnkunden auswählt, dann müsste er ja wissen, es ist aber nicht 10 Uhr, ist es bei mir 11 Uhr, also schreibe ich 11 Uhr rein.
**Konsti | matchicalcom** [50:04 - 50:14]: Aber Manuel würde immer 10 Uhr machen und der Parser würde auch immer 10 Uhr auslesen, wenn bei der deutschen Bahn 10 Uhr drinsteht und er würde 10 Uhr UTC auslesen, nicht wissen, dass die deutsche Bahn ein Dings ist.
**Niklas | matchicalcom** [50:16 - 50:21]: Da sollten wir aber vielleicht machen, dass der User festlegt, in welcher Zeitzone ist er.
**Konsti | matchicalcom** [50:23 - 50:28]: Ja, aber das ist definitiv kein Pflichtfeld, das wir selten haben werden.
**Konsti | matchicalcom** [50:28 - 50:32]: Das heißt, davon die Logik abhängig zu machen, wäre ein bisschen dumm, die Ausbaustufe.
**Tommy | matchicalcom** [50:32 - 50:42]: Aber wenn wir dann an Clients oder Companies dran sind, wäre das vielleicht gar nicht so blöd, die vielleicht von GPT oder von Perplexity oder was auch immer mitgeben zu lassen.
**Tommy | matchicalcom** [50:42 - 50:47]: Hey, der sitzt jetzt in Deutschland, gibt mir da auch gleich seine Zeitzone raus.
**Konsti | matchicalcom** [50:50 - 50:51]: Das wird immer schwierig.
**Tommy | matchicalcom** [50:52 - 50:53]: Ich weiß nicht.
**Tommy | matchicalcom** [50:53 - 50:54]: Ich glaube, das wird nämlich.
**Tommy | matchicalcom** [50:54 - 51:01]: Also wenn man jetzt so ein bisschen, wenn man ein bisschen weiterdenkt und sagt, okay, wir haben jetzt mehrere größere Unternehmen auch an der Angel.
**Tommy | matchicalcom** [51:01 - 51:04]: Ich meine, es ist jetzt sicher kein, jetzt sicher kein großes Thema, glaube ich jetzt auch nicht.
**Tommy | matchicalcom** [51:04 - 51:08]: Aber wenn man ein Stück weiter denkt, dann wird das schon zum Thema werden.
**Tommy | matchicalcom** [51:08 - 51:13]: Also die werden schon über verschiedene Zeitzonen auch die Software nutzen.
**Konsti | matchicalcom** [51:15 - 51:20]: Bei der Deadline ist aber, Lass uns jetzt nicht tiefer, aber es ist ein Problem.
**Konsti | matchicalcom** [51:20 - 51:23]: Und die einfachste Lösung für uns war, okay, gut, 10 Uhr ist 10 Uhr und fertig.
**Konsti | matchicalcom** [51:23 - 51:28]: Und der User muss wissen, was 10 Uhr ist, dass es 10 Uhr für den Kunden ist und du bist in London.
**Konsti | matchicalcom** [51:28 - 51:30]: Also es ist 9 Uhr oder I don't know.
**Niklas | matchicalcom** [51:31 - 51:33]: Aber das sollte man untersuchen.
**Konsti | matchicalcom** [51:34 - 51:41]: Ich habe aber jetzt gerade mal echt, ich habe einen Demand einfach kurz gepasst, ich habe Sachen angepasst und so weiter.
**Konsti | matchicalcom** [51:41 - 51:43]: Es bleibt die ganze Zeit bei 10 Uhr.
**Konsti | matchicalcom** [51:43 - 51:46]: Also vielleicht tragen die echt händisch 11 Uhr ein.
**Tommy | matchicalcom** [51:46 - 51:47]: Ja, ist es ja vielleicht auch.
**Tommy | matchicalcom** [51:47 - 51:52]: Achso, es steht ja eine Abgabe der Frist wieder manchmal dazugegeben.
**Konsti | matchicalcom** [51:52 - 51:53]: Kannst du mal kurz in den Dev tenant gehen?
**Konsti | matchicalcom** [51:53 - 51:55]: Ich glaube, es ist in einer anderen Zeitzone.
**Konsti | matchicalcom** [51:55 - 52:00]: Off Sales und diesen Python Developer anschauen und mir sagen, wie viele Zeit da.
**Tommy | matchicalcom** [52:00 - 52:01]: Dran steht bei dir.
**Niklas | matchicalcom** [52:03 - 52:04]: Im Proposal.
**Konsti | matchicalcom** [52:05 - 52:10]: Bei Sales halt einfach im Proposal 10.
**Konsti | matchicalcom** [52:10 - 52:12]: Ja, okay, dann passt es.
**Konsti | matchicalcom** [52:12 - 52:15]: Also ich habe es angelegt oder im Parser, ich habe es geupdatet.
**Konsti | matchicalcom** [52:15 - 52:16]: Niki sieht es auch.
**Konsti | matchicalcom** [52:16 - 52:17]: Also.
**Niklas | matchicalcom** [52:19 - 52:23]: Wir können unsere Zeitzonen check glücklicherweise immer gleich machen, weil wir in verschiedenen Zeitzonen sind.
**Tommy | matchicalcom** [52:25 - 52:27]: Browser auch in verschiedene Zeitzonen.
**Konsti | matchicalcom** [52:27 - 52:31]: Leute, ich muss schon seit Beginn an kacken, deswegen dachte ich, wir sind schnell fertig, aber jetzt muss ich gehen.
**Niklas | matchicalcom** [52:31 - 52:34]: Leute, wir hören uns später.
**Konsti | matchicalcom** [52:34 - 52:35]: Morgen schaffen besser.
**Konsti | matchicalcom** [52:35 - 52:36]: Aber egal, wir sind learning process.
