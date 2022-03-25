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
      ?auto_104287 - BLOCK
      ?auto_104288 - BLOCK
      ?auto_104289 - BLOCK
      ?auto_104290 - BLOCK
      ?auto_104291 - BLOCK
      ?auto_104292 - BLOCK
      ?auto_104293 - BLOCK
    )
    :vars
    (
      ?auto_104294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104294 ?auto_104293 ) ( CLEAR ?auto_104294 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104287 ) ( ON ?auto_104288 ?auto_104287 ) ( ON ?auto_104289 ?auto_104288 ) ( ON ?auto_104290 ?auto_104289 ) ( ON ?auto_104291 ?auto_104290 ) ( ON ?auto_104292 ?auto_104291 ) ( ON ?auto_104293 ?auto_104292 ) ( not ( = ?auto_104287 ?auto_104288 ) ) ( not ( = ?auto_104287 ?auto_104289 ) ) ( not ( = ?auto_104287 ?auto_104290 ) ) ( not ( = ?auto_104287 ?auto_104291 ) ) ( not ( = ?auto_104287 ?auto_104292 ) ) ( not ( = ?auto_104287 ?auto_104293 ) ) ( not ( = ?auto_104287 ?auto_104294 ) ) ( not ( = ?auto_104288 ?auto_104289 ) ) ( not ( = ?auto_104288 ?auto_104290 ) ) ( not ( = ?auto_104288 ?auto_104291 ) ) ( not ( = ?auto_104288 ?auto_104292 ) ) ( not ( = ?auto_104288 ?auto_104293 ) ) ( not ( = ?auto_104288 ?auto_104294 ) ) ( not ( = ?auto_104289 ?auto_104290 ) ) ( not ( = ?auto_104289 ?auto_104291 ) ) ( not ( = ?auto_104289 ?auto_104292 ) ) ( not ( = ?auto_104289 ?auto_104293 ) ) ( not ( = ?auto_104289 ?auto_104294 ) ) ( not ( = ?auto_104290 ?auto_104291 ) ) ( not ( = ?auto_104290 ?auto_104292 ) ) ( not ( = ?auto_104290 ?auto_104293 ) ) ( not ( = ?auto_104290 ?auto_104294 ) ) ( not ( = ?auto_104291 ?auto_104292 ) ) ( not ( = ?auto_104291 ?auto_104293 ) ) ( not ( = ?auto_104291 ?auto_104294 ) ) ( not ( = ?auto_104292 ?auto_104293 ) ) ( not ( = ?auto_104292 ?auto_104294 ) ) ( not ( = ?auto_104293 ?auto_104294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104294 ?auto_104293 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104296 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104296 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_104296 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104297 - BLOCK
    )
    :vars
    (
      ?auto_104298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104297 ?auto_104298 ) ( CLEAR ?auto_104297 ) ( HAND-EMPTY ) ( not ( = ?auto_104297 ?auto_104298 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104297 ?auto_104298 )
      ( MAKE-1PILE ?auto_104297 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104305 - BLOCK
      ?auto_104306 - BLOCK
      ?auto_104307 - BLOCK
      ?auto_104308 - BLOCK
      ?auto_104309 - BLOCK
      ?auto_104310 - BLOCK
    )
    :vars
    (
      ?auto_104311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104311 ?auto_104310 ) ( CLEAR ?auto_104311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104305 ) ( ON ?auto_104306 ?auto_104305 ) ( ON ?auto_104307 ?auto_104306 ) ( ON ?auto_104308 ?auto_104307 ) ( ON ?auto_104309 ?auto_104308 ) ( ON ?auto_104310 ?auto_104309 ) ( not ( = ?auto_104305 ?auto_104306 ) ) ( not ( = ?auto_104305 ?auto_104307 ) ) ( not ( = ?auto_104305 ?auto_104308 ) ) ( not ( = ?auto_104305 ?auto_104309 ) ) ( not ( = ?auto_104305 ?auto_104310 ) ) ( not ( = ?auto_104305 ?auto_104311 ) ) ( not ( = ?auto_104306 ?auto_104307 ) ) ( not ( = ?auto_104306 ?auto_104308 ) ) ( not ( = ?auto_104306 ?auto_104309 ) ) ( not ( = ?auto_104306 ?auto_104310 ) ) ( not ( = ?auto_104306 ?auto_104311 ) ) ( not ( = ?auto_104307 ?auto_104308 ) ) ( not ( = ?auto_104307 ?auto_104309 ) ) ( not ( = ?auto_104307 ?auto_104310 ) ) ( not ( = ?auto_104307 ?auto_104311 ) ) ( not ( = ?auto_104308 ?auto_104309 ) ) ( not ( = ?auto_104308 ?auto_104310 ) ) ( not ( = ?auto_104308 ?auto_104311 ) ) ( not ( = ?auto_104309 ?auto_104310 ) ) ( not ( = ?auto_104309 ?auto_104311 ) ) ( not ( = ?auto_104310 ?auto_104311 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104311 ?auto_104310 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104312 - BLOCK
      ?auto_104313 - BLOCK
      ?auto_104314 - BLOCK
      ?auto_104315 - BLOCK
      ?auto_104316 - BLOCK
      ?auto_104317 - BLOCK
    )
    :vars
    (
      ?auto_104318 - BLOCK
      ?auto_104319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104318 ?auto_104317 ) ( CLEAR ?auto_104318 ) ( ON-TABLE ?auto_104312 ) ( ON ?auto_104313 ?auto_104312 ) ( ON ?auto_104314 ?auto_104313 ) ( ON ?auto_104315 ?auto_104314 ) ( ON ?auto_104316 ?auto_104315 ) ( ON ?auto_104317 ?auto_104316 ) ( not ( = ?auto_104312 ?auto_104313 ) ) ( not ( = ?auto_104312 ?auto_104314 ) ) ( not ( = ?auto_104312 ?auto_104315 ) ) ( not ( = ?auto_104312 ?auto_104316 ) ) ( not ( = ?auto_104312 ?auto_104317 ) ) ( not ( = ?auto_104312 ?auto_104318 ) ) ( not ( = ?auto_104313 ?auto_104314 ) ) ( not ( = ?auto_104313 ?auto_104315 ) ) ( not ( = ?auto_104313 ?auto_104316 ) ) ( not ( = ?auto_104313 ?auto_104317 ) ) ( not ( = ?auto_104313 ?auto_104318 ) ) ( not ( = ?auto_104314 ?auto_104315 ) ) ( not ( = ?auto_104314 ?auto_104316 ) ) ( not ( = ?auto_104314 ?auto_104317 ) ) ( not ( = ?auto_104314 ?auto_104318 ) ) ( not ( = ?auto_104315 ?auto_104316 ) ) ( not ( = ?auto_104315 ?auto_104317 ) ) ( not ( = ?auto_104315 ?auto_104318 ) ) ( not ( = ?auto_104316 ?auto_104317 ) ) ( not ( = ?auto_104316 ?auto_104318 ) ) ( not ( = ?auto_104317 ?auto_104318 ) ) ( HOLDING ?auto_104319 ) ( not ( = ?auto_104312 ?auto_104319 ) ) ( not ( = ?auto_104313 ?auto_104319 ) ) ( not ( = ?auto_104314 ?auto_104319 ) ) ( not ( = ?auto_104315 ?auto_104319 ) ) ( not ( = ?auto_104316 ?auto_104319 ) ) ( not ( = ?auto_104317 ?auto_104319 ) ) ( not ( = ?auto_104318 ?auto_104319 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_104319 )
      ( MAKE-6PILE ?auto_104312 ?auto_104313 ?auto_104314 ?auto_104315 ?auto_104316 ?auto_104317 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104320 - BLOCK
      ?auto_104321 - BLOCK
      ?auto_104322 - BLOCK
      ?auto_104323 - BLOCK
      ?auto_104324 - BLOCK
      ?auto_104325 - BLOCK
    )
    :vars
    (
      ?auto_104327 - BLOCK
      ?auto_104326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104327 ?auto_104325 ) ( ON-TABLE ?auto_104320 ) ( ON ?auto_104321 ?auto_104320 ) ( ON ?auto_104322 ?auto_104321 ) ( ON ?auto_104323 ?auto_104322 ) ( ON ?auto_104324 ?auto_104323 ) ( ON ?auto_104325 ?auto_104324 ) ( not ( = ?auto_104320 ?auto_104321 ) ) ( not ( = ?auto_104320 ?auto_104322 ) ) ( not ( = ?auto_104320 ?auto_104323 ) ) ( not ( = ?auto_104320 ?auto_104324 ) ) ( not ( = ?auto_104320 ?auto_104325 ) ) ( not ( = ?auto_104320 ?auto_104327 ) ) ( not ( = ?auto_104321 ?auto_104322 ) ) ( not ( = ?auto_104321 ?auto_104323 ) ) ( not ( = ?auto_104321 ?auto_104324 ) ) ( not ( = ?auto_104321 ?auto_104325 ) ) ( not ( = ?auto_104321 ?auto_104327 ) ) ( not ( = ?auto_104322 ?auto_104323 ) ) ( not ( = ?auto_104322 ?auto_104324 ) ) ( not ( = ?auto_104322 ?auto_104325 ) ) ( not ( = ?auto_104322 ?auto_104327 ) ) ( not ( = ?auto_104323 ?auto_104324 ) ) ( not ( = ?auto_104323 ?auto_104325 ) ) ( not ( = ?auto_104323 ?auto_104327 ) ) ( not ( = ?auto_104324 ?auto_104325 ) ) ( not ( = ?auto_104324 ?auto_104327 ) ) ( not ( = ?auto_104325 ?auto_104327 ) ) ( not ( = ?auto_104320 ?auto_104326 ) ) ( not ( = ?auto_104321 ?auto_104326 ) ) ( not ( = ?auto_104322 ?auto_104326 ) ) ( not ( = ?auto_104323 ?auto_104326 ) ) ( not ( = ?auto_104324 ?auto_104326 ) ) ( not ( = ?auto_104325 ?auto_104326 ) ) ( not ( = ?auto_104327 ?auto_104326 ) ) ( ON ?auto_104326 ?auto_104327 ) ( CLEAR ?auto_104326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104320 ?auto_104321 ?auto_104322 ?auto_104323 ?auto_104324 ?auto_104325 ?auto_104327 )
      ( MAKE-6PILE ?auto_104320 ?auto_104321 ?auto_104322 ?auto_104323 ?auto_104324 ?auto_104325 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104330 - BLOCK
      ?auto_104331 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104331 ) ( CLEAR ?auto_104330 ) ( ON-TABLE ?auto_104330 ) ( not ( = ?auto_104330 ?auto_104331 ) ) )
    :subtasks
    ( ( !STACK ?auto_104331 ?auto_104330 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104332 - BLOCK
      ?auto_104333 - BLOCK
    )
    :vars
    (
      ?auto_104334 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104332 ) ( ON-TABLE ?auto_104332 ) ( not ( = ?auto_104332 ?auto_104333 ) ) ( ON ?auto_104333 ?auto_104334 ) ( CLEAR ?auto_104333 ) ( HAND-EMPTY ) ( not ( = ?auto_104332 ?auto_104334 ) ) ( not ( = ?auto_104333 ?auto_104334 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104333 ?auto_104334 )
      ( MAKE-2PILE ?auto_104332 ?auto_104333 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104335 - BLOCK
      ?auto_104336 - BLOCK
    )
    :vars
    (
      ?auto_104337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104335 ?auto_104336 ) ) ( ON ?auto_104336 ?auto_104337 ) ( CLEAR ?auto_104336 ) ( not ( = ?auto_104335 ?auto_104337 ) ) ( not ( = ?auto_104336 ?auto_104337 ) ) ( HOLDING ?auto_104335 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104335 )
      ( MAKE-2PILE ?auto_104335 ?auto_104336 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104338 - BLOCK
      ?auto_104339 - BLOCK
    )
    :vars
    (
      ?auto_104340 - BLOCK
      ?auto_104342 - BLOCK
      ?auto_104341 - BLOCK
      ?auto_104345 - BLOCK
      ?auto_104343 - BLOCK
      ?auto_104344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104338 ?auto_104339 ) ) ( ON ?auto_104339 ?auto_104340 ) ( not ( = ?auto_104338 ?auto_104340 ) ) ( not ( = ?auto_104339 ?auto_104340 ) ) ( ON ?auto_104338 ?auto_104339 ) ( CLEAR ?auto_104338 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104342 ) ( ON ?auto_104341 ?auto_104342 ) ( ON ?auto_104345 ?auto_104341 ) ( ON ?auto_104343 ?auto_104345 ) ( ON ?auto_104344 ?auto_104343 ) ( ON ?auto_104340 ?auto_104344 ) ( not ( = ?auto_104342 ?auto_104341 ) ) ( not ( = ?auto_104342 ?auto_104345 ) ) ( not ( = ?auto_104342 ?auto_104343 ) ) ( not ( = ?auto_104342 ?auto_104344 ) ) ( not ( = ?auto_104342 ?auto_104340 ) ) ( not ( = ?auto_104342 ?auto_104339 ) ) ( not ( = ?auto_104342 ?auto_104338 ) ) ( not ( = ?auto_104341 ?auto_104345 ) ) ( not ( = ?auto_104341 ?auto_104343 ) ) ( not ( = ?auto_104341 ?auto_104344 ) ) ( not ( = ?auto_104341 ?auto_104340 ) ) ( not ( = ?auto_104341 ?auto_104339 ) ) ( not ( = ?auto_104341 ?auto_104338 ) ) ( not ( = ?auto_104345 ?auto_104343 ) ) ( not ( = ?auto_104345 ?auto_104344 ) ) ( not ( = ?auto_104345 ?auto_104340 ) ) ( not ( = ?auto_104345 ?auto_104339 ) ) ( not ( = ?auto_104345 ?auto_104338 ) ) ( not ( = ?auto_104343 ?auto_104344 ) ) ( not ( = ?auto_104343 ?auto_104340 ) ) ( not ( = ?auto_104343 ?auto_104339 ) ) ( not ( = ?auto_104343 ?auto_104338 ) ) ( not ( = ?auto_104344 ?auto_104340 ) ) ( not ( = ?auto_104344 ?auto_104339 ) ) ( not ( = ?auto_104344 ?auto_104338 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104342 ?auto_104341 ?auto_104345 ?auto_104343 ?auto_104344 ?auto_104340 ?auto_104339 )
      ( MAKE-2PILE ?auto_104338 ?auto_104339 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104351 - BLOCK
      ?auto_104352 - BLOCK
      ?auto_104353 - BLOCK
      ?auto_104354 - BLOCK
      ?auto_104355 - BLOCK
    )
    :vars
    (
      ?auto_104356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104356 ?auto_104355 ) ( CLEAR ?auto_104356 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104351 ) ( ON ?auto_104352 ?auto_104351 ) ( ON ?auto_104353 ?auto_104352 ) ( ON ?auto_104354 ?auto_104353 ) ( ON ?auto_104355 ?auto_104354 ) ( not ( = ?auto_104351 ?auto_104352 ) ) ( not ( = ?auto_104351 ?auto_104353 ) ) ( not ( = ?auto_104351 ?auto_104354 ) ) ( not ( = ?auto_104351 ?auto_104355 ) ) ( not ( = ?auto_104351 ?auto_104356 ) ) ( not ( = ?auto_104352 ?auto_104353 ) ) ( not ( = ?auto_104352 ?auto_104354 ) ) ( not ( = ?auto_104352 ?auto_104355 ) ) ( not ( = ?auto_104352 ?auto_104356 ) ) ( not ( = ?auto_104353 ?auto_104354 ) ) ( not ( = ?auto_104353 ?auto_104355 ) ) ( not ( = ?auto_104353 ?auto_104356 ) ) ( not ( = ?auto_104354 ?auto_104355 ) ) ( not ( = ?auto_104354 ?auto_104356 ) ) ( not ( = ?auto_104355 ?auto_104356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104356 ?auto_104355 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104357 - BLOCK
      ?auto_104358 - BLOCK
      ?auto_104359 - BLOCK
      ?auto_104360 - BLOCK
      ?auto_104361 - BLOCK
    )
    :vars
    (
      ?auto_104362 - BLOCK
      ?auto_104363 - BLOCK
      ?auto_104364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104362 ?auto_104361 ) ( CLEAR ?auto_104362 ) ( ON-TABLE ?auto_104357 ) ( ON ?auto_104358 ?auto_104357 ) ( ON ?auto_104359 ?auto_104358 ) ( ON ?auto_104360 ?auto_104359 ) ( ON ?auto_104361 ?auto_104360 ) ( not ( = ?auto_104357 ?auto_104358 ) ) ( not ( = ?auto_104357 ?auto_104359 ) ) ( not ( = ?auto_104357 ?auto_104360 ) ) ( not ( = ?auto_104357 ?auto_104361 ) ) ( not ( = ?auto_104357 ?auto_104362 ) ) ( not ( = ?auto_104358 ?auto_104359 ) ) ( not ( = ?auto_104358 ?auto_104360 ) ) ( not ( = ?auto_104358 ?auto_104361 ) ) ( not ( = ?auto_104358 ?auto_104362 ) ) ( not ( = ?auto_104359 ?auto_104360 ) ) ( not ( = ?auto_104359 ?auto_104361 ) ) ( not ( = ?auto_104359 ?auto_104362 ) ) ( not ( = ?auto_104360 ?auto_104361 ) ) ( not ( = ?auto_104360 ?auto_104362 ) ) ( not ( = ?auto_104361 ?auto_104362 ) ) ( HOLDING ?auto_104363 ) ( CLEAR ?auto_104364 ) ( not ( = ?auto_104357 ?auto_104363 ) ) ( not ( = ?auto_104357 ?auto_104364 ) ) ( not ( = ?auto_104358 ?auto_104363 ) ) ( not ( = ?auto_104358 ?auto_104364 ) ) ( not ( = ?auto_104359 ?auto_104363 ) ) ( not ( = ?auto_104359 ?auto_104364 ) ) ( not ( = ?auto_104360 ?auto_104363 ) ) ( not ( = ?auto_104360 ?auto_104364 ) ) ( not ( = ?auto_104361 ?auto_104363 ) ) ( not ( = ?auto_104361 ?auto_104364 ) ) ( not ( = ?auto_104362 ?auto_104363 ) ) ( not ( = ?auto_104362 ?auto_104364 ) ) ( not ( = ?auto_104363 ?auto_104364 ) ) )
    :subtasks
    ( ( !STACK ?auto_104363 ?auto_104364 )
      ( MAKE-5PILE ?auto_104357 ?auto_104358 ?auto_104359 ?auto_104360 ?auto_104361 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104365 - BLOCK
      ?auto_104366 - BLOCK
      ?auto_104367 - BLOCK
      ?auto_104368 - BLOCK
      ?auto_104369 - BLOCK
    )
    :vars
    (
      ?auto_104371 - BLOCK
      ?auto_104370 - BLOCK
      ?auto_104372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104371 ?auto_104369 ) ( ON-TABLE ?auto_104365 ) ( ON ?auto_104366 ?auto_104365 ) ( ON ?auto_104367 ?auto_104366 ) ( ON ?auto_104368 ?auto_104367 ) ( ON ?auto_104369 ?auto_104368 ) ( not ( = ?auto_104365 ?auto_104366 ) ) ( not ( = ?auto_104365 ?auto_104367 ) ) ( not ( = ?auto_104365 ?auto_104368 ) ) ( not ( = ?auto_104365 ?auto_104369 ) ) ( not ( = ?auto_104365 ?auto_104371 ) ) ( not ( = ?auto_104366 ?auto_104367 ) ) ( not ( = ?auto_104366 ?auto_104368 ) ) ( not ( = ?auto_104366 ?auto_104369 ) ) ( not ( = ?auto_104366 ?auto_104371 ) ) ( not ( = ?auto_104367 ?auto_104368 ) ) ( not ( = ?auto_104367 ?auto_104369 ) ) ( not ( = ?auto_104367 ?auto_104371 ) ) ( not ( = ?auto_104368 ?auto_104369 ) ) ( not ( = ?auto_104368 ?auto_104371 ) ) ( not ( = ?auto_104369 ?auto_104371 ) ) ( CLEAR ?auto_104370 ) ( not ( = ?auto_104365 ?auto_104372 ) ) ( not ( = ?auto_104365 ?auto_104370 ) ) ( not ( = ?auto_104366 ?auto_104372 ) ) ( not ( = ?auto_104366 ?auto_104370 ) ) ( not ( = ?auto_104367 ?auto_104372 ) ) ( not ( = ?auto_104367 ?auto_104370 ) ) ( not ( = ?auto_104368 ?auto_104372 ) ) ( not ( = ?auto_104368 ?auto_104370 ) ) ( not ( = ?auto_104369 ?auto_104372 ) ) ( not ( = ?auto_104369 ?auto_104370 ) ) ( not ( = ?auto_104371 ?auto_104372 ) ) ( not ( = ?auto_104371 ?auto_104370 ) ) ( not ( = ?auto_104372 ?auto_104370 ) ) ( ON ?auto_104372 ?auto_104371 ) ( CLEAR ?auto_104372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104365 ?auto_104366 ?auto_104367 ?auto_104368 ?auto_104369 ?auto_104371 )
      ( MAKE-5PILE ?auto_104365 ?auto_104366 ?auto_104367 ?auto_104368 ?auto_104369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104373 - BLOCK
      ?auto_104374 - BLOCK
      ?auto_104375 - BLOCK
      ?auto_104376 - BLOCK
      ?auto_104377 - BLOCK
    )
    :vars
    (
      ?auto_104380 - BLOCK
      ?auto_104378 - BLOCK
      ?auto_104379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104380 ?auto_104377 ) ( ON-TABLE ?auto_104373 ) ( ON ?auto_104374 ?auto_104373 ) ( ON ?auto_104375 ?auto_104374 ) ( ON ?auto_104376 ?auto_104375 ) ( ON ?auto_104377 ?auto_104376 ) ( not ( = ?auto_104373 ?auto_104374 ) ) ( not ( = ?auto_104373 ?auto_104375 ) ) ( not ( = ?auto_104373 ?auto_104376 ) ) ( not ( = ?auto_104373 ?auto_104377 ) ) ( not ( = ?auto_104373 ?auto_104380 ) ) ( not ( = ?auto_104374 ?auto_104375 ) ) ( not ( = ?auto_104374 ?auto_104376 ) ) ( not ( = ?auto_104374 ?auto_104377 ) ) ( not ( = ?auto_104374 ?auto_104380 ) ) ( not ( = ?auto_104375 ?auto_104376 ) ) ( not ( = ?auto_104375 ?auto_104377 ) ) ( not ( = ?auto_104375 ?auto_104380 ) ) ( not ( = ?auto_104376 ?auto_104377 ) ) ( not ( = ?auto_104376 ?auto_104380 ) ) ( not ( = ?auto_104377 ?auto_104380 ) ) ( not ( = ?auto_104373 ?auto_104378 ) ) ( not ( = ?auto_104373 ?auto_104379 ) ) ( not ( = ?auto_104374 ?auto_104378 ) ) ( not ( = ?auto_104374 ?auto_104379 ) ) ( not ( = ?auto_104375 ?auto_104378 ) ) ( not ( = ?auto_104375 ?auto_104379 ) ) ( not ( = ?auto_104376 ?auto_104378 ) ) ( not ( = ?auto_104376 ?auto_104379 ) ) ( not ( = ?auto_104377 ?auto_104378 ) ) ( not ( = ?auto_104377 ?auto_104379 ) ) ( not ( = ?auto_104380 ?auto_104378 ) ) ( not ( = ?auto_104380 ?auto_104379 ) ) ( not ( = ?auto_104378 ?auto_104379 ) ) ( ON ?auto_104378 ?auto_104380 ) ( CLEAR ?auto_104378 ) ( HOLDING ?auto_104379 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104379 )
      ( MAKE-5PILE ?auto_104373 ?auto_104374 ?auto_104375 ?auto_104376 ?auto_104377 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104381 - BLOCK
      ?auto_104382 - BLOCK
      ?auto_104383 - BLOCK
      ?auto_104384 - BLOCK
      ?auto_104385 - BLOCK
    )
    :vars
    (
      ?auto_104387 - BLOCK
      ?auto_104386 - BLOCK
      ?auto_104388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104387 ?auto_104385 ) ( ON-TABLE ?auto_104381 ) ( ON ?auto_104382 ?auto_104381 ) ( ON ?auto_104383 ?auto_104382 ) ( ON ?auto_104384 ?auto_104383 ) ( ON ?auto_104385 ?auto_104384 ) ( not ( = ?auto_104381 ?auto_104382 ) ) ( not ( = ?auto_104381 ?auto_104383 ) ) ( not ( = ?auto_104381 ?auto_104384 ) ) ( not ( = ?auto_104381 ?auto_104385 ) ) ( not ( = ?auto_104381 ?auto_104387 ) ) ( not ( = ?auto_104382 ?auto_104383 ) ) ( not ( = ?auto_104382 ?auto_104384 ) ) ( not ( = ?auto_104382 ?auto_104385 ) ) ( not ( = ?auto_104382 ?auto_104387 ) ) ( not ( = ?auto_104383 ?auto_104384 ) ) ( not ( = ?auto_104383 ?auto_104385 ) ) ( not ( = ?auto_104383 ?auto_104387 ) ) ( not ( = ?auto_104384 ?auto_104385 ) ) ( not ( = ?auto_104384 ?auto_104387 ) ) ( not ( = ?auto_104385 ?auto_104387 ) ) ( not ( = ?auto_104381 ?auto_104386 ) ) ( not ( = ?auto_104381 ?auto_104388 ) ) ( not ( = ?auto_104382 ?auto_104386 ) ) ( not ( = ?auto_104382 ?auto_104388 ) ) ( not ( = ?auto_104383 ?auto_104386 ) ) ( not ( = ?auto_104383 ?auto_104388 ) ) ( not ( = ?auto_104384 ?auto_104386 ) ) ( not ( = ?auto_104384 ?auto_104388 ) ) ( not ( = ?auto_104385 ?auto_104386 ) ) ( not ( = ?auto_104385 ?auto_104388 ) ) ( not ( = ?auto_104387 ?auto_104386 ) ) ( not ( = ?auto_104387 ?auto_104388 ) ) ( not ( = ?auto_104386 ?auto_104388 ) ) ( ON ?auto_104386 ?auto_104387 ) ( ON ?auto_104388 ?auto_104386 ) ( CLEAR ?auto_104388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104381 ?auto_104382 ?auto_104383 ?auto_104384 ?auto_104385 ?auto_104387 ?auto_104386 )
      ( MAKE-5PILE ?auto_104381 ?auto_104382 ?auto_104383 ?auto_104384 ?auto_104385 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104392 - BLOCK
      ?auto_104393 - BLOCK
      ?auto_104394 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104394 ) ( CLEAR ?auto_104393 ) ( ON-TABLE ?auto_104392 ) ( ON ?auto_104393 ?auto_104392 ) ( not ( = ?auto_104392 ?auto_104393 ) ) ( not ( = ?auto_104392 ?auto_104394 ) ) ( not ( = ?auto_104393 ?auto_104394 ) ) )
    :subtasks
    ( ( !STACK ?auto_104394 ?auto_104393 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104395 - BLOCK
      ?auto_104396 - BLOCK
      ?auto_104397 - BLOCK
    )
    :vars
    (
      ?auto_104398 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104396 ) ( ON-TABLE ?auto_104395 ) ( ON ?auto_104396 ?auto_104395 ) ( not ( = ?auto_104395 ?auto_104396 ) ) ( not ( = ?auto_104395 ?auto_104397 ) ) ( not ( = ?auto_104396 ?auto_104397 ) ) ( ON ?auto_104397 ?auto_104398 ) ( CLEAR ?auto_104397 ) ( HAND-EMPTY ) ( not ( = ?auto_104395 ?auto_104398 ) ) ( not ( = ?auto_104396 ?auto_104398 ) ) ( not ( = ?auto_104397 ?auto_104398 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104397 ?auto_104398 )
      ( MAKE-3PILE ?auto_104395 ?auto_104396 ?auto_104397 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104399 - BLOCK
      ?auto_104400 - BLOCK
      ?auto_104401 - BLOCK
    )
    :vars
    (
      ?auto_104402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104399 ) ( not ( = ?auto_104399 ?auto_104400 ) ) ( not ( = ?auto_104399 ?auto_104401 ) ) ( not ( = ?auto_104400 ?auto_104401 ) ) ( ON ?auto_104401 ?auto_104402 ) ( CLEAR ?auto_104401 ) ( not ( = ?auto_104399 ?auto_104402 ) ) ( not ( = ?auto_104400 ?auto_104402 ) ) ( not ( = ?auto_104401 ?auto_104402 ) ) ( HOLDING ?auto_104400 ) ( CLEAR ?auto_104399 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104399 ?auto_104400 )
      ( MAKE-3PILE ?auto_104399 ?auto_104400 ?auto_104401 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104403 - BLOCK
      ?auto_104404 - BLOCK
      ?auto_104405 - BLOCK
    )
    :vars
    (
      ?auto_104406 - BLOCK
      ?auto_104408 - BLOCK
      ?auto_104410 - BLOCK
      ?auto_104409 - BLOCK
      ?auto_104407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104403 ) ( not ( = ?auto_104403 ?auto_104404 ) ) ( not ( = ?auto_104403 ?auto_104405 ) ) ( not ( = ?auto_104404 ?auto_104405 ) ) ( ON ?auto_104405 ?auto_104406 ) ( not ( = ?auto_104403 ?auto_104406 ) ) ( not ( = ?auto_104404 ?auto_104406 ) ) ( not ( = ?auto_104405 ?auto_104406 ) ) ( CLEAR ?auto_104403 ) ( ON ?auto_104404 ?auto_104405 ) ( CLEAR ?auto_104404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104408 ) ( ON ?auto_104410 ?auto_104408 ) ( ON ?auto_104409 ?auto_104410 ) ( ON ?auto_104407 ?auto_104409 ) ( ON ?auto_104406 ?auto_104407 ) ( not ( = ?auto_104408 ?auto_104410 ) ) ( not ( = ?auto_104408 ?auto_104409 ) ) ( not ( = ?auto_104408 ?auto_104407 ) ) ( not ( = ?auto_104408 ?auto_104406 ) ) ( not ( = ?auto_104408 ?auto_104405 ) ) ( not ( = ?auto_104408 ?auto_104404 ) ) ( not ( = ?auto_104410 ?auto_104409 ) ) ( not ( = ?auto_104410 ?auto_104407 ) ) ( not ( = ?auto_104410 ?auto_104406 ) ) ( not ( = ?auto_104410 ?auto_104405 ) ) ( not ( = ?auto_104410 ?auto_104404 ) ) ( not ( = ?auto_104409 ?auto_104407 ) ) ( not ( = ?auto_104409 ?auto_104406 ) ) ( not ( = ?auto_104409 ?auto_104405 ) ) ( not ( = ?auto_104409 ?auto_104404 ) ) ( not ( = ?auto_104407 ?auto_104406 ) ) ( not ( = ?auto_104407 ?auto_104405 ) ) ( not ( = ?auto_104407 ?auto_104404 ) ) ( not ( = ?auto_104403 ?auto_104408 ) ) ( not ( = ?auto_104403 ?auto_104410 ) ) ( not ( = ?auto_104403 ?auto_104409 ) ) ( not ( = ?auto_104403 ?auto_104407 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104408 ?auto_104410 ?auto_104409 ?auto_104407 ?auto_104406 ?auto_104405 )
      ( MAKE-3PILE ?auto_104403 ?auto_104404 ?auto_104405 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104411 - BLOCK
      ?auto_104412 - BLOCK
      ?auto_104413 - BLOCK
    )
    :vars
    (
      ?auto_104417 - BLOCK
      ?auto_104418 - BLOCK
      ?auto_104414 - BLOCK
      ?auto_104416 - BLOCK
      ?auto_104415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104411 ?auto_104412 ) ) ( not ( = ?auto_104411 ?auto_104413 ) ) ( not ( = ?auto_104412 ?auto_104413 ) ) ( ON ?auto_104413 ?auto_104417 ) ( not ( = ?auto_104411 ?auto_104417 ) ) ( not ( = ?auto_104412 ?auto_104417 ) ) ( not ( = ?auto_104413 ?auto_104417 ) ) ( ON ?auto_104412 ?auto_104413 ) ( CLEAR ?auto_104412 ) ( ON-TABLE ?auto_104418 ) ( ON ?auto_104414 ?auto_104418 ) ( ON ?auto_104416 ?auto_104414 ) ( ON ?auto_104415 ?auto_104416 ) ( ON ?auto_104417 ?auto_104415 ) ( not ( = ?auto_104418 ?auto_104414 ) ) ( not ( = ?auto_104418 ?auto_104416 ) ) ( not ( = ?auto_104418 ?auto_104415 ) ) ( not ( = ?auto_104418 ?auto_104417 ) ) ( not ( = ?auto_104418 ?auto_104413 ) ) ( not ( = ?auto_104418 ?auto_104412 ) ) ( not ( = ?auto_104414 ?auto_104416 ) ) ( not ( = ?auto_104414 ?auto_104415 ) ) ( not ( = ?auto_104414 ?auto_104417 ) ) ( not ( = ?auto_104414 ?auto_104413 ) ) ( not ( = ?auto_104414 ?auto_104412 ) ) ( not ( = ?auto_104416 ?auto_104415 ) ) ( not ( = ?auto_104416 ?auto_104417 ) ) ( not ( = ?auto_104416 ?auto_104413 ) ) ( not ( = ?auto_104416 ?auto_104412 ) ) ( not ( = ?auto_104415 ?auto_104417 ) ) ( not ( = ?auto_104415 ?auto_104413 ) ) ( not ( = ?auto_104415 ?auto_104412 ) ) ( not ( = ?auto_104411 ?auto_104418 ) ) ( not ( = ?auto_104411 ?auto_104414 ) ) ( not ( = ?auto_104411 ?auto_104416 ) ) ( not ( = ?auto_104411 ?auto_104415 ) ) ( HOLDING ?auto_104411 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104411 )
      ( MAKE-3PILE ?auto_104411 ?auto_104412 ?auto_104413 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104419 - BLOCK
      ?auto_104420 - BLOCK
      ?auto_104421 - BLOCK
    )
    :vars
    (
      ?auto_104424 - BLOCK
      ?auto_104423 - BLOCK
      ?auto_104422 - BLOCK
      ?auto_104426 - BLOCK
      ?auto_104425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104419 ?auto_104420 ) ) ( not ( = ?auto_104419 ?auto_104421 ) ) ( not ( = ?auto_104420 ?auto_104421 ) ) ( ON ?auto_104421 ?auto_104424 ) ( not ( = ?auto_104419 ?auto_104424 ) ) ( not ( = ?auto_104420 ?auto_104424 ) ) ( not ( = ?auto_104421 ?auto_104424 ) ) ( ON ?auto_104420 ?auto_104421 ) ( ON-TABLE ?auto_104423 ) ( ON ?auto_104422 ?auto_104423 ) ( ON ?auto_104426 ?auto_104422 ) ( ON ?auto_104425 ?auto_104426 ) ( ON ?auto_104424 ?auto_104425 ) ( not ( = ?auto_104423 ?auto_104422 ) ) ( not ( = ?auto_104423 ?auto_104426 ) ) ( not ( = ?auto_104423 ?auto_104425 ) ) ( not ( = ?auto_104423 ?auto_104424 ) ) ( not ( = ?auto_104423 ?auto_104421 ) ) ( not ( = ?auto_104423 ?auto_104420 ) ) ( not ( = ?auto_104422 ?auto_104426 ) ) ( not ( = ?auto_104422 ?auto_104425 ) ) ( not ( = ?auto_104422 ?auto_104424 ) ) ( not ( = ?auto_104422 ?auto_104421 ) ) ( not ( = ?auto_104422 ?auto_104420 ) ) ( not ( = ?auto_104426 ?auto_104425 ) ) ( not ( = ?auto_104426 ?auto_104424 ) ) ( not ( = ?auto_104426 ?auto_104421 ) ) ( not ( = ?auto_104426 ?auto_104420 ) ) ( not ( = ?auto_104425 ?auto_104424 ) ) ( not ( = ?auto_104425 ?auto_104421 ) ) ( not ( = ?auto_104425 ?auto_104420 ) ) ( not ( = ?auto_104419 ?auto_104423 ) ) ( not ( = ?auto_104419 ?auto_104422 ) ) ( not ( = ?auto_104419 ?auto_104426 ) ) ( not ( = ?auto_104419 ?auto_104425 ) ) ( ON ?auto_104419 ?auto_104420 ) ( CLEAR ?auto_104419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104423 ?auto_104422 ?auto_104426 ?auto_104425 ?auto_104424 ?auto_104421 ?auto_104420 )
      ( MAKE-3PILE ?auto_104419 ?auto_104420 ?auto_104421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104431 - BLOCK
      ?auto_104432 - BLOCK
      ?auto_104433 - BLOCK
      ?auto_104434 - BLOCK
    )
    :vars
    (
      ?auto_104435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104435 ?auto_104434 ) ( CLEAR ?auto_104435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104431 ) ( ON ?auto_104432 ?auto_104431 ) ( ON ?auto_104433 ?auto_104432 ) ( ON ?auto_104434 ?auto_104433 ) ( not ( = ?auto_104431 ?auto_104432 ) ) ( not ( = ?auto_104431 ?auto_104433 ) ) ( not ( = ?auto_104431 ?auto_104434 ) ) ( not ( = ?auto_104431 ?auto_104435 ) ) ( not ( = ?auto_104432 ?auto_104433 ) ) ( not ( = ?auto_104432 ?auto_104434 ) ) ( not ( = ?auto_104432 ?auto_104435 ) ) ( not ( = ?auto_104433 ?auto_104434 ) ) ( not ( = ?auto_104433 ?auto_104435 ) ) ( not ( = ?auto_104434 ?auto_104435 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104435 ?auto_104434 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104436 - BLOCK
      ?auto_104437 - BLOCK
      ?auto_104438 - BLOCK
      ?auto_104439 - BLOCK
    )
    :vars
    (
      ?auto_104440 - BLOCK
      ?auto_104441 - BLOCK
      ?auto_104442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104440 ?auto_104439 ) ( CLEAR ?auto_104440 ) ( ON-TABLE ?auto_104436 ) ( ON ?auto_104437 ?auto_104436 ) ( ON ?auto_104438 ?auto_104437 ) ( ON ?auto_104439 ?auto_104438 ) ( not ( = ?auto_104436 ?auto_104437 ) ) ( not ( = ?auto_104436 ?auto_104438 ) ) ( not ( = ?auto_104436 ?auto_104439 ) ) ( not ( = ?auto_104436 ?auto_104440 ) ) ( not ( = ?auto_104437 ?auto_104438 ) ) ( not ( = ?auto_104437 ?auto_104439 ) ) ( not ( = ?auto_104437 ?auto_104440 ) ) ( not ( = ?auto_104438 ?auto_104439 ) ) ( not ( = ?auto_104438 ?auto_104440 ) ) ( not ( = ?auto_104439 ?auto_104440 ) ) ( HOLDING ?auto_104441 ) ( CLEAR ?auto_104442 ) ( not ( = ?auto_104436 ?auto_104441 ) ) ( not ( = ?auto_104436 ?auto_104442 ) ) ( not ( = ?auto_104437 ?auto_104441 ) ) ( not ( = ?auto_104437 ?auto_104442 ) ) ( not ( = ?auto_104438 ?auto_104441 ) ) ( not ( = ?auto_104438 ?auto_104442 ) ) ( not ( = ?auto_104439 ?auto_104441 ) ) ( not ( = ?auto_104439 ?auto_104442 ) ) ( not ( = ?auto_104440 ?auto_104441 ) ) ( not ( = ?auto_104440 ?auto_104442 ) ) ( not ( = ?auto_104441 ?auto_104442 ) ) )
    :subtasks
    ( ( !STACK ?auto_104441 ?auto_104442 )
      ( MAKE-4PILE ?auto_104436 ?auto_104437 ?auto_104438 ?auto_104439 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104443 - BLOCK
      ?auto_104444 - BLOCK
      ?auto_104445 - BLOCK
      ?auto_104446 - BLOCK
    )
    :vars
    (
      ?auto_104449 - BLOCK
      ?auto_104447 - BLOCK
      ?auto_104448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104449 ?auto_104446 ) ( ON-TABLE ?auto_104443 ) ( ON ?auto_104444 ?auto_104443 ) ( ON ?auto_104445 ?auto_104444 ) ( ON ?auto_104446 ?auto_104445 ) ( not ( = ?auto_104443 ?auto_104444 ) ) ( not ( = ?auto_104443 ?auto_104445 ) ) ( not ( = ?auto_104443 ?auto_104446 ) ) ( not ( = ?auto_104443 ?auto_104449 ) ) ( not ( = ?auto_104444 ?auto_104445 ) ) ( not ( = ?auto_104444 ?auto_104446 ) ) ( not ( = ?auto_104444 ?auto_104449 ) ) ( not ( = ?auto_104445 ?auto_104446 ) ) ( not ( = ?auto_104445 ?auto_104449 ) ) ( not ( = ?auto_104446 ?auto_104449 ) ) ( CLEAR ?auto_104447 ) ( not ( = ?auto_104443 ?auto_104448 ) ) ( not ( = ?auto_104443 ?auto_104447 ) ) ( not ( = ?auto_104444 ?auto_104448 ) ) ( not ( = ?auto_104444 ?auto_104447 ) ) ( not ( = ?auto_104445 ?auto_104448 ) ) ( not ( = ?auto_104445 ?auto_104447 ) ) ( not ( = ?auto_104446 ?auto_104448 ) ) ( not ( = ?auto_104446 ?auto_104447 ) ) ( not ( = ?auto_104449 ?auto_104448 ) ) ( not ( = ?auto_104449 ?auto_104447 ) ) ( not ( = ?auto_104448 ?auto_104447 ) ) ( ON ?auto_104448 ?auto_104449 ) ( CLEAR ?auto_104448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104443 ?auto_104444 ?auto_104445 ?auto_104446 ?auto_104449 )
      ( MAKE-4PILE ?auto_104443 ?auto_104444 ?auto_104445 ?auto_104446 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104450 - BLOCK
      ?auto_104451 - BLOCK
      ?auto_104452 - BLOCK
      ?auto_104453 - BLOCK
    )
    :vars
    (
      ?auto_104456 - BLOCK
      ?auto_104455 - BLOCK
      ?auto_104454 - BLOCK
      ?auto_104457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104456 ?auto_104453 ) ( ON-TABLE ?auto_104450 ) ( ON ?auto_104451 ?auto_104450 ) ( ON ?auto_104452 ?auto_104451 ) ( ON ?auto_104453 ?auto_104452 ) ( not ( = ?auto_104450 ?auto_104451 ) ) ( not ( = ?auto_104450 ?auto_104452 ) ) ( not ( = ?auto_104450 ?auto_104453 ) ) ( not ( = ?auto_104450 ?auto_104456 ) ) ( not ( = ?auto_104451 ?auto_104452 ) ) ( not ( = ?auto_104451 ?auto_104453 ) ) ( not ( = ?auto_104451 ?auto_104456 ) ) ( not ( = ?auto_104452 ?auto_104453 ) ) ( not ( = ?auto_104452 ?auto_104456 ) ) ( not ( = ?auto_104453 ?auto_104456 ) ) ( not ( = ?auto_104450 ?auto_104455 ) ) ( not ( = ?auto_104450 ?auto_104454 ) ) ( not ( = ?auto_104451 ?auto_104455 ) ) ( not ( = ?auto_104451 ?auto_104454 ) ) ( not ( = ?auto_104452 ?auto_104455 ) ) ( not ( = ?auto_104452 ?auto_104454 ) ) ( not ( = ?auto_104453 ?auto_104455 ) ) ( not ( = ?auto_104453 ?auto_104454 ) ) ( not ( = ?auto_104456 ?auto_104455 ) ) ( not ( = ?auto_104456 ?auto_104454 ) ) ( not ( = ?auto_104455 ?auto_104454 ) ) ( ON ?auto_104455 ?auto_104456 ) ( CLEAR ?auto_104455 ) ( HOLDING ?auto_104454 ) ( CLEAR ?auto_104457 ) ( ON-TABLE ?auto_104457 ) ( not ( = ?auto_104457 ?auto_104454 ) ) ( not ( = ?auto_104450 ?auto_104457 ) ) ( not ( = ?auto_104451 ?auto_104457 ) ) ( not ( = ?auto_104452 ?auto_104457 ) ) ( not ( = ?auto_104453 ?auto_104457 ) ) ( not ( = ?auto_104456 ?auto_104457 ) ) ( not ( = ?auto_104455 ?auto_104457 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104457 ?auto_104454 )
      ( MAKE-4PILE ?auto_104450 ?auto_104451 ?auto_104452 ?auto_104453 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104458 - BLOCK
      ?auto_104459 - BLOCK
      ?auto_104460 - BLOCK
      ?auto_104461 - BLOCK
    )
    :vars
    (
      ?auto_104462 - BLOCK
      ?auto_104464 - BLOCK
      ?auto_104463 - BLOCK
      ?auto_104465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104462 ?auto_104461 ) ( ON-TABLE ?auto_104458 ) ( ON ?auto_104459 ?auto_104458 ) ( ON ?auto_104460 ?auto_104459 ) ( ON ?auto_104461 ?auto_104460 ) ( not ( = ?auto_104458 ?auto_104459 ) ) ( not ( = ?auto_104458 ?auto_104460 ) ) ( not ( = ?auto_104458 ?auto_104461 ) ) ( not ( = ?auto_104458 ?auto_104462 ) ) ( not ( = ?auto_104459 ?auto_104460 ) ) ( not ( = ?auto_104459 ?auto_104461 ) ) ( not ( = ?auto_104459 ?auto_104462 ) ) ( not ( = ?auto_104460 ?auto_104461 ) ) ( not ( = ?auto_104460 ?auto_104462 ) ) ( not ( = ?auto_104461 ?auto_104462 ) ) ( not ( = ?auto_104458 ?auto_104464 ) ) ( not ( = ?auto_104458 ?auto_104463 ) ) ( not ( = ?auto_104459 ?auto_104464 ) ) ( not ( = ?auto_104459 ?auto_104463 ) ) ( not ( = ?auto_104460 ?auto_104464 ) ) ( not ( = ?auto_104460 ?auto_104463 ) ) ( not ( = ?auto_104461 ?auto_104464 ) ) ( not ( = ?auto_104461 ?auto_104463 ) ) ( not ( = ?auto_104462 ?auto_104464 ) ) ( not ( = ?auto_104462 ?auto_104463 ) ) ( not ( = ?auto_104464 ?auto_104463 ) ) ( ON ?auto_104464 ?auto_104462 ) ( CLEAR ?auto_104465 ) ( ON-TABLE ?auto_104465 ) ( not ( = ?auto_104465 ?auto_104463 ) ) ( not ( = ?auto_104458 ?auto_104465 ) ) ( not ( = ?auto_104459 ?auto_104465 ) ) ( not ( = ?auto_104460 ?auto_104465 ) ) ( not ( = ?auto_104461 ?auto_104465 ) ) ( not ( = ?auto_104462 ?auto_104465 ) ) ( not ( = ?auto_104464 ?auto_104465 ) ) ( ON ?auto_104463 ?auto_104464 ) ( CLEAR ?auto_104463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104458 ?auto_104459 ?auto_104460 ?auto_104461 ?auto_104462 ?auto_104464 )
      ( MAKE-4PILE ?auto_104458 ?auto_104459 ?auto_104460 ?auto_104461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104466 - BLOCK
      ?auto_104467 - BLOCK
      ?auto_104468 - BLOCK
      ?auto_104469 - BLOCK
    )
    :vars
    (
      ?auto_104470 - BLOCK
      ?auto_104473 - BLOCK
      ?auto_104471 - BLOCK
      ?auto_104472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104470 ?auto_104469 ) ( ON-TABLE ?auto_104466 ) ( ON ?auto_104467 ?auto_104466 ) ( ON ?auto_104468 ?auto_104467 ) ( ON ?auto_104469 ?auto_104468 ) ( not ( = ?auto_104466 ?auto_104467 ) ) ( not ( = ?auto_104466 ?auto_104468 ) ) ( not ( = ?auto_104466 ?auto_104469 ) ) ( not ( = ?auto_104466 ?auto_104470 ) ) ( not ( = ?auto_104467 ?auto_104468 ) ) ( not ( = ?auto_104467 ?auto_104469 ) ) ( not ( = ?auto_104467 ?auto_104470 ) ) ( not ( = ?auto_104468 ?auto_104469 ) ) ( not ( = ?auto_104468 ?auto_104470 ) ) ( not ( = ?auto_104469 ?auto_104470 ) ) ( not ( = ?auto_104466 ?auto_104473 ) ) ( not ( = ?auto_104466 ?auto_104471 ) ) ( not ( = ?auto_104467 ?auto_104473 ) ) ( not ( = ?auto_104467 ?auto_104471 ) ) ( not ( = ?auto_104468 ?auto_104473 ) ) ( not ( = ?auto_104468 ?auto_104471 ) ) ( not ( = ?auto_104469 ?auto_104473 ) ) ( not ( = ?auto_104469 ?auto_104471 ) ) ( not ( = ?auto_104470 ?auto_104473 ) ) ( not ( = ?auto_104470 ?auto_104471 ) ) ( not ( = ?auto_104473 ?auto_104471 ) ) ( ON ?auto_104473 ?auto_104470 ) ( not ( = ?auto_104472 ?auto_104471 ) ) ( not ( = ?auto_104466 ?auto_104472 ) ) ( not ( = ?auto_104467 ?auto_104472 ) ) ( not ( = ?auto_104468 ?auto_104472 ) ) ( not ( = ?auto_104469 ?auto_104472 ) ) ( not ( = ?auto_104470 ?auto_104472 ) ) ( not ( = ?auto_104473 ?auto_104472 ) ) ( ON ?auto_104471 ?auto_104473 ) ( CLEAR ?auto_104471 ) ( HOLDING ?auto_104472 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104472 )
      ( MAKE-4PILE ?auto_104466 ?auto_104467 ?auto_104468 ?auto_104469 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104474 - BLOCK
      ?auto_104475 - BLOCK
      ?auto_104476 - BLOCK
      ?auto_104477 - BLOCK
    )
    :vars
    (
      ?auto_104478 - BLOCK
      ?auto_104479 - BLOCK
      ?auto_104481 - BLOCK
      ?auto_104480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104478 ?auto_104477 ) ( ON-TABLE ?auto_104474 ) ( ON ?auto_104475 ?auto_104474 ) ( ON ?auto_104476 ?auto_104475 ) ( ON ?auto_104477 ?auto_104476 ) ( not ( = ?auto_104474 ?auto_104475 ) ) ( not ( = ?auto_104474 ?auto_104476 ) ) ( not ( = ?auto_104474 ?auto_104477 ) ) ( not ( = ?auto_104474 ?auto_104478 ) ) ( not ( = ?auto_104475 ?auto_104476 ) ) ( not ( = ?auto_104475 ?auto_104477 ) ) ( not ( = ?auto_104475 ?auto_104478 ) ) ( not ( = ?auto_104476 ?auto_104477 ) ) ( not ( = ?auto_104476 ?auto_104478 ) ) ( not ( = ?auto_104477 ?auto_104478 ) ) ( not ( = ?auto_104474 ?auto_104479 ) ) ( not ( = ?auto_104474 ?auto_104481 ) ) ( not ( = ?auto_104475 ?auto_104479 ) ) ( not ( = ?auto_104475 ?auto_104481 ) ) ( not ( = ?auto_104476 ?auto_104479 ) ) ( not ( = ?auto_104476 ?auto_104481 ) ) ( not ( = ?auto_104477 ?auto_104479 ) ) ( not ( = ?auto_104477 ?auto_104481 ) ) ( not ( = ?auto_104478 ?auto_104479 ) ) ( not ( = ?auto_104478 ?auto_104481 ) ) ( not ( = ?auto_104479 ?auto_104481 ) ) ( ON ?auto_104479 ?auto_104478 ) ( not ( = ?auto_104480 ?auto_104481 ) ) ( not ( = ?auto_104474 ?auto_104480 ) ) ( not ( = ?auto_104475 ?auto_104480 ) ) ( not ( = ?auto_104476 ?auto_104480 ) ) ( not ( = ?auto_104477 ?auto_104480 ) ) ( not ( = ?auto_104478 ?auto_104480 ) ) ( not ( = ?auto_104479 ?auto_104480 ) ) ( ON ?auto_104481 ?auto_104479 ) ( ON ?auto_104480 ?auto_104481 ) ( CLEAR ?auto_104480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104474 ?auto_104475 ?auto_104476 ?auto_104477 ?auto_104478 ?auto_104479 ?auto_104481 )
      ( MAKE-4PILE ?auto_104474 ?auto_104475 ?auto_104476 ?auto_104477 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104486 - BLOCK
      ?auto_104487 - BLOCK
      ?auto_104488 - BLOCK
      ?auto_104489 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104489 ) ( CLEAR ?auto_104488 ) ( ON-TABLE ?auto_104486 ) ( ON ?auto_104487 ?auto_104486 ) ( ON ?auto_104488 ?auto_104487 ) ( not ( = ?auto_104486 ?auto_104487 ) ) ( not ( = ?auto_104486 ?auto_104488 ) ) ( not ( = ?auto_104486 ?auto_104489 ) ) ( not ( = ?auto_104487 ?auto_104488 ) ) ( not ( = ?auto_104487 ?auto_104489 ) ) ( not ( = ?auto_104488 ?auto_104489 ) ) )
    :subtasks
    ( ( !STACK ?auto_104489 ?auto_104488 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104490 - BLOCK
      ?auto_104491 - BLOCK
      ?auto_104492 - BLOCK
      ?auto_104493 - BLOCK
    )
    :vars
    (
      ?auto_104494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104492 ) ( ON-TABLE ?auto_104490 ) ( ON ?auto_104491 ?auto_104490 ) ( ON ?auto_104492 ?auto_104491 ) ( not ( = ?auto_104490 ?auto_104491 ) ) ( not ( = ?auto_104490 ?auto_104492 ) ) ( not ( = ?auto_104490 ?auto_104493 ) ) ( not ( = ?auto_104491 ?auto_104492 ) ) ( not ( = ?auto_104491 ?auto_104493 ) ) ( not ( = ?auto_104492 ?auto_104493 ) ) ( ON ?auto_104493 ?auto_104494 ) ( CLEAR ?auto_104493 ) ( HAND-EMPTY ) ( not ( = ?auto_104490 ?auto_104494 ) ) ( not ( = ?auto_104491 ?auto_104494 ) ) ( not ( = ?auto_104492 ?auto_104494 ) ) ( not ( = ?auto_104493 ?auto_104494 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104493 ?auto_104494 )
      ( MAKE-4PILE ?auto_104490 ?auto_104491 ?auto_104492 ?auto_104493 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104495 - BLOCK
      ?auto_104496 - BLOCK
      ?auto_104497 - BLOCK
      ?auto_104498 - BLOCK
    )
    :vars
    (
      ?auto_104499 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104495 ) ( ON ?auto_104496 ?auto_104495 ) ( not ( = ?auto_104495 ?auto_104496 ) ) ( not ( = ?auto_104495 ?auto_104497 ) ) ( not ( = ?auto_104495 ?auto_104498 ) ) ( not ( = ?auto_104496 ?auto_104497 ) ) ( not ( = ?auto_104496 ?auto_104498 ) ) ( not ( = ?auto_104497 ?auto_104498 ) ) ( ON ?auto_104498 ?auto_104499 ) ( CLEAR ?auto_104498 ) ( not ( = ?auto_104495 ?auto_104499 ) ) ( not ( = ?auto_104496 ?auto_104499 ) ) ( not ( = ?auto_104497 ?auto_104499 ) ) ( not ( = ?auto_104498 ?auto_104499 ) ) ( HOLDING ?auto_104497 ) ( CLEAR ?auto_104496 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104495 ?auto_104496 ?auto_104497 )
      ( MAKE-4PILE ?auto_104495 ?auto_104496 ?auto_104497 ?auto_104498 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104500 - BLOCK
      ?auto_104501 - BLOCK
      ?auto_104502 - BLOCK
      ?auto_104503 - BLOCK
    )
    :vars
    (
      ?auto_104504 - BLOCK
      ?auto_104505 - BLOCK
      ?auto_104506 - BLOCK
      ?auto_104507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104500 ) ( ON ?auto_104501 ?auto_104500 ) ( not ( = ?auto_104500 ?auto_104501 ) ) ( not ( = ?auto_104500 ?auto_104502 ) ) ( not ( = ?auto_104500 ?auto_104503 ) ) ( not ( = ?auto_104501 ?auto_104502 ) ) ( not ( = ?auto_104501 ?auto_104503 ) ) ( not ( = ?auto_104502 ?auto_104503 ) ) ( ON ?auto_104503 ?auto_104504 ) ( not ( = ?auto_104500 ?auto_104504 ) ) ( not ( = ?auto_104501 ?auto_104504 ) ) ( not ( = ?auto_104502 ?auto_104504 ) ) ( not ( = ?auto_104503 ?auto_104504 ) ) ( CLEAR ?auto_104501 ) ( ON ?auto_104502 ?auto_104503 ) ( CLEAR ?auto_104502 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104505 ) ( ON ?auto_104506 ?auto_104505 ) ( ON ?auto_104507 ?auto_104506 ) ( ON ?auto_104504 ?auto_104507 ) ( not ( = ?auto_104505 ?auto_104506 ) ) ( not ( = ?auto_104505 ?auto_104507 ) ) ( not ( = ?auto_104505 ?auto_104504 ) ) ( not ( = ?auto_104505 ?auto_104503 ) ) ( not ( = ?auto_104505 ?auto_104502 ) ) ( not ( = ?auto_104506 ?auto_104507 ) ) ( not ( = ?auto_104506 ?auto_104504 ) ) ( not ( = ?auto_104506 ?auto_104503 ) ) ( not ( = ?auto_104506 ?auto_104502 ) ) ( not ( = ?auto_104507 ?auto_104504 ) ) ( not ( = ?auto_104507 ?auto_104503 ) ) ( not ( = ?auto_104507 ?auto_104502 ) ) ( not ( = ?auto_104500 ?auto_104505 ) ) ( not ( = ?auto_104500 ?auto_104506 ) ) ( not ( = ?auto_104500 ?auto_104507 ) ) ( not ( = ?auto_104501 ?auto_104505 ) ) ( not ( = ?auto_104501 ?auto_104506 ) ) ( not ( = ?auto_104501 ?auto_104507 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104505 ?auto_104506 ?auto_104507 ?auto_104504 ?auto_104503 )
      ( MAKE-4PILE ?auto_104500 ?auto_104501 ?auto_104502 ?auto_104503 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104508 - BLOCK
      ?auto_104509 - BLOCK
      ?auto_104510 - BLOCK
      ?auto_104511 - BLOCK
    )
    :vars
    (
      ?auto_104515 - BLOCK
      ?auto_104514 - BLOCK
      ?auto_104512 - BLOCK
      ?auto_104513 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104508 ) ( not ( = ?auto_104508 ?auto_104509 ) ) ( not ( = ?auto_104508 ?auto_104510 ) ) ( not ( = ?auto_104508 ?auto_104511 ) ) ( not ( = ?auto_104509 ?auto_104510 ) ) ( not ( = ?auto_104509 ?auto_104511 ) ) ( not ( = ?auto_104510 ?auto_104511 ) ) ( ON ?auto_104511 ?auto_104515 ) ( not ( = ?auto_104508 ?auto_104515 ) ) ( not ( = ?auto_104509 ?auto_104515 ) ) ( not ( = ?auto_104510 ?auto_104515 ) ) ( not ( = ?auto_104511 ?auto_104515 ) ) ( ON ?auto_104510 ?auto_104511 ) ( CLEAR ?auto_104510 ) ( ON-TABLE ?auto_104514 ) ( ON ?auto_104512 ?auto_104514 ) ( ON ?auto_104513 ?auto_104512 ) ( ON ?auto_104515 ?auto_104513 ) ( not ( = ?auto_104514 ?auto_104512 ) ) ( not ( = ?auto_104514 ?auto_104513 ) ) ( not ( = ?auto_104514 ?auto_104515 ) ) ( not ( = ?auto_104514 ?auto_104511 ) ) ( not ( = ?auto_104514 ?auto_104510 ) ) ( not ( = ?auto_104512 ?auto_104513 ) ) ( not ( = ?auto_104512 ?auto_104515 ) ) ( not ( = ?auto_104512 ?auto_104511 ) ) ( not ( = ?auto_104512 ?auto_104510 ) ) ( not ( = ?auto_104513 ?auto_104515 ) ) ( not ( = ?auto_104513 ?auto_104511 ) ) ( not ( = ?auto_104513 ?auto_104510 ) ) ( not ( = ?auto_104508 ?auto_104514 ) ) ( not ( = ?auto_104508 ?auto_104512 ) ) ( not ( = ?auto_104508 ?auto_104513 ) ) ( not ( = ?auto_104509 ?auto_104514 ) ) ( not ( = ?auto_104509 ?auto_104512 ) ) ( not ( = ?auto_104509 ?auto_104513 ) ) ( HOLDING ?auto_104509 ) ( CLEAR ?auto_104508 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104508 ?auto_104509 )
      ( MAKE-4PILE ?auto_104508 ?auto_104509 ?auto_104510 ?auto_104511 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104516 - BLOCK
      ?auto_104517 - BLOCK
      ?auto_104518 - BLOCK
      ?auto_104519 - BLOCK
    )
    :vars
    (
      ?auto_104523 - BLOCK
      ?auto_104521 - BLOCK
      ?auto_104520 - BLOCK
      ?auto_104522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104516 ) ( not ( = ?auto_104516 ?auto_104517 ) ) ( not ( = ?auto_104516 ?auto_104518 ) ) ( not ( = ?auto_104516 ?auto_104519 ) ) ( not ( = ?auto_104517 ?auto_104518 ) ) ( not ( = ?auto_104517 ?auto_104519 ) ) ( not ( = ?auto_104518 ?auto_104519 ) ) ( ON ?auto_104519 ?auto_104523 ) ( not ( = ?auto_104516 ?auto_104523 ) ) ( not ( = ?auto_104517 ?auto_104523 ) ) ( not ( = ?auto_104518 ?auto_104523 ) ) ( not ( = ?auto_104519 ?auto_104523 ) ) ( ON ?auto_104518 ?auto_104519 ) ( ON-TABLE ?auto_104521 ) ( ON ?auto_104520 ?auto_104521 ) ( ON ?auto_104522 ?auto_104520 ) ( ON ?auto_104523 ?auto_104522 ) ( not ( = ?auto_104521 ?auto_104520 ) ) ( not ( = ?auto_104521 ?auto_104522 ) ) ( not ( = ?auto_104521 ?auto_104523 ) ) ( not ( = ?auto_104521 ?auto_104519 ) ) ( not ( = ?auto_104521 ?auto_104518 ) ) ( not ( = ?auto_104520 ?auto_104522 ) ) ( not ( = ?auto_104520 ?auto_104523 ) ) ( not ( = ?auto_104520 ?auto_104519 ) ) ( not ( = ?auto_104520 ?auto_104518 ) ) ( not ( = ?auto_104522 ?auto_104523 ) ) ( not ( = ?auto_104522 ?auto_104519 ) ) ( not ( = ?auto_104522 ?auto_104518 ) ) ( not ( = ?auto_104516 ?auto_104521 ) ) ( not ( = ?auto_104516 ?auto_104520 ) ) ( not ( = ?auto_104516 ?auto_104522 ) ) ( not ( = ?auto_104517 ?auto_104521 ) ) ( not ( = ?auto_104517 ?auto_104520 ) ) ( not ( = ?auto_104517 ?auto_104522 ) ) ( CLEAR ?auto_104516 ) ( ON ?auto_104517 ?auto_104518 ) ( CLEAR ?auto_104517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104521 ?auto_104520 ?auto_104522 ?auto_104523 ?auto_104519 ?auto_104518 )
      ( MAKE-4PILE ?auto_104516 ?auto_104517 ?auto_104518 ?auto_104519 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104524 - BLOCK
      ?auto_104525 - BLOCK
      ?auto_104526 - BLOCK
      ?auto_104527 - BLOCK
    )
    :vars
    (
      ?auto_104530 - BLOCK
      ?auto_104531 - BLOCK
      ?auto_104529 - BLOCK
      ?auto_104528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104524 ?auto_104525 ) ) ( not ( = ?auto_104524 ?auto_104526 ) ) ( not ( = ?auto_104524 ?auto_104527 ) ) ( not ( = ?auto_104525 ?auto_104526 ) ) ( not ( = ?auto_104525 ?auto_104527 ) ) ( not ( = ?auto_104526 ?auto_104527 ) ) ( ON ?auto_104527 ?auto_104530 ) ( not ( = ?auto_104524 ?auto_104530 ) ) ( not ( = ?auto_104525 ?auto_104530 ) ) ( not ( = ?auto_104526 ?auto_104530 ) ) ( not ( = ?auto_104527 ?auto_104530 ) ) ( ON ?auto_104526 ?auto_104527 ) ( ON-TABLE ?auto_104531 ) ( ON ?auto_104529 ?auto_104531 ) ( ON ?auto_104528 ?auto_104529 ) ( ON ?auto_104530 ?auto_104528 ) ( not ( = ?auto_104531 ?auto_104529 ) ) ( not ( = ?auto_104531 ?auto_104528 ) ) ( not ( = ?auto_104531 ?auto_104530 ) ) ( not ( = ?auto_104531 ?auto_104527 ) ) ( not ( = ?auto_104531 ?auto_104526 ) ) ( not ( = ?auto_104529 ?auto_104528 ) ) ( not ( = ?auto_104529 ?auto_104530 ) ) ( not ( = ?auto_104529 ?auto_104527 ) ) ( not ( = ?auto_104529 ?auto_104526 ) ) ( not ( = ?auto_104528 ?auto_104530 ) ) ( not ( = ?auto_104528 ?auto_104527 ) ) ( not ( = ?auto_104528 ?auto_104526 ) ) ( not ( = ?auto_104524 ?auto_104531 ) ) ( not ( = ?auto_104524 ?auto_104529 ) ) ( not ( = ?auto_104524 ?auto_104528 ) ) ( not ( = ?auto_104525 ?auto_104531 ) ) ( not ( = ?auto_104525 ?auto_104529 ) ) ( not ( = ?auto_104525 ?auto_104528 ) ) ( ON ?auto_104525 ?auto_104526 ) ( CLEAR ?auto_104525 ) ( HOLDING ?auto_104524 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104524 )
      ( MAKE-4PILE ?auto_104524 ?auto_104525 ?auto_104526 ?auto_104527 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_104532 - BLOCK
      ?auto_104533 - BLOCK
      ?auto_104534 - BLOCK
      ?auto_104535 - BLOCK
    )
    :vars
    (
      ?auto_104539 - BLOCK
      ?auto_104536 - BLOCK
      ?auto_104537 - BLOCK
      ?auto_104538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104532 ?auto_104533 ) ) ( not ( = ?auto_104532 ?auto_104534 ) ) ( not ( = ?auto_104532 ?auto_104535 ) ) ( not ( = ?auto_104533 ?auto_104534 ) ) ( not ( = ?auto_104533 ?auto_104535 ) ) ( not ( = ?auto_104534 ?auto_104535 ) ) ( ON ?auto_104535 ?auto_104539 ) ( not ( = ?auto_104532 ?auto_104539 ) ) ( not ( = ?auto_104533 ?auto_104539 ) ) ( not ( = ?auto_104534 ?auto_104539 ) ) ( not ( = ?auto_104535 ?auto_104539 ) ) ( ON ?auto_104534 ?auto_104535 ) ( ON-TABLE ?auto_104536 ) ( ON ?auto_104537 ?auto_104536 ) ( ON ?auto_104538 ?auto_104537 ) ( ON ?auto_104539 ?auto_104538 ) ( not ( = ?auto_104536 ?auto_104537 ) ) ( not ( = ?auto_104536 ?auto_104538 ) ) ( not ( = ?auto_104536 ?auto_104539 ) ) ( not ( = ?auto_104536 ?auto_104535 ) ) ( not ( = ?auto_104536 ?auto_104534 ) ) ( not ( = ?auto_104537 ?auto_104538 ) ) ( not ( = ?auto_104537 ?auto_104539 ) ) ( not ( = ?auto_104537 ?auto_104535 ) ) ( not ( = ?auto_104537 ?auto_104534 ) ) ( not ( = ?auto_104538 ?auto_104539 ) ) ( not ( = ?auto_104538 ?auto_104535 ) ) ( not ( = ?auto_104538 ?auto_104534 ) ) ( not ( = ?auto_104532 ?auto_104536 ) ) ( not ( = ?auto_104532 ?auto_104537 ) ) ( not ( = ?auto_104532 ?auto_104538 ) ) ( not ( = ?auto_104533 ?auto_104536 ) ) ( not ( = ?auto_104533 ?auto_104537 ) ) ( not ( = ?auto_104533 ?auto_104538 ) ) ( ON ?auto_104533 ?auto_104534 ) ( ON ?auto_104532 ?auto_104533 ) ( CLEAR ?auto_104532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104536 ?auto_104537 ?auto_104538 ?auto_104539 ?auto_104535 ?auto_104534 ?auto_104533 )
      ( MAKE-4PILE ?auto_104532 ?auto_104533 ?auto_104534 ?auto_104535 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104543 - BLOCK
      ?auto_104544 - BLOCK
      ?auto_104545 - BLOCK
    )
    :vars
    (
      ?auto_104546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104546 ?auto_104545 ) ( CLEAR ?auto_104546 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104543 ) ( ON ?auto_104544 ?auto_104543 ) ( ON ?auto_104545 ?auto_104544 ) ( not ( = ?auto_104543 ?auto_104544 ) ) ( not ( = ?auto_104543 ?auto_104545 ) ) ( not ( = ?auto_104543 ?auto_104546 ) ) ( not ( = ?auto_104544 ?auto_104545 ) ) ( not ( = ?auto_104544 ?auto_104546 ) ) ( not ( = ?auto_104545 ?auto_104546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104546 ?auto_104545 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104547 - BLOCK
      ?auto_104548 - BLOCK
      ?auto_104549 - BLOCK
    )
    :vars
    (
      ?auto_104550 - BLOCK
      ?auto_104551 - BLOCK
      ?auto_104552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104550 ?auto_104549 ) ( CLEAR ?auto_104550 ) ( ON-TABLE ?auto_104547 ) ( ON ?auto_104548 ?auto_104547 ) ( ON ?auto_104549 ?auto_104548 ) ( not ( = ?auto_104547 ?auto_104548 ) ) ( not ( = ?auto_104547 ?auto_104549 ) ) ( not ( = ?auto_104547 ?auto_104550 ) ) ( not ( = ?auto_104548 ?auto_104549 ) ) ( not ( = ?auto_104548 ?auto_104550 ) ) ( not ( = ?auto_104549 ?auto_104550 ) ) ( HOLDING ?auto_104551 ) ( CLEAR ?auto_104552 ) ( not ( = ?auto_104547 ?auto_104551 ) ) ( not ( = ?auto_104547 ?auto_104552 ) ) ( not ( = ?auto_104548 ?auto_104551 ) ) ( not ( = ?auto_104548 ?auto_104552 ) ) ( not ( = ?auto_104549 ?auto_104551 ) ) ( not ( = ?auto_104549 ?auto_104552 ) ) ( not ( = ?auto_104550 ?auto_104551 ) ) ( not ( = ?auto_104550 ?auto_104552 ) ) ( not ( = ?auto_104551 ?auto_104552 ) ) )
    :subtasks
    ( ( !STACK ?auto_104551 ?auto_104552 )
      ( MAKE-3PILE ?auto_104547 ?auto_104548 ?auto_104549 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104553 - BLOCK
      ?auto_104554 - BLOCK
      ?auto_104555 - BLOCK
    )
    :vars
    (
      ?auto_104558 - BLOCK
      ?auto_104557 - BLOCK
      ?auto_104556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104558 ?auto_104555 ) ( ON-TABLE ?auto_104553 ) ( ON ?auto_104554 ?auto_104553 ) ( ON ?auto_104555 ?auto_104554 ) ( not ( = ?auto_104553 ?auto_104554 ) ) ( not ( = ?auto_104553 ?auto_104555 ) ) ( not ( = ?auto_104553 ?auto_104558 ) ) ( not ( = ?auto_104554 ?auto_104555 ) ) ( not ( = ?auto_104554 ?auto_104558 ) ) ( not ( = ?auto_104555 ?auto_104558 ) ) ( CLEAR ?auto_104557 ) ( not ( = ?auto_104553 ?auto_104556 ) ) ( not ( = ?auto_104553 ?auto_104557 ) ) ( not ( = ?auto_104554 ?auto_104556 ) ) ( not ( = ?auto_104554 ?auto_104557 ) ) ( not ( = ?auto_104555 ?auto_104556 ) ) ( not ( = ?auto_104555 ?auto_104557 ) ) ( not ( = ?auto_104558 ?auto_104556 ) ) ( not ( = ?auto_104558 ?auto_104557 ) ) ( not ( = ?auto_104556 ?auto_104557 ) ) ( ON ?auto_104556 ?auto_104558 ) ( CLEAR ?auto_104556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104553 ?auto_104554 ?auto_104555 ?auto_104558 )
      ( MAKE-3PILE ?auto_104553 ?auto_104554 ?auto_104555 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104559 - BLOCK
      ?auto_104560 - BLOCK
      ?auto_104561 - BLOCK
    )
    :vars
    (
      ?auto_104562 - BLOCK
      ?auto_104563 - BLOCK
      ?auto_104564 - BLOCK
      ?auto_104566 - BLOCK
      ?auto_104565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104562 ?auto_104561 ) ( ON-TABLE ?auto_104559 ) ( ON ?auto_104560 ?auto_104559 ) ( ON ?auto_104561 ?auto_104560 ) ( not ( = ?auto_104559 ?auto_104560 ) ) ( not ( = ?auto_104559 ?auto_104561 ) ) ( not ( = ?auto_104559 ?auto_104562 ) ) ( not ( = ?auto_104560 ?auto_104561 ) ) ( not ( = ?auto_104560 ?auto_104562 ) ) ( not ( = ?auto_104561 ?auto_104562 ) ) ( not ( = ?auto_104559 ?auto_104563 ) ) ( not ( = ?auto_104559 ?auto_104564 ) ) ( not ( = ?auto_104560 ?auto_104563 ) ) ( not ( = ?auto_104560 ?auto_104564 ) ) ( not ( = ?auto_104561 ?auto_104563 ) ) ( not ( = ?auto_104561 ?auto_104564 ) ) ( not ( = ?auto_104562 ?auto_104563 ) ) ( not ( = ?auto_104562 ?auto_104564 ) ) ( not ( = ?auto_104563 ?auto_104564 ) ) ( ON ?auto_104563 ?auto_104562 ) ( CLEAR ?auto_104563 ) ( HOLDING ?auto_104564 ) ( CLEAR ?auto_104566 ) ( ON-TABLE ?auto_104565 ) ( ON ?auto_104566 ?auto_104565 ) ( not ( = ?auto_104565 ?auto_104566 ) ) ( not ( = ?auto_104565 ?auto_104564 ) ) ( not ( = ?auto_104566 ?auto_104564 ) ) ( not ( = ?auto_104559 ?auto_104566 ) ) ( not ( = ?auto_104559 ?auto_104565 ) ) ( not ( = ?auto_104560 ?auto_104566 ) ) ( not ( = ?auto_104560 ?auto_104565 ) ) ( not ( = ?auto_104561 ?auto_104566 ) ) ( not ( = ?auto_104561 ?auto_104565 ) ) ( not ( = ?auto_104562 ?auto_104566 ) ) ( not ( = ?auto_104562 ?auto_104565 ) ) ( not ( = ?auto_104563 ?auto_104566 ) ) ( not ( = ?auto_104563 ?auto_104565 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104565 ?auto_104566 ?auto_104564 )
      ( MAKE-3PILE ?auto_104559 ?auto_104560 ?auto_104561 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104567 - BLOCK
      ?auto_104568 - BLOCK
      ?auto_104569 - BLOCK
    )
    :vars
    (
      ?auto_104572 - BLOCK
      ?auto_104574 - BLOCK
      ?auto_104570 - BLOCK
      ?auto_104571 - BLOCK
      ?auto_104573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104572 ?auto_104569 ) ( ON-TABLE ?auto_104567 ) ( ON ?auto_104568 ?auto_104567 ) ( ON ?auto_104569 ?auto_104568 ) ( not ( = ?auto_104567 ?auto_104568 ) ) ( not ( = ?auto_104567 ?auto_104569 ) ) ( not ( = ?auto_104567 ?auto_104572 ) ) ( not ( = ?auto_104568 ?auto_104569 ) ) ( not ( = ?auto_104568 ?auto_104572 ) ) ( not ( = ?auto_104569 ?auto_104572 ) ) ( not ( = ?auto_104567 ?auto_104574 ) ) ( not ( = ?auto_104567 ?auto_104570 ) ) ( not ( = ?auto_104568 ?auto_104574 ) ) ( not ( = ?auto_104568 ?auto_104570 ) ) ( not ( = ?auto_104569 ?auto_104574 ) ) ( not ( = ?auto_104569 ?auto_104570 ) ) ( not ( = ?auto_104572 ?auto_104574 ) ) ( not ( = ?auto_104572 ?auto_104570 ) ) ( not ( = ?auto_104574 ?auto_104570 ) ) ( ON ?auto_104574 ?auto_104572 ) ( CLEAR ?auto_104571 ) ( ON-TABLE ?auto_104573 ) ( ON ?auto_104571 ?auto_104573 ) ( not ( = ?auto_104573 ?auto_104571 ) ) ( not ( = ?auto_104573 ?auto_104570 ) ) ( not ( = ?auto_104571 ?auto_104570 ) ) ( not ( = ?auto_104567 ?auto_104571 ) ) ( not ( = ?auto_104567 ?auto_104573 ) ) ( not ( = ?auto_104568 ?auto_104571 ) ) ( not ( = ?auto_104568 ?auto_104573 ) ) ( not ( = ?auto_104569 ?auto_104571 ) ) ( not ( = ?auto_104569 ?auto_104573 ) ) ( not ( = ?auto_104572 ?auto_104571 ) ) ( not ( = ?auto_104572 ?auto_104573 ) ) ( not ( = ?auto_104574 ?auto_104571 ) ) ( not ( = ?auto_104574 ?auto_104573 ) ) ( ON ?auto_104570 ?auto_104574 ) ( CLEAR ?auto_104570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104567 ?auto_104568 ?auto_104569 ?auto_104572 ?auto_104574 )
      ( MAKE-3PILE ?auto_104567 ?auto_104568 ?auto_104569 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104575 - BLOCK
      ?auto_104576 - BLOCK
      ?auto_104577 - BLOCK
    )
    :vars
    (
      ?auto_104581 - BLOCK
      ?auto_104580 - BLOCK
      ?auto_104582 - BLOCK
      ?auto_104579 - BLOCK
      ?auto_104578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104581 ?auto_104577 ) ( ON-TABLE ?auto_104575 ) ( ON ?auto_104576 ?auto_104575 ) ( ON ?auto_104577 ?auto_104576 ) ( not ( = ?auto_104575 ?auto_104576 ) ) ( not ( = ?auto_104575 ?auto_104577 ) ) ( not ( = ?auto_104575 ?auto_104581 ) ) ( not ( = ?auto_104576 ?auto_104577 ) ) ( not ( = ?auto_104576 ?auto_104581 ) ) ( not ( = ?auto_104577 ?auto_104581 ) ) ( not ( = ?auto_104575 ?auto_104580 ) ) ( not ( = ?auto_104575 ?auto_104582 ) ) ( not ( = ?auto_104576 ?auto_104580 ) ) ( not ( = ?auto_104576 ?auto_104582 ) ) ( not ( = ?auto_104577 ?auto_104580 ) ) ( not ( = ?auto_104577 ?auto_104582 ) ) ( not ( = ?auto_104581 ?auto_104580 ) ) ( not ( = ?auto_104581 ?auto_104582 ) ) ( not ( = ?auto_104580 ?auto_104582 ) ) ( ON ?auto_104580 ?auto_104581 ) ( ON-TABLE ?auto_104579 ) ( not ( = ?auto_104579 ?auto_104578 ) ) ( not ( = ?auto_104579 ?auto_104582 ) ) ( not ( = ?auto_104578 ?auto_104582 ) ) ( not ( = ?auto_104575 ?auto_104578 ) ) ( not ( = ?auto_104575 ?auto_104579 ) ) ( not ( = ?auto_104576 ?auto_104578 ) ) ( not ( = ?auto_104576 ?auto_104579 ) ) ( not ( = ?auto_104577 ?auto_104578 ) ) ( not ( = ?auto_104577 ?auto_104579 ) ) ( not ( = ?auto_104581 ?auto_104578 ) ) ( not ( = ?auto_104581 ?auto_104579 ) ) ( not ( = ?auto_104580 ?auto_104578 ) ) ( not ( = ?auto_104580 ?auto_104579 ) ) ( ON ?auto_104582 ?auto_104580 ) ( CLEAR ?auto_104582 ) ( HOLDING ?auto_104578 ) ( CLEAR ?auto_104579 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104579 ?auto_104578 )
      ( MAKE-3PILE ?auto_104575 ?auto_104576 ?auto_104577 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104583 - BLOCK
      ?auto_104584 - BLOCK
      ?auto_104585 - BLOCK
    )
    :vars
    (
      ?auto_104586 - BLOCK
      ?auto_104589 - BLOCK
      ?auto_104588 - BLOCK
      ?auto_104587 - BLOCK
      ?auto_104590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104586 ?auto_104585 ) ( ON-TABLE ?auto_104583 ) ( ON ?auto_104584 ?auto_104583 ) ( ON ?auto_104585 ?auto_104584 ) ( not ( = ?auto_104583 ?auto_104584 ) ) ( not ( = ?auto_104583 ?auto_104585 ) ) ( not ( = ?auto_104583 ?auto_104586 ) ) ( not ( = ?auto_104584 ?auto_104585 ) ) ( not ( = ?auto_104584 ?auto_104586 ) ) ( not ( = ?auto_104585 ?auto_104586 ) ) ( not ( = ?auto_104583 ?auto_104589 ) ) ( not ( = ?auto_104583 ?auto_104588 ) ) ( not ( = ?auto_104584 ?auto_104589 ) ) ( not ( = ?auto_104584 ?auto_104588 ) ) ( not ( = ?auto_104585 ?auto_104589 ) ) ( not ( = ?auto_104585 ?auto_104588 ) ) ( not ( = ?auto_104586 ?auto_104589 ) ) ( not ( = ?auto_104586 ?auto_104588 ) ) ( not ( = ?auto_104589 ?auto_104588 ) ) ( ON ?auto_104589 ?auto_104586 ) ( ON-TABLE ?auto_104587 ) ( not ( = ?auto_104587 ?auto_104590 ) ) ( not ( = ?auto_104587 ?auto_104588 ) ) ( not ( = ?auto_104590 ?auto_104588 ) ) ( not ( = ?auto_104583 ?auto_104590 ) ) ( not ( = ?auto_104583 ?auto_104587 ) ) ( not ( = ?auto_104584 ?auto_104590 ) ) ( not ( = ?auto_104584 ?auto_104587 ) ) ( not ( = ?auto_104585 ?auto_104590 ) ) ( not ( = ?auto_104585 ?auto_104587 ) ) ( not ( = ?auto_104586 ?auto_104590 ) ) ( not ( = ?auto_104586 ?auto_104587 ) ) ( not ( = ?auto_104589 ?auto_104590 ) ) ( not ( = ?auto_104589 ?auto_104587 ) ) ( ON ?auto_104588 ?auto_104589 ) ( CLEAR ?auto_104587 ) ( ON ?auto_104590 ?auto_104588 ) ( CLEAR ?auto_104590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104583 ?auto_104584 ?auto_104585 ?auto_104586 ?auto_104589 ?auto_104588 )
      ( MAKE-3PILE ?auto_104583 ?auto_104584 ?auto_104585 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104591 - BLOCK
      ?auto_104592 - BLOCK
      ?auto_104593 - BLOCK
    )
    :vars
    (
      ?auto_104596 - BLOCK
      ?auto_104595 - BLOCK
      ?auto_104594 - BLOCK
      ?auto_104597 - BLOCK
      ?auto_104598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104596 ?auto_104593 ) ( ON-TABLE ?auto_104591 ) ( ON ?auto_104592 ?auto_104591 ) ( ON ?auto_104593 ?auto_104592 ) ( not ( = ?auto_104591 ?auto_104592 ) ) ( not ( = ?auto_104591 ?auto_104593 ) ) ( not ( = ?auto_104591 ?auto_104596 ) ) ( not ( = ?auto_104592 ?auto_104593 ) ) ( not ( = ?auto_104592 ?auto_104596 ) ) ( not ( = ?auto_104593 ?auto_104596 ) ) ( not ( = ?auto_104591 ?auto_104595 ) ) ( not ( = ?auto_104591 ?auto_104594 ) ) ( not ( = ?auto_104592 ?auto_104595 ) ) ( not ( = ?auto_104592 ?auto_104594 ) ) ( not ( = ?auto_104593 ?auto_104595 ) ) ( not ( = ?auto_104593 ?auto_104594 ) ) ( not ( = ?auto_104596 ?auto_104595 ) ) ( not ( = ?auto_104596 ?auto_104594 ) ) ( not ( = ?auto_104595 ?auto_104594 ) ) ( ON ?auto_104595 ?auto_104596 ) ( not ( = ?auto_104597 ?auto_104598 ) ) ( not ( = ?auto_104597 ?auto_104594 ) ) ( not ( = ?auto_104598 ?auto_104594 ) ) ( not ( = ?auto_104591 ?auto_104598 ) ) ( not ( = ?auto_104591 ?auto_104597 ) ) ( not ( = ?auto_104592 ?auto_104598 ) ) ( not ( = ?auto_104592 ?auto_104597 ) ) ( not ( = ?auto_104593 ?auto_104598 ) ) ( not ( = ?auto_104593 ?auto_104597 ) ) ( not ( = ?auto_104596 ?auto_104598 ) ) ( not ( = ?auto_104596 ?auto_104597 ) ) ( not ( = ?auto_104595 ?auto_104598 ) ) ( not ( = ?auto_104595 ?auto_104597 ) ) ( ON ?auto_104594 ?auto_104595 ) ( ON ?auto_104598 ?auto_104594 ) ( CLEAR ?auto_104598 ) ( HOLDING ?auto_104597 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104597 )
      ( MAKE-3PILE ?auto_104591 ?auto_104592 ?auto_104593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_104599 - BLOCK
      ?auto_104600 - BLOCK
      ?auto_104601 - BLOCK
    )
    :vars
    (
      ?auto_104603 - BLOCK
      ?auto_104606 - BLOCK
      ?auto_104605 - BLOCK
      ?auto_104604 - BLOCK
      ?auto_104602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104603 ?auto_104601 ) ( ON-TABLE ?auto_104599 ) ( ON ?auto_104600 ?auto_104599 ) ( ON ?auto_104601 ?auto_104600 ) ( not ( = ?auto_104599 ?auto_104600 ) ) ( not ( = ?auto_104599 ?auto_104601 ) ) ( not ( = ?auto_104599 ?auto_104603 ) ) ( not ( = ?auto_104600 ?auto_104601 ) ) ( not ( = ?auto_104600 ?auto_104603 ) ) ( not ( = ?auto_104601 ?auto_104603 ) ) ( not ( = ?auto_104599 ?auto_104606 ) ) ( not ( = ?auto_104599 ?auto_104605 ) ) ( not ( = ?auto_104600 ?auto_104606 ) ) ( not ( = ?auto_104600 ?auto_104605 ) ) ( not ( = ?auto_104601 ?auto_104606 ) ) ( not ( = ?auto_104601 ?auto_104605 ) ) ( not ( = ?auto_104603 ?auto_104606 ) ) ( not ( = ?auto_104603 ?auto_104605 ) ) ( not ( = ?auto_104606 ?auto_104605 ) ) ( ON ?auto_104606 ?auto_104603 ) ( not ( = ?auto_104604 ?auto_104602 ) ) ( not ( = ?auto_104604 ?auto_104605 ) ) ( not ( = ?auto_104602 ?auto_104605 ) ) ( not ( = ?auto_104599 ?auto_104602 ) ) ( not ( = ?auto_104599 ?auto_104604 ) ) ( not ( = ?auto_104600 ?auto_104602 ) ) ( not ( = ?auto_104600 ?auto_104604 ) ) ( not ( = ?auto_104601 ?auto_104602 ) ) ( not ( = ?auto_104601 ?auto_104604 ) ) ( not ( = ?auto_104603 ?auto_104602 ) ) ( not ( = ?auto_104603 ?auto_104604 ) ) ( not ( = ?auto_104606 ?auto_104602 ) ) ( not ( = ?auto_104606 ?auto_104604 ) ) ( ON ?auto_104605 ?auto_104606 ) ( ON ?auto_104602 ?auto_104605 ) ( ON ?auto_104604 ?auto_104602 ) ( CLEAR ?auto_104604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104599 ?auto_104600 ?auto_104601 ?auto_104603 ?auto_104606 ?auto_104605 ?auto_104602 )
      ( MAKE-3PILE ?auto_104599 ?auto_104600 ?auto_104601 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104612 - BLOCK
      ?auto_104613 - BLOCK
      ?auto_104614 - BLOCK
      ?auto_104615 - BLOCK
      ?auto_104616 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104616 ) ( CLEAR ?auto_104615 ) ( ON-TABLE ?auto_104612 ) ( ON ?auto_104613 ?auto_104612 ) ( ON ?auto_104614 ?auto_104613 ) ( ON ?auto_104615 ?auto_104614 ) ( not ( = ?auto_104612 ?auto_104613 ) ) ( not ( = ?auto_104612 ?auto_104614 ) ) ( not ( = ?auto_104612 ?auto_104615 ) ) ( not ( = ?auto_104612 ?auto_104616 ) ) ( not ( = ?auto_104613 ?auto_104614 ) ) ( not ( = ?auto_104613 ?auto_104615 ) ) ( not ( = ?auto_104613 ?auto_104616 ) ) ( not ( = ?auto_104614 ?auto_104615 ) ) ( not ( = ?auto_104614 ?auto_104616 ) ) ( not ( = ?auto_104615 ?auto_104616 ) ) )
    :subtasks
    ( ( !STACK ?auto_104616 ?auto_104615 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104617 - BLOCK
      ?auto_104618 - BLOCK
      ?auto_104619 - BLOCK
      ?auto_104620 - BLOCK
      ?auto_104621 - BLOCK
    )
    :vars
    (
      ?auto_104622 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104620 ) ( ON-TABLE ?auto_104617 ) ( ON ?auto_104618 ?auto_104617 ) ( ON ?auto_104619 ?auto_104618 ) ( ON ?auto_104620 ?auto_104619 ) ( not ( = ?auto_104617 ?auto_104618 ) ) ( not ( = ?auto_104617 ?auto_104619 ) ) ( not ( = ?auto_104617 ?auto_104620 ) ) ( not ( = ?auto_104617 ?auto_104621 ) ) ( not ( = ?auto_104618 ?auto_104619 ) ) ( not ( = ?auto_104618 ?auto_104620 ) ) ( not ( = ?auto_104618 ?auto_104621 ) ) ( not ( = ?auto_104619 ?auto_104620 ) ) ( not ( = ?auto_104619 ?auto_104621 ) ) ( not ( = ?auto_104620 ?auto_104621 ) ) ( ON ?auto_104621 ?auto_104622 ) ( CLEAR ?auto_104621 ) ( HAND-EMPTY ) ( not ( = ?auto_104617 ?auto_104622 ) ) ( not ( = ?auto_104618 ?auto_104622 ) ) ( not ( = ?auto_104619 ?auto_104622 ) ) ( not ( = ?auto_104620 ?auto_104622 ) ) ( not ( = ?auto_104621 ?auto_104622 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104621 ?auto_104622 )
      ( MAKE-5PILE ?auto_104617 ?auto_104618 ?auto_104619 ?auto_104620 ?auto_104621 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104623 - BLOCK
      ?auto_104624 - BLOCK
      ?auto_104625 - BLOCK
      ?auto_104626 - BLOCK
      ?auto_104627 - BLOCK
    )
    :vars
    (
      ?auto_104628 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104623 ) ( ON ?auto_104624 ?auto_104623 ) ( ON ?auto_104625 ?auto_104624 ) ( not ( = ?auto_104623 ?auto_104624 ) ) ( not ( = ?auto_104623 ?auto_104625 ) ) ( not ( = ?auto_104623 ?auto_104626 ) ) ( not ( = ?auto_104623 ?auto_104627 ) ) ( not ( = ?auto_104624 ?auto_104625 ) ) ( not ( = ?auto_104624 ?auto_104626 ) ) ( not ( = ?auto_104624 ?auto_104627 ) ) ( not ( = ?auto_104625 ?auto_104626 ) ) ( not ( = ?auto_104625 ?auto_104627 ) ) ( not ( = ?auto_104626 ?auto_104627 ) ) ( ON ?auto_104627 ?auto_104628 ) ( CLEAR ?auto_104627 ) ( not ( = ?auto_104623 ?auto_104628 ) ) ( not ( = ?auto_104624 ?auto_104628 ) ) ( not ( = ?auto_104625 ?auto_104628 ) ) ( not ( = ?auto_104626 ?auto_104628 ) ) ( not ( = ?auto_104627 ?auto_104628 ) ) ( HOLDING ?auto_104626 ) ( CLEAR ?auto_104625 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104623 ?auto_104624 ?auto_104625 ?auto_104626 )
      ( MAKE-5PILE ?auto_104623 ?auto_104624 ?auto_104625 ?auto_104626 ?auto_104627 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104629 - BLOCK
      ?auto_104630 - BLOCK
      ?auto_104631 - BLOCK
      ?auto_104632 - BLOCK
      ?auto_104633 - BLOCK
    )
    :vars
    (
      ?auto_104634 - BLOCK
      ?auto_104636 - BLOCK
      ?auto_104635 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104629 ) ( ON ?auto_104630 ?auto_104629 ) ( ON ?auto_104631 ?auto_104630 ) ( not ( = ?auto_104629 ?auto_104630 ) ) ( not ( = ?auto_104629 ?auto_104631 ) ) ( not ( = ?auto_104629 ?auto_104632 ) ) ( not ( = ?auto_104629 ?auto_104633 ) ) ( not ( = ?auto_104630 ?auto_104631 ) ) ( not ( = ?auto_104630 ?auto_104632 ) ) ( not ( = ?auto_104630 ?auto_104633 ) ) ( not ( = ?auto_104631 ?auto_104632 ) ) ( not ( = ?auto_104631 ?auto_104633 ) ) ( not ( = ?auto_104632 ?auto_104633 ) ) ( ON ?auto_104633 ?auto_104634 ) ( not ( = ?auto_104629 ?auto_104634 ) ) ( not ( = ?auto_104630 ?auto_104634 ) ) ( not ( = ?auto_104631 ?auto_104634 ) ) ( not ( = ?auto_104632 ?auto_104634 ) ) ( not ( = ?auto_104633 ?auto_104634 ) ) ( CLEAR ?auto_104631 ) ( ON ?auto_104632 ?auto_104633 ) ( CLEAR ?auto_104632 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104636 ) ( ON ?auto_104635 ?auto_104636 ) ( ON ?auto_104634 ?auto_104635 ) ( not ( = ?auto_104636 ?auto_104635 ) ) ( not ( = ?auto_104636 ?auto_104634 ) ) ( not ( = ?auto_104636 ?auto_104633 ) ) ( not ( = ?auto_104636 ?auto_104632 ) ) ( not ( = ?auto_104635 ?auto_104634 ) ) ( not ( = ?auto_104635 ?auto_104633 ) ) ( not ( = ?auto_104635 ?auto_104632 ) ) ( not ( = ?auto_104629 ?auto_104636 ) ) ( not ( = ?auto_104629 ?auto_104635 ) ) ( not ( = ?auto_104630 ?auto_104636 ) ) ( not ( = ?auto_104630 ?auto_104635 ) ) ( not ( = ?auto_104631 ?auto_104636 ) ) ( not ( = ?auto_104631 ?auto_104635 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104636 ?auto_104635 ?auto_104634 ?auto_104633 )
      ( MAKE-5PILE ?auto_104629 ?auto_104630 ?auto_104631 ?auto_104632 ?auto_104633 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104637 - BLOCK
      ?auto_104638 - BLOCK
      ?auto_104639 - BLOCK
      ?auto_104640 - BLOCK
      ?auto_104641 - BLOCK
    )
    :vars
    (
      ?auto_104642 - BLOCK
      ?auto_104644 - BLOCK
      ?auto_104643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104637 ) ( ON ?auto_104638 ?auto_104637 ) ( not ( = ?auto_104637 ?auto_104638 ) ) ( not ( = ?auto_104637 ?auto_104639 ) ) ( not ( = ?auto_104637 ?auto_104640 ) ) ( not ( = ?auto_104637 ?auto_104641 ) ) ( not ( = ?auto_104638 ?auto_104639 ) ) ( not ( = ?auto_104638 ?auto_104640 ) ) ( not ( = ?auto_104638 ?auto_104641 ) ) ( not ( = ?auto_104639 ?auto_104640 ) ) ( not ( = ?auto_104639 ?auto_104641 ) ) ( not ( = ?auto_104640 ?auto_104641 ) ) ( ON ?auto_104641 ?auto_104642 ) ( not ( = ?auto_104637 ?auto_104642 ) ) ( not ( = ?auto_104638 ?auto_104642 ) ) ( not ( = ?auto_104639 ?auto_104642 ) ) ( not ( = ?auto_104640 ?auto_104642 ) ) ( not ( = ?auto_104641 ?auto_104642 ) ) ( ON ?auto_104640 ?auto_104641 ) ( CLEAR ?auto_104640 ) ( ON-TABLE ?auto_104644 ) ( ON ?auto_104643 ?auto_104644 ) ( ON ?auto_104642 ?auto_104643 ) ( not ( = ?auto_104644 ?auto_104643 ) ) ( not ( = ?auto_104644 ?auto_104642 ) ) ( not ( = ?auto_104644 ?auto_104641 ) ) ( not ( = ?auto_104644 ?auto_104640 ) ) ( not ( = ?auto_104643 ?auto_104642 ) ) ( not ( = ?auto_104643 ?auto_104641 ) ) ( not ( = ?auto_104643 ?auto_104640 ) ) ( not ( = ?auto_104637 ?auto_104644 ) ) ( not ( = ?auto_104637 ?auto_104643 ) ) ( not ( = ?auto_104638 ?auto_104644 ) ) ( not ( = ?auto_104638 ?auto_104643 ) ) ( not ( = ?auto_104639 ?auto_104644 ) ) ( not ( = ?auto_104639 ?auto_104643 ) ) ( HOLDING ?auto_104639 ) ( CLEAR ?auto_104638 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104637 ?auto_104638 ?auto_104639 )
      ( MAKE-5PILE ?auto_104637 ?auto_104638 ?auto_104639 ?auto_104640 ?auto_104641 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104645 - BLOCK
      ?auto_104646 - BLOCK
      ?auto_104647 - BLOCK
      ?auto_104648 - BLOCK
      ?auto_104649 - BLOCK
    )
    :vars
    (
      ?auto_104651 - BLOCK
      ?auto_104650 - BLOCK
      ?auto_104652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104645 ) ( ON ?auto_104646 ?auto_104645 ) ( not ( = ?auto_104645 ?auto_104646 ) ) ( not ( = ?auto_104645 ?auto_104647 ) ) ( not ( = ?auto_104645 ?auto_104648 ) ) ( not ( = ?auto_104645 ?auto_104649 ) ) ( not ( = ?auto_104646 ?auto_104647 ) ) ( not ( = ?auto_104646 ?auto_104648 ) ) ( not ( = ?auto_104646 ?auto_104649 ) ) ( not ( = ?auto_104647 ?auto_104648 ) ) ( not ( = ?auto_104647 ?auto_104649 ) ) ( not ( = ?auto_104648 ?auto_104649 ) ) ( ON ?auto_104649 ?auto_104651 ) ( not ( = ?auto_104645 ?auto_104651 ) ) ( not ( = ?auto_104646 ?auto_104651 ) ) ( not ( = ?auto_104647 ?auto_104651 ) ) ( not ( = ?auto_104648 ?auto_104651 ) ) ( not ( = ?auto_104649 ?auto_104651 ) ) ( ON ?auto_104648 ?auto_104649 ) ( ON-TABLE ?auto_104650 ) ( ON ?auto_104652 ?auto_104650 ) ( ON ?auto_104651 ?auto_104652 ) ( not ( = ?auto_104650 ?auto_104652 ) ) ( not ( = ?auto_104650 ?auto_104651 ) ) ( not ( = ?auto_104650 ?auto_104649 ) ) ( not ( = ?auto_104650 ?auto_104648 ) ) ( not ( = ?auto_104652 ?auto_104651 ) ) ( not ( = ?auto_104652 ?auto_104649 ) ) ( not ( = ?auto_104652 ?auto_104648 ) ) ( not ( = ?auto_104645 ?auto_104650 ) ) ( not ( = ?auto_104645 ?auto_104652 ) ) ( not ( = ?auto_104646 ?auto_104650 ) ) ( not ( = ?auto_104646 ?auto_104652 ) ) ( not ( = ?auto_104647 ?auto_104650 ) ) ( not ( = ?auto_104647 ?auto_104652 ) ) ( CLEAR ?auto_104646 ) ( ON ?auto_104647 ?auto_104648 ) ( CLEAR ?auto_104647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104650 ?auto_104652 ?auto_104651 ?auto_104649 ?auto_104648 )
      ( MAKE-5PILE ?auto_104645 ?auto_104646 ?auto_104647 ?auto_104648 ?auto_104649 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104653 - BLOCK
      ?auto_104654 - BLOCK
      ?auto_104655 - BLOCK
      ?auto_104656 - BLOCK
      ?auto_104657 - BLOCK
    )
    :vars
    (
      ?auto_104658 - BLOCK
      ?auto_104660 - BLOCK
      ?auto_104659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104653 ) ( not ( = ?auto_104653 ?auto_104654 ) ) ( not ( = ?auto_104653 ?auto_104655 ) ) ( not ( = ?auto_104653 ?auto_104656 ) ) ( not ( = ?auto_104653 ?auto_104657 ) ) ( not ( = ?auto_104654 ?auto_104655 ) ) ( not ( = ?auto_104654 ?auto_104656 ) ) ( not ( = ?auto_104654 ?auto_104657 ) ) ( not ( = ?auto_104655 ?auto_104656 ) ) ( not ( = ?auto_104655 ?auto_104657 ) ) ( not ( = ?auto_104656 ?auto_104657 ) ) ( ON ?auto_104657 ?auto_104658 ) ( not ( = ?auto_104653 ?auto_104658 ) ) ( not ( = ?auto_104654 ?auto_104658 ) ) ( not ( = ?auto_104655 ?auto_104658 ) ) ( not ( = ?auto_104656 ?auto_104658 ) ) ( not ( = ?auto_104657 ?auto_104658 ) ) ( ON ?auto_104656 ?auto_104657 ) ( ON-TABLE ?auto_104660 ) ( ON ?auto_104659 ?auto_104660 ) ( ON ?auto_104658 ?auto_104659 ) ( not ( = ?auto_104660 ?auto_104659 ) ) ( not ( = ?auto_104660 ?auto_104658 ) ) ( not ( = ?auto_104660 ?auto_104657 ) ) ( not ( = ?auto_104660 ?auto_104656 ) ) ( not ( = ?auto_104659 ?auto_104658 ) ) ( not ( = ?auto_104659 ?auto_104657 ) ) ( not ( = ?auto_104659 ?auto_104656 ) ) ( not ( = ?auto_104653 ?auto_104660 ) ) ( not ( = ?auto_104653 ?auto_104659 ) ) ( not ( = ?auto_104654 ?auto_104660 ) ) ( not ( = ?auto_104654 ?auto_104659 ) ) ( not ( = ?auto_104655 ?auto_104660 ) ) ( not ( = ?auto_104655 ?auto_104659 ) ) ( ON ?auto_104655 ?auto_104656 ) ( CLEAR ?auto_104655 ) ( HOLDING ?auto_104654 ) ( CLEAR ?auto_104653 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104653 ?auto_104654 )
      ( MAKE-5PILE ?auto_104653 ?auto_104654 ?auto_104655 ?auto_104656 ?auto_104657 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104661 - BLOCK
      ?auto_104662 - BLOCK
      ?auto_104663 - BLOCK
      ?auto_104664 - BLOCK
      ?auto_104665 - BLOCK
    )
    :vars
    (
      ?auto_104668 - BLOCK
      ?auto_104667 - BLOCK
      ?auto_104666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104661 ) ( not ( = ?auto_104661 ?auto_104662 ) ) ( not ( = ?auto_104661 ?auto_104663 ) ) ( not ( = ?auto_104661 ?auto_104664 ) ) ( not ( = ?auto_104661 ?auto_104665 ) ) ( not ( = ?auto_104662 ?auto_104663 ) ) ( not ( = ?auto_104662 ?auto_104664 ) ) ( not ( = ?auto_104662 ?auto_104665 ) ) ( not ( = ?auto_104663 ?auto_104664 ) ) ( not ( = ?auto_104663 ?auto_104665 ) ) ( not ( = ?auto_104664 ?auto_104665 ) ) ( ON ?auto_104665 ?auto_104668 ) ( not ( = ?auto_104661 ?auto_104668 ) ) ( not ( = ?auto_104662 ?auto_104668 ) ) ( not ( = ?auto_104663 ?auto_104668 ) ) ( not ( = ?auto_104664 ?auto_104668 ) ) ( not ( = ?auto_104665 ?auto_104668 ) ) ( ON ?auto_104664 ?auto_104665 ) ( ON-TABLE ?auto_104667 ) ( ON ?auto_104666 ?auto_104667 ) ( ON ?auto_104668 ?auto_104666 ) ( not ( = ?auto_104667 ?auto_104666 ) ) ( not ( = ?auto_104667 ?auto_104668 ) ) ( not ( = ?auto_104667 ?auto_104665 ) ) ( not ( = ?auto_104667 ?auto_104664 ) ) ( not ( = ?auto_104666 ?auto_104668 ) ) ( not ( = ?auto_104666 ?auto_104665 ) ) ( not ( = ?auto_104666 ?auto_104664 ) ) ( not ( = ?auto_104661 ?auto_104667 ) ) ( not ( = ?auto_104661 ?auto_104666 ) ) ( not ( = ?auto_104662 ?auto_104667 ) ) ( not ( = ?auto_104662 ?auto_104666 ) ) ( not ( = ?auto_104663 ?auto_104667 ) ) ( not ( = ?auto_104663 ?auto_104666 ) ) ( ON ?auto_104663 ?auto_104664 ) ( CLEAR ?auto_104661 ) ( ON ?auto_104662 ?auto_104663 ) ( CLEAR ?auto_104662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104667 ?auto_104666 ?auto_104668 ?auto_104665 ?auto_104664 ?auto_104663 )
      ( MAKE-5PILE ?auto_104661 ?auto_104662 ?auto_104663 ?auto_104664 ?auto_104665 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104669 - BLOCK
      ?auto_104670 - BLOCK
      ?auto_104671 - BLOCK
      ?auto_104672 - BLOCK
      ?auto_104673 - BLOCK
    )
    :vars
    (
      ?auto_104676 - BLOCK
      ?auto_104674 - BLOCK
      ?auto_104675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104669 ?auto_104670 ) ) ( not ( = ?auto_104669 ?auto_104671 ) ) ( not ( = ?auto_104669 ?auto_104672 ) ) ( not ( = ?auto_104669 ?auto_104673 ) ) ( not ( = ?auto_104670 ?auto_104671 ) ) ( not ( = ?auto_104670 ?auto_104672 ) ) ( not ( = ?auto_104670 ?auto_104673 ) ) ( not ( = ?auto_104671 ?auto_104672 ) ) ( not ( = ?auto_104671 ?auto_104673 ) ) ( not ( = ?auto_104672 ?auto_104673 ) ) ( ON ?auto_104673 ?auto_104676 ) ( not ( = ?auto_104669 ?auto_104676 ) ) ( not ( = ?auto_104670 ?auto_104676 ) ) ( not ( = ?auto_104671 ?auto_104676 ) ) ( not ( = ?auto_104672 ?auto_104676 ) ) ( not ( = ?auto_104673 ?auto_104676 ) ) ( ON ?auto_104672 ?auto_104673 ) ( ON-TABLE ?auto_104674 ) ( ON ?auto_104675 ?auto_104674 ) ( ON ?auto_104676 ?auto_104675 ) ( not ( = ?auto_104674 ?auto_104675 ) ) ( not ( = ?auto_104674 ?auto_104676 ) ) ( not ( = ?auto_104674 ?auto_104673 ) ) ( not ( = ?auto_104674 ?auto_104672 ) ) ( not ( = ?auto_104675 ?auto_104676 ) ) ( not ( = ?auto_104675 ?auto_104673 ) ) ( not ( = ?auto_104675 ?auto_104672 ) ) ( not ( = ?auto_104669 ?auto_104674 ) ) ( not ( = ?auto_104669 ?auto_104675 ) ) ( not ( = ?auto_104670 ?auto_104674 ) ) ( not ( = ?auto_104670 ?auto_104675 ) ) ( not ( = ?auto_104671 ?auto_104674 ) ) ( not ( = ?auto_104671 ?auto_104675 ) ) ( ON ?auto_104671 ?auto_104672 ) ( ON ?auto_104670 ?auto_104671 ) ( CLEAR ?auto_104670 ) ( HOLDING ?auto_104669 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104669 )
      ( MAKE-5PILE ?auto_104669 ?auto_104670 ?auto_104671 ?auto_104672 ?auto_104673 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_104677 - BLOCK
      ?auto_104678 - BLOCK
      ?auto_104679 - BLOCK
      ?auto_104680 - BLOCK
      ?auto_104681 - BLOCK
    )
    :vars
    (
      ?auto_104683 - BLOCK
      ?auto_104684 - BLOCK
      ?auto_104682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104677 ?auto_104678 ) ) ( not ( = ?auto_104677 ?auto_104679 ) ) ( not ( = ?auto_104677 ?auto_104680 ) ) ( not ( = ?auto_104677 ?auto_104681 ) ) ( not ( = ?auto_104678 ?auto_104679 ) ) ( not ( = ?auto_104678 ?auto_104680 ) ) ( not ( = ?auto_104678 ?auto_104681 ) ) ( not ( = ?auto_104679 ?auto_104680 ) ) ( not ( = ?auto_104679 ?auto_104681 ) ) ( not ( = ?auto_104680 ?auto_104681 ) ) ( ON ?auto_104681 ?auto_104683 ) ( not ( = ?auto_104677 ?auto_104683 ) ) ( not ( = ?auto_104678 ?auto_104683 ) ) ( not ( = ?auto_104679 ?auto_104683 ) ) ( not ( = ?auto_104680 ?auto_104683 ) ) ( not ( = ?auto_104681 ?auto_104683 ) ) ( ON ?auto_104680 ?auto_104681 ) ( ON-TABLE ?auto_104684 ) ( ON ?auto_104682 ?auto_104684 ) ( ON ?auto_104683 ?auto_104682 ) ( not ( = ?auto_104684 ?auto_104682 ) ) ( not ( = ?auto_104684 ?auto_104683 ) ) ( not ( = ?auto_104684 ?auto_104681 ) ) ( not ( = ?auto_104684 ?auto_104680 ) ) ( not ( = ?auto_104682 ?auto_104683 ) ) ( not ( = ?auto_104682 ?auto_104681 ) ) ( not ( = ?auto_104682 ?auto_104680 ) ) ( not ( = ?auto_104677 ?auto_104684 ) ) ( not ( = ?auto_104677 ?auto_104682 ) ) ( not ( = ?auto_104678 ?auto_104684 ) ) ( not ( = ?auto_104678 ?auto_104682 ) ) ( not ( = ?auto_104679 ?auto_104684 ) ) ( not ( = ?auto_104679 ?auto_104682 ) ) ( ON ?auto_104679 ?auto_104680 ) ( ON ?auto_104678 ?auto_104679 ) ( ON ?auto_104677 ?auto_104678 ) ( CLEAR ?auto_104677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104684 ?auto_104682 ?auto_104683 ?auto_104681 ?auto_104680 ?auto_104679 ?auto_104678 )
      ( MAKE-5PILE ?auto_104677 ?auto_104678 ?auto_104679 ?auto_104680 ?auto_104681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104687 - BLOCK
      ?auto_104688 - BLOCK
    )
    :vars
    (
      ?auto_104689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104689 ?auto_104688 ) ( CLEAR ?auto_104689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104687 ) ( ON ?auto_104688 ?auto_104687 ) ( not ( = ?auto_104687 ?auto_104688 ) ) ( not ( = ?auto_104687 ?auto_104689 ) ) ( not ( = ?auto_104688 ?auto_104689 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104689 ?auto_104688 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104690 - BLOCK
      ?auto_104691 - BLOCK
    )
    :vars
    (
      ?auto_104692 - BLOCK
      ?auto_104693 - BLOCK
      ?auto_104694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104692 ?auto_104691 ) ( CLEAR ?auto_104692 ) ( ON-TABLE ?auto_104690 ) ( ON ?auto_104691 ?auto_104690 ) ( not ( = ?auto_104690 ?auto_104691 ) ) ( not ( = ?auto_104690 ?auto_104692 ) ) ( not ( = ?auto_104691 ?auto_104692 ) ) ( HOLDING ?auto_104693 ) ( CLEAR ?auto_104694 ) ( not ( = ?auto_104690 ?auto_104693 ) ) ( not ( = ?auto_104690 ?auto_104694 ) ) ( not ( = ?auto_104691 ?auto_104693 ) ) ( not ( = ?auto_104691 ?auto_104694 ) ) ( not ( = ?auto_104692 ?auto_104693 ) ) ( not ( = ?auto_104692 ?auto_104694 ) ) ( not ( = ?auto_104693 ?auto_104694 ) ) )
    :subtasks
    ( ( !STACK ?auto_104693 ?auto_104694 )
      ( MAKE-2PILE ?auto_104690 ?auto_104691 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104695 - BLOCK
      ?auto_104696 - BLOCK
    )
    :vars
    (
      ?auto_104697 - BLOCK
      ?auto_104699 - BLOCK
      ?auto_104698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104697 ?auto_104696 ) ( ON-TABLE ?auto_104695 ) ( ON ?auto_104696 ?auto_104695 ) ( not ( = ?auto_104695 ?auto_104696 ) ) ( not ( = ?auto_104695 ?auto_104697 ) ) ( not ( = ?auto_104696 ?auto_104697 ) ) ( CLEAR ?auto_104699 ) ( not ( = ?auto_104695 ?auto_104698 ) ) ( not ( = ?auto_104695 ?auto_104699 ) ) ( not ( = ?auto_104696 ?auto_104698 ) ) ( not ( = ?auto_104696 ?auto_104699 ) ) ( not ( = ?auto_104697 ?auto_104698 ) ) ( not ( = ?auto_104697 ?auto_104699 ) ) ( not ( = ?auto_104698 ?auto_104699 ) ) ( ON ?auto_104698 ?auto_104697 ) ( CLEAR ?auto_104698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104695 ?auto_104696 ?auto_104697 )
      ( MAKE-2PILE ?auto_104695 ?auto_104696 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104700 - BLOCK
      ?auto_104701 - BLOCK
    )
    :vars
    (
      ?auto_104703 - BLOCK
      ?auto_104702 - BLOCK
      ?auto_104704 - BLOCK
      ?auto_104706 - BLOCK
      ?auto_104707 - BLOCK
      ?auto_104705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104703 ?auto_104701 ) ( ON-TABLE ?auto_104700 ) ( ON ?auto_104701 ?auto_104700 ) ( not ( = ?auto_104700 ?auto_104701 ) ) ( not ( = ?auto_104700 ?auto_104703 ) ) ( not ( = ?auto_104701 ?auto_104703 ) ) ( not ( = ?auto_104700 ?auto_104702 ) ) ( not ( = ?auto_104700 ?auto_104704 ) ) ( not ( = ?auto_104701 ?auto_104702 ) ) ( not ( = ?auto_104701 ?auto_104704 ) ) ( not ( = ?auto_104703 ?auto_104702 ) ) ( not ( = ?auto_104703 ?auto_104704 ) ) ( not ( = ?auto_104702 ?auto_104704 ) ) ( ON ?auto_104702 ?auto_104703 ) ( CLEAR ?auto_104702 ) ( HOLDING ?auto_104704 ) ( CLEAR ?auto_104706 ) ( ON-TABLE ?auto_104707 ) ( ON ?auto_104705 ?auto_104707 ) ( ON ?auto_104706 ?auto_104705 ) ( not ( = ?auto_104707 ?auto_104705 ) ) ( not ( = ?auto_104707 ?auto_104706 ) ) ( not ( = ?auto_104707 ?auto_104704 ) ) ( not ( = ?auto_104705 ?auto_104706 ) ) ( not ( = ?auto_104705 ?auto_104704 ) ) ( not ( = ?auto_104706 ?auto_104704 ) ) ( not ( = ?auto_104700 ?auto_104706 ) ) ( not ( = ?auto_104700 ?auto_104707 ) ) ( not ( = ?auto_104700 ?auto_104705 ) ) ( not ( = ?auto_104701 ?auto_104706 ) ) ( not ( = ?auto_104701 ?auto_104707 ) ) ( not ( = ?auto_104701 ?auto_104705 ) ) ( not ( = ?auto_104703 ?auto_104706 ) ) ( not ( = ?auto_104703 ?auto_104707 ) ) ( not ( = ?auto_104703 ?auto_104705 ) ) ( not ( = ?auto_104702 ?auto_104706 ) ) ( not ( = ?auto_104702 ?auto_104707 ) ) ( not ( = ?auto_104702 ?auto_104705 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104707 ?auto_104705 ?auto_104706 ?auto_104704 )
      ( MAKE-2PILE ?auto_104700 ?auto_104701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104708 - BLOCK
      ?auto_104709 - BLOCK
    )
    :vars
    (
      ?auto_104711 - BLOCK
      ?auto_104712 - BLOCK
      ?auto_104710 - BLOCK
      ?auto_104714 - BLOCK
      ?auto_104713 - BLOCK
      ?auto_104715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104711 ?auto_104709 ) ( ON-TABLE ?auto_104708 ) ( ON ?auto_104709 ?auto_104708 ) ( not ( = ?auto_104708 ?auto_104709 ) ) ( not ( = ?auto_104708 ?auto_104711 ) ) ( not ( = ?auto_104709 ?auto_104711 ) ) ( not ( = ?auto_104708 ?auto_104712 ) ) ( not ( = ?auto_104708 ?auto_104710 ) ) ( not ( = ?auto_104709 ?auto_104712 ) ) ( not ( = ?auto_104709 ?auto_104710 ) ) ( not ( = ?auto_104711 ?auto_104712 ) ) ( not ( = ?auto_104711 ?auto_104710 ) ) ( not ( = ?auto_104712 ?auto_104710 ) ) ( ON ?auto_104712 ?auto_104711 ) ( CLEAR ?auto_104714 ) ( ON-TABLE ?auto_104713 ) ( ON ?auto_104715 ?auto_104713 ) ( ON ?auto_104714 ?auto_104715 ) ( not ( = ?auto_104713 ?auto_104715 ) ) ( not ( = ?auto_104713 ?auto_104714 ) ) ( not ( = ?auto_104713 ?auto_104710 ) ) ( not ( = ?auto_104715 ?auto_104714 ) ) ( not ( = ?auto_104715 ?auto_104710 ) ) ( not ( = ?auto_104714 ?auto_104710 ) ) ( not ( = ?auto_104708 ?auto_104714 ) ) ( not ( = ?auto_104708 ?auto_104713 ) ) ( not ( = ?auto_104708 ?auto_104715 ) ) ( not ( = ?auto_104709 ?auto_104714 ) ) ( not ( = ?auto_104709 ?auto_104713 ) ) ( not ( = ?auto_104709 ?auto_104715 ) ) ( not ( = ?auto_104711 ?auto_104714 ) ) ( not ( = ?auto_104711 ?auto_104713 ) ) ( not ( = ?auto_104711 ?auto_104715 ) ) ( not ( = ?auto_104712 ?auto_104714 ) ) ( not ( = ?auto_104712 ?auto_104713 ) ) ( not ( = ?auto_104712 ?auto_104715 ) ) ( ON ?auto_104710 ?auto_104712 ) ( CLEAR ?auto_104710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104708 ?auto_104709 ?auto_104711 ?auto_104712 )
      ( MAKE-2PILE ?auto_104708 ?auto_104709 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104716 - BLOCK
      ?auto_104717 - BLOCK
    )
    :vars
    (
      ?auto_104723 - BLOCK
      ?auto_104719 - BLOCK
      ?auto_104722 - BLOCK
      ?auto_104720 - BLOCK
      ?auto_104721 - BLOCK
      ?auto_104718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104723 ?auto_104717 ) ( ON-TABLE ?auto_104716 ) ( ON ?auto_104717 ?auto_104716 ) ( not ( = ?auto_104716 ?auto_104717 ) ) ( not ( = ?auto_104716 ?auto_104723 ) ) ( not ( = ?auto_104717 ?auto_104723 ) ) ( not ( = ?auto_104716 ?auto_104719 ) ) ( not ( = ?auto_104716 ?auto_104722 ) ) ( not ( = ?auto_104717 ?auto_104719 ) ) ( not ( = ?auto_104717 ?auto_104722 ) ) ( not ( = ?auto_104723 ?auto_104719 ) ) ( not ( = ?auto_104723 ?auto_104722 ) ) ( not ( = ?auto_104719 ?auto_104722 ) ) ( ON ?auto_104719 ?auto_104723 ) ( ON-TABLE ?auto_104720 ) ( ON ?auto_104721 ?auto_104720 ) ( not ( = ?auto_104720 ?auto_104721 ) ) ( not ( = ?auto_104720 ?auto_104718 ) ) ( not ( = ?auto_104720 ?auto_104722 ) ) ( not ( = ?auto_104721 ?auto_104718 ) ) ( not ( = ?auto_104721 ?auto_104722 ) ) ( not ( = ?auto_104718 ?auto_104722 ) ) ( not ( = ?auto_104716 ?auto_104718 ) ) ( not ( = ?auto_104716 ?auto_104720 ) ) ( not ( = ?auto_104716 ?auto_104721 ) ) ( not ( = ?auto_104717 ?auto_104718 ) ) ( not ( = ?auto_104717 ?auto_104720 ) ) ( not ( = ?auto_104717 ?auto_104721 ) ) ( not ( = ?auto_104723 ?auto_104718 ) ) ( not ( = ?auto_104723 ?auto_104720 ) ) ( not ( = ?auto_104723 ?auto_104721 ) ) ( not ( = ?auto_104719 ?auto_104718 ) ) ( not ( = ?auto_104719 ?auto_104720 ) ) ( not ( = ?auto_104719 ?auto_104721 ) ) ( ON ?auto_104722 ?auto_104719 ) ( CLEAR ?auto_104722 ) ( HOLDING ?auto_104718 ) ( CLEAR ?auto_104721 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104720 ?auto_104721 ?auto_104718 )
      ( MAKE-2PILE ?auto_104716 ?auto_104717 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104724 - BLOCK
      ?auto_104725 - BLOCK
    )
    :vars
    (
      ?auto_104729 - BLOCK
      ?auto_104726 - BLOCK
      ?auto_104731 - BLOCK
      ?auto_104728 - BLOCK
      ?auto_104730 - BLOCK
      ?auto_104727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104729 ?auto_104725 ) ( ON-TABLE ?auto_104724 ) ( ON ?auto_104725 ?auto_104724 ) ( not ( = ?auto_104724 ?auto_104725 ) ) ( not ( = ?auto_104724 ?auto_104729 ) ) ( not ( = ?auto_104725 ?auto_104729 ) ) ( not ( = ?auto_104724 ?auto_104726 ) ) ( not ( = ?auto_104724 ?auto_104731 ) ) ( not ( = ?auto_104725 ?auto_104726 ) ) ( not ( = ?auto_104725 ?auto_104731 ) ) ( not ( = ?auto_104729 ?auto_104726 ) ) ( not ( = ?auto_104729 ?auto_104731 ) ) ( not ( = ?auto_104726 ?auto_104731 ) ) ( ON ?auto_104726 ?auto_104729 ) ( ON-TABLE ?auto_104728 ) ( ON ?auto_104730 ?auto_104728 ) ( not ( = ?auto_104728 ?auto_104730 ) ) ( not ( = ?auto_104728 ?auto_104727 ) ) ( not ( = ?auto_104728 ?auto_104731 ) ) ( not ( = ?auto_104730 ?auto_104727 ) ) ( not ( = ?auto_104730 ?auto_104731 ) ) ( not ( = ?auto_104727 ?auto_104731 ) ) ( not ( = ?auto_104724 ?auto_104727 ) ) ( not ( = ?auto_104724 ?auto_104728 ) ) ( not ( = ?auto_104724 ?auto_104730 ) ) ( not ( = ?auto_104725 ?auto_104727 ) ) ( not ( = ?auto_104725 ?auto_104728 ) ) ( not ( = ?auto_104725 ?auto_104730 ) ) ( not ( = ?auto_104729 ?auto_104727 ) ) ( not ( = ?auto_104729 ?auto_104728 ) ) ( not ( = ?auto_104729 ?auto_104730 ) ) ( not ( = ?auto_104726 ?auto_104727 ) ) ( not ( = ?auto_104726 ?auto_104728 ) ) ( not ( = ?auto_104726 ?auto_104730 ) ) ( ON ?auto_104731 ?auto_104726 ) ( CLEAR ?auto_104730 ) ( ON ?auto_104727 ?auto_104731 ) ( CLEAR ?auto_104727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104724 ?auto_104725 ?auto_104729 ?auto_104726 ?auto_104731 )
      ( MAKE-2PILE ?auto_104724 ?auto_104725 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104732 - BLOCK
      ?auto_104733 - BLOCK
    )
    :vars
    (
      ?auto_104734 - BLOCK
      ?auto_104739 - BLOCK
      ?auto_104737 - BLOCK
      ?auto_104738 - BLOCK
      ?auto_104735 - BLOCK
      ?auto_104736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104734 ?auto_104733 ) ( ON-TABLE ?auto_104732 ) ( ON ?auto_104733 ?auto_104732 ) ( not ( = ?auto_104732 ?auto_104733 ) ) ( not ( = ?auto_104732 ?auto_104734 ) ) ( not ( = ?auto_104733 ?auto_104734 ) ) ( not ( = ?auto_104732 ?auto_104739 ) ) ( not ( = ?auto_104732 ?auto_104737 ) ) ( not ( = ?auto_104733 ?auto_104739 ) ) ( not ( = ?auto_104733 ?auto_104737 ) ) ( not ( = ?auto_104734 ?auto_104739 ) ) ( not ( = ?auto_104734 ?auto_104737 ) ) ( not ( = ?auto_104739 ?auto_104737 ) ) ( ON ?auto_104739 ?auto_104734 ) ( ON-TABLE ?auto_104738 ) ( not ( = ?auto_104738 ?auto_104735 ) ) ( not ( = ?auto_104738 ?auto_104736 ) ) ( not ( = ?auto_104738 ?auto_104737 ) ) ( not ( = ?auto_104735 ?auto_104736 ) ) ( not ( = ?auto_104735 ?auto_104737 ) ) ( not ( = ?auto_104736 ?auto_104737 ) ) ( not ( = ?auto_104732 ?auto_104736 ) ) ( not ( = ?auto_104732 ?auto_104738 ) ) ( not ( = ?auto_104732 ?auto_104735 ) ) ( not ( = ?auto_104733 ?auto_104736 ) ) ( not ( = ?auto_104733 ?auto_104738 ) ) ( not ( = ?auto_104733 ?auto_104735 ) ) ( not ( = ?auto_104734 ?auto_104736 ) ) ( not ( = ?auto_104734 ?auto_104738 ) ) ( not ( = ?auto_104734 ?auto_104735 ) ) ( not ( = ?auto_104739 ?auto_104736 ) ) ( not ( = ?auto_104739 ?auto_104738 ) ) ( not ( = ?auto_104739 ?auto_104735 ) ) ( ON ?auto_104737 ?auto_104739 ) ( ON ?auto_104736 ?auto_104737 ) ( CLEAR ?auto_104736 ) ( HOLDING ?auto_104735 ) ( CLEAR ?auto_104738 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104738 ?auto_104735 )
      ( MAKE-2PILE ?auto_104732 ?auto_104733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104740 - BLOCK
      ?auto_104741 - BLOCK
    )
    :vars
    (
      ?auto_104744 - BLOCK
      ?auto_104743 - BLOCK
      ?auto_104747 - BLOCK
      ?auto_104742 - BLOCK
      ?auto_104746 - BLOCK
      ?auto_104745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104744 ?auto_104741 ) ( ON-TABLE ?auto_104740 ) ( ON ?auto_104741 ?auto_104740 ) ( not ( = ?auto_104740 ?auto_104741 ) ) ( not ( = ?auto_104740 ?auto_104744 ) ) ( not ( = ?auto_104741 ?auto_104744 ) ) ( not ( = ?auto_104740 ?auto_104743 ) ) ( not ( = ?auto_104740 ?auto_104747 ) ) ( not ( = ?auto_104741 ?auto_104743 ) ) ( not ( = ?auto_104741 ?auto_104747 ) ) ( not ( = ?auto_104744 ?auto_104743 ) ) ( not ( = ?auto_104744 ?auto_104747 ) ) ( not ( = ?auto_104743 ?auto_104747 ) ) ( ON ?auto_104743 ?auto_104744 ) ( ON-TABLE ?auto_104742 ) ( not ( = ?auto_104742 ?auto_104746 ) ) ( not ( = ?auto_104742 ?auto_104745 ) ) ( not ( = ?auto_104742 ?auto_104747 ) ) ( not ( = ?auto_104746 ?auto_104745 ) ) ( not ( = ?auto_104746 ?auto_104747 ) ) ( not ( = ?auto_104745 ?auto_104747 ) ) ( not ( = ?auto_104740 ?auto_104745 ) ) ( not ( = ?auto_104740 ?auto_104742 ) ) ( not ( = ?auto_104740 ?auto_104746 ) ) ( not ( = ?auto_104741 ?auto_104745 ) ) ( not ( = ?auto_104741 ?auto_104742 ) ) ( not ( = ?auto_104741 ?auto_104746 ) ) ( not ( = ?auto_104744 ?auto_104745 ) ) ( not ( = ?auto_104744 ?auto_104742 ) ) ( not ( = ?auto_104744 ?auto_104746 ) ) ( not ( = ?auto_104743 ?auto_104745 ) ) ( not ( = ?auto_104743 ?auto_104742 ) ) ( not ( = ?auto_104743 ?auto_104746 ) ) ( ON ?auto_104747 ?auto_104743 ) ( ON ?auto_104745 ?auto_104747 ) ( CLEAR ?auto_104742 ) ( ON ?auto_104746 ?auto_104745 ) ( CLEAR ?auto_104746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104740 ?auto_104741 ?auto_104744 ?auto_104743 ?auto_104747 ?auto_104745 )
      ( MAKE-2PILE ?auto_104740 ?auto_104741 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104748 - BLOCK
      ?auto_104749 - BLOCK
    )
    :vars
    (
      ?auto_104751 - BLOCK
      ?auto_104750 - BLOCK
      ?auto_104753 - BLOCK
      ?auto_104754 - BLOCK
      ?auto_104755 - BLOCK
      ?auto_104752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104751 ?auto_104749 ) ( ON-TABLE ?auto_104748 ) ( ON ?auto_104749 ?auto_104748 ) ( not ( = ?auto_104748 ?auto_104749 ) ) ( not ( = ?auto_104748 ?auto_104751 ) ) ( not ( = ?auto_104749 ?auto_104751 ) ) ( not ( = ?auto_104748 ?auto_104750 ) ) ( not ( = ?auto_104748 ?auto_104753 ) ) ( not ( = ?auto_104749 ?auto_104750 ) ) ( not ( = ?auto_104749 ?auto_104753 ) ) ( not ( = ?auto_104751 ?auto_104750 ) ) ( not ( = ?auto_104751 ?auto_104753 ) ) ( not ( = ?auto_104750 ?auto_104753 ) ) ( ON ?auto_104750 ?auto_104751 ) ( not ( = ?auto_104754 ?auto_104755 ) ) ( not ( = ?auto_104754 ?auto_104752 ) ) ( not ( = ?auto_104754 ?auto_104753 ) ) ( not ( = ?auto_104755 ?auto_104752 ) ) ( not ( = ?auto_104755 ?auto_104753 ) ) ( not ( = ?auto_104752 ?auto_104753 ) ) ( not ( = ?auto_104748 ?auto_104752 ) ) ( not ( = ?auto_104748 ?auto_104754 ) ) ( not ( = ?auto_104748 ?auto_104755 ) ) ( not ( = ?auto_104749 ?auto_104752 ) ) ( not ( = ?auto_104749 ?auto_104754 ) ) ( not ( = ?auto_104749 ?auto_104755 ) ) ( not ( = ?auto_104751 ?auto_104752 ) ) ( not ( = ?auto_104751 ?auto_104754 ) ) ( not ( = ?auto_104751 ?auto_104755 ) ) ( not ( = ?auto_104750 ?auto_104752 ) ) ( not ( = ?auto_104750 ?auto_104754 ) ) ( not ( = ?auto_104750 ?auto_104755 ) ) ( ON ?auto_104753 ?auto_104750 ) ( ON ?auto_104752 ?auto_104753 ) ( ON ?auto_104755 ?auto_104752 ) ( CLEAR ?auto_104755 ) ( HOLDING ?auto_104754 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104754 )
      ( MAKE-2PILE ?auto_104748 ?auto_104749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104756 - BLOCK
      ?auto_104757 - BLOCK
    )
    :vars
    (
      ?auto_104762 - BLOCK
      ?auto_104759 - BLOCK
      ?auto_104761 - BLOCK
      ?auto_104758 - BLOCK
      ?auto_104763 - BLOCK
      ?auto_104760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104762 ?auto_104757 ) ( ON-TABLE ?auto_104756 ) ( ON ?auto_104757 ?auto_104756 ) ( not ( = ?auto_104756 ?auto_104757 ) ) ( not ( = ?auto_104756 ?auto_104762 ) ) ( not ( = ?auto_104757 ?auto_104762 ) ) ( not ( = ?auto_104756 ?auto_104759 ) ) ( not ( = ?auto_104756 ?auto_104761 ) ) ( not ( = ?auto_104757 ?auto_104759 ) ) ( not ( = ?auto_104757 ?auto_104761 ) ) ( not ( = ?auto_104762 ?auto_104759 ) ) ( not ( = ?auto_104762 ?auto_104761 ) ) ( not ( = ?auto_104759 ?auto_104761 ) ) ( ON ?auto_104759 ?auto_104762 ) ( not ( = ?auto_104758 ?auto_104763 ) ) ( not ( = ?auto_104758 ?auto_104760 ) ) ( not ( = ?auto_104758 ?auto_104761 ) ) ( not ( = ?auto_104763 ?auto_104760 ) ) ( not ( = ?auto_104763 ?auto_104761 ) ) ( not ( = ?auto_104760 ?auto_104761 ) ) ( not ( = ?auto_104756 ?auto_104760 ) ) ( not ( = ?auto_104756 ?auto_104758 ) ) ( not ( = ?auto_104756 ?auto_104763 ) ) ( not ( = ?auto_104757 ?auto_104760 ) ) ( not ( = ?auto_104757 ?auto_104758 ) ) ( not ( = ?auto_104757 ?auto_104763 ) ) ( not ( = ?auto_104762 ?auto_104760 ) ) ( not ( = ?auto_104762 ?auto_104758 ) ) ( not ( = ?auto_104762 ?auto_104763 ) ) ( not ( = ?auto_104759 ?auto_104760 ) ) ( not ( = ?auto_104759 ?auto_104758 ) ) ( not ( = ?auto_104759 ?auto_104763 ) ) ( ON ?auto_104761 ?auto_104759 ) ( ON ?auto_104760 ?auto_104761 ) ( ON ?auto_104763 ?auto_104760 ) ( ON ?auto_104758 ?auto_104763 ) ( CLEAR ?auto_104758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104756 ?auto_104757 ?auto_104762 ?auto_104759 ?auto_104761 ?auto_104760 ?auto_104763 )
      ( MAKE-2PILE ?auto_104756 ?auto_104757 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104770 - BLOCK
      ?auto_104771 - BLOCK
      ?auto_104772 - BLOCK
      ?auto_104773 - BLOCK
      ?auto_104774 - BLOCK
      ?auto_104775 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104775 ) ( CLEAR ?auto_104774 ) ( ON-TABLE ?auto_104770 ) ( ON ?auto_104771 ?auto_104770 ) ( ON ?auto_104772 ?auto_104771 ) ( ON ?auto_104773 ?auto_104772 ) ( ON ?auto_104774 ?auto_104773 ) ( not ( = ?auto_104770 ?auto_104771 ) ) ( not ( = ?auto_104770 ?auto_104772 ) ) ( not ( = ?auto_104770 ?auto_104773 ) ) ( not ( = ?auto_104770 ?auto_104774 ) ) ( not ( = ?auto_104770 ?auto_104775 ) ) ( not ( = ?auto_104771 ?auto_104772 ) ) ( not ( = ?auto_104771 ?auto_104773 ) ) ( not ( = ?auto_104771 ?auto_104774 ) ) ( not ( = ?auto_104771 ?auto_104775 ) ) ( not ( = ?auto_104772 ?auto_104773 ) ) ( not ( = ?auto_104772 ?auto_104774 ) ) ( not ( = ?auto_104772 ?auto_104775 ) ) ( not ( = ?auto_104773 ?auto_104774 ) ) ( not ( = ?auto_104773 ?auto_104775 ) ) ( not ( = ?auto_104774 ?auto_104775 ) ) )
    :subtasks
    ( ( !STACK ?auto_104775 ?auto_104774 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104776 - BLOCK
      ?auto_104777 - BLOCK
      ?auto_104778 - BLOCK
      ?auto_104779 - BLOCK
      ?auto_104780 - BLOCK
      ?auto_104781 - BLOCK
    )
    :vars
    (
      ?auto_104782 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104780 ) ( ON-TABLE ?auto_104776 ) ( ON ?auto_104777 ?auto_104776 ) ( ON ?auto_104778 ?auto_104777 ) ( ON ?auto_104779 ?auto_104778 ) ( ON ?auto_104780 ?auto_104779 ) ( not ( = ?auto_104776 ?auto_104777 ) ) ( not ( = ?auto_104776 ?auto_104778 ) ) ( not ( = ?auto_104776 ?auto_104779 ) ) ( not ( = ?auto_104776 ?auto_104780 ) ) ( not ( = ?auto_104776 ?auto_104781 ) ) ( not ( = ?auto_104777 ?auto_104778 ) ) ( not ( = ?auto_104777 ?auto_104779 ) ) ( not ( = ?auto_104777 ?auto_104780 ) ) ( not ( = ?auto_104777 ?auto_104781 ) ) ( not ( = ?auto_104778 ?auto_104779 ) ) ( not ( = ?auto_104778 ?auto_104780 ) ) ( not ( = ?auto_104778 ?auto_104781 ) ) ( not ( = ?auto_104779 ?auto_104780 ) ) ( not ( = ?auto_104779 ?auto_104781 ) ) ( not ( = ?auto_104780 ?auto_104781 ) ) ( ON ?auto_104781 ?auto_104782 ) ( CLEAR ?auto_104781 ) ( HAND-EMPTY ) ( not ( = ?auto_104776 ?auto_104782 ) ) ( not ( = ?auto_104777 ?auto_104782 ) ) ( not ( = ?auto_104778 ?auto_104782 ) ) ( not ( = ?auto_104779 ?auto_104782 ) ) ( not ( = ?auto_104780 ?auto_104782 ) ) ( not ( = ?auto_104781 ?auto_104782 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104781 ?auto_104782 )
      ( MAKE-6PILE ?auto_104776 ?auto_104777 ?auto_104778 ?auto_104779 ?auto_104780 ?auto_104781 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104783 - BLOCK
      ?auto_104784 - BLOCK
      ?auto_104785 - BLOCK
      ?auto_104786 - BLOCK
      ?auto_104787 - BLOCK
      ?auto_104788 - BLOCK
    )
    :vars
    (
      ?auto_104789 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104783 ) ( ON ?auto_104784 ?auto_104783 ) ( ON ?auto_104785 ?auto_104784 ) ( ON ?auto_104786 ?auto_104785 ) ( not ( = ?auto_104783 ?auto_104784 ) ) ( not ( = ?auto_104783 ?auto_104785 ) ) ( not ( = ?auto_104783 ?auto_104786 ) ) ( not ( = ?auto_104783 ?auto_104787 ) ) ( not ( = ?auto_104783 ?auto_104788 ) ) ( not ( = ?auto_104784 ?auto_104785 ) ) ( not ( = ?auto_104784 ?auto_104786 ) ) ( not ( = ?auto_104784 ?auto_104787 ) ) ( not ( = ?auto_104784 ?auto_104788 ) ) ( not ( = ?auto_104785 ?auto_104786 ) ) ( not ( = ?auto_104785 ?auto_104787 ) ) ( not ( = ?auto_104785 ?auto_104788 ) ) ( not ( = ?auto_104786 ?auto_104787 ) ) ( not ( = ?auto_104786 ?auto_104788 ) ) ( not ( = ?auto_104787 ?auto_104788 ) ) ( ON ?auto_104788 ?auto_104789 ) ( CLEAR ?auto_104788 ) ( not ( = ?auto_104783 ?auto_104789 ) ) ( not ( = ?auto_104784 ?auto_104789 ) ) ( not ( = ?auto_104785 ?auto_104789 ) ) ( not ( = ?auto_104786 ?auto_104789 ) ) ( not ( = ?auto_104787 ?auto_104789 ) ) ( not ( = ?auto_104788 ?auto_104789 ) ) ( HOLDING ?auto_104787 ) ( CLEAR ?auto_104786 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104783 ?auto_104784 ?auto_104785 ?auto_104786 ?auto_104787 )
      ( MAKE-6PILE ?auto_104783 ?auto_104784 ?auto_104785 ?auto_104786 ?auto_104787 ?auto_104788 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104790 - BLOCK
      ?auto_104791 - BLOCK
      ?auto_104792 - BLOCK
      ?auto_104793 - BLOCK
      ?auto_104794 - BLOCK
      ?auto_104795 - BLOCK
    )
    :vars
    (
      ?auto_104796 - BLOCK
      ?auto_104797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104790 ) ( ON ?auto_104791 ?auto_104790 ) ( ON ?auto_104792 ?auto_104791 ) ( ON ?auto_104793 ?auto_104792 ) ( not ( = ?auto_104790 ?auto_104791 ) ) ( not ( = ?auto_104790 ?auto_104792 ) ) ( not ( = ?auto_104790 ?auto_104793 ) ) ( not ( = ?auto_104790 ?auto_104794 ) ) ( not ( = ?auto_104790 ?auto_104795 ) ) ( not ( = ?auto_104791 ?auto_104792 ) ) ( not ( = ?auto_104791 ?auto_104793 ) ) ( not ( = ?auto_104791 ?auto_104794 ) ) ( not ( = ?auto_104791 ?auto_104795 ) ) ( not ( = ?auto_104792 ?auto_104793 ) ) ( not ( = ?auto_104792 ?auto_104794 ) ) ( not ( = ?auto_104792 ?auto_104795 ) ) ( not ( = ?auto_104793 ?auto_104794 ) ) ( not ( = ?auto_104793 ?auto_104795 ) ) ( not ( = ?auto_104794 ?auto_104795 ) ) ( ON ?auto_104795 ?auto_104796 ) ( not ( = ?auto_104790 ?auto_104796 ) ) ( not ( = ?auto_104791 ?auto_104796 ) ) ( not ( = ?auto_104792 ?auto_104796 ) ) ( not ( = ?auto_104793 ?auto_104796 ) ) ( not ( = ?auto_104794 ?auto_104796 ) ) ( not ( = ?auto_104795 ?auto_104796 ) ) ( CLEAR ?auto_104793 ) ( ON ?auto_104794 ?auto_104795 ) ( CLEAR ?auto_104794 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104797 ) ( ON ?auto_104796 ?auto_104797 ) ( not ( = ?auto_104797 ?auto_104796 ) ) ( not ( = ?auto_104797 ?auto_104795 ) ) ( not ( = ?auto_104797 ?auto_104794 ) ) ( not ( = ?auto_104790 ?auto_104797 ) ) ( not ( = ?auto_104791 ?auto_104797 ) ) ( not ( = ?auto_104792 ?auto_104797 ) ) ( not ( = ?auto_104793 ?auto_104797 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104797 ?auto_104796 ?auto_104795 )
      ( MAKE-6PILE ?auto_104790 ?auto_104791 ?auto_104792 ?auto_104793 ?auto_104794 ?auto_104795 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104798 - BLOCK
      ?auto_104799 - BLOCK
      ?auto_104800 - BLOCK
      ?auto_104801 - BLOCK
      ?auto_104802 - BLOCK
      ?auto_104803 - BLOCK
    )
    :vars
    (
      ?auto_104805 - BLOCK
      ?auto_104804 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104798 ) ( ON ?auto_104799 ?auto_104798 ) ( ON ?auto_104800 ?auto_104799 ) ( not ( = ?auto_104798 ?auto_104799 ) ) ( not ( = ?auto_104798 ?auto_104800 ) ) ( not ( = ?auto_104798 ?auto_104801 ) ) ( not ( = ?auto_104798 ?auto_104802 ) ) ( not ( = ?auto_104798 ?auto_104803 ) ) ( not ( = ?auto_104799 ?auto_104800 ) ) ( not ( = ?auto_104799 ?auto_104801 ) ) ( not ( = ?auto_104799 ?auto_104802 ) ) ( not ( = ?auto_104799 ?auto_104803 ) ) ( not ( = ?auto_104800 ?auto_104801 ) ) ( not ( = ?auto_104800 ?auto_104802 ) ) ( not ( = ?auto_104800 ?auto_104803 ) ) ( not ( = ?auto_104801 ?auto_104802 ) ) ( not ( = ?auto_104801 ?auto_104803 ) ) ( not ( = ?auto_104802 ?auto_104803 ) ) ( ON ?auto_104803 ?auto_104805 ) ( not ( = ?auto_104798 ?auto_104805 ) ) ( not ( = ?auto_104799 ?auto_104805 ) ) ( not ( = ?auto_104800 ?auto_104805 ) ) ( not ( = ?auto_104801 ?auto_104805 ) ) ( not ( = ?auto_104802 ?auto_104805 ) ) ( not ( = ?auto_104803 ?auto_104805 ) ) ( ON ?auto_104802 ?auto_104803 ) ( CLEAR ?auto_104802 ) ( ON-TABLE ?auto_104804 ) ( ON ?auto_104805 ?auto_104804 ) ( not ( = ?auto_104804 ?auto_104805 ) ) ( not ( = ?auto_104804 ?auto_104803 ) ) ( not ( = ?auto_104804 ?auto_104802 ) ) ( not ( = ?auto_104798 ?auto_104804 ) ) ( not ( = ?auto_104799 ?auto_104804 ) ) ( not ( = ?auto_104800 ?auto_104804 ) ) ( not ( = ?auto_104801 ?auto_104804 ) ) ( HOLDING ?auto_104801 ) ( CLEAR ?auto_104800 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104798 ?auto_104799 ?auto_104800 ?auto_104801 )
      ( MAKE-6PILE ?auto_104798 ?auto_104799 ?auto_104800 ?auto_104801 ?auto_104802 ?auto_104803 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104806 - BLOCK
      ?auto_104807 - BLOCK
      ?auto_104808 - BLOCK
      ?auto_104809 - BLOCK
      ?auto_104810 - BLOCK
      ?auto_104811 - BLOCK
    )
    :vars
    (
      ?auto_104813 - BLOCK
      ?auto_104812 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104806 ) ( ON ?auto_104807 ?auto_104806 ) ( ON ?auto_104808 ?auto_104807 ) ( not ( = ?auto_104806 ?auto_104807 ) ) ( not ( = ?auto_104806 ?auto_104808 ) ) ( not ( = ?auto_104806 ?auto_104809 ) ) ( not ( = ?auto_104806 ?auto_104810 ) ) ( not ( = ?auto_104806 ?auto_104811 ) ) ( not ( = ?auto_104807 ?auto_104808 ) ) ( not ( = ?auto_104807 ?auto_104809 ) ) ( not ( = ?auto_104807 ?auto_104810 ) ) ( not ( = ?auto_104807 ?auto_104811 ) ) ( not ( = ?auto_104808 ?auto_104809 ) ) ( not ( = ?auto_104808 ?auto_104810 ) ) ( not ( = ?auto_104808 ?auto_104811 ) ) ( not ( = ?auto_104809 ?auto_104810 ) ) ( not ( = ?auto_104809 ?auto_104811 ) ) ( not ( = ?auto_104810 ?auto_104811 ) ) ( ON ?auto_104811 ?auto_104813 ) ( not ( = ?auto_104806 ?auto_104813 ) ) ( not ( = ?auto_104807 ?auto_104813 ) ) ( not ( = ?auto_104808 ?auto_104813 ) ) ( not ( = ?auto_104809 ?auto_104813 ) ) ( not ( = ?auto_104810 ?auto_104813 ) ) ( not ( = ?auto_104811 ?auto_104813 ) ) ( ON ?auto_104810 ?auto_104811 ) ( ON-TABLE ?auto_104812 ) ( ON ?auto_104813 ?auto_104812 ) ( not ( = ?auto_104812 ?auto_104813 ) ) ( not ( = ?auto_104812 ?auto_104811 ) ) ( not ( = ?auto_104812 ?auto_104810 ) ) ( not ( = ?auto_104806 ?auto_104812 ) ) ( not ( = ?auto_104807 ?auto_104812 ) ) ( not ( = ?auto_104808 ?auto_104812 ) ) ( not ( = ?auto_104809 ?auto_104812 ) ) ( CLEAR ?auto_104808 ) ( ON ?auto_104809 ?auto_104810 ) ( CLEAR ?auto_104809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104812 ?auto_104813 ?auto_104811 ?auto_104810 )
      ( MAKE-6PILE ?auto_104806 ?auto_104807 ?auto_104808 ?auto_104809 ?auto_104810 ?auto_104811 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104814 - BLOCK
      ?auto_104815 - BLOCK
      ?auto_104816 - BLOCK
      ?auto_104817 - BLOCK
      ?auto_104818 - BLOCK
      ?auto_104819 - BLOCK
    )
    :vars
    (
      ?auto_104820 - BLOCK
      ?auto_104821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104814 ) ( ON ?auto_104815 ?auto_104814 ) ( not ( = ?auto_104814 ?auto_104815 ) ) ( not ( = ?auto_104814 ?auto_104816 ) ) ( not ( = ?auto_104814 ?auto_104817 ) ) ( not ( = ?auto_104814 ?auto_104818 ) ) ( not ( = ?auto_104814 ?auto_104819 ) ) ( not ( = ?auto_104815 ?auto_104816 ) ) ( not ( = ?auto_104815 ?auto_104817 ) ) ( not ( = ?auto_104815 ?auto_104818 ) ) ( not ( = ?auto_104815 ?auto_104819 ) ) ( not ( = ?auto_104816 ?auto_104817 ) ) ( not ( = ?auto_104816 ?auto_104818 ) ) ( not ( = ?auto_104816 ?auto_104819 ) ) ( not ( = ?auto_104817 ?auto_104818 ) ) ( not ( = ?auto_104817 ?auto_104819 ) ) ( not ( = ?auto_104818 ?auto_104819 ) ) ( ON ?auto_104819 ?auto_104820 ) ( not ( = ?auto_104814 ?auto_104820 ) ) ( not ( = ?auto_104815 ?auto_104820 ) ) ( not ( = ?auto_104816 ?auto_104820 ) ) ( not ( = ?auto_104817 ?auto_104820 ) ) ( not ( = ?auto_104818 ?auto_104820 ) ) ( not ( = ?auto_104819 ?auto_104820 ) ) ( ON ?auto_104818 ?auto_104819 ) ( ON-TABLE ?auto_104821 ) ( ON ?auto_104820 ?auto_104821 ) ( not ( = ?auto_104821 ?auto_104820 ) ) ( not ( = ?auto_104821 ?auto_104819 ) ) ( not ( = ?auto_104821 ?auto_104818 ) ) ( not ( = ?auto_104814 ?auto_104821 ) ) ( not ( = ?auto_104815 ?auto_104821 ) ) ( not ( = ?auto_104816 ?auto_104821 ) ) ( not ( = ?auto_104817 ?auto_104821 ) ) ( ON ?auto_104817 ?auto_104818 ) ( CLEAR ?auto_104817 ) ( HOLDING ?auto_104816 ) ( CLEAR ?auto_104815 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104814 ?auto_104815 ?auto_104816 )
      ( MAKE-6PILE ?auto_104814 ?auto_104815 ?auto_104816 ?auto_104817 ?auto_104818 ?auto_104819 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104822 - BLOCK
      ?auto_104823 - BLOCK
      ?auto_104824 - BLOCK
      ?auto_104825 - BLOCK
      ?auto_104826 - BLOCK
      ?auto_104827 - BLOCK
    )
    :vars
    (
      ?auto_104828 - BLOCK
      ?auto_104829 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104822 ) ( ON ?auto_104823 ?auto_104822 ) ( not ( = ?auto_104822 ?auto_104823 ) ) ( not ( = ?auto_104822 ?auto_104824 ) ) ( not ( = ?auto_104822 ?auto_104825 ) ) ( not ( = ?auto_104822 ?auto_104826 ) ) ( not ( = ?auto_104822 ?auto_104827 ) ) ( not ( = ?auto_104823 ?auto_104824 ) ) ( not ( = ?auto_104823 ?auto_104825 ) ) ( not ( = ?auto_104823 ?auto_104826 ) ) ( not ( = ?auto_104823 ?auto_104827 ) ) ( not ( = ?auto_104824 ?auto_104825 ) ) ( not ( = ?auto_104824 ?auto_104826 ) ) ( not ( = ?auto_104824 ?auto_104827 ) ) ( not ( = ?auto_104825 ?auto_104826 ) ) ( not ( = ?auto_104825 ?auto_104827 ) ) ( not ( = ?auto_104826 ?auto_104827 ) ) ( ON ?auto_104827 ?auto_104828 ) ( not ( = ?auto_104822 ?auto_104828 ) ) ( not ( = ?auto_104823 ?auto_104828 ) ) ( not ( = ?auto_104824 ?auto_104828 ) ) ( not ( = ?auto_104825 ?auto_104828 ) ) ( not ( = ?auto_104826 ?auto_104828 ) ) ( not ( = ?auto_104827 ?auto_104828 ) ) ( ON ?auto_104826 ?auto_104827 ) ( ON-TABLE ?auto_104829 ) ( ON ?auto_104828 ?auto_104829 ) ( not ( = ?auto_104829 ?auto_104828 ) ) ( not ( = ?auto_104829 ?auto_104827 ) ) ( not ( = ?auto_104829 ?auto_104826 ) ) ( not ( = ?auto_104822 ?auto_104829 ) ) ( not ( = ?auto_104823 ?auto_104829 ) ) ( not ( = ?auto_104824 ?auto_104829 ) ) ( not ( = ?auto_104825 ?auto_104829 ) ) ( ON ?auto_104825 ?auto_104826 ) ( CLEAR ?auto_104823 ) ( ON ?auto_104824 ?auto_104825 ) ( CLEAR ?auto_104824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104829 ?auto_104828 ?auto_104827 ?auto_104826 ?auto_104825 )
      ( MAKE-6PILE ?auto_104822 ?auto_104823 ?auto_104824 ?auto_104825 ?auto_104826 ?auto_104827 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104830 - BLOCK
      ?auto_104831 - BLOCK
      ?auto_104832 - BLOCK
      ?auto_104833 - BLOCK
      ?auto_104834 - BLOCK
      ?auto_104835 - BLOCK
    )
    :vars
    (
      ?auto_104836 - BLOCK
      ?auto_104837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104830 ) ( not ( = ?auto_104830 ?auto_104831 ) ) ( not ( = ?auto_104830 ?auto_104832 ) ) ( not ( = ?auto_104830 ?auto_104833 ) ) ( not ( = ?auto_104830 ?auto_104834 ) ) ( not ( = ?auto_104830 ?auto_104835 ) ) ( not ( = ?auto_104831 ?auto_104832 ) ) ( not ( = ?auto_104831 ?auto_104833 ) ) ( not ( = ?auto_104831 ?auto_104834 ) ) ( not ( = ?auto_104831 ?auto_104835 ) ) ( not ( = ?auto_104832 ?auto_104833 ) ) ( not ( = ?auto_104832 ?auto_104834 ) ) ( not ( = ?auto_104832 ?auto_104835 ) ) ( not ( = ?auto_104833 ?auto_104834 ) ) ( not ( = ?auto_104833 ?auto_104835 ) ) ( not ( = ?auto_104834 ?auto_104835 ) ) ( ON ?auto_104835 ?auto_104836 ) ( not ( = ?auto_104830 ?auto_104836 ) ) ( not ( = ?auto_104831 ?auto_104836 ) ) ( not ( = ?auto_104832 ?auto_104836 ) ) ( not ( = ?auto_104833 ?auto_104836 ) ) ( not ( = ?auto_104834 ?auto_104836 ) ) ( not ( = ?auto_104835 ?auto_104836 ) ) ( ON ?auto_104834 ?auto_104835 ) ( ON-TABLE ?auto_104837 ) ( ON ?auto_104836 ?auto_104837 ) ( not ( = ?auto_104837 ?auto_104836 ) ) ( not ( = ?auto_104837 ?auto_104835 ) ) ( not ( = ?auto_104837 ?auto_104834 ) ) ( not ( = ?auto_104830 ?auto_104837 ) ) ( not ( = ?auto_104831 ?auto_104837 ) ) ( not ( = ?auto_104832 ?auto_104837 ) ) ( not ( = ?auto_104833 ?auto_104837 ) ) ( ON ?auto_104833 ?auto_104834 ) ( ON ?auto_104832 ?auto_104833 ) ( CLEAR ?auto_104832 ) ( HOLDING ?auto_104831 ) ( CLEAR ?auto_104830 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104830 ?auto_104831 )
      ( MAKE-6PILE ?auto_104830 ?auto_104831 ?auto_104832 ?auto_104833 ?auto_104834 ?auto_104835 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104838 - BLOCK
      ?auto_104839 - BLOCK
      ?auto_104840 - BLOCK
      ?auto_104841 - BLOCK
      ?auto_104842 - BLOCK
      ?auto_104843 - BLOCK
    )
    :vars
    (
      ?auto_104845 - BLOCK
      ?auto_104844 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104838 ) ( not ( = ?auto_104838 ?auto_104839 ) ) ( not ( = ?auto_104838 ?auto_104840 ) ) ( not ( = ?auto_104838 ?auto_104841 ) ) ( not ( = ?auto_104838 ?auto_104842 ) ) ( not ( = ?auto_104838 ?auto_104843 ) ) ( not ( = ?auto_104839 ?auto_104840 ) ) ( not ( = ?auto_104839 ?auto_104841 ) ) ( not ( = ?auto_104839 ?auto_104842 ) ) ( not ( = ?auto_104839 ?auto_104843 ) ) ( not ( = ?auto_104840 ?auto_104841 ) ) ( not ( = ?auto_104840 ?auto_104842 ) ) ( not ( = ?auto_104840 ?auto_104843 ) ) ( not ( = ?auto_104841 ?auto_104842 ) ) ( not ( = ?auto_104841 ?auto_104843 ) ) ( not ( = ?auto_104842 ?auto_104843 ) ) ( ON ?auto_104843 ?auto_104845 ) ( not ( = ?auto_104838 ?auto_104845 ) ) ( not ( = ?auto_104839 ?auto_104845 ) ) ( not ( = ?auto_104840 ?auto_104845 ) ) ( not ( = ?auto_104841 ?auto_104845 ) ) ( not ( = ?auto_104842 ?auto_104845 ) ) ( not ( = ?auto_104843 ?auto_104845 ) ) ( ON ?auto_104842 ?auto_104843 ) ( ON-TABLE ?auto_104844 ) ( ON ?auto_104845 ?auto_104844 ) ( not ( = ?auto_104844 ?auto_104845 ) ) ( not ( = ?auto_104844 ?auto_104843 ) ) ( not ( = ?auto_104844 ?auto_104842 ) ) ( not ( = ?auto_104838 ?auto_104844 ) ) ( not ( = ?auto_104839 ?auto_104844 ) ) ( not ( = ?auto_104840 ?auto_104844 ) ) ( not ( = ?auto_104841 ?auto_104844 ) ) ( ON ?auto_104841 ?auto_104842 ) ( ON ?auto_104840 ?auto_104841 ) ( CLEAR ?auto_104838 ) ( ON ?auto_104839 ?auto_104840 ) ( CLEAR ?auto_104839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104844 ?auto_104845 ?auto_104843 ?auto_104842 ?auto_104841 ?auto_104840 )
      ( MAKE-6PILE ?auto_104838 ?auto_104839 ?auto_104840 ?auto_104841 ?auto_104842 ?auto_104843 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104846 - BLOCK
      ?auto_104847 - BLOCK
      ?auto_104848 - BLOCK
      ?auto_104849 - BLOCK
      ?auto_104850 - BLOCK
      ?auto_104851 - BLOCK
    )
    :vars
    (
      ?auto_104853 - BLOCK
      ?auto_104852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104846 ?auto_104847 ) ) ( not ( = ?auto_104846 ?auto_104848 ) ) ( not ( = ?auto_104846 ?auto_104849 ) ) ( not ( = ?auto_104846 ?auto_104850 ) ) ( not ( = ?auto_104846 ?auto_104851 ) ) ( not ( = ?auto_104847 ?auto_104848 ) ) ( not ( = ?auto_104847 ?auto_104849 ) ) ( not ( = ?auto_104847 ?auto_104850 ) ) ( not ( = ?auto_104847 ?auto_104851 ) ) ( not ( = ?auto_104848 ?auto_104849 ) ) ( not ( = ?auto_104848 ?auto_104850 ) ) ( not ( = ?auto_104848 ?auto_104851 ) ) ( not ( = ?auto_104849 ?auto_104850 ) ) ( not ( = ?auto_104849 ?auto_104851 ) ) ( not ( = ?auto_104850 ?auto_104851 ) ) ( ON ?auto_104851 ?auto_104853 ) ( not ( = ?auto_104846 ?auto_104853 ) ) ( not ( = ?auto_104847 ?auto_104853 ) ) ( not ( = ?auto_104848 ?auto_104853 ) ) ( not ( = ?auto_104849 ?auto_104853 ) ) ( not ( = ?auto_104850 ?auto_104853 ) ) ( not ( = ?auto_104851 ?auto_104853 ) ) ( ON ?auto_104850 ?auto_104851 ) ( ON-TABLE ?auto_104852 ) ( ON ?auto_104853 ?auto_104852 ) ( not ( = ?auto_104852 ?auto_104853 ) ) ( not ( = ?auto_104852 ?auto_104851 ) ) ( not ( = ?auto_104852 ?auto_104850 ) ) ( not ( = ?auto_104846 ?auto_104852 ) ) ( not ( = ?auto_104847 ?auto_104852 ) ) ( not ( = ?auto_104848 ?auto_104852 ) ) ( not ( = ?auto_104849 ?auto_104852 ) ) ( ON ?auto_104849 ?auto_104850 ) ( ON ?auto_104848 ?auto_104849 ) ( ON ?auto_104847 ?auto_104848 ) ( CLEAR ?auto_104847 ) ( HOLDING ?auto_104846 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104846 )
      ( MAKE-6PILE ?auto_104846 ?auto_104847 ?auto_104848 ?auto_104849 ?auto_104850 ?auto_104851 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104854 - BLOCK
      ?auto_104855 - BLOCK
      ?auto_104856 - BLOCK
      ?auto_104857 - BLOCK
      ?auto_104858 - BLOCK
      ?auto_104859 - BLOCK
    )
    :vars
    (
      ?auto_104860 - BLOCK
      ?auto_104861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104854 ?auto_104855 ) ) ( not ( = ?auto_104854 ?auto_104856 ) ) ( not ( = ?auto_104854 ?auto_104857 ) ) ( not ( = ?auto_104854 ?auto_104858 ) ) ( not ( = ?auto_104854 ?auto_104859 ) ) ( not ( = ?auto_104855 ?auto_104856 ) ) ( not ( = ?auto_104855 ?auto_104857 ) ) ( not ( = ?auto_104855 ?auto_104858 ) ) ( not ( = ?auto_104855 ?auto_104859 ) ) ( not ( = ?auto_104856 ?auto_104857 ) ) ( not ( = ?auto_104856 ?auto_104858 ) ) ( not ( = ?auto_104856 ?auto_104859 ) ) ( not ( = ?auto_104857 ?auto_104858 ) ) ( not ( = ?auto_104857 ?auto_104859 ) ) ( not ( = ?auto_104858 ?auto_104859 ) ) ( ON ?auto_104859 ?auto_104860 ) ( not ( = ?auto_104854 ?auto_104860 ) ) ( not ( = ?auto_104855 ?auto_104860 ) ) ( not ( = ?auto_104856 ?auto_104860 ) ) ( not ( = ?auto_104857 ?auto_104860 ) ) ( not ( = ?auto_104858 ?auto_104860 ) ) ( not ( = ?auto_104859 ?auto_104860 ) ) ( ON ?auto_104858 ?auto_104859 ) ( ON-TABLE ?auto_104861 ) ( ON ?auto_104860 ?auto_104861 ) ( not ( = ?auto_104861 ?auto_104860 ) ) ( not ( = ?auto_104861 ?auto_104859 ) ) ( not ( = ?auto_104861 ?auto_104858 ) ) ( not ( = ?auto_104854 ?auto_104861 ) ) ( not ( = ?auto_104855 ?auto_104861 ) ) ( not ( = ?auto_104856 ?auto_104861 ) ) ( not ( = ?auto_104857 ?auto_104861 ) ) ( ON ?auto_104857 ?auto_104858 ) ( ON ?auto_104856 ?auto_104857 ) ( ON ?auto_104855 ?auto_104856 ) ( ON ?auto_104854 ?auto_104855 ) ( CLEAR ?auto_104854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104861 ?auto_104860 ?auto_104859 ?auto_104858 ?auto_104857 ?auto_104856 ?auto_104855 )
      ( MAKE-6PILE ?auto_104854 ?auto_104855 ?auto_104856 ?auto_104857 ?auto_104858 ?auto_104859 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104863 - BLOCK
    )
    :vars
    (
      ?auto_104864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104864 ?auto_104863 ) ( CLEAR ?auto_104864 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104863 ) ( not ( = ?auto_104863 ?auto_104864 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104864 ?auto_104863 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104865 - BLOCK
    )
    :vars
    (
      ?auto_104866 - BLOCK
      ?auto_104867 - BLOCK
      ?auto_104868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104866 ?auto_104865 ) ( CLEAR ?auto_104866 ) ( ON-TABLE ?auto_104865 ) ( not ( = ?auto_104865 ?auto_104866 ) ) ( HOLDING ?auto_104867 ) ( CLEAR ?auto_104868 ) ( not ( = ?auto_104865 ?auto_104867 ) ) ( not ( = ?auto_104865 ?auto_104868 ) ) ( not ( = ?auto_104866 ?auto_104867 ) ) ( not ( = ?auto_104866 ?auto_104868 ) ) ( not ( = ?auto_104867 ?auto_104868 ) ) )
    :subtasks
    ( ( !STACK ?auto_104867 ?auto_104868 )
      ( MAKE-1PILE ?auto_104865 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104869 - BLOCK
    )
    :vars
    (
      ?auto_104870 - BLOCK
      ?auto_104871 - BLOCK
      ?auto_104872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104870 ?auto_104869 ) ( ON-TABLE ?auto_104869 ) ( not ( = ?auto_104869 ?auto_104870 ) ) ( CLEAR ?auto_104871 ) ( not ( = ?auto_104869 ?auto_104872 ) ) ( not ( = ?auto_104869 ?auto_104871 ) ) ( not ( = ?auto_104870 ?auto_104872 ) ) ( not ( = ?auto_104870 ?auto_104871 ) ) ( not ( = ?auto_104872 ?auto_104871 ) ) ( ON ?auto_104872 ?auto_104870 ) ( CLEAR ?auto_104872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104869 ?auto_104870 )
      ( MAKE-1PILE ?auto_104869 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104873 - BLOCK
    )
    :vars
    (
      ?auto_104874 - BLOCK
      ?auto_104875 - BLOCK
      ?auto_104876 - BLOCK
      ?auto_104880 - BLOCK
      ?auto_104878 - BLOCK
      ?auto_104877 - BLOCK
      ?auto_104879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104874 ?auto_104873 ) ( ON-TABLE ?auto_104873 ) ( not ( = ?auto_104873 ?auto_104874 ) ) ( not ( = ?auto_104873 ?auto_104875 ) ) ( not ( = ?auto_104873 ?auto_104876 ) ) ( not ( = ?auto_104874 ?auto_104875 ) ) ( not ( = ?auto_104874 ?auto_104876 ) ) ( not ( = ?auto_104875 ?auto_104876 ) ) ( ON ?auto_104875 ?auto_104874 ) ( CLEAR ?auto_104875 ) ( HOLDING ?auto_104876 ) ( CLEAR ?auto_104880 ) ( ON-TABLE ?auto_104878 ) ( ON ?auto_104877 ?auto_104878 ) ( ON ?auto_104879 ?auto_104877 ) ( ON ?auto_104880 ?auto_104879 ) ( not ( = ?auto_104878 ?auto_104877 ) ) ( not ( = ?auto_104878 ?auto_104879 ) ) ( not ( = ?auto_104878 ?auto_104880 ) ) ( not ( = ?auto_104878 ?auto_104876 ) ) ( not ( = ?auto_104877 ?auto_104879 ) ) ( not ( = ?auto_104877 ?auto_104880 ) ) ( not ( = ?auto_104877 ?auto_104876 ) ) ( not ( = ?auto_104879 ?auto_104880 ) ) ( not ( = ?auto_104879 ?auto_104876 ) ) ( not ( = ?auto_104880 ?auto_104876 ) ) ( not ( = ?auto_104873 ?auto_104880 ) ) ( not ( = ?auto_104873 ?auto_104878 ) ) ( not ( = ?auto_104873 ?auto_104877 ) ) ( not ( = ?auto_104873 ?auto_104879 ) ) ( not ( = ?auto_104874 ?auto_104880 ) ) ( not ( = ?auto_104874 ?auto_104878 ) ) ( not ( = ?auto_104874 ?auto_104877 ) ) ( not ( = ?auto_104874 ?auto_104879 ) ) ( not ( = ?auto_104875 ?auto_104880 ) ) ( not ( = ?auto_104875 ?auto_104878 ) ) ( not ( = ?auto_104875 ?auto_104877 ) ) ( not ( = ?auto_104875 ?auto_104879 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104878 ?auto_104877 ?auto_104879 ?auto_104880 ?auto_104876 )
      ( MAKE-1PILE ?auto_104873 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104881 - BLOCK
    )
    :vars
    (
      ?auto_104884 - BLOCK
      ?auto_104882 - BLOCK
      ?auto_104887 - BLOCK
      ?auto_104885 - BLOCK
      ?auto_104883 - BLOCK
      ?auto_104886 - BLOCK
      ?auto_104888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104884 ?auto_104881 ) ( ON-TABLE ?auto_104881 ) ( not ( = ?auto_104881 ?auto_104884 ) ) ( not ( = ?auto_104881 ?auto_104882 ) ) ( not ( = ?auto_104881 ?auto_104887 ) ) ( not ( = ?auto_104884 ?auto_104882 ) ) ( not ( = ?auto_104884 ?auto_104887 ) ) ( not ( = ?auto_104882 ?auto_104887 ) ) ( ON ?auto_104882 ?auto_104884 ) ( CLEAR ?auto_104885 ) ( ON-TABLE ?auto_104883 ) ( ON ?auto_104886 ?auto_104883 ) ( ON ?auto_104888 ?auto_104886 ) ( ON ?auto_104885 ?auto_104888 ) ( not ( = ?auto_104883 ?auto_104886 ) ) ( not ( = ?auto_104883 ?auto_104888 ) ) ( not ( = ?auto_104883 ?auto_104885 ) ) ( not ( = ?auto_104883 ?auto_104887 ) ) ( not ( = ?auto_104886 ?auto_104888 ) ) ( not ( = ?auto_104886 ?auto_104885 ) ) ( not ( = ?auto_104886 ?auto_104887 ) ) ( not ( = ?auto_104888 ?auto_104885 ) ) ( not ( = ?auto_104888 ?auto_104887 ) ) ( not ( = ?auto_104885 ?auto_104887 ) ) ( not ( = ?auto_104881 ?auto_104885 ) ) ( not ( = ?auto_104881 ?auto_104883 ) ) ( not ( = ?auto_104881 ?auto_104886 ) ) ( not ( = ?auto_104881 ?auto_104888 ) ) ( not ( = ?auto_104884 ?auto_104885 ) ) ( not ( = ?auto_104884 ?auto_104883 ) ) ( not ( = ?auto_104884 ?auto_104886 ) ) ( not ( = ?auto_104884 ?auto_104888 ) ) ( not ( = ?auto_104882 ?auto_104885 ) ) ( not ( = ?auto_104882 ?auto_104883 ) ) ( not ( = ?auto_104882 ?auto_104886 ) ) ( not ( = ?auto_104882 ?auto_104888 ) ) ( ON ?auto_104887 ?auto_104882 ) ( CLEAR ?auto_104887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104881 ?auto_104884 ?auto_104882 )
      ( MAKE-1PILE ?auto_104881 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104889 - BLOCK
    )
    :vars
    (
      ?auto_104893 - BLOCK
      ?auto_104890 - BLOCK
      ?auto_104895 - BLOCK
      ?auto_104894 - BLOCK
      ?auto_104896 - BLOCK
      ?auto_104891 - BLOCK
      ?auto_104892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104893 ?auto_104889 ) ( ON-TABLE ?auto_104889 ) ( not ( = ?auto_104889 ?auto_104893 ) ) ( not ( = ?auto_104889 ?auto_104890 ) ) ( not ( = ?auto_104889 ?auto_104895 ) ) ( not ( = ?auto_104893 ?auto_104890 ) ) ( not ( = ?auto_104893 ?auto_104895 ) ) ( not ( = ?auto_104890 ?auto_104895 ) ) ( ON ?auto_104890 ?auto_104893 ) ( ON-TABLE ?auto_104894 ) ( ON ?auto_104896 ?auto_104894 ) ( ON ?auto_104891 ?auto_104896 ) ( not ( = ?auto_104894 ?auto_104896 ) ) ( not ( = ?auto_104894 ?auto_104891 ) ) ( not ( = ?auto_104894 ?auto_104892 ) ) ( not ( = ?auto_104894 ?auto_104895 ) ) ( not ( = ?auto_104896 ?auto_104891 ) ) ( not ( = ?auto_104896 ?auto_104892 ) ) ( not ( = ?auto_104896 ?auto_104895 ) ) ( not ( = ?auto_104891 ?auto_104892 ) ) ( not ( = ?auto_104891 ?auto_104895 ) ) ( not ( = ?auto_104892 ?auto_104895 ) ) ( not ( = ?auto_104889 ?auto_104892 ) ) ( not ( = ?auto_104889 ?auto_104894 ) ) ( not ( = ?auto_104889 ?auto_104896 ) ) ( not ( = ?auto_104889 ?auto_104891 ) ) ( not ( = ?auto_104893 ?auto_104892 ) ) ( not ( = ?auto_104893 ?auto_104894 ) ) ( not ( = ?auto_104893 ?auto_104896 ) ) ( not ( = ?auto_104893 ?auto_104891 ) ) ( not ( = ?auto_104890 ?auto_104892 ) ) ( not ( = ?auto_104890 ?auto_104894 ) ) ( not ( = ?auto_104890 ?auto_104896 ) ) ( not ( = ?auto_104890 ?auto_104891 ) ) ( ON ?auto_104895 ?auto_104890 ) ( CLEAR ?auto_104895 ) ( HOLDING ?auto_104892 ) ( CLEAR ?auto_104891 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104894 ?auto_104896 ?auto_104891 ?auto_104892 )
      ( MAKE-1PILE ?auto_104889 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104897 - BLOCK
    )
    :vars
    (
      ?auto_104902 - BLOCK
      ?auto_104904 - BLOCK
      ?auto_104901 - BLOCK
      ?auto_104899 - BLOCK
      ?auto_104898 - BLOCK
      ?auto_104900 - BLOCK
      ?auto_104903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104902 ?auto_104897 ) ( ON-TABLE ?auto_104897 ) ( not ( = ?auto_104897 ?auto_104902 ) ) ( not ( = ?auto_104897 ?auto_104904 ) ) ( not ( = ?auto_104897 ?auto_104901 ) ) ( not ( = ?auto_104902 ?auto_104904 ) ) ( not ( = ?auto_104902 ?auto_104901 ) ) ( not ( = ?auto_104904 ?auto_104901 ) ) ( ON ?auto_104904 ?auto_104902 ) ( ON-TABLE ?auto_104899 ) ( ON ?auto_104898 ?auto_104899 ) ( ON ?auto_104900 ?auto_104898 ) ( not ( = ?auto_104899 ?auto_104898 ) ) ( not ( = ?auto_104899 ?auto_104900 ) ) ( not ( = ?auto_104899 ?auto_104903 ) ) ( not ( = ?auto_104899 ?auto_104901 ) ) ( not ( = ?auto_104898 ?auto_104900 ) ) ( not ( = ?auto_104898 ?auto_104903 ) ) ( not ( = ?auto_104898 ?auto_104901 ) ) ( not ( = ?auto_104900 ?auto_104903 ) ) ( not ( = ?auto_104900 ?auto_104901 ) ) ( not ( = ?auto_104903 ?auto_104901 ) ) ( not ( = ?auto_104897 ?auto_104903 ) ) ( not ( = ?auto_104897 ?auto_104899 ) ) ( not ( = ?auto_104897 ?auto_104898 ) ) ( not ( = ?auto_104897 ?auto_104900 ) ) ( not ( = ?auto_104902 ?auto_104903 ) ) ( not ( = ?auto_104902 ?auto_104899 ) ) ( not ( = ?auto_104902 ?auto_104898 ) ) ( not ( = ?auto_104902 ?auto_104900 ) ) ( not ( = ?auto_104904 ?auto_104903 ) ) ( not ( = ?auto_104904 ?auto_104899 ) ) ( not ( = ?auto_104904 ?auto_104898 ) ) ( not ( = ?auto_104904 ?auto_104900 ) ) ( ON ?auto_104901 ?auto_104904 ) ( CLEAR ?auto_104900 ) ( ON ?auto_104903 ?auto_104901 ) ( CLEAR ?auto_104903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104897 ?auto_104902 ?auto_104904 ?auto_104901 )
      ( MAKE-1PILE ?auto_104897 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104905 - BLOCK
    )
    :vars
    (
      ?auto_104910 - BLOCK
      ?auto_104909 - BLOCK
      ?auto_104912 - BLOCK
      ?auto_104908 - BLOCK
      ?auto_104911 - BLOCK
      ?auto_104907 - BLOCK
      ?auto_104906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104910 ?auto_104905 ) ( ON-TABLE ?auto_104905 ) ( not ( = ?auto_104905 ?auto_104910 ) ) ( not ( = ?auto_104905 ?auto_104909 ) ) ( not ( = ?auto_104905 ?auto_104912 ) ) ( not ( = ?auto_104910 ?auto_104909 ) ) ( not ( = ?auto_104910 ?auto_104912 ) ) ( not ( = ?auto_104909 ?auto_104912 ) ) ( ON ?auto_104909 ?auto_104910 ) ( ON-TABLE ?auto_104908 ) ( ON ?auto_104911 ?auto_104908 ) ( not ( = ?auto_104908 ?auto_104911 ) ) ( not ( = ?auto_104908 ?auto_104907 ) ) ( not ( = ?auto_104908 ?auto_104906 ) ) ( not ( = ?auto_104908 ?auto_104912 ) ) ( not ( = ?auto_104911 ?auto_104907 ) ) ( not ( = ?auto_104911 ?auto_104906 ) ) ( not ( = ?auto_104911 ?auto_104912 ) ) ( not ( = ?auto_104907 ?auto_104906 ) ) ( not ( = ?auto_104907 ?auto_104912 ) ) ( not ( = ?auto_104906 ?auto_104912 ) ) ( not ( = ?auto_104905 ?auto_104906 ) ) ( not ( = ?auto_104905 ?auto_104908 ) ) ( not ( = ?auto_104905 ?auto_104911 ) ) ( not ( = ?auto_104905 ?auto_104907 ) ) ( not ( = ?auto_104910 ?auto_104906 ) ) ( not ( = ?auto_104910 ?auto_104908 ) ) ( not ( = ?auto_104910 ?auto_104911 ) ) ( not ( = ?auto_104910 ?auto_104907 ) ) ( not ( = ?auto_104909 ?auto_104906 ) ) ( not ( = ?auto_104909 ?auto_104908 ) ) ( not ( = ?auto_104909 ?auto_104911 ) ) ( not ( = ?auto_104909 ?auto_104907 ) ) ( ON ?auto_104912 ?auto_104909 ) ( ON ?auto_104906 ?auto_104912 ) ( CLEAR ?auto_104906 ) ( HOLDING ?auto_104907 ) ( CLEAR ?auto_104911 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104908 ?auto_104911 ?auto_104907 )
      ( MAKE-1PILE ?auto_104905 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104913 - BLOCK
    )
    :vars
    (
      ?auto_104920 - BLOCK
      ?auto_104915 - BLOCK
      ?auto_104916 - BLOCK
      ?auto_104918 - BLOCK
      ?auto_104919 - BLOCK
      ?auto_104917 - BLOCK
      ?auto_104914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104920 ?auto_104913 ) ( ON-TABLE ?auto_104913 ) ( not ( = ?auto_104913 ?auto_104920 ) ) ( not ( = ?auto_104913 ?auto_104915 ) ) ( not ( = ?auto_104913 ?auto_104916 ) ) ( not ( = ?auto_104920 ?auto_104915 ) ) ( not ( = ?auto_104920 ?auto_104916 ) ) ( not ( = ?auto_104915 ?auto_104916 ) ) ( ON ?auto_104915 ?auto_104920 ) ( ON-TABLE ?auto_104918 ) ( ON ?auto_104919 ?auto_104918 ) ( not ( = ?auto_104918 ?auto_104919 ) ) ( not ( = ?auto_104918 ?auto_104917 ) ) ( not ( = ?auto_104918 ?auto_104914 ) ) ( not ( = ?auto_104918 ?auto_104916 ) ) ( not ( = ?auto_104919 ?auto_104917 ) ) ( not ( = ?auto_104919 ?auto_104914 ) ) ( not ( = ?auto_104919 ?auto_104916 ) ) ( not ( = ?auto_104917 ?auto_104914 ) ) ( not ( = ?auto_104917 ?auto_104916 ) ) ( not ( = ?auto_104914 ?auto_104916 ) ) ( not ( = ?auto_104913 ?auto_104914 ) ) ( not ( = ?auto_104913 ?auto_104918 ) ) ( not ( = ?auto_104913 ?auto_104919 ) ) ( not ( = ?auto_104913 ?auto_104917 ) ) ( not ( = ?auto_104920 ?auto_104914 ) ) ( not ( = ?auto_104920 ?auto_104918 ) ) ( not ( = ?auto_104920 ?auto_104919 ) ) ( not ( = ?auto_104920 ?auto_104917 ) ) ( not ( = ?auto_104915 ?auto_104914 ) ) ( not ( = ?auto_104915 ?auto_104918 ) ) ( not ( = ?auto_104915 ?auto_104919 ) ) ( not ( = ?auto_104915 ?auto_104917 ) ) ( ON ?auto_104916 ?auto_104915 ) ( ON ?auto_104914 ?auto_104916 ) ( CLEAR ?auto_104919 ) ( ON ?auto_104917 ?auto_104914 ) ( CLEAR ?auto_104917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104913 ?auto_104920 ?auto_104915 ?auto_104916 ?auto_104914 )
      ( MAKE-1PILE ?auto_104913 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104921 - BLOCK
    )
    :vars
    (
      ?auto_104925 - BLOCK
      ?auto_104927 - BLOCK
      ?auto_104924 - BLOCK
      ?auto_104922 - BLOCK
      ?auto_104923 - BLOCK
      ?auto_104926 - BLOCK
      ?auto_104928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104925 ?auto_104921 ) ( ON-TABLE ?auto_104921 ) ( not ( = ?auto_104921 ?auto_104925 ) ) ( not ( = ?auto_104921 ?auto_104927 ) ) ( not ( = ?auto_104921 ?auto_104924 ) ) ( not ( = ?auto_104925 ?auto_104927 ) ) ( not ( = ?auto_104925 ?auto_104924 ) ) ( not ( = ?auto_104927 ?auto_104924 ) ) ( ON ?auto_104927 ?auto_104925 ) ( ON-TABLE ?auto_104922 ) ( not ( = ?auto_104922 ?auto_104923 ) ) ( not ( = ?auto_104922 ?auto_104926 ) ) ( not ( = ?auto_104922 ?auto_104928 ) ) ( not ( = ?auto_104922 ?auto_104924 ) ) ( not ( = ?auto_104923 ?auto_104926 ) ) ( not ( = ?auto_104923 ?auto_104928 ) ) ( not ( = ?auto_104923 ?auto_104924 ) ) ( not ( = ?auto_104926 ?auto_104928 ) ) ( not ( = ?auto_104926 ?auto_104924 ) ) ( not ( = ?auto_104928 ?auto_104924 ) ) ( not ( = ?auto_104921 ?auto_104928 ) ) ( not ( = ?auto_104921 ?auto_104922 ) ) ( not ( = ?auto_104921 ?auto_104923 ) ) ( not ( = ?auto_104921 ?auto_104926 ) ) ( not ( = ?auto_104925 ?auto_104928 ) ) ( not ( = ?auto_104925 ?auto_104922 ) ) ( not ( = ?auto_104925 ?auto_104923 ) ) ( not ( = ?auto_104925 ?auto_104926 ) ) ( not ( = ?auto_104927 ?auto_104928 ) ) ( not ( = ?auto_104927 ?auto_104922 ) ) ( not ( = ?auto_104927 ?auto_104923 ) ) ( not ( = ?auto_104927 ?auto_104926 ) ) ( ON ?auto_104924 ?auto_104927 ) ( ON ?auto_104928 ?auto_104924 ) ( ON ?auto_104926 ?auto_104928 ) ( CLEAR ?auto_104926 ) ( HOLDING ?auto_104923 ) ( CLEAR ?auto_104922 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104922 ?auto_104923 )
      ( MAKE-1PILE ?auto_104921 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104929 - BLOCK
    )
    :vars
    (
      ?auto_104934 - BLOCK
      ?auto_104932 - BLOCK
      ?auto_104933 - BLOCK
      ?auto_104930 - BLOCK
      ?auto_104936 - BLOCK
      ?auto_104935 - BLOCK
      ?auto_104931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104934 ?auto_104929 ) ( ON-TABLE ?auto_104929 ) ( not ( = ?auto_104929 ?auto_104934 ) ) ( not ( = ?auto_104929 ?auto_104932 ) ) ( not ( = ?auto_104929 ?auto_104933 ) ) ( not ( = ?auto_104934 ?auto_104932 ) ) ( not ( = ?auto_104934 ?auto_104933 ) ) ( not ( = ?auto_104932 ?auto_104933 ) ) ( ON ?auto_104932 ?auto_104934 ) ( ON-TABLE ?auto_104930 ) ( not ( = ?auto_104930 ?auto_104936 ) ) ( not ( = ?auto_104930 ?auto_104935 ) ) ( not ( = ?auto_104930 ?auto_104931 ) ) ( not ( = ?auto_104930 ?auto_104933 ) ) ( not ( = ?auto_104936 ?auto_104935 ) ) ( not ( = ?auto_104936 ?auto_104931 ) ) ( not ( = ?auto_104936 ?auto_104933 ) ) ( not ( = ?auto_104935 ?auto_104931 ) ) ( not ( = ?auto_104935 ?auto_104933 ) ) ( not ( = ?auto_104931 ?auto_104933 ) ) ( not ( = ?auto_104929 ?auto_104931 ) ) ( not ( = ?auto_104929 ?auto_104930 ) ) ( not ( = ?auto_104929 ?auto_104936 ) ) ( not ( = ?auto_104929 ?auto_104935 ) ) ( not ( = ?auto_104934 ?auto_104931 ) ) ( not ( = ?auto_104934 ?auto_104930 ) ) ( not ( = ?auto_104934 ?auto_104936 ) ) ( not ( = ?auto_104934 ?auto_104935 ) ) ( not ( = ?auto_104932 ?auto_104931 ) ) ( not ( = ?auto_104932 ?auto_104930 ) ) ( not ( = ?auto_104932 ?auto_104936 ) ) ( not ( = ?auto_104932 ?auto_104935 ) ) ( ON ?auto_104933 ?auto_104932 ) ( ON ?auto_104931 ?auto_104933 ) ( ON ?auto_104935 ?auto_104931 ) ( CLEAR ?auto_104930 ) ( ON ?auto_104936 ?auto_104935 ) ( CLEAR ?auto_104936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104929 ?auto_104934 ?auto_104932 ?auto_104933 ?auto_104931 ?auto_104935 )
      ( MAKE-1PILE ?auto_104929 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104937 - BLOCK
    )
    :vars
    (
      ?auto_104942 - BLOCK
      ?auto_104941 - BLOCK
      ?auto_104938 - BLOCK
      ?auto_104940 - BLOCK
      ?auto_104943 - BLOCK
      ?auto_104939 - BLOCK
      ?auto_104944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104942 ?auto_104937 ) ( ON-TABLE ?auto_104937 ) ( not ( = ?auto_104937 ?auto_104942 ) ) ( not ( = ?auto_104937 ?auto_104941 ) ) ( not ( = ?auto_104937 ?auto_104938 ) ) ( not ( = ?auto_104942 ?auto_104941 ) ) ( not ( = ?auto_104942 ?auto_104938 ) ) ( not ( = ?auto_104941 ?auto_104938 ) ) ( ON ?auto_104941 ?auto_104942 ) ( not ( = ?auto_104940 ?auto_104943 ) ) ( not ( = ?auto_104940 ?auto_104939 ) ) ( not ( = ?auto_104940 ?auto_104944 ) ) ( not ( = ?auto_104940 ?auto_104938 ) ) ( not ( = ?auto_104943 ?auto_104939 ) ) ( not ( = ?auto_104943 ?auto_104944 ) ) ( not ( = ?auto_104943 ?auto_104938 ) ) ( not ( = ?auto_104939 ?auto_104944 ) ) ( not ( = ?auto_104939 ?auto_104938 ) ) ( not ( = ?auto_104944 ?auto_104938 ) ) ( not ( = ?auto_104937 ?auto_104944 ) ) ( not ( = ?auto_104937 ?auto_104940 ) ) ( not ( = ?auto_104937 ?auto_104943 ) ) ( not ( = ?auto_104937 ?auto_104939 ) ) ( not ( = ?auto_104942 ?auto_104944 ) ) ( not ( = ?auto_104942 ?auto_104940 ) ) ( not ( = ?auto_104942 ?auto_104943 ) ) ( not ( = ?auto_104942 ?auto_104939 ) ) ( not ( = ?auto_104941 ?auto_104944 ) ) ( not ( = ?auto_104941 ?auto_104940 ) ) ( not ( = ?auto_104941 ?auto_104943 ) ) ( not ( = ?auto_104941 ?auto_104939 ) ) ( ON ?auto_104938 ?auto_104941 ) ( ON ?auto_104944 ?auto_104938 ) ( ON ?auto_104939 ?auto_104944 ) ( ON ?auto_104943 ?auto_104939 ) ( CLEAR ?auto_104943 ) ( HOLDING ?auto_104940 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104940 )
      ( MAKE-1PILE ?auto_104937 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_104945 - BLOCK
    )
    :vars
    (
      ?auto_104946 - BLOCK
      ?auto_104952 - BLOCK
      ?auto_104948 - BLOCK
      ?auto_104951 - BLOCK
      ?auto_104947 - BLOCK
      ?auto_104950 - BLOCK
      ?auto_104949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_104946 ?auto_104945 ) ( ON-TABLE ?auto_104945 ) ( not ( = ?auto_104945 ?auto_104946 ) ) ( not ( = ?auto_104945 ?auto_104952 ) ) ( not ( = ?auto_104945 ?auto_104948 ) ) ( not ( = ?auto_104946 ?auto_104952 ) ) ( not ( = ?auto_104946 ?auto_104948 ) ) ( not ( = ?auto_104952 ?auto_104948 ) ) ( ON ?auto_104952 ?auto_104946 ) ( not ( = ?auto_104951 ?auto_104947 ) ) ( not ( = ?auto_104951 ?auto_104950 ) ) ( not ( = ?auto_104951 ?auto_104949 ) ) ( not ( = ?auto_104951 ?auto_104948 ) ) ( not ( = ?auto_104947 ?auto_104950 ) ) ( not ( = ?auto_104947 ?auto_104949 ) ) ( not ( = ?auto_104947 ?auto_104948 ) ) ( not ( = ?auto_104950 ?auto_104949 ) ) ( not ( = ?auto_104950 ?auto_104948 ) ) ( not ( = ?auto_104949 ?auto_104948 ) ) ( not ( = ?auto_104945 ?auto_104949 ) ) ( not ( = ?auto_104945 ?auto_104951 ) ) ( not ( = ?auto_104945 ?auto_104947 ) ) ( not ( = ?auto_104945 ?auto_104950 ) ) ( not ( = ?auto_104946 ?auto_104949 ) ) ( not ( = ?auto_104946 ?auto_104951 ) ) ( not ( = ?auto_104946 ?auto_104947 ) ) ( not ( = ?auto_104946 ?auto_104950 ) ) ( not ( = ?auto_104952 ?auto_104949 ) ) ( not ( = ?auto_104952 ?auto_104951 ) ) ( not ( = ?auto_104952 ?auto_104947 ) ) ( not ( = ?auto_104952 ?auto_104950 ) ) ( ON ?auto_104948 ?auto_104952 ) ( ON ?auto_104949 ?auto_104948 ) ( ON ?auto_104950 ?auto_104949 ) ( ON ?auto_104947 ?auto_104950 ) ( ON ?auto_104951 ?auto_104947 ) ( CLEAR ?auto_104951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104945 ?auto_104946 ?auto_104952 ?auto_104948 ?auto_104949 ?auto_104950 ?auto_104947 )
      ( MAKE-1PILE ?auto_104945 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104960 - BLOCK
      ?auto_104961 - BLOCK
      ?auto_104962 - BLOCK
      ?auto_104963 - BLOCK
      ?auto_104964 - BLOCK
      ?auto_104965 - BLOCK
      ?auto_104966 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104966 ) ( CLEAR ?auto_104965 ) ( ON-TABLE ?auto_104960 ) ( ON ?auto_104961 ?auto_104960 ) ( ON ?auto_104962 ?auto_104961 ) ( ON ?auto_104963 ?auto_104962 ) ( ON ?auto_104964 ?auto_104963 ) ( ON ?auto_104965 ?auto_104964 ) ( not ( = ?auto_104960 ?auto_104961 ) ) ( not ( = ?auto_104960 ?auto_104962 ) ) ( not ( = ?auto_104960 ?auto_104963 ) ) ( not ( = ?auto_104960 ?auto_104964 ) ) ( not ( = ?auto_104960 ?auto_104965 ) ) ( not ( = ?auto_104960 ?auto_104966 ) ) ( not ( = ?auto_104961 ?auto_104962 ) ) ( not ( = ?auto_104961 ?auto_104963 ) ) ( not ( = ?auto_104961 ?auto_104964 ) ) ( not ( = ?auto_104961 ?auto_104965 ) ) ( not ( = ?auto_104961 ?auto_104966 ) ) ( not ( = ?auto_104962 ?auto_104963 ) ) ( not ( = ?auto_104962 ?auto_104964 ) ) ( not ( = ?auto_104962 ?auto_104965 ) ) ( not ( = ?auto_104962 ?auto_104966 ) ) ( not ( = ?auto_104963 ?auto_104964 ) ) ( not ( = ?auto_104963 ?auto_104965 ) ) ( not ( = ?auto_104963 ?auto_104966 ) ) ( not ( = ?auto_104964 ?auto_104965 ) ) ( not ( = ?auto_104964 ?auto_104966 ) ) ( not ( = ?auto_104965 ?auto_104966 ) ) )
    :subtasks
    ( ( !STACK ?auto_104966 ?auto_104965 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104967 - BLOCK
      ?auto_104968 - BLOCK
      ?auto_104969 - BLOCK
      ?auto_104970 - BLOCK
      ?auto_104971 - BLOCK
      ?auto_104972 - BLOCK
      ?auto_104973 - BLOCK
    )
    :vars
    (
      ?auto_104974 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104972 ) ( ON-TABLE ?auto_104967 ) ( ON ?auto_104968 ?auto_104967 ) ( ON ?auto_104969 ?auto_104968 ) ( ON ?auto_104970 ?auto_104969 ) ( ON ?auto_104971 ?auto_104970 ) ( ON ?auto_104972 ?auto_104971 ) ( not ( = ?auto_104967 ?auto_104968 ) ) ( not ( = ?auto_104967 ?auto_104969 ) ) ( not ( = ?auto_104967 ?auto_104970 ) ) ( not ( = ?auto_104967 ?auto_104971 ) ) ( not ( = ?auto_104967 ?auto_104972 ) ) ( not ( = ?auto_104967 ?auto_104973 ) ) ( not ( = ?auto_104968 ?auto_104969 ) ) ( not ( = ?auto_104968 ?auto_104970 ) ) ( not ( = ?auto_104968 ?auto_104971 ) ) ( not ( = ?auto_104968 ?auto_104972 ) ) ( not ( = ?auto_104968 ?auto_104973 ) ) ( not ( = ?auto_104969 ?auto_104970 ) ) ( not ( = ?auto_104969 ?auto_104971 ) ) ( not ( = ?auto_104969 ?auto_104972 ) ) ( not ( = ?auto_104969 ?auto_104973 ) ) ( not ( = ?auto_104970 ?auto_104971 ) ) ( not ( = ?auto_104970 ?auto_104972 ) ) ( not ( = ?auto_104970 ?auto_104973 ) ) ( not ( = ?auto_104971 ?auto_104972 ) ) ( not ( = ?auto_104971 ?auto_104973 ) ) ( not ( = ?auto_104972 ?auto_104973 ) ) ( ON ?auto_104973 ?auto_104974 ) ( CLEAR ?auto_104973 ) ( HAND-EMPTY ) ( not ( = ?auto_104967 ?auto_104974 ) ) ( not ( = ?auto_104968 ?auto_104974 ) ) ( not ( = ?auto_104969 ?auto_104974 ) ) ( not ( = ?auto_104970 ?auto_104974 ) ) ( not ( = ?auto_104971 ?auto_104974 ) ) ( not ( = ?auto_104972 ?auto_104974 ) ) ( not ( = ?auto_104973 ?auto_104974 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104973 ?auto_104974 )
      ( MAKE-7PILE ?auto_104967 ?auto_104968 ?auto_104969 ?auto_104970 ?auto_104971 ?auto_104972 ?auto_104973 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104975 - BLOCK
      ?auto_104976 - BLOCK
      ?auto_104977 - BLOCK
      ?auto_104978 - BLOCK
      ?auto_104979 - BLOCK
      ?auto_104980 - BLOCK
      ?auto_104981 - BLOCK
    )
    :vars
    (
      ?auto_104982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104975 ) ( ON ?auto_104976 ?auto_104975 ) ( ON ?auto_104977 ?auto_104976 ) ( ON ?auto_104978 ?auto_104977 ) ( ON ?auto_104979 ?auto_104978 ) ( not ( = ?auto_104975 ?auto_104976 ) ) ( not ( = ?auto_104975 ?auto_104977 ) ) ( not ( = ?auto_104975 ?auto_104978 ) ) ( not ( = ?auto_104975 ?auto_104979 ) ) ( not ( = ?auto_104975 ?auto_104980 ) ) ( not ( = ?auto_104975 ?auto_104981 ) ) ( not ( = ?auto_104976 ?auto_104977 ) ) ( not ( = ?auto_104976 ?auto_104978 ) ) ( not ( = ?auto_104976 ?auto_104979 ) ) ( not ( = ?auto_104976 ?auto_104980 ) ) ( not ( = ?auto_104976 ?auto_104981 ) ) ( not ( = ?auto_104977 ?auto_104978 ) ) ( not ( = ?auto_104977 ?auto_104979 ) ) ( not ( = ?auto_104977 ?auto_104980 ) ) ( not ( = ?auto_104977 ?auto_104981 ) ) ( not ( = ?auto_104978 ?auto_104979 ) ) ( not ( = ?auto_104978 ?auto_104980 ) ) ( not ( = ?auto_104978 ?auto_104981 ) ) ( not ( = ?auto_104979 ?auto_104980 ) ) ( not ( = ?auto_104979 ?auto_104981 ) ) ( not ( = ?auto_104980 ?auto_104981 ) ) ( ON ?auto_104981 ?auto_104982 ) ( CLEAR ?auto_104981 ) ( not ( = ?auto_104975 ?auto_104982 ) ) ( not ( = ?auto_104976 ?auto_104982 ) ) ( not ( = ?auto_104977 ?auto_104982 ) ) ( not ( = ?auto_104978 ?auto_104982 ) ) ( not ( = ?auto_104979 ?auto_104982 ) ) ( not ( = ?auto_104980 ?auto_104982 ) ) ( not ( = ?auto_104981 ?auto_104982 ) ) ( HOLDING ?auto_104980 ) ( CLEAR ?auto_104979 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104975 ?auto_104976 ?auto_104977 ?auto_104978 ?auto_104979 ?auto_104980 )
      ( MAKE-7PILE ?auto_104975 ?auto_104976 ?auto_104977 ?auto_104978 ?auto_104979 ?auto_104980 ?auto_104981 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104983 - BLOCK
      ?auto_104984 - BLOCK
      ?auto_104985 - BLOCK
      ?auto_104986 - BLOCK
      ?auto_104987 - BLOCK
      ?auto_104988 - BLOCK
      ?auto_104989 - BLOCK
    )
    :vars
    (
      ?auto_104990 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104983 ) ( ON ?auto_104984 ?auto_104983 ) ( ON ?auto_104985 ?auto_104984 ) ( ON ?auto_104986 ?auto_104985 ) ( ON ?auto_104987 ?auto_104986 ) ( not ( = ?auto_104983 ?auto_104984 ) ) ( not ( = ?auto_104983 ?auto_104985 ) ) ( not ( = ?auto_104983 ?auto_104986 ) ) ( not ( = ?auto_104983 ?auto_104987 ) ) ( not ( = ?auto_104983 ?auto_104988 ) ) ( not ( = ?auto_104983 ?auto_104989 ) ) ( not ( = ?auto_104984 ?auto_104985 ) ) ( not ( = ?auto_104984 ?auto_104986 ) ) ( not ( = ?auto_104984 ?auto_104987 ) ) ( not ( = ?auto_104984 ?auto_104988 ) ) ( not ( = ?auto_104984 ?auto_104989 ) ) ( not ( = ?auto_104985 ?auto_104986 ) ) ( not ( = ?auto_104985 ?auto_104987 ) ) ( not ( = ?auto_104985 ?auto_104988 ) ) ( not ( = ?auto_104985 ?auto_104989 ) ) ( not ( = ?auto_104986 ?auto_104987 ) ) ( not ( = ?auto_104986 ?auto_104988 ) ) ( not ( = ?auto_104986 ?auto_104989 ) ) ( not ( = ?auto_104987 ?auto_104988 ) ) ( not ( = ?auto_104987 ?auto_104989 ) ) ( not ( = ?auto_104988 ?auto_104989 ) ) ( ON ?auto_104989 ?auto_104990 ) ( not ( = ?auto_104983 ?auto_104990 ) ) ( not ( = ?auto_104984 ?auto_104990 ) ) ( not ( = ?auto_104985 ?auto_104990 ) ) ( not ( = ?auto_104986 ?auto_104990 ) ) ( not ( = ?auto_104987 ?auto_104990 ) ) ( not ( = ?auto_104988 ?auto_104990 ) ) ( not ( = ?auto_104989 ?auto_104990 ) ) ( CLEAR ?auto_104987 ) ( ON ?auto_104988 ?auto_104989 ) ( CLEAR ?auto_104988 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104990 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104990 ?auto_104989 )
      ( MAKE-7PILE ?auto_104983 ?auto_104984 ?auto_104985 ?auto_104986 ?auto_104987 ?auto_104988 ?auto_104989 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104991 - BLOCK
      ?auto_104992 - BLOCK
      ?auto_104993 - BLOCK
      ?auto_104994 - BLOCK
      ?auto_104995 - BLOCK
      ?auto_104996 - BLOCK
      ?auto_104997 - BLOCK
    )
    :vars
    (
      ?auto_104998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104991 ) ( ON ?auto_104992 ?auto_104991 ) ( ON ?auto_104993 ?auto_104992 ) ( ON ?auto_104994 ?auto_104993 ) ( not ( = ?auto_104991 ?auto_104992 ) ) ( not ( = ?auto_104991 ?auto_104993 ) ) ( not ( = ?auto_104991 ?auto_104994 ) ) ( not ( = ?auto_104991 ?auto_104995 ) ) ( not ( = ?auto_104991 ?auto_104996 ) ) ( not ( = ?auto_104991 ?auto_104997 ) ) ( not ( = ?auto_104992 ?auto_104993 ) ) ( not ( = ?auto_104992 ?auto_104994 ) ) ( not ( = ?auto_104992 ?auto_104995 ) ) ( not ( = ?auto_104992 ?auto_104996 ) ) ( not ( = ?auto_104992 ?auto_104997 ) ) ( not ( = ?auto_104993 ?auto_104994 ) ) ( not ( = ?auto_104993 ?auto_104995 ) ) ( not ( = ?auto_104993 ?auto_104996 ) ) ( not ( = ?auto_104993 ?auto_104997 ) ) ( not ( = ?auto_104994 ?auto_104995 ) ) ( not ( = ?auto_104994 ?auto_104996 ) ) ( not ( = ?auto_104994 ?auto_104997 ) ) ( not ( = ?auto_104995 ?auto_104996 ) ) ( not ( = ?auto_104995 ?auto_104997 ) ) ( not ( = ?auto_104996 ?auto_104997 ) ) ( ON ?auto_104997 ?auto_104998 ) ( not ( = ?auto_104991 ?auto_104998 ) ) ( not ( = ?auto_104992 ?auto_104998 ) ) ( not ( = ?auto_104993 ?auto_104998 ) ) ( not ( = ?auto_104994 ?auto_104998 ) ) ( not ( = ?auto_104995 ?auto_104998 ) ) ( not ( = ?auto_104996 ?auto_104998 ) ) ( not ( = ?auto_104997 ?auto_104998 ) ) ( ON ?auto_104996 ?auto_104997 ) ( CLEAR ?auto_104996 ) ( ON-TABLE ?auto_104998 ) ( HOLDING ?auto_104995 ) ( CLEAR ?auto_104994 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104991 ?auto_104992 ?auto_104993 ?auto_104994 ?auto_104995 )
      ( MAKE-7PILE ?auto_104991 ?auto_104992 ?auto_104993 ?auto_104994 ?auto_104995 ?auto_104996 ?auto_104997 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104999 - BLOCK
      ?auto_105000 - BLOCK
      ?auto_105001 - BLOCK
      ?auto_105002 - BLOCK
      ?auto_105003 - BLOCK
      ?auto_105004 - BLOCK
      ?auto_105005 - BLOCK
    )
    :vars
    (
      ?auto_105006 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104999 ) ( ON ?auto_105000 ?auto_104999 ) ( ON ?auto_105001 ?auto_105000 ) ( ON ?auto_105002 ?auto_105001 ) ( not ( = ?auto_104999 ?auto_105000 ) ) ( not ( = ?auto_104999 ?auto_105001 ) ) ( not ( = ?auto_104999 ?auto_105002 ) ) ( not ( = ?auto_104999 ?auto_105003 ) ) ( not ( = ?auto_104999 ?auto_105004 ) ) ( not ( = ?auto_104999 ?auto_105005 ) ) ( not ( = ?auto_105000 ?auto_105001 ) ) ( not ( = ?auto_105000 ?auto_105002 ) ) ( not ( = ?auto_105000 ?auto_105003 ) ) ( not ( = ?auto_105000 ?auto_105004 ) ) ( not ( = ?auto_105000 ?auto_105005 ) ) ( not ( = ?auto_105001 ?auto_105002 ) ) ( not ( = ?auto_105001 ?auto_105003 ) ) ( not ( = ?auto_105001 ?auto_105004 ) ) ( not ( = ?auto_105001 ?auto_105005 ) ) ( not ( = ?auto_105002 ?auto_105003 ) ) ( not ( = ?auto_105002 ?auto_105004 ) ) ( not ( = ?auto_105002 ?auto_105005 ) ) ( not ( = ?auto_105003 ?auto_105004 ) ) ( not ( = ?auto_105003 ?auto_105005 ) ) ( not ( = ?auto_105004 ?auto_105005 ) ) ( ON ?auto_105005 ?auto_105006 ) ( not ( = ?auto_104999 ?auto_105006 ) ) ( not ( = ?auto_105000 ?auto_105006 ) ) ( not ( = ?auto_105001 ?auto_105006 ) ) ( not ( = ?auto_105002 ?auto_105006 ) ) ( not ( = ?auto_105003 ?auto_105006 ) ) ( not ( = ?auto_105004 ?auto_105006 ) ) ( not ( = ?auto_105005 ?auto_105006 ) ) ( ON ?auto_105004 ?auto_105005 ) ( ON-TABLE ?auto_105006 ) ( CLEAR ?auto_105002 ) ( ON ?auto_105003 ?auto_105004 ) ( CLEAR ?auto_105003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105006 ?auto_105005 ?auto_105004 )
      ( MAKE-7PILE ?auto_104999 ?auto_105000 ?auto_105001 ?auto_105002 ?auto_105003 ?auto_105004 ?auto_105005 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105007 - BLOCK
      ?auto_105008 - BLOCK
      ?auto_105009 - BLOCK
      ?auto_105010 - BLOCK
      ?auto_105011 - BLOCK
      ?auto_105012 - BLOCK
      ?auto_105013 - BLOCK
    )
    :vars
    (
      ?auto_105014 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105007 ) ( ON ?auto_105008 ?auto_105007 ) ( ON ?auto_105009 ?auto_105008 ) ( not ( = ?auto_105007 ?auto_105008 ) ) ( not ( = ?auto_105007 ?auto_105009 ) ) ( not ( = ?auto_105007 ?auto_105010 ) ) ( not ( = ?auto_105007 ?auto_105011 ) ) ( not ( = ?auto_105007 ?auto_105012 ) ) ( not ( = ?auto_105007 ?auto_105013 ) ) ( not ( = ?auto_105008 ?auto_105009 ) ) ( not ( = ?auto_105008 ?auto_105010 ) ) ( not ( = ?auto_105008 ?auto_105011 ) ) ( not ( = ?auto_105008 ?auto_105012 ) ) ( not ( = ?auto_105008 ?auto_105013 ) ) ( not ( = ?auto_105009 ?auto_105010 ) ) ( not ( = ?auto_105009 ?auto_105011 ) ) ( not ( = ?auto_105009 ?auto_105012 ) ) ( not ( = ?auto_105009 ?auto_105013 ) ) ( not ( = ?auto_105010 ?auto_105011 ) ) ( not ( = ?auto_105010 ?auto_105012 ) ) ( not ( = ?auto_105010 ?auto_105013 ) ) ( not ( = ?auto_105011 ?auto_105012 ) ) ( not ( = ?auto_105011 ?auto_105013 ) ) ( not ( = ?auto_105012 ?auto_105013 ) ) ( ON ?auto_105013 ?auto_105014 ) ( not ( = ?auto_105007 ?auto_105014 ) ) ( not ( = ?auto_105008 ?auto_105014 ) ) ( not ( = ?auto_105009 ?auto_105014 ) ) ( not ( = ?auto_105010 ?auto_105014 ) ) ( not ( = ?auto_105011 ?auto_105014 ) ) ( not ( = ?auto_105012 ?auto_105014 ) ) ( not ( = ?auto_105013 ?auto_105014 ) ) ( ON ?auto_105012 ?auto_105013 ) ( ON-TABLE ?auto_105014 ) ( ON ?auto_105011 ?auto_105012 ) ( CLEAR ?auto_105011 ) ( HOLDING ?auto_105010 ) ( CLEAR ?auto_105009 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105007 ?auto_105008 ?auto_105009 ?auto_105010 )
      ( MAKE-7PILE ?auto_105007 ?auto_105008 ?auto_105009 ?auto_105010 ?auto_105011 ?auto_105012 ?auto_105013 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105015 - BLOCK
      ?auto_105016 - BLOCK
      ?auto_105017 - BLOCK
      ?auto_105018 - BLOCK
      ?auto_105019 - BLOCK
      ?auto_105020 - BLOCK
      ?auto_105021 - BLOCK
    )
    :vars
    (
      ?auto_105022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105015 ) ( ON ?auto_105016 ?auto_105015 ) ( ON ?auto_105017 ?auto_105016 ) ( not ( = ?auto_105015 ?auto_105016 ) ) ( not ( = ?auto_105015 ?auto_105017 ) ) ( not ( = ?auto_105015 ?auto_105018 ) ) ( not ( = ?auto_105015 ?auto_105019 ) ) ( not ( = ?auto_105015 ?auto_105020 ) ) ( not ( = ?auto_105015 ?auto_105021 ) ) ( not ( = ?auto_105016 ?auto_105017 ) ) ( not ( = ?auto_105016 ?auto_105018 ) ) ( not ( = ?auto_105016 ?auto_105019 ) ) ( not ( = ?auto_105016 ?auto_105020 ) ) ( not ( = ?auto_105016 ?auto_105021 ) ) ( not ( = ?auto_105017 ?auto_105018 ) ) ( not ( = ?auto_105017 ?auto_105019 ) ) ( not ( = ?auto_105017 ?auto_105020 ) ) ( not ( = ?auto_105017 ?auto_105021 ) ) ( not ( = ?auto_105018 ?auto_105019 ) ) ( not ( = ?auto_105018 ?auto_105020 ) ) ( not ( = ?auto_105018 ?auto_105021 ) ) ( not ( = ?auto_105019 ?auto_105020 ) ) ( not ( = ?auto_105019 ?auto_105021 ) ) ( not ( = ?auto_105020 ?auto_105021 ) ) ( ON ?auto_105021 ?auto_105022 ) ( not ( = ?auto_105015 ?auto_105022 ) ) ( not ( = ?auto_105016 ?auto_105022 ) ) ( not ( = ?auto_105017 ?auto_105022 ) ) ( not ( = ?auto_105018 ?auto_105022 ) ) ( not ( = ?auto_105019 ?auto_105022 ) ) ( not ( = ?auto_105020 ?auto_105022 ) ) ( not ( = ?auto_105021 ?auto_105022 ) ) ( ON ?auto_105020 ?auto_105021 ) ( ON-TABLE ?auto_105022 ) ( ON ?auto_105019 ?auto_105020 ) ( CLEAR ?auto_105017 ) ( ON ?auto_105018 ?auto_105019 ) ( CLEAR ?auto_105018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105022 ?auto_105021 ?auto_105020 ?auto_105019 )
      ( MAKE-7PILE ?auto_105015 ?auto_105016 ?auto_105017 ?auto_105018 ?auto_105019 ?auto_105020 ?auto_105021 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105023 - BLOCK
      ?auto_105024 - BLOCK
      ?auto_105025 - BLOCK
      ?auto_105026 - BLOCK
      ?auto_105027 - BLOCK
      ?auto_105028 - BLOCK
      ?auto_105029 - BLOCK
    )
    :vars
    (
      ?auto_105030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105023 ) ( ON ?auto_105024 ?auto_105023 ) ( not ( = ?auto_105023 ?auto_105024 ) ) ( not ( = ?auto_105023 ?auto_105025 ) ) ( not ( = ?auto_105023 ?auto_105026 ) ) ( not ( = ?auto_105023 ?auto_105027 ) ) ( not ( = ?auto_105023 ?auto_105028 ) ) ( not ( = ?auto_105023 ?auto_105029 ) ) ( not ( = ?auto_105024 ?auto_105025 ) ) ( not ( = ?auto_105024 ?auto_105026 ) ) ( not ( = ?auto_105024 ?auto_105027 ) ) ( not ( = ?auto_105024 ?auto_105028 ) ) ( not ( = ?auto_105024 ?auto_105029 ) ) ( not ( = ?auto_105025 ?auto_105026 ) ) ( not ( = ?auto_105025 ?auto_105027 ) ) ( not ( = ?auto_105025 ?auto_105028 ) ) ( not ( = ?auto_105025 ?auto_105029 ) ) ( not ( = ?auto_105026 ?auto_105027 ) ) ( not ( = ?auto_105026 ?auto_105028 ) ) ( not ( = ?auto_105026 ?auto_105029 ) ) ( not ( = ?auto_105027 ?auto_105028 ) ) ( not ( = ?auto_105027 ?auto_105029 ) ) ( not ( = ?auto_105028 ?auto_105029 ) ) ( ON ?auto_105029 ?auto_105030 ) ( not ( = ?auto_105023 ?auto_105030 ) ) ( not ( = ?auto_105024 ?auto_105030 ) ) ( not ( = ?auto_105025 ?auto_105030 ) ) ( not ( = ?auto_105026 ?auto_105030 ) ) ( not ( = ?auto_105027 ?auto_105030 ) ) ( not ( = ?auto_105028 ?auto_105030 ) ) ( not ( = ?auto_105029 ?auto_105030 ) ) ( ON ?auto_105028 ?auto_105029 ) ( ON-TABLE ?auto_105030 ) ( ON ?auto_105027 ?auto_105028 ) ( ON ?auto_105026 ?auto_105027 ) ( CLEAR ?auto_105026 ) ( HOLDING ?auto_105025 ) ( CLEAR ?auto_105024 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105023 ?auto_105024 ?auto_105025 )
      ( MAKE-7PILE ?auto_105023 ?auto_105024 ?auto_105025 ?auto_105026 ?auto_105027 ?auto_105028 ?auto_105029 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105031 - BLOCK
      ?auto_105032 - BLOCK
      ?auto_105033 - BLOCK
      ?auto_105034 - BLOCK
      ?auto_105035 - BLOCK
      ?auto_105036 - BLOCK
      ?auto_105037 - BLOCK
    )
    :vars
    (
      ?auto_105038 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105031 ) ( ON ?auto_105032 ?auto_105031 ) ( not ( = ?auto_105031 ?auto_105032 ) ) ( not ( = ?auto_105031 ?auto_105033 ) ) ( not ( = ?auto_105031 ?auto_105034 ) ) ( not ( = ?auto_105031 ?auto_105035 ) ) ( not ( = ?auto_105031 ?auto_105036 ) ) ( not ( = ?auto_105031 ?auto_105037 ) ) ( not ( = ?auto_105032 ?auto_105033 ) ) ( not ( = ?auto_105032 ?auto_105034 ) ) ( not ( = ?auto_105032 ?auto_105035 ) ) ( not ( = ?auto_105032 ?auto_105036 ) ) ( not ( = ?auto_105032 ?auto_105037 ) ) ( not ( = ?auto_105033 ?auto_105034 ) ) ( not ( = ?auto_105033 ?auto_105035 ) ) ( not ( = ?auto_105033 ?auto_105036 ) ) ( not ( = ?auto_105033 ?auto_105037 ) ) ( not ( = ?auto_105034 ?auto_105035 ) ) ( not ( = ?auto_105034 ?auto_105036 ) ) ( not ( = ?auto_105034 ?auto_105037 ) ) ( not ( = ?auto_105035 ?auto_105036 ) ) ( not ( = ?auto_105035 ?auto_105037 ) ) ( not ( = ?auto_105036 ?auto_105037 ) ) ( ON ?auto_105037 ?auto_105038 ) ( not ( = ?auto_105031 ?auto_105038 ) ) ( not ( = ?auto_105032 ?auto_105038 ) ) ( not ( = ?auto_105033 ?auto_105038 ) ) ( not ( = ?auto_105034 ?auto_105038 ) ) ( not ( = ?auto_105035 ?auto_105038 ) ) ( not ( = ?auto_105036 ?auto_105038 ) ) ( not ( = ?auto_105037 ?auto_105038 ) ) ( ON ?auto_105036 ?auto_105037 ) ( ON-TABLE ?auto_105038 ) ( ON ?auto_105035 ?auto_105036 ) ( ON ?auto_105034 ?auto_105035 ) ( CLEAR ?auto_105032 ) ( ON ?auto_105033 ?auto_105034 ) ( CLEAR ?auto_105033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105038 ?auto_105037 ?auto_105036 ?auto_105035 ?auto_105034 )
      ( MAKE-7PILE ?auto_105031 ?auto_105032 ?auto_105033 ?auto_105034 ?auto_105035 ?auto_105036 ?auto_105037 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105039 - BLOCK
      ?auto_105040 - BLOCK
      ?auto_105041 - BLOCK
      ?auto_105042 - BLOCK
      ?auto_105043 - BLOCK
      ?auto_105044 - BLOCK
      ?auto_105045 - BLOCK
    )
    :vars
    (
      ?auto_105046 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105039 ) ( not ( = ?auto_105039 ?auto_105040 ) ) ( not ( = ?auto_105039 ?auto_105041 ) ) ( not ( = ?auto_105039 ?auto_105042 ) ) ( not ( = ?auto_105039 ?auto_105043 ) ) ( not ( = ?auto_105039 ?auto_105044 ) ) ( not ( = ?auto_105039 ?auto_105045 ) ) ( not ( = ?auto_105040 ?auto_105041 ) ) ( not ( = ?auto_105040 ?auto_105042 ) ) ( not ( = ?auto_105040 ?auto_105043 ) ) ( not ( = ?auto_105040 ?auto_105044 ) ) ( not ( = ?auto_105040 ?auto_105045 ) ) ( not ( = ?auto_105041 ?auto_105042 ) ) ( not ( = ?auto_105041 ?auto_105043 ) ) ( not ( = ?auto_105041 ?auto_105044 ) ) ( not ( = ?auto_105041 ?auto_105045 ) ) ( not ( = ?auto_105042 ?auto_105043 ) ) ( not ( = ?auto_105042 ?auto_105044 ) ) ( not ( = ?auto_105042 ?auto_105045 ) ) ( not ( = ?auto_105043 ?auto_105044 ) ) ( not ( = ?auto_105043 ?auto_105045 ) ) ( not ( = ?auto_105044 ?auto_105045 ) ) ( ON ?auto_105045 ?auto_105046 ) ( not ( = ?auto_105039 ?auto_105046 ) ) ( not ( = ?auto_105040 ?auto_105046 ) ) ( not ( = ?auto_105041 ?auto_105046 ) ) ( not ( = ?auto_105042 ?auto_105046 ) ) ( not ( = ?auto_105043 ?auto_105046 ) ) ( not ( = ?auto_105044 ?auto_105046 ) ) ( not ( = ?auto_105045 ?auto_105046 ) ) ( ON ?auto_105044 ?auto_105045 ) ( ON-TABLE ?auto_105046 ) ( ON ?auto_105043 ?auto_105044 ) ( ON ?auto_105042 ?auto_105043 ) ( ON ?auto_105041 ?auto_105042 ) ( CLEAR ?auto_105041 ) ( HOLDING ?auto_105040 ) ( CLEAR ?auto_105039 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105039 ?auto_105040 )
      ( MAKE-7PILE ?auto_105039 ?auto_105040 ?auto_105041 ?auto_105042 ?auto_105043 ?auto_105044 ?auto_105045 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105047 - BLOCK
      ?auto_105048 - BLOCK
      ?auto_105049 - BLOCK
      ?auto_105050 - BLOCK
      ?auto_105051 - BLOCK
      ?auto_105052 - BLOCK
      ?auto_105053 - BLOCK
    )
    :vars
    (
      ?auto_105054 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105047 ) ( not ( = ?auto_105047 ?auto_105048 ) ) ( not ( = ?auto_105047 ?auto_105049 ) ) ( not ( = ?auto_105047 ?auto_105050 ) ) ( not ( = ?auto_105047 ?auto_105051 ) ) ( not ( = ?auto_105047 ?auto_105052 ) ) ( not ( = ?auto_105047 ?auto_105053 ) ) ( not ( = ?auto_105048 ?auto_105049 ) ) ( not ( = ?auto_105048 ?auto_105050 ) ) ( not ( = ?auto_105048 ?auto_105051 ) ) ( not ( = ?auto_105048 ?auto_105052 ) ) ( not ( = ?auto_105048 ?auto_105053 ) ) ( not ( = ?auto_105049 ?auto_105050 ) ) ( not ( = ?auto_105049 ?auto_105051 ) ) ( not ( = ?auto_105049 ?auto_105052 ) ) ( not ( = ?auto_105049 ?auto_105053 ) ) ( not ( = ?auto_105050 ?auto_105051 ) ) ( not ( = ?auto_105050 ?auto_105052 ) ) ( not ( = ?auto_105050 ?auto_105053 ) ) ( not ( = ?auto_105051 ?auto_105052 ) ) ( not ( = ?auto_105051 ?auto_105053 ) ) ( not ( = ?auto_105052 ?auto_105053 ) ) ( ON ?auto_105053 ?auto_105054 ) ( not ( = ?auto_105047 ?auto_105054 ) ) ( not ( = ?auto_105048 ?auto_105054 ) ) ( not ( = ?auto_105049 ?auto_105054 ) ) ( not ( = ?auto_105050 ?auto_105054 ) ) ( not ( = ?auto_105051 ?auto_105054 ) ) ( not ( = ?auto_105052 ?auto_105054 ) ) ( not ( = ?auto_105053 ?auto_105054 ) ) ( ON ?auto_105052 ?auto_105053 ) ( ON-TABLE ?auto_105054 ) ( ON ?auto_105051 ?auto_105052 ) ( ON ?auto_105050 ?auto_105051 ) ( ON ?auto_105049 ?auto_105050 ) ( CLEAR ?auto_105047 ) ( ON ?auto_105048 ?auto_105049 ) ( CLEAR ?auto_105048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105054 ?auto_105053 ?auto_105052 ?auto_105051 ?auto_105050 ?auto_105049 )
      ( MAKE-7PILE ?auto_105047 ?auto_105048 ?auto_105049 ?auto_105050 ?auto_105051 ?auto_105052 ?auto_105053 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105055 - BLOCK
      ?auto_105056 - BLOCK
      ?auto_105057 - BLOCK
      ?auto_105058 - BLOCK
      ?auto_105059 - BLOCK
      ?auto_105060 - BLOCK
      ?auto_105061 - BLOCK
    )
    :vars
    (
      ?auto_105062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105055 ?auto_105056 ) ) ( not ( = ?auto_105055 ?auto_105057 ) ) ( not ( = ?auto_105055 ?auto_105058 ) ) ( not ( = ?auto_105055 ?auto_105059 ) ) ( not ( = ?auto_105055 ?auto_105060 ) ) ( not ( = ?auto_105055 ?auto_105061 ) ) ( not ( = ?auto_105056 ?auto_105057 ) ) ( not ( = ?auto_105056 ?auto_105058 ) ) ( not ( = ?auto_105056 ?auto_105059 ) ) ( not ( = ?auto_105056 ?auto_105060 ) ) ( not ( = ?auto_105056 ?auto_105061 ) ) ( not ( = ?auto_105057 ?auto_105058 ) ) ( not ( = ?auto_105057 ?auto_105059 ) ) ( not ( = ?auto_105057 ?auto_105060 ) ) ( not ( = ?auto_105057 ?auto_105061 ) ) ( not ( = ?auto_105058 ?auto_105059 ) ) ( not ( = ?auto_105058 ?auto_105060 ) ) ( not ( = ?auto_105058 ?auto_105061 ) ) ( not ( = ?auto_105059 ?auto_105060 ) ) ( not ( = ?auto_105059 ?auto_105061 ) ) ( not ( = ?auto_105060 ?auto_105061 ) ) ( ON ?auto_105061 ?auto_105062 ) ( not ( = ?auto_105055 ?auto_105062 ) ) ( not ( = ?auto_105056 ?auto_105062 ) ) ( not ( = ?auto_105057 ?auto_105062 ) ) ( not ( = ?auto_105058 ?auto_105062 ) ) ( not ( = ?auto_105059 ?auto_105062 ) ) ( not ( = ?auto_105060 ?auto_105062 ) ) ( not ( = ?auto_105061 ?auto_105062 ) ) ( ON ?auto_105060 ?auto_105061 ) ( ON-TABLE ?auto_105062 ) ( ON ?auto_105059 ?auto_105060 ) ( ON ?auto_105058 ?auto_105059 ) ( ON ?auto_105057 ?auto_105058 ) ( ON ?auto_105056 ?auto_105057 ) ( CLEAR ?auto_105056 ) ( HOLDING ?auto_105055 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105055 )
      ( MAKE-7PILE ?auto_105055 ?auto_105056 ?auto_105057 ?auto_105058 ?auto_105059 ?auto_105060 ?auto_105061 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_105063 - BLOCK
      ?auto_105064 - BLOCK
      ?auto_105065 - BLOCK
      ?auto_105066 - BLOCK
      ?auto_105067 - BLOCK
      ?auto_105068 - BLOCK
      ?auto_105069 - BLOCK
    )
    :vars
    (
      ?auto_105070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105063 ?auto_105064 ) ) ( not ( = ?auto_105063 ?auto_105065 ) ) ( not ( = ?auto_105063 ?auto_105066 ) ) ( not ( = ?auto_105063 ?auto_105067 ) ) ( not ( = ?auto_105063 ?auto_105068 ) ) ( not ( = ?auto_105063 ?auto_105069 ) ) ( not ( = ?auto_105064 ?auto_105065 ) ) ( not ( = ?auto_105064 ?auto_105066 ) ) ( not ( = ?auto_105064 ?auto_105067 ) ) ( not ( = ?auto_105064 ?auto_105068 ) ) ( not ( = ?auto_105064 ?auto_105069 ) ) ( not ( = ?auto_105065 ?auto_105066 ) ) ( not ( = ?auto_105065 ?auto_105067 ) ) ( not ( = ?auto_105065 ?auto_105068 ) ) ( not ( = ?auto_105065 ?auto_105069 ) ) ( not ( = ?auto_105066 ?auto_105067 ) ) ( not ( = ?auto_105066 ?auto_105068 ) ) ( not ( = ?auto_105066 ?auto_105069 ) ) ( not ( = ?auto_105067 ?auto_105068 ) ) ( not ( = ?auto_105067 ?auto_105069 ) ) ( not ( = ?auto_105068 ?auto_105069 ) ) ( ON ?auto_105069 ?auto_105070 ) ( not ( = ?auto_105063 ?auto_105070 ) ) ( not ( = ?auto_105064 ?auto_105070 ) ) ( not ( = ?auto_105065 ?auto_105070 ) ) ( not ( = ?auto_105066 ?auto_105070 ) ) ( not ( = ?auto_105067 ?auto_105070 ) ) ( not ( = ?auto_105068 ?auto_105070 ) ) ( not ( = ?auto_105069 ?auto_105070 ) ) ( ON ?auto_105068 ?auto_105069 ) ( ON-TABLE ?auto_105070 ) ( ON ?auto_105067 ?auto_105068 ) ( ON ?auto_105066 ?auto_105067 ) ( ON ?auto_105065 ?auto_105066 ) ( ON ?auto_105064 ?auto_105065 ) ( ON ?auto_105063 ?auto_105064 ) ( CLEAR ?auto_105063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105070 ?auto_105069 ?auto_105068 ?auto_105067 ?auto_105066 ?auto_105065 ?auto_105064 )
      ( MAKE-7PILE ?auto_105063 ?auto_105064 ?auto_105065 ?auto_105066 ?auto_105067 ?auto_105068 ?auto_105069 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105077 - BLOCK
      ?auto_105078 - BLOCK
      ?auto_105079 - BLOCK
      ?auto_105080 - BLOCK
      ?auto_105081 - BLOCK
      ?auto_105082 - BLOCK
    )
    :vars
    (
      ?auto_105083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105083 ?auto_105082 ) ( CLEAR ?auto_105083 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105077 ) ( ON ?auto_105078 ?auto_105077 ) ( ON ?auto_105079 ?auto_105078 ) ( ON ?auto_105080 ?auto_105079 ) ( ON ?auto_105081 ?auto_105080 ) ( ON ?auto_105082 ?auto_105081 ) ( not ( = ?auto_105077 ?auto_105078 ) ) ( not ( = ?auto_105077 ?auto_105079 ) ) ( not ( = ?auto_105077 ?auto_105080 ) ) ( not ( = ?auto_105077 ?auto_105081 ) ) ( not ( = ?auto_105077 ?auto_105082 ) ) ( not ( = ?auto_105077 ?auto_105083 ) ) ( not ( = ?auto_105078 ?auto_105079 ) ) ( not ( = ?auto_105078 ?auto_105080 ) ) ( not ( = ?auto_105078 ?auto_105081 ) ) ( not ( = ?auto_105078 ?auto_105082 ) ) ( not ( = ?auto_105078 ?auto_105083 ) ) ( not ( = ?auto_105079 ?auto_105080 ) ) ( not ( = ?auto_105079 ?auto_105081 ) ) ( not ( = ?auto_105079 ?auto_105082 ) ) ( not ( = ?auto_105079 ?auto_105083 ) ) ( not ( = ?auto_105080 ?auto_105081 ) ) ( not ( = ?auto_105080 ?auto_105082 ) ) ( not ( = ?auto_105080 ?auto_105083 ) ) ( not ( = ?auto_105081 ?auto_105082 ) ) ( not ( = ?auto_105081 ?auto_105083 ) ) ( not ( = ?auto_105082 ?auto_105083 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105083 ?auto_105082 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105099 - BLOCK
      ?auto_105100 - BLOCK
      ?auto_105101 - BLOCK
      ?auto_105102 - BLOCK
      ?auto_105103 - BLOCK
      ?auto_105104 - BLOCK
    )
    :vars
    (
      ?auto_105105 - BLOCK
      ?auto_105106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105099 ) ( ON ?auto_105100 ?auto_105099 ) ( ON ?auto_105101 ?auto_105100 ) ( ON ?auto_105102 ?auto_105101 ) ( ON ?auto_105103 ?auto_105102 ) ( not ( = ?auto_105099 ?auto_105100 ) ) ( not ( = ?auto_105099 ?auto_105101 ) ) ( not ( = ?auto_105099 ?auto_105102 ) ) ( not ( = ?auto_105099 ?auto_105103 ) ) ( not ( = ?auto_105099 ?auto_105104 ) ) ( not ( = ?auto_105099 ?auto_105105 ) ) ( not ( = ?auto_105100 ?auto_105101 ) ) ( not ( = ?auto_105100 ?auto_105102 ) ) ( not ( = ?auto_105100 ?auto_105103 ) ) ( not ( = ?auto_105100 ?auto_105104 ) ) ( not ( = ?auto_105100 ?auto_105105 ) ) ( not ( = ?auto_105101 ?auto_105102 ) ) ( not ( = ?auto_105101 ?auto_105103 ) ) ( not ( = ?auto_105101 ?auto_105104 ) ) ( not ( = ?auto_105101 ?auto_105105 ) ) ( not ( = ?auto_105102 ?auto_105103 ) ) ( not ( = ?auto_105102 ?auto_105104 ) ) ( not ( = ?auto_105102 ?auto_105105 ) ) ( not ( = ?auto_105103 ?auto_105104 ) ) ( not ( = ?auto_105103 ?auto_105105 ) ) ( not ( = ?auto_105104 ?auto_105105 ) ) ( ON ?auto_105105 ?auto_105106 ) ( CLEAR ?auto_105105 ) ( not ( = ?auto_105099 ?auto_105106 ) ) ( not ( = ?auto_105100 ?auto_105106 ) ) ( not ( = ?auto_105101 ?auto_105106 ) ) ( not ( = ?auto_105102 ?auto_105106 ) ) ( not ( = ?auto_105103 ?auto_105106 ) ) ( not ( = ?auto_105104 ?auto_105106 ) ) ( not ( = ?auto_105105 ?auto_105106 ) ) ( HOLDING ?auto_105104 ) ( CLEAR ?auto_105103 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105099 ?auto_105100 ?auto_105101 ?auto_105102 ?auto_105103 ?auto_105104 ?auto_105105 )
      ( MAKE-6PILE ?auto_105099 ?auto_105100 ?auto_105101 ?auto_105102 ?auto_105103 ?auto_105104 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105107 - BLOCK
      ?auto_105108 - BLOCK
      ?auto_105109 - BLOCK
      ?auto_105110 - BLOCK
      ?auto_105111 - BLOCK
      ?auto_105112 - BLOCK
    )
    :vars
    (
      ?auto_105113 - BLOCK
      ?auto_105114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105107 ) ( ON ?auto_105108 ?auto_105107 ) ( ON ?auto_105109 ?auto_105108 ) ( ON ?auto_105110 ?auto_105109 ) ( ON ?auto_105111 ?auto_105110 ) ( not ( = ?auto_105107 ?auto_105108 ) ) ( not ( = ?auto_105107 ?auto_105109 ) ) ( not ( = ?auto_105107 ?auto_105110 ) ) ( not ( = ?auto_105107 ?auto_105111 ) ) ( not ( = ?auto_105107 ?auto_105112 ) ) ( not ( = ?auto_105107 ?auto_105113 ) ) ( not ( = ?auto_105108 ?auto_105109 ) ) ( not ( = ?auto_105108 ?auto_105110 ) ) ( not ( = ?auto_105108 ?auto_105111 ) ) ( not ( = ?auto_105108 ?auto_105112 ) ) ( not ( = ?auto_105108 ?auto_105113 ) ) ( not ( = ?auto_105109 ?auto_105110 ) ) ( not ( = ?auto_105109 ?auto_105111 ) ) ( not ( = ?auto_105109 ?auto_105112 ) ) ( not ( = ?auto_105109 ?auto_105113 ) ) ( not ( = ?auto_105110 ?auto_105111 ) ) ( not ( = ?auto_105110 ?auto_105112 ) ) ( not ( = ?auto_105110 ?auto_105113 ) ) ( not ( = ?auto_105111 ?auto_105112 ) ) ( not ( = ?auto_105111 ?auto_105113 ) ) ( not ( = ?auto_105112 ?auto_105113 ) ) ( ON ?auto_105113 ?auto_105114 ) ( not ( = ?auto_105107 ?auto_105114 ) ) ( not ( = ?auto_105108 ?auto_105114 ) ) ( not ( = ?auto_105109 ?auto_105114 ) ) ( not ( = ?auto_105110 ?auto_105114 ) ) ( not ( = ?auto_105111 ?auto_105114 ) ) ( not ( = ?auto_105112 ?auto_105114 ) ) ( not ( = ?auto_105113 ?auto_105114 ) ) ( CLEAR ?auto_105111 ) ( ON ?auto_105112 ?auto_105113 ) ( CLEAR ?auto_105112 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105114 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105114 ?auto_105113 )
      ( MAKE-6PILE ?auto_105107 ?auto_105108 ?auto_105109 ?auto_105110 ?auto_105111 ?auto_105112 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105115 - BLOCK
      ?auto_105116 - BLOCK
      ?auto_105117 - BLOCK
      ?auto_105118 - BLOCK
      ?auto_105119 - BLOCK
      ?auto_105120 - BLOCK
    )
    :vars
    (
      ?auto_105121 - BLOCK
      ?auto_105122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105115 ) ( ON ?auto_105116 ?auto_105115 ) ( ON ?auto_105117 ?auto_105116 ) ( ON ?auto_105118 ?auto_105117 ) ( not ( = ?auto_105115 ?auto_105116 ) ) ( not ( = ?auto_105115 ?auto_105117 ) ) ( not ( = ?auto_105115 ?auto_105118 ) ) ( not ( = ?auto_105115 ?auto_105119 ) ) ( not ( = ?auto_105115 ?auto_105120 ) ) ( not ( = ?auto_105115 ?auto_105121 ) ) ( not ( = ?auto_105116 ?auto_105117 ) ) ( not ( = ?auto_105116 ?auto_105118 ) ) ( not ( = ?auto_105116 ?auto_105119 ) ) ( not ( = ?auto_105116 ?auto_105120 ) ) ( not ( = ?auto_105116 ?auto_105121 ) ) ( not ( = ?auto_105117 ?auto_105118 ) ) ( not ( = ?auto_105117 ?auto_105119 ) ) ( not ( = ?auto_105117 ?auto_105120 ) ) ( not ( = ?auto_105117 ?auto_105121 ) ) ( not ( = ?auto_105118 ?auto_105119 ) ) ( not ( = ?auto_105118 ?auto_105120 ) ) ( not ( = ?auto_105118 ?auto_105121 ) ) ( not ( = ?auto_105119 ?auto_105120 ) ) ( not ( = ?auto_105119 ?auto_105121 ) ) ( not ( = ?auto_105120 ?auto_105121 ) ) ( ON ?auto_105121 ?auto_105122 ) ( not ( = ?auto_105115 ?auto_105122 ) ) ( not ( = ?auto_105116 ?auto_105122 ) ) ( not ( = ?auto_105117 ?auto_105122 ) ) ( not ( = ?auto_105118 ?auto_105122 ) ) ( not ( = ?auto_105119 ?auto_105122 ) ) ( not ( = ?auto_105120 ?auto_105122 ) ) ( not ( = ?auto_105121 ?auto_105122 ) ) ( ON ?auto_105120 ?auto_105121 ) ( CLEAR ?auto_105120 ) ( ON-TABLE ?auto_105122 ) ( HOLDING ?auto_105119 ) ( CLEAR ?auto_105118 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105115 ?auto_105116 ?auto_105117 ?auto_105118 ?auto_105119 )
      ( MAKE-6PILE ?auto_105115 ?auto_105116 ?auto_105117 ?auto_105118 ?auto_105119 ?auto_105120 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105123 - BLOCK
      ?auto_105124 - BLOCK
      ?auto_105125 - BLOCK
      ?auto_105126 - BLOCK
      ?auto_105127 - BLOCK
      ?auto_105128 - BLOCK
    )
    :vars
    (
      ?auto_105130 - BLOCK
      ?auto_105129 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105123 ) ( ON ?auto_105124 ?auto_105123 ) ( ON ?auto_105125 ?auto_105124 ) ( ON ?auto_105126 ?auto_105125 ) ( not ( = ?auto_105123 ?auto_105124 ) ) ( not ( = ?auto_105123 ?auto_105125 ) ) ( not ( = ?auto_105123 ?auto_105126 ) ) ( not ( = ?auto_105123 ?auto_105127 ) ) ( not ( = ?auto_105123 ?auto_105128 ) ) ( not ( = ?auto_105123 ?auto_105130 ) ) ( not ( = ?auto_105124 ?auto_105125 ) ) ( not ( = ?auto_105124 ?auto_105126 ) ) ( not ( = ?auto_105124 ?auto_105127 ) ) ( not ( = ?auto_105124 ?auto_105128 ) ) ( not ( = ?auto_105124 ?auto_105130 ) ) ( not ( = ?auto_105125 ?auto_105126 ) ) ( not ( = ?auto_105125 ?auto_105127 ) ) ( not ( = ?auto_105125 ?auto_105128 ) ) ( not ( = ?auto_105125 ?auto_105130 ) ) ( not ( = ?auto_105126 ?auto_105127 ) ) ( not ( = ?auto_105126 ?auto_105128 ) ) ( not ( = ?auto_105126 ?auto_105130 ) ) ( not ( = ?auto_105127 ?auto_105128 ) ) ( not ( = ?auto_105127 ?auto_105130 ) ) ( not ( = ?auto_105128 ?auto_105130 ) ) ( ON ?auto_105130 ?auto_105129 ) ( not ( = ?auto_105123 ?auto_105129 ) ) ( not ( = ?auto_105124 ?auto_105129 ) ) ( not ( = ?auto_105125 ?auto_105129 ) ) ( not ( = ?auto_105126 ?auto_105129 ) ) ( not ( = ?auto_105127 ?auto_105129 ) ) ( not ( = ?auto_105128 ?auto_105129 ) ) ( not ( = ?auto_105130 ?auto_105129 ) ) ( ON ?auto_105128 ?auto_105130 ) ( ON-TABLE ?auto_105129 ) ( CLEAR ?auto_105126 ) ( ON ?auto_105127 ?auto_105128 ) ( CLEAR ?auto_105127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105129 ?auto_105130 ?auto_105128 )
      ( MAKE-6PILE ?auto_105123 ?auto_105124 ?auto_105125 ?auto_105126 ?auto_105127 ?auto_105128 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105131 - BLOCK
      ?auto_105132 - BLOCK
      ?auto_105133 - BLOCK
      ?auto_105134 - BLOCK
      ?auto_105135 - BLOCK
      ?auto_105136 - BLOCK
    )
    :vars
    (
      ?auto_105137 - BLOCK
      ?auto_105138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105131 ) ( ON ?auto_105132 ?auto_105131 ) ( ON ?auto_105133 ?auto_105132 ) ( not ( = ?auto_105131 ?auto_105132 ) ) ( not ( = ?auto_105131 ?auto_105133 ) ) ( not ( = ?auto_105131 ?auto_105134 ) ) ( not ( = ?auto_105131 ?auto_105135 ) ) ( not ( = ?auto_105131 ?auto_105136 ) ) ( not ( = ?auto_105131 ?auto_105137 ) ) ( not ( = ?auto_105132 ?auto_105133 ) ) ( not ( = ?auto_105132 ?auto_105134 ) ) ( not ( = ?auto_105132 ?auto_105135 ) ) ( not ( = ?auto_105132 ?auto_105136 ) ) ( not ( = ?auto_105132 ?auto_105137 ) ) ( not ( = ?auto_105133 ?auto_105134 ) ) ( not ( = ?auto_105133 ?auto_105135 ) ) ( not ( = ?auto_105133 ?auto_105136 ) ) ( not ( = ?auto_105133 ?auto_105137 ) ) ( not ( = ?auto_105134 ?auto_105135 ) ) ( not ( = ?auto_105134 ?auto_105136 ) ) ( not ( = ?auto_105134 ?auto_105137 ) ) ( not ( = ?auto_105135 ?auto_105136 ) ) ( not ( = ?auto_105135 ?auto_105137 ) ) ( not ( = ?auto_105136 ?auto_105137 ) ) ( ON ?auto_105137 ?auto_105138 ) ( not ( = ?auto_105131 ?auto_105138 ) ) ( not ( = ?auto_105132 ?auto_105138 ) ) ( not ( = ?auto_105133 ?auto_105138 ) ) ( not ( = ?auto_105134 ?auto_105138 ) ) ( not ( = ?auto_105135 ?auto_105138 ) ) ( not ( = ?auto_105136 ?auto_105138 ) ) ( not ( = ?auto_105137 ?auto_105138 ) ) ( ON ?auto_105136 ?auto_105137 ) ( ON-TABLE ?auto_105138 ) ( ON ?auto_105135 ?auto_105136 ) ( CLEAR ?auto_105135 ) ( HOLDING ?auto_105134 ) ( CLEAR ?auto_105133 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105131 ?auto_105132 ?auto_105133 ?auto_105134 )
      ( MAKE-6PILE ?auto_105131 ?auto_105132 ?auto_105133 ?auto_105134 ?auto_105135 ?auto_105136 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105139 - BLOCK
      ?auto_105140 - BLOCK
      ?auto_105141 - BLOCK
      ?auto_105142 - BLOCK
      ?auto_105143 - BLOCK
      ?auto_105144 - BLOCK
    )
    :vars
    (
      ?auto_105146 - BLOCK
      ?auto_105145 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105139 ) ( ON ?auto_105140 ?auto_105139 ) ( ON ?auto_105141 ?auto_105140 ) ( not ( = ?auto_105139 ?auto_105140 ) ) ( not ( = ?auto_105139 ?auto_105141 ) ) ( not ( = ?auto_105139 ?auto_105142 ) ) ( not ( = ?auto_105139 ?auto_105143 ) ) ( not ( = ?auto_105139 ?auto_105144 ) ) ( not ( = ?auto_105139 ?auto_105146 ) ) ( not ( = ?auto_105140 ?auto_105141 ) ) ( not ( = ?auto_105140 ?auto_105142 ) ) ( not ( = ?auto_105140 ?auto_105143 ) ) ( not ( = ?auto_105140 ?auto_105144 ) ) ( not ( = ?auto_105140 ?auto_105146 ) ) ( not ( = ?auto_105141 ?auto_105142 ) ) ( not ( = ?auto_105141 ?auto_105143 ) ) ( not ( = ?auto_105141 ?auto_105144 ) ) ( not ( = ?auto_105141 ?auto_105146 ) ) ( not ( = ?auto_105142 ?auto_105143 ) ) ( not ( = ?auto_105142 ?auto_105144 ) ) ( not ( = ?auto_105142 ?auto_105146 ) ) ( not ( = ?auto_105143 ?auto_105144 ) ) ( not ( = ?auto_105143 ?auto_105146 ) ) ( not ( = ?auto_105144 ?auto_105146 ) ) ( ON ?auto_105146 ?auto_105145 ) ( not ( = ?auto_105139 ?auto_105145 ) ) ( not ( = ?auto_105140 ?auto_105145 ) ) ( not ( = ?auto_105141 ?auto_105145 ) ) ( not ( = ?auto_105142 ?auto_105145 ) ) ( not ( = ?auto_105143 ?auto_105145 ) ) ( not ( = ?auto_105144 ?auto_105145 ) ) ( not ( = ?auto_105146 ?auto_105145 ) ) ( ON ?auto_105144 ?auto_105146 ) ( ON-TABLE ?auto_105145 ) ( ON ?auto_105143 ?auto_105144 ) ( CLEAR ?auto_105141 ) ( ON ?auto_105142 ?auto_105143 ) ( CLEAR ?auto_105142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105145 ?auto_105146 ?auto_105144 ?auto_105143 )
      ( MAKE-6PILE ?auto_105139 ?auto_105140 ?auto_105141 ?auto_105142 ?auto_105143 ?auto_105144 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105147 - BLOCK
      ?auto_105148 - BLOCK
      ?auto_105149 - BLOCK
      ?auto_105150 - BLOCK
      ?auto_105151 - BLOCK
      ?auto_105152 - BLOCK
    )
    :vars
    (
      ?auto_105154 - BLOCK
      ?auto_105153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105147 ) ( ON ?auto_105148 ?auto_105147 ) ( not ( = ?auto_105147 ?auto_105148 ) ) ( not ( = ?auto_105147 ?auto_105149 ) ) ( not ( = ?auto_105147 ?auto_105150 ) ) ( not ( = ?auto_105147 ?auto_105151 ) ) ( not ( = ?auto_105147 ?auto_105152 ) ) ( not ( = ?auto_105147 ?auto_105154 ) ) ( not ( = ?auto_105148 ?auto_105149 ) ) ( not ( = ?auto_105148 ?auto_105150 ) ) ( not ( = ?auto_105148 ?auto_105151 ) ) ( not ( = ?auto_105148 ?auto_105152 ) ) ( not ( = ?auto_105148 ?auto_105154 ) ) ( not ( = ?auto_105149 ?auto_105150 ) ) ( not ( = ?auto_105149 ?auto_105151 ) ) ( not ( = ?auto_105149 ?auto_105152 ) ) ( not ( = ?auto_105149 ?auto_105154 ) ) ( not ( = ?auto_105150 ?auto_105151 ) ) ( not ( = ?auto_105150 ?auto_105152 ) ) ( not ( = ?auto_105150 ?auto_105154 ) ) ( not ( = ?auto_105151 ?auto_105152 ) ) ( not ( = ?auto_105151 ?auto_105154 ) ) ( not ( = ?auto_105152 ?auto_105154 ) ) ( ON ?auto_105154 ?auto_105153 ) ( not ( = ?auto_105147 ?auto_105153 ) ) ( not ( = ?auto_105148 ?auto_105153 ) ) ( not ( = ?auto_105149 ?auto_105153 ) ) ( not ( = ?auto_105150 ?auto_105153 ) ) ( not ( = ?auto_105151 ?auto_105153 ) ) ( not ( = ?auto_105152 ?auto_105153 ) ) ( not ( = ?auto_105154 ?auto_105153 ) ) ( ON ?auto_105152 ?auto_105154 ) ( ON-TABLE ?auto_105153 ) ( ON ?auto_105151 ?auto_105152 ) ( ON ?auto_105150 ?auto_105151 ) ( CLEAR ?auto_105150 ) ( HOLDING ?auto_105149 ) ( CLEAR ?auto_105148 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105147 ?auto_105148 ?auto_105149 )
      ( MAKE-6PILE ?auto_105147 ?auto_105148 ?auto_105149 ?auto_105150 ?auto_105151 ?auto_105152 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105155 - BLOCK
      ?auto_105156 - BLOCK
      ?auto_105157 - BLOCK
      ?auto_105158 - BLOCK
      ?auto_105159 - BLOCK
      ?auto_105160 - BLOCK
    )
    :vars
    (
      ?auto_105162 - BLOCK
      ?auto_105161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105155 ) ( ON ?auto_105156 ?auto_105155 ) ( not ( = ?auto_105155 ?auto_105156 ) ) ( not ( = ?auto_105155 ?auto_105157 ) ) ( not ( = ?auto_105155 ?auto_105158 ) ) ( not ( = ?auto_105155 ?auto_105159 ) ) ( not ( = ?auto_105155 ?auto_105160 ) ) ( not ( = ?auto_105155 ?auto_105162 ) ) ( not ( = ?auto_105156 ?auto_105157 ) ) ( not ( = ?auto_105156 ?auto_105158 ) ) ( not ( = ?auto_105156 ?auto_105159 ) ) ( not ( = ?auto_105156 ?auto_105160 ) ) ( not ( = ?auto_105156 ?auto_105162 ) ) ( not ( = ?auto_105157 ?auto_105158 ) ) ( not ( = ?auto_105157 ?auto_105159 ) ) ( not ( = ?auto_105157 ?auto_105160 ) ) ( not ( = ?auto_105157 ?auto_105162 ) ) ( not ( = ?auto_105158 ?auto_105159 ) ) ( not ( = ?auto_105158 ?auto_105160 ) ) ( not ( = ?auto_105158 ?auto_105162 ) ) ( not ( = ?auto_105159 ?auto_105160 ) ) ( not ( = ?auto_105159 ?auto_105162 ) ) ( not ( = ?auto_105160 ?auto_105162 ) ) ( ON ?auto_105162 ?auto_105161 ) ( not ( = ?auto_105155 ?auto_105161 ) ) ( not ( = ?auto_105156 ?auto_105161 ) ) ( not ( = ?auto_105157 ?auto_105161 ) ) ( not ( = ?auto_105158 ?auto_105161 ) ) ( not ( = ?auto_105159 ?auto_105161 ) ) ( not ( = ?auto_105160 ?auto_105161 ) ) ( not ( = ?auto_105162 ?auto_105161 ) ) ( ON ?auto_105160 ?auto_105162 ) ( ON-TABLE ?auto_105161 ) ( ON ?auto_105159 ?auto_105160 ) ( ON ?auto_105158 ?auto_105159 ) ( CLEAR ?auto_105156 ) ( ON ?auto_105157 ?auto_105158 ) ( CLEAR ?auto_105157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105161 ?auto_105162 ?auto_105160 ?auto_105159 ?auto_105158 )
      ( MAKE-6PILE ?auto_105155 ?auto_105156 ?auto_105157 ?auto_105158 ?auto_105159 ?auto_105160 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105163 - BLOCK
      ?auto_105164 - BLOCK
      ?auto_105165 - BLOCK
      ?auto_105166 - BLOCK
      ?auto_105167 - BLOCK
      ?auto_105168 - BLOCK
    )
    :vars
    (
      ?auto_105169 - BLOCK
      ?auto_105170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105163 ) ( not ( = ?auto_105163 ?auto_105164 ) ) ( not ( = ?auto_105163 ?auto_105165 ) ) ( not ( = ?auto_105163 ?auto_105166 ) ) ( not ( = ?auto_105163 ?auto_105167 ) ) ( not ( = ?auto_105163 ?auto_105168 ) ) ( not ( = ?auto_105163 ?auto_105169 ) ) ( not ( = ?auto_105164 ?auto_105165 ) ) ( not ( = ?auto_105164 ?auto_105166 ) ) ( not ( = ?auto_105164 ?auto_105167 ) ) ( not ( = ?auto_105164 ?auto_105168 ) ) ( not ( = ?auto_105164 ?auto_105169 ) ) ( not ( = ?auto_105165 ?auto_105166 ) ) ( not ( = ?auto_105165 ?auto_105167 ) ) ( not ( = ?auto_105165 ?auto_105168 ) ) ( not ( = ?auto_105165 ?auto_105169 ) ) ( not ( = ?auto_105166 ?auto_105167 ) ) ( not ( = ?auto_105166 ?auto_105168 ) ) ( not ( = ?auto_105166 ?auto_105169 ) ) ( not ( = ?auto_105167 ?auto_105168 ) ) ( not ( = ?auto_105167 ?auto_105169 ) ) ( not ( = ?auto_105168 ?auto_105169 ) ) ( ON ?auto_105169 ?auto_105170 ) ( not ( = ?auto_105163 ?auto_105170 ) ) ( not ( = ?auto_105164 ?auto_105170 ) ) ( not ( = ?auto_105165 ?auto_105170 ) ) ( not ( = ?auto_105166 ?auto_105170 ) ) ( not ( = ?auto_105167 ?auto_105170 ) ) ( not ( = ?auto_105168 ?auto_105170 ) ) ( not ( = ?auto_105169 ?auto_105170 ) ) ( ON ?auto_105168 ?auto_105169 ) ( ON-TABLE ?auto_105170 ) ( ON ?auto_105167 ?auto_105168 ) ( ON ?auto_105166 ?auto_105167 ) ( ON ?auto_105165 ?auto_105166 ) ( CLEAR ?auto_105165 ) ( HOLDING ?auto_105164 ) ( CLEAR ?auto_105163 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105163 ?auto_105164 )
      ( MAKE-6PILE ?auto_105163 ?auto_105164 ?auto_105165 ?auto_105166 ?auto_105167 ?auto_105168 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105171 - BLOCK
      ?auto_105172 - BLOCK
      ?auto_105173 - BLOCK
      ?auto_105174 - BLOCK
      ?auto_105175 - BLOCK
      ?auto_105176 - BLOCK
    )
    :vars
    (
      ?auto_105177 - BLOCK
      ?auto_105178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105171 ) ( not ( = ?auto_105171 ?auto_105172 ) ) ( not ( = ?auto_105171 ?auto_105173 ) ) ( not ( = ?auto_105171 ?auto_105174 ) ) ( not ( = ?auto_105171 ?auto_105175 ) ) ( not ( = ?auto_105171 ?auto_105176 ) ) ( not ( = ?auto_105171 ?auto_105177 ) ) ( not ( = ?auto_105172 ?auto_105173 ) ) ( not ( = ?auto_105172 ?auto_105174 ) ) ( not ( = ?auto_105172 ?auto_105175 ) ) ( not ( = ?auto_105172 ?auto_105176 ) ) ( not ( = ?auto_105172 ?auto_105177 ) ) ( not ( = ?auto_105173 ?auto_105174 ) ) ( not ( = ?auto_105173 ?auto_105175 ) ) ( not ( = ?auto_105173 ?auto_105176 ) ) ( not ( = ?auto_105173 ?auto_105177 ) ) ( not ( = ?auto_105174 ?auto_105175 ) ) ( not ( = ?auto_105174 ?auto_105176 ) ) ( not ( = ?auto_105174 ?auto_105177 ) ) ( not ( = ?auto_105175 ?auto_105176 ) ) ( not ( = ?auto_105175 ?auto_105177 ) ) ( not ( = ?auto_105176 ?auto_105177 ) ) ( ON ?auto_105177 ?auto_105178 ) ( not ( = ?auto_105171 ?auto_105178 ) ) ( not ( = ?auto_105172 ?auto_105178 ) ) ( not ( = ?auto_105173 ?auto_105178 ) ) ( not ( = ?auto_105174 ?auto_105178 ) ) ( not ( = ?auto_105175 ?auto_105178 ) ) ( not ( = ?auto_105176 ?auto_105178 ) ) ( not ( = ?auto_105177 ?auto_105178 ) ) ( ON ?auto_105176 ?auto_105177 ) ( ON-TABLE ?auto_105178 ) ( ON ?auto_105175 ?auto_105176 ) ( ON ?auto_105174 ?auto_105175 ) ( ON ?auto_105173 ?auto_105174 ) ( CLEAR ?auto_105171 ) ( ON ?auto_105172 ?auto_105173 ) ( CLEAR ?auto_105172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105178 ?auto_105177 ?auto_105176 ?auto_105175 ?auto_105174 ?auto_105173 )
      ( MAKE-6PILE ?auto_105171 ?auto_105172 ?auto_105173 ?auto_105174 ?auto_105175 ?auto_105176 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105179 - BLOCK
      ?auto_105180 - BLOCK
      ?auto_105181 - BLOCK
      ?auto_105182 - BLOCK
      ?auto_105183 - BLOCK
      ?auto_105184 - BLOCK
    )
    :vars
    (
      ?auto_105185 - BLOCK
      ?auto_105186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105179 ?auto_105180 ) ) ( not ( = ?auto_105179 ?auto_105181 ) ) ( not ( = ?auto_105179 ?auto_105182 ) ) ( not ( = ?auto_105179 ?auto_105183 ) ) ( not ( = ?auto_105179 ?auto_105184 ) ) ( not ( = ?auto_105179 ?auto_105185 ) ) ( not ( = ?auto_105180 ?auto_105181 ) ) ( not ( = ?auto_105180 ?auto_105182 ) ) ( not ( = ?auto_105180 ?auto_105183 ) ) ( not ( = ?auto_105180 ?auto_105184 ) ) ( not ( = ?auto_105180 ?auto_105185 ) ) ( not ( = ?auto_105181 ?auto_105182 ) ) ( not ( = ?auto_105181 ?auto_105183 ) ) ( not ( = ?auto_105181 ?auto_105184 ) ) ( not ( = ?auto_105181 ?auto_105185 ) ) ( not ( = ?auto_105182 ?auto_105183 ) ) ( not ( = ?auto_105182 ?auto_105184 ) ) ( not ( = ?auto_105182 ?auto_105185 ) ) ( not ( = ?auto_105183 ?auto_105184 ) ) ( not ( = ?auto_105183 ?auto_105185 ) ) ( not ( = ?auto_105184 ?auto_105185 ) ) ( ON ?auto_105185 ?auto_105186 ) ( not ( = ?auto_105179 ?auto_105186 ) ) ( not ( = ?auto_105180 ?auto_105186 ) ) ( not ( = ?auto_105181 ?auto_105186 ) ) ( not ( = ?auto_105182 ?auto_105186 ) ) ( not ( = ?auto_105183 ?auto_105186 ) ) ( not ( = ?auto_105184 ?auto_105186 ) ) ( not ( = ?auto_105185 ?auto_105186 ) ) ( ON ?auto_105184 ?auto_105185 ) ( ON-TABLE ?auto_105186 ) ( ON ?auto_105183 ?auto_105184 ) ( ON ?auto_105182 ?auto_105183 ) ( ON ?auto_105181 ?auto_105182 ) ( ON ?auto_105180 ?auto_105181 ) ( CLEAR ?auto_105180 ) ( HOLDING ?auto_105179 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105179 )
      ( MAKE-6PILE ?auto_105179 ?auto_105180 ?auto_105181 ?auto_105182 ?auto_105183 ?auto_105184 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_105187 - BLOCK
      ?auto_105188 - BLOCK
      ?auto_105189 - BLOCK
      ?auto_105190 - BLOCK
      ?auto_105191 - BLOCK
      ?auto_105192 - BLOCK
    )
    :vars
    (
      ?auto_105193 - BLOCK
      ?auto_105194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105187 ?auto_105188 ) ) ( not ( = ?auto_105187 ?auto_105189 ) ) ( not ( = ?auto_105187 ?auto_105190 ) ) ( not ( = ?auto_105187 ?auto_105191 ) ) ( not ( = ?auto_105187 ?auto_105192 ) ) ( not ( = ?auto_105187 ?auto_105193 ) ) ( not ( = ?auto_105188 ?auto_105189 ) ) ( not ( = ?auto_105188 ?auto_105190 ) ) ( not ( = ?auto_105188 ?auto_105191 ) ) ( not ( = ?auto_105188 ?auto_105192 ) ) ( not ( = ?auto_105188 ?auto_105193 ) ) ( not ( = ?auto_105189 ?auto_105190 ) ) ( not ( = ?auto_105189 ?auto_105191 ) ) ( not ( = ?auto_105189 ?auto_105192 ) ) ( not ( = ?auto_105189 ?auto_105193 ) ) ( not ( = ?auto_105190 ?auto_105191 ) ) ( not ( = ?auto_105190 ?auto_105192 ) ) ( not ( = ?auto_105190 ?auto_105193 ) ) ( not ( = ?auto_105191 ?auto_105192 ) ) ( not ( = ?auto_105191 ?auto_105193 ) ) ( not ( = ?auto_105192 ?auto_105193 ) ) ( ON ?auto_105193 ?auto_105194 ) ( not ( = ?auto_105187 ?auto_105194 ) ) ( not ( = ?auto_105188 ?auto_105194 ) ) ( not ( = ?auto_105189 ?auto_105194 ) ) ( not ( = ?auto_105190 ?auto_105194 ) ) ( not ( = ?auto_105191 ?auto_105194 ) ) ( not ( = ?auto_105192 ?auto_105194 ) ) ( not ( = ?auto_105193 ?auto_105194 ) ) ( ON ?auto_105192 ?auto_105193 ) ( ON-TABLE ?auto_105194 ) ( ON ?auto_105191 ?auto_105192 ) ( ON ?auto_105190 ?auto_105191 ) ( ON ?auto_105189 ?auto_105190 ) ( ON ?auto_105188 ?auto_105189 ) ( ON ?auto_105187 ?auto_105188 ) ( CLEAR ?auto_105187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105194 ?auto_105193 ?auto_105192 ?auto_105191 ?auto_105190 ?auto_105189 ?auto_105188 )
      ( MAKE-6PILE ?auto_105187 ?auto_105188 ?auto_105189 ?auto_105190 ?auto_105191 ?auto_105192 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105196 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_105196 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_105196 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105197 - BLOCK
    )
    :vars
    (
      ?auto_105198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105197 ?auto_105198 ) ( CLEAR ?auto_105197 ) ( HAND-EMPTY ) ( not ( = ?auto_105197 ?auto_105198 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105197 ?auto_105198 )
      ( MAKE-1PILE ?auto_105197 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105199 - BLOCK
    )
    :vars
    (
      ?auto_105200 - BLOCK
      ?auto_105202 - BLOCK
      ?auto_105201 - BLOCK
      ?auto_105205 - BLOCK
      ?auto_105203 - BLOCK
      ?auto_105204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105199 ?auto_105200 ) ) ( HOLDING ?auto_105199 ) ( CLEAR ?auto_105200 ) ( ON-TABLE ?auto_105202 ) ( ON ?auto_105201 ?auto_105202 ) ( ON ?auto_105205 ?auto_105201 ) ( ON ?auto_105203 ?auto_105205 ) ( ON ?auto_105204 ?auto_105203 ) ( ON ?auto_105200 ?auto_105204 ) ( not ( = ?auto_105202 ?auto_105201 ) ) ( not ( = ?auto_105202 ?auto_105205 ) ) ( not ( = ?auto_105202 ?auto_105203 ) ) ( not ( = ?auto_105202 ?auto_105204 ) ) ( not ( = ?auto_105202 ?auto_105200 ) ) ( not ( = ?auto_105202 ?auto_105199 ) ) ( not ( = ?auto_105201 ?auto_105205 ) ) ( not ( = ?auto_105201 ?auto_105203 ) ) ( not ( = ?auto_105201 ?auto_105204 ) ) ( not ( = ?auto_105201 ?auto_105200 ) ) ( not ( = ?auto_105201 ?auto_105199 ) ) ( not ( = ?auto_105205 ?auto_105203 ) ) ( not ( = ?auto_105205 ?auto_105204 ) ) ( not ( = ?auto_105205 ?auto_105200 ) ) ( not ( = ?auto_105205 ?auto_105199 ) ) ( not ( = ?auto_105203 ?auto_105204 ) ) ( not ( = ?auto_105203 ?auto_105200 ) ) ( not ( = ?auto_105203 ?auto_105199 ) ) ( not ( = ?auto_105204 ?auto_105200 ) ) ( not ( = ?auto_105204 ?auto_105199 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105202 ?auto_105201 ?auto_105205 ?auto_105203 ?auto_105204 ?auto_105200 ?auto_105199 )
      ( MAKE-1PILE ?auto_105199 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105206 - BLOCK
    )
    :vars
    (
      ?auto_105208 - BLOCK
      ?auto_105210 - BLOCK
      ?auto_105207 - BLOCK
      ?auto_105209 - BLOCK
      ?auto_105211 - BLOCK
      ?auto_105212 - BLOCK
      ?auto_105213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105206 ?auto_105208 ) ) ( CLEAR ?auto_105208 ) ( ON-TABLE ?auto_105210 ) ( ON ?auto_105207 ?auto_105210 ) ( ON ?auto_105209 ?auto_105207 ) ( ON ?auto_105211 ?auto_105209 ) ( ON ?auto_105212 ?auto_105211 ) ( ON ?auto_105208 ?auto_105212 ) ( not ( = ?auto_105210 ?auto_105207 ) ) ( not ( = ?auto_105210 ?auto_105209 ) ) ( not ( = ?auto_105210 ?auto_105211 ) ) ( not ( = ?auto_105210 ?auto_105212 ) ) ( not ( = ?auto_105210 ?auto_105208 ) ) ( not ( = ?auto_105210 ?auto_105206 ) ) ( not ( = ?auto_105207 ?auto_105209 ) ) ( not ( = ?auto_105207 ?auto_105211 ) ) ( not ( = ?auto_105207 ?auto_105212 ) ) ( not ( = ?auto_105207 ?auto_105208 ) ) ( not ( = ?auto_105207 ?auto_105206 ) ) ( not ( = ?auto_105209 ?auto_105211 ) ) ( not ( = ?auto_105209 ?auto_105212 ) ) ( not ( = ?auto_105209 ?auto_105208 ) ) ( not ( = ?auto_105209 ?auto_105206 ) ) ( not ( = ?auto_105211 ?auto_105212 ) ) ( not ( = ?auto_105211 ?auto_105208 ) ) ( not ( = ?auto_105211 ?auto_105206 ) ) ( not ( = ?auto_105212 ?auto_105208 ) ) ( not ( = ?auto_105212 ?auto_105206 ) ) ( ON ?auto_105206 ?auto_105213 ) ( CLEAR ?auto_105206 ) ( HAND-EMPTY ) ( not ( = ?auto_105206 ?auto_105213 ) ) ( not ( = ?auto_105208 ?auto_105213 ) ) ( not ( = ?auto_105210 ?auto_105213 ) ) ( not ( = ?auto_105207 ?auto_105213 ) ) ( not ( = ?auto_105209 ?auto_105213 ) ) ( not ( = ?auto_105211 ?auto_105213 ) ) ( not ( = ?auto_105212 ?auto_105213 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105206 ?auto_105213 )
      ( MAKE-1PILE ?auto_105206 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105214 - BLOCK
    )
    :vars
    (
      ?auto_105218 - BLOCK
      ?auto_105219 - BLOCK
      ?auto_105221 - BLOCK
      ?auto_105217 - BLOCK
      ?auto_105220 - BLOCK
      ?auto_105215 - BLOCK
      ?auto_105216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105214 ?auto_105218 ) ) ( ON-TABLE ?auto_105219 ) ( ON ?auto_105221 ?auto_105219 ) ( ON ?auto_105217 ?auto_105221 ) ( ON ?auto_105220 ?auto_105217 ) ( ON ?auto_105215 ?auto_105220 ) ( not ( = ?auto_105219 ?auto_105221 ) ) ( not ( = ?auto_105219 ?auto_105217 ) ) ( not ( = ?auto_105219 ?auto_105220 ) ) ( not ( = ?auto_105219 ?auto_105215 ) ) ( not ( = ?auto_105219 ?auto_105218 ) ) ( not ( = ?auto_105219 ?auto_105214 ) ) ( not ( = ?auto_105221 ?auto_105217 ) ) ( not ( = ?auto_105221 ?auto_105220 ) ) ( not ( = ?auto_105221 ?auto_105215 ) ) ( not ( = ?auto_105221 ?auto_105218 ) ) ( not ( = ?auto_105221 ?auto_105214 ) ) ( not ( = ?auto_105217 ?auto_105220 ) ) ( not ( = ?auto_105217 ?auto_105215 ) ) ( not ( = ?auto_105217 ?auto_105218 ) ) ( not ( = ?auto_105217 ?auto_105214 ) ) ( not ( = ?auto_105220 ?auto_105215 ) ) ( not ( = ?auto_105220 ?auto_105218 ) ) ( not ( = ?auto_105220 ?auto_105214 ) ) ( not ( = ?auto_105215 ?auto_105218 ) ) ( not ( = ?auto_105215 ?auto_105214 ) ) ( ON ?auto_105214 ?auto_105216 ) ( CLEAR ?auto_105214 ) ( not ( = ?auto_105214 ?auto_105216 ) ) ( not ( = ?auto_105218 ?auto_105216 ) ) ( not ( = ?auto_105219 ?auto_105216 ) ) ( not ( = ?auto_105221 ?auto_105216 ) ) ( not ( = ?auto_105217 ?auto_105216 ) ) ( not ( = ?auto_105220 ?auto_105216 ) ) ( not ( = ?auto_105215 ?auto_105216 ) ) ( HOLDING ?auto_105218 ) ( CLEAR ?auto_105215 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105219 ?auto_105221 ?auto_105217 ?auto_105220 ?auto_105215 ?auto_105218 )
      ( MAKE-1PILE ?auto_105214 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105222 - BLOCK
    )
    :vars
    (
      ?auto_105223 - BLOCK
      ?auto_105229 - BLOCK
      ?auto_105224 - BLOCK
      ?auto_105228 - BLOCK
      ?auto_105227 - BLOCK
      ?auto_105225 - BLOCK
      ?auto_105226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105222 ?auto_105223 ) ) ( ON-TABLE ?auto_105229 ) ( ON ?auto_105224 ?auto_105229 ) ( ON ?auto_105228 ?auto_105224 ) ( ON ?auto_105227 ?auto_105228 ) ( ON ?auto_105225 ?auto_105227 ) ( not ( = ?auto_105229 ?auto_105224 ) ) ( not ( = ?auto_105229 ?auto_105228 ) ) ( not ( = ?auto_105229 ?auto_105227 ) ) ( not ( = ?auto_105229 ?auto_105225 ) ) ( not ( = ?auto_105229 ?auto_105223 ) ) ( not ( = ?auto_105229 ?auto_105222 ) ) ( not ( = ?auto_105224 ?auto_105228 ) ) ( not ( = ?auto_105224 ?auto_105227 ) ) ( not ( = ?auto_105224 ?auto_105225 ) ) ( not ( = ?auto_105224 ?auto_105223 ) ) ( not ( = ?auto_105224 ?auto_105222 ) ) ( not ( = ?auto_105228 ?auto_105227 ) ) ( not ( = ?auto_105228 ?auto_105225 ) ) ( not ( = ?auto_105228 ?auto_105223 ) ) ( not ( = ?auto_105228 ?auto_105222 ) ) ( not ( = ?auto_105227 ?auto_105225 ) ) ( not ( = ?auto_105227 ?auto_105223 ) ) ( not ( = ?auto_105227 ?auto_105222 ) ) ( not ( = ?auto_105225 ?auto_105223 ) ) ( not ( = ?auto_105225 ?auto_105222 ) ) ( ON ?auto_105222 ?auto_105226 ) ( not ( = ?auto_105222 ?auto_105226 ) ) ( not ( = ?auto_105223 ?auto_105226 ) ) ( not ( = ?auto_105229 ?auto_105226 ) ) ( not ( = ?auto_105224 ?auto_105226 ) ) ( not ( = ?auto_105228 ?auto_105226 ) ) ( not ( = ?auto_105227 ?auto_105226 ) ) ( not ( = ?auto_105225 ?auto_105226 ) ) ( CLEAR ?auto_105225 ) ( ON ?auto_105223 ?auto_105222 ) ( CLEAR ?auto_105223 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105226 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105226 ?auto_105222 )
      ( MAKE-1PILE ?auto_105222 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105230 - BLOCK
    )
    :vars
    (
      ?auto_105233 - BLOCK
      ?auto_105235 - BLOCK
      ?auto_105234 - BLOCK
      ?auto_105231 - BLOCK
      ?auto_105237 - BLOCK
      ?auto_105236 - BLOCK
      ?auto_105232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105230 ?auto_105233 ) ) ( ON-TABLE ?auto_105235 ) ( ON ?auto_105234 ?auto_105235 ) ( ON ?auto_105231 ?auto_105234 ) ( ON ?auto_105237 ?auto_105231 ) ( not ( = ?auto_105235 ?auto_105234 ) ) ( not ( = ?auto_105235 ?auto_105231 ) ) ( not ( = ?auto_105235 ?auto_105237 ) ) ( not ( = ?auto_105235 ?auto_105236 ) ) ( not ( = ?auto_105235 ?auto_105233 ) ) ( not ( = ?auto_105235 ?auto_105230 ) ) ( not ( = ?auto_105234 ?auto_105231 ) ) ( not ( = ?auto_105234 ?auto_105237 ) ) ( not ( = ?auto_105234 ?auto_105236 ) ) ( not ( = ?auto_105234 ?auto_105233 ) ) ( not ( = ?auto_105234 ?auto_105230 ) ) ( not ( = ?auto_105231 ?auto_105237 ) ) ( not ( = ?auto_105231 ?auto_105236 ) ) ( not ( = ?auto_105231 ?auto_105233 ) ) ( not ( = ?auto_105231 ?auto_105230 ) ) ( not ( = ?auto_105237 ?auto_105236 ) ) ( not ( = ?auto_105237 ?auto_105233 ) ) ( not ( = ?auto_105237 ?auto_105230 ) ) ( not ( = ?auto_105236 ?auto_105233 ) ) ( not ( = ?auto_105236 ?auto_105230 ) ) ( ON ?auto_105230 ?auto_105232 ) ( not ( = ?auto_105230 ?auto_105232 ) ) ( not ( = ?auto_105233 ?auto_105232 ) ) ( not ( = ?auto_105235 ?auto_105232 ) ) ( not ( = ?auto_105234 ?auto_105232 ) ) ( not ( = ?auto_105231 ?auto_105232 ) ) ( not ( = ?auto_105237 ?auto_105232 ) ) ( not ( = ?auto_105236 ?auto_105232 ) ) ( ON ?auto_105233 ?auto_105230 ) ( CLEAR ?auto_105233 ) ( ON-TABLE ?auto_105232 ) ( HOLDING ?auto_105236 ) ( CLEAR ?auto_105237 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105235 ?auto_105234 ?auto_105231 ?auto_105237 ?auto_105236 )
      ( MAKE-1PILE ?auto_105230 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105238 - BLOCK
    )
    :vars
    (
      ?auto_105241 - BLOCK
      ?auto_105240 - BLOCK
      ?auto_105243 - BLOCK
      ?auto_105245 - BLOCK
      ?auto_105244 - BLOCK
      ?auto_105242 - BLOCK
      ?auto_105239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105238 ?auto_105241 ) ) ( ON-TABLE ?auto_105240 ) ( ON ?auto_105243 ?auto_105240 ) ( ON ?auto_105245 ?auto_105243 ) ( ON ?auto_105244 ?auto_105245 ) ( not ( = ?auto_105240 ?auto_105243 ) ) ( not ( = ?auto_105240 ?auto_105245 ) ) ( not ( = ?auto_105240 ?auto_105244 ) ) ( not ( = ?auto_105240 ?auto_105242 ) ) ( not ( = ?auto_105240 ?auto_105241 ) ) ( not ( = ?auto_105240 ?auto_105238 ) ) ( not ( = ?auto_105243 ?auto_105245 ) ) ( not ( = ?auto_105243 ?auto_105244 ) ) ( not ( = ?auto_105243 ?auto_105242 ) ) ( not ( = ?auto_105243 ?auto_105241 ) ) ( not ( = ?auto_105243 ?auto_105238 ) ) ( not ( = ?auto_105245 ?auto_105244 ) ) ( not ( = ?auto_105245 ?auto_105242 ) ) ( not ( = ?auto_105245 ?auto_105241 ) ) ( not ( = ?auto_105245 ?auto_105238 ) ) ( not ( = ?auto_105244 ?auto_105242 ) ) ( not ( = ?auto_105244 ?auto_105241 ) ) ( not ( = ?auto_105244 ?auto_105238 ) ) ( not ( = ?auto_105242 ?auto_105241 ) ) ( not ( = ?auto_105242 ?auto_105238 ) ) ( ON ?auto_105238 ?auto_105239 ) ( not ( = ?auto_105238 ?auto_105239 ) ) ( not ( = ?auto_105241 ?auto_105239 ) ) ( not ( = ?auto_105240 ?auto_105239 ) ) ( not ( = ?auto_105243 ?auto_105239 ) ) ( not ( = ?auto_105245 ?auto_105239 ) ) ( not ( = ?auto_105244 ?auto_105239 ) ) ( not ( = ?auto_105242 ?auto_105239 ) ) ( ON ?auto_105241 ?auto_105238 ) ( ON-TABLE ?auto_105239 ) ( CLEAR ?auto_105244 ) ( ON ?auto_105242 ?auto_105241 ) ( CLEAR ?auto_105242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105239 ?auto_105238 ?auto_105241 )
      ( MAKE-1PILE ?auto_105238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105246 - BLOCK
    )
    :vars
    (
      ?auto_105247 - BLOCK
      ?auto_105250 - BLOCK
      ?auto_105252 - BLOCK
      ?auto_105251 - BLOCK
      ?auto_105253 - BLOCK
      ?auto_105248 - BLOCK
      ?auto_105249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105246 ?auto_105247 ) ) ( ON-TABLE ?auto_105250 ) ( ON ?auto_105252 ?auto_105250 ) ( ON ?auto_105251 ?auto_105252 ) ( not ( = ?auto_105250 ?auto_105252 ) ) ( not ( = ?auto_105250 ?auto_105251 ) ) ( not ( = ?auto_105250 ?auto_105253 ) ) ( not ( = ?auto_105250 ?auto_105248 ) ) ( not ( = ?auto_105250 ?auto_105247 ) ) ( not ( = ?auto_105250 ?auto_105246 ) ) ( not ( = ?auto_105252 ?auto_105251 ) ) ( not ( = ?auto_105252 ?auto_105253 ) ) ( not ( = ?auto_105252 ?auto_105248 ) ) ( not ( = ?auto_105252 ?auto_105247 ) ) ( not ( = ?auto_105252 ?auto_105246 ) ) ( not ( = ?auto_105251 ?auto_105253 ) ) ( not ( = ?auto_105251 ?auto_105248 ) ) ( not ( = ?auto_105251 ?auto_105247 ) ) ( not ( = ?auto_105251 ?auto_105246 ) ) ( not ( = ?auto_105253 ?auto_105248 ) ) ( not ( = ?auto_105253 ?auto_105247 ) ) ( not ( = ?auto_105253 ?auto_105246 ) ) ( not ( = ?auto_105248 ?auto_105247 ) ) ( not ( = ?auto_105248 ?auto_105246 ) ) ( ON ?auto_105246 ?auto_105249 ) ( not ( = ?auto_105246 ?auto_105249 ) ) ( not ( = ?auto_105247 ?auto_105249 ) ) ( not ( = ?auto_105250 ?auto_105249 ) ) ( not ( = ?auto_105252 ?auto_105249 ) ) ( not ( = ?auto_105251 ?auto_105249 ) ) ( not ( = ?auto_105253 ?auto_105249 ) ) ( not ( = ?auto_105248 ?auto_105249 ) ) ( ON ?auto_105247 ?auto_105246 ) ( ON-TABLE ?auto_105249 ) ( ON ?auto_105248 ?auto_105247 ) ( CLEAR ?auto_105248 ) ( HOLDING ?auto_105253 ) ( CLEAR ?auto_105251 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105250 ?auto_105252 ?auto_105251 ?auto_105253 )
      ( MAKE-1PILE ?auto_105246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105254 - BLOCK
    )
    :vars
    (
      ?auto_105259 - BLOCK
      ?auto_105257 - BLOCK
      ?auto_105255 - BLOCK
      ?auto_105260 - BLOCK
      ?auto_105256 - BLOCK
      ?auto_105261 - BLOCK
      ?auto_105258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105254 ?auto_105259 ) ) ( ON-TABLE ?auto_105257 ) ( ON ?auto_105255 ?auto_105257 ) ( ON ?auto_105260 ?auto_105255 ) ( not ( = ?auto_105257 ?auto_105255 ) ) ( not ( = ?auto_105257 ?auto_105260 ) ) ( not ( = ?auto_105257 ?auto_105256 ) ) ( not ( = ?auto_105257 ?auto_105261 ) ) ( not ( = ?auto_105257 ?auto_105259 ) ) ( not ( = ?auto_105257 ?auto_105254 ) ) ( not ( = ?auto_105255 ?auto_105260 ) ) ( not ( = ?auto_105255 ?auto_105256 ) ) ( not ( = ?auto_105255 ?auto_105261 ) ) ( not ( = ?auto_105255 ?auto_105259 ) ) ( not ( = ?auto_105255 ?auto_105254 ) ) ( not ( = ?auto_105260 ?auto_105256 ) ) ( not ( = ?auto_105260 ?auto_105261 ) ) ( not ( = ?auto_105260 ?auto_105259 ) ) ( not ( = ?auto_105260 ?auto_105254 ) ) ( not ( = ?auto_105256 ?auto_105261 ) ) ( not ( = ?auto_105256 ?auto_105259 ) ) ( not ( = ?auto_105256 ?auto_105254 ) ) ( not ( = ?auto_105261 ?auto_105259 ) ) ( not ( = ?auto_105261 ?auto_105254 ) ) ( ON ?auto_105254 ?auto_105258 ) ( not ( = ?auto_105254 ?auto_105258 ) ) ( not ( = ?auto_105259 ?auto_105258 ) ) ( not ( = ?auto_105257 ?auto_105258 ) ) ( not ( = ?auto_105255 ?auto_105258 ) ) ( not ( = ?auto_105260 ?auto_105258 ) ) ( not ( = ?auto_105256 ?auto_105258 ) ) ( not ( = ?auto_105261 ?auto_105258 ) ) ( ON ?auto_105259 ?auto_105254 ) ( ON-TABLE ?auto_105258 ) ( ON ?auto_105261 ?auto_105259 ) ( CLEAR ?auto_105260 ) ( ON ?auto_105256 ?auto_105261 ) ( CLEAR ?auto_105256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105258 ?auto_105254 ?auto_105259 ?auto_105261 )
      ( MAKE-1PILE ?auto_105254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105262 - BLOCK
    )
    :vars
    (
      ?auto_105263 - BLOCK
      ?auto_105266 - BLOCK
      ?auto_105264 - BLOCK
      ?auto_105267 - BLOCK
      ?auto_105269 - BLOCK
      ?auto_105268 - BLOCK
      ?auto_105265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105262 ?auto_105263 ) ) ( ON-TABLE ?auto_105266 ) ( ON ?auto_105264 ?auto_105266 ) ( not ( = ?auto_105266 ?auto_105264 ) ) ( not ( = ?auto_105266 ?auto_105267 ) ) ( not ( = ?auto_105266 ?auto_105269 ) ) ( not ( = ?auto_105266 ?auto_105268 ) ) ( not ( = ?auto_105266 ?auto_105263 ) ) ( not ( = ?auto_105266 ?auto_105262 ) ) ( not ( = ?auto_105264 ?auto_105267 ) ) ( not ( = ?auto_105264 ?auto_105269 ) ) ( not ( = ?auto_105264 ?auto_105268 ) ) ( not ( = ?auto_105264 ?auto_105263 ) ) ( not ( = ?auto_105264 ?auto_105262 ) ) ( not ( = ?auto_105267 ?auto_105269 ) ) ( not ( = ?auto_105267 ?auto_105268 ) ) ( not ( = ?auto_105267 ?auto_105263 ) ) ( not ( = ?auto_105267 ?auto_105262 ) ) ( not ( = ?auto_105269 ?auto_105268 ) ) ( not ( = ?auto_105269 ?auto_105263 ) ) ( not ( = ?auto_105269 ?auto_105262 ) ) ( not ( = ?auto_105268 ?auto_105263 ) ) ( not ( = ?auto_105268 ?auto_105262 ) ) ( ON ?auto_105262 ?auto_105265 ) ( not ( = ?auto_105262 ?auto_105265 ) ) ( not ( = ?auto_105263 ?auto_105265 ) ) ( not ( = ?auto_105266 ?auto_105265 ) ) ( not ( = ?auto_105264 ?auto_105265 ) ) ( not ( = ?auto_105267 ?auto_105265 ) ) ( not ( = ?auto_105269 ?auto_105265 ) ) ( not ( = ?auto_105268 ?auto_105265 ) ) ( ON ?auto_105263 ?auto_105262 ) ( ON-TABLE ?auto_105265 ) ( ON ?auto_105268 ?auto_105263 ) ( ON ?auto_105269 ?auto_105268 ) ( CLEAR ?auto_105269 ) ( HOLDING ?auto_105267 ) ( CLEAR ?auto_105264 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105266 ?auto_105264 ?auto_105267 )
      ( MAKE-1PILE ?auto_105262 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105270 - BLOCK
    )
    :vars
    (
      ?auto_105274 - BLOCK
      ?auto_105271 - BLOCK
      ?auto_105272 - BLOCK
      ?auto_105277 - BLOCK
      ?auto_105275 - BLOCK
      ?auto_105273 - BLOCK
      ?auto_105276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105270 ?auto_105274 ) ) ( ON-TABLE ?auto_105271 ) ( ON ?auto_105272 ?auto_105271 ) ( not ( = ?auto_105271 ?auto_105272 ) ) ( not ( = ?auto_105271 ?auto_105277 ) ) ( not ( = ?auto_105271 ?auto_105275 ) ) ( not ( = ?auto_105271 ?auto_105273 ) ) ( not ( = ?auto_105271 ?auto_105274 ) ) ( not ( = ?auto_105271 ?auto_105270 ) ) ( not ( = ?auto_105272 ?auto_105277 ) ) ( not ( = ?auto_105272 ?auto_105275 ) ) ( not ( = ?auto_105272 ?auto_105273 ) ) ( not ( = ?auto_105272 ?auto_105274 ) ) ( not ( = ?auto_105272 ?auto_105270 ) ) ( not ( = ?auto_105277 ?auto_105275 ) ) ( not ( = ?auto_105277 ?auto_105273 ) ) ( not ( = ?auto_105277 ?auto_105274 ) ) ( not ( = ?auto_105277 ?auto_105270 ) ) ( not ( = ?auto_105275 ?auto_105273 ) ) ( not ( = ?auto_105275 ?auto_105274 ) ) ( not ( = ?auto_105275 ?auto_105270 ) ) ( not ( = ?auto_105273 ?auto_105274 ) ) ( not ( = ?auto_105273 ?auto_105270 ) ) ( ON ?auto_105270 ?auto_105276 ) ( not ( = ?auto_105270 ?auto_105276 ) ) ( not ( = ?auto_105274 ?auto_105276 ) ) ( not ( = ?auto_105271 ?auto_105276 ) ) ( not ( = ?auto_105272 ?auto_105276 ) ) ( not ( = ?auto_105277 ?auto_105276 ) ) ( not ( = ?auto_105275 ?auto_105276 ) ) ( not ( = ?auto_105273 ?auto_105276 ) ) ( ON ?auto_105274 ?auto_105270 ) ( ON-TABLE ?auto_105276 ) ( ON ?auto_105273 ?auto_105274 ) ( ON ?auto_105275 ?auto_105273 ) ( CLEAR ?auto_105272 ) ( ON ?auto_105277 ?auto_105275 ) ( CLEAR ?auto_105277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105276 ?auto_105270 ?auto_105274 ?auto_105273 ?auto_105275 )
      ( MAKE-1PILE ?auto_105270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105278 - BLOCK
    )
    :vars
    (
      ?auto_105283 - BLOCK
      ?auto_105285 - BLOCK
      ?auto_105280 - BLOCK
      ?auto_105279 - BLOCK
      ?auto_105282 - BLOCK
      ?auto_105281 - BLOCK
      ?auto_105284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105278 ?auto_105283 ) ) ( ON-TABLE ?auto_105285 ) ( not ( = ?auto_105285 ?auto_105280 ) ) ( not ( = ?auto_105285 ?auto_105279 ) ) ( not ( = ?auto_105285 ?auto_105282 ) ) ( not ( = ?auto_105285 ?auto_105281 ) ) ( not ( = ?auto_105285 ?auto_105283 ) ) ( not ( = ?auto_105285 ?auto_105278 ) ) ( not ( = ?auto_105280 ?auto_105279 ) ) ( not ( = ?auto_105280 ?auto_105282 ) ) ( not ( = ?auto_105280 ?auto_105281 ) ) ( not ( = ?auto_105280 ?auto_105283 ) ) ( not ( = ?auto_105280 ?auto_105278 ) ) ( not ( = ?auto_105279 ?auto_105282 ) ) ( not ( = ?auto_105279 ?auto_105281 ) ) ( not ( = ?auto_105279 ?auto_105283 ) ) ( not ( = ?auto_105279 ?auto_105278 ) ) ( not ( = ?auto_105282 ?auto_105281 ) ) ( not ( = ?auto_105282 ?auto_105283 ) ) ( not ( = ?auto_105282 ?auto_105278 ) ) ( not ( = ?auto_105281 ?auto_105283 ) ) ( not ( = ?auto_105281 ?auto_105278 ) ) ( ON ?auto_105278 ?auto_105284 ) ( not ( = ?auto_105278 ?auto_105284 ) ) ( not ( = ?auto_105283 ?auto_105284 ) ) ( not ( = ?auto_105285 ?auto_105284 ) ) ( not ( = ?auto_105280 ?auto_105284 ) ) ( not ( = ?auto_105279 ?auto_105284 ) ) ( not ( = ?auto_105282 ?auto_105284 ) ) ( not ( = ?auto_105281 ?auto_105284 ) ) ( ON ?auto_105283 ?auto_105278 ) ( ON-TABLE ?auto_105284 ) ( ON ?auto_105281 ?auto_105283 ) ( ON ?auto_105282 ?auto_105281 ) ( ON ?auto_105279 ?auto_105282 ) ( CLEAR ?auto_105279 ) ( HOLDING ?auto_105280 ) ( CLEAR ?auto_105285 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105285 ?auto_105280 )
      ( MAKE-1PILE ?auto_105278 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105286 - BLOCK
    )
    :vars
    (
      ?auto_105292 - BLOCK
      ?auto_105290 - BLOCK
      ?auto_105289 - BLOCK
      ?auto_105293 - BLOCK
      ?auto_105291 - BLOCK
      ?auto_105288 - BLOCK
      ?auto_105287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105286 ?auto_105292 ) ) ( ON-TABLE ?auto_105290 ) ( not ( = ?auto_105290 ?auto_105289 ) ) ( not ( = ?auto_105290 ?auto_105293 ) ) ( not ( = ?auto_105290 ?auto_105291 ) ) ( not ( = ?auto_105290 ?auto_105288 ) ) ( not ( = ?auto_105290 ?auto_105292 ) ) ( not ( = ?auto_105290 ?auto_105286 ) ) ( not ( = ?auto_105289 ?auto_105293 ) ) ( not ( = ?auto_105289 ?auto_105291 ) ) ( not ( = ?auto_105289 ?auto_105288 ) ) ( not ( = ?auto_105289 ?auto_105292 ) ) ( not ( = ?auto_105289 ?auto_105286 ) ) ( not ( = ?auto_105293 ?auto_105291 ) ) ( not ( = ?auto_105293 ?auto_105288 ) ) ( not ( = ?auto_105293 ?auto_105292 ) ) ( not ( = ?auto_105293 ?auto_105286 ) ) ( not ( = ?auto_105291 ?auto_105288 ) ) ( not ( = ?auto_105291 ?auto_105292 ) ) ( not ( = ?auto_105291 ?auto_105286 ) ) ( not ( = ?auto_105288 ?auto_105292 ) ) ( not ( = ?auto_105288 ?auto_105286 ) ) ( ON ?auto_105286 ?auto_105287 ) ( not ( = ?auto_105286 ?auto_105287 ) ) ( not ( = ?auto_105292 ?auto_105287 ) ) ( not ( = ?auto_105290 ?auto_105287 ) ) ( not ( = ?auto_105289 ?auto_105287 ) ) ( not ( = ?auto_105293 ?auto_105287 ) ) ( not ( = ?auto_105291 ?auto_105287 ) ) ( not ( = ?auto_105288 ?auto_105287 ) ) ( ON ?auto_105292 ?auto_105286 ) ( ON-TABLE ?auto_105287 ) ( ON ?auto_105288 ?auto_105292 ) ( ON ?auto_105291 ?auto_105288 ) ( ON ?auto_105293 ?auto_105291 ) ( CLEAR ?auto_105290 ) ( ON ?auto_105289 ?auto_105293 ) ( CLEAR ?auto_105289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105287 ?auto_105286 ?auto_105292 ?auto_105288 ?auto_105291 ?auto_105293 )
      ( MAKE-1PILE ?auto_105286 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105294 - BLOCK
    )
    :vars
    (
      ?auto_105298 - BLOCK
      ?auto_105296 - BLOCK
      ?auto_105299 - BLOCK
      ?auto_105301 - BLOCK
      ?auto_105300 - BLOCK
      ?auto_105297 - BLOCK
      ?auto_105295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105294 ?auto_105298 ) ) ( not ( = ?auto_105296 ?auto_105299 ) ) ( not ( = ?auto_105296 ?auto_105301 ) ) ( not ( = ?auto_105296 ?auto_105300 ) ) ( not ( = ?auto_105296 ?auto_105297 ) ) ( not ( = ?auto_105296 ?auto_105298 ) ) ( not ( = ?auto_105296 ?auto_105294 ) ) ( not ( = ?auto_105299 ?auto_105301 ) ) ( not ( = ?auto_105299 ?auto_105300 ) ) ( not ( = ?auto_105299 ?auto_105297 ) ) ( not ( = ?auto_105299 ?auto_105298 ) ) ( not ( = ?auto_105299 ?auto_105294 ) ) ( not ( = ?auto_105301 ?auto_105300 ) ) ( not ( = ?auto_105301 ?auto_105297 ) ) ( not ( = ?auto_105301 ?auto_105298 ) ) ( not ( = ?auto_105301 ?auto_105294 ) ) ( not ( = ?auto_105300 ?auto_105297 ) ) ( not ( = ?auto_105300 ?auto_105298 ) ) ( not ( = ?auto_105300 ?auto_105294 ) ) ( not ( = ?auto_105297 ?auto_105298 ) ) ( not ( = ?auto_105297 ?auto_105294 ) ) ( ON ?auto_105294 ?auto_105295 ) ( not ( = ?auto_105294 ?auto_105295 ) ) ( not ( = ?auto_105298 ?auto_105295 ) ) ( not ( = ?auto_105296 ?auto_105295 ) ) ( not ( = ?auto_105299 ?auto_105295 ) ) ( not ( = ?auto_105301 ?auto_105295 ) ) ( not ( = ?auto_105300 ?auto_105295 ) ) ( not ( = ?auto_105297 ?auto_105295 ) ) ( ON ?auto_105298 ?auto_105294 ) ( ON-TABLE ?auto_105295 ) ( ON ?auto_105297 ?auto_105298 ) ( ON ?auto_105300 ?auto_105297 ) ( ON ?auto_105301 ?auto_105300 ) ( ON ?auto_105299 ?auto_105301 ) ( CLEAR ?auto_105299 ) ( HOLDING ?auto_105296 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105296 )
      ( MAKE-1PILE ?auto_105294 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_105302 - BLOCK
    )
    :vars
    (
      ?auto_105304 - BLOCK
      ?auto_105309 - BLOCK
      ?auto_105307 - BLOCK
      ?auto_105308 - BLOCK
      ?auto_105305 - BLOCK
      ?auto_105306 - BLOCK
      ?auto_105303 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105302 ?auto_105304 ) ) ( not ( = ?auto_105309 ?auto_105307 ) ) ( not ( = ?auto_105309 ?auto_105308 ) ) ( not ( = ?auto_105309 ?auto_105305 ) ) ( not ( = ?auto_105309 ?auto_105306 ) ) ( not ( = ?auto_105309 ?auto_105304 ) ) ( not ( = ?auto_105309 ?auto_105302 ) ) ( not ( = ?auto_105307 ?auto_105308 ) ) ( not ( = ?auto_105307 ?auto_105305 ) ) ( not ( = ?auto_105307 ?auto_105306 ) ) ( not ( = ?auto_105307 ?auto_105304 ) ) ( not ( = ?auto_105307 ?auto_105302 ) ) ( not ( = ?auto_105308 ?auto_105305 ) ) ( not ( = ?auto_105308 ?auto_105306 ) ) ( not ( = ?auto_105308 ?auto_105304 ) ) ( not ( = ?auto_105308 ?auto_105302 ) ) ( not ( = ?auto_105305 ?auto_105306 ) ) ( not ( = ?auto_105305 ?auto_105304 ) ) ( not ( = ?auto_105305 ?auto_105302 ) ) ( not ( = ?auto_105306 ?auto_105304 ) ) ( not ( = ?auto_105306 ?auto_105302 ) ) ( ON ?auto_105302 ?auto_105303 ) ( not ( = ?auto_105302 ?auto_105303 ) ) ( not ( = ?auto_105304 ?auto_105303 ) ) ( not ( = ?auto_105309 ?auto_105303 ) ) ( not ( = ?auto_105307 ?auto_105303 ) ) ( not ( = ?auto_105308 ?auto_105303 ) ) ( not ( = ?auto_105305 ?auto_105303 ) ) ( not ( = ?auto_105306 ?auto_105303 ) ) ( ON ?auto_105304 ?auto_105302 ) ( ON-TABLE ?auto_105303 ) ( ON ?auto_105306 ?auto_105304 ) ( ON ?auto_105305 ?auto_105306 ) ( ON ?auto_105308 ?auto_105305 ) ( ON ?auto_105307 ?auto_105308 ) ( ON ?auto_105309 ?auto_105307 ) ( CLEAR ?auto_105309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105303 ?auto_105302 ?auto_105304 ?auto_105306 ?auto_105305 ?auto_105308 ?auto_105307 )
      ( MAKE-1PILE ?auto_105302 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105315 - BLOCK
      ?auto_105316 - BLOCK
      ?auto_105317 - BLOCK
      ?auto_105318 - BLOCK
      ?auto_105319 - BLOCK
    )
    :vars
    (
      ?auto_105320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105320 ?auto_105319 ) ( CLEAR ?auto_105320 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105315 ) ( ON ?auto_105316 ?auto_105315 ) ( ON ?auto_105317 ?auto_105316 ) ( ON ?auto_105318 ?auto_105317 ) ( ON ?auto_105319 ?auto_105318 ) ( not ( = ?auto_105315 ?auto_105316 ) ) ( not ( = ?auto_105315 ?auto_105317 ) ) ( not ( = ?auto_105315 ?auto_105318 ) ) ( not ( = ?auto_105315 ?auto_105319 ) ) ( not ( = ?auto_105315 ?auto_105320 ) ) ( not ( = ?auto_105316 ?auto_105317 ) ) ( not ( = ?auto_105316 ?auto_105318 ) ) ( not ( = ?auto_105316 ?auto_105319 ) ) ( not ( = ?auto_105316 ?auto_105320 ) ) ( not ( = ?auto_105317 ?auto_105318 ) ) ( not ( = ?auto_105317 ?auto_105319 ) ) ( not ( = ?auto_105317 ?auto_105320 ) ) ( not ( = ?auto_105318 ?auto_105319 ) ) ( not ( = ?auto_105318 ?auto_105320 ) ) ( not ( = ?auto_105319 ?auto_105320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105320 ?auto_105319 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105321 - BLOCK
      ?auto_105322 - BLOCK
      ?auto_105323 - BLOCK
      ?auto_105324 - BLOCK
      ?auto_105325 - BLOCK
    )
    :vars
    (
      ?auto_105326 - BLOCK
      ?auto_105327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105326 ?auto_105325 ) ( CLEAR ?auto_105326 ) ( ON-TABLE ?auto_105321 ) ( ON ?auto_105322 ?auto_105321 ) ( ON ?auto_105323 ?auto_105322 ) ( ON ?auto_105324 ?auto_105323 ) ( ON ?auto_105325 ?auto_105324 ) ( not ( = ?auto_105321 ?auto_105322 ) ) ( not ( = ?auto_105321 ?auto_105323 ) ) ( not ( = ?auto_105321 ?auto_105324 ) ) ( not ( = ?auto_105321 ?auto_105325 ) ) ( not ( = ?auto_105321 ?auto_105326 ) ) ( not ( = ?auto_105322 ?auto_105323 ) ) ( not ( = ?auto_105322 ?auto_105324 ) ) ( not ( = ?auto_105322 ?auto_105325 ) ) ( not ( = ?auto_105322 ?auto_105326 ) ) ( not ( = ?auto_105323 ?auto_105324 ) ) ( not ( = ?auto_105323 ?auto_105325 ) ) ( not ( = ?auto_105323 ?auto_105326 ) ) ( not ( = ?auto_105324 ?auto_105325 ) ) ( not ( = ?auto_105324 ?auto_105326 ) ) ( not ( = ?auto_105325 ?auto_105326 ) ) ( HOLDING ?auto_105327 ) ( not ( = ?auto_105321 ?auto_105327 ) ) ( not ( = ?auto_105322 ?auto_105327 ) ) ( not ( = ?auto_105323 ?auto_105327 ) ) ( not ( = ?auto_105324 ?auto_105327 ) ) ( not ( = ?auto_105325 ?auto_105327 ) ) ( not ( = ?auto_105326 ?auto_105327 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_105327 )
      ( MAKE-5PILE ?auto_105321 ?auto_105322 ?auto_105323 ?auto_105324 ?auto_105325 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105328 - BLOCK
      ?auto_105329 - BLOCK
      ?auto_105330 - BLOCK
      ?auto_105331 - BLOCK
      ?auto_105332 - BLOCK
    )
    :vars
    (
      ?auto_105334 - BLOCK
      ?auto_105333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105334 ?auto_105332 ) ( ON-TABLE ?auto_105328 ) ( ON ?auto_105329 ?auto_105328 ) ( ON ?auto_105330 ?auto_105329 ) ( ON ?auto_105331 ?auto_105330 ) ( ON ?auto_105332 ?auto_105331 ) ( not ( = ?auto_105328 ?auto_105329 ) ) ( not ( = ?auto_105328 ?auto_105330 ) ) ( not ( = ?auto_105328 ?auto_105331 ) ) ( not ( = ?auto_105328 ?auto_105332 ) ) ( not ( = ?auto_105328 ?auto_105334 ) ) ( not ( = ?auto_105329 ?auto_105330 ) ) ( not ( = ?auto_105329 ?auto_105331 ) ) ( not ( = ?auto_105329 ?auto_105332 ) ) ( not ( = ?auto_105329 ?auto_105334 ) ) ( not ( = ?auto_105330 ?auto_105331 ) ) ( not ( = ?auto_105330 ?auto_105332 ) ) ( not ( = ?auto_105330 ?auto_105334 ) ) ( not ( = ?auto_105331 ?auto_105332 ) ) ( not ( = ?auto_105331 ?auto_105334 ) ) ( not ( = ?auto_105332 ?auto_105334 ) ) ( not ( = ?auto_105328 ?auto_105333 ) ) ( not ( = ?auto_105329 ?auto_105333 ) ) ( not ( = ?auto_105330 ?auto_105333 ) ) ( not ( = ?auto_105331 ?auto_105333 ) ) ( not ( = ?auto_105332 ?auto_105333 ) ) ( not ( = ?auto_105334 ?auto_105333 ) ) ( ON ?auto_105333 ?auto_105334 ) ( CLEAR ?auto_105333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105328 ?auto_105329 ?auto_105330 ?auto_105331 ?auto_105332 ?auto_105334 )
      ( MAKE-5PILE ?auto_105328 ?auto_105329 ?auto_105330 ?auto_105331 ?auto_105332 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105335 - BLOCK
      ?auto_105336 - BLOCK
      ?auto_105337 - BLOCK
      ?auto_105338 - BLOCK
      ?auto_105339 - BLOCK
    )
    :vars
    (
      ?auto_105341 - BLOCK
      ?auto_105340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105341 ?auto_105339 ) ( ON-TABLE ?auto_105335 ) ( ON ?auto_105336 ?auto_105335 ) ( ON ?auto_105337 ?auto_105336 ) ( ON ?auto_105338 ?auto_105337 ) ( ON ?auto_105339 ?auto_105338 ) ( not ( = ?auto_105335 ?auto_105336 ) ) ( not ( = ?auto_105335 ?auto_105337 ) ) ( not ( = ?auto_105335 ?auto_105338 ) ) ( not ( = ?auto_105335 ?auto_105339 ) ) ( not ( = ?auto_105335 ?auto_105341 ) ) ( not ( = ?auto_105336 ?auto_105337 ) ) ( not ( = ?auto_105336 ?auto_105338 ) ) ( not ( = ?auto_105336 ?auto_105339 ) ) ( not ( = ?auto_105336 ?auto_105341 ) ) ( not ( = ?auto_105337 ?auto_105338 ) ) ( not ( = ?auto_105337 ?auto_105339 ) ) ( not ( = ?auto_105337 ?auto_105341 ) ) ( not ( = ?auto_105338 ?auto_105339 ) ) ( not ( = ?auto_105338 ?auto_105341 ) ) ( not ( = ?auto_105339 ?auto_105341 ) ) ( not ( = ?auto_105335 ?auto_105340 ) ) ( not ( = ?auto_105336 ?auto_105340 ) ) ( not ( = ?auto_105337 ?auto_105340 ) ) ( not ( = ?auto_105338 ?auto_105340 ) ) ( not ( = ?auto_105339 ?auto_105340 ) ) ( not ( = ?auto_105341 ?auto_105340 ) ) ( HOLDING ?auto_105340 ) ( CLEAR ?auto_105341 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105335 ?auto_105336 ?auto_105337 ?auto_105338 ?auto_105339 ?auto_105341 ?auto_105340 )
      ( MAKE-5PILE ?auto_105335 ?auto_105336 ?auto_105337 ?auto_105338 ?auto_105339 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105342 - BLOCK
      ?auto_105343 - BLOCK
      ?auto_105344 - BLOCK
      ?auto_105345 - BLOCK
      ?auto_105346 - BLOCK
    )
    :vars
    (
      ?auto_105347 - BLOCK
      ?auto_105348 - BLOCK
      ?auto_105349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105347 ?auto_105346 ) ( ON-TABLE ?auto_105342 ) ( ON ?auto_105343 ?auto_105342 ) ( ON ?auto_105344 ?auto_105343 ) ( ON ?auto_105345 ?auto_105344 ) ( ON ?auto_105346 ?auto_105345 ) ( not ( = ?auto_105342 ?auto_105343 ) ) ( not ( = ?auto_105342 ?auto_105344 ) ) ( not ( = ?auto_105342 ?auto_105345 ) ) ( not ( = ?auto_105342 ?auto_105346 ) ) ( not ( = ?auto_105342 ?auto_105347 ) ) ( not ( = ?auto_105343 ?auto_105344 ) ) ( not ( = ?auto_105343 ?auto_105345 ) ) ( not ( = ?auto_105343 ?auto_105346 ) ) ( not ( = ?auto_105343 ?auto_105347 ) ) ( not ( = ?auto_105344 ?auto_105345 ) ) ( not ( = ?auto_105344 ?auto_105346 ) ) ( not ( = ?auto_105344 ?auto_105347 ) ) ( not ( = ?auto_105345 ?auto_105346 ) ) ( not ( = ?auto_105345 ?auto_105347 ) ) ( not ( = ?auto_105346 ?auto_105347 ) ) ( not ( = ?auto_105342 ?auto_105348 ) ) ( not ( = ?auto_105343 ?auto_105348 ) ) ( not ( = ?auto_105344 ?auto_105348 ) ) ( not ( = ?auto_105345 ?auto_105348 ) ) ( not ( = ?auto_105346 ?auto_105348 ) ) ( not ( = ?auto_105347 ?auto_105348 ) ) ( CLEAR ?auto_105347 ) ( ON ?auto_105348 ?auto_105349 ) ( CLEAR ?auto_105348 ) ( HAND-EMPTY ) ( not ( = ?auto_105342 ?auto_105349 ) ) ( not ( = ?auto_105343 ?auto_105349 ) ) ( not ( = ?auto_105344 ?auto_105349 ) ) ( not ( = ?auto_105345 ?auto_105349 ) ) ( not ( = ?auto_105346 ?auto_105349 ) ) ( not ( = ?auto_105347 ?auto_105349 ) ) ( not ( = ?auto_105348 ?auto_105349 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105348 ?auto_105349 )
      ( MAKE-5PILE ?auto_105342 ?auto_105343 ?auto_105344 ?auto_105345 ?auto_105346 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105366 - BLOCK
      ?auto_105367 - BLOCK
      ?auto_105368 - BLOCK
      ?auto_105369 - BLOCK
      ?auto_105370 - BLOCK
    )
    :vars
    (
      ?auto_105371 - BLOCK
      ?auto_105373 - BLOCK
      ?auto_105372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105366 ) ( ON ?auto_105367 ?auto_105366 ) ( ON ?auto_105368 ?auto_105367 ) ( ON ?auto_105369 ?auto_105368 ) ( not ( = ?auto_105366 ?auto_105367 ) ) ( not ( = ?auto_105366 ?auto_105368 ) ) ( not ( = ?auto_105366 ?auto_105369 ) ) ( not ( = ?auto_105366 ?auto_105370 ) ) ( not ( = ?auto_105366 ?auto_105371 ) ) ( not ( = ?auto_105367 ?auto_105368 ) ) ( not ( = ?auto_105367 ?auto_105369 ) ) ( not ( = ?auto_105367 ?auto_105370 ) ) ( not ( = ?auto_105367 ?auto_105371 ) ) ( not ( = ?auto_105368 ?auto_105369 ) ) ( not ( = ?auto_105368 ?auto_105370 ) ) ( not ( = ?auto_105368 ?auto_105371 ) ) ( not ( = ?auto_105369 ?auto_105370 ) ) ( not ( = ?auto_105369 ?auto_105371 ) ) ( not ( = ?auto_105370 ?auto_105371 ) ) ( not ( = ?auto_105366 ?auto_105373 ) ) ( not ( = ?auto_105367 ?auto_105373 ) ) ( not ( = ?auto_105368 ?auto_105373 ) ) ( not ( = ?auto_105369 ?auto_105373 ) ) ( not ( = ?auto_105370 ?auto_105373 ) ) ( not ( = ?auto_105371 ?auto_105373 ) ) ( ON ?auto_105373 ?auto_105372 ) ( not ( = ?auto_105366 ?auto_105372 ) ) ( not ( = ?auto_105367 ?auto_105372 ) ) ( not ( = ?auto_105368 ?auto_105372 ) ) ( not ( = ?auto_105369 ?auto_105372 ) ) ( not ( = ?auto_105370 ?auto_105372 ) ) ( not ( = ?auto_105371 ?auto_105372 ) ) ( not ( = ?auto_105373 ?auto_105372 ) ) ( ON ?auto_105371 ?auto_105373 ) ( CLEAR ?auto_105371 ) ( HOLDING ?auto_105370 ) ( CLEAR ?auto_105369 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105366 ?auto_105367 ?auto_105368 ?auto_105369 ?auto_105370 ?auto_105371 )
      ( MAKE-5PILE ?auto_105366 ?auto_105367 ?auto_105368 ?auto_105369 ?auto_105370 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105374 - BLOCK
      ?auto_105375 - BLOCK
      ?auto_105376 - BLOCK
      ?auto_105377 - BLOCK
      ?auto_105378 - BLOCK
    )
    :vars
    (
      ?auto_105379 - BLOCK
      ?auto_105381 - BLOCK
      ?auto_105380 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105374 ) ( ON ?auto_105375 ?auto_105374 ) ( ON ?auto_105376 ?auto_105375 ) ( ON ?auto_105377 ?auto_105376 ) ( not ( = ?auto_105374 ?auto_105375 ) ) ( not ( = ?auto_105374 ?auto_105376 ) ) ( not ( = ?auto_105374 ?auto_105377 ) ) ( not ( = ?auto_105374 ?auto_105378 ) ) ( not ( = ?auto_105374 ?auto_105379 ) ) ( not ( = ?auto_105375 ?auto_105376 ) ) ( not ( = ?auto_105375 ?auto_105377 ) ) ( not ( = ?auto_105375 ?auto_105378 ) ) ( not ( = ?auto_105375 ?auto_105379 ) ) ( not ( = ?auto_105376 ?auto_105377 ) ) ( not ( = ?auto_105376 ?auto_105378 ) ) ( not ( = ?auto_105376 ?auto_105379 ) ) ( not ( = ?auto_105377 ?auto_105378 ) ) ( not ( = ?auto_105377 ?auto_105379 ) ) ( not ( = ?auto_105378 ?auto_105379 ) ) ( not ( = ?auto_105374 ?auto_105381 ) ) ( not ( = ?auto_105375 ?auto_105381 ) ) ( not ( = ?auto_105376 ?auto_105381 ) ) ( not ( = ?auto_105377 ?auto_105381 ) ) ( not ( = ?auto_105378 ?auto_105381 ) ) ( not ( = ?auto_105379 ?auto_105381 ) ) ( ON ?auto_105381 ?auto_105380 ) ( not ( = ?auto_105374 ?auto_105380 ) ) ( not ( = ?auto_105375 ?auto_105380 ) ) ( not ( = ?auto_105376 ?auto_105380 ) ) ( not ( = ?auto_105377 ?auto_105380 ) ) ( not ( = ?auto_105378 ?auto_105380 ) ) ( not ( = ?auto_105379 ?auto_105380 ) ) ( not ( = ?auto_105381 ?auto_105380 ) ) ( ON ?auto_105379 ?auto_105381 ) ( CLEAR ?auto_105377 ) ( ON ?auto_105378 ?auto_105379 ) ( CLEAR ?auto_105378 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105380 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105380 ?auto_105381 ?auto_105379 )
      ( MAKE-5PILE ?auto_105374 ?auto_105375 ?auto_105376 ?auto_105377 ?auto_105378 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105382 - BLOCK
      ?auto_105383 - BLOCK
      ?auto_105384 - BLOCK
      ?auto_105385 - BLOCK
      ?auto_105386 - BLOCK
    )
    :vars
    (
      ?auto_105389 - BLOCK
      ?auto_105388 - BLOCK
      ?auto_105387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105382 ) ( ON ?auto_105383 ?auto_105382 ) ( ON ?auto_105384 ?auto_105383 ) ( not ( = ?auto_105382 ?auto_105383 ) ) ( not ( = ?auto_105382 ?auto_105384 ) ) ( not ( = ?auto_105382 ?auto_105385 ) ) ( not ( = ?auto_105382 ?auto_105386 ) ) ( not ( = ?auto_105382 ?auto_105389 ) ) ( not ( = ?auto_105383 ?auto_105384 ) ) ( not ( = ?auto_105383 ?auto_105385 ) ) ( not ( = ?auto_105383 ?auto_105386 ) ) ( not ( = ?auto_105383 ?auto_105389 ) ) ( not ( = ?auto_105384 ?auto_105385 ) ) ( not ( = ?auto_105384 ?auto_105386 ) ) ( not ( = ?auto_105384 ?auto_105389 ) ) ( not ( = ?auto_105385 ?auto_105386 ) ) ( not ( = ?auto_105385 ?auto_105389 ) ) ( not ( = ?auto_105386 ?auto_105389 ) ) ( not ( = ?auto_105382 ?auto_105388 ) ) ( not ( = ?auto_105383 ?auto_105388 ) ) ( not ( = ?auto_105384 ?auto_105388 ) ) ( not ( = ?auto_105385 ?auto_105388 ) ) ( not ( = ?auto_105386 ?auto_105388 ) ) ( not ( = ?auto_105389 ?auto_105388 ) ) ( ON ?auto_105388 ?auto_105387 ) ( not ( = ?auto_105382 ?auto_105387 ) ) ( not ( = ?auto_105383 ?auto_105387 ) ) ( not ( = ?auto_105384 ?auto_105387 ) ) ( not ( = ?auto_105385 ?auto_105387 ) ) ( not ( = ?auto_105386 ?auto_105387 ) ) ( not ( = ?auto_105389 ?auto_105387 ) ) ( not ( = ?auto_105388 ?auto_105387 ) ) ( ON ?auto_105389 ?auto_105388 ) ( ON ?auto_105386 ?auto_105389 ) ( CLEAR ?auto_105386 ) ( ON-TABLE ?auto_105387 ) ( HOLDING ?auto_105385 ) ( CLEAR ?auto_105384 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105382 ?auto_105383 ?auto_105384 ?auto_105385 )
      ( MAKE-5PILE ?auto_105382 ?auto_105383 ?auto_105384 ?auto_105385 ?auto_105386 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105390 - BLOCK
      ?auto_105391 - BLOCK
      ?auto_105392 - BLOCK
      ?auto_105393 - BLOCK
      ?auto_105394 - BLOCK
    )
    :vars
    (
      ?auto_105395 - BLOCK
      ?auto_105396 - BLOCK
      ?auto_105397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105390 ) ( ON ?auto_105391 ?auto_105390 ) ( ON ?auto_105392 ?auto_105391 ) ( not ( = ?auto_105390 ?auto_105391 ) ) ( not ( = ?auto_105390 ?auto_105392 ) ) ( not ( = ?auto_105390 ?auto_105393 ) ) ( not ( = ?auto_105390 ?auto_105394 ) ) ( not ( = ?auto_105390 ?auto_105395 ) ) ( not ( = ?auto_105391 ?auto_105392 ) ) ( not ( = ?auto_105391 ?auto_105393 ) ) ( not ( = ?auto_105391 ?auto_105394 ) ) ( not ( = ?auto_105391 ?auto_105395 ) ) ( not ( = ?auto_105392 ?auto_105393 ) ) ( not ( = ?auto_105392 ?auto_105394 ) ) ( not ( = ?auto_105392 ?auto_105395 ) ) ( not ( = ?auto_105393 ?auto_105394 ) ) ( not ( = ?auto_105393 ?auto_105395 ) ) ( not ( = ?auto_105394 ?auto_105395 ) ) ( not ( = ?auto_105390 ?auto_105396 ) ) ( not ( = ?auto_105391 ?auto_105396 ) ) ( not ( = ?auto_105392 ?auto_105396 ) ) ( not ( = ?auto_105393 ?auto_105396 ) ) ( not ( = ?auto_105394 ?auto_105396 ) ) ( not ( = ?auto_105395 ?auto_105396 ) ) ( ON ?auto_105396 ?auto_105397 ) ( not ( = ?auto_105390 ?auto_105397 ) ) ( not ( = ?auto_105391 ?auto_105397 ) ) ( not ( = ?auto_105392 ?auto_105397 ) ) ( not ( = ?auto_105393 ?auto_105397 ) ) ( not ( = ?auto_105394 ?auto_105397 ) ) ( not ( = ?auto_105395 ?auto_105397 ) ) ( not ( = ?auto_105396 ?auto_105397 ) ) ( ON ?auto_105395 ?auto_105396 ) ( ON ?auto_105394 ?auto_105395 ) ( ON-TABLE ?auto_105397 ) ( CLEAR ?auto_105392 ) ( ON ?auto_105393 ?auto_105394 ) ( CLEAR ?auto_105393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105397 ?auto_105396 ?auto_105395 ?auto_105394 )
      ( MAKE-5PILE ?auto_105390 ?auto_105391 ?auto_105392 ?auto_105393 ?auto_105394 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105398 - BLOCK
      ?auto_105399 - BLOCK
      ?auto_105400 - BLOCK
      ?auto_105401 - BLOCK
      ?auto_105402 - BLOCK
    )
    :vars
    (
      ?auto_105405 - BLOCK
      ?auto_105403 - BLOCK
      ?auto_105404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105398 ) ( ON ?auto_105399 ?auto_105398 ) ( not ( = ?auto_105398 ?auto_105399 ) ) ( not ( = ?auto_105398 ?auto_105400 ) ) ( not ( = ?auto_105398 ?auto_105401 ) ) ( not ( = ?auto_105398 ?auto_105402 ) ) ( not ( = ?auto_105398 ?auto_105405 ) ) ( not ( = ?auto_105399 ?auto_105400 ) ) ( not ( = ?auto_105399 ?auto_105401 ) ) ( not ( = ?auto_105399 ?auto_105402 ) ) ( not ( = ?auto_105399 ?auto_105405 ) ) ( not ( = ?auto_105400 ?auto_105401 ) ) ( not ( = ?auto_105400 ?auto_105402 ) ) ( not ( = ?auto_105400 ?auto_105405 ) ) ( not ( = ?auto_105401 ?auto_105402 ) ) ( not ( = ?auto_105401 ?auto_105405 ) ) ( not ( = ?auto_105402 ?auto_105405 ) ) ( not ( = ?auto_105398 ?auto_105403 ) ) ( not ( = ?auto_105399 ?auto_105403 ) ) ( not ( = ?auto_105400 ?auto_105403 ) ) ( not ( = ?auto_105401 ?auto_105403 ) ) ( not ( = ?auto_105402 ?auto_105403 ) ) ( not ( = ?auto_105405 ?auto_105403 ) ) ( ON ?auto_105403 ?auto_105404 ) ( not ( = ?auto_105398 ?auto_105404 ) ) ( not ( = ?auto_105399 ?auto_105404 ) ) ( not ( = ?auto_105400 ?auto_105404 ) ) ( not ( = ?auto_105401 ?auto_105404 ) ) ( not ( = ?auto_105402 ?auto_105404 ) ) ( not ( = ?auto_105405 ?auto_105404 ) ) ( not ( = ?auto_105403 ?auto_105404 ) ) ( ON ?auto_105405 ?auto_105403 ) ( ON ?auto_105402 ?auto_105405 ) ( ON-TABLE ?auto_105404 ) ( ON ?auto_105401 ?auto_105402 ) ( CLEAR ?auto_105401 ) ( HOLDING ?auto_105400 ) ( CLEAR ?auto_105399 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105398 ?auto_105399 ?auto_105400 )
      ( MAKE-5PILE ?auto_105398 ?auto_105399 ?auto_105400 ?auto_105401 ?auto_105402 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105406 - BLOCK
      ?auto_105407 - BLOCK
      ?auto_105408 - BLOCK
      ?auto_105409 - BLOCK
      ?auto_105410 - BLOCK
    )
    :vars
    (
      ?auto_105412 - BLOCK
      ?auto_105413 - BLOCK
      ?auto_105411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105406 ) ( ON ?auto_105407 ?auto_105406 ) ( not ( = ?auto_105406 ?auto_105407 ) ) ( not ( = ?auto_105406 ?auto_105408 ) ) ( not ( = ?auto_105406 ?auto_105409 ) ) ( not ( = ?auto_105406 ?auto_105410 ) ) ( not ( = ?auto_105406 ?auto_105412 ) ) ( not ( = ?auto_105407 ?auto_105408 ) ) ( not ( = ?auto_105407 ?auto_105409 ) ) ( not ( = ?auto_105407 ?auto_105410 ) ) ( not ( = ?auto_105407 ?auto_105412 ) ) ( not ( = ?auto_105408 ?auto_105409 ) ) ( not ( = ?auto_105408 ?auto_105410 ) ) ( not ( = ?auto_105408 ?auto_105412 ) ) ( not ( = ?auto_105409 ?auto_105410 ) ) ( not ( = ?auto_105409 ?auto_105412 ) ) ( not ( = ?auto_105410 ?auto_105412 ) ) ( not ( = ?auto_105406 ?auto_105413 ) ) ( not ( = ?auto_105407 ?auto_105413 ) ) ( not ( = ?auto_105408 ?auto_105413 ) ) ( not ( = ?auto_105409 ?auto_105413 ) ) ( not ( = ?auto_105410 ?auto_105413 ) ) ( not ( = ?auto_105412 ?auto_105413 ) ) ( ON ?auto_105413 ?auto_105411 ) ( not ( = ?auto_105406 ?auto_105411 ) ) ( not ( = ?auto_105407 ?auto_105411 ) ) ( not ( = ?auto_105408 ?auto_105411 ) ) ( not ( = ?auto_105409 ?auto_105411 ) ) ( not ( = ?auto_105410 ?auto_105411 ) ) ( not ( = ?auto_105412 ?auto_105411 ) ) ( not ( = ?auto_105413 ?auto_105411 ) ) ( ON ?auto_105412 ?auto_105413 ) ( ON ?auto_105410 ?auto_105412 ) ( ON-TABLE ?auto_105411 ) ( ON ?auto_105409 ?auto_105410 ) ( CLEAR ?auto_105407 ) ( ON ?auto_105408 ?auto_105409 ) ( CLEAR ?auto_105408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105411 ?auto_105413 ?auto_105412 ?auto_105410 ?auto_105409 )
      ( MAKE-5PILE ?auto_105406 ?auto_105407 ?auto_105408 ?auto_105409 ?auto_105410 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105414 - BLOCK
      ?auto_105415 - BLOCK
      ?auto_105416 - BLOCK
      ?auto_105417 - BLOCK
      ?auto_105418 - BLOCK
    )
    :vars
    (
      ?auto_105419 - BLOCK
      ?auto_105421 - BLOCK
      ?auto_105420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105414 ) ( not ( = ?auto_105414 ?auto_105415 ) ) ( not ( = ?auto_105414 ?auto_105416 ) ) ( not ( = ?auto_105414 ?auto_105417 ) ) ( not ( = ?auto_105414 ?auto_105418 ) ) ( not ( = ?auto_105414 ?auto_105419 ) ) ( not ( = ?auto_105415 ?auto_105416 ) ) ( not ( = ?auto_105415 ?auto_105417 ) ) ( not ( = ?auto_105415 ?auto_105418 ) ) ( not ( = ?auto_105415 ?auto_105419 ) ) ( not ( = ?auto_105416 ?auto_105417 ) ) ( not ( = ?auto_105416 ?auto_105418 ) ) ( not ( = ?auto_105416 ?auto_105419 ) ) ( not ( = ?auto_105417 ?auto_105418 ) ) ( not ( = ?auto_105417 ?auto_105419 ) ) ( not ( = ?auto_105418 ?auto_105419 ) ) ( not ( = ?auto_105414 ?auto_105421 ) ) ( not ( = ?auto_105415 ?auto_105421 ) ) ( not ( = ?auto_105416 ?auto_105421 ) ) ( not ( = ?auto_105417 ?auto_105421 ) ) ( not ( = ?auto_105418 ?auto_105421 ) ) ( not ( = ?auto_105419 ?auto_105421 ) ) ( ON ?auto_105421 ?auto_105420 ) ( not ( = ?auto_105414 ?auto_105420 ) ) ( not ( = ?auto_105415 ?auto_105420 ) ) ( not ( = ?auto_105416 ?auto_105420 ) ) ( not ( = ?auto_105417 ?auto_105420 ) ) ( not ( = ?auto_105418 ?auto_105420 ) ) ( not ( = ?auto_105419 ?auto_105420 ) ) ( not ( = ?auto_105421 ?auto_105420 ) ) ( ON ?auto_105419 ?auto_105421 ) ( ON ?auto_105418 ?auto_105419 ) ( ON-TABLE ?auto_105420 ) ( ON ?auto_105417 ?auto_105418 ) ( ON ?auto_105416 ?auto_105417 ) ( CLEAR ?auto_105416 ) ( HOLDING ?auto_105415 ) ( CLEAR ?auto_105414 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105414 ?auto_105415 )
      ( MAKE-5PILE ?auto_105414 ?auto_105415 ?auto_105416 ?auto_105417 ?auto_105418 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105422 - BLOCK
      ?auto_105423 - BLOCK
      ?auto_105424 - BLOCK
      ?auto_105425 - BLOCK
      ?auto_105426 - BLOCK
    )
    :vars
    (
      ?auto_105428 - BLOCK
      ?auto_105427 - BLOCK
      ?auto_105429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105422 ) ( not ( = ?auto_105422 ?auto_105423 ) ) ( not ( = ?auto_105422 ?auto_105424 ) ) ( not ( = ?auto_105422 ?auto_105425 ) ) ( not ( = ?auto_105422 ?auto_105426 ) ) ( not ( = ?auto_105422 ?auto_105428 ) ) ( not ( = ?auto_105423 ?auto_105424 ) ) ( not ( = ?auto_105423 ?auto_105425 ) ) ( not ( = ?auto_105423 ?auto_105426 ) ) ( not ( = ?auto_105423 ?auto_105428 ) ) ( not ( = ?auto_105424 ?auto_105425 ) ) ( not ( = ?auto_105424 ?auto_105426 ) ) ( not ( = ?auto_105424 ?auto_105428 ) ) ( not ( = ?auto_105425 ?auto_105426 ) ) ( not ( = ?auto_105425 ?auto_105428 ) ) ( not ( = ?auto_105426 ?auto_105428 ) ) ( not ( = ?auto_105422 ?auto_105427 ) ) ( not ( = ?auto_105423 ?auto_105427 ) ) ( not ( = ?auto_105424 ?auto_105427 ) ) ( not ( = ?auto_105425 ?auto_105427 ) ) ( not ( = ?auto_105426 ?auto_105427 ) ) ( not ( = ?auto_105428 ?auto_105427 ) ) ( ON ?auto_105427 ?auto_105429 ) ( not ( = ?auto_105422 ?auto_105429 ) ) ( not ( = ?auto_105423 ?auto_105429 ) ) ( not ( = ?auto_105424 ?auto_105429 ) ) ( not ( = ?auto_105425 ?auto_105429 ) ) ( not ( = ?auto_105426 ?auto_105429 ) ) ( not ( = ?auto_105428 ?auto_105429 ) ) ( not ( = ?auto_105427 ?auto_105429 ) ) ( ON ?auto_105428 ?auto_105427 ) ( ON ?auto_105426 ?auto_105428 ) ( ON-TABLE ?auto_105429 ) ( ON ?auto_105425 ?auto_105426 ) ( ON ?auto_105424 ?auto_105425 ) ( CLEAR ?auto_105422 ) ( ON ?auto_105423 ?auto_105424 ) ( CLEAR ?auto_105423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105429 ?auto_105427 ?auto_105428 ?auto_105426 ?auto_105425 ?auto_105424 )
      ( MAKE-5PILE ?auto_105422 ?auto_105423 ?auto_105424 ?auto_105425 ?auto_105426 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105430 - BLOCK
      ?auto_105431 - BLOCK
      ?auto_105432 - BLOCK
      ?auto_105433 - BLOCK
      ?auto_105434 - BLOCK
    )
    :vars
    (
      ?auto_105437 - BLOCK
      ?auto_105436 - BLOCK
      ?auto_105435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105430 ?auto_105431 ) ) ( not ( = ?auto_105430 ?auto_105432 ) ) ( not ( = ?auto_105430 ?auto_105433 ) ) ( not ( = ?auto_105430 ?auto_105434 ) ) ( not ( = ?auto_105430 ?auto_105437 ) ) ( not ( = ?auto_105431 ?auto_105432 ) ) ( not ( = ?auto_105431 ?auto_105433 ) ) ( not ( = ?auto_105431 ?auto_105434 ) ) ( not ( = ?auto_105431 ?auto_105437 ) ) ( not ( = ?auto_105432 ?auto_105433 ) ) ( not ( = ?auto_105432 ?auto_105434 ) ) ( not ( = ?auto_105432 ?auto_105437 ) ) ( not ( = ?auto_105433 ?auto_105434 ) ) ( not ( = ?auto_105433 ?auto_105437 ) ) ( not ( = ?auto_105434 ?auto_105437 ) ) ( not ( = ?auto_105430 ?auto_105436 ) ) ( not ( = ?auto_105431 ?auto_105436 ) ) ( not ( = ?auto_105432 ?auto_105436 ) ) ( not ( = ?auto_105433 ?auto_105436 ) ) ( not ( = ?auto_105434 ?auto_105436 ) ) ( not ( = ?auto_105437 ?auto_105436 ) ) ( ON ?auto_105436 ?auto_105435 ) ( not ( = ?auto_105430 ?auto_105435 ) ) ( not ( = ?auto_105431 ?auto_105435 ) ) ( not ( = ?auto_105432 ?auto_105435 ) ) ( not ( = ?auto_105433 ?auto_105435 ) ) ( not ( = ?auto_105434 ?auto_105435 ) ) ( not ( = ?auto_105437 ?auto_105435 ) ) ( not ( = ?auto_105436 ?auto_105435 ) ) ( ON ?auto_105437 ?auto_105436 ) ( ON ?auto_105434 ?auto_105437 ) ( ON-TABLE ?auto_105435 ) ( ON ?auto_105433 ?auto_105434 ) ( ON ?auto_105432 ?auto_105433 ) ( ON ?auto_105431 ?auto_105432 ) ( CLEAR ?auto_105431 ) ( HOLDING ?auto_105430 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105430 )
      ( MAKE-5PILE ?auto_105430 ?auto_105431 ?auto_105432 ?auto_105433 ?auto_105434 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_105438 - BLOCK
      ?auto_105439 - BLOCK
      ?auto_105440 - BLOCK
      ?auto_105441 - BLOCK
      ?auto_105442 - BLOCK
    )
    :vars
    (
      ?auto_105444 - BLOCK
      ?auto_105445 - BLOCK
      ?auto_105443 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105438 ?auto_105439 ) ) ( not ( = ?auto_105438 ?auto_105440 ) ) ( not ( = ?auto_105438 ?auto_105441 ) ) ( not ( = ?auto_105438 ?auto_105442 ) ) ( not ( = ?auto_105438 ?auto_105444 ) ) ( not ( = ?auto_105439 ?auto_105440 ) ) ( not ( = ?auto_105439 ?auto_105441 ) ) ( not ( = ?auto_105439 ?auto_105442 ) ) ( not ( = ?auto_105439 ?auto_105444 ) ) ( not ( = ?auto_105440 ?auto_105441 ) ) ( not ( = ?auto_105440 ?auto_105442 ) ) ( not ( = ?auto_105440 ?auto_105444 ) ) ( not ( = ?auto_105441 ?auto_105442 ) ) ( not ( = ?auto_105441 ?auto_105444 ) ) ( not ( = ?auto_105442 ?auto_105444 ) ) ( not ( = ?auto_105438 ?auto_105445 ) ) ( not ( = ?auto_105439 ?auto_105445 ) ) ( not ( = ?auto_105440 ?auto_105445 ) ) ( not ( = ?auto_105441 ?auto_105445 ) ) ( not ( = ?auto_105442 ?auto_105445 ) ) ( not ( = ?auto_105444 ?auto_105445 ) ) ( ON ?auto_105445 ?auto_105443 ) ( not ( = ?auto_105438 ?auto_105443 ) ) ( not ( = ?auto_105439 ?auto_105443 ) ) ( not ( = ?auto_105440 ?auto_105443 ) ) ( not ( = ?auto_105441 ?auto_105443 ) ) ( not ( = ?auto_105442 ?auto_105443 ) ) ( not ( = ?auto_105444 ?auto_105443 ) ) ( not ( = ?auto_105445 ?auto_105443 ) ) ( ON ?auto_105444 ?auto_105445 ) ( ON ?auto_105442 ?auto_105444 ) ( ON-TABLE ?auto_105443 ) ( ON ?auto_105441 ?auto_105442 ) ( ON ?auto_105440 ?auto_105441 ) ( ON ?auto_105439 ?auto_105440 ) ( ON ?auto_105438 ?auto_105439 ) ( CLEAR ?auto_105438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105443 ?auto_105445 ?auto_105444 ?auto_105442 ?auto_105441 ?auto_105440 ?auto_105439 )
      ( MAKE-5PILE ?auto_105438 ?auto_105439 ?auto_105440 ?auto_105441 ?auto_105442 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105448 - BLOCK
      ?auto_105449 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_105449 ) ( CLEAR ?auto_105448 ) ( ON-TABLE ?auto_105448 ) ( not ( = ?auto_105448 ?auto_105449 ) ) )
    :subtasks
    ( ( !STACK ?auto_105449 ?auto_105448 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105450 - BLOCK
      ?auto_105451 - BLOCK
    )
    :vars
    (
      ?auto_105452 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_105450 ) ( ON-TABLE ?auto_105450 ) ( not ( = ?auto_105450 ?auto_105451 ) ) ( ON ?auto_105451 ?auto_105452 ) ( CLEAR ?auto_105451 ) ( HAND-EMPTY ) ( not ( = ?auto_105450 ?auto_105452 ) ) ( not ( = ?auto_105451 ?auto_105452 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105451 ?auto_105452 )
      ( MAKE-2PILE ?auto_105450 ?auto_105451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105453 - BLOCK
      ?auto_105454 - BLOCK
    )
    :vars
    (
      ?auto_105455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105453 ?auto_105454 ) ) ( ON ?auto_105454 ?auto_105455 ) ( CLEAR ?auto_105454 ) ( not ( = ?auto_105453 ?auto_105455 ) ) ( not ( = ?auto_105454 ?auto_105455 ) ) ( HOLDING ?auto_105453 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105453 )
      ( MAKE-2PILE ?auto_105453 ?auto_105454 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105456 - BLOCK
      ?auto_105457 - BLOCK
    )
    :vars
    (
      ?auto_105458 - BLOCK
      ?auto_105459 - BLOCK
      ?auto_105462 - BLOCK
      ?auto_105461 - BLOCK
      ?auto_105460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105456 ?auto_105457 ) ) ( ON ?auto_105457 ?auto_105458 ) ( not ( = ?auto_105456 ?auto_105458 ) ) ( not ( = ?auto_105457 ?auto_105458 ) ) ( ON ?auto_105456 ?auto_105457 ) ( CLEAR ?auto_105456 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105459 ) ( ON ?auto_105462 ?auto_105459 ) ( ON ?auto_105461 ?auto_105462 ) ( ON ?auto_105460 ?auto_105461 ) ( ON ?auto_105458 ?auto_105460 ) ( not ( = ?auto_105459 ?auto_105462 ) ) ( not ( = ?auto_105459 ?auto_105461 ) ) ( not ( = ?auto_105459 ?auto_105460 ) ) ( not ( = ?auto_105459 ?auto_105458 ) ) ( not ( = ?auto_105459 ?auto_105457 ) ) ( not ( = ?auto_105459 ?auto_105456 ) ) ( not ( = ?auto_105462 ?auto_105461 ) ) ( not ( = ?auto_105462 ?auto_105460 ) ) ( not ( = ?auto_105462 ?auto_105458 ) ) ( not ( = ?auto_105462 ?auto_105457 ) ) ( not ( = ?auto_105462 ?auto_105456 ) ) ( not ( = ?auto_105461 ?auto_105460 ) ) ( not ( = ?auto_105461 ?auto_105458 ) ) ( not ( = ?auto_105461 ?auto_105457 ) ) ( not ( = ?auto_105461 ?auto_105456 ) ) ( not ( = ?auto_105460 ?auto_105458 ) ) ( not ( = ?auto_105460 ?auto_105457 ) ) ( not ( = ?auto_105460 ?auto_105456 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105459 ?auto_105462 ?auto_105461 ?auto_105460 ?auto_105458 ?auto_105457 )
      ( MAKE-2PILE ?auto_105456 ?auto_105457 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105463 - BLOCK
      ?auto_105464 - BLOCK
    )
    :vars
    (
      ?auto_105467 - BLOCK
      ?auto_105466 - BLOCK
      ?auto_105469 - BLOCK
      ?auto_105465 - BLOCK
      ?auto_105468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105463 ?auto_105464 ) ) ( ON ?auto_105464 ?auto_105467 ) ( not ( = ?auto_105463 ?auto_105467 ) ) ( not ( = ?auto_105464 ?auto_105467 ) ) ( ON-TABLE ?auto_105466 ) ( ON ?auto_105469 ?auto_105466 ) ( ON ?auto_105465 ?auto_105469 ) ( ON ?auto_105468 ?auto_105465 ) ( ON ?auto_105467 ?auto_105468 ) ( not ( = ?auto_105466 ?auto_105469 ) ) ( not ( = ?auto_105466 ?auto_105465 ) ) ( not ( = ?auto_105466 ?auto_105468 ) ) ( not ( = ?auto_105466 ?auto_105467 ) ) ( not ( = ?auto_105466 ?auto_105464 ) ) ( not ( = ?auto_105466 ?auto_105463 ) ) ( not ( = ?auto_105469 ?auto_105465 ) ) ( not ( = ?auto_105469 ?auto_105468 ) ) ( not ( = ?auto_105469 ?auto_105467 ) ) ( not ( = ?auto_105469 ?auto_105464 ) ) ( not ( = ?auto_105469 ?auto_105463 ) ) ( not ( = ?auto_105465 ?auto_105468 ) ) ( not ( = ?auto_105465 ?auto_105467 ) ) ( not ( = ?auto_105465 ?auto_105464 ) ) ( not ( = ?auto_105465 ?auto_105463 ) ) ( not ( = ?auto_105468 ?auto_105467 ) ) ( not ( = ?auto_105468 ?auto_105464 ) ) ( not ( = ?auto_105468 ?auto_105463 ) ) ( HOLDING ?auto_105463 ) ( CLEAR ?auto_105464 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105466 ?auto_105469 ?auto_105465 ?auto_105468 ?auto_105467 ?auto_105464 ?auto_105463 )
      ( MAKE-2PILE ?auto_105463 ?auto_105464 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105470 - BLOCK
      ?auto_105471 - BLOCK
    )
    :vars
    (
      ?auto_105474 - BLOCK
      ?auto_105475 - BLOCK
      ?auto_105476 - BLOCK
      ?auto_105473 - BLOCK
      ?auto_105472 - BLOCK
      ?auto_105477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105470 ?auto_105471 ) ) ( ON ?auto_105471 ?auto_105474 ) ( not ( = ?auto_105470 ?auto_105474 ) ) ( not ( = ?auto_105471 ?auto_105474 ) ) ( ON-TABLE ?auto_105475 ) ( ON ?auto_105476 ?auto_105475 ) ( ON ?auto_105473 ?auto_105476 ) ( ON ?auto_105472 ?auto_105473 ) ( ON ?auto_105474 ?auto_105472 ) ( not ( = ?auto_105475 ?auto_105476 ) ) ( not ( = ?auto_105475 ?auto_105473 ) ) ( not ( = ?auto_105475 ?auto_105472 ) ) ( not ( = ?auto_105475 ?auto_105474 ) ) ( not ( = ?auto_105475 ?auto_105471 ) ) ( not ( = ?auto_105475 ?auto_105470 ) ) ( not ( = ?auto_105476 ?auto_105473 ) ) ( not ( = ?auto_105476 ?auto_105472 ) ) ( not ( = ?auto_105476 ?auto_105474 ) ) ( not ( = ?auto_105476 ?auto_105471 ) ) ( not ( = ?auto_105476 ?auto_105470 ) ) ( not ( = ?auto_105473 ?auto_105472 ) ) ( not ( = ?auto_105473 ?auto_105474 ) ) ( not ( = ?auto_105473 ?auto_105471 ) ) ( not ( = ?auto_105473 ?auto_105470 ) ) ( not ( = ?auto_105472 ?auto_105474 ) ) ( not ( = ?auto_105472 ?auto_105471 ) ) ( not ( = ?auto_105472 ?auto_105470 ) ) ( CLEAR ?auto_105471 ) ( ON ?auto_105470 ?auto_105477 ) ( CLEAR ?auto_105470 ) ( HAND-EMPTY ) ( not ( = ?auto_105470 ?auto_105477 ) ) ( not ( = ?auto_105471 ?auto_105477 ) ) ( not ( = ?auto_105474 ?auto_105477 ) ) ( not ( = ?auto_105475 ?auto_105477 ) ) ( not ( = ?auto_105476 ?auto_105477 ) ) ( not ( = ?auto_105473 ?auto_105477 ) ) ( not ( = ?auto_105472 ?auto_105477 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105470 ?auto_105477 )
      ( MAKE-2PILE ?auto_105470 ?auto_105471 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105478 - BLOCK
      ?auto_105479 - BLOCK
    )
    :vars
    (
      ?auto_105484 - BLOCK
      ?auto_105482 - BLOCK
      ?auto_105483 - BLOCK
      ?auto_105480 - BLOCK
      ?auto_105485 - BLOCK
      ?auto_105481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105478 ?auto_105479 ) ) ( not ( = ?auto_105478 ?auto_105484 ) ) ( not ( = ?auto_105479 ?auto_105484 ) ) ( ON-TABLE ?auto_105482 ) ( ON ?auto_105483 ?auto_105482 ) ( ON ?auto_105480 ?auto_105483 ) ( ON ?auto_105485 ?auto_105480 ) ( ON ?auto_105484 ?auto_105485 ) ( not ( = ?auto_105482 ?auto_105483 ) ) ( not ( = ?auto_105482 ?auto_105480 ) ) ( not ( = ?auto_105482 ?auto_105485 ) ) ( not ( = ?auto_105482 ?auto_105484 ) ) ( not ( = ?auto_105482 ?auto_105479 ) ) ( not ( = ?auto_105482 ?auto_105478 ) ) ( not ( = ?auto_105483 ?auto_105480 ) ) ( not ( = ?auto_105483 ?auto_105485 ) ) ( not ( = ?auto_105483 ?auto_105484 ) ) ( not ( = ?auto_105483 ?auto_105479 ) ) ( not ( = ?auto_105483 ?auto_105478 ) ) ( not ( = ?auto_105480 ?auto_105485 ) ) ( not ( = ?auto_105480 ?auto_105484 ) ) ( not ( = ?auto_105480 ?auto_105479 ) ) ( not ( = ?auto_105480 ?auto_105478 ) ) ( not ( = ?auto_105485 ?auto_105484 ) ) ( not ( = ?auto_105485 ?auto_105479 ) ) ( not ( = ?auto_105485 ?auto_105478 ) ) ( ON ?auto_105478 ?auto_105481 ) ( CLEAR ?auto_105478 ) ( not ( = ?auto_105478 ?auto_105481 ) ) ( not ( = ?auto_105479 ?auto_105481 ) ) ( not ( = ?auto_105484 ?auto_105481 ) ) ( not ( = ?auto_105482 ?auto_105481 ) ) ( not ( = ?auto_105483 ?auto_105481 ) ) ( not ( = ?auto_105480 ?auto_105481 ) ) ( not ( = ?auto_105485 ?auto_105481 ) ) ( HOLDING ?auto_105479 ) ( CLEAR ?auto_105484 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105482 ?auto_105483 ?auto_105480 ?auto_105485 ?auto_105484 ?auto_105479 )
      ( MAKE-2PILE ?auto_105478 ?auto_105479 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105486 - BLOCK
      ?auto_105487 - BLOCK
    )
    :vars
    (
      ?auto_105491 - BLOCK
      ?auto_105493 - BLOCK
      ?auto_105488 - BLOCK
      ?auto_105490 - BLOCK
      ?auto_105492 - BLOCK
      ?auto_105489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105486 ?auto_105487 ) ) ( not ( = ?auto_105486 ?auto_105491 ) ) ( not ( = ?auto_105487 ?auto_105491 ) ) ( ON-TABLE ?auto_105493 ) ( ON ?auto_105488 ?auto_105493 ) ( ON ?auto_105490 ?auto_105488 ) ( ON ?auto_105492 ?auto_105490 ) ( ON ?auto_105491 ?auto_105492 ) ( not ( = ?auto_105493 ?auto_105488 ) ) ( not ( = ?auto_105493 ?auto_105490 ) ) ( not ( = ?auto_105493 ?auto_105492 ) ) ( not ( = ?auto_105493 ?auto_105491 ) ) ( not ( = ?auto_105493 ?auto_105487 ) ) ( not ( = ?auto_105493 ?auto_105486 ) ) ( not ( = ?auto_105488 ?auto_105490 ) ) ( not ( = ?auto_105488 ?auto_105492 ) ) ( not ( = ?auto_105488 ?auto_105491 ) ) ( not ( = ?auto_105488 ?auto_105487 ) ) ( not ( = ?auto_105488 ?auto_105486 ) ) ( not ( = ?auto_105490 ?auto_105492 ) ) ( not ( = ?auto_105490 ?auto_105491 ) ) ( not ( = ?auto_105490 ?auto_105487 ) ) ( not ( = ?auto_105490 ?auto_105486 ) ) ( not ( = ?auto_105492 ?auto_105491 ) ) ( not ( = ?auto_105492 ?auto_105487 ) ) ( not ( = ?auto_105492 ?auto_105486 ) ) ( ON ?auto_105486 ?auto_105489 ) ( not ( = ?auto_105486 ?auto_105489 ) ) ( not ( = ?auto_105487 ?auto_105489 ) ) ( not ( = ?auto_105491 ?auto_105489 ) ) ( not ( = ?auto_105493 ?auto_105489 ) ) ( not ( = ?auto_105488 ?auto_105489 ) ) ( not ( = ?auto_105490 ?auto_105489 ) ) ( not ( = ?auto_105492 ?auto_105489 ) ) ( CLEAR ?auto_105491 ) ( ON ?auto_105487 ?auto_105486 ) ( CLEAR ?auto_105487 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105489 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105489 ?auto_105486 )
      ( MAKE-2PILE ?auto_105486 ?auto_105487 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105494 - BLOCK
      ?auto_105495 - BLOCK
    )
    :vars
    (
      ?auto_105496 - BLOCK
      ?auto_105498 - BLOCK
      ?auto_105499 - BLOCK
      ?auto_105497 - BLOCK
      ?auto_105501 - BLOCK
      ?auto_105500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105494 ?auto_105495 ) ) ( not ( = ?auto_105494 ?auto_105496 ) ) ( not ( = ?auto_105495 ?auto_105496 ) ) ( ON-TABLE ?auto_105498 ) ( ON ?auto_105499 ?auto_105498 ) ( ON ?auto_105497 ?auto_105499 ) ( ON ?auto_105501 ?auto_105497 ) ( not ( = ?auto_105498 ?auto_105499 ) ) ( not ( = ?auto_105498 ?auto_105497 ) ) ( not ( = ?auto_105498 ?auto_105501 ) ) ( not ( = ?auto_105498 ?auto_105496 ) ) ( not ( = ?auto_105498 ?auto_105495 ) ) ( not ( = ?auto_105498 ?auto_105494 ) ) ( not ( = ?auto_105499 ?auto_105497 ) ) ( not ( = ?auto_105499 ?auto_105501 ) ) ( not ( = ?auto_105499 ?auto_105496 ) ) ( not ( = ?auto_105499 ?auto_105495 ) ) ( not ( = ?auto_105499 ?auto_105494 ) ) ( not ( = ?auto_105497 ?auto_105501 ) ) ( not ( = ?auto_105497 ?auto_105496 ) ) ( not ( = ?auto_105497 ?auto_105495 ) ) ( not ( = ?auto_105497 ?auto_105494 ) ) ( not ( = ?auto_105501 ?auto_105496 ) ) ( not ( = ?auto_105501 ?auto_105495 ) ) ( not ( = ?auto_105501 ?auto_105494 ) ) ( ON ?auto_105494 ?auto_105500 ) ( not ( = ?auto_105494 ?auto_105500 ) ) ( not ( = ?auto_105495 ?auto_105500 ) ) ( not ( = ?auto_105496 ?auto_105500 ) ) ( not ( = ?auto_105498 ?auto_105500 ) ) ( not ( = ?auto_105499 ?auto_105500 ) ) ( not ( = ?auto_105497 ?auto_105500 ) ) ( not ( = ?auto_105501 ?auto_105500 ) ) ( ON ?auto_105495 ?auto_105494 ) ( CLEAR ?auto_105495 ) ( ON-TABLE ?auto_105500 ) ( HOLDING ?auto_105496 ) ( CLEAR ?auto_105501 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105498 ?auto_105499 ?auto_105497 ?auto_105501 ?auto_105496 )
      ( MAKE-2PILE ?auto_105494 ?auto_105495 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105502 - BLOCK
      ?auto_105503 - BLOCK
    )
    :vars
    (
      ?auto_105504 - BLOCK
      ?auto_105505 - BLOCK
      ?auto_105506 - BLOCK
      ?auto_105508 - BLOCK
      ?auto_105509 - BLOCK
      ?auto_105507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105502 ?auto_105503 ) ) ( not ( = ?auto_105502 ?auto_105504 ) ) ( not ( = ?auto_105503 ?auto_105504 ) ) ( ON-TABLE ?auto_105505 ) ( ON ?auto_105506 ?auto_105505 ) ( ON ?auto_105508 ?auto_105506 ) ( ON ?auto_105509 ?auto_105508 ) ( not ( = ?auto_105505 ?auto_105506 ) ) ( not ( = ?auto_105505 ?auto_105508 ) ) ( not ( = ?auto_105505 ?auto_105509 ) ) ( not ( = ?auto_105505 ?auto_105504 ) ) ( not ( = ?auto_105505 ?auto_105503 ) ) ( not ( = ?auto_105505 ?auto_105502 ) ) ( not ( = ?auto_105506 ?auto_105508 ) ) ( not ( = ?auto_105506 ?auto_105509 ) ) ( not ( = ?auto_105506 ?auto_105504 ) ) ( not ( = ?auto_105506 ?auto_105503 ) ) ( not ( = ?auto_105506 ?auto_105502 ) ) ( not ( = ?auto_105508 ?auto_105509 ) ) ( not ( = ?auto_105508 ?auto_105504 ) ) ( not ( = ?auto_105508 ?auto_105503 ) ) ( not ( = ?auto_105508 ?auto_105502 ) ) ( not ( = ?auto_105509 ?auto_105504 ) ) ( not ( = ?auto_105509 ?auto_105503 ) ) ( not ( = ?auto_105509 ?auto_105502 ) ) ( ON ?auto_105502 ?auto_105507 ) ( not ( = ?auto_105502 ?auto_105507 ) ) ( not ( = ?auto_105503 ?auto_105507 ) ) ( not ( = ?auto_105504 ?auto_105507 ) ) ( not ( = ?auto_105505 ?auto_105507 ) ) ( not ( = ?auto_105506 ?auto_105507 ) ) ( not ( = ?auto_105508 ?auto_105507 ) ) ( not ( = ?auto_105509 ?auto_105507 ) ) ( ON ?auto_105503 ?auto_105502 ) ( ON-TABLE ?auto_105507 ) ( CLEAR ?auto_105509 ) ( ON ?auto_105504 ?auto_105503 ) ( CLEAR ?auto_105504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105507 ?auto_105502 ?auto_105503 )
      ( MAKE-2PILE ?auto_105502 ?auto_105503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105510 - BLOCK
      ?auto_105511 - BLOCK
    )
    :vars
    (
      ?auto_105513 - BLOCK
      ?auto_105517 - BLOCK
      ?auto_105516 - BLOCK
      ?auto_105512 - BLOCK
      ?auto_105514 - BLOCK
      ?auto_105515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105510 ?auto_105511 ) ) ( not ( = ?auto_105510 ?auto_105513 ) ) ( not ( = ?auto_105511 ?auto_105513 ) ) ( ON-TABLE ?auto_105517 ) ( ON ?auto_105516 ?auto_105517 ) ( ON ?auto_105512 ?auto_105516 ) ( not ( = ?auto_105517 ?auto_105516 ) ) ( not ( = ?auto_105517 ?auto_105512 ) ) ( not ( = ?auto_105517 ?auto_105514 ) ) ( not ( = ?auto_105517 ?auto_105513 ) ) ( not ( = ?auto_105517 ?auto_105511 ) ) ( not ( = ?auto_105517 ?auto_105510 ) ) ( not ( = ?auto_105516 ?auto_105512 ) ) ( not ( = ?auto_105516 ?auto_105514 ) ) ( not ( = ?auto_105516 ?auto_105513 ) ) ( not ( = ?auto_105516 ?auto_105511 ) ) ( not ( = ?auto_105516 ?auto_105510 ) ) ( not ( = ?auto_105512 ?auto_105514 ) ) ( not ( = ?auto_105512 ?auto_105513 ) ) ( not ( = ?auto_105512 ?auto_105511 ) ) ( not ( = ?auto_105512 ?auto_105510 ) ) ( not ( = ?auto_105514 ?auto_105513 ) ) ( not ( = ?auto_105514 ?auto_105511 ) ) ( not ( = ?auto_105514 ?auto_105510 ) ) ( ON ?auto_105510 ?auto_105515 ) ( not ( = ?auto_105510 ?auto_105515 ) ) ( not ( = ?auto_105511 ?auto_105515 ) ) ( not ( = ?auto_105513 ?auto_105515 ) ) ( not ( = ?auto_105517 ?auto_105515 ) ) ( not ( = ?auto_105516 ?auto_105515 ) ) ( not ( = ?auto_105512 ?auto_105515 ) ) ( not ( = ?auto_105514 ?auto_105515 ) ) ( ON ?auto_105511 ?auto_105510 ) ( ON-TABLE ?auto_105515 ) ( ON ?auto_105513 ?auto_105511 ) ( CLEAR ?auto_105513 ) ( HOLDING ?auto_105514 ) ( CLEAR ?auto_105512 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105517 ?auto_105516 ?auto_105512 ?auto_105514 )
      ( MAKE-2PILE ?auto_105510 ?auto_105511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105518 - BLOCK
      ?auto_105519 - BLOCK
    )
    :vars
    (
      ?auto_105521 - BLOCK
      ?auto_105524 - BLOCK
      ?auto_105520 - BLOCK
      ?auto_105525 - BLOCK
      ?auto_105522 - BLOCK
      ?auto_105523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105518 ?auto_105519 ) ) ( not ( = ?auto_105518 ?auto_105521 ) ) ( not ( = ?auto_105519 ?auto_105521 ) ) ( ON-TABLE ?auto_105524 ) ( ON ?auto_105520 ?auto_105524 ) ( ON ?auto_105525 ?auto_105520 ) ( not ( = ?auto_105524 ?auto_105520 ) ) ( not ( = ?auto_105524 ?auto_105525 ) ) ( not ( = ?auto_105524 ?auto_105522 ) ) ( not ( = ?auto_105524 ?auto_105521 ) ) ( not ( = ?auto_105524 ?auto_105519 ) ) ( not ( = ?auto_105524 ?auto_105518 ) ) ( not ( = ?auto_105520 ?auto_105525 ) ) ( not ( = ?auto_105520 ?auto_105522 ) ) ( not ( = ?auto_105520 ?auto_105521 ) ) ( not ( = ?auto_105520 ?auto_105519 ) ) ( not ( = ?auto_105520 ?auto_105518 ) ) ( not ( = ?auto_105525 ?auto_105522 ) ) ( not ( = ?auto_105525 ?auto_105521 ) ) ( not ( = ?auto_105525 ?auto_105519 ) ) ( not ( = ?auto_105525 ?auto_105518 ) ) ( not ( = ?auto_105522 ?auto_105521 ) ) ( not ( = ?auto_105522 ?auto_105519 ) ) ( not ( = ?auto_105522 ?auto_105518 ) ) ( ON ?auto_105518 ?auto_105523 ) ( not ( = ?auto_105518 ?auto_105523 ) ) ( not ( = ?auto_105519 ?auto_105523 ) ) ( not ( = ?auto_105521 ?auto_105523 ) ) ( not ( = ?auto_105524 ?auto_105523 ) ) ( not ( = ?auto_105520 ?auto_105523 ) ) ( not ( = ?auto_105525 ?auto_105523 ) ) ( not ( = ?auto_105522 ?auto_105523 ) ) ( ON ?auto_105519 ?auto_105518 ) ( ON-TABLE ?auto_105523 ) ( ON ?auto_105521 ?auto_105519 ) ( CLEAR ?auto_105525 ) ( ON ?auto_105522 ?auto_105521 ) ( CLEAR ?auto_105522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105523 ?auto_105518 ?auto_105519 ?auto_105521 )
      ( MAKE-2PILE ?auto_105518 ?auto_105519 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105526 - BLOCK
      ?auto_105527 - BLOCK
    )
    :vars
    (
      ?auto_105531 - BLOCK
      ?auto_105532 - BLOCK
      ?auto_105530 - BLOCK
      ?auto_105533 - BLOCK
      ?auto_105528 - BLOCK
      ?auto_105529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105526 ?auto_105527 ) ) ( not ( = ?auto_105526 ?auto_105531 ) ) ( not ( = ?auto_105527 ?auto_105531 ) ) ( ON-TABLE ?auto_105532 ) ( ON ?auto_105530 ?auto_105532 ) ( not ( = ?auto_105532 ?auto_105530 ) ) ( not ( = ?auto_105532 ?auto_105533 ) ) ( not ( = ?auto_105532 ?auto_105528 ) ) ( not ( = ?auto_105532 ?auto_105531 ) ) ( not ( = ?auto_105532 ?auto_105527 ) ) ( not ( = ?auto_105532 ?auto_105526 ) ) ( not ( = ?auto_105530 ?auto_105533 ) ) ( not ( = ?auto_105530 ?auto_105528 ) ) ( not ( = ?auto_105530 ?auto_105531 ) ) ( not ( = ?auto_105530 ?auto_105527 ) ) ( not ( = ?auto_105530 ?auto_105526 ) ) ( not ( = ?auto_105533 ?auto_105528 ) ) ( not ( = ?auto_105533 ?auto_105531 ) ) ( not ( = ?auto_105533 ?auto_105527 ) ) ( not ( = ?auto_105533 ?auto_105526 ) ) ( not ( = ?auto_105528 ?auto_105531 ) ) ( not ( = ?auto_105528 ?auto_105527 ) ) ( not ( = ?auto_105528 ?auto_105526 ) ) ( ON ?auto_105526 ?auto_105529 ) ( not ( = ?auto_105526 ?auto_105529 ) ) ( not ( = ?auto_105527 ?auto_105529 ) ) ( not ( = ?auto_105531 ?auto_105529 ) ) ( not ( = ?auto_105532 ?auto_105529 ) ) ( not ( = ?auto_105530 ?auto_105529 ) ) ( not ( = ?auto_105533 ?auto_105529 ) ) ( not ( = ?auto_105528 ?auto_105529 ) ) ( ON ?auto_105527 ?auto_105526 ) ( ON-TABLE ?auto_105529 ) ( ON ?auto_105531 ?auto_105527 ) ( ON ?auto_105528 ?auto_105531 ) ( CLEAR ?auto_105528 ) ( HOLDING ?auto_105533 ) ( CLEAR ?auto_105530 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105532 ?auto_105530 ?auto_105533 )
      ( MAKE-2PILE ?auto_105526 ?auto_105527 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105534 - BLOCK
      ?auto_105535 - BLOCK
    )
    :vars
    (
      ?auto_105538 - BLOCK
      ?auto_105540 - BLOCK
      ?auto_105539 - BLOCK
      ?auto_105537 - BLOCK
      ?auto_105536 - BLOCK
      ?auto_105541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105534 ?auto_105535 ) ) ( not ( = ?auto_105534 ?auto_105538 ) ) ( not ( = ?auto_105535 ?auto_105538 ) ) ( ON-TABLE ?auto_105540 ) ( ON ?auto_105539 ?auto_105540 ) ( not ( = ?auto_105540 ?auto_105539 ) ) ( not ( = ?auto_105540 ?auto_105537 ) ) ( not ( = ?auto_105540 ?auto_105536 ) ) ( not ( = ?auto_105540 ?auto_105538 ) ) ( not ( = ?auto_105540 ?auto_105535 ) ) ( not ( = ?auto_105540 ?auto_105534 ) ) ( not ( = ?auto_105539 ?auto_105537 ) ) ( not ( = ?auto_105539 ?auto_105536 ) ) ( not ( = ?auto_105539 ?auto_105538 ) ) ( not ( = ?auto_105539 ?auto_105535 ) ) ( not ( = ?auto_105539 ?auto_105534 ) ) ( not ( = ?auto_105537 ?auto_105536 ) ) ( not ( = ?auto_105537 ?auto_105538 ) ) ( not ( = ?auto_105537 ?auto_105535 ) ) ( not ( = ?auto_105537 ?auto_105534 ) ) ( not ( = ?auto_105536 ?auto_105538 ) ) ( not ( = ?auto_105536 ?auto_105535 ) ) ( not ( = ?auto_105536 ?auto_105534 ) ) ( ON ?auto_105534 ?auto_105541 ) ( not ( = ?auto_105534 ?auto_105541 ) ) ( not ( = ?auto_105535 ?auto_105541 ) ) ( not ( = ?auto_105538 ?auto_105541 ) ) ( not ( = ?auto_105540 ?auto_105541 ) ) ( not ( = ?auto_105539 ?auto_105541 ) ) ( not ( = ?auto_105537 ?auto_105541 ) ) ( not ( = ?auto_105536 ?auto_105541 ) ) ( ON ?auto_105535 ?auto_105534 ) ( ON-TABLE ?auto_105541 ) ( ON ?auto_105538 ?auto_105535 ) ( ON ?auto_105536 ?auto_105538 ) ( CLEAR ?auto_105539 ) ( ON ?auto_105537 ?auto_105536 ) ( CLEAR ?auto_105537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105541 ?auto_105534 ?auto_105535 ?auto_105538 ?auto_105536 )
      ( MAKE-2PILE ?auto_105534 ?auto_105535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105542 - BLOCK
      ?auto_105543 - BLOCK
    )
    :vars
    (
      ?auto_105549 - BLOCK
      ?auto_105548 - BLOCK
      ?auto_105544 - BLOCK
      ?auto_105547 - BLOCK
      ?auto_105546 - BLOCK
      ?auto_105545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105542 ?auto_105543 ) ) ( not ( = ?auto_105542 ?auto_105549 ) ) ( not ( = ?auto_105543 ?auto_105549 ) ) ( ON-TABLE ?auto_105548 ) ( not ( = ?auto_105548 ?auto_105544 ) ) ( not ( = ?auto_105548 ?auto_105547 ) ) ( not ( = ?auto_105548 ?auto_105546 ) ) ( not ( = ?auto_105548 ?auto_105549 ) ) ( not ( = ?auto_105548 ?auto_105543 ) ) ( not ( = ?auto_105548 ?auto_105542 ) ) ( not ( = ?auto_105544 ?auto_105547 ) ) ( not ( = ?auto_105544 ?auto_105546 ) ) ( not ( = ?auto_105544 ?auto_105549 ) ) ( not ( = ?auto_105544 ?auto_105543 ) ) ( not ( = ?auto_105544 ?auto_105542 ) ) ( not ( = ?auto_105547 ?auto_105546 ) ) ( not ( = ?auto_105547 ?auto_105549 ) ) ( not ( = ?auto_105547 ?auto_105543 ) ) ( not ( = ?auto_105547 ?auto_105542 ) ) ( not ( = ?auto_105546 ?auto_105549 ) ) ( not ( = ?auto_105546 ?auto_105543 ) ) ( not ( = ?auto_105546 ?auto_105542 ) ) ( ON ?auto_105542 ?auto_105545 ) ( not ( = ?auto_105542 ?auto_105545 ) ) ( not ( = ?auto_105543 ?auto_105545 ) ) ( not ( = ?auto_105549 ?auto_105545 ) ) ( not ( = ?auto_105548 ?auto_105545 ) ) ( not ( = ?auto_105544 ?auto_105545 ) ) ( not ( = ?auto_105547 ?auto_105545 ) ) ( not ( = ?auto_105546 ?auto_105545 ) ) ( ON ?auto_105543 ?auto_105542 ) ( ON-TABLE ?auto_105545 ) ( ON ?auto_105549 ?auto_105543 ) ( ON ?auto_105546 ?auto_105549 ) ( ON ?auto_105547 ?auto_105546 ) ( CLEAR ?auto_105547 ) ( HOLDING ?auto_105544 ) ( CLEAR ?auto_105548 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105548 ?auto_105544 )
      ( MAKE-2PILE ?auto_105542 ?auto_105543 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105550 - BLOCK
      ?auto_105551 - BLOCK
    )
    :vars
    (
      ?auto_105553 - BLOCK
      ?auto_105555 - BLOCK
      ?auto_105557 - BLOCK
      ?auto_105556 - BLOCK
      ?auto_105554 - BLOCK
      ?auto_105552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105550 ?auto_105551 ) ) ( not ( = ?auto_105550 ?auto_105553 ) ) ( not ( = ?auto_105551 ?auto_105553 ) ) ( ON-TABLE ?auto_105555 ) ( not ( = ?auto_105555 ?auto_105557 ) ) ( not ( = ?auto_105555 ?auto_105556 ) ) ( not ( = ?auto_105555 ?auto_105554 ) ) ( not ( = ?auto_105555 ?auto_105553 ) ) ( not ( = ?auto_105555 ?auto_105551 ) ) ( not ( = ?auto_105555 ?auto_105550 ) ) ( not ( = ?auto_105557 ?auto_105556 ) ) ( not ( = ?auto_105557 ?auto_105554 ) ) ( not ( = ?auto_105557 ?auto_105553 ) ) ( not ( = ?auto_105557 ?auto_105551 ) ) ( not ( = ?auto_105557 ?auto_105550 ) ) ( not ( = ?auto_105556 ?auto_105554 ) ) ( not ( = ?auto_105556 ?auto_105553 ) ) ( not ( = ?auto_105556 ?auto_105551 ) ) ( not ( = ?auto_105556 ?auto_105550 ) ) ( not ( = ?auto_105554 ?auto_105553 ) ) ( not ( = ?auto_105554 ?auto_105551 ) ) ( not ( = ?auto_105554 ?auto_105550 ) ) ( ON ?auto_105550 ?auto_105552 ) ( not ( = ?auto_105550 ?auto_105552 ) ) ( not ( = ?auto_105551 ?auto_105552 ) ) ( not ( = ?auto_105553 ?auto_105552 ) ) ( not ( = ?auto_105555 ?auto_105552 ) ) ( not ( = ?auto_105557 ?auto_105552 ) ) ( not ( = ?auto_105556 ?auto_105552 ) ) ( not ( = ?auto_105554 ?auto_105552 ) ) ( ON ?auto_105551 ?auto_105550 ) ( ON-TABLE ?auto_105552 ) ( ON ?auto_105553 ?auto_105551 ) ( ON ?auto_105554 ?auto_105553 ) ( ON ?auto_105556 ?auto_105554 ) ( CLEAR ?auto_105555 ) ( ON ?auto_105557 ?auto_105556 ) ( CLEAR ?auto_105557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105552 ?auto_105550 ?auto_105551 ?auto_105553 ?auto_105554 ?auto_105556 )
      ( MAKE-2PILE ?auto_105550 ?auto_105551 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105558 - BLOCK
      ?auto_105559 - BLOCK
    )
    :vars
    (
      ?auto_105563 - BLOCK
      ?auto_105564 - BLOCK
      ?auto_105565 - BLOCK
      ?auto_105562 - BLOCK
      ?auto_105561 - BLOCK
      ?auto_105560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105558 ?auto_105559 ) ) ( not ( = ?auto_105558 ?auto_105563 ) ) ( not ( = ?auto_105559 ?auto_105563 ) ) ( not ( = ?auto_105564 ?auto_105565 ) ) ( not ( = ?auto_105564 ?auto_105562 ) ) ( not ( = ?auto_105564 ?auto_105561 ) ) ( not ( = ?auto_105564 ?auto_105563 ) ) ( not ( = ?auto_105564 ?auto_105559 ) ) ( not ( = ?auto_105564 ?auto_105558 ) ) ( not ( = ?auto_105565 ?auto_105562 ) ) ( not ( = ?auto_105565 ?auto_105561 ) ) ( not ( = ?auto_105565 ?auto_105563 ) ) ( not ( = ?auto_105565 ?auto_105559 ) ) ( not ( = ?auto_105565 ?auto_105558 ) ) ( not ( = ?auto_105562 ?auto_105561 ) ) ( not ( = ?auto_105562 ?auto_105563 ) ) ( not ( = ?auto_105562 ?auto_105559 ) ) ( not ( = ?auto_105562 ?auto_105558 ) ) ( not ( = ?auto_105561 ?auto_105563 ) ) ( not ( = ?auto_105561 ?auto_105559 ) ) ( not ( = ?auto_105561 ?auto_105558 ) ) ( ON ?auto_105558 ?auto_105560 ) ( not ( = ?auto_105558 ?auto_105560 ) ) ( not ( = ?auto_105559 ?auto_105560 ) ) ( not ( = ?auto_105563 ?auto_105560 ) ) ( not ( = ?auto_105564 ?auto_105560 ) ) ( not ( = ?auto_105565 ?auto_105560 ) ) ( not ( = ?auto_105562 ?auto_105560 ) ) ( not ( = ?auto_105561 ?auto_105560 ) ) ( ON ?auto_105559 ?auto_105558 ) ( ON-TABLE ?auto_105560 ) ( ON ?auto_105563 ?auto_105559 ) ( ON ?auto_105561 ?auto_105563 ) ( ON ?auto_105562 ?auto_105561 ) ( ON ?auto_105565 ?auto_105562 ) ( CLEAR ?auto_105565 ) ( HOLDING ?auto_105564 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105564 )
      ( MAKE-2PILE ?auto_105558 ?auto_105559 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_105566 - BLOCK
      ?auto_105567 - BLOCK
    )
    :vars
    (
      ?auto_105568 - BLOCK
      ?auto_105569 - BLOCK
      ?auto_105572 - BLOCK
      ?auto_105573 - BLOCK
      ?auto_105570 - BLOCK
      ?auto_105571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105566 ?auto_105567 ) ) ( not ( = ?auto_105566 ?auto_105568 ) ) ( not ( = ?auto_105567 ?auto_105568 ) ) ( not ( = ?auto_105569 ?auto_105572 ) ) ( not ( = ?auto_105569 ?auto_105573 ) ) ( not ( = ?auto_105569 ?auto_105570 ) ) ( not ( = ?auto_105569 ?auto_105568 ) ) ( not ( = ?auto_105569 ?auto_105567 ) ) ( not ( = ?auto_105569 ?auto_105566 ) ) ( not ( = ?auto_105572 ?auto_105573 ) ) ( not ( = ?auto_105572 ?auto_105570 ) ) ( not ( = ?auto_105572 ?auto_105568 ) ) ( not ( = ?auto_105572 ?auto_105567 ) ) ( not ( = ?auto_105572 ?auto_105566 ) ) ( not ( = ?auto_105573 ?auto_105570 ) ) ( not ( = ?auto_105573 ?auto_105568 ) ) ( not ( = ?auto_105573 ?auto_105567 ) ) ( not ( = ?auto_105573 ?auto_105566 ) ) ( not ( = ?auto_105570 ?auto_105568 ) ) ( not ( = ?auto_105570 ?auto_105567 ) ) ( not ( = ?auto_105570 ?auto_105566 ) ) ( ON ?auto_105566 ?auto_105571 ) ( not ( = ?auto_105566 ?auto_105571 ) ) ( not ( = ?auto_105567 ?auto_105571 ) ) ( not ( = ?auto_105568 ?auto_105571 ) ) ( not ( = ?auto_105569 ?auto_105571 ) ) ( not ( = ?auto_105572 ?auto_105571 ) ) ( not ( = ?auto_105573 ?auto_105571 ) ) ( not ( = ?auto_105570 ?auto_105571 ) ) ( ON ?auto_105567 ?auto_105566 ) ( ON-TABLE ?auto_105571 ) ( ON ?auto_105568 ?auto_105567 ) ( ON ?auto_105570 ?auto_105568 ) ( ON ?auto_105573 ?auto_105570 ) ( ON ?auto_105572 ?auto_105573 ) ( ON ?auto_105569 ?auto_105572 ) ( CLEAR ?auto_105569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105571 ?auto_105566 ?auto_105567 ?auto_105568 ?auto_105570 ?auto_105573 ?auto_105572 )
      ( MAKE-2PILE ?auto_105566 ?auto_105567 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105578 - BLOCK
      ?auto_105579 - BLOCK
      ?auto_105580 - BLOCK
      ?auto_105581 - BLOCK
    )
    :vars
    (
      ?auto_105582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105582 ?auto_105581 ) ( CLEAR ?auto_105582 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105578 ) ( ON ?auto_105579 ?auto_105578 ) ( ON ?auto_105580 ?auto_105579 ) ( ON ?auto_105581 ?auto_105580 ) ( not ( = ?auto_105578 ?auto_105579 ) ) ( not ( = ?auto_105578 ?auto_105580 ) ) ( not ( = ?auto_105578 ?auto_105581 ) ) ( not ( = ?auto_105578 ?auto_105582 ) ) ( not ( = ?auto_105579 ?auto_105580 ) ) ( not ( = ?auto_105579 ?auto_105581 ) ) ( not ( = ?auto_105579 ?auto_105582 ) ) ( not ( = ?auto_105580 ?auto_105581 ) ) ( not ( = ?auto_105580 ?auto_105582 ) ) ( not ( = ?auto_105581 ?auto_105582 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105582 ?auto_105581 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105583 - BLOCK
      ?auto_105584 - BLOCK
      ?auto_105585 - BLOCK
      ?auto_105586 - BLOCK
    )
    :vars
    (
      ?auto_105587 - BLOCK
      ?auto_105588 - BLOCK
      ?auto_105589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105587 ?auto_105586 ) ( CLEAR ?auto_105587 ) ( ON-TABLE ?auto_105583 ) ( ON ?auto_105584 ?auto_105583 ) ( ON ?auto_105585 ?auto_105584 ) ( ON ?auto_105586 ?auto_105585 ) ( not ( = ?auto_105583 ?auto_105584 ) ) ( not ( = ?auto_105583 ?auto_105585 ) ) ( not ( = ?auto_105583 ?auto_105586 ) ) ( not ( = ?auto_105583 ?auto_105587 ) ) ( not ( = ?auto_105584 ?auto_105585 ) ) ( not ( = ?auto_105584 ?auto_105586 ) ) ( not ( = ?auto_105584 ?auto_105587 ) ) ( not ( = ?auto_105585 ?auto_105586 ) ) ( not ( = ?auto_105585 ?auto_105587 ) ) ( not ( = ?auto_105586 ?auto_105587 ) ) ( HOLDING ?auto_105588 ) ( CLEAR ?auto_105589 ) ( not ( = ?auto_105583 ?auto_105588 ) ) ( not ( = ?auto_105583 ?auto_105589 ) ) ( not ( = ?auto_105584 ?auto_105588 ) ) ( not ( = ?auto_105584 ?auto_105589 ) ) ( not ( = ?auto_105585 ?auto_105588 ) ) ( not ( = ?auto_105585 ?auto_105589 ) ) ( not ( = ?auto_105586 ?auto_105588 ) ) ( not ( = ?auto_105586 ?auto_105589 ) ) ( not ( = ?auto_105587 ?auto_105588 ) ) ( not ( = ?auto_105587 ?auto_105589 ) ) ( not ( = ?auto_105588 ?auto_105589 ) ) )
    :subtasks
    ( ( !STACK ?auto_105588 ?auto_105589 )
      ( MAKE-4PILE ?auto_105583 ?auto_105584 ?auto_105585 ?auto_105586 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105590 - BLOCK
      ?auto_105591 - BLOCK
      ?auto_105592 - BLOCK
      ?auto_105593 - BLOCK
    )
    :vars
    (
      ?auto_105596 - BLOCK
      ?auto_105594 - BLOCK
      ?auto_105595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105596 ?auto_105593 ) ( ON-TABLE ?auto_105590 ) ( ON ?auto_105591 ?auto_105590 ) ( ON ?auto_105592 ?auto_105591 ) ( ON ?auto_105593 ?auto_105592 ) ( not ( = ?auto_105590 ?auto_105591 ) ) ( not ( = ?auto_105590 ?auto_105592 ) ) ( not ( = ?auto_105590 ?auto_105593 ) ) ( not ( = ?auto_105590 ?auto_105596 ) ) ( not ( = ?auto_105591 ?auto_105592 ) ) ( not ( = ?auto_105591 ?auto_105593 ) ) ( not ( = ?auto_105591 ?auto_105596 ) ) ( not ( = ?auto_105592 ?auto_105593 ) ) ( not ( = ?auto_105592 ?auto_105596 ) ) ( not ( = ?auto_105593 ?auto_105596 ) ) ( CLEAR ?auto_105594 ) ( not ( = ?auto_105590 ?auto_105595 ) ) ( not ( = ?auto_105590 ?auto_105594 ) ) ( not ( = ?auto_105591 ?auto_105595 ) ) ( not ( = ?auto_105591 ?auto_105594 ) ) ( not ( = ?auto_105592 ?auto_105595 ) ) ( not ( = ?auto_105592 ?auto_105594 ) ) ( not ( = ?auto_105593 ?auto_105595 ) ) ( not ( = ?auto_105593 ?auto_105594 ) ) ( not ( = ?auto_105596 ?auto_105595 ) ) ( not ( = ?auto_105596 ?auto_105594 ) ) ( not ( = ?auto_105595 ?auto_105594 ) ) ( ON ?auto_105595 ?auto_105596 ) ( CLEAR ?auto_105595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105590 ?auto_105591 ?auto_105592 ?auto_105593 ?auto_105596 )
      ( MAKE-4PILE ?auto_105590 ?auto_105591 ?auto_105592 ?auto_105593 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105597 - BLOCK
      ?auto_105598 - BLOCK
      ?auto_105599 - BLOCK
      ?auto_105600 - BLOCK
    )
    :vars
    (
      ?auto_105601 - BLOCK
      ?auto_105602 - BLOCK
      ?auto_105603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105601 ?auto_105600 ) ( ON-TABLE ?auto_105597 ) ( ON ?auto_105598 ?auto_105597 ) ( ON ?auto_105599 ?auto_105598 ) ( ON ?auto_105600 ?auto_105599 ) ( not ( = ?auto_105597 ?auto_105598 ) ) ( not ( = ?auto_105597 ?auto_105599 ) ) ( not ( = ?auto_105597 ?auto_105600 ) ) ( not ( = ?auto_105597 ?auto_105601 ) ) ( not ( = ?auto_105598 ?auto_105599 ) ) ( not ( = ?auto_105598 ?auto_105600 ) ) ( not ( = ?auto_105598 ?auto_105601 ) ) ( not ( = ?auto_105599 ?auto_105600 ) ) ( not ( = ?auto_105599 ?auto_105601 ) ) ( not ( = ?auto_105600 ?auto_105601 ) ) ( not ( = ?auto_105597 ?auto_105602 ) ) ( not ( = ?auto_105597 ?auto_105603 ) ) ( not ( = ?auto_105598 ?auto_105602 ) ) ( not ( = ?auto_105598 ?auto_105603 ) ) ( not ( = ?auto_105599 ?auto_105602 ) ) ( not ( = ?auto_105599 ?auto_105603 ) ) ( not ( = ?auto_105600 ?auto_105602 ) ) ( not ( = ?auto_105600 ?auto_105603 ) ) ( not ( = ?auto_105601 ?auto_105602 ) ) ( not ( = ?auto_105601 ?auto_105603 ) ) ( not ( = ?auto_105602 ?auto_105603 ) ) ( ON ?auto_105602 ?auto_105601 ) ( CLEAR ?auto_105602 ) ( HOLDING ?auto_105603 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105603 )
      ( MAKE-4PILE ?auto_105597 ?auto_105598 ?auto_105599 ?auto_105600 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105604 - BLOCK
      ?auto_105605 - BLOCK
      ?auto_105606 - BLOCK
      ?auto_105607 - BLOCK
    )
    :vars
    (
      ?auto_105610 - BLOCK
      ?auto_105608 - BLOCK
      ?auto_105609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105610 ?auto_105607 ) ( ON-TABLE ?auto_105604 ) ( ON ?auto_105605 ?auto_105604 ) ( ON ?auto_105606 ?auto_105605 ) ( ON ?auto_105607 ?auto_105606 ) ( not ( = ?auto_105604 ?auto_105605 ) ) ( not ( = ?auto_105604 ?auto_105606 ) ) ( not ( = ?auto_105604 ?auto_105607 ) ) ( not ( = ?auto_105604 ?auto_105610 ) ) ( not ( = ?auto_105605 ?auto_105606 ) ) ( not ( = ?auto_105605 ?auto_105607 ) ) ( not ( = ?auto_105605 ?auto_105610 ) ) ( not ( = ?auto_105606 ?auto_105607 ) ) ( not ( = ?auto_105606 ?auto_105610 ) ) ( not ( = ?auto_105607 ?auto_105610 ) ) ( not ( = ?auto_105604 ?auto_105608 ) ) ( not ( = ?auto_105604 ?auto_105609 ) ) ( not ( = ?auto_105605 ?auto_105608 ) ) ( not ( = ?auto_105605 ?auto_105609 ) ) ( not ( = ?auto_105606 ?auto_105608 ) ) ( not ( = ?auto_105606 ?auto_105609 ) ) ( not ( = ?auto_105607 ?auto_105608 ) ) ( not ( = ?auto_105607 ?auto_105609 ) ) ( not ( = ?auto_105610 ?auto_105608 ) ) ( not ( = ?auto_105610 ?auto_105609 ) ) ( not ( = ?auto_105608 ?auto_105609 ) ) ( ON ?auto_105608 ?auto_105610 ) ( ON ?auto_105609 ?auto_105608 ) ( CLEAR ?auto_105609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105604 ?auto_105605 ?auto_105606 ?auto_105607 ?auto_105610 ?auto_105608 )
      ( MAKE-4PILE ?auto_105604 ?auto_105605 ?auto_105606 ?auto_105607 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105611 - BLOCK
      ?auto_105612 - BLOCK
      ?auto_105613 - BLOCK
      ?auto_105614 - BLOCK
    )
    :vars
    (
      ?auto_105616 - BLOCK
      ?auto_105617 - BLOCK
      ?auto_105615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105616 ?auto_105614 ) ( ON-TABLE ?auto_105611 ) ( ON ?auto_105612 ?auto_105611 ) ( ON ?auto_105613 ?auto_105612 ) ( ON ?auto_105614 ?auto_105613 ) ( not ( = ?auto_105611 ?auto_105612 ) ) ( not ( = ?auto_105611 ?auto_105613 ) ) ( not ( = ?auto_105611 ?auto_105614 ) ) ( not ( = ?auto_105611 ?auto_105616 ) ) ( not ( = ?auto_105612 ?auto_105613 ) ) ( not ( = ?auto_105612 ?auto_105614 ) ) ( not ( = ?auto_105612 ?auto_105616 ) ) ( not ( = ?auto_105613 ?auto_105614 ) ) ( not ( = ?auto_105613 ?auto_105616 ) ) ( not ( = ?auto_105614 ?auto_105616 ) ) ( not ( = ?auto_105611 ?auto_105617 ) ) ( not ( = ?auto_105611 ?auto_105615 ) ) ( not ( = ?auto_105612 ?auto_105617 ) ) ( not ( = ?auto_105612 ?auto_105615 ) ) ( not ( = ?auto_105613 ?auto_105617 ) ) ( not ( = ?auto_105613 ?auto_105615 ) ) ( not ( = ?auto_105614 ?auto_105617 ) ) ( not ( = ?auto_105614 ?auto_105615 ) ) ( not ( = ?auto_105616 ?auto_105617 ) ) ( not ( = ?auto_105616 ?auto_105615 ) ) ( not ( = ?auto_105617 ?auto_105615 ) ) ( ON ?auto_105617 ?auto_105616 ) ( HOLDING ?auto_105615 ) ( CLEAR ?auto_105617 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105611 ?auto_105612 ?auto_105613 ?auto_105614 ?auto_105616 ?auto_105617 ?auto_105615 )
      ( MAKE-4PILE ?auto_105611 ?auto_105612 ?auto_105613 ?auto_105614 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105618 - BLOCK
      ?auto_105619 - BLOCK
      ?auto_105620 - BLOCK
      ?auto_105621 - BLOCK
    )
    :vars
    (
      ?auto_105624 - BLOCK
      ?auto_105622 - BLOCK
      ?auto_105623 - BLOCK
      ?auto_105625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105624 ?auto_105621 ) ( ON-TABLE ?auto_105618 ) ( ON ?auto_105619 ?auto_105618 ) ( ON ?auto_105620 ?auto_105619 ) ( ON ?auto_105621 ?auto_105620 ) ( not ( = ?auto_105618 ?auto_105619 ) ) ( not ( = ?auto_105618 ?auto_105620 ) ) ( not ( = ?auto_105618 ?auto_105621 ) ) ( not ( = ?auto_105618 ?auto_105624 ) ) ( not ( = ?auto_105619 ?auto_105620 ) ) ( not ( = ?auto_105619 ?auto_105621 ) ) ( not ( = ?auto_105619 ?auto_105624 ) ) ( not ( = ?auto_105620 ?auto_105621 ) ) ( not ( = ?auto_105620 ?auto_105624 ) ) ( not ( = ?auto_105621 ?auto_105624 ) ) ( not ( = ?auto_105618 ?auto_105622 ) ) ( not ( = ?auto_105618 ?auto_105623 ) ) ( not ( = ?auto_105619 ?auto_105622 ) ) ( not ( = ?auto_105619 ?auto_105623 ) ) ( not ( = ?auto_105620 ?auto_105622 ) ) ( not ( = ?auto_105620 ?auto_105623 ) ) ( not ( = ?auto_105621 ?auto_105622 ) ) ( not ( = ?auto_105621 ?auto_105623 ) ) ( not ( = ?auto_105624 ?auto_105622 ) ) ( not ( = ?auto_105624 ?auto_105623 ) ) ( not ( = ?auto_105622 ?auto_105623 ) ) ( ON ?auto_105622 ?auto_105624 ) ( CLEAR ?auto_105622 ) ( ON ?auto_105623 ?auto_105625 ) ( CLEAR ?auto_105623 ) ( HAND-EMPTY ) ( not ( = ?auto_105618 ?auto_105625 ) ) ( not ( = ?auto_105619 ?auto_105625 ) ) ( not ( = ?auto_105620 ?auto_105625 ) ) ( not ( = ?auto_105621 ?auto_105625 ) ) ( not ( = ?auto_105624 ?auto_105625 ) ) ( not ( = ?auto_105622 ?auto_105625 ) ) ( not ( = ?auto_105623 ?auto_105625 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105623 ?auto_105625 )
      ( MAKE-4PILE ?auto_105618 ?auto_105619 ?auto_105620 ?auto_105621 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105626 - BLOCK
      ?auto_105627 - BLOCK
      ?auto_105628 - BLOCK
      ?auto_105629 - BLOCK
    )
    :vars
    (
      ?auto_105633 - BLOCK
      ?auto_105631 - BLOCK
      ?auto_105630 - BLOCK
      ?auto_105632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105633 ?auto_105629 ) ( ON-TABLE ?auto_105626 ) ( ON ?auto_105627 ?auto_105626 ) ( ON ?auto_105628 ?auto_105627 ) ( ON ?auto_105629 ?auto_105628 ) ( not ( = ?auto_105626 ?auto_105627 ) ) ( not ( = ?auto_105626 ?auto_105628 ) ) ( not ( = ?auto_105626 ?auto_105629 ) ) ( not ( = ?auto_105626 ?auto_105633 ) ) ( not ( = ?auto_105627 ?auto_105628 ) ) ( not ( = ?auto_105627 ?auto_105629 ) ) ( not ( = ?auto_105627 ?auto_105633 ) ) ( not ( = ?auto_105628 ?auto_105629 ) ) ( not ( = ?auto_105628 ?auto_105633 ) ) ( not ( = ?auto_105629 ?auto_105633 ) ) ( not ( = ?auto_105626 ?auto_105631 ) ) ( not ( = ?auto_105626 ?auto_105630 ) ) ( not ( = ?auto_105627 ?auto_105631 ) ) ( not ( = ?auto_105627 ?auto_105630 ) ) ( not ( = ?auto_105628 ?auto_105631 ) ) ( not ( = ?auto_105628 ?auto_105630 ) ) ( not ( = ?auto_105629 ?auto_105631 ) ) ( not ( = ?auto_105629 ?auto_105630 ) ) ( not ( = ?auto_105633 ?auto_105631 ) ) ( not ( = ?auto_105633 ?auto_105630 ) ) ( not ( = ?auto_105631 ?auto_105630 ) ) ( ON ?auto_105630 ?auto_105632 ) ( CLEAR ?auto_105630 ) ( not ( = ?auto_105626 ?auto_105632 ) ) ( not ( = ?auto_105627 ?auto_105632 ) ) ( not ( = ?auto_105628 ?auto_105632 ) ) ( not ( = ?auto_105629 ?auto_105632 ) ) ( not ( = ?auto_105633 ?auto_105632 ) ) ( not ( = ?auto_105631 ?auto_105632 ) ) ( not ( = ?auto_105630 ?auto_105632 ) ) ( HOLDING ?auto_105631 ) ( CLEAR ?auto_105633 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105626 ?auto_105627 ?auto_105628 ?auto_105629 ?auto_105633 ?auto_105631 )
      ( MAKE-4PILE ?auto_105626 ?auto_105627 ?auto_105628 ?auto_105629 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105634 - BLOCK
      ?auto_105635 - BLOCK
      ?auto_105636 - BLOCK
      ?auto_105637 - BLOCK
    )
    :vars
    (
      ?auto_105638 - BLOCK
      ?auto_105639 - BLOCK
      ?auto_105640 - BLOCK
      ?auto_105641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105638 ?auto_105637 ) ( ON-TABLE ?auto_105634 ) ( ON ?auto_105635 ?auto_105634 ) ( ON ?auto_105636 ?auto_105635 ) ( ON ?auto_105637 ?auto_105636 ) ( not ( = ?auto_105634 ?auto_105635 ) ) ( not ( = ?auto_105634 ?auto_105636 ) ) ( not ( = ?auto_105634 ?auto_105637 ) ) ( not ( = ?auto_105634 ?auto_105638 ) ) ( not ( = ?auto_105635 ?auto_105636 ) ) ( not ( = ?auto_105635 ?auto_105637 ) ) ( not ( = ?auto_105635 ?auto_105638 ) ) ( not ( = ?auto_105636 ?auto_105637 ) ) ( not ( = ?auto_105636 ?auto_105638 ) ) ( not ( = ?auto_105637 ?auto_105638 ) ) ( not ( = ?auto_105634 ?auto_105639 ) ) ( not ( = ?auto_105634 ?auto_105640 ) ) ( not ( = ?auto_105635 ?auto_105639 ) ) ( not ( = ?auto_105635 ?auto_105640 ) ) ( not ( = ?auto_105636 ?auto_105639 ) ) ( not ( = ?auto_105636 ?auto_105640 ) ) ( not ( = ?auto_105637 ?auto_105639 ) ) ( not ( = ?auto_105637 ?auto_105640 ) ) ( not ( = ?auto_105638 ?auto_105639 ) ) ( not ( = ?auto_105638 ?auto_105640 ) ) ( not ( = ?auto_105639 ?auto_105640 ) ) ( ON ?auto_105640 ?auto_105641 ) ( not ( = ?auto_105634 ?auto_105641 ) ) ( not ( = ?auto_105635 ?auto_105641 ) ) ( not ( = ?auto_105636 ?auto_105641 ) ) ( not ( = ?auto_105637 ?auto_105641 ) ) ( not ( = ?auto_105638 ?auto_105641 ) ) ( not ( = ?auto_105639 ?auto_105641 ) ) ( not ( = ?auto_105640 ?auto_105641 ) ) ( CLEAR ?auto_105638 ) ( ON ?auto_105639 ?auto_105640 ) ( CLEAR ?auto_105639 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105641 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105641 ?auto_105640 )
      ( MAKE-4PILE ?auto_105634 ?auto_105635 ?auto_105636 ?auto_105637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105658 - BLOCK
      ?auto_105659 - BLOCK
      ?auto_105660 - BLOCK
      ?auto_105661 - BLOCK
    )
    :vars
    (
      ?auto_105662 - BLOCK
      ?auto_105664 - BLOCK
      ?auto_105665 - BLOCK
      ?auto_105663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105658 ) ( ON ?auto_105659 ?auto_105658 ) ( ON ?auto_105660 ?auto_105659 ) ( not ( = ?auto_105658 ?auto_105659 ) ) ( not ( = ?auto_105658 ?auto_105660 ) ) ( not ( = ?auto_105658 ?auto_105661 ) ) ( not ( = ?auto_105658 ?auto_105662 ) ) ( not ( = ?auto_105659 ?auto_105660 ) ) ( not ( = ?auto_105659 ?auto_105661 ) ) ( not ( = ?auto_105659 ?auto_105662 ) ) ( not ( = ?auto_105660 ?auto_105661 ) ) ( not ( = ?auto_105660 ?auto_105662 ) ) ( not ( = ?auto_105661 ?auto_105662 ) ) ( not ( = ?auto_105658 ?auto_105664 ) ) ( not ( = ?auto_105658 ?auto_105665 ) ) ( not ( = ?auto_105659 ?auto_105664 ) ) ( not ( = ?auto_105659 ?auto_105665 ) ) ( not ( = ?auto_105660 ?auto_105664 ) ) ( not ( = ?auto_105660 ?auto_105665 ) ) ( not ( = ?auto_105661 ?auto_105664 ) ) ( not ( = ?auto_105661 ?auto_105665 ) ) ( not ( = ?auto_105662 ?auto_105664 ) ) ( not ( = ?auto_105662 ?auto_105665 ) ) ( not ( = ?auto_105664 ?auto_105665 ) ) ( ON ?auto_105665 ?auto_105663 ) ( not ( = ?auto_105658 ?auto_105663 ) ) ( not ( = ?auto_105659 ?auto_105663 ) ) ( not ( = ?auto_105660 ?auto_105663 ) ) ( not ( = ?auto_105661 ?auto_105663 ) ) ( not ( = ?auto_105662 ?auto_105663 ) ) ( not ( = ?auto_105664 ?auto_105663 ) ) ( not ( = ?auto_105665 ?auto_105663 ) ) ( ON ?auto_105664 ?auto_105665 ) ( ON-TABLE ?auto_105663 ) ( ON ?auto_105662 ?auto_105664 ) ( CLEAR ?auto_105662 ) ( HOLDING ?auto_105661 ) ( CLEAR ?auto_105660 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105658 ?auto_105659 ?auto_105660 ?auto_105661 ?auto_105662 )
      ( MAKE-4PILE ?auto_105658 ?auto_105659 ?auto_105660 ?auto_105661 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105666 - BLOCK
      ?auto_105667 - BLOCK
      ?auto_105668 - BLOCK
      ?auto_105669 - BLOCK
    )
    :vars
    (
      ?auto_105672 - BLOCK
      ?auto_105673 - BLOCK
      ?auto_105671 - BLOCK
      ?auto_105670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105666 ) ( ON ?auto_105667 ?auto_105666 ) ( ON ?auto_105668 ?auto_105667 ) ( not ( = ?auto_105666 ?auto_105667 ) ) ( not ( = ?auto_105666 ?auto_105668 ) ) ( not ( = ?auto_105666 ?auto_105669 ) ) ( not ( = ?auto_105666 ?auto_105672 ) ) ( not ( = ?auto_105667 ?auto_105668 ) ) ( not ( = ?auto_105667 ?auto_105669 ) ) ( not ( = ?auto_105667 ?auto_105672 ) ) ( not ( = ?auto_105668 ?auto_105669 ) ) ( not ( = ?auto_105668 ?auto_105672 ) ) ( not ( = ?auto_105669 ?auto_105672 ) ) ( not ( = ?auto_105666 ?auto_105673 ) ) ( not ( = ?auto_105666 ?auto_105671 ) ) ( not ( = ?auto_105667 ?auto_105673 ) ) ( not ( = ?auto_105667 ?auto_105671 ) ) ( not ( = ?auto_105668 ?auto_105673 ) ) ( not ( = ?auto_105668 ?auto_105671 ) ) ( not ( = ?auto_105669 ?auto_105673 ) ) ( not ( = ?auto_105669 ?auto_105671 ) ) ( not ( = ?auto_105672 ?auto_105673 ) ) ( not ( = ?auto_105672 ?auto_105671 ) ) ( not ( = ?auto_105673 ?auto_105671 ) ) ( ON ?auto_105671 ?auto_105670 ) ( not ( = ?auto_105666 ?auto_105670 ) ) ( not ( = ?auto_105667 ?auto_105670 ) ) ( not ( = ?auto_105668 ?auto_105670 ) ) ( not ( = ?auto_105669 ?auto_105670 ) ) ( not ( = ?auto_105672 ?auto_105670 ) ) ( not ( = ?auto_105673 ?auto_105670 ) ) ( not ( = ?auto_105671 ?auto_105670 ) ) ( ON ?auto_105673 ?auto_105671 ) ( ON-TABLE ?auto_105670 ) ( ON ?auto_105672 ?auto_105673 ) ( CLEAR ?auto_105668 ) ( ON ?auto_105669 ?auto_105672 ) ( CLEAR ?auto_105669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105670 ?auto_105671 ?auto_105673 ?auto_105672 )
      ( MAKE-4PILE ?auto_105666 ?auto_105667 ?auto_105668 ?auto_105669 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105674 - BLOCK
      ?auto_105675 - BLOCK
      ?auto_105676 - BLOCK
      ?auto_105677 - BLOCK
    )
    :vars
    (
      ?auto_105678 - BLOCK
      ?auto_105680 - BLOCK
      ?auto_105681 - BLOCK
      ?auto_105679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105674 ) ( ON ?auto_105675 ?auto_105674 ) ( not ( = ?auto_105674 ?auto_105675 ) ) ( not ( = ?auto_105674 ?auto_105676 ) ) ( not ( = ?auto_105674 ?auto_105677 ) ) ( not ( = ?auto_105674 ?auto_105678 ) ) ( not ( = ?auto_105675 ?auto_105676 ) ) ( not ( = ?auto_105675 ?auto_105677 ) ) ( not ( = ?auto_105675 ?auto_105678 ) ) ( not ( = ?auto_105676 ?auto_105677 ) ) ( not ( = ?auto_105676 ?auto_105678 ) ) ( not ( = ?auto_105677 ?auto_105678 ) ) ( not ( = ?auto_105674 ?auto_105680 ) ) ( not ( = ?auto_105674 ?auto_105681 ) ) ( not ( = ?auto_105675 ?auto_105680 ) ) ( not ( = ?auto_105675 ?auto_105681 ) ) ( not ( = ?auto_105676 ?auto_105680 ) ) ( not ( = ?auto_105676 ?auto_105681 ) ) ( not ( = ?auto_105677 ?auto_105680 ) ) ( not ( = ?auto_105677 ?auto_105681 ) ) ( not ( = ?auto_105678 ?auto_105680 ) ) ( not ( = ?auto_105678 ?auto_105681 ) ) ( not ( = ?auto_105680 ?auto_105681 ) ) ( ON ?auto_105681 ?auto_105679 ) ( not ( = ?auto_105674 ?auto_105679 ) ) ( not ( = ?auto_105675 ?auto_105679 ) ) ( not ( = ?auto_105676 ?auto_105679 ) ) ( not ( = ?auto_105677 ?auto_105679 ) ) ( not ( = ?auto_105678 ?auto_105679 ) ) ( not ( = ?auto_105680 ?auto_105679 ) ) ( not ( = ?auto_105681 ?auto_105679 ) ) ( ON ?auto_105680 ?auto_105681 ) ( ON-TABLE ?auto_105679 ) ( ON ?auto_105678 ?auto_105680 ) ( ON ?auto_105677 ?auto_105678 ) ( CLEAR ?auto_105677 ) ( HOLDING ?auto_105676 ) ( CLEAR ?auto_105675 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105674 ?auto_105675 ?auto_105676 )
      ( MAKE-4PILE ?auto_105674 ?auto_105675 ?auto_105676 ?auto_105677 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105682 - BLOCK
      ?auto_105683 - BLOCK
      ?auto_105684 - BLOCK
      ?auto_105685 - BLOCK
    )
    :vars
    (
      ?auto_105687 - BLOCK
      ?auto_105689 - BLOCK
      ?auto_105688 - BLOCK
      ?auto_105686 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105682 ) ( ON ?auto_105683 ?auto_105682 ) ( not ( = ?auto_105682 ?auto_105683 ) ) ( not ( = ?auto_105682 ?auto_105684 ) ) ( not ( = ?auto_105682 ?auto_105685 ) ) ( not ( = ?auto_105682 ?auto_105687 ) ) ( not ( = ?auto_105683 ?auto_105684 ) ) ( not ( = ?auto_105683 ?auto_105685 ) ) ( not ( = ?auto_105683 ?auto_105687 ) ) ( not ( = ?auto_105684 ?auto_105685 ) ) ( not ( = ?auto_105684 ?auto_105687 ) ) ( not ( = ?auto_105685 ?auto_105687 ) ) ( not ( = ?auto_105682 ?auto_105689 ) ) ( not ( = ?auto_105682 ?auto_105688 ) ) ( not ( = ?auto_105683 ?auto_105689 ) ) ( not ( = ?auto_105683 ?auto_105688 ) ) ( not ( = ?auto_105684 ?auto_105689 ) ) ( not ( = ?auto_105684 ?auto_105688 ) ) ( not ( = ?auto_105685 ?auto_105689 ) ) ( not ( = ?auto_105685 ?auto_105688 ) ) ( not ( = ?auto_105687 ?auto_105689 ) ) ( not ( = ?auto_105687 ?auto_105688 ) ) ( not ( = ?auto_105689 ?auto_105688 ) ) ( ON ?auto_105688 ?auto_105686 ) ( not ( = ?auto_105682 ?auto_105686 ) ) ( not ( = ?auto_105683 ?auto_105686 ) ) ( not ( = ?auto_105684 ?auto_105686 ) ) ( not ( = ?auto_105685 ?auto_105686 ) ) ( not ( = ?auto_105687 ?auto_105686 ) ) ( not ( = ?auto_105689 ?auto_105686 ) ) ( not ( = ?auto_105688 ?auto_105686 ) ) ( ON ?auto_105689 ?auto_105688 ) ( ON-TABLE ?auto_105686 ) ( ON ?auto_105687 ?auto_105689 ) ( ON ?auto_105685 ?auto_105687 ) ( CLEAR ?auto_105683 ) ( ON ?auto_105684 ?auto_105685 ) ( CLEAR ?auto_105684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105686 ?auto_105688 ?auto_105689 ?auto_105687 ?auto_105685 )
      ( MAKE-4PILE ?auto_105682 ?auto_105683 ?auto_105684 ?auto_105685 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105690 - BLOCK
      ?auto_105691 - BLOCK
      ?auto_105692 - BLOCK
      ?auto_105693 - BLOCK
    )
    :vars
    (
      ?auto_105696 - BLOCK
      ?auto_105694 - BLOCK
      ?auto_105695 - BLOCK
      ?auto_105697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105690 ) ( not ( = ?auto_105690 ?auto_105691 ) ) ( not ( = ?auto_105690 ?auto_105692 ) ) ( not ( = ?auto_105690 ?auto_105693 ) ) ( not ( = ?auto_105690 ?auto_105696 ) ) ( not ( = ?auto_105691 ?auto_105692 ) ) ( not ( = ?auto_105691 ?auto_105693 ) ) ( not ( = ?auto_105691 ?auto_105696 ) ) ( not ( = ?auto_105692 ?auto_105693 ) ) ( not ( = ?auto_105692 ?auto_105696 ) ) ( not ( = ?auto_105693 ?auto_105696 ) ) ( not ( = ?auto_105690 ?auto_105694 ) ) ( not ( = ?auto_105690 ?auto_105695 ) ) ( not ( = ?auto_105691 ?auto_105694 ) ) ( not ( = ?auto_105691 ?auto_105695 ) ) ( not ( = ?auto_105692 ?auto_105694 ) ) ( not ( = ?auto_105692 ?auto_105695 ) ) ( not ( = ?auto_105693 ?auto_105694 ) ) ( not ( = ?auto_105693 ?auto_105695 ) ) ( not ( = ?auto_105696 ?auto_105694 ) ) ( not ( = ?auto_105696 ?auto_105695 ) ) ( not ( = ?auto_105694 ?auto_105695 ) ) ( ON ?auto_105695 ?auto_105697 ) ( not ( = ?auto_105690 ?auto_105697 ) ) ( not ( = ?auto_105691 ?auto_105697 ) ) ( not ( = ?auto_105692 ?auto_105697 ) ) ( not ( = ?auto_105693 ?auto_105697 ) ) ( not ( = ?auto_105696 ?auto_105697 ) ) ( not ( = ?auto_105694 ?auto_105697 ) ) ( not ( = ?auto_105695 ?auto_105697 ) ) ( ON ?auto_105694 ?auto_105695 ) ( ON-TABLE ?auto_105697 ) ( ON ?auto_105696 ?auto_105694 ) ( ON ?auto_105693 ?auto_105696 ) ( ON ?auto_105692 ?auto_105693 ) ( CLEAR ?auto_105692 ) ( HOLDING ?auto_105691 ) ( CLEAR ?auto_105690 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105690 ?auto_105691 )
      ( MAKE-4PILE ?auto_105690 ?auto_105691 ?auto_105692 ?auto_105693 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105698 - BLOCK
      ?auto_105699 - BLOCK
      ?auto_105700 - BLOCK
      ?auto_105701 - BLOCK
    )
    :vars
    (
      ?auto_105704 - BLOCK
      ?auto_105703 - BLOCK
      ?auto_105702 - BLOCK
      ?auto_105705 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105698 ) ( not ( = ?auto_105698 ?auto_105699 ) ) ( not ( = ?auto_105698 ?auto_105700 ) ) ( not ( = ?auto_105698 ?auto_105701 ) ) ( not ( = ?auto_105698 ?auto_105704 ) ) ( not ( = ?auto_105699 ?auto_105700 ) ) ( not ( = ?auto_105699 ?auto_105701 ) ) ( not ( = ?auto_105699 ?auto_105704 ) ) ( not ( = ?auto_105700 ?auto_105701 ) ) ( not ( = ?auto_105700 ?auto_105704 ) ) ( not ( = ?auto_105701 ?auto_105704 ) ) ( not ( = ?auto_105698 ?auto_105703 ) ) ( not ( = ?auto_105698 ?auto_105702 ) ) ( not ( = ?auto_105699 ?auto_105703 ) ) ( not ( = ?auto_105699 ?auto_105702 ) ) ( not ( = ?auto_105700 ?auto_105703 ) ) ( not ( = ?auto_105700 ?auto_105702 ) ) ( not ( = ?auto_105701 ?auto_105703 ) ) ( not ( = ?auto_105701 ?auto_105702 ) ) ( not ( = ?auto_105704 ?auto_105703 ) ) ( not ( = ?auto_105704 ?auto_105702 ) ) ( not ( = ?auto_105703 ?auto_105702 ) ) ( ON ?auto_105702 ?auto_105705 ) ( not ( = ?auto_105698 ?auto_105705 ) ) ( not ( = ?auto_105699 ?auto_105705 ) ) ( not ( = ?auto_105700 ?auto_105705 ) ) ( not ( = ?auto_105701 ?auto_105705 ) ) ( not ( = ?auto_105704 ?auto_105705 ) ) ( not ( = ?auto_105703 ?auto_105705 ) ) ( not ( = ?auto_105702 ?auto_105705 ) ) ( ON ?auto_105703 ?auto_105702 ) ( ON-TABLE ?auto_105705 ) ( ON ?auto_105704 ?auto_105703 ) ( ON ?auto_105701 ?auto_105704 ) ( ON ?auto_105700 ?auto_105701 ) ( CLEAR ?auto_105698 ) ( ON ?auto_105699 ?auto_105700 ) ( CLEAR ?auto_105699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105705 ?auto_105702 ?auto_105703 ?auto_105704 ?auto_105701 ?auto_105700 )
      ( MAKE-4PILE ?auto_105698 ?auto_105699 ?auto_105700 ?auto_105701 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105706 - BLOCK
      ?auto_105707 - BLOCK
      ?auto_105708 - BLOCK
      ?auto_105709 - BLOCK
    )
    :vars
    (
      ?auto_105711 - BLOCK
      ?auto_105710 - BLOCK
      ?auto_105712 - BLOCK
      ?auto_105713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105706 ?auto_105707 ) ) ( not ( = ?auto_105706 ?auto_105708 ) ) ( not ( = ?auto_105706 ?auto_105709 ) ) ( not ( = ?auto_105706 ?auto_105711 ) ) ( not ( = ?auto_105707 ?auto_105708 ) ) ( not ( = ?auto_105707 ?auto_105709 ) ) ( not ( = ?auto_105707 ?auto_105711 ) ) ( not ( = ?auto_105708 ?auto_105709 ) ) ( not ( = ?auto_105708 ?auto_105711 ) ) ( not ( = ?auto_105709 ?auto_105711 ) ) ( not ( = ?auto_105706 ?auto_105710 ) ) ( not ( = ?auto_105706 ?auto_105712 ) ) ( not ( = ?auto_105707 ?auto_105710 ) ) ( not ( = ?auto_105707 ?auto_105712 ) ) ( not ( = ?auto_105708 ?auto_105710 ) ) ( not ( = ?auto_105708 ?auto_105712 ) ) ( not ( = ?auto_105709 ?auto_105710 ) ) ( not ( = ?auto_105709 ?auto_105712 ) ) ( not ( = ?auto_105711 ?auto_105710 ) ) ( not ( = ?auto_105711 ?auto_105712 ) ) ( not ( = ?auto_105710 ?auto_105712 ) ) ( ON ?auto_105712 ?auto_105713 ) ( not ( = ?auto_105706 ?auto_105713 ) ) ( not ( = ?auto_105707 ?auto_105713 ) ) ( not ( = ?auto_105708 ?auto_105713 ) ) ( not ( = ?auto_105709 ?auto_105713 ) ) ( not ( = ?auto_105711 ?auto_105713 ) ) ( not ( = ?auto_105710 ?auto_105713 ) ) ( not ( = ?auto_105712 ?auto_105713 ) ) ( ON ?auto_105710 ?auto_105712 ) ( ON-TABLE ?auto_105713 ) ( ON ?auto_105711 ?auto_105710 ) ( ON ?auto_105709 ?auto_105711 ) ( ON ?auto_105708 ?auto_105709 ) ( ON ?auto_105707 ?auto_105708 ) ( CLEAR ?auto_105707 ) ( HOLDING ?auto_105706 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105706 )
      ( MAKE-4PILE ?auto_105706 ?auto_105707 ?auto_105708 ?auto_105709 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_105714 - BLOCK
      ?auto_105715 - BLOCK
      ?auto_105716 - BLOCK
      ?auto_105717 - BLOCK
    )
    :vars
    (
      ?auto_105719 - BLOCK
      ?auto_105721 - BLOCK
      ?auto_105720 - BLOCK
      ?auto_105718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105714 ?auto_105715 ) ) ( not ( = ?auto_105714 ?auto_105716 ) ) ( not ( = ?auto_105714 ?auto_105717 ) ) ( not ( = ?auto_105714 ?auto_105719 ) ) ( not ( = ?auto_105715 ?auto_105716 ) ) ( not ( = ?auto_105715 ?auto_105717 ) ) ( not ( = ?auto_105715 ?auto_105719 ) ) ( not ( = ?auto_105716 ?auto_105717 ) ) ( not ( = ?auto_105716 ?auto_105719 ) ) ( not ( = ?auto_105717 ?auto_105719 ) ) ( not ( = ?auto_105714 ?auto_105721 ) ) ( not ( = ?auto_105714 ?auto_105720 ) ) ( not ( = ?auto_105715 ?auto_105721 ) ) ( not ( = ?auto_105715 ?auto_105720 ) ) ( not ( = ?auto_105716 ?auto_105721 ) ) ( not ( = ?auto_105716 ?auto_105720 ) ) ( not ( = ?auto_105717 ?auto_105721 ) ) ( not ( = ?auto_105717 ?auto_105720 ) ) ( not ( = ?auto_105719 ?auto_105721 ) ) ( not ( = ?auto_105719 ?auto_105720 ) ) ( not ( = ?auto_105721 ?auto_105720 ) ) ( ON ?auto_105720 ?auto_105718 ) ( not ( = ?auto_105714 ?auto_105718 ) ) ( not ( = ?auto_105715 ?auto_105718 ) ) ( not ( = ?auto_105716 ?auto_105718 ) ) ( not ( = ?auto_105717 ?auto_105718 ) ) ( not ( = ?auto_105719 ?auto_105718 ) ) ( not ( = ?auto_105721 ?auto_105718 ) ) ( not ( = ?auto_105720 ?auto_105718 ) ) ( ON ?auto_105721 ?auto_105720 ) ( ON-TABLE ?auto_105718 ) ( ON ?auto_105719 ?auto_105721 ) ( ON ?auto_105717 ?auto_105719 ) ( ON ?auto_105716 ?auto_105717 ) ( ON ?auto_105715 ?auto_105716 ) ( ON ?auto_105714 ?auto_105715 ) ( CLEAR ?auto_105714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105718 ?auto_105720 ?auto_105721 ?auto_105719 ?auto_105717 ?auto_105716 ?auto_105715 )
      ( MAKE-4PILE ?auto_105714 ?auto_105715 ?auto_105716 ?auto_105717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105725 - BLOCK
      ?auto_105726 - BLOCK
      ?auto_105727 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_105727 ) ( CLEAR ?auto_105726 ) ( ON-TABLE ?auto_105725 ) ( ON ?auto_105726 ?auto_105725 ) ( not ( = ?auto_105725 ?auto_105726 ) ) ( not ( = ?auto_105725 ?auto_105727 ) ) ( not ( = ?auto_105726 ?auto_105727 ) ) )
    :subtasks
    ( ( !STACK ?auto_105727 ?auto_105726 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105728 - BLOCK
      ?auto_105729 - BLOCK
      ?auto_105730 - BLOCK
    )
    :vars
    (
      ?auto_105731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_105729 ) ( ON-TABLE ?auto_105728 ) ( ON ?auto_105729 ?auto_105728 ) ( not ( = ?auto_105728 ?auto_105729 ) ) ( not ( = ?auto_105728 ?auto_105730 ) ) ( not ( = ?auto_105729 ?auto_105730 ) ) ( ON ?auto_105730 ?auto_105731 ) ( CLEAR ?auto_105730 ) ( HAND-EMPTY ) ( not ( = ?auto_105728 ?auto_105731 ) ) ( not ( = ?auto_105729 ?auto_105731 ) ) ( not ( = ?auto_105730 ?auto_105731 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105730 ?auto_105731 )
      ( MAKE-3PILE ?auto_105728 ?auto_105729 ?auto_105730 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105732 - BLOCK
      ?auto_105733 - BLOCK
      ?auto_105734 - BLOCK
    )
    :vars
    (
      ?auto_105735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105732 ) ( not ( = ?auto_105732 ?auto_105733 ) ) ( not ( = ?auto_105732 ?auto_105734 ) ) ( not ( = ?auto_105733 ?auto_105734 ) ) ( ON ?auto_105734 ?auto_105735 ) ( CLEAR ?auto_105734 ) ( not ( = ?auto_105732 ?auto_105735 ) ) ( not ( = ?auto_105733 ?auto_105735 ) ) ( not ( = ?auto_105734 ?auto_105735 ) ) ( HOLDING ?auto_105733 ) ( CLEAR ?auto_105732 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105732 ?auto_105733 )
      ( MAKE-3PILE ?auto_105732 ?auto_105733 ?auto_105734 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105736 - BLOCK
      ?auto_105737 - BLOCK
      ?auto_105738 - BLOCK
    )
    :vars
    (
      ?auto_105739 - BLOCK
      ?auto_105740 - BLOCK
      ?auto_105741 - BLOCK
      ?auto_105742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105736 ) ( not ( = ?auto_105736 ?auto_105737 ) ) ( not ( = ?auto_105736 ?auto_105738 ) ) ( not ( = ?auto_105737 ?auto_105738 ) ) ( ON ?auto_105738 ?auto_105739 ) ( not ( = ?auto_105736 ?auto_105739 ) ) ( not ( = ?auto_105737 ?auto_105739 ) ) ( not ( = ?auto_105738 ?auto_105739 ) ) ( CLEAR ?auto_105736 ) ( ON ?auto_105737 ?auto_105738 ) ( CLEAR ?auto_105737 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105740 ) ( ON ?auto_105741 ?auto_105740 ) ( ON ?auto_105742 ?auto_105741 ) ( ON ?auto_105739 ?auto_105742 ) ( not ( = ?auto_105740 ?auto_105741 ) ) ( not ( = ?auto_105740 ?auto_105742 ) ) ( not ( = ?auto_105740 ?auto_105739 ) ) ( not ( = ?auto_105740 ?auto_105738 ) ) ( not ( = ?auto_105740 ?auto_105737 ) ) ( not ( = ?auto_105741 ?auto_105742 ) ) ( not ( = ?auto_105741 ?auto_105739 ) ) ( not ( = ?auto_105741 ?auto_105738 ) ) ( not ( = ?auto_105741 ?auto_105737 ) ) ( not ( = ?auto_105742 ?auto_105739 ) ) ( not ( = ?auto_105742 ?auto_105738 ) ) ( not ( = ?auto_105742 ?auto_105737 ) ) ( not ( = ?auto_105736 ?auto_105740 ) ) ( not ( = ?auto_105736 ?auto_105741 ) ) ( not ( = ?auto_105736 ?auto_105742 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105740 ?auto_105741 ?auto_105742 ?auto_105739 ?auto_105738 )
      ( MAKE-3PILE ?auto_105736 ?auto_105737 ?auto_105738 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105743 - BLOCK
      ?auto_105744 - BLOCK
      ?auto_105745 - BLOCK
    )
    :vars
    (
      ?auto_105749 - BLOCK
      ?auto_105748 - BLOCK
      ?auto_105746 - BLOCK
      ?auto_105747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105743 ?auto_105744 ) ) ( not ( = ?auto_105743 ?auto_105745 ) ) ( not ( = ?auto_105744 ?auto_105745 ) ) ( ON ?auto_105745 ?auto_105749 ) ( not ( = ?auto_105743 ?auto_105749 ) ) ( not ( = ?auto_105744 ?auto_105749 ) ) ( not ( = ?auto_105745 ?auto_105749 ) ) ( ON ?auto_105744 ?auto_105745 ) ( CLEAR ?auto_105744 ) ( ON-TABLE ?auto_105748 ) ( ON ?auto_105746 ?auto_105748 ) ( ON ?auto_105747 ?auto_105746 ) ( ON ?auto_105749 ?auto_105747 ) ( not ( = ?auto_105748 ?auto_105746 ) ) ( not ( = ?auto_105748 ?auto_105747 ) ) ( not ( = ?auto_105748 ?auto_105749 ) ) ( not ( = ?auto_105748 ?auto_105745 ) ) ( not ( = ?auto_105748 ?auto_105744 ) ) ( not ( = ?auto_105746 ?auto_105747 ) ) ( not ( = ?auto_105746 ?auto_105749 ) ) ( not ( = ?auto_105746 ?auto_105745 ) ) ( not ( = ?auto_105746 ?auto_105744 ) ) ( not ( = ?auto_105747 ?auto_105749 ) ) ( not ( = ?auto_105747 ?auto_105745 ) ) ( not ( = ?auto_105747 ?auto_105744 ) ) ( not ( = ?auto_105743 ?auto_105748 ) ) ( not ( = ?auto_105743 ?auto_105746 ) ) ( not ( = ?auto_105743 ?auto_105747 ) ) ( HOLDING ?auto_105743 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105743 )
      ( MAKE-3PILE ?auto_105743 ?auto_105744 ?auto_105745 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105750 - BLOCK
      ?auto_105751 - BLOCK
      ?auto_105752 - BLOCK
    )
    :vars
    (
      ?auto_105756 - BLOCK
      ?auto_105754 - BLOCK
      ?auto_105753 - BLOCK
      ?auto_105755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105750 ?auto_105751 ) ) ( not ( = ?auto_105750 ?auto_105752 ) ) ( not ( = ?auto_105751 ?auto_105752 ) ) ( ON ?auto_105752 ?auto_105756 ) ( not ( = ?auto_105750 ?auto_105756 ) ) ( not ( = ?auto_105751 ?auto_105756 ) ) ( not ( = ?auto_105752 ?auto_105756 ) ) ( ON ?auto_105751 ?auto_105752 ) ( ON-TABLE ?auto_105754 ) ( ON ?auto_105753 ?auto_105754 ) ( ON ?auto_105755 ?auto_105753 ) ( ON ?auto_105756 ?auto_105755 ) ( not ( = ?auto_105754 ?auto_105753 ) ) ( not ( = ?auto_105754 ?auto_105755 ) ) ( not ( = ?auto_105754 ?auto_105756 ) ) ( not ( = ?auto_105754 ?auto_105752 ) ) ( not ( = ?auto_105754 ?auto_105751 ) ) ( not ( = ?auto_105753 ?auto_105755 ) ) ( not ( = ?auto_105753 ?auto_105756 ) ) ( not ( = ?auto_105753 ?auto_105752 ) ) ( not ( = ?auto_105753 ?auto_105751 ) ) ( not ( = ?auto_105755 ?auto_105756 ) ) ( not ( = ?auto_105755 ?auto_105752 ) ) ( not ( = ?auto_105755 ?auto_105751 ) ) ( not ( = ?auto_105750 ?auto_105754 ) ) ( not ( = ?auto_105750 ?auto_105753 ) ) ( not ( = ?auto_105750 ?auto_105755 ) ) ( ON ?auto_105750 ?auto_105751 ) ( CLEAR ?auto_105750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105754 ?auto_105753 ?auto_105755 ?auto_105756 ?auto_105752 ?auto_105751 )
      ( MAKE-3PILE ?auto_105750 ?auto_105751 ?auto_105752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105757 - BLOCK
      ?auto_105758 - BLOCK
      ?auto_105759 - BLOCK
    )
    :vars
    (
      ?auto_105763 - BLOCK
      ?auto_105761 - BLOCK
      ?auto_105760 - BLOCK
      ?auto_105762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105757 ?auto_105758 ) ) ( not ( = ?auto_105757 ?auto_105759 ) ) ( not ( = ?auto_105758 ?auto_105759 ) ) ( ON ?auto_105759 ?auto_105763 ) ( not ( = ?auto_105757 ?auto_105763 ) ) ( not ( = ?auto_105758 ?auto_105763 ) ) ( not ( = ?auto_105759 ?auto_105763 ) ) ( ON ?auto_105758 ?auto_105759 ) ( ON-TABLE ?auto_105761 ) ( ON ?auto_105760 ?auto_105761 ) ( ON ?auto_105762 ?auto_105760 ) ( ON ?auto_105763 ?auto_105762 ) ( not ( = ?auto_105761 ?auto_105760 ) ) ( not ( = ?auto_105761 ?auto_105762 ) ) ( not ( = ?auto_105761 ?auto_105763 ) ) ( not ( = ?auto_105761 ?auto_105759 ) ) ( not ( = ?auto_105761 ?auto_105758 ) ) ( not ( = ?auto_105760 ?auto_105762 ) ) ( not ( = ?auto_105760 ?auto_105763 ) ) ( not ( = ?auto_105760 ?auto_105759 ) ) ( not ( = ?auto_105760 ?auto_105758 ) ) ( not ( = ?auto_105762 ?auto_105763 ) ) ( not ( = ?auto_105762 ?auto_105759 ) ) ( not ( = ?auto_105762 ?auto_105758 ) ) ( not ( = ?auto_105757 ?auto_105761 ) ) ( not ( = ?auto_105757 ?auto_105760 ) ) ( not ( = ?auto_105757 ?auto_105762 ) ) ( HOLDING ?auto_105757 ) ( CLEAR ?auto_105758 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105761 ?auto_105760 ?auto_105762 ?auto_105763 ?auto_105759 ?auto_105758 ?auto_105757 )
      ( MAKE-3PILE ?auto_105757 ?auto_105758 ?auto_105759 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105764 - BLOCK
      ?auto_105765 - BLOCK
      ?auto_105766 - BLOCK
    )
    :vars
    (
      ?auto_105767 - BLOCK
      ?auto_105768 - BLOCK
      ?auto_105770 - BLOCK
      ?auto_105769 - BLOCK
      ?auto_105771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105764 ?auto_105765 ) ) ( not ( = ?auto_105764 ?auto_105766 ) ) ( not ( = ?auto_105765 ?auto_105766 ) ) ( ON ?auto_105766 ?auto_105767 ) ( not ( = ?auto_105764 ?auto_105767 ) ) ( not ( = ?auto_105765 ?auto_105767 ) ) ( not ( = ?auto_105766 ?auto_105767 ) ) ( ON ?auto_105765 ?auto_105766 ) ( ON-TABLE ?auto_105768 ) ( ON ?auto_105770 ?auto_105768 ) ( ON ?auto_105769 ?auto_105770 ) ( ON ?auto_105767 ?auto_105769 ) ( not ( = ?auto_105768 ?auto_105770 ) ) ( not ( = ?auto_105768 ?auto_105769 ) ) ( not ( = ?auto_105768 ?auto_105767 ) ) ( not ( = ?auto_105768 ?auto_105766 ) ) ( not ( = ?auto_105768 ?auto_105765 ) ) ( not ( = ?auto_105770 ?auto_105769 ) ) ( not ( = ?auto_105770 ?auto_105767 ) ) ( not ( = ?auto_105770 ?auto_105766 ) ) ( not ( = ?auto_105770 ?auto_105765 ) ) ( not ( = ?auto_105769 ?auto_105767 ) ) ( not ( = ?auto_105769 ?auto_105766 ) ) ( not ( = ?auto_105769 ?auto_105765 ) ) ( not ( = ?auto_105764 ?auto_105768 ) ) ( not ( = ?auto_105764 ?auto_105770 ) ) ( not ( = ?auto_105764 ?auto_105769 ) ) ( CLEAR ?auto_105765 ) ( ON ?auto_105764 ?auto_105771 ) ( CLEAR ?auto_105764 ) ( HAND-EMPTY ) ( not ( = ?auto_105764 ?auto_105771 ) ) ( not ( = ?auto_105765 ?auto_105771 ) ) ( not ( = ?auto_105766 ?auto_105771 ) ) ( not ( = ?auto_105767 ?auto_105771 ) ) ( not ( = ?auto_105768 ?auto_105771 ) ) ( not ( = ?auto_105770 ?auto_105771 ) ) ( not ( = ?auto_105769 ?auto_105771 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105764 ?auto_105771 )
      ( MAKE-3PILE ?auto_105764 ?auto_105765 ?auto_105766 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105772 - BLOCK
      ?auto_105773 - BLOCK
      ?auto_105774 - BLOCK
    )
    :vars
    (
      ?auto_105779 - BLOCK
      ?auto_105778 - BLOCK
      ?auto_105776 - BLOCK
      ?auto_105775 - BLOCK
      ?auto_105777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105772 ?auto_105773 ) ) ( not ( = ?auto_105772 ?auto_105774 ) ) ( not ( = ?auto_105773 ?auto_105774 ) ) ( ON ?auto_105774 ?auto_105779 ) ( not ( = ?auto_105772 ?auto_105779 ) ) ( not ( = ?auto_105773 ?auto_105779 ) ) ( not ( = ?auto_105774 ?auto_105779 ) ) ( ON-TABLE ?auto_105778 ) ( ON ?auto_105776 ?auto_105778 ) ( ON ?auto_105775 ?auto_105776 ) ( ON ?auto_105779 ?auto_105775 ) ( not ( = ?auto_105778 ?auto_105776 ) ) ( not ( = ?auto_105778 ?auto_105775 ) ) ( not ( = ?auto_105778 ?auto_105779 ) ) ( not ( = ?auto_105778 ?auto_105774 ) ) ( not ( = ?auto_105778 ?auto_105773 ) ) ( not ( = ?auto_105776 ?auto_105775 ) ) ( not ( = ?auto_105776 ?auto_105779 ) ) ( not ( = ?auto_105776 ?auto_105774 ) ) ( not ( = ?auto_105776 ?auto_105773 ) ) ( not ( = ?auto_105775 ?auto_105779 ) ) ( not ( = ?auto_105775 ?auto_105774 ) ) ( not ( = ?auto_105775 ?auto_105773 ) ) ( not ( = ?auto_105772 ?auto_105778 ) ) ( not ( = ?auto_105772 ?auto_105776 ) ) ( not ( = ?auto_105772 ?auto_105775 ) ) ( ON ?auto_105772 ?auto_105777 ) ( CLEAR ?auto_105772 ) ( not ( = ?auto_105772 ?auto_105777 ) ) ( not ( = ?auto_105773 ?auto_105777 ) ) ( not ( = ?auto_105774 ?auto_105777 ) ) ( not ( = ?auto_105779 ?auto_105777 ) ) ( not ( = ?auto_105778 ?auto_105777 ) ) ( not ( = ?auto_105776 ?auto_105777 ) ) ( not ( = ?auto_105775 ?auto_105777 ) ) ( HOLDING ?auto_105773 ) ( CLEAR ?auto_105774 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105778 ?auto_105776 ?auto_105775 ?auto_105779 ?auto_105774 ?auto_105773 )
      ( MAKE-3PILE ?auto_105772 ?auto_105773 ?auto_105774 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105780 - BLOCK
      ?auto_105781 - BLOCK
      ?auto_105782 - BLOCK
    )
    :vars
    (
      ?auto_105787 - BLOCK
      ?auto_105785 - BLOCK
      ?auto_105783 - BLOCK
      ?auto_105786 - BLOCK
      ?auto_105784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105780 ?auto_105781 ) ) ( not ( = ?auto_105780 ?auto_105782 ) ) ( not ( = ?auto_105781 ?auto_105782 ) ) ( ON ?auto_105782 ?auto_105787 ) ( not ( = ?auto_105780 ?auto_105787 ) ) ( not ( = ?auto_105781 ?auto_105787 ) ) ( not ( = ?auto_105782 ?auto_105787 ) ) ( ON-TABLE ?auto_105785 ) ( ON ?auto_105783 ?auto_105785 ) ( ON ?auto_105786 ?auto_105783 ) ( ON ?auto_105787 ?auto_105786 ) ( not ( = ?auto_105785 ?auto_105783 ) ) ( not ( = ?auto_105785 ?auto_105786 ) ) ( not ( = ?auto_105785 ?auto_105787 ) ) ( not ( = ?auto_105785 ?auto_105782 ) ) ( not ( = ?auto_105785 ?auto_105781 ) ) ( not ( = ?auto_105783 ?auto_105786 ) ) ( not ( = ?auto_105783 ?auto_105787 ) ) ( not ( = ?auto_105783 ?auto_105782 ) ) ( not ( = ?auto_105783 ?auto_105781 ) ) ( not ( = ?auto_105786 ?auto_105787 ) ) ( not ( = ?auto_105786 ?auto_105782 ) ) ( not ( = ?auto_105786 ?auto_105781 ) ) ( not ( = ?auto_105780 ?auto_105785 ) ) ( not ( = ?auto_105780 ?auto_105783 ) ) ( not ( = ?auto_105780 ?auto_105786 ) ) ( ON ?auto_105780 ?auto_105784 ) ( not ( = ?auto_105780 ?auto_105784 ) ) ( not ( = ?auto_105781 ?auto_105784 ) ) ( not ( = ?auto_105782 ?auto_105784 ) ) ( not ( = ?auto_105787 ?auto_105784 ) ) ( not ( = ?auto_105785 ?auto_105784 ) ) ( not ( = ?auto_105783 ?auto_105784 ) ) ( not ( = ?auto_105786 ?auto_105784 ) ) ( CLEAR ?auto_105782 ) ( ON ?auto_105781 ?auto_105780 ) ( CLEAR ?auto_105781 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105784 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105784 ?auto_105780 )
      ( MAKE-3PILE ?auto_105780 ?auto_105781 ?auto_105782 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105788 - BLOCK
      ?auto_105789 - BLOCK
      ?auto_105790 - BLOCK
    )
    :vars
    (
      ?auto_105791 - BLOCK
      ?auto_105793 - BLOCK
      ?auto_105795 - BLOCK
      ?auto_105792 - BLOCK
      ?auto_105794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105788 ?auto_105789 ) ) ( not ( = ?auto_105788 ?auto_105790 ) ) ( not ( = ?auto_105789 ?auto_105790 ) ) ( not ( = ?auto_105788 ?auto_105791 ) ) ( not ( = ?auto_105789 ?auto_105791 ) ) ( not ( = ?auto_105790 ?auto_105791 ) ) ( ON-TABLE ?auto_105793 ) ( ON ?auto_105795 ?auto_105793 ) ( ON ?auto_105792 ?auto_105795 ) ( ON ?auto_105791 ?auto_105792 ) ( not ( = ?auto_105793 ?auto_105795 ) ) ( not ( = ?auto_105793 ?auto_105792 ) ) ( not ( = ?auto_105793 ?auto_105791 ) ) ( not ( = ?auto_105793 ?auto_105790 ) ) ( not ( = ?auto_105793 ?auto_105789 ) ) ( not ( = ?auto_105795 ?auto_105792 ) ) ( not ( = ?auto_105795 ?auto_105791 ) ) ( not ( = ?auto_105795 ?auto_105790 ) ) ( not ( = ?auto_105795 ?auto_105789 ) ) ( not ( = ?auto_105792 ?auto_105791 ) ) ( not ( = ?auto_105792 ?auto_105790 ) ) ( not ( = ?auto_105792 ?auto_105789 ) ) ( not ( = ?auto_105788 ?auto_105793 ) ) ( not ( = ?auto_105788 ?auto_105795 ) ) ( not ( = ?auto_105788 ?auto_105792 ) ) ( ON ?auto_105788 ?auto_105794 ) ( not ( = ?auto_105788 ?auto_105794 ) ) ( not ( = ?auto_105789 ?auto_105794 ) ) ( not ( = ?auto_105790 ?auto_105794 ) ) ( not ( = ?auto_105791 ?auto_105794 ) ) ( not ( = ?auto_105793 ?auto_105794 ) ) ( not ( = ?auto_105795 ?auto_105794 ) ) ( not ( = ?auto_105792 ?auto_105794 ) ) ( ON ?auto_105789 ?auto_105788 ) ( CLEAR ?auto_105789 ) ( ON-TABLE ?auto_105794 ) ( HOLDING ?auto_105790 ) ( CLEAR ?auto_105791 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105793 ?auto_105795 ?auto_105792 ?auto_105791 ?auto_105790 )
      ( MAKE-3PILE ?auto_105788 ?auto_105789 ?auto_105790 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105796 - BLOCK
      ?auto_105797 - BLOCK
      ?auto_105798 - BLOCK
    )
    :vars
    (
      ?auto_105801 - BLOCK
      ?auto_105800 - BLOCK
      ?auto_105799 - BLOCK
      ?auto_105803 - BLOCK
      ?auto_105802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105796 ?auto_105797 ) ) ( not ( = ?auto_105796 ?auto_105798 ) ) ( not ( = ?auto_105797 ?auto_105798 ) ) ( not ( = ?auto_105796 ?auto_105801 ) ) ( not ( = ?auto_105797 ?auto_105801 ) ) ( not ( = ?auto_105798 ?auto_105801 ) ) ( ON-TABLE ?auto_105800 ) ( ON ?auto_105799 ?auto_105800 ) ( ON ?auto_105803 ?auto_105799 ) ( ON ?auto_105801 ?auto_105803 ) ( not ( = ?auto_105800 ?auto_105799 ) ) ( not ( = ?auto_105800 ?auto_105803 ) ) ( not ( = ?auto_105800 ?auto_105801 ) ) ( not ( = ?auto_105800 ?auto_105798 ) ) ( not ( = ?auto_105800 ?auto_105797 ) ) ( not ( = ?auto_105799 ?auto_105803 ) ) ( not ( = ?auto_105799 ?auto_105801 ) ) ( not ( = ?auto_105799 ?auto_105798 ) ) ( not ( = ?auto_105799 ?auto_105797 ) ) ( not ( = ?auto_105803 ?auto_105801 ) ) ( not ( = ?auto_105803 ?auto_105798 ) ) ( not ( = ?auto_105803 ?auto_105797 ) ) ( not ( = ?auto_105796 ?auto_105800 ) ) ( not ( = ?auto_105796 ?auto_105799 ) ) ( not ( = ?auto_105796 ?auto_105803 ) ) ( ON ?auto_105796 ?auto_105802 ) ( not ( = ?auto_105796 ?auto_105802 ) ) ( not ( = ?auto_105797 ?auto_105802 ) ) ( not ( = ?auto_105798 ?auto_105802 ) ) ( not ( = ?auto_105801 ?auto_105802 ) ) ( not ( = ?auto_105800 ?auto_105802 ) ) ( not ( = ?auto_105799 ?auto_105802 ) ) ( not ( = ?auto_105803 ?auto_105802 ) ) ( ON ?auto_105797 ?auto_105796 ) ( ON-TABLE ?auto_105802 ) ( CLEAR ?auto_105801 ) ( ON ?auto_105798 ?auto_105797 ) ( CLEAR ?auto_105798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105802 ?auto_105796 ?auto_105797 )
      ( MAKE-3PILE ?auto_105796 ?auto_105797 ?auto_105798 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105804 - BLOCK
      ?auto_105805 - BLOCK
      ?auto_105806 - BLOCK
    )
    :vars
    (
      ?auto_105809 - BLOCK
      ?auto_105811 - BLOCK
      ?auto_105810 - BLOCK
      ?auto_105807 - BLOCK
      ?auto_105808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105804 ?auto_105805 ) ) ( not ( = ?auto_105804 ?auto_105806 ) ) ( not ( = ?auto_105805 ?auto_105806 ) ) ( not ( = ?auto_105804 ?auto_105809 ) ) ( not ( = ?auto_105805 ?auto_105809 ) ) ( not ( = ?auto_105806 ?auto_105809 ) ) ( ON-TABLE ?auto_105811 ) ( ON ?auto_105810 ?auto_105811 ) ( ON ?auto_105807 ?auto_105810 ) ( not ( = ?auto_105811 ?auto_105810 ) ) ( not ( = ?auto_105811 ?auto_105807 ) ) ( not ( = ?auto_105811 ?auto_105809 ) ) ( not ( = ?auto_105811 ?auto_105806 ) ) ( not ( = ?auto_105811 ?auto_105805 ) ) ( not ( = ?auto_105810 ?auto_105807 ) ) ( not ( = ?auto_105810 ?auto_105809 ) ) ( not ( = ?auto_105810 ?auto_105806 ) ) ( not ( = ?auto_105810 ?auto_105805 ) ) ( not ( = ?auto_105807 ?auto_105809 ) ) ( not ( = ?auto_105807 ?auto_105806 ) ) ( not ( = ?auto_105807 ?auto_105805 ) ) ( not ( = ?auto_105804 ?auto_105811 ) ) ( not ( = ?auto_105804 ?auto_105810 ) ) ( not ( = ?auto_105804 ?auto_105807 ) ) ( ON ?auto_105804 ?auto_105808 ) ( not ( = ?auto_105804 ?auto_105808 ) ) ( not ( = ?auto_105805 ?auto_105808 ) ) ( not ( = ?auto_105806 ?auto_105808 ) ) ( not ( = ?auto_105809 ?auto_105808 ) ) ( not ( = ?auto_105811 ?auto_105808 ) ) ( not ( = ?auto_105810 ?auto_105808 ) ) ( not ( = ?auto_105807 ?auto_105808 ) ) ( ON ?auto_105805 ?auto_105804 ) ( ON-TABLE ?auto_105808 ) ( ON ?auto_105806 ?auto_105805 ) ( CLEAR ?auto_105806 ) ( HOLDING ?auto_105809 ) ( CLEAR ?auto_105807 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105811 ?auto_105810 ?auto_105807 ?auto_105809 )
      ( MAKE-3PILE ?auto_105804 ?auto_105805 ?auto_105806 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105812 - BLOCK
      ?auto_105813 - BLOCK
      ?auto_105814 - BLOCK
    )
    :vars
    (
      ?auto_105816 - BLOCK
      ?auto_105817 - BLOCK
      ?auto_105815 - BLOCK
      ?auto_105819 - BLOCK
      ?auto_105818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105812 ?auto_105813 ) ) ( not ( = ?auto_105812 ?auto_105814 ) ) ( not ( = ?auto_105813 ?auto_105814 ) ) ( not ( = ?auto_105812 ?auto_105816 ) ) ( not ( = ?auto_105813 ?auto_105816 ) ) ( not ( = ?auto_105814 ?auto_105816 ) ) ( ON-TABLE ?auto_105817 ) ( ON ?auto_105815 ?auto_105817 ) ( ON ?auto_105819 ?auto_105815 ) ( not ( = ?auto_105817 ?auto_105815 ) ) ( not ( = ?auto_105817 ?auto_105819 ) ) ( not ( = ?auto_105817 ?auto_105816 ) ) ( not ( = ?auto_105817 ?auto_105814 ) ) ( not ( = ?auto_105817 ?auto_105813 ) ) ( not ( = ?auto_105815 ?auto_105819 ) ) ( not ( = ?auto_105815 ?auto_105816 ) ) ( not ( = ?auto_105815 ?auto_105814 ) ) ( not ( = ?auto_105815 ?auto_105813 ) ) ( not ( = ?auto_105819 ?auto_105816 ) ) ( not ( = ?auto_105819 ?auto_105814 ) ) ( not ( = ?auto_105819 ?auto_105813 ) ) ( not ( = ?auto_105812 ?auto_105817 ) ) ( not ( = ?auto_105812 ?auto_105815 ) ) ( not ( = ?auto_105812 ?auto_105819 ) ) ( ON ?auto_105812 ?auto_105818 ) ( not ( = ?auto_105812 ?auto_105818 ) ) ( not ( = ?auto_105813 ?auto_105818 ) ) ( not ( = ?auto_105814 ?auto_105818 ) ) ( not ( = ?auto_105816 ?auto_105818 ) ) ( not ( = ?auto_105817 ?auto_105818 ) ) ( not ( = ?auto_105815 ?auto_105818 ) ) ( not ( = ?auto_105819 ?auto_105818 ) ) ( ON ?auto_105813 ?auto_105812 ) ( ON-TABLE ?auto_105818 ) ( ON ?auto_105814 ?auto_105813 ) ( CLEAR ?auto_105819 ) ( ON ?auto_105816 ?auto_105814 ) ( CLEAR ?auto_105816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105818 ?auto_105812 ?auto_105813 ?auto_105814 )
      ( MAKE-3PILE ?auto_105812 ?auto_105813 ?auto_105814 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105820 - BLOCK
      ?auto_105821 - BLOCK
      ?auto_105822 - BLOCK
    )
    :vars
    (
      ?auto_105824 - BLOCK
      ?auto_105823 - BLOCK
      ?auto_105827 - BLOCK
      ?auto_105826 - BLOCK
      ?auto_105825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105820 ?auto_105821 ) ) ( not ( = ?auto_105820 ?auto_105822 ) ) ( not ( = ?auto_105821 ?auto_105822 ) ) ( not ( = ?auto_105820 ?auto_105824 ) ) ( not ( = ?auto_105821 ?auto_105824 ) ) ( not ( = ?auto_105822 ?auto_105824 ) ) ( ON-TABLE ?auto_105823 ) ( ON ?auto_105827 ?auto_105823 ) ( not ( = ?auto_105823 ?auto_105827 ) ) ( not ( = ?auto_105823 ?auto_105826 ) ) ( not ( = ?auto_105823 ?auto_105824 ) ) ( not ( = ?auto_105823 ?auto_105822 ) ) ( not ( = ?auto_105823 ?auto_105821 ) ) ( not ( = ?auto_105827 ?auto_105826 ) ) ( not ( = ?auto_105827 ?auto_105824 ) ) ( not ( = ?auto_105827 ?auto_105822 ) ) ( not ( = ?auto_105827 ?auto_105821 ) ) ( not ( = ?auto_105826 ?auto_105824 ) ) ( not ( = ?auto_105826 ?auto_105822 ) ) ( not ( = ?auto_105826 ?auto_105821 ) ) ( not ( = ?auto_105820 ?auto_105823 ) ) ( not ( = ?auto_105820 ?auto_105827 ) ) ( not ( = ?auto_105820 ?auto_105826 ) ) ( ON ?auto_105820 ?auto_105825 ) ( not ( = ?auto_105820 ?auto_105825 ) ) ( not ( = ?auto_105821 ?auto_105825 ) ) ( not ( = ?auto_105822 ?auto_105825 ) ) ( not ( = ?auto_105824 ?auto_105825 ) ) ( not ( = ?auto_105823 ?auto_105825 ) ) ( not ( = ?auto_105827 ?auto_105825 ) ) ( not ( = ?auto_105826 ?auto_105825 ) ) ( ON ?auto_105821 ?auto_105820 ) ( ON-TABLE ?auto_105825 ) ( ON ?auto_105822 ?auto_105821 ) ( ON ?auto_105824 ?auto_105822 ) ( CLEAR ?auto_105824 ) ( HOLDING ?auto_105826 ) ( CLEAR ?auto_105827 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105823 ?auto_105827 ?auto_105826 )
      ( MAKE-3PILE ?auto_105820 ?auto_105821 ?auto_105822 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105828 - BLOCK
      ?auto_105829 - BLOCK
      ?auto_105830 - BLOCK
    )
    :vars
    (
      ?auto_105832 - BLOCK
      ?auto_105833 - BLOCK
      ?auto_105834 - BLOCK
      ?auto_105831 - BLOCK
      ?auto_105835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105828 ?auto_105829 ) ) ( not ( = ?auto_105828 ?auto_105830 ) ) ( not ( = ?auto_105829 ?auto_105830 ) ) ( not ( = ?auto_105828 ?auto_105832 ) ) ( not ( = ?auto_105829 ?auto_105832 ) ) ( not ( = ?auto_105830 ?auto_105832 ) ) ( ON-TABLE ?auto_105833 ) ( ON ?auto_105834 ?auto_105833 ) ( not ( = ?auto_105833 ?auto_105834 ) ) ( not ( = ?auto_105833 ?auto_105831 ) ) ( not ( = ?auto_105833 ?auto_105832 ) ) ( not ( = ?auto_105833 ?auto_105830 ) ) ( not ( = ?auto_105833 ?auto_105829 ) ) ( not ( = ?auto_105834 ?auto_105831 ) ) ( not ( = ?auto_105834 ?auto_105832 ) ) ( not ( = ?auto_105834 ?auto_105830 ) ) ( not ( = ?auto_105834 ?auto_105829 ) ) ( not ( = ?auto_105831 ?auto_105832 ) ) ( not ( = ?auto_105831 ?auto_105830 ) ) ( not ( = ?auto_105831 ?auto_105829 ) ) ( not ( = ?auto_105828 ?auto_105833 ) ) ( not ( = ?auto_105828 ?auto_105834 ) ) ( not ( = ?auto_105828 ?auto_105831 ) ) ( ON ?auto_105828 ?auto_105835 ) ( not ( = ?auto_105828 ?auto_105835 ) ) ( not ( = ?auto_105829 ?auto_105835 ) ) ( not ( = ?auto_105830 ?auto_105835 ) ) ( not ( = ?auto_105832 ?auto_105835 ) ) ( not ( = ?auto_105833 ?auto_105835 ) ) ( not ( = ?auto_105834 ?auto_105835 ) ) ( not ( = ?auto_105831 ?auto_105835 ) ) ( ON ?auto_105829 ?auto_105828 ) ( ON-TABLE ?auto_105835 ) ( ON ?auto_105830 ?auto_105829 ) ( ON ?auto_105832 ?auto_105830 ) ( CLEAR ?auto_105834 ) ( ON ?auto_105831 ?auto_105832 ) ( CLEAR ?auto_105831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105835 ?auto_105828 ?auto_105829 ?auto_105830 ?auto_105832 )
      ( MAKE-3PILE ?auto_105828 ?auto_105829 ?auto_105830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105836 - BLOCK
      ?auto_105837 - BLOCK
      ?auto_105838 - BLOCK
    )
    :vars
    (
      ?auto_105843 - BLOCK
      ?auto_105840 - BLOCK
      ?auto_105839 - BLOCK
      ?auto_105842 - BLOCK
      ?auto_105841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105836 ?auto_105837 ) ) ( not ( = ?auto_105836 ?auto_105838 ) ) ( not ( = ?auto_105837 ?auto_105838 ) ) ( not ( = ?auto_105836 ?auto_105843 ) ) ( not ( = ?auto_105837 ?auto_105843 ) ) ( not ( = ?auto_105838 ?auto_105843 ) ) ( ON-TABLE ?auto_105840 ) ( not ( = ?auto_105840 ?auto_105839 ) ) ( not ( = ?auto_105840 ?auto_105842 ) ) ( not ( = ?auto_105840 ?auto_105843 ) ) ( not ( = ?auto_105840 ?auto_105838 ) ) ( not ( = ?auto_105840 ?auto_105837 ) ) ( not ( = ?auto_105839 ?auto_105842 ) ) ( not ( = ?auto_105839 ?auto_105843 ) ) ( not ( = ?auto_105839 ?auto_105838 ) ) ( not ( = ?auto_105839 ?auto_105837 ) ) ( not ( = ?auto_105842 ?auto_105843 ) ) ( not ( = ?auto_105842 ?auto_105838 ) ) ( not ( = ?auto_105842 ?auto_105837 ) ) ( not ( = ?auto_105836 ?auto_105840 ) ) ( not ( = ?auto_105836 ?auto_105839 ) ) ( not ( = ?auto_105836 ?auto_105842 ) ) ( ON ?auto_105836 ?auto_105841 ) ( not ( = ?auto_105836 ?auto_105841 ) ) ( not ( = ?auto_105837 ?auto_105841 ) ) ( not ( = ?auto_105838 ?auto_105841 ) ) ( not ( = ?auto_105843 ?auto_105841 ) ) ( not ( = ?auto_105840 ?auto_105841 ) ) ( not ( = ?auto_105839 ?auto_105841 ) ) ( not ( = ?auto_105842 ?auto_105841 ) ) ( ON ?auto_105837 ?auto_105836 ) ( ON-TABLE ?auto_105841 ) ( ON ?auto_105838 ?auto_105837 ) ( ON ?auto_105843 ?auto_105838 ) ( ON ?auto_105842 ?auto_105843 ) ( CLEAR ?auto_105842 ) ( HOLDING ?auto_105839 ) ( CLEAR ?auto_105840 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105840 ?auto_105839 )
      ( MAKE-3PILE ?auto_105836 ?auto_105837 ?auto_105838 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105844 - BLOCK
      ?auto_105845 - BLOCK
      ?auto_105846 - BLOCK
    )
    :vars
    (
      ?auto_105847 - BLOCK
      ?auto_105849 - BLOCK
      ?auto_105851 - BLOCK
      ?auto_105850 - BLOCK
      ?auto_105848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105844 ?auto_105845 ) ) ( not ( = ?auto_105844 ?auto_105846 ) ) ( not ( = ?auto_105845 ?auto_105846 ) ) ( not ( = ?auto_105844 ?auto_105847 ) ) ( not ( = ?auto_105845 ?auto_105847 ) ) ( not ( = ?auto_105846 ?auto_105847 ) ) ( ON-TABLE ?auto_105849 ) ( not ( = ?auto_105849 ?auto_105851 ) ) ( not ( = ?auto_105849 ?auto_105850 ) ) ( not ( = ?auto_105849 ?auto_105847 ) ) ( not ( = ?auto_105849 ?auto_105846 ) ) ( not ( = ?auto_105849 ?auto_105845 ) ) ( not ( = ?auto_105851 ?auto_105850 ) ) ( not ( = ?auto_105851 ?auto_105847 ) ) ( not ( = ?auto_105851 ?auto_105846 ) ) ( not ( = ?auto_105851 ?auto_105845 ) ) ( not ( = ?auto_105850 ?auto_105847 ) ) ( not ( = ?auto_105850 ?auto_105846 ) ) ( not ( = ?auto_105850 ?auto_105845 ) ) ( not ( = ?auto_105844 ?auto_105849 ) ) ( not ( = ?auto_105844 ?auto_105851 ) ) ( not ( = ?auto_105844 ?auto_105850 ) ) ( ON ?auto_105844 ?auto_105848 ) ( not ( = ?auto_105844 ?auto_105848 ) ) ( not ( = ?auto_105845 ?auto_105848 ) ) ( not ( = ?auto_105846 ?auto_105848 ) ) ( not ( = ?auto_105847 ?auto_105848 ) ) ( not ( = ?auto_105849 ?auto_105848 ) ) ( not ( = ?auto_105851 ?auto_105848 ) ) ( not ( = ?auto_105850 ?auto_105848 ) ) ( ON ?auto_105845 ?auto_105844 ) ( ON-TABLE ?auto_105848 ) ( ON ?auto_105846 ?auto_105845 ) ( ON ?auto_105847 ?auto_105846 ) ( ON ?auto_105850 ?auto_105847 ) ( CLEAR ?auto_105849 ) ( ON ?auto_105851 ?auto_105850 ) ( CLEAR ?auto_105851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105848 ?auto_105844 ?auto_105845 ?auto_105846 ?auto_105847 ?auto_105850 )
      ( MAKE-3PILE ?auto_105844 ?auto_105845 ?auto_105846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105852 - BLOCK
      ?auto_105853 - BLOCK
      ?auto_105854 - BLOCK
    )
    :vars
    (
      ?auto_105856 - BLOCK
      ?auto_105859 - BLOCK
      ?auto_105858 - BLOCK
      ?auto_105857 - BLOCK
      ?auto_105855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105852 ?auto_105853 ) ) ( not ( = ?auto_105852 ?auto_105854 ) ) ( not ( = ?auto_105853 ?auto_105854 ) ) ( not ( = ?auto_105852 ?auto_105856 ) ) ( not ( = ?auto_105853 ?auto_105856 ) ) ( not ( = ?auto_105854 ?auto_105856 ) ) ( not ( = ?auto_105859 ?auto_105858 ) ) ( not ( = ?auto_105859 ?auto_105857 ) ) ( not ( = ?auto_105859 ?auto_105856 ) ) ( not ( = ?auto_105859 ?auto_105854 ) ) ( not ( = ?auto_105859 ?auto_105853 ) ) ( not ( = ?auto_105858 ?auto_105857 ) ) ( not ( = ?auto_105858 ?auto_105856 ) ) ( not ( = ?auto_105858 ?auto_105854 ) ) ( not ( = ?auto_105858 ?auto_105853 ) ) ( not ( = ?auto_105857 ?auto_105856 ) ) ( not ( = ?auto_105857 ?auto_105854 ) ) ( not ( = ?auto_105857 ?auto_105853 ) ) ( not ( = ?auto_105852 ?auto_105859 ) ) ( not ( = ?auto_105852 ?auto_105858 ) ) ( not ( = ?auto_105852 ?auto_105857 ) ) ( ON ?auto_105852 ?auto_105855 ) ( not ( = ?auto_105852 ?auto_105855 ) ) ( not ( = ?auto_105853 ?auto_105855 ) ) ( not ( = ?auto_105854 ?auto_105855 ) ) ( not ( = ?auto_105856 ?auto_105855 ) ) ( not ( = ?auto_105859 ?auto_105855 ) ) ( not ( = ?auto_105858 ?auto_105855 ) ) ( not ( = ?auto_105857 ?auto_105855 ) ) ( ON ?auto_105853 ?auto_105852 ) ( ON-TABLE ?auto_105855 ) ( ON ?auto_105854 ?auto_105853 ) ( ON ?auto_105856 ?auto_105854 ) ( ON ?auto_105857 ?auto_105856 ) ( ON ?auto_105858 ?auto_105857 ) ( CLEAR ?auto_105858 ) ( HOLDING ?auto_105859 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105859 )
      ( MAKE-3PILE ?auto_105852 ?auto_105853 ?auto_105854 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105860 - BLOCK
      ?auto_105861 - BLOCK
      ?auto_105862 - BLOCK
    )
    :vars
    (
      ?auto_105867 - BLOCK
      ?auto_105866 - BLOCK
      ?auto_105863 - BLOCK
      ?auto_105864 - BLOCK
      ?auto_105865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_105860 ?auto_105861 ) ) ( not ( = ?auto_105860 ?auto_105862 ) ) ( not ( = ?auto_105861 ?auto_105862 ) ) ( not ( = ?auto_105860 ?auto_105867 ) ) ( not ( = ?auto_105861 ?auto_105867 ) ) ( not ( = ?auto_105862 ?auto_105867 ) ) ( not ( = ?auto_105866 ?auto_105863 ) ) ( not ( = ?auto_105866 ?auto_105864 ) ) ( not ( = ?auto_105866 ?auto_105867 ) ) ( not ( = ?auto_105866 ?auto_105862 ) ) ( not ( = ?auto_105866 ?auto_105861 ) ) ( not ( = ?auto_105863 ?auto_105864 ) ) ( not ( = ?auto_105863 ?auto_105867 ) ) ( not ( = ?auto_105863 ?auto_105862 ) ) ( not ( = ?auto_105863 ?auto_105861 ) ) ( not ( = ?auto_105864 ?auto_105867 ) ) ( not ( = ?auto_105864 ?auto_105862 ) ) ( not ( = ?auto_105864 ?auto_105861 ) ) ( not ( = ?auto_105860 ?auto_105866 ) ) ( not ( = ?auto_105860 ?auto_105863 ) ) ( not ( = ?auto_105860 ?auto_105864 ) ) ( ON ?auto_105860 ?auto_105865 ) ( not ( = ?auto_105860 ?auto_105865 ) ) ( not ( = ?auto_105861 ?auto_105865 ) ) ( not ( = ?auto_105862 ?auto_105865 ) ) ( not ( = ?auto_105867 ?auto_105865 ) ) ( not ( = ?auto_105866 ?auto_105865 ) ) ( not ( = ?auto_105863 ?auto_105865 ) ) ( not ( = ?auto_105864 ?auto_105865 ) ) ( ON ?auto_105861 ?auto_105860 ) ( ON-TABLE ?auto_105865 ) ( ON ?auto_105862 ?auto_105861 ) ( ON ?auto_105867 ?auto_105862 ) ( ON ?auto_105864 ?auto_105867 ) ( ON ?auto_105863 ?auto_105864 ) ( ON ?auto_105866 ?auto_105863 ) ( CLEAR ?auto_105866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105865 ?auto_105860 ?auto_105861 ?auto_105862 ?auto_105867 ?auto_105864 ?auto_105863 )
      ( MAKE-3PILE ?auto_105860 ?auto_105861 ?auto_105862 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105871 - BLOCK
      ?auto_105872 - BLOCK
      ?auto_105873 - BLOCK
    )
    :vars
    (
      ?auto_105874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105874 ?auto_105873 ) ( CLEAR ?auto_105874 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105871 ) ( ON ?auto_105872 ?auto_105871 ) ( ON ?auto_105873 ?auto_105872 ) ( not ( = ?auto_105871 ?auto_105872 ) ) ( not ( = ?auto_105871 ?auto_105873 ) ) ( not ( = ?auto_105871 ?auto_105874 ) ) ( not ( = ?auto_105872 ?auto_105873 ) ) ( not ( = ?auto_105872 ?auto_105874 ) ) ( not ( = ?auto_105873 ?auto_105874 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105874 ?auto_105873 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105875 - BLOCK
      ?auto_105876 - BLOCK
      ?auto_105877 - BLOCK
    )
    :vars
    (
      ?auto_105878 - BLOCK
      ?auto_105879 - BLOCK
      ?auto_105880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105878 ?auto_105877 ) ( CLEAR ?auto_105878 ) ( ON-TABLE ?auto_105875 ) ( ON ?auto_105876 ?auto_105875 ) ( ON ?auto_105877 ?auto_105876 ) ( not ( = ?auto_105875 ?auto_105876 ) ) ( not ( = ?auto_105875 ?auto_105877 ) ) ( not ( = ?auto_105875 ?auto_105878 ) ) ( not ( = ?auto_105876 ?auto_105877 ) ) ( not ( = ?auto_105876 ?auto_105878 ) ) ( not ( = ?auto_105877 ?auto_105878 ) ) ( HOLDING ?auto_105879 ) ( CLEAR ?auto_105880 ) ( not ( = ?auto_105875 ?auto_105879 ) ) ( not ( = ?auto_105875 ?auto_105880 ) ) ( not ( = ?auto_105876 ?auto_105879 ) ) ( not ( = ?auto_105876 ?auto_105880 ) ) ( not ( = ?auto_105877 ?auto_105879 ) ) ( not ( = ?auto_105877 ?auto_105880 ) ) ( not ( = ?auto_105878 ?auto_105879 ) ) ( not ( = ?auto_105878 ?auto_105880 ) ) ( not ( = ?auto_105879 ?auto_105880 ) ) )
    :subtasks
    ( ( !STACK ?auto_105879 ?auto_105880 )
      ( MAKE-3PILE ?auto_105875 ?auto_105876 ?auto_105877 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105881 - BLOCK
      ?auto_105882 - BLOCK
      ?auto_105883 - BLOCK
    )
    :vars
    (
      ?auto_105884 - BLOCK
      ?auto_105885 - BLOCK
      ?auto_105886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105884 ?auto_105883 ) ( ON-TABLE ?auto_105881 ) ( ON ?auto_105882 ?auto_105881 ) ( ON ?auto_105883 ?auto_105882 ) ( not ( = ?auto_105881 ?auto_105882 ) ) ( not ( = ?auto_105881 ?auto_105883 ) ) ( not ( = ?auto_105881 ?auto_105884 ) ) ( not ( = ?auto_105882 ?auto_105883 ) ) ( not ( = ?auto_105882 ?auto_105884 ) ) ( not ( = ?auto_105883 ?auto_105884 ) ) ( CLEAR ?auto_105885 ) ( not ( = ?auto_105881 ?auto_105886 ) ) ( not ( = ?auto_105881 ?auto_105885 ) ) ( not ( = ?auto_105882 ?auto_105886 ) ) ( not ( = ?auto_105882 ?auto_105885 ) ) ( not ( = ?auto_105883 ?auto_105886 ) ) ( not ( = ?auto_105883 ?auto_105885 ) ) ( not ( = ?auto_105884 ?auto_105886 ) ) ( not ( = ?auto_105884 ?auto_105885 ) ) ( not ( = ?auto_105886 ?auto_105885 ) ) ( ON ?auto_105886 ?auto_105884 ) ( CLEAR ?auto_105886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105881 ?auto_105882 ?auto_105883 ?auto_105884 )
      ( MAKE-3PILE ?auto_105881 ?auto_105882 ?auto_105883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105887 - BLOCK
      ?auto_105888 - BLOCK
      ?auto_105889 - BLOCK
    )
    :vars
    (
      ?auto_105891 - BLOCK
      ?auto_105890 - BLOCK
      ?auto_105892 - BLOCK
      ?auto_105893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105891 ?auto_105889 ) ( ON-TABLE ?auto_105887 ) ( ON ?auto_105888 ?auto_105887 ) ( ON ?auto_105889 ?auto_105888 ) ( not ( = ?auto_105887 ?auto_105888 ) ) ( not ( = ?auto_105887 ?auto_105889 ) ) ( not ( = ?auto_105887 ?auto_105891 ) ) ( not ( = ?auto_105888 ?auto_105889 ) ) ( not ( = ?auto_105888 ?auto_105891 ) ) ( not ( = ?auto_105889 ?auto_105891 ) ) ( not ( = ?auto_105887 ?auto_105890 ) ) ( not ( = ?auto_105887 ?auto_105892 ) ) ( not ( = ?auto_105888 ?auto_105890 ) ) ( not ( = ?auto_105888 ?auto_105892 ) ) ( not ( = ?auto_105889 ?auto_105890 ) ) ( not ( = ?auto_105889 ?auto_105892 ) ) ( not ( = ?auto_105891 ?auto_105890 ) ) ( not ( = ?auto_105891 ?auto_105892 ) ) ( not ( = ?auto_105890 ?auto_105892 ) ) ( ON ?auto_105890 ?auto_105891 ) ( CLEAR ?auto_105890 ) ( HOLDING ?auto_105892 ) ( CLEAR ?auto_105893 ) ( ON-TABLE ?auto_105893 ) ( not ( = ?auto_105893 ?auto_105892 ) ) ( not ( = ?auto_105887 ?auto_105893 ) ) ( not ( = ?auto_105888 ?auto_105893 ) ) ( not ( = ?auto_105889 ?auto_105893 ) ) ( not ( = ?auto_105891 ?auto_105893 ) ) ( not ( = ?auto_105890 ?auto_105893 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105893 ?auto_105892 )
      ( MAKE-3PILE ?auto_105887 ?auto_105888 ?auto_105889 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105894 - BLOCK
      ?auto_105895 - BLOCK
      ?auto_105896 - BLOCK
    )
    :vars
    (
      ?auto_105899 - BLOCK
      ?auto_105900 - BLOCK
      ?auto_105898 - BLOCK
      ?auto_105897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105899 ?auto_105896 ) ( ON-TABLE ?auto_105894 ) ( ON ?auto_105895 ?auto_105894 ) ( ON ?auto_105896 ?auto_105895 ) ( not ( = ?auto_105894 ?auto_105895 ) ) ( not ( = ?auto_105894 ?auto_105896 ) ) ( not ( = ?auto_105894 ?auto_105899 ) ) ( not ( = ?auto_105895 ?auto_105896 ) ) ( not ( = ?auto_105895 ?auto_105899 ) ) ( not ( = ?auto_105896 ?auto_105899 ) ) ( not ( = ?auto_105894 ?auto_105900 ) ) ( not ( = ?auto_105894 ?auto_105898 ) ) ( not ( = ?auto_105895 ?auto_105900 ) ) ( not ( = ?auto_105895 ?auto_105898 ) ) ( not ( = ?auto_105896 ?auto_105900 ) ) ( not ( = ?auto_105896 ?auto_105898 ) ) ( not ( = ?auto_105899 ?auto_105900 ) ) ( not ( = ?auto_105899 ?auto_105898 ) ) ( not ( = ?auto_105900 ?auto_105898 ) ) ( ON ?auto_105900 ?auto_105899 ) ( CLEAR ?auto_105897 ) ( ON-TABLE ?auto_105897 ) ( not ( = ?auto_105897 ?auto_105898 ) ) ( not ( = ?auto_105894 ?auto_105897 ) ) ( not ( = ?auto_105895 ?auto_105897 ) ) ( not ( = ?auto_105896 ?auto_105897 ) ) ( not ( = ?auto_105899 ?auto_105897 ) ) ( not ( = ?auto_105900 ?auto_105897 ) ) ( ON ?auto_105898 ?auto_105900 ) ( CLEAR ?auto_105898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105894 ?auto_105895 ?auto_105896 ?auto_105899 ?auto_105900 )
      ( MAKE-3PILE ?auto_105894 ?auto_105895 ?auto_105896 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105901 - BLOCK
      ?auto_105902 - BLOCK
      ?auto_105903 - BLOCK
    )
    :vars
    (
      ?auto_105907 - BLOCK
      ?auto_105905 - BLOCK
      ?auto_105904 - BLOCK
      ?auto_105906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105907 ?auto_105903 ) ( ON-TABLE ?auto_105901 ) ( ON ?auto_105902 ?auto_105901 ) ( ON ?auto_105903 ?auto_105902 ) ( not ( = ?auto_105901 ?auto_105902 ) ) ( not ( = ?auto_105901 ?auto_105903 ) ) ( not ( = ?auto_105901 ?auto_105907 ) ) ( not ( = ?auto_105902 ?auto_105903 ) ) ( not ( = ?auto_105902 ?auto_105907 ) ) ( not ( = ?auto_105903 ?auto_105907 ) ) ( not ( = ?auto_105901 ?auto_105905 ) ) ( not ( = ?auto_105901 ?auto_105904 ) ) ( not ( = ?auto_105902 ?auto_105905 ) ) ( not ( = ?auto_105902 ?auto_105904 ) ) ( not ( = ?auto_105903 ?auto_105905 ) ) ( not ( = ?auto_105903 ?auto_105904 ) ) ( not ( = ?auto_105907 ?auto_105905 ) ) ( not ( = ?auto_105907 ?auto_105904 ) ) ( not ( = ?auto_105905 ?auto_105904 ) ) ( ON ?auto_105905 ?auto_105907 ) ( not ( = ?auto_105906 ?auto_105904 ) ) ( not ( = ?auto_105901 ?auto_105906 ) ) ( not ( = ?auto_105902 ?auto_105906 ) ) ( not ( = ?auto_105903 ?auto_105906 ) ) ( not ( = ?auto_105907 ?auto_105906 ) ) ( not ( = ?auto_105905 ?auto_105906 ) ) ( ON ?auto_105904 ?auto_105905 ) ( CLEAR ?auto_105904 ) ( HOLDING ?auto_105906 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_105906 )
      ( MAKE-3PILE ?auto_105901 ?auto_105902 ?auto_105903 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105908 - BLOCK
      ?auto_105909 - BLOCK
      ?auto_105910 - BLOCK
    )
    :vars
    (
      ?auto_105914 - BLOCK
      ?auto_105911 - BLOCK
      ?auto_105912 - BLOCK
      ?auto_105913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105914 ?auto_105910 ) ( ON-TABLE ?auto_105908 ) ( ON ?auto_105909 ?auto_105908 ) ( ON ?auto_105910 ?auto_105909 ) ( not ( = ?auto_105908 ?auto_105909 ) ) ( not ( = ?auto_105908 ?auto_105910 ) ) ( not ( = ?auto_105908 ?auto_105914 ) ) ( not ( = ?auto_105909 ?auto_105910 ) ) ( not ( = ?auto_105909 ?auto_105914 ) ) ( not ( = ?auto_105910 ?auto_105914 ) ) ( not ( = ?auto_105908 ?auto_105911 ) ) ( not ( = ?auto_105908 ?auto_105912 ) ) ( not ( = ?auto_105909 ?auto_105911 ) ) ( not ( = ?auto_105909 ?auto_105912 ) ) ( not ( = ?auto_105910 ?auto_105911 ) ) ( not ( = ?auto_105910 ?auto_105912 ) ) ( not ( = ?auto_105914 ?auto_105911 ) ) ( not ( = ?auto_105914 ?auto_105912 ) ) ( not ( = ?auto_105911 ?auto_105912 ) ) ( ON ?auto_105911 ?auto_105914 ) ( not ( = ?auto_105913 ?auto_105912 ) ) ( not ( = ?auto_105908 ?auto_105913 ) ) ( not ( = ?auto_105909 ?auto_105913 ) ) ( not ( = ?auto_105910 ?auto_105913 ) ) ( not ( = ?auto_105914 ?auto_105913 ) ) ( not ( = ?auto_105911 ?auto_105913 ) ) ( ON ?auto_105912 ?auto_105911 ) ( ON ?auto_105913 ?auto_105912 ) ( CLEAR ?auto_105913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105908 ?auto_105909 ?auto_105910 ?auto_105914 ?auto_105911 ?auto_105912 )
      ( MAKE-3PILE ?auto_105908 ?auto_105909 ?auto_105910 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105915 - BLOCK
      ?auto_105916 - BLOCK
      ?auto_105917 - BLOCK
    )
    :vars
    (
      ?auto_105920 - BLOCK
      ?auto_105921 - BLOCK
      ?auto_105919 - BLOCK
      ?auto_105918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105920 ?auto_105917 ) ( ON-TABLE ?auto_105915 ) ( ON ?auto_105916 ?auto_105915 ) ( ON ?auto_105917 ?auto_105916 ) ( not ( = ?auto_105915 ?auto_105916 ) ) ( not ( = ?auto_105915 ?auto_105917 ) ) ( not ( = ?auto_105915 ?auto_105920 ) ) ( not ( = ?auto_105916 ?auto_105917 ) ) ( not ( = ?auto_105916 ?auto_105920 ) ) ( not ( = ?auto_105917 ?auto_105920 ) ) ( not ( = ?auto_105915 ?auto_105921 ) ) ( not ( = ?auto_105915 ?auto_105919 ) ) ( not ( = ?auto_105916 ?auto_105921 ) ) ( not ( = ?auto_105916 ?auto_105919 ) ) ( not ( = ?auto_105917 ?auto_105921 ) ) ( not ( = ?auto_105917 ?auto_105919 ) ) ( not ( = ?auto_105920 ?auto_105921 ) ) ( not ( = ?auto_105920 ?auto_105919 ) ) ( not ( = ?auto_105921 ?auto_105919 ) ) ( ON ?auto_105921 ?auto_105920 ) ( not ( = ?auto_105918 ?auto_105919 ) ) ( not ( = ?auto_105915 ?auto_105918 ) ) ( not ( = ?auto_105916 ?auto_105918 ) ) ( not ( = ?auto_105917 ?auto_105918 ) ) ( not ( = ?auto_105920 ?auto_105918 ) ) ( not ( = ?auto_105921 ?auto_105918 ) ) ( ON ?auto_105919 ?auto_105921 ) ( HOLDING ?auto_105918 ) ( CLEAR ?auto_105919 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_105915 ?auto_105916 ?auto_105917 ?auto_105920 ?auto_105921 ?auto_105919 ?auto_105918 )
      ( MAKE-3PILE ?auto_105915 ?auto_105916 ?auto_105917 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105922 - BLOCK
      ?auto_105923 - BLOCK
      ?auto_105924 - BLOCK
    )
    :vars
    (
      ?auto_105926 - BLOCK
      ?auto_105925 - BLOCK
      ?auto_105927 - BLOCK
      ?auto_105928 - BLOCK
      ?auto_105929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105926 ?auto_105924 ) ( ON-TABLE ?auto_105922 ) ( ON ?auto_105923 ?auto_105922 ) ( ON ?auto_105924 ?auto_105923 ) ( not ( = ?auto_105922 ?auto_105923 ) ) ( not ( = ?auto_105922 ?auto_105924 ) ) ( not ( = ?auto_105922 ?auto_105926 ) ) ( not ( = ?auto_105923 ?auto_105924 ) ) ( not ( = ?auto_105923 ?auto_105926 ) ) ( not ( = ?auto_105924 ?auto_105926 ) ) ( not ( = ?auto_105922 ?auto_105925 ) ) ( not ( = ?auto_105922 ?auto_105927 ) ) ( not ( = ?auto_105923 ?auto_105925 ) ) ( not ( = ?auto_105923 ?auto_105927 ) ) ( not ( = ?auto_105924 ?auto_105925 ) ) ( not ( = ?auto_105924 ?auto_105927 ) ) ( not ( = ?auto_105926 ?auto_105925 ) ) ( not ( = ?auto_105926 ?auto_105927 ) ) ( not ( = ?auto_105925 ?auto_105927 ) ) ( ON ?auto_105925 ?auto_105926 ) ( not ( = ?auto_105928 ?auto_105927 ) ) ( not ( = ?auto_105922 ?auto_105928 ) ) ( not ( = ?auto_105923 ?auto_105928 ) ) ( not ( = ?auto_105924 ?auto_105928 ) ) ( not ( = ?auto_105926 ?auto_105928 ) ) ( not ( = ?auto_105925 ?auto_105928 ) ) ( ON ?auto_105927 ?auto_105925 ) ( CLEAR ?auto_105927 ) ( ON ?auto_105928 ?auto_105929 ) ( CLEAR ?auto_105928 ) ( HAND-EMPTY ) ( not ( = ?auto_105922 ?auto_105929 ) ) ( not ( = ?auto_105923 ?auto_105929 ) ) ( not ( = ?auto_105924 ?auto_105929 ) ) ( not ( = ?auto_105926 ?auto_105929 ) ) ( not ( = ?auto_105925 ?auto_105929 ) ) ( not ( = ?auto_105927 ?auto_105929 ) ) ( not ( = ?auto_105928 ?auto_105929 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_105928 ?auto_105929 )
      ( MAKE-3PILE ?auto_105922 ?auto_105923 ?auto_105924 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105930 - BLOCK
      ?auto_105931 - BLOCK
      ?auto_105932 - BLOCK
    )
    :vars
    (
      ?auto_105933 - BLOCK
      ?auto_105937 - BLOCK
      ?auto_105936 - BLOCK
      ?auto_105934 - BLOCK
      ?auto_105935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105933 ?auto_105932 ) ( ON-TABLE ?auto_105930 ) ( ON ?auto_105931 ?auto_105930 ) ( ON ?auto_105932 ?auto_105931 ) ( not ( = ?auto_105930 ?auto_105931 ) ) ( not ( = ?auto_105930 ?auto_105932 ) ) ( not ( = ?auto_105930 ?auto_105933 ) ) ( not ( = ?auto_105931 ?auto_105932 ) ) ( not ( = ?auto_105931 ?auto_105933 ) ) ( not ( = ?auto_105932 ?auto_105933 ) ) ( not ( = ?auto_105930 ?auto_105937 ) ) ( not ( = ?auto_105930 ?auto_105936 ) ) ( not ( = ?auto_105931 ?auto_105937 ) ) ( not ( = ?auto_105931 ?auto_105936 ) ) ( not ( = ?auto_105932 ?auto_105937 ) ) ( not ( = ?auto_105932 ?auto_105936 ) ) ( not ( = ?auto_105933 ?auto_105937 ) ) ( not ( = ?auto_105933 ?auto_105936 ) ) ( not ( = ?auto_105937 ?auto_105936 ) ) ( ON ?auto_105937 ?auto_105933 ) ( not ( = ?auto_105934 ?auto_105936 ) ) ( not ( = ?auto_105930 ?auto_105934 ) ) ( not ( = ?auto_105931 ?auto_105934 ) ) ( not ( = ?auto_105932 ?auto_105934 ) ) ( not ( = ?auto_105933 ?auto_105934 ) ) ( not ( = ?auto_105937 ?auto_105934 ) ) ( ON ?auto_105934 ?auto_105935 ) ( CLEAR ?auto_105934 ) ( not ( = ?auto_105930 ?auto_105935 ) ) ( not ( = ?auto_105931 ?auto_105935 ) ) ( not ( = ?auto_105932 ?auto_105935 ) ) ( not ( = ?auto_105933 ?auto_105935 ) ) ( not ( = ?auto_105937 ?auto_105935 ) ) ( not ( = ?auto_105936 ?auto_105935 ) ) ( not ( = ?auto_105934 ?auto_105935 ) ) ( HOLDING ?auto_105936 ) ( CLEAR ?auto_105937 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_105930 ?auto_105931 ?auto_105932 ?auto_105933 ?auto_105937 ?auto_105936 )
      ( MAKE-3PILE ?auto_105930 ?auto_105931 ?auto_105932 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105938 - BLOCK
      ?auto_105939 - BLOCK
      ?auto_105940 - BLOCK
    )
    :vars
    (
      ?auto_105942 - BLOCK
      ?auto_105943 - BLOCK
      ?auto_105941 - BLOCK
      ?auto_105945 - BLOCK
      ?auto_105944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105942 ?auto_105940 ) ( ON-TABLE ?auto_105938 ) ( ON ?auto_105939 ?auto_105938 ) ( ON ?auto_105940 ?auto_105939 ) ( not ( = ?auto_105938 ?auto_105939 ) ) ( not ( = ?auto_105938 ?auto_105940 ) ) ( not ( = ?auto_105938 ?auto_105942 ) ) ( not ( = ?auto_105939 ?auto_105940 ) ) ( not ( = ?auto_105939 ?auto_105942 ) ) ( not ( = ?auto_105940 ?auto_105942 ) ) ( not ( = ?auto_105938 ?auto_105943 ) ) ( not ( = ?auto_105938 ?auto_105941 ) ) ( not ( = ?auto_105939 ?auto_105943 ) ) ( not ( = ?auto_105939 ?auto_105941 ) ) ( not ( = ?auto_105940 ?auto_105943 ) ) ( not ( = ?auto_105940 ?auto_105941 ) ) ( not ( = ?auto_105942 ?auto_105943 ) ) ( not ( = ?auto_105942 ?auto_105941 ) ) ( not ( = ?auto_105943 ?auto_105941 ) ) ( ON ?auto_105943 ?auto_105942 ) ( not ( = ?auto_105945 ?auto_105941 ) ) ( not ( = ?auto_105938 ?auto_105945 ) ) ( not ( = ?auto_105939 ?auto_105945 ) ) ( not ( = ?auto_105940 ?auto_105945 ) ) ( not ( = ?auto_105942 ?auto_105945 ) ) ( not ( = ?auto_105943 ?auto_105945 ) ) ( ON ?auto_105945 ?auto_105944 ) ( not ( = ?auto_105938 ?auto_105944 ) ) ( not ( = ?auto_105939 ?auto_105944 ) ) ( not ( = ?auto_105940 ?auto_105944 ) ) ( not ( = ?auto_105942 ?auto_105944 ) ) ( not ( = ?auto_105943 ?auto_105944 ) ) ( not ( = ?auto_105941 ?auto_105944 ) ) ( not ( = ?auto_105945 ?auto_105944 ) ) ( CLEAR ?auto_105943 ) ( ON ?auto_105941 ?auto_105945 ) ( CLEAR ?auto_105941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_105944 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105944 ?auto_105945 )
      ( MAKE-3PILE ?auto_105938 ?auto_105939 ?auto_105940 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105946 - BLOCK
      ?auto_105947 - BLOCK
      ?auto_105948 - BLOCK
    )
    :vars
    (
      ?auto_105950 - BLOCK
      ?auto_105952 - BLOCK
      ?auto_105949 - BLOCK
      ?auto_105953 - BLOCK
      ?auto_105951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105950 ?auto_105948 ) ( ON-TABLE ?auto_105946 ) ( ON ?auto_105947 ?auto_105946 ) ( ON ?auto_105948 ?auto_105947 ) ( not ( = ?auto_105946 ?auto_105947 ) ) ( not ( = ?auto_105946 ?auto_105948 ) ) ( not ( = ?auto_105946 ?auto_105950 ) ) ( not ( = ?auto_105947 ?auto_105948 ) ) ( not ( = ?auto_105947 ?auto_105950 ) ) ( not ( = ?auto_105948 ?auto_105950 ) ) ( not ( = ?auto_105946 ?auto_105952 ) ) ( not ( = ?auto_105946 ?auto_105949 ) ) ( not ( = ?auto_105947 ?auto_105952 ) ) ( not ( = ?auto_105947 ?auto_105949 ) ) ( not ( = ?auto_105948 ?auto_105952 ) ) ( not ( = ?auto_105948 ?auto_105949 ) ) ( not ( = ?auto_105950 ?auto_105952 ) ) ( not ( = ?auto_105950 ?auto_105949 ) ) ( not ( = ?auto_105952 ?auto_105949 ) ) ( not ( = ?auto_105953 ?auto_105949 ) ) ( not ( = ?auto_105946 ?auto_105953 ) ) ( not ( = ?auto_105947 ?auto_105953 ) ) ( not ( = ?auto_105948 ?auto_105953 ) ) ( not ( = ?auto_105950 ?auto_105953 ) ) ( not ( = ?auto_105952 ?auto_105953 ) ) ( ON ?auto_105953 ?auto_105951 ) ( not ( = ?auto_105946 ?auto_105951 ) ) ( not ( = ?auto_105947 ?auto_105951 ) ) ( not ( = ?auto_105948 ?auto_105951 ) ) ( not ( = ?auto_105950 ?auto_105951 ) ) ( not ( = ?auto_105952 ?auto_105951 ) ) ( not ( = ?auto_105949 ?auto_105951 ) ) ( not ( = ?auto_105953 ?auto_105951 ) ) ( ON ?auto_105949 ?auto_105953 ) ( CLEAR ?auto_105949 ) ( ON-TABLE ?auto_105951 ) ( HOLDING ?auto_105952 ) ( CLEAR ?auto_105950 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105946 ?auto_105947 ?auto_105948 ?auto_105950 ?auto_105952 )
      ( MAKE-3PILE ?auto_105946 ?auto_105947 ?auto_105948 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105954 - BLOCK
      ?auto_105955 - BLOCK
      ?auto_105956 - BLOCK
    )
    :vars
    (
      ?auto_105958 - BLOCK
      ?auto_105959 - BLOCK
      ?auto_105960 - BLOCK
      ?auto_105961 - BLOCK
      ?auto_105957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105958 ?auto_105956 ) ( ON-TABLE ?auto_105954 ) ( ON ?auto_105955 ?auto_105954 ) ( ON ?auto_105956 ?auto_105955 ) ( not ( = ?auto_105954 ?auto_105955 ) ) ( not ( = ?auto_105954 ?auto_105956 ) ) ( not ( = ?auto_105954 ?auto_105958 ) ) ( not ( = ?auto_105955 ?auto_105956 ) ) ( not ( = ?auto_105955 ?auto_105958 ) ) ( not ( = ?auto_105956 ?auto_105958 ) ) ( not ( = ?auto_105954 ?auto_105959 ) ) ( not ( = ?auto_105954 ?auto_105960 ) ) ( not ( = ?auto_105955 ?auto_105959 ) ) ( not ( = ?auto_105955 ?auto_105960 ) ) ( not ( = ?auto_105956 ?auto_105959 ) ) ( not ( = ?auto_105956 ?auto_105960 ) ) ( not ( = ?auto_105958 ?auto_105959 ) ) ( not ( = ?auto_105958 ?auto_105960 ) ) ( not ( = ?auto_105959 ?auto_105960 ) ) ( not ( = ?auto_105961 ?auto_105960 ) ) ( not ( = ?auto_105954 ?auto_105961 ) ) ( not ( = ?auto_105955 ?auto_105961 ) ) ( not ( = ?auto_105956 ?auto_105961 ) ) ( not ( = ?auto_105958 ?auto_105961 ) ) ( not ( = ?auto_105959 ?auto_105961 ) ) ( ON ?auto_105961 ?auto_105957 ) ( not ( = ?auto_105954 ?auto_105957 ) ) ( not ( = ?auto_105955 ?auto_105957 ) ) ( not ( = ?auto_105956 ?auto_105957 ) ) ( not ( = ?auto_105958 ?auto_105957 ) ) ( not ( = ?auto_105959 ?auto_105957 ) ) ( not ( = ?auto_105960 ?auto_105957 ) ) ( not ( = ?auto_105961 ?auto_105957 ) ) ( ON ?auto_105960 ?auto_105961 ) ( ON-TABLE ?auto_105957 ) ( CLEAR ?auto_105958 ) ( ON ?auto_105959 ?auto_105960 ) ( CLEAR ?auto_105959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_105957 ?auto_105961 ?auto_105960 )
      ( MAKE-3PILE ?auto_105954 ?auto_105955 ?auto_105956 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105978 - BLOCK
      ?auto_105979 - BLOCK
      ?auto_105980 - BLOCK
    )
    :vars
    (
      ?auto_105983 - BLOCK
      ?auto_105985 - BLOCK
      ?auto_105984 - BLOCK
      ?auto_105982 - BLOCK
      ?auto_105981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105978 ) ( ON ?auto_105979 ?auto_105978 ) ( not ( = ?auto_105978 ?auto_105979 ) ) ( not ( = ?auto_105978 ?auto_105980 ) ) ( not ( = ?auto_105978 ?auto_105983 ) ) ( not ( = ?auto_105979 ?auto_105980 ) ) ( not ( = ?auto_105979 ?auto_105983 ) ) ( not ( = ?auto_105980 ?auto_105983 ) ) ( not ( = ?auto_105978 ?auto_105985 ) ) ( not ( = ?auto_105978 ?auto_105984 ) ) ( not ( = ?auto_105979 ?auto_105985 ) ) ( not ( = ?auto_105979 ?auto_105984 ) ) ( not ( = ?auto_105980 ?auto_105985 ) ) ( not ( = ?auto_105980 ?auto_105984 ) ) ( not ( = ?auto_105983 ?auto_105985 ) ) ( not ( = ?auto_105983 ?auto_105984 ) ) ( not ( = ?auto_105985 ?auto_105984 ) ) ( not ( = ?auto_105982 ?auto_105984 ) ) ( not ( = ?auto_105978 ?auto_105982 ) ) ( not ( = ?auto_105979 ?auto_105982 ) ) ( not ( = ?auto_105980 ?auto_105982 ) ) ( not ( = ?auto_105983 ?auto_105982 ) ) ( not ( = ?auto_105985 ?auto_105982 ) ) ( ON ?auto_105982 ?auto_105981 ) ( not ( = ?auto_105978 ?auto_105981 ) ) ( not ( = ?auto_105979 ?auto_105981 ) ) ( not ( = ?auto_105980 ?auto_105981 ) ) ( not ( = ?auto_105983 ?auto_105981 ) ) ( not ( = ?auto_105985 ?auto_105981 ) ) ( not ( = ?auto_105984 ?auto_105981 ) ) ( not ( = ?auto_105982 ?auto_105981 ) ) ( ON ?auto_105984 ?auto_105982 ) ( ON-TABLE ?auto_105981 ) ( ON ?auto_105985 ?auto_105984 ) ( ON ?auto_105983 ?auto_105985 ) ( CLEAR ?auto_105983 ) ( HOLDING ?auto_105980 ) ( CLEAR ?auto_105979 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_105978 ?auto_105979 ?auto_105980 ?auto_105983 )
      ( MAKE-3PILE ?auto_105978 ?auto_105979 ?auto_105980 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105986 - BLOCK
      ?auto_105987 - BLOCK
      ?auto_105988 - BLOCK
    )
    :vars
    (
      ?auto_105992 - BLOCK
      ?auto_105990 - BLOCK
      ?auto_105989 - BLOCK
      ?auto_105993 - BLOCK
      ?auto_105991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105986 ) ( ON ?auto_105987 ?auto_105986 ) ( not ( = ?auto_105986 ?auto_105987 ) ) ( not ( = ?auto_105986 ?auto_105988 ) ) ( not ( = ?auto_105986 ?auto_105992 ) ) ( not ( = ?auto_105987 ?auto_105988 ) ) ( not ( = ?auto_105987 ?auto_105992 ) ) ( not ( = ?auto_105988 ?auto_105992 ) ) ( not ( = ?auto_105986 ?auto_105990 ) ) ( not ( = ?auto_105986 ?auto_105989 ) ) ( not ( = ?auto_105987 ?auto_105990 ) ) ( not ( = ?auto_105987 ?auto_105989 ) ) ( not ( = ?auto_105988 ?auto_105990 ) ) ( not ( = ?auto_105988 ?auto_105989 ) ) ( not ( = ?auto_105992 ?auto_105990 ) ) ( not ( = ?auto_105992 ?auto_105989 ) ) ( not ( = ?auto_105990 ?auto_105989 ) ) ( not ( = ?auto_105993 ?auto_105989 ) ) ( not ( = ?auto_105986 ?auto_105993 ) ) ( not ( = ?auto_105987 ?auto_105993 ) ) ( not ( = ?auto_105988 ?auto_105993 ) ) ( not ( = ?auto_105992 ?auto_105993 ) ) ( not ( = ?auto_105990 ?auto_105993 ) ) ( ON ?auto_105993 ?auto_105991 ) ( not ( = ?auto_105986 ?auto_105991 ) ) ( not ( = ?auto_105987 ?auto_105991 ) ) ( not ( = ?auto_105988 ?auto_105991 ) ) ( not ( = ?auto_105992 ?auto_105991 ) ) ( not ( = ?auto_105990 ?auto_105991 ) ) ( not ( = ?auto_105989 ?auto_105991 ) ) ( not ( = ?auto_105993 ?auto_105991 ) ) ( ON ?auto_105989 ?auto_105993 ) ( ON-TABLE ?auto_105991 ) ( ON ?auto_105990 ?auto_105989 ) ( ON ?auto_105992 ?auto_105990 ) ( CLEAR ?auto_105987 ) ( ON ?auto_105988 ?auto_105992 ) ( CLEAR ?auto_105988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_105991 ?auto_105993 ?auto_105989 ?auto_105990 ?auto_105992 )
      ( MAKE-3PILE ?auto_105986 ?auto_105987 ?auto_105988 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_105994 - BLOCK
      ?auto_105995 - BLOCK
      ?auto_105996 - BLOCK
    )
    :vars
    (
      ?auto_106001 - BLOCK
      ?auto_105997 - BLOCK
      ?auto_106000 - BLOCK
      ?auto_105998 - BLOCK
      ?auto_105999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_105994 ) ( not ( = ?auto_105994 ?auto_105995 ) ) ( not ( = ?auto_105994 ?auto_105996 ) ) ( not ( = ?auto_105994 ?auto_106001 ) ) ( not ( = ?auto_105995 ?auto_105996 ) ) ( not ( = ?auto_105995 ?auto_106001 ) ) ( not ( = ?auto_105996 ?auto_106001 ) ) ( not ( = ?auto_105994 ?auto_105997 ) ) ( not ( = ?auto_105994 ?auto_106000 ) ) ( not ( = ?auto_105995 ?auto_105997 ) ) ( not ( = ?auto_105995 ?auto_106000 ) ) ( not ( = ?auto_105996 ?auto_105997 ) ) ( not ( = ?auto_105996 ?auto_106000 ) ) ( not ( = ?auto_106001 ?auto_105997 ) ) ( not ( = ?auto_106001 ?auto_106000 ) ) ( not ( = ?auto_105997 ?auto_106000 ) ) ( not ( = ?auto_105998 ?auto_106000 ) ) ( not ( = ?auto_105994 ?auto_105998 ) ) ( not ( = ?auto_105995 ?auto_105998 ) ) ( not ( = ?auto_105996 ?auto_105998 ) ) ( not ( = ?auto_106001 ?auto_105998 ) ) ( not ( = ?auto_105997 ?auto_105998 ) ) ( ON ?auto_105998 ?auto_105999 ) ( not ( = ?auto_105994 ?auto_105999 ) ) ( not ( = ?auto_105995 ?auto_105999 ) ) ( not ( = ?auto_105996 ?auto_105999 ) ) ( not ( = ?auto_106001 ?auto_105999 ) ) ( not ( = ?auto_105997 ?auto_105999 ) ) ( not ( = ?auto_106000 ?auto_105999 ) ) ( not ( = ?auto_105998 ?auto_105999 ) ) ( ON ?auto_106000 ?auto_105998 ) ( ON-TABLE ?auto_105999 ) ( ON ?auto_105997 ?auto_106000 ) ( ON ?auto_106001 ?auto_105997 ) ( ON ?auto_105996 ?auto_106001 ) ( CLEAR ?auto_105996 ) ( HOLDING ?auto_105995 ) ( CLEAR ?auto_105994 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_105994 ?auto_105995 )
      ( MAKE-3PILE ?auto_105994 ?auto_105995 ?auto_105996 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_106002 - BLOCK
      ?auto_106003 - BLOCK
      ?auto_106004 - BLOCK
    )
    :vars
    (
      ?auto_106006 - BLOCK
      ?auto_106007 - BLOCK
      ?auto_106005 - BLOCK
      ?auto_106008 - BLOCK
      ?auto_106009 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106002 ) ( not ( = ?auto_106002 ?auto_106003 ) ) ( not ( = ?auto_106002 ?auto_106004 ) ) ( not ( = ?auto_106002 ?auto_106006 ) ) ( not ( = ?auto_106003 ?auto_106004 ) ) ( not ( = ?auto_106003 ?auto_106006 ) ) ( not ( = ?auto_106004 ?auto_106006 ) ) ( not ( = ?auto_106002 ?auto_106007 ) ) ( not ( = ?auto_106002 ?auto_106005 ) ) ( not ( = ?auto_106003 ?auto_106007 ) ) ( not ( = ?auto_106003 ?auto_106005 ) ) ( not ( = ?auto_106004 ?auto_106007 ) ) ( not ( = ?auto_106004 ?auto_106005 ) ) ( not ( = ?auto_106006 ?auto_106007 ) ) ( not ( = ?auto_106006 ?auto_106005 ) ) ( not ( = ?auto_106007 ?auto_106005 ) ) ( not ( = ?auto_106008 ?auto_106005 ) ) ( not ( = ?auto_106002 ?auto_106008 ) ) ( not ( = ?auto_106003 ?auto_106008 ) ) ( not ( = ?auto_106004 ?auto_106008 ) ) ( not ( = ?auto_106006 ?auto_106008 ) ) ( not ( = ?auto_106007 ?auto_106008 ) ) ( ON ?auto_106008 ?auto_106009 ) ( not ( = ?auto_106002 ?auto_106009 ) ) ( not ( = ?auto_106003 ?auto_106009 ) ) ( not ( = ?auto_106004 ?auto_106009 ) ) ( not ( = ?auto_106006 ?auto_106009 ) ) ( not ( = ?auto_106007 ?auto_106009 ) ) ( not ( = ?auto_106005 ?auto_106009 ) ) ( not ( = ?auto_106008 ?auto_106009 ) ) ( ON ?auto_106005 ?auto_106008 ) ( ON-TABLE ?auto_106009 ) ( ON ?auto_106007 ?auto_106005 ) ( ON ?auto_106006 ?auto_106007 ) ( ON ?auto_106004 ?auto_106006 ) ( CLEAR ?auto_106002 ) ( ON ?auto_106003 ?auto_106004 ) ( CLEAR ?auto_106003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106009 ?auto_106008 ?auto_106005 ?auto_106007 ?auto_106006 ?auto_106004 )
      ( MAKE-3PILE ?auto_106002 ?auto_106003 ?auto_106004 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_106010 - BLOCK
      ?auto_106011 - BLOCK
      ?auto_106012 - BLOCK
    )
    :vars
    (
      ?auto_106015 - BLOCK
      ?auto_106017 - BLOCK
      ?auto_106014 - BLOCK
      ?auto_106013 - BLOCK
      ?auto_106016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106010 ?auto_106011 ) ) ( not ( = ?auto_106010 ?auto_106012 ) ) ( not ( = ?auto_106010 ?auto_106015 ) ) ( not ( = ?auto_106011 ?auto_106012 ) ) ( not ( = ?auto_106011 ?auto_106015 ) ) ( not ( = ?auto_106012 ?auto_106015 ) ) ( not ( = ?auto_106010 ?auto_106017 ) ) ( not ( = ?auto_106010 ?auto_106014 ) ) ( not ( = ?auto_106011 ?auto_106017 ) ) ( not ( = ?auto_106011 ?auto_106014 ) ) ( not ( = ?auto_106012 ?auto_106017 ) ) ( not ( = ?auto_106012 ?auto_106014 ) ) ( not ( = ?auto_106015 ?auto_106017 ) ) ( not ( = ?auto_106015 ?auto_106014 ) ) ( not ( = ?auto_106017 ?auto_106014 ) ) ( not ( = ?auto_106013 ?auto_106014 ) ) ( not ( = ?auto_106010 ?auto_106013 ) ) ( not ( = ?auto_106011 ?auto_106013 ) ) ( not ( = ?auto_106012 ?auto_106013 ) ) ( not ( = ?auto_106015 ?auto_106013 ) ) ( not ( = ?auto_106017 ?auto_106013 ) ) ( ON ?auto_106013 ?auto_106016 ) ( not ( = ?auto_106010 ?auto_106016 ) ) ( not ( = ?auto_106011 ?auto_106016 ) ) ( not ( = ?auto_106012 ?auto_106016 ) ) ( not ( = ?auto_106015 ?auto_106016 ) ) ( not ( = ?auto_106017 ?auto_106016 ) ) ( not ( = ?auto_106014 ?auto_106016 ) ) ( not ( = ?auto_106013 ?auto_106016 ) ) ( ON ?auto_106014 ?auto_106013 ) ( ON-TABLE ?auto_106016 ) ( ON ?auto_106017 ?auto_106014 ) ( ON ?auto_106015 ?auto_106017 ) ( ON ?auto_106012 ?auto_106015 ) ( ON ?auto_106011 ?auto_106012 ) ( CLEAR ?auto_106011 ) ( HOLDING ?auto_106010 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106010 )
      ( MAKE-3PILE ?auto_106010 ?auto_106011 ?auto_106012 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_106018 - BLOCK
      ?auto_106019 - BLOCK
      ?auto_106020 - BLOCK
    )
    :vars
    (
      ?auto_106024 - BLOCK
      ?auto_106025 - BLOCK
      ?auto_106021 - BLOCK
      ?auto_106023 - BLOCK
      ?auto_106022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106018 ?auto_106019 ) ) ( not ( = ?auto_106018 ?auto_106020 ) ) ( not ( = ?auto_106018 ?auto_106024 ) ) ( not ( = ?auto_106019 ?auto_106020 ) ) ( not ( = ?auto_106019 ?auto_106024 ) ) ( not ( = ?auto_106020 ?auto_106024 ) ) ( not ( = ?auto_106018 ?auto_106025 ) ) ( not ( = ?auto_106018 ?auto_106021 ) ) ( not ( = ?auto_106019 ?auto_106025 ) ) ( not ( = ?auto_106019 ?auto_106021 ) ) ( not ( = ?auto_106020 ?auto_106025 ) ) ( not ( = ?auto_106020 ?auto_106021 ) ) ( not ( = ?auto_106024 ?auto_106025 ) ) ( not ( = ?auto_106024 ?auto_106021 ) ) ( not ( = ?auto_106025 ?auto_106021 ) ) ( not ( = ?auto_106023 ?auto_106021 ) ) ( not ( = ?auto_106018 ?auto_106023 ) ) ( not ( = ?auto_106019 ?auto_106023 ) ) ( not ( = ?auto_106020 ?auto_106023 ) ) ( not ( = ?auto_106024 ?auto_106023 ) ) ( not ( = ?auto_106025 ?auto_106023 ) ) ( ON ?auto_106023 ?auto_106022 ) ( not ( = ?auto_106018 ?auto_106022 ) ) ( not ( = ?auto_106019 ?auto_106022 ) ) ( not ( = ?auto_106020 ?auto_106022 ) ) ( not ( = ?auto_106024 ?auto_106022 ) ) ( not ( = ?auto_106025 ?auto_106022 ) ) ( not ( = ?auto_106021 ?auto_106022 ) ) ( not ( = ?auto_106023 ?auto_106022 ) ) ( ON ?auto_106021 ?auto_106023 ) ( ON-TABLE ?auto_106022 ) ( ON ?auto_106025 ?auto_106021 ) ( ON ?auto_106024 ?auto_106025 ) ( ON ?auto_106020 ?auto_106024 ) ( ON ?auto_106019 ?auto_106020 ) ( ON ?auto_106018 ?auto_106019 ) ( CLEAR ?auto_106018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106022 ?auto_106023 ?auto_106021 ?auto_106025 ?auto_106024 ?auto_106020 ?auto_106019 )
      ( MAKE-3PILE ?auto_106018 ?auto_106019 ?auto_106020 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106030 - BLOCK
      ?auto_106031 - BLOCK
      ?auto_106032 - BLOCK
      ?auto_106033 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_106033 ) ( CLEAR ?auto_106032 ) ( ON-TABLE ?auto_106030 ) ( ON ?auto_106031 ?auto_106030 ) ( ON ?auto_106032 ?auto_106031 ) ( not ( = ?auto_106030 ?auto_106031 ) ) ( not ( = ?auto_106030 ?auto_106032 ) ) ( not ( = ?auto_106030 ?auto_106033 ) ) ( not ( = ?auto_106031 ?auto_106032 ) ) ( not ( = ?auto_106031 ?auto_106033 ) ) ( not ( = ?auto_106032 ?auto_106033 ) ) )
    :subtasks
    ( ( !STACK ?auto_106033 ?auto_106032 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106034 - BLOCK
      ?auto_106035 - BLOCK
      ?auto_106036 - BLOCK
      ?auto_106037 - BLOCK
    )
    :vars
    (
      ?auto_106038 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_106036 ) ( ON-TABLE ?auto_106034 ) ( ON ?auto_106035 ?auto_106034 ) ( ON ?auto_106036 ?auto_106035 ) ( not ( = ?auto_106034 ?auto_106035 ) ) ( not ( = ?auto_106034 ?auto_106036 ) ) ( not ( = ?auto_106034 ?auto_106037 ) ) ( not ( = ?auto_106035 ?auto_106036 ) ) ( not ( = ?auto_106035 ?auto_106037 ) ) ( not ( = ?auto_106036 ?auto_106037 ) ) ( ON ?auto_106037 ?auto_106038 ) ( CLEAR ?auto_106037 ) ( HAND-EMPTY ) ( not ( = ?auto_106034 ?auto_106038 ) ) ( not ( = ?auto_106035 ?auto_106038 ) ) ( not ( = ?auto_106036 ?auto_106038 ) ) ( not ( = ?auto_106037 ?auto_106038 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106037 ?auto_106038 )
      ( MAKE-4PILE ?auto_106034 ?auto_106035 ?auto_106036 ?auto_106037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106039 - BLOCK
      ?auto_106040 - BLOCK
      ?auto_106041 - BLOCK
      ?auto_106042 - BLOCK
    )
    :vars
    (
      ?auto_106043 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106039 ) ( ON ?auto_106040 ?auto_106039 ) ( not ( = ?auto_106039 ?auto_106040 ) ) ( not ( = ?auto_106039 ?auto_106041 ) ) ( not ( = ?auto_106039 ?auto_106042 ) ) ( not ( = ?auto_106040 ?auto_106041 ) ) ( not ( = ?auto_106040 ?auto_106042 ) ) ( not ( = ?auto_106041 ?auto_106042 ) ) ( ON ?auto_106042 ?auto_106043 ) ( CLEAR ?auto_106042 ) ( not ( = ?auto_106039 ?auto_106043 ) ) ( not ( = ?auto_106040 ?auto_106043 ) ) ( not ( = ?auto_106041 ?auto_106043 ) ) ( not ( = ?auto_106042 ?auto_106043 ) ) ( HOLDING ?auto_106041 ) ( CLEAR ?auto_106040 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106039 ?auto_106040 ?auto_106041 )
      ( MAKE-4PILE ?auto_106039 ?auto_106040 ?auto_106041 ?auto_106042 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106044 - BLOCK
      ?auto_106045 - BLOCK
      ?auto_106046 - BLOCK
      ?auto_106047 - BLOCK
    )
    :vars
    (
      ?auto_106048 - BLOCK
      ?auto_106049 - BLOCK
      ?auto_106050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106044 ) ( ON ?auto_106045 ?auto_106044 ) ( not ( = ?auto_106044 ?auto_106045 ) ) ( not ( = ?auto_106044 ?auto_106046 ) ) ( not ( = ?auto_106044 ?auto_106047 ) ) ( not ( = ?auto_106045 ?auto_106046 ) ) ( not ( = ?auto_106045 ?auto_106047 ) ) ( not ( = ?auto_106046 ?auto_106047 ) ) ( ON ?auto_106047 ?auto_106048 ) ( not ( = ?auto_106044 ?auto_106048 ) ) ( not ( = ?auto_106045 ?auto_106048 ) ) ( not ( = ?auto_106046 ?auto_106048 ) ) ( not ( = ?auto_106047 ?auto_106048 ) ) ( CLEAR ?auto_106045 ) ( ON ?auto_106046 ?auto_106047 ) ( CLEAR ?auto_106046 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106049 ) ( ON ?auto_106050 ?auto_106049 ) ( ON ?auto_106048 ?auto_106050 ) ( not ( = ?auto_106049 ?auto_106050 ) ) ( not ( = ?auto_106049 ?auto_106048 ) ) ( not ( = ?auto_106049 ?auto_106047 ) ) ( not ( = ?auto_106049 ?auto_106046 ) ) ( not ( = ?auto_106050 ?auto_106048 ) ) ( not ( = ?auto_106050 ?auto_106047 ) ) ( not ( = ?auto_106050 ?auto_106046 ) ) ( not ( = ?auto_106044 ?auto_106049 ) ) ( not ( = ?auto_106044 ?auto_106050 ) ) ( not ( = ?auto_106045 ?auto_106049 ) ) ( not ( = ?auto_106045 ?auto_106050 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106049 ?auto_106050 ?auto_106048 ?auto_106047 )
      ( MAKE-4PILE ?auto_106044 ?auto_106045 ?auto_106046 ?auto_106047 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106051 - BLOCK
      ?auto_106052 - BLOCK
      ?auto_106053 - BLOCK
      ?auto_106054 - BLOCK
    )
    :vars
    (
      ?auto_106057 - BLOCK
      ?auto_106056 - BLOCK
      ?auto_106055 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106051 ) ( not ( = ?auto_106051 ?auto_106052 ) ) ( not ( = ?auto_106051 ?auto_106053 ) ) ( not ( = ?auto_106051 ?auto_106054 ) ) ( not ( = ?auto_106052 ?auto_106053 ) ) ( not ( = ?auto_106052 ?auto_106054 ) ) ( not ( = ?auto_106053 ?auto_106054 ) ) ( ON ?auto_106054 ?auto_106057 ) ( not ( = ?auto_106051 ?auto_106057 ) ) ( not ( = ?auto_106052 ?auto_106057 ) ) ( not ( = ?auto_106053 ?auto_106057 ) ) ( not ( = ?auto_106054 ?auto_106057 ) ) ( ON ?auto_106053 ?auto_106054 ) ( CLEAR ?auto_106053 ) ( ON-TABLE ?auto_106056 ) ( ON ?auto_106055 ?auto_106056 ) ( ON ?auto_106057 ?auto_106055 ) ( not ( = ?auto_106056 ?auto_106055 ) ) ( not ( = ?auto_106056 ?auto_106057 ) ) ( not ( = ?auto_106056 ?auto_106054 ) ) ( not ( = ?auto_106056 ?auto_106053 ) ) ( not ( = ?auto_106055 ?auto_106057 ) ) ( not ( = ?auto_106055 ?auto_106054 ) ) ( not ( = ?auto_106055 ?auto_106053 ) ) ( not ( = ?auto_106051 ?auto_106056 ) ) ( not ( = ?auto_106051 ?auto_106055 ) ) ( not ( = ?auto_106052 ?auto_106056 ) ) ( not ( = ?auto_106052 ?auto_106055 ) ) ( HOLDING ?auto_106052 ) ( CLEAR ?auto_106051 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106051 ?auto_106052 )
      ( MAKE-4PILE ?auto_106051 ?auto_106052 ?auto_106053 ?auto_106054 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106058 - BLOCK
      ?auto_106059 - BLOCK
      ?auto_106060 - BLOCK
      ?auto_106061 - BLOCK
    )
    :vars
    (
      ?auto_106062 - BLOCK
      ?auto_106064 - BLOCK
      ?auto_106063 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106058 ) ( not ( = ?auto_106058 ?auto_106059 ) ) ( not ( = ?auto_106058 ?auto_106060 ) ) ( not ( = ?auto_106058 ?auto_106061 ) ) ( not ( = ?auto_106059 ?auto_106060 ) ) ( not ( = ?auto_106059 ?auto_106061 ) ) ( not ( = ?auto_106060 ?auto_106061 ) ) ( ON ?auto_106061 ?auto_106062 ) ( not ( = ?auto_106058 ?auto_106062 ) ) ( not ( = ?auto_106059 ?auto_106062 ) ) ( not ( = ?auto_106060 ?auto_106062 ) ) ( not ( = ?auto_106061 ?auto_106062 ) ) ( ON ?auto_106060 ?auto_106061 ) ( ON-TABLE ?auto_106064 ) ( ON ?auto_106063 ?auto_106064 ) ( ON ?auto_106062 ?auto_106063 ) ( not ( = ?auto_106064 ?auto_106063 ) ) ( not ( = ?auto_106064 ?auto_106062 ) ) ( not ( = ?auto_106064 ?auto_106061 ) ) ( not ( = ?auto_106064 ?auto_106060 ) ) ( not ( = ?auto_106063 ?auto_106062 ) ) ( not ( = ?auto_106063 ?auto_106061 ) ) ( not ( = ?auto_106063 ?auto_106060 ) ) ( not ( = ?auto_106058 ?auto_106064 ) ) ( not ( = ?auto_106058 ?auto_106063 ) ) ( not ( = ?auto_106059 ?auto_106064 ) ) ( not ( = ?auto_106059 ?auto_106063 ) ) ( CLEAR ?auto_106058 ) ( ON ?auto_106059 ?auto_106060 ) ( CLEAR ?auto_106059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106064 ?auto_106063 ?auto_106062 ?auto_106061 ?auto_106060 )
      ( MAKE-4PILE ?auto_106058 ?auto_106059 ?auto_106060 ?auto_106061 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106065 - BLOCK
      ?auto_106066 - BLOCK
      ?auto_106067 - BLOCK
      ?auto_106068 - BLOCK
    )
    :vars
    (
      ?auto_106071 - BLOCK
      ?auto_106069 - BLOCK
      ?auto_106070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106065 ?auto_106066 ) ) ( not ( = ?auto_106065 ?auto_106067 ) ) ( not ( = ?auto_106065 ?auto_106068 ) ) ( not ( = ?auto_106066 ?auto_106067 ) ) ( not ( = ?auto_106066 ?auto_106068 ) ) ( not ( = ?auto_106067 ?auto_106068 ) ) ( ON ?auto_106068 ?auto_106071 ) ( not ( = ?auto_106065 ?auto_106071 ) ) ( not ( = ?auto_106066 ?auto_106071 ) ) ( not ( = ?auto_106067 ?auto_106071 ) ) ( not ( = ?auto_106068 ?auto_106071 ) ) ( ON ?auto_106067 ?auto_106068 ) ( ON-TABLE ?auto_106069 ) ( ON ?auto_106070 ?auto_106069 ) ( ON ?auto_106071 ?auto_106070 ) ( not ( = ?auto_106069 ?auto_106070 ) ) ( not ( = ?auto_106069 ?auto_106071 ) ) ( not ( = ?auto_106069 ?auto_106068 ) ) ( not ( = ?auto_106069 ?auto_106067 ) ) ( not ( = ?auto_106070 ?auto_106071 ) ) ( not ( = ?auto_106070 ?auto_106068 ) ) ( not ( = ?auto_106070 ?auto_106067 ) ) ( not ( = ?auto_106065 ?auto_106069 ) ) ( not ( = ?auto_106065 ?auto_106070 ) ) ( not ( = ?auto_106066 ?auto_106069 ) ) ( not ( = ?auto_106066 ?auto_106070 ) ) ( ON ?auto_106066 ?auto_106067 ) ( CLEAR ?auto_106066 ) ( HOLDING ?auto_106065 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106065 )
      ( MAKE-4PILE ?auto_106065 ?auto_106066 ?auto_106067 ?auto_106068 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106072 - BLOCK
      ?auto_106073 - BLOCK
      ?auto_106074 - BLOCK
      ?auto_106075 - BLOCK
    )
    :vars
    (
      ?auto_106076 - BLOCK
      ?auto_106078 - BLOCK
      ?auto_106077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106072 ?auto_106073 ) ) ( not ( = ?auto_106072 ?auto_106074 ) ) ( not ( = ?auto_106072 ?auto_106075 ) ) ( not ( = ?auto_106073 ?auto_106074 ) ) ( not ( = ?auto_106073 ?auto_106075 ) ) ( not ( = ?auto_106074 ?auto_106075 ) ) ( ON ?auto_106075 ?auto_106076 ) ( not ( = ?auto_106072 ?auto_106076 ) ) ( not ( = ?auto_106073 ?auto_106076 ) ) ( not ( = ?auto_106074 ?auto_106076 ) ) ( not ( = ?auto_106075 ?auto_106076 ) ) ( ON ?auto_106074 ?auto_106075 ) ( ON-TABLE ?auto_106078 ) ( ON ?auto_106077 ?auto_106078 ) ( ON ?auto_106076 ?auto_106077 ) ( not ( = ?auto_106078 ?auto_106077 ) ) ( not ( = ?auto_106078 ?auto_106076 ) ) ( not ( = ?auto_106078 ?auto_106075 ) ) ( not ( = ?auto_106078 ?auto_106074 ) ) ( not ( = ?auto_106077 ?auto_106076 ) ) ( not ( = ?auto_106077 ?auto_106075 ) ) ( not ( = ?auto_106077 ?auto_106074 ) ) ( not ( = ?auto_106072 ?auto_106078 ) ) ( not ( = ?auto_106072 ?auto_106077 ) ) ( not ( = ?auto_106073 ?auto_106078 ) ) ( not ( = ?auto_106073 ?auto_106077 ) ) ( ON ?auto_106073 ?auto_106074 ) ( ON ?auto_106072 ?auto_106073 ) ( CLEAR ?auto_106072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106078 ?auto_106077 ?auto_106076 ?auto_106075 ?auto_106074 ?auto_106073 )
      ( MAKE-4PILE ?auto_106072 ?auto_106073 ?auto_106074 ?auto_106075 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106079 - BLOCK
      ?auto_106080 - BLOCK
      ?auto_106081 - BLOCK
      ?auto_106082 - BLOCK
    )
    :vars
    (
      ?auto_106085 - BLOCK
      ?auto_106084 - BLOCK
      ?auto_106083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106079 ?auto_106080 ) ) ( not ( = ?auto_106079 ?auto_106081 ) ) ( not ( = ?auto_106079 ?auto_106082 ) ) ( not ( = ?auto_106080 ?auto_106081 ) ) ( not ( = ?auto_106080 ?auto_106082 ) ) ( not ( = ?auto_106081 ?auto_106082 ) ) ( ON ?auto_106082 ?auto_106085 ) ( not ( = ?auto_106079 ?auto_106085 ) ) ( not ( = ?auto_106080 ?auto_106085 ) ) ( not ( = ?auto_106081 ?auto_106085 ) ) ( not ( = ?auto_106082 ?auto_106085 ) ) ( ON ?auto_106081 ?auto_106082 ) ( ON-TABLE ?auto_106084 ) ( ON ?auto_106083 ?auto_106084 ) ( ON ?auto_106085 ?auto_106083 ) ( not ( = ?auto_106084 ?auto_106083 ) ) ( not ( = ?auto_106084 ?auto_106085 ) ) ( not ( = ?auto_106084 ?auto_106082 ) ) ( not ( = ?auto_106084 ?auto_106081 ) ) ( not ( = ?auto_106083 ?auto_106085 ) ) ( not ( = ?auto_106083 ?auto_106082 ) ) ( not ( = ?auto_106083 ?auto_106081 ) ) ( not ( = ?auto_106079 ?auto_106084 ) ) ( not ( = ?auto_106079 ?auto_106083 ) ) ( not ( = ?auto_106080 ?auto_106084 ) ) ( not ( = ?auto_106080 ?auto_106083 ) ) ( ON ?auto_106080 ?auto_106081 ) ( HOLDING ?auto_106079 ) ( CLEAR ?auto_106080 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106084 ?auto_106083 ?auto_106085 ?auto_106082 ?auto_106081 ?auto_106080 ?auto_106079 )
      ( MAKE-4PILE ?auto_106079 ?auto_106080 ?auto_106081 ?auto_106082 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106086 - BLOCK
      ?auto_106087 - BLOCK
      ?auto_106088 - BLOCK
      ?auto_106089 - BLOCK
    )
    :vars
    (
      ?auto_106090 - BLOCK
      ?auto_106091 - BLOCK
      ?auto_106092 - BLOCK
      ?auto_106093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106086 ?auto_106087 ) ) ( not ( = ?auto_106086 ?auto_106088 ) ) ( not ( = ?auto_106086 ?auto_106089 ) ) ( not ( = ?auto_106087 ?auto_106088 ) ) ( not ( = ?auto_106087 ?auto_106089 ) ) ( not ( = ?auto_106088 ?auto_106089 ) ) ( ON ?auto_106089 ?auto_106090 ) ( not ( = ?auto_106086 ?auto_106090 ) ) ( not ( = ?auto_106087 ?auto_106090 ) ) ( not ( = ?auto_106088 ?auto_106090 ) ) ( not ( = ?auto_106089 ?auto_106090 ) ) ( ON ?auto_106088 ?auto_106089 ) ( ON-TABLE ?auto_106091 ) ( ON ?auto_106092 ?auto_106091 ) ( ON ?auto_106090 ?auto_106092 ) ( not ( = ?auto_106091 ?auto_106092 ) ) ( not ( = ?auto_106091 ?auto_106090 ) ) ( not ( = ?auto_106091 ?auto_106089 ) ) ( not ( = ?auto_106091 ?auto_106088 ) ) ( not ( = ?auto_106092 ?auto_106090 ) ) ( not ( = ?auto_106092 ?auto_106089 ) ) ( not ( = ?auto_106092 ?auto_106088 ) ) ( not ( = ?auto_106086 ?auto_106091 ) ) ( not ( = ?auto_106086 ?auto_106092 ) ) ( not ( = ?auto_106087 ?auto_106091 ) ) ( not ( = ?auto_106087 ?auto_106092 ) ) ( ON ?auto_106087 ?auto_106088 ) ( CLEAR ?auto_106087 ) ( ON ?auto_106086 ?auto_106093 ) ( CLEAR ?auto_106086 ) ( HAND-EMPTY ) ( not ( = ?auto_106086 ?auto_106093 ) ) ( not ( = ?auto_106087 ?auto_106093 ) ) ( not ( = ?auto_106088 ?auto_106093 ) ) ( not ( = ?auto_106089 ?auto_106093 ) ) ( not ( = ?auto_106090 ?auto_106093 ) ) ( not ( = ?auto_106091 ?auto_106093 ) ) ( not ( = ?auto_106092 ?auto_106093 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106086 ?auto_106093 )
      ( MAKE-4PILE ?auto_106086 ?auto_106087 ?auto_106088 ?auto_106089 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106094 - BLOCK
      ?auto_106095 - BLOCK
      ?auto_106096 - BLOCK
      ?auto_106097 - BLOCK
    )
    :vars
    (
      ?auto_106099 - BLOCK
      ?auto_106101 - BLOCK
      ?auto_106098 - BLOCK
      ?auto_106100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106094 ?auto_106095 ) ) ( not ( = ?auto_106094 ?auto_106096 ) ) ( not ( = ?auto_106094 ?auto_106097 ) ) ( not ( = ?auto_106095 ?auto_106096 ) ) ( not ( = ?auto_106095 ?auto_106097 ) ) ( not ( = ?auto_106096 ?auto_106097 ) ) ( ON ?auto_106097 ?auto_106099 ) ( not ( = ?auto_106094 ?auto_106099 ) ) ( not ( = ?auto_106095 ?auto_106099 ) ) ( not ( = ?auto_106096 ?auto_106099 ) ) ( not ( = ?auto_106097 ?auto_106099 ) ) ( ON ?auto_106096 ?auto_106097 ) ( ON-TABLE ?auto_106101 ) ( ON ?auto_106098 ?auto_106101 ) ( ON ?auto_106099 ?auto_106098 ) ( not ( = ?auto_106101 ?auto_106098 ) ) ( not ( = ?auto_106101 ?auto_106099 ) ) ( not ( = ?auto_106101 ?auto_106097 ) ) ( not ( = ?auto_106101 ?auto_106096 ) ) ( not ( = ?auto_106098 ?auto_106099 ) ) ( not ( = ?auto_106098 ?auto_106097 ) ) ( not ( = ?auto_106098 ?auto_106096 ) ) ( not ( = ?auto_106094 ?auto_106101 ) ) ( not ( = ?auto_106094 ?auto_106098 ) ) ( not ( = ?auto_106095 ?auto_106101 ) ) ( not ( = ?auto_106095 ?auto_106098 ) ) ( ON ?auto_106094 ?auto_106100 ) ( CLEAR ?auto_106094 ) ( not ( = ?auto_106094 ?auto_106100 ) ) ( not ( = ?auto_106095 ?auto_106100 ) ) ( not ( = ?auto_106096 ?auto_106100 ) ) ( not ( = ?auto_106097 ?auto_106100 ) ) ( not ( = ?auto_106099 ?auto_106100 ) ) ( not ( = ?auto_106101 ?auto_106100 ) ) ( not ( = ?auto_106098 ?auto_106100 ) ) ( HOLDING ?auto_106095 ) ( CLEAR ?auto_106096 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106101 ?auto_106098 ?auto_106099 ?auto_106097 ?auto_106096 ?auto_106095 )
      ( MAKE-4PILE ?auto_106094 ?auto_106095 ?auto_106096 ?auto_106097 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106102 - BLOCK
      ?auto_106103 - BLOCK
      ?auto_106104 - BLOCK
      ?auto_106105 - BLOCK
    )
    :vars
    (
      ?auto_106107 - BLOCK
      ?auto_106108 - BLOCK
      ?auto_106109 - BLOCK
      ?auto_106106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106102 ?auto_106103 ) ) ( not ( = ?auto_106102 ?auto_106104 ) ) ( not ( = ?auto_106102 ?auto_106105 ) ) ( not ( = ?auto_106103 ?auto_106104 ) ) ( not ( = ?auto_106103 ?auto_106105 ) ) ( not ( = ?auto_106104 ?auto_106105 ) ) ( ON ?auto_106105 ?auto_106107 ) ( not ( = ?auto_106102 ?auto_106107 ) ) ( not ( = ?auto_106103 ?auto_106107 ) ) ( not ( = ?auto_106104 ?auto_106107 ) ) ( not ( = ?auto_106105 ?auto_106107 ) ) ( ON ?auto_106104 ?auto_106105 ) ( ON-TABLE ?auto_106108 ) ( ON ?auto_106109 ?auto_106108 ) ( ON ?auto_106107 ?auto_106109 ) ( not ( = ?auto_106108 ?auto_106109 ) ) ( not ( = ?auto_106108 ?auto_106107 ) ) ( not ( = ?auto_106108 ?auto_106105 ) ) ( not ( = ?auto_106108 ?auto_106104 ) ) ( not ( = ?auto_106109 ?auto_106107 ) ) ( not ( = ?auto_106109 ?auto_106105 ) ) ( not ( = ?auto_106109 ?auto_106104 ) ) ( not ( = ?auto_106102 ?auto_106108 ) ) ( not ( = ?auto_106102 ?auto_106109 ) ) ( not ( = ?auto_106103 ?auto_106108 ) ) ( not ( = ?auto_106103 ?auto_106109 ) ) ( ON ?auto_106102 ?auto_106106 ) ( not ( = ?auto_106102 ?auto_106106 ) ) ( not ( = ?auto_106103 ?auto_106106 ) ) ( not ( = ?auto_106104 ?auto_106106 ) ) ( not ( = ?auto_106105 ?auto_106106 ) ) ( not ( = ?auto_106107 ?auto_106106 ) ) ( not ( = ?auto_106108 ?auto_106106 ) ) ( not ( = ?auto_106109 ?auto_106106 ) ) ( CLEAR ?auto_106104 ) ( ON ?auto_106103 ?auto_106102 ) ( CLEAR ?auto_106103 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106106 ?auto_106102 )
      ( MAKE-4PILE ?auto_106102 ?auto_106103 ?auto_106104 ?auto_106105 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106110 - BLOCK
      ?auto_106111 - BLOCK
      ?auto_106112 - BLOCK
      ?auto_106113 - BLOCK
    )
    :vars
    (
      ?auto_106116 - BLOCK
      ?auto_106117 - BLOCK
      ?auto_106115 - BLOCK
      ?auto_106114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106110 ?auto_106111 ) ) ( not ( = ?auto_106110 ?auto_106112 ) ) ( not ( = ?auto_106110 ?auto_106113 ) ) ( not ( = ?auto_106111 ?auto_106112 ) ) ( not ( = ?auto_106111 ?auto_106113 ) ) ( not ( = ?auto_106112 ?auto_106113 ) ) ( ON ?auto_106113 ?auto_106116 ) ( not ( = ?auto_106110 ?auto_106116 ) ) ( not ( = ?auto_106111 ?auto_106116 ) ) ( not ( = ?auto_106112 ?auto_106116 ) ) ( not ( = ?auto_106113 ?auto_106116 ) ) ( ON-TABLE ?auto_106117 ) ( ON ?auto_106115 ?auto_106117 ) ( ON ?auto_106116 ?auto_106115 ) ( not ( = ?auto_106117 ?auto_106115 ) ) ( not ( = ?auto_106117 ?auto_106116 ) ) ( not ( = ?auto_106117 ?auto_106113 ) ) ( not ( = ?auto_106117 ?auto_106112 ) ) ( not ( = ?auto_106115 ?auto_106116 ) ) ( not ( = ?auto_106115 ?auto_106113 ) ) ( not ( = ?auto_106115 ?auto_106112 ) ) ( not ( = ?auto_106110 ?auto_106117 ) ) ( not ( = ?auto_106110 ?auto_106115 ) ) ( not ( = ?auto_106111 ?auto_106117 ) ) ( not ( = ?auto_106111 ?auto_106115 ) ) ( ON ?auto_106110 ?auto_106114 ) ( not ( = ?auto_106110 ?auto_106114 ) ) ( not ( = ?auto_106111 ?auto_106114 ) ) ( not ( = ?auto_106112 ?auto_106114 ) ) ( not ( = ?auto_106113 ?auto_106114 ) ) ( not ( = ?auto_106116 ?auto_106114 ) ) ( not ( = ?auto_106117 ?auto_106114 ) ) ( not ( = ?auto_106115 ?auto_106114 ) ) ( ON ?auto_106111 ?auto_106110 ) ( CLEAR ?auto_106111 ) ( ON-TABLE ?auto_106114 ) ( HOLDING ?auto_106112 ) ( CLEAR ?auto_106113 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106117 ?auto_106115 ?auto_106116 ?auto_106113 ?auto_106112 )
      ( MAKE-4PILE ?auto_106110 ?auto_106111 ?auto_106112 ?auto_106113 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106118 - BLOCK
      ?auto_106119 - BLOCK
      ?auto_106120 - BLOCK
      ?auto_106121 - BLOCK
    )
    :vars
    (
      ?auto_106124 - BLOCK
      ?auto_106125 - BLOCK
      ?auto_106123 - BLOCK
      ?auto_106122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106118 ?auto_106119 ) ) ( not ( = ?auto_106118 ?auto_106120 ) ) ( not ( = ?auto_106118 ?auto_106121 ) ) ( not ( = ?auto_106119 ?auto_106120 ) ) ( not ( = ?auto_106119 ?auto_106121 ) ) ( not ( = ?auto_106120 ?auto_106121 ) ) ( ON ?auto_106121 ?auto_106124 ) ( not ( = ?auto_106118 ?auto_106124 ) ) ( not ( = ?auto_106119 ?auto_106124 ) ) ( not ( = ?auto_106120 ?auto_106124 ) ) ( not ( = ?auto_106121 ?auto_106124 ) ) ( ON-TABLE ?auto_106125 ) ( ON ?auto_106123 ?auto_106125 ) ( ON ?auto_106124 ?auto_106123 ) ( not ( = ?auto_106125 ?auto_106123 ) ) ( not ( = ?auto_106125 ?auto_106124 ) ) ( not ( = ?auto_106125 ?auto_106121 ) ) ( not ( = ?auto_106125 ?auto_106120 ) ) ( not ( = ?auto_106123 ?auto_106124 ) ) ( not ( = ?auto_106123 ?auto_106121 ) ) ( not ( = ?auto_106123 ?auto_106120 ) ) ( not ( = ?auto_106118 ?auto_106125 ) ) ( not ( = ?auto_106118 ?auto_106123 ) ) ( not ( = ?auto_106119 ?auto_106125 ) ) ( not ( = ?auto_106119 ?auto_106123 ) ) ( ON ?auto_106118 ?auto_106122 ) ( not ( = ?auto_106118 ?auto_106122 ) ) ( not ( = ?auto_106119 ?auto_106122 ) ) ( not ( = ?auto_106120 ?auto_106122 ) ) ( not ( = ?auto_106121 ?auto_106122 ) ) ( not ( = ?auto_106124 ?auto_106122 ) ) ( not ( = ?auto_106125 ?auto_106122 ) ) ( not ( = ?auto_106123 ?auto_106122 ) ) ( ON ?auto_106119 ?auto_106118 ) ( ON-TABLE ?auto_106122 ) ( CLEAR ?auto_106121 ) ( ON ?auto_106120 ?auto_106119 ) ( CLEAR ?auto_106120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106122 ?auto_106118 ?auto_106119 )
      ( MAKE-4PILE ?auto_106118 ?auto_106119 ?auto_106120 ?auto_106121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106126 - BLOCK
      ?auto_106127 - BLOCK
      ?auto_106128 - BLOCK
      ?auto_106129 - BLOCK
    )
    :vars
    (
      ?auto_106131 - BLOCK
      ?auto_106130 - BLOCK
      ?auto_106132 - BLOCK
      ?auto_106133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106126 ?auto_106127 ) ) ( not ( = ?auto_106126 ?auto_106128 ) ) ( not ( = ?auto_106126 ?auto_106129 ) ) ( not ( = ?auto_106127 ?auto_106128 ) ) ( not ( = ?auto_106127 ?auto_106129 ) ) ( not ( = ?auto_106128 ?auto_106129 ) ) ( not ( = ?auto_106126 ?auto_106131 ) ) ( not ( = ?auto_106127 ?auto_106131 ) ) ( not ( = ?auto_106128 ?auto_106131 ) ) ( not ( = ?auto_106129 ?auto_106131 ) ) ( ON-TABLE ?auto_106130 ) ( ON ?auto_106132 ?auto_106130 ) ( ON ?auto_106131 ?auto_106132 ) ( not ( = ?auto_106130 ?auto_106132 ) ) ( not ( = ?auto_106130 ?auto_106131 ) ) ( not ( = ?auto_106130 ?auto_106129 ) ) ( not ( = ?auto_106130 ?auto_106128 ) ) ( not ( = ?auto_106132 ?auto_106131 ) ) ( not ( = ?auto_106132 ?auto_106129 ) ) ( not ( = ?auto_106132 ?auto_106128 ) ) ( not ( = ?auto_106126 ?auto_106130 ) ) ( not ( = ?auto_106126 ?auto_106132 ) ) ( not ( = ?auto_106127 ?auto_106130 ) ) ( not ( = ?auto_106127 ?auto_106132 ) ) ( ON ?auto_106126 ?auto_106133 ) ( not ( = ?auto_106126 ?auto_106133 ) ) ( not ( = ?auto_106127 ?auto_106133 ) ) ( not ( = ?auto_106128 ?auto_106133 ) ) ( not ( = ?auto_106129 ?auto_106133 ) ) ( not ( = ?auto_106131 ?auto_106133 ) ) ( not ( = ?auto_106130 ?auto_106133 ) ) ( not ( = ?auto_106132 ?auto_106133 ) ) ( ON ?auto_106127 ?auto_106126 ) ( ON-TABLE ?auto_106133 ) ( ON ?auto_106128 ?auto_106127 ) ( CLEAR ?auto_106128 ) ( HOLDING ?auto_106129 ) ( CLEAR ?auto_106131 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106130 ?auto_106132 ?auto_106131 ?auto_106129 )
      ( MAKE-4PILE ?auto_106126 ?auto_106127 ?auto_106128 ?auto_106129 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106134 - BLOCK
      ?auto_106135 - BLOCK
      ?auto_106136 - BLOCK
      ?auto_106137 - BLOCK
    )
    :vars
    (
      ?auto_106139 - BLOCK
      ?auto_106138 - BLOCK
      ?auto_106140 - BLOCK
      ?auto_106141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106134 ?auto_106135 ) ) ( not ( = ?auto_106134 ?auto_106136 ) ) ( not ( = ?auto_106134 ?auto_106137 ) ) ( not ( = ?auto_106135 ?auto_106136 ) ) ( not ( = ?auto_106135 ?auto_106137 ) ) ( not ( = ?auto_106136 ?auto_106137 ) ) ( not ( = ?auto_106134 ?auto_106139 ) ) ( not ( = ?auto_106135 ?auto_106139 ) ) ( not ( = ?auto_106136 ?auto_106139 ) ) ( not ( = ?auto_106137 ?auto_106139 ) ) ( ON-TABLE ?auto_106138 ) ( ON ?auto_106140 ?auto_106138 ) ( ON ?auto_106139 ?auto_106140 ) ( not ( = ?auto_106138 ?auto_106140 ) ) ( not ( = ?auto_106138 ?auto_106139 ) ) ( not ( = ?auto_106138 ?auto_106137 ) ) ( not ( = ?auto_106138 ?auto_106136 ) ) ( not ( = ?auto_106140 ?auto_106139 ) ) ( not ( = ?auto_106140 ?auto_106137 ) ) ( not ( = ?auto_106140 ?auto_106136 ) ) ( not ( = ?auto_106134 ?auto_106138 ) ) ( not ( = ?auto_106134 ?auto_106140 ) ) ( not ( = ?auto_106135 ?auto_106138 ) ) ( not ( = ?auto_106135 ?auto_106140 ) ) ( ON ?auto_106134 ?auto_106141 ) ( not ( = ?auto_106134 ?auto_106141 ) ) ( not ( = ?auto_106135 ?auto_106141 ) ) ( not ( = ?auto_106136 ?auto_106141 ) ) ( not ( = ?auto_106137 ?auto_106141 ) ) ( not ( = ?auto_106139 ?auto_106141 ) ) ( not ( = ?auto_106138 ?auto_106141 ) ) ( not ( = ?auto_106140 ?auto_106141 ) ) ( ON ?auto_106135 ?auto_106134 ) ( ON-TABLE ?auto_106141 ) ( ON ?auto_106136 ?auto_106135 ) ( CLEAR ?auto_106139 ) ( ON ?auto_106137 ?auto_106136 ) ( CLEAR ?auto_106137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106141 ?auto_106134 ?auto_106135 ?auto_106136 )
      ( MAKE-4PILE ?auto_106134 ?auto_106135 ?auto_106136 ?auto_106137 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106142 - BLOCK
      ?auto_106143 - BLOCK
      ?auto_106144 - BLOCK
      ?auto_106145 - BLOCK
    )
    :vars
    (
      ?auto_106146 - BLOCK
      ?auto_106149 - BLOCK
      ?auto_106147 - BLOCK
      ?auto_106148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106142 ?auto_106143 ) ) ( not ( = ?auto_106142 ?auto_106144 ) ) ( not ( = ?auto_106142 ?auto_106145 ) ) ( not ( = ?auto_106143 ?auto_106144 ) ) ( not ( = ?auto_106143 ?auto_106145 ) ) ( not ( = ?auto_106144 ?auto_106145 ) ) ( not ( = ?auto_106142 ?auto_106146 ) ) ( not ( = ?auto_106143 ?auto_106146 ) ) ( not ( = ?auto_106144 ?auto_106146 ) ) ( not ( = ?auto_106145 ?auto_106146 ) ) ( ON-TABLE ?auto_106149 ) ( ON ?auto_106147 ?auto_106149 ) ( not ( = ?auto_106149 ?auto_106147 ) ) ( not ( = ?auto_106149 ?auto_106146 ) ) ( not ( = ?auto_106149 ?auto_106145 ) ) ( not ( = ?auto_106149 ?auto_106144 ) ) ( not ( = ?auto_106147 ?auto_106146 ) ) ( not ( = ?auto_106147 ?auto_106145 ) ) ( not ( = ?auto_106147 ?auto_106144 ) ) ( not ( = ?auto_106142 ?auto_106149 ) ) ( not ( = ?auto_106142 ?auto_106147 ) ) ( not ( = ?auto_106143 ?auto_106149 ) ) ( not ( = ?auto_106143 ?auto_106147 ) ) ( ON ?auto_106142 ?auto_106148 ) ( not ( = ?auto_106142 ?auto_106148 ) ) ( not ( = ?auto_106143 ?auto_106148 ) ) ( not ( = ?auto_106144 ?auto_106148 ) ) ( not ( = ?auto_106145 ?auto_106148 ) ) ( not ( = ?auto_106146 ?auto_106148 ) ) ( not ( = ?auto_106149 ?auto_106148 ) ) ( not ( = ?auto_106147 ?auto_106148 ) ) ( ON ?auto_106143 ?auto_106142 ) ( ON-TABLE ?auto_106148 ) ( ON ?auto_106144 ?auto_106143 ) ( ON ?auto_106145 ?auto_106144 ) ( CLEAR ?auto_106145 ) ( HOLDING ?auto_106146 ) ( CLEAR ?auto_106147 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106149 ?auto_106147 ?auto_106146 )
      ( MAKE-4PILE ?auto_106142 ?auto_106143 ?auto_106144 ?auto_106145 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106150 - BLOCK
      ?auto_106151 - BLOCK
      ?auto_106152 - BLOCK
      ?auto_106153 - BLOCK
    )
    :vars
    (
      ?auto_106155 - BLOCK
      ?auto_106157 - BLOCK
      ?auto_106156 - BLOCK
      ?auto_106154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106150 ?auto_106151 ) ) ( not ( = ?auto_106150 ?auto_106152 ) ) ( not ( = ?auto_106150 ?auto_106153 ) ) ( not ( = ?auto_106151 ?auto_106152 ) ) ( not ( = ?auto_106151 ?auto_106153 ) ) ( not ( = ?auto_106152 ?auto_106153 ) ) ( not ( = ?auto_106150 ?auto_106155 ) ) ( not ( = ?auto_106151 ?auto_106155 ) ) ( not ( = ?auto_106152 ?auto_106155 ) ) ( not ( = ?auto_106153 ?auto_106155 ) ) ( ON-TABLE ?auto_106157 ) ( ON ?auto_106156 ?auto_106157 ) ( not ( = ?auto_106157 ?auto_106156 ) ) ( not ( = ?auto_106157 ?auto_106155 ) ) ( not ( = ?auto_106157 ?auto_106153 ) ) ( not ( = ?auto_106157 ?auto_106152 ) ) ( not ( = ?auto_106156 ?auto_106155 ) ) ( not ( = ?auto_106156 ?auto_106153 ) ) ( not ( = ?auto_106156 ?auto_106152 ) ) ( not ( = ?auto_106150 ?auto_106157 ) ) ( not ( = ?auto_106150 ?auto_106156 ) ) ( not ( = ?auto_106151 ?auto_106157 ) ) ( not ( = ?auto_106151 ?auto_106156 ) ) ( ON ?auto_106150 ?auto_106154 ) ( not ( = ?auto_106150 ?auto_106154 ) ) ( not ( = ?auto_106151 ?auto_106154 ) ) ( not ( = ?auto_106152 ?auto_106154 ) ) ( not ( = ?auto_106153 ?auto_106154 ) ) ( not ( = ?auto_106155 ?auto_106154 ) ) ( not ( = ?auto_106157 ?auto_106154 ) ) ( not ( = ?auto_106156 ?auto_106154 ) ) ( ON ?auto_106151 ?auto_106150 ) ( ON-TABLE ?auto_106154 ) ( ON ?auto_106152 ?auto_106151 ) ( ON ?auto_106153 ?auto_106152 ) ( CLEAR ?auto_106156 ) ( ON ?auto_106155 ?auto_106153 ) ( CLEAR ?auto_106155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106154 ?auto_106150 ?auto_106151 ?auto_106152 ?auto_106153 )
      ( MAKE-4PILE ?auto_106150 ?auto_106151 ?auto_106152 ?auto_106153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106158 - BLOCK
      ?auto_106159 - BLOCK
      ?auto_106160 - BLOCK
      ?auto_106161 - BLOCK
    )
    :vars
    (
      ?auto_106164 - BLOCK
      ?auto_106165 - BLOCK
      ?auto_106162 - BLOCK
      ?auto_106163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106158 ?auto_106159 ) ) ( not ( = ?auto_106158 ?auto_106160 ) ) ( not ( = ?auto_106158 ?auto_106161 ) ) ( not ( = ?auto_106159 ?auto_106160 ) ) ( not ( = ?auto_106159 ?auto_106161 ) ) ( not ( = ?auto_106160 ?auto_106161 ) ) ( not ( = ?auto_106158 ?auto_106164 ) ) ( not ( = ?auto_106159 ?auto_106164 ) ) ( not ( = ?auto_106160 ?auto_106164 ) ) ( not ( = ?auto_106161 ?auto_106164 ) ) ( ON-TABLE ?auto_106165 ) ( not ( = ?auto_106165 ?auto_106162 ) ) ( not ( = ?auto_106165 ?auto_106164 ) ) ( not ( = ?auto_106165 ?auto_106161 ) ) ( not ( = ?auto_106165 ?auto_106160 ) ) ( not ( = ?auto_106162 ?auto_106164 ) ) ( not ( = ?auto_106162 ?auto_106161 ) ) ( not ( = ?auto_106162 ?auto_106160 ) ) ( not ( = ?auto_106158 ?auto_106165 ) ) ( not ( = ?auto_106158 ?auto_106162 ) ) ( not ( = ?auto_106159 ?auto_106165 ) ) ( not ( = ?auto_106159 ?auto_106162 ) ) ( ON ?auto_106158 ?auto_106163 ) ( not ( = ?auto_106158 ?auto_106163 ) ) ( not ( = ?auto_106159 ?auto_106163 ) ) ( not ( = ?auto_106160 ?auto_106163 ) ) ( not ( = ?auto_106161 ?auto_106163 ) ) ( not ( = ?auto_106164 ?auto_106163 ) ) ( not ( = ?auto_106165 ?auto_106163 ) ) ( not ( = ?auto_106162 ?auto_106163 ) ) ( ON ?auto_106159 ?auto_106158 ) ( ON-TABLE ?auto_106163 ) ( ON ?auto_106160 ?auto_106159 ) ( ON ?auto_106161 ?auto_106160 ) ( ON ?auto_106164 ?auto_106161 ) ( CLEAR ?auto_106164 ) ( HOLDING ?auto_106162 ) ( CLEAR ?auto_106165 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106165 ?auto_106162 )
      ( MAKE-4PILE ?auto_106158 ?auto_106159 ?auto_106160 ?auto_106161 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106166 - BLOCK
      ?auto_106167 - BLOCK
      ?auto_106168 - BLOCK
      ?auto_106169 - BLOCK
    )
    :vars
    (
      ?auto_106171 - BLOCK
      ?auto_106170 - BLOCK
      ?auto_106172 - BLOCK
      ?auto_106173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106166 ?auto_106167 ) ) ( not ( = ?auto_106166 ?auto_106168 ) ) ( not ( = ?auto_106166 ?auto_106169 ) ) ( not ( = ?auto_106167 ?auto_106168 ) ) ( not ( = ?auto_106167 ?auto_106169 ) ) ( not ( = ?auto_106168 ?auto_106169 ) ) ( not ( = ?auto_106166 ?auto_106171 ) ) ( not ( = ?auto_106167 ?auto_106171 ) ) ( not ( = ?auto_106168 ?auto_106171 ) ) ( not ( = ?auto_106169 ?auto_106171 ) ) ( ON-TABLE ?auto_106170 ) ( not ( = ?auto_106170 ?auto_106172 ) ) ( not ( = ?auto_106170 ?auto_106171 ) ) ( not ( = ?auto_106170 ?auto_106169 ) ) ( not ( = ?auto_106170 ?auto_106168 ) ) ( not ( = ?auto_106172 ?auto_106171 ) ) ( not ( = ?auto_106172 ?auto_106169 ) ) ( not ( = ?auto_106172 ?auto_106168 ) ) ( not ( = ?auto_106166 ?auto_106170 ) ) ( not ( = ?auto_106166 ?auto_106172 ) ) ( not ( = ?auto_106167 ?auto_106170 ) ) ( not ( = ?auto_106167 ?auto_106172 ) ) ( ON ?auto_106166 ?auto_106173 ) ( not ( = ?auto_106166 ?auto_106173 ) ) ( not ( = ?auto_106167 ?auto_106173 ) ) ( not ( = ?auto_106168 ?auto_106173 ) ) ( not ( = ?auto_106169 ?auto_106173 ) ) ( not ( = ?auto_106171 ?auto_106173 ) ) ( not ( = ?auto_106170 ?auto_106173 ) ) ( not ( = ?auto_106172 ?auto_106173 ) ) ( ON ?auto_106167 ?auto_106166 ) ( ON-TABLE ?auto_106173 ) ( ON ?auto_106168 ?auto_106167 ) ( ON ?auto_106169 ?auto_106168 ) ( ON ?auto_106171 ?auto_106169 ) ( CLEAR ?auto_106170 ) ( ON ?auto_106172 ?auto_106171 ) ( CLEAR ?auto_106172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106173 ?auto_106166 ?auto_106167 ?auto_106168 ?auto_106169 ?auto_106171 )
      ( MAKE-4PILE ?auto_106166 ?auto_106167 ?auto_106168 ?auto_106169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106174 - BLOCK
      ?auto_106175 - BLOCK
      ?auto_106176 - BLOCK
      ?auto_106177 - BLOCK
    )
    :vars
    (
      ?auto_106179 - BLOCK
      ?auto_106178 - BLOCK
      ?auto_106180 - BLOCK
      ?auto_106181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106174 ?auto_106175 ) ) ( not ( = ?auto_106174 ?auto_106176 ) ) ( not ( = ?auto_106174 ?auto_106177 ) ) ( not ( = ?auto_106175 ?auto_106176 ) ) ( not ( = ?auto_106175 ?auto_106177 ) ) ( not ( = ?auto_106176 ?auto_106177 ) ) ( not ( = ?auto_106174 ?auto_106179 ) ) ( not ( = ?auto_106175 ?auto_106179 ) ) ( not ( = ?auto_106176 ?auto_106179 ) ) ( not ( = ?auto_106177 ?auto_106179 ) ) ( not ( = ?auto_106178 ?auto_106180 ) ) ( not ( = ?auto_106178 ?auto_106179 ) ) ( not ( = ?auto_106178 ?auto_106177 ) ) ( not ( = ?auto_106178 ?auto_106176 ) ) ( not ( = ?auto_106180 ?auto_106179 ) ) ( not ( = ?auto_106180 ?auto_106177 ) ) ( not ( = ?auto_106180 ?auto_106176 ) ) ( not ( = ?auto_106174 ?auto_106178 ) ) ( not ( = ?auto_106174 ?auto_106180 ) ) ( not ( = ?auto_106175 ?auto_106178 ) ) ( not ( = ?auto_106175 ?auto_106180 ) ) ( ON ?auto_106174 ?auto_106181 ) ( not ( = ?auto_106174 ?auto_106181 ) ) ( not ( = ?auto_106175 ?auto_106181 ) ) ( not ( = ?auto_106176 ?auto_106181 ) ) ( not ( = ?auto_106177 ?auto_106181 ) ) ( not ( = ?auto_106179 ?auto_106181 ) ) ( not ( = ?auto_106178 ?auto_106181 ) ) ( not ( = ?auto_106180 ?auto_106181 ) ) ( ON ?auto_106175 ?auto_106174 ) ( ON-TABLE ?auto_106181 ) ( ON ?auto_106176 ?auto_106175 ) ( ON ?auto_106177 ?auto_106176 ) ( ON ?auto_106179 ?auto_106177 ) ( ON ?auto_106180 ?auto_106179 ) ( CLEAR ?auto_106180 ) ( HOLDING ?auto_106178 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106178 )
      ( MAKE-4PILE ?auto_106174 ?auto_106175 ?auto_106176 ?auto_106177 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106182 - BLOCK
      ?auto_106183 - BLOCK
      ?auto_106184 - BLOCK
      ?auto_106185 - BLOCK
    )
    :vars
    (
      ?auto_106187 - BLOCK
      ?auto_106189 - BLOCK
      ?auto_106186 - BLOCK
      ?auto_106188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106182 ?auto_106183 ) ) ( not ( = ?auto_106182 ?auto_106184 ) ) ( not ( = ?auto_106182 ?auto_106185 ) ) ( not ( = ?auto_106183 ?auto_106184 ) ) ( not ( = ?auto_106183 ?auto_106185 ) ) ( not ( = ?auto_106184 ?auto_106185 ) ) ( not ( = ?auto_106182 ?auto_106187 ) ) ( not ( = ?auto_106183 ?auto_106187 ) ) ( not ( = ?auto_106184 ?auto_106187 ) ) ( not ( = ?auto_106185 ?auto_106187 ) ) ( not ( = ?auto_106189 ?auto_106186 ) ) ( not ( = ?auto_106189 ?auto_106187 ) ) ( not ( = ?auto_106189 ?auto_106185 ) ) ( not ( = ?auto_106189 ?auto_106184 ) ) ( not ( = ?auto_106186 ?auto_106187 ) ) ( not ( = ?auto_106186 ?auto_106185 ) ) ( not ( = ?auto_106186 ?auto_106184 ) ) ( not ( = ?auto_106182 ?auto_106189 ) ) ( not ( = ?auto_106182 ?auto_106186 ) ) ( not ( = ?auto_106183 ?auto_106189 ) ) ( not ( = ?auto_106183 ?auto_106186 ) ) ( ON ?auto_106182 ?auto_106188 ) ( not ( = ?auto_106182 ?auto_106188 ) ) ( not ( = ?auto_106183 ?auto_106188 ) ) ( not ( = ?auto_106184 ?auto_106188 ) ) ( not ( = ?auto_106185 ?auto_106188 ) ) ( not ( = ?auto_106187 ?auto_106188 ) ) ( not ( = ?auto_106189 ?auto_106188 ) ) ( not ( = ?auto_106186 ?auto_106188 ) ) ( ON ?auto_106183 ?auto_106182 ) ( ON-TABLE ?auto_106188 ) ( ON ?auto_106184 ?auto_106183 ) ( ON ?auto_106185 ?auto_106184 ) ( ON ?auto_106187 ?auto_106185 ) ( ON ?auto_106186 ?auto_106187 ) ( ON ?auto_106189 ?auto_106186 ) ( CLEAR ?auto_106189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106188 ?auto_106182 ?auto_106183 ?auto_106184 ?auto_106185 ?auto_106187 ?auto_106186 )
      ( MAKE-4PILE ?auto_106182 ?auto_106183 ?auto_106184 ?auto_106185 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106192 - BLOCK
      ?auto_106193 - BLOCK
    )
    :vars
    (
      ?auto_106194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106194 ?auto_106193 ) ( CLEAR ?auto_106194 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106192 ) ( ON ?auto_106193 ?auto_106192 ) ( not ( = ?auto_106192 ?auto_106193 ) ) ( not ( = ?auto_106192 ?auto_106194 ) ) ( not ( = ?auto_106193 ?auto_106194 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106194 ?auto_106193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106195 - BLOCK
      ?auto_106196 - BLOCK
    )
    :vars
    (
      ?auto_106197 - BLOCK
      ?auto_106198 - BLOCK
      ?auto_106199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106197 ?auto_106196 ) ( CLEAR ?auto_106197 ) ( ON-TABLE ?auto_106195 ) ( ON ?auto_106196 ?auto_106195 ) ( not ( = ?auto_106195 ?auto_106196 ) ) ( not ( = ?auto_106195 ?auto_106197 ) ) ( not ( = ?auto_106196 ?auto_106197 ) ) ( HOLDING ?auto_106198 ) ( CLEAR ?auto_106199 ) ( not ( = ?auto_106195 ?auto_106198 ) ) ( not ( = ?auto_106195 ?auto_106199 ) ) ( not ( = ?auto_106196 ?auto_106198 ) ) ( not ( = ?auto_106196 ?auto_106199 ) ) ( not ( = ?auto_106197 ?auto_106198 ) ) ( not ( = ?auto_106197 ?auto_106199 ) ) ( not ( = ?auto_106198 ?auto_106199 ) ) )
    :subtasks
    ( ( !STACK ?auto_106198 ?auto_106199 )
      ( MAKE-2PILE ?auto_106195 ?auto_106196 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106200 - BLOCK
      ?auto_106201 - BLOCK
    )
    :vars
    (
      ?auto_106204 - BLOCK
      ?auto_106202 - BLOCK
      ?auto_106203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106204 ?auto_106201 ) ( ON-TABLE ?auto_106200 ) ( ON ?auto_106201 ?auto_106200 ) ( not ( = ?auto_106200 ?auto_106201 ) ) ( not ( = ?auto_106200 ?auto_106204 ) ) ( not ( = ?auto_106201 ?auto_106204 ) ) ( CLEAR ?auto_106202 ) ( not ( = ?auto_106200 ?auto_106203 ) ) ( not ( = ?auto_106200 ?auto_106202 ) ) ( not ( = ?auto_106201 ?auto_106203 ) ) ( not ( = ?auto_106201 ?auto_106202 ) ) ( not ( = ?auto_106204 ?auto_106203 ) ) ( not ( = ?auto_106204 ?auto_106202 ) ) ( not ( = ?auto_106203 ?auto_106202 ) ) ( ON ?auto_106203 ?auto_106204 ) ( CLEAR ?auto_106203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106200 ?auto_106201 ?auto_106204 )
      ( MAKE-2PILE ?auto_106200 ?auto_106201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106205 - BLOCK
      ?auto_106206 - BLOCK
    )
    :vars
    (
      ?auto_106209 - BLOCK
      ?auto_106208 - BLOCK
      ?auto_106207 - BLOCK
      ?auto_106211 - BLOCK
      ?auto_106210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106209 ?auto_106206 ) ( ON-TABLE ?auto_106205 ) ( ON ?auto_106206 ?auto_106205 ) ( not ( = ?auto_106205 ?auto_106206 ) ) ( not ( = ?auto_106205 ?auto_106209 ) ) ( not ( = ?auto_106206 ?auto_106209 ) ) ( not ( = ?auto_106205 ?auto_106208 ) ) ( not ( = ?auto_106205 ?auto_106207 ) ) ( not ( = ?auto_106206 ?auto_106208 ) ) ( not ( = ?auto_106206 ?auto_106207 ) ) ( not ( = ?auto_106209 ?auto_106208 ) ) ( not ( = ?auto_106209 ?auto_106207 ) ) ( not ( = ?auto_106208 ?auto_106207 ) ) ( ON ?auto_106208 ?auto_106209 ) ( CLEAR ?auto_106208 ) ( HOLDING ?auto_106207 ) ( CLEAR ?auto_106211 ) ( ON-TABLE ?auto_106210 ) ( ON ?auto_106211 ?auto_106210 ) ( not ( = ?auto_106210 ?auto_106211 ) ) ( not ( = ?auto_106210 ?auto_106207 ) ) ( not ( = ?auto_106211 ?auto_106207 ) ) ( not ( = ?auto_106205 ?auto_106211 ) ) ( not ( = ?auto_106205 ?auto_106210 ) ) ( not ( = ?auto_106206 ?auto_106211 ) ) ( not ( = ?auto_106206 ?auto_106210 ) ) ( not ( = ?auto_106209 ?auto_106211 ) ) ( not ( = ?auto_106209 ?auto_106210 ) ) ( not ( = ?auto_106208 ?auto_106211 ) ) ( not ( = ?auto_106208 ?auto_106210 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106210 ?auto_106211 ?auto_106207 )
      ( MAKE-2PILE ?auto_106205 ?auto_106206 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106212 - BLOCK
      ?auto_106213 - BLOCK
    )
    :vars
    (
      ?auto_106218 - BLOCK
      ?auto_106214 - BLOCK
      ?auto_106215 - BLOCK
      ?auto_106217 - BLOCK
      ?auto_106216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106218 ?auto_106213 ) ( ON-TABLE ?auto_106212 ) ( ON ?auto_106213 ?auto_106212 ) ( not ( = ?auto_106212 ?auto_106213 ) ) ( not ( = ?auto_106212 ?auto_106218 ) ) ( not ( = ?auto_106213 ?auto_106218 ) ) ( not ( = ?auto_106212 ?auto_106214 ) ) ( not ( = ?auto_106212 ?auto_106215 ) ) ( not ( = ?auto_106213 ?auto_106214 ) ) ( not ( = ?auto_106213 ?auto_106215 ) ) ( not ( = ?auto_106218 ?auto_106214 ) ) ( not ( = ?auto_106218 ?auto_106215 ) ) ( not ( = ?auto_106214 ?auto_106215 ) ) ( ON ?auto_106214 ?auto_106218 ) ( CLEAR ?auto_106217 ) ( ON-TABLE ?auto_106216 ) ( ON ?auto_106217 ?auto_106216 ) ( not ( = ?auto_106216 ?auto_106217 ) ) ( not ( = ?auto_106216 ?auto_106215 ) ) ( not ( = ?auto_106217 ?auto_106215 ) ) ( not ( = ?auto_106212 ?auto_106217 ) ) ( not ( = ?auto_106212 ?auto_106216 ) ) ( not ( = ?auto_106213 ?auto_106217 ) ) ( not ( = ?auto_106213 ?auto_106216 ) ) ( not ( = ?auto_106218 ?auto_106217 ) ) ( not ( = ?auto_106218 ?auto_106216 ) ) ( not ( = ?auto_106214 ?auto_106217 ) ) ( not ( = ?auto_106214 ?auto_106216 ) ) ( ON ?auto_106215 ?auto_106214 ) ( CLEAR ?auto_106215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106212 ?auto_106213 ?auto_106218 ?auto_106214 )
      ( MAKE-2PILE ?auto_106212 ?auto_106213 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106219 - BLOCK
      ?auto_106220 - BLOCK
    )
    :vars
    (
      ?auto_106225 - BLOCK
      ?auto_106221 - BLOCK
      ?auto_106223 - BLOCK
      ?auto_106224 - BLOCK
      ?auto_106222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106225 ?auto_106220 ) ( ON-TABLE ?auto_106219 ) ( ON ?auto_106220 ?auto_106219 ) ( not ( = ?auto_106219 ?auto_106220 ) ) ( not ( = ?auto_106219 ?auto_106225 ) ) ( not ( = ?auto_106220 ?auto_106225 ) ) ( not ( = ?auto_106219 ?auto_106221 ) ) ( not ( = ?auto_106219 ?auto_106223 ) ) ( not ( = ?auto_106220 ?auto_106221 ) ) ( not ( = ?auto_106220 ?auto_106223 ) ) ( not ( = ?auto_106225 ?auto_106221 ) ) ( not ( = ?auto_106225 ?auto_106223 ) ) ( not ( = ?auto_106221 ?auto_106223 ) ) ( ON ?auto_106221 ?auto_106225 ) ( ON-TABLE ?auto_106224 ) ( not ( = ?auto_106224 ?auto_106222 ) ) ( not ( = ?auto_106224 ?auto_106223 ) ) ( not ( = ?auto_106222 ?auto_106223 ) ) ( not ( = ?auto_106219 ?auto_106222 ) ) ( not ( = ?auto_106219 ?auto_106224 ) ) ( not ( = ?auto_106220 ?auto_106222 ) ) ( not ( = ?auto_106220 ?auto_106224 ) ) ( not ( = ?auto_106225 ?auto_106222 ) ) ( not ( = ?auto_106225 ?auto_106224 ) ) ( not ( = ?auto_106221 ?auto_106222 ) ) ( not ( = ?auto_106221 ?auto_106224 ) ) ( ON ?auto_106223 ?auto_106221 ) ( CLEAR ?auto_106223 ) ( HOLDING ?auto_106222 ) ( CLEAR ?auto_106224 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106224 ?auto_106222 )
      ( MAKE-2PILE ?auto_106219 ?auto_106220 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106226 - BLOCK
      ?auto_106227 - BLOCK
    )
    :vars
    (
      ?auto_106230 - BLOCK
      ?auto_106232 - BLOCK
      ?auto_106228 - BLOCK
      ?auto_106231 - BLOCK
      ?auto_106229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106230 ?auto_106227 ) ( ON-TABLE ?auto_106226 ) ( ON ?auto_106227 ?auto_106226 ) ( not ( = ?auto_106226 ?auto_106227 ) ) ( not ( = ?auto_106226 ?auto_106230 ) ) ( not ( = ?auto_106227 ?auto_106230 ) ) ( not ( = ?auto_106226 ?auto_106232 ) ) ( not ( = ?auto_106226 ?auto_106228 ) ) ( not ( = ?auto_106227 ?auto_106232 ) ) ( not ( = ?auto_106227 ?auto_106228 ) ) ( not ( = ?auto_106230 ?auto_106232 ) ) ( not ( = ?auto_106230 ?auto_106228 ) ) ( not ( = ?auto_106232 ?auto_106228 ) ) ( ON ?auto_106232 ?auto_106230 ) ( ON-TABLE ?auto_106231 ) ( not ( = ?auto_106231 ?auto_106229 ) ) ( not ( = ?auto_106231 ?auto_106228 ) ) ( not ( = ?auto_106229 ?auto_106228 ) ) ( not ( = ?auto_106226 ?auto_106229 ) ) ( not ( = ?auto_106226 ?auto_106231 ) ) ( not ( = ?auto_106227 ?auto_106229 ) ) ( not ( = ?auto_106227 ?auto_106231 ) ) ( not ( = ?auto_106230 ?auto_106229 ) ) ( not ( = ?auto_106230 ?auto_106231 ) ) ( not ( = ?auto_106232 ?auto_106229 ) ) ( not ( = ?auto_106232 ?auto_106231 ) ) ( ON ?auto_106228 ?auto_106232 ) ( CLEAR ?auto_106231 ) ( ON ?auto_106229 ?auto_106228 ) ( CLEAR ?auto_106229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106226 ?auto_106227 ?auto_106230 ?auto_106232 ?auto_106228 )
      ( MAKE-2PILE ?auto_106226 ?auto_106227 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106233 - BLOCK
      ?auto_106234 - BLOCK
    )
    :vars
    (
      ?auto_106236 - BLOCK
      ?auto_106239 - BLOCK
      ?auto_106237 - BLOCK
      ?auto_106235 - BLOCK
      ?auto_106238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106236 ?auto_106234 ) ( ON-TABLE ?auto_106233 ) ( ON ?auto_106234 ?auto_106233 ) ( not ( = ?auto_106233 ?auto_106234 ) ) ( not ( = ?auto_106233 ?auto_106236 ) ) ( not ( = ?auto_106234 ?auto_106236 ) ) ( not ( = ?auto_106233 ?auto_106239 ) ) ( not ( = ?auto_106233 ?auto_106237 ) ) ( not ( = ?auto_106234 ?auto_106239 ) ) ( not ( = ?auto_106234 ?auto_106237 ) ) ( not ( = ?auto_106236 ?auto_106239 ) ) ( not ( = ?auto_106236 ?auto_106237 ) ) ( not ( = ?auto_106239 ?auto_106237 ) ) ( ON ?auto_106239 ?auto_106236 ) ( not ( = ?auto_106235 ?auto_106238 ) ) ( not ( = ?auto_106235 ?auto_106237 ) ) ( not ( = ?auto_106238 ?auto_106237 ) ) ( not ( = ?auto_106233 ?auto_106238 ) ) ( not ( = ?auto_106233 ?auto_106235 ) ) ( not ( = ?auto_106234 ?auto_106238 ) ) ( not ( = ?auto_106234 ?auto_106235 ) ) ( not ( = ?auto_106236 ?auto_106238 ) ) ( not ( = ?auto_106236 ?auto_106235 ) ) ( not ( = ?auto_106239 ?auto_106238 ) ) ( not ( = ?auto_106239 ?auto_106235 ) ) ( ON ?auto_106237 ?auto_106239 ) ( ON ?auto_106238 ?auto_106237 ) ( CLEAR ?auto_106238 ) ( HOLDING ?auto_106235 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106235 )
      ( MAKE-2PILE ?auto_106233 ?auto_106234 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106240 - BLOCK
      ?auto_106241 - BLOCK
    )
    :vars
    (
      ?auto_106246 - BLOCK
      ?auto_106243 - BLOCK
      ?auto_106245 - BLOCK
      ?auto_106244 - BLOCK
      ?auto_106242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106246 ?auto_106241 ) ( ON-TABLE ?auto_106240 ) ( ON ?auto_106241 ?auto_106240 ) ( not ( = ?auto_106240 ?auto_106241 ) ) ( not ( = ?auto_106240 ?auto_106246 ) ) ( not ( = ?auto_106241 ?auto_106246 ) ) ( not ( = ?auto_106240 ?auto_106243 ) ) ( not ( = ?auto_106240 ?auto_106245 ) ) ( not ( = ?auto_106241 ?auto_106243 ) ) ( not ( = ?auto_106241 ?auto_106245 ) ) ( not ( = ?auto_106246 ?auto_106243 ) ) ( not ( = ?auto_106246 ?auto_106245 ) ) ( not ( = ?auto_106243 ?auto_106245 ) ) ( ON ?auto_106243 ?auto_106246 ) ( not ( = ?auto_106244 ?auto_106242 ) ) ( not ( = ?auto_106244 ?auto_106245 ) ) ( not ( = ?auto_106242 ?auto_106245 ) ) ( not ( = ?auto_106240 ?auto_106242 ) ) ( not ( = ?auto_106240 ?auto_106244 ) ) ( not ( = ?auto_106241 ?auto_106242 ) ) ( not ( = ?auto_106241 ?auto_106244 ) ) ( not ( = ?auto_106246 ?auto_106242 ) ) ( not ( = ?auto_106246 ?auto_106244 ) ) ( not ( = ?auto_106243 ?auto_106242 ) ) ( not ( = ?auto_106243 ?auto_106244 ) ) ( ON ?auto_106245 ?auto_106243 ) ( ON ?auto_106242 ?auto_106245 ) ( ON ?auto_106244 ?auto_106242 ) ( CLEAR ?auto_106244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106240 ?auto_106241 ?auto_106246 ?auto_106243 ?auto_106245 ?auto_106242 )
      ( MAKE-2PILE ?auto_106240 ?auto_106241 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106247 - BLOCK
      ?auto_106248 - BLOCK
    )
    :vars
    (
      ?auto_106250 - BLOCK
      ?auto_106252 - BLOCK
      ?auto_106251 - BLOCK
      ?auto_106249 - BLOCK
      ?auto_106253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106250 ?auto_106248 ) ( ON-TABLE ?auto_106247 ) ( ON ?auto_106248 ?auto_106247 ) ( not ( = ?auto_106247 ?auto_106248 ) ) ( not ( = ?auto_106247 ?auto_106250 ) ) ( not ( = ?auto_106248 ?auto_106250 ) ) ( not ( = ?auto_106247 ?auto_106252 ) ) ( not ( = ?auto_106247 ?auto_106251 ) ) ( not ( = ?auto_106248 ?auto_106252 ) ) ( not ( = ?auto_106248 ?auto_106251 ) ) ( not ( = ?auto_106250 ?auto_106252 ) ) ( not ( = ?auto_106250 ?auto_106251 ) ) ( not ( = ?auto_106252 ?auto_106251 ) ) ( ON ?auto_106252 ?auto_106250 ) ( not ( = ?auto_106249 ?auto_106253 ) ) ( not ( = ?auto_106249 ?auto_106251 ) ) ( not ( = ?auto_106253 ?auto_106251 ) ) ( not ( = ?auto_106247 ?auto_106253 ) ) ( not ( = ?auto_106247 ?auto_106249 ) ) ( not ( = ?auto_106248 ?auto_106253 ) ) ( not ( = ?auto_106248 ?auto_106249 ) ) ( not ( = ?auto_106250 ?auto_106253 ) ) ( not ( = ?auto_106250 ?auto_106249 ) ) ( not ( = ?auto_106252 ?auto_106253 ) ) ( not ( = ?auto_106252 ?auto_106249 ) ) ( ON ?auto_106251 ?auto_106252 ) ( ON ?auto_106253 ?auto_106251 ) ( HOLDING ?auto_106249 ) ( CLEAR ?auto_106253 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106247 ?auto_106248 ?auto_106250 ?auto_106252 ?auto_106251 ?auto_106253 ?auto_106249 )
      ( MAKE-2PILE ?auto_106247 ?auto_106248 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106254 - BLOCK
      ?auto_106255 - BLOCK
    )
    :vars
    (
      ?auto_106259 - BLOCK
      ?auto_106256 - BLOCK
      ?auto_106257 - BLOCK
      ?auto_106260 - BLOCK
      ?auto_106258 - BLOCK
      ?auto_106261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106259 ?auto_106255 ) ( ON-TABLE ?auto_106254 ) ( ON ?auto_106255 ?auto_106254 ) ( not ( = ?auto_106254 ?auto_106255 ) ) ( not ( = ?auto_106254 ?auto_106259 ) ) ( not ( = ?auto_106255 ?auto_106259 ) ) ( not ( = ?auto_106254 ?auto_106256 ) ) ( not ( = ?auto_106254 ?auto_106257 ) ) ( not ( = ?auto_106255 ?auto_106256 ) ) ( not ( = ?auto_106255 ?auto_106257 ) ) ( not ( = ?auto_106259 ?auto_106256 ) ) ( not ( = ?auto_106259 ?auto_106257 ) ) ( not ( = ?auto_106256 ?auto_106257 ) ) ( ON ?auto_106256 ?auto_106259 ) ( not ( = ?auto_106260 ?auto_106258 ) ) ( not ( = ?auto_106260 ?auto_106257 ) ) ( not ( = ?auto_106258 ?auto_106257 ) ) ( not ( = ?auto_106254 ?auto_106258 ) ) ( not ( = ?auto_106254 ?auto_106260 ) ) ( not ( = ?auto_106255 ?auto_106258 ) ) ( not ( = ?auto_106255 ?auto_106260 ) ) ( not ( = ?auto_106259 ?auto_106258 ) ) ( not ( = ?auto_106259 ?auto_106260 ) ) ( not ( = ?auto_106256 ?auto_106258 ) ) ( not ( = ?auto_106256 ?auto_106260 ) ) ( ON ?auto_106257 ?auto_106256 ) ( ON ?auto_106258 ?auto_106257 ) ( CLEAR ?auto_106258 ) ( ON ?auto_106260 ?auto_106261 ) ( CLEAR ?auto_106260 ) ( HAND-EMPTY ) ( not ( = ?auto_106254 ?auto_106261 ) ) ( not ( = ?auto_106255 ?auto_106261 ) ) ( not ( = ?auto_106259 ?auto_106261 ) ) ( not ( = ?auto_106256 ?auto_106261 ) ) ( not ( = ?auto_106257 ?auto_106261 ) ) ( not ( = ?auto_106260 ?auto_106261 ) ) ( not ( = ?auto_106258 ?auto_106261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106260 ?auto_106261 )
      ( MAKE-2PILE ?auto_106254 ?auto_106255 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106262 - BLOCK
      ?auto_106263 - BLOCK
    )
    :vars
    (
      ?auto_106265 - BLOCK
      ?auto_106268 - BLOCK
      ?auto_106264 - BLOCK
      ?auto_106267 - BLOCK
      ?auto_106266 - BLOCK
      ?auto_106269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106265 ?auto_106263 ) ( ON-TABLE ?auto_106262 ) ( ON ?auto_106263 ?auto_106262 ) ( not ( = ?auto_106262 ?auto_106263 ) ) ( not ( = ?auto_106262 ?auto_106265 ) ) ( not ( = ?auto_106263 ?auto_106265 ) ) ( not ( = ?auto_106262 ?auto_106268 ) ) ( not ( = ?auto_106262 ?auto_106264 ) ) ( not ( = ?auto_106263 ?auto_106268 ) ) ( not ( = ?auto_106263 ?auto_106264 ) ) ( not ( = ?auto_106265 ?auto_106268 ) ) ( not ( = ?auto_106265 ?auto_106264 ) ) ( not ( = ?auto_106268 ?auto_106264 ) ) ( ON ?auto_106268 ?auto_106265 ) ( not ( = ?auto_106267 ?auto_106266 ) ) ( not ( = ?auto_106267 ?auto_106264 ) ) ( not ( = ?auto_106266 ?auto_106264 ) ) ( not ( = ?auto_106262 ?auto_106266 ) ) ( not ( = ?auto_106262 ?auto_106267 ) ) ( not ( = ?auto_106263 ?auto_106266 ) ) ( not ( = ?auto_106263 ?auto_106267 ) ) ( not ( = ?auto_106265 ?auto_106266 ) ) ( not ( = ?auto_106265 ?auto_106267 ) ) ( not ( = ?auto_106268 ?auto_106266 ) ) ( not ( = ?auto_106268 ?auto_106267 ) ) ( ON ?auto_106264 ?auto_106268 ) ( ON ?auto_106267 ?auto_106269 ) ( CLEAR ?auto_106267 ) ( not ( = ?auto_106262 ?auto_106269 ) ) ( not ( = ?auto_106263 ?auto_106269 ) ) ( not ( = ?auto_106265 ?auto_106269 ) ) ( not ( = ?auto_106268 ?auto_106269 ) ) ( not ( = ?auto_106264 ?auto_106269 ) ) ( not ( = ?auto_106267 ?auto_106269 ) ) ( not ( = ?auto_106266 ?auto_106269 ) ) ( HOLDING ?auto_106266 ) ( CLEAR ?auto_106264 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106262 ?auto_106263 ?auto_106265 ?auto_106268 ?auto_106264 ?auto_106266 )
      ( MAKE-2PILE ?auto_106262 ?auto_106263 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106270 - BLOCK
      ?auto_106271 - BLOCK
    )
    :vars
    (
      ?auto_106277 - BLOCK
      ?auto_106276 - BLOCK
      ?auto_106273 - BLOCK
      ?auto_106272 - BLOCK
      ?auto_106275 - BLOCK
      ?auto_106274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106277 ?auto_106271 ) ( ON-TABLE ?auto_106270 ) ( ON ?auto_106271 ?auto_106270 ) ( not ( = ?auto_106270 ?auto_106271 ) ) ( not ( = ?auto_106270 ?auto_106277 ) ) ( not ( = ?auto_106271 ?auto_106277 ) ) ( not ( = ?auto_106270 ?auto_106276 ) ) ( not ( = ?auto_106270 ?auto_106273 ) ) ( not ( = ?auto_106271 ?auto_106276 ) ) ( not ( = ?auto_106271 ?auto_106273 ) ) ( not ( = ?auto_106277 ?auto_106276 ) ) ( not ( = ?auto_106277 ?auto_106273 ) ) ( not ( = ?auto_106276 ?auto_106273 ) ) ( ON ?auto_106276 ?auto_106277 ) ( not ( = ?auto_106272 ?auto_106275 ) ) ( not ( = ?auto_106272 ?auto_106273 ) ) ( not ( = ?auto_106275 ?auto_106273 ) ) ( not ( = ?auto_106270 ?auto_106275 ) ) ( not ( = ?auto_106270 ?auto_106272 ) ) ( not ( = ?auto_106271 ?auto_106275 ) ) ( not ( = ?auto_106271 ?auto_106272 ) ) ( not ( = ?auto_106277 ?auto_106275 ) ) ( not ( = ?auto_106277 ?auto_106272 ) ) ( not ( = ?auto_106276 ?auto_106275 ) ) ( not ( = ?auto_106276 ?auto_106272 ) ) ( ON ?auto_106273 ?auto_106276 ) ( ON ?auto_106272 ?auto_106274 ) ( not ( = ?auto_106270 ?auto_106274 ) ) ( not ( = ?auto_106271 ?auto_106274 ) ) ( not ( = ?auto_106277 ?auto_106274 ) ) ( not ( = ?auto_106276 ?auto_106274 ) ) ( not ( = ?auto_106273 ?auto_106274 ) ) ( not ( = ?auto_106272 ?auto_106274 ) ) ( not ( = ?auto_106275 ?auto_106274 ) ) ( CLEAR ?auto_106273 ) ( ON ?auto_106275 ?auto_106272 ) ( CLEAR ?auto_106275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106274 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106274 ?auto_106272 )
      ( MAKE-2PILE ?auto_106270 ?auto_106271 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106278 - BLOCK
      ?auto_106279 - BLOCK
    )
    :vars
    (
      ?auto_106281 - BLOCK
      ?auto_106283 - BLOCK
      ?auto_106280 - BLOCK
      ?auto_106285 - BLOCK
      ?auto_106284 - BLOCK
      ?auto_106282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106281 ?auto_106279 ) ( ON-TABLE ?auto_106278 ) ( ON ?auto_106279 ?auto_106278 ) ( not ( = ?auto_106278 ?auto_106279 ) ) ( not ( = ?auto_106278 ?auto_106281 ) ) ( not ( = ?auto_106279 ?auto_106281 ) ) ( not ( = ?auto_106278 ?auto_106283 ) ) ( not ( = ?auto_106278 ?auto_106280 ) ) ( not ( = ?auto_106279 ?auto_106283 ) ) ( not ( = ?auto_106279 ?auto_106280 ) ) ( not ( = ?auto_106281 ?auto_106283 ) ) ( not ( = ?auto_106281 ?auto_106280 ) ) ( not ( = ?auto_106283 ?auto_106280 ) ) ( ON ?auto_106283 ?auto_106281 ) ( not ( = ?auto_106285 ?auto_106284 ) ) ( not ( = ?auto_106285 ?auto_106280 ) ) ( not ( = ?auto_106284 ?auto_106280 ) ) ( not ( = ?auto_106278 ?auto_106284 ) ) ( not ( = ?auto_106278 ?auto_106285 ) ) ( not ( = ?auto_106279 ?auto_106284 ) ) ( not ( = ?auto_106279 ?auto_106285 ) ) ( not ( = ?auto_106281 ?auto_106284 ) ) ( not ( = ?auto_106281 ?auto_106285 ) ) ( not ( = ?auto_106283 ?auto_106284 ) ) ( not ( = ?auto_106283 ?auto_106285 ) ) ( ON ?auto_106285 ?auto_106282 ) ( not ( = ?auto_106278 ?auto_106282 ) ) ( not ( = ?auto_106279 ?auto_106282 ) ) ( not ( = ?auto_106281 ?auto_106282 ) ) ( not ( = ?auto_106283 ?auto_106282 ) ) ( not ( = ?auto_106280 ?auto_106282 ) ) ( not ( = ?auto_106285 ?auto_106282 ) ) ( not ( = ?auto_106284 ?auto_106282 ) ) ( ON ?auto_106284 ?auto_106285 ) ( CLEAR ?auto_106284 ) ( ON-TABLE ?auto_106282 ) ( HOLDING ?auto_106280 ) ( CLEAR ?auto_106283 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106278 ?auto_106279 ?auto_106281 ?auto_106283 ?auto_106280 )
      ( MAKE-2PILE ?auto_106278 ?auto_106279 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106286 - BLOCK
      ?auto_106287 - BLOCK
    )
    :vars
    (
      ?auto_106292 - BLOCK
      ?auto_106291 - BLOCK
      ?auto_106293 - BLOCK
      ?auto_106290 - BLOCK
      ?auto_106289 - BLOCK
      ?auto_106288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106292 ?auto_106287 ) ( ON-TABLE ?auto_106286 ) ( ON ?auto_106287 ?auto_106286 ) ( not ( = ?auto_106286 ?auto_106287 ) ) ( not ( = ?auto_106286 ?auto_106292 ) ) ( not ( = ?auto_106287 ?auto_106292 ) ) ( not ( = ?auto_106286 ?auto_106291 ) ) ( not ( = ?auto_106286 ?auto_106293 ) ) ( not ( = ?auto_106287 ?auto_106291 ) ) ( not ( = ?auto_106287 ?auto_106293 ) ) ( not ( = ?auto_106292 ?auto_106291 ) ) ( not ( = ?auto_106292 ?auto_106293 ) ) ( not ( = ?auto_106291 ?auto_106293 ) ) ( ON ?auto_106291 ?auto_106292 ) ( not ( = ?auto_106290 ?auto_106289 ) ) ( not ( = ?auto_106290 ?auto_106293 ) ) ( not ( = ?auto_106289 ?auto_106293 ) ) ( not ( = ?auto_106286 ?auto_106289 ) ) ( not ( = ?auto_106286 ?auto_106290 ) ) ( not ( = ?auto_106287 ?auto_106289 ) ) ( not ( = ?auto_106287 ?auto_106290 ) ) ( not ( = ?auto_106292 ?auto_106289 ) ) ( not ( = ?auto_106292 ?auto_106290 ) ) ( not ( = ?auto_106291 ?auto_106289 ) ) ( not ( = ?auto_106291 ?auto_106290 ) ) ( ON ?auto_106290 ?auto_106288 ) ( not ( = ?auto_106286 ?auto_106288 ) ) ( not ( = ?auto_106287 ?auto_106288 ) ) ( not ( = ?auto_106292 ?auto_106288 ) ) ( not ( = ?auto_106291 ?auto_106288 ) ) ( not ( = ?auto_106293 ?auto_106288 ) ) ( not ( = ?auto_106290 ?auto_106288 ) ) ( not ( = ?auto_106289 ?auto_106288 ) ) ( ON ?auto_106289 ?auto_106290 ) ( ON-TABLE ?auto_106288 ) ( CLEAR ?auto_106291 ) ( ON ?auto_106293 ?auto_106289 ) ( CLEAR ?auto_106293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106288 ?auto_106290 ?auto_106289 )
      ( MAKE-2PILE ?auto_106286 ?auto_106287 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106294 - BLOCK
      ?auto_106295 - BLOCK
    )
    :vars
    (
      ?auto_106298 - BLOCK
      ?auto_106301 - BLOCK
      ?auto_106297 - BLOCK
      ?auto_106296 - BLOCK
      ?auto_106299 - BLOCK
      ?auto_106300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106298 ?auto_106295 ) ( ON-TABLE ?auto_106294 ) ( ON ?auto_106295 ?auto_106294 ) ( not ( = ?auto_106294 ?auto_106295 ) ) ( not ( = ?auto_106294 ?auto_106298 ) ) ( not ( = ?auto_106295 ?auto_106298 ) ) ( not ( = ?auto_106294 ?auto_106301 ) ) ( not ( = ?auto_106294 ?auto_106297 ) ) ( not ( = ?auto_106295 ?auto_106301 ) ) ( not ( = ?auto_106295 ?auto_106297 ) ) ( not ( = ?auto_106298 ?auto_106301 ) ) ( not ( = ?auto_106298 ?auto_106297 ) ) ( not ( = ?auto_106301 ?auto_106297 ) ) ( not ( = ?auto_106296 ?auto_106299 ) ) ( not ( = ?auto_106296 ?auto_106297 ) ) ( not ( = ?auto_106299 ?auto_106297 ) ) ( not ( = ?auto_106294 ?auto_106299 ) ) ( not ( = ?auto_106294 ?auto_106296 ) ) ( not ( = ?auto_106295 ?auto_106299 ) ) ( not ( = ?auto_106295 ?auto_106296 ) ) ( not ( = ?auto_106298 ?auto_106299 ) ) ( not ( = ?auto_106298 ?auto_106296 ) ) ( not ( = ?auto_106301 ?auto_106299 ) ) ( not ( = ?auto_106301 ?auto_106296 ) ) ( ON ?auto_106296 ?auto_106300 ) ( not ( = ?auto_106294 ?auto_106300 ) ) ( not ( = ?auto_106295 ?auto_106300 ) ) ( not ( = ?auto_106298 ?auto_106300 ) ) ( not ( = ?auto_106301 ?auto_106300 ) ) ( not ( = ?auto_106297 ?auto_106300 ) ) ( not ( = ?auto_106296 ?auto_106300 ) ) ( not ( = ?auto_106299 ?auto_106300 ) ) ( ON ?auto_106299 ?auto_106296 ) ( ON-TABLE ?auto_106300 ) ( ON ?auto_106297 ?auto_106299 ) ( CLEAR ?auto_106297 ) ( HOLDING ?auto_106301 ) ( CLEAR ?auto_106298 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106294 ?auto_106295 ?auto_106298 ?auto_106301 )
      ( MAKE-2PILE ?auto_106294 ?auto_106295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106302 - BLOCK
      ?auto_106303 - BLOCK
    )
    :vars
    (
      ?auto_106305 - BLOCK
      ?auto_106309 - BLOCK
      ?auto_106308 - BLOCK
      ?auto_106306 - BLOCK
      ?auto_106307 - BLOCK
      ?auto_106304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106305 ?auto_106303 ) ( ON-TABLE ?auto_106302 ) ( ON ?auto_106303 ?auto_106302 ) ( not ( = ?auto_106302 ?auto_106303 ) ) ( not ( = ?auto_106302 ?auto_106305 ) ) ( not ( = ?auto_106303 ?auto_106305 ) ) ( not ( = ?auto_106302 ?auto_106309 ) ) ( not ( = ?auto_106302 ?auto_106308 ) ) ( not ( = ?auto_106303 ?auto_106309 ) ) ( not ( = ?auto_106303 ?auto_106308 ) ) ( not ( = ?auto_106305 ?auto_106309 ) ) ( not ( = ?auto_106305 ?auto_106308 ) ) ( not ( = ?auto_106309 ?auto_106308 ) ) ( not ( = ?auto_106306 ?auto_106307 ) ) ( not ( = ?auto_106306 ?auto_106308 ) ) ( not ( = ?auto_106307 ?auto_106308 ) ) ( not ( = ?auto_106302 ?auto_106307 ) ) ( not ( = ?auto_106302 ?auto_106306 ) ) ( not ( = ?auto_106303 ?auto_106307 ) ) ( not ( = ?auto_106303 ?auto_106306 ) ) ( not ( = ?auto_106305 ?auto_106307 ) ) ( not ( = ?auto_106305 ?auto_106306 ) ) ( not ( = ?auto_106309 ?auto_106307 ) ) ( not ( = ?auto_106309 ?auto_106306 ) ) ( ON ?auto_106306 ?auto_106304 ) ( not ( = ?auto_106302 ?auto_106304 ) ) ( not ( = ?auto_106303 ?auto_106304 ) ) ( not ( = ?auto_106305 ?auto_106304 ) ) ( not ( = ?auto_106309 ?auto_106304 ) ) ( not ( = ?auto_106308 ?auto_106304 ) ) ( not ( = ?auto_106306 ?auto_106304 ) ) ( not ( = ?auto_106307 ?auto_106304 ) ) ( ON ?auto_106307 ?auto_106306 ) ( ON-TABLE ?auto_106304 ) ( ON ?auto_106308 ?auto_106307 ) ( CLEAR ?auto_106305 ) ( ON ?auto_106309 ?auto_106308 ) ( CLEAR ?auto_106309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106304 ?auto_106306 ?auto_106307 ?auto_106308 )
      ( MAKE-2PILE ?auto_106302 ?auto_106303 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106326 - BLOCK
      ?auto_106327 - BLOCK
    )
    :vars
    (
      ?auto_106330 - BLOCK
      ?auto_106331 - BLOCK
      ?auto_106332 - BLOCK
      ?auto_106329 - BLOCK
      ?auto_106333 - BLOCK
      ?auto_106328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106326 ) ( not ( = ?auto_106326 ?auto_106327 ) ) ( not ( = ?auto_106326 ?auto_106330 ) ) ( not ( = ?auto_106327 ?auto_106330 ) ) ( not ( = ?auto_106326 ?auto_106331 ) ) ( not ( = ?auto_106326 ?auto_106332 ) ) ( not ( = ?auto_106327 ?auto_106331 ) ) ( not ( = ?auto_106327 ?auto_106332 ) ) ( not ( = ?auto_106330 ?auto_106331 ) ) ( not ( = ?auto_106330 ?auto_106332 ) ) ( not ( = ?auto_106331 ?auto_106332 ) ) ( not ( = ?auto_106329 ?auto_106333 ) ) ( not ( = ?auto_106329 ?auto_106332 ) ) ( not ( = ?auto_106333 ?auto_106332 ) ) ( not ( = ?auto_106326 ?auto_106333 ) ) ( not ( = ?auto_106326 ?auto_106329 ) ) ( not ( = ?auto_106327 ?auto_106333 ) ) ( not ( = ?auto_106327 ?auto_106329 ) ) ( not ( = ?auto_106330 ?auto_106333 ) ) ( not ( = ?auto_106330 ?auto_106329 ) ) ( not ( = ?auto_106331 ?auto_106333 ) ) ( not ( = ?auto_106331 ?auto_106329 ) ) ( ON ?auto_106329 ?auto_106328 ) ( not ( = ?auto_106326 ?auto_106328 ) ) ( not ( = ?auto_106327 ?auto_106328 ) ) ( not ( = ?auto_106330 ?auto_106328 ) ) ( not ( = ?auto_106331 ?auto_106328 ) ) ( not ( = ?auto_106332 ?auto_106328 ) ) ( not ( = ?auto_106329 ?auto_106328 ) ) ( not ( = ?auto_106333 ?auto_106328 ) ) ( ON ?auto_106333 ?auto_106329 ) ( ON-TABLE ?auto_106328 ) ( ON ?auto_106332 ?auto_106333 ) ( ON ?auto_106331 ?auto_106332 ) ( ON ?auto_106330 ?auto_106331 ) ( CLEAR ?auto_106330 ) ( HOLDING ?auto_106327 ) ( CLEAR ?auto_106326 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106326 ?auto_106327 ?auto_106330 )
      ( MAKE-2PILE ?auto_106326 ?auto_106327 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106334 - BLOCK
      ?auto_106335 - BLOCK
    )
    :vars
    (
      ?auto_106339 - BLOCK
      ?auto_106340 - BLOCK
      ?auto_106337 - BLOCK
      ?auto_106338 - BLOCK
      ?auto_106341 - BLOCK
      ?auto_106336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106334 ) ( not ( = ?auto_106334 ?auto_106335 ) ) ( not ( = ?auto_106334 ?auto_106339 ) ) ( not ( = ?auto_106335 ?auto_106339 ) ) ( not ( = ?auto_106334 ?auto_106340 ) ) ( not ( = ?auto_106334 ?auto_106337 ) ) ( not ( = ?auto_106335 ?auto_106340 ) ) ( not ( = ?auto_106335 ?auto_106337 ) ) ( not ( = ?auto_106339 ?auto_106340 ) ) ( not ( = ?auto_106339 ?auto_106337 ) ) ( not ( = ?auto_106340 ?auto_106337 ) ) ( not ( = ?auto_106338 ?auto_106341 ) ) ( not ( = ?auto_106338 ?auto_106337 ) ) ( not ( = ?auto_106341 ?auto_106337 ) ) ( not ( = ?auto_106334 ?auto_106341 ) ) ( not ( = ?auto_106334 ?auto_106338 ) ) ( not ( = ?auto_106335 ?auto_106341 ) ) ( not ( = ?auto_106335 ?auto_106338 ) ) ( not ( = ?auto_106339 ?auto_106341 ) ) ( not ( = ?auto_106339 ?auto_106338 ) ) ( not ( = ?auto_106340 ?auto_106341 ) ) ( not ( = ?auto_106340 ?auto_106338 ) ) ( ON ?auto_106338 ?auto_106336 ) ( not ( = ?auto_106334 ?auto_106336 ) ) ( not ( = ?auto_106335 ?auto_106336 ) ) ( not ( = ?auto_106339 ?auto_106336 ) ) ( not ( = ?auto_106340 ?auto_106336 ) ) ( not ( = ?auto_106337 ?auto_106336 ) ) ( not ( = ?auto_106338 ?auto_106336 ) ) ( not ( = ?auto_106341 ?auto_106336 ) ) ( ON ?auto_106341 ?auto_106338 ) ( ON-TABLE ?auto_106336 ) ( ON ?auto_106337 ?auto_106341 ) ( ON ?auto_106340 ?auto_106337 ) ( ON ?auto_106339 ?auto_106340 ) ( CLEAR ?auto_106334 ) ( ON ?auto_106335 ?auto_106339 ) ( CLEAR ?auto_106335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106336 ?auto_106338 ?auto_106341 ?auto_106337 ?auto_106340 ?auto_106339 )
      ( MAKE-2PILE ?auto_106334 ?auto_106335 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106342 - BLOCK
      ?auto_106343 - BLOCK
    )
    :vars
    (
      ?auto_106348 - BLOCK
      ?auto_106346 - BLOCK
      ?auto_106349 - BLOCK
      ?auto_106345 - BLOCK
      ?auto_106347 - BLOCK
      ?auto_106344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106342 ?auto_106343 ) ) ( not ( = ?auto_106342 ?auto_106348 ) ) ( not ( = ?auto_106343 ?auto_106348 ) ) ( not ( = ?auto_106342 ?auto_106346 ) ) ( not ( = ?auto_106342 ?auto_106349 ) ) ( not ( = ?auto_106343 ?auto_106346 ) ) ( not ( = ?auto_106343 ?auto_106349 ) ) ( not ( = ?auto_106348 ?auto_106346 ) ) ( not ( = ?auto_106348 ?auto_106349 ) ) ( not ( = ?auto_106346 ?auto_106349 ) ) ( not ( = ?auto_106345 ?auto_106347 ) ) ( not ( = ?auto_106345 ?auto_106349 ) ) ( not ( = ?auto_106347 ?auto_106349 ) ) ( not ( = ?auto_106342 ?auto_106347 ) ) ( not ( = ?auto_106342 ?auto_106345 ) ) ( not ( = ?auto_106343 ?auto_106347 ) ) ( not ( = ?auto_106343 ?auto_106345 ) ) ( not ( = ?auto_106348 ?auto_106347 ) ) ( not ( = ?auto_106348 ?auto_106345 ) ) ( not ( = ?auto_106346 ?auto_106347 ) ) ( not ( = ?auto_106346 ?auto_106345 ) ) ( ON ?auto_106345 ?auto_106344 ) ( not ( = ?auto_106342 ?auto_106344 ) ) ( not ( = ?auto_106343 ?auto_106344 ) ) ( not ( = ?auto_106348 ?auto_106344 ) ) ( not ( = ?auto_106346 ?auto_106344 ) ) ( not ( = ?auto_106349 ?auto_106344 ) ) ( not ( = ?auto_106345 ?auto_106344 ) ) ( not ( = ?auto_106347 ?auto_106344 ) ) ( ON ?auto_106347 ?auto_106345 ) ( ON-TABLE ?auto_106344 ) ( ON ?auto_106349 ?auto_106347 ) ( ON ?auto_106346 ?auto_106349 ) ( ON ?auto_106348 ?auto_106346 ) ( ON ?auto_106343 ?auto_106348 ) ( CLEAR ?auto_106343 ) ( HOLDING ?auto_106342 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106342 )
      ( MAKE-2PILE ?auto_106342 ?auto_106343 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106350 - BLOCK
      ?auto_106351 - BLOCK
    )
    :vars
    (
      ?auto_106356 - BLOCK
      ?auto_106354 - BLOCK
      ?auto_106357 - BLOCK
      ?auto_106355 - BLOCK
      ?auto_106353 - BLOCK
      ?auto_106352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106350 ?auto_106351 ) ) ( not ( = ?auto_106350 ?auto_106356 ) ) ( not ( = ?auto_106351 ?auto_106356 ) ) ( not ( = ?auto_106350 ?auto_106354 ) ) ( not ( = ?auto_106350 ?auto_106357 ) ) ( not ( = ?auto_106351 ?auto_106354 ) ) ( not ( = ?auto_106351 ?auto_106357 ) ) ( not ( = ?auto_106356 ?auto_106354 ) ) ( not ( = ?auto_106356 ?auto_106357 ) ) ( not ( = ?auto_106354 ?auto_106357 ) ) ( not ( = ?auto_106355 ?auto_106353 ) ) ( not ( = ?auto_106355 ?auto_106357 ) ) ( not ( = ?auto_106353 ?auto_106357 ) ) ( not ( = ?auto_106350 ?auto_106353 ) ) ( not ( = ?auto_106350 ?auto_106355 ) ) ( not ( = ?auto_106351 ?auto_106353 ) ) ( not ( = ?auto_106351 ?auto_106355 ) ) ( not ( = ?auto_106356 ?auto_106353 ) ) ( not ( = ?auto_106356 ?auto_106355 ) ) ( not ( = ?auto_106354 ?auto_106353 ) ) ( not ( = ?auto_106354 ?auto_106355 ) ) ( ON ?auto_106355 ?auto_106352 ) ( not ( = ?auto_106350 ?auto_106352 ) ) ( not ( = ?auto_106351 ?auto_106352 ) ) ( not ( = ?auto_106356 ?auto_106352 ) ) ( not ( = ?auto_106354 ?auto_106352 ) ) ( not ( = ?auto_106357 ?auto_106352 ) ) ( not ( = ?auto_106355 ?auto_106352 ) ) ( not ( = ?auto_106353 ?auto_106352 ) ) ( ON ?auto_106353 ?auto_106355 ) ( ON-TABLE ?auto_106352 ) ( ON ?auto_106357 ?auto_106353 ) ( ON ?auto_106354 ?auto_106357 ) ( ON ?auto_106356 ?auto_106354 ) ( ON ?auto_106351 ?auto_106356 ) ( ON ?auto_106350 ?auto_106351 ) ( CLEAR ?auto_106350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106352 ?auto_106355 ?auto_106353 ?auto_106357 ?auto_106354 ?auto_106356 ?auto_106351 )
      ( MAKE-2PILE ?auto_106350 ?auto_106351 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106363 - BLOCK
      ?auto_106364 - BLOCK
      ?auto_106365 - BLOCK
      ?auto_106366 - BLOCK
      ?auto_106367 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_106367 ) ( CLEAR ?auto_106366 ) ( ON-TABLE ?auto_106363 ) ( ON ?auto_106364 ?auto_106363 ) ( ON ?auto_106365 ?auto_106364 ) ( ON ?auto_106366 ?auto_106365 ) ( not ( = ?auto_106363 ?auto_106364 ) ) ( not ( = ?auto_106363 ?auto_106365 ) ) ( not ( = ?auto_106363 ?auto_106366 ) ) ( not ( = ?auto_106363 ?auto_106367 ) ) ( not ( = ?auto_106364 ?auto_106365 ) ) ( not ( = ?auto_106364 ?auto_106366 ) ) ( not ( = ?auto_106364 ?auto_106367 ) ) ( not ( = ?auto_106365 ?auto_106366 ) ) ( not ( = ?auto_106365 ?auto_106367 ) ) ( not ( = ?auto_106366 ?auto_106367 ) ) )
    :subtasks
    ( ( !STACK ?auto_106367 ?auto_106366 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106368 - BLOCK
      ?auto_106369 - BLOCK
      ?auto_106370 - BLOCK
      ?auto_106371 - BLOCK
      ?auto_106372 - BLOCK
    )
    :vars
    (
      ?auto_106373 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_106371 ) ( ON-TABLE ?auto_106368 ) ( ON ?auto_106369 ?auto_106368 ) ( ON ?auto_106370 ?auto_106369 ) ( ON ?auto_106371 ?auto_106370 ) ( not ( = ?auto_106368 ?auto_106369 ) ) ( not ( = ?auto_106368 ?auto_106370 ) ) ( not ( = ?auto_106368 ?auto_106371 ) ) ( not ( = ?auto_106368 ?auto_106372 ) ) ( not ( = ?auto_106369 ?auto_106370 ) ) ( not ( = ?auto_106369 ?auto_106371 ) ) ( not ( = ?auto_106369 ?auto_106372 ) ) ( not ( = ?auto_106370 ?auto_106371 ) ) ( not ( = ?auto_106370 ?auto_106372 ) ) ( not ( = ?auto_106371 ?auto_106372 ) ) ( ON ?auto_106372 ?auto_106373 ) ( CLEAR ?auto_106372 ) ( HAND-EMPTY ) ( not ( = ?auto_106368 ?auto_106373 ) ) ( not ( = ?auto_106369 ?auto_106373 ) ) ( not ( = ?auto_106370 ?auto_106373 ) ) ( not ( = ?auto_106371 ?auto_106373 ) ) ( not ( = ?auto_106372 ?auto_106373 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106372 ?auto_106373 )
      ( MAKE-5PILE ?auto_106368 ?auto_106369 ?auto_106370 ?auto_106371 ?auto_106372 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106374 - BLOCK
      ?auto_106375 - BLOCK
      ?auto_106376 - BLOCK
      ?auto_106377 - BLOCK
      ?auto_106378 - BLOCK
    )
    :vars
    (
      ?auto_106379 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106374 ) ( ON ?auto_106375 ?auto_106374 ) ( ON ?auto_106376 ?auto_106375 ) ( not ( = ?auto_106374 ?auto_106375 ) ) ( not ( = ?auto_106374 ?auto_106376 ) ) ( not ( = ?auto_106374 ?auto_106377 ) ) ( not ( = ?auto_106374 ?auto_106378 ) ) ( not ( = ?auto_106375 ?auto_106376 ) ) ( not ( = ?auto_106375 ?auto_106377 ) ) ( not ( = ?auto_106375 ?auto_106378 ) ) ( not ( = ?auto_106376 ?auto_106377 ) ) ( not ( = ?auto_106376 ?auto_106378 ) ) ( not ( = ?auto_106377 ?auto_106378 ) ) ( ON ?auto_106378 ?auto_106379 ) ( CLEAR ?auto_106378 ) ( not ( = ?auto_106374 ?auto_106379 ) ) ( not ( = ?auto_106375 ?auto_106379 ) ) ( not ( = ?auto_106376 ?auto_106379 ) ) ( not ( = ?auto_106377 ?auto_106379 ) ) ( not ( = ?auto_106378 ?auto_106379 ) ) ( HOLDING ?auto_106377 ) ( CLEAR ?auto_106376 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106374 ?auto_106375 ?auto_106376 ?auto_106377 )
      ( MAKE-5PILE ?auto_106374 ?auto_106375 ?auto_106376 ?auto_106377 ?auto_106378 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106380 - BLOCK
      ?auto_106381 - BLOCK
      ?auto_106382 - BLOCK
      ?auto_106383 - BLOCK
      ?auto_106384 - BLOCK
    )
    :vars
    (
      ?auto_106385 - BLOCK
      ?auto_106386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106380 ) ( ON ?auto_106381 ?auto_106380 ) ( ON ?auto_106382 ?auto_106381 ) ( not ( = ?auto_106380 ?auto_106381 ) ) ( not ( = ?auto_106380 ?auto_106382 ) ) ( not ( = ?auto_106380 ?auto_106383 ) ) ( not ( = ?auto_106380 ?auto_106384 ) ) ( not ( = ?auto_106381 ?auto_106382 ) ) ( not ( = ?auto_106381 ?auto_106383 ) ) ( not ( = ?auto_106381 ?auto_106384 ) ) ( not ( = ?auto_106382 ?auto_106383 ) ) ( not ( = ?auto_106382 ?auto_106384 ) ) ( not ( = ?auto_106383 ?auto_106384 ) ) ( ON ?auto_106384 ?auto_106385 ) ( not ( = ?auto_106380 ?auto_106385 ) ) ( not ( = ?auto_106381 ?auto_106385 ) ) ( not ( = ?auto_106382 ?auto_106385 ) ) ( not ( = ?auto_106383 ?auto_106385 ) ) ( not ( = ?auto_106384 ?auto_106385 ) ) ( CLEAR ?auto_106382 ) ( ON ?auto_106383 ?auto_106384 ) ( CLEAR ?auto_106383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106386 ) ( ON ?auto_106385 ?auto_106386 ) ( not ( = ?auto_106386 ?auto_106385 ) ) ( not ( = ?auto_106386 ?auto_106384 ) ) ( not ( = ?auto_106386 ?auto_106383 ) ) ( not ( = ?auto_106380 ?auto_106386 ) ) ( not ( = ?auto_106381 ?auto_106386 ) ) ( not ( = ?auto_106382 ?auto_106386 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106386 ?auto_106385 ?auto_106384 )
      ( MAKE-5PILE ?auto_106380 ?auto_106381 ?auto_106382 ?auto_106383 ?auto_106384 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106387 - BLOCK
      ?auto_106388 - BLOCK
      ?auto_106389 - BLOCK
      ?auto_106390 - BLOCK
      ?auto_106391 - BLOCK
    )
    :vars
    (
      ?auto_106392 - BLOCK
      ?auto_106393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106387 ) ( ON ?auto_106388 ?auto_106387 ) ( not ( = ?auto_106387 ?auto_106388 ) ) ( not ( = ?auto_106387 ?auto_106389 ) ) ( not ( = ?auto_106387 ?auto_106390 ) ) ( not ( = ?auto_106387 ?auto_106391 ) ) ( not ( = ?auto_106388 ?auto_106389 ) ) ( not ( = ?auto_106388 ?auto_106390 ) ) ( not ( = ?auto_106388 ?auto_106391 ) ) ( not ( = ?auto_106389 ?auto_106390 ) ) ( not ( = ?auto_106389 ?auto_106391 ) ) ( not ( = ?auto_106390 ?auto_106391 ) ) ( ON ?auto_106391 ?auto_106392 ) ( not ( = ?auto_106387 ?auto_106392 ) ) ( not ( = ?auto_106388 ?auto_106392 ) ) ( not ( = ?auto_106389 ?auto_106392 ) ) ( not ( = ?auto_106390 ?auto_106392 ) ) ( not ( = ?auto_106391 ?auto_106392 ) ) ( ON ?auto_106390 ?auto_106391 ) ( CLEAR ?auto_106390 ) ( ON-TABLE ?auto_106393 ) ( ON ?auto_106392 ?auto_106393 ) ( not ( = ?auto_106393 ?auto_106392 ) ) ( not ( = ?auto_106393 ?auto_106391 ) ) ( not ( = ?auto_106393 ?auto_106390 ) ) ( not ( = ?auto_106387 ?auto_106393 ) ) ( not ( = ?auto_106388 ?auto_106393 ) ) ( not ( = ?auto_106389 ?auto_106393 ) ) ( HOLDING ?auto_106389 ) ( CLEAR ?auto_106388 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106387 ?auto_106388 ?auto_106389 )
      ( MAKE-5PILE ?auto_106387 ?auto_106388 ?auto_106389 ?auto_106390 ?auto_106391 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106394 - BLOCK
      ?auto_106395 - BLOCK
      ?auto_106396 - BLOCK
      ?auto_106397 - BLOCK
      ?auto_106398 - BLOCK
    )
    :vars
    (
      ?auto_106400 - BLOCK
      ?auto_106399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106394 ) ( ON ?auto_106395 ?auto_106394 ) ( not ( = ?auto_106394 ?auto_106395 ) ) ( not ( = ?auto_106394 ?auto_106396 ) ) ( not ( = ?auto_106394 ?auto_106397 ) ) ( not ( = ?auto_106394 ?auto_106398 ) ) ( not ( = ?auto_106395 ?auto_106396 ) ) ( not ( = ?auto_106395 ?auto_106397 ) ) ( not ( = ?auto_106395 ?auto_106398 ) ) ( not ( = ?auto_106396 ?auto_106397 ) ) ( not ( = ?auto_106396 ?auto_106398 ) ) ( not ( = ?auto_106397 ?auto_106398 ) ) ( ON ?auto_106398 ?auto_106400 ) ( not ( = ?auto_106394 ?auto_106400 ) ) ( not ( = ?auto_106395 ?auto_106400 ) ) ( not ( = ?auto_106396 ?auto_106400 ) ) ( not ( = ?auto_106397 ?auto_106400 ) ) ( not ( = ?auto_106398 ?auto_106400 ) ) ( ON ?auto_106397 ?auto_106398 ) ( ON-TABLE ?auto_106399 ) ( ON ?auto_106400 ?auto_106399 ) ( not ( = ?auto_106399 ?auto_106400 ) ) ( not ( = ?auto_106399 ?auto_106398 ) ) ( not ( = ?auto_106399 ?auto_106397 ) ) ( not ( = ?auto_106394 ?auto_106399 ) ) ( not ( = ?auto_106395 ?auto_106399 ) ) ( not ( = ?auto_106396 ?auto_106399 ) ) ( CLEAR ?auto_106395 ) ( ON ?auto_106396 ?auto_106397 ) ( CLEAR ?auto_106396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106399 ?auto_106400 ?auto_106398 ?auto_106397 )
      ( MAKE-5PILE ?auto_106394 ?auto_106395 ?auto_106396 ?auto_106397 ?auto_106398 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106401 - BLOCK
      ?auto_106402 - BLOCK
      ?auto_106403 - BLOCK
      ?auto_106404 - BLOCK
      ?auto_106405 - BLOCK
    )
    :vars
    (
      ?auto_106407 - BLOCK
      ?auto_106406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106401 ) ( not ( = ?auto_106401 ?auto_106402 ) ) ( not ( = ?auto_106401 ?auto_106403 ) ) ( not ( = ?auto_106401 ?auto_106404 ) ) ( not ( = ?auto_106401 ?auto_106405 ) ) ( not ( = ?auto_106402 ?auto_106403 ) ) ( not ( = ?auto_106402 ?auto_106404 ) ) ( not ( = ?auto_106402 ?auto_106405 ) ) ( not ( = ?auto_106403 ?auto_106404 ) ) ( not ( = ?auto_106403 ?auto_106405 ) ) ( not ( = ?auto_106404 ?auto_106405 ) ) ( ON ?auto_106405 ?auto_106407 ) ( not ( = ?auto_106401 ?auto_106407 ) ) ( not ( = ?auto_106402 ?auto_106407 ) ) ( not ( = ?auto_106403 ?auto_106407 ) ) ( not ( = ?auto_106404 ?auto_106407 ) ) ( not ( = ?auto_106405 ?auto_106407 ) ) ( ON ?auto_106404 ?auto_106405 ) ( ON-TABLE ?auto_106406 ) ( ON ?auto_106407 ?auto_106406 ) ( not ( = ?auto_106406 ?auto_106407 ) ) ( not ( = ?auto_106406 ?auto_106405 ) ) ( not ( = ?auto_106406 ?auto_106404 ) ) ( not ( = ?auto_106401 ?auto_106406 ) ) ( not ( = ?auto_106402 ?auto_106406 ) ) ( not ( = ?auto_106403 ?auto_106406 ) ) ( ON ?auto_106403 ?auto_106404 ) ( CLEAR ?auto_106403 ) ( HOLDING ?auto_106402 ) ( CLEAR ?auto_106401 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106401 ?auto_106402 )
      ( MAKE-5PILE ?auto_106401 ?auto_106402 ?auto_106403 ?auto_106404 ?auto_106405 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106408 - BLOCK
      ?auto_106409 - BLOCK
      ?auto_106410 - BLOCK
      ?auto_106411 - BLOCK
      ?auto_106412 - BLOCK
    )
    :vars
    (
      ?auto_106414 - BLOCK
      ?auto_106413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106408 ) ( not ( = ?auto_106408 ?auto_106409 ) ) ( not ( = ?auto_106408 ?auto_106410 ) ) ( not ( = ?auto_106408 ?auto_106411 ) ) ( not ( = ?auto_106408 ?auto_106412 ) ) ( not ( = ?auto_106409 ?auto_106410 ) ) ( not ( = ?auto_106409 ?auto_106411 ) ) ( not ( = ?auto_106409 ?auto_106412 ) ) ( not ( = ?auto_106410 ?auto_106411 ) ) ( not ( = ?auto_106410 ?auto_106412 ) ) ( not ( = ?auto_106411 ?auto_106412 ) ) ( ON ?auto_106412 ?auto_106414 ) ( not ( = ?auto_106408 ?auto_106414 ) ) ( not ( = ?auto_106409 ?auto_106414 ) ) ( not ( = ?auto_106410 ?auto_106414 ) ) ( not ( = ?auto_106411 ?auto_106414 ) ) ( not ( = ?auto_106412 ?auto_106414 ) ) ( ON ?auto_106411 ?auto_106412 ) ( ON-TABLE ?auto_106413 ) ( ON ?auto_106414 ?auto_106413 ) ( not ( = ?auto_106413 ?auto_106414 ) ) ( not ( = ?auto_106413 ?auto_106412 ) ) ( not ( = ?auto_106413 ?auto_106411 ) ) ( not ( = ?auto_106408 ?auto_106413 ) ) ( not ( = ?auto_106409 ?auto_106413 ) ) ( not ( = ?auto_106410 ?auto_106413 ) ) ( ON ?auto_106410 ?auto_106411 ) ( CLEAR ?auto_106408 ) ( ON ?auto_106409 ?auto_106410 ) ( CLEAR ?auto_106409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106413 ?auto_106414 ?auto_106412 ?auto_106411 ?auto_106410 )
      ( MAKE-5PILE ?auto_106408 ?auto_106409 ?auto_106410 ?auto_106411 ?auto_106412 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106415 - BLOCK
      ?auto_106416 - BLOCK
      ?auto_106417 - BLOCK
      ?auto_106418 - BLOCK
      ?auto_106419 - BLOCK
    )
    :vars
    (
      ?auto_106421 - BLOCK
      ?auto_106420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106415 ?auto_106416 ) ) ( not ( = ?auto_106415 ?auto_106417 ) ) ( not ( = ?auto_106415 ?auto_106418 ) ) ( not ( = ?auto_106415 ?auto_106419 ) ) ( not ( = ?auto_106416 ?auto_106417 ) ) ( not ( = ?auto_106416 ?auto_106418 ) ) ( not ( = ?auto_106416 ?auto_106419 ) ) ( not ( = ?auto_106417 ?auto_106418 ) ) ( not ( = ?auto_106417 ?auto_106419 ) ) ( not ( = ?auto_106418 ?auto_106419 ) ) ( ON ?auto_106419 ?auto_106421 ) ( not ( = ?auto_106415 ?auto_106421 ) ) ( not ( = ?auto_106416 ?auto_106421 ) ) ( not ( = ?auto_106417 ?auto_106421 ) ) ( not ( = ?auto_106418 ?auto_106421 ) ) ( not ( = ?auto_106419 ?auto_106421 ) ) ( ON ?auto_106418 ?auto_106419 ) ( ON-TABLE ?auto_106420 ) ( ON ?auto_106421 ?auto_106420 ) ( not ( = ?auto_106420 ?auto_106421 ) ) ( not ( = ?auto_106420 ?auto_106419 ) ) ( not ( = ?auto_106420 ?auto_106418 ) ) ( not ( = ?auto_106415 ?auto_106420 ) ) ( not ( = ?auto_106416 ?auto_106420 ) ) ( not ( = ?auto_106417 ?auto_106420 ) ) ( ON ?auto_106417 ?auto_106418 ) ( ON ?auto_106416 ?auto_106417 ) ( CLEAR ?auto_106416 ) ( HOLDING ?auto_106415 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106415 )
      ( MAKE-5PILE ?auto_106415 ?auto_106416 ?auto_106417 ?auto_106418 ?auto_106419 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106422 - BLOCK
      ?auto_106423 - BLOCK
      ?auto_106424 - BLOCK
      ?auto_106425 - BLOCK
      ?auto_106426 - BLOCK
    )
    :vars
    (
      ?auto_106427 - BLOCK
      ?auto_106428 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106422 ?auto_106423 ) ) ( not ( = ?auto_106422 ?auto_106424 ) ) ( not ( = ?auto_106422 ?auto_106425 ) ) ( not ( = ?auto_106422 ?auto_106426 ) ) ( not ( = ?auto_106423 ?auto_106424 ) ) ( not ( = ?auto_106423 ?auto_106425 ) ) ( not ( = ?auto_106423 ?auto_106426 ) ) ( not ( = ?auto_106424 ?auto_106425 ) ) ( not ( = ?auto_106424 ?auto_106426 ) ) ( not ( = ?auto_106425 ?auto_106426 ) ) ( ON ?auto_106426 ?auto_106427 ) ( not ( = ?auto_106422 ?auto_106427 ) ) ( not ( = ?auto_106423 ?auto_106427 ) ) ( not ( = ?auto_106424 ?auto_106427 ) ) ( not ( = ?auto_106425 ?auto_106427 ) ) ( not ( = ?auto_106426 ?auto_106427 ) ) ( ON ?auto_106425 ?auto_106426 ) ( ON-TABLE ?auto_106428 ) ( ON ?auto_106427 ?auto_106428 ) ( not ( = ?auto_106428 ?auto_106427 ) ) ( not ( = ?auto_106428 ?auto_106426 ) ) ( not ( = ?auto_106428 ?auto_106425 ) ) ( not ( = ?auto_106422 ?auto_106428 ) ) ( not ( = ?auto_106423 ?auto_106428 ) ) ( not ( = ?auto_106424 ?auto_106428 ) ) ( ON ?auto_106424 ?auto_106425 ) ( ON ?auto_106423 ?auto_106424 ) ( ON ?auto_106422 ?auto_106423 ) ( CLEAR ?auto_106422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106428 ?auto_106427 ?auto_106426 ?auto_106425 ?auto_106424 ?auto_106423 )
      ( MAKE-5PILE ?auto_106422 ?auto_106423 ?auto_106424 ?auto_106425 ?auto_106426 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106429 - BLOCK
      ?auto_106430 - BLOCK
      ?auto_106431 - BLOCK
      ?auto_106432 - BLOCK
      ?auto_106433 - BLOCK
    )
    :vars
    (
      ?auto_106434 - BLOCK
      ?auto_106435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106429 ?auto_106430 ) ) ( not ( = ?auto_106429 ?auto_106431 ) ) ( not ( = ?auto_106429 ?auto_106432 ) ) ( not ( = ?auto_106429 ?auto_106433 ) ) ( not ( = ?auto_106430 ?auto_106431 ) ) ( not ( = ?auto_106430 ?auto_106432 ) ) ( not ( = ?auto_106430 ?auto_106433 ) ) ( not ( = ?auto_106431 ?auto_106432 ) ) ( not ( = ?auto_106431 ?auto_106433 ) ) ( not ( = ?auto_106432 ?auto_106433 ) ) ( ON ?auto_106433 ?auto_106434 ) ( not ( = ?auto_106429 ?auto_106434 ) ) ( not ( = ?auto_106430 ?auto_106434 ) ) ( not ( = ?auto_106431 ?auto_106434 ) ) ( not ( = ?auto_106432 ?auto_106434 ) ) ( not ( = ?auto_106433 ?auto_106434 ) ) ( ON ?auto_106432 ?auto_106433 ) ( ON-TABLE ?auto_106435 ) ( ON ?auto_106434 ?auto_106435 ) ( not ( = ?auto_106435 ?auto_106434 ) ) ( not ( = ?auto_106435 ?auto_106433 ) ) ( not ( = ?auto_106435 ?auto_106432 ) ) ( not ( = ?auto_106429 ?auto_106435 ) ) ( not ( = ?auto_106430 ?auto_106435 ) ) ( not ( = ?auto_106431 ?auto_106435 ) ) ( ON ?auto_106431 ?auto_106432 ) ( ON ?auto_106430 ?auto_106431 ) ( HOLDING ?auto_106429 ) ( CLEAR ?auto_106430 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106435 ?auto_106434 ?auto_106433 ?auto_106432 ?auto_106431 ?auto_106430 ?auto_106429 )
      ( MAKE-5PILE ?auto_106429 ?auto_106430 ?auto_106431 ?auto_106432 ?auto_106433 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106436 - BLOCK
      ?auto_106437 - BLOCK
      ?auto_106438 - BLOCK
      ?auto_106439 - BLOCK
      ?auto_106440 - BLOCK
    )
    :vars
    (
      ?auto_106441 - BLOCK
      ?auto_106442 - BLOCK
      ?auto_106443 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106436 ?auto_106437 ) ) ( not ( = ?auto_106436 ?auto_106438 ) ) ( not ( = ?auto_106436 ?auto_106439 ) ) ( not ( = ?auto_106436 ?auto_106440 ) ) ( not ( = ?auto_106437 ?auto_106438 ) ) ( not ( = ?auto_106437 ?auto_106439 ) ) ( not ( = ?auto_106437 ?auto_106440 ) ) ( not ( = ?auto_106438 ?auto_106439 ) ) ( not ( = ?auto_106438 ?auto_106440 ) ) ( not ( = ?auto_106439 ?auto_106440 ) ) ( ON ?auto_106440 ?auto_106441 ) ( not ( = ?auto_106436 ?auto_106441 ) ) ( not ( = ?auto_106437 ?auto_106441 ) ) ( not ( = ?auto_106438 ?auto_106441 ) ) ( not ( = ?auto_106439 ?auto_106441 ) ) ( not ( = ?auto_106440 ?auto_106441 ) ) ( ON ?auto_106439 ?auto_106440 ) ( ON-TABLE ?auto_106442 ) ( ON ?auto_106441 ?auto_106442 ) ( not ( = ?auto_106442 ?auto_106441 ) ) ( not ( = ?auto_106442 ?auto_106440 ) ) ( not ( = ?auto_106442 ?auto_106439 ) ) ( not ( = ?auto_106436 ?auto_106442 ) ) ( not ( = ?auto_106437 ?auto_106442 ) ) ( not ( = ?auto_106438 ?auto_106442 ) ) ( ON ?auto_106438 ?auto_106439 ) ( ON ?auto_106437 ?auto_106438 ) ( CLEAR ?auto_106437 ) ( ON ?auto_106436 ?auto_106443 ) ( CLEAR ?auto_106436 ) ( HAND-EMPTY ) ( not ( = ?auto_106436 ?auto_106443 ) ) ( not ( = ?auto_106437 ?auto_106443 ) ) ( not ( = ?auto_106438 ?auto_106443 ) ) ( not ( = ?auto_106439 ?auto_106443 ) ) ( not ( = ?auto_106440 ?auto_106443 ) ) ( not ( = ?auto_106441 ?auto_106443 ) ) ( not ( = ?auto_106442 ?auto_106443 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106436 ?auto_106443 )
      ( MAKE-5PILE ?auto_106436 ?auto_106437 ?auto_106438 ?auto_106439 ?auto_106440 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106444 - BLOCK
      ?auto_106445 - BLOCK
      ?auto_106446 - BLOCK
      ?auto_106447 - BLOCK
      ?auto_106448 - BLOCK
    )
    :vars
    (
      ?auto_106451 - BLOCK
      ?auto_106450 - BLOCK
      ?auto_106449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106444 ?auto_106445 ) ) ( not ( = ?auto_106444 ?auto_106446 ) ) ( not ( = ?auto_106444 ?auto_106447 ) ) ( not ( = ?auto_106444 ?auto_106448 ) ) ( not ( = ?auto_106445 ?auto_106446 ) ) ( not ( = ?auto_106445 ?auto_106447 ) ) ( not ( = ?auto_106445 ?auto_106448 ) ) ( not ( = ?auto_106446 ?auto_106447 ) ) ( not ( = ?auto_106446 ?auto_106448 ) ) ( not ( = ?auto_106447 ?auto_106448 ) ) ( ON ?auto_106448 ?auto_106451 ) ( not ( = ?auto_106444 ?auto_106451 ) ) ( not ( = ?auto_106445 ?auto_106451 ) ) ( not ( = ?auto_106446 ?auto_106451 ) ) ( not ( = ?auto_106447 ?auto_106451 ) ) ( not ( = ?auto_106448 ?auto_106451 ) ) ( ON ?auto_106447 ?auto_106448 ) ( ON-TABLE ?auto_106450 ) ( ON ?auto_106451 ?auto_106450 ) ( not ( = ?auto_106450 ?auto_106451 ) ) ( not ( = ?auto_106450 ?auto_106448 ) ) ( not ( = ?auto_106450 ?auto_106447 ) ) ( not ( = ?auto_106444 ?auto_106450 ) ) ( not ( = ?auto_106445 ?auto_106450 ) ) ( not ( = ?auto_106446 ?auto_106450 ) ) ( ON ?auto_106446 ?auto_106447 ) ( ON ?auto_106444 ?auto_106449 ) ( CLEAR ?auto_106444 ) ( not ( = ?auto_106444 ?auto_106449 ) ) ( not ( = ?auto_106445 ?auto_106449 ) ) ( not ( = ?auto_106446 ?auto_106449 ) ) ( not ( = ?auto_106447 ?auto_106449 ) ) ( not ( = ?auto_106448 ?auto_106449 ) ) ( not ( = ?auto_106451 ?auto_106449 ) ) ( not ( = ?auto_106450 ?auto_106449 ) ) ( HOLDING ?auto_106445 ) ( CLEAR ?auto_106446 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106450 ?auto_106451 ?auto_106448 ?auto_106447 ?auto_106446 ?auto_106445 )
      ( MAKE-5PILE ?auto_106444 ?auto_106445 ?auto_106446 ?auto_106447 ?auto_106448 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106452 - BLOCK
      ?auto_106453 - BLOCK
      ?auto_106454 - BLOCK
      ?auto_106455 - BLOCK
      ?auto_106456 - BLOCK
    )
    :vars
    (
      ?auto_106457 - BLOCK
      ?auto_106459 - BLOCK
      ?auto_106458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106452 ?auto_106453 ) ) ( not ( = ?auto_106452 ?auto_106454 ) ) ( not ( = ?auto_106452 ?auto_106455 ) ) ( not ( = ?auto_106452 ?auto_106456 ) ) ( not ( = ?auto_106453 ?auto_106454 ) ) ( not ( = ?auto_106453 ?auto_106455 ) ) ( not ( = ?auto_106453 ?auto_106456 ) ) ( not ( = ?auto_106454 ?auto_106455 ) ) ( not ( = ?auto_106454 ?auto_106456 ) ) ( not ( = ?auto_106455 ?auto_106456 ) ) ( ON ?auto_106456 ?auto_106457 ) ( not ( = ?auto_106452 ?auto_106457 ) ) ( not ( = ?auto_106453 ?auto_106457 ) ) ( not ( = ?auto_106454 ?auto_106457 ) ) ( not ( = ?auto_106455 ?auto_106457 ) ) ( not ( = ?auto_106456 ?auto_106457 ) ) ( ON ?auto_106455 ?auto_106456 ) ( ON-TABLE ?auto_106459 ) ( ON ?auto_106457 ?auto_106459 ) ( not ( = ?auto_106459 ?auto_106457 ) ) ( not ( = ?auto_106459 ?auto_106456 ) ) ( not ( = ?auto_106459 ?auto_106455 ) ) ( not ( = ?auto_106452 ?auto_106459 ) ) ( not ( = ?auto_106453 ?auto_106459 ) ) ( not ( = ?auto_106454 ?auto_106459 ) ) ( ON ?auto_106454 ?auto_106455 ) ( ON ?auto_106452 ?auto_106458 ) ( not ( = ?auto_106452 ?auto_106458 ) ) ( not ( = ?auto_106453 ?auto_106458 ) ) ( not ( = ?auto_106454 ?auto_106458 ) ) ( not ( = ?auto_106455 ?auto_106458 ) ) ( not ( = ?auto_106456 ?auto_106458 ) ) ( not ( = ?auto_106457 ?auto_106458 ) ) ( not ( = ?auto_106459 ?auto_106458 ) ) ( CLEAR ?auto_106454 ) ( ON ?auto_106453 ?auto_106452 ) ( CLEAR ?auto_106453 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106458 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106458 ?auto_106452 )
      ( MAKE-5PILE ?auto_106452 ?auto_106453 ?auto_106454 ?auto_106455 ?auto_106456 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106460 - BLOCK
      ?auto_106461 - BLOCK
      ?auto_106462 - BLOCK
      ?auto_106463 - BLOCK
      ?auto_106464 - BLOCK
    )
    :vars
    (
      ?auto_106466 - BLOCK
      ?auto_106465 - BLOCK
      ?auto_106467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106460 ?auto_106461 ) ) ( not ( = ?auto_106460 ?auto_106462 ) ) ( not ( = ?auto_106460 ?auto_106463 ) ) ( not ( = ?auto_106460 ?auto_106464 ) ) ( not ( = ?auto_106461 ?auto_106462 ) ) ( not ( = ?auto_106461 ?auto_106463 ) ) ( not ( = ?auto_106461 ?auto_106464 ) ) ( not ( = ?auto_106462 ?auto_106463 ) ) ( not ( = ?auto_106462 ?auto_106464 ) ) ( not ( = ?auto_106463 ?auto_106464 ) ) ( ON ?auto_106464 ?auto_106466 ) ( not ( = ?auto_106460 ?auto_106466 ) ) ( not ( = ?auto_106461 ?auto_106466 ) ) ( not ( = ?auto_106462 ?auto_106466 ) ) ( not ( = ?auto_106463 ?auto_106466 ) ) ( not ( = ?auto_106464 ?auto_106466 ) ) ( ON ?auto_106463 ?auto_106464 ) ( ON-TABLE ?auto_106465 ) ( ON ?auto_106466 ?auto_106465 ) ( not ( = ?auto_106465 ?auto_106466 ) ) ( not ( = ?auto_106465 ?auto_106464 ) ) ( not ( = ?auto_106465 ?auto_106463 ) ) ( not ( = ?auto_106460 ?auto_106465 ) ) ( not ( = ?auto_106461 ?auto_106465 ) ) ( not ( = ?auto_106462 ?auto_106465 ) ) ( ON ?auto_106460 ?auto_106467 ) ( not ( = ?auto_106460 ?auto_106467 ) ) ( not ( = ?auto_106461 ?auto_106467 ) ) ( not ( = ?auto_106462 ?auto_106467 ) ) ( not ( = ?auto_106463 ?auto_106467 ) ) ( not ( = ?auto_106464 ?auto_106467 ) ) ( not ( = ?auto_106466 ?auto_106467 ) ) ( not ( = ?auto_106465 ?auto_106467 ) ) ( ON ?auto_106461 ?auto_106460 ) ( CLEAR ?auto_106461 ) ( ON-TABLE ?auto_106467 ) ( HOLDING ?auto_106462 ) ( CLEAR ?auto_106463 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106465 ?auto_106466 ?auto_106464 ?auto_106463 ?auto_106462 )
      ( MAKE-5PILE ?auto_106460 ?auto_106461 ?auto_106462 ?auto_106463 ?auto_106464 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106468 - BLOCK
      ?auto_106469 - BLOCK
      ?auto_106470 - BLOCK
      ?auto_106471 - BLOCK
      ?auto_106472 - BLOCK
    )
    :vars
    (
      ?auto_106473 - BLOCK
      ?auto_106475 - BLOCK
      ?auto_106474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106468 ?auto_106469 ) ) ( not ( = ?auto_106468 ?auto_106470 ) ) ( not ( = ?auto_106468 ?auto_106471 ) ) ( not ( = ?auto_106468 ?auto_106472 ) ) ( not ( = ?auto_106469 ?auto_106470 ) ) ( not ( = ?auto_106469 ?auto_106471 ) ) ( not ( = ?auto_106469 ?auto_106472 ) ) ( not ( = ?auto_106470 ?auto_106471 ) ) ( not ( = ?auto_106470 ?auto_106472 ) ) ( not ( = ?auto_106471 ?auto_106472 ) ) ( ON ?auto_106472 ?auto_106473 ) ( not ( = ?auto_106468 ?auto_106473 ) ) ( not ( = ?auto_106469 ?auto_106473 ) ) ( not ( = ?auto_106470 ?auto_106473 ) ) ( not ( = ?auto_106471 ?auto_106473 ) ) ( not ( = ?auto_106472 ?auto_106473 ) ) ( ON ?auto_106471 ?auto_106472 ) ( ON-TABLE ?auto_106475 ) ( ON ?auto_106473 ?auto_106475 ) ( not ( = ?auto_106475 ?auto_106473 ) ) ( not ( = ?auto_106475 ?auto_106472 ) ) ( not ( = ?auto_106475 ?auto_106471 ) ) ( not ( = ?auto_106468 ?auto_106475 ) ) ( not ( = ?auto_106469 ?auto_106475 ) ) ( not ( = ?auto_106470 ?auto_106475 ) ) ( ON ?auto_106468 ?auto_106474 ) ( not ( = ?auto_106468 ?auto_106474 ) ) ( not ( = ?auto_106469 ?auto_106474 ) ) ( not ( = ?auto_106470 ?auto_106474 ) ) ( not ( = ?auto_106471 ?auto_106474 ) ) ( not ( = ?auto_106472 ?auto_106474 ) ) ( not ( = ?auto_106473 ?auto_106474 ) ) ( not ( = ?auto_106475 ?auto_106474 ) ) ( ON ?auto_106469 ?auto_106468 ) ( ON-TABLE ?auto_106474 ) ( CLEAR ?auto_106471 ) ( ON ?auto_106470 ?auto_106469 ) ( CLEAR ?auto_106470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106474 ?auto_106468 ?auto_106469 )
      ( MAKE-5PILE ?auto_106468 ?auto_106469 ?auto_106470 ?auto_106471 ?auto_106472 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106476 - BLOCK
      ?auto_106477 - BLOCK
      ?auto_106478 - BLOCK
      ?auto_106479 - BLOCK
      ?auto_106480 - BLOCK
    )
    :vars
    (
      ?auto_106483 - BLOCK
      ?auto_106481 - BLOCK
      ?auto_106482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106476 ?auto_106477 ) ) ( not ( = ?auto_106476 ?auto_106478 ) ) ( not ( = ?auto_106476 ?auto_106479 ) ) ( not ( = ?auto_106476 ?auto_106480 ) ) ( not ( = ?auto_106477 ?auto_106478 ) ) ( not ( = ?auto_106477 ?auto_106479 ) ) ( not ( = ?auto_106477 ?auto_106480 ) ) ( not ( = ?auto_106478 ?auto_106479 ) ) ( not ( = ?auto_106478 ?auto_106480 ) ) ( not ( = ?auto_106479 ?auto_106480 ) ) ( ON ?auto_106480 ?auto_106483 ) ( not ( = ?auto_106476 ?auto_106483 ) ) ( not ( = ?auto_106477 ?auto_106483 ) ) ( not ( = ?auto_106478 ?auto_106483 ) ) ( not ( = ?auto_106479 ?auto_106483 ) ) ( not ( = ?auto_106480 ?auto_106483 ) ) ( ON-TABLE ?auto_106481 ) ( ON ?auto_106483 ?auto_106481 ) ( not ( = ?auto_106481 ?auto_106483 ) ) ( not ( = ?auto_106481 ?auto_106480 ) ) ( not ( = ?auto_106481 ?auto_106479 ) ) ( not ( = ?auto_106476 ?auto_106481 ) ) ( not ( = ?auto_106477 ?auto_106481 ) ) ( not ( = ?auto_106478 ?auto_106481 ) ) ( ON ?auto_106476 ?auto_106482 ) ( not ( = ?auto_106476 ?auto_106482 ) ) ( not ( = ?auto_106477 ?auto_106482 ) ) ( not ( = ?auto_106478 ?auto_106482 ) ) ( not ( = ?auto_106479 ?auto_106482 ) ) ( not ( = ?auto_106480 ?auto_106482 ) ) ( not ( = ?auto_106483 ?auto_106482 ) ) ( not ( = ?auto_106481 ?auto_106482 ) ) ( ON ?auto_106477 ?auto_106476 ) ( ON-TABLE ?auto_106482 ) ( ON ?auto_106478 ?auto_106477 ) ( CLEAR ?auto_106478 ) ( HOLDING ?auto_106479 ) ( CLEAR ?auto_106480 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106481 ?auto_106483 ?auto_106480 ?auto_106479 )
      ( MAKE-5PILE ?auto_106476 ?auto_106477 ?auto_106478 ?auto_106479 ?auto_106480 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106484 - BLOCK
      ?auto_106485 - BLOCK
      ?auto_106486 - BLOCK
      ?auto_106487 - BLOCK
      ?auto_106488 - BLOCK
    )
    :vars
    (
      ?auto_106491 - BLOCK
      ?auto_106490 - BLOCK
      ?auto_106489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106484 ?auto_106485 ) ) ( not ( = ?auto_106484 ?auto_106486 ) ) ( not ( = ?auto_106484 ?auto_106487 ) ) ( not ( = ?auto_106484 ?auto_106488 ) ) ( not ( = ?auto_106485 ?auto_106486 ) ) ( not ( = ?auto_106485 ?auto_106487 ) ) ( not ( = ?auto_106485 ?auto_106488 ) ) ( not ( = ?auto_106486 ?auto_106487 ) ) ( not ( = ?auto_106486 ?auto_106488 ) ) ( not ( = ?auto_106487 ?auto_106488 ) ) ( ON ?auto_106488 ?auto_106491 ) ( not ( = ?auto_106484 ?auto_106491 ) ) ( not ( = ?auto_106485 ?auto_106491 ) ) ( not ( = ?auto_106486 ?auto_106491 ) ) ( not ( = ?auto_106487 ?auto_106491 ) ) ( not ( = ?auto_106488 ?auto_106491 ) ) ( ON-TABLE ?auto_106490 ) ( ON ?auto_106491 ?auto_106490 ) ( not ( = ?auto_106490 ?auto_106491 ) ) ( not ( = ?auto_106490 ?auto_106488 ) ) ( not ( = ?auto_106490 ?auto_106487 ) ) ( not ( = ?auto_106484 ?auto_106490 ) ) ( not ( = ?auto_106485 ?auto_106490 ) ) ( not ( = ?auto_106486 ?auto_106490 ) ) ( ON ?auto_106484 ?auto_106489 ) ( not ( = ?auto_106484 ?auto_106489 ) ) ( not ( = ?auto_106485 ?auto_106489 ) ) ( not ( = ?auto_106486 ?auto_106489 ) ) ( not ( = ?auto_106487 ?auto_106489 ) ) ( not ( = ?auto_106488 ?auto_106489 ) ) ( not ( = ?auto_106491 ?auto_106489 ) ) ( not ( = ?auto_106490 ?auto_106489 ) ) ( ON ?auto_106485 ?auto_106484 ) ( ON-TABLE ?auto_106489 ) ( ON ?auto_106486 ?auto_106485 ) ( CLEAR ?auto_106488 ) ( ON ?auto_106487 ?auto_106486 ) ( CLEAR ?auto_106487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106489 ?auto_106484 ?auto_106485 ?auto_106486 )
      ( MAKE-5PILE ?auto_106484 ?auto_106485 ?auto_106486 ?auto_106487 ?auto_106488 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106492 - BLOCK
      ?auto_106493 - BLOCK
      ?auto_106494 - BLOCK
      ?auto_106495 - BLOCK
      ?auto_106496 - BLOCK
    )
    :vars
    (
      ?auto_106497 - BLOCK
      ?auto_106498 - BLOCK
      ?auto_106499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106492 ?auto_106493 ) ) ( not ( = ?auto_106492 ?auto_106494 ) ) ( not ( = ?auto_106492 ?auto_106495 ) ) ( not ( = ?auto_106492 ?auto_106496 ) ) ( not ( = ?auto_106493 ?auto_106494 ) ) ( not ( = ?auto_106493 ?auto_106495 ) ) ( not ( = ?auto_106493 ?auto_106496 ) ) ( not ( = ?auto_106494 ?auto_106495 ) ) ( not ( = ?auto_106494 ?auto_106496 ) ) ( not ( = ?auto_106495 ?auto_106496 ) ) ( not ( = ?auto_106492 ?auto_106497 ) ) ( not ( = ?auto_106493 ?auto_106497 ) ) ( not ( = ?auto_106494 ?auto_106497 ) ) ( not ( = ?auto_106495 ?auto_106497 ) ) ( not ( = ?auto_106496 ?auto_106497 ) ) ( ON-TABLE ?auto_106498 ) ( ON ?auto_106497 ?auto_106498 ) ( not ( = ?auto_106498 ?auto_106497 ) ) ( not ( = ?auto_106498 ?auto_106496 ) ) ( not ( = ?auto_106498 ?auto_106495 ) ) ( not ( = ?auto_106492 ?auto_106498 ) ) ( not ( = ?auto_106493 ?auto_106498 ) ) ( not ( = ?auto_106494 ?auto_106498 ) ) ( ON ?auto_106492 ?auto_106499 ) ( not ( = ?auto_106492 ?auto_106499 ) ) ( not ( = ?auto_106493 ?auto_106499 ) ) ( not ( = ?auto_106494 ?auto_106499 ) ) ( not ( = ?auto_106495 ?auto_106499 ) ) ( not ( = ?auto_106496 ?auto_106499 ) ) ( not ( = ?auto_106497 ?auto_106499 ) ) ( not ( = ?auto_106498 ?auto_106499 ) ) ( ON ?auto_106493 ?auto_106492 ) ( ON-TABLE ?auto_106499 ) ( ON ?auto_106494 ?auto_106493 ) ( ON ?auto_106495 ?auto_106494 ) ( CLEAR ?auto_106495 ) ( HOLDING ?auto_106496 ) ( CLEAR ?auto_106497 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106498 ?auto_106497 ?auto_106496 )
      ( MAKE-5PILE ?auto_106492 ?auto_106493 ?auto_106494 ?auto_106495 ?auto_106496 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106500 - BLOCK
      ?auto_106501 - BLOCK
      ?auto_106502 - BLOCK
      ?auto_106503 - BLOCK
      ?auto_106504 - BLOCK
    )
    :vars
    (
      ?auto_106505 - BLOCK
      ?auto_106507 - BLOCK
      ?auto_106506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106500 ?auto_106501 ) ) ( not ( = ?auto_106500 ?auto_106502 ) ) ( not ( = ?auto_106500 ?auto_106503 ) ) ( not ( = ?auto_106500 ?auto_106504 ) ) ( not ( = ?auto_106501 ?auto_106502 ) ) ( not ( = ?auto_106501 ?auto_106503 ) ) ( not ( = ?auto_106501 ?auto_106504 ) ) ( not ( = ?auto_106502 ?auto_106503 ) ) ( not ( = ?auto_106502 ?auto_106504 ) ) ( not ( = ?auto_106503 ?auto_106504 ) ) ( not ( = ?auto_106500 ?auto_106505 ) ) ( not ( = ?auto_106501 ?auto_106505 ) ) ( not ( = ?auto_106502 ?auto_106505 ) ) ( not ( = ?auto_106503 ?auto_106505 ) ) ( not ( = ?auto_106504 ?auto_106505 ) ) ( ON-TABLE ?auto_106507 ) ( ON ?auto_106505 ?auto_106507 ) ( not ( = ?auto_106507 ?auto_106505 ) ) ( not ( = ?auto_106507 ?auto_106504 ) ) ( not ( = ?auto_106507 ?auto_106503 ) ) ( not ( = ?auto_106500 ?auto_106507 ) ) ( not ( = ?auto_106501 ?auto_106507 ) ) ( not ( = ?auto_106502 ?auto_106507 ) ) ( ON ?auto_106500 ?auto_106506 ) ( not ( = ?auto_106500 ?auto_106506 ) ) ( not ( = ?auto_106501 ?auto_106506 ) ) ( not ( = ?auto_106502 ?auto_106506 ) ) ( not ( = ?auto_106503 ?auto_106506 ) ) ( not ( = ?auto_106504 ?auto_106506 ) ) ( not ( = ?auto_106505 ?auto_106506 ) ) ( not ( = ?auto_106507 ?auto_106506 ) ) ( ON ?auto_106501 ?auto_106500 ) ( ON-TABLE ?auto_106506 ) ( ON ?auto_106502 ?auto_106501 ) ( ON ?auto_106503 ?auto_106502 ) ( CLEAR ?auto_106505 ) ( ON ?auto_106504 ?auto_106503 ) ( CLEAR ?auto_106504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106506 ?auto_106500 ?auto_106501 ?auto_106502 ?auto_106503 )
      ( MAKE-5PILE ?auto_106500 ?auto_106501 ?auto_106502 ?auto_106503 ?auto_106504 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106508 - BLOCK
      ?auto_106509 - BLOCK
      ?auto_106510 - BLOCK
      ?auto_106511 - BLOCK
      ?auto_106512 - BLOCK
    )
    :vars
    (
      ?auto_106515 - BLOCK
      ?auto_106514 - BLOCK
      ?auto_106513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106508 ?auto_106509 ) ) ( not ( = ?auto_106508 ?auto_106510 ) ) ( not ( = ?auto_106508 ?auto_106511 ) ) ( not ( = ?auto_106508 ?auto_106512 ) ) ( not ( = ?auto_106509 ?auto_106510 ) ) ( not ( = ?auto_106509 ?auto_106511 ) ) ( not ( = ?auto_106509 ?auto_106512 ) ) ( not ( = ?auto_106510 ?auto_106511 ) ) ( not ( = ?auto_106510 ?auto_106512 ) ) ( not ( = ?auto_106511 ?auto_106512 ) ) ( not ( = ?auto_106508 ?auto_106515 ) ) ( not ( = ?auto_106509 ?auto_106515 ) ) ( not ( = ?auto_106510 ?auto_106515 ) ) ( not ( = ?auto_106511 ?auto_106515 ) ) ( not ( = ?auto_106512 ?auto_106515 ) ) ( ON-TABLE ?auto_106514 ) ( not ( = ?auto_106514 ?auto_106515 ) ) ( not ( = ?auto_106514 ?auto_106512 ) ) ( not ( = ?auto_106514 ?auto_106511 ) ) ( not ( = ?auto_106508 ?auto_106514 ) ) ( not ( = ?auto_106509 ?auto_106514 ) ) ( not ( = ?auto_106510 ?auto_106514 ) ) ( ON ?auto_106508 ?auto_106513 ) ( not ( = ?auto_106508 ?auto_106513 ) ) ( not ( = ?auto_106509 ?auto_106513 ) ) ( not ( = ?auto_106510 ?auto_106513 ) ) ( not ( = ?auto_106511 ?auto_106513 ) ) ( not ( = ?auto_106512 ?auto_106513 ) ) ( not ( = ?auto_106515 ?auto_106513 ) ) ( not ( = ?auto_106514 ?auto_106513 ) ) ( ON ?auto_106509 ?auto_106508 ) ( ON-TABLE ?auto_106513 ) ( ON ?auto_106510 ?auto_106509 ) ( ON ?auto_106511 ?auto_106510 ) ( ON ?auto_106512 ?auto_106511 ) ( CLEAR ?auto_106512 ) ( HOLDING ?auto_106515 ) ( CLEAR ?auto_106514 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106514 ?auto_106515 )
      ( MAKE-5PILE ?auto_106508 ?auto_106509 ?auto_106510 ?auto_106511 ?auto_106512 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106516 - BLOCK
      ?auto_106517 - BLOCK
      ?auto_106518 - BLOCK
      ?auto_106519 - BLOCK
      ?auto_106520 - BLOCK
    )
    :vars
    (
      ?auto_106522 - BLOCK
      ?auto_106521 - BLOCK
      ?auto_106523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106516 ?auto_106517 ) ) ( not ( = ?auto_106516 ?auto_106518 ) ) ( not ( = ?auto_106516 ?auto_106519 ) ) ( not ( = ?auto_106516 ?auto_106520 ) ) ( not ( = ?auto_106517 ?auto_106518 ) ) ( not ( = ?auto_106517 ?auto_106519 ) ) ( not ( = ?auto_106517 ?auto_106520 ) ) ( not ( = ?auto_106518 ?auto_106519 ) ) ( not ( = ?auto_106518 ?auto_106520 ) ) ( not ( = ?auto_106519 ?auto_106520 ) ) ( not ( = ?auto_106516 ?auto_106522 ) ) ( not ( = ?auto_106517 ?auto_106522 ) ) ( not ( = ?auto_106518 ?auto_106522 ) ) ( not ( = ?auto_106519 ?auto_106522 ) ) ( not ( = ?auto_106520 ?auto_106522 ) ) ( ON-TABLE ?auto_106521 ) ( not ( = ?auto_106521 ?auto_106522 ) ) ( not ( = ?auto_106521 ?auto_106520 ) ) ( not ( = ?auto_106521 ?auto_106519 ) ) ( not ( = ?auto_106516 ?auto_106521 ) ) ( not ( = ?auto_106517 ?auto_106521 ) ) ( not ( = ?auto_106518 ?auto_106521 ) ) ( ON ?auto_106516 ?auto_106523 ) ( not ( = ?auto_106516 ?auto_106523 ) ) ( not ( = ?auto_106517 ?auto_106523 ) ) ( not ( = ?auto_106518 ?auto_106523 ) ) ( not ( = ?auto_106519 ?auto_106523 ) ) ( not ( = ?auto_106520 ?auto_106523 ) ) ( not ( = ?auto_106522 ?auto_106523 ) ) ( not ( = ?auto_106521 ?auto_106523 ) ) ( ON ?auto_106517 ?auto_106516 ) ( ON-TABLE ?auto_106523 ) ( ON ?auto_106518 ?auto_106517 ) ( ON ?auto_106519 ?auto_106518 ) ( ON ?auto_106520 ?auto_106519 ) ( CLEAR ?auto_106521 ) ( ON ?auto_106522 ?auto_106520 ) ( CLEAR ?auto_106522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106523 ?auto_106516 ?auto_106517 ?auto_106518 ?auto_106519 ?auto_106520 )
      ( MAKE-5PILE ?auto_106516 ?auto_106517 ?auto_106518 ?auto_106519 ?auto_106520 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106524 - BLOCK
      ?auto_106525 - BLOCK
      ?auto_106526 - BLOCK
      ?auto_106527 - BLOCK
      ?auto_106528 - BLOCK
    )
    :vars
    (
      ?auto_106531 - BLOCK
      ?auto_106530 - BLOCK
      ?auto_106529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106524 ?auto_106525 ) ) ( not ( = ?auto_106524 ?auto_106526 ) ) ( not ( = ?auto_106524 ?auto_106527 ) ) ( not ( = ?auto_106524 ?auto_106528 ) ) ( not ( = ?auto_106525 ?auto_106526 ) ) ( not ( = ?auto_106525 ?auto_106527 ) ) ( not ( = ?auto_106525 ?auto_106528 ) ) ( not ( = ?auto_106526 ?auto_106527 ) ) ( not ( = ?auto_106526 ?auto_106528 ) ) ( not ( = ?auto_106527 ?auto_106528 ) ) ( not ( = ?auto_106524 ?auto_106531 ) ) ( not ( = ?auto_106525 ?auto_106531 ) ) ( not ( = ?auto_106526 ?auto_106531 ) ) ( not ( = ?auto_106527 ?auto_106531 ) ) ( not ( = ?auto_106528 ?auto_106531 ) ) ( not ( = ?auto_106530 ?auto_106531 ) ) ( not ( = ?auto_106530 ?auto_106528 ) ) ( not ( = ?auto_106530 ?auto_106527 ) ) ( not ( = ?auto_106524 ?auto_106530 ) ) ( not ( = ?auto_106525 ?auto_106530 ) ) ( not ( = ?auto_106526 ?auto_106530 ) ) ( ON ?auto_106524 ?auto_106529 ) ( not ( = ?auto_106524 ?auto_106529 ) ) ( not ( = ?auto_106525 ?auto_106529 ) ) ( not ( = ?auto_106526 ?auto_106529 ) ) ( not ( = ?auto_106527 ?auto_106529 ) ) ( not ( = ?auto_106528 ?auto_106529 ) ) ( not ( = ?auto_106531 ?auto_106529 ) ) ( not ( = ?auto_106530 ?auto_106529 ) ) ( ON ?auto_106525 ?auto_106524 ) ( ON-TABLE ?auto_106529 ) ( ON ?auto_106526 ?auto_106525 ) ( ON ?auto_106527 ?auto_106526 ) ( ON ?auto_106528 ?auto_106527 ) ( ON ?auto_106531 ?auto_106528 ) ( CLEAR ?auto_106531 ) ( HOLDING ?auto_106530 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106530 )
      ( MAKE-5PILE ?auto_106524 ?auto_106525 ?auto_106526 ?auto_106527 ?auto_106528 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106532 - BLOCK
      ?auto_106533 - BLOCK
      ?auto_106534 - BLOCK
      ?auto_106535 - BLOCK
      ?auto_106536 - BLOCK
    )
    :vars
    (
      ?auto_106539 - BLOCK
      ?auto_106538 - BLOCK
      ?auto_106537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106532 ?auto_106533 ) ) ( not ( = ?auto_106532 ?auto_106534 ) ) ( not ( = ?auto_106532 ?auto_106535 ) ) ( not ( = ?auto_106532 ?auto_106536 ) ) ( not ( = ?auto_106533 ?auto_106534 ) ) ( not ( = ?auto_106533 ?auto_106535 ) ) ( not ( = ?auto_106533 ?auto_106536 ) ) ( not ( = ?auto_106534 ?auto_106535 ) ) ( not ( = ?auto_106534 ?auto_106536 ) ) ( not ( = ?auto_106535 ?auto_106536 ) ) ( not ( = ?auto_106532 ?auto_106539 ) ) ( not ( = ?auto_106533 ?auto_106539 ) ) ( not ( = ?auto_106534 ?auto_106539 ) ) ( not ( = ?auto_106535 ?auto_106539 ) ) ( not ( = ?auto_106536 ?auto_106539 ) ) ( not ( = ?auto_106538 ?auto_106539 ) ) ( not ( = ?auto_106538 ?auto_106536 ) ) ( not ( = ?auto_106538 ?auto_106535 ) ) ( not ( = ?auto_106532 ?auto_106538 ) ) ( not ( = ?auto_106533 ?auto_106538 ) ) ( not ( = ?auto_106534 ?auto_106538 ) ) ( ON ?auto_106532 ?auto_106537 ) ( not ( = ?auto_106532 ?auto_106537 ) ) ( not ( = ?auto_106533 ?auto_106537 ) ) ( not ( = ?auto_106534 ?auto_106537 ) ) ( not ( = ?auto_106535 ?auto_106537 ) ) ( not ( = ?auto_106536 ?auto_106537 ) ) ( not ( = ?auto_106539 ?auto_106537 ) ) ( not ( = ?auto_106538 ?auto_106537 ) ) ( ON ?auto_106533 ?auto_106532 ) ( ON-TABLE ?auto_106537 ) ( ON ?auto_106534 ?auto_106533 ) ( ON ?auto_106535 ?auto_106534 ) ( ON ?auto_106536 ?auto_106535 ) ( ON ?auto_106539 ?auto_106536 ) ( ON ?auto_106538 ?auto_106539 ) ( CLEAR ?auto_106538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106537 ?auto_106532 ?auto_106533 ?auto_106534 ?auto_106535 ?auto_106536 ?auto_106539 )
      ( MAKE-5PILE ?auto_106532 ?auto_106533 ?auto_106534 ?auto_106535 ?auto_106536 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106541 - BLOCK
    )
    :vars
    (
      ?auto_106542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106542 ?auto_106541 ) ( CLEAR ?auto_106542 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106541 ) ( not ( = ?auto_106541 ?auto_106542 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106542 ?auto_106541 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106543 - BLOCK
    )
    :vars
    (
      ?auto_106544 - BLOCK
      ?auto_106545 - BLOCK
      ?auto_106546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106544 ?auto_106543 ) ( CLEAR ?auto_106544 ) ( ON-TABLE ?auto_106543 ) ( not ( = ?auto_106543 ?auto_106544 ) ) ( HOLDING ?auto_106545 ) ( CLEAR ?auto_106546 ) ( not ( = ?auto_106543 ?auto_106545 ) ) ( not ( = ?auto_106543 ?auto_106546 ) ) ( not ( = ?auto_106544 ?auto_106545 ) ) ( not ( = ?auto_106544 ?auto_106546 ) ) ( not ( = ?auto_106545 ?auto_106546 ) ) )
    :subtasks
    ( ( !STACK ?auto_106545 ?auto_106546 )
      ( MAKE-1PILE ?auto_106543 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106547 - BLOCK
    )
    :vars
    (
      ?auto_106549 - BLOCK
      ?auto_106550 - BLOCK
      ?auto_106548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106549 ?auto_106547 ) ( ON-TABLE ?auto_106547 ) ( not ( = ?auto_106547 ?auto_106549 ) ) ( CLEAR ?auto_106550 ) ( not ( = ?auto_106547 ?auto_106548 ) ) ( not ( = ?auto_106547 ?auto_106550 ) ) ( not ( = ?auto_106549 ?auto_106548 ) ) ( not ( = ?auto_106549 ?auto_106550 ) ) ( not ( = ?auto_106548 ?auto_106550 ) ) ( ON ?auto_106548 ?auto_106549 ) ( CLEAR ?auto_106548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106547 ?auto_106549 )
      ( MAKE-1PILE ?auto_106547 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106551 - BLOCK
    )
    :vars
    (
      ?auto_106553 - BLOCK
      ?auto_106554 - BLOCK
      ?auto_106552 - BLOCK
      ?auto_106555 - BLOCK
      ?auto_106556 - BLOCK
      ?auto_106557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106553 ?auto_106551 ) ( ON-TABLE ?auto_106551 ) ( not ( = ?auto_106551 ?auto_106553 ) ) ( not ( = ?auto_106551 ?auto_106554 ) ) ( not ( = ?auto_106551 ?auto_106552 ) ) ( not ( = ?auto_106553 ?auto_106554 ) ) ( not ( = ?auto_106553 ?auto_106552 ) ) ( not ( = ?auto_106554 ?auto_106552 ) ) ( ON ?auto_106554 ?auto_106553 ) ( CLEAR ?auto_106554 ) ( HOLDING ?auto_106552 ) ( CLEAR ?auto_106555 ) ( ON-TABLE ?auto_106556 ) ( ON ?auto_106557 ?auto_106556 ) ( ON ?auto_106555 ?auto_106557 ) ( not ( = ?auto_106556 ?auto_106557 ) ) ( not ( = ?auto_106556 ?auto_106555 ) ) ( not ( = ?auto_106556 ?auto_106552 ) ) ( not ( = ?auto_106557 ?auto_106555 ) ) ( not ( = ?auto_106557 ?auto_106552 ) ) ( not ( = ?auto_106555 ?auto_106552 ) ) ( not ( = ?auto_106551 ?auto_106555 ) ) ( not ( = ?auto_106551 ?auto_106556 ) ) ( not ( = ?auto_106551 ?auto_106557 ) ) ( not ( = ?auto_106553 ?auto_106555 ) ) ( not ( = ?auto_106553 ?auto_106556 ) ) ( not ( = ?auto_106553 ?auto_106557 ) ) ( not ( = ?auto_106554 ?auto_106555 ) ) ( not ( = ?auto_106554 ?auto_106556 ) ) ( not ( = ?auto_106554 ?auto_106557 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106556 ?auto_106557 ?auto_106555 ?auto_106552 )
      ( MAKE-1PILE ?auto_106551 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106558 - BLOCK
    )
    :vars
    (
      ?auto_106559 - BLOCK
      ?auto_106561 - BLOCK
      ?auto_106562 - BLOCK
      ?auto_106563 - BLOCK
      ?auto_106564 - BLOCK
      ?auto_106560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106559 ?auto_106558 ) ( ON-TABLE ?auto_106558 ) ( not ( = ?auto_106558 ?auto_106559 ) ) ( not ( = ?auto_106558 ?auto_106561 ) ) ( not ( = ?auto_106558 ?auto_106562 ) ) ( not ( = ?auto_106559 ?auto_106561 ) ) ( not ( = ?auto_106559 ?auto_106562 ) ) ( not ( = ?auto_106561 ?auto_106562 ) ) ( ON ?auto_106561 ?auto_106559 ) ( CLEAR ?auto_106563 ) ( ON-TABLE ?auto_106564 ) ( ON ?auto_106560 ?auto_106564 ) ( ON ?auto_106563 ?auto_106560 ) ( not ( = ?auto_106564 ?auto_106560 ) ) ( not ( = ?auto_106564 ?auto_106563 ) ) ( not ( = ?auto_106564 ?auto_106562 ) ) ( not ( = ?auto_106560 ?auto_106563 ) ) ( not ( = ?auto_106560 ?auto_106562 ) ) ( not ( = ?auto_106563 ?auto_106562 ) ) ( not ( = ?auto_106558 ?auto_106563 ) ) ( not ( = ?auto_106558 ?auto_106564 ) ) ( not ( = ?auto_106558 ?auto_106560 ) ) ( not ( = ?auto_106559 ?auto_106563 ) ) ( not ( = ?auto_106559 ?auto_106564 ) ) ( not ( = ?auto_106559 ?auto_106560 ) ) ( not ( = ?auto_106561 ?auto_106563 ) ) ( not ( = ?auto_106561 ?auto_106564 ) ) ( not ( = ?auto_106561 ?auto_106560 ) ) ( ON ?auto_106562 ?auto_106561 ) ( CLEAR ?auto_106562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106558 ?auto_106559 ?auto_106561 )
      ( MAKE-1PILE ?auto_106558 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106565 - BLOCK
    )
    :vars
    (
      ?auto_106571 - BLOCK
      ?auto_106568 - BLOCK
      ?auto_106570 - BLOCK
      ?auto_106566 - BLOCK
      ?auto_106569 - BLOCK
      ?auto_106567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106571 ?auto_106565 ) ( ON-TABLE ?auto_106565 ) ( not ( = ?auto_106565 ?auto_106571 ) ) ( not ( = ?auto_106565 ?auto_106568 ) ) ( not ( = ?auto_106565 ?auto_106570 ) ) ( not ( = ?auto_106571 ?auto_106568 ) ) ( not ( = ?auto_106571 ?auto_106570 ) ) ( not ( = ?auto_106568 ?auto_106570 ) ) ( ON ?auto_106568 ?auto_106571 ) ( ON-TABLE ?auto_106566 ) ( ON ?auto_106569 ?auto_106566 ) ( not ( = ?auto_106566 ?auto_106569 ) ) ( not ( = ?auto_106566 ?auto_106567 ) ) ( not ( = ?auto_106566 ?auto_106570 ) ) ( not ( = ?auto_106569 ?auto_106567 ) ) ( not ( = ?auto_106569 ?auto_106570 ) ) ( not ( = ?auto_106567 ?auto_106570 ) ) ( not ( = ?auto_106565 ?auto_106567 ) ) ( not ( = ?auto_106565 ?auto_106566 ) ) ( not ( = ?auto_106565 ?auto_106569 ) ) ( not ( = ?auto_106571 ?auto_106567 ) ) ( not ( = ?auto_106571 ?auto_106566 ) ) ( not ( = ?auto_106571 ?auto_106569 ) ) ( not ( = ?auto_106568 ?auto_106567 ) ) ( not ( = ?auto_106568 ?auto_106566 ) ) ( not ( = ?auto_106568 ?auto_106569 ) ) ( ON ?auto_106570 ?auto_106568 ) ( CLEAR ?auto_106570 ) ( HOLDING ?auto_106567 ) ( CLEAR ?auto_106569 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106566 ?auto_106569 ?auto_106567 )
      ( MAKE-1PILE ?auto_106565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106572 - BLOCK
    )
    :vars
    (
      ?auto_106575 - BLOCK
      ?auto_106577 - BLOCK
      ?auto_106574 - BLOCK
      ?auto_106576 - BLOCK
      ?auto_106578 - BLOCK
      ?auto_106573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106575 ?auto_106572 ) ( ON-TABLE ?auto_106572 ) ( not ( = ?auto_106572 ?auto_106575 ) ) ( not ( = ?auto_106572 ?auto_106577 ) ) ( not ( = ?auto_106572 ?auto_106574 ) ) ( not ( = ?auto_106575 ?auto_106577 ) ) ( not ( = ?auto_106575 ?auto_106574 ) ) ( not ( = ?auto_106577 ?auto_106574 ) ) ( ON ?auto_106577 ?auto_106575 ) ( ON-TABLE ?auto_106576 ) ( ON ?auto_106578 ?auto_106576 ) ( not ( = ?auto_106576 ?auto_106578 ) ) ( not ( = ?auto_106576 ?auto_106573 ) ) ( not ( = ?auto_106576 ?auto_106574 ) ) ( not ( = ?auto_106578 ?auto_106573 ) ) ( not ( = ?auto_106578 ?auto_106574 ) ) ( not ( = ?auto_106573 ?auto_106574 ) ) ( not ( = ?auto_106572 ?auto_106573 ) ) ( not ( = ?auto_106572 ?auto_106576 ) ) ( not ( = ?auto_106572 ?auto_106578 ) ) ( not ( = ?auto_106575 ?auto_106573 ) ) ( not ( = ?auto_106575 ?auto_106576 ) ) ( not ( = ?auto_106575 ?auto_106578 ) ) ( not ( = ?auto_106577 ?auto_106573 ) ) ( not ( = ?auto_106577 ?auto_106576 ) ) ( not ( = ?auto_106577 ?auto_106578 ) ) ( ON ?auto_106574 ?auto_106577 ) ( CLEAR ?auto_106578 ) ( ON ?auto_106573 ?auto_106574 ) ( CLEAR ?auto_106573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106572 ?auto_106575 ?auto_106577 ?auto_106574 )
      ( MAKE-1PILE ?auto_106572 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106579 - BLOCK
    )
    :vars
    (
      ?auto_106581 - BLOCK
      ?auto_106582 - BLOCK
      ?auto_106584 - BLOCK
      ?auto_106580 - BLOCK
      ?auto_106583 - BLOCK
      ?auto_106585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106581 ?auto_106579 ) ( ON-TABLE ?auto_106579 ) ( not ( = ?auto_106579 ?auto_106581 ) ) ( not ( = ?auto_106579 ?auto_106582 ) ) ( not ( = ?auto_106579 ?auto_106584 ) ) ( not ( = ?auto_106581 ?auto_106582 ) ) ( not ( = ?auto_106581 ?auto_106584 ) ) ( not ( = ?auto_106582 ?auto_106584 ) ) ( ON ?auto_106582 ?auto_106581 ) ( ON-TABLE ?auto_106580 ) ( not ( = ?auto_106580 ?auto_106583 ) ) ( not ( = ?auto_106580 ?auto_106585 ) ) ( not ( = ?auto_106580 ?auto_106584 ) ) ( not ( = ?auto_106583 ?auto_106585 ) ) ( not ( = ?auto_106583 ?auto_106584 ) ) ( not ( = ?auto_106585 ?auto_106584 ) ) ( not ( = ?auto_106579 ?auto_106585 ) ) ( not ( = ?auto_106579 ?auto_106580 ) ) ( not ( = ?auto_106579 ?auto_106583 ) ) ( not ( = ?auto_106581 ?auto_106585 ) ) ( not ( = ?auto_106581 ?auto_106580 ) ) ( not ( = ?auto_106581 ?auto_106583 ) ) ( not ( = ?auto_106582 ?auto_106585 ) ) ( not ( = ?auto_106582 ?auto_106580 ) ) ( not ( = ?auto_106582 ?auto_106583 ) ) ( ON ?auto_106584 ?auto_106582 ) ( ON ?auto_106585 ?auto_106584 ) ( CLEAR ?auto_106585 ) ( HOLDING ?auto_106583 ) ( CLEAR ?auto_106580 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106580 ?auto_106583 )
      ( MAKE-1PILE ?auto_106579 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106586 - BLOCK
    )
    :vars
    (
      ?auto_106592 - BLOCK
      ?auto_106587 - BLOCK
      ?auto_106591 - BLOCK
      ?auto_106590 - BLOCK
      ?auto_106588 - BLOCK
      ?auto_106589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106592 ?auto_106586 ) ( ON-TABLE ?auto_106586 ) ( not ( = ?auto_106586 ?auto_106592 ) ) ( not ( = ?auto_106586 ?auto_106587 ) ) ( not ( = ?auto_106586 ?auto_106591 ) ) ( not ( = ?auto_106592 ?auto_106587 ) ) ( not ( = ?auto_106592 ?auto_106591 ) ) ( not ( = ?auto_106587 ?auto_106591 ) ) ( ON ?auto_106587 ?auto_106592 ) ( ON-TABLE ?auto_106590 ) ( not ( = ?auto_106590 ?auto_106588 ) ) ( not ( = ?auto_106590 ?auto_106589 ) ) ( not ( = ?auto_106590 ?auto_106591 ) ) ( not ( = ?auto_106588 ?auto_106589 ) ) ( not ( = ?auto_106588 ?auto_106591 ) ) ( not ( = ?auto_106589 ?auto_106591 ) ) ( not ( = ?auto_106586 ?auto_106589 ) ) ( not ( = ?auto_106586 ?auto_106590 ) ) ( not ( = ?auto_106586 ?auto_106588 ) ) ( not ( = ?auto_106592 ?auto_106589 ) ) ( not ( = ?auto_106592 ?auto_106590 ) ) ( not ( = ?auto_106592 ?auto_106588 ) ) ( not ( = ?auto_106587 ?auto_106589 ) ) ( not ( = ?auto_106587 ?auto_106590 ) ) ( not ( = ?auto_106587 ?auto_106588 ) ) ( ON ?auto_106591 ?auto_106587 ) ( ON ?auto_106589 ?auto_106591 ) ( CLEAR ?auto_106590 ) ( ON ?auto_106588 ?auto_106589 ) ( CLEAR ?auto_106588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106586 ?auto_106592 ?auto_106587 ?auto_106591 ?auto_106589 )
      ( MAKE-1PILE ?auto_106586 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106593 - BLOCK
    )
    :vars
    (
      ?auto_106597 - BLOCK
      ?auto_106598 - BLOCK
      ?auto_106599 - BLOCK
      ?auto_106596 - BLOCK
      ?auto_106594 - BLOCK
      ?auto_106595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106597 ?auto_106593 ) ( ON-TABLE ?auto_106593 ) ( not ( = ?auto_106593 ?auto_106597 ) ) ( not ( = ?auto_106593 ?auto_106598 ) ) ( not ( = ?auto_106593 ?auto_106599 ) ) ( not ( = ?auto_106597 ?auto_106598 ) ) ( not ( = ?auto_106597 ?auto_106599 ) ) ( not ( = ?auto_106598 ?auto_106599 ) ) ( ON ?auto_106598 ?auto_106597 ) ( not ( = ?auto_106596 ?auto_106594 ) ) ( not ( = ?auto_106596 ?auto_106595 ) ) ( not ( = ?auto_106596 ?auto_106599 ) ) ( not ( = ?auto_106594 ?auto_106595 ) ) ( not ( = ?auto_106594 ?auto_106599 ) ) ( not ( = ?auto_106595 ?auto_106599 ) ) ( not ( = ?auto_106593 ?auto_106595 ) ) ( not ( = ?auto_106593 ?auto_106596 ) ) ( not ( = ?auto_106593 ?auto_106594 ) ) ( not ( = ?auto_106597 ?auto_106595 ) ) ( not ( = ?auto_106597 ?auto_106596 ) ) ( not ( = ?auto_106597 ?auto_106594 ) ) ( not ( = ?auto_106598 ?auto_106595 ) ) ( not ( = ?auto_106598 ?auto_106596 ) ) ( not ( = ?auto_106598 ?auto_106594 ) ) ( ON ?auto_106599 ?auto_106598 ) ( ON ?auto_106595 ?auto_106599 ) ( ON ?auto_106594 ?auto_106595 ) ( CLEAR ?auto_106594 ) ( HOLDING ?auto_106596 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106596 )
      ( MAKE-1PILE ?auto_106593 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106600 - BLOCK
    )
    :vars
    (
      ?auto_106603 - BLOCK
      ?auto_106605 - BLOCK
      ?auto_106604 - BLOCK
      ?auto_106602 - BLOCK
      ?auto_106606 - BLOCK
      ?auto_106601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106603 ?auto_106600 ) ( ON-TABLE ?auto_106600 ) ( not ( = ?auto_106600 ?auto_106603 ) ) ( not ( = ?auto_106600 ?auto_106605 ) ) ( not ( = ?auto_106600 ?auto_106604 ) ) ( not ( = ?auto_106603 ?auto_106605 ) ) ( not ( = ?auto_106603 ?auto_106604 ) ) ( not ( = ?auto_106605 ?auto_106604 ) ) ( ON ?auto_106605 ?auto_106603 ) ( not ( = ?auto_106602 ?auto_106606 ) ) ( not ( = ?auto_106602 ?auto_106601 ) ) ( not ( = ?auto_106602 ?auto_106604 ) ) ( not ( = ?auto_106606 ?auto_106601 ) ) ( not ( = ?auto_106606 ?auto_106604 ) ) ( not ( = ?auto_106601 ?auto_106604 ) ) ( not ( = ?auto_106600 ?auto_106601 ) ) ( not ( = ?auto_106600 ?auto_106602 ) ) ( not ( = ?auto_106600 ?auto_106606 ) ) ( not ( = ?auto_106603 ?auto_106601 ) ) ( not ( = ?auto_106603 ?auto_106602 ) ) ( not ( = ?auto_106603 ?auto_106606 ) ) ( not ( = ?auto_106605 ?auto_106601 ) ) ( not ( = ?auto_106605 ?auto_106602 ) ) ( not ( = ?auto_106605 ?auto_106606 ) ) ( ON ?auto_106604 ?auto_106605 ) ( ON ?auto_106601 ?auto_106604 ) ( ON ?auto_106606 ?auto_106601 ) ( ON ?auto_106602 ?auto_106606 ) ( CLEAR ?auto_106602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106600 ?auto_106603 ?auto_106605 ?auto_106604 ?auto_106601 ?auto_106606 )
      ( MAKE-1PILE ?auto_106600 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106607 - BLOCK
    )
    :vars
    (
      ?auto_106612 - BLOCK
      ?auto_106608 - BLOCK
      ?auto_106609 - BLOCK
      ?auto_106611 - BLOCK
      ?auto_106613 - BLOCK
      ?auto_106610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106612 ?auto_106607 ) ( ON-TABLE ?auto_106607 ) ( not ( = ?auto_106607 ?auto_106612 ) ) ( not ( = ?auto_106607 ?auto_106608 ) ) ( not ( = ?auto_106607 ?auto_106609 ) ) ( not ( = ?auto_106612 ?auto_106608 ) ) ( not ( = ?auto_106612 ?auto_106609 ) ) ( not ( = ?auto_106608 ?auto_106609 ) ) ( ON ?auto_106608 ?auto_106612 ) ( not ( = ?auto_106611 ?auto_106613 ) ) ( not ( = ?auto_106611 ?auto_106610 ) ) ( not ( = ?auto_106611 ?auto_106609 ) ) ( not ( = ?auto_106613 ?auto_106610 ) ) ( not ( = ?auto_106613 ?auto_106609 ) ) ( not ( = ?auto_106610 ?auto_106609 ) ) ( not ( = ?auto_106607 ?auto_106610 ) ) ( not ( = ?auto_106607 ?auto_106611 ) ) ( not ( = ?auto_106607 ?auto_106613 ) ) ( not ( = ?auto_106612 ?auto_106610 ) ) ( not ( = ?auto_106612 ?auto_106611 ) ) ( not ( = ?auto_106612 ?auto_106613 ) ) ( not ( = ?auto_106608 ?auto_106610 ) ) ( not ( = ?auto_106608 ?auto_106611 ) ) ( not ( = ?auto_106608 ?auto_106613 ) ) ( ON ?auto_106609 ?auto_106608 ) ( ON ?auto_106610 ?auto_106609 ) ( ON ?auto_106613 ?auto_106610 ) ( HOLDING ?auto_106611 ) ( CLEAR ?auto_106613 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106607 ?auto_106612 ?auto_106608 ?auto_106609 ?auto_106610 ?auto_106613 ?auto_106611 )
      ( MAKE-1PILE ?auto_106607 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106614 - BLOCK
    )
    :vars
    (
      ?auto_106619 - BLOCK
      ?auto_106620 - BLOCK
      ?auto_106618 - BLOCK
      ?auto_106616 - BLOCK
      ?auto_106615 - BLOCK
      ?auto_106617 - BLOCK
      ?auto_106621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106619 ?auto_106614 ) ( ON-TABLE ?auto_106614 ) ( not ( = ?auto_106614 ?auto_106619 ) ) ( not ( = ?auto_106614 ?auto_106620 ) ) ( not ( = ?auto_106614 ?auto_106618 ) ) ( not ( = ?auto_106619 ?auto_106620 ) ) ( not ( = ?auto_106619 ?auto_106618 ) ) ( not ( = ?auto_106620 ?auto_106618 ) ) ( ON ?auto_106620 ?auto_106619 ) ( not ( = ?auto_106616 ?auto_106615 ) ) ( not ( = ?auto_106616 ?auto_106617 ) ) ( not ( = ?auto_106616 ?auto_106618 ) ) ( not ( = ?auto_106615 ?auto_106617 ) ) ( not ( = ?auto_106615 ?auto_106618 ) ) ( not ( = ?auto_106617 ?auto_106618 ) ) ( not ( = ?auto_106614 ?auto_106617 ) ) ( not ( = ?auto_106614 ?auto_106616 ) ) ( not ( = ?auto_106614 ?auto_106615 ) ) ( not ( = ?auto_106619 ?auto_106617 ) ) ( not ( = ?auto_106619 ?auto_106616 ) ) ( not ( = ?auto_106619 ?auto_106615 ) ) ( not ( = ?auto_106620 ?auto_106617 ) ) ( not ( = ?auto_106620 ?auto_106616 ) ) ( not ( = ?auto_106620 ?auto_106615 ) ) ( ON ?auto_106618 ?auto_106620 ) ( ON ?auto_106617 ?auto_106618 ) ( ON ?auto_106615 ?auto_106617 ) ( CLEAR ?auto_106615 ) ( ON ?auto_106616 ?auto_106621 ) ( CLEAR ?auto_106616 ) ( HAND-EMPTY ) ( not ( = ?auto_106614 ?auto_106621 ) ) ( not ( = ?auto_106619 ?auto_106621 ) ) ( not ( = ?auto_106620 ?auto_106621 ) ) ( not ( = ?auto_106618 ?auto_106621 ) ) ( not ( = ?auto_106616 ?auto_106621 ) ) ( not ( = ?auto_106615 ?auto_106621 ) ) ( not ( = ?auto_106617 ?auto_106621 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106616 ?auto_106621 )
      ( MAKE-1PILE ?auto_106614 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106622 - BLOCK
    )
    :vars
    (
      ?auto_106628 - BLOCK
      ?auto_106624 - BLOCK
      ?auto_106629 - BLOCK
      ?auto_106626 - BLOCK
      ?auto_106627 - BLOCK
      ?auto_106625 - BLOCK
      ?auto_106623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106628 ?auto_106622 ) ( ON-TABLE ?auto_106622 ) ( not ( = ?auto_106622 ?auto_106628 ) ) ( not ( = ?auto_106622 ?auto_106624 ) ) ( not ( = ?auto_106622 ?auto_106629 ) ) ( not ( = ?auto_106628 ?auto_106624 ) ) ( not ( = ?auto_106628 ?auto_106629 ) ) ( not ( = ?auto_106624 ?auto_106629 ) ) ( ON ?auto_106624 ?auto_106628 ) ( not ( = ?auto_106626 ?auto_106627 ) ) ( not ( = ?auto_106626 ?auto_106625 ) ) ( not ( = ?auto_106626 ?auto_106629 ) ) ( not ( = ?auto_106627 ?auto_106625 ) ) ( not ( = ?auto_106627 ?auto_106629 ) ) ( not ( = ?auto_106625 ?auto_106629 ) ) ( not ( = ?auto_106622 ?auto_106625 ) ) ( not ( = ?auto_106622 ?auto_106626 ) ) ( not ( = ?auto_106622 ?auto_106627 ) ) ( not ( = ?auto_106628 ?auto_106625 ) ) ( not ( = ?auto_106628 ?auto_106626 ) ) ( not ( = ?auto_106628 ?auto_106627 ) ) ( not ( = ?auto_106624 ?auto_106625 ) ) ( not ( = ?auto_106624 ?auto_106626 ) ) ( not ( = ?auto_106624 ?auto_106627 ) ) ( ON ?auto_106629 ?auto_106624 ) ( ON ?auto_106625 ?auto_106629 ) ( ON ?auto_106626 ?auto_106623 ) ( CLEAR ?auto_106626 ) ( not ( = ?auto_106622 ?auto_106623 ) ) ( not ( = ?auto_106628 ?auto_106623 ) ) ( not ( = ?auto_106624 ?auto_106623 ) ) ( not ( = ?auto_106629 ?auto_106623 ) ) ( not ( = ?auto_106626 ?auto_106623 ) ) ( not ( = ?auto_106627 ?auto_106623 ) ) ( not ( = ?auto_106625 ?auto_106623 ) ) ( HOLDING ?auto_106627 ) ( CLEAR ?auto_106625 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106622 ?auto_106628 ?auto_106624 ?auto_106629 ?auto_106625 ?auto_106627 )
      ( MAKE-1PILE ?auto_106622 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106630 - BLOCK
    )
    :vars
    (
      ?auto_106637 - BLOCK
      ?auto_106632 - BLOCK
      ?auto_106635 - BLOCK
      ?auto_106634 - BLOCK
      ?auto_106636 - BLOCK
      ?auto_106633 - BLOCK
      ?auto_106631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106637 ?auto_106630 ) ( ON-TABLE ?auto_106630 ) ( not ( = ?auto_106630 ?auto_106637 ) ) ( not ( = ?auto_106630 ?auto_106632 ) ) ( not ( = ?auto_106630 ?auto_106635 ) ) ( not ( = ?auto_106637 ?auto_106632 ) ) ( not ( = ?auto_106637 ?auto_106635 ) ) ( not ( = ?auto_106632 ?auto_106635 ) ) ( ON ?auto_106632 ?auto_106637 ) ( not ( = ?auto_106634 ?auto_106636 ) ) ( not ( = ?auto_106634 ?auto_106633 ) ) ( not ( = ?auto_106634 ?auto_106635 ) ) ( not ( = ?auto_106636 ?auto_106633 ) ) ( not ( = ?auto_106636 ?auto_106635 ) ) ( not ( = ?auto_106633 ?auto_106635 ) ) ( not ( = ?auto_106630 ?auto_106633 ) ) ( not ( = ?auto_106630 ?auto_106634 ) ) ( not ( = ?auto_106630 ?auto_106636 ) ) ( not ( = ?auto_106637 ?auto_106633 ) ) ( not ( = ?auto_106637 ?auto_106634 ) ) ( not ( = ?auto_106637 ?auto_106636 ) ) ( not ( = ?auto_106632 ?auto_106633 ) ) ( not ( = ?auto_106632 ?auto_106634 ) ) ( not ( = ?auto_106632 ?auto_106636 ) ) ( ON ?auto_106635 ?auto_106632 ) ( ON ?auto_106633 ?auto_106635 ) ( ON ?auto_106634 ?auto_106631 ) ( not ( = ?auto_106630 ?auto_106631 ) ) ( not ( = ?auto_106637 ?auto_106631 ) ) ( not ( = ?auto_106632 ?auto_106631 ) ) ( not ( = ?auto_106635 ?auto_106631 ) ) ( not ( = ?auto_106634 ?auto_106631 ) ) ( not ( = ?auto_106636 ?auto_106631 ) ) ( not ( = ?auto_106633 ?auto_106631 ) ) ( CLEAR ?auto_106633 ) ( ON ?auto_106636 ?auto_106634 ) ( CLEAR ?auto_106636 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106631 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106631 ?auto_106634 )
      ( MAKE-1PILE ?auto_106630 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106638 - BLOCK
    )
    :vars
    (
      ?auto_106643 - BLOCK
      ?auto_106645 - BLOCK
      ?auto_106640 - BLOCK
      ?auto_106641 - BLOCK
      ?auto_106639 - BLOCK
      ?auto_106642 - BLOCK
      ?auto_106644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106643 ?auto_106638 ) ( ON-TABLE ?auto_106638 ) ( not ( = ?auto_106638 ?auto_106643 ) ) ( not ( = ?auto_106638 ?auto_106645 ) ) ( not ( = ?auto_106638 ?auto_106640 ) ) ( not ( = ?auto_106643 ?auto_106645 ) ) ( not ( = ?auto_106643 ?auto_106640 ) ) ( not ( = ?auto_106645 ?auto_106640 ) ) ( ON ?auto_106645 ?auto_106643 ) ( not ( = ?auto_106641 ?auto_106639 ) ) ( not ( = ?auto_106641 ?auto_106642 ) ) ( not ( = ?auto_106641 ?auto_106640 ) ) ( not ( = ?auto_106639 ?auto_106642 ) ) ( not ( = ?auto_106639 ?auto_106640 ) ) ( not ( = ?auto_106642 ?auto_106640 ) ) ( not ( = ?auto_106638 ?auto_106642 ) ) ( not ( = ?auto_106638 ?auto_106641 ) ) ( not ( = ?auto_106638 ?auto_106639 ) ) ( not ( = ?auto_106643 ?auto_106642 ) ) ( not ( = ?auto_106643 ?auto_106641 ) ) ( not ( = ?auto_106643 ?auto_106639 ) ) ( not ( = ?auto_106645 ?auto_106642 ) ) ( not ( = ?auto_106645 ?auto_106641 ) ) ( not ( = ?auto_106645 ?auto_106639 ) ) ( ON ?auto_106640 ?auto_106645 ) ( ON ?auto_106641 ?auto_106644 ) ( not ( = ?auto_106638 ?auto_106644 ) ) ( not ( = ?auto_106643 ?auto_106644 ) ) ( not ( = ?auto_106645 ?auto_106644 ) ) ( not ( = ?auto_106640 ?auto_106644 ) ) ( not ( = ?auto_106641 ?auto_106644 ) ) ( not ( = ?auto_106639 ?auto_106644 ) ) ( not ( = ?auto_106642 ?auto_106644 ) ) ( ON ?auto_106639 ?auto_106641 ) ( CLEAR ?auto_106639 ) ( ON-TABLE ?auto_106644 ) ( HOLDING ?auto_106642 ) ( CLEAR ?auto_106640 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106638 ?auto_106643 ?auto_106645 ?auto_106640 ?auto_106642 )
      ( MAKE-1PILE ?auto_106638 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106646 - BLOCK
    )
    :vars
    (
      ?auto_106651 - BLOCK
      ?auto_106652 - BLOCK
      ?auto_106649 - BLOCK
      ?auto_106650 - BLOCK
      ?auto_106653 - BLOCK
      ?auto_106648 - BLOCK
      ?auto_106647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106651 ?auto_106646 ) ( ON-TABLE ?auto_106646 ) ( not ( = ?auto_106646 ?auto_106651 ) ) ( not ( = ?auto_106646 ?auto_106652 ) ) ( not ( = ?auto_106646 ?auto_106649 ) ) ( not ( = ?auto_106651 ?auto_106652 ) ) ( not ( = ?auto_106651 ?auto_106649 ) ) ( not ( = ?auto_106652 ?auto_106649 ) ) ( ON ?auto_106652 ?auto_106651 ) ( not ( = ?auto_106650 ?auto_106653 ) ) ( not ( = ?auto_106650 ?auto_106648 ) ) ( not ( = ?auto_106650 ?auto_106649 ) ) ( not ( = ?auto_106653 ?auto_106648 ) ) ( not ( = ?auto_106653 ?auto_106649 ) ) ( not ( = ?auto_106648 ?auto_106649 ) ) ( not ( = ?auto_106646 ?auto_106648 ) ) ( not ( = ?auto_106646 ?auto_106650 ) ) ( not ( = ?auto_106646 ?auto_106653 ) ) ( not ( = ?auto_106651 ?auto_106648 ) ) ( not ( = ?auto_106651 ?auto_106650 ) ) ( not ( = ?auto_106651 ?auto_106653 ) ) ( not ( = ?auto_106652 ?auto_106648 ) ) ( not ( = ?auto_106652 ?auto_106650 ) ) ( not ( = ?auto_106652 ?auto_106653 ) ) ( ON ?auto_106649 ?auto_106652 ) ( ON ?auto_106650 ?auto_106647 ) ( not ( = ?auto_106646 ?auto_106647 ) ) ( not ( = ?auto_106651 ?auto_106647 ) ) ( not ( = ?auto_106652 ?auto_106647 ) ) ( not ( = ?auto_106649 ?auto_106647 ) ) ( not ( = ?auto_106650 ?auto_106647 ) ) ( not ( = ?auto_106653 ?auto_106647 ) ) ( not ( = ?auto_106648 ?auto_106647 ) ) ( ON ?auto_106653 ?auto_106650 ) ( ON-TABLE ?auto_106647 ) ( CLEAR ?auto_106649 ) ( ON ?auto_106648 ?auto_106653 ) ( CLEAR ?auto_106648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106647 ?auto_106650 ?auto_106653 )
      ( MAKE-1PILE ?auto_106646 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106654 - BLOCK
    )
    :vars
    (
      ?auto_106660 - BLOCK
      ?auto_106656 - BLOCK
      ?auto_106659 - BLOCK
      ?auto_106655 - BLOCK
      ?auto_106657 - BLOCK
      ?auto_106661 - BLOCK
      ?auto_106658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106660 ?auto_106654 ) ( ON-TABLE ?auto_106654 ) ( not ( = ?auto_106654 ?auto_106660 ) ) ( not ( = ?auto_106654 ?auto_106656 ) ) ( not ( = ?auto_106654 ?auto_106659 ) ) ( not ( = ?auto_106660 ?auto_106656 ) ) ( not ( = ?auto_106660 ?auto_106659 ) ) ( not ( = ?auto_106656 ?auto_106659 ) ) ( ON ?auto_106656 ?auto_106660 ) ( not ( = ?auto_106655 ?auto_106657 ) ) ( not ( = ?auto_106655 ?auto_106661 ) ) ( not ( = ?auto_106655 ?auto_106659 ) ) ( not ( = ?auto_106657 ?auto_106661 ) ) ( not ( = ?auto_106657 ?auto_106659 ) ) ( not ( = ?auto_106661 ?auto_106659 ) ) ( not ( = ?auto_106654 ?auto_106661 ) ) ( not ( = ?auto_106654 ?auto_106655 ) ) ( not ( = ?auto_106654 ?auto_106657 ) ) ( not ( = ?auto_106660 ?auto_106661 ) ) ( not ( = ?auto_106660 ?auto_106655 ) ) ( not ( = ?auto_106660 ?auto_106657 ) ) ( not ( = ?auto_106656 ?auto_106661 ) ) ( not ( = ?auto_106656 ?auto_106655 ) ) ( not ( = ?auto_106656 ?auto_106657 ) ) ( ON ?auto_106655 ?auto_106658 ) ( not ( = ?auto_106654 ?auto_106658 ) ) ( not ( = ?auto_106660 ?auto_106658 ) ) ( not ( = ?auto_106656 ?auto_106658 ) ) ( not ( = ?auto_106659 ?auto_106658 ) ) ( not ( = ?auto_106655 ?auto_106658 ) ) ( not ( = ?auto_106657 ?auto_106658 ) ) ( not ( = ?auto_106661 ?auto_106658 ) ) ( ON ?auto_106657 ?auto_106655 ) ( ON-TABLE ?auto_106658 ) ( ON ?auto_106661 ?auto_106657 ) ( CLEAR ?auto_106661 ) ( HOLDING ?auto_106659 ) ( CLEAR ?auto_106656 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106654 ?auto_106660 ?auto_106656 ?auto_106659 )
      ( MAKE-1PILE ?auto_106654 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106662 - BLOCK
    )
    :vars
    (
      ?auto_106663 - BLOCK
      ?auto_106666 - BLOCK
      ?auto_106668 - BLOCK
      ?auto_106665 - BLOCK
      ?auto_106664 - BLOCK
      ?auto_106669 - BLOCK
      ?auto_106667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106663 ?auto_106662 ) ( ON-TABLE ?auto_106662 ) ( not ( = ?auto_106662 ?auto_106663 ) ) ( not ( = ?auto_106662 ?auto_106666 ) ) ( not ( = ?auto_106662 ?auto_106668 ) ) ( not ( = ?auto_106663 ?auto_106666 ) ) ( not ( = ?auto_106663 ?auto_106668 ) ) ( not ( = ?auto_106666 ?auto_106668 ) ) ( ON ?auto_106666 ?auto_106663 ) ( not ( = ?auto_106665 ?auto_106664 ) ) ( not ( = ?auto_106665 ?auto_106669 ) ) ( not ( = ?auto_106665 ?auto_106668 ) ) ( not ( = ?auto_106664 ?auto_106669 ) ) ( not ( = ?auto_106664 ?auto_106668 ) ) ( not ( = ?auto_106669 ?auto_106668 ) ) ( not ( = ?auto_106662 ?auto_106669 ) ) ( not ( = ?auto_106662 ?auto_106665 ) ) ( not ( = ?auto_106662 ?auto_106664 ) ) ( not ( = ?auto_106663 ?auto_106669 ) ) ( not ( = ?auto_106663 ?auto_106665 ) ) ( not ( = ?auto_106663 ?auto_106664 ) ) ( not ( = ?auto_106666 ?auto_106669 ) ) ( not ( = ?auto_106666 ?auto_106665 ) ) ( not ( = ?auto_106666 ?auto_106664 ) ) ( ON ?auto_106665 ?auto_106667 ) ( not ( = ?auto_106662 ?auto_106667 ) ) ( not ( = ?auto_106663 ?auto_106667 ) ) ( not ( = ?auto_106666 ?auto_106667 ) ) ( not ( = ?auto_106668 ?auto_106667 ) ) ( not ( = ?auto_106665 ?auto_106667 ) ) ( not ( = ?auto_106664 ?auto_106667 ) ) ( not ( = ?auto_106669 ?auto_106667 ) ) ( ON ?auto_106664 ?auto_106665 ) ( ON-TABLE ?auto_106667 ) ( ON ?auto_106669 ?auto_106664 ) ( CLEAR ?auto_106666 ) ( ON ?auto_106668 ?auto_106669 ) ( CLEAR ?auto_106668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106667 ?auto_106665 ?auto_106664 ?auto_106669 )
      ( MAKE-1PILE ?auto_106662 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106670 - BLOCK
    )
    :vars
    (
      ?auto_106672 - BLOCK
      ?auto_106677 - BLOCK
      ?auto_106671 - BLOCK
      ?auto_106673 - BLOCK
      ?auto_106676 - BLOCK
      ?auto_106675 - BLOCK
      ?auto_106674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106672 ?auto_106670 ) ( ON-TABLE ?auto_106670 ) ( not ( = ?auto_106670 ?auto_106672 ) ) ( not ( = ?auto_106670 ?auto_106677 ) ) ( not ( = ?auto_106670 ?auto_106671 ) ) ( not ( = ?auto_106672 ?auto_106677 ) ) ( not ( = ?auto_106672 ?auto_106671 ) ) ( not ( = ?auto_106677 ?auto_106671 ) ) ( not ( = ?auto_106673 ?auto_106676 ) ) ( not ( = ?auto_106673 ?auto_106675 ) ) ( not ( = ?auto_106673 ?auto_106671 ) ) ( not ( = ?auto_106676 ?auto_106675 ) ) ( not ( = ?auto_106676 ?auto_106671 ) ) ( not ( = ?auto_106675 ?auto_106671 ) ) ( not ( = ?auto_106670 ?auto_106675 ) ) ( not ( = ?auto_106670 ?auto_106673 ) ) ( not ( = ?auto_106670 ?auto_106676 ) ) ( not ( = ?auto_106672 ?auto_106675 ) ) ( not ( = ?auto_106672 ?auto_106673 ) ) ( not ( = ?auto_106672 ?auto_106676 ) ) ( not ( = ?auto_106677 ?auto_106675 ) ) ( not ( = ?auto_106677 ?auto_106673 ) ) ( not ( = ?auto_106677 ?auto_106676 ) ) ( ON ?auto_106673 ?auto_106674 ) ( not ( = ?auto_106670 ?auto_106674 ) ) ( not ( = ?auto_106672 ?auto_106674 ) ) ( not ( = ?auto_106677 ?auto_106674 ) ) ( not ( = ?auto_106671 ?auto_106674 ) ) ( not ( = ?auto_106673 ?auto_106674 ) ) ( not ( = ?auto_106676 ?auto_106674 ) ) ( not ( = ?auto_106675 ?auto_106674 ) ) ( ON ?auto_106676 ?auto_106673 ) ( ON-TABLE ?auto_106674 ) ( ON ?auto_106675 ?auto_106676 ) ( ON ?auto_106671 ?auto_106675 ) ( CLEAR ?auto_106671 ) ( HOLDING ?auto_106677 ) ( CLEAR ?auto_106672 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106670 ?auto_106672 ?auto_106677 )
      ( MAKE-1PILE ?auto_106670 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106678 - BLOCK
    )
    :vars
    (
      ?auto_106681 - BLOCK
      ?auto_106679 - BLOCK
      ?auto_106684 - BLOCK
      ?auto_106683 - BLOCK
      ?auto_106680 - BLOCK
      ?auto_106685 - BLOCK
      ?auto_106682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106681 ?auto_106678 ) ( ON-TABLE ?auto_106678 ) ( not ( = ?auto_106678 ?auto_106681 ) ) ( not ( = ?auto_106678 ?auto_106679 ) ) ( not ( = ?auto_106678 ?auto_106684 ) ) ( not ( = ?auto_106681 ?auto_106679 ) ) ( not ( = ?auto_106681 ?auto_106684 ) ) ( not ( = ?auto_106679 ?auto_106684 ) ) ( not ( = ?auto_106683 ?auto_106680 ) ) ( not ( = ?auto_106683 ?auto_106685 ) ) ( not ( = ?auto_106683 ?auto_106684 ) ) ( not ( = ?auto_106680 ?auto_106685 ) ) ( not ( = ?auto_106680 ?auto_106684 ) ) ( not ( = ?auto_106685 ?auto_106684 ) ) ( not ( = ?auto_106678 ?auto_106685 ) ) ( not ( = ?auto_106678 ?auto_106683 ) ) ( not ( = ?auto_106678 ?auto_106680 ) ) ( not ( = ?auto_106681 ?auto_106685 ) ) ( not ( = ?auto_106681 ?auto_106683 ) ) ( not ( = ?auto_106681 ?auto_106680 ) ) ( not ( = ?auto_106679 ?auto_106685 ) ) ( not ( = ?auto_106679 ?auto_106683 ) ) ( not ( = ?auto_106679 ?auto_106680 ) ) ( ON ?auto_106683 ?auto_106682 ) ( not ( = ?auto_106678 ?auto_106682 ) ) ( not ( = ?auto_106681 ?auto_106682 ) ) ( not ( = ?auto_106679 ?auto_106682 ) ) ( not ( = ?auto_106684 ?auto_106682 ) ) ( not ( = ?auto_106683 ?auto_106682 ) ) ( not ( = ?auto_106680 ?auto_106682 ) ) ( not ( = ?auto_106685 ?auto_106682 ) ) ( ON ?auto_106680 ?auto_106683 ) ( ON-TABLE ?auto_106682 ) ( ON ?auto_106685 ?auto_106680 ) ( ON ?auto_106684 ?auto_106685 ) ( CLEAR ?auto_106681 ) ( ON ?auto_106679 ?auto_106684 ) ( CLEAR ?auto_106679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106682 ?auto_106683 ?auto_106680 ?auto_106685 ?auto_106684 )
      ( MAKE-1PILE ?auto_106678 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106702 - BLOCK
    )
    :vars
    (
      ?auto_106706 - BLOCK
      ?auto_106705 - BLOCK
      ?auto_106709 - BLOCK
      ?auto_106708 - BLOCK
      ?auto_106703 - BLOCK
      ?auto_106707 - BLOCK
      ?auto_106704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106702 ?auto_106706 ) ) ( not ( = ?auto_106702 ?auto_106705 ) ) ( not ( = ?auto_106702 ?auto_106709 ) ) ( not ( = ?auto_106706 ?auto_106705 ) ) ( not ( = ?auto_106706 ?auto_106709 ) ) ( not ( = ?auto_106705 ?auto_106709 ) ) ( not ( = ?auto_106708 ?auto_106703 ) ) ( not ( = ?auto_106708 ?auto_106707 ) ) ( not ( = ?auto_106708 ?auto_106709 ) ) ( not ( = ?auto_106703 ?auto_106707 ) ) ( not ( = ?auto_106703 ?auto_106709 ) ) ( not ( = ?auto_106707 ?auto_106709 ) ) ( not ( = ?auto_106702 ?auto_106707 ) ) ( not ( = ?auto_106702 ?auto_106708 ) ) ( not ( = ?auto_106702 ?auto_106703 ) ) ( not ( = ?auto_106706 ?auto_106707 ) ) ( not ( = ?auto_106706 ?auto_106708 ) ) ( not ( = ?auto_106706 ?auto_106703 ) ) ( not ( = ?auto_106705 ?auto_106707 ) ) ( not ( = ?auto_106705 ?auto_106708 ) ) ( not ( = ?auto_106705 ?auto_106703 ) ) ( ON ?auto_106708 ?auto_106704 ) ( not ( = ?auto_106702 ?auto_106704 ) ) ( not ( = ?auto_106706 ?auto_106704 ) ) ( not ( = ?auto_106705 ?auto_106704 ) ) ( not ( = ?auto_106709 ?auto_106704 ) ) ( not ( = ?auto_106708 ?auto_106704 ) ) ( not ( = ?auto_106703 ?auto_106704 ) ) ( not ( = ?auto_106707 ?auto_106704 ) ) ( ON ?auto_106703 ?auto_106708 ) ( ON-TABLE ?auto_106704 ) ( ON ?auto_106707 ?auto_106703 ) ( ON ?auto_106709 ?auto_106707 ) ( ON ?auto_106705 ?auto_106709 ) ( ON ?auto_106706 ?auto_106705 ) ( CLEAR ?auto_106706 ) ( HOLDING ?auto_106702 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106702 ?auto_106706 )
      ( MAKE-1PILE ?auto_106702 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_106710 - BLOCK
    )
    :vars
    (
      ?auto_106715 - BLOCK
      ?auto_106713 - BLOCK
      ?auto_106717 - BLOCK
      ?auto_106711 - BLOCK
      ?auto_106712 - BLOCK
      ?auto_106716 - BLOCK
      ?auto_106714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106710 ?auto_106715 ) ) ( not ( = ?auto_106710 ?auto_106713 ) ) ( not ( = ?auto_106710 ?auto_106717 ) ) ( not ( = ?auto_106715 ?auto_106713 ) ) ( not ( = ?auto_106715 ?auto_106717 ) ) ( not ( = ?auto_106713 ?auto_106717 ) ) ( not ( = ?auto_106711 ?auto_106712 ) ) ( not ( = ?auto_106711 ?auto_106716 ) ) ( not ( = ?auto_106711 ?auto_106717 ) ) ( not ( = ?auto_106712 ?auto_106716 ) ) ( not ( = ?auto_106712 ?auto_106717 ) ) ( not ( = ?auto_106716 ?auto_106717 ) ) ( not ( = ?auto_106710 ?auto_106716 ) ) ( not ( = ?auto_106710 ?auto_106711 ) ) ( not ( = ?auto_106710 ?auto_106712 ) ) ( not ( = ?auto_106715 ?auto_106716 ) ) ( not ( = ?auto_106715 ?auto_106711 ) ) ( not ( = ?auto_106715 ?auto_106712 ) ) ( not ( = ?auto_106713 ?auto_106716 ) ) ( not ( = ?auto_106713 ?auto_106711 ) ) ( not ( = ?auto_106713 ?auto_106712 ) ) ( ON ?auto_106711 ?auto_106714 ) ( not ( = ?auto_106710 ?auto_106714 ) ) ( not ( = ?auto_106715 ?auto_106714 ) ) ( not ( = ?auto_106713 ?auto_106714 ) ) ( not ( = ?auto_106717 ?auto_106714 ) ) ( not ( = ?auto_106711 ?auto_106714 ) ) ( not ( = ?auto_106712 ?auto_106714 ) ) ( not ( = ?auto_106716 ?auto_106714 ) ) ( ON ?auto_106712 ?auto_106711 ) ( ON-TABLE ?auto_106714 ) ( ON ?auto_106716 ?auto_106712 ) ( ON ?auto_106717 ?auto_106716 ) ( ON ?auto_106713 ?auto_106717 ) ( ON ?auto_106715 ?auto_106713 ) ( ON ?auto_106710 ?auto_106715 ) ( CLEAR ?auto_106710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106714 ?auto_106711 ?auto_106712 ?auto_106716 ?auto_106717 ?auto_106713 ?auto_106715 )
      ( MAKE-1PILE ?auto_106710 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106724 - BLOCK
      ?auto_106725 - BLOCK
      ?auto_106726 - BLOCK
      ?auto_106727 - BLOCK
      ?auto_106728 - BLOCK
      ?auto_106729 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_106729 ) ( CLEAR ?auto_106728 ) ( ON-TABLE ?auto_106724 ) ( ON ?auto_106725 ?auto_106724 ) ( ON ?auto_106726 ?auto_106725 ) ( ON ?auto_106727 ?auto_106726 ) ( ON ?auto_106728 ?auto_106727 ) ( not ( = ?auto_106724 ?auto_106725 ) ) ( not ( = ?auto_106724 ?auto_106726 ) ) ( not ( = ?auto_106724 ?auto_106727 ) ) ( not ( = ?auto_106724 ?auto_106728 ) ) ( not ( = ?auto_106724 ?auto_106729 ) ) ( not ( = ?auto_106725 ?auto_106726 ) ) ( not ( = ?auto_106725 ?auto_106727 ) ) ( not ( = ?auto_106725 ?auto_106728 ) ) ( not ( = ?auto_106725 ?auto_106729 ) ) ( not ( = ?auto_106726 ?auto_106727 ) ) ( not ( = ?auto_106726 ?auto_106728 ) ) ( not ( = ?auto_106726 ?auto_106729 ) ) ( not ( = ?auto_106727 ?auto_106728 ) ) ( not ( = ?auto_106727 ?auto_106729 ) ) ( not ( = ?auto_106728 ?auto_106729 ) ) )
    :subtasks
    ( ( !STACK ?auto_106729 ?auto_106728 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106730 - BLOCK
      ?auto_106731 - BLOCK
      ?auto_106732 - BLOCK
      ?auto_106733 - BLOCK
      ?auto_106734 - BLOCK
      ?auto_106735 - BLOCK
    )
    :vars
    (
      ?auto_106736 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_106734 ) ( ON-TABLE ?auto_106730 ) ( ON ?auto_106731 ?auto_106730 ) ( ON ?auto_106732 ?auto_106731 ) ( ON ?auto_106733 ?auto_106732 ) ( ON ?auto_106734 ?auto_106733 ) ( not ( = ?auto_106730 ?auto_106731 ) ) ( not ( = ?auto_106730 ?auto_106732 ) ) ( not ( = ?auto_106730 ?auto_106733 ) ) ( not ( = ?auto_106730 ?auto_106734 ) ) ( not ( = ?auto_106730 ?auto_106735 ) ) ( not ( = ?auto_106731 ?auto_106732 ) ) ( not ( = ?auto_106731 ?auto_106733 ) ) ( not ( = ?auto_106731 ?auto_106734 ) ) ( not ( = ?auto_106731 ?auto_106735 ) ) ( not ( = ?auto_106732 ?auto_106733 ) ) ( not ( = ?auto_106732 ?auto_106734 ) ) ( not ( = ?auto_106732 ?auto_106735 ) ) ( not ( = ?auto_106733 ?auto_106734 ) ) ( not ( = ?auto_106733 ?auto_106735 ) ) ( not ( = ?auto_106734 ?auto_106735 ) ) ( ON ?auto_106735 ?auto_106736 ) ( CLEAR ?auto_106735 ) ( HAND-EMPTY ) ( not ( = ?auto_106730 ?auto_106736 ) ) ( not ( = ?auto_106731 ?auto_106736 ) ) ( not ( = ?auto_106732 ?auto_106736 ) ) ( not ( = ?auto_106733 ?auto_106736 ) ) ( not ( = ?auto_106734 ?auto_106736 ) ) ( not ( = ?auto_106735 ?auto_106736 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106735 ?auto_106736 )
      ( MAKE-6PILE ?auto_106730 ?auto_106731 ?auto_106732 ?auto_106733 ?auto_106734 ?auto_106735 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106737 - BLOCK
      ?auto_106738 - BLOCK
      ?auto_106739 - BLOCK
      ?auto_106740 - BLOCK
      ?auto_106741 - BLOCK
      ?auto_106742 - BLOCK
    )
    :vars
    (
      ?auto_106743 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106737 ) ( ON ?auto_106738 ?auto_106737 ) ( ON ?auto_106739 ?auto_106738 ) ( ON ?auto_106740 ?auto_106739 ) ( not ( = ?auto_106737 ?auto_106738 ) ) ( not ( = ?auto_106737 ?auto_106739 ) ) ( not ( = ?auto_106737 ?auto_106740 ) ) ( not ( = ?auto_106737 ?auto_106741 ) ) ( not ( = ?auto_106737 ?auto_106742 ) ) ( not ( = ?auto_106738 ?auto_106739 ) ) ( not ( = ?auto_106738 ?auto_106740 ) ) ( not ( = ?auto_106738 ?auto_106741 ) ) ( not ( = ?auto_106738 ?auto_106742 ) ) ( not ( = ?auto_106739 ?auto_106740 ) ) ( not ( = ?auto_106739 ?auto_106741 ) ) ( not ( = ?auto_106739 ?auto_106742 ) ) ( not ( = ?auto_106740 ?auto_106741 ) ) ( not ( = ?auto_106740 ?auto_106742 ) ) ( not ( = ?auto_106741 ?auto_106742 ) ) ( ON ?auto_106742 ?auto_106743 ) ( CLEAR ?auto_106742 ) ( not ( = ?auto_106737 ?auto_106743 ) ) ( not ( = ?auto_106738 ?auto_106743 ) ) ( not ( = ?auto_106739 ?auto_106743 ) ) ( not ( = ?auto_106740 ?auto_106743 ) ) ( not ( = ?auto_106741 ?auto_106743 ) ) ( not ( = ?auto_106742 ?auto_106743 ) ) ( HOLDING ?auto_106741 ) ( CLEAR ?auto_106740 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106737 ?auto_106738 ?auto_106739 ?auto_106740 ?auto_106741 )
      ( MAKE-6PILE ?auto_106737 ?auto_106738 ?auto_106739 ?auto_106740 ?auto_106741 ?auto_106742 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106744 - BLOCK
      ?auto_106745 - BLOCK
      ?auto_106746 - BLOCK
      ?auto_106747 - BLOCK
      ?auto_106748 - BLOCK
      ?auto_106749 - BLOCK
    )
    :vars
    (
      ?auto_106750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106744 ) ( ON ?auto_106745 ?auto_106744 ) ( ON ?auto_106746 ?auto_106745 ) ( ON ?auto_106747 ?auto_106746 ) ( not ( = ?auto_106744 ?auto_106745 ) ) ( not ( = ?auto_106744 ?auto_106746 ) ) ( not ( = ?auto_106744 ?auto_106747 ) ) ( not ( = ?auto_106744 ?auto_106748 ) ) ( not ( = ?auto_106744 ?auto_106749 ) ) ( not ( = ?auto_106745 ?auto_106746 ) ) ( not ( = ?auto_106745 ?auto_106747 ) ) ( not ( = ?auto_106745 ?auto_106748 ) ) ( not ( = ?auto_106745 ?auto_106749 ) ) ( not ( = ?auto_106746 ?auto_106747 ) ) ( not ( = ?auto_106746 ?auto_106748 ) ) ( not ( = ?auto_106746 ?auto_106749 ) ) ( not ( = ?auto_106747 ?auto_106748 ) ) ( not ( = ?auto_106747 ?auto_106749 ) ) ( not ( = ?auto_106748 ?auto_106749 ) ) ( ON ?auto_106749 ?auto_106750 ) ( not ( = ?auto_106744 ?auto_106750 ) ) ( not ( = ?auto_106745 ?auto_106750 ) ) ( not ( = ?auto_106746 ?auto_106750 ) ) ( not ( = ?auto_106747 ?auto_106750 ) ) ( not ( = ?auto_106748 ?auto_106750 ) ) ( not ( = ?auto_106749 ?auto_106750 ) ) ( CLEAR ?auto_106747 ) ( ON ?auto_106748 ?auto_106749 ) ( CLEAR ?auto_106748 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106750 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106750 ?auto_106749 )
      ( MAKE-6PILE ?auto_106744 ?auto_106745 ?auto_106746 ?auto_106747 ?auto_106748 ?auto_106749 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106751 - BLOCK
      ?auto_106752 - BLOCK
      ?auto_106753 - BLOCK
      ?auto_106754 - BLOCK
      ?auto_106755 - BLOCK
      ?auto_106756 - BLOCK
    )
    :vars
    (
      ?auto_106757 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106751 ) ( ON ?auto_106752 ?auto_106751 ) ( ON ?auto_106753 ?auto_106752 ) ( not ( = ?auto_106751 ?auto_106752 ) ) ( not ( = ?auto_106751 ?auto_106753 ) ) ( not ( = ?auto_106751 ?auto_106754 ) ) ( not ( = ?auto_106751 ?auto_106755 ) ) ( not ( = ?auto_106751 ?auto_106756 ) ) ( not ( = ?auto_106752 ?auto_106753 ) ) ( not ( = ?auto_106752 ?auto_106754 ) ) ( not ( = ?auto_106752 ?auto_106755 ) ) ( not ( = ?auto_106752 ?auto_106756 ) ) ( not ( = ?auto_106753 ?auto_106754 ) ) ( not ( = ?auto_106753 ?auto_106755 ) ) ( not ( = ?auto_106753 ?auto_106756 ) ) ( not ( = ?auto_106754 ?auto_106755 ) ) ( not ( = ?auto_106754 ?auto_106756 ) ) ( not ( = ?auto_106755 ?auto_106756 ) ) ( ON ?auto_106756 ?auto_106757 ) ( not ( = ?auto_106751 ?auto_106757 ) ) ( not ( = ?auto_106752 ?auto_106757 ) ) ( not ( = ?auto_106753 ?auto_106757 ) ) ( not ( = ?auto_106754 ?auto_106757 ) ) ( not ( = ?auto_106755 ?auto_106757 ) ) ( not ( = ?auto_106756 ?auto_106757 ) ) ( ON ?auto_106755 ?auto_106756 ) ( CLEAR ?auto_106755 ) ( ON-TABLE ?auto_106757 ) ( HOLDING ?auto_106754 ) ( CLEAR ?auto_106753 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106751 ?auto_106752 ?auto_106753 ?auto_106754 )
      ( MAKE-6PILE ?auto_106751 ?auto_106752 ?auto_106753 ?auto_106754 ?auto_106755 ?auto_106756 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106758 - BLOCK
      ?auto_106759 - BLOCK
      ?auto_106760 - BLOCK
      ?auto_106761 - BLOCK
      ?auto_106762 - BLOCK
      ?auto_106763 - BLOCK
    )
    :vars
    (
      ?auto_106764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106758 ) ( ON ?auto_106759 ?auto_106758 ) ( ON ?auto_106760 ?auto_106759 ) ( not ( = ?auto_106758 ?auto_106759 ) ) ( not ( = ?auto_106758 ?auto_106760 ) ) ( not ( = ?auto_106758 ?auto_106761 ) ) ( not ( = ?auto_106758 ?auto_106762 ) ) ( not ( = ?auto_106758 ?auto_106763 ) ) ( not ( = ?auto_106759 ?auto_106760 ) ) ( not ( = ?auto_106759 ?auto_106761 ) ) ( not ( = ?auto_106759 ?auto_106762 ) ) ( not ( = ?auto_106759 ?auto_106763 ) ) ( not ( = ?auto_106760 ?auto_106761 ) ) ( not ( = ?auto_106760 ?auto_106762 ) ) ( not ( = ?auto_106760 ?auto_106763 ) ) ( not ( = ?auto_106761 ?auto_106762 ) ) ( not ( = ?auto_106761 ?auto_106763 ) ) ( not ( = ?auto_106762 ?auto_106763 ) ) ( ON ?auto_106763 ?auto_106764 ) ( not ( = ?auto_106758 ?auto_106764 ) ) ( not ( = ?auto_106759 ?auto_106764 ) ) ( not ( = ?auto_106760 ?auto_106764 ) ) ( not ( = ?auto_106761 ?auto_106764 ) ) ( not ( = ?auto_106762 ?auto_106764 ) ) ( not ( = ?auto_106763 ?auto_106764 ) ) ( ON ?auto_106762 ?auto_106763 ) ( ON-TABLE ?auto_106764 ) ( CLEAR ?auto_106760 ) ( ON ?auto_106761 ?auto_106762 ) ( CLEAR ?auto_106761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106764 ?auto_106763 ?auto_106762 )
      ( MAKE-6PILE ?auto_106758 ?auto_106759 ?auto_106760 ?auto_106761 ?auto_106762 ?auto_106763 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106765 - BLOCK
      ?auto_106766 - BLOCK
      ?auto_106767 - BLOCK
      ?auto_106768 - BLOCK
      ?auto_106769 - BLOCK
      ?auto_106770 - BLOCK
    )
    :vars
    (
      ?auto_106771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106765 ) ( ON ?auto_106766 ?auto_106765 ) ( not ( = ?auto_106765 ?auto_106766 ) ) ( not ( = ?auto_106765 ?auto_106767 ) ) ( not ( = ?auto_106765 ?auto_106768 ) ) ( not ( = ?auto_106765 ?auto_106769 ) ) ( not ( = ?auto_106765 ?auto_106770 ) ) ( not ( = ?auto_106766 ?auto_106767 ) ) ( not ( = ?auto_106766 ?auto_106768 ) ) ( not ( = ?auto_106766 ?auto_106769 ) ) ( not ( = ?auto_106766 ?auto_106770 ) ) ( not ( = ?auto_106767 ?auto_106768 ) ) ( not ( = ?auto_106767 ?auto_106769 ) ) ( not ( = ?auto_106767 ?auto_106770 ) ) ( not ( = ?auto_106768 ?auto_106769 ) ) ( not ( = ?auto_106768 ?auto_106770 ) ) ( not ( = ?auto_106769 ?auto_106770 ) ) ( ON ?auto_106770 ?auto_106771 ) ( not ( = ?auto_106765 ?auto_106771 ) ) ( not ( = ?auto_106766 ?auto_106771 ) ) ( not ( = ?auto_106767 ?auto_106771 ) ) ( not ( = ?auto_106768 ?auto_106771 ) ) ( not ( = ?auto_106769 ?auto_106771 ) ) ( not ( = ?auto_106770 ?auto_106771 ) ) ( ON ?auto_106769 ?auto_106770 ) ( ON-TABLE ?auto_106771 ) ( ON ?auto_106768 ?auto_106769 ) ( CLEAR ?auto_106768 ) ( HOLDING ?auto_106767 ) ( CLEAR ?auto_106766 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106765 ?auto_106766 ?auto_106767 )
      ( MAKE-6PILE ?auto_106765 ?auto_106766 ?auto_106767 ?auto_106768 ?auto_106769 ?auto_106770 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106772 - BLOCK
      ?auto_106773 - BLOCK
      ?auto_106774 - BLOCK
      ?auto_106775 - BLOCK
      ?auto_106776 - BLOCK
      ?auto_106777 - BLOCK
    )
    :vars
    (
      ?auto_106778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106772 ) ( ON ?auto_106773 ?auto_106772 ) ( not ( = ?auto_106772 ?auto_106773 ) ) ( not ( = ?auto_106772 ?auto_106774 ) ) ( not ( = ?auto_106772 ?auto_106775 ) ) ( not ( = ?auto_106772 ?auto_106776 ) ) ( not ( = ?auto_106772 ?auto_106777 ) ) ( not ( = ?auto_106773 ?auto_106774 ) ) ( not ( = ?auto_106773 ?auto_106775 ) ) ( not ( = ?auto_106773 ?auto_106776 ) ) ( not ( = ?auto_106773 ?auto_106777 ) ) ( not ( = ?auto_106774 ?auto_106775 ) ) ( not ( = ?auto_106774 ?auto_106776 ) ) ( not ( = ?auto_106774 ?auto_106777 ) ) ( not ( = ?auto_106775 ?auto_106776 ) ) ( not ( = ?auto_106775 ?auto_106777 ) ) ( not ( = ?auto_106776 ?auto_106777 ) ) ( ON ?auto_106777 ?auto_106778 ) ( not ( = ?auto_106772 ?auto_106778 ) ) ( not ( = ?auto_106773 ?auto_106778 ) ) ( not ( = ?auto_106774 ?auto_106778 ) ) ( not ( = ?auto_106775 ?auto_106778 ) ) ( not ( = ?auto_106776 ?auto_106778 ) ) ( not ( = ?auto_106777 ?auto_106778 ) ) ( ON ?auto_106776 ?auto_106777 ) ( ON-TABLE ?auto_106778 ) ( ON ?auto_106775 ?auto_106776 ) ( CLEAR ?auto_106773 ) ( ON ?auto_106774 ?auto_106775 ) ( CLEAR ?auto_106774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106778 ?auto_106777 ?auto_106776 ?auto_106775 )
      ( MAKE-6PILE ?auto_106772 ?auto_106773 ?auto_106774 ?auto_106775 ?auto_106776 ?auto_106777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106779 - BLOCK
      ?auto_106780 - BLOCK
      ?auto_106781 - BLOCK
      ?auto_106782 - BLOCK
      ?auto_106783 - BLOCK
      ?auto_106784 - BLOCK
    )
    :vars
    (
      ?auto_106785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106779 ) ( not ( = ?auto_106779 ?auto_106780 ) ) ( not ( = ?auto_106779 ?auto_106781 ) ) ( not ( = ?auto_106779 ?auto_106782 ) ) ( not ( = ?auto_106779 ?auto_106783 ) ) ( not ( = ?auto_106779 ?auto_106784 ) ) ( not ( = ?auto_106780 ?auto_106781 ) ) ( not ( = ?auto_106780 ?auto_106782 ) ) ( not ( = ?auto_106780 ?auto_106783 ) ) ( not ( = ?auto_106780 ?auto_106784 ) ) ( not ( = ?auto_106781 ?auto_106782 ) ) ( not ( = ?auto_106781 ?auto_106783 ) ) ( not ( = ?auto_106781 ?auto_106784 ) ) ( not ( = ?auto_106782 ?auto_106783 ) ) ( not ( = ?auto_106782 ?auto_106784 ) ) ( not ( = ?auto_106783 ?auto_106784 ) ) ( ON ?auto_106784 ?auto_106785 ) ( not ( = ?auto_106779 ?auto_106785 ) ) ( not ( = ?auto_106780 ?auto_106785 ) ) ( not ( = ?auto_106781 ?auto_106785 ) ) ( not ( = ?auto_106782 ?auto_106785 ) ) ( not ( = ?auto_106783 ?auto_106785 ) ) ( not ( = ?auto_106784 ?auto_106785 ) ) ( ON ?auto_106783 ?auto_106784 ) ( ON-TABLE ?auto_106785 ) ( ON ?auto_106782 ?auto_106783 ) ( ON ?auto_106781 ?auto_106782 ) ( CLEAR ?auto_106781 ) ( HOLDING ?auto_106780 ) ( CLEAR ?auto_106779 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106779 ?auto_106780 )
      ( MAKE-6PILE ?auto_106779 ?auto_106780 ?auto_106781 ?auto_106782 ?auto_106783 ?auto_106784 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106786 - BLOCK
      ?auto_106787 - BLOCK
      ?auto_106788 - BLOCK
      ?auto_106789 - BLOCK
      ?auto_106790 - BLOCK
      ?auto_106791 - BLOCK
    )
    :vars
    (
      ?auto_106792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106786 ) ( not ( = ?auto_106786 ?auto_106787 ) ) ( not ( = ?auto_106786 ?auto_106788 ) ) ( not ( = ?auto_106786 ?auto_106789 ) ) ( not ( = ?auto_106786 ?auto_106790 ) ) ( not ( = ?auto_106786 ?auto_106791 ) ) ( not ( = ?auto_106787 ?auto_106788 ) ) ( not ( = ?auto_106787 ?auto_106789 ) ) ( not ( = ?auto_106787 ?auto_106790 ) ) ( not ( = ?auto_106787 ?auto_106791 ) ) ( not ( = ?auto_106788 ?auto_106789 ) ) ( not ( = ?auto_106788 ?auto_106790 ) ) ( not ( = ?auto_106788 ?auto_106791 ) ) ( not ( = ?auto_106789 ?auto_106790 ) ) ( not ( = ?auto_106789 ?auto_106791 ) ) ( not ( = ?auto_106790 ?auto_106791 ) ) ( ON ?auto_106791 ?auto_106792 ) ( not ( = ?auto_106786 ?auto_106792 ) ) ( not ( = ?auto_106787 ?auto_106792 ) ) ( not ( = ?auto_106788 ?auto_106792 ) ) ( not ( = ?auto_106789 ?auto_106792 ) ) ( not ( = ?auto_106790 ?auto_106792 ) ) ( not ( = ?auto_106791 ?auto_106792 ) ) ( ON ?auto_106790 ?auto_106791 ) ( ON-TABLE ?auto_106792 ) ( ON ?auto_106789 ?auto_106790 ) ( ON ?auto_106788 ?auto_106789 ) ( CLEAR ?auto_106786 ) ( ON ?auto_106787 ?auto_106788 ) ( CLEAR ?auto_106787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106792 ?auto_106791 ?auto_106790 ?auto_106789 ?auto_106788 )
      ( MAKE-6PILE ?auto_106786 ?auto_106787 ?auto_106788 ?auto_106789 ?auto_106790 ?auto_106791 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106793 - BLOCK
      ?auto_106794 - BLOCK
      ?auto_106795 - BLOCK
      ?auto_106796 - BLOCK
      ?auto_106797 - BLOCK
      ?auto_106798 - BLOCK
    )
    :vars
    (
      ?auto_106799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106793 ?auto_106794 ) ) ( not ( = ?auto_106793 ?auto_106795 ) ) ( not ( = ?auto_106793 ?auto_106796 ) ) ( not ( = ?auto_106793 ?auto_106797 ) ) ( not ( = ?auto_106793 ?auto_106798 ) ) ( not ( = ?auto_106794 ?auto_106795 ) ) ( not ( = ?auto_106794 ?auto_106796 ) ) ( not ( = ?auto_106794 ?auto_106797 ) ) ( not ( = ?auto_106794 ?auto_106798 ) ) ( not ( = ?auto_106795 ?auto_106796 ) ) ( not ( = ?auto_106795 ?auto_106797 ) ) ( not ( = ?auto_106795 ?auto_106798 ) ) ( not ( = ?auto_106796 ?auto_106797 ) ) ( not ( = ?auto_106796 ?auto_106798 ) ) ( not ( = ?auto_106797 ?auto_106798 ) ) ( ON ?auto_106798 ?auto_106799 ) ( not ( = ?auto_106793 ?auto_106799 ) ) ( not ( = ?auto_106794 ?auto_106799 ) ) ( not ( = ?auto_106795 ?auto_106799 ) ) ( not ( = ?auto_106796 ?auto_106799 ) ) ( not ( = ?auto_106797 ?auto_106799 ) ) ( not ( = ?auto_106798 ?auto_106799 ) ) ( ON ?auto_106797 ?auto_106798 ) ( ON-TABLE ?auto_106799 ) ( ON ?auto_106796 ?auto_106797 ) ( ON ?auto_106795 ?auto_106796 ) ( ON ?auto_106794 ?auto_106795 ) ( CLEAR ?auto_106794 ) ( HOLDING ?auto_106793 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106793 )
      ( MAKE-6PILE ?auto_106793 ?auto_106794 ?auto_106795 ?auto_106796 ?auto_106797 ?auto_106798 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106800 - BLOCK
      ?auto_106801 - BLOCK
      ?auto_106802 - BLOCK
      ?auto_106803 - BLOCK
      ?auto_106804 - BLOCK
      ?auto_106805 - BLOCK
    )
    :vars
    (
      ?auto_106806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106800 ?auto_106801 ) ) ( not ( = ?auto_106800 ?auto_106802 ) ) ( not ( = ?auto_106800 ?auto_106803 ) ) ( not ( = ?auto_106800 ?auto_106804 ) ) ( not ( = ?auto_106800 ?auto_106805 ) ) ( not ( = ?auto_106801 ?auto_106802 ) ) ( not ( = ?auto_106801 ?auto_106803 ) ) ( not ( = ?auto_106801 ?auto_106804 ) ) ( not ( = ?auto_106801 ?auto_106805 ) ) ( not ( = ?auto_106802 ?auto_106803 ) ) ( not ( = ?auto_106802 ?auto_106804 ) ) ( not ( = ?auto_106802 ?auto_106805 ) ) ( not ( = ?auto_106803 ?auto_106804 ) ) ( not ( = ?auto_106803 ?auto_106805 ) ) ( not ( = ?auto_106804 ?auto_106805 ) ) ( ON ?auto_106805 ?auto_106806 ) ( not ( = ?auto_106800 ?auto_106806 ) ) ( not ( = ?auto_106801 ?auto_106806 ) ) ( not ( = ?auto_106802 ?auto_106806 ) ) ( not ( = ?auto_106803 ?auto_106806 ) ) ( not ( = ?auto_106804 ?auto_106806 ) ) ( not ( = ?auto_106805 ?auto_106806 ) ) ( ON ?auto_106804 ?auto_106805 ) ( ON-TABLE ?auto_106806 ) ( ON ?auto_106803 ?auto_106804 ) ( ON ?auto_106802 ?auto_106803 ) ( ON ?auto_106801 ?auto_106802 ) ( ON ?auto_106800 ?auto_106801 ) ( CLEAR ?auto_106800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106806 ?auto_106805 ?auto_106804 ?auto_106803 ?auto_106802 ?auto_106801 )
      ( MAKE-6PILE ?auto_106800 ?auto_106801 ?auto_106802 ?auto_106803 ?auto_106804 ?auto_106805 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106807 - BLOCK
      ?auto_106808 - BLOCK
      ?auto_106809 - BLOCK
      ?auto_106810 - BLOCK
      ?auto_106811 - BLOCK
      ?auto_106812 - BLOCK
    )
    :vars
    (
      ?auto_106813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106807 ?auto_106808 ) ) ( not ( = ?auto_106807 ?auto_106809 ) ) ( not ( = ?auto_106807 ?auto_106810 ) ) ( not ( = ?auto_106807 ?auto_106811 ) ) ( not ( = ?auto_106807 ?auto_106812 ) ) ( not ( = ?auto_106808 ?auto_106809 ) ) ( not ( = ?auto_106808 ?auto_106810 ) ) ( not ( = ?auto_106808 ?auto_106811 ) ) ( not ( = ?auto_106808 ?auto_106812 ) ) ( not ( = ?auto_106809 ?auto_106810 ) ) ( not ( = ?auto_106809 ?auto_106811 ) ) ( not ( = ?auto_106809 ?auto_106812 ) ) ( not ( = ?auto_106810 ?auto_106811 ) ) ( not ( = ?auto_106810 ?auto_106812 ) ) ( not ( = ?auto_106811 ?auto_106812 ) ) ( ON ?auto_106812 ?auto_106813 ) ( not ( = ?auto_106807 ?auto_106813 ) ) ( not ( = ?auto_106808 ?auto_106813 ) ) ( not ( = ?auto_106809 ?auto_106813 ) ) ( not ( = ?auto_106810 ?auto_106813 ) ) ( not ( = ?auto_106811 ?auto_106813 ) ) ( not ( = ?auto_106812 ?auto_106813 ) ) ( ON ?auto_106811 ?auto_106812 ) ( ON-TABLE ?auto_106813 ) ( ON ?auto_106810 ?auto_106811 ) ( ON ?auto_106809 ?auto_106810 ) ( ON ?auto_106808 ?auto_106809 ) ( HOLDING ?auto_106807 ) ( CLEAR ?auto_106808 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106813 ?auto_106812 ?auto_106811 ?auto_106810 ?auto_106809 ?auto_106808 ?auto_106807 )
      ( MAKE-6PILE ?auto_106807 ?auto_106808 ?auto_106809 ?auto_106810 ?auto_106811 ?auto_106812 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106814 - BLOCK
      ?auto_106815 - BLOCK
      ?auto_106816 - BLOCK
      ?auto_106817 - BLOCK
      ?auto_106818 - BLOCK
      ?auto_106819 - BLOCK
    )
    :vars
    (
      ?auto_106820 - BLOCK
      ?auto_106821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106814 ?auto_106815 ) ) ( not ( = ?auto_106814 ?auto_106816 ) ) ( not ( = ?auto_106814 ?auto_106817 ) ) ( not ( = ?auto_106814 ?auto_106818 ) ) ( not ( = ?auto_106814 ?auto_106819 ) ) ( not ( = ?auto_106815 ?auto_106816 ) ) ( not ( = ?auto_106815 ?auto_106817 ) ) ( not ( = ?auto_106815 ?auto_106818 ) ) ( not ( = ?auto_106815 ?auto_106819 ) ) ( not ( = ?auto_106816 ?auto_106817 ) ) ( not ( = ?auto_106816 ?auto_106818 ) ) ( not ( = ?auto_106816 ?auto_106819 ) ) ( not ( = ?auto_106817 ?auto_106818 ) ) ( not ( = ?auto_106817 ?auto_106819 ) ) ( not ( = ?auto_106818 ?auto_106819 ) ) ( ON ?auto_106819 ?auto_106820 ) ( not ( = ?auto_106814 ?auto_106820 ) ) ( not ( = ?auto_106815 ?auto_106820 ) ) ( not ( = ?auto_106816 ?auto_106820 ) ) ( not ( = ?auto_106817 ?auto_106820 ) ) ( not ( = ?auto_106818 ?auto_106820 ) ) ( not ( = ?auto_106819 ?auto_106820 ) ) ( ON ?auto_106818 ?auto_106819 ) ( ON-TABLE ?auto_106820 ) ( ON ?auto_106817 ?auto_106818 ) ( ON ?auto_106816 ?auto_106817 ) ( ON ?auto_106815 ?auto_106816 ) ( CLEAR ?auto_106815 ) ( ON ?auto_106814 ?auto_106821 ) ( CLEAR ?auto_106814 ) ( HAND-EMPTY ) ( not ( = ?auto_106814 ?auto_106821 ) ) ( not ( = ?auto_106815 ?auto_106821 ) ) ( not ( = ?auto_106816 ?auto_106821 ) ) ( not ( = ?auto_106817 ?auto_106821 ) ) ( not ( = ?auto_106818 ?auto_106821 ) ) ( not ( = ?auto_106819 ?auto_106821 ) ) ( not ( = ?auto_106820 ?auto_106821 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106814 ?auto_106821 )
      ( MAKE-6PILE ?auto_106814 ?auto_106815 ?auto_106816 ?auto_106817 ?auto_106818 ?auto_106819 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106822 - BLOCK
      ?auto_106823 - BLOCK
      ?auto_106824 - BLOCK
      ?auto_106825 - BLOCK
      ?auto_106826 - BLOCK
      ?auto_106827 - BLOCK
    )
    :vars
    (
      ?auto_106829 - BLOCK
      ?auto_106828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106822 ?auto_106823 ) ) ( not ( = ?auto_106822 ?auto_106824 ) ) ( not ( = ?auto_106822 ?auto_106825 ) ) ( not ( = ?auto_106822 ?auto_106826 ) ) ( not ( = ?auto_106822 ?auto_106827 ) ) ( not ( = ?auto_106823 ?auto_106824 ) ) ( not ( = ?auto_106823 ?auto_106825 ) ) ( not ( = ?auto_106823 ?auto_106826 ) ) ( not ( = ?auto_106823 ?auto_106827 ) ) ( not ( = ?auto_106824 ?auto_106825 ) ) ( not ( = ?auto_106824 ?auto_106826 ) ) ( not ( = ?auto_106824 ?auto_106827 ) ) ( not ( = ?auto_106825 ?auto_106826 ) ) ( not ( = ?auto_106825 ?auto_106827 ) ) ( not ( = ?auto_106826 ?auto_106827 ) ) ( ON ?auto_106827 ?auto_106829 ) ( not ( = ?auto_106822 ?auto_106829 ) ) ( not ( = ?auto_106823 ?auto_106829 ) ) ( not ( = ?auto_106824 ?auto_106829 ) ) ( not ( = ?auto_106825 ?auto_106829 ) ) ( not ( = ?auto_106826 ?auto_106829 ) ) ( not ( = ?auto_106827 ?auto_106829 ) ) ( ON ?auto_106826 ?auto_106827 ) ( ON-TABLE ?auto_106829 ) ( ON ?auto_106825 ?auto_106826 ) ( ON ?auto_106824 ?auto_106825 ) ( ON ?auto_106822 ?auto_106828 ) ( CLEAR ?auto_106822 ) ( not ( = ?auto_106822 ?auto_106828 ) ) ( not ( = ?auto_106823 ?auto_106828 ) ) ( not ( = ?auto_106824 ?auto_106828 ) ) ( not ( = ?auto_106825 ?auto_106828 ) ) ( not ( = ?auto_106826 ?auto_106828 ) ) ( not ( = ?auto_106827 ?auto_106828 ) ) ( not ( = ?auto_106829 ?auto_106828 ) ) ( HOLDING ?auto_106823 ) ( CLEAR ?auto_106824 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106829 ?auto_106827 ?auto_106826 ?auto_106825 ?auto_106824 ?auto_106823 )
      ( MAKE-6PILE ?auto_106822 ?auto_106823 ?auto_106824 ?auto_106825 ?auto_106826 ?auto_106827 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106830 - BLOCK
      ?auto_106831 - BLOCK
      ?auto_106832 - BLOCK
      ?auto_106833 - BLOCK
      ?auto_106834 - BLOCK
      ?auto_106835 - BLOCK
    )
    :vars
    (
      ?auto_106837 - BLOCK
      ?auto_106836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106830 ?auto_106831 ) ) ( not ( = ?auto_106830 ?auto_106832 ) ) ( not ( = ?auto_106830 ?auto_106833 ) ) ( not ( = ?auto_106830 ?auto_106834 ) ) ( not ( = ?auto_106830 ?auto_106835 ) ) ( not ( = ?auto_106831 ?auto_106832 ) ) ( not ( = ?auto_106831 ?auto_106833 ) ) ( not ( = ?auto_106831 ?auto_106834 ) ) ( not ( = ?auto_106831 ?auto_106835 ) ) ( not ( = ?auto_106832 ?auto_106833 ) ) ( not ( = ?auto_106832 ?auto_106834 ) ) ( not ( = ?auto_106832 ?auto_106835 ) ) ( not ( = ?auto_106833 ?auto_106834 ) ) ( not ( = ?auto_106833 ?auto_106835 ) ) ( not ( = ?auto_106834 ?auto_106835 ) ) ( ON ?auto_106835 ?auto_106837 ) ( not ( = ?auto_106830 ?auto_106837 ) ) ( not ( = ?auto_106831 ?auto_106837 ) ) ( not ( = ?auto_106832 ?auto_106837 ) ) ( not ( = ?auto_106833 ?auto_106837 ) ) ( not ( = ?auto_106834 ?auto_106837 ) ) ( not ( = ?auto_106835 ?auto_106837 ) ) ( ON ?auto_106834 ?auto_106835 ) ( ON-TABLE ?auto_106837 ) ( ON ?auto_106833 ?auto_106834 ) ( ON ?auto_106832 ?auto_106833 ) ( ON ?auto_106830 ?auto_106836 ) ( not ( = ?auto_106830 ?auto_106836 ) ) ( not ( = ?auto_106831 ?auto_106836 ) ) ( not ( = ?auto_106832 ?auto_106836 ) ) ( not ( = ?auto_106833 ?auto_106836 ) ) ( not ( = ?auto_106834 ?auto_106836 ) ) ( not ( = ?auto_106835 ?auto_106836 ) ) ( not ( = ?auto_106837 ?auto_106836 ) ) ( CLEAR ?auto_106832 ) ( ON ?auto_106831 ?auto_106830 ) ( CLEAR ?auto_106831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106836 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106836 ?auto_106830 )
      ( MAKE-6PILE ?auto_106830 ?auto_106831 ?auto_106832 ?auto_106833 ?auto_106834 ?auto_106835 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106838 - BLOCK
      ?auto_106839 - BLOCK
      ?auto_106840 - BLOCK
      ?auto_106841 - BLOCK
      ?auto_106842 - BLOCK
      ?auto_106843 - BLOCK
    )
    :vars
    (
      ?auto_106845 - BLOCK
      ?auto_106844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106838 ?auto_106839 ) ) ( not ( = ?auto_106838 ?auto_106840 ) ) ( not ( = ?auto_106838 ?auto_106841 ) ) ( not ( = ?auto_106838 ?auto_106842 ) ) ( not ( = ?auto_106838 ?auto_106843 ) ) ( not ( = ?auto_106839 ?auto_106840 ) ) ( not ( = ?auto_106839 ?auto_106841 ) ) ( not ( = ?auto_106839 ?auto_106842 ) ) ( not ( = ?auto_106839 ?auto_106843 ) ) ( not ( = ?auto_106840 ?auto_106841 ) ) ( not ( = ?auto_106840 ?auto_106842 ) ) ( not ( = ?auto_106840 ?auto_106843 ) ) ( not ( = ?auto_106841 ?auto_106842 ) ) ( not ( = ?auto_106841 ?auto_106843 ) ) ( not ( = ?auto_106842 ?auto_106843 ) ) ( ON ?auto_106843 ?auto_106845 ) ( not ( = ?auto_106838 ?auto_106845 ) ) ( not ( = ?auto_106839 ?auto_106845 ) ) ( not ( = ?auto_106840 ?auto_106845 ) ) ( not ( = ?auto_106841 ?auto_106845 ) ) ( not ( = ?auto_106842 ?auto_106845 ) ) ( not ( = ?auto_106843 ?auto_106845 ) ) ( ON ?auto_106842 ?auto_106843 ) ( ON-TABLE ?auto_106845 ) ( ON ?auto_106841 ?auto_106842 ) ( ON ?auto_106838 ?auto_106844 ) ( not ( = ?auto_106838 ?auto_106844 ) ) ( not ( = ?auto_106839 ?auto_106844 ) ) ( not ( = ?auto_106840 ?auto_106844 ) ) ( not ( = ?auto_106841 ?auto_106844 ) ) ( not ( = ?auto_106842 ?auto_106844 ) ) ( not ( = ?auto_106843 ?auto_106844 ) ) ( not ( = ?auto_106845 ?auto_106844 ) ) ( ON ?auto_106839 ?auto_106838 ) ( CLEAR ?auto_106839 ) ( ON-TABLE ?auto_106844 ) ( HOLDING ?auto_106840 ) ( CLEAR ?auto_106841 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106845 ?auto_106843 ?auto_106842 ?auto_106841 ?auto_106840 )
      ( MAKE-6PILE ?auto_106838 ?auto_106839 ?auto_106840 ?auto_106841 ?auto_106842 ?auto_106843 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106846 - BLOCK
      ?auto_106847 - BLOCK
      ?auto_106848 - BLOCK
      ?auto_106849 - BLOCK
      ?auto_106850 - BLOCK
      ?auto_106851 - BLOCK
    )
    :vars
    (
      ?auto_106853 - BLOCK
      ?auto_106852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106846 ?auto_106847 ) ) ( not ( = ?auto_106846 ?auto_106848 ) ) ( not ( = ?auto_106846 ?auto_106849 ) ) ( not ( = ?auto_106846 ?auto_106850 ) ) ( not ( = ?auto_106846 ?auto_106851 ) ) ( not ( = ?auto_106847 ?auto_106848 ) ) ( not ( = ?auto_106847 ?auto_106849 ) ) ( not ( = ?auto_106847 ?auto_106850 ) ) ( not ( = ?auto_106847 ?auto_106851 ) ) ( not ( = ?auto_106848 ?auto_106849 ) ) ( not ( = ?auto_106848 ?auto_106850 ) ) ( not ( = ?auto_106848 ?auto_106851 ) ) ( not ( = ?auto_106849 ?auto_106850 ) ) ( not ( = ?auto_106849 ?auto_106851 ) ) ( not ( = ?auto_106850 ?auto_106851 ) ) ( ON ?auto_106851 ?auto_106853 ) ( not ( = ?auto_106846 ?auto_106853 ) ) ( not ( = ?auto_106847 ?auto_106853 ) ) ( not ( = ?auto_106848 ?auto_106853 ) ) ( not ( = ?auto_106849 ?auto_106853 ) ) ( not ( = ?auto_106850 ?auto_106853 ) ) ( not ( = ?auto_106851 ?auto_106853 ) ) ( ON ?auto_106850 ?auto_106851 ) ( ON-TABLE ?auto_106853 ) ( ON ?auto_106849 ?auto_106850 ) ( ON ?auto_106846 ?auto_106852 ) ( not ( = ?auto_106846 ?auto_106852 ) ) ( not ( = ?auto_106847 ?auto_106852 ) ) ( not ( = ?auto_106848 ?auto_106852 ) ) ( not ( = ?auto_106849 ?auto_106852 ) ) ( not ( = ?auto_106850 ?auto_106852 ) ) ( not ( = ?auto_106851 ?auto_106852 ) ) ( not ( = ?auto_106853 ?auto_106852 ) ) ( ON ?auto_106847 ?auto_106846 ) ( ON-TABLE ?auto_106852 ) ( CLEAR ?auto_106849 ) ( ON ?auto_106848 ?auto_106847 ) ( CLEAR ?auto_106848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106852 ?auto_106846 ?auto_106847 )
      ( MAKE-6PILE ?auto_106846 ?auto_106847 ?auto_106848 ?auto_106849 ?auto_106850 ?auto_106851 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106854 - BLOCK
      ?auto_106855 - BLOCK
      ?auto_106856 - BLOCK
      ?auto_106857 - BLOCK
      ?auto_106858 - BLOCK
      ?auto_106859 - BLOCK
    )
    :vars
    (
      ?auto_106860 - BLOCK
      ?auto_106861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106854 ?auto_106855 ) ) ( not ( = ?auto_106854 ?auto_106856 ) ) ( not ( = ?auto_106854 ?auto_106857 ) ) ( not ( = ?auto_106854 ?auto_106858 ) ) ( not ( = ?auto_106854 ?auto_106859 ) ) ( not ( = ?auto_106855 ?auto_106856 ) ) ( not ( = ?auto_106855 ?auto_106857 ) ) ( not ( = ?auto_106855 ?auto_106858 ) ) ( not ( = ?auto_106855 ?auto_106859 ) ) ( not ( = ?auto_106856 ?auto_106857 ) ) ( not ( = ?auto_106856 ?auto_106858 ) ) ( not ( = ?auto_106856 ?auto_106859 ) ) ( not ( = ?auto_106857 ?auto_106858 ) ) ( not ( = ?auto_106857 ?auto_106859 ) ) ( not ( = ?auto_106858 ?auto_106859 ) ) ( ON ?auto_106859 ?auto_106860 ) ( not ( = ?auto_106854 ?auto_106860 ) ) ( not ( = ?auto_106855 ?auto_106860 ) ) ( not ( = ?auto_106856 ?auto_106860 ) ) ( not ( = ?auto_106857 ?auto_106860 ) ) ( not ( = ?auto_106858 ?auto_106860 ) ) ( not ( = ?auto_106859 ?auto_106860 ) ) ( ON ?auto_106858 ?auto_106859 ) ( ON-TABLE ?auto_106860 ) ( ON ?auto_106854 ?auto_106861 ) ( not ( = ?auto_106854 ?auto_106861 ) ) ( not ( = ?auto_106855 ?auto_106861 ) ) ( not ( = ?auto_106856 ?auto_106861 ) ) ( not ( = ?auto_106857 ?auto_106861 ) ) ( not ( = ?auto_106858 ?auto_106861 ) ) ( not ( = ?auto_106859 ?auto_106861 ) ) ( not ( = ?auto_106860 ?auto_106861 ) ) ( ON ?auto_106855 ?auto_106854 ) ( ON-TABLE ?auto_106861 ) ( ON ?auto_106856 ?auto_106855 ) ( CLEAR ?auto_106856 ) ( HOLDING ?auto_106857 ) ( CLEAR ?auto_106858 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106860 ?auto_106859 ?auto_106858 ?auto_106857 )
      ( MAKE-6PILE ?auto_106854 ?auto_106855 ?auto_106856 ?auto_106857 ?auto_106858 ?auto_106859 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106862 - BLOCK
      ?auto_106863 - BLOCK
      ?auto_106864 - BLOCK
      ?auto_106865 - BLOCK
      ?auto_106866 - BLOCK
      ?auto_106867 - BLOCK
    )
    :vars
    (
      ?auto_106869 - BLOCK
      ?auto_106868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106862 ?auto_106863 ) ) ( not ( = ?auto_106862 ?auto_106864 ) ) ( not ( = ?auto_106862 ?auto_106865 ) ) ( not ( = ?auto_106862 ?auto_106866 ) ) ( not ( = ?auto_106862 ?auto_106867 ) ) ( not ( = ?auto_106863 ?auto_106864 ) ) ( not ( = ?auto_106863 ?auto_106865 ) ) ( not ( = ?auto_106863 ?auto_106866 ) ) ( not ( = ?auto_106863 ?auto_106867 ) ) ( not ( = ?auto_106864 ?auto_106865 ) ) ( not ( = ?auto_106864 ?auto_106866 ) ) ( not ( = ?auto_106864 ?auto_106867 ) ) ( not ( = ?auto_106865 ?auto_106866 ) ) ( not ( = ?auto_106865 ?auto_106867 ) ) ( not ( = ?auto_106866 ?auto_106867 ) ) ( ON ?auto_106867 ?auto_106869 ) ( not ( = ?auto_106862 ?auto_106869 ) ) ( not ( = ?auto_106863 ?auto_106869 ) ) ( not ( = ?auto_106864 ?auto_106869 ) ) ( not ( = ?auto_106865 ?auto_106869 ) ) ( not ( = ?auto_106866 ?auto_106869 ) ) ( not ( = ?auto_106867 ?auto_106869 ) ) ( ON ?auto_106866 ?auto_106867 ) ( ON-TABLE ?auto_106869 ) ( ON ?auto_106862 ?auto_106868 ) ( not ( = ?auto_106862 ?auto_106868 ) ) ( not ( = ?auto_106863 ?auto_106868 ) ) ( not ( = ?auto_106864 ?auto_106868 ) ) ( not ( = ?auto_106865 ?auto_106868 ) ) ( not ( = ?auto_106866 ?auto_106868 ) ) ( not ( = ?auto_106867 ?auto_106868 ) ) ( not ( = ?auto_106869 ?auto_106868 ) ) ( ON ?auto_106863 ?auto_106862 ) ( ON-TABLE ?auto_106868 ) ( ON ?auto_106864 ?auto_106863 ) ( CLEAR ?auto_106866 ) ( ON ?auto_106865 ?auto_106864 ) ( CLEAR ?auto_106865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106868 ?auto_106862 ?auto_106863 ?auto_106864 )
      ( MAKE-6PILE ?auto_106862 ?auto_106863 ?auto_106864 ?auto_106865 ?auto_106866 ?auto_106867 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106870 - BLOCK
      ?auto_106871 - BLOCK
      ?auto_106872 - BLOCK
      ?auto_106873 - BLOCK
      ?auto_106874 - BLOCK
      ?auto_106875 - BLOCK
    )
    :vars
    (
      ?auto_106877 - BLOCK
      ?auto_106876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106870 ?auto_106871 ) ) ( not ( = ?auto_106870 ?auto_106872 ) ) ( not ( = ?auto_106870 ?auto_106873 ) ) ( not ( = ?auto_106870 ?auto_106874 ) ) ( not ( = ?auto_106870 ?auto_106875 ) ) ( not ( = ?auto_106871 ?auto_106872 ) ) ( not ( = ?auto_106871 ?auto_106873 ) ) ( not ( = ?auto_106871 ?auto_106874 ) ) ( not ( = ?auto_106871 ?auto_106875 ) ) ( not ( = ?auto_106872 ?auto_106873 ) ) ( not ( = ?auto_106872 ?auto_106874 ) ) ( not ( = ?auto_106872 ?auto_106875 ) ) ( not ( = ?auto_106873 ?auto_106874 ) ) ( not ( = ?auto_106873 ?auto_106875 ) ) ( not ( = ?auto_106874 ?auto_106875 ) ) ( ON ?auto_106875 ?auto_106877 ) ( not ( = ?auto_106870 ?auto_106877 ) ) ( not ( = ?auto_106871 ?auto_106877 ) ) ( not ( = ?auto_106872 ?auto_106877 ) ) ( not ( = ?auto_106873 ?auto_106877 ) ) ( not ( = ?auto_106874 ?auto_106877 ) ) ( not ( = ?auto_106875 ?auto_106877 ) ) ( ON-TABLE ?auto_106877 ) ( ON ?auto_106870 ?auto_106876 ) ( not ( = ?auto_106870 ?auto_106876 ) ) ( not ( = ?auto_106871 ?auto_106876 ) ) ( not ( = ?auto_106872 ?auto_106876 ) ) ( not ( = ?auto_106873 ?auto_106876 ) ) ( not ( = ?auto_106874 ?auto_106876 ) ) ( not ( = ?auto_106875 ?auto_106876 ) ) ( not ( = ?auto_106877 ?auto_106876 ) ) ( ON ?auto_106871 ?auto_106870 ) ( ON-TABLE ?auto_106876 ) ( ON ?auto_106872 ?auto_106871 ) ( ON ?auto_106873 ?auto_106872 ) ( CLEAR ?auto_106873 ) ( HOLDING ?auto_106874 ) ( CLEAR ?auto_106875 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106877 ?auto_106875 ?auto_106874 )
      ( MAKE-6PILE ?auto_106870 ?auto_106871 ?auto_106872 ?auto_106873 ?auto_106874 ?auto_106875 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106878 - BLOCK
      ?auto_106879 - BLOCK
      ?auto_106880 - BLOCK
      ?auto_106881 - BLOCK
      ?auto_106882 - BLOCK
      ?auto_106883 - BLOCK
    )
    :vars
    (
      ?auto_106884 - BLOCK
      ?auto_106885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106878 ?auto_106879 ) ) ( not ( = ?auto_106878 ?auto_106880 ) ) ( not ( = ?auto_106878 ?auto_106881 ) ) ( not ( = ?auto_106878 ?auto_106882 ) ) ( not ( = ?auto_106878 ?auto_106883 ) ) ( not ( = ?auto_106879 ?auto_106880 ) ) ( not ( = ?auto_106879 ?auto_106881 ) ) ( not ( = ?auto_106879 ?auto_106882 ) ) ( not ( = ?auto_106879 ?auto_106883 ) ) ( not ( = ?auto_106880 ?auto_106881 ) ) ( not ( = ?auto_106880 ?auto_106882 ) ) ( not ( = ?auto_106880 ?auto_106883 ) ) ( not ( = ?auto_106881 ?auto_106882 ) ) ( not ( = ?auto_106881 ?auto_106883 ) ) ( not ( = ?auto_106882 ?auto_106883 ) ) ( ON ?auto_106883 ?auto_106884 ) ( not ( = ?auto_106878 ?auto_106884 ) ) ( not ( = ?auto_106879 ?auto_106884 ) ) ( not ( = ?auto_106880 ?auto_106884 ) ) ( not ( = ?auto_106881 ?auto_106884 ) ) ( not ( = ?auto_106882 ?auto_106884 ) ) ( not ( = ?auto_106883 ?auto_106884 ) ) ( ON-TABLE ?auto_106884 ) ( ON ?auto_106878 ?auto_106885 ) ( not ( = ?auto_106878 ?auto_106885 ) ) ( not ( = ?auto_106879 ?auto_106885 ) ) ( not ( = ?auto_106880 ?auto_106885 ) ) ( not ( = ?auto_106881 ?auto_106885 ) ) ( not ( = ?auto_106882 ?auto_106885 ) ) ( not ( = ?auto_106883 ?auto_106885 ) ) ( not ( = ?auto_106884 ?auto_106885 ) ) ( ON ?auto_106879 ?auto_106878 ) ( ON-TABLE ?auto_106885 ) ( ON ?auto_106880 ?auto_106879 ) ( ON ?auto_106881 ?auto_106880 ) ( CLEAR ?auto_106883 ) ( ON ?auto_106882 ?auto_106881 ) ( CLEAR ?auto_106882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106885 ?auto_106878 ?auto_106879 ?auto_106880 ?auto_106881 )
      ( MAKE-6PILE ?auto_106878 ?auto_106879 ?auto_106880 ?auto_106881 ?auto_106882 ?auto_106883 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106886 - BLOCK
      ?auto_106887 - BLOCK
      ?auto_106888 - BLOCK
      ?auto_106889 - BLOCK
      ?auto_106890 - BLOCK
      ?auto_106891 - BLOCK
    )
    :vars
    (
      ?auto_106893 - BLOCK
      ?auto_106892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106886 ?auto_106887 ) ) ( not ( = ?auto_106886 ?auto_106888 ) ) ( not ( = ?auto_106886 ?auto_106889 ) ) ( not ( = ?auto_106886 ?auto_106890 ) ) ( not ( = ?auto_106886 ?auto_106891 ) ) ( not ( = ?auto_106887 ?auto_106888 ) ) ( not ( = ?auto_106887 ?auto_106889 ) ) ( not ( = ?auto_106887 ?auto_106890 ) ) ( not ( = ?auto_106887 ?auto_106891 ) ) ( not ( = ?auto_106888 ?auto_106889 ) ) ( not ( = ?auto_106888 ?auto_106890 ) ) ( not ( = ?auto_106888 ?auto_106891 ) ) ( not ( = ?auto_106889 ?auto_106890 ) ) ( not ( = ?auto_106889 ?auto_106891 ) ) ( not ( = ?auto_106890 ?auto_106891 ) ) ( not ( = ?auto_106886 ?auto_106893 ) ) ( not ( = ?auto_106887 ?auto_106893 ) ) ( not ( = ?auto_106888 ?auto_106893 ) ) ( not ( = ?auto_106889 ?auto_106893 ) ) ( not ( = ?auto_106890 ?auto_106893 ) ) ( not ( = ?auto_106891 ?auto_106893 ) ) ( ON-TABLE ?auto_106893 ) ( ON ?auto_106886 ?auto_106892 ) ( not ( = ?auto_106886 ?auto_106892 ) ) ( not ( = ?auto_106887 ?auto_106892 ) ) ( not ( = ?auto_106888 ?auto_106892 ) ) ( not ( = ?auto_106889 ?auto_106892 ) ) ( not ( = ?auto_106890 ?auto_106892 ) ) ( not ( = ?auto_106891 ?auto_106892 ) ) ( not ( = ?auto_106893 ?auto_106892 ) ) ( ON ?auto_106887 ?auto_106886 ) ( ON-TABLE ?auto_106892 ) ( ON ?auto_106888 ?auto_106887 ) ( ON ?auto_106889 ?auto_106888 ) ( ON ?auto_106890 ?auto_106889 ) ( CLEAR ?auto_106890 ) ( HOLDING ?auto_106891 ) ( CLEAR ?auto_106893 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106893 ?auto_106891 )
      ( MAKE-6PILE ?auto_106886 ?auto_106887 ?auto_106888 ?auto_106889 ?auto_106890 ?auto_106891 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106894 - BLOCK
      ?auto_106895 - BLOCK
      ?auto_106896 - BLOCK
      ?auto_106897 - BLOCK
      ?auto_106898 - BLOCK
      ?auto_106899 - BLOCK
    )
    :vars
    (
      ?auto_106901 - BLOCK
      ?auto_106900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106894 ?auto_106895 ) ) ( not ( = ?auto_106894 ?auto_106896 ) ) ( not ( = ?auto_106894 ?auto_106897 ) ) ( not ( = ?auto_106894 ?auto_106898 ) ) ( not ( = ?auto_106894 ?auto_106899 ) ) ( not ( = ?auto_106895 ?auto_106896 ) ) ( not ( = ?auto_106895 ?auto_106897 ) ) ( not ( = ?auto_106895 ?auto_106898 ) ) ( not ( = ?auto_106895 ?auto_106899 ) ) ( not ( = ?auto_106896 ?auto_106897 ) ) ( not ( = ?auto_106896 ?auto_106898 ) ) ( not ( = ?auto_106896 ?auto_106899 ) ) ( not ( = ?auto_106897 ?auto_106898 ) ) ( not ( = ?auto_106897 ?auto_106899 ) ) ( not ( = ?auto_106898 ?auto_106899 ) ) ( not ( = ?auto_106894 ?auto_106901 ) ) ( not ( = ?auto_106895 ?auto_106901 ) ) ( not ( = ?auto_106896 ?auto_106901 ) ) ( not ( = ?auto_106897 ?auto_106901 ) ) ( not ( = ?auto_106898 ?auto_106901 ) ) ( not ( = ?auto_106899 ?auto_106901 ) ) ( ON-TABLE ?auto_106901 ) ( ON ?auto_106894 ?auto_106900 ) ( not ( = ?auto_106894 ?auto_106900 ) ) ( not ( = ?auto_106895 ?auto_106900 ) ) ( not ( = ?auto_106896 ?auto_106900 ) ) ( not ( = ?auto_106897 ?auto_106900 ) ) ( not ( = ?auto_106898 ?auto_106900 ) ) ( not ( = ?auto_106899 ?auto_106900 ) ) ( not ( = ?auto_106901 ?auto_106900 ) ) ( ON ?auto_106895 ?auto_106894 ) ( ON-TABLE ?auto_106900 ) ( ON ?auto_106896 ?auto_106895 ) ( ON ?auto_106897 ?auto_106896 ) ( ON ?auto_106898 ?auto_106897 ) ( CLEAR ?auto_106901 ) ( ON ?auto_106899 ?auto_106898 ) ( CLEAR ?auto_106899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106900 ?auto_106894 ?auto_106895 ?auto_106896 ?auto_106897 ?auto_106898 )
      ( MAKE-6PILE ?auto_106894 ?auto_106895 ?auto_106896 ?auto_106897 ?auto_106898 ?auto_106899 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106902 - BLOCK
      ?auto_106903 - BLOCK
      ?auto_106904 - BLOCK
      ?auto_106905 - BLOCK
      ?auto_106906 - BLOCK
      ?auto_106907 - BLOCK
    )
    :vars
    (
      ?auto_106909 - BLOCK
      ?auto_106908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106902 ?auto_106903 ) ) ( not ( = ?auto_106902 ?auto_106904 ) ) ( not ( = ?auto_106902 ?auto_106905 ) ) ( not ( = ?auto_106902 ?auto_106906 ) ) ( not ( = ?auto_106902 ?auto_106907 ) ) ( not ( = ?auto_106903 ?auto_106904 ) ) ( not ( = ?auto_106903 ?auto_106905 ) ) ( not ( = ?auto_106903 ?auto_106906 ) ) ( not ( = ?auto_106903 ?auto_106907 ) ) ( not ( = ?auto_106904 ?auto_106905 ) ) ( not ( = ?auto_106904 ?auto_106906 ) ) ( not ( = ?auto_106904 ?auto_106907 ) ) ( not ( = ?auto_106905 ?auto_106906 ) ) ( not ( = ?auto_106905 ?auto_106907 ) ) ( not ( = ?auto_106906 ?auto_106907 ) ) ( not ( = ?auto_106902 ?auto_106909 ) ) ( not ( = ?auto_106903 ?auto_106909 ) ) ( not ( = ?auto_106904 ?auto_106909 ) ) ( not ( = ?auto_106905 ?auto_106909 ) ) ( not ( = ?auto_106906 ?auto_106909 ) ) ( not ( = ?auto_106907 ?auto_106909 ) ) ( ON ?auto_106902 ?auto_106908 ) ( not ( = ?auto_106902 ?auto_106908 ) ) ( not ( = ?auto_106903 ?auto_106908 ) ) ( not ( = ?auto_106904 ?auto_106908 ) ) ( not ( = ?auto_106905 ?auto_106908 ) ) ( not ( = ?auto_106906 ?auto_106908 ) ) ( not ( = ?auto_106907 ?auto_106908 ) ) ( not ( = ?auto_106909 ?auto_106908 ) ) ( ON ?auto_106903 ?auto_106902 ) ( ON-TABLE ?auto_106908 ) ( ON ?auto_106904 ?auto_106903 ) ( ON ?auto_106905 ?auto_106904 ) ( ON ?auto_106906 ?auto_106905 ) ( ON ?auto_106907 ?auto_106906 ) ( CLEAR ?auto_106907 ) ( HOLDING ?auto_106909 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106909 )
      ( MAKE-6PILE ?auto_106902 ?auto_106903 ?auto_106904 ?auto_106905 ?auto_106906 ?auto_106907 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106910 - BLOCK
      ?auto_106911 - BLOCK
      ?auto_106912 - BLOCK
      ?auto_106913 - BLOCK
      ?auto_106914 - BLOCK
      ?auto_106915 - BLOCK
    )
    :vars
    (
      ?auto_106917 - BLOCK
      ?auto_106916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_106910 ?auto_106911 ) ) ( not ( = ?auto_106910 ?auto_106912 ) ) ( not ( = ?auto_106910 ?auto_106913 ) ) ( not ( = ?auto_106910 ?auto_106914 ) ) ( not ( = ?auto_106910 ?auto_106915 ) ) ( not ( = ?auto_106911 ?auto_106912 ) ) ( not ( = ?auto_106911 ?auto_106913 ) ) ( not ( = ?auto_106911 ?auto_106914 ) ) ( not ( = ?auto_106911 ?auto_106915 ) ) ( not ( = ?auto_106912 ?auto_106913 ) ) ( not ( = ?auto_106912 ?auto_106914 ) ) ( not ( = ?auto_106912 ?auto_106915 ) ) ( not ( = ?auto_106913 ?auto_106914 ) ) ( not ( = ?auto_106913 ?auto_106915 ) ) ( not ( = ?auto_106914 ?auto_106915 ) ) ( not ( = ?auto_106910 ?auto_106917 ) ) ( not ( = ?auto_106911 ?auto_106917 ) ) ( not ( = ?auto_106912 ?auto_106917 ) ) ( not ( = ?auto_106913 ?auto_106917 ) ) ( not ( = ?auto_106914 ?auto_106917 ) ) ( not ( = ?auto_106915 ?auto_106917 ) ) ( ON ?auto_106910 ?auto_106916 ) ( not ( = ?auto_106910 ?auto_106916 ) ) ( not ( = ?auto_106911 ?auto_106916 ) ) ( not ( = ?auto_106912 ?auto_106916 ) ) ( not ( = ?auto_106913 ?auto_106916 ) ) ( not ( = ?auto_106914 ?auto_106916 ) ) ( not ( = ?auto_106915 ?auto_106916 ) ) ( not ( = ?auto_106917 ?auto_106916 ) ) ( ON ?auto_106911 ?auto_106910 ) ( ON-TABLE ?auto_106916 ) ( ON ?auto_106912 ?auto_106911 ) ( ON ?auto_106913 ?auto_106912 ) ( ON ?auto_106914 ?auto_106913 ) ( ON ?auto_106915 ?auto_106914 ) ( ON ?auto_106917 ?auto_106915 ) ( CLEAR ?auto_106917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_106916 ?auto_106910 ?auto_106911 ?auto_106912 ?auto_106913 ?auto_106914 ?auto_106915 )
      ( MAKE-6PILE ?auto_106910 ?auto_106911 ?auto_106912 ?auto_106913 ?auto_106914 ?auto_106915 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106925 - BLOCK
      ?auto_106926 - BLOCK
      ?auto_106927 - BLOCK
      ?auto_106928 - BLOCK
      ?auto_106929 - BLOCK
      ?auto_106930 - BLOCK
      ?auto_106931 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_106931 ) ( CLEAR ?auto_106930 ) ( ON-TABLE ?auto_106925 ) ( ON ?auto_106926 ?auto_106925 ) ( ON ?auto_106927 ?auto_106926 ) ( ON ?auto_106928 ?auto_106927 ) ( ON ?auto_106929 ?auto_106928 ) ( ON ?auto_106930 ?auto_106929 ) ( not ( = ?auto_106925 ?auto_106926 ) ) ( not ( = ?auto_106925 ?auto_106927 ) ) ( not ( = ?auto_106925 ?auto_106928 ) ) ( not ( = ?auto_106925 ?auto_106929 ) ) ( not ( = ?auto_106925 ?auto_106930 ) ) ( not ( = ?auto_106925 ?auto_106931 ) ) ( not ( = ?auto_106926 ?auto_106927 ) ) ( not ( = ?auto_106926 ?auto_106928 ) ) ( not ( = ?auto_106926 ?auto_106929 ) ) ( not ( = ?auto_106926 ?auto_106930 ) ) ( not ( = ?auto_106926 ?auto_106931 ) ) ( not ( = ?auto_106927 ?auto_106928 ) ) ( not ( = ?auto_106927 ?auto_106929 ) ) ( not ( = ?auto_106927 ?auto_106930 ) ) ( not ( = ?auto_106927 ?auto_106931 ) ) ( not ( = ?auto_106928 ?auto_106929 ) ) ( not ( = ?auto_106928 ?auto_106930 ) ) ( not ( = ?auto_106928 ?auto_106931 ) ) ( not ( = ?auto_106929 ?auto_106930 ) ) ( not ( = ?auto_106929 ?auto_106931 ) ) ( not ( = ?auto_106930 ?auto_106931 ) ) )
    :subtasks
    ( ( !STACK ?auto_106931 ?auto_106930 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106932 - BLOCK
      ?auto_106933 - BLOCK
      ?auto_106934 - BLOCK
      ?auto_106935 - BLOCK
      ?auto_106936 - BLOCK
      ?auto_106937 - BLOCK
      ?auto_106938 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_106937 ) ( ON-TABLE ?auto_106932 ) ( ON ?auto_106933 ?auto_106932 ) ( ON ?auto_106934 ?auto_106933 ) ( ON ?auto_106935 ?auto_106934 ) ( ON ?auto_106936 ?auto_106935 ) ( ON ?auto_106937 ?auto_106936 ) ( not ( = ?auto_106932 ?auto_106933 ) ) ( not ( = ?auto_106932 ?auto_106934 ) ) ( not ( = ?auto_106932 ?auto_106935 ) ) ( not ( = ?auto_106932 ?auto_106936 ) ) ( not ( = ?auto_106932 ?auto_106937 ) ) ( not ( = ?auto_106932 ?auto_106938 ) ) ( not ( = ?auto_106933 ?auto_106934 ) ) ( not ( = ?auto_106933 ?auto_106935 ) ) ( not ( = ?auto_106933 ?auto_106936 ) ) ( not ( = ?auto_106933 ?auto_106937 ) ) ( not ( = ?auto_106933 ?auto_106938 ) ) ( not ( = ?auto_106934 ?auto_106935 ) ) ( not ( = ?auto_106934 ?auto_106936 ) ) ( not ( = ?auto_106934 ?auto_106937 ) ) ( not ( = ?auto_106934 ?auto_106938 ) ) ( not ( = ?auto_106935 ?auto_106936 ) ) ( not ( = ?auto_106935 ?auto_106937 ) ) ( not ( = ?auto_106935 ?auto_106938 ) ) ( not ( = ?auto_106936 ?auto_106937 ) ) ( not ( = ?auto_106936 ?auto_106938 ) ) ( not ( = ?auto_106937 ?auto_106938 ) ) ( ON-TABLE ?auto_106938 ) ( CLEAR ?auto_106938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_106938 )
      ( MAKE-7PILE ?auto_106932 ?auto_106933 ?auto_106934 ?auto_106935 ?auto_106936 ?auto_106937 ?auto_106938 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106939 - BLOCK
      ?auto_106940 - BLOCK
      ?auto_106941 - BLOCK
      ?auto_106942 - BLOCK
      ?auto_106943 - BLOCK
      ?auto_106944 - BLOCK
      ?auto_106945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106939 ) ( ON ?auto_106940 ?auto_106939 ) ( ON ?auto_106941 ?auto_106940 ) ( ON ?auto_106942 ?auto_106941 ) ( ON ?auto_106943 ?auto_106942 ) ( not ( = ?auto_106939 ?auto_106940 ) ) ( not ( = ?auto_106939 ?auto_106941 ) ) ( not ( = ?auto_106939 ?auto_106942 ) ) ( not ( = ?auto_106939 ?auto_106943 ) ) ( not ( = ?auto_106939 ?auto_106944 ) ) ( not ( = ?auto_106939 ?auto_106945 ) ) ( not ( = ?auto_106940 ?auto_106941 ) ) ( not ( = ?auto_106940 ?auto_106942 ) ) ( not ( = ?auto_106940 ?auto_106943 ) ) ( not ( = ?auto_106940 ?auto_106944 ) ) ( not ( = ?auto_106940 ?auto_106945 ) ) ( not ( = ?auto_106941 ?auto_106942 ) ) ( not ( = ?auto_106941 ?auto_106943 ) ) ( not ( = ?auto_106941 ?auto_106944 ) ) ( not ( = ?auto_106941 ?auto_106945 ) ) ( not ( = ?auto_106942 ?auto_106943 ) ) ( not ( = ?auto_106942 ?auto_106944 ) ) ( not ( = ?auto_106942 ?auto_106945 ) ) ( not ( = ?auto_106943 ?auto_106944 ) ) ( not ( = ?auto_106943 ?auto_106945 ) ) ( not ( = ?auto_106944 ?auto_106945 ) ) ( ON-TABLE ?auto_106945 ) ( CLEAR ?auto_106945 ) ( HOLDING ?auto_106944 ) ( CLEAR ?auto_106943 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_106939 ?auto_106940 ?auto_106941 ?auto_106942 ?auto_106943 ?auto_106944 )
      ( MAKE-7PILE ?auto_106939 ?auto_106940 ?auto_106941 ?auto_106942 ?auto_106943 ?auto_106944 ?auto_106945 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106946 - BLOCK
      ?auto_106947 - BLOCK
      ?auto_106948 - BLOCK
      ?auto_106949 - BLOCK
      ?auto_106950 - BLOCK
      ?auto_106951 - BLOCK
      ?auto_106952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106946 ) ( ON ?auto_106947 ?auto_106946 ) ( ON ?auto_106948 ?auto_106947 ) ( ON ?auto_106949 ?auto_106948 ) ( ON ?auto_106950 ?auto_106949 ) ( not ( = ?auto_106946 ?auto_106947 ) ) ( not ( = ?auto_106946 ?auto_106948 ) ) ( not ( = ?auto_106946 ?auto_106949 ) ) ( not ( = ?auto_106946 ?auto_106950 ) ) ( not ( = ?auto_106946 ?auto_106951 ) ) ( not ( = ?auto_106946 ?auto_106952 ) ) ( not ( = ?auto_106947 ?auto_106948 ) ) ( not ( = ?auto_106947 ?auto_106949 ) ) ( not ( = ?auto_106947 ?auto_106950 ) ) ( not ( = ?auto_106947 ?auto_106951 ) ) ( not ( = ?auto_106947 ?auto_106952 ) ) ( not ( = ?auto_106948 ?auto_106949 ) ) ( not ( = ?auto_106948 ?auto_106950 ) ) ( not ( = ?auto_106948 ?auto_106951 ) ) ( not ( = ?auto_106948 ?auto_106952 ) ) ( not ( = ?auto_106949 ?auto_106950 ) ) ( not ( = ?auto_106949 ?auto_106951 ) ) ( not ( = ?auto_106949 ?auto_106952 ) ) ( not ( = ?auto_106950 ?auto_106951 ) ) ( not ( = ?auto_106950 ?auto_106952 ) ) ( not ( = ?auto_106951 ?auto_106952 ) ) ( ON-TABLE ?auto_106952 ) ( CLEAR ?auto_106950 ) ( ON ?auto_106951 ?auto_106952 ) ( CLEAR ?auto_106951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106952 )
      ( MAKE-7PILE ?auto_106946 ?auto_106947 ?auto_106948 ?auto_106949 ?auto_106950 ?auto_106951 ?auto_106952 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106953 - BLOCK
      ?auto_106954 - BLOCK
      ?auto_106955 - BLOCK
      ?auto_106956 - BLOCK
      ?auto_106957 - BLOCK
      ?auto_106958 - BLOCK
      ?auto_106959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106953 ) ( ON ?auto_106954 ?auto_106953 ) ( ON ?auto_106955 ?auto_106954 ) ( ON ?auto_106956 ?auto_106955 ) ( not ( = ?auto_106953 ?auto_106954 ) ) ( not ( = ?auto_106953 ?auto_106955 ) ) ( not ( = ?auto_106953 ?auto_106956 ) ) ( not ( = ?auto_106953 ?auto_106957 ) ) ( not ( = ?auto_106953 ?auto_106958 ) ) ( not ( = ?auto_106953 ?auto_106959 ) ) ( not ( = ?auto_106954 ?auto_106955 ) ) ( not ( = ?auto_106954 ?auto_106956 ) ) ( not ( = ?auto_106954 ?auto_106957 ) ) ( not ( = ?auto_106954 ?auto_106958 ) ) ( not ( = ?auto_106954 ?auto_106959 ) ) ( not ( = ?auto_106955 ?auto_106956 ) ) ( not ( = ?auto_106955 ?auto_106957 ) ) ( not ( = ?auto_106955 ?auto_106958 ) ) ( not ( = ?auto_106955 ?auto_106959 ) ) ( not ( = ?auto_106956 ?auto_106957 ) ) ( not ( = ?auto_106956 ?auto_106958 ) ) ( not ( = ?auto_106956 ?auto_106959 ) ) ( not ( = ?auto_106957 ?auto_106958 ) ) ( not ( = ?auto_106957 ?auto_106959 ) ) ( not ( = ?auto_106958 ?auto_106959 ) ) ( ON-TABLE ?auto_106959 ) ( ON ?auto_106958 ?auto_106959 ) ( CLEAR ?auto_106958 ) ( HOLDING ?auto_106957 ) ( CLEAR ?auto_106956 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_106953 ?auto_106954 ?auto_106955 ?auto_106956 ?auto_106957 )
      ( MAKE-7PILE ?auto_106953 ?auto_106954 ?auto_106955 ?auto_106956 ?auto_106957 ?auto_106958 ?auto_106959 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106960 - BLOCK
      ?auto_106961 - BLOCK
      ?auto_106962 - BLOCK
      ?auto_106963 - BLOCK
      ?auto_106964 - BLOCK
      ?auto_106965 - BLOCK
      ?auto_106966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106960 ) ( ON ?auto_106961 ?auto_106960 ) ( ON ?auto_106962 ?auto_106961 ) ( ON ?auto_106963 ?auto_106962 ) ( not ( = ?auto_106960 ?auto_106961 ) ) ( not ( = ?auto_106960 ?auto_106962 ) ) ( not ( = ?auto_106960 ?auto_106963 ) ) ( not ( = ?auto_106960 ?auto_106964 ) ) ( not ( = ?auto_106960 ?auto_106965 ) ) ( not ( = ?auto_106960 ?auto_106966 ) ) ( not ( = ?auto_106961 ?auto_106962 ) ) ( not ( = ?auto_106961 ?auto_106963 ) ) ( not ( = ?auto_106961 ?auto_106964 ) ) ( not ( = ?auto_106961 ?auto_106965 ) ) ( not ( = ?auto_106961 ?auto_106966 ) ) ( not ( = ?auto_106962 ?auto_106963 ) ) ( not ( = ?auto_106962 ?auto_106964 ) ) ( not ( = ?auto_106962 ?auto_106965 ) ) ( not ( = ?auto_106962 ?auto_106966 ) ) ( not ( = ?auto_106963 ?auto_106964 ) ) ( not ( = ?auto_106963 ?auto_106965 ) ) ( not ( = ?auto_106963 ?auto_106966 ) ) ( not ( = ?auto_106964 ?auto_106965 ) ) ( not ( = ?auto_106964 ?auto_106966 ) ) ( not ( = ?auto_106965 ?auto_106966 ) ) ( ON-TABLE ?auto_106966 ) ( ON ?auto_106965 ?auto_106966 ) ( CLEAR ?auto_106963 ) ( ON ?auto_106964 ?auto_106965 ) ( CLEAR ?auto_106964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106966 ?auto_106965 )
      ( MAKE-7PILE ?auto_106960 ?auto_106961 ?auto_106962 ?auto_106963 ?auto_106964 ?auto_106965 ?auto_106966 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106967 - BLOCK
      ?auto_106968 - BLOCK
      ?auto_106969 - BLOCK
      ?auto_106970 - BLOCK
      ?auto_106971 - BLOCK
      ?auto_106972 - BLOCK
      ?auto_106973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106967 ) ( ON ?auto_106968 ?auto_106967 ) ( ON ?auto_106969 ?auto_106968 ) ( not ( = ?auto_106967 ?auto_106968 ) ) ( not ( = ?auto_106967 ?auto_106969 ) ) ( not ( = ?auto_106967 ?auto_106970 ) ) ( not ( = ?auto_106967 ?auto_106971 ) ) ( not ( = ?auto_106967 ?auto_106972 ) ) ( not ( = ?auto_106967 ?auto_106973 ) ) ( not ( = ?auto_106968 ?auto_106969 ) ) ( not ( = ?auto_106968 ?auto_106970 ) ) ( not ( = ?auto_106968 ?auto_106971 ) ) ( not ( = ?auto_106968 ?auto_106972 ) ) ( not ( = ?auto_106968 ?auto_106973 ) ) ( not ( = ?auto_106969 ?auto_106970 ) ) ( not ( = ?auto_106969 ?auto_106971 ) ) ( not ( = ?auto_106969 ?auto_106972 ) ) ( not ( = ?auto_106969 ?auto_106973 ) ) ( not ( = ?auto_106970 ?auto_106971 ) ) ( not ( = ?auto_106970 ?auto_106972 ) ) ( not ( = ?auto_106970 ?auto_106973 ) ) ( not ( = ?auto_106971 ?auto_106972 ) ) ( not ( = ?auto_106971 ?auto_106973 ) ) ( not ( = ?auto_106972 ?auto_106973 ) ) ( ON-TABLE ?auto_106973 ) ( ON ?auto_106972 ?auto_106973 ) ( ON ?auto_106971 ?auto_106972 ) ( CLEAR ?auto_106971 ) ( HOLDING ?auto_106970 ) ( CLEAR ?auto_106969 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106967 ?auto_106968 ?auto_106969 ?auto_106970 )
      ( MAKE-7PILE ?auto_106967 ?auto_106968 ?auto_106969 ?auto_106970 ?auto_106971 ?auto_106972 ?auto_106973 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106974 - BLOCK
      ?auto_106975 - BLOCK
      ?auto_106976 - BLOCK
      ?auto_106977 - BLOCK
      ?auto_106978 - BLOCK
      ?auto_106979 - BLOCK
      ?auto_106980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106974 ) ( ON ?auto_106975 ?auto_106974 ) ( ON ?auto_106976 ?auto_106975 ) ( not ( = ?auto_106974 ?auto_106975 ) ) ( not ( = ?auto_106974 ?auto_106976 ) ) ( not ( = ?auto_106974 ?auto_106977 ) ) ( not ( = ?auto_106974 ?auto_106978 ) ) ( not ( = ?auto_106974 ?auto_106979 ) ) ( not ( = ?auto_106974 ?auto_106980 ) ) ( not ( = ?auto_106975 ?auto_106976 ) ) ( not ( = ?auto_106975 ?auto_106977 ) ) ( not ( = ?auto_106975 ?auto_106978 ) ) ( not ( = ?auto_106975 ?auto_106979 ) ) ( not ( = ?auto_106975 ?auto_106980 ) ) ( not ( = ?auto_106976 ?auto_106977 ) ) ( not ( = ?auto_106976 ?auto_106978 ) ) ( not ( = ?auto_106976 ?auto_106979 ) ) ( not ( = ?auto_106976 ?auto_106980 ) ) ( not ( = ?auto_106977 ?auto_106978 ) ) ( not ( = ?auto_106977 ?auto_106979 ) ) ( not ( = ?auto_106977 ?auto_106980 ) ) ( not ( = ?auto_106978 ?auto_106979 ) ) ( not ( = ?auto_106978 ?auto_106980 ) ) ( not ( = ?auto_106979 ?auto_106980 ) ) ( ON-TABLE ?auto_106980 ) ( ON ?auto_106979 ?auto_106980 ) ( ON ?auto_106978 ?auto_106979 ) ( CLEAR ?auto_106976 ) ( ON ?auto_106977 ?auto_106978 ) ( CLEAR ?auto_106977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106980 ?auto_106979 ?auto_106978 )
      ( MAKE-7PILE ?auto_106974 ?auto_106975 ?auto_106976 ?auto_106977 ?auto_106978 ?auto_106979 ?auto_106980 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106981 - BLOCK
      ?auto_106982 - BLOCK
      ?auto_106983 - BLOCK
      ?auto_106984 - BLOCK
      ?auto_106985 - BLOCK
      ?auto_106986 - BLOCK
      ?auto_106987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106981 ) ( ON ?auto_106982 ?auto_106981 ) ( not ( = ?auto_106981 ?auto_106982 ) ) ( not ( = ?auto_106981 ?auto_106983 ) ) ( not ( = ?auto_106981 ?auto_106984 ) ) ( not ( = ?auto_106981 ?auto_106985 ) ) ( not ( = ?auto_106981 ?auto_106986 ) ) ( not ( = ?auto_106981 ?auto_106987 ) ) ( not ( = ?auto_106982 ?auto_106983 ) ) ( not ( = ?auto_106982 ?auto_106984 ) ) ( not ( = ?auto_106982 ?auto_106985 ) ) ( not ( = ?auto_106982 ?auto_106986 ) ) ( not ( = ?auto_106982 ?auto_106987 ) ) ( not ( = ?auto_106983 ?auto_106984 ) ) ( not ( = ?auto_106983 ?auto_106985 ) ) ( not ( = ?auto_106983 ?auto_106986 ) ) ( not ( = ?auto_106983 ?auto_106987 ) ) ( not ( = ?auto_106984 ?auto_106985 ) ) ( not ( = ?auto_106984 ?auto_106986 ) ) ( not ( = ?auto_106984 ?auto_106987 ) ) ( not ( = ?auto_106985 ?auto_106986 ) ) ( not ( = ?auto_106985 ?auto_106987 ) ) ( not ( = ?auto_106986 ?auto_106987 ) ) ( ON-TABLE ?auto_106987 ) ( ON ?auto_106986 ?auto_106987 ) ( ON ?auto_106985 ?auto_106986 ) ( ON ?auto_106984 ?auto_106985 ) ( CLEAR ?auto_106984 ) ( HOLDING ?auto_106983 ) ( CLEAR ?auto_106982 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106981 ?auto_106982 ?auto_106983 )
      ( MAKE-7PILE ?auto_106981 ?auto_106982 ?auto_106983 ?auto_106984 ?auto_106985 ?auto_106986 ?auto_106987 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106988 - BLOCK
      ?auto_106989 - BLOCK
      ?auto_106990 - BLOCK
      ?auto_106991 - BLOCK
      ?auto_106992 - BLOCK
      ?auto_106993 - BLOCK
      ?auto_106994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106988 ) ( ON ?auto_106989 ?auto_106988 ) ( not ( = ?auto_106988 ?auto_106989 ) ) ( not ( = ?auto_106988 ?auto_106990 ) ) ( not ( = ?auto_106988 ?auto_106991 ) ) ( not ( = ?auto_106988 ?auto_106992 ) ) ( not ( = ?auto_106988 ?auto_106993 ) ) ( not ( = ?auto_106988 ?auto_106994 ) ) ( not ( = ?auto_106989 ?auto_106990 ) ) ( not ( = ?auto_106989 ?auto_106991 ) ) ( not ( = ?auto_106989 ?auto_106992 ) ) ( not ( = ?auto_106989 ?auto_106993 ) ) ( not ( = ?auto_106989 ?auto_106994 ) ) ( not ( = ?auto_106990 ?auto_106991 ) ) ( not ( = ?auto_106990 ?auto_106992 ) ) ( not ( = ?auto_106990 ?auto_106993 ) ) ( not ( = ?auto_106990 ?auto_106994 ) ) ( not ( = ?auto_106991 ?auto_106992 ) ) ( not ( = ?auto_106991 ?auto_106993 ) ) ( not ( = ?auto_106991 ?auto_106994 ) ) ( not ( = ?auto_106992 ?auto_106993 ) ) ( not ( = ?auto_106992 ?auto_106994 ) ) ( not ( = ?auto_106993 ?auto_106994 ) ) ( ON-TABLE ?auto_106994 ) ( ON ?auto_106993 ?auto_106994 ) ( ON ?auto_106992 ?auto_106993 ) ( ON ?auto_106991 ?auto_106992 ) ( CLEAR ?auto_106989 ) ( ON ?auto_106990 ?auto_106991 ) ( CLEAR ?auto_106990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106994 ?auto_106993 ?auto_106992 ?auto_106991 )
      ( MAKE-7PILE ?auto_106988 ?auto_106989 ?auto_106990 ?auto_106991 ?auto_106992 ?auto_106993 ?auto_106994 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_106995 - BLOCK
      ?auto_106996 - BLOCK
      ?auto_106997 - BLOCK
      ?auto_106998 - BLOCK
      ?auto_106999 - BLOCK
      ?auto_107000 - BLOCK
      ?auto_107001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_106995 ) ( not ( = ?auto_106995 ?auto_106996 ) ) ( not ( = ?auto_106995 ?auto_106997 ) ) ( not ( = ?auto_106995 ?auto_106998 ) ) ( not ( = ?auto_106995 ?auto_106999 ) ) ( not ( = ?auto_106995 ?auto_107000 ) ) ( not ( = ?auto_106995 ?auto_107001 ) ) ( not ( = ?auto_106996 ?auto_106997 ) ) ( not ( = ?auto_106996 ?auto_106998 ) ) ( not ( = ?auto_106996 ?auto_106999 ) ) ( not ( = ?auto_106996 ?auto_107000 ) ) ( not ( = ?auto_106996 ?auto_107001 ) ) ( not ( = ?auto_106997 ?auto_106998 ) ) ( not ( = ?auto_106997 ?auto_106999 ) ) ( not ( = ?auto_106997 ?auto_107000 ) ) ( not ( = ?auto_106997 ?auto_107001 ) ) ( not ( = ?auto_106998 ?auto_106999 ) ) ( not ( = ?auto_106998 ?auto_107000 ) ) ( not ( = ?auto_106998 ?auto_107001 ) ) ( not ( = ?auto_106999 ?auto_107000 ) ) ( not ( = ?auto_106999 ?auto_107001 ) ) ( not ( = ?auto_107000 ?auto_107001 ) ) ( ON-TABLE ?auto_107001 ) ( ON ?auto_107000 ?auto_107001 ) ( ON ?auto_106999 ?auto_107000 ) ( ON ?auto_106998 ?auto_106999 ) ( ON ?auto_106997 ?auto_106998 ) ( CLEAR ?auto_106997 ) ( HOLDING ?auto_106996 ) ( CLEAR ?auto_106995 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106995 ?auto_106996 )
      ( MAKE-7PILE ?auto_106995 ?auto_106996 ?auto_106997 ?auto_106998 ?auto_106999 ?auto_107000 ?auto_107001 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107002 - BLOCK
      ?auto_107003 - BLOCK
      ?auto_107004 - BLOCK
      ?auto_107005 - BLOCK
      ?auto_107006 - BLOCK
      ?auto_107007 - BLOCK
      ?auto_107008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_107002 ) ( not ( = ?auto_107002 ?auto_107003 ) ) ( not ( = ?auto_107002 ?auto_107004 ) ) ( not ( = ?auto_107002 ?auto_107005 ) ) ( not ( = ?auto_107002 ?auto_107006 ) ) ( not ( = ?auto_107002 ?auto_107007 ) ) ( not ( = ?auto_107002 ?auto_107008 ) ) ( not ( = ?auto_107003 ?auto_107004 ) ) ( not ( = ?auto_107003 ?auto_107005 ) ) ( not ( = ?auto_107003 ?auto_107006 ) ) ( not ( = ?auto_107003 ?auto_107007 ) ) ( not ( = ?auto_107003 ?auto_107008 ) ) ( not ( = ?auto_107004 ?auto_107005 ) ) ( not ( = ?auto_107004 ?auto_107006 ) ) ( not ( = ?auto_107004 ?auto_107007 ) ) ( not ( = ?auto_107004 ?auto_107008 ) ) ( not ( = ?auto_107005 ?auto_107006 ) ) ( not ( = ?auto_107005 ?auto_107007 ) ) ( not ( = ?auto_107005 ?auto_107008 ) ) ( not ( = ?auto_107006 ?auto_107007 ) ) ( not ( = ?auto_107006 ?auto_107008 ) ) ( not ( = ?auto_107007 ?auto_107008 ) ) ( ON-TABLE ?auto_107008 ) ( ON ?auto_107007 ?auto_107008 ) ( ON ?auto_107006 ?auto_107007 ) ( ON ?auto_107005 ?auto_107006 ) ( ON ?auto_107004 ?auto_107005 ) ( CLEAR ?auto_107002 ) ( ON ?auto_107003 ?auto_107004 ) ( CLEAR ?auto_107003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107008 ?auto_107007 ?auto_107006 ?auto_107005 ?auto_107004 )
      ( MAKE-7PILE ?auto_107002 ?auto_107003 ?auto_107004 ?auto_107005 ?auto_107006 ?auto_107007 ?auto_107008 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107009 - BLOCK
      ?auto_107010 - BLOCK
      ?auto_107011 - BLOCK
      ?auto_107012 - BLOCK
      ?auto_107013 - BLOCK
      ?auto_107014 - BLOCK
      ?auto_107015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107009 ?auto_107010 ) ) ( not ( = ?auto_107009 ?auto_107011 ) ) ( not ( = ?auto_107009 ?auto_107012 ) ) ( not ( = ?auto_107009 ?auto_107013 ) ) ( not ( = ?auto_107009 ?auto_107014 ) ) ( not ( = ?auto_107009 ?auto_107015 ) ) ( not ( = ?auto_107010 ?auto_107011 ) ) ( not ( = ?auto_107010 ?auto_107012 ) ) ( not ( = ?auto_107010 ?auto_107013 ) ) ( not ( = ?auto_107010 ?auto_107014 ) ) ( not ( = ?auto_107010 ?auto_107015 ) ) ( not ( = ?auto_107011 ?auto_107012 ) ) ( not ( = ?auto_107011 ?auto_107013 ) ) ( not ( = ?auto_107011 ?auto_107014 ) ) ( not ( = ?auto_107011 ?auto_107015 ) ) ( not ( = ?auto_107012 ?auto_107013 ) ) ( not ( = ?auto_107012 ?auto_107014 ) ) ( not ( = ?auto_107012 ?auto_107015 ) ) ( not ( = ?auto_107013 ?auto_107014 ) ) ( not ( = ?auto_107013 ?auto_107015 ) ) ( not ( = ?auto_107014 ?auto_107015 ) ) ( ON-TABLE ?auto_107015 ) ( ON ?auto_107014 ?auto_107015 ) ( ON ?auto_107013 ?auto_107014 ) ( ON ?auto_107012 ?auto_107013 ) ( ON ?auto_107011 ?auto_107012 ) ( ON ?auto_107010 ?auto_107011 ) ( CLEAR ?auto_107010 ) ( HOLDING ?auto_107009 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107009 )
      ( MAKE-7PILE ?auto_107009 ?auto_107010 ?auto_107011 ?auto_107012 ?auto_107013 ?auto_107014 ?auto_107015 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107016 - BLOCK
      ?auto_107017 - BLOCK
      ?auto_107018 - BLOCK
      ?auto_107019 - BLOCK
      ?auto_107020 - BLOCK
      ?auto_107021 - BLOCK
      ?auto_107022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107016 ?auto_107017 ) ) ( not ( = ?auto_107016 ?auto_107018 ) ) ( not ( = ?auto_107016 ?auto_107019 ) ) ( not ( = ?auto_107016 ?auto_107020 ) ) ( not ( = ?auto_107016 ?auto_107021 ) ) ( not ( = ?auto_107016 ?auto_107022 ) ) ( not ( = ?auto_107017 ?auto_107018 ) ) ( not ( = ?auto_107017 ?auto_107019 ) ) ( not ( = ?auto_107017 ?auto_107020 ) ) ( not ( = ?auto_107017 ?auto_107021 ) ) ( not ( = ?auto_107017 ?auto_107022 ) ) ( not ( = ?auto_107018 ?auto_107019 ) ) ( not ( = ?auto_107018 ?auto_107020 ) ) ( not ( = ?auto_107018 ?auto_107021 ) ) ( not ( = ?auto_107018 ?auto_107022 ) ) ( not ( = ?auto_107019 ?auto_107020 ) ) ( not ( = ?auto_107019 ?auto_107021 ) ) ( not ( = ?auto_107019 ?auto_107022 ) ) ( not ( = ?auto_107020 ?auto_107021 ) ) ( not ( = ?auto_107020 ?auto_107022 ) ) ( not ( = ?auto_107021 ?auto_107022 ) ) ( ON-TABLE ?auto_107022 ) ( ON ?auto_107021 ?auto_107022 ) ( ON ?auto_107020 ?auto_107021 ) ( ON ?auto_107019 ?auto_107020 ) ( ON ?auto_107018 ?auto_107019 ) ( ON ?auto_107017 ?auto_107018 ) ( ON ?auto_107016 ?auto_107017 ) ( CLEAR ?auto_107016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107022 ?auto_107021 ?auto_107020 ?auto_107019 ?auto_107018 ?auto_107017 )
      ( MAKE-7PILE ?auto_107016 ?auto_107017 ?auto_107018 ?auto_107019 ?auto_107020 ?auto_107021 ?auto_107022 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107023 - BLOCK
      ?auto_107024 - BLOCK
      ?auto_107025 - BLOCK
      ?auto_107026 - BLOCK
      ?auto_107027 - BLOCK
      ?auto_107028 - BLOCK
      ?auto_107029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107023 ?auto_107024 ) ) ( not ( = ?auto_107023 ?auto_107025 ) ) ( not ( = ?auto_107023 ?auto_107026 ) ) ( not ( = ?auto_107023 ?auto_107027 ) ) ( not ( = ?auto_107023 ?auto_107028 ) ) ( not ( = ?auto_107023 ?auto_107029 ) ) ( not ( = ?auto_107024 ?auto_107025 ) ) ( not ( = ?auto_107024 ?auto_107026 ) ) ( not ( = ?auto_107024 ?auto_107027 ) ) ( not ( = ?auto_107024 ?auto_107028 ) ) ( not ( = ?auto_107024 ?auto_107029 ) ) ( not ( = ?auto_107025 ?auto_107026 ) ) ( not ( = ?auto_107025 ?auto_107027 ) ) ( not ( = ?auto_107025 ?auto_107028 ) ) ( not ( = ?auto_107025 ?auto_107029 ) ) ( not ( = ?auto_107026 ?auto_107027 ) ) ( not ( = ?auto_107026 ?auto_107028 ) ) ( not ( = ?auto_107026 ?auto_107029 ) ) ( not ( = ?auto_107027 ?auto_107028 ) ) ( not ( = ?auto_107027 ?auto_107029 ) ) ( not ( = ?auto_107028 ?auto_107029 ) ) ( ON-TABLE ?auto_107029 ) ( ON ?auto_107028 ?auto_107029 ) ( ON ?auto_107027 ?auto_107028 ) ( ON ?auto_107026 ?auto_107027 ) ( ON ?auto_107025 ?auto_107026 ) ( ON ?auto_107024 ?auto_107025 ) ( HOLDING ?auto_107023 ) ( CLEAR ?auto_107024 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107029 ?auto_107028 ?auto_107027 ?auto_107026 ?auto_107025 ?auto_107024 ?auto_107023 )
      ( MAKE-7PILE ?auto_107023 ?auto_107024 ?auto_107025 ?auto_107026 ?auto_107027 ?auto_107028 ?auto_107029 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107030 - BLOCK
      ?auto_107031 - BLOCK
      ?auto_107032 - BLOCK
      ?auto_107033 - BLOCK
      ?auto_107034 - BLOCK
      ?auto_107035 - BLOCK
      ?auto_107036 - BLOCK
    )
    :vars
    (
      ?auto_107037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107030 ?auto_107031 ) ) ( not ( = ?auto_107030 ?auto_107032 ) ) ( not ( = ?auto_107030 ?auto_107033 ) ) ( not ( = ?auto_107030 ?auto_107034 ) ) ( not ( = ?auto_107030 ?auto_107035 ) ) ( not ( = ?auto_107030 ?auto_107036 ) ) ( not ( = ?auto_107031 ?auto_107032 ) ) ( not ( = ?auto_107031 ?auto_107033 ) ) ( not ( = ?auto_107031 ?auto_107034 ) ) ( not ( = ?auto_107031 ?auto_107035 ) ) ( not ( = ?auto_107031 ?auto_107036 ) ) ( not ( = ?auto_107032 ?auto_107033 ) ) ( not ( = ?auto_107032 ?auto_107034 ) ) ( not ( = ?auto_107032 ?auto_107035 ) ) ( not ( = ?auto_107032 ?auto_107036 ) ) ( not ( = ?auto_107033 ?auto_107034 ) ) ( not ( = ?auto_107033 ?auto_107035 ) ) ( not ( = ?auto_107033 ?auto_107036 ) ) ( not ( = ?auto_107034 ?auto_107035 ) ) ( not ( = ?auto_107034 ?auto_107036 ) ) ( not ( = ?auto_107035 ?auto_107036 ) ) ( ON-TABLE ?auto_107036 ) ( ON ?auto_107035 ?auto_107036 ) ( ON ?auto_107034 ?auto_107035 ) ( ON ?auto_107033 ?auto_107034 ) ( ON ?auto_107032 ?auto_107033 ) ( ON ?auto_107031 ?auto_107032 ) ( CLEAR ?auto_107031 ) ( ON ?auto_107030 ?auto_107037 ) ( CLEAR ?auto_107030 ) ( HAND-EMPTY ) ( not ( = ?auto_107030 ?auto_107037 ) ) ( not ( = ?auto_107031 ?auto_107037 ) ) ( not ( = ?auto_107032 ?auto_107037 ) ) ( not ( = ?auto_107033 ?auto_107037 ) ) ( not ( = ?auto_107034 ?auto_107037 ) ) ( not ( = ?auto_107035 ?auto_107037 ) ) ( not ( = ?auto_107036 ?auto_107037 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107030 ?auto_107037 )
      ( MAKE-7PILE ?auto_107030 ?auto_107031 ?auto_107032 ?auto_107033 ?auto_107034 ?auto_107035 ?auto_107036 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107038 - BLOCK
      ?auto_107039 - BLOCK
      ?auto_107040 - BLOCK
      ?auto_107041 - BLOCK
      ?auto_107042 - BLOCK
      ?auto_107043 - BLOCK
      ?auto_107044 - BLOCK
    )
    :vars
    (
      ?auto_107045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107038 ?auto_107039 ) ) ( not ( = ?auto_107038 ?auto_107040 ) ) ( not ( = ?auto_107038 ?auto_107041 ) ) ( not ( = ?auto_107038 ?auto_107042 ) ) ( not ( = ?auto_107038 ?auto_107043 ) ) ( not ( = ?auto_107038 ?auto_107044 ) ) ( not ( = ?auto_107039 ?auto_107040 ) ) ( not ( = ?auto_107039 ?auto_107041 ) ) ( not ( = ?auto_107039 ?auto_107042 ) ) ( not ( = ?auto_107039 ?auto_107043 ) ) ( not ( = ?auto_107039 ?auto_107044 ) ) ( not ( = ?auto_107040 ?auto_107041 ) ) ( not ( = ?auto_107040 ?auto_107042 ) ) ( not ( = ?auto_107040 ?auto_107043 ) ) ( not ( = ?auto_107040 ?auto_107044 ) ) ( not ( = ?auto_107041 ?auto_107042 ) ) ( not ( = ?auto_107041 ?auto_107043 ) ) ( not ( = ?auto_107041 ?auto_107044 ) ) ( not ( = ?auto_107042 ?auto_107043 ) ) ( not ( = ?auto_107042 ?auto_107044 ) ) ( not ( = ?auto_107043 ?auto_107044 ) ) ( ON-TABLE ?auto_107044 ) ( ON ?auto_107043 ?auto_107044 ) ( ON ?auto_107042 ?auto_107043 ) ( ON ?auto_107041 ?auto_107042 ) ( ON ?auto_107040 ?auto_107041 ) ( ON ?auto_107038 ?auto_107045 ) ( CLEAR ?auto_107038 ) ( not ( = ?auto_107038 ?auto_107045 ) ) ( not ( = ?auto_107039 ?auto_107045 ) ) ( not ( = ?auto_107040 ?auto_107045 ) ) ( not ( = ?auto_107041 ?auto_107045 ) ) ( not ( = ?auto_107042 ?auto_107045 ) ) ( not ( = ?auto_107043 ?auto_107045 ) ) ( not ( = ?auto_107044 ?auto_107045 ) ) ( HOLDING ?auto_107039 ) ( CLEAR ?auto_107040 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107044 ?auto_107043 ?auto_107042 ?auto_107041 ?auto_107040 ?auto_107039 )
      ( MAKE-7PILE ?auto_107038 ?auto_107039 ?auto_107040 ?auto_107041 ?auto_107042 ?auto_107043 ?auto_107044 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107046 - BLOCK
      ?auto_107047 - BLOCK
      ?auto_107048 - BLOCK
      ?auto_107049 - BLOCK
      ?auto_107050 - BLOCK
      ?auto_107051 - BLOCK
      ?auto_107052 - BLOCK
    )
    :vars
    (
      ?auto_107053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107046 ?auto_107047 ) ) ( not ( = ?auto_107046 ?auto_107048 ) ) ( not ( = ?auto_107046 ?auto_107049 ) ) ( not ( = ?auto_107046 ?auto_107050 ) ) ( not ( = ?auto_107046 ?auto_107051 ) ) ( not ( = ?auto_107046 ?auto_107052 ) ) ( not ( = ?auto_107047 ?auto_107048 ) ) ( not ( = ?auto_107047 ?auto_107049 ) ) ( not ( = ?auto_107047 ?auto_107050 ) ) ( not ( = ?auto_107047 ?auto_107051 ) ) ( not ( = ?auto_107047 ?auto_107052 ) ) ( not ( = ?auto_107048 ?auto_107049 ) ) ( not ( = ?auto_107048 ?auto_107050 ) ) ( not ( = ?auto_107048 ?auto_107051 ) ) ( not ( = ?auto_107048 ?auto_107052 ) ) ( not ( = ?auto_107049 ?auto_107050 ) ) ( not ( = ?auto_107049 ?auto_107051 ) ) ( not ( = ?auto_107049 ?auto_107052 ) ) ( not ( = ?auto_107050 ?auto_107051 ) ) ( not ( = ?auto_107050 ?auto_107052 ) ) ( not ( = ?auto_107051 ?auto_107052 ) ) ( ON-TABLE ?auto_107052 ) ( ON ?auto_107051 ?auto_107052 ) ( ON ?auto_107050 ?auto_107051 ) ( ON ?auto_107049 ?auto_107050 ) ( ON ?auto_107048 ?auto_107049 ) ( ON ?auto_107046 ?auto_107053 ) ( not ( = ?auto_107046 ?auto_107053 ) ) ( not ( = ?auto_107047 ?auto_107053 ) ) ( not ( = ?auto_107048 ?auto_107053 ) ) ( not ( = ?auto_107049 ?auto_107053 ) ) ( not ( = ?auto_107050 ?auto_107053 ) ) ( not ( = ?auto_107051 ?auto_107053 ) ) ( not ( = ?auto_107052 ?auto_107053 ) ) ( CLEAR ?auto_107048 ) ( ON ?auto_107047 ?auto_107046 ) ( CLEAR ?auto_107047 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107053 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107053 ?auto_107046 )
      ( MAKE-7PILE ?auto_107046 ?auto_107047 ?auto_107048 ?auto_107049 ?auto_107050 ?auto_107051 ?auto_107052 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107054 - BLOCK
      ?auto_107055 - BLOCK
      ?auto_107056 - BLOCK
      ?auto_107057 - BLOCK
      ?auto_107058 - BLOCK
      ?auto_107059 - BLOCK
      ?auto_107060 - BLOCK
    )
    :vars
    (
      ?auto_107061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107054 ?auto_107055 ) ) ( not ( = ?auto_107054 ?auto_107056 ) ) ( not ( = ?auto_107054 ?auto_107057 ) ) ( not ( = ?auto_107054 ?auto_107058 ) ) ( not ( = ?auto_107054 ?auto_107059 ) ) ( not ( = ?auto_107054 ?auto_107060 ) ) ( not ( = ?auto_107055 ?auto_107056 ) ) ( not ( = ?auto_107055 ?auto_107057 ) ) ( not ( = ?auto_107055 ?auto_107058 ) ) ( not ( = ?auto_107055 ?auto_107059 ) ) ( not ( = ?auto_107055 ?auto_107060 ) ) ( not ( = ?auto_107056 ?auto_107057 ) ) ( not ( = ?auto_107056 ?auto_107058 ) ) ( not ( = ?auto_107056 ?auto_107059 ) ) ( not ( = ?auto_107056 ?auto_107060 ) ) ( not ( = ?auto_107057 ?auto_107058 ) ) ( not ( = ?auto_107057 ?auto_107059 ) ) ( not ( = ?auto_107057 ?auto_107060 ) ) ( not ( = ?auto_107058 ?auto_107059 ) ) ( not ( = ?auto_107058 ?auto_107060 ) ) ( not ( = ?auto_107059 ?auto_107060 ) ) ( ON-TABLE ?auto_107060 ) ( ON ?auto_107059 ?auto_107060 ) ( ON ?auto_107058 ?auto_107059 ) ( ON ?auto_107057 ?auto_107058 ) ( ON ?auto_107054 ?auto_107061 ) ( not ( = ?auto_107054 ?auto_107061 ) ) ( not ( = ?auto_107055 ?auto_107061 ) ) ( not ( = ?auto_107056 ?auto_107061 ) ) ( not ( = ?auto_107057 ?auto_107061 ) ) ( not ( = ?auto_107058 ?auto_107061 ) ) ( not ( = ?auto_107059 ?auto_107061 ) ) ( not ( = ?auto_107060 ?auto_107061 ) ) ( ON ?auto_107055 ?auto_107054 ) ( CLEAR ?auto_107055 ) ( ON-TABLE ?auto_107061 ) ( HOLDING ?auto_107056 ) ( CLEAR ?auto_107057 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107060 ?auto_107059 ?auto_107058 ?auto_107057 ?auto_107056 )
      ( MAKE-7PILE ?auto_107054 ?auto_107055 ?auto_107056 ?auto_107057 ?auto_107058 ?auto_107059 ?auto_107060 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107062 - BLOCK
      ?auto_107063 - BLOCK
      ?auto_107064 - BLOCK
      ?auto_107065 - BLOCK
      ?auto_107066 - BLOCK
      ?auto_107067 - BLOCK
      ?auto_107068 - BLOCK
    )
    :vars
    (
      ?auto_107069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107062 ?auto_107063 ) ) ( not ( = ?auto_107062 ?auto_107064 ) ) ( not ( = ?auto_107062 ?auto_107065 ) ) ( not ( = ?auto_107062 ?auto_107066 ) ) ( not ( = ?auto_107062 ?auto_107067 ) ) ( not ( = ?auto_107062 ?auto_107068 ) ) ( not ( = ?auto_107063 ?auto_107064 ) ) ( not ( = ?auto_107063 ?auto_107065 ) ) ( not ( = ?auto_107063 ?auto_107066 ) ) ( not ( = ?auto_107063 ?auto_107067 ) ) ( not ( = ?auto_107063 ?auto_107068 ) ) ( not ( = ?auto_107064 ?auto_107065 ) ) ( not ( = ?auto_107064 ?auto_107066 ) ) ( not ( = ?auto_107064 ?auto_107067 ) ) ( not ( = ?auto_107064 ?auto_107068 ) ) ( not ( = ?auto_107065 ?auto_107066 ) ) ( not ( = ?auto_107065 ?auto_107067 ) ) ( not ( = ?auto_107065 ?auto_107068 ) ) ( not ( = ?auto_107066 ?auto_107067 ) ) ( not ( = ?auto_107066 ?auto_107068 ) ) ( not ( = ?auto_107067 ?auto_107068 ) ) ( ON-TABLE ?auto_107068 ) ( ON ?auto_107067 ?auto_107068 ) ( ON ?auto_107066 ?auto_107067 ) ( ON ?auto_107065 ?auto_107066 ) ( ON ?auto_107062 ?auto_107069 ) ( not ( = ?auto_107062 ?auto_107069 ) ) ( not ( = ?auto_107063 ?auto_107069 ) ) ( not ( = ?auto_107064 ?auto_107069 ) ) ( not ( = ?auto_107065 ?auto_107069 ) ) ( not ( = ?auto_107066 ?auto_107069 ) ) ( not ( = ?auto_107067 ?auto_107069 ) ) ( not ( = ?auto_107068 ?auto_107069 ) ) ( ON ?auto_107063 ?auto_107062 ) ( ON-TABLE ?auto_107069 ) ( CLEAR ?auto_107065 ) ( ON ?auto_107064 ?auto_107063 ) ( CLEAR ?auto_107064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107069 ?auto_107062 ?auto_107063 )
      ( MAKE-7PILE ?auto_107062 ?auto_107063 ?auto_107064 ?auto_107065 ?auto_107066 ?auto_107067 ?auto_107068 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107070 - BLOCK
      ?auto_107071 - BLOCK
      ?auto_107072 - BLOCK
      ?auto_107073 - BLOCK
      ?auto_107074 - BLOCK
      ?auto_107075 - BLOCK
      ?auto_107076 - BLOCK
    )
    :vars
    (
      ?auto_107077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107070 ?auto_107071 ) ) ( not ( = ?auto_107070 ?auto_107072 ) ) ( not ( = ?auto_107070 ?auto_107073 ) ) ( not ( = ?auto_107070 ?auto_107074 ) ) ( not ( = ?auto_107070 ?auto_107075 ) ) ( not ( = ?auto_107070 ?auto_107076 ) ) ( not ( = ?auto_107071 ?auto_107072 ) ) ( not ( = ?auto_107071 ?auto_107073 ) ) ( not ( = ?auto_107071 ?auto_107074 ) ) ( not ( = ?auto_107071 ?auto_107075 ) ) ( not ( = ?auto_107071 ?auto_107076 ) ) ( not ( = ?auto_107072 ?auto_107073 ) ) ( not ( = ?auto_107072 ?auto_107074 ) ) ( not ( = ?auto_107072 ?auto_107075 ) ) ( not ( = ?auto_107072 ?auto_107076 ) ) ( not ( = ?auto_107073 ?auto_107074 ) ) ( not ( = ?auto_107073 ?auto_107075 ) ) ( not ( = ?auto_107073 ?auto_107076 ) ) ( not ( = ?auto_107074 ?auto_107075 ) ) ( not ( = ?auto_107074 ?auto_107076 ) ) ( not ( = ?auto_107075 ?auto_107076 ) ) ( ON-TABLE ?auto_107076 ) ( ON ?auto_107075 ?auto_107076 ) ( ON ?auto_107074 ?auto_107075 ) ( ON ?auto_107070 ?auto_107077 ) ( not ( = ?auto_107070 ?auto_107077 ) ) ( not ( = ?auto_107071 ?auto_107077 ) ) ( not ( = ?auto_107072 ?auto_107077 ) ) ( not ( = ?auto_107073 ?auto_107077 ) ) ( not ( = ?auto_107074 ?auto_107077 ) ) ( not ( = ?auto_107075 ?auto_107077 ) ) ( not ( = ?auto_107076 ?auto_107077 ) ) ( ON ?auto_107071 ?auto_107070 ) ( ON-TABLE ?auto_107077 ) ( ON ?auto_107072 ?auto_107071 ) ( CLEAR ?auto_107072 ) ( HOLDING ?auto_107073 ) ( CLEAR ?auto_107074 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107076 ?auto_107075 ?auto_107074 ?auto_107073 )
      ( MAKE-7PILE ?auto_107070 ?auto_107071 ?auto_107072 ?auto_107073 ?auto_107074 ?auto_107075 ?auto_107076 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107078 - BLOCK
      ?auto_107079 - BLOCK
      ?auto_107080 - BLOCK
      ?auto_107081 - BLOCK
      ?auto_107082 - BLOCK
      ?auto_107083 - BLOCK
      ?auto_107084 - BLOCK
    )
    :vars
    (
      ?auto_107085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107078 ?auto_107079 ) ) ( not ( = ?auto_107078 ?auto_107080 ) ) ( not ( = ?auto_107078 ?auto_107081 ) ) ( not ( = ?auto_107078 ?auto_107082 ) ) ( not ( = ?auto_107078 ?auto_107083 ) ) ( not ( = ?auto_107078 ?auto_107084 ) ) ( not ( = ?auto_107079 ?auto_107080 ) ) ( not ( = ?auto_107079 ?auto_107081 ) ) ( not ( = ?auto_107079 ?auto_107082 ) ) ( not ( = ?auto_107079 ?auto_107083 ) ) ( not ( = ?auto_107079 ?auto_107084 ) ) ( not ( = ?auto_107080 ?auto_107081 ) ) ( not ( = ?auto_107080 ?auto_107082 ) ) ( not ( = ?auto_107080 ?auto_107083 ) ) ( not ( = ?auto_107080 ?auto_107084 ) ) ( not ( = ?auto_107081 ?auto_107082 ) ) ( not ( = ?auto_107081 ?auto_107083 ) ) ( not ( = ?auto_107081 ?auto_107084 ) ) ( not ( = ?auto_107082 ?auto_107083 ) ) ( not ( = ?auto_107082 ?auto_107084 ) ) ( not ( = ?auto_107083 ?auto_107084 ) ) ( ON-TABLE ?auto_107084 ) ( ON ?auto_107083 ?auto_107084 ) ( ON ?auto_107082 ?auto_107083 ) ( ON ?auto_107078 ?auto_107085 ) ( not ( = ?auto_107078 ?auto_107085 ) ) ( not ( = ?auto_107079 ?auto_107085 ) ) ( not ( = ?auto_107080 ?auto_107085 ) ) ( not ( = ?auto_107081 ?auto_107085 ) ) ( not ( = ?auto_107082 ?auto_107085 ) ) ( not ( = ?auto_107083 ?auto_107085 ) ) ( not ( = ?auto_107084 ?auto_107085 ) ) ( ON ?auto_107079 ?auto_107078 ) ( ON-TABLE ?auto_107085 ) ( ON ?auto_107080 ?auto_107079 ) ( CLEAR ?auto_107082 ) ( ON ?auto_107081 ?auto_107080 ) ( CLEAR ?auto_107081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107085 ?auto_107078 ?auto_107079 ?auto_107080 )
      ( MAKE-7PILE ?auto_107078 ?auto_107079 ?auto_107080 ?auto_107081 ?auto_107082 ?auto_107083 ?auto_107084 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107086 - BLOCK
      ?auto_107087 - BLOCK
      ?auto_107088 - BLOCK
      ?auto_107089 - BLOCK
      ?auto_107090 - BLOCK
      ?auto_107091 - BLOCK
      ?auto_107092 - BLOCK
    )
    :vars
    (
      ?auto_107093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107086 ?auto_107087 ) ) ( not ( = ?auto_107086 ?auto_107088 ) ) ( not ( = ?auto_107086 ?auto_107089 ) ) ( not ( = ?auto_107086 ?auto_107090 ) ) ( not ( = ?auto_107086 ?auto_107091 ) ) ( not ( = ?auto_107086 ?auto_107092 ) ) ( not ( = ?auto_107087 ?auto_107088 ) ) ( not ( = ?auto_107087 ?auto_107089 ) ) ( not ( = ?auto_107087 ?auto_107090 ) ) ( not ( = ?auto_107087 ?auto_107091 ) ) ( not ( = ?auto_107087 ?auto_107092 ) ) ( not ( = ?auto_107088 ?auto_107089 ) ) ( not ( = ?auto_107088 ?auto_107090 ) ) ( not ( = ?auto_107088 ?auto_107091 ) ) ( not ( = ?auto_107088 ?auto_107092 ) ) ( not ( = ?auto_107089 ?auto_107090 ) ) ( not ( = ?auto_107089 ?auto_107091 ) ) ( not ( = ?auto_107089 ?auto_107092 ) ) ( not ( = ?auto_107090 ?auto_107091 ) ) ( not ( = ?auto_107090 ?auto_107092 ) ) ( not ( = ?auto_107091 ?auto_107092 ) ) ( ON-TABLE ?auto_107092 ) ( ON ?auto_107091 ?auto_107092 ) ( ON ?auto_107086 ?auto_107093 ) ( not ( = ?auto_107086 ?auto_107093 ) ) ( not ( = ?auto_107087 ?auto_107093 ) ) ( not ( = ?auto_107088 ?auto_107093 ) ) ( not ( = ?auto_107089 ?auto_107093 ) ) ( not ( = ?auto_107090 ?auto_107093 ) ) ( not ( = ?auto_107091 ?auto_107093 ) ) ( not ( = ?auto_107092 ?auto_107093 ) ) ( ON ?auto_107087 ?auto_107086 ) ( ON-TABLE ?auto_107093 ) ( ON ?auto_107088 ?auto_107087 ) ( ON ?auto_107089 ?auto_107088 ) ( CLEAR ?auto_107089 ) ( HOLDING ?auto_107090 ) ( CLEAR ?auto_107091 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107092 ?auto_107091 ?auto_107090 )
      ( MAKE-7PILE ?auto_107086 ?auto_107087 ?auto_107088 ?auto_107089 ?auto_107090 ?auto_107091 ?auto_107092 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107094 - BLOCK
      ?auto_107095 - BLOCK
      ?auto_107096 - BLOCK
      ?auto_107097 - BLOCK
      ?auto_107098 - BLOCK
      ?auto_107099 - BLOCK
      ?auto_107100 - BLOCK
    )
    :vars
    (
      ?auto_107101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107094 ?auto_107095 ) ) ( not ( = ?auto_107094 ?auto_107096 ) ) ( not ( = ?auto_107094 ?auto_107097 ) ) ( not ( = ?auto_107094 ?auto_107098 ) ) ( not ( = ?auto_107094 ?auto_107099 ) ) ( not ( = ?auto_107094 ?auto_107100 ) ) ( not ( = ?auto_107095 ?auto_107096 ) ) ( not ( = ?auto_107095 ?auto_107097 ) ) ( not ( = ?auto_107095 ?auto_107098 ) ) ( not ( = ?auto_107095 ?auto_107099 ) ) ( not ( = ?auto_107095 ?auto_107100 ) ) ( not ( = ?auto_107096 ?auto_107097 ) ) ( not ( = ?auto_107096 ?auto_107098 ) ) ( not ( = ?auto_107096 ?auto_107099 ) ) ( not ( = ?auto_107096 ?auto_107100 ) ) ( not ( = ?auto_107097 ?auto_107098 ) ) ( not ( = ?auto_107097 ?auto_107099 ) ) ( not ( = ?auto_107097 ?auto_107100 ) ) ( not ( = ?auto_107098 ?auto_107099 ) ) ( not ( = ?auto_107098 ?auto_107100 ) ) ( not ( = ?auto_107099 ?auto_107100 ) ) ( ON-TABLE ?auto_107100 ) ( ON ?auto_107099 ?auto_107100 ) ( ON ?auto_107094 ?auto_107101 ) ( not ( = ?auto_107094 ?auto_107101 ) ) ( not ( = ?auto_107095 ?auto_107101 ) ) ( not ( = ?auto_107096 ?auto_107101 ) ) ( not ( = ?auto_107097 ?auto_107101 ) ) ( not ( = ?auto_107098 ?auto_107101 ) ) ( not ( = ?auto_107099 ?auto_107101 ) ) ( not ( = ?auto_107100 ?auto_107101 ) ) ( ON ?auto_107095 ?auto_107094 ) ( ON-TABLE ?auto_107101 ) ( ON ?auto_107096 ?auto_107095 ) ( ON ?auto_107097 ?auto_107096 ) ( CLEAR ?auto_107099 ) ( ON ?auto_107098 ?auto_107097 ) ( CLEAR ?auto_107098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107101 ?auto_107094 ?auto_107095 ?auto_107096 ?auto_107097 )
      ( MAKE-7PILE ?auto_107094 ?auto_107095 ?auto_107096 ?auto_107097 ?auto_107098 ?auto_107099 ?auto_107100 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107102 - BLOCK
      ?auto_107103 - BLOCK
      ?auto_107104 - BLOCK
      ?auto_107105 - BLOCK
      ?auto_107106 - BLOCK
      ?auto_107107 - BLOCK
      ?auto_107108 - BLOCK
    )
    :vars
    (
      ?auto_107109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107102 ?auto_107103 ) ) ( not ( = ?auto_107102 ?auto_107104 ) ) ( not ( = ?auto_107102 ?auto_107105 ) ) ( not ( = ?auto_107102 ?auto_107106 ) ) ( not ( = ?auto_107102 ?auto_107107 ) ) ( not ( = ?auto_107102 ?auto_107108 ) ) ( not ( = ?auto_107103 ?auto_107104 ) ) ( not ( = ?auto_107103 ?auto_107105 ) ) ( not ( = ?auto_107103 ?auto_107106 ) ) ( not ( = ?auto_107103 ?auto_107107 ) ) ( not ( = ?auto_107103 ?auto_107108 ) ) ( not ( = ?auto_107104 ?auto_107105 ) ) ( not ( = ?auto_107104 ?auto_107106 ) ) ( not ( = ?auto_107104 ?auto_107107 ) ) ( not ( = ?auto_107104 ?auto_107108 ) ) ( not ( = ?auto_107105 ?auto_107106 ) ) ( not ( = ?auto_107105 ?auto_107107 ) ) ( not ( = ?auto_107105 ?auto_107108 ) ) ( not ( = ?auto_107106 ?auto_107107 ) ) ( not ( = ?auto_107106 ?auto_107108 ) ) ( not ( = ?auto_107107 ?auto_107108 ) ) ( ON-TABLE ?auto_107108 ) ( ON ?auto_107102 ?auto_107109 ) ( not ( = ?auto_107102 ?auto_107109 ) ) ( not ( = ?auto_107103 ?auto_107109 ) ) ( not ( = ?auto_107104 ?auto_107109 ) ) ( not ( = ?auto_107105 ?auto_107109 ) ) ( not ( = ?auto_107106 ?auto_107109 ) ) ( not ( = ?auto_107107 ?auto_107109 ) ) ( not ( = ?auto_107108 ?auto_107109 ) ) ( ON ?auto_107103 ?auto_107102 ) ( ON-TABLE ?auto_107109 ) ( ON ?auto_107104 ?auto_107103 ) ( ON ?auto_107105 ?auto_107104 ) ( ON ?auto_107106 ?auto_107105 ) ( CLEAR ?auto_107106 ) ( HOLDING ?auto_107107 ) ( CLEAR ?auto_107108 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107108 ?auto_107107 )
      ( MAKE-7PILE ?auto_107102 ?auto_107103 ?auto_107104 ?auto_107105 ?auto_107106 ?auto_107107 ?auto_107108 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107110 - BLOCK
      ?auto_107111 - BLOCK
      ?auto_107112 - BLOCK
      ?auto_107113 - BLOCK
      ?auto_107114 - BLOCK
      ?auto_107115 - BLOCK
      ?auto_107116 - BLOCK
    )
    :vars
    (
      ?auto_107117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107110 ?auto_107111 ) ) ( not ( = ?auto_107110 ?auto_107112 ) ) ( not ( = ?auto_107110 ?auto_107113 ) ) ( not ( = ?auto_107110 ?auto_107114 ) ) ( not ( = ?auto_107110 ?auto_107115 ) ) ( not ( = ?auto_107110 ?auto_107116 ) ) ( not ( = ?auto_107111 ?auto_107112 ) ) ( not ( = ?auto_107111 ?auto_107113 ) ) ( not ( = ?auto_107111 ?auto_107114 ) ) ( not ( = ?auto_107111 ?auto_107115 ) ) ( not ( = ?auto_107111 ?auto_107116 ) ) ( not ( = ?auto_107112 ?auto_107113 ) ) ( not ( = ?auto_107112 ?auto_107114 ) ) ( not ( = ?auto_107112 ?auto_107115 ) ) ( not ( = ?auto_107112 ?auto_107116 ) ) ( not ( = ?auto_107113 ?auto_107114 ) ) ( not ( = ?auto_107113 ?auto_107115 ) ) ( not ( = ?auto_107113 ?auto_107116 ) ) ( not ( = ?auto_107114 ?auto_107115 ) ) ( not ( = ?auto_107114 ?auto_107116 ) ) ( not ( = ?auto_107115 ?auto_107116 ) ) ( ON-TABLE ?auto_107116 ) ( ON ?auto_107110 ?auto_107117 ) ( not ( = ?auto_107110 ?auto_107117 ) ) ( not ( = ?auto_107111 ?auto_107117 ) ) ( not ( = ?auto_107112 ?auto_107117 ) ) ( not ( = ?auto_107113 ?auto_107117 ) ) ( not ( = ?auto_107114 ?auto_107117 ) ) ( not ( = ?auto_107115 ?auto_107117 ) ) ( not ( = ?auto_107116 ?auto_107117 ) ) ( ON ?auto_107111 ?auto_107110 ) ( ON-TABLE ?auto_107117 ) ( ON ?auto_107112 ?auto_107111 ) ( ON ?auto_107113 ?auto_107112 ) ( ON ?auto_107114 ?auto_107113 ) ( CLEAR ?auto_107116 ) ( ON ?auto_107115 ?auto_107114 ) ( CLEAR ?auto_107115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107117 ?auto_107110 ?auto_107111 ?auto_107112 ?auto_107113 ?auto_107114 )
      ( MAKE-7PILE ?auto_107110 ?auto_107111 ?auto_107112 ?auto_107113 ?auto_107114 ?auto_107115 ?auto_107116 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107118 - BLOCK
      ?auto_107119 - BLOCK
      ?auto_107120 - BLOCK
      ?auto_107121 - BLOCK
      ?auto_107122 - BLOCK
      ?auto_107123 - BLOCK
      ?auto_107124 - BLOCK
    )
    :vars
    (
      ?auto_107125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107118 ?auto_107119 ) ) ( not ( = ?auto_107118 ?auto_107120 ) ) ( not ( = ?auto_107118 ?auto_107121 ) ) ( not ( = ?auto_107118 ?auto_107122 ) ) ( not ( = ?auto_107118 ?auto_107123 ) ) ( not ( = ?auto_107118 ?auto_107124 ) ) ( not ( = ?auto_107119 ?auto_107120 ) ) ( not ( = ?auto_107119 ?auto_107121 ) ) ( not ( = ?auto_107119 ?auto_107122 ) ) ( not ( = ?auto_107119 ?auto_107123 ) ) ( not ( = ?auto_107119 ?auto_107124 ) ) ( not ( = ?auto_107120 ?auto_107121 ) ) ( not ( = ?auto_107120 ?auto_107122 ) ) ( not ( = ?auto_107120 ?auto_107123 ) ) ( not ( = ?auto_107120 ?auto_107124 ) ) ( not ( = ?auto_107121 ?auto_107122 ) ) ( not ( = ?auto_107121 ?auto_107123 ) ) ( not ( = ?auto_107121 ?auto_107124 ) ) ( not ( = ?auto_107122 ?auto_107123 ) ) ( not ( = ?auto_107122 ?auto_107124 ) ) ( not ( = ?auto_107123 ?auto_107124 ) ) ( ON ?auto_107118 ?auto_107125 ) ( not ( = ?auto_107118 ?auto_107125 ) ) ( not ( = ?auto_107119 ?auto_107125 ) ) ( not ( = ?auto_107120 ?auto_107125 ) ) ( not ( = ?auto_107121 ?auto_107125 ) ) ( not ( = ?auto_107122 ?auto_107125 ) ) ( not ( = ?auto_107123 ?auto_107125 ) ) ( not ( = ?auto_107124 ?auto_107125 ) ) ( ON ?auto_107119 ?auto_107118 ) ( ON-TABLE ?auto_107125 ) ( ON ?auto_107120 ?auto_107119 ) ( ON ?auto_107121 ?auto_107120 ) ( ON ?auto_107122 ?auto_107121 ) ( ON ?auto_107123 ?auto_107122 ) ( CLEAR ?auto_107123 ) ( HOLDING ?auto_107124 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107124 )
      ( MAKE-7PILE ?auto_107118 ?auto_107119 ?auto_107120 ?auto_107121 ?auto_107122 ?auto_107123 ?auto_107124 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107126 - BLOCK
      ?auto_107127 - BLOCK
      ?auto_107128 - BLOCK
      ?auto_107129 - BLOCK
      ?auto_107130 - BLOCK
      ?auto_107131 - BLOCK
      ?auto_107132 - BLOCK
    )
    :vars
    (
      ?auto_107133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_107126 ?auto_107127 ) ) ( not ( = ?auto_107126 ?auto_107128 ) ) ( not ( = ?auto_107126 ?auto_107129 ) ) ( not ( = ?auto_107126 ?auto_107130 ) ) ( not ( = ?auto_107126 ?auto_107131 ) ) ( not ( = ?auto_107126 ?auto_107132 ) ) ( not ( = ?auto_107127 ?auto_107128 ) ) ( not ( = ?auto_107127 ?auto_107129 ) ) ( not ( = ?auto_107127 ?auto_107130 ) ) ( not ( = ?auto_107127 ?auto_107131 ) ) ( not ( = ?auto_107127 ?auto_107132 ) ) ( not ( = ?auto_107128 ?auto_107129 ) ) ( not ( = ?auto_107128 ?auto_107130 ) ) ( not ( = ?auto_107128 ?auto_107131 ) ) ( not ( = ?auto_107128 ?auto_107132 ) ) ( not ( = ?auto_107129 ?auto_107130 ) ) ( not ( = ?auto_107129 ?auto_107131 ) ) ( not ( = ?auto_107129 ?auto_107132 ) ) ( not ( = ?auto_107130 ?auto_107131 ) ) ( not ( = ?auto_107130 ?auto_107132 ) ) ( not ( = ?auto_107131 ?auto_107132 ) ) ( ON ?auto_107126 ?auto_107133 ) ( not ( = ?auto_107126 ?auto_107133 ) ) ( not ( = ?auto_107127 ?auto_107133 ) ) ( not ( = ?auto_107128 ?auto_107133 ) ) ( not ( = ?auto_107129 ?auto_107133 ) ) ( not ( = ?auto_107130 ?auto_107133 ) ) ( not ( = ?auto_107131 ?auto_107133 ) ) ( not ( = ?auto_107132 ?auto_107133 ) ) ( ON ?auto_107127 ?auto_107126 ) ( ON-TABLE ?auto_107133 ) ( ON ?auto_107128 ?auto_107127 ) ( ON ?auto_107129 ?auto_107128 ) ( ON ?auto_107130 ?auto_107129 ) ( ON ?auto_107131 ?auto_107130 ) ( ON ?auto_107132 ?auto_107131 ) ( CLEAR ?auto_107132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107133 ?auto_107126 ?auto_107127 ?auto_107128 ?auto_107129 ?auto_107130 ?auto_107131 )
      ( MAKE-7PILE ?auto_107126 ?auto_107127 ?auto_107128 ?auto_107129 ?auto_107130 ?auto_107131 ?auto_107132 ) )
  )

)

