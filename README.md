My friend become sad because there is no offline version of recently released Scratch 3. So, here is recipe
how he (and you!) can run Scratch 3 on your own Linux computer.

# How to build Scratch 3 Docker image

[Install Docker][https://docs.docker.com/install/linux/docker-ce/ubuntu/], clone this repository and run:

    $ ./build.sh

You should see something like this:

    Cloning into 'scratch-gui'...
    remote: Enumerating objects: 47, done.
    remote: Counting objects: 100% (47/47), done.
    remote: Compressing objects: 100% (34/34), done.
    remote: Total 43114 (delta 28), reused 23 (delta 13), pack-reused 43067
    Receiving objects: 100% (43114/43114), 704.11 MiB | 1.31 MiB/s, done.
    Resolving deltas: 100% (30857/30857), done.
    Sending build context to Docker daemon  22.18MB
    Step 1/7 : FROM node:latest
     ---> 8672b25e842c
    Step 2/7 : EXPOSE 8601
     ---> Running in 8272ba65fa4c
    Removing intermediate container 8272ba65fa4c
     ---> cc734922989f
    Step 3/7 : RUN mkdir /app
     ---> Running in af7547454ba5
    Removing intermediate container af7547454ba5
     ---> 4945d43152b2
    Step 4/7 : COPY ./scratch-gui /app/scratch-gui
     ---> 28efe12f5243
    Step 5/7 : RUN cd /app/scratch-gui &&     npm install
     ---> Running in d7dcbcbd043a
    npm WARN deprecated text-encoding@0.7.0: no longer maintained
    npm WARN deprecated react-dom@16.2.0: This version of react-dom/server contains a minor vulnerability. Please update react-dom to 16.2.1 or 16.4.2+. Learn more: https://fb.me/cve-2018-6341
    npm WARN deprecated text-encoding@0.6.4: no longer maintained
    npm WARN deprecated circular-json@0.3.3: CircularJSON is in maintenance only, flatted is its successor.

    > chromedriver@2.44.1 install /app/scratch-gui/node_modules/chromedriver
    > node install.js

    Current existing ChromeDriver binary is unavailable, proceding with download and extraction.
    Downloading from file:  https://chromedriver.storage.googleapis.com/2.44/chromedriver_linux64.zip
    Saving to file: /app/scratch-gui/node_modules/chromedriver/chromedriver/chromedriver_linux64.zip
    Received 782K...
    Received 1566K...
    Received 2350K...
    Received 3134K...
    Received 3918K...
    Received 4702K...
    Received 5210K total.
    Extracting zip contents
    Copying to target path /app/scratch-gui/node_modules/chromedriver/lib/chromedriver
    Fixing file permissions
    Done. ChromeDriver binary available at /app/scratch-gui/node_modules/chromedriver/lib/chromedriver/chromedriver

    > webpack-cli@3.2.1 postinstall /app/scratch-gui/node_modules/webpack-cli
    > lightercollective


         *** Thank you for using webpack-cli! ***

    Please consider donating to our open collective
         to help us maintain this package.

      https://opencollective.com/webpack/donate

                        ***

    npm notice created a lockfile as package-lock.json. You should commit this file.
    npm WARN eslint-config-scratch@5.0.0 requires a peer of babel-eslint@^8.0.1 but none is installed. You must install peer dependencies yourself.
    npm WARN eslint-config-scratch@5.0.0 requires a peer of eslint@^4.0 but none is installed. You must install peer dependencies yourself.
    npm WARN scratch-paint@0.2.0-prerelease.20181220194927 requires a peer of react-intl-redux@^0.7 but none is installed. You must install peer dependencies yourself.
    npm WARN scratch-paint@0.2.0-prerelease.20181220194927 requires a peer of react-responsive@^4 but none is installed. You must install peer dependencies yourself.
    npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.4 (node_modules/fsevents):
    npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.2.4: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

    added 1463 packages from 1115 contributors and audited 31334 packages in 183.102s
    found 2 vulnerabilities (1 low, 1 critical)
      run `npm audit fix` to fix them, or `npm audit` for details
    Removing intermediate container d7dcbcbd043a
     ---> 51ba043ff1b3
    Step 6/7 : WORKDIR /app/scratch-gui
     ---> Running in 55375db07d5b
    Removing intermediate container 55375db07d5b
     ---> 2aa9e9ae68a6
    Step 7/7 : ENTRYPOINT ["npm", "start"]
     ---> Running in d99be3c7e225
    Removing intermediate container d99be3c7e225
     ---> b5122d3839bb
    Successfully built b5122d3839bb
    Successfully tagged scratch:latest

After ~15 minutes you will get:

* full `scratch-gui` git repository cloned on your computer
* `scratch:latest` Docker image ready to serve Scratch 3 GUI for you


# How to run Scratch 3 Docker container

Stay in same directory and run:

    $ ./run.sh

You should see something like:

    > scratch-gui@0.1.0 start /app/scratch-gui
    > webpack-dev-server

    ℹ ｢wds｣: Project is running at http://0.0.0.0:8601/
    ℹ ｢wds｣: webpack output is served from /
    ℹ ｢wds｣: Content not from webpack is served from /app/scratch-gui/build
    ℹ ｢wdm｣: wait until bundle finished: /

Put mentioned URL `http://0.0.0.0:8601/` to your browser and wait few minutes. First cold start take some time,
but once you notice following lines in terminal, your Scratch 3 container is ready and you can use it in your
browser:

    (node:17) DeprecationWarning: Tapable.apply is deprecated. Call apply on the plugin directly instead
    ⚠ ｢wdm｣: Hash: 83e7891ce9108a9fcb5f
    Version: webpack 4.28.3
    Child
        Hash: 83e7891ce9108a9fcb5f
        Time: 50035ms
        Built at: 01/07/2019 8:12:22 PM
                                                                      Asset        Size                Chunks             Chunk Names
                                                           blocks-only.html   449 bytes                        [emitted]
                                                              blocksonly.js    6.18 KiB            blocksonly  [emitted]  blocksonly
                                                          blocksonly.js.map    3.39 KiB            blocksonly  [emitted]  blocksonly
                                                 compatibility-testing.html   461 bytes                        [emitted]
                                                    compatibilitytesting.js     6.7 KiB  compatibilitytesting  [emitted]  compatibilitytesting
                                                compatibilitytesting.js.map    2.22 KiB  compatibilitytesting  [emitted]  compatibilitytesting
                                                        extension-worker.js    51.8 KiB                        [emitted]
                                                    extension-worker.js.map    42.4 KiB                        [emitted]
                                                                     gui.js    12.7 KiB                   gui  [emitted]  gui
                                                                 gui.js.map    7.44 KiB                   gui  [emitted]  gui
                                                                 index.html   421 bytes                        [emitted]
                                                                 lib.min.js    19.8 MiB               lib.min  [emitted]  lib.min
                                                             lib.min.js.map    18.8 MiB               lib.min  [emitted]  lib.min
                                                                player.html   440 bytes                        [emitted]
                                                                  player.js    8.51 KiB                player  [emitted]  player
                                                              player.js.map    4.52 KiB                player  [emitted]  player
                         static/assets/02d927ce93445be737c7ff43fb98b135.svg    1.94 KiB                        [emitted]
                         static/assets/03aed75f9a75aef179982d359433dea4.svg    2.41 KiB                        [emitted]
                         static/assets/03ef1b0818e7a1222012b7f61079e2dc.gif     207 KiB                        [emitted]
                         static/assets/0408e986e15e0f56aefc6e9719fa42e3.gif     282 KiB                        [emitted]
                         static/assets/04e10c82d2a75d397ca963c1a9f9e1e7.svg   606 bytes                        [emitted]
                         static/assets/0611d215fe34175ddbab01f4f48f3517.jpg     132 KiB                        [emitted]
                         static/assets/09469790f10bcd5ed51fe8f85f8bdc1e.svg   543 bytes                        [emitted]
                         static/assets/0960bb1c4cf12a924f2bc74325583fea.gif     212 KiB                        [emitted]
                         static/assets/0e838120838e2bea2f8b5dec332a5a68.png    2.98 KiB                        [emitted]
                         static/assets/0f98e06e39d9ea466d7dbeecee38677f.gif     303 KiB                        [emitted]
                         static/assets/0f9efe3bd6e80747dfa3aeb9e19997b5.svg    13.4 KiB                        [emitted]
                         static/assets/0fd9fd69a38ab79358df5a77b29702c8.svg    1.78 KiB                        [emitted]
                         static/assets/10811a978de201353d564df7ba1ddb58.svg   523 bytes                        [emitted]
                         static/assets/11142fccab3fabab617ec3f32cc6d3cc.gif     149 KiB                        [emitted]
                         static/assets/11fabbdd1bc0ff364d4c110e60db2287.gif    97.9 KiB                        [emitted]
                         static/assets/12e69a59db0f0c697eaaf1abbcad902f.svg   879 bytes                        [emitted]
                         static/assets/1319094a51748798730f01d1dc0972ac.svg    1.84 KiB                        [emitted]
                         static/assets/14120e6444ca2744dad272d8ca2a4646.svg   508 bytes                        [emitted]
                         static/assets/148e4f4cfc7a1a253eb52c50bbb635a0.svg    3.68 KiB                        [emitted]
                         static/assets/17f08403f12daff6297d46f3cd203acc.gif     308 KiB                        [emitted]
                         static/assets/1824f8a20462980dad8a315af06ac9e5.gif     123 KiB                        [emitted]
                         static/assets/18b504b8572a14661279856a13522f25.svg   604 bytes                        [emitted]
                         static/assets/199f58b4a80fa56c5d8e032d6da5e9c2.svg    3.29 KiB                        [emitted]
                         static/assets/1b03c7316fd577db0df2948594c0de38.gif     287 KiB                        [emitted]
                         static/assets/1bb0adb555e07593962e9fc28ec7566d.svg    2.33 KiB                        [emitted]
                         static/assets/1c6e5129e936855db5a1181a778a3b94.svg   870 bytes                        [emitted]
                         static/assets/1cb157de017b539c4f4e761d7847956e.gif     209 KiB                        [emitted]
                         static/assets/1dfe5425b42628b6f1df1f39e97a319f.svg    2.07 KiB                        [emitted]
                         static/assets/1e9652bec24bcaacf5285be19746a750.svg    5.09 KiB                        [emitted]
                         static/assets/1fa6345d57ffc67eccd9f44cf6a383dd.svg   480 bytes                        [emitted]
                         static/assets/1fd3942fa102af8c13222be2ccc52e36.svg    1.69 KiB                        [emitted]
                         static/assets/21739a7b303ece303b023791813412cb.svg   712 bytes                        [emitted]
                         static/assets/21988681fa28c8ce37982ca26463a6f5.svg    2.78 KiB                        [emitted]
                         static/assets/223e926c7036a87ef1b5f5d6e07ac7eb.jpg     102 KiB                        [emitted]
                         static/assets/2258ea6dfe9ad15440ca55aca291698d.svg    1.97 KiB                        [emitted]
                         static/assets/24a18c39cf49ac3797806a525e07cd7b.jpg     131 KiB                        [emitted]
                         static/assets/25497089eb1925a13ab0ce12d6df6a72.gif     354 KiB                        [emitted]
                         static/assets/257e3788c5fbfe56c151a97e97dc20d8.svg    1.53 KiB                        [emitted]
                         static/assets/26255153f92ea41df149a58d3c3fe2cf.svg    1.84 KiB                        [emitted]
                         static/assets/27f90bfa982840e56c3ad207561193fa.svg     1.3 KiB                        [emitted]
                         static/assets/2a70b21aaaed0619bdfcdec91db1ebe8.svg   534 bytes                        [emitted]
                         static/assets/2e0c4790f8f9cf28e3c346b9cef0fcb6.svg   471 bytes                        [emitted]
                         static/assets/2f9cda00a530ac237fc24063067377c3.svg    2.14 KiB                        [emitted]
                         static/assets/2fb4b430169c3f5148703e29bfde1ef4.gif     635 KiB                        [emitted]
                         static/assets/2fe969399d52e076d779f489ca815728.gif    63.3 KiB                        [emitted]
                         static/assets/301439e2e5ab88b658368ee525e6752b.svg    2.98 KiB                        [emitted]
                         static/assets/31446edc97ac1eb0c3d2af65c0d8432a.svg    1.87 KiB                        [emitted]
                         static/assets/31bc4953d6286b30920ef5a53878e875.jpg     120 KiB                        [emitted]
                         static/assets/31fc60412c9b904fb1e9f1d4d932a4e2.gif    76.3 KiB                        [emitted]
                         static/assets/3286e2838658ebdb82f62d062b14e951.svg    4.07 KiB                        [emitted]
                         static/assets/3336a4516746eca7bc4a8e981e51a981.svg   852 bytes                        [emitted]
                         static/assets/33592a76d0d0fdaa4a32b2ea41db5e16.svg    1.33 KiB                        [emitted]
                         static/assets/3547fa1f2678a483a19f46852f36b426.svg    1.47 KiB                        [emitted]
                         static/assets/35c6867250ec4f430624bc9e2e7072d7.svg    1.53 KiB                        [emitted]
                         static/assets/36fcc7dbca20720abcab01e49d4955f9.svg   586 bytes                        [emitted]
                         static/assets/3732270cfcc864cbbd939ae7213f1a5a.svg    2.07 KiB                        [emitted]
                         static/assets/374b815c6393f1c3585ddeec83c83f48.svg     1.9 KiB                        [emitted]
                         static/assets/376daa5444cadd88038ef6ff16bfd653.gif    65.1 KiB                        [emitted]
                         static/assets/385aa4b73a425883b4f9e91501a52299.svg    3.27 KiB                        [emitted]
                         static/assets/38a70367a21e2f1fb15aa59b7d367450.svg   898 bytes                        [emitted]
                         static/assets/38ac2210b486d930f72c951ad081e4c0.svg    2.47 KiB                        [emitted]
                         static/assets/3a2d63269c47aa8244b0d613cf50eb6c.svg   670 bytes                        [emitted]
                         static/assets/3aa6c6bac36d0bc86fbc48b99e86b7fa.svg    2.24 KiB                        [emitted]
                         static/assets/3cfc9b39a0d002246119d47f6756d77e.svg   537 bytes                        [emitted]
                         static/assets/3e83d9d800459175308f0b45b117af16.png    3.74 KiB                        [emitted]
                         static/assets/3eb63579853c3f4c5323a51dcf4104ac.svg    1.28 KiB                        [emitted]
                         static/assets/3f5201aea12f282cdb6edd2575fef169.jpg     117 KiB                        [emitted]
                         static/assets/410ccbdf0bbd12597c7152f64d44afca.jpg     124 KiB                        [emitted]
                         static/assets/41f52071ce371c8a792b03b0c1c4c4b0.jpg     132 KiB                        [emitted]
                         static/assets/42157e6edddc19588c3c2ff188703799.svg    1.32 KiB                        [emitted]
                         static/assets/422b48c2206d5240a6717c92496ba21a.svg    2.56 KiB                        [emitted]
                         static/assets/424371873bc8df88d6a305d8727157ab.svg    1.02 KiB                        [emitted]
                         static/assets/44e4859e354c81d66c73f741df2e5ec7.svg    3.27 KiB                        [emitted]
                         static/assets/45353905cf166ce2cb04d16a217a8d4e.gif     234 KiB                        [emitted]
                         static/assets/4823748f50030407329768f2674e49a9.gif    94.9 KiB                        [emitted]
                         static/assets/497f797eeffe5fa7e6a626abc0db08a1.svg    2.66 KiB                        [emitted]
                         static/assets/49977a0d3680d3a72955df57e5a15afb.svg   920 bytes                        [emitted]
                         static/assets/4a3e1c364658c715fe01969e00551112.gif     366 KiB                        [emitted]
                         static/assets/4b6100c9f591be6470cdfd4697de0b54.svg    1.99 KiB                        [emitted]
                         static/assets/4b6ca5259f1271d510f081867e746847.png    16.2 KiB                        [emitted]
                         static/assets/4c5b75c306a0bd0facfe31074e251c00.gif      77 KiB                        [emitted]
                         static/assets/4cfb617bd5ddb3963da6bdc2a814d06c.gif      86 KiB                        [emitted]
                         static/assets/4da38973d5ffd15c54e80894d430288c.svg    2.96 KiB                        [emitted]
                         static/assets/4ea7c61d2cbfd28b75d7e188f1815d80.gif     440 KiB                        [emitted]
                         static/assets/504d73be1b361b4b9ca7f655ce085dc6.svg    1.96 KiB                        [emitted]
                         static/assets/51d064ccbf7daeb159a16fb735dd0a69.gif     520 KiB                        [emitted]
                         static/assets/51d228f5f5d5e42a252cc88210fd0cd2.svg    1.14 KiB                        [emitted]
                         static/assets/52797b48d511ecdd8e938684cee7638e.png    5.09 KiB                        [emitted]
                         static/assets/52886015226b693acd9c15e33d924075.svg   875 bytes                        [emitted]
                         static/assets/52d4a61d9fd788fe438f3037b9c49d3a.gif      51 KiB                        [emitted]
                         static/assets/551aae506dfa65ce3b45713b5300a678.svg    1.51 KiB                        [emitted]
                         static/assets/55b56d9f7b5eb7267f4ac19441146e85.gif     373 KiB                        [emitted]
                         static/assets/563e9cf9e28b483c7c515fb438412311.gif    1020 KiB                        [emitted]
                         static/assets/5679cd29c517886712116060d3360592.svg  1010 bytes                        [emitted]
                         static/assets/572a212c2e777e3a9061c97453497009.png    41.6 KiB                        [emitted]
                         static/assets/59bec17a687a56c251f423378f05cb72.gif     102 KiB                        [emitted]
                         static/assets/59c79fa681b1421547664294a259b2d8.svg    1.06 KiB                        [emitted]
                         static/assets/5bca6b3a9b72144dafb5cecab39092c0.gif     223 KiB                        [emitted]
                         static/assets/5c74b2c74fb87685d69914f6af840bc2.jpg     112 KiB                        [emitted]
                         static/assets/5e8eccd5a576638f029a1ed2deb4784b.svg    1.75 KiB                        [emitted]
                         static/assets/5f4208a6b7257c456c018d57efc8a7e9.svg    2.05 KiB                        [emitted]
                         static/assets/5f7a79af3db62e0f5b7306ac0bd5ebf9.svg    18.5 KiB                        [emitted]
                         static/assets/619f7584233d9a517d7f73a4df7af66c.gif     477 KiB                        [emitted]
                         static/assets/63e5827c1506216bd7c9927a4e5eb558.svg    1.96 KiB                        [emitted]
                         static/assets/6608d56b3dce2738b2b137569d305d3b.png    40.3 KiB                        [emitted]
                         static/assets/664d94e5cb8676c780c74c695f2e972c.svg   904 bytes                        [emitted]
                         static/assets/66644f76b3f90ffeeb9bec0ffd4bccdb.jpg     181 KiB                        [emitted]
                         static/assets/680b3ff6a51d8fc77fbaf8695c8de929.svg    4.13 KiB                        [emitted]
                         static/assets/682da989d442750088077c7a699dec0a.gif     297 KiB                        [emitted]
                         static/assets/68d9ddbb2aa63310b88c7697e5b0c6c9.svg    2.07 KiB                        [emitted]
                         static/assets/6b7cb6ae65beb0c64262c053f24a0bca.gif     283 KiB                        [emitted]
                         static/assets/6be143c7cb9d23c787f7f20674a76f72.svg      44 KiB                        [emitted]
                         static/assets/6de06131f1124722ba9dbd735ba1b62f.gif    28.6 KiB                        [emitted]
                         static/assets/6e61fa7e48326bd2026d28e7a62884b1.svg    1.92 KiB                        [emitted]
                         static/assets/7130491bf33852e50503dcb4024c0279.svg    9.49 KiB                        [emitted]
                         static/assets/71655cde34ae75f48cb8820abf4b31e7.svg     2.6 KiB                        [emitted]
                         static/assets/7176aa6fc1d9d4bc12dc35951a7fdfe0.gif     173 KiB                        [emitted]
                         static/assets/73b3649625bed526e496a41860dc8400.gif     219 KiB                        [emitted]
                         static/assets/74af5393beb64d092e7ecc033d89ce4d.gif     404 KiB                        [emitted]
                         static/assets/7679e8aa3b5a6b745823e00a7b950065.png    8.08 KiB                        [emitted]
                         static/assets/770c1f3eca5a0d7c327c275865dad3f0.svg    1.44 KiB                        [emitted]
                         static/assets/7838388419a0268456642d4a08fcf5b9.gif      79 KiB                        [emitted]
                         static/assets/7c417cd2ff5d03f924e0ec8f380ad972.svg    2.49 KiB                        [emitted]
                         static/assets/7ca82ca6ee18a4c008cae2b4fc8d5be2.gif     126 KiB                        [emitted]
                         static/assets/7d6f0362fc2114f39b4f6651ebeda312.svg   612 bytes                        [emitted]
                         static/assets/7ea9fdc7b4f02bc900f206308c0efe81.gif     131 KiB                        [emitted]
                         static/assets/7eea42371f5ccb84b4fc7d0ba7331ea3.png    51.7 KiB                        [emitted]
                         static/assets/800f6f1573677d59954e8d3164602287.svg    1.31 KiB                        [emitted]
                         static/assets/80ad76114d0b3f2fc54a3756dd283a53.svg   576 bytes                        [emitted]
                         static/assets/81d5d1258558641e78d425193753207c.svg    2.18 KiB                        [emitted]
                         static/assets/8279ce395d0333b880b8be6d243fd111.svg    1.01 KiB                        [emitted]
                         static/assets/84a9455c54ab68ad8dcf8b6f6465ae71.svg    55.4 KiB                        [emitted]
                         static/assets/85288751058f7704ffdb91f15d189260.svg    1.28 KiB                        [emitted]
                         static/assets/89b23cdaf4cd793344e503007bd3b405.gif    95.3 KiB                        [emitted]
                         static/assets/8b19555004f40ebd9677c44da642a4ad.gif     160 KiB                        [emitted]
                         static/assets/8b8f2d052b4092ec47ad66c30c8b1642.svg    3.15 KiB                        [emitted]
                         static/assets/8beb9da10f72d02b48baf0b24ac72449.svg   572 bytes                        [emitted]
                         static/assets/8c3127887a7aacaea989aa247e510f84.jpg     109 KiB                        [emitted]
                         static/assets/8c5774830e83c866d2be15afe09f5590.gif     133 KiB                        [emitted]
                         static/assets/8e27ca9b97818a169be94795a48d8bad.gif     134 KiB                        [emitted]
                         static/assets/8e5e28b23ba596614a60d319d9c64165.svg    15.2 KiB                        [emitted]
                         static/assets/8e637b4e1bc1aeca8229b3cfa622df3c.gif     319 KiB                        [emitted]
                         static/assets/8fb27bc07c64def488d712e06906c7a4.svg    2.54 KiB                        [emitted]
                         static/assets/905aaa5ec7fca7cf364f5e74bcb10be1.png    32.1 KiB                        [emitted]
                         static/assets/91c5fa4689392dff5c308d48d674f5fa.gif     307 KiB                        [emitted]
                         static/assets/94b06fb716871f81bec601724e29a457.svg    2.09 KiB                        [emitted]
                         static/assets/97926439955086f8ee4aabbd81580f17.png    4.36 KiB                        [emitted]
                         static/assets/9844f07238b57b2a35cf880055fcec35.gif     290 KiB                        [emitted]
                         static/assets/989d99155bdb2720680a8c09fb7c454e.svg   585 bytes                        [emitted]
                         static/assets/993a0700d8a0972d309307b0a4688ed7.svg    1.83 KiB                        [emitted]
                         static/assets/9c029845bbb161b90781ac839ac533f6.gif     367 KiB                        [emitted]
                         static/assets/9c49ade683c0f0d75796136ff5d1030f.svg   227 bytes                        [emitted]
                         static/assets/9cfdd378e4cc977fe663ca932e530ec6.svg    2.46 KiB                        [emitted]
                         static/assets/9ddae4f6c1aeaf0784007203d9d4ac9c.svg    1.05 KiB                        [emitted]
                         static/assets/9fd052aaf1b4701ff0134d124d6327a3.jpg     269 KiB                        [emitted]
                         static/assets/a03436c2c26c934fc0a7997065971874.png    29.7 KiB                        [emitted]
                         static/assets/a0c3f3a11b20c6777738f170e4b00098.svg   881 bytes                        [emitted]
                         static/assets/a11c1802ec38e7fe60918fb52186261f.svg     1.5 KiB                        [emitted]
                         static/assets/a246880e69bc7a2a793c90a2fb013ae1.svg    1.15 KiB                        [emitted]
                         static/assets/a4451ef35d29c4997f7c8e837da8af44.svg   613 bytes                        [emitted]
                         static/assets/a45329a2542b590a54dba0ccd30fdf4e.gif    64.8 KiB                        [emitted]
                         static/assets/a54e98269f78b67e2036168fced9b070.svg     2.5 KiB                        [emitted]
                         static/assets/a6cebfe99bad7b01f59b85998cbc4628.svg    1.72 KiB                        [emitted]
                         static/assets/a7b8435328fd6d9605bc47218b0151ab.svg    3.29 KiB                        [emitted]
                         static/assets/a80790c977586cc0595b5fe2f0bcb39a.svg    1.32 KiB                        [emitted]
                         static/assets/a8f3ce9fb80d558020a867afe7a840cd.gif    43.5 KiB                        [emitted]
                         static/assets/aa249b12450d4c37c61f7123b03dab3a.gif     213 KiB                        [emitted]
                         static/assets/aaa4a3575852fe11d04f44c4a972ae73.svg    1.11 KiB                        [emitted]
                         static/assets/ababebe088315c098726bb98f6dacd65.jpg     122 KiB                        [emitted]
                         static/assets/abdb9221f6fe3367ae1d899e2352d2e3.svg    1.93 KiB                        [emitted]
                         static/assets/ac92bfcb2fc35687d1ba5ab6bb733671.svg   599 bytes                        [emitted]
                         static/assets/acc6c29b5eee67bc6b2aa85854d9bb3a.svg    1.37 KiB                        [emitted]
                         static/assets/ae4fdf588b063e05cd99593e785dd60d.jpg     107 KiB                        [emitted]
                         static/assets/aedf793e59c5c73331d9722cffd4cb92.gif     161 KiB                        [emitted]
                         static/assets/af2202211ca1873edb949012dab6f9d1.svg     2.5 KiB                        [emitted]
                         static/assets/b2c44c738c9cbc1a99cd6edfd0c2b85b.svg    1.64 KiB                        [emitted]
                         static/assets/b433ee02a13fa2a12f7f7059f1f6729a.svg    3.93 KiB                        [emitted]
                         static/assets/b592c8b4b02de3c7d367ce10efa9d7a6.svg    1.38 KiB                        [emitted]
                         static/assets/b6162ffbfe48d4b6c67f0b469f1615ae.png    24.1 KiB                        [emitted]
                         static/assets/b86108e6db1c6c32ad39ba422a355ef3.gif     140 KiB                        [emitted]
                         static/assets/b96acdcc724f0651325c9c54b8daeb23.gif     117 KiB                        [emitted]
                         static/assets/ba5625a05f8ae4818d871287530dcfa9.gif    61.1 KiB                        [emitted]
                         static/assets/ba6834dd9e9cf47dc96d1c27f7655d18.gif    88.7 KiB                        [emitted]
                         static/assets/bb7c6671cf8cdffe1001dc509d20881c.svg     1.2 KiB                        [emitted]
                         static/assets/bbbd98ae6a34eac772e34a57aaa5f977.svg    2.57 KiB                        [emitted]
                         static/assets/bc45b073cd2fc0c2265374bdb4e05d67.svg   962 bytes                        [emitted]
                         static/assets/bc487cde787d1a887f7d5494e707ef46.svg    3.33 KiB                        [emitted]
                         static/assets/c083eb7d85a76d2d205dcf97a46f76ac.svg    2.11 KiB                        [emitted]
                         static/assets/c19282f27937a0db7e8146672018fa8b.jpg     109 KiB                        [emitted]
                         static/assets/c26c369a2ca3f3a09b60e5af6c30bd15.gif    66.8 KiB                        [emitted]
                         static/assets/c30d6a0e73cf38ad6ea7f5e4fe0428a3.png    54.7 KiB                        [emitted]
                         static/assets/c3421543ab6c9e154f4294257ce0d078.svg    1.03 KiB                        [emitted]
                         static/assets/c4379c5eb21b7cf9b9c94055dde0b582.svg    1.46 KiB                        [emitted]
                         static/assets/c4ceba83cf15016aa9c2cf6c3b9c764b.jpg    97.6 KiB                        [emitted]
                         static/assets/c68c293bc65d68238f912074b1fd1386.gif    72.8 KiB                        [emitted]
                         static/assets/c7ffd288176b935f835311512a224d4b.svg    1.77 KiB                        [emitted]
                         static/assets/c9528ee4be1a12380a6c9caf73bd99e9.svg    2.66 KiB                        [emitted]
                         static/assets/cb666b99d3528f91b52f985dfb102afa.svg   361 bytes                        [emitted]
                         static/assets/cbce5aef3c3b611073790b49bc49bc26.gif    86.8 KiB                        [emitted]
                         static/assets/cc0065f74161f7e7859b31796aaa3345.svg    1.36 KiB                        [emitted]
                         static/assets/cdf71f36614586632e5d600e2a15405d.gif     320 KiB                        [emitted]
                         static/assets/ce5820b006d753e4133f46ae776f4d96.svg    2.58 KiB                        [emitted]
                         static/assets/d11f933570ff0cb8c71e25aed760f609.gif     311 KiB                        [emitted]
                         static/assets/d1680a847046403c792a689d2572ff80.jpg     127 KiB                        [emitted]
                         static/assets/d16a2c96bd97f214cc889b5bc3f921b4.svg    2.06 KiB                        [emitted]
                         static/assets/d505a716f1a00276ab72af1b4d0ec190.gif     103 KiB                        [emitted]
                         static/assets/d61429ad96a25ec2917ebc77d900aae0.svg    1.24 KiB                        [emitted]
                         static/assets/d6f130fb79e78e4dd351fd930e742bcc.png    28.1 KiB                        [emitted]
                         static/assets/d7eb1e753d603d291d24509c5389d92b.jpg     271 KiB                        [emitted]
                         static/assets/d84cdb7f4b9567882511ab47f63e342b.svg    1.58 KiB                        [emitted]
                         static/assets/d889a872f3b0985b28fa872764172ef1.svg     2.1 KiB                        [emitted]
                         static/assets/d8e2d86b37df007b3bf56e8b4bd9daa0.svg    8.43 KiB                        [emitted]
                         static/assets/d92faa93ec9d77baa6d7dc2ca6652996.gif     319 KiB                        [emitted]
                         static/assets/d9e0fd6da7031be3ed69ef361ad28792.jpg     134 KiB                        [emitted]
                         static/assets/db50bd7dacd69c9e8397eb83b4d83c3b.svg    1.79 KiB                        [emitted]
                         static/assets/dba629c24296756d68a135988fe96011.svg   394 bytes                        [emitted]
                         static/assets/dbff6359a3f338d5581c626ee50acf60.svg   888 bytes                        [emitted]
                         static/assets/dccd5059320d172d1b282564e0d9422d.svg    2.49 KiB                        [emitted]
                         static/assets/dd55f4c6c20f5d25e520b6f5bfb090c5.svg    2.94 KiB                        [emitted]
                         static/assets/dd98971c2c185caf86144b6b5234d0fa.svg    1.47 KiB                        [emitted]
                         static/assets/ddc0f358d6689675472ef9aad95dc698.gif     144 KiB                        [emitted]
                         static/assets/df453aa5d5261433d9c105b94be71579.png     102 KiB                        [emitted]
                         static/assets/dfe35552790fb5ff38c78a43f5e62f30.svg    2.21 KiB                        [emitted]
                         static/assets/e0e5baf4d9616b66aaa2e560cf4cfb51.jpg    90.9 KiB                        [emitted]
                         static/assets/e113aa02e926ad23da7d46fead1231b9.gif    66.2 KiB                        [emitted]
                         static/assets/e1aa217ece74e4dd29657f9f91a69f6e.svg    2.69 KiB                        [emitted]
                         static/assets/e3cc49b6555f37b43d85e1beb5df7aa7.gif    55.5 KiB                        [emitted]
                         static/assets/e53ff4a140871927b2d5be4f5cdb2c79.svg    1.21 KiB                        [emitted]
                         static/assets/e587d9d7e9a2f1f28041ba5c15db7a40.svg    1.63 KiB                        [emitted]
                         static/assets/e6f716edc49c30d8e46444093f2c113a.svg     2.1 KiB                        [emitted]
                         static/assets/e764d9d9a7a12892e0845b11cd4202df.png    1.43 KiB                        [emitted]
                         static/assets/e7c972c634096b89b182b99441a20b1d.svg    2.11 KiB                        [emitted]
                         static/assets/e8db9671e95c4c4530eea1528936b9e7.jpg     188 KiB                        [emitted]
                         static/assets/eaeb48bb0997c81359942ee431680a8d.gif    93.8 KiB                        [emitted]
                         static/assets/ee54d776d2cda9a3c537ac7e8f144037.svg    1.77 KiB                        [emitted]
                         static/assets/eef0c5e9761d7850485979484434754c.gif     182 KiB                        [emitted]
                         static/assets/f011f09e649e804c4c0c8275a7d1ba5b.png    40.7 KiB                        [emitted]
                         static/assets/f197a5756552118c132f63fc9dce21d4.gif     128 KiB                        [emitted]
                         static/assets/f2457825850317e66ef2128504613c30.svg    1.21 KiB                        [emitted]
                         static/assets/f3cd3bde88a384bf6757c9f30508cdd6.svg    2.01 KiB                        [emitted]
                         static/assets/f3eebf3dbf52d3ba97c9176807aa32ad.gif     134 KiB                        [emitted]
                         static/assets/f40501ed87782097b1a4eec8747eb84a.png    3.57 KiB                        [emitted]
                         static/assets/f8ff5dbef05bc3337cd3660fb956cffa.svg    3.15 KiB                        [emitted]
                         static/assets/f9dce53613d5f85b311ce9f84423c08b.svg    2.58 KiB                        [emitted]
                         static/assets/fb356e819d8ab210a241ce81b9bac33c.png    9.58 KiB                        [emitted]
                         static/assets/fb3f9fa9be421f5153cd0223c3b0cb87.svg     1.4 KiB                        [emitted]
                         static/assets/fbbef73344d80136b4ba150032c2fa60.gif     116 KiB                        [emitted]
                         static/assets/fc4228c3fe329628c4ba78569e5620eb.gif    72.1 KiB                        [emitted]
                         static/assets/fe5afd6776eac0f7724b132a9ff5057d.svg    2.68 KiB                        [emitted]
                                                static/blocks-media/1x1.gif    43 bytes                        [emitted]
                                              static/blocks-media/click.mp3    7.94 KiB                        [emitted]
                                              static/blocks-media/click.ogg    5.32 KiB                        [emitted]
                                              static/blocks-media/click.wav    3.12 KiB                        [emitted]
                                 static/blocks-media/comment-arrow-down.svg   880 bytes                        [emitted]
                                   static/blocks-media/comment-arrow-up.svg   972 bytes                        [emitted]
                                           static/blocks-media/delete-x.svg    1.26 KiB                        [emitted]
                                             static/blocks-media/delete.mp3    9.57 KiB                        [emitted]
                                             static/blocks-media/delete.ogg    8.42 KiB                        [emitted]
                                             static/blocks-media/delete.wav    11.7 KiB                        [emitted]
                                static/blocks-media/dropdown-arrow-dark.svg   573 bytes                        [emitted]
                                     static/blocks-media/dropdown-arrow.svg   569 bytes                        [emitted]
                     static/blocks-media/extensions/microbit-block-icon.svg     4.9 KiB                        [emitted]
                        static/blocks-media/extensions/music-block-icon.svg    4.38 KiB                        [emitted]
                          static/blocks-media/extensions/pen-block-icon.svg    2.47 KiB                        [emitted]
                        static/blocks-media/extensions/wedo2-block-icon.svg    9.57 KiB                        [emitted]
                                         static/blocks-media/eyedropper.svg    3.47 KiB                        [emitted]
                                         static/blocks-media/green-flag.svg    1.16 KiB                        [emitted]
                                         static/blocks-media/handclosed.cur   326 bytes                        [emitted]
                                         static/blocks-media/handdelete.cur   766 bytes                        [emitted]
                                           static/blocks-media/handopen.cur   198 bytes                        [emitted]
                                        static/blocks-media/icons/arrow.svg    1.18 KiB                        [emitted]
                                 static/blocks-media/icons/arrow_button.svg    1.06 KiB                        [emitted]
                              static/blocks-media/icons/control_forever.svg    4.57 KiB                        [emitted]
                               static/blocks-media/icons/control_repeat.svg    1.95 KiB                        [emitted]
                                 static/blocks-media/icons/control_stop.svg   301 bytes                        [emitted]
                                 static/blocks-media/icons/control_wait.svg    1.11 KiB                        [emitted]
                         static/blocks-media/icons/event_broadcast_blue.svg    1.62 KiB                        [emitted]
                        static/blocks-media/icons/event_broadcast_coral.svg    1.62 KiB                        [emitted]
                        static/blocks-media/icons/event_broadcast_green.svg    1.62 KiB                        [emitted]
                      static/blocks-media/icons/event_broadcast_magenta.svg    1.62 KiB                        [emitted]
                       static/blocks-media/icons/event_broadcast_orange.svg    1.62 KiB                        [emitted]
                       static/blocks-media/icons/event_broadcast_purple.svg    1.61 KiB                        [emitted]
           static/blocks-media/icons/event_when-broadcast-received_blue.svg    1.61 KiB                        [emitted]
          static/blocks-media/icons/event_when-broadcast-received_coral.svg    1.62 KiB                        [emitted]
          static/blocks-media/icons/event_when-broadcast-received_green.svg    1.62 KiB                        [emitted]
        static/blocks-media/icons/event_when-broadcast-received_magenta.svg    1.62 KiB                        [emitted]
         static/blocks-media/icons/event_when-broadcast-received_orange.svg    1.62 KiB                        [emitted]
         static/blocks-media/icons/event_when-broadcast-received_purple.svg    1.61 KiB                        [emitted]
                        static/blocks-media/icons/event_whenflagclicked.svg   634 bytes                        [emitted]
                                       static/blocks-media/icons/remove.svg    1.55 KiB                        [emitted]
                                 static/blocks-media/icons/set-led_blue.svg    1.99 KiB                        [emitted]
                                static/blocks-media/icons/set-led_coral.svg    1.99 KiB                        [emitted]
                                static/blocks-media/icons/set-led_green.svg    1.99 KiB                        [emitted]
                              static/blocks-media/icons/set-led_magenta.svg    1.99 KiB                        [emitted]
                              static/blocks-media/icons/set-led_mystery.svg    2.89 KiB                        [emitted]
                               static/blocks-media/icons/set-led_orange.svg    1.99 KiB                        [emitted]
                               static/blocks-media/icons/set-led_purple.svg    1.99 KiB                        [emitted]
                                static/blocks-media/icons/set-led_white.svg    1.99 KiB                        [emitted]
                               static/blocks-media/icons/set-led_yellow.svg    1.99 KiB                        [emitted]
                         static/blocks-media/icons/wedo_motor-clockwise.svg    3.66 KiB                        [emitted]
                  static/blocks-media/icons/wedo_motor-counterclockwise.svg    3.64 KiB                        [emitted]
                        static/blocks-media/icons/wedo_motor-speed_fast.svg    4.23 KiB                        [emitted]
                         static/blocks-media/icons/wedo_motor-speed_med.svg    4.24 KiB                        [emitted]
                        static/blocks-media/icons/wedo_motor-speed_slow.svg    4.26 KiB                        [emitted]
                     static/blocks-media/icons/wedo_when-distance_close.svg    4.64 KiB                        [emitted]
                      static/blocks-media/icons/wedo_when-tilt-backward.svg     4.8 KiB                        [emitted]
                       static/blocks-media/icons/wedo_when-tilt-forward.svg    4.81 KiB                        [emitted]
                          static/blocks-media/icons/wedo_when-tilt-left.svg    3.57 KiB                        [emitted]
                         static/blocks-media/icons/wedo_when-tilt-right.svg    3.57 KiB                        [emitted]
                               static/blocks-media/icons/wedo_when-tilt.svg    4.01 KiB                        [emitted]
                                             static/blocks-media/repeat.svg    1.21 KiB                        [emitted]
                                        static/blocks-media/rotate-left.svg    1.04 KiB                        [emitted]
                                       static/blocks-media/rotate-right.svg    1.03 KiB                        [emitted]
                                            static/blocks-media/sprites.png    4.05 KiB                        [emitted]
                                            static/blocks-media/sprites.svg    1.73 KiB                        [emitted]
                                   static/blocks-media/status-not-ready.svg    1.16 KiB                        [emitted]
                                       static/blocks-media/status-ready.svg    1.09 KiB                        [emitted]
                                            static/blocks-media/zoom-in.svg   634 bytes                        [emitted]
                                           static/blocks-media/zoom-out.svg   582 bytes                        [emitted]
                                         static/blocks-media/zoom-reset.svg   501 bytes                        [emitted]
                                     static/extensions/example-extension.js    9.76 KiB                        [emitted]
                                                         static/favicon.ico    33.7 KiB                        [emitted]
        Entrypoint gui = lib.min.js lib.min.js.map gui.js gui.js.map
        Entrypoint blocksonly = lib.min.js lib.min.js.map blocksonly.js blocksonly.js.map
        Entrypoint compatibilitytesting = lib.min.js lib.min.js.map compatibilitytesting.js compatibilitytesting.js.map
        Entrypoint player = lib.min.js lib.min.js.map player.js player.js.map
         [0] multi (webpack)-dev-server/client?http://0.0.0.0:8601 react react-dom 52 bytes {lib.min} [built]
         [1] multi (webpack)-dev-server/client?http://0.0.0.0:8601 ./src/playground/index.jsx 40 bytes {gui} [built]
        [11] multi (webpack)-dev-server/client?http://0.0.0.0:8601 ./src/playground/blocks-only.jsx 40 bytes {blocksonly} [built]
        [12] multi (webpack)-dev-server/client?http://0.0.0.0:8601 ./src/playground/compatibility-testing.jsx 40 bytes {compatibilitytesting} [built]
        [13] multi (webpack)-dev-server/client?http://0.0.0.0:8601 ./src/playground/player.jsx 40 bytes {player} [built]
         [./node_modules/classnames/index.js] 1.17 KiB {lib.min} [built]
         [./node_modules/core-js/fn/array/includes.js] 109 bytes {lib.min} [built]
         [./node_modules/core-js/fn/promise/finally.js] 166 bytes {lib.min} [built]
         [./node_modules/react-dom/index.js] 1.33 KiB {lib.min} [built]
         [./node_modules/react/index.js] 190 bytes {lib.min} [built]
         [./node_modules/webpack-dev-server/client/index.js?http://0.0.0.0:8601] (webpack)-dev-server/client?http://0.0.0.0:8601 7.78 KiB {lib.min} [built]
         [./src/playground/blocks-only.jsx] 1.04 KiB {blocksonly} [built]
         [./src/playground/compatibility-testing.jsx] 4.19 KiB {compatibilitytesting} [built]
         [./src/playground/index.jsx] 1.17 KiB {gui} [built]
         [./src/playground/player.jsx] 2.7 KiB {player} [built]
            + 1883 hidden modules

        WARNING in ./src/components/alerts/inline-message.css (./node_modules/css-loader??ref--5-1!./node_modules/postcss-loader/src??postcss!./src/components/alerts/inline-message.css)
        Module Warning (from ./node_modules/postcss-loader/src/index.js):
        Warning

        (8:5) end value has mixed support, consider using flex-end instead
         @ ./src/components/alerts/inline-message.css 2:14-158
         @ ./src/components/alerts/inline-message.jsx
         @ ./src/containers/inline-messages.jsx
         @ ./src/components/menu-bar/save-status.jsx
         @ ./src/components/menu-bar/menu-bar.jsx
         @ ./src/components/gui/gui.jsx
         @ ./src/containers/gui.jsx
         @ ./src/playground/blocks-only.jsx
         @ multi (webpack)-dev-server/client?http://0.0.0.0:8601 ./src/playground/blocks-only.jsx

        WARNING in ./src/components/menu-bar/author-info.css (./node_modules/css-loader??ref--5-1!./node_modules/postcss-loader/src??postcss!./src/components/menu-bar/author-info.css)
        Module Warning (from ./node_modules/postcss-loader/src/index.js):
        Warning

        (8:5) start value has mixed support, consider using flex-start instead
         @ ./src/components/menu-bar/author-info.css 2:14-155
         @ ./src/components/menu-bar/author-info.jsx
         @ ./src/components/menu-bar/menu-bar.jsx
         @ ./src/components/gui/gui.jsx
         @ ./src/containers/gui.jsx
         @ ./src/playground/blocks-only.jsx
         @ multi (webpack)-dev-server/client?http://0.0.0.0:8601 ./src/playground/blocks-only.jsx
        Child html-webpack-plugin for "blocks-only.html":
             1 asset
            Entrypoint undefined = blocks-only.html
            [./node_modules/html-webpack-plugin/lib/loader.js!./src/playground/index.ejs] 1.06 KiB {0} [built]
            [./node_modules/lodash/lodash.js] 527 KiB {0} [built]
            [./node_modules/webpack/buildin/global.js] (webpack)/buildin/global.js 472 bytes {0} [built]
            [./node_modules/webpack/buildin/module.js] (webpack)/buildin/module.js 497 bytes {0} [built]
        Child html-webpack-plugin for "compatibility-testing.html":
             1 asset
            Entrypoint undefined = compatibility-testing.html
            [./node_modules/html-webpack-plugin/lib/loader.js!./src/playground/index.ejs] 1.06 KiB {0} [built]
            [./node_modules/lodash/lodash.js] 527 KiB {0} [built]
            [./node_modules/webpack/buildin/global.js] (webpack)/buildin/global.js 472 bytes {0} [built]
            [./node_modules/webpack/buildin/module.js] (webpack)/buildin/module.js 497 bytes {0} [built]
        Child html-webpack-plugin for "index.html":
             1 asset
            Entrypoint undefined = index.html
            [./node_modules/html-webpack-plugin/lib/loader.js!./src/playground/index.ejs] 1.06 KiB {0} [built]
            [./node_modules/lodash/lodash.js] 527 KiB {0} [built]
            [./node_modules/webpack/buildin/global.js] (webpack)/buildin/global.js 472 bytes {0} [built]
            [./node_modules/webpack/buildin/module.js] (webpack)/buildin/module.js 497 bytes {0} [built]
        Child html-webpack-plugin for "player.html":
             1 asset
            Entrypoint undefined = player.html
            [./node_modules/html-webpack-plugin/lib/loader.js!./src/playground/index.ejs] 1.06 KiB {0} [built]
            [./node_modules/lodash/lodash.js] 527 KiB {0} [built]
            [./node_modules/webpack/buildin/global.js] (webpack)/buildin/global.js 472 bytes {0} [built]
            [./node_modules/webpack/buildin/module.js] (webpack)/buildin/module.js 497 bytes {0} [built]
        Child worker:
                              Asset      Size  Chunks             Chunk Names
                extension-worker.js  51.8 KiB    main  [emitted]  main
            extension-worker.js.map  42.4 KiB    main  [emitted]  main
            Entrypoint main = extension-worker.js extension-worker.js.map
            [./node_modules/babel-loader/lib/index.js?!./node_modules/scratch-vm/src/extension-support/extension-worker.js] ./node_modules/babel-loader/lib??ref--4!./node_modules/scratch-vm/src/extension-support/extension-worker.js 3.5 KiB {main} [built]
            [./node_modules/minilog/lib/common/filter.js] 1.36 KiB {main} [built]
            [./node_modules/minilog/lib/common/minilog.js] 1.55 KiB {main} [built]
            [./node_modules/minilog/lib/web/array.js] 319 bytes {main} [built]
            [./node_modules/minilog/lib/web/console.js] 925 bytes {main} [built]
            [./node_modules/minilog/lib/web/index.js] 1.28 KiB {main} [built]
            [./node_modules/minilog/lib/web/jquery_simple.js] 2.16 KiB {main} [built]
            [./node_modules/minilog/lib/web/localstorage.js] 530 bytes {main} [built]
            [./node_modules/scratch-vm/src/dispatch/shared-dispatch.js] 13.8 KiB {main} [built]
            [./node_modules/scratch-vm/src/dispatch/worker-dispatch.js] 6.69 KiB {main} [built]
            [./node_modules/scratch-vm/src/extension-support/argument-type.js] 605 bytes {main} [built]
            [./node_modules/scratch-vm/src/extension-support/block-type.js] 929 bytes {main} [built]
            [./node_modules/scratch-vm/src/extension-support/target-type.js] 308 bytes {main} [built]
            [./node_modules/scratch-vm/src/util/log.js] 84 bytes {main} [built]
            [./node_modules/webpack/buildin/global.js] (webpack)/buildin/global.js 472 bytes {main} [built]
                + 5 hidden modules
    ℹ ｢wdm｣: Compiled with warnings.

Tada! Scratch 3 is here.

# How to stop Scratch 3 Docker container

Once you will be bored (impossible), go back to terminal and break `run.sh` script by pressing CTRL+C.
If you want to be super sure that no residues will be left on your machine, type:

    $ docker rm -f scratch

# Final note

You don't need to build Scratch every time. Next day start with `./run.sh` and go make some tea.
