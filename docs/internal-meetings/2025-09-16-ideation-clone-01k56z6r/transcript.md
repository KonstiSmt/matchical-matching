# Ideation (Clone)

**Carlos | matchicalcom** [00:01 - 00:02]: Good afternoon.
**Konsti | matchicalcom** [00:05 - 00:06]: How'S it going?
**Konsti | matchicalcom** [00:07 - 00:16]: All good, perfect, perfect, yeah, same here, same here, Like I don't know.
**Konsti | matchicalcom** [00:16 - 00:22]: Meetings, meetings, kind of increase, you know time reduces.
**Carlos | matchicalcom** [00:25 - 00:28]: And I think that's one of the reasons that I'm here.
**Carlos | matchicalcom** [00:28 - 00:33]: Also right so, so free up some.
**Konsti | matchicalcom** [00:33 - 00:36]: Of your time, but some really.
**Konsti | matchicalcom** [00:36 - 00:50]: Sometimes I'm missing a little bit the time when we really started out and we had not an idea where this could eventually go that fast and I was just like developing every day whatever I was thinking, I think this is now the best, This is not the best.
**Konsti | matchicalcom** [00:50 - 00:52]: Oh, let's now do this.
**Carlos | matchicalcom** [00:52 - 00:53]: It's fine.
**Carlos | matchicalcom** [00:53 - 01:10]: It's fine, right, Right and glad, I think I'm sure that you are glad to be here at this point and anxious about the future, because this is this growing path is just interesting to see how things go and the daily problems that we have to solve just it's a constant.
**Carlos | matchicalcom** [01:10 - 01:17]: You never get stable because you get ten more clients, you get problems in the product, you fix them, you grow a little bit more and it's ongoing.
**Konsti | matchicalcom** [01:18 - 01:22]: Yep, software painful software has a big leverage.
**Konsti | matchicalcom** [01:24 - 01:30]: What is your based on what you were seeing in the last few hours.
**Carlos | matchicalcom** [01:31 - 01:37]: No before going there, I'd like just to talk about you two things that I found in the code.
**Carlos | matchicalcom** [01:37 - 01:38]: Nothing too serious.
**Carlos | matchicalcom** [01:38 - 01:38]: Don't worry.
**Carlos | matchicalcom** [01:39 - 01:45]: But first of all it looks like in the past you had only the Consulting App and then you.
**Carlos | matchicalcom** [01:46 - 01:48]: Cloned it to create the consulting core.
**Konsti | matchicalcom** [01:48 - 01:56]: And consulting correct, okay, or advance was vice versa one of those whatever, whatever.
**Carlos | matchicalcom** [01:56 - 01:58]: It doesn't really matter for the guys.
**Carlos | matchicalcom** [01:58 - 02:07]: So currently you have what we call a circular reference, so you have consulting referencing consulting core and consulting core referencing.
**Carlos | matchicalcom** [02:07 - 02:09]: I think it's one or two actions.
**Konsti | matchicalcom** [02:09 - 02:11]: From consulting the role, right?
**Carlos | matchicalcom** [02:12 - 02:15]: Yes, to create a new role or something like that.
**Carlos | matchicalcom** [02:15 - 02:19]: Okay, this should be refactor for it's not a big performance.
**Carlos | matchicalcom** [02:19 - 02:34]: It's more a problem when you deploy the two things just have to deploy each other and it just always better to have the one consumer and one producer and not there doing things I know.
**Konsti | matchicalcom** [02:35 - 02:45]: But the only reason I did it because it was stated in the art system stocks like best raised clone rolls and when you.
**Konsti | matchicalcom** [02:45 - 02:56]: Clone the roles you need to kind of have a service action from the one, from the from the from the consulting app to the core app to like assign.
**Carlos | matchicalcom** [02:56 - 03:15]: The role also, okay, okay, I didn't went through to the detail to understand what's there why it was like that we can brainstorm a little bit maybe even if you want just to decouple it build a service section would be better than a server action or even a rest service.
**Carlos | matchicalcom** [03:15 - 03:17]: So you can communicate between both.
**Konsti | matchicalcom** [03:17 - 03:23]: We could also do right now is like now we have the user API directly available within.
**Konsti | matchicalcom** [03:23 - 03:29]: Our system, We can just use the ODC user API then we do.
**Carlos | matchicalcom** [03:29 - 03:42]: Not need to use the once again I didn't went through the code just deeply because just didn't have the time, but I found that reference and this is one of the things that we always check because it's good to have a sound architecture.
**Konsti | matchicalcom** [03:43 - 03:45]: Did you use this code quality analysis?
**Carlos | matchicalcom** [03:45 - 03:50]: No, just open the module and start looking to strange patterns.
**Carlos | matchicalcom** [03:50 - 03:58]: For example you have screens and some references like the outsystem chart.
**Carlos | matchicalcom** [03:59 - 04:11]: Yeah, oh you're listening so outsystem charts and maps and all that on the core layer never is used so those things should be deleted, but they can by default.
**Carlos | matchicalcom** [04:13 - 04:18]: But okay, it's not a big deal once again it's just as low dependencies as possible.
**Carlos | matchicalcom** [04:18 - 04:21]: And as less code possible.
**Carlos | matchicalcom** [04:21 - 04:32]: Okay, that was one of the things the other one talking about the skills the current version that you have and I think I have an idea to help on the duplicate problem.
**Konsti | matchicalcom** [04:34 - 04:34]: OK.
**Carlos | matchicalcom** [04:36 - 04:47]: My experience you should create the canonical name, it has an index, but you should make it unique and let me know if there is any problem with that.
**Carlos | matchicalcom** [04:47 - 05:06]: If you make it unique on the database, every time that you try to introduce a duplicate, the system will throw an exception that needs to be handled because once the exception is handled inside the server action, you need to go to the database and instead of creating a new one retrieving the existing ID back.
**Carlos | matchicalcom** [05:07 - 05:22]: Yeah, that's quite easy that would be keeping the system running as is will solve you the issue of the merging and multiple skills with the same name and then having to de loop them and clean.
**Carlos | matchicalcom** [05:22 - 05:23]: It up afterwards.
**Konsti | matchicalcom** [05:25 - 05:42]: The dedupe is also like there's the second reason why this dedupe is basically happening because like imagine you provide a typo and then I do not know what makes us.
**Carlos | matchicalcom** [05:44 - 05:47]: You can leave the duping process running.
**Carlos | matchicalcom** [05:48 - 05:59]: I think it will create much less cases, maybe some corner cases, but not those regular when you have two CVs running at the same time, that find the same skill, because that would be protected on a database.
**Konsti | matchicalcom** [06:00 - 06:02]: But in this case we could not.
**Carlos | matchicalcom** [06:02 - 06:02]: Do.
**Konsti | matchicalcom** [06:04 - 06:17]: We even don't do a buy create either way like you know, like bulk creating skills and then there's like but we do not do it by create so we could do it you know.
**Carlos | matchicalcom** [06:20 - 06:24]: Bulk, No, I think you from what I understood you do it every time that you process a CV.
**Konsti | matchicalcom** [06:24 - 06:29]: Yes, so it's always engagement We could use this still one hundred percent.
**Konsti | matchicalcom** [06:30 - 06:30]: True.
**Niklas | matchicalcom** [06:35 - 06:35]: True.
**Carlos | matchicalcom** [06:37 - 06:40]: That's why you need someone to talk about sometimes, right?
**Carlos | matchicalcom** [06:40 - 06:44]: It's just, it's just brainstorming a lot of times.
**Carlos | matchicalcom** [06:44 - 06:54]: We are just in the weeds and we just keep going just don't really rethink on the cleanup the third topic on those cleanup process that you.
**Carlos | matchicalcom** [06:54 - 06:56]: That you have and there are a lot running every fifteen minutes.
**Carlos | matchicalcom** [06:57 - 07:01]: I think we should revisit that to try to use advanced queries whenever possible.
**Konsti | matchicalcom** [07:02 - 07:06]: And also instead of not prevent errors.
**Carlos | matchicalcom** [07:06 - 07:12]: Instead of fixing them trying to see where are the gaps if possible.
**Carlos | matchicalcom** [07:12 - 07:24]: And sometimes you cannot find everything or just takes too much time and try not to prevent them for happening, instead of just keeping fixing them, but the other two are very easy to solve.
**Carlos | matchicalcom** [07:24 - 07:29]: I think so just a few minutes and we can get it fixed this last one.
**Carlos | matchicalcom** [07:29 - 07:34]: I think it needs to be don't feel comfortable starting changing code of course, but you probably know the code.
**Carlos | matchicalcom** [07:34 - 07:36]: You know that some quick gains.
**Carlos | matchicalcom** [07:36 - 07:40]: There was a timer that it was taking one of them like ten fifteen twenty seconds.
**Carlos | matchicalcom** [07:40 - 07:47]: And that's a lot on a running application in multi-tenant scenario with a lot of people accessing running every fifteen minutes.
**Carlos | matchicalcom** [07:47 - 07:53]: That is probably one of the things that can cause that overhead on compute or database utilization and all that.
**Carlos | matchicalcom** [07:54 - 08:05]: But I'm sure that when I go to the code analysis and try to watch to the most used queries in that there is probably a lot of things that we can improve or see.
**Carlos | matchicalcom** [08:06 - 08:16]: But the rest of the time that I focus on the skills and just thinking about this don't have a lot to show or nothing to show at this point.
**Konsti | matchicalcom** [08:18 - 08:31]: Based on based on what you roughly looked at, like and also what you were seeing yesterday like based on also when talking with you revisiting a lot of things that I know.
**Konsti | matchicalcom** [08:31 - 08:32]: Oh shit, there are my dead bodies.
**Konsti | matchicalcom** [08:32 - 08:43]: I realized, okay, there are definitely some good thing is like we are currently not in that state where we have the degradated performance, but it will come and it's already kind of happening already.
**Konsti | matchicalcom** [08:44 - 08:48]: So my idea is even like and this is definitely that we can do.
**Konsti | matchicalcom** [08:48 - 08:58]: We need probably like slow a little bit down with like pushing any new features going a little bit sideways stabilizing the app, but in India.
**Konsti | matchicalcom** [08:58 - 09:01]: But at least it's my take.
**Konsti | matchicalcom** [09:01 - 09:06]: I probably agree with this it's not like, oh, we should probably rewrite most of that things.
**Konsti | matchicalcom** [09:06 - 09:07]: It's more like.
**Carlos | matchicalcom** [09:07 - 09:09]: Oh no, it's running, it's running.
**Carlos | matchicalcom** [09:09 - 09:14]: I think you guys just took the events a little bit too much.
**Carlos | matchicalcom** [09:14 - 09:18]: Everything is running in events, because everything is parallel.
**Carlos | matchicalcom** [09:18 - 09:19]: That is fantastic.
**Carlos | matchicalcom** [09:19 - 09:27]: But you lose control and I think there is equilibrium there that needs to be just taken a little bit more under control, so a little bit more sequential.
**Carlos | matchicalcom** [09:27 - 09:28]: I think it will help performance.
**Carlos | matchicalcom** [09:29 - 09:30]: Or at least it's more controllable.
**Carlos | matchicalcom** [09:30 - 09:44]: So when you have started problems, you can understand, for example you did those three hundred that you see, that was like a big bulk, so you probably can have like a Q table and do those at night or doing off hours.
**Carlos | matchicalcom** [09:44 - 09:50]: There was some mechanical mechanism that you can do, so they don't impact users.
**Carlos | matchicalcom** [09:50 - 09:52]: That's always a big problem.
**Carlos | matchicalcom** [09:54 - 09:56]: But I think we can go there.
**Carlos | matchicalcom** [09:57 - 10:06]: I can do a performance analysis more focused on the code and like the code analysis and the monitoring where we can see the queries that are used.
**Konsti | matchicalcom** [10:06 - 10:15]: The most we know, where are the biggest bottlenecks Probably makes more sense to approach these first and then do the performance analysis, right?
**Carlos | matchicalcom** [10:15 - 10:15]: Sure.
**Carlos | matchicalcom** [10:17 - 10:19]: Or do you agree there, if you want, yeah, yeah, sure, sorry.
**Carlos | matchicalcom** [10:19 - 10:25]: If you know, I think the best indicator of application performance is the users.
**Konsti | matchicalcom** [10:26 - 10:27]: Yes, right.
**Carlos | matchicalcom** [10:27 - 10:32]: You use the application, you know, where are the problems or the most common problems?
**Carlos | matchicalcom** [10:32 - 10:40]: At least, because those are what we know sometimes there are things that we don't know that are dangerous, but those ones are what you know.
**Carlos | matchicalcom** [10:40 - 10:47]: So let's try to go there and maybe try to fix it sometimes small adjustment on the data model some sometimes.
**Carlos | matchicalcom** [10:47 - 11:01]: Like building an index or there's few small things that a lot of times you can do just to help or rewrite a query in advanced SQL to prevent iterations and access server usage.
**Carlos | matchicalcom** [11:01 - 11:03]: So there are a few things that you can do.
**Konsti | matchicalcom** [11:08 - 11:39]: You know maybe one thing you probably already realized when I started developing this and it's my first application that did grow that big before I did more develop like minor things and it's like I always had the assumption like we are in the twenty first century, in twenty twenty or so, like AI is blowing up and computers getting crazy, so you can really do YOLO on whatever you do not have to worry on performance.
**Konsti | matchicalcom** [11:39 - 11:44]: And after half year I really badly realized.
**Konsti | matchicalcom** [11:44 - 11:46]: Oh, this was a complete wrong assumption.
**Carlos | matchicalcom** [11:47 - 11:51]: Yeah, Not to worry about performance is something that you can just not afford.
**Carlos | matchicalcom** [11:51 - 11:58]: You have to worry about unless you are building a toy app for few ten users.
**Carlos | matchicalcom** [11:58 - 12:19]: In that case don't really worry too much, but recurrent things that are by definition just always running or almost always running, like the timer that you put to sleep and just awake those kind of things there needs to be a very, very good reason, very well explained why those things need to be running.
**Carlos | matchicalcom** [12:20 - 12:32]: Those are dangerous because that can just grab the processor for itself and just you lose the application pretty much because the system is just doing those back end things.
**Carlos | matchicalcom** [12:33 - 12:39]: So need to be careful, not saying that's a bad solution, because sometimes we need to do it, but you need to be very very careful.
**Carlos | matchicalcom** [12:39 - 12:41]: I see this practical.
**Konsti | matchicalcom** [12:42 - 12:54]: In one of these sessions, in one conference, like they are doing sometimes sessions on these conferences, where I think like, based on my knowledge, I think this is not a best practice what you are doing there.
**Carlos | matchicalcom** [12:56 - 13:04]: I will explain, I've used something like that, for example to monitor email box for example like.
**Carlos | matchicalcom** [13:04 - 13:09]: Every minute, every second, because it was almost a real-time system you are checking.
**Carlos | matchicalcom** [13:09 - 13:11]: To see if new emails have come in.
**Carlos | matchicalcom** [13:12 - 13:14]: This is very very specific.
**Carlos | matchicalcom** [13:14 - 13:24]: And in that case, since we didn't really have webhook or something from the other side that we could attach to, we really have to be running like that.
**Carlos | matchicalcom** [13:24 - 13:30]: But that's the corner case normally we avoid, we run away.
**Carlos | matchicalcom** [13:30 - 13:36]: There is one reason why timers can only be scheduled within fifteen minutes intervals.
**Carlos | matchicalcom** [13:36 - 13:50]: You can go to five minutes, you cannot put it like every minute it's possible, it's possible, you can edit database, you can make it run faster, but it just completely ruins your performance.
**Carlos | matchicalcom** [13:50 - 14:00]: So we would do those things when we have in a farm situation where we have multiple servers, you might have one just to run timers, for example.
**Carlos | matchicalcom** [14:03 - 14:10]: That way doesn't really affect too much the performance of the other systems, but not all this.
**Carlos | matchicalcom** [14:10 - 14:15]: You only see everything running in the same place and you have those limit set of resources.
**Carlos | matchicalcom** [14:15 - 14:17]: You need to be very careful with those.
**Carlos | matchicalcom** [14:17 - 14:18]: Make sure that we don't pass.
**Konsti | matchicalcom** [14:21 - 14:24]: All right, OK, cool.
**Carlos | matchicalcom** [14:27 - 15:01]: I think we probably will shift to this performance part, but since I've been searching the skills and that problem, I really think I'm not a graph specialist, but I think we should give it like a proof of concept of our pilot to relate skills with each other, to relate skills with main skills or those kinds of dependencies and even the roles we could put it in the same database, same structure, so the roles can start tracking, which roles need specific skills, right?
**Carlos | matchicalcom** [15:01 - 15:06]: That's the kind of circulation that in the near future we will be able to make.
**Konsti | matchicalcom** [15:07 - 15:09]: Yeah, we already talked about, right?
**Carlos | matchicalcom** [15:10 - 15:13]: And from what I've seen, it's different.
**Carlos | matchicalcom** [15:13 - 15:16]: It's not a relational database, but it's not too crazy.
**Carlos | matchicalcom** [15:16 - 15:19]: It's like Jason in It's called cipher.
**Carlos | matchicalcom** [15:19 - 15:24]: It's a language that at least from the Neo for Jake that I found.
**Konsti | matchicalcom** [15:24 - 15:31]: The engine, give me one second, because my little brother actually is much more familiar.
**Carlos | matchicalcom** [15:31 - 15:33]: What he said expert.
**Konsti | matchicalcom** [15:34 - 15:38]: Yeah, and maybe he can just join us on this one.
**Niklas | matchicalcom** [15:40 - 15:40]: Let me.
**Konsti | matchicalcom** [15:55 - 15:56]: Jodon, was machst du gerade?
**Niklas | matchicalcom** [15:57 - 15:58]: Moin moin, ich bin gerade am helfen.
**Carlos | matchicalcom** [15:58 - 15:58]: Warum?
**Konsti | matchicalcom** [15:59 - 16:00]: Ich bin gerade mit Carlos im Call.
**Konsti | matchicalcom** [16:00 - 16:02]: Er hat jetzt mal ein bisschen Analysen gemacht und so weiter und so fort.
**Konsti | matchicalcom** [16:02 - 16:07]: Und wir wollten jetzt eine Ideation Session machen bezüglich Skill und Co.
**Konsti | matchicalcom** [16:07 - 16:11]: Und er sagt jetzt schon, er hat jetzt ein bisschen Gedanken gemacht.
**Konsti | matchicalcom** [16:11 - 16:13]: Es geht ganz klar Richtung Graph aus verschiedenen Gründen.
**Konsti | matchicalcom** [16:13 - 16:27]: Und da habe ich gedacht, bevor wir jetzt hier weiter einsteigen, macht es wahrscheinlich mega Sinn, wenn du auch joinstädte, weil du kennst dich am besten aus, deswegen, du kannst ja während dem Essen joinen, nur dass du es schon mal mithörst.
**Konsti | matchicalcom** [16:27 - 16:28]: Also wenn es für dich passt.
**Carlos | matchicalcom** [16:31 - 16:31]: Macht.
**Niklas | matchicalcom** [16:31 - 16:32]: Ihr das jetzt oder können wir es.
**Konsti | matchicalcom** [16:32 - 16:33]: In fünf Minuten machen?
**Konsti | matchicalcom** [16:33 - 16:35]: Du kannst auch in fünf Minuten dazukommen, kein Stress.
**Konsti | matchicalcom** [16:38 - 16:39]: Ich schicke dir einen Invite.
**Konsti | matchicalcom** [16:40 - 16:41]: Top.
**Konsti | matchicalcom** [16:42 - 16:42]: Cheers.
**Konsti | matchicalcom** [16:43 - 16:45]: Okay, Chico is going to join in five minutes.
**Konsti | matchicalcom** [16:45 - 16:49]: No worries, but yeah, so like, but please, please.
**Konsti | matchicalcom** [16:51 - 16:57]: Unfortunately, I wanted to do, also some more ideation by myself, but I did not manage to do so this morning.
**Konsti | matchicalcom** [16:57 - 17:01]: But I was also like in terms of performance and so on.
**Konsti | matchicalcom** [17:03 - 17:10]: I think it's definitely the way to go based on my knowledge, but my knowledge about this is also pretty limited.
**Carlos | matchicalcom** [17:10 - 17:15]: Honestly speaking, I've searched so on non religious databases.
**Carlos | matchicalcom** [17:15 - 17:21]: I've worked with elasticsearch a little bit that came from Java.
**Carlos | matchicalcom** [17:22 - 17:24]: It's also this JSON databases.
**Carlos | matchicalcom** [17:24 - 17:28]: I've worked with vectors a little bit, but not usually.
**Carlos | matchicalcom** [17:28 - 17:33]: But from what I've reading, I was trying to play around with it a little bit.
**Carlos | matchicalcom** [17:33 - 17:45]: These databases were meant to solve these kind of problems of relations that are not too straightforward and that can even go very levels deep.
**Carlos | matchicalcom** [17:46 - 17:53]: So this is kind of thing that would be easier to extrapolate and query in this kind of databases.
**Carlos | matchicalcom** [17:54 - 18:00]: Since we are going to generate the data based on LLM information, we just have to adjust the way that we are.
**Carlos | matchicalcom** [18:00 - 18:15]: I would do it manually First just grab one hundred records, one thousand records and manually put it in the database, write some scripts, so you know the way that we want to query the database, We'll try to answer some of those questions and then do some performance testing.
**Carlos | matchicalcom** [18:15 - 18:23]: So let's put two hundred thousand record there and see how these things can handle it.
**Konsti | matchicalcom** [18:25 - 18:26]: When we have this.
**Konsti | matchicalcom** [18:27 - 18:33]: When you think about how we do our meshing, right?
**Konsti | matchicalcom** [18:36 - 18:45]: Do you still think like, okay, in the graph database there are the skills, but the experiences we still fully calculate the way how we currently do it.
**Carlos | matchicalcom** [18:45 - 18:56]: With analysis I would probably have a copy of the they call it nodes, would be the skills you still have a database table named skills with.
**Carlos | matchicalcom** [18:56 - 19:13]: An ID and at least where I'm at right now you probably need that on your side or because of latency and just to make sure that you can do joins, because the big problem would be, if we need to join tables, It's the fastest way to do it is to have a local database.
**Carlos | matchicalcom** [19:15 - 19:17]: I'm not sure I'm divided on that.
**Carlos | matchicalcom** [19:17 - 19:25]: For example if translations and all that part, we keep it in SQL or we would move it to this kind of secondary database.
**Carlos | matchicalcom** [19:25 - 19:28]: I don't know at this point Do.
**Konsti | matchicalcom** [19:28 - 19:33]: You know in our systems there's this data fabric thing where you can bring in different database and structures.
**Konsti | matchicalcom** [19:33 - 19:34]: Do you think this?
**Carlos | matchicalcom** [19:36 - 19:37]: To be honest?
**Carlos | matchicalcom** [19:37 - 19:43]: I never use it because it's a new thing, but I saw some videos and we can try it to see how this work.
**Carlos | matchicalcom** [19:44 - 19:51]: But from what I've seen, I don't know how they implemented it to be honest behind the scenes I need to research it.
**Carlos | matchicalcom** [19:55 - 19:58]: But that's for existing databases from what.
**Konsti | matchicalcom** [19:58 - 20:07]: I know like one thing, because also when we think about skills, we also need to think about how we use skills, obviously, right?
**Konsti | matchicalcom** [20:07 - 20:18]: And in the thing as I already mentioned, like I can show you for example you did see like the demo tenant, right, but like also your admin.
**Konsti | matchicalcom** [20:18 - 20:26]: So you can always go to consultancies and click here like I can show you once how we did quite easy trick how we can simulate different tenants.
**Konsti | matchicalcom** [20:28 - 20:57]: But long story short, when I go in here and they have like three thousand candidates, they have three thousand consultants in their databases tenant and so this query takes like twelve seconds or twenty seconds or so, as I mentioned and I already optimized it before it did take like one hundred seconds or so.
**Konsti | matchicalcom** [20:58 - 21:00]: But even now with three thousand records I'm.
**Konsti | matchicalcom** [21:00 - 21:05]: Just fetching the first or just counting until two hundred forty, but with three thousand records it still takes some time.
**Konsti | matchicalcom** [21:05 - 21:12]: So when we have ten thousand one hundred thousand or like Let's say thirty thousand records wouldn't work.
**Carlos | matchicalcom** [21:14 - 21:20]: I'm not sure if you are calculating that match against this opportunity on the fly or if you are storing it.
**Konsti | matchicalcom** [21:20 - 21:28]: On the database, but calculated in the database the score, okay, everything it starts.
**Carlos | matchicalcom** [21:28 - 21:31]: You start the, like the matchup score ninety six.
**Konsti | matchicalcom** [21:32 - 21:36]: It's not start, it's always calculated on the fly.
**Carlos | matchicalcom** [21:36 - 21:46]: Okay, That's the only way that you can get to three thousand, five thousand wouldn't be runtime.
**Carlos | matchicalcom** [21:46 - 21:58]: You have on that complex algorithm that you have, because it has a lot of conditions, the only way that you could put it, you would have to make sure that I could convert that to advanced query to a query directly.
**Carlos | matchicalcom** [21:59 - 22:01]: Not sure if it's easy, because I saw a lot of business rules.
**Carlos | matchicalcom** [22:02 - 22:05]: Maybe it's a little bit too complex, because the other option would be to.
**Konsti | matchicalcom** [22:06 - 22:08]: This matching is already a complete query.
**Konsti | matchicalcom** [22:08 - 22:09]: It's just a query.
**Konsti | matchicalcom** [22:10 - 22:12]: It's just, it's just a query.
**Konsti | matchicalcom** [22:14 - 22:15]: This I can show you here.
**Carlos | matchicalcom** [22:15 - 22:18]: That's basically the that big one that you went.
**Carlos | matchicalcom** [22:18 - 22:21]: To from UK, but there are a lot of conditions.
**Carlos | matchicalcom** [22:22 - 22:27]: Then you don't do anything else nothing to the score, okay?
**Konsti | matchicalcom** [22:27 - 22:38]: It's just the result of that query and I deeply analyze it like Hey guys, hi Chico, hi, how you doing?
**Konsti | matchicalcom** [22:40 - 22:48]: Good, great, great, We're already right in like, but yeah, I'm just bringing this up because we already realized just with that query.
**Konsti | matchicalcom** [22:48 - 23:04]: Like we cannot calculate these results beforehand and store them because you need to consider whenever a consultant experience updated a new consultant or something, it will change the results or when you change so we need kind of to calculate this.
**Carlos | matchicalcom** [23:08 - 23:22]: You can, but I think I would disagree there I think you can calculate the score if something changes on the consultant, you need to recalculate that specific one for all the opportunities or for some of the opportunities for the last.
**Konsti | matchicalcom** [23:22 - 23:28]: Yeah, actually for all like for the last fifty like that's also crazy.
**Konsti | matchicalcom** [23:28 - 23:28]: Like.
**Carlos | matchicalcom** [23:30 - 23:35]: You will get one day problems that I.
**Carlos | matchicalcom** [23:35 - 23:37]: Think while this query works, I think it's perfect.
**Carlos | matchicalcom** [23:37 - 23:38]: Just let it run, right?
**Carlos | matchicalcom** [23:38 - 23:41]: But you'll get one day if the company.
**Carlos | matchicalcom** [23:41 - 23:53]: Has ten thousand consultants, unless you can slice them somehow, so you don't have to go to all of them, because if you need to go all of them, this query will take maybe minutes.
**Konsti | matchicalcom** [23:53 - 23:55]: Yeah, yeah, yeah, that's the issue.
**Konsti | matchicalcom** [23:57 - 23:59]: That's the issue where I'm also thinking.
**Konsti | matchicalcom** [23:59 - 24:20]: Like when we think about like the question is like when we, when we move the skills and the roles into a graph like does it maybe also make sense to move the experience calculation into a graph, because there we could do the calculation faster.
**Konsti | matchicalcom** [24:20 - 24:21]: I don't know.
**Konsti | matchicalcom** [24:21 - 24:30]: But this is so heavily related those this matching thing with a lot of business logic, that like I'm I'm quite of uncertain if this really makes sense.
**Konsti | matchicalcom** [24:30 - 24:31]: You know.
**Carlos | matchicalcom** [24:33 - 24:36]: My first reaction would probably say no that.
**Carlos | matchicalcom** [24:36 - 24:38]: So you would keep on the Graph side.
**Carlos | matchicalcom** [24:38 - 24:39]: The Skills.
**Carlos | matchicalcom** [24:39 - 24:42]: And the relations between the skills and some attributes like that.
**Carlos | matchicalcom** [24:42 - 24:46]: But all the rest you want to keep it in the relation database to be able to cross reference with the rest.
**Carlos | matchicalcom** [24:46 - 24:47]: Of the table.
**Carlos | matchicalcom** [24:47 - 24:52]: Yes, but I'm far from being a graph guy.
**Carlos | matchicalcom** [24:52 - 24:54]: So that's why we have Chico here.
**Niklas | matchicalcom** [24:54 - 24:56]: Yeah, exactly I just wanted to ask.
**Niklas | matchicalcom** [24:56 - 24:58]: Can you please quickly update me?
**Niklas | matchicalcom** [24:58 - 25:00]: Like what were your general thoughts?
**Niklas | matchicalcom** [25:00 - 25:02]: Just to quickly catch up.
**Carlos | matchicalcom** [25:07 - 25:10]: Go ahead it's same thing.
**Carlos | matchicalcom** [25:10 - 25:16]: So we were talking about the skill part and how the performance on the skill tables or skill alliances.
**Carlos | matchicalcom** [25:17 - 25:21]: It's around one hundred thousand records a little bit and we started having performance issues.
**Carlos | matchicalcom** [25:21 - 25:23]: I think you are aware of it.
**Carlos | matchicalcom** [25:23 - 25:37]: So trying to solve it or trying to have a different approach, improving the relation part of the skills, the way that they relate with each other and even the roles related skills.
**Carlos | matchicalcom** [25:38 - 25:49]: I was suggesting doing a proof of concept using a graph to solve this part just to solve the part of the skills and the relations between roles and skills and skills and skill alliances.
**Niklas | matchicalcom** [25:49 - 25:51]: All that, so all that.
**Niklas | matchicalcom** [25:51 - 25:59]: Okay, to put everything in a graph and then how would it look like if everything is in a graph, the.
**Carlos | matchicalcom** [25:59 - 26:01]: Skills and we would have.
**Carlos | matchicalcom** [26:01 - 26:03]: And that's why I think we were brainstorming about these.
**Carlos | matchicalcom** [26:04 - 26:08]: I think the skills itself you have to have a copy of it on a relation database.
**Carlos | matchicalcom** [26:08 - 26:15]: So once you want to cross reference join other tables, you cannot do that directly on the the graph.
**Carlos | matchicalcom** [26:15 - 26:32]: I think the ability on the graph would be just the advantages to find connections are to faster connect the different skill sets and those like there is the main skill, then are ten different skills that are alliances and sometimes front-end development connects with react.
**Carlos | matchicalcom** [26:32 - 26:33]: And connects with other things.
**Carlos | matchicalcom** [26:33 - 26:42]: So this kind of more broad relations would be something that we will be able to define in an easier way on that kind of technology.
**Carlos | matchicalcom** [26:45 - 26:47]: Not to calculate scars, calculate scores.
**Carlos | matchicalcom** [26:47 - 26:48]: That's a SQL problem.
**Carlos | matchicalcom** [26:48 - 26:57]: I think we can think how to start the result, at least in some kind of cold cache or something or.
**Carlos | matchicalcom** [26:57 - 27:01]: Directly on the database for that specific opportunity or we can run it on the fly.
**Carlos | matchicalcom** [27:02 - 27:06]: I think on the fly is always a good option, but the problem is performance.
**Carlos | matchicalcom** [27:06 - 27:10]: You are capping it at two hundred forty, because you cannot run already the three thousand.
**Konsti | matchicalcom** [27:13 - 27:13]: Yeah.
**Konsti | matchicalcom** [27:13 - 27:28]: But actually like even this two hundred and forty cap does not help at all ChatGPT told me because it's like I'm just tapping the total count at three thousand, but anyway to get the first ten, one, two hundred doesn't matter.
**Konsti | matchicalcom** [27:28 - 27:33]: You always need to calculate through all of them that you can then do the sort by matching.
**Carlos | matchicalcom** [27:33 - 27:36]: Okay, If you have order, if you have a sort, yes, you need to calculate everything.
**Carlos | matchicalcom** [27:36 - 27:39]: Yes, you are, you have a sort.
**Konsti | matchicalcom** [27:39 - 27:47]: Of because like we sort by matching score, that's actually the biggest issue that we are having.
**Konsti | matchicalcom** [27:48 - 27:52]: And what ChatGPT kind of recommended is like before.
**Konsti | matchicalcom** [27:53 - 27:57]: Don't do too fancy calculations just do like checks like which.
**Konsti | matchicalcom** [27:57 - 28:06]: Consultants check the most boxes like Doesn't matter how much they check it like which consultants check the most and then you put this in a temporary kind of worker table or so.
**Konsti | matchicalcom** [28:06 - 28:09]: And then you do the fancy calculation on your pre selection.
**Carlos | matchicalcom** [28:11 - 28:20]: If there are some criteria that you can slice the date or just throw out a few hundred, that would be always the first thing to do.
**Carlos | matchicalcom** [28:21 - 28:26]: For example there is a location requirement or there is a specific skill that it's mandatory.
**Carlos | matchicalcom** [28:27 - 28:40]: So you don't want even to propose anyone that does not have that skill or that is from another country, for example, so that kind of segmentation could be done automatically, but you know the business better.
**Carlos | matchicalcom** [28:40 - 28:44]: So I don't know if there is something like that that you can do in the query upfront to avoid.
**Carlos | matchicalcom** [28:44 - 28:46]: To calculate the whole list.
**Konsti | matchicalcom** [28:47 - 28:48]: Okay?
**Konsti | matchicalcom** [28:48 - 28:49]: But anyway, different topic.
**Konsti | matchicalcom** [28:49 - 28:52]: We know that this is an SQL thing and not a graph thing.
**Konsti | matchicalcom** [28:52 - 29:04]: So we can think about I was just bringing this up to kind of check if, if, what we are thinking about skills and roles and we put into graph, if it's in any way related to how we do the meshing.
**Niklas | matchicalcom** [29:07 - 29:13]: It also is heavily right because we need to calculate it so the skills with the roles.
**Niklas | matchicalcom** [29:13 - 29:18]: And if you have role alias, we need to then look up the role alias which skill it is.
**Konsti | matchicalcom** [29:19 - 29:21]: No, no in the matching.
**Konsti | matchicalcom** [29:21 - 29:23]: We don't care about aliases.
**Konsti | matchicalcom** [29:23 - 29:23]: That's the very good thing.
**Konsti | matchicalcom** [29:23 - 29:55]: Just maybe to clarify also for you, Carlos, the calculation of experiences is solely based on the skills you're having so mainly meaning that like let me share my screen for a second, like We have here on the very left, on the very right this table, the skill alias, this one is huge right or so, but the total amount of skills is, it's much smaller.
**Konsti | matchicalcom** [29:55 - 29:59]: I think currently it's like ten thousand or twelve thousand or maybe twenty thousand or so.
**Konsti | matchicalcom** [29:59 - 30:15]: And that's obvious kind of, yeah, because there are so many terminologies for certain skills, but really concrete skills there are a lot, but not as many as there are fancy words or the other things or synonyms that are like, yeah, it's something slightly different.
**Konsti | matchicalcom** [30:15 - 30:24]: But the main skill, like what we consider as a main skill is really, that is something where, what is our definition of a main skill?
**Konsti | matchicalcom** [30:24 - 30:25]: We had some principles around it.
**Konsti | matchicalcom** [30:25 - 30:33]: It's basically a skill to justify being a full skill.
**Konsti | matchicalcom** [30:33 - 30:45]: It needs to be deep enough, a deep enough kind of skill that it makes sense something like that you pick up on the fly when you work with react, you pick up react hooks.
**Konsti | matchicalcom** [30:45 - 30:49]: So react hook is not a skill by itself, it's just an alias something like that.
**Konsti | matchicalcom** [30:50 - 30:53]: That's at least the idea of our principles.
**Konsti | matchicalcom** [30:53 - 30:55]: What is a skill alias versus what is a skill?
**Konsti | matchicalcom** [30:55 - 30:59]: So the total of mind amount of skills is much much smaller.
**Konsti | matchicalcom** [30:59 - 31:18]: And when we do the experience calculation, we only calculate like, okay, give me all skill aliases and I just sum up the total duration cleaned up duration of the engagements where you applied like the different skill aliases that all belong.
**Konsti | matchicalcom** [31:18 - 31:19]: To the same skill.
**Konsti | matchicalcom** [31:20 - 31:23]: So the Experience is already cleaned up and only.
**Konsti | matchicalcom** [31:23 - 31:28]: Looking on skills and roles, that's an important distinction here.
**Konsti | matchicalcom** [31:28 - 31:44]: And like a typical consultant with like let's say twenty years of experience let's do here maybe her, I think this one is crazy.
**Konsti | matchicalcom** [31:45 - 31:57]: She typically has like how many skills in total well, let's take Tony when was the last time we parsed Tony maybe on another tenant.
**Konsti | matchicalcom** [32:01 - 32:04]: Like Tony for example has what does he have?
**Konsti | matchicalcom** [32:04 - 32:20]: You see forty three, sixty six, one hundred, two hundred, Let's say like two hundred and fifty skills a consultant can have, but probably will be more in the future.
**Konsti | matchicalcom** [32:20 - 32:30]: But like a consultant won't have more, much more than like, let's say five hundred skills or so, so five hundred experiences per consultant.
**Konsti | matchicalcom** [32:30 - 32:44]: But that's even like the issue when you have ten thousand consultants, those ten thousand consultants have like five million experiences in your experience table, that you need to query through.
**Niklas | matchicalcom** [32:50 - 32:51]: But.
**Konsti | matchicalcom** [32:54 - 32:57]: Different but different topic, when we think about graph, Different.
**Niklas | matchicalcom** [32:57 - 33:01]: Topic, but closely related right, Closely related.
**Konsti | matchicalcom** [33:01 - 33:04]: Right, That's the thing one hundred percent.
**Niklas | matchicalcom** [33:09 - 33:25]: No, but I definitely see also the general advantages like, as I was saying just Carlos, so you also know like I had courses on graphs and stuff, but I wouldn't say like I'm the go to guy here, because I never used it much in the real practice.
**Niklas | matchicalcom** [33:25 - 33:30]: So definitely I guess you guys can get up to speed in quite a few times.
**Niklas | matchicalcom** [33:31 - 33:52]: And as I was saying I'm not the biggest expert, but just from a general point of view, of course, it makes sense to go from, because roles and skills, the way they are connected to go away from this relational connection and really having like everything in a graph and having like hey, here's the roles, here are the kind of skills, which are both independent, I guess right?
**Niklas | matchicalcom** [33:53 - 33:58]: Because then just in our experience we calculated both together, right?
**Niklas | matchicalcom** [33:58 - 33:59]: Actually.
**Konsti | matchicalcom** [34:01 - 34:06]: Like Carlos idea was having roads and skills in the same graph, because.
**Niklas | matchicalcom** [34:06 - 34:09]: Yes, but they're kind of independent, aren't they different roads?
**Carlos | matchicalcom** [34:10 - 34:20]: But I think the roles, the roles at least when you have an opportunity, the roles will have a set of skills that will be required exactly.
**Konsti | matchicalcom** [34:21 - 34:26]: For example, the roles are more in our client opportunities demands.
**Konsti | matchicalcom** [34:27 - 34:34]: Roles are a hard filter, You know, you need to have not just a skill, you need to have the skill in the role that the client is looking for.
**Konsti | matchicalcom** [34:34 - 34:35]: They are like a hard filter.
**Konsti | matchicalcom** [34:35 - 34:41]: When you have all the skills, but you have them applied in a different role, you're no match basically.
**Niklas | matchicalcom** [34:41 - 34:58]: Like for example you're a project manager and you say I did Java, We know, okay, you didn't develop Java, you manage Java, so that's why Then I guess roles and skills are kind of independent and each role could have in theory each skill of course later we could limit it.
**Niklas | matchicalcom** [34:58 - 35:06]: Saying like, hey, this doesn't make sense, but I guess we're far away from that point, far away for sure.
**Niklas | matchicalcom** [35:06 - 35:13]: And then your thought was Carlos to put everything in a graph database like neo four J for example, and then.
**Carlos | matchicalcom** [35:14 - 35:29]: Having there to externalize that part, that part of the connection between the skills and all those relations to I think to get to the real skill table, because the skill table that's where you're going to join, that would be still relational, right?
**Carlos | matchicalcom** [35:29 - 35:39]: It's just I think the skill allies and that comparison, because I think we're talking about trying to solve a slightly different problem than the matching itself, the matching itself.
**Carlos | matchicalcom** [35:39 - 35:42]: I think we would keep it on the skills relation database.
**Carlos | matchicalcom** [35:42 - 36:01]: We can improve this query, we can do it offline or off hours, can discuss that afterwards, I think, but the problem, I think the graph would help things like searching for a specific skill when you use it on the app, searching related skills to that specific one.
**Carlos | matchicalcom** [36:02 - 36:07]: All the connections, those kind of queries that would be the part that would be much, much quicker.
**Carlos | matchicalcom** [36:07 - 36:25]: Or when you find something in a CV and you want to match it, do I have it is a new one which skill it's related, Those kind of questions would be much easier to respond with a neo-four J or something like that with search text on a.
**Niklas | matchicalcom** [36:26 - 36:33]: Positive database and you take the load away from our systems database also yep.
**Carlos | matchicalcom** [36:33 - 36:50]: Yep and move that to a different one, so save us some time and it's quicker from what I've been reading and I would have to do proof of concept of course with a lot of data, but from what I've been reading and understanding it's one easy way to scale these kind of systems.
**Niklas | matchicalcom** [36:51 - 37:08]: Yes, yes, a whole different question obviously, but that is probably then, or that is for sure part two is more like, okay, how does then the general pipeline of quality management happens, so how does a new skill get like this whole pipeline afterwards?
**Niklas | matchicalcom** [37:08 - 37:12]: How does a new skill get assigned if it has a parent skill?
**Niklas | matchicalcom** [37:12 - 37:15]: Because that is also like not very good right now, but yeah, that's probably.
**Konsti | matchicalcom** [37:15 - 37:40]: Still the other question maybe like because I know there's you can build rack systems with with Neo Four J and graph databases and rec can smartly retrieve information from this graph database and my consideration was we could build an LLM driven workflow that is doing RAG basically on the graph database and always.
**Konsti | matchicalcom** [37:40 - 37:49]: Touching different parts and doing kind of QA and based on the results it's triggering different actions to either perform some updates or stuff like that.
**Konsti | matchicalcom** [37:49 - 37:53]: So like I know it sounds fancy, but something like that it should be.
**Carlos | matchicalcom** [37:53 - 38:09]: But some of these devices they also have vector searching and have call it like similarity search so you just you don't search just for text, you can search by similar things and you can define results.
**Konsti | matchicalcom** [38:09 - 38:12]: Super cool for the user actually the.
**Niklas | matchicalcom** [38:12 - 38:24]: Insight I get there because I did that in a course we had to build from the ground up we needed to like we got a completely weird, super huge data set and then we need it to as task.
**Niklas | matchicalcom** [38:24 - 38:29]: First of all implement how to obtain the data and get the most similar result.
**Niklas | matchicalcom** [38:29 - 38:44]: First of all using something like lexical similarity or jacquard similarities, so these fixed metrics who just don't have domain knowledge, but rather look at the differences of the characters and the words and blah blah blah.
**Niklas | matchicalcom** [38:44 - 38:52]: And then you have the LLM way right where you prompt it and the LLM can make reasoning out of it, because it's just understand it better.
**Niklas | matchicalcom** [38:52 - 39:04]: And what I really quickly realized there the LLM way was always better, so it's nice to have these metrics probably, but LLM always surpasses and that was also kind of the outcome there.
**Niklas | matchicalcom** [39:04 - 39:08]: Like LLM will surpass, But I mean with when we have graphs, we can still.
**Niklas | matchicalcom** [39:08 - 39:10]: Do that LLM thing and it just.
**Niklas | matchicalcom** [39:10 - 39:14]: Uses the data that is in a way better organized way.
**Carlos | matchicalcom** [39:14 - 39:18]: You can use the graph query just to get.
**Carlos | matchicalcom** [39:18 - 39:21]: One hundred records that are similar or two hundred or five hundred whatever you want.
**Carlos | matchicalcom** [39:22 - 39:25]: And send it to LLM to get it organized or to see if it's equal.
**Niklas | matchicalcom** [39:25 - 39:27]: I mean can do two hundred similar is.
**Niklas | matchicalcom** [39:27 - 39:31]: Again then with these hard metrics, right?
**Niklas | matchicalcom** [39:31 - 39:33]: With this hard lexical metric right?
**Carlos | matchicalcom** [39:33 - 39:33]: Right?
**Carlos | matchicalcom** [39:33 - 39:43]: But I think, if we want to grow in terms of scale, you need some kind of pre-filtering or else we'll have just a huge amount of data always to the LLM.
**Carlos | matchicalcom** [39:43 - 39:46]: Probably that's that's not scalable.
**Konsti | matchicalcom** [39:46 - 39:47]: Yeah.
**Konsti | matchicalcom** [39:47 - 40:08]: But actually yesterday you mentioned, when we are in the process of extracting and like I show the LLM the content and ask the LLM what skills are in here you brought up like don't bring any reference skills, just let the LLM always tell what skills are in there and we are looking afterwards like what matches do we have, if it's new or not.
**Carlos | matchicalcom** [40:08 - 40:22]: I think for empirical right just good feeling, but I think it would probably a better outcome because you still have one hundred thousand different skills, right?
**Carlos | matchicalcom** [40:22 - 40:31]: Just try to match the wording and just if that it will work in a better process, it's actually good even.
**Konsti | matchicalcom** [40:31 - 40:34]: If the LLM always decides that the skill name is a little.
**Konsti | matchicalcom** [40:34 - 40:46]: Bit different, we would add all these skills and just add them and then remap them and then we can do like the retrieval, see that we have this entry already and it's remapped to the right one and get the right one.
**Carlos | matchicalcom** [40:48 - 40:56]: That similarity can store it in the graph and you are just building alliances for the main skill, that's the important part.
**Carlos | matchicalcom** [40:56 - 40:58]: Just keep feeding that alliance table.
**Carlos | matchicalcom** [40:58 - 41:05]: It's an auxiliary table just not to repeat names, but you can just keep the problem there.
**Niklas | matchicalcom** [41:05 - 41:25]: If we go with that approach is just, but that is a small other thing now is that then with increasing data bit size, so the more skills we have, the load wouldn't get probably less because still we tell probably each time the LLM hey, just tell us which skills you either way, find and then.
**Niklas | matchicalcom** [41:25 - 41:33]: Maybe we always okay, probably we will get similar things, but you see the point I have, if we have For example a skill database of one hundred.
**Niklas | matchicalcom** [41:33 - 41:40]: Already to that name and we send it directly there the chances that it directly matches to these one hundred is way higher.
**Niklas | matchicalcom** [41:40 - 41:45]: We're then saying like hey, just say whatever it is for yourself and then it's a growing thing.
**Konsti | matchicalcom** [41:46 - 41:52]: If you write the prompts in the right way that like how like how you need what is his skill?
**Konsti | matchicalcom** [41:52 - 41:58]: Like what is not a skill like you know, then it will be very repetitive.
**Konsti | matchicalcom** [41:58 - 42:00]: I'm quite sure about that one we will.
**Carlos | matchicalcom** [42:00 - 42:02]: I'm assuming the CV's don't change that.
**Carlos | matchicalcom** [42:02 - 42:04]: Much at least.
**Carlos | matchicalcom** [42:04 - 42:07]: Let's say it right developers you see one hundred and it's pretty.
**Carlos | matchicalcom** [42:07 - 42:09]: Much all the I'm assuming.
**Carlos | matchicalcom** [42:09 - 42:14]: I don't know maybe some tools are different, but ninety percent should be the same.
**Konsti | matchicalcom** [42:14 - 42:19]: It's not one hundred, but it's way more, but yeah, they are sure, it's.
**Carlos | matchicalcom** [42:19 - 42:27]: The overall idea, yeah, I'm assuming that starts to get repetitive, but I think we just need the hands on experience and just try.
**Carlos | matchicalcom** [42:27 - 42:27]: It out.
**Konsti | matchicalcom** [42:29 - 42:33]: And we need metrics down the road like currently one issue that we also have.
**Konsti | matchicalcom** [42:33 - 42:36]: We don't know how bad our skill database is.
**Konsti | matchicalcom** [42:36 - 42:44]: We know that it's bad when we can tell, when we look at different examples and see like bad associations or missing associations.
**Konsti | matchicalcom** [42:44 - 42:51]: But we know the exact number of scoring will always be hard to have a metric on how good is the skill database?
**Konsti | matchicalcom** [42:51 - 43:09]: But we should at least consider a little bit how we can measure the quality at least maybe also by how many skills that we have are actively used, you know, If we have like just twenty percent of our skill database being used all.
**Konsti | matchicalcom** [43:09 - 43:17]: The time and the other eighty percent are used like maybe just once in one engagement or once in one client request or so.
**Konsti | matchicalcom** [43:17 - 43:25]: This is a good indication for like eighty percent of your skills are not relevant skills, so you're you probably want.
**Carlos | matchicalcom** [43:25 - 43:31]: To merge them or just leave the allies, but just consider the main skills, condense them.
**Konsti | matchicalcom** [43:32 - 43:33]: That's something.
**Konsti | matchicalcom** [43:34 - 43:41]: And another thing is also I forget about the other thing.
**Niklas | matchicalcom** [43:49 - 43:59]: No, but yeah, in general it doesn't sound bad so what for sure it will bring as a clear advantage is a lot of speed and it will take away a lot of load.
**Niklas | matchicalcom** [43:59 - 44:08]: And we will still have this compactness because we have a graph that we can do all these vector similarity searches that we could.
**Niklas | matchicalcom** [44:08 - 44:20]: Do before, but also now together with LLM searches and then, yeah, no, I guess it's good in general.
**Niklas | matchicalcom** [44:21 - 44:26]: Then of course putting it together like hey, how's it with experience, how they calculate it?
**Niklas | matchicalcom** [44:26 - 44:35]: Like there's a whole different topic which is very related, but probably trying to solve both directly at once isn't the right.
**Niklas | matchicalcom** [44:35 - 44:37]: But first getting like a working prototype.
**Carlos | matchicalcom** [44:37 - 44:41]: Proof of concept in the one thing at this point.
**Carlos | matchicalcom** [44:41 - 44:48]: I don't feel comfortable saying that this will solve everything or even that will be a huge improvement I started yesterday right?
**Carlos | matchicalcom** [44:48 - 44:49]: I just don't know the system that we are.
**Carlos | matchicalcom** [44:52 - 44:53]: I need a few more hours, sorry.
**Carlos | matchicalcom** [44:55 - 45:02]: But at least I think what I was thinking to start would be.
**Carlos | matchicalcom** [45:02 - 45:06]: We would start with the current LLM processing or constant can.
**Carlos | matchicalcom** [45:06 - 45:07]: Create a parallel process.
**Konsti | matchicalcom** [45:07 - 45:09]: I will create new problems.
**Carlos | matchicalcom** [45:09 - 45:10]: They are okay, no problem.
**Carlos | matchicalcom** [45:11 - 45:12]: But we would start.
**Carlos | matchicalcom** [45:12 - 45:22]: We would define the nodes and the relationship that we want to store on the graph and we would start as impairment start feeding the graph.
**Carlos | matchicalcom** [45:22 - 45:27]: And not using for anything right now just keeping it updated with the relation database just to.
**Carlos | matchicalcom** [45:27 - 45:39]: Have a starting point to see if first of all we capture everything and all the answers or questions that we have can be answered by the graph and this kind of usage and understand what we are missing.
**Carlos | matchicalcom** [45:39 - 45:46]: Keeping the skills as they are because that have a huge impact in the rest of the application that we would not touch for now.
**Niklas | matchicalcom** [45:48 - 46:03]: Keeping the skills as they are so that would automatically mean we would automatically recognize if we change a skill or specific mapping that then we can understand which are the consultants where we need.
**Konsti | matchicalcom** [46:03 - 46:06]: To do changes, no, no, this one.
**Konsti | matchicalcom** [46:06 - 46:07]: We do not care about.
**Konsti | matchicalcom** [46:09 - 46:14]: We just use the data that we have to kind of test our new skill database and when we.
**Konsti | matchicalcom** [46:14 - 46:27]: Are happy with our new workflows and how it works, then we just do a full recalculation or full new AI classification of all our consulting engagements instead of considering yes, yes, but I mean.
**Niklas | matchicalcom** [46:27 - 46:29]: The plan still with the new system.
**Niklas | matchicalcom** [46:29 - 46:33]: Of course, it still needs to be tested first and everything which takes time.
**Niklas | matchicalcom** [46:33 - 46:38]: But is to keep the skills in our database, the skills as a general.
**Carlos | matchicalcom** [46:39 - 46:44]: At least the main ones, yes, the ones that we use to calculate experiences and yes, yes.
**Carlos | matchicalcom** [46:44 - 46:52]: That in my opinion needs to be in a relation database just on the side of the other table, so it is faster.
**Niklas | matchicalcom** [46:53 - 47:05]: Okay, Then where do the other tables actually help putting it in a graph, okay, finding the similarity thing like if we want to suggest relevant skills that are similar.
**Carlos | matchicalcom** [47:05 - 47:09]: For example you could get rid of the Lias part.
**Carlos | matchicalcom** [47:09 - 47:10]: I think that's the big advantage.
**Carlos | matchicalcom** [47:11 - 47:14]: You have skills and skill alliances from what I understand skill alliances.
**Carlos | matchicalcom** [47:14 - 47:16]: They're like a more support table.
**Carlos | matchicalcom** [47:16 - 47:21]: Avoid duplicates and relations and you have the skills, the skills you still need it.
**Carlos | matchicalcom** [47:21 - 47:23]: You probably can simplify the table.
**Carlos | matchicalcom** [47:23 - 47:25]: Okay, so strip down the table.
**Carlos | matchicalcom** [47:25 - 47:27]: I don't have the table in front of me.
**Carlos | matchicalcom** [47:27 - 47:29]: But it has text fields that are big.
**Carlos | matchicalcom** [47:29 - 47:31]: Or something, we'll remove everything from there.
**Carlos | matchicalcom** [47:32 - 47:36]: Optimize the table to be searchable with better indexes.
**Niklas | matchicalcom** [47:36 - 47:42]: We should only is translation to other languages.
**Carlos | matchicalcom** [47:44 - 47:49]: Yeah, there isn't a lot that we can do aside of this internal.
**Carlos | matchicalcom** [47:49 - 47:50]: No, but it has.
**Carlos | matchicalcom** [47:50 - 47:51]: It has a problem.
**Carlos | matchicalcom** [47:51 - 47:52]: It has an internal node.
**Konsti | matchicalcom** [47:52 - 47:54]: Yeah, but this is always empty.
**Konsti | matchicalcom** [47:54 - 47:55]: We can get rid of it nobody.
**Carlos | matchicalcom** [47:56 - 47:57]: Yeah.
**Carlos | matchicalcom** [47:57 - 47:59]: But if one record has record this.
**Konsti | matchicalcom** [47:59 - 48:02]: Can just we can.
**Konsti | matchicalcom** [48:02 - 48:03]: We can delete it.
**Carlos | matchicalcom** [48:03 - 48:07]: Okay, Not just leave it there, if it doesn't really make a big difference.
**Carlos | matchicalcom** [48:07 - 48:14]: And this is what the only field that I see that is not indexed is.
**Carlos | matchicalcom** [48:14 - 48:16]: This is low learning effort.
**Carlos | matchicalcom** [48:16 - 48:18]: Not sure if this is very used or not.
**Konsti | matchicalcom** [48:18 - 48:22]: Yeah, but it's oh, it's actually used.
**Konsti | matchicalcom** [48:22 - 48:23]: No, it's not used.
**Konsti | matchicalcom** [48:23 - 48:27]: No, it's not used, but it's not used in the in the matching table.
**Konsti | matchicalcom** [48:27 - 48:28]: That's what I meant.
**Niklas | matchicalcom** [48:28 - 48:30]: It's definitely something that.
**Konsti | matchicalcom** [48:32 - 48:35]: We need it for calculating the experience what I mentioned.
**Konsti | matchicalcom** [48:35 - 48:38]: Like there's some skills like JSON, our low learning effort.
**Konsti | matchicalcom** [48:38 - 48:40]: So we have a decision tree.
**Konsti | matchicalcom** [48:40 - 48:44]: Like how many years you need to get to become one question one year.
**Niklas | matchicalcom** [48:44 - 48:45]: Is already a lot like.
**Konsti | matchicalcom** [48:48 - 48:51]: One question I'm having like one problem that it's more like.
**Konsti | matchicalcom** [48:54 - 48:59]: But it's a big problem and I don't know how to solve it currently.
**Konsti | matchicalcom** [49:01 - 49:09]: Imagine we have front end development as a skill in our skill database already.
**Konsti | matchicalcom** [49:10 - 49:12]: And now this new skill is requested.
**Konsti | matchicalcom** [49:12 - 49:17]: It's called Angular and we classified, we realize a new skill.
**Konsti | matchicalcom** [49:17 - 49:20]: We create that new skill and then we look for potential parents.
**Konsti | matchicalcom** [49:20 - 49:24]: And then we see, ah yeah, potential parent for Angular is front end development.
**Konsti | matchicalcom** [49:24 - 49:34]: So we connect Angular with front end development and now at a later stage we get another new skill requested, like two days later doesn't matter.
**Konsti | matchicalcom** [49:34 - 49:38]: And this new skill is front end frameworks.
**Konsti | matchicalcom** [49:38 - 49:45]: And then realize front end frameworks is also a new skill category, because it's very more specific than front end development.
**Konsti | matchicalcom** [49:45 - 49:47]: So it's front end frameworks.
**Konsti | matchicalcom** [49:47 - 49:51]: And then we realized, ah yeah, we have a parent for this that suits.
**Konsti | matchicalcom** [49:51 - 49:54]: It's front end development, but actually what we should do is not like.
**Konsti | matchicalcom** [49:55 - 50:03]: What we also should do is like we should revisit Angular and realize Angular is not the direct child of front end development.
**Konsti | matchicalcom** [50:03 - 50:05]: It's actually the direct child of front end frameworks.
**Konsti | matchicalcom** [50:05 - 50:13]: So we need to insert it in the middle of the chain and by being the child of front end frameworks and front end frameworks being the child of front end development.
**Konsti | matchicalcom** [50:13 - 50:18]: Like Angular is now the child of front end development with a distance of two for example.
**Konsti | matchicalcom** [50:19 - 50:26]: So this insert, this dynamic insert where are skills that come in the chain?
**Carlos | matchicalcom** [50:29 - 50:30]: Technically it's not difficult.
**Carlos | matchicalcom** [50:30 - 50:40]: The problem is the LLM or someone understands all that information and says that the action to do, because technically you could even do connecting to both right.
**Carlos | matchicalcom** [50:40 - 50:46]: So Angular would connect to front-end development and frameworks for example.
**Carlos | matchicalcom** [50:46 - 50:52]: And not thinking like a hierarchy as we are normally used to, but more.
**Konsti | matchicalcom** [50:52 - 50:54]: Like need the hierarchy right.
**Carlos | matchicalcom** [50:54 - 50:57]: We could just right, you don't need the hierarchy, you just connect to stuff.
**Carlos | matchicalcom** [50:59 - 51:00]: That's the challenge.
**Konsti | matchicalcom** [51:01 - 51:02]: When we don't need the hierarchy.
**Konsti | matchicalcom** [51:04 - 51:09]: No, we don't, we don't need you.
**Carlos | matchicalcom** [51:09 - 51:16]: You need to classify some skills, their main skills, because you need to use it for the matching right.
**Carlos | matchicalcom** [51:17 - 51:35]: But all the others they can be connected and just they are connected and then when you query it, you define if you want just like how many nodes they all want to search for possible connections or if it just direct matches or you have the ability to search that.
**Carlos | matchicalcom** [51:37 - 51:41]: No need to define it on the moment that you are introducing the nodes.
**Konsti | matchicalcom** [51:41 - 51:47]: Or the relationships, but still even if the distance does matter.
**Konsti | matchicalcom** [51:47 - 51:56]: What we would need to do is, when we have now front end framework, we need to first check there is no parent, but no.
**Konsti | matchicalcom** [51:57 - 52:02]: We need at least some kind of hierarchy because we need to know one information.
**Konsti | matchicalcom** [52:02 - 52:23]: We need to know, when you're capable of Angular, you're capable of front end frameworks and you're capable of front end development, but when you're available capable of front end development, you are just capable of front and frame of when you're capable of front end frameworks, you are just also capable of front end development, but you're not capable of Angular.
**Konsti | matchicalcom** [52:23 - 52:25]: We do not know this, you know?
**Konsti | matchicalcom** [52:25 - 52:40]: Therefore we need the hierarchy because what we currently do is, when someone has a skill Angular in our system, when we calculate the experience, you get the experience Angular, you get the experience front end framework and you get the experience front end developed and so forth.
**Carlos | matchicalcom** [52:42 - 52:46]: What you are defining, it's different kind of relationships.
**Carlos | matchicalcom** [52:47 - 52:49]: Okay, there would be two different things.
**Carlos | matchicalcom** [52:49 - 52:57]: You could search using the path that one leads to the other or that they are exclusive.
**Konsti | matchicalcom** [52:59 - 53:01]: Yeah, yeah, yeah, you are searching to.
**Carlos | matchicalcom** [53:01 - 53:03]: You are searching two different things.
**Carlos | matchicalcom** [53:03 - 53:16]: Or you can search using different kinds of relationships and attributes in the relationships or in the notes think we can respond to those kind of questions in general what?
**Konsti | matchicalcom** [53:16 - 53:19]: Like the current process that I just described, I don't also know how.
**Konsti | matchicalcom** [53:19 - 53:41]: If it is really feasible, like imagine like because when I do currently the experience calculation like what I could do is just provide the experience angular and then by someone having experience angular, I have other positions in the database, I always have the connection.
**Konsti | matchicalcom** [53:41 - 53:46]: When you're capable of angular, you're also also capable of front end frameworks and capable of front end development.
**Konsti | matchicalcom** [53:47 - 53:57]: But what I currently do is, I also write these to your experience table, because I want to have everything in the experience table that I don't need to look up what is connected to what?
**Konsti | matchicalcom** [53:57 - 53:58]: Because this would slow down the query.
**Carlos | matchicalcom** [53:58 - 54:04]: Even more, because in runtime you don't want to be querying other tables, makes sense.
**Konsti | matchicalcom** [54:04 - 54:20]: But even that's not such a big problem that we duplicate that stuff, because I think the maximum hierarchy level even with stuff like SAP, SAP is like you start with ERP systems and you start with SAP and then you start with a specific SAP module.
**Konsti | matchicalcom** [54:20 - 54:32]: In that specific SAP module there's a sub module, there's a skill, there's a sub skill, So the maximum length is kind of like say five to ten, that's really the max max, but it's already pretty nested, right?
**Konsti | matchicalcom** [54:33 - 54:39]: So when you have those bottom level experiences, you have ten, it's ten times duplicated.
**Konsti | matchicalcom** [54:39 - 54:41]: For all of the consultants who have that.
**Carlos | matchicalcom** [54:43 - 54:47]: I see the problem that's almost a data warehouse problem.
**Carlos | matchicalcom** [54:49 - 54:54]: I'll think about it a little bit more on that part, but I need to get to know this.
**Carlos | matchicalcom** [54:55 - 54:57]: Like hands on to start being more helpful.
**Konsti | matchicalcom** [54:57 - 55:00]: This is not so complex we need test the solution now.
**Carlos | matchicalcom** [55:01 - 55:04]: Okay, just create a notepad, just type something.
**Konsti | matchicalcom** [55:06 - 55:09]: No, Okay, so this is the whole.
**Niklas | matchicalcom** [55:09 - 55:18]: Field actually, this fits actually very perfectly then in the course that I was having, which is about knowledge graph and all these.
**Niklas | matchicalcom** [55:18 - 55:23]: Relations and things that are together in there, there's a lot of research done currently in that.
**Niklas | matchicalcom** [55:23 - 55:35]: And also like actually a colleague of mine is researching exactly, like how can you from one note calculate the neglected things up and then down to another child?
**Niklas | matchicalcom** [55:35 - 55:40]: So there's a huge set of research we can definitely count on.
**Niklas | matchicalcom** [55:41 - 55:48]: The question is just there's some, I think there's some complexity that we will never solve.
**Niklas | matchicalcom** [55:48 - 55:58]: Like as soon as we have a certain size, you can just do certain calculations and do like, ah, let's run this kind of algorithm to do the after cleaner.
**Niklas | matchicalcom** [55:58 - 56:06]: I don't know, but still in the end you will get, I don't know eighty five percent of the things well done, but we will never be able to reach one hundred percent.
**Niklas | matchicalcom** [56:07 - 56:16]: So they will always definitely need to be a manual labor workflows, also in addition, because it does not work that.
**Carlos | matchicalcom** [56:16 - 56:19]: Would be an option that was some kind of manual review.
**Carlos | matchicalcom** [56:19 - 56:26]: Also I know that conste just runs away from manual stuff because doesn't allow us to escalate or to scale.
**Carlos | matchicalcom** [56:27 - 56:48]: But at least in the beginning I think we need to sometimes create a spreadsheet, send everything to a spreadsheet or everything that changed last week, last month and let's review it just at least if it's it we know if it makes sense or not or we can try to have in the future some kind of LLM reviewing it once a month or something, just to see if it still makes sense.
**Niklas | matchicalcom** [56:50 - 56:53]: Yes, it's a very tricky problem.
**Konsti | matchicalcom** [56:54 - 57:10]: We could even think about something way fancier than a spreadsheet and like just building a simple kind of like same as tinder for us in the back end where we can just click a button like see the next one approved and just check those.
**Konsti | matchicalcom** [57:10 - 57:11]: Probably makes sense.
**Niklas | matchicalcom** [57:16 - 57:29]: Well, it's definitely, it will have different stages for sure, because as you're saying consty, you cannot just I mean what we can do maybe once a week to see where new hierarchy is there and still.
**Niklas | matchicalcom** [57:29 - 57:47]: But the more often we also do that the higher we will probably increase the chances of also making possible errors inside, because that's just given like statistically right, we will not be one hundred percent, even with the best workflow never the one hundred percent.
**Konsti | matchicalcom** [57:48 - 57:58]: So the question really, it's not about like our job here is not is to win a prize by having the one hundred percent perfect skill database.
**Konsti | matchicalcom** [57:58 - 58:05]: It's more like good enough that it's scalable and maintains very good quality.
**Konsti | matchicalcom** [58:06 - 58:08]: That's the job to be done here.
**Konsti | matchicalcom** [58:09 - 58:12]: Carlos, what would you propose as next steps?
**Konsti | matchicalcom** [58:12 - 58:17]: Just building a prototype where we start setting this up and getting an idea.
**Carlos | matchicalcom** [58:17 - 58:24]: Of play I would create I need to see I've created a trial account in Neo Four J.
**Carlos | matchicalcom** [58:25 - 58:31]: I can use that for now to build small graph there with one hundred records just to.
**Carlos | matchicalcom** [58:31 - 58:36]: Define some relationships, some nodes and we would start there.
**Carlos | matchicalcom** [58:36 - 58:46]: And once we have there, let's see what are the questions that the model that I'm going to create does not respond to see where are the gaps and can go from there.
**Konsti | matchicalcom** [58:47 - 58:55]: In general, whenever there's any kind of paywall for anything where you say we need this to test this out, let me know and we can, we can get.
**Carlos | matchicalcom** [58:57 - 58:59]: I have a two week trial.
**Carlos | matchicalcom** [58:59 - 59:05]: I know, AWS also has engine for this to run graphs.
**Carlos | matchicalcom** [59:05 - 59:09]: Not sure what's the best option for now I have a trial in the trial.
**Konsti | matchicalcom** [59:11 - 59:14]: I think they are quite advanced in that topic, but I don't know.
**Niklas | matchicalcom** [59:18 - 59:22]: For J no super great.
**Niklas | matchicalcom** [59:22 - 59:25]: Then actually one thought that I have, but that's more down the road is.
**Niklas | matchicalcom** [59:25 - 59:36]: Then maybe to later on, if that proves interesting to already make use the current, because constantly you were like, ah, let's throw away all our current skills.
**Konsti | matchicalcom** [59:36 - 59:37]: And blah blah blah.
**Niklas | matchicalcom** [59:37 - 59:42]: But maybe to increase, you know, having a good starting point later on.
**Niklas | matchicalcom** [59:42 - 59:47]: One thought could be to filter out of all the skills what we currently have.
**Niklas | matchicalcom** [59:47 - 59:54]: What are the most parent ones that could be very likely to already feed them automatically to the network.
**Niklas | matchicalcom** [59:54 - 59:58]: So we have some kind of We.
**Konsti | matchicalcom** [59:58 - 01:00:06]: Can feed all of them to the network, because we only feed stuff to the network that works through our classifier QA workflow, right?
**Konsti | matchicalcom** [01:00:06 - 01:00:14]: And it's easy that we put shit into that workflow, because this workflow needs to be good enough to handle shit and reject it, or?
**Niklas | matchicalcom** [01:00:15 - 01:00:16]: But that's not good.
**Niklas | matchicalcom** [01:00:17 - 01:00:18]: That's not what you should do.
**Niklas | matchicalcom** [01:00:18 - 01:00:25]: Or if we can start cleaner and already give it more guidance, we shouldn't give it like one thousand types of.
**Niklas | matchicalcom** [01:00:25 - 01:00:34]: But rather we should say like hey, here, two hundred good ones use this one already as a starting reference to handle now the next one thousand shit.
**Konsti | matchicalcom** [01:00:34 - 01:00:42]: Right, yeah, yeah, yeah, yeah, starting reference could be could be definitely also nine year, but then we need to battle test it with shit.
**Konsti | matchicalcom** [01:00:42 - 01:00:48]: That's what I was meaning yes, yes, as well as what we received from cvs and client requests.
**Carlos | matchicalcom** [01:00:48 - 01:01:04]: What I'm thinking to use since we have a dataset, I'm thinking going to production, export that to a spreadsheet or to have the data itself, the skills and the skill, alliances and roles and use that as my starting point.
**Carlos | matchicalcom** [01:01:04 - 01:01:11]: Of course, we will be able to just delete all the data just to build the structure to test performance.
**Carlos | matchicalcom** [01:01:11 - 01:01:23]: I would use that data because I'm playing around with most of LLMs and I've found hard to create ten thousand records or twenty thousand records of data set since we have.
**Carlos | matchicalcom** [01:01:23 - 01:01:26]: It already and the data was cured through the LLM.
**Carlos | matchicalcom** [01:01:26 - 01:01:27]: Let's just use it.
**Carlos | matchicalcom** [01:01:27 - 01:01:29]: Then we can start over from scratch.
**Carlos | matchicalcom** [01:01:29 - 01:01:33]: But for now to start to have some data, I think we will use it as a starting point.
**Konsti | matchicalcom** [01:01:34 - 01:01:35]: Yeah, sure, sure.
**Konsti | matchicalcom** [01:01:35 - 01:02:26]: And what you could use as a quality indicator is like you could sort, you could filter them by those skills that are most frequently used, those skills that are most frequently used in experiences or in client demands would help All right, okay, okay, what we obviously need is like so you will set up this prototype, but we need to set up in this prototype our kind of classification system, right?
**Carlos | matchicalcom** [01:02:27 - 01:02:30]: We will, I wouldn't start there already constantly.
**Carlos | matchicalcom** [01:02:30 - 01:02:37]: Let's I think make sure that the data works see where we would connect this graph data.
**Carlos | matchicalcom** [01:02:37 - 01:02:38]: Make sure that everything.
**Carlos | matchicalcom** [01:02:38 - 01:02:42]: Okay, since I have a data set already, we don't need the LLM to be generating.
**Konsti | matchicalcom** [01:02:43 - 01:02:46]: Just like feel how it works, how we can develop with it in our.
**Carlos | matchicalcom** [01:02:46 - 01:02:49]: Systems and if it works, right?
**Carlos | matchicalcom** [01:02:49 - 01:02:59]: Because maybe we invest a couple of days in this and we say, okay, we cannot, it's not fast enough or it would be too expensive or I don't know what kind of troubles we.
**Konsti | matchicalcom** [01:02:59 - 01:03:05]: Might find all right so we will meet again in thirty minutes and see how we proceed from there.
**Carlos | matchicalcom** [01:03:06 - 01:03:07]: Okay, okay, no problem.
**Carlos | matchicalcom** [01:03:08 - 01:03:12]: I will just generate a video of things working or something using AI.
**Konsti | matchicalcom** [01:03:16 - 01:03:21]: OK, next steps from here, you know in this case what to do.
**Carlos | matchicalcom** [01:03:24 - 01:03:24]: There.
**Konsti | matchicalcom** [01:03:24 - 01:03:31]: Are some things I need to work on and also Tommy is joining and tomorrow we have a meeting with the potential investor, like of the half of the day.
**Konsti | matchicalcom** [01:03:34 - 01:03:39]: But really my core focus, but I still need this week is to free up.
**Konsti | matchicalcom** [01:03:39 - 01:03:51]: Really my time to also engage fully in this process and helping, also because I can already start on improving the prompts that we were using this classification.
**Carlos | matchicalcom** [01:03:53 - 01:04:03]: I would expect, I just want to ask in terms of guidance, do you want me to try to see performance in some side of the application or can I just focus on this for now?
**Konsti | matchicalcom** [01:04:04 - 01:04:09]: For now everything is running and we are not planning to bring in another one thousand consultants.
**Carlos | matchicalcom** [01:04:09 - 01:04:11]: Okay, so we are good for now.
**Konsti | matchicalcom** [01:04:11 - 01:04:14]: We are good, okay, we are fortunately, we are good.
**Konsti | matchicalcom** [01:04:14 - 01:04:19]: I will let you know if the forest is burning, but we are LTV four.
**Carlos | matchicalcom** [01:04:28 - 01:04:36]: When the fire starts, when things start a little bit, let's let's, yeah, yeah, yeah, that would probably be good enough.
**Konsti | matchicalcom** [01:04:37 - 01:04:38]: Okay, cool.
**Konsti | matchicalcom** [01:04:38 - 01:04:43]: Perfect and Carlos, you will hit me up when there's anything where you think like let's let's let's jump in and.
**Carlos | matchicalcom** [01:04:43 - 01:04:47]: Like I would probably let's say I'm going to work tomorrow.
**Carlos | matchicalcom** [01:04:47 - 01:04:54]: Also so I think by tomorrow I should have a graph, a simple one with some data.
**Carlos | matchicalcom** [01:04:54 - 01:05:00]: I need to get data sets, I need to learn how to use these tools, because I'm far from being very efficient on these ones.
**Carlos | matchicalcom** [01:05:00 - 01:05:17]: But with some tutorials and ChatGPT we'll get there and probably next week, probably Monday, probably Tuesday, let's talk again because the ends or I can show where the graph is some queries that we are able to do and we can go from there.
**Konsti | matchicalcom** [01:05:18 - 01:05:19]: Perfect.
**Konsti | matchicalcom** [01:05:19 - 01:05:27]: And I will also take some time to challenge a little bit, like what we talked about and if there's any kind of blank spots or so, oh.
**Carlos | matchicalcom** [01:05:27 - 01:05:29]: I'm sure that there are blind spots.
**Konsti | matchicalcom** [01:05:30 - 01:05:38]: I'm sure, yeah, but in general in general, I think in really in general there are two options, like either we go with a graph or we stay with a SQL.
**Konsti | matchicalcom** [01:05:38 - 01:05:42]: Right There's like.
**Carlos | matchicalcom** [01:05:45 - 01:05:58]: For SQL to have better performance, you need a bigger machine, that's a lot of the cases, it's just there and in this case in ODC it's not easy to have or cheap to have a bigger machine.
**Carlos | matchicalcom** [01:05:58 - 01:06:00]: So let's try to fix with the tools that we have.
**Niklas | matchicalcom** [01:06:01 - 01:06:11]: Yes, also creating a hierarchy in relational database super inefficient, because like if then you that's why MongoDB and stuff exists, right?
**Niklas | matchicalcom** [01:06:11 - 01:06:14]: Because it's just way better than in these cases.
**Niklas | matchicalcom** [01:06:14 - 01:06:18]: But so many reasons for not stick to SQL.
**Konsti | matchicalcom** [01:06:18 - 01:06:21]: Probably Carlos, thank you for your insights.
**Carlos | matchicalcom** [01:06:22 - 01:06:24]: Carlos I hear if you need me.
**Niklas | matchicalcom** [01:06:25 - 01:06:29]: Just we know, but probably you will see it earlier or later very quickly.
**Niklas | matchicalcom** [01:06:29 - 01:06:34]: I already saw Neo four J, they have like a huge amount of tutorials, also in regards to skills.
**Niklas | matchicalcom** [01:06:34 - 01:06:45]: I was just quickly searching something, because I thought okay, it's probably like so off often introduced topic like hey, match skills and employees and with each other.
**Konsti | matchicalcom** [01:06:45 - 01:06:50]: Something, but in general Chico what do you think about the idea?
**Konsti | matchicalcom** [01:06:50 - 01:06:56]: Because like Chico like from his master is currently and arts in general Chico is quite a good researcher.
**Konsti | matchicalcom** [01:06:57 - 01:07:04]: Do you think it makes sense Chico, when you join forces there and also research on this topic now in theory.
**Niklas | matchicalcom** [01:07:04 - 01:07:09]: That would be actually, I think we were talking about it like it was what was a few months ago?
**Niklas | matchicalcom** [01:07:09 - 01:07:18]: We were like damn, when I'm finished with my master thesis, it could be a topic where I can really well look into, but the problem just is currently that I do my master thesis.
**Niklas | matchicalcom** [01:07:18 - 01:07:35]: My whole research brain is completely thing so I think as long as I still have my master thesis and I'm in the final weeks Probably it will be best if I don't go too much into that topic, but I can still think about it because now Carlos, you are touching on it, right?
**Niklas | matchicalcom** [01:07:35 - 01:07:44]: You're starting to investigate and obviously then you also join with the prompt, so maybe it makes sense to me, also to join fully in I talked with.
**Konsti | matchicalcom** [01:07:44 - 01:07:46]: Tommy and we mentioned like.
**Konsti | matchicalcom** [01:07:46 - 01:07:54]: Okay, let's really focus on what we need to deliver, like, still like construct bonus agent for other template and other than that.
**Konsti | matchicalcom** [01:07:54 - 01:08:05]: We don't do any new features until we have fixed this one, because it's the core part and there's like we need full focus on this one before we maybe or not.
**Niklas | matchicalcom** [01:08:05 - 01:08:09]: I mean I like to research, I'm very full into research.
**Niklas | matchicalcom** [01:08:09 - 01:08:10]: Probably good.
**Niklas | matchicalcom** [01:08:10 - 01:08:13]: Then we can better discuss Carlos about our thoughts.
**Konsti | matchicalcom** [01:08:13 - 01:08:25]: But anyway, Cyplain has said like that, you like we need this outside prototype like things, so that's like and Chico, you can like we first have blah blah blah blah, but yeah, good.
**Konsti | matchicalcom** [01:08:25 - 01:08:29]: But just to let you know, Carlos, our whole focus is on this topic.
**Konsti | matchicalcom** [01:08:29 - 01:08:36]: For the next, the idea is to have the new system running as soon as possible.
**Konsti | matchicalcom** [01:08:36 - 01:08:40]: Let's see when What what's your gut feeling?
**Carlos | matchicalcom** [01:08:43 - 01:08:54]: I would like by the end of the month to have a running version talking about two weeks, a little bit less with something that you can try.
**Carlos | matchicalcom** [01:08:54 - 01:09:01]: Okay, not saying that full system, everything running, but we were able to you created some new prompts.
**Carlos | matchicalcom** [01:09:01 - 01:09:05]: We are feeding this new system and we are using it in the search page or a couple.
**Carlos | matchicalcom** [01:09:05 - 01:09:08]: Of small places in the application.
**Carlos | matchicalcom** [01:09:08 - 01:09:09]: Or at least we will be able to.
**Konsti | matchicalcom** [01:09:13 - 01:09:16]: And as soon as we feel comfortable we can pull the trigger and then.
**Carlos | matchicalcom** [01:09:17 - 01:09:19]: Yeah, but that's the easy part, right?
**Carlos | matchicalcom** [01:09:19 - 01:09:21]: So just switching it, let's see.
**Carlos | matchicalcom** [01:09:21 - 01:09:28]: But until there let's make sure that accurate and open that nothing else just pops up.
**Konsti | matchicalcom** [01:09:28 - 01:09:29]: Perfect, perfect, perfect.
**Konsti | matchicalcom** [01:09:29 - 01:09:35]: And when it comes to what you mentioned regarding, like moving CV powder to workflows and so on let's focus not on this yet.
**Konsti | matchicalcom** [01:09:35 - 01:09:37]: Let's really fully focus on this topic.
**Carlos | matchicalcom** [01:09:37 - 01:09:39]: Sure, sure until the smoke comes.
**Konsti | matchicalcom** [01:09:40 - 01:09:43]: Yep, all right, hopefully not.
**Niklas | matchicalcom** [01:09:43 - 01:09:46]: Let's go yesterday it was luckily yesterday.
**Niklas | matchicalcom** [01:09:46 - 01:09:52]: Then when we had the call and stuff it was super quiet, like no one in the team's channel wrote anything just in the evening.
**Konsti | matchicalcom** [01:09:52 - 01:09:56]: So let's hope it continues Currently like many people are on vacation.
**Konsti | matchicalcom** [01:09:56 - 01:09:58]: The September is the new August.
**Konsti | matchicalcom** [01:09:58 - 01:10:00]: It seems does matter.
**Konsti | matchicalcom** [01:10:01 - 01:10:02]: Yeah, yeah.
**Konsti | matchicalcom** [01:10:02 - 01:10:04]: For us like it's quite low.
**Niklas | matchicalcom** [01:10:04 - 01:10:07]: Like currently not many clients are working.
**Carlos | matchicalcom** [01:10:09 - 01:10:12]: Okay, you need to get more clients.
**Konsti | matchicalcom** [01:10:13 - 01:10:14]: Not yet here, Carlos.
