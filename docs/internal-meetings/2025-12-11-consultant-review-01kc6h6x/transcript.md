# Consultant Review

**Carlos | matchicalcom** [00:02 - 00:03]: Everything fixed.
**Carlos | matchicalcom** [00:05 - 00:06]: Almost almost there.
**Carlos | matchicalcom** [00:07 - 00:21]: Really I still have the pins, yeah, so the rest of the stuff I have the pins and I think the engagement role issue that I was just reviewing the loan constant that one I.
**Carlos | matchicalcom** [00:21 - 00:22]: Think what's going on.
**Carlos | matchicalcom** [00:23 - 00:26]: I had the wrong categories when I calculated the experiences.
**Carlos | matchicalcom** [00:26 - 00:28]: So when you calculated custom roles.
**Carlos | matchicalcom** [00:30 - 00:37]: The custom roles were being added with the entities of the skill and the roles, not the custom ones.
**Carlos | matchicalcom** [00:37 - 00:38]: I didn't fix that yesterday.
**Carlos | matchicalcom** [00:38 - 00:40]: I think that was what caused that issue.
**Carlos | matchicalcom** [00:40 - 00:44]: But I was reading boom and I'm going there in a little bit.
**Carlos | matchicalcom** [00:45 - 00:48]: But since that only affects.
**Carlos | matchicalcom** [00:49 - 00:51]: The custom roles.
**Carlos | matchicalcom** [00:51 - 00:58]: I don't think that you are going to activate that in production should be good, but we probably will need a version.
**Carlos | matchicalcom** [00:58 - 01:01]: I would say tomorrow to fix that pin issue, right?
**Carlos | matchicalcom** [01:02 - 01:03]: Does that pin?
**Konsti | matchicalcom** [01:03 - 01:06]: Yeah, we need to fix the pin for sure.
**Carlos | matchicalcom** [01:06 - 01:08]: I should be able to fix it today.
**Carlos | matchicalcom** [01:09 - 01:10]: Doesn't seem too complicated.
**Carlos | matchicalcom** [01:10 - 01:16]: Unless I start reviewing that demand query that is like a month job or something.
**Carlos | matchicalcom** [01:16 - 01:22]: I don't know that's huge, but yeah, we should be good there.
**Carlos | matchicalcom** [01:25 - 01:25]: It'S working.
**Tommy | matchicalcom** [01:25 - 01:31]: I'm not this pin this spin as I was just talking to constitute this bin logic.
**Tommy | matchicalcom** [01:31 - 01:37]: Yeah, it's kind of, yeah, can't see, explained what he did here and.
**Tommy | matchicalcom** [01:39 - 01:44]: We should only ensure really I showed it.
**Konsti | matchicalcom** [01:44 - 01:50]: To Tommy He so isn't this bad practice and isn't this best practice and isn't this bad and yes, yes, yes.
**Carlos | matchicalcom** [01:51 - 01:56]: I'm not even going to start all that, because I don't think that's worth it at this point.
**Carlos | matchicalcom** [01:56 - 02:04]: It just let's make it work, even if I have to do an additional simple query something like that, but let's make it something.
**Tommy | matchicalcom** [02:04 - 02:08]: I would only it wasn't, it wasn't not judging from my side.
**Tommy | matchicalcom** [02:08 - 02:10]: It was only I know that it was.
**Tommy | matchicalcom** [02:10 - 02:18]: So Consty tries always to save time in the development and I'm really the opposite.
**Tommy | matchicalcom** [02:18 - 02:19]: So.
**Tommy | matchicalcom** [02:20 - 02:29]: I try to make things working and really so there can be edge cases for sure, but in the end.
**Tommy | matchicalcom** [02:31 - 02:37]: My first control will ever be is this consultant?
**Tommy | matchicalcom** [02:37 - 02:40]: There or not, this would be my first control.
**Tommy | matchicalcom** [02:41 - 02:42]: What I will do.
**Tommy | matchicalcom** [02:43 - 02:47]: And I will be sure that there is a consultant ID.
**Tommy | matchicalcom** [02:47 - 02:54]: There is a demand ID as a variable in place and not, oh, I will get it from there every time.
**Tommy | matchicalcom** [02:54 - 02:56]: So you know what I mean?
**Tommy | matchicalcom** [02:56 - 02:58]: So that's only some.
**Carlos | matchicalcom** [02:58 - 02:59]: No worries I will.
**Carlos | matchicalcom** [02:59 - 03:03]: I need to understand the process first and what the Cody is doing.
**Carlos | matchicalcom** [03:03 - 03:08]: And before I really have an opinion, but doesn't really seem no I think.
**Tommy | matchicalcom** [03:08 - 03:11]: Yeah, it's had a lot of advantages.
**Tommy | matchicalcom** [03:11 - 03:14]: How constant is doing the stuff in the end?
**Tommy | matchicalcom** [03:15 - 03:19]: Only if we are doing that for our own, it's not, it's everything all right.
**Tommy | matchicalcom** [03:19 - 03:24]: But if they so from a user perspective, if I can really.
**Tommy | matchicalcom** [03:25 - 03:28]: Bring them twenty times to the engagement.
**Tommy | matchicalcom** [03:30 - 03:37]: Or to the demand, I will say that's not good, because it's so easy to handle in the end.
**Carlos | matchicalcom** [03:38 - 03:49]: One last note just related to that part constantly right now I don't think that we can put the duplicate check on the database, because we have inconsistent, we might have inconsistent records.
**Carlos | matchicalcom** [03:49 - 03:53]: So that would cause the application not to deploy.
**Carlos | matchicalcom** [03:53 - 03:56]: So we need to fix the functionality check if we have.
**Carlos | matchicalcom** [03:56 - 03:58]: Duplicate information in production.
**Carlos | matchicalcom** [03:58 - 04:02]: And after that, I think putting it as a unique.
**Carlos | matchicalcom** [04:04 - 04:06]: Key combination, do you.
**Tommy | matchicalcom** [04:06 - 04:07]: Think that's a good idea?
**Carlos | matchicalcom** [04:07 - 04:09]: So just police always.
**Carlos | matchicalcom** [04:10 - 04:16]: If you have a business rule and you can always make sure that is enforced on the database, yes, go for it.
**Tommy | matchicalcom** [04:18 - 04:22]: But the question is this a business rule that was mine?
**Carlos | matchicalcom** [04:22 - 04:26]: That I'm pre consulted consultant?
**Carlos | matchicalcom** [04:28 - 04:31]: There can't be another right and then try to.
**Carlos | matchicalcom** [04:33 - 04:33]: Change.
**Konsti | matchicalcom** [04:33 - 04:34]: We can change the code.
**Tommy | matchicalcom** [04:34 - 04:36]: Yeah, for sure, for sure, no.
**Carlos | matchicalcom** [04:36 - 04:40]: And the code, the code should try to prevent that.
**Carlos | matchicalcom** [04:41 - 04:45]: But every in the database gives you the additional advantages that you can.
**Carlos | matchicalcom** [04:45 - 04:50]: Even if the code is wrong, you cannot do it because you get an exception.
**Carlos | matchicalcom** [04:50 - 04:53]: That's just protection layer.
**Carlos | matchicalcom** [04:53 - 04:54]: Okay, okay.
**Carlos | matchicalcom** [04:54 - 04:58]: But the goal of this meeting was slightly different things, topics.
**Tommy | matchicalcom** [04:58 - 05:01]: Let me just share my screen absolutely.
**Carlos | matchicalcom** [05:07 - 05:08]: Okay.
**Carlos | matchicalcom** [05:08 - 05:10]: So what what guys do I have?
**Carlos | matchicalcom** [05:10 - 05:11]: And I don't have a huge team.
**Carlos | matchicalcom** [05:11 - 05:16]: Okay, so but what guys do I have available and that I trust.
**Carlos | matchicalcom** [05:16 - 05:18]: And I think it would be a good match for me.
**Carlos | matchicalcom** [05:19 - 05:21]: Pedro Gomes is my scene.
**Carlos | matchicalcom** [05:21 - 05:25]: I would say he even is like one or two years older than me.
**Carlos | matchicalcom** [05:25 - 05:27]: He's a huge expert.
**Carlos | matchicalcom** [05:27 - 05:33]: He did like ten years in ASP, NET and C Sharp and C.
**Carlos | matchicalcom** [05:33 - 05:35]: It just is a great coder.
**Carlos | matchicalcom** [05:36 - 05:39]: For the last almost ten years he has been working.
**Carlos | matchicalcom** [05:39 - 05:41]: He's a friend of mine for a long time.
**Carlos | matchicalcom** [05:41 - 05:50]: But for the last ten years I've converted him to ALT systems and he's now a very senior, very good outsystems expert.
**Carlos | matchicalcom** [05:51 - 05:55]: He has an availability problem because he's currently handling a couple of other projects.
**Carlos | matchicalcom** [05:56 - 06:05]: So on the short term, the most that we could do would be like fifty percent of his time, but can go through it in a little bit.
**Carlos | matchicalcom** [06:06 - 06:11]: I wear that so the magical application it really works.
**Carlos | matchicalcom** [06:12 - 06:14]: I will send you the PowerPoint at the end.
**Carlos | matchicalcom** [06:15 - 06:29]: So this is better as you see, doesn't really like photos, but I think I have to say the summary, the management summary or this that you guys created, I think it's cool.
**Carlos | matchicalcom** [06:29 - 06:30]: It describes in.
**Carlos | matchicalcom** [06:32 - 06:39]: I would compare him mainly to something similar to me, because more backend he prefers backhand, he also can do a little bit front end.
**Carlos | matchicalcom** [06:39 - 06:47]: But this is like this is the guy that can manage the team, can be tech lead of the team, can just report others to evolve.
**Carlos | matchicalcom** [06:47 - 06:51]: So great consultant this is Pedro.
**Carlos | matchicalcom** [06:51 - 06:53]: Then who else do?
**Carlos | matchicalcom** [06:53 - 06:54]: I have available.
**Carlos | matchicalcom** [06:56 - 06:57]: These last three.
**Carlos | matchicalcom** [06:57 - 07:00]: They are going to finish a project next week.
**Carlos | matchicalcom** [07:00 - 07:02]: So that's why they are available.
**Carlos | matchicalcom** [07:02 - 07:09]: If we want in January, we can put them on the team instead of me assigning them other projects.
**Carlos | matchicalcom** [07:09 - 07:15]: Okay, Philip is from this list the one that works with me for longer.
**Carlos | matchicalcom** [07:16 - 07:20]: He has been working with me since twenty-eleven as a freelancer.
**Carlos | matchicalcom** [07:20 - 07:25]: At the time and this is a front end guy.
**Carlos | matchicalcom** [07:25 - 07:26]: He loves front end.
**Carlos | matchicalcom** [07:26 - 07:31]: You breathe front end just don't like too much business logic.
**Carlos | matchicalcom** [07:31 - 07:32]: He really don't don't.
**Carlos | matchicalcom** [07:32 - 07:42]: He doesn't like to be involved in all that confusing business and all that this guy likes front end also can do the rest of our system so he can do queries.
**Carlos | matchicalcom** [07:43 - 07:46]: All of the guys that are working with me.
**Carlos | matchicalcom** [07:46 - 07:50]: They know how to do these things, but this is like my front end specialist.
**Carlos | matchicalcom** [07:51 - 07:51]: This is.
**Carlos | matchicalcom** [07:52 - 07:57]: He is the reason that I don't touch front end, because every time that they have like a big thing front end I send it to him.
**Konsti | matchicalcom** [07:59 - 08:05]: So in this case like working with him would work best when we would have like mockups, right?
**Carlos | matchicalcom** [08:06 - 08:08]: Yes, you give you a mockup.
**Carlos | matchicalcom** [08:08 - 08:12]: Oh, and this is the fastest guy that I know implementing stuff in our systems.
**Carlos | matchicalcom** [08:12 - 08:15]: It's not perfect, but this guy works fast.
**Carlos | matchicalcom** [08:16 - 08:41]: Yeah, it's just very focused, but yes, so normally the workflow that we normally have and I will show that my web designer just builds in Figma, sometimes with a lot of CSS, sometimes with less CSS and Philip is one that goes there and implements it most of the time and normally build the templates so the other developers can just reuse the weblogs with all the CSS in place already.
**Carlos | matchicalcom** [08:44 - 08:46]: So just moving on and just sorry.
**Tommy | matchicalcom** [08:49 - 08:55]: Very interesting was the parsing also good as the management summary and everything.
**Carlos | matchicalcom** [08:55 - 09:10]: Yeah, yeah, it was for I just didn't touch, didn't test the last one, but yes, it was and it was in Portuguese, so it misses a little bit of detail, but the CD's were not very full, so didn't get Okay, something happened here?
**Carlos | matchicalcom** [09:10 - 09:16]: Why something always breaks when we're showing, but it doesn't.
**Tommy | matchicalcom** [09:16 - 09:17]: It doesn't matter so it doesn't matter.
**Carlos | matchicalcom** [09:17 - 09:25]: I know, I know no, but I have a link here, so I'm going to send you the spreadsheet and you get the link for each consultant in the magical app.
**Tommy | matchicalcom** [09:27 - 09:30]: Perfect, But in the end, Carlos.
**Konsti | matchicalcom** [09:33 - 09:36]: This one looks like it's in the wrong tenant, maybe, or I don't know.
**Carlos | matchicalcom** [09:37 - 09:38]: Yes.
**Carlos | matchicalcom** [09:38 - 09:45]: So it opened the browser in Firefox that I was touching the bridging problem.
**Carlos | matchicalcom** [09:45 - 09:47]: That's why the link didn't work.
**Carlos | matchicalcom** [09:48 - 09:50]: Okay, but no worries.
**Carlos | matchicalcom** [09:50 - 09:53]: Then we have Bernard, how old is Philippine?
**Carlos | matchicalcom** [09:54 - 09:57]: Philippe is forty nine and you mentioned.
**Konsti | matchicalcom** [09:59 - 10:00]: He'S not so much into business logic.
**Konsti | matchicalcom** [10:00 - 10:12]: What about like obviously part of, okay, not so much right, because what you like, what I'm kind of learning from you is like part of front end is only like.
**Konsti | matchicalcom** [10:12 - 10:20]: Fetching basic data with aggregates, but as soon as it needs like more sophisticated things, you do like an advanced SQL and.
**Carlos | matchicalcom** [10:22 - 10:25]: But he knows how to write advanced SQL, right?
**Carlos | matchicalcom** [10:25 - 10:26]: It's just a matter of.
**Carlos | matchicalcom** [10:26 - 10:28]: For Philippe I've learned to work to optimize.
**Carlos | matchicalcom** [10:28 - 10:42]: Philippe skills is give me a lot of work in terms of front end, just building pages normally for very complex workflows when you have multiple steps and a lot of things need to happen on the database.
**Carlos | matchicalcom** [10:42 - 10:45]: We have someone that prepares the APIs just the way.
**Carlos | matchicalcom** [10:45 - 10:48]: That we normally that could be.
**Tommy | matchicalcom** [10:50 - 10:56]: That could be something which is very important for chico in the front end as well or.
**Tommy | matchicalcom** [10:57 - 11:07]: To have really someone who is capable to shoot screens in the end or that's sometimes what we need as well or so I think sometimes.
**Tommy | matchicalcom** [11:09 - 11:11]: It could be really a good.
**Tommy | matchicalcom** [11:16 - 11:27]: Because I think in some cases it's only important to make it pixel perfect to make the screens good to make them performant to do and yeah, I think that.
**Konsti | matchicalcom** [11:29 - 11:30]: Did they ever work.
**Konsti | matchicalcom** [11:31 - 11:35]: I know ODC eleven is not so different, but there are some differences For sure.
**Carlos | matchicalcom** [11:37 - 11:39]: Philippe has worked in ODC.
**Carlos | matchicalcom** [11:40 - 11:46]: Pedro I think just certified in ODC, also, but it is just small projects, very small stuff.
**Carlos | matchicalcom** [11:51 - 11:52]: Yeah, yeah.
**Carlos | matchicalcom** [11:52 - 11:56]: Bernardo is he only has four years of development experience.
**Carlos | matchicalcom** [11:56 - 11:59]: He came out of college to work with me.
**Carlos | matchicalcom** [12:00 - 12:03]: He spent like nine months in big consultant.
**Carlos | matchicalcom** [12:03 - 12:04]: I think it was accenture or something like that.
**Carlos | matchicalcom** [12:04 - 12:08]: Okay, double check one of those big ones and then.
**Carlos | matchicalcom** [12:10 - 12:11]: Where do I have it?
**Carlos | matchicalcom** [12:13 - 12:14]: This one, yeah.
**Carlos | matchicalcom** [12:14 - 12:16]: So Bernardo, yeah.
**Carlos | matchicalcom** [12:16 - 12:21]: So again less experience and I will explain why I'm presenting him.
**Carlos | matchicalcom** [12:21 - 12:25]: It's of course it's he has less experience so it is less.
**Carlos | matchicalcom** [12:27 - 12:28]: Financially.
**Carlos | matchicalcom** [12:29 - 12:34]: It's a it's a different monthly fee, so I think it might make sense to bring it to the team.
**Carlos | matchicalcom** [12:34 - 12:41]: Not really sure of all the details yet, but we'll get to there so let me just see the engagements, but no.
**Carlos | matchicalcom** [12:41 - 12:46]: So you see that the app has updated, so I need refresh.
**Carlos | matchicalcom** [12:48 - 12:51]: So Bernardo is a developer, right?
**Carlos | matchicalcom** [12:51 - 12:52]: He knows how to implement stuff.
**Konsti | matchicalcom** [12:53 - 12:56]: Now you're again in a different tenant, right?
**Tommy | matchicalcom** [12:56 - 12:59]: You have only to switch the tenant if you want to.
**Tommy | matchicalcom** [13:03 - 13:06]: Consultancies, right consultancies and then you can.
**Carlos | matchicalcom** [13:06 - 13:11]: Switch to yeah, wrong, wrong color.
**Carlos | matchicalcom** [13:13 - 13:14]: Almost know the app.
**Tommy | matchicalcom** [13:16 - 13:18]: That'S the admin backend.
**Carlos | matchicalcom** [13:18 - 13:28]: Yeah, I'm getting used to it yet now, yeah, so you can see it was price watercoopers.
**Carlos | matchicalcom** [13:28 - 13:44]: It was on price for from the nine mats for nine months and then twenty four twenty seven It's my company and he's working projects for a step ahead, but it's still my play just project that you participate.
**Carlos | matchicalcom** [13:46 - 13:54]: So and last I know that you guys didn't ask for it, but I present because it's going to be available.
**Carlos | matchicalcom** [13:54 - 14:08]: Lino is the web designer, it's my web designer and he came from a graphics pagination background so he is really a graphic designer by training he used to do magazines and those kind of stuff.
**Carlos | matchicalcom** [14:08 - 14:26]: But since in Portugal that's in pretty much overall the world is just not a lot of jobs on that because they are reducing in like last fifteen years he converted himself to a web developer and CSS, I would say front end specialist on the CSS part, right?
**Carlos | matchicalcom** [14:26 - 14:30]: So he really knows how to write CSS and do all that.
**Tommy | matchicalcom** [14:32 - 14:40]: He is also just one so he know he is technical, but he is also the.
**Carlos | matchicalcom** [14:40 - 14:48]: Figma specialist and he normally builds CSS in Figma and we copy paste them to ODC.
**Carlos | matchicalcom** [14:48 - 14:53]: That's the normal way that we work or not we feel it does it.
**Carlos | matchicalcom** [14:53 - 15:10]: But Linu knows ODC also so he knows the service studio and if he can just build themes normally we keep him busy with just Figma and I think his inkscape that he works to draw like logos or to create images from scratch.
**Konsti | matchicalcom** [15:14 - 15:15]: What is his background?
**Konsti | matchicalcom** [15:15 - 15:17]: Like you mentioned like.
**Konsti | matchicalcom** [15:19 - 15:22]: So in terms Oft like how old is he just?
**Carlos | matchicalcom** [15:22 - 15:25]: Lino is forty six.
**Carlos | matchicalcom** [15:27 - 15:27]: Okay?
**Konsti | matchicalcom** [15:27 - 15:29]: And what about him regarding business?
**Konsti | matchicalcom** [15:29 - 15:40]: Because like for us, when it comes to design, it's kind of important that they that we like because designer sometimes it's the closest to business, sometimes even.
**Carlos | matchicalcom** [15:41 - 15:47]: Normally what the way that I've been doing costing is We have one of the senior guys.
**Carlos | matchicalcom** [15:48 - 15:50]: Telling him we need this in the screen.
**Carlos | matchicalcom** [15:50 - 15:53]: We need this in the screen and he figures out the layout.
**Carlos | matchicalcom** [15:54 - 15:55]: So that's normally.
**Carlos | matchicalcom** [15:56 - 15:59]: I wasn't normally the one doing it or Pedro?
**Carlos | matchicalcom** [15:59 - 16:02]: So normally Linux works very close to one of the senior guys.
**Carlos | matchicalcom** [16:02 - 16:16]: Just make sure that normally with me, Pedro and I have another one that is here not in the list, because it's working in our project that he works closely with us to create the mockups and we review the mockups first before implementation.
**Tommy | matchicalcom** [16:17 - 16:27]: Sure, so he he will be also so you know our design for sure and you know what we'd like to build?
**Tommy | matchicalcom** [16:27 - 16:37]: You do have a plan, Do you think he could be or he is capable of the requirements we are asking for.
**Tommy | matchicalcom** [16:37 - 16:42]: So it's kind of, because I think Conci is really asking for.
**Tommy | matchicalcom** [16:42 - 16:52]: Okay, we need someone who can do the Figma mockups for sure, but also understand, so you know that our application logic in the end.
**Tommy | matchicalcom** [16:52 - 16:58]: Is kind of complicated in the end and we have to display.
**Tommy | matchicalcom** [17:00 - 17:05]: A lot of things in the end in a decent way, because users are users.
**Tommy | matchicalcom** [17:06 - 17:06]: Do you think.
**Tommy | matchicalcom** [17:08 - 17:09]: He is capable of.
**Carlos | matchicalcom** [17:10 - 17:11]: That stuff.
**Carlos | matchicalcom** [17:13 - 17:19]: By itself, It will take a long time to get used to all these concepts, even for me, right?
**Carlos | matchicalcom** [17:19 - 17:23]: So for everyone it's a lot of concepts, it's new stuff, but.
**Carlos | matchicalcom** [17:25 - 17:27]: I would normally break down the requirements for him.
**Carlos | matchicalcom** [17:27 - 17:40]: So not sure how do you guys talk with the company that is currently doing all the Figma, but there need to be some kind of sessions to detail things, right?
**Carlos | matchicalcom** [17:40 - 17:45]: So normally I reserve the way thinking of the layout.
**Carlos | matchicalcom** [17:45 - 17:48]: Sometimes I ask him just from a blank page, right?
**Carlos | matchicalcom** [17:48 - 17:54]: So we have this need just please solve it and he comes up with something that normal is never the first approach.
**Carlos | matchicalcom** [17:54 - 17:56]: Then we can iterate from there, but.
**Carlos | matchicalcom** [17:58 - 18:03]: With time, yes, you probably could do it by himself, but I would see him.
**Carlos | matchicalcom** [18:04 - 18:18]: Working with me and Pedro and seniors mainly to details that we have Me and Pedro with more with you guys just understanding the requirement.
**Konsti | matchicalcom** [18:20 - 18:21]: Okay, got it.
**Carlos | matchicalcom** [18:22 - 18:23]: But that's one approach.
**Carlos | matchicalcom** [18:23 - 18:24]: There are others of course.
**Tommy | matchicalcom** [18:24 - 18:25]: So we can.
**Tommy | matchicalcom** [18:25 - 18:44]: We could also work so Lino could, but also could be in our exploration, because what we are thinking about design starts if we have the first idea from the story, we bring Lino and some technical experts in and ask how is this possible?
**Tommy | matchicalcom** [18:45 - 18:46]: What do you think?
**Tommy | matchicalcom** [18:46 - 18:52]: But it's always easy to have one first visual draft out of it, because that's something.
**Tommy | matchicalcom** [18:52 - 19:05]: And there we yeah, we see the design so we see design also as a critical part of our process, because actually you know that colors we don't have any process in place.
**Tommy | matchicalcom** [19:05 - 19:10]: It's It's chaos pure, so that's the truth in the end, so we don't.
**Carlos | matchicalcom** [19:10 - 19:11]: Have to do it.
**Tommy | matchicalcom** [19:11 - 19:14]: We can speak directly, so that's sure.
**Carlos | matchicalcom** [19:14 - 19:22]: Sure, of course normally, normally the Figma works very well for that part, right?
**Carlos | matchicalcom** [19:22 - 19:25]: So you can ideate and just evolve.
**Carlos | matchicalcom** [19:27 - 19:32]: The concepts to something that you are comfortable because and you can click and you can do that stuff.
**Carlos | matchicalcom** [19:32 - 19:37]: So I think Figme is a very cool tool that we like a lot, because it helps sure.
**Konsti | matchicalcom** [19:40 - 19:41]: Slightly off topic.
**Konsti | matchicalcom** [19:41 - 19:44]: But Chico made you aware about this language thing, right?
**Carlos | matchicalcom** [19:44 - 19:47]: Oh, it's fixed, It should be fixed, Let me see.
**Carlos | matchicalcom** [19:48 - 19:49]: Refresh.
**Konsti | matchicalcom** [19:54 - 19:55]: Perfect, good.
**Carlos | matchicalcom** [19:58 - 19:59]: Perfect.
**Tommy | matchicalcom** [19:59 - 20:06]: But I was looking at that and I was just thinking, oh Jesus Christ, our CV passa is working.
**Carlos | matchicalcom** [20:10 - 20:11]: So I think.
**Carlos | matchicalcom** [20:12 - 20:16]: And you guys asked me for two seniors, right?
**Carlos | matchicalcom** [20:17 - 20:29]: So my idea of including Bernardo here, because it's not a senior, he's far from being a senior is since Pedro can only have like fifty percent for the initial months, we could complement him with Bernardo.
**Carlos | matchicalcom** [20:29 - 20:38]: Okay, if you guys want of course, so I think more you're probably interested is always comes back to numbers, right?
**Carlos | matchicalcom** [20:38 - 20:40]: So let me just check this here.
**Carlos | matchicalcom** [20:44 - 20:45]: What I was thinking.
**Carlos | matchicalcom** [20:45 - 20:50]: So if we guys, you guys mentioned that you wanted like more long-term people who don't.
**Carlos | matchicalcom** [20:50 - 20:51]: Want rotation in the team.
**Carlos | matchicalcom** [20:51 - 21:00]: So if we go with the twelve month agreement, so all year we could do like I think more feasible pricing.
**Konsti | matchicalcom** [21:00 - 21:13]: Because we can, Carlos maybe we can go with twelve months, but we need the flexibility of things go bad, like basically I'm not even meaning like if things go bad with Pedro, but.
**Konsti | matchicalcom** [21:16 - 21:21]: Also if things go bad from a business perspective, then we need to have the flexibility.
**Konsti | matchicalcom** [21:22 - 21:23]: But otherwise we are always shooting for.
**Carlos | matchicalcom** [21:23 - 21:33]: Long term, but constantly on that and we'll see that I'm always very flexible on these things we could do like two six months, right?
**Carlos | matchicalcom** [21:33 - 21:43]: So on my side I just need some kind of security that if I'm not going with them in other projects that you guys are comfortable.
**Konsti | matchicalcom** [21:46 - 21:50]: I know like how you mean in terms of calculation another question.
**Konsti | matchicalcom** [21:50 - 21:55]: I know obviously you already realized that we don't track any numbers and so on.
**Konsti | matchicalcom** [21:55 - 22:03]: But it's a little bit about work ethics, because some are very serious about like my job is from nine to five and at five it's over.
**Konsti | matchicalcom** [22:03 - 22:05]: So what about the work ethics of.
**Carlos | matchicalcom** [22:08 - 22:15]: Already say that Bernardo is the one that is a little bit more strict with his schedule, because it's the younger one and it's the younger generation.
**Carlos | matchicalcom** [22:16 - 22:19]: The rest of the guys will answer your phone at the weekend.
**Carlos | matchicalcom** [22:20 - 22:26]: I normally even have to say Philippe not to talk with me every week, because he just this don't worry about.
**Carlos | matchicalcom** [22:26 - 22:44]: Like the even the culture or the commitment because I've been managing them for a decade now, so yes, I fully trust them and these are guys that can just work by themselves.
**Carlos | matchicalcom** [22:44 - 22:45]: You don't need to worry too much.
**Carlos | matchicalcom** [22:45 - 22:52]: You give them tests, the things appear then if you have a doctor appointment at three PM they go.
**Carlos | matchicalcom** [22:52 - 22:58]: And they just take home, work to do at home and they finalize things.
**Konsti | matchicalcom** [22:58 - 23:04]: Sure, sure, sure was like that's It's like there's multiple parts that need to fit.
**Konsti | matchicalcom** [23:04 - 23:06]: Obviously we need to have the skill fit then.
**Konsti | matchicalcom** [23:06 - 23:07]: I think culture fit.
**Konsti | matchicalcom** [23:07 - 23:16]: I'm already quite bullish because like when you work with them together for a decade and we work with you together, like that's my least.
**Carlos | matchicalcom** [23:19 - 23:27]: Yeah, like Pedro likes requirements like detailed requirements, because he likes to be fully autonomous, right?
**Carlos | matchicalcom** [23:27 - 23:30]: So this is a little bit early without having all the backlog.
**Carlos | matchicalcom** [23:30 - 23:33]: For Pedro for example, I know him personally, right?
**Carlos | matchicalcom** [23:33 - 23:35]: He can adapt of course, but he likes.
**Konsti | matchicalcom** [23:37 - 23:40]: We need to get there anyway, yeah, yeah.
**Carlos | matchicalcom** [23:40 - 23:51]: Or with him for example just have a meeting just to clarify you ask a lot of questions even more than I do just to understand because he really likes to get things.
**Carlos | matchicalcom** [23:53 - 23:54]: Well done, right?
**Carlos | matchicalcom** [23:54 - 24:06]: At first it doesn't really like to be refactoring things that heal, but it's like some personal tweaks that we understand ourselves since we have been working together for.
**Konsti | matchicalcom** [24:09 - 24:11]: My my gut feeling, my gut feeling.
**Konsti | matchicalcom** [24:11 - 24:21]: Tommy, please go ahead and also state yours, but my gut feeling is like maybe like with Pedro and Philippe I'm going with these two guys.
**Konsti | matchicalcom** [24:24 - 24:24]: Like.
**Konsti | matchicalcom** [24:26 - 24:28]: From my gut feeling.
**Konsti | matchicalcom** [24:28 - 24:31]: I think they could be the next two candidates for being a best.
**Tommy | matchicalcom** [24:32 - 24:33]: Do you think so?
**Tommy | matchicalcom** [24:33 - 24:36]: So just to clarify I'm.
**Tommy | matchicalcom** [24:38 - 24:43]: He will be from April then one hundred percent, or?
**Carlos | matchicalcom** [24:44 - 24:46]: Yeah, he can, yes, we can agree on that.
**Carlos | matchicalcom** [24:46 - 24:51]: Tom, it's just I have some projects in place that I cannot.
**Carlos | matchicalcom** [24:51 - 24:53]: I want Pedro in the Magical team because I want.
**Carlos | matchicalcom** [24:53 - 25:02]: I think it will be very good for for magical it just I cannot afford just to remove it from all the other stuff that I have currently ongoing.
**Carlos | matchicalcom** [25:03 - 25:06]: When I start working with magical, I pass in some of the things that I will.
**Tommy | matchicalcom** [25:09 - 25:14]: Okay, so he will be then from May, or whatever that we yeah, it.
**Carlos | matchicalcom** [25:14 - 25:16]: Can be one hundred percent, it should.
**Tommy | matchicalcom** [25:16 - 25:20]: Right, yeah, and this fee is the one hundred percent fee, or it's not.
**Carlos | matchicalcom** [25:20 - 25:23]: The fifty we could double that yes.
**Carlos | matchicalcom** [25:25 - 25:29]: No, no, this is one hundred percent the offco yes I think it's notified.
**Tommy | matchicalcom** [25:29 - 25:33]: As a solution architect you can't earn to two hundred k.
**Tommy | matchicalcom** [25:33 - 25:37]: But yeah, okay, from this perspective I hope so from this perspective.
**Tommy | matchicalcom** [25:39 - 25:44]: I also think Pedro and Felipe is would be I think it.
**Tommy | matchicalcom** [25:44 - 25:58]: Would be the right move and I also think Bernardo I don't know because we do have we do have if we're just thinking about yeah so from now only from the deck perspective we have.
**Tommy | matchicalcom** [25:58 - 26:15]: Ukalos, we have Pedro for the heavy back and stuff we do have Chico and Felipe for the front and heavy things, we have conste for the AI Stuff and Bernardo.
**Tommy | matchicalcom** [26:16 - 26:25]: He's a developer so I know that the price is kind of attractive but I'm not sure because at this moment.
**Tommy | matchicalcom** [26:27 - 26:46]: I don't know his skills but you say he's far away from a really senior death and what we need actually I think is really we need an experienced team at this point I'm really convinced about this concept please or Carlos, you also you should also say what.
**Konsti | matchicalcom** [26:47 - 26:51]: Better in providing you also like requirements and everything still it's like.
**Konsti | matchicalcom** [26:53 - 26:59]: Currently working in our team and it won't change from today to tomorrow requires like really.
**Carlos | matchicalcom** [26:59 - 26:59]: Some.
**Konsti | matchicalcom** [27:03 - 27:08]: It'S tough and experience can help you to steer I know.
**Carlos | matchicalcom** [27:12 - 27:17]: Once again peer cannot be one hundred percent it might help just increase speed a little bit.
**Carlos | matchicalcom** [27:19 - 27:32]: What I would have is sometimes you have seniors that are not really doing senior stuff right so I'm going to fix pin this afternoon this is the kind of test that you can easily delegate like to debug Carlos.
**Konsti | matchicalcom** [27:32 - 27:34]: If we would not be cash flow constrained.
**Konsti | matchicalcom** [27:34 - 27:35]: I would say.
**Konsti | matchicalcom** [27:35 - 27:36]: Let's go for it.
**Konsti | matchicalcom** [27:36 - 27:40]: But right now I would say okay, what is the strategic best move?
**Konsti | matchicalcom** [27:40 - 27:49]: It's maybe even skip the January with Pedro and start with Pedro in February but start with Philippe in January right away.
**Konsti | matchicalcom** [27:50 - 28:02]: Then we can also use the time a little bit to get ahead with a backlog and we need to invest in design to basically yeah but.
**Tommy | matchicalcom** [28:02 - 28:03]: That'S also my point.
**Carlos | matchicalcom** [28:07 - 28:08]: I don't know.
**Tommy | matchicalcom** [28:08 - 28:19]: Lino to be honest, but I don't know him and I know the guys from the story so the Polish company are doing a great job yeah, and they did the design for us.
**Tommy | matchicalcom** [28:21 - 28:33]: But if I like the idea if you know him so many years I see in a CVC does a lot of you ex for the pro-champs or for the.
**Tommy | matchicalcom** [28:33 - 28:34]: Last ten years he's doing.
**Tommy | matchicalcom** [28:36 - 28:42]: The whole day web design so the question is if you are used to him.
**Konsti | matchicalcom** [28:44 - 28:44]: And.
**Tommy | matchicalcom** [28:45 - 28:59]: We will have a hub there, yeah, Pedro, Felipe, Lino, you Chico, I don't know if it's if we should really so because what were our thoughts on this?
**Tommy | matchicalcom** [29:00 - 29:33]: I don't know, I know, I know and I'm also I'm not I would what I'm most skeptical to clearly state to clearly state something I'm very I'm convinced that the story could do the job, but it will get its will get expensive And what I was what we were just thinking about because we tried to hire someone Nick, yeah, in the past because we think it's so important for us to have it in house and we we.
**Tommy | matchicalcom** [29:33 - 29:35]: Are we are kind of colors.
**Tommy | matchicalcom** [29:35 - 29:39]: I know you have a company, but we are just to be clear.
**Tommy | matchicalcom** [29:39 - 29:47]: Also we are looking for or we are just thinking about that You are team members of Magical.
**Tommy | matchicalcom** [29:47 - 29:54]: Yes, you are so everyone who is joining should be treated like employee.
**Carlos | matchicalcom** [29:55 - 29:56]: That's the idea.
**Carlos | matchicalcom** [29:57 - 30:00]: I don't want these guys to be three months with magical.
**Carlos | matchicalcom** [30:00 - 30:02]: And then just keep moving on, right?
**Carlos | matchicalcom** [30:02 - 30:05]: No, exactly this is a partnership that we are.
**Carlos | matchicalcom** [30:05 - 30:17]: I'm fully involved and I'm bringing my team as necessary of course because I first I trust my Chico the business that we are building together and I think they will be a right fit.
**Carlos | matchicalcom** [30:20 - 30:24]: Hungry spaghetti, spaghetti, the only thing, the.
**Konsti | matchicalcom** [30:24 - 30:29]: Only thing that I'm a little bit like the only thing that is in my head.
**Konsti | matchicalcom** [30:29 - 30:32]: Like we realized with Nick.
**Konsti | matchicalcom** [30:34 - 30:41]: How much more effort it takes if There's little about like business and Carlos.
**Konsti | matchicalcom** [30:41 - 30:50]: You mentioned yeah, you can compensate this and you can tell, but then obviously you need to spend time to do like the business and then we have a three like I communicate to.
**Konsti | matchicalcom** [30:50 - 30:51]: You.
**Tommy | matchicalcom** [30:52 - 30:54]: No, no, no, no, no, no conste.
**Carlos | matchicalcom** [30:54 - 30:56]: I don't think that I think there.
**Konsti | matchicalcom** [30:56 - 31:14]: I think there's a spot where we can designer, but the spot is probably at a point where we are way more mature with our, with our design and have more like we have this kind of screens for this is this and it's just like plug together the pieces right.
**Tommy | matchicalcom** [31:18 - 31:27]: At this point I'm not so sure about it to be honest, to be honest I can totally, I know it's kind of a bit for us.
**Tommy | matchicalcom** [31:27 - 31:35]: Yeah, totally so Carlos so I think what can we decide so what can we really decide?
**Tommy | matchicalcom** [31:35 - 31:40]: Is we I think the best idea is to bring Pedro in.
**Tommy | matchicalcom** [31:42 - 31:43]: Pedro and Felipe.
**Carlos | matchicalcom** [31:44 - 31:45]: Yes, yes, I can.
**Tommy | matchicalcom** [31:45 - 32:06]: I think we should really think we should follow this idea, so we should follow this idea and we should go with them if we if we raise money or whatever or see everything works fine, we should shoot for Bernardo as well, but at this moment I think.
**Tommy | matchicalcom** [32:08 - 32:18]: We have to wait until EverythingEverything regarding the cash flow, regarding the investment, regarding, so otherwise it's a little bit too uncertain.
**Tommy | matchicalcom** [32:18 - 32:19]: You know what I mean?
**Tommy | matchicalcom** [32:19 - 32:22]: And then we have to say every month, oh yeah, can we afford it?
**Tommy | matchicalcom** [32:23 - 32:27]: Can we afford it not so now let's kind of know to be very transparent colors.
**Tommy | matchicalcom** [32:27 - 32:29]: At this point we need to show.
**Konsti | matchicalcom** [32:29 - 32:30]: You the numbers, we need to show.
**Tommy | matchicalcom** [32:30 - 32:34]: You the numbers, we can show you the numbers and what the ideas behind.
**Carlos | matchicalcom** [32:34 - 32:34]: You should.
**Tommy | matchicalcom** [32:36 - 32:41]: You are a core member, we are totally transparent, but in terms.
**Carlos | matchicalcom** [32:41 - 32:54]: Of speed, people, financial, I haven't been too involved, but in terms of speed, in terms of development, guys, you two need to keep your focus and I'm not saying what you should do, but that's just my opinion.
**Carlos | matchicalcom** [32:54 - 33:06]: Okay, guys, all the ideas, let the details to me to Pedro, to other the seniors to design it and to help to implement Exactly exactly.
**Carlos | matchicalcom** [33:06 - 33:24]: You guys are the business owners, owners in terms of the product owners and just keep the ideas, make the first drafts and then let the we have been doing this for like all our lives in terms of professionally so let us just give it, give it a shot, right?
**Carlos | matchicalcom** [33:24 - 33:26]: Build the figma with you guys right?
**Carlos | matchicalcom** [33:26 - 33:37]: So, but without all the involvement and holding that you guys are doing exactly because you guys will be the bottleneck of the company.
**Tommy | matchicalcom** [33:37 - 33:38]: Exactly.
**Konsti | matchicalcom** [33:38 - 33:39]: And that's why we don't want to.
**Carlos | matchicalcom** [33:39 - 33:44]: Be, I didn't want to be that mean, but yeah, you are, that's true, that's true.
**Tommy | matchicalcom** [33:44 - 33:46]: No, no, Carlos, you can be direct.
**Carlos | matchicalcom** [33:46 - 33:48]: Because you guys are, yeah, I know, I know.
**Carlos | matchicalcom** [33:48 - 33:56]: But you guys are taking financials, you are doing board meetings, you are doing and those things are not delegatable, right?
**Carlos | matchicalcom** [33:56 - 33:57]: Those are the things that you have to.
**Carlos | matchicalcom** [33:57 - 34:01]: Or else you hire a CEO, that would be another approach right?
**Carlos | matchicalcom** [34:01 - 34:09]: You write, you hire someone to manage the company and you keep yourselves with regular employees doing employee stuff, right?
**Tommy | matchicalcom** [34:10 - 34:27]: Carlos, actually, I'm writing, I'm parsing CSV files and picking things together and pushing that to outsidence that were my last three days, so that's a nightmare.
**Tommy | matchicalcom** [34:27 - 34:33]: So yeah, that's the good and the bad thing on the good side.
**Tommy | matchicalcom** [34:33 - 34:40]: We can do that for our own and we are used to do that for our own in the past, but we realized.
**Tommy | matchicalcom** [34:42 - 34:44]: We should not do that.
**Tommy | matchicalcom** [34:44 - 34:50]: So for example the bridging ID migration should be a part which should be overhanded to you, Carlos, in the end.
**Tommy | matchicalcom** [34:50 - 34:54]: So we discussed it yesterday, so that's your part in the end.
**Tommy | matchicalcom** [34:54 - 35:09]: So because you are capable of these things for sure, you need the requirements, you need to understand what to be done there, but const should care about roles and skills at this moment, I think the AI stuff and this.
**Tommy | matchicalcom** [35:09 - 35:18]: Is very hard to overhand and we will see how to handle that in the future, but that talent isn't out there at this moment.
**Tommy | matchicalcom** [35:18 - 35:21]: So we have to be also realistic.
**Carlos | matchicalcom** [35:22 - 35:26]: And I was saying that part it's core for you, for the company.
**Carlos | matchicalcom** [35:26 - 35:33]: So I'm not sure if you really want to delegate that too much to pass, too much knowledge outside, as for.
**Tommy | matchicalcom** [35:33 - 35:38]: Example the product flow, what features, how's the feature.
**Tommy | matchicalcom** [35:38 - 35:39]: So what we really need.
**Tommy | matchicalcom** [35:39 - 35:40]: We see it with Chico.
**Tommy | matchicalcom** [35:41 - 35:42]: We have to explain everything to Chico.
**Tommy | matchicalcom** [35:42 - 35:48]: Chico is asking them back and we have to think forward.
**Tommy | matchicalcom** [35:48 - 35:54]: We have to say, okay, that's needed in that way, because, yeah, and then we can discuss for sure, but.
**Tommy | matchicalcom** [35:56 - 35:57]: Anyways, but.
**Tommy | matchicalcom** [35:59 - 36:03]: From a design perspective constant, we should really.
**Carlos | matchicalcom** [36:05 - 36:07]: Let'S do one thing.
**Carlos | matchicalcom** [36:07 - 36:11]: Linu in January will work for magical free.
**Carlos | matchicalcom** [36:13 - 36:14]: Let's give it a try.
**Carlos | matchicalcom** [36:16 - 36:22]: You guys can decide, okay, But if you want, I'll put it in the team just to see how it could help.
**Konsti | matchicalcom** [36:23 - 36:30]: And let's not say, let's say, let's say not free is also bullshit.
**Carlos | matchicalcom** [36:30 - 36:32]: No, no, it costs time.
**Konsti | matchicalcom** [36:33 - 36:34]: Let's do the following.
**Konsti | matchicalcom** [36:35 - 36:36]: We tried out.
**Konsti | matchicalcom** [36:38 - 36:40]: If we decide, okay, it doesn't work, we split the costs.
**Konsti | matchicalcom** [36:40 - 36:42]: And if we continue, it's like we.
**Carlos | matchicalcom** [36:42 - 36:47]: Continue whatever I was available to put.
**Konsti | matchicalcom** [36:47 - 36:53]: It, because like the thing, yeah, we need we actually, we need to try it out when it works.
**Konsti | matchicalcom** [36:53 - 36:56]: It's much better than working with the agency one hundred percent.
**Konsti | matchicalcom** [36:56 - 36:58]: But the question is, does it work?
**Konsti | matchicalcom** [36:58 - 36:59]: And how good does it work?
**Konsti | matchicalcom** [36:59 - 36:59]: That's the big question.
**Carlos | matchicalcom** [37:00 - 37:02]: It will work, it will work.
**Carlos | matchicalcom** [37:04 - 37:05]: I'm confident, right?
**Carlos | matchicalcom** [37:05 - 37:08]: I think the main thing is in terms of communication.
**Carlos | matchicalcom** [37:08 - 37:09]: I think.
**Carlos | matchicalcom** [37:11 - 37:19]: One of the seniors need to be involved because translating everything from your words to business requirements to design.
**Konsti | matchicalcom** [37:20 - 37:22]: English, by the way, it's decent.
**Carlos | matchicalcom** [37:22 - 37:23]: It's not perfect.
**Tommy | matchicalcom** [37:25 - 37:29]: It's like ours, so like mine, like mine in that case.
**Carlos | matchicalcom** [37:29 - 37:33]: Yeah, right, yeah, you can understand English?
**Carlos | matchicalcom** [37:33 - 37:43]: It just gets embarrassed to speak a lot of English, but I sent him to to the United States for two weeks and he survived so yeah, so.
**Tommy | matchicalcom** [37:43 - 37:44]: You are perfect in English colors.
**Carlos | matchicalcom** [37:44 - 37:49]: Your English has read it not sure if it's perfect, but yeah, it's close.
**Tommy | matchicalcom** [37:49 - 37:51]: To close to for not a native one.
**Tommy | matchicalcom** [37:51 - 37:54]: It's crazy you are Prof.
**Tommy | matchicalcom** [37:54 - 38:00]: You're profiting from the pro-chance style that.
**Carlos | matchicalcom** [38:00 - 38:02]: Helped a lot to be more fluent.
**Carlos | matchicalcom** [38:02 - 38:04]: But even in training?
**Carlos | matchicalcom** [38:04 - 38:10]: I did like not to profess it so like those Oxford for the exams.
**Carlos | matchicalcom** [38:10 - 38:11]: I don't even know.
**Carlos | matchicalcom** [38:11 - 38:12]: I'm sure that they have like.
**Carlos | matchicalcom** [38:16 - 38:17]: Whatever.
**Tommy | matchicalcom** [38:18 - 38:19]: No, no, no, no, no.
**Tommy | matchicalcom** [38:19 - 38:28]: Only important stuff is I know and I would also suggest constantly we should really so we can.
**Tommy | matchicalcom** [38:28 - 38:43]: We don't have to decide now, but I know your opinion on the story stuff and also I'm also not one hundred percent clear, but if it works, it's the king way.
**Tommy | matchicalcom** [38:43 - 38:44]: It's the best thing.
**Tommy | matchicalcom** [38:44 - 38:51]: We can have out all out of one hand in one team, the team knows each other.
**Tommy | matchicalcom** [38:53 - 39:00]: We have one hub in Portugal, so that's so that was, yeah, yeah, I'm.
**Konsti | matchicalcom** [39:00 - 39:01]: With you, I'm with you.
**Konsti | matchicalcom** [39:01 - 39:05]: But we like that's the we need, we need probably we need to test it out.
**Tommy | matchicalcom** [39:07 - 39:14]: But it's a best idea to test it out, because why not from January on to test it out, constantly, why not, why not?
**Carlos | matchicalcom** [39:14 - 39:20]: I would suggest let's grab one of those modules that is not fully connected, like the CRM or something like that.
**Carlos | matchicalcom** [39:21 - 39:25]: Let's have some requirements and let's expand from that.
**Carlos | matchicalcom** [39:25 - 39:38]: So you guys decide the module and in a few days week or so we can have mockups ready to implement and let's implement them so we can just move very fast in some of those additional features that you guys want to add to the.
**Konsti | matchicalcom** [39:42 - 39:45]: Can you share us some of his work?
**Konsti | matchicalcom** [39:46 - 39:49]: Oh, sure we get some inspiration I will.
**Carlos | matchicalcom** [39:49 - 39:54]: Yeah, for example we just redesigned for City Hall Tubal.
**Carlos | matchicalcom** [39:54 - 39:57]: That is just close by where Chico lives.
**Carlos | matchicalcom** [39:58 - 39:59]: Redesign their public website.
**Carlos | matchicalcom** [40:00 - 40:04]: Part of it is implemented in WordPress, but he did all the design work for example.
**Carlos | matchicalcom** [40:05 - 40:18]: So he's doing design pre design for out systems and for things outside of out systems on out systems we restrict normally, restrict and I see that you guys don't do it too much just to facilitate implementation.
**Carlos | matchicalcom** [40:18 - 40:24]: I sometimes prefer things not get pretty, but that they work in it much faster to get there.
**Carlos | matchicalcom** [40:24 - 40:28]: Okay, you have a lot of custom components, we have a lot of implementation.
**Konsti | matchicalcom** [40:28 - 40:30]: Yeah, do you know what are my thoughts?
**Tommy | matchicalcom** [40:32 - 40:35]: Be back in one minute, guys just give me one minute, please.
**Konsti | matchicalcom** [40:35 - 40:36]: Is it sure?
**Carlos | matchicalcom** [40:36 - 40:36]: Sure.
**Konsti | matchicalcom** [40:40 - 40:44]: Let's maybe wait quickly for Tommy, that you also can hear the thoughts.
**Konsti | matchicalcom** [40:46 - 40:48]: What was the last sentence you just stated?
**Carlos | matchicalcom** [40:50 - 40:53]: Oh, that's as part of implementation that.
**Carlos | matchicalcom** [40:55 - 41:00]: Streamline a lot of the implementation is not to also don't take it wrong.
**Carlos | matchicalcom** [41:00 - 41:15]: Lose a lot of time with UX, so I just use all systems UI much more than you guys do you have a lot of custom components, custom things and those things take time and to maintain it and just keep evolving those things.
**Carlos | matchicalcom** [41:15 - 41:23]: I normally when I ask Lino to design things, I say try to keep it within the outsystems UI with the available.
**Carlos | matchicalcom** [41:23 - 41:23]: Components.
**Carlos | matchicalcom** [41:23 - 41:35]: Okay, don't go too crazy, because at the end of the day we're doing a business application and people don't really worry too much if it's flying around or things are blinking or not.
**Konsti | matchicalcom** [41:35 - 41:41]: Yeah, yeah, I know, I know, I know, I was also like, but that's a little bit of thing.
**Konsti | matchicalcom** [41:41 - 41:42]: That's true.
**Konsti | matchicalcom** [41:45 - 41:45]: That'S true.
**Konsti | matchicalcom** [41:47 - 41:57]: The point that Carlos was making Tommy was like we should stick much more to the default components basically from outsystems UI, because it would make us so much faster in the development.
**Konsti | matchicalcom** [42:00 - 42:01]: But I don't know.
**Tommy | matchicalcom** [42:01 - 42:01]: Yeah.
**Carlos | matchicalcom** [42:05 - 42:12]: You double speed Tommy, if you go with black straightforward components, but magical app is a prettier, It's pretty right.
**Carlos | matchicalcom** [42:12 - 42:15]: But normally for example on the admin pages, we don't lose a lot of.
**Tommy | matchicalcom** [42:15 - 42:19]: Time on the admin pages, min pages, yeah, go for it.
**Tommy | matchicalcom** [42:19 - 42:24]: But for the user we should stick to because actually we get the feedback.
**Tommy | matchicalcom** [42:24 - 42:26]: Oh yeah, we really use it.
**Tommy | matchicalcom** [42:27 - 42:29]: We have fun to use Magicka and.
**Konsti | matchicalcom** [42:29 - 42:29]: If we.
**Konsti | matchicalcom** [42:31 - 42:39]: And our current, our current winning strategy is not, we don't sell a top down from the management, we sell it bottom up.
**Konsti | matchicalcom** [42:40 - 42:43]: That's like we are most successful by selling bottom up.
**Konsti | matchicalcom** [42:45 - 42:47]: And therefore experiences is a factor.
**Konsti | matchicalcom** [42:47 - 42:50]: But like my honest, my honest thought is the following.
**Konsti | matchicalcom** [42:50 - 42:56]: Like I don't want to judge Pedro here in any way, as I don't know him.
**Konsti | matchicalcom** [42:58 - 43:01]: Sorry Lino, but my thoughts are the following.
**Konsti | matchicalcom** [43:02 - 43:07]: I think like our system when we think about all of.
**Konsti | matchicalcom** [43:09 - 43:17]: Will have quite a size with quite a lot of screens and a lot of also repeatable patterns, because we want to have a certain design thing and so on.
**Konsti | matchicalcom** [43:17 - 43:32]: And therefore we also need on the design side a workhorse basically that can like, okay, it's like we have these kind of layer makes a little bit different, that's it and we need this still as if we don't do it.
**Konsti | matchicalcom** [43:32 - 43:40]: And currently what we are doing is like we have it here and here, make it so and then we are eyeballing the design during the development, what's very bad?
**Konsti | matchicalcom** [43:40 - 43:53]: So if we have a workhorse, you can always close the gap between like OK the idea, the new feature in the screen always mockups and then implementation would be super good to have.
**Konsti | matchicalcom** [43:53 - 43:59]: But also on the other hand, we have some some cases where we have like more.
**Konsti | matchicalcom** [44:00 - 44:09]: Let'S say more complex tasks where really experienced designers can start shining on like, okay, how can this be done?
**Konsti | matchicalcom** [44:09 - 44:34]: How can you where it's not so much benchmarks out there, but it's more like we need to design something that works for specifically that and therefore, without knowing Dino, but I'm not one hundred percent sure if he can bring us what we need, but what we actually need more desperately is not the perfection of certain features design wise, but more like the workhorse.
**Konsti | matchicalcom** [44:38 - 44:39]: That'S my thoughts on it.
**Konsti | matchicalcom** [44:39 - 44:41]: So basically I would also not go.
**Konsti | matchicalcom** [44:42 - 45:03]: But the thing is, if we say, okay, for some parts we have very sophisticated designers and for other parts we have Lino then it's always we have like two different design, let's say teams with two different little bit approaches, two different ways of working in Figma, I don't know how to bridge the gap.
**Tommy | matchicalcom** [45:05 - 45:18]: Just one quick question so I know where you came from and I think we are discussing a little bit too long on this design actually, but I think so.
**Tommy | matchicalcom** [45:21 - 45:28]: If you say for example in your words translated for me only the story can make magical.
**Tommy | matchicalcom** [45:31 - 45:39]: I'm sure the other way around, if Lino gets into the product, he has time to think for magical forty hours a week.
**Tommy | matchicalcom** [45:40 - 45:52]: And on the other side we do have the story where we don't have direct access to Carol Dimitri is in between and whatever.
**Tommy | matchicalcom** [45:54 - 46:04]: I think if Lino has the possibility to and he is, that's why, Because we had this not bad experience, but this experience with.
**Konsti | matchicalcom** [46:08 - 46:08]: Able.
**Tommy | matchicalcom** [46:08 - 46:11]: To think into the product, you know what I mean color.
**Tommy | matchicalcom** [46:11 - 46:21]: So he wasn't able to understand what we are doing and then it was very hard for for him to bring something to life.
**Tommy | matchicalcom** [46:21 - 46:34]: He was, he was kind of, I don't know his, so we were looking at his things and we were just saying, oh yeah, do that, do that, do that, so that shouldn't happen, because.
**Konsti | matchicalcom** [46:35 - 46:40]: Tommy the thing is, the thing is not, I don't say the Polish guys are the only ones for sure not no.
**Konsti | matchicalcom** [46:41 - 46:55]: But the only thing is we already lost like with Nick kind of six weeks, where we tried to make something work and then realized, okay, it doesn't really work and with the Polish agency we also lost some time and sent them in the wrong direction right.
**Konsti | matchicalcom** [46:57 - 47:27]: There it was like we already achieved that they deliver something that helps like a lot of our screens were basically what they delivered, we just tweaked them also with CCV export, so we showed them the old one, they showed us like this is your new version and with little iterations like so basically there we have the proof for something that we know that we can make work and that's why I say oh shit, time is tight and we can try multiple things, but also budget is tight.
**Konsti | matchicalcom** [47:27 - 47:43]: So I cannot one hundred percent tell what's the right move, but I'm one hundred percent the rescue that when I take everything else and the design itself going with your team.
**Konsti | matchicalcom** [47:45 - 47:49]: Is by far the dominant most advantage way.
**Konsti | matchicalcom** [47:49 - 47:51]: One hundred percent agree on this.
**Konsti | matchicalcom** [47:51 - 47:54]: It's just about a matter of time output and quality.
**Tommy | matchicalcom** [47:56 - 48:00]: Yeah, understand Conci, but we aren't sure if we.
**Tommy | matchicalcom** [48:03 - 48:04]: In my opinion.
**Konsti | matchicalcom** [48:06 - 48:06]: I think.
**Tommy | matchicalcom** [48:06 - 48:11]: If I look at Lino for example, he has so much experience.
**Tommy | matchicalcom** [48:13 - 48:32]: He should know where to go first, because Carlos, you were also just, we could, you were also just in your first weeks, yeah, you were just OK focusing proof, I can help you in the end cut at this point.
**Tommy | matchicalcom** [48:32 - 48:38]: Carlos, you aren't able to manage the whole application, because that's not possible at this point.
**Carlos | matchicalcom** [48:39 - 48:42]: But I will get there, you will.
**Tommy | matchicalcom** [48:42 - 48:49]: Get there, yeah, you will get there, you have to, yeah, you have to, yeah, so no not say it in you have to.
**Tommy | matchicalcom** [48:49 - 48:55]: So that's our goal, that's our goal, that must be our goal, so pardon to say it in that words.
**Konsti | matchicalcom** [48:57 - 49:00]: Take the shower in five minutes, yeah, please.
**Tommy | matchicalcom** [49:00 - 49:05]: Don'T, don't take the camera, okay.
**Konsti | matchicalcom** [49:07 - 49:12]: Unfortunately, my laptop isn't waterproof, okay, to be.
**Tommy | matchicalcom** [49:12 - 49:15]: Honest, I like the idea and.
**Konsti | matchicalcom** [49:18 - 49:19]: Let'S figure things out.
**Konsti | matchicalcom** [49:19 - 49:21]: The only thing we need to be careful about.
**Konsti | matchicalcom** [49:21 - 49:36]: We know, we have like two big bottlenecks, Biggest bottleneck, number one is, we are not doing what we actually should do and that's the first we are, We are currently kind of not doing the first stage.
**Konsti | matchicalcom** [49:37 - 49:39]: The second stage is definitely design.
**Konsti | matchicalcom** [49:39 - 49:46]: I don't say the political agency response for everything and I think they will, especially for the workforce work, they will be too expensive kind of.
**Konsti | matchicalcom** [49:47 - 50:07]: But I don't, I don't know, don't want to make a fixed call here, but like that's the second stage and then the third stage is development and the thing is, if we really need, also to really be disciplined in the next month, that we can make the fucking first stage work, then also running a new experience in the second stage.
**Konsti | matchicalcom** [50:10 - 50:16]: Also with having more developers, so higher, Higher Kind of Burn Rate on the Development.
**Konsti | matchicalcom** [50:16 - 50:20]: Side, If we are bad here and here, that's like huge costs here, you know?
**Konsti | matchicalcom** [50:21 - 50:21]: So.
**Konsti | matchicalcom** [50:23 - 50:25]: That'S the things that are that are in my head.
**Carlos | matchicalcom** [50:26 - 50:33]: I think we need to take this weekend some days that we have until Christmas to have user stories.
**Carlos | matchicalcom** [50:33 - 50:49]: If you guys want to start in January, of course we need to have user stories ready, close by sure and But when I see user stories, supposedly you should have mockups and if there are new screens, right?
**Carlos | matchicalcom** [50:49 - 50:54]: So to get more structure and to get more speed, since we cannot really be in your hands, those things need to be written.
**Carlos | matchicalcom** [50:55 - 51:02]: I can infer because I've done this for a lot of time and Peter can also infer some business rules on some things.
**Konsti | matchicalcom** [51:02 - 51:03]: But quick question.
**Konsti | matchicalcom** [51:03 - 51:06]: Carlos how do you like the loom approach?
**Konsti | matchicalcom** [51:06 - 51:10]: Like loom and a list of loom is funny.
**Carlos | matchicalcom** [51:10 - 51:12]: It's just new for me, because I'm not a video blogger.
**Carlos | matchicalcom** [51:12 - 51:22]: It's just that, but yeah, but it works, okay, I think it works the way that I even say that at least for me too much detail, okay?
**Carlos | matchicalcom** [51:22 - 51:25]: I don't need for these pins you spend like five minutes to show.
**Carlos | matchicalcom** [51:25 - 51:25]: The queer.
**Carlos | matchicalcom** [51:25 - 51:28]: I don't need all that details, save time, right?
**Carlos | matchicalcom** [51:28 - 51:30]: You say the pin isn't working.
**Carlos | matchicalcom** [51:30 - 51:36]: And since I'm not really a bottle like or don't have too much things on my plate right now I will figure it out.
**Carlos | matchicalcom** [51:36 - 51:37]: I will debug.
**Carlos | matchicalcom** [51:37 - 51:49]: I will understand, or that's one of the advantages of working more senior people don't worry about all those details, but for example for a junior one or for more junior gets the kind of breakdown that I normally have to do.
**Carlos | matchicalcom** [51:49 - 51:51]: This is the query that you need to fix.
**Carlos | matchicalcom** [51:51 - 51:52]: This is how it's wrong.
**Carlos | matchicalcom** [51:52 - 51:53]: This is how you test.
**Carlos | matchicalcom** [51:53 - 51:57]: You need to be more patient because they just have less experience.
**Carlos | matchicalcom** [51:58 - 52:08]: But OK, I think what I have and maybe you guys are doing notion in the backlog and all that, because you've talked multiple times about it.
**Carlos | matchicalcom** [52:08 - 52:12]: But I don't see the backlog at least, also the main didn't search, okay?
**Carlos | matchicalcom** [52:12 - 52:22]: So I'm not sure if we have a big application, a big model because you bring this and your life will change in the meaning that the speed will like triple.
**Carlos | matchicalcom** [52:23 - 52:31]: And I haven't seen requirements because you guys cannot focus unfortunately, because you're doing other stuff, right?
**Carlos | matchicalcom** [52:31 - 52:38]: So that's the part that is critical Just having, even if it's a loom describing while you are on a plane describing a functionality.
**Carlos | matchicalcom** [52:38 - 52:42]: Okay, you gave me something so I can create the market with leaders.
**Carlos | matchicalcom** [52:43 - 52:45]: Okay, let's think about the functionality.
**Carlos | matchicalcom** [52:45 - 52:48]: I know the way that you guys like to do lists because.
**Carlos | matchicalcom** [52:48 - 52:49]: They are already implemented.
**Carlos | matchicalcom** [52:49 - 52:50]: So let's just do it a similar way.
**Carlos | matchicalcom** [52:51 - 52:56]: Not reinvent the wheel in the same application or a new module or something like that.
**Carlos | matchicalcom** [52:56 - 52:59]: Just give me the field, give me more or less the table.
**Carlos | matchicalcom** [52:59 - 53:01]: We can design data models.
**Carlos | matchicalcom** [53:01 - 53:03]: Don't worry, it's just a matter.
**Carlos | matchicalcom** [53:03 - 53:07]: The problem is understanding the business and that's something I have a few months of this.
**Carlos | matchicalcom** [53:07 - 53:12]: So I start to understand at least the parts that I'm more ends on, It's easier for me.
**Carlos | matchicalcom** [53:12 - 53:13]: Of course others.
**Carlos | matchicalcom** [53:13 - 53:18]: We'll make more mistakes because we don't know everything, but we can just talk it through, right?
**Carlos | matchicalcom** [53:18 - 53:24]: So if you guys are not writing the full detail everywhere, I think it would save us time.
**Konsti | matchicalcom** [53:27 - 53:27]: Cool.
**Konsti | matchicalcom** [53:27 - 53:29]: Yeah, that's also good.
**Konsti | matchicalcom** [53:29 - 53:33]: Yeah, yeah, yeah, we just like, yeah.
**Konsti | matchicalcom** [53:34 - 53:45]: And then it's also we also need to go, like not too detailed more like on a high level, but bring this stuff out, describe it and then let's just work on it.
**Konsti | matchicalcom** [53:45 - 53:50]: And while it is in the development, we can iterate a little bit on the needy, greedy details, right?
**Tommy | matchicalcom** [53:51 - 53:53]: Yeah, yeah, yeah, yeah.
**Tommy | matchicalcom** [53:53 - 53:56]: Or come back in another sprint and make it perfect.
**Tommy | matchicalcom** [53:56 - 54:05]: So I think if we, if we can, I think the most important part is to bring in mockups in the end, so I think that's one, one.
**Konsti | matchicalcom** [54:05 - 54:09]: That'S what I mean Tommy like and like we have stage one where we and stage two, like.
**Tommy | matchicalcom** [54:14 - 54:14]: To be honest.
**Tommy | matchicalcom** [54:16 - 54:20]: If we aren't able to brief fully.
**Tommy | matchicalcom** [54:20 - 54:37]: It's much easier for Carlos, Pedro Concico or Philippe Philippe, Philippe, Philippe was Felipe, or to go to Lino and ask, oh, how should we do that than to go to Carol and say hey Carol.
**Tommy | matchicalcom** [54:37 - 54:40]: So I think that's kind of.
**Tommy | matchicalcom** [54:41 - 54:42]: I don't know.
**Tommy | matchicalcom** [54:42 - 55:13]: I think we do have actually, actually we do have a complex application, it should look decent, but we do have a lot of existing components and we can also so we should, as you, as you mentioned, we can really think about, We should try to keep this, to keep this, to keep this potential or to keep this bar in that high, but we don't have to make it higher in the end.
**Carlos | matchicalcom** [55:16 - 55:23]: You guys already have a lot of patterns that who is designing needs to follow, because it's not going to build in a different way, right?
**Carlos | matchicalcom** [55:24 - 55:25]: Exactly, exactly.
**Tommy | matchicalcom** [55:26 - 55:32]: That's something I would also say and just one last question on it, because I think.
**Tommy | matchicalcom** [55:33 - 55:38]: We are just thinking about, are you used to work together in.
**Carlos | matchicalcom** [55:39 - 55:41]: An office, or.
**Carlos | matchicalcom** [55:42 - 55:48]: It depends so me, Pedro and Lino normally are always at the office, because we don't want to work at home, really?
**Carlos | matchicalcom** [55:49 - 55:53]: Yeah, I live just close by, but I prefer to come to the office.
**Carlos | matchicalcom** [55:53 - 56:02]: We have a coffee, we talk about football a little bit, we just relax and we have like social life a little bit, so I prefer to be outside of the hut.
**Carlos | matchicalcom** [56:02 - 56:09]: To be honest, Bernardo is younger and he comes like one or twice per week, but I can make him come every day, right?
**Carlos | matchicalcom** [56:10 - 56:14]: No, no, no, but he lives also close by, so it's not.
**Carlos | matchicalcom** [56:14 - 56:15]: It's not a big deal.
**Carlos | matchicalcom** [56:16 - 56:37]: So from this, from this, Philip, no, because the now he lives in Lady, that's like one hundred and fifty kilometers from Lisbon on the northern part, so he works from home and he's so independent that he's okay, working from home and for now, right now he's with Bernardo in the project for Spain, for Madrid.
**Carlos | matchicalcom** [56:37 - 56:41]: So they are working from home to Madrid, so that's why we just don't come together.
**Carlos | matchicalcom** [56:41 - 56:48]: I see Philip like once or twice per year when we do our Gatherings Just Like Christmas Dinner or Something Like.
**Carlos | matchicalcom** [56:48 - 56:49]: That.
**Carlos | matchicalcom** [56:49 - 56:50]: Just aside of it, it just works.
**Tommy | matchicalcom** [56:50 - 56:55]: From its house, but the main part of the team so so.
**Carlos | matchicalcom** [56:57 - 57:00]: Always, you know most of most of.
**Carlos | matchicalcom** [57:01 - 57:08]: Because we can do online communication for sure, but there is something about the communication in person.
**Carlos | matchicalcom** [57:08 - 57:08]: That is.
**Carlos | matchicalcom** [57:09 - 57:11]: It's helpful, it's more helpful I would.
**Tommy | matchicalcom** [57:11 - 57:13]: Say yeah, I was because I was just thinking about.
**Tommy | matchicalcom** [57:13 - 57:14]: Also so.
**Tommy | matchicalcom** [57:15 - 57:18]: We can't travel every week to Lisbon.
**Tommy | matchicalcom** [57:18 - 57:19]: I think that's not.
**Tommy | matchicalcom** [57:19 - 57:27]: That's not necessary, but we're just thinking about really to be more if we have most.
**Carlos | matchicalcom** [57:27 - 57:29]: But Chico can come over.
**Carlos | matchicalcom** [57:29 - 57:31]: He was here last week once again.
**Carlos | matchicalcom** [57:33 - 57:39]: The office is not as fancy as the other one that we went together, but it has desk and screen you really enjoyed.
**Konsti | matchicalcom** [57:39 - 57:41]: It was really cool.
**Konsti | matchicalcom** [57:41 - 57:45]: Experience, the only thing that's obviously super bad, is like, it's for him quite a ride, right?
**Carlos | matchicalcom** [57:46 - 57:47]: Yeah, for him.
**Carlos | matchicalcom** [57:47 - 57:52]: But you can like a couple of times per month, if he wants whatever he works for him.
**Tommy | matchicalcom** [57:52 - 57:55]: I was just thinking about that, really.
**Tommy | matchicalcom** [57:55 - 57:58]: I don't know every five to six weeks.
**Tommy | matchicalcom** [57:59 - 58:00]: To be.
**Tommy | matchicalcom** [58:00 - 58:02]: Really one week.
**Tommy | matchicalcom** [58:03 - 58:12]: At your place, so I think that's a good idea, if we have really this core team sitting there, So if Philippe isn't there, I can.
**Carlos | matchicalcom** [58:12 - 58:17]: I can came over if I'm not saying every month, but no, no, that's but one, or?
**Tommy | matchicalcom** [58:17 - 58:19]: But, but if the core team is there, yeah.
**Tommy | matchicalcom** [58:20 - 58:25]: So Philippe is also core, but we have nearly everyone there.
**Tommy | matchicalcom** [58:25 - 58:29]: It can be a good, good thing to to get it to to get to.
**Tommy | matchicalcom** [58:29 - 58:32]: Know each other a little bit better.
**Carlos | matchicalcom** [58:32 - 58:33]: To have the I think, I think.
**Carlos | matchicalcom** [58:33 - 58:39]: I think you understand just bringing the team is pretty much set up, right?
**Carlos | matchicalcom** [58:39 - 58:40]: So the team is together.
**Carlos | matchicalcom** [58:40 - 58:48]: I normally depending on the projects, pick the pieces and mix them a little bit, but the team is set up so I'm bringing.
**Carlos | matchicalcom** [58:48 - 58:50]: The team to magical and we'll deliver.
**Carlos | matchicalcom** [58:50 - 58:53]: I'm just perfectly confident that we can do.
**Carlos | matchicalcom** [58:54 - 58:58]: I'm sure that will not be perfect, but we'll get things done.
**Tommy | matchicalcom** [58:58 - 59:02]: Yeah, so what is perfect on this one?
**Tommy | matchicalcom** [59:02 - 59:02]: So that the.
**Tommy | matchicalcom** [59:04 - 59:09]: In the end what we'd like to achieve is we have to get rid of that We are the bottleneck.
**Tommy | matchicalcom** [59:09 - 59:13]: We know what to build, we know what to build what our users need.
**Tommy | matchicalcom** [59:13 - 59:15]: We know that really, We know that.
**Tommy | matchicalcom** [59:19 - 59:27]: The biggest achievement you can have or in the end because if you know what you have to build, that's the best.
**Carlos | matchicalcom** [59:28 - 59:46]: But there is one additional thing that I just remember Tom and that is testing you guys and Chico, because you are the guys that know the system, you'll be the ones for now to have to test everything or at least to look around, because bringing people from outside we will break something for sure without knowing, because we just don't know.
**Carlos | matchicalcom** [59:46 - 59:48]: And you have a complex system.
**Carlos | matchicalcom** [59:48 - 59:54]: You have a lot of code, a lot of tables and a lot of queries are just huge.
**Tommy | matchicalcom** [59:54 - 01:00:00]: We have to think about how do we have to really think about how to handle that, or yeah, you need.
**Carlos | matchicalcom** [01:00:00 - 01:00:05]: To simplify some things and I think I've shown that performance wise.
**Carlos | matchicalcom** [01:00:05 - 01:00:05]: I can help.
**Carlos | matchicalcom** [01:00:05 - 01:00:11]: In a couple places, but others just need to be redesigned if we, if it's a problem.
**Tommy | matchicalcom** [01:00:13 - 01:00:17]: Yeah, Concier, what do you think so to do?
**Tommy | matchicalcom** [01:00:17 - 01:00:18]: Carlos, thank you very much for.
**Tommy | matchicalcom** [01:00:21 - 01:00:22]: I'm happy.
**Tommy | matchicalcom** [01:00:22 - 01:00:25]: I'm so happy because I think that's.
**Carlos | matchicalcom** [01:00:28 - 01:00:32]: I told this in like the first or second call that I did with Consty, right?
**Carlos | matchicalcom** [01:00:32 - 01:00:33]: I'm here.
**Carlos | matchicalcom** [01:00:33 - 01:00:42]: But if you guys need, I have a team, because even when we lost Pro Champs, I didn't fire anyone, because this is my team, that's amazing.
**Carlos | matchicalcom** [01:00:42 - 01:00:43]: This is my team.
**Carlos | matchicalcom** [01:00:43 - 01:00:47]: So yes, last year we lost a lot of money because the side projects that we got.
**Carlos | matchicalcom** [01:00:47 - 01:00:49]: Were not enough this year.
**Carlos | matchicalcom** [01:00:49 - 01:00:56]: The first part of the year was very good, because we did like a big contract for some public institutions here in Portugal.
**Carlos | matchicalcom** [01:00:56 - 01:01:01]: So it helps so yeah, we are keep doing a couple of outsourcing.
**Carlos | matchicalcom** [01:01:01 - 01:01:07]: I have a few more resources that I will keep them in outsourcing here in Portugal in other companies, because it helps.
**Carlos | matchicalcom** [01:01:08 - 01:01:15]: I just had to figure out a way to reinvent the business and to making sure that everyone has things to do.
**Carlos | matchicalcom** [01:01:15 - 01:01:21]: But I'm seeing Magical as my I can say baby it's yours.
**Carlos | matchicalcom** [01:01:21 - 01:01:23]: I don't want to steal it, but I can adopt it.
**Konsti | matchicalcom** [01:01:26 - 01:01:26]: Carlos.
**Konsti | matchicalcom** [01:01:26 - 01:01:29]: It cries loud enough for multiple parents.
**Carlos | matchicalcom** [01:01:29 - 01:01:33]: Okay, okay, okay, that's yeah, I do.
**Tommy | matchicalcom** [01:01:33 - 01:01:38]: See this as well and yeah, bro, champs, it was a very long term.
**Carlos | matchicalcom** [01:01:39 - 01:01:42]: I'm ready for I'm I'm ready for ten years at Magical.
**Carlos | matchicalcom** [01:01:44 - 01:01:47]: Yeah, we are doing, Let's make it, let's make it work, guys.
**Carlos | matchicalcom** [01:01:47 - 01:01:55]: Yes, But I'm really I prefer this than have been doing like three month, six month project, right?
**Tommy | matchicalcom** [01:01:56 - 01:01:59]: That's just that doesn't make fun, or?
**Tommy | matchicalcom** [01:01:59 - 01:02:00]: Yeah, in the end, right?
**Carlos | matchicalcom** [01:02:00 - 01:02:08]: Because I want to see Magical grow in number of customers in usage of the application, maybe even different products, right?
**Carlos | matchicalcom** [01:02:08 - 01:02:14]: That's that's the kind of energy that I want to feel, because it will be good for everyone, so that's true.
**Tommy | matchicalcom** [01:02:16 - 01:02:19]: So constant, yeah, no decisions right now.
**Carlos | matchicalcom** [01:02:19 - 01:02:21]: I'm going to send the PowerPoint just so you.
**Carlos | matchicalcom** [01:02:21 - 01:02:23]: Have the information that would be great.
**Tommy | matchicalcom** [01:02:23 - 01:02:31]: But, but we, but we can decide very fast and we should decide very fast what we'd like to do.
**Tommy | matchicalcom** [01:02:31 - 01:02:33]: So there is everything is on the.
**Konsti | matchicalcom** [01:02:33 - 01:02:40]: Table and everybody's clear Philippe and Pedro, it's very bullish, right?
**Konsti | matchicalcom** [01:02:40 - 01:02:41]: The only question is, does it make sense?
**Konsti | matchicalcom** [01:02:41 - 01:02:43]: Maybe to skip the January.
**Konsti | matchicalcom** [01:02:45 - 01:02:47]: For Pedro let's see.
**Konsti | matchicalcom** [01:02:49 - 01:02:52]: But on the other hand, like why like we need why skipping.
**Carlos | matchicalcom** [01:02:55 - 01:03:00]: Even if it's just for him to start playing around with, so with small, as I started, right?
**Carlos | matchicalcom** [01:03:00 - 01:03:04]: With small tasks, small fixes, so he can just play around with the application.
**Carlos | matchicalcom** [01:03:04 - 01:03:05]: I think we need to learn.
**Carlos | matchicalcom** [01:03:06 - 01:03:11]: I need to explain the concepts and to him to him or to them, of course.
**Carlos | matchicalcom** [01:03:11 - 01:03:12]: But.
**Carlos | matchicalcom** [01:03:13 - 01:03:18]: I don't want to put you guys during your Christmas vacation a lot to.
**Carlos | matchicalcom** [01:03:18 - 01:03:20]: Work with, but we need requirements.
**Carlos | matchicalcom** [01:03:20 - 01:03:26]: We need at least one module, like I don't know, Tommy, you've showed me the roadmap one day, There is a lot of models.
**Carlos | matchicalcom** [01:03:28 - 01:03:29]: What is the most important one?
**Carlos | matchicalcom** [01:03:29 - 01:03:44]: And let's start designing it, architecting it and implementation just boom, because I think that's the most concerning to me at this point at least, yeah, for me.
**Tommy | matchicalcom** [01:03:44 - 01:03:50]: For us as well, for us as well, So we saw that and we know that, so that's in the end we know that.
**Tommy | matchicalcom** [01:03:50 - 01:03:52]: We know that there's our biggest issue in the end.
**Tommy | matchicalcom** [01:03:54 - 01:03:57]: But that would be great, okay, okay.
**Konsti | matchicalcom** [01:03:59 - 01:04:00]: We know it.
**Konsti | matchicalcom** [01:04:00 - 01:04:00]: And.
**Konsti | matchicalcom** [01:04:02 - 01:04:09]: Past few hours we still spent on other things, but it's like and the next few will also be like this.
**Konsti | matchicalcom** [01:04:11 - 01:04:12]: But yeah, we will get there.
**Carlos | matchicalcom** [01:04:13 - 01:04:15]: You guys have cut them support for example.
**Carlos | matchicalcom** [01:04:15 - 01:04:18]: That's something that is hard to delegate, right?
**Carlos | matchicalcom** [01:04:18 - 01:04:19]: Because you have a problem with my team.
**Carlos | matchicalcom** [01:04:19 - 01:04:27]: No one speaks German of course as you would expect, so that's something that, yeah, that's a problem, okay?
**Carlos | matchicalcom** [01:04:27 - 01:04:36]: And so you have Chico that might help a little bit I'm assuming because you bring him to meetings into all that stuff exactly.
**Carlos | matchicalcom** [01:04:37 - 01:04:45]: And maybe can delegate some of the front end to Philippe, for example, but those are the core tasks that you guys have to do so.
**Tommy | matchicalcom** [01:04:45 - 01:04:51]: But that could be, that could be really, that could be really the solution for one problem in the end.
**Tommy | matchicalcom** [01:04:51 - 01:04:58]: So if we bring in Philippe, Philippe or Philippe, how is it pronounced Philippe.
**Carlos | matchicalcom** [01:04:58 - 01:05:01]: Yeah, just Philippe, Philippe, Philipp.
**Tommy | matchicalcom** [01:05:01 - 01:05:05]: If you bring in Philippe and he's very experienced in the in the front.
**Konsti | matchicalcom** [01:05:05 - 01:05:06]: End.
**Tommy | matchicalcom** [01:05:08 - 01:05:18]: And Chico is also on the front end, they are together very focused on the front end, but Philip is really the one hundred percent front end guy and we give.
**Tommy | matchicalcom** [01:05:20 - 01:05:42]: Or the outsystems front end guy and we overhand in the end some support things or this customer stuff as well to Chico, so as well, part of his work as well, yeah, I think that could be really a good thing that I'm more free to think about the product, product in the end.
**Carlos | matchicalcom** [01:05:42 - 01:05:43]: So.
**Tommy | matchicalcom** [01:05:45 - 01:05:48]: It'S not enough for Chico to be only in the front end.
**Tommy | matchicalcom** [01:05:48 - 01:05:49]: You know what I mean?
**Tommy | matchicalcom** [01:05:49 - 01:06:07]: So because we have to think about he speaks German well, so native, he is young, he is fresh, yeah, the customer like him as well, he and he has to and he has to gain experience on this, on this, on this part as well, yeah, Because.
**Konsti | matchicalcom** [01:06:10 - 01:06:12]: He'S with us for like over like he's my brother.
**Konsti | matchicalcom** [01:06:12 - 01:06:16]: Basically and he's with us and with magic since from the beginning, right?
**Tommy | matchicalcom** [01:06:16 - 01:06:17]: Yeah, And he knows.
**Carlos | matchicalcom** [01:06:19 - 01:06:19]: He knows the.
**Tommy | matchicalcom** [01:06:19 - 01:06:21]: Product, but he knows a lot, Yeah.
**Carlos | matchicalcom** [01:06:21 - 01:06:28]: Yeah, yeah, it's even if you hire someone over there, it's the difficult to put someone doing customer support, because you.
**Tommy | matchicalcom** [01:06:28 - 01:06:31]: Need to know the product so yeah, exactly.
**Tommy | matchicalcom** [01:06:31 - 01:06:39]: And we, yeah, but we have to see, but that could really, that would really solve the issue on the on that side.
**Tommy | matchicalcom** [01:06:39 - 01:06:46]: And we, yeah, then we could also think about, I don't know, yeah, we'll see, we'll see Bernardo.
**Tommy | matchicalcom** [01:06:46 - 01:06:50]: I'm not sure about Bernardo, to be honest, I think that's the only thing.
**Tommy | matchicalcom** [01:06:52 - 01:06:54]: If I have to decide I would.
**Konsti | matchicalcom** [01:06:54 - 01:06:57]: Say, okay, from a cash flow standpoint.
**Tommy | matchicalcom** [01:06:57 - 01:06:59]: Yeah, from a cash flow standpoint.
**Tommy | matchicalcom** [01:06:59 - 01:07:04]: We can't afford it at the moment, that's main thing.
**Tommy | matchicalcom** [01:07:04 - 01:07:10]: Otherwise it would be okay, we need this also, but we'll see.
**Tommy | matchicalcom** [01:07:10 - 01:07:12]: We'll see if we are growing.
**Tommy | matchicalcom** [01:07:12 - 01:07:16]: We have to expand in the middle of the year, for example.
**Carlos | matchicalcom** [01:07:16 - 01:07:25]: So we can do with the right setup and the team, we can produce a lot of functions in a few months.
**Tommy | matchicalcom** [01:07:25 - 01:07:28]: Yeah, yeah, let's let's see, how is it going?
**Tommy | matchicalcom** [01:07:28 - 01:07:40]: Okay, so Carlos, it would be great if you could oversend it of course to us, And then we I think on Monday at latest we should, we should take a decision together, or?
**Carlos | matchicalcom** [01:07:40 - 01:07:44]: Because, yeah, talk about it, yeah, no worries.
**Carlos | matchicalcom** [01:07:44 - 01:07:45]: We'll have a little bit of time.
**Carlos | matchicalcom** [01:07:47 - 01:07:49]: For the guys that just finished the project.
**Carlos | matchicalcom** [01:07:50 - 01:07:55]: I won't find anything for them to early January, because it's Christmas and Christmas.
**Carlos | matchicalcom** [01:07:55 - 01:07:59]: We don't decide anything over here, but it's just Christmas.
**Carlos | matchicalcom** [01:08:00 - 01:08:08]: But I have a couple of projects that might mix them a little bit depends on your guys decision.
**Carlos | matchicalcom** [01:08:08 - 01:08:19]: But magically it's first at this point, I don't want to put everyone on the magical team that's not the goal, but it has to be priority because I'm one hundred percent involved in this.
**Carlos | matchicalcom** [01:08:19 - 01:08:21]: So I want it to go well.
**Tommy | matchicalcom** [01:08:23 - 01:08:24]: For sure, I totally understand.
**Tommy | matchicalcom** [01:08:24 - 01:08:32]: And we will at latest on Monday I think on vacation tomorrow and we can really fix things up.
**Tommy | matchicalcom** [01:08:34 - 01:08:37]: Nail them down on Monday, so we don't have to wait.
**Tommy | matchicalcom** [01:08:38 - 01:08:40]: There is no reason for wait.
**Carlos | matchicalcom** [01:08:40 - 01:08:48]: The only thing that I'm going to ask is need to be on day one, but we need some kind of written agreement for me.
**Carlos | matchicalcom** [01:08:48 - 01:08:50]: I don't worry too much, but because I have contract and all that.
**Carlos | matchicalcom** [01:08:50 - 01:08:55]: And then we need to just to make it in I think it's also security for you guys, so.
**Carlos | matchicalcom** [01:08:56 - 01:08:57]: Like, the.
**Konsti | matchicalcom** [01:08:57 - 01:09:02]: Only thing is like we need to have the flexibility and we can show you the cash flow that you.
**Konsti | matchicalcom** [01:09:02 - 01:09:04]: Also know when it gets tough.
**Konsti | matchicalcom** [01:09:04 - 01:09:15]: But when things got like because we don't have a million investment in the bank and our golden parachute is like, okay, we can really cut down most of the costs if we really have to.
**Konsti | matchicalcom** [01:09:15 - 01:09:20]: But we are monitoring our cash flow and we make sure that this is not going to happen.
**Konsti | matchicalcom** [01:09:20 - 01:09:25]: But when we have a written agreement, we need to have still kind of some flexibility.
**Carlos | matchicalcom** [01:09:26 - 01:09:28]: We'll review the agreement together, right?
**Carlos | matchicalcom** [01:09:28 - 01:09:31]: So we need to be good for everyone.
**Tommy | matchicalcom** [01:09:31 - 01:09:38]: So if that's concerned, we will find an agreement, we But we have to be transparent.
**Tommy | matchicalcom** [01:09:38 - 01:09:43]: If from my perspective I will give you a twelve month contract, but from a cash flow.
**Tommy | matchicalcom** [01:09:45 - 01:09:58]: Ten years contract an infinite contract in the end, but from a cash flow perspective it's not possible at the moment, because, yeah, that's the thing here.
**Tommy | matchicalcom** [01:09:58 - 01:10:02]: So we have to decide where we once again.
**Carlos | matchicalcom** [01:10:02 - 01:10:03]: I think the plan is correct.
**Carlos | matchicalcom** [01:10:03 - 01:10:07]: Tommy, you guys need to bring more people and you are getting distraction right?
**Carlos | matchicalcom** [01:10:07 - 01:10:14]: So just keep selling, so we can exactly evolve the product faster.
**Tommy | matchicalcom** [01:10:14 - 01:10:17]: Yeah, yeah, cool.
**Tommy | matchicalcom** [01:10:17 - 01:10:24]: Okay, then Carlos, thank you very much and we will hear us in the house.
**Carlos | matchicalcom** [01:10:24 - 01:10:25]: You can fly to Lisbon.
**Carlos | matchicalcom** [01:10:25 - 01:10:27]: You can fly to Lisbon every month, if you want.
**Carlos | matchicalcom** [01:10:27 - 01:10:32]: Okay, Just the aeroportism is not that great at this point, but it is what it is.
**Tommy | matchicalcom** [01:10:32 - 01:10:33]: It's okay.
**Tommy | matchicalcom** [01:10:33 - 01:10:40]: But I'm really planning to do to come every five to six weeks, so I think it's a good idea.
**Tommy | matchicalcom** [01:10:40 - 01:10:50]: If we have some, if we have a hub there, it's a good idea to be, also there, so it's really, I think it's a good idea, but.
**Carlos | matchicalcom** [01:10:50 - 01:10:57]: Just bring your whip and make sure that everyone is working like that more pasta, more sposter.
**Carlos | matchicalcom** [01:10:59 - 01:11:02]: Oh, I think it's since we are going to work a lot together, I think it's good.
**Carlos | matchicalcom** [01:11:02 - 01:11:07]: Also to have a dinner, have some time outside the office, it helps a.
**Konsti | matchicalcom** [01:11:07 - 01:11:10]: Lot so absolutely, absolutely one hundred percent.
**Tommy | matchicalcom** [01:11:10 - 01:11:13]: Okay, thank you very much for your.
**Carlos | matchicalcom** [01:11:13 - 01:11:14]: Time in terms of work.
**Carlos | matchicalcom** [01:11:14 - 01:11:26]: Once I have the pin part ready, I will let you know this afternoon and then we probably can push again tomorrow to production to fix it, because if it's a bug in production, not.
**Tommy | matchicalcom** [01:11:26 - 01:11:27]: A good thing, it should it should be.
**Tommy | matchicalcom** [01:11:27 - 01:11:28]: Yeah, exactly.
**Tommy | matchicalcom** [01:11:28 - 01:11:29]: Exactly.
**Tommy | matchicalcom** [01:11:29 - 01:11:30]: Thank you so much, Carlos.
**Tommy | matchicalcom** [01:11:30 - 01:11:33]: Okay, see you guys, see you guys, bye.
**Carlos | matchicalcom** [01:11:34 - 01:11:37]: Good, have a good vacations, classic, have fun.
**Konsti | matchicalcom** [01:11:37 - 01:11:38]: Thank you.
**Konsti | matchicalcom** [01:11:38 - 01:11:39]: Yeah, it's like.
**Konsti | matchicalcom** [01:11:41 - 01:11:46]: The Thirtieth Birthday Party of One.
**Konsti | matchicalcom** [01:11:46 - 01:11:49]: Of my best friends and a former flatmate.
**Konsti | matchicalcom** [01:11:50 - 01:11:54]: So it will be intense boys trip, you know?
**Carlos | matchicalcom** [01:11:54 - 01:11:57]: Oh, I try to avoid those zones right now.
**Carlos | matchicalcom** [01:11:58 - 01:11:59]: Just hand all that.
**Carlos | matchicalcom** [01:12:00 - 01:12:01]: It's fine.
**Carlos | matchicalcom** [01:12:01 - 01:12:01]: It's fine.
**Carlos | matchicalcom** [01:12:01 - 01:12:06]: Enjoy, enjoy before your wedding, because after that you just screwed so.
**Konsti | matchicalcom** [01:12:08 - 01:12:09]: Sure, sure.
**Carlos | matchicalcom** [01:12:09 - 01:12:11]: See you, see you, bye bye.
**Konsti | matchicalcom** [01:12:11 - 01:12:12]: And I'm st.
