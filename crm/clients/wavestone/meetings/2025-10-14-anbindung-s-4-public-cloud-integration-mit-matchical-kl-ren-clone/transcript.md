# Anbindung S/4 Public Cloud Integration mit Matchical klären (Clone)

**Ellinger, Mario** [00:11 - 00:13]: Yes, können wir loslegen.
**Ellinger, Mario** [00:20 - 00:21]: Ja, sorry, ich brauche zwei Sekunden.
**Ellinger, Mario** [00:21 - 00:23]: Ich bin gerade von einem Call in.
**Konsti | matchicalcom** [00:23 - 00:29]: Listen geflitzt, sonst kann ich auch mal mit dem Teil loslegen, den ich kenne.
**Ellinger, Mario** [00:30 - 00:31]: Ist schon okay.
**Ellinger, Mario** [00:31 - 00:40]: Also der Harald ist bei uns jetzt Spirit 21, jetzt muss ich lügen, seit Anfang des Monats.
**Ellinger, Mario** [00:41 - 00:42]: Genau, seit Anfang des Monats.
**Ellinger, Mario** [00:43 - 01:10]: Ich hatte schon ganz kurz geteasert, dass die Spirit 21 sich im ERP Umfeld, also ihre eigenen internen Themen dort sicherlich auch ein bisschen verändern will und und es wird in Richtung, wahrscheinlich mache ich es bestimmt gleich falsch, S Cloud gehen oder in SAP Cloud, nenne ich es einfach so, dann ist es vielleicht ganz richtig.
**Ellinger, Mario** [01:12 - 01:33]: Und das Thema war ja jetzt hier für unser Magical, also unser Resource Management Tool, Ressourcen zu suchen oder Ressourcen da drin in dem Tool darzustellen, inwieweit es zu SAP Cloud entsprechende Anbindungsmöglichkeiten gibt.
**Ellinger, Mario** [01:35 - 01:38]: An dem Punkt sind wir jetzt, das einfach noch mal zu klären.
**Ellinger, Mario** [01:38 - 01:45]: Hattet ihr ja gesagt, vielleicht kommt er mal mit ein paar Beispiele, was ihr heute schon an Schnittstellen habt, APIs etc.
**Ellinger, Mario** [01:45 - 01:52]: Blabla und Harald wird da sicherlich zwei, drei Fragen haben oder stellen wollen.
**Konsti | matchicalcom** [01:54 - 01:54]: Merci.
**Konsti | matchicalcom** [01:55 - 01:58]: Dann vielleicht als Background Harald.
**Konsti | matchicalcom** [01:58 - 02:17]: Also was wir aus Magical machen, ist eben für Unternehmensberatung, gerade auch mit dem Fokus auf Project oder halt Project Stuffing sozusagen eigentlich eine Softwarelösung, wo man relativ easy Beraterprofile reinladen kann, die dann umkonvertiert werden in unser strukturiertes Datenformat.
**Konsti | matchicalcom** [02:17 - 02:34]: Das Gleiche kann man mit Kundenanfragen machen und dann kann man beides zusammenführen, sozusagen ein Matching Modul und dann kann man sich wiederum auch einen CV für den Berater auf die Anfrage exportieren, in der Sprache, in der man sie braucht, in dem Template, in dem man sie braucht und obendrein auch noch optimiert auf die Kundenanfrage.
**Konsti | matchicalcom** [02:34 - 02:42]: Also sozusagen klassisch SaaS plus halt an ganz vielen Stellen, wo es sinnvoll ist, eben verschiedene AI Use Cases und Workflows mit angebunden.
**Konsti | matchicalcom** [02:42 - 02:53]: Was jetzt Schnittstelle und Integration angeht, habe ich ja Mario auch schon gesagt, wir sind momentan noch absolut im Early Adapter und Startup Modus und sind da ziemlich flexibel.
**Konsti | matchicalcom** [02:53 - 03:10]: Wir haben für Wavestone zum Beispiel schon, das war damals unser erster Kunde, die haben eben ihre Stammdaten in SAP SuccessFactors, da haben wir das angebunden, aber das lief glaube ich nicht ganz genau über SAP, sondern sie haben so eine Art Broker Ding dazwischen gestellt, wo wir eigentlich die Daten abholen.
**Konsti | matchicalcom** [03:11 - 03:20]: Aber im Endeffekt ist es so, dass wir technisch absolut Es ist nicht wir machen das und das machen wir nicht, sondern wir sind da absolut integrationsoffen und wir wissen, dass wir zu SAP auch anbinden werden.
**Konsti | matchicalcom** [03:20 - 03:23]: Also Mario hat ja auch Timeline mäßig schon genannt.
**Konsti | matchicalcom** [03:23 - 03:27]: Es geht eher so um Anfang 27, das heißt jetzt nächstes Jahr werden eher die Pläne gemacht.
**Konsti | matchicalcom** [03:27 - 03:30]: Was kommt überhaupt rein sozusagen.
**Konsti | matchicalcom** [03:30 - 03:34]: Das wäre dann auch entscheidend, wenn in Magical dann angefangen wird eben zu operieren.
**Konsti | matchicalcom** [03:34 - 03:38]: Wir haben auch so eine Art Mini CRM und natürlich Opportunity Management und Co.
**Konsti | matchicalcom** [03:39 - 03:41]: Aber nur insofern, wie wir es brauchen.
**Konsti | matchicalcom** [03:41 - 04:00]: Und das sind natürlich dann wahrscheinlich die Daten, die man anbinden möchte an SAP Und da können wir dann gerne, sobald ihr soweit seid, uns zusammensetzen und okay, gut, welche Daten möchtet ihr genau haben von Magical oder welche kommen auch initial von euch, wie zum Beispiel Stammdaten und dann uns darum kümmern, dass wir sie austauschen.
**Konsti | matchicalcom** [04:00 - 04:07]: Aber wir sind technisch da insofern komplett auf der grünen Wiese, dass egal welche Integration gebraucht wird, wir würden sie dann halt entsprechend bauen.
**Konsti | matchicalcom** [04:08 - 04:09]: Ein paar Sachen haben wir aber schon in petto.
**Pietrus, Harald** [04:11 - 04:15]: Erstmal vielen Dank, wenn du mir erlaubst einen kurzen Schritt zurück.
**Pietrus, Harald** [04:16 - 04:18]: Was wir tun wollen, ist eben genau Public.
**Pietrus, Harald** [04:18 - 04:19]: Das ist ein wichtiger Aspekt.
**Pietrus, Harald** [04:19 - 04:20]: Das Thema Public Cloud.
**Pietrus, Harald** [04:20 - 04:22]: Das war die erste Frage an den Mario.
**Pietrus, Harald** [04:23 - 04:26]: Was wir nicht können, ist irgendwelche Plugins installieren.
**Pietrus, Harald** [04:26 - 04:29]: Das macht die SAP nicht mehr in der Public Cloud in der Vergangenheit.
**Pietrus, Harald** [04:29 - 04:45]: Also ich habe einen anderen letzten Projekt letztes Jahr Public Cloud, auch da haben wir die Bilanzen konsolidiert oder Reisekosten abrechnen, die wir machen mal ein Plugin bei euch gibt es nicht mehr, also Z Coding Implementiers, Es geht über eine CPI, also Cloud Platform Integration oder Point to Point XML Integration.
**Pietrus, Harald** [04:46 - 04:48]: Das war meine erste Frage an den Macher.
**Pietrus, Harald** [04:48 - 04:54]: Also dass ihr sagt, wir müssen bei euch ein Plugin installieren, damit wir Outbound Calls machen können, damit wir euch da anpingen.
**Pietrus, Harald** [04:54 - 04:56]: Das wird nicht funktionieren in der Public.
**Pietrus, Harald** [04:56 - 04:57]: Das war meine erste Frage.
**Pietrus, Harald** [04:58 - 04:59]: Der zweite Das hast du einen Value Flow?
**Pietrus, Harald** [04:59 - 05:01]: Also wenn ich so schnell erkläre, dann musst du mich kurz stoppen, bitte.
**Pietrus, Harald** [05:01 - 05:03]: Nur dass wir gucken.
**Pietrus, Harald** [05:04 - 05:09]: Der Standardprozess sieht aus, es gibt eine Lead, es gibt eine Opportunity, die irgendwo in einem CRM System stattfindet.
**Pietrus, Harald** [05:10 - 05:13]: Wir verkaufen Menschen für möglichst viel Geld.
**Pietrus, Harald** [05:13 - 07:38]: Das ist ein relativ einfacher Geschäftsprozess, das heißt wir planen im Grunde genommen dann im SAP Public laut ein Projekt also ob du das kennst legst du eine opportunity an da studieren wie wer welcher Kunde und so weiter und so fort dann planst du ein Projekt und dann musste Menschen planen und zwar Skills und Kosten für Skills hast du interne und externe und dann kannst du und die in die Person und die Skill ist dann und dann für die Projektlaufzeit verfügbar 50 Prozent verfügbar oder gar nicht verfügbar dann gehst du hin und irgendwann machst du dem Kunden ein Angebot solange die Menschen die wir angeboten haben frei bleibend der Kunde akzeptiert das Angebot er geht im CRM Ping los da sagt im Public Cloud jawohl Kunde hat unterschrieben und dann muss der Projektleiter die Ressource fest allokieren und dann kann die auch Zeiten buchen und so weiter das ist mal im groben der Value Flow jetzt bereden wir genau darüber wie finden wir da mische mich nicht ein wie finden wir für die Projekte die wir zukünftig planen die richtigen Menschen zu den richtigen Kosten also ich habe eine Ausschreibung ich weiß ich darf 100 Euro ausgeben also brauche ich den fünf Jahre alten fünf Jahre SAP Erfahrung für 100 Euro die Stunde das kann ich mitgeben in meinem sage ich mal Planungs im SAP Planung wenn ich plane ich brauche Erfahrung den Skill S mit keine Ahnung Produktionsplanung dann geht es gerne zu euch also das ist nicht meine Entscheidung das ist die Entscheidung von Mario wo es dann hingeht da brauchen wir halt irgendwie Ressourcennamen die A den Skill und B den Kostenpunkt haben den uns die Ausschreibung vorgibt Dann geht es zurück wir planen wir können den Namen leicht Software Softbooking das brauche ich später für mein Auslastungsreporting also wer ist fest und wer ist soft gebucht wenn jemand soft gebucht ist brauchen wir Regeln wie wir damit umgehen so Dinge zum Beispiel und das ganze halt dann irgendwie und dann irgendwann confirmen kann aufs Projekt kann an Zeiten buchen und dann faktoriert so ist im groben der Prozess und nochmal die Entscheidung wo die Skills liegen das ist genau von Mario das sind meine da halte ich mir raus meine ist zu gucken wie passt alle Systeme die wir anbinden wollen wie passen die eben genau zu diesem Flow zu der Standard SAP Lösung und was wir nicht tun werden ist jetzt groß, irgendwelche Nicht Standardprozesse etablieren.
**Pietrus, Harald** [07:38 - 07:40]: Wir wollen Standard und nochmal Standard.
**Pietrus, Harald** [07:42 - 07:44]: Und das andere ist, was war der zweite Punkt?
**Pietrus, Harald** [07:48 - 07:49]: Field Class.
**Pietrus, Harald** [07:49 - 07:49]: Genau.
**Pietrus, Harald** [07:50 - 07:53]: Kennst Field Class, schon mal gehört, Das ist die Sourcing Lösung.
**Pietrus, Harald** [07:54 - 07:58]: Wie spielt ihr mit, spielt ihr mit Feed Class zusammen?
**Pietrus, Harald** [08:00 - 08:01]: Aktuell nicht.
**Pietrus, Harald** [08:01 - 08:18]: Okay, das heißt Ausschreibungen Richtung, sorry für meine Ignoranz, Ausschreibungen Richtung potenzieller Lieferanten sagen, keine Ahnung, wir suchen Migrationsexperte für S via Public Cloud mit acht Jahren Berufserfahrung, das ist eine aktuelle Anfrage.
**Pietrus, Harald** [08:19 - 08:25]: Das machst du normal über Fit Class und hast mit deinen Lieferanten, schreibst an, machst ein Work, machst so ein Jobprofil, bum bum bum.
**Pietrus, Harald** [08:26 - 08:27]: Macht ihr das genauso?
**Konsti | matchicalcom** [08:32 - 08:34]: Ich bin gerade noch im Aufnahmemodus, hundertprozentig.
**Pietrus, Harald** [08:35 - 08:36]: Macht ihr das auch.
**Pietrus, Harald** [08:36 - 08:41]: Also könnt ihr verschiedene Lieferanten anschreiben und sagen, ich brauche ein Profil mit den Skills und den Kosten.
**Pietrus, Harald** [08:41 - 08:42]: Macht ihr das auch.
**Konsti | matchicalcom** [08:42 - 08:46]: Also genau, vielleicht um deine Frage dazu oder mal da einzusteigen, danke für die Ausführungen.
**Konsti | matchicalcom** [08:47 - 09:00]: Dieser Value Flow, den du beschrieben hast, sozusagen, da deckt sich vieles mit dem, wie wir den Prozess auch machen wollen, weil das ist auch unser Verständnis von dem, Das ist der Standard sozusagen und es gibt hier die einen Features, da die anderen Features.
**Konsti | matchicalcom** [09:00 - 09:14]: Da ist dann die Frage, dass wir sozusagen, da muss man dann einfach nur gucken, okay, an welcher Stelle setzt man sozusagen im Frontend in Anführungszeichen auf das Magical Interface und an welcher Stelle setzt ihr im Frontend auf das, was ihr bei SAP habt.
**Konsti | matchicalcom** [09:14 - 09:15]: Das ist das.
**Konsti | matchicalcom** [09:15 - 09:30]: Aber wenn die Value Flows an sich ja die gleichen sind, müssen wir nur den Datenaustausch im Hintergrund sicherstellen und gucken natürlich, was ist euer Prozess und sozusagen, was ist euer Frontend Standard Flow sozusagen, sagen wir mal so und was sozusagen damit das funktioniert.
**Konsti | matchicalcom** [09:30 - 09:34]: Da macht ihr SAP, da kommt Magical und da wieder SAP und da nochmal ein bisschen Magical.
**Konsti | matchicalcom** [09:35 - 09:44]: Da können wir dann wirklich über das, was du beschrieben hast, eben diese CPI oder sonst, es gibt ja auch eine REST API, habe ich gesehen, also aber halt die standardisierte von SAP im Endeffekt.
**Konsti | matchicalcom** [09:44 - 09:56]: Da können wir schauen, dass wir haben ja unterschiedliche Datenstrukturen sicher als SAP, aber im Prinzip haben wir ähnliche Transaktionen, weil wir den Prozess ziemlich ähnlich verstehen, wie SAP ihn ja auch versteht.
**Konsti | matchicalcom** [09:56 - 09:59]: Das heißt, da können wir dann einfach gucken, wie wir hin und her spielen und mix and match.
**Konsti | matchicalcom** [09:59 - 10:01]: Was ist sozusagen die beste Lösung?
**Konsti | matchicalcom** [10:01 - 10:06]: Da sind wir auch jetzt insofern noch kann ich dir nichts ganz Konkretes sagen, weil das auch ein bisschen echt davon abhängt.
**Konsti | matchicalcom** [10:06 - 10:10]: Okay gut, wie werdet ihr SAP implementieren?
**Konsti | matchicalcom** [10:10 - 10:14]: Was habt ihr da genau im Plan und was haben wir bis dahin in petto?
**Konsti | matchicalcom** [10:14 - 10:17]: Und da müsst ihr auch ein bisschen gegeneinander abwiegen, wollt ihr es hier oder wollt ihr es hier?
**Konsti | matchicalcom** [10:17 - 10:26]: Wir können auf jeden Fall schon mal unser Go geben, dass wir unser Commitment haben, euch die Daten dahin zu spielen, wo ihr sie braucht, wenn ihr sie braucht und auch entgegenzunehmen.
**Konsti | matchicalcom** [10:26 - 10:31]: Fieldglass wiederum, da war deine konkrete Frage noch einmal wiederholen bitte.
**Pietrus, Harald** [10:31 - 10:32]: Lieferantenausschreibung.
**Konsti | matchicalcom** [10:33 - 10:39]: Lieferantenausschreibung, genau so was wie Partnermanagement ist bei uns, das kommt sogar noch in dem Quartal, also in diesem Jahr.
**Konsti | matchicalcom** [10:39 - 10:53]: Partnermanagement ist im Endeffekt sozusagen, ich habe ja auch meine Partner in dem System und habe auch hinterlegt, welche Skills können Partner sozusagen, kann auch anfragen, dann nicht nur auf Einzelressourcen, sondern auch auf Partner, Menschen und dann eigentlich klicken, okay gut, hau mir die und die Partner an und dann zack zack zack geht das raus.
**Konsti | matchicalcom** [10:53 - 10:57]: Also das ist auf jeden Fall bei uns in Scope und zwar nicht irgendwann, sondern noch in diesem Jahr.
**Pietrus, Harald** [10:58 - 11:01]: Gut, zweite Frage, warum eine REST API nicht funktionieren wird.
**Pietrus, Harald** [11:01 - 11:03]: Wir brauchen das Thema SuccessFactors.
**Pietrus, Harald** [11:03 - 11:20]: Wir brauchen den Mini Stammsatz, damit die NASA sich anmelden kann und damit er seine Zeiten erfassen kann und damit ich ihn auf eine Faktura bringe, brauche ich eine ID und die ID muss im SuccessFactor für mich ist das Access Factor oder vom Worker, also es gibt ein Worker Objekt, also du würdest was sagen?
**Konsti | matchicalcom** [11:20 - 11:24]: Ich will genau dazu sagen, so haben wir es nämlich bei Wavestone auch aufgesetzt sozusagen.
**Konsti | matchicalcom** [11:24 - 11:33]: Wir haben zu dem Berater, den wir bei uns im System haben, haben wir auch die externe ID, die in Fall die SuccessFactors ID ist, hinterlegt.
**Konsti | matchicalcom** [11:33 - 11:40]: Und wenn wir dann zum Beispiel mit dem Wavestone System sprechen, dann reden wir nicht von das ist bei uns ID 865 sondern das ist bei euch ID.
**Pietrus, Harald** [11:42 - 11:43]: Das ist eben genau die Drehscheibe.
**Pietrus, Harald** [11:43 - 11:50]: Da gibt es auch ein neues Ding, das heißt Master Data Integration, aber mein Deutschland ist man zu schlecht, zu viel Information.
**Pietrus, Harald** [11:50 - 12:00]: Wichtig ist, es muss was Generisches sein, wo wir einfach Informationen austauschen können, wo ich in der Lage bin, verschiedene Daten zusammenzuführen und Messages da irgendwie von links nach rechts zu mappen.
**Pietrus, Harald** [12:00 - 12:04]: Deshalb ist die Rest APIs 1 zu 1, wir brauchen das dann 1 zu N.
**Pietrus, Harald** [12:04 - 12:13]: Weißt du, SAP Public Cloud zu Magical, SAP Public Cloud SuccessFactors zu Feed Class und darüber Magical zu Feed.
**Pietrus, Harald** [12:14 - 12:16]: Wenn man mal vielleicht ein Ausschreibungsmanagement, egal, wird entschieden.
**Pietrus, Harald** [12:16 - 12:19]: Deshalb sage ich eine CPI, wir haben uns lieb.
**Pietrus, Harald** [12:19 - 12:22]: Ansonsten habe ich immer eins zu eins, dann synchronisiere ich mich zu Tod.
**Konsti | matchicalcom** [12:23 - 12:26]: Genau diese CPI da Middleware für Mapping Aufgaben.
**Konsti | matchicalcom** [12:26 - 12:35]: Also eben, das ist ja, aber wenn es die coolere Lösung ist, in Anführungszeichen, was ja auch Sinn macht, so wie du sagst, weil es ja dann der Broker ist, dann macht es für uns auch Sinn.
**Konsti | matchicalcom** [12:35 - 12:43]: Also da nochmal, ich rede ja hier auch gerade in die Zukunft, aber es geht darum, dass wir ganz klar sagen, das steht bei uns auf der Agenda.
**Konsti | matchicalcom** [12:43 - 12:49]: Aber jetzt, wenn ich das auch richtig verstanden habe, dann wir werden ja gar nicht erst mit der API anfangen, wenn wir mit der CPI viel mehr Needs erfüllen können.
**Pietrus, Harald** [12:49 - 12:49]: Absolut.
**Pietrus, Harald** [12:50 - 12:52]: Ich habe auch ein Monitoring, kommen die Messages an?
**Pietrus, Harald** [12:52 - 12:53]: Ja, nein, vielleicht.
**Pietrus, Harald** [12:53 - 13:02]: Und mir ging es nur darum, als es der Mario letzte Woche erklärt hat, nur zu vermeiden, wie gesagt, dass wir irgendwas bauen müssen, weil ihr ein Plugin braucht.
**Pietrus, Harald** [13:02 - 13:12]: Also gibt es große Anbieter auch von anderen Kostenlösungen, Citric, die machen Reisekosten und die wollen ein Plugin installieren, sage ich, Freunde, das gibt es in der Public Cloud nicht.
**Pietrus, Harald** [13:12 - 13:18]: Es gibt kein Plugin, weil die SAP nicht zulässt, dass bei sich irgendjemand Plugin macht.
**Pietrus, Harald** [13:18 - 13:19]: Also musst du was bauen.
**Pietrus, Harald** [13:19 - 13:22]: Das möchte ich einfach nur vermeiden, weil es für uns Aufwand ist.
**Pietrus, Harald** [13:22 - 13:23]: Das macht es halt unbequem.
**Pietrus, Harald** [13:26 - 13:28]: Das war genau die Frage.
**Pietrus, Harald** [13:29 - 13:30]: Heißt du Konsti?
**Pietrus, Harald** [13:30 - 13:31]: Das ist nur Abkürzung für meine Ignoranz.
**Konsti | matchicalcom** [13:32 - 13:33]: Ne, Konsti passt.
**Konsti | matchicalcom** [13:33 - 13:39]: Ich heiße Konstantin, aber ich nenne, also Konsti ist ne, bei Rainer Holmer mit Abkürzung.
**Pietrus, Harald** [13:39 - 13:43]: Bin jetzt soweit, Eltern überlegen sich was mit dem Namen, dann kürzt jeder brutal ab.
**Pietrus, Harald** [13:43 - 13:49]: Weißt du, die schlafen wochenlang nicht, um den richtigen Namen fürs Kind rauszufinden.
**Pietrus, Harald** [13:49 - 13:51]: Da wird es einfach immer von jedem abgekürzt.
**Konsti | matchicalcom** [13:51 - 13:54]: Nein, das habe ich mir aber auch schon sagen lassen.
**Pietrus, Harald** [13:56 - 13:57]: Ja, es ist so.
**Pietrus, Harald** [13:58 - 14:15]: Nein, aber der Punkt ist, hier ging es darum, dass klar ist, wenn die Entscheidung, ob es, wie gesagt, Magical halte mich komplett raus in meinen Augen, meine Diskussion wird nur Wie sieht der Value Flow in Zukunft aus, Wie wir den Prozess leben, um den effizient zu gestalten, um unsere Kunden zu bedienen, intern und extern.
**Pietrus, Harald** [14:15 - 14:16]: Das ist meine Sorge.
**Pietrus, Harald** [14:17 - 14:24]: Und wenn das passt, dann wird der Kanario besser beurteilen, was die Skills oder das Matching von Anforderungen angeht.
**Pietrus, Harald** [14:24 - 14:28]: Und alles, was ihr automatisieren könnt, wäre mir arg wichtig.
**Pietrus, Harald** [14:28 - 14:32]: Ich habe in einer alten Firma mal einen Prototypen gebaut, mit der SAP so eine AI basiert.
**Pietrus, Harald** [14:32 - 14:43]: Ich habe letzte, ich kriege eine Ausschreibung, Porsche Und so, Volkswagen, 250 Seiten Ausschreibung.
**Pietrus, Harald** [14:43 - 14:55]: Dann habe ich eine AI Bot bauen lassen, der mir die Ausschreibung geht, die richtigen Dinge raussucht und dann mir so ein Skill Anforderungskatalog zusammenstellt, Skills und Kosten und dann anfängt irgendwo zu suchen.
**Pietrus, Harald** [14:55 - 14:56]: Das sind die Namen.
**Pietrus, Harald** [14:56 - 15:00]: Das habe ich AI passierte Lösungen auf der BTP bauen lassen.
**Pietrus, Harald** [15:00 - 15:01]: Macht ihr sowas ähnliches?
**Konsti | matchicalcom** [15:03 - 15:07]: Was meinst du mit was ähnlichem, wenn ihr EA habt?
**Konsti | matchicalcom** [15:09 - 15:10]: Genau so ab, wie du sagst.
**Konsti | matchicalcom** [15:10 - 15:18]: Also wir nehmen sozusagen die unstrukturierten Daten her, die wir herbekommen und haben verschiedene sozusagen Agent oder Flows oder wie man es nimmt, Gibt ja immer wieder andere Namen da draußen.
**Konsti | matchicalcom** [15:18 - 15:23]: Im Endeffekt haben wir verschiedene Flows, wo wir zum einen das erstmal auch programmatisch auseinandernehmen.
**Konsti | matchicalcom** [15:23 - 15:27]: Bei 250 Seiten reden wir nicht mehr von was, was wir direkt so an die AI senden.
**Konsti | matchicalcom** [15:27 - 15:36]: Einfach auch, weil die Modelle immer besser werden, heißt das nicht, dass die qualität trotzdem bei 250 Seiten gleich bleibt, sondern da haben wir dann so bei CVs, die lang sind, haben wir dann so Chunking Mechanismen und Co.
**Konsti | matchicalcom** [15:36 - 15:46]: Also wir mixen sozusagen verschiedene Software Workflows mit eben dann wiederum AI Workflows, wo wir einfach an die API senden von OpenAI oder zum Beispiel Gemini sozusagen.
**Konsti | matchicalcom** [15:46 - 15:53]: Das sind die unstrukturierten Daten, das ist das Output Format, das ist die Anweisung dazu, gib es mir dahin und dann machen wir wieder programmatisch weiter.
**Konsti | matchicalcom** [15:53 - 16:02]: Also es ist nicht ein random AI Agent, der da irgendwas macht, sondern es ist ganz viel gestützt mit Software und Code und eigentlich Guardrails, um sicherzustellen, dass die Qualität auch immer da ist.
**Konsti | matchicalcom** [16:02 - 16:19]: Und dann tun wir sozusagen nicht einfach nur Skills auslesen, sondern wir haben im Hintergrund auch ein dynamisches Skill und Rollensystem sozusagen, wo wir also da laufen auch wiederum Agents drauf, die neue Skills, wenn sie klassifiziert werden, richtig einordnen in dem Graphen damit wir einfach gut verknüpft.
**Konsti | matchicalcom** [16:19 - 16:28]: Also weil SAP hat ja zum Beispiel 150 verschiedene Untermodule und wenn jemand in einem Untermodul sehr gut ist, dann kaskadiert es ja auch hoch zu jedem Modul drüber.
**Konsti | matchicalcom** [16:28 - 16:37]: Also das machen wir eben auch, dass wir mehr haben als nur Textstrings, was Skills angeht, sondern auch wirklich die Verknüpfungen von Skills zueinander Viktoren, Ne, passt.
**Konsti | matchicalcom** [16:38 - 16:46]: Das heißt Copilot auch Copilot können wir bedienen, also können wir bedienen, aber wir nutzen ihn bei uns selbst.
**Konsti | matchicalcom** [16:46 - 16:47]: Wir haben ihn irgendwo eingebaut.
**Konsti | matchicalcom** [16:47 - 16:56]: Aber wir wissen natürlich, man kann ja den Microsoft Graph bespielen und damit auch Copilot bespielen, damit ihr intern wiederum Copilot nutzen könnt.
**Konsti | matchicalcom** [16:56 - 17:08]: Da haben wir auch schon gesehen, da gibt es coole Sachen mit Interactive Cards, wo du direkt, also das geht dann so weit, dass wir auch wirklich in Teams, wenn du jetzt intern einen Berater findest, sozusagen Magical, den du anfragen willst, ob der verfügbar ist.
**Konsti | matchicalcom** [17:08 - 17:15]: Wenn ihr jetzt natürlich die optimale Lösung habt, dann kennt ihr die Verfügbarkeit schon, aber die Realität zeigt, ich habe den.
**Pietrus, Harald** [17:15 - 17:20]: Gestafft auf dem Projekt, ich kenne die Projekt ID, auf die immer gestafft ist bis zu einem Zeitpunkt, das wird er immer gar nicht mehr vorgeschlagen, weil der ist schon verkauft.
**Pietrus, Harald** [17:21 - 17:22]: So denken wir also denke ich.
**Konsti | matchicalcom** [17:23 - 17:23]: Genau, genau, genau.
**Konsti | matchicalcom** [17:23 - 17:24]: Das ist bloß bisschen.
**Konsti | matchicalcom** [17:24 - 17:28]: Die Theorie und die Praxis differiert da ganz leicht, haben wir festgestellt.
**Konsti | matchicalcom** [17:28 - 17:31]: Deswegen wollten wir auch noch einen Workflow bauen, wo man dann eigentlich so eine.
**Konsti | matchicalcom** [17:31 - 17:35]: Gibt ja diese Interactive Cards, wo du den Teams direkt beraten, anfragen kannst und der drücken kann.
**Konsti | matchicalcom** [17:35 - 17:36]: Ja, zack, hast du.
**Pietrus, Harald** [17:38 - 17:41]: Letzte Frage, da bin ich auch glücklich.
**Pietrus, Harald** [17:41 - 17:42]: Kann ich in Zukunft.
**Pietrus, Harald** [17:42 - 17:52]: Ja, ich habe ja verschiedene Hobbys bei der Map, also sorry, ihren Zukunftsmusik.
**Pietrus, Harald** [17:52 - 18:04]: Ich habe jetzt eine Ausschreibung, fünf Seiten von dem Kunden, die werfe ich dem Mario über den Zaun, sage hier ist die Ausschreibung, ich mache eine Analyse für die Skills, die ich brauche.
**Pietrus, Harald** [18:05 - 18:10]: Das wird in Zukunft funktionieren auf der Theorie.
**Pietrus, Harald** [18:10 - 18:17]: Also Wir haben keine 2000 Manntage versenkt, um diesen Bot zu bauen, der mir diese Volkswagenausschreibung durchliest.
**Pietrus, Harald** [18:20 - 18:21]: Ich hatte ein paar Leute, die es gemacht haben.
**Pietrus, Harald** [18:21 - 18:34]: Nein, die Frage ist, ich gebe hier irgendwann eine Ausschreibung, unstrukturierte Daten, irgendwie so und so viele Seiten PDF, ihr macht eure Magie, müsst gar nicht wissen wie, dann kriege ich ein Skillprofil, das bei mir automatisch hinten in die Planung mit übernehmen kann.
**Pietrus, Harald** [18:34 - 18:35]: Korrekt.
**Konsti | matchicalcom** [18:35 - 18:39]: Die einzige Frage wäre jetzt natürlich, wie kennt ihr Skills?
**Konsti | matchicalcom** [18:39 - 18:42]: Ihr habt ja wahrscheinlich dann auch irgendwo einen skillbaum mit bestimmten IDs oder wie?
**Pietrus, Harald** [18:44 - 18:49]: Die Frage ich bin die SAP Nase bei uns bei der Spirit.
**Pietrus, Harald** [18:49 - 18:55]: Ich weiß, SAP denkt in Berater und denkt in Modulen und in Preiskategorien.
**Pietrus, Harald** [18:55 - 19:05]: Ich habe einen SAP Berater für FIN, für keine Ahnung, L, das sind 100 das niedrigste Level, hast 5, 6, 7 Level, wo du die Berater einkategorisieren kannst.
**Pietrus, Harald** [19:05 - 19:14]: Also L ist keine Erfahrung, L ist ein bis drei Jahre Erfahrung und dann noch das Modul irgendwie die Expertise.
**Pietrus, Harald** [19:15 - 19:18]: Das ist ein Skill bei SAP Skill, den du brauchst und da gibt es einen Preis dazu.
**Ellinger, Mario** [19:22 - 19:29]: Halt mal eine ganz freche Hast du eine alte Ausschreibung, die wir einfach mal hier bei magen können und dann mal.
**Pietrus, Harald** [19:29 - 19:33]: Gucken, wenn ihr ein NDE habt, gebe ich eine aktuelle Ausschreibung.
**Konsti | matchicalcom** [19:34 - 19:36]: NDA haben wir, wir haben noch nichts.
**Pietrus, Harald** [19:36 - 19:39]: Unterschrieben aktuell, Marius, dann gibt es keine.
**Pietrus, Harald** [19:40 - 19:41]: Sorry dafür.
**Konsti | matchicalcom** [19:45 - 19:47]: Also das 250 Seiten Ding klappt aktuell noch nicht.
**Konsti | matchicalcom** [19:47 - 19:52]: Wir sind momentan mehr spezialisiert auf die Minitender Dinger, weil das gerade auch der spitzere Use Case ist.
**Konsti | matchicalcom** [19:52 - 19:57]: Also Anfrage kommt von der Deutschen Bahn rein, Anfrage kommt von R V Versicherern, verschiedenen anderen sicher.
**Konsti | matchicalcom** [19:57 - 20:08]: Aber wir wissen natürlich auch diese, also 50 Seiten geht auch schon, aber 250 Seiten ist an sich vom Thema her, wir müssen den Workflow noch ein bisschen anders unterteilen, aber 250 ist wahrscheinlich noch nicht so.
**Pietrus, Harald** [20:10 - 20:20]: Deutsche Bahn, ich habe noch irgendwas, ich muss mal gucken, aber gerade ich finde such mal was, wo wir auch ohne NDE teilen können.
**Pietrus, Harald** [20:20 - 20:30]: Ich will jetzt keine aktuellen Informationen rausgeben, das machen wir nicht, sondern ich suche mal irgendwas, vielleicht 5, 6, 7, 10 Seiten den einfach mal über den Zaun werfen, mal gucken.
**Konsti | matchicalcom** [20:33 - 20:34]: Dass du eine Idee hast.
**Konsti | matchicalcom** [20:34 - 20:37]: Ich kann dir mal zeigen, wie das abläuft vom Prinzip her.
**Konsti | matchicalcom** [20:37 - 20:40]: Wobei wir die UI da auch noch mal ein bisschen anpassen werden an ein paar Stellen.
**Konsti | matchicalcom** [20:40 - 20:52]: Wenn wir jetzt hier mal diese typische deutsche Bahnanfrage nehmen mit einem Dokument, wo einfach die Metadaten draufstehen und dann hier die Dokumente sind ja unterschiedlich lang, meistens haben sie aber nur ein paar Seiten, wo bisschen drinsteht, was wird eigentlich gesucht?
**Konsti | matchicalcom** [20:52 - 20:55]: Aufgaben, Anforderungen, must have, nice to have.
**Konsti | matchicalcom** [20:55 - 21:00]: Wenn man die eben nach Magical rüberspielt, dann wäre das hier diese Anfrage.
**Konsti | matchicalcom** [21:00 - 21:11]: Und was wir machen eben, wir lesen zum einen den Kunden aus, eben die Kundenanfragenummer, das war eben diese BA und dann eben lesen wir aus, wie viel Bedarfe sind darunter.
**Konsti | matchicalcom** [21:11 - 21:13]: Hier war es jetzt zum Beispiel konkret nur ein Bedarf, das ist ja dieses Layer.
**Konsti | matchicalcom** [21:14 - 21:16]: Opportunity kann ja mehrere Bedarfe haben.
**Konsti | matchicalcom** [21:16 - 21:19]: Ich weiß nicht genau wie SAP Terminologie dazu ist.
**Pietrus, Harald** [21:19 - 21:23]: Ja, leider ist genau das eine Opportunity kann mehrere Projekte haben.
**Konsti | matchicalcom** [21:23 - 21:24]: Das ist was uns töten Projekte.
**Konsti | matchicalcom** [21:24 - 21:26]: Ja, dann ist Opportunity.
**Konsti | matchicalcom** [21:26 - 21:32]: Genau, wir nennen es noch Bedarf, weil es ja noch kein Projekt ist, aber dann wäre es bei euch vom Wording her Opportunity Kern, mehr Projekte, Projekte haben.
**Pietrus, Harald** [21:32 - 21:34]: Genau, Nachfolgeprojekte und so weiter und so fort.
**Konsti | matchicalcom** [21:34 - 21:42]: Genau das, was wir hier auslesen, ist dann sowas wie eben diese Metadaten, Startdatum, Enddatum, Kontingent Rate, eben Remote Ratio, Einsatzort.
**Konsti | matchicalcom** [21:42 - 21:43]: Und dann lesen wir hier eben.
**Pietrus, Harald** [21:45 - 21:46]: Diese.
**Konsti | matchicalcom** [21:46 - 22:00]: Skillanfragen aus, wie zum Beispiel Angular und sagen auch Angular gehört zu dieser Gruppe in unserem Skillgraphen sozusagen und das sind sozusagen die ganzen Skillanforderungen, die abgeleitet werden, basierend auf der Anfrage vom Kunden sozusagen.
**Konsti | matchicalcom** [22:00 - 22:16]: Die werden nicht einfach random abgeleitet, sondern hier unten sieht man sozusagen die Aufgabenbeschreibung, die Must have Requirements und die Nice have Requirements und wir gehen im Endeffekt diese Must have Requirements durch und ordnen zu jedem einzelnen Requirement zu, OK, welche Skills werden gesucht in diesen Anforderungen.
**Pietrus, Harald** [22:16 - 22:26]: Aber jetzt gerade dieses Angular ganz kurz, es gibt ja Leute, die sagen Angular seit zehn Jahren machen oder fünf Jahren machen viel mehr und die, die erst anfangen, das ist ja nochmal ein Scoring in den Senioritätslevel.
**Pietrus, Harald** [22:26 - 22:38]: Mein Problem ist nicht mein Problem, die Challenge wird sein, ich brauche Senioritätslevel, ich bin ja Berater, ich verkaufe ja einen Juniorenberater als Seniorenberater, das ist ja mein Job, also möglichst jung.
**Pietrus, Harald** [22:41 - 22:44]: Ne, leider nicht, aber deshalb versucht es ja irgendwie zu.
**Pietrus, Harald** [22:45 - 22:57]: Das wäre zum Beispiel auch die Frage, ich habe jetzt keine Ahnung, der Kunde sucht jemanden mit fünf Jahren, der verkauft ihm jemand, mit drei Jahren kriegt er auch fünf und wenn ich auf der Bank sitzen habe, kriegt er auch mit sieben Jahren Erfahrung.
**Pietrus, Harald** [22:57 - 23:03]: Und diese Flexibilität im dreckigen Beratungsgeschäft, die baut ihr mit rein, oder?
**Konsti | matchicalcom** [23:04 - 23:10]: Genau, die Idee ist sozusagen, also hier, wenn jetzt ausgelesen wird, deswegen siehst du auch bei Java 5 Angular 4 Docker 3.
**Konsti | matchicalcom** [23:10 - 23:22]: Wir haben jetzt keine Metrik von 1 bis 7, wir haben sie einfach von 1 bis 5, aber die auch ähnlich so 1 ist so ein bisschen Erfahrung, 2 brauchst du schon beim mindestens also da spielen zwei Sachen rein, nicht nur die Yara Erfahrung, sondern auch die Recency.
**Konsti | matchicalcom** [23:22 - 23:27]: Ich kann dir das mal zum Beispiel zeigen bei Tony Stark hier, so sieht es aus, wenn wir ein Profil ausgelesen haben.
**Konsti | matchicalcom** [23:27 - 23:36]: Also wir lesen aus dem Profil die ganzen Einsätze, in dem Fall die ganzen Projekte nennt ihr es, wir nennen es Projekteinsatz, weil es ist ja ein Projekt, kann ja mehrere Einsätze haben, deswegen der Unterschied.
**Konsti | matchicalcom** [23:36 - 23:41]: Aber im Endeffekt, wir lesen jeden Einsatz einzeln aus und ordnen dann auch bei Tony Stark ab.
**Konsti | matchicalcom** [23:41 - 23:44]: Okay, welche Rolle hatte Tony Stark hier und welchen Skill hatte.
**Konsti | matchicalcom** [23:44 - 23:54]: Er hatte hier zum Beispiel Angular 17, 18 und das ist eben Angular 1718, jetzt nicht speziell Angular 1718, sondern gehört generell zum Hauptskill, zum Skillkonzept Angular.
**Konsti | matchicalcom** [23:54 - 24:01]: Und entsprechend zählen wir dann einfach die Anzahl der Monate Erfahrung, die Tony Stark hat, in dem Fall neun Monate Erfahrung, zählen wir ihm entsprechend.
**Konsti | matchicalcom** [24:01 - 24:06]: Er kriegt neun Monate Erfahl auf sein Fullstack Developer Angular Konto gutgeschrieben und das läuft dann hier ab.
**Konsti | matchicalcom** [24:06 - 24:19]: Also zum Beispiel in Java eine 5, weil er in dem Fall überschneidungsfrei 16 Jahre und 5 Monate Projekte in seinen Einsätzen hat, sozusagen, wo er Java eingesetzt hat und zuletzt auch vor acht Monaten.
**Konsti | matchicalcom** [24:19 - 24:21]: Wenn das jetzt zehn Jahre her wäre, dann würde auch wieder runtergestuft werden.
**Konsti | matchicalcom** [24:21 - 24:26]: Also die zwei Sachen, die auf die Metrik einspielen, sind eben Anzahl der Erfahrungen und Recency.
**Konsti | matchicalcom** [24:26 - 24:28]: Wenn es länger her ist, dann decayed es nach der Zeit wieder.
**Konsti | matchicalcom** [24:29 - 24:41]: Und jetzt genau deine Frage bezüglich Flexibilität, diese Skill Matrix, die hier ausgelesen wird sozusagen, also welche Skills wurden hier ausgelesen, die die Deutsche Bahn sucht, Djerba, Angular, Docker und so weiter und so fort.
**Konsti | matchicalcom** [24:41 - 24:47]: Und wie tun wir sie in unserem Rating einstufen, basierend auf der Anzahl der Erfahrungen, die gesucht werden?
**Konsti | matchicalcom** [24:49 - 24:53]: Entschuldigung, das hier ist im Endeffekt nichts anderes als ein Suchstring.
**Konsti | matchicalcom** [24:53 - 24:56]: Ich kann diesen Suchstring auch manipulieren, indem ich Sachen entferne oder hinzufüge.
**Konsti | matchicalcom** [24:56 - 25:01]: Skills änder von must have C, er braucht einen höheren Score oder einen tieferen Score.
**Konsti | matchicalcom** [25:01 - 25:11]: Wenn ich das gemacht hab, kann ich einfach auf Find Candidates gehen und dann sehe ich eigentlich hier sozusagen auf den Suchstring genau runtergefiltert, dass es zu 0 Prozent AI, sondern zu 100 Prozent berechnet.
**Konsti | matchicalcom** [25:11 - 25:28]: Damit man auch effizient tausende von Profilen durchsuchen kann, sehe ich dann eben, ah ja, hier rechts ist Mein Suchstring, wir verteilen nach einem gewissen, in Anführungszeichen smarten Algorithmus die 100 Prozent, damit man sich selbst nicht überlegen muss, wie schiebt man die Prozentregler hin und her und dann ist es einfach nur ein Mix and Match.
**Konsti | matchicalcom** [25:28 - 25:34]: Also Tony Stark erfüllt die Rolle, Full Stack Developer kriegt dafür schon mal für die Rolle kriegt man immer schon mal ein Viertel Scores gutgeschrieben.
**Konsti | matchicalcom** [25:35 - 25:39]: Die Sachen erfüllt er auch alle, hier erfüllt er es gar nicht, also kriegt er keinen Teilscore.
**Konsti | matchicalcom** [25:39 - 25:46]: Bei Groovy hat er eine 1, bräuchte aber eine 2, also kriegt er 50 Prozent der 3,7 Prozent, also dann 1,8 Prozent.
**Konsti | matchicalcom** [25:46 - 26:02]: Das hilft mir jetzt sozusagen in der suchenden Funktion zu gucken, OK gut, nicht nur wer passt am besten, sondern ich kann auch die ersten 5 hier gegeneinander abgleichen und OK, der eine bringt dafür, der eine bringt Groovy mit, aber dafür hat er halt einfach OpenShift und Docker nicht sozusagen.
**Konsti | matchicalcom** [26:02 - 26:14]: Ich kann aber auch einstellen, zum Beispiel, wir sagen jetzt einfach mal, dass Docker und Groovy sind Hard Requirements, die muss man einfach beide können und dann weiß ich jetzt nicht, ob wir das auf unserem Demo Tenant haben.
**Konsti | matchicalcom** [26:14 - 26:25]: Ne, haben wir nicht auf unserem Demo Tenant, der ist nämlich nur relativ wenig los, aber bei Soft haben wir wahrscheinlich hier, wie der Toni sagt, weil er erfüllt Docker zu 100 Prozent und Groovy halt zu 50 Prozent.
**Konsti | matchicalcom** [26:25 - 26:30]: Also ich kann auf diese Art und Weise relativ schnell meine Beraterdatenbank eigentlich effizient filtern.
**Konsti | matchicalcom** [26:30 - 26:33]: Jetzt ist die Frage natürlich, die du auch gestellt hast, kann ich die Skills zu euch spielen?
**Konsti | matchicalcom** [26:33 - 26:44]: Wir kennen halt eure Skill ids nicht und unsere Skill Datenbank ist deutlich diversifizierter als das, was ihr wahrscheinlich in SAP habt, weil wir haben inzwischen über Skills.
**Pietrus, Harald** [26:45 - 26:50]: Also SAP denke nur, wir werden für die Quelle machen für die Company.
**Pietrus, Harald** [26:50 - 27:06]: Wir können aber, das ist genau das Schöne, was die Service Level angeht, also die Servicekategorien, die ich definiere, Skill Level, da sind wir ja frei, kann ja definieren, wenn der Mario sagt, er braucht ungefähr der Projektor, Der muss ungefähr 175 Servicekategorien planen müssen.
**Pietrus, Harald** [27:06 - 27:16]: Ich brauche jemanden, der Escher kann oder jemanden, der AWS kann, verschiedene Level, jemand, der SAP PP kann in fünf Ausbaustufen, da bin ich ja ungefähr, das ist eine Entscheidung von unserem Ressource Management.
**Pietrus, Harald** [27:16 - 27:19]: Ich bin ja der Typ, der es dann irgendwie im System so einstellen lässt.
**Pietrus, Harald** [27:20 - 27:31]: Das kriegen wir hin letzte frage preis von 100 kunde will höchstens 100 euro bezahlen da finde ich niemanden sagt mir euer System ich habe jemanden für 120 der gut passen würde das ist auch.
**Konsti | matchicalcom** [27:31 - 29:04]: Noch mal ein anderes Thema hier Gute Frage, weil wir sagen ja auch sozusagen um den passenden Berater zu finden müssen drei Sachen übereinstimmen es braucht ein Skillfit, der muss ein Preisfit haben und der muss verfügbar sein Genau genau für Skillfit hast du gerade gesehen Preisfit machen wir momentan können wir nur dann machen wenn wir natürlich die Preise kennen also und was wir dann machen wir gucken nach dem Berater der relativ den höchsten Score bringt mit dem niedrigsten Preis jetzt mal hier fiktiv 400 Euro und die Person in einem Matching also in einer Ergebnismenge die wir finden die die beste relative Menge an Score bringt sozusagen für das wenigste Geld die ist dann der Anker und die kriegt die zehn von zehn dass ich einen Vergleichswert habe also ein Match ist immer die 10 von 10 der ist Preis leistungsmäßig der beste Kandidat und dann wird danach abgestuft sozusagen eben Preisscore 6,1 8,6 was man natürlich auch noch machen kann ich kann bei Filter ausstellen zeigt mir alle zeigt mir keinen der rate teurer 800 ist so in der Art also das ist dann natürlich ein ganz simpler Filter den man natürlich einsetzen kann aber neben diesem Filter sehe ich dann natürlich auch Preis Leistungsverhältnis sozusagen damit ich diesen Dreisatz der ist ja im Kopf dann doch relativ schwierig manchmal zu bewerkstelligen wenn ich jetzt irgendwie ein 57 prozent match der 525 kostet vergleichen muss gegen einen 65 prozent match der 400 kostet wie ist da das Verhältnis in dem Fall ja fast sogar zwei Drittel zu Ja jetzt noch letzte Frage.
**Pietrus, Harald** [29:04 - 29:37]: Wen der Zelle war finde ich mega total spannende Diskussion danke fürs Aufsetzen Verfügbarkeit ist man genau den Punkt genannt wenn man jetzt bin ich ja Berater jetzt weiß ich ein Kunde Projekt hat jetzt eine Anfrage weiß genau der fängt erst nächstes Jahr im keine Ahnung April an habe jetzt ein Projekt muss April stuffen wenn ich jetzt die Verfügbarkeit suche und im April habe ich niemand kann ja Kunde wenn ich im Mai anfange habe ich den Mega Typi für dich also heißt hilft mir auch zu sagen, ich muss Projektstart wäre theoretisch im April, wenn ich aber in den Mai gehe, habe ich die bessere Ressource.
**Pietrus, Harald** [29:37 - 29:40]: Macht ihr das auch, diesen Dreiklang?
**Konsti | matchicalcom** [29:41 - 29:42]: Genau, genau diesen Dreiklang.
**Konsti | matchicalcom** [29:42 - 29:43]: Also wir haben es noch nicht.
**Konsti | matchicalcom** [29:43 - 29:54]: Verfügbarkeiten haben wir noch nicht so eingebaut, wie wir es einbauen wollen, einfach weil wir auch ein bisschen gerade bedarfsgesteuert gehen und an Verfügbarkeitsplanung, da kommst du als Startup jetzt so schnell nicht dran bei Waves und Co.
**Konsti | matchicalcom** [29:54 - 29:58]: Deswegen sagen okay, gut, wenn es momentan eh noch keiner nutzen möchte, dann müssen wir es auch noch nicht groß implementieren.
**Konsti | matchicalcom** [29:58 - 30:19]: Aber da haben wir uns schon echt coole Sachen überlegt, wie man die machen kann, Weil zum einen gibt es ja die Verfügbarkeit, die ich kenne, weil die Ressourcen committed sind, Aber zum anderen ist es ja auch die Leute reden und wir haben uns gedacht, wenn man einfach die Leute immer wieder promptet, alle zwei Wochen ihren Verfügbarkeitsreport auch wirklich proaktiv zu bestätigen, erhält man wahrscheinlich nochmal eine noch bessere Qualität, als wenn man sich nur auf das verlässt, was committed ist.
**Konsti | matchicalcom** [30:19 - 30:25]: Aber ganz konkret auf deine Frage, was wir momentan haben, das ist aber eher mal so pilotmässig.
**Konsti | matchicalcom** [30:25 - 30:32]: Ich kann beim Tony Stark, also das hat noch nicht den Value, den es haben muss, aber nur mal als Pilotding.
**Konsti | matchicalcom** [30:32 - 30:37]: Ich könnte die Next Availability setzen und ich könnte die Notice Period setzen sozusagen.
**Konsti | matchicalcom** [30:37 - 30:37]: Der ist innerhalb von.
**Pietrus, Harald** [30:39 - 30:40]: Okay, perfekt.
**Pietrus, Harald** [30:40 - 30:41]: Das wollte ich wissen.
**Konsti | matchicalcom** [30:42 - 30:43]: Also es gibt dann zwei Arten.
**Konsti | matchicalcom** [30:43 - 30:46]: Es gibt ja hier immer auch bei Dings, wie wir es gesehen haben, es gibt Soft und Hard.
**Konsti | matchicalcom** [30:46 - 30:50]: Bei Hard filter ich nach Leuten, die dann verfügbar sind, wenn ich sie brauche.
**Konsti | matchicalcom** [30:50 - 30:56]: Und Soft ist momentan eingestellt innerhalb der nächsten zwei Monate, wenn sie dann verfügbar werden.
**Konsti | matchicalcom** [30:56 - 30:59]: Wir können aber auch noch einen Regler machen, dass man einstellen kann.
**Konsti | matchicalcom** [30:59 - 31:02]: Kannst du mal schauen, ob jemand irgendwie in vier Monaten verfügbar wäre.
**Konsti | matchicalcom** [31:02 - 31:09]: Also momentan haben wir die Kategorie Soft, Hard und und kein Filter und Soft ist momentan bis zwei Monate in die Zukunft geguckt vom Startdatum weg.
**Pietrus, Harald** [31:09 - 31:10]: Aber mega.
**Pietrus, Harald** [31:11 - 31:15]: Mein Vorschlag wäre, wir haben ein paar Ideen über den Mario.
**Pietrus, Harald** [31:15 - 31:18]: Unsere Requirements, also was wir tun gerade.
**Pietrus, Harald** [31:19 - 31:27]: Wir machen gerade so eine Due Diligence, S ERP Cloud, die richtige Lösung für den Spirit mit allen Themen, wie wir Prozesse leben wollen.
**Pietrus, Harald** [31:27 - 31:28]: Das ist FECU.
**Pietrus, Harald** [31:28 - 31:29]: So war auch das Ganze immer.
**Pietrus, Harald** [31:29 - 31:30]: Wie machen wir Projektplanung?
**Pietrus, Harald** [31:30 - 31:33]: Und da ist Ressourcen der wichtigste Punkt in der Projektplanung.
**Pietrus, Harald** [31:34 - 31:35]: Wir wollen eine Faktura gestalten.
**Pietrus, Harald** [31:35 - 31:47]: Ja, die Yadi Jadi, da wird es ein paar Anforderungen geben, die würde ich gerne über den Mario Bauch einkippen Und das zweite bin jetzt auch Beratungsleiter, also momentan noch für den minimalen Bereich, aber das wird sich hoffentlich mal ändern.
**Pietrus, Harald** [31:47 - 31:49]: Und ich habe eine Idee, wie Beratung funktioniert.
**Pietrus, Harald** [31:50 - 31:51]: Auch die Anforderungen.
**Pietrus, Harald** [31:51 - 31:54]: Mauro, wenn es OK wäre, würde ich gerne über dich einkippen.
**Pietrus, Harald** [31:54 - 32:05]: Einfach zu sagen, für meine Sicht nicht als S Foot SAP Fuzzi, sondern als jemand, der Berater irgendwie unter Last Lohn und Brot bringen muss und externe auch braucht, interne und externe braucht.
**Pietrus, Harald** [32:05 - 32:12]: Einfach noch ein paar Anforderungen mit reinkippen, wie ich mir vorstelle, wie ich Ressourcenverfügbarkeit planen würde, wenn ich es dürfte.
**Ellinger, Mario** [32:14 - 32:16]: Definitiv kann man gerne machen.
**Konsti | matchicalcom** [32:17 - 32:25]: Das können wir sogar doppelt gerne machen, weil wie gesagt, wir sind gerade im Early Adapter Modus, wir sind gerade nur mit ganz wenigen Partnern in der Zusammenarbeit, machen auch noch keine aktive Sales und Co.
**Konsti | matchicalcom** [32:25 - 32:30]: Wir sagen gerade weniger ist mehr und wir fokussieren uns auch noch ganz stark auf einige Sachen, die wir entwickeln wollen.
**Konsti | matchicalcom** [32:30 - 32:37]: Deswegen also solche Austäusche immer auf jeden Fall sehr, sehr gerne, können wir gerne machen, weil momentan kann man bei uns auch wirklich auch noch mitreden und eben solche Ideen.
**Konsti | matchicalcom** [32:38 - 32:40]: Also du hast ja schon genau die richtigen Punkte genannt.
**Konsti | matchicalcom** [32:40 - 32:44]: Also ich merke, wir sind da relativ allein, was die perfekte Welt angeht, in Anführungszeichen.
**Konsti | matchicalcom** [32:44 - 32:53]: Jetzt vielleicht kurze Gegenfrage, weil du ja von SAP gesprochen hast, einfach nur aus der Erfahrung raus und Mario, du hast ja schon die Timeline, also Entschuldigung, wir sind schon über der Zeit, gell?
**Pietrus, Harald** [32:53 - 32:54]: Ne, passt schon.
**Pietrus, Harald** [32:54 - 32:56]: Der Kollege hat gerade kurz vertröstet noch, das passt schon.
**Pietrus, Harald** [32:57 - 32:57]: Okay.
**Konsti | matchicalcom** [32:58 - 32:58]: Genau.
**Konsti | matchicalcom** [32:58 - 33:12]: Kurze Gegenfrage, weil Planung ist irgendwie, ihr wollt damit live gehen, 27 und eben, ich denke, was Sinn macht, Harald, ist während diese Requirements Planung ist und wir auch weitermachen, dass wir uns regelmäßig mal synchronisieren.
**Konsti | matchicalcom** [33:12 - 33:19]: Wo steht ihr, wo stehen wir, Weil gegebenenfalls, weil, also rein erfahrungsgemäß, SAP Projekte brauchen immer ein bisschen länger als geplant.
**Konsti | matchicalcom** [33:19 - 33:19]: Nein.
**Pietrus, Harald** [33:24 - 33:25]: Warum?
**Pietrus, Harald** [33:25 - 33:26]: Es gibt ja Migration.
**Pietrus, Harald** [33:26 - 33:31]: Ich migriere nicht unterjährig, so eine Butze wie eine Spirit werde ich nicht unterjährig migrieren.
**Pietrus, Harald** [33:31 - 33:48]: Wir migrieren zum Jahresende, Stammdaten, offene Posten, Punkt zurückgerechnet, Wir werden Integration, User Acceptance Test, kann jetzt schon sagen, im Oktober spätestens starten bis November dann irgendwie so.
**Pietrus, Harald** [33:48 - 34:01]: Das heißt, wenn wir diskutieren, wäre alles bis Oktober Teil einer potenziellen Lösung, die wir bauen würden, weil von Oktober bis Dezember würde ich testen lassen und dann würden wir bis Mitte Dezember testen lassen und dann migrieren.
**Pietrus, Harald** [34:02 - 34:05]: Welche Release Zyklen habt ihr denn, Konstantin?
**Konsti | matchicalcom** [34:05 - 34:07]: Welche Release Zyklen?
**Pietrus, Harald** [34:07 - 34:08]: Ja, wie oft deploy?
**Pietrus, Harald** [34:08 - 34:13]: Also SAP halbe Jahr, früher waren es jedes Quartal gab es einen neuen Release.
**Pietrus, Harald** [34:13 - 34:14]: Welchen Release Zyklus habt ihr denn?
**Konsti | matchicalcom** [34:15 - 34:20]: Wir waren bis vor kurzem noch bei drei Tage, jetzt wollen wir eher auf zwei Wochen wechseln, dass es stabiler wird.
**Pietrus, Harald** [34:21 - 34:25]: Okay, bis wir soweit sind, habt ihr einen Monat, kann ich euch garantieren.
**Pietrus, Harald** [34:25 - 34:27]: Ansonsten habt ihr ein Problem, wenn ihr Kunden habt.
**Pietrus, Harald** [34:27 - 34:34]: Nur mal so mit dem ganzen Versionsverwaltung, aber das wisst ihr bestimmt, wie ihr die Versionen verwaltet an den Kunden ausgeliefert habt.
**Konsti | matchicalcom** [34:36 - 34:36]: Nein, nein, nein.
**Konsti | matchicalcom** [34:36 - 34:40]: Also da haben wir, wir haben eine sehr gute CI CD, dass wir wirklich das pushen können.
**Konsti | matchicalcom** [34:40 - 34:43]: Parallel werden die Frontend Server erst dann umgezogen.
**Konsti | matchicalcom** [34:43 - 34:45]: Aber ja, guter Punkt.
**Konsti | matchicalcom** [34:45 - 34:59]: Wir wissen eben allein schon auch, also wir sind auch dabei gerade Release und Deployment komplett voneinander zu trennen, also im Sinne von, dass wir deployen immer wieder mal mit Feature Toggles und releasen tun wir erst, wenn wir wissen, das ist schon längst im Production Code, der funktioniert auch, jetzt wird er einfach nur freigeschaltet.
**Pietrus, Harald** [35:00 - 35:01]: Das meine ich damit.
**Pietrus, Harald** [35:01 - 35:07]: Und da wäre alles, was bis Oktober releasefähig ist, also nicht diplomatisch, sondern releasefähig.
**Pietrus, Harald** [35:07 - 35:09]: Also jemand anders hat das Ding funktioniert.
**Pietrus, Harald** [35:11 - 35:23]: Bis dahin würde ich Ihnen gerne wirklich jetzt ohne Spaß, jetzt mal wirklich im ernsthaften Softwareentwicklungsseite, ich kenne zu gucken, was, sage ich mal, September, Oktober releasefähig ist, das würden wir gerne mit reinnehmen und dann würde ich ungern wieder was mit reinnehmen.
**Pietrus, Harald** [35:23 - 35:26]: Integration, weil das macht mir Kopfschmerzen.
**Konsti | matchicalcom** [35:26 - 35:28]: Integration sind immer Kopfschmerzen.
**Konsti | matchicalcom** [35:28 - 35:32]: Kann ich voll und ganz nachgesetzt sein.
**Pietrus, Harald** [35:33 - 35:35]: Bis September liefern könnt mega.
**Pietrus, Harald** [35:35 - 35:41]: Und dann gerne wieder, dann gerne wieder in 27 aber alles was ihr sagt, wähle Mario, ganz wichtig.
**Pietrus, Harald** [35:41 - 35:50]: Alles, was bis 27 bis September, sage ich mal, nächsten Jahres fertig ist, mega gerne für den Case, alles andere Roadmap, sehr cool.
**Konsti | matchicalcom** [35:50 - 36:10]: Okay, dann halten wir das für uns auch im Kopf auf jeden Fall, dass wir uns abstimmen, Mario, weil es gibt ja, es gibt einige Sachen, die sind auf jeden Fall kritisch, damit das ganze Ding gut fliegt und dann gibt es andere Sachen, die sind nice to have und wir fokussieren uns in dem Fall ganz klar, okay, was ist kritisch, aber eben mit der Timeline September oder da können wir gut arbeiten.
**Pietrus, Harald** [36:11 - 36:15]: Also bei uns falsch verstehen, wenn ich das Ding machen soll.
**Pietrus, Harald** [36:15 - 36:18]: Da gibt es klare Ansagen, also wir kein Risiko eingehen für eine Firma.
**Pietrus, Harald** [36:20 - 36:23]: Da gibt es einen Plan und den werden wir durchexerzieren.
**Pietrus, Harald** [36:23 - 36:37]: Wir machen ja Standard und wie wir integrieren werden, wird Standard sein und das könnt ihr gerne nutzen, woanders noch positionieren, weil Cloud for Project von der SAP habe ich letztes Jahr mal angeguckt mit einer anderen Rolle.
**Pietrus, Harald** [36:37 - 36:39]: Ne, dieses Jahr angeguckt mit einer anderen Rolle.
**Pietrus, Harald** [36:39 - 36:42]: Scheiße teuer du den Ausdruck.
**Pietrus, Harald** [36:42 - 36:43]: Da zahlst Namen im beIN.
**Pietrus, Harald** [36:44 - 36:55]: Und viele Kunden, die gerade Nagaro, PwC und die ganzen Beratungsfirmen gehen jetzt Richtung Public Cloud, machen ihre Projekte, dafür brauchen sie Ressourcenverwaltung.
**Pietrus, Harald** [36:55 - 37:05]: Wenn wir da ein Use Case haben, garantiere ich euch, da habt ihr mal auch andere Kunden jetzt genau das Thema auch machen, Richtung Professional Service gehen und da eben Ressourcen Skill Matching brauchen.
**Pietrus, Harald** [37:05 - 37:07]: Das wird ein Riesenthema für euch auch werden.
**Pietrus, Harald** [37:09 - 37:10]: Wollen wir es richtig machen?
**Pietrus, Harald** [37:10 - 37:12]: Und wie gesagt, da haben wir, glaube.
**Konsti | matchicalcom** [37:12 - 37:14]: Ich, gute Themen, da sind wir absolut dabei.
**Konsti | matchicalcom** [37:14 - 37:15]: Harald, vielen Dank.
**Konsti | matchicalcom** [37:15 - 37:19]: Und da sind wir auch froh, dass wir dann dich auf der anderen Seite haben gleich, um das richtig zu machen.
**Pietrus, Harald** [37:19 - 37:20]: Ihr habt den Mario.
**Pietrus, Harald** [37:20 - 37:21]: Ich bin ja nur der.
**Konsti | matchicalcom** [37:23 - 37:24]: Nein, aber von der SAP Seite.
**Konsti | matchicalcom** [37:25 - 37:28]: Mario heißt ja sowieso, wir sind ganz enge Mario.
**Pietrus, Harald** [37:30 - 37:31]: Aber das passt.
**Pietrus, Harald** [37:35 - 37:43]: Wenn Zeit bleibt, perfekt, dann machen wir es mit dem Mario gerne nochmal Austausch und dann freue ich mich da, wenn wir gemeinsam was machen können nächstes Jahr.
**Ellinger, Mario** [37:44 - 37:46]: Gut, dann kann ich jetzt den nächsten Schritt reingehen.
**Ellinger, Mario** [37:47 - 37:52]: Besprochen ist alles, ihr könnt miteinander reden schon mal gut, jetzt darf ich die drei Geschäftsführer.
**Konsti | matchicalcom** [37:54 - 37:56]: Mario, vielen lieben Dank fürs Organisieren.
**Pietrus, Harald** [37:58 - 37:59]: Kollegen, Dankeschön.
**Pietrus, Harald** [37:59 - 38:00]: Bis demnächst.
**Pietrus, Harald** [38:00 - 38:00]: Mach's gut, danke.
**Pietrus, Harald** [38:00 - 38:01]: Ciao.
**Konsti | matchicalcom** [38:03 - 38:04]: Wir sprechen uns.
**Konsti | matchicalcom** [38:04 - 38:06]: Du hältst mich einfach up to date oder?
**Ellinger, Mario** [38:06 - 38:07]: Ich halte dich up to date.
**Ellinger, Mario** [38:07 - 38:11]: Ich muss jetzt mal einen Termin finden, wenn ich die drei zusammenkriege.
**Konsti | matchicalcom** [38:12 - 38:13]: Sehr cool auf jeden Fall.
**Konsti | matchicalcom** [38:13 - 38:15]: Wo sitzen die denn alle?
**Ellinger, Mario** [38:16 - 38:20]: Die sind in Böbling, also das ist schon okay, aber ich muss jetzt irgendwie meine Zeit hinnehmen.
**Konsti | matchicalcom** [38:21 - 38:25]: Ja, das ist immer von drei Leuten gleich einen Slot zu bekommen, ist manchmal gar nicht so einfach.
**Konsti | matchicalcom** [38:26 - 38:30]: Genau, aber das sag, wenn du noch irgendwas von mir brauchst und dann freuen wir uns.
**Ellinger, Mario** [38:30 - 38:31]: Ciao, ciao, machen wir das.
**Ellinger, Mario** [38:31 - 38:32]: Danke, wünsch dir was.
**Ellinger, Mario** [38:32 - 38:33]: Ciao, ciao.
