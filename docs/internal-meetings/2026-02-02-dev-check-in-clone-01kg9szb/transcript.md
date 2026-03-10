# Dev check in (Clone)

**Konsti | matchicalcom** [00:15 - 00:20]: It's Carlos Hey Korus, how are you doing?
**Carlos | matchicalcom** [00:20 - 00:21]: I'm good and you.
**Konsti | matchicalcom** [00:23 - 00:32]: Yeah yeah, yeah, like intense weekend We are starting already with the moving and cleaning of the house and so on you off today.
**Carlos | matchicalcom** [00:33 - 00:36]: Huh weren't you supposed to be off?
**Konsti | matchicalcom** [00:37 - 00:51]: Yes, yes, we were but this was due to a different reason I was supposed to be off to like for our wedding There was like today is the test dining basically where you.
**Konsti | matchicalcom** [00:51 - 00:57]: Select the menus and everything okay, but we decided not to go there because it would Be Like in Five Hours.
**Konsti | matchicalcom** [00:57 - 01:00]: Ride in the One Direction for Just Dinner.
**Konsti | matchicalcom** [01:00 - 01:10]: And checking the menu and then back so we did just we are digital OK Carlos, let's jump in do you have some questions?
**Konsti | matchicalcom** [01:10 - 01:11]: How are you doing?
**Carlos | matchicalcom** [01:11 - 01:21]: By the way I'm good I've checked the bulk move so the move from the AI usage to the archetable.
**Carlos | matchicalcom** [01:21 - 01:42]: Run was executed yesterday and really moved things what was not happening for a while now so that part is good I was now getting ready to prepare I would say deletion scripts but we need to clear those columns the ones that were moved to aws just to make sure that I finalize that part.
**Konsti | matchicalcom** [01:43 - 01:46]: And there's one thing that came to my mind that needs to be fixed.
**Konsti | matchicalcom** [01:46 - 02:04]: Please I will show you that was like we need to we need to better like I know you pointed it out and I should have, but we need to make better review and just go through the requirements roughly because that we don't mess up things right?
**Konsti | matchicalcom** [02:06 - 02:28]: It's just a minor thing and I articulated it the wrong way but just for the future what did I miss not really critical and basically it's I can show you in a minute It's very simple It's like what I meant with secondary It's not just that I want to pass a secondary but you need to also check against the secondary currently you're just checking against the primary.
**Carlos | matchicalcom** [02:28 - 02:38]: Object correct I think I copy what was doing in the other page but okay, I can check I can improve it It's not a big deal I.
**Konsti | matchicalcom** [02:38 - 02:56]: Thought it was strange really a minor thing but I know I need to show you something first right okay go I financially publish because I now moved everything as I mentioned that is related to matching is now in this four queries like this one is for first calculating only the matches.
**Carlos | matchicalcom** [02:59 - 03:00]: Okay, let's.
**Konsti | matchicalcom** [03:03 - 03:19]: This is for getting then the preview data so all the data that is displayed in the card and then this query here is used for getting the details if we open the sidebar so just for then opening the sidebar details and this query here is what we can use in the back end.
**Konsti | matchicalcom** [03:19 - 03:21]: If we need to recalculate any scores or so.
**Konsti | matchicalcom** [03:22 - 03:35]: As Chico was doing it in multiple places, here you can pass the demand and one OR Multiple Consultant ID's as a List and then you get the scores back here I see that you.
**Carlos | matchicalcom** [03:35 - 03:38]: Are liking the advanced queries a lot.
**Konsti | matchicalcom** [03:38 - 04:01]: Yeah, yeah, I completely moved to them and I need to show you something because I fixed the indexing and everything and like when we are now in production, not using the feature toggle, I click on find candidates, let's deactivate all the filters, Give me a second.
**Konsti | matchicalcom** [04:04 - 04:10]: Okay, that looks like a more easy one, Let's find it tougher one, because like in which tenant am I?
**Konsti | matchicalcom** [04:10 - 04:24]: I'm in the, I'm in the wavestone tenant perfect, so go here find candidate, that's the old query.
**Konsti | matchicalcom** [04:25 - 04:36]: Oh, okay, you see, So it takes a few seconds and now I go to V two and it's there.
**Carlos | matchicalcom** [04:38 - 04:41]: Cool more performance.
**Konsti | matchicalcom** [04:41 - 04:52]: Yeah, yeah, it's sometimes like something like one query I tested took usually like fifty seconds or so and it's now like done in like in milliseconds, crazy.
**Carlos | matchicalcom** [04:52 - 04:55]: Like one second or once you start adding the filtering all the filtering.
**Carlos | matchicalcom** [04:55 - 04:56]: I'm not sure.
**Carlos | matchicalcom** [04:56 - 05:01]: If it's already there, you might have some downgrade on performance, but still no.
**Konsti | matchicalcom** [05:01 - 05:04]: Already like look at this if we go here to bridging.
**Carlos | matchicalcom** [05:05 - 05:10]: Yeah, those big ones, but those use.
**Konsti | matchicalcom** [05:10 - 05:15]: The custom roles are probably custom roles with custom roles.
**Konsti | matchicalcom** [05:15 - 05:21]: I also implemented it already so if I go to V two and for example.
**Konsti | matchicalcom** [05:21 - 05:24]: Say, okay, only show me the ones that are available.
**Konsti | matchicalcom** [05:26 - 05:28]: Yeah, that's pretty cool.
**Carlos | matchicalcom** [05:28 - 05:36]: Decent right, decent right, yeah, that will allow us to scale for a while.
**Konsti | matchicalcom** [05:36 - 05:43]: Yes, yes, yes, I also checked it like I think until like tenants with thirty-k or so should.
**Konsti | matchicalcom** [05:43 - 05:44]: Not be a deal.
**Carlos | matchicalcom** [05:45 - 05:54]: Oh, right, but we are do we have a lot of consultancies that have more than thirty K consultants.
**Konsti | matchicalcom** [05:54 - 06:00]: Yeah, we see external definitely, oh, externals, okay, okay, that's the issue.
**Konsti | matchicalcom** [06:00 - 06:03]: The internals probably not, but the external ones for sure.
**Konsti | matchicalcom** [06:04 - 06:14]: There we already have agencies that have forty thousand consultancy consultants in their database that they want to move so basically, what is the issue here?
**Konsti | matchicalcom** [06:14 - 06:25]: The issue is like when I click here I only the three, but what you should match against is like you.
**Konsti | matchicalcom** [06:25 - 06:35]: Please need also to match against not just the object ID, but There's the secondary because you.
**Carlos | matchicalcom** [06:36 - 06:38]: Yeah, no worries.
**Carlos | matchicalcom** [06:39 - 06:43]: Yeah, it's the other column, OK, yeah, easy.
**Konsti | matchicalcom** [06:43 - 06:46]: So the secondary object ID, this one.
**Carlos | matchicalcom** [06:46 - 06:50]: Here and the condition is the same.
**Konsti | matchicalcom** [06:50 - 06:55]: But against that attribute against the secondary one, right?
**Carlos | matchicalcom** [06:56 - 07:01]: But I should compare the object ID or the additional object ID both.
**Konsti | matchicalcom** [07:02 - 10:18]: Vodafone is calling, give me a second, sorry, or five minutes, Okay, yeah, sorry, like we need to make Internet work before we move right.
**Konsti | matchicalcom** [10:19 - 10:20]: Yeah, so just check.
**Carlos | matchicalcom** [10:25 - 10:26]: I'm publishing it right now.
**Konsti | matchicalcom** [10:27 - 10:28]: Ah, perfect.
**Konsti | matchicalcom** [10:28 - 10:36]: And the other thing is also like when I'm searching here that you also search for secondary, do you do this.
**Carlos | matchicalcom** [10:36 - 10:42]: Already when you search, let me just check on the search field, right?
**Konsti | matchicalcom** [10:43 - 10:43]: Yes.
**Carlos | matchicalcom** [10:46 - 10:48]: No, just the object ID that.
**Konsti | matchicalcom** [10:49 - 10:52]: Would also be handy to have that we can search for secretary.
**Konsti | matchicalcom** [10:52 - 11:08]: And now, last but not least in the consulting in the front end app, OK, here we have the admin parse cv's like the CV par detail stuff is here because of the shithub.
**Konsti | matchicalcom** [11:08 - 11:11]: Chico did not want to move it, because he has his component here.
**Konsti | matchicalcom** [11:15 - 11:19]: So we have the detail here and this is still the old stuff.
**Konsti | matchicalcom** [11:21 - 11:25]: In this case just bring your component here as well in the front end.
**Carlos | matchicalcom** [11:25 - 11:31]: Then would it create cyclical references between both.
**Konsti | matchicalcom** [11:31 - 11:33]: No, I would not.
**Konsti | matchicalcom** [11:33 - 11:35]: You cannot import it, you cannot import components.
**Konsti | matchicalcom** [11:35 - 11:37]: You would need to move it to a library.
**Carlos | matchicalcom** [11:39 - 11:40]: I need hang on.
**Carlos | matchicalcom** [11:41 - 11:43]: That's bad, but okay, yeah, not a big deal.
**Konsti | matchicalcom** [11:44 - 11:46]: It's not so bad because that's just for now.
**Konsti | matchicalcom** [11:49 - 11:52]: The CV parser in the future will not live here anymore.
**Konsti | matchicalcom** [11:52 - 11:59]: In the future we will move it what you could also do instead.
**Konsti | matchicalcom** [11:59 - 12:13]: But this is probably way more effort, but it would be actually cleaner that we just have this list view here on the consulting app and this detail view you already move, like actually, I don't think that.
**Konsti | matchicalcom** [12:13 - 12:14]: It's too much of an effort.
**Konsti | matchicalcom** [12:14 - 12:16]: You just need to move that screen right?
**Konsti | matchicalcom** [12:17 - 12:22]: And then move the reference actually it should just be copy paste, right.
**Carlos | matchicalcom** [12:22 - 12:24]: Let me see you're seeing.
**Carlos | matchicalcom** [12:24 - 12:25]: I mean parse CV's.
**Carlos | matchicalcom** [12:25 - 12:28]: That's the list that pop that is the pop up that's.
**Konsti | matchicalcom** [12:30 - 12:32]: In this list view here.
**Konsti | matchicalcom** [12:32 - 12:40]: That's the admin parse CV's here we have a pop up and here the pop up actually that's even also a copy paste shit.
**Konsti | matchicalcom** [12:40 - 12:44]: I don't know why Niki did not move it.
**Konsti | matchicalcom** [12:44 - 12:45]: Maybe we need to ask him but.
**Konsti | matchicalcom** [12:45 - 12:52]: Ah, yeah, because he used here different components that we only have in the front end app.
**Konsti | matchicalcom** [12:52 - 12:54]: Yeah, not so ideal, doesn't matter.
**Carlos | matchicalcom** [12:56 - 13:00]: I can copy paste it Let me just get it right first Let's keep.
**Konsti | matchicalcom** [13:00 - 13:02]: The list view here and just.
**Konsti | matchicalcom** [13:02 - 13:13]: Copy, paste that screen and remove it from here and then we just link this one here, this link in the future goes to the other app, but I think that's the easiest and you can use yours.
**Konsti | matchicalcom** [13:14 - 13:20]: But the detail screen you can really completely just move, OK, so move the.
**Carlos | matchicalcom** [13:20 - 13:25]: Detail screen and take a look at the lists.
**Konsti | matchicalcom** [13:26 - 13:29]: Now the list you don't need to yeah, just the link, yeah, just fix.
**Carlos | matchicalcom** [13:29 - 13:32]: The link here because I need to link it here.
**Konsti | matchicalcom** [13:32 - 13:43]: Link to the data, okay, okay, in this case I will already I've published.
**Carlos | matchicalcom** [13:43 - 13:49]: But since a couple more things I need to only need a few more minutes, but yeah can get that done quickly.
**Konsti | matchicalcom** [13:50 - 14:14]: And by the way here if we have this admin template like notify admins, where's by the way, notify admins, notify admins just that you know that I did not even use it right now so far, so here's an isadmin.URL.
**Konsti | matchicalcom** [14:20 - 14:43]: Just that you know that it's basically based on this, We are using a different if this is true, the link that is passed is open in the admin app, in the other, oh, it's open in the other thing, OK, notify admins, please admin.
**Carlos | matchicalcom** [14:44 - 14:50]: I had seen that notify admins the action itself.
**Konsti | matchicalcom** [14:52 - 15:05]: Okay, in this case and if you update this, I will already do it that the email is correct, so I set this one here to true, because when we move the detail view, then the CV parlor detail will be.
**Carlos | matchicalcom** [15:07 - 15:08]: Admin side.
**Konsti | matchicalcom** [15:08 - 15:13]: Yeah, perfect, cool, All right, that's it from my side.
**Konsti | matchicalcom** [15:14 - 15:48]: By the way, I definitely need to show you this cloud code setup for using it, also a little bit without system for advanced, curious and so on, because it's ridiculous like because I managed to really optimize the performance of these queries heavily and even create and ideate these five hundred lines, two hundred lines queries in a relatively short amount of time and then I needed to add custom roles to that queries.
**Konsti | matchicalcom** [15:48 - 15:55]: So right now we don't have a branch anymore with two different queries, one for custom role, one for non customer role, but brought them all in.
**Konsti | matchicalcom** [15:55 - 16:02]: And it was basically, it took me like an hour after I had done the queries to migrate them, because.
**Carlos | matchicalcom** [16:07 - 16:19]: When you know the queries, that's cool, I've also Friday also made some adjustments on the project details, so that component that I was working or that I've worked a little bit.
**Carlos | matchicalcom** [16:19 - 16:30]: It's not ready, but the others local dictators are implemented for the concerns and or the other attributes that you add on the on the project detail.
**Carlos | matchicalcom** [16:30 - 16:37]: Not sure if you use the API that the API should be good to go and the screen.
**Carlos | matchicalcom** [16:37 - 16:42]: I didn't have a layout so I just put the fields just listed all the text areas.
**Carlos | matchicalcom** [16:42 - 16:48]: It's like four or six on the project detail perfect.
**Konsti | matchicalcom** [16:48 - 16:51]: So the wrapper is.
**Konsti | matchicalcom** [16:54 - 16:56]: It's where is it project?
**Carlos | matchicalcom** [16:58 - 17:01]: Project creator update perfect.
**Carlos | matchicalcom** [17:02 - 17:10]: Chico AD started it and I created the additional local decks for the rest of the stuff.
**Konsti | matchicalcom** [17:13 - 17:14]: There was one more question.
**Konsti | matchicalcom** [17:14 - 17:25]: By the way, when you did the address refactor, did you write a fixed script that is moving all the cities and countries to the localized version?
**Carlos | matchicalcom** [17:29 - 17:30]: I think so.
**Carlos | matchicalcom** [17:30 - 17:33]: But you ask our questions because it was weeks ago.
**Carlos | matchicalcom** [17:33 - 17:34]: Let me check.
**Carlos | matchicalcom** [17:35 - 17:39]: I think I've created it, but did.
**Konsti | matchicalcom** [17:39 - 17:40]: It run as the question?
**Carlos | matchicalcom** [17:40 - 17:45]: Right, right, right, I need let me see if I've created.
**Carlos | matchicalcom** [17:45 - 17:50]: I would have created a timer for it migrated wrestle.
**Carlos | matchicalcom** [17:50 - 17:55]: Yeah, there is a timer not sure if it was executed or not.
**Carlos | matchicalcom** [17:56 - 17:58]: I will sit in production if the.
**Konsti | matchicalcom** [17:58 - 18:01]: Timer most likely not.
**Konsti | matchicalcom** [18:01 - 18:07]: Because Chico had a case where it was not I and here is creating the description dict right.
**Konsti | matchicalcom** [18:13 - 18:14]: There is approved.
**Konsti | matchicalcom** [18:14 - 18:17]: Doesn't really matter on the description dates.
**Konsti | matchicalcom** [18:18 - 18:26]: Right now we were even considering like way to further streamline these things.
**Konsti | matchicalcom** [18:26 - 18:28]: Like maybe I can show you is it here?
**Konsti | matchicalcom** [18:29 - 18:32]: Because the idea was the following I recorded a loom?
**Konsti | matchicalcom** [18:32 - 18:35]: But like the idea is that we don't end up.
**Konsti | matchicalcom** [18:35 - 18:46]: I just mock up this for test say test purposes, but the idea is because right now, for example for engagement we have these three versions right?
**Konsti | matchicalcom** [18:47 - 18:51]: And for projects it's five or four or whatever four.
**Carlos | matchicalcom** [18:51 - 18:51]: Four.
**Carlos | matchicalcom** [18:51 - 18:52]: Yeah, yeah.
**Konsti | matchicalcom** [18:52 - 18:55]: And we realize like even this four will not really fully help.
**Konsti | matchicalcom** [18:55 - 18:57]: And it's like you need more versatility.
**Konsti | matchicalcom** [18:58 - 19:06]: And that's why I was considering like maybe let's do it like this in your database where you can maintain.
**Konsti | matchicalcom** [19:06 - 19:08]: You can just maintain like three versions.
**Konsti | matchicalcom** [19:09 - 19:10]: These are like these three.
**Konsti | matchicalcom** [19:10 - 19:16]: You can maintain a bullet version, a paragraph version and mixed version kind of yeah, in the future.
**Konsti | matchicalcom** [19:16 - 19:18]: And there's one extra version.
**Konsti | matchicalcom** [19:18 - 19:19]: That's your raw data dump.
**Konsti | matchicalcom** [19:19 - 19:24]: I don't know where you can just dump all the extra information that you maybe have for the project.
**Konsti | matchicalcom** [19:24 - 19:25]: Just that the information is there.
**Konsti | matchicalcom** [19:25 - 19:30]: If we need it for AI optimizations, you can even provide some more unstructured data for us, right?
**Konsti | matchicalcom** [19:31 - 19:37]: Okay, And when you in the CV export, you want to have different options and that's why we were considering here.
**Konsti | matchicalcom** [19:38 - 19:52]: You can go with your default bullet version, your default paragraph version or your default mixed version or you go with AI optimize and then we just tweak it and then with AI optimize in the future you will have settings like okay, how long should it be?
**Konsti | matchicalcom** [19:52 - 19:55]: And then the prompt is just generating these things.
**Konsti | matchicalcom** [19:55 - 20:01]: We don't have long version and so on should it be like more bold or conservative or balanced?
**Konsti | matchicalcom** [20:01 - 20:12]: Bullet format, paragraph format, mix format, whatever, Like what should be the writing style in person, first person, third person, what should be the focus, task focus, what is additional?
**Konsti | matchicalcom** [20:12 - 20:15]: Like make all, lowercase or whatever.
**Konsti | matchicalcom** [20:16 - 20:24]: So the users have more flexibility when doing the AI optimized version in the CV export and we don't.
**Konsti | matchicalcom** [20:24 - 20:35]: Need to bother with ten different versions because we say, okay, for data maintenance we just know three versions and your raw data dump OK, what do you think about it?
**Carlos | matchicalcom** [20:37 - 20:44]: I like all the flexibility to be honest, because it's kind of things that we normally would write in the prompts to try to adjust it.
**Carlos | matchicalcom** [20:45 - 20:48]: But in this case you're just doing features to the user.
**Konsti | matchicalcom** [20:49 - 20:52]: Yeah, that's the thing and then we can adjust it.
**Konsti | matchicalcom** [20:52 - 21:04]: We don't need an extra prompt and an extra workflow for each different kind of description, but just like one size fits it all and the user can adjust and I will have one master prompt that takes in this configuration and.
**Carlos | matchicalcom** [21:04 - 21:08]: Does you probably can even just save this and just reuse it for.
**Konsti | matchicalcom** [21:08 - 21:20]: Yeah, that's the thing you can save and apply and there are recommended versions and these recommended versions are different for every template and use case something like that.
**Konsti | matchicalcom** [21:20 - 21:28]: So then our users get much more flexibility to customize stuff and we don't need to bother about like okay, let's have ten different versions.
**Carlos | matchicalcom** [21:31 - 21:34]: That's hard to maintain something from the user perspective.
**Carlos | matchicalcom** [21:34 - 21:44]: I think maintaining two three, it's okay, maintaining ten out of sync, right?
**Carlos | matchicalcom** [21:44 - 21:47]: Just then you'll have mistakes and yeah.
**Konsti | matchicalcom** [21:47 - 21:49]: That'S yeah, yeah, that's bullshit.
**Konsti | matchicalcom** [21:49 - 21:55]: That's why I came up with this idea like Friday Night Three am and then I.
**Konsti | matchicalcom** [21:55 - 22:01]: Woke up and I was like okay, now I need to sketch this out and then plant this and then I kind of vibe-coded this shit here.
**Konsti | matchicalcom** [22:01 - 22:10]: For just transporting the idea and then I shoot a loom that I wanted to share with you as well I think it's very cool, It's a good.
**Carlos | matchicalcom** [22:10 - 22:16]: Idea, I think and it will simplify so right now.
**Carlos | matchicalcom** [22:16 - 22:22]: But you added the raw so that would be The Additional Information Right so Something Raw.
**Konsti | matchicalcom** [22:22 - 22:33]: Would be something like, because some people are describing their engagement or their project for example with two pages, but we say in our default bullet description we don't have two pages.
**Konsti | matchicalcom** [22:33 - 22:35]: It's just like ten bullets or eight bullets or so.
**Konsti | matchicalcom** [22:37 - 22:43]: And if I want something super lengthy and I want to provide this extra information, then you can.
**Konsti | matchicalcom** [22:43 - 22:46]: That's why we need some raw data dump kind of you.
**Carlos | matchicalcom** [22:46 - 22:49]: Know for the users so would be four types.
**Konsti | matchicalcom** [22:49 - 23:01]: Yeah, okay, And then we could kind of harmonize it and we could even consider that we then don't put it into like four different description dicts and then we have description dict logic.
**Konsti | matchicalcom** [23:01 - 23:10]: But more like streamline it with four different keys for the four different types and just having one entity, you know currently we have a description dick with a category.
**Konsti | matchicalcom** [23:10 - 23:12]: That can be multiple, but yeah, it's.
**Carlos | matchicalcom** [23:12 - 23:28]: Like more flexible having I think having directly the four local keys one for each would be in terms of implementation easier and less complex, because that component is a little bit complex and buggy in some scenarios.
**Carlos | matchicalcom** [23:28 - 23:29]: Doesn't really work that.
**Konsti | matchicalcom** [23:29 - 23:30]: Well, it's bugging.
**Konsti | matchicalcom** [23:30 - 23:34]: Yeah, yeah, Niki did not fully finish it or polish it?
**Konsti | matchicalcom** [23:35 - 23:42]: Let's say, okay, did you update the project delete now this one You did delete description dates?
**Konsti | matchicalcom** [23:42 - 23:46]: I perfect, I think not all keys, but doesn't matter like delete.
**Konsti | matchicalcom** [23:46 - 23:48]: We don't care too much about right now.
**Carlos | matchicalcom** [23:50 - 23:53]: No, I have not updated the project delete.
**Konsti | matchicalcom** [23:56 - 23:57]: We have some extra here.
**Konsti | matchicalcom** [23:57 - 23:59]: Okay, cool, perfect.
**Konsti | matchicalcom** [23:59 - 23:59]: All right.
**Konsti | matchicalcom** [23:59 - 24:02]: Carlos, what are you working on next?
**Carlos | matchicalcom** [24:02 - 24:14]: Currently I was going to the to work on the component because of the description disks, but now that you are saying that you probably want something slightly different, It's not worth it.
**Konsti | matchicalcom** [24:14 - 24:19]: I would say yeah, the decision is unfully made there.
**Carlos | matchicalcom** [24:24 - 24:29]: I would wait at least let's say one day until we need to talk.
**Konsti | matchicalcom** [24:29 - 24:30]: About this with Tommy.
**Carlos | matchicalcom** [24:32 - 24:38]: No, I have some things that Chico on the CV template and the CV export.
**Carlos | matchicalcom** [24:39 - 24:41]: There are some columns that were deleted or need to be deleted.
**Carlos | matchicalcom** [24:41 - 24:43]: But I need to clean the data.
**Carlos | matchicalcom** [24:43 - 24:48]: Also so there are some like call it minor tasks, but some of these things.
**Carlos | matchicalcom** [24:48 - 24:56]: But aside of double checking the AI usage, I don't have anything else in my platyf I'm not going to with the project description.
**Carlos | matchicalcom** [24:56 - 25:14]: I saw one thing in the notion Friday, because those columns on the card that was named V one, so those additional categories that we have there were not Let me just open this, it's probable I'm going to just share my.
**Konsti | matchicalcom** [25:14 - 25:15]: Screen.
**Carlos | matchicalcom** [25:17 - 25:33]: I'm assuming that you move them, I'm just not sure, so this is the card that I added to this to the sprint, OK, so this was the description dict and this additional.
**Carlos | matchicalcom** [25:33 - 25:44]: Four are implemented right now, but there was also those categories that I'm not sure if those are prioritary or not, also.
**Konsti | matchicalcom** [25:46 - 25:51]: Currently not one hundred percent I need to check in with Tommy regarding, like the final specs that we make.
**Carlos | matchicalcom** [25:51 - 26:05]: This, okay, okay, okay, so that part is implemented, I'm missing the delete and the update and the creation are completed.
**Carlos | matchicalcom** [26:05 - 26:17]: If I'm not going to start the component, the text area weblog not sure we can talk, I don't know after lunch or something.
**Konsti | matchicalcom** [26:17 - 26:19]: If you have, yeah, let's do.
**Konsti | matchicalcom** [26:20 - 26:25]: There was one extra thing, like the setup of the API for Yes.
**Carlos | matchicalcom** [26:27 - 26:38]: I do have some, I'll say small requirements on that, so some wire framing to do there, but that's that's going to delay because we did freelance.
**Carlos | matchicalcom** [26:38 - 26:57]: I do have something for freelance wireframe is just JSON so very simple, no business logic, just like structures, just create a structure, okay, it's not a full requirement because it doesn't really have logic.
**Konsti | matchicalcom** [26:57 - 27:00]: For now, okay, yeah, but just like.
**Carlos | matchicalcom** [27:00 - 27:11]: Okay, easy, I can start because we are waiting on credentials for the freelance the I think is that.
**Konsti | matchicalcom** [27:11 - 27:15]: And then it's just like setting up the endpoint, adding the structure and done.
**Carlos | matchicalcom** [27:16 - 27:21]: I hope so, But there are things that are both ways, right?
**Carlos | matchicalcom** [27:21 - 27:28]: So some that we have to make available for them to call and some that we have to call, but these stuff.
**Konsti | matchicalcom** [27:28 - 27:31]: I would say, let's move these all to integrations, right?
**Konsti | matchicalcom** [27:34 - 27:38]: That's not client specific, maybe we should just leave it in the back end.
**Carlos | matchicalcom** [27:39 - 27:45]: No, it's not client specific, this is, but would be, I'll say provider specific, right?
**Carlos | matchicalcom** [27:45 - 27:52]: So in this case, for each one that we are going to create, I.
**Konsti | matchicalcom** [27:52 - 27:54]: Wouldn'T put in the integrations app.
**Carlos | matchicalcom** [27:54 - 28:04]: Yes, yes, I would put it in a separate, in a separate, because these things now we are going to interact with two maybe we have twenty one day and just not have it in.
**Konsti | matchicalcom** [28:04 - 28:06]: Core, then just use the integrations app.
**Konsti | matchicalcom** [28:07 - 28:15]: OK, cool, All right, Tell us I will check in with Tommy as soon as possible and let you know as soon as we have a plan here.
**Carlos | matchicalcom** [28:16 - 28:32]: Okay, okay, But between the user, so I want to clean that table and probably not today, but I want to clean it, that will save us a huge amount of storage, but at least the rows have moved, so I will need to keep close eye into it.
**Carlos | matchicalcom** [28:32 - 28:36]: Also because right now we are just running the the timer once per week.
**Carlos | matchicalcom** [28:36 - 28:42]: I don't think that's a problem because everything moved didn't check the performance in production.
**Carlos | matchicalcom** [28:42 - 28:43]: I'm curious to see.
**Carlos | matchicalcom** [28:43 - 28:50]: Make sure that things are just queerable just in a fast way, Yeah, should.
**Konsti | matchicalcom** [28:50 - 28:53]: Be and like in the end, like only us are querying.
**Carlos | matchicalcom** [28:55 - 29:01]: I know, But if it's slow, it slows down everyone, so that's a problem always, yeah, yeah.
**Konsti | matchicalcom** [29:01 - 29:04]: But it's not query so many times that the point that we want you to make.
**Konsti | matchicalcom** [29:04 - 29:07]: It's like correct, correct, correct, few calls a day at max.
**Konsti | matchicalcom** [29:09 - 29:21]: Okay, But so one last question like business relevant requirements, you're currently kind of on hold what new features are, so I will check in with you as.
**Carlos | matchicalcom** [29:21 - 29:25]: Soon as I have, I could continue involving the project, right?
**Carlos | matchicalcom** [29:27 - 29:29]: But I will need some input from you guys.
**Konsti | matchicalcom** [29:30 - 29:32]: Yes, wait, give me a second regarding project.
**Konsti | matchicalcom** [29:32 - 29:33]: Let me check for a second.
**Konsti | matchicalcom** [29:55 - 29:56]: What you can do.
**Konsti | matchicalcom** [29:57 - 30:00]: Because this one, we know we will need one hundred percent.
**Konsti | matchicalcom** [30:00 - 30:04]: It's like in this project engagements ticket, right?
**Konsti | matchicalcom** [30:06 - 30:26]: So in the overlying ticket here, what we will need is like these crud actions, like if you read through these things here, not the project par there yet.
**Konsti | matchicalcom** [30:37 - 30:39]: Every engagement must always have a project.
**Konsti | matchicalcom** [30:39 - 30:53]: This logic we already have when triggering add engagement existing project, since we also have boolean flag or status like currently all our.
**Konsti | matchicalcom** [31:01 - 31:13]: Currently our projects have this status flag, you will see currently we have this project status dummy, yeah, Maybe want I.
**Carlos | matchicalcom** [31:13 - 31:21]: Found that interesting, yes, That you created a huge amount of projects just to fulfill that requirement that every engagement needs to have a project, right?
**Konsti | matchicalcom** [31:21 - 31:22]: Yeah.
**Konsti | matchicalcom** [31:22 - 31:33]: But in this project is stuff stored like the client and the description of the project and so on, okay, So it's necessary because we don't store all the information of the engagement in the engagement.
**Konsti | matchicalcom** [31:33 - 31:37]: We store the client in the project and other things, so that's why we have it.
**Konsti | matchicalcom** [31:38 - 31:49]: But if you read through this logic here, like the unmanaged logic, so if you would read like you can skip the project path or things like this one you can skip.
**Konsti | matchicalcom** [31:50 - 32:00]: But if you read through that logic here, convert, manage to unmanage overview is not important right now, so I will make that stuff bold.
**Konsti | matchicalcom** [32:01 - 32:10]: Convert, manage to unmanaged project That's what we will need right away And this one is also decided here.
**Konsti | matchicalcom** [32:11 - 32:15]: One special boot inflate, so this one I also make bold.
**Konsti | matchicalcom** [32:27 - 32:28]: This one.
**Konsti | matchicalcom** [32:38 - 33:00]: Not now merge case this one is quite straightforward here and delete case this one you could work on these, like first, like, go through the requirements and let's maybe check in in an hour or so when you have questions or, or like first first maybe fix this AI user thing.
**Carlos | matchicalcom** [33:00 - 33:04]: Yeah, I need to finalize those small things.
**Konsti | matchicalcom** [33:04 - 33:12]: So yeah, finalize those small things and then let's check in around like I don't know, maybe before your lunch or so.
**Konsti | matchicalcom** [33:14 - 33:20]: Like yeah, or let me know I will ping you, but like as soon as you're done with the finalizing stuff.
**Konsti | matchicalcom** [33:20 - 33:28]: Like, go through this through the stuff that I am marked as bold here and then we can talk through this.
**Konsti | matchicalcom** [33:28 - 33:30]: Okay, perfect.
**Carlos | matchicalcom** [33:30 - 33:31]: Thank you, sounds good.
**Carlos | matchicalcom** [33:31 - 33:32]: Thank you.
**Carlos | matchicalcom** [33:33 - 33:33]: Talk to you later.
**Carlos | matchicalcom** [33:33 - 33:34]: See bye.
