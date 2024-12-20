# Changelog

## [2.1.0](https://github.com/Goose97/timber.nvim/compare/v2.0.0...v2.1.0) (2024-12-20)


### Features

* **actions:** add Kotlin language support ([8ff42b0](https://github.com/Goose97/timber.nvim/commit/8ff42b03c052012e379e14de49de740389449e3f))
* **actions:** allow custom placeholders ([#17](https://github.com/Goose97/timber.nvim/issues/17)) ([9e86494](https://github.com/Goose97/timber.nvim/commit/9e864943a57fd089e3cc37ebff0c01315caad548))
* **bash:** add Bash language support ([83335a0](https://github.com/Goose97/timber.nvim/commit/83335a0ff75630c277faf0e9f46fdeb242777a1a))
* **buffers:** add option to sort log entries in float window ([#19](https://github.com/Goose97/timber.nvim/issues/19)) ([699ee87](https://github.com/Goose97/timber.nvim/commit/699ee871585981c4bf86dcc8483b68ac3f6faabb))
* **buffers:** make float window at least as wide as title ([b8dbf22](https://github.com/Goose97/timber.nvim/commit/b8dbf2223649d7b5bf47d6ea56c0d77acc49129e))
* **buffers:** make separator lines in floating win virtual text ([134e821](https://github.com/Goose97/timber.nvim/commit/134e8219cca5f709b832b70dae531e27eb4c70eb))
* **lua:** support variables in return statement ([cb2b22d](https://github.com/Goose97/timber.nvim/commit/cb2b22dc12474b838a012756ca6d21bafd22f7ff))
* **odin:** add Odin language support ([#13](https://github.com/Goose97/timber.nvim/issues/13)) ([862c5f9](https://github.com/Goose97/timber.nvim/commit/862c5f9ed6478ebf03f191aaa41f33bea507c055))
* **odin:** change default template to printfln instead of printf ([#13](https://github.com/Goose97/timber.nvim/issues/13)) ([b516f54](https://github.com/Goose97/timber.nvim/commit/b516f545e53513e1eeb972253e7a3e2d775023d4))
* **summary:** add summary window ([c58691e](https://github.com/Goose97/timber.nvim/commit/c58691ec90a4591dc40af45d4358c2977006c41e))
* **summary:** apply source buffer options if summary window has only single source ([83d3f92](https://github.com/Goose97/timber.nvim/commit/83d3f92814d33732ae32f68efbd0a82de99feacb))
* **summary:** summary window customization ([988dbd0](https://github.com/Goose97/timber.nvim/commit/988dbd0de9492ee4927b5ac6cf71dfbe402c9c03))
* **summary:** use sequence id as tie-breaker for timestamp sort ([9b44d22](https://github.com/Goose97/timber.nvim/commit/9b44d225ba1a6608740e2579e1f5cd30d9452941))
* **swift:** add Swift language support ([#18](https://github.com/Goose97/timber.nvim/issues/18)) ([a47f09b](https://github.com/Goose97/timber.nvim/commit/a47f09b3fb43bc23940b3e74036a066926c9b9fa))
* **template:** add %filename placeholder ([#16](https://github.com/Goose97/timber.nvim/issues/16)) ([f274dc4](https://github.com/Goose97/timber.nvim/commit/f274dc4988c4fae2c87b08a136b9ac427797115a))
* **watcher:** remove | in the %watcher_marker ([d25e1a8](https://github.com/Goose97/timber.nvim/commit/d25e1a86485fba5b63206947a0fab1841dbcd2da))


### Bug Fixes

* **buffers:** make the log snippet always follows log marker line ([451b826](https://github.com/Goose97/timber.nvim/commit/451b8262f11beb9d0a7d78544e1a41ec400ef628))
* failling CI ([8b855f4](https://github.com/Goose97/timber.nvim/commit/8b855f4a63da24d9b796c1f1438563086e05022a))
* **summary:** make show help order consistent ([e95cce8](https://github.com/Goose97/timber.nvim/commit/e95cce8acbbe76c2b79ca35f30c24a13410ac60d))
* test conflicts in parallel ([05d5e2b](https://github.com/Goose97/timber.nvim/commit/05d5e2bde9f218212cd066aca2d240b4ca4b269d))
* **watcher:** allow capture log in the middle of the line ([7cb8f07](https://github.com/Goose97/timber.nvim/commit/7cb8f076abefe3806a2295205315fb2b0dd73a9c))

## [2.0.0](https://github.com/Goose97/timber.nvim/compare/v1.0.0...v2.0.0) (2024-12-09)


### ⚠ BREAKING CHANGES

* rename API buffer.clear_logs to buffer.clear_captured_logs

### Features

* **actions:** add action to toggle comment log statements ([9d8b973](https://github.com/Goose97/timber.nvim/commit/9d8b97373ac55fc095479092e227ffc2417a1921))
* add plain log templates and default keymaps ([e9d0e54](https://github.com/Goose97/timber.nvim/commit/e9d0e54765bee11918c477a914824241451e6d79))
* **buffer:** add min width for floating win ([877f231](https://github.com/Goose97/timber.nvim/commit/877f231d10ff59c55aacaa6ebeb7876e60ccffb7))
* **buffer:** allow to configure options for the float buffer ([5bf403f](https://github.com/Goose97/timber.nvim/commit/5bf403f9382fbf6ac8da7e6a7fe811abb139e23a))
* **c#:** add C# language support ([4662e57](https://github.com/Goose97/timber.nvim/commit/4662e5725a932d24a177fcb348aef11944499ed5))
* **c:** add C language support ([8e94434](https://github.com/Goose97/timber.nvim/commit/8e944346e5ee9118dcc4e71a6af16b7947d255de))
* **core:** add clearing log statements action ([#5](https://github.com/Goose97/timber.nvim/issues/5)) ([a2faec8](https://github.com/Goose97/timber.nvim/commit/a2faec8a7525d49a2e033ce54246cd50a4fb9021))
* **cpp:** add C++ language support ([0f5d4ab](https://github.com/Goose97/timber.nvim/commit/0f5d4ab19dd6d055c6e1ebc111a04f391f8f3b87))
* handle more log cases ([2e56b52](https://github.com/Goose97/timber.nvim/commit/2e56b52d92c9ceb87210e8e7e952f482b054f877))
* **highlight:** add highlight group for log statements line ([0584dba](https://github.com/Goose97/timber.nvim/commit/0584dbaf0a1b9fc1185485199e6760f102fa6f4b))
* **java:** add Java language support ([94c98fb](https://github.com/Goose97/timber.nvim/commit/94c98fbb519f645a07392f8e4a2467e1e967a250))
* **javascript:** stricter call_expression ([235062f](https://github.com/Goose97/timber.nvim/commit/235062f45f40b88b5b1f6b8b15e3b4166a5be775))
* **javascript:** support log above for if and while statement ([797aa81](https://github.com/Goose97/timber.nvim/commit/797aa814b18e43b674de4bc7422347b7e6030ebe))
* **python:** add Python language support ([27ed6ff](https://github.com/Goose97/timber.nvim/commit/27ed6ff923f381495aad4d11e8846e97219ba66f))
* rename API buffer.clear_logs to buffer.clear_captured_logs ([0f7aacf](https://github.com/Goose97/timber.nvim/commit/0f7aacf600304eca74dc87573d4323484cedb897))
* **watcher:** display total entries in floating window footer ([0970c7d](https://github.com/Goose97/timber.nvim/commit/0970c7dfae67bcc5588ec5d9b159292d97c2db03))


### Bug Fixes

* failing CI ([cafacb6](https://github.com/Goose97/timber.nvim/commit/cafacb6eed5dd56fd4053d4f82af4d6ade5e9e6f))
* highlight group regression ([9d8514e](https://github.com/Goose97/timber.nvim/commit/9d8514ee3421de081567ae62a7718dfa6d845709))
* typo ([639e23b](https://github.com/Goose97/timber.nvim/commit/639e23b5562cd082b3908bdfef2f0cddbeb6a63e))

## 1.0.0 (2024-11-22)


### Features

* **batch:** support basic batching functionalities ([04554fe](https://github.com/Goose97/timber.nvim/commit/04554fef80cae4afea6a9346e0c2224fc00b26ba))
* **batch:** support batch log for javascript and typescript ([a7577f1](https://github.com/Goose97/timber.nvim/commit/a7577f1d41394e81140affe82b7988e3dc12c8b3))
* **config:** support default mappings out of the box ([9ddccb9](https://github.com/Goose97/timber.nvim/commit/9ddccb9b06000f09b8464d53568562a1716750c0))
* **core:** better error reporting ([5cdc368](https://github.com/Goose97/timber.nvim/commit/5cdc36876168984d7641db74ef6502611a225265))
* **core:** change core algorithm to support range operation ([acde8d7](https://github.com/Goose97/timber.nvim/commit/acde8d7cac0f76d15c92e7b39f70565b2e88d1ba))
* **core:** change indentation algorithm ([a17f5d4](https://github.com/Goose97/timber.nvim/commit/a17f5d4a09b3a3c2a49ff868e9f9af418e7e7488))
* **core:** deduplicate log targets ([37ee41a](https://github.com/Goose97/timber.nvim/commit/37ee41a80f5cf9760a411e8282617bfab07e2c10))
* **core:** handle overlapping log targets ([8a4a89d](https://github.com/Goose97/timber.nvim/commit/8a4a89d5651f6108dc17dbd46eddb98ec58bb123))
* **core:** more precise log location ([79aef86](https://github.com/Goose97/timber.nvim/commit/79aef8682c3f2e8fb32b6c724b3774337d37cd59))
* **core:** redesign log insert position detection ([25e1488](https://github.com/Goose97/timber.nvim/commit/25e14880acdc3826507646db243330d5b309c53c))
* **core:** simplify log template config ([ddda55f](https://github.com/Goose97/timber.nvim/commit/ddda55f7c29fbe4438f8215d7b107c3e636b889f))
* **core:** support %insert_line placeholder ([bb3e597](https://github.com/Goose97/timber.nvim/commit/bb3e597bcb2657a09e03c7a694ddc1410ebad63b))
* **core:** support auto_add for batch log ([af7d88c](https://github.com/Goose97/timber.nvim/commit/af7d88cbae7d451bd3a6d1317672b76e741eb4a9))
* **core:** support dot repeat ([cfb9817](https://github.com/Goose97/timber.nvim/commit/cfb9817175b786f635a6004c56743da3a579716a))
* **core:** support multi lines template ([eaf8121](https://github.com/Goose97/timber.nvim/commit/eaf8121e02c5b0b8f9ab15f8e83ceb6641402c49))
* **core:** support operator mode ([8924962](https://github.com/Goose97/timber.nvim/commit/892496219071379444ad03b5db8e50e1212147b0))
* **core:** support range selection ([f3171eb](https://github.com/Goose97/timber.nvim/commit/f3171eb26a93c72c5b08f757e8ceed1ffaef4aae))
* **core:** support surround log ([5d2a409](https://github.com/Goose97/timber.nvim/commit/5d2a40939deafe952f4e6f903efb78bc537b2e6e))
* **core:** update log templates config and support non-capture log ([21539f0](https://github.com/Goose97/timber.nvim/commit/21539f05b2016936c569143d4110f4a73166fdee))
* **core:** use custom notify function ([1f10b3a](https://github.com/Goose97/timber.nvim/commit/1f10b3ab3ae341e661fbe20f49fcb88204b69390))
* **elixir:** add Elixir language support ([99bec30](https://github.com/Goose97/timber.nvim/commit/99bec300389db073f3adc65dfc4579a9c513b2c8))
* **go:** add Go language support ([64333a8](https://github.com/Goose97/timber.nvim/commit/64333a80b9b0f28f21935a895c52d01b0f4fb94a))
* **highlight:** highlight insert log statements ([4e67b62](https://github.com/Goose97/timber.nvim/commit/4e67b6271aa13a4aa6b1973196ebeaea9769d7f6))
* **highlight:** highlight log targets after add to batch ([fa418a1](https://github.com/Goose97/timber.nvim/commit/fa418a13ae57d67f4f218d9db74dd0b7ed921b2c))
* **javascript:** allow logging member expression inside function call ([0c64385](https://github.com/Goose97/timber.nvim/commit/0c6438540c4a34bb5cb5d43a8e6db0d8c3bbbd23))
* **javascript:** match log targets inside function argument ([ca6fb5f](https://github.com/Goose97/timber.nvim/commit/ca6fb5f9f24e1353bbc83eac36ebb9c37e6dfd0c))
* **javascript:** more intuitive position logging with if/while/function block ([e08c382](https://github.com/Goose97/timber.nvim/commit/e08c38230f926981f7995b6248ece6f4c558ac6f))
* **javascript:** more test cases ([6f44821](https://github.com/Goose97/timber.nvim/commit/6f448219269b21c4fc3509f90f996da36364bb1a))
* **javascript:** restrict member access queries ([72e169d](https://github.com/Goose97/timber.nvim/commit/72e169dd667be810234805841e05e02668bc73e8))
* **javascript:** support for loop statement ([9ef1819](https://github.com/Goose97/timber.nvim/commit/9ef1819907a6a6cbdae76021de316b7b08c98808))
* **javascript:** support function expression and arrow function ([dc1f7e6](https://github.com/Goose97/timber.nvim/commit/dc1f7e648e2099cdbf3c274099fe76bf23a265a7))
* **javascript:** support if statement ([ce490ac](https://github.com/Goose97/timber.nvim/commit/ce490ac888c635dfafbe4dc6ced7440902334597))
* **javascript:** support javascript ([2a8d291](https://github.com/Goose97/timber.nvim/commit/2a8d29151e7d0baf6f59ceb35559fe27d77abd98))
* **javascript:** support object method defnition ([52c4dcb](https://github.com/Goose97/timber.nvim/commit/52c4dcbae87a2d2a6bcdf46a4bbab15c2c4734f7))
* **javascript:** support shorthand object in function arguments ([53e6d80](https://github.com/Goose97/timber.nvim/commit/53e6d801fe264134ed1dda55282da74d416bdddb))
* **javascript:** support switch statement ([12e7130](https://github.com/Goose97/timber.nvim/commit/12e7130227d8a490bafa088614ce50d57516d9b0))
* **javascript:** support while loop ([9072972](https://github.com/Goose97/timber.nvim/commit/9072972662830c92ecd7a4f85bfad81915910c41))
* **javasript:** ignore identifier and member access in function name ([60c5cb9](https://github.com/Goose97/timber.nvim/commit/60c5cb986d3f32932fc502731d9b575fd433c107))
* **jsx:** don't log function name in call expression ([e6c570a](https://github.com/Goose97/timber.nvim/commit/e6c570ac5379192de60a795c83f31c0ff86d86e4))
* **jsx:** support jsx ([35ffaba](https://github.com/Goose97/timber.nvim/commit/35ffabace125564f7d714a804bffd33187c8f0e2))
* **jsx:** support member expression ([b25fdfa](https://github.com/Goose97/timber.nvim/commit/b25fdfae0a170e9d651b51121eaaae23ba08f799))
* **lua:** add Lua default batch log template ([5c9eaeb](https://github.com/Goose97/timber.nvim/commit/5c9eaeb25c0beb9ccdd3f029d732faee9baf22bd))
* **lua:** basic support for Lua ([7d02805](https://github.com/Goose97/timber.nvim/commit/7d028052d23313de8f97e9418819d1f6a810d169))
* **lua:** expand more log targets ([5d43e98](https://github.com/Goose97/timber.nvim/commit/5d43e98ce49eb45ac2581e69520d262b9d2dcbed))
* **lua:** support for loop statement ([ab7f974](https://github.com/Goose97/timber.nvim/commit/ab7f9741336a3c3e8a76bbbfee34595bf16ba8b3))
* **lua:** support if statement ([8e5f43d](https://github.com/Goose97/timber.nvim/commit/8e5f43d64de2ad81969e035c8c8ede3fb4ec678a))
* **lua:** support while and repeat loop ([12eb731](https://github.com/Goose97/timber.nvim/commit/12eb7316ce67e6fbe9888132a95d78492f39c389))
* **ruby:** add Ruby language support ([a588e0a](https://github.com/Goose97/timber.nvim/commit/a588e0a5c75c1f86aacbc9e9cf1b1e825db50b6f))
* **rust:** add Rust language support ([f5d3342](https://github.com/Goose97/timber.nvim/commit/f5d334227c567d9974e1890fa3101a14b2700c31))
* **tsx:** support tsx ([e13306b](https://github.com/Goose97/timber.nvim/commit/e13306be0e44b9aae486e418ed53e77646db9032))
* **typescript:** handle more scenarios ([f1c8caf](https://github.com/Goose97/timber.nvim/commit/f1c8cafd9e6ce3cba88e813ded81b3625ec55d0e))
* **typescript:** support import statements ([1cc03ed](https://github.com/Goose97/timber.nvim/commit/1cc03edb623eac3d5803b921d1080e1d9cd31a75))
* **watcher:** add neotest source ([41908c3](https://github.com/Goose97/timber.nvim/commit/41908c3b59e92fc1a118ab58bb784c3c3a5751e5))
* **watcher:** detach buffers on BufDelete and BufWipeout ([78aba1c](https://github.com/Goose97/timber.nvim/commit/78aba1c4869027b0f55b2064b765394c9b11075c))
* **watcher:** improve watcher ([bd09905](https://github.com/Goose97/timber.nvim/commit/bd099055f2b89755cf24c9bdfdeadf12a248f782))
* **watcher:** init watcher feature ([6b8fc16](https://github.com/Goose97/timber.nvim/commit/6b8fc16bbe1e3c0ce3bfe64b439c20487fa1605b))
* **watcher:** stop watcher sources before quitting Neovim ([2b417b6](https://github.com/Goose97/timber.nvim/commit/2b417b6744fecbd4b695e518e83d1db717a3cf1d))
* **watcher:** support multiple log entries in a single placeholder ([fcdb0c3](https://github.com/Goose97/timber.nvim/commit/fcdb0c322337f48bb2cd1dc73faa7435b854b461))


### Bug Fixes

* **core:** incorrect order when log multiple targets ([f4c2b67](https://github.com/Goose97/timber.nvim/commit/f4c2b67504c5747244c53c60b043657d68f624a4))
* cursor does not preserve when log above ([55b4dc8](https://github.com/Goose97/timber.nvim/commit/55b4dc89914776011d5e02eefb14e550817397bd))
* fix upstream breaking changes ([3e27e21](https://github.com/Goose97/timber.nvim/commit/3e27e218e3663a29c10b2af41b8895e21fe8b581))
* flaky tests ([bbf3df8](https://github.com/Goose97/timber.nvim/commit/bbf3df8f6c5d2c04cfb88270f3deca949f31d4eb))
* **javascript:** account lines above when preserving cursor position ([9d20a86](https://github.com/Goose97/timber.nvim/commit/9d20a868963ee88b3937fded228628623a5720eb))
* **javascript:** object values inside arguments should be logable ([dedc77d](https://github.com/Goose97/timber.nvim/commit/dedc77d2360b28975762dfee43cfb798b7a2316e))
* **javascript:** refine function arguments logging ([6512ff1](https://github.com/Goose97/timber.nvim/commit/6512ff14eac096cfd1ca039fb572fe20fd29f34d))
* **typescript:** ignore type arguments ([8be9593](https://github.com/Goose97/timber.nvim/commit/8be9593557d5f3600d330b926fb5eb1414ca4c11))
