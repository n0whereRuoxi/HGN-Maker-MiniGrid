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

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23293 - BLOCK
    )
    :vars
    (
      ?auto_23294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23293 ?auto_23294 ) ( CLEAR ?auto_23293 ) ( HAND-EMPTY ) ( not ( = ?auto_23293 ?auto_23294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23293 ?auto_23294 )
      ( !PUTDOWN ?auto_23293 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23296 - BLOCK
    )
    :vars
    (
      ?auto_23297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23296 ?auto_23297 ) ( CLEAR ?auto_23296 ) ( HAND-EMPTY ) ( not ( = ?auto_23296 ?auto_23297 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23296 ?auto_23297 )
      ( !PUTDOWN ?auto_23296 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23300 - BLOCK
      ?auto_23301 - BLOCK
    )
    :vars
    (
      ?auto_23302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23300 ) ( ON ?auto_23301 ?auto_23302 ) ( CLEAR ?auto_23301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23300 ) ( not ( = ?auto_23300 ?auto_23301 ) ) ( not ( = ?auto_23300 ?auto_23302 ) ) ( not ( = ?auto_23301 ?auto_23302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23301 ?auto_23302 )
      ( !STACK ?auto_23301 ?auto_23300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23305 - BLOCK
      ?auto_23306 - BLOCK
    )
    :vars
    (
      ?auto_23307 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23305 ) ( ON ?auto_23306 ?auto_23307 ) ( CLEAR ?auto_23306 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23305 ) ( not ( = ?auto_23305 ?auto_23306 ) ) ( not ( = ?auto_23305 ?auto_23307 ) ) ( not ( = ?auto_23306 ?auto_23307 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23306 ?auto_23307 )
      ( !STACK ?auto_23306 ?auto_23305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23310 - BLOCK
      ?auto_23311 - BLOCK
    )
    :vars
    (
      ?auto_23312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23311 ?auto_23312 ) ( not ( = ?auto_23310 ?auto_23311 ) ) ( not ( = ?auto_23310 ?auto_23312 ) ) ( not ( = ?auto_23311 ?auto_23312 ) ) ( ON ?auto_23310 ?auto_23311 ) ( CLEAR ?auto_23310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23310 )
      ( MAKE-2PILE ?auto_23310 ?auto_23311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23315 - BLOCK
      ?auto_23316 - BLOCK
    )
    :vars
    (
      ?auto_23317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23316 ?auto_23317 ) ( not ( = ?auto_23315 ?auto_23316 ) ) ( not ( = ?auto_23315 ?auto_23317 ) ) ( not ( = ?auto_23316 ?auto_23317 ) ) ( ON ?auto_23315 ?auto_23316 ) ( CLEAR ?auto_23315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23315 )
      ( MAKE-2PILE ?auto_23315 ?auto_23316 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23321 - BLOCK
      ?auto_23322 - BLOCK
      ?auto_23323 - BLOCK
    )
    :vars
    (
      ?auto_23324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23322 ) ( ON ?auto_23323 ?auto_23324 ) ( CLEAR ?auto_23323 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23321 ) ( ON ?auto_23322 ?auto_23321 ) ( not ( = ?auto_23321 ?auto_23322 ) ) ( not ( = ?auto_23321 ?auto_23323 ) ) ( not ( = ?auto_23321 ?auto_23324 ) ) ( not ( = ?auto_23322 ?auto_23323 ) ) ( not ( = ?auto_23322 ?auto_23324 ) ) ( not ( = ?auto_23323 ?auto_23324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23323 ?auto_23324 )
      ( !STACK ?auto_23323 ?auto_23322 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23328 - BLOCK
      ?auto_23329 - BLOCK
      ?auto_23330 - BLOCK
    )
    :vars
    (
      ?auto_23331 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23329 ) ( ON ?auto_23330 ?auto_23331 ) ( CLEAR ?auto_23330 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23328 ) ( ON ?auto_23329 ?auto_23328 ) ( not ( = ?auto_23328 ?auto_23329 ) ) ( not ( = ?auto_23328 ?auto_23330 ) ) ( not ( = ?auto_23328 ?auto_23331 ) ) ( not ( = ?auto_23329 ?auto_23330 ) ) ( not ( = ?auto_23329 ?auto_23331 ) ) ( not ( = ?auto_23330 ?auto_23331 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23330 ?auto_23331 )
      ( !STACK ?auto_23330 ?auto_23329 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23335 - BLOCK
      ?auto_23336 - BLOCK
      ?auto_23337 - BLOCK
    )
    :vars
    (
      ?auto_23338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23337 ?auto_23338 ) ( ON-TABLE ?auto_23335 ) ( not ( = ?auto_23335 ?auto_23336 ) ) ( not ( = ?auto_23335 ?auto_23337 ) ) ( not ( = ?auto_23335 ?auto_23338 ) ) ( not ( = ?auto_23336 ?auto_23337 ) ) ( not ( = ?auto_23336 ?auto_23338 ) ) ( not ( = ?auto_23337 ?auto_23338 ) ) ( CLEAR ?auto_23335 ) ( ON ?auto_23336 ?auto_23337 ) ( CLEAR ?auto_23336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23335 ?auto_23336 )
      ( MAKE-3PILE ?auto_23335 ?auto_23336 ?auto_23337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23342 - BLOCK
      ?auto_23343 - BLOCK
      ?auto_23344 - BLOCK
    )
    :vars
    (
      ?auto_23345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23344 ?auto_23345 ) ( ON-TABLE ?auto_23342 ) ( not ( = ?auto_23342 ?auto_23343 ) ) ( not ( = ?auto_23342 ?auto_23344 ) ) ( not ( = ?auto_23342 ?auto_23345 ) ) ( not ( = ?auto_23343 ?auto_23344 ) ) ( not ( = ?auto_23343 ?auto_23345 ) ) ( not ( = ?auto_23344 ?auto_23345 ) ) ( CLEAR ?auto_23342 ) ( ON ?auto_23343 ?auto_23344 ) ( CLEAR ?auto_23343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23342 ?auto_23343 )
      ( MAKE-3PILE ?auto_23342 ?auto_23343 ?auto_23344 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23349 - BLOCK
      ?auto_23350 - BLOCK
      ?auto_23351 - BLOCK
    )
    :vars
    (
      ?auto_23352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23351 ?auto_23352 ) ( not ( = ?auto_23349 ?auto_23350 ) ) ( not ( = ?auto_23349 ?auto_23351 ) ) ( not ( = ?auto_23349 ?auto_23352 ) ) ( not ( = ?auto_23350 ?auto_23351 ) ) ( not ( = ?auto_23350 ?auto_23352 ) ) ( not ( = ?auto_23351 ?auto_23352 ) ) ( ON ?auto_23350 ?auto_23351 ) ( ON ?auto_23349 ?auto_23350 ) ( CLEAR ?auto_23349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23349 )
      ( MAKE-3PILE ?auto_23349 ?auto_23350 ?auto_23351 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23356 - BLOCK
      ?auto_23357 - BLOCK
      ?auto_23358 - BLOCK
    )
    :vars
    (
      ?auto_23359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23358 ?auto_23359 ) ( not ( = ?auto_23356 ?auto_23357 ) ) ( not ( = ?auto_23356 ?auto_23358 ) ) ( not ( = ?auto_23356 ?auto_23359 ) ) ( not ( = ?auto_23357 ?auto_23358 ) ) ( not ( = ?auto_23357 ?auto_23359 ) ) ( not ( = ?auto_23358 ?auto_23359 ) ) ( ON ?auto_23357 ?auto_23358 ) ( ON ?auto_23356 ?auto_23357 ) ( CLEAR ?auto_23356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23356 )
      ( MAKE-3PILE ?auto_23356 ?auto_23357 ?auto_23358 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23364 - BLOCK
      ?auto_23365 - BLOCK
      ?auto_23366 - BLOCK
      ?auto_23367 - BLOCK
    )
    :vars
    (
      ?auto_23368 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23366 ) ( ON ?auto_23367 ?auto_23368 ) ( CLEAR ?auto_23367 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23364 ) ( ON ?auto_23365 ?auto_23364 ) ( ON ?auto_23366 ?auto_23365 ) ( not ( = ?auto_23364 ?auto_23365 ) ) ( not ( = ?auto_23364 ?auto_23366 ) ) ( not ( = ?auto_23364 ?auto_23367 ) ) ( not ( = ?auto_23364 ?auto_23368 ) ) ( not ( = ?auto_23365 ?auto_23366 ) ) ( not ( = ?auto_23365 ?auto_23367 ) ) ( not ( = ?auto_23365 ?auto_23368 ) ) ( not ( = ?auto_23366 ?auto_23367 ) ) ( not ( = ?auto_23366 ?auto_23368 ) ) ( not ( = ?auto_23367 ?auto_23368 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23367 ?auto_23368 )
      ( !STACK ?auto_23367 ?auto_23366 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23373 - BLOCK
      ?auto_23374 - BLOCK
      ?auto_23375 - BLOCK
      ?auto_23376 - BLOCK
    )
    :vars
    (
      ?auto_23377 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23375 ) ( ON ?auto_23376 ?auto_23377 ) ( CLEAR ?auto_23376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23373 ) ( ON ?auto_23374 ?auto_23373 ) ( ON ?auto_23375 ?auto_23374 ) ( not ( = ?auto_23373 ?auto_23374 ) ) ( not ( = ?auto_23373 ?auto_23375 ) ) ( not ( = ?auto_23373 ?auto_23376 ) ) ( not ( = ?auto_23373 ?auto_23377 ) ) ( not ( = ?auto_23374 ?auto_23375 ) ) ( not ( = ?auto_23374 ?auto_23376 ) ) ( not ( = ?auto_23374 ?auto_23377 ) ) ( not ( = ?auto_23375 ?auto_23376 ) ) ( not ( = ?auto_23375 ?auto_23377 ) ) ( not ( = ?auto_23376 ?auto_23377 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23376 ?auto_23377 )
      ( !STACK ?auto_23376 ?auto_23375 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23382 - BLOCK
      ?auto_23383 - BLOCK
      ?auto_23384 - BLOCK
      ?auto_23385 - BLOCK
    )
    :vars
    (
      ?auto_23386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23385 ?auto_23386 ) ( ON-TABLE ?auto_23382 ) ( ON ?auto_23383 ?auto_23382 ) ( not ( = ?auto_23382 ?auto_23383 ) ) ( not ( = ?auto_23382 ?auto_23384 ) ) ( not ( = ?auto_23382 ?auto_23385 ) ) ( not ( = ?auto_23382 ?auto_23386 ) ) ( not ( = ?auto_23383 ?auto_23384 ) ) ( not ( = ?auto_23383 ?auto_23385 ) ) ( not ( = ?auto_23383 ?auto_23386 ) ) ( not ( = ?auto_23384 ?auto_23385 ) ) ( not ( = ?auto_23384 ?auto_23386 ) ) ( not ( = ?auto_23385 ?auto_23386 ) ) ( CLEAR ?auto_23383 ) ( ON ?auto_23384 ?auto_23385 ) ( CLEAR ?auto_23384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23382 ?auto_23383 ?auto_23384 )
      ( MAKE-4PILE ?auto_23382 ?auto_23383 ?auto_23384 ?auto_23385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23391 - BLOCK
      ?auto_23392 - BLOCK
      ?auto_23393 - BLOCK
      ?auto_23394 - BLOCK
    )
    :vars
    (
      ?auto_23395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23394 ?auto_23395 ) ( ON-TABLE ?auto_23391 ) ( ON ?auto_23392 ?auto_23391 ) ( not ( = ?auto_23391 ?auto_23392 ) ) ( not ( = ?auto_23391 ?auto_23393 ) ) ( not ( = ?auto_23391 ?auto_23394 ) ) ( not ( = ?auto_23391 ?auto_23395 ) ) ( not ( = ?auto_23392 ?auto_23393 ) ) ( not ( = ?auto_23392 ?auto_23394 ) ) ( not ( = ?auto_23392 ?auto_23395 ) ) ( not ( = ?auto_23393 ?auto_23394 ) ) ( not ( = ?auto_23393 ?auto_23395 ) ) ( not ( = ?auto_23394 ?auto_23395 ) ) ( CLEAR ?auto_23392 ) ( ON ?auto_23393 ?auto_23394 ) ( CLEAR ?auto_23393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23391 ?auto_23392 ?auto_23393 )
      ( MAKE-4PILE ?auto_23391 ?auto_23392 ?auto_23393 ?auto_23394 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23400 - BLOCK
      ?auto_23401 - BLOCK
      ?auto_23402 - BLOCK
      ?auto_23403 - BLOCK
    )
    :vars
    (
      ?auto_23404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23403 ?auto_23404 ) ( ON-TABLE ?auto_23400 ) ( not ( = ?auto_23400 ?auto_23401 ) ) ( not ( = ?auto_23400 ?auto_23402 ) ) ( not ( = ?auto_23400 ?auto_23403 ) ) ( not ( = ?auto_23400 ?auto_23404 ) ) ( not ( = ?auto_23401 ?auto_23402 ) ) ( not ( = ?auto_23401 ?auto_23403 ) ) ( not ( = ?auto_23401 ?auto_23404 ) ) ( not ( = ?auto_23402 ?auto_23403 ) ) ( not ( = ?auto_23402 ?auto_23404 ) ) ( not ( = ?auto_23403 ?auto_23404 ) ) ( ON ?auto_23402 ?auto_23403 ) ( CLEAR ?auto_23400 ) ( ON ?auto_23401 ?auto_23402 ) ( CLEAR ?auto_23401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23400 ?auto_23401 )
      ( MAKE-4PILE ?auto_23400 ?auto_23401 ?auto_23402 ?auto_23403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23409 - BLOCK
      ?auto_23410 - BLOCK
      ?auto_23411 - BLOCK
      ?auto_23412 - BLOCK
    )
    :vars
    (
      ?auto_23413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23412 ?auto_23413 ) ( ON-TABLE ?auto_23409 ) ( not ( = ?auto_23409 ?auto_23410 ) ) ( not ( = ?auto_23409 ?auto_23411 ) ) ( not ( = ?auto_23409 ?auto_23412 ) ) ( not ( = ?auto_23409 ?auto_23413 ) ) ( not ( = ?auto_23410 ?auto_23411 ) ) ( not ( = ?auto_23410 ?auto_23412 ) ) ( not ( = ?auto_23410 ?auto_23413 ) ) ( not ( = ?auto_23411 ?auto_23412 ) ) ( not ( = ?auto_23411 ?auto_23413 ) ) ( not ( = ?auto_23412 ?auto_23413 ) ) ( ON ?auto_23411 ?auto_23412 ) ( CLEAR ?auto_23409 ) ( ON ?auto_23410 ?auto_23411 ) ( CLEAR ?auto_23410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23409 ?auto_23410 )
      ( MAKE-4PILE ?auto_23409 ?auto_23410 ?auto_23411 ?auto_23412 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23418 - BLOCK
      ?auto_23419 - BLOCK
      ?auto_23420 - BLOCK
      ?auto_23421 - BLOCK
    )
    :vars
    (
      ?auto_23422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23421 ?auto_23422 ) ( not ( = ?auto_23418 ?auto_23419 ) ) ( not ( = ?auto_23418 ?auto_23420 ) ) ( not ( = ?auto_23418 ?auto_23421 ) ) ( not ( = ?auto_23418 ?auto_23422 ) ) ( not ( = ?auto_23419 ?auto_23420 ) ) ( not ( = ?auto_23419 ?auto_23421 ) ) ( not ( = ?auto_23419 ?auto_23422 ) ) ( not ( = ?auto_23420 ?auto_23421 ) ) ( not ( = ?auto_23420 ?auto_23422 ) ) ( not ( = ?auto_23421 ?auto_23422 ) ) ( ON ?auto_23420 ?auto_23421 ) ( ON ?auto_23419 ?auto_23420 ) ( ON ?auto_23418 ?auto_23419 ) ( CLEAR ?auto_23418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23418 )
      ( MAKE-4PILE ?auto_23418 ?auto_23419 ?auto_23420 ?auto_23421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23427 - BLOCK
      ?auto_23428 - BLOCK
      ?auto_23429 - BLOCK
      ?auto_23430 - BLOCK
    )
    :vars
    (
      ?auto_23431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23430 ?auto_23431 ) ( not ( = ?auto_23427 ?auto_23428 ) ) ( not ( = ?auto_23427 ?auto_23429 ) ) ( not ( = ?auto_23427 ?auto_23430 ) ) ( not ( = ?auto_23427 ?auto_23431 ) ) ( not ( = ?auto_23428 ?auto_23429 ) ) ( not ( = ?auto_23428 ?auto_23430 ) ) ( not ( = ?auto_23428 ?auto_23431 ) ) ( not ( = ?auto_23429 ?auto_23430 ) ) ( not ( = ?auto_23429 ?auto_23431 ) ) ( not ( = ?auto_23430 ?auto_23431 ) ) ( ON ?auto_23429 ?auto_23430 ) ( ON ?auto_23428 ?auto_23429 ) ( ON ?auto_23427 ?auto_23428 ) ( CLEAR ?auto_23427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23427 )
      ( MAKE-4PILE ?auto_23427 ?auto_23428 ?auto_23429 ?auto_23430 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23437 - BLOCK
      ?auto_23438 - BLOCK
      ?auto_23439 - BLOCK
      ?auto_23440 - BLOCK
      ?auto_23441 - BLOCK
    )
    :vars
    (
      ?auto_23442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23440 ) ( ON ?auto_23441 ?auto_23442 ) ( CLEAR ?auto_23441 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23437 ) ( ON ?auto_23438 ?auto_23437 ) ( ON ?auto_23439 ?auto_23438 ) ( ON ?auto_23440 ?auto_23439 ) ( not ( = ?auto_23437 ?auto_23438 ) ) ( not ( = ?auto_23437 ?auto_23439 ) ) ( not ( = ?auto_23437 ?auto_23440 ) ) ( not ( = ?auto_23437 ?auto_23441 ) ) ( not ( = ?auto_23437 ?auto_23442 ) ) ( not ( = ?auto_23438 ?auto_23439 ) ) ( not ( = ?auto_23438 ?auto_23440 ) ) ( not ( = ?auto_23438 ?auto_23441 ) ) ( not ( = ?auto_23438 ?auto_23442 ) ) ( not ( = ?auto_23439 ?auto_23440 ) ) ( not ( = ?auto_23439 ?auto_23441 ) ) ( not ( = ?auto_23439 ?auto_23442 ) ) ( not ( = ?auto_23440 ?auto_23441 ) ) ( not ( = ?auto_23440 ?auto_23442 ) ) ( not ( = ?auto_23441 ?auto_23442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23441 ?auto_23442 )
      ( !STACK ?auto_23441 ?auto_23440 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23448 - BLOCK
      ?auto_23449 - BLOCK
      ?auto_23450 - BLOCK
      ?auto_23451 - BLOCK
      ?auto_23452 - BLOCK
    )
    :vars
    (
      ?auto_23453 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23451 ) ( ON ?auto_23452 ?auto_23453 ) ( CLEAR ?auto_23452 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23448 ) ( ON ?auto_23449 ?auto_23448 ) ( ON ?auto_23450 ?auto_23449 ) ( ON ?auto_23451 ?auto_23450 ) ( not ( = ?auto_23448 ?auto_23449 ) ) ( not ( = ?auto_23448 ?auto_23450 ) ) ( not ( = ?auto_23448 ?auto_23451 ) ) ( not ( = ?auto_23448 ?auto_23452 ) ) ( not ( = ?auto_23448 ?auto_23453 ) ) ( not ( = ?auto_23449 ?auto_23450 ) ) ( not ( = ?auto_23449 ?auto_23451 ) ) ( not ( = ?auto_23449 ?auto_23452 ) ) ( not ( = ?auto_23449 ?auto_23453 ) ) ( not ( = ?auto_23450 ?auto_23451 ) ) ( not ( = ?auto_23450 ?auto_23452 ) ) ( not ( = ?auto_23450 ?auto_23453 ) ) ( not ( = ?auto_23451 ?auto_23452 ) ) ( not ( = ?auto_23451 ?auto_23453 ) ) ( not ( = ?auto_23452 ?auto_23453 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23452 ?auto_23453 )
      ( !STACK ?auto_23452 ?auto_23451 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23459 - BLOCK
      ?auto_23460 - BLOCK
      ?auto_23461 - BLOCK
      ?auto_23462 - BLOCK
      ?auto_23463 - BLOCK
    )
    :vars
    (
      ?auto_23464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23463 ?auto_23464 ) ( ON-TABLE ?auto_23459 ) ( ON ?auto_23460 ?auto_23459 ) ( ON ?auto_23461 ?auto_23460 ) ( not ( = ?auto_23459 ?auto_23460 ) ) ( not ( = ?auto_23459 ?auto_23461 ) ) ( not ( = ?auto_23459 ?auto_23462 ) ) ( not ( = ?auto_23459 ?auto_23463 ) ) ( not ( = ?auto_23459 ?auto_23464 ) ) ( not ( = ?auto_23460 ?auto_23461 ) ) ( not ( = ?auto_23460 ?auto_23462 ) ) ( not ( = ?auto_23460 ?auto_23463 ) ) ( not ( = ?auto_23460 ?auto_23464 ) ) ( not ( = ?auto_23461 ?auto_23462 ) ) ( not ( = ?auto_23461 ?auto_23463 ) ) ( not ( = ?auto_23461 ?auto_23464 ) ) ( not ( = ?auto_23462 ?auto_23463 ) ) ( not ( = ?auto_23462 ?auto_23464 ) ) ( not ( = ?auto_23463 ?auto_23464 ) ) ( CLEAR ?auto_23461 ) ( ON ?auto_23462 ?auto_23463 ) ( CLEAR ?auto_23462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23459 ?auto_23460 ?auto_23461 ?auto_23462 )
      ( MAKE-5PILE ?auto_23459 ?auto_23460 ?auto_23461 ?auto_23462 ?auto_23463 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23470 - BLOCK
      ?auto_23471 - BLOCK
      ?auto_23472 - BLOCK
      ?auto_23473 - BLOCK
      ?auto_23474 - BLOCK
    )
    :vars
    (
      ?auto_23475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23474 ?auto_23475 ) ( ON-TABLE ?auto_23470 ) ( ON ?auto_23471 ?auto_23470 ) ( ON ?auto_23472 ?auto_23471 ) ( not ( = ?auto_23470 ?auto_23471 ) ) ( not ( = ?auto_23470 ?auto_23472 ) ) ( not ( = ?auto_23470 ?auto_23473 ) ) ( not ( = ?auto_23470 ?auto_23474 ) ) ( not ( = ?auto_23470 ?auto_23475 ) ) ( not ( = ?auto_23471 ?auto_23472 ) ) ( not ( = ?auto_23471 ?auto_23473 ) ) ( not ( = ?auto_23471 ?auto_23474 ) ) ( not ( = ?auto_23471 ?auto_23475 ) ) ( not ( = ?auto_23472 ?auto_23473 ) ) ( not ( = ?auto_23472 ?auto_23474 ) ) ( not ( = ?auto_23472 ?auto_23475 ) ) ( not ( = ?auto_23473 ?auto_23474 ) ) ( not ( = ?auto_23473 ?auto_23475 ) ) ( not ( = ?auto_23474 ?auto_23475 ) ) ( CLEAR ?auto_23472 ) ( ON ?auto_23473 ?auto_23474 ) ( CLEAR ?auto_23473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23470 ?auto_23471 ?auto_23472 ?auto_23473 )
      ( MAKE-5PILE ?auto_23470 ?auto_23471 ?auto_23472 ?auto_23473 ?auto_23474 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23481 - BLOCK
      ?auto_23482 - BLOCK
      ?auto_23483 - BLOCK
      ?auto_23484 - BLOCK
      ?auto_23485 - BLOCK
    )
    :vars
    (
      ?auto_23486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23485 ?auto_23486 ) ( ON-TABLE ?auto_23481 ) ( ON ?auto_23482 ?auto_23481 ) ( not ( = ?auto_23481 ?auto_23482 ) ) ( not ( = ?auto_23481 ?auto_23483 ) ) ( not ( = ?auto_23481 ?auto_23484 ) ) ( not ( = ?auto_23481 ?auto_23485 ) ) ( not ( = ?auto_23481 ?auto_23486 ) ) ( not ( = ?auto_23482 ?auto_23483 ) ) ( not ( = ?auto_23482 ?auto_23484 ) ) ( not ( = ?auto_23482 ?auto_23485 ) ) ( not ( = ?auto_23482 ?auto_23486 ) ) ( not ( = ?auto_23483 ?auto_23484 ) ) ( not ( = ?auto_23483 ?auto_23485 ) ) ( not ( = ?auto_23483 ?auto_23486 ) ) ( not ( = ?auto_23484 ?auto_23485 ) ) ( not ( = ?auto_23484 ?auto_23486 ) ) ( not ( = ?auto_23485 ?auto_23486 ) ) ( ON ?auto_23484 ?auto_23485 ) ( CLEAR ?auto_23482 ) ( ON ?auto_23483 ?auto_23484 ) ( CLEAR ?auto_23483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23481 ?auto_23482 ?auto_23483 )
      ( MAKE-5PILE ?auto_23481 ?auto_23482 ?auto_23483 ?auto_23484 ?auto_23485 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23492 - BLOCK
      ?auto_23493 - BLOCK
      ?auto_23494 - BLOCK
      ?auto_23495 - BLOCK
      ?auto_23496 - BLOCK
    )
    :vars
    (
      ?auto_23497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23496 ?auto_23497 ) ( ON-TABLE ?auto_23492 ) ( ON ?auto_23493 ?auto_23492 ) ( not ( = ?auto_23492 ?auto_23493 ) ) ( not ( = ?auto_23492 ?auto_23494 ) ) ( not ( = ?auto_23492 ?auto_23495 ) ) ( not ( = ?auto_23492 ?auto_23496 ) ) ( not ( = ?auto_23492 ?auto_23497 ) ) ( not ( = ?auto_23493 ?auto_23494 ) ) ( not ( = ?auto_23493 ?auto_23495 ) ) ( not ( = ?auto_23493 ?auto_23496 ) ) ( not ( = ?auto_23493 ?auto_23497 ) ) ( not ( = ?auto_23494 ?auto_23495 ) ) ( not ( = ?auto_23494 ?auto_23496 ) ) ( not ( = ?auto_23494 ?auto_23497 ) ) ( not ( = ?auto_23495 ?auto_23496 ) ) ( not ( = ?auto_23495 ?auto_23497 ) ) ( not ( = ?auto_23496 ?auto_23497 ) ) ( ON ?auto_23495 ?auto_23496 ) ( CLEAR ?auto_23493 ) ( ON ?auto_23494 ?auto_23495 ) ( CLEAR ?auto_23494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23492 ?auto_23493 ?auto_23494 )
      ( MAKE-5PILE ?auto_23492 ?auto_23493 ?auto_23494 ?auto_23495 ?auto_23496 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23503 - BLOCK
      ?auto_23504 - BLOCK
      ?auto_23505 - BLOCK
      ?auto_23506 - BLOCK
      ?auto_23507 - BLOCK
    )
    :vars
    (
      ?auto_23508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23507 ?auto_23508 ) ( ON-TABLE ?auto_23503 ) ( not ( = ?auto_23503 ?auto_23504 ) ) ( not ( = ?auto_23503 ?auto_23505 ) ) ( not ( = ?auto_23503 ?auto_23506 ) ) ( not ( = ?auto_23503 ?auto_23507 ) ) ( not ( = ?auto_23503 ?auto_23508 ) ) ( not ( = ?auto_23504 ?auto_23505 ) ) ( not ( = ?auto_23504 ?auto_23506 ) ) ( not ( = ?auto_23504 ?auto_23507 ) ) ( not ( = ?auto_23504 ?auto_23508 ) ) ( not ( = ?auto_23505 ?auto_23506 ) ) ( not ( = ?auto_23505 ?auto_23507 ) ) ( not ( = ?auto_23505 ?auto_23508 ) ) ( not ( = ?auto_23506 ?auto_23507 ) ) ( not ( = ?auto_23506 ?auto_23508 ) ) ( not ( = ?auto_23507 ?auto_23508 ) ) ( ON ?auto_23506 ?auto_23507 ) ( ON ?auto_23505 ?auto_23506 ) ( CLEAR ?auto_23503 ) ( ON ?auto_23504 ?auto_23505 ) ( CLEAR ?auto_23504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23503 ?auto_23504 )
      ( MAKE-5PILE ?auto_23503 ?auto_23504 ?auto_23505 ?auto_23506 ?auto_23507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23514 - BLOCK
      ?auto_23515 - BLOCK
      ?auto_23516 - BLOCK
      ?auto_23517 - BLOCK
      ?auto_23518 - BLOCK
    )
    :vars
    (
      ?auto_23519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23518 ?auto_23519 ) ( ON-TABLE ?auto_23514 ) ( not ( = ?auto_23514 ?auto_23515 ) ) ( not ( = ?auto_23514 ?auto_23516 ) ) ( not ( = ?auto_23514 ?auto_23517 ) ) ( not ( = ?auto_23514 ?auto_23518 ) ) ( not ( = ?auto_23514 ?auto_23519 ) ) ( not ( = ?auto_23515 ?auto_23516 ) ) ( not ( = ?auto_23515 ?auto_23517 ) ) ( not ( = ?auto_23515 ?auto_23518 ) ) ( not ( = ?auto_23515 ?auto_23519 ) ) ( not ( = ?auto_23516 ?auto_23517 ) ) ( not ( = ?auto_23516 ?auto_23518 ) ) ( not ( = ?auto_23516 ?auto_23519 ) ) ( not ( = ?auto_23517 ?auto_23518 ) ) ( not ( = ?auto_23517 ?auto_23519 ) ) ( not ( = ?auto_23518 ?auto_23519 ) ) ( ON ?auto_23517 ?auto_23518 ) ( ON ?auto_23516 ?auto_23517 ) ( CLEAR ?auto_23514 ) ( ON ?auto_23515 ?auto_23516 ) ( CLEAR ?auto_23515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23514 ?auto_23515 )
      ( MAKE-5PILE ?auto_23514 ?auto_23515 ?auto_23516 ?auto_23517 ?auto_23518 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23525 - BLOCK
      ?auto_23526 - BLOCK
      ?auto_23527 - BLOCK
      ?auto_23528 - BLOCK
      ?auto_23529 - BLOCK
    )
    :vars
    (
      ?auto_23530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23529 ?auto_23530 ) ( not ( = ?auto_23525 ?auto_23526 ) ) ( not ( = ?auto_23525 ?auto_23527 ) ) ( not ( = ?auto_23525 ?auto_23528 ) ) ( not ( = ?auto_23525 ?auto_23529 ) ) ( not ( = ?auto_23525 ?auto_23530 ) ) ( not ( = ?auto_23526 ?auto_23527 ) ) ( not ( = ?auto_23526 ?auto_23528 ) ) ( not ( = ?auto_23526 ?auto_23529 ) ) ( not ( = ?auto_23526 ?auto_23530 ) ) ( not ( = ?auto_23527 ?auto_23528 ) ) ( not ( = ?auto_23527 ?auto_23529 ) ) ( not ( = ?auto_23527 ?auto_23530 ) ) ( not ( = ?auto_23528 ?auto_23529 ) ) ( not ( = ?auto_23528 ?auto_23530 ) ) ( not ( = ?auto_23529 ?auto_23530 ) ) ( ON ?auto_23528 ?auto_23529 ) ( ON ?auto_23527 ?auto_23528 ) ( ON ?auto_23526 ?auto_23527 ) ( ON ?auto_23525 ?auto_23526 ) ( CLEAR ?auto_23525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23525 )
      ( MAKE-5PILE ?auto_23525 ?auto_23526 ?auto_23527 ?auto_23528 ?auto_23529 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23536 - BLOCK
      ?auto_23537 - BLOCK
      ?auto_23538 - BLOCK
      ?auto_23539 - BLOCK
      ?auto_23540 - BLOCK
    )
    :vars
    (
      ?auto_23541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23540 ?auto_23541 ) ( not ( = ?auto_23536 ?auto_23537 ) ) ( not ( = ?auto_23536 ?auto_23538 ) ) ( not ( = ?auto_23536 ?auto_23539 ) ) ( not ( = ?auto_23536 ?auto_23540 ) ) ( not ( = ?auto_23536 ?auto_23541 ) ) ( not ( = ?auto_23537 ?auto_23538 ) ) ( not ( = ?auto_23537 ?auto_23539 ) ) ( not ( = ?auto_23537 ?auto_23540 ) ) ( not ( = ?auto_23537 ?auto_23541 ) ) ( not ( = ?auto_23538 ?auto_23539 ) ) ( not ( = ?auto_23538 ?auto_23540 ) ) ( not ( = ?auto_23538 ?auto_23541 ) ) ( not ( = ?auto_23539 ?auto_23540 ) ) ( not ( = ?auto_23539 ?auto_23541 ) ) ( not ( = ?auto_23540 ?auto_23541 ) ) ( ON ?auto_23539 ?auto_23540 ) ( ON ?auto_23538 ?auto_23539 ) ( ON ?auto_23537 ?auto_23538 ) ( ON ?auto_23536 ?auto_23537 ) ( CLEAR ?auto_23536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23536 )
      ( MAKE-5PILE ?auto_23536 ?auto_23537 ?auto_23538 ?auto_23539 ?auto_23540 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23548 - BLOCK
      ?auto_23549 - BLOCK
      ?auto_23550 - BLOCK
      ?auto_23551 - BLOCK
      ?auto_23552 - BLOCK
      ?auto_23553 - BLOCK
    )
    :vars
    (
      ?auto_23554 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23552 ) ( ON ?auto_23553 ?auto_23554 ) ( CLEAR ?auto_23553 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23548 ) ( ON ?auto_23549 ?auto_23548 ) ( ON ?auto_23550 ?auto_23549 ) ( ON ?auto_23551 ?auto_23550 ) ( ON ?auto_23552 ?auto_23551 ) ( not ( = ?auto_23548 ?auto_23549 ) ) ( not ( = ?auto_23548 ?auto_23550 ) ) ( not ( = ?auto_23548 ?auto_23551 ) ) ( not ( = ?auto_23548 ?auto_23552 ) ) ( not ( = ?auto_23548 ?auto_23553 ) ) ( not ( = ?auto_23548 ?auto_23554 ) ) ( not ( = ?auto_23549 ?auto_23550 ) ) ( not ( = ?auto_23549 ?auto_23551 ) ) ( not ( = ?auto_23549 ?auto_23552 ) ) ( not ( = ?auto_23549 ?auto_23553 ) ) ( not ( = ?auto_23549 ?auto_23554 ) ) ( not ( = ?auto_23550 ?auto_23551 ) ) ( not ( = ?auto_23550 ?auto_23552 ) ) ( not ( = ?auto_23550 ?auto_23553 ) ) ( not ( = ?auto_23550 ?auto_23554 ) ) ( not ( = ?auto_23551 ?auto_23552 ) ) ( not ( = ?auto_23551 ?auto_23553 ) ) ( not ( = ?auto_23551 ?auto_23554 ) ) ( not ( = ?auto_23552 ?auto_23553 ) ) ( not ( = ?auto_23552 ?auto_23554 ) ) ( not ( = ?auto_23553 ?auto_23554 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23553 ?auto_23554 )
      ( !STACK ?auto_23553 ?auto_23552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23561 - BLOCK
      ?auto_23562 - BLOCK
      ?auto_23563 - BLOCK
      ?auto_23564 - BLOCK
      ?auto_23565 - BLOCK
      ?auto_23566 - BLOCK
    )
    :vars
    (
      ?auto_23567 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23565 ) ( ON ?auto_23566 ?auto_23567 ) ( CLEAR ?auto_23566 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23561 ) ( ON ?auto_23562 ?auto_23561 ) ( ON ?auto_23563 ?auto_23562 ) ( ON ?auto_23564 ?auto_23563 ) ( ON ?auto_23565 ?auto_23564 ) ( not ( = ?auto_23561 ?auto_23562 ) ) ( not ( = ?auto_23561 ?auto_23563 ) ) ( not ( = ?auto_23561 ?auto_23564 ) ) ( not ( = ?auto_23561 ?auto_23565 ) ) ( not ( = ?auto_23561 ?auto_23566 ) ) ( not ( = ?auto_23561 ?auto_23567 ) ) ( not ( = ?auto_23562 ?auto_23563 ) ) ( not ( = ?auto_23562 ?auto_23564 ) ) ( not ( = ?auto_23562 ?auto_23565 ) ) ( not ( = ?auto_23562 ?auto_23566 ) ) ( not ( = ?auto_23562 ?auto_23567 ) ) ( not ( = ?auto_23563 ?auto_23564 ) ) ( not ( = ?auto_23563 ?auto_23565 ) ) ( not ( = ?auto_23563 ?auto_23566 ) ) ( not ( = ?auto_23563 ?auto_23567 ) ) ( not ( = ?auto_23564 ?auto_23565 ) ) ( not ( = ?auto_23564 ?auto_23566 ) ) ( not ( = ?auto_23564 ?auto_23567 ) ) ( not ( = ?auto_23565 ?auto_23566 ) ) ( not ( = ?auto_23565 ?auto_23567 ) ) ( not ( = ?auto_23566 ?auto_23567 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23566 ?auto_23567 )
      ( !STACK ?auto_23566 ?auto_23565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23574 - BLOCK
      ?auto_23575 - BLOCK
      ?auto_23576 - BLOCK
      ?auto_23577 - BLOCK
      ?auto_23578 - BLOCK
      ?auto_23579 - BLOCK
    )
    :vars
    (
      ?auto_23580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23579 ?auto_23580 ) ( ON-TABLE ?auto_23574 ) ( ON ?auto_23575 ?auto_23574 ) ( ON ?auto_23576 ?auto_23575 ) ( ON ?auto_23577 ?auto_23576 ) ( not ( = ?auto_23574 ?auto_23575 ) ) ( not ( = ?auto_23574 ?auto_23576 ) ) ( not ( = ?auto_23574 ?auto_23577 ) ) ( not ( = ?auto_23574 ?auto_23578 ) ) ( not ( = ?auto_23574 ?auto_23579 ) ) ( not ( = ?auto_23574 ?auto_23580 ) ) ( not ( = ?auto_23575 ?auto_23576 ) ) ( not ( = ?auto_23575 ?auto_23577 ) ) ( not ( = ?auto_23575 ?auto_23578 ) ) ( not ( = ?auto_23575 ?auto_23579 ) ) ( not ( = ?auto_23575 ?auto_23580 ) ) ( not ( = ?auto_23576 ?auto_23577 ) ) ( not ( = ?auto_23576 ?auto_23578 ) ) ( not ( = ?auto_23576 ?auto_23579 ) ) ( not ( = ?auto_23576 ?auto_23580 ) ) ( not ( = ?auto_23577 ?auto_23578 ) ) ( not ( = ?auto_23577 ?auto_23579 ) ) ( not ( = ?auto_23577 ?auto_23580 ) ) ( not ( = ?auto_23578 ?auto_23579 ) ) ( not ( = ?auto_23578 ?auto_23580 ) ) ( not ( = ?auto_23579 ?auto_23580 ) ) ( CLEAR ?auto_23577 ) ( ON ?auto_23578 ?auto_23579 ) ( CLEAR ?auto_23578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23574 ?auto_23575 ?auto_23576 ?auto_23577 ?auto_23578 )
      ( MAKE-6PILE ?auto_23574 ?auto_23575 ?auto_23576 ?auto_23577 ?auto_23578 ?auto_23579 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23587 - BLOCK
      ?auto_23588 - BLOCK
      ?auto_23589 - BLOCK
      ?auto_23590 - BLOCK
      ?auto_23591 - BLOCK
      ?auto_23592 - BLOCK
    )
    :vars
    (
      ?auto_23593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23592 ?auto_23593 ) ( ON-TABLE ?auto_23587 ) ( ON ?auto_23588 ?auto_23587 ) ( ON ?auto_23589 ?auto_23588 ) ( ON ?auto_23590 ?auto_23589 ) ( not ( = ?auto_23587 ?auto_23588 ) ) ( not ( = ?auto_23587 ?auto_23589 ) ) ( not ( = ?auto_23587 ?auto_23590 ) ) ( not ( = ?auto_23587 ?auto_23591 ) ) ( not ( = ?auto_23587 ?auto_23592 ) ) ( not ( = ?auto_23587 ?auto_23593 ) ) ( not ( = ?auto_23588 ?auto_23589 ) ) ( not ( = ?auto_23588 ?auto_23590 ) ) ( not ( = ?auto_23588 ?auto_23591 ) ) ( not ( = ?auto_23588 ?auto_23592 ) ) ( not ( = ?auto_23588 ?auto_23593 ) ) ( not ( = ?auto_23589 ?auto_23590 ) ) ( not ( = ?auto_23589 ?auto_23591 ) ) ( not ( = ?auto_23589 ?auto_23592 ) ) ( not ( = ?auto_23589 ?auto_23593 ) ) ( not ( = ?auto_23590 ?auto_23591 ) ) ( not ( = ?auto_23590 ?auto_23592 ) ) ( not ( = ?auto_23590 ?auto_23593 ) ) ( not ( = ?auto_23591 ?auto_23592 ) ) ( not ( = ?auto_23591 ?auto_23593 ) ) ( not ( = ?auto_23592 ?auto_23593 ) ) ( CLEAR ?auto_23590 ) ( ON ?auto_23591 ?auto_23592 ) ( CLEAR ?auto_23591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23587 ?auto_23588 ?auto_23589 ?auto_23590 ?auto_23591 )
      ( MAKE-6PILE ?auto_23587 ?auto_23588 ?auto_23589 ?auto_23590 ?auto_23591 ?auto_23592 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23600 - BLOCK
      ?auto_23601 - BLOCK
      ?auto_23602 - BLOCK
      ?auto_23603 - BLOCK
      ?auto_23604 - BLOCK
      ?auto_23605 - BLOCK
    )
    :vars
    (
      ?auto_23606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23605 ?auto_23606 ) ( ON-TABLE ?auto_23600 ) ( ON ?auto_23601 ?auto_23600 ) ( ON ?auto_23602 ?auto_23601 ) ( not ( = ?auto_23600 ?auto_23601 ) ) ( not ( = ?auto_23600 ?auto_23602 ) ) ( not ( = ?auto_23600 ?auto_23603 ) ) ( not ( = ?auto_23600 ?auto_23604 ) ) ( not ( = ?auto_23600 ?auto_23605 ) ) ( not ( = ?auto_23600 ?auto_23606 ) ) ( not ( = ?auto_23601 ?auto_23602 ) ) ( not ( = ?auto_23601 ?auto_23603 ) ) ( not ( = ?auto_23601 ?auto_23604 ) ) ( not ( = ?auto_23601 ?auto_23605 ) ) ( not ( = ?auto_23601 ?auto_23606 ) ) ( not ( = ?auto_23602 ?auto_23603 ) ) ( not ( = ?auto_23602 ?auto_23604 ) ) ( not ( = ?auto_23602 ?auto_23605 ) ) ( not ( = ?auto_23602 ?auto_23606 ) ) ( not ( = ?auto_23603 ?auto_23604 ) ) ( not ( = ?auto_23603 ?auto_23605 ) ) ( not ( = ?auto_23603 ?auto_23606 ) ) ( not ( = ?auto_23604 ?auto_23605 ) ) ( not ( = ?auto_23604 ?auto_23606 ) ) ( not ( = ?auto_23605 ?auto_23606 ) ) ( ON ?auto_23604 ?auto_23605 ) ( CLEAR ?auto_23602 ) ( ON ?auto_23603 ?auto_23604 ) ( CLEAR ?auto_23603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23600 ?auto_23601 ?auto_23602 ?auto_23603 )
      ( MAKE-6PILE ?auto_23600 ?auto_23601 ?auto_23602 ?auto_23603 ?auto_23604 ?auto_23605 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23613 - BLOCK
      ?auto_23614 - BLOCK
      ?auto_23615 - BLOCK
      ?auto_23616 - BLOCK
      ?auto_23617 - BLOCK
      ?auto_23618 - BLOCK
    )
    :vars
    (
      ?auto_23619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23618 ?auto_23619 ) ( ON-TABLE ?auto_23613 ) ( ON ?auto_23614 ?auto_23613 ) ( ON ?auto_23615 ?auto_23614 ) ( not ( = ?auto_23613 ?auto_23614 ) ) ( not ( = ?auto_23613 ?auto_23615 ) ) ( not ( = ?auto_23613 ?auto_23616 ) ) ( not ( = ?auto_23613 ?auto_23617 ) ) ( not ( = ?auto_23613 ?auto_23618 ) ) ( not ( = ?auto_23613 ?auto_23619 ) ) ( not ( = ?auto_23614 ?auto_23615 ) ) ( not ( = ?auto_23614 ?auto_23616 ) ) ( not ( = ?auto_23614 ?auto_23617 ) ) ( not ( = ?auto_23614 ?auto_23618 ) ) ( not ( = ?auto_23614 ?auto_23619 ) ) ( not ( = ?auto_23615 ?auto_23616 ) ) ( not ( = ?auto_23615 ?auto_23617 ) ) ( not ( = ?auto_23615 ?auto_23618 ) ) ( not ( = ?auto_23615 ?auto_23619 ) ) ( not ( = ?auto_23616 ?auto_23617 ) ) ( not ( = ?auto_23616 ?auto_23618 ) ) ( not ( = ?auto_23616 ?auto_23619 ) ) ( not ( = ?auto_23617 ?auto_23618 ) ) ( not ( = ?auto_23617 ?auto_23619 ) ) ( not ( = ?auto_23618 ?auto_23619 ) ) ( ON ?auto_23617 ?auto_23618 ) ( CLEAR ?auto_23615 ) ( ON ?auto_23616 ?auto_23617 ) ( CLEAR ?auto_23616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23613 ?auto_23614 ?auto_23615 ?auto_23616 )
      ( MAKE-6PILE ?auto_23613 ?auto_23614 ?auto_23615 ?auto_23616 ?auto_23617 ?auto_23618 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23626 - BLOCK
      ?auto_23627 - BLOCK
      ?auto_23628 - BLOCK
      ?auto_23629 - BLOCK
      ?auto_23630 - BLOCK
      ?auto_23631 - BLOCK
    )
    :vars
    (
      ?auto_23632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23631 ?auto_23632 ) ( ON-TABLE ?auto_23626 ) ( ON ?auto_23627 ?auto_23626 ) ( not ( = ?auto_23626 ?auto_23627 ) ) ( not ( = ?auto_23626 ?auto_23628 ) ) ( not ( = ?auto_23626 ?auto_23629 ) ) ( not ( = ?auto_23626 ?auto_23630 ) ) ( not ( = ?auto_23626 ?auto_23631 ) ) ( not ( = ?auto_23626 ?auto_23632 ) ) ( not ( = ?auto_23627 ?auto_23628 ) ) ( not ( = ?auto_23627 ?auto_23629 ) ) ( not ( = ?auto_23627 ?auto_23630 ) ) ( not ( = ?auto_23627 ?auto_23631 ) ) ( not ( = ?auto_23627 ?auto_23632 ) ) ( not ( = ?auto_23628 ?auto_23629 ) ) ( not ( = ?auto_23628 ?auto_23630 ) ) ( not ( = ?auto_23628 ?auto_23631 ) ) ( not ( = ?auto_23628 ?auto_23632 ) ) ( not ( = ?auto_23629 ?auto_23630 ) ) ( not ( = ?auto_23629 ?auto_23631 ) ) ( not ( = ?auto_23629 ?auto_23632 ) ) ( not ( = ?auto_23630 ?auto_23631 ) ) ( not ( = ?auto_23630 ?auto_23632 ) ) ( not ( = ?auto_23631 ?auto_23632 ) ) ( ON ?auto_23630 ?auto_23631 ) ( ON ?auto_23629 ?auto_23630 ) ( CLEAR ?auto_23627 ) ( ON ?auto_23628 ?auto_23629 ) ( CLEAR ?auto_23628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23626 ?auto_23627 ?auto_23628 )
      ( MAKE-6PILE ?auto_23626 ?auto_23627 ?auto_23628 ?auto_23629 ?auto_23630 ?auto_23631 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23639 - BLOCK
      ?auto_23640 - BLOCK
      ?auto_23641 - BLOCK
      ?auto_23642 - BLOCK
      ?auto_23643 - BLOCK
      ?auto_23644 - BLOCK
    )
    :vars
    (
      ?auto_23645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23644 ?auto_23645 ) ( ON-TABLE ?auto_23639 ) ( ON ?auto_23640 ?auto_23639 ) ( not ( = ?auto_23639 ?auto_23640 ) ) ( not ( = ?auto_23639 ?auto_23641 ) ) ( not ( = ?auto_23639 ?auto_23642 ) ) ( not ( = ?auto_23639 ?auto_23643 ) ) ( not ( = ?auto_23639 ?auto_23644 ) ) ( not ( = ?auto_23639 ?auto_23645 ) ) ( not ( = ?auto_23640 ?auto_23641 ) ) ( not ( = ?auto_23640 ?auto_23642 ) ) ( not ( = ?auto_23640 ?auto_23643 ) ) ( not ( = ?auto_23640 ?auto_23644 ) ) ( not ( = ?auto_23640 ?auto_23645 ) ) ( not ( = ?auto_23641 ?auto_23642 ) ) ( not ( = ?auto_23641 ?auto_23643 ) ) ( not ( = ?auto_23641 ?auto_23644 ) ) ( not ( = ?auto_23641 ?auto_23645 ) ) ( not ( = ?auto_23642 ?auto_23643 ) ) ( not ( = ?auto_23642 ?auto_23644 ) ) ( not ( = ?auto_23642 ?auto_23645 ) ) ( not ( = ?auto_23643 ?auto_23644 ) ) ( not ( = ?auto_23643 ?auto_23645 ) ) ( not ( = ?auto_23644 ?auto_23645 ) ) ( ON ?auto_23643 ?auto_23644 ) ( ON ?auto_23642 ?auto_23643 ) ( CLEAR ?auto_23640 ) ( ON ?auto_23641 ?auto_23642 ) ( CLEAR ?auto_23641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23639 ?auto_23640 ?auto_23641 )
      ( MAKE-6PILE ?auto_23639 ?auto_23640 ?auto_23641 ?auto_23642 ?auto_23643 ?auto_23644 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23652 - BLOCK
      ?auto_23653 - BLOCK
      ?auto_23654 - BLOCK
      ?auto_23655 - BLOCK
      ?auto_23656 - BLOCK
      ?auto_23657 - BLOCK
    )
    :vars
    (
      ?auto_23658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23657 ?auto_23658 ) ( ON-TABLE ?auto_23652 ) ( not ( = ?auto_23652 ?auto_23653 ) ) ( not ( = ?auto_23652 ?auto_23654 ) ) ( not ( = ?auto_23652 ?auto_23655 ) ) ( not ( = ?auto_23652 ?auto_23656 ) ) ( not ( = ?auto_23652 ?auto_23657 ) ) ( not ( = ?auto_23652 ?auto_23658 ) ) ( not ( = ?auto_23653 ?auto_23654 ) ) ( not ( = ?auto_23653 ?auto_23655 ) ) ( not ( = ?auto_23653 ?auto_23656 ) ) ( not ( = ?auto_23653 ?auto_23657 ) ) ( not ( = ?auto_23653 ?auto_23658 ) ) ( not ( = ?auto_23654 ?auto_23655 ) ) ( not ( = ?auto_23654 ?auto_23656 ) ) ( not ( = ?auto_23654 ?auto_23657 ) ) ( not ( = ?auto_23654 ?auto_23658 ) ) ( not ( = ?auto_23655 ?auto_23656 ) ) ( not ( = ?auto_23655 ?auto_23657 ) ) ( not ( = ?auto_23655 ?auto_23658 ) ) ( not ( = ?auto_23656 ?auto_23657 ) ) ( not ( = ?auto_23656 ?auto_23658 ) ) ( not ( = ?auto_23657 ?auto_23658 ) ) ( ON ?auto_23656 ?auto_23657 ) ( ON ?auto_23655 ?auto_23656 ) ( ON ?auto_23654 ?auto_23655 ) ( CLEAR ?auto_23652 ) ( ON ?auto_23653 ?auto_23654 ) ( CLEAR ?auto_23653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23652 ?auto_23653 )
      ( MAKE-6PILE ?auto_23652 ?auto_23653 ?auto_23654 ?auto_23655 ?auto_23656 ?auto_23657 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23665 - BLOCK
      ?auto_23666 - BLOCK
      ?auto_23667 - BLOCK
      ?auto_23668 - BLOCK
      ?auto_23669 - BLOCK
      ?auto_23670 - BLOCK
    )
    :vars
    (
      ?auto_23671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23670 ?auto_23671 ) ( ON-TABLE ?auto_23665 ) ( not ( = ?auto_23665 ?auto_23666 ) ) ( not ( = ?auto_23665 ?auto_23667 ) ) ( not ( = ?auto_23665 ?auto_23668 ) ) ( not ( = ?auto_23665 ?auto_23669 ) ) ( not ( = ?auto_23665 ?auto_23670 ) ) ( not ( = ?auto_23665 ?auto_23671 ) ) ( not ( = ?auto_23666 ?auto_23667 ) ) ( not ( = ?auto_23666 ?auto_23668 ) ) ( not ( = ?auto_23666 ?auto_23669 ) ) ( not ( = ?auto_23666 ?auto_23670 ) ) ( not ( = ?auto_23666 ?auto_23671 ) ) ( not ( = ?auto_23667 ?auto_23668 ) ) ( not ( = ?auto_23667 ?auto_23669 ) ) ( not ( = ?auto_23667 ?auto_23670 ) ) ( not ( = ?auto_23667 ?auto_23671 ) ) ( not ( = ?auto_23668 ?auto_23669 ) ) ( not ( = ?auto_23668 ?auto_23670 ) ) ( not ( = ?auto_23668 ?auto_23671 ) ) ( not ( = ?auto_23669 ?auto_23670 ) ) ( not ( = ?auto_23669 ?auto_23671 ) ) ( not ( = ?auto_23670 ?auto_23671 ) ) ( ON ?auto_23669 ?auto_23670 ) ( ON ?auto_23668 ?auto_23669 ) ( ON ?auto_23667 ?auto_23668 ) ( CLEAR ?auto_23665 ) ( ON ?auto_23666 ?auto_23667 ) ( CLEAR ?auto_23666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23665 ?auto_23666 )
      ( MAKE-6PILE ?auto_23665 ?auto_23666 ?auto_23667 ?auto_23668 ?auto_23669 ?auto_23670 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23678 - BLOCK
      ?auto_23679 - BLOCK
      ?auto_23680 - BLOCK
      ?auto_23681 - BLOCK
      ?auto_23682 - BLOCK
      ?auto_23683 - BLOCK
    )
    :vars
    (
      ?auto_23684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23683 ?auto_23684 ) ( not ( = ?auto_23678 ?auto_23679 ) ) ( not ( = ?auto_23678 ?auto_23680 ) ) ( not ( = ?auto_23678 ?auto_23681 ) ) ( not ( = ?auto_23678 ?auto_23682 ) ) ( not ( = ?auto_23678 ?auto_23683 ) ) ( not ( = ?auto_23678 ?auto_23684 ) ) ( not ( = ?auto_23679 ?auto_23680 ) ) ( not ( = ?auto_23679 ?auto_23681 ) ) ( not ( = ?auto_23679 ?auto_23682 ) ) ( not ( = ?auto_23679 ?auto_23683 ) ) ( not ( = ?auto_23679 ?auto_23684 ) ) ( not ( = ?auto_23680 ?auto_23681 ) ) ( not ( = ?auto_23680 ?auto_23682 ) ) ( not ( = ?auto_23680 ?auto_23683 ) ) ( not ( = ?auto_23680 ?auto_23684 ) ) ( not ( = ?auto_23681 ?auto_23682 ) ) ( not ( = ?auto_23681 ?auto_23683 ) ) ( not ( = ?auto_23681 ?auto_23684 ) ) ( not ( = ?auto_23682 ?auto_23683 ) ) ( not ( = ?auto_23682 ?auto_23684 ) ) ( not ( = ?auto_23683 ?auto_23684 ) ) ( ON ?auto_23682 ?auto_23683 ) ( ON ?auto_23681 ?auto_23682 ) ( ON ?auto_23680 ?auto_23681 ) ( ON ?auto_23679 ?auto_23680 ) ( ON ?auto_23678 ?auto_23679 ) ( CLEAR ?auto_23678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23678 )
      ( MAKE-6PILE ?auto_23678 ?auto_23679 ?auto_23680 ?auto_23681 ?auto_23682 ?auto_23683 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23691 - BLOCK
      ?auto_23692 - BLOCK
      ?auto_23693 - BLOCK
      ?auto_23694 - BLOCK
      ?auto_23695 - BLOCK
      ?auto_23696 - BLOCK
    )
    :vars
    (
      ?auto_23697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23696 ?auto_23697 ) ( not ( = ?auto_23691 ?auto_23692 ) ) ( not ( = ?auto_23691 ?auto_23693 ) ) ( not ( = ?auto_23691 ?auto_23694 ) ) ( not ( = ?auto_23691 ?auto_23695 ) ) ( not ( = ?auto_23691 ?auto_23696 ) ) ( not ( = ?auto_23691 ?auto_23697 ) ) ( not ( = ?auto_23692 ?auto_23693 ) ) ( not ( = ?auto_23692 ?auto_23694 ) ) ( not ( = ?auto_23692 ?auto_23695 ) ) ( not ( = ?auto_23692 ?auto_23696 ) ) ( not ( = ?auto_23692 ?auto_23697 ) ) ( not ( = ?auto_23693 ?auto_23694 ) ) ( not ( = ?auto_23693 ?auto_23695 ) ) ( not ( = ?auto_23693 ?auto_23696 ) ) ( not ( = ?auto_23693 ?auto_23697 ) ) ( not ( = ?auto_23694 ?auto_23695 ) ) ( not ( = ?auto_23694 ?auto_23696 ) ) ( not ( = ?auto_23694 ?auto_23697 ) ) ( not ( = ?auto_23695 ?auto_23696 ) ) ( not ( = ?auto_23695 ?auto_23697 ) ) ( not ( = ?auto_23696 ?auto_23697 ) ) ( ON ?auto_23695 ?auto_23696 ) ( ON ?auto_23694 ?auto_23695 ) ( ON ?auto_23693 ?auto_23694 ) ( ON ?auto_23692 ?auto_23693 ) ( ON ?auto_23691 ?auto_23692 ) ( CLEAR ?auto_23691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23691 )
      ( MAKE-6PILE ?auto_23691 ?auto_23692 ?auto_23693 ?auto_23694 ?auto_23695 ?auto_23696 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23705 - BLOCK
      ?auto_23706 - BLOCK
      ?auto_23707 - BLOCK
      ?auto_23708 - BLOCK
      ?auto_23709 - BLOCK
      ?auto_23710 - BLOCK
      ?auto_23711 - BLOCK
    )
    :vars
    (
      ?auto_23712 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23710 ) ( ON ?auto_23711 ?auto_23712 ) ( CLEAR ?auto_23711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23705 ) ( ON ?auto_23706 ?auto_23705 ) ( ON ?auto_23707 ?auto_23706 ) ( ON ?auto_23708 ?auto_23707 ) ( ON ?auto_23709 ?auto_23708 ) ( ON ?auto_23710 ?auto_23709 ) ( not ( = ?auto_23705 ?auto_23706 ) ) ( not ( = ?auto_23705 ?auto_23707 ) ) ( not ( = ?auto_23705 ?auto_23708 ) ) ( not ( = ?auto_23705 ?auto_23709 ) ) ( not ( = ?auto_23705 ?auto_23710 ) ) ( not ( = ?auto_23705 ?auto_23711 ) ) ( not ( = ?auto_23705 ?auto_23712 ) ) ( not ( = ?auto_23706 ?auto_23707 ) ) ( not ( = ?auto_23706 ?auto_23708 ) ) ( not ( = ?auto_23706 ?auto_23709 ) ) ( not ( = ?auto_23706 ?auto_23710 ) ) ( not ( = ?auto_23706 ?auto_23711 ) ) ( not ( = ?auto_23706 ?auto_23712 ) ) ( not ( = ?auto_23707 ?auto_23708 ) ) ( not ( = ?auto_23707 ?auto_23709 ) ) ( not ( = ?auto_23707 ?auto_23710 ) ) ( not ( = ?auto_23707 ?auto_23711 ) ) ( not ( = ?auto_23707 ?auto_23712 ) ) ( not ( = ?auto_23708 ?auto_23709 ) ) ( not ( = ?auto_23708 ?auto_23710 ) ) ( not ( = ?auto_23708 ?auto_23711 ) ) ( not ( = ?auto_23708 ?auto_23712 ) ) ( not ( = ?auto_23709 ?auto_23710 ) ) ( not ( = ?auto_23709 ?auto_23711 ) ) ( not ( = ?auto_23709 ?auto_23712 ) ) ( not ( = ?auto_23710 ?auto_23711 ) ) ( not ( = ?auto_23710 ?auto_23712 ) ) ( not ( = ?auto_23711 ?auto_23712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23711 ?auto_23712 )
      ( !STACK ?auto_23711 ?auto_23710 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23720 - BLOCK
      ?auto_23721 - BLOCK
      ?auto_23722 - BLOCK
      ?auto_23723 - BLOCK
      ?auto_23724 - BLOCK
      ?auto_23725 - BLOCK
      ?auto_23726 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23725 ) ( ON-TABLE ?auto_23726 ) ( CLEAR ?auto_23726 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23720 ) ( ON ?auto_23721 ?auto_23720 ) ( ON ?auto_23722 ?auto_23721 ) ( ON ?auto_23723 ?auto_23722 ) ( ON ?auto_23724 ?auto_23723 ) ( ON ?auto_23725 ?auto_23724 ) ( not ( = ?auto_23720 ?auto_23721 ) ) ( not ( = ?auto_23720 ?auto_23722 ) ) ( not ( = ?auto_23720 ?auto_23723 ) ) ( not ( = ?auto_23720 ?auto_23724 ) ) ( not ( = ?auto_23720 ?auto_23725 ) ) ( not ( = ?auto_23720 ?auto_23726 ) ) ( not ( = ?auto_23721 ?auto_23722 ) ) ( not ( = ?auto_23721 ?auto_23723 ) ) ( not ( = ?auto_23721 ?auto_23724 ) ) ( not ( = ?auto_23721 ?auto_23725 ) ) ( not ( = ?auto_23721 ?auto_23726 ) ) ( not ( = ?auto_23722 ?auto_23723 ) ) ( not ( = ?auto_23722 ?auto_23724 ) ) ( not ( = ?auto_23722 ?auto_23725 ) ) ( not ( = ?auto_23722 ?auto_23726 ) ) ( not ( = ?auto_23723 ?auto_23724 ) ) ( not ( = ?auto_23723 ?auto_23725 ) ) ( not ( = ?auto_23723 ?auto_23726 ) ) ( not ( = ?auto_23724 ?auto_23725 ) ) ( not ( = ?auto_23724 ?auto_23726 ) ) ( not ( = ?auto_23725 ?auto_23726 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_23726 )
      ( !STACK ?auto_23726 ?auto_23725 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23734 - BLOCK
      ?auto_23735 - BLOCK
      ?auto_23736 - BLOCK
      ?auto_23737 - BLOCK
      ?auto_23738 - BLOCK
      ?auto_23739 - BLOCK
      ?auto_23740 - BLOCK
    )
    :vars
    (
      ?auto_23741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23740 ?auto_23741 ) ( ON-TABLE ?auto_23734 ) ( ON ?auto_23735 ?auto_23734 ) ( ON ?auto_23736 ?auto_23735 ) ( ON ?auto_23737 ?auto_23736 ) ( ON ?auto_23738 ?auto_23737 ) ( not ( = ?auto_23734 ?auto_23735 ) ) ( not ( = ?auto_23734 ?auto_23736 ) ) ( not ( = ?auto_23734 ?auto_23737 ) ) ( not ( = ?auto_23734 ?auto_23738 ) ) ( not ( = ?auto_23734 ?auto_23739 ) ) ( not ( = ?auto_23734 ?auto_23740 ) ) ( not ( = ?auto_23734 ?auto_23741 ) ) ( not ( = ?auto_23735 ?auto_23736 ) ) ( not ( = ?auto_23735 ?auto_23737 ) ) ( not ( = ?auto_23735 ?auto_23738 ) ) ( not ( = ?auto_23735 ?auto_23739 ) ) ( not ( = ?auto_23735 ?auto_23740 ) ) ( not ( = ?auto_23735 ?auto_23741 ) ) ( not ( = ?auto_23736 ?auto_23737 ) ) ( not ( = ?auto_23736 ?auto_23738 ) ) ( not ( = ?auto_23736 ?auto_23739 ) ) ( not ( = ?auto_23736 ?auto_23740 ) ) ( not ( = ?auto_23736 ?auto_23741 ) ) ( not ( = ?auto_23737 ?auto_23738 ) ) ( not ( = ?auto_23737 ?auto_23739 ) ) ( not ( = ?auto_23737 ?auto_23740 ) ) ( not ( = ?auto_23737 ?auto_23741 ) ) ( not ( = ?auto_23738 ?auto_23739 ) ) ( not ( = ?auto_23738 ?auto_23740 ) ) ( not ( = ?auto_23738 ?auto_23741 ) ) ( not ( = ?auto_23739 ?auto_23740 ) ) ( not ( = ?auto_23739 ?auto_23741 ) ) ( not ( = ?auto_23740 ?auto_23741 ) ) ( CLEAR ?auto_23738 ) ( ON ?auto_23739 ?auto_23740 ) ( CLEAR ?auto_23739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_23734 ?auto_23735 ?auto_23736 ?auto_23737 ?auto_23738 ?auto_23739 )
      ( MAKE-7PILE ?auto_23734 ?auto_23735 ?auto_23736 ?auto_23737 ?auto_23738 ?auto_23739 ?auto_23740 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23749 - BLOCK
      ?auto_23750 - BLOCK
      ?auto_23751 - BLOCK
      ?auto_23752 - BLOCK
      ?auto_23753 - BLOCK
      ?auto_23754 - BLOCK
      ?auto_23755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23755 ) ( ON-TABLE ?auto_23749 ) ( ON ?auto_23750 ?auto_23749 ) ( ON ?auto_23751 ?auto_23750 ) ( ON ?auto_23752 ?auto_23751 ) ( ON ?auto_23753 ?auto_23752 ) ( not ( = ?auto_23749 ?auto_23750 ) ) ( not ( = ?auto_23749 ?auto_23751 ) ) ( not ( = ?auto_23749 ?auto_23752 ) ) ( not ( = ?auto_23749 ?auto_23753 ) ) ( not ( = ?auto_23749 ?auto_23754 ) ) ( not ( = ?auto_23749 ?auto_23755 ) ) ( not ( = ?auto_23750 ?auto_23751 ) ) ( not ( = ?auto_23750 ?auto_23752 ) ) ( not ( = ?auto_23750 ?auto_23753 ) ) ( not ( = ?auto_23750 ?auto_23754 ) ) ( not ( = ?auto_23750 ?auto_23755 ) ) ( not ( = ?auto_23751 ?auto_23752 ) ) ( not ( = ?auto_23751 ?auto_23753 ) ) ( not ( = ?auto_23751 ?auto_23754 ) ) ( not ( = ?auto_23751 ?auto_23755 ) ) ( not ( = ?auto_23752 ?auto_23753 ) ) ( not ( = ?auto_23752 ?auto_23754 ) ) ( not ( = ?auto_23752 ?auto_23755 ) ) ( not ( = ?auto_23753 ?auto_23754 ) ) ( not ( = ?auto_23753 ?auto_23755 ) ) ( not ( = ?auto_23754 ?auto_23755 ) ) ( CLEAR ?auto_23753 ) ( ON ?auto_23754 ?auto_23755 ) ( CLEAR ?auto_23754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_23749 ?auto_23750 ?auto_23751 ?auto_23752 ?auto_23753 ?auto_23754 )
      ( MAKE-7PILE ?auto_23749 ?auto_23750 ?auto_23751 ?auto_23752 ?auto_23753 ?auto_23754 ?auto_23755 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23763 - BLOCK
      ?auto_23764 - BLOCK
      ?auto_23765 - BLOCK
      ?auto_23766 - BLOCK
      ?auto_23767 - BLOCK
      ?auto_23768 - BLOCK
      ?auto_23769 - BLOCK
    )
    :vars
    (
      ?auto_23770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23769 ?auto_23770 ) ( ON-TABLE ?auto_23763 ) ( ON ?auto_23764 ?auto_23763 ) ( ON ?auto_23765 ?auto_23764 ) ( ON ?auto_23766 ?auto_23765 ) ( not ( = ?auto_23763 ?auto_23764 ) ) ( not ( = ?auto_23763 ?auto_23765 ) ) ( not ( = ?auto_23763 ?auto_23766 ) ) ( not ( = ?auto_23763 ?auto_23767 ) ) ( not ( = ?auto_23763 ?auto_23768 ) ) ( not ( = ?auto_23763 ?auto_23769 ) ) ( not ( = ?auto_23763 ?auto_23770 ) ) ( not ( = ?auto_23764 ?auto_23765 ) ) ( not ( = ?auto_23764 ?auto_23766 ) ) ( not ( = ?auto_23764 ?auto_23767 ) ) ( not ( = ?auto_23764 ?auto_23768 ) ) ( not ( = ?auto_23764 ?auto_23769 ) ) ( not ( = ?auto_23764 ?auto_23770 ) ) ( not ( = ?auto_23765 ?auto_23766 ) ) ( not ( = ?auto_23765 ?auto_23767 ) ) ( not ( = ?auto_23765 ?auto_23768 ) ) ( not ( = ?auto_23765 ?auto_23769 ) ) ( not ( = ?auto_23765 ?auto_23770 ) ) ( not ( = ?auto_23766 ?auto_23767 ) ) ( not ( = ?auto_23766 ?auto_23768 ) ) ( not ( = ?auto_23766 ?auto_23769 ) ) ( not ( = ?auto_23766 ?auto_23770 ) ) ( not ( = ?auto_23767 ?auto_23768 ) ) ( not ( = ?auto_23767 ?auto_23769 ) ) ( not ( = ?auto_23767 ?auto_23770 ) ) ( not ( = ?auto_23768 ?auto_23769 ) ) ( not ( = ?auto_23768 ?auto_23770 ) ) ( not ( = ?auto_23769 ?auto_23770 ) ) ( ON ?auto_23768 ?auto_23769 ) ( CLEAR ?auto_23766 ) ( ON ?auto_23767 ?auto_23768 ) ( CLEAR ?auto_23767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23763 ?auto_23764 ?auto_23765 ?auto_23766 ?auto_23767 )
      ( MAKE-7PILE ?auto_23763 ?auto_23764 ?auto_23765 ?auto_23766 ?auto_23767 ?auto_23768 ?auto_23769 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23778 - BLOCK
      ?auto_23779 - BLOCK
      ?auto_23780 - BLOCK
      ?auto_23781 - BLOCK
      ?auto_23782 - BLOCK
      ?auto_23783 - BLOCK
      ?auto_23784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23784 ) ( ON-TABLE ?auto_23778 ) ( ON ?auto_23779 ?auto_23778 ) ( ON ?auto_23780 ?auto_23779 ) ( ON ?auto_23781 ?auto_23780 ) ( not ( = ?auto_23778 ?auto_23779 ) ) ( not ( = ?auto_23778 ?auto_23780 ) ) ( not ( = ?auto_23778 ?auto_23781 ) ) ( not ( = ?auto_23778 ?auto_23782 ) ) ( not ( = ?auto_23778 ?auto_23783 ) ) ( not ( = ?auto_23778 ?auto_23784 ) ) ( not ( = ?auto_23779 ?auto_23780 ) ) ( not ( = ?auto_23779 ?auto_23781 ) ) ( not ( = ?auto_23779 ?auto_23782 ) ) ( not ( = ?auto_23779 ?auto_23783 ) ) ( not ( = ?auto_23779 ?auto_23784 ) ) ( not ( = ?auto_23780 ?auto_23781 ) ) ( not ( = ?auto_23780 ?auto_23782 ) ) ( not ( = ?auto_23780 ?auto_23783 ) ) ( not ( = ?auto_23780 ?auto_23784 ) ) ( not ( = ?auto_23781 ?auto_23782 ) ) ( not ( = ?auto_23781 ?auto_23783 ) ) ( not ( = ?auto_23781 ?auto_23784 ) ) ( not ( = ?auto_23782 ?auto_23783 ) ) ( not ( = ?auto_23782 ?auto_23784 ) ) ( not ( = ?auto_23783 ?auto_23784 ) ) ( ON ?auto_23783 ?auto_23784 ) ( CLEAR ?auto_23781 ) ( ON ?auto_23782 ?auto_23783 ) ( CLEAR ?auto_23782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23778 ?auto_23779 ?auto_23780 ?auto_23781 ?auto_23782 )
      ( MAKE-7PILE ?auto_23778 ?auto_23779 ?auto_23780 ?auto_23781 ?auto_23782 ?auto_23783 ?auto_23784 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23792 - BLOCK
      ?auto_23793 - BLOCK
      ?auto_23794 - BLOCK
      ?auto_23795 - BLOCK
      ?auto_23796 - BLOCK
      ?auto_23797 - BLOCK
      ?auto_23798 - BLOCK
    )
    :vars
    (
      ?auto_23799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23798 ?auto_23799 ) ( ON-TABLE ?auto_23792 ) ( ON ?auto_23793 ?auto_23792 ) ( ON ?auto_23794 ?auto_23793 ) ( not ( = ?auto_23792 ?auto_23793 ) ) ( not ( = ?auto_23792 ?auto_23794 ) ) ( not ( = ?auto_23792 ?auto_23795 ) ) ( not ( = ?auto_23792 ?auto_23796 ) ) ( not ( = ?auto_23792 ?auto_23797 ) ) ( not ( = ?auto_23792 ?auto_23798 ) ) ( not ( = ?auto_23792 ?auto_23799 ) ) ( not ( = ?auto_23793 ?auto_23794 ) ) ( not ( = ?auto_23793 ?auto_23795 ) ) ( not ( = ?auto_23793 ?auto_23796 ) ) ( not ( = ?auto_23793 ?auto_23797 ) ) ( not ( = ?auto_23793 ?auto_23798 ) ) ( not ( = ?auto_23793 ?auto_23799 ) ) ( not ( = ?auto_23794 ?auto_23795 ) ) ( not ( = ?auto_23794 ?auto_23796 ) ) ( not ( = ?auto_23794 ?auto_23797 ) ) ( not ( = ?auto_23794 ?auto_23798 ) ) ( not ( = ?auto_23794 ?auto_23799 ) ) ( not ( = ?auto_23795 ?auto_23796 ) ) ( not ( = ?auto_23795 ?auto_23797 ) ) ( not ( = ?auto_23795 ?auto_23798 ) ) ( not ( = ?auto_23795 ?auto_23799 ) ) ( not ( = ?auto_23796 ?auto_23797 ) ) ( not ( = ?auto_23796 ?auto_23798 ) ) ( not ( = ?auto_23796 ?auto_23799 ) ) ( not ( = ?auto_23797 ?auto_23798 ) ) ( not ( = ?auto_23797 ?auto_23799 ) ) ( not ( = ?auto_23798 ?auto_23799 ) ) ( ON ?auto_23797 ?auto_23798 ) ( ON ?auto_23796 ?auto_23797 ) ( CLEAR ?auto_23794 ) ( ON ?auto_23795 ?auto_23796 ) ( CLEAR ?auto_23795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23792 ?auto_23793 ?auto_23794 ?auto_23795 )
      ( MAKE-7PILE ?auto_23792 ?auto_23793 ?auto_23794 ?auto_23795 ?auto_23796 ?auto_23797 ?auto_23798 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23807 - BLOCK
      ?auto_23808 - BLOCK
      ?auto_23809 - BLOCK
      ?auto_23810 - BLOCK
      ?auto_23811 - BLOCK
      ?auto_23812 - BLOCK
      ?auto_23813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23813 ) ( ON-TABLE ?auto_23807 ) ( ON ?auto_23808 ?auto_23807 ) ( ON ?auto_23809 ?auto_23808 ) ( not ( = ?auto_23807 ?auto_23808 ) ) ( not ( = ?auto_23807 ?auto_23809 ) ) ( not ( = ?auto_23807 ?auto_23810 ) ) ( not ( = ?auto_23807 ?auto_23811 ) ) ( not ( = ?auto_23807 ?auto_23812 ) ) ( not ( = ?auto_23807 ?auto_23813 ) ) ( not ( = ?auto_23808 ?auto_23809 ) ) ( not ( = ?auto_23808 ?auto_23810 ) ) ( not ( = ?auto_23808 ?auto_23811 ) ) ( not ( = ?auto_23808 ?auto_23812 ) ) ( not ( = ?auto_23808 ?auto_23813 ) ) ( not ( = ?auto_23809 ?auto_23810 ) ) ( not ( = ?auto_23809 ?auto_23811 ) ) ( not ( = ?auto_23809 ?auto_23812 ) ) ( not ( = ?auto_23809 ?auto_23813 ) ) ( not ( = ?auto_23810 ?auto_23811 ) ) ( not ( = ?auto_23810 ?auto_23812 ) ) ( not ( = ?auto_23810 ?auto_23813 ) ) ( not ( = ?auto_23811 ?auto_23812 ) ) ( not ( = ?auto_23811 ?auto_23813 ) ) ( not ( = ?auto_23812 ?auto_23813 ) ) ( ON ?auto_23812 ?auto_23813 ) ( ON ?auto_23811 ?auto_23812 ) ( CLEAR ?auto_23809 ) ( ON ?auto_23810 ?auto_23811 ) ( CLEAR ?auto_23810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23807 ?auto_23808 ?auto_23809 ?auto_23810 )
      ( MAKE-7PILE ?auto_23807 ?auto_23808 ?auto_23809 ?auto_23810 ?auto_23811 ?auto_23812 ?auto_23813 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23821 - BLOCK
      ?auto_23822 - BLOCK
      ?auto_23823 - BLOCK
      ?auto_23824 - BLOCK
      ?auto_23825 - BLOCK
      ?auto_23826 - BLOCK
      ?auto_23827 - BLOCK
    )
    :vars
    (
      ?auto_23828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23827 ?auto_23828 ) ( ON-TABLE ?auto_23821 ) ( ON ?auto_23822 ?auto_23821 ) ( not ( = ?auto_23821 ?auto_23822 ) ) ( not ( = ?auto_23821 ?auto_23823 ) ) ( not ( = ?auto_23821 ?auto_23824 ) ) ( not ( = ?auto_23821 ?auto_23825 ) ) ( not ( = ?auto_23821 ?auto_23826 ) ) ( not ( = ?auto_23821 ?auto_23827 ) ) ( not ( = ?auto_23821 ?auto_23828 ) ) ( not ( = ?auto_23822 ?auto_23823 ) ) ( not ( = ?auto_23822 ?auto_23824 ) ) ( not ( = ?auto_23822 ?auto_23825 ) ) ( not ( = ?auto_23822 ?auto_23826 ) ) ( not ( = ?auto_23822 ?auto_23827 ) ) ( not ( = ?auto_23822 ?auto_23828 ) ) ( not ( = ?auto_23823 ?auto_23824 ) ) ( not ( = ?auto_23823 ?auto_23825 ) ) ( not ( = ?auto_23823 ?auto_23826 ) ) ( not ( = ?auto_23823 ?auto_23827 ) ) ( not ( = ?auto_23823 ?auto_23828 ) ) ( not ( = ?auto_23824 ?auto_23825 ) ) ( not ( = ?auto_23824 ?auto_23826 ) ) ( not ( = ?auto_23824 ?auto_23827 ) ) ( not ( = ?auto_23824 ?auto_23828 ) ) ( not ( = ?auto_23825 ?auto_23826 ) ) ( not ( = ?auto_23825 ?auto_23827 ) ) ( not ( = ?auto_23825 ?auto_23828 ) ) ( not ( = ?auto_23826 ?auto_23827 ) ) ( not ( = ?auto_23826 ?auto_23828 ) ) ( not ( = ?auto_23827 ?auto_23828 ) ) ( ON ?auto_23826 ?auto_23827 ) ( ON ?auto_23825 ?auto_23826 ) ( ON ?auto_23824 ?auto_23825 ) ( CLEAR ?auto_23822 ) ( ON ?auto_23823 ?auto_23824 ) ( CLEAR ?auto_23823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23821 ?auto_23822 ?auto_23823 )
      ( MAKE-7PILE ?auto_23821 ?auto_23822 ?auto_23823 ?auto_23824 ?auto_23825 ?auto_23826 ?auto_23827 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23836 - BLOCK
      ?auto_23837 - BLOCK
      ?auto_23838 - BLOCK
      ?auto_23839 - BLOCK
      ?auto_23840 - BLOCK
      ?auto_23841 - BLOCK
      ?auto_23842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23842 ) ( ON-TABLE ?auto_23836 ) ( ON ?auto_23837 ?auto_23836 ) ( not ( = ?auto_23836 ?auto_23837 ) ) ( not ( = ?auto_23836 ?auto_23838 ) ) ( not ( = ?auto_23836 ?auto_23839 ) ) ( not ( = ?auto_23836 ?auto_23840 ) ) ( not ( = ?auto_23836 ?auto_23841 ) ) ( not ( = ?auto_23836 ?auto_23842 ) ) ( not ( = ?auto_23837 ?auto_23838 ) ) ( not ( = ?auto_23837 ?auto_23839 ) ) ( not ( = ?auto_23837 ?auto_23840 ) ) ( not ( = ?auto_23837 ?auto_23841 ) ) ( not ( = ?auto_23837 ?auto_23842 ) ) ( not ( = ?auto_23838 ?auto_23839 ) ) ( not ( = ?auto_23838 ?auto_23840 ) ) ( not ( = ?auto_23838 ?auto_23841 ) ) ( not ( = ?auto_23838 ?auto_23842 ) ) ( not ( = ?auto_23839 ?auto_23840 ) ) ( not ( = ?auto_23839 ?auto_23841 ) ) ( not ( = ?auto_23839 ?auto_23842 ) ) ( not ( = ?auto_23840 ?auto_23841 ) ) ( not ( = ?auto_23840 ?auto_23842 ) ) ( not ( = ?auto_23841 ?auto_23842 ) ) ( ON ?auto_23841 ?auto_23842 ) ( ON ?auto_23840 ?auto_23841 ) ( ON ?auto_23839 ?auto_23840 ) ( CLEAR ?auto_23837 ) ( ON ?auto_23838 ?auto_23839 ) ( CLEAR ?auto_23838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23836 ?auto_23837 ?auto_23838 )
      ( MAKE-7PILE ?auto_23836 ?auto_23837 ?auto_23838 ?auto_23839 ?auto_23840 ?auto_23841 ?auto_23842 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23850 - BLOCK
      ?auto_23851 - BLOCK
      ?auto_23852 - BLOCK
      ?auto_23853 - BLOCK
      ?auto_23854 - BLOCK
      ?auto_23855 - BLOCK
      ?auto_23856 - BLOCK
    )
    :vars
    (
      ?auto_23857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23856 ?auto_23857 ) ( ON-TABLE ?auto_23850 ) ( not ( = ?auto_23850 ?auto_23851 ) ) ( not ( = ?auto_23850 ?auto_23852 ) ) ( not ( = ?auto_23850 ?auto_23853 ) ) ( not ( = ?auto_23850 ?auto_23854 ) ) ( not ( = ?auto_23850 ?auto_23855 ) ) ( not ( = ?auto_23850 ?auto_23856 ) ) ( not ( = ?auto_23850 ?auto_23857 ) ) ( not ( = ?auto_23851 ?auto_23852 ) ) ( not ( = ?auto_23851 ?auto_23853 ) ) ( not ( = ?auto_23851 ?auto_23854 ) ) ( not ( = ?auto_23851 ?auto_23855 ) ) ( not ( = ?auto_23851 ?auto_23856 ) ) ( not ( = ?auto_23851 ?auto_23857 ) ) ( not ( = ?auto_23852 ?auto_23853 ) ) ( not ( = ?auto_23852 ?auto_23854 ) ) ( not ( = ?auto_23852 ?auto_23855 ) ) ( not ( = ?auto_23852 ?auto_23856 ) ) ( not ( = ?auto_23852 ?auto_23857 ) ) ( not ( = ?auto_23853 ?auto_23854 ) ) ( not ( = ?auto_23853 ?auto_23855 ) ) ( not ( = ?auto_23853 ?auto_23856 ) ) ( not ( = ?auto_23853 ?auto_23857 ) ) ( not ( = ?auto_23854 ?auto_23855 ) ) ( not ( = ?auto_23854 ?auto_23856 ) ) ( not ( = ?auto_23854 ?auto_23857 ) ) ( not ( = ?auto_23855 ?auto_23856 ) ) ( not ( = ?auto_23855 ?auto_23857 ) ) ( not ( = ?auto_23856 ?auto_23857 ) ) ( ON ?auto_23855 ?auto_23856 ) ( ON ?auto_23854 ?auto_23855 ) ( ON ?auto_23853 ?auto_23854 ) ( ON ?auto_23852 ?auto_23853 ) ( CLEAR ?auto_23850 ) ( ON ?auto_23851 ?auto_23852 ) ( CLEAR ?auto_23851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23850 ?auto_23851 )
      ( MAKE-7PILE ?auto_23850 ?auto_23851 ?auto_23852 ?auto_23853 ?auto_23854 ?auto_23855 ?auto_23856 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23865 - BLOCK
      ?auto_23866 - BLOCK
      ?auto_23867 - BLOCK
      ?auto_23868 - BLOCK
      ?auto_23869 - BLOCK
      ?auto_23870 - BLOCK
      ?auto_23871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23871 ) ( ON-TABLE ?auto_23865 ) ( not ( = ?auto_23865 ?auto_23866 ) ) ( not ( = ?auto_23865 ?auto_23867 ) ) ( not ( = ?auto_23865 ?auto_23868 ) ) ( not ( = ?auto_23865 ?auto_23869 ) ) ( not ( = ?auto_23865 ?auto_23870 ) ) ( not ( = ?auto_23865 ?auto_23871 ) ) ( not ( = ?auto_23866 ?auto_23867 ) ) ( not ( = ?auto_23866 ?auto_23868 ) ) ( not ( = ?auto_23866 ?auto_23869 ) ) ( not ( = ?auto_23866 ?auto_23870 ) ) ( not ( = ?auto_23866 ?auto_23871 ) ) ( not ( = ?auto_23867 ?auto_23868 ) ) ( not ( = ?auto_23867 ?auto_23869 ) ) ( not ( = ?auto_23867 ?auto_23870 ) ) ( not ( = ?auto_23867 ?auto_23871 ) ) ( not ( = ?auto_23868 ?auto_23869 ) ) ( not ( = ?auto_23868 ?auto_23870 ) ) ( not ( = ?auto_23868 ?auto_23871 ) ) ( not ( = ?auto_23869 ?auto_23870 ) ) ( not ( = ?auto_23869 ?auto_23871 ) ) ( not ( = ?auto_23870 ?auto_23871 ) ) ( ON ?auto_23870 ?auto_23871 ) ( ON ?auto_23869 ?auto_23870 ) ( ON ?auto_23868 ?auto_23869 ) ( ON ?auto_23867 ?auto_23868 ) ( CLEAR ?auto_23865 ) ( ON ?auto_23866 ?auto_23867 ) ( CLEAR ?auto_23866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23865 ?auto_23866 )
      ( MAKE-7PILE ?auto_23865 ?auto_23866 ?auto_23867 ?auto_23868 ?auto_23869 ?auto_23870 ?auto_23871 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23879 - BLOCK
      ?auto_23880 - BLOCK
      ?auto_23881 - BLOCK
      ?auto_23882 - BLOCK
      ?auto_23883 - BLOCK
      ?auto_23884 - BLOCK
      ?auto_23885 - BLOCK
    )
    :vars
    (
      ?auto_23886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23885 ?auto_23886 ) ( not ( = ?auto_23879 ?auto_23880 ) ) ( not ( = ?auto_23879 ?auto_23881 ) ) ( not ( = ?auto_23879 ?auto_23882 ) ) ( not ( = ?auto_23879 ?auto_23883 ) ) ( not ( = ?auto_23879 ?auto_23884 ) ) ( not ( = ?auto_23879 ?auto_23885 ) ) ( not ( = ?auto_23879 ?auto_23886 ) ) ( not ( = ?auto_23880 ?auto_23881 ) ) ( not ( = ?auto_23880 ?auto_23882 ) ) ( not ( = ?auto_23880 ?auto_23883 ) ) ( not ( = ?auto_23880 ?auto_23884 ) ) ( not ( = ?auto_23880 ?auto_23885 ) ) ( not ( = ?auto_23880 ?auto_23886 ) ) ( not ( = ?auto_23881 ?auto_23882 ) ) ( not ( = ?auto_23881 ?auto_23883 ) ) ( not ( = ?auto_23881 ?auto_23884 ) ) ( not ( = ?auto_23881 ?auto_23885 ) ) ( not ( = ?auto_23881 ?auto_23886 ) ) ( not ( = ?auto_23882 ?auto_23883 ) ) ( not ( = ?auto_23882 ?auto_23884 ) ) ( not ( = ?auto_23882 ?auto_23885 ) ) ( not ( = ?auto_23882 ?auto_23886 ) ) ( not ( = ?auto_23883 ?auto_23884 ) ) ( not ( = ?auto_23883 ?auto_23885 ) ) ( not ( = ?auto_23883 ?auto_23886 ) ) ( not ( = ?auto_23884 ?auto_23885 ) ) ( not ( = ?auto_23884 ?auto_23886 ) ) ( not ( = ?auto_23885 ?auto_23886 ) ) ( ON ?auto_23884 ?auto_23885 ) ( ON ?auto_23883 ?auto_23884 ) ( ON ?auto_23882 ?auto_23883 ) ( ON ?auto_23881 ?auto_23882 ) ( ON ?auto_23880 ?auto_23881 ) ( ON ?auto_23879 ?auto_23880 ) ( CLEAR ?auto_23879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23879 )
      ( MAKE-7PILE ?auto_23879 ?auto_23880 ?auto_23881 ?auto_23882 ?auto_23883 ?auto_23884 ?auto_23885 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23894 - BLOCK
      ?auto_23895 - BLOCK
      ?auto_23896 - BLOCK
      ?auto_23897 - BLOCK
      ?auto_23898 - BLOCK
      ?auto_23899 - BLOCK
      ?auto_23900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23900 ) ( not ( = ?auto_23894 ?auto_23895 ) ) ( not ( = ?auto_23894 ?auto_23896 ) ) ( not ( = ?auto_23894 ?auto_23897 ) ) ( not ( = ?auto_23894 ?auto_23898 ) ) ( not ( = ?auto_23894 ?auto_23899 ) ) ( not ( = ?auto_23894 ?auto_23900 ) ) ( not ( = ?auto_23895 ?auto_23896 ) ) ( not ( = ?auto_23895 ?auto_23897 ) ) ( not ( = ?auto_23895 ?auto_23898 ) ) ( not ( = ?auto_23895 ?auto_23899 ) ) ( not ( = ?auto_23895 ?auto_23900 ) ) ( not ( = ?auto_23896 ?auto_23897 ) ) ( not ( = ?auto_23896 ?auto_23898 ) ) ( not ( = ?auto_23896 ?auto_23899 ) ) ( not ( = ?auto_23896 ?auto_23900 ) ) ( not ( = ?auto_23897 ?auto_23898 ) ) ( not ( = ?auto_23897 ?auto_23899 ) ) ( not ( = ?auto_23897 ?auto_23900 ) ) ( not ( = ?auto_23898 ?auto_23899 ) ) ( not ( = ?auto_23898 ?auto_23900 ) ) ( not ( = ?auto_23899 ?auto_23900 ) ) ( ON ?auto_23899 ?auto_23900 ) ( ON ?auto_23898 ?auto_23899 ) ( ON ?auto_23897 ?auto_23898 ) ( ON ?auto_23896 ?auto_23897 ) ( ON ?auto_23895 ?auto_23896 ) ( ON ?auto_23894 ?auto_23895 ) ( CLEAR ?auto_23894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23894 )
      ( MAKE-7PILE ?auto_23894 ?auto_23895 ?auto_23896 ?auto_23897 ?auto_23898 ?auto_23899 ?auto_23900 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23908 - BLOCK
      ?auto_23909 - BLOCK
      ?auto_23910 - BLOCK
      ?auto_23911 - BLOCK
      ?auto_23912 - BLOCK
      ?auto_23913 - BLOCK
      ?auto_23914 - BLOCK
    )
    :vars
    (
      ?auto_23915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23908 ?auto_23909 ) ) ( not ( = ?auto_23908 ?auto_23910 ) ) ( not ( = ?auto_23908 ?auto_23911 ) ) ( not ( = ?auto_23908 ?auto_23912 ) ) ( not ( = ?auto_23908 ?auto_23913 ) ) ( not ( = ?auto_23908 ?auto_23914 ) ) ( not ( = ?auto_23909 ?auto_23910 ) ) ( not ( = ?auto_23909 ?auto_23911 ) ) ( not ( = ?auto_23909 ?auto_23912 ) ) ( not ( = ?auto_23909 ?auto_23913 ) ) ( not ( = ?auto_23909 ?auto_23914 ) ) ( not ( = ?auto_23910 ?auto_23911 ) ) ( not ( = ?auto_23910 ?auto_23912 ) ) ( not ( = ?auto_23910 ?auto_23913 ) ) ( not ( = ?auto_23910 ?auto_23914 ) ) ( not ( = ?auto_23911 ?auto_23912 ) ) ( not ( = ?auto_23911 ?auto_23913 ) ) ( not ( = ?auto_23911 ?auto_23914 ) ) ( not ( = ?auto_23912 ?auto_23913 ) ) ( not ( = ?auto_23912 ?auto_23914 ) ) ( not ( = ?auto_23913 ?auto_23914 ) ) ( ON ?auto_23908 ?auto_23915 ) ( not ( = ?auto_23914 ?auto_23915 ) ) ( not ( = ?auto_23913 ?auto_23915 ) ) ( not ( = ?auto_23912 ?auto_23915 ) ) ( not ( = ?auto_23911 ?auto_23915 ) ) ( not ( = ?auto_23910 ?auto_23915 ) ) ( not ( = ?auto_23909 ?auto_23915 ) ) ( not ( = ?auto_23908 ?auto_23915 ) ) ( ON ?auto_23909 ?auto_23908 ) ( ON ?auto_23910 ?auto_23909 ) ( ON ?auto_23911 ?auto_23910 ) ( ON ?auto_23912 ?auto_23911 ) ( ON ?auto_23913 ?auto_23912 ) ( ON ?auto_23914 ?auto_23913 ) ( CLEAR ?auto_23914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_23914 ?auto_23913 ?auto_23912 ?auto_23911 ?auto_23910 ?auto_23909 ?auto_23908 )
      ( MAKE-7PILE ?auto_23908 ?auto_23909 ?auto_23910 ?auto_23911 ?auto_23912 ?auto_23913 ?auto_23914 ) )
  )

)

