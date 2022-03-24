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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6373 - BLOCK
      ?auto_6374 - BLOCK
      ?auto_6375 - BLOCK
    )
    :vars
    (
      ?auto_6376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6376 ?auto_6375 ) ( CLEAR ?auto_6376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6373 ) ( ON ?auto_6374 ?auto_6373 ) ( ON ?auto_6375 ?auto_6374 ) ( not ( = ?auto_6373 ?auto_6374 ) ) ( not ( = ?auto_6373 ?auto_6375 ) ) ( not ( = ?auto_6373 ?auto_6376 ) ) ( not ( = ?auto_6374 ?auto_6375 ) ) ( not ( = ?auto_6374 ?auto_6376 ) ) ( not ( = ?auto_6375 ?auto_6376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6376 ?auto_6375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6378 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6378 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6379 - BLOCK
    )
    :vars
    (
      ?auto_6380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6379 ?auto_6380 ) ( CLEAR ?auto_6379 ) ( HAND-EMPTY ) ( not ( = ?auto_6379 ?auto_6380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6379 ?auto_6380 )
      ( MAKE-1PILE ?auto_6379 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6383 - BLOCK
      ?auto_6384 - BLOCK
    )
    :vars
    (
      ?auto_6385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6385 ?auto_6384 ) ( CLEAR ?auto_6385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6383 ) ( ON ?auto_6384 ?auto_6383 ) ( not ( = ?auto_6383 ?auto_6384 ) ) ( not ( = ?auto_6383 ?auto_6385 ) ) ( not ( = ?auto_6384 ?auto_6385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6385 ?auto_6384 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6386 - BLOCK
      ?auto_6387 - BLOCK
    )
    :vars
    (
      ?auto_6388 - BLOCK
      ?auto_6389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6388 ?auto_6387 ) ( CLEAR ?auto_6388 ) ( ON-TABLE ?auto_6386 ) ( ON ?auto_6387 ?auto_6386 ) ( not ( = ?auto_6386 ?auto_6387 ) ) ( not ( = ?auto_6386 ?auto_6388 ) ) ( not ( = ?auto_6387 ?auto_6388 ) ) ( HOLDING ?auto_6389 ) ( not ( = ?auto_6386 ?auto_6389 ) ) ( not ( = ?auto_6387 ?auto_6389 ) ) ( not ( = ?auto_6388 ?auto_6389 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6389 )
      ( MAKE-2PILE ?auto_6386 ?auto_6387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6390 - BLOCK
      ?auto_6391 - BLOCK
    )
    :vars
    (
      ?auto_6393 - BLOCK
      ?auto_6392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6393 ?auto_6391 ) ( ON-TABLE ?auto_6390 ) ( ON ?auto_6391 ?auto_6390 ) ( not ( = ?auto_6390 ?auto_6391 ) ) ( not ( = ?auto_6390 ?auto_6393 ) ) ( not ( = ?auto_6391 ?auto_6393 ) ) ( not ( = ?auto_6390 ?auto_6392 ) ) ( not ( = ?auto_6391 ?auto_6392 ) ) ( not ( = ?auto_6393 ?auto_6392 ) ) ( ON ?auto_6392 ?auto_6393 ) ( CLEAR ?auto_6392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6390 ?auto_6391 ?auto_6393 )
      ( MAKE-2PILE ?auto_6390 ?auto_6391 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6396 - BLOCK
      ?auto_6397 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6397 ) ( CLEAR ?auto_6396 ) ( ON-TABLE ?auto_6396 ) ( not ( = ?auto_6396 ?auto_6397 ) ) )
    :subtasks
    ( ( !STACK ?auto_6397 ?auto_6396 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6398 - BLOCK
      ?auto_6399 - BLOCK
    )
    :vars
    (
      ?auto_6400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6398 ) ( ON-TABLE ?auto_6398 ) ( not ( = ?auto_6398 ?auto_6399 ) ) ( ON ?auto_6399 ?auto_6400 ) ( CLEAR ?auto_6399 ) ( HAND-EMPTY ) ( not ( = ?auto_6398 ?auto_6400 ) ) ( not ( = ?auto_6399 ?auto_6400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6399 ?auto_6400 )
      ( MAKE-2PILE ?auto_6398 ?auto_6399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6401 - BLOCK
      ?auto_6402 - BLOCK
    )
    :vars
    (
      ?auto_6403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6401 ?auto_6402 ) ) ( ON ?auto_6402 ?auto_6403 ) ( CLEAR ?auto_6402 ) ( not ( = ?auto_6401 ?auto_6403 ) ) ( not ( = ?auto_6402 ?auto_6403 ) ) ( HOLDING ?auto_6401 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6401 )
      ( MAKE-2PILE ?auto_6401 ?auto_6402 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6404 - BLOCK
      ?auto_6405 - BLOCK
    )
    :vars
    (
      ?auto_6406 - BLOCK
      ?auto_6407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6404 ?auto_6405 ) ) ( ON ?auto_6405 ?auto_6406 ) ( not ( = ?auto_6404 ?auto_6406 ) ) ( not ( = ?auto_6405 ?auto_6406 ) ) ( ON ?auto_6404 ?auto_6405 ) ( CLEAR ?auto_6404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6407 ) ( ON ?auto_6406 ?auto_6407 ) ( not ( = ?auto_6407 ?auto_6406 ) ) ( not ( = ?auto_6407 ?auto_6405 ) ) ( not ( = ?auto_6407 ?auto_6404 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6407 ?auto_6406 ?auto_6405 )
      ( MAKE-2PILE ?auto_6404 ?auto_6405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6409 - BLOCK
    )
    :vars
    (
      ?auto_6410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6410 ?auto_6409 ) ( CLEAR ?auto_6410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6409 ) ( not ( = ?auto_6409 ?auto_6410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6410 ?auto_6409 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6411 - BLOCK
    )
    :vars
    (
      ?auto_6412 - BLOCK
      ?auto_6413 - BLOCK
      ?auto_6414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6412 ?auto_6411 ) ( CLEAR ?auto_6412 ) ( ON-TABLE ?auto_6411 ) ( not ( = ?auto_6411 ?auto_6412 ) ) ( HOLDING ?auto_6413 ) ( CLEAR ?auto_6414 ) ( not ( = ?auto_6411 ?auto_6413 ) ) ( not ( = ?auto_6411 ?auto_6414 ) ) ( not ( = ?auto_6412 ?auto_6413 ) ) ( not ( = ?auto_6412 ?auto_6414 ) ) ( not ( = ?auto_6413 ?auto_6414 ) ) )
    :subtasks
    ( ( !STACK ?auto_6413 ?auto_6414 )
      ( MAKE-1PILE ?auto_6411 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6415 - BLOCK
    )
    :vars
    (
      ?auto_6417 - BLOCK
      ?auto_6416 - BLOCK
      ?auto_6418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6417 ?auto_6415 ) ( ON-TABLE ?auto_6415 ) ( not ( = ?auto_6415 ?auto_6417 ) ) ( CLEAR ?auto_6416 ) ( not ( = ?auto_6415 ?auto_6418 ) ) ( not ( = ?auto_6415 ?auto_6416 ) ) ( not ( = ?auto_6417 ?auto_6418 ) ) ( not ( = ?auto_6417 ?auto_6416 ) ) ( not ( = ?auto_6418 ?auto_6416 ) ) ( ON ?auto_6418 ?auto_6417 ) ( CLEAR ?auto_6418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6415 ?auto_6417 )
      ( MAKE-1PILE ?auto_6415 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6419 - BLOCK
    )
    :vars
    (
      ?auto_6422 - BLOCK
      ?auto_6421 - BLOCK
      ?auto_6420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6422 ?auto_6419 ) ( ON-TABLE ?auto_6419 ) ( not ( = ?auto_6419 ?auto_6422 ) ) ( not ( = ?auto_6419 ?auto_6421 ) ) ( not ( = ?auto_6419 ?auto_6420 ) ) ( not ( = ?auto_6422 ?auto_6421 ) ) ( not ( = ?auto_6422 ?auto_6420 ) ) ( not ( = ?auto_6421 ?auto_6420 ) ) ( ON ?auto_6421 ?auto_6422 ) ( CLEAR ?auto_6421 ) ( HOLDING ?auto_6420 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6420 )
      ( MAKE-1PILE ?auto_6419 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6423 - BLOCK
    )
    :vars
    (
      ?auto_6425 - BLOCK
      ?auto_6424 - BLOCK
      ?auto_6426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6425 ?auto_6423 ) ( ON-TABLE ?auto_6423 ) ( not ( = ?auto_6423 ?auto_6425 ) ) ( not ( = ?auto_6423 ?auto_6424 ) ) ( not ( = ?auto_6423 ?auto_6426 ) ) ( not ( = ?auto_6425 ?auto_6424 ) ) ( not ( = ?auto_6425 ?auto_6426 ) ) ( not ( = ?auto_6424 ?auto_6426 ) ) ( ON ?auto_6424 ?auto_6425 ) ( ON ?auto_6426 ?auto_6424 ) ( CLEAR ?auto_6426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6423 ?auto_6425 ?auto_6424 )
      ( MAKE-1PILE ?auto_6423 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6430 - BLOCK
      ?auto_6431 - BLOCK
      ?auto_6432 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6432 ) ( CLEAR ?auto_6431 ) ( ON-TABLE ?auto_6430 ) ( ON ?auto_6431 ?auto_6430 ) ( not ( = ?auto_6430 ?auto_6431 ) ) ( not ( = ?auto_6430 ?auto_6432 ) ) ( not ( = ?auto_6431 ?auto_6432 ) ) )
    :subtasks
    ( ( !STACK ?auto_6432 ?auto_6431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6433 - BLOCK
      ?auto_6434 - BLOCK
      ?auto_6435 - BLOCK
    )
    :vars
    (
      ?auto_6436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6434 ) ( ON-TABLE ?auto_6433 ) ( ON ?auto_6434 ?auto_6433 ) ( not ( = ?auto_6433 ?auto_6434 ) ) ( not ( = ?auto_6433 ?auto_6435 ) ) ( not ( = ?auto_6434 ?auto_6435 ) ) ( ON ?auto_6435 ?auto_6436 ) ( CLEAR ?auto_6435 ) ( HAND-EMPTY ) ( not ( = ?auto_6433 ?auto_6436 ) ) ( not ( = ?auto_6434 ?auto_6436 ) ) ( not ( = ?auto_6435 ?auto_6436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6435 ?auto_6436 )
      ( MAKE-3PILE ?auto_6433 ?auto_6434 ?auto_6435 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6437 - BLOCK
      ?auto_6438 - BLOCK
      ?auto_6439 - BLOCK
    )
    :vars
    (
      ?auto_6440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6437 ) ( not ( = ?auto_6437 ?auto_6438 ) ) ( not ( = ?auto_6437 ?auto_6439 ) ) ( not ( = ?auto_6438 ?auto_6439 ) ) ( ON ?auto_6439 ?auto_6440 ) ( CLEAR ?auto_6439 ) ( not ( = ?auto_6437 ?auto_6440 ) ) ( not ( = ?auto_6438 ?auto_6440 ) ) ( not ( = ?auto_6439 ?auto_6440 ) ) ( HOLDING ?auto_6438 ) ( CLEAR ?auto_6437 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6437 ?auto_6438 )
      ( MAKE-3PILE ?auto_6437 ?auto_6438 ?auto_6439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6441 - BLOCK
      ?auto_6442 - BLOCK
      ?auto_6443 - BLOCK
    )
    :vars
    (
      ?auto_6444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6441 ) ( not ( = ?auto_6441 ?auto_6442 ) ) ( not ( = ?auto_6441 ?auto_6443 ) ) ( not ( = ?auto_6442 ?auto_6443 ) ) ( ON ?auto_6443 ?auto_6444 ) ( not ( = ?auto_6441 ?auto_6444 ) ) ( not ( = ?auto_6442 ?auto_6444 ) ) ( not ( = ?auto_6443 ?auto_6444 ) ) ( CLEAR ?auto_6441 ) ( ON ?auto_6442 ?auto_6443 ) ( CLEAR ?auto_6442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6444 ?auto_6443 )
      ( MAKE-3PILE ?auto_6441 ?auto_6442 ?auto_6443 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6445 - BLOCK
      ?auto_6446 - BLOCK
      ?auto_6447 - BLOCK
    )
    :vars
    (
      ?auto_6448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6445 ?auto_6446 ) ) ( not ( = ?auto_6445 ?auto_6447 ) ) ( not ( = ?auto_6446 ?auto_6447 ) ) ( ON ?auto_6447 ?auto_6448 ) ( not ( = ?auto_6445 ?auto_6448 ) ) ( not ( = ?auto_6446 ?auto_6448 ) ) ( not ( = ?auto_6447 ?auto_6448 ) ) ( ON ?auto_6446 ?auto_6447 ) ( CLEAR ?auto_6446 ) ( ON-TABLE ?auto_6448 ) ( HOLDING ?auto_6445 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6445 )
      ( MAKE-3PILE ?auto_6445 ?auto_6446 ?auto_6447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6449 - BLOCK
      ?auto_6450 - BLOCK
      ?auto_6451 - BLOCK
    )
    :vars
    (
      ?auto_6452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6449 ?auto_6450 ) ) ( not ( = ?auto_6449 ?auto_6451 ) ) ( not ( = ?auto_6450 ?auto_6451 ) ) ( ON ?auto_6451 ?auto_6452 ) ( not ( = ?auto_6449 ?auto_6452 ) ) ( not ( = ?auto_6450 ?auto_6452 ) ) ( not ( = ?auto_6451 ?auto_6452 ) ) ( ON ?auto_6450 ?auto_6451 ) ( ON-TABLE ?auto_6452 ) ( ON ?auto_6449 ?auto_6450 ) ( CLEAR ?auto_6449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6452 ?auto_6451 ?auto_6450 )
      ( MAKE-3PILE ?auto_6449 ?auto_6450 ?auto_6451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6455 - BLOCK
      ?auto_6456 - BLOCK
    )
    :vars
    (
      ?auto_6457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6457 ?auto_6456 ) ( CLEAR ?auto_6457 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6455 ) ( ON ?auto_6456 ?auto_6455 ) ( not ( = ?auto_6455 ?auto_6456 ) ) ( not ( = ?auto_6455 ?auto_6457 ) ) ( not ( = ?auto_6456 ?auto_6457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6457 ?auto_6456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6465 - BLOCK
      ?auto_6466 - BLOCK
    )
    :vars
    (
      ?auto_6467 - BLOCK
      ?auto_6468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6465 ) ( not ( = ?auto_6465 ?auto_6466 ) ) ( not ( = ?auto_6465 ?auto_6467 ) ) ( not ( = ?auto_6466 ?auto_6467 ) ) ( ON ?auto_6467 ?auto_6468 ) ( CLEAR ?auto_6467 ) ( not ( = ?auto_6465 ?auto_6468 ) ) ( not ( = ?auto_6466 ?auto_6468 ) ) ( not ( = ?auto_6467 ?auto_6468 ) ) ( HOLDING ?auto_6466 ) ( CLEAR ?auto_6465 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6465 ?auto_6466 ?auto_6467 )
      ( MAKE-2PILE ?auto_6465 ?auto_6466 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6469 - BLOCK
      ?auto_6470 - BLOCK
    )
    :vars
    (
      ?auto_6472 - BLOCK
      ?auto_6471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6469 ) ( not ( = ?auto_6469 ?auto_6470 ) ) ( not ( = ?auto_6469 ?auto_6472 ) ) ( not ( = ?auto_6470 ?auto_6472 ) ) ( ON ?auto_6472 ?auto_6471 ) ( not ( = ?auto_6469 ?auto_6471 ) ) ( not ( = ?auto_6470 ?auto_6471 ) ) ( not ( = ?auto_6472 ?auto_6471 ) ) ( CLEAR ?auto_6469 ) ( ON ?auto_6470 ?auto_6472 ) ( CLEAR ?auto_6470 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6471 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6471 ?auto_6472 )
      ( MAKE-2PILE ?auto_6469 ?auto_6470 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6473 - BLOCK
      ?auto_6474 - BLOCK
    )
    :vars
    (
      ?auto_6476 - BLOCK
      ?auto_6475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6473 ?auto_6474 ) ) ( not ( = ?auto_6473 ?auto_6476 ) ) ( not ( = ?auto_6474 ?auto_6476 ) ) ( ON ?auto_6476 ?auto_6475 ) ( not ( = ?auto_6473 ?auto_6475 ) ) ( not ( = ?auto_6474 ?auto_6475 ) ) ( not ( = ?auto_6476 ?auto_6475 ) ) ( ON ?auto_6474 ?auto_6476 ) ( CLEAR ?auto_6474 ) ( ON-TABLE ?auto_6475 ) ( HOLDING ?auto_6473 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6473 )
      ( MAKE-2PILE ?auto_6473 ?auto_6474 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6477 - BLOCK
      ?auto_6478 - BLOCK
    )
    :vars
    (
      ?auto_6480 - BLOCK
      ?auto_6479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6477 ?auto_6478 ) ) ( not ( = ?auto_6477 ?auto_6480 ) ) ( not ( = ?auto_6478 ?auto_6480 ) ) ( ON ?auto_6480 ?auto_6479 ) ( not ( = ?auto_6477 ?auto_6479 ) ) ( not ( = ?auto_6478 ?auto_6479 ) ) ( not ( = ?auto_6480 ?auto_6479 ) ) ( ON ?auto_6478 ?auto_6480 ) ( ON-TABLE ?auto_6479 ) ( ON ?auto_6477 ?auto_6478 ) ( CLEAR ?auto_6477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6479 ?auto_6480 ?auto_6478 )
      ( MAKE-2PILE ?auto_6477 ?auto_6478 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6482 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6482 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6482 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6483 - BLOCK
    )
    :vars
    (
      ?auto_6484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6483 ?auto_6484 ) ( CLEAR ?auto_6483 ) ( HAND-EMPTY ) ( not ( = ?auto_6483 ?auto_6484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6483 ?auto_6484 )
      ( MAKE-1PILE ?auto_6483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6485 - BLOCK
    )
    :vars
    (
      ?auto_6486 - BLOCK
      ?auto_6487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6485 ?auto_6486 ) ) ( HOLDING ?auto_6485 ) ( CLEAR ?auto_6486 ) ( ON-TABLE ?auto_6487 ) ( ON ?auto_6486 ?auto_6487 ) ( not ( = ?auto_6487 ?auto_6486 ) ) ( not ( = ?auto_6487 ?auto_6485 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6487 ?auto_6486 ?auto_6485 )
      ( MAKE-1PILE ?auto_6485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6488 - BLOCK
    )
    :vars
    (
      ?auto_6489 - BLOCK
      ?auto_6490 - BLOCK
      ?auto_6491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6488 ?auto_6489 ) ) ( CLEAR ?auto_6489 ) ( ON-TABLE ?auto_6490 ) ( ON ?auto_6489 ?auto_6490 ) ( not ( = ?auto_6490 ?auto_6489 ) ) ( not ( = ?auto_6490 ?auto_6488 ) ) ( ON ?auto_6488 ?auto_6491 ) ( CLEAR ?auto_6488 ) ( HAND-EMPTY ) ( not ( = ?auto_6488 ?auto_6491 ) ) ( not ( = ?auto_6489 ?auto_6491 ) ) ( not ( = ?auto_6490 ?auto_6491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6488 ?auto_6491 )
      ( MAKE-1PILE ?auto_6488 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6492 - BLOCK
    )
    :vars
    (
      ?auto_6494 - BLOCK
      ?auto_6493 - BLOCK
      ?auto_6495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6492 ?auto_6494 ) ) ( ON-TABLE ?auto_6493 ) ( not ( = ?auto_6493 ?auto_6494 ) ) ( not ( = ?auto_6493 ?auto_6492 ) ) ( ON ?auto_6492 ?auto_6495 ) ( CLEAR ?auto_6492 ) ( not ( = ?auto_6492 ?auto_6495 ) ) ( not ( = ?auto_6494 ?auto_6495 ) ) ( not ( = ?auto_6493 ?auto_6495 ) ) ( HOLDING ?auto_6494 ) ( CLEAR ?auto_6493 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6493 ?auto_6494 )
      ( MAKE-1PILE ?auto_6492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6496 - BLOCK
    )
    :vars
    (
      ?auto_6499 - BLOCK
      ?auto_6497 - BLOCK
      ?auto_6498 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6496 ?auto_6499 ) ) ( ON-TABLE ?auto_6497 ) ( not ( = ?auto_6497 ?auto_6499 ) ) ( not ( = ?auto_6497 ?auto_6496 ) ) ( ON ?auto_6496 ?auto_6498 ) ( not ( = ?auto_6496 ?auto_6498 ) ) ( not ( = ?auto_6499 ?auto_6498 ) ) ( not ( = ?auto_6497 ?auto_6498 ) ) ( CLEAR ?auto_6497 ) ( ON ?auto_6499 ?auto_6496 ) ( CLEAR ?auto_6499 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6498 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6498 ?auto_6496 )
      ( MAKE-1PILE ?auto_6496 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6500 - BLOCK
    )
    :vars
    (
      ?auto_6502 - BLOCK
      ?auto_6501 - BLOCK
      ?auto_6503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6500 ?auto_6502 ) ) ( not ( = ?auto_6501 ?auto_6502 ) ) ( not ( = ?auto_6501 ?auto_6500 ) ) ( ON ?auto_6500 ?auto_6503 ) ( not ( = ?auto_6500 ?auto_6503 ) ) ( not ( = ?auto_6502 ?auto_6503 ) ) ( not ( = ?auto_6501 ?auto_6503 ) ) ( ON ?auto_6502 ?auto_6500 ) ( CLEAR ?auto_6502 ) ( ON-TABLE ?auto_6503 ) ( HOLDING ?auto_6501 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6501 )
      ( MAKE-1PILE ?auto_6500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6504 - BLOCK
    )
    :vars
    (
      ?auto_6507 - BLOCK
      ?auto_6505 - BLOCK
      ?auto_6506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6504 ?auto_6507 ) ) ( not ( = ?auto_6505 ?auto_6507 ) ) ( not ( = ?auto_6505 ?auto_6504 ) ) ( ON ?auto_6504 ?auto_6506 ) ( not ( = ?auto_6504 ?auto_6506 ) ) ( not ( = ?auto_6507 ?auto_6506 ) ) ( not ( = ?auto_6505 ?auto_6506 ) ) ( ON ?auto_6507 ?auto_6504 ) ( ON-TABLE ?auto_6506 ) ( ON ?auto_6505 ?auto_6507 ) ( CLEAR ?auto_6505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6506 ?auto_6504 ?auto_6507 )
      ( MAKE-1PILE ?auto_6504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6509 - BLOCK
    )
    :vars
    (
      ?auto_6510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6510 ?auto_6509 ) ( CLEAR ?auto_6510 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6509 ) ( not ( = ?auto_6509 ?auto_6510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6510 ?auto_6509 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6511 - BLOCK
    )
    :vars
    (
      ?auto_6512 - BLOCK
      ?auto_6513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6512 ?auto_6511 ) ( CLEAR ?auto_6512 ) ( ON-TABLE ?auto_6511 ) ( not ( = ?auto_6511 ?auto_6512 ) ) ( HOLDING ?auto_6513 ) ( not ( = ?auto_6511 ?auto_6513 ) ) ( not ( = ?auto_6512 ?auto_6513 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6513 )
      ( MAKE-1PILE ?auto_6511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6514 - BLOCK
    )
    :vars
    (
      ?auto_6516 - BLOCK
      ?auto_6515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6516 ?auto_6514 ) ( ON-TABLE ?auto_6514 ) ( not ( = ?auto_6514 ?auto_6516 ) ) ( not ( = ?auto_6514 ?auto_6515 ) ) ( not ( = ?auto_6516 ?auto_6515 ) ) ( ON ?auto_6515 ?auto_6516 ) ( CLEAR ?auto_6515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6514 ?auto_6516 )
      ( MAKE-1PILE ?auto_6514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6517 - BLOCK
    )
    :vars
    (
      ?auto_6519 - BLOCK
      ?auto_6518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6519 ?auto_6517 ) ( ON-TABLE ?auto_6517 ) ( not ( = ?auto_6517 ?auto_6519 ) ) ( not ( = ?auto_6517 ?auto_6518 ) ) ( not ( = ?auto_6519 ?auto_6518 ) ) ( HOLDING ?auto_6518 ) ( CLEAR ?auto_6519 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6517 ?auto_6519 ?auto_6518 )
      ( MAKE-1PILE ?auto_6517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6520 - BLOCK
    )
    :vars
    (
      ?auto_6521 - BLOCK
      ?auto_6522 - BLOCK
      ?auto_6523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6521 ?auto_6520 ) ( ON-TABLE ?auto_6520 ) ( not ( = ?auto_6520 ?auto_6521 ) ) ( not ( = ?auto_6520 ?auto_6522 ) ) ( not ( = ?auto_6521 ?auto_6522 ) ) ( CLEAR ?auto_6521 ) ( ON ?auto_6522 ?auto_6523 ) ( CLEAR ?auto_6522 ) ( HAND-EMPTY ) ( not ( = ?auto_6520 ?auto_6523 ) ) ( not ( = ?auto_6521 ?auto_6523 ) ) ( not ( = ?auto_6522 ?auto_6523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6522 ?auto_6523 )
      ( MAKE-1PILE ?auto_6520 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6532 - BLOCK
    )
    :vars
    (
      ?auto_6533 - BLOCK
      ?auto_6535 - BLOCK
      ?auto_6534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6532 ?auto_6533 ) ) ( not ( = ?auto_6532 ?auto_6535 ) ) ( not ( = ?auto_6533 ?auto_6535 ) ) ( ON ?auto_6535 ?auto_6534 ) ( not ( = ?auto_6532 ?auto_6534 ) ) ( not ( = ?auto_6533 ?auto_6534 ) ) ( not ( = ?auto_6535 ?auto_6534 ) ) ( ON ?auto_6533 ?auto_6535 ) ( CLEAR ?auto_6533 ) ( HOLDING ?auto_6532 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6532 ?auto_6533 )
      ( MAKE-1PILE ?auto_6532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6536 - BLOCK
    )
    :vars
    (
      ?auto_6538 - BLOCK
      ?auto_6537 - BLOCK
      ?auto_6539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6536 ?auto_6538 ) ) ( not ( = ?auto_6536 ?auto_6537 ) ) ( not ( = ?auto_6538 ?auto_6537 ) ) ( ON ?auto_6537 ?auto_6539 ) ( not ( = ?auto_6536 ?auto_6539 ) ) ( not ( = ?auto_6538 ?auto_6539 ) ) ( not ( = ?auto_6537 ?auto_6539 ) ) ( ON ?auto_6538 ?auto_6537 ) ( ON ?auto_6536 ?auto_6538 ) ( CLEAR ?auto_6536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6539 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6539 ?auto_6537 ?auto_6538 )
      ( MAKE-1PILE ?auto_6536 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6542 - BLOCK
      ?auto_6543 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6543 ) ( CLEAR ?auto_6542 ) ( ON-TABLE ?auto_6542 ) ( not ( = ?auto_6542 ?auto_6543 ) ) )
    :subtasks
    ( ( !STACK ?auto_6543 ?auto_6542 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6544 - BLOCK
      ?auto_6545 - BLOCK
    )
    :vars
    (
      ?auto_6546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6544 ) ( ON-TABLE ?auto_6544 ) ( not ( = ?auto_6544 ?auto_6545 ) ) ( ON ?auto_6545 ?auto_6546 ) ( CLEAR ?auto_6545 ) ( HAND-EMPTY ) ( not ( = ?auto_6544 ?auto_6546 ) ) ( not ( = ?auto_6545 ?auto_6546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6545 ?auto_6546 )
      ( MAKE-2PILE ?auto_6544 ?auto_6545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6547 - BLOCK
      ?auto_6548 - BLOCK
    )
    :vars
    (
      ?auto_6549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6547 ?auto_6548 ) ) ( ON ?auto_6548 ?auto_6549 ) ( CLEAR ?auto_6548 ) ( not ( = ?auto_6547 ?auto_6549 ) ) ( not ( = ?auto_6548 ?auto_6549 ) ) ( HOLDING ?auto_6547 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6547 )
      ( MAKE-2PILE ?auto_6547 ?auto_6548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6550 - BLOCK
      ?auto_6551 - BLOCK
    )
    :vars
    (
      ?auto_6552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6550 ?auto_6551 ) ) ( ON ?auto_6551 ?auto_6552 ) ( not ( = ?auto_6550 ?auto_6552 ) ) ( not ( = ?auto_6551 ?auto_6552 ) ) ( ON ?auto_6550 ?auto_6551 ) ( CLEAR ?auto_6550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6552 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6552 ?auto_6551 )
      ( MAKE-2PILE ?auto_6550 ?auto_6551 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6553 - BLOCK
      ?auto_6554 - BLOCK
    )
    :vars
    (
      ?auto_6555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6553 ?auto_6554 ) ) ( ON ?auto_6554 ?auto_6555 ) ( not ( = ?auto_6553 ?auto_6555 ) ) ( not ( = ?auto_6554 ?auto_6555 ) ) ( ON-TABLE ?auto_6555 ) ( HOLDING ?auto_6553 ) ( CLEAR ?auto_6554 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6555 ?auto_6554 ?auto_6553 )
      ( MAKE-2PILE ?auto_6553 ?auto_6554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6556 - BLOCK
      ?auto_6557 - BLOCK
    )
    :vars
    (
      ?auto_6558 - BLOCK
      ?auto_6559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6556 ?auto_6557 ) ) ( ON ?auto_6557 ?auto_6558 ) ( not ( = ?auto_6556 ?auto_6558 ) ) ( not ( = ?auto_6557 ?auto_6558 ) ) ( ON-TABLE ?auto_6558 ) ( CLEAR ?auto_6557 ) ( ON ?auto_6556 ?auto_6559 ) ( CLEAR ?auto_6556 ) ( HAND-EMPTY ) ( not ( = ?auto_6556 ?auto_6559 ) ) ( not ( = ?auto_6557 ?auto_6559 ) ) ( not ( = ?auto_6558 ?auto_6559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6556 ?auto_6559 )
      ( MAKE-2PILE ?auto_6556 ?auto_6557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6560 - BLOCK
      ?auto_6561 - BLOCK
    )
    :vars
    (
      ?auto_6562 - BLOCK
      ?auto_6563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6560 ?auto_6561 ) ) ( not ( = ?auto_6560 ?auto_6562 ) ) ( not ( = ?auto_6561 ?auto_6562 ) ) ( ON-TABLE ?auto_6562 ) ( ON ?auto_6560 ?auto_6563 ) ( CLEAR ?auto_6560 ) ( not ( = ?auto_6560 ?auto_6563 ) ) ( not ( = ?auto_6561 ?auto_6563 ) ) ( not ( = ?auto_6562 ?auto_6563 ) ) ( HOLDING ?auto_6561 ) ( CLEAR ?auto_6562 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6562 ?auto_6561 )
      ( MAKE-2PILE ?auto_6560 ?auto_6561 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6564 - BLOCK
      ?auto_6565 - BLOCK
    )
    :vars
    (
      ?auto_6566 - BLOCK
      ?auto_6567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6564 ?auto_6565 ) ) ( not ( = ?auto_6564 ?auto_6566 ) ) ( not ( = ?auto_6565 ?auto_6566 ) ) ( ON-TABLE ?auto_6566 ) ( ON ?auto_6564 ?auto_6567 ) ( not ( = ?auto_6564 ?auto_6567 ) ) ( not ( = ?auto_6565 ?auto_6567 ) ) ( not ( = ?auto_6566 ?auto_6567 ) ) ( CLEAR ?auto_6566 ) ( ON ?auto_6565 ?auto_6564 ) ( CLEAR ?auto_6565 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6567 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6567 ?auto_6564 )
      ( MAKE-2PILE ?auto_6564 ?auto_6565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6568 - BLOCK
      ?auto_6569 - BLOCK
    )
    :vars
    (
      ?auto_6571 - BLOCK
      ?auto_6570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6568 ?auto_6569 ) ) ( not ( = ?auto_6568 ?auto_6571 ) ) ( not ( = ?auto_6569 ?auto_6571 ) ) ( ON ?auto_6568 ?auto_6570 ) ( not ( = ?auto_6568 ?auto_6570 ) ) ( not ( = ?auto_6569 ?auto_6570 ) ) ( not ( = ?auto_6571 ?auto_6570 ) ) ( ON ?auto_6569 ?auto_6568 ) ( CLEAR ?auto_6569 ) ( ON-TABLE ?auto_6570 ) ( HOLDING ?auto_6571 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6571 )
      ( MAKE-2PILE ?auto_6568 ?auto_6569 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6572 - BLOCK
      ?auto_6573 - BLOCK
    )
    :vars
    (
      ?auto_6575 - BLOCK
      ?auto_6574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6572 ?auto_6573 ) ) ( not ( = ?auto_6572 ?auto_6575 ) ) ( not ( = ?auto_6573 ?auto_6575 ) ) ( ON ?auto_6572 ?auto_6574 ) ( not ( = ?auto_6572 ?auto_6574 ) ) ( not ( = ?auto_6573 ?auto_6574 ) ) ( not ( = ?auto_6575 ?auto_6574 ) ) ( ON ?auto_6573 ?auto_6572 ) ( ON-TABLE ?auto_6574 ) ( ON ?auto_6575 ?auto_6573 ) ( CLEAR ?auto_6575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6574 ?auto_6572 ?auto_6573 )
      ( MAKE-2PILE ?auto_6572 ?auto_6573 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6579 - BLOCK
      ?auto_6580 - BLOCK
      ?auto_6581 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6581 ) ( CLEAR ?auto_6580 ) ( ON-TABLE ?auto_6579 ) ( ON ?auto_6580 ?auto_6579 ) ( not ( = ?auto_6579 ?auto_6580 ) ) ( not ( = ?auto_6579 ?auto_6581 ) ) ( not ( = ?auto_6580 ?auto_6581 ) ) )
    :subtasks
    ( ( !STACK ?auto_6581 ?auto_6580 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6582 - BLOCK
      ?auto_6583 - BLOCK
      ?auto_6584 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6583 ) ( ON-TABLE ?auto_6582 ) ( ON ?auto_6583 ?auto_6582 ) ( not ( = ?auto_6582 ?auto_6583 ) ) ( not ( = ?auto_6582 ?auto_6584 ) ) ( not ( = ?auto_6583 ?auto_6584 ) ) ( ON-TABLE ?auto_6584 ) ( CLEAR ?auto_6584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_6584 )
      ( MAKE-3PILE ?auto_6582 ?auto_6583 ?auto_6584 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6585 - BLOCK
      ?auto_6586 - BLOCK
      ?auto_6587 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6585 ) ( not ( = ?auto_6585 ?auto_6586 ) ) ( not ( = ?auto_6585 ?auto_6587 ) ) ( not ( = ?auto_6586 ?auto_6587 ) ) ( ON-TABLE ?auto_6587 ) ( CLEAR ?auto_6587 ) ( HOLDING ?auto_6586 ) ( CLEAR ?auto_6585 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6585 ?auto_6586 )
      ( MAKE-3PILE ?auto_6585 ?auto_6586 ?auto_6587 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6588 - BLOCK
      ?auto_6589 - BLOCK
      ?auto_6590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6588 ) ( not ( = ?auto_6588 ?auto_6589 ) ) ( not ( = ?auto_6588 ?auto_6590 ) ) ( not ( = ?auto_6589 ?auto_6590 ) ) ( ON-TABLE ?auto_6590 ) ( CLEAR ?auto_6588 ) ( ON ?auto_6589 ?auto_6590 ) ( CLEAR ?auto_6589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6590 )
      ( MAKE-3PILE ?auto_6588 ?auto_6589 ?auto_6590 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6591 - BLOCK
      ?auto_6592 - BLOCK
      ?auto_6593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6591 ?auto_6592 ) ) ( not ( = ?auto_6591 ?auto_6593 ) ) ( not ( = ?auto_6592 ?auto_6593 ) ) ( ON-TABLE ?auto_6593 ) ( ON ?auto_6592 ?auto_6593 ) ( CLEAR ?auto_6592 ) ( HOLDING ?auto_6591 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6591 )
      ( MAKE-3PILE ?auto_6591 ?auto_6592 ?auto_6593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6594 - BLOCK
      ?auto_6595 - BLOCK
      ?auto_6596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6594 ?auto_6595 ) ) ( not ( = ?auto_6594 ?auto_6596 ) ) ( not ( = ?auto_6595 ?auto_6596 ) ) ( ON-TABLE ?auto_6596 ) ( ON ?auto_6595 ?auto_6596 ) ( ON ?auto_6594 ?auto_6595 ) ( CLEAR ?auto_6594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6596 ?auto_6595 )
      ( MAKE-3PILE ?auto_6594 ?auto_6595 ?auto_6596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6597 - BLOCK
      ?auto_6598 - BLOCK
      ?auto_6599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6597 ?auto_6598 ) ) ( not ( = ?auto_6597 ?auto_6599 ) ) ( not ( = ?auto_6598 ?auto_6599 ) ) ( ON-TABLE ?auto_6599 ) ( ON ?auto_6598 ?auto_6599 ) ( HOLDING ?auto_6597 ) ( CLEAR ?auto_6598 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6599 ?auto_6598 ?auto_6597 )
      ( MAKE-3PILE ?auto_6597 ?auto_6598 ?auto_6599 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6600 - BLOCK
      ?auto_6601 - BLOCK
      ?auto_6602 - BLOCK
    )
    :vars
    (
      ?auto_6603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6600 ?auto_6601 ) ) ( not ( = ?auto_6600 ?auto_6602 ) ) ( not ( = ?auto_6601 ?auto_6602 ) ) ( ON-TABLE ?auto_6602 ) ( ON ?auto_6601 ?auto_6602 ) ( CLEAR ?auto_6601 ) ( ON ?auto_6600 ?auto_6603 ) ( CLEAR ?auto_6600 ) ( HAND-EMPTY ) ( not ( = ?auto_6600 ?auto_6603 ) ) ( not ( = ?auto_6601 ?auto_6603 ) ) ( not ( = ?auto_6602 ?auto_6603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6600 ?auto_6603 )
      ( MAKE-3PILE ?auto_6600 ?auto_6601 ?auto_6602 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6604 - BLOCK
      ?auto_6605 - BLOCK
      ?auto_6606 - BLOCK
    )
    :vars
    (
      ?auto_6607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6604 ?auto_6605 ) ) ( not ( = ?auto_6604 ?auto_6606 ) ) ( not ( = ?auto_6605 ?auto_6606 ) ) ( ON-TABLE ?auto_6606 ) ( ON ?auto_6604 ?auto_6607 ) ( CLEAR ?auto_6604 ) ( not ( = ?auto_6604 ?auto_6607 ) ) ( not ( = ?auto_6605 ?auto_6607 ) ) ( not ( = ?auto_6606 ?auto_6607 ) ) ( HOLDING ?auto_6605 ) ( CLEAR ?auto_6606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6606 ?auto_6605 )
      ( MAKE-3PILE ?auto_6604 ?auto_6605 ?auto_6606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6608 - BLOCK
      ?auto_6609 - BLOCK
      ?auto_6610 - BLOCK
    )
    :vars
    (
      ?auto_6611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6608 ?auto_6609 ) ) ( not ( = ?auto_6608 ?auto_6610 ) ) ( not ( = ?auto_6609 ?auto_6610 ) ) ( ON-TABLE ?auto_6610 ) ( ON ?auto_6608 ?auto_6611 ) ( not ( = ?auto_6608 ?auto_6611 ) ) ( not ( = ?auto_6609 ?auto_6611 ) ) ( not ( = ?auto_6610 ?auto_6611 ) ) ( CLEAR ?auto_6610 ) ( ON ?auto_6609 ?auto_6608 ) ( CLEAR ?auto_6609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6611 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6611 ?auto_6608 )
      ( MAKE-3PILE ?auto_6608 ?auto_6609 ?auto_6610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6612 - BLOCK
      ?auto_6613 - BLOCK
      ?auto_6614 - BLOCK
    )
    :vars
    (
      ?auto_6615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6612 ?auto_6613 ) ) ( not ( = ?auto_6612 ?auto_6614 ) ) ( not ( = ?auto_6613 ?auto_6614 ) ) ( ON ?auto_6612 ?auto_6615 ) ( not ( = ?auto_6612 ?auto_6615 ) ) ( not ( = ?auto_6613 ?auto_6615 ) ) ( not ( = ?auto_6614 ?auto_6615 ) ) ( ON ?auto_6613 ?auto_6612 ) ( CLEAR ?auto_6613 ) ( ON-TABLE ?auto_6615 ) ( HOLDING ?auto_6614 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6614 )
      ( MAKE-3PILE ?auto_6612 ?auto_6613 ?auto_6614 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6616 - BLOCK
      ?auto_6617 - BLOCK
      ?auto_6618 - BLOCK
    )
    :vars
    (
      ?auto_6619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6616 ?auto_6617 ) ) ( not ( = ?auto_6616 ?auto_6618 ) ) ( not ( = ?auto_6617 ?auto_6618 ) ) ( ON ?auto_6616 ?auto_6619 ) ( not ( = ?auto_6616 ?auto_6619 ) ) ( not ( = ?auto_6617 ?auto_6619 ) ) ( not ( = ?auto_6618 ?auto_6619 ) ) ( ON ?auto_6617 ?auto_6616 ) ( ON-TABLE ?auto_6619 ) ( ON ?auto_6618 ?auto_6617 ) ( CLEAR ?auto_6618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6619 ?auto_6616 ?auto_6617 )
      ( MAKE-3PILE ?auto_6616 ?auto_6617 ?auto_6618 ) )
  )

)

