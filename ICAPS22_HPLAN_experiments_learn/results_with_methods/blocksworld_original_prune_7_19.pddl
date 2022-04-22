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
      ?auto_114365 - BLOCK
      ?auto_114366 - BLOCK
      ?auto_114367 - BLOCK
      ?auto_114368 - BLOCK
      ?auto_114369 - BLOCK
      ?auto_114370 - BLOCK
      ?auto_114371 - BLOCK
    )
    :vars
    (
      ?auto_114372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114372 ?auto_114371 ) ( CLEAR ?auto_114372 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114365 ) ( ON ?auto_114366 ?auto_114365 ) ( ON ?auto_114367 ?auto_114366 ) ( ON ?auto_114368 ?auto_114367 ) ( ON ?auto_114369 ?auto_114368 ) ( ON ?auto_114370 ?auto_114369 ) ( ON ?auto_114371 ?auto_114370 ) ( not ( = ?auto_114365 ?auto_114366 ) ) ( not ( = ?auto_114365 ?auto_114367 ) ) ( not ( = ?auto_114365 ?auto_114368 ) ) ( not ( = ?auto_114365 ?auto_114369 ) ) ( not ( = ?auto_114365 ?auto_114370 ) ) ( not ( = ?auto_114365 ?auto_114371 ) ) ( not ( = ?auto_114365 ?auto_114372 ) ) ( not ( = ?auto_114366 ?auto_114367 ) ) ( not ( = ?auto_114366 ?auto_114368 ) ) ( not ( = ?auto_114366 ?auto_114369 ) ) ( not ( = ?auto_114366 ?auto_114370 ) ) ( not ( = ?auto_114366 ?auto_114371 ) ) ( not ( = ?auto_114366 ?auto_114372 ) ) ( not ( = ?auto_114367 ?auto_114368 ) ) ( not ( = ?auto_114367 ?auto_114369 ) ) ( not ( = ?auto_114367 ?auto_114370 ) ) ( not ( = ?auto_114367 ?auto_114371 ) ) ( not ( = ?auto_114367 ?auto_114372 ) ) ( not ( = ?auto_114368 ?auto_114369 ) ) ( not ( = ?auto_114368 ?auto_114370 ) ) ( not ( = ?auto_114368 ?auto_114371 ) ) ( not ( = ?auto_114368 ?auto_114372 ) ) ( not ( = ?auto_114369 ?auto_114370 ) ) ( not ( = ?auto_114369 ?auto_114371 ) ) ( not ( = ?auto_114369 ?auto_114372 ) ) ( not ( = ?auto_114370 ?auto_114371 ) ) ( not ( = ?auto_114370 ?auto_114372 ) ) ( not ( = ?auto_114371 ?auto_114372 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114372 ?auto_114371 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_114374 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_114374 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_114374 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_114375 - BLOCK
    )
    :vars
    (
      ?auto_114376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114375 ?auto_114376 ) ( CLEAR ?auto_114375 ) ( HAND-EMPTY ) ( not ( = ?auto_114375 ?auto_114376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114375 ?auto_114376 )
      ( MAKE-1PILE ?auto_114375 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114383 - BLOCK
      ?auto_114384 - BLOCK
      ?auto_114385 - BLOCK
      ?auto_114386 - BLOCK
      ?auto_114387 - BLOCK
      ?auto_114388 - BLOCK
    )
    :vars
    (
      ?auto_114389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114389 ?auto_114388 ) ( CLEAR ?auto_114389 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114383 ) ( ON ?auto_114384 ?auto_114383 ) ( ON ?auto_114385 ?auto_114384 ) ( ON ?auto_114386 ?auto_114385 ) ( ON ?auto_114387 ?auto_114386 ) ( ON ?auto_114388 ?auto_114387 ) ( not ( = ?auto_114383 ?auto_114384 ) ) ( not ( = ?auto_114383 ?auto_114385 ) ) ( not ( = ?auto_114383 ?auto_114386 ) ) ( not ( = ?auto_114383 ?auto_114387 ) ) ( not ( = ?auto_114383 ?auto_114388 ) ) ( not ( = ?auto_114383 ?auto_114389 ) ) ( not ( = ?auto_114384 ?auto_114385 ) ) ( not ( = ?auto_114384 ?auto_114386 ) ) ( not ( = ?auto_114384 ?auto_114387 ) ) ( not ( = ?auto_114384 ?auto_114388 ) ) ( not ( = ?auto_114384 ?auto_114389 ) ) ( not ( = ?auto_114385 ?auto_114386 ) ) ( not ( = ?auto_114385 ?auto_114387 ) ) ( not ( = ?auto_114385 ?auto_114388 ) ) ( not ( = ?auto_114385 ?auto_114389 ) ) ( not ( = ?auto_114386 ?auto_114387 ) ) ( not ( = ?auto_114386 ?auto_114388 ) ) ( not ( = ?auto_114386 ?auto_114389 ) ) ( not ( = ?auto_114387 ?auto_114388 ) ) ( not ( = ?auto_114387 ?auto_114389 ) ) ( not ( = ?auto_114388 ?auto_114389 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114389 ?auto_114388 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114390 - BLOCK
      ?auto_114391 - BLOCK
      ?auto_114392 - BLOCK
      ?auto_114393 - BLOCK
      ?auto_114394 - BLOCK
      ?auto_114395 - BLOCK
    )
    :vars
    (
      ?auto_114396 - BLOCK
      ?auto_114397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114396 ?auto_114395 ) ( CLEAR ?auto_114396 ) ( ON-TABLE ?auto_114390 ) ( ON ?auto_114391 ?auto_114390 ) ( ON ?auto_114392 ?auto_114391 ) ( ON ?auto_114393 ?auto_114392 ) ( ON ?auto_114394 ?auto_114393 ) ( ON ?auto_114395 ?auto_114394 ) ( not ( = ?auto_114390 ?auto_114391 ) ) ( not ( = ?auto_114390 ?auto_114392 ) ) ( not ( = ?auto_114390 ?auto_114393 ) ) ( not ( = ?auto_114390 ?auto_114394 ) ) ( not ( = ?auto_114390 ?auto_114395 ) ) ( not ( = ?auto_114390 ?auto_114396 ) ) ( not ( = ?auto_114391 ?auto_114392 ) ) ( not ( = ?auto_114391 ?auto_114393 ) ) ( not ( = ?auto_114391 ?auto_114394 ) ) ( not ( = ?auto_114391 ?auto_114395 ) ) ( not ( = ?auto_114391 ?auto_114396 ) ) ( not ( = ?auto_114392 ?auto_114393 ) ) ( not ( = ?auto_114392 ?auto_114394 ) ) ( not ( = ?auto_114392 ?auto_114395 ) ) ( not ( = ?auto_114392 ?auto_114396 ) ) ( not ( = ?auto_114393 ?auto_114394 ) ) ( not ( = ?auto_114393 ?auto_114395 ) ) ( not ( = ?auto_114393 ?auto_114396 ) ) ( not ( = ?auto_114394 ?auto_114395 ) ) ( not ( = ?auto_114394 ?auto_114396 ) ) ( not ( = ?auto_114395 ?auto_114396 ) ) ( HOLDING ?auto_114397 ) ( not ( = ?auto_114390 ?auto_114397 ) ) ( not ( = ?auto_114391 ?auto_114397 ) ) ( not ( = ?auto_114392 ?auto_114397 ) ) ( not ( = ?auto_114393 ?auto_114397 ) ) ( not ( = ?auto_114394 ?auto_114397 ) ) ( not ( = ?auto_114395 ?auto_114397 ) ) ( not ( = ?auto_114396 ?auto_114397 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_114397 )
      ( MAKE-6PILE ?auto_114390 ?auto_114391 ?auto_114392 ?auto_114393 ?auto_114394 ?auto_114395 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114398 - BLOCK
      ?auto_114399 - BLOCK
      ?auto_114400 - BLOCK
      ?auto_114401 - BLOCK
      ?auto_114402 - BLOCK
      ?auto_114403 - BLOCK
    )
    :vars
    (
      ?auto_114404 - BLOCK
      ?auto_114405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114404 ?auto_114403 ) ( ON-TABLE ?auto_114398 ) ( ON ?auto_114399 ?auto_114398 ) ( ON ?auto_114400 ?auto_114399 ) ( ON ?auto_114401 ?auto_114400 ) ( ON ?auto_114402 ?auto_114401 ) ( ON ?auto_114403 ?auto_114402 ) ( not ( = ?auto_114398 ?auto_114399 ) ) ( not ( = ?auto_114398 ?auto_114400 ) ) ( not ( = ?auto_114398 ?auto_114401 ) ) ( not ( = ?auto_114398 ?auto_114402 ) ) ( not ( = ?auto_114398 ?auto_114403 ) ) ( not ( = ?auto_114398 ?auto_114404 ) ) ( not ( = ?auto_114399 ?auto_114400 ) ) ( not ( = ?auto_114399 ?auto_114401 ) ) ( not ( = ?auto_114399 ?auto_114402 ) ) ( not ( = ?auto_114399 ?auto_114403 ) ) ( not ( = ?auto_114399 ?auto_114404 ) ) ( not ( = ?auto_114400 ?auto_114401 ) ) ( not ( = ?auto_114400 ?auto_114402 ) ) ( not ( = ?auto_114400 ?auto_114403 ) ) ( not ( = ?auto_114400 ?auto_114404 ) ) ( not ( = ?auto_114401 ?auto_114402 ) ) ( not ( = ?auto_114401 ?auto_114403 ) ) ( not ( = ?auto_114401 ?auto_114404 ) ) ( not ( = ?auto_114402 ?auto_114403 ) ) ( not ( = ?auto_114402 ?auto_114404 ) ) ( not ( = ?auto_114403 ?auto_114404 ) ) ( not ( = ?auto_114398 ?auto_114405 ) ) ( not ( = ?auto_114399 ?auto_114405 ) ) ( not ( = ?auto_114400 ?auto_114405 ) ) ( not ( = ?auto_114401 ?auto_114405 ) ) ( not ( = ?auto_114402 ?auto_114405 ) ) ( not ( = ?auto_114403 ?auto_114405 ) ) ( not ( = ?auto_114404 ?auto_114405 ) ) ( ON ?auto_114405 ?auto_114404 ) ( CLEAR ?auto_114405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114398 ?auto_114399 ?auto_114400 ?auto_114401 ?auto_114402 ?auto_114403 ?auto_114404 )
      ( MAKE-6PILE ?auto_114398 ?auto_114399 ?auto_114400 ?auto_114401 ?auto_114402 ?auto_114403 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114408 - BLOCK
      ?auto_114409 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_114409 ) ( CLEAR ?auto_114408 ) ( ON-TABLE ?auto_114408 ) ( not ( = ?auto_114408 ?auto_114409 ) ) )
    :subtasks
    ( ( !STACK ?auto_114409 ?auto_114408 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114410 - BLOCK
      ?auto_114411 - BLOCK
    )
    :vars
    (
      ?auto_114412 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_114410 ) ( ON-TABLE ?auto_114410 ) ( not ( = ?auto_114410 ?auto_114411 ) ) ( ON ?auto_114411 ?auto_114412 ) ( CLEAR ?auto_114411 ) ( HAND-EMPTY ) ( not ( = ?auto_114410 ?auto_114412 ) ) ( not ( = ?auto_114411 ?auto_114412 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114411 ?auto_114412 )
      ( MAKE-2PILE ?auto_114410 ?auto_114411 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114413 - BLOCK
      ?auto_114414 - BLOCK
    )
    :vars
    (
      ?auto_114415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114413 ?auto_114414 ) ) ( ON ?auto_114414 ?auto_114415 ) ( CLEAR ?auto_114414 ) ( not ( = ?auto_114413 ?auto_114415 ) ) ( not ( = ?auto_114414 ?auto_114415 ) ) ( HOLDING ?auto_114413 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114413 )
      ( MAKE-2PILE ?auto_114413 ?auto_114414 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114416 - BLOCK
      ?auto_114417 - BLOCK
    )
    :vars
    (
      ?auto_114418 - BLOCK
      ?auto_114421 - BLOCK
      ?auto_114423 - BLOCK
      ?auto_114419 - BLOCK
      ?auto_114420 - BLOCK
      ?auto_114422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114416 ?auto_114417 ) ) ( ON ?auto_114417 ?auto_114418 ) ( not ( = ?auto_114416 ?auto_114418 ) ) ( not ( = ?auto_114417 ?auto_114418 ) ) ( ON ?auto_114416 ?auto_114417 ) ( CLEAR ?auto_114416 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114421 ) ( ON ?auto_114423 ?auto_114421 ) ( ON ?auto_114419 ?auto_114423 ) ( ON ?auto_114420 ?auto_114419 ) ( ON ?auto_114422 ?auto_114420 ) ( ON ?auto_114418 ?auto_114422 ) ( not ( = ?auto_114421 ?auto_114423 ) ) ( not ( = ?auto_114421 ?auto_114419 ) ) ( not ( = ?auto_114421 ?auto_114420 ) ) ( not ( = ?auto_114421 ?auto_114422 ) ) ( not ( = ?auto_114421 ?auto_114418 ) ) ( not ( = ?auto_114421 ?auto_114417 ) ) ( not ( = ?auto_114421 ?auto_114416 ) ) ( not ( = ?auto_114423 ?auto_114419 ) ) ( not ( = ?auto_114423 ?auto_114420 ) ) ( not ( = ?auto_114423 ?auto_114422 ) ) ( not ( = ?auto_114423 ?auto_114418 ) ) ( not ( = ?auto_114423 ?auto_114417 ) ) ( not ( = ?auto_114423 ?auto_114416 ) ) ( not ( = ?auto_114419 ?auto_114420 ) ) ( not ( = ?auto_114419 ?auto_114422 ) ) ( not ( = ?auto_114419 ?auto_114418 ) ) ( not ( = ?auto_114419 ?auto_114417 ) ) ( not ( = ?auto_114419 ?auto_114416 ) ) ( not ( = ?auto_114420 ?auto_114422 ) ) ( not ( = ?auto_114420 ?auto_114418 ) ) ( not ( = ?auto_114420 ?auto_114417 ) ) ( not ( = ?auto_114420 ?auto_114416 ) ) ( not ( = ?auto_114422 ?auto_114418 ) ) ( not ( = ?auto_114422 ?auto_114417 ) ) ( not ( = ?auto_114422 ?auto_114416 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114421 ?auto_114423 ?auto_114419 ?auto_114420 ?auto_114422 ?auto_114418 ?auto_114417 )
      ( MAKE-2PILE ?auto_114416 ?auto_114417 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114429 - BLOCK
      ?auto_114430 - BLOCK
      ?auto_114431 - BLOCK
      ?auto_114432 - BLOCK
      ?auto_114433 - BLOCK
    )
    :vars
    (
      ?auto_114434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114434 ?auto_114433 ) ( CLEAR ?auto_114434 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114429 ) ( ON ?auto_114430 ?auto_114429 ) ( ON ?auto_114431 ?auto_114430 ) ( ON ?auto_114432 ?auto_114431 ) ( ON ?auto_114433 ?auto_114432 ) ( not ( = ?auto_114429 ?auto_114430 ) ) ( not ( = ?auto_114429 ?auto_114431 ) ) ( not ( = ?auto_114429 ?auto_114432 ) ) ( not ( = ?auto_114429 ?auto_114433 ) ) ( not ( = ?auto_114429 ?auto_114434 ) ) ( not ( = ?auto_114430 ?auto_114431 ) ) ( not ( = ?auto_114430 ?auto_114432 ) ) ( not ( = ?auto_114430 ?auto_114433 ) ) ( not ( = ?auto_114430 ?auto_114434 ) ) ( not ( = ?auto_114431 ?auto_114432 ) ) ( not ( = ?auto_114431 ?auto_114433 ) ) ( not ( = ?auto_114431 ?auto_114434 ) ) ( not ( = ?auto_114432 ?auto_114433 ) ) ( not ( = ?auto_114432 ?auto_114434 ) ) ( not ( = ?auto_114433 ?auto_114434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114434 ?auto_114433 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114435 - BLOCK
      ?auto_114436 - BLOCK
      ?auto_114437 - BLOCK
      ?auto_114438 - BLOCK
      ?auto_114439 - BLOCK
    )
    :vars
    (
      ?auto_114440 - BLOCK
      ?auto_114441 - BLOCK
      ?auto_114442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114440 ?auto_114439 ) ( CLEAR ?auto_114440 ) ( ON-TABLE ?auto_114435 ) ( ON ?auto_114436 ?auto_114435 ) ( ON ?auto_114437 ?auto_114436 ) ( ON ?auto_114438 ?auto_114437 ) ( ON ?auto_114439 ?auto_114438 ) ( not ( = ?auto_114435 ?auto_114436 ) ) ( not ( = ?auto_114435 ?auto_114437 ) ) ( not ( = ?auto_114435 ?auto_114438 ) ) ( not ( = ?auto_114435 ?auto_114439 ) ) ( not ( = ?auto_114435 ?auto_114440 ) ) ( not ( = ?auto_114436 ?auto_114437 ) ) ( not ( = ?auto_114436 ?auto_114438 ) ) ( not ( = ?auto_114436 ?auto_114439 ) ) ( not ( = ?auto_114436 ?auto_114440 ) ) ( not ( = ?auto_114437 ?auto_114438 ) ) ( not ( = ?auto_114437 ?auto_114439 ) ) ( not ( = ?auto_114437 ?auto_114440 ) ) ( not ( = ?auto_114438 ?auto_114439 ) ) ( not ( = ?auto_114438 ?auto_114440 ) ) ( not ( = ?auto_114439 ?auto_114440 ) ) ( HOLDING ?auto_114441 ) ( CLEAR ?auto_114442 ) ( not ( = ?auto_114435 ?auto_114441 ) ) ( not ( = ?auto_114435 ?auto_114442 ) ) ( not ( = ?auto_114436 ?auto_114441 ) ) ( not ( = ?auto_114436 ?auto_114442 ) ) ( not ( = ?auto_114437 ?auto_114441 ) ) ( not ( = ?auto_114437 ?auto_114442 ) ) ( not ( = ?auto_114438 ?auto_114441 ) ) ( not ( = ?auto_114438 ?auto_114442 ) ) ( not ( = ?auto_114439 ?auto_114441 ) ) ( not ( = ?auto_114439 ?auto_114442 ) ) ( not ( = ?auto_114440 ?auto_114441 ) ) ( not ( = ?auto_114440 ?auto_114442 ) ) ( not ( = ?auto_114441 ?auto_114442 ) ) )
    :subtasks
    ( ( !STACK ?auto_114441 ?auto_114442 )
      ( MAKE-5PILE ?auto_114435 ?auto_114436 ?auto_114437 ?auto_114438 ?auto_114439 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115361 - BLOCK
      ?auto_115362 - BLOCK
      ?auto_115363 - BLOCK
      ?auto_115364 - BLOCK
      ?auto_115365 - BLOCK
    )
    :vars
    (
      ?auto_115366 - BLOCK
      ?auto_115367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115366 ?auto_115365 ) ( ON-TABLE ?auto_115361 ) ( ON ?auto_115362 ?auto_115361 ) ( ON ?auto_115363 ?auto_115362 ) ( ON ?auto_115364 ?auto_115363 ) ( ON ?auto_115365 ?auto_115364 ) ( not ( = ?auto_115361 ?auto_115362 ) ) ( not ( = ?auto_115361 ?auto_115363 ) ) ( not ( = ?auto_115361 ?auto_115364 ) ) ( not ( = ?auto_115361 ?auto_115365 ) ) ( not ( = ?auto_115361 ?auto_115366 ) ) ( not ( = ?auto_115362 ?auto_115363 ) ) ( not ( = ?auto_115362 ?auto_115364 ) ) ( not ( = ?auto_115362 ?auto_115365 ) ) ( not ( = ?auto_115362 ?auto_115366 ) ) ( not ( = ?auto_115363 ?auto_115364 ) ) ( not ( = ?auto_115363 ?auto_115365 ) ) ( not ( = ?auto_115363 ?auto_115366 ) ) ( not ( = ?auto_115364 ?auto_115365 ) ) ( not ( = ?auto_115364 ?auto_115366 ) ) ( not ( = ?auto_115365 ?auto_115366 ) ) ( not ( = ?auto_115361 ?auto_115367 ) ) ( not ( = ?auto_115362 ?auto_115367 ) ) ( not ( = ?auto_115363 ?auto_115367 ) ) ( not ( = ?auto_115364 ?auto_115367 ) ) ( not ( = ?auto_115365 ?auto_115367 ) ) ( not ( = ?auto_115366 ?auto_115367 ) ) ( ON ?auto_115367 ?auto_115366 ) ( CLEAR ?auto_115367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115361 ?auto_115362 ?auto_115363 ?auto_115364 ?auto_115365 ?auto_115366 )
      ( MAKE-5PILE ?auto_115361 ?auto_115362 ?auto_115363 ?auto_115364 ?auto_115365 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114451 - BLOCK
      ?auto_114452 - BLOCK
      ?auto_114453 - BLOCK
      ?auto_114454 - BLOCK
      ?auto_114455 - BLOCK
    )
    :vars
    (
      ?auto_114457 - BLOCK
      ?auto_114458 - BLOCK
      ?auto_114456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114457 ?auto_114455 ) ( ON-TABLE ?auto_114451 ) ( ON ?auto_114452 ?auto_114451 ) ( ON ?auto_114453 ?auto_114452 ) ( ON ?auto_114454 ?auto_114453 ) ( ON ?auto_114455 ?auto_114454 ) ( not ( = ?auto_114451 ?auto_114452 ) ) ( not ( = ?auto_114451 ?auto_114453 ) ) ( not ( = ?auto_114451 ?auto_114454 ) ) ( not ( = ?auto_114451 ?auto_114455 ) ) ( not ( = ?auto_114451 ?auto_114457 ) ) ( not ( = ?auto_114452 ?auto_114453 ) ) ( not ( = ?auto_114452 ?auto_114454 ) ) ( not ( = ?auto_114452 ?auto_114455 ) ) ( not ( = ?auto_114452 ?auto_114457 ) ) ( not ( = ?auto_114453 ?auto_114454 ) ) ( not ( = ?auto_114453 ?auto_114455 ) ) ( not ( = ?auto_114453 ?auto_114457 ) ) ( not ( = ?auto_114454 ?auto_114455 ) ) ( not ( = ?auto_114454 ?auto_114457 ) ) ( not ( = ?auto_114455 ?auto_114457 ) ) ( not ( = ?auto_114451 ?auto_114458 ) ) ( not ( = ?auto_114451 ?auto_114456 ) ) ( not ( = ?auto_114452 ?auto_114458 ) ) ( not ( = ?auto_114452 ?auto_114456 ) ) ( not ( = ?auto_114453 ?auto_114458 ) ) ( not ( = ?auto_114453 ?auto_114456 ) ) ( not ( = ?auto_114454 ?auto_114458 ) ) ( not ( = ?auto_114454 ?auto_114456 ) ) ( not ( = ?auto_114455 ?auto_114458 ) ) ( not ( = ?auto_114455 ?auto_114456 ) ) ( not ( = ?auto_114457 ?auto_114458 ) ) ( not ( = ?auto_114457 ?auto_114456 ) ) ( not ( = ?auto_114458 ?auto_114456 ) ) ( ON ?auto_114458 ?auto_114457 ) ( CLEAR ?auto_114458 ) ( HOLDING ?auto_114456 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114456 )
      ( MAKE-5PILE ?auto_114451 ?auto_114452 ?auto_114453 ?auto_114454 ?auto_114455 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114459 - BLOCK
      ?auto_114460 - BLOCK
      ?auto_114461 - BLOCK
      ?auto_114462 - BLOCK
      ?auto_114463 - BLOCK
    )
    :vars
    (
      ?auto_114465 - BLOCK
      ?auto_114466 - BLOCK
      ?auto_114464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114465 ?auto_114463 ) ( ON-TABLE ?auto_114459 ) ( ON ?auto_114460 ?auto_114459 ) ( ON ?auto_114461 ?auto_114460 ) ( ON ?auto_114462 ?auto_114461 ) ( ON ?auto_114463 ?auto_114462 ) ( not ( = ?auto_114459 ?auto_114460 ) ) ( not ( = ?auto_114459 ?auto_114461 ) ) ( not ( = ?auto_114459 ?auto_114462 ) ) ( not ( = ?auto_114459 ?auto_114463 ) ) ( not ( = ?auto_114459 ?auto_114465 ) ) ( not ( = ?auto_114460 ?auto_114461 ) ) ( not ( = ?auto_114460 ?auto_114462 ) ) ( not ( = ?auto_114460 ?auto_114463 ) ) ( not ( = ?auto_114460 ?auto_114465 ) ) ( not ( = ?auto_114461 ?auto_114462 ) ) ( not ( = ?auto_114461 ?auto_114463 ) ) ( not ( = ?auto_114461 ?auto_114465 ) ) ( not ( = ?auto_114462 ?auto_114463 ) ) ( not ( = ?auto_114462 ?auto_114465 ) ) ( not ( = ?auto_114463 ?auto_114465 ) ) ( not ( = ?auto_114459 ?auto_114466 ) ) ( not ( = ?auto_114459 ?auto_114464 ) ) ( not ( = ?auto_114460 ?auto_114466 ) ) ( not ( = ?auto_114460 ?auto_114464 ) ) ( not ( = ?auto_114461 ?auto_114466 ) ) ( not ( = ?auto_114461 ?auto_114464 ) ) ( not ( = ?auto_114462 ?auto_114466 ) ) ( not ( = ?auto_114462 ?auto_114464 ) ) ( not ( = ?auto_114463 ?auto_114466 ) ) ( not ( = ?auto_114463 ?auto_114464 ) ) ( not ( = ?auto_114465 ?auto_114466 ) ) ( not ( = ?auto_114465 ?auto_114464 ) ) ( not ( = ?auto_114466 ?auto_114464 ) ) ( ON ?auto_114466 ?auto_114465 ) ( ON ?auto_114464 ?auto_114466 ) ( CLEAR ?auto_114464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114459 ?auto_114460 ?auto_114461 ?auto_114462 ?auto_114463 ?auto_114465 ?auto_114466 )
      ( MAKE-5PILE ?auto_114459 ?auto_114460 ?auto_114461 ?auto_114462 ?auto_114463 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114470 - BLOCK
      ?auto_114471 - BLOCK
      ?auto_114472 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_114472 ) ( CLEAR ?auto_114471 ) ( ON-TABLE ?auto_114470 ) ( ON ?auto_114471 ?auto_114470 ) ( not ( = ?auto_114470 ?auto_114471 ) ) ( not ( = ?auto_114470 ?auto_114472 ) ) ( not ( = ?auto_114471 ?auto_114472 ) ) )
    :subtasks
    ( ( !STACK ?auto_114472 ?auto_114471 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114473 - BLOCK
      ?auto_114474 - BLOCK
      ?auto_114475 - BLOCK
    )
    :vars
    (
      ?auto_114476 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_114474 ) ( ON-TABLE ?auto_114473 ) ( ON ?auto_114474 ?auto_114473 ) ( not ( = ?auto_114473 ?auto_114474 ) ) ( not ( = ?auto_114473 ?auto_114475 ) ) ( not ( = ?auto_114474 ?auto_114475 ) ) ( ON ?auto_114475 ?auto_114476 ) ( CLEAR ?auto_114475 ) ( HAND-EMPTY ) ( not ( = ?auto_114473 ?auto_114476 ) ) ( not ( = ?auto_114474 ?auto_114476 ) ) ( not ( = ?auto_114475 ?auto_114476 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114475 ?auto_114476 )
      ( MAKE-3PILE ?auto_114473 ?auto_114474 ?auto_114475 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114477 - BLOCK
      ?auto_114478 - BLOCK
      ?auto_114479 - BLOCK
    )
    :vars
    (
      ?auto_114480 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114477 ) ( not ( = ?auto_114477 ?auto_114478 ) ) ( not ( = ?auto_114477 ?auto_114479 ) ) ( not ( = ?auto_114478 ?auto_114479 ) ) ( ON ?auto_114479 ?auto_114480 ) ( CLEAR ?auto_114479 ) ( not ( = ?auto_114477 ?auto_114480 ) ) ( not ( = ?auto_114478 ?auto_114480 ) ) ( not ( = ?auto_114479 ?auto_114480 ) ) ( HOLDING ?auto_114478 ) ( CLEAR ?auto_114477 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114477 ?auto_114478 )
      ( MAKE-3PILE ?auto_114477 ?auto_114478 ?auto_114479 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114481 - BLOCK
      ?auto_114482 - BLOCK
      ?auto_114483 - BLOCK
    )
    :vars
    (
      ?auto_114484 - BLOCK
      ?auto_114486 - BLOCK
      ?auto_114488 - BLOCK
      ?auto_114487 - BLOCK
      ?auto_114485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114481 ) ( not ( = ?auto_114481 ?auto_114482 ) ) ( not ( = ?auto_114481 ?auto_114483 ) ) ( not ( = ?auto_114482 ?auto_114483 ) ) ( ON ?auto_114483 ?auto_114484 ) ( not ( = ?auto_114481 ?auto_114484 ) ) ( not ( = ?auto_114482 ?auto_114484 ) ) ( not ( = ?auto_114483 ?auto_114484 ) ) ( CLEAR ?auto_114481 ) ( ON ?auto_114482 ?auto_114483 ) ( CLEAR ?auto_114482 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114486 ) ( ON ?auto_114488 ?auto_114486 ) ( ON ?auto_114487 ?auto_114488 ) ( ON ?auto_114485 ?auto_114487 ) ( ON ?auto_114484 ?auto_114485 ) ( not ( = ?auto_114486 ?auto_114488 ) ) ( not ( = ?auto_114486 ?auto_114487 ) ) ( not ( = ?auto_114486 ?auto_114485 ) ) ( not ( = ?auto_114486 ?auto_114484 ) ) ( not ( = ?auto_114486 ?auto_114483 ) ) ( not ( = ?auto_114486 ?auto_114482 ) ) ( not ( = ?auto_114488 ?auto_114487 ) ) ( not ( = ?auto_114488 ?auto_114485 ) ) ( not ( = ?auto_114488 ?auto_114484 ) ) ( not ( = ?auto_114488 ?auto_114483 ) ) ( not ( = ?auto_114488 ?auto_114482 ) ) ( not ( = ?auto_114487 ?auto_114485 ) ) ( not ( = ?auto_114487 ?auto_114484 ) ) ( not ( = ?auto_114487 ?auto_114483 ) ) ( not ( = ?auto_114487 ?auto_114482 ) ) ( not ( = ?auto_114485 ?auto_114484 ) ) ( not ( = ?auto_114485 ?auto_114483 ) ) ( not ( = ?auto_114485 ?auto_114482 ) ) ( not ( = ?auto_114481 ?auto_114486 ) ) ( not ( = ?auto_114481 ?auto_114488 ) ) ( not ( = ?auto_114481 ?auto_114487 ) ) ( not ( = ?auto_114481 ?auto_114485 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114486 ?auto_114488 ?auto_114487 ?auto_114485 ?auto_114484 ?auto_114483 )
      ( MAKE-3PILE ?auto_114481 ?auto_114482 ?auto_114483 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114489 - BLOCK
      ?auto_114490 - BLOCK
      ?auto_114491 - BLOCK
    )
    :vars
    (
      ?auto_114492 - BLOCK
      ?auto_114494 - BLOCK
      ?auto_114493 - BLOCK
      ?auto_114496 - BLOCK
      ?auto_114495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114489 ?auto_114490 ) ) ( not ( = ?auto_114489 ?auto_114491 ) ) ( not ( = ?auto_114490 ?auto_114491 ) ) ( ON ?auto_114491 ?auto_114492 ) ( not ( = ?auto_114489 ?auto_114492 ) ) ( not ( = ?auto_114490 ?auto_114492 ) ) ( not ( = ?auto_114491 ?auto_114492 ) ) ( ON ?auto_114490 ?auto_114491 ) ( CLEAR ?auto_114490 ) ( ON-TABLE ?auto_114494 ) ( ON ?auto_114493 ?auto_114494 ) ( ON ?auto_114496 ?auto_114493 ) ( ON ?auto_114495 ?auto_114496 ) ( ON ?auto_114492 ?auto_114495 ) ( not ( = ?auto_114494 ?auto_114493 ) ) ( not ( = ?auto_114494 ?auto_114496 ) ) ( not ( = ?auto_114494 ?auto_114495 ) ) ( not ( = ?auto_114494 ?auto_114492 ) ) ( not ( = ?auto_114494 ?auto_114491 ) ) ( not ( = ?auto_114494 ?auto_114490 ) ) ( not ( = ?auto_114493 ?auto_114496 ) ) ( not ( = ?auto_114493 ?auto_114495 ) ) ( not ( = ?auto_114493 ?auto_114492 ) ) ( not ( = ?auto_114493 ?auto_114491 ) ) ( not ( = ?auto_114493 ?auto_114490 ) ) ( not ( = ?auto_114496 ?auto_114495 ) ) ( not ( = ?auto_114496 ?auto_114492 ) ) ( not ( = ?auto_114496 ?auto_114491 ) ) ( not ( = ?auto_114496 ?auto_114490 ) ) ( not ( = ?auto_114495 ?auto_114492 ) ) ( not ( = ?auto_114495 ?auto_114491 ) ) ( not ( = ?auto_114495 ?auto_114490 ) ) ( not ( = ?auto_114489 ?auto_114494 ) ) ( not ( = ?auto_114489 ?auto_114493 ) ) ( not ( = ?auto_114489 ?auto_114496 ) ) ( not ( = ?auto_114489 ?auto_114495 ) ) ( HOLDING ?auto_114489 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114489 )
      ( MAKE-3PILE ?auto_114489 ?auto_114490 ?auto_114491 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114497 - BLOCK
      ?auto_114498 - BLOCK
      ?auto_114499 - BLOCK
    )
    :vars
    (
      ?auto_114502 - BLOCK
      ?auto_114504 - BLOCK
      ?auto_114500 - BLOCK
      ?auto_114501 - BLOCK
      ?auto_114503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114497 ?auto_114498 ) ) ( not ( = ?auto_114497 ?auto_114499 ) ) ( not ( = ?auto_114498 ?auto_114499 ) ) ( ON ?auto_114499 ?auto_114502 ) ( not ( = ?auto_114497 ?auto_114502 ) ) ( not ( = ?auto_114498 ?auto_114502 ) ) ( not ( = ?auto_114499 ?auto_114502 ) ) ( ON ?auto_114498 ?auto_114499 ) ( ON-TABLE ?auto_114504 ) ( ON ?auto_114500 ?auto_114504 ) ( ON ?auto_114501 ?auto_114500 ) ( ON ?auto_114503 ?auto_114501 ) ( ON ?auto_114502 ?auto_114503 ) ( not ( = ?auto_114504 ?auto_114500 ) ) ( not ( = ?auto_114504 ?auto_114501 ) ) ( not ( = ?auto_114504 ?auto_114503 ) ) ( not ( = ?auto_114504 ?auto_114502 ) ) ( not ( = ?auto_114504 ?auto_114499 ) ) ( not ( = ?auto_114504 ?auto_114498 ) ) ( not ( = ?auto_114500 ?auto_114501 ) ) ( not ( = ?auto_114500 ?auto_114503 ) ) ( not ( = ?auto_114500 ?auto_114502 ) ) ( not ( = ?auto_114500 ?auto_114499 ) ) ( not ( = ?auto_114500 ?auto_114498 ) ) ( not ( = ?auto_114501 ?auto_114503 ) ) ( not ( = ?auto_114501 ?auto_114502 ) ) ( not ( = ?auto_114501 ?auto_114499 ) ) ( not ( = ?auto_114501 ?auto_114498 ) ) ( not ( = ?auto_114503 ?auto_114502 ) ) ( not ( = ?auto_114503 ?auto_114499 ) ) ( not ( = ?auto_114503 ?auto_114498 ) ) ( not ( = ?auto_114497 ?auto_114504 ) ) ( not ( = ?auto_114497 ?auto_114500 ) ) ( not ( = ?auto_114497 ?auto_114501 ) ) ( not ( = ?auto_114497 ?auto_114503 ) ) ( ON ?auto_114497 ?auto_114498 ) ( CLEAR ?auto_114497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114504 ?auto_114500 ?auto_114501 ?auto_114503 ?auto_114502 ?auto_114499 ?auto_114498 )
      ( MAKE-3PILE ?auto_114497 ?auto_114498 ?auto_114499 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114509 - BLOCK
      ?auto_114510 - BLOCK
      ?auto_114511 - BLOCK
      ?auto_114512 - BLOCK
    )
    :vars
    (
      ?auto_114513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114513 ?auto_114512 ) ( CLEAR ?auto_114513 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114509 ) ( ON ?auto_114510 ?auto_114509 ) ( ON ?auto_114511 ?auto_114510 ) ( ON ?auto_114512 ?auto_114511 ) ( not ( = ?auto_114509 ?auto_114510 ) ) ( not ( = ?auto_114509 ?auto_114511 ) ) ( not ( = ?auto_114509 ?auto_114512 ) ) ( not ( = ?auto_114509 ?auto_114513 ) ) ( not ( = ?auto_114510 ?auto_114511 ) ) ( not ( = ?auto_114510 ?auto_114512 ) ) ( not ( = ?auto_114510 ?auto_114513 ) ) ( not ( = ?auto_114511 ?auto_114512 ) ) ( not ( = ?auto_114511 ?auto_114513 ) ) ( not ( = ?auto_114512 ?auto_114513 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114513 ?auto_114512 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114514 - BLOCK
      ?auto_114515 - BLOCK
      ?auto_114516 - BLOCK
      ?auto_114517 - BLOCK
    )
    :vars
    (
      ?auto_114518 - BLOCK
      ?auto_114519 - BLOCK
      ?auto_114520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114518 ?auto_114517 ) ( CLEAR ?auto_114518 ) ( ON-TABLE ?auto_114514 ) ( ON ?auto_114515 ?auto_114514 ) ( ON ?auto_114516 ?auto_114515 ) ( ON ?auto_114517 ?auto_114516 ) ( not ( = ?auto_114514 ?auto_114515 ) ) ( not ( = ?auto_114514 ?auto_114516 ) ) ( not ( = ?auto_114514 ?auto_114517 ) ) ( not ( = ?auto_114514 ?auto_114518 ) ) ( not ( = ?auto_114515 ?auto_114516 ) ) ( not ( = ?auto_114515 ?auto_114517 ) ) ( not ( = ?auto_114515 ?auto_114518 ) ) ( not ( = ?auto_114516 ?auto_114517 ) ) ( not ( = ?auto_114516 ?auto_114518 ) ) ( not ( = ?auto_114517 ?auto_114518 ) ) ( HOLDING ?auto_114519 ) ( CLEAR ?auto_114520 ) ( not ( = ?auto_114514 ?auto_114519 ) ) ( not ( = ?auto_114514 ?auto_114520 ) ) ( not ( = ?auto_114515 ?auto_114519 ) ) ( not ( = ?auto_114515 ?auto_114520 ) ) ( not ( = ?auto_114516 ?auto_114519 ) ) ( not ( = ?auto_114516 ?auto_114520 ) ) ( not ( = ?auto_114517 ?auto_114519 ) ) ( not ( = ?auto_114517 ?auto_114520 ) ) ( not ( = ?auto_114518 ?auto_114519 ) ) ( not ( = ?auto_114518 ?auto_114520 ) ) ( not ( = ?auto_114519 ?auto_114520 ) ) )
    :subtasks
    ( ( !STACK ?auto_114519 ?auto_114520 )
      ( MAKE-4PILE ?auto_114514 ?auto_114515 ?auto_114516 ?auto_114517 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114521 - BLOCK
      ?auto_114522 - BLOCK
      ?auto_114523 - BLOCK
      ?auto_114524 - BLOCK
    )
    :vars
    (
      ?auto_114525 - BLOCK
      ?auto_114526 - BLOCK
      ?auto_114527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114525 ?auto_114524 ) ( ON-TABLE ?auto_114521 ) ( ON ?auto_114522 ?auto_114521 ) ( ON ?auto_114523 ?auto_114522 ) ( ON ?auto_114524 ?auto_114523 ) ( not ( = ?auto_114521 ?auto_114522 ) ) ( not ( = ?auto_114521 ?auto_114523 ) ) ( not ( = ?auto_114521 ?auto_114524 ) ) ( not ( = ?auto_114521 ?auto_114525 ) ) ( not ( = ?auto_114522 ?auto_114523 ) ) ( not ( = ?auto_114522 ?auto_114524 ) ) ( not ( = ?auto_114522 ?auto_114525 ) ) ( not ( = ?auto_114523 ?auto_114524 ) ) ( not ( = ?auto_114523 ?auto_114525 ) ) ( not ( = ?auto_114524 ?auto_114525 ) ) ( CLEAR ?auto_114526 ) ( not ( = ?auto_114521 ?auto_114527 ) ) ( not ( = ?auto_114521 ?auto_114526 ) ) ( not ( = ?auto_114522 ?auto_114527 ) ) ( not ( = ?auto_114522 ?auto_114526 ) ) ( not ( = ?auto_114523 ?auto_114527 ) ) ( not ( = ?auto_114523 ?auto_114526 ) ) ( not ( = ?auto_114524 ?auto_114527 ) ) ( not ( = ?auto_114524 ?auto_114526 ) ) ( not ( = ?auto_114525 ?auto_114527 ) ) ( not ( = ?auto_114525 ?auto_114526 ) ) ( not ( = ?auto_114527 ?auto_114526 ) ) ( ON ?auto_114527 ?auto_114525 ) ( CLEAR ?auto_114527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114521 ?auto_114522 ?auto_114523 ?auto_114524 ?auto_114525 )
      ( MAKE-4PILE ?auto_114521 ?auto_114522 ?auto_114523 ?auto_114524 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114528 - BLOCK
      ?auto_114529 - BLOCK
      ?auto_114530 - BLOCK
      ?auto_114531 - BLOCK
    )
    :vars
    (
      ?auto_114532 - BLOCK
      ?auto_114534 - BLOCK
      ?auto_114533 - BLOCK
      ?auto_114535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114532 ?auto_114531 ) ( ON-TABLE ?auto_114528 ) ( ON ?auto_114529 ?auto_114528 ) ( ON ?auto_114530 ?auto_114529 ) ( ON ?auto_114531 ?auto_114530 ) ( not ( = ?auto_114528 ?auto_114529 ) ) ( not ( = ?auto_114528 ?auto_114530 ) ) ( not ( = ?auto_114528 ?auto_114531 ) ) ( not ( = ?auto_114528 ?auto_114532 ) ) ( not ( = ?auto_114529 ?auto_114530 ) ) ( not ( = ?auto_114529 ?auto_114531 ) ) ( not ( = ?auto_114529 ?auto_114532 ) ) ( not ( = ?auto_114530 ?auto_114531 ) ) ( not ( = ?auto_114530 ?auto_114532 ) ) ( not ( = ?auto_114531 ?auto_114532 ) ) ( not ( = ?auto_114528 ?auto_114534 ) ) ( not ( = ?auto_114528 ?auto_114533 ) ) ( not ( = ?auto_114529 ?auto_114534 ) ) ( not ( = ?auto_114529 ?auto_114533 ) ) ( not ( = ?auto_114530 ?auto_114534 ) ) ( not ( = ?auto_114530 ?auto_114533 ) ) ( not ( = ?auto_114531 ?auto_114534 ) ) ( not ( = ?auto_114531 ?auto_114533 ) ) ( not ( = ?auto_114532 ?auto_114534 ) ) ( not ( = ?auto_114532 ?auto_114533 ) ) ( not ( = ?auto_114534 ?auto_114533 ) ) ( ON ?auto_114534 ?auto_114532 ) ( CLEAR ?auto_114534 ) ( HOLDING ?auto_114533 ) ( CLEAR ?auto_114535 ) ( ON-TABLE ?auto_114535 ) ( not ( = ?auto_114535 ?auto_114533 ) ) ( not ( = ?auto_114528 ?auto_114535 ) ) ( not ( = ?auto_114529 ?auto_114535 ) ) ( not ( = ?auto_114530 ?auto_114535 ) ) ( not ( = ?auto_114531 ?auto_114535 ) ) ( not ( = ?auto_114532 ?auto_114535 ) ) ( not ( = ?auto_114534 ?auto_114535 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114535 ?auto_114533 )
      ( MAKE-4PILE ?auto_114528 ?auto_114529 ?auto_114530 ?auto_114531 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115590 - BLOCK
      ?auto_115591 - BLOCK
      ?auto_115592 - BLOCK
      ?auto_115593 - BLOCK
    )
    :vars
    (
      ?auto_115595 - BLOCK
      ?auto_115594 - BLOCK
      ?auto_115596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115595 ?auto_115593 ) ( ON-TABLE ?auto_115590 ) ( ON ?auto_115591 ?auto_115590 ) ( ON ?auto_115592 ?auto_115591 ) ( ON ?auto_115593 ?auto_115592 ) ( not ( = ?auto_115590 ?auto_115591 ) ) ( not ( = ?auto_115590 ?auto_115592 ) ) ( not ( = ?auto_115590 ?auto_115593 ) ) ( not ( = ?auto_115590 ?auto_115595 ) ) ( not ( = ?auto_115591 ?auto_115592 ) ) ( not ( = ?auto_115591 ?auto_115593 ) ) ( not ( = ?auto_115591 ?auto_115595 ) ) ( not ( = ?auto_115592 ?auto_115593 ) ) ( not ( = ?auto_115592 ?auto_115595 ) ) ( not ( = ?auto_115593 ?auto_115595 ) ) ( not ( = ?auto_115590 ?auto_115594 ) ) ( not ( = ?auto_115590 ?auto_115596 ) ) ( not ( = ?auto_115591 ?auto_115594 ) ) ( not ( = ?auto_115591 ?auto_115596 ) ) ( not ( = ?auto_115592 ?auto_115594 ) ) ( not ( = ?auto_115592 ?auto_115596 ) ) ( not ( = ?auto_115593 ?auto_115594 ) ) ( not ( = ?auto_115593 ?auto_115596 ) ) ( not ( = ?auto_115595 ?auto_115594 ) ) ( not ( = ?auto_115595 ?auto_115596 ) ) ( not ( = ?auto_115594 ?auto_115596 ) ) ( ON ?auto_115594 ?auto_115595 ) ( ON ?auto_115596 ?auto_115594 ) ( CLEAR ?auto_115596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115590 ?auto_115591 ?auto_115592 ?auto_115593 ?auto_115595 ?auto_115594 )
      ( MAKE-4PILE ?auto_115590 ?auto_115591 ?auto_115592 ?auto_115593 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114544 - BLOCK
      ?auto_114545 - BLOCK
      ?auto_114546 - BLOCK
      ?auto_114547 - BLOCK
    )
    :vars
    (
      ?auto_114550 - BLOCK
      ?auto_114551 - BLOCK
      ?auto_114548 - BLOCK
      ?auto_114549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114550 ?auto_114547 ) ( ON-TABLE ?auto_114544 ) ( ON ?auto_114545 ?auto_114544 ) ( ON ?auto_114546 ?auto_114545 ) ( ON ?auto_114547 ?auto_114546 ) ( not ( = ?auto_114544 ?auto_114545 ) ) ( not ( = ?auto_114544 ?auto_114546 ) ) ( not ( = ?auto_114544 ?auto_114547 ) ) ( not ( = ?auto_114544 ?auto_114550 ) ) ( not ( = ?auto_114545 ?auto_114546 ) ) ( not ( = ?auto_114545 ?auto_114547 ) ) ( not ( = ?auto_114545 ?auto_114550 ) ) ( not ( = ?auto_114546 ?auto_114547 ) ) ( not ( = ?auto_114546 ?auto_114550 ) ) ( not ( = ?auto_114547 ?auto_114550 ) ) ( not ( = ?auto_114544 ?auto_114551 ) ) ( not ( = ?auto_114544 ?auto_114548 ) ) ( not ( = ?auto_114545 ?auto_114551 ) ) ( not ( = ?auto_114545 ?auto_114548 ) ) ( not ( = ?auto_114546 ?auto_114551 ) ) ( not ( = ?auto_114546 ?auto_114548 ) ) ( not ( = ?auto_114547 ?auto_114551 ) ) ( not ( = ?auto_114547 ?auto_114548 ) ) ( not ( = ?auto_114550 ?auto_114551 ) ) ( not ( = ?auto_114550 ?auto_114548 ) ) ( not ( = ?auto_114551 ?auto_114548 ) ) ( ON ?auto_114551 ?auto_114550 ) ( not ( = ?auto_114549 ?auto_114548 ) ) ( not ( = ?auto_114544 ?auto_114549 ) ) ( not ( = ?auto_114545 ?auto_114549 ) ) ( not ( = ?auto_114546 ?auto_114549 ) ) ( not ( = ?auto_114547 ?auto_114549 ) ) ( not ( = ?auto_114550 ?auto_114549 ) ) ( not ( = ?auto_114551 ?auto_114549 ) ) ( ON ?auto_114548 ?auto_114551 ) ( CLEAR ?auto_114548 ) ( HOLDING ?auto_114549 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114549 )
      ( MAKE-4PILE ?auto_114544 ?auto_114545 ?auto_114546 ?auto_114547 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114552 - BLOCK
      ?auto_114553 - BLOCK
      ?auto_114554 - BLOCK
      ?auto_114555 - BLOCK
    )
    :vars
    (
      ?auto_114557 - BLOCK
      ?auto_114556 - BLOCK
      ?auto_114559 - BLOCK
      ?auto_114558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114557 ?auto_114555 ) ( ON-TABLE ?auto_114552 ) ( ON ?auto_114553 ?auto_114552 ) ( ON ?auto_114554 ?auto_114553 ) ( ON ?auto_114555 ?auto_114554 ) ( not ( = ?auto_114552 ?auto_114553 ) ) ( not ( = ?auto_114552 ?auto_114554 ) ) ( not ( = ?auto_114552 ?auto_114555 ) ) ( not ( = ?auto_114552 ?auto_114557 ) ) ( not ( = ?auto_114553 ?auto_114554 ) ) ( not ( = ?auto_114553 ?auto_114555 ) ) ( not ( = ?auto_114553 ?auto_114557 ) ) ( not ( = ?auto_114554 ?auto_114555 ) ) ( not ( = ?auto_114554 ?auto_114557 ) ) ( not ( = ?auto_114555 ?auto_114557 ) ) ( not ( = ?auto_114552 ?auto_114556 ) ) ( not ( = ?auto_114552 ?auto_114559 ) ) ( not ( = ?auto_114553 ?auto_114556 ) ) ( not ( = ?auto_114553 ?auto_114559 ) ) ( not ( = ?auto_114554 ?auto_114556 ) ) ( not ( = ?auto_114554 ?auto_114559 ) ) ( not ( = ?auto_114555 ?auto_114556 ) ) ( not ( = ?auto_114555 ?auto_114559 ) ) ( not ( = ?auto_114557 ?auto_114556 ) ) ( not ( = ?auto_114557 ?auto_114559 ) ) ( not ( = ?auto_114556 ?auto_114559 ) ) ( ON ?auto_114556 ?auto_114557 ) ( not ( = ?auto_114558 ?auto_114559 ) ) ( not ( = ?auto_114552 ?auto_114558 ) ) ( not ( = ?auto_114553 ?auto_114558 ) ) ( not ( = ?auto_114554 ?auto_114558 ) ) ( not ( = ?auto_114555 ?auto_114558 ) ) ( not ( = ?auto_114557 ?auto_114558 ) ) ( not ( = ?auto_114556 ?auto_114558 ) ) ( ON ?auto_114559 ?auto_114556 ) ( ON ?auto_114558 ?auto_114559 ) ( CLEAR ?auto_114558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114552 ?auto_114553 ?auto_114554 ?auto_114555 ?auto_114557 ?auto_114556 ?auto_114559 )
      ( MAKE-4PILE ?auto_114552 ?auto_114553 ?auto_114554 ?auto_114555 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114564 - BLOCK
      ?auto_114565 - BLOCK
      ?auto_114566 - BLOCK
      ?auto_114567 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_114567 ) ( CLEAR ?auto_114566 ) ( ON-TABLE ?auto_114564 ) ( ON ?auto_114565 ?auto_114564 ) ( ON ?auto_114566 ?auto_114565 ) ( not ( = ?auto_114564 ?auto_114565 ) ) ( not ( = ?auto_114564 ?auto_114566 ) ) ( not ( = ?auto_114564 ?auto_114567 ) ) ( not ( = ?auto_114565 ?auto_114566 ) ) ( not ( = ?auto_114565 ?auto_114567 ) ) ( not ( = ?auto_114566 ?auto_114567 ) ) )
    :subtasks
    ( ( !STACK ?auto_114567 ?auto_114566 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114568 - BLOCK
      ?auto_114569 - BLOCK
      ?auto_114570 - BLOCK
      ?auto_114571 - BLOCK
    )
    :vars
    (
      ?auto_114572 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_114570 ) ( ON-TABLE ?auto_114568 ) ( ON ?auto_114569 ?auto_114568 ) ( ON ?auto_114570 ?auto_114569 ) ( not ( = ?auto_114568 ?auto_114569 ) ) ( not ( = ?auto_114568 ?auto_114570 ) ) ( not ( = ?auto_114568 ?auto_114571 ) ) ( not ( = ?auto_114569 ?auto_114570 ) ) ( not ( = ?auto_114569 ?auto_114571 ) ) ( not ( = ?auto_114570 ?auto_114571 ) ) ( ON ?auto_114571 ?auto_114572 ) ( CLEAR ?auto_114571 ) ( HAND-EMPTY ) ( not ( = ?auto_114568 ?auto_114572 ) ) ( not ( = ?auto_114569 ?auto_114572 ) ) ( not ( = ?auto_114570 ?auto_114572 ) ) ( not ( = ?auto_114571 ?auto_114572 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114571 ?auto_114572 )
      ( MAKE-4PILE ?auto_114568 ?auto_114569 ?auto_114570 ?auto_114571 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114573 - BLOCK
      ?auto_114574 - BLOCK
      ?auto_114575 - BLOCK
      ?auto_114576 - BLOCK
    )
    :vars
    (
      ?auto_114577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114573 ) ( ON ?auto_114574 ?auto_114573 ) ( not ( = ?auto_114573 ?auto_114574 ) ) ( not ( = ?auto_114573 ?auto_114575 ) ) ( not ( = ?auto_114573 ?auto_114576 ) ) ( not ( = ?auto_114574 ?auto_114575 ) ) ( not ( = ?auto_114574 ?auto_114576 ) ) ( not ( = ?auto_114575 ?auto_114576 ) ) ( ON ?auto_114576 ?auto_114577 ) ( CLEAR ?auto_114576 ) ( not ( = ?auto_114573 ?auto_114577 ) ) ( not ( = ?auto_114574 ?auto_114577 ) ) ( not ( = ?auto_114575 ?auto_114577 ) ) ( not ( = ?auto_114576 ?auto_114577 ) ) ( HOLDING ?auto_114575 ) ( CLEAR ?auto_114574 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114573 ?auto_114574 ?auto_114575 )
      ( MAKE-4PILE ?auto_114573 ?auto_114574 ?auto_114575 ?auto_114576 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114578 - BLOCK
      ?auto_114579 - BLOCK
      ?auto_114580 - BLOCK
      ?auto_114581 - BLOCK
    )
    :vars
    (
      ?auto_114582 - BLOCK
      ?auto_114583 - BLOCK
      ?auto_114584 - BLOCK
      ?auto_114585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114578 ) ( ON ?auto_114579 ?auto_114578 ) ( not ( = ?auto_114578 ?auto_114579 ) ) ( not ( = ?auto_114578 ?auto_114580 ) ) ( not ( = ?auto_114578 ?auto_114581 ) ) ( not ( = ?auto_114579 ?auto_114580 ) ) ( not ( = ?auto_114579 ?auto_114581 ) ) ( not ( = ?auto_114580 ?auto_114581 ) ) ( ON ?auto_114581 ?auto_114582 ) ( not ( = ?auto_114578 ?auto_114582 ) ) ( not ( = ?auto_114579 ?auto_114582 ) ) ( not ( = ?auto_114580 ?auto_114582 ) ) ( not ( = ?auto_114581 ?auto_114582 ) ) ( CLEAR ?auto_114579 ) ( ON ?auto_114580 ?auto_114581 ) ( CLEAR ?auto_114580 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114583 ) ( ON ?auto_114584 ?auto_114583 ) ( ON ?auto_114585 ?auto_114584 ) ( ON ?auto_114582 ?auto_114585 ) ( not ( = ?auto_114583 ?auto_114584 ) ) ( not ( = ?auto_114583 ?auto_114585 ) ) ( not ( = ?auto_114583 ?auto_114582 ) ) ( not ( = ?auto_114583 ?auto_114581 ) ) ( not ( = ?auto_114583 ?auto_114580 ) ) ( not ( = ?auto_114584 ?auto_114585 ) ) ( not ( = ?auto_114584 ?auto_114582 ) ) ( not ( = ?auto_114584 ?auto_114581 ) ) ( not ( = ?auto_114584 ?auto_114580 ) ) ( not ( = ?auto_114585 ?auto_114582 ) ) ( not ( = ?auto_114585 ?auto_114581 ) ) ( not ( = ?auto_114585 ?auto_114580 ) ) ( not ( = ?auto_114578 ?auto_114583 ) ) ( not ( = ?auto_114578 ?auto_114584 ) ) ( not ( = ?auto_114578 ?auto_114585 ) ) ( not ( = ?auto_114579 ?auto_114583 ) ) ( not ( = ?auto_114579 ?auto_114584 ) ) ( not ( = ?auto_114579 ?auto_114585 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114583 ?auto_114584 ?auto_114585 ?auto_114582 ?auto_114581 )
      ( MAKE-4PILE ?auto_114578 ?auto_114579 ?auto_114580 ?auto_114581 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114586 - BLOCK
      ?auto_114587 - BLOCK
      ?auto_114588 - BLOCK
      ?auto_114589 - BLOCK
    )
    :vars
    (
      ?auto_114590 - BLOCK
      ?auto_114592 - BLOCK
      ?auto_114591 - BLOCK
      ?auto_114593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114586 ) ( not ( = ?auto_114586 ?auto_114587 ) ) ( not ( = ?auto_114586 ?auto_114588 ) ) ( not ( = ?auto_114586 ?auto_114589 ) ) ( not ( = ?auto_114587 ?auto_114588 ) ) ( not ( = ?auto_114587 ?auto_114589 ) ) ( not ( = ?auto_114588 ?auto_114589 ) ) ( ON ?auto_114589 ?auto_114590 ) ( not ( = ?auto_114586 ?auto_114590 ) ) ( not ( = ?auto_114587 ?auto_114590 ) ) ( not ( = ?auto_114588 ?auto_114590 ) ) ( not ( = ?auto_114589 ?auto_114590 ) ) ( ON ?auto_114588 ?auto_114589 ) ( CLEAR ?auto_114588 ) ( ON-TABLE ?auto_114592 ) ( ON ?auto_114591 ?auto_114592 ) ( ON ?auto_114593 ?auto_114591 ) ( ON ?auto_114590 ?auto_114593 ) ( not ( = ?auto_114592 ?auto_114591 ) ) ( not ( = ?auto_114592 ?auto_114593 ) ) ( not ( = ?auto_114592 ?auto_114590 ) ) ( not ( = ?auto_114592 ?auto_114589 ) ) ( not ( = ?auto_114592 ?auto_114588 ) ) ( not ( = ?auto_114591 ?auto_114593 ) ) ( not ( = ?auto_114591 ?auto_114590 ) ) ( not ( = ?auto_114591 ?auto_114589 ) ) ( not ( = ?auto_114591 ?auto_114588 ) ) ( not ( = ?auto_114593 ?auto_114590 ) ) ( not ( = ?auto_114593 ?auto_114589 ) ) ( not ( = ?auto_114593 ?auto_114588 ) ) ( not ( = ?auto_114586 ?auto_114592 ) ) ( not ( = ?auto_114586 ?auto_114591 ) ) ( not ( = ?auto_114586 ?auto_114593 ) ) ( not ( = ?auto_114587 ?auto_114592 ) ) ( not ( = ?auto_114587 ?auto_114591 ) ) ( not ( = ?auto_114587 ?auto_114593 ) ) ( HOLDING ?auto_114587 ) ( CLEAR ?auto_114586 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114586 ?auto_114587 )
      ( MAKE-4PILE ?auto_114586 ?auto_114587 ?auto_114588 ?auto_114589 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114594 - BLOCK
      ?auto_114595 - BLOCK
      ?auto_114596 - BLOCK
      ?auto_114597 - BLOCK
    )
    :vars
    (
      ?auto_114600 - BLOCK
      ?auto_114598 - BLOCK
      ?auto_114601 - BLOCK
      ?auto_114599 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114594 ) ( not ( = ?auto_114594 ?auto_114595 ) ) ( not ( = ?auto_114594 ?auto_114596 ) ) ( not ( = ?auto_114594 ?auto_114597 ) ) ( not ( = ?auto_114595 ?auto_114596 ) ) ( not ( = ?auto_114595 ?auto_114597 ) ) ( not ( = ?auto_114596 ?auto_114597 ) ) ( ON ?auto_114597 ?auto_114600 ) ( not ( = ?auto_114594 ?auto_114600 ) ) ( not ( = ?auto_114595 ?auto_114600 ) ) ( not ( = ?auto_114596 ?auto_114600 ) ) ( not ( = ?auto_114597 ?auto_114600 ) ) ( ON ?auto_114596 ?auto_114597 ) ( ON-TABLE ?auto_114598 ) ( ON ?auto_114601 ?auto_114598 ) ( ON ?auto_114599 ?auto_114601 ) ( ON ?auto_114600 ?auto_114599 ) ( not ( = ?auto_114598 ?auto_114601 ) ) ( not ( = ?auto_114598 ?auto_114599 ) ) ( not ( = ?auto_114598 ?auto_114600 ) ) ( not ( = ?auto_114598 ?auto_114597 ) ) ( not ( = ?auto_114598 ?auto_114596 ) ) ( not ( = ?auto_114601 ?auto_114599 ) ) ( not ( = ?auto_114601 ?auto_114600 ) ) ( not ( = ?auto_114601 ?auto_114597 ) ) ( not ( = ?auto_114601 ?auto_114596 ) ) ( not ( = ?auto_114599 ?auto_114600 ) ) ( not ( = ?auto_114599 ?auto_114597 ) ) ( not ( = ?auto_114599 ?auto_114596 ) ) ( not ( = ?auto_114594 ?auto_114598 ) ) ( not ( = ?auto_114594 ?auto_114601 ) ) ( not ( = ?auto_114594 ?auto_114599 ) ) ( not ( = ?auto_114595 ?auto_114598 ) ) ( not ( = ?auto_114595 ?auto_114601 ) ) ( not ( = ?auto_114595 ?auto_114599 ) ) ( CLEAR ?auto_114594 ) ( ON ?auto_114595 ?auto_114596 ) ( CLEAR ?auto_114595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114598 ?auto_114601 ?auto_114599 ?auto_114600 ?auto_114597 ?auto_114596 )
      ( MAKE-4PILE ?auto_114594 ?auto_114595 ?auto_114596 ?auto_114597 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114602 - BLOCK
      ?auto_114603 - BLOCK
      ?auto_114604 - BLOCK
      ?auto_114605 - BLOCK
    )
    :vars
    (
      ?auto_114609 - BLOCK
      ?auto_114607 - BLOCK
      ?auto_114608 - BLOCK
      ?auto_114606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114602 ?auto_114603 ) ) ( not ( = ?auto_114602 ?auto_114604 ) ) ( not ( = ?auto_114602 ?auto_114605 ) ) ( not ( = ?auto_114603 ?auto_114604 ) ) ( not ( = ?auto_114603 ?auto_114605 ) ) ( not ( = ?auto_114604 ?auto_114605 ) ) ( ON ?auto_114605 ?auto_114609 ) ( not ( = ?auto_114602 ?auto_114609 ) ) ( not ( = ?auto_114603 ?auto_114609 ) ) ( not ( = ?auto_114604 ?auto_114609 ) ) ( not ( = ?auto_114605 ?auto_114609 ) ) ( ON ?auto_114604 ?auto_114605 ) ( ON-TABLE ?auto_114607 ) ( ON ?auto_114608 ?auto_114607 ) ( ON ?auto_114606 ?auto_114608 ) ( ON ?auto_114609 ?auto_114606 ) ( not ( = ?auto_114607 ?auto_114608 ) ) ( not ( = ?auto_114607 ?auto_114606 ) ) ( not ( = ?auto_114607 ?auto_114609 ) ) ( not ( = ?auto_114607 ?auto_114605 ) ) ( not ( = ?auto_114607 ?auto_114604 ) ) ( not ( = ?auto_114608 ?auto_114606 ) ) ( not ( = ?auto_114608 ?auto_114609 ) ) ( not ( = ?auto_114608 ?auto_114605 ) ) ( not ( = ?auto_114608 ?auto_114604 ) ) ( not ( = ?auto_114606 ?auto_114609 ) ) ( not ( = ?auto_114606 ?auto_114605 ) ) ( not ( = ?auto_114606 ?auto_114604 ) ) ( not ( = ?auto_114602 ?auto_114607 ) ) ( not ( = ?auto_114602 ?auto_114608 ) ) ( not ( = ?auto_114602 ?auto_114606 ) ) ( not ( = ?auto_114603 ?auto_114607 ) ) ( not ( = ?auto_114603 ?auto_114608 ) ) ( not ( = ?auto_114603 ?auto_114606 ) ) ( ON ?auto_114603 ?auto_114604 ) ( CLEAR ?auto_114603 ) ( HOLDING ?auto_114602 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114602 )
      ( MAKE-4PILE ?auto_114602 ?auto_114603 ?auto_114604 ?auto_114605 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_114610 - BLOCK
      ?auto_114611 - BLOCK
      ?auto_114612 - BLOCK
      ?auto_114613 - BLOCK
    )
    :vars
    (
      ?auto_114614 - BLOCK
      ?auto_114617 - BLOCK
      ?auto_114616 - BLOCK
      ?auto_114615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114610 ?auto_114611 ) ) ( not ( = ?auto_114610 ?auto_114612 ) ) ( not ( = ?auto_114610 ?auto_114613 ) ) ( not ( = ?auto_114611 ?auto_114612 ) ) ( not ( = ?auto_114611 ?auto_114613 ) ) ( not ( = ?auto_114612 ?auto_114613 ) ) ( ON ?auto_114613 ?auto_114614 ) ( not ( = ?auto_114610 ?auto_114614 ) ) ( not ( = ?auto_114611 ?auto_114614 ) ) ( not ( = ?auto_114612 ?auto_114614 ) ) ( not ( = ?auto_114613 ?auto_114614 ) ) ( ON ?auto_114612 ?auto_114613 ) ( ON-TABLE ?auto_114617 ) ( ON ?auto_114616 ?auto_114617 ) ( ON ?auto_114615 ?auto_114616 ) ( ON ?auto_114614 ?auto_114615 ) ( not ( = ?auto_114617 ?auto_114616 ) ) ( not ( = ?auto_114617 ?auto_114615 ) ) ( not ( = ?auto_114617 ?auto_114614 ) ) ( not ( = ?auto_114617 ?auto_114613 ) ) ( not ( = ?auto_114617 ?auto_114612 ) ) ( not ( = ?auto_114616 ?auto_114615 ) ) ( not ( = ?auto_114616 ?auto_114614 ) ) ( not ( = ?auto_114616 ?auto_114613 ) ) ( not ( = ?auto_114616 ?auto_114612 ) ) ( not ( = ?auto_114615 ?auto_114614 ) ) ( not ( = ?auto_114615 ?auto_114613 ) ) ( not ( = ?auto_114615 ?auto_114612 ) ) ( not ( = ?auto_114610 ?auto_114617 ) ) ( not ( = ?auto_114610 ?auto_114616 ) ) ( not ( = ?auto_114610 ?auto_114615 ) ) ( not ( = ?auto_114611 ?auto_114617 ) ) ( not ( = ?auto_114611 ?auto_114616 ) ) ( not ( = ?auto_114611 ?auto_114615 ) ) ( ON ?auto_114611 ?auto_114612 ) ( ON ?auto_114610 ?auto_114611 ) ( CLEAR ?auto_114610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114617 ?auto_114616 ?auto_114615 ?auto_114614 ?auto_114613 ?auto_114612 ?auto_114611 )
      ( MAKE-4PILE ?auto_114610 ?auto_114611 ?auto_114612 ?auto_114613 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114621 - BLOCK
      ?auto_114622 - BLOCK
      ?auto_114623 - BLOCK
    )
    :vars
    (
      ?auto_114624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114624 ?auto_114623 ) ( CLEAR ?auto_114624 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114621 ) ( ON ?auto_114622 ?auto_114621 ) ( ON ?auto_114623 ?auto_114622 ) ( not ( = ?auto_114621 ?auto_114622 ) ) ( not ( = ?auto_114621 ?auto_114623 ) ) ( not ( = ?auto_114621 ?auto_114624 ) ) ( not ( = ?auto_114622 ?auto_114623 ) ) ( not ( = ?auto_114622 ?auto_114624 ) ) ( not ( = ?auto_114623 ?auto_114624 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114624 ?auto_114623 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114625 - BLOCK
      ?auto_114626 - BLOCK
      ?auto_114627 - BLOCK
    )
    :vars
    (
      ?auto_114628 - BLOCK
      ?auto_114629 - BLOCK
      ?auto_114630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114628 ?auto_114627 ) ( CLEAR ?auto_114628 ) ( ON-TABLE ?auto_114625 ) ( ON ?auto_114626 ?auto_114625 ) ( ON ?auto_114627 ?auto_114626 ) ( not ( = ?auto_114625 ?auto_114626 ) ) ( not ( = ?auto_114625 ?auto_114627 ) ) ( not ( = ?auto_114625 ?auto_114628 ) ) ( not ( = ?auto_114626 ?auto_114627 ) ) ( not ( = ?auto_114626 ?auto_114628 ) ) ( not ( = ?auto_114627 ?auto_114628 ) ) ( HOLDING ?auto_114629 ) ( CLEAR ?auto_114630 ) ( not ( = ?auto_114625 ?auto_114629 ) ) ( not ( = ?auto_114625 ?auto_114630 ) ) ( not ( = ?auto_114626 ?auto_114629 ) ) ( not ( = ?auto_114626 ?auto_114630 ) ) ( not ( = ?auto_114627 ?auto_114629 ) ) ( not ( = ?auto_114627 ?auto_114630 ) ) ( not ( = ?auto_114628 ?auto_114629 ) ) ( not ( = ?auto_114628 ?auto_114630 ) ) ( not ( = ?auto_114629 ?auto_114630 ) ) )
    :subtasks
    ( ( !STACK ?auto_114629 ?auto_114630 )
      ( MAKE-3PILE ?auto_114625 ?auto_114626 ?auto_114627 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114631 - BLOCK
      ?auto_114632 - BLOCK
      ?auto_114633 - BLOCK
    )
    :vars
    (
      ?auto_114636 - BLOCK
      ?auto_114634 - BLOCK
      ?auto_114635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114636 ?auto_114633 ) ( ON-TABLE ?auto_114631 ) ( ON ?auto_114632 ?auto_114631 ) ( ON ?auto_114633 ?auto_114632 ) ( not ( = ?auto_114631 ?auto_114632 ) ) ( not ( = ?auto_114631 ?auto_114633 ) ) ( not ( = ?auto_114631 ?auto_114636 ) ) ( not ( = ?auto_114632 ?auto_114633 ) ) ( not ( = ?auto_114632 ?auto_114636 ) ) ( not ( = ?auto_114633 ?auto_114636 ) ) ( CLEAR ?auto_114634 ) ( not ( = ?auto_114631 ?auto_114635 ) ) ( not ( = ?auto_114631 ?auto_114634 ) ) ( not ( = ?auto_114632 ?auto_114635 ) ) ( not ( = ?auto_114632 ?auto_114634 ) ) ( not ( = ?auto_114633 ?auto_114635 ) ) ( not ( = ?auto_114633 ?auto_114634 ) ) ( not ( = ?auto_114636 ?auto_114635 ) ) ( not ( = ?auto_114636 ?auto_114634 ) ) ( not ( = ?auto_114635 ?auto_114634 ) ) ( ON ?auto_114635 ?auto_114636 ) ( CLEAR ?auto_114635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114631 ?auto_114632 ?auto_114633 ?auto_114636 )
      ( MAKE-3PILE ?auto_114631 ?auto_114632 ?auto_114633 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114637 - BLOCK
      ?auto_114638 - BLOCK
      ?auto_114639 - BLOCK
    )
    :vars
    (
      ?auto_114641 - BLOCK
      ?auto_114642 - BLOCK
      ?auto_114640 - BLOCK
      ?auto_114644 - BLOCK
      ?auto_114643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114641 ?auto_114639 ) ( ON-TABLE ?auto_114637 ) ( ON ?auto_114638 ?auto_114637 ) ( ON ?auto_114639 ?auto_114638 ) ( not ( = ?auto_114637 ?auto_114638 ) ) ( not ( = ?auto_114637 ?auto_114639 ) ) ( not ( = ?auto_114637 ?auto_114641 ) ) ( not ( = ?auto_114638 ?auto_114639 ) ) ( not ( = ?auto_114638 ?auto_114641 ) ) ( not ( = ?auto_114639 ?auto_114641 ) ) ( not ( = ?auto_114637 ?auto_114642 ) ) ( not ( = ?auto_114637 ?auto_114640 ) ) ( not ( = ?auto_114638 ?auto_114642 ) ) ( not ( = ?auto_114638 ?auto_114640 ) ) ( not ( = ?auto_114639 ?auto_114642 ) ) ( not ( = ?auto_114639 ?auto_114640 ) ) ( not ( = ?auto_114641 ?auto_114642 ) ) ( not ( = ?auto_114641 ?auto_114640 ) ) ( not ( = ?auto_114642 ?auto_114640 ) ) ( ON ?auto_114642 ?auto_114641 ) ( CLEAR ?auto_114642 ) ( HOLDING ?auto_114640 ) ( CLEAR ?auto_114644 ) ( ON-TABLE ?auto_114643 ) ( ON ?auto_114644 ?auto_114643 ) ( not ( = ?auto_114643 ?auto_114644 ) ) ( not ( = ?auto_114643 ?auto_114640 ) ) ( not ( = ?auto_114644 ?auto_114640 ) ) ( not ( = ?auto_114637 ?auto_114644 ) ) ( not ( = ?auto_114637 ?auto_114643 ) ) ( not ( = ?auto_114638 ?auto_114644 ) ) ( not ( = ?auto_114638 ?auto_114643 ) ) ( not ( = ?auto_114639 ?auto_114644 ) ) ( not ( = ?auto_114639 ?auto_114643 ) ) ( not ( = ?auto_114641 ?auto_114644 ) ) ( not ( = ?auto_114641 ?auto_114643 ) ) ( not ( = ?auto_114642 ?auto_114644 ) ) ( not ( = ?auto_114642 ?auto_114643 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114643 ?auto_114644 ?auto_114640 )
      ( MAKE-3PILE ?auto_114637 ?auto_114638 ?auto_114639 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114645 - BLOCK
      ?auto_114646 - BLOCK
      ?auto_114647 - BLOCK
    )
    :vars
    (
      ?auto_114650 - BLOCK
      ?auto_114648 - BLOCK
      ?auto_114651 - BLOCK
      ?auto_114652 - BLOCK
      ?auto_114649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114650 ?auto_114647 ) ( ON-TABLE ?auto_114645 ) ( ON ?auto_114646 ?auto_114645 ) ( ON ?auto_114647 ?auto_114646 ) ( not ( = ?auto_114645 ?auto_114646 ) ) ( not ( = ?auto_114645 ?auto_114647 ) ) ( not ( = ?auto_114645 ?auto_114650 ) ) ( not ( = ?auto_114646 ?auto_114647 ) ) ( not ( = ?auto_114646 ?auto_114650 ) ) ( not ( = ?auto_114647 ?auto_114650 ) ) ( not ( = ?auto_114645 ?auto_114648 ) ) ( not ( = ?auto_114645 ?auto_114651 ) ) ( not ( = ?auto_114646 ?auto_114648 ) ) ( not ( = ?auto_114646 ?auto_114651 ) ) ( not ( = ?auto_114647 ?auto_114648 ) ) ( not ( = ?auto_114647 ?auto_114651 ) ) ( not ( = ?auto_114650 ?auto_114648 ) ) ( not ( = ?auto_114650 ?auto_114651 ) ) ( not ( = ?auto_114648 ?auto_114651 ) ) ( ON ?auto_114648 ?auto_114650 ) ( CLEAR ?auto_114652 ) ( ON-TABLE ?auto_114649 ) ( ON ?auto_114652 ?auto_114649 ) ( not ( = ?auto_114649 ?auto_114652 ) ) ( not ( = ?auto_114649 ?auto_114651 ) ) ( not ( = ?auto_114652 ?auto_114651 ) ) ( not ( = ?auto_114645 ?auto_114652 ) ) ( not ( = ?auto_114645 ?auto_114649 ) ) ( not ( = ?auto_114646 ?auto_114652 ) ) ( not ( = ?auto_114646 ?auto_114649 ) ) ( not ( = ?auto_114647 ?auto_114652 ) ) ( not ( = ?auto_114647 ?auto_114649 ) ) ( not ( = ?auto_114650 ?auto_114652 ) ) ( not ( = ?auto_114650 ?auto_114649 ) ) ( not ( = ?auto_114648 ?auto_114652 ) ) ( not ( = ?auto_114648 ?auto_114649 ) ) ( ON ?auto_114651 ?auto_114648 ) ( CLEAR ?auto_114651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114645 ?auto_114646 ?auto_114647 ?auto_114650 ?auto_114648 )
      ( MAKE-3PILE ?auto_114645 ?auto_114646 ?auto_114647 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114653 - BLOCK
      ?auto_114654 - BLOCK
      ?auto_114655 - BLOCK
    )
    :vars
    (
      ?auto_114659 - BLOCK
      ?auto_114656 - BLOCK
      ?auto_114658 - BLOCK
      ?auto_114660 - BLOCK
      ?auto_114657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114659 ?auto_114655 ) ( ON-TABLE ?auto_114653 ) ( ON ?auto_114654 ?auto_114653 ) ( ON ?auto_114655 ?auto_114654 ) ( not ( = ?auto_114653 ?auto_114654 ) ) ( not ( = ?auto_114653 ?auto_114655 ) ) ( not ( = ?auto_114653 ?auto_114659 ) ) ( not ( = ?auto_114654 ?auto_114655 ) ) ( not ( = ?auto_114654 ?auto_114659 ) ) ( not ( = ?auto_114655 ?auto_114659 ) ) ( not ( = ?auto_114653 ?auto_114656 ) ) ( not ( = ?auto_114653 ?auto_114658 ) ) ( not ( = ?auto_114654 ?auto_114656 ) ) ( not ( = ?auto_114654 ?auto_114658 ) ) ( not ( = ?auto_114655 ?auto_114656 ) ) ( not ( = ?auto_114655 ?auto_114658 ) ) ( not ( = ?auto_114659 ?auto_114656 ) ) ( not ( = ?auto_114659 ?auto_114658 ) ) ( not ( = ?auto_114656 ?auto_114658 ) ) ( ON ?auto_114656 ?auto_114659 ) ( ON-TABLE ?auto_114660 ) ( not ( = ?auto_114660 ?auto_114657 ) ) ( not ( = ?auto_114660 ?auto_114658 ) ) ( not ( = ?auto_114657 ?auto_114658 ) ) ( not ( = ?auto_114653 ?auto_114657 ) ) ( not ( = ?auto_114653 ?auto_114660 ) ) ( not ( = ?auto_114654 ?auto_114657 ) ) ( not ( = ?auto_114654 ?auto_114660 ) ) ( not ( = ?auto_114655 ?auto_114657 ) ) ( not ( = ?auto_114655 ?auto_114660 ) ) ( not ( = ?auto_114659 ?auto_114657 ) ) ( not ( = ?auto_114659 ?auto_114660 ) ) ( not ( = ?auto_114656 ?auto_114657 ) ) ( not ( = ?auto_114656 ?auto_114660 ) ) ( ON ?auto_114658 ?auto_114656 ) ( CLEAR ?auto_114658 ) ( HOLDING ?auto_114657 ) ( CLEAR ?auto_114660 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114660 ?auto_114657 )
      ( MAKE-3PILE ?auto_114653 ?auto_114654 ?auto_114655 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115838 - BLOCK
      ?auto_115839 - BLOCK
      ?auto_115840 - BLOCK
    )
    :vars
    (
      ?auto_115844 - BLOCK
      ?auto_115843 - BLOCK
      ?auto_115841 - BLOCK
      ?auto_115842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115844 ?auto_115840 ) ( ON-TABLE ?auto_115838 ) ( ON ?auto_115839 ?auto_115838 ) ( ON ?auto_115840 ?auto_115839 ) ( not ( = ?auto_115838 ?auto_115839 ) ) ( not ( = ?auto_115838 ?auto_115840 ) ) ( not ( = ?auto_115838 ?auto_115844 ) ) ( not ( = ?auto_115839 ?auto_115840 ) ) ( not ( = ?auto_115839 ?auto_115844 ) ) ( not ( = ?auto_115840 ?auto_115844 ) ) ( not ( = ?auto_115838 ?auto_115843 ) ) ( not ( = ?auto_115838 ?auto_115841 ) ) ( not ( = ?auto_115839 ?auto_115843 ) ) ( not ( = ?auto_115839 ?auto_115841 ) ) ( not ( = ?auto_115840 ?auto_115843 ) ) ( not ( = ?auto_115840 ?auto_115841 ) ) ( not ( = ?auto_115844 ?auto_115843 ) ) ( not ( = ?auto_115844 ?auto_115841 ) ) ( not ( = ?auto_115843 ?auto_115841 ) ) ( ON ?auto_115843 ?auto_115844 ) ( not ( = ?auto_115842 ?auto_115841 ) ) ( not ( = ?auto_115838 ?auto_115842 ) ) ( not ( = ?auto_115839 ?auto_115842 ) ) ( not ( = ?auto_115840 ?auto_115842 ) ) ( not ( = ?auto_115844 ?auto_115842 ) ) ( not ( = ?auto_115843 ?auto_115842 ) ) ( ON ?auto_115841 ?auto_115843 ) ( ON ?auto_115842 ?auto_115841 ) ( CLEAR ?auto_115842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115838 ?auto_115839 ?auto_115840 ?auto_115844 ?auto_115843 ?auto_115841 )
      ( MAKE-3PILE ?auto_115838 ?auto_115839 ?auto_115840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114669 - BLOCK
      ?auto_114670 - BLOCK
      ?auto_114671 - BLOCK
    )
    :vars
    (
      ?auto_114673 - BLOCK
      ?auto_114676 - BLOCK
      ?auto_114675 - BLOCK
      ?auto_114672 - BLOCK
      ?auto_114674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114673 ?auto_114671 ) ( ON-TABLE ?auto_114669 ) ( ON ?auto_114670 ?auto_114669 ) ( ON ?auto_114671 ?auto_114670 ) ( not ( = ?auto_114669 ?auto_114670 ) ) ( not ( = ?auto_114669 ?auto_114671 ) ) ( not ( = ?auto_114669 ?auto_114673 ) ) ( not ( = ?auto_114670 ?auto_114671 ) ) ( not ( = ?auto_114670 ?auto_114673 ) ) ( not ( = ?auto_114671 ?auto_114673 ) ) ( not ( = ?auto_114669 ?auto_114676 ) ) ( not ( = ?auto_114669 ?auto_114675 ) ) ( not ( = ?auto_114670 ?auto_114676 ) ) ( not ( = ?auto_114670 ?auto_114675 ) ) ( not ( = ?auto_114671 ?auto_114676 ) ) ( not ( = ?auto_114671 ?auto_114675 ) ) ( not ( = ?auto_114673 ?auto_114676 ) ) ( not ( = ?auto_114673 ?auto_114675 ) ) ( not ( = ?auto_114676 ?auto_114675 ) ) ( ON ?auto_114676 ?auto_114673 ) ( not ( = ?auto_114672 ?auto_114674 ) ) ( not ( = ?auto_114672 ?auto_114675 ) ) ( not ( = ?auto_114674 ?auto_114675 ) ) ( not ( = ?auto_114669 ?auto_114674 ) ) ( not ( = ?auto_114669 ?auto_114672 ) ) ( not ( = ?auto_114670 ?auto_114674 ) ) ( not ( = ?auto_114670 ?auto_114672 ) ) ( not ( = ?auto_114671 ?auto_114674 ) ) ( not ( = ?auto_114671 ?auto_114672 ) ) ( not ( = ?auto_114673 ?auto_114674 ) ) ( not ( = ?auto_114673 ?auto_114672 ) ) ( not ( = ?auto_114676 ?auto_114674 ) ) ( not ( = ?auto_114676 ?auto_114672 ) ) ( ON ?auto_114675 ?auto_114676 ) ( ON ?auto_114674 ?auto_114675 ) ( CLEAR ?auto_114674 ) ( HOLDING ?auto_114672 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114672 )
      ( MAKE-3PILE ?auto_114669 ?auto_114670 ?auto_114671 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_114677 - BLOCK
      ?auto_114678 - BLOCK
      ?auto_114679 - BLOCK
    )
    :vars
    (
      ?auto_114681 - BLOCK
      ?auto_114680 - BLOCK
      ?auto_114683 - BLOCK
      ?auto_114684 - BLOCK
      ?auto_114682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114681 ?auto_114679 ) ( ON-TABLE ?auto_114677 ) ( ON ?auto_114678 ?auto_114677 ) ( ON ?auto_114679 ?auto_114678 ) ( not ( = ?auto_114677 ?auto_114678 ) ) ( not ( = ?auto_114677 ?auto_114679 ) ) ( not ( = ?auto_114677 ?auto_114681 ) ) ( not ( = ?auto_114678 ?auto_114679 ) ) ( not ( = ?auto_114678 ?auto_114681 ) ) ( not ( = ?auto_114679 ?auto_114681 ) ) ( not ( = ?auto_114677 ?auto_114680 ) ) ( not ( = ?auto_114677 ?auto_114683 ) ) ( not ( = ?auto_114678 ?auto_114680 ) ) ( not ( = ?auto_114678 ?auto_114683 ) ) ( not ( = ?auto_114679 ?auto_114680 ) ) ( not ( = ?auto_114679 ?auto_114683 ) ) ( not ( = ?auto_114681 ?auto_114680 ) ) ( not ( = ?auto_114681 ?auto_114683 ) ) ( not ( = ?auto_114680 ?auto_114683 ) ) ( ON ?auto_114680 ?auto_114681 ) ( not ( = ?auto_114684 ?auto_114682 ) ) ( not ( = ?auto_114684 ?auto_114683 ) ) ( not ( = ?auto_114682 ?auto_114683 ) ) ( not ( = ?auto_114677 ?auto_114682 ) ) ( not ( = ?auto_114677 ?auto_114684 ) ) ( not ( = ?auto_114678 ?auto_114682 ) ) ( not ( = ?auto_114678 ?auto_114684 ) ) ( not ( = ?auto_114679 ?auto_114682 ) ) ( not ( = ?auto_114679 ?auto_114684 ) ) ( not ( = ?auto_114681 ?auto_114682 ) ) ( not ( = ?auto_114681 ?auto_114684 ) ) ( not ( = ?auto_114680 ?auto_114682 ) ) ( not ( = ?auto_114680 ?auto_114684 ) ) ( ON ?auto_114683 ?auto_114680 ) ( ON ?auto_114682 ?auto_114683 ) ( ON ?auto_114684 ?auto_114682 ) ( CLEAR ?auto_114684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114677 ?auto_114678 ?auto_114679 ?auto_114681 ?auto_114680 ?auto_114683 ?auto_114682 )
      ( MAKE-3PILE ?auto_114677 ?auto_114678 ?auto_114679 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114690 - BLOCK
      ?auto_114691 - BLOCK
      ?auto_114692 - BLOCK
      ?auto_114693 - BLOCK
      ?auto_114694 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_114694 ) ( CLEAR ?auto_114693 ) ( ON-TABLE ?auto_114690 ) ( ON ?auto_114691 ?auto_114690 ) ( ON ?auto_114692 ?auto_114691 ) ( ON ?auto_114693 ?auto_114692 ) ( not ( = ?auto_114690 ?auto_114691 ) ) ( not ( = ?auto_114690 ?auto_114692 ) ) ( not ( = ?auto_114690 ?auto_114693 ) ) ( not ( = ?auto_114690 ?auto_114694 ) ) ( not ( = ?auto_114691 ?auto_114692 ) ) ( not ( = ?auto_114691 ?auto_114693 ) ) ( not ( = ?auto_114691 ?auto_114694 ) ) ( not ( = ?auto_114692 ?auto_114693 ) ) ( not ( = ?auto_114692 ?auto_114694 ) ) ( not ( = ?auto_114693 ?auto_114694 ) ) )
    :subtasks
    ( ( !STACK ?auto_114694 ?auto_114693 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114695 - BLOCK
      ?auto_114696 - BLOCK
      ?auto_114697 - BLOCK
      ?auto_114698 - BLOCK
      ?auto_114699 - BLOCK
    )
    :vars
    (
      ?auto_114700 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_114698 ) ( ON-TABLE ?auto_114695 ) ( ON ?auto_114696 ?auto_114695 ) ( ON ?auto_114697 ?auto_114696 ) ( ON ?auto_114698 ?auto_114697 ) ( not ( = ?auto_114695 ?auto_114696 ) ) ( not ( = ?auto_114695 ?auto_114697 ) ) ( not ( = ?auto_114695 ?auto_114698 ) ) ( not ( = ?auto_114695 ?auto_114699 ) ) ( not ( = ?auto_114696 ?auto_114697 ) ) ( not ( = ?auto_114696 ?auto_114698 ) ) ( not ( = ?auto_114696 ?auto_114699 ) ) ( not ( = ?auto_114697 ?auto_114698 ) ) ( not ( = ?auto_114697 ?auto_114699 ) ) ( not ( = ?auto_114698 ?auto_114699 ) ) ( ON ?auto_114699 ?auto_114700 ) ( CLEAR ?auto_114699 ) ( HAND-EMPTY ) ( not ( = ?auto_114695 ?auto_114700 ) ) ( not ( = ?auto_114696 ?auto_114700 ) ) ( not ( = ?auto_114697 ?auto_114700 ) ) ( not ( = ?auto_114698 ?auto_114700 ) ) ( not ( = ?auto_114699 ?auto_114700 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114699 ?auto_114700 )
      ( MAKE-5PILE ?auto_114695 ?auto_114696 ?auto_114697 ?auto_114698 ?auto_114699 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114701 - BLOCK
      ?auto_114702 - BLOCK
      ?auto_114703 - BLOCK
      ?auto_114704 - BLOCK
      ?auto_114705 - BLOCK
    )
    :vars
    (
      ?auto_114706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114701 ) ( ON ?auto_114702 ?auto_114701 ) ( ON ?auto_114703 ?auto_114702 ) ( not ( = ?auto_114701 ?auto_114702 ) ) ( not ( = ?auto_114701 ?auto_114703 ) ) ( not ( = ?auto_114701 ?auto_114704 ) ) ( not ( = ?auto_114701 ?auto_114705 ) ) ( not ( = ?auto_114702 ?auto_114703 ) ) ( not ( = ?auto_114702 ?auto_114704 ) ) ( not ( = ?auto_114702 ?auto_114705 ) ) ( not ( = ?auto_114703 ?auto_114704 ) ) ( not ( = ?auto_114703 ?auto_114705 ) ) ( not ( = ?auto_114704 ?auto_114705 ) ) ( ON ?auto_114705 ?auto_114706 ) ( CLEAR ?auto_114705 ) ( not ( = ?auto_114701 ?auto_114706 ) ) ( not ( = ?auto_114702 ?auto_114706 ) ) ( not ( = ?auto_114703 ?auto_114706 ) ) ( not ( = ?auto_114704 ?auto_114706 ) ) ( not ( = ?auto_114705 ?auto_114706 ) ) ( HOLDING ?auto_114704 ) ( CLEAR ?auto_114703 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114701 ?auto_114702 ?auto_114703 ?auto_114704 )
      ( MAKE-5PILE ?auto_114701 ?auto_114702 ?auto_114703 ?auto_114704 ?auto_114705 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114707 - BLOCK
      ?auto_114708 - BLOCK
      ?auto_114709 - BLOCK
      ?auto_114710 - BLOCK
      ?auto_114711 - BLOCK
    )
    :vars
    (
      ?auto_114712 - BLOCK
      ?auto_114713 - BLOCK
      ?auto_114714 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114707 ) ( ON ?auto_114708 ?auto_114707 ) ( ON ?auto_114709 ?auto_114708 ) ( not ( = ?auto_114707 ?auto_114708 ) ) ( not ( = ?auto_114707 ?auto_114709 ) ) ( not ( = ?auto_114707 ?auto_114710 ) ) ( not ( = ?auto_114707 ?auto_114711 ) ) ( not ( = ?auto_114708 ?auto_114709 ) ) ( not ( = ?auto_114708 ?auto_114710 ) ) ( not ( = ?auto_114708 ?auto_114711 ) ) ( not ( = ?auto_114709 ?auto_114710 ) ) ( not ( = ?auto_114709 ?auto_114711 ) ) ( not ( = ?auto_114710 ?auto_114711 ) ) ( ON ?auto_114711 ?auto_114712 ) ( not ( = ?auto_114707 ?auto_114712 ) ) ( not ( = ?auto_114708 ?auto_114712 ) ) ( not ( = ?auto_114709 ?auto_114712 ) ) ( not ( = ?auto_114710 ?auto_114712 ) ) ( not ( = ?auto_114711 ?auto_114712 ) ) ( CLEAR ?auto_114709 ) ( ON ?auto_114710 ?auto_114711 ) ( CLEAR ?auto_114710 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114713 ) ( ON ?auto_114714 ?auto_114713 ) ( ON ?auto_114712 ?auto_114714 ) ( not ( = ?auto_114713 ?auto_114714 ) ) ( not ( = ?auto_114713 ?auto_114712 ) ) ( not ( = ?auto_114713 ?auto_114711 ) ) ( not ( = ?auto_114713 ?auto_114710 ) ) ( not ( = ?auto_114714 ?auto_114712 ) ) ( not ( = ?auto_114714 ?auto_114711 ) ) ( not ( = ?auto_114714 ?auto_114710 ) ) ( not ( = ?auto_114707 ?auto_114713 ) ) ( not ( = ?auto_114707 ?auto_114714 ) ) ( not ( = ?auto_114708 ?auto_114713 ) ) ( not ( = ?auto_114708 ?auto_114714 ) ) ( not ( = ?auto_114709 ?auto_114713 ) ) ( not ( = ?auto_114709 ?auto_114714 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114713 ?auto_114714 ?auto_114712 ?auto_114711 )
      ( MAKE-5PILE ?auto_114707 ?auto_114708 ?auto_114709 ?auto_114710 ?auto_114711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114715 - BLOCK
      ?auto_114716 - BLOCK
      ?auto_114717 - BLOCK
      ?auto_114718 - BLOCK
      ?auto_114719 - BLOCK
    )
    :vars
    (
      ?auto_114722 - BLOCK
      ?auto_114721 - BLOCK
      ?auto_114720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114715 ) ( ON ?auto_114716 ?auto_114715 ) ( not ( = ?auto_114715 ?auto_114716 ) ) ( not ( = ?auto_114715 ?auto_114717 ) ) ( not ( = ?auto_114715 ?auto_114718 ) ) ( not ( = ?auto_114715 ?auto_114719 ) ) ( not ( = ?auto_114716 ?auto_114717 ) ) ( not ( = ?auto_114716 ?auto_114718 ) ) ( not ( = ?auto_114716 ?auto_114719 ) ) ( not ( = ?auto_114717 ?auto_114718 ) ) ( not ( = ?auto_114717 ?auto_114719 ) ) ( not ( = ?auto_114718 ?auto_114719 ) ) ( ON ?auto_114719 ?auto_114722 ) ( not ( = ?auto_114715 ?auto_114722 ) ) ( not ( = ?auto_114716 ?auto_114722 ) ) ( not ( = ?auto_114717 ?auto_114722 ) ) ( not ( = ?auto_114718 ?auto_114722 ) ) ( not ( = ?auto_114719 ?auto_114722 ) ) ( ON ?auto_114718 ?auto_114719 ) ( CLEAR ?auto_114718 ) ( ON-TABLE ?auto_114721 ) ( ON ?auto_114720 ?auto_114721 ) ( ON ?auto_114722 ?auto_114720 ) ( not ( = ?auto_114721 ?auto_114720 ) ) ( not ( = ?auto_114721 ?auto_114722 ) ) ( not ( = ?auto_114721 ?auto_114719 ) ) ( not ( = ?auto_114721 ?auto_114718 ) ) ( not ( = ?auto_114720 ?auto_114722 ) ) ( not ( = ?auto_114720 ?auto_114719 ) ) ( not ( = ?auto_114720 ?auto_114718 ) ) ( not ( = ?auto_114715 ?auto_114721 ) ) ( not ( = ?auto_114715 ?auto_114720 ) ) ( not ( = ?auto_114716 ?auto_114721 ) ) ( not ( = ?auto_114716 ?auto_114720 ) ) ( not ( = ?auto_114717 ?auto_114721 ) ) ( not ( = ?auto_114717 ?auto_114720 ) ) ( HOLDING ?auto_114717 ) ( CLEAR ?auto_114716 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114715 ?auto_114716 ?auto_114717 )
      ( MAKE-5PILE ?auto_114715 ?auto_114716 ?auto_114717 ?auto_114718 ?auto_114719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114723 - BLOCK
      ?auto_114724 - BLOCK
      ?auto_114725 - BLOCK
      ?auto_114726 - BLOCK
      ?auto_114727 - BLOCK
    )
    :vars
    (
      ?auto_114730 - BLOCK
      ?auto_114728 - BLOCK
      ?auto_114729 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114723 ) ( ON ?auto_114724 ?auto_114723 ) ( not ( = ?auto_114723 ?auto_114724 ) ) ( not ( = ?auto_114723 ?auto_114725 ) ) ( not ( = ?auto_114723 ?auto_114726 ) ) ( not ( = ?auto_114723 ?auto_114727 ) ) ( not ( = ?auto_114724 ?auto_114725 ) ) ( not ( = ?auto_114724 ?auto_114726 ) ) ( not ( = ?auto_114724 ?auto_114727 ) ) ( not ( = ?auto_114725 ?auto_114726 ) ) ( not ( = ?auto_114725 ?auto_114727 ) ) ( not ( = ?auto_114726 ?auto_114727 ) ) ( ON ?auto_114727 ?auto_114730 ) ( not ( = ?auto_114723 ?auto_114730 ) ) ( not ( = ?auto_114724 ?auto_114730 ) ) ( not ( = ?auto_114725 ?auto_114730 ) ) ( not ( = ?auto_114726 ?auto_114730 ) ) ( not ( = ?auto_114727 ?auto_114730 ) ) ( ON ?auto_114726 ?auto_114727 ) ( ON-TABLE ?auto_114728 ) ( ON ?auto_114729 ?auto_114728 ) ( ON ?auto_114730 ?auto_114729 ) ( not ( = ?auto_114728 ?auto_114729 ) ) ( not ( = ?auto_114728 ?auto_114730 ) ) ( not ( = ?auto_114728 ?auto_114727 ) ) ( not ( = ?auto_114728 ?auto_114726 ) ) ( not ( = ?auto_114729 ?auto_114730 ) ) ( not ( = ?auto_114729 ?auto_114727 ) ) ( not ( = ?auto_114729 ?auto_114726 ) ) ( not ( = ?auto_114723 ?auto_114728 ) ) ( not ( = ?auto_114723 ?auto_114729 ) ) ( not ( = ?auto_114724 ?auto_114728 ) ) ( not ( = ?auto_114724 ?auto_114729 ) ) ( not ( = ?auto_114725 ?auto_114728 ) ) ( not ( = ?auto_114725 ?auto_114729 ) ) ( CLEAR ?auto_114724 ) ( ON ?auto_114725 ?auto_114726 ) ( CLEAR ?auto_114725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114728 ?auto_114729 ?auto_114730 ?auto_114727 ?auto_114726 )
      ( MAKE-5PILE ?auto_114723 ?auto_114724 ?auto_114725 ?auto_114726 ?auto_114727 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114731 - BLOCK
      ?auto_114732 - BLOCK
      ?auto_114733 - BLOCK
      ?auto_114734 - BLOCK
      ?auto_114735 - BLOCK
    )
    :vars
    (
      ?auto_114738 - BLOCK
      ?auto_114737 - BLOCK
      ?auto_114736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114731 ) ( not ( = ?auto_114731 ?auto_114732 ) ) ( not ( = ?auto_114731 ?auto_114733 ) ) ( not ( = ?auto_114731 ?auto_114734 ) ) ( not ( = ?auto_114731 ?auto_114735 ) ) ( not ( = ?auto_114732 ?auto_114733 ) ) ( not ( = ?auto_114732 ?auto_114734 ) ) ( not ( = ?auto_114732 ?auto_114735 ) ) ( not ( = ?auto_114733 ?auto_114734 ) ) ( not ( = ?auto_114733 ?auto_114735 ) ) ( not ( = ?auto_114734 ?auto_114735 ) ) ( ON ?auto_114735 ?auto_114738 ) ( not ( = ?auto_114731 ?auto_114738 ) ) ( not ( = ?auto_114732 ?auto_114738 ) ) ( not ( = ?auto_114733 ?auto_114738 ) ) ( not ( = ?auto_114734 ?auto_114738 ) ) ( not ( = ?auto_114735 ?auto_114738 ) ) ( ON ?auto_114734 ?auto_114735 ) ( ON-TABLE ?auto_114737 ) ( ON ?auto_114736 ?auto_114737 ) ( ON ?auto_114738 ?auto_114736 ) ( not ( = ?auto_114737 ?auto_114736 ) ) ( not ( = ?auto_114737 ?auto_114738 ) ) ( not ( = ?auto_114737 ?auto_114735 ) ) ( not ( = ?auto_114737 ?auto_114734 ) ) ( not ( = ?auto_114736 ?auto_114738 ) ) ( not ( = ?auto_114736 ?auto_114735 ) ) ( not ( = ?auto_114736 ?auto_114734 ) ) ( not ( = ?auto_114731 ?auto_114737 ) ) ( not ( = ?auto_114731 ?auto_114736 ) ) ( not ( = ?auto_114732 ?auto_114737 ) ) ( not ( = ?auto_114732 ?auto_114736 ) ) ( not ( = ?auto_114733 ?auto_114737 ) ) ( not ( = ?auto_114733 ?auto_114736 ) ) ( ON ?auto_114733 ?auto_114734 ) ( CLEAR ?auto_114733 ) ( HOLDING ?auto_114732 ) ( CLEAR ?auto_114731 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114731 ?auto_114732 )
      ( MAKE-5PILE ?auto_114731 ?auto_114732 ?auto_114733 ?auto_114734 ?auto_114735 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114739 - BLOCK
      ?auto_114740 - BLOCK
      ?auto_114741 - BLOCK
      ?auto_114742 - BLOCK
      ?auto_114743 - BLOCK
    )
    :vars
    (
      ?auto_114746 - BLOCK
      ?auto_114745 - BLOCK
      ?auto_114744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114739 ) ( not ( = ?auto_114739 ?auto_114740 ) ) ( not ( = ?auto_114739 ?auto_114741 ) ) ( not ( = ?auto_114739 ?auto_114742 ) ) ( not ( = ?auto_114739 ?auto_114743 ) ) ( not ( = ?auto_114740 ?auto_114741 ) ) ( not ( = ?auto_114740 ?auto_114742 ) ) ( not ( = ?auto_114740 ?auto_114743 ) ) ( not ( = ?auto_114741 ?auto_114742 ) ) ( not ( = ?auto_114741 ?auto_114743 ) ) ( not ( = ?auto_114742 ?auto_114743 ) ) ( ON ?auto_114743 ?auto_114746 ) ( not ( = ?auto_114739 ?auto_114746 ) ) ( not ( = ?auto_114740 ?auto_114746 ) ) ( not ( = ?auto_114741 ?auto_114746 ) ) ( not ( = ?auto_114742 ?auto_114746 ) ) ( not ( = ?auto_114743 ?auto_114746 ) ) ( ON ?auto_114742 ?auto_114743 ) ( ON-TABLE ?auto_114745 ) ( ON ?auto_114744 ?auto_114745 ) ( ON ?auto_114746 ?auto_114744 ) ( not ( = ?auto_114745 ?auto_114744 ) ) ( not ( = ?auto_114745 ?auto_114746 ) ) ( not ( = ?auto_114745 ?auto_114743 ) ) ( not ( = ?auto_114745 ?auto_114742 ) ) ( not ( = ?auto_114744 ?auto_114746 ) ) ( not ( = ?auto_114744 ?auto_114743 ) ) ( not ( = ?auto_114744 ?auto_114742 ) ) ( not ( = ?auto_114739 ?auto_114745 ) ) ( not ( = ?auto_114739 ?auto_114744 ) ) ( not ( = ?auto_114740 ?auto_114745 ) ) ( not ( = ?auto_114740 ?auto_114744 ) ) ( not ( = ?auto_114741 ?auto_114745 ) ) ( not ( = ?auto_114741 ?auto_114744 ) ) ( ON ?auto_114741 ?auto_114742 ) ( CLEAR ?auto_114739 ) ( ON ?auto_114740 ?auto_114741 ) ( CLEAR ?auto_114740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114745 ?auto_114744 ?auto_114746 ?auto_114743 ?auto_114742 ?auto_114741 )
      ( MAKE-5PILE ?auto_114739 ?auto_114740 ?auto_114741 ?auto_114742 ?auto_114743 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114747 - BLOCK
      ?auto_114748 - BLOCK
      ?auto_114749 - BLOCK
      ?auto_114750 - BLOCK
      ?auto_114751 - BLOCK
    )
    :vars
    (
      ?auto_114753 - BLOCK
      ?auto_114754 - BLOCK
      ?auto_114752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114747 ?auto_114748 ) ) ( not ( = ?auto_114747 ?auto_114749 ) ) ( not ( = ?auto_114747 ?auto_114750 ) ) ( not ( = ?auto_114747 ?auto_114751 ) ) ( not ( = ?auto_114748 ?auto_114749 ) ) ( not ( = ?auto_114748 ?auto_114750 ) ) ( not ( = ?auto_114748 ?auto_114751 ) ) ( not ( = ?auto_114749 ?auto_114750 ) ) ( not ( = ?auto_114749 ?auto_114751 ) ) ( not ( = ?auto_114750 ?auto_114751 ) ) ( ON ?auto_114751 ?auto_114753 ) ( not ( = ?auto_114747 ?auto_114753 ) ) ( not ( = ?auto_114748 ?auto_114753 ) ) ( not ( = ?auto_114749 ?auto_114753 ) ) ( not ( = ?auto_114750 ?auto_114753 ) ) ( not ( = ?auto_114751 ?auto_114753 ) ) ( ON ?auto_114750 ?auto_114751 ) ( ON-TABLE ?auto_114754 ) ( ON ?auto_114752 ?auto_114754 ) ( ON ?auto_114753 ?auto_114752 ) ( not ( = ?auto_114754 ?auto_114752 ) ) ( not ( = ?auto_114754 ?auto_114753 ) ) ( not ( = ?auto_114754 ?auto_114751 ) ) ( not ( = ?auto_114754 ?auto_114750 ) ) ( not ( = ?auto_114752 ?auto_114753 ) ) ( not ( = ?auto_114752 ?auto_114751 ) ) ( not ( = ?auto_114752 ?auto_114750 ) ) ( not ( = ?auto_114747 ?auto_114754 ) ) ( not ( = ?auto_114747 ?auto_114752 ) ) ( not ( = ?auto_114748 ?auto_114754 ) ) ( not ( = ?auto_114748 ?auto_114752 ) ) ( not ( = ?auto_114749 ?auto_114754 ) ) ( not ( = ?auto_114749 ?auto_114752 ) ) ( ON ?auto_114749 ?auto_114750 ) ( ON ?auto_114748 ?auto_114749 ) ( CLEAR ?auto_114748 ) ( HOLDING ?auto_114747 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114747 )
      ( MAKE-5PILE ?auto_114747 ?auto_114748 ?auto_114749 ?auto_114750 ?auto_114751 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_114755 - BLOCK
      ?auto_114756 - BLOCK
      ?auto_114757 - BLOCK
      ?auto_114758 - BLOCK
      ?auto_114759 - BLOCK
    )
    :vars
    (
      ?auto_114760 - BLOCK
      ?auto_114762 - BLOCK
      ?auto_114761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114755 ?auto_114756 ) ) ( not ( = ?auto_114755 ?auto_114757 ) ) ( not ( = ?auto_114755 ?auto_114758 ) ) ( not ( = ?auto_114755 ?auto_114759 ) ) ( not ( = ?auto_114756 ?auto_114757 ) ) ( not ( = ?auto_114756 ?auto_114758 ) ) ( not ( = ?auto_114756 ?auto_114759 ) ) ( not ( = ?auto_114757 ?auto_114758 ) ) ( not ( = ?auto_114757 ?auto_114759 ) ) ( not ( = ?auto_114758 ?auto_114759 ) ) ( ON ?auto_114759 ?auto_114760 ) ( not ( = ?auto_114755 ?auto_114760 ) ) ( not ( = ?auto_114756 ?auto_114760 ) ) ( not ( = ?auto_114757 ?auto_114760 ) ) ( not ( = ?auto_114758 ?auto_114760 ) ) ( not ( = ?auto_114759 ?auto_114760 ) ) ( ON ?auto_114758 ?auto_114759 ) ( ON-TABLE ?auto_114762 ) ( ON ?auto_114761 ?auto_114762 ) ( ON ?auto_114760 ?auto_114761 ) ( not ( = ?auto_114762 ?auto_114761 ) ) ( not ( = ?auto_114762 ?auto_114760 ) ) ( not ( = ?auto_114762 ?auto_114759 ) ) ( not ( = ?auto_114762 ?auto_114758 ) ) ( not ( = ?auto_114761 ?auto_114760 ) ) ( not ( = ?auto_114761 ?auto_114759 ) ) ( not ( = ?auto_114761 ?auto_114758 ) ) ( not ( = ?auto_114755 ?auto_114762 ) ) ( not ( = ?auto_114755 ?auto_114761 ) ) ( not ( = ?auto_114756 ?auto_114762 ) ) ( not ( = ?auto_114756 ?auto_114761 ) ) ( not ( = ?auto_114757 ?auto_114762 ) ) ( not ( = ?auto_114757 ?auto_114761 ) ) ( ON ?auto_114757 ?auto_114758 ) ( ON ?auto_114756 ?auto_114757 ) ( ON ?auto_114755 ?auto_114756 ) ( CLEAR ?auto_114755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114762 ?auto_114761 ?auto_114760 ?auto_114759 ?auto_114758 ?auto_114757 ?auto_114756 )
      ( MAKE-5PILE ?auto_114755 ?auto_114756 ?auto_114757 ?auto_114758 ?auto_114759 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114765 - BLOCK
      ?auto_114766 - BLOCK
    )
    :vars
    (
      ?auto_114767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114767 ?auto_114766 ) ( CLEAR ?auto_114767 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114765 ) ( ON ?auto_114766 ?auto_114765 ) ( not ( = ?auto_114765 ?auto_114766 ) ) ( not ( = ?auto_114765 ?auto_114767 ) ) ( not ( = ?auto_114766 ?auto_114767 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114767 ?auto_114766 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114768 - BLOCK
      ?auto_114769 - BLOCK
    )
    :vars
    (
      ?auto_114770 - BLOCK
      ?auto_114771 - BLOCK
      ?auto_114772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114770 ?auto_114769 ) ( CLEAR ?auto_114770 ) ( ON-TABLE ?auto_114768 ) ( ON ?auto_114769 ?auto_114768 ) ( not ( = ?auto_114768 ?auto_114769 ) ) ( not ( = ?auto_114768 ?auto_114770 ) ) ( not ( = ?auto_114769 ?auto_114770 ) ) ( HOLDING ?auto_114771 ) ( CLEAR ?auto_114772 ) ( not ( = ?auto_114768 ?auto_114771 ) ) ( not ( = ?auto_114768 ?auto_114772 ) ) ( not ( = ?auto_114769 ?auto_114771 ) ) ( not ( = ?auto_114769 ?auto_114772 ) ) ( not ( = ?auto_114770 ?auto_114771 ) ) ( not ( = ?auto_114770 ?auto_114772 ) ) ( not ( = ?auto_114771 ?auto_114772 ) ) )
    :subtasks
    ( ( !STACK ?auto_114771 ?auto_114772 )
      ( MAKE-2PILE ?auto_114768 ?auto_114769 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114773 - BLOCK
      ?auto_114774 - BLOCK
    )
    :vars
    (
      ?auto_114775 - BLOCK
      ?auto_114776 - BLOCK
      ?auto_114777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114775 ?auto_114774 ) ( ON-TABLE ?auto_114773 ) ( ON ?auto_114774 ?auto_114773 ) ( not ( = ?auto_114773 ?auto_114774 ) ) ( not ( = ?auto_114773 ?auto_114775 ) ) ( not ( = ?auto_114774 ?auto_114775 ) ) ( CLEAR ?auto_114776 ) ( not ( = ?auto_114773 ?auto_114777 ) ) ( not ( = ?auto_114773 ?auto_114776 ) ) ( not ( = ?auto_114774 ?auto_114777 ) ) ( not ( = ?auto_114774 ?auto_114776 ) ) ( not ( = ?auto_114775 ?auto_114777 ) ) ( not ( = ?auto_114775 ?auto_114776 ) ) ( not ( = ?auto_114777 ?auto_114776 ) ) ( ON ?auto_114777 ?auto_114775 ) ( CLEAR ?auto_114777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114773 ?auto_114774 ?auto_114775 )
      ( MAKE-2PILE ?auto_114773 ?auto_114774 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114778 - BLOCK
      ?auto_114779 - BLOCK
    )
    :vars
    (
      ?auto_114782 - BLOCK
      ?auto_114781 - BLOCK
      ?auto_114780 - BLOCK
      ?auto_114783 - BLOCK
      ?auto_114785 - BLOCK
      ?auto_114784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114782 ?auto_114779 ) ( ON-TABLE ?auto_114778 ) ( ON ?auto_114779 ?auto_114778 ) ( not ( = ?auto_114778 ?auto_114779 ) ) ( not ( = ?auto_114778 ?auto_114782 ) ) ( not ( = ?auto_114779 ?auto_114782 ) ) ( not ( = ?auto_114778 ?auto_114781 ) ) ( not ( = ?auto_114778 ?auto_114780 ) ) ( not ( = ?auto_114779 ?auto_114781 ) ) ( not ( = ?auto_114779 ?auto_114780 ) ) ( not ( = ?auto_114782 ?auto_114781 ) ) ( not ( = ?auto_114782 ?auto_114780 ) ) ( not ( = ?auto_114781 ?auto_114780 ) ) ( ON ?auto_114781 ?auto_114782 ) ( CLEAR ?auto_114781 ) ( HOLDING ?auto_114780 ) ( CLEAR ?auto_114783 ) ( ON-TABLE ?auto_114785 ) ( ON ?auto_114784 ?auto_114785 ) ( ON ?auto_114783 ?auto_114784 ) ( not ( = ?auto_114785 ?auto_114784 ) ) ( not ( = ?auto_114785 ?auto_114783 ) ) ( not ( = ?auto_114785 ?auto_114780 ) ) ( not ( = ?auto_114784 ?auto_114783 ) ) ( not ( = ?auto_114784 ?auto_114780 ) ) ( not ( = ?auto_114783 ?auto_114780 ) ) ( not ( = ?auto_114778 ?auto_114783 ) ) ( not ( = ?auto_114778 ?auto_114785 ) ) ( not ( = ?auto_114778 ?auto_114784 ) ) ( not ( = ?auto_114779 ?auto_114783 ) ) ( not ( = ?auto_114779 ?auto_114785 ) ) ( not ( = ?auto_114779 ?auto_114784 ) ) ( not ( = ?auto_114782 ?auto_114783 ) ) ( not ( = ?auto_114782 ?auto_114785 ) ) ( not ( = ?auto_114782 ?auto_114784 ) ) ( not ( = ?auto_114781 ?auto_114783 ) ) ( not ( = ?auto_114781 ?auto_114785 ) ) ( not ( = ?auto_114781 ?auto_114784 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114785 ?auto_114784 ?auto_114783 ?auto_114780 )
      ( MAKE-2PILE ?auto_114778 ?auto_114779 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114786 - BLOCK
      ?auto_114787 - BLOCK
    )
    :vars
    (
      ?auto_114793 - BLOCK
      ?auto_114790 - BLOCK
      ?auto_114792 - BLOCK
      ?auto_114791 - BLOCK
      ?auto_114789 - BLOCK
      ?auto_114788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114793 ?auto_114787 ) ( ON-TABLE ?auto_114786 ) ( ON ?auto_114787 ?auto_114786 ) ( not ( = ?auto_114786 ?auto_114787 ) ) ( not ( = ?auto_114786 ?auto_114793 ) ) ( not ( = ?auto_114787 ?auto_114793 ) ) ( not ( = ?auto_114786 ?auto_114790 ) ) ( not ( = ?auto_114786 ?auto_114792 ) ) ( not ( = ?auto_114787 ?auto_114790 ) ) ( not ( = ?auto_114787 ?auto_114792 ) ) ( not ( = ?auto_114793 ?auto_114790 ) ) ( not ( = ?auto_114793 ?auto_114792 ) ) ( not ( = ?auto_114790 ?auto_114792 ) ) ( ON ?auto_114790 ?auto_114793 ) ( CLEAR ?auto_114791 ) ( ON-TABLE ?auto_114789 ) ( ON ?auto_114788 ?auto_114789 ) ( ON ?auto_114791 ?auto_114788 ) ( not ( = ?auto_114789 ?auto_114788 ) ) ( not ( = ?auto_114789 ?auto_114791 ) ) ( not ( = ?auto_114789 ?auto_114792 ) ) ( not ( = ?auto_114788 ?auto_114791 ) ) ( not ( = ?auto_114788 ?auto_114792 ) ) ( not ( = ?auto_114791 ?auto_114792 ) ) ( not ( = ?auto_114786 ?auto_114791 ) ) ( not ( = ?auto_114786 ?auto_114789 ) ) ( not ( = ?auto_114786 ?auto_114788 ) ) ( not ( = ?auto_114787 ?auto_114791 ) ) ( not ( = ?auto_114787 ?auto_114789 ) ) ( not ( = ?auto_114787 ?auto_114788 ) ) ( not ( = ?auto_114793 ?auto_114791 ) ) ( not ( = ?auto_114793 ?auto_114789 ) ) ( not ( = ?auto_114793 ?auto_114788 ) ) ( not ( = ?auto_114790 ?auto_114791 ) ) ( not ( = ?auto_114790 ?auto_114789 ) ) ( not ( = ?auto_114790 ?auto_114788 ) ) ( ON ?auto_114792 ?auto_114790 ) ( CLEAR ?auto_114792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114786 ?auto_114787 ?auto_114793 ?auto_114790 )
      ( MAKE-2PILE ?auto_114786 ?auto_114787 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114794 - BLOCK
      ?auto_114795 - BLOCK
    )
    :vars
    (
      ?auto_114796 - BLOCK
      ?auto_114799 - BLOCK
      ?auto_114798 - BLOCK
      ?auto_114797 - BLOCK
      ?auto_114800 - BLOCK
      ?auto_114801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114796 ?auto_114795 ) ( ON-TABLE ?auto_114794 ) ( ON ?auto_114795 ?auto_114794 ) ( not ( = ?auto_114794 ?auto_114795 ) ) ( not ( = ?auto_114794 ?auto_114796 ) ) ( not ( = ?auto_114795 ?auto_114796 ) ) ( not ( = ?auto_114794 ?auto_114799 ) ) ( not ( = ?auto_114794 ?auto_114798 ) ) ( not ( = ?auto_114795 ?auto_114799 ) ) ( not ( = ?auto_114795 ?auto_114798 ) ) ( not ( = ?auto_114796 ?auto_114799 ) ) ( not ( = ?auto_114796 ?auto_114798 ) ) ( not ( = ?auto_114799 ?auto_114798 ) ) ( ON ?auto_114799 ?auto_114796 ) ( ON-TABLE ?auto_114797 ) ( ON ?auto_114800 ?auto_114797 ) ( not ( = ?auto_114797 ?auto_114800 ) ) ( not ( = ?auto_114797 ?auto_114801 ) ) ( not ( = ?auto_114797 ?auto_114798 ) ) ( not ( = ?auto_114800 ?auto_114801 ) ) ( not ( = ?auto_114800 ?auto_114798 ) ) ( not ( = ?auto_114801 ?auto_114798 ) ) ( not ( = ?auto_114794 ?auto_114801 ) ) ( not ( = ?auto_114794 ?auto_114797 ) ) ( not ( = ?auto_114794 ?auto_114800 ) ) ( not ( = ?auto_114795 ?auto_114801 ) ) ( not ( = ?auto_114795 ?auto_114797 ) ) ( not ( = ?auto_114795 ?auto_114800 ) ) ( not ( = ?auto_114796 ?auto_114801 ) ) ( not ( = ?auto_114796 ?auto_114797 ) ) ( not ( = ?auto_114796 ?auto_114800 ) ) ( not ( = ?auto_114799 ?auto_114801 ) ) ( not ( = ?auto_114799 ?auto_114797 ) ) ( not ( = ?auto_114799 ?auto_114800 ) ) ( ON ?auto_114798 ?auto_114799 ) ( CLEAR ?auto_114798 ) ( HOLDING ?auto_114801 ) ( CLEAR ?auto_114800 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114797 ?auto_114800 ?auto_114801 )
      ( MAKE-2PILE ?auto_114794 ?auto_114795 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114802 - BLOCK
      ?auto_114803 - BLOCK
    )
    :vars
    (
      ?auto_114806 - BLOCK
      ?auto_114804 - BLOCK
      ?auto_114809 - BLOCK
      ?auto_114805 - BLOCK
      ?auto_114808 - BLOCK
      ?auto_114807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114806 ?auto_114803 ) ( ON-TABLE ?auto_114802 ) ( ON ?auto_114803 ?auto_114802 ) ( not ( = ?auto_114802 ?auto_114803 ) ) ( not ( = ?auto_114802 ?auto_114806 ) ) ( not ( = ?auto_114803 ?auto_114806 ) ) ( not ( = ?auto_114802 ?auto_114804 ) ) ( not ( = ?auto_114802 ?auto_114809 ) ) ( not ( = ?auto_114803 ?auto_114804 ) ) ( not ( = ?auto_114803 ?auto_114809 ) ) ( not ( = ?auto_114806 ?auto_114804 ) ) ( not ( = ?auto_114806 ?auto_114809 ) ) ( not ( = ?auto_114804 ?auto_114809 ) ) ( ON ?auto_114804 ?auto_114806 ) ( ON-TABLE ?auto_114805 ) ( ON ?auto_114808 ?auto_114805 ) ( not ( = ?auto_114805 ?auto_114808 ) ) ( not ( = ?auto_114805 ?auto_114807 ) ) ( not ( = ?auto_114805 ?auto_114809 ) ) ( not ( = ?auto_114808 ?auto_114807 ) ) ( not ( = ?auto_114808 ?auto_114809 ) ) ( not ( = ?auto_114807 ?auto_114809 ) ) ( not ( = ?auto_114802 ?auto_114807 ) ) ( not ( = ?auto_114802 ?auto_114805 ) ) ( not ( = ?auto_114802 ?auto_114808 ) ) ( not ( = ?auto_114803 ?auto_114807 ) ) ( not ( = ?auto_114803 ?auto_114805 ) ) ( not ( = ?auto_114803 ?auto_114808 ) ) ( not ( = ?auto_114806 ?auto_114807 ) ) ( not ( = ?auto_114806 ?auto_114805 ) ) ( not ( = ?auto_114806 ?auto_114808 ) ) ( not ( = ?auto_114804 ?auto_114807 ) ) ( not ( = ?auto_114804 ?auto_114805 ) ) ( not ( = ?auto_114804 ?auto_114808 ) ) ( ON ?auto_114809 ?auto_114804 ) ( CLEAR ?auto_114808 ) ( ON ?auto_114807 ?auto_114809 ) ( CLEAR ?auto_114807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114802 ?auto_114803 ?auto_114806 ?auto_114804 ?auto_114809 )
      ( MAKE-2PILE ?auto_114802 ?auto_114803 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114810 - BLOCK
      ?auto_114811 - BLOCK
    )
    :vars
    (
      ?auto_114814 - BLOCK
      ?auto_114815 - BLOCK
      ?auto_114816 - BLOCK
      ?auto_114812 - BLOCK
      ?auto_114817 - BLOCK
      ?auto_114813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114814 ?auto_114811 ) ( ON-TABLE ?auto_114810 ) ( ON ?auto_114811 ?auto_114810 ) ( not ( = ?auto_114810 ?auto_114811 ) ) ( not ( = ?auto_114810 ?auto_114814 ) ) ( not ( = ?auto_114811 ?auto_114814 ) ) ( not ( = ?auto_114810 ?auto_114815 ) ) ( not ( = ?auto_114810 ?auto_114816 ) ) ( not ( = ?auto_114811 ?auto_114815 ) ) ( not ( = ?auto_114811 ?auto_114816 ) ) ( not ( = ?auto_114814 ?auto_114815 ) ) ( not ( = ?auto_114814 ?auto_114816 ) ) ( not ( = ?auto_114815 ?auto_114816 ) ) ( ON ?auto_114815 ?auto_114814 ) ( ON-TABLE ?auto_114812 ) ( not ( = ?auto_114812 ?auto_114817 ) ) ( not ( = ?auto_114812 ?auto_114813 ) ) ( not ( = ?auto_114812 ?auto_114816 ) ) ( not ( = ?auto_114817 ?auto_114813 ) ) ( not ( = ?auto_114817 ?auto_114816 ) ) ( not ( = ?auto_114813 ?auto_114816 ) ) ( not ( = ?auto_114810 ?auto_114813 ) ) ( not ( = ?auto_114810 ?auto_114812 ) ) ( not ( = ?auto_114810 ?auto_114817 ) ) ( not ( = ?auto_114811 ?auto_114813 ) ) ( not ( = ?auto_114811 ?auto_114812 ) ) ( not ( = ?auto_114811 ?auto_114817 ) ) ( not ( = ?auto_114814 ?auto_114813 ) ) ( not ( = ?auto_114814 ?auto_114812 ) ) ( not ( = ?auto_114814 ?auto_114817 ) ) ( not ( = ?auto_114815 ?auto_114813 ) ) ( not ( = ?auto_114815 ?auto_114812 ) ) ( not ( = ?auto_114815 ?auto_114817 ) ) ( ON ?auto_114816 ?auto_114815 ) ( ON ?auto_114813 ?auto_114816 ) ( CLEAR ?auto_114813 ) ( HOLDING ?auto_114817 ) ( CLEAR ?auto_114812 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114812 ?auto_114817 )
      ( MAKE-2PILE ?auto_114810 ?auto_114811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116111 - BLOCK
      ?auto_116112 - BLOCK
    )
    :vars
    (
      ?auto_116116 - BLOCK
      ?auto_116113 - BLOCK
      ?auto_116114 - BLOCK
      ?auto_116115 - BLOCK
      ?auto_116117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116116 ?auto_116112 ) ( ON-TABLE ?auto_116111 ) ( ON ?auto_116112 ?auto_116111 ) ( not ( = ?auto_116111 ?auto_116112 ) ) ( not ( = ?auto_116111 ?auto_116116 ) ) ( not ( = ?auto_116112 ?auto_116116 ) ) ( not ( = ?auto_116111 ?auto_116113 ) ) ( not ( = ?auto_116111 ?auto_116114 ) ) ( not ( = ?auto_116112 ?auto_116113 ) ) ( not ( = ?auto_116112 ?auto_116114 ) ) ( not ( = ?auto_116116 ?auto_116113 ) ) ( not ( = ?auto_116116 ?auto_116114 ) ) ( not ( = ?auto_116113 ?auto_116114 ) ) ( ON ?auto_116113 ?auto_116116 ) ( not ( = ?auto_116115 ?auto_116117 ) ) ( not ( = ?auto_116115 ?auto_116114 ) ) ( not ( = ?auto_116117 ?auto_116114 ) ) ( not ( = ?auto_116111 ?auto_116117 ) ) ( not ( = ?auto_116111 ?auto_116115 ) ) ( not ( = ?auto_116112 ?auto_116117 ) ) ( not ( = ?auto_116112 ?auto_116115 ) ) ( not ( = ?auto_116116 ?auto_116117 ) ) ( not ( = ?auto_116116 ?auto_116115 ) ) ( not ( = ?auto_116113 ?auto_116117 ) ) ( not ( = ?auto_116113 ?auto_116115 ) ) ( ON ?auto_116114 ?auto_116113 ) ( ON ?auto_116117 ?auto_116114 ) ( ON ?auto_116115 ?auto_116117 ) ( CLEAR ?auto_116115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116111 ?auto_116112 ?auto_116116 ?auto_116113 ?auto_116114 ?auto_116117 )
      ( MAKE-2PILE ?auto_116111 ?auto_116112 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114826 - BLOCK
      ?auto_114827 - BLOCK
    )
    :vars
    (
      ?auto_114828 - BLOCK
      ?auto_114829 - BLOCK
      ?auto_114831 - BLOCK
      ?auto_114833 - BLOCK
      ?auto_114830 - BLOCK
      ?auto_114832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114828 ?auto_114827 ) ( ON-TABLE ?auto_114826 ) ( ON ?auto_114827 ?auto_114826 ) ( not ( = ?auto_114826 ?auto_114827 ) ) ( not ( = ?auto_114826 ?auto_114828 ) ) ( not ( = ?auto_114827 ?auto_114828 ) ) ( not ( = ?auto_114826 ?auto_114829 ) ) ( not ( = ?auto_114826 ?auto_114831 ) ) ( not ( = ?auto_114827 ?auto_114829 ) ) ( not ( = ?auto_114827 ?auto_114831 ) ) ( not ( = ?auto_114828 ?auto_114829 ) ) ( not ( = ?auto_114828 ?auto_114831 ) ) ( not ( = ?auto_114829 ?auto_114831 ) ) ( ON ?auto_114829 ?auto_114828 ) ( not ( = ?auto_114833 ?auto_114830 ) ) ( not ( = ?auto_114833 ?auto_114832 ) ) ( not ( = ?auto_114833 ?auto_114831 ) ) ( not ( = ?auto_114830 ?auto_114832 ) ) ( not ( = ?auto_114830 ?auto_114831 ) ) ( not ( = ?auto_114832 ?auto_114831 ) ) ( not ( = ?auto_114826 ?auto_114832 ) ) ( not ( = ?auto_114826 ?auto_114833 ) ) ( not ( = ?auto_114826 ?auto_114830 ) ) ( not ( = ?auto_114827 ?auto_114832 ) ) ( not ( = ?auto_114827 ?auto_114833 ) ) ( not ( = ?auto_114827 ?auto_114830 ) ) ( not ( = ?auto_114828 ?auto_114832 ) ) ( not ( = ?auto_114828 ?auto_114833 ) ) ( not ( = ?auto_114828 ?auto_114830 ) ) ( not ( = ?auto_114829 ?auto_114832 ) ) ( not ( = ?auto_114829 ?auto_114833 ) ) ( not ( = ?auto_114829 ?auto_114830 ) ) ( ON ?auto_114831 ?auto_114829 ) ( ON ?auto_114832 ?auto_114831 ) ( ON ?auto_114830 ?auto_114832 ) ( CLEAR ?auto_114830 ) ( HOLDING ?auto_114833 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114833 )
      ( MAKE-2PILE ?auto_114826 ?auto_114827 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_114834 - BLOCK
      ?auto_114835 - BLOCK
    )
    :vars
    (
      ?auto_114840 - BLOCK
      ?auto_114838 - BLOCK
      ?auto_114841 - BLOCK
      ?auto_114837 - BLOCK
      ?auto_114839 - BLOCK
      ?auto_114836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114840 ?auto_114835 ) ( ON-TABLE ?auto_114834 ) ( ON ?auto_114835 ?auto_114834 ) ( not ( = ?auto_114834 ?auto_114835 ) ) ( not ( = ?auto_114834 ?auto_114840 ) ) ( not ( = ?auto_114835 ?auto_114840 ) ) ( not ( = ?auto_114834 ?auto_114838 ) ) ( not ( = ?auto_114834 ?auto_114841 ) ) ( not ( = ?auto_114835 ?auto_114838 ) ) ( not ( = ?auto_114835 ?auto_114841 ) ) ( not ( = ?auto_114840 ?auto_114838 ) ) ( not ( = ?auto_114840 ?auto_114841 ) ) ( not ( = ?auto_114838 ?auto_114841 ) ) ( ON ?auto_114838 ?auto_114840 ) ( not ( = ?auto_114837 ?auto_114839 ) ) ( not ( = ?auto_114837 ?auto_114836 ) ) ( not ( = ?auto_114837 ?auto_114841 ) ) ( not ( = ?auto_114839 ?auto_114836 ) ) ( not ( = ?auto_114839 ?auto_114841 ) ) ( not ( = ?auto_114836 ?auto_114841 ) ) ( not ( = ?auto_114834 ?auto_114836 ) ) ( not ( = ?auto_114834 ?auto_114837 ) ) ( not ( = ?auto_114834 ?auto_114839 ) ) ( not ( = ?auto_114835 ?auto_114836 ) ) ( not ( = ?auto_114835 ?auto_114837 ) ) ( not ( = ?auto_114835 ?auto_114839 ) ) ( not ( = ?auto_114840 ?auto_114836 ) ) ( not ( = ?auto_114840 ?auto_114837 ) ) ( not ( = ?auto_114840 ?auto_114839 ) ) ( not ( = ?auto_114838 ?auto_114836 ) ) ( not ( = ?auto_114838 ?auto_114837 ) ) ( not ( = ?auto_114838 ?auto_114839 ) ) ( ON ?auto_114841 ?auto_114838 ) ( ON ?auto_114836 ?auto_114841 ) ( ON ?auto_114839 ?auto_114836 ) ( ON ?auto_114837 ?auto_114839 ) ( CLEAR ?auto_114837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114834 ?auto_114835 ?auto_114840 ?auto_114838 ?auto_114841 ?auto_114836 ?auto_114839 )
      ( MAKE-2PILE ?auto_114834 ?auto_114835 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114848 - BLOCK
      ?auto_114849 - BLOCK
      ?auto_114850 - BLOCK
      ?auto_114851 - BLOCK
      ?auto_114852 - BLOCK
      ?auto_114853 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_114853 ) ( CLEAR ?auto_114852 ) ( ON-TABLE ?auto_114848 ) ( ON ?auto_114849 ?auto_114848 ) ( ON ?auto_114850 ?auto_114849 ) ( ON ?auto_114851 ?auto_114850 ) ( ON ?auto_114852 ?auto_114851 ) ( not ( = ?auto_114848 ?auto_114849 ) ) ( not ( = ?auto_114848 ?auto_114850 ) ) ( not ( = ?auto_114848 ?auto_114851 ) ) ( not ( = ?auto_114848 ?auto_114852 ) ) ( not ( = ?auto_114848 ?auto_114853 ) ) ( not ( = ?auto_114849 ?auto_114850 ) ) ( not ( = ?auto_114849 ?auto_114851 ) ) ( not ( = ?auto_114849 ?auto_114852 ) ) ( not ( = ?auto_114849 ?auto_114853 ) ) ( not ( = ?auto_114850 ?auto_114851 ) ) ( not ( = ?auto_114850 ?auto_114852 ) ) ( not ( = ?auto_114850 ?auto_114853 ) ) ( not ( = ?auto_114851 ?auto_114852 ) ) ( not ( = ?auto_114851 ?auto_114853 ) ) ( not ( = ?auto_114852 ?auto_114853 ) ) )
    :subtasks
    ( ( !STACK ?auto_114853 ?auto_114852 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114854 - BLOCK
      ?auto_114855 - BLOCK
      ?auto_114856 - BLOCK
      ?auto_114857 - BLOCK
      ?auto_114858 - BLOCK
      ?auto_114859 - BLOCK
    )
    :vars
    (
      ?auto_114860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_114858 ) ( ON-TABLE ?auto_114854 ) ( ON ?auto_114855 ?auto_114854 ) ( ON ?auto_114856 ?auto_114855 ) ( ON ?auto_114857 ?auto_114856 ) ( ON ?auto_114858 ?auto_114857 ) ( not ( = ?auto_114854 ?auto_114855 ) ) ( not ( = ?auto_114854 ?auto_114856 ) ) ( not ( = ?auto_114854 ?auto_114857 ) ) ( not ( = ?auto_114854 ?auto_114858 ) ) ( not ( = ?auto_114854 ?auto_114859 ) ) ( not ( = ?auto_114855 ?auto_114856 ) ) ( not ( = ?auto_114855 ?auto_114857 ) ) ( not ( = ?auto_114855 ?auto_114858 ) ) ( not ( = ?auto_114855 ?auto_114859 ) ) ( not ( = ?auto_114856 ?auto_114857 ) ) ( not ( = ?auto_114856 ?auto_114858 ) ) ( not ( = ?auto_114856 ?auto_114859 ) ) ( not ( = ?auto_114857 ?auto_114858 ) ) ( not ( = ?auto_114857 ?auto_114859 ) ) ( not ( = ?auto_114858 ?auto_114859 ) ) ( ON ?auto_114859 ?auto_114860 ) ( CLEAR ?auto_114859 ) ( HAND-EMPTY ) ( not ( = ?auto_114854 ?auto_114860 ) ) ( not ( = ?auto_114855 ?auto_114860 ) ) ( not ( = ?auto_114856 ?auto_114860 ) ) ( not ( = ?auto_114857 ?auto_114860 ) ) ( not ( = ?auto_114858 ?auto_114860 ) ) ( not ( = ?auto_114859 ?auto_114860 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114859 ?auto_114860 )
      ( MAKE-6PILE ?auto_114854 ?auto_114855 ?auto_114856 ?auto_114857 ?auto_114858 ?auto_114859 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114861 - BLOCK
      ?auto_114862 - BLOCK
      ?auto_114863 - BLOCK
      ?auto_114864 - BLOCK
      ?auto_114865 - BLOCK
      ?auto_114866 - BLOCK
    )
    :vars
    (
      ?auto_114867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114861 ) ( ON ?auto_114862 ?auto_114861 ) ( ON ?auto_114863 ?auto_114862 ) ( ON ?auto_114864 ?auto_114863 ) ( not ( = ?auto_114861 ?auto_114862 ) ) ( not ( = ?auto_114861 ?auto_114863 ) ) ( not ( = ?auto_114861 ?auto_114864 ) ) ( not ( = ?auto_114861 ?auto_114865 ) ) ( not ( = ?auto_114861 ?auto_114866 ) ) ( not ( = ?auto_114862 ?auto_114863 ) ) ( not ( = ?auto_114862 ?auto_114864 ) ) ( not ( = ?auto_114862 ?auto_114865 ) ) ( not ( = ?auto_114862 ?auto_114866 ) ) ( not ( = ?auto_114863 ?auto_114864 ) ) ( not ( = ?auto_114863 ?auto_114865 ) ) ( not ( = ?auto_114863 ?auto_114866 ) ) ( not ( = ?auto_114864 ?auto_114865 ) ) ( not ( = ?auto_114864 ?auto_114866 ) ) ( not ( = ?auto_114865 ?auto_114866 ) ) ( ON ?auto_114866 ?auto_114867 ) ( CLEAR ?auto_114866 ) ( not ( = ?auto_114861 ?auto_114867 ) ) ( not ( = ?auto_114862 ?auto_114867 ) ) ( not ( = ?auto_114863 ?auto_114867 ) ) ( not ( = ?auto_114864 ?auto_114867 ) ) ( not ( = ?auto_114865 ?auto_114867 ) ) ( not ( = ?auto_114866 ?auto_114867 ) ) ( HOLDING ?auto_114865 ) ( CLEAR ?auto_114864 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114861 ?auto_114862 ?auto_114863 ?auto_114864 ?auto_114865 )
      ( MAKE-6PILE ?auto_114861 ?auto_114862 ?auto_114863 ?auto_114864 ?auto_114865 ?auto_114866 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114868 - BLOCK
      ?auto_114869 - BLOCK
      ?auto_114870 - BLOCK
      ?auto_114871 - BLOCK
      ?auto_114872 - BLOCK
      ?auto_114873 - BLOCK
    )
    :vars
    (
      ?auto_114874 - BLOCK
      ?auto_114875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114868 ) ( ON ?auto_114869 ?auto_114868 ) ( ON ?auto_114870 ?auto_114869 ) ( ON ?auto_114871 ?auto_114870 ) ( not ( = ?auto_114868 ?auto_114869 ) ) ( not ( = ?auto_114868 ?auto_114870 ) ) ( not ( = ?auto_114868 ?auto_114871 ) ) ( not ( = ?auto_114868 ?auto_114872 ) ) ( not ( = ?auto_114868 ?auto_114873 ) ) ( not ( = ?auto_114869 ?auto_114870 ) ) ( not ( = ?auto_114869 ?auto_114871 ) ) ( not ( = ?auto_114869 ?auto_114872 ) ) ( not ( = ?auto_114869 ?auto_114873 ) ) ( not ( = ?auto_114870 ?auto_114871 ) ) ( not ( = ?auto_114870 ?auto_114872 ) ) ( not ( = ?auto_114870 ?auto_114873 ) ) ( not ( = ?auto_114871 ?auto_114872 ) ) ( not ( = ?auto_114871 ?auto_114873 ) ) ( not ( = ?auto_114872 ?auto_114873 ) ) ( ON ?auto_114873 ?auto_114874 ) ( not ( = ?auto_114868 ?auto_114874 ) ) ( not ( = ?auto_114869 ?auto_114874 ) ) ( not ( = ?auto_114870 ?auto_114874 ) ) ( not ( = ?auto_114871 ?auto_114874 ) ) ( not ( = ?auto_114872 ?auto_114874 ) ) ( not ( = ?auto_114873 ?auto_114874 ) ) ( CLEAR ?auto_114871 ) ( ON ?auto_114872 ?auto_114873 ) ( CLEAR ?auto_114872 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114875 ) ( ON ?auto_114874 ?auto_114875 ) ( not ( = ?auto_114875 ?auto_114874 ) ) ( not ( = ?auto_114875 ?auto_114873 ) ) ( not ( = ?auto_114875 ?auto_114872 ) ) ( not ( = ?auto_114868 ?auto_114875 ) ) ( not ( = ?auto_114869 ?auto_114875 ) ) ( not ( = ?auto_114870 ?auto_114875 ) ) ( not ( = ?auto_114871 ?auto_114875 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114875 ?auto_114874 ?auto_114873 )
      ( MAKE-6PILE ?auto_114868 ?auto_114869 ?auto_114870 ?auto_114871 ?auto_114872 ?auto_114873 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114876 - BLOCK
      ?auto_114877 - BLOCK
      ?auto_114878 - BLOCK
      ?auto_114879 - BLOCK
      ?auto_114880 - BLOCK
      ?auto_114881 - BLOCK
    )
    :vars
    (
      ?auto_114883 - BLOCK
      ?auto_114882 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114876 ) ( ON ?auto_114877 ?auto_114876 ) ( ON ?auto_114878 ?auto_114877 ) ( not ( = ?auto_114876 ?auto_114877 ) ) ( not ( = ?auto_114876 ?auto_114878 ) ) ( not ( = ?auto_114876 ?auto_114879 ) ) ( not ( = ?auto_114876 ?auto_114880 ) ) ( not ( = ?auto_114876 ?auto_114881 ) ) ( not ( = ?auto_114877 ?auto_114878 ) ) ( not ( = ?auto_114877 ?auto_114879 ) ) ( not ( = ?auto_114877 ?auto_114880 ) ) ( not ( = ?auto_114877 ?auto_114881 ) ) ( not ( = ?auto_114878 ?auto_114879 ) ) ( not ( = ?auto_114878 ?auto_114880 ) ) ( not ( = ?auto_114878 ?auto_114881 ) ) ( not ( = ?auto_114879 ?auto_114880 ) ) ( not ( = ?auto_114879 ?auto_114881 ) ) ( not ( = ?auto_114880 ?auto_114881 ) ) ( ON ?auto_114881 ?auto_114883 ) ( not ( = ?auto_114876 ?auto_114883 ) ) ( not ( = ?auto_114877 ?auto_114883 ) ) ( not ( = ?auto_114878 ?auto_114883 ) ) ( not ( = ?auto_114879 ?auto_114883 ) ) ( not ( = ?auto_114880 ?auto_114883 ) ) ( not ( = ?auto_114881 ?auto_114883 ) ) ( ON ?auto_114880 ?auto_114881 ) ( CLEAR ?auto_114880 ) ( ON-TABLE ?auto_114882 ) ( ON ?auto_114883 ?auto_114882 ) ( not ( = ?auto_114882 ?auto_114883 ) ) ( not ( = ?auto_114882 ?auto_114881 ) ) ( not ( = ?auto_114882 ?auto_114880 ) ) ( not ( = ?auto_114876 ?auto_114882 ) ) ( not ( = ?auto_114877 ?auto_114882 ) ) ( not ( = ?auto_114878 ?auto_114882 ) ) ( not ( = ?auto_114879 ?auto_114882 ) ) ( HOLDING ?auto_114879 ) ( CLEAR ?auto_114878 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114876 ?auto_114877 ?auto_114878 ?auto_114879 )
      ( MAKE-6PILE ?auto_114876 ?auto_114877 ?auto_114878 ?auto_114879 ?auto_114880 ?auto_114881 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114884 - BLOCK
      ?auto_114885 - BLOCK
      ?auto_114886 - BLOCK
      ?auto_114887 - BLOCK
      ?auto_114888 - BLOCK
      ?auto_114889 - BLOCK
    )
    :vars
    (
      ?auto_114891 - BLOCK
      ?auto_114890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114884 ) ( ON ?auto_114885 ?auto_114884 ) ( ON ?auto_114886 ?auto_114885 ) ( not ( = ?auto_114884 ?auto_114885 ) ) ( not ( = ?auto_114884 ?auto_114886 ) ) ( not ( = ?auto_114884 ?auto_114887 ) ) ( not ( = ?auto_114884 ?auto_114888 ) ) ( not ( = ?auto_114884 ?auto_114889 ) ) ( not ( = ?auto_114885 ?auto_114886 ) ) ( not ( = ?auto_114885 ?auto_114887 ) ) ( not ( = ?auto_114885 ?auto_114888 ) ) ( not ( = ?auto_114885 ?auto_114889 ) ) ( not ( = ?auto_114886 ?auto_114887 ) ) ( not ( = ?auto_114886 ?auto_114888 ) ) ( not ( = ?auto_114886 ?auto_114889 ) ) ( not ( = ?auto_114887 ?auto_114888 ) ) ( not ( = ?auto_114887 ?auto_114889 ) ) ( not ( = ?auto_114888 ?auto_114889 ) ) ( ON ?auto_114889 ?auto_114891 ) ( not ( = ?auto_114884 ?auto_114891 ) ) ( not ( = ?auto_114885 ?auto_114891 ) ) ( not ( = ?auto_114886 ?auto_114891 ) ) ( not ( = ?auto_114887 ?auto_114891 ) ) ( not ( = ?auto_114888 ?auto_114891 ) ) ( not ( = ?auto_114889 ?auto_114891 ) ) ( ON ?auto_114888 ?auto_114889 ) ( ON-TABLE ?auto_114890 ) ( ON ?auto_114891 ?auto_114890 ) ( not ( = ?auto_114890 ?auto_114891 ) ) ( not ( = ?auto_114890 ?auto_114889 ) ) ( not ( = ?auto_114890 ?auto_114888 ) ) ( not ( = ?auto_114884 ?auto_114890 ) ) ( not ( = ?auto_114885 ?auto_114890 ) ) ( not ( = ?auto_114886 ?auto_114890 ) ) ( not ( = ?auto_114887 ?auto_114890 ) ) ( CLEAR ?auto_114886 ) ( ON ?auto_114887 ?auto_114888 ) ( CLEAR ?auto_114887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114890 ?auto_114891 ?auto_114889 ?auto_114888 )
      ( MAKE-6PILE ?auto_114884 ?auto_114885 ?auto_114886 ?auto_114887 ?auto_114888 ?auto_114889 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114892 - BLOCK
      ?auto_114893 - BLOCK
      ?auto_114894 - BLOCK
      ?auto_114895 - BLOCK
      ?auto_114896 - BLOCK
      ?auto_114897 - BLOCK
    )
    :vars
    (
      ?auto_114899 - BLOCK
      ?auto_114898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114892 ) ( ON ?auto_114893 ?auto_114892 ) ( not ( = ?auto_114892 ?auto_114893 ) ) ( not ( = ?auto_114892 ?auto_114894 ) ) ( not ( = ?auto_114892 ?auto_114895 ) ) ( not ( = ?auto_114892 ?auto_114896 ) ) ( not ( = ?auto_114892 ?auto_114897 ) ) ( not ( = ?auto_114893 ?auto_114894 ) ) ( not ( = ?auto_114893 ?auto_114895 ) ) ( not ( = ?auto_114893 ?auto_114896 ) ) ( not ( = ?auto_114893 ?auto_114897 ) ) ( not ( = ?auto_114894 ?auto_114895 ) ) ( not ( = ?auto_114894 ?auto_114896 ) ) ( not ( = ?auto_114894 ?auto_114897 ) ) ( not ( = ?auto_114895 ?auto_114896 ) ) ( not ( = ?auto_114895 ?auto_114897 ) ) ( not ( = ?auto_114896 ?auto_114897 ) ) ( ON ?auto_114897 ?auto_114899 ) ( not ( = ?auto_114892 ?auto_114899 ) ) ( not ( = ?auto_114893 ?auto_114899 ) ) ( not ( = ?auto_114894 ?auto_114899 ) ) ( not ( = ?auto_114895 ?auto_114899 ) ) ( not ( = ?auto_114896 ?auto_114899 ) ) ( not ( = ?auto_114897 ?auto_114899 ) ) ( ON ?auto_114896 ?auto_114897 ) ( ON-TABLE ?auto_114898 ) ( ON ?auto_114899 ?auto_114898 ) ( not ( = ?auto_114898 ?auto_114899 ) ) ( not ( = ?auto_114898 ?auto_114897 ) ) ( not ( = ?auto_114898 ?auto_114896 ) ) ( not ( = ?auto_114892 ?auto_114898 ) ) ( not ( = ?auto_114893 ?auto_114898 ) ) ( not ( = ?auto_114894 ?auto_114898 ) ) ( not ( = ?auto_114895 ?auto_114898 ) ) ( ON ?auto_114895 ?auto_114896 ) ( CLEAR ?auto_114895 ) ( HOLDING ?auto_114894 ) ( CLEAR ?auto_114893 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114892 ?auto_114893 ?auto_114894 )
      ( MAKE-6PILE ?auto_114892 ?auto_114893 ?auto_114894 ?auto_114895 ?auto_114896 ?auto_114897 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114900 - BLOCK
      ?auto_114901 - BLOCK
      ?auto_114902 - BLOCK
      ?auto_114903 - BLOCK
      ?auto_114904 - BLOCK
      ?auto_114905 - BLOCK
    )
    :vars
    (
      ?auto_114906 - BLOCK
      ?auto_114907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114900 ) ( ON ?auto_114901 ?auto_114900 ) ( not ( = ?auto_114900 ?auto_114901 ) ) ( not ( = ?auto_114900 ?auto_114902 ) ) ( not ( = ?auto_114900 ?auto_114903 ) ) ( not ( = ?auto_114900 ?auto_114904 ) ) ( not ( = ?auto_114900 ?auto_114905 ) ) ( not ( = ?auto_114901 ?auto_114902 ) ) ( not ( = ?auto_114901 ?auto_114903 ) ) ( not ( = ?auto_114901 ?auto_114904 ) ) ( not ( = ?auto_114901 ?auto_114905 ) ) ( not ( = ?auto_114902 ?auto_114903 ) ) ( not ( = ?auto_114902 ?auto_114904 ) ) ( not ( = ?auto_114902 ?auto_114905 ) ) ( not ( = ?auto_114903 ?auto_114904 ) ) ( not ( = ?auto_114903 ?auto_114905 ) ) ( not ( = ?auto_114904 ?auto_114905 ) ) ( ON ?auto_114905 ?auto_114906 ) ( not ( = ?auto_114900 ?auto_114906 ) ) ( not ( = ?auto_114901 ?auto_114906 ) ) ( not ( = ?auto_114902 ?auto_114906 ) ) ( not ( = ?auto_114903 ?auto_114906 ) ) ( not ( = ?auto_114904 ?auto_114906 ) ) ( not ( = ?auto_114905 ?auto_114906 ) ) ( ON ?auto_114904 ?auto_114905 ) ( ON-TABLE ?auto_114907 ) ( ON ?auto_114906 ?auto_114907 ) ( not ( = ?auto_114907 ?auto_114906 ) ) ( not ( = ?auto_114907 ?auto_114905 ) ) ( not ( = ?auto_114907 ?auto_114904 ) ) ( not ( = ?auto_114900 ?auto_114907 ) ) ( not ( = ?auto_114901 ?auto_114907 ) ) ( not ( = ?auto_114902 ?auto_114907 ) ) ( not ( = ?auto_114903 ?auto_114907 ) ) ( ON ?auto_114903 ?auto_114904 ) ( CLEAR ?auto_114901 ) ( ON ?auto_114902 ?auto_114903 ) ( CLEAR ?auto_114902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114907 ?auto_114906 ?auto_114905 ?auto_114904 ?auto_114903 )
      ( MAKE-6PILE ?auto_114900 ?auto_114901 ?auto_114902 ?auto_114903 ?auto_114904 ?auto_114905 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114908 - BLOCK
      ?auto_114909 - BLOCK
      ?auto_114910 - BLOCK
      ?auto_114911 - BLOCK
      ?auto_114912 - BLOCK
      ?auto_114913 - BLOCK
    )
    :vars
    (
      ?auto_114915 - BLOCK
      ?auto_114914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114908 ) ( not ( = ?auto_114908 ?auto_114909 ) ) ( not ( = ?auto_114908 ?auto_114910 ) ) ( not ( = ?auto_114908 ?auto_114911 ) ) ( not ( = ?auto_114908 ?auto_114912 ) ) ( not ( = ?auto_114908 ?auto_114913 ) ) ( not ( = ?auto_114909 ?auto_114910 ) ) ( not ( = ?auto_114909 ?auto_114911 ) ) ( not ( = ?auto_114909 ?auto_114912 ) ) ( not ( = ?auto_114909 ?auto_114913 ) ) ( not ( = ?auto_114910 ?auto_114911 ) ) ( not ( = ?auto_114910 ?auto_114912 ) ) ( not ( = ?auto_114910 ?auto_114913 ) ) ( not ( = ?auto_114911 ?auto_114912 ) ) ( not ( = ?auto_114911 ?auto_114913 ) ) ( not ( = ?auto_114912 ?auto_114913 ) ) ( ON ?auto_114913 ?auto_114915 ) ( not ( = ?auto_114908 ?auto_114915 ) ) ( not ( = ?auto_114909 ?auto_114915 ) ) ( not ( = ?auto_114910 ?auto_114915 ) ) ( not ( = ?auto_114911 ?auto_114915 ) ) ( not ( = ?auto_114912 ?auto_114915 ) ) ( not ( = ?auto_114913 ?auto_114915 ) ) ( ON ?auto_114912 ?auto_114913 ) ( ON-TABLE ?auto_114914 ) ( ON ?auto_114915 ?auto_114914 ) ( not ( = ?auto_114914 ?auto_114915 ) ) ( not ( = ?auto_114914 ?auto_114913 ) ) ( not ( = ?auto_114914 ?auto_114912 ) ) ( not ( = ?auto_114908 ?auto_114914 ) ) ( not ( = ?auto_114909 ?auto_114914 ) ) ( not ( = ?auto_114910 ?auto_114914 ) ) ( not ( = ?auto_114911 ?auto_114914 ) ) ( ON ?auto_114911 ?auto_114912 ) ( ON ?auto_114910 ?auto_114911 ) ( CLEAR ?auto_114910 ) ( HOLDING ?auto_114909 ) ( CLEAR ?auto_114908 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114908 ?auto_114909 )
      ( MAKE-6PILE ?auto_114908 ?auto_114909 ?auto_114910 ?auto_114911 ?auto_114912 ?auto_114913 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114916 - BLOCK
      ?auto_114917 - BLOCK
      ?auto_114918 - BLOCK
      ?auto_114919 - BLOCK
      ?auto_114920 - BLOCK
      ?auto_114921 - BLOCK
    )
    :vars
    (
      ?auto_114923 - BLOCK
      ?auto_114922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_114916 ) ( not ( = ?auto_114916 ?auto_114917 ) ) ( not ( = ?auto_114916 ?auto_114918 ) ) ( not ( = ?auto_114916 ?auto_114919 ) ) ( not ( = ?auto_114916 ?auto_114920 ) ) ( not ( = ?auto_114916 ?auto_114921 ) ) ( not ( = ?auto_114917 ?auto_114918 ) ) ( not ( = ?auto_114917 ?auto_114919 ) ) ( not ( = ?auto_114917 ?auto_114920 ) ) ( not ( = ?auto_114917 ?auto_114921 ) ) ( not ( = ?auto_114918 ?auto_114919 ) ) ( not ( = ?auto_114918 ?auto_114920 ) ) ( not ( = ?auto_114918 ?auto_114921 ) ) ( not ( = ?auto_114919 ?auto_114920 ) ) ( not ( = ?auto_114919 ?auto_114921 ) ) ( not ( = ?auto_114920 ?auto_114921 ) ) ( ON ?auto_114921 ?auto_114923 ) ( not ( = ?auto_114916 ?auto_114923 ) ) ( not ( = ?auto_114917 ?auto_114923 ) ) ( not ( = ?auto_114918 ?auto_114923 ) ) ( not ( = ?auto_114919 ?auto_114923 ) ) ( not ( = ?auto_114920 ?auto_114923 ) ) ( not ( = ?auto_114921 ?auto_114923 ) ) ( ON ?auto_114920 ?auto_114921 ) ( ON-TABLE ?auto_114922 ) ( ON ?auto_114923 ?auto_114922 ) ( not ( = ?auto_114922 ?auto_114923 ) ) ( not ( = ?auto_114922 ?auto_114921 ) ) ( not ( = ?auto_114922 ?auto_114920 ) ) ( not ( = ?auto_114916 ?auto_114922 ) ) ( not ( = ?auto_114917 ?auto_114922 ) ) ( not ( = ?auto_114918 ?auto_114922 ) ) ( not ( = ?auto_114919 ?auto_114922 ) ) ( ON ?auto_114919 ?auto_114920 ) ( ON ?auto_114918 ?auto_114919 ) ( CLEAR ?auto_114916 ) ( ON ?auto_114917 ?auto_114918 ) ( CLEAR ?auto_114917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_114922 ?auto_114923 ?auto_114921 ?auto_114920 ?auto_114919 ?auto_114918 )
      ( MAKE-6PILE ?auto_114916 ?auto_114917 ?auto_114918 ?auto_114919 ?auto_114920 ?auto_114921 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114924 - BLOCK
      ?auto_114925 - BLOCK
      ?auto_114926 - BLOCK
      ?auto_114927 - BLOCK
      ?auto_114928 - BLOCK
      ?auto_114929 - BLOCK
    )
    :vars
    (
      ?auto_114930 - BLOCK
      ?auto_114931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114924 ?auto_114925 ) ) ( not ( = ?auto_114924 ?auto_114926 ) ) ( not ( = ?auto_114924 ?auto_114927 ) ) ( not ( = ?auto_114924 ?auto_114928 ) ) ( not ( = ?auto_114924 ?auto_114929 ) ) ( not ( = ?auto_114925 ?auto_114926 ) ) ( not ( = ?auto_114925 ?auto_114927 ) ) ( not ( = ?auto_114925 ?auto_114928 ) ) ( not ( = ?auto_114925 ?auto_114929 ) ) ( not ( = ?auto_114926 ?auto_114927 ) ) ( not ( = ?auto_114926 ?auto_114928 ) ) ( not ( = ?auto_114926 ?auto_114929 ) ) ( not ( = ?auto_114927 ?auto_114928 ) ) ( not ( = ?auto_114927 ?auto_114929 ) ) ( not ( = ?auto_114928 ?auto_114929 ) ) ( ON ?auto_114929 ?auto_114930 ) ( not ( = ?auto_114924 ?auto_114930 ) ) ( not ( = ?auto_114925 ?auto_114930 ) ) ( not ( = ?auto_114926 ?auto_114930 ) ) ( not ( = ?auto_114927 ?auto_114930 ) ) ( not ( = ?auto_114928 ?auto_114930 ) ) ( not ( = ?auto_114929 ?auto_114930 ) ) ( ON ?auto_114928 ?auto_114929 ) ( ON-TABLE ?auto_114931 ) ( ON ?auto_114930 ?auto_114931 ) ( not ( = ?auto_114931 ?auto_114930 ) ) ( not ( = ?auto_114931 ?auto_114929 ) ) ( not ( = ?auto_114931 ?auto_114928 ) ) ( not ( = ?auto_114924 ?auto_114931 ) ) ( not ( = ?auto_114925 ?auto_114931 ) ) ( not ( = ?auto_114926 ?auto_114931 ) ) ( not ( = ?auto_114927 ?auto_114931 ) ) ( ON ?auto_114927 ?auto_114928 ) ( ON ?auto_114926 ?auto_114927 ) ( ON ?auto_114925 ?auto_114926 ) ( CLEAR ?auto_114925 ) ( HOLDING ?auto_114924 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_114924 )
      ( MAKE-6PILE ?auto_114924 ?auto_114925 ?auto_114926 ?auto_114927 ?auto_114928 ?auto_114929 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_114932 - BLOCK
      ?auto_114933 - BLOCK
      ?auto_114934 - BLOCK
      ?auto_114935 - BLOCK
      ?auto_114936 - BLOCK
      ?auto_114937 - BLOCK
    )
    :vars
    (
      ?auto_114938 - BLOCK
      ?auto_114939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_114932 ?auto_114933 ) ) ( not ( = ?auto_114932 ?auto_114934 ) ) ( not ( = ?auto_114932 ?auto_114935 ) ) ( not ( = ?auto_114932 ?auto_114936 ) ) ( not ( = ?auto_114932 ?auto_114937 ) ) ( not ( = ?auto_114933 ?auto_114934 ) ) ( not ( = ?auto_114933 ?auto_114935 ) ) ( not ( = ?auto_114933 ?auto_114936 ) ) ( not ( = ?auto_114933 ?auto_114937 ) ) ( not ( = ?auto_114934 ?auto_114935 ) ) ( not ( = ?auto_114934 ?auto_114936 ) ) ( not ( = ?auto_114934 ?auto_114937 ) ) ( not ( = ?auto_114935 ?auto_114936 ) ) ( not ( = ?auto_114935 ?auto_114937 ) ) ( not ( = ?auto_114936 ?auto_114937 ) ) ( ON ?auto_114937 ?auto_114938 ) ( not ( = ?auto_114932 ?auto_114938 ) ) ( not ( = ?auto_114933 ?auto_114938 ) ) ( not ( = ?auto_114934 ?auto_114938 ) ) ( not ( = ?auto_114935 ?auto_114938 ) ) ( not ( = ?auto_114936 ?auto_114938 ) ) ( not ( = ?auto_114937 ?auto_114938 ) ) ( ON ?auto_114936 ?auto_114937 ) ( ON-TABLE ?auto_114939 ) ( ON ?auto_114938 ?auto_114939 ) ( not ( = ?auto_114939 ?auto_114938 ) ) ( not ( = ?auto_114939 ?auto_114937 ) ) ( not ( = ?auto_114939 ?auto_114936 ) ) ( not ( = ?auto_114932 ?auto_114939 ) ) ( not ( = ?auto_114933 ?auto_114939 ) ) ( not ( = ?auto_114934 ?auto_114939 ) ) ( not ( = ?auto_114935 ?auto_114939 ) ) ( ON ?auto_114935 ?auto_114936 ) ( ON ?auto_114934 ?auto_114935 ) ( ON ?auto_114933 ?auto_114934 ) ( ON ?auto_114932 ?auto_114933 ) ( CLEAR ?auto_114932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_114939 ?auto_114938 ?auto_114937 ?auto_114936 ?auto_114935 ?auto_114934 ?auto_114933 )
      ( MAKE-6PILE ?auto_114932 ?auto_114933 ?auto_114934 ?auto_114935 ?auto_114936 ?auto_114937 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_114941 - BLOCK
    )
    :vars
    (
      ?auto_114942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114942 ?auto_114941 ) ( CLEAR ?auto_114942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_114941 ) ( not ( = ?auto_114941 ?auto_114942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_114942 ?auto_114941 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_114943 - BLOCK
    )
    :vars
    (
      ?auto_114944 - BLOCK
      ?auto_114945 - BLOCK
      ?auto_114946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114944 ?auto_114943 ) ( CLEAR ?auto_114944 ) ( ON-TABLE ?auto_114943 ) ( not ( = ?auto_114943 ?auto_114944 ) ) ( HOLDING ?auto_114945 ) ( CLEAR ?auto_114946 ) ( not ( = ?auto_114943 ?auto_114945 ) ) ( not ( = ?auto_114943 ?auto_114946 ) ) ( not ( = ?auto_114944 ?auto_114945 ) ) ( not ( = ?auto_114944 ?auto_114946 ) ) ( not ( = ?auto_114945 ?auto_114946 ) ) )
    :subtasks
    ( ( !STACK ?auto_114945 ?auto_114946 )
      ( MAKE-1PILE ?auto_114943 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_114947 - BLOCK
    )
    :vars
    (
      ?auto_114950 - BLOCK
      ?auto_114948 - BLOCK
      ?auto_114949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114950 ?auto_114947 ) ( ON-TABLE ?auto_114947 ) ( not ( = ?auto_114947 ?auto_114950 ) ) ( CLEAR ?auto_114948 ) ( not ( = ?auto_114947 ?auto_114949 ) ) ( not ( = ?auto_114947 ?auto_114948 ) ) ( not ( = ?auto_114950 ?auto_114949 ) ) ( not ( = ?auto_114950 ?auto_114948 ) ) ( not ( = ?auto_114949 ?auto_114948 ) ) ( ON ?auto_114949 ?auto_114950 ) ( CLEAR ?auto_114949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114947 ?auto_114950 )
      ( MAKE-1PILE ?auto_114947 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_114951 - BLOCK
    )
    :vars
    (
      ?auto_114954 - BLOCK
      ?auto_114953 - BLOCK
      ?auto_114952 - BLOCK
      ?auto_114957 - BLOCK
      ?auto_114956 - BLOCK
      ?auto_114955 - BLOCK
      ?auto_114958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114954 ?auto_114951 ) ( ON-TABLE ?auto_114951 ) ( not ( = ?auto_114951 ?auto_114954 ) ) ( not ( = ?auto_114951 ?auto_114953 ) ) ( not ( = ?auto_114951 ?auto_114952 ) ) ( not ( = ?auto_114954 ?auto_114953 ) ) ( not ( = ?auto_114954 ?auto_114952 ) ) ( not ( = ?auto_114953 ?auto_114952 ) ) ( ON ?auto_114953 ?auto_114954 ) ( CLEAR ?auto_114953 ) ( HOLDING ?auto_114952 ) ( CLEAR ?auto_114957 ) ( ON-TABLE ?auto_114956 ) ( ON ?auto_114955 ?auto_114956 ) ( ON ?auto_114958 ?auto_114955 ) ( ON ?auto_114957 ?auto_114958 ) ( not ( = ?auto_114956 ?auto_114955 ) ) ( not ( = ?auto_114956 ?auto_114958 ) ) ( not ( = ?auto_114956 ?auto_114957 ) ) ( not ( = ?auto_114956 ?auto_114952 ) ) ( not ( = ?auto_114955 ?auto_114958 ) ) ( not ( = ?auto_114955 ?auto_114957 ) ) ( not ( = ?auto_114955 ?auto_114952 ) ) ( not ( = ?auto_114958 ?auto_114957 ) ) ( not ( = ?auto_114958 ?auto_114952 ) ) ( not ( = ?auto_114957 ?auto_114952 ) ) ( not ( = ?auto_114951 ?auto_114957 ) ) ( not ( = ?auto_114951 ?auto_114956 ) ) ( not ( = ?auto_114951 ?auto_114955 ) ) ( not ( = ?auto_114951 ?auto_114958 ) ) ( not ( = ?auto_114954 ?auto_114957 ) ) ( not ( = ?auto_114954 ?auto_114956 ) ) ( not ( = ?auto_114954 ?auto_114955 ) ) ( not ( = ?auto_114954 ?auto_114958 ) ) ( not ( = ?auto_114953 ?auto_114957 ) ) ( not ( = ?auto_114953 ?auto_114956 ) ) ( not ( = ?auto_114953 ?auto_114955 ) ) ( not ( = ?auto_114953 ?auto_114958 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114956 ?auto_114955 ?auto_114958 ?auto_114957 ?auto_114952 )
      ( MAKE-1PILE ?auto_114951 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_114959 - BLOCK
    )
    :vars
    (
      ?auto_114961 - BLOCK
      ?auto_114963 - BLOCK
      ?auto_114964 - BLOCK
      ?auto_114960 - BLOCK
      ?auto_114962 - BLOCK
      ?auto_114966 - BLOCK
      ?auto_114965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114961 ?auto_114959 ) ( ON-TABLE ?auto_114959 ) ( not ( = ?auto_114959 ?auto_114961 ) ) ( not ( = ?auto_114959 ?auto_114963 ) ) ( not ( = ?auto_114959 ?auto_114964 ) ) ( not ( = ?auto_114961 ?auto_114963 ) ) ( not ( = ?auto_114961 ?auto_114964 ) ) ( not ( = ?auto_114963 ?auto_114964 ) ) ( ON ?auto_114963 ?auto_114961 ) ( CLEAR ?auto_114960 ) ( ON-TABLE ?auto_114962 ) ( ON ?auto_114966 ?auto_114962 ) ( ON ?auto_114965 ?auto_114966 ) ( ON ?auto_114960 ?auto_114965 ) ( not ( = ?auto_114962 ?auto_114966 ) ) ( not ( = ?auto_114962 ?auto_114965 ) ) ( not ( = ?auto_114962 ?auto_114960 ) ) ( not ( = ?auto_114962 ?auto_114964 ) ) ( not ( = ?auto_114966 ?auto_114965 ) ) ( not ( = ?auto_114966 ?auto_114960 ) ) ( not ( = ?auto_114966 ?auto_114964 ) ) ( not ( = ?auto_114965 ?auto_114960 ) ) ( not ( = ?auto_114965 ?auto_114964 ) ) ( not ( = ?auto_114960 ?auto_114964 ) ) ( not ( = ?auto_114959 ?auto_114960 ) ) ( not ( = ?auto_114959 ?auto_114962 ) ) ( not ( = ?auto_114959 ?auto_114966 ) ) ( not ( = ?auto_114959 ?auto_114965 ) ) ( not ( = ?auto_114961 ?auto_114960 ) ) ( not ( = ?auto_114961 ?auto_114962 ) ) ( not ( = ?auto_114961 ?auto_114966 ) ) ( not ( = ?auto_114961 ?auto_114965 ) ) ( not ( = ?auto_114963 ?auto_114960 ) ) ( not ( = ?auto_114963 ?auto_114962 ) ) ( not ( = ?auto_114963 ?auto_114966 ) ) ( not ( = ?auto_114963 ?auto_114965 ) ) ( ON ?auto_114964 ?auto_114963 ) ( CLEAR ?auto_114964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114959 ?auto_114961 ?auto_114963 )
      ( MAKE-1PILE ?auto_114959 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_114967 - BLOCK
    )
    :vars
    (
      ?auto_114972 - BLOCK
      ?auto_114971 - BLOCK
      ?auto_114974 - BLOCK
      ?auto_114970 - BLOCK
      ?auto_114969 - BLOCK
      ?auto_114968 - BLOCK
      ?auto_114973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114972 ?auto_114967 ) ( ON-TABLE ?auto_114967 ) ( not ( = ?auto_114967 ?auto_114972 ) ) ( not ( = ?auto_114967 ?auto_114971 ) ) ( not ( = ?auto_114967 ?auto_114974 ) ) ( not ( = ?auto_114972 ?auto_114971 ) ) ( not ( = ?auto_114972 ?auto_114974 ) ) ( not ( = ?auto_114971 ?auto_114974 ) ) ( ON ?auto_114971 ?auto_114972 ) ( ON-TABLE ?auto_114970 ) ( ON ?auto_114969 ?auto_114970 ) ( ON ?auto_114968 ?auto_114969 ) ( not ( = ?auto_114970 ?auto_114969 ) ) ( not ( = ?auto_114970 ?auto_114968 ) ) ( not ( = ?auto_114970 ?auto_114973 ) ) ( not ( = ?auto_114970 ?auto_114974 ) ) ( not ( = ?auto_114969 ?auto_114968 ) ) ( not ( = ?auto_114969 ?auto_114973 ) ) ( not ( = ?auto_114969 ?auto_114974 ) ) ( not ( = ?auto_114968 ?auto_114973 ) ) ( not ( = ?auto_114968 ?auto_114974 ) ) ( not ( = ?auto_114973 ?auto_114974 ) ) ( not ( = ?auto_114967 ?auto_114973 ) ) ( not ( = ?auto_114967 ?auto_114970 ) ) ( not ( = ?auto_114967 ?auto_114969 ) ) ( not ( = ?auto_114967 ?auto_114968 ) ) ( not ( = ?auto_114972 ?auto_114973 ) ) ( not ( = ?auto_114972 ?auto_114970 ) ) ( not ( = ?auto_114972 ?auto_114969 ) ) ( not ( = ?auto_114972 ?auto_114968 ) ) ( not ( = ?auto_114971 ?auto_114973 ) ) ( not ( = ?auto_114971 ?auto_114970 ) ) ( not ( = ?auto_114971 ?auto_114969 ) ) ( not ( = ?auto_114971 ?auto_114968 ) ) ( ON ?auto_114974 ?auto_114971 ) ( CLEAR ?auto_114974 ) ( HOLDING ?auto_114973 ) ( CLEAR ?auto_114968 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114970 ?auto_114969 ?auto_114968 ?auto_114973 )
      ( MAKE-1PILE ?auto_114967 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_114975 - BLOCK
    )
    :vars
    (
      ?auto_114976 - BLOCK
      ?auto_114981 - BLOCK
      ?auto_114977 - BLOCK
      ?auto_114979 - BLOCK
      ?auto_114978 - BLOCK
      ?auto_114982 - BLOCK
      ?auto_114980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114976 ?auto_114975 ) ( ON-TABLE ?auto_114975 ) ( not ( = ?auto_114975 ?auto_114976 ) ) ( not ( = ?auto_114975 ?auto_114981 ) ) ( not ( = ?auto_114975 ?auto_114977 ) ) ( not ( = ?auto_114976 ?auto_114981 ) ) ( not ( = ?auto_114976 ?auto_114977 ) ) ( not ( = ?auto_114981 ?auto_114977 ) ) ( ON ?auto_114981 ?auto_114976 ) ( ON-TABLE ?auto_114979 ) ( ON ?auto_114978 ?auto_114979 ) ( ON ?auto_114982 ?auto_114978 ) ( not ( = ?auto_114979 ?auto_114978 ) ) ( not ( = ?auto_114979 ?auto_114982 ) ) ( not ( = ?auto_114979 ?auto_114980 ) ) ( not ( = ?auto_114979 ?auto_114977 ) ) ( not ( = ?auto_114978 ?auto_114982 ) ) ( not ( = ?auto_114978 ?auto_114980 ) ) ( not ( = ?auto_114978 ?auto_114977 ) ) ( not ( = ?auto_114982 ?auto_114980 ) ) ( not ( = ?auto_114982 ?auto_114977 ) ) ( not ( = ?auto_114980 ?auto_114977 ) ) ( not ( = ?auto_114975 ?auto_114980 ) ) ( not ( = ?auto_114975 ?auto_114979 ) ) ( not ( = ?auto_114975 ?auto_114978 ) ) ( not ( = ?auto_114975 ?auto_114982 ) ) ( not ( = ?auto_114976 ?auto_114980 ) ) ( not ( = ?auto_114976 ?auto_114979 ) ) ( not ( = ?auto_114976 ?auto_114978 ) ) ( not ( = ?auto_114976 ?auto_114982 ) ) ( not ( = ?auto_114981 ?auto_114980 ) ) ( not ( = ?auto_114981 ?auto_114979 ) ) ( not ( = ?auto_114981 ?auto_114978 ) ) ( not ( = ?auto_114981 ?auto_114982 ) ) ( ON ?auto_114977 ?auto_114981 ) ( CLEAR ?auto_114982 ) ( ON ?auto_114980 ?auto_114977 ) ( CLEAR ?auto_114980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_114975 ?auto_114976 ?auto_114981 ?auto_114977 )
      ( MAKE-1PILE ?auto_114975 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_114983 - BLOCK
    )
    :vars
    (
      ?auto_114987 - BLOCK
      ?auto_114990 - BLOCK
      ?auto_114988 - BLOCK
      ?auto_114986 - BLOCK
      ?auto_114984 - BLOCK
      ?auto_114985 - BLOCK
      ?auto_114989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114987 ?auto_114983 ) ( ON-TABLE ?auto_114983 ) ( not ( = ?auto_114983 ?auto_114987 ) ) ( not ( = ?auto_114983 ?auto_114990 ) ) ( not ( = ?auto_114983 ?auto_114988 ) ) ( not ( = ?auto_114987 ?auto_114990 ) ) ( not ( = ?auto_114987 ?auto_114988 ) ) ( not ( = ?auto_114990 ?auto_114988 ) ) ( ON ?auto_114990 ?auto_114987 ) ( ON-TABLE ?auto_114986 ) ( ON ?auto_114984 ?auto_114986 ) ( not ( = ?auto_114986 ?auto_114984 ) ) ( not ( = ?auto_114986 ?auto_114985 ) ) ( not ( = ?auto_114986 ?auto_114989 ) ) ( not ( = ?auto_114986 ?auto_114988 ) ) ( not ( = ?auto_114984 ?auto_114985 ) ) ( not ( = ?auto_114984 ?auto_114989 ) ) ( not ( = ?auto_114984 ?auto_114988 ) ) ( not ( = ?auto_114985 ?auto_114989 ) ) ( not ( = ?auto_114985 ?auto_114988 ) ) ( not ( = ?auto_114989 ?auto_114988 ) ) ( not ( = ?auto_114983 ?auto_114989 ) ) ( not ( = ?auto_114983 ?auto_114986 ) ) ( not ( = ?auto_114983 ?auto_114984 ) ) ( not ( = ?auto_114983 ?auto_114985 ) ) ( not ( = ?auto_114987 ?auto_114989 ) ) ( not ( = ?auto_114987 ?auto_114986 ) ) ( not ( = ?auto_114987 ?auto_114984 ) ) ( not ( = ?auto_114987 ?auto_114985 ) ) ( not ( = ?auto_114990 ?auto_114989 ) ) ( not ( = ?auto_114990 ?auto_114986 ) ) ( not ( = ?auto_114990 ?auto_114984 ) ) ( not ( = ?auto_114990 ?auto_114985 ) ) ( ON ?auto_114988 ?auto_114990 ) ( ON ?auto_114989 ?auto_114988 ) ( CLEAR ?auto_114989 ) ( HOLDING ?auto_114985 ) ( CLEAR ?auto_114984 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_114986 ?auto_114984 ?auto_114985 )
      ( MAKE-1PILE ?auto_114983 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_114991 - BLOCK
    )
    :vars
    (
      ?auto_114996 - BLOCK
      ?auto_114992 - BLOCK
      ?auto_114995 - BLOCK
      ?auto_114993 - BLOCK
      ?auto_114998 - BLOCK
      ?auto_114994 - BLOCK
      ?auto_114997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_114996 ?auto_114991 ) ( ON-TABLE ?auto_114991 ) ( not ( = ?auto_114991 ?auto_114996 ) ) ( not ( = ?auto_114991 ?auto_114992 ) ) ( not ( = ?auto_114991 ?auto_114995 ) ) ( not ( = ?auto_114996 ?auto_114992 ) ) ( not ( = ?auto_114996 ?auto_114995 ) ) ( not ( = ?auto_114992 ?auto_114995 ) ) ( ON ?auto_114992 ?auto_114996 ) ( ON-TABLE ?auto_114993 ) ( ON ?auto_114998 ?auto_114993 ) ( not ( = ?auto_114993 ?auto_114998 ) ) ( not ( = ?auto_114993 ?auto_114994 ) ) ( not ( = ?auto_114993 ?auto_114997 ) ) ( not ( = ?auto_114993 ?auto_114995 ) ) ( not ( = ?auto_114998 ?auto_114994 ) ) ( not ( = ?auto_114998 ?auto_114997 ) ) ( not ( = ?auto_114998 ?auto_114995 ) ) ( not ( = ?auto_114994 ?auto_114997 ) ) ( not ( = ?auto_114994 ?auto_114995 ) ) ( not ( = ?auto_114997 ?auto_114995 ) ) ( not ( = ?auto_114991 ?auto_114997 ) ) ( not ( = ?auto_114991 ?auto_114993 ) ) ( not ( = ?auto_114991 ?auto_114998 ) ) ( not ( = ?auto_114991 ?auto_114994 ) ) ( not ( = ?auto_114996 ?auto_114997 ) ) ( not ( = ?auto_114996 ?auto_114993 ) ) ( not ( = ?auto_114996 ?auto_114998 ) ) ( not ( = ?auto_114996 ?auto_114994 ) ) ( not ( = ?auto_114992 ?auto_114997 ) ) ( not ( = ?auto_114992 ?auto_114993 ) ) ( not ( = ?auto_114992 ?auto_114998 ) ) ( not ( = ?auto_114992 ?auto_114994 ) ) ( ON ?auto_114995 ?auto_114992 ) ( ON ?auto_114997 ?auto_114995 ) ( CLEAR ?auto_114998 ) ( ON ?auto_114994 ?auto_114997 ) ( CLEAR ?auto_114994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_114991 ?auto_114996 ?auto_114992 ?auto_114995 ?auto_114997 )
      ( MAKE-1PILE ?auto_114991 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_114999 - BLOCK
    )
    :vars
    (
      ?auto_115002 - BLOCK
      ?auto_115001 - BLOCK
      ?auto_115003 - BLOCK
      ?auto_115000 - BLOCK
      ?auto_115005 - BLOCK
      ?auto_115006 - BLOCK
      ?auto_115004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115002 ?auto_114999 ) ( ON-TABLE ?auto_114999 ) ( not ( = ?auto_114999 ?auto_115002 ) ) ( not ( = ?auto_114999 ?auto_115001 ) ) ( not ( = ?auto_114999 ?auto_115003 ) ) ( not ( = ?auto_115002 ?auto_115001 ) ) ( not ( = ?auto_115002 ?auto_115003 ) ) ( not ( = ?auto_115001 ?auto_115003 ) ) ( ON ?auto_115001 ?auto_115002 ) ( ON-TABLE ?auto_115000 ) ( not ( = ?auto_115000 ?auto_115005 ) ) ( not ( = ?auto_115000 ?auto_115006 ) ) ( not ( = ?auto_115000 ?auto_115004 ) ) ( not ( = ?auto_115000 ?auto_115003 ) ) ( not ( = ?auto_115005 ?auto_115006 ) ) ( not ( = ?auto_115005 ?auto_115004 ) ) ( not ( = ?auto_115005 ?auto_115003 ) ) ( not ( = ?auto_115006 ?auto_115004 ) ) ( not ( = ?auto_115006 ?auto_115003 ) ) ( not ( = ?auto_115004 ?auto_115003 ) ) ( not ( = ?auto_114999 ?auto_115004 ) ) ( not ( = ?auto_114999 ?auto_115000 ) ) ( not ( = ?auto_114999 ?auto_115005 ) ) ( not ( = ?auto_114999 ?auto_115006 ) ) ( not ( = ?auto_115002 ?auto_115004 ) ) ( not ( = ?auto_115002 ?auto_115000 ) ) ( not ( = ?auto_115002 ?auto_115005 ) ) ( not ( = ?auto_115002 ?auto_115006 ) ) ( not ( = ?auto_115001 ?auto_115004 ) ) ( not ( = ?auto_115001 ?auto_115000 ) ) ( not ( = ?auto_115001 ?auto_115005 ) ) ( not ( = ?auto_115001 ?auto_115006 ) ) ( ON ?auto_115003 ?auto_115001 ) ( ON ?auto_115004 ?auto_115003 ) ( ON ?auto_115006 ?auto_115004 ) ( CLEAR ?auto_115006 ) ( HOLDING ?auto_115005 ) ( CLEAR ?auto_115000 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115000 ?auto_115005 )
      ( MAKE-1PILE ?auto_114999 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116413 - BLOCK
    )
    :vars
    (
      ?auto_116415 - BLOCK
      ?auto_116418 - BLOCK
      ?auto_116414 - BLOCK
      ?auto_116417 - BLOCK
      ?auto_116419 - BLOCK
      ?auto_116416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116415 ?auto_116413 ) ( ON-TABLE ?auto_116413 ) ( not ( = ?auto_116413 ?auto_116415 ) ) ( not ( = ?auto_116413 ?auto_116418 ) ) ( not ( = ?auto_116413 ?auto_116414 ) ) ( not ( = ?auto_116415 ?auto_116418 ) ) ( not ( = ?auto_116415 ?auto_116414 ) ) ( not ( = ?auto_116418 ?auto_116414 ) ) ( ON ?auto_116418 ?auto_116415 ) ( not ( = ?auto_116417 ?auto_116419 ) ) ( not ( = ?auto_116417 ?auto_116416 ) ) ( not ( = ?auto_116417 ?auto_116414 ) ) ( not ( = ?auto_116419 ?auto_116416 ) ) ( not ( = ?auto_116419 ?auto_116414 ) ) ( not ( = ?auto_116416 ?auto_116414 ) ) ( not ( = ?auto_116413 ?auto_116416 ) ) ( not ( = ?auto_116413 ?auto_116417 ) ) ( not ( = ?auto_116413 ?auto_116419 ) ) ( not ( = ?auto_116415 ?auto_116416 ) ) ( not ( = ?auto_116415 ?auto_116417 ) ) ( not ( = ?auto_116415 ?auto_116419 ) ) ( not ( = ?auto_116418 ?auto_116416 ) ) ( not ( = ?auto_116418 ?auto_116417 ) ) ( not ( = ?auto_116418 ?auto_116419 ) ) ( ON ?auto_116414 ?auto_116418 ) ( ON ?auto_116416 ?auto_116414 ) ( ON ?auto_116419 ?auto_116416 ) ( ON ?auto_116417 ?auto_116419 ) ( CLEAR ?auto_116417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116413 ?auto_116415 ?auto_116418 ?auto_116414 ?auto_116416 ?auto_116419 )
      ( MAKE-1PILE ?auto_116413 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115015 - BLOCK
    )
    :vars
    (
      ?auto_115021 - BLOCK
      ?auto_115020 - BLOCK
      ?auto_115016 - BLOCK
      ?auto_115022 - BLOCK
      ?auto_115018 - BLOCK
      ?auto_115019 - BLOCK
      ?auto_115017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115021 ?auto_115015 ) ( ON-TABLE ?auto_115015 ) ( not ( = ?auto_115015 ?auto_115021 ) ) ( not ( = ?auto_115015 ?auto_115020 ) ) ( not ( = ?auto_115015 ?auto_115016 ) ) ( not ( = ?auto_115021 ?auto_115020 ) ) ( not ( = ?auto_115021 ?auto_115016 ) ) ( not ( = ?auto_115020 ?auto_115016 ) ) ( ON ?auto_115020 ?auto_115021 ) ( not ( = ?auto_115022 ?auto_115018 ) ) ( not ( = ?auto_115022 ?auto_115019 ) ) ( not ( = ?auto_115022 ?auto_115017 ) ) ( not ( = ?auto_115022 ?auto_115016 ) ) ( not ( = ?auto_115018 ?auto_115019 ) ) ( not ( = ?auto_115018 ?auto_115017 ) ) ( not ( = ?auto_115018 ?auto_115016 ) ) ( not ( = ?auto_115019 ?auto_115017 ) ) ( not ( = ?auto_115019 ?auto_115016 ) ) ( not ( = ?auto_115017 ?auto_115016 ) ) ( not ( = ?auto_115015 ?auto_115017 ) ) ( not ( = ?auto_115015 ?auto_115022 ) ) ( not ( = ?auto_115015 ?auto_115018 ) ) ( not ( = ?auto_115015 ?auto_115019 ) ) ( not ( = ?auto_115021 ?auto_115017 ) ) ( not ( = ?auto_115021 ?auto_115022 ) ) ( not ( = ?auto_115021 ?auto_115018 ) ) ( not ( = ?auto_115021 ?auto_115019 ) ) ( not ( = ?auto_115020 ?auto_115017 ) ) ( not ( = ?auto_115020 ?auto_115022 ) ) ( not ( = ?auto_115020 ?auto_115018 ) ) ( not ( = ?auto_115020 ?auto_115019 ) ) ( ON ?auto_115016 ?auto_115020 ) ( ON ?auto_115017 ?auto_115016 ) ( ON ?auto_115019 ?auto_115017 ) ( ON ?auto_115018 ?auto_115019 ) ( CLEAR ?auto_115018 ) ( HOLDING ?auto_115022 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115022 )
      ( MAKE-1PILE ?auto_115015 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115023 - BLOCK
    )
    :vars
    (
      ?auto_115026 - BLOCK
      ?auto_115024 - BLOCK
      ?auto_115029 - BLOCK
      ?auto_115030 - BLOCK
      ?auto_115028 - BLOCK
      ?auto_115027 - BLOCK
      ?auto_115025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115026 ?auto_115023 ) ( ON-TABLE ?auto_115023 ) ( not ( = ?auto_115023 ?auto_115026 ) ) ( not ( = ?auto_115023 ?auto_115024 ) ) ( not ( = ?auto_115023 ?auto_115029 ) ) ( not ( = ?auto_115026 ?auto_115024 ) ) ( not ( = ?auto_115026 ?auto_115029 ) ) ( not ( = ?auto_115024 ?auto_115029 ) ) ( ON ?auto_115024 ?auto_115026 ) ( not ( = ?auto_115030 ?auto_115028 ) ) ( not ( = ?auto_115030 ?auto_115027 ) ) ( not ( = ?auto_115030 ?auto_115025 ) ) ( not ( = ?auto_115030 ?auto_115029 ) ) ( not ( = ?auto_115028 ?auto_115027 ) ) ( not ( = ?auto_115028 ?auto_115025 ) ) ( not ( = ?auto_115028 ?auto_115029 ) ) ( not ( = ?auto_115027 ?auto_115025 ) ) ( not ( = ?auto_115027 ?auto_115029 ) ) ( not ( = ?auto_115025 ?auto_115029 ) ) ( not ( = ?auto_115023 ?auto_115025 ) ) ( not ( = ?auto_115023 ?auto_115030 ) ) ( not ( = ?auto_115023 ?auto_115028 ) ) ( not ( = ?auto_115023 ?auto_115027 ) ) ( not ( = ?auto_115026 ?auto_115025 ) ) ( not ( = ?auto_115026 ?auto_115030 ) ) ( not ( = ?auto_115026 ?auto_115028 ) ) ( not ( = ?auto_115026 ?auto_115027 ) ) ( not ( = ?auto_115024 ?auto_115025 ) ) ( not ( = ?auto_115024 ?auto_115030 ) ) ( not ( = ?auto_115024 ?auto_115028 ) ) ( not ( = ?auto_115024 ?auto_115027 ) ) ( ON ?auto_115029 ?auto_115024 ) ( ON ?auto_115025 ?auto_115029 ) ( ON ?auto_115027 ?auto_115025 ) ( ON ?auto_115028 ?auto_115027 ) ( ON ?auto_115030 ?auto_115028 ) ( CLEAR ?auto_115030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115023 ?auto_115026 ?auto_115024 ?auto_115029 ?auto_115025 ?auto_115027 ?auto_115028 )
      ( MAKE-1PILE ?auto_115023 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115038 - BLOCK
      ?auto_115039 - BLOCK
      ?auto_115040 - BLOCK
      ?auto_115041 - BLOCK
      ?auto_115042 - BLOCK
      ?auto_115043 - BLOCK
      ?auto_115044 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_115044 ) ( CLEAR ?auto_115043 ) ( ON-TABLE ?auto_115038 ) ( ON ?auto_115039 ?auto_115038 ) ( ON ?auto_115040 ?auto_115039 ) ( ON ?auto_115041 ?auto_115040 ) ( ON ?auto_115042 ?auto_115041 ) ( ON ?auto_115043 ?auto_115042 ) ( not ( = ?auto_115038 ?auto_115039 ) ) ( not ( = ?auto_115038 ?auto_115040 ) ) ( not ( = ?auto_115038 ?auto_115041 ) ) ( not ( = ?auto_115038 ?auto_115042 ) ) ( not ( = ?auto_115038 ?auto_115043 ) ) ( not ( = ?auto_115038 ?auto_115044 ) ) ( not ( = ?auto_115039 ?auto_115040 ) ) ( not ( = ?auto_115039 ?auto_115041 ) ) ( not ( = ?auto_115039 ?auto_115042 ) ) ( not ( = ?auto_115039 ?auto_115043 ) ) ( not ( = ?auto_115039 ?auto_115044 ) ) ( not ( = ?auto_115040 ?auto_115041 ) ) ( not ( = ?auto_115040 ?auto_115042 ) ) ( not ( = ?auto_115040 ?auto_115043 ) ) ( not ( = ?auto_115040 ?auto_115044 ) ) ( not ( = ?auto_115041 ?auto_115042 ) ) ( not ( = ?auto_115041 ?auto_115043 ) ) ( not ( = ?auto_115041 ?auto_115044 ) ) ( not ( = ?auto_115042 ?auto_115043 ) ) ( not ( = ?auto_115042 ?auto_115044 ) ) ( not ( = ?auto_115043 ?auto_115044 ) ) )
    :subtasks
    ( ( !STACK ?auto_115044 ?auto_115043 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115045 - BLOCK
      ?auto_115046 - BLOCK
      ?auto_115047 - BLOCK
      ?auto_115048 - BLOCK
      ?auto_115049 - BLOCK
      ?auto_115050 - BLOCK
      ?auto_115051 - BLOCK
    )
    :vars
    (
      ?auto_115052 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_115050 ) ( ON-TABLE ?auto_115045 ) ( ON ?auto_115046 ?auto_115045 ) ( ON ?auto_115047 ?auto_115046 ) ( ON ?auto_115048 ?auto_115047 ) ( ON ?auto_115049 ?auto_115048 ) ( ON ?auto_115050 ?auto_115049 ) ( not ( = ?auto_115045 ?auto_115046 ) ) ( not ( = ?auto_115045 ?auto_115047 ) ) ( not ( = ?auto_115045 ?auto_115048 ) ) ( not ( = ?auto_115045 ?auto_115049 ) ) ( not ( = ?auto_115045 ?auto_115050 ) ) ( not ( = ?auto_115045 ?auto_115051 ) ) ( not ( = ?auto_115046 ?auto_115047 ) ) ( not ( = ?auto_115046 ?auto_115048 ) ) ( not ( = ?auto_115046 ?auto_115049 ) ) ( not ( = ?auto_115046 ?auto_115050 ) ) ( not ( = ?auto_115046 ?auto_115051 ) ) ( not ( = ?auto_115047 ?auto_115048 ) ) ( not ( = ?auto_115047 ?auto_115049 ) ) ( not ( = ?auto_115047 ?auto_115050 ) ) ( not ( = ?auto_115047 ?auto_115051 ) ) ( not ( = ?auto_115048 ?auto_115049 ) ) ( not ( = ?auto_115048 ?auto_115050 ) ) ( not ( = ?auto_115048 ?auto_115051 ) ) ( not ( = ?auto_115049 ?auto_115050 ) ) ( not ( = ?auto_115049 ?auto_115051 ) ) ( not ( = ?auto_115050 ?auto_115051 ) ) ( ON ?auto_115051 ?auto_115052 ) ( CLEAR ?auto_115051 ) ( HAND-EMPTY ) ( not ( = ?auto_115045 ?auto_115052 ) ) ( not ( = ?auto_115046 ?auto_115052 ) ) ( not ( = ?auto_115047 ?auto_115052 ) ) ( not ( = ?auto_115048 ?auto_115052 ) ) ( not ( = ?auto_115049 ?auto_115052 ) ) ( not ( = ?auto_115050 ?auto_115052 ) ) ( not ( = ?auto_115051 ?auto_115052 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115051 ?auto_115052 )
      ( MAKE-7PILE ?auto_115045 ?auto_115046 ?auto_115047 ?auto_115048 ?auto_115049 ?auto_115050 ?auto_115051 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115053 - BLOCK
      ?auto_115054 - BLOCK
      ?auto_115055 - BLOCK
      ?auto_115056 - BLOCK
      ?auto_115057 - BLOCK
      ?auto_115058 - BLOCK
      ?auto_115059 - BLOCK
    )
    :vars
    (
      ?auto_115060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115053 ) ( ON ?auto_115054 ?auto_115053 ) ( ON ?auto_115055 ?auto_115054 ) ( ON ?auto_115056 ?auto_115055 ) ( ON ?auto_115057 ?auto_115056 ) ( not ( = ?auto_115053 ?auto_115054 ) ) ( not ( = ?auto_115053 ?auto_115055 ) ) ( not ( = ?auto_115053 ?auto_115056 ) ) ( not ( = ?auto_115053 ?auto_115057 ) ) ( not ( = ?auto_115053 ?auto_115058 ) ) ( not ( = ?auto_115053 ?auto_115059 ) ) ( not ( = ?auto_115054 ?auto_115055 ) ) ( not ( = ?auto_115054 ?auto_115056 ) ) ( not ( = ?auto_115054 ?auto_115057 ) ) ( not ( = ?auto_115054 ?auto_115058 ) ) ( not ( = ?auto_115054 ?auto_115059 ) ) ( not ( = ?auto_115055 ?auto_115056 ) ) ( not ( = ?auto_115055 ?auto_115057 ) ) ( not ( = ?auto_115055 ?auto_115058 ) ) ( not ( = ?auto_115055 ?auto_115059 ) ) ( not ( = ?auto_115056 ?auto_115057 ) ) ( not ( = ?auto_115056 ?auto_115058 ) ) ( not ( = ?auto_115056 ?auto_115059 ) ) ( not ( = ?auto_115057 ?auto_115058 ) ) ( not ( = ?auto_115057 ?auto_115059 ) ) ( not ( = ?auto_115058 ?auto_115059 ) ) ( ON ?auto_115059 ?auto_115060 ) ( CLEAR ?auto_115059 ) ( not ( = ?auto_115053 ?auto_115060 ) ) ( not ( = ?auto_115054 ?auto_115060 ) ) ( not ( = ?auto_115055 ?auto_115060 ) ) ( not ( = ?auto_115056 ?auto_115060 ) ) ( not ( = ?auto_115057 ?auto_115060 ) ) ( not ( = ?auto_115058 ?auto_115060 ) ) ( not ( = ?auto_115059 ?auto_115060 ) ) ( HOLDING ?auto_115058 ) ( CLEAR ?auto_115057 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115053 ?auto_115054 ?auto_115055 ?auto_115056 ?auto_115057 ?auto_115058 )
      ( MAKE-7PILE ?auto_115053 ?auto_115054 ?auto_115055 ?auto_115056 ?auto_115057 ?auto_115058 ?auto_115059 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115061 - BLOCK
      ?auto_115062 - BLOCK
      ?auto_115063 - BLOCK
      ?auto_115064 - BLOCK
      ?auto_115065 - BLOCK
      ?auto_115066 - BLOCK
      ?auto_115067 - BLOCK
    )
    :vars
    (
      ?auto_115068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115061 ) ( ON ?auto_115062 ?auto_115061 ) ( ON ?auto_115063 ?auto_115062 ) ( ON ?auto_115064 ?auto_115063 ) ( ON ?auto_115065 ?auto_115064 ) ( not ( = ?auto_115061 ?auto_115062 ) ) ( not ( = ?auto_115061 ?auto_115063 ) ) ( not ( = ?auto_115061 ?auto_115064 ) ) ( not ( = ?auto_115061 ?auto_115065 ) ) ( not ( = ?auto_115061 ?auto_115066 ) ) ( not ( = ?auto_115061 ?auto_115067 ) ) ( not ( = ?auto_115062 ?auto_115063 ) ) ( not ( = ?auto_115062 ?auto_115064 ) ) ( not ( = ?auto_115062 ?auto_115065 ) ) ( not ( = ?auto_115062 ?auto_115066 ) ) ( not ( = ?auto_115062 ?auto_115067 ) ) ( not ( = ?auto_115063 ?auto_115064 ) ) ( not ( = ?auto_115063 ?auto_115065 ) ) ( not ( = ?auto_115063 ?auto_115066 ) ) ( not ( = ?auto_115063 ?auto_115067 ) ) ( not ( = ?auto_115064 ?auto_115065 ) ) ( not ( = ?auto_115064 ?auto_115066 ) ) ( not ( = ?auto_115064 ?auto_115067 ) ) ( not ( = ?auto_115065 ?auto_115066 ) ) ( not ( = ?auto_115065 ?auto_115067 ) ) ( not ( = ?auto_115066 ?auto_115067 ) ) ( ON ?auto_115067 ?auto_115068 ) ( not ( = ?auto_115061 ?auto_115068 ) ) ( not ( = ?auto_115062 ?auto_115068 ) ) ( not ( = ?auto_115063 ?auto_115068 ) ) ( not ( = ?auto_115064 ?auto_115068 ) ) ( not ( = ?auto_115065 ?auto_115068 ) ) ( not ( = ?auto_115066 ?auto_115068 ) ) ( not ( = ?auto_115067 ?auto_115068 ) ) ( CLEAR ?auto_115065 ) ( ON ?auto_115066 ?auto_115067 ) ( CLEAR ?auto_115066 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115068 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115068 ?auto_115067 )
      ( MAKE-7PILE ?auto_115061 ?auto_115062 ?auto_115063 ?auto_115064 ?auto_115065 ?auto_115066 ?auto_115067 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115069 - BLOCK
      ?auto_115070 - BLOCK
      ?auto_115071 - BLOCK
      ?auto_115072 - BLOCK
      ?auto_115073 - BLOCK
      ?auto_115074 - BLOCK
      ?auto_115075 - BLOCK
    )
    :vars
    (
      ?auto_115076 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115069 ) ( ON ?auto_115070 ?auto_115069 ) ( ON ?auto_115071 ?auto_115070 ) ( ON ?auto_115072 ?auto_115071 ) ( not ( = ?auto_115069 ?auto_115070 ) ) ( not ( = ?auto_115069 ?auto_115071 ) ) ( not ( = ?auto_115069 ?auto_115072 ) ) ( not ( = ?auto_115069 ?auto_115073 ) ) ( not ( = ?auto_115069 ?auto_115074 ) ) ( not ( = ?auto_115069 ?auto_115075 ) ) ( not ( = ?auto_115070 ?auto_115071 ) ) ( not ( = ?auto_115070 ?auto_115072 ) ) ( not ( = ?auto_115070 ?auto_115073 ) ) ( not ( = ?auto_115070 ?auto_115074 ) ) ( not ( = ?auto_115070 ?auto_115075 ) ) ( not ( = ?auto_115071 ?auto_115072 ) ) ( not ( = ?auto_115071 ?auto_115073 ) ) ( not ( = ?auto_115071 ?auto_115074 ) ) ( not ( = ?auto_115071 ?auto_115075 ) ) ( not ( = ?auto_115072 ?auto_115073 ) ) ( not ( = ?auto_115072 ?auto_115074 ) ) ( not ( = ?auto_115072 ?auto_115075 ) ) ( not ( = ?auto_115073 ?auto_115074 ) ) ( not ( = ?auto_115073 ?auto_115075 ) ) ( not ( = ?auto_115074 ?auto_115075 ) ) ( ON ?auto_115075 ?auto_115076 ) ( not ( = ?auto_115069 ?auto_115076 ) ) ( not ( = ?auto_115070 ?auto_115076 ) ) ( not ( = ?auto_115071 ?auto_115076 ) ) ( not ( = ?auto_115072 ?auto_115076 ) ) ( not ( = ?auto_115073 ?auto_115076 ) ) ( not ( = ?auto_115074 ?auto_115076 ) ) ( not ( = ?auto_115075 ?auto_115076 ) ) ( ON ?auto_115074 ?auto_115075 ) ( CLEAR ?auto_115074 ) ( ON-TABLE ?auto_115076 ) ( HOLDING ?auto_115073 ) ( CLEAR ?auto_115072 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115069 ?auto_115070 ?auto_115071 ?auto_115072 ?auto_115073 )
      ( MAKE-7PILE ?auto_115069 ?auto_115070 ?auto_115071 ?auto_115072 ?auto_115073 ?auto_115074 ?auto_115075 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115077 - BLOCK
      ?auto_115078 - BLOCK
      ?auto_115079 - BLOCK
      ?auto_115080 - BLOCK
      ?auto_115081 - BLOCK
      ?auto_115082 - BLOCK
      ?auto_115083 - BLOCK
    )
    :vars
    (
      ?auto_115084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115077 ) ( ON ?auto_115078 ?auto_115077 ) ( ON ?auto_115079 ?auto_115078 ) ( ON ?auto_115080 ?auto_115079 ) ( not ( = ?auto_115077 ?auto_115078 ) ) ( not ( = ?auto_115077 ?auto_115079 ) ) ( not ( = ?auto_115077 ?auto_115080 ) ) ( not ( = ?auto_115077 ?auto_115081 ) ) ( not ( = ?auto_115077 ?auto_115082 ) ) ( not ( = ?auto_115077 ?auto_115083 ) ) ( not ( = ?auto_115078 ?auto_115079 ) ) ( not ( = ?auto_115078 ?auto_115080 ) ) ( not ( = ?auto_115078 ?auto_115081 ) ) ( not ( = ?auto_115078 ?auto_115082 ) ) ( not ( = ?auto_115078 ?auto_115083 ) ) ( not ( = ?auto_115079 ?auto_115080 ) ) ( not ( = ?auto_115079 ?auto_115081 ) ) ( not ( = ?auto_115079 ?auto_115082 ) ) ( not ( = ?auto_115079 ?auto_115083 ) ) ( not ( = ?auto_115080 ?auto_115081 ) ) ( not ( = ?auto_115080 ?auto_115082 ) ) ( not ( = ?auto_115080 ?auto_115083 ) ) ( not ( = ?auto_115081 ?auto_115082 ) ) ( not ( = ?auto_115081 ?auto_115083 ) ) ( not ( = ?auto_115082 ?auto_115083 ) ) ( ON ?auto_115083 ?auto_115084 ) ( not ( = ?auto_115077 ?auto_115084 ) ) ( not ( = ?auto_115078 ?auto_115084 ) ) ( not ( = ?auto_115079 ?auto_115084 ) ) ( not ( = ?auto_115080 ?auto_115084 ) ) ( not ( = ?auto_115081 ?auto_115084 ) ) ( not ( = ?auto_115082 ?auto_115084 ) ) ( not ( = ?auto_115083 ?auto_115084 ) ) ( ON ?auto_115082 ?auto_115083 ) ( ON-TABLE ?auto_115084 ) ( CLEAR ?auto_115080 ) ( ON ?auto_115081 ?auto_115082 ) ( CLEAR ?auto_115081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115084 ?auto_115083 ?auto_115082 )
      ( MAKE-7PILE ?auto_115077 ?auto_115078 ?auto_115079 ?auto_115080 ?auto_115081 ?auto_115082 ?auto_115083 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115085 - BLOCK
      ?auto_115086 - BLOCK
      ?auto_115087 - BLOCK
      ?auto_115088 - BLOCK
      ?auto_115089 - BLOCK
      ?auto_115090 - BLOCK
      ?auto_115091 - BLOCK
    )
    :vars
    (
      ?auto_115092 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115085 ) ( ON ?auto_115086 ?auto_115085 ) ( ON ?auto_115087 ?auto_115086 ) ( not ( = ?auto_115085 ?auto_115086 ) ) ( not ( = ?auto_115085 ?auto_115087 ) ) ( not ( = ?auto_115085 ?auto_115088 ) ) ( not ( = ?auto_115085 ?auto_115089 ) ) ( not ( = ?auto_115085 ?auto_115090 ) ) ( not ( = ?auto_115085 ?auto_115091 ) ) ( not ( = ?auto_115086 ?auto_115087 ) ) ( not ( = ?auto_115086 ?auto_115088 ) ) ( not ( = ?auto_115086 ?auto_115089 ) ) ( not ( = ?auto_115086 ?auto_115090 ) ) ( not ( = ?auto_115086 ?auto_115091 ) ) ( not ( = ?auto_115087 ?auto_115088 ) ) ( not ( = ?auto_115087 ?auto_115089 ) ) ( not ( = ?auto_115087 ?auto_115090 ) ) ( not ( = ?auto_115087 ?auto_115091 ) ) ( not ( = ?auto_115088 ?auto_115089 ) ) ( not ( = ?auto_115088 ?auto_115090 ) ) ( not ( = ?auto_115088 ?auto_115091 ) ) ( not ( = ?auto_115089 ?auto_115090 ) ) ( not ( = ?auto_115089 ?auto_115091 ) ) ( not ( = ?auto_115090 ?auto_115091 ) ) ( ON ?auto_115091 ?auto_115092 ) ( not ( = ?auto_115085 ?auto_115092 ) ) ( not ( = ?auto_115086 ?auto_115092 ) ) ( not ( = ?auto_115087 ?auto_115092 ) ) ( not ( = ?auto_115088 ?auto_115092 ) ) ( not ( = ?auto_115089 ?auto_115092 ) ) ( not ( = ?auto_115090 ?auto_115092 ) ) ( not ( = ?auto_115091 ?auto_115092 ) ) ( ON ?auto_115090 ?auto_115091 ) ( ON-TABLE ?auto_115092 ) ( ON ?auto_115089 ?auto_115090 ) ( CLEAR ?auto_115089 ) ( HOLDING ?auto_115088 ) ( CLEAR ?auto_115087 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115085 ?auto_115086 ?auto_115087 ?auto_115088 )
      ( MAKE-7PILE ?auto_115085 ?auto_115086 ?auto_115087 ?auto_115088 ?auto_115089 ?auto_115090 ?auto_115091 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115093 - BLOCK
      ?auto_115094 - BLOCK
      ?auto_115095 - BLOCK
      ?auto_115096 - BLOCK
      ?auto_115097 - BLOCK
      ?auto_115098 - BLOCK
      ?auto_115099 - BLOCK
    )
    :vars
    (
      ?auto_115100 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115093 ) ( ON ?auto_115094 ?auto_115093 ) ( ON ?auto_115095 ?auto_115094 ) ( not ( = ?auto_115093 ?auto_115094 ) ) ( not ( = ?auto_115093 ?auto_115095 ) ) ( not ( = ?auto_115093 ?auto_115096 ) ) ( not ( = ?auto_115093 ?auto_115097 ) ) ( not ( = ?auto_115093 ?auto_115098 ) ) ( not ( = ?auto_115093 ?auto_115099 ) ) ( not ( = ?auto_115094 ?auto_115095 ) ) ( not ( = ?auto_115094 ?auto_115096 ) ) ( not ( = ?auto_115094 ?auto_115097 ) ) ( not ( = ?auto_115094 ?auto_115098 ) ) ( not ( = ?auto_115094 ?auto_115099 ) ) ( not ( = ?auto_115095 ?auto_115096 ) ) ( not ( = ?auto_115095 ?auto_115097 ) ) ( not ( = ?auto_115095 ?auto_115098 ) ) ( not ( = ?auto_115095 ?auto_115099 ) ) ( not ( = ?auto_115096 ?auto_115097 ) ) ( not ( = ?auto_115096 ?auto_115098 ) ) ( not ( = ?auto_115096 ?auto_115099 ) ) ( not ( = ?auto_115097 ?auto_115098 ) ) ( not ( = ?auto_115097 ?auto_115099 ) ) ( not ( = ?auto_115098 ?auto_115099 ) ) ( ON ?auto_115099 ?auto_115100 ) ( not ( = ?auto_115093 ?auto_115100 ) ) ( not ( = ?auto_115094 ?auto_115100 ) ) ( not ( = ?auto_115095 ?auto_115100 ) ) ( not ( = ?auto_115096 ?auto_115100 ) ) ( not ( = ?auto_115097 ?auto_115100 ) ) ( not ( = ?auto_115098 ?auto_115100 ) ) ( not ( = ?auto_115099 ?auto_115100 ) ) ( ON ?auto_115098 ?auto_115099 ) ( ON-TABLE ?auto_115100 ) ( ON ?auto_115097 ?auto_115098 ) ( CLEAR ?auto_115095 ) ( ON ?auto_115096 ?auto_115097 ) ( CLEAR ?auto_115096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115100 ?auto_115099 ?auto_115098 ?auto_115097 )
      ( MAKE-7PILE ?auto_115093 ?auto_115094 ?auto_115095 ?auto_115096 ?auto_115097 ?auto_115098 ?auto_115099 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115101 - BLOCK
      ?auto_115102 - BLOCK
      ?auto_115103 - BLOCK
      ?auto_115104 - BLOCK
      ?auto_115105 - BLOCK
      ?auto_115106 - BLOCK
      ?auto_115107 - BLOCK
    )
    :vars
    (
      ?auto_115108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115101 ) ( ON ?auto_115102 ?auto_115101 ) ( not ( = ?auto_115101 ?auto_115102 ) ) ( not ( = ?auto_115101 ?auto_115103 ) ) ( not ( = ?auto_115101 ?auto_115104 ) ) ( not ( = ?auto_115101 ?auto_115105 ) ) ( not ( = ?auto_115101 ?auto_115106 ) ) ( not ( = ?auto_115101 ?auto_115107 ) ) ( not ( = ?auto_115102 ?auto_115103 ) ) ( not ( = ?auto_115102 ?auto_115104 ) ) ( not ( = ?auto_115102 ?auto_115105 ) ) ( not ( = ?auto_115102 ?auto_115106 ) ) ( not ( = ?auto_115102 ?auto_115107 ) ) ( not ( = ?auto_115103 ?auto_115104 ) ) ( not ( = ?auto_115103 ?auto_115105 ) ) ( not ( = ?auto_115103 ?auto_115106 ) ) ( not ( = ?auto_115103 ?auto_115107 ) ) ( not ( = ?auto_115104 ?auto_115105 ) ) ( not ( = ?auto_115104 ?auto_115106 ) ) ( not ( = ?auto_115104 ?auto_115107 ) ) ( not ( = ?auto_115105 ?auto_115106 ) ) ( not ( = ?auto_115105 ?auto_115107 ) ) ( not ( = ?auto_115106 ?auto_115107 ) ) ( ON ?auto_115107 ?auto_115108 ) ( not ( = ?auto_115101 ?auto_115108 ) ) ( not ( = ?auto_115102 ?auto_115108 ) ) ( not ( = ?auto_115103 ?auto_115108 ) ) ( not ( = ?auto_115104 ?auto_115108 ) ) ( not ( = ?auto_115105 ?auto_115108 ) ) ( not ( = ?auto_115106 ?auto_115108 ) ) ( not ( = ?auto_115107 ?auto_115108 ) ) ( ON ?auto_115106 ?auto_115107 ) ( ON-TABLE ?auto_115108 ) ( ON ?auto_115105 ?auto_115106 ) ( ON ?auto_115104 ?auto_115105 ) ( CLEAR ?auto_115104 ) ( HOLDING ?auto_115103 ) ( CLEAR ?auto_115102 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115101 ?auto_115102 ?auto_115103 )
      ( MAKE-7PILE ?auto_115101 ?auto_115102 ?auto_115103 ?auto_115104 ?auto_115105 ?auto_115106 ?auto_115107 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115109 - BLOCK
      ?auto_115110 - BLOCK
      ?auto_115111 - BLOCK
      ?auto_115112 - BLOCK
      ?auto_115113 - BLOCK
      ?auto_115114 - BLOCK
      ?auto_115115 - BLOCK
    )
    :vars
    (
      ?auto_115116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115109 ) ( ON ?auto_115110 ?auto_115109 ) ( not ( = ?auto_115109 ?auto_115110 ) ) ( not ( = ?auto_115109 ?auto_115111 ) ) ( not ( = ?auto_115109 ?auto_115112 ) ) ( not ( = ?auto_115109 ?auto_115113 ) ) ( not ( = ?auto_115109 ?auto_115114 ) ) ( not ( = ?auto_115109 ?auto_115115 ) ) ( not ( = ?auto_115110 ?auto_115111 ) ) ( not ( = ?auto_115110 ?auto_115112 ) ) ( not ( = ?auto_115110 ?auto_115113 ) ) ( not ( = ?auto_115110 ?auto_115114 ) ) ( not ( = ?auto_115110 ?auto_115115 ) ) ( not ( = ?auto_115111 ?auto_115112 ) ) ( not ( = ?auto_115111 ?auto_115113 ) ) ( not ( = ?auto_115111 ?auto_115114 ) ) ( not ( = ?auto_115111 ?auto_115115 ) ) ( not ( = ?auto_115112 ?auto_115113 ) ) ( not ( = ?auto_115112 ?auto_115114 ) ) ( not ( = ?auto_115112 ?auto_115115 ) ) ( not ( = ?auto_115113 ?auto_115114 ) ) ( not ( = ?auto_115113 ?auto_115115 ) ) ( not ( = ?auto_115114 ?auto_115115 ) ) ( ON ?auto_115115 ?auto_115116 ) ( not ( = ?auto_115109 ?auto_115116 ) ) ( not ( = ?auto_115110 ?auto_115116 ) ) ( not ( = ?auto_115111 ?auto_115116 ) ) ( not ( = ?auto_115112 ?auto_115116 ) ) ( not ( = ?auto_115113 ?auto_115116 ) ) ( not ( = ?auto_115114 ?auto_115116 ) ) ( not ( = ?auto_115115 ?auto_115116 ) ) ( ON ?auto_115114 ?auto_115115 ) ( ON-TABLE ?auto_115116 ) ( ON ?auto_115113 ?auto_115114 ) ( ON ?auto_115112 ?auto_115113 ) ( CLEAR ?auto_115110 ) ( ON ?auto_115111 ?auto_115112 ) ( CLEAR ?auto_115111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115116 ?auto_115115 ?auto_115114 ?auto_115113 ?auto_115112 )
      ( MAKE-7PILE ?auto_115109 ?auto_115110 ?auto_115111 ?auto_115112 ?auto_115113 ?auto_115114 ?auto_115115 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115117 - BLOCK
      ?auto_115118 - BLOCK
      ?auto_115119 - BLOCK
      ?auto_115120 - BLOCK
      ?auto_115121 - BLOCK
      ?auto_115122 - BLOCK
      ?auto_115123 - BLOCK
    )
    :vars
    (
      ?auto_115124 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115117 ) ( not ( = ?auto_115117 ?auto_115118 ) ) ( not ( = ?auto_115117 ?auto_115119 ) ) ( not ( = ?auto_115117 ?auto_115120 ) ) ( not ( = ?auto_115117 ?auto_115121 ) ) ( not ( = ?auto_115117 ?auto_115122 ) ) ( not ( = ?auto_115117 ?auto_115123 ) ) ( not ( = ?auto_115118 ?auto_115119 ) ) ( not ( = ?auto_115118 ?auto_115120 ) ) ( not ( = ?auto_115118 ?auto_115121 ) ) ( not ( = ?auto_115118 ?auto_115122 ) ) ( not ( = ?auto_115118 ?auto_115123 ) ) ( not ( = ?auto_115119 ?auto_115120 ) ) ( not ( = ?auto_115119 ?auto_115121 ) ) ( not ( = ?auto_115119 ?auto_115122 ) ) ( not ( = ?auto_115119 ?auto_115123 ) ) ( not ( = ?auto_115120 ?auto_115121 ) ) ( not ( = ?auto_115120 ?auto_115122 ) ) ( not ( = ?auto_115120 ?auto_115123 ) ) ( not ( = ?auto_115121 ?auto_115122 ) ) ( not ( = ?auto_115121 ?auto_115123 ) ) ( not ( = ?auto_115122 ?auto_115123 ) ) ( ON ?auto_115123 ?auto_115124 ) ( not ( = ?auto_115117 ?auto_115124 ) ) ( not ( = ?auto_115118 ?auto_115124 ) ) ( not ( = ?auto_115119 ?auto_115124 ) ) ( not ( = ?auto_115120 ?auto_115124 ) ) ( not ( = ?auto_115121 ?auto_115124 ) ) ( not ( = ?auto_115122 ?auto_115124 ) ) ( not ( = ?auto_115123 ?auto_115124 ) ) ( ON ?auto_115122 ?auto_115123 ) ( ON-TABLE ?auto_115124 ) ( ON ?auto_115121 ?auto_115122 ) ( ON ?auto_115120 ?auto_115121 ) ( ON ?auto_115119 ?auto_115120 ) ( CLEAR ?auto_115119 ) ( HOLDING ?auto_115118 ) ( CLEAR ?auto_115117 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115117 ?auto_115118 )
      ( MAKE-7PILE ?auto_115117 ?auto_115118 ?auto_115119 ?auto_115120 ?auto_115121 ?auto_115122 ?auto_115123 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115125 - BLOCK
      ?auto_115126 - BLOCK
      ?auto_115127 - BLOCK
      ?auto_115128 - BLOCK
      ?auto_115129 - BLOCK
      ?auto_115130 - BLOCK
      ?auto_115131 - BLOCK
    )
    :vars
    (
      ?auto_115132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115125 ) ( not ( = ?auto_115125 ?auto_115126 ) ) ( not ( = ?auto_115125 ?auto_115127 ) ) ( not ( = ?auto_115125 ?auto_115128 ) ) ( not ( = ?auto_115125 ?auto_115129 ) ) ( not ( = ?auto_115125 ?auto_115130 ) ) ( not ( = ?auto_115125 ?auto_115131 ) ) ( not ( = ?auto_115126 ?auto_115127 ) ) ( not ( = ?auto_115126 ?auto_115128 ) ) ( not ( = ?auto_115126 ?auto_115129 ) ) ( not ( = ?auto_115126 ?auto_115130 ) ) ( not ( = ?auto_115126 ?auto_115131 ) ) ( not ( = ?auto_115127 ?auto_115128 ) ) ( not ( = ?auto_115127 ?auto_115129 ) ) ( not ( = ?auto_115127 ?auto_115130 ) ) ( not ( = ?auto_115127 ?auto_115131 ) ) ( not ( = ?auto_115128 ?auto_115129 ) ) ( not ( = ?auto_115128 ?auto_115130 ) ) ( not ( = ?auto_115128 ?auto_115131 ) ) ( not ( = ?auto_115129 ?auto_115130 ) ) ( not ( = ?auto_115129 ?auto_115131 ) ) ( not ( = ?auto_115130 ?auto_115131 ) ) ( ON ?auto_115131 ?auto_115132 ) ( not ( = ?auto_115125 ?auto_115132 ) ) ( not ( = ?auto_115126 ?auto_115132 ) ) ( not ( = ?auto_115127 ?auto_115132 ) ) ( not ( = ?auto_115128 ?auto_115132 ) ) ( not ( = ?auto_115129 ?auto_115132 ) ) ( not ( = ?auto_115130 ?auto_115132 ) ) ( not ( = ?auto_115131 ?auto_115132 ) ) ( ON ?auto_115130 ?auto_115131 ) ( ON-TABLE ?auto_115132 ) ( ON ?auto_115129 ?auto_115130 ) ( ON ?auto_115128 ?auto_115129 ) ( ON ?auto_115127 ?auto_115128 ) ( CLEAR ?auto_115125 ) ( ON ?auto_115126 ?auto_115127 ) ( CLEAR ?auto_115126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115132 ?auto_115131 ?auto_115130 ?auto_115129 ?auto_115128 ?auto_115127 )
      ( MAKE-7PILE ?auto_115125 ?auto_115126 ?auto_115127 ?auto_115128 ?auto_115129 ?auto_115130 ?auto_115131 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115133 - BLOCK
      ?auto_115134 - BLOCK
      ?auto_115135 - BLOCK
      ?auto_115136 - BLOCK
      ?auto_115137 - BLOCK
      ?auto_115138 - BLOCK
      ?auto_115139 - BLOCK
    )
    :vars
    (
      ?auto_115140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115133 ?auto_115134 ) ) ( not ( = ?auto_115133 ?auto_115135 ) ) ( not ( = ?auto_115133 ?auto_115136 ) ) ( not ( = ?auto_115133 ?auto_115137 ) ) ( not ( = ?auto_115133 ?auto_115138 ) ) ( not ( = ?auto_115133 ?auto_115139 ) ) ( not ( = ?auto_115134 ?auto_115135 ) ) ( not ( = ?auto_115134 ?auto_115136 ) ) ( not ( = ?auto_115134 ?auto_115137 ) ) ( not ( = ?auto_115134 ?auto_115138 ) ) ( not ( = ?auto_115134 ?auto_115139 ) ) ( not ( = ?auto_115135 ?auto_115136 ) ) ( not ( = ?auto_115135 ?auto_115137 ) ) ( not ( = ?auto_115135 ?auto_115138 ) ) ( not ( = ?auto_115135 ?auto_115139 ) ) ( not ( = ?auto_115136 ?auto_115137 ) ) ( not ( = ?auto_115136 ?auto_115138 ) ) ( not ( = ?auto_115136 ?auto_115139 ) ) ( not ( = ?auto_115137 ?auto_115138 ) ) ( not ( = ?auto_115137 ?auto_115139 ) ) ( not ( = ?auto_115138 ?auto_115139 ) ) ( ON ?auto_115139 ?auto_115140 ) ( not ( = ?auto_115133 ?auto_115140 ) ) ( not ( = ?auto_115134 ?auto_115140 ) ) ( not ( = ?auto_115135 ?auto_115140 ) ) ( not ( = ?auto_115136 ?auto_115140 ) ) ( not ( = ?auto_115137 ?auto_115140 ) ) ( not ( = ?auto_115138 ?auto_115140 ) ) ( not ( = ?auto_115139 ?auto_115140 ) ) ( ON ?auto_115138 ?auto_115139 ) ( ON-TABLE ?auto_115140 ) ( ON ?auto_115137 ?auto_115138 ) ( ON ?auto_115136 ?auto_115137 ) ( ON ?auto_115135 ?auto_115136 ) ( ON ?auto_115134 ?auto_115135 ) ( CLEAR ?auto_115134 ) ( HOLDING ?auto_115133 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115133 )
      ( MAKE-7PILE ?auto_115133 ?auto_115134 ?auto_115135 ?auto_115136 ?auto_115137 ?auto_115138 ?auto_115139 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_115141 - BLOCK
      ?auto_115142 - BLOCK
      ?auto_115143 - BLOCK
      ?auto_115144 - BLOCK
      ?auto_115145 - BLOCK
      ?auto_115146 - BLOCK
      ?auto_115147 - BLOCK
    )
    :vars
    (
      ?auto_115148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115141 ?auto_115142 ) ) ( not ( = ?auto_115141 ?auto_115143 ) ) ( not ( = ?auto_115141 ?auto_115144 ) ) ( not ( = ?auto_115141 ?auto_115145 ) ) ( not ( = ?auto_115141 ?auto_115146 ) ) ( not ( = ?auto_115141 ?auto_115147 ) ) ( not ( = ?auto_115142 ?auto_115143 ) ) ( not ( = ?auto_115142 ?auto_115144 ) ) ( not ( = ?auto_115142 ?auto_115145 ) ) ( not ( = ?auto_115142 ?auto_115146 ) ) ( not ( = ?auto_115142 ?auto_115147 ) ) ( not ( = ?auto_115143 ?auto_115144 ) ) ( not ( = ?auto_115143 ?auto_115145 ) ) ( not ( = ?auto_115143 ?auto_115146 ) ) ( not ( = ?auto_115143 ?auto_115147 ) ) ( not ( = ?auto_115144 ?auto_115145 ) ) ( not ( = ?auto_115144 ?auto_115146 ) ) ( not ( = ?auto_115144 ?auto_115147 ) ) ( not ( = ?auto_115145 ?auto_115146 ) ) ( not ( = ?auto_115145 ?auto_115147 ) ) ( not ( = ?auto_115146 ?auto_115147 ) ) ( ON ?auto_115147 ?auto_115148 ) ( not ( = ?auto_115141 ?auto_115148 ) ) ( not ( = ?auto_115142 ?auto_115148 ) ) ( not ( = ?auto_115143 ?auto_115148 ) ) ( not ( = ?auto_115144 ?auto_115148 ) ) ( not ( = ?auto_115145 ?auto_115148 ) ) ( not ( = ?auto_115146 ?auto_115148 ) ) ( not ( = ?auto_115147 ?auto_115148 ) ) ( ON ?auto_115146 ?auto_115147 ) ( ON-TABLE ?auto_115148 ) ( ON ?auto_115145 ?auto_115146 ) ( ON ?auto_115144 ?auto_115145 ) ( ON ?auto_115143 ?auto_115144 ) ( ON ?auto_115142 ?auto_115143 ) ( ON ?auto_115141 ?auto_115142 ) ( CLEAR ?auto_115141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115148 ?auto_115147 ?auto_115146 ?auto_115145 ?auto_115144 ?auto_115143 ?auto_115142 )
      ( MAKE-7PILE ?auto_115141 ?auto_115142 ?auto_115143 ?auto_115144 ?auto_115145 ?auto_115146 ?auto_115147 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115255 - BLOCK
    )
    :vars
    (
      ?auto_115256 - BLOCK
      ?auto_115257 - BLOCK
      ?auto_115258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115255 ?auto_115256 ) ( CLEAR ?auto_115255 ) ( not ( = ?auto_115255 ?auto_115256 ) ) ( HOLDING ?auto_115257 ) ( CLEAR ?auto_115258 ) ( not ( = ?auto_115255 ?auto_115257 ) ) ( not ( = ?auto_115255 ?auto_115258 ) ) ( not ( = ?auto_115256 ?auto_115257 ) ) ( not ( = ?auto_115256 ?auto_115258 ) ) ( not ( = ?auto_115257 ?auto_115258 ) ) )
    :subtasks
    ( ( !STACK ?auto_115257 ?auto_115258 )
      ( MAKE-1PILE ?auto_115255 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115259 - BLOCK
    )
    :vars
    (
      ?auto_115260 - BLOCK
      ?auto_115261 - BLOCK
      ?auto_115262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115259 ?auto_115260 ) ( not ( = ?auto_115259 ?auto_115260 ) ) ( CLEAR ?auto_115261 ) ( not ( = ?auto_115259 ?auto_115262 ) ) ( not ( = ?auto_115259 ?auto_115261 ) ) ( not ( = ?auto_115260 ?auto_115262 ) ) ( not ( = ?auto_115260 ?auto_115261 ) ) ( not ( = ?auto_115262 ?auto_115261 ) ) ( ON ?auto_115262 ?auto_115259 ) ( CLEAR ?auto_115262 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115260 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115260 ?auto_115259 )
      ( MAKE-1PILE ?auto_115259 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115263 - BLOCK
    )
    :vars
    (
      ?auto_115265 - BLOCK
      ?auto_115264 - BLOCK
      ?auto_115266 - BLOCK
      ?auto_115269 - BLOCK
      ?auto_115268 - BLOCK
      ?auto_115267 - BLOCK
      ?auto_115270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115263 ?auto_115265 ) ( not ( = ?auto_115263 ?auto_115265 ) ) ( not ( = ?auto_115263 ?auto_115264 ) ) ( not ( = ?auto_115263 ?auto_115266 ) ) ( not ( = ?auto_115265 ?auto_115264 ) ) ( not ( = ?auto_115265 ?auto_115266 ) ) ( not ( = ?auto_115264 ?auto_115266 ) ) ( ON ?auto_115264 ?auto_115263 ) ( CLEAR ?auto_115264 ) ( ON-TABLE ?auto_115265 ) ( HOLDING ?auto_115266 ) ( CLEAR ?auto_115269 ) ( ON-TABLE ?auto_115268 ) ( ON ?auto_115267 ?auto_115268 ) ( ON ?auto_115270 ?auto_115267 ) ( ON ?auto_115269 ?auto_115270 ) ( not ( = ?auto_115268 ?auto_115267 ) ) ( not ( = ?auto_115268 ?auto_115270 ) ) ( not ( = ?auto_115268 ?auto_115269 ) ) ( not ( = ?auto_115268 ?auto_115266 ) ) ( not ( = ?auto_115267 ?auto_115270 ) ) ( not ( = ?auto_115267 ?auto_115269 ) ) ( not ( = ?auto_115267 ?auto_115266 ) ) ( not ( = ?auto_115270 ?auto_115269 ) ) ( not ( = ?auto_115270 ?auto_115266 ) ) ( not ( = ?auto_115269 ?auto_115266 ) ) ( not ( = ?auto_115263 ?auto_115269 ) ) ( not ( = ?auto_115263 ?auto_115268 ) ) ( not ( = ?auto_115263 ?auto_115267 ) ) ( not ( = ?auto_115263 ?auto_115270 ) ) ( not ( = ?auto_115265 ?auto_115269 ) ) ( not ( = ?auto_115265 ?auto_115268 ) ) ( not ( = ?auto_115265 ?auto_115267 ) ) ( not ( = ?auto_115265 ?auto_115270 ) ) ( not ( = ?auto_115264 ?auto_115269 ) ) ( not ( = ?auto_115264 ?auto_115268 ) ) ( not ( = ?auto_115264 ?auto_115267 ) ) ( not ( = ?auto_115264 ?auto_115270 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115268 ?auto_115267 ?auto_115270 ?auto_115269 ?auto_115266 )
      ( MAKE-1PILE ?auto_115263 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115271 - BLOCK
    )
    :vars
    (
      ?auto_115272 - BLOCK
      ?auto_115278 - BLOCK
      ?auto_115276 - BLOCK
      ?auto_115277 - BLOCK
      ?auto_115273 - BLOCK
      ?auto_115275 - BLOCK
      ?auto_115274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115271 ?auto_115272 ) ( not ( = ?auto_115271 ?auto_115272 ) ) ( not ( = ?auto_115271 ?auto_115278 ) ) ( not ( = ?auto_115271 ?auto_115276 ) ) ( not ( = ?auto_115272 ?auto_115278 ) ) ( not ( = ?auto_115272 ?auto_115276 ) ) ( not ( = ?auto_115278 ?auto_115276 ) ) ( ON ?auto_115278 ?auto_115271 ) ( ON-TABLE ?auto_115272 ) ( CLEAR ?auto_115277 ) ( ON-TABLE ?auto_115273 ) ( ON ?auto_115275 ?auto_115273 ) ( ON ?auto_115274 ?auto_115275 ) ( ON ?auto_115277 ?auto_115274 ) ( not ( = ?auto_115273 ?auto_115275 ) ) ( not ( = ?auto_115273 ?auto_115274 ) ) ( not ( = ?auto_115273 ?auto_115277 ) ) ( not ( = ?auto_115273 ?auto_115276 ) ) ( not ( = ?auto_115275 ?auto_115274 ) ) ( not ( = ?auto_115275 ?auto_115277 ) ) ( not ( = ?auto_115275 ?auto_115276 ) ) ( not ( = ?auto_115274 ?auto_115277 ) ) ( not ( = ?auto_115274 ?auto_115276 ) ) ( not ( = ?auto_115277 ?auto_115276 ) ) ( not ( = ?auto_115271 ?auto_115277 ) ) ( not ( = ?auto_115271 ?auto_115273 ) ) ( not ( = ?auto_115271 ?auto_115275 ) ) ( not ( = ?auto_115271 ?auto_115274 ) ) ( not ( = ?auto_115272 ?auto_115277 ) ) ( not ( = ?auto_115272 ?auto_115273 ) ) ( not ( = ?auto_115272 ?auto_115275 ) ) ( not ( = ?auto_115272 ?auto_115274 ) ) ( not ( = ?auto_115278 ?auto_115277 ) ) ( not ( = ?auto_115278 ?auto_115273 ) ) ( not ( = ?auto_115278 ?auto_115275 ) ) ( not ( = ?auto_115278 ?auto_115274 ) ) ( ON ?auto_115276 ?auto_115278 ) ( CLEAR ?auto_115276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115272 ?auto_115271 ?auto_115278 )
      ( MAKE-1PILE ?auto_115271 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115279 - BLOCK
    )
    :vars
    (
      ?auto_115283 - BLOCK
      ?auto_115285 - BLOCK
      ?auto_115281 - BLOCK
      ?auto_115284 - BLOCK
      ?auto_115280 - BLOCK
      ?auto_115286 - BLOCK
      ?auto_115282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115279 ?auto_115283 ) ( not ( = ?auto_115279 ?auto_115283 ) ) ( not ( = ?auto_115279 ?auto_115285 ) ) ( not ( = ?auto_115279 ?auto_115281 ) ) ( not ( = ?auto_115283 ?auto_115285 ) ) ( not ( = ?auto_115283 ?auto_115281 ) ) ( not ( = ?auto_115285 ?auto_115281 ) ) ( ON ?auto_115285 ?auto_115279 ) ( ON-TABLE ?auto_115283 ) ( ON-TABLE ?auto_115284 ) ( ON ?auto_115280 ?auto_115284 ) ( ON ?auto_115286 ?auto_115280 ) ( not ( = ?auto_115284 ?auto_115280 ) ) ( not ( = ?auto_115284 ?auto_115286 ) ) ( not ( = ?auto_115284 ?auto_115282 ) ) ( not ( = ?auto_115284 ?auto_115281 ) ) ( not ( = ?auto_115280 ?auto_115286 ) ) ( not ( = ?auto_115280 ?auto_115282 ) ) ( not ( = ?auto_115280 ?auto_115281 ) ) ( not ( = ?auto_115286 ?auto_115282 ) ) ( not ( = ?auto_115286 ?auto_115281 ) ) ( not ( = ?auto_115282 ?auto_115281 ) ) ( not ( = ?auto_115279 ?auto_115282 ) ) ( not ( = ?auto_115279 ?auto_115284 ) ) ( not ( = ?auto_115279 ?auto_115280 ) ) ( not ( = ?auto_115279 ?auto_115286 ) ) ( not ( = ?auto_115283 ?auto_115282 ) ) ( not ( = ?auto_115283 ?auto_115284 ) ) ( not ( = ?auto_115283 ?auto_115280 ) ) ( not ( = ?auto_115283 ?auto_115286 ) ) ( not ( = ?auto_115285 ?auto_115282 ) ) ( not ( = ?auto_115285 ?auto_115284 ) ) ( not ( = ?auto_115285 ?auto_115280 ) ) ( not ( = ?auto_115285 ?auto_115286 ) ) ( ON ?auto_115281 ?auto_115285 ) ( CLEAR ?auto_115281 ) ( HOLDING ?auto_115282 ) ( CLEAR ?auto_115286 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115284 ?auto_115280 ?auto_115286 ?auto_115282 )
      ( MAKE-1PILE ?auto_115279 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115287 - BLOCK
    )
    :vars
    (
      ?auto_115290 - BLOCK
      ?auto_115291 - BLOCK
      ?auto_115292 - BLOCK
      ?auto_115294 - BLOCK
      ?auto_115293 - BLOCK
      ?auto_115289 - BLOCK
      ?auto_115288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115287 ?auto_115290 ) ( not ( = ?auto_115287 ?auto_115290 ) ) ( not ( = ?auto_115287 ?auto_115291 ) ) ( not ( = ?auto_115287 ?auto_115292 ) ) ( not ( = ?auto_115290 ?auto_115291 ) ) ( not ( = ?auto_115290 ?auto_115292 ) ) ( not ( = ?auto_115291 ?auto_115292 ) ) ( ON ?auto_115291 ?auto_115287 ) ( ON-TABLE ?auto_115290 ) ( ON-TABLE ?auto_115294 ) ( ON ?auto_115293 ?auto_115294 ) ( ON ?auto_115289 ?auto_115293 ) ( not ( = ?auto_115294 ?auto_115293 ) ) ( not ( = ?auto_115294 ?auto_115289 ) ) ( not ( = ?auto_115294 ?auto_115288 ) ) ( not ( = ?auto_115294 ?auto_115292 ) ) ( not ( = ?auto_115293 ?auto_115289 ) ) ( not ( = ?auto_115293 ?auto_115288 ) ) ( not ( = ?auto_115293 ?auto_115292 ) ) ( not ( = ?auto_115289 ?auto_115288 ) ) ( not ( = ?auto_115289 ?auto_115292 ) ) ( not ( = ?auto_115288 ?auto_115292 ) ) ( not ( = ?auto_115287 ?auto_115288 ) ) ( not ( = ?auto_115287 ?auto_115294 ) ) ( not ( = ?auto_115287 ?auto_115293 ) ) ( not ( = ?auto_115287 ?auto_115289 ) ) ( not ( = ?auto_115290 ?auto_115288 ) ) ( not ( = ?auto_115290 ?auto_115294 ) ) ( not ( = ?auto_115290 ?auto_115293 ) ) ( not ( = ?auto_115290 ?auto_115289 ) ) ( not ( = ?auto_115291 ?auto_115288 ) ) ( not ( = ?auto_115291 ?auto_115294 ) ) ( not ( = ?auto_115291 ?auto_115293 ) ) ( not ( = ?auto_115291 ?auto_115289 ) ) ( ON ?auto_115292 ?auto_115291 ) ( CLEAR ?auto_115289 ) ( ON ?auto_115288 ?auto_115292 ) ( CLEAR ?auto_115288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115290 ?auto_115287 ?auto_115291 ?auto_115292 )
      ( MAKE-1PILE ?auto_115287 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115295 - BLOCK
    )
    :vars
    (
      ?auto_115302 - BLOCK
      ?auto_115296 - BLOCK
      ?auto_115299 - BLOCK
      ?auto_115301 - BLOCK
      ?auto_115297 - BLOCK
      ?auto_115300 - BLOCK
      ?auto_115298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115295 ?auto_115302 ) ( not ( = ?auto_115295 ?auto_115302 ) ) ( not ( = ?auto_115295 ?auto_115296 ) ) ( not ( = ?auto_115295 ?auto_115299 ) ) ( not ( = ?auto_115302 ?auto_115296 ) ) ( not ( = ?auto_115302 ?auto_115299 ) ) ( not ( = ?auto_115296 ?auto_115299 ) ) ( ON ?auto_115296 ?auto_115295 ) ( ON-TABLE ?auto_115302 ) ( ON-TABLE ?auto_115301 ) ( ON ?auto_115297 ?auto_115301 ) ( not ( = ?auto_115301 ?auto_115297 ) ) ( not ( = ?auto_115301 ?auto_115300 ) ) ( not ( = ?auto_115301 ?auto_115298 ) ) ( not ( = ?auto_115301 ?auto_115299 ) ) ( not ( = ?auto_115297 ?auto_115300 ) ) ( not ( = ?auto_115297 ?auto_115298 ) ) ( not ( = ?auto_115297 ?auto_115299 ) ) ( not ( = ?auto_115300 ?auto_115298 ) ) ( not ( = ?auto_115300 ?auto_115299 ) ) ( not ( = ?auto_115298 ?auto_115299 ) ) ( not ( = ?auto_115295 ?auto_115298 ) ) ( not ( = ?auto_115295 ?auto_115301 ) ) ( not ( = ?auto_115295 ?auto_115297 ) ) ( not ( = ?auto_115295 ?auto_115300 ) ) ( not ( = ?auto_115302 ?auto_115298 ) ) ( not ( = ?auto_115302 ?auto_115301 ) ) ( not ( = ?auto_115302 ?auto_115297 ) ) ( not ( = ?auto_115302 ?auto_115300 ) ) ( not ( = ?auto_115296 ?auto_115298 ) ) ( not ( = ?auto_115296 ?auto_115301 ) ) ( not ( = ?auto_115296 ?auto_115297 ) ) ( not ( = ?auto_115296 ?auto_115300 ) ) ( ON ?auto_115299 ?auto_115296 ) ( ON ?auto_115298 ?auto_115299 ) ( CLEAR ?auto_115298 ) ( HOLDING ?auto_115300 ) ( CLEAR ?auto_115297 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115301 ?auto_115297 ?auto_115300 )
      ( MAKE-1PILE ?auto_115295 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115303 - BLOCK
    )
    :vars
    (
      ?auto_115307 - BLOCK
      ?auto_115308 - BLOCK
      ?auto_115304 - BLOCK
      ?auto_115306 - BLOCK
      ?auto_115310 - BLOCK
      ?auto_115309 - BLOCK
      ?auto_115305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115303 ?auto_115307 ) ( not ( = ?auto_115303 ?auto_115307 ) ) ( not ( = ?auto_115303 ?auto_115308 ) ) ( not ( = ?auto_115303 ?auto_115304 ) ) ( not ( = ?auto_115307 ?auto_115308 ) ) ( not ( = ?auto_115307 ?auto_115304 ) ) ( not ( = ?auto_115308 ?auto_115304 ) ) ( ON ?auto_115308 ?auto_115303 ) ( ON-TABLE ?auto_115307 ) ( ON-TABLE ?auto_115306 ) ( ON ?auto_115310 ?auto_115306 ) ( not ( = ?auto_115306 ?auto_115310 ) ) ( not ( = ?auto_115306 ?auto_115309 ) ) ( not ( = ?auto_115306 ?auto_115305 ) ) ( not ( = ?auto_115306 ?auto_115304 ) ) ( not ( = ?auto_115310 ?auto_115309 ) ) ( not ( = ?auto_115310 ?auto_115305 ) ) ( not ( = ?auto_115310 ?auto_115304 ) ) ( not ( = ?auto_115309 ?auto_115305 ) ) ( not ( = ?auto_115309 ?auto_115304 ) ) ( not ( = ?auto_115305 ?auto_115304 ) ) ( not ( = ?auto_115303 ?auto_115305 ) ) ( not ( = ?auto_115303 ?auto_115306 ) ) ( not ( = ?auto_115303 ?auto_115310 ) ) ( not ( = ?auto_115303 ?auto_115309 ) ) ( not ( = ?auto_115307 ?auto_115305 ) ) ( not ( = ?auto_115307 ?auto_115306 ) ) ( not ( = ?auto_115307 ?auto_115310 ) ) ( not ( = ?auto_115307 ?auto_115309 ) ) ( not ( = ?auto_115308 ?auto_115305 ) ) ( not ( = ?auto_115308 ?auto_115306 ) ) ( not ( = ?auto_115308 ?auto_115310 ) ) ( not ( = ?auto_115308 ?auto_115309 ) ) ( ON ?auto_115304 ?auto_115308 ) ( ON ?auto_115305 ?auto_115304 ) ( CLEAR ?auto_115310 ) ( ON ?auto_115309 ?auto_115305 ) ( CLEAR ?auto_115309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115307 ?auto_115303 ?auto_115308 ?auto_115304 ?auto_115305 )
      ( MAKE-1PILE ?auto_115303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115311 - BLOCK
    )
    :vars
    (
      ?auto_115316 - BLOCK
      ?auto_115315 - BLOCK
      ?auto_115318 - BLOCK
      ?auto_115312 - BLOCK
      ?auto_115313 - BLOCK
      ?auto_115314 - BLOCK
      ?auto_115317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115311 ?auto_115316 ) ( not ( = ?auto_115311 ?auto_115316 ) ) ( not ( = ?auto_115311 ?auto_115315 ) ) ( not ( = ?auto_115311 ?auto_115318 ) ) ( not ( = ?auto_115316 ?auto_115315 ) ) ( not ( = ?auto_115316 ?auto_115318 ) ) ( not ( = ?auto_115315 ?auto_115318 ) ) ( ON ?auto_115315 ?auto_115311 ) ( ON-TABLE ?auto_115316 ) ( ON-TABLE ?auto_115312 ) ( not ( = ?auto_115312 ?auto_115313 ) ) ( not ( = ?auto_115312 ?auto_115314 ) ) ( not ( = ?auto_115312 ?auto_115317 ) ) ( not ( = ?auto_115312 ?auto_115318 ) ) ( not ( = ?auto_115313 ?auto_115314 ) ) ( not ( = ?auto_115313 ?auto_115317 ) ) ( not ( = ?auto_115313 ?auto_115318 ) ) ( not ( = ?auto_115314 ?auto_115317 ) ) ( not ( = ?auto_115314 ?auto_115318 ) ) ( not ( = ?auto_115317 ?auto_115318 ) ) ( not ( = ?auto_115311 ?auto_115317 ) ) ( not ( = ?auto_115311 ?auto_115312 ) ) ( not ( = ?auto_115311 ?auto_115313 ) ) ( not ( = ?auto_115311 ?auto_115314 ) ) ( not ( = ?auto_115316 ?auto_115317 ) ) ( not ( = ?auto_115316 ?auto_115312 ) ) ( not ( = ?auto_115316 ?auto_115313 ) ) ( not ( = ?auto_115316 ?auto_115314 ) ) ( not ( = ?auto_115315 ?auto_115317 ) ) ( not ( = ?auto_115315 ?auto_115312 ) ) ( not ( = ?auto_115315 ?auto_115313 ) ) ( not ( = ?auto_115315 ?auto_115314 ) ) ( ON ?auto_115318 ?auto_115315 ) ( ON ?auto_115317 ?auto_115318 ) ( ON ?auto_115314 ?auto_115317 ) ( CLEAR ?auto_115314 ) ( HOLDING ?auto_115313 ) ( CLEAR ?auto_115312 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115312 ?auto_115313 )
      ( MAKE-1PILE ?auto_115311 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115319 - BLOCK
    )
    :vars
    (
      ?auto_115325 - BLOCK
      ?auto_115326 - BLOCK
      ?auto_115324 - BLOCK
      ?auto_115323 - BLOCK
      ?auto_115322 - BLOCK
      ?auto_115320 - BLOCK
      ?auto_115321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115319 ?auto_115325 ) ( not ( = ?auto_115319 ?auto_115325 ) ) ( not ( = ?auto_115319 ?auto_115326 ) ) ( not ( = ?auto_115319 ?auto_115324 ) ) ( not ( = ?auto_115325 ?auto_115326 ) ) ( not ( = ?auto_115325 ?auto_115324 ) ) ( not ( = ?auto_115326 ?auto_115324 ) ) ( ON ?auto_115326 ?auto_115319 ) ( ON-TABLE ?auto_115325 ) ( ON-TABLE ?auto_115323 ) ( not ( = ?auto_115323 ?auto_115322 ) ) ( not ( = ?auto_115323 ?auto_115320 ) ) ( not ( = ?auto_115323 ?auto_115321 ) ) ( not ( = ?auto_115323 ?auto_115324 ) ) ( not ( = ?auto_115322 ?auto_115320 ) ) ( not ( = ?auto_115322 ?auto_115321 ) ) ( not ( = ?auto_115322 ?auto_115324 ) ) ( not ( = ?auto_115320 ?auto_115321 ) ) ( not ( = ?auto_115320 ?auto_115324 ) ) ( not ( = ?auto_115321 ?auto_115324 ) ) ( not ( = ?auto_115319 ?auto_115321 ) ) ( not ( = ?auto_115319 ?auto_115323 ) ) ( not ( = ?auto_115319 ?auto_115322 ) ) ( not ( = ?auto_115319 ?auto_115320 ) ) ( not ( = ?auto_115325 ?auto_115321 ) ) ( not ( = ?auto_115325 ?auto_115323 ) ) ( not ( = ?auto_115325 ?auto_115322 ) ) ( not ( = ?auto_115325 ?auto_115320 ) ) ( not ( = ?auto_115326 ?auto_115321 ) ) ( not ( = ?auto_115326 ?auto_115323 ) ) ( not ( = ?auto_115326 ?auto_115322 ) ) ( not ( = ?auto_115326 ?auto_115320 ) ) ( ON ?auto_115324 ?auto_115326 ) ( ON ?auto_115321 ?auto_115324 ) ( ON ?auto_115320 ?auto_115321 ) ( CLEAR ?auto_115323 ) ( ON ?auto_115322 ?auto_115320 ) ( CLEAR ?auto_115322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115325 ?auto_115319 ?auto_115326 ?auto_115324 ?auto_115321 ?auto_115320 )
      ( MAKE-1PILE ?auto_115319 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115327 - BLOCK
    )
    :vars
    (
      ?auto_115328 - BLOCK
      ?auto_115334 - BLOCK
      ?auto_115329 - BLOCK
      ?auto_115330 - BLOCK
      ?auto_115331 - BLOCK
      ?auto_115332 - BLOCK
      ?auto_115333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115327 ?auto_115328 ) ( not ( = ?auto_115327 ?auto_115328 ) ) ( not ( = ?auto_115327 ?auto_115334 ) ) ( not ( = ?auto_115327 ?auto_115329 ) ) ( not ( = ?auto_115328 ?auto_115334 ) ) ( not ( = ?auto_115328 ?auto_115329 ) ) ( not ( = ?auto_115334 ?auto_115329 ) ) ( ON ?auto_115334 ?auto_115327 ) ( ON-TABLE ?auto_115328 ) ( not ( = ?auto_115330 ?auto_115331 ) ) ( not ( = ?auto_115330 ?auto_115332 ) ) ( not ( = ?auto_115330 ?auto_115333 ) ) ( not ( = ?auto_115330 ?auto_115329 ) ) ( not ( = ?auto_115331 ?auto_115332 ) ) ( not ( = ?auto_115331 ?auto_115333 ) ) ( not ( = ?auto_115331 ?auto_115329 ) ) ( not ( = ?auto_115332 ?auto_115333 ) ) ( not ( = ?auto_115332 ?auto_115329 ) ) ( not ( = ?auto_115333 ?auto_115329 ) ) ( not ( = ?auto_115327 ?auto_115333 ) ) ( not ( = ?auto_115327 ?auto_115330 ) ) ( not ( = ?auto_115327 ?auto_115331 ) ) ( not ( = ?auto_115327 ?auto_115332 ) ) ( not ( = ?auto_115328 ?auto_115333 ) ) ( not ( = ?auto_115328 ?auto_115330 ) ) ( not ( = ?auto_115328 ?auto_115331 ) ) ( not ( = ?auto_115328 ?auto_115332 ) ) ( not ( = ?auto_115334 ?auto_115333 ) ) ( not ( = ?auto_115334 ?auto_115330 ) ) ( not ( = ?auto_115334 ?auto_115331 ) ) ( not ( = ?auto_115334 ?auto_115332 ) ) ( ON ?auto_115329 ?auto_115334 ) ( ON ?auto_115333 ?auto_115329 ) ( ON ?auto_115332 ?auto_115333 ) ( ON ?auto_115331 ?auto_115332 ) ( CLEAR ?auto_115331 ) ( HOLDING ?auto_115330 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115330 )
      ( MAKE-1PILE ?auto_115327 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_115335 - BLOCK
    )
    :vars
    (
      ?auto_115339 - BLOCK
      ?auto_115338 - BLOCK
      ?auto_115337 - BLOCK
      ?auto_115340 - BLOCK
      ?auto_115341 - BLOCK
      ?auto_115336 - BLOCK
      ?auto_115342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115335 ?auto_115339 ) ( not ( = ?auto_115335 ?auto_115339 ) ) ( not ( = ?auto_115335 ?auto_115338 ) ) ( not ( = ?auto_115335 ?auto_115337 ) ) ( not ( = ?auto_115339 ?auto_115338 ) ) ( not ( = ?auto_115339 ?auto_115337 ) ) ( not ( = ?auto_115338 ?auto_115337 ) ) ( ON ?auto_115338 ?auto_115335 ) ( ON-TABLE ?auto_115339 ) ( not ( = ?auto_115340 ?auto_115341 ) ) ( not ( = ?auto_115340 ?auto_115336 ) ) ( not ( = ?auto_115340 ?auto_115342 ) ) ( not ( = ?auto_115340 ?auto_115337 ) ) ( not ( = ?auto_115341 ?auto_115336 ) ) ( not ( = ?auto_115341 ?auto_115342 ) ) ( not ( = ?auto_115341 ?auto_115337 ) ) ( not ( = ?auto_115336 ?auto_115342 ) ) ( not ( = ?auto_115336 ?auto_115337 ) ) ( not ( = ?auto_115342 ?auto_115337 ) ) ( not ( = ?auto_115335 ?auto_115342 ) ) ( not ( = ?auto_115335 ?auto_115340 ) ) ( not ( = ?auto_115335 ?auto_115341 ) ) ( not ( = ?auto_115335 ?auto_115336 ) ) ( not ( = ?auto_115339 ?auto_115342 ) ) ( not ( = ?auto_115339 ?auto_115340 ) ) ( not ( = ?auto_115339 ?auto_115341 ) ) ( not ( = ?auto_115339 ?auto_115336 ) ) ( not ( = ?auto_115338 ?auto_115342 ) ) ( not ( = ?auto_115338 ?auto_115340 ) ) ( not ( = ?auto_115338 ?auto_115341 ) ) ( not ( = ?auto_115338 ?auto_115336 ) ) ( ON ?auto_115337 ?auto_115338 ) ( ON ?auto_115342 ?auto_115337 ) ( ON ?auto_115336 ?auto_115342 ) ( ON ?auto_115341 ?auto_115336 ) ( ON ?auto_115340 ?auto_115341 ) ( CLEAR ?auto_115340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115339 ?auto_115335 ?auto_115338 ?auto_115337 ?auto_115342 ?auto_115336 ?auto_115341 )
      ( MAKE-1PILE ?auto_115335 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_115354 - BLOCK
      ?auto_115355 - BLOCK
      ?auto_115356 - BLOCK
      ?auto_115357 - BLOCK
      ?auto_115358 - BLOCK
    )
    :vars
    (
      ?auto_115359 - BLOCK
      ?auto_115360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115359 ?auto_115358 ) ( CLEAR ?auto_115359 ) ( ON-TABLE ?auto_115354 ) ( ON ?auto_115355 ?auto_115354 ) ( ON ?auto_115356 ?auto_115355 ) ( ON ?auto_115357 ?auto_115356 ) ( ON ?auto_115358 ?auto_115357 ) ( not ( = ?auto_115354 ?auto_115355 ) ) ( not ( = ?auto_115354 ?auto_115356 ) ) ( not ( = ?auto_115354 ?auto_115357 ) ) ( not ( = ?auto_115354 ?auto_115358 ) ) ( not ( = ?auto_115354 ?auto_115359 ) ) ( not ( = ?auto_115355 ?auto_115356 ) ) ( not ( = ?auto_115355 ?auto_115357 ) ) ( not ( = ?auto_115355 ?auto_115358 ) ) ( not ( = ?auto_115355 ?auto_115359 ) ) ( not ( = ?auto_115356 ?auto_115357 ) ) ( not ( = ?auto_115356 ?auto_115358 ) ) ( not ( = ?auto_115356 ?auto_115359 ) ) ( not ( = ?auto_115357 ?auto_115358 ) ) ( not ( = ?auto_115357 ?auto_115359 ) ) ( not ( = ?auto_115358 ?auto_115359 ) ) ( HOLDING ?auto_115360 ) ( not ( = ?auto_115354 ?auto_115360 ) ) ( not ( = ?auto_115355 ?auto_115360 ) ) ( not ( = ?auto_115356 ?auto_115360 ) ) ( not ( = ?auto_115357 ?auto_115360 ) ) ( not ( = ?auto_115358 ?auto_115360 ) ) ( not ( = ?auto_115359 ?auto_115360 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_115360 )
      ( MAKE-5PILE ?auto_115354 ?auto_115355 ?auto_115356 ?auto_115357 ?auto_115358 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115451 - BLOCK
      ?auto_115452 - BLOCK
    )
    :vars
    (
      ?auto_115453 - BLOCK
      ?auto_115456 - BLOCK
      ?auto_115454 - BLOCK
      ?auto_115457 - BLOCK
      ?auto_115455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115451 ?auto_115452 ) ) ( ON ?auto_115452 ?auto_115453 ) ( not ( = ?auto_115451 ?auto_115453 ) ) ( not ( = ?auto_115452 ?auto_115453 ) ) ( ON ?auto_115451 ?auto_115452 ) ( CLEAR ?auto_115451 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115456 ) ( ON ?auto_115454 ?auto_115456 ) ( ON ?auto_115457 ?auto_115454 ) ( ON ?auto_115455 ?auto_115457 ) ( ON ?auto_115453 ?auto_115455 ) ( not ( = ?auto_115456 ?auto_115454 ) ) ( not ( = ?auto_115456 ?auto_115457 ) ) ( not ( = ?auto_115456 ?auto_115455 ) ) ( not ( = ?auto_115456 ?auto_115453 ) ) ( not ( = ?auto_115456 ?auto_115452 ) ) ( not ( = ?auto_115456 ?auto_115451 ) ) ( not ( = ?auto_115454 ?auto_115457 ) ) ( not ( = ?auto_115454 ?auto_115455 ) ) ( not ( = ?auto_115454 ?auto_115453 ) ) ( not ( = ?auto_115454 ?auto_115452 ) ) ( not ( = ?auto_115454 ?auto_115451 ) ) ( not ( = ?auto_115457 ?auto_115455 ) ) ( not ( = ?auto_115457 ?auto_115453 ) ) ( not ( = ?auto_115457 ?auto_115452 ) ) ( not ( = ?auto_115457 ?auto_115451 ) ) ( not ( = ?auto_115455 ?auto_115453 ) ) ( not ( = ?auto_115455 ?auto_115452 ) ) ( not ( = ?auto_115455 ?auto_115451 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115456 ?auto_115454 ?auto_115457 ?auto_115455 ?auto_115453 ?auto_115452 )
      ( MAKE-2PILE ?auto_115451 ?auto_115452 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115460 - BLOCK
      ?auto_115461 - BLOCK
    )
    :vars
    (
      ?auto_115462 - BLOCK
      ?auto_115463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115460 ?auto_115461 ) ) ( ON ?auto_115461 ?auto_115462 ) ( CLEAR ?auto_115461 ) ( not ( = ?auto_115460 ?auto_115462 ) ) ( not ( = ?auto_115461 ?auto_115462 ) ) ( ON ?auto_115460 ?auto_115463 ) ( CLEAR ?auto_115460 ) ( HAND-EMPTY ) ( not ( = ?auto_115460 ?auto_115463 ) ) ( not ( = ?auto_115461 ?auto_115463 ) ) ( not ( = ?auto_115462 ?auto_115463 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115460 ?auto_115463 )
      ( MAKE-2PILE ?auto_115460 ?auto_115461 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115464 - BLOCK
      ?auto_115465 - BLOCK
    )
    :vars
    (
      ?auto_115467 - BLOCK
      ?auto_115466 - BLOCK
      ?auto_115471 - BLOCK
      ?auto_115470 - BLOCK
      ?auto_115468 - BLOCK
      ?auto_115469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115464 ?auto_115465 ) ) ( not ( = ?auto_115464 ?auto_115467 ) ) ( not ( = ?auto_115465 ?auto_115467 ) ) ( ON ?auto_115464 ?auto_115466 ) ( CLEAR ?auto_115464 ) ( not ( = ?auto_115464 ?auto_115466 ) ) ( not ( = ?auto_115465 ?auto_115466 ) ) ( not ( = ?auto_115467 ?auto_115466 ) ) ( HOLDING ?auto_115465 ) ( CLEAR ?auto_115467 ) ( ON-TABLE ?auto_115471 ) ( ON ?auto_115470 ?auto_115471 ) ( ON ?auto_115468 ?auto_115470 ) ( ON ?auto_115469 ?auto_115468 ) ( ON ?auto_115467 ?auto_115469 ) ( not ( = ?auto_115471 ?auto_115470 ) ) ( not ( = ?auto_115471 ?auto_115468 ) ) ( not ( = ?auto_115471 ?auto_115469 ) ) ( not ( = ?auto_115471 ?auto_115467 ) ) ( not ( = ?auto_115471 ?auto_115465 ) ) ( not ( = ?auto_115470 ?auto_115468 ) ) ( not ( = ?auto_115470 ?auto_115469 ) ) ( not ( = ?auto_115470 ?auto_115467 ) ) ( not ( = ?auto_115470 ?auto_115465 ) ) ( not ( = ?auto_115468 ?auto_115469 ) ) ( not ( = ?auto_115468 ?auto_115467 ) ) ( not ( = ?auto_115468 ?auto_115465 ) ) ( not ( = ?auto_115469 ?auto_115467 ) ) ( not ( = ?auto_115469 ?auto_115465 ) ) ( not ( = ?auto_115464 ?auto_115471 ) ) ( not ( = ?auto_115464 ?auto_115470 ) ) ( not ( = ?auto_115464 ?auto_115468 ) ) ( not ( = ?auto_115464 ?auto_115469 ) ) ( not ( = ?auto_115466 ?auto_115471 ) ) ( not ( = ?auto_115466 ?auto_115470 ) ) ( not ( = ?auto_115466 ?auto_115468 ) ) ( not ( = ?auto_115466 ?auto_115469 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115471 ?auto_115470 ?auto_115468 ?auto_115469 ?auto_115467 ?auto_115465 )
      ( MAKE-2PILE ?auto_115464 ?auto_115465 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115472 - BLOCK
      ?auto_115473 - BLOCK
    )
    :vars
    (
      ?auto_115477 - BLOCK
      ?auto_115479 - BLOCK
      ?auto_115474 - BLOCK
      ?auto_115475 - BLOCK
      ?auto_115478 - BLOCK
      ?auto_115476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115472 ?auto_115473 ) ) ( not ( = ?auto_115472 ?auto_115477 ) ) ( not ( = ?auto_115473 ?auto_115477 ) ) ( ON ?auto_115472 ?auto_115479 ) ( not ( = ?auto_115472 ?auto_115479 ) ) ( not ( = ?auto_115473 ?auto_115479 ) ) ( not ( = ?auto_115477 ?auto_115479 ) ) ( CLEAR ?auto_115477 ) ( ON-TABLE ?auto_115474 ) ( ON ?auto_115475 ?auto_115474 ) ( ON ?auto_115478 ?auto_115475 ) ( ON ?auto_115476 ?auto_115478 ) ( ON ?auto_115477 ?auto_115476 ) ( not ( = ?auto_115474 ?auto_115475 ) ) ( not ( = ?auto_115474 ?auto_115478 ) ) ( not ( = ?auto_115474 ?auto_115476 ) ) ( not ( = ?auto_115474 ?auto_115477 ) ) ( not ( = ?auto_115474 ?auto_115473 ) ) ( not ( = ?auto_115475 ?auto_115478 ) ) ( not ( = ?auto_115475 ?auto_115476 ) ) ( not ( = ?auto_115475 ?auto_115477 ) ) ( not ( = ?auto_115475 ?auto_115473 ) ) ( not ( = ?auto_115478 ?auto_115476 ) ) ( not ( = ?auto_115478 ?auto_115477 ) ) ( not ( = ?auto_115478 ?auto_115473 ) ) ( not ( = ?auto_115476 ?auto_115477 ) ) ( not ( = ?auto_115476 ?auto_115473 ) ) ( not ( = ?auto_115472 ?auto_115474 ) ) ( not ( = ?auto_115472 ?auto_115475 ) ) ( not ( = ?auto_115472 ?auto_115478 ) ) ( not ( = ?auto_115472 ?auto_115476 ) ) ( not ( = ?auto_115479 ?auto_115474 ) ) ( not ( = ?auto_115479 ?auto_115475 ) ) ( not ( = ?auto_115479 ?auto_115478 ) ) ( not ( = ?auto_115479 ?auto_115476 ) ) ( ON ?auto_115473 ?auto_115472 ) ( CLEAR ?auto_115473 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115479 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115479 ?auto_115472 )
      ( MAKE-2PILE ?auto_115472 ?auto_115473 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115480 - BLOCK
      ?auto_115481 - BLOCK
    )
    :vars
    (
      ?auto_115484 - BLOCK
      ?auto_115486 - BLOCK
      ?auto_115482 - BLOCK
      ?auto_115485 - BLOCK
      ?auto_115483 - BLOCK
      ?auto_115487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115480 ?auto_115481 ) ) ( not ( = ?auto_115480 ?auto_115484 ) ) ( not ( = ?auto_115481 ?auto_115484 ) ) ( ON ?auto_115480 ?auto_115486 ) ( not ( = ?auto_115480 ?auto_115486 ) ) ( not ( = ?auto_115481 ?auto_115486 ) ) ( not ( = ?auto_115484 ?auto_115486 ) ) ( ON-TABLE ?auto_115482 ) ( ON ?auto_115485 ?auto_115482 ) ( ON ?auto_115483 ?auto_115485 ) ( ON ?auto_115487 ?auto_115483 ) ( not ( = ?auto_115482 ?auto_115485 ) ) ( not ( = ?auto_115482 ?auto_115483 ) ) ( not ( = ?auto_115482 ?auto_115487 ) ) ( not ( = ?auto_115482 ?auto_115484 ) ) ( not ( = ?auto_115482 ?auto_115481 ) ) ( not ( = ?auto_115485 ?auto_115483 ) ) ( not ( = ?auto_115485 ?auto_115487 ) ) ( not ( = ?auto_115485 ?auto_115484 ) ) ( not ( = ?auto_115485 ?auto_115481 ) ) ( not ( = ?auto_115483 ?auto_115487 ) ) ( not ( = ?auto_115483 ?auto_115484 ) ) ( not ( = ?auto_115483 ?auto_115481 ) ) ( not ( = ?auto_115487 ?auto_115484 ) ) ( not ( = ?auto_115487 ?auto_115481 ) ) ( not ( = ?auto_115480 ?auto_115482 ) ) ( not ( = ?auto_115480 ?auto_115485 ) ) ( not ( = ?auto_115480 ?auto_115483 ) ) ( not ( = ?auto_115480 ?auto_115487 ) ) ( not ( = ?auto_115486 ?auto_115482 ) ) ( not ( = ?auto_115486 ?auto_115485 ) ) ( not ( = ?auto_115486 ?auto_115483 ) ) ( not ( = ?auto_115486 ?auto_115487 ) ) ( ON ?auto_115481 ?auto_115480 ) ( CLEAR ?auto_115481 ) ( ON-TABLE ?auto_115486 ) ( HOLDING ?auto_115484 ) ( CLEAR ?auto_115487 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115482 ?auto_115485 ?auto_115483 ?auto_115487 ?auto_115484 )
      ( MAKE-2PILE ?auto_115480 ?auto_115481 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115488 - BLOCK
      ?auto_115489 - BLOCK
    )
    :vars
    (
      ?auto_115491 - BLOCK
      ?auto_115495 - BLOCK
      ?auto_115492 - BLOCK
      ?auto_115490 - BLOCK
      ?auto_115493 - BLOCK
      ?auto_115494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115488 ?auto_115489 ) ) ( not ( = ?auto_115488 ?auto_115491 ) ) ( not ( = ?auto_115489 ?auto_115491 ) ) ( ON ?auto_115488 ?auto_115495 ) ( not ( = ?auto_115488 ?auto_115495 ) ) ( not ( = ?auto_115489 ?auto_115495 ) ) ( not ( = ?auto_115491 ?auto_115495 ) ) ( ON-TABLE ?auto_115492 ) ( ON ?auto_115490 ?auto_115492 ) ( ON ?auto_115493 ?auto_115490 ) ( ON ?auto_115494 ?auto_115493 ) ( not ( = ?auto_115492 ?auto_115490 ) ) ( not ( = ?auto_115492 ?auto_115493 ) ) ( not ( = ?auto_115492 ?auto_115494 ) ) ( not ( = ?auto_115492 ?auto_115491 ) ) ( not ( = ?auto_115492 ?auto_115489 ) ) ( not ( = ?auto_115490 ?auto_115493 ) ) ( not ( = ?auto_115490 ?auto_115494 ) ) ( not ( = ?auto_115490 ?auto_115491 ) ) ( not ( = ?auto_115490 ?auto_115489 ) ) ( not ( = ?auto_115493 ?auto_115494 ) ) ( not ( = ?auto_115493 ?auto_115491 ) ) ( not ( = ?auto_115493 ?auto_115489 ) ) ( not ( = ?auto_115494 ?auto_115491 ) ) ( not ( = ?auto_115494 ?auto_115489 ) ) ( not ( = ?auto_115488 ?auto_115492 ) ) ( not ( = ?auto_115488 ?auto_115490 ) ) ( not ( = ?auto_115488 ?auto_115493 ) ) ( not ( = ?auto_115488 ?auto_115494 ) ) ( not ( = ?auto_115495 ?auto_115492 ) ) ( not ( = ?auto_115495 ?auto_115490 ) ) ( not ( = ?auto_115495 ?auto_115493 ) ) ( not ( = ?auto_115495 ?auto_115494 ) ) ( ON ?auto_115489 ?auto_115488 ) ( ON-TABLE ?auto_115495 ) ( CLEAR ?auto_115494 ) ( ON ?auto_115491 ?auto_115489 ) ( CLEAR ?auto_115491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115495 ?auto_115488 ?auto_115489 )
      ( MAKE-2PILE ?auto_115488 ?auto_115489 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115496 - BLOCK
      ?auto_115497 - BLOCK
    )
    :vars
    (
      ?auto_115503 - BLOCK
      ?auto_115501 - BLOCK
      ?auto_115499 - BLOCK
      ?auto_115498 - BLOCK
      ?auto_115500 - BLOCK
      ?auto_115502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115496 ?auto_115497 ) ) ( not ( = ?auto_115496 ?auto_115503 ) ) ( not ( = ?auto_115497 ?auto_115503 ) ) ( ON ?auto_115496 ?auto_115501 ) ( not ( = ?auto_115496 ?auto_115501 ) ) ( not ( = ?auto_115497 ?auto_115501 ) ) ( not ( = ?auto_115503 ?auto_115501 ) ) ( ON-TABLE ?auto_115499 ) ( ON ?auto_115498 ?auto_115499 ) ( ON ?auto_115500 ?auto_115498 ) ( not ( = ?auto_115499 ?auto_115498 ) ) ( not ( = ?auto_115499 ?auto_115500 ) ) ( not ( = ?auto_115499 ?auto_115502 ) ) ( not ( = ?auto_115499 ?auto_115503 ) ) ( not ( = ?auto_115499 ?auto_115497 ) ) ( not ( = ?auto_115498 ?auto_115500 ) ) ( not ( = ?auto_115498 ?auto_115502 ) ) ( not ( = ?auto_115498 ?auto_115503 ) ) ( not ( = ?auto_115498 ?auto_115497 ) ) ( not ( = ?auto_115500 ?auto_115502 ) ) ( not ( = ?auto_115500 ?auto_115503 ) ) ( not ( = ?auto_115500 ?auto_115497 ) ) ( not ( = ?auto_115502 ?auto_115503 ) ) ( not ( = ?auto_115502 ?auto_115497 ) ) ( not ( = ?auto_115496 ?auto_115499 ) ) ( not ( = ?auto_115496 ?auto_115498 ) ) ( not ( = ?auto_115496 ?auto_115500 ) ) ( not ( = ?auto_115496 ?auto_115502 ) ) ( not ( = ?auto_115501 ?auto_115499 ) ) ( not ( = ?auto_115501 ?auto_115498 ) ) ( not ( = ?auto_115501 ?auto_115500 ) ) ( not ( = ?auto_115501 ?auto_115502 ) ) ( ON ?auto_115497 ?auto_115496 ) ( ON-TABLE ?auto_115501 ) ( ON ?auto_115503 ?auto_115497 ) ( CLEAR ?auto_115503 ) ( HOLDING ?auto_115502 ) ( CLEAR ?auto_115500 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115499 ?auto_115498 ?auto_115500 ?auto_115502 )
      ( MAKE-2PILE ?auto_115496 ?auto_115497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115504 - BLOCK
      ?auto_115505 - BLOCK
    )
    :vars
    (
      ?auto_115509 - BLOCK
      ?auto_115511 - BLOCK
      ?auto_115507 - BLOCK
      ?auto_115508 - BLOCK
      ?auto_115510 - BLOCK
      ?auto_115506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115504 ?auto_115505 ) ) ( not ( = ?auto_115504 ?auto_115509 ) ) ( not ( = ?auto_115505 ?auto_115509 ) ) ( ON ?auto_115504 ?auto_115511 ) ( not ( = ?auto_115504 ?auto_115511 ) ) ( not ( = ?auto_115505 ?auto_115511 ) ) ( not ( = ?auto_115509 ?auto_115511 ) ) ( ON-TABLE ?auto_115507 ) ( ON ?auto_115508 ?auto_115507 ) ( ON ?auto_115510 ?auto_115508 ) ( not ( = ?auto_115507 ?auto_115508 ) ) ( not ( = ?auto_115507 ?auto_115510 ) ) ( not ( = ?auto_115507 ?auto_115506 ) ) ( not ( = ?auto_115507 ?auto_115509 ) ) ( not ( = ?auto_115507 ?auto_115505 ) ) ( not ( = ?auto_115508 ?auto_115510 ) ) ( not ( = ?auto_115508 ?auto_115506 ) ) ( not ( = ?auto_115508 ?auto_115509 ) ) ( not ( = ?auto_115508 ?auto_115505 ) ) ( not ( = ?auto_115510 ?auto_115506 ) ) ( not ( = ?auto_115510 ?auto_115509 ) ) ( not ( = ?auto_115510 ?auto_115505 ) ) ( not ( = ?auto_115506 ?auto_115509 ) ) ( not ( = ?auto_115506 ?auto_115505 ) ) ( not ( = ?auto_115504 ?auto_115507 ) ) ( not ( = ?auto_115504 ?auto_115508 ) ) ( not ( = ?auto_115504 ?auto_115510 ) ) ( not ( = ?auto_115504 ?auto_115506 ) ) ( not ( = ?auto_115511 ?auto_115507 ) ) ( not ( = ?auto_115511 ?auto_115508 ) ) ( not ( = ?auto_115511 ?auto_115510 ) ) ( not ( = ?auto_115511 ?auto_115506 ) ) ( ON ?auto_115505 ?auto_115504 ) ( ON-TABLE ?auto_115511 ) ( ON ?auto_115509 ?auto_115505 ) ( CLEAR ?auto_115510 ) ( ON ?auto_115506 ?auto_115509 ) ( CLEAR ?auto_115506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115511 ?auto_115504 ?auto_115505 ?auto_115509 )
      ( MAKE-2PILE ?auto_115504 ?auto_115505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115512 - BLOCK
      ?auto_115513 - BLOCK
    )
    :vars
    (
      ?auto_115518 - BLOCK
      ?auto_115517 - BLOCK
      ?auto_115519 - BLOCK
      ?auto_115515 - BLOCK
      ?auto_115514 - BLOCK
      ?auto_115516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115512 ?auto_115513 ) ) ( not ( = ?auto_115512 ?auto_115518 ) ) ( not ( = ?auto_115513 ?auto_115518 ) ) ( ON ?auto_115512 ?auto_115517 ) ( not ( = ?auto_115512 ?auto_115517 ) ) ( not ( = ?auto_115513 ?auto_115517 ) ) ( not ( = ?auto_115518 ?auto_115517 ) ) ( ON-TABLE ?auto_115519 ) ( ON ?auto_115515 ?auto_115519 ) ( not ( = ?auto_115519 ?auto_115515 ) ) ( not ( = ?auto_115519 ?auto_115514 ) ) ( not ( = ?auto_115519 ?auto_115516 ) ) ( not ( = ?auto_115519 ?auto_115518 ) ) ( not ( = ?auto_115519 ?auto_115513 ) ) ( not ( = ?auto_115515 ?auto_115514 ) ) ( not ( = ?auto_115515 ?auto_115516 ) ) ( not ( = ?auto_115515 ?auto_115518 ) ) ( not ( = ?auto_115515 ?auto_115513 ) ) ( not ( = ?auto_115514 ?auto_115516 ) ) ( not ( = ?auto_115514 ?auto_115518 ) ) ( not ( = ?auto_115514 ?auto_115513 ) ) ( not ( = ?auto_115516 ?auto_115518 ) ) ( not ( = ?auto_115516 ?auto_115513 ) ) ( not ( = ?auto_115512 ?auto_115519 ) ) ( not ( = ?auto_115512 ?auto_115515 ) ) ( not ( = ?auto_115512 ?auto_115514 ) ) ( not ( = ?auto_115512 ?auto_115516 ) ) ( not ( = ?auto_115517 ?auto_115519 ) ) ( not ( = ?auto_115517 ?auto_115515 ) ) ( not ( = ?auto_115517 ?auto_115514 ) ) ( not ( = ?auto_115517 ?auto_115516 ) ) ( ON ?auto_115513 ?auto_115512 ) ( ON-TABLE ?auto_115517 ) ( ON ?auto_115518 ?auto_115513 ) ( ON ?auto_115516 ?auto_115518 ) ( CLEAR ?auto_115516 ) ( HOLDING ?auto_115514 ) ( CLEAR ?auto_115515 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115519 ?auto_115515 ?auto_115514 )
      ( MAKE-2PILE ?auto_115512 ?auto_115513 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115520 - BLOCK
      ?auto_115521 - BLOCK
    )
    :vars
    (
      ?auto_115524 - BLOCK
      ?auto_115527 - BLOCK
      ?auto_115525 - BLOCK
      ?auto_115526 - BLOCK
      ?auto_115522 - BLOCK
      ?auto_115523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115520 ?auto_115521 ) ) ( not ( = ?auto_115520 ?auto_115524 ) ) ( not ( = ?auto_115521 ?auto_115524 ) ) ( ON ?auto_115520 ?auto_115527 ) ( not ( = ?auto_115520 ?auto_115527 ) ) ( not ( = ?auto_115521 ?auto_115527 ) ) ( not ( = ?auto_115524 ?auto_115527 ) ) ( ON-TABLE ?auto_115525 ) ( ON ?auto_115526 ?auto_115525 ) ( not ( = ?auto_115525 ?auto_115526 ) ) ( not ( = ?auto_115525 ?auto_115522 ) ) ( not ( = ?auto_115525 ?auto_115523 ) ) ( not ( = ?auto_115525 ?auto_115524 ) ) ( not ( = ?auto_115525 ?auto_115521 ) ) ( not ( = ?auto_115526 ?auto_115522 ) ) ( not ( = ?auto_115526 ?auto_115523 ) ) ( not ( = ?auto_115526 ?auto_115524 ) ) ( not ( = ?auto_115526 ?auto_115521 ) ) ( not ( = ?auto_115522 ?auto_115523 ) ) ( not ( = ?auto_115522 ?auto_115524 ) ) ( not ( = ?auto_115522 ?auto_115521 ) ) ( not ( = ?auto_115523 ?auto_115524 ) ) ( not ( = ?auto_115523 ?auto_115521 ) ) ( not ( = ?auto_115520 ?auto_115525 ) ) ( not ( = ?auto_115520 ?auto_115526 ) ) ( not ( = ?auto_115520 ?auto_115522 ) ) ( not ( = ?auto_115520 ?auto_115523 ) ) ( not ( = ?auto_115527 ?auto_115525 ) ) ( not ( = ?auto_115527 ?auto_115526 ) ) ( not ( = ?auto_115527 ?auto_115522 ) ) ( not ( = ?auto_115527 ?auto_115523 ) ) ( ON ?auto_115521 ?auto_115520 ) ( ON-TABLE ?auto_115527 ) ( ON ?auto_115524 ?auto_115521 ) ( ON ?auto_115523 ?auto_115524 ) ( CLEAR ?auto_115526 ) ( ON ?auto_115522 ?auto_115523 ) ( CLEAR ?auto_115522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115527 ?auto_115520 ?auto_115521 ?auto_115524 ?auto_115523 )
      ( MAKE-2PILE ?auto_115520 ?auto_115521 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115528 - BLOCK
      ?auto_115529 - BLOCK
    )
    :vars
    (
      ?auto_115531 - BLOCK
      ?auto_115534 - BLOCK
      ?auto_115533 - BLOCK
      ?auto_115532 - BLOCK
      ?auto_115535 - BLOCK
      ?auto_115530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115528 ?auto_115529 ) ) ( not ( = ?auto_115528 ?auto_115531 ) ) ( not ( = ?auto_115529 ?auto_115531 ) ) ( ON ?auto_115528 ?auto_115534 ) ( not ( = ?auto_115528 ?auto_115534 ) ) ( not ( = ?auto_115529 ?auto_115534 ) ) ( not ( = ?auto_115531 ?auto_115534 ) ) ( ON-TABLE ?auto_115533 ) ( not ( = ?auto_115533 ?auto_115532 ) ) ( not ( = ?auto_115533 ?auto_115535 ) ) ( not ( = ?auto_115533 ?auto_115530 ) ) ( not ( = ?auto_115533 ?auto_115531 ) ) ( not ( = ?auto_115533 ?auto_115529 ) ) ( not ( = ?auto_115532 ?auto_115535 ) ) ( not ( = ?auto_115532 ?auto_115530 ) ) ( not ( = ?auto_115532 ?auto_115531 ) ) ( not ( = ?auto_115532 ?auto_115529 ) ) ( not ( = ?auto_115535 ?auto_115530 ) ) ( not ( = ?auto_115535 ?auto_115531 ) ) ( not ( = ?auto_115535 ?auto_115529 ) ) ( not ( = ?auto_115530 ?auto_115531 ) ) ( not ( = ?auto_115530 ?auto_115529 ) ) ( not ( = ?auto_115528 ?auto_115533 ) ) ( not ( = ?auto_115528 ?auto_115532 ) ) ( not ( = ?auto_115528 ?auto_115535 ) ) ( not ( = ?auto_115528 ?auto_115530 ) ) ( not ( = ?auto_115534 ?auto_115533 ) ) ( not ( = ?auto_115534 ?auto_115532 ) ) ( not ( = ?auto_115534 ?auto_115535 ) ) ( not ( = ?auto_115534 ?auto_115530 ) ) ( ON ?auto_115529 ?auto_115528 ) ( ON-TABLE ?auto_115534 ) ( ON ?auto_115531 ?auto_115529 ) ( ON ?auto_115530 ?auto_115531 ) ( ON ?auto_115535 ?auto_115530 ) ( CLEAR ?auto_115535 ) ( HOLDING ?auto_115532 ) ( CLEAR ?auto_115533 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115533 ?auto_115532 )
      ( MAKE-2PILE ?auto_115528 ?auto_115529 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115536 - BLOCK
      ?auto_115537 - BLOCK
    )
    :vars
    (
      ?auto_115542 - BLOCK
      ?auto_115543 - BLOCK
      ?auto_115539 - BLOCK
      ?auto_115538 - BLOCK
      ?auto_115540 - BLOCK
      ?auto_115541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115536 ?auto_115537 ) ) ( not ( = ?auto_115536 ?auto_115542 ) ) ( not ( = ?auto_115537 ?auto_115542 ) ) ( ON ?auto_115536 ?auto_115543 ) ( not ( = ?auto_115536 ?auto_115543 ) ) ( not ( = ?auto_115537 ?auto_115543 ) ) ( not ( = ?auto_115542 ?auto_115543 ) ) ( ON-TABLE ?auto_115539 ) ( not ( = ?auto_115539 ?auto_115538 ) ) ( not ( = ?auto_115539 ?auto_115540 ) ) ( not ( = ?auto_115539 ?auto_115541 ) ) ( not ( = ?auto_115539 ?auto_115542 ) ) ( not ( = ?auto_115539 ?auto_115537 ) ) ( not ( = ?auto_115538 ?auto_115540 ) ) ( not ( = ?auto_115538 ?auto_115541 ) ) ( not ( = ?auto_115538 ?auto_115542 ) ) ( not ( = ?auto_115538 ?auto_115537 ) ) ( not ( = ?auto_115540 ?auto_115541 ) ) ( not ( = ?auto_115540 ?auto_115542 ) ) ( not ( = ?auto_115540 ?auto_115537 ) ) ( not ( = ?auto_115541 ?auto_115542 ) ) ( not ( = ?auto_115541 ?auto_115537 ) ) ( not ( = ?auto_115536 ?auto_115539 ) ) ( not ( = ?auto_115536 ?auto_115538 ) ) ( not ( = ?auto_115536 ?auto_115540 ) ) ( not ( = ?auto_115536 ?auto_115541 ) ) ( not ( = ?auto_115543 ?auto_115539 ) ) ( not ( = ?auto_115543 ?auto_115538 ) ) ( not ( = ?auto_115543 ?auto_115540 ) ) ( not ( = ?auto_115543 ?auto_115541 ) ) ( ON ?auto_115537 ?auto_115536 ) ( ON-TABLE ?auto_115543 ) ( ON ?auto_115542 ?auto_115537 ) ( ON ?auto_115541 ?auto_115542 ) ( ON ?auto_115540 ?auto_115541 ) ( CLEAR ?auto_115539 ) ( ON ?auto_115538 ?auto_115540 ) ( CLEAR ?auto_115538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115543 ?auto_115536 ?auto_115537 ?auto_115542 ?auto_115541 ?auto_115540 )
      ( MAKE-2PILE ?auto_115536 ?auto_115537 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115544 - BLOCK
      ?auto_115545 - BLOCK
    )
    :vars
    (
      ?auto_115546 - BLOCK
      ?auto_115551 - BLOCK
      ?auto_115549 - BLOCK
      ?auto_115547 - BLOCK
      ?auto_115548 - BLOCK
      ?auto_115550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115544 ?auto_115545 ) ) ( not ( = ?auto_115544 ?auto_115546 ) ) ( not ( = ?auto_115545 ?auto_115546 ) ) ( ON ?auto_115544 ?auto_115551 ) ( not ( = ?auto_115544 ?auto_115551 ) ) ( not ( = ?auto_115545 ?auto_115551 ) ) ( not ( = ?auto_115546 ?auto_115551 ) ) ( not ( = ?auto_115549 ?auto_115547 ) ) ( not ( = ?auto_115549 ?auto_115548 ) ) ( not ( = ?auto_115549 ?auto_115550 ) ) ( not ( = ?auto_115549 ?auto_115546 ) ) ( not ( = ?auto_115549 ?auto_115545 ) ) ( not ( = ?auto_115547 ?auto_115548 ) ) ( not ( = ?auto_115547 ?auto_115550 ) ) ( not ( = ?auto_115547 ?auto_115546 ) ) ( not ( = ?auto_115547 ?auto_115545 ) ) ( not ( = ?auto_115548 ?auto_115550 ) ) ( not ( = ?auto_115548 ?auto_115546 ) ) ( not ( = ?auto_115548 ?auto_115545 ) ) ( not ( = ?auto_115550 ?auto_115546 ) ) ( not ( = ?auto_115550 ?auto_115545 ) ) ( not ( = ?auto_115544 ?auto_115549 ) ) ( not ( = ?auto_115544 ?auto_115547 ) ) ( not ( = ?auto_115544 ?auto_115548 ) ) ( not ( = ?auto_115544 ?auto_115550 ) ) ( not ( = ?auto_115551 ?auto_115549 ) ) ( not ( = ?auto_115551 ?auto_115547 ) ) ( not ( = ?auto_115551 ?auto_115548 ) ) ( not ( = ?auto_115551 ?auto_115550 ) ) ( ON ?auto_115545 ?auto_115544 ) ( ON-TABLE ?auto_115551 ) ( ON ?auto_115546 ?auto_115545 ) ( ON ?auto_115550 ?auto_115546 ) ( ON ?auto_115548 ?auto_115550 ) ( ON ?auto_115547 ?auto_115548 ) ( CLEAR ?auto_115547 ) ( HOLDING ?auto_115549 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115549 )
      ( MAKE-2PILE ?auto_115544 ?auto_115545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_115552 - BLOCK
      ?auto_115553 - BLOCK
    )
    :vars
    (
      ?auto_115558 - BLOCK
      ?auto_115559 - BLOCK
      ?auto_115557 - BLOCK
      ?auto_115555 - BLOCK
      ?auto_115556 - BLOCK
      ?auto_115554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115552 ?auto_115553 ) ) ( not ( = ?auto_115552 ?auto_115558 ) ) ( not ( = ?auto_115553 ?auto_115558 ) ) ( ON ?auto_115552 ?auto_115559 ) ( not ( = ?auto_115552 ?auto_115559 ) ) ( not ( = ?auto_115553 ?auto_115559 ) ) ( not ( = ?auto_115558 ?auto_115559 ) ) ( not ( = ?auto_115557 ?auto_115555 ) ) ( not ( = ?auto_115557 ?auto_115556 ) ) ( not ( = ?auto_115557 ?auto_115554 ) ) ( not ( = ?auto_115557 ?auto_115558 ) ) ( not ( = ?auto_115557 ?auto_115553 ) ) ( not ( = ?auto_115555 ?auto_115556 ) ) ( not ( = ?auto_115555 ?auto_115554 ) ) ( not ( = ?auto_115555 ?auto_115558 ) ) ( not ( = ?auto_115555 ?auto_115553 ) ) ( not ( = ?auto_115556 ?auto_115554 ) ) ( not ( = ?auto_115556 ?auto_115558 ) ) ( not ( = ?auto_115556 ?auto_115553 ) ) ( not ( = ?auto_115554 ?auto_115558 ) ) ( not ( = ?auto_115554 ?auto_115553 ) ) ( not ( = ?auto_115552 ?auto_115557 ) ) ( not ( = ?auto_115552 ?auto_115555 ) ) ( not ( = ?auto_115552 ?auto_115556 ) ) ( not ( = ?auto_115552 ?auto_115554 ) ) ( not ( = ?auto_115559 ?auto_115557 ) ) ( not ( = ?auto_115559 ?auto_115555 ) ) ( not ( = ?auto_115559 ?auto_115556 ) ) ( not ( = ?auto_115559 ?auto_115554 ) ) ( ON ?auto_115553 ?auto_115552 ) ( ON-TABLE ?auto_115559 ) ( ON ?auto_115558 ?auto_115553 ) ( ON ?auto_115554 ?auto_115558 ) ( ON ?auto_115556 ?auto_115554 ) ( ON ?auto_115555 ?auto_115556 ) ( ON ?auto_115557 ?auto_115555 ) ( CLEAR ?auto_115557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115559 ?auto_115552 ?auto_115553 ?auto_115558 ?auto_115554 ?auto_115556 ?auto_115555 )
      ( MAKE-2PILE ?auto_115552 ?auto_115553 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115583 - BLOCK
      ?auto_115584 - BLOCK
      ?auto_115585 - BLOCK
      ?auto_115586 - BLOCK
    )
    :vars
    (
      ?auto_115589 - BLOCK
      ?auto_115587 - BLOCK
      ?auto_115588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115589 ?auto_115586 ) ( ON-TABLE ?auto_115583 ) ( ON ?auto_115584 ?auto_115583 ) ( ON ?auto_115585 ?auto_115584 ) ( ON ?auto_115586 ?auto_115585 ) ( not ( = ?auto_115583 ?auto_115584 ) ) ( not ( = ?auto_115583 ?auto_115585 ) ) ( not ( = ?auto_115583 ?auto_115586 ) ) ( not ( = ?auto_115583 ?auto_115589 ) ) ( not ( = ?auto_115584 ?auto_115585 ) ) ( not ( = ?auto_115584 ?auto_115586 ) ) ( not ( = ?auto_115584 ?auto_115589 ) ) ( not ( = ?auto_115585 ?auto_115586 ) ) ( not ( = ?auto_115585 ?auto_115589 ) ) ( not ( = ?auto_115586 ?auto_115589 ) ) ( not ( = ?auto_115583 ?auto_115587 ) ) ( not ( = ?auto_115583 ?auto_115588 ) ) ( not ( = ?auto_115584 ?auto_115587 ) ) ( not ( = ?auto_115584 ?auto_115588 ) ) ( not ( = ?auto_115585 ?auto_115587 ) ) ( not ( = ?auto_115585 ?auto_115588 ) ) ( not ( = ?auto_115586 ?auto_115587 ) ) ( not ( = ?auto_115586 ?auto_115588 ) ) ( not ( = ?auto_115589 ?auto_115587 ) ) ( not ( = ?auto_115589 ?auto_115588 ) ) ( not ( = ?auto_115587 ?auto_115588 ) ) ( ON ?auto_115587 ?auto_115589 ) ( CLEAR ?auto_115587 ) ( HOLDING ?auto_115588 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115588 )
      ( MAKE-4PILE ?auto_115583 ?auto_115584 ?auto_115585 ?auto_115586 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115670 - BLOCK
      ?auto_115671 - BLOCK
      ?auto_115672 - BLOCK
    )
    :vars
    (
      ?auto_115673 - BLOCK
      ?auto_115675 - BLOCK
      ?auto_115674 - BLOCK
      ?auto_115676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115670 ) ( not ( = ?auto_115670 ?auto_115671 ) ) ( not ( = ?auto_115670 ?auto_115672 ) ) ( not ( = ?auto_115671 ?auto_115672 ) ) ( ON ?auto_115672 ?auto_115673 ) ( not ( = ?auto_115670 ?auto_115673 ) ) ( not ( = ?auto_115671 ?auto_115673 ) ) ( not ( = ?auto_115672 ?auto_115673 ) ) ( CLEAR ?auto_115670 ) ( ON ?auto_115671 ?auto_115672 ) ( CLEAR ?auto_115671 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115675 ) ( ON ?auto_115674 ?auto_115675 ) ( ON ?auto_115676 ?auto_115674 ) ( ON ?auto_115673 ?auto_115676 ) ( not ( = ?auto_115675 ?auto_115674 ) ) ( not ( = ?auto_115675 ?auto_115676 ) ) ( not ( = ?auto_115675 ?auto_115673 ) ) ( not ( = ?auto_115675 ?auto_115672 ) ) ( not ( = ?auto_115675 ?auto_115671 ) ) ( not ( = ?auto_115674 ?auto_115676 ) ) ( not ( = ?auto_115674 ?auto_115673 ) ) ( not ( = ?auto_115674 ?auto_115672 ) ) ( not ( = ?auto_115674 ?auto_115671 ) ) ( not ( = ?auto_115676 ?auto_115673 ) ) ( not ( = ?auto_115676 ?auto_115672 ) ) ( not ( = ?auto_115676 ?auto_115671 ) ) ( not ( = ?auto_115670 ?auto_115675 ) ) ( not ( = ?auto_115670 ?auto_115674 ) ) ( not ( = ?auto_115670 ?auto_115676 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115675 ?auto_115674 ?auto_115676 ?auto_115673 ?auto_115672 )
      ( MAKE-3PILE ?auto_115670 ?auto_115671 ?auto_115672 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115677 - BLOCK
      ?auto_115678 - BLOCK
      ?auto_115679 - BLOCK
    )
    :vars
    (
      ?auto_115683 - BLOCK
      ?auto_115682 - BLOCK
      ?auto_115681 - BLOCK
      ?auto_115680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115677 ?auto_115678 ) ) ( not ( = ?auto_115677 ?auto_115679 ) ) ( not ( = ?auto_115678 ?auto_115679 ) ) ( ON ?auto_115679 ?auto_115683 ) ( not ( = ?auto_115677 ?auto_115683 ) ) ( not ( = ?auto_115678 ?auto_115683 ) ) ( not ( = ?auto_115679 ?auto_115683 ) ) ( ON ?auto_115678 ?auto_115679 ) ( CLEAR ?auto_115678 ) ( ON-TABLE ?auto_115682 ) ( ON ?auto_115681 ?auto_115682 ) ( ON ?auto_115680 ?auto_115681 ) ( ON ?auto_115683 ?auto_115680 ) ( not ( = ?auto_115682 ?auto_115681 ) ) ( not ( = ?auto_115682 ?auto_115680 ) ) ( not ( = ?auto_115682 ?auto_115683 ) ) ( not ( = ?auto_115682 ?auto_115679 ) ) ( not ( = ?auto_115682 ?auto_115678 ) ) ( not ( = ?auto_115681 ?auto_115680 ) ) ( not ( = ?auto_115681 ?auto_115683 ) ) ( not ( = ?auto_115681 ?auto_115679 ) ) ( not ( = ?auto_115681 ?auto_115678 ) ) ( not ( = ?auto_115680 ?auto_115683 ) ) ( not ( = ?auto_115680 ?auto_115679 ) ) ( not ( = ?auto_115680 ?auto_115678 ) ) ( not ( = ?auto_115677 ?auto_115682 ) ) ( not ( = ?auto_115677 ?auto_115681 ) ) ( not ( = ?auto_115677 ?auto_115680 ) ) ( HOLDING ?auto_115677 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115677 )
      ( MAKE-3PILE ?auto_115677 ?auto_115678 ?auto_115679 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115684 - BLOCK
      ?auto_115685 - BLOCK
      ?auto_115686 - BLOCK
    )
    :vars
    (
      ?auto_115688 - BLOCK
      ?auto_115687 - BLOCK
      ?auto_115689 - BLOCK
      ?auto_115690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115684 ?auto_115685 ) ) ( not ( = ?auto_115684 ?auto_115686 ) ) ( not ( = ?auto_115685 ?auto_115686 ) ) ( ON ?auto_115686 ?auto_115688 ) ( not ( = ?auto_115684 ?auto_115688 ) ) ( not ( = ?auto_115685 ?auto_115688 ) ) ( not ( = ?auto_115686 ?auto_115688 ) ) ( ON ?auto_115685 ?auto_115686 ) ( ON-TABLE ?auto_115687 ) ( ON ?auto_115689 ?auto_115687 ) ( ON ?auto_115690 ?auto_115689 ) ( ON ?auto_115688 ?auto_115690 ) ( not ( = ?auto_115687 ?auto_115689 ) ) ( not ( = ?auto_115687 ?auto_115690 ) ) ( not ( = ?auto_115687 ?auto_115688 ) ) ( not ( = ?auto_115687 ?auto_115686 ) ) ( not ( = ?auto_115687 ?auto_115685 ) ) ( not ( = ?auto_115689 ?auto_115690 ) ) ( not ( = ?auto_115689 ?auto_115688 ) ) ( not ( = ?auto_115689 ?auto_115686 ) ) ( not ( = ?auto_115689 ?auto_115685 ) ) ( not ( = ?auto_115690 ?auto_115688 ) ) ( not ( = ?auto_115690 ?auto_115686 ) ) ( not ( = ?auto_115690 ?auto_115685 ) ) ( not ( = ?auto_115684 ?auto_115687 ) ) ( not ( = ?auto_115684 ?auto_115689 ) ) ( not ( = ?auto_115684 ?auto_115690 ) ) ( ON ?auto_115684 ?auto_115685 ) ( CLEAR ?auto_115684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115687 ?auto_115689 ?auto_115690 ?auto_115688 ?auto_115686 ?auto_115685 )
      ( MAKE-3PILE ?auto_115684 ?auto_115685 ?auto_115686 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115694 - BLOCK
      ?auto_115695 - BLOCK
      ?auto_115696 - BLOCK
    )
    :vars
    (
      ?auto_115698 - BLOCK
      ?auto_115700 - BLOCK
      ?auto_115699 - BLOCK
      ?auto_115697 - BLOCK
      ?auto_115701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115694 ?auto_115695 ) ) ( not ( = ?auto_115694 ?auto_115696 ) ) ( not ( = ?auto_115695 ?auto_115696 ) ) ( ON ?auto_115696 ?auto_115698 ) ( not ( = ?auto_115694 ?auto_115698 ) ) ( not ( = ?auto_115695 ?auto_115698 ) ) ( not ( = ?auto_115696 ?auto_115698 ) ) ( ON ?auto_115695 ?auto_115696 ) ( CLEAR ?auto_115695 ) ( ON-TABLE ?auto_115700 ) ( ON ?auto_115699 ?auto_115700 ) ( ON ?auto_115697 ?auto_115699 ) ( ON ?auto_115698 ?auto_115697 ) ( not ( = ?auto_115700 ?auto_115699 ) ) ( not ( = ?auto_115700 ?auto_115697 ) ) ( not ( = ?auto_115700 ?auto_115698 ) ) ( not ( = ?auto_115700 ?auto_115696 ) ) ( not ( = ?auto_115700 ?auto_115695 ) ) ( not ( = ?auto_115699 ?auto_115697 ) ) ( not ( = ?auto_115699 ?auto_115698 ) ) ( not ( = ?auto_115699 ?auto_115696 ) ) ( not ( = ?auto_115699 ?auto_115695 ) ) ( not ( = ?auto_115697 ?auto_115698 ) ) ( not ( = ?auto_115697 ?auto_115696 ) ) ( not ( = ?auto_115697 ?auto_115695 ) ) ( not ( = ?auto_115694 ?auto_115700 ) ) ( not ( = ?auto_115694 ?auto_115699 ) ) ( not ( = ?auto_115694 ?auto_115697 ) ) ( ON ?auto_115694 ?auto_115701 ) ( CLEAR ?auto_115694 ) ( HAND-EMPTY ) ( not ( = ?auto_115694 ?auto_115701 ) ) ( not ( = ?auto_115695 ?auto_115701 ) ) ( not ( = ?auto_115696 ?auto_115701 ) ) ( not ( = ?auto_115698 ?auto_115701 ) ) ( not ( = ?auto_115700 ?auto_115701 ) ) ( not ( = ?auto_115699 ?auto_115701 ) ) ( not ( = ?auto_115697 ?auto_115701 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115694 ?auto_115701 )
      ( MAKE-3PILE ?auto_115694 ?auto_115695 ?auto_115696 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115702 - BLOCK
      ?auto_115703 - BLOCK
      ?auto_115704 - BLOCK
    )
    :vars
    (
      ?auto_115706 - BLOCK
      ?auto_115705 - BLOCK
      ?auto_115707 - BLOCK
      ?auto_115709 - BLOCK
      ?auto_115708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115702 ?auto_115703 ) ) ( not ( = ?auto_115702 ?auto_115704 ) ) ( not ( = ?auto_115703 ?auto_115704 ) ) ( ON ?auto_115704 ?auto_115706 ) ( not ( = ?auto_115702 ?auto_115706 ) ) ( not ( = ?auto_115703 ?auto_115706 ) ) ( not ( = ?auto_115704 ?auto_115706 ) ) ( ON-TABLE ?auto_115705 ) ( ON ?auto_115707 ?auto_115705 ) ( ON ?auto_115709 ?auto_115707 ) ( ON ?auto_115706 ?auto_115709 ) ( not ( = ?auto_115705 ?auto_115707 ) ) ( not ( = ?auto_115705 ?auto_115709 ) ) ( not ( = ?auto_115705 ?auto_115706 ) ) ( not ( = ?auto_115705 ?auto_115704 ) ) ( not ( = ?auto_115705 ?auto_115703 ) ) ( not ( = ?auto_115707 ?auto_115709 ) ) ( not ( = ?auto_115707 ?auto_115706 ) ) ( not ( = ?auto_115707 ?auto_115704 ) ) ( not ( = ?auto_115707 ?auto_115703 ) ) ( not ( = ?auto_115709 ?auto_115706 ) ) ( not ( = ?auto_115709 ?auto_115704 ) ) ( not ( = ?auto_115709 ?auto_115703 ) ) ( not ( = ?auto_115702 ?auto_115705 ) ) ( not ( = ?auto_115702 ?auto_115707 ) ) ( not ( = ?auto_115702 ?auto_115709 ) ) ( ON ?auto_115702 ?auto_115708 ) ( CLEAR ?auto_115702 ) ( not ( = ?auto_115702 ?auto_115708 ) ) ( not ( = ?auto_115703 ?auto_115708 ) ) ( not ( = ?auto_115704 ?auto_115708 ) ) ( not ( = ?auto_115706 ?auto_115708 ) ) ( not ( = ?auto_115705 ?auto_115708 ) ) ( not ( = ?auto_115707 ?auto_115708 ) ) ( not ( = ?auto_115709 ?auto_115708 ) ) ( HOLDING ?auto_115703 ) ( CLEAR ?auto_115704 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115705 ?auto_115707 ?auto_115709 ?auto_115706 ?auto_115704 ?auto_115703 )
      ( MAKE-3PILE ?auto_115702 ?auto_115703 ?auto_115704 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115710 - BLOCK
      ?auto_115711 - BLOCK
      ?auto_115712 - BLOCK
    )
    :vars
    (
      ?auto_115714 - BLOCK
      ?auto_115715 - BLOCK
      ?auto_115716 - BLOCK
      ?auto_115717 - BLOCK
      ?auto_115713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115710 ?auto_115711 ) ) ( not ( = ?auto_115710 ?auto_115712 ) ) ( not ( = ?auto_115711 ?auto_115712 ) ) ( ON ?auto_115712 ?auto_115714 ) ( not ( = ?auto_115710 ?auto_115714 ) ) ( not ( = ?auto_115711 ?auto_115714 ) ) ( not ( = ?auto_115712 ?auto_115714 ) ) ( ON-TABLE ?auto_115715 ) ( ON ?auto_115716 ?auto_115715 ) ( ON ?auto_115717 ?auto_115716 ) ( ON ?auto_115714 ?auto_115717 ) ( not ( = ?auto_115715 ?auto_115716 ) ) ( not ( = ?auto_115715 ?auto_115717 ) ) ( not ( = ?auto_115715 ?auto_115714 ) ) ( not ( = ?auto_115715 ?auto_115712 ) ) ( not ( = ?auto_115715 ?auto_115711 ) ) ( not ( = ?auto_115716 ?auto_115717 ) ) ( not ( = ?auto_115716 ?auto_115714 ) ) ( not ( = ?auto_115716 ?auto_115712 ) ) ( not ( = ?auto_115716 ?auto_115711 ) ) ( not ( = ?auto_115717 ?auto_115714 ) ) ( not ( = ?auto_115717 ?auto_115712 ) ) ( not ( = ?auto_115717 ?auto_115711 ) ) ( not ( = ?auto_115710 ?auto_115715 ) ) ( not ( = ?auto_115710 ?auto_115716 ) ) ( not ( = ?auto_115710 ?auto_115717 ) ) ( ON ?auto_115710 ?auto_115713 ) ( not ( = ?auto_115710 ?auto_115713 ) ) ( not ( = ?auto_115711 ?auto_115713 ) ) ( not ( = ?auto_115712 ?auto_115713 ) ) ( not ( = ?auto_115714 ?auto_115713 ) ) ( not ( = ?auto_115715 ?auto_115713 ) ) ( not ( = ?auto_115716 ?auto_115713 ) ) ( not ( = ?auto_115717 ?auto_115713 ) ) ( CLEAR ?auto_115712 ) ( ON ?auto_115711 ?auto_115710 ) ( CLEAR ?auto_115711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115713 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115713 ?auto_115710 )
      ( MAKE-3PILE ?auto_115710 ?auto_115711 ?auto_115712 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115718 - BLOCK
      ?auto_115719 - BLOCK
      ?auto_115720 - BLOCK
    )
    :vars
    (
      ?auto_115721 - BLOCK
      ?auto_115725 - BLOCK
      ?auto_115723 - BLOCK
      ?auto_115724 - BLOCK
      ?auto_115722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115718 ?auto_115719 ) ) ( not ( = ?auto_115718 ?auto_115720 ) ) ( not ( = ?auto_115719 ?auto_115720 ) ) ( not ( = ?auto_115718 ?auto_115721 ) ) ( not ( = ?auto_115719 ?auto_115721 ) ) ( not ( = ?auto_115720 ?auto_115721 ) ) ( ON-TABLE ?auto_115725 ) ( ON ?auto_115723 ?auto_115725 ) ( ON ?auto_115724 ?auto_115723 ) ( ON ?auto_115721 ?auto_115724 ) ( not ( = ?auto_115725 ?auto_115723 ) ) ( not ( = ?auto_115725 ?auto_115724 ) ) ( not ( = ?auto_115725 ?auto_115721 ) ) ( not ( = ?auto_115725 ?auto_115720 ) ) ( not ( = ?auto_115725 ?auto_115719 ) ) ( not ( = ?auto_115723 ?auto_115724 ) ) ( not ( = ?auto_115723 ?auto_115721 ) ) ( not ( = ?auto_115723 ?auto_115720 ) ) ( not ( = ?auto_115723 ?auto_115719 ) ) ( not ( = ?auto_115724 ?auto_115721 ) ) ( not ( = ?auto_115724 ?auto_115720 ) ) ( not ( = ?auto_115724 ?auto_115719 ) ) ( not ( = ?auto_115718 ?auto_115725 ) ) ( not ( = ?auto_115718 ?auto_115723 ) ) ( not ( = ?auto_115718 ?auto_115724 ) ) ( ON ?auto_115718 ?auto_115722 ) ( not ( = ?auto_115718 ?auto_115722 ) ) ( not ( = ?auto_115719 ?auto_115722 ) ) ( not ( = ?auto_115720 ?auto_115722 ) ) ( not ( = ?auto_115721 ?auto_115722 ) ) ( not ( = ?auto_115725 ?auto_115722 ) ) ( not ( = ?auto_115723 ?auto_115722 ) ) ( not ( = ?auto_115724 ?auto_115722 ) ) ( ON ?auto_115719 ?auto_115718 ) ( CLEAR ?auto_115719 ) ( ON-TABLE ?auto_115722 ) ( HOLDING ?auto_115720 ) ( CLEAR ?auto_115721 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115725 ?auto_115723 ?auto_115724 ?auto_115721 ?auto_115720 )
      ( MAKE-3PILE ?auto_115718 ?auto_115719 ?auto_115720 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115726 - BLOCK
      ?auto_115727 - BLOCK
      ?auto_115728 - BLOCK
    )
    :vars
    (
      ?auto_115730 - BLOCK
      ?auto_115732 - BLOCK
      ?auto_115733 - BLOCK
      ?auto_115731 - BLOCK
      ?auto_115729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115726 ?auto_115727 ) ) ( not ( = ?auto_115726 ?auto_115728 ) ) ( not ( = ?auto_115727 ?auto_115728 ) ) ( not ( = ?auto_115726 ?auto_115730 ) ) ( not ( = ?auto_115727 ?auto_115730 ) ) ( not ( = ?auto_115728 ?auto_115730 ) ) ( ON-TABLE ?auto_115732 ) ( ON ?auto_115733 ?auto_115732 ) ( ON ?auto_115731 ?auto_115733 ) ( ON ?auto_115730 ?auto_115731 ) ( not ( = ?auto_115732 ?auto_115733 ) ) ( not ( = ?auto_115732 ?auto_115731 ) ) ( not ( = ?auto_115732 ?auto_115730 ) ) ( not ( = ?auto_115732 ?auto_115728 ) ) ( not ( = ?auto_115732 ?auto_115727 ) ) ( not ( = ?auto_115733 ?auto_115731 ) ) ( not ( = ?auto_115733 ?auto_115730 ) ) ( not ( = ?auto_115733 ?auto_115728 ) ) ( not ( = ?auto_115733 ?auto_115727 ) ) ( not ( = ?auto_115731 ?auto_115730 ) ) ( not ( = ?auto_115731 ?auto_115728 ) ) ( not ( = ?auto_115731 ?auto_115727 ) ) ( not ( = ?auto_115726 ?auto_115732 ) ) ( not ( = ?auto_115726 ?auto_115733 ) ) ( not ( = ?auto_115726 ?auto_115731 ) ) ( ON ?auto_115726 ?auto_115729 ) ( not ( = ?auto_115726 ?auto_115729 ) ) ( not ( = ?auto_115727 ?auto_115729 ) ) ( not ( = ?auto_115728 ?auto_115729 ) ) ( not ( = ?auto_115730 ?auto_115729 ) ) ( not ( = ?auto_115732 ?auto_115729 ) ) ( not ( = ?auto_115733 ?auto_115729 ) ) ( not ( = ?auto_115731 ?auto_115729 ) ) ( ON ?auto_115727 ?auto_115726 ) ( ON-TABLE ?auto_115729 ) ( CLEAR ?auto_115730 ) ( ON ?auto_115728 ?auto_115727 ) ( CLEAR ?auto_115728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115729 ?auto_115726 ?auto_115727 )
      ( MAKE-3PILE ?auto_115726 ?auto_115727 ?auto_115728 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115734 - BLOCK
      ?auto_115735 - BLOCK
      ?auto_115736 - BLOCK
    )
    :vars
    (
      ?auto_115738 - BLOCK
      ?auto_115737 - BLOCK
      ?auto_115739 - BLOCK
      ?auto_115741 - BLOCK
      ?auto_115740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115734 ?auto_115735 ) ) ( not ( = ?auto_115734 ?auto_115736 ) ) ( not ( = ?auto_115735 ?auto_115736 ) ) ( not ( = ?auto_115734 ?auto_115738 ) ) ( not ( = ?auto_115735 ?auto_115738 ) ) ( not ( = ?auto_115736 ?auto_115738 ) ) ( ON-TABLE ?auto_115737 ) ( ON ?auto_115739 ?auto_115737 ) ( ON ?auto_115741 ?auto_115739 ) ( not ( = ?auto_115737 ?auto_115739 ) ) ( not ( = ?auto_115737 ?auto_115741 ) ) ( not ( = ?auto_115737 ?auto_115738 ) ) ( not ( = ?auto_115737 ?auto_115736 ) ) ( not ( = ?auto_115737 ?auto_115735 ) ) ( not ( = ?auto_115739 ?auto_115741 ) ) ( not ( = ?auto_115739 ?auto_115738 ) ) ( not ( = ?auto_115739 ?auto_115736 ) ) ( not ( = ?auto_115739 ?auto_115735 ) ) ( not ( = ?auto_115741 ?auto_115738 ) ) ( not ( = ?auto_115741 ?auto_115736 ) ) ( not ( = ?auto_115741 ?auto_115735 ) ) ( not ( = ?auto_115734 ?auto_115737 ) ) ( not ( = ?auto_115734 ?auto_115739 ) ) ( not ( = ?auto_115734 ?auto_115741 ) ) ( ON ?auto_115734 ?auto_115740 ) ( not ( = ?auto_115734 ?auto_115740 ) ) ( not ( = ?auto_115735 ?auto_115740 ) ) ( not ( = ?auto_115736 ?auto_115740 ) ) ( not ( = ?auto_115738 ?auto_115740 ) ) ( not ( = ?auto_115737 ?auto_115740 ) ) ( not ( = ?auto_115739 ?auto_115740 ) ) ( not ( = ?auto_115741 ?auto_115740 ) ) ( ON ?auto_115735 ?auto_115734 ) ( ON-TABLE ?auto_115740 ) ( ON ?auto_115736 ?auto_115735 ) ( CLEAR ?auto_115736 ) ( HOLDING ?auto_115738 ) ( CLEAR ?auto_115741 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115737 ?auto_115739 ?auto_115741 ?auto_115738 )
      ( MAKE-3PILE ?auto_115734 ?auto_115735 ?auto_115736 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115742 - BLOCK
      ?auto_115743 - BLOCK
      ?auto_115744 - BLOCK
    )
    :vars
    (
      ?auto_115746 - BLOCK
      ?auto_115749 - BLOCK
      ?auto_115747 - BLOCK
      ?auto_115745 - BLOCK
      ?auto_115748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115742 ?auto_115743 ) ) ( not ( = ?auto_115742 ?auto_115744 ) ) ( not ( = ?auto_115743 ?auto_115744 ) ) ( not ( = ?auto_115742 ?auto_115746 ) ) ( not ( = ?auto_115743 ?auto_115746 ) ) ( not ( = ?auto_115744 ?auto_115746 ) ) ( ON-TABLE ?auto_115749 ) ( ON ?auto_115747 ?auto_115749 ) ( ON ?auto_115745 ?auto_115747 ) ( not ( = ?auto_115749 ?auto_115747 ) ) ( not ( = ?auto_115749 ?auto_115745 ) ) ( not ( = ?auto_115749 ?auto_115746 ) ) ( not ( = ?auto_115749 ?auto_115744 ) ) ( not ( = ?auto_115749 ?auto_115743 ) ) ( not ( = ?auto_115747 ?auto_115745 ) ) ( not ( = ?auto_115747 ?auto_115746 ) ) ( not ( = ?auto_115747 ?auto_115744 ) ) ( not ( = ?auto_115747 ?auto_115743 ) ) ( not ( = ?auto_115745 ?auto_115746 ) ) ( not ( = ?auto_115745 ?auto_115744 ) ) ( not ( = ?auto_115745 ?auto_115743 ) ) ( not ( = ?auto_115742 ?auto_115749 ) ) ( not ( = ?auto_115742 ?auto_115747 ) ) ( not ( = ?auto_115742 ?auto_115745 ) ) ( ON ?auto_115742 ?auto_115748 ) ( not ( = ?auto_115742 ?auto_115748 ) ) ( not ( = ?auto_115743 ?auto_115748 ) ) ( not ( = ?auto_115744 ?auto_115748 ) ) ( not ( = ?auto_115746 ?auto_115748 ) ) ( not ( = ?auto_115749 ?auto_115748 ) ) ( not ( = ?auto_115747 ?auto_115748 ) ) ( not ( = ?auto_115745 ?auto_115748 ) ) ( ON ?auto_115743 ?auto_115742 ) ( ON-TABLE ?auto_115748 ) ( ON ?auto_115744 ?auto_115743 ) ( CLEAR ?auto_115745 ) ( ON ?auto_115746 ?auto_115744 ) ( CLEAR ?auto_115746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115748 ?auto_115742 ?auto_115743 ?auto_115744 )
      ( MAKE-3PILE ?auto_115742 ?auto_115743 ?auto_115744 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115750 - BLOCK
      ?auto_115751 - BLOCK
      ?auto_115752 - BLOCK
    )
    :vars
    (
      ?auto_115753 - BLOCK
      ?auto_115756 - BLOCK
      ?auto_115754 - BLOCK
      ?auto_115755 - BLOCK
      ?auto_115757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115750 ?auto_115751 ) ) ( not ( = ?auto_115750 ?auto_115752 ) ) ( not ( = ?auto_115751 ?auto_115752 ) ) ( not ( = ?auto_115750 ?auto_115753 ) ) ( not ( = ?auto_115751 ?auto_115753 ) ) ( not ( = ?auto_115752 ?auto_115753 ) ) ( ON-TABLE ?auto_115756 ) ( ON ?auto_115754 ?auto_115756 ) ( not ( = ?auto_115756 ?auto_115754 ) ) ( not ( = ?auto_115756 ?auto_115755 ) ) ( not ( = ?auto_115756 ?auto_115753 ) ) ( not ( = ?auto_115756 ?auto_115752 ) ) ( not ( = ?auto_115756 ?auto_115751 ) ) ( not ( = ?auto_115754 ?auto_115755 ) ) ( not ( = ?auto_115754 ?auto_115753 ) ) ( not ( = ?auto_115754 ?auto_115752 ) ) ( not ( = ?auto_115754 ?auto_115751 ) ) ( not ( = ?auto_115755 ?auto_115753 ) ) ( not ( = ?auto_115755 ?auto_115752 ) ) ( not ( = ?auto_115755 ?auto_115751 ) ) ( not ( = ?auto_115750 ?auto_115756 ) ) ( not ( = ?auto_115750 ?auto_115754 ) ) ( not ( = ?auto_115750 ?auto_115755 ) ) ( ON ?auto_115750 ?auto_115757 ) ( not ( = ?auto_115750 ?auto_115757 ) ) ( not ( = ?auto_115751 ?auto_115757 ) ) ( not ( = ?auto_115752 ?auto_115757 ) ) ( not ( = ?auto_115753 ?auto_115757 ) ) ( not ( = ?auto_115756 ?auto_115757 ) ) ( not ( = ?auto_115754 ?auto_115757 ) ) ( not ( = ?auto_115755 ?auto_115757 ) ) ( ON ?auto_115751 ?auto_115750 ) ( ON-TABLE ?auto_115757 ) ( ON ?auto_115752 ?auto_115751 ) ( ON ?auto_115753 ?auto_115752 ) ( CLEAR ?auto_115753 ) ( HOLDING ?auto_115755 ) ( CLEAR ?auto_115754 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115756 ?auto_115754 ?auto_115755 )
      ( MAKE-3PILE ?auto_115750 ?auto_115751 ?auto_115752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115758 - BLOCK
      ?auto_115759 - BLOCK
      ?auto_115760 - BLOCK
    )
    :vars
    (
      ?auto_115762 - BLOCK
      ?auto_115765 - BLOCK
      ?auto_115764 - BLOCK
      ?auto_115763 - BLOCK
      ?auto_115761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115758 ?auto_115759 ) ) ( not ( = ?auto_115758 ?auto_115760 ) ) ( not ( = ?auto_115759 ?auto_115760 ) ) ( not ( = ?auto_115758 ?auto_115762 ) ) ( not ( = ?auto_115759 ?auto_115762 ) ) ( not ( = ?auto_115760 ?auto_115762 ) ) ( ON-TABLE ?auto_115765 ) ( ON ?auto_115764 ?auto_115765 ) ( not ( = ?auto_115765 ?auto_115764 ) ) ( not ( = ?auto_115765 ?auto_115763 ) ) ( not ( = ?auto_115765 ?auto_115762 ) ) ( not ( = ?auto_115765 ?auto_115760 ) ) ( not ( = ?auto_115765 ?auto_115759 ) ) ( not ( = ?auto_115764 ?auto_115763 ) ) ( not ( = ?auto_115764 ?auto_115762 ) ) ( not ( = ?auto_115764 ?auto_115760 ) ) ( not ( = ?auto_115764 ?auto_115759 ) ) ( not ( = ?auto_115763 ?auto_115762 ) ) ( not ( = ?auto_115763 ?auto_115760 ) ) ( not ( = ?auto_115763 ?auto_115759 ) ) ( not ( = ?auto_115758 ?auto_115765 ) ) ( not ( = ?auto_115758 ?auto_115764 ) ) ( not ( = ?auto_115758 ?auto_115763 ) ) ( ON ?auto_115758 ?auto_115761 ) ( not ( = ?auto_115758 ?auto_115761 ) ) ( not ( = ?auto_115759 ?auto_115761 ) ) ( not ( = ?auto_115760 ?auto_115761 ) ) ( not ( = ?auto_115762 ?auto_115761 ) ) ( not ( = ?auto_115765 ?auto_115761 ) ) ( not ( = ?auto_115764 ?auto_115761 ) ) ( not ( = ?auto_115763 ?auto_115761 ) ) ( ON ?auto_115759 ?auto_115758 ) ( ON-TABLE ?auto_115761 ) ( ON ?auto_115760 ?auto_115759 ) ( ON ?auto_115762 ?auto_115760 ) ( CLEAR ?auto_115764 ) ( ON ?auto_115763 ?auto_115762 ) ( CLEAR ?auto_115763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115761 ?auto_115758 ?auto_115759 ?auto_115760 ?auto_115762 )
      ( MAKE-3PILE ?auto_115758 ?auto_115759 ?auto_115760 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115766 - BLOCK
      ?auto_115767 - BLOCK
      ?auto_115768 - BLOCK
    )
    :vars
    (
      ?auto_115769 - BLOCK
      ?auto_115773 - BLOCK
      ?auto_115772 - BLOCK
      ?auto_115771 - BLOCK
      ?auto_115770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115766 ?auto_115767 ) ) ( not ( = ?auto_115766 ?auto_115768 ) ) ( not ( = ?auto_115767 ?auto_115768 ) ) ( not ( = ?auto_115766 ?auto_115769 ) ) ( not ( = ?auto_115767 ?auto_115769 ) ) ( not ( = ?auto_115768 ?auto_115769 ) ) ( ON-TABLE ?auto_115773 ) ( not ( = ?auto_115773 ?auto_115772 ) ) ( not ( = ?auto_115773 ?auto_115771 ) ) ( not ( = ?auto_115773 ?auto_115769 ) ) ( not ( = ?auto_115773 ?auto_115768 ) ) ( not ( = ?auto_115773 ?auto_115767 ) ) ( not ( = ?auto_115772 ?auto_115771 ) ) ( not ( = ?auto_115772 ?auto_115769 ) ) ( not ( = ?auto_115772 ?auto_115768 ) ) ( not ( = ?auto_115772 ?auto_115767 ) ) ( not ( = ?auto_115771 ?auto_115769 ) ) ( not ( = ?auto_115771 ?auto_115768 ) ) ( not ( = ?auto_115771 ?auto_115767 ) ) ( not ( = ?auto_115766 ?auto_115773 ) ) ( not ( = ?auto_115766 ?auto_115772 ) ) ( not ( = ?auto_115766 ?auto_115771 ) ) ( ON ?auto_115766 ?auto_115770 ) ( not ( = ?auto_115766 ?auto_115770 ) ) ( not ( = ?auto_115767 ?auto_115770 ) ) ( not ( = ?auto_115768 ?auto_115770 ) ) ( not ( = ?auto_115769 ?auto_115770 ) ) ( not ( = ?auto_115773 ?auto_115770 ) ) ( not ( = ?auto_115772 ?auto_115770 ) ) ( not ( = ?auto_115771 ?auto_115770 ) ) ( ON ?auto_115767 ?auto_115766 ) ( ON-TABLE ?auto_115770 ) ( ON ?auto_115768 ?auto_115767 ) ( ON ?auto_115769 ?auto_115768 ) ( ON ?auto_115771 ?auto_115769 ) ( CLEAR ?auto_115771 ) ( HOLDING ?auto_115772 ) ( CLEAR ?auto_115773 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115773 ?auto_115772 )
      ( MAKE-3PILE ?auto_115766 ?auto_115767 ?auto_115768 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115774 - BLOCK
      ?auto_115775 - BLOCK
      ?auto_115776 - BLOCK
    )
    :vars
    (
      ?auto_115777 - BLOCK
      ?auto_115778 - BLOCK
      ?auto_115781 - BLOCK
      ?auto_115780 - BLOCK
      ?auto_115779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115774 ?auto_115775 ) ) ( not ( = ?auto_115774 ?auto_115776 ) ) ( not ( = ?auto_115775 ?auto_115776 ) ) ( not ( = ?auto_115774 ?auto_115777 ) ) ( not ( = ?auto_115775 ?auto_115777 ) ) ( not ( = ?auto_115776 ?auto_115777 ) ) ( ON-TABLE ?auto_115778 ) ( not ( = ?auto_115778 ?auto_115781 ) ) ( not ( = ?auto_115778 ?auto_115780 ) ) ( not ( = ?auto_115778 ?auto_115777 ) ) ( not ( = ?auto_115778 ?auto_115776 ) ) ( not ( = ?auto_115778 ?auto_115775 ) ) ( not ( = ?auto_115781 ?auto_115780 ) ) ( not ( = ?auto_115781 ?auto_115777 ) ) ( not ( = ?auto_115781 ?auto_115776 ) ) ( not ( = ?auto_115781 ?auto_115775 ) ) ( not ( = ?auto_115780 ?auto_115777 ) ) ( not ( = ?auto_115780 ?auto_115776 ) ) ( not ( = ?auto_115780 ?auto_115775 ) ) ( not ( = ?auto_115774 ?auto_115778 ) ) ( not ( = ?auto_115774 ?auto_115781 ) ) ( not ( = ?auto_115774 ?auto_115780 ) ) ( ON ?auto_115774 ?auto_115779 ) ( not ( = ?auto_115774 ?auto_115779 ) ) ( not ( = ?auto_115775 ?auto_115779 ) ) ( not ( = ?auto_115776 ?auto_115779 ) ) ( not ( = ?auto_115777 ?auto_115779 ) ) ( not ( = ?auto_115778 ?auto_115779 ) ) ( not ( = ?auto_115781 ?auto_115779 ) ) ( not ( = ?auto_115780 ?auto_115779 ) ) ( ON ?auto_115775 ?auto_115774 ) ( ON-TABLE ?auto_115779 ) ( ON ?auto_115776 ?auto_115775 ) ( ON ?auto_115777 ?auto_115776 ) ( ON ?auto_115780 ?auto_115777 ) ( CLEAR ?auto_115778 ) ( ON ?auto_115781 ?auto_115780 ) ( CLEAR ?auto_115781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115779 ?auto_115774 ?auto_115775 ?auto_115776 ?auto_115777 ?auto_115780 )
      ( MAKE-3PILE ?auto_115774 ?auto_115775 ?auto_115776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115782 - BLOCK
      ?auto_115783 - BLOCK
      ?auto_115784 - BLOCK
    )
    :vars
    (
      ?auto_115785 - BLOCK
      ?auto_115789 - BLOCK
      ?auto_115786 - BLOCK
      ?auto_115787 - BLOCK
      ?auto_115788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115782 ?auto_115783 ) ) ( not ( = ?auto_115782 ?auto_115784 ) ) ( not ( = ?auto_115783 ?auto_115784 ) ) ( not ( = ?auto_115782 ?auto_115785 ) ) ( not ( = ?auto_115783 ?auto_115785 ) ) ( not ( = ?auto_115784 ?auto_115785 ) ) ( not ( = ?auto_115789 ?auto_115786 ) ) ( not ( = ?auto_115789 ?auto_115787 ) ) ( not ( = ?auto_115789 ?auto_115785 ) ) ( not ( = ?auto_115789 ?auto_115784 ) ) ( not ( = ?auto_115789 ?auto_115783 ) ) ( not ( = ?auto_115786 ?auto_115787 ) ) ( not ( = ?auto_115786 ?auto_115785 ) ) ( not ( = ?auto_115786 ?auto_115784 ) ) ( not ( = ?auto_115786 ?auto_115783 ) ) ( not ( = ?auto_115787 ?auto_115785 ) ) ( not ( = ?auto_115787 ?auto_115784 ) ) ( not ( = ?auto_115787 ?auto_115783 ) ) ( not ( = ?auto_115782 ?auto_115789 ) ) ( not ( = ?auto_115782 ?auto_115786 ) ) ( not ( = ?auto_115782 ?auto_115787 ) ) ( ON ?auto_115782 ?auto_115788 ) ( not ( = ?auto_115782 ?auto_115788 ) ) ( not ( = ?auto_115783 ?auto_115788 ) ) ( not ( = ?auto_115784 ?auto_115788 ) ) ( not ( = ?auto_115785 ?auto_115788 ) ) ( not ( = ?auto_115789 ?auto_115788 ) ) ( not ( = ?auto_115786 ?auto_115788 ) ) ( not ( = ?auto_115787 ?auto_115788 ) ) ( ON ?auto_115783 ?auto_115782 ) ( ON-TABLE ?auto_115788 ) ( ON ?auto_115784 ?auto_115783 ) ( ON ?auto_115785 ?auto_115784 ) ( ON ?auto_115787 ?auto_115785 ) ( ON ?auto_115786 ?auto_115787 ) ( CLEAR ?auto_115786 ) ( HOLDING ?auto_115789 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115789 )
      ( MAKE-3PILE ?auto_115782 ?auto_115783 ?auto_115784 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115790 - BLOCK
      ?auto_115791 - BLOCK
      ?auto_115792 - BLOCK
    )
    :vars
    (
      ?auto_115793 - BLOCK
      ?auto_115797 - BLOCK
      ?auto_115795 - BLOCK
      ?auto_115796 - BLOCK
      ?auto_115794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115790 ?auto_115791 ) ) ( not ( = ?auto_115790 ?auto_115792 ) ) ( not ( = ?auto_115791 ?auto_115792 ) ) ( not ( = ?auto_115790 ?auto_115793 ) ) ( not ( = ?auto_115791 ?auto_115793 ) ) ( not ( = ?auto_115792 ?auto_115793 ) ) ( not ( = ?auto_115797 ?auto_115795 ) ) ( not ( = ?auto_115797 ?auto_115796 ) ) ( not ( = ?auto_115797 ?auto_115793 ) ) ( not ( = ?auto_115797 ?auto_115792 ) ) ( not ( = ?auto_115797 ?auto_115791 ) ) ( not ( = ?auto_115795 ?auto_115796 ) ) ( not ( = ?auto_115795 ?auto_115793 ) ) ( not ( = ?auto_115795 ?auto_115792 ) ) ( not ( = ?auto_115795 ?auto_115791 ) ) ( not ( = ?auto_115796 ?auto_115793 ) ) ( not ( = ?auto_115796 ?auto_115792 ) ) ( not ( = ?auto_115796 ?auto_115791 ) ) ( not ( = ?auto_115790 ?auto_115797 ) ) ( not ( = ?auto_115790 ?auto_115795 ) ) ( not ( = ?auto_115790 ?auto_115796 ) ) ( ON ?auto_115790 ?auto_115794 ) ( not ( = ?auto_115790 ?auto_115794 ) ) ( not ( = ?auto_115791 ?auto_115794 ) ) ( not ( = ?auto_115792 ?auto_115794 ) ) ( not ( = ?auto_115793 ?auto_115794 ) ) ( not ( = ?auto_115797 ?auto_115794 ) ) ( not ( = ?auto_115795 ?auto_115794 ) ) ( not ( = ?auto_115796 ?auto_115794 ) ) ( ON ?auto_115791 ?auto_115790 ) ( ON-TABLE ?auto_115794 ) ( ON ?auto_115792 ?auto_115791 ) ( ON ?auto_115793 ?auto_115792 ) ( ON ?auto_115796 ?auto_115793 ) ( ON ?auto_115795 ?auto_115796 ) ( ON ?auto_115797 ?auto_115795 ) ( CLEAR ?auto_115797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_115794 ?auto_115790 ?auto_115791 ?auto_115792 ?auto_115793 ?auto_115796 ?auto_115795 )
      ( MAKE-3PILE ?auto_115790 ?auto_115791 ?auto_115792 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115817 - BLOCK
      ?auto_115818 - BLOCK
      ?auto_115819 - BLOCK
    )
    :vars
    (
      ?auto_115820 - BLOCK
      ?auto_115821 - BLOCK
      ?auto_115822 - BLOCK
      ?auto_115823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115820 ?auto_115819 ) ( ON-TABLE ?auto_115817 ) ( ON ?auto_115818 ?auto_115817 ) ( ON ?auto_115819 ?auto_115818 ) ( not ( = ?auto_115817 ?auto_115818 ) ) ( not ( = ?auto_115817 ?auto_115819 ) ) ( not ( = ?auto_115817 ?auto_115820 ) ) ( not ( = ?auto_115818 ?auto_115819 ) ) ( not ( = ?auto_115818 ?auto_115820 ) ) ( not ( = ?auto_115819 ?auto_115820 ) ) ( not ( = ?auto_115817 ?auto_115821 ) ) ( not ( = ?auto_115817 ?auto_115822 ) ) ( not ( = ?auto_115818 ?auto_115821 ) ) ( not ( = ?auto_115818 ?auto_115822 ) ) ( not ( = ?auto_115819 ?auto_115821 ) ) ( not ( = ?auto_115819 ?auto_115822 ) ) ( not ( = ?auto_115820 ?auto_115821 ) ) ( not ( = ?auto_115820 ?auto_115822 ) ) ( not ( = ?auto_115821 ?auto_115822 ) ) ( ON ?auto_115821 ?auto_115820 ) ( CLEAR ?auto_115821 ) ( HOLDING ?auto_115822 ) ( CLEAR ?auto_115823 ) ( ON-TABLE ?auto_115823 ) ( not ( = ?auto_115823 ?auto_115822 ) ) ( not ( = ?auto_115817 ?auto_115823 ) ) ( not ( = ?auto_115818 ?auto_115823 ) ) ( not ( = ?auto_115819 ?auto_115823 ) ) ( not ( = ?auto_115820 ?auto_115823 ) ) ( not ( = ?auto_115821 ?auto_115823 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115823 ?auto_115822 )
      ( MAKE-3PILE ?auto_115817 ?auto_115818 ?auto_115819 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115824 - BLOCK
      ?auto_115825 - BLOCK
      ?auto_115826 - BLOCK
    )
    :vars
    (
      ?auto_115830 - BLOCK
      ?auto_115827 - BLOCK
      ?auto_115828 - BLOCK
      ?auto_115829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115830 ?auto_115826 ) ( ON-TABLE ?auto_115824 ) ( ON ?auto_115825 ?auto_115824 ) ( ON ?auto_115826 ?auto_115825 ) ( not ( = ?auto_115824 ?auto_115825 ) ) ( not ( = ?auto_115824 ?auto_115826 ) ) ( not ( = ?auto_115824 ?auto_115830 ) ) ( not ( = ?auto_115825 ?auto_115826 ) ) ( not ( = ?auto_115825 ?auto_115830 ) ) ( not ( = ?auto_115826 ?auto_115830 ) ) ( not ( = ?auto_115824 ?auto_115827 ) ) ( not ( = ?auto_115824 ?auto_115828 ) ) ( not ( = ?auto_115825 ?auto_115827 ) ) ( not ( = ?auto_115825 ?auto_115828 ) ) ( not ( = ?auto_115826 ?auto_115827 ) ) ( not ( = ?auto_115826 ?auto_115828 ) ) ( not ( = ?auto_115830 ?auto_115827 ) ) ( not ( = ?auto_115830 ?auto_115828 ) ) ( not ( = ?auto_115827 ?auto_115828 ) ) ( ON ?auto_115827 ?auto_115830 ) ( CLEAR ?auto_115829 ) ( ON-TABLE ?auto_115829 ) ( not ( = ?auto_115829 ?auto_115828 ) ) ( not ( = ?auto_115824 ?auto_115829 ) ) ( not ( = ?auto_115825 ?auto_115829 ) ) ( not ( = ?auto_115826 ?auto_115829 ) ) ( not ( = ?auto_115830 ?auto_115829 ) ) ( not ( = ?auto_115827 ?auto_115829 ) ) ( ON ?auto_115828 ?auto_115827 ) ( CLEAR ?auto_115828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115824 ?auto_115825 ?auto_115826 ?auto_115830 ?auto_115827 )
      ( MAKE-3PILE ?auto_115824 ?auto_115825 ?auto_115826 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115831 - BLOCK
      ?auto_115832 - BLOCK
      ?auto_115833 - BLOCK
    )
    :vars
    (
      ?auto_115835 - BLOCK
      ?auto_115834 - BLOCK
      ?auto_115837 - BLOCK
      ?auto_115836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115835 ?auto_115833 ) ( ON-TABLE ?auto_115831 ) ( ON ?auto_115832 ?auto_115831 ) ( ON ?auto_115833 ?auto_115832 ) ( not ( = ?auto_115831 ?auto_115832 ) ) ( not ( = ?auto_115831 ?auto_115833 ) ) ( not ( = ?auto_115831 ?auto_115835 ) ) ( not ( = ?auto_115832 ?auto_115833 ) ) ( not ( = ?auto_115832 ?auto_115835 ) ) ( not ( = ?auto_115833 ?auto_115835 ) ) ( not ( = ?auto_115831 ?auto_115834 ) ) ( not ( = ?auto_115831 ?auto_115837 ) ) ( not ( = ?auto_115832 ?auto_115834 ) ) ( not ( = ?auto_115832 ?auto_115837 ) ) ( not ( = ?auto_115833 ?auto_115834 ) ) ( not ( = ?auto_115833 ?auto_115837 ) ) ( not ( = ?auto_115835 ?auto_115834 ) ) ( not ( = ?auto_115835 ?auto_115837 ) ) ( not ( = ?auto_115834 ?auto_115837 ) ) ( ON ?auto_115834 ?auto_115835 ) ( not ( = ?auto_115836 ?auto_115837 ) ) ( not ( = ?auto_115831 ?auto_115836 ) ) ( not ( = ?auto_115832 ?auto_115836 ) ) ( not ( = ?auto_115833 ?auto_115836 ) ) ( not ( = ?auto_115835 ?auto_115836 ) ) ( not ( = ?auto_115834 ?auto_115836 ) ) ( ON ?auto_115837 ?auto_115834 ) ( CLEAR ?auto_115837 ) ( HOLDING ?auto_115836 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115836 )
      ( MAKE-3PILE ?auto_115831 ?auto_115832 ?auto_115833 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115848 - BLOCK
      ?auto_115849 - BLOCK
      ?auto_115850 - BLOCK
    )
    :vars
    (
      ?auto_115853 - BLOCK
      ?auto_115852 - BLOCK
      ?auto_115851 - BLOCK
      ?auto_115854 - BLOCK
      ?auto_115855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115853 ?auto_115850 ) ( ON-TABLE ?auto_115848 ) ( ON ?auto_115849 ?auto_115848 ) ( ON ?auto_115850 ?auto_115849 ) ( not ( = ?auto_115848 ?auto_115849 ) ) ( not ( = ?auto_115848 ?auto_115850 ) ) ( not ( = ?auto_115848 ?auto_115853 ) ) ( not ( = ?auto_115849 ?auto_115850 ) ) ( not ( = ?auto_115849 ?auto_115853 ) ) ( not ( = ?auto_115850 ?auto_115853 ) ) ( not ( = ?auto_115848 ?auto_115852 ) ) ( not ( = ?auto_115848 ?auto_115851 ) ) ( not ( = ?auto_115849 ?auto_115852 ) ) ( not ( = ?auto_115849 ?auto_115851 ) ) ( not ( = ?auto_115850 ?auto_115852 ) ) ( not ( = ?auto_115850 ?auto_115851 ) ) ( not ( = ?auto_115853 ?auto_115852 ) ) ( not ( = ?auto_115853 ?auto_115851 ) ) ( not ( = ?auto_115852 ?auto_115851 ) ) ( ON ?auto_115852 ?auto_115853 ) ( not ( = ?auto_115854 ?auto_115851 ) ) ( not ( = ?auto_115848 ?auto_115854 ) ) ( not ( = ?auto_115849 ?auto_115854 ) ) ( not ( = ?auto_115850 ?auto_115854 ) ) ( not ( = ?auto_115853 ?auto_115854 ) ) ( not ( = ?auto_115852 ?auto_115854 ) ) ( ON ?auto_115851 ?auto_115852 ) ( CLEAR ?auto_115851 ) ( ON ?auto_115854 ?auto_115855 ) ( CLEAR ?auto_115854 ) ( HAND-EMPTY ) ( not ( = ?auto_115848 ?auto_115855 ) ) ( not ( = ?auto_115849 ?auto_115855 ) ) ( not ( = ?auto_115850 ?auto_115855 ) ) ( not ( = ?auto_115853 ?auto_115855 ) ) ( not ( = ?auto_115852 ?auto_115855 ) ) ( not ( = ?auto_115851 ?auto_115855 ) ) ( not ( = ?auto_115854 ?auto_115855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115854 ?auto_115855 )
      ( MAKE-3PILE ?auto_115848 ?auto_115849 ?auto_115850 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_115856 - BLOCK
      ?auto_115857 - BLOCK
      ?auto_115858 - BLOCK
    )
    :vars
    (
      ?auto_115861 - BLOCK
      ?auto_115860 - BLOCK
      ?auto_115863 - BLOCK
      ?auto_115862 - BLOCK
      ?auto_115859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_115861 ?auto_115858 ) ( ON-TABLE ?auto_115856 ) ( ON ?auto_115857 ?auto_115856 ) ( ON ?auto_115858 ?auto_115857 ) ( not ( = ?auto_115856 ?auto_115857 ) ) ( not ( = ?auto_115856 ?auto_115858 ) ) ( not ( = ?auto_115856 ?auto_115861 ) ) ( not ( = ?auto_115857 ?auto_115858 ) ) ( not ( = ?auto_115857 ?auto_115861 ) ) ( not ( = ?auto_115858 ?auto_115861 ) ) ( not ( = ?auto_115856 ?auto_115860 ) ) ( not ( = ?auto_115856 ?auto_115863 ) ) ( not ( = ?auto_115857 ?auto_115860 ) ) ( not ( = ?auto_115857 ?auto_115863 ) ) ( not ( = ?auto_115858 ?auto_115860 ) ) ( not ( = ?auto_115858 ?auto_115863 ) ) ( not ( = ?auto_115861 ?auto_115860 ) ) ( not ( = ?auto_115861 ?auto_115863 ) ) ( not ( = ?auto_115860 ?auto_115863 ) ) ( ON ?auto_115860 ?auto_115861 ) ( not ( = ?auto_115862 ?auto_115863 ) ) ( not ( = ?auto_115856 ?auto_115862 ) ) ( not ( = ?auto_115857 ?auto_115862 ) ) ( not ( = ?auto_115858 ?auto_115862 ) ) ( not ( = ?auto_115861 ?auto_115862 ) ) ( not ( = ?auto_115860 ?auto_115862 ) ) ( ON ?auto_115862 ?auto_115859 ) ( CLEAR ?auto_115862 ) ( not ( = ?auto_115856 ?auto_115859 ) ) ( not ( = ?auto_115857 ?auto_115859 ) ) ( not ( = ?auto_115858 ?auto_115859 ) ) ( not ( = ?auto_115861 ?auto_115859 ) ) ( not ( = ?auto_115860 ?auto_115859 ) ) ( not ( = ?auto_115863 ?auto_115859 ) ) ( not ( = ?auto_115862 ?auto_115859 ) ) ( HOLDING ?auto_115863 ) ( CLEAR ?auto_115860 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115856 ?auto_115857 ?auto_115858 ?auto_115861 ?auto_115860 ?auto_115863 )
      ( MAKE-3PILE ?auto_115856 ?auto_115857 ?auto_115858 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115918 - BLOCK
      ?auto_115919 - BLOCK
      ?auto_115920 - BLOCK
      ?auto_115921 - BLOCK
    )
    :vars
    (
      ?auto_115922 - BLOCK
      ?auto_115923 - BLOCK
      ?auto_115924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115918 ) ( ON ?auto_115919 ?auto_115918 ) ( not ( = ?auto_115918 ?auto_115919 ) ) ( not ( = ?auto_115918 ?auto_115920 ) ) ( not ( = ?auto_115918 ?auto_115921 ) ) ( not ( = ?auto_115919 ?auto_115920 ) ) ( not ( = ?auto_115919 ?auto_115921 ) ) ( not ( = ?auto_115920 ?auto_115921 ) ) ( ON ?auto_115921 ?auto_115922 ) ( not ( = ?auto_115918 ?auto_115922 ) ) ( not ( = ?auto_115919 ?auto_115922 ) ) ( not ( = ?auto_115920 ?auto_115922 ) ) ( not ( = ?auto_115921 ?auto_115922 ) ) ( CLEAR ?auto_115919 ) ( ON ?auto_115920 ?auto_115921 ) ( CLEAR ?auto_115920 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115923 ) ( ON ?auto_115924 ?auto_115923 ) ( ON ?auto_115922 ?auto_115924 ) ( not ( = ?auto_115923 ?auto_115924 ) ) ( not ( = ?auto_115923 ?auto_115922 ) ) ( not ( = ?auto_115923 ?auto_115921 ) ) ( not ( = ?auto_115923 ?auto_115920 ) ) ( not ( = ?auto_115924 ?auto_115922 ) ) ( not ( = ?auto_115924 ?auto_115921 ) ) ( not ( = ?auto_115924 ?auto_115920 ) ) ( not ( = ?auto_115918 ?auto_115923 ) ) ( not ( = ?auto_115918 ?auto_115924 ) ) ( not ( = ?auto_115919 ?auto_115923 ) ) ( not ( = ?auto_115919 ?auto_115924 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_115923 ?auto_115924 ?auto_115922 ?auto_115921 )
      ( MAKE-4PILE ?auto_115918 ?auto_115919 ?auto_115920 ?auto_115921 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115925 - BLOCK
      ?auto_115926 - BLOCK
      ?auto_115927 - BLOCK
      ?auto_115928 - BLOCK
    )
    :vars
    (
      ?auto_115929 - BLOCK
      ?auto_115930 - BLOCK
      ?auto_115931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115925 ) ( not ( = ?auto_115925 ?auto_115926 ) ) ( not ( = ?auto_115925 ?auto_115927 ) ) ( not ( = ?auto_115925 ?auto_115928 ) ) ( not ( = ?auto_115926 ?auto_115927 ) ) ( not ( = ?auto_115926 ?auto_115928 ) ) ( not ( = ?auto_115927 ?auto_115928 ) ) ( ON ?auto_115928 ?auto_115929 ) ( not ( = ?auto_115925 ?auto_115929 ) ) ( not ( = ?auto_115926 ?auto_115929 ) ) ( not ( = ?auto_115927 ?auto_115929 ) ) ( not ( = ?auto_115928 ?auto_115929 ) ) ( ON ?auto_115927 ?auto_115928 ) ( CLEAR ?auto_115927 ) ( ON-TABLE ?auto_115930 ) ( ON ?auto_115931 ?auto_115930 ) ( ON ?auto_115929 ?auto_115931 ) ( not ( = ?auto_115930 ?auto_115931 ) ) ( not ( = ?auto_115930 ?auto_115929 ) ) ( not ( = ?auto_115930 ?auto_115928 ) ) ( not ( = ?auto_115930 ?auto_115927 ) ) ( not ( = ?auto_115931 ?auto_115929 ) ) ( not ( = ?auto_115931 ?auto_115928 ) ) ( not ( = ?auto_115931 ?auto_115927 ) ) ( not ( = ?auto_115925 ?auto_115930 ) ) ( not ( = ?auto_115925 ?auto_115931 ) ) ( not ( = ?auto_115926 ?auto_115930 ) ) ( not ( = ?auto_115926 ?auto_115931 ) ) ( HOLDING ?auto_115926 ) ( CLEAR ?auto_115925 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115925 ?auto_115926 )
      ( MAKE-4PILE ?auto_115925 ?auto_115926 ?auto_115927 ?auto_115928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115932 - BLOCK
      ?auto_115933 - BLOCK
      ?auto_115934 - BLOCK
      ?auto_115935 - BLOCK
    )
    :vars
    (
      ?auto_115938 - BLOCK
      ?auto_115936 - BLOCK
      ?auto_115937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_115932 ) ( not ( = ?auto_115932 ?auto_115933 ) ) ( not ( = ?auto_115932 ?auto_115934 ) ) ( not ( = ?auto_115932 ?auto_115935 ) ) ( not ( = ?auto_115933 ?auto_115934 ) ) ( not ( = ?auto_115933 ?auto_115935 ) ) ( not ( = ?auto_115934 ?auto_115935 ) ) ( ON ?auto_115935 ?auto_115938 ) ( not ( = ?auto_115932 ?auto_115938 ) ) ( not ( = ?auto_115933 ?auto_115938 ) ) ( not ( = ?auto_115934 ?auto_115938 ) ) ( not ( = ?auto_115935 ?auto_115938 ) ) ( ON ?auto_115934 ?auto_115935 ) ( ON-TABLE ?auto_115936 ) ( ON ?auto_115937 ?auto_115936 ) ( ON ?auto_115938 ?auto_115937 ) ( not ( = ?auto_115936 ?auto_115937 ) ) ( not ( = ?auto_115936 ?auto_115938 ) ) ( not ( = ?auto_115936 ?auto_115935 ) ) ( not ( = ?auto_115936 ?auto_115934 ) ) ( not ( = ?auto_115937 ?auto_115938 ) ) ( not ( = ?auto_115937 ?auto_115935 ) ) ( not ( = ?auto_115937 ?auto_115934 ) ) ( not ( = ?auto_115932 ?auto_115936 ) ) ( not ( = ?auto_115932 ?auto_115937 ) ) ( not ( = ?auto_115933 ?auto_115936 ) ) ( not ( = ?auto_115933 ?auto_115937 ) ) ( CLEAR ?auto_115932 ) ( ON ?auto_115933 ?auto_115934 ) ( CLEAR ?auto_115933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115936 ?auto_115937 ?auto_115938 ?auto_115935 ?auto_115934 )
      ( MAKE-4PILE ?auto_115932 ?auto_115933 ?auto_115934 ?auto_115935 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115939 - BLOCK
      ?auto_115940 - BLOCK
      ?auto_115941 - BLOCK
      ?auto_115942 - BLOCK
    )
    :vars
    (
      ?auto_115944 - BLOCK
      ?auto_115945 - BLOCK
      ?auto_115943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115939 ?auto_115940 ) ) ( not ( = ?auto_115939 ?auto_115941 ) ) ( not ( = ?auto_115939 ?auto_115942 ) ) ( not ( = ?auto_115940 ?auto_115941 ) ) ( not ( = ?auto_115940 ?auto_115942 ) ) ( not ( = ?auto_115941 ?auto_115942 ) ) ( ON ?auto_115942 ?auto_115944 ) ( not ( = ?auto_115939 ?auto_115944 ) ) ( not ( = ?auto_115940 ?auto_115944 ) ) ( not ( = ?auto_115941 ?auto_115944 ) ) ( not ( = ?auto_115942 ?auto_115944 ) ) ( ON ?auto_115941 ?auto_115942 ) ( ON-TABLE ?auto_115945 ) ( ON ?auto_115943 ?auto_115945 ) ( ON ?auto_115944 ?auto_115943 ) ( not ( = ?auto_115945 ?auto_115943 ) ) ( not ( = ?auto_115945 ?auto_115944 ) ) ( not ( = ?auto_115945 ?auto_115942 ) ) ( not ( = ?auto_115945 ?auto_115941 ) ) ( not ( = ?auto_115943 ?auto_115944 ) ) ( not ( = ?auto_115943 ?auto_115942 ) ) ( not ( = ?auto_115943 ?auto_115941 ) ) ( not ( = ?auto_115939 ?auto_115945 ) ) ( not ( = ?auto_115939 ?auto_115943 ) ) ( not ( = ?auto_115940 ?auto_115945 ) ) ( not ( = ?auto_115940 ?auto_115943 ) ) ( ON ?auto_115940 ?auto_115941 ) ( CLEAR ?auto_115940 ) ( HOLDING ?auto_115939 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_115939 )
      ( MAKE-4PILE ?auto_115939 ?auto_115940 ?auto_115941 ?auto_115942 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115946 - BLOCK
      ?auto_115947 - BLOCK
      ?auto_115948 - BLOCK
      ?auto_115949 - BLOCK
    )
    :vars
    (
      ?auto_115952 - BLOCK
      ?auto_115951 - BLOCK
      ?auto_115950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115946 ?auto_115947 ) ) ( not ( = ?auto_115946 ?auto_115948 ) ) ( not ( = ?auto_115946 ?auto_115949 ) ) ( not ( = ?auto_115947 ?auto_115948 ) ) ( not ( = ?auto_115947 ?auto_115949 ) ) ( not ( = ?auto_115948 ?auto_115949 ) ) ( ON ?auto_115949 ?auto_115952 ) ( not ( = ?auto_115946 ?auto_115952 ) ) ( not ( = ?auto_115947 ?auto_115952 ) ) ( not ( = ?auto_115948 ?auto_115952 ) ) ( not ( = ?auto_115949 ?auto_115952 ) ) ( ON ?auto_115948 ?auto_115949 ) ( ON-TABLE ?auto_115951 ) ( ON ?auto_115950 ?auto_115951 ) ( ON ?auto_115952 ?auto_115950 ) ( not ( = ?auto_115951 ?auto_115950 ) ) ( not ( = ?auto_115951 ?auto_115952 ) ) ( not ( = ?auto_115951 ?auto_115949 ) ) ( not ( = ?auto_115951 ?auto_115948 ) ) ( not ( = ?auto_115950 ?auto_115952 ) ) ( not ( = ?auto_115950 ?auto_115949 ) ) ( not ( = ?auto_115950 ?auto_115948 ) ) ( not ( = ?auto_115946 ?auto_115951 ) ) ( not ( = ?auto_115946 ?auto_115950 ) ) ( not ( = ?auto_115947 ?auto_115951 ) ) ( not ( = ?auto_115947 ?auto_115950 ) ) ( ON ?auto_115947 ?auto_115948 ) ( ON ?auto_115946 ?auto_115947 ) ( CLEAR ?auto_115946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115951 ?auto_115950 ?auto_115952 ?auto_115949 ?auto_115948 ?auto_115947 )
      ( MAKE-4PILE ?auto_115946 ?auto_115947 ?auto_115948 ?auto_115949 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115957 - BLOCK
      ?auto_115958 - BLOCK
      ?auto_115959 - BLOCK
      ?auto_115960 - BLOCK
    )
    :vars
    (
      ?auto_115963 - BLOCK
      ?auto_115962 - BLOCK
      ?auto_115961 - BLOCK
      ?auto_115964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115957 ?auto_115958 ) ) ( not ( = ?auto_115957 ?auto_115959 ) ) ( not ( = ?auto_115957 ?auto_115960 ) ) ( not ( = ?auto_115958 ?auto_115959 ) ) ( not ( = ?auto_115958 ?auto_115960 ) ) ( not ( = ?auto_115959 ?auto_115960 ) ) ( ON ?auto_115960 ?auto_115963 ) ( not ( = ?auto_115957 ?auto_115963 ) ) ( not ( = ?auto_115958 ?auto_115963 ) ) ( not ( = ?auto_115959 ?auto_115963 ) ) ( not ( = ?auto_115960 ?auto_115963 ) ) ( ON ?auto_115959 ?auto_115960 ) ( ON-TABLE ?auto_115962 ) ( ON ?auto_115961 ?auto_115962 ) ( ON ?auto_115963 ?auto_115961 ) ( not ( = ?auto_115962 ?auto_115961 ) ) ( not ( = ?auto_115962 ?auto_115963 ) ) ( not ( = ?auto_115962 ?auto_115960 ) ) ( not ( = ?auto_115962 ?auto_115959 ) ) ( not ( = ?auto_115961 ?auto_115963 ) ) ( not ( = ?auto_115961 ?auto_115960 ) ) ( not ( = ?auto_115961 ?auto_115959 ) ) ( not ( = ?auto_115957 ?auto_115962 ) ) ( not ( = ?auto_115957 ?auto_115961 ) ) ( not ( = ?auto_115958 ?auto_115962 ) ) ( not ( = ?auto_115958 ?auto_115961 ) ) ( ON ?auto_115958 ?auto_115959 ) ( CLEAR ?auto_115958 ) ( ON ?auto_115957 ?auto_115964 ) ( CLEAR ?auto_115957 ) ( HAND-EMPTY ) ( not ( = ?auto_115957 ?auto_115964 ) ) ( not ( = ?auto_115958 ?auto_115964 ) ) ( not ( = ?auto_115959 ?auto_115964 ) ) ( not ( = ?auto_115960 ?auto_115964 ) ) ( not ( = ?auto_115963 ?auto_115964 ) ) ( not ( = ?auto_115962 ?auto_115964 ) ) ( not ( = ?auto_115961 ?auto_115964 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_115957 ?auto_115964 )
      ( MAKE-4PILE ?auto_115957 ?auto_115958 ?auto_115959 ?auto_115960 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115965 - BLOCK
      ?auto_115966 - BLOCK
      ?auto_115967 - BLOCK
      ?auto_115968 - BLOCK
    )
    :vars
    (
      ?auto_115971 - BLOCK
      ?auto_115972 - BLOCK
      ?auto_115970 - BLOCK
      ?auto_115969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115965 ?auto_115966 ) ) ( not ( = ?auto_115965 ?auto_115967 ) ) ( not ( = ?auto_115965 ?auto_115968 ) ) ( not ( = ?auto_115966 ?auto_115967 ) ) ( not ( = ?auto_115966 ?auto_115968 ) ) ( not ( = ?auto_115967 ?auto_115968 ) ) ( ON ?auto_115968 ?auto_115971 ) ( not ( = ?auto_115965 ?auto_115971 ) ) ( not ( = ?auto_115966 ?auto_115971 ) ) ( not ( = ?auto_115967 ?auto_115971 ) ) ( not ( = ?auto_115968 ?auto_115971 ) ) ( ON ?auto_115967 ?auto_115968 ) ( ON-TABLE ?auto_115972 ) ( ON ?auto_115970 ?auto_115972 ) ( ON ?auto_115971 ?auto_115970 ) ( not ( = ?auto_115972 ?auto_115970 ) ) ( not ( = ?auto_115972 ?auto_115971 ) ) ( not ( = ?auto_115972 ?auto_115968 ) ) ( not ( = ?auto_115972 ?auto_115967 ) ) ( not ( = ?auto_115970 ?auto_115971 ) ) ( not ( = ?auto_115970 ?auto_115968 ) ) ( not ( = ?auto_115970 ?auto_115967 ) ) ( not ( = ?auto_115965 ?auto_115972 ) ) ( not ( = ?auto_115965 ?auto_115970 ) ) ( not ( = ?auto_115966 ?auto_115972 ) ) ( not ( = ?auto_115966 ?auto_115970 ) ) ( ON ?auto_115965 ?auto_115969 ) ( CLEAR ?auto_115965 ) ( not ( = ?auto_115965 ?auto_115969 ) ) ( not ( = ?auto_115966 ?auto_115969 ) ) ( not ( = ?auto_115967 ?auto_115969 ) ) ( not ( = ?auto_115968 ?auto_115969 ) ) ( not ( = ?auto_115971 ?auto_115969 ) ) ( not ( = ?auto_115972 ?auto_115969 ) ) ( not ( = ?auto_115970 ?auto_115969 ) ) ( HOLDING ?auto_115966 ) ( CLEAR ?auto_115967 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_115972 ?auto_115970 ?auto_115971 ?auto_115968 ?auto_115967 ?auto_115966 )
      ( MAKE-4PILE ?auto_115965 ?auto_115966 ?auto_115967 ?auto_115968 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115973 - BLOCK
      ?auto_115974 - BLOCK
      ?auto_115975 - BLOCK
      ?auto_115976 - BLOCK
    )
    :vars
    (
      ?auto_115980 - BLOCK
      ?auto_115978 - BLOCK
      ?auto_115979 - BLOCK
      ?auto_115977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115973 ?auto_115974 ) ) ( not ( = ?auto_115973 ?auto_115975 ) ) ( not ( = ?auto_115973 ?auto_115976 ) ) ( not ( = ?auto_115974 ?auto_115975 ) ) ( not ( = ?auto_115974 ?auto_115976 ) ) ( not ( = ?auto_115975 ?auto_115976 ) ) ( ON ?auto_115976 ?auto_115980 ) ( not ( = ?auto_115973 ?auto_115980 ) ) ( not ( = ?auto_115974 ?auto_115980 ) ) ( not ( = ?auto_115975 ?auto_115980 ) ) ( not ( = ?auto_115976 ?auto_115980 ) ) ( ON ?auto_115975 ?auto_115976 ) ( ON-TABLE ?auto_115978 ) ( ON ?auto_115979 ?auto_115978 ) ( ON ?auto_115980 ?auto_115979 ) ( not ( = ?auto_115978 ?auto_115979 ) ) ( not ( = ?auto_115978 ?auto_115980 ) ) ( not ( = ?auto_115978 ?auto_115976 ) ) ( not ( = ?auto_115978 ?auto_115975 ) ) ( not ( = ?auto_115979 ?auto_115980 ) ) ( not ( = ?auto_115979 ?auto_115976 ) ) ( not ( = ?auto_115979 ?auto_115975 ) ) ( not ( = ?auto_115973 ?auto_115978 ) ) ( not ( = ?auto_115973 ?auto_115979 ) ) ( not ( = ?auto_115974 ?auto_115978 ) ) ( not ( = ?auto_115974 ?auto_115979 ) ) ( ON ?auto_115973 ?auto_115977 ) ( not ( = ?auto_115973 ?auto_115977 ) ) ( not ( = ?auto_115974 ?auto_115977 ) ) ( not ( = ?auto_115975 ?auto_115977 ) ) ( not ( = ?auto_115976 ?auto_115977 ) ) ( not ( = ?auto_115980 ?auto_115977 ) ) ( not ( = ?auto_115978 ?auto_115977 ) ) ( not ( = ?auto_115979 ?auto_115977 ) ) ( CLEAR ?auto_115975 ) ( ON ?auto_115974 ?auto_115973 ) ( CLEAR ?auto_115974 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_115977 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_115977 ?auto_115973 )
      ( MAKE-4PILE ?auto_115973 ?auto_115974 ?auto_115975 ?auto_115976 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115981 - BLOCK
      ?auto_115982 - BLOCK
      ?auto_115983 - BLOCK
      ?auto_115984 - BLOCK
    )
    :vars
    (
      ?auto_115987 - BLOCK
      ?auto_115988 - BLOCK
      ?auto_115986 - BLOCK
      ?auto_115985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115981 ?auto_115982 ) ) ( not ( = ?auto_115981 ?auto_115983 ) ) ( not ( = ?auto_115981 ?auto_115984 ) ) ( not ( = ?auto_115982 ?auto_115983 ) ) ( not ( = ?auto_115982 ?auto_115984 ) ) ( not ( = ?auto_115983 ?auto_115984 ) ) ( ON ?auto_115984 ?auto_115987 ) ( not ( = ?auto_115981 ?auto_115987 ) ) ( not ( = ?auto_115982 ?auto_115987 ) ) ( not ( = ?auto_115983 ?auto_115987 ) ) ( not ( = ?auto_115984 ?auto_115987 ) ) ( ON-TABLE ?auto_115988 ) ( ON ?auto_115986 ?auto_115988 ) ( ON ?auto_115987 ?auto_115986 ) ( not ( = ?auto_115988 ?auto_115986 ) ) ( not ( = ?auto_115988 ?auto_115987 ) ) ( not ( = ?auto_115988 ?auto_115984 ) ) ( not ( = ?auto_115988 ?auto_115983 ) ) ( not ( = ?auto_115986 ?auto_115987 ) ) ( not ( = ?auto_115986 ?auto_115984 ) ) ( not ( = ?auto_115986 ?auto_115983 ) ) ( not ( = ?auto_115981 ?auto_115988 ) ) ( not ( = ?auto_115981 ?auto_115986 ) ) ( not ( = ?auto_115982 ?auto_115988 ) ) ( not ( = ?auto_115982 ?auto_115986 ) ) ( ON ?auto_115981 ?auto_115985 ) ( not ( = ?auto_115981 ?auto_115985 ) ) ( not ( = ?auto_115982 ?auto_115985 ) ) ( not ( = ?auto_115983 ?auto_115985 ) ) ( not ( = ?auto_115984 ?auto_115985 ) ) ( not ( = ?auto_115987 ?auto_115985 ) ) ( not ( = ?auto_115988 ?auto_115985 ) ) ( not ( = ?auto_115986 ?auto_115985 ) ) ( ON ?auto_115982 ?auto_115981 ) ( CLEAR ?auto_115982 ) ( ON-TABLE ?auto_115985 ) ( HOLDING ?auto_115983 ) ( CLEAR ?auto_115984 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_115988 ?auto_115986 ?auto_115987 ?auto_115984 ?auto_115983 )
      ( MAKE-4PILE ?auto_115981 ?auto_115982 ?auto_115983 ?auto_115984 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115989 - BLOCK
      ?auto_115990 - BLOCK
      ?auto_115991 - BLOCK
      ?auto_115992 - BLOCK
    )
    :vars
    (
      ?auto_115995 - BLOCK
      ?auto_115993 - BLOCK
      ?auto_115994 - BLOCK
      ?auto_115996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115989 ?auto_115990 ) ) ( not ( = ?auto_115989 ?auto_115991 ) ) ( not ( = ?auto_115989 ?auto_115992 ) ) ( not ( = ?auto_115990 ?auto_115991 ) ) ( not ( = ?auto_115990 ?auto_115992 ) ) ( not ( = ?auto_115991 ?auto_115992 ) ) ( ON ?auto_115992 ?auto_115995 ) ( not ( = ?auto_115989 ?auto_115995 ) ) ( not ( = ?auto_115990 ?auto_115995 ) ) ( not ( = ?auto_115991 ?auto_115995 ) ) ( not ( = ?auto_115992 ?auto_115995 ) ) ( ON-TABLE ?auto_115993 ) ( ON ?auto_115994 ?auto_115993 ) ( ON ?auto_115995 ?auto_115994 ) ( not ( = ?auto_115993 ?auto_115994 ) ) ( not ( = ?auto_115993 ?auto_115995 ) ) ( not ( = ?auto_115993 ?auto_115992 ) ) ( not ( = ?auto_115993 ?auto_115991 ) ) ( not ( = ?auto_115994 ?auto_115995 ) ) ( not ( = ?auto_115994 ?auto_115992 ) ) ( not ( = ?auto_115994 ?auto_115991 ) ) ( not ( = ?auto_115989 ?auto_115993 ) ) ( not ( = ?auto_115989 ?auto_115994 ) ) ( not ( = ?auto_115990 ?auto_115993 ) ) ( not ( = ?auto_115990 ?auto_115994 ) ) ( ON ?auto_115989 ?auto_115996 ) ( not ( = ?auto_115989 ?auto_115996 ) ) ( not ( = ?auto_115990 ?auto_115996 ) ) ( not ( = ?auto_115991 ?auto_115996 ) ) ( not ( = ?auto_115992 ?auto_115996 ) ) ( not ( = ?auto_115995 ?auto_115996 ) ) ( not ( = ?auto_115993 ?auto_115996 ) ) ( not ( = ?auto_115994 ?auto_115996 ) ) ( ON ?auto_115990 ?auto_115989 ) ( ON-TABLE ?auto_115996 ) ( CLEAR ?auto_115992 ) ( ON ?auto_115991 ?auto_115990 ) ( CLEAR ?auto_115991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_115996 ?auto_115989 ?auto_115990 )
      ( MAKE-4PILE ?auto_115989 ?auto_115990 ?auto_115991 ?auto_115992 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_115997 - BLOCK
      ?auto_115998 - BLOCK
      ?auto_115999 - BLOCK
      ?auto_116000 - BLOCK
    )
    :vars
    (
      ?auto_116001 - BLOCK
      ?auto_116003 - BLOCK
      ?auto_116004 - BLOCK
      ?auto_116002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_115997 ?auto_115998 ) ) ( not ( = ?auto_115997 ?auto_115999 ) ) ( not ( = ?auto_115997 ?auto_116000 ) ) ( not ( = ?auto_115998 ?auto_115999 ) ) ( not ( = ?auto_115998 ?auto_116000 ) ) ( not ( = ?auto_115999 ?auto_116000 ) ) ( not ( = ?auto_115997 ?auto_116001 ) ) ( not ( = ?auto_115998 ?auto_116001 ) ) ( not ( = ?auto_115999 ?auto_116001 ) ) ( not ( = ?auto_116000 ?auto_116001 ) ) ( ON-TABLE ?auto_116003 ) ( ON ?auto_116004 ?auto_116003 ) ( ON ?auto_116001 ?auto_116004 ) ( not ( = ?auto_116003 ?auto_116004 ) ) ( not ( = ?auto_116003 ?auto_116001 ) ) ( not ( = ?auto_116003 ?auto_116000 ) ) ( not ( = ?auto_116003 ?auto_115999 ) ) ( not ( = ?auto_116004 ?auto_116001 ) ) ( not ( = ?auto_116004 ?auto_116000 ) ) ( not ( = ?auto_116004 ?auto_115999 ) ) ( not ( = ?auto_115997 ?auto_116003 ) ) ( not ( = ?auto_115997 ?auto_116004 ) ) ( not ( = ?auto_115998 ?auto_116003 ) ) ( not ( = ?auto_115998 ?auto_116004 ) ) ( ON ?auto_115997 ?auto_116002 ) ( not ( = ?auto_115997 ?auto_116002 ) ) ( not ( = ?auto_115998 ?auto_116002 ) ) ( not ( = ?auto_115999 ?auto_116002 ) ) ( not ( = ?auto_116000 ?auto_116002 ) ) ( not ( = ?auto_116001 ?auto_116002 ) ) ( not ( = ?auto_116003 ?auto_116002 ) ) ( not ( = ?auto_116004 ?auto_116002 ) ) ( ON ?auto_115998 ?auto_115997 ) ( ON-TABLE ?auto_116002 ) ( ON ?auto_115999 ?auto_115998 ) ( CLEAR ?auto_115999 ) ( HOLDING ?auto_116000 ) ( CLEAR ?auto_116001 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116003 ?auto_116004 ?auto_116001 ?auto_116000 )
      ( MAKE-4PILE ?auto_115997 ?auto_115998 ?auto_115999 ?auto_116000 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_116005 - BLOCK
      ?auto_116006 - BLOCK
      ?auto_116007 - BLOCK
      ?auto_116008 - BLOCK
    )
    :vars
    (
      ?auto_116011 - BLOCK
      ?auto_116009 - BLOCK
      ?auto_116012 - BLOCK
      ?auto_116010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116005 ?auto_116006 ) ) ( not ( = ?auto_116005 ?auto_116007 ) ) ( not ( = ?auto_116005 ?auto_116008 ) ) ( not ( = ?auto_116006 ?auto_116007 ) ) ( not ( = ?auto_116006 ?auto_116008 ) ) ( not ( = ?auto_116007 ?auto_116008 ) ) ( not ( = ?auto_116005 ?auto_116011 ) ) ( not ( = ?auto_116006 ?auto_116011 ) ) ( not ( = ?auto_116007 ?auto_116011 ) ) ( not ( = ?auto_116008 ?auto_116011 ) ) ( ON-TABLE ?auto_116009 ) ( ON ?auto_116012 ?auto_116009 ) ( ON ?auto_116011 ?auto_116012 ) ( not ( = ?auto_116009 ?auto_116012 ) ) ( not ( = ?auto_116009 ?auto_116011 ) ) ( not ( = ?auto_116009 ?auto_116008 ) ) ( not ( = ?auto_116009 ?auto_116007 ) ) ( not ( = ?auto_116012 ?auto_116011 ) ) ( not ( = ?auto_116012 ?auto_116008 ) ) ( not ( = ?auto_116012 ?auto_116007 ) ) ( not ( = ?auto_116005 ?auto_116009 ) ) ( not ( = ?auto_116005 ?auto_116012 ) ) ( not ( = ?auto_116006 ?auto_116009 ) ) ( not ( = ?auto_116006 ?auto_116012 ) ) ( ON ?auto_116005 ?auto_116010 ) ( not ( = ?auto_116005 ?auto_116010 ) ) ( not ( = ?auto_116006 ?auto_116010 ) ) ( not ( = ?auto_116007 ?auto_116010 ) ) ( not ( = ?auto_116008 ?auto_116010 ) ) ( not ( = ?auto_116011 ?auto_116010 ) ) ( not ( = ?auto_116009 ?auto_116010 ) ) ( not ( = ?auto_116012 ?auto_116010 ) ) ( ON ?auto_116006 ?auto_116005 ) ( ON-TABLE ?auto_116010 ) ( ON ?auto_116007 ?auto_116006 ) ( CLEAR ?auto_116011 ) ( ON ?auto_116008 ?auto_116007 ) ( CLEAR ?auto_116008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116010 ?auto_116005 ?auto_116006 ?auto_116007 )
      ( MAKE-4PILE ?auto_116005 ?auto_116006 ?auto_116007 ?auto_116008 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_116013 - BLOCK
      ?auto_116014 - BLOCK
      ?auto_116015 - BLOCK
      ?auto_116016 - BLOCK
    )
    :vars
    (
      ?auto_116017 - BLOCK
      ?auto_116018 - BLOCK
      ?auto_116020 - BLOCK
      ?auto_116019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116013 ?auto_116014 ) ) ( not ( = ?auto_116013 ?auto_116015 ) ) ( not ( = ?auto_116013 ?auto_116016 ) ) ( not ( = ?auto_116014 ?auto_116015 ) ) ( not ( = ?auto_116014 ?auto_116016 ) ) ( not ( = ?auto_116015 ?auto_116016 ) ) ( not ( = ?auto_116013 ?auto_116017 ) ) ( not ( = ?auto_116014 ?auto_116017 ) ) ( not ( = ?auto_116015 ?auto_116017 ) ) ( not ( = ?auto_116016 ?auto_116017 ) ) ( ON-TABLE ?auto_116018 ) ( ON ?auto_116020 ?auto_116018 ) ( not ( = ?auto_116018 ?auto_116020 ) ) ( not ( = ?auto_116018 ?auto_116017 ) ) ( not ( = ?auto_116018 ?auto_116016 ) ) ( not ( = ?auto_116018 ?auto_116015 ) ) ( not ( = ?auto_116020 ?auto_116017 ) ) ( not ( = ?auto_116020 ?auto_116016 ) ) ( not ( = ?auto_116020 ?auto_116015 ) ) ( not ( = ?auto_116013 ?auto_116018 ) ) ( not ( = ?auto_116013 ?auto_116020 ) ) ( not ( = ?auto_116014 ?auto_116018 ) ) ( not ( = ?auto_116014 ?auto_116020 ) ) ( ON ?auto_116013 ?auto_116019 ) ( not ( = ?auto_116013 ?auto_116019 ) ) ( not ( = ?auto_116014 ?auto_116019 ) ) ( not ( = ?auto_116015 ?auto_116019 ) ) ( not ( = ?auto_116016 ?auto_116019 ) ) ( not ( = ?auto_116017 ?auto_116019 ) ) ( not ( = ?auto_116018 ?auto_116019 ) ) ( not ( = ?auto_116020 ?auto_116019 ) ) ( ON ?auto_116014 ?auto_116013 ) ( ON-TABLE ?auto_116019 ) ( ON ?auto_116015 ?auto_116014 ) ( ON ?auto_116016 ?auto_116015 ) ( CLEAR ?auto_116016 ) ( HOLDING ?auto_116017 ) ( CLEAR ?auto_116020 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116018 ?auto_116020 ?auto_116017 )
      ( MAKE-4PILE ?auto_116013 ?auto_116014 ?auto_116015 ?auto_116016 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_116021 - BLOCK
      ?auto_116022 - BLOCK
      ?auto_116023 - BLOCK
      ?auto_116024 - BLOCK
    )
    :vars
    (
      ?auto_116028 - BLOCK
      ?auto_116025 - BLOCK
      ?auto_116026 - BLOCK
      ?auto_116027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116021 ?auto_116022 ) ) ( not ( = ?auto_116021 ?auto_116023 ) ) ( not ( = ?auto_116021 ?auto_116024 ) ) ( not ( = ?auto_116022 ?auto_116023 ) ) ( not ( = ?auto_116022 ?auto_116024 ) ) ( not ( = ?auto_116023 ?auto_116024 ) ) ( not ( = ?auto_116021 ?auto_116028 ) ) ( not ( = ?auto_116022 ?auto_116028 ) ) ( not ( = ?auto_116023 ?auto_116028 ) ) ( not ( = ?auto_116024 ?auto_116028 ) ) ( ON-TABLE ?auto_116025 ) ( ON ?auto_116026 ?auto_116025 ) ( not ( = ?auto_116025 ?auto_116026 ) ) ( not ( = ?auto_116025 ?auto_116028 ) ) ( not ( = ?auto_116025 ?auto_116024 ) ) ( not ( = ?auto_116025 ?auto_116023 ) ) ( not ( = ?auto_116026 ?auto_116028 ) ) ( not ( = ?auto_116026 ?auto_116024 ) ) ( not ( = ?auto_116026 ?auto_116023 ) ) ( not ( = ?auto_116021 ?auto_116025 ) ) ( not ( = ?auto_116021 ?auto_116026 ) ) ( not ( = ?auto_116022 ?auto_116025 ) ) ( not ( = ?auto_116022 ?auto_116026 ) ) ( ON ?auto_116021 ?auto_116027 ) ( not ( = ?auto_116021 ?auto_116027 ) ) ( not ( = ?auto_116022 ?auto_116027 ) ) ( not ( = ?auto_116023 ?auto_116027 ) ) ( not ( = ?auto_116024 ?auto_116027 ) ) ( not ( = ?auto_116028 ?auto_116027 ) ) ( not ( = ?auto_116025 ?auto_116027 ) ) ( not ( = ?auto_116026 ?auto_116027 ) ) ( ON ?auto_116022 ?auto_116021 ) ( ON-TABLE ?auto_116027 ) ( ON ?auto_116023 ?auto_116022 ) ( ON ?auto_116024 ?auto_116023 ) ( CLEAR ?auto_116026 ) ( ON ?auto_116028 ?auto_116024 ) ( CLEAR ?auto_116028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116027 ?auto_116021 ?auto_116022 ?auto_116023 ?auto_116024 )
      ( MAKE-4PILE ?auto_116021 ?auto_116022 ?auto_116023 ?auto_116024 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_116029 - BLOCK
      ?auto_116030 - BLOCK
      ?auto_116031 - BLOCK
      ?auto_116032 - BLOCK
    )
    :vars
    (
      ?auto_116034 - BLOCK
      ?auto_116033 - BLOCK
      ?auto_116035 - BLOCK
      ?auto_116036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116029 ?auto_116030 ) ) ( not ( = ?auto_116029 ?auto_116031 ) ) ( not ( = ?auto_116029 ?auto_116032 ) ) ( not ( = ?auto_116030 ?auto_116031 ) ) ( not ( = ?auto_116030 ?auto_116032 ) ) ( not ( = ?auto_116031 ?auto_116032 ) ) ( not ( = ?auto_116029 ?auto_116034 ) ) ( not ( = ?auto_116030 ?auto_116034 ) ) ( not ( = ?auto_116031 ?auto_116034 ) ) ( not ( = ?auto_116032 ?auto_116034 ) ) ( ON-TABLE ?auto_116033 ) ( not ( = ?auto_116033 ?auto_116035 ) ) ( not ( = ?auto_116033 ?auto_116034 ) ) ( not ( = ?auto_116033 ?auto_116032 ) ) ( not ( = ?auto_116033 ?auto_116031 ) ) ( not ( = ?auto_116035 ?auto_116034 ) ) ( not ( = ?auto_116035 ?auto_116032 ) ) ( not ( = ?auto_116035 ?auto_116031 ) ) ( not ( = ?auto_116029 ?auto_116033 ) ) ( not ( = ?auto_116029 ?auto_116035 ) ) ( not ( = ?auto_116030 ?auto_116033 ) ) ( not ( = ?auto_116030 ?auto_116035 ) ) ( ON ?auto_116029 ?auto_116036 ) ( not ( = ?auto_116029 ?auto_116036 ) ) ( not ( = ?auto_116030 ?auto_116036 ) ) ( not ( = ?auto_116031 ?auto_116036 ) ) ( not ( = ?auto_116032 ?auto_116036 ) ) ( not ( = ?auto_116034 ?auto_116036 ) ) ( not ( = ?auto_116033 ?auto_116036 ) ) ( not ( = ?auto_116035 ?auto_116036 ) ) ( ON ?auto_116030 ?auto_116029 ) ( ON-TABLE ?auto_116036 ) ( ON ?auto_116031 ?auto_116030 ) ( ON ?auto_116032 ?auto_116031 ) ( ON ?auto_116034 ?auto_116032 ) ( CLEAR ?auto_116034 ) ( HOLDING ?auto_116035 ) ( CLEAR ?auto_116033 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116033 ?auto_116035 )
      ( MAKE-4PILE ?auto_116029 ?auto_116030 ?auto_116031 ?auto_116032 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_116037 - BLOCK
      ?auto_116038 - BLOCK
      ?auto_116039 - BLOCK
      ?auto_116040 - BLOCK
    )
    :vars
    (
      ?auto_116042 - BLOCK
      ?auto_116044 - BLOCK
      ?auto_116041 - BLOCK
      ?auto_116043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116037 ?auto_116038 ) ) ( not ( = ?auto_116037 ?auto_116039 ) ) ( not ( = ?auto_116037 ?auto_116040 ) ) ( not ( = ?auto_116038 ?auto_116039 ) ) ( not ( = ?auto_116038 ?auto_116040 ) ) ( not ( = ?auto_116039 ?auto_116040 ) ) ( not ( = ?auto_116037 ?auto_116042 ) ) ( not ( = ?auto_116038 ?auto_116042 ) ) ( not ( = ?auto_116039 ?auto_116042 ) ) ( not ( = ?auto_116040 ?auto_116042 ) ) ( ON-TABLE ?auto_116044 ) ( not ( = ?auto_116044 ?auto_116041 ) ) ( not ( = ?auto_116044 ?auto_116042 ) ) ( not ( = ?auto_116044 ?auto_116040 ) ) ( not ( = ?auto_116044 ?auto_116039 ) ) ( not ( = ?auto_116041 ?auto_116042 ) ) ( not ( = ?auto_116041 ?auto_116040 ) ) ( not ( = ?auto_116041 ?auto_116039 ) ) ( not ( = ?auto_116037 ?auto_116044 ) ) ( not ( = ?auto_116037 ?auto_116041 ) ) ( not ( = ?auto_116038 ?auto_116044 ) ) ( not ( = ?auto_116038 ?auto_116041 ) ) ( ON ?auto_116037 ?auto_116043 ) ( not ( = ?auto_116037 ?auto_116043 ) ) ( not ( = ?auto_116038 ?auto_116043 ) ) ( not ( = ?auto_116039 ?auto_116043 ) ) ( not ( = ?auto_116040 ?auto_116043 ) ) ( not ( = ?auto_116042 ?auto_116043 ) ) ( not ( = ?auto_116044 ?auto_116043 ) ) ( not ( = ?auto_116041 ?auto_116043 ) ) ( ON ?auto_116038 ?auto_116037 ) ( ON-TABLE ?auto_116043 ) ( ON ?auto_116039 ?auto_116038 ) ( ON ?auto_116040 ?auto_116039 ) ( ON ?auto_116042 ?auto_116040 ) ( CLEAR ?auto_116044 ) ( ON ?auto_116041 ?auto_116042 ) ( CLEAR ?auto_116041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116043 ?auto_116037 ?auto_116038 ?auto_116039 ?auto_116040 ?auto_116042 )
      ( MAKE-4PILE ?auto_116037 ?auto_116038 ?auto_116039 ?auto_116040 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_116045 - BLOCK
      ?auto_116046 - BLOCK
      ?auto_116047 - BLOCK
      ?auto_116048 - BLOCK
    )
    :vars
    (
      ?auto_116050 - BLOCK
      ?auto_116049 - BLOCK
      ?auto_116051 - BLOCK
      ?auto_116052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116045 ?auto_116046 ) ) ( not ( = ?auto_116045 ?auto_116047 ) ) ( not ( = ?auto_116045 ?auto_116048 ) ) ( not ( = ?auto_116046 ?auto_116047 ) ) ( not ( = ?auto_116046 ?auto_116048 ) ) ( not ( = ?auto_116047 ?auto_116048 ) ) ( not ( = ?auto_116045 ?auto_116050 ) ) ( not ( = ?auto_116046 ?auto_116050 ) ) ( not ( = ?auto_116047 ?auto_116050 ) ) ( not ( = ?auto_116048 ?auto_116050 ) ) ( not ( = ?auto_116049 ?auto_116051 ) ) ( not ( = ?auto_116049 ?auto_116050 ) ) ( not ( = ?auto_116049 ?auto_116048 ) ) ( not ( = ?auto_116049 ?auto_116047 ) ) ( not ( = ?auto_116051 ?auto_116050 ) ) ( not ( = ?auto_116051 ?auto_116048 ) ) ( not ( = ?auto_116051 ?auto_116047 ) ) ( not ( = ?auto_116045 ?auto_116049 ) ) ( not ( = ?auto_116045 ?auto_116051 ) ) ( not ( = ?auto_116046 ?auto_116049 ) ) ( not ( = ?auto_116046 ?auto_116051 ) ) ( ON ?auto_116045 ?auto_116052 ) ( not ( = ?auto_116045 ?auto_116052 ) ) ( not ( = ?auto_116046 ?auto_116052 ) ) ( not ( = ?auto_116047 ?auto_116052 ) ) ( not ( = ?auto_116048 ?auto_116052 ) ) ( not ( = ?auto_116050 ?auto_116052 ) ) ( not ( = ?auto_116049 ?auto_116052 ) ) ( not ( = ?auto_116051 ?auto_116052 ) ) ( ON ?auto_116046 ?auto_116045 ) ( ON-TABLE ?auto_116052 ) ( ON ?auto_116047 ?auto_116046 ) ( ON ?auto_116048 ?auto_116047 ) ( ON ?auto_116050 ?auto_116048 ) ( ON ?auto_116051 ?auto_116050 ) ( CLEAR ?auto_116051 ) ( HOLDING ?auto_116049 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116049 )
      ( MAKE-4PILE ?auto_116045 ?auto_116046 ?auto_116047 ?auto_116048 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_116053 - BLOCK
      ?auto_116054 - BLOCK
      ?auto_116055 - BLOCK
      ?auto_116056 - BLOCK
    )
    :vars
    (
      ?auto_116057 - BLOCK
      ?auto_116060 - BLOCK
      ?auto_116058 - BLOCK
      ?auto_116059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116053 ?auto_116054 ) ) ( not ( = ?auto_116053 ?auto_116055 ) ) ( not ( = ?auto_116053 ?auto_116056 ) ) ( not ( = ?auto_116054 ?auto_116055 ) ) ( not ( = ?auto_116054 ?auto_116056 ) ) ( not ( = ?auto_116055 ?auto_116056 ) ) ( not ( = ?auto_116053 ?auto_116057 ) ) ( not ( = ?auto_116054 ?auto_116057 ) ) ( not ( = ?auto_116055 ?auto_116057 ) ) ( not ( = ?auto_116056 ?auto_116057 ) ) ( not ( = ?auto_116060 ?auto_116058 ) ) ( not ( = ?auto_116060 ?auto_116057 ) ) ( not ( = ?auto_116060 ?auto_116056 ) ) ( not ( = ?auto_116060 ?auto_116055 ) ) ( not ( = ?auto_116058 ?auto_116057 ) ) ( not ( = ?auto_116058 ?auto_116056 ) ) ( not ( = ?auto_116058 ?auto_116055 ) ) ( not ( = ?auto_116053 ?auto_116060 ) ) ( not ( = ?auto_116053 ?auto_116058 ) ) ( not ( = ?auto_116054 ?auto_116060 ) ) ( not ( = ?auto_116054 ?auto_116058 ) ) ( ON ?auto_116053 ?auto_116059 ) ( not ( = ?auto_116053 ?auto_116059 ) ) ( not ( = ?auto_116054 ?auto_116059 ) ) ( not ( = ?auto_116055 ?auto_116059 ) ) ( not ( = ?auto_116056 ?auto_116059 ) ) ( not ( = ?auto_116057 ?auto_116059 ) ) ( not ( = ?auto_116060 ?auto_116059 ) ) ( not ( = ?auto_116058 ?auto_116059 ) ) ( ON ?auto_116054 ?auto_116053 ) ( ON-TABLE ?auto_116059 ) ( ON ?auto_116055 ?auto_116054 ) ( ON ?auto_116056 ?auto_116055 ) ( ON ?auto_116057 ?auto_116056 ) ( ON ?auto_116058 ?auto_116057 ) ( ON ?auto_116060 ?auto_116058 ) ( CLEAR ?auto_116060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116059 ?auto_116053 ?auto_116054 ?auto_116055 ?auto_116056 ?auto_116057 ?auto_116058 )
      ( MAKE-4PILE ?auto_116053 ?auto_116054 ?auto_116055 ?auto_116056 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116076 - BLOCK
      ?auto_116077 - BLOCK
    )
    :vars
    (
      ?auto_116079 - BLOCK
      ?auto_116080 - BLOCK
      ?auto_116078 - BLOCK
      ?auto_116081 - BLOCK
      ?auto_116082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116079 ?auto_116077 ) ( ON-TABLE ?auto_116076 ) ( ON ?auto_116077 ?auto_116076 ) ( not ( = ?auto_116076 ?auto_116077 ) ) ( not ( = ?auto_116076 ?auto_116079 ) ) ( not ( = ?auto_116077 ?auto_116079 ) ) ( not ( = ?auto_116076 ?auto_116080 ) ) ( not ( = ?auto_116076 ?auto_116078 ) ) ( not ( = ?auto_116077 ?auto_116080 ) ) ( not ( = ?auto_116077 ?auto_116078 ) ) ( not ( = ?auto_116079 ?auto_116080 ) ) ( not ( = ?auto_116079 ?auto_116078 ) ) ( not ( = ?auto_116080 ?auto_116078 ) ) ( ON ?auto_116080 ?auto_116079 ) ( CLEAR ?auto_116080 ) ( HOLDING ?auto_116078 ) ( CLEAR ?auto_116081 ) ( ON-TABLE ?auto_116082 ) ( ON ?auto_116081 ?auto_116082 ) ( not ( = ?auto_116082 ?auto_116081 ) ) ( not ( = ?auto_116082 ?auto_116078 ) ) ( not ( = ?auto_116081 ?auto_116078 ) ) ( not ( = ?auto_116076 ?auto_116081 ) ) ( not ( = ?auto_116076 ?auto_116082 ) ) ( not ( = ?auto_116077 ?auto_116081 ) ) ( not ( = ?auto_116077 ?auto_116082 ) ) ( not ( = ?auto_116079 ?auto_116081 ) ) ( not ( = ?auto_116079 ?auto_116082 ) ) ( not ( = ?auto_116080 ?auto_116081 ) ) ( not ( = ?auto_116080 ?auto_116082 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116082 ?auto_116081 ?auto_116078 )
      ( MAKE-2PILE ?auto_116076 ?auto_116077 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116083 - BLOCK
      ?auto_116084 - BLOCK
    )
    :vars
    (
      ?auto_116087 - BLOCK
      ?auto_116088 - BLOCK
      ?auto_116085 - BLOCK
      ?auto_116089 - BLOCK
      ?auto_116086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116087 ?auto_116084 ) ( ON-TABLE ?auto_116083 ) ( ON ?auto_116084 ?auto_116083 ) ( not ( = ?auto_116083 ?auto_116084 ) ) ( not ( = ?auto_116083 ?auto_116087 ) ) ( not ( = ?auto_116084 ?auto_116087 ) ) ( not ( = ?auto_116083 ?auto_116088 ) ) ( not ( = ?auto_116083 ?auto_116085 ) ) ( not ( = ?auto_116084 ?auto_116088 ) ) ( not ( = ?auto_116084 ?auto_116085 ) ) ( not ( = ?auto_116087 ?auto_116088 ) ) ( not ( = ?auto_116087 ?auto_116085 ) ) ( not ( = ?auto_116088 ?auto_116085 ) ) ( ON ?auto_116088 ?auto_116087 ) ( CLEAR ?auto_116089 ) ( ON-TABLE ?auto_116086 ) ( ON ?auto_116089 ?auto_116086 ) ( not ( = ?auto_116086 ?auto_116089 ) ) ( not ( = ?auto_116086 ?auto_116085 ) ) ( not ( = ?auto_116089 ?auto_116085 ) ) ( not ( = ?auto_116083 ?auto_116089 ) ) ( not ( = ?auto_116083 ?auto_116086 ) ) ( not ( = ?auto_116084 ?auto_116089 ) ) ( not ( = ?auto_116084 ?auto_116086 ) ) ( not ( = ?auto_116087 ?auto_116089 ) ) ( not ( = ?auto_116087 ?auto_116086 ) ) ( not ( = ?auto_116088 ?auto_116089 ) ) ( not ( = ?auto_116088 ?auto_116086 ) ) ( ON ?auto_116085 ?auto_116088 ) ( CLEAR ?auto_116085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116083 ?auto_116084 ?auto_116087 ?auto_116088 )
      ( MAKE-2PILE ?auto_116083 ?auto_116084 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116090 - BLOCK
      ?auto_116091 - BLOCK
    )
    :vars
    (
      ?auto_116094 - BLOCK
      ?auto_116092 - BLOCK
      ?auto_116095 - BLOCK
      ?auto_116093 - BLOCK
      ?auto_116096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116094 ?auto_116091 ) ( ON-TABLE ?auto_116090 ) ( ON ?auto_116091 ?auto_116090 ) ( not ( = ?auto_116090 ?auto_116091 ) ) ( not ( = ?auto_116090 ?auto_116094 ) ) ( not ( = ?auto_116091 ?auto_116094 ) ) ( not ( = ?auto_116090 ?auto_116092 ) ) ( not ( = ?auto_116090 ?auto_116095 ) ) ( not ( = ?auto_116091 ?auto_116092 ) ) ( not ( = ?auto_116091 ?auto_116095 ) ) ( not ( = ?auto_116094 ?auto_116092 ) ) ( not ( = ?auto_116094 ?auto_116095 ) ) ( not ( = ?auto_116092 ?auto_116095 ) ) ( ON ?auto_116092 ?auto_116094 ) ( ON-TABLE ?auto_116093 ) ( not ( = ?auto_116093 ?auto_116096 ) ) ( not ( = ?auto_116093 ?auto_116095 ) ) ( not ( = ?auto_116096 ?auto_116095 ) ) ( not ( = ?auto_116090 ?auto_116096 ) ) ( not ( = ?auto_116090 ?auto_116093 ) ) ( not ( = ?auto_116091 ?auto_116096 ) ) ( not ( = ?auto_116091 ?auto_116093 ) ) ( not ( = ?auto_116094 ?auto_116096 ) ) ( not ( = ?auto_116094 ?auto_116093 ) ) ( not ( = ?auto_116092 ?auto_116096 ) ) ( not ( = ?auto_116092 ?auto_116093 ) ) ( ON ?auto_116095 ?auto_116092 ) ( CLEAR ?auto_116095 ) ( HOLDING ?auto_116096 ) ( CLEAR ?auto_116093 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116093 ?auto_116096 )
      ( MAKE-2PILE ?auto_116090 ?auto_116091 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116097 - BLOCK
      ?auto_116098 - BLOCK
    )
    :vars
    (
      ?auto_116099 - BLOCK
      ?auto_116100 - BLOCK
      ?auto_116102 - BLOCK
      ?auto_116103 - BLOCK
      ?auto_116101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116099 ?auto_116098 ) ( ON-TABLE ?auto_116097 ) ( ON ?auto_116098 ?auto_116097 ) ( not ( = ?auto_116097 ?auto_116098 ) ) ( not ( = ?auto_116097 ?auto_116099 ) ) ( not ( = ?auto_116098 ?auto_116099 ) ) ( not ( = ?auto_116097 ?auto_116100 ) ) ( not ( = ?auto_116097 ?auto_116102 ) ) ( not ( = ?auto_116098 ?auto_116100 ) ) ( not ( = ?auto_116098 ?auto_116102 ) ) ( not ( = ?auto_116099 ?auto_116100 ) ) ( not ( = ?auto_116099 ?auto_116102 ) ) ( not ( = ?auto_116100 ?auto_116102 ) ) ( ON ?auto_116100 ?auto_116099 ) ( ON-TABLE ?auto_116103 ) ( not ( = ?auto_116103 ?auto_116101 ) ) ( not ( = ?auto_116103 ?auto_116102 ) ) ( not ( = ?auto_116101 ?auto_116102 ) ) ( not ( = ?auto_116097 ?auto_116101 ) ) ( not ( = ?auto_116097 ?auto_116103 ) ) ( not ( = ?auto_116098 ?auto_116101 ) ) ( not ( = ?auto_116098 ?auto_116103 ) ) ( not ( = ?auto_116099 ?auto_116101 ) ) ( not ( = ?auto_116099 ?auto_116103 ) ) ( not ( = ?auto_116100 ?auto_116101 ) ) ( not ( = ?auto_116100 ?auto_116103 ) ) ( ON ?auto_116102 ?auto_116100 ) ( CLEAR ?auto_116103 ) ( ON ?auto_116101 ?auto_116102 ) ( CLEAR ?auto_116101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116097 ?auto_116098 ?auto_116099 ?auto_116100 ?auto_116102 )
      ( MAKE-2PILE ?auto_116097 ?auto_116098 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116104 - BLOCK
      ?auto_116105 - BLOCK
    )
    :vars
    (
      ?auto_116109 - BLOCK
      ?auto_116106 - BLOCK
      ?auto_116110 - BLOCK
      ?auto_116108 - BLOCK
      ?auto_116107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116109 ?auto_116105 ) ( ON-TABLE ?auto_116104 ) ( ON ?auto_116105 ?auto_116104 ) ( not ( = ?auto_116104 ?auto_116105 ) ) ( not ( = ?auto_116104 ?auto_116109 ) ) ( not ( = ?auto_116105 ?auto_116109 ) ) ( not ( = ?auto_116104 ?auto_116106 ) ) ( not ( = ?auto_116104 ?auto_116110 ) ) ( not ( = ?auto_116105 ?auto_116106 ) ) ( not ( = ?auto_116105 ?auto_116110 ) ) ( not ( = ?auto_116109 ?auto_116106 ) ) ( not ( = ?auto_116109 ?auto_116110 ) ) ( not ( = ?auto_116106 ?auto_116110 ) ) ( ON ?auto_116106 ?auto_116109 ) ( not ( = ?auto_116108 ?auto_116107 ) ) ( not ( = ?auto_116108 ?auto_116110 ) ) ( not ( = ?auto_116107 ?auto_116110 ) ) ( not ( = ?auto_116104 ?auto_116107 ) ) ( not ( = ?auto_116104 ?auto_116108 ) ) ( not ( = ?auto_116105 ?auto_116107 ) ) ( not ( = ?auto_116105 ?auto_116108 ) ) ( not ( = ?auto_116109 ?auto_116107 ) ) ( not ( = ?auto_116109 ?auto_116108 ) ) ( not ( = ?auto_116106 ?auto_116107 ) ) ( not ( = ?auto_116106 ?auto_116108 ) ) ( ON ?auto_116110 ?auto_116106 ) ( ON ?auto_116107 ?auto_116110 ) ( CLEAR ?auto_116107 ) ( HOLDING ?auto_116108 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116108 )
      ( MAKE-2PILE ?auto_116104 ?auto_116105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116120 - BLOCK
      ?auto_116121 - BLOCK
    )
    :vars
    (
      ?auto_116126 - BLOCK
      ?auto_116123 - BLOCK
      ?auto_116124 - BLOCK
      ?auto_116125 - BLOCK
      ?auto_116122 - BLOCK
      ?auto_116127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116126 ?auto_116121 ) ( ON-TABLE ?auto_116120 ) ( ON ?auto_116121 ?auto_116120 ) ( not ( = ?auto_116120 ?auto_116121 ) ) ( not ( = ?auto_116120 ?auto_116126 ) ) ( not ( = ?auto_116121 ?auto_116126 ) ) ( not ( = ?auto_116120 ?auto_116123 ) ) ( not ( = ?auto_116120 ?auto_116124 ) ) ( not ( = ?auto_116121 ?auto_116123 ) ) ( not ( = ?auto_116121 ?auto_116124 ) ) ( not ( = ?auto_116126 ?auto_116123 ) ) ( not ( = ?auto_116126 ?auto_116124 ) ) ( not ( = ?auto_116123 ?auto_116124 ) ) ( ON ?auto_116123 ?auto_116126 ) ( not ( = ?auto_116125 ?auto_116122 ) ) ( not ( = ?auto_116125 ?auto_116124 ) ) ( not ( = ?auto_116122 ?auto_116124 ) ) ( not ( = ?auto_116120 ?auto_116122 ) ) ( not ( = ?auto_116120 ?auto_116125 ) ) ( not ( = ?auto_116121 ?auto_116122 ) ) ( not ( = ?auto_116121 ?auto_116125 ) ) ( not ( = ?auto_116126 ?auto_116122 ) ) ( not ( = ?auto_116126 ?auto_116125 ) ) ( not ( = ?auto_116123 ?auto_116122 ) ) ( not ( = ?auto_116123 ?auto_116125 ) ) ( ON ?auto_116124 ?auto_116123 ) ( ON ?auto_116122 ?auto_116124 ) ( CLEAR ?auto_116122 ) ( ON ?auto_116125 ?auto_116127 ) ( CLEAR ?auto_116125 ) ( HAND-EMPTY ) ( not ( = ?auto_116120 ?auto_116127 ) ) ( not ( = ?auto_116121 ?auto_116127 ) ) ( not ( = ?auto_116126 ?auto_116127 ) ) ( not ( = ?auto_116123 ?auto_116127 ) ) ( not ( = ?auto_116124 ?auto_116127 ) ) ( not ( = ?auto_116125 ?auto_116127 ) ) ( not ( = ?auto_116122 ?auto_116127 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116125 ?auto_116127 )
      ( MAKE-2PILE ?auto_116120 ?auto_116121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116128 - BLOCK
      ?auto_116129 - BLOCK
    )
    :vars
    (
      ?auto_116130 - BLOCK
      ?auto_116132 - BLOCK
      ?auto_116131 - BLOCK
      ?auto_116135 - BLOCK
      ?auto_116133 - BLOCK
      ?auto_116134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116130 ?auto_116129 ) ( ON-TABLE ?auto_116128 ) ( ON ?auto_116129 ?auto_116128 ) ( not ( = ?auto_116128 ?auto_116129 ) ) ( not ( = ?auto_116128 ?auto_116130 ) ) ( not ( = ?auto_116129 ?auto_116130 ) ) ( not ( = ?auto_116128 ?auto_116132 ) ) ( not ( = ?auto_116128 ?auto_116131 ) ) ( not ( = ?auto_116129 ?auto_116132 ) ) ( not ( = ?auto_116129 ?auto_116131 ) ) ( not ( = ?auto_116130 ?auto_116132 ) ) ( not ( = ?auto_116130 ?auto_116131 ) ) ( not ( = ?auto_116132 ?auto_116131 ) ) ( ON ?auto_116132 ?auto_116130 ) ( not ( = ?auto_116135 ?auto_116133 ) ) ( not ( = ?auto_116135 ?auto_116131 ) ) ( not ( = ?auto_116133 ?auto_116131 ) ) ( not ( = ?auto_116128 ?auto_116133 ) ) ( not ( = ?auto_116128 ?auto_116135 ) ) ( not ( = ?auto_116129 ?auto_116133 ) ) ( not ( = ?auto_116129 ?auto_116135 ) ) ( not ( = ?auto_116130 ?auto_116133 ) ) ( not ( = ?auto_116130 ?auto_116135 ) ) ( not ( = ?auto_116132 ?auto_116133 ) ) ( not ( = ?auto_116132 ?auto_116135 ) ) ( ON ?auto_116131 ?auto_116132 ) ( ON ?auto_116135 ?auto_116134 ) ( CLEAR ?auto_116135 ) ( not ( = ?auto_116128 ?auto_116134 ) ) ( not ( = ?auto_116129 ?auto_116134 ) ) ( not ( = ?auto_116130 ?auto_116134 ) ) ( not ( = ?auto_116132 ?auto_116134 ) ) ( not ( = ?auto_116131 ?auto_116134 ) ) ( not ( = ?auto_116135 ?auto_116134 ) ) ( not ( = ?auto_116133 ?auto_116134 ) ) ( HOLDING ?auto_116133 ) ( CLEAR ?auto_116131 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116128 ?auto_116129 ?auto_116130 ?auto_116132 ?auto_116131 ?auto_116133 )
      ( MAKE-2PILE ?auto_116128 ?auto_116129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116136 - BLOCK
      ?auto_116137 - BLOCK
    )
    :vars
    (
      ?auto_116141 - BLOCK
      ?auto_116138 - BLOCK
      ?auto_116140 - BLOCK
      ?auto_116142 - BLOCK
      ?auto_116143 - BLOCK
      ?auto_116139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116141 ?auto_116137 ) ( ON-TABLE ?auto_116136 ) ( ON ?auto_116137 ?auto_116136 ) ( not ( = ?auto_116136 ?auto_116137 ) ) ( not ( = ?auto_116136 ?auto_116141 ) ) ( not ( = ?auto_116137 ?auto_116141 ) ) ( not ( = ?auto_116136 ?auto_116138 ) ) ( not ( = ?auto_116136 ?auto_116140 ) ) ( not ( = ?auto_116137 ?auto_116138 ) ) ( not ( = ?auto_116137 ?auto_116140 ) ) ( not ( = ?auto_116141 ?auto_116138 ) ) ( not ( = ?auto_116141 ?auto_116140 ) ) ( not ( = ?auto_116138 ?auto_116140 ) ) ( ON ?auto_116138 ?auto_116141 ) ( not ( = ?auto_116142 ?auto_116143 ) ) ( not ( = ?auto_116142 ?auto_116140 ) ) ( not ( = ?auto_116143 ?auto_116140 ) ) ( not ( = ?auto_116136 ?auto_116143 ) ) ( not ( = ?auto_116136 ?auto_116142 ) ) ( not ( = ?auto_116137 ?auto_116143 ) ) ( not ( = ?auto_116137 ?auto_116142 ) ) ( not ( = ?auto_116141 ?auto_116143 ) ) ( not ( = ?auto_116141 ?auto_116142 ) ) ( not ( = ?auto_116138 ?auto_116143 ) ) ( not ( = ?auto_116138 ?auto_116142 ) ) ( ON ?auto_116140 ?auto_116138 ) ( ON ?auto_116142 ?auto_116139 ) ( not ( = ?auto_116136 ?auto_116139 ) ) ( not ( = ?auto_116137 ?auto_116139 ) ) ( not ( = ?auto_116141 ?auto_116139 ) ) ( not ( = ?auto_116138 ?auto_116139 ) ) ( not ( = ?auto_116140 ?auto_116139 ) ) ( not ( = ?auto_116142 ?auto_116139 ) ) ( not ( = ?auto_116143 ?auto_116139 ) ) ( CLEAR ?auto_116140 ) ( ON ?auto_116143 ?auto_116142 ) ( CLEAR ?auto_116143 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116139 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116139 ?auto_116142 )
      ( MAKE-2PILE ?auto_116136 ?auto_116137 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116144 - BLOCK
      ?auto_116145 - BLOCK
    )
    :vars
    (
      ?auto_116148 - BLOCK
      ?auto_116149 - BLOCK
      ?auto_116151 - BLOCK
      ?auto_116146 - BLOCK
      ?auto_116147 - BLOCK
      ?auto_116150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116148 ?auto_116145 ) ( ON-TABLE ?auto_116144 ) ( ON ?auto_116145 ?auto_116144 ) ( not ( = ?auto_116144 ?auto_116145 ) ) ( not ( = ?auto_116144 ?auto_116148 ) ) ( not ( = ?auto_116145 ?auto_116148 ) ) ( not ( = ?auto_116144 ?auto_116149 ) ) ( not ( = ?auto_116144 ?auto_116151 ) ) ( not ( = ?auto_116145 ?auto_116149 ) ) ( not ( = ?auto_116145 ?auto_116151 ) ) ( not ( = ?auto_116148 ?auto_116149 ) ) ( not ( = ?auto_116148 ?auto_116151 ) ) ( not ( = ?auto_116149 ?auto_116151 ) ) ( ON ?auto_116149 ?auto_116148 ) ( not ( = ?auto_116146 ?auto_116147 ) ) ( not ( = ?auto_116146 ?auto_116151 ) ) ( not ( = ?auto_116147 ?auto_116151 ) ) ( not ( = ?auto_116144 ?auto_116147 ) ) ( not ( = ?auto_116144 ?auto_116146 ) ) ( not ( = ?auto_116145 ?auto_116147 ) ) ( not ( = ?auto_116145 ?auto_116146 ) ) ( not ( = ?auto_116148 ?auto_116147 ) ) ( not ( = ?auto_116148 ?auto_116146 ) ) ( not ( = ?auto_116149 ?auto_116147 ) ) ( not ( = ?auto_116149 ?auto_116146 ) ) ( ON ?auto_116146 ?auto_116150 ) ( not ( = ?auto_116144 ?auto_116150 ) ) ( not ( = ?auto_116145 ?auto_116150 ) ) ( not ( = ?auto_116148 ?auto_116150 ) ) ( not ( = ?auto_116149 ?auto_116150 ) ) ( not ( = ?auto_116151 ?auto_116150 ) ) ( not ( = ?auto_116146 ?auto_116150 ) ) ( not ( = ?auto_116147 ?auto_116150 ) ) ( ON ?auto_116147 ?auto_116146 ) ( CLEAR ?auto_116147 ) ( ON-TABLE ?auto_116150 ) ( HOLDING ?auto_116151 ) ( CLEAR ?auto_116149 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116144 ?auto_116145 ?auto_116148 ?auto_116149 ?auto_116151 )
      ( MAKE-2PILE ?auto_116144 ?auto_116145 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116195 - BLOCK
      ?auto_116196 - BLOCK
      ?auto_116197 - BLOCK
      ?auto_116198 - BLOCK
      ?auto_116199 - BLOCK
    )
    :vars
    (
      ?auto_116200 - BLOCK
      ?auto_116201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116195 ) ( ON ?auto_116196 ?auto_116195 ) ( ON ?auto_116197 ?auto_116196 ) ( not ( = ?auto_116195 ?auto_116196 ) ) ( not ( = ?auto_116195 ?auto_116197 ) ) ( not ( = ?auto_116195 ?auto_116198 ) ) ( not ( = ?auto_116195 ?auto_116199 ) ) ( not ( = ?auto_116196 ?auto_116197 ) ) ( not ( = ?auto_116196 ?auto_116198 ) ) ( not ( = ?auto_116196 ?auto_116199 ) ) ( not ( = ?auto_116197 ?auto_116198 ) ) ( not ( = ?auto_116197 ?auto_116199 ) ) ( not ( = ?auto_116198 ?auto_116199 ) ) ( ON ?auto_116199 ?auto_116200 ) ( not ( = ?auto_116195 ?auto_116200 ) ) ( not ( = ?auto_116196 ?auto_116200 ) ) ( not ( = ?auto_116197 ?auto_116200 ) ) ( not ( = ?auto_116198 ?auto_116200 ) ) ( not ( = ?auto_116199 ?auto_116200 ) ) ( CLEAR ?auto_116197 ) ( ON ?auto_116198 ?auto_116199 ) ( CLEAR ?auto_116198 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116201 ) ( ON ?auto_116200 ?auto_116201 ) ( not ( = ?auto_116201 ?auto_116200 ) ) ( not ( = ?auto_116201 ?auto_116199 ) ) ( not ( = ?auto_116201 ?auto_116198 ) ) ( not ( = ?auto_116195 ?auto_116201 ) ) ( not ( = ?auto_116196 ?auto_116201 ) ) ( not ( = ?auto_116197 ?auto_116201 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116201 ?auto_116200 ?auto_116199 )
      ( MAKE-5PILE ?auto_116195 ?auto_116196 ?auto_116197 ?auto_116198 ?auto_116199 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116202 - BLOCK
      ?auto_116203 - BLOCK
      ?auto_116204 - BLOCK
      ?auto_116205 - BLOCK
      ?auto_116206 - BLOCK
    )
    :vars
    (
      ?auto_116208 - BLOCK
      ?auto_116207 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116202 ) ( ON ?auto_116203 ?auto_116202 ) ( not ( = ?auto_116202 ?auto_116203 ) ) ( not ( = ?auto_116202 ?auto_116204 ) ) ( not ( = ?auto_116202 ?auto_116205 ) ) ( not ( = ?auto_116202 ?auto_116206 ) ) ( not ( = ?auto_116203 ?auto_116204 ) ) ( not ( = ?auto_116203 ?auto_116205 ) ) ( not ( = ?auto_116203 ?auto_116206 ) ) ( not ( = ?auto_116204 ?auto_116205 ) ) ( not ( = ?auto_116204 ?auto_116206 ) ) ( not ( = ?auto_116205 ?auto_116206 ) ) ( ON ?auto_116206 ?auto_116208 ) ( not ( = ?auto_116202 ?auto_116208 ) ) ( not ( = ?auto_116203 ?auto_116208 ) ) ( not ( = ?auto_116204 ?auto_116208 ) ) ( not ( = ?auto_116205 ?auto_116208 ) ) ( not ( = ?auto_116206 ?auto_116208 ) ) ( ON ?auto_116205 ?auto_116206 ) ( CLEAR ?auto_116205 ) ( ON-TABLE ?auto_116207 ) ( ON ?auto_116208 ?auto_116207 ) ( not ( = ?auto_116207 ?auto_116208 ) ) ( not ( = ?auto_116207 ?auto_116206 ) ) ( not ( = ?auto_116207 ?auto_116205 ) ) ( not ( = ?auto_116202 ?auto_116207 ) ) ( not ( = ?auto_116203 ?auto_116207 ) ) ( not ( = ?auto_116204 ?auto_116207 ) ) ( HOLDING ?auto_116204 ) ( CLEAR ?auto_116203 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116202 ?auto_116203 ?auto_116204 )
      ( MAKE-5PILE ?auto_116202 ?auto_116203 ?auto_116204 ?auto_116205 ?auto_116206 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116209 - BLOCK
      ?auto_116210 - BLOCK
      ?auto_116211 - BLOCK
      ?auto_116212 - BLOCK
      ?auto_116213 - BLOCK
    )
    :vars
    (
      ?auto_116214 - BLOCK
      ?auto_116215 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116209 ) ( ON ?auto_116210 ?auto_116209 ) ( not ( = ?auto_116209 ?auto_116210 ) ) ( not ( = ?auto_116209 ?auto_116211 ) ) ( not ( = ?auto_116209 ?auto_116212 ) ) ( not ( = ?auto_116209 ?auto_116213 ) ) ( not ( = ?auto_116210 ?auto_116211 ) ) ( not ( = ?auto_116210 ?auto_116212 ) ) ( not ( = ?auto_116210 ?auto_116213 ) ) ( not ( = ?auto_116211 ?auto_116212 ) ) ( not ( = ?auto_116211 ?auto_116213 ) ) ( not ( = ?auto_116212 ?auto_116213 ) ) ( ON ?auto_116213 ?auto_116214 ) ( not ( = ?auto_116209 ?auto_116214 ) ) ( not ( = ?auto_116210 ?auto_116214 ) ) ( not ( = ?auto_116211 ?auto_116214 ) ) ( not ( = ?auto_116212 ?auto_116214 ) ) ( not ( = ?auto_116213 ?auto_116214 ) ) ( ON ?auto_116212 ?auto_116213 ) ( ON-TABLE ?auto_116215 ) ( ON ?auto_116214 ?auto_116215 ) ( not ( = ?auto_116215 ?auto_116214 ) ) ( not ( = ?auto_116215 ?auto_116213 ) ) ( not ( = ?auto_116215 ?auto_116212 ) ) ( not ( = ?auto_116209 ?auto_116215 ) ) ( not ( = ?auto_116210 ?auto_116215 ) ) ( not ( = ?auto_116211 ?auto_116215 ) ) ( CLEAR ?auto_116210 ) ( ON ?auto_116211 ?auto_116212 ) ( CLEAR ?auto_116211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116215 ?auto_116214 ?auto_116213 ?auto_116212 )
      ( MAKE-5PILE ?auto_116209 ?auto_116210 ?auto_116211 ?auto_116212 ?auto_116213 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116216 - BLOCK
      ?auto_116217 - BLOCK
      ?auto_116218 - BLOCK
      ?auto_116219 - BLOCK
      ?auto_116220 - BLOCK
    )
    :vars
    (
      ?auto_116222 - BLOCK
      ?auto_116221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116216 ) ( not ( = ?auto_116216 ?auto_116217 ) ) ( not ( = ?auto_116216 ?auto_116218 ) ) ( not ( = ?auto_116216 ?auto_116219 ) ) ( not ( = ?auto_116216 ?auto_116220 ) ) ( not ( = ?auto_116217 ?auto_116218 ) ) ( not ( = ?auto_116217 ?auto_116219 ) ) ( not ( = ?auto_116217 ?auto_116220 ) ) ( not ( = ?auto_116218 ?auto_116219 ) ) ( not ( = ?auto_116218 ?auto_116220 ) ) ( not ( = ?auto_116219 ?auto_116220 ) ) ( ON ?auto_116220 ?auto_116222 ) ( not ( = ?auto_116216 ?auto_116222 ) ) ( not ( = ?auto_116217 ?auto_116222 ) ) ( not ( = ?auto_116218 ?auto_116222 ) ) ( not ( = ?auto_116219 ?auto_116222 ) ) ( not ( = ?auto_116220 ?auto_116222 ) ) ( ON ?auto_116219 ?auto_116220 ) ( ON-TABLE ?auto_116221 ) ( ON ?auto_116222 ?auto_116221 ) ( not ( = ?auto_116221 ?auto_116222 ) ) ( not ( = ?auto_116221 ?auto_116220 ) ) ( not ( = ?auto_116221 ?auto_116219 ) ) ( not ( = ?auto_116216 ?auto_116221 ) ) ( not ( = ?auto_116217 ?auto_116221 ) ) ( not ( = ?auto_116218 ?auto_116221 ) ) ( ON ?auto_116218 ?auto_116219 ) ( CLEAR ?auto_116218 ) ( HOLDING ?auto_116217 ) ( CLEAR ?auto_116216 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116216 ?auto_116217 )
      ( MAKE-5PILE ?auto_116216 ?auto_116217 ?auto_116218 ?auto_116219 ?auto_116220 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116223 - BLOCK
      ?auto_116224 - BLOCK
      ?auto_116225 - BLOCK
      ?auto_116226 - BLOCK
      ?auto_116227 - BLOCK
    )
    :vars
    (
      ?auto_116229 - BLOCK
      ?auto_116228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116223 ) ( not ( = ?auto_116223 ?auto_116224 ) ) ( not ( = ?auto_116223 ?auto_116225 ) ) ( not ( = ?auto_116223 ?auto_116226 ) ) ( not ( = ?auto_116223 ?auto_116227 ) ) ( not ( = ?auto_116224 ?auto_116225 ) ) ( not ( = ?auto_116224 ?auto_116226 ) ) ( not ( = ?auto_116224 ?auto_116227 ) ) ( not ( = ?auto_116225 ?auto_116226 ) ) ( not ( = ?auto_116225 ?auto_116227 ) ) ( not ( = ?auto_116226 ?auto_116227 ) ) ( ON ?auto_116227 ?auto_116229 ) ( not ( = ?auto_116223 ?auto_116229 ) ) ( not ( = ?auto_116224 ?auto_116229 ) ) ( not ( = ?auto_116225 ?auto_116229 ) ) ( not ( = ?auto_116226 ?auto_116229 ) ) ( not ( = ?auto_116227 ?auto_116229 ) ) ( ON ?auto_116226 ?auto_116227 ) ( ON-TABLE ?auto_116228 ) ( ON ?auto_116229 ?auto_116228 ) ( not ( = ?auto_116228 ?auto_116229 ) ) ( not ( = ?auto_116228 ?auto_116227 ) ) ( not ( = ?auto_116228 ?auto_116226 ) ) ( not ( = ?auto_116223 ?auto_116228 ) ) ( not ( = ?auto_116224 ?auto_116228 ) ) ( not ( = ?auto_116225 ?auto_116228 ) ) ( ON ?auto_116225 ?auto_116226 ) ( CLEAR ?auto_116223 ) ( ON ?auto_116224 ?auto_116225 ) ( CLEAR ?auto_116224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116228 ?auto_116229 ?auto_116227 ?auto_116226 ?auto_116225 )
      ( MAKE-5PILE ?auto_116223 ?auto_116224 ?auto_116225 ?auto_116226 ?auto_116227 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116230 - BLOCK
      ?auto_116231 - BLOCK
      ?auto_116232 - BLOCK
      ?auto_116233 - BLOCK
      ?auto_116234 - BLOCK
    )
    :vars
    (
      ?auto_116235 - BLOCK
      ?auto_116236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116230 ?auto_116231 ) ) ( not ( = ?auto_116230 ?auto_116232 ) ) ( not ( = ?auto_116230 ?auto_116233 ) ) ( not ( = ?auto_116230 ?auto_116234 ) ) ( not ( = ?auto_116231 ?auto_116232 ) ) ( not ( = ?auto_116231 ?auto_116233 ) ) ( not ( = ?auto_116231 ?auto_116234 ) ) ( not ( = ?auto_116232 ?auto_116233 ) ) ( not ( = ?auto_116232 ?auto_116234 ) ) ( not ( = ?auto_116233 ?auto_116234 ) ) ( ON ?auto_116234 ?auto_116235 ) ( not ( = ?auto_116230 ?auto_116235 ) ) ( not ( = ?auto_116231 ?auto_116235 ) ) ( not ( = ?auto_116232 ?auto_116235 ) ) ( not ( = ?auto_116233 ?auto_116235 ) ) ( not ( = ?auto_116234 ?auto_116235 ) ) ( ON ?auto_116233 ?auto_116234 ) ( ON-TABLE ?auto_116236 ) ( ON ?auto_116235 ?auto_116236 ) ( not ( = ?auto_116236 ?auto_116235 ) ) ( not ( = ?auto_116236 ?auto_116234 ) ) ( not ( = ?auto_116236 ?auto_116233 ) ) ( not ( = ?auto_116230 ?auto_116236 ) ) ( not ( = ?auto_116231 ?auto_116236 ) ) ( not ( = ?auto_116232 ?auto_116236 ) ) ( ON ?auto_116232 ?auto_116233 ) ( ON ?auto_116231 ?auto_116232 ) ( CLEAR ?auto_116231 ) ( HOLDING ?auto_116230 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116230 )
      ( MAKE-5PILE ?auto_116230 ?auto_116231 ?auto_116232 ?auto_116233 ?auto_116234 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116237 - BLOCK
      ?auto_116238 - BLOCK
      ?auto_116239 - BLOCK
      ?auto_116240 - BLOCK
      ?auto_116241 - BLOCK
    )
    :vars
    (
      ?auto_116243 - BLOCK
      ?auto_116242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116237 ?auto_116238 ) ) ( not ( = ?auto_116237 ?auto_116239 ) ) ( not ( = ?auto_116237 ?auto_116240 ) ) ( not ( = ?auto_116237 ?auto_116241 ) ) ( not ( = ?auto_116238 ?auto_116239 ) ) ( not ( = ?auto_116238 ?auto_116240 ) ) ( not ( = ?auto_116238 ?auto_116241 ) ) ( not ( = ?auto_116239 ?auto_116240 ) ) ( not ( = ?auto_116239 ?auto_116241 ) ) ( not ( = ?auto_116240 ?auto_116241 ) ) ( ON ?auto_116241 ?auto_116243 ) ( not ( = ?auto_116237 ?auto_116243 ) ) ( not ( = ?auto_116238 ?auto_116243 ) ) ( not ( = ?auto_116239 ?auto_116243 ) ) ( not ( = ?auto_116240 ?auto_116243 ) ) ( not ( = ?auto_116241 ?auto_116243 ) ) ( ON ?auto_116240 ?auto_116241 ) ( ON-TABLE ?auto_116242 ) ( ON ?auto_116243 ?auto_116242 ) ( not ( = ?auto_116242 ?auto_116243 ) ) ( not ( = ?auto_116242 ?auto_116241 ) ) ( not ( = ?auto_116242 ?auto_116240 ) ) ( not ( = ?auto_116237 ?auto_116242 ) ) ( not ( = ?auto_116238 ?auto_116242 ) ) ( not ( = ?auto_116239 ?auto_116242 ) ) ( ON ?auto_116239 ?auto_116240 ) ( ON ?auto_116238 ?auto_116239 ) ( ON ?auto_116237 ?auto_116238 ) ( CLEAR ?auto_116237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116242 ?auto_116243 ?auto_116241 ?auto_116240 ?auto_116239 ?auto_116238 )
      ( MAKE-5PILE ?auto_116237 ?auto_116238 ?auto_116239 ?auto_116240 ?auto_116241 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116249 - BLOCK
      ?auto_116250 - BLOCK
      ?auto_116251 - BLOCK
      ?auto_116252 - BLOCK
      ?auto_116253 - BLOCK
    )
    :vars
    (
      ?auto_116255 - BLOCK
      ?auto_116254 - BLOCK
      ?auto_116256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116249 ?auto_116250 ) ) ( not ( = ?auto_116249 ?auto_116251 ) ) ( not ( = ?auto_116249 ?auto_116252 ) ) ( not ( = ?auto_116249 ?auto_116253 ) ) ( not ( = ?auto_116250 ?auto_116251 ) ) ( not ( = ?auto_116250 ?auto_116252 ) ) ( not ( = ?auto_116250 ?auto_116253 ) ) ( not ( = ?auto_116251 ?auto_116252 ) ) ( not ( = ?auto_116251 ?auto_116253 ) ) ( not ( = ?auto_116252 ?auto_116253 ) ) ( ON ?auto_116253 ?auto_116255 ) ( not ( = ?auto_116249 ?auto_116255 ) ) ( not ( = ?auto_116250 ?auto_116255 ) ) ( not ( = ?auto_116251 ?auto_116255 ) ) ( not ( = ?auto_116252 ?auto_116255 ) ) ( not ( = ?auto_116253 ?auto_116255 ) ) ( ON ?auto_116252 ?auto_116253 ) ( ON-TABLE ?auto_116254 ) ( ON ?auto_116255 ?auto_116254 ) ( not ( = ?auto_116254 ?auto_116255 ) ) ( not ( = ?auto_116254 ?auto_116253 ) ) ( not ( = ?auto_116254 ?auto_116252 ) ) ( not ( = ?auto_116249 ?auto_116254 ) ) ( not ( = ?auto_116250 ?auto_116254 ) ) ( not ( = ?auto_116251 ?auto_116254 ) ) ( ON ?auto_116251 ?auto_116252 ) ( ON ?auto_116250 ?auto_116251 ) ( CLEAR ?auto_116250 ) ( ON ?auto_116249 ?auto_116256 ) ( CLEAR ?auto_116249 ) ( HAND-EMPTY ) ( not ( = ?auto_116249 ?auto_116256 ) ) ( not ( = ?auto_116250 ?auto_116256 ) ) ( not ( = ?auto_116251 ?auto_116256 ) ) ( not ( = ?auto_116252 ?auto_116256 ) ) ( not ( = ?auto_116253 ?auto_116256 ) ) ( not ( = ?auto_116255 ?auto_116256 ) ) ( not ( = ?auto_116254 ?auto_116256 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116249 ?auto_116256 )
      ( MAKE-5PILE ?auto_116249 ?auto_116250 ?auto_116251 ?auto_116252 ?auto_116253 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116257 - BLOCK
      ?auto_116258 - BLOCK
      ?auto_116259 - BLOCK
      ?auto_116260 - BLOCK
      ?auto_116261 - BLOCK
    )
    :vars
    (
      ?auto_116263 - BLOCK
      ?auto_116264 - BLOCK
      ?auto_116262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116257 ?auto_116258 ) ) ( not ( = ?auto_116257 ?auto_116259 ) ) ( not ( = ?auto_116257 ?auto_116260 ) ) ( not ( = ?auto_116257 ?auto_116261 ) ) ( not ( = ?auto_116258 ?auto_116259 ) ) ( not ( = ?auto_116258 ?auto_116260 ) ) ( not ( = ?auto_116258 ?auto_116261 ) ) ( not ( = ?auto_116259 ?auto_116260 ) ) ( not ( = ?auto_116259 ?auto_116261 ) ) ( not ( = ?auto_116260 ?auto_116261 ) ) ( ON ?auto_116261 ?auto_116263 ) ( not ( = ?auto_116257 ?auto_116263 ) ) ( not ( = ?auto_116258 ?auto_116263 ) ) ( not ( = ?auto_116259 ?auto_116263 ) ) ( not ( = ?auto_116260 ?auto_116263 ) ) ( not ( = ?auto_116261 ?auto_116263 ) ) ( ON ?auto_116260 ?auto_116261 ) ( ON-TABLE ?auto_116264 ) ( ON ?auto_116263 ?auto_116264 ) ( not ( = ?auto_116264 ?auto_116263 ) ) ( not ( = ?auto_116264 ?auto_116261 ) ) ( not ( = ?auto_116264 ?auto_116260 ) ) ( not ( = ?auto_116257 ?auto_116264 ) ) ( not ( = ?auto_116258 ?auto_116264 ) ) ( not ( = ?auto_116259 ?auto_116264 ) ) ( ON ?auto_116259 ?auto_116260 ) ( ON ?auto_116257 ?auto_116262 ) ( CLEAR ?auto_116257 ) ( not ( = ?auto_116257 ?auto_116262 ) ) ( not ( = ?auto_116258 ?auto_116262 ) ) ( not ( = ?auto_116259 ?auto_116262 ) ) ( not ( = ?auto_116260 ?auto_116262 ) ) ( not ( = ?auto_116261 ?auto_116262 ) ) ( not ( = ?auto_116263 ?auto_116262 ) ) ( not ( = ?auto_116264 ?auto_116262 ) ) ( HOLDING ?auto_116258 ) ( CLEAR ?auto_116259 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116264 ?auto_116263 ?auto_116261 ?auto_116260 ?auto_116259 ?auto_116258 )
      ( MAKE-5PILE ?auto_116257 ?auto_116258 ?auto_116259 ?auto_116260 ?auto_116261 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116265 - BLOCK
      ?auto_116266 - BLOCK
      ?auto_116267 - BLOCK
      ?auto_116268 - BLOCK
      ?auto_116269 - BLOCK
    )
    :vars
    (
      ?auto_116270 - BLOCK
      ?auto_116272 - BLOCK
      ?auto_116271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116265 ?auto_116266 ) ) ( not ( = ?auto_116265 ?auto_116267 ) ) ( not ( = ?auto_116265 ?auto_116268 ) ) ( not ( = ?auto_116265 ?auto_116269 ) ) ( not ( = ?auto_116266 ?auto_116267 ) ) ( not ( = ?auto_116266 ?auto_116268 ) ) ( not ( = ?auto_116266 ?auto_116269 ) ) ( not ( = ?auto_116267 ?auto_116268 ) ) ( not ( = ?auto_116267 ?auto_116269 ) ) ( not ( = ?auto_116268 ?auto_116269 ) ) ( ON ?auto_116269 ?auto_116270 ) ( not ( = ?auto_116265 ?auto_116270 ) ) ( not ( = ?auto_116266 ?auto_116270 ) ) ( not ( = ?auto_116267 ?auto_116270 ) ) ( not ( = ?auto_116268 ?auto_116270 ) ) ( not ( = ?auto_116269 ?auto_116270 ) ) ( ON ?auto_116268 ?auto_116269 ) ( ON-TABLE ?auto_116272 ) ( ON ?auto_116270 ?auto_116272 ) ( not ( = ?auto_116272 ?auto_116270 ) ) ( not ( = ?auto_116272 ?auto_116269 ) ) ( not ( = ?auto_116272 ?auto_116268 ) ) ( not ( = ?auto_116265 ?auto_116272 ) ) ( not ( = ?auto_116266 ?auto_116272 ) ) ( not ( = ?auto_116267 ?auto_116272 ) ) ( ON ?auto_116267 ?auto_116268 ) ( ON ?auto_116265 ?auto_116271 ) ( not ( = ?auto_116265 ?auto_116271 ) ) ( not ( = ?auto_116266 ?auto_116271 ) ) ( not ( = ?auto_116267 ?auto_116271 ) ) ( not ( = ?auto_116268 ?auto_116271 ) ) ( not ( = ?auto_116269 ?auto_116271 ) ) ( not ( = ?auto_116270 ?auto_116271 ) ) ( not ( = ?auto_116272 ?auto_116271 ) ) ( CLEAR ?auto_116267 ) ( ON ?auto_116266 ?auto_116265 ) ( CLEAR ?auto_116266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116271 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116271 ?auto_116265 )
      ( MAKE-5PILE ?auto_116265 ?auto_116266 ?auto_116267 ?auto_116268 ?auto_116269 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116273 - BLOCK
      ?auto_116274 - BLOCK
      ?auto_116275 - BLOCK
      ?auto_116276 - BLOCK
      ?auto_116277 - BLOCK
    )
    :vars
    (
      ?auto_116279 - BLOCK
      ?auto_116278 - BLOCK
      ?auto_116280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116273 ?auto_116274 ) ) ( not ( = ?auto_116273 ?auto_116275 ) ) ( not ( = ?auto_116273 ?auto_116276 ) ) ( not ( = ?auto_116273 ?auto_116277 ) ) ( not ( = ?auto_116274 ?auto_116275 ) ) ( not ( = ?auto_116274 ?auto_116276 ) ) ( not ( = ?auto_116274 ?auto_116277 ) ) ( not ( = ?auto_116275 ?auto_116276 ) ) ( not ( = ?auto_116275 ?auto_116277 ) ) ( not ( = ?auto_116276 ?auto_116277 ) ) ( ON ?auto_116277 ?auto_116279 ) ( not ( = ?auto_116273 ?auto_116279 ) ) ( not ( = ?auto_116274 ?auto_116279 ) ) ( not ( = ?auto_116275 ?auto_116279 ) ) ( not ( = ?auto_116276 ?auto_116279 ) ) ( not ( = ?auto_116277 ?auto_116279 ) ) ( ON ?auto_116276 ?auto_116277 ) ( ON-TABLE ?auto_116278 ) ( ON ?auto_116279 ?auto_116278 ) ( not ( = ?auto_116278 ?auto_116279 ) ) ( not ( = ?auto_116278 ?auto_116277 ) ) ( not ( = ?auto_116278 ?auto_116276 ) ) ( not ( = ?auto_116273 ?auto_116278 ) ) ( not ( = ?auto_116274 ?auto_116278 ) ) ( not ( = ?auto_116275 ?auto_116278 ) ) ( ON ?auto_116273 ?auto_116280 ) ( not ( = ?auto_116273 ?auto_116280 ) ) ( not ( = ?auto_116274 ?auto_116280 ) ) ( not ( = ?auto_116275 ?auto_116280 ) ) ( not ( = ?auto_116276 ?auto_116280 ) ) ( not ( = ?auto_116277 ?auto_116280 ) ) ( not ( = ?auto_116279 ?auto_116280 ) ) ( not ( = ?auto_116278 ?auto_116280 ) ) ( ON ?auto_116274 ?auto_116273 ) ( CLEAR ?auto_116274 ) ( ON-TABLE ?auto_116280 ) ( HOLDING ?auto_116275 ) ( CLEAR ?auto_116276 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116278 ?auto_116279 ?auto_116277 ?auto_116276 ?auto_116275 )
      ( MAKE-5PILE ?auto_116273 ?auto_116274 ?auto_116275 ?auto_116276 ?auto_116277 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116281 - BLOCK
      ?auto_116282 - BLOCK
      ?auto_116283 - BLOCK
      ?auto_116284 - BLOCK
      ?auto_116285 - BLOCK
    )
    :vars
    (
      ?auto_116288 - BLOCK
      ?auto_116286 - BLOCK
      ?auto_116287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116281 ?auto_116282 ) ) ( not ( = ?auto_116281 ?auto_116283 ) ) ( not ( = ?auto_116281 ?auto_116284 ) ) ( not ( = ?auto_116281 ?auto_116285 ) ) ( not ( = ?auto_116282 ?auto_116283 ) ) ( not ( = ?auto_116282 ?auto_116284 ) ) ( not ( = ?auto_116282 ?auto_116285 ) ) ( not ( = ?auto_116283 ?auto_116284 ) ) ( not ( = ?auto_116283 ?auto_116285 ) ) ( not ( = ?auto_116284 ?auto_116285 ) ) ( ON ?auto_116285 ?auto_116288 ) ( not ( = ?auto_116281 ?auto_116288 ) ) ( not ( = ?auto_116282 ?auto_116288 ) ) ( not ( = ?auto_116283 ?auto_116288 ) ) ( not ( = ?auto_116284 ?auto_116288 ) ) ( not ( = ?auto_116285 ?auto_116288 ) ) ( ON ?auto_116284 ?auto_116285 ) ( ON-TABLE ?auto_116286 ) ( ON ?auto_116288 ?auto_116286 ) ( not ( = ?auto_116286 ?auto_116288 ) ) ( not ( = ?auto_116286 ?auto_116285 ) ) ( not ( = ?auto_116286 ?auto_116284 ) ) ( not ( = ?auto_116281 ?auto_116286 ) ) ( not ( = ?auto_116282 ?auto_116286 ) ) ( not ( = ?auto_116283 ?auto_116286 ) ) ( ON ?auto_116281 ?auto_116287 ) ( not ( = ?auto_116281 ?auto_116287 ) ) ( not ( = ?auto_116282 ?auto_116287 ) ) ( not ( = ?auto_116283 ?auto_116287 ) ) ( not ( = ?auto_116284 ?auto_116287 ) ) ( not ( = ?auto_116285 ?auto_116287 ) ) ( not ( = ?auto_116288 ?auto_116287 ) ) ( not ( = ?auto_116286 ?auto_116287 ) ) ( ON ?auto_116282 ?auto_116281 ) ( ON-TABLE ?auto_116287 ) ( CLEAR ?auto_116284 ) ( ON ?auto_116283 ?auto_116282 ) ( CLEAR ?auto_116283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116287 ?auto_116281 ?auto_116282 )
      ( MAKE-5PILE ?auto_116281 ?auto_116282 ?auto_116283 ?auto_116284 ?auto_116285 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116289 - BLOCK
      ?auto_116290 - BLOCK
      ?auto_116291 - BLOCK
      ?auto_116292 - BLOCK
      ?auto_116293 - BLOCK
    )
    :vars
    (
      ?auto_116294 - BLOCK
      ?auto_116295 - BLOCK
      ?auto_116296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116289 ?auto_116290 ) ) ( not ( = ?auto_116289 ?auto_116291 ) ) ( not ( = ?auto_116289 ?auto_116292 ) ) ( not ( = ?auto_116289 ?auto_116293 ) ) ( not ( = ?auto_116290 ?auto_116291 ) ) ( not ( = ?auto_116290 ?auto_116292 ) ) ( not ( = ?auto_116290 ?auto_116293 ) ) ( not ( = ?auto_116291 ?auto_116292 ) ) ( not ( = ?auto_116291 ?auto_116293 ) ) ( not ( = ?auto_116292 ?auto_116293 ) ) ( ON ?auto_116293 ?auto_116294 ) ( not ( = ?auto_116289 ?auto_116294 ) ) ( not ( = ?auto_116290 ?auto_116294 ) ) ( not ( = ?auto_116291 ?auto_116294 ) ) ( not ( = ?auto_116292 ?auto_116294 ) ) ( not ( = ?auto_116293 ?auto_116294 ) ) ( ON-TABLE ?auto_116295 ) ( ON ?auto_116294 ?auto_116295 ) ( not ( = ?auto_116295 ?auto_116294 ) ) ( not ( = ?auto_116295 ?auto_116293 ) ) ( not ( = ?auto_116295 ?auto_116292 ) ) ( not ( = ?auto_116289 ?auto_116295 ) ) ( not ( = ?auto_116290 ?auto_116295 ) ) ( not ( = ?auto_116291 ?auto_116295 ) ) ( ON ?auto_116289 ?auto_116296 ) ( not ( = ?auto_116289 ?auto_116296 ) ) ( not ( = ?auto_116290 ?auto_116296 ) ) ( not ( = ?auto_116291 ?auto_116296 ) ) ( not ( = ?auto_116292 ?auto_116296 ) ) ( not ( = ?auto_116293 ?auto_116296 ) ) ( not ( = ?auto_116294 ?auto_116296 ) ) ( not ( = ?auto_116295 ?auto_116296 ) ) ( ON ?auto_116290 ?auto_116289 ) ( ON-TABLE ?auto_116296 ) ( ON ?auto_116291 ?auto_116290 ) ( CLEAR ?auto_116291 ) ( HOLDING ?auto_116292 ) ( CLEAR ?auto_116293 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116295 ?auto_116294 ?auto_116293 ?auto_116292 )
      ( MAKE-5PILE ?auto_116289 ?auto_116290 ?auto_116291 ?auto_116292 ?auto_116293 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116297 - BLOCK
      ?auto_116298 - BLOCK
      ?auto_116299 - BLOCK
      ?auto_116300 - BLOCK
      ?auto_116301 - BLOCK
    )
    :vars
    (
      ?auto_116303 - BLOCK
      ?auto_116304 - BLOCK
      ?auto_116302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116297 ?auto_116298 ) ) ( not ( = ?auto_116297 ?auto_116299 ) ) ( not ( = ?auto_116297 ?auto_116300 ) ) ( not ( = ?auto_116297 ?auto_116301 ) ) ( not ( = ?auto_116298 ?auto_116299 ) ) ( not ( = ?auto_116298 ?auto_116300 ) ) ( not ( = ?auto_116298 ?auto_116301 ) ) ( not ( = ?auto_116299 ?auto_116300 ) ) ( not ( = ?auto_116299 ?auto_116301 ) ) ( not ( = ?auto_116300 ?auto_116301 ) ) ( ON ?auto_116301 ?auto_116303 ) ( not ( = ?auto_116297 ?auto_116303 ) ) ( not ( = ?auto_116298 ?auto_116303 ) ) ( not ( = ?auto_116299 ?auto_116303 ) ) ( not ( = ?auto_116300 ?auto_116303 ) ) ( not ( = ?auto_116301 ?auto_116303 ) ) ( ON-TABLE ?auto_116304 ) ( ON ?auto_116303 ?auto_116304 ) ( not ( = ?auto_116304 ?auto_116303 ) ) ( not ( = ?auto_116304 ?auto_116301 ) ) ( not ( = ?auto_116304 ?auto_116300 ) ) ( not ( = ?auto_116297 ?auto_116304 ) ) ( not ( = ?auto_116298 ?auto_116304 ) ) ( not ( = ?auto_116299 ?auto_116304 ) ) ( ON ?auto_116297 ?auto_116302 ) ( not ( = ?auto_116297 ?auto_116302 ) ) ( not ( = ?auto_116298 ?auto_116302 ) ) ( not ( = ?auto_116299 ?auto_116302 ) ) ( not ( = ?auto_116300 ?auto_116302 ) ) ( not ( = ?auto_116301 ?auto_116302 ) ) ( not ( = ?auto_116303 ?auto_116302 ) ) ( not ( = ?auto_116304 ?auto_116302 ) ) ( ON ?auto_116298 ?auto_116297 ) ( ON-TABLE ?auto_116302 ) ( ON ?auto_116299 ?auto_116298 ) ( CLEAR ?auto_116301 ) ( ON ?auto_116300 ?auto_116299 ) ( CLEAR ?auto_116300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116302 ?auto_116297 ?auto_116298 ?auto_116299 )
      ( MAKE-5PILE ?auto_116297 ?auto_116298 ?auto_116299 ?auto_116300 ?auto_116301 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116305 - BLOCK
      ?auto_116306 - BLOCK
      ?auto_116307 - BLOCK
      ?auto_116308 - BLOCK
      ?auto_116309 - BLOCK
    )
    :vars
    (
      ?auto_116311 - BLOCK
      ?auto_116312 - BLOCK
      ?auto_116310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116305 ?auto_116306 ) ) ( not ( = ?auto_116305 ?auto_116307 ) ) ( not ( = ?auto_116305 ?auto_116308 ) ) ( not ( = ?auto_116305 ?auto_116309 ) ) ( not ( = ?auto_116306 ?auto_116307 ) ) ( not ( = ?auto_116306 ?auto_116308 ) ) ( not ( = ?auto_116306 ?auto_116309 ) ) ( not ( = ?auto_116307 ?auto_116308 ) ) ( not ( = ?auto_116307 ?auto_116309 ) ) ( not ( = ?auto_116308 ?auto_116309 ) ) ( not ( = ?auto_116305 ?auto_116311 ) ) ( not ( = ?auto_116306 ?auto_116311 ) ) ( not ( = ?auto_116307 ?auto_116311 ) ) ( not ( = ?auto_116308 ?auto_116311 ) ) ( not ( = ?auto_116309 ?auto_116311 ) ) ( ON-TABLE ?auto_116312 ) ( ON ?auto_116311 ?auto_116312 ) ( not ( = ?auto_116312 ?auto_116311 ) ) ( not ( = ?auto_116312 ?auto_116309 ) ) ( not ( = ?auto_116312 ?auto_116308 ) ) ( not ( = ?auto_116305 ?auto_116312 ) ) ( not ( = ?auto_116306 ?auto_116312 ) ) ( not ( = ?auto_116307 ?auto_116312 ) ) ( ON ?auto_116305 ?auto_116310 ) ( not ( = ?auto_116305 ?auto_116310 ) ) ( not ( = ?auto_116306 ?auto_116310 ) ) ( not ( = ?auto_116307 ?auto_116310 ) ) ( not ( = ?auto_116308 ?auto_116310 ) ) ( not ( = ?auto_116309 ?auto_116310 ) ) ( not ( = ?auto_116311 ?auto_116310 ) ) ( not ( = ?auto_116312 ?auto_116310 ) ) ( ON ?auto_116306 ?auto_116305 ) ( ON-TABLE ?auto_116310 ) ( ON ?auto_116307 ?auto_116306 ) ( ON ?auto_116308 ?auto_116307 ) ( CLEAR ?auto_116308 ) ( HOLDING ?auto_116309 ) ( CLEAR ?auto_116311 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116312 ?auto_116311 ?auto_116309 )
      ( MAKE-5PILE ?auto_116305 ?auto_116306 ?auto_116307 ?auto_116308 ?auto_116309 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116313 - BLOCK
      ?auto_116314 - BLOCK
      ?auto_116315 - BLOCK
      ?auto_116316 - BLOCK
      ?auto_116317 - BLOCK
    )
    :vars
    (
      ?auto_116318 - BLOCK
      ?auto_116320 - BLOCK
      ?auto_116319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116313 ?auto_116314 ) ) ( not ( = ?auto_116313 ?auto_116315 ) ) ( not ( = ?auto_116313 ?auto_116316 ) ) ( not ( = ?auto_116313 ?auto_116317 ) ) ( not ( = ?auto_116314 ?auto_116315 ) ) ( not ( = ?auto_116314 ?auto_116316 ) ) ( not ( = ?auto_116314 ?auto_116317 ) ) ( not ( = ?auto_116315 ?auto_116316 ) ) ( not ( = ?auto_116315 ?auto_116317 ) ) ( not ( = ?auto_116316 ?auto_116317 ) ) ( not ( = ?auto_116313 ?auto_116318 ) ) ( not ( = ?auto_116314 ?auto_116318 ) ) ( not ( = ?auto_116315 ?auto_116318 ) ) ( not ( = ?auto_116316 ?auto_116318 ) ) ( not ( = ?auto_116317 ?auto_116318 ) ) ( ON-TABLE ?auto_116320 ) ( ON ?auto_116318 ?auto_116320 ) ( not ( = ?auto_116320 ?auto_116318 ) ) ( not ( = ?auto_116320 ?auto_116317 ) ) ( not ( = ?auto_116320 ?auto_116316 ) ) ( not ( = ?auto_116313 ?auto_116320 ) ) ( not ( = ?auto_116314 ?auto_116320 ) ) ( not ( = ?auto_116315 ?auto_116320 ) ) ( ON ?auto_116313 ?auto_116319 ) ( not ( = ?auto_116313 ?auto_116319 ) ) ( not ( = ?auto_116314 ?auto_116319 ) ) ( not ( = ?auto_116315 ?auto_116319 ) ) ( not ( = ?auto_116316 ?auto_116319 ) ) ( not ( = ?auto_116317 ?auto_116319 ) ) ( not ( = ?auto_116318 ?auto_116319 ) ) ( not ( = ?auto_116320 ?auto_116319 ) ) ( ON ?auto_116314 ?auto_116313 ) ( ON-TABLE ?auto_116319 ) ( ON ?auto_116315 ?auto_116314 ) ( ON ?auto_116316 ?auto_116315 ) ( CLEAR ?auto_116318 ) ( ON ?auto_116317 ?auto_116316 ) ( CLEAR ?auto_116317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116319 ?auto_116313 ?auto_116314 ?auto_116315 ?auto_116316 )
      ( MAKE-5PILE ?auto_116313 ?auto_116314 ?auto_116315 ?auto_116316 ?auto_116317 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116321 - BLOCK
      ?auto_116322 - BLOCK
      ?auto_116323 - BLOCK
      ?auto_116324 - BLOCK
      ?auto_116325 - BLOCK
    )
    :vars
    (
      ?auto_116326 - BLOCK
      ?auto_116327 - BLOCK
      ?auto_116328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116321 ?auto_116322 ) ) ( not ( = ?auto_116321 ?auto_116323 ) ) ( not ( = ?auto_116321 ?auto_116324 ) ) ( not ( = ?auto_116321 ?auto_116325 ) ) ( not ( = ?auto_116322 ?auto_116323 ) ) ( not ( = ?auto_116322 ?auto_116324 ) ) ( not ( = ?auto_116322 ?auto_116325 ) ) ( not ( = ?auto_116323 ?auto_116324 ) ) ( not ( = ?auto_116323 ?auto_116325 ) ) ( not ( = ?auto_116324 ?auto_116325 ) ) ( not ( = ?auto_116321 ?auto_116326 ) ) ( not ( = ?auto_116322 ?auto_116326 ) ) ( not ( = ?auto_116323 ?auto_116326 ) ) ( not ( = ?auto_116324 ?auto_116326 ) ) ( not ( = ?auto_116325 ?auto_116326 ) ) ( ON-TABLE ?auto_116327 ) ( not ( = ?auto_116327 ?auto_116326 ) ) ( not ( = ?auto_116327 ?auto_116325 ) ) ( not ( = ?auto_116327 ?auto_116324 ) ) ( not ( = ?auto_116321 ?auto_116327 ) ) ( not ( = ?auto_116322 ?auto_116327 ) ) ( not ( = ?auto_116323 ?auto_116327 ) ) ( ON ?auto_116321 ?auto_116328 ) ( not ( = ?auto_116321 ?auto_116328 ) ) ( not ( = ?auto_116322 ?auto_116328 ) ) ( not ( = ?auto_116323 ?auto_116328 ) ) ( not ( = ?auto_116324 ?auto_116328 ) ) ( not ( = ?auto_116325 ?auto_116328 ) ) ( not ( = ?auto_116326 ?auto_116328 ) ) ( not ( = ?auto_116327 ?auto_116328 ) ) ( ON ?auto_116322 ?auto_116321 ) ( ON-TABLE ?auto_116328 ) ( ON ?auto_116323 ?auto_116322 ) ( ON ?auto_116324 ?auto_116323 ) ( ON ?auto_116325 ?auto_116324 ) ( CLEAR ?auto_116325 ) ( HOLDING ?auto_116326 ) ( CLEAR ?auto_116327 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116327 ?auto_116326 )
      ( MAKE-5PILE ?auto_116321 ?auto_116322 ?auto_116323 ?auto_116324 ?auto_116325 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116329 - BLOCK
      ?auto_116330 - BLOCK
      ?auto_116331 - BLOCK
      ?auto_116332 - BLOCK
      ?auto_116333 - BLOCK
    )
    :vars
    (
      ?auto_116334 - BLOCK
      ?auto_116336 - BLOCK
      ?auto_116335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116329 ?auto_116330 ) ) ( not ( = ?auto_116329 ?auto_116331 ) ) ( not ( = ?auto_116329 ?auto_116332 ) ) ( not ( = ?auto_116329 ?auto_116333 ) ) ( not ( = ?auto_116330 ?auto_116331 ) ) ( not ( = ?auto_116330 ?auto_116332 ) ) ( not ( = ?auto_116330 ?auto_116333 ) ) ( not ( = ?auto_116331 ?auto_116332 ) ) ( not ( = ?auto_116331 ?auto_116333 ) ) ( not ( = ?auto_116332 ?auto_116333 ) ) ( not ( = ?auto_116329 ?auto_116334 ) ) ( not ( = ?auto_116330 ?auto_116334 ) ) ( not ( = ?auto_116331 ?auto_116334 ) ) ( not ( = ?auto_116332 ?auto_116334 ) ) ( not ( = ?auto_116333 ?auto_116334 ) ) ( ON-TABLE ?auto_116336 ) ( not ( = ?auto_116336 ?auto_116334 ) ) ( not ( = ?auto_116336 ?auto_116333 ) ) ( not ( = ?auto_116336 ?auto_116332 ) ) ( not ( = ?auto_116329 ?auto_116336 ) ) ( not ( = ?auto_116330 ?auto_116336 ) ) ( not ( = ?auto_116331 ?auto_116336 ) ) ( ON ?auto_116329 ?auto_116335 ) ( not ( = ?auto_116329 ?auto_116335 ) ) ( not ( = ?auto_116330 ?auto_116335 ) ) ( not ( = ?auto_116331 ?auto_116335 ) ) ( not ( = ?auto_116332 ?auto_116335 ) ) ( not ( = ?auto_116333 ?auto_116335 ) ) ( not ( = ?auto_116334 ?auto_116335 ) ) ( not ( = ?auto_116336 ?auto_116335 ) ) ( ON ?auto_116330 ?auto_116329 ) ( ON-TABLE ?auto_116335 ) ( ON ?auto_116331 ?auto_116330 ) ( ON ?auto_116332 ?auto_116331 ) ( ON ?auto_116333 ?auto_116332 ) ( CLEAR ?auto_116336 ) ( ON ?auto_116334 ?auto_116333 ) ( CLEAR ?auto_116334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116335 ?auto_116329 ?auto_116330 ?auto_116331 ?auto_116332 ?auto_116333 )
      ( MAKE-5PILE ?auto_116329 ?auto_116330 ?auto_116331 ?auto_116332 ?auto_116333 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116337 - BLOCK
      ?auto_116338 - BLOCK
      ?auto_116339 - BLOCK
      ?auto_116340 - BLOCK
      ?auto_116341 - BLOCK
    )
    :vars
    (
      ?auto_116344 - BLOCK
      ?auto_116343 - BLOCK
      ?auto_116342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116337 ?auto_116338 ) ) ( not ( = ?auto_116337 ?auto_116339 ) ) ( not ( = ?auto_116337 ?auto_116340 ) ) ( not ( = ?auto_116337 ?auto_116341 ) ) ( not ( = ?auto_116338 ?auto_116339 ) ) ( not ( = ?auto_116338 ?auto_116340 ) ) ( not ( = ?auto_116338 ?auto_116341 ) ) ( not ( = ?auto_116339 ?auto_116340 ) ) ( not ( = ?auto_116339 ?auto_116341 ) ) ( not ( = ?auto_116340 ?auto_116341 ) ) ( not ( = ?auto_116337 ?auto_116344 ) ) ( not ( = ?auto_116338 ?auto_116344 ) ) ( not ( = ?auto_116339 ?auto_116344 ) ) ( not ( = ?auto_116340 ?auto_116344 ) ) ( not ( = ?auto_116341 ?auto_116344 ) ) ( not ( = ?auto_116343 ?auto_116344 ) ) ( not ( = ?auto_116343 ?auto_116341 ) ) ( not ( = ?auto_116343 ?auto_116340 ) ) ( not ( = ?auto_116337 ?auto_116343 ) ) ( not ( = ?auto_116338 ?auto_116343 ) ) ( not ( = ?auto_116339 ?auto_116343 ) ) ( ON ?auto_116337 ?auto_116342 ) ( not ( = ?auto_116337 ?auto_116342 ) ) ( not ( = ?auto_116338 ?auto_116342 ) ) ( not ( = ?auto_116339 ?auto_116342 ) ) ( not ( = ?auto_116340 ?auto_116342 ) ) ( not ( = ?auto_116341 ?auto_116342 ) ) ( not ( = ?auto_116344 ?auto_116342 ) ) ( not ( = ?auto_116343 ?auto_116342 ) ) ( ON ?auto_116338 ?auto_116337 ) ( ON-TABLE ?auto_116342 ) ( ON ?auto_116339 ?auto_116338 ) ( ON ?auto_116340 ?auto_116339 ) ( ON ?auto_116341 ?auto_116340 ) ( ON ?auto_116344 ?auto_116341 ) ( CLEAR ?auto_116344 ) ( HOLDING ?auto_116343 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116343 )
      ( MAKE-5PILE ?auto_116337 ?auto_116338 ?auto_116339 ?auto_116340 ?auto_116341 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_116345 - BLOCK
      ?auto_116346 - BLOCK
      ?auto_116347 - BLOCK
      ?auto_116348 - BLOCK
      ?auto_116349 - BLOCK
    )
    :vars
    (
      ?auto_116352 - BLOCK
      ?auto_116351 - BLOCK
      ?auto_116350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116345 ?auto_116346 ) ) ( not ( = ?auto_116345 ?auto_116347 ) ) ( not ( = ?auto_116345 ?auto_116348 ) ) ( not ( = ?auto_116345 ?auto_116349 ) ) ( not ( = ?auto_116346 ?auto_116347 ) ) ( not ( = ?auto_116346 ?auto_116348 ) ) ( not ( = ?auto_116346 ?auto_116349 ) ) ( not ( = ?auto_116347 ?auto_116348 ) ) ( not ( = ?auto_116347 ?auto_116349 ) ) ( not ( = ?auto_116348 ?auto_116349 ) ) ( not ( = ?auto_116345 ?auto_116352 ) ) ( not ( = ?auto_116346 ?auto_116352 ) ) ( not ( = ?auto_116347 ?auto_116352 ) ) ( not ( = ?auto_116348 ?auto_116352 ) ) ( not ( = ?auto_116349 ?auto_116352 ) ) ( not ( = ?auto_116351 ?auto_116352 ) ) ( not ( = ?auto_116351 ?auto_116349 ) ) ( not ( = ?auto_116351 ?auto_116348 ) ) ( not ( = ?auto_116345 ?auto_116351 ) ) ( not ( = ?auto_116346 ?auto_116351 ) ) ( not ( = ?auto_116347 ?auto_116351 ) ) ( ON ?auto_116345 ?auto_116350 ) ( not ( = ?auto_116345 ?auto_116350 ) ) ( not ( = ?auto_116346 ?auto_116350 ) ) ( not ( = ?auto_116347 ?auto_116350 ) ) ( not ( = ?auto_116348 ?auto_116350 ) ) ( not ( = ?auto_116349 ?auto_116350 ) ) ( not ( = ?auto_116352 ?auto_116350 ) ) ( not ( = ?auto_116351 ?auto_116350 ) ) ( ON ?auto_116346 ?auto_116345 ) ( ON-TABLE ?auto_116350 ) ( ON ?auto_116347 ?auto_116346 ) ( ON ?auto_116348 ?auto_116347 ) ( ON ?auto_116349 ?auto_116348 ) ( ON ?auto_116352 ?auto_116349 ) ( ON ?auto_116351 ?auto_116352 ) ( CLEAR ?auto_116351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116350 ?auto_116345 ?auto_116346 ?auto_116347 ?auto_116348 ?auto_116349 ?auto_116352 )
      ( MAKE-5PILE ?auto_116345 ?auto_116346 ?auto_116347 ?auto_116348 ?auto_116349 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116364 - BLOCK
    )
    :vars
    (
      ?auto_116367 - BLOCK
      ?auto_116366 - BLOCK
      ?auto_116365 - BLOCK
      ?auto_116370 - BLOCK
      ?auto_116368 - BLOCK
      ?auto_116369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116367 ?auto_116364 ) ( ON-TABLE ?auto_116364 ) ( not ( = ?auto_116364 ?auto_116367 ) ) ( not ( = ?auto_116364 ?auto_116366 ) ) ( not ( = ?auto_116364 ?auto_116365 ) ) ( not ( = ?auto_116367 ?auto_116366 ) ) ( not ( = ?auto_116367 ?auto_116365 ) ) ( not ( = ?auto_116366 ?auto_116365 ) ) ( ON ?auto_116366 ?auto_116367 ) ( CLEAR ?auto_116366 ) ( HOLDING ?auto_116365 ) ( CLEAR ?auto_116370 ) ( ON-TABLE ?auto_116368 ) ( ON ?auto_116369 ?auto_116368 ) ( ON ?auto_116370 ?auto_116369 ) ( not ( = ?auto_116368 ?auto_116369 ) ) ( not ( = ?auto_116368 ?auto_116370 ) ) ( not ( = ?auto_116368 ?auto_116365 ) ) ( not ( = ?auto_116369 ?auto_116370 ) ) ( not ( = ?auto_116369 ?auto_116365 ) ) ( not ( = ?auto_116370 ?auto_116365 ) ) ( not ( = ?auto_116364 ?auto_116370 ) ) ( not ( = ?auto_116364 ?auto_116368 ) ) ( not ( = ?auto_116364 ?auto_116369 ) ) ( not ( = ?auto_116367 ?auto_116370 ) ) ( not ( = ?auto_116367 ?auto_116368 ) ) ( not ( = ?auto_116367 ?auto_116369 ) ) ( not ( = ?auto_116366 ?auto_116370 ) ) ( not ( = ?auto_116366 ?auto_116368 ) ) ( not ( = ?auto_116366 ?auto_116369 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116368 ?auto_116369 ?auto_116370 ?auto_116365 )
      ( MAKE-1PILE ?auto_116364 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116371 - BLOCK
    )
    :vars
    (
      ?auto_116377 - BLOCK
      ?auto_116376 - BLOCK
      ?auto_116375 - BLOCK
      ?auto_116372 - BLOCK
      ?auto_116373 - BLOCK
      ?auto_116374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116377 ?auto_116371 ) ( ON-TABLE ?auto_116371 ) ( not ( = ?auto_116371 ?auto_116377 ) ) ( not ( = ?auto_116371 ?auto_116376 ) ) ( not ( = ?auto_116371 ?auto_116375 ) ) ( not ( = ?auto_116377 ?auto_116376 ) ) ( not ( = ?auto_116377 ?auto_116375 ) ) ( not ( = ?auto_116376 ?auto_116375 ) ) ( ON ?auto_116376 ?auto_116377 ) ( CLEAR ?auto_116372 ) ( ON-TABLE ?auto_116373 ) ( ON ?auto_116374 ?auto_116373 ) ( ON ?auto_116372 ?auto_116374 ) ( not ( = ?auto_116373 ?auto_116374 ) ) ( not ( = ?auto_116373 ?auto_116372 ) ) ( not ( = ?auto_116373 ?auto_116375 ) ) ( not ( = ?auto_116374 ?auto_116372 ) ) ( not ( = ?auto_116374 ?auto_116375 ) ) ( not ( = ?auto_116372 ?auto_116375 ) ) ( not ( = ?auto_116371 ?auto_116372 ) ) ( not ( = ?auto_116371 ?auto_116373 ) ) ( not ( = ?auto_116371 ?auto_116374 ) ) ( not ( = ?auto_116377 ?auto_116372 ) ) ( not ( = ?auto_116377 ?auto_116373 ) ) ( not ( = ?auto_116377 ?auto_116374 ) ) ( not ( = ?auto_116376 ?auto_116372 ) ) ( not ( = ?auto_116376 ?auto_116373 ) ) ( not ( = ?auto_116376 ?auto_116374 ) ) ( ON ?auto_116375 ?auto_116376 ) ( CLEAR ?auto_116375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116371 ?auto_116377 ?auto_116376 )
      ( MAKE-1PILE ?auto_116371 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116378 - BLOCK
    )
    :vars
    (
      ?auto_116382 - BLOCK
      ?auto_116383 - BLOCK
      ?auto_116384 - BLOCK
      ?auto_116379 - BLOCK
      ?auto_116380 - BLOCK
      ?auto_116381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116382 ?auto_116378 ) ( ON-TABLE ?auto_116378 ) ( not ( = ?auto_116378 ?auto_116382 ) ) ( not ( = ?auto_116378 ?auto_116383 ) ) ( not ( = ?auto_116378 ?auto_116384 ) ) ( not ( = ?auto_116382 ?auto_116383 ) ) ( not ( = ?auto_116382 ?auto_116384 ) ) ( not ( = ?auto_116383 ?auto_116384 ) ) ( ON ?auto_116383 ?auto_116382 ) ( ON-TABLE ?auto_116379 ) ( ON ?auto_116380 ?auto_116379 ) ( not ( = ?auto_116379 ?auto_116380 ) ) ( not ( = ?auto_116379 ?auto_116381 ) ) ( not ( = ?auto_116379 ?auto_116384 ) ) ( not ( = ?auto_116380 ?auto_116381 ) ) ( not ( = ?auto_116380 ?auto_116384 ) ) ( not ( = ?auto_116381 ?auto_116384 ) ) ( not ( = ?auto_116378 ?auto_116381 ) ) ( not ( = ?auto_116378 ?auto_116379 ) ) ( not ( = ?auto_116378 ?auto_116380 ) ) ( not ( = ?auto_116382 ?auto_116381 ) ) ( not ( = ?auto_116382 ?auto_116379 ) ) ( not ( = ?auto_116382 ?auto_116380 ) ) ( not ( = ?auto_116383 ?auto_116381 ) ) ( not ( = ?auto_116383 ?auto_116379 ) ) ( not ( = ?auto_116383 ?auto_116380 ) ) ( ON ?auto_116384 ?auto_116383 ) ( CLEAR ?auto_116384 ) ( HOLDING ?auto_116381 ) ( CLEAR ?auto_116380 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116379 ?auto_116380 ?auto_116381 )
      ( MAKE-1PILE ?auto_116378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116385 - BLOCK
    )
    :vars
    (
      ?auto_116389 - BLOCK
      ?auto_116386 - BLOCK
      ?auto_116388 - BLOCK
      ?auto_116387 - BLOCK
      ?auto_116391 - BLOCK
      ?auto_116390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116389 ?auto_116385 ) ( ON-TABLE ?auto_116385 ) ( not ( = ?auto_116385 ?auto_116389 ) ) ( not ( = ?auto_116385 ?auto_116386 ) ) ( not ( = ?auto_116385 ?auto_116388 ) ) ( not ( = ?auto_116389 ?auto_116386 ) ) ( not ( = ?auto_116389 ?auto_116388 ) ) ( not ( = ?auto_116386 ?auto_116388 ) ) ( ON ?auto_116386 ?auto_116389 ) ( ON-TABLE ?auto_116387 ) ( ON ?auto_116391 ?auto_116387 ) ( not ( = ?auto_116387 ?auto_116391 ) ) ( not ( = ?auto_116387 ?auto_116390 ) ) ( not ( = ?auto_116387 ?auto_116388 ) ) ( not ( = ?auto_116391 ?auto_116390 ) ) ( not ( = ?auto_116391 ?auto_116388 ) ) ( not ( = ?auto_116390 ?auto_116388 ) ) ( not ( = ?auto_116385 ?auto_116390 ) ) ( not ( = ?auto_116385 ?auto_116387 ) ) ( not ( = ?auto_116385 ?auto_116391 ) ) ( not ( = ?auto_116389 ?auto_116390 ) ) ( not ( = ?auto_116389 ?auto_116387 ) ) ( not ( = ?auto_116389 ?auto_116391 ) ) ( not ( = ?auto_116386 ?auto_116390 ) ) ( not ( = ?auto_116386 ?auto_116387 ) ) ( not ( = ?auto_116386 ?auto_116391 ) ) ( ON ?auto_116388 ?auto_116386 ) ( CLEAR ?auto_116391 ) ( ON ?auto_116390 ?auto_116388 ) ( CLEAR ?auto_116390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116385 ?auto_116389 ?auto_116386 ?auto_116388 )
      ( MAKE-1PILE ?auto_116385 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116392 - BLOCK
    )
    :vars
    (
      ?auto_116394 - BLOCK
      ?auto_116395 - BLOCK
      ?auto_116393 - BLOCK
      ?auto_116397 - BLOCK
      ?auto_116398 - BLOCK
      ?auto_116396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116394 ?auto_116392 ) ( ON-TABLE ?auto_116392 ) ( not ( = ?auto_116392 ?auto_116394 ) ) ( not ( = ?auto_116392 ?auto_116395 ) ) ( not ( = ?auto_116392 ?auto_116393 ) ) ( not ( = ?auto_116394 ?auto_116395 ) ) ( not ( = ?auto_116394 ?auto_116393 ) ) ( not ( = ?auto_116395 ?auto_116393 ) ) ( ON ?auto_116395 ?auto_116394 ) ( ON-TABLE ?auto_116397 ) ( not ( = ?auto_116397 ?auto_116398 ) ) ( not ( = ?auto_116397 ?auto_116396 ) ) ( not ( = ?auto_116397 ?auto_116393 ) ) ( not ( = ?auto_116398 ?auto_116396 ) ) ( not ( = ?auto_116398 ?auto_116393 ) ) ( not ( = ?auto_116396 ?auto_116393 ) ) ( not ( = ?auto_116392 ?auto_116396 ) ) ( not ( = ?auto_116392 ?auto_116397 ) ) ( not ( = ?auto_116392 ?auto_116398 ) ) ( not ( = ?auto_116394 ?auto_116396 ) ) ( not ( = ?auto_116394 ?auto_116397 ) ) ( not ( = ?auto_116394 ?auto_116398 ) ) ( not ( = ?auto_116395 ?auto_116396 ) ) ( not ( = ?auto_116395 ?auto_116397 ) ) ( not ( = ?auto_116395 ?auto_116398 ) ) ( ON ?auto_116393 ?auto_116395 ) ( ON ?auto_116396 ?auto_116393 ) ( CLEAR ?auto_116396 ) ( HOLDING ?auto_116398 ) ( CLEAR ?auto_116397 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116397 ?auto_116398 )
      ( MAKE-1PILE ?auto_116392 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116399 - BLOCK
    )
    :vars
    (
      ?auto_116405 - BLOCK
      ?auto_116402 - BLOCK
      ?auto_116403 - BLOCK
      ?auto_116400 - BLOCK
      ?auto_116404 - BLOCK
      ?auto_116401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116405 ?auto_116399 ) ( ON-TABLE ?auto_116399 ) ( not ( = ?auto_116399 ?auto_116405 ) ) ( not ( = ?auto_116399 ?auto_116402 ) ) ( not ( = ?auto_116399 ?auto_116403 ) ) ( not ( = ?auto_116405 ?auto_116402 ) ) ( not ( = ?auto_116405 ?auto_116403 ) ) ( not ( = ?auto_116402 ?auto_116403 ) ) ( ON ?auto_116402 ?auto_116405 ) ( ON-TABLE ?auto_116400 ) ( not ( = ?auto_116400 ?auto_116404 ) ) ( not ( = ?auto_116400 ?auto_116401 ) ) ( not ( = ?auto_116400 ?auto_116403 ) ) ( not ( = ?auto_116404 ?auto_116401 ) ) ( not ( = ?auto_116404 ?auto_116403 ) ) ( not ( = ?auto_116401 ?auto_116403 ) ) ( not ( = ?auto_116399 ?auto_116401 ) ) ( not ( = ?auto_116399 ?auto_116400 ) ) ( not ( = ?auto_116399 ?auto_116404 ) ) ( not ( = ?auto_116405 ?auto_116401 ) ) ( not ( = ?auto_116405 ?auto_116400 ) ) ( not ( = ?auto_116405 ?auto_116404 ) ) ( not ( = ?auto_116402 ?auto_116401 ) ) ( not ( = ?auto_116402 ?auto_116400 ) ) ( not ( = ?auto_116402 ?auto_116404 ) ) ( ON ?auto_116403 ?auto_116402 ) ( ON ?auto_116401 ?auto_116403 ) ( CLEAR ?auto_116400 ) ( ON ?auto_116404 ?auto_116401 ) ( CLEAR ?auto_116404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116399 ?auto_116405 ?auto_116402 ?auto_116403 ?auto_116401 )
      ( MAKE-1PILE ?auto_116399 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116406 - BLOCK
    )
    :vars
    (
      ?auto_116412 - BLOCK
      ?auto_116409 - BLOCK
      ?auto_116410 - BLOCK
      ?auto_116407 - BLOCK
      ?auto_116408 - BLOCK
      ?auto_116411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116412 ?auto_116406 ) ( ON-TABLE ?auto_116406 ) ( not ( = ?auto_116406 ?auto_116412 ) ) ( not ( = ?auto_116406 ?auto_116409 ) ) ( not ( = ?auto_116406 ?auto_116410 ) ) ( not ( = ?auto_116412 ?auto_116409 ) ) ( not ( = ?auto_116412 ?auto_116410 ) ) ( not ( = ?auto_116409 ?auto_116410 ) ) ( ON ?auto_116409 ?auto_116412 ) ( not ( = ?auto_116407 ?auto_116408 ) ) ( not ( = ?auto_116407 ?auto_116411 ) ) ( not ( = ?auto_116407 ?auto_116410 ) ) ( not ( = ?auto_116408 ?auto_116411 ) ) ( not ( = ?auto_116408 ?auto_116410 ) ) ( not ( = ?auto_116411 ?auto_116410 ) ) ( not ( = ?auto_116406 ?auto_116411 ) ) ( not ( = ?auto_116406 ?auto_116407 ) ) ( not ( = ?auto_116406 ?auto_116408 ) ) ( not ( = ?auto_116412 ?auto_116411 ) ) ( not ( = ?auto_116412 ?auto_116407 ) ) ( not ( = ?auto_116412 ?auto_116408 ) ) ( not ( = ?auto_116409 ?auto_116411 ) ) ( not ( = ?auto_116409 ?auto_116407 ) ) ( not ( = ?auto_116409 ?auto_116408 ) ) ( ON ?auto_116410 ?auto_116409 ) ( ON ?auto_116411 ?auto_116410 ) ( ON ?auto_116408 ?auto_116411 ) ( CLEAR ?auto_116408 ) ( HOLDING ?auto_116407 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116407 )
      ( MAKE-1PILE ?auto_116406 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116421 - BLOCK
    )
    :vars
    (
      ?auto_116425 - BLOCK
      ?auto_116426 - BLOCK
      ?auto_116422 - BLOCK
      ?auto_116423 - BLOCK
      ?auto_116427 - BLOCK
      ?auto_116424 - BLOCK
      ?auto_116428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116425 ?auto_116421 ) ( ON-TABLE ?auto_116421 ) ( not ( = ?auto_116421 ?auto_116425 ) ) ( not ( = ?auto_116421 ?auto_116426 ) ) ( not ( = ?auto_116421 ?auto_116422 ) ) ( not ( = ?auto_116425 ?auto_116426 ) ) ( not ( = ?auto_116425 ?auto_116422 ) ) ( not ( = ?auto_116426 ?auto_116422 ) ) ( ON ?auto_116426 ?auto_116425 ) ( not ( = ?auto_116423 ?auto_116427 ) ) ( not ( = ?auto_116423 ?auto_116424 ) ) ( not ( = ?auto_116423 ?auto_116422 ) ) ( not ( = ?auto_116427 ?auto_116424 ) ) ( not ( = ?auto_116427 ?auto_116422 ) ) ( not ( = ?auto_116424 ?auto_116422 ) ) ( not ( = ?auto_116421 ?auto_116424 ) ) ( not ( = ?auto_116421 ?auto_116423 ) ) ( not ( = ?auto_116421 ?auto_116427 ) ) ( not ( = ?auto_116425 ?auto_116424 ) ) ( not ( = ?auto_116425 ?auto_116423 ) ) ( not ( = ?auto_116425 ?auto_116427 ) ) ( not ( = ?auto_116426 ?auto_116424 ) ) ( not ( = ?auto_116426 ?auto_116423 ) ) ( not ( = ?auto_116426 ?auto_116427 ) ) ( ON ?auto_116422 ?auto_116426 ) ( ON ?auto_116424 ?auto_116422 ) ( ON ?auto_116427 ?auto_116424 ) ( CLEAR ?auto_116427 ) ( ON ?auto_116423 ?auto_116428 ) ( CLEAR ?auto_116423 ) ( HAND-EMPTY ) ( not ( = ?auto_116421 ?auto_116428 ) ) ( not ( = ?auto_116425 ?auto_116428 ) ) ( not ( = ?auto_116426 ?auto_116428 ) ) ( not ( = ?auto_116422 ?auto_116428 ) ) ( not ( = ?auto_116423 ?auto_116428 ) ) ( not ( = ?auto_116427 ?auto_116428 ) ) ( not ( = ?auto_116424 ?auto_116428 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116423 ?auto_116428 )
      ( MAKE-1PILE ?auto_116421 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116429 - BLOCK
    )
    :vars
    (
      ?auto_116433 - BLOCK
      ?auto_116430 - BLOCK
      ?auto_116431 - BLOCK
      ?auto_116436 - BLOCK
      ?auto_116432 - BLOCK
      ?auto_116435 - BLOCK
      ?auto_116434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116433 ?auto_116429 ) ( ON-TABLE ?auto_116429 ) ( not ( = ?auto_116429 ?auto_116433 ) ) ( not ( = ?auto_116429 ?auto_116430 ) ) ( not ( = ?auto_116429 ?auto_116431 ) ) ( not ( = ?auto_116433 ?auto_116430 ) ) ( not ( = ?auto_116433 ?auto_116431 ) ) ( not ( = ?auto_116430 ?auto_116431 ) ) ( ON ?auto_116430 ?auto_116433 ) ( not ( = ?auto_116436 ?auto_116432 ) ) ( not ( = ?auto_116436 ?auto_116435 ) ) ( not ( = ?auto_116436 ?auto_116431 ) ) ( not ( = ?auto_116432 ?auto_116435 ) ) ( not ( = ?auto_116432 ?auto_116431 ) ) ( not ( = ?auto_116435 ?auto_116431 ) ) ( not ( = ?auto_116429 ?auto_116435 ) ) ( not ( = ?auto_116429 ?auto_116436 ) ) ( not ( = ?auto_116429 ?auto_116432 ) ) ( not ( = ?auto_116433 ?auto_116435 ) ) ( not ( = ?auto_116433 ?auto_116436 ) ) ( not ( = ?auto_116433 ?auto_116432 ) ) ( not ( = ?auto_116430 ?auto_116435 ) ) ( not ( = ?auto_116430 ?auto_116436 ) ) ( not ( = ?auto_116430 ?auto_116432 ) ) ( ON ?auto_116431 ?auto_116430 ) ( ON ?auto_116435 ?auto_116431 ) ( ON ?auto_116436 ?auto_116434 ) ( CLEAR ?auto_116436 ) ( not ( = ?auto_116429 ?auto_116434 ) ) ( not ( = ?auto_116433 ?auto_116434 ) ) ( not ( = ?auto_116430 ?auto_116434 ) ) ( not ( = ?auto_116431 ?auto_116434 ) ) ( not ( = ?auto_116436 ?auto_116434 ) ) ( not ( = ?auto_116432 ?auto_116434 ) ) ( not ( = ?auto_116435 ?auto_116434 ) ) ( HOLDING ?auto_116432 ) ( CLEAR ?auto_116435 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116429 ?auto_116433 ?auto_116430 ?auto_116431 ?auto_116435 ?auto_116432 )
      ( MAKE-1PILE ?auto_116429 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116437 - BLOCK
    )
    :vars
    (
      ?auto_116438 - BLOCK
      ?auto_116441 - BLOCK
      ?auto_116442 - BLOCK
      ?auto_116439 - BLOCK
      ?auto_116443 - BLOCK
      ?auto_116440 - BLOCK
      ?auto_116444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116438 ?auto_116437 ) ( ON-TABLE ?auto_116437 ) ( not ( = ?auto_116437 ?auto_116438 ) ) ( not ( = ?auto_116437 ?auto_116441 ) ) ( not ( = ?auto_116437 ?auto_116442 ) ) ( not ( = ?auto_116438 ?auto_116441 ) ) ( not ( = ?auto_116438 ?auto_116442 ) ) ( not ( = ?auto_116441 ?auto_116442 ) ) ( ON ?auto_116441 ?auto_116438 ) ( not ( = ?auto_116439 ?auto_116443 ) ) ( not ( = ?auto_116439 ?auto_116440 ) ) ( not ( = ?auto_116439 ?auto_116442 ) ) ( not ( = ?auto_116443 ?auto_116440 ) ) ( not ( = ?auto_116443 ?auto_116442 ) ) ( not ( = ?auto_116440 ?auto_116442 ) ) ( not ( = ?auto_116437 ?auto_116440 ) ) ( not ( = ?auto_116437 ?auto_116439 ) ) ( not ( = ?auto_116437 ?auto_116443 ) ) ( not ( = ?auto_116438 ?auto_116440 ) ) ( not ( = ?auto_116438 ?auto_116439 ) ) ( not ( = ?auto_116438 ?auto_116443 ) ) ( not ( = ?auto_116441 ?auto_116440 ) ) ( not ( = ?auto_116441 ?auto_116439 ) ) ( not ( = ?auto_116441 ?auto_116443 ) ) ( ON ?auto_116442 ?auto_116441 ) ( ON ?auto_116440 ?auto_116442 ) ( ON ?auto_116439 ?auto_116444 ) ( not ( = ?auto_116437 ?auto_116444 ) ) ( not ( = ?auto_116438 ?auto_116444 ) ) ( not ( = ?auto_116441 ?auto_116444 ) ) ( not ( = ?auto_116442 ?auto_116444 ) ) ( not ( = ?auto_116439 ?auto_116444 ) ) ( not ( = ?auto_116443 ?auto_116444 ) ) ( not ( = ?auto_116440 ?auto_116444 ) ) ( CLEAR ?auto_116440 ) ( ON ?auto_116443 ?auto_116439 ) ( CLEAR ?auto_116443 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116444 ?auto_116439 )
      ( MAKE-1PILE ?auto_116437 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116445 - BLOCK
    )
    :vars
    (
      ?auto_116449 - BLOCK
      ?auto_116448 - BLOCK
      ?auto_116451 - BLOCK
      ?auto_116446 - BLOCK
      ?auto_116450 - BLOCK
      ?auto_116452 - BLOCK
      ?auto_116447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116449 ?auto_116445 ) ( ON-TABLE ?auto_116445 ) ( not ( = ?auto_116445 ?auto_116449 ) ) ( not ( = ?auto_116445 ?auto_116448 ) ) ( not ( = ?auto_116445 ?auto_116451 ) ) ( not ( = ?auto_116449 ?auto_116448 ) ) ( not ( = ?auto_116449 ?auto_116451 ) ) ( not ( = ?auto_116448 ?auto_116451 ) ) ( ON ?auto_116448 ?auto_116449 ) ( not ( = ?auto_116446 ?auto_116450 ) ) ( not ( = ?auto_116446 ?auto_116452 ) ) ( not ( = ?auto_116446 ?auto_116451 ) ) ( not ( = ?auto_116450 ?auto_116452 ) ) ( not ( = ?auto_116450 ?auto_116451 ) ) ( not ( = ?auto_116452 ?auto_116451 ) ) ( not ( = ?auto_116445 ?auto_116452 ) ) ( not ( = ?auto_116445 ?auto_116446 ) ) ( not ( = ?auto_116445 ?auto_116450 ) ) ( not ( = ?auto_116449 ?auto_116452 ) ) ( not ( = ?auto_116449 ?auto_116446 ) ) ( not ( = ?auto_116449 ?auto_116450 ) ) ( not ( = ?auto_116448 ?auto_116452 ) ) ( not ( = ?auto_116448 ?auto_116446 ) ) ( not ( = ?auto_116448 ?auto_116450 ) ) ( ON ?auto_116451 ?auto_116448 ) ( ON ?auto_116446 ?auto_116447 ) ( not ( = ?auto_116445 ?auto_116447 ) ) ( not ( = ?auto_116449 ?auto_116447 ) ) ( not ( = ?auto_116448 ?auto_116447 ) ) ( not ( = ?auto_116451 ?auto_116447 ) ) ( not ( = ?auto_116446 ?auto_116447 ) ) ( not ( = ?auto_116450 ?auto_116447 ) ) ( not ( = ?auto_116452 ?auto_116447 ) ) ( ON ?auto_116450 ?auto_116446 ) ( CLEAR ?auto_116450 ) ( ON-TABLE ?auto_116447 ) ( HOLDING ?auto_116452 ) ( CLEAR ?auto_116451 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116445 ?auto_116449 ?auto_116448 ?auto_116451 ?auto_116452 )
      ( MAKE-1PILE ?auto_116445 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116491 - BLOCK
      ?auto_116492 - BLOCK
      ?auto_116493 - BLOCK
      ?auto_116494 - BLOCK
      ?auto_116495 - BLOCK
      ?auto_116496 - BLOCK
    )
    :vars
    (
      ?auto_116497 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116491 ) ( ON ?auto_116492 ?auto_116491 ) ( ON ?auto_116493 ?auto_116492 ) ( ON ?auto_116494 ?auto_116493 ) ( not ( = ?auto_116491 ?auto_116492 ) ) ( not ( = ?auto_116491 ?auto_116493 ) ) ( not ( = ?auto_116491 ?auto_116494 ) ) ( not ( = ?auto_116491 ?auto_116495 ) ) ( not ( = ?auto_116491 ?auto_116496 ) ) ( not ( = ?auto_116492 ?auto_116493 ) ) ( not ( = ?auto_116492 ?auto_116494 ) ) ( not ( = ?auto_116492 ?auto_116495 ) ) ( not ( = ?auto_116492 ?auto_116496 ) ) ( not ( = ?auto_116493 ?auto_116494 ) ) ( not ( = ?auto_116493 ?auto_116495 ) ) ( not ( = ?auto_116493 ?auto_116496 ) ) ( not ( = ?auto_116494 ?auto_116495 ) ) ( not ( = ?auto_116494 ?auto_116496 ) ) ( not ( = ?auto_116495 ?auto_116496 ) ) ( ON ?auto_116496 ?auto_116497 ) ( not ( = ?auto_116491 ?auto_116497 ) ) ( not ( = ?auto_116492 ?auto_116497 ) ) ( not ( = ?auto_116493 ?auto_116497 ) ) ( not ( = ?auto_116494 ?auto_116497 ) ) ( not ( = ?auto_116495 ?auto_116497 ) ) ( not ( = ?auto_116496 ?auto_116497 ) ) ( CLEAR ?auto_116494 ) ( ON ?auto_116495 ?auto_116496 ) ( CLEAR ?auto_116495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116497 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116497 ?auto_116496 )
      ( MAKE-6PILE ?auto_116491 ?auto_116492 ?auto_116493 ?auto_116494 ?auto_116495 ?auto_116496 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116498 - BLOCK
      ?auto_116499 - BLOCK
      ?auto_116500 - BLOCK
      ?auto_116501 - BLOCK
      ?auto_116502 - BLOCK
      ?auto_116503 - BLOCK
    )
    :vars
    (
      ?auto_116504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116498 ) ( ON ?auto_116499 ?auto_116498 ) ( ON ?auto_116500 ?auto_116499 ) ( not ( = ?auto_116498 ?auto_116499 ) ) ( not ( = ?auto_116498 ?auto_116500 ) ) ( not ( = ?auto_116498 ?auto_116501 ) ) ( not ( = ?auto_116498 ?auto_116502 ) ) ( not ( = ?auto_116498 ?auto_116503 ) ) ( not ( = ?auto_116499 ?auto_116500 ) ) ( not ( = ?auto_116499 ?auto_116501 ) ) ( not ( = ?auto_116499 ?auto_116502 ) ) ( not ( = ?auto_116499 ?auto_116503 ) ) ( not ( = ?auto_116500 ?auto_116501 ) ) ( not ( = ?auto_116500 ?auto_116502 ) ) ( not ( = ?auto_116500 ?auto_116503 ) ) ( not ( = ?auto_116501 ?auto_116502 ) ) ( not ( = ?auto_116501 ?auto_116503 ) ) ( not ( = ?auto_116502 ?auto_116503 ) ) ( ON ?auto_116503 ?auto_116504 ) ( not ( = ?auto_116498 ?auto_116504 ) ) ( not ( = ?auto_116499 ?auto_116504 ) ) ( not ( = ?auto_116500 ?auto_116504 ) ) ( not ( = ?auto_116501 ?auto_116504 ) ) ( not ( = ?auto_116502 ?auto_116504 ) ) ( not ( = ?auto_116503 ?auto_116504 ) ) ( ON ?auto_116502 ?auto_116503 ) ( CLEAR ?auto_116502 ) ( ON-TABLE ?auto_116504 ) ( HOLDING ?auto_116501 ) ( CLEAR ?auto_116500 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116498 ?auto_116499 ?auto_116500 ?auto_116501 )
      ( MAKE-6PILE ?auto_116498 ?auto_116499 ?auto_116500 ?auto_116501 ?auto_116502 ?auto_116503 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116505 - BLOCK
      ?auto_116506 - BLOCK
      ?auto_116507 - BLOCK
      ?auto_116508 - BLOCK
      ?auto_116509 - BLOCK
      ?auto_116510 - BLOCK
    )
    :vars
    (
      ?auto_116511 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116505 ) ( ON ?auto_116506 ?auto_116505 ) ( ON ?auto_116507 ?auto_116506 ) ( not ( = ?auto_116505 ?auto_116506 ) ) ( not ( = ?auto_116505 ?auto_116507 ) ) ( not ( = ?auto_116505 ?auto_116508 ) ) ( not ( = ?auto_116505 ?auto_116509 ) ) ( not ( = ?auto_116505 ?auto_116510 ) ) ( not ( = ?auto_116506 ?auto_116507 ) ) ( not ( = ?auto_116506 ?auto_116508 ) ) ( not ( = ?auto_116506 ?auto_116509 ) ) ( not ( = ?auto_116506 ?auto_116510 ) ) ( not ( = ?auto_116507 ?auto_116508 ) ) ( not ( = ?auto_116507 ?auto_116509 ) ) ( not ( = ?auto_116507 ?auto_116510 ) ) ( not ( = ?auto_116508 ?auto_116509 ) ) ( not ( = ?auto_116508 ?auto_116510 ) ) ( not ( = ?auto_116509 ?auto_116510 ) ) ( ON ?auto_116510 ?auto_116511 ) ( not ( = ?auto_116505 ?auto_116511 ) ) ( not ( = ?auto_116506 ?auto_116511 ) ) ( not ( = ?auto_116507 ?auto_116511 ) ) ( not ( = ?auto_116508 ?auto_116511 ) ) ( not ( = ?auto_116509 ?auto_116511 ) ) ( not ( = ?auto_116510 ?auto_116511 ) ) ( ON ?auto_116509 ?auto_116510 ) ( ON-TABLE ?auto_116511 ) ( CLEAR ?auto_116507 ) ( ON ?auto_116508 ?auto_116509 ) ( CLEAR ?auto_116508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116511 ?auto_116510 ?auto_116509 )
      ( MAKE-6PILE ?auto_116505 ?auto_116506 ?auto_116507 ?auto_116508 ?auto_116509 ?auto_116510 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116512 - BLOCK
      ?auto_116513 - BLOCK
      ?auto_116514 - BLOCK
      ?auto_116515 - BLOCK
      ?auto_116516 - BLOCK
      ?auto_116517 - BLOCK
    )
    :vars
    (
      ?auto_116518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116512 ) ( ON ?auto_116513 ?auto_116512 ) ( not ( = ?auto_116512 ?auto_116513 ) ) ( not ( = ?auto_116512 ?auto_116514 ) ) ( not ( = ?auto_116512 ?auto_116515 ) ) ( not ( = ?auto_116512 ?auto_116516 ) ) ( not ( = ?auto_116512 ?auto_116517 ) ) ( not ( = ?auto_116513 ?auto_116514 ) ) ( not ( = ?auto_116513 ?auto_116515 ) ) ( not ( = ?auto_116513 ?auto_116516 ) ) ( not ( = ?auto_116513 ?auto_116517 ) ) ( not ( = ?auto_116514 ?auto_116515 ) ) ( not ( = ?auto_116514 ?auto_116516 ) ) ( not ( = ?auto_116514 ?auto_116517 ) ) ( not ( = ?auto_116515 ?auto_116516 ) ) ( not ( = ?auto_116515 ?auto_116517 ) ) ( not ( = ?auto_116516 ?auto_116517 ) ) ( ON ?auto_116517 ?auto_116518 ) ( not ( = ?auto_116512 ?auto_116518 ) ) ( not ( = ?auto_116513 ?auto_116518 ) ) ( not ( = ?auto_116514 ?auto_116518 ) ) ( not ( = ?auto_116515 ?auto_116518 ) ) ( not ( = ?auto_116516 ?auto_116518 ) ) ( not ( = ?auto_116517 ?auto_116518 ) ) ( ON ?auto_116516 ?auto_116517 ) ( ON-TABLE ?auto_116518 ) ( ON ?auto_116515 ?auto_116516 ) ( CLEAR ?auto_116515 ) ( HOLDING ?auto_116514 ) ( CLEAR ?auto_116513 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116512 ?auto_116513 ?auto_116514 )
      ( MAKE-6PILE ?auto_116512 ?auto_116513 ?auto_116514 ?auto_116515 ?auto_116516 ?auto_116517 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116519 - BLOCK
      ?auto_116520 - BLOCK
      ?auto_116521 - BLOCK
      ?auto_116522 - BLOCK
      ?auto_116523 - BLOCK
      ?auto_116524 - BLOCK
    )
    :vars
    (
      ?auto_116525 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116519 ) ( ON ?auto_116520 ?auto_116519 ) ( not ( = ?auto_116519 ?auto_116520 ) ) ( not ( = ?auto_116519 ?auto_116521 ) ) ( not ( = ?auto_116519 ?auto_116522 ) ) ( not ( = ?auto_116519 ?auto_116523 ) ) ( not ( = ?auto_116519 ?auto_116524 ) ) ( not ( = ?auto_116520 ?auto_116521 ) ) ( not ( = ?auto_116520 ?auto_116522 ) ) ( not ( = ?auto_116520 ?auto_116523 ) ) ( not ( = ?auto_116520 ?auto_116524 ) ) ( not ( = ?auto_116521 ?auto_116522 ) ) ( not ( = ?auto_116521 ?auto_116523 ) ) ( not ( = ?auto_116521 ?auto_116524 ) ) ( not ( = ?auto_116522 ?auto_116523 ) ) ( not ( = ?auto_116522 ?auto_116524 ) ) ( not ( = ?auto_116523 ?auto_116524 ) ) ( ON ?auto_116524 ?auto_116525 ) ( not ( = ?auto_116519 ?auto_116525 ) ) ( not ( = ?auto_116520 ?auto_116525 ) ) ( not ( = ?auto_116521 ?auto_116525 ) ) ( not ( = ?auto_116522 ?auto_116525 ) ) ( not ( = ?auto_116523 ?auto_116525 ) ) ( not ( = ?auto_116524 ?auto_116525 ) ) ( ON ?auto_116523 ?auto_116524 ) ( ON-TABLE ?auto_116525 ) ( ON ?auto_116522 ?auto_116523 ) ( CLEAR ?auto_116520 ) ( ON ?auto_116521 ?auto_116522 ) ( CLEAR ?auto_116521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116525 ?auto_116524 ?auto_116523 ?auto_116522 )
      ( MAKE-6PILE ?auto_116519 ?auto_116520 ?auto_116521 ?auto_116522 ?auto_116523 ?auto_116524 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116526 - BLOCK
      ?auto_116527 - BLOCK
      ?auto_116528 - BLOCK
      ?auto_116529 - BLOCK
      ?auto_116530 - BLOCK
      ?auto_116531 - BLOCK
    )
    :vars
    (
      ?auto_116532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116526 ) ( not ( = ?auto_116526 ?auto_116527 ) ) ( not ( = ?auto_116526 ?auto_116528 ) ) ( not ( = ?auto_116526 ?auto_116529 ) ) ( not ( = ?auto_116526 ?auto_116530 ) ) ( not ( = ?auto_116526 ?auto_116531 ) ) ( not ( = ?auto_116527 ?auto_116528 ) ) ( not ( = ?auto_116527 ?auto_116529 ) ) ( not ( = ?auto_116527 ?auto_116530 ) ) ( not ( = ?auto_116527 ?auto_116531 ) ) ( not ( = ?auto_116528 ?auto_116529 ) ) ( not ( = ?auto_116528 ?auto_116530 ) ) ( not ( = ?auto_116528 ?auto_116531 ) ) ( not ( = ?auto_116529 ?auto_116530 ) ) ( not ( = ?auto_116529 ?auto_116531 ) ) ( not ( = ?auto_116530 ?auto_116531 ) ) ( ON ?auto_116531 ?auto_116532 ) ( not ( = ?auto_116526 ?auto_116532 ) ) ( not ( = ?auto_116527 ?auto_116532 ) ) ( not ( = ?auto_116528 ?auto_116532 ) ) ( not ( = ?auto_116529 ?auto_116532 ) ) ( not ( = ?auto_116530 ?auto_116532 ) ) ( not ( = ?auto_116531 ?auto_116532 ) ) ( ON ?auto_116530 ?auto_116531 ) ( ON-TABLE ?auto_116532 ) ( ON ?auto_116529 ?auto_116530 ) ( ON ?auto_116528 ?auto_116529 ) ( CLEAR ?auto_116528 ) ( HOLDING ?auto_116527 ) ( CLEAR ?auto_116526 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116526 ?auto_116527 )
      ( MAKE-6PILE ?auto_116526 ?auto_116527 ?auto_116528 ?auto_116529 ?auto_116530 ?auto_116531 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116533 - BLOCK
      ?auto_116534 - BLOCK
      ?auto_116535 - BLOCK
      ?auto_116536 - BLOCK
      ?auto_116537 - BLOCK
      ?auto_116538 - BLOCK
    )
    :vars
    (
      ?auto_116539 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116533 ) ( not ( = ?auto_116533 ?auto_116534 ) ) ( not ( = ?auto_116533 ?auto_116535 ) ) ( not ( = ?auto_116533 ?auto_116536 ) ) ( not ( = ?auto_116533 ?auto_116537 ) ) ( not ( = ?auto_116533 ?auto_116538 ) ) ( not ( = ?auto_116534 ?auto_116535 ) ) ( not ( = ?auto_116534 ?auto_116536 ) ) ( not ( = ?auto_116534 ?auto_116537 ) ) ( not ( = ?auto_116534 ?auto_116538 ) ) ( not ( = ?auto_116535 ?auto_116536 ) ) ( not ( = ?auto_116535 ?auto_116537 ) ) ( not ( = ?auto_116535 ?auto_116538 ) ) ( not ( = ?auto_116536 ?auto_116537 ) ) ( not ( = ?auto_116536 ?auto_116538 ) ) ( not ( = ?auto_116537 ?auto_116538 ) ) ( ON ?auto_116538 ?auto_116539 ) ( not ( = ?auto_116533 ?auto_116539 ) ) ( not ( = ?auto_116534 ?auto_116539 ) ) ( not ( = ?auto_116535 ?auto_116539 ) ) ( not ( = ?auto_116536 ?auto_116539 ) ) ( not ( = ?auto_116537 ?auto_116539 ) ) ( not ( = ?auto_116538 ?auto_116539 ) ) ( ON ?auto_116537 ?auto_116538 ) ( ON-TABLE ?auto_116539 ) ( ON ?auto_116536 ?auto_116537 ) ( ON ?auto_116535 ?auto_116536 ) ( CLEAR ?auto_116533 ) ( ON ?auto_116534 ?auto_116535 ) ( CLEAR ?auto_116534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116539 ?auto_116538 ?auto_116537 ?auto_116536 ?auto_116535 )
      ( MAKE-6PILE ?auto_116533 ?auto_116534 ?auto_116535 ?auto_116536 ?auto_116537 ?auto_116538 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116540 - BLOCK
      ?auto_116541 - BLOCK
      ?auto_116542 - BLOCK
      ?auto_116543 - BLOCK
      ?auto_116544 - BLOCK
      ?auto_116545 - BLOCK
    )
    :vars
    (
      ?auto_116546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116540 ?auto_116541 ) ) ( not ( = ?auto_116540 ?auto_116542 ) ) ( not ( = ?auto_116540 ?auto_116543 ) ) ( not ( = ?auto_116540 ?auto_116544 ) ) ( not ( = ?auto_116540 ?auto_116545 ) ) ( not ( = ?auto_116541 ?auto_116542 ) ) ( not ( = ?auto_116541 ?auto_116543 ) ) ( not ( = ?auto_116541 ?auto_116544 ) ) ( not ( = ?auto_116541 ?auto_116545 ) ) ( not ( = ?auto_116542 ?auto_116543 ) ) ( not ( = ?auto_116542 ?auto_116544 ) ) ( not ( = ?auto_116542 ?auto_116545 ) ) ( not ( = ?auto_116543 ?auto_116544 ) ) ( not ( = ?auto_116543 ?auto_116545 ) ) ( not ( = ?auto_116544 ?auto_116545 ) ) ( ON ?auto_116545 ?auto_116546 ) ( not ( = ?auto_116540 ?auto_116546 ) ) ( not ( = ?auto_116541 ?auto_116546 ) ) ( not ( = ?auto_116542 ?auto_116546 ) ) ( not ( = ?auto_116543 ?auto_116546 ) ) ( not ( = ?auto_116544 ?auto_116546 ) ) ( not ( = ?auto_116545 ?auto_116546 ) ) ( ON ?auto_116544 ?auto_116545 ) ( ON-TABLE ?auto_116546 ) ( ON ?auto_116543 ?auto_116544 ) ( ON ?auto_116542 ?auto_116543 ) ( ON ?auto_116541 ?auto_116542 ) ( CLEAR ?auto_116541 ) ( HOLDING ?auto_116540 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116540 )
      ( MAKE-6PILE ?auto_116540 ?auto_116541 ?auto_116542 ?auto_116543 ?auto_116544 ?auto_116545 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116547 - BLOCK
      ?auto_116548 - BLOCK
      ?auto_116549 - BLOCK
      ?auto_116550 - BLOCK
      ?auto_116551 - BLOCK
      ?auto_116552 - BLOCK
    )
    :vars
    (
      ?auto_116553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116547 ?auto_116548 ) ) ( not ( = ?auto_116547 ?auto_116549 ) ) ( not ( = ?auto_116547 ?auto_116550 ) ) ( not ( = ?auto_116547 ?auto_116551 ) ) ( not ( = ?auto_116547 ?auto_116552 ) ) ( not ( = ?auto_116548 ?auto_116549 ) ) ( not ( = ?auto_116548 ?auto_116550 ) ) ( not ( = ?auto_116548 ?auto_116551 ) ) ( not ( = ?auto_116548 ?auto_116552 ) ) ( not ( = ?auto_116549 ?auto_116550 ) ) ( not ( = ?auto_116549 ?auto_116551 ) ) ( not ( = ?auto_116549 ?auto_116552 ) ) ( not ( = ?auto_116550 ?auto_116551 ) ) ( not ( = ?auto_116550 ?auto_116552 ) ) ( not ( = ?auto_116551 ?auto_116552 ) ) ( ON ?auto_116552 ?auto_116553 ) ( not ( = ?auto_116547 ?auto_116553 ) ) ( not ( = ?auto_116548 ?auto_116553 ) ) ( not ( = ?auto_116549 ?auto_116553 ) ) ( not ( = ?auto_116550 ?auto_116553 ) ) ( not ( = ?auto_116551 ?auto_116553 ) ) ( not ( = ?auto_116552 ?auto_116553 ) ) ( ON ?auto_116551 ?auto_116552 ) ( ON-TABLE ?auto_116553 ) ( ON ?auto_116550 ?auto_116551 ) ( ON ?auto_116549 ?auto_116550 ) ( ON ?auto_116548 ?auto_116549 ) ( ON ?auto_116547 ?auto_116548 ) ( CLEAR ?auto_116547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116553 ?auto_116552 ?auto_116551 ?auto_116550 ?auto_116549 ?auto_116548 )
      ( MAKE-6PILE ?auto_116547 ?auto_116548 ?auto_116549 ?auto_116550 ?auto_116551 ?auto_116552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116560 - BLOCK
      ?auto_116561 - BLOCK
      ?auto_116562 - BLOCK
      ?auto_116563 - BLOCK
      ?auto_116564 - BLOCK
      ?auto_116565 - BLOCK
    )
    :vars
    (
      ?auto_116566 - BLOCK
      ?auto_116567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116560 ?auto_116561 ) ) ( not ( = ?auto_116560 ?auto_116562 ) ) ( not ( = ?auto_116560 ?auto_116563 ) ) ( not ( = ?auto_116560 ?auto_116564 ) ) ( not ( = ?auto_116560 ?auto_116565 ) ) ( not ( = ?auto_116561 ?auto_116562 ) ) ( not ( = ?auto_116561 ?auto_116563 ) ) ( not ( = ?auto_116561 ?auto_116564 ) ) ( not ( = ?auto_116561 ?auto_116565 ) ) ( not ( = ?auto_116562 ?auto_116563 ) ) ( not ( = ?auto_116562 ?auto_116564 ) ) ( not ( = ?auto_116562 ?auto_116565 ) ) ( not ( = ?auto_116563 ?auto_116564 ) ) ( not ( = ?auto_116563 ?auto_116565 ) ) ( not ( = ?auto_116564 ?auto_116565 ) ) ( ON ?auto_116565 ?auto_116566 ) ( not ( = ?auto_116560 ?auto_116566 ) ) ( not ( = ?auto_116561 ?auto_116566 ) ) ( not ( = ?auto_116562 ?auto_116566 ) ) ( not ( = ?auto_116563 ?auto_116566 ) ) ( not ( = ?auto_116564 ?auto_116566 ) ) ( not ( = ?auto_116565 ?auto_116566 ) ) ( ON ?auto_116564 ?auto_116565 ) ( ON-TABLE ?auto_116566 ) ( ON ?auto_116563 ?auto_116564 ) ( ON ?auto_116562 ?auto_116563 ) ( ON ?auto_116561 ?auto_116562 ) ( CLEAR ?auto_116561 ) ( ON ?auto_116560 ?auto_116567 ) ( CLEAR ?auto_116560 ) ( HAND-EMPTY ) ( not ( = ?auto_116560 ?auto_116567 ) ) ( not ( = ?auto_116561 ?auto_116567 ) ) ( not ( = ?auto_116562 ?auto_116567 ) ) ( not ( = ?auto_116563 ?auto_116567 ) ) ( not ( = ?auto_116564 ?auto_116567 ) ) ( not ( = ?auto_116565 ?auto_116567 ) ) ( not ( = ?auto_116566 ?auto_116567 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116560 ?auto_116567 )
      ( MAKE-6PILE ?auto_116560 ?auto_116561 ?auto_116562 ?auto_116563 ?auto_116564 ?auto_116565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116568 - BLOCK
      ?auto_116569 - BLOCK
      ?auto_116570 - BLOCK
      ?auto_116571 - BLOCK
      ?auto_116572 - BLOCK
      ?auto_116573 - BLOCK
    )
    :vars
    (
      ?auto_116575 - BLOCK
      ?auto_116574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116568 ?auto_116569 ) ) ( not ( = ?auto_116568 ?auto_116570 ) ) ( not ( = ?auto_116568 ?auto_116571 ) ) ( not ( = ?auto_116568 ?auto_116572 ) ) ( not ( = ?auto_116568 ?auto_116573 ) ) ( not ( = ?auto_116569 ?auto_116570 ) ) ( not ( = ?auto_116569 ?auto_116571 ) ) ( not ( = ?auto_116569 ?auto_116572 ) ) ( not ( = ?auto_116569 ?auto_116573 ) ) ( not ( = ?auto_116570 ?auto_116571 ) ) ( not ( = ?auto_116570 ?auto_116572 ) ) ( not ( = ?auto_116570 ?auto_116573 ) ) ( not ( = ?auto_116571 ?auto_116572 ) ) ( not ( = ?auto_116571 ?auto_116573 ) ) ( not ( = ?auto_116572 ?auto_116573 ) ) ( ON ?auto_116573 ?auto_116575 ) ( not ( = ?auto_116568 ?auto_116575 ) ) ( not ( = ?auto_116569 ?auto_116575 ) ) ( not ( = ?auto_116570 ?auto_116575 ) ) ( not ( = ?auto_116571 ?auto_116575 ) ) ( not ( = ?auto_116572 ?auto_116575 ) ) ( not ( = ?auto_116573 ?auto_116575 ) ) ( ON ?auto_116572 ?auto_116573 ) ( ON-TABLE ?auto_116575 ) ( ON ?auto_116571 ?auto_116572 ) ( ON ?auto_116570 ?auto_116571 ) ( ON ?auto_116568 ?auto_116574 ) ( CLEAR ?auto_116568 ) ( not ( = ?auto_116568 ?auto_116574 ) ) ( not ( = ?auto_116569 ?auto_116574 ) ) ( not ( = ?auto_116570 ?auto_116574 ) ) ( not ( = ?auto_116571 ?auto_116574 ) ) ( not ( = ?auto_116572 ?auto_116574 ) ) ( not ( = ?auto_116573 ?auto_116574 ) ) ( not ( = ?auto_116575 ?auto_116574 ) ) ( HOLDING ?auto_116569 ) ( CLEAR ?auto_116570 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116575 ?auto_116573 ?auto_116572 ?auto_116571 ?auto_116570 ?auto_116569 )
      ( MAKE-6PILE ?auto_116568 ?auto_116569 ?auto_116570 ?auto_116571 ?auto_116572 ?auto_116573 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116576 - BLOCK
      ?auto_116577 - BLOCK
      ?auto_116578 - BLOCK
      ?auto_116579 - BLOCK
      ?auto_116580 - BLOCK
      ?auto_116581 - BLOCK
    )
    :vars
    (
      ?auto_116583 - BLOCK
      ?auto_116582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116576 ?auto_116577 ) ) ( not ( = ?auto_116576 ?auto_116578 ) ) ( not ( = ?auto_116576 ?auto_116579 ) ) ( not ( = ?auto_116576 ?auto_116580 ) ) ( not ( = ?auto_116576 ?auto_116581 ) ) ( not ( = ?auto_116577 ?auto_116578 ) ) ( not ( = ?auto_116577 ?auto_116579 ) ) ( not ( = ?auto_116577 ?auto_116580 ) ) ( not ( = ?auto_116577 ?auto_116581 ) ) ( not ( = ?auto_116578 ?auto_116579 ) ) ( not ( = ?auto_116578 ?auto_116580 ) ) ( not ( = ?auto_116578 ?auto_116581 ) ) ( not ( = ?auto_116579 ?auto_116580 ) ) ( not ( = ?auto_116579 ?auto_116581 ) ) ( not ( = ?auto_116580 ?auto_116581 ) ) ( ON ?auto_116581 ?auto_116583 ) ( not ( = ?auto_116576 ?auto_116583 ) ) ( not ( = ?auto_116577 ?auto_116583 ) ) ( not ( = ?auto_116578 ?auto_116583 ) ) ( not ( = ?auto_116579 ?auto_116583 ) ) ( not ( = ?auto_116580 ?auto_116583 ) ) ( not ( = ?auto_116581 ?auto_116583 ) ) ( ON ?auto_116580 ?auto_116581 ) ( ON-TABLE ?auto_116583 ) ( ON ?auto_116579 ?auto_116580 ) ( ON ?auto_116578 ?auto_116579 ) ( ON ?auto_116576 ?auto_116582 ) ( not ( = ?auto_116576 ?auto_116582 ) ) ( not ( = ?auto_116577 ?auto_116582 ) ) ( not ( = ?auto_116578 ?auto_116582 ) ) ( not ( = ?auto_116579 ?auto_116582 ) ) ( not ( = ?auto_116580 ?auto_116582 ) ) ( not ( = ?auto_116581 ?auto_116582 ) ) ( not ( = ?auto_116583 ?auto_116582 ) ) ( CLEAR ?auto_116578 ) ( ON ?auto_116577 ?auto_116576 ) ( CLEAR ?auto_116577 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116582 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116582 ?auto_116576 )
      ( MAKE-6PILE ?auto_116576 ?auto_116577 ?auto_116578 ?auto_116579 ?auto_116580 ?auto_116581 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116584 - BLOCK
      ?auto_116585 - BLOCK
      ?auto_116586 - BLOCK
      ?auto_116587 - BLOCK
      ?auto_116588 - BLOCK
      ?auto_116589 - BLOCK
    )
    :vars
    (
      ?auto_116590 - BLOCK
      ?auto_116591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116584 ?auto_116585 ) ) ( not ( = ?auto_116584 ?auto_116586 ) ) ( not ( = ?auto_116584 ?auto_116587 ) ) ( not ( = ?auto_116584 ?auto_116588 ) ) ( not ( = ?auto_116584 ?auto_116589 ) ) ( not ( = ?auto_116585 ?auto_116586 ) ) ( not ( = ?auto_116585 ?auto_116587 ) ) ( not ( = ?auto_116585 ?auto_116588 ) ) ( not ( = ?auto_116585 ?auto_116589 ) ) ( not ( = ?auto_116586 ?auto_116587 ) ) ( not ( = ?auto_116586 ?auto_116588 ) ) ( not ( = ?auto_116586 ?auto_116589 ) ) ( not ( = ?auto_116587 ?auto_116588 ) ) ( not ( = ?auto_116587 ?auto_116589 ) ) ( not ( = ?auto_116588 ?auto_116589 ) ) ( ON ?auto_116589 ?auto_116590 ) ( not ( = ?auto_116584 ?auto_116590 ) ) ( not ( = ?auto_116585 ?auto_116590 ) ) ( not ( = ?auto_116586 ?auto_116590 ) ) ( not ( = ?auto_116587 ?auto_116590 ) ) ( not ( = ?auto_116588 ?auto_116590 ) ) ( not ( = ?auto_116589 ?auto_116590 ) ) ( ON ?auto_116588 ?auto_116589 ) ( ON-TABLE ?auto_116590 ) ( ON ?auto_116587 ?auto_116588 ) ( ON ?auto_116584 ?auto_116591 ) ( not ( = ?auto_116584 ?auto_116591 ) ) ( not ( = ?auto_116585 ?auto_116591 ) ) ( not ( = ?auto_116586 ?auto_116591 ) ) ( not ( = ?auto_116587 ?auto_116591 ) ) ( not ( = ?auto_116588 ?auto_116591 ) ) ( not ( = ?auto_116589 ?auto_116591 ) ) ( not ( = ?auto_116590 ?auto_116591 ) ) ( ON ?auto_116585 ?auto_116584 ) ( CLEAR ?auto_116585 ) ( ON-TABLE ?auto_116591 ) ( HOLDING ?auto_116586 ) ( CLEAR ?auto_116587 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116590 ?auto_116589 ?auto_116588 ?auto_116587 ?auto_116586 )
      ( MAKE-6PILE ?auto_116584 ?auto_116585 ?auto_116586 ?auto_116587 ?auto_116588 ?auto_116589 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116592 - BLOCK
      ?auto_116593 - BLOCK
      ?auto_116594 - BLOCK
      ?auto_116595 - BLOCK
      ?auto_116596 - BLOCK
      ?auto_116597 - BLOCK
    )
    :vars
    (
      ?auto_116599 - BLOCK
      ?auto_116598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116592 ?auto_116593 ) ) ( not ( = ?auto_116592 ?auto_116594 ) ) ( not ( = ?auto_116592 ?auto_116595 ) ) ( not ( = ?auto_116592 ?auto_116596 ) ) ( not ( = ?auto_116592 ?auto_116597 ) ) ( not ( = ?auto_116593 ?auto_116594 ) ) ( not ( = ?auto_116593 ?auto_116595 ) ) ( not ( = ?auto_116593 ?auto_116596 ) ) ( not ( = ?auto_116593 ?auto_116597 ) ) ( not ( = ?auto_116594 ?auto_116595 ) ) ( not ( = ?auto_116594 ?auto_116596 ) ) ( not ( = ?auto_116594 ?auto_116597 ) ) ( not ( = ?auto_116595 ?auto_116596 ) ) ( not ( = ?auto_116595 ?auto_116597 ) ) ( not ( = ?auto_116596 ?auto_116597 ) ) ( ON ?auto_116597 ?auto_116599 ) ( not ( = ?auto_116592 ?auto_116599 ) ) ( not ( = ?auto_116593 ?auto_116599 ) ) ( not ( = ?auto_116594 ?auto_116599 ) ) ( not ( = ?auto_116595 ?auto_116599 ) ) ( not ( = ?auto_116596 ?auto_116599 ) ) ( not ( = ?auto_116597 ?auto_116599 ) ) ( ON ?auto_116596 ?auto_116597 ) ( ON-TABLE ?auto_116599 ) ( ON ?auto_116595 ?auto_116596 ) ( ON ?auto_116592 ?auto_116598 ) ( not ( = ?auto_116592 ?auto_116598 ) ) ( not ( = ?auto_116593 ?auto_116598 ) ) ( not ( = ?auto_116594 ?auto_116598 ) ) ( not ( = ?auto_116595 ?auto_116598 ) ) ( not ( = ?auto_116596 ?auto_116598 ) ) ( not ( = ?auto_116597 ?auto_116598 ) ) ( not ( = ?auto_116599 ?auto_116598 ) ) ( ON ?auto_116593 ?auto_116592 ) ( ON-TABLE ?auto_116598 ) ( CLEAR ?auto_116595 ) ( ON ?auto_116594 ?auto_116593 ) ( CLEAR ?auto_116594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116598 ?auto_116592 ?auto_116593 )
      ( MAKE-6PILE ?auto_116592 ?auto_116593 ?auto_116594 ?auto_116595 ?auto_116596 ?auto_116597 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116600 - BLOCK
      ?auto_116601 - BLOCK
      ?auto_116602 - BLOCK
      ?auto_116603 - BLOCK
      ?auto_116604 - BLOCK
      ?auto_116605 - BLOCK
    )
    :vars
    (
      ?auto_116607 - BLOCK
      ?auto_116606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116600 ?auto_116601 ) ) ( not ( = ?auto_116600 ?auto_116602 ) ) ( not ( = ?auto_116600 ?auto_116603 ) ) ( not ( = ?auto_116600 ?auto_116604 ) ) ( not ( = ?auto_116600 ?auto_116605 ) ) ( not ( = ?auto_116601 ?auto_116602 ) ) ( not ( = ?auto_116601 ?auto_116603 ) ) ( not ( = ?auto_116601 ?auto_116604 ) ) ( not ( = ?auto_116601 ?auto_116605 ) ) ( not ( = ?auto_116602 ?auto_116603 ) ) ( not ( = ?auto_116602 ?auto_116604 ) ) ( not ( = ?auto_116602 ?auto_116605 ) ) ( not ( = ?auto_116603 ?auto_116604 ) ) ( not ( = ?auto_116603 ?auto_116605 ) ) ( not ( = ?auto_116604 ?auto_116605 ) ) ( ON ?auto_116605 ?auto_116607 ) ( not ( = ?auto_116600 ?auto_116607 ) ) ( not ( = ?auto_116601 ?auto_116607 ) ) ( not ( = ?auto_116602 ?auto_116607 ) ) ( not ( = ?auto_116603 ?auto_116607 ) ) ( not ( = ?auto_116604 ?auto_116607 ) ) ( not ( = ?auto_116605 ?auto_116607 ) ) ( ON ?auto_116604 ?auto_116605 ) ( ON-TABLE ?auto_116607 ) ( ON ?auto_116600 ?auto_116606 ) ( not ( = ?auto_116600 ?auto_116606 ) ) ( not ( = ?auto_116601 ?auto_116606 ) ) ( not ( = ?auto_116602 ?auto_116606 ) ) ( not ( = ?auto_116603 ?auto_116606 ) ) ( not ( = ?auto_116604 ?auto_116606 ) ) ( not ( = ?auto_116605 ?auto_116606 ) ) ( not ( = ?auto_116607 ?auto_116606 ) ) ( ON ?auto_116601 ?auto_116600 ) ( ON-TABLE ?auto_116606 ) ( ON ?auto_116602 ?auto_116601 ) ( CLEAR ?auto_116602 ) ( HOLDING ?auto_116603 ) ( CLEAR ?auto_116604 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116607 ?auto_116605 ?auto_116604 ?auto_116603 )
      ( MAKE-6PILE ?auto_116600 ?auto_116601 ?auto_116602 ?auto_116603 ?auto_116604 ?auto_116605 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116608 - BLOCK
      ?auto_116609 - BLOCK
      ?auto_116610 - BLOCK
      ?auto_116611 - BLOCK
      ?auto_116612 - BLOCK
      ?auto_116613 - BLOCK
    )
    :vars
    (
      ?auto_116615 - BLOCK
      ?auto_116614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116608 ?auto_116609 ) ) ( not ( = ?auto_116608 ?auto_116610 ) ) ( not ( = ?auto_116608 ?auto_116611 ) ) ( not ( = ?auto_116608 ?auto_116612 ) ) ( not ( = ?auto_116608 ?auto_116613 ) ) ( not ( = ?auto_116609 ?auto_116610 ) ) ( not ( = ?auto_116609 ?auto_116611 ) ) ( not ( = ?auto_116609 ?auto_116612 ) ) ( not ( = ?auto_116609 ?auto_116613 ) ) ( not ( = ?auto_116610 ?auto_116611 ) ) ( not ( = ?auto_116610 ?auto_116612 ) ) ( not ( = ?auto_116610 ?auto_116613 ) ) ( not ( = ?auto_116611 ?auto_116612 ) ) ( not ( = ?auto_116611 ?auto_116613 ) ) ( not ( = ?auto_116612 ?auto_116613 ) ) ( ON ?auto_116613 ?auto_116615 ) ( not ( = ?auto_116608 ?auto_116615 ) ) ( not ( = ?auto_116609 ?auto_116615 ) ) ( not ( = ?auto_116610 ?auto_116615 ) ) ( not ( = ?auto_116611 ?auto_116615 ) ) ( not ( = ?auto_116612 ?auto_116615 ) ) ( not ( = ?auto_116613 ?auto_116615 ) ) ( ON ?auto_116612 ?auto_116613 ) ( ON-TABLE ?auto_116615 ) ( ON ?auto_116608 ?auto_116614 ) ( not ( = ?auto_116608 ?auto_116614 ) ) ( not ( = ?auto_116609 ?auto_116614 ) ) ( not ( = ?auto_116610 ?auto_116614 ) ) ( not ( = ?auto_116611 ?auto_116614 ) ) ( not ( = ?auto_116612 ?auto_116614 ) ) ( not ( = ?auto_116613 ?auto_116614 ) ) ( not ( = ?auto_116615 ?auto_116614 ) ) ( ON ?auto_116609 ?auto_116608 ) ( ON-TABLE ?auto_116614 ) ( ON ?auto_116610 ?auto_116609 ) ( CLEAR ?auto_116612 ) ( ON ?auto_116611 ?auto_116610 ) ( CLEAR ?auto_116611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116614 ?auto_116608 ?auto_116609 ?auto_116610 )
      ( MAKE-6PILE ?auto_116608 ?auto_116609 ?auto_116610 ?auto_116611 ?auto_116612 ?auto_116613 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116616 - BLOCK
      ?auto_116617 - BLOCK
      ?auto_116618 - BLOCK
      ?auto_116619 - BLOCK
      ?auto_116620 - BLOCK
      ?auto_116621 - BLOCK
    )
    :vars
    (
      ?auto_116623 - BLOCK
      ?auto_116622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116616 ?auto_116617 ) ) ( not ( = ?auto_116616 ?auto_116618 ) ) ( not ( = ?auto_116616 ?auto_116619 ) ) ( not ( = ?auto_116616 ?auto_116620 ) ) ( not ( = ?auto_116616 ?auto_116621 ) ) ( not ( = ?auto_116617 ?auto_116618 ) ) ( not ( = ?auto_116617 ?auto_116619 ) ) ( not ( = ?auto_116617 ?auto_116620 ) ) ( not ( = ?auto_116617 ?auto_116621 ) ) ( not ( = ?auto_116618 ?auto_116619 ) ) ( not ( = ?auto_116618 ?auto_116620 ) ) ( not ( = ?auto_116618 ?auto_116621 ) ) ( not ( = ?auto_116619 ?auto_116620 ) ) ( not ( = ?auto_116619 ?auto_116621 ) ) ( not ( = ?auto_116620 ?auto_116621 ) ) ( ON ?auto_116621 ?auto_116623 ) ( not ( = ?auto_116616 ?auto_116623 ) ) ( not ( = ?auto_116617 ?auto_116623 ) ) ( not ( = ?auto_116618 ?auto_116623 ) ) ( not ( = ?auto_116619 ?auto_116623 ) ) ( not ( = ?auto_116620 ?auto_116623 ) ) ( not ( = ?auto_116621 ?auto_116623 ) ) ( ON-TABLE ?auto_116623 ) ( ON ?auto_116616 ?auto_116622 ) ( not ( = ?auto_116616 ?auto_116622 ) ) ( not ( = ?auto_116617 ?auto_116622 ) ) ( not ( = ?auto_116618 ?auto_116622 ) ) ( not ( = ?auto_116619 ?auto_116622 ) ) ( not ( = ?auto_116620 ?auto_116622 ) ) ( not ( = ?auto_116621 ?auto_116622 ) ) ( not ( = ?auto_116623 ?auto_116622 ) ) ( ON ?auto_116617 ?auto_116616 ) ( ON-TABLE ?auto_116622 ) ( ON ?auto_116618 ?auto_116617 ) ( ON ?auto_116619 ?auto_116618 ) ( CLEAR ?auto_116619 ) ( HOLDING ?auto_116620 ) ( CLEAR ?auto_116621 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116623 ?auto_116621 ?auto_116620 )
      ( MAKE-6PILE ?auto_116616 ?auto_116617 ?auto_116618 ?auto_116619 ?auto_116620 ?auto_116621 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116624 - BLOCK
      ?auto_116625 - BLOCK
      ?auto_116626 - BLOCK
      ?auto_116627 - BLOCK
      ?auto_116628 - BLOCK
      ?auto_116629 - BLOCK
    )
    :vars
    (
      ?auto_116630 - BLOCK
      ?auto_116631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116624 ?auto_116625 ) ) ( not ( = ?auto_116624 ?auto_116626 ) ) ( not ( = ?auto_116624 ?auto_116627 ) ) ( not ( = ?auto_116624 ?auto_116628 ) ) ( not ( = ?auto_116624 ?auto_116629 ) ) ( not ( = ?auto_116625 ?auto_116626 ) ) ( not ( = ?auto_116625 ?auto_116627 ) ) ( not ( = ?auto_116625 ?auto_116628 ) ) ( not ( = ?auto_116625 ?auto_116629 ) ) ( not ( = ?auto_116626 ?auto_116627 ) ) ( not ( = ?auto_116626 ?auto_116628 ) ) ( not ( = ?auto_116626 ?auto_116629 ) ) ( not ( = ?auto_116627 ?auto_116628 ) ) ( not ( = ?auto_116627 ?auto_116629 ) ) ( not ( = ?auto_116628 ?auto_116629 ) ) ( ON ?auto_116629 ?auto_116630 ) ( not ( = ?auto_116624 ?auto_116630 ) ) ( not ( = ?auto_116625 ?auto_116630 ) ) ( not ( = ?auto_116626 ?auto_116630 ) ) ( not ( = ?auto_116627 ?auto_116630 ) ) ( not ( = ?auto_116628 ?auto_116630 ) ) ( not ( = ?auto_116629 ?auto_116630 ) ) ( ON-TABLE ?auto_116630 ) ( ON ?auto_116624 ?auto_116631 ) ( not ( = ?auto_116624 ?auto_116631 ) ) ( not ( = ?auto_116625 ?auto_116631 ) ) ( not ( = ?auto_116626 ?auto_116631 ) ) ( not ( = ?auto_116627 ?auto_116631 ) ) ( not ( = ?auto_116628 ?auto_116631 ) ) ( not ( = ?auto_116629 ?auto_116631 ) ) ( not ( = ?auto_116630 ?auto_116631 ) ) ( ON ?auto_116625 ?auto_116624 ) ( ON-TABLE ?auto_116631 ) ( ON ?auto_116626 ?auto_116625 ) ( ON ?auto_116627 ?auto_116626 ) ( CLEAR ?auto_116629 ) ( ON ?auto_116628 ?auto_116627 ) ( CLEAR ?auto_116628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116631 ?auto_116624 ?auto_116625 ?auto_116626 ?auto_116627 )
      ( MAKE-6PILE ?auto_116624 ?auto_116625 ?auto_116626 ?auto_116627 ?auto_116628 ?auto_116629 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116632 - BLOCK
      ?auto_116633 - BLOCK
      ?auto_116634 - BLOCK
      ?auto_116635 - BLOCK
      ?auto_116636 - BLOCK
      ?auto_116637 - BLOCK
    )
    :vars
    (
      ?auto_116638 - BLOCK
      ?auto_116639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116632 ?auto_116633 ) ) ( not ( = ?auto_116632 ?auto_116634 ) ) ( not ( = ?auto_116632 ?auto_116635 ) ) ( not ( = ?auto_116632 ?auto_116636 ) ) ( not ( = ?auto_116632 ?auto_116637 ) ) ( not ( = ?auto_116633 ?auto_116634 ) ) ( not ( = ?auto_116633 ?auto_116635 ) ) ( not ( = ?auto_116633 ?auto_116636 ) ) ( not ( = ?auto_116633 ?auto_116637 ) ) ( not ( = ?auto_116634 ?auto_116635 ) ) ( not ( = ?auto_116634 ?auto_116636 ) ) ( not ( = ?auto_116634 ?auto_116637 ) ) ( not ( = ?auto_116635 ?auto_116636 ) ) ( not ( = ?auto_116635 ?auto_116637 ) ) ( not ( = ?auto_116636 ?auto_116637 ) ) ( not ( = ?auto_116632 ?auto_116638 ) ) ( not ( = ?auto_116633 ?auto_116638 ) ) ( not ( = ?auto_116634 ?auto_116638 ) ) ( not ( = ?auto_116635 ?auto_116638 ) ) ( not ( = ?auto_116636 ?auto_116638 ) ) ( not ( = ?auto_116637 ?auto_116638 ) ) ( ON-TABLE ?auto_116638 ) ( ON ?auto_116632 ?auto_116639 ) ( not ( = ?auto_116632 ?auto_116639 ) ) ( not ( = ?auto_116633 ?auto_116639 ) ) ( not ( = ?auto_116634 ?auto_116639 ) ) ( not ( = ?auto_116635 ?auto_116639 ) ) ( not ( = ?auto_116636 ?auto_116639 ) ) ( not ( = ?auto_116637 ?auto_116639 ) ) ( not ( = ?auto_116638 ?auto_116639 ) ) ( ON ?auto_116633 ?auto_116632 ) ( ON-TABLE ?auto_116639 ) ( ON ?auto_116634 ?auto_116633 ) ( ON ?auto_116635 ?auto_116634 ) ( ON ?auto_116636 ?auto_116635 ) ( CLEAR ?auto_116636 ) ( HOLDING ?auto_116637 ) ( CLEAR ?auto_116638 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116638 ?auto_116637 )
      ( MAKE-6PILE ?auto_116632 ?auto_116633 ?auto_116634 ?auto_116635 ?auto_116636 ?auto_116637 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116640 - BLOCK
      ?auto_116641 - BLOCK
      ?auto_116642 - BLOCK
      ?auto_116643 - BLOCK
      ?auto_116644 - BLOCK
      ?auto_116645 - BLOCK
    )
    :vars
    (
      ?auto_116647 - BLOCK
      ?auto_116646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116640 ?auto_116641 ) ) ( not ( = ?auto_116640 ?auto_116642 ) ) ( not ( = ?auto_116640 ?auto_116643 ) ) ( not ( = ?auto_116640 ?auto_116644 ) ) ( not ( = ?auto_116640 ?auto_116645 ) ) ( not ( = ?auto_116641 ?auto_116642 ) ) ( not ( = ?auto_116641 ?auto_116643 ) ) ( not ( = ?auto_116641 ?auto_116644 ) ) ( not ( = ?auto_116641 ?auto_116645 ) ) ( not ( = ?auto_116642 ?auto_116643 ) ) ( not ( = ?auto_116642 ?auto_116644 ) ) ( not ( = ?auto_116642 ?auto_116645 ) ) ( not ( = ?auto_116643 ?auto_116644 ) ) ( not ( = ?auto_116643 ?auto_116645 ) ) ( not ( = ?auto_116644 ?auto_116645 ) ) ( not ( = ?auto_116640 ?auto_116647 ) ) ( not ( = ?auto_116641 ?auto_116647 ) ) ( not ( = ?auto_116642 ?auto_116647 ) ) ( not ( = ?auto_116643 ?auto_116647 ) ) ( not ( = ?auto_116644 ?auto_116647 ) ) ( not ( = ?auto_116645 ?auto_116647 ) ) ( ON-TABLE ?auto_116647 ) ( ON ?auto_116640 ?auto_116646 ) ( not ( = ?auto_116640 ?auto_116646 ) ) ( not ( = ?auto_116641 ?auto_116646 ) ) ( not ( = ?auto_116642 ?auto_116646 ) ) ( not ( = ?auto_116643 ?auto_116646 ) ) ( not ( = ?auto_116644 ?auto_116646 ) ) ( not ( = ?auto_116645 ?auto_116646 ) ) ( not ( = ?auto_116647 ?auto_116646 ) ) ( ON ?auto_116641 ?auto_116640 ) ( ON-TABLE ?auto_116646 ) ( ON ?auto_116642 ?auto_116641 ) ( ON ?auto_116643 ?auto_116642 ) ( ON ?auto_116644 ?auto_116643 ) ( CLEAR ?auto_116647 ) ( ON ?auto_116645 ?auto_116644 ) ( CLEAR ?auto_116645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116646 ?auto_116640 ?auto_116641 ?auto_116642 ?auto_116643 ?auto_116644 )
      ( MAKE-6PILE ?auto_116640 ?auto_116641 ?auto_116642 ?auto_116643 ?auto_116644 ?auto_116645 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116648 - BLOCK
      ?auto_116649 - BLOCK
      ?auto_116650 - BLOCK
      ?auto_116651 - BLOCK
      ?auto_116652 - BLOCK
      ?auto_116653 - BLOCK
    )
    :vars
    (
      ?auto_116654 - BLOCK
      ?auto_116655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116648 ?auto_116649 ) ) ( not ( = ?auto_116648 ?auto_116650 ) ) ( not ( = ?auto_116648 ?auto_116651 ) ) ( not ( = ?auto_116648 ?auto_116652 ) ) ( not ( = ?auto_116648 ?auto_116653 ) ) ( not ( = ?auto_116649 ?auto_116650 ) ) ( not ( = ?auto_116649 ?auto_116651 ) ) ( not ( = ?auto_116649 ?auto_116652 ) ) ( not ( = ?auto_116649 ?auto_116653 ) ) ( not ( = ?auto_116650 ?auto_116651 ) ) ( not ( = ?auto_116650 ?auto_116652 ) ) ( not ( = ?auto_116650 ?auto_116653 ) ) ( not ( = ?auto_116651 ?auto_116652 ) ) ( not ( = ?auto_116651 ?auto_116653 ) ) ( not ( = ?auto_116652 ?auto_116653 ) ) ( not ( = ?auto_116648 ?auto_116654 ) ) ( not ( = ?auto_116649 ?auto_116654 ) ) ( not ( = ?auto_116650 ?auto_116654 ) ) ( not ( = ?auto_116651 ?auto_116654 ) ) ( not ( = ?auto_116652 ?auto_116654 ) ) ( not ( = ?auto_116653 ?auto_116654 ) ) ( ON ?auto_116648 ?auto_116655 ) ( not ( = ?auto_116648 ?auto_116655 ) ) ( not ( = ?auto_116649 ?auto_116655 ) ) ( not ( = ?auto_116650 ?auto_116655 ) ) ( not ( = ?auto_116651 ?auto_116655 ) ) ( not ( = ?auto_116652 ?auto_116655 ) ) ( not ( = ?auto_116653 ?auto_116655 ) ) ( not ( = ?auto_116654 ?auto_116655 ) ) ( ON ?auto_116649 ?auto_116648 ) ( ON-TABLE ?auto_116655 ) ( ON ?auto_116650 ?auto_116649 ) ( ON ?auto_116651 ?auto_116650 ) ( ON ?auto_116652 ?auto_116651 ) ( ON ?auto_116653 ?auto_116652 ) ( CLEAR ?auto_116653 ) ( HOLDING ?auto_116654 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116654 )
      ( MAKE-6PILE ?auto_116648 ?auto_116649 ?auto_116650 ?auto_116651 ?auto_116652 ?auto_116653 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116656 - BLOCK
      ?auto_116657 - BLOCK
      ?auto_116658 - BLOCK
      ?auto_116659 - BLOCK
      ?auto_116660 - BLOCK
      ?auto_116661 - BLOCK
    )
    :vars
    (
      ?auto_116663 - BLOCK
      ?auto_116662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116656 ?auto_116657 ) ) ( not ( = ?auto_116656 ?auto_116658 ) ) ( not ( = ?auto_116656 ?auto_116659 ) ) ( not ( = ?auto_116656 ?auto_116660 ) ) ( not ( = ?auto_116656 ?auto_116661 ) ) ( not ( = ?auto_116657 ?auto_116658 ) ) ( not ( = ?auto_116657 ?auto_116659 ) ) ( not ( = ?auto_116657 ?auto_116660 ) ) ( not ( = ?auto_116657 ?auto_116661 ) ) ( not ( = ?auto_116658 ?auto_116659 ) ) ( not ( = ?auto_116658 ?auto_116660 ) ) ( not ( = ?auto_116658 ?auto_116661 ) ) ( not ( = ?auto_116659 ?auto_116660 ) ) ( not ( = ?auto_116659 ?auto_116661 ) ) ( not ( = ?auto_116660 ?auto_116661 ) ) ( not ( = ?auto_116656 ?auto_116663 ) ) ( not ( = ?auto_116657 ?auto_116663 ) ) ( not ( = ?auto_116658 ?auto_116663 ) ) ( not ( = ?auto_116659 ?auto_116663 ) ) ( not ( = ?auto_116660 ?auto_116663 ) ) ( not ( = ?auto_116661 ?auto_116663 ) ) ( ON ?auto_116656 ?auto_116662 ) ( not ( = ?auto_116656 ?auto_116662 ) ) ( not ( = ?auto_116657 ?auto_116662 ) ) ( not ( = ?auto_116658 ?auto_116662 ) ) ( not ( = ?auto_116659 ?auto_116662 ) ) ( not ( = ?auto_116660 ?auto_116662 ) ) ( not ( = ?auto_116661 ?auto_116662 ) ) ( not ( = ?auto_116663 ?auto_116662 ) ) ( ON ?auto_116657 ?auto_116656 ) ( ON-TABLE ?auto_116662 ) ( ON ?auto_116658 ?auto_116657 ) ( ON ?auto_116659 ?auto_116658 ) ( ON ?auto_116660 ?auto_116659 ) ( ON ?auto_116661 ?auto_116660 ) ( ON ?auto_116663 ?auto_116661 ) ( CLEAR ?auto_116663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116662 ?auto_116656 ?auto_116657 ?auto_116658 ?auto_116659 ?auto_116660 ?auto_116661 )
      ( MAKE-6PILE ?auto_116656 ?auto_116657 ?auto_116658 ?auto_116659 ?auto_116660 ?auto_116661 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116678 - BLOCK
      ?auto_116679 - BLOCK
      ?auto_116680 - BLOCK
      ?auto_116681 - BLOCK
      ?auto_116682 - BLOCK
      ?auto_116683 - BLOCK
      ?auto_116684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_116683 ) ( ON-TABLE ?auto_116678 ) ( ON ?auto_116679 ?auto_116678 ) ( ON ?auto_116680 ?auto_116679 ) ( ON ?auto_116681 ?auto_116680 ) ( ON ?auto_116682 ?auto_116681 ) ( ON ?auto_116683 ?auto_116682 ) ( not ( = ?auto_116678 ?auto_116679 ) ) ( not ( = ?auto_116678 ?auto_116680 ) ) ( not ( = ?auto_116678 ?auto_116681 ) ) ( not ( = ?auto_116678 ?auto_116682 ) ) ( not ( = ?auto_116678 ?auto_116683 ) ) ( not ( = ?auto_116678 ?auto_116684 ) ) ( not ( = ?auto_116679 ?auto_116680 ) ) ( not ( = ?auto_116679 ?auto_116681 ) ) ( not ( = ?auto_116679 ?auto_116682 ) ) ( not ( = ?auto_116679 ?auto_116683 ) ) ( not ( = ?auto_116679 ?auto_116684 ) ) ( not ( = ?auto_116680 ?auto_116681 ) ) ( not ( = ?auto_116680 ?auto_116682 ) ) ( not ( = ?auto_116680 ?auto_116683 ) ) ( not ( = ?auto_116680 ?auto_116684 ) ) ( not ( = ?auto_116681 ?auto_116682 ) ) ( not ( = ?auto_116681 ?auto_116683 ) ) ( not ( = ?auto_116681 ?auto_116684 ) ) ( not ( = ?auto_116682 ?auto_116683 ) ) ( not ( = ?auto_116682 ?auto_116684 ) ) ( not ( = ?auto_116683 ?auto_116684 ) ) ( ON-TABLE ?auto_116684 ) ( CLEAR ?auto_116684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_116684 )
      ( MAKE-7PILE ?auto_116678 ?auto_116679 ?auto_116680 ?auto_116681 ?auto_116682 ?auto_116683 ?auto_116684 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116685 - BLOCK
      ?auto_116686 - BLOCK
      ?auto_116687 - BLOCK
      ?auto_116688 - BLOCK
      ?auto_116689 - BLOCK
      ?auto_116690 - BLOCK
      ?auto_116691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116685 ) ( ON ?auto_116686 ?auto_116685 ) ( ON ?auto_116687 ?auto_116686 ) ( ON ?auto_116688 ?auto_116687 ) ( ON ?auto_116689 ?auto_116688 ) ( not ( = ?auto_116685 ?auto_116686 ) ) ( not ( = ?auto_116685 ?auto_116687 ) ) ( not ( = ?auto_116685 ?auto_116688 ) ) ( not ( = ?auto_116685 ?auto_116689 ) ) ( not ( = ?auto_116685 ?auto_116690 ) ) ( not ( = ?auto_116685 ?auto_116691 ) ) ( not ( = ?auto_116686 ?auto_116687 ) ) ( not ( = ?auto_116686 ?auto_116688 ) ) ( not ( = ?auto_116686 ?auto_116689 ) ) ( not ( = ?auto_116686 ?auto_116690 ) ) ( not ( = ?auto_116686 ?auto_116691 ) ) ( not ( = ?auto_116687 ?auto_116688 ) ) ( not ( = ?auto_116687 ?auto_116689 ) ) ( not ( = ?auto_116687 ?auto_116690 ) ) ( not ( = ?auto_116687 ?auto_116691 ) ) ( not ( = ?auto_116688 ?auto_116689 ) ) ( not ( = ?auto_116688 ?auto_116690 ) ) ( not ( = ?auto_116688 ?auto_116691 ) ) ( not ( = ?auto_116689 ?auto_116690 ) ) ( not ( = ?auto_116689 ?auto_116691 ) ) ( not ( = ?auto_116690 ?auto_116691 ) ) ( ON-TABLE ?auto_116691 ) ( CLEAR ?auto_116691 ) ( HOLDING ?auto_116690 ) ( CLEAR ?auto_116689 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116685 ?auto_116686 ?auto_116687 ?auto_116688 ?auto_116689 ?auto_116690 )
      ( MAKE-7PILE ?auto_116685 ?auto_116686 ?auto_116687 ?auto_116688 ?auto_116689 ?auto_116690 ?auto_116691 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116692 - BLOCK
      ?auto_116693 - BLOCK
      ?auto_116694 - BLOCK
      ?auto_116695 - BLOCK
      ?auto_116696 - BLOCK
      ?auto_116697 - BLOCK
      ?auto_116698 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116692 ) ( ON ?auto_116693 ?auto_116692 ) ( ON ?auto_116694 ?auto_116693 ) ( ON ?auto_116695 ?auto_116694 ) ( ON ?auto_116696 ?auto_116695 ) ( not ( = ?auto_116692 ?auto_116693 ) ) ( not ( = ?auto_116692 ?auto_116694 ) ) ( not ( = ?auto_116692 ?auto_116695 ) ) ( not ( = ?auto_116692 ?auto_116696 ) ) ( not ( = ?auto_116692 ?auto_116697 ) ) ( not ( = ?auto_116692 ?auto_116698 ) ) ( not ( = ?auto_116693 ?auto_116694 ) ) ( not ( = ?auto_116693 ?auto_116695 ) ) ( not ( = ?auto_116693 ?auto_116696 ) ) ( not ( = ?auto_116693 ?auto_116697 ) ) ( not ( = ?auto_116693 ?auto_116698 ) ) ( not ( = ?auto_116694 ?auto_116695 ) ) ( not ( = ?auto_116694 ?auto_116696 ) ) ( not ( = ?auto_116694 ?auto_116697 ) ) ( not ( = ?auto_116694 ?auto_116698 ) ) ( not ( = ?auto_116695 ?auto_116696 ) ) ( not ( = ?auto_116695 ?auto_116697 ) ) ( not ( = ?auto_116695 ?auto_116698 ) ) ( not ( = ?auto_116696 ?auto_116697 ) ) ( not ( = ?auto_116696 ?auto_116698 ) ) ( not ( = ?auto_116697 ?auto_116698 ) ) ( ON-TABLE ?auto_116698 ) ( CLEAR ?auto_116696 ) ( ON ?auto_116697 ?auto_116698 ) ( CLEAR ?auto_116697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116698 )
      ( MAKE-7PILE ?auto_116692 ?auto_116693 ?auto_116694 ?auto_116695 ?auto_116696 ?auto_116697 ?auto_116698 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116699 - BLOCK
      ?auto_116700 - BLOCK
      ?auto_116701 - BLOCK
      ?auto_116702 - BLOCK
      ?auto_116703 - BLOCK
      ?auto_116704 - BLOCK
      ?auto_116705 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116699 ) ( ON ?auto_116700 ?auto_116699 ) ( ON ?auto_116701 ?auto_116700 ) ( ON ?auto_116702 ?auto_116701 ) ( not ( = ?auto_116699 ?auto_116700 ) ) ( not ( = ?auto_116699 ?auto_116701 ) ) ( not ( = ?auto_116699 ?auto_116702 ) ) ( not ( = ?auto_116699 ?auto_116703 ) ) ( not ( = ?auto_116699 ?auto_116704 ) ) ( not ( = ?auto_116699 ?auto_116705 ) ) ( not ( = ?auto_116700 ?auto_116701 ) ) ( not ( = ?auto_116700 ?auto_116702 ) ) ( not ( = ?auto_116700 ?auto_116703 ) ) ( not ( = ?auto_116700 ?auto_116704 ) ) ( not ( = ?auto_116700 ?auto_116705 ) ) ( not ( = ?auto_116701 ?auto_116702 ) ) ( not ( = ?auto_116701 ?auto_116703 ) ) ( not ( = ?auto_116701 ?auto_116704 ) ) ( not ( = ?auto_116701 ?auto_116705 ) ) ( not ( = ?auto_116702 ?auto_116703 ) ) ( not ( = ?auto_116702 ?auto_116704 ) ) ( not ( = ?auto_116702 ?auto_116705 ) ) ( not ( = ?auto_116703 ?auto_116704 ) ) ( not ( = ?auto_116703 ?auto_116705 ) ) ( not ( = ?auto_116704 ?auto_116705 ) ) ( ON-TABLE ?auto_116705 ) ( ON ?auto_116704 ?auto_116705 ) ( CLEAR ?auto_116704 ) ( HOLDING ?auto_116703 ) ( CLEAR ?auto_116702 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116699 ?auto_116700 ?auto_116701 ?auto_116702 ?auto_116703 )
      ( MAKE-7PILE ?auto_116699 ?auto_116700 ?auto_116701 ?auto_116702 ?auto_116703 ?auto_116704 ?auto_116705 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116706 - BLOCK
      ?auto_116707 - BLOCK
      ?auto_116708 - BLOCK
      ?auto_116709 - BLOCK
      ?auto_116710 - BLOCK
      ?auto_116711 - BLOCK
      ?auto_116712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116706 ) ( ON ?auto_116707 ?auto_116706 ) ( ON ?auto_116708 ?auto_116707 ) ( ON ?auto_116709 ?auto_116708 ) ( not ( = ?auto_116706 ?auto_116707 ) ) ( not ( = ?auto_116706 ?auto_116708 ) ) ( not ( = ?auto_116706 ?auto_116709 ) ) ( not ( = ?auto_116706 ?auto_116710 ) ) ( not ( = ?auto_116706 ?auto_116711 ) ) ( not ( = ?auto_116706 ?auto_116712 ) ) ( not ( = ?auto_116707 ?auto_116708 ) ) ( not ( = ?auto_116707 ?auto_116709 ) ) ( not ( = ?auto_116707 ?auto_116710 ) ) ( not ( = ?auto_116707 ?auto_116711 ) ) ( not ( = ?auto_116707 ?auto_116712 ) ) ( not ( = ?auto_116708 ?auto_116709 ) ) ( not ( = ?auto_116708 ?auto_116710 ) ) ( not ( = ?auto_116708 ?auto_116711 ) ) ( not ( = ?auto_116708 ?auto_116712 ) ) ( not ( = ?auto_116709 ?auto_116710 ) ) ( not ( = ?auto_116709 ?auto_116711 ) ) ( not ( = ?auto_116709 ?auto_116712 ) ) ( not ( = ?auto_116710 ?auto_116711 ) ) ( not ( = ?auto_116710 ?auto_116712 ) ) ( not ( = ?auto_116711 ?auto_116712 ) ) ( ON-TABLE ?auto_116712 ) ( ON ?auto_116711 ?auto_116712 ) ( CLEAR ?auto_116709 ) ( ON ?auto_116710 ?auto_116711 ) ( CLEAR ?auto_116710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116712 ?auto_116711 )
      ( MAKE-7PILE ?auto_116706 ?auto_116707 ?auto_116708 ?auto_116709 ?auto_116710 ?auto_116711 ?auto_116712 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116713 - BLOCK
      ?auto_116714 - BLOCK
      ?auto_116715 - BLOCK
      ?auto_116716 - BLOCK
      ?auto_116717 - BLOCK
      ?auto_116718 - BLOCK
      ?auto_116719 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116713 ) ( ON ?auto_116714 ?auto_116713 ) ( ON ?auto_116715 ?auto_116714 ) ( not ( = ?auto_116713 ?auto_116714 ) ) ( not ( = ?auto_116713 ?auto_116715 ) ) ( not ( = ?auto_116713 ?auto_116716 ) ) ( not ( = ?auto_116713 ?auto_116717 ) ) ( not ( = ?auto_116713 ?auto_116718 ) ) ( not ( = ?auto_116713 ?auto_116719 ) ) ( not ( = ?auto_116714 ?auto_116715 ) ) ( not ( = ?auto_116714 ?auto_116716 ) ) ( not ( = ?auto_116714 ?auto_116717 ) ) ( not ( = ?auto_116714 ?auto_116718 ) ) ( not ( = ?auto_116714 ?auto_116719 ) ) ( not ( = ?auto_116715 ?auto_116716 ) ) ( not ( = ?auto_116715 ?auto_116717 ) ) ( not ( = ?auto_116715 ?auto_116718 ) ) ( not ( = ?auto_116715 ?auto_116719 ) ) ( not ( = ?auto_116716 ?auto_116717 ) ) ( not ( = ?auto_116716 ?auto_116718 ) ) ( not ( = ?auto_116716 ?auto_116719 ) ) ( not ( = ?auto_116717 ?auto_116718 ) ) ( not ( = ?auto_116717 ?auto_116719 ) ) ( not ( = ?auto_116718 ?auto_116719 ) ) ( ON-TABLE ?auto_116719 ) ( ON ?auto_116718 ?auto_116719 ) ( ON ?auto_116717 ?auto_116718 ) ( CLEAR ?auto_116717 ) ( HOLDING ?auto_116716 ) ( CLEAR ?auto_116715 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116713 ?auto_116714 ?auto_116715 ?auto_116716 )
      ( MAKE-7PILE ?auto_116713 ?auto_116714 ?auto_116715 ?auto_116716 ?auto_116717 ?auto_116718 ?auto_116719 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116720 - BLOCK
      ?auto_116721 - BLOCK
      ?auto_116722 - BLOCK
      ?auto_116723 - BLOCK
      ?auto_116724 - BLOCK
      ?auto_116725 - BLOCK
      ?auto_116726 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116720 ) ( ON ?auto_116721 ?auto_116720 ) ( ON ?auto_116722 ?auto_116721 ) ( not ( = ?auto_116720 ?auto_116721 ) ) ( not ( = ?auto_116720 ?auto_116722 ) ) ( not ( = ?auto_116720 ?auto_116723 ) ) ( not ( = ?auto_116720 ?auto_116724 ) ) ( not ( = ?auto_116720 ?auto_116725 ) ) ( not ( = ?auto_116720 ?auto_116726 ) ) ( not ( = ?auto_116721 ?auto_116722 ) ) ( not ( = ?auto_116721 ?auto_116723 ) ) ( not ( = ?auto_116721 ?auto_116724 ) ) ( not ( = ?auto_116721 ?auto_116725 ) ) ( not ( = ?auto_116721 ?auto_116726 ) ) ( not ( = ?auto_116722 ?auto_116723 ) ) ( not ( = ?auto_116722 ?auto_116724 ) ) ( not ( = ?auto_116722 ?auto_116725 ) ) ( not ( = ?auto_116722 ?auto_116726 ) ) ( not ( = ?auto_116723 ?auto_116724 ) ) ( not ( = ?auto_116723 ?auto_116725 ) ) ( not ( = ?auto_116723 ?auto_116726 ) ) ( not ( = ?auto_116724 ?auto_116725 ) ) ( not ( = ?auto_116724 ?auto_116726 ) ) ( not ( = ?auto_116725 ?auto_116726 ) ) ( ON-TABLE ?auto_116726 ) ( ON ?auto_116725 ?auto_116726 ) ( ON ?auto_116724 ?auto_116725 ) ( CLEAR ?auto_116722 ) ( ON ?auto_116723 ?auto_116724 ) ( CLEAR ?auto_116723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116726 ?auto_116725 ?auto_116724 )
      ( MAKE-7PILE ?auto_116720 ?auto_116721 ?auto_116722 ?auto_116723 ?auto_116724 ?auto_116725 ?auto_116726 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116727 - BLOCK
      ?auto_116728 - BLOCK
      ?auto_116729 - BLOCK
      ?auto_116730 - BLOCK
      ?auto_116731 - BLOCK
      ?auto_116732 - BLOCK
      ?auto_116733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116727 ) ( ON ?auto_116728 ?auto_116727 ) ( not ( = ?auto_116727 ?auto_116728 ) ) ( not ( = ?auto_116727 ?auto_116729 ) ) ( not ( = ?auto_116727 ?auto_116730 ) ) ( not ( = ?auto_116727 ?auto_116731 ) ) ( not ( = ?auto_116727 ?auto_116732 ) ) ( not ( = ?auto_116727 ?auto_116733 ) ) ( not ( = ?auto_116728 ?auto_116729 ) ) ( not ( = ?auto_116728 ?auto_116730 ) ) ( not ( = ?auto_116728 ?auto_116731 ) ) ( not ( = ?auto_116728 ?auto_116732 ) ) ( not ( = ?auto_116728 ?auto_116733 ) ) ( not ( = ?auto_116729 ?auto_116730 ) ) ( not ( = ?auto_116729 ?auto_116731 ) ) ( not ( = ?auto_116729 ?auto_116732 ) ) ( not ( = ?auto_116729 ?auto_116733 ) ) ( not ( = ?auto_116730 ?auto_116731 ) ) ( not ( = ?auto_116730 ?auto_116732 ) ) ( not ( = ?auto_116730 ?auto_116733 ) ) ( not ( = ?auto_116731 ?auto_116732 ) ) ( not ( = ?auto_116731 ?auto_116733 ) ) ( not ( = ?auto_116732 ?auto_116733 ) ) ( ON-TABLE ?auto_116733 ) ( ON ?auto_116732 ?auto_116733 ) ( ON ?auto_116731 ?auto_116732 ) ( ON ?auto_116730 ?auto_116731 ) ( CLEAR ?auto_116730 ) ( HOLDING ?auto_116729 ) ( CLEAR ?auto_116728 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116727 ?auto_116728 ?auto_116729 )
      ( MAKE-7PILE ?auto_116727 ?auto_116728 ?auto_116729 ?auto_116730 ?auto_116731 ?auto_116732 ?auto_116733 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116734 - BLOCK
      ?auto_116735 - BLOCK
      ?auto_116736 - BLOCK
      ?auto_116737 - BLOCK
      ?auto_116738 - BLOCK
      ?auto_116739 - BLOCK
      ?auto_116740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116734 ) ( ON ?auto_116735 ?auto_116734 ) ( not ( = ?auto_116734 ?auto_116735 ) ) ( not ( = ?auto_116734 ?auto_116736 ) ) ( not ( = ?auto_116734 ?auto_116737 ) ) ( not ( = ?auto_116734 ?auto_116738 ) ) ( not ( = ?auto_116734 ?auto_116739 ) ) ( not ( = ?auto_116734 ?auto_116740 ) ) ( not ( = ?auto_116735 ?auto_116736 ) ) ( not ( = ?auto_116735 ?auto_116737 ) ) ( not ( = ?auto_116735 ?auto_116738 ) ) ( not ( = ?auto_116735 ?auto_116739 ) ) ( not ( = ?auto_116735 ?auto_116740 ) ) ( not ( = ?auto_116736 ?auto_116737 ) ) ( not ( = ?auto_116736 ?auto_116738 ) ) ( not ( = ?auto_116736 ?auto_116739 ) ) ( not ( = ?auto_116736 ?auto_116740 ) ) ( not ( = ?auto_116737 ?auto_116738 ) ) ( not ( = ?auto_116737 ?auto_116739 ) ) ( not ( = ?auto_116737 ?auto_116740 ) ) ( not ( = ?auto_116738 ?auto_116739 ) ) ( not ( = ?auto_116738 ?auto_116740 ) ) ( not ( = ?auto_116739 ?auto_116740 ) ) ( ON-TABLE ?auto_116740 ) ( ON ?auto_116739 ?auto_116740 ) ( ON ?auto_116738 ?auto_116739 ) ( ON ?auto_116737 ?auto_116738 ) ( CLEAR ?auto_116735 ) ( ON ?auto_116736 ?auto_116737 ) ( CLEAR ?auto_116736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116740 ?auto_116739 ?auto_116738 ?auto_116737 )
      ( MAKE-7PILE ?auto_116734 ?auto_116735 ?auto_116736 ?auto_116737 ?auto_116738 ?auto_116739 ?auto_116740 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116741 - BLOCK
      ?auto_116742 - BLOCK
      ?auto_116743 - BLOCK
      ?auto_116744 - BLOCK
      ?auto_116745 - BLOCK
      ?auto_116746 - BLOCK
      ?auto_116747 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116741 ) ( not ( = ?auto_116741 ?auto_116742 ) ) ( not ( = ?auto_116741 ?auto_116743 ) ) ( not ( = ?auto_116741 ?auto_116744 ) ) ( not ( = ?auto_116741 ?auto_116745 ) ) ( not ( = ?auto_116741 ?auto_116746 ) ) ( not ( = ?auto_116741 ?auto_116747 ) ) ( not ( = ?auto_116742 ?auto_116743 ) ) ( not ( = ?auto_116742 ?auto_116744 ) ) ( not ( = ?auto_116742 ?auto_116745 ) ) ( not ( = ?auto_116742 ?auto_116746 ) ) ( not ( = ?auto_116742 ?auto_116747 ) ) ( not ( = ?auto_116743 ?auto_116744 ) ) ( not ( = ?auto_116743 ?auto_116745 ) ) ( not ( = ?auto_116743 ?auto_116746 ) ) ( not ( = ?auto_116743 ?auto_116747 ) ) ( not ( = ?auto_116744 ?auto_116745 ) ) ( not ( = ?auto_116744 ?auto_116746 ) ) ( not ( = ?auto_116744 ?auto_116747 ) ) ( not ( = ?auto_116745 ?auto_116746 ) ) ( not ( = ?auto_116745 ?auto_116747 ) ) ( not ( = ?auto_116746 ?auto_116747 ) ) ( ON-TABLE ?auto_116747 ) ( ON ?auto_116746 ?auto_116747 ) ( ON ?auto_116745 ?auto_116746 ) ( ON ?auto_116744 ?auto_116745 ) ( ON ?auto_116743 ?auto_116744 ) ( CLEAR ?auto_116743 ) ( HOLDING ?auto_116742 ) ( CLEAR ?auto_116741 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116741 ?auto_116742 )
      ( MAKE-7PILE ?auto_116741 ?auto_116742 ?auto_116743 ?auto_116744 ?auto_116745 ?auto_116746 ?auto_116747 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116748 - BLOCK
      ?auto_116749 - BLOCK
      ?auto_116750 - BLOCK
      ?auto_116751 - BLOCK
      ?auto_116752 - BLOCK
      ?auto_116753 - BLOCK
      ?auto_116754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_116748 ) ( not ( = ?auto_116748 ?auto_116749 ) ) ( not ( = ?auto_116748 ?auto_116750 ) ) ( not ( = ?auto_116748 ?auto_116751 ) ) ( not ( = ?auto_116748 ?auto_116752 ) ) ( not ( = ?auto_116748 ?auto_116753 ) ) ( not ( = ?auto_116748 ?auto_116754 ) ) ( not ( = ?auto_116749 ?auto_116750 ) ) ( not ( = ?auto_116749 ?auto_116751 ) ) ( not ( = ?auto_116749 ?auto_116752 ) ) ( not ( = ?auto_116749 ?auto_116753 ) ) ( not ( = ?auto_116749 ?auto_116754 ) ) ( not ( = ?auto_116750 ?auto_116751 ) ) ( not ( = ?auto_116750 ?auto_116752 ) ) ( not ( = ?auto_116750 ?auto_116753 ) ) ( not ( = ?auto_116750 ?auto_116754 ) ) ( not ( = ?auto_116751 ?auto_116752 ) ) ( not ( = ?auto_116751 ?auto_116753 ) ) ( not ( = ?auto_116751 ?auto_116754 ) ) ( not ( = ?auto_116752 ?auto_116753 ) ) ( not ( = ?auto_116752 ?auto_116754 ) ) ( not ( = ?auto_116753 ?auto_116754 ) ) ( ON-TABLE ?auto_116754 ) ( ON ?auto_116753 ?auto_116754 ) ( ON ?auto_116752 ?auto_116753 ) ( ON ?auto_116751 ?auto_116752 ) ( ON ?auto_116750 ?auto_116751 ) ( CLEAR ?auto_116748 ) ( ON ?auto_116749 ?auto_116750 ) ( CLEAR ?auto_116749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116754 ?auto_116753 ?auto_116752 ?auto_116751 ?auto_116750 )
      ( MAKE-7PILE ?auto_116748 ?auto_116749 ?auto_116750 ?auto_116751 ?auto_116752 ?auto_116753 ?auto_116754 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116755 - BLOCK
      ?auto_116756 - BLOCK
      ?auto_116757 - BLOCK
      ?auto_116758 - BLOCK
      ?auto_116759 - BLOCK
      ?auto_116760 - BLOCK
      ?auto_116761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116755 ?auto_116756 ) ) ( not ( = ?auto_116755 ?auto_116757 ) ) ( not ( = ?auto_116755 ?auto_116758 ) ) ( not ( = ?auto_116755 ?auto_116759 ) ) ( not ( = ?auto_116755 ?auto_116760 ) ) ( not ( = ?auto_116755 ?auto_116761 ) ) ( not ( = ?auto_116756 ?auto_116757 ) ) ( not ( = ?auto_116756 ?auto_116758 ) ) ( not ( = ?auto_116756 ?auto_116759 ) ) ( not ( = ?auto_116756 ?auto_116760 ) ) ( not ( = ?auto_116756 ?auto_116761 ) ) ( not ( = ?auto_116757 ?auto_116758 ) ) ( not ( = ?auto_116757 ?auto_116759 ) ) ( not ( = ?auto_116757 ?auto_116760 ) ) ( not ( = ?auto_116757 ?auto_116761 ) ) ( not ( = ?auto_116758 ?auto_116759 ) ) ( not ( = ?auto_116758 ?auto_116760 ) ) ( not ( = ?auto_116758 ?auto_116761 ) ) ( not ( = ?auto_116759 ?auto_116760 ) ) ( not ( = ?auto_116759 ?auto_116761 ) ) ( not ( = ?auto_116760 ?auto_116761 ) ) ( ON-TABLE ?auto_116761 ) ( ON ?auto_116760 ?auto_116761 ) ( ON ?auto_116759 ?auto_116760 ) ( ON ?auto_116758 ?auto_116759 ) ( ON ?auto_116757 ?auto_116758 ) ( ON ?auto_116756 ?auto_116757 ) ( CLEAR ?auto_116756 ) ( HOLDING ?auto_116755 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116755 )
      ( MAKE-7PILE ?auto_116755 ?auto_116756 ?auto_116757 ?auto_116758 ?auto_116759 ?auto_116760 ?auto_116761 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116762 - BLOCK
      ?auto_116763 - BLOCK
      ?auto_116764 - BLOCK
      ?auto_116765 - BLOCK
      ?auto_116766 - BLOCK
      ?auto_116767 - BLOCK
      ?auto_116768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116762 ?auto_116763 ) ) ( not ( = ?auto_116762 ?auto_116764 ) ) ( not ( = ?auto_116762 ?auto_116765 ) ) ( not ( = ?auto_116762 ?auto_116766 ) ) ( not ( = ?auto_116762 ?auto_116767 ) ) ( not ( = ?auto_116762 ?auto_116768 ) ) ( not ( = ?auto_116763 ?auto_116764 ) ) ( not ( = ?auto_116763 ?auto_116765 ) ) ( not ( = ?auto_116763 ?auto_116766 ) ) ( not ( = ?auto_116763 ?auto_116767 ) ) ( not ( = ?auto_116763 ?auto_116768 ) ) ( not ( = ?auto_116764 ?auto_116765 ) ) ( not ( = ?auto_116764 ?auto_116766 ) ) ( not ( = ?auto_116764 ?auto_116767 ) ) ( not ( = ?auto_116764 ?auto_116768 ) ) ( not ( = ?auto_116765 ?auto_116766 ) ) ( not ( = ?auto_116765 ?auto_116767 ) ) ( not ( = ?auto_116765 ?auto_116768 ) ) ( not ( = ?auto_116766 ?auto_116767 ) ) ( not ( = ?auto_116766 ?auto_116768 ) ) ( not ( = ?auto_116767 ?auto_116768 ) ) ( ON-TABLE ?auto_116768 ) ( ON ?auto_116767 ?auto_116768 ) ( ON ?auto_116766 ?auto_116767 ) ( ON ?auto_116765 ?auto_116766 ) ( ON ?auto_116764 ?auto_116765 ) ( ON ?auto_116763 ?auto_116764 ) ( ON ?auto_116762 ?auto_116763 ) ( CLEAR ?auto_116762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116768 ?auto_116767 ?auto_116766 ?auto_116765 ?auto_116764 ?auto_116763 )
      ( MAKE-7PILE ?auto_116762 ?auto_116763 ?auto_116764 ?auto_116765 ?auto_116766 ?auto_116767 ?auto_116768 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116776 - BLOCK
      ?auto_116777 - BLOCK
      ?auto_116778 - BLOCK
      ?auto_116779 - BLOCK
      ?auto_116780 - BLOCK
      ?auto_116781 - BLOCK
      ?auto_116782 - BLOCK
    )
    :vars
    (
      ?auto_116783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116776 ?auto_116777 ) ) ( not ( = ?auto_116776 ?auto_116778 ) ) ( not ( = ?auto_116776 ?auto_116779 ) ) ( not ( = ?auto_116776 ?auto_116780 ) ) ( not ( = ?auto_116776 ?auto_116781 ) ) ( not ( = ?auto_116776 ?auto_116782 ) ) ( not ( = ?auto_116777 ?auto_116778 ) ) ( not ( = ?auto_116777 ?auto_116779 ) ) ( not ( = ?auto_116777 ?auto_116780 ) ) ( not ( = ?auto_116777 ?auto_116781 ) ) ( not ( = ?auto_116777 ?auto_116782 ) ) ( not ( = ?auto_116778 ?auto_116779 ) ) ( not ( = ?auto_116778 ?auto_116780 ) ) ( not ( = ?auto_116778 ?auto_116781 ) ) ( not ( = ?auto_116778 ?auto_116782 ) ) ( not ( = ?auto_116779 ?auto_116780 ) ) ( not ( = ?auto_116779 ?auto_116781 ) ) ( not ( = ?auto_116779 ?auto_116782 ) ) ( not ( = ?auto_116780 ?auto_116781 ) ) ( not ( = ?auto_116780 ?auto_116782 ) ) ( not ( = ?auto_116781 ?auto_116782 ) ) ( ON-TABLE ?auto_116782 ) ( ON ?auto_116781 ?auto_116782 ) ( ON ?auto_116780 ?auto_116781 ) ( ON ?auto_116779 ?auto_116780 ) ( ON ?auto_116778 ?auto_116779 ) ( ON ?auto_116777 ?auto_116778 ) ( CLEAR ?auto_116777 ) ( ON ?auto_116776 ?auto_116783 ) ( CLEAR ?auto_116776 ) ( HAND-EMPTY ) ( not ( = ?auto_116776 ?auto_116783 ) ) ( not ( = ?auto_116777 ?auto_116783 ) ) ( not ( = ?auto_116778 ?auto_116783 ) ) ( not ( = ?auto_116779 ?auto_116783 ) ) ( not ( = ?auto_116780 ?auto_116783 ) ) ( not ( = ?auto_116781 ?auto_116783 ) ) ( not ( = ?auto_116782 ?auto_116783 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116776 ?auto_116783 )
      ( MAKE-7PILE ?auto_116776 ?auto_116777 ?auto_116778 ?auto_116779 ?auto_116780 ?auto_116781 ?auto_116782 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116784 - BLOCK
      ?auto_116785 - BLOCK
      ?auto_116786 - BLOCK
      ?auto_116787 - BLOCK
      ?auto_116788 - BLOCK
      ?auto_116789 - BLOCK
      ?auto_116790 - BLOCK
    )
    :vars
    (
      ?auto_116791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116784 ?auto_116785 ) ) ( not ( = ?auto_116784 ?auto_116786 ) ) ( not ( = ?auto_116784 ?auto_116787 ) ) ( not ( = ?auto_116784 ?auto_116788 ) ) ( not ( = ?auto_116784 ?auto_116789 ) ) ( not ( = ?auto_116784 ?auto_116790 ) ) ( not ( = ?auto_116785 ?auto_116786 ) ) ( not ( = ?auto_116785 ?auto_116787 ) ) ( not ( = ?auto_116785 ?auto_116788 ) ) ( not ( = ?auto_116785 ?auto_116789 ) ) ( not ( = ?auto_116785 ?auto_116790 ) ) ( not ( = ?auto_116786 ?auto_116787 ) ) ( not ( = ?auto_116786 ?auto_116788 ) ) ( not ( = ?auto_116786 ?auto_116789 ) ) ( not ( = ?auto_116786 ?auto_116790 ) ) ( not ( = ?auto_116787 ?auto_116788 ) ) ( not ( = ?auto_116787 ?auto_116789 ) ) ( not ( = ?auto_116787 ?auto_116790 ) ) ( not ( = ?auto_116788 ?auto_116789 ) ) ( not ( = ?auto_116788 ?auto_116790 ) ) ( not ( = ?auto_116789 ?auto_116790 ) ) ( ON-TABLE ?auto_116790 ) ( ON ?auto_116789 ?auto_116790 ) ( ON ?auto_116788 ?auto_116789 ) ( ON ?auto_116787 ?auto_116788 ) ( ON ?auto_116786 ?auto_116787 ) ( ON ?auto_116784 ?auto_116791 ) ( CLEAR ?auto_116784 ) ( not ( = ?auto_116784 ?auto_116791 ) ) ( not ( = ?auto_116785 ?auto_116791 ) ) ( not ( = ?auto_116786 ?auto_116791 ) ) ( not ( = ?auto_116787 ?auto_116791 ) ) ( not ( = ?auto_116788 ?auto_116791 ) ) ( not ( = ?auto_116789 ?auto_116791 ) ) ( not ( = ?auto_116790 ?auto_116791 ) ) ( HOLDING ?auto_116785 ) ( CLEAR ?auto_116786 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116790 ?auto_116789 ?auto_116788 ?auto_116787 ?auto_116786 ?auto_116785 )
      ( MAKE-7PILE ?auto_116784 ?auto_116785 ?auto_116786 ?auto_116787 ?auto_116788 ?auto_116789 ?auto_116790 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116792 - BLOCK
      ?auto_116793 - BLOCK
      ?auto_116794 - BLOCK
      ?auto_116795 - BLOCK
      ?auto_116796 - BLOCK
      ?auto_116797 - BLOCK
      ?auto_116798 - BLOCK
    )
    :vars
    (
      ?auto_116799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116792 ?auto_116793 ) ) ( not ( = ?auto_116792 ?auto_116794 ) ) ( not ( = ?auto_116792 ?auto_116795 ) ) ( not ( = ?auto_116792 ?auto_116796 ) ) ( not ( = ?auto_116792 ?auto_116797 ) ) ( not ( = ?auto_116792 ?auto_116798 ) ) ( not ( = ?auto_116793 ?auto_116794 ) ) ( not ( = ?auto_116793 ?auto_116795 ) ) ( not ( = ?auto_116793 ?auto_116796 ) ) ( not ( = ?auto_116793 ?auto_116797 ) ) ( not ( = ?auto_116793 ?auto_116798 ) ) ( not ( = ?auto_116794 ?auto_116795 ) ) ( not ( = ?auto_116794 ?auto_116796 ) ) ( not ( = ?auto_116794 ?auto_116797 ) ) ( not ( = ?auto_116794 ?auto_116798 ) ) ( not ( = ?auto_116795 ?auto_116796 ) ) ( not ( = ?auto_116795 ?auto_116797 ) ) ( not ( = ?auto_116795 ?auto_116798 ) ) ( not ( = ?auto_116796 ?auto_116797 ) ) ( not ( = ?auto_116796 ?auto_116798 ) ) ( not ( = ?auto_116797 ?auto_116798 ) ) ( ON-TABLE ?auto_116798 ) ( ON ?auto_116797 ?auto_116798 ) ( ON ?auto_116796 ?auto_116797 ) ( ON ?auto_116795 ?auto_116796 ) ( ON ?auto_116794 ?auto_116795 ) ( ON ?auto_116792 ?auto_116799 ) ( not ( = ?auto_116792 ?auto_116799 ) ) ( not ( = ?auto_116793 ?auto_116799 ) ) ( not ( = ?auto_116794 ?auto_116799 ) ) ( not ( = ?auto_116795 ?auto_116799 ) ) ( not ( = ?auto_116796 ?auto_116799 ) ) ( not ( = ?auto_116797 ?auto_116799 ) ) ( not ( = ?auto_116798 ?auto_116799 ) ) ( CLEAR ?auto_116794 ) ( ON ?auto_116793 ?auto_116792 ) ( CLEAR ?auto_116793 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116799 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116799 ?auto_116792 )
      ( MAKE-7PILE ?auto_116792 ?auto_116793 ?auto_116794 ?auto_116795 ?auto_116796 ?auto_116797 ?auto_116798 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116800 - BLOCK
      ?auto_116801 - BLOCK
      ?auto_116802 - BLOCK
      ?auto_116803 - BLOCK
      ?auto_116804 - BLOCK
      ?auto_116805 - BLOCK
      ?auto_116806 - BLOCK
    )
    :vars
    (
      ?auto_116807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116800 ?auto_116801 ) ) ( not ( = ?auto_116800 ?auto_116802 ) ) ( not ( = ?auto_116800 ?auto_116803 ) ) ( not ( = ?auto_116800 ?auto_116804 ) ) ( not ( = ?auto_116800 ?auto_116805 ) ) ( not ( = ?auto_116800 ?auto_116806 ) ) ( not ( = ?auto_116801 ?auto_116802 ) ) ( not ( = ?auto_116801 ?auto_116803 ) ) ( not ( = ?auto_116801 ?auto_116804 ) ) ( not ( = ?auto_116801 ?auto_116805 ) ) ( not ( = ?auto_116801 ?auto_116806 ) ) ( not ( = ?auto_116802 ?auto_116803 ) ) ( not ( = ?auto_116802 ?auto_116804 ) ) ( not ( = ?auto_116802 ?auto_116805 ) ) ( not ( = ?auto_116802 ?auto_116806 ) ) ( not ( = ?auto_116803 ?auto_116804 ) ) ( not ( = ?auto_116803 ?auto_116805 ) ) ( not ( = ?auto_116803 ?auto_116806 ) ) ( not ( = ?auto_116804 ?auto_116805 ) ) ( not ( = ?auto_116804 ?auto_116806 ) ) ( not ( = ?auto_116805 ?auto_116806 ) ) ( ON-TABLE ?auto_116806 ) ( ON ?auto_116805 ?auto_116806 ) ( ON ?auto_116804 ?auto_116805 ) ( ON ?auto_116803 ?auto_116804 ) ( ON ?auto_116800 ?auto_116807 ) ( not ( = ?auto_116800 ?auto_116807 ) ) ( not ( = ?auto_116801 ?auto_116807 ) ) ( not ( = ?auto_116802 ?auto_116807 ) ) ( not ( = ?auto_116803 ?auto_116807 ) ) ( not ( = ?auto_116804 ?auto_116807 ) ) ( not ( = ?auto_116805 ?auto_116807 ) ) ( not ( = ?auto_116806 ?auto_116807 ) ) ( ON ?auto_116801 ?auto_116800 ) ( CLEAR ?auto_116801 ) ( ON-TABLE ?auto_116807 ) ( HOLDING ?auto_116802 ) ( CLEAR ?auto_116803 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116806 ?auto_116805 ?auto_116804 ?auto_116803 ?auto_116802 )
      ( MAKE-7PILE ?auto_116800 ?auto_116801 ?auto_116802 ?auto_116803 ?auto_116804 ?auto_116805 ?auto_116806 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116808 - BLOCK
      ?auto_116809 - BLOCK
      ?auto_116810 - BLOCK
      ?auto_116811 - BLOCK
      ?auto_116812 - BLOCK
      ?auto_116813 - BLOCK
      ?auto_116814 - BLOCK
    )
    :vars
    (
      ?auto_116815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116808 ?auto_116809 ) ) ( not ( = ?auto_116808 ?auto_116810 ) ) ( not ( = ?auto_116808 ?auto_116811 ) ) ( not ( = ?auto_116808 ?auto_116812 ) ) ( not ( = ?auto_116808 ?auto_116813 ) ) ( not ( = ?auto_116808 ?auto_116814 ) ) ( not ( = ?auto_116809 ?auto_116810 ) ) ( not ( = ?auto_116809 ?auto_116811 ) ) ( not ( = ?auto_116809 ?auto_116812 ) ) ( not ( = ?auto_116809 ?auto_116813 ) ) ( not ( = ?auto_116809 ?auto_116814 ) ) ( not ( = ?auto_116810 ?auto_116811 ) ) ( not ( = ?auto_116810 ?auto_116812 ) ) ( not ( = ?auto_116810 ?auto_116813 ) ) ( not ( = ?auto_116810 ?auto_116814 ) ) ( not ( = ?auto_116811 ?auto_116812 ) ) ( not ( = ?auto_116811 ?auto_116813 ) ) ( not ( = ?auto_116811 ?auto_116814 ) ) ( not ( = ?auto_116812 ?auto_116813 ) ) ( not ( = ?auto_116812 ?auto_116814 ) ) ( not ( = ?auto_116813 ?auto_116814 ) ) ( ON-TABLE ?auto_116814 ) ( ON ?auto_116813 ?auto_116814 ) ( ON ?auto_116812 ?auto_116813 ) ( ON ?auto_116811 ?auto_116812 ) ( ON ?auto_116808 ?auto_116815 ) ( not ( = ?auto_116808 ?auto_116815 ) ) ( not ( = ?auto_116809 ?auto_116815 ) ) ( not ( = ?auto_116810 ?auto_116815 ) ) ( not ( = ?auto_116811 ?auto_116815 ) ) ( not ( = ?auto_116812 ?auto_116815 ) ) ( not ( = ?auto_116813 ?auto_116815 ) ) ( not ( = ?auto_116814 ?auto_116815 ) ) ( ON ?auto_116809 ?auto_116808 ) ( ON-TABLE ?auto_116815 ) ( CLEAR ?auto_116811 ) ( ON ?auto_116810 ?auto_116809 ) ( CLEAR ?auto_116810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116815 ?auto_116808 ?auto_116809 )
      ( MAKE-7PILE ?auto_116808 ?auto_116809 ?auto_116810 ?auto_116811 ?auto_116812 ?auto_116813 ?auto_116814 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116816 - BLOCK
      ?auto_116817 - BLOCK
      ?auto_116818 - BLOCK
      ?auto_116819 - BLOCK
      ?auto_116820 - BLOCK
      ?auto_116821 - BLOCK
      ?auto_116822 - BLOCK
    )
    :vars
    (
      ?auto_116823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116816 ?auto_116817 ) ) ( not ( = ?auto_116816 ?auto_116818 ) ) ( not ( = ?auto_116816 ?auto_116819 ) ) ( not ( = ?auto_116816 ?auto_116820 ) ) ( not ( = ?auto_116816 ?auto_116821 ) ) ( not ( = ?auto_116816 ?auto_116822 ) ) ( not ( = ?auto_116817 ?auto_116818 ) ) ( not ( = ?auto_116817 ?auto_116819 ) ) ( not ( = ?auto_116817 ?auto_116820 ) ) ( not ( = ?auto_116817 ?auto_116821 ) ) ( not ( = ?auto_116817 ?auto_116822 ) ) ( not ( = ?auto_116818 ?auto_116819 ) ) ( not ( = ?auto_116818 ?auto_116820 ) ) ( not ( = ?auto_116818 ?auto_116821 ) ) ( not ( = ?auto_116818 ?auto_116822 ) ) ( not ( = ?auto_116819 ?auto_116820 ) ) ( not ( = ?auto_116819 ?auto_116821 ) ) ( not ( = ?auto_116819 ?auto_116822 ) ) ( not ( = ?auto_116820 ?auto_116821 ) ) ( not ( = ?auto_116820 ?auto_116822 ) ) ( not ( = ?auto_116821 ?auto_116822 ) ) ( ON-TABLE ?auto_116822 ) ( ON ?auto_116821 ?auto_116822 ) ( ON ?auto_116820 ?auto_116821 ) ( ON ?auto_116816 ?auto_116823 ) ( not ( = ?auto_116816 ?auto_116823 ) ) ( not ( = ?auto_116817 ?auto_116823 ) ) ( not ( = ?auto_116818 ?auto_116823 ) ) ( not ( = ?auto_116819 ?auto_116823 ) ) ( not ( = ?auto_116820 ?auto_116823 ) ) ( not ( = ?auto_116821 ?auto_116823 ) ) ( not ( = ?auto_116822 ?auto_116823 ) ) ( ON ?auto_116817 ?auto_116816 ) ( ON-TABLE ?auto_116823 ) ( ON ?auto_116818 ?auto_116817 ) ( CLEAR ?auto_116818 ) ( HOLDING ?auto_116819 ) ( CLEAR ?auto_116820 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116822 ?auto_116821 ?auto_116820 ?auto_116819 )
      ( MAKE-7PILE ?auto_116816 ?auto_116817 ?auto_116818 ?auto_116819 ?auto_116820 ?auto_116821 ?auto_116822 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116824 - BLOCK
      ?auto_116825 - BLOCK
      ?auto_116826 - BLOCK
      ?auto_116827 - BLOCK
      ?auto_116828 - BLOCK
      ?auto_116829 - BLOCK
      ?auto_116830 - BLOCK
    )
    :vars
    (
      ?auto_116831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116824 ?auto_116825 ) ) ( not ( = ?auto_116824 ?auto_116826 ) ) ( not ( = ?auto_116824 ?auto_116827 ) ) ( not ( = ?auto_116824 ?auto_116828 ) ) ( not ( = ?auto_116824 ?auto_116829 ) ) ( not ( = ?auto_116824 ?auto_116830 ) ) ( not ( = ?auto_116825 ?auto_116826 ) ) ( not ( = ?auto_116825 ?auto_116827 ) ) ( not ( = ?auto_116825 ?auto_116828 ) ) ( not ( = ?auto_116825 ?auto_116829 ) ) ( not ( = ?auto_116825 ?auto_116830 ) ) ( not ( = ?auto_116826 ?auto_116827 ) ) ( not ( = ?auto_116826 ?auto_116828 ) ) ( not ( = ?auto_116826 ?auto_116829 ) ) ( not ( = ?auto_116826 ?auto_116830 ) ) ( not ( = ?auto_116827 ?auto_116828 ) ) ( not ( = ?auto_116827 ?auto_116829 ) ) ( not ( = ?auto_116827 ?auto_116830 ) ) ( not ( = ?auto_116828 ?auto_116829 ) ) ( not ( = ?auto_116828 ?auto_116830 ) ) ( not ( = ?auto_116829 ?auto_116830 ) ) ( ON-TABLE ?auto_116830 ) ( ON ?auto_116829 ?auto_116830 ) ( ON ?auto_116828 ?auto_116829 ) ( ON ?auto_116824 ?auto_116831 ) ( not ( = ?auto_116824 ?auto_116831 ) ) ( not ( = ?auto_116825 ?auto_116831 ) ) ( not ( = ?auto_116826 ?auto_116831 ) ) ( not ( = ?auto_116827 ?auto_116831 ) ) ( not ( = ?auto_116828 ?auto_116831 ) ) ( not ( = ?auto_116829 ?auto_116831 ) ) ( not ( = ?auto_116830 ?auto_116831 ) ) ( ON ?auto_116825 ?auto_116824 ) ( ON-TABLE ?auto_116831 ) ( ON ?auto_116826 ?auto_116825 ) ( CLEAR ?auto_116828 ) ( ON ?auto_116827 ?auto_116826 ) ( CLEAR ?auto_116827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_116831 ?auto_116824 ?auto_116825 ?auto_116826 )
      ( MAKE-7PILE ?auto_116824 ?auto_116825 ?auto_116826 ?auto_116827 ?auto_116828 ?auto_116829 ?auto_116830 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116832 - BLOCK
      ?auto_116833 - BLOCK
      ?auto_116834 - BLOCK
      ?auto_116835 - BLOCK
      ?auto_116836 - BLOCK
      ?auto_116837 - BLOCK
      ?auto_116838 - BLOCK
    )
    :vars
    (
      ?auto_116839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116832 ?auto_116833 ) ) ( not ( = ?auto_116832 ?auto_116834 ) ) ( not ( = ?auto_116832 ?auto_116835 ) ) ( not ( = ?auto_116832 ?auto_116836 ) ) ( not ( = ?auto_116832 ?auto_116837 ) ) ( not ( = ?auto_116832 ?auto_116838 ) ) ( not ( = ?auto_116833 ?auto_116834 ) ) ( not ( = ?auto_116833 ?auto_116835 ) ) ( not ( = ?auto_116833 ?auto_116836 ) ) ( not ( = ?auto_116833 ?auto_116837 ) ) ( not ( = ?auto_116833 ?auto_116838 ) ) ( not ( = ?auto_116834 ?auto_116835 ) ) ( not ( = ?auto_116834 ?auto_116836 ) ) ( not ( = ?auto_116834 ?auto_116837 ) ) ( not ( = ?auto_116834 ?auto_116838 ) ) ( not ( = ?auto_116835 ?auto_116836 ) ) ( not ( = ?auto_116835 ?auto_116837 ) ) ( not ( = ?auto_116835 ?auto_116838 ) ) ( not ( = ?auto_116836 ?auto_116837 ) ) ( not ( = ?auto_116836 ?auto_116838 ) ) ( not ( = ?auto_116837 ?auto_116838 ) ) ( ON-TABLE ?auto_116838 ) ( ON ?auto_116837 ?auto_116838 ) ( ON ?auto_116832 ?auto_116839 ) ( not ( = ?auto_116832 ?auto_116839 ) ) ( not ( = ?auto_116833 ?auto_116839 ) ) ( not ( = ?auto_116834 ?auto_116839 ) ) ( not ( = ?auto_116835 ?auto_116839 ) ) ( not ( = ?auto_116836 ?auto_116839 ) ) ( not ( = ?auto_116837 ?auto_116839 ) ) ( not ( = ?auto_116838 ?auto_116839 ) ) ( ON ?auto_116833 ?auto_116832 ) ( ON-TABLE ?auto_116839 ) ( ON ?auto_116834 ?auto_116833 ) ( ON ?auto_116835 ?auto_116834 ) ( CLEAR ?auto_116835 ) ( HOLDING ?auto_116836 ) ( CLEAR ?auto_116837 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_116838 ?auto_116837 ?auto_116836 )
      ( MAKE-7PILE ?auto_116832 ?auto_116833 ?auto_116834 ?auto_116835 ?auto_116836 ?auto_116837 ?auto_116838 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116840 - BLOCK
      ?auto_116841 - BLOCK
      ?auto_116842 - BLOCK
      ?auto_116843 - BLOCK
      ?auto_116844 - BLOCK
      ?auto_116845 - BLOCK
      ?auto_116846 - BLOCK
    )
    :vars
    (
      ?auto_116847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116840 ?auto_116841 ) ) ( not ( = ?auto_116840 ?auto_116842 ) ) ( not ( = ?auto_116840 ?auto_116843 ) ) ( not ( = ?auto_116840 ?auto_116844 ) ) ( not ( = ?auto_116840 ?auto_116845 ) ) ( not ( = ?auto_116840 ?auto_116846 ) ) ( not ( = ?auto_116841 ?auto_116842 ) ) ( not ( = ?auto_116841 ?auto_116843 ) ) ( not ( = ?auto_116841 ?auto_116844 ) ) ( not ( = ?auto_116841 ?auto_116845 ) ) ( not ( = ?auto_116841 ?auto_116846 ) ) ( not ( = ?auto_116842 ?auto_116843 ) ) ( not ( = ?auto_116842 ?auto_116844 ) ) ( not ( = ?auto_116842 ?auto_116845 ) ) ( not ( = ?auto_116842 ?auto_116846 ) ) ( not ( = ?auto_116843 ?auto_116844 ) ) ( not ( = ?auto_116843 ?auto_116845 ) ) ( not ( = ?auto_116843 ?auto_116846 ) ) ( not ( = ?auto_116844 ?auto_116845 ) ) ( not ( = ?auto_116844 ?auto_116846 ) ) ( not ( = ?auto_116845 ?auto_116846 ) ) ( ON-TABLE ?auto_116846 ) ( ON ?auto_116845 ?auto_116846 ) ( ON ?auto_116840 ?auto_116847 ) ( not ( = ?auto_116840 ?auto_116847 ) ) ( not ( = ?auto_116841 ?auto_116847 ) ) ( not ( = ?auto_116842 ?auto_116847 ) ) ( not ( = ?auto_116843 ?auto_116847 ) ) ( not ( = ?auto_116844 ?auto_116847 ) ) ( not ( = ?auto_116845 ?auto_116847 ) ) ( not ( = ?auto_116846 ?auto_116847 ) ) ( ON ?auto_116841 ?auto_116840 ) ( ON-TABLE ?auto_116847 ) ( ON ?auto_116842 ?auto_116841 ) ( ON ?auto_116843 ?auto_116842 ) ( CLEAR ?auto_116845 ) ( ON ?auto_116844 ?auto_116843 ) ( CLEAR ?auto_116844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_116847 ?auto_116840 ?auto_116841 ?auto_116842 ?auto_116843 )
      ( MAKE-7PILE ?auto_116840 ?auto_116841 ?auto_116842 ?auto_116843 ?auto_116844 ?auto_116845 ?auto_116846 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116848 - BLOCK
      ?auto_116849 - BLOCK
      ?auto_116850 - BLOCK
      ?auto_116851 - BLOCK
      ?auto_116852 - BLOCK
      ?auto_116853 - BLOCK
      ?auto_116854 - BLOCK
    )
    :vars
    (
      ?auto_116855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116848 ?auto_116849 ) ) ( not ( = ?auto_116848 ?auto_116850 ) ) ( not ( = ?auto_116848 ?auto_116851 ) ) ( not ( = ?auto_116848 ?auto_116852 ) ) ( not ( = ?auto_116848 ?auto_116853 ) ) ( not ( = ?auto_116848 ?auto_116854 ) ) ( not ( = ?auto_116849 ?auto_116850 ) ) ( not ( = ?auto_116849 ?auto_116851 ) ) ( not ( = ?auto_116849 ?auto_116852 ) ) ( not ( = ?auto_116849 ?auto_116853 ) ) ( not ( = ?auto_116849 ?auto_116854 ) ) ( not ( = ?auto_116850 ?auto_116851 ) ) ( not ( = ?auto_116850 ?auto_116852 ) ) ( not ( = ?auto_116850 ?auto_116853 ) ) ( not ( = ?auto_116850 ?auto_116854 ) ) ( not ( = ?auto_116851 ?auto_116852 ) ) ( not ( = ?auto_116851 ?auto_116853 ) ) ( not ( = ?auto_116851 ?auto_116854 ) ) ( not ( = ?auto_116852 ?auto_116853 ) ) ( not ( = ?auto_116852 ?auto_116854 ) ) ( not ( = ?auto_116853 ?auto_116854 ) ) ( ON-TABLE ?auto_116854 ) ( ON ?auto_116848 ?auto_116855 ) ( not ( = ?auto_116848 ?auto_116855 ) ) ( not ( = ?auto_116849 ?auto_116855 ) ) ( not ( = ?auto_116850 ?auto_116855 ) ) ( not ( = ?auto_116851 ?auto_116855 ) ) ( not ( = ?auto_116852 ?auto_116855 ) ) ( not ( = ?auto_116853 ?auto_116855 ) ) ( not ( = ?auto_116854 ?auto_116855 ) ) ( ON ?auto_116849 ?auto_116848 ) ( ON-TABLE ?auto_116855 ) ( ON ?auto_116850 ?auto_116849 ) ( ON ?auto_116851 ?auto_116850 ) ( ON ?auto_116852 ?auto_116851 ) ( CLEAR ?auto_116852 ) ( HOLDING ?auto_116853 ) ( CLEAR ?auto_116854 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_116854 ?auto_116853 )
      ( MAKE-7PILE ?auto_116848 ?auto_116849 ?auto_116850 ?auto_116851 ?auto_116852 ?auto_116853 ?auto_116854 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116856 - BLOCK
      ?auto_116857 - BLOCK
      ?auto_116858 - BLOCK
      ?auto_116859 - BLOCK
      ?auto_116860 - BLOCK
      ?auto_116861 - BLOCK
      ?auto_116862 - BLOCK
    )
    :vars
    (
      ?auto_116863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116856 ?auto_116857 ) ) ( not ( = ?auto_116856 ?auto_116858 ) ) ( not ( = ?auto_116856 ?auto_116859 ) ) ( not ( = ?auto_116856 ?auto_116860 ) ) ( not ( = ?auto_116856 ?auto_116861 ) ) ( not ( = ?auto_116856 ?auto_116862 ) ) ( not ( = ?auto_116857 ?auto_116858 ) ) ( not ( = ?auto_116857 ?auto_116859 ) ) ( not ( = ?auto_116857 ?auto_116860 ) ) ( not ( = ?auto_116857 ?auto_116861 ) ) ( not ( = ?auto_116857 ?auto_116862 ) ) ( not ( = ?auto_116858 ?auto_116859 ) ) ( not ( = ?auto_116858 ?auto_116860 ) ) ( not ( = ?auto_116858 ?auto_116861 ) ) ( not ( = ?auto_116858 ?auto_116862 ) ) ( not ( = ?auto_116859 ?auto_116860 ) ) ( not ( = ?auto_116859 ?auto_116861 ) ) ( not ( = ?auto_116859 ?auto_116862 ) ) ( not ( = ?auto_116860 ?auto_116861 ) ) ( not ( = ?auto_116860 ?auto_116862 ) ) ( not ( = ?auto_116861 ?auto_116862 ) ) ( ON-TABLE ?auto_116862 ) ( ON ?auto_116856 ?auto_116863 ) ( not ( = ?auto_116856 ?auto_116863 ) ) ( not ( = ?auto_116857 ?auto_116863 ) ) ( not ( = ?auto_116858 ?auto_116863 ) ) ( not ( = ?auto_116859 ?auto_116863 ) ) ( not ( = ?auto_116860 ?auto_116863 ) ) ( not ( = ?auto_116861 ?auto_116863 ) ) ( not ( = ?auto_116862 ?auto_116863 ) ) ( ON ?auto_116857 ?auto_116856 ) ( ON-TABLE ?auto_116863 ) ( ON ?auto_116858 ?auto_116857 ) ( ON ?auto_116859 ?auto_116858 ) ( ON ?auto_116860 ?auto_116859 ) ( CLEAR ?auto_116862 ) ( ON ?auto_116861 ?auto_116860 ) ( CLEAR ?auto_116861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_116863 ?auto_116856 ?auto_116857 ?auto_116858 ?auto_116859 ?auto_116860 )
      ( MAKE-7PILE ?auto_116856 ?auto_116857 ?auto_116858 ?auto_116859 ?auto_116860 ?auto_116861 ?auto_116862 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116864 - BLOCK
      ?auto_116865 - BLOCK
      ?auto_116866 - BLOCK
      ?auto_116867 - BLOCK
      ?auto_116868 - BLOCK
      ?auto_116869 - BLOCK
      ?auto_116870 - BLOCK
    )
    :vars
    (
      ?auto_116871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116864 ?auto_116865 ) ) ( not ( = ?auto_116864 ?auto_116866 ) ) ( not ( = ?auto_116864 ?auto_116867 ) ) ( not ( = ?auto_116864 ?auto_116868 ) ) ( not ( = ?auto_116864 ?auto_116869 ) ) ( not ( = ?auto_116864 ?auto_116870 ) ) ( not ( = ?auto_116865 ?auto_116866 ) ) ( not ( = ?auto_116865 ?auto_116867 ) ) ( not ( = ?auto_116865 ?auto_116868 ) ) ( not ( = ?auto_116865 ?auto_116869 ) ) ( not ( = ?auto_116865 ?auto_116870 ) ) ( not ( = ?auto_116866 ?auto_116867 ) ) ( not ( = ?auto_116866 ?auto_116868 ) ) ( not ( = ?auto_116866 ?auto_116869 ) ) ( not ( = ?auto_116866 ?auto_116870 ) ) ( not ( = ?auto_116867 ?auto_116868 ) ) ( not ( = ?auto_116867 ?auto_116869 ) ) ( not ( = ?auto_116867 ?auto_116870 ) ) ( not ( = ?auto_116868 ?auto_116869 ) ) ( not ( = ?auto_116868 ?auto_116870 ) ) ( not ( = ?auto_116869 ?auto_116870 ) ) ( ON ?auto_116864 ?auto_116871 ) ( not ( = ?auto_116864 ?auto_116871 ) ) ( not ( = ?auto_116865 ?auto_116871 ) ) ( not ( = ?auto_116866 ?auto_116871 ) ) ( not ( = ?auto_116867 ?auto_116871 ) ) ( not ( = ?auto_116868 ?auto_116871 ) ) ( not ( = ?auto_116869 ?auto_116871 ) ) ( not ( = ?auto_116870 ?auto_116871 ) ) ( ON ?auto_116865 ?auto_116864 ) ( ON-TABLE ?auto_116871 ) ( ON ?auto_116866 ?auto_116865 ) ( ON ?auto_116867 ?auto_116866 ) ( ON ?auto_116868 ?auto_116867 ) ( ON ?auto_116869 ?auto_116868 ) ( CLEAR ?auto_116869 ) ( HOLDING ?auto_116870 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116870 )
      ( MAKE-7PILE ?auto_116864 ?auto_116865 ?auto_116866 ?auto_116867 ?auto_116868 ?auto_116869 ?auto_116870 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116872 - BLOCK
      ?auto_116873 - BLOCK
      ?auto_116874 - BLOCK
      ?auto_116875 - BLOCK
      ?auto_116876 - BLOCK
      ?auto_116877 - BLOCK
      ?auto_116878 - BLOCK
    )
    :vars
    (
      ?auto_116879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116872 ?auto_116873 ) ) ( not ( = ?auto_116872 ?auto_116874 ) ) ( not ( = ?auto_116872 ?auto_116875 ) ) ( not ( = ?auto_116872 ?auto_116876 ) ) ( not ( = ?auto_116872 ?auto_116877 ) ) ( not ( = ?auto_116872 ?auto_116878 ) ) ( not ( = ?auto_116873 ?auto_116874 ) ) ( not ( = ?auto_116873 ?auto_116875 ) ) ( not ( = ?auto_116873 ?auto_116876 ) ) ( not ( = ?auto_116873 ?auto_116877 ) ) ( not ( = ?auto_116873 ?auto_116878 ) ) ( not ( = ?auto_116874 ?auto_116875 ) ) ( not ( = ?auto_116874 ?auto_116876 ) ) ( not ( = ?auto_116874 ?auto_116877 ) ) ( not ( = ?auto_116874 ?auto_116878 ) ) ( not ( = ?auto_116875 ?auto_116876 ) ) ( not ( = ?auto_116875 ?auto_116877 ) ) ( not ( = ?auto_116875 ?auto_116878 ) ) ( not ( = ?auto_116876 ?auto_116877 ) ) ( not ( = ?auto_116876 ?auto_116878 ) ) ( not ( = ?auto_116877 ?auto_116878 ) ) ( ON ?auto_116872 ?auto_116879 ) ( not ( = ?auto_116872 ?auto_116879 ) ) ( not ( = ?auto_116873 ?auto_116879 ) ) ( not ( = ?auto_116874 ?auto_116879 ) ) ( not ( = ?auto_116875 ?auto_116879 ) ) ( not ( = ?auto_116876 ?auto_116879 ) ) ( not ( = ?auto_116877 ?auto_116879 ) ) ( not ( = ?auto_116878 ?auto_116879 ) ) ( ON ?auto_116873 ?auto_116872 ) ( ON-TABLE ?auto_116879 ) ( ON ?auto_116874 ?auto_116873 ) ( ON ?auto_116875 ?auto_116874 ) ( ON ?auto_116876 ?auto_116875 ) ( ON ?auto_116877 ?auto_116876 ) ( ON ?auto_116878 ?auto_116877 ) ( CLEAR ?auto_116878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_116879 ?auto_116872 ?auto_116873 ?auto_116874 ?auto_116875 ?auto_116876 ?auto_116877 )
      ( MAKE-7PILE ?auto_116872 ?auto_116873 ?auto_116874 ?auto_116875 ?auto_116876 ?auto_116877 ?auto_116878 ) )
  )

)

