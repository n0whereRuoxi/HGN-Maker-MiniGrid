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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13404 - BLOCK
      ?auto_13405 - BLOCK
      ?auto_13406 - BLOCK
      ?auto_13407 - BLOCK
    )
    :vars
    (
      ?auto_13408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13408 ?auto_13407 ) ( CLEAR ?auto_13408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13404 ) ( ON ?auto_13405 ?auto_13404 ) ( ON ?auto_13406 ?auto_13405 ) ( ON ?auto_13407 ?auto_13406 ) ( not ( = ?auto_13404 ?auto_13405 ) ) ( not ( = ?auto_13404 ?auto_13406 ) ) ( not ( = ?auto_13404 ?auto_13407 ) ) ( not ( = ?auto_13404 ?auto_13408 ) ) ( not ( = ?auto_13405 ?auto_13406 ) ) ( not ( = ?auto_13405 ?auto_13407 ) ) ( not ( = ?auto_13405 ?auto_13408 ) ) ( not ( = ?auto_13406 ?auto_13407 ) ) ( not ( = ?auto_13406 ?auto_13408 ) ) ( not ( = ?auto_13407 ?auto_13408 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13408 ?auto_13407 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13410 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13410 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_13410 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13411 - BLOCK
    )
    :vars
    (
      ?auto_13412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13411 ?auto_13412 ) ( CLEAR ?auto_13411 ) ( HAND-EMPTY ) ( not ( = ?auto_13411 ?auto_13412 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13411 ?auto_13412 )
      ( MAKE-1PILE ?auto_13411 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13416 - BLOCK
      ?auto_13417 - BLOCK
      ?auto_13418 - BLOCK
    )
    :vars
    (
      ?auto_13419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13419 ?auto_13418 ) ( CLEAR ?auto_13419 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13416 ) ( ON ?auto_13417 ?auto_13416 ) ( ON ?auto_13418 ?auto_13417 ) ( not ( = ?auto_13416 ?auto_13417 ) ) ( not ( = ?auto_13416 ?auto_13418 ) ) ( not ( = ?auto_13416 ?auto_13419 ) ) ( not ( = ?auto_13417 ?auto_13418 ) ) ( not ( = ?auto_13417 ?auto_13419 ) ) ( not ( = ?auto_13418 ?auto_13419 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13419 ?auto_13418 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13420 - BLOCK
      ?auto_13421 - BLOCK
      ?auto_13422 - BLOCK
    )
    :vars
    (
      ?auto_13423 - BLOCK
      ?auto_13424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13423 ?auto_13422 ) ( CLEAR ?auto_13423 ) ( ON-TABLE ?auto_13420 ) ( ON ?auto_13421 ?auto_13420 ) ( ON ?auto_13422 ?auto_13421 ) ( not ( = ?auto_13420 ?auto_13421 ) ) ( not ( = ?auto_13420 ?auto_13422 ) ) ( not ( = ?auto_13420 ?auto_13423 ) ) ( not ( = ?auto_13421 ?auto_13422 ) ) ( not ( = ?auto_13421 ?auto_13423 ) ) ( not ( = ?auto_13422 ?auto_13423 ) ) ( HOLDING ?auto_13424 ) ( not ( = ?auto_13420 ?auto_13424 ) ) ( not ( = ?auto_13421 ?auto_13424 ) ) ( not ( = ?auto_13422 ?auto_13424 ) ) ( not ( = ?auto_13423 ?auto_13424 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_13424 )
      ( MAKE-3PILE ?auto_13420 ?auto_13421 ?auto_13422 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13425 - BLOCK
      ?auto_13426 - BLOCK
      ?auto_13427 - BLOCK
    )
    :vars
    (
      ?auto_13429 - BLOCK
      ?auto_13428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13429 ?auto_13427 ) ( ON-TABLE ?auto_13425 ) ( ON ?auto_13426 ?auto_13425 ) ( ON ?auto_13427 ?auto_13426 ) ( not ( = ?auto_13425 ?auto_13426 ) ) ( not ( = ?auto_13425 ?auto_13427 ) ) ( not ( = ?auto_13425 ?auto_13429 ) ) ( not ( = ?auto_13426 ?auto_13427 ) ) ( not ( = ?auto_13426 ?auto_13429 ) ) ( not ( = ?auto_13427 ?auto_13429 ) ) ( not ( = ?auto_13425 ?auto_13428 ) ) ( not ( = ?auto_13426 ?auto_13428 ) ) ( not ( = ?auto_13427 ?auto_13428 ) ) ( not ( = ?auto_13429 ?auto_13428 ) ) ( ON ?auto_13428 ?auto_13429 ) ( CLEAR ?auto_13428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13425 ?auto_13426 ?auto_13427 ?auto_13429 )
      ( MAKE-3PILE ?auto_13425 ?auto_13426 ?auto_13427 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13432 - BLOCK
      ?auto_13433 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13433 ) ( CLEAR ?auto_13432 ) ( ON-TABLE ?auto_13432 ) ( not ( = ?auto_13432 ?auto_13433 ) ) )
    :subtasks
    ( ( !STACK ?auto_13433 ?auto_13432 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13434 - BLOCK
      ?auto_13435 - BLOCK
    )
    :vars
    (
      ?auto_13436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13434 ) ( ON-TABLE ?auto_13434 ) ( not ( = ?auto_13434 ?auto_13435 ) ) ( ON ?auto_13435 ?auto_13436 ) ( CLEAR ?auto_13435 ) ( HAND-EMPTY ) ( not ( = ?auto_13434 ?auto_13436 ) ) ( not ( = ?auto_13435 ?auto_13436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13435 ?auto_13436 )
      ( MAKE-2PILE ?auto_13434 ?auto_13435 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13437 - BLOCK
      ?auto_13438 - BLOCK
    )
    :vars
    (
      ?auto_13439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13437 ?auto_13438 ) ) ( ON ?auto_13438 ?auto_13439 ) ( CLEAR ?auto_13438 ) ( not ( = ?auto_13437 ?auto_13439 ) ) ( not ( = ?auto_13438 ?auto_13439 ) ) ( HOLDING ?auto_13437 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13437 )
      ( MAKE-2PILE ?auto_13437 ?auto_13438 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13440 - BLOCK
      ?auto_13441 - BLOCK
    )
    :vars
    (
      ?auto_13442 - BLOCK
      ?auto_13443 - BLOCK
      ?auto_13444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13440 ?auto_13441 ) ) ( ON ?auto_13441 ?auto_13442 ) ( not ( = ?auto_13440 ?auto_13442 ) ) ( not ( = ?auto_13441 ?auto_13442 ) ) ( ON ?auto_13440 ?auto_13441 ) ( CLEAR ?auto_13440 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13443 ) ( ON ?auto_13444 ?auto_13443 ) ( ON ?auto_13442 ?auto_13444 ) ( not ( = ?auto_13443 ?auto_13444 ) ) ( not ( = ?auto_13443 ?auto_13442 ) ) ( not ( = ?auto_13443 ?auto_13441 ) ) ( not ( = ?auto_13443 ?auto_13440 ) ) ( not ( = ?auto_13444 ?auto_13442 ) ) ( not ( = ?auto_13444 ?auto_13441 ) ) ( not ( = ?auto_13444 ?auto_13440 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13443 ?auto_13444 ?auto_13442 ?auto_13441 )
      ( MAKE-2PILE ?auto_13440 ?auto_13441 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13447 - BLOCK
      ?auto_13448 - BLOCK
    )
    :vars
    (
      ?auto_13449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13449 ?auto_13448 ) ( CLEAR ?auto_13449 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13447 ) ( ON ?auto_13448 ?auto_13447 ) ( not ( = ?auto_13447 ?auto_13448 ) ) ( not ( = ?auto_13447 ?auto_13449 ) ) ( not ( = ?auto_13448 ?auto_13449 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13449 ?auto_13448 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13450 - BLOCK
      ?auto_13451 - BLOCK
    )
    :vars
    (
      ?auto_13452 - BLOCK
      ?auto_13453 - BLOCK
      ?auto_13454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13452 ?auto_13451 ) ( CLEAR ?auto_13452 ) ( ON-TABLE ?auto_13450 ) ( ON ?auto_13451 ?auto_13450 ) ( not ( = ?auto_13450 ?auto_13451 ) ) ( not ( = ?auto_13450 ?auto_13452 ) ) ( not ( = ?auto_13451 ?auto_13452 ) ) ( HOLDING ?auto_13453 ) ( CLEAR ?auto_13454 ) ( not ( = ?auto_13450 ?auto_13453 ) ) ( not ( = ?auto_13450 ?auto_13454 ) ) ( not ( = ?auto_13451 ?auto_13453 ) ) ( not ( = ?auto_13451 ?auto_13454 ) ) ( not ( = ?auto_13452 ?auto_13453 ) ) ( not ( = ?auto_13452 ?auto_13454 ) ) ( not ( = ?auto_13453 ?auto_13454 ) ) )
    :subtasks
    ( ( !STACK ?auto_13453 ?auto_13454 )
      ( MAKE-2PILE ?auto_13450 ?auto_13451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13455 - BLOCK
      ?auto_13456 - BLOCK
    )
    :vars
    (
      ?auto_13458 - BLOCK
      ?auto_13457 - BLOCK
      ?auto_13459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13458 ?auto_13456 ) ( ON-TABLE ?auto_13455 ) ( ON ?auto_13456 ?auto_13455 ) ( not ( = ?auto_13455 ?auto_13456 ) ) ( not ( = ?auto_13455 ?auto_13458 ) ) ( not ( = ?auto_13456 ?auto_13458 ) ) ( CLEAR ?auto_13457 ) ( not ( = ?auto_13455 ?auto_13459 ) ) ( not ( = ?auto_13455 ?auto_13457 ) ) ( not ( = ?auto_13456 ?auto_13459 ) ) ( not ( = ?auto_13456 ?auto_13457 ) ) ( not ( = ?auto_13458 ?auto_13459 ) ) ( not ( = ?auto_13458 ?auto_13457 ) ) ( not ( = ?auto_13459 ?auto_13457 ) ) ( ON ?auto_13459 ?auto_13458 ) ( CLEAR ?auto_13459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13455 ?auto_13456 ?auto_13458 )
      ( MAKE-2PILE ?auto_13455 ?auto_13456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13460 - BLOCK
      ?auto_13461 - BLOCK
    )
    :vars
    (
      ?auto_13464 - BLOCK
      ?auto_13462 - BLOCK
      ?auto_13463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13464 ?auto_13461 ) ( ON-TABLE ?auto_13460 ) ( ON ?auto_13461 ?auto_13460 ) ( not ( = ?auto_13460 ?auto_13461 ) ) ( not ( = ?auto_13460 ?auto_13464 ) ) ( not ( = ?auto_13461 ?auto_13464 ) ) ( not ( = ?auto_13460 ?auto_13462 ) ) ( not ( = ?auto_13460 ?auto_13463 ) ) ( not ( = ?auto_13461 ?auto_13462 ) ) ( not ( = ?auto_13461 ?auto_13463 ) ) ( not ( = ?auto_13464 ?auto_13462 ) ) ( not ( = ?auto_13464 ?auto_13463 ) ) ( not ( = ?auto_13462 ?auto_13463 ) ) ( ON ?auto_13462 ?auto_13464 ) ( CLEAR ?auto_13462 ) ( HOLDING ?auto_13463 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13463 )
      ( MAKE-2PILE ?auto_13460 ?auto_13461 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13465 - BLOCK
      ?auto_13466 - BLOCK
    )
    :vars
    (
      ?auto_13469 - BLOCK
      ?auto_13467 - BLOCK
      ?auto_13468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13469 ?auto_13466 ) ( ON-TABLE ?auto_13465 ) ( ON ?auto_13466 ?auto_13465 ) ( not ( = ?auto_13465 ?auto_13466 ) ) ( not ( = ?auto_13465 ?auto_13469 ) ) ( not ( = ?auto_13466 ?auto_13469 ) ) ( not ( = ?auto_13465 ?auto_13467 ) ) ( not ( = ?auto_13465 ?auto_13468 ) ) ( not ( = ?auto_13466 ?auto_13467 ) ) ( not ( = ?auto_13466 ?auto_13468 ) ) ( not ( = ?auto_13469 ?auto_13467 ) ) ( not ( = ?auto_13469 ?auto_13468 ) ) ( not ( = ?auto_13467 ?auto_13468 ) ) ( ON ?auto_13467 ?auto_13469 ) ( ON ?auto_13468 ?auto_13467 ) ( CLEAR ?auto_13468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13465 ?auto_13466 ?auto_13469 ?auto_13467 )
      ( MAKE-2PILE ?auto_13465 ?auto_13466 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13473 - BLOCK
      ?auto_13474 - BLOCK
      ?auto_13475 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13475 ) ( CLEAR ?auto_13474 ) ( ON-TABLE ?auto_13473 ) ( ON ?auto_13474 ?auto_13473 ) ( not ( = ?auto_13473 ?auto_13474 ) ) ( not ( = ?auto_13473 ?auto_13475 ) ) ( not ( = ?auto_13474 ?auto_13475 ) ) )
    :subtasks
    ( ( !STACK ?auto_13475 ?auto_13474 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13476 - BLOCK
      ?auto_13477 - BLOCK
      ?auto_13478 - BLOCK
    )
    :vars
    (
      ?auto_13479 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13477 ) ( ON-TABLE ?auto_13476 ) ( ON ?auto_13477 ?auto_13476 ) ( not ( = ?auto_13476 ?auto_13477 ) ) ( not ( = ?auto_13476 ?auto_13478 ) ) ( not ( = ?auto_13477 ?auto_13478 ) ) ( ON ?auto_13478 ?auto_13479 ) ( CLEAR ?auto_13478 ) ( HAND-EMPTY ) ( not ( = ?auto_13476 ?auto_13479 ) ) ( not ( = ?auto_13477 ?auto_13479 ) ) ( not ( = ?auto_13478 ?auto_13479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13478 ?auto_13479 )
      ( MAKE-3PILE ?auto_13476 ?auto_13477 ?auto_13478 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13480 - BLOCK
      ?auto_13481 - BLOCK
      ?auto_13482 - BLOCK
    )
    :vars
    (
      ?auto_13483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13480 ) ( not ( = ?auto_13480 ?auto_13481 ) ) ( not ( = ?auto_13480 ?auto_13482 ) ) ( not ( = ?auto_13481 ?auto_13482 ) ) ( ON ?auto_13482 ?auto_13483 ) ( CLEAR ?auto_13482 ) ( not ( = ?auto_13480 ?auto_13483 ) ) ( not ( = ?auto_13481 ?auto_13483 ) ) ( not ( = ?auto_13482 ?auto_13483 ) ) ( HOLDING ?auto_13481 ) ( CLEAR ?auto_13480 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13480 ?auto_13481 )
      ( MAKE-3PILE ?auto_13480 ?auto_13481 ?auto_13482 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13484 - BLOCK
      ?auto_13485 - BLOCK
      ?auto_13486 - BLOCK
    )
    :vars
    (
      ?auto_13487 - BLOCK
      ?auto_13488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13484 ) ( not ( = ?auto_13484 ?auto_13485 ) ) ( not ( = ?auto_13484 ?auto_13486 ) ) ( not ( = ?auto_13485 ?auto_13486 ) ) ( ON ?auto_13486 ?auto_13487 ) ( not ( = ?auto_13484 ?auto_13487 ) ) ( not ( = ?auto_13485 ?auto_13487 ) ) ( not ( = ?auto_13486 ?auto_13487 ) ) ( CLEAR ?auto_13484 ) ( ON ?auto_13485 ?auto_13486 ) ( CLEAR ?auto_13485 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13488 ) ( ON ?auto_13487 ?auto_13488 ) ( not ( = ?auto_13488 ?auto_13487 ) ) ( not ( = ?auto_13488 ?auto_13486 ) ) ( not ( = ?auto_13488 ?auto_13485 ) ) ( not ( = ?auto_13484 ?auto_13488 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13488 ?auto_13487 ?auto_13486 )
      ( MAKE-3PILE ?auto_13484 ?auto_13485 ?auto_13486 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13489 - BLOCK
      ?auto_13490 - BLOCK
      ?auto_13491 - BLOCK
    )
    :vars
    (
      ?auto_13492 - BLOCK
      ?auto_13493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13489 ?auto_13490 ) ) ( not ( = ?auto_13489 ?auto_13491 ) ) ( not ( = ?auto_13490 ?auto_13491 ) ) ( ON ?auto_13491 ?auto_13492 ) ( not ( = ?auto_13489 ?auto_13492 ) ) ( not ( = ?auto_13490 ?auto_13492 ) ) ( not ( = ?auto_13491 ?auto_13492 ) ) ( ON ?auto_13490 ?auto_13491 ) ( CLEAR ?auto_13490 ) ( ON-TABLE ?auto_13493 ) ( ON ?auto_13492 ?auto_13493 ) ( not ( = ?auto_13493 ?auto_13492 ) ) ( not ( = ?auto_13493 ?auto_13491 ) ) ( not ( = ?auto_13493 ?auto_13490 ) ) ( not ( = ?auto_13489 ?auto_13493 ) ) ( HOLDING ?auto_13489 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13489 )
      ( MAKE-3PILE ?auto_13489 ?auto_13490 ?auto_13491 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13494 - BLOCK
      ?auto_13495 - BLOCK
      ?auto_13496 - BLOCK
    )
    :vars
    (
      ?auto_13498 - BLOCK
      ?auto_13497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13494 ?auto_13495 ) ) ( not ( = ?auto_13494 ?auto_13496 ) ) ( not ( = ?auto_13495 ?auto_13496 ) ) ( ON ?auto_13496 ?auto_13498 ) ( not ( = ?auto_13494 ?auto_13498 ) ) ( not ( = ?auto_13495 ?auto_13498 ) ) ( not ( = ?auto_13496 ?auto_13498 ) ) ( ON ?auto_13495 ?auto_13496 ) ( ON-TABLE ?auto_13497 ) ( ON ?auto_13498 ?auto_13497 ) ( not ( = ?auto_13497 ?auto_13498 ) ) ( not ( = ?auto_13497 ?auto_13496 ) ) ( not ( = ?auto_13497 ?auto_13495 ) ) ( not ( = ?auto_13494 ?auto_13497 ) ) ( ON ?auto_13494 ?auto_13495 ) ( CLEAR ?auto_13494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13497 ?auto_13498 ?auto_13496 ?auto_13495 )
      ( MAKE-3PILE ?auto_13494 ?auto_13495 ?auto_13496 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13500 - BLOCK
    )
    :vars
    (
      ?auto_13501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13501 ?auto_13500 ) ( CLEAR ?auto_13501 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13500 ) ( not ( = ?auto_13500 ?auto_13501 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13501 ?auto_13500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13502 - BLOCK
    )
    :vars
    (
      ?auto_13503 - BLOCK
      ?auto_13504 - BLOCK
      ?auto_13505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13503 ?auto_13502 ) ( CLEAR ?auto_13503 ) ( ON-TABLE ?auto_13502 ) ( not ( = ?auto_13502 ?auto_13503 ) ) ( HOLDING ?auto_13504 ) ( CLEAR ?auto_13505 ) ( not ( = ?auto_13502 ?auto_13504 ) ) ( not ( = ?auto_13502 ?auto_13505 ) ) ( not ( = ?auto_13503 ?auto_13504 ) ) ( not ( = ?auto_13503 ?auto_13505 ) ) ( not ( = ?auto_13504 ?auto_13505 ) ) )
    :subtasks
    ( ( !STACK ?auto_13504 ?auto_13505 )
      ( MAKE-1PILE ?auto_13502 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13506 - BLOCK
    )
    :vars
    (
      ?auto_13507 - BLOCK
      ?auto_13509 - BLOCK
      ?auto_13508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13507 ?auto_13506 ) ( ON-TABLE ?auto_13506 ) ( not ( = ?auto_13506 ?auto_13507 ) ) ( CLEAR ?auto_13509 ) ( not ( = ?auto_13506 ?auto_13508 ) ) ( not ( = ?auto_13506 ?auto_13509 ) ) ( not ( = ?auto_13507 ?auto_13508 ) ) ( not ( = ?auto_13507 ?auto_13509 ) ) ( not ( = ?auto_13508 ?auto_13509 ) ) ( ON ?auto_13508 ?auto_13507 ) ( CLEAR ?auto_13508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13506 ?auto_13507 )
      ( MAKE-1PILE ?auto_13506 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13510 - BLOCK
    )
    :vars
    (
      ?auto_13512 - BLOCK
      ?auto_13513 - BLOCK
      ?auto_13511 - BLOCK
      ?auto_13514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13512 ?auto_13510 ) ( ON-TABLE ?auto_13510 ) ( not ( = ?auto_13510 ?auto_13512 ) ) ( not ( = ?auto_13510 ?auto_13513 ) ) ( not ( = ?auto_13510 ?auto_13511 ) ) ( not ( = ?auto_13512 ?auto_13513 ) ) ( not ( = ?auto_13512 ?auto_13511 ) ) ( not ( = ?auto_13513 ?auto_13511 ) ) ( ON ?auto_13513 ?auto_13512 ) ( CLEAR ?auto_13513 ) ( HOLDING ?auto_13511 ) ( CLEAR ?auto_13514 ) ( ON-TABLE ?auto_13514 ) ( not ( = ?auto_13514 ?auto_13511 ) ) ( not ( = ?auto_13510 ?auto_13514 ) ) ( not ( = ?auto_13512 ?auto_13514 ) ) ( not ( = ?auto_13513 ?auto_13514 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13514 ?auto_13511 )
      ( MAKE-1PILE ?auto_13510 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13515 - BLOCK
    )
    :vars
    (
      ?auto_13519 - BLOCK
      ?auto_13517 - BLOCK
      ?auto_13518 - BLOCK
      ?auto_13516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13519 ?auto_13515 ) ( ON-TABLE ?auto_13515 ) ( not ( = ?auto_13515 ?auto_13519 ) ) ( not ( = ?auto_13515 ?auto_13517 ) ) ( not ( = ?auto_13515 ?auto_13518 ) ) ( not ( = ?auto_13519 ?auto_13517 ) ) ( not ( = ?auto_13519 ?auto_13518 ) ) ( not ( = ?auto_13517 ?auto_13518 ) ) ( ON ?auto_13517 ?auto_13519 ) ( CLEAR ?auto_13516 ) ( ON-TABLE ?auto_13516 ) ( not ( = ?auto_13516 ?auto_13518 ) ) ( not ( = ?auto_13515 ?auto_13516 ) ) ( not ( = ?auto_13519 ?auto_13516 ) ) ( not ( = ?auto_13517 ?auto_13516 ) ) ( ON ?auto_13518 ?auto_13517 ) ( CLEAR ?auto_13518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13515 ?auto_13519 ?auto_13517 )
      ( MAKE-1PILE ?auto_13515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13520 - BLOCK
    )
    :vars
    (
      ?auto_13522 - BLOCK
      ?auto_13524 - BLOCK
      ?auto_13523 - BLOCK
      ?auto_13521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13522 ?auto_13520 ) ( ON-TABLE ?auto_13520 ) ( not ( = ?auto_13520 ?auto_13522 ) ) ( not ( = ?auto_13520 ?auto_13524 ) ) ( not ( = ?auto_13520 ?auto_13523 ) ) ( not ( = ?auto_13522 ?auto_13524 ) ) ( not ( = ?auto_13522 ?auto_13523 ) ) ( not ( = ?auto_13524 ?auto_13523 ) ) ( ON ?auto_13524 ?auto_13522 ) ( not ( = ?auto_13521 ?auto_13523 ) ) ( not ( = ?auto_13520 ?auto_13521 ) ) ( not ( = ?auto_13522 ?auto_13521 ) ) ( not ( = ?auto_13524 ?auto_13521 ) ) ( ON ?auto_13523 ?auto_13524 ) ( CLEAR ?auto_13523 ) ( HOLDING ?auto_13521 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13521 )
      ( MAKE-1PILE ?auto_13520 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13525 - BLOCK
    )
    :vars
    (
      ?auto_13526 - BLOCK
      ?auto_13529 - BLOCK
      ?auto_13528 - BLOCK
      ?auto_13527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13526 ?auto_13525 ) ( ON-TABLE ?auto_13525 ) ( not ( = ?auto_13525 ?auto_13526 ) ) ( not ( = ?auto_13525 ?auto_13529 ) ) ( not ( = ?auto_13525 ?auto_13528 ) ) ( not ( = ?auto_13526 ?auto_13529 ) ) ( not ( = ?auto_13526 ?auto_13528 ) ) ( not ( = ?auto_13529 ?auto_13528 ) ) ( ON ?auto_13529 ?auto_13526 ) ( not ( = ?auto_13527 ?auto_13528 ) ) ( not ( = ?auto_13525 ?auto_13527 ) ) ( not ( = ?auto_13526 ?auto_13527 ) ) ( not ( = ?auto_13529 ?auto_13527 ) ) ( ON ?auto_13528 ?auto_13529 ) ( ON ?auto_13527 ?auto_13528 ) ( CLEAR ?auto_13527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13525 ?auto_13526 ?auto_13529 ?auto_13528 )
      ( MAKE-1PILE ?auto_13525 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13534 - BLOCK
      ?auto_13535 - BLOCK
      ?auto_13536 - BLOCK
      ?auto_13537 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13537 ) ( CLEAR ?auto_13536 ) ( ON-TABLE ?auto_13534 ) ( ON ?auto_13535 ?auto_13534 ) ( ON ?auto_13536 ?auto_13535 ) ( not ( = ?auto_13534 ?auto_13535 ) ) ( not ( = ?auto_13534 ?auto_13536 ) ) ( not ( = ?auto_13534 ?auto_13537 ) ) ( not ( = ?auto_13535 ?auto_13536 ) ) ( not ( = ?auto_13535 ?auto_13537 ) ) ( not ( = ?auto_13536 ?auto_13537 ) ) )
    :subtasks
    ( ( !STACK ?auto_13537 ?auto_13536 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13538 - BLOCK
      ?auto_13539 - BLOCK
      ?auto_13540 - BLOCK
      ?auto_13541 - BLOCK
    )
    :vars
    (
      ?auto_13542 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13540 ) ( ON-TABLE ?auto_13538 ) ( ON ?auto_13539 ?auto_13538 ) ( ON ?auto_13540 ?auto_13539 ) ( not ( = ?auto_13538 ?auto_13539 ) ) ( not ( = ?auto_13538 ?auto_13540 ) ) ( not ( = ?auto_13538 ?auto_13541 ) ) ( not ( = ?auto_13539 ?auto_13540 ) ) ( not ( = ?auto_13539 ?auto_13541 ) ) ( not ( = ?auto_13540 ?auto_13541 ) ) ( ON ?auto_13541 ?auto_13542 ) ( CLEAR ?auto_13541 ) ( HAND-EMPTY ) ( not ( = ?auto_13538 ?auto_13542 ) ) ( not ( = ?auto_13539 ?auto_13542 ) ) ( not ( = ?auto_13540 ?auto_13542 ) ) ( not ( = ?auto_13541 ?auto_13542 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13541 ?auto_13542 )
      ( MAKE-4PILE ?auto_13538 ?auto_13539 ?auto_13540 ?auto_13541 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13543 - BLOCK
      ?auto_13544 - BLOCK
      ?auto_13545 - BLOCK
      ?auto_13546 - BLOCK
    )
    :vars
    (
      ?auto_13547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13543 ) ( ON ?auto_13544 ?auto_13543 ) ( not ( = ?auto_13543 ?auto_13544 ) ) ( not ( = ?auto_13543 ?auto_13545 ) ) ( not ( = ?auto_13543 ?auto_13546 ) ) ( not ( = ?auto_13544 ?auto_13545 ) ) ( not ( = ?auto_13544 ?auto_13546 ) ) ( not ( = ?auto_13545 ?auto_13546 ) ) ( ON ?auto_13546 ?auto_13547 ) ( CLEAR ?auto_13546 ) ( not ( = ?auto_13543 ?auto_13547 ) ) ( not ( = ?auto_13544 ?auto_13547 ) ) ( not ( = ?auto_13545 ?auto_13547 ) ) ( not ( = ?auto_13546 ?auto_13547 ) ) ( HOLDING ?auto_13545 ) ( CLEAR ?auto_13544 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13543 ?auto_13544 ?auto_13545 )
      ( MAKE-4PILE ?auto_13543 ?auto_13544 ?auto_13545 ?auto_13546 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13548 - BLOCK
      ?auto_13549 - BLOCK
      ?auto_13550 - BLOCK
      ?auto_13551 - BLOCK
    )
    :vars
    (
      ?auto_13552 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13548 ) ( ON ?auto_13549 ?auto_13548 ) ( not ( = ?auto_13548 ?auto_13549 ) ) ( not ( = ?auto_13548 ?auto_13550 ) ) ( not ( = ?auto_13548 ?auto_13551 ) ) ( not ( = ?auto_13549 ?auto_13550 ) ) ( not ( = ?auto_13549 ?auto_13551 ) ) ( not ( = ?auto_13550 ?auto_13551 ) ) ( ON ?auto_13551 ?auto_13552 ) ( not ( = ?auto_13548 ?auto_13552 ) ) ( not ( = ?auto_13549 ?auto_13552 ) ) ( not ( = ?auto_13550 ?auto_13552 ) ) ( not ( = ?auto_13551 ?auto_13552 ) ) ( CLEAR ?auto_13549 ) ( ON ?auto_13550 ?auto_13551 ) ( CLEAR ?auto_13550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13552 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13552 ?auto_13551 )
      ( MAKE-4PILE ?auto_13548 ?auto_13549 ?auto_13550 ?auto_13551 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13553 - BLOCK
      ?auto_13554 - BLOCK
      ?auto_13555 - BLOCK
      ?auto_13556 - BLOCK
    )
    :vars
    (
      ?auto_13557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13553 ) ( not ( = ?auto_13553 ?auto_13554 ) ) ( not ( = ?auto_13553 ?auto_13555 ) ) ( not ( = ?auto_13553 ?auto_13556 ) ) ( not ( = ?auto_13554 ?auto_13555 ) ) ( not ( = ?auto_13554 ?auto_13556 ) ) ( not ( = ?auto_13555 ?auto_13556 ) ) ( ON ?auto_13556 ?auto_13557 ) ( not ( = ?auto_13553 ?auto_13557 ) ) ( not ( = ?auto_13554 ?auto_13557 ) ) ( not ( = ?auto_13555 ?auto_13557 ) ) ( not ( = ?auto_13556 ?auto_13557 ) ) ( ON ?auto_13555 ?auto_13556 ) ( CLEAR ?auto_13555 ) ( ON-TABLE ?auto_13557 ) ( HOLDING ?auto_13554 ) ( CLEAR ?auto_13553 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13553 ?auto_13554 )
      ( MAKE-4PILE ?auto_13553 ?auto_13554 ?auto_13555 ?auto_13556 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13558 - BLOCK
      ?auto_13559 - BLOCK
      ?auto_13560 - BLOCK
      ?auto_13561 - BLOCK
    )
    :vars
    (
      ?auto_13562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13558 ) ( not ( = ?auto_13558 ?auto_13559 ) ) ( not ( = ?auto_13558 ?auto_13560 ) ) ( not ( = ?auto_13558 ?auto_13561 ) ) ( not ( = ?auto_13559 ?auto_13560 ) ) ( not ( = ?auto_13559 ?auto_13561 ) ) ( not ( = ?auto_13560 ?auto_13561 ) ) ( ON ?auto_13561 ?auto_13562 ) ( not ( = ?auto_13558 ?auto_13562 ) ) ( not ( = ?auto_13559 ?auto_13562 ) ) ( not ( = ?auto_13560 ?auto_13562 ) ) ( not ( = ?auto_13561 ?auto_13562 ) ) ( ON ?auto_13560 ?auto_13561 ) ( ON-TABLE ?auto_13562 ) ( CLEAR ?auto_13558 ) ( ON ?auto_13559 ?auto_13560 ) ( CLEAR ?auto_13559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13562 ?auto_13561 ?auto_13560 )
      ( MAKE-4PILE ?auto_13558 ?auto_13559 ?auto_13560 ?auto_13561 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13563 - BLOCK
      ?auto_13564 - BLOCK
      ?auto_13565 - BLOCK
      ?auto_13566 - BLOCK
    )
    :vars
    (
      ?auto_13567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13563 ?auto_13564 ) ) ( not ( = ?auto_13563 ?auto_13565 ) ) ( not ( = ?auto_13563 ?auto_13566 ) ) ( not ( = ?auto_13564 ?auto_13565 ) ) ( not ( = ?auto_13564 ?auto_13566 ) ) ( not ( = ?auto_13565 ?auto_13566 ) ) ( ON ?auto_13566 ?auto_13567 ) ( not ( = ?auto_13563 ?auto_13567 ) ) ( not ( = ?auto_13564 ?auto_13567 ) ) ( not ( = ?auto_13565 ?auto_13567 ) ) ( not ( = ?auto_13566 ?auto_13567 ) ) ( ON ?auto_13565 ?auto_13566 ) ( ON-TABLE ?auto_13567 ) ( ON ?auto_13564 ?auto_13565 ) ( CLEAR ?auto_13564 ) ( HOLDING ?auto_13563 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13563 )
      ( MAKE-4PILE ?auto_13563 ?auto_13564 ?auto_13565 ?auto_13566 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13568 - BLOCK
      ?auto_13569 - BLOCK
      ?auto_13570 - BLOCK
      ?auto_13571 - BLOCK
    )
    :vars
    (
      ?auto_13572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13568 ?auto_13569 ) ) ( not ( = ?auto_13568 ?auto_13570 ) ) ( not ( = ?auto_13568 ?auto_13571 ) ) ( not ( = ?auto_13569 ?auto_13570 ) ) ( not ( = ?auto_13569 ?auto_13571 ) ) ( not ( = ?auto_13570 ?auto_13571 ) ) ( ON ?auto_13571 ?auto_13572 ) ( not ( = ?auto_13568 ?auto_13572 ) ) ( not ( = ?auto_13569 ?auto_13572 ) ) ( not ( = ?auto_13570 ?auto_13572 ) ) ( not ( = ?auto_13571 ?auto_13572 ) ) ( ON ?auto_13570 ?auto_13571 ) ( ON-TABLE ?auto_13572 ) ( ON ?auto_13569 ?auto_13570 ) ( ON ?auto_13568 ?auto_13569 ) ( CLEAR ?auto_13568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13572 ?auto_13571 ?auto_13570 ?auto_13569 )
      ( MAKE-4PILE ?auto_13568 ?auto_13569 ?auto_13570 ?auto_13571 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13576 - BLOCK
      ?auto_13577 - BLOCK
      ?auto_13578 - BLOCK
    )
    :vars
    (
      ?auto_13579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13579 ?auto_13578 ) ( CLEAR ?auto_13579 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13576 ) ( ON ?auto_13577 ?auto_13576 ) ( ON ?auto_13578 ?auto_13577 ) ( not ( = ?auto_13576 ?auto_13577 ) ) ( not ( = ?auto_13576 ?auto_13578 ) ) ( not ( = ?auto_13576 ?auto_13579 ) ) ( not ( = ?auto_13577 ?auto_13578 ) ) ( not ( = ?auto_13577 ?auto_13579 ) ) ( not ( = ?auto_13578 ?auto_13579 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13579 ?auto_13578 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13589 - BLOCK
      ?auto_13590 - BLOCK
      ?auto_13591 - BLOCK
    )
    :vars
    (
      ?auto_13592 - BLOCK
      ?auto_13593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13589 ) ( ON ?auto_13590 ?auto_13589 ) ( not ( = ?auto_13589 ?auto_13590 ) ) ( not ( = ?auto_13589 ?auto_13591 ) ) ( not ( = ?auto_13589 ?auto_13592 ) ) ( not ( = ?auto_13590 ?auto_13591 ) ) ( not ( = ?auto_13590 ?auto_13592 ) ) ( not ( = ?auto_13591 ?auto_13592 ) ) ( ON ?auto_13592 ?auto_13593 ) ( CLEAR ?auto_13592 ) ( not ( = ?auto_13589 ?auto_13593 ) ) ( not ( = ?auto_13590 ?auto_13593 ) ) ( not ( = ?auto_13591 ?auto_13593 ) ) ( not ( = ?auto_13592 ?auto_13593 ) ) ( HOLDING ?auto_13591 ) ( CLEAR ?auto_13590 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13589 ?auto_13590 ?auto_13591 ?auto_13592 )
      ( MAKE-3PILE ?auto_13589 ?auto_13590 ?auto_13591 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13594 - BLOCK
      ?auto_13595 - BLOCK
      ?auto_13596 - BLOCK
    )
    :vars
    (
      ?auto_13598 - BLOCK
      ?auto_13597 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13594 ) ( ON ?auto_13595 ?auto_13594 ) ( not ( = ?auto_13594 ?auto_13595 ) ) ( not ( = ?auto_13594 ?auto_13596 ) ) ( not ( = ?auto_13594 ?auto_13598 ) ) ( not ( = ?auto_13595 ?auto_13596 ) ) ( not ( = ?auto_13595 ?auto_13598 ) ) ( not ( = ?auto_13596 ?auto_13598 ) ) ( ON ?auto_13598 ?auto_13597 ) ( not ( = ?auto_13594 ?auto_13597 ) ) ( not ( = ?auto_13595 ?auto_13597 ) ) ( not ( = ?auto_13596 ?auto_13597 ) ) ( not ( = ?auto_13598 ?auto_13597 ) ) ( CLEAR ?auto_13595 ) ( ON ?auto_13596 ?auto_13598 ) ( CLEAR ?auto_13596 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13597 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13597 ?auto_13598 )
      ( MAKE-3PILE ?auto_13594 ?auto_13595 ?auto_13596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13599 - BLOCK
      ?auto_13600 - BLOCK
      ?auto_13601 - BLOCK
    )
    :vars
    (
      ?auto_13602 - BLOCK
      ?auto_13603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13599 ) ( not ( = ?auto_13599 ?auto_13600 ) ) ( not ( = ?auto_13599 ?auto_13601 ) ) ( not ( = ?auto_13599 ?auto_13602 ) ) ( not ( = ?auto_13600 ?auto_13601 ) ) ( not ( = ?auto_13600 ?auto_13602 ) ) ( not ( = ?auto_13601 ?auto_13602 ) ) ( ON ?auto_13602 ?auto_13603 ) ( not ( = ?auto_13599 ?auto_13603 ) ) ( not ( = ?auto_13600 ?auto_13603 ) ) ( not ( = ?auto_13601 ?auto_13603 ) ) ( not ( = ?auto_13602 ?auto_13603 ) ) ( ON ?auto_13601 ?auto_13602 ) ( CLEAR ?auto_13601 ) ( ON-TABLE ?auto_13603 ) ( HOLDING ?auto_13600 ) ( CLEAR ?auto_13599 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13599 ?auto_13600 )
      ( MAKE-3PILE ?auto_13599 ?auto_13600 ?auto_13601 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13604 - BLOCK
      ?auto_13605 - BLOCK
      ?auto_13606 - BLOCK
    )
    :vars
    (
      ?auto_13608 - BLOCK
      ?auto_13607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13604 ) ( not ( = ?auto_13604 ?auto_13605 ) ) ( not ( = ?auto_13604 ?auto_13606 ) ) ( not ( = ?auto_13604 ?auto_13608 ) ) ( not ( = ?auto_13605 ?auto_13606 ) ) ( not ( = ?auto_13605 ?auto_13608 ) ) ( not ( = ?auto_13606 ?auto_13608 ) ) ( ON ?auto_13608 ?auto_13607 ) ( not ( = ?auto_13604 ?auto_13607 ) ) ( not ( = ?auto_13605 ?auto_13607 ) ) ( not ( = ?auto_13606 ?auto_13607 ) ) ( not ( = ?auto_13608 ?auto_13607 ) ) ( ON ?auto_13606 ?auto_13608 ) ( ON-TABLE ?auto_13607 ) ( CLEAR ?auto_13604 ) ( ON ?auto_13605 ?auto_13606 ) ( CLEAR ?auto_13605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13607 ?auto_13608 ?auto_13606 )
      ( MAKE-3PILE ?auto_13604 ?auto_13605 ?auto_13606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13609 - BLOCK
      ?auto_13610 - BLOCK
      ?auto_13611 - BLOCK
    )
    :vars
    (
      ?auto_13612 - BLOCK
      ?auto_13613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13609 ?auto_13610 ) ) ( not ( = ?auto_13609 ?auto_13611 ) ) ( not ( = ?auto_13609 ?auto_13612 ) ) ( not ( = ?auto_13610 ?auto_13611 ) ) ( not ( = ?auto_13610 ?auto_13612 ) ) ( not ( = ?auto_13611 ?auto_13612 ) ) ( ON ?auto_13612 ?auto_13613 ) ( not ( = ?auto_13609 ?auto_13613 ) ) ( not ( = ?auto_13610 ?auto_13613 ) ) ( not ( = ?auto_13611 ?auto_13613 ) ) ( not ( = ?auto_13612 ?auto_13613 ) ) ( ON ?auto_13611 ?auto_13612 ) ( ON-TABLE ?auto_13613 ) ( ON ?auto_13610 ?auto_13611 ) ( CLEAR ?auto_13610 ) ( HOLDING ?auto_13609 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13609 )
      ( MAKE-3PILE ?auto_13609 ?auto_13610 ?auto_13611 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13614 - BLOCK
      ?auto_13615 - BLOCK
      ?auto_13616 - BLOCK
    )
    :vars
    (
      ?auto_13618 - BLOCK
      ?auto_13617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13614 ?auto_13615 ) ) ( not ( = ?auto_13614 ?auto_13616 ) ) ( not ( = ?auto_13614 ?auto_13618 ) ) ( not ( = ?auto_13615 ?auto_13616 ) ) ( not ( = ?auto_13615 ?auto_13618 ) ) ( not ( = ?auto_13616 ?auto_13618 ) ) ( ON ?auto_13618 ?auto_13617 ) ( not ( = ?auto_13614 ?auto_13617 ) ) ( not ( = ?auto_13615 ?auto_13617 ) ) ( not ( = ?auto_13616 ?auto_13617 ) ) ( not ( = ?auto_13618 ?auto_13617 ) ) ( ON ?auto_13616 ?auto_13618 ) ( ON-TABLE ?auto_13617 ) ( ON ?auto_13615 ?auto_13616 ) ( ON ?auto_13614 ?auto_13615 ) ( CLEAR ?auto_13614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13617 ?auto_13618 ?auto_13616 ?auto_13615 )
      ( MAKE-3PILE ?auto_13614 ?auto_13615 ?auto_13616 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13620 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13620 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_13620 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13621 - BLOCK
    )
    :vars
    (
      ?auto_13622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13621 ?auto_13622 ) ( CLEAR ?auto_13621 ) ( HAND-EMPTY ) ( not ( = ?auto_13621 ?auto_13622 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13621 ?auto_13622 )
      ( MAKE-1PILE ?auto_13621 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13623 - BLOCK
    )
    :vars
    (
      ?auto_13624 - BLOCK
      ?auto_13626 - BLOCK
      ?auto_13625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13623 ?auto_13624 ) ) ( HOLDING ?auto_13623 ) ( CLEAR ?auto_13624 ) ( ON-TABLE ?auto_13626 ) ( ON ?auto_13625 ?auto_13626 ) ( ON ?auto_13624 ?auto_13625 ) ( not ( = ?auto_13626 ?auto_13625 ) ) ( not ( = ?auto_13626 ?auto_13624 ) ) ( not ( = ?auto_13626 ?auto_13623 ) ) ( not ( = ?auto_13625 ?auto_13624 ) ) ( not ( = ?auto_13625 ?auto_13623 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13626 ?auto_13625 ?auto_13624 ?auto_13623 )
      ( MAKE-1PILE ?auto_13623 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13627 - BLOCK
    )
    :vars
    (
      ?auto_13629 - BLOCK
      ?auto_13630 - BLOCK
      ?auto_13628 - BLOCK
      ?auto_13631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13627 ?auto_13629 ) ) ( CLEAR ?auto_13629 ) ( ON-TABLE ?auto_13630 ) ( ON ?auto_13628 ?auto_13630 ) ( ON ?auto_13629 ?auto_13628 ) ( not ( = ?auto_13630 ?auto_13628 ) ) ( not ( = ?auto_13630 ?auto_13629 ) ) ( not ( = ?auto_13630 ?auto_13627 ) ) ( not ( = ?auto_13628 ?auto_13629 ) ) ( not ( = ?auto_13628 ?auto_13627 ) ) ( ON ?auto_13627 ?auto_13631 ) ( CLEAR ?auto_13627 ) ( HAND-EMPTY ) ( not ( = ?auto_13627 ?auto_13631 ) ) ( not ( = ?auto_13629 ?auto_13631 ) ) ( not ( = ?auto_13630 ?auto_13631 ) ) ( not ( = ?auto_13628 ?auto_13631 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13627 ?auto_13631 )
      ( MAKE-1PILE ?auto_13627 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13632 - BLOCK
    )
    :vars
    (
      ?auto_13633 - BLOCK
      ?auto_13636 - BLOCK
      ?auto_13635 - BLOCK
      ?auto_13634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13632 ?auto_13633 ) ) ( ON-TABLE ?auto_13636 ) ( ON ?auto_13635 ?auto_13636 ) ( not ( = ?auto_13636 ?auto_13635 ) ) ( not ( = ?auto_13636 ?auto_13633 ) ) ( not ( = ?auto_13636 ?auto_13632 ) ) ( not ( = ?auto_13635 ?auto_13633 ) ) ( not ( = ?auto_13635 ?auto_13632 ) ) ( ON ?auto_13632 ?auto_13634 ) ( CLEAR ?auto_13632 ) ( not ( = ?auto_13632 ?auto_13634 ) ) ( not ( = ?auto_13633 ?auto_13634 ) ) ( not ( = ?auto_13636 ?auto_13634 ) ) ( not ( = ?auto_13635 ?auto_13634 ) ) ( HOLDING ?auto_13633 ) ( CLEAR ?auto_13635 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13636 ?auto_13635 ?auto_13633 )
      ( MAKE-1PILE ?auto_13632 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13637 - BLOCK
    )
    :vars
    (
      ?auto_13638 - BLOCK
      ?auto_13641 - BLOCK
      ?auto_13639 - BLOCK
      ?auto_13640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13637 ?auto_13638 ) ) ( ON-TABLE ?auto_13641 ) ( ON ?auto_13639 ?auto_13641 ) ( not ( = ?auto_13641 ?auto_13639 ) ) ( not ( = ?auto_13641 ?auto_13638 ) ) ( not ( = ?auto_13641 ?auto_13637 ) ) ( not ( = ?auto_13639 ?auto_13638 ) ) ( not ( = ?auto_13639 ?auto_13637 ) ) ( ON ?auto_13637 ?auto_13640 ) ( not ( = ?auto_13637 ?auto_13640 ) ) ( not ( = ?auto_13638 ?auto_13640 ) ) ( not ( = ?auto_13641 ?auto_13640 ) ) ( not ( = ?auto_13639 ?auto_13640 ) ) ( CLEAR ?auto_13639 ) ( ON ?auto_13638 ?auto_13637 ) ( CLEAR ?auto_13638 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13640 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13640 ?auto_13637 )
      ( MAKE-1PILE ?auto_13637 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13642 - BLOCK
    )
    :vars
    (
      ?auto_13645 - BLOCK
      ?auto_13644 - BLOCK
      ?auto_13643 - BLOCK
      ?auto_13646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13642 ?auto_13645 ) ) ( ON-TABLE ?auto_13644 ) ( not ( = ?auto_13644 ?auto_13643 ) ) ( not ( = ?auto_13644 ?auto_13645 ) ) ( not ( = ?auto_13644 ?auto_13642 ) ) ( not ( = ?auto_13643 ?auto_13645 ) ) ( not ( = ?auto_13643 ?auto_13642 ) ) ( ON ?auto_13642 ?auto_13646 ) ( not ( = ?auto_13642 ?auto_13646 ) ) ( not ( = ?auto_13645 ?auto_13646 ) ) ( not ( = ?auto_13644 ?auto_13646 ) ) ( not ( = ?auto_13643 ?auto_13646 ) ) ( ON ?auto_13645 ?auto_13642 ) ( CLEAR ?auto_13645 ) ( ON-TABLE ?auto_13646 ) ( HOLDING ?auto_13643 ) ( CLEAR ?auto_13644 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13644 ?auto_13643 )
      ( MAKE-1PILE ?auto_13642 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13647 - BLOCK
    )
    :vars
    (
      ?auto_13650 - BLOCK
      ?auto_13648 - BLOCK
      ?auto_13651 - BLOCK
      ?auto_13649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13647 ?auto_13650 ) ) ( ON-TABLE ?auto_13648 ) ( not ( = ?auto_13648 ?auto_13651 ) ) ( not ( = ?auto_13648 ?auto_13650 ) ) ( not ( = ?auto_13648 ?auto_13647 ) ) ( not ( = ?auto_13651 ?auto_13650 ) ) ( not ( = ?auto_13651 ?auto_13647 ) ) ( ON ?auto_13647 ?auto_13649 ) ( not ( = ?auto_13647 ?auto_13649 ) ) ( not ( = ?auto_13650 ?auto_13649 ) ) ( not ( = ?auto_13648 ?auto_13649 ) ) ( not ( = ?auto_13651 ?auto_13649 ) ) ( ON ?auto_13650 ?auto_13647 ) ( ON-TABLE ?auto_13649 ) ( CLEAR ?auto_13648 ) ( ON ?auto_13651 ?auto_13650 ) ( CLEAR ?auto_13651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13649 ?auto_13647 ?auto_13650 )
      ( MAKE-1PILE ?auto_13647 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13652 - BLOCK
    )
    :vars
    (
      ?auto_13656 - BLOCK
      ?auto_13654 - BLOCK
      ?auto_13653 - BLOCK
      ?auto_13655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13652 ?auto_13656 ) ) ( not ( = ?auto_13654 ?auto_13653 ) ) ( not ( = ?auto_13654 ?auto_13656 ) ) ( not ( = ?auto_13654 ?auto_13652 ) ) ( not ( = ?auto_13653 ?auto_13656 ) ) ( not ( = ?auto_13653 ?auto_13652 ) ) ( ON ?auto_13652 ?auto_13655 ) ( not ( = ?auto_13652 ?auto_13655 ) ) ( not ( = ?auto_13656 ?auto_13655 ) ) ( not ( = ?auto_13654 ?auto_13655 ) ) ( not ( = ?auto_13653 ?auto_13655 ) ) ( ON ?auto_13656 ?auto_13652 ) ( ON-TABLE ?auto_13655 ) ( ON ?auto_13653 ?auto_13656 ) ( CLEAR ?auto_13653 ) ( HOLDING ?auto_13654 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13654 )
      ( MAKE-1PILE ?auto_13652 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13657 - BLOCK
    )
    :vars
    (
      ?auto_13660 - BLOCK
      ?auto_13658 - BLOCK
      ?auto_13661 - BLOCK
      ?auto_13659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13657 ?auto_13660 ) ) ( not ( = ?auto_13658 ?auto_13661 ) ) ( not ( = ?auto_13658 ?auto_13660 ) ) ( not ( = ?auto_13658 ?auto_13657 ) ) ( not ( = ?auto_13661 ?auto_13660 ) ) ( not ( = ?auto_13661 ?auto_13657 ) ) ( ON ?auto_13657 ?auto_13659 ) ( not ( = ?auto_13657 ?auto_13659 ) ) ( not ( = ?auto_13660 ?auto_13659 ) ) ( not ( = ?auto_13658 ?auto_13659 ) ) ( not ( = ?auto_13661 ?auto_13659 ) ) ( ON ?auto_13660 ?auto_13657 ) ( ON-TABLE ?auto_13659 ) ( ON ?auto_13661 ?auto_13660 ) ( ON ?auto_13658 ?auto_13661 ) ( CLEAR ?auto_13658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13659 ?auto_13657 ?auto_13660 ?auto_13661 )
      ( MAKE-1PILE ?auto_13657 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13664 - BLOCK
      ?auto_13665 - BLOCK
    )
    :vars
    (
      ?auto_13666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13666 ?auto_13665 ) ( CLEAR ?auto_13666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13664 ) ( ON ?auto_13665 ?auto_13664 ) ( not ( = ?auto_13664 ?auto_13665 ) ) ( not ( = ?auto_13664 ?auto_13666 ) ) ( not ( = ?auto_13665 ?auto_13666 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13666 ?auto_13665 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13667 - BLOCK
      ?auto_13668 - BLOCK
    )
    :vars
    (
      ?auto_13669 - BLOCK
      ?auto_13670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13669 ?auto_13668 ) ( CLEAR ?auto_13669 ) ( ON-TABLE ?auto_13667 ) ( ON ?auto_13668 ?auto_13667 ) ( not ( = ?auto_13667 ?auto_13668 ) ) ( not ( = ?auto_13667 ?auto_13669 ) ) ( not ( = ?auto_13668 ?auto_13669 ) ) ( HOLDING ?auto_13670 ) ( not ( = ?auto_13667 ?auto_13670 ) ) ( not ( = ?auto_13668 ?auto_13670 ) ) ( not ( = ?auto_13669 ?auto_13670 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_13670 )
      ( MAKE-2PILE ?auto_13667 ?auto_13668 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13671 - BLOCK
      ?auto_13672 - BLOCK
    )
    :vars
    (
      ?auto_13674 - BLOCK
      ?auto_13673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13674 ?auto_13672 ) ( ON-TABLE ?auto_13671 ) ( ON ?auto_13672 ?auto_13671 ) ( not ( = ?auto_13671 ?auto_13672 ) ) ( not ( = ?auto_13671 ?auto_13674 ) ) ( not ( = ?auto_13672 ?auto_13674 ) ) ( not ( = ?auto_13671 ?auto_13673 ) ) ( not ( = ?auto_13672 ?auto_13673 ) ) ( not ( = ?auto_13674 ?auto_13673 ) ) ( ON ?auto_13673 ?auto_13674 ) ( CLEAR ?auto_13673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13671 ?auto_13672 ?auto_13674 )
      ( MAKE-2PILE ?auto_13671 ?auto_13672 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13675 - BLOCK
      ?auto_13676 - BLOCK
    )
    :vars
    (
      ?auto_13678 - BLOCK
      ?auto_13677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13678 ?auto_13676 ) ( ON-TABLE ?auto_13675 ) ( ON ?auto_13676 ?auto_13675 ) ( not ( = ?auto_13675 ?auto_13676 ) ) ( not ( = ?auto_13675 ?auto_13678 ) ) ( not ( = ?auto_13676 ?auto_13678 ) ) ( not ( = ?auto_13675 ?auto_13677 ) ) ( not ( = ?auto_13676 ?auto_13677 ) ) ( not ( = ?auto_13678 ?auto_13677 ) ) ( HOLDING ?auto_13677 ) ( CLEAR ?auto_13678 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13675 ?auto_13676 ?auto_13678 ?auto_13677 )
      ( MAKE-2PILE ?auto_13675 ?auto_13676 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13679 - BLOCK
      ?auto_13680 - BLOCK
    )
    :vars
    (
      ?auto_13681 - BLOCK
      ?auto_13682 - BLOCK
      ?auto_13683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13681 ?auto_13680 ) ( ON-TABLE ?auto_13679 ) ( ON ?auto_13680 ?auto_13679 ) ( not ( = ?auto_13679 ?auto_13680 ) ) ( not ( = ?auto_13679 ?auto_13681 ) ) ( not ( = ?auto_13680 ?auto_13681 ) ) ( not ( = ?auto_13679 ?auto_13682 ) ) ( not ( = ?auto_13680 ?auto_13682 ) ) ( not ( = ?auto_13681 ?auto_13682 ) ) ( CLEAR ?auto_13681 ) ( ON ?auto_13682 ?auto_13683 ) ( CLEAR ?auto_13682 ) ( HAND-EMPTY ) ( not ( = ?auto_13679 ?auto_13683 ) ) ( not ( = ?auto_13680 ?auto_13683 ) ) ( not ( = ?auto_13681 ?auto_13683 ) ) ( not ( = ?auto_13682 ?auto_13683 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13682 ?auto_13683 )
      ( MAKE-2PILE ?auto_13679 ?auto_13680 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13694 - BLOCK
      ?auto_13695 - BLOCK
    )
    :vars
    (
      ?auto_13698 - BLOCK
      ?auto_13696 - BLOCK
      ?auto_13697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13694 ) ( not ( = ?auto_13694 ?auto_13695 ) ) ( not ( = ?auto_13694 ?auto_13698 ) ) ( not ( = ?auto_13695 ?auto_13698 ) ) ( not ( = ?auto_13694 ?auto_13696 ) ) ( not ( = ?auto_13695 ?auto_13696 ) ) ( not ( = ?auto_13698 ?auto_13696 ) ) ( ON ?auto_13696 ?auto_13697 ) ( not ( = ?auto_13694 ?auto_13697 ) ) ( not ( = ?auto_13695 ?auto_13697 ) ) ( not ( = ?auto_13698 ?auto_13697 ) ) ( not ( = ?auto_13696 ?auto_13697 ) ) ( ON ?auto_13698 ?auto_13696 ) ( CLEAR ?auto_13698 ) ( HOLDING ?auto_13695 ) ( CLEAR ?auto_13694 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13694 ?auto_13695 ?auto_13698 )
      ( MAKE-2PILE ?auto_13694 ?auto_13695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13699 - BLOCK
      ?auto_13700 - BLOCK
    )
    :vars
    (
      ?auto_13701 - BLOCK
      ?auto_13702 - BLOCK
      ?auto_13703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13699 ) ( not ( = ?auto_13699 ?auto_13700 ) ) ( not ( = ?auto_13699 ?auto_13701 ) ) ( not ( = ?auto_13700 ?auto_13701 ) ) ( not ( = ?auto_13699 ?auto_13702 ) ) ( not ( = ?auto_13700 ?auto_13702 ) ) ( not ( = ?auto_13701 ?auto_13702 ) ) ( ON ?auto_13702 ?auto_13703 ) ( not ( = ?auto_13699 ?auto_13703 ) ) ( not ( = ?auto_13700 ?auto_13703 ) ) ( not ( = ?auto_13701 ?auto_13703 ) ) ( not ( = ?auto_13702 ?auto_13703 ) ) ( ON ?auto_13701 ?auto_13702 ) ( CLEAR ?auto_13699 ) ( ON ?auto_13700 ?auto_13701 ) ( CLEAR ?auto_13700 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13703 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13703 ?auto_13702 ?auto_13701 )
      ( MAKE-2PILE ?auto_13699 ?auto_13700 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13704 - BLOCK
      ?auto_13705 - BLOCK
    )
    :vars
    (
      ?auto_13708 - BLOCK
      ?auto_13706 - BLOCK
      ?auto_13707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13704 ?auto_13705 ) ) ( not ( = ?auto_13704 ?auto_13708 ) ) ( not ( = ?auto_13705 ?auto_13708 ) ) ( not ( = ?auto_13704 ?auto_13706 ) ) ( not ( = ?auto_13705 ?auto_13706 ) ) ( not ( = ?auto_13708 ?auto_13706 ) ) ( ON ?auto_13706 ?auto_13707 ) ( not ( = ?auto_13704 ?auto_13707 ) ) ( not ( = ?auto_13705 ?auto_13707 ) ) ( not ( = ?auto_13708 ?auto_13707 ) ) ( not ( = ?auto_13706 ?auto_13707 ) ) ( ON ?auto_13708 ?auto_13706 ) ( ON ?auto_13705 ?auto_13708 ) ( CLEAR ?auto_13705 ) ( ON-TABLE ?auto_13707 ) ( HOLDING ?auto_13704 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13704 )
      ( MAKE-2PILE ?auto_13704 ?auto_13705 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13709 - BLOCK
      ?auto_13710 - BLOCK
    )
    :vars
    (
      ?auto_13712 - BLOCK
      ?auto_13711 - BLOCK
      ?auto_13713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13709 ?auto_13710 ) ) ( not ( = ?auto_13709 ?auto_13712 ) ) ( not ( = ?auto_13710 ?auto_13712 ) ) ( not ( = ?auto_13709 ?auto_13711 ) ) ( not ( = ?auto_13710 ?auto_13711 ) ) ( not ( = ?auto_13712 ?auto_13711 ) ) ( ON ?auto_13711 ?auto_13713 ) ( not ( = ?auto_13709 ?auto_13713 ) ) ( not ( = ?auto_13710 ?auto_13713 ) ) ( not ( = ?auto_13712 ?auto_13713 ) ) ( not ( = ?auto_13711 ?auto_13713 ) ) ( ON ?auto_13712 ?auto_13711 ) ( ON ?auto_13710 ?auto_13712 ) ( ON-TABLE ?auto_13713 ) ( ON ?auto_13709 ?auto_13710 ) ( CLEAR ?auto_13709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13713 ?auto_13711 ?auto_13712 ?auto_13710 )
      ( MAKE-2PILE ?auto_13709 ?auto_13710 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13716 - BLOCK
      ?auto_13717 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13717 ) ( CLEAR ?auto_13716 ) ( ON-TABLE ?auto_13716 ) ( not ( = ?auto_13716 ?auto_13717 ) ) )
    :subtasks
    ( ( !STACK ?auto_13717 ?auto_13716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13718 - BLOCK
      ?auto_13719 - BLOCK
    )
    :vars
    (
      ?auto_13720 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13718 ) ( ON-TABLE ?auto_13718 ) ( not ( = ?auto_13718 ?auto_13719 ) ) ( ON ?auto_13719 ?auto_13720 ) ( CLEAR ?auto_13719 ) ( HAND-EMPTY ) ( not ( = ?auto_13718 ?auto_13720 ) ) ( not ( = ?auto_13719 ?auto_13720 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13719 ?auto_13720 )
      ( MAKE-2PILE ?auto_13718 ?auto_13719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13721 - BLOCK
      ?auto_13722 - BLOCK
    )
    :vars
    (
      ?auto_13723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13721 ?auto_13722 ) ) ( ON ?auto_13722 ?auto_13723 ) ( CLEAR ?auto_13722 ) ( not ( = ?auto_13721 ?auto_13723 ) ) ( not ( = ?auto_13722 ?auto_13723 ) ) ( HOLDING ?auto_13721 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13721 )
      ( MAKE-2PILE ?auto_13721 ?auto_13722 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13724 - BLOCK
      ?auto_13725 - BLOCK
    )
    :vars
    (
      ?auto_13726 - BLOCK
      ?auto_13727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13724 ?auto_13725 ) ) ( ON ?auto_13725 ?auto_13726 ) ( not ( = ?auto_13724 ?auto_13726 ) ) ( not ( = ?auto_13725 ?auto_13726 ) ) ( ON ?auto_13724 ?auto_13725 ) ( CLEAR ?auto_13724 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13727 ) ( ON ?auto_13726 ?auto_13727 ) ( not ( = ?auto_13727 ?auto_13726 ) ) ( not ( = ?auto_13727 ?auto_13725 ) ) ( not ( = ?auto_13727 ?auto_13724 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13727 ?auto_13726 ?auto_13725 )
      ( MAKE-2PILE ?auto_13724 ?auto_13725 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13728 - BLOCK
      ?auto_13729 - BLOCK
    )
    :vars
    (
      ?auto_13731 - BLOCK
      ?auto_13730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13728 ?auto_13729 ) ) ( ON ?auto_13729 ?auto_13731 ) ( not ( = ?auto_13728 ?auto_13731 ) ) ( not ( = ?auto_13729 ?auto_13731 ) ) ( ON-TABLE ?auto_13730 ) ( ON ?auto_13731 ?auto_13730 ) ( not ( = ?auto_13730 ?auto_13731 ) ) ( not ( = ?auto_13730 ?auto_13729 ) ) ( not ( = ?auto_13730 ?auto_13728 ) ) ( HOLDING ?auto_13728 ) ( CLEAR ?auto_13729 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13730 ?auto_13731 ?auto_13729 ?auto_13728 )
      ( MAKE-2PILE ?auto_13728 ?auto_13729 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13732 - BLOCK
      ?auto_13733 - BLOCK
    )
    :vars
    (
      ?auto_13734 - BLOCK
      ?auto_13735 - BLOCK
      ?auto_13736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13732 ?auto_13733 ) ) ( ON ?auto_13733 ?auto_13734 ) ( not ( = ?auto_13732 ?auto_13734 ) ) ( not ( = ?auto_13733 ?auto_13734 ) ) ( ON-TABLE ?auto_13735 ) ( ON ?auto_13734 ?auto_13735 ) ( not ( = ?auto_13735 ?auto_13734 ) ) ( not ( = ?auto_13735 ?auto_13733 ) ) ( not ( = ?auto_13735 ?auto_13732 ) ) ( CLEAR ?auto_13733 ) ( ON ?auto_13732 ?auto_13736 ) ( CLEAR ?auto_13732 ) ( HAND-EMPTY ) ( not ( = ?auto_13732 ?auto_13736 ) ) ( not ( = ?auto_13733 ?auto_13736 ) ) ( not ( = ?auto_13734 ?auto_13736 ) ) ( not ( = ?auto_13735 ?auto_13736 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13732 ?auto_13736 )
      ( MAKE-2PILE ?auto_13732 ?auto_13733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13737 - BLOCK
      ?auto_13738 - BLOCK
    )
    :vars
    (
      ?auto_13741 - BLOCK
      ?auto_13740 - BLOCK
      ?auto_13739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13737 ?auto_13738 ) ) ( not ( = ?auto_13737 ?auto_13741 ) ) ( not ( = ?auto_13738 ?auto_13741 ) ) ( ON-TABLE ?auto_13740 ) ( ON ?auto_13741 ?auto_13740 ) ( not ( = ?auto_13740 ?auto_13741 ) ) ( not ( = ?auto_13740 ?auto_13738 ) ) ( not ( = ?auto_13740 ?auto_13737 ) ) ( ON ?auto_13737 ?auto_13739 ) ( CLEAR ?auto_13737 ) ( not ( = ?auto_13737 ?auto_13739 ) ) ( not ( = ?auto_13738 ?auto_13739 ) ) ( not ( = ?auto_13741 ?auto_13739 ) ) ( not ( = ?auto_13740 ?auto_13739 ) ) ( HOLDING ?auto_13738 ) ( CLEAR ?auto_13741 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13740 ?auto_13741 ?auto_13738 )
      ( MAKE-2PILE ?auto_13737 ?auto_13738 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13742 - BLOCK
      ?auto_13743 - BLOCK
    )
    :vars
    (
      ?auto_13744 - BLOCK
      ?auto_13746 - BLOCK
      ?auto_13745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13742 ?auto_13743 ) ) ( not ( = ?auto_13742 ?auto_13744 ) ) ( not ( = ?auto_13743 ?auto_13744 ) ) ( ON-TABLE ?auto_13746 ) ( ON ?auto_13744 ?auto_13746 ) ( not ( = ?auto_13746 ?auto_13744 ) ) ( not ( = ?auto_13746 ?auto_13743 ) ) ( not ( = ?auto_13746 ?auto_13742 ) ) ( ON ?auto_13742 ?auto_13745 ) ( not ( = ?auto_13742 ?auto_13745 ) ) ( not ( = ?auto_13743 ?auto_13745 ) ) ( not ( = ?auto_13744 ?auto_13745 ) ) ( not ( = ?auto_13746 ?auto_13745 ) ) ( CLEAR ?auto_13744 ) ( ON ?auto_13743 ?auto_13742 ) ( CLEAR ?auto_13743 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13745 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13745 ?auto_13742 )
      ( MAKE-2PILE ?auto_13742 ?auto_13743 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13747 - BLOCK
      ?auto_13748 - BLOCK
    )
    :vars
    (
      ?auto_13751 - BLOCK
      ?auto_13750 - BLOCK
      ?auto_13749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13747 ?auto_13748 ) ) ( not ( = ?auto_13747 ?auto_13751 ) ) ( not ( = ?auto_13748 ?auto_13751 ) ) ( ON-TABLE ?auto_13750 ) ( not ( = ?auto_13750 ?auto_13751 ) ) ( not ( = ?auto_13750 ?auto_13748 ) ) ( not ( = ?auto_13750 ?auto_13747 ) ) ( ON ?auto_13747 ?auto_13749 ) ( not ( = ?auto_13747 ?auto_13749 ) ) ( not ( = ?auto_13748 ?auto_13749 ) ) ( not ( = ?auto_13751 ?auto_13749 ) ) ( not ( = ?auto_13750 ?auto_13749 ) ) ( ON ?auto_13748 ?auto_13747 ) ( CLEAR ?auto_13748 ) ( ON-TABLE ?auto_13749 ) ( HOLDING ?auto_13751 ) ( CLEAR ?auto_13750 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13750 ?auto_13751 )
      ( MAKE-2PILE ?auto_13747 ?auto_13748 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13752 - BLOCK
      ?auto_13753 - BLOCK
    )
    :vars
    (
      ?auto_13754 - BLOCK
      ?auto_13756 - BLOCK
      ?auto_13755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13752 ?auto_13753 ) ) ( not ( = ?auto_13752 ?auto_13754 ) ) ( not ( = ?auto_13753 ?auto_13754 ) ) ( ON-TABLE ?auto_13756 ) ( not ( = ?auto_13756 ?auto_13754 ) ) ( not ( = ?auto_13756 ?auto_13753 ) ) ( not ( = ?auto_13756 ?auto_13752 ) ) ( ON ?auto_13752 ?auto_13755 ) ( not ( = ?auto_13752 ?auto_13755 ) ) ( not ( = ?auto_13753 ?auto_13755 ) ) ( not ( = ?auto_13754 ?auto_13755 ) ) ( not ( = ?auto_13756 ?auto_13755 ) ) ( ON ?auto_13753 ?auto_13752 ) ( ON-TABLE ?auto_13755 ) ( CLEAR ?auto_13756 ) ( ON ?auto_13754 ?auto_13753 ) ( CLEAR ?auto_13754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13755 ?auto_13752 ?auto_13753 )
      ( MAKE-2PILE ?auto_13752 ?auto_13753 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13757 - BLOCK
      ?auto_13758 - BLOCK
    )
    :vars
    (
      ?auto_13760 - BLOCK
      ?auto_13759 - BLOCK
      ?auto_13761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13757 ?auto_13758 ) ) ( not ( = ?auto_13757 ?auto_13760 ) ) ( not ( = ?auto_13758 ?auto_13760 ) ) ( not ( = ?auto_13759 ?auto_13760 ) ) ( not ( = ?auto_13759 ?auto_13758 ) ) ( not ( = ?auto_13759 ?auto_13757 ) ) ( ON ?auto_13757 ?auto_13761 ) ( not ( = ?auto_13757 ?auto_13761 ) ) ( not ( = ?auto_13758 ?auto_13761 ) ) ( not ( = ?auto_13760 ?auto_13761 ) ) ( not ( = ?auto_13759 ?auto_13761 ) ) ( ON ?auto_13758 ?auto_13757 ) ( ON-TABLE ?auto_13761 ) ( ON ?auto_13760 ?auto_13758 ) ( CLEAR ?auto_13760 ) ( HOLDING ?auto_13759 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13759 )
      ( MAKE-2PILE ?auto_13757 ?auto_13758 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13762 - BLOCK
      ?auto_13763 - BLOCK
    )
    :vars
    (
      ?auto_13766 - BLOCK
      ?auto_13765 - BLOCK
      ?auto_13764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13762 ?auto_13763 ) ) ( not ( = ?auto_13762 ?auto_13766 ) ) ( not ( = ?auto_13763 ?auto_13766 ) ) ( not ( = ?auto_13765 ?auto_13766 ) ) ( not ( = ?auto_13765 ?auto_13763 ) ) ( not ( = ?auto_13765 ?auto_13762 ) ) ( ON ?auto_13762 ?auto_13764 ) ( not ( = ?auto_13762 ?auto_13764 ) ) ( not ( = ?auto_13763 ?auto_13764 ) ) ( not ( = ?auto_13766 ?auto_13764 ) ) ( not ( = ?auto_13765 ?auto_13764 ) ) ( ON ?auto_13763 ?auto_13762 ) ( ON-TABLE ?auto_13764 ) ( ON ?auto_13766 ?auto_13763 ) ( ON ?auto_13765 ?auto_13766 ) ( CLEAR ?auto_13765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13764 ?auto_13762 ?auto_13763 ?auto_13766 )
      ( MAKE-2PILE ?auto_13762 ?auto_13763 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13768 - BLOCK
    )
    :vars
    (
      ?auto_13769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13769 ?auto_13768 ) ( CLEAR ?auto_13769 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13768 ) ( not ( = ?auto_13768 ?auto_13769 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13769 ?auto_13768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13770 - BLOCK
    )
    :vars
    (
      ?auto_13771 - BLOCK
      ?auto_13772 - BLOCK
      ?auto_13773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13771 ?auto_13770 ) ( CLEAR ?auto_13771 ) ( ON-TABLE ?auto_13770 ) ( not ( = ?auto_13770 ?auto_13771 ) ) ( HOLDING ?auto_13772 ) ( CLEAR ?auto_13773 ) ( not ( = ?auto_13770 ?auto_13772 ) ) ( not ( = ?auto_13770 ?auto_13773 ) ) ( not ( = ?auto_13771 ?auto_13772 ) ) ( not ( = ?auto_13771 ?auto_13773 ) ) ( not ( = ?auto_13772 ?auto_13773 ) ) )
    :subtasks
    ( ( !STACK ?auto_13772 ?auto_13773 )
      ( MAKE-1PILE ?auto_13770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13774 - BLOCK
    )
    :vars
    (
      ?auto_13776 - BLOCK
      ?auto_13777 - BLOCK
      ?auto_13775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13776 ?auto_13774 ) ( ON-TABLE ?auto_13774 ) ( not ( = ?auto_13774 ?auto_13776 ) ) ( CLEAR ?auto_13777 ) ( not ( = ?auto_13774 ?auto_13775 ) ) ( not ( = ?auto_13774 ?auto_13777 ) ) ( not ( = ?auto_13776 ?auto_13775 ) ) ( not ( = ?auto_13776 ?auto_13777 ) ) ( not ( = ?auto_13775 ?auto_13777 ) ) ( ON ?auto_13775 ?auto_13776 ) ( CLEAR ?auto_13775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13774 ?auto_13776 )
      ( MAKE-1PILE ?auto_13774 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13778 - BLOCK
    )
    :vars
    (
      ?auto_13779 - BLOCK
      ?auto_13781 - BLOCK
      ?auto_13780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13779 ?auto_13778 ) ( ON-TABLE ?auto_13778 ) ( not ( = ?auto_13778 ?auto_13779 ) ) ( not ( = ?auto_13778 ?auto_13781 ) ) ( not ( = ?auto_13778 ?auto_13780 ) ) ( not ( = ?auto_13779 ?auto_13781 ) ) ( not ( = ?auto_13779 ?auto_13780 ) ) ( not ( = ?auto_13781 ?auto_13780 ) ) ( ON ?auto_13781 ?auto_13779 ) ( CLEAR ?auto_13781 ) ( HOLDING ?auto_13780 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13780 )
      ( MAKE-1PILE ?auto_13778 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13782 - BLOCK
    )
    :vars
    (
      ?auto_13785 - BLOCK
      ?auto_13784 - BLOCK
      ?auto_13783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13785 ?auto_13782 ) ( ON-TABLE ?auto_13782 ) ( not ( = ?auto_13782 ?auto_13785 ) ) ( not ( = ?auto_13782 ?auto_13784 ) ) ( not ( = ?auto_13782 ?auto_13783 ) ) ( not ( = ?auto_13785 ?auto_13784 ) ) ( not ( = ?auto_13785 ?auto_13783 ) ) ( not ( = ?auto_13784 ?auto_13783 ) ) ( ON ?auto_13784 ?auto_13785 ) ( ON ?auto_13783 ?auto_13784 ) ( CLEAR ?auto_13783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13782 ?auto_13785 ?auto_13784 )
      ( MAKE-1PILE ?auto_13782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13786 - BLOCK
    )
    :vars
    (
      ?auto_13787 - BLOCK
      ?auto_13789 - BLOCK
      ?auto_13788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13787 ?auto_13786 ) ( ON-TABLE ?auto_13786 ) ( not ( = ?auto_13786 ?auto_13787 ) ) ( not ( = ?auto_13786 ?auto_13789 ) ) ( not ( = ?auto_13786 ?auto_13788 ) ) ( not ( = ?auto_13787 ?auto_13789 ) ) ( not ( = ?auto_13787 ?auto_13788 ) ) ( not ( = ?auto_13789 ?auto_13788 ) ) ( ON ?auto_13789 ?auto_13787 ) ( HOLDING ?auto_13788 ) ( CLEAR ?auto_13789 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13786 ?auto_13787 ?auto_13789 ?auto_13788 )
      ( MAKE-1PILE ?auto_13786 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13790 - BLOCK
    )
    :vars
    (
      ?auto_13791 - BLOCK
      ?auto_13793 - BLOCK
      ?auto_13792 - BLOCK
      ?auto_13794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13791 ?auto_13790 ) ( ON-TABLE ?auto_13790 ) ( not ( = ?auto_13790 ?auto_13791 ) ) ( not ( = ?auto_13790 ?auto_13793 ) ) ( not ( = ?auto_13790 ?auto_13792 ) ) ( not ( = ?auto_13791 ?auto_13793 ) ) ( not ( = ?auto_13791 ?auto_13792 ) ) ( not ( = ?auto_13793 ?auto_13792 ) ) ( ON ?auto_13793 ?auto_13791 ) ( CLEAR ?auto_13793 ) ( ON ?auto_13792 ?auto_13794 ) ( CLEAR ?auto_13792 ) ( HAND-EMPTY ) ( not ( = ?auto_13790 ?auto_13794 ) ) ( not ( = ?auto_13791 ?auto_13794 ) ) ( not ( = ?auto_13793 ?auto_13794 ) ) ( not ( = ?auto_13792 ?auto_13794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13792 ?auto_13794 )
      ( MAKE-1PILE ?auto_13790 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13795 - BLOCK
    )
    :vars
    (
      ?auto_13797 - BLOCK
      ?auto_13799 - BLOCK
      ?auto_13796 - BLOCK
      ?auto_13798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13797 ?auto_13795 ) ( ON-TABLE ?auto_13795 ) ( not ( = ?auto_13795 ?auto_13797 ) ) ( not ( = ?auto_13795 ?auto_13799 ) ) ( not ( = ?auto_13795 ?auto_13796 ) ) ( not ( = ?auto_13797 ?auto_13799 ) ) ( not ( = ?auto_13797 ?auto_13796 ) ) ( not ( = ?auto_13799 ?auto_13796 ) ) ( ON ?auto_13796 ?auto_13798 ) ( CLEAR ?auto_13796 ) ( not ( = ?auto_13795 ?auto_13798 ) ) ( not ( = ?auto_13797 ?auto_13798 ) ) ( not ( = ?auto_13799 ?auto_13798 ) ) ( not ( = ?auto_13796 ?auto_13798 ) ) ( HOLDING ?auto_13799 ) ( CLEAR ?auto_13797 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13795 ?auto_13797 ?auto_13799 )
      ( MAKE-1PILE ?auto_13795 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13800 - BLOCK
    )
    :vars
    (
      ?auto_13802 - BLOCK
      ?auto_13804 - BLOCK
      ?auto_13803 - BLOCK
      ?auto_13801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13802 ?auto_13800 ) ( ON-TABLE ?auto_13800 ) ( not ( = ?auto_13800 ?auto_13802 ) ) ( not ( = ?auto_13800 ?auto_13804 ) ) ( not ( = ?auto_13800 ?auto_13803 ) ) ( not ( = ?auto_13802 ?auto_13804 ) ) ( not ( = ?auto_13802 ?auto_13803 ) ) ( not ( = ?auto_13804 ?auto_13803 ) ) ( ON ?auto_13803 ?auto_13801 ) ( not ( = ?auto_13800 ?auto_13801 ) ) ( not ( = ?auto_13802 ?auto_13801 ) ) ( not ( = ?auto_13804 ?auto_13801 ) ) ( not ( = ?auto_13803 ?auto_13801 ) ) ( CLEAR ?auto_13802 ) ( ON ?auto_13804 ?auto_13803 ) ( CLEAR ?auto_13804 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13801 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13801 ?auto_13803 )
      ( MAKE-1PILE ?auto_13800 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13815 - BLOCK
    )
    :vars
    (
      ?auto_13817 - BLOCK
      ?auto_13816 - BLOCK
      ?auto_13819 - BLOCK
      ?auto_13818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13815 ?auto_13817 ) ) ( not ( = ?auto_13815 ?auto_13816 ) ) ( not ( = ?auto_13815 ?auto_13819 ) ) ( not ( = ?auto_13817 ?auto_13816 ) ) ( not ( = ?auto_13817 ?auto_13819 ) ) ( not ( = ?auto_13816 ?auto_13819 ) ) ( ON ?auto_13819 ?auto_13818 ) ( not ( = ?auto_13815 ?auto_13818 ) ) ( not ( = ?auto_13817 ?auto_13818 ) ) ( not ( = ?auto_13816 ?auto_13818 ) ) ( not ( = ?auto_13819 ?auto_13818 ) ) ( ON ?auto_13816 ?auto_13819 ) ( ON-TABLE ?auto_13818 ) ( ON ?auto_13817 ?auto_13816 ) ( CLEAR ?auto_13817 ) ( HOLDING ?auto_13815 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13815 ?auto_13817 )
      ( MAKE-1PILE ?auto_13815 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13820 - BLOCK
    )
    :vars
    (
      ?auto_13822 - BLOCK
      ?auto_13821 - BLOCK
      ?auto_13824 - BLOCK
      ?auto_13823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13820 ?auto_13822 ) ) ( not ( = ?auto_13820 ?auto_13821 ) ) ( not ( = ?auto_13820 ?auto_13824 ) ) ( not ( = ?auto_13822 ?auto_13821 ) ) ( not ( = ?auto_13822 ?auto_13824 ) ) ( not ( = ?auto_13821 ?auto_13824 ) ) ( ON ?auto_13824 ?auto_13823 ) ( not ( = ?auto_13820 ?auto_13823 ) ) ( not ( = ?auto_13822 ?auto_13823 ) ) ( not ( = ?auto_13821 ?auto_13823 ) ) ( not ( = ?auto_13824 ?auto_13823 ) ) ( ON ?auto_13821 ?auto_13824 ) ( ON-TABLE ?auto_13823 ) ( ON ?auto_13822 ?auto_13821 ) ( ON ?auto_13820 ?auto_13822 ) ( CLEAR ?auto_13820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13823 ?auto_13824 ?auto_13821 ?auto_13822 )
      ( MAKE-1PILE ?auto_13820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13828 - BLOCK
      ?auto_13829 - BLOCK
      ?auto_13830 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13830 ) ( CLEAR ?auto_13829 ) ( ON-TABLE ?auto_13828 ) ( ON ?auto_13829 ?auto_13828 ) ( not ( = ?auto_13828 ?auto_13829 ) ) ( not ( = ?auto_13828 ?auto_13830 ) ) ( not ( = ?auto_13829 ?auto_13830 ) ) )
    :subtasks
    ( ( !STACK ?auto_13830 ?auto_13829 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13831 - BLOCK
      ?auto_13832 - BLOCK
      ?auto_13833 - BLOCK
    )
    :vars
    (
      ?auto_13834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13832 ) ( ON-TABLE ?auto_13831 ) ( ON ?auto_13832 ?auto_13831 ) ( not ( = ?auto_13831 ?auto_13832 ) ) ( not ( = ?auto_13831 ?auto_13833 ) ) ( not ( = ?auto_13832 ?auto_13833 ) ) ( ON ?auto_13833 ?auto_13834 ) ( CLEAR ?auto_13833 ) ( HAND-EMPTY ) ( not ( = ?auto_13831 ?auto_13834 ) ) ( not ( = ?auto_13832 ?auto_13834 ) ) ( not ( = ?auto_13833 ?auto_13834 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13833 ?auto_13834 )
      ( MAKE-3PILE ?auto_13831 ?auto_13832 ?auto_13833 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13835 - BLOCK
      ?auto_13836 - BLOCK
      ?auto_13837 - BLOCK
    )
    :vars
    (
      ?auto_13838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13835 ) ( not ( = ?auto_13835 ?auto_13836 ) ) ( not ( = ?auto_13835 ?auto_13837 ) ) ( not ( = ?auto_13836 ?auto_13837 ) ) ( ON ?auto_13837 ?auto_13838 ) ( CLEAR ?auto_13837 ) ( not ( = ?auto_13835 ?auto_13838 ) ) ( not ( = ?auto_13836 ?auto_13838 ) ) ( not ( = ?auto_13837 ?auto_13838 ) ) ( HOLDING ?auto_13836 ) ( CLEAR ?auto_13835 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13835 ?auto_13836 )
      ( MAKE-3PILE ?auto_13835 ?auto_13836 ?auto_13837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13839 - BLOCK
      ?auto_13840 - BLOCK
      ?auto_13841 - BLOCK
    )
    :vars
    (
      ?auto_13842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13839 ) ( not ( = ?auto_13839 ?auto_13840 ) ) ( not ( = ?auto_13839 ?auto_13841 ) ) ( not ( = ?auto_13840 ?auto_13841 ) ) ( ON ?auto_13841 ?auto_13842 ) ( not ( = ?auto_13839 ?auto_13842 ) ) ( not ( = ?auto_13840 ?auto_13842 ) ) ( not ( = ?auto_13841 ?auto_13842 ) ) ( CLEAR ?auto_13839 ) ( ON ?auto_13840 ?auto_13841 ) ( CLEAR ?auto_13840 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13842 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13842 ?auto_13841 )
      ( MAKE-3PILE ?auto_13839 ?auto_13840 ?auto_13841 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13843 - BLOCK
      ?auto_13844 - BLOCK
      ?auto_13845 - BLOCK
    )
    :vars
    (
      ?auto_13846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13843 ?auto_13844 ) ) ( not ( = ?auto_13843 ?auto_13845 ) ) ( not ( = ?auto_13844 ?auto_13845 ) ) ( ON ?auto_13845 ?auto_13846 ) ( not ( = ?auto_13843 ?auto_13846 ) ) ( not ( = ?auto_13844 ?auto_13846 ) ) ( not ( = ?auto_13845 ?auto_13846 ) ) ( ON ?auto_13844 ?auto_13845 ) ( CLEAR ?auto_13844 ) ( ON-TABLE ?auto_13846 ) ( HOLDING ?auto_13843 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13843 )
      ( MAKE-3PILE ?auto_13843 ?auto_13844 ?auto_13845 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13847 - BLOCK
      ?auto_13848 - BLOCK
      ?auto_13849 - BLOCK
    )
    :vars
    (
      ?auto_13850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13847 ?auto_13848 ) ) ( not ( = ?auto_13847 ?auto_13849 ) ) ( not ( = ?auto_13848 ?auto_13849 ) ) ( ON ?auto_13849 ?auto_13850 ) ( not ( = ?auto_13847 ?auto_13850 ) ) ( not ( = ?auto_13848 ?auto_13850 ) ) ( not ( = ?auto_13849 ?auto_13850 ) ) ( ON ?auto_13848 ?auto_13849 ) ( ON-TABLE ?auto_13850 ) ( ON ?auto_13847 ?auto_13848 ) ( CLEAR ?auto_13847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13850 ?auto_13849 ?auto_13848 )
      ( MAKE-3PILE ?auto_13847 ?auto_13848 ?auto_13849 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13851 - BLOCK
      ?auto_13852 - BLOCK
      ?auto_13853 - BLOCK
    )
    :vars
    (
      ?auto_13854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13851 ?auto_13852 ) ) ( not ( = ?auto_13851 ?auto_13853 ) ) ( not ( = ?auto_13852 ?auto_13853 ) ) ( ON ?auto_13853 ?auto_13854 ) ( not ( = ?auto_13851 ?auto_13854 ) ) ( not ( = ?auto_13852 ?auto_13854 ) ) ( not ( = ?auto_13853 ?auto_13854 ) ) ( ON ?auto_13852 ?auto_13853 ) ( ON-TABLE ?auto_13854 ) ( HOLDING ?auto_13851 ) ( CLEAR ?auto_13852 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13854 ?auto_13853 ?auto_13852 ?auto_13851 )
      ( MAKE-3PILE ?auto_13851 ?auto_13852 ?auto_13853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13855 - BLOCK
      ?auto_13856 - BLOCK
      ?auto_13857 - BLOCK
    )
    :vars
    (
      ?auto_13858 - BLOCK
      ?auto_13859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13855 ?auto_13856 ) ) ( not ( = ?auto_13855 ?auto_13857 ) ) ( not ( = ?auto_13856 ?auto_13857 ) ) ( ON ?auto_13857 ?auto_13858 ) ( not ( = ?auto_13855 ?auto_13858 ) ) ( not ( = ?auto_13856 ?auto_13858 ) ) ( not ( = ?auto_13857 ?auto_13858 ) ) ( ON ?auto_13856 ?auto_13857 ) ( ON-TABLE ?auto_13858 ) ( CLEAR ?auto_13856 ) ( ON ?auto_13855 ?auto_13859 ) ( CLEAR ?auto_13855 ) ( HAND-EMPTY ) ( not ( = ?auto_13855 ?auto_13859 ) ) ( not ( = ?auto_13856 ?auto_13859 ) ) ( not ( = ?auto_13857 ?auto_13859 ) ) ( not ( = ?auto_13858 ?auto_13859 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13855 ?auto_13859 )
      ( MAKE-3PILE ?auto_13855 ?auto_13856 ?auto_13857 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13860 - BLOCK
      ?auto_13861 - BLOCK
      ?auto_13862 - BLOCK
    )
    :vars
    (
      ?auto_13864 - BLOCK
      ?auto_13863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13860 ?auto_13861 ) ) ( not ( = ?auto_13860 ?auto_13862 ) ) ( not ( = ?auto_13861 ?auto_13862 ) ) ( ON ?auto_13862 ?auto_13864 ) ( not ( = ?auto_13860 ?auto_13864 ) ) ( not ( = ?auto_13861 ?auto_13864 ) ) ( not ( = ?auto_13862 ?auto_13864 ) ) ( ON-TABLE ?auto_13864 ) ( ON ?auto_13860 ?auto_13863 ) ( CLEAR ?auto_13860 ) ( not ( = ?auto_13860 ?auto_13863 ) ) ( not ( = ?auto_13861 ?auto_13863 ) ) ( not ( = ?auto_13862 ?auto_13863 ) ) ( not ( = ?auto_13864 ?auto_13863 ) ) ( HOLDING ?auto_13861 ) ( CLEAR ?auto_13862 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13864 ?auto_13862 ?auto_13861 )
      ( MAKE-3PILE ?auto_13860 ?auto_13861 ?auto_13862 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13865 - BLOCK
      ?auto_13866 - BLOCK
      ?auto_13867 - BLOCK
    )
    :vars
    (
      ?auto_13868 - BLOCK
      ?auto_13869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13865 ?auto_13866 ) ) ( not ( = ?auto_13865 ?auto_13867 ) ) ( not ( = ?auto_13866 ?auto_13867 ) ) ( ON ?auto_13867 ?auto_13868 ) ( not ( = ?auto_13865 ?auto_13868 ) ) ( not ( = ?auto_13866 ?auto_13868 ) ) ( not ( = ?auto_13867 ?auto_13868 ) ) ( ON-TABLE ?auto_13868 ) ( ON ?auto_13865 ?auto_13869 ) ( not ( = ?auto_13865 ?auto_13869 ) ) ( not ( = ?auto_13866 ?auto_13869 ) ) ( not ( = ?auto_13867 ?auto_13869 ) ) ( not ( = ?auto_13868 ?auto_13869 ) ) ( CLEAR ?auto_13867 ) ( ON ?auto_13866 ?auto_13865 ) ( CLEAR ?auto_13866 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13869 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13869 ?auto_13865 )
      ( MAKE-3PILE ?auto_13865 ?auto_13866 ?auto_13867 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13870 - BLOCK
      ?auto_13871 - BLOCK
      ?auto_13872 - BLOCK
    )
    :vars
    (
      ?auto_13874 - BLOCK
      ?auto_13873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13870 ?auto_13871 ) ) ( not ( = ?auto_13870 ?auto_13872 ) ) ( not ( = ?auto_13871 ?auto_13872 ) ) ( not ( = ?auto_13870 ?auto_13874 ) ) ( not ( = ?auto_13871 ?auto_13874 ) ) ( not ( = ?auto_13872 ?auto_13874 ) ) ( ON-TABLE ?auto_13874 ) ( ON ?auto_13870 ?auto_13873 ) ( not ( = ?auto_13870 ?auto_13873 ) ) ( not ( = ?auto_13871 ?auto_13873 ) ) ( not ( = ?auto_13872 ?auto_13873 ) ) ( not ( = ?auto_13874 ?auto_13873 ) ) ( ON ?auto_13871 ?auto_13870 ) ( CLEAR ?auto_13871 ) ( ON-TABLE ?auto_13873 ) ( HOLDING ?auto_13872 ) ( CLEAR ?auto_13874 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13874 ?auto_13872 )
      ( MAKE-3PILE ?auto_13870 ?auto_13871 ?auto_13872 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13875 - BLOCK
      ?auto_13876 - BLOCK
      ?auto_13877 - BLOCK
    )
    :vars
    (
      ?auto_13878 - BLOCK
      ?auto_13879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13875 ?auto_13876 ) ) ( not ( = ?auto_13875 ?auto_13877 ) ) ( not ( = ?auto_13876 ?auto_13877 ) ) ( not ( = ?auto_13875 ?auto_13878 ) ) ( not ( = ?auto_13876 ?auto_13878 ) ) ( not ( = ?auto_13877 ?auto_13878 ) ) ( ON-TABLE ?auto_13878 ) ( ON ?auto_13875 ?auto_13879 ) ( not ( = ?auto_13875 ?auto_13879 ) ) ( not ( = ?auto_13876 ?auto_13879 ) ) ( not ( = ?auto_13877 ?auto_13879 ) ) ( not ( = ?auto_13878 ?auto_13879 ) ) ( ON ?auto_13876 ?auto_13875 ) ( ON-TABLE ?auto_13879 ) ( CLEAR ?auto_13878 ) ( ON ?auto_13877 ?auto_13876 ) ( CLEAR ?auto_13877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13879 ?auto_13875 ?auto_13876 )
      ( MAKE-3PILE ?auto_13875 ?auto_13876 ?auto_13877 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13880 - BLOCK
      ?auto_13881 - BLOCK
      ?auto_13882 - BLOCK
    )
    :vars
    (
      ?auto_13884 - BLOCK
      ?auto_13883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13880 ?auto_13881 ) ) ( not ( = ?auto_13880 ?auto_13882 ) ) ( not ( = ?auto_13881 ?auto_13882 ) ) ( not ( = ?auto_13880 ?auto_13884 ) ) ( not ( = ?auto_13881 ?auto_13884 ) ) ( not ( = ?auto_13882 ?auto_13884 ) ) ( ON ?auto_13880 ?auto_13883 ) ( not ( = ?auto_13880 ?auto_13883 ) ) ( not ( = ?auto_13881 ?auto_13883 ) ) ( not ( = ?auto_13882 ?auto_13883 ) ) ( not ( = ?auto_13884 ?auto_13883 ) ) ( ON ?auto_13881 ?auto_13880 ) ( ON-TABLE ?auto_13883 ) ( ON ?auto_13882 ?auto_13881 ) ( CLEAR ?auto_13882 ) ( HOLDING ?auto_13884 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13884 )
      ( MAKE-3PILE ?auto_13880 ?auto_13881 ?auto_13882 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13885 - BLOCK
      ?auto_13886 - BLOCK
      ?auto_13887 - BLOCK
    )
    :vars
    (
      ?auto_13888 - BLOCK
      ?auto_13889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13885 ?auto_13886 ) ) ( not ( = ?auto_13885 ?auto_13887 ) ) ( not ( = ?auto_13886 ?auto_13887 ) ) ( not ( = ?auto_13885 ?auto_13888 ) ) ( not ( = ?auto_13886 ?auto_13888 ) ) ( not ( = ?auto_13887 ?auto_13888 ) ) ( ON ?auto_13885 ?auto_13889 ) ( not ( = ?auto_13885 ?auto_13889 ) ) ( not ( = ?auto_13886 ?auto_13889 ) ) ( not ( = ?auto_13887 ?auto_13889 ) ) ( not ( = ?auto_13888 ?auto_13889 ) ) ( ON ?auto_13886 ?auto_13885 ) ( ON-TABLE ?auto_13889 ) ( ON ?auto_13887 ?auto_13886 ) ( ON ?auto_13888 ?auto_13887 ) ( CLEAR ?auto_13888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13889 ?auto_13885 ?auto_13886 ?auto_13887 )
      ( MAKE-3PILE ?auto_13885 ?auto_13886 ?auto_13887 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13894 - BLOCK
      ?auto_13895 - BLOCK
      ?auto_13896 - BLOCK
      ?auto_13897 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13897 ) ( CLEAR ?auto_13896 ) ( ON-TABLE ?auto_13894 ) ( ON ?auto_13895 ?auto_13894 ) ( ON ?auto_13896 ?auto_13895 ) ( not ( = ?auto_13894 ?auto_13895 ) ) ( not ( = ?auto_13894 ?auto_13896 ) ) ( not ( = ?auto_13894 ?auto_13897 ) ) ( not ( = ?auto_13895 ?auto_13896 ) ) ( not ( = ?auto_13895 ?auto_13897 ) ) ( not ( = ?auto_13896 ?auto_13897 ) ) )
    :subtasks
    ( ( !STACK ?auto_13897 ?auto_13896 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13898 - BLOCK
      ?auto_13899 - BLOCK
      ?auto_13900 - BLOCK
      ?auto_13901 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13900 ) ( ON-TABLE ?auto_13898 ) ( ON ?auto_13899 ?auto_13898 ) ( ON ?auto_13900 ?auto_13899 ) ( not ( = ?auto_13898 ?auto_13899 ) ) ( not ( = ?auto_13898 ?auto_13900 ) ) ( not ( = ?auto_13898 ?auto_13901 ) ) ( not ( = ?auto_13899 ?auto_13900 ) ) ( not ( = ?auto_13899 ?auto_13901 ) ) ( not ( = ?auto_13900 ?auto_13901 ) ) ( ON-TABLE ?auto_13901 ) ( CLEAR ?auto_13901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_13901 )
      ( MAKE-4PILE ?auto_13898 ?auto_13899 ?auto_13900 ?auto_13901 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13902 - BLOCK
      ?auto_13903 - BLOCK
      ?auto_13904 - BLOCK
      ?auto_13905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13902 ) ( ON ?auto_13903 ?auto_13902 ) ( not ( = ?auto_13902 ?auto_13903 ) ) ( not ( = ?auto_13902 ?auto_13904 ) ) ( not ( = ?auto_13902 ?auto_13905 ) ) ( not ( = ?auto_13903 ?auto_13904 ) ) ( not ( = ?auto_13903 ?auto_13905 ) ) ( not ( = ?auto_13904 ?auto_13905 ) ) ( ON-TABLE ?auto_13905 ) ( CLEAR ?auto_13905 ) ( HOLDING ?auto_13904 ) ( CLEAR ?auto_13903 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13902 ?auto_13903 ?auto_13904 )
      ( MAKE-4PILE ?auto_13902 ?auto_13903 ?auto_13904 ?auto_13905 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13906 - BLOCK
      ?auto_13907 - BLOCK
      ?auto_13908 - BLOCK
      ?auto_13909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13906 ) ( ON ?auto_13907 ?auto_13906 ) ( not ( = ?auto_13906 ?auto_13907 ) ) ( not ( = ?auto_13906 ?auto_13908 ) ) ( not ( = ?auto_13906 ?auto_13909 ) ) ( not ( = ?auto_13907 ?auto_13908 ) ) ( not ( = ?auto_13907 ?auto_13909 ) ) ( not ( = ?auto_13908 ?auto_13909 ) ) ( ON-TABLE ?auto_13909 ) ( CLEAR ?auto_13907 ) ( ON ?auto_13908 ?auto_13909 ) ( CLEAR ?auto_13908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13909 )
      ( MAKE-4PILE ?auto_13906 ?auto_13907 ?auto_13908 ?auto_13909 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13910 - BLOCK
      ?auto_13911 - BLOCK
      ?auto_13912 - BLOCK
      ?auto_13913 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13910 ) ( not ( = ?auto_13910 ?auto_13911 ) ) ( not ( = ?auto_13910 ?auto_13912 ) ) ( not ( = ?auto_13910 ?auto_13913 ) ) ( not ( = ?auto_13911 ?auto_13912 ) ) ( not ( = ?auto_13911 ?auto_13913 ) ) ( not ( = ?auto_13912 ?auto_13913 ) ) ( ON-TABLE ?auto_13913 ) ( ON ?auto_13912 ?auto_13913 ) ( CLEAR ?auto_13912 ) ( HOLDING ?auto_13911 ) ( CLEAR ?auto_13910 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13910 ?auto_13911 )
      ( MAKE-4PILE ?auto_13910 ?auto_13911 ?auto_13912 ?auto_13913 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13914 - BLOCK
      ?auto_13915 - BLOCK
      ?auto_13916 - BLOCK
      ?auto_13917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13914 ) ( not ( = ?auto_13914 ?auto_13915 ) ) ( not ( = ?auto_13914 ?auto_13916 ) ) ( not ( = ?auto_13914 ?auto_13917 ) ) ( not ( = ?auto_13915 ?auto_13916 ) ) ( not ( = ?auto_13915 ?auto_13917 ) ) ( not ( = ?auto_13916 ?auto_13917 ) ) ( ON-TABLE ?auto_13917 ) ( ON ?auto_13916 ?auto_13917 ) ( CLEAR ?auto_13914 ) ( ON ?auto_13915 ?auto_13916 ) ( CLEAR ?auto_13915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13917 ?auto_13916 )
      ( MAKE-4PILE ?auto_13914 ?auto_13915 ?auto_13916 ?auto_13917 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13918 - BLOCK
      ?auto_13919 - BLOCK
      ?auto_13920 - BLOCK
      ?auto_13921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13918 ?auto_13919 ) ) ( not ( = ?auto_13918 ?auto_13920 ) ) ( not ( = ?auto_13918 ?auto_13921 ) ) ( not ( = ?auto_13919 ?auto_13920 ) ) ( not ( = ?auto_13919 ?auto_13921 ) ) ( not ( = ?auto_13920 ?auto_13921 ) ) ( ON-TABLE ?auto_13921 ) ( ON ?auto_13920 ?auto_13921 ) ( ON ?auto_13919 ?auto_13920 ) ( CLEAR ?auto_13919 ) ( HOLDING ?auto_13918 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13918 )
      ( MAKE-4PILE ?auto_13918 ?auto_13919 ?auto_13920 ?auto_13921 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13922 - BLOCK
      ?auto_13923 - BLOCK
      ?auto_13924 - BLOCK
      ?auto_13925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13922 ?auto_13923 ) ) ( not ( = ?auto_13922 ?auto_13924 ) ) ( not ( = ?auto_13922 ?auto_13925 ) ) ( not ( = ?auto_13923 ?auto_13924 ) ) ( not ( = ?auto_13923 ?auto_13925 ) ) ( not ( = ?auto_13924 ?auto_13925 ) ) ( ON-TABLE ?auto_13925 ) ( ON ?auto_13924 ?auto_13925 ) ( ON ?auto_13923 ?auto_13924 ) ( ON ?auto_13922 ?auto_13923 ) ( CLEAR ?auto_13922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13925 ?auto_13924 ?auto_13923 )
      ( MAKE-4PILE ?auto_13922 ?auto_13923 ?auto_13924 ?auto_13925 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13926 - BLOCK
      ?auto_13927 - BLOCK
      ?auto_13928 - BLOCK
      ?auto_13929 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13926 ?auto_13927 ) ) ( not ( = ?auto_13926 ?auto_13928 ) ) ( not ( = ?auto_13926 ?auto_13929 ) ) ( not ( = ?auto_13927 ?auto_13928 ) ) ( not ( = ?auto_13927 ?auto_13929 ) ) ( not ( = ?auto_13928 ?auto_13929 ) ) ( ON-TABLE ?auto_13929 ) ( ON ?auto_13928 ?auto_13929 ) ( ON ?auto_13927 ?auto_13928 ) ( HOLDING ?auto_13926 ) ( CLEAR ?auto_13927 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13929 ?auto_13928 ?auto_13927 ?auto_13926 )
      ( MAKE-4PILE ?auto_13926 ?auto_13927 ?auto_13928 ?auto_13929 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13930 - BLOCK
      ?auto_13931 - BLOCK
      ?auto_13932 - BLOCK
      ?auto_13933 - BLOCK
    )
    :vars
    (
      ?auto_13934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13930 ?auto_13931 ) ) ( not ( = ?auto_13930 ?auto_13932 ) ) ( not ( = ?auto_13930 ?auto_13933 ) ) ( not ( = ?auto_13931 ?auto_13932 ) ) ( not ( = ?auto_13931 ?auto_13933 ) ) ( not ( = ?auto_13932 ?auto_13933 ) ) ( ON-TABLE ?auto_13933 ) ( ON ?auto_13932 ?auto_13933 ) ( ON ?auto_13931 ?auto_13932 ) ( CLEAR ?auto_13931 ) ( ON ?auto_13930 ?auto_13934 ) ( CLEAR ?auto_13930 ) ( HAND-EMPTY ) ( not ( = ?auto_13930 ?auto_13934 ) ) ( not ( = ?auto_13931 ?auto_13934 ) ) ( not ( = ?auto_13932 ?auto_13934 ) ) ( not ( = ?auto_13933 ?auto_13934 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13930 ?auto_13934 )
      ( MAKE-4PILE ?auto_13930 ?auto_13931 ?auto_13932 ?auto_13933 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13935 - BLOCK
      ?auto_13936 - BLOCK
      ?auto_13937 - BLOCK
      ?auto_13938 - BLOCK
    )
    :vars
    (
      ?auto_13939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13935 ?auto_13936 ) ) ( not ( = ?auto_13935 ?auto_13937 ) ) ( not ( = ?auto_13935 ?auto_13938 ) ) ( not ( = ?auto_13936 ?auto_13937 ) ) ( not ( = ?auto_13936 ?auto_13938 ) ) ( not ( = ?auto_13937 ?auto_13938 ) ) ( ON-TABLE ?auto_13938 ) ( ON ?auto_13937 ?auto_13938 ) ( ON ?auto_13935 ?auto_13939 ) ( CLEAR ?auto_13935 ) ( not ( = ?auto_13935 ?auto_13939 ) ) ( not ( = ?auto_13936 ?auto_13939 ) ) ( not ( = ?auto_13937 ?auto_13939 ) ) ( not ( = ?auto_13938 ?auto_13939 ) ) ( HOLDING ?auto_13936 ) ( CLEAR ?auto_13937 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13938 ?auto_13937 ?auto_13936 )
      ( MAKE-4PILE ?auto_13935 ?auto_13936 ?auto_13937 ?auto_13938 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13940 - BLOCK
      ?auto_13941 - BLOCK
      ?auto_13942 - BLOCK
      ?auto_13943 - BLOCK
    )
    :vars
    (
      ?auto_13944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13940 ?auto_13941 ) ) ( not ( = ?auto_13940 ?auto_13942 ) ) ( not ( = ?auto_13940 ?auto_13943 ) ) ( not ( = ?auto_13941 ?auto_13942 ) ) ( not ( = ?auto_13941 ?auto_13943 ) ) ( not ( = ?auto_13942 ?auto_13943 ) ) ( ON-TABLE ?auto_13943 ) ( ON ?auto_13942 ?auto_13943 ) ( ON ?auto_13940 ?auto_13944 ) ( not ( = ?auto_13940 ?auto_13944 ) ) ( not ( = ?auto_13941 ?auto_13944 ) ) ( not ( = ?auto_13942 ?auto_13944 ) ) ( not ( = ?auto_13943 ?auto_13944 ) ) ( CLEAR ?auto_13942 ) ( ON ?auto_13941 ?auto_13940 ) ( CLEAR ?auto_13941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13944 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13944 ?auto_13940 )
      ( MAKE-4PILE ?auto_13940 ?auto_13941 ?auto_13942 ?auto_13943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13945 - BLOCK
      ?auto_13946 - BLOCK
      ?auto_13947 - BLOCK
      ?auto_13948 - BLOCK
    )
    :vars
    (
      ?auto_13949 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13945 ?auto_13946 ) ) ( not ( = ?auto_13945 ?auto_13947 ) ) ( not ( = ?auto_13945 ?auto_13948 ) ) ( not ( = ?auto_13946 ?auto_13947 ) ) ( not ( = ?auto_13946 ?auto_13948 ) ) ( not ( = ?auto_13947 ?auto_13948 ) ) ( ON-TABLE ?auto_13948 ) ( ON ?auto_13945 ?auto_13949 ) ( not ( = ?auto_13945 ?auto_13949 ) ) ( not ( = ?auto_13946 ?auto_13949 ) ) ( not ( = ?auto_13947 ?auto_13949 ) ) ( not ( = ?auto_13948 ?auto_13949 ) ) ( ON ?auto_13946 ?auto_13945 ) ( CLEAR ?auto_13946 ) ( ON-TABLE ?auto_13949 ) ( HOLDING ?auto_13947 ) ( CLEAR ?auto_13948 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13948 ?auto_13947 )
      ( MAKE-4PILE ?auto_13945 ?auto_13946 ?auto_13947 ?auto_13948 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13950 - BLOCK
      ?auto_13951 - BLOCK
      ?auto_13952 - BLOCK
      ?auto_13953 - BLOCK
    )
    :vars
    (
      ?auto_13954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13950 ?auto_13951 ) ) ( not ( = ?auto_13950 ?auto_13952 ) ) ( not ( = ?auto_13950 ?auto_13953 ) ) ( not ( = ?auto_13951 ?auto_13952 ) ) ( not ( = ?auto_13951 ?auto_13953 ) ) ( not ( = ?auto_13952 ?auto_13953 ) ) ( ON-TABLE ?auto_13953 ) ( ON ?auto_13950 ?auto_13954 ) ( not ( = ?auto_13950 ?auto_13954 ) ) ( not ( = ?auto_13951 ?auto_13954 ) ) ( not ( = ?auto_13952 ?auto_13954 ) ) ( not ( = ?auto_13953 ?auto_13954 ) ) ( ON ?auto_13951 ?auto_13950 ) ( ON-TABLE ?auto_13954 ) ( CLEAR ?auto_13953 ) ( ON ?auto_13952 ?auto_13951 ) ( CLEAR ?auto_13952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13954 ?auto_13950 ?auto_13951 )
      ( MAKE-4PILE ?auto_13950 ?auto_13951 ?auto_13952 ?auto_13953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13955 - BLOCK
      ?auto_13956 - BLOCK
      ?auto_13957 - BLOCK
      ?auto_13958 - BLOCK
    )
    :vars
    (
      ?auto_13959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13955 ?auto_13956 ) ) ( not ( = ?auto_13955 ?auto_13957 ) ) ( not ( = ?auto_13955 ?auto_13958 ) ) ( not ( = ?auto_13956 ?auto_13957 ) ) ( not ( = ?auto_13956 ?auto_13958 ) ) ( not ( = ?auto_13957 ?auto_13958 ) ) ( ON ?auto_13955 ?auto_13959 ) ( not ( = ?auto_13955 ?auto_13959 ) ) ( not ( = ?auto_13956 ?auto_13959 ) ) ( not ( = ?auto_13957 ?auto_13959 ) ) ( not ( = ?auto_13958 ?auto_13959 ) ) ( ON ?auto_13956 ?auto_13955 ) ( ON-TABLE ?auto_13959 ) ( ON ?auto_13957 ?auto_13956 ) ( CLEAR ?auto_13957 ) ( HOLDING ?auto_13958 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13958 )
      ( MAKE-4PILE ?auto_13955 ?auto_13956 ?auto_13957 ?auto_13958 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13960 - BLOCK
      ?auto_13961 - BLOCK
      ?auto_13962 - BLOCK
      ?auto_13963 - BLOCK
    )
    :vars
    (
      ?auto_13964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13960 ?auto_13961 ) ) ( not ( = ?auto_13960 ?auto_13962 ) ) ( not ( = ?auto_13960 ?auto_13963 ) ) ( not ( = ?auto_13961 ?auto_13962 ) ) ( not ( = ?auto_13961 ?auto_13963 ) ) ( not ( = ?auto_13962 ?auto_13963 ) ) ( ON ?auto_13960 ?auto_13964 ) ( not ( = ?auto_13960 ?auto_13964 ) ) ( not ( = ?auto_13961 ?auto_13964 ) ) ( not ( = ?auto_13962 ?auto_13964 ) ) ( not ( = ?auto_13963 ?auto_13964 ) ) ( ON ?auto_13961 ?auto_13960 ) ( ON-TABLE ?auto_13964 ) ( ON ?auto_13962 ?auto_13961 ) ( ON ?auto_13963 ?auto_13962 ) ( CLEAR ?auto_13963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13964 ?auto_13960 ?auto_13961 ?auto_13962 )
      ( MAKE-4PILE ?auto_13960 ?auto_13961 ?auto_13962 ?auto_13963 ) )
  )

)

