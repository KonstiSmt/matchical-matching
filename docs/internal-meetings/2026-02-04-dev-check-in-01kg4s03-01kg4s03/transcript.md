# Dev check in

**Konsti | matchicalcom** [00:04 - 00:10]: Hello Carlos, Hello Kelsey, Good morning, good.
**Carlos | matchicalcom** [00:10 - 00:19]: Morning, everything good on my side and you ready to move in, to move out or move into moving?
**Carlos | matchicalcom** [00:19 - 00:23]: Kind of, yeah, you move out from one place, move into another, so true.
**Konsti | matchicalcom** [00:23 - 00:31]: True, yeah, I'm looking forward to, yeah, I'm actually a little bit pissed because, like two minutes ago my art systems kind of crashed.
**Carlos | matchicalcom** [00:32 - 00:35]: Oops, yeah, nice, that's up good.
**Konsti | matchicalcom** [00:35 - 00:43]: Now I do first quit and now I say like, okay, reopen it and then say it's like, oh, you lost your stuff.
**Carlos | matchicalcom** [00:47 - 00:49]: Sometimes it recovers, but that's I don't.
**Konsti | matchicalcom** [00:50 - 00:55]: Know too much, but sometimes it even recovers with strange things.
**Carlos | matchicalcom** [00:58 - 00:59]: On the Mac I don't know.
**Carlos | matchicalcom** [01:00 - 01:08]: On Windows I know the user take the folder when they gave like the temp files, so I've had to go there a couple of times already.
**Konsti | matchicalcom** [01:11 - 01:33]: I have a copy paste tool where I can look up my last one hundred copies and sometimes some copies get broken and when I try to insert these ones, it crashes and it was like always like shit, ah, like, I really need to like, I don't know why, don't why they don't save, like all two minutes your local changes to.
**Carlos | matchicalcom** [01:33 - 01:39]: Disk, but yeah, once again, Mac, I think works slightly different from Windows.
**Carlos | matchicalcom** [01:40 - 01:45]: I think they tried to do it because of the pressures and merges and all that on a temp folder.
**Carlos | matchicalcom** [01:46 - 01:52]: But sometimes, I don't know, is it inconsistent or it crashes because, and sometimes it's even bugs.
**Carlos | matchicalcom** [01:52 - 02:10]: I have problems in the past, like merging two files just corrupted the main file, so it was our systems, It was the one that had to go there with some kind of special tool that they have and edit the XML that is the file itself, so things.
**Konsti | matchicalcom** [02:10 - 02:12]: Sometimes happen, Kind of nasty stuff.
**Konsti | matchicalcom** [02:12 - 02:16]: Okay, Carlos, so following it, I would like to do.
**Konsti | matchicalcom** [02:16 - 02:18]: You have specific topics.
**Carlos | matchicalcom** [02:20 - 02:36]: I do in terms of integrations I have to say that you did an awesome job on location tag and the closure table, because that drew my mind insane yesterday a little bit because of the date, no, it worked, it works, I have to understand so I'm learning.
**Carlos | matchicalcom** [02:36 - 02:44]: I had worked with demands in the past, but now I'm seeing the bullet items and the closure.
**Carlos | matchicalcom** [02:44 - 03:03]: Because of the location and all the rest, because I'm I was or I am building the XML to send to map, so I have to go to all the details in terms of demands and just I still missing a couple of additional columns or items to do.
**Konsti | matchicalcom** [03:03 - 03:05]: You know what's funny about the closure table thing.
**Konsti | matchicalcom** [03:06 - 03:13]: I did not know that a concept like closure table exists and I did name it before differently.
**Konsti | matchicalcom** [03:13 - 03:19]: And then I implemented the logic that I need for for the update flows and everything.
**Konsti | matchicalcom** [03:19 - 03:25]: And like like a month later, when I was telling this to someone, he told me, ah, that's a closure table.
**Konsti | matchicalcom** [03:25 - 03:26]: Ah, yeah, good to know.
**Konsti | matchicalcom** [03:26 - 03:29]: I did not know about the concept, but in this case I came to the same.
**Carlos | matchicalcom** [03:29 - 03:31]: It's a dynamic hierarchy.
**Carlos | matchicalcom** [03:32 - 03:37]: The problem is, this is just very dynamic, so it supports everything, but try to get.
**Carlos | matchicalcom** [03:37 - 03:52]: And I only wanted the city and the country it just takes, yeah, takes time, because sometimes it's the country that should be on the city field, so it would be much easier if you have like fuel for city and the fuel for country just because it's a location.
**Carlos | matchicalcom** [03:52 - 03:54]: We don't know what it is.
**Carlos | matchicalcom** [03:54 - 03:58]: But on the XML we need a city and the country when we have it, it's a lot of conditions, but.
**Konsti | matchicalcom** [04:00 - 04:07]: This is even like this is, this logic is meant for are you willing to travel?
**Konsti | matchicalcom** [04:07 - 04:16]: Like I don't know, we will probably need something that is more like really location services, like right you know where it's bind with the location API and.
**Carlos | matchicalcom** [04:16 - 04:20]: We need the coordinates, go to coordinates and then we can do everything.
**Carlos | matchicalcom** [04:21 - 04:28]: Distance calculation, traveling time, there are APIs online or others are just calculation that can be done on the database.
**Konsti | matchicalcom** [04:28 - 04:30]: Yeah, yeah, that's what we need to say.
**Carlos | matchicalcom** [04:32 - 04:47]: So the normal what I've done in the past is, if you have the geolocation you have, then it's JSON files that represent the borders of a county or of a state and you can intersect and do calculations very easily.
**Carlos | matchicalcom** [04:50 - 04:54]: It's just a matter of getting those shaped files that is a lot of points.
**Konsti | matchicalcom** [04:54 - 04:54]: Yeah.
**Konsti | matchicalcom** [04:54 - 04:58]: But let me know if you have any questions on the structure side of things or.
**Konsti | matchicalcom** [04:58 - 04:59]: Anything.
**Carlos | matchicalcom** [05:00 - 05:06]: Right now, the plan for today, if nothing else comes up is just continue with these web services.
**Carlos | matchicalcom** [05:07 - 05:24]: I have a few more I have to finish this initial one that is the one that generates the XML with all the demands or some demands and then to build the logic since they are going to update this when they write on their database so that logic.
**Konsti | matchicalcom** [05:24 - 05:26]: Needs to be, but XML shell, right?
**Konsti | matchicalcom** [05:26 - 05:28]: Tommy told me, you get a little bit confused.
**Konsti | matchicalcom** [05:28 - 05:32]: We were considering that we need XML to JSON, but actually we needed vice versa, right?
**Carlos | matchicalcom** [05:33 - 05:38]: I thought that we were going to initially the way that I thought that XML would work.
**Carlos | matchicalcom** [05:38 - 05:46]: We were going to read that source and then put it in our demands and then send to them something like that.
**Carlos | matchicalcom** [05:46 - 05:49]: But Tommy explained me No, they introduce.
**Konsti | matchicalcom** [05:49 - 05:54]: It directly different, we have to expose it as XML and they fetch it right, right?
**Carlos | matchicalcom** [05:55 - 06:00]: So that's what I've done, you've seen what I've done with advanced queries for JSON.
**Carlos | matchicalcom** [06:00 - 06:07]: It's a similar thing for XML directly just to be efficient, that's implemented.
**Carlos | matchicalcom** [06:07 - 06:11]: The security is just a better token, so just easy stuff.
**Carlos | matchicalcom** [06:12 - 06:15]: And also but that was like from.
**Konsti | matchicalcom** [06:15 - 06:24]: The beginning where we talked like ten minutes ago since now I told it to recover and now it did recover and let me see if it did.
**Carlos | matchicalcom** [06:24 - 06:34]: Recover what have we lost sometimes like you always lose a few minutes, so we need to go back and try to see what was the latest thing.
**Konsti | matchicalcom** [06:34 - 06:38]: It looks like I lost everything like that's not good.
**Konsti | matchicalcom** [06:40 - 06:46]: Give me one second to just look at it and if I lost everything here, then I just close that shit.
**Konsti | matchicalcom** [06:47 - 06:53]: Yes, I lost everything, I lost everything and it is even flagging me like with arrows that we haven't been there before.
**Carlos | matchicalcom** [06:53 - 07:00]: It's so DC this didn't happen in the past in ODC.
**Carlos | matchicalcom** [07:00 - 07:08]: This is just a nightmare because sometimes nothing changes and all the structures are mandatory and then we need to go that's just, yeah, not good.
**Konsti | matchicalcom** [07:08 - 07:17]: So Warcraft in the other app did I already publish this one, Yes, here I have errors for no reason.
**Konsti | matchicalcom** [07:17 - 07:51]: Let's close this one, Okay, this one at least looks good, OK, in this case I just last like ten minutes, Sorry what I wanted to talk with you about AC following when I'm considering the past one or two weeks and what we are basically doing.
**Konsti | matchicalcom** [07:54 - 08:08]: I think we are doing specifically probably like Tommy and me doing not so good job in terms of in terms of like coordinating and leading right and the development process.
**Konsti | matchicalcom** [08:09 - 08:16]: It's more like still our creative anarchy right everyone is doing a little bit of everything, what do you do?
**Carlos | matchicalcom** [08:17 - 08:22]: The sprint started more organized, but I now don't have spring tasks.
**Carlos | matchicalcom** [08:22 - 08:26]: I'm just going like in day by days, but we made integrations part of it.
**Carlos | matchicalcom** [08:26 - 08:40]: So I think with Pedro and Philip things are more organized since they are still continue the same task I've been jumping around a little bit, but with these integrations it looks like it's steady and can keep it as a priority.
**Konsti | matchicalcom** [08:40 - 08:49]: Maybe it's just my feeling because I feel really kind of plugged out, because I'm like here and there and there and there and again and I know I should be somewhere else, but yeah.
**Carlos | matchicalcom** [08:49 - 08:57]: So we can be focused, someone adds to so I have a couple of calls with Tommy and like me to see this issue that's part.
**Carlos | matchicalcom** [08:57 - 09:01]: We always need to have some time for user issues.
**Carlos | matchicalcom** [09:01 - 09:14]: We found that we in some cases are not validating duplicates correctly, for example, so if you submit both in the same submission or we don't I figure out that we don't.
**Carlos | matchicalcom** [09:14 - 09:19]: If it's in the queue and it's not processed yet, we are not validating duplicate.
**Carlos | matchicalcom** [09:19 - 09:26]: So there are some other things that take a little bit of time to investigate, but those are the things that just pop up some here and there.
**Konsti | matchicalcom** [09:26 - 09:29]: So yeah, I don't think that.
**Carlos | matchicalcom** [09:32 - 09:32]: Unstructured.
**Carlos | matchicalcom** [09:32 - 09:46]: At this point, to be honest, we'll always have, since we have a life system, we all and we are development and maintenance and we are everything we always have things that pop up or.
**Konsti | matchicalcom** [09:46 - 09:54]: Pop out, because things true, true, one hundred percent, so okay, so like that's what that's that's what.
**Konsti | matchicalcom** [09:55 - 10:07]: Sorry was important for me to ask you that question, because like, as I mentioned before, like we don't really have the benchmarks, the benchmarking forward, like it was just us right, yeah, so to.
**Carlos | matchicalcom** [10:07 - 10:13]: Understand in like bigger companies you would have a maintenance team that or development maintenance and resolves tickets and do.
**Carlos | matchicalcom** [10:13 - 10:21]: That thing that support the business and you have new development normally separated, so people can just be more focused, but in this case just do a little.
**Konsti | matchicalcom** [10:21 - 10:28]: Bit of effort if you look at our current development process, like from from one to six, what grade would you.
**Carlos | matchicalcom** [10:28 - 10:34]: Give us the current or where you want to be in a couple of the current?
**Carlos | matchicalcom** [10:35 - 10:36]: The current I would say like three.
**Konsti | matchicalcom** [10:37 - 10:39]: Probably three or two bad.
**Konsti | matchicalcom** [10:39 - 10:41]: Like because we were thinking like we are a five.
**Konsti | matchicalcom** [10:42 - 10:44]: No, no, no, we are doing kind.
**Carlos | matchicalcom** [10:44 - 10:53]: Of no, no, I think what we, what we need to keep doing and I know that Tommy has been working with Lino and building mockups just making.
**Carlos | matchicalcom** [10:53 - 11:00]: Sure that we have that advantage of requirements, so we know what we should be discussing the next spring.
**Carlos | matchicalcom** [11:00 - 11:01]: Right now.
**Konsti | matchicalcom** [11:03 - 11:19]: This process with Lino and Tommy in combination works quite well, I think and it's really, really cool what he's producing like I really like I took, like like I was really I told this Tommy already a few times this week.
**Konsti | matchicalcom** [11:19 - 11:27]: Like I was really like heavily surprised by what Lino is capable of like crazy, really?
**Carlos | matchicalcom** [11:27 - 11:32]: That's exactly what we know we've talked about it.
**Carlos | matchicalcom** [11:32 - 11:40]: Yeah, he's good English is always that, okay, but he's working it out and it's no, but yes, he gets into it.
**Konsti | matchicalcom** [11:40 - 11:45]: That's important, like there's a learning curve That's also cool.
**Konsti | matchicalcom** [11:46 - 11:48]: All right, like, cool, like.
**Konsti | matchicalcom** [11:48 - 12:03]: Then the next question would be if we consider like I know Tommy made these roadmap plans and I always tell him things take longer and he said like it cannot be like I said Tommy, if you can do everything ten times faster than do it like alone.
**Carlos | matchicalcom** [12:03 - 12:06]: Yeah, that will work, okay, yeah, so.
**Konsti | matchicalcom** [12:06 - 12:07]: Like he has, he has like.
**Konsti | matchicalcom** [12:07 - 12:13]: And then that's always our back and forth, but I think like our looking at our roadmap.
**Konsti | matchicalcom** [12:13 - 12:19]: It's by far too ambitious, obviously, the question is, what can we do to get an idea?
**Konsti | matchicalcom** [12:19 - 12:27]: We see also in terms of what we are developing and how we divide ourselves.
**Konsti | matchicalcom** [12:27 - 12:31]: For example currently Pedro is on the data privacy things, right?
**Konsti | matchicalcom** [12:31 - 12:57]: But what I think is, and I know this from Chico before now he's approaching a phase where it's like really here and there and there are a few more details and especially in the end when it's about like, okay, let's fill in the gaps, then it's like eighty percent what you need is like you need a very clear understanding of the business logic and twenty percent is the actual development that we need to do so.
**Konsti | matchicalcom** [12:57 - 12:59]: Maybe at that point it makes more sense.
**Konsti | matchicalcom** [12:59 - 13:04]: If Pedro is not doing it on his own, but join forces for example with me, then we can do things together.
**Carlos | matchicalcom** [13:05 - 13:09]: I think at least on the business side I would.
**Carlos | matchicalcom** [13:09 - 13:17]: Like to see a little bit following through right testing just not really I think building could be you could be Tommy.
**Carlos | matchicalcom** [13:17 - 13:21]: So someone that understands the business that gives feedback on a quick cycle.
**Carlos | matchicalcom** [13:21 - 13:21]: For example.
**Carlos | matchicalcom** [13:23 - 13:26]: I've implemented master data a few.
**Carlos | matchicalcom** [13:26 - 13:26]: Screens.
**Carlos | matchicalcom** [13:26 - 13:38]: I don't think that toggle is turned on in production and that was like last spring, it was two weeks ago and I'm worried about if these things take too long to go to production in like a month or two we need to get back to it.
**Carlos | matchicalcom** [13:40 - 13:45]: So following through the sprint with some tests and then turn things on that privacy.
**Carlos | matchicalcom** [13:45 - 13:46]: It's a different thing.
**Carlos | matchicalcom** [13:46 - 13:46]: Because.
**Konsti | matchicalcom** [13:49 - 13:54]: He said nobody came to me to tell me, okay, we can now do a final review on Master data.
**Konsti | matchicalcom** [13:54 - 13:56]: It's like Tommy go ahead and ask.
**Carlos | matchicalcom** [13:57 - 14:06]: It was that meeting that we did like two hours that said it's ready, but okay, we can talk about it, but that meeting it was like yeah, for me.
**Konsti | matchicalcom** [14:08 - 14:08]: Also need to do.
**Konsti | matchicalcom** [14:08 - 14:13]: There's a lot of old, cold, old, old code and we need to get rid of it.
**Konsti | matchicalcom** [14:13 - 14:22]: Like this day I refactored a few things and then I did this consultant reflectoring as Well, we need these centralized quad actions that's so so critical basically.
**Carlos | matchicalcom** [14:26 - 14:28]: Okay, I wouldn't stop.
**Carlos | matchicalcom** [14:28 - 14:33]: It is next part when we grab something, we just reorganize it.
**Carlos | matchicalcom** [14:33 - 14:37]: I think it's easier than do a sprint just to organize code.
**Carlos | matchicalcom** [14:38 - 14:39]: I don't think that's that bad.
**Carlos | matchicalcom** [14:39 - 14:40]: And it's running.
**Konsti | matchicalcom** [14:42 - 14:47]: If we consider a user or it's not a user story, that's more like an epic, right?
**Konsti | matchicalcom** [14:47 - 14:50]: This epic of data privacy that Pedro.
**Konsti | matchicalcom** [14:50 - 14:52]: And Lino are currently implementing Pedro and Philippe, right?
**Konsti | matchicalcom** [14:52 - 15:04]: Yeah, If you would say in a more like corporate development environment, how long do you think?
**Konsti | matchicalcom** [15:04 - 15:10]: Would such a feature usually taken two sprints.
**Carlos | matchicalcom** [15:11 - 15:13]: It's what looks like that is going to take.
**Carlos | matchicalcom** [15:13 - 15:20]: Doesn't seem too much for the amount of requirement and everything that was there.
**Carlos | matchicalcom** [15:20 - 15:22]: And I didn't understood all the details.
**Carlos | matchicalcom** [15:22 - 15:28]: I didn't dive into all the details, because once again we start no, no.
**Konsti | matchicalcom** [15:28 - 15:30]: I wish you Carlos like.
**Konsti | matchicalcom** [15:30 - 15:36]: I think from the surface it always looks way easier and I think even if we manage it in four weeks, it's kind of decent, right?
**Carlos | matchicalcom** [15:38 - 15:39]: I think that sometimes.
**Carlos | matchicalcom** [15:39 - 15:46]: And I don't like to be complaining, but my appreciation of requirements they are too complex.
**Carlos | matchicalcom** [15:47 - 15:57]: We should simplify requirements because these things take long and sometimes just to make everything dynamic or to just slows down the team.
**Carlos | matchicalcom** [15:57 - 15:58]: Okay, yeah.
**Carlos | matchicalcom** [15:58 - 16:02]: And also it's like I was discussing with Tommy yesterday.
**Carlos | matchicalcom** [16:02 - 16:07]: They need a message, they need a message for the integration.
**Carlos | matchicalcom** [16:07 - 16:08]: Let's start coded.
**Carlos | matchicalcom** [16:08 - 16:11]: It's one message for one company for now.
**Carlos | matchicalcom** [16:11 - 16:15]: Okay, once it gets a problem, we build an administration for that, right?
**Carlos | matchicalcom** [16:16 - 16:18]: For managing token APIs.
**Carlos | matchicalcom** [16:18 - 16:19]: I did just a setting.
**Carlos | matchicalcom** [16:19 - 16:21]: I'm not building a table with administration.
**Carlos | matchicalcom** [16:21 - 16:22]: It's not worth it.
**Carlos | matchicalcom** [16:22 - 16:27]: We'll get there one day right where someone from the business will activate tokens.
**Carlos | matchicalcom** [16:28 - 16:29]: Okay, cool.
**Carlos | matchicalcom** [16:29 - 16:36]: Expiration dates, all that is very fun, but I don't want to spend like two or three weeks just dealing all that just because one day that's like.
**Konsti | matchicalcom** [16:36 - 16:37]: And that's where we always need to.
**Konsti | matchicalcom** [16:37 - 16:39]: We need to hard pushback on this one.
**Carlos | matchicalcom** [16:41 - 16:43]: What's the problem?
**Carlos | matchicalcom** [16:43 - 16:45]: I don't have enough yet.
**Carlos | matchicalcom** [16:45 - 16:53]: Enough business logic or knowledge to be discussing these things with a lot of detail data privacy.
**Carlos | matchicalcom** [16:54 - 16:59]: I think we could have achieved this similar thing with probably less work.
**Konsti | matchicalcom** [17:05 - 17:09]: The stuff that adds a lot of complexity with the context and everything that's like.
**Konsti | matchicalcom** [17:09 - 17:10]: Nice to have.
**Konsti | matchicalcom** [17:10 - 17:18]: It's like no one will use it probably in the beginning, like the eighty percent win would be with twenty percent of the effort just focusing on consultants.
**Carlos | matchicalcom** [17:18 - 17:20]: That's it for the next six months.
**Carlos | matchicalcom** [17:20 - 17:24]: Let's build just eighty percent of everything, right?
**Carlos | matchicalcom** [17:24 - 17:36]: So because this is just my opinion, because we'll get this move faster delivering functionality, even if its functionality doesn't cover everything because we know things will change.
**Carlos | matchicalcom** [17:36 - 17:45]: And maybe in four months we are reviewing that a privacy because we misunderstood something or the business new law or something.
**Carlos | matchicalcom** [17:45 - 17:48]: Happened and we need to revisit a complex thing.
**Carlos | matchicalcom** [17:48 - 17:53]: So simplifying requirements is something that that I normally like because makes us move.
**Konsti | matchicalcom** [17:53 - 17:55]: Much faster, Yeah, yeah, yeah.
**Konsti | matchicalcom** [17:55 - 18:05]: And that's how we get here by the way, like that's I always tell Tommy when he says like now we do these things in the right way I say like look where we are and the way how we get.
**Konsti | matchicalcom** [18:05 - 18:11]: There was like because I was doing so many sacrifices, so many things like, okay, I fucked that I just focus on the twenty percent here and there.
**Carlos | matchicalcom** [18:11 - 18:19]: And there and there I won't try to be a little bit more structured mainly, you know, I think at this point you know me performing, yeah, it.
**Konsti | matchicalcom** [18:19 - 18:21]: Cannot be like I did it before.
**Carlos | matchicalcom** [18:21 - 18:30]: Cannot be crazy, but doing it in a structured way I think that there are things that we can just sometimes those small details, right?
**Carlos | matchicalcom** [18:30 - 18:36]: So that's small details, so someone has an additional role or makes it more complex.
**Carlos | matchicalcom** [18:37 - 18:40]: And do we really the question will be, do we really need it?
**Carlos | matchicalcom** [18:41 - 18:43]: Are the users going to really use it?
**Carlos | matchicalcom** [18:43 - 18:48]: If you say that they are not going to use it in next few months, maybe you should not be building it.
**Konsti | matchicalcom** [18:50 - 18:51]: True.
**Konsti | matchicalcom** [18:51 - 18:52]: All right, cool colors.
**Konsti | matchicalcom** [18:53 - 19:15]: These are like the considerations that I have and like it's it's like, these are the yeah, it's like because things fucking take time I just realized when I'm just I'm just fucking adding a comment field and this comment field is a local dict field so I need to add like the local dict stuff and then, ah yeah, I need to pass the local dicts.
**Konsti | matchicalcom** [19:15 - 19:16]: I need to update the structure here.
**Carlos | matchicalcom** [19:16 - 19:35]: I need to nothing takes five minutes, you know, unless it's changing a label and you know where it is, Because if you don't know where it is, you need to find the screen, then go to the weblog, to the weblog to try to find where it is, do multi language all these things in an end, you know this.
**Carlos | matchicalcom** [19:35 - 19:38]: And we'll get faster as we go, of course.
**Carlos | matchicalcom** [19:38 - 19:42]: But every time that you have to touch new things takes a little bit longer.
**Konsti | matchicalcom** [19:43 - 19:46]: Yeah, yeah, yeah, yeah, sure, sure, Okay, cool.
**Konsti | matchicalcom** [19:46 - 19:47]: All right.
**Konsti | matchicalcom** [19:47 - 19:48]: Thank you, Carlos.
**Konsti | matchicalcom** [19:48 - 20:02]: Like whenever you have questions, let me know and whenever you see potential for like us moving faster, I think currently based on what you've telling me, like you see the biggest leverage in like let's work on the requirements instead of like work on our dev speed.
**Konsti | matchicalcom** [20:02 - 20:06]: Like because I think the death, our death speed is basically constant.
**Konsti | matchicalcom** [20:06 - 20:12]: It will kind of increase slightly with more understanding and so on, obviously.
**Konsti | matchicalcom** [20:13 - 20:21]: But it's always also a question of how many developers are we and even we cannot even scale with developers, because at some point it's too many.
**Carlos | matchicalcom** [20:22 - 20:35]: It's also getting late you can, but then you need a testing team the only way to scale I would say maybe add one more maybe possible, but aside of that the part would be testing.
**Carlos | matchicalcom** [20:35 - 20:35]: Testing.
**Carlos | matchicalcom** [20:35 - 20:41]: Writing requirements in testing and defining the product and all that would be our bottom neck very soon.
**Carlos | matchicalcom** [20:41 - 20:55]: Or it is a little bit right now and it will contain because you guys cannot if you and Tommy were fully focused on that, that's impossible, that would be more than okay, so we'll have enough power there.
**Carlos | matchicalcom** [20:55 - 21:12]: But since you guys have to split your time with a lot of different things, My concern is that then this first sprint, the second sprint I was expecting this nothing too crazy, really, because requirements were being built while we are starting developing so this perfectly normal, yeah.
**Konsti | matchicalcom** [21:12 - 21:18]: But currently we are kind of stopped like we are working requirements right now.
**Carlos | matchicalcom** [21:19 - 21:28]: But to sprint form now I would expect to really have a backlog with details with mockups and I think would be good if we can get there.
**Carlos | matchicalcom** [21:28 - 21:31]: The problem is sometimes the day to day just takes takes.
**Carlos | matchicalcom** [21:31 - 21:37]: Time and we cannot just focus on building new stuff or designing.
**Carlos | matchicalcom** [21:38 - 21:51]: Maybe we can have quick wins if you guys have like CRM, it's like building pages and so, maybe they are things that are not too business intensive to design or to.
**Konsti | matchicalcom** [21:55 - 22:03]: More like stuff is more like the like the that's like then we are just rebuilding stuff that's already out there, that's not too fancy.
**Konsti | matchicalcom** [22:04 - 22:12]: We need to focus on the business heavy stuff because that's also our advantage, because we are so niche we go very deep into features like no other.
**Carlos | matchicalcom** [22:12 - 22:24]: Provider has okay, no sometimes just to keep the just not busy but providing value without taking a lot of time from you guys.
**Carlos | matchicalcom** [22:24 - 22:47]: Sometimes having something less business in care can simplify just that or can help because probably in like one or two days you say just build this, that's simple enough But I think things will keep speeding up at least I would say ten twenty percent easily even.
**Carlos | matchicalcom** [22:47 - 22:51]: Maybe a little bit more, once everyone knows because Philippe is learning the widget.
**Carlos | matchicalcom** [22:51 - 23:00]: I was explaining local dicts the other day, for example just a little bit so people are getting used to what exists and where do we need to find things.
**Konsti | matchicalcom** [23:02 - 23:05]: So getting there, no, you have a good feeling.
**Carlos | matchicalcom** [23:06 - 23:09]: Yeah, yeah, no.
**Carlos | matchicalcom** [23:09 - 23:13]: If I didn't have first, I wouldn't propose to bring my team here to be honest.
**Konsti | matchicalcom** [23:13 - 23:15]: No, no, no, no, no, yeah, no, no.
**Konsti | matchicalcom** [23:16 - 23:26]: I mean like about our, it's it's like I know like no, but we are learning, yes, the current, the current process we are working through while going into the development.
**Konsti | matchicalcom** [23:27 - 23:33]: You always need to let you know when you see once you do this and that differently and we can be much more efficient in development.
**Carlos | matchicalcom** [23:35 - 23:41]: We will more efficient once Every developer is familiar with the code wise that's the most.
**Carlos | matchicalcom** [23:41 - 23:44]: Important and with the business concepts, but.
**Konsti | matchicalcom** [23:44 - 23:46]: This will always be hard right?
**Konsti | matchicalcom** [23:46 - 23:51]: Because it's like currently three and a half developers working on it, so it's always evolving and there's a lot of.
**Carlos | matchicalcom** [23:51 - 23:54]: Stuff to catch up so but in that, yeah.
**Carlos | matchicalcom** [23:54 - 24:06]: But if we are starting now, for example I'm not expert in data privacy, but I know the general concepts so I can probably like a quick conversation with Pedro and just build something there, if I need to not specialist and.
**Konsti | matchicalcom** [24:06 - 24:14]: We need to centralize the concepts like this building these wrappers and everything and getting rid of the legacy, like.
**Carlos | matchicalcom** [24:16 - 24:18]: For example these APIs.
**Carlos | matchicalcom** [24:18 - 24:31]: I'm curious if there are some leverage that we can take to centralize because we are going to build two or three different APIs and building just point to point for each site.
**Carlos | matchicalcom** [24:32 - 24:33]: In a different way.
**Carlos | matchicalcom** [24:33 - 24:42]: I'm not sure if this is very efficient, but now we adapt, but maybe once we get more to the bottom of this.
**Carlos | matchicalcom** [24:42 - 24:52]: There are some things that can be built to that centralizes the code in terms of API and not just point to point with each site, just more generic.
**Konsti | matchicalcom** [24:53 - 24:55]: And also there are new tools that we can employ.
**Konsti | matchicalcom** [24:56 - 25:01]: I mean specifically because I'm currently around with doing cloud code or sometimes even.
**Konsti | matchicalcom** [25:01 - 25:25]: Codex and what I realized now when you have set up a system and the system kind of knows the rules and everything you can just talk what kind of really very complex structure you need and it will output you the query for that and most of the finance, the results are quite decent and it outputs you the JSON structure as well, so you can just paste it there have the output format and job done.
**Carlos | matchicalcom** [25:26 - 25:36]: That's stuff that I need to on SQL maybe it's faster, but on SQL since from experience normally fast enough, because that's the easy part.
**Carlos | matchicalcom** [25:36 - 25:47]: I'm hoping they will have the partner conference web call of autisms in February later February to see if they are going to We had some kind of AI within the Odyssey studio.
**Carlos | matchicalcom** [25:48 - 25:50]: Yeah, I was waiting for it because.
**Konsti | matchicalcom** [25:50 - 25:53]: Would be do you know what is one of.
**Konsti | matchicalcom** [25:53 - 26:01]: I was even considering adding creating a blog post on that topic, a forum post on that topic, because I see several things do you know what I see?
**Konsti | matchicalcom** [26:02 - 26:10]: I feel like they are like outsystems has this closed ecosystem approach and they are.
**Konsti | matchicalcom** [26:10 - 26:26]: Like that's very good because like they are managing everything the whole life cycle so it's quite decent as an experience but also they have no chance to compete small out systems compared all the money that is thrown into code AI generation so they need.
**Konsti | matchicalcom** [26:26 - 26:32]: To change the strategy a little bit and especially when it comes to AI generated code they need.
**Konsti | matchicalcom** [26:32 - 26:41]: To provide a feature that much more helps you to see the difference like git diff and so on you don't have that in out systems the alt systems show different stuff.
**Carlos | matchicalcom** [26:41 - 27:04]: It's crap yeah, yeah, yeah, no having some APIs to generate files or to to to mess with the code generation for example, but they are not I don't think that they are going They open like the for the CDCI so they opened for deployments for jackets because big clients ask for them because they build lifetime and they were keeping that.
**Konsti | matchicalcom** [27:04 - 27:11]: Let's see what AI to ask about the code base like here's the code base answer me questions.
**Carlos | matchicalcom** [27:11 - 27:27]: Like I have the They have our code ways right so just building but I think they are moving in that direction Having some kind of agent that understand that, because that would be very since we cannot use outside stuff with odd systems directly would.
**Carlos | matchicalcom** [27:27 - 27:28]: Be cool to have something.
**Konsti | matchicalcom** [27:30 - 27:34]: If we would not work on magical I would like join their team and like have them out.
**Konsti | matchicalcom** [27:35 - 27:38]: I think they did so desperately, but.
**Carlos | matchicalcom** [27:38 - 27:43]: I don't think I'm not sure who is defining the rules or the product path.
**Carlos | matchicalcom** [27:43 - 28:01]: Okay, I just don't know this CEO hears a lot the feedback from people At least it looks like Paolo had a very strict mind about some things and they would define the path and that would be the path and they wouldn't listen too much with Paul Hussav.
**Carlos | matchicalcom** [28:01 - 28:09]: Now this Mike looks like it's a little bit different at least tends to hear more, but let's see if companies.
**Konsti | matchicalcom** [28:09 - 28:22]: I like, like, like at some, some, some point, like maybe this weekend when I have some time I will create that, that, that forum post and maybe there I get some awareness, some people, no, you have, by the way, Carlos, I did not forget about it.
**Konsti | matchicalcom** [28:22 - 28:24]: You will still get these contracts.
**Konsti | matchicalcom** [28:25 - 28:27]: Oh, we are waiting for your invoice.
**Carlos | matchicalcom** [28:27 - 28:33]: By the way, I was going to just wanted to confirm that with you today, so we are going with long term right because of.
**Carlos | matchicalcom** [28:33 - 28:35]: The pricing I just wanted to make sure.
**Carlos | matchicalcom** [28:35 - 28:37]: Yes, yes, I don't have a contract.
**Carlos | matchicalcom** [28:37 - 28:39]: So I was not sure I just wanted to hear.
**Carlos | matchicalcom** [28:40 - 28:43]: So now I've just been busy, but today you'll get it.
**Konsti | matchicalcom** [28:43 - 28:45]: No worries, no worries, no worries, like.
**Carlos | matchicalcom** [28:46 - 28:51]: I'm not like Chico, I'm not going to forget, I'm not like Chico, I'm not going to forget for a few months.
**Carlos | matchicalcom** [28:51 - 28:53]: That doesn't forgetting.
**Konsti | matchicalcom** [28:54 - 28:55]: Ah, I know I should do that.
**Carlos | matchicalcom** [28:56 - 29:00]: I know I'm doing it, but it's just, yeah, today is the fourth still.
**Konsti | matchicalcom** [29:00 - 29:17]: So no worries, no worries, yeah, like, so it will, like we mentioned like, like you made the offer like that the first month for Lino is free, but we mentioned like if we don't take him, we do half half, but as we are happy, you can do like the full amount for Lino, okay, but you can give us a discount if you want to.
**Carlos | matchicalcom** [29:19 - 29:22]: Those prices are not bad, you need, you need to acknowledge that.
**Konsti | matchicalcom** [29:22 - 29:32]: Sure, sure, sure, sure, we are really, we are a little tight in cash flow flow, like not right now, but if we look in the next three months, but we will make it work.
**Konsti | matchicalcom** [29:32 - 29:35]: I will sell, sell, no worries, you'll.
**Carlos | matchicalcom** [29:35 - 29:38]: Sell on board clients and I'm sure that we'll figure a solution.
**Konsti | matchicalcom** [29:38 - 29:41]: No worries, sure, sure, sure, sure, no, but we will make it work.
**Konsti | matchicalcom** [29:42 - 29:48]: All right, Carlos, Bye bye.
