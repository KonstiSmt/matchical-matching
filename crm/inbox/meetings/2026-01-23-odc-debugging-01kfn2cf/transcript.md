# ODC debugging

**Unknown speaker** [00:01 - 00:02]: Okay, let's go.
**Unknown speaker** [00:03 - 00:05]: But if you need it, if you have.
**Unknown speaker** [00:05 - 00:06]: If you really need 400%.
**Unknown speaker** [00:06 - 00:08]: No, no, no, no, no, no, no, no, no.
**Unknown speaker** [00:08 - 00:08]: Every.
**Unknown speaker** [00:08 - 00:09]: Everything's fine.
**Unknown speaker** [00:09 - 00:09]: Really.
**Unknown speaker** [00:09 - 00:11]: It's just more like for.
**Unknown speaker** [00:11 - 00:13]: For like we, we.
**Unknown speaker** [00:13 - 00:17]: We have our, our top players on board.
**Unknown speaker** [00:19 - 00:19]: Okay.
**Unknown speaker** [00:20 - 00:21]: Okay.
**Unknown speaker** [00:21 - 00:22]: So constantly.
**Unknown speaker** [00:22 - 00:23]: I don't know if you saw my last communication.
**Unknown speaker** [00:23 - 00:25]: We already scale up the database.
**Unknown speaker** [00:25 - 00:25]: Okay.
**Unknown speaker** [00:27 - 00:29]: Let me tell you how this works.
**Unknown speaker** [00:29 - 00:35]: So I don't know the background, but ODC works with Aurora V2 behind the scenes.
**Unknown speaker** [00:35 - 00:35]: Okay.
**Unknown speaker** [00:36 - 00:39]: So basically he automatically scale ups.
**Unknown speaker** [00:39 - 00:42]: And what we did, when we say scale up, we.
**Unknown speaker** [00:42 - 00:45]: We increase the max limit of ECUs.
**Unknown speaker** [00:45 - 00:45]: Okay.
**Unknown speaker** [00:45 - 00:49]: So the database can scale up to automatically to that limit.
**Unknown speaker** [00:49 - 00:52]: Your previous limit, it was eight ECUs.
**Unknown speaker** [00:52 - 00:55]: That corresponds to six, 15 gigabytes.
**Unknown speaker** [00:55 - 00:57]: We increase that limit to 64.
**Unknown speaker** [00:57 - 00:57]: Okay.
**Unknown speaker** [00:58 - 01:00]: So it should give you enough headroom.
**Unknown speaker** [01:00 - 01:00]: Okay.
**Unknown speaker** [01:00 - 01:03]: To mitigate the situation while we address the.
**Unknown speaker** [01:03 - 01:03]: The situation.
**Unknown speaker** [01:04 - 01:09]: That process is complete and I already saw that the database is more stable.
**Unknown speaker** [01:09 - 01:09]: Okay.
**Unknown speaker** [01:10 - 01:22]: But there are a few concerns here that I'm seeing that I would like to share with you and also have some background when the users notice this slowness and this blockage because I need to correlate this with performance insights.
**Unknown speaker** [01:22 - 01:22]: Okay.
**Unknown speaker** [01:22 - 01:23]: Mm.
**Unknown speaker** [01:23 - 01:24]: Mm.
**Unknown speaker** [01:26 - 01:26]: Cool.
**Unknown speaker** [01:28 - 01:29]: That's.
**Unknown speaker** [01:29 - 01:31]: That's super, super, super, super nice to hear.
**Unknown speaker** [01:31 - 01:35]: Already like with four times the compute, we can, we can like, we know we have like.
**Unknown speaker** [01:35 - 01:37]: I already talked with Carlos about it.
**Unknown speaker** [01:37 - 01:41]: We have structural issues or architecture issues obviously and we know where to work on.
**Unknown speaker** [01:41 - 01:44]: But if we already have like until we fixed it, some extra compute.
**Unknown speaker** [01:44 - 01:46]: Yeah, super helpful.
**Unknown speaker** [01:46 - 01:47]: The scale up is.
**Unknown speaker** [01:47 - 01:48]: It's per week.
**Unknown speaker** [01:48 - 01:48]: Okay.
**Unknown speaker** [01:48 - 01:49]: It's a temporary scale up.
**Unknown speaker** [01:49 - 01:50]: It doesn't have any cost.
**Unknown speaker** [01:50 - 01:50]: Okay.
**Unknown speaker** [01:50 - 01:51]: Icons.
**Unknown speaker** [01:51 - 01:53]: This is this to put planet here.
**Unknown speaker** [01:54 - 01:55]: It doesn't have any cost.
**Unknown speaker** [01:55 - 01:56]: It's for one week.
**Unknown speaker** [01:56 - 01:58]: If you need an extension, we can extend for another week.
**Unknown speaker** [01:58 - 01:59]: Okay, perfect.
**Unknown speaker** [01:59 - 02:00]: Thank you.
**Unknown speaker** [02:02 - 02:09]: I just, I just confirm on the ODC portal and right now we have our adapted at 25% instead of 9 to 95.
**Unknown speaker** [02:10 - 02:11]: Thank you, Cristiano.
**Unknown speaker** [02:11 - 02:12]: Thank you.
**Unknown speaker** [02:12 - 02:13]: That will really help.
**Unknown speaker** [02:13 - 02:14]: Yeah.
**Unknown speaker** [02:14 - 02:15]: Oh my goodness.
**Unknown speaker** [02:17 - 02:19]: So basically I will.
**Unknown speaker** [02:19 - 02:21]: Everything can be solved with more computer, right?
**Unknown speaker** [02:23 - 02:24]: Yeah, yeah.
**Unknown speaker** [02:24 - 02:28]: But the long term solution, the scale up might be not enough.
**Unknown speaker** [02:28 - 02:29]: Okay.
**Unknown speaker** [02:29 - 02:32]: So we need to understand what is causing this situation.
**Unknown speaker** [02:33 - 02:46]: So I was seeing here, I don't know your time zone when the business hours occur, but I noticed like a small pattern of increase during the days that kind of start on Wednesday, January 20th.
**Unknown speaker** [02:46 - 02:47]: I think it's Wednesday.
**Unknown speaker** [02:48 - 02:50]: No, it's actually Tuesday.
**Unknown speaker** [02:50 - 02:51]: Okay.
**Unknown speaker** [02:51 - 02:56]: That is Tending to increase the usage of CPU on the database.
**Unknown speaker** [02:56 - 03:06]: Today was not so bad as yesterday, but pretty much yesterday was not so bad as before yesterday, but it seems to have a pattern of increase.
**Unknown speaker** [03:06 - 03:15]: Okay, I was checking here between this is UTC time, so it's probably one, two hours before your time, I think.
**Unknown speaker** [03:15 - 03:20]: So I was seeing here some queries that seem to be problematic.
**Unknown speaker** [03:20 - 03:21]: Okay.
**Unknown speaker** [03:22 - 03:23]: Including this select.
**Unknown speaker** [03:23 - 03:30]: Okay is not being called a lot of times, but he has a lot of latency and it's.
**Unknown speaker** [03:30 - 03:31]: It's messing with some.
**Unknown speaker** [03:32 - 03:33]: Some.
**Unknown speaker** [03:33 - 03:36]: Some tables that I already figured out what they are.
**Unknown speaker** [03:36 - 03:37]: Let me just check here.
**Unknown speaker** [03:38 - 03:58]: So for example, this runtime exp that joins with the consultant and I was here on the database and I was checking these three tables that are involved and basically I was quite concerned with this specific table, this expert, because it has 2 million rows and the total size is almost 5 gigabytes.
**Unknown speaker** [03:58 - 04:00]: I don't know if he has binaries or something.
**Unknown speaker** [04:02 - 04:06]: Carlos, that's experiences.
**Unknown speaker** [04:06 - 04:07]: That's experiences.
**Unknown speaker** [04:08 - 04:10]: I want to have access to this.
**Unknown speaker** [04:10 - 04:10]: I need this.
**Unknown speaker** [04:10 - 04:12]: Thank you, Cristiano, for sharing.
**Unknown speaker** [04:12 - 04:14]: Can you get some kind of report.
**Unknown speaker** [04:14 - 04:23]: Can you get some kind of report that shows us the size of like all tables with records and like this total size of the table and rows.
**Unknown speaker** [04:24 - 04:25]: For all the database?
**Unknown speaker** [04:27 - 04:28]: It would be awesome.
**Unknown speaker** [04:28 - 04:29]: Or for the top.
**Unknown speaker** [04:29 - 04:31]: Yeah, I can do that for you.
**Unknown speaker** [04:31 - 04:32]: Okay.
**Unknown speaker** [04:32 - 04:34]: Maybe also to help.
**Unknown speaker** [04:34 - 04:34]: Help you.
**Unknown speaker** [04:34 - 04:36]: I think this is also coming from the.
**Unknown speaker** [04:37 - 04:37]: The.
**Unknown speaker** [04:37 - 04:38]: The same app.
**Unknown speaker** [04:38 - 04:40]: But just to make sure and to help.
**Unknown speaker** [04:40 - 04:42]: Yeah, we are just using one app.
**Unknown speaker** [04:43 - 04:44]: The tables are all.
**Unknown speaker** [04:44 - 04:45]: All in the same app.
**Unknown speaker** [04:45 - 04:46]: So.
**Unknown speaker** [04:46 - 04:48]: No, don't worry about that part too much.
**Unknown speaker** [04:48 - 04:48]: Yeah.
**Unknown speaker** [04:48 - 04:49]: Okay.
**Unknown speaker** [04:50 - 04:52]: But to help you with the identity mapping.
**Unknown speaker** [04:52 - 04:56]: So basically the exp is the ex, I assume is the experience.
**Unknown speaker** [04:57 - 04:58]: 100 experiences.
**Unknown speaker** [04:58 - 04:59]: Yeah.
**Unknown speaker** [05:00 - 05:02]: And the skill is the skill alias.
**Unknown speaker** [05:02 - 05:06]: These are the tables involved here on this query.
**Unknown speaker** [05:06 - 05:07]: Okay.
**Unknown speaker** [05:07 - 05:16]: But nevertheless, I was checking here another select that was from yesterday that also just.
**Unknown speaker** [05:17 - 05:20]: But I will grab you the top queries right away.
**Unknown speaker** [05:20 - 05:21]: Let me just check.
**Unknown speaker** [05:21 - 05:31]: Because I was actually in process of developing the component for the customers to see this directly on low code.
**Unknown speaker** [05:31 - 05:31]: Okay.
**Unknown speaker** [05:31 - 05:33]: But he's not ready yet, so.
**Unknown speaker** [05:34 - 05:37]: Because I didn't have time honestly to develop much of this.
**Unknown speaker** [05:37 - 05:38]: Oh, if this one would be ready.
**Unknown speaker** [05:38 - 05:39]: That would be awesome.
**Unknown speaker** [05:39 - 05:40]: Yeah.
**Unknown speaker** [05:41 - 05:46]: I can share with you already the query and the structure that you need to do on odc.
**Unknown speaker** [05:46 - 05:47]: Okay.
**Unknown speaker** [05:47 - 05:48]: So let me show you.
**Unknown speaker** [06:09 - 06:09]: Copy this.
**Unknown speaker** [06:10 - 06:11]: This query.
**Unknown speaker** [06:11 - 06:16]: Actually these queries that we do on Query Editor worked on Odyssey Studio.
**Unknown speaker** [06:16 - 06:28]: I don't know if you are aware, but on Odyssey you have full Access to the tables, of course, probably because you don't know what is behind you don't know what structure to use like the toast tables and so on.
**Unknown speaker** [06:29 - 06:32]: But you can perform these queries directly on ODC Studio.
**Unknown speaker** [06:32 - 06:32]: You.
**Unknown speaker** [06:32 - 06:35]: You even have permissions to truncate tables on Odyssey.
**Unknown speaker** [06:35 - 06:35]: Okay.
**Unknown speaker** [06:35 - 06:38]: So we give full liberty to the developers to.
**Unknown speaker** [06:38 - 06:39]: To perform this.
**Unknown speaker** [06:39 - 06:40]: So I assume.
**Unknown speaker** [06:41 - 06:43]: But a quick question.
**Unknown speaker** [06:43 - 06:45]: Would that run in production?
**Unknown speaker** [06:46 - 06:48]: Yes, so I would have to deploy.
**Unknown speaker** [06:48 - 06:49]: So you're saying that I can.
**Unknown speaker** [06:49 - 06:53]: I can just have some kind of this query, publish it to production and.
**Unknown speaker** [06:53 - 06:55]: Get a report and do whatever.
**Unknown speaker** [06:55 - 06:55]: Right.
**Unknown speaker** [06:55 - 07:04]: Because on odc actually what one thing is that you good and you don't need to worry about is that the table names between dev test and production are all the same.
**Unknown speaker** [07:04 - 07:07]: I don't know if you worked with O11 before for years.
**Unknown speaker** [07:07 - 07:12]: Yes, and I miss a lot of things that we used to have like database actors.
**Unknown speaker** [07:14 - 07:21]: So if you perform this query on Odyssey Studio and I can show you here, if you test the SQL, this is my tenant.
**Unknown speaker** [07:21 - 07:21]: Okay.
**Unknown speaker** [07:21 - 07:29]: But it returns no queries, but the executed SQL actually will return data.
**Unknown speaker** [07:30 - 07:37]: So if you execute this on Odyssey Studio, I suspect it will work.
**Unknown speaker** [07:44 - 07:45]: Or it should work.
**Unknown speaker** [07:47 - 07:48]: Yeah, as you can see.
**Unknown speaker** [07:49 - 07:51]: So you will have more information that you need.
**Unknown speaker** [07:51 - 07:52]: You can adapt then the query.
**Unknown speaker** [07:52 - 07:58]: I can share these with you, but you have the raw accounts index size and table size.
**Unknown speaker** [07:58 - 08:00]: Okay, Take it with a grain of.
**Unknown speaker** [08:00 - 08:12]: Salt because we always need to like we need to deploy and then again then get the report or whatever or.
**Unknown speaker** [08:12 - 08:13]: Something like a screen that shows this.
**Unknown speaker** [08:14 - 08:19]: But please on production make sure that you have authentication for not like any user can see this information.
**Unknown speaker** [08:21 - 08:23]: For this we will just create a separate app.
**Unknown speaker** [08:23 - 08:26]: For example, just perfect like an admin app.
**Unknown speaker** [08:26 - 08:31]: Or put it on our admin app and just run this in a report.
**Unknown speaker** [08:31 - 08:32]: So maybe not in our admin.
**Unknown speaker** [08:33 - 08:36]: No one should have access to this other than you.
**Unknown speaker** [08:37 - 08:38]: Yeah, no worries, no worries.
**Unknown speaker** [08:38 - 08:40]: Because this doesn't impact too much.
**Unknown speaker** [08:40 - 08:43]: It's just show the size of the tables and the information.
**Unknown speaker** [08:43 - 08:45]: But this is helpful to understand what's going on.
**Unknown speaker** [08:45 - 08:49]: But in this case, Carlos, we have an issue also with our experiences and the matching.
**Unknown speaker** [08:49 - 08:50]: Right.
**Unknown speaker** [08:51 - 08:53]: So the local dict won't help at all.
**Unknown speaker** [08:54 - 08:55]: No, no worries, we'll get there.
**Unknown speaker** [08:56 - 08:59]: Okay, so yeah, this is the query and we.
**Unknown speaker** [08:59 - 09:00]: I can show you here.
**Unknown speaker** [09:00 - 09:06]: I'm only limited to five, but as you can see you can have all the tables.
**Unknown speaker** [09:06 - 09:07]: I can like.
**Unknown speaker** [09:07 - 09:11]: I don't know how many entities you have, but I can like export this to you directly.
**Unknown speaker** [09:12 - 09:13]: Hundreds.
**Unknown speaker** [09:16 - 09:20]: Yeah, let's say, like, if it's ordered by priority 200 should be enough.
**Unknown speaker** [09:21 - 09:24]: Yeah, I can order them by what you need, like total size.
**Unknown speaker** [09:24 - 09:25]: Yeah.
**Unknown speaker** [09:25 - 09:26]: If we have the CSV, we can also reorder.
**Unknown speaker** [09:26 - 09:27]: No worries.
**Unknown speaker** [09:27 - 09:33]: If you just give us that period in an hour or so, we'll have it in production.
**Unknown speaker** [09:33 - 09:33]: It will be.
**Unknown speaker** [09:33 - 09:34]: Yeah.
**Unknown speaker** [09:34 - 09:36]: I'm gonna share our zoom.
**Unknown speaker** [09:36 - 09:37]: I'm gonna share with you on zoom.
**Unknown speaker** [09:37 - 09:39]: I cannot share it right here on the case.
**Unknown speaker** [09:39 - 09:41]: Okay, so this is a little behind the scenes.
**Unknown speaker** [09:41 - 09:41]: Okay.
**Unknown speaker** [09:41 - 09:42]: Okay.
**Unknown speaker** [09:42 - 09:42]: Okay.
**Unknown speaker** [09:43 - 09:43]: This for me.
**Unknown speaker** [09:46 - 09:47]: I. I have another question.
**Unknown speaker** [09:47 - 09:49]: Cristiano, thank you so much.
**Unknown speaker** [09:49 - 09:50]: Thank you for this one already.
**Unknown speaker** [09:51 - 09:59]: But like, the report that was shared, like what we are kind of like this helps us to know where our like, big, big, big, big issues are.
**Unknown speaker** [09:59 - 09:59]: But.
**Unknown speaker** [10:01 - 10:03]: Well, I've apologized for that.
**Unknown speaker** [10:03 - 10:04]: It was the organized.
**Unknown speaker** [10:04 - 10:08]: The organized because you have no idea where the queries are, where the queries are running or when are running.
**Unknown speaker** [10:08 - 10:09]: Okay.
**Unknown speaker** [10:09 - 10:18]: So that's why I wanted to have this call to show you the queries and extract directly the execution plans right now and provide it to you based on the metrics that we have.
**Unknown speaker** [10:18 - 10:19]: Okay.
**Unknown speaker** [10:19 - 10:21]: So yeah, I apologize for the.
**Unknown speaker** [10:21 - 10:24]: The other case that was not well addressed.
**Unknown speaker** [10:24 - 10:25]: No, but.
**Unknown speaker** [10:25 - 10:30]: So yeah, but in this case, what we need is a combination of what costs the most and runs the most often.
**Unknown speaker** [10:30 - 10:32]: We need frequency and.
**Unknown speaker** [10:32 - 10:34]: And heaviness in terms of database compute.
**Unknown speaker** [10:35 - 10:36]: Yes.
**Unknown speaker** [10:36 - 10:38]: And what time frames do you need?
**Unknown speaker** [10:38 - 10:40]: If you can tell me last, like.
**Unknown speaker** [10:40 - 10:41]: Carlos, what would you say?
**Unknown speaker** [10:41 - 10:44]: Last two weeks or like even, like.
**Unknown speaker** [10:45 - 10:50]: If you increase too much time frame without having like small time frames, you will be hiding information.
**Unknown speaker** [10:52 - 11:01]: So could you give us like the last two days and also the last two weeks, like in the different exports.
**Unknown speaker** [11:02 - 11:03]: Okay.
**Unknown speaker** [11:03 - 11:04]: For the last two weeks.
**Unknown speaker** [11:04 - 11:09]: Okay, we can see here that is that query that indeed is causing some behavior.
**Unknown speaker** [11:09 - 11:14]: And as you can see, your database was only allowed to use some active sessions until this time.
**Unknown speaker** [11:14 - 11:17]: And like the CPU needed was actually way higher.
**Unknown speaker** [11:17 - 11:24]: Okay, so you have a bottleneck between here and this dotted line, the estimated VCPUs.
**Unknown speaker** [11:24 - 11:26]: That was quite a huge difference.
**Unknown speaker** [11:26 - 11:28]: Yeah, that's a huge difference at this point.
**Unknown speaker** [11:28 - 11:28]: Yeah.
**Unknown speaker** [11:29 - 11:42]: And it was mainly caused by these two queries that I already retrieve where they are from that they are these three ones, the expert consultant and Skill Alliance.
**Unknown speaker** [11:42 - 11:45]: Okay, so these were the two main queries.
**Unknown speaker** [11:45 - 11:53]: We also have here a select that is not being called too much for second, but it's causing some load.
**Unknown speaker** [11:53 - 11:58]: But I assume the latency comes from the amount of data that these tables probably have.
**Unknown speaker** [11:59 - 12:01]: Okay, a quick question.
**Unknown speaker** [12:01 - 12:02]: Can you.
**Unknown speaker** [12:02 - 12:11]: Can you in O11 we would have the pinpoint the the space or the module and where those that query was coming from.
**Unknown speaker** [12:12 - 12:14]: Can you relate something like that in this?
**Unknown speaker** [12:14 - 12:16]: Because this is just plain SQL.
**Unknown speaker** [12:16 - 12:18]: Yeah, for that specific query.
**Unknown speaker** [12:19 - 12:20]: For that specific query.
**Unknown speaker** [12:21 - 12:21]: Okay.
**Unknown speaker** [12:21 - 12:22]: You have the application id?
**Unknown speaker** [12:22 - 12:23]: Yeah.
**Unknown speaker** [12:23 - 12:25]: I need your help here because I don't have access to your tenant.
**Unknown speaker** [12:25 - 12:32]: So I'm going to share you the application ID with you and you can cross check it open in any application and change the ID of the URL for this one.
**Unknown speaker** [12:33 - 12:35]: Yeah, but then we only know the application, right?
**Unknown speaker** [12:35 - 12:36]: We don't know where it is located.
**Unknown speaker** [12:36 - 12:37]: Like our.
**Unknown speaker** [12:37 - 12:40]: We are more operating on a monolith lit.
**Unknown speaker** [12:40 - 12:41]: Mostly.
**Unknown speaker** [12:44 - 12:47]: The calls from from these queries all come from the same application.
**Unknown speaker** [12:47 - 12:51]: So I assume it should not be hard to find inside the application.
**Unknown speaker** [12:54 - 13:00]: I'm not too old in the project, so I do struggle to find because there are I would say thousands of queries.
**Unknown speaker** [13:00 - 13:03]: I do struggle sometimes to find where things are.
**Unknown speaker** [13:05 - 13:06]: Lack of experience of.
**Unknown speaker** [13:06 - 13:07]: Of myself.
**Unknown speaker** [13:07 - 13:08]: But I, I.
**Unknown speaker** [13:08 - 13:10]: You can tell that you are not able to to do that relation.
**Unknown speaker** [13:10 - 13:11]: So we left.
**Unknown speaker** [13:11 - 13:12]: No, no, we cannot do that relation.
**Unknown speaker** [13:12 - 13:13]: No.
**Unknown speaker** [13:13 - 13:14]: Okay.
**Unknown speaker** [13:14 - 13:14]: Okay.
**Unknown speaker** [13:14 - 13:14]: But.
**Unknown speaker** [13:14 - 13:16]: But if you can provide us this one.
**Unknown speaker** [13:16 - 13:19]: This is better than the thing in the exit because this one is cleaned up.
**Unknown speaker** [13:20 - 13:21]: Yes.
**Unknown speaker** [13:21 - 13:22]: I can provide you the queries.
**Unknown speaker** [13:22 - 13:23]: For example, for.
**Unknown speaker** [13:23 - 13:25]: Let me provide you the top three ones.
**Unknown speaker** [13:25 - 13:25]: Okay.
**Unknown speaker** [13:25 - 13:26]: Let me.
**Unknown speaker** [13:26 - 13:26]: Or.
**Unknown speaker** [13:26 - 13:27]: Or even top 10.
**Unknown speaker** [13:29 - 13:29]: Top 10.
**Unknown speaker** [13:29 - 13:36]: Maybe you will receive some information that probably it doesn't.
**Unknown speaker** [13:36 - 13:37]: No, top three.
**Unknown speaker** [13:37 - 13:37]: Top three.
**Unknown speaker** [13:37 - 13:40]: You're right, the top three like.
**Unknown speaker** [13:43 - 13:44]: Just put here.
**Unknown speaker** [13:55 - 13:56]: If needed.
**Unknown speaker** [13:56 - 13:59]: We can also open the module and try to find them here on call.
**Unknown speaker** [13:59 - 13:59]: Okay.
**Unknown speaker** [13:59 - 14:01]: Because we have the SQL.
**Unknown speaker** [14:01 - 14:03]: If we, if we search by the.
**Unknown speaker** [14:03 - 14:06]: The pattern and the joints that we have, we might be able to.
**Unknown speaker** [14:07 - 14:10]: I think we will try it first to save you some time.
**Unknown speaker** [14:10 - 14:12]: Cristiano, maybe we need to jump on another call.
**Unknown speaker** [14:12 - 14:14]: But this is already super, super helpful.
**Unknown speaker** [14:14 - 14:15]: Thank you.
**Unknown speaker** [14:20 - 14:23]: As we would expect, it's consulting core that has the query.
**Unknown speaker** [14:24 - 14:24]: Yes, sure.
**Unknown speaker** [14:24 - 14:25]: Back end.
**Unknown speaker** [14:25 - 14:26]: So.
**Unknown speaker** [14:29 - 14:31]: Now that we have the queries, let me just check.
**Unknown speaker** [14:32 - 14:34]: I have all the tables here.
**Unknown speaker** [14:35 - 14:44]: So from his expert and inner joins consultant from Skill, Alice from Ramita and Skill Alliance.
**Unknown speaker** [14:45 - 14:47]: He does join with Skill.
**Unknown speaker** [14:47 - 14:49]: So these are two different tables.
**Unknown speaker** [14:50 - 14:52]: Skill in Skill Alliance.
**Unknown speaker** [14:52 - 14:52]: Yes.
**Unknown speaker** [14:52 - 14:53]: Yeah, we have two.
**Unknown speaker** [14:54 - 14:57]: I don't know what is the Skill alliance because the name is too similar.
**Unknown speaker** [14:57 - 15:06]: But let me just have here another course so you can have the tables and then I will retrieve also the execution plans for these specific ones.
**Unknown speaker** [15:06 - 15:07]: Okay.
**Unknown speaker** [15:07 - 15:10]: There is a chance that there are no execution tables.
**Unknown speaker** [15:10 - 15:14]: Depending on the query cost, but we will see in a minute.
**Unknown speaker** [15:15 - 15:17]: So I have skill IZ7.
**Unknown speaker** [15:18 - 15:23]: This is the one, but I'm missing it.
**Unknown speaker** [15:23 - 15:24]: Finish on 97.
**Unknown speaker** [15:25 - 15:26]: I'm missing this one.
**Unknown speaker** [15:26 - 15:26]: Okay.
**Unknown speaker** [15:40 - 15:42]: And export this to cva.
**Unknown speaker** [15:52 - 15:54]: I have another question, Cristiano.
**Unknown speaker** [15:57 - 15:57]: If we.
**Unknown speaker** [15:57 - 16:10]: Because like some of these entities are so huge because we store like massive JSON strings there and we are moving them currently to S3 to get rid of them in the database.
**Unknown speaker** [16:10 - 16:17]: The question is we know already when we delete an attribute in ODC that does not get deleted in the database.
**Unknown speaker** [16:17 - 16:20]: Like what do we need to do to really ensure.
**Unknown speaker** [16:20 - 16:24]: When we say okay, we have cleaned everything up, we know that we don't need this attribute anymore.
**Unknown speaker** [16:24 - 16:29]: Now let's get really rid of it to really free up the database space.
**Unknown speaker** [16:29 - 16:31]: You can trocate the table directly.
**Unknown speaker** [16:33 - 16:34]: Okay, Carlos, you can do this, right?
**Unknown speaker** [16:36 - 16:39]: There is a SQL command just to remove the column.
**Unknown speaker** [16:39 - 16:42]: I was not aware that we have permissions to do that Crusader.
**Unknown speaker** [16:42 - 16:44]: But we can take care of it.
**Unknown speaker** [16:45 - 16:48]: You can basically truncate any table.
**Unknown speaker** [16:48 - 16:50]: So let me see, because I will.
**Unknown speaker** [16:50 - 16:53]: Right, but truncate will delete all the record.
**Unknown speaker** [16:53 - 16:59]: In this case we just want to delete a column, but it would be just a different simple command.
**Unknown speaker** [16:59 - 17:01]: Yeah, basically the column will never be deleted.
**Unknown speaker** [17:01 - 17:03]: It will be like in a state of inactive.
**Unknown speaker** [17:03 - 17:11]: Okay, but the most important is delete the content of the table for not using the space or any other thing.
**Unknown speaker** [17:11 - 17:15]: Okay, can't we really remove the column?
**Unknown speaker** [17:16 - 17:23]: If you remove it, it will be renamed in the back scenes like to proper.
**Unknown speaker** [17:24 - 17:25]: This is to avoid.
**Unknown speaker** [17:25 - 17:32]: Basically it renames the column for a specific name and if you put the entity again with the same name, it will use that entity.
**Unknown speaker** [17:33 - 17:38]: This is to avoid on production to delete attributes the entities that you need.
**Unknown speaker** [17:38 - 17:42]: Because we have a lot of customers that delete entities and then they could retrieve the data.
**Unknown speaker** [17:43 - 17:43]: So we.
**Unknown speaker** [17:46 - 17:48]: Force to delete.
**Unknown speaker** [17:48 - 17:48]: To delete it.
**Unknown speaker** [17:48 - 17:50]: No, no.
**Unknown speaker** [17:51 - 17:54]: With alter table or not with alter table?
**Unknown speaker** [17:54 - 17:55]: No, no, no, no.
**Unknown speaker** [17:55 - 17:59]: Okay, so we need to clone the table and migrate everything.
**Unknown speaker** [18:00 - 18:03]: Now if you delete all the records.
**Unknown speaker** [18:03 - 18:07]: So if you blank all the column, it will behave pretty much the same.
**Unknown speaker** [18:07 - 18:09]: Wouldn't be a big deal.
**Unknown speaker** [18:09 - 18:10]: Okay.
**Unknown speaker** [18:10 - 18:11]: Okay.
**Unknown speaker** [18:11 - 18:12]: Ah, fair.
**Unknown speaker** [18:12 - 18:14]: Are we just thinking.
**Unknown speaker** [18:14 - 18:15]: Let me just cross check.
**Unknown speaker** [18:16 - 18:18]: Because I think you can do this the truncate.
**Unknown speaker** [18:18 - 18:20]: Because I remember that you can.
**Unknown speaker** [18:30 - 18:32]: So if you truncate.
**Unknown speaker** [18:32 - 18:32]: Let me see.
**Unknown speaker** [18:32 - 18:33]: I think he.
**Unknown speaker** [18:43 - 18:46]: You know that you are working on the most important project.
**Unknown speaker** [18:46 - 18:48]: This admin thing will be awesome for this.
**Unknown speaker** [18:49 - 18:49]: Yeah, but.
**Unknown speaker** [18:49 - 18:50]: But I'm.
**Unknown speaker** [18:50 - 18:52]: But I don't have many time.
**Unknown speaker** [18:53 - 18:56]: That is the problem to.
**Unknown speaker** [18:56 - 19:01]: To who we need to talk to to free up your time because this tool is missing for a long time.
**Unknown speaker** [19:02 - 19:03]: So if you.
**Unknown speaker** [19:05 - 19:06]: Sorry.
**Unknown speaker** [19:14 - 19:23]: So if you press truncate, basically truncates the table, It will clean.
**Unknown speaker** [19:31 - 19:33]: As you can see, it completely cleans the table.
**Unknown speaker** [19:33 - 19:38]: So you can directly truncate tables directly to clean data.
**Unknown speaker** [19:41 - 19:45]: I'm not sure if we will be able to do that because we don't.
**Unknown speaker** [19:45 - 19:48]: I don't think there is a table that we want to delete all the records.
**Unknown speaker** [19:48 - 19:52]: So we'll always have to use some where clauses to keep some of the data.
**Unknown speaker** [19:52 - 19:55]: But I think it helps to understand that you can do it.
**Unknown speaker** [19:55 - 20:01]: I would recommend it to have like a back office app and deploy it to production.
**Unknown speaker** [20:01 - 20:05]: Like to see and to clean old records and all the old things.
**Unknown speaker** [20:05 - 20:06]: Like to do some like.
**Unknown speaker** [20:08 - 20:09]: How do you say in English.
**Unknown speaker** [20:12 - 20:14]: In Portuguese if you were housekeeping?
**Unknown speaker** [20:14 - 20:15]: Yeah.
**Unknown speaker** [20:15 - 20:15]: Task keeping?
**Unknown speaker** [20:15 - 20:16]: Basically.
**Unknown speaker** [20:16 - 20:16]: Yeah.
**Unknown speaker** [20:16 - 20:17]: From the tables.
**Unknown speaker** [20:18 - 20:19]: Sure, sure.
**Unknown speaker** [20:19 - 20:24]: So we have some archiving mechanisms and we have a few things that we found in.
**Unknown speaker** [20:24 - 20:28]: Some of the tables have huge column sizes and that's not very performant.
**Unknown speaker** [20:28 - 20:36]: But the main thing is until now we were not aware of in production what was the size of the table.
**Unknown speaker** [20:36 - 20:38]: So that's a huge thing for us right now.
**Unknown speaker** [20:41 - 20:47]: And that also what you showed, like Cristiano, the one that you showed the top three most expensive queries.
**Unknown speaker** [20:47 - 20:51]: It's basically from the dashboard that you were showing.
**Unknown speaker** [20:51 - 20:56]: It's basically showing that due to these, we.
**Unknown speaker** [20:56 - 20:58]: We did run into these spikes.
**Unknown speaker** [20:58 - 20:59]: Everything else was not the issue.
**Unknown speaker** [20:59 - 21:04]: So if we get rid of these or improve these, we should.
**Unknown speaker** [21:04 - 21:16]: Yes, you should be able to have more CPU for the other remaining queries because basically what seems to be happening is that these queries are loading the CPU a lot and they were actually consuming.
**Unknown speaker** [21:17 - 21:20]: Let me just put you here on the last two days.
**Unknown speaker** [21:22 - 21:24]: They were consuming all the memory.
**Unknown speaker** [21:24 - 21:27]: You probably are having more swap.
**Unknown speaker** [21:27 - 21:29]: And having more swap means more cpu.
**Unknown speaker** [21:29 - 21:32]: More CPU means a lot more latency.
**Unknown speaker** [21:32 - 21:34]: And as you can see, your CPU is completely bottlenecked.
**Unknown speaker** [21:35 - 21:40]: There's no way that we can also get access to these Grafana dashboards or anything like that stuff, right?
**Unknown speaker** [21:40 - 21:41]: No, unfortunately, no.
**Unknown speaker** [21:41 - 21:50]: But we can keep the case open and every time you need help you perform some task, you ask us directly and I can share with you these dashboards.
**Unknown speaker** [21:50 - 21:51]: Okay, that's perfect.
**Unknown speaker** [21:52 - 22:02]: Unfortunately, we have an already RPM and we are talking with the R and D team because we want to put this on Odyssey Portal directly instead of only app analytics.
**Unknown speaker** [22:02 - 22:02]: Okay.
**Unknown speaker** [22:05 - 22:11]: This is already being discussed by around two, three months and we are receiving a lot of customer complaints.
**Unknown speaker** [22:11 - 22:16]: And what I can ask you for that is like open a case and say we need this.
**Unknown speaker** [22:16 - 22:19]: And so to make some pressure on product management to have this.
**Unknown speaker** [22:19 - 22:21]: Okay, perfect.
**Unknown speaker** [22:21 - 22:26]: As a developer, Cristiano, you know that Odyssey misses a lot of this detailed information.
**Unknown speaker** [22:26 - 22:28]: So we really need to troubleshoot something.
**Unknown speaker** [22:29 - 22:33]: Analytics is cool to show to the CEO, but we really need details.
**Unknown speaker** [22:33 - 22:34]: So.
**Unknown speaker** [22:34 - 22:36]: Yeah, yeah.
**Unknown speaker** [22:36 - 22:39]: And since we don't have access to the database.
**Unknown speaker** [22:39 - 22:41]: So in O11 we'll solve this some.
**Unknown speaker** [22:41 - 22:42]: A lot of times because we have.
**Unknown speaker** [22:42 - 22:45]: Full access to the database, they'll find these things.
**Unknown speaker** [22:45 - 22:46]: So this is just.
**Unknown speaker** [22:46 - 22:52]: And, and the dashboards where we can see the compute usage are like basically a joke, honestly speaking.
**Unknown speaker** [22:52 - 22:52]: Right?
**Unknown speaker** [22:53 - 22:55]: Yeah, yeah.
**Unknown speaker** [22:55 - 22:57]: Because the usage is not what we are seeing here.
**Unknown speaker** [22:57 - 23:02]: It's basically what like licensing allows you to consume.
**Unknown speaker** [23:02 - 23:03]: So it's not.
**Unknown speaker** [23:03 - 23:08]: It's not like you cannot correlate what you have on the subscription with this.
**Unknown speaker** [23:08 - 23:09]: So.
**Unknown speaker** [23:09 - 23:18]: Yeah, yeah, I know that is a handicap that, that we have and unfortunately I cannot give you a better.
**Unknown speaker** [23:19 - 23:21]: Okay, cool.
**Unknown speaker** [23:22 - 23:24]: But this already helps like a lot.
**Unknown speaker** [23:24 - 23:36]: So our next task will be like to approach or approach these things that you were just showing us here because we were already assuming, but we were like in this case looking at the wrong places.
**Unknown speaker** [23:37 - 23:46]: What I'm going to try to show you now is the direct execution plans of these queries and not just like a big documentation with a big.
**Unknown speaker** [23:46 - 23:48]: Txt file with the.
**Unknown speaker** [23:48 - 23:50]: With the queries and not having.
**Unknown speaker** [23:55 - 24:00]: Unfortunately I need to put that.
**Unknown speaker** [24:00 - 24:01]: Yeah, it makes sense.
**Unknown speaker** [24:01 - 24:31]: So it's 21, So I might need some time because now I need to figure it out what are the queries comparing the 113 performance inside.
**Unknown speaker** [24:35 - 24:38]: Which ID so I can try to find it by.
**Unknown speaker** [25:08 - 25:08]: Yeah.
**Unknown speaker** [25:09 - 25:18]: So as I suspected, like these queries, the query pan is not being generated most likely because the query cost is low.
**Unknown speaker** [25:19 - 25:23]: But the amount of data on these tables most likely is creating the issue.
**Unknown speaker** [25:27 - 25:27]: Yeah.
**Unknown speaker** [25:27 - 25:34]: Because unfortunately we only generate execution plans above 1000 and this query is not present here.
**Unknown speaker** [25:34 - 25:35]: Not this one.
**Unknown speaker** [25:40 - 25:44]: And I don't think this is the one because this one left join with skill.
**Unknown speaker** [25:48 - 25:50]: I think that's the matching colors.
**Unknown speaker** [25:53 - 25:54]: This one is another one.
**Unknown speaker** [25:56 - 25:57]: That does.
**Unknown speaker** [25:57 - 25:58]: A lot of joins.
**Unknown speaker** [25:58 - 26:00]: Yeah, yeah, we love joins.
**Unknown speaker** [26:01 - 26:01]: Yes.
**Unknown speaker** [26:01 - 26:04]: So I think he has like four or five tables with joints.
**Unknown speaker** [26:05 - 26:09]: Four, like our average aggregate has four or five joints.
**Unknown speaker** [26:09 - 26:10]: Okay.
**Unknown speaker** [26:11 - 26:13]: Oh, we have some with 20.
**Unknown speaker** [26:13 - 26:16]: So yeah, this is not the one.
**Unknown speaker** [26:18 - 26:19]: No worries.
**Unknown speaker** [26:19 - 26:26]: But I got some information already that is we have 25 million records on the experience table party.
**Unknown speaker** [26:26 - 26:28]: I think that's a surprise.
**Unknown speaker** [26:28 - 26:29]: At least for me it's a surprise.
**Unknown speaker** [26:29 - 26:32]: I was not expecting that huge volume.
**Unknown speaker** [26:32 - 26:33]: Yeah, me too.
**Unknown speaker** [26:34 - 26:36]: Let's see what we find more in the production data.
**Unknown speaker** [26:36 - 26:44]: But if we have 25 millions there and then we are doing the matching and query against all these, it's kind of obvious that this is an issue, right?
**Unknown speaker** [26:45 - 26:46]: Yeah, 25 million.
**Unknown speaker** [26:48 - 26:54]: And depending on where you are doing the joins and the order of indexes, it does a lot of cost.
**Unknown speaker** [26:54 - 26:54]: Okay.
**Unknown speaker** [26:55 - 27:03]: So I don't know if, I don't know what is the aggregate but if you can cross check if you add index and this the index order, it's heavily, heavily important.
**Unknown speaker** [27:04 - 27:04]: Okay.
**Unknown speaker** [27:05 - 27:09]: During the joins when you join the tables, the index order is really important.
**Unknown speaker** [27:10 - 27:11]: I can try to share with you.
**Unknown speaker** [27:11 - 27:14]: I need just to stop the share because it's on a Slack thread.
**Unknown speaker** [27:14 - 27:17]: So I cannot show you direct the conversation.
**Unknown speaker** [27:17 - 27:22]: But let me just cross check because I have an amazing documentation regarding that.
**Unknown speaker** [27:23 - 27:24]: Okay, thank you.
**Unknown speaker** [27:35 - 27:44]: Carlos, do you think like that we in this case we need to consider if we move the matching completely away from.
**Unknown speaker** [27:44 - 27:45]: From, from.
**Unknown speaker** [27:46 - 27:47]: But we need SQL there, right?
**Unknown speaker** [27:48 - 27:50]: Yes, there, you got it.
**Unknown speaker** [27:50 - 27:59]: So first we'll go through the skills and see if there are like old skills that can delete.
**Unknown speaker** [27:59 - 28:01]: So if we can reduce the size of the table somehow.
**Unknown speaker** [28:02 - 28:03]: Let's talk about tips.
**Unknown speaker** [28:03 - 28:04]: But in the experience.
**Unknown speaker** [28:06 - 28:10]: But you have skills and you have role there from what I've seen.
**Unknown speaker** [28:10 - 28:12]: So we probably can separate and have two different.
**Unknown speaker** [28:13 - 28:26]: And that will be like a hard index because it will have two tables for example but we'll get there and the skill allies is also one of the ones that's causing the issue.
**Unknown speaker** [28:26 - 28:28]: So all that cross together.
**Unknown speaker** [28:30 - 28:32]: So yeah, I'm going to share here also on zoom.
**Unknown speaker** [28:33 - 28:35]: So when you sort of.
**Unknown speaker** [28:36 - 28:37]: Sorry, not this one.
**Unknown speaker** [28:44 - 29:08]: So basically when you have indexes and you are ordering and I know this because a customer a few weeks ago had a query that was raising major concerns and because they were using an index on the wrong order before the join, the query completely overlapped the database after just changing the order index.
**Unknown speaker** [29:08 - 29:17]: So if you want to use the index on just before on the where before a group buy or having an order, it will make a huge difference.
**Unknown speaker** [29:17 - 29:21]: So I will cross check if the index are created and what is the order.
**Unknown speaker** [29:21 - 29:21]: Okay.
**Unknown speaker** [29:21 - 29:26]: I'm not like an SQL expert but this made a huge difference on queries.
**Unknown speaker** [29:29 - 29:29]: Okay.
**Unknown speaker** [29:32 - 29:38]: Nevertheless what I'm going to try to do based on those three tip top queries off the ground of the call.
**Unknown speaker** [29:38 - 29:44]: I'm going to try to extract the direct execution plans and I'm going to try to find them in the logic.
**Unknown speaker** [29:44 - 29:50]: I will not promise to have this information because I don't know the logic itself, but I will try to find them and share with you.
**Unknown speaker** [29:50 - 29:51]: Okay, perfect.
**Unknown speaker** [29:51 - 29:52]: Cristiano, I have one more question.
**Unknown speaker** [29:52 - 29:53]: Thank you.
**Unknown speaker** [29:53 - 29:55]: Already really, really helpful.
**Unknown speaker** [29:55 - 30:01]: Like when we are running one of these queries, for example, that takes so much compute.
**Unknown speaker** [30:04 - 30:14]: Then because we do spike so much over, we get like kind of throttled for the next time so that we are then hitting like, like I don't even really know.
**Unknown speaker** [30:14 - 30:30]: Like is it like when there's a query that's really costly, like we have issues with this query or due to the costs, like Even after the 30 seconds this query did run through, we still have impact in our production for the rest of the time because we have this issue that we.
**Unknown speaker** [30:31 - 30:33]: Yes, yes, you will have, you will have.
**Unknown speaker** [30:33 - 30:43]: Because if a query is already creating constraints and if you have small queries that are trying to run against the same tables, most likely you will run into locks.
**Unknown speaker** [30:43 - 30:48]: Because during those we maximize this 30 seconds timeout.
**Unknown speaker** [30:48 - 30:53]: But I don't know the timeout that you have on your site for the queries.
**Unknown speaker** [30:53 - 30:58]: But if these queries are overlapping the database and is already surpassing the limit.
**Unknown speaker** [30:58 - 31:04]: If you have other queries that even they are small, since the database is shared, most likely it will be affected.
**Unknown speaker** [31:04 - 31:06]: It will be like a snowball.
**Unknown speaker** [31:06 - 31:10]: You are creating one, you are like having a query that is overlapping the database.
**Unknown speaker** [31:10 - 31:16]: If you have another query that is even using another table, it will be affected.
**Unknown speaker** [31:16 - 31:19]: And if he's using the same table, most likely it will lock.
**Unknown speaker** [31:19 - 31:29]: So you will have locks and then we will have timeouts because of those locks and because the query didn't able to fetch the Data in the 60 seconds timeout, basically.
**Unknown speaker** [31:30 - 31:34]: So it will be a snowball effect for all the entire applications.
**Unknown speaker** [31:36 - 31:38]: How long can the snowball effect can go?
**Unknown speaker** [31:40 - 31:47]: It depends how much these queries are trying to run and how much time they were retrying from the end users.
**Unknown speaker** [31:47 - 31:57]: If you have like a screen that you are fetching like data and always performs the same query until it reaches timeout, it will run.
**Unknown speaker** [31:57 - 32:05]: Imagine like 2000 users using the same query for that amount of time the database will be completely overload.
**Unknown speaker** [32:05 - 32:06]: But maybe like it will depend a.
**Unknown speaker** [32:06 - 32:09]: Little on the logic on how the queries are used.
**Unknown speaker** [32:11 - 32:23]: So, okay, okay, so if that query that we are talking about is using, but like if I'm the user, I'm clicking on the.
**Unknown speaker** [32:23 - 32:23]: On.
**Unknown speaker** [32:23 - 32:24]: On the.
**Unknown speaker** [32:24 - 32:27]: On the action that's triggering the query and it's triggering.
**Unknown speaker** [32:27 - 32:31]: Just for 60 seconds and then I'm done and I'm not using it anymore.
**Unknown speaker** [32:31 - 32:40]: Might it be that still like due to the 60 seconds and things happening meanwhile that want to access the same kind of tables and so on?
**Unknown speaker** [32:41 - 32:45]: Like we still have issues like two hours later due to a 60 seconds query?
**Unknown speaker** [32:47 - 32:47]: No, that.
**Unknown speaker** [32:47 - 32:48]: That will not.
**Unknown speaker** [32:48 - 32:49]: That's unrealistic, right?
**Unknown speaker** [32:49 - 32:50]: No, no, no.
**Unknown speaker** [32:50 - 32:51]: It will be.
**Unknown speaker** [32:52 - 32:54]: Will be a few minutes only constant.
**Unknown speaker** [32:54 - 32:59]: Because if that query stops, all the other small ones will start running afterwards.
**Unknown speaker** [32:59 - 33:00]: If they won't time out before.
**Unknown speaker** [33:00 - 33:01]: Before that.
**Unknown speaker** [33:01 - 33:03]: So it's like a minute or two.
**Unknown speaker** [33:03 - 33:09]: The problem is if we repeat the query or another heavy one and you repeat the pattern.
**Unknown speaker** [33:09 - 33:10]: That's the problem.
**Unknown speaker** [33:11 - 33:11]: Mm.
**Unknown speaker** [33:12 - 33:12]: Okay.
**Unknown speaker** [33:13 - 33:14]: Yeah, we have.
**Unknown speaker** [33:14 - 33:20]: We have a better approach here because as you know, on Odyssey, you cannot like run a query for like two or three days.
**Unknown speaker** [33:20 - 33:27]: Like we used to see on O11 that you have like hanging process on IIS trying to query the database here.
**Unknown speaker** [33:27 - 33:31]: Basically the max time you can run the query is 60 seconds.
**Unknown speaker** [33:31 - 33:31]: Okay.
**Unknown speaker** [33:31 - 33:35]: And unless you are running via timer, that has a huge timeout.
**Unknown speaker** [33:35 - 33:35]: Okay.
**Unknown speaker** [33:35 - 33:39]: I don't know if that is the case if you are running timers with big queries.
**Unknown speaker** [33:40 - 33:47]: But nevertheless, we always hard cap the queries just to avoid those issues even further, like we had in the past.
**Unknown speaker** [33:48 - 33:50]: Tod, thank you for clarifying.
**Unknown speaker** [33:51 - 33:57]: And R and D. And I can tell you that R and D considers that a query that takes more than 60 seconds to run.
**Unknown speaker** [33:58 - 34:00]: It's not a query, it's something else.
**Unknown speaker** [34:01 - 34:03]: And they will not change this pattern.
**Unknown speaker** [34:04 - 34:05]: With the 60 seconds.
**Unknown speaker** [34:05 - 34:07]: I think we are more than okay.
**Unknown speaker** [34:08 - 34:13]: We struggle in just sharing about some Odyssey struggles with the web screens or.
**Unknown speaker** [34:13 - 34:16]: The event calls, because we are doing.
**Unknown speaker** [34:16 - 34:22]: Calls to LLMs that sometimes takes more than the two minutes that's a problem on the queries itself.
**Unknown speaker** [34:22 - 34:24]: We normally can optimize that.
**Unknown speaker** [34:24 - 34:27]: Let me just ask one thing, Carlos and Konstantin.
**Unknown speaker** [34:27 - 34:34]: These queries have input parameters that change a lot or the parameters are very similar.
**Unknown speaker** [34:35 - 34:39]: In this case, I don't think that we can cache it if it's the matching that we were talking about.
**Unknown speaker** [34:39 - 34:40]: Yeah, that's my idea.
**Unknown speaker** [34:40 - 34:42]: Yeah, it's impossible.
**Unknown speaker** [34:42 - 34:49]: We have been having cache in a lot of places, but we are still figuring out where are other bottlenecks.
**Unknown speaker** [34:49 - 34:52]: So this is another step in the right direction.
**Unknown speaker** [34:53 - 34:53]: Also.
**Unknown speaker** [34:53 - 35:06]: Also another suggestion if you are open is that I don't know, but normally there are customers that tend to perform these queries on loading screens, just show the plain information when the screen is loaded.
**Unknown speaker** [35:07 - 35:13]: If that's the case, can you consider, for example, only show this information when the user explicitly needs this information.
**Unknown speaker** [35:13 - 35:20]: Like a button to show the table instead of showing like I've seen cases where customers perform these queries, like.
**Unknown speaker** [35:22 - 35:28]: Maybe Cristiano, to give you a little bit more context, like what we are building a solution for consultancies.
**Unknown speaker** [35:29 - 35:36]: And these consultancies store their consultants in the database and the client requests.
**Unknown speaker** [35:36 - 35:41]: And what we do is like, each consultant has like engagements, like projects he worked in.
**Unknown speaker** [35:41 - 35:44]: And based on the projects he has like roles and skills.
**Unknown speaker** [35:44 - 35:49]: And based on these roles and skills, we kind of calculate the experiences in total.
**Unknown speaker** [35:49 - 35:54]: Like how many years of experience does a consultant have in a certain role, in a certain skill and so on.
**Unknown speaker** [35:54 - 36:03]: And so then, and this we store in the experiences table and there we have like, let's say 3 to 500 entries per consultant.
**Unknown speaker** [36:04 - 36:07]: And what's kind of heavy, because we have 15,000 consultants, for example.
**Unknown speaker** [36:07 - 36:12]: And then three to 500 entries per consultant for experiences is quite massive.
**Unknown speaker** [36:12 - 36:16]: And when we are extracting a client request, we are doing the same thing.
**Unknown speaker** [36:16 - 36:21]: We are basically extracting, okay, what roles and skills in what level is the client looking for?
**Unknown speaker** [36:22 - 36:34]: And when we get, then go to the matching, we are basically comparing these client requirements, like each role and each skill, like let's say 15 or so within the demand that the client is requesting.
**Unknown speaker** [36:34 - 36:39]: Like for each of them, how big is the matching of the consultant to that?
**Unknown speaker** [36:39 - 36:43]: And then we weigh this with a certain weight and calculate a total matching score.
**Unknown speaker** [36:43 - 36:47]: And we do this for 50 consultants at a time or so.
**Unknown speaker** [36:47 - 36:50]: When you open the matching screen because you want to see your top matches.
**Unknown speaker** [36:50 - 36:57]: So you see we have with very huge tables, very huge joins to calculate these matching scores on the fly.
**Unknown speaker** [36:57 - 37:01]: And then they are setting filters and searching through the matchings and so on.
**Unknown speaker** [37:01 - 37:03]: So yeah, yeah, so catching is out.
**Unknown speaker** [37:03 - 37:05]: Of the table, caching is.
**Unknown speaker** [37:05 - 37:07]: Yeah, caching is off the table.
**Unknown speaker** [37:07 - 37:15]: Like Carlos mentioned, maybe we need to completely switch the technology and go to open elasticsearch or so here or I don't know, it's not my specialty.
**Unknown speaker** [37:18 - 37:18]: Database.
**Unknown speaker** [37:18 - 37:22]: For some of these evil with data fabric, you have data fabric on Odyssey.
**Unknown speaker** [37:22 - 37:32]: So if some of this information can be out, some of these more heavy tables can be outside of the internal database of ODC and on an external database.
**Unknown speaker** [37:32 - 37:36]: On an external database, for example, it might help.
**Unknown speaker** [37:36 - 37:48]: It might help because then you will, you will not have a bottleneck that will affect your application slowness, but it only basically you Will put the load outside of the internal database.
**Unknown speaker** [37:49 - 37:52]: Okay, I have another question regarding database scaling.
**Unknown speaker** [37:55 - 37:57]: Just rough benchmark.
**Unknown speaker** [37:57 - 38:00]: We can do the math by ourselves as soon as we have the offer from accounting.
**Unknown speaker** [38:00 - 38:12]: But when we compare like just paying ODC for our outsystems for more database computer versus we buy this database compute for ourselves for this specific use case in aws.
**Unknown speaker** [38:12 - 38:16]: Like what is the markup roughly, just roughly that we have an idea.
**Unknown speaker** [38:16 - 38:22]: Is it like just 20, 30% or the 2 to 3 XO that we always should go with AWS for these very specific things.
**Unknown speaker** [38:24 - 38:25]: Sorry, I didn't understand.
**Unknown speaker** [38:26 - 38:29]: Constantine, you are asking the price of this scale up.
**Unknown speaker** [38:30 - 38:32]: It's like what is our.
**Unknown speaker** [38:33 - 38:35]: Yeah, like if.
**Unknown speaker** [38:35 - 38:41]: If we have one certain action like these experiences and matching where we need very heavy databases.
**Unknown speaker** [38:41 - 38:42]: Right.
**Unknown speaker** [38:44 - 38:49]: Does it make sense from a economic perspective for us to just move this to.
**Unknown speaker** [38:49 - 38:58]: To AWS and to another technology of database or whatever and then just manage the infrastructure by ourselves?
**Unknown speaker** [38:58 - 39:05]: Or could we just scale up our outsystems database compute by like for example 4x that we don't run into like.
**Unknown speaker** [39:06 - 39:09]: Like, you know, so you, you, you, you.
**Unknown speaker** [39:09 - 39:13]: Well, moving outside of hot systems, I. I don't.
**Unknown speaker** [39:13 - 39:18]: But you are still using ODC but outside of aws.
**Unknown speaker** [39:18 - 39:19]: Is that what you say?
**Unknown speaker** [39:19 - 39:19]: It's like.
**Unknown speaker** [39:19 - 39:19]: Yeah, we are.
**Unknown speaker** [39:19 - 39:22]: We are still fully using ODC obviously for everything.
**Unknown speaker** [39:22 - 39:24]: But just these specific parts that you're mentioning.
**Unknown speaker** [39:25 - 39:40]: Like would be your recommendation in terms of infrastructure to really separate this from our whole app and all the logic and run this in dedicated databases and compute that we are specifically optimizing for this?
**Unknown speaker** [39:42 - 39:49]: Honestly, my opinion is hard to tell you Constantine, because I don't know the full development and so on.
**Unknown speaker** [39:49 - 39:50]: Okay.
**Unknown speaker** [39:50 - 39:51]: What we.
**Unknown speaker** [39:51 - 39:56]: We tend to to say is that the database if.
**Unknown speaker** [39:56 - 39:59]: If we further scale up it can hold all the.
**Unknown speaker** [39:59 - 40:00]: All the.
**Unknown speaker** [40:00 - 40:00]: All the load.
**Unknown speaker** [40:00 - 40:03]: Because this can even be further scale up until.
**Unknown speaker** [40:03 - 40:05]: Well, the sky is the limit basically.
**Unknown speaker** [40:05 - 40:06]: But the cost is not.
**Unknown speaker** [40:06 - 40:09]: Okay, yeah, yeah, that's like the question.
**Unknown speaker** [40:09 - 40:14]: I think what a surprise performance that we get versus versus Just like.
**Unknown speaker** [40:14 - 40:17]: Because like you know, sometimes it's more efficient to scale up.
**Unknown speaker** [40:17 - 40:23]: One thing's more specifically only pay for that one thing in AWS and scaling up the whole outsystems infrastructure.
**Unknown speaker** [40:23 - 40:24]: Right?
**Unknown speaker** [40:24 - 40:24]: Sure.
**Unknown speaker** [40:25 - 40:26]: Yes.
**Unknown speaker** [40:26 - 40:36]: Depending if you analyze that these tables need to have indeed such amount of information and the queries cannot be further improved.
**Unknown speaker** [40:36 - 40:40]: And you see that the performance is not wise.
**Unknown speaker** [40:42 - 40:48]: That's why we have data fabric to move some out of the data of ODC for not affecting all the infrastructure.
**Unknown speaker** [40:48 - 40:51]: Okay, but I assume on.
**Unknown speaker** [40:51 - 41:01]: On this specific case, I think with improvements on the queries and logic itself, I think you can manage this pro.
**Unknown speaker** [41:01 - 41:05]: I don't know if with the original database like, like, like.
**Unknown speaker** [41:05 - 41:11]: Cristiano, just to give you an idea for sure we have some in some bad performance, right.
**Unknown speaker** [41:11 - 41:20]: And we can optimize things but in general like where we are currently with our users and where we want to be at the end of the year is like at least 10x more.
**Unknown speaker** [41:22 - 41:25]: So, so it's, it's, it's.
**Unknown speaker** [41:25 - 41:26]: We.
**Unknown speaker** [41:26 - 41:27]: We cannot just think about queries.
**Unknown speaker** [41:27 - 41:29]: We obviously also need to think about infrastructure in this case.
**Unknown speaker** [41:29 - 41:38]: But it's a different topic when we use this data fabric thing for that situation.
**Unknown speaker** [41:39 - 41:53]: I always recommend load tests on a lower environment before having any information because it's hard to calculate something that is not yet happening and based on the information that we have.
**Unknown speaker** [41:53 - 42:15]: That's why I always recommend load tests before like going live or something because even if you are not eating like that internal database limits, you might be eating like application pod limits or something and it might be hard but if you plan for.
**Unknown speaker** [42:15 - 42:26]: Well, I'm just throwing to the air but if you are Planning to have 10 more customers using this, with this amount of load at this point you will, you will not to hold this.
**Unknown speaker** [42:26 - 42:29]: Yeah, yeah, yeah, yeah, yeah, yeah, yeah.
**Unknown speaker** [42:29 - 42:31]: If like 10 more would be double.
**Unknown speaker** [42:32 - 42:32]: Yeah.
**Unknown speaker** [42:32 - 42:34]: Cristiano, quick question.
**Unknown speaker** [42:34 - 42:36]: Will data fabric add a lot of latency?
**Unknown speaker** [42:36 - 42:39]: I'm not experienced with data fabric, to be honest.
**Unknown speaker** [42:40 - 42:41]: I haven't tried it yet.
**Unknown speaker** [42:41 - 42:41]: Actually.
**Unknown speaker** [42:41 - 42:42]: No.
**Unknown speaker** [42:42 - 42:44]: We have been having good feedback from customers.
**Unknown speaker** [42:45 - 42:46]: Really good feedback.
**Unknown speaker** [42:46 - 42:52]: I have to be honest, on the beginning like two years ago we had some issues because not all engines were supported.
**Unknown speaker** [42:54 - 43:01]: But if you perform a direct connection to a database, the latest thing will not be a problem.
**Unknown speaker** [43:02 - 43:03]: It also depends then on.
**Unknown speaker** [43:04 - 43:04]: On your side.
**Unknown speaker** [43:04 - 43:05]: Okay.
**Unknown speaker** [43:05 - 43:10]: If it's on the cloud like Azure or aws, the database is there and you connect directly in.
**Unknown speaker** [43:10 - 43:17]: Basically AWS is an advantage because we use AWS on our side and we don't go to the normal one.
**Unknown speaker** [43:18 - 43:20]: We go to the internal routes of aws.
**Unknown speaker** [43:20 - 43:22]: So it's easy instantly, basically almost.
**Unknown speaker** [43:23 - 43:27]: And we have the CDNs from AWS that also help on that.
**Unknown speaker** [43:27 - 43:31]: Of course, if he's on premise, there is some variables that we don't have.
**Unknown speaker** [43:31 - 43:35]: No, no, we would, we would go with AWS and not on prem, but.
**Unknown speaker** [43:35 - 43:40]: Also in front AWS and on the same region of your tenant EU Central.
**Unknown speaker** [43:40 - 43:42]: You don't have latency almost at all.
**Unknown speaker** [43:42 - 43:49]: It will be immediately because we will use internal rules of AWS and not going through ESPs and so on.
**Unknown speaker** [43:49 - 43:50]: So it will be pretty fast.
**Unknown speaker** [43:50 - 43:51]: That's very good to know.
**Unknown speaker** [43:51 - 43:52]: Thank you.
**Unknown speaker** [43:53 - 43:54]: Nice.
**Unknown speaker** [43:54 - 44:02]: Okay, Carlos, any open thought why we have the experts here with the magic tools?
**Unknown speaker** [44:04 - 44:15]: Well, I think we'll have to talk again next week, but for today, in going through the query plan of this execution plan of these queries would be awesome.
**Unknown speaker** [44:15 - 44:16]: Costing.
**Unknown speaker** [44:16 - 44:17]: Yeah.
**Unknown speaker** [44:17 - 44:18]: Take some time just to go through it.
**Unknown speaker** [44:18 - 44:19]: Yeah.
**Unknown speaker** [44:19 - 44:25]: If we have it, the query, the execution plan might not be generated because of the query costs, but I will try to.
**Unknown speaker** [44:26 - 44:28]: To try to find them for all three.
**Unknown speaker** [44:28 - 44:30]: I will try to see on the logic.
**Unknown speaker** [44:30 - 44:35]: If I can find them where they are, I'll have like a rough position where they are on the application and.
**Unknown speaker** [44:35 - 44:37]: And I will share with you on the case.
**Unknown speaker** [44:37 - 44:38]: Meanwhile, if you want.
**Unknown speaker** [44:38 - 44:40]: If you want already the queries, I.
**Unknown speaker** [44:40 - 44:40]: Can share it on.
**Unknown speaker** [44:40 - 44:41]: Yes, sure, sure.
**Unknown speaker** [44:41 - 44:42]: On the case.
**Unknown speaker** [44:42 - 44:42]: Please go ahead.
**Unknown speaker** [44:42 - 44:43]: Please share these.
**Unknown speaker** [44:46 - 44:47]: You can just drop them here.
**Unknown speaker** [44:50 - 44:52]: I think all three passed.
**Unknown speaker** [44:52 - 44:54]: One, two, three.
**Unknown speaker** [44:54 - 44:56]: Yeah, all three are good to go.
**Unknown speaker** [44:56 - 44:57]: But I will share also this on the case.
**Unknown speaker** [44:58 - 44:58]: Okay.
**Unknown speaker** [44:59 - 45:05]: If you need like some other queries to your back office app, let me know.
**Unknown speaker** [45:05 - 45:06]: Okay.
**Unknown speaker** [45:08 - 45:09]: Cool.
**Unknown speaker** [45:09 - 45:10]: Because I only share with you the top.
**Unknown speaker** [45:10 - 45:12]: The top one that shows like the.
**Unknown speaker** [45:13 - 45:13]: Well, the.
**Unknown speaker** [45:14 - 45:15]: Basically I show you this.
**Unknown speaker** [45:15 - 45:16]: Can you also.
**Unknown speaker** [45:16 - 45:23]: Can you also give us the top three or can you just open in the dashboard the top three for the last two weeks that we also.
**Unknown speaker** [45:23 - 45:25]: Yes, yes, thank you.
**Unknown speaker** [45:25 - 45:29]: But bear in mind that with this I can only go one week.
**Unknown speaker** [45:29 - 45:29]: Actually.
**Unknown speaker** [45:29 - 45:30]: One week.
**Unknown speaker** [45:30 - 45:32]: Because performance inside only saves data for one week.
**Unknown speaker** [45:32 - 45:32]: Yeah.
**Unknown speaker** [45:33 - 45:38]: But as I, as I told you, I noticed that it's been like slightly increasingly every day.
**Unknown speaker** [45:40 - 45:40]: Yeah.
**Unknown speaker** [45:40 - 45:42]: Like as our usage does.
**Unknown speaker** [45:42 - 45:42]: Right.
**Unknown speaker** [45:44 - 45:44]: Yeah.
**Unknown speaker** [45:46 - 45:49]: And it's mainly these queries here.
**Unknown speaker** [45:49 - 45:50]: I also find some.
**Unknown speaker** [45:51 - 45:51]: Well, this.
**Unknown speaker** [45:51 - 45:52]: That's so interesting.
**Unknown speaker** [45:52 - 45:58]: That's a completely different place than I would have looked at then where I would have looked at.
**Unknown speaker** [45:59 - 46:01]: Yeah, I think that is one of.
**Unknown speaker** [46:01 - 46:03]: Yeah, that's 100 with the score here.
**Unknown speaker** [46:03 - 46:04]: That's.
**Unknown speaker** [46:04 - 46:04]: That's 100.
**Unknown speaker** [46:04 - 46:05]: The matching query.
**Unknown speaker** [46:07 - 46:07]: Carlos.
**Unknown speaker** [46:12 - 46:15]: Next one we can write a lot and see.
**Unknown speaker** [46:15 - 46:18]: But that, that is a very complex one.
**Unknown speaker** [46:18 - 46:21]: But we have to see what you can do there.
**Unknown speaker** [46:21 - 46:21]: Yeah, but I also.
**Unknown speaker** [46:22 - 46:23]: I will be grabbing all this information.
**Unknown speaker** [46:23 - 46:24]: Don't worry.
**Unknown speaker** [46:24 - 46:25]: And I will share on the case.
**Unknown speaker** [46:25 - 46:25]: Okay.
**Unknown speaker** [46:25 - 46:29]: I. I need like one hour to gather everything and share with you.
**Unknown speaker** [46:29 - 46:30]: Perfect.
**Unknown speaker** [46:30 - 46:31]: Cristiano, thank you very much.
**Unknown speaker** [46:32 - 46:33]: Really very much.
**Unknown speaker** [46:33 - 46:34]: Appreciate it.
**Unknown speaker** [46:34 - 46:34]: I assume.
**Unknown speaker** [46:35 - 46:40]: But for now, since the scale up is done, I think you are good to resume your work.
**Unknown speaker** [46:40 - 46:43]: But please let me know regarding user experience, how it's currently.
**Unknown speaker** [46:43 - 46:47]: Okay, thank you very much, Cristiano.
**Unknown speaker** [46:48 - 46:49]: No problem.
**Unknown speaker** [46:49 - 46:52]: So give me a few minutes, I will summarize everything.
**Unknown speaker** [46:52 - 46:55]: I will perform a little more investigation to help you guys.
**Unknown speaker** [46:55 - 46:56]: Okay.
**Unknown speaker** [46:56 - 47:00]: And any question, just reply to the case or give us a call and we can jump again on call.
**Unknown speaker** [47:00 - 47:01]: Okay, perfect.
**Unknown speaker** [47:01 - 47:02]: Thank you.
**Unknown speaker** [47:02 - 47:03]: Okay.
**Unknown speaker** [47:03 - 47:04]: All right.
**Unknown speaker** [47:04 - 47:04]: Okay then.
**Unknown speaker** [47:05 - 47:05]: See you then.
**Unknown speaker** [47:05 - 47:05]: Bye.
**Unknown speaker** [47:05 - 47:06]: Bye.
**Unknown speaker** [47:06 - 47:06]: See you later.
**Unknown speaker** [47:07 - 47:08]: All right, thank you.
**Unknown speaker** [47:08 - 47:08]: Bye.
**Unknown speaker** [47:08 - 47:09]: Thank you.
**Unknown speaker** [47:09 - 47:10]: Bye, everyone.
**Unknown speaker** [47:10 - 47:10]: Bye.
**Unknown speaker** [47:26 - 47:34]: That was kind of eye opening and I idiot was thinking about like a night shift to refactor local dict.
**Unknown speaker** [47:36 - 47:36]: And.
**Unknown speaker** [47:36 - 47:38]: That would be helpful for sure.
**Unknown speaker** [47:38 - 47:39]: But skills are still here.
**Unknown speaker** [47:40 - 47:45]: So in the next hour or so, I'm going to publish to production SQL admin.
**Unknown speaker** [47:46 - 47:48]: With that query, I need to understand the database.
**Unknown speaker** [47:48 - 47:48]: Okay.
**Unknown speaker** [47:48 - 47:55]: Without that, I'm not touching anything else for now because I need to see tables with more records, with more volume.
**Unknown speaker** [47:55 - 48:01]: Because this is really insights to what we are doing, the experiences.
**Unknown speaker** [48:01 - 48:02]: I know that part.
**Unknown speaker** [48:02 - 48:07]: So I will think about it a little bit because.
**Unknown speaker** [48:09 - 48:10]: That'S ridiculous, right?
**Unknown speaker** [48:12 - 48:14]: 25 million records, really?
**Unknown speaker** [48:16 - 48:30]: But it fits like if you divide like 15k consultants by like if you divide 25, 1, 2, 3, 25,000.
**Unknown speaker** [48:30 - 48:39]: So 25 million to like 15,000, we end up with still 1,600.
**Unknown speaker** [48:39 - 48:41]: Does that does not work.
**Unknown speaker** [48:41 - 48:45]: So we have 25 like trash or.
**Unknown speaker** [48:45 - 48:47]: So like old information there.
**Unknown speaker** [48:47 - 48:48]: I don't know.
**Unknown speaker** [48:48 - 48:51]: Yeah, let's go through, let's go through.
**Unknown speaker** [48:51 - 48:52]: Get some numbers.
**Unknown speaker** [48:52 - 48:55]: That tool that that guy was building is awesome.
**Unknown speaker** [48:55 - 48:56]: We want to have that.
**Unknown speaker** [48:56 - 49:03]: We don't have it that yet, but I have something in the forge that will allow us to explore the data a little bit, just to see if that is old or not.
**Unknown speaker** [49:03 - 49:09]: So we need to start to pinpoint what tables are causing the major issues.
**Unknown speaker** [49:11 - 49:12]: Yeah, it would be 1600.
**Unknown speaker** [49:13 - 49:13]: It cannot be.
**Unknown speaker** [49:13 - 49:14]: You're right.
**Unknown speaker** [49:14 - 49:15]: We have.
**Unknown speaker** [49:15 - 49:17]: We have issues with our experiences table.
**Unknown speaker** [49:17 - 49:18]: But like when.
**Unknown speaker** [49:18 - 49:22]: When like the experience table is like cascade deletion, right?
**Unknown speaker** [49:23 - 49:24]: I don't know.
**Unknown speaker** [49:24 - 49:24]: We are.
**Unknown speaker** [49:24 - 49:25]: Yeah.
**Unknown speaker** [49:25 - 49:28]: As soon as we delete the consultant, I will.
**Unknown speaker** [49:29 - 49:31]: I will figure out what data.
**Unknown speaker** [49:31 - 49:35]: If we have data there that is not linked to anyone or something like that.
**Unknown speaker** [49:35 - 49:35]: So there are.
**Unknown speaker** [49:35 - 49:36]: There is some issues.
**Unknown speaker** [49:37 - 49:39]: 25 million for the current amount of consultants.
**Unknown speaker** [49:39 - 49:41]: I don't think that is.
**Unknown speaker** [49:41 - 49:41]: Doesn't work.
**Unknown speaker** [49:41 - 49:42]: Doesn't work.
**Unknown speaker** [49:42 - 49:46]: It would be 1600 experiences per consultant.
**Unknown speaker** [49:46 - 49:47]: Does really not make any sense.
**Unknown speaker** [49:48 - 49:53]: But you have it crossed by skills, by roles, and you have multiple.
**Unknown speaker** [49:53 - 49:56]: So we summarize the table by skills and by roles.
**Unknown speaker** [49:56 - 49:58]: So that might also suggest.
**Unknown speaker** [49:59 - 50:00]: And Skills are doubled.
**Unknown speaker** [50:00 - 50:00]: All right.
**Unknown speaker** [50:02 - 50:09]: And also what I just realized is like the consultants that we are merging, we are not deleting them.
**Unknown speaker** [50:09 - 50:10]: So we have probably like even.
**Unknown speaker** [50:10 - 50:12]: Even much more.
**Unknown speaker** [50:12 - 50:14]: We have probably 20,000 and we did not delete.
**Unknown speaker** [50:15 - 50:17]: Yeah, okay.
**Unknown speaker** [50:17 - 50:18]: No, no worries.
**Unknown speaker** [50:18 - 50:26]: I think we found it at the right time because the users didn't got away without the system.
**Unknown speaker** [50:26 - 50:31]: So we start saving more problems this week because we've onboarding more.
**Unknown speaker** [50:31 - 50:32]: I think that's the common.
**Unknown speaker** [50:32 - 50:35]: And these things will blow up in the future.
**Unknown speaker** [50:35 - 50:45]: But for now I will understand that first of all want to write that query down and just deploy to production to have a list that we can work with.
**Unknown speaker** [50:45 - 50:49]: Then go through the data, understand if the data is really matched or not.
**Unknown speaker** [50:50 - 50:52]: And once again the experience part, I think I know it.
**Unknown speaker** [50:54 - 50:57]: And one quick thing that we can do to be really, really simple.
**Unknown speaker** [50:57 - 51:03]: And so what I can definitely do is I can get rid of the like get counts information thing where we.
**Unknown speaker** [51:03 - 51:06]: Because then you can query this stuff directly.
**Unknown speaker** [51:06 - 51:07]: I should.
**Unknown speaker** [51:07 - 51:18]: Don't delete it, don't delete it because for now just don't run it because you might have for example the remapping one, you know that that might be a problem and you have that.
**Unknown speaker** [51:18 - 51:23]: So I will use that as a guidance to some of the queries or now at least.
**Unknown speaker** [51:23 - 51:33]: But once we can have access to the data and export the data now that we have a lot of CPU on on the server, we got to to 50 already so.
**Unknown speaker** [51:34 - 51:37]: But it has stabilized at 50.
**Unknown speaker** [51:37 - 51:44]: So what that means even if we don't change anything right now with double the CPU we would be fine.
**Unknown speaker** [51:45 - 51:47]: Yeah, that's true and that's a good.
**Unknown speaker** [51:47 - 51:55]: Thing that I'm worried about during the or I'll be keeping my in this metric throughout the day just to make sure that.
**Unknown speaker** [51:55 - 52:00]: Let's see what the limit with the current version of the code and let's improve it afterwards.
**Unknown speaker** [52:01 - 52:02]: Okay.
**Unknown speaker** [52:02 - 52:03]: All right, cool.
**Unknown speaker** [52:03 - 52:08]: In this case we can also bump up the queue a little bit, but currently no one is pathing either way.
**Unknown speaker** [52:10 - 52:12]: It's Friday, so.
**Unknown speaker** [52:12 - 52:14]: Yeah, so but.
**Unknown speaker** [52:14 - 52:17]: All right, very nice, very nice.
**Unknown speaker** [52:19 - 52:19]: Let's.
**Unknown speaker** [52:19 - 52:20]: Should I.
**Unknown speaker** [52:20 - 52:21]: Let's.
**Unknown speaker** [52:21 - 52:22]: Let's stick to a small queue.
**Unknown speaker** [52:22 - 52:23]: Let's let's say six.
**Unknown speaker** [52:26 - 52:29]: Oh, but if no one is parsing, don't increase it too much.
**Unknown speaker** [52:30 - 52:31]: Yeah, true.
**Unknown speaker** [52:32 - 52:33]: Which we should deploy.
**Unknown speaker** [52:33 - 52:35]: But it doesn't need to happen right now.
**Unknown speaker** [52:35 - 52:36]: Okay.
**Unknown speaker** [52:36 - 52:36]: Okay.
**Unknown speaker** [52:37 - 52:46]: The keying mechanism that we have currently doesn't really handle the order as it should, at least as we have agreed.
**Unknown speaker** [52:46 - 52:49]: But it's not critical since no one is parsing right now.
**Unknown speaker** [52:49 - 52:51]: I think well fine otherwise.
**Unknown speaker** [52:51 - 52:55]: But there is that skill alliance that we found and fixed.
**Unknown speaker** [52:55 - 52:55]: So.
**Unknown speaker** [52:57 - 52:58]: Cool.
**Unknown speaker** [52:58 - 53:00]: Have you changed some?
**Unknown speaker** [53:00 - 53:04]: Because this week was much was worse in terms of metric than last week.
**Unknown speaker** [53:04 - 53:06]: So did we change something?
**Unknown speaker** [53:06 - 53:08]: And we did deploy the code.
**Unknown speaker** [53:08 - 53:12]: So any change that you can think of that might.
**Unknown speaker** [53:15 - 53:18]: Issues regarding matching score and filtering and prod would be great.
**Unknown speaker** [53:18 - 53:21]: If you can check it out, tell your thoughts.
**Unknown speaker** [53:21 - 53:27]: I think both are, I think both of you are way more into the logic.
**Unknown speaker** [53:27 - 53:29]: There is me matching scores is.
**Unknown speaker** [53:29 - 53:30]: Okay, I will check this out.
**Unknown speaker** [53:33 - 53:33]: Okay.
**Unknown speaker** [53:34 - 53:35]: What?
**Unknown speaker** [53:35 - 53:36]: Yeah, like I what?
**Unknown speaker** [53:36 - 53:47]: One thing I know like Tommy was looking for a report on Tuesday and was clicking a button that was like bulk calculating matching scores.
**Unknown speaker** [53:49 - 53:49]: Okay.
**Unknown speaker** [53:49 - 53:51]: And he did not know about it.
**Unknown speaker** [53:51 - 53:54]: Like I, I, I, I, I, I deleted that button already.
**Unknown speaker** [53:54 - 53:55]: That this cannot happen again.
**Unknown speaker** [53:56 - 53:57]: That was yesterday.
**Unknown speaker** [53:57 - 54:01]: No, that was like on Tuesday or so Tuesday.
**Unknown speaker** [54:01 - 54:02]: Okay.
**Unknown speaker** [54:02 - 54:03]: But that, that's okay.
**Unknown speaker** [54:04 - 54:05]: That specific time.
**Unknown speaker** [54:05 - 54:06]: Yeah, yeah.
**Unknown speaker** [54:06 - 54:24]: Or so it's like it cannot be the case at this point slowing us down for, for all the other days it's like still suspicious like nothing that was displayed there was like in any kind related to to CV parsing except like the experience calculation at the very end.
**Unknown speaker** [54:24 - 54:24]: Right.
**Unknown speaker** [54:24 - 54:30]: But the CV parsing the problem is you'll never catch it because it's hundreds of different queries.
**Unknown speaker** [54:31 - 54:32]: Yeah, yeah, yeah.
**Unknown speaker** [54:32 - 54:37]: It's the, the CV parsing has a lot of all the small ones.
**Unknown speaker** [54:37 - 54:37]: Right.
**Unknown speaker** [54:37 - 54:38]: That's the problem.
**Unknown speaker** [54:38 - 54:47]: All the events and everything that when that gets fired up so we easily will get the matching because it's like one heavy query.
**Unknown speaker** [54:47 - 54:50]: The smaller ones are much difficult to find.
**Unknown speaker** [54:50 - 55:04]: So when we have at one time access to these dashboards, what we could do is like during the weekend or so when no one is working, we could run the CV parsings just four or five to get an idea what, what impact they have specifically.
**Unknown speaker** [55:04 - 55:04]: Right.
**Unknown speaker** [55:06 - 55:08]: Or late at night, for example.
**Unknown speaker** [55:08 - 55:09]: Yeah, yeah.
**Unknown speaker** [55:09 - 55:12]: But only if we have access to these dashboards.
**Unknown speaker** [55:12 - 55:14]: Otherwise we cannot do anything.
**Unknown speaker** [55:14 - 55:14]: Right.
**Unknown speaker** [55:15 - 55:18]: It's difficult to track metrics with the existing.
**Unknown speaker** [55:18 - 55:27]: But you know that you are the one saying that it's hundreds of queries or even maybe a thousand queries that running a couple of minutes just because of the parsing.
**Unknown speaker** [55:27 - 55:31]: And the CVE export is also pretty weird for me.
**Unknown speaker** [55:31 - 55:36]: But CV export is like one query to load the data and then you don't go to the database anymore.
**Unknown speaker** [55:36 - 55:40]: So that shouldn't be a big problem.
**Unknown speaker** [55:40 - 55:41]: Yeah, yeah, it's.
**Unknown speaker** [55:41 - 55:42]: I think it's easy to.
**Unknown speaker** [55:42 - 55:44]: But I don't Know where it should live.
**Unknown speaker** [55:44 - 55:45]: Like which query is it that is.
**Unknown speaker** [55:45 - 55:47]: That is causing this pain?
**Unknown speaker** [55:49 - 55:50]: I don't know.
**Unknown speaker** [55:50 - 55:53]: I haven't read the queries, just carefully.
**Unknown speaker** [55:53 - 55:55]: More worried about the size of.
**Unknown speaker** [55:55 - 55:57]: Because you're starting to have more problems.
**Unknown speaker** [55:57 - 55:59]: Because we have more data.
**Unknown speaker** [55:59 - 56:01]: That's right.
**Unknown speaker** [56:01 - 56:06]: Just that because this unveils that when you get to millions of records, you start to have problems.
**Unknown speaker** [56:06 - 56:10]: Let's just figure out if we are having the right records in the right place.
**Unknown speaker** [56:10 - 56:11]: If we don't need to delete.
**Unknown speaker** [56:12 - 56:14]: You mentioned French on local deeds.
**Unknown speaker** [56:14 - 56:15]: That makes sense.
**Unknown speaker** [56:15 - 56:17]: If no one is using French.
**Unknown speaker** [56:19 - 56:19]: That makes sense.
**Unknown speaker** [56:19 - 56:21]: At least stop calculating them.
**Unknown speaker** [56:21 - 56:23]: Okay, so those things are good.
**Unknown speaker** [56:23 - 56:27]: At least we save some room space in database compute.
**Unknown speaker** [56:27 - 56:30]: I would say let's trash them all.
**Unknown speaker** [56:31 - 56:37]: No, but even if you don't delete them, even if you don't delete it, just stop calculating them would be a good thing.
**Unknown speaker** [56:37 - 56:40]: Just unconfigure French from one of the system languages.
**Unknown speaker** [56:41 - 56:42]: Yeah, that's what I already did.
**Unknown speaker** [56:43 - 56:43]: Okay.
**Unknown speaker** [56:44 - 56:47]: Only that it's already just a good thing.
**Unknown speaker** [56:47 - 56:48]: But okay.
**Unknown speaker** [56:48 - 56:51]: Once I get the database report, I will let you know.
**Unknown speaker** [56:51 - 56:52]: Okay.
**Unknown speaker** [56:52 - 56:55]: So we can go through it together and in an hour.
**Unknown speaker** [56:55 - 57:04]: So we should have more information from Cristiano and that would be helpful to first figure out in the code where is the problem or what is the.
**Unknown speaker** [57:04 - 57:09]: What are the stop queries that are hitting all the space.
**Unknown speaker** [57:10 - 57:11]: The matching one will be a complex one.
**Unknown speaker** [57:11 - 57:12]: Okay.
**Unknown speaker** [57:13 - 57:15]: Yeah, but the matching one we were probably like.
**Unknown speaker** [57:15 - 57:21]: If we can just move it to AWS and scale it with our own databases and then that means that you.
**Unknown speaker** [57:21 - 57:23]: Need to copy all the data.
**Unknown speaker** [57:24 - 57:25]: That's the problem.
**Unknown speaker** [57:25 - 57:25]: No, we do.
**Unknown speaker** [57:25 - 57:26]: We don't copy it.
**Unknown speaker** [57:26 - 57:27]: We move it there in the first place.
**Unknown speaker** [57:27 - 57:32]: The experience calculation is directly writing into that you can do.
**Unknown speaker** [57:33 - 57:33]: Yes, you can.
**Unknown speaker** [57:33 - 57:35]: But you also need the consultants.
**Unknown speaker** [57:36 - 57:36]: Right?
**Unknown speaker** [57:36 - 57:39]: So you probably need something because I don't think that you'll be.
**Unknown speaker** [57:39 - 57:40]: We only need.
**Unknown speaker** [57:40 - 57:41]: We only need the consultant id.
**Unknown speaker** [57:44 - 57:44]: Correct.
**Unknown speaker** [57:45 - 57:48]: But not, not.
**Unknown speaker** [57:48 - 57:51]: Not only because of those industries.
**Unknown speaker** [57:51 - 57:52]: There are a few.
**Unknown speaker** [57:52 - 57:53]: A few other things on that.
**Unknown speaker** [57:53 - 57:54]: But they are all in the.
**Unknown speaker** [57:54 - 57:56]: They are all in the experiences.
**Unknown speaker** [57:56 - 58:00]: But yeah, there are some master data like the consultant is working in department xyz.
**Unknown speaker** [58:00 - 58:03]: We need to filter by department and stuff like that.
**Unknown speaker** [58:03 - 58:09]: But with data fabric we could do it because the department we would query and the experiences the.
**Unknown speaker** [58:09 - 58:09]: The.
**Unknown speaker** [58:09 - 58:10]: The.
**Unknown speaker** [58:10 - 58:12]: The AWS database would query.
**Unknown speaker** [58:12 - 58:13]: Right.
**Unknown speaker** [58:13 - 58:16]: With data fabric we can mesh everything in one aggregate.
**Unknown speaker** [58:16 - 58:16]: Right.
**Unknown speaker** [58:18 - 58:19]: I. I would have to test to see.
**Unknown speaker** [58:20 - 58:22]: I don't think that you can easily.
**Unknown speaker** [58:23 - 58:28]: I didn't See this in odc, like you can really but cross.
**Unknown speaker** [58:28 - 58:35]: Cross your tables from your ODC instance with an external database in a performance way.
**Unknown speaker** [58:35 - 58:36]: I would be very impressed.
**Unknown speaker** [58:36 - 58:38]: But I don't know.
**Unknown speaker** [58:38 - 58:39]: Yeah, yeah, me too.
**Unknown speaker** [58:40 - 58:48]: I've done external connections to external databases, but with that it was not odc.
**Unknown speaker** [58:48 - 58:49]: And those.
**Unknown speaker** [58:49 - 58:55]: The limitation that you had, you cannot in the same query cross join or join from two different places.
**Unknown speaker** [58:55 - 58:56]: Okay.
**Unknown speaker** [58:56 - 58:57]: Because you can.
**Unknown speaker** [58:58 - 59:00]: So that was a limitation.
**Unknown speaker** [59:00 - 59:02]: But we will get to there when we get there.
**Unknown speaker** [59:02 - 59:04]: I don't think that we need that right now.
**Unknown speaker** [59:05 - 59:09]: So let's just make this run and see where we are at.
**Unknown speaker** [59:09 - 59:10]: Cool.
**Unknown speaker** [59:10 - 59:11]: All right, Carlos.
**Unknown speaker** [59:11 - 59:13]: Okay, thank you.
**Unknown speaker** [59:14 - 59:15]: Let's move on.
**Unknown speaker** [59:16 - 59:19]: You are going to take a look at the matching.
**Unknown speaker** [59:20 - 59:21]: I will take a look.
**Unknown speaker** [59:21 - 59:22]: You take a look at it.
**Unknown speaker** [59:22 - 59:24]: I will take a look and tell them that I have no idea.
**Unknown speaker** [59:28 - 59:33]: All right, Cool.
**Unknown speaker** [59:35 - 59:36]: Recent fix it properly.
**Unknown speaker** [59:36 - 59:37]: What?
**Unknown speaker** [59:37 - 59:40]: No, there is another one currently working on that.
**Unknown speaker** [59:40 - 59:42]: I think it might be merging or something.
**Unknown speaker** [59:42 - 59:43]: Okay.
**Unknown speaker** [59:43 - 59:45]: I will need to talk with Chico and see a little bit.
**Unknown speaker** [59:47 - 59:47]: Cool.
**Unknown speaker** [59:47 - 59:48]: All right.
**Unknown speaker** [59:48 - 59:48]: Perfect.
**Unknown speaker** [59:48 - 59:50]: Okay, see, let me know if I.
**Unknown speaker** [59:50 - 59:53]: If, if like I can help you with any like.
**Unknown speaker** [59:53 - 59:58]: Like if you say like this and this tables or entities where I can.
**Unknown speaker** [59:58 - 59:58]: I can.
**Unknown speaker** [59:58 - 59:59]: I can point.
**Unknown speaker** [59:59 - 01:00:03]: Well, I will need your help and we will understand or go through the results together.
**Unknown speaker** [01:00:03 - 01:00:06]: But first of all, neither report with the size of the time.
**Unknown speaker** [01:00:06 - 01:00:08]: Okay, Perfect.
**Unknown speaker** [01:00:08 - 01:00:10]: Carlos, I cannot even tell you like how much.
**Unknown speaker** [01:00:10 - 01:00:12]: How much relief it is to have you.
**Unknown speaker** [01:00:15 - 01:00:16]: I've done these things before.
**Unknown speaker** [01:00:16 - 01:00:17]: Don't worry.
**Unknown speaker** [01:00:17 - 01:00:18]: But it takes.
**Unknown speaker** [01:00:18 - 01:00:19]: It takes time.
**Unknown speaker** [01:00:19 - 01:00:26]: And my problem here, and this is frustrating for me, I'm a little bit blind with lack of tools because I need access to.
**Unknown speaker** [01:00:26 - 01:00:27]: I need to see the database.
**Unknown speaker** [01:00:27 - 01:00:28]: Right.
**Unknown speaker** [01:00:28 - 01:00:30]: Without going to the database.
**Unknown speaker** [01:00:30 - 01:00:35]: But like even like what you mentioned in that call, I would be like ah, maybe I should hear looking there.
**Unknown speaker** [01:00:35 - 01:00:36]: I would be like it's not.
**Unknown speaker** [01:00:36 - 01:00:37]: It's not my specialty.
**Unknown speaker** [01:00:37 - 01:00:39]: I have zero idea how to approach this.
**Unknown speaker** [01:00:40 - 01:00:41]: I would do some things, but it.
**Unknown speaker** [01:00:41 - 01:00:44]: Would be guessworking even the execution plans.
**Unknown speaker** [01:00:44 - 01:00:46]: I'm not expert in breathing execution.
**Unknown speaker** [01:00:46 - 01:00:48]: Execution plans because those are very complex.
**Unknown speaker** [01:00:49 - 01:00:52]: I Normally go to ChatGPT just to.
**Unknown speaker** [01:00:52 - 01:00:54]: Yeah, yeah, you can have quite well.
**Unknown speaker** [01:00:54 - 01:00:54]: Right.
**Unknown speaker** [01:00:55 - 01:00:56]: Because they're very technical.
**Unknown speaker** [01:00:56 - 01:01:01]: But I have a guy here if I need George that's over the weekend.
**Unknown speaker** [01:01:01 - 01:01:01]: If he.
**Unknown speaker** [01:01:01 - 01:01:05]: If I need him, he will explain because he lives in database.
**Unknown speaker** [01:01:05 - 01:01:06]: He loves databases.
**Unknown speaker** [01:01:06 - 01:01:06]: Wow.
**Unknown speaker** [01:01:06 - 01:01:11]: We can just get some additional information if we need to, but I think we'll.
**Unknown speaker** [01:01:11 - 01:01:12]: We'll be able to manage it.
**Unknown speaker** [01:01:13 - 01:01:17]: Very nice restructure A few things over and over again.
**Unknown speaker** [01:01:17 - 01:01:18]: But let's see.
**Unknown speaker** [01:01:18 - 01:01:19]: Okay.
**Unknown speaker** [01:01:19 - 01:01:20]: We'll talk to you in a little bit.
**Unknown speaker** [01:01:21 - 01:01:21]: See ya.
**Unknown speaker** [01:01:21 - 01:01:21]: Bye.
**Unknown speaker** [01:01:21 - 01:01:22]: Bye.
**Unknown speaker** [01:01:22 - 01:01:22]: Thank you.
**Unknown speaker** [01:02:33 - 01:02:36]: Hi k andreas.
**Unknown speaker** [01:02:36 - 01:02:37]: Hi.
**Unknown speaker** [01:02:42 - 01:02:43]: Thank you.
**Unknown speaker** [01:02:52 - 01:02:53]: Good morning.
**Unknown speaker** [01:02:55 - 01:02:55]: It.
**Unknown speaker** [01:03:36 - 01:03:37]: So hello.
**Unknown speaker** [01:03:37 - 01:03:38]: Hello.
**Unknown speaker** [01:03:39 - 01:03:39]: Hi.
**Unknown speaker** [01:04:11 - 01:04:12]: Okay Adan is is.
**Unknown speaker** [01:05:34 - 01:05:35]: Artist.
**Unknown speaker** [01:07:50 - 01:07:51]: People.
**Unknown speaker** [01:08:43 - 01:08:43]: Star.
**Unknown speaker** [01:09:35 - 01:09:36]: Mid.
**Unknown speaker** [01:09:38 - 01:09:39]: This is.
**Unknown speaker** [01:10:01 - 01:10:04]: Shaping my Musa positivity.
**Unknown speaker** [01:10:56 - 01:10:56]: Okay.
**Unknown speaker** [01:11:41 - 01:11:45]: By my team to magical also to burak.
**Unknown speaker** [01:11:47 - 01:11:47]: Magical.
**Unknown speaker** [01:13:33 - 01:13:35]: This is its minor.
**Unknown speaker** [01:13:51 - 01:13:51]: Good.
**Unknown speaker** [01:15:19 - 01:15:19]: Is.
**Unknown speaker** [01:15:45 - 01:15:53]: Overhead Abanitan phone Bryce sign and then abide monitor vice in the Noya in her in Bryce.
**Unknown speaker** [01:16:20 - 01:16:21]: Standalone.
**Unknown speaker** [01:16:38 - 01:16:39]: Only integrates.
**Unknown speaker** [01:17:00 - 01:17:00]: Contract.
**Unknown speaker** [01:17:05 - 01:17:05]: Seal is.
**Unknown speaker** [01:17:30 - 01:17:31]: 5,000ft.
**Unknown speaker** [01:17:58 - 01:17:59]: Performance.
**Unknown speaker** [01:18:32 - 01:18:34]: Okay then this is wow okay.
**Unknown speaker** [01:18:46 - 01:18:48]: Done on the bottom line on done this is about.
**Unknown speaker** [01:18:55 - 01:18:56]: 99999.
**Unknown speaker** [01:19:34 - 01:19:34]: Meeting.
**Unknown speaker** [01:20:14 - 01:20:14]: Team invest here.
**Unknown speaker** [01:21:05 - 01:21:11]: They abba as a field unkind.
**Unknown speaker** [01:21:16 - 01:21:32]: Bank here Nick spray and pray on Alice Ryan on amtakunda cvank Nick uber uber zag profile and as monat Ibrah dartmank usage done Dunk.
**Unknown speaker** [01:21:39 - 01:21:40]: Okay.
**Unknown speaker** [01:22:26 - 01:22:29]: To Stefan dad and hookah.
**Unknown speaker** [01:23:19 - 01:23:19]: Premiere.
**Unknown speaker** [01:23:53 - 01:23:53]: Thank you.
**Unknown speaker** [01:24:28 - 01:24:30]: Operations and admin and or cash flow wise.
**Unknown speaker** [01:24:41 - 01:24:44]: Okay good.
**Unknown speaker** [01:24:46 - 01:24:47]: Go for it.
**Unknown speaker** [01:24:59 - 01:25:04]: Compute for fear fact for free Aberdan.
**Unknown speaker** [01:25:32 - 01:25:33]: Couldn't stop.
**Unknown speaker** [01:26:26 - 01:26:26]: You know.
**Unknown speaker** [01:26:53 - 01:26:53]: Loop.
**Unknown speaker** [01:27:22 - 01:27:24]: Yeah also can't see feel limb dunk on.
**Unknown speaker** [01:32:08 - 01:32:09]: So.
**Unknown speaker** [01:32:12 - 01:32:14]: We have a lot of problems.
**Unknown speaker** [01:32:14 - 01:32:16]: We have a lot of problems.
**Unknown speaker** [01:32:16 - 01:32:17]: I'm hungry.
**Unknown speaker** [01:32:41 - 01:32:41]: Export.
**Unknown speaker** [01:32:43 - 01:32:44]: Matchings.
**Unknown speaker** [01:32:52 - 01:32:53]: Christopher belcher.
**Unknown speaker** [01:35:03 - 01:35:30]: Is database computer.
**Unknown speaker** [01:35:43 - 01:35:44]: Entries by experiences.
**Unknown speaker** [01:35:59 - 01:35:59]: Nothing.
**Unknown speaker** [01:36:20 - 01:36:23]: From local dix the peak competitive for matching is fast.
**Unknown speaker** [01:36:47 - 01:36:49]: In inquiries on bridging bridging.
**Unknown speaker** [01:36:51 - 01:36:52]: Custom rolls.
**Unknown speaker** [01:37:43 - 01:37:44]: Okay.
**Unknown speaker** [01:38:09 - 01:38:09]: Computer.
**Unknown speaker** [01:38:34 - 01:38:35]: Good.
**Unknown speaker** [01:39:43 - 01:39:44]: Critical as well.
**Unknown speaker** [01:40:03 - 01:40:04]: Translation here.
**Unknown speaker** [01:40:14 - 01:40:22]: Engagement descriptions extraction Descriptions Extracted Translated 1.
**Unknown speaker** [01:41:14 - 01:41:15]: Manastorus.
**Unknown speaker** [01:41:22 - 01:41:23]: Model.
**Unknown speaker** [01:41:27 - 01:41:28]: Translation.
**Unknown speaker** [01:42:53 - 01:42:58]: Okay we had active MQ hard filtered at the fear.
**Unknown speaker** [01:43:20 - 01:43:34]: Deployed this card to production the Merkikita 3 of database locks on code direct database metadata migroses were here table and so on so forth.
**Unknown speaker** [01:43:52 - 01:43:52]: Before.
**Unknown speaker** [01:43:59 - 01:44:05]: By the way women's card kind of logos in the death FYI.
**Unknown speaker** [01:44:17 - 01:44:17]: On.
**Unknown speaker** [01:44:24 - 01:44:30]: Wise invested time to Sean Bassend directing moves and shadow possessed local dictator.
