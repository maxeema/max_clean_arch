part of 'fake_products_data_source.dart';

const _fakeErrors = [
  'Too much requests from your device.\nTry in a minute again.',
  'Products repository is temporary unavailable.\nTry again later.',
];

const _fakeProducts = '''{
  "products": [
    {
      "id": "6688657305654299118",
      "url": "https://www.google.com/shopping/product/6688657305654299118?q=amazon+products&hl=en&sxsrf=AOaemvJRcs4jVpaFSL8vXMivNji2fnByEA:1635029930752&biw=764&bih=384&dpr=2&prds=eto:6027270607561377971_0&sa=X&ved=0ahUKEwi-ityS0eHzAhW2FbkGHTtMD6cQ8gII7gcoAA",
      "name": "Amazon Echo Dot (4th Gen) Smart Speaker with Clock and Alexa - Glacier White",
      "description": "Control the house with your voice with the Amazon Echo Dot. The Echo Dot offers access to a variety of apps, including Amazon Music, Spotify and Pandora, while the Alexa-enabled skills lets you use your voice to check the weather, ask questions and even add items to your shopping cart. Featuring crisp sound and balanced bass, the Echo Dot fills each room it's placed in with full sound. Compact design delivers crisp sound and balanced bass for a full sound. Includes functions like checking the weather, adding items to your shopping cart, asking questions and more. Manage compatible smart home devices using your voice, like lamps, door locks and thermostats. Alexa voice-enabled skills offer convenient control over your device through voice commands. Parental controls help kids stay safe when using the device.",
      "pre_image": "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcThJZUjwBtUgb2YEI7XtG7wkHD1QS52TRr21mdLEnjgK15ZjHBUhodKG4o127nAYObROPCBuQsPxDpONLOERofNiYOIzZgI9VtYPFdEwWhv3ubosW-4UQAPLQ&usqp=CAY",
      "big_image": "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTBH-K6bZLdaJ_6nJY7TMvotnSYHLWR2POeEYA-gv8eJ1tCJgzJdXBQHIArII11rerDZG17HeCu6YMJemJvAyIeRtQK0fBuqgasU2o9RohZQmYO9n4TlrrsQA&usqp=CAY"
    },
    {
      "id": "3975899147789815771",
      "url": "https://www.google.com/shopping/product/3975899147789815771?q=amazon+products&hl=en&sxsrf=AOaemvJRcs4jVpaFSL8vXMivNji2fnByEA:1635029930752&biw=764&bih=384&dpr=2&prds=epd:18043637309539349606,oid:18043637309539349606&sa=X&ved=0ahUKEwiWv_mmgeLzAhWXHbkGHdBjC20QrhII1AE",
      "name": "Soundcore Flare Mini Bluetooth Speaker, Outdoor Bluetooth Speaker, Ipx7 Waterproof for Outdoor Parties, LED Light Show with",
      "description": "Intense 360° sound drops from back-to-back neodymium drivers for stunning sound in every direction - all powered by BassUp technology, multi-band DRC, and dual passive radiators.",
      "pre_image": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR5KEQA_2S0LDKbw5qCvPfJmoG43lFtbcD1PIo0NLn3i92_Ghx8Ka_fgXgkFNhbabtV9ewPaB-TLtemHMxkBvGUGErTvBo6qRinAOi8D4Ln9BQ7PKzN3oQr&usqp=CAY",
      "big_image": "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcS4okKnFkJpfrPeVwER4ikc7_7Q25lNxV83hw9Rpv4zmKcQYockR2cGl-4Z6evBysiG0iFUw8gzy1JwfjTcc3FtjnQF5gZCvA-hvM4S1TNhEcSCkLJnanzE2g&usqp=CAY"
    },
    {
    "id": "7171501309595304426",
    "url": "https://www.google.com/shopping/product/7171501309595304426?q=amazon+products&hl=en&sxsrf=AOaemvJRcs4jVpaFSL8vXMivNji2fnByEA:1635029930752&biw=764&bih=384&dpr=2&prds=epd:2605017940397142129,oid:2605017940397142129&sa=X&ved=0ahUKEwjn8vqi0eHzAhXxGLkGHRqSD-kQrhII1AE",
      "name": "Apple HomePod - Space Gray",
      "description": "Purchased this product since they did the Dolby Atmos upgrade for Apple 4k TV. Setup as you expect with most things Apple is too easy. just plug in, bring your phone near the device and the rest is easy. These units are quite heavy 2.5kg, which is always a good indication that the sound they deliver will be what you expect from speakers of this size, and weight. I brought a pair and linked them to my Apple 4k TV, the sound is fully immersive, it doesn't feel like the sound is coming from these units, it's less directional and more surround sound. Bass is deep, subtle and precise without being overbearing. Top end where you have vocals is clear and crisp. I did need clarification from Apple support about the Atmos feature, as when playing back an Atmos movie, there was no indication on the TV that the feature was present. Apple confirmed that any media with Dolby Atmos, playback through the Homepods will be in Dolby Atmos. Overall I've been fully impressed with the sound quality of these units, haven't used the smart features as much, but it's not the reason I purchased them. Would I recommend, yes, even if you don't have Apple 4k TV, and just want to use them to playback music. Homepods are more than capable of deliver a sweet sound",
      "pre_image": "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ7e_aJhABohBgxNMvbtfn7UAzcHhdp2HUQkA8zmtYDD6jC6dU2GWp7ZJ_P0whWa_93ZwPUtOKV9ptXLaVm4_8dwNQv1iXPcNJxSHndSb_GNrJsDOHFMSAy8A&usqp=CAY",
      "big_image": "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQLGYpyIsPw-Z3mTU_YYJ_FE83O7zbWIXXh2oxy7xWbBaywFZDdqaM4HJZ5WV_vaLV9V9JdebhMl1fcFzX3iYzu1BD6EMYoSXhAE2BglDu-EiYm97Q-RC_klg&usqp=CAY"
    },
    {
      "id": "7113009719540900353",
      "url": "https://www.google.com/shopping/product/7113009719540900353?q=amazon+products&hl=en&sxsrf=AOaemvJRcs4jVpaFSL8vXMivNji2fnByEA:1635029930752&biw=764&bih=384&dpr=2&prds=opd:17967584861316078257&sa=X&ved=0ahUKEwiDlNW_5-HzAhWOFbkGHbsgD7cQlIUHCDwoAA",
      "name": "Sony - LF-S50G Smart Speaker with Google Assistant Built-in - White",
      "description": "You speak, it listens. Your built-in Google Assistant takes commands and can control all of your smart devices. Tell it to play your favorite song, or ask it any question you can think of. With touch-free gesture control, you can skip a song with the wave of your hand. And with Sonys high quality, 360 speaker, youll hear the same great sound from anywhere in the room.",
      "pre_image": "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcToIiOuaIkN4wP4itCqOUTe3Tr02N4j_gBgIkUkId9Xje19X_g6EG70CKZPi0O9ir7CxJ1r_OVnI5CDiKe2QdsqfCJeIPObEJUqVA80yYxPeFnY_A9IC36vJg&usqp=CAY",
      "big_image": "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRo7x3uzoBCk35HnOuNokaH_Da2g8_e9FdNhfOHOZLL3UCsvth0Ldmqr29I2FtlbdPThfCJZmqsFUmreRv5kqZGOiwI6-DJLUtYPdHaxb34Y4QTQ2GNX0v65g&usqp=CAY"
    },
    {
      "id": "4471330787886745727",
      "url": "https://www.google.com/shopping/product/4471330787886745727?q=amazon+products&hl=en&sxsrf=AOaemvJRcs4jVpaFSL8vXMivNji2fnByEA:1635029930752&biw=764&bih=384&dpr=2&prds=epd:6743952337893890200,oid:6743952337893890200&sa=X&ved=0ahUKEwihpOuPg-LzAhXDH7kGHZGDCBoQrhIIkgE",
      "name": "Anker Soundcore Motion Q 360 Portable Bluetooth Speaker - Black",
      "description": "All Around Sound: Two full-range drivers and dual passive radiators produce 16W of full-bodied 360° sound. IPX7 Rated Protection: The waterproof casing stops anything from reaching the internal components, preventing damage even when fully submerged. Wireless Stereo Pairing: Pair two Motion Q together for huge stereo sound*. Hang, Hook, Hold: Conveniently carry or easily attach Motion Q to your bag when you're out and about. 10-Hour Playtime: Listen for longer thanks to a premium Li-ion battery. Soundcore Motion Q The Outdoor Bluetooth Speaker with 360° Sound and Full Waterproof Protection. 360° Music Two full-range drivers located at the front and back are paired with two passive radiators on both sides to produce full-bodied 360° sound. Revel in your music, wherever you're standing. Optimized Bass Engineered with exclusive BassUp technology to ensure each hit of bass sounds more intense, more refined and crystal-clear. Feel each spine-tingling pulse everytime the beat drops. Complete Protection Motion Q's internal components are fully protected by an IPX7 waterproof casing. This waterproof barrier can withstand full immersion in up to 1 meter of water for 30 minutes. Invisible Link Pair two Motion Q together via Wireless Stereo Pairing for a huge hit of stereo sound*. Experience pumped up volume at parties or enjoy an elevated at-home movie experience. Grab and Go Motion Q goes with the flow—pick it up, hang from your wrist, or hook it on your bag or bike. The durable build and practical wrist strap let you take your music anywhere for instant atmosphere. Listen for Longer Anker's superior power management system and an efficient Li-ion battery ensure you'll get up to 10 hours of playtime from a single charge. * Note: For optimal performance in Wireless Stereo Mode, position speakers within 16 ft (5 m) of each other indoors, or 48 ft (15 m) in open spaces.",
      "pre_image": "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSj-jGfaSPu5nrLKLZEdgQindCaMQA4j7DHY1k4GHom-WYRlUEfnP16lRxBAstgweqkypA5OdPzPPe2Q91H4tpNHcY0Y88LZyLyn2A1ylpFjGbDnhvQzGAp8Q&usqp=CAY",
      "big_image": "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSD9eIek6_HDi2SyBFOxoPhhoNwXFtNl2sAINjhYWUlDjaWpsHpnk7iYPkvGCwq31Ui0vM2erSzii_PN5PGJmKHmJQH1DBVJdATX3VDpXada1RseQ3ESoxvZ5d0&usqp=CAY"
    }
  ]
  }''';
