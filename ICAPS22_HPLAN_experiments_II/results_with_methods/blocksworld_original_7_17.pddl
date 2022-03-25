( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124265 - BLOCK
      ?auto_124266 - BLOCK
      ?auto_124267 - BLOCK
      ?auto_124268 - BLOCK
      ?auto_124269 - BLOCK
      ?auto_124270 - BLOCK
      ?auto_124271 - BLOCK
    )
    :vars
    (
      ?auto_124272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124272 ?auto_124271 ) ( CLEAR ?auto_124272 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124265 ) ( ON ?auto_124266 ?auto_124265 ) ( ON ?auto_124267 ?auto_124266 ) ( ON ?auto_124268 ?auto_124267 ) ( ON ?auto_124269 ?auto_124268 ) ( ON ?auto_124270 ?auto_124269 ) ( ON ?auto_124271 ?auto_124270 ) ( not ( = ?auto_124265 ?auto_124266 ) ) ( not ( = ?auto_124265 ?auto_124267 ) ) ( not ( = ?auto_124265 ?auto_124268 ) ) ( not ( = ?auto_124265 ?auto_124269 ) ) ( not ( = ?auto_124265 ?auto_124270 ) ) ( not ( = ?auto_124265 ?auto_124271 ) ) ( not ( = ?auto_124265 ?auto_124272 ) ) ( not ( = ?auto_124266 ?auto_124267 ) ) ( not ( = ?auto_124266 ?auto_124268 ) ) ( not ( = ?auto_124266 ?auto_124269 ) ) ( not ( = ?auto_124266 ?auto_124270 ) ) ( not ( = ?auto_124266 ?auto_124271 ) ) ( not ( = ?auto_124266 ?auto_124272 ) ) ( not ( = ?auto_124267 ?auto_124268 ) ) ( not ( = ?auto_124267 ?auto_124269 ) ) ( not ( = ?auto_124267 ?auto_124270 ) ) ( not ( = ?auto_124267 ?auto_124271 ) ) ( not ( = ?auto_124267 ?auto_124272 ) ) ( not ( = ?auto_124268 ?auto_124269 ) ) ( not ( = ?auto_124268 ?auto_124270 ) ) ( not ( = ?auto_124268 ?auto_124271 ) ) ( not ( = ?auto_124268 ?auto_124272 ) ) ( not ( = ?auto_124269 ?auto_124270 ) ) ( not ( = ?auto_124269 ?auto_124271 ) ) ( not ( = ?auto_124269 ?auto_124272 ) ) ( not ( = ?auto_124270 ?auto_124271 ) ) ( not ( = ?auto_124270 ?auto_124272 ) ) ( not ( = ?auto_124271 ?auto_124272 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124272 ?auto_124271 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124274 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_124274 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_124274 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124275 - BLOCK
    )
    :vars
    (
      ?auto_124276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124275 ?auto_124276 ) ( CLEAR ?auto_124275 ) ( HAND-EMPTY ) ( not ( = ?auto_124275 ?auto_124276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124275 ?auto_124276 )
      ( MAKE-1PILE ?auto_124275 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124283 - BLOCK
      ?auto_124284 - BLOCK
      ?auto_124285 - BLOCK
      ?auto_124286 - BLOCK
      ?auto_124287 - BLOCK
      ?auto_124288 - BLOCK
    )
    :vars
    (
      ?auto_124289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124289 ?auto_124288 ) ( CLEAR ?auto_124289 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124283 ) ( ON ?auto_124284 ?auto_124283 ) ( ON ?auto_124285 ?auto_124284 ) ( ON ?auto_124286 ?auto_124285 ) ( ON ?auto_124287 ?auto_124286 ) ( ON ?auto_124288 ?auto_124287 ) ( not ( = ?auto_124283 ?auto_124284 ) ) ( not ( = ?auto_124283 ?auto_124285 ) ) ( not ( = ?auto_124283 ?auto_124286 ) ) ( not ( = ?auto_124283 ?auto_124287 ) ) ( not ( = ?auto_124283 ?auto_124288 ) ) ( not ( = ?auto_124283 ?auto_124289 ) ) ( not ( = ?auto_124284 ?auto_124285 ) ) ( not ( = ?auto_124284 ?auto_124286 ) ) ( not ( = ?auto_124284 ?auto_124287 ) ) ( not ( = ?auto_124284 ?auto_124288 ) ) ( not ( = ?auto_124284 ?auto_124289 ) ) ( not ( = ?auto_124285 ?auto_124286 ) ) ( not ( = ?auto_124285 ?auto_124287 ) ) ( not ( = ?auto_124285 ?auto_124288 ) ) ( not ( = ?auto_124285 ?auto_124289 ) ) ( not ( = ?auto_124286 ?auto_124287 ) ) ( not ( = ?auto_124286 ?auto_124288 ) ) ( not ( = ?auto_124286 ?auto_124289 ) ) ( not ( = ?auto_124287 ?auto_124288 ) ) ( not ( = ?auto_124287 ?auto_124289 ) ) ( not ( = ?auto_124288 ?auto_124289 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124289 ?auto_124288 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124290 - BLOCK
      ?auto_124291 - BLOCK
      ?auto_124292 - BLOCK
      ?auto_124293 - BLOCK
      ?auto_124294 - BLOCK
      ?auto_124295 - BLOCK
    )
    :vars
    (
      ?auto_124296 - BLOCK
      ?auto_124297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124296 ?auto_124295 ) ( CLEAR ?auto_124296 ) ( ON-TABLE ?auto_124290 ) ( ON ?auto_124291 ?auto_124290 ) ( ON ?auto_124292 ?auto_124291 ) ( ON ?auto_124293 ?auto_124292 ) ( ON ?auto_124294 ?auto_124293 ) ( ON ?auto_124295 ?auto_124294 ) ( not ( = ?auto_124290 ?auto_124291 ) ) ( not ( = ?auto_124290 ?auto_124292 ) ) ( not ( = ?auto_124290 ?auto_124293 ) ) ( not ( = ?auto_124290 ?auto_124294 ) ) ( not ( = ?auto_124290 ?auto_124295 ) ) ( not ( = ?auto_124290 ?auto_124296 ) ) ( not ( = ?auto_124291 ?auto_124292 ) ) ( not ( = ?auto_124291 ?auto_124293 ) ) ( not ( = ?auto_124291 ?auto_124294 ) ) ( not ( = ?auto_124291 ?auto_124295 ) ) ( not ( = ?auto_124291 ?auto_124296 ) ) ( not ( = ?auto_124292 ?auto_124293 ) ) ( not ( = ?auto_124292 ?auto_124294 ) ) ( not ( = ?auto_124292 ?auto_124295 ) ) ( not ( = ?auto_124292 ?auto_124296 ) ) ( not ( = ?auto_124293 ?auto_124294 ) ) ( not ( = ?auto_124293 ?auto_124295 ) ) ( not ( = ?auto_124293 ?auto_124296 ) ) ( not ( = ?auto_124294 ?auto_124295 ) ) ( not ( = ?auto_124294 ?auto_124296 ) ) ( not ( = ?auto_124295 ?auto_124296 ) ) ( HOLDING ?auto_124297 ) ( not ( = ?auto_124290 ?auto_124297 ) ) ( not ( = ?auto_124291 ?auto_124297 ) ) ( not ( = ?auto_124292 ?auto_124297 ) ) ( not ( = ?auto_124293 ?auto_124297 ) ) ( not ( = ?auto_124294 ?auto_124297 ) ) ( not ( = ?auto_124295 ?auto_124297 ) ) ( not ( = ?auto_124296 ?auto_124297 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_124297 )
      ( MAKE-6PILE ?auto_124290 ?auto_124291 ?auto_124292 ?auto_124293 ?auto_124294 ?auto_124295 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124298 - BLOCK
      ?auto_124299 - BLOCK
      ?auto_124300 - BLOCK
      ?auto_124301 - BLOCK
      ?auto_124302 - BLOCK
      ?auto_124303 - BLOCK
    )
    :vars
    (
      ?auto_124305 - BLOCK
      ?auto_124304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124305 ?auto_124303 ) ( ON-TABLE ?auto_124298 ) ( ON ?auto_124299 ?auto_124298 ) ( ON ?auto_124300 ?auto_124299 ) ( ON ?auto_124301 ?auto_124300 ) ( ON ?auto_124302 ?auto_124301 ) ( ON ?auto_124303 ?auto_124302 ) ( not ( = ?auto_124298 ?auto_124299 ) ) ( not ( = ?auto_124298 ?auto_124300 ) ) ( not ( = ?auto_124298 ?auto_124301 ) ) ( not ( = ?auto_124298 ?auto_124302 ) ) ( not ( = ?auto_124298 ?auto_124303 ) ) ( not ( = ?auto_124298 ?auto_124305 ) ) ( not ( = ?auto_124299 ?auto_124300 ) ) ( not ( = ?auto_124299 ?auto_124301 ) ) ( not ( = ?auto_124299 ?auto_124302 ) ) ( not ( = ?auto_124299 ?auto_124303 ) ) ( not ( = ?auto_124299 ?auto_124305 ) ) ( not ( = ?auto_124300 ?auto_124301 ) ) ( not ( = ?auto_124300 ?auto_124302 ) ) ( not ( = ?auto_124300 ?auto_124303 ) ) ( not ( = ?auto_124300 ?auto_124305 ) ) ( not ( = ?auto_124301 ?auto_124302 ) ) ( not ( = ?auto_124301 ?auto_124303 ) ) ( not ( = ?auto_124301 ?auto_124305 ) ) ( not ( = ?auto_124302 ?auto_124303 ) ) ( not ( = ?auto_124302 ?auto_124305 ) ) ( not ( = ?auto_124303 ?auto_124305 ) ) ( not ( = ?auto_124298 ?auto_124304 ) ) ( not ( = ?auto_124299 ?auto_124304 ) ) ( not ( = ?auto_124300 ?auto_124304 ) ) ( not ( = ?auto_124301 ?auto_124304 ) ) ( not ( = ?auto_124302 ?auto_124304 ) ) ( not ( = ?auto_124303 ?auto_124304 ) ) ( not ( = ?auto_124305 ?auto_124304 ) ) ( ON ?auto_124304 ?auto_124305 ) ( CLEAR ?auto_124304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124298 ?auto_124299 ?auto_124300 ?auto_124301 ?auto_124302 ?auto_124303 ?auto_124305 )
      ( MAKE-6PILE ?auto_124298 ?auto_124299 ?auto_124300 ?auto_124301 ?auto_124302 ?auto_124303 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124308 - BLOCK
      ?auto_124309 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_124309 ) ( CLEAR ?auto_124308 ) ( ON-TABLE ?auto_124308 ) ( not ( = ?auto_124308 ?auto_124309 ) ) )
    :subtasks
    ( ( !STACK ?auto_124309 ?auto_124308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124310 - BLOCK
      ?auto_124311 - BLOCK
    )
    :vars
    (
      ?auto_124312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124310 ) ( ON-TABLE ?auto_124310 ) ( not ( = ?auto_124310 ?auto_124311 ) ) ( ON ?auto_124311 ?auto_124312 ) ( CLEAR ?auto_124311 ) ( HAND-EMPTY ) ( not ( = ?auto_124310 ?auto_124312 ) ) ( not ( = ?auto_124311 ?auto_124312 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124311 ?auto_124312 )
      ( MAKE-2PILE ?auto_124310 ?auto_124311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124313 - BLOCK
      ?auto_124314 - BLOCK
    )
    :vars
    (
      ?auto_124315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124313 ?auto_124314 ) ) ( ON ?auto_124314 ?auto_124315 ) ( CLEAR ?auto_124314 ) ( not ( = ?auto_124313 ?auto_124315 ) ) ( not ( = ?auto_124314 ?auto_124315 ) ) ( HOLDING ?auto_124313 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124313 )
      ( MAKE-2PILE ?auto_124313 ?auto_124314 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124316 - BLOCK
      ?auto_124317 - BLOCK
    )
    :vars
    (
      ?auto_124318 - BLOCK
      ?auto_124319 - BLOCK
      ?auto_124320 - BLOCK
      ?auto_124322 - BLOCK
      ?auto_124323 - BLOCK
      ?auto_124321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124316 ?auto_124317 ) ) ( ON ?auto_124317 ?auto_124318 ) ( not ( = ?auto_124316 ?auto_124318 ) ) ( not ( = ?auto_124317 ?auto_124318 ) ) ( ON ?auto_124316 ?auto_124317 ) ( CLEAR ?auto_124316 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124319 ) ( ON ?auto_124320 ?auto_124319 ) ( ON ?auto_124322 ?auto_124320 ) ( ON ?auto_124323 ?auto_124322 ) ( ON ?auto_124321 ?auto_124323 ) ( ON ?auto_124318 ?auto_124321 ) ( not ( = ?auto_124319 ?auto_124320 ) ) ( not ( = ?auto_124319 ?auto_124322 ) ) ( not ( = ?auto_124319 ?auto_124323 ) ) ( not ( = ?auto_124319 ?auto_124321 ) ) ( not ( = ?auto_124319 ?auto_124318 ) ) ( not ( = ?auto_124319 ?auto_124317 ) ) ( not ( = ?auto_124319 ?auto_124316 ) ) ( not ( = ?auto_124320 ?auto_124322 ) ) ( not ( = ?auto_124320 ?auto_124323 ) ) ( not ( = ?auto_124320 ?auto_124321 ) ) ( not ( = ?auto_124320 ?auto_124318 ) ) ( not ( = ?auto_124320 ?auto_124317 ) ) ( not ( = ?auto_124320 ?auto_124316 ) ) ( not ( = ?auto_124322 ?auto_124323 ) ) ( not ( = ?auto_124322 ?auto_124321 ) ) ( not ( = ?auto_124322 ?auto_124318 ) ) ( not ( = ?auto_124322 ?auto_124317 ) ) ( not ( = ?auto_124322 ?auto_124316 ) ) ( not ( = ?auto_124323 ?auto_124321 ) ) ( not ( = ?auto_124323 ?auto_124318 ) ) ( not ( = ?auto_124323 ?auto_124317 ) ) ( not ( = ?auto_124323 ?auto_124316 ) ) ( not ( = ?auto_124321 ?auto_124318 ) ) ( not ( = ?auto_124321 ?auto_124317 ) ) ( not ( = ?auto_124321 ?auto_124316 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124319 ?auto_124320 ?auto_124322 ?auto_124323 ?auto_124321 ?auto_124318 ?auto_124317 )
      ( MAKE-2PILE ?auto_124316 ?auto_124317 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124329 - BLOCK
      ?auto_124330 - BLOCK
      ?auto_124331 - BLOCK
      ?auto_124332 - BLOCK
      ?auto_124333 - BLOCK
    )
    :vars
    (
      ?auto_124334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124334 ?auto_124333 ) ( CLEAR ?auto_124334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124329 ) ( ON ?auto_124330 ?auto_124329 ) ( ON ?auto_124331 ?auto_124330 ) ( ON ?auto_124332 ?auto_124331 ) ( ON ?auto_124333 ?auto_124332 ) ( not ( = ?auto_124329 ?auto_124330 ) ) ( not ( = ?auto_124329 ?auto_124331 ) ) ( not ( = ?auto_124329 ?auto_124332 ) ) ( not ( = ?auto_124329 ?auto_124333 ) ) ( not ( = ?auto_124329 ?auto_124334 ) ) ( not ( = ?auto_124330 ?auto_124331 ) ) ( not ( = ?auto_124330 ?auto_124332 ) ) ( not ( = ?auto_124330 ?auto_124333 ) ) ( not ( = ?auto_124330 ?auto_124334 ) ) ( not ( = ?auto_124331 ?auto_124332 ) ) ( not ( = ?auto_124331 ?auto_124333 ) ) ( not ( = ?auto_124331 ?auto_124334 ) ) ( not ( = ?auto_124332 ?auto_124333 ) ) ( not ( = ?auto_124332 ?auto_124334 ) ) ( not ( = ?auto_124333 ?auto_124334 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124334 ?auto_124333 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124335 - BLOCK
      ?auto_124336 - BLOCK
      ?auto_124337 - BLOCK
      ?auto_124338 - BLOCK
      ?auto_124339 - BLOCK
    )
    :vars
    (
      ?auto_124340 - BLOCK
      ?auto_124341 - BLOCK
      ?auto_124342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124340 ?auto_124339 ) ( CLEAR ?auto_124340 ) ( ON-TABLE ?auto_124335 ) ( ON ?auto_124336 ?auto_124335 ) ( ON ?auto_124337 ?auto_124336 ) ( ON ?auto_124338 ?auto_124337 ) ( ON ?auto_124339 ?auto_124338 ) ( not ( = ?auto_124335 ?auto_124336 ) ) ( not ( = ?auto_124335 ?auto_124337 ) ) ( not ( = ?auto_124335 ?auto_124338 ) ) ( not ( = ?auto_124335 ?auto_124339 ) ) ( not ( = ?auto_124335 ?auto_124340 ) ) ( not ( = ?auto_124336 ?auto_124337 ) ) ( not ( = ?auto_124336 ?auto_124338 ) ) ( not ( = ?auto_124336 ?auto_124339 ) ) ( not ( = ?auto_124336 ?auto_124340 ) ) ( not ( = ?auto_124337 ?auto_124338 ) ) ( not ( = ?auto_124337 ?auto_124339 ) ) ( not ( = ?auto_124337 ?auto_124340 ) ) ( not ( = ?auto_124338 ?auto_124339 ) ) ( not ( = ?auto_124338 ?auto_124340 ) ) ( not ( = ?auto_124339 ?auto_124340 ) ) ( HOLDING ?auto_124341 ) ( CLEAR ?auto_124342 ) ( not ( = ?auto_124335 ?auto_124341 ) ) ( not ( = ?auto_124335 ?auto_124342 ) ) ( not ( = ?auto_124336 ?auto_124341 ) ) ( not ( = ?auto_124336 ?auto_124342 ) ) ( not ( = ?auto_124337 ?auto_124341 ) ) ( not ( = ?auto_124337 ?auto_124342 ) ) ( not ( = ?auto_124338 ?auto_124341 ) ) ( not ( = ?auto_124338 ?auto_124342 ) ) ( not ( = ?auto_124339 ?auto_124341 ) ) ( not ( = ?auto_124339 ?auto_124342 ) ) ( not ( = ?auto_124340 ?auto_124341 ) ) ( not ( = ?auto_124340 ?auto_124342 ) ) ( not ( = ?auto_124341 ?auto_124342 ) ) )
    :subtasks
    ( ( !STACK ?auto_124341 ?auto_124342 )
      ( MAKE-5PILE ?auto_124335 ?auto_124336 ?auto_124337 ?auto_124338 ?auto_124339 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124343 - BLOCK
      ?auto_124344 - BLOCK
      ?auto_124345 - BLOCK
      ?auto_124346 - BLOCK
      ?auto_124347 - BLOCK
    )
    :vars
    (
      ?auto_124349 - BLOCK
      ?auto_124348 - BLOCK
      ?auto_124350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124349 ?auto_124347 ) ( ON-TABLE ?auto_124343 ) ( ON ?auto_124344 ?auto_124343 ) ( ON ?auto_124345 ?auto_124344 ) ( ON ?auto_124346 ?auto_124345 ) ( ON ?auto_124347 ?auto_124346 ) ( not ( = ?auto_124343 ?auto_124344 ) ) ( not ( = ?auto_124343 ?auto_124345 ) ) ( not ( = ?auto_124343 ?auto_124346 ) ) ( not ( = ?auto_124343 ?auto_124347 ) ) ( not ( = ?auto_124343 ?auto_124349 ) ) ( not ( = ?auto_124344 ?auto_124345 ) ) ( not ( = ?auto_124344 ?auto_124346 ) ) ( not ( = ?auto_124344 ?auto_124347 ) ) ( not ( = ?auto_124344 ?auto_124349 ) ) ( not ( = ?auto_124345 ?auto_124346 ) ) ( not ( = ?auto_124345 ?auto_124347 ) ) ( not ( = ?auto_124345 ?auto_124349 ) ) ( not ( = ?auto_124346 ?auto_124347 ) ) ( not ( = ?auto_124346 ?auto_124349 ) ) ( not ( = ?auto_124347 ?auto_124349 ) ) ( CLEAR ?auto_124348 ) ( not ( = ?auto_124343 ?auto_124350 ) ) ( not ( = ?auto_124343 ?auto_124348 ) ) ( not ( = ?auto_124344 ?auto_124350 ) ) ( not ( = ?auto_124344 ?auto_124348 ) ) ( not ( = ?auto_124345 ?auto_124350 ) ) ( not ( = ?auto_124345 ?auto_124348 ) ) ( not ( = ?auto_124346 ?auto_124350 ) ) ( not ( = ?auto_124346 ?auto_124348 ) ) ( not ( = ?auto_124347 ?auto_124350 ) ) ( not ( = ?auto_124347 ?auto_124348 ) ) ( not ( = ?auto_124349 ?auto_124350 ) ) ( not ( = ?auto_124349 ?auto_124348 ) ) ( not ( = ?auto_124350 ?auto_124348 ) ) ( ON ?auto_124350 ?auto_124349 ) ( CLEAR ?auto_124350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124343 ?auto_124344 ?auto_124345 ?auto_124346 ?auto_124347 ?auto_124349 )
      ( MAKE-5PILE ?auto_124343 ?auto_124344 ?auto_124345 ?auto_124346 ?auto_124347 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124351 - BLOCK
      ?auto_124352 - BLOCK
      ?auto_124353 - BLOCK
      ?auto_124354 - BLOCK
      ?auto_124355 - BLOCK
    )
    :vars
    (
      ?auto_124358 - BLOCK
      ?auto_124356 - BLOCK
      ?auto_124357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124358 ?auto_124355 ) ( ON-TABLE ?auto_124351 ) ( ON ?auto_124352 ?auto_124351 ) ( ON ?auto_124353 ?auto_124352 ) ( ON ?auto_124354 ?auto_124353 ) ( ON ?auto_124355 ?auto_124354 ) ( not ( = ?auto_124351 ?auto_124352 ) ) ( not ( = ?auto_124351 ?auto_124353 ) ) ( not ( = ?auto_124351 ?auto_124354 ) ) ( not ( = ?auto_124351 ?auto_124355 ) ) ( not ( = ?auto_124351 ?auto_124358 ) ) ( not ( = ?auto_124352 ?auto_124353 ) ) ( not ( = ?auto_124352 ?auto_124354 ) ) ( not ( = ?auto_124352 ?auto_124355 ) ) ( not ( = ?auto_124352 ?auto_124358 ) ) ( not ( = ?auto_124353 ?auto_124354 ) ) ( not ( = ?auto_124353 ?auto_124355 ) ) ( not ( = ?auto_124353 ?auto_124358 ) ) ( not ( = ?auto_124354 ?auto_124355 ) ) ( not ( = ?auto_124354 ?auto_124358 ) ) ( not ( = ?auto_124355 ?auto_124358 ) ) ( not ( = ?auto_124351 ?auto_124356 ) ) ( not ( = ?auto_124351 ?auto_124357 ) ) ( not ( = ?auto_124352 ?auto_124356 ) ) ( not ( = ?auto_124352 ?auto_124357 ) ) ( not ( = ?auto_124353 ?auto_124356 ) ) ( not ( = ?auto_124353 ?auto_124357 ) ) ( not ( = ?auto_124354 ?auto_124356 ) ) ( not ( = ?auto_124354 ?auto_124357 ) ) ( not ( = ?auto_124355 ?auto_124356 ) ) ( not ( = ?auto_124355 ?auto_124357 ) ) ( not ( = ?auto_124358 ?auto_124356 ) ) ( not ( = ?auto_124358 ?auto_124357 ) ) ( not ( = ?auto_124356 ?auto_124357 ) ) ( ON ?auto_124356 ?auto_124358 ) ( CLEAR ?auto_124356 ) ( HOLDING ?auto_124357 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124357 )
      ( MAKE-5PILE ?auto_124351 ?auto_124352 ?auto_124353 ?auto_124354 ?auto_124355 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124359 - BLOCK
      ?auto_124360 - BLOCK
      ?auto_124361 - BLOCK
      ?auto_124362 - BLOCK
      ?auto_124363 - BLOCK
    )
    :vars
    (
      ?auto_124364 - BLOCK
      ?auto_124366 - BLOCK
      ?auto_124365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124364 ?auto_124363 ) ( ON-TABLE ?auto_124359 ) ( ON ?auto_124360 ?auto_124359 ) ( ON ?auto_124361 ?auto_124360 ) ( ON ?auto_124362 ?auto_124361 ) ( ON ?auto_124363 ?auto_124362 ) ( not ( = ?auto_124359 ?auto_124360 ) ) ( not ( = ?auto_124359 ?auto_124361 ) ) ( not ( = ?auto_124359 ?auto_124362 ) ) ( not ( = ?auto_124359 ?auto_124363 ) ) ( not ( = ?auto_124359 ?auto_124364 ) ) ( not ( = ?auto_124360 ?auto_124361 ) ) ( not ( = ?auto_124360 ?auto_124362 ) ) ( not ( = ?auto_124360 ?auto_124363 ) ) ( not ( = ?auto_124360 ?auto_124364 ) ) ( not ( = ?auto_124361 ?auto_124362 ) ) ( not ( = ?auto_124361 ?auto_124363 ) ) ( not ( = ?auto_124361 ?auto_124364 ) ) ( not ( = ?auto_124362 ?auto_124363 ) ) ( not ( = ?auto_124362 ?auto_124364 ) ) ( not ( = ?auto_124363 ?auto_124364 ) ) ( not ( = ?auto_124359 ?auto_124366 ) ) ( not ( = ?auto_124359 ?auto_124365 ) ) ( not ( = ?auto_124360 ?auto_124366 ) ) ( not ( = ?auto_124360 ?auto_124365 ) ) ( not ( = ?auto_124361 ?auto_124366 ) ) ( not ( = ?auto_124361 ?auto_124365 ) ) ( not ( = ?auto_124362 ?auto_124366 ) ) ( not ( = ?auto_124362 ?auto_124365 ) ) ( not ( = ?auto_124363 ?auto_124366 ) ) ( not ( = ?auto_124363 ?auto_124365 ) ) ( not ( = ?auto_124364 ?auto_124366 ) ) ( not ( = ?auto_124364 ?auto_124365 ) ) ( not ( = ?auto_124366 ?auto_124365 ) ) ( ON ?auto_124366 ?auto_124364 ) ( ON ?auto_124365 ?auto_124366 ) ( CLEAR ?auto_124365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124359 ?auto_124360 ?auto_124361 ?auto_124362 ?auto_124363 ?auto_124364 ?auto_124366 )
      ( MAKE-5PILE ?auto_124359 ?auto_124360 ?auto_124361 ?auto_124362 ?auto_124363 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124370 - BLOCK
      ?auto_124371 - BLOCK
      ?auto_124372 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_124372 ) ( CLEAR ?auto_124371 ) ( ON-TABLE ?auto_124370 ) ( ON ?auto_124371 ?auto_124370 ) ( not ( = ?auto_124370 ?auto_124371 ) ) ( not ( = ?auto_124370 ?auto_124372 ) ) ( not ( = ?auto_124371 ?auto_124372 ) ) )
    :subtasks
    ( ( !STACK ?auto_124372 ?auto_124371 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124373 - BLOCK
      ?auto_124374 - BLOCK
      ?auto_124375 - BLOCK
    )
    :vars
    (
      ?auto_124376 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124374 ) ( ON-TABLE ?auto_124373 ) ( ON ?auto_124374 ?auto_124373 ) ( not ( = ?auto_124373 ?auto_124374 ) ) ( not ( = ?auto_124373 ?auto_124375 ) ) ( not ( = ?auto_124374 ?auto_124375 ) ) ( ON ?auto_124375 ?auto_124376 ) ( CLEAR ?auto_124375 ) ( HAND-EMPTY ) ( not ( = ?auto_124373 ?auto_124376 ) ) ( not ( = ?auto_124374 ?auto_124376 ) ) ( not ( = ?auto_124375 ?auto_124376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124375 ?auto_124376 )
      ( MAKE-3PILE ?auto_124373 ?auto_124374 ?auto_124375 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124377 - BLOCK
      ?auto_124378 - BLOCK
      ?auto_124379 - BLOCK
    )
    :vars
    (
      ?auto_124380 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124377 ) ( not ( = ?auto_124377 ?auto_124378 ) ) ( not ( = ?auto_124377 ?auto_124379 ) ) ( not ( = ?auto_124378 ?auto_124379 ) ) ( ON ?auto_124379 ?auto_124380 ) ( CLEAR ?auto_124379 ) ( not ( = ?auto_124377 ?auto_124380 ) ) ( not ( = ?auto_124378 ?auto_124380 ) ) ( not ( = ?auto_124379 ?auto_124380 ) ) ( HOLDING ?auto_124378 ) ( CLEAR ?auto_124377 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124377 ?auto_124378 )
      ( MAKE-3PILE ?auto_124377 ?auto_124378 ?auto_124379 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124381 - BLOCK
      ?auto_124382 - BLOCK
      ?auto_124383 - BLOCK
    )
    :vars
    (
      ?auto_124384 - BLOCK
      ?auto_124386 - BLOCK
      ?auto_124388 - BLOCK
      ?auto_124385 - BLOCK
      ?auto_124387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124381 ) ( not ( = ?auto_124381 ?auto_124382 ) ) ( not ( = ?auto_124381 ?auto_124383 ) ) ( not ( = ?auto_124382 ?auto_124383 ) ) ( ON ?auto_124383 ?auto_124384 ) ( not ( = ?auto_124381 ?auto_124384 ) ) ( not ( = ?auto_124382 ?auto_124384 ) ) ( not ( = ?auto_124383 ?auto_124384 ) ) ( CLEAR ?auto_124381 ) ( ON ?auto_124382 ?auto_124383 ) ( CLEAR ?auto_124382 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124386 ) ( ON ?auto_124388 ?auto_124386 ) ( ON ?auto_124385 ?auto_124388 ) ( ON ?auto_124387 ?auto_124385 ) ( ON ?auto_124384 ?auto_124387 ) ( not ( = ?auto_124386 ?auto_124388 ) ) ( not ( = ?auto_124386 ?auto_124385 ) ) ( not ( = ?auto_124386 ?auto_124387 ) ) ( not ( = ?auto_124386 ?auto_124384 ) ) ( not ( = ?auto_124386 ?auto_124383 ) ) ( not ( = ?auto_124386 ?auto_124382 ) ) ( not ( = ?auto_124388 ?auto_124385 ) ) ( not ( = ?auto_124388 ?auto_124387 ) ) ( not ( = ?auto_124388 ?auto_124384 ) ) ( not ( = ?auto_124388 ?auto_124383 ) ) ( not ( = ?auto_124388 ?auto_124382 ) ) ( not ( = ?auto_124385 ?auto_124387 ) ) ( not ( = ?auto_124385 ?auto_124384 ) ) ( not ( = ?auto_124385 ?auto_124383 ) ) ( not ( = ?auto_124385 ?auto_124382 ) ) ( not ( = ?auto_124387 ?auto_124384 ) ) ( not ( = ?auto_124387 ?auto_124383 ) ) ( not ( = ?auto_124387 ?auto_124382 ) ) ( not ( = ?auto_124381 ?auto_124386 ) ) ( not ( = ?auto_124381 ?auto_124388 ) ) ( not ( = ?auto_124381 ?auto_124385 ) ) ( not ( = ?auto_124381 ?auto_124387 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124386 ?auto_124388 ?auto_124385 ?auto_124387 ?auto_124384 ?auto_124383 )
      ( MAKE-3PILE ?auto_124381 ?auto_124382 ?auto_124383 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124389 - BLOCK
      ?auto_124390 - BLOCK
      ?auto_124391 - BLOCK
    )
    :vars
    (
      ?auto_124395 - BLOCK
      ?auto_124393 - BLOCK
      ?auto_124396 - BLOCK
      ?auto_124392 - BLOCK
      ?auto_124394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124389 ?auto_124390 ) ) ( not ( = ?auto_124389 ?auto_124391 ) ) ( not ( = ?auto_124390 ?auto_124391 ) ) ( ON ?auto_124391 ?auto_124395 ) ( not ( = ?auto_124389 ?auto_124395 ) ) ( not ( = ?auto_124390 ?auto_124395 ) ) ( not ( = ?auto_124391 ?auto_124395 ) ) ( ON ?auto_124390 ?auto_124391 ) ( CLEAR ?auto_124390 ) ( ON-TABLE ?auto_124393 ) ( ON ?auto_124396 ?auto_124393 ) ( ON ?auto_124392 ?auto_124396 ) ( ON ?auto_124394 ?auto_124392 ) ( ON ?auto_124395 ?auto_124394 ) ( not ( = ?auto_124393 ?auto_124396 ) ) ( not ( = ?auto_124393 ?auto_124392 ) ) ( not ( = ?auto_124393 ?auto_124394 ) ) ( not ( = ?auto_124393 ?auto_124395 ) ) ( not ( = ?auto_124393 ?auto_124391 ) ) ( not ( = ?auto_124393 ?auto_124390 ) ) ( not ( = ?auto_124396 ?auto_124392 ) ) ( not ( = ?auto_124396 ?auto_124394 ) ) ( not ( = ?auto_124396 ?auto_124395 ) ) ( not ( = ?auto_124396 ?auto_124391 ) ) ( not ( = ?auto_124396 ?auto_124390 ) ) ( not ( = ?auto_124392 ?auto_124394 ) ) ( not ( = ?auto_124392 ?auto_124395 ) ) ( not ( = ?auto_124392 ?auto_124391 ) ) ( not ( = ?auto_124392 ?auto_124390 ) ) ( not ( = ?auto_124394 ?auto_124395 ) ) ( not ( = ?auto_124394 ?auto_124391 ) ) ( not ( = ?auto_124394 ?auto_124390 ) ) ( not ( = ?auto_124389 ?auto_124393 ) ) ( not ( = ?auto_124389 ?auto_124396 ) ) ( not ( = ?auto_124389 ?auto_124392 ) ) ( not ( = ?auto_124389 ?auto_124394 ) ) ( HOLDING ?auto_124389 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124389 )
      ( MAKE-3PILE ?auto_124389 ?auto_124390 ?auto_124391 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124397 - BLOCK
      ?auto_124398 - BLOCK
      ?auto_124399 - BLOCK
    )
    :vars
    (
      ?auto_124404 - BLOCK
      ?auto_124402 - BLOCK
      ?auto_124403 - BLOCK
      ?auto_124401 - BLOCK
      ?auto_124400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124397 ?auto_124398 ) ) ( not ( = ?auto_124397 ?auto_124399 ) ) ( not ( = ?auto_124398 ?auto_124399 ) ) ( ON ?auto_124399 ?auto_124404 ) ( not ( = ?auto_124397 ?auto_124404 ) ) ( not ( = ?auto_124398 ?auto_124404 ) ) ( not ( = ?auto_124399 ?auto_124404 ) ) ( ON ?auto_124398 ?auto_124399 ) ( ON-TABLE ?auto_124402 ) ( ON ?auto_124403 ?auto_124402 ) ( ON ?auto_124401 ?auto_124403 ) ( ON ?auto_124400 ?auto_124401 ) ( ON ?auto_124404 ?auto_124400 ) ( not ( = ?auto_124402 ?auto_124403 ) ) ( not ( = ?auto_124402 ?auto_124401 ) ) ( not ( = ?auto_124402 ?auto_124400 ) ) ( not ( = ?auto_124402 ?auto_124404 ) ) ( not ( = ?auto_124402 ?auto_124399 ) ) ( not ( = ?auto_124402 ?auto_124398 ) ) ( not ( = ?auto_124403 ?auto_124401 ) ) ( not ( = ?auto_124403 ?auto_124400 ) ) ( not ( = ?auto_124403 ?auto_124404 ) ) ( not ( = ?auto_124403 ?auto_124399 ) ) ( not ( = ?auto_124403 ?auto_124398 ) ) ( not ( = ?auto_124401 ?auto_124400 ) ) ( not ( = ?auto_124401 ?auto_124404 ) ) ( not ( = ?auto_124401 ?auto_124399 ) ) ( not ( = ?auto_124401 ?auto_124398 ) ) ( not ( = ?auto_124400 ?auto_124404 ) ) ( not ( = ?auto_124400 ?auto_124399 ) ) ( not ( = ?auto_124400 ?auto_124398 ) ) ( not ( = ?auto_124397 ?auto_124402 ) ) ( not ( = ?auto_124397 ?auto_124403 ) ) ( not ( = ?auto_124397 ?auto_124401 ) ) ( not ( = ?auto_124397 ?auto_124400 ) ) ( ON ?auto_124397 ?auto_124398 ) ( CLEAR ?auto_124397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124402 ?auto_124403 ?auto_124401 ?auto_124400 ?auto_124404 ?auto_124399 ?auto_124398 )
      ( MAKE-3PILE ?auto_124397 ?auto_124398 ?auto_124399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124409 - BLOCK
      ?auto_124410 - BLOCK
      ?auto_124411 - BLOCK
      ?auto_124412 - BLOCK
    )
    :vars
    (
      ?auto_124413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124413 ?auto_124412 ) ( CLEAR ?auto_124413 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124409 ) ( ON ?auto_124410 ?auto_124409 ) ( ON ?auto_124411 ?auto_124410 ) ( ON ?auto_124412 ?auto_124411 ) ( not ( = ?auto_124409 ?auto_124410 ) ) ( not ( = ?auto_124409 ?auto_124411 ) ) ( not ( = ?auto_124409 ?auto_124412 ) ) ( not ( = ?auto_124409 ?auto_124413 ) ) ( not ( = ?auto_124410 ?auto_124411 ) ) ( not ( = ?auto_124410 ?auto_124412 ) ) ( not ( = ?auto_124410 ?auto_124413 ) ) ( not ( = ?auto_124411 ?auto_124412 ) ) ( not ( = ?auto_124411 ?auto_124413 ) ) ( not ( = ?auto_124412 ?auto_124413 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124413 ?auto_124412 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124414 - BLOCK
      ?auto_124415 - BLOCK
      ?auto_124416 - BLOCK
      ?auto_124417 - BLOCK
    )
    :vars
    (
      ?auto_124418 - BLOCK
      ?auto_124419 - BLOCK
      ?auto_124420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124418 ?auto_124417 ) ( CLEAR ?auto_124418 ) ( ON-TABLE ?auto_124414 ) ( ON ?auto_124415 ?auto_124414 ) ( ON ?auto_124416 ?auto_124415 ) ( ON ?auto_124417 ?auto_124416 ) ( not ( = ?auto_124414 ?auto_124415 ) ) ( not ( = ?auto_124414 ?auto_124416 ) ) ( not ( = ?auto_124414 ?auto_124417 ) ) ( not ( = ?auto_124414 ?auto_124418 ) ) ( not ( = ?auto_124415 ?auto_124416 ) ) ( not ( = ?auto_124415 ?auto_124417 ) ) ( not ( = ?auto_124415 ?auto_124418 ) ) ( not ( = ?auto_124416 ?auto_124417 ) ) ( not ( = ?auto_124416 ?auto_124418 ) ) ( not ( = ?auto_124417 ?auto_124418 ) ) ( HOLDING ?auto_124419 ) ( CLEAR ?auto_124420 ) ( not ( = ?auto_124414 ?auto_124419 ) ) ( not ( = ?auto_124414 ?auto_124420 ) ) ( not ( = ?auto_124415 ?auto_124419 ) ) ( not ( = ?auto_124415 ?auto_124420 ) ) ( not ( = ?auto_124416 ?auto_124419 ) ) ( not ( = ?auto_124416 ?auto_124420 ) ) ( not ( = ?auto_124417 ?auto_124419 ) ) ( not ( = ?auto_124417 ?auto_124420 ) ) ( not ( = ?auto_124418 ?auto_124419 ) ) ( not ( = ?auto_124418 ?auto_124420 ) ) ( not ( = ?auto_124419 ?auto_124420 ) ) )
    :subtasks
    ( ( !STACK ?auto_124419 ?auto_124420 )
      ( MAKE-4PILE ?auto_124414 ?auto_124415 ?auto_124416 ?auto_124417 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124421 - BLOCK
      ?auto_124422 - BLOCK
      ?auto_124423 - BLOCK
      ?auto_124424 - BLOCK
    )
    :vars
    (
      ?auto_124426 - BLOCK
      ?auto_124425 - BLOCK
      ?auto_124427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124426 ?auto_124424 ) ( ON-TABLE ?auto_124421 ) ( ON ?auto_124422 ?auto_124421 ) ( ON ?auto_124423 ?auto_124422 ) ( ON ?auto_124424 ?auto_124423 ) ( not ( = ?auto_124421 ?auto_124422 ) ) ( not ( = ?auto_124421 ?auto_124423 ) ) ( not ( = ?auto_124421 ?auto_124424 ) ) ( not ( = ?auto_124421 ?auto_124426 ) ) ( not ( = ?auto_124422 ?auto_124423 ) ) ( not ( = ?auto_124422 ?auto_124424 ) ) ( not ( = ?auto_124422 ?auto_124426 ) ) ( not ( = ?auto_124423 ?auto_124424 ) ) ( not ( = ?auto_124423 ?auto_124426 ) ) ( not ( = ?auto_124424 ?auto_124426 ) ) ( CLEAR ?auto_124425 ) ( not ( = ?auto_124421 ?auto_124427 ) ) ( not ( = ?auto_124421 ?auto_124425 ) ) ( not ( = ?auto_124422 ?auto_124427 ) ) ( not ( = ?auto_124422 ?auto_124425 ) ) ( not ( = ?auto_124423 ?auto_124427 ) ) ( not ( = ?auto_124423 ?auto_124425 ) ) ( not ( = ?auto_124424 ?auto_124427 ) ) ( not ( = ?auto_124424 ?auto_124425 ) ) ( not ( = ?auto_124426 ?auto_124427 ) ) ( not ( = ?auto_124426 ?auto_124425 ) ) ( not ( = ?auto_124427 ?auto_124425 ) ) ( ON ?auto_124427 ?auto_124426 ) ( CLEAR ?auto_124427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124421 ?auto_124422 ?auto_124423 ?auto_124424 ?auto_124426 )
      ( MAKE-4PILE ?auto_124421 ?auto_124422 ?auto_124423 ?auto_124424 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124428 - BLOCK
      ?auto_124429 - BLOCK
      ?auto_124430 - BLOCK
      ?auto_124431 - BLOCK
    )
    :vars
    (
      ?auto_124432 - BLOCK
      ?auto_124434 - BLOCK
      ?auto_124433 - BLOCK
      ?auto_124435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124432 ?auto_124431 ) ( ON-TABLE ?auto_124428 ) ( ON ?auto_124429 ?auto_124428 ) ( ON ?auto_124430 ?auto_124429 ) ( ON ?auto_124431 ?auto_124430 ) ( not ( = ?auto_124428 ?auto_124429 ) ) ( not ( = ?auto_124428 ?auto_124430 ) ) ( not ( = ?auto_124428 ?auto_124431 ) ) ( not ( = ?auto_124428 ?auto_124432 ) ) ( not ( = ?auto_124429 ?auto_124430 ) ) ( not ( = ?auto_124429 ?auto_124431 ) ) ( not ( = ?auto_124429 ?auto_124432 ) ) ( not ( = ?auto_124430 ?auto_124431 ) ) ( not ( = ?auto_124430 ?auto_124432 ) ) ( not ( = ?auto_124431 ?auto_124432 ) ) ( not ( = ?auto_124428 ?auto_124434 ) ) ( not ( = ?auto_124428 ?auto_124433 ) ) ( not ( = ?auto_124429 ?auto_124434 ) ) ( not ( = ?auto_124429 ?auto_124433 ) ) ( not ( = ?auto_124430 ?auto_124434 ) ) ( not ( = ?auto_124430 ?auto_124433 ) ) ( not ( = ?auto_124431 ?auto_124434 ) ) ( not ( = ?auto_124431 ?auto_124433 ) ) ( not ( = ?auto_124432 ?auto_124434 ) ) ( not ( = ?auto_124432 ?auto_124433 ) ) ( not ( = ?auto_124434 ?auto_124433 ) ) ( ON ?auto_124434 ?auto_124432 ) ( CLEAR ?auto_124434 ) ( HOLDING ?auto_124433 ) ( CLEAR ?auto_124435 ) ( ON-TABLE ?auto_124435 ) ( not ( = ?auto_124435 ?auto_124433 ) ) ( not ( = ?auto_124428 ?auto_124435 ) ) ( not ( = ?auto_124429 ?auto_124435 ) ) ( not ( = ?auto_124430 ?auto_124435 ) ) ( not ( = ?auto_124431 ?auto_124435 ) ) ( not ( = ?auto_124432 ?auto_124435 ) ) ( not ( = ?auto_124434 ?auto_124435 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124435 ?auto_124433 )
      ( MAKE-4PILE ?auto_124428 ?auto_124429 ?auto_124430 ?auto_124431 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124436 - BLOCK
      ?auto_124437 - BLOCK
      ?auto_124438 - BLOCK
      ?auto_124439 - BLOCK
    )
    :vars
    (
      ?auto_124442 - BLOCK
      ?auto_124441 - BLOCK
      ?auto_124443 - BLOCK
      ?auto_124440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124442 ?auto_124439 ) ( ON-TABLE ?auto_124436 ) ( ON ?auto_124437 ?auto_124436 ) ( ON ?auto_124438 ?auto_124437 ) ( ON ?auto_124439 ?auto_124438 ) ( not ( = ?auto_124436 ?auto_124437 ) ) ( not ( = ?auto_124436 ?auto_124438 ) ) ( not ( = ?auto_124436 ?auto_124439 ) ) ( not ( = ?auto_124436 ?auto_124442 ) ) ( not ( = ?auto_124437 ?auto_124438 ) ) ( not ( = ?auto_124437 ?auto_124439 ) ) ( not ( = ?auto_124437 ?auto_124442 ) ) ( not ( = ?auto_124438 ?auto_124439 ) ) ( not ( = ?auto_124438 ?auto_124442 ) ) ( not ( = ?auto_124439 ?auto_124442 ) ) ( not ( = ?auto_124436 ?auto_124441 ) ) ( not ( = ?auto_124436 ?auto_124443 ) ) ( not ( = ?auto_124437 ?auto_124441 ) ) ( not ( = ?auto_124437 ?auto_124443 ) ) ( not ( = ?auto_124438 ?auto_124441 ) ) ( not ( = ?auto_124438 ?auto_124443 ) ) ( not ( = ?auto_124439 ?auto_124441 ) ) ( not ( = ?auto_124439 ?auto_124443 ) ) ( not ( = ?auto_124442 ?auto_124441 ) ) ( not ( = ?auto_124442 ?auto_124443 ) ) ( not ( = ?auto_124441 ?auto_124443 ) ) ( ON ?auto_124441 ?auto_124442 ) ( CLEAR ?auto_124440 ) ( ON-TABLE ?auto_124440 ) ( not ( = ?auto_124440 ?auto_124443 ) ) ( not ( = ?auto_124436 ?auto_124440 ) ) ( not ( = ?auto_124437 ?auto_124440 ) ) ( not ( = ?auto_124438 ?auto_124440 ) ) ( not ( = ?auto_124439 ?auto_124440 ) ) ( not ( = ?auto_124442 ?auto_124440 ) ) ( not ( = ?auto_124441 ?auto_124440 ) ) ( ON ?auto_124443 ?auto_124441 ) ( CLEAR ?auto_124443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124436 ?auto_124437 ?auto_124438 ?auto_124439 ?auto_124442 ?auto_124441 )
      ( MAKE-4PILE ?auto_124436 ?auto_124437 ?auto_124438 ?auto_124439 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124444 - BLOCK
      ?auto_124445 - BLOCK
      ?auto_124446 - BLOCK
      ?auto_124447 - BLOCK
    )
    :vars
    (
      ?auto_124451 - BLOCK
      ?auto_124450 - BLOCK
      ?auto_124448 - BLOCK
      ?auto_124449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124451 ?auto_124447 ) ( ON-TABLE ?auto_124444 ) ( ON ?auto_124445 ?auto_124444 ) ( ON ?auto_124446 ?auto_124445 ) ( ON ?auto_124447 ?auto_124446 ) ( not ( = ?auto_124444 ?auto_124445 ) ) ( not ( = ?auto_124444 ?auto_124446 ) ) ( not ( = ?auto_124444 ?auto_124447 ) ) ( not ( = ?auto_124444 ?auto_124451 ) ) ( not ( = ?auto_124445 ?auto_124446 ) ) ( not ( = ?auto_124445 ?auto_124447 ) ) ( not ( = ?auto_124445 ?auto_124451 ) ) ( not ( = ?auto_124446 ?auto_124447 ) ) ( not ( = ?auto_124446 ?auto_124451 ) ) ( not ( = ?auto_124447 ?auto_124451 ) ) ( not ( = ?auto_124444 ?auto_124450 ) ) ( not ( = ?auto_124444 ?auto_124448 ) ) ( not ( = ?auto_124445 ?auto_124450 ) ) ( not ( = ?auto_124445 ?auto_124448 ) ) ( not ( = ?auto_124446 ?auto_124450 ) ) ( not ( = ?auto_124446 ?auto_124448 ) ) ( not ( = ?auto_124447 ?auto_124450 ) ) ( not ( = ?auto_124447 ?auto_124448 ) ) ( not ( = ?auto_124451 ?auto_124450 ) ) ( not ( = ?auto_124451 ?auto_124448 ) ) ( not ( = ?auto_124450 ?auto_124448 ) ) ( ON ?auto_124450 ?auto_124451 ) ( not ( = ?auto_124449 ?auto_124448 ) ) ( not ( = ?auto_124444 ?auto_124449 ) ) ( not ( = ?auto_124445 ?auto_124449 ) ) ( not ( = ?auto_124446 ?auto_124449 ) ) ( not ( = ?auto_124447 ?auto_124449 ) ) ( not ( = ?auto_124451 ?auto_124449 ) ) ( not ( = ?auto_124450 ?auto_124449 ) ) ( ON ?auto_124448 ?auto_124450 ) ( CLEAR ?auto_124448 ) ( HOLDING ?auto_124449 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124449 )
      ( MAKE-4PILE ?auto_124444 ?auto_124445 ?auto_124446 ?auto_124447 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124452 - BLOCK
      ?auto_124453 - BLOCK
      ?auto_124454 - BLOCK
      ?auto_124455 - BLOCK
    )
    :vars
    (
      ?auto_124459 - BLOCK
      ?auto_124457 - BLOCK
      ?auto_124458 - BLOCK
      ?auto_124456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124459 ?auto_124455 ) ( ON-TABLE ?auto_124452 ) ( ON ?auto_124453 ?auto_124452 ) ( ON ?auto_124454 ?auto_124453 ) ( ON ?auto_124455 ?auto_124454 ) ( not ( = ?auto_124452 ?auto_124453 ) ) ( not ( = ?auto_124452 ?auto_124454 ) ) ( not ( = ?auto_124452 ?auto_124455 ) ) ( not ( = ?auto_124452 ?auto_124459 ) ) ( not ( = ?auto_124453 ?auto_124454 ) ) ( not ( = ?auto_124453 ?auto_124455 ) ) ( not ( = ?auto_124453 ?auto_124459 ) ) ( not ( = ?auto_124454 ?auto_124455 ) ) ( not ( = ?auto_124454 ?auto_124459 ) ) ( not ( = ?auto_124455 ?auto_124459 ) ) ( not ( = ?auto_124452 ?auto_124457 ) ) ( not ( = ?auto_124452 ?auto_124458 ) ) ( not ( = ?auto_124453 ?auto_124457 ) ) ( not ( = ?auto_124453 ?auto_124458 ) ) ( not ( = ?auto_124454 ?auto_124457 ) ) ( not ( = ?auto_124454 ?auto_124458 ) ) ( not ( = ?auto_124455 ?auto_124457 ) ) ( not ( = ?auto_124455 ?auto_124458 ) ) ( not ( = ?auto_124459 ?auto_124457 ) ) ( not ( = ?auto_124459 ?auto_124458 ) ) ( not ( = ?auto_124457 ?auto_124458 ) ) ( ON ?auto_124457 ?auto_124459 ) ( not ( = ?auto_124456 ?auto_124458 ) ) ( not ( = ?auto_124452 ?auto_124456 ) ) ( not ( = ?auto_124453 ?auto_124456 ) ) ( not ( = ?auto_124454 ?auto_124456 ) ) ( not ( = ?auto_124455 ?auto_124456 ) ) ( not ( = ?auto_124459 ?auto_124456 ) ) ( not ( = ?auto_124457 ?auto_124456 ) ) ( ON ?auto_124458 ?auto_124457 ) ( ON ?auto_124456 ?auto_124458 ) ( CLEAR ?auto_124456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124452 ?auto_124453 ?auto_124454 ?auto_124455 ?auto_124459 ?auto_124457 ?auto_124458 )
      ( MAKE-4PILE ?auto_124452 ?auto_124453 ?auto_124454 ?auto_124455 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124464 - BLOCK
      ?auto_124465 - BLOCK
      ?auto_124466 - BLOCK
      ?auto_124467 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_124467 ) ( CLEAR ?auto_124466 ) ( ON-TABLE ?auto_124464 ) ( ON ?auto_124465 ?auto_124464 ) ( ON ?auto_124466 ?auto_124465 ) ( not ( = ?auto_124464 ?auto_124465 ) ) ( not ( = ?auto_124464 ?auto_124466 ) ) ( not ( = ?auto_124464 ?auto_124467 ) ) ( not ( = ?auto_124465 ?auto_124466 ) ) ( not ( = ?auto_124465 ?auto_124467 ) ) ( not ( = ?auto_124466 ?auto_124467 ) ) )
    :subtasks
    ( ( !STACK ?auto_124467 ?auto_124466 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124468 - BLOCK
      ?auto_124469 - BLOCK
      ?auto_124470 - BLOCK
      ?auto_124471 - BLOCK
    )
    :vars
    (
      ?auto_124472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124470 ) ( ON-TABLE ?auto_124468 ) ( ON ?auto_124469 ?auto_124468 ) ( ON ?auto_124470 ?auto_124469 ) ( not ( = ?auto_124468 ?auto_124469 ) ) ( not ( = ?auto_124468 ?auto_124470 ) ) ( not ( = ?auto_124468 ?auto_124471 ) ) ( not ( = ?auto_124469 ?auto_124470 ) ) ( not ( = ?auto_124469 ?auto_124471 ) ) ( not ( = ?auto_124470 ?auto_124471 ) ) ( ON ?auto_124471 ?auto_124472 ) ( CLEAR ?auto_124471 ) ( HAND-EMPTY ) ( not ( = ?auto_124468 ?auto_124472 ) ) ( not ( = ?auto_124469 ?auto_124472 ) ) ( not ( = ?auto_124470 ?auto_124472 ) ) ( not ( = ?auto_124471 ?auto_124472 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124471 ?auto_124472 )
      ( MAKE-4PILE ?auto_124468 ?auto_124469 ?auto_124470 ?auto_124471 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124473 - BLOCK
      ?auto_124474 - BLOCK
      ?auto_124475 - BLOCK
      ?auto_124476 - BLOCK
    )
    :vars
    (
      ?auto_124477 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124473 ) ( ON ?auto_124474 ?auto_124473 ) ( not ( = ?auto_124473 ?auto_124474 ) ) ( not ( = ?auto_124473 ?auto_124475 ) ) ( not ( = ?auto_124473 ?auto_124476 ) ) ( not ( = ?auto_124474 ?auto_124475 ) ) ( not ( = ?auto_124474 ?auto_124476 ) ) ( not ( = ?auto_124475 ?auto_124476 ) ) ( ON ?auto_124476 ?auto_124477 ) ( CLEAR ?auto_124476 ) ( not ( = ?auto_124473 ?auto_124477 ) ) ( not ( = ?auto_124474 ?auto_124477 ) ) ( not ( = ?auto_124475 ?auto_124477 ) ) ( not ( = ?auto_124476 ?auto_124477 ) ) ( HOLDING ?auto_124475 ) ( CLEAR ?auto_124474 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124473 ?auto_124474 ?auto_124475 )
      ( MAKE-4PILE ?auto_124473 ?auto_124474 ?auto_124475 ?auto_124476 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124478 - BLOCK
      ?auto_124479 - BLOCK
      ?auto_124480 - BLOCK
      ?auto_124481 - BLOCK
    )
    :vars
    (
      ?auto_124482 - BLOCK
      ?auto_124484 - BLOCK
      ?auto_124483 - BLOCK
      ?auto_124485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124478 ) ( ON ?auto_124479 ?auto_124478 ) ( not ( = ?auto_124478 ?auto_124479 ) ) ( not ( = ?auto_124478 ?auto_124480 ) ) ( not ( = ?auto_124478 ?auto_124481 ) ) ( not ( = ?auto_124479 ?auto_124480 ) ) ( not ( = ?auto_124479 ?auto_124481 ) ) ( not ( = ?auto_124480 ?auto_124481 ) ) ( ON ?auto_124481 ?auto_124482 ) ( not ( = ?auto_124478 ?auto_124482 ) ) ( not ( = ?auto_124479 ?auto_124482 ) ) ( not ( = ?auto_124480 ?auto_124482 ) ) ( not ( = ?auto_124481 ?auto_124482 ) ) ( CLEAR ?auto_124479 ) ( ON ?auto_124480 ?auto_124481 ) ( CLEAR ?auto_124480 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124484 ) ( ON ?auto_124483 ?auto_124484 ) ( ON ?auto_124485 ?auto_124483 ) ( ON ?auto_124482 ?auto_124485 ) ( not ( = ?auto_124484 ?auto_124483 ) ) ( not ( = ?auto_124484 ?auto_124485 ) ) ( not ( = ?auto_124484 ?auto_124482 ) ) ( not ( = ?auto_124484 ?auto_124481 ) ) ( not ( = ?auto_124484 ?auto_124480 ) ) ( not ( = ?auto_124483 ?auto_124485 ) ) ( not ( = ?auto_124483 ?auto_124482 ) ) ( not ( = ?auto_124483 ?auto_124481 ) ) ( not ( = ?auto_124483 ?auto_124480 ) ) ( not ( = ?auto_124485 ?auto_124482 ) ) ( not ( = ?auto_124485 ?auto_124481 ) ) ( not ( = ?auto_124485 ?auto_124480 ) ) ( not ( = ?auto_124478 ?auto_124484 ) ) ( not ( = ?auto_124478 ?auto_124483 ) ) ( not ( = ?auto_124478 ?auto_124485 ) ) ( not ( = ?auto_124479 ?auto_124484 ) ) ( not ( = ?auto_124479 ?auto_124483 ) ) ( not ( = ?auto_124479 ?auto_124485 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124484 ?auto_124483 ?auto_124485 ?auto_124482 ?auto_124481 )
      ( MAKE-4PILE ?auto_124478 ?auto_124479 ?auto_124480 ?auto_124481 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124486 - BLOCK
      ?auto_124487 - BLOCK
      ?auto_124488 - BLOCK
      ?auto_124489 - BLOCK
    )
    :vars
    (
      ?auto_124493 - BLOCK
      ?auto_124491 - BLOCK
      ?auto_124492 - BLOCK
      ?auto_124490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124486 ) ( not ( = ?auto_124486 ?auto_124487 ) ) ( not ( = ?auto_124486 ?auto_124488 ) ) ( not ( = ?auto_124486 ?auto_124489 ) ) ( not ( = ?auto_124487 ?auto_124488 ) ) ( not ( = ?auto_124487 ?auto_124489 ) ) ( not ( = ?auto_124488 ?auto_124489 ) ) ( ON ?auto_124489 ?auto_124493 ) ( not ( = ?auto_124486 ?auto_124493 ) ) ( not ( = ?auto_124487 ?auto_124493 ) ) ( not ( = ?auto_124488 ?auto_124493 ) ) ( not ( = ?auto_124489 ?auto_124493 ) ) ( ON ?auto_124488 ?auto_124489 ) ( CLEAR ?auto_124488 ) ( ON-TABLE ?auto_124491 ) ( ON ?auto_124492 ?auto_124491 ) ( ON ?auto_124490 ?auto_124492 ) ( ON ?auto_124493 ?auto_124490 ) ( not ( = ?auto_124491 ?auto_124492 ) ) ( not ( = ?auto_124491 ?auto_124490 ) ) ( not ( = ?auto_124491 ?auto_124493 ) ) ( not ( = ?auto_124491 ?auto_124489 ) ) ( not ( = ?auto_124491 ?auto_124488 ) ) ( not ( = ?auto_124492 ?auto_124490 ) ) ( not ( = ?auto_124492 ?auto_124493 ) ) ( not ( = ?auto_124492 ?auto_124489 ) ) ( not ( = ?auto_124492 ?auto_124488 ) ) ( not ( = ?auto_124490 ?auto_124493 ) ) ( not ( = ?auto_124490 ?auto_124489 ) ) ( not ( = ?auto_124490 ?auto_124488 ) ) ( not ( = ?auto_124486 ?auto_124491 ) ) ( not ( = ?auto_124486 ?auto_124492 ) ) ( not ( = ?auto_124486 ?auto_124490 ) ) ( not ( = ?auto_124487 ?auto_124491 ) ) ( not ( = ?auto_124487 ?auto_124492 ) ) ( not ( = ?auto_124487 ?auto_124490 ) ) ( HOLDING ?auto_124487 ) ( CLEAR ?auto_124486 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124486 ?auto_124487 )
      ( MAKE-4PILE ?auto_124486 ?auto_124487 ?auto_124488 ?auto_124489 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124494 - BLOCK
      ?auto_124495 - BLOCK
      ?auto_124496 - BLOCK
      ?auto_124497 - BLOCK
    )
    :vars
    (
      ?auto_124499 - BLOCK
      ?auto_124498 - BLOCK
      ?auto_124501 - BLOCK
      ?auto_124500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124494 ) ( not ( = ?auto_124494 ?auto_124495 ) ) ( not ( = ?auto_124494 ?auto_124496 ) ) ( not ( = ?auto_124494 ?auto_124497 ) ) ( not ( = ?auto_124495 ?auto_124496 ) ) ( not ( = ?auto_124495 ?auto_124497 ) ) ( not ( = ?auto_124496 ?auto_124497 ) ) ( ON ?auto_124497 ?auto_124499 ) ( not ( = ?auto_124494 ?auto_124499 ) ) ( not ( = ?auto_124495 ?auto_124499 ) ) ( not ( = ?auto_124496 ?auto_124499 ) ) ( not ( = ?auto_124497 ?auto_124499 ) ) ( ON ?auto_124496 ?auto_124497 ) ( ON-TABLE ?auto_124498 ) ( ON ?auto_124501 ?auto_124498 ) ( ON ?auto_124500 ?auto_124501 ) ( ON ?auto_124499 ?auto_124500 ) ( not ( = ?auto_124498 ?auto_124501 ) ) ( not ( = ?auto_124498 ?auto_124500 ) ) ( not ( = ?auto_124498 ?auto_124499 ) ) ( not ( = ?auto_124498 ?auto_124497 ) ) ( not ( = ?auto_124498 ?auto_124496 ) ) ( not ( = ?auto_124501 ?auto_124500 ) ) ( not ( = ?auto_124501 ?auto_124499 ) ) ( not ( = ?auto_124501 ?auto_124497 ) ) ( not ( = ?auto_124501 ?auto_124496 ) ) ( not ( = ?auto_124500 ?auto_124499 ) ) ( not ( = ?auto_124500 ?auto_124497 ) ) ( not ( = ?auto_124500 ?auto_124496 ) ) ( not ( = ?auto_124494 ?auto_124498 ) ) ( not ( = ?auto_124494 ?auto_124501 ) ) ( not ( = ?auto_124494 ?auto_124500 ) ) ( not ( = ?auto_124495 ?auto_124498 ) ) ( not ( = ?auto_124495 ?auto_124501 ) ) ( not ( = ?auto_124495 ?auto_124500 ) ) ( CLEAR ?auto_124494 ) ( ON ?auto_124495 ?auto_124496 ) ( CLEAR ?auto_124495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124498 ?auto_124501 ?auto_124500 ?auto_124499 ?auto_124497 ?auto_124496 )
      ( MAKE-4PILE ?auto_124494 ?auto_124495 ?auto_124496 ?auto_124497 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124502 - BLOCK
      ?auto_124503 - BLOCK
      ?auto_124504 - BLOCK
      ?auto_124505 - BLOCK
    )
    :vars
    (
      ?auto_124508 - BLOCK
      ?auto_124507 - BLOCK
      ?auto_124506 - BLOCK
      ?auto_124509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124502 ?auto_124503 ) ) ( not ( = ?auto_124502 ?auto_124504 ) ) ( not ( = ?auto_124502 ?auto_124505 ) ) ( not ( = ?auto_124503 ?auto_124504 ) ) ( not ( = ?auto_124503 ?auto_124505 ) ) ( not ( = ?auto_124504 ?auto_124505 ) ) ( ON ?auto_124505 ?auto_124508 ) ( not ( = ?auto_124502 ?auto_124508 ) ) ( not ( = ?auto_124503 ?auto_124508 ) ) ( not ( = ?auto_124504 ?auto_124508 ) ) ( not ( = ?auto_124505 ?auto_124508 ) ) ( ON ?auto_124504 ?auto_124505 ) ( ON-TABLE ?auto_124507 ) ( ON ?auto_124506 ?auto_124507 ) ( ON ?auto_124509 ?auto_124506 ) ( ON ?auto_124508 ?auto_124509 ) ( not ( = ?auto_124507 ?auto_124506 ) ) ( not ( = ?auto_124507 ?auto_124509 ) ) ( not ( = ?auto_124507 ?auto_124508 ) ) ( not ( = ?auto_124507 ?auto_124505 ) ) ( not ( = ?auto_124507 ?auto_124504 ) ) ( not ( = ?auto_124506 ?auto_124509 ) ) ( not ( = ?auto_124506 ?auto_124508 ) ) ( not ( = ?auto_124506 ?auto_124505 ) ) ( not ( = ?auto_124506 ?auto_124504 ) ) ( not ( = ?auto_124509 ?auto_124508 ) ) ( not ( = ?auto_124509 ?auto_124505 ) ) ( not ( = ?auto_124509 ?auto_124504 ) ) ( not ( = ?auto_124502 ?auto_124507 ) ) ( not ( = ?auto_124502 ?auto_124506 ) ) ( not ( = ?auto_124502 ?auto_124509 ) ) ( not ( = ?auto_124503 ?auto_124507 ) ) ( not ( = ?auto_124503 ?auto_124506 ) ) ( not ( = ?auto_124503 ?auto_124509 ) ) ( ON ?auto_124503 ?auto_124504 ) ( CLEAR ?auto_124503 ) ( HOLDING ?auto_124502 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124502 )
      ( MAKE-4PILE ?auto_124502 ?auto_124503 ?auto_124504 ?auto_124505 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_124510 - BLOCK
      ?auto_124511 - BLOCK
      ?auto_124512 - BLOCK
      ?auto_124513 - BLOCK
    )
    :vars
    (
      ?auto_124514 - BLOCK
      ?auto_124516 - BLOCK
      ?auto_124517 - BLOCK
      ?auto_124515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124510 ?auto_124511 ) ) ( not ( = ?auto_124510 ?auto_124512 ) ) ( not ( = ?auto_124510 ?auto_124513 ) ) ( not ( = ?auto_124511 ?auto_124512 ) ) ( not ( = ?auto_124511 ?auto_124513 ) ) ( not ( = ?auto_124512 ?auto_124513 ) ) ( ON ?auto_124513 ?auto_124514 ) ( not ( = ?auto_124510 ?auto_124514 ) ) ( not ( = ?auto_124511 ?auto_124514 ) ) ( not ( = ?auto_124512 ?auto_124514 ) ) ( not ( = ?auto_124513 ?auto_124514 ) ) ( ON ?auto_124512 ?auto_124513 ) ( ON-TABLE ?auto_124516 ) ( ON ?auto_124517 ?auto_124516 ) ( ON ?auto_124515 ?auto_124517 ) ( ON ?auto_124514 ?auto_124515 ) ( not ( = ?auto_124516 ?auto_124517 ) ) ( not ( = ?auto_124516 ?auto_124515 ) ) ( not ( = ?auto_124516 ?auto_124514 ) ) ( not ( = ?auto_124516 ?auto_124513 ) ) ( not ( = ?auto_124516 ?auto_124512 ) ) ( not ( = ?auto_124517 ?auto_124515 ) ) ( not ( = ?auto_124517 ?auto_124514 ) ) ( not ( = ?auto_124517 ?auto_124513 ) ) ( not ( = ?auto_124517 ?auto_124512 ) ) ( not ( = ?auto_124515 ?auto_124514 ) ) ( not ( = ?auto_124515 ?auto_124513 ) ) ( not ( = ?auto_124515 ?auto_124512 ) ) ( not ( = ?auto_124510 ?auto_124516 ) ) ( not ( = ?auto_124510 ?auto_124517 ) ) ( not ( = ?auto_124510 ?auto_124515 ) ) ( not ( = ?auto_124511 ?auto_124516 ) ) ( not ( = ?auto_124511 ?auto_124517 ) ) ( not ( = ?auto_124511 ?auto_124515 ) ) ( ON ?auto_124511 ?auto_124512 ) ( ON ?auto_124510 ?auto_124511 ) ( CLEAR ?auto_124510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124516 ?auto_124517 ?auto_124515 ?auto_124514 ?auto_124513 ?auto_124512 ?auto_124511 )
      ( MAKE-4PILE ?auto_124510 ?auto_124511 ?auto_124512 ?auto_124513 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124521 - BLOCK
      ?auto_124522 - BLOCK
      ?auto_124523 - BLOCK
    )
    :vars
    (
      ?auto_124524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124524 ?auto_124523 ) ( CLEAR ?auto_124524 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124521 ) ( ON ?auto_124522 ?auto_124521 ) ( ON ?auto_124523 ?auto_124522 ) ( not ( = ?auto_124521 ?auto_124522 ) ) ( not ( = ?auto_124521 ?auto_124523 ) ) ( not ( = ?auto_124521 ?auto_124524 ) ) ( not ( = ?auto_124522 ?auto_124523 ) ) ( not ( = ?auto_124522 ?auto_124524 ) ) ( not ( = ?auto_124523 ?auto_124524 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124524 ?auto_124523 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124525 - BLOCK
      ?auto_124526 - BLOCK
      ?auto_124527 - BLOCK
    )
    :vars
    (
      ?auto_124528 - BLOCK
      ?auto_124529 - BLOCK
      ?auto_124530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124528 ?auto_124527 ) ( CLEAR ?auto_124528 ) ( ON-TABLE ?auto_124525 ) ( ON ?auto_124526 ?auto_124525 ) ( ON ?auto_124527 ?auto_124526 ) ( not ( = ?auto_124525 ?auto_124526 ) ) ( not ( = ?auto_124525 ?auto_124527 ) ) ( not ( = ?auto_124525 ?auto_124528 ) ) ( not ( = ?auto_124526 ?auto_124527 ) ) ( not ( = ?auto_124526 ?auto_124528 ) ) ( not ( = ?auto_124527 ?auto_124528 ) ) ( HOLDING ?auto_124529 ) ( CLEAR ?auto_124530 ) ( not ( = ?auto_124525 ?auto_124529 ) ) ( not ( = ?auto_124525 ?auto_124530 ) ) ( not ( = ?auto_124526 ?auto_124529 ) ) ( not ( = ?auto_124526 ?auto_124530 ) ) ( not ( = ?auto_124527 ?auto_124529 ) ) ( not ( = ?auto_124527 ?auto_124530 ) ) ( not ( = ?auto_124528 ?auto_124529 ) ) ( not ( = ?auto_124528 ?auto_124530 ) ) ( not ( = ?auto_124529 ?auto_124530 ) ) )
    :subtasks
    ( ( !STACK ?auto_124529 ?auto_124530 )
      ( MAKE-3PILE ?auto_124525 ?auto_124526 ?auto_124527 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124531 - BLOCK
      ?auto_124532 - BLOCK
      ?auto_124533 - BLOCK
    )
    :vars
    (
      ?auto_124535 - BLOCK
      ?auto_124536 - BLOCK
      ?auto_124534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124535 ?auto_124533 ) ( ON-TABLE ?auto_124531 ) ( ON ?auto_124532 ?auto_124531 ) ( ON ?auto_124533 ?auto_124532 ) ( not ( = ?auto_124531 ?auto_124532 ) ) ( not ( = ?auto_124531 ?auto_124533 ) ) ( not ( = ?auto_124531 ?auto_124535 ) ) ( not ( = ?auto_124532 ?auto_124533 ) ) ( not ( = ?auto_124532 ?auto_124535 ) ) ( not ( = ?auto_124533 ?auto_124535 ) ) ( CLEAR ?auto_124536 ) ( not ( = ?auto_124531 ?auto_124534 ) ) ( not ( = ?auto_124531 ?auto_124536 ) ) ( not ( = ?auto_124532 ?auto_124534 ) ) ( not ( = ?auto_124532 ?auto_124536 ) ) ( not ( = ?auto_124533 ?auto_124534 ) ) ( not ( = ?auto_124533 ?auto_124536 ) ) ( not ( = ?auto_124535 ?auto_124534 ) ) ( not ( = ?auto_124535 ?auto_124536 ) ) ( not ( = ?auto_124534 ?auto_124536 ) ) ( ON ?auto_124534 ?auto_124535 ) ( CLEAR ?auto_124534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124531 ?auto_124532 ?auto_124533 ?auto_124535 )
      ( MAKE-3PILE ?auto_124531 ?auto_124532 ?auto_124533 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124537 - BLOCK
      ?auto_124538 - BLOCK
      ?auto_124539 - BLOCK
    )
    :vars
    (
      ?auto_124542 - BLOCK
      ?auto_124540 - BLOCK
      ?auto_124541 - BLOCK
      ?auto_124543 - BLOCK
      ?auto_124544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124542 ?auto_124539 ) ( ON-TABLE ?auto_124537 ) ( ON ?auto_124538 ?auto_124537 ) ( ON ?auto_124539 ?auto_124538 ) ( not ( = ?auto_124537 ?auto_124538 ) ) ( not ( = ?auto_124537 ?auto_124539 ) ) ( not ( = ?auto_124537 ?auto_124542 ) ) ( not ( = ?auto_124538 ?auto_124539 ) ) ( not ( = ?auto_124538 ?auto_124542 ) ) ( not ( = ?auto_124539 ?auto_124542 ) ) ( not ( = ?auto_124537 ?auto_124540 ) ) ( not ( = ?auto_124537 ?auto_124541 ) ) ( not ( = ?auto_124538 ?auto_124540 ) ) ( not ( = ?auto_124538 ?auto_124541 ) ) ( not ( = ?auto_124539 ?auto_124540 ) ) ( not ( = ?auto_124539 ?auto_124541 ) ) ( not ( = ?auto_124542 ?auto_124540 ) ) ( not ( = ?auto_124542 ?auto_124541 ) ) ( not ( = ?auto_124540 ?auto_124541 ) ) ( ON ?auto_124540 ?auto_124542 ) ( CLEAR ?auto_124540 ) ( HOLDING ?auto_124541 ) ( CLEAR ?auto_124543 ) ( ON-TABLE ?auto_124544 ) ( ON ?auto_124543 ?auto_124544 ) ( not ( = ?auto_124544 ?auto_124543 ) ) ( not ( = ?auto_124544 ?auto_124541 ) ) ( not ( = ?auto_124543 ?auto_124541 ) ) ( not ( = ?auto_124537 ?auto_124543 ) ) ( not ( = ?auto_124537 ?auto_124544 ) ) ( not ( = ?auto_124538 ?auto_124543 ) ) ( not ( = ?auto_124538 ?auto_124544 ) ) ( not ( = ?auto_124539 ?auto_124543 ) ) ( not ( = ?auto_124539 ?auto_124544 ) ) ( not ( = ?auto_124542 ?auto_124543 ) ) ( not ( = ?auto_124542 ?auto_124544 ) ) ( not ( = ?auto_124540 ?auto_124543 ) ) ( not ( = ?auto_124540 ?auto_124544 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124544 ?auto_124543 ?auto_124541 )
      ( MAKE-3PILE ?auto_124537 ?auto_124538 ?auto_124539 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124545 - BLOCK
      ?auto_124546 - BLOCK
      ?auto_124547 - BLOCK
    )
    :vars
    (
      ?auto_124552 - BLOCK
      ?auto_124550 - BLOCK
      ?auto_124548 - BLOCK
      ?auto_124549 - BLOCK
      ?auto_124551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124552 ?auto_124547 ) ( ON-TABLE ?auto_124545 ) ( ON ?auto_124546 ?auto_124545 ) ( ON ?auto_124547 ?auto_124546 ) ( not ( = ?auto_124545 ?auto_124546 ) ) ( not ( = ?auto_124545 ?auto_124547 ) ) ( not ( = ?auto_124545 ?auto_124552 ) ) ( not ( = ?auto_124546 ?auto_124547 ) ) ( not ( = ?auto_124546 ?auto_124552 ) ) ( not ( = ?auto_124547 ?auto_124552 ) ) ( not ( = ?auto_124545 ?auto_124550 ) ) ( not ( = ?auto_124545 ?auto_124548 ) ) ( not ( = ?auto_124546 ?auto_124550 ) ) ( not ( = ?auto_124546 ?auto_124548 ) ) ( not ( = ?auto_124547 ?auto_124550 ) ) ( not ( = ?auto_124547 ?auto_124548 ) ) ( not ( = ?auto_124552 ?auto_124550 ) ) ( not ( = ?auto_124552 ?auto_124548 ) ) ( not ( = ?auto_124550 ?auto_124548 ) ) ( ON ?auto_124550 ?auto_124552 ) ( CLEAR ?auto_124549 ) ( ON-TABLE ?auto_124551 ) ( ON ?auto_124549 ?auto_124551 ) ( not ( = ?auto_124551 ?auto_124549 ) ) ( not ( = ?auto_124551 ?auto_124548 ) ) ( not ( = ?auto_124549 ?auto_124548 ) ) ( not ( = ?auto_124545 ?auto_124549 ) ) ( not ( = ?auto_124545 ?auto_124551 ) ) ( not ( = ?auto_124546 ?auto_124549 ) ) ( not ( = ?auto_124546 ?auto_124551 ) ) ( not ( = ?auto_124547 ?auto_124549 ) ) ( not ( = ?auto_124547 ?auto_124551 ) ) ( not ( = ?auto_124552 ?auto_124549 ) ) ( not ( = ?auto_124552 ?auto_124551 ) ) ( not ( = ?auto_124550 ?auto_124549 ) ) ( not ( = ?auto_124550 ?auto_124551 ) ) ( ON ?auto_124548 ?auto_124550 ) ( CLEAR ?auto_124548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124545 ?auto_124546 ?auto_124547 ?auto_124552 ?auto_124550 )
      ( MAKE-3PILE ?auto_124545 ?auto_124546 ?auto_124547 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124553 - BLOCK
      ?auto_124554 - BLOCK
      ?auto_124555 - BLOCK
    )
    :vars
    (
      ?auto_124557 - BLOCK
      ?auto_124559 - BLOCK
      ?auto_124558 - BLOCK
      ?auto_124560 - BLOCK
      ?auto_124556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124557 ?auto_124555 ) ( ON-TABLE ?auto_124553 ) ( ON ?auto_124554 ?auto_124553 ) ( ON ?auto_124555 ?auto_124554 ) ( not ( = ?auto_124553 ?auto_124554 ) ) ( not ( = ?auto_124553 ?auto_124555 ) ) ( not ( = ?auto_124553 ?auto_124557 ) ) ( not ( = ?auto_124554 ?auto_124555 ) ) ( not ( = ?auto_124554 ?auto_124557 ) ) ( not ( = ?auto_124555 ?auto_124557 ) ) ( not ( = ?auto_124553 ?auto_124559 ) ) ( not ( = ?auto_124553 ?auto_124558 ) ) ( not ( = ?auto_124554 ?auto_124559 ) ) ( not ( = ?auto_124554 ?auto_124558 ) ) ( not ( = ?auto_124555 ?auto_124559 ) ) ( not ( = ?auto_124555 ?auto_124558 ) ) ( not ( = ?auto_124557 ?auto_124559 ) ) ( not ( = ?auto_124557 ?auto_124558 ) ) ( not ( = ?auto_124559 ?auto_124558 ) ) ( ON ?auto_124559 ?auto_124557 ) ( ON-TABLE ?auto_124560 ) ( not ( = ?auto_124560 ?auto_124556 ) ) ( not ( = ?auto_124560 ?auto_124558 ) ) ( not ( = ?auto_124556 ?auto_124558 ) ) ( not ( = ?auto_124553 ?auto_124556 ) ) ( not ( = ?auto_124553 ?auto_124560 ) ) ( not ( = ?auto_124554 ?auto_124556 ) ) ( not ( = ?auto_124554 ?auto_124560 ) ) ( not ( = ?auto_124555 ?auto_124556 ) ) ( not ( = ?auto_124555 ?auto_124560 ) ) ( not ( = ?auto_124557 ?auto_124556 ) ) ( not ( = ?auto_124557 ?auto_124560 ) ) ( not ( = ?auto_124559 ?auto_124556 ) ) ( not ( = ?auto_124559 ?auto_124560 ) ) ( ON ?auto_124558 ?auto_124559 ) ( CLEAR ?auto_124558 ) ( HOLDING ?auto_124556 ) ( CLEAR ?auto_124560 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124560 ?auto_124556 )
      ( MAKE-3PILE ?auto_124553 ?auto_124554 ?auto_124555 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124561 - BLOCK
      ?auto_124562 - BLOCK
      ?auto_124563 - BLOCK
    )
    :vars
    (
      ?auto_124566 - BLOCK
      ?auto_124564 - BLOCK
      ?auto_124568 - BLOCK
      ?auto_124567 - BLOCK
      ?auto_124565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124566 ?auto_124563 ) ( ON-TABLE ?auto_124561 ) ( ON ?auto_124562 ?auto_124561 ) ( ON ?auto_124563 ?auto_124562 ) ( not ( = ?auto_124561 ?auto_124562 ) ) ( not ( = ?auto_124561 ?auto_124563 ) ) ( not ( = ?auto_124561 ?auto_124566 ) ) ( not ( = ?auto_124562 ?auto_124563 ) ) ( not ( = ?auto_124562 ?auto_124566 ) ) ( not ( = ?auto_124563 ?auto_124566 ) ) ( not ( = ?auto_124561 ?auto_124564 ) ) ( not ( = ?auto_124561 ?auto_124568 ) ) ( not ( = ?auto_124562 ?auto_124564 ) ) ( not ( = ?auto_124562 ?auto_124568 ) ) ( not ( = ?auto_124563 ?auto_124564 ) ) ( not ( = ?auto_124563 ?auto_124568 ) ) ( not ( = ?auto_124566 ?auto_124564 ) ) ( not ( = ?auto_124566 ?auto_124568 ) ) ( not ( = ?auto_124564 ?auto_124568 ) ) ( ON ?auto_124564 ?auto_124566 ) ( ON-TABLE ?auto_124567 ) ( not ( = ?auto_124567 ?auto_124565 ) ) ( not ( = ?auto_124567 ?auto_124568 ) ) ( not ( = ?auto_124565 ?auto_124568 ) ) ( not ( = ?auto_124561 ?auto_124565 ) ) ( not ( = ?auto_124561 ?auto_124567 ) ) ( not ( = ?auto_124562 ?auto_124565 ) ) ( not ( = ?auto_124562 ?auto_124567 ) ) ( not ( = ?auto_124563 ?auto_124565 ) ) ( not ( = ?auto_124563 ?auto_124567 ) ) ( not ( = ?auto_124566 ?auto_124565 ) ) ( not ( = ?auto_124566 ?auto_124567 ) ) ( not ( = ?auto_124564 ?auto_124565 ) ) ( not ( = ?auto_124564 ?auto_124567 ) ) ( ON ?auto_124568 ?auto_124564 ) ( CLEAR ?auto_124567 ) ( ON ?auto_124565 ?auto_124568 ) ( CLEAR ?auto_124565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124561 ?auto_124562 ?auto_124563 ?auto_124566 ?auto_124564 ?auto_124568 )
      ( MAKE-3PILE ?auto_124561 ?auto_124562 ?auto_124563 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124569 - BLOCK
      ?auto_124570 - BLOCK
      ?auto_124571 - BLOCK
    )
    :vars
    (
      ?auto_124576 - BLOCK
      ?auto_124575 - BLOCK
      ?auto_124574 - BLOCK
      ?auto_124572 - BLOCK
      ?auto_124573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124576 ?auto_124571 ) ( ON-TABLE ?auto_124569 ) ( ON ?auto_124570 ?auto_124569 ) ( ON ?auto_124571 ?auto_124570 ) ( not ( = ?auto_124569 ?auto_124570 ) ) ( not ( = ?auto_124569 ?auto_124571 ) ) ( not ( = ?auto_124569 ?auto_124576 ) ) ( not ( = ?auto_124570 ?auto_124571 ) ) ( not ( = ?auto_124570 ?auto_124576 ) ) ( not ( = ?auto_124571 ?auto_124576 ) ) ( not ( = ?auto_124569 ?auto_124575 ) ) ( not ( = ?auto_124569 ?auto_124574 ) ) ( not ( = ?auto_124570 ?auto_124575 ) ) ( not ( = ?auto_124570 ?auto_124574 ) ) ( not ( = ?auto_124571 ?auto_124575 ) ) ( not ( = ?auto_124571 ?auto_124574 ) ) ( not ( = ?auto_124576 ?auto_124575 ) ) ( not ( = ?auto_124576 ?auto_124574 ) ) ( not ( = ?auto_124575 ?auto_124574 ) ) ( ON ?auto_124575 ?auto_124576 ) ( not ( = ?auto_124572 ?auto_124573 ) ) ( not ( = ?auto_124572 ?auto_124574 ) ) ( not ( = ?auto_124573 ?auto_124574 ) ) ( not ( = ?auto_124569 ?auto_124573 ) ) ( not ( = ?auto_124569 ?auto_124572 ) ) ( not ( = ?auto_124570 ?auto_124573 ) ) ( not ( = ?auto_124570 ?auto_124572 ) ) ( not ( = ?auto_124571 ?auto_124573 ) ) ( not ( = ?auto_124571 ?auto_124572 ) ) ( not ( = ?auto_124576 ?auto_124573 ) ) ( not ( = ?auto_124576 ?auto_124572 ) ) ( not ( = ?auto_124575 ?auto_124573 ) ) ( not ( = ?auto_124575 ?auto_124572 ) ) ( ON ?auto_124574 ?auto_124575 ) ( ON ?auto_124573 ?auto_124574 ) ( CLEAR ?auto_124573 ) ( HOLDING ?auto_124572 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124572 )
      ( MAKE-3PILE ?auto_124569 ?auto_124570 ?auto_124571 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_124577 - BLOCK
      ?auto_124578 - BLOCK
      ?auto_124579 - BLOCK
    )
    :vars
    (
      ?auto_124582 - BLOCK
      ?auto_124580 - BLOCK
      ?auto_124583 - BLOCK
      ?auto_124584 - BLOCK
      ?auto_124581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124582 ?auto_124579 ) ( ON-TABLE ?auto_124577 ) ( ON ?auto_124578 ?auto_124577 ) ( ON ?auto_124579 ?auto_124578 ) ( not ( = ?auto_124577 ?auto_124578 ) ) ( not ( = ?auto_124577 ?auto_124579 ) ) ( not ( = ?auto_124577 ?auto_124582 ) ) ( not ( = ?auto_124578 ?auto_124579 ) ) ( not ( = ?auto_124578 ?auto_124582 ) ) ( not ( = ?auto_124579 ?auto_124582 ) ) ( not ( = ?auto_124577 ?auto_124580 ) ) ( not ( = ?auto_124577 ?auto_124583 ) ) ( not ( = ?auto_124578 ?auto_124580 ) ) ( not ( = ?auto_124578 ?auto_124583 ) ) ( not ( = ?auto_124579 ?auto_124580 ) ) ( not ( = ?auto_124579 ?auto_124583 ) ) ( not ( = ?auto_124582 ?auto_124580 ) ) ( not ( = ?auto_124582 ?auto_124583 ) ) ( not ( = ?auto_124580 ?auto_124583 ) ) ( ON ?auto_124580 ?auto_124582 ) ( not ( = ?auto_124584 ?auto_124581 ) ) ( not ( = ?auto_124584 ?auto_124583 ) ) ( not ( = ?auto_124581 ?auto_124583 ) ) ( not ( = ?auto_124577 ?auto_124581 ) ) ( not ( = ?auto_124577 ?auto_124584 ) ) ( not ( = ?auto_124578 ?auto_124581 ) ) ( not ( = ?auto_124578 ?auto_124584 ) ) ( not ( = ?auto_124579 ?auto_124581 ) ) ( not ( = ?auto_124579 ?auto_124584 ) ) ( not ( = ?auto_124582 ?auto_124581 ) ) ( not ( = ?auto_124582 ?auto_124584 ) ) ( not ( = ?auto_124580 ?auto_124581 ) ) ( not ( = ?auto_124580 ?auto_124584 ) ) ( ON ?auto_124583 ?auto_124580 ) ( ON ?auto_124581 ?auto_124583 ) ( ON ?auto_124584 ?auto_124581 ) ( CLEAR ?auto_124584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124577 ?auto_124578 ?auto_124579 ?auto_124582 ?auto_124580 ?auto_124583 ?auto_124581 )
      ( MAKE-3PILE ?auto_124577 ?auto_124578 ?auto_124579 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124590 - BLOCK
      ?auto_124591 - BLOCK
      ?auto_124592 - BLOCK
      ?auto_124593 - BLOCK
      ?auto_124594 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_124594 ) ( CLEAR ?auto_124593 ) ( ON-TABLE ?auto_124590 ) ( ON ?auto_124591 ?auto_124590 ) ( ON ?auto_124592 ?auto_124591 ) ( ON ?auto_124593 ?auto_124592 ) ( not ( = ?auto_124590 ?auto_124591 ) ) ( not ( = ?auto_124590 ?auto_124592 ) ) ( not ( = ?auto_124590 ?auto_124593 ) ) ( not ( = ?auto_124590 ?auto_124594 ) ) ( not ( = ?auto_124591 ?auto_124592 ) ) ( not ( = ?auto_124591 ?auto_124593 ) ) ( not ( = ?auto_124591 ?auto_124594 ) ) ( not ( = ?auto_124592 ?auto_124593 ) ) ( not ( = ?auto_124592 ?auto_124594 ) ) ( not ( = ?auto_124593 ?auto_124594 ) ) )
    :subtasks
    ( ( !STACK ?auto_124594 ?auto_124593 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124595 - BLOCK
      ?auto_124596 - BLOCK
      ?auto_124597 - BLOCK
      ?auto_124598 - BLOCK
      ?auto_124599 - BLOCK
    )
    :vars
    (
      ?auto_124600 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124598 ) ( ON-TABLE ?auto_124595 ) ( ON ?auto_124596 ?auto_124595 ) ( ON ?auto_124597 ?auto_124596 ) ( ON ?auto_124598 ?auto_124597 ) ( not ( = ?auto_124595 ?auto_124596 ) ) ( not ( = ?auto_124595 ?auto_124597 ) ) ( not ( = ?auto_124595 ?auto_124598 ) ) ( not ( = ?auto_124595 ?auto_124599 ) ) ( not ( = ?auto_124596 ?auto_124597 ) ) ( not ( = ?auto_124596 ?auto_124598 ) ) ( not ( = ?auto_124596 ?auto_124599 ) ) ( not ( = ?auto_124597 ?auto_124598 ) ) ( not ( = ?auto_124597 ?auto_124599 ) ) ( not ( = ?auto_124598 ?auto_124599 ) ) ( ON ?auto_124599 ?auto_124600 ) ( CLEAR ?auto_124599 ) ( HAND-EMPTY ) ( not ( = ?auto_124595 ?auto_124600 ) ) ( not ( = ?auto_124596 ?auto_124600 ) ) ( not ( = ?auto_124597 ?auto_124600 ) ) ( not ( = ?auto_124598 ?auto_124600 ) ) ( not ( = ?auto_124599 ?auto_124600 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124599 ?auto_124600 )
      ( MAKE-5PILE ?auto_124595 ?auto_124596 ?auto_124597 ?auto_124598 ?auto_124599 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124601 - BLOCK
      ?auto_124602 - BLOCK
      ?auto_124603 - BLOCK
      ?auto_124604 - BLOCK
      ?auto_124605 - BLOCK
    )
    :vars
    (
      ?auto_124606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124601 ) ( ON ?auto_124602 ?auto_124601 ) ( ON ?auto_124603 ?auto_124602 ) ( not ( = ?auto_124601 ?auto_124602 ) ) ( not ( = ?auto_124601 ?auto_124603 ) ) ( not ( = ?auto_124601 ?auto_124604 ) ) ( not ( = ?auto_124601 ?auto_124605 ) ) ( not ( = ?auto_124602 ?auto_124603 ) ) ( not ( = ?auto_124602 ?auto_124604 ) ) ( not ( = ?auto_124602 ?auto_124605 ) ) ( not ( = ?auto_124603 ?auto_124604 ) ) ( not ( = ?auto_124603 ?auto_124605 ) ) ( not ( = ?auto_124604 ?auto_124605 ) ) ( ON ?auto_124605 ?auto_124606 ) ( CLEAR ?auto_124605 ) ( not ( = ?auto_124601 ?auto_124606 ) ) ( not ( = ?auto_124602 ?auto_124606 ) ) ( not ( = ?auto_124603 ?auto_124606 ) ) ( not ( = ?auto_124604 ?auto_124606 ) ) ( not ( = ?auto_124605 ?auto_124606 ) ) ( HOLDING ?auto_124604 ) ( CLEAR ?auto_124603 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124601 ?auto_124602 ?auto_124603 ?auto_124604 )
      ( MAKE-5PILE ?auto_124601 ?auto_124602 ?auto_124603 ?auto_124604 ?auto_124605 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124607 - BLOCK
      ?auto_124608 - BLOCK
      ?auto_124609 - BLOCK
      ?auto_124610 - BLOCK
      ?auto_124611 - BLOCK
    )
    :vars
    (
      ?auto_124612 - BLOCK
      ?auto_124614 - BLOCK
      ?auto_124613 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124607 ) ( ON ?auto_124608 ?auto_124607 ) ( ON ?auto_124609 ?auto_124608 ) ( not ( = ?auto_124607 ?auto_124608 ) ) ( not ( = ?auto_124607 ?auto_124609 ) ) ( not ( = ?auto_124607 ?auto_124610 ) ) ( not ( = ?auto_124607 ?auto_124611 ) ) ( not ( = ?auto_124608 ?auto_124609 ) ) ( not ( = ?auto_124608 ?auto_124610 ) ) ( not ( = ?auto_124608 ?auto_124611 ) ) ( not ( = ?auto_124609 ?auto_124610 ) ) ( not ( = ?auto_124609 ?auto_124611 ) ) ( not ( = ?auto_124610 ?auto_124611 ) ) ( ON ?auto_124611 ?auto_124612 ) ( not ( = ?auto_124607 ?auto_124612 ) ) ( not ( = ?auto_124608 ?auto_124612 ) ) ( not ( = ?auto_124609 ?auto_124612 ) ) ( not ( = ?auto_124610 ?auto_124612 ) ) ( not ( = ?auto_124611 ?auto_124612 ) ) ( CLEAR ?auto_124609 ) ( ON ?auto_124610 ?auto_124611 ) ( CLEAR ?auto_124610 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124614 ) ( ON ?auto_124613 ?auto_124614 ) ( ON ?auto_124612 ?auto_124613 ) ( not ( = ?auto_124614 ?auto_124613 ) ) ( not ( = ?auto_124614 ?auto_124612 ) ) ( not ( = ?auto_124614 ?auto_124611 ) ) ( not ( = ?auto_124614 ?auto_124610 ) ) ( not ( = ?auto_124613 ?auto_124612 ) ) ( not ( = ?auto_124613 ?auto_124611 ) ) ( not ( = ?auto_124613 ?auto_124610 ) ) ( not ( = ?auto_124607 ?auto_124614 ) ) ( not ( = ?auto_124607 ?auto_124613 ) ) ( not ( = ?auto_124608 ?auto_124614 ) ) ( not ( = ?auto_124608 ?auto_124613 ) ) ( not ( = ?auto_124609 ?auto_124614 ) ) ( not ( = ?auto_124609 ?auto_124613 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124614 ?auto_124613 ?auto_124612 ?auto_124611 )
      ( MAKE-5PILE ?auto_124607 ?auto_124608 ?auto_124609 ?auto_124610 ?auto_124611 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124615 - BLOCK
      ?auto_124616 - BLOCK
      ?auto_124617 - BLOCK
      ?auto_124618 - BLOCK
      ?auto_124619 - BLOCK
    )
    :vars
    (
      ?auto_124622 - BLOCK
      ?auto_124621 - BLOCK
      ?auto_124620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124615 ) ( ON ?auto_124616 ?auto_124615 ) ( not ( = ?auto_124615 ?auto_124616 ) ) ( not ( = ?auto_124615 ?auto_124617 ) ) ( not ( = ?auto_124615 ?auto_124618 ) ) ( not ( = ?auto_124615 ?auto_124619 ) ) ( not ( = ?auto_124616 ?auto_124617 ) ) ( not ( = ?auto_124616 ?auto_124618 ) ) ( not ( = ?auto_124616 ?auto_124619 ) ) ( not ( = ?auto_124617 ?auto_124618 ) ) ( not ( = ?auto_124617 ?auto_124619 ) ) ( not ( = ?auto_124618 ?auto_124619 ) ) ( ON ?auto_124619 ?auto_124622 ) ( not ( = ?auto_124615 ?auto_124622 ) ) ( not ( = ?auto_124616 ?auto_124622 ) ) ( not ( = ?auto_124617 ?auto_124622 ) ) ( not ( = ?auto_124618 ?auto_124622 ) ) ( not ( = ?auto_124619 ?auto_124622 ) ) ( ON ?auto_124618 ?auto_124619 ) ( CLEAR ?auto_124618 ) ( ON-TABLE ?auto_124621 ) ( ON ?auto_124620 ?auto_124621 ) ( ON ?auto_124622 ?auto_124620 ) ( not ( = ?auto_124621 ?auto_124620 ) ) ( not ( = ?auto_124621 ?auto_124622 ) ) ( not ( = ?auto_124621 ?auto_124619 ) ) ( not ( = ?auto_124621 ?auto_124618 ) ) ( not ( = ?auto_124620 ?auto_124622 ) ) ( not ( = ?auto_124620 ?auto_124619 ) ) ( not ( = ?auto_124620 ?auto_124618 ) ) ( not ( = ?auto_124615 ?auto_124621 ) ) ( not ( = ?auto_124615 ?auto_124620 ) ) ( not ( = ?auto_124616 ?auto_124621 ) ) ( not ( = ?auto_124616 ?auto_124620 ) ) ( not ( = ?auto_124617 ?auto_124621 ) ) ( not ( = ?auto_124617 ?auto_124620 ) ) ( HOLDING ?auto_124617 ) ( CLEAR ?auto_124616 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124615 ?auto_124616 ?auto_124617 )
      ( MAKE-5PILE ?auto_124615 ?auto_124616 ?auto_124617 ?auto_124618 ?auto_124619 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124623 - BLOCK
      ?auto_124624 - BLOCK
      ?auto_124625 - BLOCK
      ?auto_124626 - BLOCK
      ?auto_124627 - BLOCK
    )
    :vars
    (
      ?auto_124629 - BLOCK
      ?auto_124628 - BLOCK
      ?auto_124630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124623 ) ( ON ?auto_124624 ?auto_124623 ) ( not ( = ?auto_124623 ?auto_124624 ) ) ( not ( = ?auto_124623 ?auto_124625 ) ) ( not ( = ?auto_124623 ?auto_124626 ) ) ( not ( = ?auto_124623 ?auto_124627 ) ) ( not ( = ?auto_124624 ?auto_124625 ) ) ( not ( = ?auto_124624 ?auto_124626 ) ) ( not ( = ?auto_124624 ?auto_124627 ) ) ( not ( = ?auto_124625 ?auto_124626 ) ) ( not ( = ?auto_124625 ?auto_124627 ) ) ( not ( = ?auto_124626 ?auto_124627 ) ) ( ON ?auto_124627 ?auto_124629 ) ( not ( = ?auto_124623 ?auto_124629 ) ) ( not ( = ?auto_124624 ?auto_124629 ) ) ( not ( = ?auto_124625 ?auto_124629 ) ) ( not ( = ?auto_124626 ?auto_124629 ) ) ( not ( = ?auto_124627 ?auto_124629 ) ) ( ON ?auto_124626 ?auto_124627 ) ( ON-TABLE ?auto_124628 ) ( ON ?auto_124630 ?auto_124628 ) ( ON ?auto_124629 ?auto_124630 ) ( not ( = ?auto_124628 ?auto_124630 ) ) ( not ( = ?auto_124628 ?auto_124629 ) ) ( not ( = ?auto_124628 ?auto_124627 ) ) ( not ( = ?auto_124628 ?auto_124626 ) ) ( not ( = ?auto_124630 ?auto_124629 ) ) ( not ( = ?auto_124630 ?auto_124627 ) ) ( not ( = ?auto_124630 ?auto_124626 ) ) ( not ( = ?auto_124623 ?auto_124628 ) ) ( not ( = ?auto_124623 ?auto_124630 ) ) ( not ( = ?auto_124624 ?auto_124628 ) ) ( not ( = ?auto_124624 ?auto_124630 ) ) ( not ( = ?auto_124625 ?auto_124628 ) ) ( not ( = ?auto_124625 ?auto_124630 ) ) ( CLEAR ?auto_124624 ) ( ON ?auto_124625 ?auto_124626 ) ( CLEAR ?auto_124625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124628 ?auto_124630 ?auto_124629 ?auto_124627 ?auto_124626 )
      ( MAKE-5PILE ?auto_124623 ?auto_124624 ?auto_124625 ?auto_124626 ?auto_124627 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124631 - BLOCK
      ?auto_124632 - BLOCK
      ?auto_124633 - BLOCK
      ?auto_124634 - BLOCK
      ?auto_124635 - BLOCK
    )
    :vars
    (
      ?auto_124638 - BLOCK
      ?auto_124636 - BLOCK
      ?auto_124637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124631 ) ( not ( = ?auto_124631 ?auto_124632 ) ) ( not ( = ?auto_124631 ?auto_124633 ) ) ( not ( = ?auto_124631 ?auto_124634 ) ) ( not ( = ?auto_124631 ?auto_124635 ) ) ( not ( = ?auto_124632 ?auto_124633 ) ) ( not ( = ?auto_124632 ?auto_124634 ) ) ( not ( = ?auto_124632 ?auto_124635 ) ) ( not ( = ?auto_124633 ?auto_124634 ) ) ( not ( = ?auto_124633 ?auto_124635 ) ) ( not ( = ?auto_124634 ?auto_124635 ) ) ( ON ?auto_124635 ?auto_124638 ) ( not ( = ?auto_124631 ?auto_124638 ) ) ( not ( = ?auto_124632 ?auto_124638 ) ) ( not ( = ?auto_124633 ?auto_124638 ) ) ( not ( = ?auto_124634 ?auto_124638 ) ) ( not ( = ?auto_124635 ?auto_124638 ) ) ( ON ?auto_124634 ?auto_124635 ) ( ON-TABLE ?auto_124636 ) ( ON ?auto_124637 ?auto_124636 ) ( ON ?auto_124638 ?auto_124637 ) ( not ( = ?auto_124636 ?auto_124637 ) ) ( not ( = ?auto_124636 ?auto_124638 ) ) ( not ( = ?auto_124636 ?auto_124635 ) ) ( not ( = ?auto_124636 ?auto_124634 ) ) ( not ( = ?auto_124637 ?auto_124638 ) ) ( not ( = ?auto_124637 ?auto_124635 ) ) ( not ( = ?auto_124637 ?auto_124634 ) ) ( not ( = ?auto_124631 ?auto_124636 ) ) ( not ( = ?auto_124631 ?auto_124637 ) ) ( not ( = ?auto_124632 ?auto_124636 ) ) ( not ( = ?auto_124632 ?auto_124637 ) ) ( not ( = ?auto_124633 ?auto_124636 ) ) ( not ( = ?auto_124633 ?auto_124637 ) ) ( ON ?auto_124633 ?auto_124634 ) ( CLEAR ?auto_124633 ) ( HOLDING ?auto_124632 ) ( CLEAR ?auto_124631 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124631 ?auto_124632 )
      ( MAKE-5PILE ?auto_124631 ?auto_124632 ?auto_124633 ?auto_124634 ?auto_124635 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124639 - BLOCK
      ?auto_124640 - BLOCK
      ?auto_124641 - BLOCK
      ?auto_124642 - BLOCK
      ?auto_124643 - BLOCK
    )
    :vars
    (
      ?auto_124645 - BLOCK
      ?auto_124646 - BLOCK
      ?auto_124644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124639 ) ( not ( = ?auto_124639 ?auto_124640 ) ) ( not ( = ?auto_124639 ?auto_124641 ) ) ( not ( = ?auto_124639 ?auto_124642 ) ) ( not ( = ?auto_124639 ?auto_124643 ) ) ( not ( = ?auto_124640 ?auto_124641 ) ) ( not ( = ?auto_124640 ?auto_124642 ) ) ( not ( = ?auto_124640 ?auto_124643 ) ) ( not ( = ?auto_124641 ?auto_124642 ) ) ( not ( = ?auto_124641 ?auto_124643 ) ) ( not ( = ?auto_124642 ?auto_124643 ) ) ( ON ?auto_124643 ?auto_124645 ) ( not ( = ?auto_124639 ?auto_124645 ) ) ( not ( = ?auto_124640 ?auto_124645 ) ) ( not ( = ?auto_124641 ?auto_124645 ) ) ( not ( = ?auto_124642 ?auto_124645 ) ) ( not ( = ?auto_124643 ?auto_124645 ) ) ( ON ?auto_124642 ?auto_124643 ) ( ON-TABLE ?auto_124646 ) ( ON ?auto_124644 ?auto_124646 ) ( ON ?auto_124645 ?auto_124644 ) ( not ( = ?auto_124646 ?auto_124644 ) ) ( not ( = ?auto_124646 ?auto_124645 ) ) ( not ( = ?auto_124646 ?auto_124643 ) ) ( not ( = ?auto_124646 ?auto_124642 ) ) ( not ( = ?auto_124644 ?auto_124645 ) ) ( not ( = ?auto_124644 ?auto_124643 ) ) ( not ( = ?auto_124644 ?auto_124642 ) ) ( not ( = ?auto_124639 ?auto_124646 ) ) ( not ( = ?auto_124639 ?auto_124644 ) ) ( not ( = ?auto_124640 ?auto_124646 ) ) ( not ( = ?auto_124640 ?auto_124644 ) ) ( not ( = ?auto_124641 ?auto_124646 ) ) ( not ( = ?auto_124641 ?auto_124644 ) ) ( ON ?auto_124641 ?auto_124642 ) ( CLEAR ?auto_124639 ) ( ON ?auto_124640 ?auto_124641 ) ( CLEAR ?auto_124640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124646 ?auto_124644 ?auto_124645 ?auto_124643 ?auto_124642 ?auto_124641 )
      ( MAKE-5PILE ?auto_124639 ?auto_124640 ?auto_124641 ?auto_124642 ?auto_124643 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124647 - BLOCK
      ?auto_124648 - BLOCK
      ?auto_124649 - BLOCK
      ?auto_124650 - BLOCK
      ?auto_124651 - BLOCK
    )
    :vars
    (
      ?auto_124652 - BLOCK
      ?auto_124654 - BLOCK
      ?auto_124653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124647 ?auto_124648 ) ) ( not ( = ?auto_124647 ?auto_124649 ) ) ( not ( = ?auto_124647 ?auto_124650 ) ) ( not ( = ?auto_124647 ?auto_124651 ) ) ( not ( = ?auto_124648 ?auto_124649 ) ) ( not ( = ?auto_124648 ?auto_124650 ) ) ( not ( = ?auto_124648 ?auto_124651 ) ) ( not ( = ?auto_124649 ?auto_124650 ) ) ( not ( = ?auto_124649 ?auto_124651 ) ) ( not ( = ?auto_124650 ?auto_124651 ) ) ( ON ?auto_124651 ?auto_124652 ) ( not ( = ?auto_124647 ?auto_124652 ) ) ( not ( = ?auto_124648 ?auto_124652 ) ) ( not ( = ?auto_124649 ?auto_124652 ) ) ( not ( = ?auto_124650 ?auto_124652 ) ) ( not ( = ?auto_124651 ?auto_124652 ) ) ( ON ?auto_124650 ?auto_124651 ) ( ON-TABLE ?auto_124654 ) ( ON ?auto_124653 ?auto_124654 ) ( ON ?auto_124652 ?auto_124653 ) ( not ( = ?auto_124654 ?auto_124653 ) ) ( not ( = ?auto_124654 ?auto_124652 ) ) ( not ( = ?auto_124654 ?auto_124651 ) ) ( not ( = ?auto_124654 ?auto_124650 ) ) ( not ( = ?auto_124653 ?auto_124652 ) ) ( not ( = ?auto_124653 ?auto_124651 ) ) ( not ( = ?auto_124653 ?auto_124650 ) ) ( not ( = ?auto_124647 ?auto_124654 ) ) ( not ( = ?auto_124647 ?auto_124653 ) ) ( not ( = ?auto_124648 ?auto_124654 ) ) ( not ( = ?auto_124648 ?auto_124653 ) ) ( not ( = ?auto_124649 ?auto_124654 ) ) ( not ( = ?auto_124649 ?auto_124653 ) ) ( ON ?auto_124649 ?auto_124650 ) ( ON ?auto_124648 ?auto_124649 ) ( CLEAR ?auto_124648 ) ( HOLDING ?auto_124647 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124647 )
      ( MAKE-5PILE ?auto_124647 ?auto_124648 ?auto_124649 ?auto_124650 ?auto_124651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_124655 - BLOCK
      ?auto_124656 - BLOCK
      ?auto_124657 - BLOCK
      ?auto_124658 - BLOCK
      ?auto_124659 - BLOCK
    )
    :vars
    (
      ?auto_124662 - BLOCK
      ?auto_124661 - BLOCK
      ?auto_124660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124655 ?auto_124656 ) ) ( not ( = ?auto_124655 ?auto_124657 ) ) ( not ( = ?auto_124655 ?auto_124658 ) ) ( not ( = ?auto_124655 ?auto_124659 ) ) ( not ( = ?auto_124656 ?auto_124657 ) ) ( not ( = ?auto_124656 ?auto_124658 ) ) ( not ( = ?auto_124656 ?auto_124659 ) ) ( not ( = ?auto_124657 ?auto_124658 ) ) ( not ( = ?auto_124657 ?auto_124659 ) ) ( not ( = ?auto_124658 ?auto_124659 ) ) ( ON ?auto_124659 ?auto_124662 ) ( not ( = ?auto_124655 ?auto_124662 ) ) ( not ( = ?auto_124656 ?auto_124662 ) ) ( not ( = ?auto_124657 ?auto_124662 ) ) ( not ( = ?auto_124658 ?auto_124662 ) ) ( not ( = ?auto_124659 ?auto_124662 ) ) ( ON ?auto_124658 ?auto_124659 ) ( ON-TABLE ?auto_124661 ) ( ON ?auto_124660 ?auto_124661 ) ( ON ?auto_124662 ?auto_124660 ) ( not ( = ?auto_124661 ?auto_124660 ) ) ( not ( = ?auto_124661 ?auto_124662 ) ) ( not ( = ?auto_124661 ?auto_124659 ) ) ( not ( = ?auto_124661 ?auto_124658 ) ) ( not ( = ?auto_124660 ?auto_124662 ) ) ( not ( = ?auto_124660 ?auto_124659 ) ) ( not ( = ?auto_124660 ?auto_124658 ) ) ( not ( = ?auto_124655 ?auto_124661 ) ) ( not ( = ?auto_124655 ?auto_124660 ) ) ( not ( = ?auto_124656 ?auto_124661 ) ) ( not ( = ?auto_124656 ?auto_124660 ) ) ( not ( = ?auto_124657 ?auto_124661 ) ) ( not ( = ?auto_124657 ?auto_124660 ) ) ( ON ?auto_124657 ?auto_124658 ) ( ON ?auto_124656 ?auto_124657 ) ( ON ?auto_124655 ?auto_124656 ) ( CLEAR ?auto_124655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124661 ?auto_124660 ?auto_124662 ?auto_124659 ?auto_124658 ?auto_124657 ?auto_124656 )
      ( MAKE-5PILE ?auto_124655 ?auto_124656 ?auto_124657 ?auto_124658 ?auto_124659 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124665 - BLOCK
      ?auto_124666 - BLOCK
    )
    :vars
    (
      ?auto_124667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124667 ?auto_124666 ) ( CLEAR ?auto_124667 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124665 ) ( ON ?auto_124666 ?auto_124665 ) ( not ( = ?auto_124665 ?auto_124666 ) ) ( not ( = ?auto_124665 ?auto_124667 ) ) ( not ( = ?auto_124666 ?auto_124667 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124667 ?auto_124666 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124668 - BLOCK
      ?auto_124669 - BLOCK
    )
    :vars
    (
      ?auto_124670 - BLOCK
      ?auto_124671 - BLOCK
      ?auto_124672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124670 ?auto_124669 ) ( CLEAR ?auto_124670 ) ( ON-TABLE ?auto_124668 ) ( ON ?auto_124669 ?auto_124668 ) ( not ( = ?auto_124668 ?auto_124669 ) ) ( not ( = ?auto_124668 ?auto_124670 ) ) ( not ( = ?auto_124669 ?auto_124670 ) ) ( HOLDING ?auto_124671 ) ( CLEAR ?auto_124672 ) ( not ( = ?auto_124668 ?auto_124671 ) ) ( not ( = ?auto_124668 ?auto_124672 ) ) ( not ( = ?auto_124669 ?auto_124671 ) ) ( not ( = ?auto_124669 ?auto_124672 ) ) ( not ( = ?auto_124670 ?auto_124671 ) ) ( not ( = ?auto_124670 ?auto_124672 ) ) ( not ( = ?auto_124671 ?auto_124672 ) ) )
    :subtasks
    ( ( !STACK ?auto_124671 ?auto_124672 )
      ( MAKE-2PILE ?auto_124668 ?auto_124669 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124673 - BLOCK
      ?auto_124674 - BLOCK
    )
    :vars
    (
      ?auto_124676 - BLOCK
      ?auto_124675 - BLOCK
      ?auto_124677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124676 ?auto_124674 ) ( ON-TABLE ?auto_124673 ) ( ON ?auto_124674 ?auto_124673 ) ( not ( = ?auto_124673 ?auto_124674 ) ) ( not ( = ?auto_124673 ?auto_124676 ) ) ( not ( = ?auto_124674 ?auto_124676 ) ) ( CLEAR ?auto_124675 ) ( not ( = ?auto_124673 ?auto_124677 ) ) ( not ( = ?auto_124673 ?auto_124675 ) ) ( not ( = ?auto_124674 ?auto_124677 ) ) ( not ( = ?auto_124674 ?auto_124675 ) ) ( not ( = ?auto_124676 ?auto_124677 ) ) ( not ( = ?auto_124676 ?auto_124675 ) ) ( not ( = ?auto_124677 ?auto_124675 ) ) ( ON ?auto_124677 ?auto_124676 ) ( CLEAR ?auto_124677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124673 ?auto_124674 ?auto_124676 )
      ( MAKE-2PILE ?auto_124673 ?auto_124674 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124678 - BLOCK
      ?auto_124679 - BLOCK
    )
    :vars
    (
      ?auto_124680 - BLOCK
      ?auto_124682 - BLOCK
      ?auto_124681 - BLOCK
      ?auto_124685 - BLOCK
      ?auto_124684 - BLOCK
      ?auto_124683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124680 ?auto_124679 ) ( ON-TABLE ?auto_124678 ) ( ON ?auto_124679 ?auto_124678 ) ( not ( = ?auto_124678 ?auto_124679 ) ) ( not ( = ?auto_124678 ?auto_124680 ) ) ( not ( = ?auto_124679 ?auto_124680 ) ) ( not ( = ?auto_124678 ?auto_124682 ) ) ( not ( = ?auto_124678 ?auto_124681 ) ) ( not ( = ?auto_124679 ?auto_124682 ) ) ( not ( = ?auto_124679 ?auto_124681 ) ) ( not ( = ?auto_124680 ?auto_124682 ) ) ( not ( = ?auto_124680 ?auto_124681 ) ) ( not ( = ?auto_124682 ?auto_124681 ) ) ( ON ?auto_124682 ?auto_124680 ) ( CLEAR ?auto_124682 ) ( HOLDING ?auto_124681 ) ( CLEAR ?auto_124685 ) ( ON-TABLE ?auto_124684 ) ( ON ?auto_124683 ?auto_124684 ) ( ON ?auto_124685 ?auto_124683 ) ( not ( = ?auto_124684 ?auto_124683 ) ) ( not ( = ?auto_124684 ?auto_124685 ) ) ( not ( = ?auto_124684 ?auto_124681 ) ) ( not ( = ?auto_124683 ?auto_124685 ) ) ( not ( = ?auto_124683 ?auto_124681 ) ) ( not ( = ?auto_124685 ?auto_124681 ) ) ( not ( = ?auto_124678 ?auto_124685 ) ) ( not ( = ?auto_124678 ?auto_124684 ) ) ( not ( = ?auto_124678 ?auto_124683 ) ) ( not ( = ?auto_124679 ?auto_124685 ) ) ( not ( = ?auto_124679 ?auto_124684 ) ) ( not ( = ?auto_124679 ?auto_124683 ) ) ( not ( = ?auto_124680 ?auto_124685 ) ) ( not ( = ?auto_124680 ?auto_124684 ) ) ( not ( = ?auto_124680 ?auto_124683 ) ) ( not ( = ?auto_124682 ?auto_124685 ) ) ( not ( = ?auto_124682 ?auto_124684 ) ) ( not ( = ?auto_124682 ?auto_124683 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124684 ?auto_124683 ?auto_124685 ?auto_124681 )
      ( MAKE-2PILE ?auto_124678 ?auto_124679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124686 - BLOCK
      ?auto_124687 - BLOCK
    )
    :vars
    (
      ?auto_124688 - BLOCK
      ?auto_124693 - BLOCK
      ?auto_124691 - BLOCK
      ?auto_124690 - BLOCK
      ?auto_124689 - BLOCK
      ?auto_124692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124688 ?auto_124687 ) ( ON-TABLE ?auto_124686 ) ( ON ?auto_124687 ?auto_124686 ) ( not ( = ?auto_124686 ?auto_124687 ) ) ( not ( = ?auto_124686 ?auto_124688 ) ) ( not ( = ?auto_124687 ?auto_124688 ) ) ( not ( = ?auto_124686 ?auto_124693 ) ) ( not ( = ?auto_124686 ?auto_124691 ) ) ( not ( = ?auto_124687 ?auto_124693 ) ) ( not ( = ?auto_124687 ?auto_124691 ) ) ( not ( = ?auto_124688 ?auto_124693 ) ) ( not ( = ?auto_124688 ?auto_124691 ) ) ( not ( = ?auto_124693 ?auto_124691 ) ) ( ON ?auto_124693 ?auto_124688 ) ( CLEAR ?auto_124690 ) ( ON-TABLE ?auto_124689 ) ( ON ?auto_124692 ?auto_124689 ) ( ON ?auto_124690 ?auto_124692 ) ( not ( = ?auto_124689 ?auto_124692 ) ) ( not ( = ?auto_124689 ?auto_124690 ) ) ( not ( = ?auto_124689 ?auto_124691 ) ) ( not ( = ?auto_124692 ?auto_124690 ) ) ( not ( = ?auto_124692 ?auto_124691 ) ) ( not ( = ?auto_124690 ?auto_124691 ) ) ( not ( = ?auto_124686 ?auto_124690 ) ) ( not ( = ?auto_124686 ?auto_124689 ) ) ( not ( = ?auto_124686 ?auto_124692 ) ) ( not ( = ?auto_124687 ?auto_124690 ) ) ( not ( = ?auto_124687 ?auto_124689 ) ) ( not ( = ?auto_124687 ?auto_124692 ) ) ( not ( = ?auto_124688 ?auto_124690 ) ) ( not ( = ?auto_124688 ?auto_124689 ) ) ( not ( = ?auto_124688 ?auto_124692 ) ) ( not ( = ?auto_124693 ?auto_124690 ) ) ( not ( = ?auto_124693 ?auto_124689 ) ) ( not ( = ?auto_124693 ?auto_124692 ) ) ( ON ?auto_124691 ?auto_124693 ) ( CLEAR ?auto_124691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124686 ?auto_124687 ?auto_124688 ?auto_124693 )
      ( MAKE-2PILE ?auto_124686 ?auto_124687 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124694 - BLOCK
      ?auto_124695 - BLOCK
    )
    :vars
    (
      ?auto_124701 - BLOCK
      ?auto_124698 - BLOCK
      ?auto_124700 - BLOCK
      ?auto_124699 - BLOCK
      ?auto_124697 - BLOCK
      ?auto_124696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124701 ?auto_124695 ) ( ON-TABLE ?auto_124694 ) ( ON ?auto_124695 ?auto_124694 ) ( not ( = ?auto_124694 ?auto_124695 ) ) ( not ( = ?auto_124694 ?auto_124701 ) ) ( not ( = ?auto_124695 ?auto_124701 ) ) ( not ( = ?auto_124694 ?auto_124698 ) ) ( not ( = ?auto_124694 ?auto_124700 ) ) ( not ( = ?auto_124695 ?auto_124698 ) ) ( not ( = ?auto_124695 ?auto_124700 ) ) ( not ( = ?auto_124701 ?auto_124698 ) ) ( not ( = ?auto_124701 ?auto_124700 ) ) ( not ( = ?auto_124698 ?auto_124700 ) ) ( ON ?auto_124698 ?auto_124701 ) ( ON-TABLE ?auto_124699 ) ( ON ?auto_124697 ?auto_124699 ) ( not ( = ?auto_124699 ?auto_124697 ) ) ( not ( = ?auto_124699 ?auto_124696 ) ) ( not ( = ?auto_124699 ?auto_124700 ) ) ( not ( = ?auto_124697 ?auto_124696 ) ) ( not ( = ?auto_124697 ?auto_124700 ) ) ( not ( = ?auto_124696 ?auto_124700 ) ) ( not ( = ?auto_124694 ?auto_124696 ) ) ( not ( = ?auto_124694 ?auto_124699 ) ) ( not ( = ?auto_124694 ?auto_124697 ) ) ( not ( = ?auto_124695 ?auto_124696 ) ) ( not ( = ?auto_124695 ?auto_124699 ) ) ( not ( = ?auto_124695 ?auto_124697 ) ) ( not ( = ?auto_124701 ?auto_124696 ) ) ( not ( = ?auto_124701 ?auto_124699 ) ) ( not ( = ?auto_124701 ?auto_124697 ) ) ( not ( = ?auto_124698 ?auto_124696 ) ) ( not ( = ?auto_124698 ?auto_124699 ) ) ( not ( = ?auto_124698 ?auto_124697 ) ) ( ON ?auto_124700 ?auto_124698 ) ( CLEAR ?auto_124700 ) ( HOLDING ?auto_124696 ) ( CLEAR ?auto_124697 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124699 ?auto_124697 ?auto_124696 )
      ( MAKE-2PILE ?auto_124694 ?auto_124695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124702 - BLOCK
      ?auto_124703 - BLOCK
    )
    :vars
    (
      ?auto_124709 - BLOCK
      ?auto_124705 - BLOCK
      ?auto_124708 - BLOCK
      ?auto_124704 - BLOCK
      ?auto_124706 - BLOCK
      ?auto_124707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124709 ?auto_124703 ) ( ON-TABLE ?auto_124702 ) ( ON ?auto_124703 ?auto_124702 ) ( not ( = ?auto_124702 ?auto_124703 ) ) ( not ( = ?auto_124702 ?auto_124709 ) ) ( not ( = ?auto_124703 ?auto_124709 ) ) ( not ( = ?auto_124702 ?auto_124705 ) ) ( not ( = ?auto_124702 ?auto_124708 ) ) ( not ( = ?auto_124703 ?auto_124705 ) ) ( not ( = ?auto_124703 ?auto_124708 ) ) ( not ( = ?auto_124709 ?auto_124705 ) ) ( not ( = ?auto_124709 ?auto_124708 ) ) ( not ( = ?auto_124705 ?auto_124708 ) ) ( ON ?auto_124705 ?auto_124709 ) ( ON-TABLE ?auto_124704 ) ( ON ?auto_124706 ?auto_124704 ) ( not ( = ?auto_124704 ?auto_124706 ) ) ( not ( = ?auto_124704 ?auto_124707 ) ) ( not ( = ?auto_124704 ?auto_124708 ) ) ( not ( = ?auto_124706 ?auto_124707 ) ) ( not ( = ?auto_124706 ?auto_124708 ) ) ( not ( = ?auto_124707 ?auto_124708 ) ) ( not ( = ?auto_124702 ?auto_124707 ) ) ( not ( = ?auto_124702 ?auto_124704 ) ) ( not ( = ?auto_124702 ?auto_124706 ) ) ( not ( = ?auto_124703 ?auto_124707 ) ) ( not ( = ?auto_124703 ?auto_124704 ) ) ( not ( = ?auto_124703 ?auto_124706 ) ) ( not ( = ?auto_124709 ?auto_124707 ) ) ( not ( = ?auto_124709 ?auto_124704 ) ) ( not ( = ?auto_124709 ?auto_124706 ) ) ( not ( = ?auto_124705 ?auto_124707 ) ) ( not ( = ?auto_124705 ?auto_124704 ) ) ( not ( = ?auto_124705 ?auto_124706 ) ) ( ON ?auto_124708 ?auto_124705 ) ( CLEAR ?auto_124706 ) ( ON ?auto_124707 ?auto_124708 ) ( CLEAR ?auto_124707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124702 ?auto_124703 ?auto_124709 ?auto_124705 ?auto_124708 )
      ( MAKE-2PILE ?auto_124702 ?auto_124703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124710 - BLOCK
      ?auto_124711 - BLOCK
    )
    :vars
    (
      ?auto_124714 - BLOCK
      ?auto_124717 - BLOCK
      ?auto_124713 - BLOCK
      ?auto_124715 - BLOCK
      ?auto_124716 - BLOCK
      ?auto_124712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124714 ?auto_124711 ) ( ON-TABLE ?auto_124710 ) ( ON ?auto_124711 ?auto_124710 ) ( not ( = ?auto_124710 ?auto_124711 ) ) ( not ( = ?auto_124710 ?auto_124714 ) ) ( not ( = ?auto_124711 ?auto_124714 ) ) ( not ( = ?auto_124710 ?auto_124717 ) ) ( not ( = ?auto_124710 ?auto_124713 ) ) ( not ( = ?auto_124711 ?auto_124717 ) ) ( not ( = ?auto_124711 ?auto_124713 ) ) ( not ( = ?auto_124714 ?auto_124717 ) ) ( not ( = ?auto_124714 ?auto_124713 ) ) ( not ( = ?auto_124717 ?auto_124713 ) ) ( ON ?auto_124717 ?auto_124714 ) ( ON-TABLE ?auto_124715 ) ( not ( = ?auto_124715 ?auto_124716 ) ) ( not ( = ?auto_124715 ?auto_124712 ) ) ( not ( = ?auto_124715 ?auto_124713 ) ) ( not ( = ?auto_124716 ?auto_124712 ) ) ( not ( = ?auto_124716 ?auto_124713 ) ) ( not ( = ?auto_124712 ?auto_124713 ) ) ( not ( = ?auto_124710 ?auto_124712 ) ) ( not ( = ?auto_124710 ?auto_124715 ) ) ( not ( = ?auto_124710 ?auto_124716 ) ) ( not ( = ?auto_124711 ?auto_124712 ) ) ( not ( = ?auto_124711 ?auto_124715 ) ) ( not ( = ?auto_124711 ?auto_124716 ) ) ( not ( = ?auto_124714 ?auto_124712 ) ) ( not ( = ?auto_124714 ?auto_124715 ) ) ( not ( = ?auto_124714 ?auto_124716 ) ) ( not ( = ?auto_124717 ?auto_124712 ) ) ( not ( = ?auto_124717 ?auto_124715 ) ) ( not ( = ?auto_124717 ?auto_124716 ) ) ( ON ?auto_124713 ?auto_124717 ) ( ON ?auto_124712 ?auto_124713 ) ( CLEAR ?auto_124712 ) ( HOLDING ?auto_124716 ) ( CLEAR ?auto_124715 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124715 ?auto_124716 )
      ( MAKE-2PILE ?auto_124710 ?auto_124711 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124718 - BLOCK
      ?auto_124719 - BLOCK
    )
    :vars
    (
      ?auto_124724 - BLOCK
      ?auto_124720 - BLOCK
      ?auto_124725 - BLOCK
      ?auto_124723 - BLOCK
      ?auto_124721 - BLOCK
      ?auto_124722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124724 ?auto_124719 ) ( ON-TABLE ?auto_124718 ) ( ON ?auto_124719 ?auto_124718 ) ( not ( = ?auto_124718 ?auto_124719 ) ) ( not ( = ?auto_124718 ?auto_124724 ) ) ( not ( = ?auto_124719 ?auto_124724 ) ) ( not ( = ?auto_124718 ?auto_124720 ) ) ( not ( = ?auto_124718 ?auto_124725 ) ) ( not ( = ?auto_124719 ?auto_124720 ) ) ( not ( = ?auto_124719 ?auto_124725 ) ) ( not ( = ?auto_124724 ?auto_124720 ) ) ( not ( = ?auto_124724 ?auto_124725 ) ) ( not ( = ?auto_124720 ?auto_124725 ) ) ( ON ?auto_124720 ?auto_124724 ) ( ON-TABLE ?auto_124723 ) ( not ( = ?auto_124723 ?auto_124721 ) ) ( not ( = ?auto_124723 ?auto_124722 ) ) ( not ( = ?auto_124723 ?auto_124725 ) ) ( not ( = ?auto_124721 ?auto_124722 ) ) ( not ( = ?auto_124721 ?auto_124725 ) ) ( not ( = ?auto_124722 ?auto_124725 ) ) ( not ( = ?auto_124718 ?auto_124722 ) ) ( not ( = ?auto_124718 ?auto_124723 ) ) ( not ( = ?auto_124718 ?auto_124721 ) ) ( not ( = ?auto_124719 ?auto_124722 ) ) ( not ( = ?auto_124719 ?auto_124723 ) ) ( not ( = ?auto_124719 ?auto_124721 ) ) ( not ( = ?auto_124724 ?auto_124722 ) ) ( not ( = ?auto_124724 ?auto_124723 ) ) ( not ( = ?auto_124724 ?auto_124721 ) ) ( not ( = ?auto_124720 ?auto_124722 ) ) ( not ( = ?auto_124720 ?auto_124723 ) ) ( not ( = ?auto_124720 ?auto_124721 ) ) ( ON ?auto_124725 ?auto_124720 ) ( ON ?auto_124722 ?auto_124725 ) ( CLEAR ?auto_124723 ) ( ON ?auto_124721 ?auto_124722 ) ( CLEAR ?auto_124721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124718 ?auto_124719 ?auto_124724 ?auto_124720 ?auto_124725 ?auto_124722 )
      ( MAKE-2PILE ?auto_124718 ?auto_124719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124726 - BLOCK
      ?auto_124727 - BLOCK
    )
    :vars
    (
      ?auto_124732 - BLOCK
      ?auto_124729 - BLOCK
      ?auto_124733 - BLOCK
      ?auto_124728 - BLOCK
      ?auto_124730 - BLOCK
      ?auto_124731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124732 ?auto_124727 ) ( ON-TABLE ?auto_124726 ) ( ON ?auto_124727 ?auto_124726 ) ( not ( = ?auto_124726 ?auto_124727 ) ) ( not ( = ?auto_124726 ?auto_124732 ) ) ( not ( = ?auto_124727 ?auto_124732 ) ) ( not ( = ?auto_124726 ?auto_124729 ) ) ( not ( = ?auto_124726 ?auto_124733 ) ) ( not ( = ?auto_124727 ?auto_124729 ) ) ( not ( = ?auto_124727 ?auto_124733 ) ) ( not ( = ?auto_124732 ?auto_124729 ) ) ( not ( = ?auto_124732 ?auto_124733 ) ) ( not ( = ?auto_124729 ?auto_124733 ) ) ( ON ?auto_124729 ?auto_124732 ) ( not ( = ?auto_124728 ?auto_124730 ) ) ( not ( = ?auto_124728 ?auto_124731 ) ) ( not ( = ?auto_124728 ?auto_124733 ) ) ( not ( = ?auto_124730 ?auto_124731 ) ) ( not ( = ?auto_124730 ?auto_124733 ) ) ( not ( = ?auto_124731 ?auto_124733 ) ) ( not ( = ?auto_124726 ?auto_124731 ) ) ( not ( = ?auto_124726 ?auto_124728 ) ) ( not ( = ?auto_124726 ?auto_124730 ) ) ( not ( = ?auto_124727 ?auto_124731 ) ) ( not ( = ?auto_124727 ?auto_124728 ) ) ( not ( = ?auto_124727 ?auto_124730 ) ) ( not ( = ?auto_124732 ?auto_124731 ) ) ( not ( = ?auto_124732 ?auto_124728 ) ) ( not ( = ?auto_124732 ?auto_124730 ) ) ( not ( = ?auto_124729 ?auto_124731 ) ) ( not ( = ?auto_124729 ?auto_124728 ) ) ( not ( = ?auto_124729 ?auto_124730 ) ) ( ON ?auto_124733 ?auto_124729 ) ( ON ?auto_124731 ?auto_124733 ) ( ON ?auto_124730 ?auto_124731 ) ( CLEAR ?auto_124730 ) ( HOLDING ?auto_124728 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124728 )
      ( MAKE-2PILE ?auto_124726 ?auto_124727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_124734 - BLOCK
      ?auto_124735 - BLOCK
    )
    :vars
    (
      ?auto_124738 - BLOCK
      ?auto_124737 - BLOCK
      ?auto_124736 - BLOCK
      ?auto_124740 - BLOCK
      ?auto_124739 - BLOCK
      ?auto_124741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124738 ?auto_124735 ) ( ON-TABLE ?auto_124734 ) ( ON ?auto_124735 ?auto_124734 ) ( not ( = ?auto_124734 ?auto_124735 ) ) ( not ( = ?auto_124734 ?auto_124738 ) ) ( not ( = ?auto_124735 ?auto_124738 ) ) ( not ( = ?auto_124734 ?auto_124737 ) ) ( not ( = ?auto_124734 ?auto_124736 ) ) ( not ( = ?auto_124735 ?auto_124737 ) ) ( not ( = ?auto_124735 ?auto_124736 ) ) ( not ( = ?auto_124738 ?auto_124737 ) ) ( not ( = ?auto_124738 ?auto_124736 ) ) ( not ( = ?auto_124737 ?auto_124736 ) ) ( ON ?auto_124737 ?auto_124738 ) ( not ( = ?auto_124740 ?auto_124739 ) ) ( not ( = ?auto_124740 ?auto_124741 ) ) ( not ( = ?auto_124740 ?auto_124736 ) ) ( not ( = ?auto_124739 ?auto_124741 ) ) ( not ( = ?auto_124739 ?auto_124736 ) ) ( not ( = ?auto_124741 ?auto_124736 ) ) ( not ( = ?auto_124734 ?auto_124741 ) ) ( not ( = ?auto_124734 ?auto_124740 ) ) ( not ( = ?auto_124734 ?auto_124739 ) ) ( not ( = ?auto_124735 ?auto_124741 ) ) ( not ( = ?auto_124735 ?auto_124740 ) ) ( not ( = ?auto_124735 ?auto_124739 ) ) ( not ( = ?auto_124738 ?auto_124741 ) ) ( not ( = ?auto_124738 ?auto_124740 ) ) ( not ( = ?auto_124738 ?auto_124739 ) ) ( not ( = ?auto_124737 ?auto_124741 ) ) ( not ( = ?auto_124737 ?auto_124740 ) ) ( not ( = ?auto_124737 ?auto_124739 ) ) ( ON ?auto_124736 ?auto_124737 ) ( ON ?auto_124741 ?auto_124736 ) ( ON ?auto_124739 ?auto_124741 ) ( ON ?auto_124740 ?auto_124739 ) ( CLEAR ?auto_124740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124734 ?auto_124735 ?auto_124738 ?auto_124737 ?auto_124736 ?auto_124741 ?auto_124739 )
      ( MAKE-2PILE ?auto_124734 ?auto_124735 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124748 - BLOCK
      ?auto_124749 - BLOCK
      ?auto_124750 - BLOCK
      ?auto_124751 - BLOCK
      ?auto_124752 - BLOCK
      ?auto_124753 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_124753 ) ( CLEAR ?auto_124752 ) ( ON-TABLE ?auto_124748 ) ( ON ?auto_124749 ?auto_124748 ) ( ON ?auto_124750 ?auto_124749 ) ( ON ?auto_124751 ?auto_124750 ) ( ON ?auto_124752 ?auto_124751 ) ( not ( = ?auto_124748 ?auto_124749 ) ) ( not ( = ?auto_124748 ?auto_124750 ) ) ( not ( = ?auto_124748 ?auto_124751 ) ) ( not ( = ?auto_124748 ?auto_124752 ) ) ( not ( = ?auto_124748 ?auto_124753 ) ) ( not ( = ?auto_124749 ?auto_124750 ) ) ( not ( = ?auto_124749 ?auto_124751 ) ) ( not ( = ?auto_124749 ?auto_124752 ) ) ( not ( = ?auto_124749 ?auto_124753 ) ) ( not ( = ?auto_124750 ?auto_124751 ) ) ( not ( = ?auto_124750 ?auto_124752 ) ) ( not ( = ?auto_124750 ?auto_124753 ) ) ( not ( = ?auto_124751 ?auto_124752 ) ) ( not ( = ?auto_124751 ?auto_124753 ) ) ( not ( = ?auto_124752 ?auto_124753 ) ) )
    :subtasks
    ( ( !STACK ?auto_124753 ?auto_124752 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124754 - BLOCK
      ?auto_124755 - BLOCK
      ?auto_124756 - BLOCK
      ?auto_124757 - BLOCK
      ?auto_124758 - BLOCK
      ?auto_124759 - BLOCK
    )
    :vars
    (
      ?auto_124760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124758 ) ( ON-TABLE ?auto_124754 ) ( ON ?auto_124755 ?auto_124754 ) ( ON ?auto_124756 ?auto_124755 ) ( ON ?auto_124757 ?auto_124756 ) ( ON ?auto_124758 ?auto_124757 ) ( not ( = ?auto_124754 ?auto_124755 ) ) ( not ( = ?auto_124754 ?auto_124756 ) ) ( not ( = ?auto_124754 ?auto_124757 ) ) ( not ( = ?auto_124754 ?auto_124758 ) ) ( not ( = ?auto_124754 ?auto_124759 ) ) ( not ( = ?auto_124755 ?auto_124756 ) ) ( not ( = ?auto_124755 ?auto_124757 ) ) ( not ( = ?auto_124755 ?auto_124758 ) ) ( not ( = ?auto_124755 ?auto_124759 ) ) ( not ( = ?auto_124756 ?auto_124757 ) ) ( not ( = ?auto_124756 ?auto_124758 ) ) ( not ( = ?auto_124756 ?auto_124759 ) ) ( not ( = ?auto_124757 ?auto_124758 ) ) ( not ( = ?auto_124757 ?auto_124759 ) ) ( not ( = ?auto_124758 ?auto_124759 ) ) ( ON ?auto_124759 ?auto_124760 ) ( CLEAR ?auto_124759 ) ( HAND-EMPTY ) ( not ( = ?auto_124754 ?auto_124760 ) ) ( not ( = ?auto_124755 ?auto_124760 ) ) ( not ( = ?auto_124756 ?auto_124760 ) ) ( not ( = ?auto_124757 ?auto_124760 ) ) ( not ( = ?auto_124758 ?auto_124760 ) ) ( not ( = ?auto_124759 ?auto_124760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124759 ?auto_124760 )
      ( MAKE-6PILE ?auto_124754 ?auto_124755 ?auto_124756 ?auto_124757 ?auto_124758 ?auto_124759 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124761 - BLOCK
      ?auto_124762 - BLOCK
      ?auto_124763 - BLOCK
      ?auto_124764 - BLOCK
      ?auto_124765 - BLOCK
      ?auto_124766 - BLOCK
    )
    :vars
    (
      ?auto_124767 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124761 ) ( ON ?auto_124762 ?auto_124761 ) ( ON ?auto_124763 ?auto_124762 ) ( ON ?auto_124764 ?auto_124763 ) ( not ( = ?auto_124761 ?auto_124762 ) ) ( not ( = ?auto_124761 ?auto_124763 ) ) ( not ( = ?auto_124761 ?auto_124764 ) ) ( not ( = ?auto_124761 ?auto_124765 ) ) ( not ( = ?auto_124761 ?auto_124766 ) ) ( not ( = ?auto_124762 ?auto_124763 ) ) ( not ( = ?auto_124762 ?auto_124764 ) ) ( not ( = ?auto_124762 ?auto_124765 ) ) ( not ( = ?auto_124762 ?auto_124766 ) ) ( not ( = ?auto_124763 ?auto_124764 ) ) ( not ( = ?auto_124763 ?auto_124765 ) ) ( not ( = ?auto_124763 ?auto_124766 ) ) ( not ( = ?auto_124764 ?auto_124765 ) ) ( not ( = ?auto_124764 ?auto_124766 ) ) ( not ( = ?auto_124765 ?auto_124766 ) ) ( ON ?auto_124766 ?auto_124767 ) ( CLEAR ?auto_124766 ) ( not ( = ?auto_124761 ?auto_124767 ) ) ( not ( = ?auto_124762 ?auto_124767 ) ) ( not ( = ?auto_124763 ?auto_124767 ) ) ( not ( = ?auto_124764 ?auto_124767 ) ) ( not ( = ?auto_124765 ?auto_124767 ) ) ( not ( = ?auto_124766 ?auto_124767 ) ) ( HOLDING ?auto_124765 ) ( CLEAR ?auto_124764 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124761 ?auto_124762 ?auto_124763 ?auto_124764 ?auto_124765 )
      ( MAKE-6PILE ?auto_124761 ?auto_124762 ?auto_124763 ?auto_124764 ?auto_124765 ?auto_124766 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124768 - BLOCK
      ?auto_124769 - BLOCK
      ?auto_124770 - BLOCK
      ?auto_124771 - BLOCK
      ?auto_124772 - BLOCK
      ?auto_124773 - BLOCK
    )
    :vars
    (
      ?auto_124774 - BLOCK
      ?auto_124775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124768 ) ( ON ?auto_124769 ?auto_124768 ) ( ON ?auto_124770 ?auto_124769 ) ( ON ?auto_124771 ?auto_124770 ) ( not ( = ?auto_124768 ?auto_124769 ) ) ( not ( = ?auto_124768 ?auto_124770 ) ) ( not ( = ?auto_124768 ?auto_124771 ) ) ( not ( = ?auto_124768 ?auto_124772 ) ) ( not ( = ?auto_124768 ?auto_124773 ) ) ( not ( = ?auto_124769 ?auto_124770 ) ) ( not ( = ?auto_124769 ?auto_124771 ) ) ( not ( = ?auto_124769 ?auto_124772 ) ) ( not ( = ?auto_124769 ?auto_124773 ) ) ( not ( = ?auto_124770 ?auto_124771 ) ) ( not ( = ?auto_124770 ?auto_124772 ) ) ( not ( = ?auto_124770 ?auto_124773 ) ) ( not ( = ?auto_124771 ?auto_124772 ) ) ( not ( = ?auto_124771 ?auto_124773 ) ) ( not ( = ?auto_124772 ?auto_124773 ) ) ( ON ?auto_124773 ?auto_124774 ) ( not ( = ?auto_124768 ?auto_124774 ) ) ( not ( = ?auto_124769 ?auto_124774 ) ) ( not ( = ?auto_124770 ?auto_124774 ) ) ( not ( = ?auto_124771 ?auto_124774 ) ) ( not ( = ?auto_124772 ?auto_124774 ) ) ( not ( = ?auto_124773 ?auto_124774 ) ) ( CLEAR ?auto_124771 ) ( ON ?auto_124772 ?auto_124773 ) ( CLEAR ?auto_124772 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124775 ) ( ON ?auto_124774 ?auto_124775 ) ( not ( = ?auto_124775 ?auto_124774 ) ) ( not ( = ?auto_124775 ?auto_124773 ) ) ( not ( = ?auto_124775 ?auto_124772 ) ) ( not ( = ?auto_124768 ?auto_124775 ) ) ( not ( = ?auto_124769 ?auto_124775 ) ) ( not ( = ?auto_124770 ?auto_124775 ) ) ( not ( = ?auto_124771 ?auto_124775 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124775 ?auto_124774 ?auto_124773 )
      ( MAKE-6PILE ?auto_124768 ?auto_124769 ?auto_124770 ?auto_124771 ?auto_124772 ?auto_124773 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124776 - BLOCK
      ?auto_124777 - BLOCK
      ?auto_124778 - BLOCK
      ?auto_124779 - BLOCK
      ?auto_124780 - BLOCK
      ?auto_124781 - BLOCK
    )
    :vars
    (
      ?auto_124782 - BLOCK
      ?auto_124783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124776 ) ( ON ?auto_124777 ?auto_124776 ) ( ON ?auto_124778 ?auto_124777 ) ( not ( = ?auto_124776 ?auto_124777 ) ) ( not ( = ?auto_124776 ?auto_124778 ) ) ( not ( = ?auto_124776 ?auto_124779 ) ) ( not ( = ?auto_124776 ?auto_124780 ) ) ( not ( = ?auto_124776 ?auto_124781 ) ) ( not ( = ?auto_124777 ?auto_124778 ) ) ( not ( = ?auto_124777 ?auto_124779 ) ) ( not ( = ?auto_124777 ?auto_124780 ) ) ( not ( = ?auto_124777 ?auto_124781 ) ) ( not ( = ?auto_124778 ?auto_124779 ) ) ( not ( = ?auto_124778 ?auto_124780 ) ) ( not ( = ?auto_124778 ?auto_124781 ) ) ( not ( = ?auto_124779 ?auto_124780 ) ) ( not ( = ?auto_124779 ?auto_124781 ) ) ( not ( = ?auto_124780 ?auto_124781 ) ) ( ON ?auto_124781 ?auto_124782 ) ( not ( = ?auto_124776 ?auto_124782 ) ) ( not ( = ?auto_124777 ?auto_124782 ) ) ( not ( = ?auto_124778 ?auto_124782 ) ) ( not ( = ?auto_124779 ?auto_124782 ) ) ( not ( = ?auto_124780 ?auto_124782 ) ) ( not ( = ?auto_124781 ?auto_124782 ) ) ( ON ?auto_124780 ?auto_124781 ) ( CLEAR ?auto_124780 ) ( ON-TABLE ?auto_124783 ) ( ON ?auto_124782 ?auto_124783 ) ( not ( = ?auto_124783 ?auto_124782 ) ) ( not ( = ?auto_124783 ?auto_124781 ) ) ( not ( = ?auto_124783 ?auto_124780 ) ) ( not ( = ?auto_124776 ?auto_124783 ) ) ( not ( = ?auto_124777 ?auto_124783 ) ) ( not ( = ?auto_124778 ?auto_124783 ) ) ( not ( = ?auto_124779 ?auto_124783 ) ) ( HOLDING ?auto_124779 ) ( CLEAR ?auto_124778 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124776 ?auto_124777 ?auto_124778 ?auto_124779 )
      ( MAKE-6PILE ?auto_124776 ?auto_124777 ?auto_124778 ?auto_124779 ?auto_124780 ?auto_124781 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124784 - BLOCK
      ?auto_124785 - BLOCK
      ?auto_124786 - BLOCK
      ?auto_124787 - BLOCK
      ?auto_124788 - BLOCK
      ?auto_124789 - BLOCK
    )
    :vars
    (
      ?auto_124790 - BLOCK
      ?auto_124791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124784 ) ( ON ?auto_124785 ?auto_124784 ) ( ON ?auto_124786 ?auto_124785 ) ( not ( = ?auto_124784 ?auto_124785 ) ) ( not ( = ?auto_124784 ?auto_124786 ) ) ( not ( = ?auto_124784 ?auto_124787 ) ) ( not ( = ?auto_124784 ?auto_124788 ) ) ( not ( = ?auto_124784 ?auto_124789 ) ) ( not ( = ?auto_124785 ?auto_124786 ) ) ( not ( = ?auto_124785 ?auto_124787 ) ) ( not ( = ?auto_124785 ?auto_124788 ) ) ( not ( = ?auto_124785 ?auto_124789 ) ) ( not ( = ?auto_124786 ?auto_124787 ) ) ( not ( = ?auto_124786 ?auto_124788 ) ) ( not ( = ?auto_124786 ?auto_124789 ) ) ( not ( = ?auto_124787 ?auto_124788 ) ) ( not ( = ?auto_124787 ?auto_124789 ) ) ( not ( = ?auto_124788 ?auto_124789 ) ) ( ON ?auto_124789 ?auto_124790 ) ( not ( = ?auto_124784 ?auto_124790 ) ) ( not ( = ?auto_124785 ?auto_124790 ) ) ( not ( = ?auto_124786 ?auto_124790 ) ) ( not ( = ?auto_124787 ?auto_124790 ) ) ( not ( = ?auto_124788 ?auto_124790 ) ) ( not ( = ?auto_124789 ?auto_124790 ) ) ( ON ?auto_124788 ?auto_124789 ) ( ON-TABLE ?auto_124791 ) ( ON ?auto_124790 ?auto_124791 ) ( not ( = ?auto_124791 ?auto_124790 ) ) ( not ( = ?auto_124791 ?auto_124789 ) ) ( not ( = ?auto_124791 ?auto_124788 ) ) ( not ( = ?auto_124784 ?auto_124791 ) ) ( not ( = ?auto_124785 ?auto_124791 ) ) ( not ( = ?auto_124786 ?auto_124791 ) ) ( not ( = ?auto_124787 ?auto_124791 ) ) ( CLEAR ?auto_124786 ) ( ON ?auto_124787 ?auto_124788 ) ( CLEAR ?auto_124787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124791 ?auto_124790 ?auto_124789 ?auto_124788 )
      ( MAKE-6PILE ?auto_124784 ?auto_124785 ?auto_124786 ?auto_124787 ?auto_124788 ?auto_124789 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124792 - BLOCK
      ?auto_124793 - BLOCK
      ?auto_124794 - BLOCK
      ?auto_124795 - BLOCK
      ?auto_124796 - BLOCK
      ?auto_124797 - BLOCK
    )
    :vars
    (
      ?auto_124799 - BLOCK
      ?auto_124798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124792 ) ( ON ?auto_124793 ?auto_124792 ) ( not ( = ?auto_124792 ?auto_124793 ) ) ( not ( = ?auto_124792 ?auto_124794 ) ) ( not ( = ?auto_124792 ?auto_124795 ) ) ( not ( = ?auto_124792 ?auto_124796 ) ) ( not ( = ?auto_124792 ?auto_124797 ) ) ( not ( = ?auto_124793 ?auto_124794 ) ) ( not ( = ?auto_124793 ?auto_124795 ) ) ( not ( = ?auto_124793 ?auto_124796 ) ) ( not ( = ?auto_124793 ?auto_124797 ) ) ( not ( = ?auto_124794 ?auto_124795 ) ) ( not ( = ?auto_124794 ?auto_124796 ) ) ( not ( = ?auto_124794 ?auto_124797 ) ) ( not ( = ?auto_124795 ?auto_124796 ) ) ( not ( = ?auto_124795 ?auto_124797 ) ) ( not ( = ?auto_124796 ?auto_124797 ) ) ( ON ?auto_124797 ?auto_124799 ) ( not ( = ?auto_124792 ?auto_124799 ) ) ( not ( = ?auto_124793 ?auto_124799 ) ) ( not ( = ?auto_124794 ?auto_124799 ) ) ( not ( = ?auto_124795 ?auto_124799 ) ) ( not ( = ?auto_124796 ?auto_124799 ) ) ( not ( = ?auto_124797 ?auto_124799 ) ) ( ON ?auto_124796 ?auto_124797 ) ( ON-TABLE ?auto_124798 ) ( ON ?auto_124799 ?auto_124798 ) ( not ( = ?auto_124798 ?auto_124799 ) ) ( not ( = ?auto_124798 ?auto_124797 ) ) ( not ( = ?auto_124798 ?auto_124796 ) ) ( not ( = ?auto_124792 ?auto_124798 ) ) ( not ( = ?auto_124793 ?auto_124798 ) ) ( not ( = ?auto_124794 ?auto_124798 ) ) ( not ( = ?auto_124795 ?auto_124798 ) ) ( ON ?auto_124795 ?auto_124796 ) ( CLEAR ?auto_124795 ) ( HOLDING ?auto_124794 ) ( CLEAR ?auto_124793 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124792 ?auto_124793 ?auto_124794 )
      ( MAKE-6PILE ?auto_124792 ?auto_124793 ?auto_124794 ?auto_124795 ?auto_124796 ?auto_124797 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124800 - BLOCK
      ?auto_124801 - BLOCK
      ?auto_124802 - BLOCK
      ?auto_124803 - BLOCK
      ?auto_124804 - BLOCK
      ?auto_124805 - BLOCK
    )
    :vars
    (
      ?auto_124807 - BLOCK
      ?auto_124806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124800 ) ( ON ?auto_124801 ?auto_124800 ) ( not ( = ?auto_124800 ?auto_124801 ) ) ( not ( = ?auto_124800 ?auto_124802 ) ) ( not ( = ?auto_124800 ?auto_124803 ) ) ( not ( = ?auto_124800 ?auto_124804 ) ) ( not ( = ?auto_124800 ?auto_124805 ) ) ( not ( = ?auto_124801 ?auto_124802 ) ) ( not ( = ?auto_124801 ?auto_124803 ) ) ( not ( = ?auto_124801 ?auto_124804 ) ) ( not ( = ?auto_124801 ?auto_124805 ) ) ( not ( = ?auto_124802 ?auto_124803 ) ) ( not ( = ?auto_124802 ?auto_124804 ) ) ( not ( = ?auto_124802 ?auto_124805 ) ) ( not ( = ?auto_124803 ?auto_124804 ) ) ( not ( = ?auto_124803 ?auto_124805 ) ) ( not ( = ?auto_124804 ?auto_124805 ) ) ( ON ?auto_124805 ?auto_124807 ) ( not ( = ?auto_124800 ?auto_124807 ) ) ( not ( = ?auto_124801 ?auto_124807 ) ) ( not ( = ?auto_124802 ?auto_124807 ) ) ( not ( = ?auto_124803 ?auto_124807 ) ) ( not ( = ?auto_124804 ?auto_124807 ) ) ( not ( = ?auto_124805 ?auto_124807 ) ) ( ON ?auto_124804 ?auto_124805 ) ( ON-TABLE ?auto_124806 ) ( ON ?auto_124807 ?auto_124806 ) ( not ( = ?auto_124806 ?auto_124807 ) ) ( not ( = ?auto_124806 ?auto_124805 ) ) ( not ( = ?auto_124806 ?auto_124804 ) ) ( not ( = ?auto_124800 ?auto_124806 ) ) ( not ( = ?auto_124801 ?auto_124806 ) ) ( not ( = ?auto_124802 ?auto_124806 ) ) ( not ( = ?auto_124803 ?auto_124806 ) ) ( ON ?auto_124803 ?auto_124804 ) ( CLEAR ?auto_124801 ) ( ON ?auto_124802 ?auto_124803 ) ( CLEAR ?auto_124802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124806 ?auto_124807 ?auto_124805 ?auto_124804 ?auto_124803 )
      ( MAKE-6PILE ?auto_124800 ?auto_124801 ?auto_124802 ?auto_124803 ?auto_124804 ?auto_124805 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124808 - BLOCK
      ?auto_124809 - BLOCK
      ?auto_124810 - BLOCK
      ?auto_124811 - BLOCK
      ?auto_124812 - BLOCK
      ?auto_124813 - BLOCK
    )
    :vars
    (
      ?auto_124815 - BLOCK
      ?auto_124814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124808 ) ( not ( = ?auto_124808 ?auto_124809 ) ) ( not ( = ?auto_124808 ?auto_124810 ) ) ( not ( = ?auto_124808 ?auto_124811 ) ) ( not ( = ?auto_124808 ?auto_124812 ) ) ( not ( = ?auto_124808 ?auto_124813 ) ) ( not ( = ?auto_124809 ?auto_124810 ) ) ( not ( = ?auto_124809 ?auto_124811 ) ) ( not ( = ?auto_124809 ?auto_124812 ) ) ( not ( = ?auto_124809 ?auto_124813 ) ) ( not ( = ?auto_124810 ?auto_124811 ) ) ( not ( = ?auto_124810 ?auto_124812 ) ) ( not ( = ?auto_124810 ?auto_124813 ) ) ( not ( = ?auto_124811 ?auto_124812 ) ) ( not ( = ?auto_124811 ?auto_124813 ) ) ( not ( = ?auto_124812 ?auto_124813 ) ) ( ON ?auto_124813 ?auto_124815 ) ( not ( = ?auto_124808 ?auto_124815 ) ) ( not ( = ?auto_124809 ?auto_124815 ) ) ( not ( = ?auto_124810 ?auto_124815 ) ) ( not ( = ?auto_124811 ?auto_124815 ) ) ( not ( = ?auto_124812 ?auto_124815 ) ) ( not ( = ?auto_124813 ?auto_124815 ) ) ( ON ?auto_124812 ?auto_124813 ) ( ON-TABLE ?auto_124814 ) ( ON ?auto_124815 ?auto_124814 ) ( not ( = ?auto_124814 ?auto_124815 ) ) ( not ( = ?auto_124814 ?auto_124813 ) ) ( not ( = ?auto_124814 ?auto_124812 ) ) ( not ( = ?auto_124808 ?auto_124814 ) ) ( not ( = ?auto_124809 ?auto_124814 ) ) ( not ( = ?auto_124810 ?auto_124814 ) ) ( not ( = ?auto_124811 ?auto_124814 ) ) ( ON ?auto_124811 ?auto_124812 ) ( ON ?auto_124810 ?auto_124811 ) ( CLEAR ?auto_124810 ) ( HOLDING ?auto_124809 ) ( CLEAR ?auto_124808 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124808 ?auto_124809 )
      ( MAKE-6PILE ?auto_124808 ?auto_124809 ?auto_124810 ?auto_124811 ?auto_124812 ?auto_124813 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124816 - BLOCK
      ?auto_124817 - BLOCK
      ?auto_124818 - BLOCK
      ?auto_124819 - BLOCK
      ?auto_124820 - BLOCK
      ?auto_124821 - BLOCK
    )
    :vars
    (
      ?auto_124822 - BLOCK
      ?auto_124823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124816 ) ( not ( = ?auto_124816 ?auto_124817 ) ) ( not ( = ?auto_124816 ?auto_124818 ) ) ( not ( = ?auto_124816 ?auto_124819 ) ) ( not ( = ?auto_124816 ?auto_124820 ) ) ( not ( = ?auto_124816 ?auto_124821 ) ) ( not ( = ?auto_124817 ?auto_124818 ) ) ( not ( = ?auto_124817 ?auto_124819 ) ) ( not ( = ?auto_124817 ?auto_124820 ) ) ( not ( = ?auto_124817 ?auto_124821 ) ) ( not ( = ?auto_124818 ?auto_124819 ) ) ( not ( = ?auto_124818 ?auto_124820 ) ) ( not ( = ?auto_124818 ?auto_124821 ) ) ( not ( = ?auto_124819 ?auto_124820 ) ) ( not ( = ?auto_124819 ?auto_124821 ) ) ( not ( = ?auto_124820 ?auto_124821 ) ) ( ON ?auto_124821 ?auto_124822 ) ( not ( = ?auto_124816 ?auto_124822 ) ) ( not ( = ?auto_124817 ?auto_124822 ) ) ( not ( = ?auto_124818 ?auto_124822 ) ) ( not ( = ?auto_124819 ?auto_124822 ) ) ( not ( = ?auto_124820 ?auto_124822 ) ) ( not ( = ?auto_124821 ?auto_124822 ) ) ( ON ?auto_124820 ?auto_124821 ) ( ON-TABLE ?auto_124823 ) ( ON ?auto_124822 ?auto_124823 ) ( not ( = ?auto_124823 ?auto_124822 ) ) ( not ( = ?auto_124823 ?auto_124821 ) ) ( not ( = ?auto_124823 ?auto_124820 ) ) ( not ( = ?auto_124816 ?auto_124823 ) ) ( not ( = ?auto_124817 ?auto_124823 ) ) ( not ( = ?auto_124818 ?auto_124823 ) ) ( not ( = ?auto_124819 ?auto_124823 ) ) ( ON ?auto_124819 ?auto_124820 ) ( ON ?auto_124818 ?auto_124819 ) ( CLEAR ?auto_124816 ) ( ON ?auto_124817 ?auto_124818 ) ( CLEAR ?auto_124817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124823 ?auto_124822 ?auto_124821 ?auto_124820 ?auto_124819 ?auto_124818 )
      ( MAKE-6PILE ?auto_124816 ?auto_124817 ?auto_124818 ?auto_124819 ?auto_124820 ?auto_124821 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124824 - BLOCK
      ?auto_124825 - BLOCK
      ?auto_124826 - BLOCK
      ?auto_124827 - BLOCK
      ?auto_124828 - BLOCK
      ?auto_124829 - BLOCK
    )
    :vars
    (
      ?auto_124830 - BLOCK
      ?auto_124831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124824 ?auto_124825 ) ) ( not ( = ?auto_124824 ?auto_124826 ) ) ( not ( = ?auto_124824 ?auto_124827 ) ) ( not ( = ?auto_124824 ?auto_124828 ) ) ( not ( = ?auto_124824 ?auto_124829 ) ) ( not ( = ?auto_124825 ?auto_124826 ) ) ( not ( = ?auto_124825 ?auto_124827 ) ) ( not ( = ?auto_124825 ?auto_124828 ) ) ( not ( = ?auto_124825 ?auto_124829 ) ) ( not ( = ?auto_124826 ?auto_124827 ) ) ( not ( = ?auto_124826 ?auto_124828 ) ) ( not ( = ?auto_124826 ?auto_124829 ) ) ( not ( = ?auto_124827 ?auto_124828 ) ) ( not ( = ?auto_124827 ?auto_124829 ) ) ( not ( = ?auto_124828 ?auto_124829 ) ) ( ON ?auto_124829 ?auto_124830 ) ( not ( = ?auto_124824 ?auto_124830 ) ) ( not ( = ?auto_124825 ?auto_124830 ) ) ( not ( = ?auto_124826 ?auto_124830 ) ) ( not ( = ?auto_124827 ?auto_124830 ) ) ( not ( = ?auto_124828 ?auto_124830 ) ) ( not ( = ?auto_124829 ?auto_124830 ) ) ( ON ?auto_124828 ?auto_124829 ) ( ON-TABLE ?auto_124831 ) ( ON ?auto_124830 ?auto_124831 ) ( not ( = ?auto_124831 ?auto_124830 ) ) ( not ( = ?auto_124831 ?auto_124829 ) ) ( not ( = ?auto_124831 ?auto_124828 ) ) ( not ( = ?auto_124824 ?auto_124831 ) ) ( not ( = ?auto_124825 ?auto_124831 ) ) ( not ( = ?auto_124826 ?auto_124831 ) ) ( not ( = ?auto_124827 ?auto_124831 ) ) ( ON ?auto_124827 ?auto_124828 ) ( ON ?auto_124826 ?auto_124827 ) ( ON ?auto_124825 ?auto_124826 ) ( CLEAR ?auto_124825 ) ( HOLDING ?auto_124824 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124824 )
      ( MAKE-6PILE ?auto_124824 ?auto_124825 ?auto_124826 ?auto_124827 ?auto_124828 ?auto_124829 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124832 - BLOCK
      ?auto_124833 - BLOCK
      ?auto_124834 - BLOCK
      ?auto_124835 - BLOCK
      ?auto_124836 - BLOCK
      ?auto_124837 - BLOCK
    )
    :vars
    (
      ?auto_124838 - BLOCK
      ?auto_124839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124832 ?auto_124833 ) ) ( not ( = ?auto_124832 ?auto_124834 ) ) ( not ( = ?auto_124832 ?auto_124835 ) ) ( not ( = ?auto_124832 ?auto_124836 ) ) ( not ( = ?auto_124832 ?auto_124837 ) ) ( not ( = ?auto_124833 ?auto_124834 ) ) ( not ( = ?auto_124833 ?auto_124835 ) ) ( not ( = ?auto_124833 ?auto_124836 ) ) ( not ( = ?auto_124833 ?auto_124837 ) ) ( not ( = ?auto_124834 ?auto_124835 ) ) ( not ( = ?auto_124834 ?auto_124836 ) ) ( not ( = ?auto_124834 ?auto_124837 ) ) ( not ( = ?auto_124835 ?auto_124836 ) ) ( not ( = ?auto_124835 ?auto_124837 ) ) ( not ( = ?auto_124836 ?auto_124837 ) ) ( ON ?auto_124837 ?auto_124838 ) ( not ( = ?auto_124832 ?auto_124838 ) ) ( not ( = ?auto_124833 ?auto_124838 ) ) ( not ( = ?auto_124834 ?auto_124838 ) ) ( not ( = ?auto_124835 ?auto_124838 ) ) ( not ( = ?auto_124836 ?auto_124838 ) ) ( not ( = ?auto_124837 ?auto_124838 ) ) ( ON ?auto_124836 ?auto_124837 ) ( ON-TABLE ?auto_124839 ) ( ON ?auto_124838 ?auto_124839 ) ( not ( = ?auto_124839 ?auto_124838 ) ) ( not ( = ?auto_124839 ?auto_124837 ) ) ( not ( = ?auto_124839 ?auto_124836 ) ) ( not ( = ?auto_124832 ?auto_124839 ) ) ( not ( = ?auto_124833 ?auto_124839 ) ) ( not ( = ?auto_124834 ?auto_124839 ) ) ( not ( = ?auto_124835 ?auto_124839 ) ) ( ON ?auto_124835 ?auto_124836 ) ( ON ?auto_124834 ?auto_124835 ) ( ON ?auto_124833 ?auto_124834 ) ( ON ?auto_124832 ?auto_124833 ) ( CLEAR ?auto_124832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124839 ?auto_124838 ?auto_124837 ?auto_124836 ?auto_124835 ?auto_124834 ?auto_124833 )
      ( MAKE-6PILE ?auto_124832 ?auto_124833 ?auto_124834 ?auto_124835 ?auto_124836 ?auto_124837 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124841 - BLOCK
    )
    :vars
    (
      ?auto_124842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124842 ?auto_124841 ) ( CLEAR ?auto_124842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124841 ) ( not ( = ?auto_124841 ?auto_124842 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124842 ?auto_124841 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124843 - BLOCK
    )
    :vars
    (
      ?auto_124844 - BLOCK
      ?auto_124845 - BLOCK
      ?auto_124846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124844 ?auto_124843 ) ( CLEAR ?auto_124844 ) ( ON-TABLE ?auto_124843 ) ( not ( = ?auto_124843 ?auto_124844 ) ) ( HOLDING ?auto_124845 ) ( CLEAR ?auto_124846 ) ( not ( = ?auto_124843 ?auto_124845 ) ) ( not ( = ?auto_124843 ?auto_124846 ) ) ( not ( = ?auto_124844 ?auto_124845 ) ) ( not ( = ?auto_124844 ?auto_124846 ) ) ( not ( = ?auto_124845 ?auto_124846 ) ) )
    :subtasks
    ( ( !STACK ?auto_124845 ?auto_124846 )
      ( MAKE-1PILE ?auto_124843 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124847 - BLOCK
    )
    :vars
    (
      ?auto_124850 - BLOCK
      ?auto_124848 - BLOCK
      ?auto_124849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124850 ?auto_124847 ) ( ON-TABLE ?auto_124847 ) ( not ( = ?auto_124847 ?auto_124850 ) ) ( CLEAR ?auto_124848 ) ( not ( = ?auto_124847 ?auto_124849 ) ) ( not ( = ?auto_124847 ?auto_124848 ) ) ( not ( = ?auto_124850 ?auto_124849 ) ) ( not ( = ?auto_124850 ?auto_124848 ) ) ( not ( = ?auto_124849 ?auto_124848 ) ) ( ON ?auto_124849 ?auto_124850 ) ( CLEAR ?auto_124849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124847 ?auto_124850 )
      ( MAKE-1PILE ?auto_124847 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124851 - BLOCK
    )
    :vars
    (
      ?auto_124853 - BLOCK
      ?auto_124854 - BLOCK
      ?auto_124852 - BLOCK
      ?auto_124856 - BLOCK
      ?auto_124855 - BLOCK
      ?auto_124857 - BLOCK
      ?auto_124858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124853 ?auto_124851 ) ( ON-TABLE ?auto_124851 ) ( not ( = ?auto_124851 ?auto_124853 ) ) ( not ( = ?auto_124851 ?auto_124854 ) ) ( not ( = ?auto_124851 ?auto_124852 ) ) ( not ( = ?auto_124853 ?auto_124854 ) ) ( not ( = ?auto_124853 ?auto_124852 ) ) ( not ( = ?auto_124854 ?auto_124852 ) ) ( ON ?auto_124854 ?auto_124853 ) ( CLEAR ?auto_124854 ) ( HOLDING ?auto_124852 ) ( CLEAR ?auto_124856 ) ( ON-TABLE ?auto_124855 ) ( ON ?auto_124857 ?auto_124855 ) ( ON ?auto_124858 ?auto_124857 ) ( ON ?auto_124856 ?auto_124858 ) ( not ( = ?auto_124855 ?auto_124857 ) ) ( not ( = ?auto_124855 ?auto_124858 ) ) ( not ( = ?auto_124855 ?auto_124856 ) ) ( not ( = ?auto_124855 ?auto_124852 ) ) ( not ( = ?auto_124857 ?auto_124858 ) ) ( not ( = ?auto_124857 ?auto_124856 ) ) ( not ( = ?auto_124857 ?auto_124852 ) ) ( not ( = ?auto_124858 ?auto_124856 ) ) ( not ( = ?auto_124858 ?auto_124852 ) ) ( not ( = ?auto_124856 ?auto_124852 ) ) ( not ( = ?auto_124851 ?auto_124856 ) ) ( not ( = ?auto_124851 ?auto_124855 ) ) ( not ( = ?auto_124851 ?auto_124857 ) ) ( not ( = ?auto_124851 ?auto_124858 ) ) ( not ( = ?auto_124853 ?auto_124856 ) ) ( not ( = ?auto_124853 ?auto_124855 ) ) ( not ( = ?auto_124853 ?auto_124857 ) ) ( not ( = ?auto_124853 ?auto_124858 ) ) ( not ( = ?auto_124854 ?auto_124856 ) ) ( not ( = ?auto_124854 ?auto_124855 ) ) ( not ( = ?auto_124854 ?auto_124857 ) ) ( not ( = ?auto_124854 ?auto_124858 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124855 ?auto_124857 ?auto_124858 ?auto_124856 ?auto_124852 )
      ( MAKE-1PILE ?auto_124851 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124859 - BLOCK
    )
    :vars
    (
      ?auto_124866 - BLOCK
      ?auto_124862 - BLOCK
      ?auto_124863 - BLOCK
      ?auto_124864 - BLOCK
      ?auto_124861 - BLOCK
      ?auto_124865 - BLOCK
      ?auto_124860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124866 ?auto_124859 ) ( ON-TABLE ?auto_124859 ) ( not ( = ?auto_124859 ?auto_124866 ) ) ( not ( = ?auto_124859 ?auto_124862 ) ) ( not ( = ?auto_124859 ?auto_124863 ) ) ( not ( = ?auto_124866 ?auto_124862 ) ) ( not ( = ?auto_124866 ?auto_124863 ) ) ( not ( = ?auto_124862 ?auto_124863 ) ) ( ON ?auto_124862 ?auto_124866 ) ( CLEAR ?auto_124864 ) ( ON-TABLE ?auto_124861 ) ( ON ?auto_124865 ?auto_124861 ) ( ON ?auto_124860 ?auto_124865 ) ( ON ?auto_124864 ?auto_124860 ) ( not ( = ?auto_124861 ?auto_124865 ) ) ( not ( = ?auto_124861 ?auto_124860 ) ) ( not ( = ?auto_124861 ?auto_124864 ) ) ( not ( = ?auto_124861 ?auto_124863 ) ) ( not ( = ?auto_124865 ?auto_124860 ) ) ( not ( = ?auto_124865 ?auto_124864 ) ) ( not ( = ?auto_124865 ?auto_124863 ) ) ( not ( = ?auto_124860 ?auto_124864 ) ) ( not ( = ?auto_124860 ?auto_124863 ) ) ( not ( = ?auto_124864 ?auto_124863 ) ) ( not ( = ?auto_124859 ?auto_124864 ) ) ( not ( = ?auto_124859 ?auto_124861 ) ) ( not ( = ?auto_124859 ?auto_124865 ) ) ( not ( = ?auto_124859 ?auto_124860 ) ) ( not ( = ?auto_124866 ?auto_124864 ) ) ( not ( = ?auto_124866 ?auto_124861 ) ) ( not ( = ?auto_124866 ?auto_124865 ) ) ( not ( = ?auto_124866 ?auto_124860 ) ) ( not ( = ?auto_124862 ?auto_124864 ) ) ( not ( = ?auto_124862 ?auto_124861 ) ) ( not ( = ?auto_124862 ?auto_124865 ) ) ( not ( = ?auto_124862 ?auto_124860 ) ) ( ON ?auto_124863 ?auto_124862 ) ( CLEAR ?auto_124863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124859 ?auto_124866 ?auto_124862 )
      ( MAKE-1PILE ?auto_124859 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124867 - BLOCK
    )
    :vars
    (
      ?auto_124870 - BLOCK
      ?auto_124871 - BLOCK
      ?auto_124868 - BLOCK
      ?auto_124869 - BLOCK
      ?auto_124873 - BLOCK
      ?auto_124872 - BLOCK
      ?auto_124874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124870 ?auto_124867 ) ( ON-TABLE ?auto_124867 ) ( not ( = ?auto_124867 ?auto_124870 ) ) ( not ( = ?auto_124867 ?auto_124871 ) ) ( not ( = ?auto_124867 ?auto_124868 ) ) ( not ( = ?auto_124870 ?auto_124871 ) ) ( not ( = ?auto_124870 ?auto_124868 ) ) ( not ( = ?auto_124871 ?auto_124868 ) ) ( ON ?auto_124871 ?auto_124870 ) ( ON-TABLE ?auto_124869 ) ( ON ?auto_124873 ?auto_124869 ) ( ON ?auto_124872 ?auto_124873 ) ( not ( = ?auto_124869 ?auto_124873 ) ) ( not ( = ?auto_124869 ?auto_124872 ) ) ( not ( = ?auto_124869 ?auto_124874 ) ) ( not ( = ?auto_124869 ?auto_124868 ) ) ( not ( = ?auto_124873 ?auto_124872 ) ) ( not ( = ?auto_124873 ?auto_124874 ) ) ( not ( = ?auto_124873 ?auto_124868 ) ) ( not ( = ?auto_124872 ?auto_124874 ) ) ( not ( = ?auto_124872 ?auto_124868 ) ) ( not ( = ?auto_124874 ?auto_124868 ) ) ( not ( = ?auto_124867 ?auto_124874 ) ) ( not ( = ?auto_124867 ?auto_124869 ) ) ( not ( = ?auto_124867 ?auto_124873 ) ) ( not ( = ?auto_124867 ?auto_124872 ) ) ( not ( = ?auto_124870 ?auto_124874 ) ) ( not ( = ?auto_124870 ?auto_124869 ) ) ( not ( = ?auto_124870 ?auto_124873 ) ) ( not ( = ?auto_124870 ?auto_124872 ) ) ( not ( = ?auto_124871 ?auto_124874 ) ) ( not ( = ?auto_124871 ?auto_124869 ) ) ( not ( = ?auto_124871 ?auto_124873 ) ) ( not ( = ?auto_124871 ?auto_124872 ) ) ( ON ?auto_124868 ?auto_124871 ) ( CLEAR ?auto_124868 ) ( HOLDING ?auto_124874 ) ( CLEAR ?auto_124872 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124869 ?auto_124873 ?auto_124872 ?auto_124874 )
      ( MAKE-1PILE ?auto_124867 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124875 - BLOCK
    )
    :vars
    (
      ?auto_124882 - BLOCK
      ?auto_124881 - BLOCK
      ?auto_124880 - BLOCK
      ?auto_124876 - BLOCK
      ?auto_124877 - BLOCK
      ?auto_124878 - BLOCK
      ?auto_124879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124882 ?auto_124875 ) ( ON-TABLE ?auto_124875 ) ( not ( = ?auto_124875 ?auto_124882 ) ) ( not ( = ?auto_124875 ?auto_124881 ) ) ( not ( = ?auto_124875 ?auto_124880 ) ) ( not ( = ?auto_124882 ?auto_124881 ) ) ( not ( = ?auto_124882 ?auto_124880 ) ) ( not ( = ?auto_124881 ?auto_124880 ) ) ( ON ?auto_124881 ?auto_124882 ) ( ON-TABLE ?auto_124876 ) ( ON ?auto_124877 ?auto_124876 ) ( ON ?auto_124878 ?auto_124877 ) ( not ( = ?auto_124876 ?auto_124877 ) ) ( not ( = ?auto_124876 ?auto_124878 ) ) ( not ( = ?auto_124876 ?auto_124879 ) ) ( not ( = ?auto_124876 ?auto_124880 ) ) ( not ( = ?auto_124877 ?auto_124878 ) ) ( not ( = ?auto_124877 ?auto_124879 ) ) ( not ( = ?auto_124877 ?auto_124880 ) ) ( not ( = ?auto_124878 ?auto_124879 ) ) ( not ( = ?auto_124878 ?auto_124880 ) ) ( not ( = ?auto_124879 ?auto_124880 ) ) ( not ( = ?auto_124875 ?auto_124879 ) ) ( not ( = ?auto_124875 ?auto_124876 ) ) ( not ( = ?auto_124875 ?auto_124877 ) ) ( not ( = ?auto_124875 ?auto_124878 ) ) ( not ( = ?auto_124882 ?auto_124879 ) ) ( not ( = ?auto_124882 ?auto_124876 ) ) ( not ( = ?auto_124882 ?auto_124877 ) ) ( not ( = ?auto_124882 ?auto_124878 ) ) ( not ( = ?auto_124881 ?auto_124879 ) ) ( not ( = ?auto_124881 ?auto_124876 ) ) ( not ( = ?auto_124881 ?auto_124877 ) ) ( not ( = ?auto_124881 ?auto_124878 ) ) ( ON ?auto_124880 ?auto_124881 ) ( CLEAR ?auto_124878 ) ( ON ?auto_124879 ?auto_124880 ) ( CLEAR ?auto_124879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124875 ?auto_124882 ?auto_124881 ?auto_124880 )
      ( MAKE-1PILE ?auto_124875 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124883 - BLOCK
    )
    :vars
    (
      ?auto_124890 - BLOCK
      ?auto_124885 - BLOCK
      ?auto_124887 - BLOCK
      ?auto_124884 - BLOCK
      ?auto_124889 - BLOCK
      ?auto_124886 - BLOCK
      ?auto_124888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124890 ?auto_124883 ) ( ON-TABLE ?auto_124883 ) ( not ( = ?auto_124883 ?auto_124890 ) ) ( not ( = ?auto_124883 ?auto_124885 ) ) ( not ( = ?auto_124883 ?auto_124887 ) ) ( not ( = ?auto_124890 ?auto_124885 ) ) ( not ( = ?auto_124890 ?auto_124887 ) ) ( not ( = ?auto_124885 ?auto_124887 ) ) ( ON ?auto_124885 ?auto_124890 ) ( ON-TABLE ?auto_124884 ) ( ON ?auto_124889 ?auto_124884 ) ( not ( = ?auto_124884 ?auto_124889 ) ) ( not ( = ?auto_124884 ?auto_124886 ) ) ( not ( = ?auto_124884 ?auto_124888 ) ) ( not ( = ?auto_124884 ?auto_124887 ) ) ( not ( = ?auto_124889 ?auto_124886 ) ) ( not ( = ?auto_124889 ?auto_124888 ) ) ( not ( = ?auto_124889 ?auto_124887 ) ) ( not ( = ?auto_124886 ?auto_124888 ) ) ( not ( = ?auto_124886 ?auto_124887 ) ) ( not ( = ?auto_124888 ?auto_124887 ) ) ( not ( = ?auto_124883 ?auto_124888 ) ) ( not ( = ?auto_124883 ?auto_124884 ) ) ( not ( = ?auto_124883 ?auto_124889 ) ) ( not ( = ?auto_124883 ?auto_124886 ) ) ( not ( = ?auto_124890 ?auto_124888 ) ) ( not ( = ?auto_124890 ?auto_124884 ) ) ( not ( = ?auto_124890 ?auto_124889 ) ) ( not ( = ?auto_124890 ?auto_124886 ) ) ( not ( = ?auto_124885 ?auto_124888 ) ) ( not ( = ?auto_124885 ?auto_124884 ) ) ( not ( = ?auto_124885 ?auto_124889 ) ) ( not ( = ?auto_124885 ?auto_124886 ) ) ( ON ?auto_124887 ?auto_124885 ) ( ON ?auto_124888 ?auto_124887 ) ( CLEAR ?auto_124888 ) ( HOLDING ?auto_124886 ) ( CLEAR ?auto_124889 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124884 ?auto_124889 ?auto_124886 )
      ( MAKE-1PILE ?auto_124883 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124891 - BLOCK
    )
    :vars
    (
      ?auto_124898 - BLOCK
      ?auto_124893 - BLOCK
      ?auto_124895 - BLOCK
      ?auto_124896 - BLOCK
      ?auto_124897 - BLOCK
      ?auto_124892 - BLOCK
      ?auto_124894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124898 ?auto_124891 ) ( ON-TABLE ?auto_124891 ) ( not ( = ?auto_124891 ?auto_124898 ) ) ( not ( = ?auto_124891 ?auto_124893 ) ) ( not ( = ?auto_124891 ?auto_124895 ) ) ( not ( = ?auto_124898 ?auto_124893 ) ) ( not ( = ?auto_124898 ?auto_124895 ) ) ( not ( = ?auto_124893 ?auto_124895 ) ) ( ON ?auto_124893 ?auto_124898 ) ( ON-TABLE ?auto_124896 ) ( ON ?auto_124897 ?auto_124896 ) ( not ( = ?auto_124896 ?auto_124897 ) ) ( not ( = ?auto_124896 ?auto_124892 ) ) ( not ( = ?auto_124896 ?auto_124894 ) ) ( not ( = ?auto_124896 ?auto_124895 ) ) ( not ( = ?auto_124897 ?auto_124892 ) ) ( not ( = ?auto_124897 ?auto_124894 ) ) ( not ( = ?auto_124897 ?auto_124895 ) ) ( not ( = ?auto_124892 ?auto_124894 ) ) ( not ( = ?auto_124892 ?auto_124895 ) ) ( not ( = ?auto_124894 ?auto_124895 ) ) ( not ( = ?auto_124891 ?auto_124894 ) ) ( not ( = ?auto_124891 ?auto_124896 ) ) ( not ( = ?auto_124891 ?auto_124897 ) ) ( not ( = ?auto_124891 ?auto_124892 ) ) ( not ( = ?auto_124898 ?auto_124894 ) ) ( not ( = ?auto_124898 ?auto_124896 ) ) ( not ( = ?auto_124898 ?auto_124897 ) ) ( not ( = ?auto_124898 ?auto_124892 ) ) ( not ( = ?auto_124893 ?auto_124894 ) ) ( not ( = ?auto_124893 ?auto_124896 ) ) ( not ( = ?auto_124893 ?auto_124897 ) ) ( not ( = ?auto_124893 ?auto_124892 ) ) ( ON ?auto_124895 ?auto_124893 ) ( ON ?auto_124894 ?auto_124895 ) ( CLEAR ?auto_124897 ) ( ON ?auto_124892 ?auto_124894 ) ( CLEAR ?auto_124892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124891 ?auto_124898 ?auto_124893 ?auto_124895 ?auto_124894 )
      ( MAKE-1PILE ?auto_124891 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124899 - BLOCK
    )
    :vars
    (
      ?auto_124903 - BLOCK
      ?auto_124904 - BLOCK
      ?auto_124906 - BLOCK
      ?auto_124902 - BLOCK
      ?auto_124900 - BLOCK
      ?auto_124905 - BLOCK
      ?auto_124901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124903 ?auto_124899 ) ( ON-TABLE ?auto_124899 ) ( not ( = ?auto_124899 ?auto_124903 ) ) ( not ( = ?auto_124899 ?auto_124904 ) ) ( not ( = ?auto_124899 ?auto_124906 ) ) ( not ( = ?auto_124903 ?auto_124904 ) ) ( not ( = ?auto_124903 ?auto_124906 ) ) ( not ( = ?auto_124904 ?auto_124906 ) ) ( ON ?auto_124904 ?auto_124903 ) ( ON-TABLE ?auto_124902 ) ( not ( = ?auto_124902 ?auto_124900 ) ) ( not ( = ?auto_124902 ?auto_124905 ) ) ( not ( = ?auto_124902 ?auto_124901 ) ) ( not ( = ?auto_124902 ?auto_124906 ) ) ( not ( = ?auto_124900 ?auto_124905 ) ) ( not ( = ?auto_124900 ?auto_124901 ) ) ( not ( = ?auto_124900 ?auto_124906 ) ) ( not ( = ?auto_124905 ?auto_124901 ) ) ( not ( = ?auto_124905 ?auto_124906 ) ) ( not ( = ?auto_124901 ?auto_124906 ) ) ( not ( = ?auto_124899 ?auto_124901 ) ) ( not ( = ?auto_124899 ?auto_124902 ) ) ( not ( = ?auto_124899 ?auto_124900 ) ) ( not ( = ?auto_124899 ?auto_124905 ) ) ( not ( = ?auto_124903 ?auto_124901 ) ) ( not ( = ?auto_124903 ?auto_124902 ) ) ( not ( = ?auto_124903 ?auto_124900 ) ) ( not ( = ?auto_124903 ?auto_124905 ) ) ( not ( = ?auto_124904 ?auto_124901 ) ) ( not ( = ?auto_124904 ?auto_124902 ) ) ( not ( = ?auto_124904 ?auto_124900 ) ) ( not ( = ?auto_124904 ?auto_124905 ) ) ( ON ?auto_124906 ?auto_124904 ) ( ON ?auto_124901 ?auto_124906 ) ( ON ?auto_124905 ?auto_124901 ) ( CLEAR ?auto_124905 ) ( HOLDING ?auto_124900 ) ( CLEAR ?auto_124902 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124902 ?auto_124900 )
      ( MAKE-1PILE ?auto_124899 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124907 - BLOCK
    )
    :vars
    (
      ?auto_124908 - BLOCK
      ?auto_124913 - BLOCK
      ?auto_124911 - BLOCK
      ?auto_124909 - BLOCK
      ?auto_124914 - BLOCK
      ?auto_124912 - BLOCK
      ?auto_124910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124908 ?auto_124907 ) ( ON-TABLE ?auto_124907 ) ( not ( = ?auto_124907 ?auto_124908 ) ) ( not ( = ?auto_124907 ?auto_124913 ) ) ( not ( = ?auto_124907 ?auto_124911 ) ) ( not ( = ?auto_124908 ?auto_124913 ) ) ( not ( = ?auto_124908 ?auto_124911 ) ) ( not ( = ?auto_124913 ?auto_124911 ) ) ( ON ?auto_124913 ?auto_124908 ) ( ON-TABLE ?auto_124909 ) ( not ( = ?auto_124909 ?auto_124914 ) ) ( not ( = ?auto_124909 ?auto_124912 ) ) ( not ( = ?auto_124909 ?auto_124910 ) ) ( not ( = ?auto_124909 ?auto_124911 ) ) ( not ( = ?auto_124914 ?auto_124912 ) ) ( not ( = ?auto_124914 ?auto_124910 ) ) ( not ( = ?auto_124914 ?auto_124911 ) ) ( not ( = ?auto_124912 ?auto_124910 ) ) ( not ( = ?auto_124912 ?auto_124911 ) ) ( not ( = ?auto_124910 ?auto_124911 ) ) ( not ( = ?auto_124907 ?auto_124910 ) ) ( not ( = ?auto_124907 ?auto_124909 ) ) ( not ( = ?auto_124907 ?auto_124914 ) ) ( not ( = ?auto_124907 ?auto_124912 ) ) ( not ( = ?auto_124908 ?auto_124910 ) ) ( not ( = ?auto_124908 ?auto_124909 ) ) ( not ( = ?auto_124908 ?auto_124914 ) ) ( not ( = ?auto_124908 ?auto_124912 ) ) ( not ( = ?auto_124913 ?auto_124910 ) ) ( not ( = ?auto_124913 ?auto_124909 ) ) ( not ( = ?auto_124913 ?auto_124914 ) ) ( not ( = ?auto_124913 ?auto_124912 ) ) ( ON ?auto_124911 ?auto_124913 ) ( ON ?auto_124910 ?auto_124911 ) ( ON ?auto_124912 ?auto_124910 ) ( CLEAR ?auto_124909 ) ( ON ?auto_124914 ?auto_124912 ) ( CLEAR ?auto_124914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124907 ?auto_124908 ?auto_124913 ?auto_124911 ?auto_124910 ?auto_124912 )
      ( MAKE-1PILE ?auto_124907 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124915 - BLOCK
    )
    :vars
    (
      ?auto_124922 - BLOCK
      ?auto_124920 - BLOCK
      ?auto_124918 - BLOCK
      ?auto_124919 - BLOCK
      ?auto_124916 - BLOCK
      ?auto_124917 - BLOCK
      ?auto_124921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124922 ?auto_124915 ) ( ON-TABLE ?auto_124915 ) ( not ( = ?auto_124915 ?auto_124922 ) ) ( not ( = ?auto_124915 ?auto_124920 ) ) ( not ( = ?auto_124915 ?auto_124918 ) ) ( not ( = ?auto_124922 ?auto_124920 ) ) ( not ( = ?auto_124922 ?auto_124918 ) ) ( not ( = ?auto_124920 ?auto_124918 ) ) ( ON ?auto_124920 ?auto_124922 ) ( not ( = ?auto_124919 ?auto_124916 ) ) ( not ( = ?auto_124919 ?auto_124917 ) ) ( not ( = ?auto_124919 ?auto_124921 ) ) ( not ( = ?auto_124919 ?auto_124918 ) ) ( not ( = ?auto_124916 ?auto_124917 ) ) ( not ( = ?auto_124916 ?auto_124921 ) ) ( not ( = ?auto_124916 ?auto_124918 ) ) ( not ( = ?auto_124917 ?auto_124921 ) ) ( not ( = ?auto_124917 ?auto_124918 ) ) ( not ( = ?auto_124921 ?auto_124918 ) ) ( not ( = ?auto_124915 ?auto_124921 ) ) ( not ( = ?auto_124915 ?auto_124919 ) ) ( not ( = ?auto_124915 ?auto_124916 ) ) ( not ( = ?auto_124915 ?auto_124917 ) ) ( not ( = ?auto_124922 ?auto_124921 ) ) ( not ( = ?auto_124922 ?auto_124919 ) ) ( not ( = ?auto_124922 ?auto_124916 ) ) ( not ( = ?auto_124922 ?auto_124917 ) ) ( not ( = ?auto_124920 ?auto_124921 ) ) ( not ( = ?auto_124920 ?auto_124919 ) ) ( not ( = ?auto_124920 ?auto_124916 ) ) ( not ( = ?auto_124920 ?auto_124917 ) ) ( ON ?auto_124918 ?auto_124920 ) ( ON ?auto_124921 ?auto_124918 ) ( ON ?auto_124917 ?auto_124921 ) ( ON ?auto_124916 ?auto_124917 ) ( CLEAR ?auto_124916 ) ( HOLDING ?auto_124919 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124919 )
      ( MAKE-1PILE ?auto_124915 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_124923 - BLOCK
    )
    :vars
    (
      ?auto_124925 - BLOCK
      ?auto_124926 - BLOCK
      ?auto_124927 - BLOCK
      ?auto_124924 - BLOCK
      ?auto_124929 - BLOCK
      ?auto_124930 - BLOCK
      ?auto_124928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_124925 ?auto_124923 ) ( ON-TABLE ?auto_124923 ) ( not ( = ?auto_124923 ?auto_124925 ) ) ( not ( = ?auto_124923 ?auto_124926 ) ) ( not ( = ?auto_124923 ?auto_124927 ) ) ( not ( = ?auto_124925 ?auto_124926 ) ) ( not ( = ?auto_124925 ?auto_124927 ) ) ( not ( = ?auto_124926 ?auto_124927 ) ) ( ON ?auto_124926 ?auto_124925 ) ( not ( = ?auto_124924 ?auto_124929 ) ) ( not ( = ?auto_124924 ?auto_124930 ) ) ( not ( = ?auto_124924 ?auto_124928 ) ) ( not ( = ?auto_124924 ?auto_124927 ) ) ( not ( = ?auto_124929 ?auto_124930 ) ) ( not ( = ?auto_124929 ?auto_124928 ) ) ( not ( = ?auto_124929 ?auto_124927 ) ) ( not ( = ?auto_124930 ?auto_124928 ) ) ( not ( = ?auto_124930 ?auto_124927 ) ) ( not ( = ?auto_124928 ?auto_124927 ) ) ( not ( = ?auto_124923 ?auto_124928 ) ) ( not ( = ?auto_124923 ?auto_124924 ) ) ( not ( = ?auto_124923 ?auto_124929 ) ) ( not ( = ?auto_124923 ?auto_124930 ) ) ( not ( = ?auto_124925 ?auto_124928 ) ) ( not ( = ?auto_124925 ?auto_124924 ) ) ( not ( = ?auto_124925 ?auto_124929 ) ) ( not ( = ?auto_124925 ?auto_124930 ) ) ( not ( = ?auto_124926 ?auto_124928 ) ) ( not ( = ?auto_124926 ?auto_124924 ) ) ( not ( = ?auto_124926 ?auto_124929 ) ) ( not ( = ?auto_124926 ?auto_124930 ) ) ( ON ?auto_124927 ?auto_124926 ) ( ON ?auto_124928 ?auto_124927 ) ( ON ?auto_124930 ?auto_124928 ) ( ON ?auto_124929 ?auto_124930 ) ( ON ?auto_124924 ?auto_124929 ) ( CLEAR ?auto_124924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124923 ?auto_124925 ?auto_124926 ?auto_124927 ?auto_124928 ?auto_124930 ?auto_124929 )
      ( MAKE-1PILE ?auto_124923 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124938 - BLOCK
      ?auto_124939 - BLOCK
      ?auto_124940 - BLOCK
      ?auto_124941 - BLOCK
      ?auto_124942 - BLOCK
      ?auto_124943 - BLOCK
      ?auto_124944 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_124944 ) ( CLEAR ?auto_124943 ) ( ON-TABLE ?auto_124938 ) ( ON ?auto_124939 ?auto_124938 ) ( ON ?auto_124940 ?auto_124939 ) ( ON ?auto_124941 ?auto_124940 ) ( ON ?auto_124942 ?auto_124941 ) ( ON ?auto_124943 ?auto_124942 ) ( not ( = ?auto_124938 ?auto_124939 ) ) ( not ( = ?auto_124938 ?auto_124940 ) ) ( not ( = ?auto_124938 ?auto_124941 ) ) ( not ( = ?auto_124938 ?auto_124942 ) ) ( not ( = ?auto_124938 ?auto_124943 ) ) ( not ( = ?auto_124938 ?auto_124944 ) ) ( not ( = ?auto_124939 ?auto_124940 ) ) ( not ( = ?auto_124939 ?auto_124941 ) ) ( not ( = ?auto_124939 ?auto_124942 ) ) ( not ( = ?auto_124939 ?auto_124943 ) ) ( not ( = ?auto_124939 ?auto_124944 ) ) ( not ( = ?auto_124940 ?auto_124941 ) ) ( not ( = ?auto_124940 ?auto_124942 ) ) ( not ( = ?auto_124940 ?auto_124943 ) ) ( not ( = ?auto_124940 ?auto_124944 ) ) ( not ( = ?auto_124941 ?auto_124942 ) ) ( not ( = ?auto_124941 ?auto_124943 ) ) ( not ( = ?auto_124941 ?auto_124944 ) ) ( not ( = ?auto_124942 ?auto_124943 ) ) ( not ( = ?auto_124942 ?auto_124944 ) ) ( not ( = ?auto_124943 ?auto_124944 ) ) )
    :subtasks
    ( ( !STACK ?auto_124944 ?auto_124943 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124945 - BLOCK
      ?auto_124946 - BLOCK
      ?auto_124947 - BLOCK
      ?auto_124948 - BLOCK
      ?auto_124949 - BLOCK
      ?auto_124950 - BLOCK
      ?auto_124951 - BLOCK
    )
    :vars
    (
      ?auto_124952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124950 ) ( ON-TABLE ?auto_124945 ) ( ON ?auto_124946 ?auto_124945 ) ( ON ?auto_124947 ?auto_124946 ) ( ON ?auto_124948 ?auto_124947 ) ( ON ?auto_124949 ?auto_124948 ) ( ON ?auto_124950 ?auto_124949 ) ( not ( = ?auto_124945 ?auto_124946 ) ) ( not ( = ?auto_124945 ?auto_124947 ) ) ( not ( = ?auto_124945 ?auto_124948 ) ) ( not ( = ?auto_124945 ?auto_124949 ) ) ( not ( = ?auto_124945 ?auto_124950 ) ) ( not ( = ?auto_124945 ?auto_124951 ) ) ( not ( = ?auto_124946 ?auto_124947 ) ) ( not ( = ?auto_124946 ?auto_124948 ) ) ( not ( = ?auto_124946 ?auto_124949 ) ) ( not ( = ?auto_124946 ?auto_124950 ) ) ( not ( = ?auto_124946 ?auto_124951 ) ) ( not ( = ?auto_124947 ?auto_124948 ) ) ( not ( = ?auto_124947 ?auto_124949 ) ) ( not ( = ?auto_124947 ?auto_124950 ) ) ( not ( = ?auto_124947 ?auto_124951 ) ) ( not ( = ?auto_124948 ?auto_124949 ) ) ( not ( = ?auto_124948 ?auto_124950 ) ) ( not ( = ?auto_124948 ?auto_124951 ) ) ( not ( = ?auto_124949 ?auto_124950 ) ) ( not ( = ?auto_124949 ?auto_124951 ) ) ( not ( = ?auto_124950 ?auto_124951 ) ) ( ON ?auto_124951 ?auto_124952 ) ( CLEAR ?auto_124951 ) ( HAND-EMPTY ) ( not ( = ?auto_124945 ?auto_124952 ) ) ( not ( = ?auto_124946 ?auto_124952 ) ) ( not ( = ?auto_124947 ?auto_124952 ) ) ( not ( = ?auto_124948 ?auto_124952 ) ) ( not ( = ?auto_124949 ?auto_124952 ) ) ( not ( = ?auto_124950 ?auto_124952 ) ) ( not ( = ?auto_124951 ?auto_124952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124951 ?auto_124952 )
      ( MAKE-7PILE ?auto_124945 ?auto_124946 ?auto_124947 ?auto_124948 ?auto_124949 ?auto_124950 ?auto_124951 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124953 - BLOCK
      ?auto_124954 - BLOCK
      ?auto_124955 - BLOCK
      ?auto_124956 - BLOCK
      ?auto_124957 - BLOCK
      ?auto_124958 - BLOCK
      ?auto_124959 - BLOCK
    )
    :vars
    (
      ?auto_124960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124953 ) ( ON ?auto_124954 ?auto_124953 ) ( ON ?auto_124955 ?auto_124954 ) ( ON ?auto_124956 ?auto_124955 ) ( ON ?auto_124957 ?auto_124956 ) ( not ( = ?auto_124953 ?auto_124954 ) ) ( not ( = ?auto_124953 ?auto_124955 ) ) ( not ( = ?auto_124953 ?auto_124956 ) ) ( not ( = ?auto_124953 ?auto_124957 ) ) ( not ( = ?auto_124953 ?auto_124958 ) ) ( not ( = ?auto_124953 ?auto_124959 ) ) ( not ( = ?auto_124954 ?auto_124955 ) ) ( not ( = ?auto_124954 ?auto_124956 ) ) ( not ( = ?auto_124954 ?auto_124957 ) ) ( not ( = ?auto_124954 ?auto_124958 ) ) ( not ( = ?auto_124954 ?auto_124959 ) ) ( not ( = ?auto_124955 ?auto_124956 ) ) ( not ( = ?auto_124955 ?auto_124957 ) ) ( not ( = ?auto_124955 ?auto_124958 ) ) ( not ( = ?auto_124955 ?auto_124959 ) ) ( not ( = ?auto_124956 ?auto_124957 ) ) ( not ( = ?auto_124956 ?auto_124958 ) ) ( not ( = ?auto_124956 ?auto_124959 ) ) ( not ( = ?auto_124957 ?auto_124958 ) ) ( not ( = ?auto_124957 ?auto_124959 ) ) ( not ( = ?auto_124958 ?auto_124959 ) ) ( ON ?auto_124959 ?auto_124960 ) ( CLEAR ?auto_124959 ) ( not ( = ?auto_124953 ?auto_124960 ) ) ( not ( = ?auto_124954 ?auto_124960 ) ) ( not ( = ?auto_124955 ?auto_124960 ) ) ( not ( = ?auto_124956 ?auto_124960 ) ) ( not ( = ?auto_124957 ?auto_124960 ) ) ( not ( = ?auto_124958 ?auto_124960 ) ) ( not ( = ?auto_124959 ?auto_124960 ) ) ( HOLDING ?auto_124958 ) ( CLEAR ?auto_124957 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124953 ?auto_124954 ?auto_124955 ?auto_124956 ?auto_124957 ?auto_124958 )
      ( MAKE-7PILE ?auto_124953 ?auto_124954 ?auto_124955 ?auto_124956 ?auto_124957 ?auto_124958 ?auto_124959 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124961 - BLOCK
      ?auto_124962 - BLOCK
      ?auto_124963 - BLOCK
      ?auto_124964 - BLOCK
      ?auto_124965 - BLOCK
      ?auto_124966 - BLOCK
      ?auto_124967 - BLOCK
    )
    :vars
    (
      ?auto_124968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124961 ) ( ON ?auto_124962 ?auto_124961 ) ( ON ?auto_124963 ?auto_124962 ) ( ON ?auto_124964 ?auto_124963 ) ( ON ?auto_124965 ?auto_124964 ) ( not ( = ?auto_124961 ?auto_124962 ) ) ( not ( = ?auto_124961 ?auto_124963 ) ) ( not ( = ?auto_124961 ?auto_124964 ) ) ( not ( = ?auto_124961 ?auto_124965 ) ) ( not ( = ?auto_124961 ?auto_124966 ) ) ( not ( = ?auto_124961 ?auto_124967 ) ) ( not ( = ?auto_124962 ?auto_124963 ) ) ( not ( = ?auto_124962 ?auto_124964 ) ) ( not ( = ?auto_124962 ?auto_124965 ) ) ( not ( = ?auto_124962 ?auto_124966 ) ) ( not ( = ?auto_124962 ?auto_124967 ) ) ( not ( = ?auto_124963 ?auto_124964 ) ) ( not ( = ?auto_124963 ?auto_124965 ) ) ( not ( = ?auto_124963 ?auto_124966 ) ) ( not ( = ?auto_124963 ?auto_124967 ) ) ( not ( = ?auto_124964 ?auto_124965 ) ) ( not ( = ?auto_124964 ?auto_124966 ) ) ( not ( = ?auto_124964 ?auto_124967 ) ) ( not ( = ?auto_124965 ?auto_124966 ) ) ( not ( = ?auto_124965 ?auto_124967 ) ) ( not ( = ?auto_124966 ?auto_124967 ) ) ( ON ?auto_124967 ?auto_124968 ) ( not ( = ?auto_124961 ?auto_124968 ) ) ( not ( = ?auto_124962 ?auto_124968 ) ) ( not ( = ?auto_124963 ?auto_124968 ) ) ( not ( = ?auto_124964 ?auto_124968 ) ) ( not ( = ?auto_124965 ?auto_124968 ) ) ( not ( = ?auto_124966 ?auto_124968 ) ) ( not ( = ?auto_124967 ?auto_124968 ) ) ( CLEAR ?auto_124965 ) ( ON ?auto_124966 ?auto_124967 ) ( CLEAR ?auto_124966 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124968 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124968 ?auto_124967 )
      ( MAKE-7PILE ?auto_124961 ?auto_124962 ?auto_124963 ?auto_124964 ?auto_124965 ?auto_124966 ?auto_124967 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124969 - BLOCK
      ?auto_124970 - BLOCK
      ?auto_124971 - BLOCK
      ?auto_124972 - BLOCK
      ?auto_124973 - BLOCK
      ?auto_124974 - BLOCK
      ?auto_124975 - BLOCK
    )
    :vars
    (
      ?auto_124976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124969 ) ( ON ?auto_124970 ?auto_124969 ) ( ON ?auto_124971 ?auto_124970 ) ( ON ?auto_124972 ?auto_124971 ) ( not ( = ?auto_124969 ?auto_124970 ) ) ( not ( = ?auto_124969 ?auto_124971 ) ) ( not ( = ?auto_124969 ?auto_124972 ) ) ( not ( = ?auto_124969 ?auto_124973 ) ) ( not ( = ?auto_124969 ?auto_124974 ) ) ( not ( = ?auto_124969 ?auto_124975 ) ) ( not ( = ?auto_124970 ?auto_124971 ) ) ( not ( = ?auto_124970 ?auto_124972 ) ) ( not ( = ?auto_124970 ?auto_124973 ) ) ( not ( = ?auto_124970 ?auto_124974 ) ) ( not ( = ?auto_124970 ?auto_124975 ) ) ( not ( = ?auto_124971 ?auto_124972 ) ) ( not ( = ?auto_124971 ?auto_124973 ) ) ( not ( = ?auto_124971 ?auto_124974 ) ) ( not ( = ?auto_124971 ?auto_124975 ) ) ( not ( = ?auto_124972 ?auto_124973 ) ) ( not ( = ?auto_124972 ?auto_124974 ) ) ( not ( = ?auto_124972 ?auto_124975 ) ) ( not ( = ?auto_124973 ?auto_124974 ) ) ( not ( = ?auto_124973 ?auto_124975 ) ) ( not ( = ?auto_124974 ?auto_124975 ) ) ( ON ?auto_124975 ?auto_124976 ) ( not ( = ?auto_124969 ?auto_124976 ) ) ( not ( = ?auto_124970 ?auto_124976 ) ) ( not ( = ?auto_124971 ?auto_124976 ) ) ( not ( = ?auto_124972 ?auto_124976 ) ) ( not ( = ?auto_124973 ?auto_124976 ) ) ( not ( = ?auto_124974 ?auto_124976 ) ) ( not ( = ?auto_124975 ?auto_124976 ) ) ( ON ?auto_124974 ?auto_124975 ) ( CLEAR ?auto_124974 ) ( ON-TABLE ?auto_124976 ) ( HOLDING ?auto_124973 ) ( CLEAR ?auto_124972 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124969 ?auto_124970 ?auto_124971 ?auto_124972 ?auto_124973 )
      ( MAKE-7PILE ?auto_124969 ?auto_124970 ?auto_124971 ?auto_124972 ?auto_124973 ?auto_124974 ?auto_124975 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124977 - BLOCK
      ?auto_124978 - BLOCK
      ?auto_124979 - BLOCK
      ?auto_124980 - BLOCK
      ?auto_124981 - BLOCK
      ?auto_124982 - BLOCK
      ?auto_124983 - BLOCK
    )
    :vars
    (
      ?auto_124984 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124977 ) ( ON ?auto_124978 ?auto_124977 ) ( ON ?auto_124979 ?auto_124978 ) ( ON ?auto_124980 ?auto_124979 ) ( not ( = ?auto_124977 ?auto_124978 ) ) ( not ( = ?auto_124977 ?auto_124979 ) ) ( not ( = ?auto_124977 ?auto_124980 ) ) ( not ( = ?auto_124977 ?auto_124981 ) ) ( not ( = ?auto_124977 ?auto_124982 ) ) ( not ( = ?auto_124977 ?auto_124983 ) ) ( not ( = ?auto_124978 ?auto_124979 ) ) ( not ( = ?auto_124978 ?auto_124980 ) ) ( not ( = ?auto_124978 ?auto_124981 ) ) ( not ( = ?auto_124978 ?auto_124982 ) ) ( not ( = ?auto_124978 ?auto_124983 ) ) ( not ( = ?auto_124979 ?auto_124980 ) ) ( not ( = ?auto_124979 ?auto_124981 ) ) ( not ( = ?auto_124979 ?auto_124982 ) ) ( not ( = ?auto_124979 ?auto_124983 ) ) ( not ( = ?auto_124980 ?auto_124981 ) ) ( not ( = ?auto_124980 ?auto_124982 ) ) ( not ( = ?auto_124980 ?auto_124983 ) ) ( not ( = ?auto_124981 ?auto_124982 ) ) ( not ( = ?auto_124981 ?auto_124983 ) ) ( not ( = ?auto_124982 ?auto_124983 ) ) ( ON ?auto_124983 ?auto_124984 ) ( not ( = ?auto_124977 ?auto_124984 ) ) ( not ( = ?auto_124978 ?auto_124984 ) ) ( not ( = ?auto_124979 ?auto_124984 ) ) ( not ( = ?auto_124980 ?auto_124984 ) ) ( not ( = ?auto_124981 ?auto_124984 ) ) ( not ( = ?auto_124982 ?auto_124984 ) ) ( not ( = ?auto_124983 ?auto_124984 ) ) ( ON ?auto_124982 ?auto_124983 ) ( ON-TABLE ?auto_124984 ) ( CLEAR ?auto_124980 ) ( ON ?auto_124981 ?auto_124982 ) ( CLEAR ?auto_124981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124984 ?auto_124983 ?auto_124982 )
      ( MAKE-7PILE ?auto_124977 ?auto_124978 ?auto_124979 ?auto_124980 ?auto_124981 ?auto_124982 ?auto_124983 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124985 - BLOCK
      ?auto_124986 - BLOCK
      ?auto_124987 - BLOCK
      ?auto_124988 - BLOCK
      ?auto_124989 - BLOCK
      ?auto_124990 - BLOCK
      ?auto_124991 - BLOCK
    )
    :vars
    (
      ?auto_124992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124985 ) ( ON ?auto_124986 ?auto_124985 ) ( ON ?auto_124987 ?auto_124986 ) ( not ( = ?auto_124985 ?auto_124986 ) ) ( not ( = ?auto_124985 ?auto_124987 ) ) ( not ( = ?auto_124985 ?auto_124988 ) ) ( not ( = ?auto_124985 ?auto_124989 ) ) ( not ( = ?auto_124985 ?auto_124990 ) ) ( not ( = ?auto_124985 ?auto_124991 ) ) ( not ( = ?auto_124986 ?auto_124987 ) ) ( not ( = ?auto_124986 ?auto_124988 ) ) ( not ( = ?auto_124986 ?auto_124989 ) ) ( not ( = ?auto_124986 ?auto_124990 ) ) ( not ( = ?auto_124986 ?auto_124991 ) ) ( not ( = ?auto_124987 ?auto_124988 ) ) ( not ( = ?auto_124987 ?auto_124989 ) ) ( not ( = ?auto_124987 ?auto_124990 ) ) ( not ( = ?auto_124987 ?auto_124991 ) ) ( not ( = ?auto_124988 ?auto_124989 ) ) ( not ( = ?auto_124988 ?auto_124990 ) ) ( not ( = ?auto_124988 ?auto_124991 ) ) ( not ( = ?auto_124989 ?auto_124990 ) ) ( not ( = ?auto_124989 ?auto_124991 ) ) ( not ( = ?auto_124990 ?auto_124991 ) ) ( ON ?auto_124991 ?auto_124992 ) ( not ( = ?auto_124985 ?auto_124992 ) ) ( not ( = ?auto_124986 ?auto_124992 ) ) ( not ( = ?auto_124987 ?auto_124992 ) ) ( not ( = ?auto_124988 ?auto_124992 ) ) ( not ( = ?auto_124989 ?auto_124992 ) ) ( not ( = ?auto_124990 ?auto_124992 ) ) ( not ( = ?auto_124991 ?auto_124992 ) ) ( ON ?auto_124990 ?auto_124991 ) ( ON-TABLE ?auto_124992 ) ( ON ?auto_124989 ?auto_124990 ) ( CLEAR ?auto_124989 ) ( HOLDING ?auto_124988 ) ( CLEAR ?auto_124987 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124985 ?auto_124986 ?auto_124987 ?auto_124988 )
      ( MAKE-7PILE ?auto_124985 ?auto_124986 ?auto_124987 ?auto_124988 ?auto_124989 ?auto_124990 ?auto_124991 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124993 - BLOCK
      ?auto_124994 - BLOCK
      ?auto_124995 - BLOCK
      ?auto_124996 - BLOCK
      ?auto_124997 - BLOCK
      ?auto_124998 - BLOCK
      ?auto_124999 - BLOCK
    )
    :vars
    (
      ?auto_125000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124993 ) ( ON ?auto_124994 ?auto_124993 ) ( ON ?auto_124995 ?auto_124994 ) ( not ( = ?auto_124993 ?auto_124994 ) ) ( not ( = ?auto_124993 ?auto_124995 ) ) ( not ( = ?auto_124993 ?auto_124996 ) ) ( not ( = ?auto_124993 ?auto_124997 ) ) ( not ( = ?auto_124993 ?auto_124998 ) ) ( not ( = ?auto_124993 ?auto_124999 ) ) ( not ( = ?auto_124994 ?auto_124995 ) ) ( not ( = ?auto_124994 ?auto_124996 ) ) ( not ( = ?auto_124994 ?auto_124997 ) ) ( not ( = ?auto_124994 ?auto_124998 ) ) ( not ( = ?auto_124994 ?auto_124999 ) ) ( not ( = ?auto_124995 ?auto_124996 ) ) ( not ( = ?auto_124995 ?auto_124997 ) ) ( not ( = ?auto_124995 ?auto_124998 ) ) ( not ( = ?auto_124995 ?auto_124999 ) ) ( not ( = ?auto_124996 ?auto_124997 ) ) ( not ( = ?auto_124996 ?auto_124998 ) ) ( not ( = ?auto_124996 ?auto_124999 ) ) ( not ( = ?auto_124997 ?auto_124998 ) ) ( not ( = ?auto_124997 ?auto_124999 ) ) ( not ( = ?auto_124998 ?auto_124999 ) ) ( ON ?auto_124999 ?auto_125000 ) ( not ( = ?auto_124993 ?auto_125000 ) ) ( not ( = ?auto_124994 ?auto_125000 ) ) ( not ( = ?auto_124995 ?auto_125000 ) ) ( not ( = ?auto_124996 ?auto_125000 ) ) ( not ( = ?auto_124997 ?auto_125000 ) ) ( not ( = ?auto_124998 ?auto_125000 ) ) ( not ( = ?auto_124999 ?auto_125000 ) ) ( ON ?auto_124998 ?auto_124999 ) ( ON-TABLE ?auto_125000 ) ( ON ?auto_124997 ?auto_124998 ) ( CLEAR ?auto_124995 ) ( ON ?auto_124996 ?auto_124997 ) ( CLEAR ?auto_124996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125000 ?auto_124999 ?auto_124998 ?auto_124997 )
      ( MAKE-7PILE ?auto_124993 ?auto_124994 ?auto_124995 ?auto_124996 ?auto_124997 ?auto_124998 ?auto_124999 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125001 - BLOCK
      ?auto_125002 - BLOCK
      ?auto_125003 - BLOCK
      ?auto_125004 - BLOCK
      ?auto_125005 - BLOCK
      ?auto_125006 - BLOCK
      ?auto_125007 - BLOCK
    )
    :vars
    (
      ?auto_125008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125001 ) ( ON ?auto_125002 ?auto_125001 ) ( not ( = ?auto_125001 ?auto_125002 ) ) ( not ( = ?auto_125001 ?auto_125003 ) ) ( not ( = ?auto_125001 ?auto_125004 ) ) ( not ( = ?auto_125001 ?auto_125005 ) ) ( not ( = ?auto_125001 ?auto_125006 ) ) ( not ( = ?auto_125001 ?auto_125007 ) ) ( not ( = ?auto_125002 ?auto_125003 ) ) ( not ( = ?auto_125002 ?auto_125004 ) ) ( not ( = ?auto_125002 ?auto_125005 ) ) ( not ( = ?auto_125002 ?auto_125006 ) ) ( not ( = ?auto_125002 ?auto_125007 ) ) ( not ( = ?auto_125003 ?auto_125004 ) ) ( not ( = ?auto_125003 ?auto_125005 ) ) ( not ( = ?auto_125003 ?auto_125006 ) ) ( not ( = ?auto_125003 ?auto_125007 ) ) ( not ( = ?auto_125004 ?auto_125005 ) ) ( not ( = ?auto_125004 ?auto_125006 ) ) ( not ( = ?auto_125004 ?auto_125007 ) ) ( not ( = ?auto_125005 ?auto_125006 ) ) ( not ( = ?auto_125005 ?auto_125007 ) ) ( not ( = ?auto_125006 ?auto_125007 ) ) ( ON ?auto_125007 ?auto_125008 ) ( not ( = ?auto_125001 ?auto_125008 ) ) ( not ( = ?auto_125002 ?auto_125008 ) ) ( not ( = ?auto_125003 ?auto_125008 ) ) ( not ( = ?auto_125004 ?auto_125008 ) ) ( not ( = ?auto_125005 ?auto_125008 ) ) ( not ( = ?auto_125006 ?auto_125008 ) ) ( not ( = ?auto_125007 ?auto_125008 ) ) ( ON ?auto_125006 ?auto_125007 ) ( ON-TABLE ?auto_125008 ) ( ON ?auto_125005 ?auto_125006 ) ( ON ?auto_125004 ?auto_125005 ) ( CLEAR ?auto_125004 ) ( HOLDING ?auto_125003 ) ( CLEAR ?auto_125002 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125001 ?auto_125002 ?auto_125003 )
      ( MAKE-7PILE ?auto_125001 ?auto_125002 ?auto_125003 ?auto_125004 ?auto_125005 ?auto_125006 ?auto_125007 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125009 - BLOCK
      ?auto_125010 - BLOCK
      ?auto_125011 - BLOCK
      ?auto_125012 - BLOCK
      ?auto_125013 - BLOCK
      ?auto_125014 - BLOCK
      ?auto_125015 - BLOCK
    )
    :vars
    (
      ?auto_125016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125009 ) ( ON ?auto_125010 ?auto_125009 ) ( not ( = ?auto_125009 ?auto_125010 ) ) ( not ( = ?auto_125009 ?auto_125011 ) ) ( not ( = ?auto_125009 ?auto_125012 ) ) ( not ( = ?auto_125009 ?auto_125013 ) ) ( not ( = ?auto_125009 ?auto_125014 ) ) ( not ( = ?auto_125009 ?auto_125015 ) ) ( not ( = ?auto_125010 ?auto_125011 ) ) ( not ( = ?auto_125010 ?auto_125012 ) ) ( not ( = ?auto_125010 ?auto_125013 ) ) ( not ( = ?auto_125010 ?auto_125014 ) ) ( not ( = ?auto_125010 ?auto_125015 ) ) ( not ( = ?auto_125011 ?auto_125012 ) ) ( not ( = ?auto_125011 ?auto_125013 ) ) ( not ( = ?auto_125011 ?auto_125014 ) ) ( not ( = ?auto_125011 ?auto_125015 ) ) ( not ( = ?auto_125012 ?auto_125013 ) ) ( not ( = ?auto_125012 ?auto_125014 ) ) ( not ( = ?auto_125012 ?auto_125015 ) ) ( not ( = ?auto_125013 ?auto_125014 ) ) ( not ( = ?auto_125013 ?auto_125015 ) ) ( not ( = ?auto_125014 ?auto_125015 ) ) ( ON ?auto_125015 ?auto_125016 ) ( not ( = ?auto_125009 ?auto_125016 ) ) ( not ( = ?auto_125010 ?auto_125016 ) ) ( not ( = ?auto_125011 ?auto_125016 ) ) ( not ( = ?auto_125012 ?auto_125016 ) ) ( not ( = ?auto_125013 ?auto_125016 ) ) ( not ( = ?auto_125014 ?auto_125016 ) ) ( not ( = ?auto_125015 ?auto_125016 ) ) ( ON ?auto_125014 ?auto_125015 ) ( ON-TABLE ?auto_125016 ) ( ON ?auto_125013 ?auto_125014 ) ( ON ?auto_125012 ?auto_125013 ) ( CLEAR ?auto_125010 ) ( ON ?auto_125011 ?auto_125012 ) ( CLEAR ?auto_125011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125016 ?auto_125015 ?auto_125014 ?auto_125013 ?auto_125012 )
      ( MAKE-7PILE ?auto_125009 ?auto_125010 ?auto_125011 ?auto_125012 ?auto_125013 ?auto_125014 ?auto_125015 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125017 - BLOCK
      ?auto_125018 - BLOCK
      ?auto_125019 - BLOCK
      ?auto_125020 - BLOCK
      ?auto_125021 - BLOCK
      ?auto_125022 - BLOCK
      ?auto_125023 - BLOCK
    )
    :vars
    (
      ?auto_125024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125017 ) ( not ( = ?auto_125017 ?auto_125018 ) ) ( not ( = ?auto_125017 ?auto_125019 ) ) ( not ( = ?auto_125017 ?auto_125020 ) ) ( not ( = ?auto_125017 ?auto_125021 ) ) ( not ( = ?auto_125017 ?auto_125022 ) ) ( not ( = ?auto_125017 ?auto_125023 ) ) ( not ( = ?auto_125018 ?auto_125019 ) ) ( not ( = ?auto_125018 ?auto_125020 ) ) ( not ( = ?auto_125018 ?auto_125021 ) ) ( not ( = ?auto_125018 ?auto_125022 ) ) ( not ( = ?auto_125018 ?auto_125023 ) ) ( not ( = ?auto_125019 ?auto_125020 ) ) ( not ( = ?auto_125019 ?auto_125021 ) ) ( not ( = ?auto_125019 ?auto_125022 ) ) ( not ( = ?auto_125019 ?auto_125023 ) ) ( not ( = ?auto_125020 ?auto_125021 ) ) ( not ( = ?auto_125020 ?auto_125022 ) ) ( not ( = ?auto_125020 ?auto_125023 ) ) ( not ( = ?auto_125021 ?auto_125022 ) ) ( not ( = ?auto_125021 ?auto_125023 ) ) ( not ( = ?auto_125022 ?auto_125023 ) ) ( ON ?auto_125023 ?auto_125024 ) ( not ( = ?auto_125017 ?auto_125024 ) ) ( not ( = ?auto_125018 ?auto_125024 ) ) ( not ( = ?auto_125019 ?auto_125024 ) ) ( not ( = ?auto_125020 ?auto_125024 ) ) ( not ( = ?auto_125021 ?auto_125024 ) ) ( not ( = ?auto_125022 ?auto_125024 ) ) ( not ( = ?auto_125023 ?auto_125024 ) ) ( ON ?auto_125022 ?auto_125023 ) ( ON-TABLE ?auto_125024 ) ( ON ?auto_125021 ?auto_125022 ) ( ON ?auto_125020 ?auto_125021 ) ( ON ?auto_125019 ?auto_125020 ) ( CLEAR ?auto_125019 ) ( HOLDING ?auto_125018 ) ( CLEAR ?auto_125017 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125017 ?auto_125018 )
      ( MAKE-7PILE ?auto_125017 ?auto_125018 ?auto_125019 ?auto_125020 ?auto_125021 ?auto_125022 ?auto_125023 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125025 - BLOCK
      ?auto_125026 - BLOCK
      ?auto_125027 - BLOCK
      ?auto_125028 - BLOCK
      ?auto_125029 - BLOCK
      ?auto_125030 - BLOCK
      ?auto_125031 - BLOCK
    )
    :vars
    (
      ?auto_125032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125025 ) ( not ( = ?auto_125025 ?auto_125026 ) ) ( not ( = ?auto_125025 ?auto_125027 ) ) ( not ( = ?auto_125025 ?auto_125028 ) ) ( not ( = ?auto_125025 ?auto_125029 ) ) ( not ( = ?auto_125025 ?auto_125030 ) ) ( not ( = ?auto_125025 ?auto_125031 ) ) ( not ( = ?auto_125026 ?auto_125027 ) ) ( not ( = ?auto_125026 ?auto_125028 ) ) ( not ( = ?auto_125026 ?auto_125029 ) ) ( not ( = ?auto_125026 ?auto_125030 ) ) ( not ( = ?auto_125026 ?auto_125031 ) ) ( not ( = ?auto_125027 ?auto_125028 ) ) ( not ( = ?auto_125027 ?auto_125029 ) ) ( not ( = ?auto_125027 ?auto_125030 ) ) ( not ( = ?auto_125027 ?auto_125031 ) ) ( not ( = ?auto_125028 ?auto_125029 ) ) ( not ( = ?auto_125028 ?auto_125030 ) ) ( not ( = ?auto_125028 ?auto_125031 ) ) ( not ( = ?auto_125029 ?auto_125030 ) ) ( not ( = ?auto_125029 ?auto_125031 ) ) ( not ( = ?auto_125030 ?auto_125031 ) ) ( ON ?auto_125031 ?auto_125032 ) ( not ( = ?auto_125025 ?auto_125032 ) ) ( not ( = ?auto_125026 ?auto_125032 ) ) ( not ( = ?auto_125027 ?auto_125032 ) ) ( not ( = ?auto_125028 ?auto_125032 ) ) ( not ( = ?auto_125029 ?auto_125032 ) ) ( not ( = ?auto_125030 ?auto_125032 ) ) ( not ( = ?auto_125031 ?auto_125032 ) ) ( ON ?auto_125030 ?auto_125031 ) ( ON-TABLE ?auto_125032 ) ( ON ?auto_125029 ?auto_125030 ) ( ON ?auto_125028 ?auto_125029 ) ( ON ?auto_125027 ?auto_125028 ) ( CLEAR ?auto_125025 ) ( ON ?auto_125026 ?auto_125027 ) ( CLEAR ?auto_125026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125032 ?auto_125031 ?auto_125030 ?auto_125029 ?auto_125028 ?auto_125027 )
      ( MAKE-7PILE ?auto_125025 ?auto_125026 ?auto_125027 ?auto_125028 ?auto_125029 ?auto_125030 ?auto_125031 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125033 - BLOCK
      ?auto_125034 - BLOCK
      ?auto_125035 - BLOCK
      ?auto_125036 - BLOCK
      ?auto_125037 - BLOCK
      ?auto_125038 - BLOCK
      ?auto_125039 - BLOCK
    )
    :vars
    (
      ?auto_125040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125033 ?auto_125034 ) ) ( not ( = ?auto_125033 ?auto_125035 ) ) ( not ( = ?auto_125033 ?auto_125036 ) ) ( not ( = ?auto_125033 ?auto_125037 ) ) ( not ( = ?auto_125033 ?auto_125038 ) ) ( not ( = ?auto_125033 ?auto_125039 ) ) ( not ( = ?auto_125034 ?auto_125035 ) ) ( not ( = ?auto_125034 ?auto_125036 ) ) ( not ( = ?auto_125034 ?auto_125037 ) ) ( not ( = ?auto_125034 ?auto_125038 ) ) ( not ( = ?auto_125034 ?auto_125039 ) ) ( not ( = ?auto_125035 ?auto_125036 ) ) ( not ( = ?auto_125035 ?auto_125037 ) ) ( not ( = ?auto_125035 ?auto_125038 ) ) ( not ( = ?auto_125035 ?auto_125039 ) ) ( not ( = ?auto_125036 ?auto_125037 ) ) ( not ( = ?auto_125036 ?auto_125038 ) ) ( not ( = ?auto_125036 ?auto_125039 ) ) ( not ( = ?auto_125037 ?auto_125038 ) ) ( not ( = ?auto_125037 ?auto_125039 ) ) ( not ( = ?auto_125038 ?auto_125039 ) ) ( ON ?auto_125039 ?auto_125040 ) ( not ( = ?auto_125033 ?auto_125040 ) ) ( not ( = ?auto_125034 ?auto_125040 ) ) ( not ( = ?auto_125035 ?auto_125040 ) ) ( not ( = ?auto_125036 ?auto_125040 ) ) ( not ( = ?auto_125037 ?auto_125040 ) ) ( not ( = ?auto_125038 ?auto_125040 ) ) ( not ( = ?auto_125039 ?auto_125040 ) ) ( ON ?auto_125038 ?auto_125039 ) ( ON-TABLE ?auto_125040 ) ( ON ?auto_125037 ?auto_125038 ) ( ON ?auto_125036 ?auto_125037 ) ( ON ?auto_125035 ?auto_125036 ) ( ON ?auto_125034 ?auto_125035 ) ( CLEAR ?auto_125034 ) ( HOLDING ?auto_125033 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125033 )
      ( MAKE-7PILE ?auto_125033 ?auto_125034 ?auto_125035 ?auto_125036 ?auto_125037 ?auto_125038 ?auto_125039 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_125041 - BLOCK
      ?auto_125042 - BLOCK
      ?auto_125043 - BLOCK
      ?auto_125044 - BLOCK
      ?auto_125045 - BLOCK
      ?auto_125046 - BLOCK
      ?auto_125047 - BLOCK
    )
    :vars
    (
      ?auto_125048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125041 ?auto_125042 ) ) ( not ( = ?auto_125041 ?auto_125043 ) ) ( not ( = ?auto_125041 ?auto_125044 ) ) ( not ( = ?auto_125041 ?auto_125045 ) ) ( not ( = ?auto_125041 ?auto_125046 ) ) ( not ( = ?auto_125041 ?auto_125047 ) ) ( not ( = ?auto_125042 ?auto_125043 ) ) ( not ( = ?auto_125042 ?auto_125044 ) ) ( not ( = ?auto_125042 ?auto_125045 ) ) ( not ( = ?auto_125042 ?auto_125046 ) ) ( not ( = ?auto_125042 ?auto_125047 ) ) ( not ( = ?auto_125043 ?auto_125044 ) ) ( not ( = ?auto_125043 ?auto_125045 ) ) ( not ( = ?auto_125043 ?auto_125046 ) ) ( not ( = ?auto_125043 ?auto_125047 ) ) ( not ( = ?auto_125044 ?auto_125045 ) ) ( not ( = ?auto_125044 ?auto_125046 ) ) ( not ( = ?auto_125044 ?auto_125047 ) ) ( not ( = ?auto_125045 ?auto_125046 ) ) ( not ( = ?auto_125045 ?auto_125047 ) ) ( not ( = ?auto_125046 ?auto_125047 ) ) ( ON ?auto_125047 ?auto_125048 ) ( not ( = ?auto_125041 ?auto_125048 ) ) ( not ( = ?auto_125042 ?auto_125048 ) ) ( not ( = ?auto_125043 ?auto_125048 ) ) ( not ( = ?auto_125044 ?auto_125048 ) ) ( not ( = ?auto_125045 ?auto_125048 ) ) ( not ( = ?auto_125046 ?auto_125048 ) ) ( not ( = ?auto_125047 ?auto_125048 ) ) ( ON ?auto_125046 ?auto_125047 ) ( ON-TABLE ?auto_125048 ) ( ON ?auto_125045 ?auto_125046 ) ( ON ?auto_125044 ?auto_125045 ) ( ON ?auto_125043 ?auto_125044 ) ( ON ?auto_125042 ?auto_125043 ) ( ON ?auto_125041 ?auto_125042 ) ( CLEAR ?auto_125041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125048 ?auto_125047 ?auto_125046 ?auto_125045 ?auto_125044 ?auto_125043 ?auto_125042 )
      ( MAKE-7PILE ?auto_125041 ?auto_125042 ?auto_125043 ?auto_125044 ?auto_125045 ?auto_125046 ?auto_125047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125055 - BLOCK
      ?auto_125056 - BLOCK
      ?auto_125057 - BLOCK
      ?auto_125058 - BLOCK
      ?auto_125059 - BLOCK
      ?auto_125060 - BLOCK
    )
    :vars
    (
      ?auto_125061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125061 ?auto_125060 ) ( CLEAR ?auto_125061 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125055 ) ( ON ?auto_125056 ?auto_125055 ) ( ON ?auto_125057 ?auto_125056 ) ( ON ?auto_125058 ?auto_125057 ) ( ON ?auto_125059 ?auto_125058 ) ( ON ?auto_125060 ?auto_125059 ) ( not ( = ?auto_125055 ?auto_125056 ) ) ( not ( = ?auto_125055 ?auto_125057 ) ) ( not ( = ?auto_125055 ?auto_125058 ) ) ( not ( = ?auto_125055 ?auto_125059 ) ) ( not ( = ?auto_125055 ?auto_125060 ) ) ( not ( = ?auto_125055 ?auto_125061 ) ) ( not ( = ?auto_125056 ?auto_125057 ) ) ( not ( = ?auto_125056 ?auto_125058 ) ) ( not ( = ?auto_125056 ?auto_125059 ) ) ( not ( = ?auto_125056 ?auto_125060 ) ) ( not ( = ?auto_125056 ?auto_125061 ) ) ( not ( = ?auto_125057 ?auto_125058 ) ) ( not ( = ?auto_125057 ?auto_125059 ) ) ( not ( = ?auto_125057 ?auto_125060 ) ) ( not ( = ?auto_125057 ?auto_125061 ) ) ( not ( = ?auto_125058 ?auto_125059 ) ) ( not ( = ?auto_125058 ?auto_125060 ) ) ( not ( = ?auto_125058 ?auto_125061 ) ) ( not ( = ?auto_125059 ?auto_125060 ) ) ( not ( = ?auto_125059 ?auto_125061 ) ) ( not ( = ?auto_125060 ?auto_125061 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125061 ?auto_125060 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125077 - BLOCK
      ?auto_125078 - BLOCK
      ?auto_125079 - BLOCK
      ?auto_125080 - BLOCK
      ?auto_125081 - BLOCK
      ?auto_125082 - BLOCK
    )
    :vars
    (
      ?auto_125083 - BLOCK
      ?auto_125084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125077 ) ( ON ?auto_125078 ?auto_125077 ) ( ON ?auto_125079 ?auto_125078 ) ( ON ?auto_125080 ?auto_125079 ) ( ON ?auto_125081 ?auto_125080 ) ( not ( = ?auto_125077 ?auto_125078 ) ) ( not ( = ?auto_125077 ?auto_125079 ) ) ( not ( = ?auto_125077 ?auto_125080 ) ) ( not ( = ?auto_125077 ?auto_125081 ) ) ( not ( = ?auto_125077 ?auto_125082 ) ) ( not ( = ?auto_125077 ?auto_125083 ) ) ( not ( = ?auto_125078 ?auto_125079 ) ) ( not ( = ?auto_125078 ?auto_125080 ) ) ( not ( = ?auto_125078 ?auto_125081 ) ) ( not ( = ?auto_125078 ?auto_125082 ) ) ( not ( = ?auto_125078 ?auto_125083 ) ) ( not ( = ?auto_125079 ?auto_125080 ) ) ( not ( = ?auto_125079 ?auto_125081 ) ) ( not ( = ?auto_125079 ?auto_125082 ) ) ( not ( = ?auto_125079 ?auto_125083 ) ) ( not ( = ?auto_125080 ?auto_125081 ) ) ( not ( = ?auto_125080 ?auto_125082 ) ) ( not ( = ?auto_125080 ?auto_125083 ) ) ( not ( = ?auto_125081 ?auto_125082 ) ) ( not ( = ?auto_125081 ?auto_125083 ) ) ( not ( = ?auto_125082 ?auto_125083 ) ) ( ON ?auto_125083 ?auto_125084 ) ( CLEAR ?auto_125083 ) ( not ( = ?auto_125077 ?auto_125084 ) ) ( not ( = ?auto_125078 ?auto_125084 ) ) ( not ( = ?auto_125079 ?auto_125084 ) ) ( not ( = ?auto_125080 ?auto_125084 ) ) ( not ( = ?auto_125081 ?auto_125084 ) ) ( not ( = ?auto_125082 ?auto_125084 ) ) ( not ( = ?auto_125083 ?auto_125084 ) ) ( HOLDING ?auto_125082 ) ( CLEAR ?auto_125081 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125077 ?auto_125078 ?auto_125079 ?auto_125080 ?auto_125081 ?auto_125082 ?auto_125083 )
      ( MAKE-6PILE ?auto_125077 ?auto_125078 ?auto_125079 ?auto_125080 ?auto_125081 ?auto_125082 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125085 - BLOCK
      ?auto_125086 - BLOCK
      ?auto_125087 - BLOCK
      ?auto_125088 - BLOCK
      ?auto_125089 - BLOCK
      ?auto_125090 - BLOCK
    )
    :vars
    (
      ?auto_125091 - BLOCK
      ?auto_125092 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125085 ) ( ON ?auto_125086 ?auto_125085 ) ( ON ?auto_125087 ?auto_125086 ) ( ON ?auto_125088 ?auto_125087 ) ( ON ?auto_125089 ?auto_125088 ) ( not ( = ?auto_125085 ?auto_125086 ) ) ( not ( = ?auto_125085 ?auto_125087 ) ) ( not ( = ?auto_125085 ?auto_125088 ) ) ( not ( = ?auto_125085 ?auto_125089 ) ) ( not ( = ?auto_125085 ?auto_125090 ) ) ( not ( = ?auto_125085 ?auto_125091 ) ) ( not ( = ?auto_125086 ?auto_125087 ) ) ( not ( = ?auto_125086 ?auto_125088 ) ) ( not ( = ?auto_125086 ?auto_125089 ) ) ( not ( = ?auto_125086 ?auto_125090 ) ) ( not ( = ?auto_125086 ?auto_125091 ) ) ( not ( = ?auto_125087 ?auto_125088 ) ) ( not ( = ?auto_125087 ?auto_125089 ) ) ( not ( = ?auto_125087 ?auto_125090 ) ) ( not ( = ?auto_125087 ?auto_125091 ) ) ( not ( = ?auto_125088 ?auto_125089 ) ) ( not ( = ?auto_125088 ?auto_125090 ) ) ( not ( = ?auto_125088 ?auto_125091 ) ) ( not ( = ?auto_125089 ?auto_125090 ) ) ( not ( = ?auto_125089 ?auto_125091 ) ) ( not ( = ?auto_125090 ?auto_125091 ) ) ( ON ?auto_125091 ?auto_125092 ) ( not ( = ?auto_125085 ?auto_125092 ) ) ( not ( = ?auto_125086 ?auto_125092 ) ) ( not ( = ?auto_125087 ?auto_125092 ) ) ( not ( = ?auto_125088 ?auto_125092 ) ) ( not ( = ?auto_125089 ?auto_125092 ) ) ( not ( = ?auto_125090 ?auto_125092 ) ) ( not ( = ?auto_125091 ?auto_125092 ) ) ( CLEAR ?auto_125089 ) ( ON ?auto_125090 ?auto_125091 ) ( CLEAR ?auto_125090 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125092 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125092 ?auto_125091 )
      ( MAKE-6PILE ?auto_125085 ?auto_125086 ?auto_125087 ?auto_125088 ?auto_125089 ?auto_125090 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125093 - BLOCK
      ?auto_125094 - BLOCK
      ?auto_125095 - BLOCK
      ?auto_125096 - BLOCK
      ?auto_125097 - BLOCK
      ?auto_125098 - BLOCK
    )
    :vars
    (
      ?auto_125100 - BLOCK
      ?auto_125099 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125093 ) ( ON ?auto_125094 ?auto_125093 ) ( ON ?auto_125095 ?auto_125094 ) ( ON ?auto_125096 ?auto_125095 ) ( not ( = ?auto_125093 ?auto_125094 ) ) ( not ( = ?auto_125093 ?auto_125095 ) ) ( not ( = ?auto_125093 ?auto_125096 ) ) ( not ( = ?auto_125093 ?auto_125097 ) ) ( not ( = ?auto_125093 ?auto_125098 ) ) ( not ( = ?auto_125093 ?auto_125100 ) ) ( not ( = ?auto_125094 ?auto_125095 ) ) ( not ( = ?auto_125094 ?auto_125096 ) ) ( not ( = ?auto_125094 ?auto_125097 ) ) ( not ( = ?auto_125094 ?auto_125098 ) ) ( not ( = ?auto_125094 ?auto_125100 ) ) ( not ( = ?auto_125095 ?auto_125096 ) ) ( not ( = ?auto_125095 ?auto_125097 ) ) ( not ( = ?auto_125095 ?auto_125098 ) ) ( not ( = ?auto_125095 ?auto_125100 ) ) ( not ( = ?auto_125096 ?auto_125097 ) ) ( not ( = ?auto_125096 ?auto_125098 ) ) ( not ( = ?auto_125096 ?auto_125100 ) ) ( not ( = ?auto_125097 ?auto_125098 ) ) ( not ( = ?auto_125097 ?auto_125100 ) ) ( not ( = ?auto_125098 ?auto_125100 ) ) ( ON ?auto_125100 ?auto_125099 ) ( not ( = ?auto_125093 ?auto_125099 ) ) ( not ( = ?auto_125094 ?auto_125099 ) ) ( not ( = ?auto_125095 ?auto_125099 ) ) ( not ( = ?auto_125096 ?auto_125099 ) ) ( not ( = ?auto_125097 ?auto_125099 ) ) ( not ( = ?auto_125098 ?auto_125099 ) ) ( not ( = ?auto_125100 ?auto_125099 ) ) ( ON ?auto_125098 ?auto_125100 ) ( CLEAR ?auto_125098 ) ( ON-TABLE ?auto_125099 ) ( HOLDING ?auto_125097 ) ( CLEAR ?auto_125096 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125093 ?auto_125094 ?auto_125095 ?auto_125096 ?auto_125097 )
      ( MAKE-6PILE ?auto_125093 ?auto_125094 ?auto_125095 ?auto_125096 ?auto_125097 ?auto_125098 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125101 - BLOCK
      ?auto_125102 - BLOCK
      ?auto_125103 - BLOCK
      ?auto_125104 - BLOCK
      ?auto_125105 - BLOCK
      ?auto_125106 - BLOCK
    )
    :vars
    (
      ?auto_125108 - BLOCK
      ?auto_125107 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125101 ) ( ON ?auto_125102 ?auto_125101 ) ( ON ?auto_125103 ?auto_125102 ) ( ON ?auto_125104 ?auto_125103 ) ( not ( = ?auto_125101 ?auto_125102 ) ) ( not ( = ?auto_125101 ?auto_125103 ) ) ( not ( = ?auto_125101 ?auto_125104 ) ) ( not ( = ?auto_125101 ?auto_125105 ) ) ( not ( = ?auto_125101 ?auto_125106 ) ) ( not ( = ?auto_125101 ?auto_125108 ) ) ( not ( = ?auto_125102 ?auto_125103 ) ) ( not ( = ?auto_125102 ?auto_125104 ) ) ( not ( = ?auto_125102 ?auto_125105 ) ) ( not ( = ?auto_125102 ?auto_125106 ) ) ( not ( = ?auto_125102 ?auto_125108 ) ) ( not ( = ?auto_125103 ?auto_125104 ) ) ( not ( = ?auto_125103 ?auto_125105 ) ) ( not ( = ?auto_125103 ?auto_125106 ) ) ( not ( = ?auto_125103 ?auto_125108 ) ) ( not ( = ?auto_125104 ?auto_125105 ) ) ( not ( = ?auto_125104 ?auto_125106 ) ) ( not ( = ?auto_125104 ?auto_125108 ) ) ( not ( = ?auto_125105 ?auto_125106 ) ) ( not ( = ?auto_125105 ?auto_125108 ) ) ( not ( = ?auto_125106 ?auto_125108 ) ) ( ON ?auto_125108 ?auto_125107 ) ( not ( = ?auto_125101 ?auto_125107 ) ) ( not ( = ?auto_125102 ?auto_125107 ) ) ( not ( = ?auto_125103 ?auto_125107 ) ) ( not ( = ?auto_125104 ?auto_125107 ) ) ( not ( = ?auto_125105 ?auto_125107 ) ) ( not ( = ?auto_125106 ?auto_125107 ) ) ( not ( = ?auto_125108 ?auto_125107 ) ) ( ON ?auto_125106 ?auto_125108 ) ( ON-TABLE ?auto_125107 ) ( CLEAR ?auto_125104 ) ( ON ?auto_125105 ?auto_125106 ) ( CLEAR ?auto_125105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125107 ?auto_125108 ?auto_125106 )
      ( MAKE-6PILE ?auto_125101 ?auto_125102 ?auto_125103 ?auto_125104 ?auto_125105 ?auto_125106 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125109 - BLOCK
      ?auto_125110 - BLOCK
      ?auto_125111 - BLOCK
      ?auto_125112 - BLOCK
      ?auto_125113 - BLOCK
      ?auto_125114 - BLOCK
    )
    :vars
    (
      ?auto_125115 - BLOCK
      ?auto_125116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125109 ) ( ON ?auto_125110 ?auto_125109 ) ( ON ?auto_125111 ?auto_125110 ) ( not ( = ?auto_125109 ?auto_125110 ) ) ( not ( = ?auto_125109 ?auto_125111 ) ) ( not ( = ?auto_125109 ?auto_125112 ) ) ( not ( = ?auto_125109 ?auto_125113 ) ) ( not ( = ?auto_125109 ?auto_125114 ) ) ( not ( = ?auto_125109 ?auto_125115 ) ) ( not ( = ?auto_125110 ?auto_125111 ) ) ( not ( = ?auto_125110 ?auto_125112 ) ) ( not ( = ?auto_125110 ?auto_125113 ) ) ( not ( = ?auto_125110 ?auto_125114 ) ) ( not ( = ?auto_125110 ?auto_125115 ) ) ( not ( = ?auto_125111 ?auto_125112 ) ) ( not ( = ?auto_125111 ?auto_125113 ) ) ( not ( = ?auto_125111 ?auto_125114 ) ) ( not ( = ?auto_125111 ?auto_125115 ) ) ( not ( = ?auto_125112 ?auto_125113 ) ) ( not ( = ?auto_125112 ?auto_125114 ) ) ( not ( = ?auto_125112 ?auto_125115 ) ) ( not ( = ?auto_125113 ?auto_125114 ) ) ( not ( = ?auto_125113 ?auto_125115 ) ) ( not ( = ?auto_125114 ?auto_125115 ) ) ( ON ?auto_125115 ?auto_125116 ) ( not ( = ?auto_125109 ?auto_125116 ) ) ( not ( = ?auto_125110 ?auto_125116 ) ) ( not ( = ?auto_125111 ?auto_125116 ) ) ( not ( = ?auto_125112 ?auto_125116 ) ) ( not ( = ?auto_125113 ?auto_125116 ) ) ( not ( = ?auto_125114 ?auto_125116 ) ) ( not ( = ?auto_125115 ?auto_125116 ) ) ( ON ?auto_125114 ?auto_125115 ) ( ON-TABLE ?auto_125116 ) ( ON ?auto_125113 ?auto_125114 ) ( CLEAR ?auto_125113 ) ( HOLDING ?auto_125112 ) ( CLEAR ?auto_125111 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125109 ?auto_125110 ?auto_125111 ?auto_125112 )
      ( MAKE-6PILE ?auto_125109 ?auto_125110 ?auto_125111 ?auto_125112 ?auto_125113 ?auto_125114 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125117 - BLOCK
      ?auto_125118 - BLOCK
      ?auto_125119 - BLOCK
      ?auto_125120 - BLOCK
      ?auto_125121 - BLOCK
      ?auto_125122 - BLOCK
    )
    :vars
    (
      ?auto_125124 - BLOCK
      ?auto_125123 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125117 ) ( ON ?auto_125118 ?auto_125117 ) ( ON ?auto_125119 ?auto_125118 ) ( not ( = ?auto_125117 ?auto_125118 ) ) ( not ( = ?auto_125117 ?auto_125119 ) ) ( not ( = ?auto_125117 ?auto_125120 ) ) ( not ( = ?auto_125117 ?auto_125121 ) ) ( not ( = ?auto_125117 ?auto_125122 ) ) ( not ( = ?auto_125117 ?auto_125124 ) ) ( not ( = ?auto_125118 ?auto_125119 ) ) ( not ( = ?auto_125118 ?auto_125120 ) ) ( not ( = ?auto_125118 ?auto_125121 ) ) ( not ( = ?auto_125118 ?auto_125122 ) ) ( not ( = ?auto_125118 ?auto_125124 ) ) ( not ( = ?auto_125119 ?auto_125120 ) ) ( not ( = ?auto_125119 ?auto_125121 ) ) ( not ( = ?auto_125119 ?auto_125122 ) ) ( not ( = ?auto_125119 ?auto_125124 ) ) ( not ( = ?auto_125120 ?auto_125121 ) ) ( not ( = ?auto_125120 ?auto_125122 ) ) ( not ( = ?auto_125120 ?auto_125124 ) ) ( not ( = ?auto_125121 ?auto_125122 ) ) ( not ( = ?auto_125121 ?auto_125124 ) ) ( not ( = ?auto_125122 ?auto_125124 ) ) ( ON ?auto_125124 ?auto_125123 ) ( not ( = ?auto_125117 ?auto_125123 ) ) ( not ( = ?auto_125118 ?auto_125123 ) ) ( not ( = ?auto_125119 ?auto_125123 ) ) ( not ( = ?auto_125120 ?auto_125123 ) ) ( not ( = ?auto_125121 ?auto_125123 ) ) ( not ( = ?auto_125122 ?auto_125123 ) ) ( not ( = ?auto_125124 ?auto_125123 ) ) ( ON ?auto_125122 ?auto_125124 ) ( ON-TABLE ?auto_125123 ) ( ON ?auto_125121 ?auto_125122 ) ( CLEAR ?auto_125119 ) ( ON ?auto_125120 ?auto_125121 ) ( CLEAR ?auto_125120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125123 ?auto_125124 ?auto_125122 ?auto_125121 )
      ( MAKE-6PILE ?auto_125117 ?auto_125118 ?auto_125119 ?auto_125120 ?auto_125121 ?auto_125122 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125125 - BLOCK
      ?auto_125126 - BLOCK
      ?auto_125127 - BLOCK
      ?auto_125128 - BLOCK
      ?auto_125129 - BLOCK
      ?auto_125130 - BLOCK
    )
    :vars
    (
      ?auto_125132 - BLOCK
      ?auto_125131 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125125 ) ( ON ?auto_125126 ?auto_125125 ) ( not ( = ?auto_125125 ?auto_125126 ) ) ( not ( = ?auto_125125 ?auto_125127 ) ) ( not ( = ?auto_125125 ?auto_125128 ) ) ( not ( = ?auto_125125 ?auto_125129 ) ) ( not ( = ?auto_125125 ?auto_125130 ) ) ( not ( = ?auto_125125 ?auto_125132 ) ) ( not ( = ?auto_125126 ?auto_125127 ) ) ( not ( = ?auto_125126 ?auto_125128 ) ) ( not ( = ?auto_125126 ?auto_125129 ) ) ( not ( = ?auto_125126 ?auto_125130 ) ) ( not ( = ?auto_125126 ?auto_125132 ) ) ( not ( = ?auto_125127 ?auto_125128 ) ) ( not ( = ?auto_125127 ?auto_125129 ) ) ( not ( = ?auto_125127 ?auto_125130 ) ) ( not ( = ?auto_125127 ?auto_125132 ) ) ( not ( = ?auto_125128 ?auto_125129 ) ) ( not ( = ?auto_125128 ?auto_125130 ) ) ( not ( = ?auto_125128 ?auto_125132 ) ) ( not ( = ?auto_125129 ?auto_125130 ) ) ( not ( = ?auto_125129 ?auto_125132 ) ) ( not ( = ?auto_125130 ?auto_125132 ) ) ( ON ?auto_125132 ?auto_125131 ) ( not ( = ?auto_125125 ?auto_125131 ) ) ( not ( = ?auto_125126 ?auto_125131 ) ) ( not ( = ?auto_125127 ?auto_125131 ) ) ( not ( = ?auto_125128 ?auto_125131 ) ) ( not ( = ?auto_125129 ?auto_125131 ) ) ( not ( = ?auto_125130 ?auto_125131 ) ) ( not ( = ?auto_125132 ?auto_125131 ) ) ( ON ?auto_125130 ?auto_125132 ) ( ON-TABLE ?auto_125131 ) ( ON ?auto_125129 ?auto_125130 ) ( ON ?auto_125128 ?auto_125129 ) ( CLEAR ?auto_125128 ) ( HOLDING ?auto_125127 ) ( CLEAR ?auto_125126 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125125 ?auto_125126 ?auto_125127 )
      ( MAKE-6PILE ?auto_125125 ?auto_125126 ?auto_125127 ?auto_125128 ?auto_125129 ?auto_125130 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125133 - BLOCK
      ?auto_125134 - BLOCK
      ?auto_125135 - BLOCK
      ?auto_125136 - BLOCK
      ?auto_125137 - BLOCK
      ?auto_125138 - BLOCK
    )
    :vars
    (
      ?auto_125139 - BLOCK
      ?auto_125140 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125133 ) ( ON ?auto_125134 ?auto_125133 ) ( not ( = ?auto_125133 ?auto_125134 ) ) ( not ( = ?auto_125133 ?auto_125135 ) ) ( not ( = ?auto_125133 ?auto_125136 ) ) ( not ( = ?auto_125133 ?auto_125137 ) ) ( not ( = ?auto_125133 ?auto_125138 ) ) ( not ( = ?auto_125133 ?auto_125139 ) ) ( not ( = ?auto_125134 ?auto_125135 ) ) ( not ( = ?auto_125134 ?auto_125136 ) ) ( not ( = ?auto_125134 ?auto_125137 ) ) ( not ( = ?auto_125134 ?auto_125138 ) ) ( not ( = ?auto_125134 ?auto_125139 ) ) ( not ( = ?auto_125135 ?auto_125136 ) ) ( not ( = ?auto_125135 ?auto_125137 ) ) ( not ( = ?auto_125135 ?auto_125138 ) ) ( not ( = ?auto_125135 ?auto_125139 ) ) ( not ( = ?auto_125136 ?auto_125137 ) ) ( not ( = ?auto_125136 ?auto_125138 ) ) ( not ( = ?auto_125136 ?auto_125139 ) ) ( not ( = ?auto_125137 ?auto_125138 ) ) ( not ( = ?auto_125137 ?auto_125139 ) ) ( not ( = ?auto_125138 ?auto_125139 ) ) ( ON ?auto_125139 ?auto_125140 ) ( not ( = ?auto_125133 ?auto_125140 ) ) ( not ( = ?auto_125134 ?auto_125140 ) ) ( not ( = ?auto_125135 ?auto_125140 ) ) ( not ( = ?auto_125136 ?auto_125140 ) ) ( not ( = ?auto_125137 ?auto_125140 ) ) ( not ( = ?auto_125138 ?auto_125140 ) ) ( not ( = ?auto_125139 ?auto_125140 ) ) ( ON ?auto_125138 ?auto_125139 ) ( ON-TABLE ?auto_125140 ) ( ON ?auto_125137 ?auto_125138 ) ( ON ?auto_125136 ?auto_125137 ) ( CLEAR ?auto_125134 ) ( ON ?auto_125135 ?auto_125136 ) ( CLEAR ?auto_125135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125140 ?auto_125139 ?auto_125138 ?auto_125137 ?auto_125136 )
      ( MAKE-6PILE ?auto_125133 ?auto_125134 ?auto_125135 ?auto_125136 ?auto_125137 ?auto_125138 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125141 - BLOCK
      ?auto_125142 - BLOCK
      ?auto_125143 - BLOCK
      ?auto_125144 - BLOCK
      ?auto_125145 - BLOCK
      ?auto_125146 - BLOCK
    )
    :vars
    (
      ?auto_125148 - BLOCK
      ?auto_125147 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125141 ) ( not ( = ?auto_125141 ?auto_125142 ) ) ( not ( = ?auto_125141 ?auto_125143 ) ) ( not ( = ?auto_125141 ?auto_125144 ) ) ( not ( = ?auto_125141 ?auto_125145 ) ) ( not ( = ?auto_125141 ?auto_125146 ) ) ( not ( = ?auto_125141 ?auto_125148 ) ) ( not ( = ?auto_125142 ?auto_125143 ) ) ( not ( = ?auto_125142 ?auto_125144 ) ) ( not ( = ?auto_125142 ?auto_125145 ) ) ( not ( = ?auto_125142 ?auto_125146 ) ) ( not ( = ?auto_125142 ?auto_125148 ) ) ( not ( = ?auto_125143 ?auto_125144 ) ) ( not ( = ?auto_125143 ?auto_125145 ) ) ( not ( = ?auto_125143 ?auto_125146 ) ) ( not ( = ?auto_125143 ?auto_125148 ) ) ( not ( = ?auto_125144 ?auto_125145 ) ) ( not ( = ?auto_125144 ?auto_125146 ) ) ( not ( = ?auto_125144 ?auto_125148 ) ) ( not ( = ?auto_125145 ?auto_125146 ) ) ( not ( = ?auto_125145 ?auto_125148 ) ) ( not ( = ?auto_125146 ?auto_125148 ) ) ( ON ?auto_125148 ?auto_125147 ) ( not ( = ?auto_125141 ?auto_125147 ) ) ( not ( = ?auto_125142 ?auto_125147 ) ) ( not ( = ?auto_125143 ?auto_125147 ) ) ( not ( = ?auto_125144 ?auto_125147 ) ) ( not ( = ?auto_125145 ?auto_125147 ) ) ( not ( = ?auto_125146 ?auto_125147 ) ) ( not ( = ?auto_125148 ?auto_125147 ) ) ( ON ?auto_125146 ?auto_125148 ) ( ON-TABLE ?auto_125147 ) ( ON ?auto_125145 ?auto_125146 ) ( ON ?auto_125144 ?auto_125145 ) ( ON ?auto_125143 ?auto_125144 ) ( CLEAR ?auto_125143 ) ( HOLDING ?auto_125142 ) ( CLEAR ?auto_125141 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125141 ?auto_125142 )
      ( MAKE-6PILE ?auto_125141 ?auto_125142 ?auto_125143 ?auto_125144 ?auto_125145 ?auto_125146 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125149 - BLOCK
      ?auto_125150 - BLOCK
      ?auto_125151 - BLOCK
      ?auto_125152 - BLOCK
      ?auto_125153 - BLOCK
      ?auto_125154 - BLOCK
    )
    :vars
    (
      ?auto_125156 - BLOCK
      ?auto_125155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125149 ) ( not ( = ?auto_125149 ?auto_125150 ) ) ( not ( = ?auto_125149 ?auto_125151 ) ) ( not ( = ?auto_125149 ?auto_125152 ) ) ( not ( = ?auto_125149 ?auto_125153 ) ) ( not ( = ?auto_125149 ?auto_125154 ) ) ( not ( = ?auto_125149 ?auto_125156 ) ) ( not ( = ?auto_125150 ?auto_125151 ) ) ( not ( = ?auto_125150 ?auto_125152 ) ) ( not ( = ?auto_125150 ?auto_125153 ) ) ( not ( = ?auto_125150 ?auto_125154 ) ) ( not ( = ?auto_125150 ?auto_125156 ) ) ( not ( = ?auto_125151 ?auto_125152 ) ) ( not ( = ?auto_125151 ?auto_125153 ) ) ( not ( = ?auto_125151 ?auto_125154 ) ) ( not ( = ?auto_125151 ?auto_125156 ) ) ( not ( = ?auto_125152 ?auto_125153 ) ) ( not ( = ?auto_125152 ?auto_125154 ) ) ( not ( = ?auto_125152 ?auto_125156 ) ) ( not ( = ?auto_125153 ?auto_125154 ) ) ( not ( = ?auto_125153 ?auto_125156 ) ) ( not ( = ?auto_125154 ?auto_125156 ) ) ( ON ?auto_125156 ?auto_125155 ) ( not ( = ?auto_125149 ?auto_125155 ) ) ( not ( = ?auto_125150 ?auto_125155 ) ) ( not ( = ?auto_125151 ?auto_125155 ) ) ( not ( = ?auto_125152 ?auto_125155 ) ) ( not ( = ?auto_125153 ?auto_125155 ) ) ( not ( = ?auto_125154 ?auto_125155 ) ) ( not ( = ?auto_125156 ?auto_125155 ) ) ( ON ?auto_125154 ?auto_125156 ) ( ON-TABLE ?auto_125155 ) ( ON ?auto_125153 ?auto_125154 ) ( ON ?auto_125152 ?auto_125153 ) ( ON ?auto_125151 ?auto_125152 ) ( CLEAR ?auto_125149 ) ( ON ?auto_125150 ?auto_125151 ) ( CLEAR ?auto_125150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125155 ?auto_125156 ?auto_125154 ?auto_125153 ?auto_125152 ?auto_125151 )
      ( MAKE-6PILE ?auto_125149 ?auto_125150 ?auto_125151 ?auto_125152 ?auto_125153 ?auto_125154 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125157 - BLOCK
      ?auto_125158 - BLOCK
      ?auto_125159 - BLOCK
      ?auto_125160 - BLOCK
      ?auto_125161 - BLOCK
      ?auto_125162 - BLOCK
    )
    :vars
    (
      ?auto_125163 - BLOCK
      ?auto_125164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125157 ?auto_125158 ) ) ( not ( = ?auto_125157 ?auto_125159 ) ) ( not ( = ?auto_125157 ?auto_125160 ) ) ( not ( = ?auto_125157 ?auto_125161 ) ) ( not ( = ?auto_125157 ?auto_125162 ) ) ( not ( = ?auto_125157 ?auto_125163 ) ) ( not ( = ?auto_125158 ?auto_125159 ) ) ( not ( = ?auto_125158 ?auto_125160 ) ) ( not ( = ?auto_125158 ?auto_125161 ) ) ( not ( = ?auto_125158 ?auto_125162 ) ) ( not ( = ?auto_125158 ?auto_125163 ) ) ( not ( = ?auto_125159 ?auto_125160 ) ) ( not ( = ?auto_125159 ?auto_125161 ) ) ( not ( = ?auto_125159 ?auto_125162 ) ) ( not ( = ?auto_125159 ?auto_125163 ) ) ( not ( = ?auto_125160 ?auto_125161 ) ) ( not ( = ?auto_125160 ?auto_125162 ) ) ( not ( = ?auto_125160 ?auto_125163 ) ) ( not ( = ?auto_125161 ?auto_125162 ) ) ( not ( = ?auto_125161 ?auto_125163 ) ) ( not ( = ?auto_125162 ?auto_125163 ) ) ( ON ?auto_125163 ?auto_125164 ) ( not ( = ?auto_125157 ?auto_125164 ) ) ( not ( = ?auto_125158 ?auto_125164 ) ) ( not ( = ?auto_125159 ?auto_125164 ) ) ( not ( = ?auto_125160 ?auto_125164 ) ) ( not ( = ?auto_125161 ?auto_125164 ) ) ( not ( = ?auto_125162 ?auto_125164 ) ) ( not ( = ?auto_125163 ?auto_125164 ) ) ( ON ?auto_125162 ?auto_125163 ) ( ON-TABLE ?auto_125164 ) ( ON ?auto_125161 ?auto_125162 ) ( ON ?auto_125160 ?auto_125161 ) ( ON ?auto_125159 ?auto_125160 ) ( ON ?auto_125158 ?auto_125159 ) ( CLEAR ?auto_125158 ) ( HOLDING ?auto_125157 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125157 )
      ( MAKE-6PILE ?auto_125157 ?auto_125158 ?auto_125159 ?auto_125160 ?auto_125161 ?auto_125162 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_125165 - BLOCK
      ?auto_125166 - BLOCK
      ?auto_125167 - BLOCK
      ?auto_125168 - BLOCK
      ?auto_125169 - BLOCK
      ?auto_125170 - BLOCK
    )
    :vars
    (
      ?auto_125172 - BLOCK
      ?auto_125171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125165 ?auto_125166 ) ) ( not ( = ?auto_125165 ?auto_125167 ) ) ( not ( = ?auto_125165 ?auto_125168 ) ) ( not ( = ?auto_125165 ?auto_125169 ) ) ( not ( = ?auto_125165 ?auto_125170 ) ) ( not ( = ?auto_125165 ?auto_125172 ) ) ( not ( = ?auto_125166 ?auto_125167 ) ) ( not ( = ?auto_125166 ?auto_125168 ) ) ( not ( = ?auto_125166 ?auto_125169 ) ) ( not ( = ?auto_125166 ?auto_125170 ) ) ( not ( = ?auto_125166 ?auto_125172 ) ) ( not ( = ?auto_125167 ?auto_125168 ) ) ( not ( = ?auto_125167 ?auto_125169 ) ) ( not ( = ?auto_125167 ?auto_125170 ) ) ( not ( = ?auto_125167 ?auto_125172 ) ) ( not ( = ?auto_125168 ?auto_125169 ) ) ( not ( = ?auto_125168 ?auto_125170 ) ) ( not ( = ?auto_125168 ?auto_125172 ) ) ( not ( = ?auto_125169 ?auto_125170 ) ) ( not ( = ?auto_125169 ?auto_125172 ) ) ( not ( = ?auto_125170 ?auto_125172 ) ) ( ON ?auto_125172 ?auto_125171 ) ( not ( = ?auto_125165 ?auto_125171 ) ) ( not ( = ?auto_125166 ?auto_125171 ) ) ( not ( = ?auto_125167 ?auto_125171 ) ) ( not ( = ?auto_125168 ?auto_125171 ) ) ( not ( = ?auto_125169 ?auto_125171 ) ) ( not ( = ?auto_125170 ?auto_125171 ) ) ( not ( = ?auto_125172 ?auto_125171 ) ) ( ON ?auto_125170 ?auto_125172 ) ( ON-TABLE ?auto_125171 ) ( ON ?auto_125169 ?auto_125170 ) ( ON ?auto_125168 ?auto_125169 ) ( ON ?auto_125167 ?auto_125168 ) ( ON ?auto_125166 ?auto_125167 ) ( ON ?auto_125165 ?auto_125166 ) ( CLEAR ?auto_125165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125171 ?auto_125172 ?auto_125170 ?auto_125169 ?auto_125168 ?auto_125167 ?auto_125166 )
      ( MAKE-6PILE ?auto_125165 ?auto_125166 ?auto_125167 ?auto_125168 ?auto_125169 ?auto_125170 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125174 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_125174 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_125174 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125175 - BLOCK
    )
    :vars
    (
      ?auto_125176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125175 ?auto_125176 ) ( CLEAR ?auto_125175 ) ( HAND-EMPTY ) ( not ( = ?auto_125175 ?auto_125176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125175 ?auto_125176 )
      ( MAKE-1PILE ?auto_125175 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125177 - BLOCK
    )
    :vars
    (
      ?auto_125178 - BLOCK
      ?auto_125183 - BLOCK
      ?auto_125182 - BLOCK
      ?auto_125181 - BLOCK
      ?auto_125180 - BLOCK
      ?auto_125179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125177 ?auto_125178 ) ) ( HOLDING ?auto_125177 ) ( CLEAR ?auto_125178 ) ( ON-TABLE ?auto_125183 ) ( ON ?auto_125182 ?auto_125183 ) ( ON ?auto_125181 ?auto_125182 ) ( ON ?auto_125180 ?auto_125181 ) ( ON ?auto_125179 ?auto_125180 ) ( ON ?auto_125178 ?auto_125179 ) ( not ( = ?auto_125183 ?auto_125182 ) ) ( not ( = ?auto_125183 ?auto_125181 ) ) ( not ( = ?auto_125183 ?auto_125180 ) ) ( not ( = ?auto_125183 ?auto_125179 ) ) ( not ( = ?auto_125183 ?auto_125178 ) ) ( not ( = ?auto_125183 ?auto_125177 ) ) ( not ( = ?auto_125182 ?auto_125181 ) ) ( not ( = ?auto_125182 ?auto_125180 ) ) ( not ( = ?auto_125182 ?auto_125179 ) ) ( not ( = ?auto_125182 ?auto_125178 ) ) ( not ( = ?auto_125182 ?auto_125177 ) ) ( not ( = ?auto_125181 ?auto_125180 ) ) ( not ( = ?auto_125181 ?auto_125179 ) ) ( not ( = ?auto_125181 ?auto_125178 ) ) ( not ( = ?auto_125181 ?auto_125177 ) ) ( not ( = ?auto_125180 ?auto_125179 ) ) ( not ( = ?auto_125180 ?auto_125178 ) ) ( not ( = ?auto_125180 ?auto_125177 ) ) ( not ( = ?auto_125179 ?auto_125178 ) ) ( not ( = ?auto_125179 ?auto_125177 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125183 ?auto_125182 ?auto_125181 ?auto_125180 ?auto_125179 ?auto_125178 ?auto_125177 )
      ( MAKE-1PILE ?auto_125177 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125184 - BLOCK
    )
    :vars
    (
      ?auto_125185 - BLOCK
      ?auto_125186 - BLOCK
      ?auto_125189 - BLOCK
      ?auto_125188 - BLOCK
      ?auto_125187 - BLOCK
      ?auto_125190 - BLOCK
      ?auto_125191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125184 ?auto_125185 ) ) ( CLEAR ?auto_125185 ) ( ON-TABLE ?auto_125186 ) ( ON ?auto_125189 ?auto_125186 ) ( ON ?auto_125188 ?auto_125189 ) ( ON ?auto_125187 ?auto_125188 ) ( ON ?auto_125190 ?auto_125187 ) ( ON ?auto_125185 ?auto_125190 ) ( not ( = ?auto_125186 ?auto_125189 ) ) ( not ( = ?auto_125186 ?auto_125188 ) ) ( not ( = ?auto_125186 ?auto_125187 ) ) ( not ( = ?auto_125186 ?auto_125190 ) ) ( not ( = ?auto_125186 ?auto_125185 ) ) ( not ( = ?auto_125186 ?auto_125184 ) ) ( not ( = ?auto_125189 ?auto_125188 ) ) ( not ( = ?auto_125189 ?auto_125187 ) ) ( not ( = ?auto_125189 ?auto_125190 ) ) ( not ( = ?auto_125189 ?auto_125185 ) ) ( not ( = ?auto_125189 ?auto_125184 ) ) ( not ( = ?auto_125188 ?auto_125187 ) ) ( not ( = ?auto_125188 ?auto_125190 ) ) ( not ( = ?auto_125188 ?auto_125185 ) ) ( not ( = ?auto_125188 ?auto_125184 ) ) ( not ( = ?auto_125187 ?auto_125190 ) ) ( not ( = ?auto_125187 ?auto_125185 ) ) ( not ( = ?auto_125187 ?auto_125184 ) ) ( not ( = ?auto_125190 ?auto_125185 ) ) ( not ( = ?auto_125190 ?auto_125184 ) ) ( ON ?auto_125184 ?auto_125191 ) ( CLEAR ?auto_125184 ) ( HAND-EMPTY ) ( not ( = ?auto_125184 ?auto_125191 ) ) ( not ( = ?auto_125185 ?auto_125191 ) ) ( not ( = ?auto_125186 ?auto_125191 ) ) ( not ( = ?auto_125189 ?auto_125191 ) ) ( not ( = ?auto_125188 ?auto_125191 ) ) ( not ( = ?auto_125187 ?auto_125191 ) ) ( not ( = ?auto_125190 ?auto_125191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125184 ?auto_125191 )
      ( MAKE-1PILE ?auto_125184 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125192 - BLOCK
    )
    :vars
    (
      ?auto_125198 - BLOCK
      ?auto_125199 - BLOCK
      ?auto_125196 - BLOCK
      ?auto_125193 - BLOCK
      ?auto_125194 - BLOCK
      ?auto_125195 - BLOCK
      ?auto_125197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125192 ?auto_125198 ) ) ( ON-TABLE ?auto_125199 ) ( ON ?auto_125196 ?auto_125199 ) ( ON ?auto_125193 ?auto_125196 ) ( ON ?auto_125194 ?auto_125193 ) ( ON ?auto_125195 ?auto_125194 ) ( not ( = ?auto_125199 ?auto_125196 ) ) ( not ( = ?auto_125199 ?auto_125193 ) ) ( not ( = ?auto_125199 ?auto_125194 ) ) ( not ( = ?auto_125199 ?auto_125195 ) ) ( not ( = ?auto_125199 ?auto_125198 ) ) ( not ( = ?auto_125199 ?auto_125192 ) ) ( not ( = ?auto_125196 ?auto_125193 ) ) ( not ( = ?auto_125196 ?auto_125194 ) ) ( not ( = ?auto_125196 ?auto_125195 ) ) ( not ( = ?auto_125196 ?auto_125198 ) ) ( not ( = ?auto_125196 ?auto_125192 ) ) ( not ( = ?auto_125193 ?auto_125194 ) ) ( not ( = ?auto_125193 ?auto_125195 ) ) ( not ( = ?auto_125193 ?auto_125198 ) ) ( not ( = ?auto_125193 ?auto_125192 ) ) ( not ( = ?auto_125194 ?auto_125195 ) ) ( not ( = ?auto_125194 ?auto_125198 ) ) ( not ( = ?auto_125194 ?auto_125192 ) ) ( not ( = ?auto_125195 ?auto_125198 ) ) ( not ( = ?auto_125195 ?auto_125192 ) ) ( ON ?auto_125192 ?auto_125197 ) ( CLEAR ?auto_125192 ) ( not ( = ?auto_125192 ?auto_125197 ) ) ( not ( = ?auto_125198 ?auto_125197 ) ) ( not ( = ?auto_125199 ?auto_125197 ) ) ( not ( = ?auto_125196 ?auto_125197 ) ) ( not ( = ?auto_125193 ?auto_125197 ) ) ( not ( = ?auto_125194 ?auto_125197 ) ) ( not ( = ?auto_125195 ?auto_125197 ) ) ( HOLDING ?auto_125198 ) ( CLEAR ?auto_125195 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125199 ?auto_125196 ?auto_125193 ?auto_125194 ?auto_125195 ?auto_125198 )
      ( MAKE-1PILE ?auto_125192 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125200 - BLOCK
    )
    :vars
    (
      ?auto_125201 - BLOCK
      ?auto_125202 - BLOCK
      ?auto_125207 - BLOCK
      ?auto_125204 - BLOCK
      ?auto_125206 - BLOCK
      ?auto_125203 - BLOCK
      ?auto_125205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125200 ?auto_125201 ) ) ( ON-TABLE ?auto_125202 ) ( ON ?auto_125207 ?auto_125202 ) ( ON ?auto_125204 ?auto_125207 ) ( ON ?auto_125206 ?auto_125204 ) ( ON ?auto_125203 ?auto_125206 ) ( not ( = ?auto_125202 ?auto_125207 ) ) ( not ( = ?auto_125202 ?auto_125204 ) ) ( not ( = ?auto_125202 ?auto_125206 ) ) ( not ( = ?auto_125202 ?auto_125203 ) ) ( not ( = ?auto_125202 ?auto_125201 ) ) ( not ( = ?auto_125202 ?auto_125200 ) ) ( not ( = ?auto_125207 ?auto_125204 ) ) ( not ( = ?auto_125207 ?auto_125206 ) ) ( not ( = ?auto_125207 ?auto_125203 ) ) ( not ( = ?auto_125207 ?auto_125201 ) ) ( not ( = ?auto_125207 ?auto_125200 ) ) ( not ( = ?auto_125204 ?auto_125206 ) ) ( not ( = ?auto_125204 ?auto_125203 ) ) ( not ( = ?auto_125204 ?auto_125201 ) ) ( not ( = ?auto_125204 ?auto_125200 ) ) ( not ( = ?auto_125206 ?auto_125203 ) ) ( not ( = ?auto_125206 ?auto_125201 ) ) ( not ( = ?auto_125206 ?auto_125200 ) ) ( not ( = ?auto_125203 ?auto_125201 ) ) ( not ( = ?auto_125203 ?auto_125200 ) ) ( ON ?auto_125200 ?auto_125205 ) ( not ( = ?auto_125200 ?auto_125205 ) ) ( not ( = ?auto_125201 ?auto_125205 ) ) ( not ( = ?auto_125202 ?auto_125205 ) ) ( not ( = ?auto_125207 ?auto_125205 ) ) ( not ( = ?auto_125204 ?auto_125205 ) ) ( not ( = ?auto_125206 ?auto_125205 ) ) ( not ( = ?auto_125203 ?auto_125205 ) ) ( CLEAR ?auto_125203 ) ( ON ?auto_125201 ?auto_125200 ) ( CLEAR ?auto_125201 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125205 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125205 ?auto_125200 )
      ( MAKE-1PILE ?auto_125200 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125208 - BLOCK
    )
    :vars
    (
      ?auto_125211 - BLOCK
      ?auto_125212 - BLOCK
      ?auto_125213 - BLOCK
      ?auto_125215 - BLOCK
      ?auto_125210 - BLOCK
      ?auto_125214 - BLOCK
      ?auto_125209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125208 ?auto_125211 ) ) ( ON-TABLE ?auto_125212 ) ( ON ?auto_125213 ?auto_125212 ) ( ON ?auto_125215 ?auto_125213 ) ( ON ?auto_125210 ?auto_125215 ) ( not ( = ?auto_125212 ?auto_125213 ) ) ( not ( = ?auto_125212 ?auto_125215 ) ) ( not ( = ?auto_125212 ?auto_125210 ) ) ( not ( = ?auto_125212 ?auto_125214 ) ) ( not ( = ?auto_125212 ?auto_125211 ) ) ( not ( = ?auto_125212 ?auto_125208 ) ) ( not ( = ?auto_125213 ?auto_125215 ) ) ( not ( = ?auto_125213 ?auto_125210 ) ) ( not ( = ?auto_125213 ?auto_125214 ) ) ( not ( = ?auto_125213 ?auto_125211 ) ) ( not ( = ?auto_125213 ?auto_125208 ) ) ( not ( = ?auto_125215 ?auto_125210 ) ) ( not ( = ?auto_125215 ?auto_125214 ) ) ( not ( = ?auto_125215 ?auto_125211 ) ) ( not ( = ?auto_125215 ?auto_125208 ) ) ( not ( = ?auto_125210 ?auto_125214 ) ) ( not ( = ?auto_125210 ?auto_125211 ) ) ( not ( = ?auto_125210 ?auto_125208 ) ) ( not ( = ?auto_125214 ?auto_125211 ) ) ( not ( = ?auto_125214 ?auto_125208 ) ) ( ON ?auto_125208 ?auto_125209 ) ( not ( = ?auto_125208 ?auto_125209 ) ) ( not ( = ?auto_125211 ?auto_125209 ) ) ( not ( = ?auto_125212 ?auto_125209 ) ) ( not ( = ?auto_125213 ?auto_125209 ) ) ( not ( = ?auto_125215 ?auto_125209 ) ) ( not ( = ?auto_125210 ?auto_125209 ) ) ( not ( = ?auto_125214 ?auto_125209 ) ) ( ON ?auto_125211 ?auto_125208 ) ( CLEAR ?auto_125211 ) ( ON-TABLE ?auto_125209 ) ( HOLDING ?auto_125214 ) ( CLEAR ?auto_125210 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125212 ?auto_125213 ?auto_125215 ?auto_125210 ?auto_125214 )
      ( MAKE-1PILE ?auto_125208 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125216 - BLOCK
    )
    :vars
    (
      ?auto_125218 - BLOCK
      ?auto_125222 - BLOCK
      ?auto_125217 - BLOCK
      ?auto_125223 - BLOCK
      ?auto_125219 - BLOCK
      ?auto_125221 - BLOCK
      ?auto_125220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125216 ?auto_125218 ) ) ( ON-TABLE ?auto_125222 ) ( ON ?auto_125217 ?auto_125222 ) ( ON ?auto_125223 ?auto_125217 ) ( ON ?auto_125219 ?auto_125223 ) ( not ( = ?auto_125222 ?auto_125217 ) ) ( not ( = ?auto_125222 ?auto_125223 ) ) ( not ( = ?auto_125222 ?auto_125219 ) ) ( not ( = ?auto_125222 ?auto_125221 ) ) ( not ( = ?auto_125222 ?auto_125218 ) ) ( not ( = ?auto_125222 ?auto_125216 ) ) ( not ( = ?auto_125217 ?auto_125223 ) ) ( not ( = ?auto_125217 ?auto_125219 ) ) ( not ( = ?auto_125217 ?auto_125221 ) ) ( not ( = ?auto_125217 ?auto_125218 ) ) ( not ( = ?auto_125217 ?auto_125216 ) ) ( not ( = ?auto_125223 ?auto_125219 ) ) ( not ( = ?auto_125223 ?auto_125221 ) ) ( not ( = ?auto_125223 ?auto_125218 ) ) ( not ( = ?auto_125223 ?auto_125216 ) ) ( not ( = ?auto_125219 ?auto_125221 ) ) ( not ( = ?auto_125219 ?auto_125218 ) ) ( not ( = ?auto_125219 ?auto_125216 ) ) ( not ( = ?auto_125221 ?auto_125218 ) ) ( not ( = ?auto_125221 ?auto_125216 ) ) ( ON ?auto_125216 ?auto_125220 ) ( not ( = ?auto_125216 ?auto_125220 ) ) ( not ( = ?auto_125218 ?auto_125220 ) ) ( not ( = ?auto_125222 ?auto_125220 ) ) ( not ( = ?auto_125217 ?auto_125220 ) ) ( not ( = ?auto_125223 ?auto_125220 ) ) ( not ( = ?auto_125219 ?auto_125220 ) ) ( not ( = ?auto_125221 ?auto_125220 ) ) ( ON ?auto_125218 ?auto_125216 ) ( ON-TABLE ?auto_125220 ) ( CLEAR ?auto_125219 ) ( ON ?auto_125221 ?auto_125218 ) ( CLEAR ?auto_125221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125220 ?auto_125216 ?auto_125218 )
      ( MAKE-1PILE ?auto_125216 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125224 - BLOCK
    )
    :vars
    (
      ?auto_125226 - BLOCK
      ?auto_125229 - BLOCK
      ?auto_125231 - BLOCK
      ?auto_125227 - BLOCK
      ?auto_125225 - BLOCK
      ?auto_125228 - BLOCK
      ?auto_125230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125224 ?auto_125226 ) ) ( ON-TABLE ?auto_125229 ) ( ON ?auto_125231 ?auto_125229 ) ( ON ?auto_125227 ?auto_125231 ) ( not ( = ?auto_125229 ?auto_125231 ) ) ( not ( = ?auto_125229 ?auto_125227 ) ) ( not ( = ?auto_125229 ?auto_125225 ) ) ( not ( = ?auto_125229 ?auto_125228 ) ) ( not ( = ?auto_125229 ?auto_125226 ) ) ( not ( = ?auto_125229 ?auto_125224 ) ) ( not ( = ?auto_125231 ?auto_125227 ) ) ( not ( = ?auto_125231 ?auto_125225 ) ) ( not ( = ?auto_125231 ?auto_125228 ) ) ( not ( = ?auto_125231 ?auto_125226 ) ) ( not ( = ?auto_125231 ?auto_125224 ) ) ( not ( = ?auto_125227 ?auto_125225 ) ) ( not ( = ?auto_125227 ?auto_125228 ) ) ( not ( = ?auto_125227 ?auto_125226 ) ) ( not ( = ?auto_125227 ?auto_125224 ) ) ( not ( = ?auto_125225 ?auto_125228 ) ) ( not ( = ?auto_125225 ?auto_125226 ) ) ( not ( = ?auto_125225 ?auto_125224 ) ) ( not ( = ?auto_125228 ?auto_125226 ) ) ( not ( = ?auto_125228 ?auto_125224 ) ) ( ON ?auto_125224 ?auto_125230 ) ( not ( = ?auto_125224 ?auto_125230 ) ) ( not ( = ?auto_125226 ?auto_125230 ) ) ( not ( = ?auto_125229 ?auto_125230 ) ) ( not ( = ?auto_125231 ?auto_125230 ) ) ( not ( = ?auto_125227 ?auto_125230 ) ) ( not ( = ?auto_125225 ?auto_125230 ) ) ( not ( = ?auto_125228 ?auto_125230 ) ) ( ON ?auto_125226 ?auto_125224 ) ( ON-TABLE ?auto_125230 ) ( ON ?auto_125228 ?auto_125226 ) ( CLEAR ?auto_125228 ) ( HOLDING ?auto_125225 ) ( CLEAR ?auto_125227 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125229 ?auto_125231 ?auto_125227 ?auto_125225 )
      ( MAKE-1PILE ?auto_125224 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125232 - BLOCK
    )
    :vars
    (
      ?auto_125235 - BLOCK
      ?auto_125237 - BLOCK
      ?auto_125238 - BLOCK
      ?auto_125234 - BLOCK
      ?auto_125236 - BLOCK
      ?auto_125239 - BLOCK
      ?auto_125233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125232 ?auto_125235 ) ) ( ON-TABLE ?auto_125237 ) ( ON ?auto_125238 ?auto_125237 ) ( ON ?auto_125234 ?auto_125238 ) ( not ( = ?auto_125237 ?auto_125238 ) ) ( not ( = ?auto_125237 ?auto_125234 ) ) ( not ( = ?auto_125237 ?auto_125236 ) ) ( not ( = ?auto_125237 ?auto_125239 ) ) ( not ( = ?auto_125237 ?auto_125235 ) ) ( not ( = ?auto_125237 ?auto_125232 ) ) ( not ( = ?auto_125238 ?auto_125234 ) ) ( not ( = ?auto_125238 ?auto_125236 ) ) ( not ( = ?auto_125238 ?auto_125239 ) ) ( not ( = ?auto_125238 ?auto_125235 ) ) ( not ( = ?auto_125238 ?auto_125232 ) ) ( not ( = ?auto_125234 ?auto_125236 ) ) ( not ( = ?auto_125234 ?auto_125239 ) ) ( not ( = ?auto_125234 ?auto_125235 ) ) ( not ( = ?auto_125234 ?auto_125232 ) ) ( not ( = ?auto_125236 ?auto_125239 ) ) ( not ( = ?auto_125236 ?auto_125235 ) ) ( not ( = ?auto_125236 ?auto_125232 ) ) ( not ( = ?auto_125239 ?auto_125235 ) ) ( not ( = ?auto_125239 ?auto_125232 ) ) ( ON ?auto_125232 ?auto_125233 ) ( not ( = ?auto_125232 ?auto_125233 ) ) ( not ( = ?auto_125235 ?auto_125233 ) ) ( not ( = ?auto_125237 ?auto_125233 ) ) ( not ( = ?auto_125238 ?auto_125233 ) ) ( not ( = ?auto_125234 ?auto_125233 ) ) ( not ( = ?auto_125236 ?auto_125233 ) ) ( not ( = ?auto_125239 ?auto_125233 ) ) ( ON ?auto_125235 ?auto_125232 ) ( ON-TABLE ?auto_125233 ) ( ON ?auto_125239 ?auto_125235 ) ( CLEAR ?auto_125234 ) ( ON ?auto_125236 ?auto_125239 ) ( CLEAR ?auto_125236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125233 ?auto_125232 ?auto_125235 ?auto_125239 )
      ( MAKE-1PILE ?auto_125232 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125240 - BLOCK
    )
    :vars
    (
      ?auto_125244 - BLOCK
      ?auto_125241 - BLOCK
      ?auto_125242 - BLOCK
      ?auto_125247 - BLOCK
      ?auto_125243 - BLOCK
      ?auto_125245 - BLOCK
      ?auto_125246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125240 ?auto_125244 ) ) ( ON-TABLE ?auto_125241 ) ( ON ?auto_125242 ?auto_125241 ) ( not ( = ?auto_125241 ?auto_125242 ) ) ( not ( = ?auto_125241 ?auto_125247 ) ) ( not ( = ?auto_125241 ?auto_125243 ) ) ( not ( = ?auto_125241 ?auto_125245 ) ) ( not ( = ?auto_125241 ?auto_125244 ) ) ( not ( = ?auto_125241 ?auto_125240 ) ) ( not ( = ?auto_125242 ?auto_125247 ) ) ( not ( = ?auto_125242 ?auto_125243 ) ) ( not ( = ?auto_125242 ?auto_125245 ) ) ( not ( = ?auto_125242 ?auto_125244 ) ) ( not ( = ?auto_125242 ?auto_125240 ) ) ( not ( = ?auto_125247 ?auto_125243 ) ) ( not ( = ?auto_125247 ?auto_125245 ) ) ( not ( = ?auto_125247 ?auto_125244 ) ) ( not ( = ?auto_125247 ?auto_125240 ) ) ( not ( = ?auto_125243 ?auto_125245 ) ) ( not ( = ?auto_125243 ?auto_125244 ) ) ( not ( = ?auto_125243 ?auto_125240 ) ) ( not ( = ?auto_125245 ?auto_125244 ) ) ( not ( = ?auto_125245 ?auto_125240 ) ) ( ON ?auto_125240 ?auto_125246 ) ( not ( = ?auto_125240 ?auto_125246 ) ) ( not ( = ?auto_125244 ?auto_125246 ) ) ( not ( = ?auto_125241 ?auto_125246 ) ) ( not ( = ?auto_125242 ?auto_125246 ) ) ( not ( = ?auto_125247 ?auto_125246 ) ) ( not ( = ?auto_125243 ?auto_125246 ) ) ( not ( = ?auto_125245 ?auto_125246 ) ) ( ON ?auto_125244 ?auto_125240 ) ( ON-TABLE ?auto_125246 ) ( ON ?auto_125245 ?auto_125244 ) ( ON ?auto_125243 ?auto_125245 ) ( CLEAR ?auto_125243 ) ( HOLDING ?auto_125247 ) ( CLEAR ?auto_125242 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125241 ?auto_125242 ?auto_125247 )
      ( MAKE-1PILE ?auto_125240 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125248 - BLOCK
    )
    :vars
    (
      ?auto_125250 - BLOCK
      ?auto_125254 - BLOCK
      ?auto_125255 - BLOCK
      ?auto_125252 - BLOCK
      ?auto_125251 - BLOCK
      ?auto_125253 - BLOCK
      ?auto_125249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125248 ?auto_125250 ) ) ( ON-TABLE ?auto_125254 ) ( ON ?auto_125255 ?auto_125254 ) ( not ( = ?auto_125254 ?auto_125255 ) ) ( not ( = ?auto_125254 ?auto_125252 ) ) ( not ( = ?auto_125254 ?auto_125251 ) ) ( not ( = ?auto_125254 ?auto_125253 ) ) ( not ( = ?auto_125254 ?auto_125250 ) ) ( not ( = ?auto_125254 ?auto_125248 ) ) ( not ( = ?auto_125255 ?auto_125252 ) ) ( not ( = ?auto_125255 ?auto_125251 ) ) ( not ( = ?auto_125255 ?auto_125253 ) ) ( not ( = ?auto_125255 ?auto_125250 ) ) ( not ( = ?auto_125255 ?auto_125248 ) ) ( not ( = ?auto_125252 ?auto_125251 ) ) ( not ( = ?auto_125252 ?auto_125253 ) ) ( not ( = ?auto_125252 ?auto_125250 ) ) ( not ( = ?auto_125252 ?auto_125248 ) ) ( not ( = ?auto_125251 ?auto_125253 ) ) ( not ( = ?auto_125251 ?auto_125250 ) ) ( not ( = ?auto_125251 ?auto_125248 ) ) ( not ( = ?auto_125253 ?auto_125250 ) ) ( not ( = ?auto_125253 ?auto_125248 ) ) ( ON ?auto_125248 ?auto_125249 ) ( not ( = ?auto_125248 ?auto_125249 ) ) ( not ( = ?auto_125250 ?auto_125249 ) ) ( not ( = ?auto_125254 ?auto_125249 ) ) ( not ( = ?auto_125255 ?auto_125249 ) ) ( not ( = ?auto_125252 ?auto_125249 ) ) ( not ( = ?auto_125251 ?auto_125249 ) ) ( not ( = ?auto_125253 ?auto_125249 ) ) ( ON ?auto_125250 ?auto_125248 ) ( ON-TABLE ?auto_125249 ) ( ON ?auto_125253 ?auto_125250 ) ( ON ?auto_125251 ?auto_125253 ) ( CLEAR ?auto_125255 ) ( ON ?auto_125252 ?auto_125251 ) ( CLEAR ?auto_125252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125249 ?auto_125248 ?auto_125250 ?auto_125253 ?auto_125251 )
      ( MAKE-1PILE ?auto_125248 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125256 - BLOCK
    )
    :vars
    (
      ?auto_125260 - BLOCK
      ?auto_125262 - BLOCK
      ?auto_125263 - BLOCK
      ?auto_125257 - BLOCK
      ?auto_125259 - BLOCK
      ?auto_125261 - BLOCK
      ?auto_125258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125256 ?auto_125260 ) ) ( ON-TABLE ?auto_125262 ) ( not ( = ?auto_125262 ?auto_125263 ) ) ( not ( = ?auto_125262 ?auto_125257 ) ) ( not ( = ?auto_125262 ?auto_125259 ) ) ( not ( = ?auto_125262 ?auto_125261 ) ) ( not ( = ?auto_125262 ?auto_125260 ) ) ( not ( = ?auto_125262 ?auto_125256 ) ) ( not ( = ?auto_125263 ?auto_125257 ) ) ( not ( = ?auto_125263 ?auto_125259 ) ) ( not ( = ?auto_125263 ?auto_125261 ) ) ( not ( = ?auto_125263 ?auto_125260 ) ) ( not ( = ?auto_125263 ?auto_125256 ) ) ( not ( = ?auto_125257 ?auto_125259 ) ) ( not ( = ?auto_125257 ?auto_125261 ) ) ( not ( = ?auto_125257 ?auto_125260 ) ) ( not ( = ?auto_125257 ?auto_125256 ) ) ( not ( = ?auto_125259 ?auto_125261 ) ) ( not ( = ?auto_125259 ?auto_125260 ) ) ( not ( = ?auto_125259 ?auto_125256 ) ) ( not ( = ?auto_125261 ?auto_125260 ) ) ( not ( = ?auto_125261 ?auto_125256 ) ) ( ON ?auto_125256 ?auto_125258 ) ( not ( = ?auto_125256 ?auto_125258 ) ) ( not ( = ?auto_125260 ?auto_125258 ) ) ( not ( = ?auto_125262 ?auto_125258 ) ) ( not ( = ?auto_125263 ?auto_125258 ) ) ( not ( = ?auto_125257 ?auto_125258 ) ) ( not ( = ?auto_125259 ?auto_125258 ) ) ( not ( = ?auto_125261 ?auto_125258 ) ) ( ON ?auto_125260 ?auto_125256 ) ( ON-TABLE ?auto_125258 ) ( ON ?auto_125261 ?auto_125260 ) ( ON ?auto_125259 ?auto_125261 ) ( ON ?auto_125257 ?auto_125259 ) ( CLEAR ?auto_125257 ) ( HOLDING ?auto_125263 ) ( CLEAR ?auto_125262 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125262 ?auto_125263 )
      ( MAKE-1PILE ?auto_125256 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125264 - BLOCK
    )
    :vars
    (
      ?auto_125271 - BLOCK
      ?auto_125270 - BLOCK
      ?auto_125267 - BLOCK
      ?auto_125268 - BLOCK
      ?auto_125265 - BLOCK
      ?auto_125266 - BLOCK
      ?auto_125269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125264 ?auto_125271 ) ) ( ON-TABLE ?auto_125270 ) ( not ( = ?auto_125270 ?auto_125267 ) ) ( not ( = ?auto_125270 ?auto_125268 ) ) ( not ( = ?auto_125270 ?auto_125265 ) ) ( not ( = ?auto_125270 ?auto_125266 ) ) ( not ( = ?auto_125270 ?auto_125271 ) ) ( not ( = ?auto_125270 ?auto_125264 ) ) ( not ( = ?auto_125267 ?auto_125268 ) ) ( not ( = ?auto_125267 ?auto_125265 ) ) ( not ( = ?auto_125267 ?auto_125266 ) ) ( not ( = ?auto_125267 ?auto_125271 ) ) ( not ( = ?auto_125267 ?auto_125264 ) ) ( not ( = ?auto_125268 ?auto_125265 ) ) ( not ( = ?auto_125268 ?auto_125266 ) ) ( not ( = ?auto_125268 ?auto_125271 ) ) ( not ( = ?auto_125268 ?auto_125264 ) ) ( not ( = ?auto_125265 ?auto_125266 ) ) ( not ( = ?auto_125265 ?auto_125271 ) ) ( not ( = ?auto_125265 ?auto_125264 ) ) ( not ( = ?auto_125266 ?auto_125271 ) ) ( not ( = ?auto_125266 ?auto_125264 ) ) ( ON ?auto_125264 ?auto_125269 ) ( not ( = ?auto_125264 ?auto_125269 ) ) ( not ( = ?auto_125271 ?auto_125269 ) ) ( not ( = ?auto_125270 ?auto_125269 ) ) ( not ( = ?auto_125267 ?auto_125269 ) ) ( not ( = ?auto_125268 ?auto_125269 ) ) ( not ( = ?auto_125265 ?auto_125269 ) ) ( not ( = ?auto_125266 ?auto_125269 ) ) ( ON ?auto_125271 ?auto_125264 ) ( ON-TABLE ?auto_125269 ) ( ON ?auto_125266 ?auto_125271 ) ( ON ?auto_125265 ?auto_125266 ) ( ON ?auto_125268 ?auto_125265 ) ( CLEAR ?auto_125270 ) ( ON ?auto_125267 ?auto_125268 ) ( CLEAR ?auto_125267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125269 ?auto_125264 ?auto_125271 ?auto_125266 ?auto_125265 ?auto_125268 )
      ( MAKE-1PILE ?auto_125264 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125272 - BLOCK
    )
    :vars
    (
      ?auto_125273 - BLOCK
      ?auto_125274 - BLOCK
      ?auto_125277 - BLOCK
      ?auto_125278 - BLOCK
      ?auto_125279 - BLOCK
      ?auto_125275 - BLOCK
      ?auto_125276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125272 ?auto_125273 ) ) ( not ( = ?auto_125274 ?auto_125277 ) ) ( not ( = ?auto_125274 ?auto_125278 ) ) ( not ( = ?auto_125274 ?auto_125279 ) ) ( not ( = ?auto_125274 ?auto_125275 ) ) ( not ( = ?auto_125274 ?auto_125273 ) ) ( not ( = ?auto_125274 ?auto_125272 ) ) ( not ( = ?auto_125277 ?auto_125278 ) ) ( not ( = ?auto_125277 ?auto_125279 ) ) ( not ( = ?auto_125277 ?auto_125275 ) ) ( not ( = ?auto_125277 ?auto_125273 ) ) ( not ( = ?auto_125277 ?auto_125272 ) ) ( not ( = ?auto_125278 ?auto_125279 ) ) ( not ( = ?auto_125278 ?auto_125275 ) ) ( not ( = ?auto_125278 ?auto_125273 ) ) ( not ( = ?auto_125278 ?auto_125272 ) ) ( not ( = ?auto_125279 ?auto_125275 ) ) ( not ( = ?auto_125279 ?auto_125273 ) ) ( not ( = ?auto_125279 ?auto_125272 ) ) ( not ( = ?auto_125275 ?auto_125273 ) ) ( not ( = ?auto_125275 ?auto_125272 ) ) ( ON ?auto_125272 ?auto_125276 ) ( not ( = ?auto_125272 ?auto_125276 ) ) ( not ( = ?auto_125273 ?auto_125276 ) ) ( not ( = ?auto_125274 ?auto_125276 ) ) ( not ( = ?auto_125277 ?auto_125276 ) ) ( not ( = ?auto_125278 ?auto_125276 ) ) ( not ( = ?auto_125279 ?auto_125276 ) ) ( not ( = ?auto_125275 ?auto_125276 ) ) ( ON ?auto_125273 ?auto_125272 ) ( ON-TABLE ?auto_125276 ) ( ON ?auto_125275 ?auto_125273 ) ( ON ?auto_125279 ?auto_125275 ) ( ON ?auto_125278 ?auto_125279 ) ( ON ?auto_125277 ?auto_125278 ) ( CLEAR ?auto_125277 ) ( HOLDING ?auto_125274 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125274 )
      ( MAKE-1PILE ?auto_125272 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_125280 - BLOCK
    )
    :vars
    (
      ?auto_125283 - BLOCK
      ?auto_125282 - BLOCK
      ?auto_125281 - BLOCK
      ?auto_125284 - BLOCK
      ?auto_125285 - BLOCK
      ?auto_125287 - BLOCK
      ?auto_125286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125280 ?auto_125283 ) ) ( not ( = ?auto_125282 ?auto_125281 ) ) ( not ( = ?auto_125282 ?auto_125284 ) ) ( not ( = ?auto_125282 ?auto_125285 ) ) ( not ( = ?auto_125282 ?auto_125287 ) ) ( not ( = ?auto_125282 ?auto_125283 ) ) ( not ( = ?auto_125282 ?auto_125280 ) ) ( not ( = ?auto_125281 ?auto_125284 ) ) ( not ( = ?auto_125281 ?auto_125285 ) ) ( not ( = ?auto_125281 ?auto_125287 ) ) ( not ( = ?auto_125281 ?auto_125283 ) ) ( not ( = ?auto_125281 ?auto_125280 ) ) ( not ( = ?auto_125284 ?auto_125285 ) ) ( not ( = ?auto_125284 ?auto_125287 ) ) ( not ( = ?auto_125284 ?auto_125283 ) ) ( not ( = ?auto_125284 ?auto_125280 ) ) ( not ( = ?auto_125285 ?auto_125287 ) ) ( not ( = ?auto_125285 ?auto_125283 ) ) ( not ( = ?auto_125285 ?auto_125280 ) ) ( not ( = ?auto_125287 ?auto_125283 ) ) ( not ( = ?auto_125287 ?auto_125280 ) ) ( ON ?auto_125280 ?auto_125286 ) ( not ( = ?auto_125280 ?auto_125286 ) ) ( not ( = ?auto_125283 ?auto_125286 ) ) ( not ( = ?auto_125282 ?auto_125286 ) ) ( not ( = ?auto_125281 ?auto_125286 ) ) ( not ( = ?auto_125284 ?auto_125286 ) ) ( not ( = ?auto_125285 ?auto_125286 ) ) ( not ( = ?auto_125287 ?auto_125286 ) ) ( ON ?auto_125283 ?auto_125280 ) ( ON-TABLE ?auto_125286 ) ( ON ?auto_125287 ?auto_125283 ) ( ON ?auto_125285 ?auto_125287 ) ( ON ?auto_125284 ?auto_125285 ) ( ON ?auto_125281 ?auto_125284 ) ( ON ?auto_125282 ?auto_125281 ) ( CLEAR ?auto_125282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125286 ?auto_125280 ?auto_125283 ?auto_125287 ?auto_125285 ?auto_125284 ?auto_125281 )
      ( MAKE-1PILE ?auto_125280 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125293 - BLOCK
      ?auto_125294 - BLOCK
      ?auto_125295 - BLOCK
      ?auto_125296 - BLOCK
      ?auto_125297 - BLOCK
    )
    :vars
    (
      ?auto_125298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125298 ?auto_125297 ) ( CLEAR ?auto_125298 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125293 ) ( ON ?auto_125294 ?auto_125293 ) ( ON ?auto_125295 ?auto_125294 ) ( ON ?auto_125296 ?auto_125295 ) ( ON ?auto_125297 ?auto_125296 ) ( not ( = ?auto_125293 ?auto_125294 ) ) ( not ( = ?auto_125293 ?auto_125295 ) ) ( not ( = ?auto_125293 ?auto_125296 ) ) ( not ( = ?auto_125293 ?auto_125297 ) ) ( not ( = ?auto_125293 ?auto_125298 ) ) ( not ( = ?auto_125294 ?auto_125295 ) ) ( not ( = ?auto_125294 ?auto_125296 ) ) ( not ( = ?auto_125294 ?auto_125297 ) ) ( not ( = ?auto_125294 ?auto_125298 ) ) ( not ( = ?auto_125295 ?auto_125296 ) ) ( not ( = ?auto_125295 ?auto_125297 ) ) ( not ( = ?auto_125295 ?auto_125298 ) ) ( not ( = ?auto_125296 ?auto_125297 ) ) ( not ( = ?auto_125296 ?auto_125298 ) ) ( not ( = ?auto_125297 ?auto_125298 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125298 ?auto_125297 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125299 - BLOCK
      ?auto_125300 - BLOCK
      ?auto_125301 - BLOCK
      ?auto_125302 - BLOCK
      ?auto_125303 - BLOCK
    )
    :vars
    (
      ?auto_125304 - BLOCK
      ?auto_125305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125304 ?auto_125303 ) ( CLEAR ?auto_125304 ) ( ON-TABLE ?auto_125299 ) ( ON ?auto_125300 ?auto_125299 ) ( ON ?auto_125301 ?auto_125300 ) ( ON ?auto_125302 ?auto_125301 ) ( ON ?auto_125303 ?auto_125302 ) ( not ( = ?auto_125299 ?auto_125300 ) ) ( not ( = ?auto_125299 ?auto_125301 ) ) ( not ( = ?auto_125299 ?auto_125302 ) ) ( not ( = ?auto_125299 ?auto_125303 ) ) ( not ( = ?auto_125299 ?auto_125304 ) ) ( not ( = ?auto_125300 ?auto_125301 ) ) ( not ( = ?auto_125300 ?auto_125302 ) ) ( not ( = ?auto_125300 ?auto_125303 ) ) ( not ( = ?auto_125300 ?auto_125304 ) ) ( not ( = ?auto_125301 ?auto_125302 ) ) ( not ( = ?auto_125301 ?auto_125303 ) ) ( not ( = ?auto_125301 ?auto_125304 ) ) ( not ( = ?auto_125302 ?auto_125303 ) ) ( not ( = ?auto_125302 ?auto_125304 ) ) ( not ( = ?auto_125303 ?auto_125304 ) ) ( HOLDING ?auto_125305 ) ( not ( = ?auto_125299 ?auto_125305 ) ) ( not ( = ?auto_125300 ?auto_125305 ) ) ( not ( = ?auto_125301 ?auto_125305 ) ) ( not ( = ?auto_125302 ?auto_125305 ) ) ( not ( = ?auto_125303 ?auto_125305 ) ) ( not ( = ?auto_125304 ?auto_125305 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_125305 )
      ( MAKE-5PILE ?auto_125299 ?auto_125300 ?auto_125301 ?auto_125302 ?auto_125303 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125306 - BLOCK
      ?auto_125307 - BLOCK
      ?auto_125308 - BLOCK
      ?auto_125309 - BLOCK
      ?auto_125310 - BLOCK
    )
    :vars
    (
      ?auto_125312 - BLOCK
      ?auto_125311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125312 ?auto_125310 ) ( ON-TABLE ?auto_125306 ) ( ON ?auto_125307 ?auto_125306 ) ( ON ?auto_125308 ?auto_125307 ) ( ON ?auto_125309 ?auto_125308 ) ( ON ?auto_125310 ?auto_125309 ) ( not ( = ?auto_125306 ?auto_125307 ) ) ( not ( = ?auto_125306 ?auto_125308 ) ) ( not ( = ?auto_125306 ?auto_125309 ) ) ( not ( = ?auto_125306 ?auto_125310 ) ) ( not ( = ?auto_125306 ?auto_125312 ) ) ( not ( = ?auto_125307 ?auto_125308 ) ) ( not ( = ?auto_125307 ?auto_125309 ) ) ( not ( = ?auto_125307 ?auto_125310 ) ) ( not ( = ?auto_125307 ?auto_125312 ) ) ( not ( = ?auto_125308 ?auto_125309 ) ) ( not ( = ?auto_125308 ?auto_125310 ) ) ( not ( = ?auto_125308 ?auto_125312 ) ) ( not ( = ?auto_125309 ?auto_125310 ) ) ( not ( = ?auto_125309 ?auto_125312 ) ) ( not ( = ?auto_125310 ?auto_125312 ) ) ( not ( = ?auto_125306 ?auto_125311 ) ) ( not ( = ?auto_125307 ?auto_125311 ) ) ( not ( = ?auto_125308 ?auto_125311 ) ) ( not ( = ?auto_125309 ?auto_125311 ) ) ( not ( = ?auto_125310 ?auto_125311 ) ) ( not ( = ?auto_125312 ?auto_125311 ) ) ( ON ?auto_125311 ?auto_125312 ) ( CLEAR ?auto_125311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125306 ?auto_125307 ?auto_125308 ?auto_125309 ?auto_125310 ?auto_125312 )
      ( MAKE-5PILE ?auto_125306 ?auto_125307 ?auto_125308 ?auto_125309 ?auto_125310 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125313 - BLOCK
      ?auto_125314 - BLOCK
      ?auto_125315 - BLOCK
      ?auto_125316 - BLOCK
      ?auto_125317 - BLOCK
    )
    :vars
    (
      ?auto_125318 - BLOCK
      ?auto_125319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125318 ?auto_125317 ) ( ON-TABLE ?auto_125313 ) ( ON ?auto_125314 ?auto_125313 ) ( ON ?auto_125315 ?auto_125314 ) ( ON ?auto_125316 ?auto_125315 ) ( ON ?auto_125317 ?auto_125316 ) ( not ( = ?auto_125313 ?auto_125314 ) ) ( not ( = ?auto_125313 ?auto_125315 ) ) ( not ( = ?auto_125313 ?auto_125316 ) ) ( not ( = ?auto_125313 ?auto_125317 ) ) ( not ( = ?auto_125313 ?auto_125318 ) ) ( not ( = ?auto_125314 ?auto_125315 ) ) ( not ( = ?auto_125314 ?auto_125316 ) ) ( not ( = ?auto_125314 ?auto_125317 ) ) ( not ( = ?auto_125314 ?auto_125318 ) ) ( not ( = ?auto_125315 ?auto_125316 ) ) ( not ( = ?auto_125315 ?auto_125317 ) ) ( not ( = ?auto_125315 ?auto_125318 ) ) ( not ( = ?auto_125316 ?auto_125317 ) ) ( not ( = ?auto_125316 ?auto_125318 ) ) ( not ( = ?auto_125317 ?auto_125318 ) ) ( not ( = ?auto_125313 ?auto_125319 ) ) ( not ( = ?auto_125314 ?auto_125319 ) ) ( not ( = ?auto_125315 ?auto_125319 ) ) ( not ( = ?auto_125316 ?auto_125319 ) ) ( not ( = ?auto_125317 ?auto_125319 ) ) ( not ( = ?auto_125318 ?auto_125319 ) ) ( HOLDING ?auto_125319 ) ( CLEAR ?auto_125318 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125313 ?auto_125314 ?auto_125315 ?auto_125316 ?auto_125317 ?auto_125318 ?auto_125319 )
      ( MAKE-5PILE ?auto_125313 ?auto_125314 ?auto_125315 ?auto_125316 ?auto_125317 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125320 - BLOCK
      ?auto_125321 - BLOCK
      ?auto_125322 - BLOCK
      ?auto_125323 - BLOCK
      ?auto_125324 - BLOCK
    )
    :vars
    (
      ?auto_125326 - BLOCK
      ?auto_125325 - BLOCK
      ?auto_125327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125326 ?auto_125324 ) ( ON-TABLE ?auto_125320 ) ( ON ?auto_125321 ?auto_125320 ) ( ON ?auto_125322 ?auto_125321 ) ( ON ?auto_125323 ?auto_125322 ) ( ON ?auto_125324 ?auto_125323 ) ( not ( = ?auto_125320 ?auto_125321 ) ) ( not ( = ?auto_125320 ?auto_125322 ) ) ( not ( = ?auto_125320 ?auto_125323 ) ) ( not ( = ?auto_125320 ?auto_125324 ) ) ( not ( = ?auto_125320 ?auto_125326 ) ) ( not ( = ?auto_125321 ?auto_125322 ) ) ( not ( = ?auto_125321 ?auto_125323 ) ) ( not ( = ?auto_125321 ?auto_125324 ) ) ( not ( = ?auto_125321 ?auto_125326 ) ) ( not ( = ?auto_125322 ?auto_125323 ) ) ( not ( = ?auto_125322 ?auto_125324 ) ) ( not ( = ?auto_125322 ?auto_125326 ) ) ( not ( = ?auto_125323 ?auto_125324 ) ) ( not ( = ?auto_125323 ?auto_125326 ) ) ( not ( = ?auto_125324 ?auto_125326 ) ) ( not ( = ?auto_125320 ?auto_125325 ) ) ( not ( = ?auto_125321 ?auto_125325 ) ) ( not ( = ?auto_125322 ?auto_125325 ) ) ( not ( = ?auto_125323 ?auto_125325 ) ) ( not ( = ?auto_125324 ?auto_125325 ) ) ( not ( = ?auto_125326 ?auto_125325 ) ) ( CLEAR ?auto_125326 ) ( ON ?auto_125325 ?auto_125327 ) ( CLEAR ?auto_125325 ) ( HAND-EMPTY ) ( not ( = ?auto_125320 ?auto_125327 ) ) ( not ( = ?auto_125321 ?auto_125327 ) ) ( not ( = ?auto_125322 ?auto_125327 ) ) ( not ( = ?auto_125323 ?auto_125327 ) ) ( not ( = ?auto_125324 ?auto_125327 ) ) ( not ( = ?auto_125326 ?auto_125327 ) ) ( not ( = ?auto_125325 ?auto_125327 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125325 ?auto_125327 )
      ( MAKE-5PILE ?auto_125320 ?auto_125321 ?auto_125322 ?auto_125323 ?auto_125324 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125344 - BLOCK
      ?auto_125345 - BLOCK
      ?auto_125346 - BLOCK
      ?auto_125347 - BLOCK
      ?auto_125348 - BLOCK
    )
    :vars
    (
      ?auto_125349 - BLOCK
      ?auto_125350 - BLOCK
      ?auto_125351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125344 ) ( ON ?auto_125345 ?auto_125344 ) ( ON ?auto_125346 ?auto_125345 ) ( ON ?auto_125347 ?auto_125346 ) ( not ( = ?auto_125344 ?auto_125345 ) ) ( not ( = ?auto_125344 ?auto_125346 ) ) ( not ( = ?auto_125344 ?auto_125347 ) ) ( not ( = ?auto_125344 ?auto_125348 ) ) ( not ( = ?auto_125344 ?auto_125349 ) ) ( not ( = ?auto_125345 ?auto_125346 ) ) ( not ( = ?auto_125345 ?auto_125347 ) ) ( not ( = ?auto_125345 ?auto_125348 ) ) ( not ( = ?auto_125345 ?auto_125349 ) ) ( not ( = ?auto_125346 ?auto_125347 ) ) ( not ( = ?auto_125346 ?auto_125348 ) ) ( not ( = ?auto_125346 ?auto_125349 ) ) ( not ( = ?auto_125347 ?auto_125348 ) ) ( not ( = ?auto_125347 ?auto_125349 ) ) ( not ( = ?auto_125348 ?auto_125349 ) ) ( not ( = ?auto_125344 ?auto_125350 ) ) ( not ( = ?auto_125345 ?auto_125350 ) ) ( not ( = ?auto_125346 ?auto_125350 ) ) ( not ( = ?auto_125347 ?auto_125350 ) ) ( not ( = ?auto_125348 ?auto_125350 ) ) ( not ( = ?auto_125349 ?auto_125350 ) ) ( ON ?auto_125350 ?auto_125351 ) ( not ( = ?auto_125344 ?auto_125351 ) ) ( not ( = ?auto_125345 ?auto_125351 ) ) ( not ( = ?auto_125346 ?auto_125351 ) ) ( not ( = ?auto_125347 ?auto_125351 ) ) ( not ( = ?auto_125348 ?auto_125351 ) ) ( not ( = ?auto_125349 ?auto_125351 ) ) ( not ( = ?auto_125350 ?auto_125351 ) ) ( ON ?auto_125349 ?auto_125350 ) ( CLEAR ?auto_125349 ) ( HOLDING ?auto_125348 ) ( CLEAR ?auto_125347 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125344 ?auto_125345 ?auto_125346 ?auto_125347 ?auto_125348 ?auto_125349 )
      ( MAKE-5PILE ?auto_125344 ?auto_125345 ?auto_125346 ?auto_125347 ?auto_125348 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125352 - BLOCK
      ?auto_125353 - BLOCK
      ?auto_125354 - BLOCK
      ?auto_125355 - BLOCK
      ?auto_125356 - BLOCK
    )
    :vars
    (
      ?auto_125357 - BLOCK
      ?auto_125358 - BLOCK
      ?auto_125359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125352 ) ( ON ?auto_125353 ?auto_125352 ) ( ON ?auto_125354 ?auto_125353 ) ( ON ?auto_125355 ?auto_125354 ) ( not ( = ?auto_125352 ?auto_125353 ) ) ( not ( = ?auto_125352 ?auto_125354 ) ) ( not ( = ?auto_125352 ?auto_125355 ) ) ( not ( = ?auto_125352 ?auto_125356 ) ) ( not ( = ?auto_125352 ?auto_125357 ) ) ( not ( = ?auto_125353 ?auto_125354 ) ) ( not ( = ?auto_125353 ?auto_125355 ) ) ( not ( = ?auto_125353 ?auto_125356 ) ) ( not ( = ?auto_125353 ?auto_125357 ) ) ( not ( = ?auto_125354 ?auto_125355 ) ) ( not ( = ?auto_125354 ?auto_125356 ) ) ( not ( = ?auto_125354 ?auto_125357 ) ) ( not ( = ?auto_125355 ?auto_125356 ) ) ( not ( = ?auto_125355 ?auto_125357 ) ) ( not ( = ?auto_125356 ?auto_125357 ) ) ( not ( = ?auto_125352 ?auto_125358 ) ) ( not ( = ?auto_125353 ?auto_125358 ) ) ( not ( = ?auto_125354 ?auto_125358 ) ) ( not ( = ?auto_125355 ?auto_125358 ) ) ( not ( = ?auto_125356 ?auto_125358 ) ) ( not ( = ?auto_125357 ?auto_125358 ) ) ( ON ?auto_125358 ?auto_125359 ) ( not ( = ?auto_125352 ?auto_125359 ) ) ( not ( = ?auto_125353 ?auto_125359 ) ) ( not ( = ?auto_125354 ?auto_125359 ) ) ( not ( = ?auto_125355 ?auto_125359 ) ) ( not ( = ?auto_125356 ?auto_125359 ) ) ( not ( = ?auto_125357 ?auto_125359 ) ) ( not ( = ?auto_125358 ?auto_125359 ) ) ( ON ?auto_125357 ?auto_125358 ) ( CLEAR ?auto_125355 ) ( ON ?auto_125356 ?auto_125357 ) ( CLEAR ?auto_125356 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125359 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125359 ?auto_125358 ?auto_125357 )
      ( MAKE-5PILE ?auto_125352 ?auto_125353 ?auto_125354 ?auto_125355 ?auto_125356 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125360 - BLOCK
      ?auto_125361 - BLOCK
      ?auto_125362 - BLOCK
      ?auto_125363 - BLOCK
      ?auto_125364 - BLOCK
    )
    :vars
    (
      ?auto_125365 - BLOCK
      ?auto_125367 - BLOCK
      ?auto_125366 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125360 ) ( ON ?auto_125361 ?auto_125360 ) ( ON ?auto_125362 ?auto_125361 ) ( not ( = ?auto_125360 ?auto_125361 ) ) ( not ( = ?auto_125360 ?auto_125362 ) ) ( not ( = ?auto_125360 ?auto_125363 ) ) ( not ( = ?auto_125360 ?auto_125364 ) ) ( not ( = ?auto_125360 ?auto_125365 ) ) ( not ( = ?auto_125361 ?auto_125362 ) ) ( not ( = ?auto_125361 ?auto_125363 ) ) ( not ( = ?auto_125361 ?auto_125364 ) ) ( not ( = ?auto_125361 ?auto_125365 ) ) ( not ( = ?auto_125362 ?auto_125363 ) ) ( not ( = ?auto_125362 ?auto_125364 ) ) ( not ( = ?auto_125362 ?auto_125365 ) ) ( not ( = ?auto_125363 ?auto_125364 ) ) ( not ( = ?auto_125363 ?auto_125365 ) ) ( not ( = ?auto_125364 ?auto_125365 ) ) ( not ( = ?auto_125360 ?auto_125367 ) ) ( not ( = ?auto_125361 ?auto_125367 ) ) ( not ( = ?auto_125362 ?auto_125367 ) ) ( not ( = ?auto_125363 ?auto_125367 ) ) ( not ( = ?auto_125364 ?auto_125367 ) ) ( not ( = ?auto_125365 ?auto_125367 ) ) ( ON ?auto_125367 ?auto_125366 ) ( not ( = ?auto_125360 ?auto_125366 ) ) ( not ( = ?auto_125361 ?auto_125366 ) ) ( not ( = ?auto_125362 ?auto_125366 ) ) ( not ( = ?auto_125363 ?auto_125366 ) ) ( not ( = ?auto_125364 ?auto_125366 ) ) ( not ( = ?auto_125365 ?auto_125366 ) ) ( not ( = ?auto_125367 ?auto_125366 ) ) ( ON ?auto_125365 ?auto_125367 ) ( ON ?auto_125364 ?auto_125365 ) ( CLEAR ?auto_125364 ) ( ON-TABLE ?auto_125366 ) ( HOLDING ?auto_125363 ) ( CLEAR ?auto_125362 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125360 ?auto_125361 ?auto_125362 ?auto_125363 )
      ( MAKE-5PILE ?auto_125360 ?auto_125361 ?auto_125362 ?auto_125363 ?auto_125364 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125368 - BLOCK
      ?auto_125369 - BLOCK
      ?auto_125370 - BLOCK
      ?auto_125371 - BLOCK
      ?auto_125372 - BLOCK
    )
    :vars
    (
      ?auto_125373 - BLOCK
      ?auto_125375 - BLOCK
      ?auto_125374 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125368 ) ( ON ?auto_125369 ?auto_125368 ) ( ON ?auto_125370 ?auto_125369 ) ( not ( = ?auto_125368 ?auto_125369 ) ) ( not ( = ?auto_125368 ?auto_125370 ) ) ( not ( = ?auto_125368 ?auto_125371 ) ) ( not ( = ?auto_125368 ?auto_125372 ) ) ( not ( = ?auto_125368 ?auto_125373 ) ) ( not ( = ?auto_125369 ?auto_125370 ) ) ( not ( = ?auto_125369 ?auto_125371 ) ) ( not ( = ?auto_125369 ?auto_125372 ) ) ( not ( = ?auto_125369 ?auto_125373 ) ) ( not ( = ?auto_125370 ?auto_125371 ) ) ( not ( = ?auto_125370 ?auto_125372 ) ) ( not ( = ?auto_125370 ?auto_125373 ) ) ( not ( = ?auto_125371 ?auto_125372 ) ) ( not ( = ?auto_125371 ?auto_125373 ) ) ( not ( = ?auto_125372 ?auto_125373 ) ) ( not ( = ?auto_125368 ?auto_125375 ) ) ( not ( = ?auto_125369 ?auto_125375 ) ) ( not ( = ?auto_125370 ?auto_125375 ) ) ( not ( = ?auto_125371 ?auto_125375 ) ) ( not ( = ?auto_125372 ?auto_125375 ) ) ( not ( = ?auto_125373 ?auto_125375 ) ) ( ON ?auto_125375 ?auto_125374 ) ( not ( = ?auto_125368 ?auto_125374 ) ) ( not ( = ?auto_125369 ?auto_125374 ) ) ( not ( = ?auto_125370 ?auto_125374 ) ) ( not ( = ?auto_125371 ?auto_125374 ) ) ( not ( = ?auto_125372 ?auto_125374 ) ) ( not ( = ?auto_125373 ?auto_125374 ) ) ( not ( = ?auto_125375 ?auto_125374 ) ) ( ON ?auto_125373 ?auto_125375 ) ( ON ?auto_125372 ?auto_125373 ) ( ON-TABLE ?auto_125374 ) ( CLEAR ?auto_125370 ) ( ON ?auto_125371 ?auto_125372 ) ( CLEAR ?auto_125371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125374 ?auto_125375 ?auto_125373 ?auto_125372 )
      ( MAKE-5PILE ?auto_125368 ?auto_125369 ?auto_125370 ?auto_125371 ?auto_125372 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125376 - BLOCK
      ?auto_125377 - BLOCK
      ?auto_125378 - BLOCK
      ?auto_125379 - BLOCK
      ?auto_125380 - BLOCK
    )
    :vars
    (
      ?auto_125382 - BLOCK
      ?auto_125383 - BLOCK
      ?auto_125381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125376 ) ( ON ?auto_125377 ?auto_125376 ) ( not ( = ?auto_125376 ?auto_125377 ) ) ( not ( = ?auto_125376 ?auto_125378 ) ) ( not ( = ?auto_125376 ?auto_125379 ) ) ( not ( = ?auto_125376 ?auto_125380 ) ) ( not ( = ?auto_125376 ?auto_125382 ) ) ( not ( = ?auto_125377 ?auto_125378 ) ) ( not ( = ?auto_125377 ?auto_125379 ) ) ( not ( = ?auto_125377 ?auto_125380 ) ) ( not ( = ?auto_125377 ?auto_125382 ) ) ( not ( = ?auto_125378 ?auto_125379 ) ) ( not ( = ?auto_125378 ?auto_125380 ) ) ( not ( = ?auto_125378 ?auto_125382 ) ) ( not ( = ?auto_125379 ?auto_125380 ) ) ( not ( = ?auto_125379 ?auto_125382 ) ) ( not ( = ?auto_125380 ?auto_125382 ) ) ( not ( = ?auto_125376 ?auto_125383 ) ) ( not ( = ?auto_125377 ?auto_125383 ) ) ( not ( = ?auto_125378 ?auto_125383 ) ) ( not ( = ?auto_125379 ?auto_125383 ) ) ( not ( = ?auto_125380 ?auto_125383 ) ) ( not ( = ?auto_125382 ?auto_125383 ) ) ( ON ?auto_125383 ?auto_125381 ) ( not ( = ?auto_125376 ?auto_125381 ) ) ( not ( = ?auto_125377 ?auto_125381 ) ) ( not ( = ?auto_125378 ?auto_125381 ) ) ( not ( = ?auto_125379 ?auto_125381 ) ) ( not ( = ?auto_125380 ?auto_125381 ) ) ( not ( = ?auto_125382 ?auto_125381 ) ) ( not ( = ?auto_125383 ?auto_125381 ) ) ( ON ?auto_125382 ?auto_125383 ) ( ON ?auto_125380 ?auto_125382 ) ( ON-TABLE ?auto_125381 ) ( ON ?auto_125379 ?auto_125380 ) ( CLEAR ?auto_125379 ) ( HOLDING ?auto_125378 ) ( CLEAR ?auto_125377 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125376 ?auto_125377 ?auto_125378 )
      ( MAKE-5PILE ?auto_125376 ?auto_125377 ?auto_125378 ?auto_125379 ?auto_125380 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125384 - BLOCK
      ?auto_125385 - BLOCK
      ?auto_125386 - BLOCK
      ?auto_125387 - BLOCK
      ?auto_125388 - BLOCK
    )
    :vars
    (
      ?auto_125390 - BLOCK
      ?auto_125389 - BLOCK
      ?auto_125391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125384 ) ( ON ?auto_125385 ?auto_125384 ) ( not ( = ?auto_125384 ?auto_125385 ) ) ( not ( = ?auto_125384 ?auto_125386 ) ) ( not ( = ?auto_125384 ?auto_125387 ) ) ( not ( = ?auto_125384 ?auto_125388 ) ) ( not ( = ?auto_125384 ?auto_125390 ) ) ( not ( = ?auto_125385 ?auto_125386 ) ) ( not ( = ?auto_125385 ?auto_125387 ) ) ( not ( = ?auto_125385 ?auto_125388 ) ) ( not ( = ?auto_125385 ?auto_125390 ) ) ( not ( = ?auto_125386 ?auto_125387 ) ) ( not ( = ?auto_125386 ?auto_125388 ) ) ( not ( = ?auto_125386 ?auto_125390 ) ) ( not ( = ?auto_125387 ?auto_125388 ) ) ( not ( = ?auto_125387 ?auto_125390 ) ) ( not ( = ?auto_125388 ?auto_125390 ) ) ( not ( = ?auto_125384 ?auto_125389 ) ) ( not ( = ?auto_125385 ?auto_125389 ) ) ( not ( = ?auto_125386 ?auto_125389 ) ) ( not ( = ?auto_125387 ?auto_125389 ) ) ( not ( = ?auto_125388 ?auto_125389 ) ) ( not ( = ?auto_125390 ?auto_125389 ) ) ( ON ?auto_125389 ?auto_125391 ) ( not ( = ?auto_125384 ?auto_125391 ) ) ( not ( = ?auto_125385 ?auto_125391 ) ) ( not ( = ?auto_125386 ?auto_125391 ) ) ( not ( = ?auto_125387 ?auto_125391 ) ) ( not ( = ?auto_125388 ?auto_125391 ) ) ( not ( = ?auto_125390 ?auto_125391 ) ) ( not ( = ?auto_125389 ?auto_125391 ) ) ( ON ?auto_125390 ?auto_125389 ) ( ON ?auto_125388 ?auto_125390 ) ( ON-TABLE ?auto_125391 ) ( ON ?auto_125387 ?auto_125388 ) ( CLEAR ?auto_125385 ) ( ON ?auto_125386 ?auto_125387 ) ( CLEAR ?auto_125386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125391 ?auto_125389 ?auto_125390 ?auto_125388 ?auto_125387 )
      ( MAKE-5PILE ?auto_125384 ?auto_125385 ?auto_125386 ?auto_125387 ?auto_125388 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125392 - BLOCK
      ?auto_125393 - BLOCK
      ?auto_125394 - BLOCK
      ?auto_125395 - BLOCK
      ?auto_125396 - BLOCK
    )
    :vars
    (
      ?auto_125399 - BLOCK
      ?auto_125398 - BLOCK
      ?auto_125397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125392 ) ( not ( = ?auto_125392 ?auto_125393 ) ) ( not ( = ?auto_125392 ?auto_125394 ) ) ( not ( = ?auto_125392 ?auto_125395 ) ) ( not ( = ?auto_125392 ?auto_125396 ) ) ( not ( = ?auto_125392 ?auto_125399 ) ) ( not ( = ?auto_125393 ?auto_125394 ) ) ( not ( = ?auto_125393 ?auto_125395 ) ) ( not ( = ?auto_125393 ?auto_125396 ) ) ( not ( = ?auto_125393 ?auto_125399 ) ) ( not ( = ?auto_125394 ?auto_125395 ) ) ( not ( = ?auto_125394 ?auto_125396 ) ) ( not ( = ?auto_125394 ?auto_125399 ) ) ( not ( = ?auto_125395 ?auto_125396 ) ) ( not ( = ?auto_125395 ?auto_125399 ) ) ( not ( = ?auto_125396 ?auto_125399 ) ) ( not ( = ?auto_125392 ?auto_125398 ) ) ( not ( = ?auto_125393 ?auto_125398 ) ) ( not ( = ?auto_125394 ?auto_125398 ) ) ( not ( = ?auto_125395 ?auto_125398 ) ) ( not ( = ?auto_125396 ?auto_125398 ) ) ( not ( = ?auto_125399 ?auto_125398 ) ) ( ON ?auto_125398 ?auto_125397 ) ( not ( = ?auto_125392 ?auto_125397 ) ) ( not ( = ?auto_125393 ?auto_125397 ) ) ( not ( = ?auto_125394 ?auto_125397 ) ) ( not ( = ?auto_125395 ?auto_125397 ) ) ( not ( = ?auto_125396 ?auto_125397 ) ) ( not ( = ?auto_125399 ?auto_125397 ) ) ( not ( = ?auto_125398 ?auto_125397 ) ) ( ON ?auto_125399 ?auto_125398 ) ( ON ?auto_125396 ?auto_125399 ) ( ON-TABLE ?auto_125397 ) ( ON ?auto_125395 ?auto_125396 ) ( ON ?auto_125394 ?auto_125395 ) ( CLEAR ?auto_125394 ) ( HOLDING ?auto_125393 ) ( CLEAR ?auto_125392 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125392 ?auto_125393 )
      ( MAKE-5PILE ?auto_125392 ?auto_125393 ?auto_125394 ?auto_125395 ?auto_125396 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125400 - BLOCK
      ?auto_125401 - BLOCK
      ?auto_125402 - BLOCK
      ?auto_125403 - BLOCK
      ?auto_125404 - BLOCK
    )
    :vars
    (
      ?auto_125406 - BLOCK
      ?auto_125407 - BLOCK
      ?auto_125405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125400 ) ( not ( = ?auto_125400 ?auto_125401 ) ) ( not ( = ?auto_125400 ?auto_125402 ) ) ( not ( = ?auto_125400 ?auto_125403 ) ) ( not ( = ?auto_125400 ?auto_125404 ) ) ( not ( = ?auto_125400 ?auto_125406 ) ) ( not ( = ?auto_125401 ?auto_125402 ) ) ( not ( = ?auto_125401 ?auto_125403 ) ) ( not ( = ?auto_125401 ?auto_125404 ) ) ( not ( = ?auto_125401 ?auto_125406 ) ) ( not ( = ?auto_125402 ?auto_125403 ) ) ( not ( = ?auto_125402 ?auto_125404 ) ) ( not ( = ?auto_125402 ?auto_125406 ) ) ( not ( = ?auto_125403 ?auto_125404 ) ) ( not ( = ?auto_125403 ?auto_125406 ) ) ( not ( = ?auto_125404 ?auto_125406 ) ) ( not ( = ?auto_125400 ?auto_125407 ) ) ( not ( = ?auto_125401 ?auto_125407 ) ) ( not ( = ?auto_125402 ?auto_125407 ) ) ( not ( = ?auto_125403 ?auto_125407 ) ) ( not ( = ?auto_125404 ?auto_125407 ) ) ( not ( = ?auto_125406 ?auto_125407 ) ) ( ON ?auto_125407 ?auto_125405 ) ( not ( = ?auto_125400 ?auto_125405 ) ) ( not ( = ?auto_125401 ?auto_125405 ) ) ( not ( = ?auto_125402 ?auto_125405 ) ) ( not ( = ?auto_125403 ?auto_125405 ) ) ( not ( = ?auto_125404 ?auto_125405 ) ) ( not ( = ?auto_125406 ?auto_125405 ) ) ( not ( = ?auto_125407 ?auto_125405 ) ) ( ON ?auto_125406 ?auto_125407 ) ( ON ?auto_125404 ?auto_125406 ) ( ON-TABLE ?auto_125405 ) ( ON ?auto_125403 ?auto_125404 ) ( ON ?auto_125402 ?auto_125403 ) ( CLEAR ?auto_125400 ) ( ON ?auto_125401 ?auto_125402 ) ( CLEAR ?auto_125401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125405 ?auto_125407 ?auto_125406 ?auto_125404 ?auto_125403 ?auto_125402 )
      ( MAKE-5PILE ?auto_125400 ?auto_125401 ?auto_125402 ?auto_125403 ?auto_125404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125408 - BLOCK
      ?auto_125409 - BLOCK
      ?auto_125410 - BLOCK
      ?auto_125411 - BLOCK
      ?auto_125412 - BLOCK
    )
    :vars
    (
      ?auto_125413 - BLOCK
      ?auto_125414 - BLOCK
      ?auto_125415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125408 ?auto_125409 ) ) ( not ( = ?auto_125408 ?auto_125410 ) ) ( not ( = ?auto_125408 ?auto_125411 ) ) ( not ( = ?auto_125408 ?auto_125412 ) ) ( not ( = ?auto_125408 ?auto_125413 ) ) ( not ( = ?auto_125409 ?auto_125410 ) ) ( not ( = ?auto_125409 ?auto_125411 ) ) ( not ( = ?auto_125409 ?auto_125412 ) ) ( not ( = ?auto_125409 ?auto_125413 ) ) ( not ( = ?auto_125410 ?auto_125411 ) ) ( not ( = ?auto_125410 ?auto_125412 ) ) ( not ( = ?auto_125410 ?auto_125413 ) ) ( not ( = ?auto_125411 ?auto_125412 ) ) ( not ( = ?auto_125411 ?auto_125413 ) ) ( not ( = ?auto_125412 ?auto_125413 ) ) ( not ( = ?auto_125408 ?auto_125414 ) ) ( not ( = ?auto_125409 ?auto_125414 ) ) ( not ( = ?auto_125410 ?auto_125414 ) ) ( not ( = ?auto_125411 ?auto_125414 ) ) ( not ( = ?auto_125412 ?auto_125414 ) ) ( not ( = ?auto_125413 ?auto_125414 ) ) ( ON ?auto_125414 ?auto_125415 ) ( not ( = ?auto_125408 ?auto_125415 ) ) ( not ( = ?auto_125409 ?auto_125415 ) ) ( not ( = ?auto_125410 ?auto_125415 ) ) ( not ( = ?auto_125411 ?auto_125415 ) ) ( not ( = ?auto_125412 ?auto_125415 ) ) ( not ( = ?auto_125413 ?auto_125415 ) ) ( not ( = ?auto_125414 ?auto_125415 ) ) ( ON ?auto_125413 ?auto_125414 ) ( ON ?auto_125412 ?auto_125413 ) ( ON-TABLE ?auto_125415 ) ( ON ?auto_125411 ?auto_125412 ) ( ON ?auto_125410 ?auto_125411 ) ( ON ?auto_125409 ?auto_125410 ) ( CLEAR ?auto_125409 ) ( HOLDING ?auto_125408 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125408 )
      ( MAKE-5PILE ?auto_125408 ?auto_125409 ?auto_125410 ?auto_125411 ?auto_125412 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_125416 - BLOCK
      ?auto_125417 - BLOCK
      ?auto_125418 - BLOCK
      ?auto_125419 - BLOCK
      ?auto_125420 - BLOCK
    )
    :vars
    (
      ?auto_125423 - BLOCK
      ?auto_125421 - BLOCK
      ?auto_125422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125416 ?auto_125417 ) ) ( not ( = ?auto_125416 ?auto_125418 ) ) ( not ( = ?auto_125416 ?auto_125419 ) ) ( not ( = ?auto_125416 ?auto_125420 ) ) ( not ( = ?auto_125416 ?auto_125423 ) ) ( not ( = ?auto_125417 ?auto_125418 ) ) ( not ( = ?auto_125417 ?auto_125419 ) ) ( not ( = ?auto_125417 ?auto_125420 ) ) ( not ( = ?auto_125417 ?auto_125423 ) ) ( not ( = ?auto_125418 ?auto_125419 ) ) ( not ( = ?auto_125418 ?auto_125420 ) ) ( not ( = ?auto_125418 ?auto_125423 ) ) ( not ( = ?auto_125419 ?auto_125420 ) ) ( not ( = ?auto_125419 ?auto_125423 ) ) ( not ( = ?auto_125420 ?auto_125423 ) ) ( not ( = ?auto_125416 ?auto_125421 ) ) ( not ( = ?auto_125417 ?auto_125421 ) ) ( not ( = ?auto_125418 ?auto_125421 ) ) ( not ( = ?auto_125419 ?auto_125421 ) ) ( not ( = ?auto_125420 ?auto_125421 ) ) ( not ( = ?auto_125423 ?auto_125421 ) ) ( ON ?auto_125421 ?auto_125422 ) ( not ( = ?auto_125416 ?auto_125422 ) ) ( not ( = ?auto_125417 ?auto_125422 ) ) ( not ( = ?auto_125418 ?auto_125422 ) ) ( not ( = ?auto_125419 ?auto_125422 ) ) ( not ( = ?auto_125420 ?auto_125422 ) ) ( not ( = ?auto_125423 ?auto_125422 ) ) ( not ( = ?auto_125421 ?auto_125422 ) ) ( ON ?auto_125423 ?auto_125421 ) ( ON ?auto_125420 ?auto_125423 ) ( ON-TABLE ?auto_125422 ) ( ON ?auto_125419 ?auto_125420 ) ( ON ?auto_125418 ?auto_125419 ) ( ON ?auto_125417 ?auto_125418 ) ( ON ?auto_125416 ?auto_125417 ) ( CLEAR ?auto_125416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125422 ?auto_125421 ?auto_125423 ?auto_125420 ?auto_125419 ?auto_125418 ?auto_125417 )
      ( MAKE-5PILE ?auto_125416 ?auto_125417 ?auto_125418 ?auto_125419 ?auto_125420 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125426 - BLOCK
      ?auto_125427 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_125427 ) ( CLEAR ?auto_125426 ) ( ON-TABLE ?auto_125426 ) ( not ( = ?auto_125426 ?auto_125427 ) ) )
    :subtasks
    ( ( !STACK ?auto_125427 ?auto_125426 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125428 - BLOCK
      ?auto_125429 - BLOCK
    )
    :vars
    (
      ?auto_125430 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_125428 ) ( ON-TABLE ?auto_125428 ) ( not ( = ?auto_125428 ?auto_125429 ) ) ( ON ?auto_125429 ?auto_125430 ) ( CLEAR ?auto_125429 ) ( HAND-EMPTY ) ( not ( = ?auto_125428 ?auto_125430 ) ) ( not ( = ?auto_125429 ?auto_125430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125429 ?auto_125430 )
      ( MAKE-2PILE ?auto_125428 ?auto_125429 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125431 - BLOCK
      ?auto_125432 - BLOCK
    )
    :vars
    (
      ?auto_125433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125431 ?auto_125432 ) ) ( ON ?auto_125432 ?auto_125433 ) ( CLEAR ?auto_125432 ) ( not ( = ?auto_125431 ?auto_125433 ) ) ( not ( = ?auto_125432 ?auto_125433 ) ) ( HOLDING ?auto_125431 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125431 )
      ( MAKE-2PILE ?auto_125431 ?auto_125432 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125434 - BLOCK
      ?auto_125435 - BLOCK
    )
    :vars
    (
      ?auto_125436 - BLOCK
      ?auto_125439 - BLOCK
      ?auto_125440 - BLOCK
      ?auto_125438 - BLOCK
      ?auto_125437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125434 ?auto_125435 ) ) ( ON ?auto_125435 ?auto_125436 ) ( not ( = ?auto_125434 ?auto_125436 ) ) ( not ( = ?auto_125435 ?auto_125436 ) ) ( ON ?auto_125434 ?auto_125435 ) ( CLEAR ?auto_125434 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125439 ) ( ON ?auto_125440 ?auto_125439 ) ( ON ?auto_125438 ?auto_125440 ) ( ON ?auto_125437 ?auto_125438 ) ( ON ?auto_125436 ?auto_125437 ) ( not ( = ?auto_125439 ?auto_125440 ) ) ( not ( = ?auto_125439 ?auto_125438 ) ) ( not ( = ?auto_125439 ?auto_125437 ) ) ( not ( = ?auto_125439 ?auto_125436 ) ) ( not ( = ?auto_125439 ?auto_125435 ) ) ( not ( = ?auto_125439 ?auto_125434 ) ) ( not ( = ?auto_125440 ?auto_125438 ) ) ( not ( = ?auto_125440 ?auto_125437 ) ) ( not ( = ?auto_125440 ?auto_125436 ) ) ( not ( = ?auto_125440 ?auto_125435 ) ) ( not ( = ?auto_125440 ?auto_125434 ) ) ( not ( = ?auto_125438 ?auto_125437 ) ) ( not ( = ?auto_125438 ?auto_125436 ) ) ( not ( = ?auto_125438 ?auto_125435 ) ) ( not ( = ?auto_125438 ?auto_125434 ) ) ( not ( = ?auto_125437 ?auto_125436 ) ) ( not ( = ?auto_125437 ?auto_125435 ) ) ( not ( = ?auto_125437 ?auto_125434 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125439 ?auto_125440 ?auto_125438 ?auto_125437 ?auto_125436 ?auto_125435 )
      ( MAKE-2PILE ?auto_125434 ?auto_125435 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125441 - BLOCK
      ?auto_125442 - BLOCK
    )
    :vars
    (
      ?auto_125446 - BLOCK
      ?auto_125447 - BLOCK
      ?auto_125444 - BLOCK
      ?auto_125443 - BLOCK
      ?auto_125445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125441 ?auto_125442 ) ) ( ON ?auto_125442 ?auto_125446 ) ( not ( = ?auto_125441 ?auto_125446 ) ) ( not ( = ?auto_125442 ?auto_125446 ) ) ( ON-TABLE ?auto_125447 ) ( ON ?auto_125444 ?auto_125447 ) ( ON ?auto_125443 ?auto_125444 ) ( ON ?auto_125445 ?auto_125443 ) ( ON ?auto_125446 ?auto_125445 ) ( not ( = ?auto_125447 ?auto_125444 ) ) ( not ( = ?auto_125447 ?auto_125443 ) ) ( not ( = ?auto_125447 ?auto_125445 ) ) ( not ( = ?auto_125447 ?auto_125446 ) ) ( not ( = ?auto_125447 ?auto_125442 ) ) ( not ( = ?auto_125447 ?auto_125441 ) ) ( not ( = ?auto_125444 ?auto_125443 ) ) ( not ( = ?auto_125444 ?auto_125445 ) ) ( not ( = ?auto_125444 ?auto_125446 ) ) ( not ( = ?auto_125444 ?auto_125442 ) ) ( not ( = ?auto_125444 ?auto_125441 ) ) ( not ( = ?auto_125443 ?auto_125445 ) ) ( not ( = ?auto_125443 ?auto_125446 ) ) ( not ( = ?auto_125443 ?auto_125442 ) ) ( not ( = ?auto_125443 ?auto_125441 ) ) ( not ( = ?auto_125445 ?auto_125446 ) ) ( not ( = ?auto_125445 ?auto_125442 ) ) ( not ( = ?auto_125445 ?auto_125441 ) ) ( HOLDING ?auto_125441 ) ( CLEAR ?auto_125442 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125447 ?auto_125444 ?auto_125443 ?auto_125445 ?auto_125446 ?auto_125442 ?auto_125441 )
      ( MAKE-2PILE ?auto_125441 ?auto_125442 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125448 - BLOCK
      ?auto_125449 - BLOCK
    )
    :vars
    (
      ?auto_125451 - BLOCK
      ?auto_125453 - BLOCK
      ?auto_125452 - BLOCK
      ?auto_125454 - BLOCK
      ?auto_125450 - BLOCK
      ?auto_125455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125448 ?auto_125449 ) ) ( ON ?auto_125449 ?auto_125451 ) ( not ( = ?auto_125448 ?auto_125451 ) ) ( not ( = ?auto_125449 ?auto_125451 ) ) ( ON-TABLE ?auto_125453 ) ( ON ?auto_125452 ?auto_125453 ) ( ON ?auto_125454 ?auto_125452 ) ( ON ?auto_125450 ?auto_125454 ) ( ON ?auto_125451 ?auto_125450 ) ( not ( = ?auto_125453 ?auto_125452 ) ) ( not ( = ?auto_125453 ?auto_125454 ) ) ( not ( = ?auto_125453 ?auto_125450 ) ) ( not ( = ?auto_125453 ?auto_125451 ) ) ( not ( = ?auto_125453 ?auto_125449 ) ) ( not ( = ?auto_125453 ?auto_125448 ) ) ( not ( = ?auto_125452 ?auto_125454 ) ) ( not ( = ?auto_125452 ?auto_125450 ) ) ( not ( = ?auto_125452 ?auto_125451 ) ) ( not ( = ?auto_125452 ?auto_125449 ) ) ( not ( = ?auto_125452 ?auto_125448 ) ) ( not ( = ?auto_125454 ?auto_125450 ) ) ( not ( = ?auto_125454 ?auto_125451 ) ) ( not ( = ?auto_125454 ?auto_125449 ) ) ( not ( = ?auto_125454 ?auto_125448 ) ) ( not ( = ?auto_125450 ?auto_125451 ) ) ( not ( = ?auto_125450 ?auto_125449 ) ) ( not ( = ?auto_125450 ?auto_125448 ) ) ( CLEAR ?auto_125449 ) ( ON ?auto_125448 ?auto_125455 ) ( CLEAR ?auto_125448 ) ( HAND-EMPTY ) ( not ( = ?auto_125448 ?auto_125455 ) ) ( not ( = ?auto_125449 ?auto_125455 ) ) ( not ( = ?auto_125451 ?auto_125455 ) ) ( not ( = ?auto_125453 ?auto_125455 ) ) ( not ( = ?auto_125452 ?auto_125455 ) ) ( not ( = ?auto_125454 ?auto_125455 ) ) ( not ( = ?auto_125450 ?auto_125455 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125448 ?auto_125455 )
      ( MAKE-2PILE ?auto_125448 ?auto_125449 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125456 - BLOCK
      ?auto_125457 - BLOCK
    )
    :vars
    (
      ?auto_125459 - BLOCK
      ?auto_125460 - BLOCK
      ?auto_125462 - BLOCK
      ?auto_125463 - BLOCK
      ?auto_125458 - BLOCK
      ?auto_125461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125456 ?auto_125457 ) ) ( not ( = ?auto_125456 ?auto_125459 ) ) ( not ( = ?auto_125457 ?auto_125459 ) ) ( ON-TABLE ?auto_125460 ) ( ON ?auto_125462 ?auto_125460 ) ( ON ?auto_125463 ?auto_125462 ) ( ON ?auto_125458 ?auto_125463 ) ( ON ?auto_125459 ?auto_125458 ) ( not ( = ?auto_125460 ?auto_125462 ) ) ( not ( = ?auto_125460 ?auto_125463 ) ) ( not ( = ?auto_125460 ?auto_125458 ) ) ( not ( = ?auto_125460 ?auto_125459 ) ) ( not ( = ?auto_125460 ?auto_125457 ) ) ( not ( = ?auto_125460 ?auto_125456 ) ) ( not ( = ?auto_125462 ?auto_125463 ) ) ( not ( = ?auto_125462 ?auto_125458 ) ) ( not ( = ?auto_125462 ?auto_125459 ) ) ( not ( = ?auto_125462 ?auto_125457 ) ) ( not ( = ?auto_125462 ?auto_125456 ) ) ( not ( = ?auto_125463 ?auto_125458 ) ) ( not ( = ?auto_125463 ?auto_125459 ) ) ( not ( = ?auto_125463 ?auto_125457 ) ) ( not ( = ?auto_125463 ?auto_125456 ) ) ( not ( = ?auto_125458 ?auto_125459 ) ) ( not ( = ?auto_125458 ?auto_125457 ) ) ( not ( = ?auto_125458 ?auto_125456 ) ) ( ON ?auto_125456 ?auto_125461 ) ( CLEAR ?auto_125456 ) ( not ( = ?auto_125456 ?auto_125461 ) ) ( not ( = ?auto_125457 ?auto_125461 ) ) ( not ( = ?auto_125459 ?auto_125461 ) ) ( not ( = ?auto_125460 ?auto_125461 ) ) ( not ( = ?auto_125462 ?auto_125461 ) ) ( not ( = ?auto_125463 ?auto_125461 ) ) ( not ( = ?auto_125458 ?auto_125461 ) ) ( HOLDING ?auto_125457 ) ( CLEAR ?auto_125459 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125460 ?auto_125462 ?auto_125463 ?auto_125458 ?auto_125459 ?auto_125457 )
      ( MAKE-2PILE ?auto_125456 ?auto_125457 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125464 - BLOCK
      ?auto_125465 - BLOCK
    )
    :vars
    (
      ?auto_125469 - BLOCK
      ?auto_125470 - BLOCK
      ?auto_125468 - BLOCK
      ?auto_125467 - BLOCK
      ?auto_125466 - BLOCK
      ?auto_125471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125464 ?auto_125465 ) ) ( not ( = ?auto_125464 ?auto_125469 ) ) ( not ( = ?auto_125465 ?auto_125469 ) ) ( ON-TABLE ?auto_125470 ) ( ON ?auto_125468 ?auto_125470 ) ( ON ?auto_125467 ?auto_125468 ) ( ON ?auto_125466 ?auto_125467 ) ( ON ?auto_125469 ?auto_125466 ) ( not ( = ?auto_125470 ?auto_125468 ) ) ( not ( = ?auto_125470 ?auto_125467 ) ) ( not ( = ?auto_125470 ?auto_125466 ) ) ( not ( = ?auto_125470 ?auto_125469 ) ) ( not ( = ?auto_125470 ?auto_125465 ) ) ( not ( = ?auto_125470 ?auto_125464 ) ) ( not ( = ?auto_125468 ?auto_125467 ) ) ( not ( = ?auto_125468 ?auto_125466 ) ) ( not ( = ?auto_125468 ?auto_125469 ) ) ( not ( = ?auto_125468 ?auto_125465 ) ) ( not ( = ?auto_125468 ?auto_125464 ) ) ( not ( = ?auto_125467 ?auto_125466 ) ) ( not ( = ?auto_125467 ?auto_125469 ) ) ( not ( = ?auto_125467 ?auto_125465 ) ) ( not ( = ?auto_125467 ?auto_125464 ) ) ( not ( = ?auto_125466 ?auto_125469 ) ) ( not ( = ?auto_125466 ?auto_125465 ) ) ( not ( = ?auto_125466 ?auto_125464 ) ) ( ON ?auto_125464 ?auto_125471 ) ( not ( = ?auto_125464 ?auto_125471 ) ) ( not ( = ?auto_125465 ?auto_125471 ) ) ( not ( = ?auto_125469 ?auto_125471 ) ) ( not ( = ?auto_125470 ?auto_125471 ) ) ( not ( = ?auto_125468 ?auto_125471 ) ) ( not ( = ?auto_125467 ?auto_125471 ) ) ( not ( = ?auto_125466 ?auto_125471 ) ) ( CLEAR ?auto_125469 ) ( ON ?auto_125465 ?auto_125464 ) ( CLEAR ?auto_125465 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125471 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125471 ?auto_125464 )
      ( MAKE-2PILE ?auto_125464 ?auto_125465 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125472 - BLOCK
      ?auto_125473 - BLOCK
    )
    :vars
    (
      ?auto_125476 - BLOCK
      ?auto_125479 - BLOCK
      ?auto_125474 - BLOCK
      ?auto_125477 - BLOCK
      ?auto_125478 - BLOCK
      ?auto_125475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125472 ?auto_125473 ) ) ( not ( = ?auto_125472 ?auto_125476 ) ) ( not ( = ?auto_125473 ?auto_125476 ) ) ( ON-TABLE ?auto_125479 ) ( ON ?auto_125474 ?auto_125479 ) ( ON ?auto_125477 ?auto_125474 ) ( ON ?auto_125478 ?auto_125477 ) ( not ( = ?auto_125479 ?auto_125474 ) ) ( not ( = ?auto_125479 ?auto_125477 ) ) ( not ( = ?auto_125479 ?auto_125478 ) ) ( not ( = ?auto_125479 ?auto_125476 ) ) ( not ( = ?auto_125479 ?auto_125473 ) ) ( not ( = ?auto_125479 ?auto_125472 ) ) ( not ( = ?auto_125474 ?auto_125477 ) ) ( not ( = ?auto_125474 ?auto_125478 ) ) ( not ( = ?auto_125474 ?auto_125476 ) ) ( not ( = ?auto_125474 ?auto_125473 ) ) ( not ( = ?auto_125474 ?auto_125472 ) ) ( not ( = ?auto_125477 ?auto_125478 ) ) ( not ( = ?auto_125477 ?auto_125476 ) ) ( not ( = ?auto_125477 ?auto_125473 ) ) ( not ( = ?auto_125477 ?auto_125472 ) ) ( not ( = ?auto_125478 ?auto_125476 ) ) ( not ( = ?auto_125478 ?auto_125473 ) ) ( not ( = ?auto_125478 ?auto_125472 ) ) ( ON ?auto_125472 ?auto_125475 ) ( not ( = ?auto_125472 ?auto_125475 ) ) ( not ( = ?auto_125473 ?auto_125475 ) ) ( not ( = ?auto_125476 ?auto_125475 ) ) ( not ( = ?auto_125479 ?auto_125475 ) ) ( not ( = ?auto_125474 ?auto_125475 ) ) ( not ( = ?auto_125477 ?auto_125475 ) ) ( not ( = ?auto_125478 ?auto_125475 ) ) ( ON ?auto_125473 ?auto_125472 ) ( CLEAR ?auto_125473 ) ( ON-TABLE ?auto_125475 ) ( HOLDING ?auto_125476 ) ( CLEAR ?auto_125478 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125479 ?auto_125474 ?auto_125477 ?auto_125478 ?auto_125476 )
      ( MAKE-2PILE ?auto_125472 ?auto_125473 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125480 - BLOCK
      ?auto_125481 - BLOCK
    )
    :vars
    (
      ?auto_125486 - BLOCK
      ?auto_125482 - BLOCK
      ?auto_125484 - BLOCK
      ?auto_125485 - BLOCK
      ?auto_125487 - BLOCK
      ?auto_125483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125480 ?auto_125481 ) ) ( not ( = ?auto_125480 ?auto_125486 ) ) ( not ( = ?auto_125481 ?auto_125486 ) ) ( ON-TABLE ?auto_125482 ) ( ON ?auto_125484 ?auto_125482 ) ( ON ?auto_125485 ?auto_125484 ) ( ON ?auto_125487 ?auto_125485 ) ( not ( = ?auto_125482 ?auto_125484 ) ) ( not ( = ?auto_125482 ?auto_125485 ) ) ( not ( = ?auto_125482 ?auto_125487 ) ) ( not ( = ?auto_125482 ?auto_125486 ) ) ( not ( = ?auto_125482 ?auto_125481 ) ) ( not ( = ?auto_125482 ?auto_125480 ) ) ( not ( = ?auto_125484 ?auto_125485 ) ) ( not ( = ?auto_125484 ?auto_125487 ) ) ( not ( = ?auto_125484 ?auto_125486 ) ) ( not ( = ?auto_125484 ?auto_125481 ) ) ( not ( = ?auto_125484 ?auto_125480 ) ) ( not ( = ?auto_125485 ?auto_125487 ) ) ( not ( = ?auto_125485 ?auto_125486 ) ) ( not ( = ?auto_125485 ?auto_125481 ) ) ( not ( = ?auto_125485 ?auto_125480 ) ) ( not ( = ?auto_125487 ?auto_125486 ) ) ( not ( = ?auto_125487 ?auto_125481 ) ) ( not ( = ?auto_125487 ?auto_125480 ) ) ( ON ?auto_125480 ?auto_125483 ) ( not ( = ?auto_125480 ?auto_125483 ) ) ( not ( = ?auto_125481 ?auto_125483 ) ) ( not ( = ?auto_125486 ?auto_125483 ) ) ( not ( = ?auto_125482 ?auto_125483 ) ) ( not ( = ?auto_125484 ?auto_125483 ) ) ( not ( = ?auto_125485 ?auto_125483 ) ) ( not ( = ?auto_125487 ?auto_125483 ) ) ( ON ?auto_125481 ?auto_125480 ) ( ON-TABLE ?auto_125483 ) ( CLEAR ?auto_125487 ) ( ON ?auto_125486 ?auto_125481 ) ( CLEAR ?auto_125486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125483 ?auto_125480 ?auto_125481 )
      ( MAKE-2PILE ?auto_125480 ?auto_125481 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125488 - BLOCK
      ?auto_125489 - BLOCK
    )
    :vars
    (
      ?auto_125491 - BLOCK
      ?auto_125492 - BLOCK
      ?auto_125495 - BLOCK
      ?auto_125490 - BLOCK
      ?auto_125494 - BLOCK
      ?auto_125493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125488 ?auto_125489 ) ) ( not ( = ?auto_125488 ?auto_125491 ) ) ( not ( = ?auto_125489 ?auto_125491 ) ) ( ON-TABLE ?auto_125492 ) ( ON ?auto_125495 ?auto_125492 ) ( ON ?auto_125490 ?auto_125495 ) ( not ( = ?auto_125492 ?auto_125495 ) ) ( not ( = ?auto_125492 ?auto_125490 ) ) ( not ( = ?auto_125492 ?auto_125494 ) ) ( not ( = ?auto_125492 ?auto_125491 ) ) ( not ( = ?auto_125492 ?auto_125489 ) ) ( not ( = ?auto_125492 ?auto_125488 ) ) ( not ( = ?auto_125495 ?auto_125490 ) ) ( not ( = ?auto_125495 ?auto_125494 ) ) ( not ( = ?auto_125495 ?auto_125491 ) ) ( not ( = ?auto_125495 ?auto_125489 ) ) ( not ( = ?auto_125495 ?auto_125488 ) ) ( not ( = ?auto_125490 ?auto_125494 ) ) ( not ( = ?auto_125490 ?auto_125491 ) ) ( not ( = ?auto_125490 ?auto_125489 ) ) ( not ( = ?auto_125490 ?auto_125488 ) ) ( not ( = ?auto_125494 ?auto_125491 ) ) ( not ( = ?auto_125494 ?auto_125489 ) ) ( not ( = ?auto_125494 ?auto_125488 ) ) ( ON ?auto_125488 ?auto_125493 ) ( not ( = ?auto_125488 ?auto_125493 ) ) ( not ( = ?auto_125489 ?auto_125493 ) ) ( not ( = ?auto_125491 ?auto_125493 ) ) ( not ( = ?auto_125492 ?auto_125493 ) ) ( not ( = ?auto_125495 ?auto_125493 ) ) ( not ( = ?auto_125490 ?auto_125493 ) ) ( not ( = ?auto_125494 ?auto_125493 ) ) ( ON ?auto_125489 ?auto_125488 ) ( ON-TABLE ?auto_125493 ) ( ON ?auto_125491 ?auto_125489 ) ( CLEAR ?auto_125491 ) ( HOLDING ?auto_125494 ) ( CLEAR ?auto_125490 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125492 ?auto_125495 ?auto_125490 ?auto_125494 )
      ( MAKE-2PILE ?auto_125488 ?auto_125489 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125496 - BLOCK
      ?auto_125497 - BLOCK
    )
    :vars
    (
      ?auto_125498 - BLOCK
      ?auto_125501 - BLOCK
      ?auto_125499 - BLOCK
      ?auto_125502 - BLOCK
      ?auto_125500 - BLOCK
      ?auto_125503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125496 ?auto_125497 ) ) ( not ( = ?auto_125496 ?auto_125498 ) ) ( not ( = ?auto_125497 ?auto_125498 ) ) ( ON-TABLE ?auto_125501 ) ( ON ?auto_125499 ?auto_125501 ) ( ON ?auto_125502 ?auto_125499 ) ( not ( = ?auto_125501 ?auto_125499 ) ) ( not ( = ?auto_125501 ?auto_125502 ) ) ( not ( = ?auto_125501 ?auto_125500 ) ) ( not ( = ?auto_125501 ?auto_125498 ) ) ( not ( = ?auto_125501 ?auto_125497 ) ) ( not ( = ?auto_125501 ?auto_125496 ) ) ( not ( = ?auto_125499 ?auto_125502 ) ) ( not ( = ?auto_125499 ?auto_125500 ) ) ( not ( = ?auto_125499 ?auto_125498 ) ) ( not ( = ?auto_125499 ?auto_125497 ) ) ( not ( = ?auto_125499 ?auto_125496 ) ) ( not ( = ?auto_125502 ?auto_125500 ) ) ( not ( = ?auto_125502 ?auto_125498 ) ) ( not ( = ?auto_125502 ?auto_125497 ) ) ( not ( = ?auto_125502 ?auto_125496 ) ) ( not ( = ?auto_125500 ?auto_125498 ) ) ( not ( = ?auto_125500 ?auto_125497 ) ) ( not ( = ?auto_125500 ?auto_125496 ) ) ( ON ?auto_125496 ?auto_125503 ) ( not ( = ?auto_125496 ?auto_125503 ) ) ( not ( = ?auto_125497 ?auto_125503 ) ) ( not ( = ?auto_125498 ?auto_125503 ) ) ( not ( = ?auto_125501 ?auto_125503 ) ) ( not ( = ?auto_125499 ?auto_125503 ) ) ( not ( = ?auto_125502 ?auto_125503 ) ) ( not ( = ?auto_125500 ?auto_125503 ) ) ( ON ?auto_125497 ?auto_125496 ) ( ON-TABLE ?auto_125503 ) ( ON ?auto_125498 ?auto_125497 ) ( CLEAR ?auto_125502 ) ( ON ?auto_125500 ?auto_125498 ) ( CLEAR ?auto_125500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125503 ?auto_125496 ?auto_125497 ?auto_125498 )
      ( MAKE-2PILE ?auto_125496 ?auto_125497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125504 - BLOCK
      ?auto_125505 - BLOCK
    )
    :vars
    (
      ?auto_125507 - BLOCK
      ?auto_125506 - BLOCK
      ?auto_125510 - BLOCK
      ?auto_125511 - BLOCK
      ?auto_125509 - BLOCK
      ?auto_125508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125504 ?auto_125505 ) ) ( not ( = ?auto_125504 ?auto_125507 ) ) ( not ( = ?auto_125505 ?auto_125507 ) ) ( ON-TABLE ?auto_125506 ) ( ON ?auto_125510 ?auto_125506 ) ( not ( = ?auto_125506 ?auto_125510 ) ) ( not ( = ?auto_125506 ?auto_125511 ) ) ( not ( = ?auto_125506 ?auto_125509 ) ) ( not ( = ?auto_125506 ?auto_125507 ) ) ( not ( = ?auto_125506 ?auto_125505 ) ) ( not ( = ?auto_125506 ?auto_125504 ) ) ( not ( = ?auto_125510 ?auto_125511 ) ) ( not ( = ?auto_125510 ?auto_125509 ) ) ( not ( = ?auto_125510 ?auto_125507 ) ) ( not ( = ?auto_125510 ?auto_125505 ) ) ( not ( = ?auto_125510 ?auto_125504 ) ) ( not ( = ?auto_125511 ?auto_125509 ) ) ( not ( = ?auto_125511 ?auto_125507 ) ) ( not ( = ?auto_125511 ?auto_125505 ) ) ( not ( = ?auto_125511 ?auto_125504 ) ) ( not ( = ?auto_125509 ?auto_125507 ) ) ( not ( = ?auto_125509 ?auto_125505 ) ) ( not ( = ?auto_125509 ?auto_125504 ) ) ( ON ?auto_125504 ?auto_125508 ) ( not ( = ?auto_125504 ?auto_125508 ) ) ( not ( = ?auto_125505 ?auto_125508 ) ) ( not ( = ?auto_125507 ?auto_125508 ) ) ( not ( = ?auto_125506 ?auto_125508 ) ) ( not ( = ?auto_125510 ?auto_125508 ) ) ( not ( = ?auto_125511 ?auto_125508 ) ) ( not ( = ?auto_125509 ?auto_125508 ) ) ( ON ?auto_125505 ?auto_125504 ) ( ON-TABLE ?auto_125508 ) ( ON ?auto_125507 ?auto_125505 ) ( ON ?auto_125509 ?auto_125507 ) ( CLEAR ?auto_125509 ) ( HOLDING ?auto_125511 ) ( CLEAR ?auto_125510 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125506 ?auto_125510 ?auto_125511 )
      ( MAKE-2PILE ?auto_125504 ?auto_125505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125512 - BLOCK
      ?auto_125513 - BLOCK
    )
    :vars
    (
      ?auto_125514 - BLOCK
      ?auto_125519 - BLOCK
      ?auto_125517 - BLOCK
      ?auto_125515 - BLOCK
      ?auto_125518 - BLOCK
      ?auto_125516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125512 ?auto_125513 ) ) ( not ( = ?auto_125512 ?auto_125514 ) ) ( not ( = ?auto_125513 ?auto_125514 ) ) ( ON-TABLE ?auto_125519 ) ( ON ?auto_125517 ?auto_125519 ) ( not ( = ?auto_125519 ?auto_125517 ) ) ( not ( = ?auto_125519 ?auto_125515 ) ) ( not ( = ?auto_125519 ?auto_125518 ) ) ( not ( = ?auto_125519 ?auto_125514 ) ) ( not ( = ?auto_125519 ?auto_125513 ) ) ( not ( = ?auto_125519 ?auto_125512 ) ) ( not ( = ?auto_125517 ?auto_125515 ) ) ( not ( = ?auto_125517 ?auto_125518 ) ) ( not ( = ?auto_125517 ?auto_125514 ) ) ( not ( = ?auto_125517 ?auto_125513 ) ) ( not ( = ?auto_125517 ?auto_125512 ) ) ( not ( = ?auto_125515 ?auto_125518 ) ) ( not ( = ?auto_125515 ?auto_125514 ) ) ( not ( = ?auto_125515 ?auto_125513 ) ) ( not ( = ?auto_125515 ?auto_125512 ) ) ( not ( = ?auto_125518 ?auto_125514 ) ) ( not ( = ?auto_125518 ?auto_125513 ) ) ( not ( = ?auto_125518 ?auto_125512 ) ) ( ON ?auto_125512 ?auto_125516 ) ( not ( = ?auto_125512 ?auto_125516 ) ) ( not ( = ?auto_125513 ?auto_125516 ) ) ( not ( = ?auto_125514 ?auto_125516 ) ) ( not ( = ?auto_125519 ?auto_125516 ) ) ( not ( = ?auto_125517 ?auto_125516 ) ) ( not ( = ?auto_125515 ?auto_125516 ) ) ( not ( = ?auto_125518 ?auto_125516 ) ) ( ON ?auto_125513 ?auto_125512 ) ( ON-TABLE ?auto_125516 ) ( ON ?auto_125514 ?auto_125513 ) ( ON ?auto_125518 ?auto_125514 ) ( CLEAR ?auto_125517 ) ( ON ?auto_125515 ?auto_125518 ) ( CLEAR ?auto_125515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125516 ?auto_125512 ?auto_125513 ?auto_125514 ?auto_125518 )
      ( MAKE-2PILE ?auto_125512 ?auto_125513 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125520 - BLOCK
      ?auto_125521 - BLOCK
    )
    :vars
    (
      ?auto_125526 - BLOCK
      ?auto_125525 - BLOCK
      ?auto_125524 - BLOCK
      ?auto_125523 - BLOCK
      ?auto_125527 - BLOCK
      ?auto_125522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125520 ?auto_125521 ) ) ( not ( = ?auto_125520 ?auto_125526 ) ) ( not ( = ?auto_125521 ?auto_125526 ) ) ( ON-TABLE ?auto_125525 ) ( not ( = ?auto_125525 ?auto_125524 ) ) ( not ( = ?auto_125525 ?auto_125523 ) ) ( not ( = ?auto_125525 ?auto_125527 ) ) ( not ( = ?auto_125525 ?auto_125526 ) ) ( not ( = ?auto_125525 ?auto_125521 ) ) ( not ( = ?auto_125525 ?auto_125520 ) ) ( not ( = ?auto_125524 ?auto_125523 ) ) ( not ( = ?auto_125524 ?auto_125527 ) ) ( not ( = ?auto_125524 ?auto_125526 ) ) ( not ( = ?auto_125524 ?auto_125521 ) ) ( not ( = ?auto_125524 ?auto_125520 ) ) ( not ( = ?auto_125523 ?auto_125527 ) ) ( not ( = ?auto_125523 ?auto_125526 ) ) ( not ( = ?auto_125523 ?auto_125521 ) ) ( not ( = ?auto_125523 ?auto_125520 ) ) ( not ( = ?auto_125527 ?auto_125526 ) ) ( not ( = ?auto_125527 ?auto_125521 ) ) ( not ( = ?auto_125527 ?auto_125520 ) ) ( ON ?auto_125520 ?auto_125522 ) ( not ( = ?auto_125520 ?auto_125522 ) ) ( not ( = ?auto_125521 ?auto_125522 ) ) ( not ( = ?auto_125526 ?auto_125522 ) ) ( not ( = ?auto_125525 ?auto_125522 ) ) ( not ( = ?auto_125524 ?auto_125522 ) ) ( not ( = ?auto_125523 ?auto_125522 ) ) ( not ( = ?auto_125527 ?auto_125522 ) ) ( ON ?auto_125521 ?auto_125520 ) ( ON-TABLE ?auto_125522 ) ( ON ?auto_125526 ?auto_125521 ) ( ON ?auto_125527 ?auto_125526 ) ( ON ?auto_125523 ?auto_125527 ) ( CLEAR ?auto_125523 ) ( HOLDING ?auto_125524 ) ( CLEAR ?auto_125525 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125525 ?auto_125524 )
      ( MAKE-2PILE ?auto_125520 ?auto_125521 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125528 - BLOCK
      ?auto_125529 - BLOCK
    )
    :vars
    (
      ?auto_125535 - BLOCK
      ?auto_125530 - BLOCK
      ?auto_125532 - BLOCK
      ?auto_125531 - BLOCK
      ?auto_125534 - BLOCK
      ?auto_125533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125528 ?auto_125529 ) ) ( not ( = ?auto_125528 ?auto_125535 ) ) ( not ( = ?auto_125529 ?auto_125535 ) ) ( ON-TABLE ?auto_125530 ) ( not ( = ?auto_125530 ?auto_125532 ) ) ( not ( = ?auto_125530 ?auto_125531 ) ) ( not ( = ?auto_125530 ?auto_125534 ) ) ( not ( = ?auto_125530 ?auto_125535 ) ) ( not ( = ?auto_125530 ?auto_125529 ) ) ( not ( = ?auto_125530 ?auto_125528 ) ) ( not ( = ?auto_125532 ?auto_125531 ) ) ( not ( = ?auto_125532 ?auto_125534 ) ) ( not ( = ?auto_125532 ?auto_125535 ) ) ( not ( = ?auto_125532 ?auto_125529 ) ) ( not ( = ?auto_125532 ?auto_125528 ) ) ( not ( = ?auto_125531 ?auto_125534 ) ) ( not ( = ?auto_125531 ?auto_125535 ) ) ( not ( = ?auto_125531 ?auto_125529 ) ) ( not ( = ?auto_125531 ?auto_125528 ) ) ( not ( = ?auto_125534 ?auto_125535 ) ) ( not ( = ?auto_125534 ?auto_125529 ) ) ( not ( = ?auto_125534 ?auto_125528 ) ) ( ON ?auto_125528 ?auto_125533 ) ( not ( = ?auto_125528 ?auto_125533 ) ) ( not ( = ?auto_125529 ?auto_125533 ) ) ( not ( = ?auto_125535 ?auto_125533 ) ) ( not ( = ?auto_125530 ?auto_125533 ) ) ( not ( = ?auto_125532 ?auto_125533 ) ) ( not ( = ?auto_125531 ?auto_125533 ) ) ( not ( = ?auto_125534 ?auto_125533 ) ) ( ON ?auto_125529 ?auto_125528 ) ( ON-TABLE ?auto_125533 ) ( ON ?auto_125535 ?auto_125529 ) ( ON ?auto_125534 ?auto_125535 ) ( ON ?auto_125531 ?auto_125534 ) ( CLEAR ?auto_125530 ) ( ON ?auto_125532 ?auto_125531 ) ( CLEAR ?auto_125532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125533 ?auto_125528 ?auto_125529 ?auto_125535 ?auto_125534 ?auto_125531 )
      ( MAKE-2PILE ?auto_125528 ?auto_125529 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125536 - BLOCK
      ?auto_125537 - BLOCK
    )
    :vars
    (
      ?auto_125541 - BLOCK
      ?auto_125538 - BLOCK
      ?auto_125539 - BLOCK
      ?auto_125543 - BLOCK
      ?auto_125540 - BLOCK
      ?auto_125542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125536 ?auto_125537 ) ) ( not ( = ?auto_125536 ?auto_125541 ) ) ( not ( = ?auto_125537 ?auto_125541 ) ) ( not ( = ?auto_125538 ?auto_125539 ) ) ( not ( = ?auto_125538 ?auto_125543 ) ) ( not ( = ?auto_125538 ?auto_125540 ) ) ( not ( = ?auto_125538 ?auto_125541 ) ) ( not ( = ?auto_125538 ?auto_125537 ) ) ( not ( = ?auto_125538 ?auto_125536 ) ) ( not ( = ?auto_125539 ?auto_125543 ) ) ( not ( = ?auto_125539 ?auto_125540 ) ) ( not ( = ?auto_125539 ?auto_125541 ) ) ( not ( = ?auto_125539 ?auto_125537 ) ) ( not ( = ?auto_125539 ?auto_125536 ) ) ( not ( = ?auto_125543 ?auto_125540 ) ) ( not ( = ?auto_125543 ?auto_125541 ) ) ( not ( = ?auto_125543 ?auto_125537 ) ) ( not ( = ?auto_125543 ?auto_125536 ) ) ( not ( = ?auto_125540 ?auto_125541 ) ) ( not ( = ?auto_125540 ?auto_125537 ) ) ( not ( = ?auto_125540 ?auto_125536 ) ) ( ON ?auto_125536 ?auto_125542 ) ( not ( = ?auto_125536 ?auto_125542 ) ) ( not ( = ?auto_125537 ?auto_125542 ) ) ( not ( = ?auto_125541 ?auto_125542 ) ) ( not ( = ?auto_125538 ?auto_125542 ) ) ( not ( = ?auto_125539 ?auto_125542 ) ) ( not ( = ?auto_125543 ?auto_125542 ) ) ( not ( = ?auto_125540 ?auto_125542 ) ) ( ON ?auto_125537 ?auto_125536 ) ( ON-TABLE ?auto_125542 ) ( ON ?auto_125541 ?auto_125537 ) ( ON ?auto_125540 ?auto_125541 ) ( ON ?auto_125543 ?auto_125540 ) ( ON ?auto_125539 ?auto_125543 ) ( CLEAR ?auto_125539 ) ( HOLDING ?auto_125538 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125538 )
      ( MAKE-2PILE ?auto_125536 ?auto_125537 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_125544 - BLOCK
      ?auto_125545 - BLOCK
    )
    :vars
    (
      ?auto_125551 - BLOCK
      ?auto_125548 - BLOCK
      ?auto_125546 - BLOCK
      ?auto_125550 - BLOCK
      ?auto_125549 - BLOCK
      ?auto_125547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125544 ?auto_125545 ) ) ( not ( = ?auto_125544 ?auto_125551 ) ) ( not ( = ?auto_125545 ?auto_125551 ) ) ( not ( = ?auto_125548 ?auto_125546 ) ) ( not ( = ?auto_125548 ?auto_125550 ) ) ( not ( = ?auto_125548 ?auto_125549 ) ) ( not ( = ?auto_125548 ?auto_125551 ) ) ( not ( = ?auto_125548 ?auto_125545 ) ) ( not ( = ?auto_125548 ?auto_125544 ) ) ( not ( = ?auto_125546 ?auto_125550 ) ) ( not ( = ?auto_125546 ?auto_125549 ) ) ( not ( = ?auto_125546 ?auto_125551 ) ) ( not ( = ?auto_125546 ?auto_125545 ) ) ( not ( = ?auto_125546 ?auto_125544 ) ) ( not ( = ?auto_125550 ?auto_125549 ) ) ( not ( = ?auto_125550 ?auto_125551 ) ) ( not ( = ?auto_125550 ?auto_125545 ) ) ( not ( = ?auto_125550 ?auto_125544 ) ) ( not ( = ?auto_125549 ?auto_125551 ) ) ( not ( = ?auto_125549 ?auto_125545 ) ) ( not ( = ?auto_125549 ?auto_125544 ) ) ( ON ?auto_125544 ?auto_125547 ) ( not ( = ?auto_125544 ?auto_125547 ) ) ( not ( = ?auto_125545 ?auto_125547 ) ) ( not ( = ?auto_125551 ?auto_125547 ) ) ( not ( = ?auto_125548 ?auto_125547 ) ) ( not ( = ?auto_125546 ?auto_125547 ) ) ( not ( = ?auto_125550 ?auto_125547 ) ) ( not ( = ?auto_125549 ?auto_125547 ) ) ( ON ?auto_125545 ?auto_125544 ) ( ON-TABLE ?auto_125547 ) ( ON ?auto_125551 ?auto_125545 ) ( ON ?auto_125549 ?auto_125551 ) ( ON ?auto_125550 ?auto_125549 ) ( ON ?auto_125546 ?auto_125550 ) ( ON ?auto_125548 ?auto_125546 ) ( CLEAR ?auto_125548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125547 ?auto_125544 ?auto_125545 ?auto_125551 ?auto_125549 ?auto_125550 ?auto_125546 )
      ( MAKE-2PILE ?auto_125544 ?auto_125545 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125556 - BLOCK
      ?auto_125557 - BLOCK
      ?auto_125558 - BLOCK
      ?auto_125559 - BLOCK
    )
    :vars
    (
      ?auto_125560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125560 ?auto_125559 ) ( CLEAR ?auto_125560 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125556 ) ( ON ?auto_125557 ?auto_125556 ) ( ON ?auto_125558 ?auto_125557 ) ( ON ?auto_125559 ?auto_125558 ) ( not ( = ?auto_125556 ?auto_125557 ) ) ( not ( = ?auto_125556 ?auto_125558 ) ) ( not ( = ?auto_125556 ?auto_125559 ) ) ( not ( = ?auto_125556 ?auto_125560 ) ) ( not ( = ?auto_125557 ?auto_125558 ) ) ( not ( = ?auto_125557 ?auto_125559 ) ) ( not ( = ?auto_125557 ?auto_125560 ) ) ( not ( = ?auto_125558 ?auto_125559 ) ) ( not ( = ?auto_125558 ?auto_125560 ) ) ( not ( = ?auto_125559 ?auto_125560 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125560 ?auto_125559 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125561 - BLOCK
      ?auto_125562 - BLOCK
      ?auto_125563 - BLOCK
      ?auto_125564 - BLOCK
    )
    :vars
    (
      ?auto_125565 - BLOCK
      ?auto_125566 - BLOCK
      ?auto_125567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125565 ?auto_125564 ) ( CLEAR ?auto_125565 ) ( ON-TABLE ?auto_125561 ) ( ON ?auto_125562 ?auto_125561 ) ( ON ?auto_125563 ?auto_125562 ) ( ON ?auto_125564 ?auto_125563 ) ( not ( = ?auto_125561 ?auto_125562 ) ) ( not ( = ?auto_125561 ?auto_125563 ) ) ( not ( = ?auto_125561 ?auto_125564 ) ) ( not ( = ?auto_125561 ?auto_125565 ) ) ( not ( = ?auto_125562 ?auto_125563 ) ) ( not ( = ?auto_125562 ?auto_125564 ) ) ( not ( = ?auto_125562 ?auto_125565 ) ) ( not ( = ?auto_125563 ?auto_125564 ) ) ( not ( = ?auto_125563 ?auto_125565 ) ) ( not ( = ?auto_125564 ?auto_125565 ) ) ( HOLDING ?auto_125566 ) ( CLEAR ?auto_125567 ) ( not ( = ?auto_125561 ?auto_125566 ) ) ( not ( = ?auto_125561 ?auto_125567 ) ) ( not ( = ?auto_125562 ?auto_125566 ) ) ( not ( = ?auto_125562 ?auto_125567 ) ) ( not ( = ?auto_125563 ?auto_125566 ) ) ( not ( = ?auto_125563 ?auto_125567 ) ) ( not ( = ?auto_125564 ?auto_125566 ) ) ( not ( = ?auto_125564 ?auto_125567 ) ) ( not ( = ?auto_125565 ?auto_125566 ) ) ( not ( = ?auto_125565 ?auto_125567 ) ) ( not ( = ?auto_125566 ?auto_125567 ) ) )
    :subtasks
    ( ( !STACK ?auto_125566 ?auto_125567 )
      ( MAKE-4PILE ?auto_125561 ?auto_125562 ?auto_125563 ?auto_125564 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125568 - BLOCK
      ?auto_125569 - BLOCK
      ?auto_125570 - BLOCK
      ?auto_125571 - BLOCK
    )
    :vars
    (
      ?auto_125572 - BLOCK
      ?auto_125573 - BLOCK
      ?auto_125574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125572 ?auto_125571 ) ( ON-TABLE ?auto_125568 ) ( ON ?auto_125569 ?auto_125568 ) ( ON ?auto_125570 ?auto_125569 ) ( ON ?auto_125571 ?auto_125570 ) ( not ( = ?auto_125568 ?auto_125569 ) ) ( not ( = ?auto_125568 ?auto_125570 ) ) ( not ( = ?auto_125568 ?auto_125571 ) ) ( not ( = ?auto_125568 ?auto_125572 ) ) ( not ( = ?auto_125569 ?auto_125570 ) ) ( not ( = ?auto_125569 ?auto_125571 ) ) ( not ( = ?auto_125569 ?auto_125572 ) ) ( not ( = ?auto_125570 ?auto_125571 ) ) ( not ( = ?auto_125570 ?auto_125572 ) ) ( not ( = ?auto_125571 ?auto_125572 ) ) ( CLEAR ?auto_125573 ) ( not ( = ?auto_125568 ?auto_125574 ) ) ( not ( = ?auto_125568 ?auto_125573 ) ) ( not ( = ?auto_125569 ?auto_125574 ) ) ( not ( = ?auto_125569 ?auto_125573 ) ) ( not ( = ?auto_125570 ?auto_125574 ) ) ( not ( = ?auto_125570 ?auto_125573 ) ) ( not ( = ?auto_125571 ?auto_125574 ) ) ( not ( = ?auto_125571 ?auto_125573 ) ) ( not ( = ?auto_125572 ?auto_125574 ) ) ( not ( = ?auto_125572 ?auto_125573 ) ) ( not ( = ?auto_125574 ?auto_125573 ) ) ( ON ?auto_125574 ?auto_125572 ) ( CLEAR ?auto_125574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125568 ?auto_125569 ?auto_125570 ?auto_125571 ?auto_125572 )
      ( MAKE-4PILE ?auto_125568 ?auto_125569 ?auto_125570 ?auto_125571 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125575 - BLOCK
      ?auto_125576 - BLOCK
      ?auto_125577 - BLOCK
      ?auto_125578 - BLOCK
    )
    :vars
    (
      ?auto_125581 - BLOCK
      ?auto_125580 - BLOCK
      ?auto_125579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125581 ?auto_125578 ) ( ON-TABLE ?auto_125575 ) ( ON ?auto_125576 ?auto_125575 ) ( ON ?auto_125577 ?auto_125576 ) ( ON ?auto_125578 ?auto_125577 ) ( not ( = ?auto_125575 ?auto_125576 ) ) ( not ( = ?auto_125575 ?auto_125577 ) ) ( not ( = ?auto_125575 ?auto_125578 ) ) ( not ( = ?auto_125575 ?auto_125581 ) ) ( not ( = ?auto_125576 ?auto_125577 ) ) ( not ( = ?auto_125576 ?auto_125578 ) ) ( not ( = ?auto_125576 ?auto_125581 ) ) ( not ( = ?auto_125577 ?auto_125578 ) ) ( not ( = ?auto_125577 ?auto_125581 ) ) ( not ( = ?auto_125578 ?auto_125581 ) ) ( not ( = ?auto_125575 ?auto_125580 ) ) ( not ( = ?auto_125575 ?auto_125579 ) ) ( not ( = ?auto_125576 ?auto_125580 ) ) ( not ( = ?auto_125576 ?auto_125579 ) ) ( not ( = ?auto_125577 ?auto_125580 ) ) ( not ( = ?auto_125577 ?auto_125579 ) ) ( not ( = ?auto_125578 ?auto_125580 ) ) ( not ( = ?auto_125578 ?auto_125579 ) ) ( not ( = ?auto_125581 ?auto_125580 ) ) ( not ( = ?auto_125581 ?auto_125579 ) ) ( not ( = ?auto_125580 ?auto_125579 ) ) ( ON ?auto_125580 ?auto_125581 ) ( CLEAR ?auto_125580 ) ( HOLDING ?auto_125579 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125579 )
      ( MAKE-4PILE ?auto_125575 ?auto_125576 ?auto_125577 ?auto_125578 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125582 - BLOCK
      ?auto_125583 - BLOCK
      ?auto_125584 - BLOCK
      ?auto_125585 - BLOCK
    )
    :vars
    (
      ?auto_125588 - BLOCK
      ?auto_125587 - BLOCK
      ?auto_125586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125588 ?auto_125585 ) ( ON-TABLE ?auto_125582 ) ( ON ?auto_125583 ?auto_125582 ) ( ON ?auto_125584 ?auto_125583 ) ( ON ?auto_125585 ?auto_125584 ) ( not ( = ?auto_125582 ?auto_125583 ) ) ( not ( = ?auto_125582 ?auto_125584 ) ) ( not ( = ?auto_125582 ?auto_125585 ) ) ( not ( = ?auto_125582 ?auto_125588 ) ) ( not ( = ?auto_125583 ?auto_125584 ) ) ( not ( = ?auto_125583 ?auto_125585 ) ) ( not ( = ?auto_125583 ?auto_125588 ) ) ( not ( = ?auto_125584 ?auto_125585 ) ) ( not ( = ?auto_125584 ?auto_125588 ) ) ( not ( = ?auto_125585 ?auto_125588 ) ) ( not ( = ?auto_125582 ?auto_125587 ) ) ( not ( = ?auto_125582 ?auto_125586 ) ) ( not ( = ?auto_125583 ?auto_125587 ) ) ( not ( = ?auto_125583 ?auto_125586 ) ) ( not ( = ?auto_125584 ?auto_125587 ) ) ( not ( = ?auto_125584 ?auto_125586 ) ) ( not ( = ?auto_125585 ?auto_125587 ) ) ( not ( = ?auto_125585 ?auto_125586 ) ) ( not ( = ?auto_125588 ?auto_125587 ) ) ( not ( = ?auto_125588 ?auto_125586 ) ) ( not ( = ?auto_125587 ?auto_125586 ) ) ( ON ?auto_125587 ?auto_125588 ) ( ON ?auto_125586 ?auto_125587 ) ( CLEAR ?auto_125586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125582 ?auto_125583 ?auto_125584 ?auto_125585 ?auto_125588 ?auto_125587 )
      ( MAKE-4PILE ?auto_125582 ?auto_125583 ?auto_125584 ?auto_125585 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125589 - BLOCK
      ?auto_125590 - BLOCK
      ?auto_125591 - BLOCK
      ?auto_125592 - BLOCK
    )
    :vars
    (
      ?auto_125595 - BLOCK
      ?auto_125594 - BLOCK
      ?auto_125593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125595 ?auto_125592 ) ( ON-TABLE ?auto_125589 ) ( ON ?auto_125590 ?auto_125589 ) ( ON ?auto_125591 ?auto_125590 ) ( ON ?auto_125592 ?auto_125591 ) ( not ( = ?auto_125589 ?auto_125590 ) ) ( not ( = ?auto_125589 ?auto_125591 ) ) ( not ( = ?auto_125589 ?auto_125592 ) ) ( not ( = ?auto_125589 ?auto_125595 ) ) ( not ( = ?auto_125590 ?auto_125591 ) ) ( not ( = ?auto_125590 ?auto_125592 ) ) ( not ( = ?auto_125590 ?auto_125595 ) ) ( not ( = ?auto_125591 ?auto_125592 ) ) ( not ( = ?auto_125591 ?auto_125595 ) ) ( not ( = ?auto_125592 ?auto_125595 ) ) ( not ( = ?auto_125589 ?auto_125594 ) ) ( not ( = ?auto_125589 ?auto_125593 ) ) ( not ( = ?auto_125590 ?auto_125594 ) ) ( not ( = ?auto_125590 ?auto_125593 ) ) ( not ( = ?auto_125591 ?auto_125594 ) ) ( not ( = ?auto_125591 ?auto_125593 ) ) ( not ( = ?auto_125592 ?auto_125594 ) ) ( not ( = ?auto_125592 ?auto_125593 ) ) ( not ( = ?auto_125595 ?auto_125594 ) ) ( not ( = ?auto_125595 ?auto_125593 ) ) ( not ( = ?auto_125594 ?auto_125593 ) ) ( ON ?auto_125594 ?auto_125595 ) ( HOLDING ?auto_125593 ) ( CLEAR ?auto_125594 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125589 ?auto_125590 ?auto_125591 ?auto_125592 ?auto_125595 ?auto_125594 ?auto_125593 )
      ( MAKE-4PILE ?auto_125589 ?auto_125590 ?auto_125591 ?auto_125592 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125596 - BLOCK
      ?auto_125597 - BLOCK
      ?auto_125598 - BLOCK
      ?auto_125599 - BLOCK
    )
    :vars
    (
      ?auto_125602 - BLOCK
      ?auto_125601 - BLOCK
      ?auto_125600 - BLOCK
      ?auto_125603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125602 ?auto_125599 ) ( ON-TABLE ?auto_125596 ) ( ON ?auto_125597 ?auto_125596 ) ( ON ?auto_125598 ?auto_125597 ) ( ON ?auto_125599 ?auto_125598 ) ( not ( = ?auto_125596 ?auto_125597 ) ) ( not ( = ?auto_125596 ?auto_125598 ) ) ( not ( = ?auto_125596 ?auto_125599 ) ) ( not ( = ?auto_125596 ?auto_125602 ) ) ( not ( = ?auto_125597 ?auto_125598 ) ) ( not ( = ?auto_125597 ?auto_125599 ) ) ( not ( = ?auto_125597 ?auto_125602 ) ) ( not ( = ?auto_125598 ?auto_125599 ) ) ( not ( = ?auto_125598 ?auto_125602 ) ) ( not ( = ?auto_125599 ?auto_125602 ) ) ( not ( = ?auto_125596 ?auto_125601 ) ) ( not ( = ?auto_125596 ?auto_125600 ) ) ( not ( = ?auto_125597 ?auto_125601 ) ) ( not ( = ?auto_125597 ?auto_125600 ) ) ( not ( = ?auto_125598 ?auto_125601 ) ) ( not ( = ?auto_125598 ?auto_125600 ) ) ( not ( = ?auto_125599 ?auto_125601 ) ) ( not ( = ?auto_125599 ?auto_125600 ) ) ( not ( = ?auto_125602 ?auto_125601 ) ) ( not ( = ?auto_125602 ?auto_125600 ) ) ( not ( = ?auto_125601 ?auto_125600 ) ) ( ON ?auto_125601 ?auto_125602 ) ( CLEAR ?auto_125601 ) ( ON ?auto_125600 ?auto_125603 ) ( CLEAR ?auto_125600 ) ( HAND-EMPTY ) ( not ( = ?auto_125596 ?auto_125603 ) ) ( not ( = ?auto_125597 ?auto_125603 ) ) ( not ( = ?auto_125598 ?auto_125603 ) ) ( not ( = ?auto_125599 ?auto_125603 ) ) ( not ( = ?auto_125602 ?auto_125603 ) ) ( not ( = ?auto_125601 ?auto_125603 ) ) ( not ( = ?auto_125600 ?auto_125603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125600 ?auto_125603 )
      ( MAKE-4PILE ?auto_125596 ?auto_125597 ?auto_125598 ?auto_125599 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125604 - BLOCK
      ?auto_125605 - BLOCK
      ?auto_125606 - BLOCK
      ?auto_125607 - BLOCK
    )
    :vars
    (
      ?auto_125608 - BLOCK
      ?auto_125610 - BLOCK
      ?auto_125611 - BLOCK
      ?auto_125609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125608 ?auto_125607 ) ( ON-TABLE ?auto_125604 ) ( ON ?auto_125605 ?auto_125604 ) ( ON ?auto_125606 ?auto_125605 ) ( ON ?auto_125607 ?auto_125606 ) ( not ( = ?auto_125604 ?auto_125605 ) ) ( not ( = ?auto_125604 ?auto_125606 ) ) ( not ( = ?auto_125604 ?auto_125607 ) ) ( not ( = ?auto_125604 ?auto_125608 ) ) ( not ( = ?auto_125605 ?auto_125606 ) ) ( not ( = ?auto_125605 ?auto_125607 ) ) ( not ( = ?auto_125605 ?auto_125608 ) ) ( not ( = ?auto_125606 ?auto_125607 ) ) ( not ( = ?auto_125606 ?auto_125608 ) ) ( not ( = ?auto_125607 ?auto_125608 ) ) ( not ( = ?auto_125604 ?auto_125610 ) ) ( not ( = ?auto_125604 ?auto_125611 ) ) ( not ( = ?auto_125605 ?auto_125610 ) ) ( not ( = ?auto_125605 ?auto_125611 ) ) ( not ( = ?auto_125606 ?auto_125610 ) ) ( not ( = ?auto_125606 ?auto_125611 ) ) ( not ( = ?auto_125607 ?auto_125610 ) ) ( not ( = ?auto_125607 ?auto_125611 ) ) ( not ( = ?auto_125608 ?auto_125610 ) ) ( not ( = ?auto_125608 ?auto_125611 ) ) ( not ( = ?auto_125610 ?auto_125611 ) ) ( ON ?auto_125611 ?auto_125609 ) ( CLEAR ?auto_125611 ) ( not ( = ?auto_125604 ?auto_125609 ) ) ( not ( = ?auto_125605 ?auto_125609 ) ) ( not ( = ?auto_125606 ?auto_125609 ) ) ( not ( = ?auto_125607 ?auto_125609 ) ) ( not ( = ?auto_125608 ?auto_125609 ) ) ( not ( = ?auto_125610 ?auto_125609 ) ) ( not ( = ?auto_125611 ?auto_125609 ) ) ( HOLDING ?auto_125610 ) ( CLEAR ?auto_125608 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125604 ?auto_125605 ?auto_125606 ?auto_125607 ?auto_125608 ?auto_125610 )
      ( MAKE-4PILE ?auto_125604 ?auto_125605 ?auto_125606 ?auto_125607 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125612 - BLOCK
      ?auto_125613 - BLOCK
      ?auto_125614 - BLOCK
      ?auto_125615 - BLOCK
    )
    :vars
    (
      ?auto_125617 - BLOCK
      ?auto_125616 - BLOCK
      ?auto_125618 - BLOCK
      ?auto_125619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125617 ?auto_125615 ) ( ON-TABLE ?auto_125612 ) ( ON ?auto_125613 ?auto_125612 ) ( ON ?auto_125614 ?auto_125613 ) ( ON ?auto_125615 ?auto_125614 ) ( not ( = ?auto_125612 ?auto_125613 ) ) ( not ( = ?auto_125612 ?auto_125614 ) ) ( not ( = ?auto_125612 ?auto_125615 ) ) ( not ( = ?auto_125612 ?auto_125617 ) ) ( not ( = ?auto_125613 ?auto_125614 ) ) ( not ( = ?auto_125613 ?auto_125615 ) ) ( not ( = ?auto_125613 ?auto_125617 ) ) ( not ( = ?auto_125614 ?auto_125615 ) ) ( not ( = ?auto_125614 ?auto_125617 ) ) ( not ( = ?auto_125615 ?auto_125617 ) ) ( not ( = ?auto_125612 ?auto_125616 ) ) ( not ( = ?auto_125612 ?auto_125618 ) ) ( not ( = ?auto_125613 ?auto_125616 ) ) ( not ( = ?auto_125613 ?auto_125618 ) ) ( not ( = ?auto_125614 ?auto_125616 ) ) ( not ( = ?auto_125614 ?auto_125618 ) ) ( not ( = ?auto_125615 ?auto_125616 ) ) ( not ( = ?auto_125615 ?auto_125618 ) ) ( not ( = ?auto_125617 ?auto_125616 ) ) ( not ( = ?auto_125617 ?auto_125618 ) ) ( not ( = ?auto_125616 ?auto_125618 ) ) ( ON ?auto_125618 ?auto_125619 ) ( not ( = ?auto_125612 ?auto_125619 ) ) ( not ( = ?auto_125613 ?auto_125619 ) ) ( not ( = ?auto_125614 ?auto_125619 ) ) ( not ( = ?auto_125615 ?auto_125619 ) ) ( not ( = ?auto_125617 ?auto_125619 ) ) ( not ( = ?auto_125616 ?auto_125619 ) ) ( not ( = ?auto_125618 ?auto_125619 ) ) ( CLEAR ?auto_125617 ) ( ON ?auto_125616 ?auto_125618 ) ( CLEAR ?auto_125616 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125619 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125619 ?auto_125618 )
      ( MAKE-4PILE ?auto_125612 ?auto_125613 ?auto_125614 ?auto_125615 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125636 - BLOCK
      ?auto_125637 - BLOCK
      ?auto_125638 - BLOCK
      ?auto_125639 - BLOCK
    )
    :vars
    (
      ?auto_125641 - BLOCK
      ?auto_125642 - BLOCK
      ?auto_125640 - BLOCK
      ?auto_125643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125636 ) ( ON ?auto_125637 ?auto_125636 ) ( ON ?auto_125638 ?auto_125637 ) ( not ( = ?auto_125636 ?auto_125637 ) ) ( not ( = ?auto_125636 ?auto_125638 ) ) ( not ( = ?auto_125636 ?auto_125639 ) ) ( not ( = ?auto_125636 ?auto_125641 ) ) ( not ( = ?auto_125637 ?auto_125638 ) ) ( not ( = ?auto_125637 ?auto_125639 ) ) ( not ( = ?auto_125637 ?auto_125641 ) ) ( not ( = ?auto_125638 ?auto_125639 ) ) ( not ( = ?auto_125638 ?auto_125641 ) ) ( not ( = ?auto_125639 ?auto_125641 ) ) ( not ( = ?auto_125636 ?auto_125642 ) ) ( not ( = ?auto_125636 ?auto_125640 ) ) ( not ( = ?auto_125637 ?auto_125642 ) ) ( not ( = ?auto_125637 ?auto_125640 ) ) ( not ( = ?auto_125638 ?auto_125642 ) ) ( not ( = ?auto_125638 ?auto_125640 ) ) ( not ( = ?auto_125639 ?auto_125642 ) ) ( not ( = ?auto_125639 ?auto_125640 ) ) ( not ( = ?auto_125641 ?auto_125642 ) ) ( not ( = ?auto_125641 ?auto_125640 ) ) ( not ( = ?auto_125642 ?auto_125640 ) ) ( ON ?auto_125640 ?auto_125643 ) ( not ( = ?auto_125636 ?auto_125643 ) ) ( not ( = ?auto_125637 ?auto_125643 ) ) ( not ( = ?auto_125638 ?auto_125643 ) ) ( not ( = ?auto_125639 ?auto_125643 ) ) ( not ( = ?auto_125641 ?auto_125643 ) ) ( not ( = ?auto_125642 ?auto_125643 ) ) ( not ( = ?auto_125640 ?auto_125643 ) ) ( ON ?auto_125642 ?auto_125640 ) ( ON-TABLE ?auto_125643 ) ( ON ?auto_125641 ?auto_125642 ) ( CLEAR ?auto_125641 ) ( HOLDING ?auto_125639 ) ( CLEAR ?auto_125638 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125636 ?auto_125637 ?auto_125638 ?auto_125639 ?auto_125641 )
      ( MAKE-4PILE ?auto_125636 ?auto_125637 ?auto_125638 ?auto_125639 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125644 - BLOCK
      ?auto_125645 - BLOCK
      ?auto_125646 - BLOCK
      ?auto_125647 - BLOCK
    )
    :vars
    (
      ?auto_125650 - BLOCK
      ?auto_125651 - BLOCK
      ?auto_125648 - BLOCK
      ?auto_125649 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125644 ) ( ON ?auto_125645 ?auto_125644 ) ( ON ?auto_125646 ?auto_125645 ) ( not ( = ?auto_125644 ?auto_125645 ) ) ( not ( = ?auto_125644 ?auto_125646 ) ) ( not ( = ?auto_125644 ?auto_125647 ) ) ( not ( = ?auto_125644 ?auto_125650 ) ) ( not ( = ?auto_125645 ?auto_125646 ) ) ( not ( = ?auto_125645 ?auto_125647 ) ) ( not ( = ?auto_125645 ?auto_125650 ) ) ( not ( = ?auto_125646 ?auto_125647 ) ) ( not ( = ?auto_125646 ?auto_125650 ) ) ( not ( = ?auto_125647 ?auto_125650 ) ) ( not ( = ?auto_125644 ?auto_125651 ) ) ( not ( = ?auto_125644 ?auto_125648 ) ) ( not ( = ?auto_125645 ?auto_125651 ) ) ( not ( = ?auto_125645 ?auto_125648 ) ) ( not ( = ?auto_125646 ?auto_125651 ) ) ( not ( = ?auto_125646 ?auto_125648 ) ) ( not ( = ?auto_125647 ?auto_125651 ) ) ( not ( = ?auto_125647 ?auto_125648 ) ) ( not ( = ?auto_125650 ?auto_125651 ) ) ( not ( = ?auto_125650 ?auto_125648 ) ) ( not ( = ?auto_125651 ?auto_125648 ) ) ( ON ?auto_125648 ?auto_125649 ) ( not ( = ?auto_125644 ?auto_125649 ) ) ( not ( = ?auto_125645 ?auto_125649 ) ) ( not ( = ?auto_125646 ?auto_125649 ) ) ( not ( = ?auto_125647 ?auto_125649 ) ) ( not ( = ?auto_125650 ?auto_125649 ) ) ( not ( = ?auto_125651 ?auto_125649 ) ) ( not ( = ?auto_125648 ?auto_125649 ) ) ( ON ?auto_125651 ?auto_125648 ) ( ON-TABLE ?auto_125649 ) ( ON ?auto_125650 ?auto_125651 ) ( CLEAR ?auto_125646 ) ( ON ?auto_125647 ?auto_125650 ) ( CLEAR ?auto_125647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125649 ?auto_125648 ?auto_125651 ?auto_125650 )
      ( MAKE-4PILE ?auto_125644 ?auto_125645 ?auto_125646 ?auto_125647 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125652 - BLOCK
      ?auto_125653 - BLOCK
      ?auto_125654 - BLOCK
      ?auto_125655 - BLOCK
    )
    :vars
    (
      ?auto_125658 - BLOCK
      ?auto_125656 - BLOCK
      ?auto_125659 - BLOCK
      ?auto_125657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125652 ) ( ON ?auto_125653 ?auto_125652 ) ( not ( = ?auto_125652 ?auto_125653 ) ) ( not ( = ?auto_125652 ?auto_125654 ) ) ( not ( = ?auto_125652 ?auto_125655 ) ) ( not ( = ?auto_125652 ?auto_125658 ) ) ( not ( = ?auto_125653 ?auto_125654 ) ) ( not ( = ?auto_125653 ?auto_125655 ) ) ( not ( = ?auto_125653 ?auto_125658 ) ) ( not ( = ?auto_125654 ?auto_125655 ) ) ( not ( = ?auto_125654 ?auto_125658 ) ) ( not ( = ?auto_125655 ?auto_125658 ) ) ( not ( = ?auto_125652 ?auto_125656 ) ) ( not ( = ?auto_125652 ?auto_125659 ) ) ( not ( = ?auto_125653 ?auto_125656 ) ) ( not ( = ?auto_125653 ?auto_125659 ) ) ( not ( = ?auto_125654 ?auto_125656 ) ) ( not ( = ?auto_125654 ?auto_125659 ) ) ( not ( = ?auto_125655 ?auto_125656 ) ) ( not ( = ?auto_125655 ?auto_125659 ) ) ( not ( = ?auto_125658 ?auto_125656 ) ) ( not ( = ?auto_125658 ?auto_125659 ) ) ( not ( = ?auto_125656 ?auto_125659 ) ) ( ON ?auto_125659 ?auto_125657 ) ( not ( = ?auto_125652 ?auto_125657 ) ) ( not ( = ?auto_125653 ?auto_125657 ) ) ( not ( = ?auto_125654 ?auto_125657 ) ) ( not ( = ?auto_125655 ?auto_125657 ) ) ( not ( = ?auto_125658 ?auto_125657 ) ) ( not ( = ?auto_125656 ?auto_125657 ) ) ( not ( = ?auto_125659 ?auto_125657 ) ) ( ON ?auto_125656 ?auto_125659 ) ( ON-TABLE ?auto_125657 ) ( ON ?auto_125658 ?auto_125656 ) ( ON ?auto_125655 ?auto_125658 ) ( CLEAR ?auto_125655 ) ( HOLDING ?auto_125654 ) ( CLEAR ?auto_125653 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125652 ?auto_125653 ?auto_125654 )
      ( MAKE-4PILE ?auto_125652 ?auto_125653 ?auto_125654 ?auto_125655 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125660 - BLOCK
      ?auto_125661 - BLOCK
      ?auto_125662 - BLOCK
      ?auto_125663 - BLOCK
    )
    :vars
    (
      ?auto_125666 - BLOCK
      ?auto_125664 - BLOCK
      ?auto_125667 - BLOCK
      ?auto_125665 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125660 ) ( ON ?auto_125661 ?auto_125660 ) ( not ( = ?auto_125660 ?auto_125661 ) ) ( not ( = ?auto_125660 ?auto_125662 ) ) ( not ( = ?auto_125660 ?auto_125663 ) ) ( not ( = ?auto_125660 ?auto_125666 ) ) ( not ( = ?auto_125661 ?auto_125662 ) ) ( not ( = ?auto_125661 ?auto_125663 ) ) ( not ( = ?auto_125661 ?auto_125666 ) ) ( not ( = ?auto_125662 ?auto_125663 ) ) ( not ( = ?auto_125662 ?auto_125666 ) ) ( not ( = ?auto_125663 ?auto_125666 ) ) ( not ( = ?auto_125660 ?auto_125664 ) ) ( not ( = ?auto_125660 ?auto_125667 ) ) ( not ( = ?auto_125661 ?auto_125664 ) ) ( not ( = ?auto_125661 ?auto_125667 ) ) ( not ( = ?auto_125662 ?auto_125664 ) ) ( not ( = ?auto_125662 ?auto_125667 ) ) ( not ( = ?auto_125663 ?auto_125664 ) ) ( not ( = ?auto_125663 ?auto_125667 ) ) ( not ( = ?auto_125666 ?auto_125664 ) ) ( not ( = ?auto_125666 ?auto_125667 ) ) ( not ( = ?auto_125664 ?auto_125667 ) ) ( ON ?auto_125667 ?auto_125665 ) ( not ( = ?auto_125660 ?auto_125665 ) ) ( not ( = ?auto_125661 ?auto_125665 ) ) ( not ( = ?auto_125662 ?auto_125665 ) ) ( not ( = ?auto_125663 ?auto_125665 ) ) ( not ( = ?auto_125666 ?auto_125665 ) ) ( not ( = ?auto_125664 ?auto_125665 ) ) ( not ( = ?auto_125667 ?auto_125665 ) ) ( ON ?auto_125664 ?auto_125667 ) ( ON-TABLE ?auto_125665 ) ( ON ?auto_125666 ?auto_125664 ) ( ON ?auto_125663 ?auto_125666 ) ( CLEAR ?auto_125661 ) ( ON ?auto_125662 ?auto_125663 ) ( CLEAR ?auto_125662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125665 ?auto_125667 ?auto_125664 ?auto_125666 ?auto_125663 )
      ( MAKE-4PILE ?auto_125660 ?auto_125661 ?auto_125662 ?auto_125663 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125668 - BLOCK
      ?auto_125669 - BLOCK
      ?auto_125670 - BLOCK
      ?auto_125671 - BLOCK
    )
    :vars
    (
      ?auto_125675 - BLOCK
      ?auto_125672 - BLOCK
      ?auto_125674 - BLOCK
      ?auto_125673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125668 ) ( not ( = ?auto_125668 ?auto_125669 ) ) ( not ( = ?auto_125668 ?auto_125670 ) ) ( not ( = ?auto_125668 ?auto_125671 ) ) ( not ( = ?auto_125668 ?auto_125675 ) ) ( not ( = ?auto_125669 ?auto_125670 ) ) ( not ( = ?auto_125669 ?auto_125671 ) ) ( not ( = ?auto_125669 ?auto_125675 ) ) ( not ( = ?auto_125670 ?auto_125671 ) ) ( not ( = ?auto_125670 ?auto_125675 ) ) ( not ( = ?auto_125671 ?auto_125675 ) ) ( not ( = ?auto_125668 ?auto_125672 ) ) ( not ( = ?auto_125668 ?auto_125674 ) ) ( not ( = ?auto_125669 ?auto_125672 ) ) ( not ( = ?auto_125669 ?auto_125674 ) ) ( not ( = ?auto_125670 ?auto_125672 ) ) ( not ( = ?auto_125670 ?auto_125674 ) ) ( not ( = ?auto_125671 ?auto_125672 ) ) ( not ( = ?auto_125671 ?auto_125674 ) ) ( not ( = ?auto_125675 ?auto_125672 ) ) ( not ( = ?auto_125675 ?auto_125674 ) ) ( not ( = ?auto_125672 ?auto_125674 ) ) ( ON ?auto_125674 ?auto_125673 ) ( not ( = ?auto_125668 ?auto_125673 ) ) ( not ( = ?auto_125669 ?auto_125673 ) ) ( not ( = ?auto_125670 ?auto_125673 ) ) ( not ( = ?auto_125671 ?auto_125673 ) ) ( not ( = ?auto_125675 ?auto_125673 ) ) ( not ( = ?auto_125672 ?auto_125673 ) ) ( not ( = ?auto_125674 ?auto_125673 ) ) ( ON ?auto_125672 ?auto_125674 ) ( ON-TABLE ?auto_125673 ) ( ON ?auto_125675 ?auto_125672 ) ( ON ?auto_125671 ?auto_125675 ) ( ON ?auto_125670 ?auto_125671 ) ( CLEAR ?auto_125670 ) ( HOLDING ?auto_125669 ) ( CLEAR ?auto_125668 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125668 ?auto_125669 )
      ( MAKE-4PILE ?auto_125668 ?auto_125669 ?auto_125670 ?auto_125671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125676 - BLOCK
      ?auto_125677 - BLOCK
      ?auto_125678 - BLOCK
      ?auto_125679 - BLOCK
    )
    :vars
    (
      ?auto_125680 - BLOCK
      ?auto_125683 - BLOCK
      ?auto_125681 - BLOCK
      ?auto_125682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125676 ) ( not ( = ?auto_125676 ?auto_125677 ) ) ( not ( = ?auto_125676 ?auto_125678 ) ) ( not ( = ?auto_125676 ?auto_125679 ) ) ( not ( = ?auto_125676 ?auto_125680 ) ) ( not ( = ?auto_125677 ?auto_125678 ) ) ( not ( = ?auto_125677 ?auto_125679 ) ) ( not ( = ?auto_125677 ?auto_125680 ) ) ( not ( = ?auto_125678 ?auto_125679 ) ) ( not ( = ?auto_125678 ?auto_125680 ) ) ( not ( = ?auto_125679 ?auto_125680 ) ) ( not ( = ?auto_125676 ?auto_125683 ) ) ( not ( = ?auto_125676 ?auto_125681 ) ) ( not ( = ?auto_125677 ?auto_125683 ) ) ( not ( = ?auto_125677 ?auto_125681 ) ) ( not ( = ?auto_125678 ?auto_125683 ) ) ( not ( = ?auto_125678 ?auto_125681 ) ) ( not ( = ?auto_125679 ?auto_125683 ) ) ( not ( = ?auto_125679 ?auto_125681 ) ) ( not ( = ?auto_125680 ?auto_125683 ) ) ( not ( = ?auto_125680 ?auto_125681 ) ) ( not ( = ?auto_125683 ?auto_125681 ) ) ( ON ?auto_125681 ?auto_125682 ) ( not ( = ?auto_125676 ?auto_125682 ) ) ( not ( = ?auto_125677 ?auto_125682 ) ) ( not ( = ?auto_125678 ?auto_125682 ) ) ( not ( = ?auto_125679 ?auto_125682 ) ) ( not ( = ?auto_125680 ?auto_125682 ) ) ( not ( = ?auto_125683 ?auto_125682 ) ) ( not ( = ?auto_125681 ?auto_125682 ) ) ( ON ?auto_125683 ?auto_125681 ) ( ON-TABLE ?auto_125682 ) ( ON ?auto_125680 ?auto_125683 ) ( ON ?auto_125679 ?auto_125680 ) ( ON ?auto_125678 ?auto_125679 ) ( CLEAR ?auto_125676 ) ( ON ?auto_125677 ?auto_125678 ) ( CLEAR ?auto_125677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125682 ?auto_125681 ?auto_125683 ?auto_125680 ?auto_125679 ?auto_125678 )
      ( MAKE-4PILE ?auto_125676 ?auto_125677 ?auto_125678 ?auto_125679 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125684 - BLOCK
      ?auto_125685 - BLOCK
      ?auto_125686 - BLOCK
      ?auto_125687 - BLOCK
    )
    :vars
    (
      ?auto_125690 - BLOCK
      ?auto_125691 - BLOCK
      ?auto_125688 - BLOCK
      ?auto_125689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125684 ?auto_125685 ) ) ( not ( = ?auto_125684 ?auto_125686 ) ) ( not ( = ?auto_125684 ?auto_125687 ) ) ( not ( = ?auto_125684 ?auto_125690 ) ) ( not ( = ?auto_125685 ?auto_125686 ) ) ( not ( = ?auto_125685 ?auto_125687 ) ) ( not ( = ?auto_125685 ?auto_125690 ) ) ( not ( = ?auto_125686 ?auto_125687 ) ) ( not ( = ?auto_125686 ?auto_125690 ) ) ( not ( = ?auto_125687 ?auto_125690 ) ) ( not ( = ?auto_125684 ?auto_125691 ) ) ( not ( = ?auto_125684 ?auto_125688 ) ) ( not ( = ?auto_125685 ?auto_125691 ) ) ( not ( = ?auto_125685 ?auto_125688 ) ) ( not ( = ?auto_125686 ?auto_125691 ) ) ( not ( = ?auto_125686 ?auto_125688 ) ) ( not ( = ?auto_125687 ?auto_125691 ) ) ( not ( = ?auto_125687 ?auto_125688 ) ) ( not ( = ?auto_125690 ?auto_125691 ) ) ( not ( = ?auto_125690 ?auto_125688 ) ) ( not ( = ?auto_125691 ?auto_125688 ) ) ( ON ?auto_125688 ?auto_125689 ) ( not ( = ?auto_125684 ?auto_125689 ) ) ( not ( = ?auto_125685 ?auto_125689 ) ) ( not ( = ?auto_125686 ?auto_125689 ) ) ( not ( = ?auto_125687 ?auto_125689 ) ) ( not ( = ?auto_125690 ?auto_125689 ) ) ( not ( = ?auto_125691 ?auto_125689 ) ) ( not ( = ?auto_125688 ?auto_125689 ) ) ( ON ?auto_125691 ?auto_125688 ) ( ON-TABLE ?auto_125689 ) ( ON ?auto_125690 ?auto_125691 ) ( ON ?auto_125687 ?auto_125690 ) ( ON ?auto_125686 ?auto_125687 ) ( ON ?auto_125685 ?auto_125686 ) ( CLEAR ?auto_125685 ) ( HOLDING ?auto_125684 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125684 )
      ( MAKE-4PILE ?auto_125684 ?auto_125685 ?auto_125686 ?auto_125687 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_125692 - BLOCK
      ?auto_125693 - BLOCK
      ?auto_125694 - BLOCK
      ?auto_125695 - BLOCK
    )
    :vars
    (
      ?auto_125696 - BLOCK
      ?auto_125697 - BLOCK
      ?auto_125698 - BLOCK
      ?auto_125699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125692 ?auto_125693 ) ) ( not ( = ?auto_125692 ?auto_125694 ) ) ( not ( = ?auto_125692 ?auto_125695 ) ) ( not ( = ?auto_125692 ?auto_125696 ) ) ( not ( = ?auto_125693 ?auto_125694 ) ) ( not ( = ?auto_125693 ?auto_125695 ) ) ( not ( = ?auto_125693 ?auto_125696 ) ) ( not ( = ?auto_125694 ?auto_125695 ) ) ( not ( = ?auto_125694 ?auto_125696 ) ) ( not ( = ?auto_125695 ?auto_125696 ) ) ( not ( = ?auto_125692 ?auto_125697 ) ) ( not ( = ?auto_125692 ?auto_125698 ) ) ( not ( = ?auto_125693 ?auto_125697 ) ) ( not ( = ?auto_125693 ?auto_125698 ) ) ( not ( = ?auto_125694 ?auto_125697 ) ) ( not ( = ?auto_125694 ?auto_125698 ) ) ( not ( = ?auto_125695 ?auto_125697 ) ) ( not ( = ?auto_125695 ?auto_125698 ) ) ( not ( = ?auto_125696 ?auto_125697 ) ) ( not ( = ?auto_125696 ?auto_125698 ) ) ( not ( = ?auto_125697 ?auto_125698 ) ) ( ON ?auto_125698 ?auto_125699 ) ( not ( = ?auto_125692 ?auto_125699 ) ) ( not ( = ?auto_125693 ?auto_125699 ) ) ( not ( = ?auto_125694 ?auto_125699 ) ) ( not ( = ?auto_125695 ?auto_125699 ) ) ( not ( = ?auto_125696 ?auto_125699 ) ) ( not ( = ?auto_125697 ?auto_125699 ) ) ( not ( = ?auto_125698 ?auto_125699 ) ) ( ON ?auto_125697 ?auto_125698 ) ( ON-TABLE ?auto_125699 ) ( ON ?auto_125696 ?auto_125697 ) ( ON ?auto_125695 ?auto_125696 ) ( ON ?auto_125694 ?auto_125695 ) ( ON ?auto_125693 ?auto_125694 ) ( ON ?auto_125692 ?auto_125693 ) ( CLEAR ?auto_125692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125699 ?auto_125698 ?auto_125697 ?auto_125696 ?auto_125695 ?auto_125694 ?auto_125693 )
      ( MAKE-4PILE ?auto_125692 ?auto_125693 ?auto_125694 ?auto_125695 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125703 - BLOCK
      ?auto_125704 - BLOCK
      ?auto_125705 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_125705 ) ( CLEAR ?auto_125704 ) ( ON-TABLE ?auto_125703 ) ( ON ?auto_125704 ?auto_125703 ) ( not ( = ?auto_125703 ?auto_125704 ) ) ( not ( = ?auto_125703 ?auto_125705 ) ) ( not ( = ?auto_125704 ?auto_125705 ) ) )
    :subtasks
    ( ( !STACK ?auto_125705 ?auto_125704 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125706 - BLOCK
      ?auto_125707 - BLOCK
      ?auto_125708 - BLOCK
    )
    :vars
    (
      ?auto_125709 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_125707 ) ( ON-TABLE ?auto_125706 ) ( ON ?auto_125707 ?auto_125706 ) ( not ( = ?auto_125706 ?auto_125707 ) ) ( not ( = ?auto_125706 ?auto_125708 ) ) ( not ( = ?auto_125707 ?auto_125708 ) ) ( ON ?auto_125708 ?auto_125709 ) ( CLEAR ?auto_125708 ) ( HAND-EMPTY ) ( not ( = ?auto_125706 ?auto_125709 ) ) ( not ( = ?auto_125707 ?auto_125709 ) ) ( not ( = ?auto_125708 ?auto_125709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125708 ?auto_125709 )
      ( MAKE-3PILE ?auto_125706 ?auto_125707 ?auto_125708 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125710 - BLOCK
      ?auto_125711 - BLOCK
      ?auto_125712 - BLOCK
    )
    :vars
    (
      ?auto_125713 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125710 ) ( not ( = ?auto_125710 ?auto_125711 ) ) ( not ( = ?auto_125710 ?auto_125712 ) ) ( not ( = ?auto_125711 ?auto_125712 ) ) ( ON ?auto_125712 ?auto_125713 ) ( CLEAR ?auto_125712 ) ( not ( = ?auto_125710 ?auto_125713 ) ) ( not ( = ?auto_125711 ?auto_125713 ) ) ( not ( = ?auto_125712 ?auto_125713 ) ) ( HOLDING ?auto_125711 ) ( CLEAR ?auto_125710 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125710 ?auto_125711 )
      ( MAKE-3PILE ?auto_125710 ?auto_125711 ?auto_125712 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125714 - BLOCK
      ?auto_125715 - BLOCK
      ?auto_125716 - BLOCK
    )
    :vars
    (
      ?auto_125717 - BLOCK
      ?auto_125719 - BLOCK
      ?auto_125718 - BLOCK
      ?auto_125720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125714 ) ( not ( = ?auto_125714 ?auto_125715 ) ) ( not ( = ?auto_125714 ?auto_125716 ) ) ( not ( = ?auto_125715 ?auto_125716 ) ) ( ON ?auto_125716 ?auto_125717 ) ( not ( = ?auto_125714 ?auto_125717 ) ) ( not ( = ?auto_125715 ?auto_125717 ) ) ( not ( = ?auto_125716 ?auto_125717 ) ) ( CLEAR ?auto_125714 ) ( ON ?auto_125715 ?auto_125716 ) ( CLEAR ?auto_125715 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125719 ) ( ON ?auto_125718 ?auto_125719 ) ( ON ?auto_125720 ?auto_125718 ) ( ON ?auto_125717 ?auto_125720 ) ( not ( = ?auto_125719 ?auto_125718 ) ) ( not ( = ?auto_125719 ?auto_125720 ) ) ( not ( = ?auto_125719 ?auto_125717 ) ) ( not ( = ?auto_125719 ?auto_125716 ) ) ( not ( = ?auto_125719 ?auto_125715 ) ) ( not ( = ?auto_125718 ?auto_125720 ) ) ( not ( = ?auto_125718 ?auto_125717 ) ) ( not ( = ?auto_125718 ?auto_125716 ) ) ( not ( = ?auto_125718 ?auto_125715 ) ) ( not ( = ?auto_125720 ?auto_125717 ) ) ( not ( = ?auto_125720 ?auto_125716 ) ) ( not ( = ?auto_125720 ?auto_125715 ) ) ( not ( = ?auto_125714 ?auto_125719 ) ) ( not ( = ?auto_125714 ?auto_125718 ) ) ( not ( = ?auto_125714 ?auto_125720 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125719 ?auto_125718 ?auto_125720 ?auto_125717 ?auto_125716 )
      ( MAKE-3PILE ?auto_125714 ?auto_125715 ?auto_125716 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125721 - BLOCK
      ?auto_125722 - BLOCK
      ?auto_125723 - BLOCK
    )
    :vars
    (
      ?auto_125727 - BLOCK
      ?auto_125724 - BLOCK
      ?auto_125726 - BLOCK
      ?auto_125725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125721 ?auto_125722 ) ) ( not ( = ?auto_125721 ?auto_125723 ) ) ( not ( = ?auto_125722 ?auto_125723 ) ) ( ON ?auto_125723 ?auto_125727 ) ( not ( = ?auto_125721 ?auto_125727 ) ) ( not ( = ?auto_125722 ?auto_125727 ) ) ( not ( = ?auto_125723 ?auto_125727 ) ) ( ON ?auto_125722 ?auto_125723 ) ( CLEAR ?auto_125722 ) ( ON-TABLE ?auto_125724 ) ( ON ?auto_125726 ?auto_125724 ) ( ON ?auto_125725 ?auto_125726 ) ( ON ?auto_125727 ?auto_125725 ) ( not ( = ?auto_125724 ?auto_125726 ) ) ( not ( = ?auto_125724 ?auto_125725 ) ) ( not ( = ?auto_125724 ?auto_125727 ) ) ( not ( = ?auto_125724 ?auto_125723 ) ) ( not ( = ?auto_125724 ?auto_125722 ) ) ( not ( = ?auto_125726 ?auto_125725 ) ) ( not ( = ?auto_125726 ?auto_125727 ) ) ( not ( = ?auto_125726 ?auto_125723 ) ) ( not ( = ?auto_125726 ?auto_125722 ) ) ( not ( = ?auto_125725 ?auto_125727 ) ) ( not ( = ?auto_125725 ?auto_125723 ) ) ( not ( = ?auto_125725 ?auto_125722 ) ) ( not ( = ?auto_125721 ?auto_125724 ) ) ( not ( = ?auto_125721 ?auto_125726 ) ) ( not ( = ?auto_125721 ?auto_125725 ) ) ( HOLDING ?auto_125721 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125721 )
      ( MAKE-3PILE ?auto_125721 ?auto_125722 ?auto_125723 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125728 - BLOCK
      ?auto_125729 - BLOCK
      ?auto_125730 - BLOCK
    )
    :vars
    (
      ?auto_125731 - BLOCK
      ?auto_125734 - BLOCK
      ?auto_125733 - BLOCK
      ?auto_125732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125728 ?auto_125729 ) ) ( not ( = ?auto_125728 ?auto_125730 ) ) ( not ( = ?auto_125729 ?auto_125730 ) ) ( ON ?auto_125730 ?auto_125731 ) ( not ( = ?auto_125728 ?auto_125731 ) ) ( not ( = ?auto_125729 ?auto_125731 ) ) ( not ( = ?auto_125730 ?auto_125731 ) ) ( ON ?auto_125729 ?auto_125730 ) ( ON-TABLE ?auto_125734 ) ( ON ?auto_125733 ?auto_125734 ) ( ON ?auto_125732 ?auto_125733 ) ( ON ?auto_125731 ?auto_125732 ) ( not ( = ?auto_125734 ?auto_125733 ) ) ( not ( = ?auto_125734 ?auto_125732 ) ) ( not ( = ?auto_125734 ?auto_125731 ) ) ( not ( = ?auto_125734 ?auto_125730 ) ) ( not ( = ?auto_125734 ?auto_125729 ) ) ( not ( = ?auto_125733 ?auto_125732 ) ) ( not ( = ?auto_125733 ?auto_125731 ) ) ( not ( = ?auto_125733 ?auto_125730 ) ) ( not ( = ?auto_125733 ?auto_125729 ) ) ( not ( = ?auto_125732 ?auto_125731 ) ) ( not ( = ?auto_125732 ?auto_125730 ) ) ( not ( = ?auto_125732 ?auto_125729 ) ) ( not ( = ?auto_125728 ?auto_125734 ) ) ( not ( = ?auto_125728 ?auto_125733 ) ) ( not ( = ?auto_125728 ?auto_125732 ) ) ( ON ?auto_125728 ?auto_125729 ) ( CLEAR ?auto_125728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125734 ?auto_125733 ?auto_125732 ?auto_125731 ?auto_125730 ?auto_125729 )
      ( MAKE-3PILE ?auto_125728 ?auto_125729 ?auto_125730 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125735 - BLOCK
      ?auto_125736 - BLOCK
      ?auto_125737 - BLOCK
    )
    :vars
    (
      ?auto_125741 - BLOCK
      ?auto_125738 - BLOCK
      ?auto_125740 - BLOCK
      ?auto_125739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125735 ?auto_125736 ) ) ( not ( = ?auto_125735 ?auto_125737 ) ) ( not ( = ?auto_125736 ?auto_125737 ) ) ( ON ?auto_125737 ?auto_125741 ) ( not ( = ?auto_125735 ?auto_125741 ) ) ( not ( = ?auto_125736 ?auto_125741 ) ) ( not ( = ?auto_125737 ?auto_125741 ) ) ( ON ?auto_125736 ?auto_125737 ) ( ON-TABLE ?auto_125738 ) ( ON ?auto_125740 ?auto_125738 ) ( ON ?auto_125739 ?auto_125740 ) ( ON ?auto_125741 ?auto_125739 ) ( not ( = ?auto_125738 ?auto_125740 ) ) ( not ( = ?auto_125738 ?auto_125739 ) ) ( not ( = ?auto_125738 ?auto_125741 ) ) ( not ( = ?auto_125738 ?auto_125737 ) ) ( not ( = ?auto_125738 ?auto_125736 ) ) ( not ( = ?auto_125740 ?auto_125739 ) ) ( not ( = ?auto_125740 ?auto_125741 ) ) ( not ( = ?auto_125740 ?auto_125737 ) ) ( not ( = ?auto_125740 ?auto_125736 ) ) ( not ( = ?auto_125739 ?auto_125741 ) ) ( not ( = ?auto_125739 ?auto_125737 ) ) ( not ( = ?auto_125739 ?auto_125736 ) ) ( not ( = ?auto_125735 ?auto_125738 ) ) ( not ( = ?auto_125735 ?auto_125740 ) ) ( not ( = ?auto_125735 ?auto_125739 ) ) ( HOLDING ?auto_125735 ) ( CLEAR ?auto_125736 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125738 ?auto_125740 ?auto_125739 ?auto_125741 ?auto_125737 ?auto_125736 ?auto_125735 )
      ( MAKE-3PILE ?auto_125735 ?auto_125736 ?auto_125737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125742 - BLOCK
      ?auto_125743 - BLOCK
      ?auto_125744 - BLOCK
    )
    :vars
    (
      ?auto_125745 - BLOCK
      ?auto_125747 - BLOCK
      ?auto_125748 - BLOCK
      ?auto_125746 - BLOCK
      ?auto_125749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125742 ?auto_125743 ) ) ( not ( = ?auto_125742 ?auto_125744 ) ) ( not ( = ?auto_125743 ?auto_125744 ) ) ( ON ?auto_125744 ?auto_125745 ) ( not ( = ?auto_125742 ?auto_125745 ) ) ( not ( = ?auto_125743 ?auto_125745 ) ) ( not ( = ?auto_125744 ?auto_125745 ) ) ( ON ?auto_125743 ?auto_125744 ) ( ON-TABLE ?auto_125747 ) ( ON ?auto_125748 ?auto_125747 ) ( ON ?auto_125746 ?auto_125748 ) ( ON ?auto_125745 ?auto_125746 ) ( not ( = ?auto_125747 ?auto_125748 ) ) ( not ( = ?auto_125747 ?auto_125746 ) ) ( not ( = ?auto_125747 ?auto_125745 ) ) ( not ( = ?auto_125747 ?auto_125744 ) ) ( not ( = ?auto_125747 ?auto_125743 ) ) ( not ( = ?auto_125748 ?auto_125746 ) ) ( not ( = ?auto_125748 ?auto_125745 ) ) ( not ( = ?auto_125748 ?auto_125744 ) ) ( not ( = ?auto_125748 ?auto_125743 ) ) ( not ( = ?auto_125746 ?auto_125745 ) ) ( not ( = ?auto_125746 ?auto_125744 ) ) ( not ( = ?auto_125746 ?auto_125743 ) ) ( not ( = ?auto_125742 ?auto_125747 ) ) ( not ( = ?auto_125742 ?auto_125748 ) ) ( not ( = ?auto_125742 ?auto_125746 ) ) ( CLEAR ?auto_125743 ) ( ON ?auto_125742 ?auto_125749 ) ( CLEAR ?auto_125742 ) ( HAND-EMPTY ) ( not ( = ?auto_125742 ?auto_125749 ) ) ( not ( = ?auto_125743 ?auto_125749 ) ) ( not ( = ?auto_125744 ?auto_125749 ) ) ( not ( = ?auto_125745 ?auto_125749 ) ) ( not ( = ?auto_125747 ?auto_125749 ) ) ( not ( = ?auto_125748 ?auto_125749 ) ) ( not ( = ?auto_125746 ?auto_125749 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125742 ?auto_125749 )
      ( MAKE-3PILE ?auto_125742 ?auto_125743 ?auto_125744 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125750 - BLOCK
      ?auto_125751 - BLOCK
      ?auto_125752 - BLOCK
    )
    :vars
    (
      ?auto_125755 - BLOCK
      ?auto_125754 - BLOCK
      ?auto_125757 - BLOCK
      ?auto_125753 - BLOCK
      ?auto_125756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125750 ?auto_125751 ) ) ( not ( = ?auto_125750 ?auto_125752 ) ) ( not ( = ?auto_125751 ?auto_125752 ) ) ( ON ?auto_125752 ?auto_125755 ) ( not ( = ?auto_125750 ?auto_125755 ) ) ( not ( = ?auto_125751 ?auto_125755 ) ) ( not ( = ?auto_125752 ?auto_125755 ) ) ( ON-TABLE ?auto_125754 ) ( ON ?auto_125757 ?auto_125754 ) ( ON ?auto_125753 ?auto_125757 ) ( ON ?auto_125755 ?auto_125753 ) ( not ( = ?auto_125754 ?auto_125757 ) ) ( not ( = ?auto_125754 ?auto_125753 ) ) ( not ( = ?auto_125754 ?auto_125755 ) ) ( not ( = ?auto_125754 ?auto_125752 ) ) ( not ( = ?auto_125754 ?auto_125751 ) ) ( not ( = ?auto_125757 ?auto_125753 ) ) ( not ( = ?auto_125757 ?auto_125755 ) ) ( not ( = ?auto_125757 ?auto_125752 ) ) ( not ( = ?auto_125757 ?auto_125751 ) ) ( not ( = ?auto_125753 ?auto_125755 ) ) ( not ( = ?auto_125753 ?auto_125752 ) ) ( not ( = ?auto_125753 ?auto_125751 ) ) ( not ( = ?auto_125750 ?auto_125754 ) ) ( not ( = ?auto_125750 ?auto_125757 ) ) ( not ( = ?auto_125750 ?auto_125753 ) ) ( ON ?auto_125750 ?auto_125756 ) ( CLEAR ?auto_125750 ) ( not ( = ?auto_125750 ?auto_125756 ) ) ( not ( = ?auto_125751 ?auto_125756 ) ) ( not ( = ?auto_125752 ?auto_125756 ) ) ( not ( = ?auto_125755 ?auto_125756 ) ) ( not ( = ?auto_125754 ?auto_125756 ) ) ( not ( = ?auto_125757 ?auto_125756 ) ) ( not ( = ?auto_125753 ?auto_125756 ) ) ( HOLDING ?auto_125751 ) ( CLEAR ?auto_125752 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125754 ?auto_125757 ?auto_125753 ?auto_125755 ?auto_125752 ?auto_125751 )
      ( MAKE-3PILE ?auto_125750 ?auto_125751 ?auto_125752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125758 - BLOCK
      ?auto_125759 - BLOCK
      ?auto_125760 - BLOCK
    )
    :vars
    (
      ?auto_125761 - BLOCK
      ?auto_125763 - BLOCK
      ?auto_125764 - BLOCK
      ?auto_125765 - BLOCK
      ?auto_125762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125758 ?auto_125759 ) ) ( not ( = ?auto_125758 ?auto_125760 ) ) ( not ( = ?auto_125759 ?auto_125760 ) ) ( ON ?auto_125760 ?auto_125761 ) ( not ( = ?auto_125758 ?auto_125761 ) ) ( not ( = ?auto_125759 ?auto_125761 ) ) ( not ( = ?auto_125760 ?auto_125761 ) ) ( ON-TABLE ?auto_125763 ) ( ON ?auto_125764 ?auto_125763 ) ( ON ?auto_125765 ?auto_125764 ) ( ON ?auto_125761 ?auto_125765 ) ( not ( = ?auto_125763 ?auto_125764 ) ) ( not ( = ?auto_125763 ?auto_125765 ) ) ( not ( = ?auto_125763 ?auto_125761 ) ) ( not ( = ?auto_125763 ?auto_125760 ) ) ( not ( = ?auto_125763 ?auto_125759 ) ) ( not ( = ?auto_125764 ?auto_125765 ) ) ( not ( = ?auto_125764 ?auto_125761 ) ) ( not ( = ?auto_125764 ?auto_125760 ) ) ( not ( = ?auto_125764 ?auto_125759 ) ) ( not ( = ?auto_125765 ?auto_125761 ) ) ( not ( = ?auto_125765 ?auto_125760 ) ) ( not ( = ?auto_125765 ?auto_125759 ) ) ( not ( = ?auto_125758 ?auto_125763 ) ) ( not ( = ?auto_125758 ?auto_125764 ) ) ( not ( = ?auto_125758 ?auto_125765 ) ) ( ON ?auto_125758 ?auto_125762 ) ( not ( = ?auto_125758 ?auto_125762 ) ) ( not ( = ?auto_125759 ?auto_125762 ) ) ( not ( = ?auto_125760 ?auto_125762 ) ) ( not ( = ?auto_125761 ?auto_125762 ) ) ( not ( = ?auto_125763 ?auto_125762 ) ) ( not ( = ?auto_125764 ?auto_125762 ) ) ( not ( = ?auto_125765 ?auto_125762 ) ) ( CLEAR ?auto_125760 ) ( ON ?auto_125759 ?auto_125758 ) ( CLEAR ?auto_125759 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125762 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125762 ?auto_125758 )
      ( MAKE-3PILE ?auto_125758 ?auto_125759 ?auto_125760 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125766 - BLOCK
      ?auto_125767 - BLOCK
      ?auto_125768 - BLOCK
    )
    :vars
    (
      ?auto_125772 - BLOCK
      ?auto_125770 - BLOCK
      ?auto_125771 - BLOCK
      ?auto_125773 - BLOCK
      ?auto_125769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125766 ?auto_125767 ) ) ( not ( = ?auto_125766 ?auto_125768 ) ) ( not ( = ?auto_125767 ?auto_125768 ) ) ( not ( = ?auto_125766 ?auto_125772 ) ) ( not ( = ?auto_125767 ?auto_125772 ) ) ( not ( = ?auto_125768 ?auto_125772 ) ) ( ON-TABLE ?auto_125770 ) ( ON ?auto_125771 ?auto_125770 ) ( ON ?auto_125773 ?auto_125771 ) ( ON ?auto_125772 ?auto_125773 ) ( not ( = ?auto_125770 ?auto_125771 ) ) ( not ( = ?auto_125770 ?auto_125773 ) ) ( not ( = ?auto_125770 ?auto_125772 ) ) ( not ( = ?auto_125770 ?auto_125768 ) ) ( not ( = ?auto_125770 ?auto_125767 ) ) ( not ( = ?auto_125771 ?auto_125773 ) ) ( not ( = ?auto_125771 ?auto_125772 ) ) ( not ( = ?auto_125771 ?auto_125768 ) ) ( not ( = ?auto_125771 ?auto_125767 ) ) ( not ( = ?auto_125773 ?auto_125772 ) ) ( not ( = ?auto_125773 ?auto_125768 ) ) ( not ( = ?auto_125773 ?auto_125767 ) ) ( not ( = ?auto_125766 ?auto_125770 ) ) ( not ( = ?auto_125766 ?auto_125771 ) ) ( not ( = ?auto_125766 ?auto_125773 ) ) ( ON ?auto_125766 ?auto_125769 ) ( not ( = ?auto_125766 ?auto_125769 ) ) ( not ( = ?auto_125767 ?auto_125769 ) ) ( not ( = ?auto_125768 ?auto_125769 ) ) ( not ( = ?auto_125772 ?auto_125769 ) ) ( not ( = ?auto_125770 ?auto_125769 ) ) ( not ( = ?auto_125771 ?auto_125769 ) ) ( not ( = ?auto_125773 ?auto_125769 ) ) ( ON ?auto_125767 ?auto_125766 ) ( CLEAR ?auto_125767 ) ( ON-TABLE ?auto_125769 ) ( HOLDING ?auto_125768 ) ( CLEAR ?auto_125772 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125770 ?auto_125771 ?auto_125773 ?auto_125772 ?auto_125768 )
      ( MAKE-3PILE ?auto_125766 ?auto_125767 ?auto_125768 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125774 - BLOCK
      ?auto_125775 - BLOCK
      ?auto_125776 - BLOCK
    )
    :vars
    (
      ?auto_125780 - BLOCK
      ?auto_125781 - BLOCK
      ?auto_125777 - BLOCK
      ?auto_125779 - BLOCK
      ?auto_125778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125774 ?auto_125775 ) ) ( not ( = ?auto_125774 ?auto_125776 ) ) ( not ( = ?auto_125775 ?auto_125776 ) ) ( not ( = ?auto_125774 ?auto_125780 ) ) ( not ( = ?auto_125775 ?auto_125780 ) ) ( not ( = ?auto_125776 ?auto_125780 ) ) ( ON-TABLE ?auto_125781 ) ( ON ?auto_125777 ?auto_125781 ) ( ON ?auto_125779 ?auto_125777 ) ( ON ?auto_125780 ?auto_125779 ) ( not ( = ?auto_125781 ?auto_125777 ) ) ( not ( = ?auto_125781 ?auto_125779 ) ) ( not ( = ?auto_125781 ?auto_125780 ) ) ( not ( = ?auto_125781 ?auto_125776 ) ) ( not ( = ?auto_125781 ?auto_125775 ) ) ( not ( = ?auto_125777 ?auto_125779 ) ) ( not ( = ?auto_125777 ?auto_125780 ) ) ( not ( = ?auto_125777 ?auto_125776 ) ) ( not ( = ?auto_125777 ?auto_125775 ) ) ( not ( = ?auto_125779 ?auto_125780 ) ) ( not ( = ?auto_125779 ?auto_125776 ) ) ( not ( = ?auto_125779 ?auto_125775 ) ) ( not ( = ?auto_125774 ?auto_125781 ) ) ( not ( = ?auto_125774 ?auto_125777 ) ) ( not ( = ?auto_125774 ?auto_125779 ) ) ( ON ?auto_125774 ?auto_125778 ) ( not ( = ?auto_125774 ?auto_125778 ) ) ( not ( = ?auto_125775 ?auto_125778 ) ) ( not ( = ?auto_125776 ?auto_125778 ) ) ( not ( = ?auto_125780 ?auto_125778 ) ) ( not ( = ?auto_125781 ?auto_125778 ) ) ( not ( = ?auto_125777 ?auto_125778 ) ) ( not ( = ?auto_125779 ?auto_125778 ) ) ( ON ?auto_125775 ?auto_125774 ) ( ON-TABLE ?auto_125778 ) ( CLEAR ?auto_125780 ) ( ON ?auto_125776 ?auto_125775 ) ( CLEAR ?auto_125776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125778 ?auto_125774 ?auto_125775 )
      ( MAKE-3PILE ?auto_125774 ?auto_125775 ?auto_125776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125782 - BLOCK
      ?auto_125783 - BLOCK
      ?auto_125784 - BLOCK
    )
    :vars
    (
      ?auto_125786 - BLOCK
      ?auto_125785 - BLOCK
      ?auto_125789 - BLOCK
      ?auto_125787 - BLOCK
      ?auto_125788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125782 ?auto_125783 ) ) ( not ( = ?auto_125782 ?auto_125784 ) ) ( not ( = ?auto_125783 ?auto_125784 ) ) ( not ( = ?auto_125782 ?auto_125786 ) ) ( not ( = ?auto_125783 ?auto_125786 ) ) ( not ( = ?auto_125784 ?auto_125786 ) ) ( ON-TABLE ?auto_125785 ) ( ON ?auto_125789 ?auto_125785 ) ( ON ?auto_125787 ?auto_125789 ) ( not ( = ?auto_125785 ?auto_125789 ) ) ( not ( = ?auto_125785 ?auto_125787 ) ) ( not ( = ?auto_125785 ?auto_125786 ) ) ( not ( = ?auto_125785 ?auto_125784 ) ) ( not ( = ?auto_125785 ?auto_125783 ) ) ( not ( = ?auto_125789 ?auto_125787 ) ) ( not ( = ?auto_125789 ?auto_125786 ) ) ( not ( = ?auto_125789 ?auto_125784 ) ) ( not ( = ?auto_125789 ?auto_125783 ) ) ( not ( = ?auto_125787 ?auto_125786 ) ) ( not ( = ?auto_125787 ?auto_125784 ) ) ( not ( = ?auto_125787 ?auto_125783 ) ) ( not ( = ?auto_125782 ?auto_125785 ) ) ( not ( = ?auto_125782 ?auto_125789 ) ) ( not ( = ?auto_125782 ?auto_125787 ) ) ( ON ?auto_125782 ?auto_125788 ) ( not ( = ?auto_125782 ?auto_125788 ) ) ( not ( = ?auto_125783 ?auto_125788 ) ) ( not ( = ?auto_125784 ?auto_125788 ) ) ( not ( = ?auto_125786 ?auto_125788 ) ) ( not ( = ?auto_125785 ?auto_125788 ) ) ( not ( = ?auto_125789 ?auto_125788 ) ) ( not ( = ?auto_125787 ?auto_125788 ) ) ( ON ?auto_125783 ?auto_125782 ) ( ON-TABLE ?auto_125788 ) ( ON ?auto_125784 ?auto_125783 ) ( CLEAR ?auto_125784 ) ( HOLDING ?auto_125786 ) ( CLEAR ?auto_125787 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125785 ?auto_125789 ?auto_125787 ?auto_125786 )
      ( MAKE-3PILE ?auto_125782 ?auto_125783 ?auto_125784 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125790 - BLOCK
      ?auto_125791 - BLOCK
      ?auto_125792 - BLOCK
    )
    :vars
    (
      ?auto_125794 - BLOCK
      ?auto_125796 - BLOCK
      ?auto_125795 - BLOCK
      ?auto_125797 - BLOCK
      ?auto_125793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125790 ?auto_125791 ) ) ( not ( = ?auto_125790 ?auto_125792 ) ) ( not ( = ?auto_125791 ?auto_125792 ) ) ( not ( = ?auto_125790 ?auto_125794 ) ) ( not ( = ?auto_125791 ?auto_125794 ) ) ( not ( = ?auto_125792 ?auto_125794 ) ) ( ON-TABLE ?auto_125796 ) ( ON ?auto_125795 ?auto_125796 ) ( ON ?auto_125797 ?auto_125795 ) ( not ( = ?auto_125796 ?auto_125795 ) ) ( not ( = ?auto_125796 ?auto_125797 ) ) ( not ( = ?auto_125796 ?auto_125794 ) ) ( not ( = ?auto_125796 ?auto_125792 ) ) ( not ( = ?auto_125796 ?auto_125791 ) ) ( not ( = ?auto_125795 ?auto_125797 ) ) ( not ( = ?auto_125795 ?auto_125794 ) ) ( not ( = ?auto_125795 ?auto_125792 ) ) ( not ( = ?auto_125795 ?auto_125791 ) ) ( not ( = ?auto_125797 ?auto_125794 ) ) ( not ( = ?auto_125797 ?auto_125792 ) ) ( not ( = ?auto_125797 ?auto_125791 ) ) ( not ( = ?auto_125790 ?auto_125796 ) ) ( not ( = ?auto_125790 ?auto_125795 ) ) ( not ( = ?auto_125790 ?auto_125797 ) ) ( ON ?auto_125790 ?auto_125793 ) ( not ( = ?auto_125790 ?auto_125793 ) ) ( not ( = ?auto_125791 ?auto_125793 ) ) ( not ( = ?auto_125792 ?auto_125793 ) ) ( not ( = ?auto_125794 ?auto_125793 ) ) ( not ( = ?auto_125796 ?auto_125793 ) ) ( not ( = ?auto_125795 ?auto_125793 ) ) ( not ( = ?auto_125797 ?auto_125793 ) ) ( ON ?auto_125791 ?auto_125790 ) ( ON-TABLE ?auto_125793 ) ( ON ?auto_125792 ?auto_125791 ) ( CLEAR ?auto_125797 ) ( ON ?auto_125794 ?auto_125792 ) ( CLEAR ?auto_125794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125793 ?auto_125790 ?auto_125791 ?auto_125792 )
      ( MAKE-3PILE ?auto_125790 ?auto_125791 ?auto_125792 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125798 - BLOCK
      ?auto_125799 - BLOCK
      ?auto_125800 - BLOCK
    )
    :vars
    (
      ?auto_125801 - BLOCK
      ?auto_125802 - BLOCK
      ?auto_125805 - BLOCK
      ?auto_125803 - BLOCK
      ?auto_125804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125798 ?auto_125799 ) ) ( not ( = ?auto_125798 ?auto_125800 ) ) ( not ( = ?auto_125799 ?auto_125800 ) ) ( not ( = ?auto_125798 ?auto_125801 ) ) ( not ( = ?auto_125799 ?auto_125801 ) ) ( not ( = ?auto_125800 ?auto_125801 ) ) ( ON-TABLE ?auto_125802 ) ( ON ?auto_125805 ?auto_125802 ) ( not ( = ?auto_125802 ?auto_125805 ) ) ( not ( = ?auto_125802 ?auto_125803 ) ) ( not ( = ?auto_125802 ?auto_125801 ) ) ( not ( = ?auto_125802 ?auto_125800 ) ) ( not ( = ?auto_125802 ?auto_125799 ) ) ( not ( = ?auto_125805 ?auto_125803 ) ) ( not ( = ?auto_125805 ?auto_125801 ) ) ( not ( = ?auto_125805 ?auto_125800 ) ) ( not ( = ?auto_125805 ?auto_125799 ) ) ( not ( = ?auto_125803 ?auto_125801 ) ) ( not ( = ?auto_125803 ?auto_125800 ) ) ( not ( = ?auto_125803 ?auto_125799 ) ) ( not ( = ?auto_125798 ?auto_125802 ) ) ( not ( = ?auto_125798 ?auto_125805 ) ) ( not ( = ?auto_125798 ?auto_125803 ) ) ( ON ?auto_125798 ?auto_125804 ) ( not ( = ?auto_125798 ?auto_125804 ) ) ( not ( = ?auto_125799 ?auto_125804 ) ) ( not ( = ?auto_125800 ?auto_125804 ) ) ( not ( = ?auto_125801 ?auto_125804 ) ) ( not ( = ?auto_125802 ?auto_125804 ) ) ( not ( = ?auto_125805 ?auto_125804 ) ) ( not ( = ?auto_125803 ?auto_125804 ) ) ( ON ?auto_125799 ?auto_125798 ) ( ON-TABLE ?auto_125804 ) ( ON ?auto_125800 ?auto_125799 ) ( ON ?auto_125801 ?auto_125800 ) ( CLEAR ?auto_125801 ) ( HOLDING ?auto_125803 ) ( CLEAR ?auto_125805 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125802 ?auto_125805 ?auto_125803 )
      ( MAKE-3PILE ?auto_125798 ?auto_125799 ?auto_125800 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125806 - BLOCK
      ?auto_125807 - BLOCK
      ?auto_125808 - BLOCK
    )
    :vars
    (
      ?auto_125810 - BLOCK
      ?auto_125809 - BLOCK
      ?auto_125813 - BLOCK
      ?auto_125812 - BLOCK
      ?auto_125811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125806 ?auto_125807 ) ) ( not ( = ?auto_125806 ?auto_125808 ) ) ( not ( = ?auto_125807 ?auto_125808 ) ) ( not ( = ?auto_125806 ?auto_125810 ) ) ( not ( = ?auto_125807 ?auto_125810 ) ) ( not ( = ?auto_125808 ?auto_125810 ) ) ( ON-TABLE ?auto_125809 ) ( ON ?auto_125813 ?auto_125809 ) ( not ( = ?auto_125809 ?auto_125813 ) ) ( not ( = ?auto_125809 ?auto_125812 ) ) ( not ( = ?auto_125809 ?auto_125810 ) ) ( not ( = ?auto_125809 ?auto_125808 ) ) ( not ( = ?auto_125809 ?auto_125807 ) ) ( not ( = ?auto_125813 ?auto_125812 ) ) ( not ( = ?auto_125813 ?auto_125810 ) ) ( not ( = ?auto_125813 ?auto_125808 ) ) ( not ( = ?auto_125813 ?auto_125807 ) ) ( not ( = ?auto_125812 ?auto_125810 ) ) ( not ( = ?auto_125812 ?auto_125808 ) ) ( not ( = ?auto_125812 ?auto_125807 ) ) ( not ( = ?auto_125806 ?auto_125809 ) ) ( not ( = ?auto_125806 ?auto_125813 ) ) ( not ( = ?auto_125806 ?auto_125812 ) ) ( ON ?auto_125806 ?auto_125811 ) ( not ( = ?auto_125806 ?auto_125811 ) ) ( not ( = ?auto_125807 ?auto_125811 ) ) ( not ( = ?auto_125808 ?auto_125811 ) ) ( not ( = ?auto_125810 ?auto_125811 ) ) ( not ( = ?auto_125809 ?auto_125811 ) ) ( not ( = ?auto_125813 ?auto_125811 ) ) ( not ( = ?auto_125812 ?auto_125811 ) ) ( ON ?auto_125807 ?auto_125806 ) ( ON-TABLE ?auto_125811 ) ( ON ?auto_125808 ?auto_125807 ) ( ON ?auto_125810 ?auto_125808 ) ( CLEAR ?auto_125813 ) ( ON ?auto_125812 ?auto_125810 ) ( CLEAR ?auto_125812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125811 ?auto_125806 ?auto_125807 ?auto_125808 ?auto_125810 )
      ( MAKE-3PILE ?auto_125806 ?auto_125807 ?auto_125808 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125814 - BLOCK
      ?auto_125815 - BLOCK
      ?auto_125816 - BLOCK
    )
    :vars
    (
      ?auto_125821 - BLOCK
      ?auto_125817 - BLOCK
      ?auto_125818 - BLOCK
      ?auto_125819 - BLOCK
      ?auto_125820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125814 ?auto_125815 ) ) ( not ( = ?auto_125814 ?auto_125816 ) ) ( not ( = ?auto_125815 ?auto_125816 ) ) ( not ( = ?auto_125814 ?auto_125821 ) ) ( not ( = ?auto_125815 ?auto_125821 ) ) ( not ( = ?auto_125816 ?auto_125821 ) ) ( ON-TABLE ?auto_125817 ) ( not ( = ?auto_125817 ?auto_125818 ) ) ( not ( = ?auto_125817 ?auto_125819 ) ) ( not ( = ?auto_125817 ?auto_125821 ) ) ( not ( = ?auto_125817 ?auto_125816 ) ) ( not ( = ?auto_125817 ?auto_125815 ) ) ( not ( = ?auto_125818 ?auto_125819 ) ) ( not ( = ?auto_125818 ?auto_125821 ) ) ( not ( = ?auto_125818 ?auto_125816 ) ) ( not ( = ?auto_125818 ?auto_125815 ) ) ( not ( = ?auto_125819 ?auto_125821 ) ) ( not ( = ?auto_125819 ?auto_125816 ) ) ( not ( = ?auto_125819 ?auto_125815 ) ) ( not ( = ?auto_125814 ?auto_125817 ) ) ( not ( = ?auto_125814 ?auto_125818 ) ) ( not ( = ?auto_125814 ?auto_125819 ) ) ( ON ?auto_125814 ?auto_125820 ) ( not ( = ?auto_125814 ?auto_125820 ) ) ( not ( = ?auto_125815 ?auto_125820 ) ) ( not ( = ?auto_125816 ?auto_125820 ) ) ( not ( = ?auto_125821 ?auto_125820 ) ) ( not ( = ?auto_125817 ?auto_125820 ) ) ( not ( = ?auto_125818 ?auto_125820 ) ) ( not ( = ?auto_125819 ?auto_125820 ) ) ( ON ?auto_125815 ?auto_125814 ) ( ON-TABLE ?auto_125820 ) ( ON ?auto_125816 ?auto_125815 ) ( ON ?auto_125821 ?auto_125816 ) ( ON ?auto_125819 ?auto_125821 ) ( CLEAR ?auto_125819 ) ( HOLDING ?auto_125818 ) ( CLEAR ?auto_125817 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125817 ?auto_125818 )
      ( MAKE-3PILE ?auto_125814 ?auto_125815 ?auto_125816 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125822 - BLOCK
      ?auto_125823 - BLOCK
      ?auto_125824 - BLOCK
    )
    :vars
    (
      ?auto_125826 - BLOCK
      ?auto_125828 - BLOCK
      ?auto_125827 - BLOCK
      ?auto_125829 - BLOCK
      ?auto_125825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125822 ?auto_125823 ) ) ( not ( = ?auto_125822 ?auto_125824 ) ) ( not ( = ?auto_125823 ?auto_125824 ) ) ( not ( = ?auto_125822 ?auto_125826 ) ) ( not ( = ?auto_125823 ?auto_125826 ) ) ( not ( = ?auto_125824 ?auto_125826 ) ) ( ON-TABLE ?auto_125828 ) ( not ( = ?auto_125828 ?auto_125827 ) ) ( not ( = ?auto_125828 ?auto_125829 ) ) ( not ( = ?auto_125828 ?auto_125826 ) ) ( not ( = ?auto_125828 ?auto_125824 ) ) ( not ( = ?auto_125828 ?auto_125823 ) ) ( not ( = ?auto_125827 ?auto_125829 ) ) ( not ( = ?auto_125827 ?auto_125826 ) ) ( not ( = ?auto_125827 ?auto_125824 ) ) ( not ( = ?auto_125827 ?auto_125823 ) ) ( not ( = ?auto_125829 ?auto_125826 ) ) ( not ( = ?auto_125829 ?auto_125824 ) ) ( not ( = ?auto_125829 ?auto_125823 ) ) ( not ( = ?auto_125822 ?auto_125828 ) ) ( not ( = ?auto_125822 ?auto_125827 ) ) ( not ( = ?auto_125822 ?auto_125829 ) ) ( ON ?auto_125822 ?auto_125825 ) ( not ( = ?auto_125822 ?auto_125825 ) ) ( not ( = ?auto_125823 ?auto_125825 ) ) ( not ( = ?auto_125824 ?auto_125825 ) ) ( not ( = ?auto_125826 ?auto_125825 ) ) ( not ( = ?auto_125828 ?auto_125825 ) ) ( not ( = ?auto_125827 ?auto_125825 ) ) ( not ( = ?auto_125829 ?auto_125825 ) ) ( ON ?auto_125823 ?auto_125822 ) ( ON-TABLE ?auto_125825 ) ( ON ?auto_125824 ?auto_125823 ) ( ON ?auto_125826 ?auto_125824 ) ( ON ?auto_125829 ?auto_125826 ) ( CLEAR ?auto_125828 ) ( ON ?auto_125827 ?auto_125829 ) ( CLEAR ?auto_125827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125825 ?auto_125822 ?auto_125823 ?auto_125824 ?auto_125826 ?auto_125829 )
      ( MAKE-3PILE ?auto_125822 ?auto_125823 ?auto_125824 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125830 - BLOCK
      ?auto_125831 - BLOCK
      ?auto_125832 - BLOCK
    )
    :vars
    (
      ?auto_125837 - BLOCK
      ?auto_125835 - BLOCK
      ?auto_125836 - BLOCK
      ?auto_125833 - BLOCK
      ?auto_125834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125830 ?auto_125831 ) ) ( not ( = ?auto_125830 ?auto_125832 ) ) ( not ( = ?auto_125831 ?auto_125832 ) ) ( not ( = ?auto_125830 ?auto_125837 ) ) ( not ( = ?auto_125831 ?auto_125837 ) ) ( not ( = ?auto_125832 ?auto_125837 ) ) ( not ( = ?auto_125835 ?auto_125836 ) ) ( not ( = ?auto_125835 ?auto_125833 ) ) ( not ( = ?auto_125835 ?auto_125837 ) ) ( not ( = ?auto_125835 ?auto_125832 ) ) ( not ( = ?auto_125835 ?auto_125831 ) ) ( not ( = ?auto_125836 ?auto_125833 ) ) ( not ( = ?auto_125836 ?auto_125837 ) ) ( not ( = ?auto_125836 ?auto_125832 ) ) ( not ( = ?auto_125836 ?auto_125831 ) ) ( not ( = ?auto_125833 ?auto_125837 ) ) ( not ( = ?auto_125833 ?auto_125832 ) ) ( not ( = ?auto_125833 ?auto_125831 ) ) ( not ( = ?auto_125830 ?auto_125835 ) ) ( not ( = ?auto_125830 ?auto_125836 ) ) ( not ( = ?auto_125830 ?auto_125833 ) ) ( ON ?auto_125830 ?auto_125834 ) ( not ( = ?auto_125830 ?auto_125834 ) ) ( not ( = ?auto_125831 ?auto_125834 ) ) ( not ( = ?auto_125832 ?auto_125834 ) ) ( not ( = ?auto_125837 ?auto_125834 ) ) ( not ( = ?auto_125835 ?auto_125834 ) ) ( not ( = ?auto_125836 ?auto_125834 ) ) ( not ( = ?auto_125833 ?auto_125834 ) ) ( ON ?auto_125831 ?auto_125830 ) ( ON-TABLE ?auto_125834 ) ( ON ?auto_125832 ?auto_125831 ) ( ON ?auto_125837 ?auto_125832 ) ( ON ?auto_125833 ?auto_125837 ) ( ON ?auto_125836 ?auto_125833 ) ( CLEAR ?auto_125836 ) ( HOLDING ?auto_125835 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125835 )
      ( MAKE-3PILE ?auto_125830 ?auto_125831 ?auto_125832 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125838 - BLOCK
      ?auto_125839 - BLOCK
      ?auto_125840 - BLOCK
    )
    :vars
    (
      ?auto_125841 - BLOCK
      ?auto_125845 - BLOCK
      ?auto_125844 - BLOCK
      ?auto_125843 - BLOCK
      ?auto_125842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125838 ?auto_125839 ) ) ( not ( = ?auto_125838 ?auto_125840 ) ) ( not ( = ?auto_125839 ?auto_125840 ) ) ( not ( = ?auto_125838 ?auto_125841 ) ) ( not ( = ?auto_125839 ?auto_125841 ) ) ( not ( = ?auto_125840 ?auto_125841 ) ) ( not ( = ?auto_125845 ?auto_125844 ) ) ( not ( = ?auto_125845 ?auto_125843 ) ) ( not ( = ?auto_125845 ?auto_125841 ) ) ( not ( = ?auto_125845 ?auto_125840 ) ) ( not ( = ?auto_125845 ?auto_125839 ) ) ( not ( = ?auto_125844 ?auto_125843 ) ) ( not ( = ?auto_125844 ?auto_125841 ) ) ( not ( = ?auto_125844 ?auto_125840 ) ) ( not ( = ?auto_125844 ?auto_125839 ) ) ( not ( = ?auto_125843 ?auto_125841 ) ) ( not ( = ?auto_125843 ?auto_125840 ) ) ( not ( = ?auto_125843 ?auto_125839 ) ) ( not ( = ?auto_125838 ?auto_125845 ) ) ( not ( = ?auto_125838 ?auto_125844 ) ) ( not ( = ?auto_125838 ?auto_125843 ) ) ( ON ?auto_125838 ?auto_125842 ) ( not ( = ?auto_125838 ?auto_125842 ) ) ( not ( = ?auto_125839 ?auto_125842 ) ) ( not ( = ?auto_125840 ?auto_125842 ) ) ( not ( = ?auto_125841 ?auto_125842 ) ) ( not ( = ?auto_125845 ?auto_125842 ) ) ( not ( = ?auto_125844 ?auto_125842 ) ) ( not ( = ?auto_125843 ?auto_125842 ) ) ( ON ?auto_125839 ?auto_125838 ) ( ON-TABLE ?auto_125842 ) ( ON ?auto_125840 ?auto_125839 ) ( ON ?auto_125841 ?auto_125840 ) ( ON ?auto_125843 ?auto_125841 ) ( ON ?auto_125844 ?auto_125843 ) ( ON ?auto_125845 ?auto_125844 ) ( CLEAR ?auto_125845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125842 ?auto_125838 ?auto_125839 ?auto_125840 ?auto_125841 ?auto_125843 ?auto_125844 )
      ( MAKE-3PILE ?auto_125838 ?auto_125839 ?auto_125840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125849 - BLOCK
      ?auto_125850 - BLOCK
      ?auto_125851 - BLOCK
    )
    :vars
    (
      ?auto_125852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125852 ?auto_125851 ) ( CLEAR ?auto_125852 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125849 ) ( ON ?auto_125850 ?auto_125849 ) ( ON ?auto_125851 ?auto_125850 ) ( not ( = ?auto_125849 ?auto_125850 ) ) ( not ( = ?auto_125849 ?auto_125851 ) ) ( not ( = ?auto_125849 ?auto_125852 ) ) ( not ( = ?auto_125850 ?auto_125851 ) ) ( not ( = ?auto_125850 ?auto_125852 ) ) ( not ( = ?auto_125851 ?auto_125852 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125852 ?auto_125851 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125853 - BLOCK
      ?auto_125854 - BLOCK
      ?auto_125855 - BLOCK
    )
    :vars
    (
      ?auto_125856 - BLOCK
      ?auto_125857 - BLOCK
      ?auto_125858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125856 ?auto_125855 ) ( CLEAR ?auto_125856 ) ( ON-TABLE ?auto_125853 ) ( ON ?auto_125854 ?auto_125853 ) ( ON ?auto_125855 ?auto_125854 ) ( not ( = ?auto_125853 ?auto_125854 ) ) ( not ( = ?auto_125853 ?auto_125855 ) ) ( not ( = ?auto_125853 ?auto_125856 ) ) ( not ( = ?auto_125854 ?auto_125855 ) ) ( not ( = ?auto_125854 ?auto_125856 ) ) ( not ( = ?auto_125855 ?auto_125856 ) ) ( HOLDING ?auto_125857 ) ( CLEAR ?auto_125858 ) ( not ( = ?auto_125853 ?auto_125857 ) ) ( not ( = ?auto_125853 ?auto_125858 ) ) ( not ( = ?auto_125854 ?auto_125857 ) ) ( not ( = ?auto_125854 ?auto_125858 ) ) ( not ( = ?auto_125855 ?auto_125857 ) ) ( not ( = ?auto_125855 ?auto_125858 ) ) ( not ( = ?auto_125856 ?auto_125857 ) ) ( not ( = ?auto_125856 ?auto_125858 ) ) ( not ( = ?auto_125857 ?auto_125858 ) ) )
    :subtasks
    ( ( !STACK ?auto_125857 ?auto_125858 )
      ( MAKE-3PILE ?auto_125853 ?auto_125854 ?auto_125855 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125859 - BLOCK
      ?auto_125860 - BLOCK
      ?auto_125861 - BLOCK
    )
    :vars
    (
      ?auto_125862 - BLOCK
      ?auto_125863 - BLOCK
      ?auto_125864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125862 ?auto_125861 ) ( ON-TABLE ?auto_125859 ) ( ON ?auto_125860 ?auto_125859 ) ( ON ?auto_125861 ?auto_125860 ) ( not ( = ?auto_125859 ?auto_125860 ) ) ( not ( = ?auto_125859 ?auto_125861 ) ) ( not ( = ?auto_125859 ?auto_125862 ) ) ( not ( = ?auto_125860 ?auto_125861 ) ) ( not ( = ?auto_125860 ?auto_125862 ) ) ( not ( = ?auto_125861 ?auto_125862 ) ) ( CLEAR ?auto_125863 ) ( not ( = ?auto_125859 ?auto_125864 ) ) ( not ( = ?auto_125859 ?auto_125863 ) ) ( not ( = ?auto_125860 ?auto_125864 ) ) ( not ( = ?auto_125860 ?auto_125863 ) ) ( not ( = ?auto_125861 ?auto_125864 ) ) ( not ( = ?auto_125861 ?auto_125863 ) ) ( not ( = ?auto_125862 ?auto_125864 ) ) ( not ( = ?auto_125862 ?auto_125863 ) ) ( not ( = ?auto_125864 ?auto_125863 ) ) ( ON ?auto_125864 ?auto_125862 ) ( CLEAR ?auto_125864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125859 ?auto_125860 ?auto_125861 ?auto_125862 )
      ( MAKE-3PILE ?auto_125859 ?auto_125860 ?auto_125861 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125865 - BLOCK
      ?auto_125866 - BLOCK
      ?auto_125867 - BLOCK
    )
    :vars
    (
      ?auto_125868 - BLOCK
      ?auto_125870 - BLOCK
      ?auto_125869 - BLOCK
      ?auto_125871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125868 ?auto_125867 ) ( ON-TABLE ?auto_125865 ) ( ON ?auto_125866 ?auto_125865 ) ( ON ?auto_125867 ?auto_125866 ) ( not ( = ?auto_125865 ?auto_125866 ) ) ( not ( = ?auto_125865 ?auto_125867 ) ) ( not ( = ?auto_125865 ?auto_125868 ) ) ( not ( = ?auto_125866 ?auto_125867 ) ) ( not ( = ?auto_125866 ?auto_125868 ) ) ( not ( = ?auto_125867 ?auto_125868 ) ) ( not ( = ?auto_125865 ?auto_125870 ) ) ( not ( = ?auto_125865 ?auto_125869 ) ) ( not ( = ?auto_125866 ?auto_125870 ) ) ( not ( = ?auto_125866 ?auto_125869 ) ) ( not ( = ?auto_125867 ?auto_125870 ) ) ( not ( = ?auto_125867 ?auto_125869 ) ) ( not ( = ?auto_125868 ?auto_125870 ) ) ( not ( = ?auto_125868 ?auto_125869 ) ) ( not ( = ?auto_125870 ?auto_125869 ) ) ( ON ?auto_125870 ?auto_125868 ) ( CLEAR ?auto_125870 ) ( HOLDING ?auto_125869 ) ( CLEAR ?auto_125871 ) ( ON-TABLE ?auto_125871 ) ( not ( = ?auto_125871 ?auto_125869 ) ) ( not ( = ?auto_125865 ?auto_125871 ) ) ( not ( = ?auto_125866 ?auto_125871 ) ) ( not ( = ?auto_125867 ?auto_125871 ) ) ( not ( = ?auto_125868 ?auto_125871 ) ) ( not ( = ?auto_125870 ?auto_125871 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125871 ?auto_125869 )
      ( MAKE-3PILE ?auto_125865 ?auto_125866 ?auto_125867 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125872 - BLOCK
      ?auto_125873 - BLOCK
      ?auto_125874 - BLOCK
    )
    :vars
    (
      ?auto_125876 - BLOCK
      ?auto_125878 - BLOCK
      ?auto_125877 - BLOCK
      ?auto_125875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125876 ?auto_125874 ) ( ON-TABLE ?auto_125872 ) ( ON ?auto_125873 ?auto_125872 ) ( ON ?auto_125874 ?auto_125873 ) ( not ( = ?auto_125872 ?auto_125873 ) ) ( not ( = ?auto_125872 ?auto_125874 ) ) ( not ( = ?auto_125872 ?auto_125876 ) ) ( not ( = ?auto_125873 ?auto_125874 ) ) ( not ( = ?auto_125873 ?auto_125876 ) ) ( not ( = ?auto_125874 ?auto_125876 ) ) ( not ( = ?auto_125872 ?auto_125878 ) ) ( not ( = ?auto_125872 ?auto_125877 ) ) ( not ( = ?auto_125873 ?auto_125878 ) ) ( not ( = ?auto_125873 ?auto_125877 ) ) ( not ( = ?auto_125874 ?auto_125878 ) ) ( not ( = ?auto_125874 ?auto_125877 ) ) ( not ( = ?auto_125876 ?auto_125878 ) ) ( not ( = ?auto_125876 ?auto_125877 ) ) ( not ( = ?auto_125878 ?auto_125877 ) ) ( ON ?auto_125878 ?auto_125876 ) ( CLEAR ?auto_125875 ) ( ON-TABLE ?auto_125875 ) ( not ( = ?auto_125875 ?auto_125877 ) ) ( not ( = ?auto_125872 ?auto_125875 ) ) ( not ( = ?auto_125873 ?auto_125875 ) ) ( not ( = ?auto_125874 ?auto_125875 ) ) ( not ( = ?auto_125876 ?auto_125875 ) ) ( not ( = ?auto_125878 ?auto_125875 ) ) ( ON ?auto_125877 ?auto_125878 ) ( CLEAR ?auto_125877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125872 ?auto_125873 ?auto_125874 ?auto_125876 ?auto_125878 )
      ( MAKE-3PILE ?auto_125872 ?auto_125873 ?auto_125874 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125879 - BLOCK
      ?auto_125880 - BLOCK
      ?auto_125881 - BLOCK
    )
    :vars
    (
      ?auto_125883 - BLOCK
      ?auto_125884 - BLOCK
      ?auto_125882 - BLOCK
      ?auto_125885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125883 ?auto_125881 ) ( ON-TABLE ?auto_125879 ) ( ON ?auto_125880 ?auto_125879 ) ( ON ?auto_125881 ?auto_125880 ) ( not ( = ?auto_125879 ?auto_125880 ) ) ( not ( = ?auto_125879 ?auto_125881 ) ) ( not ( = ?auto_125879 ?auto_125883 ) ) ( not ( = ?auto_125880 ?auto_125881 ) ) ( not ( = ?auto_125880 ?auto_125883 ) ) ( not ( = ?auto_125881 ?auto_125883 ) ) ( not ( = ?auto_125879 ?auto_125884 ) ) ( not ( = ?auto_125879 ?auto_125882 ) ) ( not ( = ?auto_125880 ?auto_125884 ) ) ( not ( = ?auto_125880 ?auto_125882 ) ) ( not ( = ?auto_125881 ?auto_125884 ) ) ( not ( = ?auto_125881 ?auto_125882 ) ) ( not ( = ?auto_125883 ?auto_125884 ) ) ( not ( = ?auto_125883 ?auto_125882 ) ) ( not ( = ?auto_125884 ?auto_125882 ) ) ( ON ?auto_125884 ?auto_125883 ) ( not ( = ?auto_125885 ?auto_125882 ) ) ( not ( = ?auto_125879 ?auto_125885 ) ) ( not ( = ?auto_125880 ?auto_125885 ) ) ( not ( = ?auto_125881 ?auto_125885 ) ) ( not ( = ?auto_125883 ?auto_125885 ) ) ( not ( = ?auto_125884 ?auto_125885 ) ) ( ON ?auto_125882 ?auto_125884 ) ( CLEAR ?auto_125882 ) ( HOLDING ?auto_125885 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125885 )
      ( MAKE-3PILE ?auto_125879 ?auto_125880 ?auto_125881 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125886 - BLOCK
      ?auto_125887 - BLOCK
      ?auto_125888 - BLOCK
    )
    :vars
    (
      ?auto_125889 - BLOCK
      ?auto_125892 - BLOCK
      ?auto_125890 - BLOCK
      ?auto_125891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125889 ?auto_125888 ) ( ON-TABLE ?auto_125886 ) ( ON ?auto_125887 ?auto_125886 ) ( ON ?auto_125888 ?auto_125887 ) ( not ( = ?auto_125886 ?auto_125887 ) ) ( not ( = ?auto_125886 ?auto_125888 ) ) ( not ( = ?auto_125886 ?auto_125889 ) ) ( not ( = ?auto_125887 ?auto_125888 ) ) ( not ( = ?auto_125887 ?auto_125889 ) ) ( not ( = ?auto_125888 ?auto_125889 ) ) ( not ( = ?auto_125886 ?auto_125892 ) ) ( not ( = ?auto_125886 ?auto_125890 ) ) ( not ( = ?auto_125887 ?auto_125892 ) ) ( not ( = ?auto_125887 ?auto_125890 ) ) ( not ( = ?auto_125888 ?auto_125892 ) ) ( not ( = ?auto_125888 ?auto_125890 ) ) ( not ( = ?auto_125889 ?auto_125892 ) ) ( not ( = ?auto_125889 ?auto_125890 ) ) ( not ( = ?auto_125892 ?auto_125890 ) ) ( ON ?auto_125892 ?auto_125889 ) ( not ( = ?auto_125891 ?auto_125890 ) ) ( not ( = ?auto_125886 ?auto_125891 ) ) ( not ( = ?auto_125887 ?auto_125891 ) ) ( not ( = ?auto_125888 ?auto_125891 ) ) ( not ( = ?auto_125889 ?auto_125891 ) ) ( not ( = ?auto_125892 ?auto_125891 ) ) ( ON ?auto_125890 ?auto_125892 ) ( ON ?auto_125891 ?auto_125890 ) ( CLEAR ?auto_125891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125886 ?auto_125887 ?auto_125888 ?auto_125889 ?auto_125892 ?auto_125890 )
      ( MAKE-3PILE ?auto_125886 ?auto_125887 ?auto_125888 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125893 - BLOCK
      ?auto_125894 - BLOCK
      ?auto_125895 - BLOCK
    )
    :vars
    (
      ?auto_125898 - BLOCK
      ?auto_125896 - BLOCK
      ?auto_125899 - BLOCK
      ?auto_125897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125898 ?auto_125895 ) ( ON-TABLE ?auto_125893 ) ( ON ?auto_125894 ?auto_125893 ) ( ON ?auto_125895 ?auto_125894 ) ( not ( = ?auto_125893 ?auto_125894 ) ) ( not ( = ?auto_125893 ?auto_125895 ) ) ( not ( = ?auto_125893 ?auto_125898 ) ) ( not ( = ?auto_125894 ?auto_125895 ) ) ( not ( = ?auto_125894 ?auto_125898 ) ) ( not ( = ?auto_125895 ?auto_125898 ) ) ( not ( = ?auto_125893 ?auto_125896 ) ) ( not ( = ?auto_125893 ?auto_125899 ) ) ( not ( = ?auto_125894 ?auto_125896 ) ) ( not ( = ?auto_125894 ?auto_125899 ) ) ( not ( = ?auto_125895 ?auto_125896 ) ) ( not ( = ?auto_125895 ?auto_125899 ) ) ( not ( = ?auto_125898 ?auto_125896 ) ) ( not ( = ?auto_125898 ?auto_125899 ) ) ( not ( = ?auto_125896 ?auto_125899 ) ) ( ON ?auto_125896 ?auto_125898 ) ( not ( = ?auto_125897 ?auto_125899 ) ) ( not ( = ?auto_125893 ?auto_125897 ) ) ( not ( = ?auto_125894 ?auto_125897 ) ) ( not ( = ?auto_125895 ?auto_125897 ) ) ( not ( = ?auto_125898 ?auto_125897 ) ) ( not ( = ?auto_125896 ?auto_125897 ) ) ( ON ?auto_125899 ?auto_125896 ) ( HOLDING ?auto_125897 ) ( CLEAR ?auto_125899 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_125893 ?auto_125894 ?auto_125895 ?auto_125898 ?auto_125896 ?auto_125899 ?auto_125897 )
      ( MAKE-3PILE ?auto_125893 ?auto_125894 ?auto_125895 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125900 - BLOCK
      ?auto_125901 - BLOCK
      ?auto_125902 - BLOCK
    )
    :vars
    (
      ?auto_125906 - BLOCK
      ?auto_125905 - BLOCK
      ?auto_125904 - BLOCK
      ?auto_125903 - BLOCK
      ?auto_125907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125906 ?auto_125902 ) ( ON-TABLE ?auto_125900 ) ( ON ?auto_125901 ?auto_125900 ) ( ON ?auto_125902 ?auto_125901 ) ( not ( = ?auto_125900 ?auto_125901 ) ) ( not ( = ?auto_125900 ?auto_125902 ) ) ( not ( = ?auto_125900 ?auto_125906 ) ) ( not ( = ?auto_125901 ?auto_125902 ) ) ( not ( = ?auto_125901 ?auto_125906 ) ) ( not ( = ?auto_125902 ?auto_125906 ) ) ( not ( = ?auto_125900 ?auto_125905 ) ) ( not ( = ?auto_125900 ?auto_125904 ) ) ( not ( = ?auto_125901 ?auto_125905 ) ) ( not ( = ?auto_125901 ?auto_125904 ) ) ( not ( = ?auto_125902 ?auto_125905 ) ) ( not ( = ?auto_125902 ?auto_125904 ) ) ( not ( = ?auto_125906 ?auto_125905 ) ) ( not ( = ?auto_125906 ?auto_125904 ) ) ( not ( = ?auto_125905 ?auto_125904 ) ) ( ON ?auto_125905 ?auto_125906 ) ( not ( = ?auto_125903 ?auto_125904 ) ) ( not ( = ?auto_125900 ?auto_125903 ) ) ( not ( = ?auto_125901 ?auto_125903 ) ) ( not ( = ?auto_125902 ?auto_125903 ) ) ( not ( = ?auto_125906 ?auto_125903 ) ) ( not ( = ?auto_125905 ?auto_125903 ) ) ( ON ?auto_125904 ?auto_125905 ) ( CLEAR ?auto_125904 ) ( ON ?auto_125903 ?auto_125907 ) ( CLEAR ?auto_125903 ) ( HAND-EMPTY ) ( not ( = ?auto_125900 ?auto_125907 ) ) ( not ( = ?auto_125901 ?auto_125907 ) ) ( not ( = ?auto_125902 ?auto_125907 ) ) ( not ( = ?auto_125906 ?auto_125907 ) ) ( not ( = ?auto_125905 ?auto_125907 ) ) ( not ( = ?auto_125904 ?auto_125907 ) ) ( not ( = ?auto_125903 ?auto_125907 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_125903 ?auto_125907 )
      ( MAKE-3PILE ?auto_125900 ?auto_125901 ?auto_125902 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125908 - BLOCK
      ?auto_125909 - BLOCK
      ?auto_125910 - BLOCK
    )
    :vars
    (
      ?auto_125914 - BLOCK
      ?auto_125912 - BLOCK
      ?auto_125913 - BLOCK
      ?auto_125911 - BLOCK
      ?auto_125915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125914 ?auto_125910 ) ( ON-TABLE ?auto_125908 ) ( ON ?auto_125909 ?auto_125908 ) ( ON ?auto_125910 ?auto_125909 ) ( not ( = ?auto_125908 ?auto_125909 ) ) ( not ( = ?auto_125908 ?auto_125910 ) ) ( not ( = ?auto_125908 ?auto_125914 ) ) ( not ( = ?auto_125909 ?auto_125910 ) ) ( not ( = ?auto_125909 ?auto_125914 ) ) ( not ( = ?auto_125910 ?auto_125914 ) ) ( not ( = ?auto_125908 ?auto_125912 ) ) ( not ( = ?auto_125908 ?auto_125913 ) ) ( not ( = ?auto_125909 ?auto_125912 ) ) ( not ( = ?auto_125909 ?auto_125913 ) ) ( not ( = ?auto_125910 ?auto_125912 ) ) ( not ( = ?auto_125910 ?auto_125913 ) ) ( not ( = ?auto_125914 ?auto_125912 ) ) ( not ( = ?auto_125914 ?auto_125913 ) ) ( not ( = ?auto_125912 ?auto_125913 ) ) ( ON ?auto_125912 ?auto_125914 ) ( not ( = ?auto_125911 ?auto_125913 ) ) ( not ( = ?auto_125908 ?auto_125911 ) ) ( not ( = ?auto_125909 ?auto_125911 ) ) ( not ( = ?auto_125910 ?auto_125911 ) ) ( not ( = ?auto_125914 ?auto_125911 ) ) ( not ( = ?auto_125912 ?auto_125911 ) ) ( ON ?auto_125911 ?auto_125915 ) ( CLEAR ?auto_125911 ) ( not ( = ?auto_125908 ?auto_125915 ) ) ( not ( = ?auto_125909 ?auto_125915 ) ) ( not ( = ?auto_125910 ?auto_125915 ) ) ( not ( = ?auto_125914 ?auto_125915 ) ) ( not ( = ?auto_125912 ?auto_125915 ) ) ( not ( = ?auto_125913 ?auto_125915 ) ) ( not ( = ?auto_125911 ?auto_125915 ) ) ( HOLDING ?auto_125913 ) ( CLEAR ?auto_125912 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125908 ?auto_125909 ?auto_125910 ?auto_125914 ?auto_125912 ?auto_125913 )
      ( MAKE-3PILE ?auto_125908 ?auto_125909 ?auto_125910 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125916 - BLOCK
      ?auto_125917 - BLOCK
      ?auto_125918 - BLOCK
    )
    :vars
    (
      ?auto_125923 - BLOCK
      ?auto_125921 - BLOCK
      ?auto_125920 - BLOCK
      ?auto_125919 - BLOCK
      ?auto_125922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125923 ?auto_125918 ) ( ON-TABLE ?auto_125916 ) ( ON ?auto_125917 ?auto_125916 ) ( ON ?auto_125918 ?auto_125917 ) ( not ( = ?auto_125916 ?auto_125917 ) ) ( not ( = ?auto_125916 ?auto_125918 ) ) ( not ( = ?auto_125916 ?auto_125923 ) ) ( not ( = ?auto_125917 ?auto_125918 ) ) ( not ( = ?auto_125917 ?auto_125923 ) ) ( not ( = ?auto_125918 ?auto_125923 ) ) ( not ( = ?auto_125916 ?auto_125921 ) ) ( not ( = ?auto_125916 ?auto_125920 ) ) ( not ( = ?auto_125917 ?auto_125921 ) ) ( not ( = ?auto_125917 ?auto_125920 ) ) ( not ( = ?auto_125918 ?auto_125921 ) ) ( not ( = ?auto_125918 ?auto_125920 ) ) ( not ( = ?auto_125923 ?auto_125921 ) ) ( not ( = ?auto_125923 ?auto_125920 ) ) ( not ( = ?auto_125921 ?auto_125920 ) ) ( ON ?auto_125921 ?auto_125923 ) ( not ( = ?auto_125919 ?auto_125920 ) ) ( not ( = ?auto_125916 ?auto_125919 ) ) ( not ( = ?auto_125917 ?auto_125919 ) ) ( not ( = ?auto_125918 ?auto_125919 ) ) ( not ( = ?auto_125923 ?auto_125919 ) ) ( not ( = ?auto_125921 ?auto_125919 ) ) ( ON ?auto_125919 ?auto_125922 ) ( not ( = ?auto_125916 ?auto_125922 ) ) ( not ( = ?auto_125917 ?auto_125922 ) ) ( not ( = ?auto_125918 ?auto_125922 ) ) ( not ( = ?auto_125923 ?auto_125922 ) ) ( not ( = ?auto_125921 ?auto_125922 ) ) ( not ( = ?auto_125920 ?auto_125922 ) ) ( not ( = ?auto_125919 ?auto_125922 ) ) ( CLEAR ?auto_125921 ) ( ON ?auto_125920 ?auto_125919 ) ( CLEAR ?auto_125920 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_125922 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125922 ?auto_125919 )
      ( MAKE-3PILE ?auto_125916 ?auto_125917 ?auto_125918 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125924 - BLOCK
      ?auto_125925 - BLOCK
      ?auto_125926 - BLOCK
    )
    :vars
    (
      ?auto_125928 - BLOCK
      ?auto_125930 - BLOCK
      ?auto_125929 - BLOCK
      ?auto_125927 - BLOCK
      ?auto_125931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125928 ?auto_125926 ) ( ON-TABLE ?auto_125924 ) ( ON ?auto_125925 ?auto_125924 ) ( ON ?auto_125926 ?auto_125925 ) ( not ( = ?auto_125924 ?auto_125925 ) ) ( not ( = ?auto_125924 ?auto_125926 ) ) ( not ( = ?auto_125924 ?auto_125928 ) ) ( not ( = ?auto_125925 ?auto_125926 ) ) ( not ( = ?auto_125925 ?auto_125928 ) ) ( not ( = ?auto_125926 ?auto_125928 ) ) ( not ( = ?auto_125924 ?auto_125930 ) ) ( not ( = ?auto_125924 ?auto_125929 ) ) ( not ( = ?auto_125925 ?auto_125930 ) ) ( not ( = ?auto_125925 ?auto_125929 ) ) ( not ( = ?auto_125926 ?auto_125930 ) ) ( not ( = ?auto_125926 ?auto_125929 ) ) ( not ( = ?auto_125928 ?auto_125930 ) ) ( not ( = ?auto_125928 ?auto_125929 ) ) ( not ( = ?auto_125930 ?auto_125929 ) ) ( not ( = ?auto_125927 ?auto_125929 ) ) ( not ( = ?auto_125924 ?auto_125927 ) ) ( not ( = ?auto_125925 ?auto_125927 ) ) ( not ( = ?auto_125926 ?auto_125927 ) ) ( not ( = ?auto_125928 ?auto_125927 ) ) ( not ( = ?auto_125930 ?auto_125927 ) ) ( ON ?auto_125927 ?auto_125931 ) ( not ( = ?auto_125924 ?auto_125931 ) ) ( not ( = ?auto_125925 ?auto_125931 ) ) ( not ( = ?auto_125926 ?auto_125931 ) ) ( not ( = ?auto_125928 ?auto_125931 ) ) ( not ( = ?auto_125930 ?auto_125931 ) ) ( not ( = ?auto_125929 ?auto_125931 ) ) ( not ( = ?auto_125927 ?auto_125931 ) ) ( ON ?auto_125929 ?auto_125927 ) ( CLEAR ?auto_125929 ) ( ON-TABLE ?auto_125931 ) ( HOLDING ?auto_125930 ) ( CLEAR ?auto_125928 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125924 ?auto_125925 ?auto_125926 ?auto_125928 ?auto_125930 )
      ( MAKE-3PILE ?auto_125924 ?auto_125925 ?auto_125926 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125932 - BLOCK
      ?auto_125933 - BLOCK
      ?auto_125934 - BLOCK
    )
    :vars
    (
      ?auto_125937 - BLOCK
      ?auto_125935 - BLOCK
      ?auto_125939 - BLOCK
      ?auto_125936 - BLOCK
      ?auto_125938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_125937 ?auto_125934 ) ( ON-TABLE ?auto_125932 ) ( ON ?auto_125933 ?auto_125932 ) ( ON ?auto_125934 ?auto_125933 ) ( not ( = ?auto_125932 ?auto_125933 ) ) ( not ( = ?auto_125932 ?auto_125934 ) ) ( not ( = ?auto_125932 ?auto_125937 ) ) ( not ( = ?auto_125933 ?auto_125934 ) ) ( not ( = ?auto_125933 ?auto_125937 ) ) ( not ( = ?auto_125934 ?auto_125937 ) ) ( not ( = ?auto_125932 ?auto_125935 ) ) ( not ( = ?auto_125932 ?auto_125939 ) ) ( not ( = ?auto_125933 ?auto_125935 ) ) ( not ( = ?auto_125933 ?auto_125939 ) ) ( not ( = ?auto_125934 ?auto_125935 ) ) ( not ( = ?auto_125934 ?auto_125939 ) ) ( not ( = ?auto_125937 ?auto_125935 ) ) ( not ( = ?auto_125937 ?auto_125939 ) ) ( not ( = ?auto_125935 ?auto_125939 ) ) ( not ( = ?auto_125936 ?auto_125939 ) ) ( not ( = ?auto_125932 ?auto_125936 ) ) ( not ( = ?auto_125933 ?auto_125936 ) ) ( not ( = ?auto_125934 ?auto_125936 ) ) ( not ( = ?auto_125937 ?auto_125936 ) ) ( not ( = ?auto_125935 ?auto_125936 ) ) ( ON ?auto_125936 ?auto_125938 ) ( not ( = ?auto_125932 ?auto_125938 ) ) ( not ( = ?auto_125933 ?auto_125938 ) ) ( not ( = ?auto_125934 ?auto_125938 ) ) ( not ( = ?auto_125937 ?auto_125938 ) ) ( not ( = ?auto_125935 ?auto_125938 ) ) ( not ( = ?auto_125939 ?auto_125938 ) ) ( not ( = ?auto_125936 ?auto_125938 ) ) ( ON ?auto_125939 ?auto_125936 ) ( ON-TABLE ?auto_125938 ) ( CLEAR ?auto_125937 ) ( ON ?auto_125935 ?auto_125939 ) ( CLEAR ?auto_125935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_125938 ?auto_125936 ?auto_125939 )
      ( MAKE-3PILE ?auto_125932 ?auto_125933 ?auto_125934 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125956 - BLOCK
      ?auto_125957 - BLOCK
      ?auto_125958 - BLOCK
    )
    :vars
    (
      ?auto_125963 - BLOCK
      ?auto_125962 - BLOCK
      ?auto_125959 - BLOCK
      ?auto_125960 - BLOCK
      ?auto_125961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125956 ) ( ON ?auto_125957 ?auto_125956 ) ( not ( = ?auto_125956 ?auto_125957 ) ) ( not ( = ?auto_125956 ?auto_125958 ) ) ( not ( = ?auto_125956 ?auto_125963 ) ) ( not ( = ?auto_125957 ?auto_125958 ) ) ( not ( = ?auto_125957 ?auto_125963 ) ) ( not ( = ?auto_125958 ?auto_125963 ) ) ( not ( = ?auto_125956 ?auto_125962 ) ) ( not ( = ?auto_125956 ?auto_125959 ) ) ( not ( = ?auto_125957 ?auto_125962 ) ) ( not ( = ?auto_125957 ?auto_125959 ) ) ( not ( = ?auto_125958 ?auto_125962 ) ) ( not ( = ?auto_125958 ?auto_125959 ) ) ( not ( = ?auto_125963 ?auto_125962 ) ) ( not ( = ?auto_125963 ?auto_125959 ) ) ( not ( = ?auto_125962 ?auto_125959 ) ) ( not ( = ?auto_125960 ?auto_125959 ) ) ( not ( = ?auto_125956 ?auto_125960 ) ) ( not ( = ?auto_125957 ?auto_125960 ) ) ( not ( = ?auto_125958 ?auto_125960 ) ) ( not ( = ?auto_125963 ?auto_125960 ) ) ( not ( = ?auto_125962 ?auto_125960 ) ) ( ON ?auto_125960 ?auto_125961 ) ( not ( = ?auto_125956 ?auto_125961 ) ) ( not ( = ?auto_125957 ?auto_125961 ) ) ( not ( = ?auto_125958 ?auto_125961 ) ) ( not ( = ?auto_125963 ?auto_125961 ) ) ( not ( = ?auto_125962 ?auto_125961 ) ) ( not ( = ?auto_125959 ?auto_125961 ) ) ( not ( = ?auto_125960 ?auto_125961 ) ) ( ON ?auto_125959 ?auto_125960 ) ( ON-TABLE ?auto_125961 ) ( ON ?auto_125962 ?auto_125959 ) ( ON ?auto_125963 ?auto_125962 ) ( CLEAR ?auto_125963 ) ( HOLDING ?auto_125958 ) ( CLEAR ?auto_125957 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_125956 ?auto_125957 ?auto_125958 ?auto_125963 )
      ( MAKE-3PILE ?auto_125956 ?auto_125957 ?auto_125958 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125964 - BLOCK
      ?auto_125965 - BLOCK
      ?auto_125966 - BLOCK
    )
    :vars
    (
      ?auto_125970 - BLOCK
      ?auto_125969 - BLOCK
      ?auto_125968 - BLOCK
      ?auto_125967 - BLOCK
      ?auto_125971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125964 ) ( ON ?auto_125965 ?auto_125964 ) ( not ( = ?auto_125964 ?auto_125965 ) ) ( not ( = ?auto_125964 ?auto_125966 ) ) ( not ( = ?auto_125964 ?auto_125970 ) ) ( not ( = ?auto_125965 ?auto_125966 ) ) ( not ( = ?auto_125965 ?auto_125970 ) ) ( not ( = ?auto_125966 ?auto_125970 ) ) ( not ( = ?auto_125964 ?auto_125969 ) ) ( not ( = ?auto_125964 ?auto_125968 ) ) ( not ( = ?auto_125965 ?auto_125969 ) ) ( not ( = ?auto_125965 ?auto_125968 ) ) ( not ( = ?auto_125966 ?auto_125969 ) ) ( not ( = ?auto_125966 ?auto_125968 ) ) ( not ( = ?auto_125970 ?auto_125969 ) ) ( not ( = ?auto_125970 ?auto_125968 ) ) ( not ( = ?auto_125969 ?auto_125968 ) ) ( not ( = ?auto_125967 ?auto_125968 ) ) ( not ( = ?auto_125964 ?auto_125967 ) ) ( not ( = ?auto_125965 ?auto_125967 ) ) ( not ( = ?auto_125966 ?auto_125967 ) ) ( not ( = ?auto_125970 ?auto_125967 ) ) ( not ( = ?auto_125969 ?auto_125967 ) ) ( ON ?auto_125967 ?auto_125971 ) ( not ( = ?auto_125964 ?auto_125971 ) ) ( not ( = ?auto_125965 ?auto_125971 ) ) ( not ( = ?auto_125966 ?auto_125971 ) ) ( not ( = ?auto_125970 ?auto_125971 ) ) ( not ( = ?auto_125969 ?auto_125971 ) ) ( not ( = ?auto_125968 ?auto_125971 ) ) ( not ( = ?auto_125967 ?auto_125971 ) ) ( ON ?auto_125968 ?auto_125967 ) ( ON-TABLE ?auto_125971 ) ( ON ?auto_125969 ?auto_125968 ) ( ON ?auto_125970 ?auto_125969 ) ( CLEAR ?auto_125965 ) ( ON ?auto_125966 ?auto_125970 ) ( CLEAR ?auto_125966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_125971 ?auto_125967 ?auto_125968 ?auto_125969 ?auto_125970 )
      ( MAKE-3PILE ?auto_125964 ?auto_125965 ?auto_125966 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125972 - BLOCK
      ?auto_125973 - BLOCK
      ?auto_125974 - BLOCK
    )
    :vars
    (
      ?auto_125978 - BLOCK
      ?auto_125975 - BLOCK
      ?auto_125976 - BLOCK
      ?auto_125979 - BLOCK
      ?auto_125977 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125972 ) ( not ( = ?auto_125972 ?auto_125973 ) ) ( not ( = ?auto_125972 ?auto_125974 ) ) ( not ( = ?auto_125972 ?auto_125978 ) ) ( not ( = ?auto_125973 ?auto_125974 ) ) ( not ( = ?auto_125973 ?auto_125978 ) ) ( not ( = ?auto_125974 ?auto_125978 ) ) ( not ( = ?auto_125972 ?auto_125975 ) ) ( not ( = ?auto_125972 ?auto_125976 ) ) ( not ( = ?auto_125973 ?auto_125975 ) ) ( not ( = ?auto_125973 ?auto_125976 ) ) ( not ( = ?auto_125974 ?auto_125975 ) ) ( not ( = ?auto_125974 ?auto_125976 ) ) ( not ( = ?auto_125978 ?auto_125975 ) ) ( not ( = ?auto_125978 ?auto_125976 ) ) ( not ( = ?auto_125975 ?auto_125976 ) ) ( not ( = ?auto_125979 ?auto_125976 ) ) ( not ( = ?auto_125972 ?auto_125979 ) ) ( not ( = ?auto_125973 ?auto_125979 ) ) ( not ( = ?auto_125974 ?auto_125979 ) ) ( not ( = ?auto_125978 ?auto_125979 ) ) ( not ( = ?auto_125975 ?auto_125979 ) ) ( ON ?auto_125979 ?auto_125977 ) ( not ( = ?auto_125972 ?auto_125977 ) ) ( not ( = ?auto_125973 ?auto_125977 ) ) ( not ( = ?auto_125974 ?auto_125977 ) ) ( not ( = ?auto_125978 ?auto_125977 ) ) ( not ( = ?auto_125975 ?auto_125977 ) ) ( not ( = ?auto_125976 ?auto_125977 ) ) ( not ( = ?auto_125979 ?auto_125977 ) ) ( ON ?auto_125976 ?auto_125979 ) ( ON-TABLE ?auto_125977 ) ( ON ?auto_125975 ?auto_125976 ) ( ON ?auto_125978 ?auto_125975 ) ( ON ?auto_125974 ?auto_125978 ) ( CLEAR ?auto_125974 ) ( HOLDING ?auto_125973 ) ( CLEAR ?auto_125972 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_125972 ?auto_125973 )
      ( MAKE-3PILE ?auto_125972 ?auto_125973 ?auto_125974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125980 - BLOCK
      ?auto_125981 - BLOCK
      ?auto_125982 - BLOCK
    )
    :vars
    (
      ?auto_125984 - BLOCK
      ?auto_125986 - BLOCK
      ?auto_125985 - BLOCK
      ?auto_125987 - BLOCK
      ?auto_125983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_125980 ) ( not ( = ?auto_125980 ?auto_125981 ) ) ( not ( = ?auto_125980 ?auto_125982 ) ) ( not ( = ?auto_125980 ?auto_125984 ) ) ( not ( = ?auto_125981 ?auto_125982 ) ) ( not ( = ?auto_125981 ?auto_125984 ) ) ( not ( = ?auto_125982 ?auto_125984 ) ) ( not ( = ?auto_125980 ?auto_125986 ) ) ( not ( = ?auto_125980 ?auto_125985 ) ) ( not ( = ?auto_125981 ?auto_125986 ) ) ( not ( = ?auto_125981 ?auto_125985 ) ) ( not ( = ?auto_125982 ?auto_125986 ) ) ( not ( = ?auto_125982 ?auto_125985 ) ) ( not ( = ?auto_125984 ?auto_125986 ) ) ( not ( = ?auto_125984 ?auto_125985 ) ) ( not ( = ?auto_125986 ?auto_125985 ) ) ( not ( = ?auto_125987 ?auto_125985 ) ) ( not ( = ?auto_125980 ?auto_125987 ) ) ( not ( = ?auto_125981 ?auto_125987 ) ) ( not ( = ?auto_125982 ?auto_125987 ) ) ( not ( = ?auto_125984 ?auto_125987 ) ) ( not ( = ?auto_125986 ?auto_125987 ) ) ( ON ?auto_125987 ?auto_125983 ) ( not ( = ?auto_125980 ?auto_125983 ) ) ( not ( = ?auto_125981 ?auto_125983 ) ) ( not ( = ?auto_125982 ?auto_125983 ) ) ( not ( = ?auto_125984 ?auto_125983 ) ) ( not ( = ?auto_125986 ?auto_125983 ) ) ( not ( = ?auto_125985 ?auto_125983 ) ) ( not ( = ?auto_125987 ?auto_125983 ) ) ( ON ?auto_125985 ?auto_125987 ) ( ON-TABLE ?auto_125983 ) ( ON ?auto_125986 ?auto_125985 ) ( ON ?auto_125984 ?auto_125986 ) ( ON ?auto_125982 ?auto_125984 ) ( CLEAR ?auto_125980 ) ( ON ?auto_125981 ?auto_125982 ) ( CLEAR ?auto_125981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_125983 ?auto_125987 ?auto_125985 ?auto_125986 ?auto_125984 ?auto_125982 )
      ( MAKE-3PILE ?auto_125980 ?auto_125981 ?auto_125982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125988 - BLOCK
      ?auto_125989 - BLOCK
      ?auto_125990 - BLOCK
    )
    :vars
    (
      ?auto_125994 - BLOCK
      ?auto_125991 - BLOCK
      ?auto_125992 - BLOCK
      ?auto_125995 - BLOCK
      ?auto_125993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125988 ?auto_125989 ) ) ( not ( = ?auto_125988 ?auto_125990 ) ) ( not ( = ?auto_125988 ?auto_125994 ) ) ( not ( = ?auto_125989 ?auto_125990 ) ) ( not ( = ?auto_125989 ?auto_125994 ) ) ( not ( = ?auto_125990 ?auto_125994 ) ) ( not ( = ?auto_125988 ?auto_125991 ) ) ( not ( = ?auto_125988 ?auto_125992 ) ) ( not ( = ?auto_125989 ?auto_125991 ) ) ( not ( = ?auto_125989 ?auto_125992 ) ) ( not ( = ?auto_125990 ?auto_125991 ) ) ( not ( = ?auto_125990 ?auto_125992 ) ) ( not ( = ?auto_125994 ?auto_125991 ) ) ( not ( = ?auto_125994 ?auto_125992 ) ) ( not ( = ?auto_125991 ?auto_125992 ) ) ( not ( = ?auto_125995 ?auto_125992 ) ) ( not ( = ?auto_125988 ?auto_125995 ) ) ( not ( = ?auto_125989 ?auto_125995 ) ) ( not ( = ?auto_125990 ?auto_125995 ) ) ( not ( = ?auto_125994 ?auto_125995 ) ) ( not ( = ?auto_125991 ?auto_125995 ) ) ( ON ?auto_125995 ?auto_125993 ) ( not ( = ?auto_125988 ?auto_125993 ) ) ( not ( = ?auto_125989 ?auto_125993 ) ) ( not ( = ?auto_125990 ?auto_125993 ) ) ( not ( = ?auto_125994 ?auto_125993 ) ) ( not ( = ?auto_125991 ?auto_125993 ) ) ( not ( = ?auto_125992 ?auto_125993 ) ) ( not ( = ?auto_125995 ?auto_125993 ) ) ( ON ?auto_125992 ?auto_125995 ) ( ON-TABLE ?auto_125993 ) ( ON ?auto_125991 ?auto_125992 ) ( ON ?auto_125994 ?auto_125991 ) ( ON ?auto_125990 ?auto_125994 ) ( ON ?auto_125989 ?auto_125990 ) ( CLEAR ?auto_125989 ) ( HOLDING ?auto_125988 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_125988 )
      ( MAKE-3PILE ?auto_125988 ?auto_125989 ?auto_125990 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_125996 - BLOCK
      ?auto_125997 - BLOCK
      ?auto_125998 - BLOCK
    )
    :vars
    (
      ?auto_126001 - BLOCK
      ?auto_126002 - BLOCK
      ?auto_126003 - BLOCK
      ?auto_125999 - BLOCK
      ?auto_126000 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_125996 ?auto_125997 ) ) ( not ( = ?auto_125996 ?auto_125998 ) ) ( not ( = ?auto_125996 ?auto_126001 ) ) ( not ( = ?auto_125997 ?auto_125998 ) ) ( not ( = ?auto_125997 ?auto_126001 ) ) ( not ( = ?auto_125998 ?auto_126001 ) ) ( not ( = ?auto_125996 ?auto_126002 ) ) ( not ( = ?auto_125996 ?auto_126003 ) ) ( not ( = ?auto_125997 ?auto_126002 ) ) ( not ( = ?auto_125997 ?auto_126003 ) ) ( not ( = ?auto_125998 ?auto_126002 ) ) ( not ( = ?auto_125998 ?auto_126003 ) ) ( not ( = ?auto_126001 ?auto_126002 ) ) ( not ( = ?auto_126001 ?auto_126003 ) ) ( not ( = ?auto_126002 ?auto_126003 ) ) ( not ( = ?auto_125999 ?auto_126003 ) ) ( not ( = ?auto_125996 ?auto_125999 ) ) ( not ( = ?auto_125997 ?auto_125999 ) ) ( not ( = ?auto_125998 ?auto_125999 ) ) ( not ( = ?auto_126001 ?auto_125999 ) ) ( not ( = ?auto_126002 ?auto_125999 ) ) ( ON ?auto_125999 ?auto_126000 ) ( not ( = ?auto_125996 ?auto_126000 ) ) ( not ( = ?auto_125997 ?auto_126000 ) ) ( not ( = ?auto_125998 ?auto_126000 ) ) ( not ( = ?auto_126001 ?auto_126000 ) ) ( not ( = ?auto_126002 ?auto_126000 ) ) ( not ( = ?auto_126003 ?auto_126000 ) ) ( not ( = ?auto_125999 ?auto_126000 ) ) ( ON ?auto_126003 ?auto_125999 ) ( ON-TABLE ?auto_126000 ) ( ON ?auto_126002 ?auto_126003 ) ( ON ?auto_126001 ?auto_126002 ) ( ON ?auto_125998 ?auto_126001 ) ( ON ?auto_125997 ?auto_125998 ) ( ON ?auto_125996 ?auto_125997 ) ( CLEAR ?auto_125996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126000 ?auto_125999 ?auto_126003 ?auto_126002 ?auto_126001 ?auto_125998 ?auto_125997 )
      ( MAKE-3PILE ?auto_125996 ?auto_125997 ?auto_125998 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126008 - BLOCK
      ?auto_126009 - BLOCK
      ?auto_126010 - BLOCK
      ?auto_126011 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_126011 ) ( CLEAR ?auto_126010 ) ( ON-TABLE ?auto_126008 ) ( ON ?auto_126009 ?auto_126008 ) ( ON ?auto_126010 ?auto_126009 ) ( not ( = ?auto_126008 ?auto_126009 ) ) ( not ( = ?auto_126008 ?auto_126010 ) ) ( not ( = ?auto_126008 ?auto_126011 ) ) ( not ( = ?auto_126009 ?auto_126010 ) ) ( not ( = ?auto_126009 ?auto_126011 ) ) ( not ( = ?auto_126010 ?auto_126011 ) ) )
    :subtasks
    ( ( !STACK ?auto_126011 ?auto_126010 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126012 - BLOCK
      ?auto_126013 - BLOCK
      ?auto_126014 - BLOCK
      ?auto_126015 - BLOCK
    )
    :vars
    (
      ?auto_126016 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126014 ) ( ON-TABLE ?auto_126012 ) ( ON ?auto_126013 ?auto_126012 ) ( ON ?auto_126014 ?auto_126013 ) ( not ( = ?auto_126012 ?auto_126013 ) ) ( not ( = ?auto_126012 ?auto_126014 ) ) ( not ( = ?auto_126012 ?auto_126015 ) ) ( not ( = ?auto_126013 ?auto_126014 ) ) ( not ( = ?auto_126013 ?auto_126015 ) ) ( not ( = ?auto_126014 ?auto_126015 ) ) ( ON ?auto_126015 ?auto_126016 ) ( CLEAR ?auto_126015 ) ( HAND-EMPTY ) ( not ( = ?auto_126012 ?auto_126016 ) ) ( not ( = ?auto_126013 ?auto_126016 ) ) ( not ( = ?auto_126014 ?auto_126016 ) ) ( not ( = ?auto_126015 ?auto_126016 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126015 ?auto_126016 )
      ( MAKE-4PILE ?auto_126012 ?auto_126013 ?auto_126014 ?auto_126015 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126017 - BLOCK
      ?auto_126018 - BLOCK
      ?auto_126019 - BLOCK
      ?auto_126020 - BLOCK
    )
    :vars
    (
      ?auto_126021 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126017 ) ( ON ?auto_126018 ?auto_126017 ) ( not ( = ?auto_126017 ?auto_126018 ) ) ( not ( = ?auto_126017 ?auto_126019 ) ) ( not ( = ?auto_126017 ?auto_126020 ) ) ( not ( = ?auto_126018 ?auto_126019 ) ) ( not ( = ?auto_126018 ?auto_126020 ) ) ( not ( = ?auto_126019 ?auto_126020 ) ) ( ON ?auto_126020 ?auto_126021 ) ( CLEAR ?auto_126020 ) ( not ( = ?auto_126017 ?auto_126021 ) ) ( not ( = ?auto_126018 ?auto_126021 ) ) ( not ( = ?auto_126019 ?auto_126021 ) ) ( not ( = ?auto_126020 ?auto_126021 ) ) ( HOLDING ?auto_126019 ) ( CLEAR ?auto_126018 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126017 ?auto_126018 ?auto_126019 )
      ( MAKE-4PILE ?auto_126017 ?auto_126018 ?auto_126019 ?auto_126020 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126022 - BLOCK
      ?auto_126023 - BLOCK
      ?auto_126024 - BLOCK
      ?auto_126025 - BLOCK
    )
    :vars
    (
      ?auto_126026 - BLOCK
      ?auto_126027 - BLOCK
      ?auto_126028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126022 ) ( ON ?auto_126023 ?auto_126022 ) ( not ( = ?auto_126022 ?auto_126023 ) ) ( not ( = ?auto_126022 ?auto_126024 ) ) ( not ( = ?auto_126022 ?auto_126025 ) ) ( not ( = ?auto_126023 ?auto_126024 ) ) ( not ( = ?auto_126023 ?auto_126025 ) ) ( not ( = ?auto_126024 ?auto_126025 ) ) ( ON ?auto_126025 ?auto_126026 ) ( not ( = ?auto_126022 ?auto_126026 ) ) ( not ( = ?auto_126023 ?auto_126026 ) ) ( not ( = ?auto_126024 ?auto_126026 ) ) ( not ( = ?auto_126025 ?auto_126026 ) ) ( CLEAR ?auto_126023 ) ( ON ?auto_126024 ?auto_126025 ) ( CLEAR ?auto_126024 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126027 ) ( ON ?auto_126028 ?auto_126027 ) ( ON ?auto_126026 ?auto_126028 ) ( not ( = ?auto_126027 ?auto_126028 ) ) ( not ( = ?auto_126027 ?auto_126026 ) ) ( not ( = ?auto_126027 ?auto_126025 ) ) ( not ( = ?auto_126027 ?auto_126024 ) ) ( not ( = ?auto_126028 ?auto_126026 ) ) ( not ( = ?auto_126028 ?auto_126025 ) ) ( not ( = ?auto_126028 ?auto_126024 ) ) ( not ( = ?auto_126022 ?auto_126027 ) ) ( not ( = ?auto_126022 ?auto_126028 ) ) ( not ( = ?auto_126023 ?auto_126027 ) ) ( not ( = ?auto_126023 ?auto_126028 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126027 ?auto_126028 ?auto_126026 ?auto_126025 )
      ( MAKE-4PILE ?auto_126022 ?auto_126023 ?auto_126024 ?auto_126025 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126029 - BLOCK
      ?auto_126030 - BLOCK
      ?auto_126031 - BLOCK
      ?auto_126032 - BLOCK
    )
    :vars
    (
      ?auto_126035 - BLOCK
      ?auto_126034 - BLOCK
      ?auto_126033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126029 ) ( not ( = ?auto_126029 ?auto_126030 ) ) ( not ( = ?auto_126029 ?auto_126031 ) ) ( not ( = ?auto_126029 ?auto_126032 ) ) ( not ( = ?auto_126030 ?auto_126031 ) ) ( not ( = ?auto_126030 ?auto_126032 ) ) ( not ( = ?auto_126031 ?auto_126032 ) ) ( ON ?auto_126032 ?auto_126035 ) ( not ( = ?auto_126029 ?auto_126035 ) ) ( not ( = ?auto_126030 ?auto_126035 ) ) ( not ( = ?auto_126031 ?auto_126035 ) ) ( not ( = ?auto_126032 ?auto_126035 ) ) ( ON ?auto_126031 ?auto_126032 ) ( CLEAR ?auto_126031 ) ( ON-TABLE ?auto_126034 ) ( ON ?auto_126033 ?auto_126034 ) ( ON ?auto_126035 ?auto_126033 ) ( not ( = ?auto_126034 ?auto_126033 ) ) ( not ( = ?auto_126034 ?auto_126035 ) ) ( not ( = ?auto_126034 ?auto_126032 ) ) ( not ( = ?auto_126034 ?auto_126031 ) ) ( not ( = ?auto_126033 ?auto_126035 ) ) ( not ( = ?auto_126033 ?auto_126032 ) ) ( not ( = ?auto_126033 ?auto_126031 ) ) ( not ( = ?auto_126029 ?auto_126034 ) ) ( not ( = ?auto_126029 ?auto_126033 ) ) ( not ( = ?auto_126030 ?auto_126034 ) ) ( not ( = ?auto_126030 ?auto_126033 ) ) ( HOLDING ?auto_126030 ) ( CLEAR ?auto_126029 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126029 ?auto_126030 )
      ( MAKE-4PILE ?auto_126029 ?auto_126030 ?auto_126031 ?auto_126032 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126036 - BLOCK
      ?auto_126037 - BLOCK
      ?auto_126038 - BLOCK
      ?auto_126039 - BLOCK
    )
    :vars
    (
      ?auto_126040 - BLOCK
      ?auto_126042 - BLOCK
      ?auto_126041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126036 ) ( not ( = ?auto_126036 ?auto_126037 ) ) ( not ( = ?auto_126036 ?auto_126038 ) ) ( not ( = ?auto_126036 ?auto_126039 ) ) ( not ( = ?auto_126037 ?auto_126038 ) ) ( not ( = ?auto_126037 ?auto_126039 ) ) ( not ( = ?auto_126038 ?auto_126039 ) ) ( ON ?auto_126039 ?auto_126040 ) ( not ( = ?auto_126036 ?auto_126040 ) ) ( not ( = ?auto_126037 ?auto_126040 ) ) ( not ( = ?auto_126038 ?auto_126040 ) ) ( not ( = ?auto_126039 ?auto_126040 ) ) ( ON ?auto_126038 ?auto_126039 ) ( ON-TABLE ?auto_126042 ) ( ON ?auto_126041 ?auto_126042 ) ( ON ?auto_126040 ?auto_126041 ) ( not ( = ?auto_126042 ?auto_126041 ) ) ( not ( = ?auto_126042 ?auto_126040 ) ) ( not ( = ?auto_126042 ?auto_126039 ) ) ( not ( = ?auto_126042 ?auto_126038 ) ) ( not ( = ?auto_126041 ?auto_126040 ) ) ( not ( = ?auto_126041 ?auto_126039 ) ) ( not ( = ?auto_126041 ?auto_126038 ) ) ( not ( = ?auto_126036 ?auto_126042 ) ) ( not ( = ?auto_126036 ?auto_126041 ) ) ( not ( = ?auto_126037 ?auto_126042 ) ) ( not ( = ?auto_126037 ?auto_126041 ) ) ( CLEAR ?auto_126036 ) ( ON ?auto_126037 ?auto_126038 ) ( CLEAR ?auto_126037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126042 ?auto_126041 ?auto_126040 ?auto_126039 ?auto_126038 )
      ( MAKE-4PILE ?auto_126036 ?auto_126037 ?auto_126038 ?auto_126039 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126043 - BLOCK
      ?auto_126044 - BLOCK
      ?auto_126045 - BLOCK
      ?auto_126046 - BLOCK
    )
    :vars
    (
      ?auto_126049 - BLOCK
      ?auto_126047 - BLOCK
      ?auto_126048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126043 ?auto_126044 ) ) ( not ( = ?auto_126043 ?auto_126045 ) ) ( not ( = ?auto_126043 ?auto_126046 ) ) ( not ( = ?auto_126044 ?auto_126045 ) ) ( not ( = ?auto_126044 ?auto_126046 ) ) ( not ( = ?auto_126045 ?auto_126046 ) ) ( ON ?auto_126046 ?auto_126049 ) ( not ( = ?auto_126043 ?auto_126049 ) ) ( not ( = ?auto_126044 ?auto_126049 ) ) ( not ( = ?auto_126045 ?auto_126049 ) ) ( not ( = ?auto_126046 ?auto_126049 ) ) ( ON ?auto_126045 ?auto_126046 ) ( ON-TABLE ?auto_126047 ) ( ON ?auto_126048 ?auto_126047 ) ( ON ?auto_126049 ?auto_126048 ) ( not ( = ?auto_126047 ?auto_126048 ) ) ( not ( = ?auto_126047 ?auto_126049 ) ) ( not ( = ?auto_126047 ?auto_126046 ) ) ( not ( = ?auto_126047 ?auto_126045 ) ) ( not ( = ?auto_126048 ?auto_126049 ) ) ( not ( = ?auto_126048 ?auto_126046 ) ) ( not ( = ?auto_126048 ?auto_126045 ) ) ( not ( = ?auto_126043 ?auto_126047 ) ) ( not ( = ?auto_126043 ?auto_126048 ) ) ( not ( = ?auto_126044 ?auto_126047 ) ) ( not ( = ?auto_126044 ?auto_126048 ) ) ( ON ?auto_126044 ?auto_126045 ) ( CLEAR ?auto_126044 ) ( HOLDING ?auto_126043 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126043 )
      ( MAKE-4PILE ?auto_126043 ?auto_126044 ?auto_126045 ?auto_126046 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126050 - BLOCK
      ?auto_126051 - BLOCK
      ?auto_126052 - BLOCK
      ?auto_126053 - BLOCK
    )
    :vars
    (
      ?auto_126056 - BLOCK
      ?auto_126054 - BLOCK
      ?auto_126055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126050 ?auto_126051 ) ) ( not ( = ?auto_126050 ?auto_126052 ) ) ( not ( = ?auto_126050 ?auto_126053 ) ) ( not ( = ?auto_126051 ?auto_126052 ) ) ( not ( = ?auto_126051 ?auto_126053 ) ) ( not ( = ?auto_126052 ?auto_126053 ) ) ( ON ?auto_126053 ?auto_126056 ) ( not ( = ?auto_126050 ?auto_126056 ) ) ( not ( = ?auto_126051 ?auto_126056 ) ) ( not ( = ?auto_126052 ?auto_126056 ) ) ( not ( = ?auto_126053 ?auto_126056 ) ) ( ON ?auto_126052 ?auto_126053 ) ( ON-TABLE ?auto_126054 ) ( ON ?auto_126055 ?auto_126054 ) ( ON ?auto_126056 ?auto_126055 ) ( not ( = ?auto_126054 ?auto_126055 ) ) ( not ( = ?auto_126054 ?auto_126056 ) ) ( not ( = ?auto_126054 ?auto_126053 ) ) ( not ( = ?auto_126054 ?auto_126052 ) ) ( not ( = ?auto_126055 ?auto_126056 ) ) ( not ( = ?auto_126055 ?auto_126053 ) ) ( not ( = ?auto_126055 ?auto_126052 ) ) ( not ( = ?auto_126050 ?auto_126054 ) ) ( not ( = ?auto_126050 ?auto_126055 ) ) ( not ( = ?auto_126051 ?auto_126054 ) ) ( not ( = ?auto_126051 ?auto_126055 ) ) ( ON ?auto_126051 ?auto_126052 ) ( ON ?auto_126050 ?auto_126051 ) ( CLEAR ?auto_126050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126054 ?auto_126055 ?auto_126056 ?auto_126053 ?auto_126052 ?auto_126051 )
      ( MAKE-4PILE ?auto_126050 ?auto_126051 ?auto_126052 ?auto_126053 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126057 - BLOCK
      ?auto_126058 - BLOCK
      ?auto_126059 - BLOCK
      ?auto_126060 - BLOCK
    )
    :vars
    (
      ?auto_126063 - BLOCK
      ?auto_126062 - BLOCK
      ?auto_126061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126057 ?auto_126058 ) ) ( not ( = ?auto_126057 ?auto_126059 ) ) ( not ( = ?auto_126057 ?auto_126060 ) ) ( not ( = ?auto_126058 ?auto_126059 ) ) ( not ( = ?auto_126058 ?auto_126060 ) ) ( not ( = ?auto_126059 ?auto_126060 ) ) ( ON ?auto_126060 ?auto_126063 ) ( not ( = ?auto_126057 ?auto_126063 ) ) ( not ( = ?auto_126058 ?auto_126063 ) ) ( not ( = ?auto_126059 ?auto_126063 ) ) ( not ( = ?auto_126060 ?auto_126063 ) ) ( ON ?auto_126059 ?auto_126060 ) ( ON-TABLE ?auto_126062 ) ( ON ?auto_126061 ?auto_126062 ) ( ON ?auto_126063 ?auto_126061 ) ( not ( = ?auto_126062 ?auto_126061 ) ) ( not ( = ?auto_126062 ?auto_126063 ) ) ( not ( = ?auto_126062 ?auto_126060 ) ) ( not ( = ?auto_126062 ?auto_126059 ) ) ( not ( = ?auto_126061 ?auto_126063 ) ) ( not ( = ?auto_126061 ?auto_126060 ) ) ( not ( = ?auto_126061 ?auto_126059 ) ) ( not ( = ?auto_126057 ?auto_126062 ) ) ( not ( = ?auto_126057 ?auto_126061 ) ) ( not ( = ?auto_126058 ?auto_126062 ) ) ( not ( = ?auto_126058 ?auto_126061 ) ) ( ON ?auto_126058 ?auto_126059 ) ( HOLDING ?auto_126057 ) ( CLEAR ?auto_126058 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126062 ?auto_126061 ?auto_126063 ?auto_126060 ?auto_126059 ?auto_126058 ?auto_126057 )
      ( MAKE-4PILE ?auto_126057 ?auto_126058 ?auto_126059 ?auto_126060 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126064 - BLOCK
      ?auto_126065 - BLOCK
      ?auto_126066 - BLOCK
      ?auto_126067 - BLOCK
    )
    :vars
    (
      ?auto_126068 - BLOCK
      ?auto_126069 - BLOCK
      ?auto_126070 - BLOCK
      ?auto_126071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126064 ?auto_126065 ) ) ( not ( = ?auto_126064 ?auto_126066 ) ) ( not ( = ?auto_126064 ?auto_126067 ) ) ( not ( = ?auto_126065 ?auto_126066 ) ) ( not ( = ?auto_126065 ?auto_126067 ) ) ( not ( = ?auto_126066 ?auto_126067 ) ) ( ON ?auto_126067 ?auto_126068 ) ( not ( = ?auto_126064 ?auto_126068 ) ) ( not ( = ?auto_126065 ?auto_126068 ) ) ( not ( = ?auto_126066 ?auto_126068 ) ) ( not ( = ?auto_126067 ?auto_126068 ) ) ( ON ?auto_126066 ?auto_126067 ) ( ON-TABLE ?auto_126069 ) ( ON ?auto_126070 ?auto_126069 ) ( ON ?auto_126068 ?auto_126070 ) ( not ( = ?auto_126069 ?auto_126070 ) ) ( not ( = ?auto_126069 ?auto_126068 ) ) ( not ( = ?auto_126069 ?auto_126067 ) ) ( not ( = ?auto_126069 ?auto_126066 ) ) ( not ( = ?auto_126070 ?auto_126068 ) ) ( not ( = ?auto_126070 ?auto_126067 ) ) ( not ( = ?auto_126070 ?auto_126066 ) ) ( not ( = ?auto_126064 ?auto_126069 ) ) ( not ( = ?auto_126064 ?auto_126070 ) ) ( not ( = ?auto_126065 ?auto_126069 ) ) ( not ( = ?auto_126065 ?auto_126070 ) ) ( ON ?auto_126065 ?auto_126066 ) ( CLEAR ?auto_126065 ) ( ON ?auto_126064 ?auto_126071 ) ( CLEAR ?auto_126064 ) ( HAND-EMPTY ) ( not ( = ?auto_126064 ?auto_126071 ) ) ( not ( = ?auto_126065 ?auto_126071 ) ) ( not ( = ?auto_126066 ?auto_126071 ) ) ( not ( = ?auto_126067 ?auto_126071 ) ) ( not ( = ?auto_126068 ?auto_126071 ) ) ( not ( = ?auto_126069 ?auto_126071 ) ) ( not ( = ?auto_126070 ?auto_126071 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126064 ?auto_126071 )
      ( MAKE-4PILE ?auto_126064 ?auto_126065 ?auto_126066 ?auto_126067 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126072 - BLOCK
      ?auto_126073 - BLOCK
      ?auto_126074 - BLOCK
      ?auto_126075 - BLOCK
    )
    :vars
    (
      ?auto_126076 - BLOCK
      ?auto_126079 - BLOCK
      ?auto_126078 - BLOCK
      ?auto_126077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126072 ?auto_126073 ) ) ( not ( = ?auto_126072 ?auto_126074 ) ) ( not ( = ?auto_126072 ?auto_126075 ) ) ( not ( = ?auto_126073 ?auto_126074 ) ) ( not ( = ?auto_126073 ?auto_126075 ) ) ( not ( = ?auto_126074 ?auto_126075 ) ) ( ON ?auto_126075 ?auto_126076 ) ( not ( = ?auto_126072 ?auto_126076 ) ) ( not ( = ?auto_126073 ?auto_126076 ) ) ( not ( = ?auto_126074 ?auto_126076 ) ) ( not ( = ?auto_126075 ?auto_126076 ) ) ( ON ?auto_126074 ?auto_126075 ) ( ON-TABLE ?auto_126079 ) ( ON ?auto_126078 ?auto_126079 ) ( ON ?auto_126076 ?auto_126078 ) ( not ( = ?auto_126079 ?auto_126078 ) ) ( not ( = ?auto_126079 ?auto_126076 ) ) ( not ( = ?auto_126079 ?auto_126075 ) ) ( not ( = ?auto_126079 ?auto_126074 ) ) ( not ( = ?auto_126078 ?auto_126076 ) ) ( not ( = ?auto_126078 ?auto_126075 ) ) ( not ( = ?auto_126078 ?auto_126074 ) ) ( not ( = ?auto_126072 ?auto_126079 ) ) ( not ( = ?auto_126072 ?auto_126078 ) ) ( not ( = ?auto_126073 ?auto_126079 ) ) ( not ( = ?auto_126073 ?auto_126078 ) ) ( ON ?auto_126072 ?auto_126077 ) ( CLEAR ?auto_126072 ) ( not ( = ?auto_126072 ?auto_126077 ) ) ( not ( = ?auto_126073 ?auto_126077 ) ) ( not ( = ?auto_126074 ?auto_126077 ) ) ( not ( = ?auto_126075 ?auto_126077 ) ) ( not ( = ?auto_126076 ?auto_126077 ) ) ( not ( = ?auto_126079 ?auto_126077 ) ) ( not ( = ?auto_126078 ?auto_126077 ) ) ( HOLDING ?auto_126073 ) ( CLEAR ?auto_126074 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126079 ?auto_126078 ?auto_126076 ?auto_126075 ?auto_126074 ?auto_126073 )
      ( MAKE-4PILE ?auto_126072 ?auto_126073 ?auto_126074 ?auto_126075 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126080 - BLOCK
      ?auto_126081 - BLOCK
      ?auto_126082 - BLOCK
      ?auto_126083 - BLOCK
    )
    :vars
    (
      ?auto_126087 - BLOCK
      ?auto_126086 - BLOCK
      ?auto_126084 - BLOCK
      ?auto_126085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126080 ?auto_126081 ) ) ( not ( = ?auto_126080 ?auto_126082 ) ) ( not ( = ?auto_126080 ?auto_126083 ) ) ( not ( = ?auto_126081 ?auto_126082 ) ) ( not ( = ?auto_126081 ?auto_126083 ) ) ( not ( = ?auto_126082 ?auto_126083 ) ) ( ON ?auto_126083 ?auto_126087 ) ( not ( = ?auto_126080 ?auto_126087 ) ) ( not ( = ?auto_126081 ?auto_126087 ) ) ( not ( = ?auto_126082 ?auto_126087 ) ) ( not ( = ?auto_126083 ?auto_126087 ) ) ( ON ?auto_126082 ?auto_126083 ) ( ON-TABLE ?auto_126086 ) ( ON ?auto_126084 ?auto_126086 ) ( ON ?auto_126087 ?auto_126084 ) ( not ( = ?auto_126086 ?auto_126084 ) ) ( not ( = ?auto_126086 ?auto_126087 ) ) ( not ( = ?auto_126086 ?auto_126083 ) ) ( not ( = ?auto_126086 ?auto_126082 ) ) ( not ( = ?auto_126084 ?auto_126087 ) ) ( not ( = ?auto_126084 ?auto_126083 ) ) ( not ( = ?auto_126084 ?auto_126082 ) ) ( not ( = ?auto_126080 ?auto_126086 ) ) ( not ( = ?auto_126080 ?auto_126084 ) ) ( not ( = ?auto_126081 ?auto_126086 ) ) ( not ( = ?auto_126081 ?auto_126084 ) ) ( ON ?auto_126080 ?auto_126085 ) ( not ( = ?auto_126080 ?auto_126085 ) ) ( not ( = ?auto_126081 ?auto_126085 ) ) ( not ( = ?auto_126082 ?auto_126085 ) ) ( not ( = ?auto_126083 ?auto_126085 ) ) ( not ( = ?auto_126087 ?auto_126085 ) ) ( not ( = ?auto_126086 ?auto_126085 ) ) ( not ( = ?auto_126084 ?auto_126085 ) ) ( CLEAR ?auto_126082 ) ( ON ?auto_126081 ?auto_126080 ) ( CLEAR ?auto_126081 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126085 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126085 ?auto_126080 )
      ( MAKE-4PILE ?auto_126080 ?auto_126081 ?auto_126082 ?auto_126083 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126088 - BLOCK
      ?auto_126089 - BLOCK
      ?auto_126090 - BLOCK
      ?auto_126091 - BLOCK
    )
    :vars
    (
      ?auto_126094 - BLOCK
      ?auto_126093 - BLOCK
      ?auto_126092 - BLOCK
      ?auto_126095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126088 ?auto_126089 ) ) ( not ( = ?auto_126088 ?auto_126090 ) ) ( not ( = ?auto_126088 ?auto_126091 ) ) ( not ( = ?auto_126089 ?auto_126090 ) ) ( not ( = ?auto_126089 ?auto_126091 ) ) ( not ( = ?auto_126090 ?auto_126091 ) ) ( ON ?auto_126091 ?auto_126094 ) ( not ( = ?auto_126088 ?auto_126094 ) ) ( not ( = ?auto_126089 ?auto_126094 ) ) ( not ( = ?auto_126090 ?auto_126094 ) ) ( not ( = ?auto_126091 ?auto_126094 ) ) ( ON-TABLE ?auto_126093 ) ( ON ?auto_126092 ?auto_126093 ) ( ON ?auto_126094 ?auto_126092 ) ( not ( = ?auto_126093 ?auto_126092 ) ) ( not ( = ?auto_126093 ?auto_126094 ) ) ( not ( = ?auto_126093 ?auto_126091 ) ) ( not ( = ?auto_126093 ?auto_126090 ) ) ( not ( = ?auto_126092 ?auto_126094 ) ) ( not ( = ?auto_126092 ?auto_126091 ) ) ( not ( = ?auto_126092 ?auto_126090 ) ) ( not ( = ?auto_126088 ?auto_126093 ) ) ( not ( = ?auto_126088 ?auto_126092 ) ) ( not ( = ?auto_126089 ?auto_126093 ) ) ( not ( = ?auto_126089 ?auto_126092 ) ) ( ON ?auto_126088 ?auto_126095 ) ( not ( = ?auto_126088 ?auto_126095 ) ) ( not ( = ?auto_126089 ?auto_126095 ) ) ( not ( = ?auto_126090 ?auto_126095 ) ) ( not ( = ?auto_126091 ?auto_126095 ) ) ( not ( = ?auto_126094 ?auto_126095 ) ) ( not ( = ?auto_126093 ?auto_126095 ) ) ( not ( = ?auto_126092 ?auto_126095 ) ) ( ON ?auto_126089 ?auto_126088 ) ( CLEAR ?auto_126089 ) ( ON-TABLE ?auto_126095 ) ( HOLDING ?auto_126090 ) ( CLEAR ?auto_126091 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126093 ?auto_126092 ?auto_126094 ?auto_126091 ?auto_126090 )
      ( MAKE-4PILE ?auto_126088 ?auto_126089 ?auto_126090 ?auto_126091 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126096 - BLOCK
      ?auto_126097 - BLOCK
      ?auto_126098 - BLOCK
      ?auto_126099 - BLOCK
    )
    :vars
    (
      ?auto_126102 - BLOCK
      ?auto_126100 - BLOCK
      ?auto_126103 - BLOCK
      ?auto_126101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126096 ?auto_126097 ) ) ( not ( = ?auto_126096 ?auto_126098 ) ) ( not ( = ?auto_126096 ?auto_126099 ) ) ( not ( = ?auto_126097 ?auto_126098 ) ) ( not ( = ?auto_126097 ?auto_126099 ) ) ( not ( = ?auto_126098 ?auto_126099 ) ) ( ON ?auto_126099 ?auto_126102 ) ( not ( = ?auto_126096 ?auto_126102 ) ) ( not ( = ?auto_126097 ?auto_126102 ) ) ( not ( = ?auto_126098 ?auto_126102 ) ) ( not ( = ?auto_126099 ?auto_126102 ) ) ( ON-TABLE ?auto_126100 ) ( ON ?auto_126103 ?auto_126100 ) ( ON ?auto_126102 ?auto_126103 ) ( not ( = ?auto_126100 ?auto_126103 ) ) ( not ( = ?auto_126100 ?auto_126102 ) ) ( not ( = ?auto_126100 ?auto_126099 ) ) ( not ( = ?auto_126100 ?auto_126098 ) ) ( not ( = ?auto_126103 ?auto_126102 ) ) ( not ( = ?auto_126103 ?auto_126099 ) ) ( not ( = ?auto_126103 ?auto_126098 ) ) ( not ( = ?auto_126096 ?auto_126100 ) ) ( not ( = ?auto_126096 ?auto_126103 ) ) ( not ( = ?auto_126097 ?auto_126100 ) ) ( not ( = ?auto_126097 ?auto_126103 ) ) ( ON ?auto_126096 ?auto_126101 ) ( not ( = ?auto_126096 ?auto_126101 ) ) ( not ( = ?auto_126097 ?auto_126101 ) ) ( not ( = ?auto_126098 ?auto_126101 ) ) ( not ( = ?auto_126099 ?auto_126101 ) ) ( not ( = ?auto_126102 ?auto_126101 ) ) ( not ( = ?auto_126100 ?auto_126101 ) ) ( not ( = ?auto_126103 ?auto_126101 ) ) ( ON ?auto_126097 ?auto_126096 ) ( ON-TABLE ?auto_126101 ) ( CLEAR ?auto_126099 ) ( ON ?auto_126098 ?auto_126097 ) ( CLEAR ?auto_126098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126101 ?auto_126096 ?auto_126097 )
      ( MAKE-4PILE ?auto_126096 ?auto_126097 ?auto_126098 ?auto_126099 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126104 - BLOCK
      ?auto_126105 - BLOCK
      ?auto_126106 - BLOCK
      ?auto_126107 - BLOCK
    )
    :vars
    (
      ?auto_126109 - BLOCK
      ?auto_126110 - BLOCK
      ?auto_126108 - BLOCK
      ?auto_126111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126104 ?auto_126105 ) ) ( not ( = ?auto_126104 ?auto_126106 ) ) ( not ( = ?auto_126104 ?auto_126107 ) ) ( not ( = ?auto_126105 ?auto_126106 ) ) ( not ( = ?auto_126105 ?auto_126107 ) ) ( not ( = ?auto_126106 ?auto_126107 ) ) ( not ( = ?auto_126104 ?auto_126109 ) ) ( not ( = ?auto_126105 ?auto_126109 ) ) ( not ( = ?auto_126106 ?auto_126109 ) ) ( not ( = ?auto_126107 ?auto_126109 ) ) ( ON-TABLE ?auto_126110 ) ( ON ?auto_126108 ?auto_126110 ) ( ON ?auto_126109 ?auto_126108 ) ( not ( = ?auto_126110 ?auto_126108 ) ) ( not ( = ?auto_126110 ?auto_126109 ) ) ( not ( = ?auto_126110 ?auto_126107 ) ) ( not ( = ?auto_126110 ?auto_126106 ) ) ( not ( = ?auto_126108 ?auto_126109 ) ) ( not ( = ?auto_126108 ?auto_126107 ) ) ( not ( = ?auto_126108 ?auto_126106 ) ) ( not ( = ?auto_126104 ?auto_126110 ) ) ( not ( = ?auto_126104 ?auto_126108 ) ) ( not ( = ?auto_126105 ?auto_126110 ) ) ( not ( = ?auto_126105 ?auto_126108 ) ) ( ON ?auto_126104 ?auto_126111 ) ( not ( = ?auto_126104 ?auto_126111 ) ) ( not ( = ?auto_126105 ?auto_126111 ) ) ( not ( = ?auto_126106 ?auto_126111 ) ) ( not ( = ?auto_126107 ?auto_126111 ) ) ( not ( = ?auto_126109 ?auto_126111 ) ) ( not ( = ?auto_126110 ?auto_126111 ) ) ( not ( = ?auto_126108 ?auto_126111 ) ) ( ON ?auto_126105 ?auto_126104 ) ( ON-TABLE ?auto_126111 ) ( ON ?auto_126106 ?auto_126105 ) ( CLEAR ?auto_126106 ) ( HOLDING ?auto_126107 ) ( CLEAR ?auto_126109 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126110 ?auto_126108 ?auto_126109 ?auto_126107 )
      ( MAKE-4PILE ?auto_126104 ?auto_126105 ?auto_126106 ?auto_126107 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126112 - BLOCK
      ?auto_126113 - BLOCK
      ?auto_126114 - BLOCK
      ?auto_126115 - BLOCK
    )
    :vars
    (
      ?auto_126117 - BLOCK
      ?auto_126118 - BLOCK
      ?auto_126116 - BLOCK
      ?auto_126119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126112 ?auto_126113 ) ) ( not ( = ?auto_126112 ?auto_126114 ) ) ( not ( = ?auto_126112 ?auto_126115 ) ) ( not ( = ?auto_126113 ?auto_126114 ) ) ( not ( = ?auto_126113 ?auto_126115 ) ) ( not ( = ?auto_126114 ?auto_126115 ) ) ( not ( = ?auto_126112 ?auto_126117 ) ) ( not ( = ?auto_126113 ?auto_126117 ) ) ( not ( = ?auto_126114 ?auto_126117 ) ) ( not ( = ?auto_126115 ?auto_126117 ) ) ( ON-TABLE ?auto_126118 ) ( ON ?auto_126116 ?auto_126118 ) ( ON ?auto_126117 ?auto_126116 ) ( not ( = ?auto_126118 ?auto_126116 ) ) ( not ( = ?auto_126118 ?auto_126117 ) ) ( not ( = ?auto_126118 ?auto_126115 ) ) ( not ( = ?auto_126118 ?auto_126114 ) ) ( not ( = ?auto_126116 ?auto_126117 ) ) ( not ( = ?auto_126116 ?auto_126115 ) ) ( not ( = ?auto_126116 ?auto_126114 ) ) ( not ( = ?auto_126112 ?auto_126118 ) ) ( not ( = ?auto_126112 ?auto_126116 ) ) ( not ( = ?auto_126113 ?auto_126118 ) ) ( not ( = ?auto_126113 ?auto_126116 ) ) ( ON ?auto_126112 ?auto_126119 ) ( not ( = ?auto_126112 ?auto_126119 ) ) ( not ( = ?auto_126113 ?auto_126119 ) ) ( not ( = ?auto_126114 ?auto_126119 ) ) ( not ( = ?auto_126115 ?auto_126119 ) ) ( not ( = ?auto_126117 ?auto_126119 ) ) ( not ( = ?auto_126118 ?auto_126119 ) ) ( not ( = ?auto_126116 ?auto_126119 ) ) ( ON ?auto_126113 ?auto_126112 ) ( ON-TABLE ?auto_126119 ) ( ON ?auto_126114 ?auto_126113 ) ( CLEAR ?auto_126117 ) ( ON ?auto_126115 ?auto_126114 ) ( CLEAR ?auto_126115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126119 ?auto_126112 ?auto_126113 ?auto_126114 )
      ( MAKE-4PILE ?auto_126112 ?auto_126113 ?auto_126114 ?auto_126115 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126120 - BLOCK
      ?auto_126121 - BLOCK
      ?auto_126122 - BLOCK
      ?auto_126123 - BLOCK
    )
    :vars
    (
      ?auto_126124 - BLOCK
      ?auto_126126 - BLOCK
      ?auto_126125 - BLOCK
      ?auto_126127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126120 ?auto_126121 ) ) ( not ( = ?auto_126120 ?auto_126122 ) ) ( not ( = ?auto_126120 ?auto_126123 ) ) ( not ( = ?auto_126121 ?auto_126122 ) ) ( not ( = ?auto_126121 ?auto_126123 ) ) ( not ( = ?auto_126122 ?auto_126123 ) ) ( not ( = ?auto_126120 ?auto_126124 ) ) ( not ( = ?auto_126121 ?auto_126124 ) ) ( not ( = ?auto_126122 ?auto_126124 ) ) ( not ( = ?auto_126123 ?auto_126124 ) ) ( ON-TABLE ?auto_126126 ) ( ON ?auto_126125 ?auto_126126 ) ( not ( = ?auto_126126 ?auto_126125 ) ) ( not ( = ?auto_126126 ?auto_126124 ) ) ( not ( = ?auto_126126 ?auto_126123 ) ) ( not ( = ?auto_126126 ?auto_126122 ) ) ( not ( = ?auto_126125 ?auto_126124 ) ) ( not ( = ?auto_126125 ?auto_126123 ) ) ( not ( = ?auto_126125 ?auto_126122 ) ) ( not ( = ?auto_126120 ?auto_126126 ) ) ( not ( = ?auto_126120 ?auto_126125 ) ) ( not ( = ?auto_126121 ?auto_126126 ) ) ( not ( = ?auto_126121 ?auto_126125 ) ) ( ON ?auto_126120 ?auto_126127 ) ( not ( = ?auto_126120 ?auto_126127 ) ) ( not ( = ?auto_126121 ?auto_126127 ) ) ( not ( = ?auto_126122 ?auto_126127 ) ) ( not ( = ?auto_126123 ?auto_126127 ) ) ( not ( = ?auto_126124 ?auto_126127 ) ) ( not ( = ?auto_126126 ?auto_126127 ) ) ( not ( = ?auto_126125 ?auto_126127 ) ) ( ON ?auto_126121 ?auto_126120 ) ( ON-TABLE ?auto_126127 ) ( ON ?auto_126122 ?auto_126121 ) ( ON ?auto_126123 ?auto_126122 ) ( CLEAR ?auto_126123 ) ( HOLDING ?auto_126124 ) ( CLEAR ?auto_126125 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126126 ?auto_126125 ?auto_126124 )
      ( MAKE-4PILE ?auto_126120 ?auto_126121 ?auto_126122 ?auto_126123 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126128 - BLOCK
      ?auto_126129 - BLOCK
      ?auto_126130 - BLOCK
      ?auto_126131 - BLOCK
    )
    :vars
    (
      ?auto_126134 - BLOCK
      ?auto_126132 - BLOCK
      ?auto_126133 - BLOCK
      ?auto_126135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126128 ?auto_126129 ) ) ( not ( = ?auto_126128 ?auto_126130 ) ) ( not ( = ?auto_126128 ?auto_126131 ) ) ( not ( = ?auto_126129 ?auto_126130 ) ) ( not ( = ?auto_126129 ?auto_126131 ) ) ( not ( = ?auto_126130 ?auto_126131 ) ) ( not ( = ?auto_126128 ?auto_126134 ) ) ( not ( = ?auto_126129 ?auto_126134 ) ) ( not ( = ?auto_126130 ?auto_126134 ) ) ( not ( = ?auto_126131 ?auto_126134 ) ) ( ON-TABLE ?auto_126132 ) ( ON ?auto_126133 ?auto_126132 ) ( not ( = ?auto_126132 ?auto_126133 ) ) ( not ( = ?auto_126132 ?auto_126134 ) ) ( not ( = ?auto_126132 ?auto_126131 ) ) ( not ( = ?auto_126132 ?auto_126130 ) ) ( not ( = ?auto_126133 ?auto_126134 ) ) ( not ( = ?auto_126133 ?auto_126131 ) ) ( not ( = ?auto_126133 ?auto_126130 ) ) ( not ( = ?auto_126128 ?auto_126132 ) ) ( not ( = ?auto_126128 ?auto_126133 ) ) ( not ( = ?auto_126129 ?auto_126132 ) ) ( not ( = ?auto_126129 ?auto_126133 ) ) ( ON ?auto_126128 ?auto_126135 ) ( not ( = ?auto_126128 ?auto_126135 ) ) ( not ( = ?auto_126129 ?auto_126135 ) ) ( not ( = ?auto_126130 ?auto_126135 ) ) ( not ( = ?auto_126131 ?auto_126135 ) ) ( not ( = ?auto_126134 ?auto_126135 ) ) ( not ( = ?auto_126132 ?auto_126135 ) ) ( not ( = ?auto_126133 ?auto_126135 ) ) ( ON ?auto_126129 ?auto_126128 ) ( ON-TABLE ?auto_126135 ) ( ON ?auto_126130 ?auto_126129 ) ( ON ?auto_126131 ?auto_126130 ) ( CLEAR ?auto_126133 ) ( ON ?auto_126134 ?auto_126131 ) ( CLEAR ?auto_126134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126135 ?auto_126128 ?auto_126129 ?auto_126130 ?auto_126131 )
      ( MAKE-4PILE ?auto_126128 ?auto_126129 ?auto_126130 ?auto_126131 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126136 - BLOCK
      ?auto_126137 - BLOCK
      ?auto_126138 - BLOCK
      ?auto_126139 - BLOCK
    )
    :vars
    (
      ?auto_126140 - BLOCK
      ?auto_126141 - BLOCK
      ?auto_126143 - BLOCK
      ?auto_126142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126136 ?auto_126137 ) ) ( not ( = ?auto_126136 ?auto_126138 ) ) ( not ( = ?auto_126136 ?auto_126139 ) ) ( not ( = ?auto_126137 ?auto_126138 ) ) ( not ( = ?auto_126137 ?auto_126139 ) ) ( not ( = ?auto_126138 ?auto_126139 ) ) ( not ( = ?auto_126136 ?auto_126140 ) ) ( not ( = ?auto_126137 ?auto_126140 ) ) ( not ( = ?auto_126138 ?auto_126140 ) ) ( not ( = ?auto_126139 ?auto_126140 ) ) ( ON-TABLE ?auto_126141 ) ( not ( = ?auto_126141 ?auto_126143 ) ) ( not ( = ?auto_126141 ?auto_126140 ) ) ( not ( = ?auto_126141 ?auto_126139 ) ) ( not ( = ?auto_126141 ?auto_126138 ) ) ( not ( = ?auto_126143 ?auto_126140 ) ) ( not ( = ?auto_126143 ?auto_126139 ) ) ( not ( = ?auto_126143 ?auto_126138 ) ) ( not ( = ?auto_126136 ?auto_126141 ) ) ( not ( = ?auto_126136 ?auto_126143 ) ) ( not ( = ?auto_126137 ?auto_126141 ) ) ( not ( = ?auto_126137 ?auto_126143 ) ) ( ON ?auto_126136 ?auto_126142 ) ( not ( = ?auto_126136 ?auto_126142 ) ) ( not ( = ?auto_126137 ?auto_126142 ) ) ( not ( = ?auto_126138 ?auto_126142 ) ) ( not ( = ?auto_126139 ?auto_126142 ) ) ( not ( = ?auto_126140 ?auto_126142 ) ) ( not ( = ?auto_126141 ?auto_126142 ) ) ( not ( = ?auto_126143 ?auto_126142 ) ) ( ON ?auto_126137 ?auto_126136 ) ( ON-TABLE ?auto_126142 ) ( ON ?auto_126138 ?auto_126137 ) ( ON ?auto_126139 ?auto_126138 ) ( ON ?auto_126140 ?auto_126139 ) ( CLEAR ?auto_126140 ) ( HOLDING ?auto_126143 ) ( CLEAR ?auto_126141 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126141 ?auto_126143 )
      ( MAKE-4PILE ?auto_126136 ?auto_126137 ?auto_126138 ?auto_126139 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126144 - BLOCK
      ?auto_126145 - BLOCK
      ?auto_126146 - BLOCK
      ?auto_126147 - BLOCK
    )
    :vars
    (
      ?auto_126148 - BLOCK
      ?auto_126150 - BLOCK
      ?auto_126151 - BLOCK
      ?auto_126149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126144 ?auto_126145 ) ) ( not ( = ?auto_126144 ?auto_126146 ) ) ( not ( = ?auto_126144 ?auto_126147 ) ) ( not ( = ?auto_126145 ?auto_126146 ) ) ( not ( = ?auto_126145 ?auto_126147 ) ) ( not ( = ?auto_126146 ?auto_126147 ) ) ( not ( = ?auto_126144 ?auto_126148 ) ) ( not ( = ?auto_126145 ?auto_126148 ) ) ( not ( = ?auto_126146 ?auto_126148 ) ) ( not ( = ?auto_126147 ?auto_126148 ) ) ( ON-TABLE ?auto_126150 ) ( not ( = ?auto_126150 ?auto_126151 ) ) ( not ( = ?auto_126150 ?auto_126148 ) ) ( not ( = ?auto_126150 ?auto_126147 ) ) ( not ( = ?auto_126150 ?auto_126146 ) ) ( not ( = ?auto_126151 ?auto_126148 ) ) ( not ( = ?auto_126151 ?auto_126147 ) ) ( not ( = ?auto_126151 ?auto_126146 ) ) ( not ( = ?auto_126144 ?auto_126150 ) ) ( not ( = ?auto_126144 ?auto_126151 ) ) ( not ( = ?auto_126145 ?auto_126150 ) ) ( not ( = ?auto_126145 ?auto_126151 ) ) ( ON ?auto_126144 ?auto_126149 ) ( not ( = ?auto_126144 ?auto_126149 ) ) ( not ( = ?auto_126145 ?auto_126149 ) ) ( not ( = ?auto_126146 ?auto_126149 ) ) ( not ( = ?auto_126147 ?auto_126149 ) ) ( not ( = ?auto_126148 ?auto_126149 ) ) ( not ( = ?auto_126150 ?auto_126149 ) ) ( not ( = ?auto_126151 ?auto_126149 ) ) ( ON ?auto_126145 ?auto_126144 ) ( ON-TABLE ?auto_126149 ) ( ON ?auto_126146 ?auto_126145 ) ( ON ?auto_126147 ?auto_126146 ) ( ON ?auto_126148 ?auto_126147 ) ( CLEAR ?auto_126150 ) ( ON ?auto_126151 ?auto_126148 ) ( CLEAR ?auto_126151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126149 ?auto_126144 ?auto_126145 ?auto_126146 ?auto_126147 ?auto_126148 )
      ( MAKE-4PILE ?auto_126144 ?auto_126145 ?auto_126146 ?auto_126147 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126152 - BLOCK
      ?auto_126153 - BLOCK
      ?auto_126154 - BLOCK
      ?auto_126155 - BLOCK
    )
    :vars
    (
      ?auto_126156 - BLOCK
      ?auto_126159 - BLOCK
      ?auto_126157 - BLOCK
      ?auto_126158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126152 ?auto_126153 ) ) ( not ( = ?auto_126152 ?auto_126154 ) ) ( not ( = ?auto_126152 ?auto_126155 ) ) ( not ( = ?auto_126153 ?auto_126154 ) ) ( not ( = ?auto_126153 ?auto_126155 ) ) ( not ( = ?auto_126154 ?auto_126155 ) ) ( not ( = ?auto_126152 ?auto_126156 ) ) ( not ( = ?auto_126153 ?auto_126156 ) ) ( not ( = ?auto_126154 ?auto_126156 ) ) ( not ( = ?auto_126155 ?auto_126156 ) ) ( not ( = ?auto_126159 ?auto_126157 ) ) ( not ( = ?auto_126159 ?auto_126156 ) ) ( not ( = ?auto_126159 ?auto_126155 ) ) ( not ( = ?auto_126159 ?auto_126154 ) ) ( not ( = ?auto_126157 ?auto_126156 ) ) ( not ( = ?auto_126157 ?auto_126155 ) ) ( not ( = ?auto_126157 ?auto_126154 ) ) ( not ( = ?auto_126152 ?auto_126159 ) ) ( not ( = ?auto_126152 ?auto_126157 ) ) ( not ( = ?auto_126153 ?auto_126159 ) ) ( not ( = ?auto_126153 ?auto_126157 ) ) ( ON ?auto_126152 ?auto_126158 ) ( not ( = ?auto_126152 ?auto_126158 ) ) ( not ( = ?auto_126153 ?auto_126158 ) ) ( not ( = ?auto_126154 ?auto_126158 ) ) ( not ( = ?auto_126155 ?auto_126158 ) ) ( not ( = ?auto_126156 ?auto_126158 ) ) ( not ( = ?auto_126159 ?auto_126158 ) ) ( not ( = ?auto_126157 ?auto_126158 ) ) ( ON ?auto_126153 ?auto_126152 ) ( ON-TABLE ?auto_126158 ) ( ON ?auto_126154 ?auto_126153 ) ( ON ?auto_126155 ?auto_126154 ) ( ON ?auto_126156 ?auto_126155 ) ( ON ?auto_126157 ?auto_126156 ) ( CLEAR ?auto_126157 ) ( HOLDING ?auto_126159 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126159 )
      ( MAKE-4PILE ?auto_126152 ?auto_126153 ?auto_126154 ?auto_126155 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_126160 - BLOCK
      ?auto_126161 - BLOCK
      ?auto_126162 - BLOCK
      ?auto_126163 - BLOCK
    )
    :vars
    (
      ?auto_126166 - BLOCK
      ?auto_126164 - BLOCK
      ?auto_126165 - BLOCK
      ?auto_126167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126160 ?auto_126161 ) ) ( not ( = ?auto_126160 ?auto_126162 ) ) ( not ( = ?auto_126160 ?auto_126163 ) ) ( not ( = ?auto_126161 ?auto_126162 ) ) ( not ( = ?auto_126161 ?auto_126163 ) ) ( not ( = ?auto_126162 ?auto_126163 ) ) ( not ( = ?auto_126160 ?auto_126166 ) ) ( not ( = ?auto_126161 ?auto_126166 ) ) ( not ( = ?auto_126162 ?auto_126166 ) ) ( not ( = ?auto_126163 ?auto_126166 ) ) ( not ( = ?auto_126164 ?auto_126165 ) ) ( not ( = ?auto_126164 ?auto_126166 ) ) ( not ( = ?auto_126164 ?auto_126163 ) ) ( not ( = ?auto_126164 ?auto_126162 ) ) ( not ( = ?auto_126165 ?auto_126166 ) ) ( not ( = ?auto_126165 ?auto_126163 ) ) ( not ( = ?auto_126165 ?auto_126162 ) ) ( not ( = ?auto_126160 ?auto_126164 ) ) ( not ( = ?auto_126160 ?auto_126165 ) ) ( not ( = ?auto_126161 ?auto_126164 ) ) ( not ( = ?auto_126161 ?auto_126165 ) ) ( ON ?auto_126160 ?auto_126167 ) ( not ( = ?auto_126160 ?auto_126167 ) ) ( not ( = ?auto_126161 ?auto_126167 ) ) ( not ( = ?auto_126162 ?auto_126167 ) ) ( not ( = ?auto_126163 ?auto_126167 ) ) ( not ( = ?auto_126166 ?auto_126167 ) ) ( not ( = ?auto_126164 ?auto_126167 ) ) ( not ( = ?auto_126165 ?auto_126167 ) ) ( ON ?auto_126161 ?auto_126160 ) ( ON-TABLE ?auto_126167 ) ( ON ?auto_126162 ?auto_126161 ) ( ON ?auto_126163 ?auto_126162 ) ( ON ?auto_126166 ?auto_126163 ) ( ON ?auto_126165 ?auto_126166 ) ( ON ?auto_126164 ?auto_126165 ) ( CLEAR ?auto_126164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126167 ?auto_126160 ?auto_126161 ?auto_126162 ?auto_126163 ?auto_126166 ?auto_126165 )
      ( MAKE-4PILE ?auto_126160 ?auto_126161 ?auto_126162 ?auto_126163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126170 - BLOCK
      ?auto_126171 - BLOCK
    )
    :vars
    (
      ?auto_126172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126172 ?auto_126171 ) ( CLEAR ?auto_126172 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126170 ) ( ON ?auto_126171 ?auto_126170 ) ( not ( = ?auto_126170 ?auto_126171 ) ) ( not ( = ?auto_126170 ?auto_126172 ) ) ( not ( = ?auto_126171 ?auto_126172 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126172 ?auto_126171 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126173 - BLOCK
      ?auto_126174 - BLOCK
    )
    :vars
    (
      ?auto_126175 - BLOCK
      ?auto_126176 - BLOCK
      ?auto_126177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126175 ?auto_126174 ) ( CLEAR ?auto_126175 ) ( ON-TABLE ?auto_126173 ) ( ON ?auto_126174 ?auto_126173 ) ( not ( = ?auto_126173 ?auto_126174 ) ) ( not ( = ?auto_126173 ?auto_126175 ) ) ( not ( = ?auto_126174 ?auto_126175 ) ) ( HOLDING ?auto_126176 ) ( CLEAR ?auto_126177 ) ( not ( = ?auto_126173 ?auto_126176 ) ) ( not ( = ?auto_126173 ?auto_126177 ) ) ( not ( = ?auto_126174 ?auto_126176 ) ) ( not ( = ?auto_126174 ?auto_126177 ) ) ( not ( = ?auto_126175 ?auto_126176 ) ) ( not ( = ?auto_126175 ?auto_126177 ) ) ( not ( = ?auto_126176 ?auto_126177 ) ) )
    :subtasks
    ( ( !STACK ?auto_126176 ?auto_126177 )
      ( MAKE-2PILE ?auto_126173 ?auto_126174 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126178 - BLOCK
      ?auto_126179 - BLOCK
    )
    :vars
    (
      ?auto_126180 - BLOCK
      ?auto_126182 - BLOCK
      ?auto_126181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126180 ?auto_126179 ) ( ON-TABLE ?auto_126178 ) ( ON ?auto_126179 ?auto_126178 ) ( not ( = ?auto_126178 ?auto_126179 ) ) ( not ( = ?auto_126178 ?auto_126180 ) ) ( not ( = ?auto_126179 ?auto_126180 ) ) ( CLEAR ?auto_126182 ) ( not ( = ?auto_126178 ?auto_126181 ) ) ( not ( = ?auto_126178 ?auto_126182 ) ) ( not ( = ?auto_126179 ?auto_126181 ) ) ( not ( = ?auto_126179 ?auto_126182 ) ) ( not ( = ?auto_126180 ?auto_126181 ) ) ( not ( = ?auto_126180 ?auto_126182 ) ) ( not ( = ?auto_126181 ?auto_126182 ) ) ( ON ?auto_126181 ?auto_126180 ) ( CLEAR ?auto_126181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126178 ?auto_126179 ?auto_126180 )
      ( MAKE-2PILE ?auto_126178 ?auto_126179 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126183 - BLOCK
      ?auto_126184 - BLOCK
    )
    :vars
    (
      ?auto_126185 - BLOCK
      ?auto_126187 - BLOCK
      ?auto_126186 - BLOCK
      ?auto_126189 - BLOCK
      ?auto_126188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126185 ?auto_126184 ) ( ON-TABLE ?auto_126183 ) ( ON ?auto_126184 ?auto_126183 ) ( not ( = ?auto_126183 ?auto_126184 ) ) ( not ( = ?auto_126183 ?auto_126185 ) ) ( not ( = ?auto_126184 ?auto_126185 ) ) ( not ( = ?auto_126183 ?auto_126187 ) ) ( not ( = ?auto_126183 ?auto_126186 ) ) ( not ( = ?auto_126184 ?auto_126187 ) ) ( not ( = ?auto_126184 ?auto_126186 ) ) ( not ( = ?auto_126185 ?auto_126187 ) ) ( not ( = ?auto_126185 ?auto_126186 ) ) ( not ( = ?auto_126187 ?auto_126186 ) ) ( ON ?auto_126187 ?auto_126185 ) ( CLEAR ?auto_126187 ) ( HOLDING ?auto_126186 ) ( CLEAR ?auto_126189 ) ( ON-TABLE ?auto_126188 ) ( ON ?auto_126189 ?auto_126188 ) ( not ( = ?auto_126188 ?auto_126189 ) ) ( not ( = ?auto_126188 ?auto_126186 ) ) ( not ( = ?auto_126189 ?auto_126186 ) ) ( not ( = ?auto_126183 ?auto_126189 ) ) ( not ( = ?auto_126183 ?auto_126188 ) ) ( not ( = ?auto_126184 ?auto_126189 ) ) ( not ( = ?auto_126184 ?auto_126188 ) ) ( not ( = ?auto_126185 ?auto_126189 ) ) ( not ( = ?auto_126185 ?auto_126188 ) ) ( not ( = ?auto_126187 ?auto_126189 ) ) ( not ( = ?auto_126187 ?auto_126188 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126188 ?auto_126189 ?auto_126186 )
      ( MAKE-2PILE ?auto_126183 ?auto_126184 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126190 - BLOCK
      ?auto_126191 - BLOCK
    )
    :vars
    (
      ?auto_126196 - BLOCK
      ?auto_126194 - BLOCK
      ?auto_126195 - BLOCK
      ?auto_126192 - BLOCK
      ?auto_126193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126196 ?auto_126191 ) ( ON-TABLE ?auto_126190 ) ( ON ?auto_126191 ?auto_126190 ) ( not ( = ?auto_126190 ?auto_126191 ) ) ( not ( = ?auto_126190 ?auto_126196 ) ) ( not ( = ?auto_126191 ?auto_126196 ) ) ( not ( = ?auto_126190 ?auto_126194 ) ) ( not ( = ?auto_126190 ?auto_126195 ) ) ( not ( = ?auto_126191 ?auto_126194 ) ) ( not ( = ?auto_126191 ?auto_126195 ) ) ( not ( = ?auto_126196 ?auto_126194 ) ) ( not ( = ?auto_126196 ?auto_126195 ) ) ( not ( = ?auto_126194 ?auto_126195 ) ) ( ON ?auto_126194 ?auto_126196 ) ( CLEAR ?auto_126192 ) ( ON-TABLE ?auto_126193 ) ( ON ?auto_126192 ?auto_126193 ) ( not ( = ?auto_126193 ?auto_126192 ) ) ( not ( = ?auto_126193 ?auto_126195 ) ) ( not ( = ?auto_126192 ?auto_126195 ) ) ( not ( = ?auto_126190 ?auto_126192 ) ) ( not ( = ?auto_126190 ?auto_126193 ) ) ( not ( = ?auto_126191 ?auto_126192 ) ) ( not ( = ?auto_126191 ?auto_126193 ) ) ( not ( = ?auto_126196 ?auto_126192 ) ) ( not ( = ?auto_126196 ?auto_126193 ) ) ( not ( = ?auto_126194 ?auto_126192 ) ) ( not ( = ?auto_126194 ?auto_126193 ) ) ( ON ?auto_126195 ?auto_126194 ) ( CLEAR ?auto_126195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126190 ?auto_126191 ?auto_126196 ?auto_126194 )
      ( MAKE-2PILE ?auto_126190 ?auto_126191 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126197 - BLOCK
      ?auto_126198 - BLOCK
    )
    :vars
    (
      ?auto_126203 - BLOCK
      ?auto_126202 - BLOCK
      ?auto_126200 - BLOCK
      ?auto_126201 - BLOCK
      ?auto_126199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126203 ?auto_126198 ) ( ON-TABLE ?auto_126197 ) ( ON ?auto_126198 ?auto_126197 ) ( not ( = ?auto_126197 ?auto_126198 ) ) ( not ( = ?auto_126197 ?auto_126203 ) ) ( not ( = ?auto_126198 ?auto_126203 ) ) ( not ( = ?auto_126197 ?auto_126202 ) ) ( not ( = ?auto_126197 ?auto_126200 ) ) ( not ( = ?auto_126198 ?auto_126202 ) ) ( not ( = ?auto_126198 ?auto_126200 ) ) ( not ( = ?auto_126203 ?auto_126202 ) ) ( not ( = ?auto_126203 ?auto_126200 ) ) ( not ( = ?auto_126202 ?auto_126200 ) ) ( ON ?auto_126202 ?auto_126203 ) ( ON-TABLE ?auto_126201 ) ( not ( = ?auto_126201 ?auto_126199 ) ) ( not ( = ?auto_126201 ?auto_126200 ) ) ( not ( = ?auto_126199 ?auto_126200 ) ) ( not ( = ?auto_126197 ?auto_126199 ) ) ( not ( = ?auto_126197 ?auto_126201 ) ) ( not ( = ?auto_126198 ?auto_126199 ) ) ( not ( = ?auto_126198 ?auto_126201 ) ) ( not ( = ?auto_126203 ?auto_126199 ) ) ( not ( = ?auto_126203 ?auto_126201 ) ) ( not ( = ?auto_126202 ?auto_126199 ) ) ( not ( = ?auto_126202 ?auto_126201 ) ) ( ON ?auto_126200 ?auto_126202 ) ( CLEAR ?auto_126200 ) ( HOLDING ?auto_126199 ) ( CLEAR ?auto_126201 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126201 ?auto_126199 )
      ( MAKE-2PILE ?auto_126197 ?auto_126198 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126204 - BLOCK
      ?auto_126205 - BLOCK
    )
    :vars
    (
      ?auto_126208 - BLOCK
      ?auto_126207 - BLOCK
      ?auto_126210 - BLOCK
      ?auto_126209 - BLOCK
      ?auto_126206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126208 ?auto_126205 ) ( ON-TABLE ?auto_126204 ) ( ON ?auto_126205 ?auto_126204 ) ( not ( = ?auto_126204 ?auto_126205 ) ) ( not ( = ?auto_126204 ?auto_126208 ) ) ( not ( = ?auto_126205 ?auto_126208 ) ) ( not ( = ?auto_126204 ?auto_126207 ) ) ( not ( = ?auto_126204 ?auto_126210 ) ) ( not ( = ?auto_126205 ?auto_126207 ) ) ( not ( = ?auto_126205 ?auto_126210 ) ) ( not ( = ?auto_126208 ?auto_126207 ) ) ( not ( = ?auto_126208 ?auto_126210 ) ) ( not ( = ?auto_126207 ?auto_126210 ) ) ( ON ?auto_126207 ?auto_126208 ) ( ON-TABLE ?auto_126209 ) ( not ( = ?auto_126209 ?auto_126206 ) ) ( not ( = ?auto_126209 ?auto_126210 ) ) ( not ( = ?auto_126206 ?auto_126210 ) ) ( not ( = ?auto_126204 ?auto_126206 ) ) ( not ( = ?auto_126204 ?auto_126209 ) ) ( not ( = ?auto_126205 ?auto_126206 ) ) ( not ( = ?auto_126205 ?auto_126209 ) ) ( not ( = ?auto_126208 ?auto_126206 ) ) ( not ( = ?auto_126208 ?auto_126209 ) ) ( not ( = ?auto_126207 ?auto_126206 ) ) ( not ( = ?auto_126207 ?auto_126209 ) ) ( ON ?auto_126210 ?auto_126207 ) ( CLEAR ?auto_126209 ) ( ON ?auto_126206 ?auto_126210 ) ( CLEAR ?auto_126206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126204 ?auto_126205 ?auto_126208 ?auto_126207 ?auto_126210 )
      ( MAKE-2PILE ?auto_126204 ?auto_126205 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126211 - BLOCK
      ?auto_126212 - BLOCK
    )
    :vars
    (
      ?auto_126217 - BLOCK
      ?auto_126214 - BLOCK
      ?auto_126213 - BLOCK
      ?auto_126215 - BLOCK
      ?auto_126216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126217 ?auto_126212 ) ( ON-TABLE ?auto_126211 ) ( ON ?auto_126212 ?auto_126211 ) ( not ( = ?auto_126211 ?auto_126212 ) ) ( not ( = ?auto_126211 ?auto_126217 ) ) ( not ( = ?auto_126212 ?auto_126217 ) ) ( not ( = ?auto_126211 ?auto_126214 ) ) ( not ( = ?auto_126211 ?auto_126213 ) ) ( not ( = ?auto_126212 ?auto_126214 ) ) ( not ( = ?auto_126212 ?auto_126213 ) ) ( not ( = ?auto_126217 ?auto_126214 ) ) ( not ( = ?auto_126217 ?auto_126213 ) ) ( not ( = ?auto_126214 ?auto_126213 ) ) ( ON ?auto_126214 ?auto_126217 ) ( not ( = ?auto_126215 ?auto_126216 ) ) ( not ( = ?auto_126215 ?auto_126213 ) ) ( not ( = ?auto_126216 ?auto_126213 ) ) ( not ( = ?auto_126211 ?auto_126216 ) ) ( not ( = ?auto_126211 ?auto_126215 ) ) ( not ( = ?auto_126212 ?auto_126216 ) ) ( not ( = ?auto_126212 ?auto_126215 ) ) ( not ( = ?auto_126217 ?auto_126216 ) ) ( not ( = ?auto_126217 ?auto_126215 ) ) ( not ( = ?auto_126214 ?auto_126216 ) ) ( not ( = ?auto_126214 ?auto_126215 ) ) ( ON ?auto_126213 ?auto_126214 ) ( ON ?auto_126216 ?auto_126213 ) ( CLEAR ?auto_126216 ) ( HOLDING ?auto_126215 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126215 )
      ( MAKE-2PILE ?auto_126211 ?auto_126212 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126218 - BLOCK
      ?auto_126219 - BLOCK
    )
    :vars
    (
      ?auto_126222 - BLOCK
      ?auto_126224 - BLOCK
      ?auto_126221 - BLOCK
      ?auto_126220 - BLOCK
      ?auto_126223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126222 ?auto_126219 ) ( ON-TABLE ?auto_126218 ) ( ON ?auto_126219 ?auto_126218 ) ( not ( = ?auto_126218 ?auto_126219 ) ) ( not ( = ?auto_126218 ?auto_126222 ) ) ( not ( = ?auto_126219 ?auto_126222 ) ) ( not ( = ?auto_126218 ?auto_126224 ) ) ( not ( = ?auto_126218 ?auto_126221 ) ) ( not ( = ?auto_126219 ?auto_126224 ) ) ( not ( = ?auto_126219 ?auto_126221 ) ) ( not ( = ?auto_126222 ?auto_126224 ) ) ( not ( = ?auto_126222 ?auto_126221 ) ) ( not ( = ?auto_126224 ?auto_126221 ) ) ( ON ?auto_126224 ?auto_126222 ) ( not ( = ?auto_126220 ?auto_126223 ) ) ( not ( = ?auto_126220 ?auto_126221 ) ) ( not ( = ?auto_126223 ?auto_126221 ) ) ( not ( = ?auto_126218 ?auto_126223 ) ) ( not ( = ?auto_126218 ?auto_126220 ) ) ( not ( = ?auto_126219 ?auto_126223 ) ) ( not ( = ?auto_126219 ?auto_126220 ) ) ( not ( = ?auto_126222 ?auto_126223 ) ) ( not ( = ?auto_126222 ?auto_126220 ) ) ( not ( = ?auto_126224 ?auto_126223 ) ) ( not ( = ?auto_126224 ?auto_126220 ) ) ( ON ?auto_126221 ?auto_126224 ) ( ON ?auto_126223 ?auto_126221 ) ( ON ?auto_126220 ?auto_126223 ) ( CLEAR ?auto_126220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126218 ?auto_126219 ?auto_126222 ?auto_126224 ?auto_126221 ?auto_126223 )
      ( MAKE-2PILE ?auto_126218 ?auto_126219 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126225 - BLOCK
      ?auto_126226 - BLOCK
    )
    :vars
    (
      ?auto_126230 - BLOCK
      ?auto_126231 - BLOCK
      ?auto_126228 - BLOCK
      ?auto_126229 - BLOCK
      ?auto_126227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126230 ?auto_126226 ) ( ON-TABLE ?auto_126225 ) ( ON ?auto_126226 ?auto_126225 ) ( not ( = ?auto_126225 ?auto_126226 ) ) ( not ( = ?auto_126225 ?auto_126230 ) ) ( not ( = ?auto_126226 ?auto_126230 ) ) ( not ( = ?auto_126225 ?auto_126231 ) ) ( not ( = ?auto_126225 ?auto_126228 ) ) ( not ( = ?auto_126226 ?auto_126231 ) ) ( not ( = ?auto_126226 ?auto_126228 ) ) ( not ( = ?auto_126230 ?auto_126231 ) ) ( not ( = ?auto_126230 ?auto_126228 ) ) ( not ( = ?auto_126231 ?auto_126228 ) ) ( ON ?auto_126231 ?auto_126230 ) ( not ( = ?auto_126229 ?auto_126227 ) ) ( not ( = ?auto_126229 ?auto_126228 ) ) ( not ( = ?auto_126227 ?auto_126228 ) ) ( not ( = ?auto_126225 ?auto_126227 ) ) ( not ( = ?auto_126225 ?auto_126229 ) ) ( not ( = ?auto_126226 ?auto_126227 ) ) ( not ( = ?auto_126226 ?auto_126229 ) ) ( not ( = ?auto_126230 ?auto_126227 ) ) ( not ( = ?auto_126230 ?auto_126229 ) ) ( not ( = ?auto_126231 ?auto_126227 ) ) ( not ( = ?auto_126231 ?auto_126229 ) ) ( ON ?auto_126228 ?auto_126231 ) ( ON ?auto_126227 ?auto_126228 ) ( HOLDING ?auto_126229 ) ( CLEAR ?auto_126227 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126225 ?auto_126226 ?auto_126230 ?auto_126231 ?auto_126228 ?auto_126227 ?auto_126229 )
      ( MAKE-2PILE ?auto_126225 ?auto_126226 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126232 - BLOCK
      ?auto_126233 - BLOCK
    )
    :vars
    (
      ?auto_126237 - BLOCK
      ?auto_126236 - BLOCK
      ?auto_126238 - BLOCK
      ?auto_126234 - BLOCK
      ?auto_126235 - BLOCK
      ?auto_126239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126237 ?auto_126233 ) ( ON-TABLE ?auto_126232 ) ( ON ?auto_126233 ?auto_126232 ) ( not ( = ?auto_126232 ?auto_126233 ) ) ( not ( = ?auto_126232 ?auto_126237 ) ) ( not ( = ?auto_126233 ?auto_126237 ) ) ( not ( = ?auto_126232 ?auto_126236 ) ) ( not ( = ?auto_126232 ?auto_126238 ) ) ( not ( = ?auto_126233 ?auto_126236 ) ) ( not ( = ?auto_126233 ?auto_126238 ) ) ( not ( = ?auto_126237 ?auto_126236 ) ) ( not ( = ?auto_126237 ?auto_126238 ) ) ( not ( = ?auto_126236 ?auto_126238 ) ) ( ON ?auto_126236 ?auto_126237 ) ( not ( = ?auto_126234 ?auto_126235 ) ) ( not ( = ?auto_126234 ?auto_126238 ) ) ( not ( = ?auto_126235 ?auto_126238 ) ) ( not ( = ?auto_126232 ?auto_126235 ) ) ( not ( = ?auto_126232 ?auto_126234 ) ) ( not ( = ?auto_126233 ?auto_126235 ) ) ( not ( = ?auto_126233 ?auto_126234 ) ) ( not ( = ?auto_126237 ?auto_126235 ) ) ( not ( = ?auto_126237 ?auto_126234 ) ) ( not ( = ?auto_126236 ?auto_126235 ) ) ( not ( = ?auto_126236 ?auto_126234 ) ) ( ON ?auto_126238 ?auto_126236 ) ( ON ?auto_126235 ?auto_126238 ) ( CLEAR ?auto_126235 ) ( ON ?auto_126234 ?auto_126239 ) ( CLEAR ?auto_126234 ) ( HAND-EMPTY ) ( not ( = ?auto_126232 ?auto_126239 ) ) ( not ( = ?auto_126233 ?auto_126239 ) ) ( not ( = ?auto_126237 ?auto_126239 ) ) ( not ( = ?auto_126236 ?auto_126239 ) ) ( not ( = ?auto_126238 ?auto_126239 ) ) ( not ( = ?auto_126234 ?auto_126239 ) ) ( not ( = ?auto_126235 ?auto_126239 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126234 ?auto_126239 )
      ( MAKE-2PILE ?auto_126232 ?auto_126233 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126240 - BLOCK
      ?auto_126241 - BLOCK
    )
    :vars
    (
      ?auto_126242 - BLOCK
      ?auto_126246 - BLOCK
      ?auto_126247 - BLOCK
      ?auto_126243 - BLOCK
      ?auto_126245 - BLOCK
      ?auto_126244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126242 ?auto_126241 ) ( ON-TABLE ?auto_126240 ) ( ON ?auto_126241 ?auto_126240 ) ( not ( = ?auto_126240 ?auto_126241 ) ) ( not ( = ?auto_126240 ?auto_126242 ) ) ( not ( = ?auto_126241 ?auto_126242 ) ) ( not ( = ?auto_126240 ?auto_126246 ) ) ( not ( = ?auto_126240 ?auto_126247 ) ) ( not ( = ?auto_126241 ?auto_126246 ) ) ( not ( = ?auto_126241 ?auto_126247 ) ) ( not ( = ?auto_126242 ?auto_126246 ) ) ( not ( = ?auto_126242 ?auto_126247 ) ) ( not ( = ?auto_126246 ?auto_126247 ) ) ( ON ?auto_126246 ?auto_126242 ) ( not ( = ?auto_126243 ?auto_126245 ) ) ( not ( = ?auto_126243 ?auto_126247 ) ) ( not ( = ?auto_126245 ?auto_126247 ) ) ( not ( = ?auto_126240 ?auto_126245 ) ) ( not ( = ?auto_126240 ?auto_126243 ) ) ( not ( = ?auto_126241 ?auto_126245 ) ) ( not ( = ?auto_126241 ?auto_126243 ) ) ( not ( = ?auto_126242 ?auto_126245 ) ) ( not ( = ?auto_126242 ?auto_126243 ) ) ( not ( = ?auto_126246 ?auto_126245 ) ) ( not ( = ?auto_126246 ?auto_126243 ) ) ( ON ?auto_126247 ?auto_126246 ) ( ON ?auto_126243 ?auto_126244 ) ( CLEAR ?auto_126243 ) ( not ( = ?auto_126240 ?auto_126244 ) ) ( not ( = ?auto_126241 ?auto_126244 ) ) ( not ( = ?auto_126242 ?auto_126244 ) ) ( not ( = ?auto_126246 ?auto_126244 ) ) ( not ( = ?auto_126247 ?auto_126244 ) ) ( not ( = ?auto_126243 ?auto_126244 ) ) ( not ( = ?auto_126245 ?auto_126244 ) ) ( HOLDING ?auto_126245 ) ( CLEAR ?auto_126247 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126240 ?auto_126241 ?auto_126242 ?auto_126246 ?auto_126247 ?auto_126245 )
      ( MAKE-2PILE ?auto_126240 ?auto_126241 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126248 - BLOCK
      ?auto_126249 - BLOCK
    )
    :vars
    (
      ?auto_126250 - BLOCK
      ?auto_126252 - BLOCK
      ?auto_126253 - BLOCK
      ?auto_126254 - BLOCK
      ?auto_126255 - BLOCK
      ?auto_126251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126250 ?auto_126249 ) ( ON-TABLE ?auto_126248 ) ( ON ?auto_126249 ?auto_126248 ) ( not ( = ?auto_126248 ?auto_126249 ) ) ( not ( = ?auto_126248 ?auto_126250 ) ) ( not ( = ?auto_126249 ?auto_126250 ) ) ( not ( = ?auto_126248 ?auto_126252 ) ) ( not ( = ?auto_126248 ?auto_126253 ) ) ( not ( = ?auto_126249 ?auto_126252 ) ) ( not ( = ?auto_126249 ?auto_126253 ) ) ( not ( = ?auto_126250 ?auto_126252 ) ) ( not ( = ?auto_126250 ?auto_126253 ) ) ( not ( = ?auto_126252 ?auto_126253 ) ) ( ON ?auto_126252 ?auto_126250 ) ( not ( = ?auto_126254 ?auto_126255 ) ) ( not ( = ?auto_126254 ?auto_126253 ) ) ( not ( = ?auto_126255 ?auto_126253 ) ) ( not ( = ?auto_126248 ?auto_126255 ) ) ( not ( = ?auto_126248 ?auto_126254 ) ) ( not ( = ?auto_126249 ?auto_126255 ) ) ( not ( = ?auto_126249 ?auto_126254 ) ) ( not ( = ?auto_126250 ?auto_126255 ) ) ( not ( = ?auto_126250 ?auto_126254 ) ) ( not ( = ?auto_126252 ?auto_126255 ) ) ( not ( = ?auto_126252 ?auto_126254 ) ) ( ON ?auto_126253 ?auto_126252 ) ( ON ?auto_126254 ?auto_126251 ) ( not ( = ?auto_126248 ?auto_126251 ) ) ( not ( = ?auto_126249 ?auto_126251 ) ) ( not ( = ?auto_126250 ?auto_126251 ) ) ( not ( = ?auto_126252 ?auto_126251 ) ) ( not ( = ?auto_126253 ?auto_126251 ) ) ( not ( = ?auto_126254 ?auto_126251 ) ) ( not ( = ?auto_126255 ?auto_126251 ) ) ( CLEAR ?auto_126253 ) ( ON ?auto_126255 ?auto_126254 ) ( CLEAR ?auto_126255 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126251 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126251 ?auto_126254 )
      ( MAKE-2PILE ?auto_126248 ?auto_126249 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126256 - BLOCK
      ?auto_126257 - BLOCK
    )
    :vars
    (
      ?auto_126258 - BLOCK
      ?auto_126261 - BLOCK
      ?auto_126263 - BLOCK
      ?auto_126260 - BLOCK
      ?auto_126259 - BLOCK
      ?auto_126262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126258 ?auto_126257 ) ( ON-TABLE ?auto_126256 ) ( ON ?auto_126257 ?auto_126256 ) ( not ( = ?auto_126256 ?auto_126257 ) ) ( not ( = ?auto_126256 ?auto_126258 ) ) ( not ( = ?auto_126257 ?auto_126258 ) ) ( not ( = ?auto_126256 ?auto_126261 ) ) ( not ( = ?auto_126256 ?auto_126263 ) ) ( not ( = ?auto_126257 ?auto_126261 ) ) ( not ( = ?auto_126257 ?auto_126263 ) ) ( not ( = ?auto_126258 ?auto_126261 ) ) ( not ( = ?auto_126258 ?auto_126263 ) ) ( not ( = ?auto_126261 ?auto_126263 ) ) ( ON ?auto_126261 ?auto_126258 ) ( not ( = ?auto_126260 ?auto_126259 ) ) ( not ( = ?auto_126260 ?auto_126263 ) ) ( not ( = ?auto_126259 ?auto_126263 ) ) ( not ( = ?auto_126256 ?auto_126259 ) ) ( not ( = ?auto_126256 ?auto_126260 ) ) ( not ( = ?auto_126257 ?auto_126259 ) ) ( not ( = ?auto_126257 ?auto_126260 ) ) ( not ( = ?auto_126258 ?auto_126259 ) ) ( not ( = ?auto_126258 ?auto_126260 ) ) ( not ( = ?auto_126261 ?auto_126259 ) ) ( not ( = ?auto_126261 ?auto_126260 ) ) ( ON ?auto_126260 ?auto_126262 ) ( not ( = ?auto_126256 ?auto_126262 ) ) ( not ( = ?auto_126257 ?auto_126262 ) ) ( not ( = ?auto_126258 ?auto_126262 ) ) ( not ( = ?auto_126261 ?auto_126262 ) ) ( not ( = ?auto_126263 ?auto_126262 ) ) ( not ( = ?auto_126260 ?auto_126262 ) ) ( not ( = ?auto_126259 ?auto_126262 ) ) ( ON ?auto_126259 ?auto_126260 ) ( CLEAR ?auto_126259 ) ( ON-TABLE ?auto_126262 ) ( HOLDING ?auto_126263 ) ( CLEAR ?auto_126261 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126256 ?auto_126257 ?auto_126258 ?auto_126261 ?auto_126263 )
      ( MAKE-2PILE ?auto_126256 ?auto_126257 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126264 - BLOCK
      ?auto_126265 - BLOCK
    )
    :vars
    (
      ?auto_126270 - BLOCK
      ?auto_126266 - BLOCK
      ?auto_126268 - BLOCK
      ?auto_126271 - BLOCK
      ?auto_126269 - BLOCK
      ?auto_126267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126270 ?auto_126265 ) ( ON-TABLE ?auto_126264 ) ( ON ?auto_126265 ?auto_126264 ) ( not ( = ?auto_126264 ?auto_126265 ) ) ( not ( = ?auto_126264 ?auto_126270 ) ) ( not ( = ?auto_126265 ?auto_126270 ) ) ( not ( = ?auto_126264 ?auto_126266 ) ) ( not ( = ?auto_126264 ?auto_126268 ) ) ( not ( = ?auto_126265 ?auto_126266 ) ) ( not ( = ?auto_126265 ?auto_126268 ) ) ( not ( = ?auto_126270 ?auto_126266 ) ) ( not ( = ?auto_126270 ?auto_126268 ) ) ( not ( = ?auto_126266 ?auto_126268 ) ) ( ON ?auto_126266 ?auto_126270 ) ( not ( = ?auto_126271 ?auto_126269 ) ) ( not ( = ?auto_126271 ?auto_126268 ) ) ( not ( = ?auto_126269 ?auto_126268 ) ) ( not ( = ?auto_126264 ?auto_126269 ) ) ( not ( = ?auto_126264 ?auto_126271 ) ) ( not ( = ?auto_126265 ?auto_126269 ) ) ( not ( = ?auto_126265 ?auto_126271 ) ) ( not ( = ?auto_126270 ?auto_126269 ) ) ( not ( = ?auto_126270 ?auto_126271 ) ) ( not ( = ?auto_126266 ?auto_126269 ) ) ( not ( = ?auto_126266 ?auto_126271 ) ) ( ON ?auto_126271 ?auto_126267 ) ( not ( = ?auto_126264 ?auto_126267 ) ) ( not ( = ?auto_126265 ?auto_126267 ) ) ( not ( = ?auto_126270 ?auto_126267 ) ) ( not ( = ?auto_126266 ?auto_126267 ) ) ( not ( = ?auto_126268 ?auto_126267 ) ) ( not ( = ?auto_126271 ?auto_126267 ) ) ( not ( = ?auto_126269 ?auto_126267 ) ) ( ON ?auto_126269 ?auto_126271 ) ( ON-TABLE ?auto_126267 ) ( CLEAR ?auto_126266 ) ( ON ?auto_126268 ?auto_126269 ) ( CLEAR ?auto_126268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126267 ?auto_126271 ?auto_126269 )
      ( MAKE-2PILE ?auto_126264 ?auto_126265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126272 - BLOCK
      ?auto_126273 - BLOCK
    )
    :vars
    (
      ?auto_126276 - BLOCK
      ?auto_126277 - BLOCK
      ?auto_126279 - BLOCK
      ?auto_126278 - BLOCK
      ?auto_126275 - BLOCK
      ?auto_126274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126276 ?auto_126273 ) ( ON-TABLE ?auto_126272 ) ( ON ?auto_126273 ?auto_126272 ) ( not ( = ?auto_126272 ?auto_126273 ) ) ( not ( = ?auto_126272 ?auto_126276 ) ) ( not ( = ?auto_126273 ?auto_126276 ) ) ( not ( = ?auto_126272 ?auto_126277 ) ) ( not ( = ?auto_126272 ?auto_126279 ) ) ( not ( = ?auto_126273 ?auto_126277 ) ) ( not ( = ?auto_126273 ?auto_126279 ) ) ( not ( = ?auto_126276 ?auto_126277 ) ) ( not ( = ?auto_126276 ?auto_126279 ) ) ( not ( = ?auto_126277 ?auto_126279 ) ) ( not ( = ?auto_126278 ?auto_126275 ) ) ( not ( = ?auto_126278 ?auto_126279 ) ) ( not ( = ?auto_126275 ?auto_126279 ) ) ( not ( = ?auto_126272 ?auto_126275 ) ) ( not ( = ?auto_126272 ?auto_126278 ) ) ( not ( = ?auto_126273 ?auto_126275 ) ) ( not ( = ?auto_126273 ?auto_126278 ) ) ( not ( = ?auto_126276 ?auto_126275 ) ) ( not ( = ?auto_126276 ?auto_126278 ) ) ( not ( = ?auto_126277 ?auto_126275 ) ) ( not ( = ?auto_126277 ?auto_126278 ) ) ( ON ?auto_126278 ?auto_126274 ) ( not ( = ?auto_126272 ?auto_126274 ) ) ( not ( = ?auto_126273 ?auto_126274 ) ) ( not ( = ?auto_126276 ?auto_126274 ) ) ( not ( = ?auto_126277 ?auto_126274 ) ) ( not ( = ?auto_126279 ?auto_126274 ) ) ( not ( = ?auto_126278 ?auto_126274 ) ) ( not ( = ?auto_126275 ?auto_126274 ) ) ( ON ?auto_126275 ?auto_126278 ) ( ON-TABLE ?auto_126274 ) ( ON ?auto_126279 ?auto_126275 ) ( CLEAR ?auto_126279 ) ( HOLDING ?auto_126277 ) ( CLEAR ?auto_126276 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126272 ?auto_126273 ?auto_126276 ?auto_126277 )
      ( MAKE-2PILE ?auto_126272 ?auto_126273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126280 - BLOCK
      ?auto_126281 - BLOCK
    )
    :vars
    (
      ?auto_126285 - BLOCK
      ?auto_126286 - BLOCK
      ?auto_126287 - BLOCK
      ?auto_126282 - BLOCK
      ?auto_126284 - BLOCK
      ?auto_126283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126285 ?auto_126281 ) ( ON-TABLE ?auto_126280 ) ( ON ?auto_126281 ?auto_126280 ) ( not ( = ?auto_126280 ?auto_126281 ) ) ( not ( = ?auto_126280 ?auto_126285 ) ) ( not ( = ?auto_126281 ?auto_126285 ) ) ( not ( = ?auto_126280 ?auto_126286 ) ) ( not ( = ?auto_126280 ?auto_126287 ) ) ( not ( = ?auto_126281 ?auto_126286 ) ) ( not ( = ?auto_126281 ?auto_126287 ) ) ( not ( = ?auto_126285 ?auto_126286 ) ) ( not ( = ?auto_126285 ?auto_126287 ) ) ( not ( = ?auto_126286 ?auto_126287 ) ) ( not ( = ?auto_126282 ?auto_126284 ) ) ( not ( = ?auto_126282 ?auto_126287 ) ) ( not ( = ?auto_126284 ?auto_126287 ) ) ( not ( = ?auto_126280 ?auto_126284 ) ) ( not ( = ?auto_126280 ?auto_126282 ) ) ( not ( = ?auto_126281 ?auto_126284 ) ) ( not ( = ?auto_126281 ?auto_126282 ) ) ( not ( = ?auto_126285 ?auto_126284 ) ) ( not ( = ?auto_126285 ?auto_126282 ) ) ( not ( = ?auto_126286 ?auto_126284 ) ) ( not ( = ?auto_126286 ?auto_126282 ) ) ( ON ?auto_126282 ?auto_126283 ) ( not ( = ?auto_126280 ?auto_126283 ) ) ( not ( = ?auto_126281 ?auto_126283 ) ) ( not ( = ?auto_126285 ?auto_126283 ) ) ( not ( = ?auto_126286 ?auto_126283 ) ) ( not ( = ?auto_126287 ?auto_126283 ) ) ( not ( = ?auto_126282 ?auto_126283 ) ) ( not ( = ?auto_126284 ?auto_126283 ) ) ( ON ?auto_126284 ?auto_126282 ) ( ON-TABLE ?auto_126283 ) ( ON ?auto_126287 ?auto_126284 ) ( CLEAR ?auto_126285 ) ( ON ?auto_126286 ?auto_126287 ) ( CLEAR ?auto_126286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126283 ?auto_126282 ?auto_126284 ?auto_126287 )
      ( MAKE-2PILE ?auto_126280 ?auto_126281 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126304 - BLOCK
      ?auto_126305 - BLOCK
    )
    :vars
    (
      ?auto_126310 - BLOCK
      ?auto_126308 - BLOCK
      ?auto_126309 - BLOCK
      ?auto_126311 - BLOCK
      ?auto_126307 - BLOCK
      ?auto_126306 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126304 ) ( not ( = ?auto_126304 ?auto_126305 ) ) ( not ( = ?auto_126304 ?auto_126310 ) ) ( not ( = ?auto_126305 ?auto_126310 ) ) ( not ( = ?auto_126304 ?auto_126308 ) ) ( not ( = ?auto_126304 ?auto_126309 ) ) ( not ( = ?auto_126305 ?auto_126308 ) ) ( not ( = ?auto_126305 ?auto_126309 ) ) ( not ( = ?auto_126310 ?auto_126308 ) ) ( not ( = ?auto_126310 ?auto_126309 ) ) ( not ( = ?auto_126308 ?auto_126309 ) ) ( not ( = ?auto_126311 ?auto_126307 ) ) ( not ( = ?auto_126311 ?auto_126309 ) ) ( not ( = ?auto_126307 ?auto_126309 ) ) ( not ( = ?auto_126304 ?auto_126307 ) ) ( not ( = ?auto_126304 ?auto_126311 ) ) ( not ( = ?auto_126305 ?auto_126307 ) ) ( not ( = ?auto_126305 ?auto_126311 ) ) ( not ( = ?auto_126310 ?auto_126307 ) ) ( not ( = ?auto_126310 ?auto_126311 ) ) ( not ( = ?auto_126308 ?auto_126307 ) ) ( not ( = ?auto_126308 ?auto_126311 ) ) ( ON ?auto_126311 ?auto_126306 ) ( not ( = ?auto_126304 ?auto_126306 ) ) ( not ( = ?auto_126305 ?auto_126306 ) ) ( not ( = ?auto_126310 ?auto_126306 ) ) ( not ( = ?auto_126308 ?auto_126306 ) ) ( not ( = ?auto_126309 ?auto_126306 ) ) ( not ( = ?auto_126311 ?auto_126306 ) ) ( not ( = ?auto_126307 ?auto_126306 ) ) ( ON ?auto_126307 ?auto_126311 ) ( ON-TABLE ?auto_126306 ) ( ON ?auto_126309 ?auto_126307 ) ( ON ?auto_126308 ?auto_126309 ) ( ON ?auto_126310 ?auto_126308 ) ( CLEAR ?auto_126310 ) ( HOLDING ?auto_126305 ) ( CLEAR ?auto_126304 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126304 ?auto_126305 ?auto_126310 )
      ( MAKE-2PILE ?auto_126304 ?auto_126305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126312 - BLOCK
      ?auto_126313 - BLOCK
    )
    :vars
    (
      ?auto_126318 - BLOCK
      ?auto_126314 - BLOCK
      ?auto_126319 - BLOCK
      ?auto_126316 - BLOCK
      ?auto_126317 - BLOCK
      ?auto_126315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126312 ) ( not ( = ?auto_126312 ?auto_126313 ) ) ( not ( = ?auto_126312 ?auto_126318 ) ) ( not ( = ?auto_126313 ?auto_126318 ) ) ( not ( = ?auto_126312 ?auto_126314 ) ) ( not ( = ?auto_126312 ?auto_126319 ) ) ( not ( = ?auto_126313 ?auto_126314 ) ) ( not ( = ?auto_126313 ?auto_126319 ) ) ( not ( = ?auto_126318 ?auto_126314 ) ) ( not ( = ?auto_126318 ?auto_126319 ) ) ( not ( = ?auto_126314 ?auto_126319 ) ) ( not ( = ?auto_126316 ?auto_126317 ) ) ( not ( = ?auto_126316 ?auto_126319 ) ) ( not ( = ?auto_126317 ?auto_126319 ) ) ( not ( = ?auto_126312 ?auto_126317 ) ) ( not ( = ?auto_126312 ?auto_126316 ) ) ( not ( = ?auto_126313 ?auto_126317 ) ) ( not ( = ?auto_126313 ?auto_126316 ) ) ( not ( = ?auto_126318 ?auto_126317 ) ) ( not ( = ?auto_126318 ?auto_126316 ) ) ( not ( = ?auto_126314 ?auto_126317 ) ) ( not ( = ?auto_126314 ?auto_126316 ) ) ( ON ?auto_126316 ?auto_126315 ) ( not ( = ?auto_126312 ?auto_126315 ) ) ( not ( = ?auto_126313 ?auto_126315 ) ) ( not ( = ?auto_126318 ?auto_126315 ) ) ( not ( = ?auto_126314 ?auto_126315 ) ) ( not ( = ?auto_126319 ?auto_126315 ) ) ( not ( = ?auto_126316 ?auto_126315 ) ) ( not ( = ?auto_126317 ?auto_126315 ) ) ( ON ?auto_126317 ?auto_126316 ) ( ON-TABLE ?auto_126315 ) ( ON ?auto_126319 ?auto_126317 ) ( ON ?auto_126314 ?auto_126319 ) ( ON ?auto_126318 ?auto_126314 ) ( CLEAR ?auto_126312 ) ( ON ?auto_126313 ?auto_126318 ) ( CLEAR ?auto_126313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126315 ?auto_126316 ?auto_126317 ?auto_126319 ?auto_126314 ?auto_126318 )
      ( MAKE-2PILE ?auto_126312 ?auto_126313 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126320 - BLOCK
      ?auto_126321 - BLOCK
    )
    :vars
    (
      ?auto_126323 - BLOCK
      ?auto_126325 - BLOCK
      ?auto_126324 - BLOCK
      ?auto_126326 - BLOCK
      ?auto_126322 - BLOCK
      ?auto_126327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126320 ?auto_126321 ) ) ( not ( = ?auto_126320 ?auto_126323 ) ) ( not ( = ?auto_126321 ?auto_126323 ) ) ( not ( = ?auto_126320 ?auto_126325 ) ) ( not ( = ?auto_126320 ?auto_126324 ) ) ( not ( = ?auto_126321 ?auto_126325 ) ) ( not ( = ?auto_126321 ?auto_126324 ) ) ( not ( = ?auto_126323 ?auto_126325 ) ) ( not ( = ?auto_126323 ?auto_126324 ) ) ( not ( = ?auto_126325 ?auto_126324 ) ) ( not ( = ?auto_126326 ?auto_126322 ) ) ( not ( = ?auto_126326 ?auto_126324 ) ) ( not ( = ?auto_126322 ?auto_126324 ) ) ( not ( = ?auto_126320 ?auto_126322 ) ) ( not ( = ?auto_126320 ?auto_126326 ) ) ( not ( = ?auto_126321 ?auto_126322 ) ) ( not ( = ?auto_126321 ?auto_126326 ) ) ( not ( = ?auto_126323 ?auto_126322 ) ) ( not ( = ?auto_126323 ?auto_126326 ) ) ( not ( = ?auto_126325 ?auto_126322 ) ) ( not ( = ?auto_126325 ?auto_126326 ) ) ( ON ?auto_126326 ?auto_126327 ) ( not ( = ?auto_126320 ?auto_126327 ) ) ( not ( = ?auto_126321 ?auto_126327 ) ) ( not ( = ?auto_126323 ?auto_126327 ) ) ( not ( = ?auto_126325 ?auto_126327 ) ) ( not ( = ?auto_126324 ?auto_126327 ) ) ( not ( = ?auto_126326 ?auto_126327 ) ) ( not ( = ?auto_126322 ?auto_126327 ) ) ( ON ?auto_126322 ?auto_126326 ) ( ON-TABLE ?auto_126327 ) ( ON ?auto_126324 ?auto_126322 ) ( ON ?auto_126325 ?auto_126324 ) ( ON ?auto_126323 ?auto_126325 ) ( ON ?auto_126321 ?auto_126323 ) ( CLEAR ?auto_126321 ) ( HOLDING ?auto_126320 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126320 )
      ( MAKE-2PILE ?auto_126320 ?auto_126321 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_126328 - BLOCK
      ?auto_126329 - BLOCK
    )
    :vars
    (
      ?auto_126332 - BLOCK
      ?auto_126330 - BLOCK
      ?auto_126331 - BLOCK
      ?auto_126335 - BLOCK
      ?auto_126333 - BLOCK
      ?auto_126334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126328 ?auto_126329 ) ) ( not ( = ?auto_126328 ?auto_126332 ) ) ( not ( = ?auto_126329 ?auto_126332 ) ) ( not ( = ?auto_126328 ?auto_126330 ) ) ( not ( = ?auto_126328 ?auto_126331 ) ) ( not ( = ?auto_126329 ?auto_126330 ) ) ( not ( = ?auto_126329 ?auto_126331 ) ) ( not ( = ?auto_126332 ?auto_126330 ) ) ( not ( = ?auto_126332 ?auto_126331 ) ) ( not ( = ?auto_126330 ?auto_126331 ) ) ( not ( = ?auto_126335 ?auto_126333 ) ) ( not ( = ?auto_126335 ?auto_126331 ) ) ( not ( = ?auto_126333 ?auto_126331 ) ) ( not ( = ?auto_126328 ?auto_126333 ) ) ( not ( = ?auto_126328 ?auto_126335 ) ) ( not ( = ?auto_126329 ?auto_126333 ) ) ( not ( = ?auto_126329 ?auto_126335 ) ) ( not ( = ?auto_126332 ?auto_126333 ) ) ( not ( = ?auto_126332 ?auto_126335 ) ) ( not ( = ?auto_126330 ?auto_126333 ) ) ( not ( = ?auto_126330 ?auto_126335 ) ) ( ON ?auto_126335 ?auto_126334 ) ( not ( = ?auto_126328 ?auto_126334 ) ) ( not ( = ?auto_126329 ?auto_126334 ) ) ( not ( = ?auto_126332 ?auto_126334 ) ) ( not ( = ?auto_126330 ?auto_126334 ) ) ( not ( = ?auto_126331 ?auto_126334 ) ) ( not ( = ?auto_126335 ?auto_126334 ) ) ( not ( = ?auto_126333 ?auto_126334 ) ) ( ON ?auto_126333 ?auto_126335 ) ( ON-TABLE ?auto_126334 ) ( ON ?auto_126331 ?auto_126333 ) ( ON ?auto_126330 ?auto_126331 ) ( ON ?auto_126332 ?auto_126330 ) ( ON ?auto_126329 ?auto_126332 ) ( ON ?auto_126328 ?auto_126329 ) ( CLEAR ?auto_126328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126334 ?auto_126335 ?auto_126333 ?auto_126331 ?auto_126330 ?auto_126332 ?auto_126329 )
      ( MAKE-2PILE ?auto_126328 ?auto_126329 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126341 - BLOCK
      ?auto_126342 - BLOCK
      ?auto_126343 - BLOCK
      ?auto_126344 - BLOCK
      ?auto_126345 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_126345 ) ( CLEAR ?auto_126344 ) ( ON-TABLE ?auto_126341 ) ( ON ?auto_126342 ?auto_126341 ) ( ON ?auto_126343 ?auto_126342 ) ( ON ?auto_126344 ?auto_126343 ) ( not ( = ?auto_126341 ?auto_126342 ) ) ( not ( = ?auto_126341 ?auto_126343 ) ) ( not ( = ?auto_126341 ?auto_126344 ) ) ( not ( = ?auto_126341 ?auto_126345 ) ) ( not ( = ?auto_126342 ?auto_126343 ) ) ( not ( = ?auto_126342 ?auto_126344 ) ) ( not ( = ?auto_126342 ?auto_126345 ) ) ( not ( = ?auto_126343 ?auto_126344 ) ) ( not ( = ?auto_126343 ?auto_126345 ) ) ( not ( = ?auto_126344 ?auto_126345 ) ) )
    :subtasks
    ( ( !STACK ?auto_126345 ?auto_126344 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126346 - BLOCK
      ?auto_126347 - BLOCK
      ?auto_126348 - BLOCK
      ?auto_126349 - BLOCK
      ?auto_126350 - BLOCK
    )
    :vars
    (
      ?auto_126351 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126349 ) ( ON-TABLE ?auto_126346 ) ( ON ?auto_126347 ?auto_126346 ) ( ON ?auto_126348 ?auto_126347 ) ( ON ?auto_126349 ?auto_126348 ) ( not ( = ?auto_126346 ?auto_126347 ) ) ( not ( = ?auto_126346 ?auto_126348 ) ) ( not ( = ?auto_126346 ?auto_126349 ) ) ( not ( = ?auto_126346 ?auto_126350 ) ) ( not ( = ?auto_126347 ?auto_126348 ) ) ( not ( = ?auto_126347 ?auto_126349 ) ) ( not ( = ?auto_126347 ?auto_126350 ) ) ( not ( = ?auto_126348 ?auto_126349 ) ) ( not ( = ?auto_126348 ?auto_126350 ) ) ( not ( = ?auto_126349 ?auto_126350 ) ) ( ON ?auto_126350 ?auto_126351 ) ( CLEAR ?auto_126350 ) ( HAND-EMPTY ) ( not ( = ?auto_126346 ?auto_126351 ) ) ( not ( = ?auto_126347 ?auto_126351 ) ) ( not ( = ?auto_126348 ?auto_126351 ) ) ( not ( = ?auto_126349 ?auto_126351 ) ) ( not ( = ?auto_126350 ?auto_126351 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126350 ?auto_126351 )
      ( MAKE-5PILE ?auto_126346 ?auto_126347 ?auto_126348 ?auto_126349 ?auto_126350 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126352 - BLOCK
      ?auto_126353 - BLOCK
      ?auto_126354 - BLOCK
      ?auto_126355 - BLOCK
      ?auto_126356 - BLOCK
    )
    :vars
    (
      ?auto_126357 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126352 ) ( ON ?auto_126353 ?auto_126352 ) ( ON ?auto_126354 ?auto_126353 ) ( not ( = ?auto_126352 ?auto_126353 ) ) ( not ( = ?auto_126352 ?auto_126354 ) ) ( not ( = ?auto_126352 ?auto_126355 ) ) ( not ( = ?auto_126352 ?auto_126356 ) ) ( not ( = ?auto_126353 ?auto_126354 ) ) ( not ( = ?auto_126353 ?auto_126355 ) ) ( not ( = ?auto_126353 ?auto_126356 ) ) ( not ( = ?auto_126354 ?auto_126355 ) ) ( not ( = ?auto_126354 ?auto_126356 ) ) ( not ( = ?auto_126355 ?auto_126356 ) ) ( ON ?auto_126356 ?auto_126357 ) ( CLEAR ?auto_126356 ) ( not ( = ?auto_126352 ?auto_126357 ) ) ( not ( = ?auto_126353 ?auto_126357 ) ) ( not ( = ?auto_126354 ?auto_126357 ) ) ( not ( = ?auto_126355 ?auto_126357 ) ) ( not ( = ?auto_126356 ?auto_126357 ) ) ( HOLDING ?auto_126355 ) ( CLEAR ?auto_126354 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126352 ?auto_126353 ?auto_126354 ?auto_126355 )
      ( MAKE-5PILE ?auto_126352 ?auto_126353 ?auto_126354 ?auto_126355 ?auto_126356 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126358 - BLOCK
      ?auto_126359 - BLOCK
      ?auto_126360 - BLOCK
      ?auto_126361 - BLOCK
      ?auto_126362 - BLOCK
    )
    :vars
    (
      ?auto_126363 - BLOCK
      ?auto_126364 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126358 ) ( ON ?auto_126359 ?auto_126358 ) ( ON ?auto_126360 ?auto_126359 ) ( not ( = ?auto_126358 ?auto_126359 ) ) ( not ( = ?auto_126358 ?auto_126360 ) ) ( not ( = ?auto_126358 ?auto_126361 ) ) ( not ( = ?auto_126358 ?auto_126362 ) ) ( not ( = ?auto_126359 ?auto_126360 ) ) ( not ( = ?auto_126359 ?auto_126361 ) ) ( not ( = ?auto_126359 ?auto_126362 ) ) ( not ( = ?auto_126360 ?auto_126361 ) ) ( not ( = ?auto_126360 ?auto_126362 ) ) ( not ( = ?auto_126361 ?auto_126362 ) ) ( ON ?auto_126362 ?auto_126363 ) ( not ( = ?auto_126358 ?auto_126363 ) ) ( not ( = ?auto_126359 ?auto_126363 ) ) ( not ( = ?auto_126360 ?auto_126363 ) ) ( not ( = ?auto_126361 ?auto_126363 ) ) ( not ( = ?auto_126362 ?auto_126363 ) ) ( CLEAR ?auto_126360 ) ( ON ?auto_126361 ?auto_126362 ) ( CLEAR ?auto_126361 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126364 ) ( ON ?auto_126363 ?auto_126364 ) ( not ( = ?auto_126364 ?auto_126363 ) ) ( not ( = ?auto_126364 ?auto_126362 ) ) ( not ( = ?auto_126364 ?auto_126361 ) ) ( not ( = ?auto_126358 ?auto_126364 ) ) ( not ( = ?auto_126359 ?auto_126364 ) ) ( not ( = ?auto_126360 ?auto_126364 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126364 ?auto_126363 ?auto_126362 )
      ( MAKE-5PILE ?auto_126358 ?auto_126359 ?auto_126360 ?auto_126361 ?auto_126362 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126365 - BLOCK
      ?auto_126366 - BLOCK
      ?auto_126367 - BLOCK
      ?auto_126368 - BLOCK
      ?auto_126369 - BLOCK
    )
    :vars
    (
      ?auto_126371 - BLOCK
      ?auto_126370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126365 ) ( ON ?auto_126366 ?auto_126365 ) ( not ( = ?auto_126365 ?auto_126366 ) ) ( not ( = ?auto_126365 ?auto_126367 ) ) ( not ( = ?auto_126365 ?auto_126368 ) ) ( not ( = ?auto_126365 ?auto_126369 ) ) ( not ( = ?auto_126366 ?auto_126367 ) ) ( not ( = ?auto_126366 ?auto_126368 ) ) ( not ( = ?auto_126366 ?auto_126369 ) ) ( not ( = ?auto_126367 ?auto_126368 ) ) ( not ( = ?auto_126367 ?auto_126369 ) ) ( not ( = ?auto_126368 ?auto_126369 ) ) ( ON ?auto_126369 ?auto_126371 ) ( not ( = ?auto_126365 ?auto_126371 ) ) ( not ( = ?auto_126366 ?auto_126371 ) ) ( not ( = ?auto_126367 ?auto_126371 ) ) ( not ( = ?auto_126368 ?auto_126371 ) ) ( not ( = ?auto_126369 ?auto_126371 ) ) ( ON ?auto_126368 ?auto_126369 ) ( CLEAR ?auto_126368 ) ( ON-TABLE ?auto_126370 ) ( ON ?auto_126371 ?auto_126370 ) ( not ( = ?auto_126370 ?auto_126371 ) ) ( not ( = ?auto_126370 ?auto_126369 ) ) ( not ( = ?auto_126370 ?auto_126368 ) ) ( not ( = ?auto_126365 ?auto_126370 ) ) ( not ( = ?auto_126366 ?auto_126370 ) ) ( not ( = ?auto_126367 ?auto_126370 ) ) ( HOLDING ?auto_126367 ) ( CLEAR ?auto_126366 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126365 ?auto_126366 ?auto_126367 )
      ( MAKE-5PILE ?auto_126365 ?auto_126366 ?auto_126367 ?auto_126368 ?auto_126369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126372 - BLOCK
      ?auto_126373 - BLOCK
      ?auto_126374 - BLOCK
      ?auto_126375 - BLOCK
      ?auto_126376 - BLOCK
    )
    :vars
    (
      ?auto_126377 - BLOCK
      ?auto_126378 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126372 ) ( ON ?auto_126373 ?auto_126372 ) ( not ( = ?auto_126372 ?auto_126373 ) ) ( not ( = ?auto_126372 ?auto_126374 ) ) ( not ( = ?auto_126372 ?auto_126375 ) ) ( not ( = ?auto_126372 ?auto_126376 ) ) ( not ( = ?auto_126373 ?auto_126374 ) ) ( not ( = ?auto_126373 ?auto_126375 ) ) ( not ( = ?auto_126373 ?auto_126376 ) ) ( not ( = ?auto_126374 ?auto_126375 ) ) ( not ( = ?auto_126374 ?auto_126376 ) ) ( not ( = ?auto_126375 ?auto_126376 ) ) ( ON ?auto_126376 ?auto_126377 ) ( not ( = ?auto_126372 ?auto_126377 ) ) ( not ( = ?auto_126373 ?auto_126377 ) ) ( not ( = ?auto_126374 ?auto_126377 ) ) ( not ( = ?auto_126375 ?auto_126377 ) ) ( not ( = ?auto_126376 ?auto_126377 ) ) ( ON ?auto_126375 ?auto_126376 ) ( ON-TABLE ?auto_126378 ) ( ON ?auto_126377 ?auto_126378 ) ( not ( = ?auto_126378 ?auto_126377 ) ) ( not ( = ?auto_126378 ?auto_126376 ) ) ( not ( = ?auto_126378 ?auto_126375 ) ) ( not ( = ?auto_126372 ?auto_126378 ) ) ( not ( = ?auto_126373 ?auto_126378 ) ) ( not ( = ?auto_126374 ?auto_126378 ) ) ( CLEAR ?auto_126373 ) ( ON ?auto_126374 ?auto_126375 ) ( CLEAR ?auto_126374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126378 ?auto_126377 ?auto_126376 ?auto_126375 )
      ( MAKE-5PILE ?auto_126372 ?auto_126373 ?auto_126374 ?auto_126375 ?auto_126376 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126379 - BLOCK
      ?auto_126380 - BLOCK
      ?auto_126381 - BLOCK
      ?auto_126382 - BLOCK
      ?auto_126383 - BLOCK
    )
    :vars
    (
      ?auto_126384 - BLOCK
      ?auto_126385 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126379 ) ( not ( = ?auto_126379 ?auto_126380 ) ) ( not ( = ?auto_126379 ?auto_126381 ) ) ( not ( = ?auto_126379 ?auto_126382 ) ) ( not ( = ?auto_126379 ?auto_126383 ) ) ( not ( = ?auto_126380 ?auto_126381 ) ) ( not ( = ?auto_126380 ?auto_126382 ) ) ( not ( = ?auto_126380 ?auto_126383 ) ) ( not ( = ?auto_126381 ?auto_126382 ) ) ( not ( = ?auto_126381 ?auto_126383 ) ) ( not ( = ?auto_126382 ?auto_126383 ) ) ( ON ?auto_126383 ?auto_126384 ) ( not ( = ?auto_126379 ?auto_126384 ) ) ( not ( = ?auto_126380 ?auto_126384 ) ) ( not ( = ?auto_126381 ?auto_126384 ) ) ( not ( = ?auto_126382 ?auto_126384 ) ) ( not ( = ?auto_126383 ?auto_126384 ) ) ( ON ?auto_126382 ?auto_126383 ) ( ON-TABLE ?auto_126385 ) ( ON ?auto_126384 ?auto_126385 ) ( not ( = ?auto_126385 ?auto_126384 ) ) ( not ( = ?auto_126385 ?auto_126383 ) ) ( not ( = ?auto_126385 ?auto_126382 ) ) ( not ( = ?auto_126379 ?auto_126385 ) ) ( not ( = ?auto_126380 ?auto_126385 ) ) ( not ( = ?auto_126381 ?auto_126385 ) ) ( ON ?auto_126381 ?auto_126382 ) ( CLEAR ?auto_126381 ) ( HOLDING ?auto_126380 ) ( CLEAR ?auto_126379 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126379 ?auto_126380 )
      ( MAKE-5PILE ?auto_126379 ?auto_126380 ?auto_126381 ?auto_126382 ?auto_126383 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126386 - BLOCK
      ?auto_126387 - BLOCK
      ?auto_126388 - BLOCK
      ?auto_126389 - BLOCK
      ?auto_126390 - BLOCK
    )
    :vars
    (
      ?auto_126391 - BLOCK
      ?auto_126392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126386 ) ( not ( = ?auto_126386 ?auto_126387 ) ) ( not ( = ?auto_126386 ?auto_126388 ) ) ( not ( = ?auto_126386 ?auto_126389 ) ) ( not ( = ?auto_126386 ?auto_126390 ) ) ( not ( = ?auto_126387 ?auto_126388 ) ) ( not ( = ?auto_126387 ?auto_126389 ) ) ( not ( = ?auto_126387 ?auto_126390 ) ) ( not ( = ?auto_126388 ?auto_126389 ) ) ( not ( = ?auto_126388 ?auto_126390 ) ) ( not ( = ?auto_126389 ?auto_126390 ) ) ( ON ?auto_126390 ?auto_126391 ) ( not ( = ?auto_126386 ?auto_126391 ) ) ( not ( = ?auto_126387 ?auto_126391 ) ) ( not ( = ?auto_126388 ?auto_126391 ) ) ( not ( = ?auto_126389 ?auto_126391 ) ) ( not ( = ?auto_126390 ?auto_126391 ) ) ( ON ?auto_126389 ?auto_126390 ) ( ON-TABLE ?auto_126392 ) ( ON ?auto_126391 ?auto_126392 ) ( not ( = ?auto_126392 ?auto_126391 ) ) ( not ( = ?auto_126392 ?auto_126390 ) ) ( not ( = ?auto_126392 ?auto_126389 ) ) ( not ( = ?auto_126386 ?auto_126392 ) ) ( not ( = ?auto_126387 ?auto_126392 ) ) ( not ( = ?auto_126388 ?auto_126392 ) ) ( ON ?auto_126388 ?auto_126389 ) ( CLEAR ?auto_126386 ) ( ON ?auto_126387 ?auto_126388 ) ( CLEAR ?auto_126387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126392 ?auto_126391 ?auto_126390 ?auto_126389 ?auto_126388 )
      ( MAKE-5PILE ?auto_126386 ?auto_126387 ?auto_126388 ?auto_126389 ?auto_126390 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126393 - BLOCK
      ?auto_126394 - BLOCK
      ?auto_126395 - BLOCK
      ?auto_126396 - BLOCK
      ?auto_126397 - BLOCK
    )
    :vars
    (
      ?auto_126398 - BLOCK
      ?auto_126399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126393 ?auto_126394 ) ) ( not ( = ?auto_126393 ?auto_126395 ) ) ( not ( = ?auto_126393 ?auto_126396 ) ) ( not ( = ?auto_126393 ?auto_126397 ) ) ( not ( = ?auto_126394 ?auto_126395 ) ) ( not ( = ?auto_126394 ?auto_126396 ) ) ( not ( = ?auto_126394 ?auto_126397 ) ) ( not ( = ?auto_126395 ?auto_126396 ) ) ( not ( = ?auto_126395 ?auto_126397 ) ) ( not ( = ?auto_126396 ?auto_126397 ) ) ( ON ?auto_126397 ?auto_126398 ) ( not ( = ?auto_126393 ?auto_126398 ) ) ( not ( = ?auto_126394 ?auto_126398 ) ) ( not ( = ?auto_126395 ?auto_126398 ) ) ( not ( = ?auto_126396 ?auto_126398 ) ) ( not ( = ?auto_126397 ?auto_126398 ) ) ( ON ?auto_126396 ?auto_126397 ) ( ON-TABLE ?auto_126399 ) ( ON ?auto_126398 ?auto_126399 ) ( not ( = ?auto_126399 ?auto_126398 ) ) ( not ( = ?auto_126399 ?auto_126397 ) ) ( not ( = ?auto_126399 ?auto_126396 ) ) ( not ( = ?auto_126393 ?auto_126399 ) ) ( not ( = ?auto_126394 ?auto_126399 ) ) ( not ( = ?auto_126395 ?auto_126399 ) ) ( ON ?auto_126395 ?auto_126396 ) ( ON ?auto_126394 ?auto_126395 ) ( CLEAR ?auto_126394 ) ( HOLDING ?auto_126393 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126393 )
      ( MAKE-5PILE ?auto_126393 ?auto_126394 ?auto_126395 ?auto_126396 ?auto_126397 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126400 - BLOCK
      ?auto_126401 - BLOCK
      ?auto_126402 - BLOCK
      ?auto_126403 - BLOCK
      ?auto_126404 - BLOCK
    )
    :vars
    (
      ?auto_126405 - BLOCK
      ?auto_126406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126400 ?auto_126401 ) ) ( not ( = ?auto_126400 ?auto_126402 ) ) ( not ( = ?auto_126400 ?auto_126403 ) ) ( not ( = ?auto_126400 ?auto_126404 ) ) ( not ( = ?auto_126401 ?auto_126402 ) ) ( not ( = ?auto_126401 ?auto_126403 ) ) ( not ( = ?auto_126401 ?auto_126404 ) ) ( not ( = ?auto_126402 ?auto_126403 ) ) ( not ( = ?auto_126402 ?auto_126404 ) ) ( not ( = ?auto_126403 ?auto_126404 ) ) ( ON ?auto_126404 ?auto_126405 ) ( not ( = ?auto_126400 ?auto_126405 ) ) ( not ( = ?auto_126401 ?auto_126405 ) ) ( not ( = ?auto_126402 ?auto_126405 ) ) ( not ( = ?auto_126403 ?auto_126405 ) ) ( not ( = ?auto_126404 ?auto_126405 ) ) ( ON ?auto_126403 ?auto_126404 ) ( ON-TABLE ?auto_126406 ) ( ON ?auto_126405 ?auto_126406 ) ( not ( = ?auto_126406 ?auto_126405 ) ) ( not ( = ?auto_126406 ?auto_126404 ) ) ( not ( = ?auto_126406 ?auto_126403 ) ) ( not ( = ?auto_126400 ?auto_126406 ) ) ( not ( = ?auto_126401 ?auto_126406 ) ) ( not ( = ?auto_126402 ?auto_126406 ) ) ( ON ?auto_126402 ?auto_126403 ) ( ON ?auto_126401 ?auto_126402 ) ( ON ?auto_126400 ?auto_126401 ) ( CLEAR ?auto_126400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126406 ?auto_126405 ?auto_126404 ?auto_126403 ?auto_126402 ?auto_126401 )
      ( MAKE-5PILE ?auto_126400 ?auto_126401 ?auto_126402 ?auto_126403 ?auto_126404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126407 - BLOCK
      ?auto_126408 - BLOCK
      ?auto_126409 - BLOCK
      ?auto_126410 - BLOCK
      ?auto_126411 - BLOCK
    )
    :vars
    (
      ?auto_126412 - BLOCK
      ?auto_126413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126407 ?auto_126408 ) ) ( not ( = ?auto_126407 ?auto_126409 ) ) ( not ( = ?auto_126407 ?auto_126410 ) ) ( not ( = ?auto_126407 ?auto_126411 ) ) ( not ( = ?auto_126408 ?auto_126409 ) ) ( not ( = ?auto_126408 ?auto_126410 ) ) ( not ( = ?auto_126408 ?auto_126411 ) ) ( not ( = ?auto_126409 ?auto_126410 ) ) ( not ( = ?auto_126409 ?auto_126411 ) ) ( not ( = ?auto_126410 ?auto_126411 ) ) ( ON ?auto_126411 ?auto_126412 ) ( not ( = ?auto_126407 ?auto_126412 ) ) ( not ( = ?auto_126408 ?auto_126412 ) ) ( not ( = ?auto_126409 ?auto_126412 ) ) ( not ( = ?auto_126410 ?auto_126412 ) ) ( not ( = ?auto_126411 ?auto_126412 ) ) ( ON ?auto_126410 ?auto_126411 ) ( ON-TABLE ?auto_126413 ) ( ON ?auto_126412 ?auto_126413 ) ( not ( = ?auto_126413 ?auto_126412 ) ) ( not ( = ?auto_126413 ?auto_126411 ) ) ( not ( = ?auto_126413 ?auto_126410 ) ) ( not ( = ?auto_126407 ?auto_126413 ) ) ( not ( = ?auto_126408 ?auto_126413 ) ) ( not ( = ?auto_126409 ?auto_126413 ) ) ( ON ?auto_126409 ?auto_126410 ) ( ON ?auto_126408 ?auto_126409 ) ( HOLDING ?auto_126407 ) ( CLEAR ?auto_126408 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126413 ?auto_126412 ?auto_126411 ?auto_126410 ?auto_126409 ?auto_126408 ?auto_126407 )
      ( MAKE-5PILE ?auto_126407 ?auto_126408 ?auto_126409 ?auto_126410 ?auto_126411 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126414 - BLOCK
      ?auto_126415 - BLOCK
      ?auto_126416 - BLOCK
      ?auto_126417 - BLOCK
      ?auto_126418 - BLOCK
    )
    :vars
    (
      ?auto_126419 - BLOCK
      ?auto_126420 - BLOCK
      ?auto_126421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126414 ?auto_126415 ) ) ( not ( = ?auto_126414 ?auto_126416 ) ) ( not ( = ?auto_126414 ?auto_126417 ) ) ( not ( = ?auto_126414 ?auto_126418 ) ) ( not ( = ?auto_126415 ?auto_126416 ) ) ( not ( = ?auto_126415 ?auto_126417 ) ) ( not ( = ?auto_126415 ?auto_126418 ) ) ( not ( = ?auto_126416 ?auto_126417 ) ) ( not ( = ?auto_126416 ?auto_126418 ) ) ( not ( = ?auto_126417 ?auto_126418 ) ) ( ON ?auto_126418 ?auto_126419 ) ( not ( = ?auto_126414 ?auto_126419 ) ) ( not ( = ?auto_126415 ?auto_126419 ) ) ( not ( = ?auto_126416 ?auto_126419 ) ) ( not ( = ?auto_126417 ?auto_126419 ) ) ( not ( = ?auto_126418 ?auto_126419 ) ) ( ON ?auto_126417 ?auto_126418 ) ( ON-TABLE ?auto_126420 ) ( ON ?auto_126419 ?auto_126420 ) ( not ( = ?auto_126420 ?auto_126419 ) ) ( not ( = ?auto_126420 ?auto_126418 ) ) ( not ( = ?auto_126420 ?auto_126417 ) ) ( not ( = ?auto_126414 ?auto_126420 ) ) ( not ( = ?auto_126415 ?auto_126420 ) ) ( not ( = ?auto_126416 ?auto_126420 ) ) ( ON ?auto_126416 ?auto_126417 ) ( ON ?auto_126415 ?auto_126416 ) ( CLEAR ?auto_126415 ) ( ON ?auto_126414 ?auto_126421 ) ( CLEAR ?auto_126414 ) ( HAND-EMPTY ) ( not ( = ?auto_126414 ?auto_126421 ) ) ( not ( = ?auto_126415 ?auto_126421 ) ) ( not ( = ?auto_126416 ?auto_126421 ) ) ( not ( = ?auto_126417 ?auto_126421 ) ) ( not ( = ?auto_126418 ?auto_126421 ) ) ( not ( = ?auto_126419 ?auto_126421 ) ) ( not ( = ?auto_126420 ?auto_126421 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126414 ?auto_126421 )
      ( MAKE-5PILE ?auto_126414 ?auto_126415 ?auto_126416 ?auto_126417 ?auto_126418 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126422 - BLOCK
      ?auto_126423 - BLOCK
      ?auto_126424 - BLOCK
      ?auto_126425 - BLOCK
      ?auto_126426 - BLOCK
    )
    :vars
    (
      ?auto_126429 - BLOCK
      ?auto_126428 - BLOCK
      ?auto_126427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126422 ?auto_126423 ) ) ( not ( = ?auto_126422 ?auto_126424 ) ) ( not ( = ?auto_126422 ?auto_126425 ) ) ( not ( = ?auto_126422 ?auto_126426 ) ) ( not ( = ?auto_126423 ?auto_126424 ) ) ( not ( = ?auto_126423 ?auto_126425 ) ) ( not ( = ?auto_126423 ?auto_126426 ) ) ( not ( = ?auto_126424 ?auto_126425 ) ) ( not ( = ?auto_126424 ?auto_126426 ) ) ( not ( = ?auto_126425 ?auto_126426 ) ) ( ON ?auto_126426 ?auto_126429 ) ( not ( = ?auto_126422 ?auto_126429 ) ) ( not ( = ?auto_126423 ?auto_126429 ) ) ( not ( = ?auto_126424 ?auto_126429 ) ) ( not ( = ?auto_126425 ?auto_126429 ) ) ( not ( = ?auto_126426 ?auto_126429 ) ) ( ON ?auto_126425 ?auto_126426 ) ( ON-TABLE ?auto_126428 ) ( ON ?auto_126429 ?auto_126428 ) ( not ( = ?auto_126428 ?auto_126429 ) ) ( not ( = ?auto_126428 ?auto_126426 ) ) ( not ( = ?auto_126428 ?auto_126425 ) ) ( not ( = ?auto_126422 ?auto_126428 ) ) ( not ( = ?auto_126423 ?auto_126428 ) ) ( not ( = ?auto_126424 ?auto_126428 ) ) ( ON ?auto_126424 ?auto_126425 ) ( ON ?auto_126422 ?auto_126427 ) ( CLEAR ?auto_126422 ) ( not ( = ?auto_126422 ?auto_126427 ) ) ( not ( = ?auto_126423 ?auto_126427 ) ) ( not ( = ?auto_126424 ?auto_126427 ) ) ( not ( = ?auto_126425 ?auto_126427 ) ) ( not ( = ?auto_126426 ?auto_126427 ) ) ( not ( = ?auto_126429 ?auto_126427 ) ) ( not ( = ?auto_126428 ?auto_126427 ) ) ( HOLDING ?auto_126423 ) ( CLEAR ?auto_126424 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126428 ?auto_126429 ?auto_126426 ?auto_126425 ?auto_126424 ?auto_126423 )
      ( MAKE-5PILE ?auto_126422 ?auto_126423 ?auto_126424 ?auto_126425 ?auto_126426 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126430 - BLOCK
      ?auto_126431 - BLOCK
      ?auto_126432 - BLOCK
      ?auto_126433 - BLOCK
      ?auto_126434 - BLOCK
    )
    :vars
    (
      ?auto_126436 - BLOCK
      ?auto_126437 - BLOCK
      ?auto_126435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126430 ?auto_126431 ) ) ( not ( = ?auto_126430 ?auto_126432 ) ) ( not ( = ?auto_126430 ?auto_126433 ) ) ( not ( = ?auto_126430 ?auto_126434 ) ) ( not ( = ?auto_126431 ?auto_126432 ) ) ( not ( = ?auto_126431 ?auto_126433 ) ) ( not ( = ?auto_126431 ?auto_126434 ) ) ( not ( = ?auto_126432 ?auto_126433 ) ) ( not ( = ?auto_126432 ?auto_126434 ) ) ( not ( = ?auto_126433 ?auto_126434 ) ) ( ON ?auto_126434 ?auto_126436 ) ( not ( = ?auto_126430 ?auto_126436 ) ) ( not ( = ?auto_126431 ?auto_126436 ) ) ( not ( = ?auto_126432 ?auto_126436 ) ) ( not ( = ?auto_126433 ?auto_126436 ) ) ( not ( = ?auto_126434 ?auto_126436 ) ) ( ON ?auto_126433 ?auto_126434 ) ( ON-TABLE ?auto_126437 ) ( ON ?auto_126436 ?auto_126437 ) ( not ( = ?auto_126437 ?auto_126436 ) ) ( not ( = ?auto_126437 ?auto_126434 ) ) ( not ( = ?auto_126437 ?auto_126433 ) ) ( not ( = ?auto_126430 ?auto_126437 ) ) ( not ( = ?auto_126431 ?auto_126437 ) ) ( not ( = ?auto_126432 ?auto_126437 ) ) ( ON ?auto_126432 ?auto_126433 ) ( ON ?auto_126430 ?auto_126435 ) ( not ( = ?auto_126430 ?auto_126435 ) ) ( not ( = ?auto_126431 ?auto_126435 ) ) ( not ( = ?auto_126432 ?auto_126435 ) ) ( not ( = ?auto_126433 ?auto_126435 ) ) ( not ( = ?auto_126434 ?auto_126435 ) ) ( not ( = ?auto_126436 ?auto_126435 ) ) ( not ( = ?auto_126437 ?auto_126435 ) ) ( CLEAR ?auto_126432 ) ( ON ?auto_126431 ?auto_126430 ) ( CLEAR ?auto_126431 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126435 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126435 ?auto_126430 )
      ( MAKE-5PILE ?auto_126430 ?auto_126431 ?auto_126432 ?auto_126433 ?auto_126434 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126438 - BLOCK
      ?auto_126439 - BLOCK
      ?auto_126440 - BLOCK
      ?auto_126441 - BLOCK
      ?auto_126442 - BLOCK
    )
    :vars
    (
      ?auto_126445 - BLOCK
      ?auto_126443 - BLOCK
      ?auto_126444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126438 ?auto_126439 ) ) ( not ( = ?auto_126438 ?auto_126440 ) ) ( not ( = ?auto_126438 ?auto_126441 ) ) ( not ( = ?auto_126438 ?auto_126442 ) ) ( not ( = ?auto_126439 ?auto_126440 ) ) ( not ( = ?auto_126439 ?auto_126441 ) ) ( not ( = ?auto_126439 ?auto_126442 ) ) ( not ( = ?auto_126440 ?auto_126441 ) ) ( not ( = ?auto_126440 ?auto_126442 ) ) ( not ( = ?auto_126441 ?auto_126442 ) ) ( ON ?auto_126442 ?auto_126445 ) ( not ( = ?auto_126438 ?auto_126445 ) ) ( not ( = ?auto_126439 ?auto_126445 ) ) ( not ( = ?auto_126440 ?auto_126445 ) ) ( not ( = ?auto_126441 ?auto_126445 ) ) ( not ( = ?auto_126442 ?auto_126445 ) ) ( ON ?auto_126441 ?auto_126442 ) ( ON-TABLE ?auto_126443 ) ( ON ?auto_126445 ?auto_126443 ) ( not ( = ?auto_126443 ?auto_126445 ) ) ( not ( = ?auto_126443 ?auto_126442 ) ) ( not ( = ?auto_126443 ?auto_126441 ) ) ( not ( = ?auto_126438 ?auto_126443 ) ) ( not ( = ?auto_126439 ?auto_126443 ) ) ( not ( = ?auto_126440 ?auto_126443 ) ) ( ON ?auto_126438 ?auto_126444 ) ( not ( = ?auto_126438 ?auto_126444 ) ) ( not ( = ?auto_126439 ?auto_126444 ) ) ( not ( = ?auto_126440 ?auto_126444 ) ) ( not ( = ?auto_126441 ?auto_126444 ) ) ( not ( = ?auto_126442 ?auto_126444 ) ) ( not ( = ?auto_126445 ?auto_126444 ) ) ( not ( = ?auto_126443 ?auto_126444 ) ) ( ON ?auto_126439 ?auto_126438 ) ( CLEAR ?auto_126439 ) ( ON-TABLE ?auto_126444 ) ( HOLDING ?auto_126440 ) ( CLEAR ?auto_126441 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126443 ?auto_126445 ?auto_126442 ?auto_126441 ?auto_126440 )
      ( MAKE-5PILE ?auto_126438 ?auto_126439 ?auto_126440 ?auto_126441 ?auto_126442 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126446 - BLOCK
      ?auto_126447 - BLOCK
      ?auto_126448 - BLOCK
      ?auto_126449 - BLOCK
      ?auto_126450 - BLOCK
    )
    :vars
    (
      ?auto_126453 - BLOCK
      ?auto_126451 - BLOCK
      ?auto_126452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126446 ?auto_126447 ) ) ( not ( = ?auto_126446 ?auto_126448 ) ) ( not ( = ?auto_126446 ?auto_126449 ) ) ( not ( = ?auto_126446 ?auto_126450 ) ) ( not ( = ?auto_126447 ?auto_126448 ) ) ( not ( = ?auto_126447 ?auto_126449 ) ) ( not ( = ?auto_126447 ?auto_126450 ) ) ( not ( = ?auto_126448 ?auto_126449 ) ) ( not ( = ?auto_126448 ?auto_126450 ) ) ( not ( = ?auto_126449 ?auto_126450 ) ) ( ON ?auto_126450 ?auto_126453 ) ( not ( = ?auto_126446 ?auto_126453 ) ) ( not ( = ?auto_126447 ?auto_126453 ) ) ( not ( = ?auto_126448 ?auto_126453 ) ) ( not ( = ?auto_126449 ?auto_126453 ) ) ( not ( = ?auto_126450 ?auto_126453 ) ) ( ON ?auto_126449 ?auto_126450 ) ( ON-TABLE ?auto_126451 ) ( ON ?auto_126453 ?auto_126451 ) ( not ( = ?auto_126451 ?auto_126453 ) ) ( not ( = ?auto_126451 ?auto_126450 ) ) ( not ( = ?auto_126451 ?auto_126449 ) ) ( not ( = ?auto_126446 ?auto_126451 ) ) ( not ( = ?auto_126447 ?auto_126451 ) ) ( not ( = ?auto_126448 ?auto_126451 ) ) ( ON ?auto_126446 ?auto_126452 ) ( not ( = ?auto_126446 ?auto_126452 ) ) ( not ( = ?auto_126447 ?auto_126452 ) ) ( not ( = ?auto_126448 ?auto_126452 ) ) ( not ( = ?auto_126449 ?auto_126452 ) ) ( not ( = ?auto_126450 ?auto_126452 ) ) ( not ( = ?auto_126453 ?auto_126452 ) ) ( not ( = ?auto_126451 ?auto_126452 ) ) ( ON ?auto_126447 ?auto_126446 ) ( ON-TABLE ?auto_126452 ) ( CLEAR ?auto_126449 ) ( ON ?auto_126448 ?auto_126447 ) ( CLEAR ?auto_126448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126452 ?auto_126446 ?auto_126447 )
      ( MAKE-5PILE ?auto_126446 ?auto_126447 ?auto_126448 ?auto_126449 ?auto_126450 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126454 - BLOCK
      ?auto_126455 - BLOCK
      ?auto_126456 - BLOCK
      ?auto_126457 - BLOCK
      ?auto_126458 - BLOCK
    )
    :vars
    (
      ?auto_126460 - BLOCK
      ?auto_126459 - BLOCK
      ?auto_126461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126454 ?auto_126455 ) ) ( not ( = ?auto_126454 ?auto_126456 ) ) ( not ( = ?auto_126454 ?auto_126457 ) ) ( not ( = ?auto_126454 ?auto_126458 ) ) ( not ( = ?auto_126455 ?auto_126456 ) ) ( not ( = ?auto_126455 ?auto_126457 ) ) ( not ( = ?auto_126455 ?auto_126458 ) ) ( not ( = ?auto_126456 ?auto_126457 ) ) ( not ( = ?auto_126456 ?auto_126458 ) ) ( not ( = ?auto_126457 ?auto_126458 ) ) ( ON ?auto_126458 ?auto_126460 ) ( not ( = ?auto_126454 ?auto_126460 ) ) ( not ( = ?auto_126455 ?auto_126460 ) ) ( not ( = ?auto_126456 ?auto_126460 ) ) ( not ( = ?auto_126457 ?auto_126460 ) ) ( not ( = ?auto_126458 ?auto_126460 ) ) ( ON-TABLE ?auto_126459 ) ( ON ?auto_126460 ?auto_126459 ) ( not ( = ?auto_126459 ?auto_126460 ) ) ( not ( = ?auto_126459 ?auto_126458 ) ) ( not ( = ?auto_126459 ?auto_126457 ) ) ( not ( = ?auto_126454 ?auto_126459 ) ) ( not ( = ?auto_126455 ?auto_126459 ) ) ( not ( = ?auto_126456 ?auto_126459 ) ) ( ON ?auto_126454 ?auto_126461 ) ( not ( = ?auto_126454 ?auto_126461 ) ) ( not ( = ?auto_126455 ?auto_126461 ) ) ( not ( = ?auto_126456 ?auto_126461 ) ) ( not ( = ?auto_126457 ?auto_126461 ) ) ( not ( = ?auto_126458 ?auto_126461 ) ) ( not ( = ?auto_126460 ?auto_126461 ) ) ( not ( = ?auto_126459 ?auto_126461 ) ) ( ON ?auto_126455 ?auto_126454 ) ( ON-TABLE ?auto_126461 ) ( ON ?auto_126456 ?auto_126455 ) ( CLEAR ?auto_126456 ) ( HOLDING ?auto_126457 ) ( CLEAR ?auto_126458 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126459 ?auto_126460 ?auto_126458 ?auto_126457 )
      ( MAKE-5PILE ?auto_126454 ?auto_126455 ?auto_126456 ?auto_126457 ?auto_126458 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126462 - BLOCK
      ?auto_126463 - BLOCK
      ?auto_126464 - BLOCK
      ?auto_126465 - BLOCK
      ?auto_126466 - BLOCK
    )
    :vars
    (
      ?auto_126468 - BLOCK
      ?auto_126467 - BLOCK
      ?auto_126469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126462 ?auto_126463 ) ) ( not ( = ?auto_126462 ?auto_126464 ) ) ( not ( = ?auto_126462 ?auto_126465 ) ) ( not ( = ?auto_126462 ?auto_126466 ) ) ( not ( = ?auto_126463 ?auto_126464 ) ) ( not ( = ?auto_126463 ?auto_126465 ) ) ( not ( = ?auto_126463 ?auto_126466 ) ) ( not ( = ?auto_126464 ?auto_126465 ) ) ( not ( = ?auto_126464 ?auto_126466 ) ) ( not ( = ?auto_126465 ?auto_126466 ) ) ( ON ?auto_126466 ?auto_126468 ) ( not ( = ?auto_126462 ?auto_126468 ) ) ( not ( = ?auto_126463 ?auto_126468 ) ) ( not ( = ?auto_126464 ?auto_126468 ) ) ( not ( = ?auto_126465 ?auto_126468 ) ) ( not ( = ?auto_126466 ?auto_126468 ) ) ( ON-TABLE ?auto_126467 ) ( ON ?auto_126468 ?auto_126467 ) ( not ( = ?auto_126467 ?auto_126468 ) ) ( not ( = ?auto_126467 ?auto_126466 ) ) ( not ( = ?auto_126467 ?auto_126465 ) ) ( not ( = ?auto_126462 ?auto_126467 ) ) ( not ( = ?auto_126463 ?auto_126467 ) ) ( not ( = ?auto_126464 ?auto_126467 ) ) ( ON ?auto_126462 ?auto_126469 ) ( not ( = ?auto_126462 ?auto_126469 ) ) ( not ( = ?auto_126463 ?auto_126469 ) ) ( not ( = ?auto_126464 ?auto_126469 ) ) ( not ( = ?auto_126465 ?auto_126469 ) ) ( not ( = ?auto_126466 ?auto_126469 ) ) ( not ( = ?auto_126468 ?auto_126469 ) ) ( not ( = ?auto_126467 ?auto_126469 ) ) ( ON ?auto_126463 ?auto_126462 ) ( ON-TABLE ?auto_126469 ) ( ON ?auto_126464 ?auto_126463 ) ( CLEAR ?auto_126466 ) ( ON ?auto_126465 ?auto_126464 ) ( CLEAR ?auto_126465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126469 ?auto_126462 ?auto_126463 ?auto_126464 )
      ( MAKE-5PILE ?auto_126462 ?auto_126463 ?auto_126464 ?auto_126465 ?auto_126466 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126470 - BLOCK
      ?auto_126471 - BLOCK
      ?auto_126472 - BLOCK
      ?auto_126473 - BLOCK
      ?auto_126474 - BLOCK
    )
    :vars
    (
      ?auto_126475 - BLOCK
      ?auto_126476 - BLOCK
      ?auto_126477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126470 ?auto_126471 ) ) ( not ( = ?auto_126470 ?auto_126472 ) ) ( not ( = ?auto_126470 ?auto_126473 ) ) ( not ( = ?auto_126470 ?auto_126474 ) ) ( not ( = ?auto_126471 ?auto_126472 ) ) ( not ( = ?auto_126471 ?auto_126473 ) ) ( not ( = ?auto_126471 ?auto_126474 ) ) ( not ( = ?auto_126472 ?auto_126473 ) ) ( not ( = ?auto_126472 ?auto_126474 ) ) ( not ( = ?auto_126473 ?auto_126474 ) ) ( not ( = ?auto_126470 ?auto_126475 ) ) ( not ( = ?auto_126471 ?auto_126475 ) ) ( not ( = ?auto_126472 ?auto_126475 ) ) ( not ( = ?auto_126473 ?auto_126475 ) ) ( not ( = ?auto_126474 ?auto_126475 ) ) ( ON-TABLE ?auto_126476 ) ( ON ?auto_126475 ?auto_126476 ) ( not ( = ?auto_126476 ?auto_126475 ) ) ( not ( = ?auto_126476 ?auto_126474 ) ) ( not ( = ?auto_126476 ?auto_126473 ) ) ( not ( = ?auto_126470 ?auto_126476 ) ) ( not ( = ?auto_126471 ?auto_126476 ) ) ( not ( = ?auto_126472 ?auto_126476 ) ) ( ON ?auto_126470 ?auto_126477 ) ( not ( = ?auto_126470 ?auto_126477 ) ) ( not ( = ?auto_126471 ?auto_126477 ) ) ( not ( = ?auto_126472 ?auto_126477 ) ) ( not ( = ?auto_126473 ?auto_126477 ) ) ( not ( = ?auto_126474 ?auto_126477 ) ) ( not ( = ?auto_126475 ?auto_126477 ) ) ( not ( = ?auto_126476 ?auto_126477 ) ) ( ON ?auto_126471 ?auto_126470 ) ( ON-TABLE ?auto_126477 ) ( ON ?auto_126472 ?auto_126471 ) ( ON ?auto_126473 ?auto_126472 ) ( CLEAR ?auto_126473 ) ( HOLDING ?auto_126474 ) ( CLEAR ?auto_126475 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126476 ?auto_126475 ?auto_126474 )
      ( MAKE-5PILE ?auto_126470 ?auto_126471 ?auto_126472 ?auto_126473 ?auto_126474 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126478 - BLOCK
      ?auto_126479 - BLOCK
      ?auto_126480 - BLOCK
      ?auto_126481 - BLOCK
      ?auto_126482 - BLOCK
    )
    :vars
    (
      ?auto_126485 - BLOCK
      ?auto_126484 - BLOCK
      ?auto_126483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126478 ?auto_126479 ) ) ( not ( = ?auto_126478 ?auto_126480 ) ) ( not ( = ?auto_126478 ?auto_126481 ) ) ( not ( = ?auto_126478 ?auto_126482 ) ) ( not ( = ?auto_126479 ?auto_126480 ) ) ( not ( = ?auto_126479 ?auto_126481 ) ) ( not ( = ?auto_126479 ?auto_126482 ) ) ( not ( = ?auto_126480 ?auto_126481 ) ) ( not ( = ?auto_126480 ?auto_126482 ) ) ( not ( = ?auto_126481 ?auto_126482 ) ) ( not ( = ?auto_126478 ?auto_126485 ) ) ( not ( = ?auto_126479 ?auto_126485 ) ) ( not ( = ?auto_126480 ?auto_126485 ) ) ( not ( = ?auto_126481 ?auto_126485 ) ) ( not ( = ?auto_126482 ?auto_126485 ) ) ( ON-TABLE ?auto_126484 ) ( ON ?auto_126485 ?auto_126484 ) ( not ( = ?auto_126484 ?auto_126485 ) ) ( not ( = ?auto_126484 ?auto_126482 ) ) ( not ( = ?auto_126484 ?auto_126481 ) ) ( not ( = ?auto_126478 ?auto_126484 ) ) ( not ( = ?auto_126479 ?auto_126484 ) ) ( not ( = ?auto_126480 ?auto_126484 ) ) ( ON ?auto_126478 ?auto_126483 ) ( not ( = ?auto_126478 ?auto_126483 ) ) ( not ( = ?auto_126479 ?auto_126483 ) ) ( not ( = ?auto_126480 ?auto_126483 ) ) ( not ( = ?auto_126481 ?auto_126483 ) ) ( not ( = ?auto_126482 ?auto_126483 ) ) ( not ( = ?auto_126485 ?auto_126483 ) ) ( not ( = ?auto_126484 ?auto_126483 ) ) ( ON ?auto_126479 ?auto_126478 ) ( ON-TABLE ?auto_126483 ) ( ON ?auto_126480 ?auto_126479 ) ( ON ?auto_126481 ?auto_126480 ) ( CLEAR ?auto_126485 ) ( ON ?auto_126482 ?auto_126481 ) ( CLEAR ?auto_126482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126483 ?auto_126478 ?auto_126479 ?auto_126480 ?auto_126481 )
      ( MAKE-5PILE ?auto_126478 ?auto_126479 ?auto_126480 ?auto_126481 ?auto_126482 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126486 - BLOCK
      ?auto_126487 - BLOCK
      ?auto_126488 - BLOCK
      ?auto_126489 - BLOCK
      ?auto_126490 - BLOCK
    )
    :vars
    (
      ?auto_126491 - BLOCK
      ?auto_126493 - BLOCK
      ?auto_126492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126486 ?auto_126487 ) ) ( not ( = ?auto_126486 ?auto_126488 ) ) ( not ( = ?auto_126486 ?auto_126489 ) ) ( not ( = ?auto_126486 ?auto_126490 ) ) ( not ( = ?auto_126487 ?auto_126488 ) ) ( not ( = ?auto_126487 ?auto_126489 ) ) ( not ( = ?auto_126487 ?auto_126490 ) ) ( not ( = ?auto_126488 ?auto_126489 ) ) ( not ( = ?auto_126488 ?auto_126490 ) ) ( not ( = ?auto_126489 ?auto_126490 ) ) ( not ( = ?auto_126486 ?auto_126491 ) ) ( not ( = ?auto_126487 ?auto_126491 ) ) ( not ( = ?auto_126488 ?auto_126491 ) ) ( not ( = ?auto_126489 ?auto_126491 ) ) ( not ( = ?auto_126490 ?auto_126491 ) ) ( ON-TABLE ?auto_126493 ) ( not ( = ?auto_126493 ?auto_126491 ) ) ( not ( = ?auto_126493 ?auto_126490 ) ) ( not ( = ?auto_126493 ?auto_126489 ) ) ( not ( = ?auto_126486 ?auto_126493 ) ) ( not ( = ?auto_126487 ?auto_126493 ) ) ( not ( = ?auto_126488 ?auto_126493 ) ) ( ON ?auto_126486 ?auto_126492 ) ( not ( = ?auto_126486 ?auto_126492 ) ) ( not ( = ?auto_126487 ?auto_126492 ) ) ( not ( = ?auto_126488 ?auto_126492 ) ) ( not ( = ?auto_126489 ?auto_126492 ) ) ( not ( = ?auto_126490 ?auto_126492 ) ) ( not ( = ?auto_126491 ?auto_126492 ) ) ( not ( = ?auto_126493 ?auto_126492 ) ) ( ON ?auto_126487 ?auto_126486 ) ( ON-TABLE ?auto_126492 ) ( ON ?auto_126488 ?auto_126487 ) ( ON ?auto_126489 ?auto_126488 ) ( ON ?auto_126490 ?auto_126489 ) ( CLEAR ?auto_126490 ) ( HOLDING ?auto_126491 ) ( CLEAR ?auto_126493 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126493 ?auto_126491 )
      ( MAKE-5PILE ?auto_126486 ?auto_126487 ?auto_126488 ?auto_126489 ?auto_126490 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126494 - BLOCK
      ?auto_126495 - BLOCK
      ?auto_126496 - BLOCK
      ?auto_126497 - BLOCK
      ?auto_126498 - BLOCK
    )
    :vars
    (
      ?auto_126499 - BLOCK
      ?auto_126501 - BLOCK
      ?auto_126500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126494 ?auto_126495 ) ) ( not ( = ?auto_126494 ?auto_126496 ) ) ( not ( = ?auto_126494 ?auto_126497 ) ) ( not ( = ?auto_126494 ?auto_126498 ) ) ( not ( = ?auto_126495 ?auto_126496 ) ) ( not ( = ?auto_126495 ?auto_126497 ) ) ( not ( = ?auto_126495 ?auto_126498 ) ) ( not ( = ?auto_126496 ?auto_126497 ) ) ( not ( = ?auto_126496 ?auto_126498 ) ) ( not ( = ?auto_126497 ?auto_126498 ) ) ( not ( = ?auto_126494 ?auto_126499 ) ) ( not ( = ?auto_126495 ?auto_126499 ) ) ( not ( = ?auto_126496 ?auto_126499 ) ) ( not ( = ?auto_126497 ?auto_126499 ) ) ( not ( = ?auto_126498 ?auto_126499 ) ) ( ON-TABLE ?auto_126501 ) ( not ( = ?auto_126501 ?auto_126499 ) ) ( not ( = ?auto_126501 ?auto_126498 ) ) ( not ( = ?auto_126501 ?auto_126497 ) ) ( not ( = ?auto_126494 ?auto_126501 ) ) ( not ( = ?auto_126495 ?auto_126501 ) ) ( not ( = ?auto_126496 ?auto_126501 ) ) ( ON ?auto_126494 ?auto_126500 ) ( not ( = ?auto_126494 ?auto_126500 ) ) ( not ( = ?auto_126495 ?auto_126500 ) ) ( not ( = ?auto_126496 ?auto_126500 ) ) ( not ( = ?auto_126497 ?auto_126500 ) ) ( not ( = ?auto_126498 ?auto_126500 ) ) ( not ( = ?auto_126499 ?auto_126500 ) ) ( not ( = ?auto_126501 ?auto_126500 ) ) ( ON ?auto_126495 ?auto_126494 ) ( ON-TABLE ?auto_126500 ) ( ON ?auto_126496 ?auto_126495 ) ( ON ?auto_126497 ?auto_126496 ) ( ON ?auto_126498 ?auto_126497 ) ( CLEAR ?auto_126501 ) ( ON ?auto_126499 ?auto_126498 ) ( CLEAR ?auto_126499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126500 ?auto_126494 ?auto_126495 ?auto_126496 ?auto_126497 ?auto_126498 )
      ( MAKE-5PILE ?auto_126494 ?auto_126495 ?auto_126496 ?auto_126497 ?auto_126498 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126502 - BLOCK
      ?auto_126503 - BLOCK
      ?auto_126504 - BLOCK
      ?auto_126505 - BLOCK
      ?auto_126506 - BLOCK
    )
    :vars
    (
      ?auto_126509 - BLOCK
      ?auto_126507 - BLOCK
      ?auto_126508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126502 ?auto_126503 ) ) ( not ( = ?auto_126502 ?auto_126504 ) ) ( not ( = ?auto_126502 ?auto_126505 ) ) ( not ( = ?auto_126502 ?auto_126506 ) ) ( not ( = ?auto_126503 ?auto_126504 ) ) ( not ( = ?auto_126503 ?auto_126505 ) ) ( not ( = ?auto_126503 ?auto_126506 ) ) ( not ( = ?auto_126504 ?auto_126505 ) ) ( not ( = ?auto_126504 ?auto_126506 ) ) ( not ( = ?auto_126505 ?auto_126506 ) ) ( not ( = ?auto_126502 ?auto_126509 ) ) ( not ( = ?auto_126503 ?auto_126509 ) ) ( not ( = ?auto_126504 ?auto_126509 ) ) ( not ( = ?auto_126505 ?auto_126509 ) ) ( not ( = ?auto_126506 ?auto_126509 ) ) ( not ( = ?auto_126507 ?auto_126509 ) ) ( not ( = ?auto_126507 ?auto_126506 ) ) ( not ( = ?auto_126507 ?auto_126505 ) ) ( not ( = ?auto_126502 ?auto_126507 ) ) ( not ( = ?auto_126503 ?auto_126507 ) ) ( not ( = ?auto_126504 ?auto_126507 ) ) ( ON ?auto_126502 ?auto_126508 ) ( not ( = ?auto_126502 ?auto_126508 ) ) ( not ( = ?auto_126503 ?auto_126508 ) ) ( not ( = ?auto_126504 ?auto_126508 ) ) ( not ( = ?auto_126505 ?auto_126508 ) ) ( not ( = ?auto_126506 ?auto_126508 ) ) ( not ( = ?auto_126509 ?auto_126508 ) ) ( not ( = ?auto_126507 ?auto_126508 ) ) ( ON ?auto_126503 ?auto_126502 ) ( ON-TABLE ?auto_126508 ) ( ON ?auto_126504 ?auto_126503 ) ( ON ?auto_126505 ?auto_126504 ) ( ON ?auto_126506 ?auto_126505 ) ( ON ?auto_126509 ?auto_126506 ) ( CLEAR ?auto_126509 ) ( HOLDING ?auto_126507 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126507 )
      ( MAKE-5PILE ?auto_126502 ?auto_126503 ?auto_126504 ?auto_126505 ?auto_126506 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_126510 - BLOCK
      ?auto_126511 - BLOCK
      ?auto_126512 - BLOCK
      ?auto_126513 - BLOCK
      ?auto_126514 - BLOCK
    )
    :vars
    (
      ?auto_126516 - BLOCK
      ?auto_126515 - BLOCK
      ?auto_126517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126510 ?auto_126511 ) ) ( not ( = ?auto_126510 ?auto_126512 ) ) ( not ( = ?auto_126510 ?auto_126513 ) ) ( not ( = ?auto_126510 ?auto_126514 ) ) ( not ( = ?auto_126511 ?auto_126512 ) ) ( not ( = ?auto_126511 ?auto_126513 ) ) ( not ( = ?auto_126511 ?auto_126514 ) ) ( not ( = ?auto_126512 ?auto_126513 ) ) ( not ( = ?auto_126512 ?auto_126514 ) ) ( not ( = ?auto_126513 ?auto_126514 ) ) ( not ( = ?auto_126510 ?auto_126516 ) ) ( not ( = ?auto_126511 ?auto_126516 ) ) ( not ( = ?auto_126512 ?auto_126516 ) ) ( not ( = ?auto_126513 ?auto_126516 ) ) ( not ( = ?auto_126514 ?auto_126516 ) ) ( not ( = ?auto_126515 ?auto_126516 ) ) ( not ( = ?auto_126515 ?auto_126514 ) ) ( not ( = ?auto_126515 ?auto_126513 ) ) ( not ( = ?auto_126510 ?auto_126515 ) ) ( not ( = ?auto_126511 ?auto_126515 ) ) ( not ( = ?auto_126512 ?auto_126515 ) ) ( ON ?auto_126510 ?auto_126517 ) ( not ( = ?auto_126510 ?auto_126517 ) ) ( not ( = ?auto_126511 ?auto_126517 ) ) ( not ( = ?auto_126512 ?auto_126517 ) ) ( not ( = ?auto_126513 ?auto_126517 ) ) ( not ( = ?auto_126514 ?auto_126517 ) ) ( not ( = ?auto_126516 ?auto_126517 ) ) ( not ( = ?auto_126515 ?auto_126517 ) ) ( ON ?auto_126511 ?auto_126510 ) ( ON-TABLE ?auto_126517 ) ( ON ?auto_126512 ?auto_126511 ) ( ON ?auto_126513 ?auto_126512 ) ( ON ?auto_126514 ?auto_126513 ) ( ON ?auto_126516 ?auto_126514 ) ( ON ?auto_126515 ?auto_126516 ) ( CLEAR ?auto_126515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126517 ?auto_126510 ?auto_126511 ?auto_126512 ?auto_126513 ?auto_126514 ?auto_126516 )
      ( MAKE-5PILE ?auto_126510 ?auto_126511 ?auto_126512 ?auto_126513 ?auto_126514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126519 - BLOCK
    )
    :vars
    (
      ?auto_126520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126520 ?auto_126519 ) ( CLEAR ?auto_126520 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126519 ) ( not ( = ?auto_126519 ?auto_126520 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126520 ?auto_126519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126521 - BLOCK
    )
    :vars
    (
      ?auto_126522 - BLOCK
      ?auto_126523 - BLOCK
      ?auto_126524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126522 ?auto_126521 ) ( CLEAR ?auto_126522 ) ( ON-TABLE ?auto_126521 ) ( not ( = ?auto_126521 ?auto_126522 ) ) ( HOLDING ?auto_126523 ) ( CLEAR ?auto_126524 ) ( not ( = ?auto_126521 ?auto_126523 ) ) ( not ( = ?auto_126521 ?auto_126524 ) ) ( not ( = ?auto_126522 ?auto_126523 ) ) ( not ( = ?auto_126522 ?auto_126524 ) ) ( not ( = ?auto_126523 ?auto_126524 ) ) )
    :subtasks
    ( ( !STACK ?auto_126523 ?auto_126524 )
      ( MAKE-1PILE ?auto_126521 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126525 - BLOCK
    )
    :vars
    (
      ?auto_126526 - BLOCK
      ?auto_126527 - BLOCK
      ?auto_126528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126526 ?auto_126525 ) ( ON-TABLE ?auto_126525 ) ( not ( = ?auto_126525 ?auto_126526 ) ) ( CLEAR ?auto_126527 ) ( not ( = ?auto_126525 ?auto_126528 ) ) ( not ( = ?auto_126525 ?auto_126527 ) ) ( not ( = ?auto_126526 ?auto_126528 ) ) ( not ( = ?auto_126526 ?auto_126527 ) ) ( not ( = ?auto_126528 ?auto_126527 ) ) ( ON ?auto_126528 ?auto_126526 ) ( CLEAR ?auto_126528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126525 ?auto_126526 )
      ( MAKE-1PILE ?auto_126525 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126529 - BLOCK
    )
    :vars
    (
      ?auto_126532 - BLOCK
      ?auto_126530 - BLOCK
      ?auto_126531 - BLOCK
      ?auto_126533 - BLOCK
      ?auto_126534 - BLOCK
      ?auto_126535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126532 ?auto_126529 ) ( ON-TABLE ?auto_126529 ) ( not ( = ?auto_126529 ?auto_126532 ) ) ( not ( = ?auto_126529 ?auto_126530 ) ) ( not ( = ?auto_126529 ?auto_126531 ) ) ( not ( = ?auto_126532 ?auto_126530 ) ) ( not ( = ?auto_126532 ?auto_126531 ) ) ( not ( = ?auto_126530 ?auto_126531 ) ) ( ON ?auto_126530 ?auto_126532 ) ( CLEAR ?auto_126530 ) ( HOLDING ?auto_126531 ) ( CLEAR ?auto_126533 ) ( ON-TABLE ?auto_126534 ) ( ON ?auto_126535 ?auto_126534 ) ( ON ?auto_126533 ?auto_126535 ) ( not ( = ?auto_126534 ?auto_126535 ) ) ( not ( = ?auto_126534 ?auto_126533 ) ) ( not ( = ?auto_126534 ?auto_126531 ) ) ( not ( = ?auto_126535 ?auto_126533 ) ) ( not ( = ?auto_126535 ?auto_126531 ) ) ( not ( = ?auto_126533 ?auto_126531 ) ) ( not ( = ?auto_126529 ?auto_126533 ) ) ( not ( = ?auto_126529 ?auto_126534 ) ) ( not ( = ?auto_126529 ?auto_126535 ) ) ( not ( = ?auto_126532 ?auto_126533 ) ) ( not ( = ?auto_126532 ?auto_126534 ) ) ( not ( = ?auto_126532 ?auto_126535 ) ) ( not ( = ?auto_126530 ?auto_126533 ) ) ( not ( = ?auto_126530 ?auto_126534 ) ) ( not ( = ?auto_126530 ?auto_126535 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126534 ?auto_126535 ?auto_126533 ?auto_126531 )
      ( MAKE-1PILE ?auto_126529 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126536 - BLOCK
    )
    :vars
    (
      ?auto_126539 - BLOCK
      ?auto_126538 - BLOCK
      ?auto_126540 - BLOCK
      ?auto_126537 - BLOCK
      ?auto_126542 - BLOCK
      ?auto_126541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126539 ?auto_126536 ) ( ON-TABLE ?auto_126536 ) ( not ( = ?auto_126536 ?auto_126539 ) ) ( not ( = ?auto_126536 ?auto_126538 ) ) ( not ( = ?auto_126536 ?auto_126540 ) ) ( not ( = ?auto_126539 ?auto_126538 ) ) ( not ( = ?auto_126539 ?auto_126540 ) ) ( not ( = ?auto_126538 ?auto_126540 ) ) ( ON ?auto_126538 ?auto_126539 ) ( CLEAR ?auto_126537 ) ( ON-TABLE ?auto_126542 ) ( ON ?auto_126541 ?auto_126542 ) ( ON ?auto_126537 ?auto_126541 ) ( not ( = ?auto_126542 ?auto_126541 ) ) ( not ( = ?auto_126542 ?auto_126537 ) ) ( not ( = ?auto_126542 ?auto_126540 ) ) ( not ( = ?auto_126541 ?auto_126537 ) ) ( not ( = ?auto_126541 ?auto_126540 ) ) ( not ( = ?auto_126537 ?auto_126540 ) ) ( not ( = ?auto_126536 ?auto_126537 ) ) ( not ( = ?auto_126536 ?auto_126542 ) ) ( not ( = ?auto_126536 ?auto_126541 ) ) ( not ( = ?auto_126539 ?auto_126537 ) ) ( not ( = ?auto_126539 ?auto_126542 ) ) ( not ( = ?auto_126539 ?auto_126541 ) ) ( not ( = ?auto_126538 ?auto_126537 ) ) ( not ( = ?auto_126538 ?auto_126542 ) ) ( not ( = ?auto_126538 ?auto_126541 ) ) ( ON ?auto_126540 ?auto_126538 ) ( CLEAR ?auto_126540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126536 ?auto_126539 ?auto_126538 )
      ( MAKE-1PILE ?auto_126536 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126543 - BLOCK
    )
    :vars
    (
      ?auto_126544 - BLOCK
      ?auto_126545 - BLOCK
      ?auto_126546 - BLOCK
      ?auto_126547 - BLOCK
      ?auto_126548 - BLOCK
      ?auto_126549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126544 ?auto_126543 ) ( ON-TABLE ?auto_126543 ) ( not ( = ?auto_126543 ?auto_126544 ) ) ( not ( = ?auto_126543 ?auto_126545 ) ) ( not ( = ?auto_126543 ?auto_126546 ) ) ( not ( = ?auto_126544 ?auto_126545 ) ) ( not ( = ?auto_126544 ?auto_126546 ) ) ( not ( = ?auto_126545 ?auto_126546 ) ) ( ON ?auto_126545 ?auto_126544 ) ( ON-TABLE ?auto_126547 ) ( ON ?auto_126548 ?auto_126547 ) ( not ( = ?auto_126547 ?auto_126548 ) ) ( not ( = ?auto_126547 ?auto_126549 ) ) ( not ( = ?auto_126547 ?auto_126546 ) ) ( not ( = ?auto_126548 ?auto_126549 ) ) ( not ( = ?auto_126548 ?auto_126546 ) ) ( not ( = ?auto_126549 ?auto_126546 ) ) ( not ( = ?auto_126543 ?auto_126549 ) ) ( not ( = ?auto_126543 ?auto_126547 ) ) ( not ( = ?auto_126543 ?auto_126548 ) ) ( not ( = ?auto_126544 ?auto_126549 ) ) ( not ( = ?auto_126544 ?auto_126547 ) ) ( not ( = ?auto_126544 ?auto_126548 ) ) ( not ( = ?auto_126545 ?auto_126549 ) ) ( not ( = ?auto_126545 ?auto_126547 ) ) ( not ( = ?auto_126545 ?auto_126548 ) ) ( ON ?auto_126546 ?auto_126545 ) ( CLEAR ?auto_126546 ) ( HOLDING ?auto_126549 ) ( CLEAR ?auto_126548 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126547 ?auto_126548 ?auto_126549 )
      ( MAKE-1PILE ?auto_126543 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126550 - BLOCK
    )
    :vars
    (
      ?auto_126554 - BLOCK
      ?auto_126551 - BLOCK
      ?auto_126555 - BLOCK
      ?auto_126556 - BLOCK
      ?auto_126552 - BLOCK
      ?auto_126553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126554 ?auto_126550 ) ( ON-TABLE ?auto_126550 ) ( not ( = ?auto_126550 ?auto_126554 ) ) ( not ( = ?auto_126550 ?auto_126551 ) ) ( not ( = ?auto_126550 ?auto_126555 ) ) ( not ( = ?auto_126554 ?auto_126551 ) ) ( not ( = ?auto_126554 ?auto_126555 ) ) ( not ( = ?auto_126551 ?auto_126555 ) ) ( ON ?auto_126551 ?auto_126554 ) ( ON-TABLE ?auto_126556 ) ( ON ?auto_126552 ?auto_126556 ) ( not ( = ?auto_126556 ?auto_126552 ) ) ( not ( = ?auto_126556 ?auto_126553 ) ) ( not ( = ?auto_126556 ?auto_126555 ) ) ( not ( = ?auto_126552 ?auto_126553 ) ) ( not ( = ?auto_126552 ?auto_126555 ) ) ( not ( = ?auto_126553 ?auto_126555 ) ) ( not ( = ?auto_126550 ?auto_126553 ) ) ( not ( = ?auto_126550 ?auto_126556 ) ) ( not ( = ?auto_126550 ?auto_126552 ) ) ( not ( = ?auto_126554 ?auto_126553 ) ) ( not ( = ?auto_126554 ?auto_126556 ) ) ( not ( = ?auto_126554 ?auto_126552 ) ) ( not ( = ?auto_126551 ?auto_126553 ) ) ( not ( = ?auto_126551 ?auto_126556 ) ) ( not ( = ?auto_126551 ?auto_126552 ) ) ( ON ?auto_126555 ?auto_126551 ) ( CLEAR ?auto_126552 ) ( ON ?auto_126553 ?auto_126555 ) ( CLEAR ?auto_126553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126550 ?auto_126554 ?auto_126551 ?auto_126555 )
      ( MAKE-1PILE ?auto_126550 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126557 - BLOCK
    )
    :vars
    (
      ?auto_126558 - BLOCK
      ?auto_126562 - BLOCK
      ?auto_126560 - BLOCK
      ?auto_126561 - BLOCK
      ?auto_126563 - BLOCK
      ?auto_126559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126558 ?auto_126557 ) ( ON-TABLE ?auto_126557 ) ( not ( = ?auto_126557 ?auto_126558 ) ) ( not ( = ?auto_126557 ?auto_126562 ) ) ( not ( = ?auto_126557 ?auto_126560 ) ) ( not ( = ?auto_126558 ?auto_126562 ) ) ( not ( = ?auto_126558 ?auto_126560 ) ) ( not ( = ?auto_126562 ?auto_126560 ) ) ( ON ?auto_126562 ?auto_126558 ) ( ON-TABLE ?auto_126561 ) ( not ( = ?auto_126561 ?auto_126563 ) ) ( not ( = ?auto_126561 ?auto_126559 ) ) ( not ( = ?auto_126561 ?auto_126560 ) ) ( not ( = ?auto_126563 ?auto_126559 ) ) ( not ( = ?auto_126563 ?auto_126560 ) ) ( not ( = ?auto_126559 ?auto_126560 ) ) ( not ( = ?auto_126557 ?auto_126559 ) ) ( not ( = ?auto_126557 ?auto_126561 ) ) ( not ( = ?auto_126557 ?auto_126563 ) ) ( not ( = ?auto_126558 ?auto_126559 ) ) ( not ( = ?auto_126558 ?auto_126561 ) ) ( not ( = ?auto_126558 ?auto_126563 ) ) ( not ( = ?auto_126562 ?auto_126559 ) ) ( not ( = ?auto_126562 ?auto_126561 ) ) ( not ( = ?auto_126562 ?auto_126563 ) ) ( ON ?auto_126560 ?auto_126562 ) ( ON ?auto_126559 ?auto_126560 ) ( CLEAR ?auto_126559 ) ( HOLDING ?auto_126563 ) ( CLEAR ?auto_126561 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126561 ?auto_126563 )
      ( MAKE-1PILE ?auto_126557 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126564 - BLOCK
    )
    :vars
    (
      ?auto_126565 - BLOCK
      ?auto_126566 - BLOCK
      ?auto_126567 - BLOCK
      ?auto_126568 - BLOCK
      ?auto_126569 - BLOCK
      ?auto_126570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126565 ?auto_126564 ) ( ON-TABLE ?auto_126564 ) ( not ( = ?auto_126564 ?auto_126565 ) ) ( not ( = ?auto_126564 ?auto_126566 ) ) ( not ( = ?auto_126564 ?auto_126567 ) ) ( not ( = ?auto_126565 ?auto_126566 ) ) ( not ( = ?auto_126565 ?auto_126567 ) ) ( not ( = ?auto_126566 ?auto_126567 ) ) ( ON ?auto_126566 ?auto_126565 ) ( ON-TABLE ?auto_126568 ) ( not ( = ?auto_126568 ?auto_126569 ) ) ( not ( = ?auto_126568 ?auto_126570 ) ) ( not ( = ?auto_126568 ?auto_126567 ) ) ( not ( = ?auto_126569 ?auto_126570 ) ) ( not ( = ?auto_126569 ?auto_126567 ) ) ( not ( = ?auto_126570 ?auto_126567 ) ) ( not ( = ?auto_126564 ?auto_126570 ) ) ( not ( = ?auto_126564 ?auto_126568 ) ) ( not ( = ?auto_126564 ?auto_126569 ) ) ( not ( = ?auto_126565 ?auto_126570 ) ) ( not ( = ?auto_126565 ?auto_126568 ) ) ( not ( = ?auto_126565 ?auto_126569 ) ) ( not ( = ?auto_126566 ?auto_126570 ) ) ( not ( = ?auto_126566 ?auto_126568 ) ) ( not ( = ?auto_126566 ?auto_126569 ) ) ( ON ?auto_126567 ?auto_126566 ) ( ON ?auto_126570 ?auto_126567 ) ( CLEAR ?auto_126568 ) ( ON ?auto_126569 ?auto_126570 ) ( CLEAR ?auto_126569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126564 ?auto_126565 ?auto_126566 ?auto_126567 ?auto_126570 )
      ( MAKE-1PILE ?auto_126564 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126571 - BLOCK
    )
    :vars
    (
      ?auto_126573 - BLOCK
      ?auto_126577 - BLOCK
      ?auto_126574 - BLOCK
      ?auto_126575 - BLOCK
      ?auto_126572 - BLOCK
      ?auto_126576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126573 ?auto_126571 ) ( ON-TABLE ?auto_126571 ) ( not ( = ?auto_126571 ?auto_126573 ) ) ( not ( = ?auto_126571 ?auto_126577 ) ) ( not ( = ?auto_126571 ?auto_126574 ) ) ( not ( = ?auto_126573 ?auto_126577 ) ) ( not ( = ?auto_126573 ?auto_126574 ) ) ( not ( = ?auto_126577 ?auto_126574 ) ) ( ON ?auto_126577 ?auto_126573 ) ( not ( = ?auto_126575 ?auto_126572 ) ) ( not ( = ?auto_126575 ?auto_126576 ) ) ( not ( = ?auto_126575 ?auto_126574 ) ) ( not ( = ?auto_126572 ?auto_126576 ) ) ( not ( = ?auto_126572 ?auto_126574 ) ) ( not ( = ?auto_126576 ?auto_126574 ) ) ( not ( = ?auto_126571 ?auto_126576 ) ) ( not ( = ?auto_126571 ?auto_126575 ) ) ( not ( = ?auto_126571 ?auto_126572 ) ) ( not ( = ?auto_126573 ?auto_126576 ) ) ( not ( = ?auto_126573 ?auto_126575 ) ) ( not ( = ?auto_126573 ?auto_126572 ) ) ( not ( = ?auto_126577 ?auto_126576 ) ) ( not ( = ?auto_126577 ?auto_126575 ) ) ( not ( = ?auto_126577 ?auto_126572 ) ) ( ON ?auto_126574 ?auto_126577 ) ( ON ?auto_126576 ?auto_126574 ) ( ON ?auto_126572 ?auto_126576 ) ( CLEAR ?auto_126572 ) ( HOLDING ?auto_126575 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126575 )
      ( MAKE-1PILE ?auto_126571 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126578 - BLOCK
    )
    :vars
    (
      ?auto_126583 - BLOCK
      ?auto_126581 - BLOCK
      ?auto_126579 - BLOCK
      ?auto_126580 - BLOCK
      ?auto_126584 - BLOCK
      ?auto_126582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126583 ?auto_126578 ) ( ON-TABLE ?auto_126578 ) ( not ( = ?auto_126578 ?auto_126583 ) ) ( not ( = ?auto_126578 ?auto_126581 ) ) ( not ( = ?auto_126578 ?auto_126579 ) ) ( not ( = ?auto_126583 ?auto_126581 ) ) ( not ( = ?auto_126583 ?auto_126579 ) ) ( not ( = ?auto_126581 ?auto_126579 ) ) ( ON ?auto_126581 ?auto_126583 ) ( not ( = ?auto_126580 ?auto_126584 ) ) ( not ( = ?auto_126580 ?auto_126582 ) ) ( not ( = ?auto_126580 ?auto_126579 ) ) ( not ( = ?auto_126584 ?auto_126582 ) ) ( not ( = ?auto_126584 ?auto_126579 ) ) ( not ( = ?auto_126582 ?auto_126579 ) ) ( not ( = ?auto_126578 ?auto_126582 ) ) ( not ( = ?auto_126578 ?auto_126580 ) ) ( not ( = ?auto_126578 ?auto_126584 ) ) ( not ( = ?auto_126583 ?auto_126582 ) ) ( not ( = ?auto_126583 ?auto_126580 ) ) ( not ( = ?auto_126583 ?auto_126584 ) ) ( not ( = ?auto_126581 ?auto_126582 ) ) ( not ( = ?auto_126581 ?auto_126580 ) ) ( not ( = ?auto_126581 ?auto_126584 ) ) ( ON ?auto_126579 ?auto_126581 ) ( ON ?auto_126582 ?auto_126579 ) ( ON ?auto_126584 ?auto_126582 ) ( ON ?auto_126580 ?auto_126584 ) ( CLEAR ?auto_126580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126578 ?auto_126583 ?auto_126581 ?auto_126579 ?auto_126582 ?auto_126584 )
      ( MAKE-1PILE ?auto_126578 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126585 - BLOCK
    )
    :vars
    (
      ?auto_126588 - BLOCK
      ?auto_126589 - BLOCK
      ?auto_126586 - BLOCK
      ?auto_126587 - BLOCK
      ?auto_126590 - BLOCK
      ?auto_126591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126588 ?auto_126585 ) ( ON-TABLE ?auto_126585 ) ( not ( = ?auto_126585 ?auto_126588 ) ) ( not ( = ?auto_126585 ?auto_126589 ) ) ( not ( = ?auto_126585 ?auto_126586 ) ) ( not ( = ?auto_126588 ?auto_126589 ) ) ( not ( = ?auto_126588 ?auto_126586 ) ) ( not ( = ?auto_126589 ?auto_126586 ) ) ( ON ?auto_126589 ?auto_126588 ) ( not ( = ?auto_126587 ?auto_126590 ) ) ( not ( = ?auto_126587 ?auto_126591 ) ) ( not ( = ?auto_126587 ?auto_126586 ) ) ( not ( = ?auto_126590 ?auto_126591 ) ) ( not ( = ?auto_126590 ?auto_126586 ) ) ( not ( = ?auto_126591 ?auto_126586 ) ) ( not ( = ?auto_126585 ?auto_126591 ) ) ( not ( = ?auto_126585 ?auto_126587 ) ) ( not ( = ?auto_126585 ?auto_126590 ) ) ( not ( = ?auto_126588 ?auto_126591 ) ) ( not ( = ?auto_126588 ?auto_126587 ) ) ( not ( = ?auto_126588 ?auto_126590 ) ) ( not ( = ?auto_126589 ?auto_126591 ) ) ( not ( = ?auto_126589 ?auto_126587 ) ) ( not ( = ?auto_126589 ?auto_126590 ) ) ( ON ?auto_126586 ?auto_126589 ) ( ON ?auto_126591 ?auto_126586 ) ( ON ?auto_126590 ?auto_126591 ) ( HOLDING ?auto_126587 ) ( CLEAR ?auto_126590 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126585 ?auto_126588 ?auto_126589 ?auto_126586 ?auto_126591 ?auto_126590 ?auto_126587 )
      ( MAKE-1PILE ?auto_126585 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126592 - BLOCK
    )
    :vars
    (
      ?auto_126595 - BLOCK
      ?auto_126597 - BLOCK
      ?auto_126593 - BLOCK
      ?auto_126596 - BLOCK
      ?auto_126598 - BLOCK
      ?auto_126594 - BLOCK
      ?auto_126599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126595 ?auto_126592 ) ( ON-TABLE ?auto_126592 ) ( not ( = ?auto_126592 ?auto_126595 ) ) ( not ( = ?auto_126592 ?auto_126597 ) ) ( not ( = ?auto_126592 ?auto_126593 ) ) ( not ( = ?auto_126595 ?auto_126597 ) ) ( not ( = ?auto_126595 ?auto_126593 ) ) ( not ( = ?auto_126597 ?auto_126593 ) ) ( ON ?auto_126597 ?auto_126595 ) ( not ( = ?auto_126596 ?auto_126598 ) ) ( not ( = ?auto_126596 ?auto_126594 ) ) ( not ( = ?auto_126596 ?auto_126593 ) ) ( not ( = ?auto_126598 ?auto_126594 ) ) ( not ( = ?auto_126598 ?auto_126593 ) ) ( not ( = ?auto_126594 ?auto_126593 ) ) ( not ( = ?auto_126592 ?auto_126594 ) ) ( not ( = ?auto_126592 ?auto_126596 ) ) ( not ( = ?auto_126592 ?auto_126598 ) ) ( not ( = ?auto_126595 ?auto_126594 ) ) ( not ( = ?auto_126595 ?auto_126596 ) ) ( not ( = ?auto_126595 ?auto_126598 ) ) ( not ( = ?auto_126597 ?auto_126594 ) ) ( not ( = ?auto_126597 ?auto_126596 ) ) ( not ( = ?auto_126597 ?auto_126598 ) ) ( ON ?auto_126593 ?auto_126597 ) ( ON ?auto_126594 ?auto_126593 ) ( ON ?auto_126598 ?auto_126594 ) ( CLEAR ?auto_126598 ) ( ON ?auto_126596 ?auto_126599 ) ( CLEAR ?auto_126596 ) ( HAND-EMPTY ) ( not ( = ?auto_126592 ?auto_126599 ) ) ( not ( = ?auto_126595 ?auto_126599 ) ) ( not ( = ?auto_126597 ?auto_126599 ) ) ( not ( = ?auto_126593 ?auto_126599 ) ) ( not ( = ?auto_126596 ?auto_126599 ) ) ( not ( = ?auto_126598 ?auto_126599 ) ) ( not ( = ?auto_126594 ?auto_126599 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126596 ?auto_126599 )
      ( MAKE-1PILE ?auto_126592 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126600 - BLOCK
    )
    :vars
    (
      ?auto_126601 - BLOCK
      ?auto_126602 - BLOCK
      ?auto_126605 - BLOCK
      ?auto_126603 - BLOCK
      ?auto_126604 - BLOCK
      ?auto_126606 - BLOCK
      ?auto_126607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126601 ?auto_126600 ) ( ON-TABLE ?auto_126600 ) ( not ( = ?auto_126600 ?auto_126601 ) ) ( not ( = ?auto_126600 ?auto_126602 ) ) ( not ( = ?auto_126600 ?auto_126605 ) ) ( not ( = ?auto_126601 ?auto_126602 ) ) ( not ( = ?auto_126601 ?auto_126605 ) ) ( not ( = ?auto_126602 ?auto_126605 ) ) ( ON ?auto_126602 ?auto_126601 ) ( not ( = ?auto_126603 ?auto_126604 ) ) ( not ( = ?auto_126603 ?auto_126606 ) ) ( not ( = ?auto_126603 ?auto_126605 ) ) ( not ( = ?auto_126604 ?auto_126606 ) ) ( not ( = ?auto_126604 ?auto_126605 ) ) ( not ( = ?auto_126606 ?auto_126605 ) ) ( not ( = ?auto_126600 ?auto_126606 ) ) ( not ( = ?auto_126600 ?auto_126603 ) ) ( not ( = ?auto_126600 ?auto_126604 ) ) ( not ( = ?auto_126601 ?auto_126606 ) ) ( not ( = ?auto_126601 ?auto_126603 ) ) ( not ( = ?auto_126601 ?auto_126604 ) ) ( not ( = ?auto_126602 ?auto_126606 ) ) ( not ( = ?auto_126602 ?auto_126603 ) ) ( not ( = ?auto_126602 ?auto_126604 ) ) ( ON ?auto_126605 ?auto_126602 ) ( ON ?auto_126606 ?auto_126605 ) ( ON ?auto_126603 ?auto_126607 ) ( CLEAR ?auto_126603 ) ( not ( = ?auto_126600 ?auto_126607 ) ) ( not ( = ?auto_126601 ?auto_126607 ) ) ( not ( = ?auto_126602 ?auto_126607 ) ) ( not ( = ?auto_126605 ?auto_126607 ) ) ( not ( = ?auto_126603 ?auto_126607 ) ) ( not ( = ?auto_126604 ?auto_126607 ) ) ( not ( = ?auto_126606 ?auto_126607 ) ) ( HOLDING ?auto_126604 ) ( CLEAR ?auto_126606 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126600 ?auto_126601 ?auto_126602 ?auto_126605 ?auto_126606 ?auto_126604 )
      ( MAKE-1PILE ?auto_126600 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126608 - BLOCK
    )
    :vars
    (
      ?auto_126612 - BLOCK
      ?auto_126611 - BLOCK
      ?auto_126615 - BLOCK
      ?auto_126613 - BLOCK
      ?auto_126614 - BLOCK
      ?auto_126610 - BLOCK
      ?auto_126609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126612 ?auto_126608 ) ( ON-TABLE ?auto_126608 ) ( not ( = ?auto_126608 ?auto_126612 ) ) ( not ( = ?auto_126608 ?auto_126611 ) ) ( not ( = ?auto_126608 ?auto_126615 ) ) ( not ( = ?auto_126612 ?auto_126611 ) ) ( not ( = ?auto_126612 ?auto_126615 ) ) ( not ( = ?auto_126611 ?auto_126615 ) ) ( ON ?auto_126611 ?auto_126612 ) ( not ( = ?auto_126613 ?auto_126614 ) ) ( not ( = ?auto_126613 ?auto_126610 ) ) ( not ( = ?auto_126613 ?auto_126615 ) ) ( not ( = ?auto_126614 ?auto_126610 ) ) ( not ( = ?auto_126614 ?auto_126615 ) ) ( not ( = ?auto_126610 ?auto_126615 ) ) ( not ( = ?auto_126608 ?auto_126610 ) ) ( not ( = ?auto_126608 ?auto_126613 ) ) ( not ( = ?auto_126608 ?auto_126614 ) ) ( not ( = ?auto_126612 ?auto_126610 ) ) ( not ( = ?auto_126612 ?auto_126613 ) ) ( not ( = ?auto_126612 ?auto_126614 ) ) ( not ( = ?auto_126611 ?auto_126610 ) ) ( not ( = ?auto_126611 ?auto_126613 ) ) ( not ( = ?auto_126611 ?auto_126614 ) ) ( ON ?auto_126615 ?auto_126611 ) ( ON ?auto_126610 ?auto_126615 ) ( ON ?auto_126613 ?auto_126609 ) ( not ( = ?auto_126608 ?auto_126609 ) ) ( not ( = ?auto_126612 ?auto_126609 ) ) ( not ( = ?auto_126611 ?auto_126609 ) ) ( not ( = ?auto_126615 ?auto_126609 ) ) ( not ( = ?auto_126613 ?auto_126609 ) ) ( not ( = ?auto_126614 ?auto_126609 ) ) ( not ( = ?auto_126610 ?auto_126609 ) ) ( CLEAR ?auto_126610 ) ( ON ?auto_126614 ?auto_126613 ) ( CLEAR ?auto_126614 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126609 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126609 ?auto_126613 )
      ( MAKE-1PILE ?auto_126608 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126616 - BLOCK
    )
    :vars
    (
      ?auto_126618 - BLOCK
      ?auto_126617 - BLOCK
      ?auto_126621 - BLOCK
      ?auto_126623 - BLOCK
      ?auto_126622 - BLOCK
      ?auto_126619 - BLOCK
      ?auto_126620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126618 ?auto_126616 ) ( ON-TABLE ?auto_126616 ) ( not ( = ?auto_126616 ?auto_126618 ) ) ( not ( = ?auto_126616 ?auto_126617 ) ) ( not ( = ?auto_126616 ?auto_126621 ) ) ( not ( = ?auto_126618 ?auto_126617 ) ) ( not ( = ?auto_126618 ?auto_126621 ) ) ( not ( = ?auto_126617 ?auto_126621 ) ) ( ON ?auto_126617 ?auto_126618 ) ( not ( = ?auto_126623 ?auto_126622 ) ) ( not ( = ?auto_126623 ?auto_126619 ) ) ( not ( = ?auto_126623 ?auto_126621 ) ) ( not ( = ?auto_126622 ?auto_126619 ) ) ( not ( = ?auto_126622 ?auto_126621 ) ) ( not ( = ?auto_126619 ?auto_126621 ) ) ( not ( = ?auto_126616 ?auto_126619 ) ) ( not ( = ?auto_126616 ?auto_126623 ) ) ( not ( = ?auto_126616 ?auto_126622 ) ) ( not ( = ?auto_126618 ?auto_126619 ) ) ( not ( = ?auto_126618 ?auto_126623 ) ) ( not ( = ?auto_126618 ?auto_126622 ) ) ( not ( = ?auto_126617 ?auto_126619 ) ) ( not ( = ?auto_126617 ?auto_126623 ) ) ( not ( = ?auto_126617 ?auto_126622 ) ) ( ON ?auto_126621 ?auto_126617 ) ( ON ?auto_126623 ?auto_126620 ) ( not ( = ?auto_126616 ?auto_126620 ) ) ( not ( = ?auto_126618 ?auto_126620 ) ) ( not ( = ?auto_126617 ?auto_126620 ) ) ( not ( = ?auto_126621 ?auto_126620 ) ) ( not ( = ?auto_126623 ?auto_126620 ) ) ( not ( = ?auto_126622 ?auto_126620 ) ) ( not ( = ?auto_126619 ?auto_126620 ) ) ( ON ?auto_126622 ?auto_126623 ) ( CLEAR ?auto_126622 ) ( ON-TABLE ?auto_126620 ) ( HOLDING ?auto_126619 ) ( CLEAR ?auto_126621 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126616 ?auto_126618 ?auto_126617 ?auto_126621 ?auto_126619 )
      ( MAKE-1PILE ?auto_126616 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126624 - BLOCK
    )
    :vars
    (
      ?auto_126628 - BLOCK
      ?auto_126626 - BLOCK
      ?auto_126625 - BLOCK
      ?auto_126630 - BLOCK
      ?auto_126631 - BLOCK
      ?auto_126629 - BLOCK
      ?auto_126627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126628 ?auto_126624 ) ( ON-TABLE ?auto_126624 ) ( not ( = ?auto_126624 ?auto_126628 ) ) ( not ( = ?auto_126624 ?auto_126626 ) ) ( not ( = ?auto_126624 ?auto_126625 ) ) ( not ( = ?auto_126628 ?auto_126626 ) ) ( not ( = ?auto_126628 ?auto_126625 ) ) ( not ( = ?auto_126626 ?auto_126625 ) ) ( ON ?auto_126626 ?auto_126628 ) ( not ( = ?auto_126630 ?auto_126631 ) ) ( not ( = ?auto_126630 ?auto_126629 ) ) ( not ( = ?auto_126630 ?auto_126625 ) ) ( not ( = ?auto_126631 ?auto_126629 ) ) ( not ( = ?auto_126631 ?auto_126625 ) ) ( not ( = ?auto_126629 ?auto_126625 ) ) ( not ( = ?auto_126624 ?auto_126629 ) ) ( not ( = ?auto_126624 ?auto_126630 ) ) ( not ( = ?auto_126624 ?auto_126631 ) ) ( not ( = ?auto_126628 ?auto_126629 ) ) ( not ( = ?auto_126628 ?auto_126630 ) ) ( not ( = ?auto_126628 ?auto_126631 ) ) ( not ( = ?auto_126626 ?auto_126629 ) ) ( not ( = ?auto_126626 ?auto_126630 ) ) ( not ( = ?auto_126626 ?auto_126631 ) ) ( ON ?auto_126625 ?auto_126626 ) ( ON ?auto_126630 ?auto_126627 ) ( not ( = ?auto_126624 ?auto_126627 ) ) ( not ( = ?auto_126628 ?auto_126627 ) ) ( not ( = ?auto_126626 ?auto_126627 ) ) ( not ( = ?auto_126625 ?auto_126627 ) ) ( not ( = ?auto_126630 ?auto_126627 ) ) ( not ( = ?auto_126631 ?auto_126627 ) ) ( not ( = ?auto_126629 ?auto_126627 ) ) ( ON ?auto_126631 ?auto_126630 ) ( ON-TABLE ?auto_126627 ) ( CLEAR ?auto_126625 ) ( ON ?auto_126629 ?auto_126631 ) ( CLEAR ?auto_126629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126627 ?auto_126630 ?auto_126631 )
      ( MAKE-1PILE ?auto_126624 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126632 - BLOCK
    )
    :vars
    (
      ?auto_126635 - BLOCK
      ?auto_126637 - BLOCK
      ?auto_126638 - BLOCK
      ?auto_126639 - BLOCK
      ?auto_126634 - BLOCK
      ?auto_126633 - BLOCK
      ?auto_126636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126635 ?auto_126632 ) ( ON-TABLE ?auto_126632 ) ( not ( = ?auto_126632 ?auto_126635 ) ) ( not ( = ?auto_126632 ?auto_126637 ) ) ( not ( = ?auto_126632 ?auto_126638 ) ) ( not ( = ?auto_126635 ?auto_126637 ) ) ( not ( = ?auto_126635 ?auto_126638 ) ) ( not ( = ?auto_126637 ?auto_126638 ) ) ( ON ?auto_126637 ?auto_126635 ) ( not ( = ?auto_126639 ?auto_126634 ) ) ( not ( = ?auto_126639 ?auto_126633 ) ) ( not ( = ?auto_126639 ?auto_126638 ) ) ( not ( = ?auto_126634 ?auto_126633 ) ) ( not ( = ?auto_126634 ?auto_126638 ) ) ( not ( = ?auto_126633 ?auto_126638 ) ) ( not ( = ?auto_126632 ?auto_126633 ) ) ( not ( = ?auto_126632 ?auto_126639 ) ) ( not ( = ?auto_126632 ?auto_126634 ) ) ( not ( = ?auto_126635 ?auto_126633 ) ) ( not ( = ?auto_126635 ?auto_126639 ) ) ( not ( = ?auto_126635 ?auto_126634 ) ) ( not ( = ?auto_126637 ?auto_126633 ) ) ( not ( = ?auto_126637 ?auto_126639 ) ) ( not ( = ?auto_126637 ?auto_126634 ) ) ( ON ?auto_126639 ?auto_126636 ) ( not ( = ?auto_126632 ?auto_126636 ) ) ( not ( = ?auto_126635 ?auto_126636 ) ) ( not ( = ?auto_126637 ?auto_126636 ) ) ( not ( = ?auto_126638 ?auto_126636 ) ) ( not ( = ?auto_126639 ?auto_126636 ) ) ( not ( = ?auto_126634 ?auto_126636 ) ) ( not ( = ?auto_126633 ?auto_126636 ) ) ( ON ?auto_126634 ?auto_126639 ) ( ON-TABLE ?auto_126636 ) ( ON ?auto_126633 ?auto_126634 ) ( CLEAR ?auto_126633 ) ( HOLDING ?auto_126638 ) ( CLEAR ?auto_126637 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126632 ?auto_126635 ?auto_126637 ?auto_126638 )
      ( MAKE-1PILE ?auto_126632 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126640 - BLOCK
    )
    :vars
    (
      ?auto_126643 - BLOCK
      ?auto_126647 - BLOCK
      ?auto_126642 - BLOCK
      ?auto_126646 - BLOCK
      ?auto_126645 - BLOCK
      ?auto_126641 - BLOCK
      ?auto_126644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126643 ?auto_126640 ) ( ON-TABLE ?auto_126640 ) ( not ( = ?auto_126640 ?auto_126643 ) ) ( not ( = ?auto_126640 ?auto_126647 ) ) ( not ( = ?auto_126640 ?auto_126642 ) ) ( not ( = ?auto_126643 ?auto_126647 ) ) ( not ( = ?auto_126643 ?auto_126642 ) ) ( not ( = ?auto_126647 ?auto_126642 ) ) ( ON ?auto_126647 ?auto_126643 ) ( not ( = ?auto_126646 ?auto_126645 ) ) ( not ( = ?auto_126646 ?auto_126641 ) ) ( not ( = ?auto_126646 ?auto_126642 ) ) ( not ( = ?auto_126645 ?auto_126641 ) ) ( not ( = ?auto_126645 ?auto_126642 ) ) ( not ( = ?auto_126641 ?auto_126642 ) ) ( not ( = ?auto_126640 ?auto_126641 ) ) ( not ( = ?auto_126640 ?auto_126646 ) ) ( not ( = ?auto_126640 ?auto_126645 ) ) ( not ( = ?auto_126643 ?auto_126641 ) ) ( not ( = ?auto_126643 ?auto_126646 ) ) ( not ( = ?auto_126643 ?auto_126645 ) ) ( not ( = ?auto_126647 ?auto_126641 ) ) ( not ( = ?auto_126647 ?auto_126646 ) ) ( not ( = ?auto_126647 ?auto_126645 ) ) ( ON ?auto_126646 ?auto_126644 ) ( not ( = ?auto_126640 ?auto_126644 ) ) ( not ( = ?auto_126643 ?auto_126644 ) ) ( not ( = ?auto_126647 ?auto_126644 ) ) ( not ( = ?auto_126642 ?auto_126644 ) ) ( not ( = ?auto_126646 ?auto_126644 ) ) ( not ( = ?auto_126645 ?auto_126644 ) ) ( not ( = ?auto_126641 ?auto_126644 ) ) ( ON ?auto_126645 ?auto_126646 ) ( ON-TABLE ?auto_126644 ) ( ON ?auto_126641 ?auto_126645 ) ( CLEAR ?auto_126647 ) ( ON ?auto_126642 ?auto_126641 ) ( CLEAR ?auto_126642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126644 ?auto_126646 ?auto_126645 ?auto_126641 )
      ( MAKE-1PILE ?auto_126640 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126648 - BLOCK
    )
    :vars
    (
      ?auto_126651 - BLOCK
      ?auto_126649 - BLOCK
      ?auto_126652 - BLOCK
      ?auto_126655 - BLOCK
      ?auto_126653 - BLOCK
      ?auto_126650 - BLOCK
      ?auto_126654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126651 ?auto_126648 ) ( ON-TABLE ?auto_126648 ) ( not ( = ?auto_126648 ?auto_126651 ) ) ( not ( = ?auto_126648 ?auto_126649 ) ) ( not ( = ?auto_126648 ?auto_126652 ) ) ( not ( = ?auto_126651 ?auto_126649 ) ) ( not ( = ?auto_126651 ?auto_126652 ) ) ( not ( = ?auto_126649 ?auto_126652 ) ) ( not ( = ?auto_126655 ?auto_126653 ) ) ( not ( = ?auto_126655 ?auto_126650 ) ) ( not ( = ?auto_126655 ?auto_126652 ) ) ( not ( = ?auto_126653 ?auto_126650 ) ) ( not ( = ?auto_126653 ?auto_126652 ) ) ( not ( = ?auto_126650 ?auto_126652 ) ) ( not ( = ?auto_126648 ?auto_126650 ) ) ( not ( = ?auto_126648 ?auto_126655 ) ) ( not ( = ?auto_126648 ?auto_126653 ) ) ( not ( = ?auto_126651 ?auto_126650 ) ) ( not ( = ?auto_126651 ?auto_126655 ) ) ( not ( = ?auto_126651 ?auto_126653 ) ) ( not ( = ?auto_126649 ?auto_126650 ) ) ( not ( = ?auto_126649 ?auto_126655 ) ) ( not ( = ?auto_126649 ?auto_126653 ) ) ( ON ?auto_126655 ?auto_126654 ) ( not ( = ?auto_126648 ?auto_126654 ) ) ( not ( = ?auto_126651 ?auto_126654 ) ) ( not ( = ?auto_126649 ?auto_126654 ) ) ( not ( = ?auto_126652 ?auto_126654 ) ) ( not ( = ?auto_126655 ?auto_126654 ) ) ( not ( = ?auto_126653 ?auto_126654 ) ) ( not ( = ?auto_126650 ?auto_126654 ) ) ( ON ?auto_126653 ?auto_126655 ) ( ON-TABLE ?auto_126654 ) ( ON ?auto_126650 ?auto_126653 ) ( ON ?auto_126652 ?auto_126650 ) ( CLEAR ?auto_126652 ) ( HOLDING ?auto_126649 ) ( CLEAR ?auto_126651 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126648 ?auto_126651 ?auto_126649 )
      ( MAKE-1PILE ?auto_126648 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126656 - BLOCK
    )
    :vars
    (
      ?auto_126661 - BLOCK
      ?auto_126657 - BLOCK
      ?auto_126662 - BLOCK
      ?auto_126660 - BLOCK
      ?auto_126663 - BLOCK
      ?auto_126659 - BLOCK
      ?auto_126658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_126661 ?auto_126656 ) ( ON-TABLE ?auto_126656 ) ( not ( = ?auto_126656 ?auto_126661 ) ) ( not ( = ?auto_126656 ?auto_126657 ) ) ( not ( = ?auto_126656 ?auto_126662 ) ) ( not ( = ?auto_126661 ?auto_126657 ) ) ( not ( = ?auto_126661 ?auto_126662 ) ) ( not ( = ?auto_126657 ?auto_126662 ) ) ( not ( = ?auto_126660 ?auto_126663 ) ) ( not ( = ?auto_126660 ?auto_126659 ) ) ( not ( = ?auto_126660 ?auto_126662 ) ) ( not ( = ?auto_126663 ?auto_126659 ) ) ( not ( = ?auto_126663 ?auto_126662 ) ) ( not ( = ?auto_126659 ?auto_126662 ) ) ( not ( = ?auto_126656 ?auto_126659 ) ) ( not ( = ?auto_126656 ?auto_126660 ) ) ( not ( = ?auto_126656 ?auto_126663 ) ) ( not ( = ?auto_126661 ?auto_126659 ) ) ( not ( = ?auto_126661 ?auto_126660 ) ) ( not ( = ?auto_126661 ?auto_126663 ) ) ( not ( = ?auto_126657 ?auto_126659 ) ) ( not ( = ?auto_126657 ?auto_126660 ) ) ( not ( = ?auto_126657 ?auto_126663 ) ) ( ON ?auto_126660 ?auto_126658 ) ( not ( = ?auto_126656 ?auto_126658 ) ) ( not ( = ?auto_126661 ?auto_126658 ) ) ( not ( = ?auto_126657 ?auto_126658 ) ) ( not ( = ?auto_126662 ?auto_126658 ) ) ( not ( = ?auto_126660 ?auto_126658 ) ) ( not ( = ?auto_126663 ?auto_126658 ) ) ( not ( = ?auto_126659 ?auto_126658 ) ) ( ON ?auto_126663 ?auto_126660 ) ( ON-TABLE ?auto_126658 ) ( ON ?auto_126659 ?auto_126663 ) ( ON ?auto_126662 ?auto_126659 ) ( CLEAR ?auto_126661 ) ( ON ?auto_126657 ?auto_126662 ) ( CLEAR ?auto_126657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126658 ?auto_126660 ?auto_126663 ?auto_126659 ?auto_126662 )
      ( MAKE-1PILE ?auto_126656 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126680 - BLOCK
    )
    :vars
    (
      ?auto_126682 - BLOCK
      ?auto_126686 - BLOCK
      ?auto_126684 - BLOCK
      ?auto_126687 - BLOCK
      ?auto_126681 - BLOCK
      ?auto_126683 - BLOCK
      ?auto_126685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126680 ?auto_126682 ) ) ( not ( = ?auto_126680 ?auto_126686 ) ) ( not ( = ?auto_126680 ?auto_126684 ) ) ( not ( = ?auto_126682 ?auto_126686 ) ) ( not ( = ?auto_126682 ?auto_126684 ) ) ( not ( = ?auto_126686 ?auto_126684 ) ) ( not ( = ?auto_126687 ?auto_126681 ) ) ( not ( = ?auto_126687 ?auto_126683 ) ) ( not ( = ?auto_126687 ?auto_126684 ) ) ( not ( = ?auto_126681 ?auto_126683 ) ) ( not ( = ?auto_126681 ?auto_126684 ) ) ( not ( = ?auto_126683 ?auto_126684 ) ) ( not ( = ?auto_126680 ?auto_126683 ) ) ( not ( = ?auto_126680 ?auto_126687 ) ) ( not ( = ?auto_126680 ?auto_126681 ) ) ( not ( = ?auto_126682 ?auto_126683 ) ) ( not ( = ?auto_126682 ?auto_126687 ) ) ( not ( = ?auto_126682 ?auto_126681 ) ) ( not ( = ?auto_126686 ?auto_126683 ) ) ( not ( = ?auto_126686 ?auto_126687 ) ) ( not ( = ?auto_126686 ?auto_126681 ) ) ( ON ?auto_126687 ?auto_126685 ) ( not ( = ?auto_126680 ?auto_126685 ) ) ( not ( = ?auto_126682 ?auto_126685 ) ) ( not ( = ?auto_126686 ?auto_126685 ) ) ( not ( = ?auto_126684 ?auto_126685 ) ) ( not ( = ?auto_126687 ?auto_126685 ) ) ( not ( = ?auto_126681 ?auto_126685 ) ) ( not ( = ?auto_126683 ?auto_126685 ) ) ( ON ?auto_126681 ?auto_126687 ) ( ON-TABLE ?auto_126685 ) ( ON ?auto_126683 ?auto_126681 ) ( ON ?auto_126684 ?auto_126683 ) ( ON ?auto_126686 ?auto_126684 ) ( ON ?auto_126682 ?auto_126686 ) ( CLEAR ?auto_126682 ) ( HOLDING ?auto_126680 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126680 ?auto_126682 )
      ( MAKE-1PILE ?auto_126680 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_126688 - BLOCK
    )
    :vars
    (
      ?auto_126691 - BLOCK
      ?auto_126690 - BLOCK
      ?auto_126695 - BLOCK
      ?auto_126689 - BLOCK
      ?auto_126693 - BLOCK
      ?auto_126692 - BLOCK
      ?auto_126694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126688 ?auto_126691 ) ) ( not ( = ?auto_126688 ?auto_126690 ) ) ( not ( = ?auto_126688 ?auto_126695 ) ) ( not ( = ?auto_126691 ?auto_126690 ) ) ( not ( = ?auto_126691 ?auto_126695 ) ) ( not ( = ?auto_126690 ?auto_126695 ) ) ( not ( = ?auto_126689 ?auto_126693 ) ) ( not ( = ?auto_126689 ?auto_126692 ) ) ( not ( = ?auto_126689 ?auto_126695 ) ) ( not ( = ?auto_126693 ?auto_126692 ) ) ( not ( = ?auto_126693 ?auto_126695 ) ) ( not ( = ?auto_126692 ?auto_126695 ) ) ( not ( = ?auto_126688 ?auto_126692 ) ) ( not ( = ?auto_126688 ?auto_126689 ) ) ( not ( = ?auto_126688 ?auto_126693 ) ) ( not ( = ?auto_126691 ?auto_126692 ) ) ( not ( = ?auto_126691 ?auto_126689 ) ) ( not ( = ?auto_126691 ?auto_126693 ) ) ( not ( = ?auto_126690 ?auto_126692 ) ) ( not ( = ?auto_126690 ?auto_126689 ) ) ( not ( = ?auto_126690 ?auto_126693 ) ) ( ON ?auto_126689 ?auto_126694 ) ( not ( = ?auto_126688 ?auto_126694 ) ) ( not ( = ?auto_126691 ?auto_126694 ) ) ( not ( = ?auto_126690 ?auto_126694 ) ) ( not ( = ?auto_126695 ?auto_126694 ) ) ( not ( = ?auto_126689 ?auto_126694 ) ) ( not ( = ?auto_126693 ?auto_126694 ) ) ( not ( = ?auto_126692 ?auto_126694 ) ) ( ON ?auto_126693 ?auto_126689 ) ( ON-TABLE ?auto_126694 ) ( ON ?auto_126692 ?auto_126693 ) ( ON ?auto_126695 ?auto_126692 ) ( ON ?auto_126690 ?auto_126695 ) ( ON ?auto_126691 ?auto_126690 ) ( ON ?auto_126688 ?auto_126691 ) ( CLEAR ?auto_126688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126694 ?auto_126689 ?auto_126693 ?auto_126692 ?auto_126695 ?auto_126690 ?auto_126691 )
      ( MAKE-1PILE ?auto_126688 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126702 - BLOCK
      ?auto_126703 - BLOCK
      ?auto_126704 - BLOCK
      ?auto_126705 - BLOCK
      ?auto_126706 - BLOCK
      ?auto_126707 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_126707 ) ( CLEAR ?auto_126706 ) ( ON-TABLE ?auto_126702 ) ( ON ?auto_126703 ?auto_126702 ) ( ON ?auto_126704 ?auto_126703 ) ( ON ?auto_126705 ?auto_126704 ) ( ON ?auto_126706 ?auto_126705 ) ( not ( = ?auto_126702 ?auto_126703 ) ) ( not ( = ?auto_126702 ?auto_126704 ) ) ( not ( = ?auto_126702 ?auto_126705 ) ) ( not ( = ?auto_126702 ?auto_126706 ) ) ( not ( = ?auto_126702 ?auto_126707 ) ) ( not ( = ?auto_126703 ?auto_126704 ) ) ( not ( = ?auto_126703 ?auto_126705 ) ) ( not ( = ?auto_126703 ?auto_126706 ) ) ( not ( = ?auto_126703 ?auto_126707 ) ) ( not ( = ?auto_126704 ?auto_126705 ) ) ( not ( = ?auto_126704 ?auto_126706 ) ) ( not ( = ?auto_126704 ?auto_126707 ) ) ( not ( = ?auto_126705 ?auto_126706 ) ) ( not ( = ?auto_126705 ?auto_126707 ) ) ( not ( = ?auto_126706 ?auto_126707 ) ) )
    :subtasks
    ( ( !STACK ?auto_126707 ?auto_126706 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126708 - BLOCK
      ?auto_126709 - BLOCK
      ?auto_126710 - BLOCK
      ?auto_126711 - BLOCK
      ?auto_126712 - BLOCK
      ?auto_126713 - BLOCK
    )
    :vars
    (
      ?auto_126714 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126712 ) ( ON-TABLE ?auto_126708 ) ( ON ?auto_126709 ?auto_126708 ) ( ON ?auto_126710 ?auto_126709 ) ( ON ?auto_126711 ?auto_126710 ) ( ON ?auto_126712 ?auto_126711 ) ( not ( = ?auto_126708 ?auto_126709 ) ) ( not ( = ?auto_126708 ?auto_126710 ) ) ( not ( = ?auto_126708 ?auto_126711 ) ) ( not ( = ?auto_126708 ?auto_126712 ) ) ( not ( = ?auto_126708 ?auto_126713 ) ) ( not ( = ?auto_126709 ?auto_126710 ) ) ( not ( = ?auto_126709 ?auto_126711 ) ) ( not ( = ?auto_126709 ?auto_126712 ) ) ( not ( = ?auto_126709 ?auto_126713 ) ) ( not ( = ?auto_126710 ?auto_126711 ) ) ( not ( = ?auto_126710 ?auto_126712 ) ) ( not ( = ?auto_126710 ?auto_126713 ) ) ( not ( = ?auto_126711 ?auto_126712 ) ) ( not ( = ?auto_126711 ?auto_126713 ) ) ( not ( = ?auto_126712 ?auto_126713 ) ) ( ON ?auto_126713 ?auto_126714 ) ( CLEAR ?auto_126713 ) ( HAND-EMPTY ) ( not ( = ?auto_126708 ?auto_126714 ) ) ( not ( = ?auto_126709 ?auto_126714 ) ) ( not ( = ?auto_126710 ?auto_126714 ) ) ( not ( = ?auto_126711 ?auto_126714 ) ) ( not ( = ?auto_126712 ?auto_126714 ) ) ( not ( = ?auto_126713 ?auto_126714 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126713 ?auto_126714 )
      ( MAKE-6PILE ?auto_126708 ?auto_126709 ?auto_126710 ?auto_126711 ?auto_126712 ?auto_126713 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126715 - BLOCK
      ?auto_126716 - BLOCK
      ?auto_126717 - BLOCK
      ?auto_126718 - BLOCK
      ?auto_126719 - BLOCK
      ?auto_126720 - BLOCK
    )
    :vars
    (
      ?auto_126721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126715 ) ( ON ?auto_126716 ?auto_126715 ) ( ON ?auto_126717 ?auto_126716 ) ( ON ?auto_126718 ?auto_126717 ) ( not ( = ?auto_126715 ?auto_126716 ) ) ( not ( = ?auto_126715 ?auto_126717 ) ) ( not ( = ?auto_126715 ?auto_126718 ) ) ( not ( = ?auto_126715 ?auto_126719 ) ) ( not ( = ?auto_126715 ?auto_126720 ) ) ( not ( = ?auto_126716 ?auto_126717 ) ) ( not ( = ?auto_126716 ?auto_126718 ) ) ( not ( = ?auto_126716 ?auto_126719 ) ) ( not ( = ?auto_126716 ?auto_126720 ) ) ( not ( = ?auto_126717 ?auto_126718 ) ) ( not ( = ?auto_126717 ?auto_126719 ) ) ( not ( = ?auto_126717 ?auto_126720 ) ) ( not ( = ?auto_126718 ?auto_126719 ) ) ( not ( = ?auto_126718 ?auto_126720 ) ) ( not ( = ?auto_126719 ?auto_126720 ) ) ( ON ?auto_126720 ?auto_126721 ) ( CLEAR ?auto_126720 ) ( not ( = ?auto_126715 ?auto_126721 ) ) ( not ( = ?auto_126716 ?auto_126721 ) ) ( not ( = ?auto_126717 ?auto_126721 ) ) ( not ( = ?auto_126718 ?auto_126721 ) ) ( not ( = ?auto_126719 ?auto_126721 ) ) ( not ( = ?auto_126720 ?auto_126721 ) ) ( HOLDING ?auto_126719 ) ( CLEAR ?auto_126718 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126715 ?auto_126716 ?auto_126717 ?auto_126718 ?auto_126719 )
      ( MAKE-6PILE ?auto_126715 ?auto_126716 ?auto_126717 ?auto_126718 ?auto_126719 ?auto_126720 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126722 - BLOCK
      ?auto_126723 - BLOCK
      ?auto_126724 - BLOCK
      ?auto_126725 - BLOCK
      ?auto_126726 - BLOCK
      ?auto_126727 - BLOCK
    )
    :vars
    (
      ?auto_126728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126722 ) ( ON ?auto_126723 ?auto_126722 ) ( ON ?auto_126724 ?auto_126723 ) ( ON ?auto_126725 ?auto_126724 ) ( not ( = ?auto_126722 ?auto_126723 ) ) ( not ( = ?auto_126722 ?auto_126724 ) ) ( not ( = ?auto_126722 ?auto_126725 ) ) ( not ( = ?auto_126722 ?auto_126726 ) ) ( not ( = ?auto_126722 ?auto_126727 ) ) ( not ( = ?auto_126723 ?auto_126724 ) ) ( not ( = ?auto_126723 ?auto_126725 ) ) ( not ( = ?auto_126723 ?auto_126726 ) ) ( not ( = ?auto_126723 ?auto_126727 ) ) ( not ( = ?auto_126724 ?auto_126725 ) ) ( not ( = ?auto_126724 ?auto_126726 ) ) ( not ( = ?auto_126724 ?auto_126727 ) ) ( not ( = ?auto_126725 ?auto_126726 ) ) ( not ( = ?auto_126725 ?auto_126727 ) ) ( not ( = ?auto_126726 ?auto_126727 ) ) ( ON ?auto_126727 ?auto_126728 ) ( not ( = ?auto_126722 ?auto_126728 ) ) ( not ( = ?auto_126723 ?auto_126728 ) ) ( not ( = ?auto_126724 ?auto_126728 ) ) ( not ( = ?auto_126725 ?auto_126728 ) ) ( not ( = ?auto_126726 ?auto_126728 ) ) ( not ( = ?auto_126727 ?auto_126728 ) ) ( CLEAR ?auto_126725 ) ( ON ?auto_126726 ?auto_126727 ) ( CLEAR ?auto_126726 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126728 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126728 ?auto_126727 )
      ( MAKE-6PILE ?auto_126722 ?auto_126723 ?auto_126724 ?auto_126725 ?auto_126726 ?auto_126727 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126729 - BLOCK
      ?auto_126730 - BLOCK
      ?auto_126731 - BLOCK
      ?auto_126732 - BLOCK
      ?auto_126733 - BLOCK
      ?auto_126734 - BLOCK
    )
    :vars
    (
      ?auto_126735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126729 ) ( ON ?auto_126730 ?auto_126729 ) ( ON ?auto_126731 ?auto_126730 ) ( not ( = ?auto_126729 ?auto_126730 ) ) ( not ( = ?auto_126729 ?auto_126731 ) ) ( not ( = ?auto_126729 ?auto_126732 ) ) ( not ( = ?auto_126729 ?auto_126733 ) ) ( not ( = ?auto_126729 ?auto_126734 ) ) ( not ( = ?auto_126730 ?auto_126731 ) ) ( not ( = ?auto_126730 ?auto_126732 ) ) ( not ( = ?auto_126730 ?auto_126733 ) ) ( not ( = ?auto_126730 ?auto_126734 ) ) ( not ( = ?auto_126731 ?auto_126732 ) ) ( not ( = ?auto_126731 ?auto_126733 ) ) ( not ( = ?auto_126731 ?auto_126734 ) ) ( not ( = ?auto_126732 ?auto_126733 ) ) ( not ( = ?auto_126732 ?auto_126734 ) ) ( not ( = ?auto_126733 ?auto_126734 ) ) ( ON ?auto_126734 ?auto_126735 ) ( not ( = ?auto_126729 ?auto_126735 ) ) ( not ( = ?auto_126730 ?auto_126735 ) ) ( not ( = ?auto_126731 ?auto_126735 ) ) ( not ( = ?auto_126732 ?auto_126735 ) ) ( not ( = ?auto_126733 ?auto_126735 ) ) ( not ( = ?auto_126734 ?auto_126735 ) ) ( ON ?auto_126733 ?auto_126734 ) ( CLEAR ?auto_126733 ) ( ON-TABLE ?auto_126735 ) ( HOLDING ?auto_126732 ) ( CLEAR ?auto_126731 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126729 ?auto_126730 ?auto_126731 ?auto_126732 )
      ( MAKE-6PILE ?auto_126729 ?auto_126730 ?auto_126731 ?auto_126732 ?auto_126733 ?auto_126734 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126736 - BLOCK
      ?auto_126737 - BLOCK
      ?auto_126738 - BLOCK
      ?auto_126739 - BLOCK
      ?auto_126740 - BLOCK
      ?auto_126741 - BLOCK
    )
    :vars
    (
      ?auto_126742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126736 ) ( ON ?auto_126737 ?auto_126736 ) ( ON ?auto_126738 ?auto_126737 ) ( not ( = ?auto_126736 ?auto_126737 ) ) ( not ( = ?auto_126736 ?auto_126738 ) ) ( not ( = ?auto_126736 ?auto_126739 ) ) ( not ( = ?auto_126736 ?auto_126740 ) ) ( not ( = ?auto_126736 ?auto_126741 ) ) ( not ( = ?auto_126737 ?auto_126738 ) ) ( not ( = ?auto_126737 ?auto_126739 ) ) ( not ( = ?auto_126737 ?auto_126740 ) ) ( not ( = ?auto_126737 ?auto_126741 ) ) ( not ( = ?auto_126738 ?auto_126739 ) ) ( not ( = ?auto_126738 ?auto_126740 ) ) ( not ( = ?auto_126738 ?auto_126741 ) ) ( not ( = ?auto_126739 ?auto_126740 ) ) ( not ( = ?auto_126739 ?auto_126741 ) ) ( not ( = ?auto_126740 ?auto_126741 ) ) ( ON ?auto_126741 ?auto_126742 ) ( not ( = ?auto_126736 ?auto_126742 ) ) ( not ( = ?auto_126737 ?auto_126742 ) ) ( not ( = ?auto_126738 ?auto_126742 ) ) ( not ( = ?auto_126739 ?auto_126742 ) ) ( not ( = ?auto_126740 ?auto_126742 ) ) ( not ( = ?auto_126741 ?auto_126742 ) ) ( ON ?auto_126740 ?auto_126741 ) ( ON-TABLE ?auto_126742 ) ( CLEAR ?auto_126738 ) ( ON ?auto_126739 ?auto_126740 ) ( CLEAR ?auto_126739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126742 ?auto_126741 ?auto_126740 )
      ( MAKE-6PILE ?auto_126736 ?auto_126737 ?auto_126738 ?auto_126739 ?auto_126740 ?auto_126741 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126743 - BLOCK
      ?auto_126744 - BLOCK
      ?auto_126745 - BLOCK
      ?auto_126746 - BLOCK
      ?auto_126747 - BLOCK
      ?auto_126748 - BLOCK
    )
    :vars
    (
      ?auto_126749 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126743 ) ( ON ?auto_126744 ?auto_126743 ) ( not ( = ?auto_126743 ?auto_126744 ) ) ( not ( = ?auto_126743 ?auto_126745 ) ) ( not ( = ?auto_126743 ?auto_126746 ) ) ( not ( = ?auto_126743 ?auto_126747 ) ) ( not ( = ?auto_126743 ?auto_126748 ) ) ( not ( = ?auto_126744 ?auto_126745 ) ) ( not ( = ?auto_126744 ?auto_126746 ) ) ( not ( = ?auto_126744 ?auto_126747 ) ) ( not ( = ?auto_126744 ?auto_126748 ) ) ( not ( = ?auto_126745 ?auto_126746 ) ) ( not ( = ?auto_126745 ?auto_126747 ) ) ( not ( = ?auto_126745 ?auto_126748 ) ) ( not ( = ?auto_126746 ?auto_126747 ) ) ( not ( = ?auto_126746 ?auto_126748 ) ) ( not ( = ?auto_126747 ?auto_126748 ) ) ( ON ?auto_126748 ?auto_126749 ) ( not ( = ?auto_126743 ?auto_126749 ) ) ( not ( = ?auto_126744 ?auto_126749 ) ) ( not ( = ?auto_126745 ?auto_126749 ) ) ( not ( = ?auto_126746 ?auto_126749 ) ) ( not ( = ?auto_126747 ?auto_126749 ) ) ( not ( = ?auto_126748 ?auto_126749 ) ) ( ON ?auto_126747 ?auto_126748 ) ( ON-TABLE ?auto_126749 ) ( ON ?auto_126746 ?auto_126747 ) ( CLEAR ?auto_126746 ) ( HOLDING ?auto_126745 ) ( CLEAR ?auto_126744 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126743 ?auto_126744 ?auto_126745 )
      ( MAKE-6PILE ?auto_126743 ?auto_126744 ?auto_126745 ?auto_126746 ?auto_126747 ?auto_126748 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126750 - BLOCK
      ?auto_126751 - BLOCK
      ?auto_126752 - BLOCK
      ?auto_126753 - BLOCK
      ?auto_126754 - BLOCK
      ?auto_126755 - BLOCK
    )
    :vars
    (
      ?auto_126756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126750 ) ( ON ?auto_126751 ?auto_126750 ) ( not ( = ?auto_126750 ?auto_126751 ) ) ( not ( = ?auto_126750 ?auto_126752 ) ) ( not ( = ?auto_126750 ?auto_126753 ) ) ( not ( = ?auto_126750 ?auto_126754 ) ) ( not ( = ?auto_126750 ?auto_126755 ) ) ( not ( = ?auto_126751 ?auto_126752 ) ) ( not ( = ?auto_126751 ?auto_126753 ) ) ( not ( = ?auto_126751 ?auto_126754 ) ) ( not ( = ?auto_126751 ?auto_126755 ) ) ( not ( = ?auto_126752 ?auto_126753 ) ) ( not ( = ?auto_126752 ?auto_126754 ) ) ( not ( = ?auto_126752 ?auto_126755 ) ) ( not ( = ?auto_126753 ?auto_126754 ) ) ( not ( = ?auto_126753 ?auto_126755 ) ) ( not ( = ?auto_126754 ?auto_126755 ) ) ( ON ?auto_126755 ?auto_126756 ) ( not ( = ?auto_126750 ?auto_126756 ) ) ( not ( = ?auto_126751 ?auto_126756 ) ) ( not ( = ?auto_126752 ?auto_126756 ) ) ( not ( = ?auto_126753 ?auto_126756 ) ) ( not ( = ?auto_126754 ?auto_126756 ) ) ( not ( = ?auto_126755 ?auto_126756 ) ) ( ON ?auto_126754 ?auto_126755 ) ( ON-TABLE ?auto_126756 ) ( ON ?auto_126753 ?auto_126754 ) ( CLEAR ?auto_126751 ) ( ON ?auto_126752 ?auto_126753 ) ( CLEAR ?auto_126752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126756 ?auto_126755 ?auto_126754 ?auto_126753 )
      ( MAKE-6PILE ?auto_126750 ?auto_126751 ?auto_126752 ?auto_126753 ?auto_126754 ?auto_126755 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126757 - BLOCK
      ?auto_126758 - BLOCK
      ?auto_126759 - BLOCK
      ?auto_126760 - BLOCK
      ?auto_126761 - BLOCK
      ?auto_126762 - BLOCK
    )
    :vars
    (
      ?auto_126763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126757 ) ( not ( = ?auto_126757 ?auto_126758 ) ) ( not ( = ?auto_126757 ?auto_126759 ) ) ( not ( = ?auto_126757 ?auto_126760 ) ) ( not ( = ?auto_126757 ?auto_126761 ) ) ( not ( = ?auto_126757 ?auto_126762 ) ) ( not ( = ?auto_126758 ?auto_126759 ) ) ( not ( = ?auto_126758 ?auto_126760 ) ) ( not ( = ?auto_126758 ?auto_126761 ) ) ( not ( = ?auto_126758 ?auto_126762 ) ) ( not ( = ?auto_126759 ?auto_126760 ) ) ( not ( = ?auto_126759 ?auto_126761 ) ) ( not ( = ?auto_126759 ?auto_126762 ) ) ( not ( = ?auto_126760 ?auto_126761 ) ) ( not ( = ?auto_126760 ?auto_126762 ) ) ( not ( = ?auto_126761 ?auto_126762 ) ) ( ON ?auto_126762 ?auto_126763 ) ( not ( = ?auto_126757 ?auto_126763 ) ) ( not ( = ?auto_126758 ?auto_126763 ) ) ( not ( = ?auto_126759 ?auto_126763 ) ) ( not ( = ?auto_126760 ?auto_126763 ) ) ( not ( = ?auto_126761 ?auto_126763 ) ) ( not ( = ?auto_126762 ?auto_126763 ) ) ( ON ?auto_126761 ?auto_126762 ) ( ON-TABLE ?auto_126763 ) ( ON ?auto_126760 ?auto_126761 ) ( ON ?auto_126759 ?auto_126760 ) ( CLEAR ?auto_126759 ) ( HOLDING ?auto_126758 ) ( CLEAR ?auto_126757 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126757 ?auto_126758 )
      ( MAKE-6PILE ?auto_126757 ?auto_126758 ?auto_126759 ?auto_126760 ?auto_126761 ?auto_126762 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126764 - BLOCK
      ?auto_126765 - BLOCK
      ?auto_126766 - BLOCK
      ?auto_126767 - BLOCK
      ?auto_126768 - BLOCK
      ?auto_126769 - BLOCK
    )
    :vars
    (
      ?auto_126770 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126764 ) ( not ( = ?auto_126764 ?auto_126765 ) ) ( not ( = ?auto_126764 ?auto_126766 ) ) ( not ( = ?auto_126764 ?auto_126767 ) ) ( not ( = ?auto_126764 ?auto_126768 ) ) ( not ( = ?auto_126764 ?auto_126769 ) ) ( not ( = ?auto_126765 ?auto_126766 ) ) ( not ( = ?auto_126765 ?auto_126767 ) ) ( not ( = ?auto_126765 ?auto_126768 ) ) ( not ( = ?auto_126765 ?auto_126769 ) ) ( not ( = ?auto_126766 ?auto_126767 ) ) ( not ( = ?auto_126766 ?auto_126768 ) ) ( not ( = ?auto_126766 ?auto_126769 ) ) ( not ( = ?auto_126767 ?auto_126768 ) ) ( not ( = ?auto_126767 ?auto_126769 ) ) ( not ( = ?auto_126768 ?auto_126769 ) ) ( ON ?auto_126769 ?auto_126770 ) ( not ( = ?auto_126764 ?auto_126770 ) ) ( not ( = ?auto_126765 ?auto_126770 ) ) ( not ( = ?auto_126766 ?auto_126770 ) ) ( not ( = ?auto_126767 ?auto_126770 ) ) ( not ( = ?auto_126768 ?auto_126770 ) ) ( not ( = ?auto_126769 ?auto_126770 ) ) ( ON ?auto_126768 ?auto_126769 ) ( ON-TABLE ?auto_126770 ) ( ON ?auto_126767 ?auto_126768 ) ( ON ?auto_126766 ?auto_126767 ) ( CLEAR ?auto_126764 ) ( ON ?auto_126765 ?auto_126766 ) ( CLEAR ?auto_126765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126770 ?auto_126769 ?auto_126768 ?auto_126767 ?auto_126766 )
      ( MAKE-6PILE ?auto_126764 ?auto_126765 ?auto_126766 ?auto_126767 ?auto_126768 ?auto_126769 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126771 - BLOCK
      ?auto_126772 - BLOCK
      ?auto_126773 - BLOCK
      ?auto_126774 - BLOCK
      ?auto_126775 - BLOCK
      ?auto_126776 - BLOCK
    )
    :vars
    (
      ?auto_126777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126771 ?auto_126772 ) ) ( not ( = ?auto_126771 ?auto_126773 ) ) ( not ( = ?auto_126771 ?auto_126774 ) ) ( not ( = ?auto_126771 ?auto_126775 ) ) ( not ( = ?auto_126771 ?auto_126776 ) ) ( not ( = ?auto_126772 ?auto_126773 ) ) ( not ( = ?auto_126772 ?auto_126774 ) ) ( not ( = ?auto_126772 ?auto_126775 ) ) ( not ( = ?auto_126772 ?auto_126776 ) ) ( not ( = ?auto_126773 ?auto_126774 ) ) ( not ( = ?auto_126773 ?auto_126775 ) ) ( not ( = ?auto_126773 ?auto_126776 ) ) ( not ( = ?auto_126774 ?auto_126775 ) ) ( not ( = ?auto_126774 ?auto_126776 ) ) ( not ( = ?auto_126775 ?auto_126776 ) ) ( ON ?auto_126776 ?auto_126777 ) ( not ( = ?auto_126771 ?auto_126777 ) ) ( not ( = ?auto_126772 ?auto_126777 ) ) ( not ( = ?auto_126773 ?auto_126777 ) ) ( not ( = ?auto_126774 ?auto_126777 ) ) ( not ( = ?auto_126775 ?auto_126777 ) ) ( not ( = ?auto_126776 ?auto_126777 ) ) ( ON ?auto_126775 ?auto_126776 ) ( ON-TABLE ?auto_126777 ) ( ON ?auto_126774 ?auto_126775 ) ( ON ?auto_126773 ?auto_126774 ) ( ON ?auto_126772 ?auto_126773 ) ( CLEAR ?auto_126772 ) ( HOLDING ?auto_126771 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126771 )
      ( MAKE-6PILE ?auto_126771 ?auto_126772 ?auto_126773 ?auto_126774 ?auto_126775 ?auto_126776 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126778 - BLOCK
      ?auto_126779 - BLOCK
      ?auto_126780 - BLOCK
      ?auto_126781 - BLOCK
      ?auto_126782 - BLOCK
      ?auto_126783 - BLOCK
    )
    :vars
    (
      ?auto_126784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126778 ?auto_126779 ) ) ( not ( = ?auto_126778 ?auto_126780 ) ) ( not ( = ?auto_126778 ?auto_126781 ) ) ( not ( = ?auto_126778 ?auto_126782 ) ) ( not ( = ?auto_126778 ?auto_126783 ) ) ( not ( = ?auto_126779 ?auto_126780 ) ) ( not ( = ?auto_126779 ?auto_126781 ) ) ( not ( = ?auto_126779 ?auto_126782 ) ) ( not ( = ?auto_126779 ?auto_126783 ) ) ( not ( = ?auto_126780 ?auto_126781 ) ) ( not ( = ?auto_126780 ?auto_126782 ) ) ( not ( = ?auto_126780 ?auto_126783 ) ) ( not ( = ?auto_126781 ?auto_126782 ) ) ( not ( = ?auto_126781 ?auto_126783 ) ) ( not ( = ?auto_126782 ?auto_126783 ) ) ( ON ?auto_126783 ?auto_126784 ) ( not ( = ?auto_126778 ?auto_126784 ) ) ( not ( = ?auto_126779 ?auto_126784 ) ) ( not ( = ?auto_126780 ?auto_126784 ) ) ( not ( = ?auto_126781 ?auto_126784 ) ) ( not ( = ?auto_126782 ?auto_126784 ) ) ( not ( = ?auto_126783 ?auto_126784 ) ) ( ON ?auto_126782 ?auto_126783 ) ( ON-TABLE ?auto_126784 ) ( ON ?auto_126781 ?auto_126782 ) ( ON ?auto_126780 ?auto_126781 ) ( ON ?auto_126779 ?auto_126780 ) ( ON ?auto_126778 ?auto_126779 ) ( CLEAR ?auto_126778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126784 ?auto_126783 ?auto_126782 ?auto_126781 ?auto_126780 ?auto_126779 )
      ( MAKE-6PILE ?auto_126778 ?auto_126779 ?auto_126780 ?auto_126781 ?auto_126782 ?auto_126783 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126785 - BLOCK
      ?auto_126786 - BLOCK
      ?auto_126787 - BLOCK
      ?auto_126788 - BLOCK
      ?auto_126789 - BLOCK
      ?auto_126790 - BLOCK
    )
    :vars
    (
      ?auto_126791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126785 ?auto_126786 ) ) ( not ( = ?auto_126785 ?auto_126787 ) ) ( not ( = ?auto_126785 ?auto_126788 ) ) ( not ( = ?auto_126785 ?auto_126789 ) ) ( not ( = ?auto_126785 ?auto_126790 ) ) ( not ( = ?auto_126786 ?auto_126787 ) ) ( not ( = ?auto_126786 ?auto_126788 ) ) ( not ( = ?auto_126786 ?auto_126789 ) ) ( not ( = ?auto_126786 ?auto_126790 ) ) ( not ( = ?auto_126787 ?auto_126788 ) ) ( not ( = ?auto_126787 ?auto_126789 ) ) ( not ( = ?auto_126787 ?auto_126790 ) ) ( not ( = ?auto_126788 ?auto_126789 ) ) ( not ( = ?auto_126788 ?auto_126790 ) ) ( not ( = ?auto_126789 ?auto_126790 ) ) ( ON ?auto_126790 ?auto_126791 ) ( not ( = ?auto_126785 ?auto_126791 ) ) ( not ( = ?auto_126786 ?auto_126791 ) ) ( not ( = ?auto_126787 ?auto_126791 ) ) ( not ( = ?auto_126788 ?auto_126791 ) ) ( not ( = ?auto_126789 ?auto_126791 ) ) ( not ( = ?auto_126790 ?auto_126791 ) ) ( ON ?auto_126789 ?auto_126790 ) ( ON-TABLE ?auto_126791 ) ( ON ?auto_126788 ?auto_126789 ) ( ON ?auto_126787 ?auto_126788 ) ( ON ?auto_126786 ?auto_126787 ) ( HOLDING ?auto_126785 ) ( CLEAR ?auto_126786 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126791 ?auto_126790 ?auto_126789 ?auto_126788 ?auto_126787 ?auto_126786 ?auto_126785 )
      ( MAKE-6PILE ?auto_126785 ?auto_126786 ?auto_126787 ?auto_126788 ?auto_126789 ?auto_126790 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126792 - BLOCK
      ?auto_126793 - BLOCK
      ?auto_126794 - BLOCK
      ?auto_126795 - BLOCK
      ?auto_126796 - BLOCK
      ?auto_126797 - BLOCK
    )
    :vars
    (
      ?auto_126798 - BLOCK
      ?auto_126799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126792 ?auto_126793 ) ) ( not ( = ?auto_126792 ?auto_126794 ) ) ( not ( = ?auto_126792 ?auto_126795 ) ) ( not ( = ?auto_126792 ?auto_126796 ) ) ( not ( = ?auto_126792 ?auto_126797 ) ) ( not ( = ?auto_126793 ?auto_126794 ) ) ( not ( = ?auto_126793 ?auto_126795 ) ) ( not ( = ?auto_126793 ?auto_126796 ) ) ( not ( = ?auto_126793 ?auto_126797 ) ) ( not ( = ?auto_126794 ?auto_126795 ) ) ( not ( = ?auto_126794 ?auto_126796 ) ) ( not ( = ?auto_126794 ?auto_126797 ) ) ( not ( = ?auto_126795 ?auto_126796 ) ) ( not ( = ?auto_126795 ?auto_126797 ) ) ( not ( = ?auto_126796 ?auto_126797 ) ) ( ON ?auto_126797 ?auto_126798 ) ( not ( = ?auto_126792 ?auto_126798 ) ) ( not ( = ?auto_126793 ?auto_126798 ) ) ( not ( = ?auto_126794 ?auto_126798 ) ) ( not ( = ?auto_126795 ?auto_126798 ) ) ( not ( = ?auto_126796 ?auto_126798 ) ) ( not ( = ?auto_126797 ?auto_126798 ) ) ( ON ?auto_126796 ?auto_126797 ) ( ON-TABLE ?auto_126798 ) ( ON ?auto_126795 ?auto_126796 ) ( ON ?auto_126794 ?auto_126795 ) ( ON ?auto_126793 ?auto_126794 ) ( CLEAR ?auto_126793 ) ( ON ?auto_126792 ?auto_126799 ) ( CLEAR ?auto_126792 ) ( HAND-EMPTY ) ( not ( = ?auto_126792 ?auto_126799 ) ) ( not ( = ?auto_126793 ?auto_126799 ) ) ( not ( = ?auto_126794 ?auto_126799 ) ) ( not ( = ?auto_126795 ?auto_126799 ) ) ( not ( = ?auto_126796 ?auto_126799 ) ) ( not ( = ?auto_126797 ?auto_126799 ) ) ( not ( = ?auto_126798 ?auto_126799 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_126792 ?auto_126799 )
      ( MAKE-6PILE ?auto_126792 ?auto_126793 ?auto_126794 ?auto_126795 ?auto_126796 ?auto_126797 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126800 - BLOCK
      ?auto_126801 - BLOCK
      ?auto_126802 - BLOCK
      ?auto_126803 - BLOCK
      ?auto_126804 - BLOCK
      ?auto_126805 - BLOCK
    )
    :vars
    (
      ?auto_126807 - BLOCK
      ?auto_126806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126800 ?auto_126801 ) ) ( not ( = ?auto_126800 ?auto_126802 ) ) ( not ( = ?auto_126800 ?auto_126803 ) ) ( not ( = ?auto_126800 ?auto_126804 ) ) ( not ( = ?auto_126800 ?auto_126805 ) ) ( not ( = ?auto_126801 ?auto_126802 ) ) ( not ( = ?auto_126801 ?auto_126803 ) ) ( not ( = ?auto_126801 ?auto_126804 ) ) ( not ( = ?auto_126801 ?auto_126805 ) ) ( not ( = ?auto_126802 ?auto_126803 ) ) ( not ( = ?auto_126802 ?auto_126804 ) ) ( not ( = ?auto_126802 ?auto_126805 ) ) ( not ( = ?auto_126803 ?auto_126804 ) ) ( not ( = ?auto_126803 ?auto_126805 ) ) ( not ( = ?auto_126804 ?auto_126805 ) ) ( ON ?auto_126805 ?auto_126807 ) ( not ( = ?auto_126800 ?auto_126807 ) ) ( not ( = ?auto_126801 ?auto_126807 ) ) ( not ( = ?auto_126802 ?auto_126807 ) ) ( not ( = ?auto_126803 ?auto_126807 ) ) ( not ( = ?auto_126804 ?auto_126807 ) ) ( not ( = ?auto_126805 ?auto_126807 ) ) ( ON ?auto_126804 ?auto_126805 ) ( ON-TABLE ?auto_126807 ) ( ON ?auto_126803 ?auto_126804 ) ( ON ?auto_126802 ?auto_126803 ) ( ON ?auto_126800 ?auto_126806 ) ( CLEAR ?auto_126800 ) ( not ( = ?auto_126800 ?auto_126806 ) ) ( not ( = ?auto_126801 ?auto_126806 ) ) ( not ( = ?auto_126802 ?auto_126806 ) ) ( not ( = ?auto_126803 ?auto_126806 ) ) ( not ( = ?auto_126804 ?auto_126806 ) ) ( not ( = ?auto_126805 ?auto_126806 ) ) ( not ( = ?auto_126807 ?auto_126806 ) ) ( HOLDING ?auto_126801 ) ( CLEAR ?auto_126802 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126807 ?auto_126805 ?auto_126804 ?auto_126803 ?auto_126802 ?auto_126801 )
      ( MAKE-6PILE ?auto_126800 ?auto_126801 ?auto_126802 ?auto_126803 ?auto_126804 ?auto_126805 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126808 - BLOCK
      ?auto_126809 - BLOCK
      ?auto_126810 - BLOCK
      ?auto_126811 - BLOCK
      ?auto_126812 - BLOCK
      ?auto_126813 - BLOCK
    )
    :vars
    (
      ?auto_126814 - BLOCK
      ?auto_126815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126808 ?auto_126809 ) ) ( not ( = ?auto_126808 ?auto_126810 ) ) ( not ( = ?auto_126808 ?auto_126811 ) ) ( not ( = ?auto_126808 ?auto_126812 ) ) ( not ( = ?auto_126808 ?auto_126813 ) ) ( not ( = ?auto_126809 ?auto_126810 ) ) ( not ( = ?auto_126809 ?auto_126811 ) ) ( not ( = ?auto_126809 ?auto_126812 ) ) ( not ( = ?auto_126809 ?auto_126813 ) ) ( not ( = ?auto_126810 ?auto_126811 ) ) ( not ( = ?auto_126810 ?auto_126812 ) ) ( not ( = ?auto_126810 ?auto_126813 ) ) ( not ( = ?auto_126811 ?auto_126812 ) ) ( not ( = ?auto_126811 ?auto_126813 ) ) ( not ( = ?auto_126812 ?auto_126813 ) ) ( ON ?auto_126813 ?auto_126814 ) ( not ( = ?auto_126808 ?auto_126814 ) ) ( not ( = ?auto_126809 ?auto_126814 ) ) ( not ( = ?auto_126810 ?auto_126814 ) ) ( not ( = ?auto_126811 ?auto_126814 ) ) ( not ( = ?auto_126812 ?auto_126814 ) ) ( not ( = ?auto_126813 ?auto_126814 ) ) ( ON ?auto_126812 ?auto_126813 ) ( ON-TABLE ?auto_126814 ) ( ON ?auto_126811 ?auto_126812 ) ( ON ?auto_126810 ?auto_126811 ) ( ON ?auto_126808 ?auto_126815 ) ( not ( = ?auto_126808 ?auto_126815 ) ) ( not ( = ?auto_126809 ?auto_126815 ) ) ( not ( = ?auto_126810 ?auto_126815 ) ) ( not ( = ?auto_126811 ?auto_126815 ) ) ( not ( = ?auto_126812 ?auto_126815 ) ) ( not ( = ?auto_126813 ?auto_126815 ) ) ( not ( = ?auto_126814 ?auto_126815 ) ) ( CLEAR ?auto_126810 ) ( ON ?auto_126809 ?auto_126808 ) ( CLEAR ?auto_126809 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_126815 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126815 ?auto_126808 )
      ( MAKE-6PILE ?auto_126808 ?auto_126809 ?auto_126810 ?auto_126811 ?auto_126812 ?auto_126813 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126816 - BLOCK
      ?auto_126817 - BLOCK
      ?auto_126818 - BLOCK
      ?auto_126819 - BLOCK
      ?auto_126820 - BLOCK
      ?auto_126821 - BLOCK
    )
    :vars
    (
      ?auto_126822 - BLOCK
      ?auto_126823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126816 ?auto_126817 ) ) ( not ( = ?auto_126816 ?auto_126818 ) ) ( not ( = ?auto_126816 ?auto_126819 ) ) ( not ( = ?auto_126816 ?auto_126820 ) ) ( not ( = ?auto_126816 ?auto_126821 ) ) ( not ( = ?auto_126817 ?auto_126818 ) ) ( not ( = ?auto_126817 ?auto_126819 ) ) ( not ( = ?auto_126817 ?auto_126820 ) ) ( not ( = ?auto_126817 ?auto_126821 ) ) ( not ( = ?auto_126818 ?auto_126819 ) ) ( not ( = ?auto_126818 ?auto_126820 ) ) ( not ( = ?auto_126818 ?auto_126821 ) ) ( not ( = ?auto_126819 ?auto_126820 ) ) ( not ( = ?auto_126819 ?auto_126821 ) ) ( not ( = ?auto_126820 ?auto_126821 ) ) ( ON ?auto_126821 ?auto_126822 ) ( not ( = ?auto_126816 ?auto_126822 ) ) ( not ( = ?auto_126817 ?auto_126822 ) ) ( not ( = ?auto_126818 ?auto_126822 ) ) ( not ( = ?auto_126819 ?auto_126822 ) ) ( not ( = ?auto_126820 ?auto_126822 ) ) ( not ( = ?auto_126821 ?auto_126822 ) ) ( ON ?auto_126820 ?auto_126821 ) ( ON-TABLE ?auto_126822 ) ( ON ?auto_126819 ?auto_126820 ) ( ON ?auto_126816 ?auto_126823 ) ( not ( = ?auto_126816 ?auto_126823 ) ) ( not ( = ?auto_126817 ?auto_126823 ) ) ( not ( = ?auto_126818 ?auto_126823 ) ) ( not ( = ?auto_126819 ?auto_126823 ) ) ( not ( = ?auto_126820 ?auto_126823 ) ) ( not ( = ?auto_126821 ?auto_126823 ) ) ( not ( = ?auto_126822 ?auto_126823 ) ) ( ON ?auto_126817 ?auto_126816 ) ( CLEAR ?auto_126817 ) ( ON-TABLE ?auto_126823 ) ( HOLDING ?auto_126818 ) ( CLEAR ?auto_126819 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126822 ?auto_126821 ?auto_126820 ?auto_126819 ?auto_126818 )
      ( MAKE-6PILE ?auto_126816 ?auto_126817 ?auto_126818 ?auto_126819 ?auto_126820 ?auto_126821 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126824 - BLOCK
      ?auto_126825 - BLOCK
      ?auto_126826 - BLOCK
      ?auto_126827 - BLOCK
      ?auto_126828 - BLOCK
      ?auto_126829 - BLOCK
    )
    :vars
    (
      ?auto_126830 - BLOCK
      ?auto_126831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126824 ?auto_126825 ) ) ( not ( = ?auto_126824 ?auto_126826 ) ) ( not ( = ?auto_126824 ?auto_126827 ) ) ( not ( = ?auto_126824 ?auto_126828 ) ) ( not ( = ?auto_126824 ?auto_126829 ) ) ( not ( = ?auto_126825 ?auto_126826 ) ) ( not ( = ?auto_126825 ?auto_126827 ) ) ( not ( = ?auto_126825 ?auto_126828 ) ) ( not ( = ?auto_126825 ?auto_126829 ) ) ( not ( = ?auto_126826 ?auto_126827 ) ) ( not ( = ?auto_126826 ?auto_126828 ) ) ( not ( = ?auto_126826 ?auto_126829 ) ) ( not ( = ?auto_126827 ?auto_126828 ) ) ( not ( = ?auto_126827 ?auto_126829 ) ) ( not ( = ?auto_126828 ?auto_126829 ) ) ( ON ?auto_126829 ?auto_126830 ) ( not ( = ?auto_126824 ?auto_126830 ) ) ( not ( = ?auto_126825 ?auto_126830 ) ) ( not ( = ?auto_126826 ?auto_126830 ) ) ( not ( = ?auto_126827 ?auto_126830 ) ) ( not ( = ?auto_126828 ?auto_126830 ) ) ( not ( = ?auto_126829 ?auto_126830 ) ) ( ON ?auto_126828 ?auto_126829 ) ( ON-TABLE ?auto_126830 ) ( ON ?auto_126827 ?auto_126828 ) ( ON ?auto_126824 ?auto_126831 ) ( not ( = ?auto_126824 ?auto_126831 ) ) ( not ( = ?auto_126825 ?auto_126831 ) ) ( not ( = ?auto_126826 ?auto_126831 ) ) ( not ( = ?auto_126827 ?auto_126831 ) ) ( not ( = ?auto_126828 ?auto_126831 ) ) ( not ( = ?auto_126829 ?auto_126831 ) ) ( not ( = ?auto_126830 ?auto_126831 ) ) ( ON ?auto_126825 ?auto_126824 ) ( ON-TABLE ?auto_126831 ) ( CLEAR ?auto_126827 ) ( ON ?auto_126826 ?auto_126825 ) ( CLEAR ?auto_126826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126831 ?auto_126824 ?auto_126825 )
      ( MAKE-6PILE ?auto_126824 ?auto_126825 ?auto_126826 ?auto_126827 ?auto_126828 ?auto_126829 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126832 - BLOCK
      ?auto_126833 - BLOCK
      ?auto_126834 - BLOCK
      ?auto_126835 - BLOCK
      ?auto_126836 - BLOCK
      ?auto_126837 - BLOCK
    )
    :vars
    (
      ?auto_126838 - BLOCK
      ?auto_126839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126832 ?auto_126833 ) ) ( not ( = ?auto_126832 ?auto_126834 ) ) ( not ( = ?auto_126832 ?auto_126835 ) ) ( not ( = ?auto_126832 ?auto_126836 ) ) ( not ( = ?auto_126832 ?auto_126837 ) ) ( not ( = ?auto_126833 ?auto_126834 ) ) ( not ( = ?auto_126833 ?auto_126835 ) ) ( not ( = ?auto_126833 ?auto_126836 ) ) ( not ( = ?auto_126833 ?auto_126837 ) ) ( not ( = ?auto_126834 ?auto_126835 ) ) ( not ( = ?auto_126834 ?auto_126836 ) ) ( not ( = ?auto_126834 ?auto_126837 ) ) ( not ( = ?auto_126835 ?auto_126836 ) ) ( not ( = ?auto_126835 ?auto_126837 ) ) ( not ( = ?auto_126836 ?auto_126837 ) ) ( ON ?auto_126837 ?auto_126838 ) ( not ( = ?auto_126832 ?auto_126838 ) ) ( not ( = ?auto_126833 ?auto_126838 ) ) ( not ( = ?auto_126834 ?auto_126838 ) ) ( not ( = ?auto_126835 ?auto_126838 ) ) ( not ( = ?auto_126836 ?auto_126838 ) ) ( not ( = ?auto_126837 ?auto_126838 ) ) ( ON ?auto_126836 ?auto_126837 ) ( ON-TABLE ?auto_126838 ) ( ON ?auto_126832 ?auto_126839 ) ( not ( = ?auto_126832 ?auto_126839 ) ) ( not ( = ?auto_126833 ?auto_126839 ) ) ( not ( = ?auto_126834 ?auto_126839 ) ) ( not ( = ?auto_126835 ?auto_126839 ) ) ( not ( = ?auto_126836 ?auto_126839 ) ) ( not ( = ?auto_126837 ?auto_126839 ) ) ( not ( = ?auto_126838 ?auto_126839 ) ) ( ON ?auto_126833 ?auto_126832 ) ( ON-TABLE ?auto_126839 ) ( ON ?auto_126834 ?auto_126833 ) ( CLEAR ?auto_126834 ) ( HOLDING ?auto_126835 ) ( CLEAR ?auto_126836 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126838 ?auto_126837 ?auto_126836 ?auto_126835 )
      ( MAKE-6PILE ?auto_126832 ?auto_126833 ?auto_126834 ?auto_126835 ?auto_126836 ?auto_126837 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126840 - BLOCK
      ?auto_126841 - BLOCK
      ?auto_126842 - BLOCK
      ?auto_126843 - BLOCK
      ?auto_126844 - BLOCK
      ?auto_126845 - BLOCK
    )
    :vars
    (
      ?auto_126847 - BLOCK
      ?auto_126846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126840 ?auto_126841 ) ) ( not ( = ?auto_126840 ?auto_126842 ) ) ( not ( = ?auto_126840 ?auto_126843 ) ) ( not ( = ?auto_126840 ?auto_126844 ) ) ( not ( = ?auto_126840 ?auto_126845 ) ) ( not ( = ?auto_126841 ?auto_126842 ) ) ( not ( = ?auto_126841 ?auto_126843 ) ) ( not ( = ?auto_126841 ?auto_126844 ) ) ( not ( = ?auto_126841 ?auto_126845 ) ) ( not ( = ?auto_126842 ?auto_126843 ) ) ( not ( = ?auto_126842 ?auto_126844 ) ) ( not ( = ?auto_126842 ?auto_126845 ) ) ( not ( = ?auto_126843 ?auto_126844 ) ) ( not ( = ?auto_126843 ?auto_126845 ) ) ( not ( = ?auto_126844 ?auto_126845 ) ) ( ON ?auto_126845 ?auto_126847 ) ( not ( = ?auto_126840 ?auto_126847 ) ) ( not ( = ?auto_126841 ?auto_126847 ) ) ( not ( = ?auto_126842 ?auto_126847 ) ) ( not ( = ?auto_126843 ?auto_126847 ) ) ( not ( = ?auto_126844 ?auto_126847 ) ) ( not ( = ?auto_126845 ?auto_126847 ) ) ( ON ?auto_126844 ?auto_126845 ) ( ON-TABLE ?auto_126847 ) ( ON ?auto_126840 ?auto_126846 ) ( not ( = ?auto_126840 ?auto_126846 ) ) ( not ( = ?auto_126841 ?auto_126846 ) ) ( not ( = ?auto_126842 ?auto_126846 ) ) ( not ( = ?auto_126843 ?auto_126846 ) ) ( not ( = ?auto_126844 ?auto_126846 ) ) ( not ( = ?auto_126845 ?auto_126846 ) ) ( not ( = ?auto_126847 ?auto_126846 ) ) ( ON ?auto_126841 ?auto_126840 ) ( ON-TABLE ?auto_126846 ) ( ON ?auto_126842 ?auto_126841 ) ( CLEAR ?auto_126844 ) ( ON ?auto_126843 ?auto_126842 ) ( CLEAR ?auto_126843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126846 ?auto_126840 ?auto_126841 ?auto_126842 )
      ( MAKE-6PILE ?auto_126840 ?auto_126841 ?auto_126842 ?auto_126843 ?auto_126844 ?auto_126845 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126848 - BLOCK
      ?auto_126849 - BLOCK
      ?auto_126850 - BLOCK
      ?auto_126851 - BLOCK
      ?auto_126852 - BLOCK
      ?auto_126853 - BLOCK
    )
    :vars
    (
      ?auto_126855 - BLOCK
      ?auto_126854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126848 ?auto_126849 ) ) ( not ( = ?auto_126848 ?auto_126850 ) ) ( not ( = ?auto_126848 ?auto_126851 ) ) ( not ( = ?auto_126848 ?auto_126852 ) ) ( not ( = ?auto_126848 ?auto_126853 ) ) ( not ( = ?auto_126849 ?auto_126850 ) ) ( not ( = ?auto_126849 ?auto_126851 ) ) ( not ( = ?auto_126849 ?auto_126852 ) ) ( not ( = ?auto_126849 ?auto_126853 ) ) ( not ( = ?auto_126850 ?auto_126851 ) ) ( not ( = ?auto_126850 ?auto_126852 ) ) ( not ( = ?auto_126850 ?auto_126853 ) ) ( not ( = ?auto_126851 ?auto_126852 ) ) ( not ( = ?auto_126851 ?auto_126853 ) ) ( not ( = ?auto_126852 ?auto_126853 ) ) ( ON ?auto_126853 ?auto_126855 ) ( not ( = ?auto_126848 ?auto_126855 ) ) ( not ( = ?auto_126849 ?auto_126855 ) ) ( not ( = ?auto_126850 ?auto_126855 ) ) ( not ( = ?auto_126851 ?auto_126855 ) ) ( not ( = ?auto_126852 ?auto_126855 ) ) ( not ( = ?auto_126853 ?auto_126855 ) ) ( ON-TABLE ?auto_126855 ) ( ON ?auto_126848 ?auto_126854 ) ( not ( = ?auto_126848 ?auto_126854 ) ) ( not ( = ?auto_126849 ?auto_126854 ) ) ( not ( = ?auto_126850 ?auto_126854 ) ) ( not ( = ?auto_126851 ?auto_126854 ) ) ( not ( = ?auto_126852 ?auto_126854 ) ) ( not ( = ?auto_126853 ?auto_126854 ) ) ( not ( = ?auto_126855 ?auto_126854 ) ) ( ON ?auto_126849 ?auto_126848 ) ( ON-TABLE ?auto_126854 ) ( ON ?auto_126850 ?auto_126849 ) ( ON ?auto_126851 ?auto_126850 ) ( CLEAR ?auto_126851 ) ( HOLDING ?auto_126852 ) ( CLEAR ?auto_126853 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126855 ?auto_126853 ?auto_126852 )
      ( MAKE-6PILE ?auto_126848 ?auto_126849 ?auto_126850 ?auto_126851 ?auto_126852 ?auto_126853 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126856 - BLOCK
      ?auto_126857 - BLOCK
      ?auto_126858 - BLOCK
      ?auto_126859 - BLOCK
      ?auto_126860 - BLOCK
      ?auto_126861 - BLOCK
    )
    :vars
    (
      ?auto_126863 - BLOCK
      ?auto_126862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126856 ?auto_126857 ) ) ( not ( = ?auto_126856 ?auto_126858 ) ) ( not ( = ?auto_126856 ?auto_126859 ) ) ( not ( = ?auto_126856 ?auto_126860 ) ) ( not ( = ?auto_126856 ?auto_126861 ) ) ( not ( = ?auto_126857 ?auto_126858 ) ) ( not ( = ?auto_126857 ?auto_126859 ) ) ( not ( = ?auto_126857 ?auto_126860 ) ) ( not ( = ?auto_126857 ?auto_126861 ) ) ( not ( = ?auto_126858 ?auto_126859 ) ) ( not ( = ?auto_126858 ?auto_126860 ) ) ( not ( = ?auto_126858 ?auto_126861 ) ) ( not ( = ?auto_126859 ?auto_126860 ) ) ( not ( = ?auto_126859 ?auto_126861 ) ) ( not ( = ?auto_126860 ?auto_126861 ) ) ( ON ?auto_126861 ?auto_126863 ) ( not ( = ?auto_126856 ?auto_126863 ) ) ( not ( = ?auto_126857 ?auto_126863 ) ) ( not ( = ?auto_126858 ?auto_126863 ) ) ( not ( = ?auto_126859 ?auto_126863 ) ) ( not ( = ?auto_126860 ?auto_126863 ) ) ( not ( = ?auto_126861 ?auto_126863 ) ) ( ON-TABLE ?auto_126863 ) ( ON ?auto_126856 ?auto_126862 ) ( not ( = ?auto_126856 ?auto_126862 ) ) ( not ( = ?auto_126857 ?auto_126862 ) ) ( not ( = ?auto_126858 ?auto_126862 ) ) ( not ( = ?auto_126859 ?auto_126862 ) ) ( not ( = ?auto_126860 ?auto_126862 ) ) ( not ( = ?auto_126861 ?auto_126862 ) ) ( not ( = ?auto_126863 ?auto_126862 ) ) ( ON ?auto_126857 ?auto_126856 ) ( ON-TABLE ?auto_126862 ) ( ON ?auto_126858 ?auto_126857 ) ( ON ?auto_126859 ?auto_126858 ) ( CLEAR ?auto_126861 ) ( ON ?auto_126860 ?auto_126859 ) ( CLEAR ?auto_126860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126862 ?auto_126856 ?auto_126857 ?auto_126858 ?auto_126859 )
      ( MAKE-6PILE ?auto_126856 ?auto_126857 ?auto_126858 ?auto_126859 ?auto_126860 ?auto_126861 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126864 - BLOCK
      ?auto_126865 - BLOCK
      ?auto_126866 - BLOCK
      ?auto_126867 - BLOCK
      ?auto_126868 - BLOCK
      ?auto_126869 - BLOCK
    )
    :vars
    (
      ?auto_126870 - BLOCK
      ?auto_126871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126864 ?auto_126865 ) ) ( not ( = ?auto_126864 ?auto_126866 ) ) ( not ( = ?auto_126864 ?auto_126867 ) ) ( not ( = ?auto_126864 ?auto_126868 ) ) ( not ( = ?auto_126864 ?auto_126869 ) ) ( not ( = ?auto_126865 ?auto_126866 ) ) ( not ( = ?auto_126865 ?auto_126867 ) ) ( not ( = ?auto_126865 ?auto_126868 ) ) ( not ( = ?auto_126865 ?auto_126869 ) ) ( not ( = ?auto_126866 ?auto_126867 ) ) ( not ( = ?auto_126866 ?auto_126868 ) ) ( not ( = ?auto_126866 ?auto_126869 ) ) ( not ( = ?auto_126867 ?auto_126868 ) ) ( not ( = ?auto_126867 ?auto_126869 ) ) ( not ( = ?auto_126868 ?auto_126869 ) ) ( not ( = ?auto_126864 ?auto_126870 ) ) ( not ( = ?auto_126865 ?auto_126870 ) ) ( not ( = ?auto_126866 ?auto_126870 ) ) ( not ( = ?auto_126867 ?auto_126870 ) ) ( not ( = ?auto_126868 ?auto_126870 ) ) ( not ( = ?auto_126869 ?auto_126870 ) ) ( ON-TABLE ?auto_126870 ) ( ON ?auto_126864 ?auto_126871 ) ( not ( = ?auto_126864 ?auto_126871 ) ) ( not ( = ?auto_126865 ?auto_126871 ) ) ( not ( = ?auto_126866 ?auto_126871 ) ) ( not ( = ?auto_126867 ?auto_126871 ) ) ( not ( = ?auto_126868 ?auto_126871 ) ) ( not ( = ?auto_126869 ?auto_126871 ) ) ( not ( = ?auto_126870 ?auto_126871 ) ) ( ON ?auto_126865 ?auto_126864 ) ( ON-TABLE ?auto_126871 ) ( ON ?auto_126866 ?auto_126865 ) ( ON ?auto_126867 ?auto_126866 ) ( ON ?auto_126868 ?auto_126867 ) ( CLEAR ?auto_126868 ) ( HOLDING ?auto_126869 ) ( CLEAR ?auto_126870 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126870 ?auto_126869 )
      ( MAKE-6PILE ?auto_126864 ?auto_126865 ?auto_126866 ?auto_126867 ?auto_126868 ?auto_126869 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126872 - BLOCK
      ?auto_126873 - BLOCK
      ?auto_126874 - BLOCK
      ?auto_126875 - BLOCK
      ?auto_126876 - BLOCK
      ?auto_126877 - BLOCK
    )
    :vars
    (
      ?auto_126878 - BLOCK
      ?auto_126879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126872 ?auto_126873 ) ) ( not ( = ?auto_126872 ?auto_126874 ) ) ( not ( = ?auto_126872 ?auto_126875 ) ) ( not ( = ?auto_126872 ?auto_126876 ) ) ( not ( = ?auto_126872 ?auto_126877 ) ) ( not ( = ?auto_126873 ?auto_126874 ) ) ( not ( = ?auto_126873 ?auto_126875 ) ) ( not ( = ?auto_126873 ?auto_126876 ) ) ( not ( = ?auto_126873 ?auto_126877 ) ) ( not ( = ?auto_126874 ?auto_126875 ) ) ( not ( = ?auto_126874 ?auto_126876 ) ) ( not ( = ?auto_126874 ?auto_126877 ) ) ( not ( = ?auto_126875 ?auto_126876 ) ) ( not ( = ?auto_126875 ?auto_126877 ) ) ( not ( = ?auto_126876 ?auto_126877 ) ) ( not ( = ?auto_126872 ?auto_126878 ) ) ( not ( = ?auto_126873 ?auto_126878 ) ) ( not ( = ?auto_126874 ?auto_126878 ) ) ( not ( = ?auto_126875 ?auto_126878 ) ) ( not ( = ?auto_126876 ?auto_126878 ) ) ( not ( = ?auto_126877 ?auto_126878 ) ) ( ON-TABLE ?auto_126878 ) ( ON ?auto_126872 ?auto_126879 ) ( not ( = ?auto_126872 ?auto_126879 ) ) ( not ( = ?auto_126873 ?auto_126879 ) ) ( not ( = ?auto_126874 ?auto_126879 ) ) ( not ( = ?auto_126875 ?auto_126879 ) ) ( not ( = ?auto_126876 ?auto_126879 ) ) ( not ( = ?auto_126877 ?auto_126879 ) ) ( not ( = ?auto_126878 ?auto_126879 ) ) ( ON ?auto_126873 ?auto_126872 ) ( ON-TABLE ?auto_126879 ) ( ON ?auto_126874 ?auto_126873 ) ( ON ?auto_126875 ?auto_126874 ) ( ON ?auto_126876 ?auto_126875 ) ( CLEAR ?auto_126878 ) ( ON ?auto_126877 ?auto_126876 ) ( CLEAR ?auto_126877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126879 ?auto_126872 ?auto_126873 ?auto_126874 ?auto_126875 ?auto_126876 )
      ( MAKE-6PILE ?auto_126872 ?auto_126873 ?auto_126874 ?auto_126875 ?auto_126876 ?auto_126877 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126880 - BLOCK
      ?auto_126881 - BLOCK
      ?auto_126882 - BLOCK
      ?auto_126883 - BLOCK
      ?auto_126884 - BLOCK
      ?auto_126885 - BLOCK
    )
    :vars
    (
      ?auto_126886 - BLOCK
      ?auto_126887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126880 ?auto_126881 ) ) ( not ( = ?auto_126880 ?auto_126882 ) ) ( not ( = ?auto_126880 ?auto_126883 ) ) ( not ( = ?auto_126880 ?auto_126884 ) ) ( not ( = ?auto_126880 ?auto_126885 ) ) ( not ( = ?auto_126881 ?auto_126882 ) ) ( not ( = ?auto_126881 ?auto_126883 ) ) ( not ( = ?auto_126881 ?auto_126884 ) ) ( not ( = ?auto_126881 ?auto_126885 ) ) ( not ( = ?auto_126882 ?auto_126883 ) ) ( not ( = ?auto_126882 ?auto_126884 ) ) ( not ( = ?auto_126882 ?auto_126885 ) ) ( not ( = ?auto_126883 ?auto_126884 ) ) ( not ( = ?auto_126883 ?auto_126885 ) ) ( not ( = ?auto_126884 ?auto_126885 ) ) ( not ( = ?auto_126880 ?auto_126886 ) ) ( not ( = ?auto_126881 ?auto_126886 ) ) ( not ( = ?auto_126882 ?auto_126886 ) ) ( not ( = ?auto_126883 ?auto_126886 ) ) ( not ( = ?auto_126884 ?auto_126886 ) ) ( not ( = ?auto_126885 ?auto_126886 ) ) ( ON ?auto_126880 ?auto_126887 ) ( not ( = ?auto_126880 ?auto_126887 ) ) ( not ( = ?auto_126881 ?auto_126887 ) ) ( not ( = ?auto_126882 ?auto_126887 ) ) ( not ( = ?auto_126883 ?auto_126887 ) ) ( not ( = ?auto_126884 ?auto_126887 ) ) ( not ( = ?auto_126885 ?auto_126887 ) ) ( not ( = ?auto_126886 ?auto_126887 ) ) ( ON ?auto_126881 ?auto_126880 ) ( ON-TABLE ?auto_126887 ) ( ON ?auto_126882 ?auto_126881 ) ( ON ?auto_126883 ?auto_126882 ) ( ON ?auto_126884 ?auto_126883 ) ( ON ?auto_126885 ?auto_126884 ) ( CLEAR ?auto_126885 ) ( HOLDING ?auto_126886 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126886 )
      ( MAKE-6PILE ?auto_126880 ?auto_126881 ?auto_126882 ?auto_126883 ?auto_126884 ?auto_126885 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_126888 - BLOCK
      ?auto_126889 - BLOCK
      ?auto_126890 - BLOCK
      ?auto_126891 - BLOCK
      ?auto_126892 - BLOCK
      ?auto_126893 - BLOCK
    )
    :vars
    (
      ?auto_126894 - BLOCK
      ?auto_126895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126888 ?auto_126889 ) ) ( not ( = ?auto_126888 ?auto_126890 ) ) ( not ( = ?auto_126888 ?auto_126891 ) ) ( not ( = ?auto_126888 ?auto_126892 ) ) ( not ( = ?auto_126888 ?auto_126893 ) ) ( not ( = ?auto_126889 ?auto_126890 ) ) ( not ( = ?auto_126889 ?auto_126891 ) ) ( not ( = ?auto_126889 ?auto_126892 ) ) ( not ( = ?auto_126889 ?auto_126893 ) ) ( not ( = ?auto_126890 ?auto_126891 ) ) ( not ( = ?auto_126890 ?auto_126892 ) ) ( not ( = ?auto_126890 ?auto_126893 ) ) ( not ( = ?auto_126891 ?auto_126892 ) ) ( not ( = ?auto_126891 ?auto_126893 ) ) ( not ( = ?auto_126892 ?auto_126893 ) ) ( not ( = ?auto_126888 ?auto_126894 ) ) ( not ( = ?auto_126889 ?auto_126894 ) ) ( not ( = ?auto_126890 ?auto_126894 ) ) ( not ( = ?auto_126891 ?auto_126894 ) ) ( not ( = ?auto_126892 ?auto_126894 ) ) ( not ( = ?auto_126893 ?auto_126894 ) ) ( ON ?auto_126888 ?auto_126895 ) ( not ( = ?auto_126888 ?auto_126895 ) ) ( not ( = ?auto_126889 ?auto_126895 ) ) ( not ( = ?auto_126890 ?auto_126895 ) ) ( not ( = ?auto_126891 ?auto_126895 ) ) ( not ( = ?auto_126892 ?auto_126895 ) ) ( not ( = ?auto_126893 ?auto_126895 ) ) ( not ( = ?auto_126894 ?auto_126895 ) ) ( ON ?auto_126889 ?auto_126888 ) ( ON-TABLE ?auto_126895 ) ( ON ?auto_126890 ?auto_126889 ) ( ON ?auto_126891 ?auto_126890 ) ( ON ?auto_126892 ?auto_126891 ) ( ON ?auto_126893 ?auto_126892 ) ( ON ?auto_126894 ?auto_126893 ) ( CLEAR ?auto_126894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_126895 ?auto_126888 ?auto_126889 ?auto_126890 ?auto_126891 ?auto_126892 ?auto_126893 )
      ( MAKE-6PILE ?auto_126888 ?auto_126889 ?auto_126890 ?auto_126891 ?auto_126892 ?auto_126893 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126903 - BLOCK
      ?auto_126904 - BLOCK
      ?auto_126905 - BLOCK
      ?auto_126906 - BLOCK
      ?auto_126907 - BLOCK
      ?auto_126908 - BLOCK
      ?auto_126909 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_126909 ) ( CLEAR ?auto_126908 ) ( ON-TABLE ?auto_126903 ) ( ON ?auto_126904 ?auto_126903 ) ( ON ?auto_126905 ?auto_126904 ) ( ON ?auto_126906 ?auto_126905 ) ( ON ?auto_126907 ?auto_126906 ) ( ON ?auto_126908 ?auto_126907 ) ( not ( = ?auto_126903 ?auto_126904 ) ) ( not ( = ?auto_126903 ?auto_126905 ) ) ( not ( = ?auto_126903 ?auto_126906 ) ) ( not ( = ?auto_126903 ?auto_126907 ) ) ( not ( = ?auto_126903 ?auto_126908 ) ) ( not ( = ?auto_126903 ?auto_126909 ) ) ( not ( = ?auto_126904 ?auto_126905 ) ) ( not ( = ?auto_126904 ?auto_126906 ) ) ( not ( = ?auto_126904 ?auto_126907 ) ) ( not ( = ?auto_126904 ?auto_126908 ) ) ( not ( = ?auto_126904 ?auto_126909 ) ) ( not ( = ?auto_126905 ?auto_126906 ) ) ( not ( = ?auto_126905 ?auto_126907 ) ) ( not ( = ?auto_126905 ?auto_126908 ) ) ( not ( = ?auto_126905 ?auto_126909 ) ) ( not ( = ?auto_126906 ?auto_126907 ) ) ( not ( = ?auto_126906 ?auto_126908 ) ) ( not ( = ?auto_126906 ?auto_126909 ) ) ( not ( = ?auto_126907 ?auto_126908 ) ) ( not ( = ?auto_126907 ?auto_126909 ) ) ( not ( = ?auto_126908 ?auto_126909 ) ) )
    :subtasks
    ( ( !STACK ?auto_126909 ?auto_126908 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126910 - BLOCK
      ?auto_126911 - BLOCK
      ?auto_126912 - BLOCK
      ?auto_126913 - BLOCK
      ?auto_126914 - BLOCK
      ?auto_126915 - BLOCK
      ?auto_126916 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_126915 ) ( ON-TABLE ?auto_126910 ) ( ON ?auto_126911 ?auto_126910 ) ( ON ?auto_126912 ?auto_126911 ) ( ON ?auto_126913 ?auto_126912 ) ( ON ?auto_126914 ?auto_126913 ) ( ON ?auto_126915 ?auto_126914 ) ( not ( = ?auto_126910 ?auto_126911 ) ) ( not ( = ?auto_126910 ?auto_126912 ) ) ( not ( = ?auto_126910 ?auto_126913 ) ) ( not ( = ?auto_126910 ?auto_126914 ) ) ( not ( = ?auto_126910 ?auto_126915 ) ) ( not ( = ?auto_126910 ?auto_126916 ) ) ( not ( = ?auto_126911 ?auto_126912 ) ) ( not ( = ?auto_126911 ?auto_126913 ) ) ( not ( = ?auto_126911 ?auto_126914 ) ) ( not ( = ?auto_126911 ?auto_126915 ) ) ( not ( = ?auto_126911 ?auto_126916 ) ) ( not ( = ?auto_126912 ?auto_126913 ) ) ( not ( = ?auto_126912 ?auto_126914 ) ) ( not ( = ?auto_126912 ?auto_126915 ) ) ( not ( = ?auto_126912 ?auto_126916 ) ) ( not ( = ?auto_126913 ?auto_126914 ) ) ( not ( = ?auto_126913 ?auto_126915 ) ) ( not ( = ?auto_126913 ?auto_126916 ) ) ( not ( = ?auto_126914 ?auto_126915 ) ) ( not ( = ?auto_126914 ?auto_126916 ) ) ( not ( = ?auto_126915 ?auto_126916 ) ) ( ON-TABLE ?auto_126916 ) ( CLEAR ?auto_126916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_126916 )
      ( MAKE-7PILE ?auto_126910 ?auto_126911 ?auto_126912 ?auto_126913 ?auto_126914 ?auto_126915 ?auto_126916 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126917 - BLOCK
      ?auto_126918 - BLOCK
      ?auto_126919 - BLOCK
      ?auto_126920 - BLOCK
      ?auto_126921 - BLOCK
      ?auto_126922 - BLOCK
      ?auto_126923 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126917 ) ( ON ?auto_126918 ?auto_126917 ) ( ON ?auto_126919 ?auto_126918 ) ( ON ?auto_126920 ?auto_126919 ) ( ON ?auto_126921 ?auto_126920 ) ( not ( = ?auto_126917 ?auto_126918 ) ) ( not ( = ?auto_126917 ?auto_126919 ) ) ( not ( = ?auto_126917 ?auto_126920 ) ) ( not ( = ?auto_126917 ?auto_126921 ) ) ( not ( = ?auto_126917 ?auto_126922 ) ) ( not ( = ?auto_126917 ?auto_126923 ) ) ( not ( = ?auto_126918 ?auto_126919 ) ) ( not ( = ?auto_126918 ?auto_126920 ) ) ( not ( = ?auto_126918 ?auto_126921 ) ) ( not ( = ?auto_126918 ?auto_126922 ) ) ( not ( = ?auto_126918 ?auto_126923 ) ) ( not ( = ?auto_126919 ?auto_126920 ) ) ( not ( = ?auto_126919 ?auto_126921 ) ) ( not ( = ?auto_126919 ?auto_126922 ) ) ( not ( = ?auto_126919 ?auto_126923 ) ) ( not ( = ?auto_126920 ?auto_126921 ) ) ( not ( = ?auto_126920 ?auto_126922 ) ) ( not ( = ?auto_126920 ?auto_126923 ) ) ( not ( = ?auto_126921 ?auto_126922 ) ) ( not ( = ?auto_126921 ?auto_126923 ) ) ( not ( = ?auto_126922 ?auto_126923 ) ) ( ON-TABLE ?auto_126923 ) ( CLEAR ?auto_126923 ) ( HOLDING ?auto_126922 ) ( CLEAR ?auto_126921 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_126917 ?auto_126918 ?auto_126919 ?auto_126920 ?auto_126921 ?auto_126922 )
      ( MAKE-7PILE ?auto_126917 ?auto_126918 ?auto_126919 ?auto_126920 ?auto_126921 ?auto_126922 ?auto_126923 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126924 - BLOCK
      ?auto_126925 - BLOCK
      ?auto_126926 - BLOCK
      ?auto_126927 - BLOCK
      ?auto_126928 - BLOCK
      ?auto_126929 - BLOCK
      ?auto_126930 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126924 ) ( ON ?auto_126925 ?auto_126924 ) ( ON ?auto_126926 ?auto_126925 ) ( ON ?auto_126927 ?auto_126926 ) ( ON ?auto_126928 ?auto_126927 ) ( not ( = ?auto_126924 ?auto_126925 ) ) ( not ( = ?auto_126924 ?auto_126926 ) ) ( not ( = ?auto_126924 ?auto_126927 ) ) ( not ( = ?auto_126924 ?auto_126928 ) ) ( not ( = ?auto_126924 ?auto_126929 ) ) ( not ( = ?auto_126924 ?auto_126930 ) ) ( not ( = ?auto_126925 ?auto_126926 ) ) ( not ( = ?auto_126925 ?auto_126927 ) ) ( not ( = ?auto_126925 ?auto_126928 ) ) ( not ( = ?auto_126925 ?auto_126929 ) ) ( not ( = ?auto_126925 ?auto_126930 ) ) ( not ( = ?auto_126926 ?auto_126927 ) ) ( not ( = ?auto_126926 ?auto_126928 ) ) ( not ( = ?auto_126926 ?auto_126929 ) ) ( not ( = ?auto_126926 ?auto_126930 ) ) ( not ( = ?auto_126927 ?auto_126928 ) ) ( not ( = ?auto_126927 ?auto_126929 ) ) ( not ( = ?auto_126927 ?auto_126930 ) ) ( not ( = ?auto_126928 ?auto_126929 ) ) ( not ( = ?auto_126928 ?auto_126930 ) ) ( not ( = ?auto_126929 ?auto_126930 ) ) ( ON-TABLE ?auto_126930 ) ( CLEAR ?auto_126928 ) ( ON ?auto_126929 ?auto_126930 ) ( CLEAR ?auto_126929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126930 )
      ( MAKE-7PILE ?auto_126924 ?auto_126925 ?auto_126926 ?auto_126927 ?auto_126928 ?auto_126929 ?auto_126930 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126931 - BLOCK
      ?auto_126932 - BLOCK
      ?auto_126933 - BLOCK
      ?auto_126934 - BLOCK
      ?auto_126935 - BLOCK
      ?auto_126936 - BLOCK
      ?auto_126937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126931 ) ( ON ?auto_126932 ?auto_126931 ) ( ON ?auto_126933 ?auto_126932 ) ( ON ?auto_126934 ?auto_126933 ) ( not ( = ?auto_126931 ?auto_126932 ) ) ( not ( = ?auto_126931 ?auto_126933 ) ) ( not ( = ?auto_126931 ?auto_126934 ) ) ( not ( = ?auto_126931 ?auto_126935 ) ) ( not ( = ?auto_126931 ?auto_126936 ) ) ( not ( = ?auto_126931 ?auto_126937 ) ) ( not ( = ?auto_126932 ?auto_126933 ) ) ( not ( = ?auto_126932 ?auto_126934 ) ) ( not ( = ?auto_126932 ?auto_126935 ) ) ( not ( = ?auto_126932 ?auto_126936 ) ) ( not ( = ?auto_126932 ?auto_126937 ) ) ( not ( = ?auto_126933 ?auto_126934 ) ) ( not ( = ?auto_126933 ?auto_126935 ) ) ( not ( = ?auto_126933 ?auto_126936 ) ) ( not ( = ?auto_126933 ?auto_126937 ) ) ( not ( = ?auto_126934 ?auto_126935 ) ) ( not ( = ?auto_126934 ?auto_126936 ) ) ( not ( = ?auto_126934 ?auto_126937 ) ) ( not ( = ?auto_126935 ?auto_126936 ) ) ( not ( = ?auto_126935 ?auto_126937 ) ) ( not ( = ?auto_126936 ?auto_126937 ) ) ( ON-TABLE ?auto_126937 ) ( ON ?auto_126936 ?auto_126937 ) ( CLEAR ?auto_126936 ) ( HOLDING ?auto_126935 ) ( CLEAR ?auto_126934 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126931 ?auto_126932 ?auto_126933 ?auto_126934 ?auto_126935 )
      ( MAKE-7PILE ?auto_126931 ?auto_126932 ?auto_126933 ?auto_126934 ?auto_126935 ?auto_126936 ?auto_126937 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126938 - BLOCK
      ?auto_126939 - BLOCK
      ?auto_126940 - BLOCK
      ?auto_126941 - BLOCK
      ?auto_126942 - BLOCK
      ?auto_126943 - BLOCK
      ?auto_126944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126938 ) ( ON ?auto_126939 ?auto_126938 ) ( ON ?auto_126940 ?auto_126939 ) ( ON ?auto_126941 ?auto_126940 ) ( not ( = ?auto_126938 ?auto_126939 ) ) ( not ( = ?auto_126938 ?auto_126940 ) ) ( not ( = ?auto_126938 ?auto_126941 ) ) ( not ( = ?auto_126938 ?auto_126942 ) ) ( not ( = ?auto_126938 ?auto_126943 ) ) ( not ( = ?auto_126938 ?auto_126944 ) ) ( not ( = ?auto_126939 ?auto_126940 ) ) ( not ( = ?auto_126939 ?auto_126941 ) ) ( not ( = ?auto_126939 ?auto_126942 ) ) ( not ( = ?auto_126939 ?auto_126943 ) ) ( not ( = ?auto_126939 ?auto_126944 ) ) ( not ( = ?auto_126940 ?auto_126941 ) ) ( not ( = ?auto_126940 ?auto_126942 ) ) ( not ( = ?auto_126940 ?auto_126943 ) ) ( not ( = ?auto_126940 ?auto_126944 ) ) ( not ( = ?auto_126941 ?auto_126942 ) ) ( not ( = ?auto_126941 ?auto_126943 ) ) ( not ( = ?auto_126941 ?auto_126944 ) ) ( not ( = ?auto_126942 ?auto_126943 ) ) ( not ( = ?auto_126942 ?auto_126944 ) ) ( not ( = ?auto_126943 ?auto_126944 ) ) ( ON-TABLE ?auto_126944 ) ( ON ?auto_126943 ?auto_126944 ) ( CLEAR ?auto_126941 ) ( ON ?auto_126942 ?auto_126943 ) ( CLEAR ?auto_126942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126944 ?auto_126943 )
      ( MAKE-7PILE ?auto_126938 ?auto_126939 ?auto_126940 ?auto_126941 ?auto_126942 ?auto_126943 ?auto_126944 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126945 - BLOCK
      ?auto_126946 - BLOCK
      ?auto_126947 - BLOCK
      ?auto_126948 - BLOCK
      ?auto_126949 - BLOCK
      ?auto_126950 - BLOCK
      ?auto_126951 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126945 ) ( ON ?auto_126946 ?auto_126945 ) ( ON ?auto_126947 ?auto_126946 ) ( not ( = ?auto_126945 ?auto_126946 ) ) ( not ( = ?auto_126945 ?auto_126947 ) ) ( not ( = ?auto_126945 ?auto_126948 ) ) ( not ( = ?auto_126945 ?auto_126949 ) ) ( not ( = ?auto_126945 ?auto_126950 ) ) ( not ( = ?auto_126945 ?auto_126951 ) ) ( not ( = ?auto_126946 ?auto_126947 ) ) ( not ( = ?auto_126946 ?auto_126948 ) ) ( not ( = ?auto_126946 ?auto_126949 ) ) ( not ( = ?auto_126946 ?auto_126950 ) ) ( not ( = ?auto_126946 ?auto_126951 ) ) ( not ( = ?auto_126947 ?auto_126948 ) ) ( not ( = ?auto_126947 ?auto_126949 ) ) ( not ( = ?auto_126947 ?auto_126950 ) ) ( not ( = ?auto_126947 ?auto_126951 ) ) ( not ( = ?auto_126948 ?auto_126949 ) ) ( not ( = ?auto_126948 ?auto_126950 ) ) ( not ( = ?auto_126948 ?auto_126951 ) ) ( not ( = ?auto_126949 ?auto_126950 ) ) ( not ( = ?auto_126949 ?auto_126951 ) ) ( not ( = ?auto_126950 ?auto_126951 ) ) ( ON-TABLE ?auto_126951 ) ( ON ?auto_126950 ?auto_126951 ) ( ON ?auto_126949 ?auto_126950 ) ( CLEAR ?auto_126949 ) ( HOLDING ?auto_126948 ) ( CLEAR ?auto_126947 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126945 ?auto_126946 ?auto_126947 ?auto_126948 )
      ( MAKE-7PILE ?auto_126945 ?auto_126946 ?auto_126947 ?auto_126948 ?auto_126949 ?auto_126950 ?auto_126951 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126952 - BLOCK
      ?auto_126953 - BLOCK
      ?auto_126954 - BLOCK
      ?auto_126955 - BLOCK
      ?auto_126956 - BLOCK
      ?auto_126957 - BLOCK
      ?auto_126958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126952 ) ( ON ?auto_126953 ?auto_126952 ) ( ON ?auto_126954 ?auto_126953 ) ( not ( = ?auto_126952 ?auto_126953 ) ) ( not ( = ?auto_126952 ?auto_126954 ) ) ( not ( = ?auto_126952 ?auto_126955 ) ) ( not ( = ?auto_126952 ?auto_126956 ) ) ( not ( = ?auto_126952 ?auto_126957 ) ) ( not ( = ?auto_126952 ?auto_126958 ) ) ( not ( = ?auto_126953 ?auto_126954 ) ) ( not ( = ?auto_126953 ?auto_126955 ) ) ( not ( = ?auto_126953 ?auto_126956 ) ) ( not ( = ?auto_126953 ?auto_126957 ) ) ( not ( = ?auto_126953 ?auto_126958 ) ) ( not ( = ?auto_126954 ?auto_126955 ) ) ( not ( = ?auto_126954 ?auto_126956 ) ) ( not ( = ?auto_126954 ?auto_126957 ) ) ( not ( = ?auto_126954 ?auto_126958 ) ) ( not ( = ?auto_126955 ?auto_126956 ) ) ( not ( = ?auto_126955 ?auto_126957 ) ) ( not ( = ?auto_126955 ?auto_126958 ) ) ( not ( = ?auto_126956 ?auto_126957 ) ) ( not ( = ?auto_126956 ?auto_126958 ) ) ( not ( = ?auto_126957 ?auto_126958 ) ) ( ON-TABLE ?auto_126958 ) ( ON ?auto_126957 ?auto_126958 ) ( ON ?auto_126956 ?auto_126957 ) ( CLEAR ?auto_126954 ) ( ON ?auto_126955 ?auto_126956 ) ( CLEAR ?auto_126955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126958 ?auto_126957 ?auto_126956 )
      ( MAKE-7PILE ?auto_126952 ?auto_126953 ?auto_126954 ?auto_126955 ?auto_126956 ?auto_126957 ?auto_126958 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126959 - BLOCK
      ?auto_126960 - BLOCK
      ?auto_126961 - BLOCK
      ?auto_126962 - BLOCK
      ?auto_126963 - BLOCK
      ?auto_126964 - BLOCK
      ?auto_126965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126959 ) ( ON ?auto_126960 ?auto_126959 ) ( not ( = ?auto_126959 ?auto_126960 ) ) ( not ( = ?auto_126959 ?auto_126961 ) ) ( not ( = ?auto_126959 ?auto_126962 ) ) ( not ( = ?auto_126959 ?auto_126963 ) ) ( not ( = ?auto_126959 ?auto_126964 ) ) ( not ( = ?auto_126959 ?auto_126965 ) ) ( not ( = ?auto_126960 ?auto_126961 ) ) ( not ( = ?auto_126960 ?auto_126962 ) ) ( not ( = ?auto_126960 ?auto_126963 ) ) ( not ( = ?auto_126960 ?auto_126964 ) ) ( not ( = ?auto_126960 ?auto_126965 ) ) ( not ( = ?auto_126961 ?auto_126962 ) ) ( not ( = ?auto_126961 ?auto_126963 ) ) ( not ( = ?auto_126961 ?auto_126964 ) ) ( not ( = ?auto_126961 ?auto_126965 ) ) ( not ( = ?auto_126962 ?auto_126963 ) ) ( not ( = ?auto_126962 ?auto_126964 ) ) ( not ( = ?auto_126962 ?auto_126965 ) ) ( not ( = ?auto_126963 ?auto_126964 ) ) ( not ( = ?auto_126963 ?auto_126965 ) ) ( not ( = ?auto_126964 ?auto_126965 ) ) ( ON-TABLE ?auto_126965 ) ( ON ?auto_126964 ?auto_126965 ) ( ON ?auto_126963 ?auto_126964 ) ( ON ?auto_126962 ?auto_126963 ) ( CLEAR ?auto_126962 ) ( HOLDING ?auto_126961 ) ( CLEAR ?auto_126960 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_126959 ?auto_126960 ?auto_126961 )
      ( MAKE-7PILE ?auto_126959 ?auto_126960 ?auto_126961 ?auto_126962 ?auto_126963 ?auto_126964 ?auto_126965 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126966 - BLOCK
      ?auto_126967 - BLOCK
      ?auto_126968 - BLOCK
      ?auto_126969 - BLOCK
      ?auto_126970 - BLOCK
      ?auto_126971 - BLOCK
      ?auto_126972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126966 ) ( ON ?auto_126967 ?auto_126966 ) ( not ( = ?auto_126966 ?auto_126967 ) ) ( not ( = ?auto_126966 ?auto_126968 ) ) ( not ( = ?auto_126966 ?auto_126969 ) ) ( not ( = ?auto_126966 ?auto_126970 ) ) ( not ( = ?auto_126966 ?auto_126971 ) ) ( not ( = ?auto_126966 ?auto_126972 ) ) ( not ( = ?auto_126967 ?auto_126968 ) ) ( not ( = ?auto_126967 ?auto_126969 ) ) ( not ( = ?auto_126967 ?auto_126970 ) ) ( not ( = ?auto_126967 ?auto_126971 ) ) ( not ( = ?auto_126967 ?auto_126972 ) ) ( not ( = ?auto_126968 ?auto_126969 ) ) ( not ( = ?auto_126968 ?auto_126970 ) ) ( not ( = ?auto_126968 ?auto_126971 ) ) ( not ( = ?auto_126968 ?auto_126972 ) ) ( not ( = ?auto_126969 ?auto_126970 ) ) ( not ( = ?auto_126969 ?auto_126971 ) ) ( not ( = ?auto_126969 ?auto_126972 ) ) ( not ( = ?auto_126970 ?auto_126971 ) ) ( not ( = ?auto_126970 ?auto_126972 ) ) ( not ( = ?auto_126971 ?auto_126972 ) ) ( ON-TABLE ?auto_126972 ) ( ON ?auto_126971 ?auto_126972 ) ( ON ?auto_126970 ?auto_126971 ) ( ON ?auto_126969 ?auto_126970 ) ( CLEAR ?auto_126967 ) ( ON ?auto_126968 ?auto_126969 ) ( CLEAR ?auto_126968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_126972 ?auto_126971 ?auto_126970 ?auto_126969 )
      ( MAKE-7PILE ?auto_126966 ?auto_126967 ?auto_126968 ?auto_126969 ?auto_126970 ?auto_126971 ?auto_126972 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126973 - BLOCK
      ?auto_126974 - BLOCK
      ?auto_126975 - BLOCK
      ?auto_126976 - BLOCK
      ?auto_126977 - BLOCK
      ?auto_126978 - BLOCK
      ?auto_126979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126973 ) ( not ( = ?auto_126973 ?auto_126974 ) ) ( not ( = ?auto_126973 ?auto_126975 ) ) ( not ( = ?auto_126973 ?auto_126976 ) ) ( not ( = ?auto_126973 ?auto_126977 ) ) ( not ( = ?auto_126973 ?auto_126978 ) ) ( not ( = ?auto_126973 ?auto_126979 ) ) ( not ( = ?auto_126974 ?auto_126975 ) ) ( not ( = ?auto_126974 ?auto_126976 ) ) ( not ( = ?auto_126974 ?auto_126977 ) ) ( not ( = ?auto_126974 ?auto_126978 ) ) ( not ( = ?auto_126974 ?auto_126979 ) ) ( not ( = ?auto_126975 ?auto_126976 ) ) ( not ( = ?auto_126975 ?auto_126977 ) ) ( not ( = ?auto_126975 ?auto_126978 ) ) ( not ( = ?auto_126975 ?auto_126979 ) ) ( not ( = ?auto_126976 ?auto_126977 ) ) ( not ( = ?auto_126976 ?auto_126978 ) ) ( not ( = ?auto_126976 ?auto_126979 ) ) ( not ( = ?auto_126977 ?auto_126978 ) ) ( not ( = ?auto_126977 ?auto_126979 ) ) ( not ( = ?auto_126978 ?auto_126979 ) ) ( ON-TABLE ?auto_126979 ) ( ON ?auto_126978 ?auto_126979 ) ( ON ?auto_126977 ?auto_126978 ) ( ON ?auto_126976 ?auto_126977 ) ( ON ?auto_126975 ?auto_126976 ) ( CLEAR ?auto_126975 ) ( HOLDING ?auto_126974 ) ( CLEAR ?auto_126973 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_126973 ?auto_126974 )
      ( MAKE-7PILE ?auto_126973 ?auto_126974 ?auto_126975 ?auto_126976 ?auto_126977 ?auto_126978 ?auto_126979 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126980 - BLOCK
      ?auto_126981 - BLOCK
      ?auto_126982 - BLOCK
      ?auto_126983 - BLOCK
      ?auto_126984 - BLOCK
      ?auto_126985 - BLOCK
      ?auto_126986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_126980 ) ( not ( = ?auto_126980 ?auto_126981 ) ) ( not ( = ?auto_126980 ?auto_126982 ) ) ( not ( = ?auto_126980 ?auto_126983 ) ) ( not ( = ?auto_126980 ?auto_126984 ) ) ( not ( = ?auto_126980 ?auto_126985 ) ) ( not ( = ?auto_126980 ?auto_126986 ) ) ( not ( = ?auto_126981 ?auto_126982 ) ) ( not ( = ?auto_126981 ?auto_126983 ) ) ( not ( = ?auto_126981 ?auto_126984 ) ) ( not ( = ?auto_126981 ?auto_126985 ) ) ( not ( = ?auto_126981 ?auto_126986 ) ) ( not ( = ?auto_126982 ?auto_126983 ) ) ( not ( = ?auto_126982 ?auto_126984 ) ) ( not ( = ?auto_126982 ?auto_126985 ) ) ( not ( = ?auto_126982 ?auto_126986 ) ) ( not ( = ?auto_126983 ?auto_126984 ) ) ( not ( = ?auto_126983 ?auto_126985 ) ) ( not ( = ?auto_126983 ?auto_126986 ) ) ( not ( = ?auto_126984 ?auto_126985 ) ) ( not ( = ?auto_126984 ?auto_126986 ) ) ( not ( = ?auto_126985 ?auto_126986 ) ) ( ON-TABLE ?auto_126986 ) ( ON ?auto_126985 ?auto_126986 ) ( ON ?auto_126984 ?auto_126985 ) ( ON ?auto_126983 ?auto_126984 ) ( ON ?auto_126982 ?auto_126983 ) ( CLEAR ?auto_126980 ) ( ON ?auto_126981 ?auto_126982 ) ( CLEAR ?auto_126981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_126986 ?auto_126985 ?auto_126984 ?auto_126983 ?auto_126982 )
      ( MAKE-7PILE ?auto_126980 ?auto_126981 ?auto_126982 ?auto_126983 ?auto_126984 ?auto_126985 ?auto_126986 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126987 - BLOCK
      ?auto_126988 - BLOCK
      ?auto_126989 - BLOCK
      ?auto_126990 - BLOCK
      ?auto_126991 - BLOCK
      ?auto_126992 - BLOCK
      ?auto_126993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126987 ?auto_126988 ) ) ( not ( = ?auto_126987 ?auto_126989 ) ) ( not ( = ?auto_126987 ?auto_126990 ) ) ( not ( = ?auto_126987 ?auto_126991 ) ) ( not ( = ?auto_126987 ?auto_126992 ) ) ( not ( = ?auto_126987 ?auto_126993 ) ) ( not ( = ?auto_126988 ?auto_126989 ) ) ( not ( = ?auto_126988 ?auto_126990 ) ) ( not ( = ?auto_126988 ?auto_126991 ) ) ( not ( = ?auto_126988 ?auto_126992 ) ) ( not ( = ?auto_126988 ?auto_126993 ) ) ( not ( = ?auto_126989 ?auto_126990 ) ) ( not ( = ?auto_126989 ?auto_126991 ) ) ( not ( = ?auto_126989 ?auto_126992 ) ) ( not ( = ?auto_126989 ?auto_126993 ) ) ( not ( = ?auto_126990 ?auto_126991 ) ) ( not ( = ?auto_126990 ?auto_126992 ) ) ( not ( = ?auto_126990 ?auto_126993 ) ) ( not ( = ?auto_126991 ?auto_126992 ) ) ( not ( = ?auto_126991 ?auto_126993 ) ) ( not ( = ?auto_126992 ?auto_126993 ) ) ( ON-TABLE ?auto_126993 ) ( ON ?auto_126992 ?auto_126993 ) ( ON ?auto_126991 ?auto_126992 ) ( ON ?auto_126990 ?auto_126991 ) ( ON ?auto_126989 ?auto_126990 ) ( ON ?auto_126988 ?auto_126989 ) ( CLEAR ?auto_126988 ) ( HOLDING ?auto_126987 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_126987 )
      ( MAKE-7PILE ?auto_126987 ?auto_126988 ?auto_126989 ?auto_126990 ?auto_126991 ?auto_126992 ?auto_126993 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_126994 - BLOCK
      ?auto_126995 - BLOCK
      ?auto_126996 - BLOCK
      ?auto_126997 - BLOCK
      ?auto_126998 - BLOCK
      ?auto_126999 - BLOCK
      ?auto_127000 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_126994 ?auto_126995 ) ) ( not ( = ?auto_126994 ?auto_126996 ) ) ( not ( = ?auto_126994 ?auto_126997 ) ) ( not ( = ?auto_126994 ?auto_126998 ) ) ( not ( = ?auto_126994 ?auto_126999 ) ) ( not ( = ?auto_126994 ?auto_127000 ) ) ( not ( = ?auto_126995 ?auto_126996 ) ) ( not ( = ?auto_126995 ?auto_126997 ) ) ( not ( = ?auto_126995 ?auto_126998 ) ) ( not ( = ?auto_126995 ?auto_126999 ) ) ( not ( = ?auto_126995 ?auto_127000 ) ) ( not ( = ?auto_126996 ?auto_126997 ) ) ( not ( = ?auto_126996 ?auto_126998 ) ) ( not ( = ?auto_126996 ?auto_126999 ) ) ( not ( = ?auto_126996 ?auto_127000 ) ) ( not ( = ?auto_126997 ?auto_126998 ) ) ( not ( = ?auto_126997 ?auto_126999 ) ) ( not ( = ?auto_126997 ?auto_127000 ) ) ( not ( = ?auto_126998 ?auto_126999 ) ) ( not ( = ?auto_126998 ?auto_127000 ) ) ( not ( = ?auto_126999 ?auto_127000 ) ) ( ON-TABLE ?auto_127000 ) ( ON ?auto_126999 ?auto_127000 ) ( ON ?auto_126998 ?auto_126999 ) ( ON ?auto_126997 ?auto_126998 ) ( ON ?auto_126996 ?auto_126997 ) ( ON ?auto_126995 ?auto_126996 ) ( ON ?auto_126994 ?auto_126995 ) ( CLEAR ?auto_126994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127000 ?auto_126999 ?auto_126998 ?auto_126997 ?auto_126996 ?auto_126995 )
      ( MAKE-7PILE ?auto_126994 ?auto_126995 ?auto_126996 ?auto_126997 ?auto_126998 ?auto_126999 ?auto_127000 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127001 - BLOCK
      ?auto_127002 - BLOCK
      ?auto_127003 - BLOCK
      ?auto_127004 - BLOCK
      ?auto_127005 - BLOCK
      ?auto_127006 - BLOCK
      ?auto_127007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127001 ?auto_127002 ) ) ( not ( = ?auto_127001 ?auto_127003 ) ) ( not ( = ?auto_127001 ?auto_127004 ) ) ( not ( = ?auto_127001 ?auto_127005 ) ) ( not ( = ?auto_127001 ?auto_127006 ) ) ( not ( = ?auto_127001 ?auto_127007 ) ) ( not ( = ?auto_127002 ?auto_127003 ) ) ( not ( = ?auto_127002 ?auto_127004 ) ) ( not ( = ?auto_127002 ?auto_127005 ) ) ( not ( = ?auto_127002 ?auto_127006 ) ) ( not ( = ?auto_127002 ?auto_127007 ) ) ( not ( = ?auto_127003 ?auto_127004 ) ) ( not ( = ?auto_127003 ?auto_127005 ) ) ( not ( = ?auto_127003 ?auto_127006 ) ) ( not ( = ?auto_127003 ?auto_127007 ) ) ( not ( = ?auto_127004 ?auto_127005 ) ) ( not ( = ?auto_127004 ?auto_127006 ) ) ( not ( = ?auto_127004 ?auto_127007 ) ) ( not ( = ?auto_127005 ?auto_127006 ) ) ( not ( = ?auto_127005 ?auto_127007 ) ) ( not ( = ?auto_127006 ?auto_127007 ) ) ( ON-TABLE ?auto_127007 ) ( ON ?auto_127006 ?auto_127007 ) ( ON ?auto_127005 ?auto_127006 ) ( ON ?auto_127004 ?auto_127005 ) ( ON ?auto_127003 ?auto_127004 ) ( ON ?auto_127002 ?auto_127003 ) ( HOLDING ?auto_127001 ) ( CLEAR ?auto_127002 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127007 ?auto_127006 ?auto_127005 ?auto_127004 ?auto_127003 ?auto_127002 ?auto_127001 )
      ( MAKE-7PILE ?auto_127001 ?auto_127002 ?auto_127003 ?auto_127004 ?auto_127005 ?auto_127006 ?auto_127007 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127008 - BLOCK
      ?auto_127009 - BLOCK
      ?auto_127010 - BLOCK
      ?auto_127011 - BLOCK
      ?auto_127012 - BLOCK
      ?auto_127013 - BLOCK
      ?auto_127014 - BLOCK
    )
    :vars
    (
      ?auto_127015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127008 ?auto_127009 ) ) ( not ( = ?auto_127008 ?auto_127010 ) ) ( not ( = ?auto_127008 ?auto_127011 ) ) ( not ( = ?auto_127008 ?auto_127012 ) ) ( not ( = ?auto_127008 ?auto_127013 ) ) ( not ( = ?auto_127008 ?auto_127014 ) ) ( not ( = ?auto_127009 ?auto_127010 ) ) ( not ( = ?auto_127009 ?auto_127011 ) ) ( not ( = ?auto_127009 ?auto_127012 ) ) ( not ( = ?auto_127009 ?auto_127013 ) ) ( not ( = ?auto_127009 ?auto_127014 ) ) ( not ( = ?auto_127010 ?auto_127011 ) ) ( not ( = ?auto_127010 ?auto_127012 ) ) ( not ( = ?auto_127010 ?auto_127013 ) ) ( not ( = ?auto_127010 ?auto_127014 ) ) ( not ( = ?auto_127011 ?auto_127012 ) ) ( not ( = ?auto_127011 ?auto_127013 ) ) ( not ( = ?auto_127011 ?auto_127014 ) ) ( not ( = ?auto_127012 ?auto_127013 ) ) ( not ( = ?auto_127012 ?auto_127014 ) ) ( not ( = ?auto_127013 ?auto_127014 ) ) ( ON-TABLE ?auto_127014 ) ( ON ?auto_127013 ?auto_127014 ) ( ON ?auto_127012 ?auto_127013 ) ( ON ?auto_127011 ?auto_127012 ) ( ON ?auto_127010 ?auto_127011 ) ( ON ?auto_127009 ?auto_127010 ) ( CLEAR ?auto_127009 ) ( ON ?auto_127008 ?auto_127015 ) ( CLEAR ?auto_127008 ) ( HAND-EMPTY ) ( not ( = ?auto_127008 ?auto_127015 ) ) ( not ( = ?auto_127009 ?auto_127015 ) ) ( not ( = ?auto_127010 ?auto_127015 ) ) ( not ( = ?auto_127011 ?auto_127015 ) ) ( not ( = ?auto_127012 ?auto_127015 ) ) ( not ( = ?auto_127013 ?auto_127015 ) ) ( not ( = ?auto_127014 ?auto_127015 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127008 ?auto_127015 )
      ( MAKE-7PILE ?auto_127008 ?auto_127009 ?auto_127010 ?auto_127011 ?auto_127012 ?auto_127013 ?auto_127014 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127016 - BLOCK
      ?auto_127017 - BLOCK
      ?auto_127018 - BLOCK
      ?auto_127019 - BLOCK
      ?auto_127020 - BLOCK
      ?auto_127021 - BLOCK
      ?auto_127022 - BLOCK
    )
    :vars
    (
      ?auto_127023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127016 ?auto_127017 ) ) ( not ( = ?auto_127016 ?auto_127018 ) ) ( not ( = ?auto_127016 ?auto_127019 ) ) ( not ( = ?auto_127016 ?auto_127020 ) ) ( not ( = ?auto_127016 ?auto_127021 ) ) ( not ( = ?auto_127016 ?auto_127022 ) ) ( not ( = ?auto_127017 ?auto_127018 ) ) ( not ( = ?auto_127017 ?auto_127019 ) ) ( not ( = ?auto_127017 ?auto_127020 ) ) ( not ( = ?auto_127017 ?auto_127021 ) ) ( not ( = ?auto_127017 ?auto_127022 ) ) ( not ( = ?auto_127018 ?auto_127019 ) ) ( not ( = ?auto_127018 ?auto_127020 ) ) ( not ( = ?auto_127018 ?auto_127021 ) ) ( not ( = ?auto_127018 ?auto_127022 ) ) ( not ( = ?auto_127019 ?auto_127020 ) ) ( not ( = ?auto_127019 ?auto_127021 ) ) ( not ( = ?auto_127019 ?auto_127022 ) ) ( not ( = ?auto_127020 ?auto_127021 ) ) ( not ( = ?auto_127020 ?auto_127022 ) ) ( not ( = ?auto_127021 ?auto_127022 ) ) ( ON-TABLE ?auto_127022 ) ( ON ?auto_127021 ?auto_127022 ) ( ON ?auto_127020 ?auto_127021 ) ( ON ?auto_127019 ?auto_127020 ) ( ON ?auto_127018 ?auto_127019 ) ( ON ?auto_127016 ?auto_127023 ) ( CLEAR ?auto_127016 ) ( not ( = ?auto_127016 ?auto_127023 ) ) ( not ( = ?auto_127017 ?auto_127023 ) ) ( not ( = ?auto_127018 ?auto_127023 ) ) ( not ( = ?auto_127019 ?auto_127023 ) ) ( not ( = ?auto_127020 ?auto_127023 ) ) ( not ( = ?auto_127021 ?auto_127023 ) ) ( not ( = ?auto_127022 ?auto_127023 ) ) ( HOLDING ?auto_127017 ) ( CLEAR ?auto_127018 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127022 ?auto_127021 ?auto_127020 ?auto_127019 ?auto_127018 ?auto_127017 )
      ( MAKE-7PILE ?auto_127016 ?auto_127017 ?auto_127018 ?auto_127019 ?auto_127020 ?auto_127021 ?auto_127022 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127024 - BLOCK
      ?auto_127025 - BLOCK
      ?auto_127026 - BLOCK
      ?auto_127027 - BLOCK
      ?auto_127028 - BLOCK
      ?auto_127029 - BLOCK
      ?auto_127030 - BLOCK
    )
    :vars
    (
      ?auto_127031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127024 ?auto_127025 ) ) ( not ( = ?auto_127024 ?auto_127026 ) ) ( not ( = ?auto_127024 ?auto_127027 ) ) ( not ( = ?auto_127024 ?auto_127028 ) ) ( not ( = ?auto_127024 ?auto_127029 ) ) ( not ( = ?auto_127024 ?auto_127030 ) ) ( not ( = ?auto_127025 ?auto_127026 ) ) ( not ( = ?auto_127025 ?auto_127027 ) ) ( not ( = ?auto_127025 ?auto_127028 ) ) ( not ( = ?auto_127025 ?auto_127029 ) ) ( not ( = ?auto_127025 ?auto_127030 ) ) ( not ( = ?auto_127026 ?auto_127027 ) ) ( not ( = ?auto_127026 ?auto_127028 ) ) ( not ( = ?auto_127026 ?auto_127029 ) ) ( not ( = ?auto_127026 ?auto_127030 ) ) ( not ( = ?auto_127027 ?auto_127028 ) ) ( not ( = ?auto_127027 ?auto_127029 ) ) ( not ( = ?auto_127027 ?auto_127030 ) ) ( not ( = ?auto_127028 ?auto_127029 ) ) ( not ( = ?auto_127028 ?auto_127030 ) ) ( not ( = ?auto_127029 ?auto_127030 ) ) ( ON-TABLE ?auto_127030 ) ( ON ?auto_127029 ?auto_127030 ) ( ON ?auto_127028 ?auto_127029 ) ( ON ?auto_127027 ?auto_127028 ) ( ON ?auto_127026 ?auto_127027 ) ( ON ?auto_127024 ?auto_127031 ) ( not ( = ?auto_127024 ?auto_127031 ) ) ( not ( = ?auto_127025 ?auto_127031 ) ) ( not ( = ?auto_127026 ?auto_127031 ) ) ( not ( = ?auto_127027 ?auto_127031 ) ) ( not ( = ?auto_127028 ?auto_127031 ) ) ( not ( = ?auto_127029 ?auto_127031 ) ) ( not ( = ?auto_127030 ?auto_127031 ) ) ( CLEAR ?auto_127026 ) ( ON ?auto_127025 ?auto_127024 ) ( CLEAR ?auto_127025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127031 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127031 ?auto_127024 )
      ( MAKE-7PILE ?auto_127024 ?auto_127025 ?auto_127026 ?auto_127027 ?auto_127028 ?auto_127029 ?auto_127030 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127032 - BLOCK
      ?auto_127033 - BLOCK
      ?auto_127034 - BLOCK
      ?auto_127035 - BLOCK
      ?auto_127036 - BLOCK
      ?auto_127037 - BLOCK
      ?auto_127038 - BLOCK
    )
    :vars
    (
      ?auto_127039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127032 ?auto_127033 ) ) ( not ( = ?auto_127032 ?auto_127034 ) ) ( not ( = ?auto_127032 ?auto_127035 ) ) ( not ( = ?auto_127032 ?auto_127036 ) ) ( not ( = ?auto_127032 ?auto_127037 ) ) ( not ( = ?auto_127032 ?auto_127038 ) ) ( not ( = ?auto_127033 ?auto_127034 ) ) ( not ( = ?auto_127033 ?auto_127035 ) ) ( not ( = ?auto_127033 ?auto_127036 ) ) ( not ( = ?auto_127033 ?auto_127037 ) ) ( not ( = ?auto_127033 ?auto_127038 ) ) ( not ( = ?auto_127034 ?auto_127035 ) ) ( not ( = ?auto_127034 ?auto_127036 ) ) ( not ( = ?auto_127034 ?auto_127037 ) ) ( not ( = ?auto_127034 ?auto_127038 ) ) ( not ( = ?auto_127035 ?auto_127036 ) ) ( not ( = ?auto_127035 ?auto_127037 ) ) ( not ( = ?auto_127035 ?auto_127038 ) ) ( not ( = ?auto_127036 ?auto_127037 ) ) ( not ( = ?auto_127036 ?auto_127038 ) ) ( not ( = ?auto_127037 ?auto_127038 ) ) ( ON-TABLE ?auto_127038 ) ( ON ?auto_127037 ?auto_127038 ) ( ON ?auto_127036 ?auto_127037 ) ( ON ?auto_127035 ?auto_127036 ) ( ON ?auto_127032 ?auto_127039 ) ( not ( = ?auto_127032 ?auto_127039 ) ) ( not ( = ?auto_127033 ?auto_127039 ) ) ( not ( = ?auto_127034 ?auto_127039 ) ) ( not ( = ?auto_127035 ?auto_127039 ) ) ( not ( = ?auto_127036 ?auto_127039 ) ) ( not ( = ?auto_127037 ?auto_127039 ) ) ( not ( = ?auto_127038 ?auto_127039 ) ) ( ON ?auto_127033 ?auto_127032 ) ( CLEAR ?auto_127033 ) ( ON-TABLE ?auto_127039 ) ( HOLDING ?auto_127034 ) ( CLEAR ?auto_127035 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127038 ?auto_127037 ?auto_127036 ?auto_127035 ?auto_127034 )
      ( MAKE-7PILE ?auto_127032 ?auto_127033 ?auto_127034 ?auto_127035 ?auto_127036 ?auto_127037 ?auto_127038 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127040 - BLOCK
      ?auto_127041 - BLOCK
      ?auto_127042 - BLOCK
      ?auto_127043 - BLOCK
      ?auto_127044 - BLOCK
      ?auto_127045 - BLOCK
      ?auto_127046 - BLOCK
    )
    :vars
    (
      ?auto_127047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127040 ?auto_127041 ) ) ( not ( = ?auto_127040 ?auto_127042 ) ) ( not ( = ?auto_127040 ?auto_127043 ) ) ( not ( = ?auto_127040 ?auto_127044 ) ) ( not ( = ?auto_127040 ?auto_127045 ) ) ( not ( = ?auto_127040 ?auto_127046 ) ) ( not ( = ?auto_127041 ?auto_127042 ) ) ( not ( = ?auto_127041 ?auto_127043 ) ) ( not ( = ?auto_127041 ?auto_127044 ) ) ( not ( = ?auto_127041 ?auto_127045 ) ) ( not ( = ?auto_127041 ?auto_127046 ) ) ( not ( = ?auto_127042 ?auto_127043 ) ) ( not ( = ?auto_127042 ?auto_127044 ) ) ( not ( = ?auto_127042 ?auto_127045 ) ) ( not ( = ?auto_127042 ?auto_127046 ) ) ( not ( = ?auto_127043 ?auto_127044 ) ) ( not ( = ?auto_127043 ?auto_127045 ) ) ( not ( = ?auto_127043 ?auto_127046 ) ) ( not ( = ?auto_127044 ?auto_127045 ) ) ( not ( = ?auto_127044 ?auto_127046 ) ) ( not ( = ?auto_127045 ?auto_127046 ) ) ( ON-TABLE ?auto_127046 ) ( ON ?auto_127045 ?auto_127046 ) ( ON ?auto_127044 ?auto_127045 ) ( ON ?auto_127043 ?auto_127044 ) ( ON ?auto_127040 ?auto_127047 ) ( not ( = ?auto_127040 ?auto_127047 ) ) ( not ( = ?auto_127041 ?auto_127047 ) ) ( not ( = ?auto_127042 ?auto_127047 ) ) ( not ( = ?auto_127043 ?auto_127047 ) ) ( not ( = ?auto_127044 ?auto_127047 ) ) ( not ( = ?auto_127045 ?auto_127047 ) ) ( not ( = ?auto_127046 ?auto_127047 ) ) ( ON ?auto_127041 ?auto_127040 ) ( ON-TABLE ?auto_127047 ) ( CLEAR ?auto_127043 ) ( ON ?auto_127042 ?auto_127041 ) ( CLEAR ?auto_127042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127047 ?auto_127040 ?auto_127041 )
      ( MAKE-7PILE ?auto_127040 ?auto_127041 ?auto_127042 ?auto_127043 ?auto_127044 ?auto_127045 ?auto_127046 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127048 - BLOCK
      ?auto_127049 - BLOCK
      ?auto_127050 - BLOCK
      ?auto_127051 - BLOCK
      ?auto_127052 - BLOCK
      ?auto_127053 - BLOCK
      ?auto_127054 - BLOCK
    )
    :vars
    (
      ?auto_127055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127048 ?auto_127049 ) ) ( not ( = ?auto_127048 ?auto_127050 ) ) ( not ( = ?auto_127048 ?auto_127051 ) ) ( not ( = ?auto_127048 ?auto_127052 ) ) ( not ( = ?auto_127048 ?auto_127053 ) ) ( not ( = ?auto_127048 ?auto_127054 ) ) ( not ( = ?auto_127049 ?auto_127050 ) ) ( not ( = ?auto_127049 ?auto_127051 ) ) ( not ( = ?auto_127049 ?auto_127052 ) ) ( not ( = ?auto_127049 ?auto_127053 ) ) ( not ( = ?auto_127049 ?auto_127054 ) ) ( not ( = ?auto_127050 ?auto_127051 ) ) ( not ( = ?auto_127050 ?auto_127052 ) ) ( not ( = ?auto_127050 ?auto_127053 ) ) ( not ( = ?auto_127050 ?auto_127054 ) ) ( not ( = ?auto_127051 ?auto_127052 ) ) ( not ( = ?auto_127051 ?auto_127053 ) ) ( not ( = ?auto_127051 ?auto_127054 ) ) ( not ( = ?auto_127052 ?auto_127053 ) ) ( not ( = ?auto_127052 ?auto_127054 ) ) ( not ( = ?auto_127053 ?auto_127054 ) ) ( ON-TABLE ?auto_127054 ) ( ON ?auto_127053 ?auto_127054 ) ( ON ?auto_127052 ?auto_127053 ) ( ON ?auto_127048 ?auto_127055 ) ( not ( = ?auto_127048 ?auto_127055 ) ) ( not ( = ?auto_127049 ?auto_127055 ) ) ( not ( = ?auto_127050 ?auto_127055 ) ) ( not ( = ?auto_127051 ?auto_127055 ) ) ( not ( = ?auto_127052 ?auto_127055 ) ) ( not ( = ?auto_127053 ?auto_127055 ) ) ( not ( = ?auto_127054 ?auto_127055 ) ) ( ON ?auto_127049 ?auto_127048 ) ( ON-TABLE ?auto_127055 ) ( ON ?auto_127050 ?auto_127049 ) ( CLEAR ?auto_127050 ) ( HOLDING ?auto_127051 ) ( CLEAR ?auto_127052 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127054 ?auto_127053 ?auto_127052 ?auto_127051 )
      ( MAKE-7PILE ?auto_127048 ?auto_127049 ?auto_127050 ?auto_127051 ?auto_127052 ?auto_127053 ?auto_127054 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127056 - BLOCK
      ?auto_127057 - BLOCK
      ?auto_127058 - BLOCK
      ?auto_127059 - BLOCK
      ?auto_127060 - BLOCK
      ?auto_127061 - BLOCK
      ?auto_127062 - BLOCK
    )
    :vars
    (
      ?auto_127063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127056 ?auto_127057 ) ) ( not ( = ?auto_127056 ?auto_127058 ) ) ( not ( = ?auto_127056 ?auto_127059 ) ) ( not ( = ?auto_127056 ?auto_127060 ) ) ( not ( = ?auto_127056 ?auto_127061 ) ) ( not ( = ?auto_127056 ?auto_127062 ) ) ( not ( = ?auto_127057 ?auto_127058 ) ) ( not ( = ?auto_127057 ?auto_127059 ) ) ( not ( = ?auto_127057 ?auto_127060 ) ) ( not ( = ?auto_127057 ?auto_127061 ) ) ( not ( = ?auto_127057 ?auto_127062 ) ) ( not ( = ?auto_127058 ?auto_127059 ) ) ( not ( = ?auto_127058 ?auto_127060 ) ) ( not ( = ?auto_127058 ?auto_127061 ) ) ( not ( = ?auto_127058 ?auto_127062 ) ) ( not ( = ?auto_127059 ?auto_127060 ) ) ( not ( = ?auto_127059 ?auto_127061 ) ) ( not ( = ?auto_127059 ?auto_127062 ) ) ( not ( = ?auto_127060 ?auto_127061 ) ) ( not ( = ?auto_127060 ?auto_127062 ) ) ( not ( = ?auto_127061 ?auto_127062 ) ) ( ON-TABLE ?auto_127062 ) ( ON ?auto_127061 ?auto_127062 ) ( ON ?auto_127060 ?auto_127061 ) ( ON ?auto_127056 ?auto_127063 ) ( not ( = ?auto_127056 ?auto_127063 ) ) ( not ( = ?auto_127057 ?auto_127063 ) ) ( not ( = ?auto_127058 ?auto_127063 ) ) ( not ( = ?auto_127059 ?auto_127063 ) ) ( not ( = ?auto_127060 ?auto_127063 ) ) ( not ( = ?auto_127061 ?auto_127063 ) ) ( not ( = ?auto_127062 ?auto_127063 ) ) ( ON ?auto_127057 ?auto_127056 ) ( ON-TABLE ?auto_127063 ) ( ON ?auto_127058 ?auto_127057 ) ( CLEAR ?auto_127060 ) ( ON ?auto_127059 ?auto_127058 ) ( CLEAR ?auto_127059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127063 ?auto_127056 ?auto_127057 ?auto_127058 )
      ( MAKE-7PILE ?auto_127056 ?auto_127057 ?auto_127058 ?auto_127059 ?auto_127060 ?auto_127061 ?auto_127062 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127064 - BLOCK
      ?auto_127065 - BLOCK
      ?auto_127066 - BLOCK
      ?auto_127067 - BLOCK
      ?auto_127068 - BLOCK
      ?auto_127069 - BLOCK
      ?auto_127070 - BLOCK
    )
    :vars
    (
      ?auto_127071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127064 ?auto_127065 ) ) ( not ( = ?auto_127064 ?auto_127066 ) ) ( not ( = ?auto_127064 ?auto_127067 ) ) ( not ( = ?auto_127064 ?auto_127068 ) ) ( not ( = ?auto_127064 ?auto_127069 ) ) ( not ( = ?auto_127064 ?auto_127070 ) ) ( not ( = ?auto_127065 ?auto_127066 ) ) ( not ( = ?auto_127065 ?auto_127067 ) ) ( not ( = ?auto_127065 ?auto_127068 ) ) ( not ( = ?auto_127065 ?auto_127069 ) ) ( not ( = ?auto_127065 ?auto_127070 ) ) ( not ( = ?auto_127066 ?auto_127067 ) ) ( not ( = ?auto_127066 ?auto_127068 ) ) ( not ( = ?auto_127066 ?auto_127069 ) ) ( not ( = ?auto_127066 ?auto_127070 ) ) ( not ( = ?auto_127067 ?auto_127068 ) ) ( not ( = ?auto_127067 ?auto_127069 ) ) ( not ( = ?auto_127067 ?auto_127070 ) ) ( not ( = ?auto_127068 ?auto_127069 ) ) ( not ( = ?auto_127068 ?auto_127070 ) ) ( not ( = ?auto_127069 ?auto_127070 ) ) ( ON-TABLE ?auto_127070 ) ( ON ?auto_127069 ?auto_127070 ) ( ON ?auto_127064 ?auto_127071 ) ( not ( = ?auto_127064 ?auto_127071 ) ) ( not ( = ?auto_127065 ?auto_127071 ) ) ( not ( = ?auto_127066 ?auto_127071 ) ) ( not ( = ?auto_127067 ?auto_127071 ) ) ( not ( = ?auto_127068 ?auto_127071 ) ) ( not ( = ?auto_127069 ?auto_127071 ) ) ( not ( = ?auto_127070 ?auto_127071 ) ) ( ON ?auto_127065 ?auto_127064 ) ( ON-TABLE ?auto_127071 ) ( ON ?auto_127066 ?auto_127065 ) ( ON ?auto_127067 ?auto_127066 ) ( CLEAR ?auto_127067 ) ( HOLDING ?auto_127068 ) ( CLEAR ?auto_127069 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127070 ?auto_127069 ?auto_127068 )
      ( MAKE-7PILE ?auto_127064 ?auto_127065 ?auto_127066 ?auto_127067 ?auto_127068 ?auto_127069 ?auto_127070 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127072 - BLOCK
      ?auto_127073 - BLOCK
      ?auto_127074 - BLOCK
      ?auto_127075 - BLOCK
      ?auto_127076 - BLOCK
      ?auto_127077 - BLOCK
      ?auto_127078 - BLOCK
    )
    :vars
    (
      ?auto_127079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127072 ?auto_127073 ) ) ( not ( = ?auto_127072 ?auto_127074 ) ) ( not ( = ?auto_127072 ?auto_127075 ) ) ( not ( = ?auto_127072 ?auto_127076 ) ) ( not ( = ?auto_127072 ?auto_127077 ) ) ( not ( = ?auto_127072 ?auto_127078 ) ) ( not ( = ?auto_127073 ?auto_127074 ) ) ( not ( = ?auto_127073 ?auto_127075 ) ) ( not ( = ?auto_127073 ?auto_127076 ) ) ( not ( = ?auto_127073 ?auto_127077 ) ) ( not ( = ?auto_127073 ?auto_127078 ) ) ( not ( = ?auto_127074 ?auto_127075 ) ) ( not ( = ?auto_127074 ?auto_127076 ) ) ( not ( = ?auto_127074 ?auto_127077 ) ) ( not ( = ?auto_127074 ?auto_127078 ) ) ( not ( = ?auto_127075 ?auto_127076 ) ) ( not ( = ?auto_127075 ?auto_127077 ) ) ( not ( = ?auto_127075 ?auto_127078 ) ) ( not ( = ?auto_127076 ?auto_127077 ) ) ( not ( = ?auto_127076 ?auto_127078 ) ) ( not ( = ?auto_127077 ?auto_127078 ) ) ( ON-TABLE ?auto_127078 ) ( ON ?auto_127077 ?auto_127078 ) ( ON ?auto_127072 ?auto_127079 ) ( not ( = ?auto_127072 ?auto_127079 ) ) ( not ( = ?auto_127073 ?auto_127079 ) ) ( not ( = ?auto_127074 ?auto_127079 ) ) ( not ( = ?auto_127075 ?auto_127079 ) ) ( not ( = ?auto_127076 ?auto_127079 ) ) ( not ( = ?auto_127077 ?auto_127079 ) ) ( not ( = ?auto_127078 ?auto_127079 ) ) ( ON ?auto_127073 ?auto_127072 ) ( ON-TABLE ?auto_127079 ) ( ON ?auto_127074 ?auto_127073 ) ( ON ?auto_127075 ?auto_127074 ) ( CLEAR ?auto_127077 ) ( ON ?auto_127076 ?auto_127075 ) ( CLEAR ?auto_127076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127079 ?auto_127072 ?auto_127073 ?auto_127074 ?auto_127075 )
      ( MAKE-7PILE ?auto_127072 ?auto_127073 ?auto_127074 ?auto_127075 ?auto_127076 ?auto_127077 ?auto_127078 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127080 - BLOCK
      ?auto_127081 - BLOCK
      ?auto_127082 - BLOCK
      ?auto_127083 - BLOCK
      ?auto_127084 - BLOCK
      ?auto_127085 - BLOCK
      ?auto_127086 - BLOCK
    )
    :vars
    (
      ?auto_127087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127080 ?auto_127081 ) ) ( not ( = ?auto_127080 ?auto_127082 ) ) ( not ( = ?auto_127080 ?auto_127083 ) ) ( not ( = ?auto_127080 ?auto_127084 ) ) ( not ( = ?auto_127080 ?auto_127085 ) ) ( not ( = ?auto_127080 ?auto_127086 ) ) ( not ( = ?auto_127081 ?auto_127082 ) ) ( not ( = ?auto_127081 ?auto_127083 ) ) ( not ( = ?auto_127081 ?auto_127084 ) ) ( not ( = ?auto_127081 ?auto_127085 ) ) ( not ( = ?auto_127081 ?auto_127086 ) ) ( not ( = ?auto_127082 ?auto_127083 ) ) ( not ( = ?auto_127082 ?auto_127084 ) ) ( not ( = ?auto_127082 ?auto_127085 ) ) ( not ( = ?auto_127082 ?auto_127086 ) ) ( not ( = ?auto_127083 ?auto_127084 ) ) ( not ( = ?auto_127083 ?auto_127085 ) ) ( not ( = ?auto_127083 ?auto_127086 ) ) ( not ( = ?auto_127084 ?auto_127085 ) ) ( not ( = ?auto_127084 ?auto_127086 ) ) ( not ( = ?auto_127085 ?auto_127086 ) ) ( ON-TABLE ?auto_127086 ) ( ON ?auto_127080 ?auto_127087 ) ( not ( = ?auto_127080 ?auto_127087 ) ) ( not ( = ?auto_127081 ?auto_127087 ) ) ( not ( = ?auto_127082 ?auto_127087 ) ) ( not ( = ?auto_127083 ?auto_127087 ) ) ( not ( = ?auto_127084 ?auto_127087 ) ) ( not ( = ?auto_127085 ?auto_127087 ) ) ( not ( = ?auto_127086 ?auto_127087 ) ) ( ON ?auto_127081 ?auto_127080 ) ( ON-TABLE ?auto_127087 ) ( ON ?auto_127082 ?auto_127081 ) ( ON ?auto_127083 ?auto_127082 ) ( ON ?auto_127084 ?auto_127083 ) ( CLEAR ?auto_127084 ) ( HOLDING ?auto_127085 ) ( CLEAR ?auto_127086 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127086 ?auto_127085 )
      ( MAKE-7PILE ?auto_127080 ?auto_127081 ?auto_127082 ?auto_127083 ?auto_127084 ?auto_127085 ?auto_127086 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127088 - BLOCK
      ?auto_127089 - BLOCK
      ?auto_127090 - BLOCK
      ?auto_127091 - BLOCK
      ?auto_127092 - BLOCK
      ?auto_127093 - BLOCK
      ?auto_127094 - BLOCK
    )
    :vars
    (
      ?auto_127095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127088 ?auto_127089 ) ) ( not ( = ?auto_127088 ?auto_127090 ) ) ( not ( = ?auto_127088 ?auto_127091 ) ) ( not ( = ?auto_127088 ?auto_127092 ) ) ( not ( = ?auto_127088 ?auto_127093 ) ) ( not ( = ?auto_127088 ?auto_127094 ) ) ( not ( = ?auto_127089 ?auto_127090 ) ) ( not ( = ?auto_127089 ?auto_127091 ) ) ( not ( = ?auto_127089 ?auto_127092 ) ) ( not ( = ?auto_127089 ?auto_127093 ) ) ( not ( = ?auto_127089 ?auto_127094 ) ) ( not ( = ?auto_127090 ?auto_127091 ) ) ( not ( = ?auto_127090 ?auto_127092 ) ) ( not ( = ?auto_127090 ?auto_127093 ) ) ( not ( = ?auto_127090 ?auto_127094 ) ) ( not ( = ?auto_127091 ?auto_127092 ) ) ( not ( = ?auto_127091 ?auto_127093 ) ) ( not ( = ?auto_127091 ?auto_127094 ) ) ( not ( = ?auto_127092 ?auto_127093 ) ) ( not ( = ?auto_127092 ?auto_127094 ) ) ( not ( = ?auto_127093 ?auto_127094 ) ) ( ON-TABLE ?auto_127094 ) ( ON ?auto_127088 ?auto_127095 ) ( not ( = ?auto_127088 ?auto_127095 ) ) ( not ( = ?auto_127089 ?auto_127095 ) ) ( not ( = ?auto_127090 ?auto_127095 ) ) ( not ( = ?auto_127091 ?auto_127095 ) ) ( not ( = ?auto_127092 ?auto_127095 ) ) ( not ( = ?auto_127093 ?auto_127095 ) ) ( not ( = ?auto_127094 ?auto_127095 ) ) ( ON ?auto_127089 ?auto_127088 ) ( ON-TABLE ?auto_127095 ) ( ON ?auto_127090 ?auto_127089 ) ( ON ?auto_127091 ?auto_127090 ) ( ON ?auto_127092 ?auto_127091 ) ( CLEAR ?auto_127094 ) ( ON ?auto_127093 ?auto_127092 ) ( CLEAR ?auto_127093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127095 ?auto_127088 ?auto_127089 ?auto_127090 ?auto_127091 ?auto_127092 )
      ( MAKE-7PILE ?auto_127088 ?auto_127089 ?auto_127090 ?auto_127091 ?auto_127092 ?auto_127093 ?auto_127094 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127096 - BLOCK
      ?auto_127097 - BLOCK
      ?auto_127098 - BLOCK
      ?auto_127099 - BLOCK
      ?auto_127100 - BLOCK
      ?auto_127101 - BLOCK
      ?auto_127102 - BLOCK
    )
    :vars
    (
      ?auto_127103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127096 ?auto_127097 ) ) ( not ( = ?auto_127096 ?auto_127098 ) ) ( not ( = ?auto_127096 ?auto_127099 ) ) ( not ( = ?auto_127096 ?auto_127100 ) ) ( not ( = ?auto_127096 ?auto_127101 ) ) ( not ( = ?auto_127096 ?auto_127102 ) ) ( not ( = ?auto_127097 ?auto_127098 ) ) ( not ( = ?auto_127097 ?auto_127099 ) ) ( not ( = ?auto_127097 ?auto_127100 ) ) ( not ( = ?auto_127097 ?auto_127101 ) ) ( not ( = ?auto_127097 ?auto_127102 ) ) ( not ( = ?auto_127098 ?auto_127099 ) ) ( not ( = ?auto_127098 ?auto_127100 ) ) ( not ( = ?auto_127098 ?auto_127101 ) ) ( not ( = ?auto_127098 ?auto_127102 ) ) ( not ( = ?auto_127099 ?auto_127100 ) ) ( not ( = ?auto_127099 ?auto_127101 ) ) ( not ( = ?auto_127099 ?auto_127102 ) ) ( not ( = ?auto_127100 ?auto_127101 ) ) ( not ( = ?auto_127100 ?auto_127102 ) ) ( not ( = ?auto_127101 ?auto_127102 ) ) ( ON ?auto_127096 ?auto_127103 ) ( not ( = ?auto_127096 ?auto_127103 ) ) ( not ( = ?auto_127097 ?auto_127103 ) ) ( not ( = ?auto_127098 ?auto_127103 ) ) ( not ( = ?auto_127099 ?auto_127103 ) ) ( not ( = ?auto_127100 ?auto_127103 ) ) ( not ( = ?auto_127101 ?auto_127103 ) ) ( not ( = ?auto_127102 ?auto_127103 ) ) ( ON ?auto_127097 ?auto_127096 ) ( ON-TABLE ?auto_127103 ) ( ON ?auto_127098 ?auto_127097 ) ( ON ?auto_127099 ?auto_127098 ) ( ON ?auto_127100 ?auto_127099 ) ( ON ?auto_127101 ?auto_127100 ) ( CLEAR ?auto_127101 ) ( HOLDING ?auto_127102 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127102 )
      ( MAKE-7PILE ?auto_127096 ?auto_127097 ?auto_127098 ?auto_127099 ?auto_127100 ?auto_127101 ?auto_127102 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127104 - BLOCK
      ?auto_127105 - BLOCK
      ?auto_127106 - BLOCK
      ?auto_127107 - BLOCK
      ?auto_127108 - BLOCK
      ?auto_127109 - BLOCK
      ?auto_127110 - BLOCK
    )
    :vars
    (
      ?auto_127111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127104 ?auto_127105 ) ) ( not ( = ?auto_127104 ?auto_127106 ) ) ( not ( = ?auto_127104 ?auto_127107 ) ) ( not ( = ?auto_127104 ?auto_127108 ) ) ( not ( = ?auto_127104 ?auto_127109 ) ) ( not ( = ?auto_127104 ?auto_127110 ) ) ( not ( = ?auto_127105 ?auto_127106 ) ) ( not ( = ?auto_127105 ?auto_127107 ) ) ( not ( = ?auto_127105 ?auto_127108 ) ) ( not ( = ?auto_127105 ?auto_127109 ) ) ( not ( = ?auto_127105 ?auto_127110 ) ) ( not ( = ?auto_127106 ?auto_127107 ) ) ( not ( = ?auto_127106 ?auto_127108 ) ) ( not ( = ?auto_127106 ?auto_127109 ) ) ( not ( = ?auto_127106 ?auto_127110 ) ) ( not ( = ?auto_127107 ?auto_127108 ) ) ( not ( = ?auto_127107 ?auto_127109 ) ) ( not ( = ?auto_127107 ?auto_127110 ) ) ( not ( = ?auto_127108 ?auto_127109 ) ) ( not ( = ?auto_127108 ?auto_127110 ) ) ( not ( = ?auto_127109 ?auto_127110 ) ) ( ON ?auto_127104 ?auto_127111 ) ( not ( = ?auto_127104 ?auto_127111 ) ) ( not ( = ?auto_127105 ?auto_127111 ) ) ( not ( = ?auto_127106 ?auto_127111 ) ) ( not ( = ?auto_127107 ?auto_127111 ) ) ( not ( = ?auto_127108 ?auto_127111 ) ) ( not ( = ?auto_127109 ?auto_127111 ) ) ( not ( = ?auto_127110 ?auto_127111 ) ) ( ON ?auto_127105 ?auto_127104 ) ( ON-TABLE ?auto_127111 ) ( ON ?auto_127106 ?auto_127105 ) ( ON ?auto_127107 ?auto_127106 ) ( ON ?auto_127108 ?auto_127107 ) ( ON ?auto_127109 ?auto_127108 ) ( ON ?auto_127110 ?auto_127109 ) ( CLEAR ?auto_127110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127111 ?auto_127104 ?auto_127105 ?auto_127106 ?auto_127107 ?auto_127108 ?auto_127109 )
      ( MAKE-7PILE ?auto_127104 ?auto_127105 ?auto_127106 ?auto_127107 ?auto_127108 ?auto_127109 ?auto_127110 ) )
  )

)

