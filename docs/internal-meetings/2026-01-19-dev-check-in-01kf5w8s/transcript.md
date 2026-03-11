# Dev Check in

**Konsti | matchicalcom** [00:09 - 00:13]: Hello, hello, hello, how's it going.
**Carlos | matchicalcom** [00:15 - 00:15]: Good?
**Carlos | matchicalcom** [00:16 - 00:21]: Just trying to finalize a second easy.
**Konsti | matchicalcom** [00:22 - 00:24]: And I'm jumping kind of from meeting to meeting to meeting.
**Carlos | matchicalcom** [00:25 - 00:28]: Whoa, that's very effective or very The.
**Konsti | matchicalcom** [00:28 - 00:30]: Sprint is halfway done and I.
**Konsti | matchicalcom** [00:31 - 00:33]: Did not even touch skills yet.
**Konsti | matchicalcom** [00:33 - 00:34]: I could, I could like.
**Carlos | matchicalcom** [00:36 - 00:39]: I know how these things are sometimes.
**Konsti | matchicalcom** [00:41 - 00:57]: But finally was one client that always like we need to wait another meeting, another meeting, another meeting, another meeting, another meeting now came to an end and now he says like he now has really all the gold goals now there's one last call with procurement.
**Konsti | matchicalcom** [00:57 - 01:05]: Procurement wants now to again a little bit negotiate prices but like we just give them two templates extra or so I don't know, let's see.
**Konsti | matchicalcom** [01:06 - 01:08]: But then this client is closed.
**Konsti | matchicalcom** [01:10 - 01:21]: One big, one big one I would say so like this year sixty k so quite good, okay, yeah, cool, yeah.
**Carlos | matchicalcom** [01:22 - 01:30]: Things are moving, that's good on this on the sales side I've been.
**Carlos | matchicalcom** [01:31 - 01:32]: Right just seeing.
**Konsti | matchicalcom** [01:34 - 01:37]: I have a meeting, first meeting scheduled with NTT data.
**Carlos | matchicalcom** [01:40 - 01:41]: I know a few people they're about.
**Konsti | matchicalcom** [01:41 - 01:48]: In Portugal, Let's see, they are also supplying to Deutsche Bahn.
**Carlos | matchicalcom** [01:50 - 01:58]: Those are like yeah, you know entity data, they are very big and they have a huge optimum steam and they have everything, yeah.
**Konsti | matchicalcom** [01:58 - 02:00]: Oh yeah, they have really everything, yeah.
**Carlos | matchicalcom** [02:00 - 02:30]: I heard about it so over here, they bought what was a smaller consultancy, you're in Portugal average they just came here and just bought it so and merging, yeah, I'm not sure a few million for sure I'm not sure about what was the price, but yeah, it was a lot of money because those guys had like I don't know three four hundred consultants so just merger the whole thing, yeah, but NTT has those japanese behind right on the capital, so.
**Konsti | matchicalcom** [02:30 - 02:38]: Yeah, yeah, let's see so we will be definitely like let's hope we can manage a land, a very small land and then from there try to expand.
**Konsti | matchicalcom** [02:41 - 02:43]: I will shoot an update more, sure.
**Carlos | matchicalcom** [02:45 - 02:49]: So couple of quick questions on my.
**Konsti | matchicalcom** [02:49 - 02:51]: Side, sure you got my full attention.
**Carlos | matchicalcom** [02:52 - 03:15]: Okay, so mainly because of the boom that you set, okay, so first of all I had finished that at seven o', clock, so those mistakes like didn't pass the variable it was at the end of the day, the pop up is opening and I just don't care about this anymore need to go home, so that's why Glad that you found them and looks like it's working right?
**Carlos | matchicalcom** [03:15 - 03:17]: I haven't tested a lot, it is.
**Konsti | matchicalcom** [03:17 - 03:18]: Working, it is working.
**Konsti | matchicalcom** [03:19 - 03:25]: I realized the workflow is completely different than I saw first like and it's making things much more easier.
**Konsti | matchicalcom** [03:26 - 03:42]: The only thing that is not working is like and that's just a question like when you merge a contact into a consultant and create a new consultant, then the pathing starts and what I'm currently doing or what you already prepared is that it's redirect directly to the consultant.
**Konsti | matchicalcom** [03:43 - 03:47]: What is on the one hand kind of correct, but on the other hand it's still like processing, right?
**Carlos | matchicalcom** [03:47 - 03:49]: Because the consultant is not there.
**Carlos | matchicalcom** [03:49 - 03:50]: That was one of the questions that I had.
**Carlos | matchicalcom** [03:50 - 03:57]: In terms of redirect I can try to get the consultant as soon as possible, but I don't think that would be a good experience, because no, no.
**Konsti | matchicalcom** [03:57 - 04:01]: No, it's there immediately now It's there immediately.
**Carlos | matchicalcom** [04:05 - 04:07]: But the consultant won't be ready, right?
**Konsti | matchicalcom** [04:07 - 04:08]: It won't be ready.
**Konsti | matchicalcom** [04:08 - 04:11]: That's the issue it's there, but it's not ready.
**Konsti | matchicalcom** [04:11 - 04:13]: So we need to kind of show you that.
**Konsti | matchicalcom** [04:13 - 04:18]: Okay, it's currently processing maybe, maybe on that CV part.
**Carlos | matchicalcom** [04:18 - 04:28]: We'll just send this like a warning message to the user, saying just wait while it's parsing or send them to the queue.
**Carlos | matchicalcom** [04:28 - 04:41]: Or I don't know, we need to do something there, because once again I was able to get the consultant ID, because it gets generated on that when it gets appended to that CV parser table.
**Carlos | matchicalcom** [04:42 - 04:45]: But it's not a great experience there.
**Carlos | matchicalcom** [04:47 - 04:50]: But okay, I will leave that on the table.
**Carlos | matchicalcom** [04:51 - 05:06]: The other thing that I would like you questioned CS the way that we are doing the menu in terms of hiding and showing it just be hidden in CSS, so the menu itself, the header of the menu, so we don't duplicate business rules within each link.
**Carlos | matchicalcom** [05:08 - 05:10]: To know how many links there are.
**Carlos | matchicalcom** [05:10 - 05:20]: So the menu is dynamic in terms of CSS and checks if there are any links inside, it shows the menu, if not just types everything.
**Carlos | matchicalcom** [05:22 - 05:29]: Okay, that way each link has their own business rules.
**Carlos | matchicalcom** [05:29 - 05:43]: Okay, so we are independent and overall the menu knows if there are links or not there I know that you were mentioning if we should put visible just upper or not, but that would just be a blank DIV that will stay there.
**Konsti | matchicalcom** [05:45 - 05:49]: So in this case, when there's no link inside, then it's a blank div.
**Carlos | matchicalcom** [05:49 - 05:51]: Yeah, the component handles it.
**Carlos | matchicalcom** [05:51 - 05:57]: Philippe built it in terms of interface as a dynamic component easier for implementation.
**Carlos | matchicalcom** [05:57 - 06:12]: And what I was trying to avoid there is to have to duplicate the business rules to show the menu the header of the menu or not, if there was a link would be messy and harder to maintain, We just went with CSS approach there.
**Carlos | matchicalcom** [06:13 - 06:17]: Then I do have one additional question related to the solo company.
**Carlos | matchicalcom** [06:17 - 06:31]: It's just that to change one of the scenarios that Tommy describing I have to convert a freelancer to a partner and I wanted to ask is just changing the flag solo company from true to.
**Carlos | matchicalcom** [06:31 - 06:34]: False or do I need to do something else?
**Konsti | matchicalcom** [06:35 - 06:44]: And one more thing you need to convert the company to being a partner company.
**Konsti | matchicalcom** [06:44 - 06:50]: So basically there's an action for convert if you can open your.
**Carlos | matchicalcom** [06:52 - 06:56]: But that company already exists, right?
**Carlos | matchicalcom** [06:56 - 06:57]: So I need to do something it.
**Konsti | matchicalcom** [06:57 - 07:02]: Exists, but this convert action is just creating the partner entity.
**Carlos | matchicalcom** [07:02 - 07:17]: Oh, I have done, okay, But that part I have already I had already done, so I can just show you I saw that action so I have error here, but it was just a test that I was doing to clear.
**Konsti | matchicalcom** [07:17 - 07:20]: Some data other than that all good on your end.
**Carlos | matchicalcom** [07:21 - 07:23]: Yeah, very much today it was not bad.
**Carlos | matchicalcom** [07:23 - 07:38]: Implemented a couple of the scenarios that I was missing from Friday that was the adding the asking a pop up to add the email and a few more of these smaller ones.
**Konsti | matchicalcom** [07:39 - 07:41]: How was the maß exam of your daughter?
**Konsti | matchicalcom** [07:41 - 07:42]: Did you pass?
**Carlos | matchicalcom** [07:43 - 07:44]: I don't know.
**Carlos | matchicalcom** [07:44 - 07:51]: They take like a week or so to I assured, but they are ending this semester right now.
**Carlos | matchicalcom** [07:51 - 07:55]: So it's this week the end of the semester the end of.
**Konsti | matchicalcom** [07:55 - 07:56]: Ah yeah, true.
**Konsti | matchicalcom** [07:56 - 07:56]: And then the other one.
**Konsti | matchicalcom** [07:57 - 07:59]: You have different semesters, right?
**Konsti | matchicalcom** [07:59 - 08:02]: You have very long summer summer vacation, right?
**Carlos | matchicalcom** [08:02 - 08:04]: Yes, two to three months.
**Konsti | matchicalcom** [08:04 - 08:05]: Cool.
**Carlos | matchicalcom** [08:05 - 08:13]: So we do it from September right now to end of January more or less first semester and then from they have like a week off and then from.
**Carlos | matchicalcom** [08:13 - 08:16]: February to June more or less.
**Carlos | matchicalcom** [08:16 - 08:19]: That's the school schedule here.
**Carlos | matchicalcom** [08:19 - 08:26]: So a couple of just exam just at the end of she's on sixth grade, right?
**Carlos | matchicalcom** [08:26 - 08:28]: It's not like the end of the work, but.
**Konsti | matchicalcom** [08:31 - 08:32]: Okay.
**Carlos | matchicalcom** [08:35 - 08:36]: But she gets a little bit stressed.
**Konsti | matchicalcom** [08:36 - 08:44]: By the way, a question like when do you write logic directly into the service action?
**Konsti | matchicalcom** [08:44 - 08:47]: And when are you using service actions just as a wrapper?
**Konsti | matchicalcom** [08:47 - 08:50]: Because most of the time I'm using service actions just as a wrapper.
**Carlos | matchicalcom** [08:53 - 08:57]: I'm trying to avoid messing with the existing APIs too much.
**Carlos | matchicalcom** [08:58 - 08:59]: That's why?
**Carlos | matchicalcom** [08:59 - 09:07]: Instead of doing another server action, I just I'm doing small things, not very long things, but I'm doing it directly in the service actions.
**Carlos | matchicalcom** [09:07 - 09:12]: Yes, Just to avoid changing.
**Carlos | matchicalcom** [09:12 - 09:21]: So this convert company, this one is the one that I created, this one But there was another I added this part here.
**Carlos | matchicalcom** [09:21 - 09:26]: So when creates as a partner, if it's a solo, just updates it and.
**Konsti | matchicalcom** [09:26 - 09:30]: Puts it solo, yeah, perfect, solo, false, correct.
**Carlos | matchicalcom** [09:31 - 09:34]: And I just left here just make sure that this was correct.
**Carlos | matchicalcom** [09:34 - 09:40]: But yes, I've been using the service actions constantly to normally.
**Carlos | matchicalcom** [09:40 - 09:43]: To call like one or two existing APIs.
**Carlos | matchicalcom** [09:43 - 09:48]: And then sometimes I need to do some like smaller adjustment, like getting a record or just so that we use.
**Konsti | matchicalcom** [09:48 - 10:03]: Our, so that we use our actual server actions as our core endpoints, but business specific logic, specific logic that we just need from certain front end points we bring in a service action or what?
**Carlos | matchicalcom** [10:03 - 10:08]: Yeah, yeah, If in terms of architecture you want to put everything in server.
**Konsti | matchicalcom** [10:08 - 10:10]: Actions, no, no, no, no, no.
**Carlos | matchicalcom** [10:14 - 10:18]: Yeah, it's just wrappers service action is just a resting point.
**Carlos | matchicalcom** [10:18 - 10:19]: It's just a different way to be.
**Konsti | matchicalcom** [10:19 - 10:32]: Called yeah, so, but in this case, like obviously it's currently zero almost not at all built like this, but I was asking just what's your take here?
**Carlos | matchicalcom** [10:32 - 10:43]: Okay, my take this update in this credit should be done in a centralized place with less business logic, because it's difficult.
**Carlos | matchicalcom** [10:44 - 10:49]: For example where was there was today?
**Carlos | matchicalcom** [10:49 - 10:52]: It was one of these creative date external users.
**Carlos | matchicalcom** [10:52 - 10:58]: I think it received like ten different parameters external users, companies local dicts.
**Carlos | matchicalcom** [10:58 - 11:09]: So they are so complex that answers the response of that specific screen completely, but they have so many things that is very difficult to reuse.
**Konsti | matchicalcom** [11:10 - 11:11]: Yeah, that's a little bit shitty.
**Konsti | matchicalcom** [11:12 - 11:13]: I know how I develop.
**Carlos | matchicalcom** [11:16 - 11:21]: I know, I know and this is so today really to be faster.
**Carlos | matchicalcom** [11:21 - 11:28]: I just started to create some meat conditions and just starting to do updates and less reusability of the existing code because.
**Carlos | matchicalcom** [11:28 - 11:31]: Or else I need to spend a lot of time reading the code and trying to understand if I'm not going.
**Konsti | matchicalcom** [11:31 - 11:53]: To break just a quick note on this, sorry, also we didn't want to offend you here in any way I realized, also you need to know we are lacking kind of any benchmarks and what I realized is, we are not bringing you in as a team into a new project.
**Konsti | matchicalcom** [11:53 - 12:01]: We are onboarding you to a two years old code base with most of the time like ten hours of development.
**Konsti | matchicalcom** [12:01 - 12:02]: Or so a day.
**Konsti | matchicalcom** [12:03 - 12:08]: So it's quite a steep learning curve that you need to go through.
**Konsti | matchicalcom** [12:08 - 12:17]: So it's really, it's like also get this just for you as the thing that we are also learning here.
**Konsti | matchicalcom** [12:17 - 12:24]: And it was very important to approach you with our thoughts directly to get some kind of sounding from you.
**Konsti | matchicalcom** [12:24 - 12:28]: Then we realized Okay, maybe we had like a missing assumptions here.
**Konsti | matchicalcom** [12:28 - 12:33]: And then we realize ah yeah, we are missing benchmarks and obviously you also need to understand these things and you.
**Carlos | matchicalcom** [12:33 - 12:52]: Have been working the three of you just the three of us of you guys just together for a long long time now the team will just double I understand there are problems or things that will happen in the requirements, in the lack of control and just giving up all this to other people's hands.
**Carlos | matchicalcom** [12:53 - 13:14]: I'm old enough to understand all these things okay, but that conversation with me, it was the first time that happened in my life to be honest Never had that kind of questions I had that kind of conversations related to other people Yes, I had to do it in the past for me it was the first time but is what it is yeah, but please I don't think.
**Konsti | matchicalcom** [13:14 - 13:37]: I don't think I feel offended like really it was just like we were thinking like okay, we need to get like your, your, your take on this and it's really we are missing benchmarks and we don't want it to kind of like it's it's not like we really reconsidered what we were and we hope that you don't don't like that you don't did not take it too personal because it's always like some some.
**Carlos | matchicalcom** [13:37 - 13:53]: Kind of personality It was it was a little bit I have to say once again all did I have to to separate professional from the rest of the stuff and I've been through a lot in a lot of projects Things will go very well and then we'll go just sometimes less good and sometimes it will go bad.
**Carlos | matchicalcom** [13:53 - 14:03]: I know these things happen OK don't worry too much Let's keep going and move forward I think that's the but let's keep talking whatever you guys have that or other kind of questions for.
**Konsti | matchicalcom** [14:03 - 14:31]: Sure but just to repeat like first really apologize from our side here I think it's mainly due to for us like yeah, the pressure is on like team doubled or shit now here and there and so on and we were missing benchmarks and so on and like we're just okay, let's approach you directly and it was probably not the most diplomatic way Let's say like I will.
**Carlos | matchicalcom** [14:31 - 14:39]: Try to be hacked, don't worry no, I'm not going to respond It's not worth to get into deep in a lot of one thing that I just didn't.
**Carlos | matchicalcom** [14:39 - 14:41]: I was got a little bit by surprise on that one.
**Carlos | matchicalcom** [14:41 - 14:46]: So on Thursday morning I spent like an hour on the on production trying to replicate.
**Carlos | matchicalcom** [14:46 - 14:54]: That canceled query for that you had asked me for example, but as part of the concern I didn't even remember during the weekend.
**Carlos | matchicalcom** [14:54 - 15:02]: I said, okay, I remember one additional thing that I spent a couple of hours doing and I was not able to replicate It was a waste of time, but I had to try it because I talked.
**Konsti | matchicalcom** [15:04 - 15:07]: I'm almost not productive at all in terms of code anymore.
**Konsti | matchicalcom** [15:07 - 15:08]: It's so bad.
**Carlos | matchicalcom** [15:09 - 15:17]: But sometimes someone needs to do it or else will keep piling up and one day the system will not run because it errors everywhere.
**Konsti | matchicalcom** [15:17 - 15:24]: And then that's very good that you that we are talking about this one, because you were currently staying like to be faster.
**Konsti | matchicalcom** [15:25 - 15:30]: I don't care too much about the architect and that's like, also like it should obviously also not be like this.
**Konsti | matchicalcom** [15:31 - 15:34]: I think therefore it's good when we are calling that we can talk about.
**Carlos | matchicalcom** [15:34 - 15:42]: Like if from an external point of view you have a lot of code, this could be done with off the code easy.
**Konsti | matchicalcom** [15:43 - 15:44]: Oh.
**Carlos | matchicalcom** [15:46 - 15:56]: Just I will explain why this is empirical, okay, just me looking at the, because the lack of you guys reuse A lot of web blocks.
**Carlos | matchicalcom** [15:56 - 16:04]: Yes, just copy paste, copy paste, copy paste, copy mate and created a bunch of code, but in Terms of Backhand Saving on the Database.
**Carlos | matchicalcom** [16:04 - 16:06]: Lacks a little bit of organization.
**Carlos | matchicalcom** [16:06 - 16:15]: So whenever you need a new one and I think you can relate to that you need a new one, you just copy, paste the previous one, change one or two parameters and then you have another action.
**Carlos | matchicalcom** [16:15 - 16:22]: But from that moment on you have two actions to maintain once a business logic changes or what something changes.
**Carlos | matchicalcom** [16:22 - 16:24]: It's a lot of work that keeps.
**Konsti | matchicalcom** [16:24 - 16:27]: Piling not too often, like not too often, really?
**Konsti | matchicalcom** [16:27 - 16:29]: There's this dry principle, right?
**Konsti | matchicalcom** [16:29 - 16:30]: Don't repeat yourself.
**Konsti | matchicalcom** [16:30 - 16:34]: I really tried, but yeah, it's faster, it's faster.
**Carlos | matchicalcom** [16:35 - 16:36]: I know I've been there.
**Carlos | matchicalcom** [16:36 - 16:40]: It's much faster than trying to and you know the code base, right?
**Carlos | matchicalcom** [16:40 - 16:42]: But it's just faster.
**Konsti | matchicalcom** [16:42 - 16:45]: Yeah, what's your recommendation?
**Konsti | matchicalcom** [16:45 - 16:46]: How to move on from here?
**Konsti | matchicalcom** [16:46 - 16:50]: So I think it's never good to say okay, now let's rebuild everything.
**Carlos | matchicalcom** [16:50 - 16:53]: That's always, That's awesome, that's awesome, Yeah, right.
**Carlos | matchicalcom** [16:53 - 16:57]: And you have something in two years, that's not feasible, that's not possible.
**Carlos | matchicalcom** [16:57 - 17:06]: I would say for new stuff, newer models you've shown those that architecture of what you guys want to build right?
**Carlos | matchicalcom** [17:06 - 17:12]: Leaf consulting, it's running unless we get into a huge problem.
**Carlos | matchicalcom** [17:12 - 17:14]: Let's not mess too much with it.
**Carlos | matchicalcom** [17:14 - 17:29]: And then when we build the CRM, the sales, We can apply some of these principles because it will have to be distributed within a lot different people today we check, we just figure out that, okay, we are missing something on our dev process translations.
**Carlos | matchicalcom** [17:29 - 17:36]: We need to figure out because we are going to release in a week and we are building everything in English.
**Carlos | matchicalcom** [17:36 - 17:38]: So there is these little steps.
**Carlos | matchicalcom** [17:38 - 17:42]: But first of all it's super sprint.
**Carlos | matchicalcom** [17:42 - 17:45]: I'm not too optimistic or a lot.
**Konsti | matchicalcom** [17:45 - 17:49]: Of expectations is the first story yet.
**Carlos | matchicalcom** [17:49 - 17:56]: See you fail because you will not be ready in time and you onboard a client.
**Carlos | matchicalcom** [17:56 - 17:57]: That's important, right?
**Konsti | matchicalcom** [17:58 - 18:08]: So, but that's a good call, Like let's let's try always when it makes sense to tweak things and when things break up in the core, I just take a weekend and fix it right?
**Carlos | matchicalcom** [18:09 - 18:12]: If it solves and if you have enough weekends.
**Carlos | matchicalcom** [18:12 - 18:16]: Yes, no, but I think the core right now that you have.
**Carlos | matchicalcom** [18:17 - 18:18]: It's running right?
**Carlos | matchicalcom** [18:18 - 18:21]: And once it's running, I prefer not to touch it too much.
**Carlos | matchicalcom** [18:21 - 18:23]: Okay, I'm curious to see.
**Konsti | matchicalcom** [18:23 - 18:28]: So the idea is like when we have new things we build new wrappers that we use for new stuff.
**Carlos | matchicalcom** [18:29 - 18:31]: Yes, and just leave this ready.
**Carlos | matchicalcom** [18:33 - 18:45]: Imagine once we want to refacture the users and the consultancy users in that part, okay, let's take the time to rebuild it and create A few additional APIs.
**Carlos | matchicalcom** [18:46 - 18:54]: And that is the time that we start not just rebuilding, just for rebuilding to be fancier or pre tier.
**Carlos | matchicalcom** [18:54 - 18:55]: That's not worth it.
**Carlos | matchicalcom** [18:57 - 19:11]: But when we get to the new modules, let's make sure that we bring some of these best practices, because it helps a lot to have more granular building within hierarchy.
**Carlos | matchicalcom** [19:11 - 19:20]: All tables should have crud just basic and just does that and logs it and does whatever it needs.
**Carlos | matchicalcom** [19:20 - 19:24]: And then you build on top of that, reusing those actions a few more things.
**Carlos | matchicalcom** [19:24 - 19:33]: That's normally at least the way that I like to build stuff and it has been proven in the past that it works.
**Carlos | matchicalcom** [19:33 - 19:38]: It's just more because on the long term you can gain speed.
**Carlos | matchicalcom** [19:38 - 19:43]: Not on that specific We always need.
**Konsti | matchicalcom** [19:43 - 19:44]: To spend a little bit time on this.
**Konsti | matchicalcom** [19:44 - 19:52]: And like that's also important first once more on the personal note, like please, please apologize like our probably like a little bit.
**Konsti | matchicalcom** [19:52 - 19:56]: Also bad behavior on Friday was really like it was.
**Konsti | matchicalcom** [19:56 - 20:07]: We were way too emotional, way too sensitive, also way too much stress when we were looking on our like, okay, like we need to make this work and here and there and so on.
**Konsti | matchicalcom** [20:09 - 20:21]: Also our expectations were probably a little bit off, like because we were thinking, ah, we are now bringing in like very experienced developers, so it should be even faster than me and Chico, but we realized like, yeah, but you're lacking the understanding, right?
**Carlos | matchicalcom** [20:21 - 20:25]: Just not on the first week, but yes, we'll get there.
**Carlos | matchicalcom** [20:25 - 20:35]: I would say, I would say give like two sprints or something and then I think things should be not one hundred at the speed that you and Chico works and everything, but we should.
**Konsti | matchicalcom** [20:35 - 20:40]: Be able, even if it's even if it's three months, there is some round of time.
**Carlos | matchicalcom** [20:40 - 20:46]: I think it will depend on the different kind of tests that we have to work on.
**Carlos | matchicalcom** [20:46 - 20:48]: Okay, I'm not sure what is being prepared for the next sprint.
**Carlos | matchicalcom** [20:49 - 20:54]: If it's around the topic that we have been working, it's probably easier if it's completely new stuff.
**Carlos | matchicalcom** [20:54 - 21:03]: It's like starting over that part of the application and I'm sure there are multiple parts of the application that we need to go and learn even as.
**Konsti | matchicalcom** [21:03 - 21:13]: A user we have like for a few big clients where we are currently getting started with them, there are a few other things urgent, but no worries.
**Konsti | matchicalcom** [21:13 - 21:19]: We will make it work and one thing after another, but okay, cool colors.
**Konsti | matchicalcom** [21:19 - 21:32]: And I think what also will be helpful is, when we do these kind of sessions where we can go through the code base, I can explain you a few things and we can consider and strategize on how to evolve our code base and how.
**Konsti | matchicalcom** [21:32 - 21:38]: To get more alignment, Also very important, we will make this work.
**Carlos | matchicalcom** [21:40 - 21:41]: I'm committed.
**Carlos | matchicalcom** [21:41 - 21:42]: I think you guys are too so.
**Konsti | matchicalcom** [21:43 - 21:46]: Let'S keep going, okay, how can I be of service.
**Carlos | matchicalcom** [21:48 - 21:49]: For today?
**Carlos | matchicalcom** [21:49 - 22:05]: The questions that I had here related to the implementations on that conversion between consultants and partners and clients, I think that's done for now I didn't understood in terms of the solo company.
**Carlos | matchicalcom** [22:05 - 22:14]: If I need to delete or convert really something, if it's just assigning that partner ID on the partner table, I'm doing that that's enough, right?
**Carlos | matchicalcom** [22:14 - 22:16]: Because the solar company is a capital.
**Konsti | matchicalcom** [22:17 - 22:20]: The convert action is doing this, right?
**Konsti | matchicalcom** [22:20 - 22:21]: It's creating a partner.
**Carlos | matchicalcom** [22:22 - 22:26]: Yeah, it is okay, that's correct, That's enough.
**Konsti | matchicalcom** [22:26 - 22:33]: And then the only question is like do we like you're creating the contact the external user you create as contact, right?
**Konsti | matchicalcom** [22:35 - 22:40]: Can you show once more the action that you just showed me converts?
**Carlos | matchicalcom** [22:44 - 22:44]: No.
**Konsti | matchicalcom** [22:44 - 22:46]: The other action the one that in.
**Carlos | matchicalcom** [22:46 - 22:58]: The service action, it's the one that calls this one I search to see if there is a contact with that external ID and if it does not.
**Konsti | matchicalcom** [22:58 - 23:01]: Exist, I create one Perfect.
**Konsti | matchicalcom** [23:02 - 23:03]: Yeah, that's it.
**Carlos | matchicalcom** [23:05 - 23:09]: And then I do the convert company and I also added this today.
**Carlos | matchicalcom** [23:09 - 23:22]: That is if the email is passed through and it's empty, it updates the user, the email with the one that we just asked on the pop-up in theory that's.
**Konsti | matchicalcom** [23:22 - 23:24]: One thing missing is like when we.
**Carlos | matchicalcom** [23:24 - 23:26]: Need to send something like this.
**Konsti | matchicalcom** [23:27 - 23:28]: Ah, perfect.
**Carlos | matchicalcom** [23:29 - 23:36]: So this is the idea Tomorrow is to start with the duplicate check that I'm going.
**Carlos | matchicalcom** [23:36 - 23:37]: To review the process in the morning.
**Konsti | matchicalcom** [23:37 - 24:02]: The only other question is also when in theory, or not in theory, but in practice, because we mentioned like, okay, we need other data privacy consents for we need other data privacy consents for what was it called for contact then?
**Konsti | matchicalcom** [24:02 - 24:17]: This basically means, if this is active for your tenant, we need to check and then tell you, okay, now you need to send this contact the data privacy information for XYZ for example, but only if it's missing.
**Carlos | matchicalcom** [24:19 - 24:24]: But that does not need to happen the moment that you create the the conflict I'm assuming.
**Carlos | matchicalcom** [24:24 - 24:24]: So.
**Konsti | matchicalcom** [24:27 - 24:32]: It happens when you create the consultant and then you send the data privacy content to the consultant, right?
**Carlos | matchicalcom** [24:34 - 24:48]: But in here, when you convert partner to a consultant in that specific moment, we need to start firing all those so at the moment that you end parsing the CV, because that would be a common endpoint right?
**Konsti | matchicalcom** [24:51 - 24:54]: Yeah, When we are done with parsing the CV, right?
**Konsti | matchicalcom** [24:54 - 24:55]: Yeah, true.
**Carlos | matchicalcom** [24:55 - 24:56]: That will happen.
**Carlos | matchicalcom** [24:57 - 25:03]: If it's under this new process, the old process or any other, they will always be the same.
**Konsti | matchicalcom** [25:05 - 25:05]: Yeah.
**Konsti | matchicalcom** [25:05 - 25:09]: But if for example you have ION and now you create a new contact from him, right?
**Carlos | matchicalcom** [25:11 - 25:16]: In this case I'm converting this consultant to a client, yeah.
**Konsti | matchicalcom** [25:16 - 25:27]: And for example this consultant only accepted to I accept data privacy for being a consultant, but for clients we have different data privacy, so if you're converting it, we need to ask you.
**Konsti | matchicalcom** [25:27 - 25:36]: Ah, now send also the request for data privacy for clients, in case it is set up in your settings, in your tenant settings.
**Carlos | matchicalcom** [25:36 - 25:37]: But you need to ask.
**Carlos | matchicalcom** [25:38 - 25:43]: I think what I'm finding confusing and I don't know, I know a little bit about privacy flow, not everything.
**Carlos | matchicalcom** [25:43 - 25:48]: So you need to ask because this is the ones that we don't have the email, right?
**Carlos | matchicalcom** [25:48 - 25:54]: That's why you need to inform the user because you could have like a night routine that figures out.
**Carlos | matchicalcom** [25:54 - 25:59]: The business rules to send all the requirements that are necessary.
**Konsti | matchicalcom** [26:00 - 26:03]: No, we were considering not doing it on a night routine or so.
**Konsti | matchicalcom** [26:03 - 26:10]: We were considering doing it at the end of the process, but let's do the following, Carlos.
**Konsti | matchicalcom** [26:10 - 26:16]: Because like currently here the triggers are not clear, the requirements are not clear and I need to check this.
**Konsti | matchicalcom** [26:17 - 26:22]: Tommy needs to clarify these things so we should not guess work around it.
**Konsti | matchicalcom** [26:24 - 26:26]: The goal is to give you clear requirements.
**Konsti | matchicalcom** [26:27 - 26:29]: Otherwise I would just confuse you, right?
**Konsti | matchicalcom** [26:29 - 26:31]: And the requirements are not clear yet.
**Carlos | matchicalcom** [26:32 - 26:45]: No, but in this case, related to the master related functionality, I would say, if we have to plug in some action from the data privacy, should it be difficult, but that should be centralizing the data privacy would be one.
**Carlos | matchicalcom** [26:45 - 26:48]: Additional place to put some code That.
**Konsti | matchicalcom** [26:50 - 26:54]: Situation sure we need to go through the triggers.
**Carlos | matchicalcom** [26:54 - 26:55]: Yeah, yeah.
**Carlos | matchicalcom** [26:55 - 27:04]: But I'm assuming that something at the end of the business there, something would probably be much lighter than at each moment that things are happening because you will.
**Konsti | matchicalcom** [27:05 - 27:07]: Yeah, But the idea is like the following.
**Konsti | matchicalcom** [27:07 - 27:14]: If you, if you, I know what you mean or I get your point, let's say like this, but the idea is the following.
**Konsti | matchicalcom** [27:14 - 27:17]: To just share my screen for a second, that.
**Carlos | matchicalcom** [27:19 - 27:19]: The.
**Konsti | matchicalcom** [27:22 - 27:23]: Where is it here?
**Konsti | matchicalcom** [27:23 - 27:33]: Data privacy that here basically at the very last step, for example, it's like we need to inform you about a few things first like.
**Konsti | matchicalcom** [27:39 - 27:47]: I need to challenge this for me I need, but it's like like because the recruiter can say no, I don't want to send it to him for example, or I want to send it to him.
**Carlos | matchicalcom** [27:47 - 27:49]: Oh, okay, okay, you can overrule the.
**Konsti | matchicalcom** [27:50 - 27:52]: Company settings if the company settings.
**Konsti | matchicalcom** [27:53 - 27:54]: Yes.
**Konsti | matchicalcom** [27:55 - 27:58]: And that's why we want to have the manual user.
**Carlos | matchicalcom** [27:58 - 27:59]: Yeah, yeah.
**Carlos | matchicalcom** [27:59 - 28:09]: But let's not mix the the concepts or the functionalities here and we can get to that privacy part.
**Konsti | matchicalcom** [28:19 - 28:20]: Give me a second.
**Konsti | matchicalcom** [28:34 - 28:40]: Okay, okay, this one I will, I will clarify and Tommy will talk to you regarding this one, but it's more like data privacy.
**Konsti | matchicalcom** [28:40 - 28:41]: It's not related to yours.
**Konsti | matchicalcom** [28:42 - 28:42]: That's cool.
**Konsti | matchicalcom** [28:43 - 28:43]: Any other?
**Carlos | matchicalcom** [28:45 - 28:48]: No, no, probably tomorrow I will have because I will be working.
**Carlos | matchicalcom** [28:48 - 28:50]: The duplicate check is not very difficult.
**Carlos | matchicalcom** [28:50 - 29:04]: The merch park is something that it's just not the way that you implemented merging overall it's just a nightmare to update all the records and leave the database just clean and it's just annoying.
**Konsti | matchicalcom** [29:04 - 29:08]: Things to maintain normally the merge is Also quite annoying.
**Carlos | matchicalcom** [29:09 - 29:16]: Yes, yes, I push see if we can do the duplicate check just now.
**Carlos | matchicalcom** [29:16 - 29:30]: To make sure that we don't add additional records or duplicate records, but the merging itself probably just next week, because I'm not seeing finalizing everything that merge, even if we reduce what you guys have already built for consultants.
**Carlos | matchicalcom** [29:30 - 29:39]: I'm assuming that will take some time to make sure that's right because we are going to write directly in the database and that's always I would say dangerous or need to be careful there.
**Konsti | matchicalcom** [29:40 - 29:43]: This one you need to explain me once more, please.
**Carlos | matchicalcom** [29:44 - 29:52]: Oh, the merging of contacts and use external users and all that, so the way that the merge is, mergers are always built, right?
**Carlos | matchicalcom** [29:52 - 30:05]: It demands deleting records from the database and that's something that we always need to be very careful because of all the references, all the external references on other tables and making sure that we keep everything but the references.
**Konsti | matchicalcom** [30:05 - 30:18]: In this case, we don't delete when we say we merge contact is more like pick one, we move all the references from the one to the other and then we delete the one that you decided to move away from.
**Carlos | matchicalcom** [30:20 - 30:20]: You.
**Carlos | matchicalcom** [30:20 - 30:21]: Leave it in the database.
**Carlos | matchicalcom** [30:21 - 30:24]: I think in the consultant with the status, right?
**Konsti | matchicalcom** [30:25 - 30:26]: Yeah, currently.
**Konsti | matchicalcom** [30:26 - 30:30]: But I'm not sure should we leave those like because they're just waste.
**Carlos | matchicalcom** [30:30 - 30:34]: I think after I would say after a few weeks.
**Carlos | matchicalcom** [30:34 - 30:39]: Or I will leave it for now to make sure if something goes wrong, you can go back.
**Carlos | matchicalcom** [30:41 - 30:46]: I would have some kind of routine that archives them or really deletes, deletes them after.
**Carlos | matchicalcom** [30:49 - 30:58]: Because what happened to me in the past was, we thought that we were merging everything to the moving, everything to the most recent contact.
**Carlos | matchicalcom** [30:58 - 31:04]: There is always no, no, that's not a problem.
**Carlos | matchicalcom** [31:04 - 31:22]: So when you try to delete, I always have normally protect just to make sure that we don't forget things and then something blows up because we tried to delete it and you forgot to move some records and we only find that we forgot some records when we are trying to delete, because that's not the best restraint.
**Carlos | matchicalcom** [31:22 - 31:29]: So yeah, bad experiences with merging in complex multiple table scenarios.
**Konsti | matchicalcom** [31:29 - 31:35]: I don't like the merge and it's so nasty also to maintain whenever we update something, we need to update the fucking merge.
**Carlos | matchicalcom** [31:37 - 31:38]: Can't we get rid of it?
**Carlos | matchicalcom** [31:39 - 31:43]: We need to stop duplicating the system that's the way to go.
**Konsti | matchicalcom** [31:43 - 31:44]: Yeah.
**Konsti | matchicalcom** [31:44 - 31:55]: But like we, that's basically not possible because users are stupid duplicates are like a key issue in the like you can Only.
**Carlos | matchicalcom** [31:57 - 32:08]: I was saying that now that we have we double check the files that are so no duplicate files get in if we go like my first name, last name, email, I don't.
**Konsti | matchicalcom** [32:08 - 32:11]: Know couple of just it will still happen.
**Konsti | matchicalcom** [32:11 - 32:13]: It will still happen just because.
**Konsti | matchicalcom** [32:13 - 32:18]: Also like for example contacts we are passing them with AI and then we extract these.
**Konsti | matchicalcom** [32:18 - 32:23]: So it's we will need a merge case either way, but we should not lose.
**Konsti | matchicalcom** [32:23 - 32:27]: I think a few things that we are currently doing, but I don't want.
**Carlos | matchicalcom** [32:27 - 32:27]: To.
**Konsti | matchicalcom** [32:31 - 32:36]: Here step onto Tommy, but I think he's way too eager with like we.
**Konsti | matchicalcom** [32:36 - 32:40]: Need all these features by like yeah, but we will spend too much time on these and they are not.
**Konsti | matchicalcom** [32:41 - 32:43]: There's too little business value in these.
**Konsti | matchicalcom** [32:44 - 32:50]: So sometimes we need to like, but I told him how many estimations are done by the dev team.
**Carlos | matchicalcom** [32:53 - 32:54]: Once we have.
**Carlos | matchicalcom** [32:54 - 32:55]: Context, okay, yeah.
**Konsti | matchicalcom** [32:58 - 33:04]: But as long as you are even lacking context, the estimation should be even more defensive, right?
**Konsti | matchicalcom** [33:07 - 33:11]: We just need to ensure that we make enough money to afford, but we.
**Carlos | matchicalcom** [33:11 - 33:13]: Will get there but yeah.
**Carlos | matchicalcom** [33:13 - 33:22]: But at this phase I think that being practical with the most value requirements, it will be key for you guys.
**Carlos | matchicalcom** [33:22 - 33:28]: If you allow me the advice building just because we.
**Carlos | matchicalcom** [33:28 - 33:32]: Will need it one day doesn't help too much right now.
**Konsti | matchicalcom** [33:33 - 33:39]: Sure, fully agree, fully agree, We need to be more restrictive here.
**Konsti | matchicalcom** [33:39 - 33:44]: One hundred percent agreed, Carlos.
**Konsti | matchicalcom** [33:44 - 33:47]: Is there anything like what are you going to approach tomorrow?
**Konsti | matchicalcom** [33:47 - 33:51]: That we can maybe briefly talk through it and I can maybe give you some guidance on things.
**Carlos | matchicalcom** [33:51 - 34:02]: I will start my day after the daily with a call with tommy reviewing that duplicate check flow that is in.
**Carlos | matchicalcom** [34:02 - 34:03]: Figma.
**Carlos | matchicalcom** [34:03 - 34:28]: I know that he talked with Lino today They were reviewing a few items, not sure if it's a lot or less, but this is the same tables consulting external users that I'm doing right now I'll be searching by first name, last name, email, maybe not a lot more, so I think I'm good to be honest, I don't expect and you already have this implemented in another place, so I probably use that as a.
**Konsti | matchicalcom** [34:28 - 34:38]: Reference and just otherwise just hit me up and we will talk to Mori either way, and then I have some news from NTT.
**Carlos | matchicalcom** [34:40 - 34:42]: Let's expect awesome news.
**Konsti | matchicalcom** [34:43 - 34:50]: Sure always I'm one hundred percent closer, just a matter of time.
**Konsti | matchicalcom** [34:50 - 34:52]: Not all converted immediately.
**Konsti | matchicalcom** [34:52 - 34:54]: Some will convert in a few years, but.
**Carlos | matchicalcom** [34:55 - 34:56]: At least you don't give up.
**Carlos | matchicalcom** [34:57 - 34:59]: No, that's persistence That's important.
**Konsti | matchicalcom** [34:59 - 35:01]: Yeah, one hundred percent cool.
**Konsti | matchicalcom** [35:01 - 35:03]: Carlos, as always was a pleasure.
**Carlos | matchicalcom** [35:03 - 35:04]: Let's keep talking sure.
**Konsti | matchicalcom** [35:04 - 35:05]: See you, see ya.
**Konsti | matchicalcom** [35:05 - 35:06]: Bye bye.
