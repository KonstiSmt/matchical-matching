# Dev check in (Clone)

**Pedro | matchicalcom** [00:23 - 00:25]: Hello, hello, Lokosti.
**Pedro | matchicalcom** [00:25 - 00:31]: Good morning, good morning, everything fine?
**Pedro | matchicalcom** [00:32 - 00:39]: Yes, I'm feeling good and you all.
**Konsti | matchicalcom** [00:39 - 00:41]: Things I get a car currently.
**Konsti | matchicalcom** [00:42 - 00:44]: Okay, no worries.
**Konsti | matchicalcom** [00:45 - 00:46]: I'm feeling good.
**Konsti | matchicalcom** [00:46 - 00:47]: I'm feeling good.
**Konsti | matchicalcom** [00:47 - 00:48]: Definitely.
**Konsti | matchicalcom** [00:48 - 00:51]: Like I was really productive, Really this.
**Pedro | matchicalcom** [00:51 - 00:54]: Morning, this morning, this morning.
**Pedro | matchicalcom** [00:56 - 01:02]: Prior days not so much in the prior, prior days not so much in.
**Konsti | matchicalcom** [01:02 - 01:03]: Terms of prediction kind of.
**Konsti | matchicalcom** [01:03 - 01:09]: But like different like this morning I had other than the other days.
**Konsti | matchicalcom** [01:09 - 01:12]: Like a really focused, like death session.
**Konsti | matchicalcom** [01:15 - 01:23]: I'm currently working like the quill editor with the multi language support and multiple descriptions.
**Konsti | matchicalcom** [01:24 - 01:25]: There are things going on.
**Pedro | matchicalcom** [01:25 - 01:31]: That's like basically multiple descriptions on the quill where.
**Konsti | matchicalcom** [01:33 - 01:34]: I can show you in a second.
**Konsti | matchicalcom** [01:36 - 01:39]: You are using the normal Quill editor, right?
**Pedro | matchicalcom** [01:39 - 01:42]: Yeah, with language support, yeah.
**Konsti | matchicalcom** [01:42 - 01:57]: There are other kinds of quill editors like this one here, where you don't just have, like the multi language support, but you also have different forms of descriptions and see now this one is broken.
**Konsti | matchicalcom** [01:57 - 02:00]: I know luckily.
**Pedro | matchicalcom** [02:04 - 02:08]: So the regular is the text mode that we are.
**Pedro | matchicalcom** [02:08 - 02:15]: Using currently and bullets meaning that when you write, you write always with bullets.
**Pedro | matchicalcom** [02:16 - 02:17]: What are the options?
**Pedro | matchicalcom** [02:18 - 02:18]: There.
**Konsti | matchicalcom** [02:20 - 02:33]: Is everywhere broken, Interestingly, Atlantic everywhere.
**Pedro | matchicalcom** [02:39 - 02:44]: That is a new Quill editor, or you are just using the current one.
**Konsti | matchicalcom** [02:45 - 02:47]: That that's a different implementation.
**Konsti | matchicalcom** [02:47 - 02:48]: Okay, here it works.
**Konsti | matchicalcom** [02:48 - 02:53]: Okay, maybe I deleted these descriptions by accident.
**Konsti | matchicalcom** [02:53 - 02:54]: Let me check.
**Konsti | matchicalcom** [03:08 - 03:09]: That's kind of weird.
**Konsti | matchicalcom** [03:11 - 03:16]: That's really weird, honestly speaking, that's a little bit concerning, really?
**Konsti | matchicalcom** [03:23 - 03:25]: Hey, sorry, don't worry.
**Konsti | matchicalcom** [03:26 - 03:32]: Just trying to understand might mess up something.
**Konsti | matchicalcom** [03:32 - 03:33]: Let's see in a second.
**Konsti | matchicalcom** [03:34 - 03:40]: So if here within a consultant the engagement.
**Pedro | matchicalcom** [03:45 - 03:46]: Of bones.
**Konsti | matchicalcom** [03:48 - 03:49]: This is really.
**Pedro | matchicalcom** [03:50 - 03:54]: You have something like find or index of a list?
**Pedro | matchicalcom** [03:54 - 03:58]: Maybe it's trying to find something that is not there.
**Pedro | matchicalcom** [03:58 - 03:59]: I don't know.
**Pedro | matchicalcom** [04:01 - 04:02]: We have to look at the.
**Konsti | matchicalcom** [04:04 - 04:18]: Component is a little bit complex, because you have multiple kind of different languages and also the description formats like the bullet version, the plain text version, the mix.
**Pedro | matchicalcom** [04:18 - 04:21]: Version, but for the same content, right?
**Pedro | matchicalcom** [04:22 - 04:32]: If i write, if you select above all those three modes, it changes the text on that based on that selection, right?
**Konsti | matchicalcom** [04:32 - 04:37]: Yes, So the idea is because I want to have different formats.
**Konsti | matchicalcom** [04:37 - 04:43]: Basically it looks like in the dev.
**Pedro | matchicalcom** [04:43 - 04:56]: Stage, but you came up with this solution, because it's important for the customers to have that type of flexibility to.
**Konsti | matchicalcom** [04:56 - 05:02]: Write Tommy's in my idea that they just don't want one kind of format they want.
**Konsti | matchicalcom** [05:02 - 05:04]: There are different kind of formats that are needed.
**Konsti | matchicalcom** [05:06 - 05:17]: That's like kind of a business requirement, because like from I need to debug this afterwards from.
**Pedro | matchicalcom** [05:19 - 05:28]: Very very, but index out of bound usually is if you use that index, yeah, but the data is just gone.
**Konsti | matchicalcom** [05:28 - 05:29]: The issue is that the data.
**Pedro | matchicalcom** [05:33 - 05:36]: Maybe deleted something on test or something like.
**Konsti | matchicalcom** [05:36 - 05:38]: That, like because what is the use case of it?
**Konsti | matchicalcom** [05:38 - 05:40]: Basically imagine we are extracting a CV.
**Konsti | matchicalcom** [05:41 - 05:48]: I can even show you following use case if for example.
**Konsti | matchicalcom** [05:48 - 05:57]: A CV gets extracted, that's what is the original stuff that stated in the CV, this one we are extracting like in the way it was written in the CV.
**Konsti | matchicalcom** [05:57 - 06:02]: So team size five developers so kind of the verbatim version.
**Konsti | matchicalcom** [06:03 - 06:10]: Okay, and then we generate one plain text version out of it and one bullet version out of it.
**Konsti | matchicalcom** [06:12 - 06:14]: Considering the case you want different versions.
**Pedro | matchicalcom** [06:15 - 06:21]: Okay, okay, but on the back end, where does it do this analysis?
**Pedro | matchicalcom** [06:21 - 06:30]: Because you are grabbing a whole text, written text or text from a document and this conversion is based on AI.
**Konsti | matchicalcom** [06:30 - 06:34]: Or yeah, it's AI based basically.
**Konsti | matchicalcom** [06:35 - 06:43]: That's what we, what we receive from the CV and then, okay, let's create a convert version, a clean bullet text version.
**Pedro | matchicalcom** [06:43 - 06:47]: Okay, okay, very nice.
**Konsti | matchicalcom** [06:49 - 06:51]: Yeah, for example, very nice.
**Konsti | matchicalcom** [06:51 - 06:55]: Especially like the next evolution step of this one.
**Konsti | matchicalcom** [06:55 - 07:14]: Will be something like that where okay, you have your bullet version, your paragraph version, your mix version and maybe the original dump where you dump everything in and now when you go in the CV export, because in the CV export as a consultancy as a user, I need more flexibility.
**Konsti | matchicalcom** [07:14 - 07:26]: Sometimes I want a very long version, sometimes I want a shorter version, sometimes I want it to be written in first person, I as a developer did sometimes third person, the consultant and so on so different sides.
**Konsti | matchicalcom** [07:26 - 07:36]: So the idea is that when the user is in the front end and is going to the CV export, he has another extra option that is basically OK.
**Konsti | matchicalcom** [07:36 - 07:36]: Give me.
**Konsti | matchicalcom** [07:36 - 07:43]: The default bullet paragraph or mix version or optimize me.
**Konsti | matchicalcom** [07:43 - 07:55]: My custom version and then he can say I want to take the default but make it way shorter so he can just set the triggers here.
**Konsti | matchicalcom** [07:55 - 07:58]: I want more quick tone or like bold.
**Konsti | matchicalcom** [07:59 - 08:13]: I want it to be in paragraph, it should be third person and it should be more like tech focused and like write all in caps for example.
**Konsti | matchicalcom** [08:13 - 08:22]: So and then you click on apply and then the AI runs and is converting your text that you're needing very.
**Pedro | matchicalcom** [08:22 - 08:32]: Dense, but it's giving great flexibility in terms of content exports.
**Konsti | matchicalcom** [08:33 - 08:38]: We will need a better design for this obviously like Lino hasn't seen this yet?
**Konsti | matchicalcom** [08:38 - 08:40]: But the idea is really to have.
**Konsti | matchicalcom** [08:40 - 09:00]: Like the idea is that on the one hand the consultancy has per default, like for example those three different versions, that they can maintain, if they say, I don't trust any AI text updates, they maintain themselves and can update these and say, OK, these are my approval.
**Konsti | matchicalcom** [09:00 - 09:03]: But when they want to go to the CV export and they need.
**Konsti | matchicalcom** [09:03 - 09:21]: Their great flexibility, because for example now I want to export this Engagement into a PowerPoint Slide, therefore it needs to be very short, then we provide them the full flexibility by that wizard, basically the best of both worlds.
**Konsti | matchicalcom** [09:21 - 09:22]: At least that's the.
**Pedro | matchicalcom** [09:24 - 09:28]: Attempt so to support this in terms of database.
**Pedro | matchicalcom** [09:28 - 09:29]: You have now.
**Pedro | matchicalcom** [09:29 - 09:32]: A description dictionary.
**Pedro | matchicalcom** [09:32 - 09:33]: Something like that.
**Pedro | matchicalcom** [09:33 - 09:33]: Right?
**Pedro | matchicalcom** [09:33 - 09:40]: Or something so you can have these modes right?
**Konsti | matchicalcom** [09:40 - 09:47]: Okay, yes, yes, it's a similar setup as the as the local key local dict setup.
**Konsti | matchicalcom** [09:47 - 09:54]: So instead of the text value we store the local key and the local key is referencing to multiple local dicts here.
**Konsti | matchicalcom** [09:54 - 09:55]: It's the same.
**Konsti | matchicalcom** [09:55 - 10:22]: Instead of storing the description with just one language, instead of storing the description local key, we store the description key ID kind of and the description key or I think description dict is called this one is referenced to a description dict entry list with multiple description local keys in different categories modes.
**Pedro | matchicalcom** [10:22 - 10:24]: Yeah, yeah, the categories right, right, right.
**Pedro | matchicalcom** [10:24 - 10:25]: Okay, okay.
**Konsti | matchicalcom** [10:26 - 10:28]: And these all have their own local key.
**Konsti | matchicalcom** [10:28 - 10:31]: And these ones have multi language stuff.
**Pedro | matchicalcom** [10:31 - 10:39]: Okay, so think you almost done right, just facing those bugs in terms of the implementation.
**Konsti | matchicalcom** [10:40 - 10:44]: But this one bug is weird because it's actually not a bucket just the data is not present.
**Konsti | matchicalcom** [10:44 - 10:47]: No, it is no, the data is present on the prod.
**Konsti | matchicalcom** [10:47 - 10:57]: So for some reason, maybe it was me, but maybe it was someone else dropped the plain text version.
**Konsti | matchicalcom** [10:57 - 10:58]: It's basically gone.
**Konsti | matchicalcom** [11:03 - 11:04]: That's really weird.
**Pedro | matchicalcom** [11:05 - 11:20]: It shouldn't happen, but other components, but yeah, but our component would handle missing information, so maybe we have to protect that as well, something like that, keeping a warning.
**Konsti | matchicalcom** [11:21 - 11:23]: Also I just see it's just on old.
**Konsti | matchicalcom** [11:25 - 11:26]: Oh, that's very interesting.
**Konsti | matchicalcom** [11:26 - 11:33]: Look at this here it's working in the death state.
**Konsti | matchicalcom** [11:37 - 11:47]: So it's working for Stefan Fischer, But it's not working for.
**Konsti | matchicalcom** [11:52 - 11:54]: Uh, oh, I have an idea.
**Konsti | matchicalcom** [11:55 - 11:56]: Ah, that's stupid.
**Konsti | matchicalcom** [11:58 - 11:59]: Well, that was a bummer.
**Konsti | matchicalcom** [12:00 - 12:09]: I think I probably like recently I adjusted that prompt of the CV engagement descriptions.
**Konsti | matchicalcom** [12:11 - 12:23]: Fortunately, we have now the output screen is bullet version, mixed version, text version, and if I go back.
**Konsti | matchicalcom** [12:27 - 12:35]: To this one, we had original version, bullet version, paragraph version.
**Konsti | matchicalcom** [12:35 - 12:36]: Damn it.
**Konsti | matchicalcom** [12:37 - 12:42]: OK I changed the name broken.
**Pedro | matchicalcom** [12:46 - 12:47]: Okay.
**Konsti | matchicalcom** [12:48 - 12:53]: You found it, yeah, yeah, like okay, cool, all right.
**Konsti | matchicalcom** [12:53 - 13:10]: So Pedro following like I don't know I wanted to talk with you a little bit about the idea why we created these sessions was like that we can exchange more and I can help you out when you have, when you, when you have issues, right?
**Pedro | matchicalcom** [13:12 - 13:16]: But yeah, no, no, continue, please continue.
**Konsti | matchicalcom** [13:16 - 13:40]: What I kind of realize is that I think it's the wrong approach because it more feels like kind of forced sessions sometimes you know this one I'm going to ask constantly the next session, but this means as soon as you have the question you start waiting until our next session, so you're kind of on wait, yeah and sometimes or more than like okay, there's nothing we need to talk about and then we do just blah blah, right?
**Konsti | matchicalcom** [13:40 - 13:42]: And I'm I'm also a little bit.
**Pedro | matchicalcom** [13:45 - 14:07]: I think we can change this instead of just having like a mandatory meeting, since we don't have a lot of time just talking about the project itself, like not specific things, but knowing better the application not doing that, because we don't have a lot of time to have that.
**Pedro | matchicalcom** [14:08 - 14:25]: Maybe you should rethink these meetings, because when I have a question didn't happen a lot, but when I have some doubts I just ask you or tell me about it I'm not waiting until meetings, okay?
**Pedro | matchicalcom** [14:25 - 14:37]: And sometimes what I'm talking with you about this in these meetings is what I'm doing what I'm planning to do showing you what was done.
**Pedro | matchicalcom** [14:37 - 14:55]: So you can just chime in because last time you helped me with one stuff that I was not seeing what was the local the autism using autism, yeah, localization.
**Pedro | matchicalcom** [14:55 - 15:12]: So I use that, so I just redo that part, but namely is this so I don't know what you think about this I would prefer if I have some questions I just called you.
**Konsti | matchicalcom** [15:12 - 15:31]: Yeah, let's more do it like this we kind of answer these kind of fixed sessions and try to commit ourselves that we check in at least every second day just to like that you can give me maybe a quick heads up for like because what we talked about yesterday.
**Konsti | matchicalcom** [15:31 - 15:41]: It's really not about a control, but it's definitely helpful for me to see what's going on, because I have the most context about the code base currently and as.
**Konsti | matchicalcom** [15:41 - 15:45]: Long as this this is the case like it helps when I see from time to time are you doing that?
**Konsti | matchicalcom** [15:45 - 15:50]: Like this is this because sometimes we have conventions that no one talked about ever.
**Pedro | matchicalcom** [15:50 - 15:51]: Yeah, right?
**Konsti | matchicalcom** [15:52 - 15:55]: It's not conventions, it's constiventions right.
**Pedro | matchicalcom** [15:58 - 15:59]: You're right, you're right, you're right.
**Konsti | matchicalcom** [16:01 - 16:03]: Sometimes it's just constant inventions.
**Pedro | matchicalcom** [16:05 - 16:10]: And sometimes we have to fix them those inventions, right?
**Pedro | matchicalcom** [16:11 - 16:12]: Just create a new one.
**Pedro | matchicalcom** [16:14 - 16:33]: Yeah, I agree with you, so we can make it work like that, as you refer from time to time, just a couple of days, two days in the second day for example, and I can talk with you about what we are implementing and regarding that.
**Pedro | matchicalcom** [16:33 - 16:39]: Because I was talking about you about the developments that were just stable.
**Pedro | matchicalcom** [16:39 - 16:57]: But afterwards talking with Tommy, he requested, requested something in terms of information notice that was tackled throughout the day yesterday and just in terms of database was just adding more, a little more information on the consultancy user for internal.
**Pedro | matchicalcom** [16:57 - 17:09]: Ones regarding information notice to keep track of the information that can be accepted or decline the response dates the status.
**Pedro | matchicalcom** [17:10 - 17:32]: So now we have that on the data model in the consultancy user, the fields are info notice, so it's easy to identify them in the model and then on the UI was just adapting what we already have had on that part and it's supplemented.
**Pedro | matchicalcom** [17:32 - 17:38]: So now I will talk with Tommy about it, showing him what was done.
**Pedro | matchicalcom** [17:39 - 17:46]: So we can just give feedback and see if that implementation is completed or not.
**Pedro | matchicalcom** [17:48 - 18:05]: But minor things in terms of backend, I don't have concerns about it or doubts, because just new fields on the consultancy user and also on consultancy external.
**Pedro | matchicalcom** [18:05 - 18:11]: Because now we have options I can show you for you to just you'll see it.
**Pedro | matchicalcom** [18:16 - 18:17]: On the consultancy.
**Pedro | matchicalcom** [18:17 - 18:22]: Now we have one internal, we have this part these options.
**Pedro | matchicalcom** [18:23 - 18:43]: So if the, if the consultancy approves a new information notice templates, if the second one is selected, only the ones that didn't respond to any information notice, we will have the pop up.
**Pedro | matchicalcom** [18:43 - 18:56]: So all the other ones that already responded to a previous version of the information notice will not have the pop up, so they will not have to accept.
**Konsti | matchicalcom** [18:56 - 18:58]: So in case there's a new template or what?
**Pedro | matchicalcom** [18:59 - 18:59]: Right?
**Pedro | matchicalcom** [19:00 - 19:12]: If you have a new template, all the consultants that already accepted a previous version will not have the pop up to accept or.
**Pedro | matchicalcom** [19:12 - 19:13]: Decline.
**Pedro | matchicalcom** [19:13 - 19:16]: So just only for the new ones.
**Pedro | matchicalcom** [19:16 - 19:19]: And this part is just for AI processing.
**Pedro | matchicalcom** [19:19 - 19:24]: So this is saying, because now.
**Konsti | matchicalcom** [19:26 - 19:30]: I know the logic behind it, you have a flag.
**Pedro | matchicalcom** [19:30 - 19:46]: A user can select the flag, but if for the users that didn't accept it yet the consent, the consultancy can now say by default for the ones that didn't respond to the information notice.
**Pedro | matchicalcom** [19:47 - 19:53]: We will not, if this is selected, we will not use AI processing or we will use I processing.
**Pedro | matchicalcom** [19:55 - 19:56]: That's it.
**Pedro | matchicalcom** [19:56 - 20:01]: And for information we'll have it implemented as well.
**Pedro | matchicalcom** [20:02 - 20:17]: You have also like the external ones that they have on the right upright the information, the shield of the data privacy also have the data privacy for internals you cannot see here because it's not submitted.
**Pedro | matchicalcom** [20:17 - 20:19]: I clean up for testing purpose.
**Pedro | matchicalcom** [20:20 - 20:25]: I don't know if I can, no I think for him, yeah.
**Pedro | matchicalcom** [20:25 - 20:28]: But if I can log out, log in.
**Pedro | matchicalcom** [20:33 - 20:46]: And you can see, okay, show them the notice Now you have the selection decline or proceed as I proceed, go to the partner consult internal.
**Pedro | matchicalcom** [20:49 - 20:53]: You can see it's accepted, It can open and see the detail.
**Pedro | matchicalcom** [20:53 - 20:56]: Okay, it's accepted the current version that is accepted.
**Pedro | matchicalcom** [20:57 - 21:08]: If I create a new one, you'll show here a current one, but the accepted one is the VISA six, but you'll show you that you have a new one to accept if you want.
**Pedro | matchicalcom** [21:09 - 21:18]: And the status of the disable and the last response that you can decline here or change the revoke, the revoke processing.
**Konsti | matchicalcom** [21:19 - 21:21]: But only if it's you right.
**Pedro | matchicalcom** [21:25 - 21:27]: Maybe I have to share.
**Konsti | matchicalcom** [21:29 - 21:30]: The only thing is.
**Konsti | matchicalcom** [21:31 - 21:32]: Multiple labels are like.
**Konsti | matchicalcom** [21:33 - 21:41]: We need to probably present them a little bit different in terms of wording and so on to make them more explanatory, but that's not focus on not worry about it.
**Konsti | matchicalcom** [21:42 - 21:43]: What is he like when I decline?
**Konsti | matchicalcom** [21:44 - 21:46]: Decline what is the issue?
**Konsti | matchicalcom** [21:46 - 21:54]: What is the difference between decline and revoke of AI processing?
**Pedro | matchicalcom** [21:54 - 22:06]: So that's yeah, yeah, in terms of business, yeah, in terms of business I have to check with Tommy, so he can deny fully consistent, yeah, yeah, he can deny it.
**Pedro | matchicalcom** [22:06 - 22:15]: If you deny it, you should, maybe should automatically change the revoke AI processing to true or.
**Pedro | matchicalcom** [22:15 - 22:15]: Not.
**Pedro | matchicalcom** [22:15 - 22:20]: I don't know or just if you deny it, I don't know.
**Pedro | matchicalcom** [22:21 - 22:30]: That is, I think the company makes sense of the consultancy Define what should behave in terms of OI processing.
**Pedro | matchicalcom** [22:30 - 22:33]: So that's why we have on the consultancy.
**Konsti | matchicalcom** [22:34 - 22:36]: Can you, can you go to log once more or.
**Konsti | matchicalcom** [22:36 - 22:36]: Like?
**Konsti | matchicalcom** [22:38 - 22:40]: Probably I need to, yeah, I need to check in there, definitely with some.
**Pedro | matchicalcom** [22:42 - 22:47]: That's why on consultancy you can define what is the default way.
**Pedro | matchicalcom** [22:47 - 23:00]: So for all the ones that don't have the accept didn't respond to any of the information notice or if they responded, they decline it.
**Pedro | matchicalcom** [23:00 - 23:10]: So if they decline, should use the default users of the AI processing that is defined on the consultancy level.
**Pedro | matchicalcom** [23:11 - 23:28]: That is defined here, if you again on the internal, so we can see that is declined, if it is declined, so this flag should be ignored.
**Pedro | matchicalcom** [23:29 - 23:35]: Okay, makes sense be ignored, because if it is declined, you shouldn't be using.
**Pedro | matchicalcom** [23:35 - 23:40]: This information should be using the consultancy default setting.
**Pedro | matchicalcom** [23:43 - 23:44]: That is my opinion.
**Konsti | matchicalcom** [23:46 - 23:52]: I got it, but I need to take in there, definitely in terms of business logic with tomming, because I also have some question marks here.
**Pedro | matchicalcom** [23:53 - 23:56]: Yeah, and this should be used on on the AI processing.
**Pedro | matchicalcom** [23:56 - 24:05]: So when this user is somehow being handled, the data should be clean up.
**Pedro | matchicalcom** [24:05 - 24:05]: I don't know.
**Pedro | matchicalcom** [24:06 - 24:10]: If it selects revoke, what should happen?
**Pedro | matchicalcom** [24:10 - 24:17]: Trigger an event to clean up all AI generated content from these.
**Pedro | matchicalcom** [24:17 - 24:18]: Users.
**Pedro | matchicalcom** [24:18 - 24:21]: I don't know that is there is.
**Konsti | matchicalcom** [24:21 - 24:23]: There you just revoke against future processing.
**Pedro | matchicalcom** [24:25 - 24:26]: That is our opinion, right?
**Pedro | matchicalcom** [24:26 - 24:27]: I don't know.
**Pedro | matchicalcom** [24:27 - 24:36]: Tommy, I think was saying that he wanted to delete data, so for that we should be very clear about it.
**Pedro | matchicalcom** [24:36 - 24:38]: What data should be deleted.
**Pedro | matchicalcom** [24:39 - 24:46]: If any, like you are saying that this shouldn't be deleted anything just future processing.
**Konsti | matchicalcom** [24:47 - 24:49]: Yeah, and also like this is.
**Pedro | matchicalcom** [24:52 - 25:01]: Yeah, but I will talk with them, I think in a couple one hour or so I can bring that up that discussion.
**Pedro | matchicalcom** [25:01 - 25:04]: I think we'll discuss with you about this.
**Konsti | matchicalcom** [25:05 - 25:13]: Maybe we should meet all three together, or maybe first me and Tommy that, because I have the feeling, the requirements aren't fully clear yet right?
**Pedro | matchicalcom** [25:14 - 25:22]: Yeah, the flag is there and that can be changed or ever he's not doing anything.
**Pedro | matchicalcom** [25:22 - 25:24]: So it's just a flag.
**Pedro | matchicalcom** [25:24 - 25:34]: It doesn't have any consequence in terms of changing data on the application.
**Pedro | matchicalcom** [25:35 - 25:40]: But yes, there should be clear rules about this.
**Pedro | matchicalcom** [25:41 - 25:54]: But I want to show, Tommy is currently implemented like I show you now and maybe afterwards we can talk all three easy about this.
**Pedro | matchicalcom** [25:54 - 25:55]: Flag.
**Konsti | matchicalcom** [25:55 - 25:56]: Cool, cool.
**Pedro | matchicalcom** [25:56 - 25:57]: All right.
**Konsti | matchicalcom** [25:57 - 25:58]: Pedro, Thank you very much.
**Konsti | matchicalcom** [26:00 - 26:02]: Thank you very much for the explanation.
**Konsti | matchicalcom** [26:03 - 26:07]: I will definitely also follow up on this one and let's let's in this case to the following.
**Konsti | matchicalcom** [26:07 - 26:09]: I will talk about, I will tell.
**Konsti | matchicalcom** [26:09 - 26:13]: I will talk with Carlos about the same that we more like.
**Konsti | matchicalcom** [26:13 - 26:15]: Really we should check that.
**Konsti | matchicalcom** [26:15 - 26:25]: We check in at least every second day and like whenever there is something really just ping me or if you, if you're approaching a new thing, a new logic or whatever.
**Konsti | matchicalcom** [26:25 - 26:30]: Like I think it always makes sense to like more like spontaneously exchange.
**Pedro | matchicalcom** [26:32 - 26:38]: Of course I'll do, you'll change the schedule of the meetings.
**Konsti | matchicalcom** [26:38 - 26:42]: Yeah, I will just cancel these as we won't have a fixed schedule anymore.
**Pedro | matchicalcom** [26:42 - 26:44]: Okay, all right.
**Konsti | matchicalcom** [26:45 - 26:45]: Thank you much.
**Pedro | matchicalcom** [26:46 - 26:46]: Thank you.
**Konsti | matchicalcom** [26:46 - 26:48]: Good bye, See you, bye bye.
**Pedro | matchicalcom** [26:48 - 26:49]: See you, bye.
**Konsti | matchicalcom** [26:49 - 26:50]: All good other than that.
