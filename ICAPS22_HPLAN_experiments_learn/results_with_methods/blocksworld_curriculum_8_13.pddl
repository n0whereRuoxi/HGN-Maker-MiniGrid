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
      ?auto_42442 - BLOCK
    )
    :vars
    (
      ?auto_42443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42442 ?auto_42443 ) ( CLEAR ?auto_42442 ) ( HAND-EMPTY ) ( not ( = ?auto_42442 ?auto_42443 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42442 ?auto_42443 )
      ( !PUTDOWN ?auto_42442 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42445 - BLOCK
    )
    :vars
    (
      ?auto_42446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42445 ?auto_42446 ) ( CLEAR ?auto_42445 ) ( HAND-EMPTY ) ( not ( = ?auto_42445 ?auto_42446 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42445 ?auto_42446 )
      ( !PUTDOWN ?auto_42445 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42449 - BLOCK
      ?auto_42450 - BLOCK
    )
    :vars
    (
      ?auto_42451 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42449 ) ( ON ?auto_42450 ?auto_42451 ) ( CLEAR ?auto_42450 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42449 ) ( not ( = ?auto_42449 ?auto_42450 ) ) ( not ( = ?auto_42449 ?auto_42451 ) ) ( not ( = ?auto_42450 ?auto_42451 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42450 ?auto_42451 )
      ( !STACK ?auto_42450 ?auto_42449 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42454 - BLOCK
      ?auto_42455 - BLOCK
    )
    :vars
    (
      ?auto_42456 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42454 ) ( ON ?auto_42455 ?auto_42456 ) ( CLEAR ?auto_42455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42454 ) ( not ( = ?auto_42454 ?auto_42455 ) ) ( not ( = ?auto_42454 ?auto_42456 ) ) ( not ( = ?auto_42455 ?auto_42456 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42455 ?auto_42456 )
      ( !STACK ?auto_42455 ?auto_42454 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42459 - BLOCK
      ?auto_42460 - BLOCK
    )
    :vars
    (
      ?auto_42461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42460 ?auto_42461 ) ( not ( = ?auto_42459 ?auto_42460 ) ) ( not ( = ?auto_42459 ?auto_42461 ) ) ( not ( = ?auto_42460 ?auto_42461 ) ) ( ON ?auto_42459 ?auto_42460 ) ( CLEAR ?auto_42459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42459 )
      ( MAKE-2PILE ?auto_42459 ?auto_42460 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42464 - BLOCK
      ?auto_42465 - BLOCK
    )
    :vars
    (
      ?auto_42466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42465 ?auto_42466 ) ( not ( = ?auto_42464 ?auto_42465 ) ) ( not ( = ?auto_42464 ?auto_42466 ) ) ( not ( = ?auto_42465 ?auto_42466 ) ) ( ON ?auto_42464 ?auto_42465 ) ( CLEAR ?auto_42464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42464 )
      ( MAKE-2PILE ?auto_42464 ?auto_42465 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42470 - BLOCK
      ?auto_42471 - BLOCK
      ?auto_42472 - BLOCK
    )
    :vars
    (
      ?auto_42473 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42471 ) ( ON ?auto_42472 ?auto_42473 ) ( CLEAR ?auto_42472 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42470 ) ( ON ?auto_42471 ?auto_42470 ) ( not ( = ?auto_42470 ?auto_42471 ) ) ( not ( = ?auto_42470 ?auto_42472 ) ) ( not ( = ?auto_42470 ?auto_42473 ) ) ( not ( = ?auto_42471 ?auto_42472 ) ) ( not ( = ?auto_42471 ?auto_42473 ) ) ( not ( = ?auto_42472 ?auto_42473 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42472 ?auto_42473 )
      ( !STACK ?auto_42472 ?auto_42471 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42477 - BLOCK
      ?auto_42478 - BLOCK
      ?auto_42479 - BLOCK
    )
    :vars
    (
      ?auto_42480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42478 ) ( ON ?auto_42479 ?auto_42480 ) ( CLEAR ?auto_42479 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42477 ) ( ON ?auto_42478 ?auto_42477 ) ( not ( = ?auto_42477 ?auto_42478 ) ) ( not ( = ?auto_42477 ?auto_42479 ) ) ( not ( = ?auto_42477 ?auto_42480 ) ) ( not ( = ?auto_42478 ?auto_42479 ) ) ( not ( = ?auto_42478 ?auto_42480 ) ) ( not ( = ?auto_42479 ?auto_42480 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42479 ?auto_42480 )
      ( !STACK ?auto_42479 ?auto_42478 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42484 - BLOCK
      ?auto_42485 - BLOCK
      ?auto_42486 - BLOCK
    )
    :vars
    (
      ?auto_42487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42486 ?auto_42487 ) ( ON-TABLE ?auto_42484 ) ( not ( = ?auto_42484 ?auto_42485 ) ) ( not ( = ?auto_42484 ?auto_42486 ) ) ( not ( = ?auto_42484 ?auto_42487 ) ) ( not ( = ?auto_42485 ?auto_42486 ) ) ( not ( = ?auto_42485 ?auto_42487 ) ) ( not ( = ?auto_42486 ?auto_42487 ) ) ( CLEAR ?auto_42484 ) ( ON ?auto_42485 ?auto_42486 ) ( CLEAR ?auto_42485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42484 ?auto_42485 )
      ( MAKE-3PILE ?auto_42484 ?auto_42485 ?auto_42486 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42491 - BLOCK
      ?auto_42492 - BLOCK
      ?auto_42493 - BLOCK
    )
    :vars
    (
      ?auto_42494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42493 ?auto_42494 ) ( ON-TABLE ?auto_42491 ) ( not ( = ?auto_42491 ?auto_42492 ) ) ( not ( = ?auto_42491 ?auto_42493 ) ) ( not ( = ?auto_42491 ?auto_42494 ) ) ( not ( = ?auto_42492 ?auto_42493 ) ) ( not ( = ?auto_42492 ?auto_42494 ) ) ( not ( = ?auto_42493 ?auto_42494 ) ) ( CLEAR ?auto_42491 ) ( ON ?auto_42492 ?auto_42493 ) ( CLEAR ?auto_42492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42491 ?auto_42492 )
      ( MAKE-3PILE ?auto_42491 ?auto_42492 ?auto_42493 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42498 - BLOCK
      ?auto_42499 - BLOCK
      ?auto_42500 - BLOCK
    )
    :vars
    (
      ?auto_42501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42500 ?auto_42501 ) ( not ( = ?auto_42498 ?auto_42499 ) ) ( not ( = ?auto_42498 ?auto_42500 ) ) ( not ( = ?auto_42498 ?auto_42501 ) ) ( not ( = ?auto_42499 ?auto_42500 ) ) ( not ( = ?auto_42499 ?auto_42501 ) ) ( not ( = ?auto_42500 ?auto_42501 ) ) ( ON ?auto_42499 ?auto_42500 ) ( ON ?auto_42498 ?auto_42499 ) ( CLEAR ?auto_42498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42498 )
      ( MAKE-3PILE ?auto_42498 ?auto_42499 ?auto_42500 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42505 - BLOCK
      ?auto_42506 - BLOCK
      ?auto_42507 - BLOCK
    )
    :vars
    (
      ?auto_42508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42507 ?auto_42508 ) ( not ( = ?auto_42505 ?auto_42506 ) ) ( not ( = ?auto_42505 ?auto_42507 ) ) ( not ( = ?auto_42505 ?auto_42508 ) ) ( not ( = ?auto_42506 ?auto_42507 ) ) ( not ( = ?auto_42506 ?auto_42508 ) ) ( not ( = ?auto_42507 ?auto_42508 ) ) ( ON ?auto_42506 ?auto_42507 ) ( ON ?auto_42505 ?auto_42506 ) ( CLEAR ?auto_42505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42505 )
      ( MAKE-3PILE ?auto_42505 ?auto_42506 ?auto_42507 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42513 - BLOCK
      ?auto_42514 - BLOCK
      ?auto_42515 - BLOCK
      ?auto_42516 - BLOCK
    )
    :vars
    (
      ?auto_42517 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42515 ) ( ON ?auto_42516 ?auto_42517 ) ( CLEAR ?auto_42516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42513 ) ( ON ?auto_42514 ?auto_42513 ) ( ON ?auto_42515 ?auto_42514 ) ( not ( = ?auto_42513 ?auto_42514 ) ) ( not ( = ?auto_42513 ?auto_42515 ) ) ( not ( = ?auto_42513 ?auto_42516 ) ) ( not ( = ?auto_42513 ?auto_42517 ) ) ( not ( = ?auto_42514 ?auto_42515 ) ) ( not ( = ?auto_42514 ?auto_42516 ) ) ( not ( = ?auto_42514 ?auto_42517 ) ) ( not ( = ?auto_42515 ?auto_42516 ) ) ( not ( = ?auto_42515 ?auto_42517 ) ) ( not ( = ?auto_42516 ?auto_42517 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42516 ?auto_42517 )
      ( !STACK ?auto_42516 ?auto_42515 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42522 - BLOCK
      ?auto_42523 - BLOCK
      ?auto_42524 - BLOCK
      ?auto_42525 - BLOCK
    )
    :vars
    (
      ?auto_42526 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42524 ) ( ON ?auto_42525 ?auto_42526 ) ( CLEAR ?auto_42525 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42522 ) ( ON ?auto_42523 ?auto_42522 ) ( ON ?auto_42524 ?auto_42523 ) ( not ( = ?auto_42522 ?auto_42523 ) ) ( not ( = ?auto_42522 ?auto_42524 ) ) ( not ( = ?auto_42522 ?auto_42525 ) ) ( not ( = ?auto_42522 ?auto_42526 ) ) ( not ( = ?auto_42523 ?auto_42524 ) ) ( not ( = ?auto_42523 ?auto_42525 ) ) ( not ( = ?auto_42523 ?auto_42526 ) ) ( not ( = ?auto_42524 ?auto_42525 ) ) ( not ( = ?auto_42524 ?auto_42526 ) ) ( not ( = ?auto_42525 ?auto_42526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42525 ?auto_42526 )
      ( !STACK ?auto_42525 ?auto_42524 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42531 - BLOCK
      ?auto_42532 - BLOCK
      ?auto_42533 - BLOCK
      ?auto_42534 - BLOCK
    )
    :vars
    (
      ?auto_42535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42534 ?auto_42535 ) ( ON-TABLE ?auto_42531 ) ( ON ?auto_42532 ?auto_42531 ) ( not ( = ?auto_42531 ?auto_42532 ) ) ( not ( = ?auto_42531 ?auto_42533 ) ) ( not ( = ?auto_42531 ?auto_42534 ) ) ( not ( = ?auto_42531 ?auto_42535 ) ) ( not ( = ?auto_42532 ?auto_42533 ) ) ( not ( = ?auto_42532 ?auto_42534 ) ) ( not ( = ?auto_42532 ?auto_42535 ) ) ( not ( = ?auto_42533 ?auto_42534 ) ) ( not ( = ?auto_42533 ?auto_42535 ) ) ( not ( = ?auto_42534 ?auto_42535 ) ) ( CLEAR ?auto_42532 ) ( ON ?auto_42533 ?auto_42534 ) ( CLEAR ?auto_42533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42531 ?auto_42532 ?auto_42533 )
      ( MAKE-4PILE ?auto_42531 ?auto_42532 ?auto_42533 ?auto_42534 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42540 - BLOCK
      ?auto_42541 - BLOCK
      ?auto_42542 - BLOCK
      ?auto_42543 - BLOCK
    )
    :vars
    (
      ?auto_42544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42543 ?auto_42544 ) ( ON-TABLE ?auto_42540 ) ( ON ?auto_42541 ?auto_42540 ) ( not ( = ?auto_42540 ?auto_42541 ) ) ( not ( = ?auto_42540 ?auto_42542 ) ) ( not ( = ?auto_42540 ?auto_42543 ) ) ( not ( = ?auto_42540 ?auto_42544 ) ) ( not ( = ?auto_42541 ?auto_42542 ) ) ( not ( = ?auto_42541 ?auto_42543 ) ) ( not ( = ?auto_42541 ?auto_42544 ) ) ( not ( = ?auto_42542 ?auto_42543 ) ) ( not ( = ?auto_42542 ?auto_42544 ) ) ( not ( = ?auto_42543 ?auto_42544 ) ) ( CLEAR ?auto_42541 ) ( ON ?auto_42542 ?auto_42543 ) ( CLEAR ?auto_42542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42540 ?auto_42541 ?auto_42542 )
      ( MAKE-4PILE ?auto_42540 ?auto_42541 ?auto_42542 ?auto_42543 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42549 - BLOCK
      ?auto_42550 - BLOCK
      ?auto_42551 - BLOCK
      ?auto_42552 - BLOCK
    )
    :vars
    (
      ?auto_42553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42552 ?auto_42553 ) ( ON-TABLE ?auto_42549 ) ( not ( = ?auto_42549 ?auto_42550 ) ) ( not ( = ?auto_42549 ?auto_42551 ) ) ( not ( = ?auto_42549 ?auto_42552 ) ) ( not ( = ?auto_42549 ?auto_42553 ) ) ( not ( = ?auto_42550 ?auto_42551 ) ) ( not ( = ?auto_42550 ?auto_42552 ) ) ( not ( = ?auto_42550 ?auto_42553 ) ) ( not ( = ?auto_42551 ?auto_42552 ) ) ( not ( = ?auto_42551 ?auto_42553 ) ) ( not ( = ?auto_42552 ?auto_42553 ) ) ( ON ?auto_42551 ?auto_42552 ) ( CLEAR ?auto_42549 ) ( ON ?auto_42550 ?auto_42551 ) ( CLEAR ?auto_42550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42549 ?auto_42550 )
      ( MAKE-4PILE ?auto_42549 ?auto_42550 ?auto_42551 ?auto_42552 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42558 - BLOCK
      ?auto_42559 - BLOCK
      ?auto_42560 - BLOCK
      ?auto_42561 - BLOCK
    )
    :vars
    (
      ?auto_42562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42561 ?auto_42562 ) ( ON-TABLE ?auto_42558 ) ( not ( = ?auto_42558 ?auto_42559 ) ) ( not ( = ?auto_42558 ?auto_42560 ) ) ( not ( = ?auto_42558 ?auto_42561 ) ) ( not ( = ?auto_42558 ?auto_42562 ) ) ( not ( = ?auto_42559 ?auto_42560 ) ) ( not ( = ?auto_42559 ?auto_42561 ) ) ( not ( = ?auto_42559 ?auto_42562 ) ) ( not ( = ?auto_42560 ?auto_42561 ) ) ( not ( = ?auto_42560 ?auto_42562 ) ) ( not ( = ?auto_42561 ?auto_42562 ) ) ( ON ?auto_42560 ?auto_42561 ) ( CLEAR ?auto_42558 ) ( ON ?auto_42559 ?auto_42560 ) ( CLEAR ?auto_42559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42558 ?auto_42559 )
      ( MAKE-4PILE ?auto_42558 ?auto_42559 ?auto_42560 ?auto_42561 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42567 - BLOCK
      ?auto_42568 - BLOCK
      ?auto_42569 - BLOCK
      ?auto_42570 - BLOCK
    )
    :vars
    (
      ?auto_42571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42570 ?auto_42571 ) ( not ( = ?auto_42567 ?auto_42568 ) ) ( not ( = ?auto_42567 ?auto_42569 ) ) ( not ( = ?auto_42567 ?auto_42570 ) ) ( not ( = ?auto_42567 ?auto_42571 ) ) ( not ( = ?auto_42568 ?auto_42569 ) ) ( not ( = ?auto_42568 ?auto_42570 ) ) ( not ( = ?auto_42568 ?auto_42571 ) ) ( not ( = ?auto_42569 ?auto_42570 ) ) ( not ( = ?auto_42569 ?auto_42571 ) ) ( not ( = ?auto_42570 ?auto_42571 ) ) ( ON ?auto_42569 ?auto_42570 ) ( ON ?auto_42568 ?auto_42569 ) ( ON ?auto_42567 ?auto_42568 ) ( CLEAR ?auto_42567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42567 )
      ( MAKE-4PILE ?auto_42567 ?auto_42568 ?auto_42569 ?auto_42570 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42576 - BLOCK
      ?auto_42577 - BLOCK
      ?auto_42578 - BLOCK
      ?auto_42579 - BLOCK
    )
    :vars
    (
      ?auto_42580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42579 ?auto_42580 ) ( not ( = ?auto_42576 ?auto_42577 ) ) ( not ( = ?auto_42576 ?auto_42578 ) ) ( not ( = ?auto_42576 ?auto_42579 ) ) ( not ( = ?auto_42576 ?auto_42580 ) ) ( not ( = ?auto_42577 ?auto_42578 ) ) ( not ( = ?auto_42577 ?auto_42579 ) ) ( not ( = ?auto_42577 ?auto_42580 ) ) ( not ( = ?auto_42578 ?auto_42579 ) ) ( not ( = ?auto_42578 ?auto_42580 ) ) ( not ( = ?auto_42579 ?auto_42580 ) ) ( ON ?auto_42578 ?auto_42579 ) ( ON ?auto_42577 ?auto_42578 ) ( ON ?auto_42576 ?auto_42577 ) ( CLEAR ?auto_42576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42576 )
      ( MAKE-4PILE ?auto_42576 ?auto_42577 ?auto_42578 ?auto_42579 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42586 - BLOCK
      ?auto_42587 - BLOCK
      ?auto_42588 - BLOCK
      ?auto_42589 - BLOCK
      ?auto_42590 - BLOCK
    )
    :vars
    (
      ?auto_42591 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42589 ) ( ON ?auto_42590 ?auto_42591 ) ( CLEAR ?auto_42590 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42586 ) ( ON ?auto_42587 ?auto_42586 ) ( ON ?auto_42588 ?auto_42587 ) ( ON ?auto_42589 ?auto_42588 ) ( not ( = ?auto_42586 ?auto_42587 ) ) ( not ( = ?auto_42586 ?auto_42588 ) ) ( not ( = ?auto_42586 ?auto_42589 ) ) ( not ( = ?auto_42586 ?auto_42590 ) ) ( not ( = ?auto_42586 ?auto_42591 ) ) ( not ( = ?auto_42587 ?auto_42588 ) ) ( not ( = ?auto_42587 ?auto_42589 ) ) ( not ( = ?auto_42587 ?auto_42590 ) ) ( not ( = ?auto_42587 ?auto_42591 ) ) ( not ( = ?auto_42588 ?auto_42589 ) ) ( not ( = ?auto_42588 ?auto_42590 ) ) ( not ( = ?auto_42588 ?auto_42591 ) ) ( not ( = ?auto_42589 ?auto_42590 ) ) ( not ( = ?auto_42589 ?auto_42591 ) ) ( not ( = ?auto_42590 ?auto_42591 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42590 ?auto_42591 )
      ( !STACK ?auto_42590 ?auto_42589 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42597 - BLOCK
      ?auto_42598 - BLOCK
      ?auto_42599 - BLOCK
      ?auto_42600 - BLOCK
      ?auto_42601 - BLOCK
    )
    :vars
    (
      ?auto_42602 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42600 ) ( ON ?auto_42601 ?auto_42602 ) ( CLEAR ?auto_42601 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42597 ) ( ON ?auto_42598 ?auto_42597 ) ( ON ?auto_42599 ?auto_42598 ) ( ON ?auto_42600 ?auto_42599 ) ( not ( = ?auto_42597 ?auto_42598 ) ) ( not ( = ?auto_42597 ?auto_42599 ) ) ( not ( = ?auto_42597 ?auto_42600 ) ) ( not ( = ?auto_42597 ?auto_42601 ) ) ( not ( = ?auto_42597 ?auto_42602 ) ) ( not ( = ?auto_42598 ?auto_42599 ) ) ( not ( = ?auto_42598 ?auto_42600 ) ) ( not ( = ?auto_42598 ?auto_42601 ) ) ( not ( = ?auto_42598 ?auto_42602 ) ) ( not ( = ?auto_42599 ?auto_42600 ) ) ( not ( = ?auto_42599 ?auto_42601 ) ) ( not ( = ?auto_42599 ?auto_42602 ) ) ( not ( = ?auto_42600 ?auto_42601 ) ) ( not ( = ?auto_42600 ?auto_42602 ) ) ( not ( = ?auto_42601 ?auto_42602 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42601 ?auto_42602 )
      ( !STACK ?auto_42601 ?auto_42600 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42608 - BLOCK
      ?auto_42609 - BLOCK
      ?auto_42610 - BLOCK
      ?auto_42611 - BLOCK
      ?auto_42612 - BLOCK
    )
    :vars
    (
      ?auto_42613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42612 ?auto_42613 ) ( ON-TABLE ?auto_42608 ) ( ON ?auto_42609 ?auto_42608 ) ( ON ?auto_42610 ?auto_42609 ) ( not ( = ?auto_42608 ?auto_42609 ) ) ( not ( = ?auto_42608 ?auto_42610 ) ) ( not ( = ?auto_42608 ?auto_42611 ) ) ( not ( = ?auto_42608 ?auto_42612 ) ) ( not ( = ?auto_42608 ?auto_42613 ) ) ( not ( = ?auto_42609 ?auto_42610 ) ) ( not ( = ?auto_42609 ?auto_42611 ) ) ( not ( = ?auto_42609 ?auto_42612 ) ) ( not ( = ?auto_42609 ?auto_42613 ) ) ( not ( = ?auto_42610 ?auto_42611 ) ) ( not ( = ?auto_42610 ?auto_42612 ) ) ( not ( = ?auto_42610 ?auto_42613 ) ) ( not ( = ?auto_42611 ?auto_42612 ) ) ( not ( = ?auto_42611 ?auto_42613 ) ) ( not ( = ?auto_42612 ?auto_42613 ) ) ( CLEAR ?auto_42610 ) ( ON ?auto_42611 ?auto_42612 ) ( CLEAR ?auto_42611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42608 ?auto_42609 ?auto_42610 ?auto_42611 )
      ( MAKE-5PILE ?auto_42608 ?auto_42609 ?auto_42610 ?auto_42611 ?auto_42612 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42619 - BLOCK
      ?auto_42620 - BLOCK
      ?auto_42621 - BLOCK
      ?auto_42622 - BLOCK
      ?auto_42623 - BLOCK
    )
    :vars
    (
      ?auto_42624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42623 ?auto_42624 ) ( ON-TABLE ?auto_42619 ) ( ON ?auto_42620 ?auto_42619 ) ( ON ?auto_42621 ?auto_42620 ) ( not ( = ?auto_42619 ?auto_42620 ) ) ( not ( = ?auto_42619 ?auto_42621 ) ) ( not ( = ?auto_42619 ?auto_42622 ) ) ( not ( = ?auto_42619 ?auto_42623 ) ) ( not ( = ?auto_42619 ?auto_42624 ) ) ( not ( = ?auto_42620 ?auto_42621 ) ) ( not ( = ?auto_42620 ?auto_42622 ) ) ( not ( = ?auto_42620 ?auto_42623 ) ) ( not ( = ?auto_42620 ?auto_42624 ) ) ( not ( = ?auto_42621 ?auto_42622 ) ) ( not ( = ?auto_42621 ?auto_42623 ) ) ( not ( = ?auto_42621 ?auto_42624 ) ) ( not ( = ?auto_42622 ?auto_42623 ) ) ( not ( = ?auto_42622 ?auto_42624 ) ) ( not ( = ?auto_42623 ?auto_42624 ) ) ( CLEAR ?auto_42621 ) ( ON ?auto_42622 ?auto_42623 ) ( CLEAR ?auto_42622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42619 ?auto_42620 ?auto_42621 ?auto_42622 )
      ( MAKE-5PILE ?auto_42619 ?auto_42620 ?auto_42621 ?auto_42622 ?auto_42623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42630 - BLOCK
      ?auto_42631 - BLOCK
      ?auto_42632 - BLOCK
      ?auto_42633 - BLOCK
      ?auto_42634 - BLOCK
    )
    :vars
    (
      ?auto_42635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42634 ?auto_42635 ) ( ON-TABLE ?auto_42630 ) ( ON ?auto_42631 ?auto_42630 ) ( not ( = ?auto_42630 ?auto_42631 ) ) ( not ( = ?auto_42630 ?auto_42632 ) ) ( not ( = ?auto_42630 ?auto_42633 ) ) ( not ( = ?auto_42630 ?auto_42634 ) ) ( not ( = ?auto_42630 ?auto_42635 ) ) ( not ( = ?auto_42631 ?auto_42632 ) ) ( not ( = ?auto_42631 ?auto_42633 ) ) ( not ( = ?auto_42631 ?auto_42634 ) ) ( not ( = ?auto_42631 ?auto_42635 ) ) ( not ( = ?auto_42632 ?auto_42633 ) ) ( not ( = ?auto_42632 ?auto_42634 ) ) ( not ( = ?auto_42632 ?auto_42635 ) ) ( not ( = ?auto_42633 ?auto_42634 ) ) ( not ( = ?auto_42633 ?auto_42635 ) ) ( not ( = ?auto_42634 ?auto_42635 ) ) ( ON ?auto_42633 ?auto_42634 ) ( CLEAR ?auto_42631 ) ( ON ?auto_42632 ?auto_42633 ) ( CLEAR ?auto_42632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42630 ?auto_42631 ?auto_42632 )
      ( MAKE-5PILE ?auto_42630 ?auto_42631 ?auto_42632 ?auto_42633 ?auto_42634 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42641 - BLOCK
      ?auto_42642 - BLOCK
      ?auto_42643 - BLOCK
      ?auto_42644 - BLOCK
      ?auto_42645 - BLOCK
    )
    :vars
    (
      ?auto_42646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42645 ?auto_42646 ) ( ON-TABLE ?auto_42641 ) ( ON ?auto_42642 ?auto_42641 ) ( not ( = ?auto_42641 ?auto_42642 ) ) ( not ( = ?auto_42641 ?auto_42643 ) ) ( not ( = ?auto_42641 ?auto_42644 ) ) ( not ( = ?auto_42641 ?auto_42645 ) ) ( not ( = ?auto_42641 ?auto_42646 ) ) ( not ( = ?auto_42642 ?auto_42643 ) ) ( not ( = ?auto_42642 ?auto_42644 ) ) ( not ( = ?auto_42642 ?auto_42645 ) ) ( not ( = ?auto_42642 ?auto_42646 ) ) ( not ( = ?auto_42643 ?auto_42644 ) ) ( not ( = ?auto_42643 ?auto_42645 ) ) ( not ( = ?auto_42643 ?auto_42646 ) ) ( not ( = ?auto_42644 ?auto_42645 ) ) ( not ( = ?auto_42644 ?auto_42646 ) ) ( not ( = ?auto_42645 ?auto_42646 ) ) ( ON ?auto_42644 ?auto_42645 ) ( CLEAR ?auto_42642 ) ( ON ?auto_42643 ?auto_42644 ) ( CLEAR ?auto_42643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42641 ?auto_42642 ?auto_42643 )
      ( MAKE-5PILE ?auto_42641 ?auto_42642 ?auto_42643 ?auto_42644 ?auto_42645 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42652 - BLOCK
      ?auto_42653 - BLOCK
      ?auto_42654 - BLOCK
      ?auto_42655 - BLOCK
      ?auto_42656 - BLOCK
    )
    :vars
    (
      ?auto_42657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42656 ?auto_42657 ) ( ON-TABLE ?auto_42652 ) ( not ( = ?auto_42652 ?auto_42653 ) ) ( not ( = ?auto_42652 ?auto_42654 ) ) ( not ( = ?auto_42652 ?auto_42655 ) ) ( not ( = ?auto_42652 ?auto_42656 ) ) ( not ( = ?auto_42652 ?auto_42657 ) ) ( not ( = ?auto_42653 ?auto_42654 ) ) ( not ( = ?auto_42653 ?auto_42655 ) ) ( not ( = ?auto_42653 ?auto_42656 ) ) ( not ( = ?auto_42653 ?auto_42657 ) ) ( not ( = ?auto_42654 ?auto_42655 ) ) ( not ( = ?auto_42654 ?auto_42656 ) ) ( not ( = ?auto_42654 ?auto_42657 ) ) ( not ( = ?auto_42655 ?auto_42656 ) ) ( not ( = ?auto_42655 ?auto_42657 ) ) ( not ( = ?auto_42656 ?auto_42657 ) ) ( ON ?auto_42655 ?auto_42656 ) ( ON ?auto_42654 ?auto_42655 ) ( CLEAR ?auto_42652 ) ( ON ?auto_42653 ?auto_42654 ) ( CLEAR ?auto_42653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42652 ?auto_42653 )
      ( MAKE-5PILE ?auto_42652 ?auto_42653 ?auto_42654 ?auto_42655 ?auto_42656 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42663 - BLOCK
      ?auto_42664 - BLOCK
      ?auto_42665 - BLOCK
      ?auto_42666 - BLOCK
      ?auto_42667 - BLOCK
    )
    :vars
    (
      ?auto_42668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42667 ?auto_42668 ) ( ON-TABLE ?auto_42663 ) ( not ( = ?auto_42663 ?auto_42664 ) ) ( not ( = ?auto_42663 ?auto_42665 ) ) ( not ( = ?auto_42663 ?auto_42666 ) ) ( not ( = ?auto_42663 ?auto_42667 ) ) ( not ( = ?auto_42663 ?auto_42668 ) ) ( not ( = ?auto_42664 ?auto_42665 ) ) ( not ( = ?auto_42664 ?auto_42666 ) ) ( not ( = ?auto_42664 ?auto_42667 ) ) ( not ( = ?auto_42664 ?auto_42668 ) ) ( not ( = ?auto_42665 ?auto_42666 ) ) ( not ( = ?auto_42665 ?auto_42667 ) ) ( not ( = ?auto_42665 ?auto_42668 ) ) ( not ( = ?auto_42666 ?auto_42667 ) ) ( not ( = ?auto_42666 ?auto_42668 ) ) ( not ( = ?auto_42667 ?auto_42668 ) ) ( ON ?auto_42666 ?auto_42667 ) ( ON ?auto_42665 ?auto_42666 ) ( CLEAR ?auto_42663 ) ( ON ?auto_42664 ?auto_42665 ) ( CLEAR ?auto_42664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42663 ?auto_42664 )
      ( MAKE-5PILE ?auto_42663 ?auto_42664 ?auto_42665 ?auto_42666 ?auto_42667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42674 - BLOCK
      ?auto_42675 - BLOCK
      ?auto_42676 - BLOCK
      ?auto_42677 - BLOCK
      ?auto_42678 - BLOCK
    )
    :vars
    (
      ?auto_42679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42678 ?auto_42679 ) ( not ( = ?auto_42674 ?auto_42675 ) ) ( not ( = ?auto_42674 ?auto_42676 ) ) ( not ( = ?auto_42674 ?auto_42677 ) ) ( not ( = ?auto_42674 ?auto_42678 ) ) ( not ( = ?auto_42674 ?auto_42679 ) ) ( not ( = ?auto_42675 ?auto_42676 ) ) ( not ( = ?auto_42675 ?auto_42677 ) ) ( not ( = ?auto_42675 ?auto_42678 ) ) ( not ( = ?auto_42675 ?auto_42679 ) ) ( not ( = ?auto_42676 ?auto_42677 ) ) ( not ( = ?auto_42676 ?auto_42678 ) ) ( not ( = ?auto_42676 ?auto_42679 ) ) ( not ( = ?auto_42677 ?auto_42678 ) ) ( not ( = ?auto_42677 ?auto_42679 ) ) ( not ( = ?auto_42678 ?auto_42679 ) ) ( ON ?auto_42677 ?auto_42678 ) ( ON ?auto_42676 ?auto_42677 ) ( ON ?auto_42675 ?auto_42676 ) ( ON ?auto_42674 ?auto_42675 ) ( CLEAR ?auto_42674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42674 )
      ( MAKE-5PILE ?auto_42674 ?auto_42675 ?auto_42676 ?auto_42677 ?auto_42678 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42685 - BLOCK
      ?auto_42686 - BLOCK
      ?auto_42687 - BLOCK
      ?auto_42688 - BLOCK
      ?auto_42689 - BLOCK
    )
    :vars
    (
      ?auto_42690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42689 ?auto_42690 ) ( not ( = ?auto_42685 ?auto_42686 ) ) ( not ( = ?auto_42685 ?auto_42687 ) ) ( not ( = ?auto_42685 ?auto_42688 ) ) ( not ( = ?auto_42685 ?auto_42689 ) ) ( not ( = ?auto_42685 ?auto_42690 ) ) ( not ( = ?auto_42686 ?auto_42687 ) ) ( not ( = ?auto_42686 ?auto_42688 ) ) ( not ( = ?auto_42686 ?auto_42689 ) ) ( not ( = ?auto_42686 ?auto_42690 ) ) ( not ( = ?auto_42687 ?auto_42688 ) ) ( not ( = ?auto_42687 ?auto_42689 ) ) ( not ( = ?auto_42687 ?auto_42690 ) ) ( not ( = ?auto_42688 ?auto_42689 ) ) ( not ( = ?auto_42688 ?auto_42690 ) ) ( not ( = ?auto_42689 ?auto_42690 ) ) ( ON ?auto_42688 ?auto_42689 ) ( ON ?auto_42687 ?auto_42688 ) ( ON ?auto_42686 ?auto_42687 ) ( ON ?auto_42685 ?auto_42686 ) ( CLEAR ?auto_42685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42685 )
      ( MAKE-5PILE ?auto_42685 ?auto_42686 ?auto_42687 ?auto_42688 ?auto_42689 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42697 - BLOCK
      ?auto_42698 - BLOCK
      ?auto_42699 - BLOCK
      ?auto_42700 - BLOCK
      ?auto_42701 - BLOCK
      ?auto_42702 - BLOCK
    )
    :vars
    (
      ?auto_42703 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42701 ) ( ON ?auto_42702 ?auto_42703 ) ( CLEAR ?auto_42702 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42697 ) ( ON ?auto_42698 ?auto_42697 ) ( ON ?auto_42699 ?auto_42698 ) ( ON ?auto_42700 ?auto_42699 ) ( ON ?auto_42701 ?auto_42700 ) ( not ( = ?auto_42697 ?auto_42698 ) ) ( not ( = ?auto_42697 ?auto_42699 ) ) ( not ( = ?auto_42697 ?auto_42700 ) ) ( not ( = ?auto_42697 ?auto_42701 ) ) ( not ( = ?auto_42697 ?auto_42702 ) ) ( not ( = ?auto_42697 ?auto_42703 ) ) ( not ( = ?auto_42698 ?auto_42699 ) ) ( not ( = ?auto_42698 ?auto_42700 ) ) ( not ( = ?auto_42698 ?auto_42701 ) ) ( not ( = ?auto_42698 ?auto_42702 ) ) ( not ( = ?auto_42698 ?auto_42703 ) ) ( not ( = ?auto_42699 ?auto_42700 ) ) ( not ( = ?auto_42699 ?auto_42701 ) ) ( not ( = ?auto_42699 ?auto_42702 ) ) ( not ( = ?auto_42699 ?auto_42703 ) ) ( not ( = ?auto_42700 ?auto_42701 ) ) ( not ( = ?auto_42700 ?auto_42702 ) ) ( not ( = ?auto_42700 ?auto_42703 ) ) ( not ( = ?auto_42701 ?auto_42702 ) ) ( not ( = ?auto_42701 ?auto_42703 ) ) ( not ( = ?auto_42702 ?auto_42703 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42702 ?auto_42703 )
      ( !STACK ?auto_42702 ?auto_42701 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42710 - BLOCK
      ?auto_42711 - BLOCK
      ?auto_42712 - BLOCK
      ?auto_42713 - BLOCK
      ?auto_42714 - BLOCK
      ?auto_42715 - BLOCK
    )
    :vars
    (
      ?auto_42716 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42714 ) ( ON ?auto_42715 ?auto_42716 ) ( CLEAR ?auto_42715 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42710 ) ( ON ?auto_42711 ?auto_42710 ) ( ON ?auto_42712 ?auto_42711 ) ( ON ?auto_42713 ?auto_42712 ) ( ON ?auto_42714 ?auto_42713 ) ( not ( = ?auto_42710 ?auto_42711 ) ) ( not ( = ?auto_42710 ?auto_42712 ) ) ( not ( = ?auto_42710 ?auto_42713 ) ) ( not ( = ?auto_42710 ?auto_42714 ) ) ( not ( = ?auto_42710 ?auto_42715 ) ) ( not ( = ?auto_42710 ?auto_42716 ) ) ( not ( = ?auto_42711 ?auto_42712 ) ) ( not ( = ?auto_42711 ?auto_42713 ) ) ( not ( = ?auto_42711 ?auto_42714 ) ) ( not ( = ?auto_42711 ?auto_42715 ) ) ( not ( = ?auto_42711 ?auto_42716 ) ) ( not ( = ?auto_42712 ?auto_42713 ) ) ( not ( = ?auto_42712 ?auto_42714 ) ) ( not ( = ?auto_42712 ?auto_42715 ) ) ( not ( = ?auto_42712 ?auto_42716 ) ) ( not ( = ?auto_42713 ?auto_42714 ) ) ( not ( = ?auto_42713 ?auto_42715 ) ) ( not ( = ?auto_42713 ?auto_42716 ) ) ( not ( = ?auto_42714 ?auto_42715 ) ) ( not ( = ?auto_42714 ?auto_42716 ) ) ( not ( = ?auto_42715 ?auto_42716 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42715 ?auto_42716 )
      ( !STACK ?auto_42715 ?auto_42714 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42723 - BLOCK
      ?auto_42724 - BLOCK
      ?auto_42725 - BLOCK
      ?auto_42726 - BLOCK
      ?auto_42727 - BLOCK
      ?auto_42728 - BLOCK
    )
    :vars
    (
      ?auto_42729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42728 ?auto_42729 ) ( ON-TABLE ?auto_42723 ) ( ON ?auto_42724 ?auto_42723 ) ( ON ?auto_42725 ?auto_42724 ) ( ON ?auto_42726 ?auto_42725 ) ( not ( = ?auto_42723 ?auto_42724 ) ) ( not ( = ?auto_42723 ?auto_42725 ) ) ( not ( = ?auto_42723 ?auto_42726 ) ) ( not ( = ?auto_42723 ?auto_42727 ) ) ( not ( = ?auto_42723 ?auto_42728 ) ) ( not ( = ?auto_42723 ?auto_42729 ) ) ( not ( = ?auto_42724 ?auto_42725 ) ) ( not ( = ?auto_42724 ?auto_42726 ) ) ( not ( = ?auto_42724 ?auto_42727 ) ) ( not ( = ?auto_42724 ?auto_42728 ) ) ( not ( = ?auto_42724 ?auto_42729 ) ) ( not ( = ?auto_42725 ?auto_42726 ) ) ( not ( = ?auto_42725 ?auto_42727 ) ) ( not ( = ?auto_42725 ?auto_42728 ) ) ( not ( = ?auto_42725 ?auto_42729 ) ) ( not ( = ?auto_42726 ?auto_42727 ) ) ( not ( = ?auto_42726 ?auto_42728 ) ) ( not ( = ?auto_42726 ?auto_42729 ) ) ( not ( = ?auto_42727 ?auto_42728 ) ) ( not ( = ?auto_42727 ?auto_42729 ) ) ( not ( = ?auto_42728 ?auto_42729 ) ) ( CLEAR ?auto_42726 ) ( ON ?auto_42727 ?auto_42728 ) ( CLEAR ?auto_42727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42723 ?auto_42724 ?auto_42725 ?auto_42726 ?auto_42727 )
      ( MAKE-6PILE ?auto_42723 ?auto_42724 ?auto_42725 ?auto_42726 ?auto_42727 ?auto_42728 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42736 - BLOCK
      ?auto_42737 - BLOCK
      ?auto_42738 - BLOCK
      ?auto_42739 - BLOCK
      ?auto_42740 - BLOCK
      ?auto_42741 - BLOCK
    )
    :vars
    (
      ?auto_42742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42741 ?auto_42742 ) ( ON-TABLE ?auto_42736 ) ( ON ?auto_42737 ?auto_42736 ) ( ON ?auto_42738 ?auto_42737 ) ( ON ?auto_42739 ?auto_42738 ) ( not ( = ?auto_42736 ?auto_42737 ) ) ( not ( = ?auto_42736 ?auto_42738 ) ) ( not ( = ?auto_42736 ?auto_42739 ) ) ( not ( = ?auto_42736 ?auto_42740 ) ) ( not ( = ?auto_42736 ?auto_42741 ) ) ( not ( = ?auto_42736 ?auto_42742 ) ) ( not ( = ?auto_42737 ?auto_42738 ) ) ( not ( = ?auto_42737 ?auto_42739 ) ) ( not ( = ?auto_42737 ?auto_42740 ) ) ( not ( = ?auto_42737 ?auto_42741 ) ) ( not ( = ?auto_42737 ?auto_42742 ) ) ( not ( = ?auto_42738 ?auto_42739 ) ) ( not ( = ?auto_42738 ?auto_42740 ) ) ( not ( = ?auto_42738 ?auto_42741 ) ) ( not ( = ?auto_42738 ?auto_42742 ) ) ( not ( = ?auto_42739 ?auto_42740 ) ) ( not ( = ?auto_42739 ?auto_42741 ) ) ( not ( = ?auto_42739 ?auto_42742 ) ) ( not ( = ?auto_42740 ?auto_42741 ) ) ( not ( = ?auto_42740 ?auto_42742 ) ) ( not ( = ?auto_42741 ?auto_42742 ) ) ( CLEAR ?auto_42739 ) ( ON ?auto_42740 ?auto_42741 ) ( CLEAR ?auto_42740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42736 ?auto_42737 ?auto_42738 ?auto_42739 ?auto_42740 )
      ( MAKE-6PILE ?auto_42736 ?auto_42737 ?auto_42738 ?auto_42739 ?auto_42740 ?auto_42741 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42749 - BLOCK
      ?auto_42750 - BLOCK
      ?auto_42751 - BLOCK
      ?auto_42752 - BLOCK
      ?auto_42753 - BLOCK
      ?auto_42754 - BLOCK
    )
    :vars
    (
      ?auto_42755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42754 ?auto_42755 ) ( ON-TABLE ?auto_42749 ) ( ON ?auto_42750 ?auto_42749 ) ( ON ?auto_42751 ?auto_42750 ) ( not ( = ?auto_42749 ?auto_42750 ) ) ( not ( = ?auto_42749 ?auto_42751 ) ) ( not ( = ?auto_42749 ?auto_42752 ) ) ( not ( = ?auto_42749 ?auto_42753 ) ) ( not ( = ?auto_42749 ?auto_42754 ) ) ( not ( = ?auto_42749 ?auto_42755 ) ) ( not ( = ?auto_42750 ?auto_42751 ) ) ( not ( = ?auto_42750 ?auto_42752 ) ) ( not ( = ?auto_42750 ?auto_42753 ) ) ( not ( = ?auto_42750 ?auto_42754 ) ) ( not ( = ?auto_42750 ?auto_42755 ) ) ( not ( = ?auto_42751 ?auto_42752 ) ) ( not ( = ?auto_42751 ?auto_42753 ) ) ( not ( = ?auto_42751 ?auto_42754 ) ) ( not ( = ?auto_42751 ?auto_42755 ) ) ( not ( = ?auto_42752 ?auto_42753 ) ) ( not ( = ?auto_42752 ?auto_42754 ) ) ( not ( = ?auto_42752 ?auto_42755 ) ) ( not ( = ?auto_42753 ?auto_42754 ) ) ( not ( = ?auto_42753 ?auto_42755 ) ) ( not ( = ?auto_42754 ?auto_42755 ) ) ( ON ?auto_42753 ?auto_42754 ) ( CLEAR ?auto_42751 ) ( ON ?auto_42752 ?auto_42753 ) ( CLEAR ?auto_42752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42749 ?auto_42750 ?auto_42751 ?auto_42752 )
      ( MAKE-6PILE ?auto_42749 ?auto_42750 ?auto_42751 ?auto_42752 ?auto_42753 ?auto_42754 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42762 - BLOCK
      ?auto_42763 - BLOCK
      ?auto_42764 - BLOCK
      ?auto_42765 - BLOCK
      ?auto_42766 - BLOCK
      ?auto_42767 - BLOCK
    )
    :vars
    (
      ?auto_42768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42767 ?auto_42768 ) ( ON-TABLE ?auto_42762 ) ( ON ?auto_42763 ?auto_42762 ) ( ON ?auto_42764 ?auto_42763 ) ( not ( = ?auto_42762 ?auto_42763 ) ) ( not ( = ?auto_42762 ?auto_42764 ) ) ( not ( = ?auto_42762 ?auto_42765 ) ) ( not ( = ?auto_42762 ?auto_42766 ) ) ( not ( = ?auto_42762 ?auto_42767 ) ) ( not ( = ?auto_42762 ?auto_42768 ) ) ( not ( = ?auto_42763 ?auto_42764 ) ) ( not ( = ?auto_42763 ?auto_42765 ) ) ( not ( = ?auto_42763 ?auto_42766 ) ) ( not ( = ?auto_42763 ?auto_42767 ) ) ( not ( = ?auto_42763 ?auto_42768 ) ) ( not ( = ?auto_42764 ?auto_42765 ) ) ( not ( = ?auto_42764 ?auto_42766 ) ) ( not ( = ?auto_42764 ?auto_42767 ) ) ( not ( = ?auto_42764 ?auto_42768 ) ) ( not ( = ?auto_42765 ?auto_42766 ) ) ( not ( = ?auto_42765 ?auto_42767 ) ) ( not ( = ?auto_42765 ?auto_42768 ) ) ( not ( = ?auto_42766 ?auto_42767 ) ) ( not ( = ?auto_42766 ?auto_42768 ) ) ( not ( = ?auto_42767 ?auto_42768 ) ) ( ON ?auto_42766 ?auto_42767 ) ( CLEAR ?auto_42764 ) ( ON ?auto_42765 ?auto_42766 ) ( CLEAR ?auto_42765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42762 ?auto_42763 ?auto_42764 ?auto_42765 )
      ( MAKE-6PILE ?auto_42762 ?auto_42763 ?auto_42764 ?auto_42765 ?auto_42766 ?auto_42767 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42775 - BLOCK
      ?auto_42776 - BLOCK
      ?auto_42777 - BLOCK
      ?auto_42778 - BLOCK
      ?auto_42779 - BLOCK
      ?auto_42780 - BLOCK
    )
    :vars
    (
      ?auto_42781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42780 ?auto_42781 ) ( ON-TABLE ?auto_42775 ) ( ON ?auto_42776 ?auto_42775 ) ( not ( = ?auto_42775 ?auto_42776 ) ) ( not ( = ?auto_42775 ?auto_42777 ) ) ( not ( = ?auto_42775 ?auto_42778 ) ) ( not ( = ?auto_42775 ?auto_42779 ) ) ( not ( = ?auto_42775 ?auto_42780 ) ) ( not ( = ?auto_42775 ?auto_42781 ) ) ( not ( = ?auto_42776 ?auto_42777 ) ) ( not ( = ?auto_42776 ?auto_42778 ) ) ( not ( = ?auto_42776 ?auto_42779 ) ) ( not ( = ?auto_42776 ?auto_42780 ) ) ( not ( = ?auto_42776 ?auto_42781 ) ) ( not ( = ?auto_42777 ?auto_42778 ) ) ( not ( = ?auto_42777 ?auto_42779 ) ) ( not ( = ?auto_42777 ?auto_42780 ) ) ( not ( = ?auto_42777 ?auto_42781 ) ) ( not ( = ?auto_42778 ?auto_42779 ) ) ( not ( = ?auto_42778 ?auto_42780 ) ) ( not ( = ?auto_42778 ?auto_42781 ) ) ( not ( = ?auto_42779 ?auto_42780 ) ) ( not ( = ?auto_42779 ?auto_42781 ) ) ( not ( = ?auto_42780 ?auto_42781 ) ) ( ON ?auto_42779 ?auto_42780 ) ( ON ?auto_42778 ?auto_42779 ) ( CLEAR ?auto_42776 ) ( ON ?auto_42777 ?auto_42778 ) ( CLEAR ?auto_42777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42775 ?auto_42776 ?auto_42777 )
      ( MAKE-6PILE ?auto_42775 ?auto_42776 ?auto_42777 ?auto_42778 ?auto_42779 ?auto_42780 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42788 - BLOCK
      ?auto_42789 - BLOCK
      ?auto_42790 - BLOCK
      ?auto_42791 - BLOCK
      ?auto_42792 - BLOCK
      ?auto_42793 - BLOCK
    )
    :vars
    (
      ?auto_42794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42793 ?auto_42794 ) ( ON-TABLE ?auto_42788 ) ( ON ?auto_42789 ?auto_42788 ) ( not ( = ?auto_42788 ?auto_42789 ) ) ( not ( = ?auto_42788 ?auto_42790 ) ) ( not ( = ?auto_42788 ?auto_42791 ) ) ( not ( = ?auto_42788 ?auto_42792 ) ) ( not ( = ?auto_42788 ?auto_42793 ) ) ( not ( = ?auto_42788 ?auto_42794 ) ) ( not ( = ?auto_42789 ?auto_42790 ) ) ( not ( = ?auto_42789 ?auto_42791 ) ) ( not ( = ?auto_42789 ?auto_42792 ) ) ( not ( = ?auto_42789 ?auto_42793 ) ) ( not ( = ?auto_42789 ?auto_42794 ) ) ( not ( = ?auto_42790 ?auto_42791 ) ) ( not ( = ?auto_42790 ?auto_42792 ) ) ( not ( = ?auto_42790 ?auto_42793 ) ) ( not ( = ?auto_42790 ?auto_42794 ) ) ( not ( = ?auto_42791 ?auto_42792 ) ) ( not ( = ?auto_42791 ?auto_42793 ) ) ( not ( = ?auto_42791 ?auto_42794 ) ) ( not ( = ?auto_42792 ?auto_42793 ) ) ( not ( = ?auto_42792 ?auto_42794 ) ) ( not ( = ?auto_42793 ?auto_42794 ) ) ( ON ?auto_42792 ?auto_42793 ) ( ON ?auto_42791 ?auto_42792 ) ( CLEAR ?auto_42789 ) ( ON ?auto_42790 ?auto_42791 ) ( CLEAR ?auto_42790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42788 ?auto_42789 ?auto_42790 )
      ( MAKE-6PILE ?auto_42788 ?auto_42789 ?auto_42790 ?auto_42791 ?auto_42792 ?auto_42793 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42801 - BLOCK
      ?auto_42802 - BLOCK
      ?auto_42803 - BLOCK
      ?auto_42804 - BLOCK
      ?auto_42805 - BLOCK
      ?auto_42806 - BLOCK
    )
    :vars
    (
      ?auto_42807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42806 ?auto_42807 ) ( ON-TABLE ?auto_42801 ) ( not ( = ?auto_42801 ?auto_42802 ) ) ( not ( = ?auto_42801 ?auto_42803 ) ) ( not ( = ?auto_42801 ?auto_42804 ) ) ( not ( = ?auto_42801 ?auto_42805 ) ) ( not ( = ?auto_42801 ?auto_42806 ) ) ( not ( = ?auto_42801 ?auto_42807 ) ) ( not ( = ?auto_42802 ?auto_42803 ) ) ( not ( = ?auto_42802 ?auto_42804 ) ) ( not ( = ?auto_42802 ?auto_42805 ) ) ( not ( = ?auto_42802 ?auto_42806 ) ) ( not ( = ?auto_42802 ?auto_42807 ) ) ( not ( = ?auto_42803 ?auto_42804 ) ) ( not ( = ?auto_42803 ?auto_42805 ) ) ( not ( = ?auto_42803 ?auto_42806 ) ) ( not ( = ?auto_42803 ?auto_42807 ) ) ( not ( = ?auto_42804 ?auto_42805 ) ) ( not ( = ?auto_42804 ?auto_42806 ) ) ( not ( = ?auto_42804 ?auto_42807 ) ) ( not ( = ?auto_42805 ?auto_42806 ) ) ( not ( = ?auto_42805 ?auto_42807 ) ) ( not ( = ?auto_42806 ?auto_42807 ) ) ( ON ?auto_42805 ?auto_42806 ) ( ON ?auto_42804 ?auto_42805 ) ( ON ?auto_42803 ?auto_42804 ) ( CLEAR ?auto_42801 ) ( ON ?auto_42802 ?auto_42803 ) ( CLEAR ?auto_42802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42801 ?auto_42802 )
      ( MAKE-6PILE ?auto_42801 ?auto_42802 ?auto_42803 ?auto_42804 ?auto_42805 ?auto_42806 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42814 - BLOCK
      ?auto_42815 - BLOCK
      ?auto_42816 - BLOCK
      ?auto_42817 - BLOCK
      ?auto_42818 - BLOCK
      ?auto_42819 - BLOCK
    )
    :vars
    (
      ?auto_42820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42819 ?auto_42820 ) ( ON-TABLE ?auto_42814 ) ( not ( = ?auto_42814 ?auto_42815 ) ) ( not ( = ?auto_42814 ?auto_42816 ) ) ( not ( = ?auto_42814 ?auto_42817 ) ) ( not ( = ?auto_42814 ?auto_42818 ) ) ( not ( = ?auto_42814 ?auto_42819 ) ) ( not ( = ?auto_42814 ?auto_42820 ) ) ( not ( = ?auto_42815 ?auto_42816 ) ) ( not ( = ?auto_42815 ?auto_42817 ) ) ( not ( = ?auto_42815 ?auto_42818 ) ) ( not ( = ?auto_42815 ?auto_42819 ) ) ( not ( = ?auto_42815 ?auto_42820 ) ) ( not ( = ?auto_42816 ?auto_42817 ) ) ( not ( = ?auto_42816 ?auto_42818 ) ) ( not ( = ?auto_42816 ?auto_42819 ) ) ( not ( = ?auto_42816 ?auto_42820 ) ) ( not ( = ?auto_42817 ?auto_42818 ) ) ( not ( = ?auto_42817 ?auto_42819 ) ) ( not ( = ?auto_42817 ?auto_42820 ) ) ( not ( = ?auto_42818 ?auto_42819 ) ) ( not ( = ?auto_42818 ?auto_42820 ) ) ( not ( = ?auto_42819 ?auto_42820 ) ) ( ON ?auto_42818 ?auto_42819 ) ( ON ?auto_42817 ?auto_42818 ) ( ON ?auto_42816 ?auto_42817 ) ( CLEAR ?auto_42814 ) ( ON ?auto_42815 ?auto_42816 ) ( CLEAR ?auto_42815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42814 ?auto_42815 )
      ( MAKE-6PILE ?auto_42814 ?auto_42815 ?auto_42816 ?auto_42817 ?auto_42818 ?auto_42819 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42827 - BLOCK
      ?auto_42828 - BLOCK
      ?auto_42829 - BLOCK
      ?auto_42830 - BLOCK
      ?auto_42831 - BLOCK
      ?auto_42832 - BLOCK
    )
    :vars
    (
      ?auto_42833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42832 ?auto_42833 ) ( not ( = ?auto_42827 ?auto_42828 ) ) ( not ( = ?auto_42827 ?auto_42829 ) ) ( not ( = ?auto_42827 ?auto_42830 ) ) ( not ( = ?auto_42827 ?auto_42831 ) ) ( not ( = ?auto_42827 ?auto_42832 ) ) ( not ( = ?auto_42827 ?auto_42833 ) ) ( not ( = ?auto_42828 ?auto_42829 ) ) ( not ( = ?auto_42828 ?auto_42830 ) ) ( not ( = ?auto_42828 ?auto_42831 ) ) ( not ( = ?auto_42828 ?auto_42832 ) ) ( not ( = ?auto_42828 ?auto_42833 ) ) ( not ( = ?auto_42829 ?auto_42830 ) ) ( not ( = ?auto_42829 ?auto_42831 ) ) ( not ( = ?auto_42829 ?auto_42832 ) ) ( not ( = ?auto_42829 ?auto_42833 ) ) ( not ( = ?auto_42830 ?auto_42831 ) ) ( not ( = ?auto_42830 ?auto_42832 ) ) ( not ( = ?auto_42830 ?auto_42833 ) ) ( not ( = ?auto_42831 ?auto_42832 ) ) ( not ( = ?auto_42831 ?auto_42833 ) ) ( not ( = ?auto_42832 ?auto_42833 ) ) ( ON ?auto_42831 ?auto_42832 ) ( ON ?auto_42830 ?auto_42831 ) ( ON ?auto_42829 ?auto_42830 ) ( ON ?auto_42828 ?auto_42829 ) ( ON ?auto_42827 ?auto_42828 ) ( CLEAR ?auto_42827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42827 )
      ( MAKE-6PILE ?auto_42827 ?auto_42828 ?auto_42829 ?auto_42830 ?auto_42831 ?auto_42832 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42840 - BLOCK
      ?auto_42841 - BLOCK
      ?auto_42842 - BLOCK
      ?auto_42843 - BLOCK
      ?auto_42844 - BLOCK
      ?auto_42845 - BLOCK
    )
    :vars
    (
      ?auto_42846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42845 ?auto_42846 ) ( not ( = ?auto_42840 ?auto_42841 ) ) ( not ( = ?auto_42840 ?auto_42842 ) ) ( not ( = ?auto_42840 ?auto_42843 ) ) ( not ( = ?auto_42840 ?auto_42844 ) ) ( not ( = ?auto_42840 ?auto_42845 ) ) ( not ( = ?auto_42840 ?auto_42846 ) ) ( not ( = ?auto_42841 ?auto_42842 ) ) ( not ( = ?auto_42841 ?auto_42843 ) ) ( not ( = ?auto_42841 ?auto_42844 ) ) ( not ( = ?auto_42841 ?auto_42845 ) ) ( not ( = ?auto_42841 ?auto_42846 ) ) ( not ( = ?auto_42842 ?auto_42843 ) ) ( not ( = ?auto_42842 ?auto_42844 ) ) ( not ( = ?auto_42842 ?auto_42845 ) ) ( not ( = ?auto_42842 ?auto_42846 ) ) ( not ( = ?auto_42843 ?auto_42844 ) ) ( not ( = ?auto_42843 ?auto_42845 ) ) ( not ( = ?auto_42843 ?auto_42846 ) ) ( not ( = ?auto_42844 ?auto_42845 ) ) ( not ( = ?auto_42844 ?auto_42846 ) ) ( not ( = ?auto_42845 ?auto_42846 ) ) ( ON ?auto_42844 ?auto_42845 ) ( ON ?auto_42843 ?auto_42844 ) ( ON ?auto_42842 ?auto_42843 ) ( ON ?auto_42841 ?auto_42842 ) ( ON ?auto_42840 ?auto_42841 ) ( CLEAR ?auto_42840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42840 )
      ( MAKE-6PILE ?auto_42840 ?auto_42841 ?auto_42842 ?auto_42843 ?auto_42844 ?auto_42845 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42854 - BLOCK
      ?auto_42855 - BLOCK
      ?auto_42856 - BLOCK
      ?auto_42857 - BLOCK
      ?auto_42858 - BLOCK
      ?auto_42859 - BLOCK
      ?auto_42860 - BLOCK
    )
    :vars
    (
      ?auto_42861 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42859 ) ( ON ?auto_42860 ?auto_42861 ) ( CLEAR ?auto_42860 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42854 ) ( ON ?auto_42855 ?auto_42854 ) ( ON ?auto_42856 ?auto_42855 ) ( ON ?auto_42857 ?auto_42856 ) ( ON ?auto_42858 ?auto_42857 ) ( ON ?auto_42859 ?auto_42858 ) ( not ( = ?auto_42854 ?auto_42855 ) ) ( not ( = ?auto_42854 ?auto_42856 ) ) ( not ( = ?auto_42854 ?auto_42857 ) ) ( not ( = ?auto_42854 ?auto_42858 ) ) ( not ( = ?auto_42854 ?auto_42859 ) ) ( not ( = ?auto_42854 ?auto_42860 ) ) ( not ( = ?auto_42854 ?auto_42861 ) ) ( not ( = ?auto_42855 ?auto_42856 ) ) ( not ( = ?auto_42855 ?auto_42857 ) ) ( not ( = ?auto_42855 ?auto_42858 ) ) ( not ( = ?auto_42855 ?auto_42859 ) ) ( not ( = ?auto_42855 ?auto_42860 ) ) ( not ( = ?auto_42855 ?auto_42861 ) ) ( not ( = ?auto_42856 ?auto_42857 ) ) ( not ( = ?auto_42856 ?auto_42858 ) ) ( not ( = ?auto_42856 ?auto_42859 ) ) ( not ( = ?auto_42856 ?auto_42860 ) ) ( not ( = ?auto_42856 ?auto_42861 ) ) ( not ( = ?auto_42857 ?auto_42858 ) ) ( not ( = ?auto_42857 ?auto_42859 ) ) ( not ( = ?auto_42857 ?auto_42860 ) ) ( not ( = ?auto_42857 ?auto_42861 ) ) ( not ( = ?auto_42858 ?auto_42859 ) ) ( not ( = ?auto_42858 ?auto_42860 ) ) ( not ( = ?auto_42858 ?auto_42861 ) ) ( not ( = ?auto_42859 ?auto_42860 ) ) ( not ( = ?auto_42859 ?auto_42861 ) ) ( not ( = ?auto_42860 ?auto_42861 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42860 ?auto_42861 )
      ( !STACK ?auto_42860 ?auto_42859 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42869 - BLOCK
      ?auto_42870 - BLOCK
      ?auto_42871 - BLOCK
      ?auto_42872 - BLOCK
      ?auto_42873 - BLOCK
      ?auto_42874 - BLOCK
      ?auto_42875 - BLOCK
    )
    :vars
    (
      ?auto_42876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42874 ) ( ON ?auto_42875 ?auto_42876 ) ( CLEAR ?auto_42875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42869 ) ( ON ?auto_42870 ?auto_42869 ) ( ON ?auto_42871 ?auto_42870 ) ( ON ?auto_42872 ?auto_42871 ) ( ON ?auto_42873 ?auto_42872 ) ( ON ?auto_42874 ?auto_42873 ) ( not ( = ?auto_42869 ?auto_42870 ) ) ( not ( = ?auto_42869 ?auto_42871 ) ) ( not ( = ?auto_42869 ?auto_42872 ) ) ( not ( = ?auto_42869 ?auto_42873 ) ) ( not ( = ?auto_42869 ?auto_42874 ) ) ( not ( = ?auto_42869 ?auto_42875 ) ) ( not ( = ?auto_42869 ?auto_42876 ) ) ( not ( = ?auto_42870 ?auto_42871 ) ) ( not ( = ?auto_42870 ?auto_42872 ) ) ( not ( = ?auto_42870 ?auto_42873 ) ) ( not ( = ?auto_42870 ?auto_42874 ) ) ( not ( = ?auto_42870 ?auto_42875 ) ) ( not ( = ?auto_42870 ?auto_42876 ) ) ( not ( = ?auto_42871 ?auto_42872 ) ) ( not ( = ?auto_42871 ?auto_42873 ) ) ( not ( = ?auto_42871 ?auto_42874 ) ) ( not ( = ?auto_42871 ?auto_42875 ) ) ( not ( = ?auto_42871 ?auto_42876 ) ) ( not ( = ?auto_42872 ?auto_42873 ) ) ( not ( = ?auto_42872 ?auto_42874 ) ) ( not ( = ?auto_42872 ?auto_42875 ) ) ( not ( = ?auto_42872 ?auto_42876 ) ) ( not ( = ?auto_42873 ?auto_42874 ) ) ( not ( = ?auto_42873 ?auto_42875 ) ) ( not ( = ?auto_42873 ?auto_42876 ) ) ( not ( = ?auto_42874 ?auto_42875 ) ) ( not ( = ?auto_42874 ?auto_42876 ) ) ( not ( = ?auto_42875 ?auto_42876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42875 ?auto_42876 )
      ( !STACK ?auto_42875 ?auto_42874 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42884 - BLOCK
      ?auto_42885 - BLOCK
      ?auto_42886 - BLOCK
      ?auto_42887 - BLOCK
      ?auto_42888 - BLOCK
      ?auto_42889 - BLOCK
      ?auto_42890 - BLOCK
    )
    :vars
    (
      ?auto_42891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42890 ?auto_42891 ) ( ON-TABLE ?auto_42884 ) ( ON ?auto_42885 ?auto_42884 ) ( ON ?auto_42886 ?auto_42885 ) ( ON ?auto_42887 ?auto_42886 ) ( ON ?auto_42888 ?auto_42887 ) ( not ( = ?auto_42884 ?auto_42885 ) ) ( not ( = ?auto_42884 ?auto_42886 ) ) ( not ( = ?auto_42884 ?auto_42887 ) ) ( not ( = ?auto_42884 ?auto_42888 ) ) ( not ( = ?auto_42884 ?auto_42889 ) ) ( not ( = ?auto_42884 ?auto_42890 ) ) ( not ( = ?auto_42884 ?auto_42891 ) ) ( not ( = ?auto_42885 ?auto_42886 ) ) ( not ( = ?auto_42885 ?auto_42887 ) ) ( not ( = ?auto_42885 ?auto_42888 ) ) ( not ( = ?auto_42885 ?auto_42889 ) ) ( not ( = ?auto_42885 ?auto_42890 ) ) ( not ( = ?auto_42885 ?auto_42891 ) ) ( not ( = ?auto_42886 ?auto_42887 ) ) ( not ( = ?auto_42886 ?auto_42888 ) ) ( not ( = ?auto_42886 ?auto_42889 ) ) ( not ( = ?auto_42886 ?auto_42890 ) ) ( not ( = ?auto_42886 ?auto_42891 ) ) ( not ( = ?auto_42887 ?auto_42888 ) ) ( not ( = ?auto_42887 ?auto_42889 ) ) ( not ( = ?auto_42887 ?auto_42890 ) ) ( not ( = ?auto_42887 ?auto_42891 ) ) ( not ( = ?auto_42888 ?auto_42889 ) ) ( not ( = ?auto_42888 ?auto_42890 ) ) ( not ( = ?auto_42888 ?auto_42891 ) ) ( not ( = ?auto_42889 ?auto_42890 ) ) ( not ( = ?auto_42889 ?auto_42891 ) ) ( not ( = ?auto_42890 ?auto_42891 ) ) ( CLEAR ?auto_42888 ) ( ON ?auto_42889 ?auto_42890 ) ( CLEAR ?auto_42889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42884 ?auto_42885 ?auto_42886 ?auto_42887 ?auto_42888 ?auto_42889 )
      ( MAKE-7PILE ?auto_42884 ?auto_42885 ?auto_42886 ?auto_42887 ?auto_42888 ?auto_42889 ?auto_42890 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42899 - BLOCK
      ?auto_42900 - BLOCK
      ?auto_42901 - BLOCK
      ?auto_42902 - BLOCK
      ?auto_42903 - BLOCK
      ?auto_42904 - BLOCK
      ?auto_42905 - BLOCK
    )
    :vars
    (
      ?auto_42906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42905 ?auto_42906 ) ( ON-TABLE ?auto_42899 ) ( ON ?auto_42900 ?auto_42899 ) ( ON ?auto_42901 ?auto_42900 ) ( ON ?auto_42902 ?auto_42901 ) ( ON ?auto_42903 ?auto_42902 ) ( not ( = ?auto_42899 ?auto_42900 ) ) ( not ( = ?auto_42899 ?auto_42901 ) ) ( not ( = ?auto_42899 ?auto_42902 ) ) ( not ( = ?auto_42899 ?auto_42903 ) ) ( not ( = ?auto_42899 ?auto_42904 ) ) ( not ( = ?auto_42899 ?auto_42905 ) ) ( not ( = ?auto_42899 ?auto_42906 ) ) ( not ( = ?auto_42900 ?auto_42901 ) ) ( not ( = ?auto_42900 ?auto_42902 ) ) ( not ( = ?auto_42900 ?auto_42903 ) ) ( not ( = ?auto_42900 ?auto_42904 ) ) ( not ( = ?auto_42900 ?auto_42905 ) ) ( not ( = ?auto_42900 ?auto_42906 ) ) ( not ( = ?auto_42901 ?auto_42902 ) ) ( not ( = ?auto_42901 ?auto_42903 ) ) ( not ( = ?auto_42901 ?auto_42904 ) ) ( not ( = ?auto_42901 ?auto_42905 ) ) ( not ( = ?auto_42901 ?auto_42906 ) ) ( not ( = ?auto_42902 ?auto_42903 ) ) ( not ( = ?auto_42902 ?auto_42904 ) ) ( not ( = ?auto_42902 ?auto_42905 ) ) ( not ( = ?auto_42902 ?auto_42906 ) ) ( not ( = ?auto_42903 ?auto_42904 ) ) ( not ( = ?auto_42903 ?auto_42905 ) ) ( not ( = ?auto_42903 ?auto_42906 ) ) ( not ( = ?auto_42904 ?auto_42905 ) ) ( not ( = ?auto_42904 ?auto_42906 ) ) ( not ( = ?auto_42905 ?auto_42906 ) ) ( CLEAR ?auto_42903 ) ( ON ?auto_42904 ?auto_42905 ) ( CLEAR ?auto_42904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42899 ?auto_42900 ?auto_42901 ?auto_42902 ?auto_42903 ?auto_42904 )
      ( MAKE-7PILE ?auto_42899 ?auto_42900 ?auto_42901 ?auto_42902 ?auto_42903 ?auto_42904 ?auto_42905 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42914 - BLOCK
      ?auto_42915 - BLOCK
      ?auto_42916 - BLOCK
      ?auto_42917 - BLOCK
      ?auto_42918 - BLOCK
      ?auto_42919 - BLOCK
      ?auto_42920 - BLOCK
    )
    :vars
    (
      ?auto_42921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42920 ?auto_42921 ) ( ON-TABLE ?auto_42914 ) ( ON ?auto_42915 ?auto_42914 ) ( ON ?auto_42916 ?auto_42915 ) ( ON ?auto_42917 ?auto_42916 ) ( not ( = ?auto_42914 ?auto_42915 ) ) ( not ( = ?auto_42914 ?auto_42916 ) ) ( not ( = ?auto_42914 ?auto_42917 ) ) ( not ( = ?auto_42914 ?auto_42918 ) ) ( not ( = ?auto_42914 ?auto_42919 ) ) ( not ( = ?auto_42914 ?auto_42920 ) ) ( not ( = ?auto_42914 ?auto_42921 ) ) ( not ( = ?auto_42915 ?auto_42916 ) ) ( not ( = ?auto_42915 ?auto_42917 ) ) ( not ( = ?auto_42915 ?auto_42918 ) ) ( not ( = ?auto_42915 ?auto_42919 ) ) ( not ( = ?auto_42915 ?auto_42920 ) ) ( not ( = ?auto_42915 ?auto_42921 ) ) ( not ( = ?auto_42916 ?auto_42917 ) ) ( not ( = ?auto_42916 ?auto_42918 ) ) ( not ( = ?auto_42916 ?auto_42919 ) ) ( not ( = ?auto_42916 ?auto_42920 ) ) ( not ( = ?auto_42916 ?auto_42921 ) ) ( not ( = ?auto_42917 ?auto_42918 ) ) ( not ( = ?auto_42917 ?auto_42919 ) ) ( not ( = ?auto_42917 ?auto_42920 ) ) ( not ( = ?auto_42917 ?auto_42921 ) ) ( not ( = ?auto_42918 ?auto_42919 ) ) ( not ( = ?auto_42918 ?auto_42920 ) ) ( not ( = ?auto_42918 ?auto_42921 ) ) ( not ( = ?auto_42919 ?auto_42920 ) ) ( not ( = ?auto_42919 ?auto_42921 ) ) ( not ( = ?auto_42920 ?auto_42921 ) ) ( ON ?auto_42919 ?auto_42920 ) ( CLEAR ?auto_42917 ) ( ON ?auto_42918 ?auto_42919 ) ( CLEAR ?auto_42918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42914 ?auto_42915 ?auto_42916 ?auto_42917 ?auto_42918 )
      ( MAKE-7PILE ?auto_42914 ?auto_42915 ?auto_42916 ?auto_42917 ?auto_42918 ?auto_42919 ?auto_42920 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42929 - BLOCK
      ?auto_42930 - BLOCK
      ?auto_42931 - BLOCK
      ?auto_42932 - BLOCK
      ?auto_42933 - BLOCK
      ?auto_42934 - BLOCK
      ?auto_42935 - BLOCK
    )
    :vars
    (
      ?auto_42936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42935 ?auto_42936 ) ( ON-TABLE ?auto_42929 ) ( ON ?auto_42930 ?auto_42929 ) ( ON ?auto_42931 ?auto_42930 ) ( ON ?auto_42932 ?auto_42931 ) ( not ( = ?auto_42929 ?auto_42930 ) ) ( not ( = ?auto_42929 ?auto_42931 ) ) ( not ( = ?auto_42929 ?auto_42932 ) ) ( not ( = ?auto_42929 ?auto_42933 ) ) ( not ( = ?auto_42929 ?auto_42934 ) ) ( not ( = ?auto_42929 ?auto_42935 ) ) ( not ( = ?auto_42929 ?auto_42936 ) ) ( not ( = ?auto_42930 ?auto_42931 ) ) ( not ( = ?auto_42930 ?auto_42932 ) ) ( not ( = ?auto_42930 ?auto_42933 ) ) ( not ( = ?auto_42930 ?auto_42934 ) ) ( not ( = ?auto_42930 ?auto_42935 ) ) ( not ( = ?auto_42930 ?auto_42936 ) ) ( not ( = ?auto_42931 ?auto_42932 ) ) ( not ( = ?auto_42931 ?auto_42933 ) ) ( not ( = ?auto_42931 ?auto_42934 ) ) ( not ( = ?auto_42931 ?auto_42935 ) ) ( not ( = ?auto_42931 ?auto_42936 ) ) ( not ( = ?auto_42932 ?auto_42933 ) ) ( not ( = ?auto_42932 ?auto_42934 ) ) ( not ( = ?auto_42932 ?auto_42935 ) ) ( not ( = ?auto_42932 ?auto_42936 ) ) ( not ( = ?auto_42933 ?auto_42934 ) ) ( not ( = ?auto_42933 ?auto_42935 ) ) ( not ( = ?auto_42933 ?auto_42936 ) ) ( not ( = ?auto_42934 ?auto_42935 ) ) ( not ( = ?auto_42934 ?auto_42936 ) ) ( not ( = ?auto_42935 ?auto_42936 ) ) ( ON ?auto_42934 ?auto_42935 ) ( CLEAR ?auto_42932 ) ( ON ?auto_42933 ?auto_42934 ) ( CLEAR ?auto_42933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42929 ?auto_42930 ?auto_42931 ?auto_42932 ?auto_42933 )
      ( MAKE-7PILE ?auto_42929 ?auto_42930 ?auto_42931 ?auto_42932 ?auto_42933 ?auto_42934 ?auto_42935 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42944 - BLOCK
      ?auto_42945 - BLOCK
      ?auto_42946 - BLOCK
      ?auto_42947 - BLOCK
      ?auto_42948 - BLOCK
      ?auto_42949 - BLOCK
      ?auto_42950 - BLOCK
    )
    :vars
    (
      ?auto_42951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42950 ?auto_42951 ) ( ON-TABLE ?auto_42944 ) ( ON ?auto_42945 ?auto_42944 ) ( ON ?auto_42946 ?auto_42945 ) ( not ( = ?auto_42944 ?auto_42945 ) ) ( not ( = ?auto_42944 ?auto_42946 ) ) ( not ( = ?auto_42944 ?auto_42947 ) ) ( not ( = ?auto_42944 ?auto_42948 ) ) ( not ( = ?auto_42944 ?auto_42949 ) ) ( not ( = ?auto_42944 ?auto_42950 ) ) ( not ( = ?auto_42944 ?auto_42951 ) ) ( not ( = ?auto_42945 ?auto_42946 ) ) ( not ( = ?auto_42945 ?auto_42947 ) ) ( not ( = ?auto_42945 ?auto_42948 ) ) ( not ( = ?auto_42945 ?auto_42949 ) ) ( not ( = ?auto_42945 ?auto_42950 ) ) ( not ( = ?auto_42945 ?auto_42951 ) ) ( not ( = ?auto_42946 ?auto_42947 ) ) ( not ( = ?auto_42946 ?auto_42948 ) ) ( not ( = ?auto_42946 ?auto_42949 ) ) ( not ( = ?auto_42946 ?auto_42950 ) ) ( not ( = ?auto_42946 ?auto_42951 ) ) ( not ( = ?auto_42947 ?auto_42948 ) ) ( not ( = ?auto_42947 ?auto_42949 ) ) ( not ( = ?auto_42947 ?auto_42950 ) ) ( not ( = ?auto_42947 ?auto_42951 ) ) ( not ( = ?auto_42948 ?auto_42949 ) ) ( not ( = ?auto_42948 ?auto_42950 ) ) ( not ( = ?auto_42948 ?auto_42951 ) ) ( not ( = ?auto_42949 ?auto_42950 ) ) ( not ( = ?auto_42949 ?auto_42951 ) ) ( not ( = ?auto_42950 ?auto_42951 ) ) ( ON ?auto_42949 ?auto_42950 ) ( ON ?auto_42948 ?auto_42949 ) ( CLEAR ?auto_42946 ) ( ON ?auto_42947 ?auto_42948 ) ( CLEAR ?auto_42947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42944 ?auto_42945 ?auto_42946 ?auto_42947 )
      ( MAKE-7PILE ?auto_42944 ?auto_42945 ?auto_42946 ?auto_42947 ?auto_42948 ?auto_42949 ?auto_42950 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42959 - BLOCK
      ?auto_42960 - BLOCK
      ?auto_42961 - BLOCK
      ?auto_42962 - BLOCK
      ?auto_42963 - BLOCK
      ?auto_42964 - BLOCK
      ?auto_42965 - BLOCK
    )
    :vars
    (
      ?auto_42966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42965 ?auto_42966 ) ( ON-TABLE ?auto_42959 ) ( ON ?auto_42960 ?auto_42959 ) ( ON ?auto_42961 ?auto_42960 ) ( not ( = ?auto_42959 ?auto_42960 ) ) ( not ( = ?auto_42959 ?auto_42961 ) ) ( not ( = ?auto_42959 ?auto_42962 ) ) ( not ( = ?auto_42959 ?auto_42963 ) ) ( not ( = ?auto_42959 ?auto_42964 ) ) ( not ( = ?auto_42959 ?auto_42965 ) ) ( not ( = ?auto_42959 ?auto_42966 ) ) ( not ( = ?auto_42960 ?auto_42961 ) ) ( not ( = ?auto_42960 ?auto_42962 ) ) ( not ( = ?auto_42960 ?auto_42963 ) ) ( not ( = ?auto_42960 ?auto_42964 ) ) ( not ( = ?auto_42960 ?auto_42965 ) ) ( not ( = ?auto_42960 ?auto_42966 ) ) ( not ( = ?auto_42961 ?auto_42962 ) ) ( not ( = ?auto_42961 ?auto_42963 ) ) ( not ( = ?auto_42961 ?auto_42964 ) ) ( not ( = ?auto_42961 ?auto_42965 ) ) ( not ( = ?auto_42961 ?auto_42966 ) ) ( not ( = ?auto_42962 ?auto_42963 ) ) ( not ( = ?auto_42962 ?auto_42964 ) ) ( not ( = ?auto_42962 ?auto_42965 ) ) ( not ( = ?auto_42962 ?auto_42966 ) ) ( not ( = ?auto_42963 ?auto_42964 ) ) ( not ( = ?auto_42963 ?auto_42965 ) ) ( not ( = ?auto_42963 ?auto_42966 ) ) ( not ( = ?auto_42964 ?auto_42965 ) ) ( not ( = ?auto_42964 ?auto_42966 ) ) ( not ( = ?auto_42965 ?auto_42966 ) ) ( ON ?auto_42964 ?auto_42965 ) ( ON ?auto_42963 ?auto_42964 ) ( CLEAR ?auto_42961 ) ( ON ?auto_42962 ?auto_42963 ) ( CLEAR ?auto_42962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42959 ?auto_42960 ?auto_42961 ?auto_42962 )
      ( MAKE-7PILE ?auto_42959 ?auto_42960 ?auto_42961 ?auto_42962 ?auto_42963 ?auto_42964 ?auto_42965 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42974 - BLOCK
      ?auto_42975 - BLOCK
      ?auto_42976 - BLOCK
      ?auto_42977 - BLOCK
      ?auto_42978 - BLOCK
      ?auto_42979 - BLOCK
      ?auto_42980 - BLOCK
    )
    :vars
    (
      ?auto_42981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42980 ?auto_42981 ) ( ON-TABLE ?auto_42974 ) ( ON ?auto_42975 ?auto_42974 ) ( not ( = ?auto_42974 ?auto_42975 ) ) ( not ( = ?auto_42974 ?auto_42976 ) ) ( not ( = ?auto_42974 ?auto_42977 ) ) ( not ( = ?auto_42974 ?auto_42978 ) ) ( not ( = ?auto_42974 ?auto_42979 ) ) ( not ( = ?auto_42974 ?auto_42980 ) ) ( not ( = ?auto_42974 ?auto_42981 ) ) ( not ( = ?auto_42975 ?auto_42976 ) ) ( not ( = ?auto_42975 ?auto_42977 ) ) ( not ( = ?auto_42975 ?auto_42978 ) ) ( not ( = ?auto_42975 ?auto_42979 ) ) ( not ( = ?auto_42975 ?auto_42980 ) ) ( not ( = ?auto_42975 ?auto_42981 ) ) ( not ( = ?auto_42976 ?auto_42977 ) ) ( not ( = ?auto_42976 ?auto_42978 ) ) ( not ( = ?auto_42976 ?auto_42979 ) ) ( not ( = ?auto_42976 ?auto_42980 ) ) ( not ( = ?auto_42976 ?auto_42981 ) ) ( not ( = ?auto_42977 ?auto_42978 ) ) ( not ( = ?auto_42977 ?auto_42979 ) ) ( not ( = ?auto_42977 ?auto_42980 ) ) ( not ( = ?auto_42977 ?auto_42981 ) ) ( not ( = ?auto_42978 ?auto_42979 ) ) ( not ( = ?auto_42978 ?auto_42980 ) ) ( not ( = ?auto_42978 ?auto_42981 ) ) ( not ( = ?auto_42979 ?auto_42980 ) ) ( not ( = ?auto_42979 ?auto_42981 ) ) ( not ( = ?auto_42980 ?auto_42981 ) ) ( ON ?auto_42979 ?auto_42980 ) ( ON ?auto_42978 ?auto_42979 ) ( ON ?auto_42977 ?auto_42978 ) ( CLEAR ?auto_42975 ) ( ON ?auto_42976 ?auto_42977 ) ( CLEAR ?auto_42976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42974 ?auto_42975 ?auto_42976 )
      ( MAKE-7PILE ?auto_42974 ?auto_42975 ?auto_42976 ?auto_42977 ?auto_42978 ?auto_42979 ?auto_42980 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42989 - BLOCK
      ?auto_42990 - BLOCK
      ?auto_42991 - BLOCK
      ?auto_42992 - BLOCK
      ?auto_42993 - BLOCK
      ?auto_42994 - BLOCK
      ?auto_42995 - BLOCK
    )
    :vars
    (
      ?auto_42996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42995 ?auto_42996 ) ( ON-TABLE ?auto_42989 ) ( ON ?auto_42990 ?auto_42989 ) ( not ( = ?auto_42989 ?auto_42990 ) ) ( not ( = ?auto_42989 ?auto_42991 ) ) ( not ( = ?auto_42989 ?auto_42992 ) ) ( not ( = ?auto_42989 ?auto_42993 ) ) ( not ( = ?auto_42989 ?auto_42994 ) ) ( not ( = ?auto_42989 ?auto_42995 ) ) ( not ( = ?auto_42989 ?auto_42996 ) ) ( not ( = ?auto_42990 ?auto_42991 ) ) ( not ( = ?auto_42990 ?auto_42992 ) ) ( not ( = ?auto_42990 ?auto_42993 ) ) ( not ( = ?auto_42990 ?auto_42994 ) ) ( not ( = ?auto_42990 ?auto_42995 ) ) ( not ( = ?auto_42990 ?auto_42996 ) ) ( not ( = ?auto_42991 ?auto_42992 ) ) ( not ( = ?auto_42991 ?auto_42993 ) ) ( not ( = ?auto_42991 ?auto_42994 ) ) ( not ( = ?auto_42991 ?auto_42995 ) ) ( not ( = ?auto_42991 ?auto_42996 ) ) ( not ( = ?auto_42992 ?auto_42993 ) ) ( not ( = ?auto_42992 ?auto_42994 ) ) ( not ( = ?auto_42992 ?auto_42995 ) ) ( not ( = ?auto_42992 ?auto_42996 ) ) ( not ( = ?auto_42993 ?auto_42994 ) ) ( not ( = ?auto_42993 ?auto_42995 ) ) ( not ( = ?auto_42993 ?auto_42996 ) ) ( not ( = ?auto_42994 ?auto_42995 ) ) ( not ( = ?auto_42994 ?auto_42996 ) ) ( not ( = ?auto_42995 ?auto_42996 ) ) ( ON ?auto_42994 ?auto_42995 ) ( ON ?auto_42993 ?auto_42994 ) ( ON ?auto_42992 ?auto_42993 ) ( CLEAR ?auto_42990 ) ( ON ?auto_42991 ?auto_42992 ) ( CLEAR ?auto_42991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42989 ?auto_42990 ?auto_42991 )
      ( MAKE-7PILE ?auto_42989 ?auto_42990 ?auto_42991 ?auto_42992 ?auto_42993 ?auto_42994 ?auto_42995 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_43004 - BLOCK
      ?auto_43005 - BLOCK
      ?auto_43006 - BLOCK
      ?auto_43007 - BLOCK
      ?auto_43008 - BLOCK
      ?auto_43009 - BLOCK
      ?auto_43010 - BLOCK
    )
    :vars
    (
      ?auto_43011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43010 ?auto_43011 ) ( ON-TABLE ?auto_43004 ) ( not ( = ?auto_43004 ?auto_43005 ) ) ( not ( = ?auto_43004 ?auto_43006 ) ) ( not ( = ?auto_43004 ?auto_43007 ) ) ( not ( = ?auto_43004 ?auto_43008 ) ) ( not ( = ?auto_43004 ?auto_43009 ) ) ( not ( = ?auto_43004 ?auto_43010 ) ) ( not ( = ?auto_43004 ?auto_43011 ) ) ( not ( = ?auto_43005 ?auto_43006 ) ) ( not ( = ?auto_43005 ?auto_43007 ) ) ( not ( = ?auto_43005 ?auto_43008 ) ) ( not ( = ?auto_43005 ?auto_43009 ) ) ( not ( = ?auto_43005 ?auto_43010 ) ) ( not ( = ?auto_43005 ?auto_43011 ) ) ( not ( = ?auto_43006 ?auto_43007 ) ) ( not ( = ?auto_43006 ?auto_43008 ) ) ( not ( = ?auto_43006 ?auto_43009 ) ) ( not ( = ?auto_43006 ?auto_43010 ) ) ( not ( = ?auto_43006 ?auto_43011 ) ) ( not ( = ?auto_43007 ?auto_43008 ) ) ( not ( = ?auto_43007 ?auto_43009 ) ) ( not ( = ?auto_43007 ?auto_43010 ) ) ( not ( = ?auto_43007 ?auto_43011 ) ) ( not ( = ?auto_43008 ?auto_43009 ) ) ( not ( = ?auto_43008 ?auto_43010 ) ) ( not ( = ?auto_43008 ?auto_43011 ) ) ( not ( = ?auto_43009 ?auto_43010 ) ) ( not ( = ?auto_43009 ?auto_43011 ) ) ( not ( = ?auto_43010 ?auto_43011 ) ) ( ON ?auto_43009 ?auto_43010 ) ( ON ?auto_43008 ?auto_43009 ) ( ON ?auto_43007 ?auto_43008 ) ( ON ?auto_43006 ?auto_43007 ) ( CLEAR ?auto_43004 ) ( ON ?auto_43005 ?auto_43006 ) ( CLEAR ?auto_43005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43004 ?auto_43005 )
      ( MAKE-7PILE ?auto_43004 ?auto_43005 ?auto_43006 ?auto_43007 ?auto_43008 ?auto_43009 ?auto_43010 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_43019 - BLOCK
      ?auto_43020 - BLOCK
      ?auto_43021 - BLOCK
      ?auto_43022 - BLOCK
      ?auto_43023 - BLOCK
      ?auto_43024 - BLOCK
      ?auto_43025 - BLOCK
    )
    :vars
    (
      ?auto_43026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43025 ?auto_43026 ) ( ON-TABLE ?auto_43019 ) ( not ( = ?auto_43019 ?auto_43020 ) ) ( not ( = ?auto_43019 ?auto_43021 ) ) ( not ( = ?auto_43019 ?auto_43022 ) ) ( not ( = ?auto_43019 ?auto_43023 ) ) ( not ( = ?auto_43019 ?auto_43024 ) ) ( not ( = ?auto_43019 ?auto_43025 ) ) ( not ( = ?auto_43019 ?auto_43026 ) ) ( not ( = ?auto_43020 ?auto_43021 ) ) ( not ( = ?auto_43020 ?auto_43022 ) ) ( not ( = ?auto_43020 ?auto_43023 ) ) ( not ( = ?auto_43020 ?auto_43024 ) ) ( not ( = ?auto_43020 ?auto_43025 ) ) ( not ( = ?auto_43020 ?auto_43026 ) ) ( not ( = ?auto_43021 ?auto_43022 ) ) ( not ( = ?auto_43021 ?auto_43023 ) ) ( not ( = ?auto_43021 ?auto_43024 ) ) ( not ( = ?auto_43021 ?auto_43025 ) ) ( not ( = ?auto_43021 ?auto_43026 ) ) ( not ( = ?auto_43022 ?auto_43023 ) ) ( not ( = ?auto_43022 ?auto_43024 ) ) ( not ( = ?auto_43022 ?auto_43025 ) ) ( not ( = ?auto_43022 ?auto_43026 ) ) ( not ( = ?auto_43023 ?auto_43024 ) ) ( not ( = ?auto_43023 ?auto_43025 ) ) ( not ( = ?auto_43023 ?auto_43026 ) ) ( not ( = ?auto_43024 ?auto_43025 ) ) ( not ( = ?auto_43024 ?auto_43026 ) ) ( not ( = ?auto_43025 ?auto_43026 ) ) ( ON ?auto_43024 ?auto_43025 ) ( ON ?auto_43023 ?auto_43024 ) ( ON ?auto_43022 ?auto_43023 ) ( ON ?auto_43021 ?auto_43022 ) ( CLEAR ?auto_43019 ) ( ON ?auto_43020 ?auto_43021 ) ( CLEAR ?auto_43020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43019 ?auto_43020 )
      ( MAKE-7PILE ?auto_43019 ?auto_43020 ?auto_43021 ?auto_43022 ?auto_43023 ?auto_43024 ?auto_43025 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_43034 - BLOCK
      ?auto_43035 - BLOCK
      ?auto_43036 - BLOCK
      ?auto_43037 - BLOCK
      ?auto_43038 - BLOCK
      ?auto_43039 - BLOCK
      ?auto_43040 - BLOCK
    )
    :vars
    (
      ?auto_43041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43040 ?auto_43041 ) ( not ( = ?auto_43034 ?auto_43035 ) ) ( not ( = ?auto_43034 ?auto_43036 ) ) ( not ( = ?auto_43034 ?auto_43037 ) ) ( not ( = ?auto_43034 ?auto_43038 ) ) ( not ( = ?auto_43034 ?auto_43039 ) ) ( not ( = ?auto_43034 ?auto_43040 ) ) ( not ( = ?auto_43034 ?auto_43041 ) ) ( not ( = ?auto_43035 ?auto_43036 ) ) ( not ( = ?auto_43035 ?auto_43037 ) ) ( not ( = ?auto_43035 ?auto_43038 ) ) ( not ( = ?auto_43035 ?auto_43039 ) ) ( not ( = ?auto_43035 ?auto_43040 ) ) ( not ( = ?auto_43035 ?auto_43041 ) ) ( not ( = ?auto_43036 ?auto_43037 ) ) ( not ( = ?auto_43036 ?auto_43038 ) ) ( not ( = ?auto_43036 ?auto_43039 ) ) ( not ( = ?auto_43036 ?auto_43040 ) ) ( not ( = ?auto_43036 ?auto_43041 ) ) ( not ( = ?auto_43037 ?auto_43038 ) ) ( not ( = ?auto_43037 ?auto_43039 ) ) ( not ( = ?auto_43037 ?auto_43040 ) ) ( not ( = ?auto_43037 ?auto_43041 ) ) ( not ( = ?auto_43038 ?auto_43039 ) ) ( not ( = ?auto_43038 ?auto_43040 ) ) ( not ( = ?auto_43038 ?auto_43041 ) ) ( not ( = ?auto_43039 ?auto_43040 ) ) ( not ( = ?auto_43039 ?auto_43041 ) ) ( not ( = ?auto_43040 ?auto_43041 ) ) ( ON ?auto_43039 ?auto_43040 ) ( ON ?auto_43038 ?auto_43039 ) ( ON ?auto_43037 ?auto_43038 ) ( ON ?auto_43036 ?auto_43037 ) ( ON ?auto_43035 ?auto_43036 ) ( ON ?auto_43034 ?auto_43035 ) ( CLEAR ?auto_43034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43034 )
      ( MAKE-7PILE ?auto_43034 ?auto_43035 ?auto_43036 ?auto_43037 ?auto_43038 ?auto_43039 ?auto_43040 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_43049 - BLOCK
      ?auto_43050 - BLOCK
      ?auto_43051 - BLOCK
      ?auto_43052 - BLOCK
      ?auto_43053 - BLOCK
      ?auto_43054 - BLOCK
      ?auto_43055 - BLOCK
    )
    :vars
    (
      ?auto_43056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43055 ?auto_43056 ) ( not ( = ?auto_43049 ?auto_43050 ) ) ( not ( = ?auto_43049 ?auto_43051 ) ) ( not ( = ?auto_43049 ?auto_43052 ) ) ( not ( = ?auto_43049 ?auto_43053 ) ) ( not ( = ?auto_43049 ?auto_43054 ) ) ( not ( = ?auto_43049 ?auto_43055 ) ) ( not ( = ?auto_43049 ?auto_43056 ) ) ( not ( = ?auto_43050 ?auto_43051 ) ) ( not ( = ?auto_43050 ?auto_43052 ) ) ( not ( = ?auto_43050 ?auto_43053 ) ) ( not ( = ?auto_43050 ?auto_43054 ) ) ( not ( = ?auto_43050 ?auto_43055 ) ) ( not ( = ?auto_43050 ?auto_43056 ) ) ( not ( = ?auto_43051 ?auto_43052 ) ) ( not ( = ?auto_43051 ?auto_43053 ) ) ( not ( = ?auto_43051 ?auto_43054 ) ) ( not ( = ?auto_43051 ?auto_43055 ) ) ( not ( = ?auto_43051 ?auto_43056 ) ) ( not ( = ?auto_43052 ?auto_43053 ) ) ( not ( = ?auto_43052 ?auto_43054 ) ) ( not ( = ?auto_43052 ?auto_43055 ) ) ( not ( = ?auto_43052 ?auto_43056 ) ) ( not ( = ?auto_43053 ?auto_43054 ) ) ( not ( = ?auto_43053 ?auto_43055 ) ) ( not ( = ?auto_43053 ?auto_43056 ) ) ( not ( = ?auto_43054 ?auto_43055 ) ) ( not ( = ?auto_43054 ?auto_43056 ) ) ( not ( = ?auto_43055 ?auto_43056 ) ) ( ON ?auto_43054 ?auto_43055 ) ( ON ?auto_43053 ?auto_43054 ) ( ON ?auto_43052 ?auto_43053 ) ( ON ?auto_43051 ?auto_43052 ) ( ON ?auto_43050 ?auto_43051 ) ( ON ?auto_43049 ?auto_43050 ) ( CLEAR ?auto_43049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43049 )
      ( MAKE-7PILE ?auto_43049 ?auto_43050 ?auto_43051 ?auto_43052 ?auto_43053 ?auto_43054 ?auto_43055 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43065 - BLOCK
      ?auto_43066 - BLOCK
      ?auto_43067 - BLOCK
      ?auto_43068 - BLOCK
      ?auto_43069 - BLOCK
      ?auto_43070 - BLOCK
      ?auto_43071 - BLOCK
      ?auto_43072 - BLOCK
    )
    :vars
    (
      ?auto_43073 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43071 ) ( ON ?auto_43072 ?auto_43073 ) ( CLEAR ?auto_43072 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43065 ) ( ON ?auto_43066 ?auto_43065 ) ( ON ?auto_43067 ?auto_43066 ) ( ON ?auto_43068 ?auto_43067 ) ( ON ?auto_43069 ?auto_43068 ) ( ON ?auto_43070 ?auto_43069 ) ( ON ?auto_43071 ?auto_43070 ) ( not ( = ?auto_43065 ?auto_43066 ) ) ( not ( = ?auto_43065 ?auto_43067 ) ) ( not ( = ?auto_43065 ?auto_43068 ) ) ( not ( = ?auto_43065 ?auto_43069 ) ) ( not ( = ?auto_43065 ?auto_43070 ) ) ( not ( = ?auto_43065 ?auto_43071 ) ) ( not ( = ?auto_43065 ?auto_43072 ) ) ( not ( = ?auto_43065 ?auto_43073 ) ) ( not ( = ?auto_43066 ?auto_43067 ) ) ( not ( = ?auto_43066 ?auto_43068 ) ) ( not ( = ?auto_43066 ?auto_43069 ) ) ( not ( = ?auto_43066 ?auto_43070 ) ) ( not ( = ?auto_43066 ?auto_43071 ) ) ( not ( = ?auto_43066 ?auto_43072 ) ) ( not ( = ?auto_43066 ?auto_43073 ) ) ( not ( = ?auto_43067 ?auto_43068 ) ) ( not ( = ?auto_43067 ?auto_43069 ) ) ( not ( = ?auto_43067 ?auto_43070 ) ) ( not ( = ?auto_43067 ?auto_43071 ) ) ( not ( = ?auto_43067 ?auto_43072 ) ) ( not ( = ?auto_43067 ?auto_43073 ) ) ( not ( = ?auto_43068 ?auto_43069 ) ) ( not ( = ?auto_43068 ?auto_43070 ) ) ( not ( = ?auto_43068 ?auto_43071 ) ) ( not ( = ?auto_43068 ?auto_43072 ) ) ( not ( = ?auto_43068 ?auto_43073 ) ) ( not ( = ?auto_43069 ?auto_43070 ) ) ( not ( = ?auto_43069 ?auto_43071 ) ) ( not ( = ?auto_43069 ?auto_43072 ) ) ( not ( = ?auto_43069 ?auto_43073 ) ) ( not ( = ?auto_43070 ?auto_43071 ) ) ( not ( = ?auto_43070 ?auto_43072 ) ) ( not ( = ?auto_43070 ?auto_43073 ) ) ( not ( = ?auto_43071 ?auto_43072 ) ) ( not ( = ?auto_43071 ?auto_43073 ) ) ( not ( = ?auto_43072 ?auto_43073 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43072 ?auto_43073 )
      ( !STACK ?auto_43072 ?auto_43071 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43082 - BLOCK
      ?auto_43083 - BLOCK
      ?auto_43084 - BLOCK
      ?auto_43085 - BLOCK
      ?auto_43086 - BLOCK
      ?auto_43087 - BLOCK
      ?auto_43088 - BLOCK
      ?auto_43089 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43088 ) ( ON-TABLE ?auto_43089 ) ( CLEAR ?auto_43089 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43082 ) ( ON ?auto_43083 ?auto_43082 ) ( ON ?auto_43084 ?auto_43083 ) ( ON ?auto_43085 ?auto_43084 ) ( ON ?auto_43086 ?auto_43085 ) ( ON ?auto_43087 ?auto_43086 ) ( ON ?auto_43088 ?auto_43087 ) ( not ( = ?auto_43082 ?auto_43083 ) ) ( not ( = ?auto_43082 ?auto_43084 ) ) ( not ( = ?auto_43082 ?auto_43085 ) ) ( not ( = ?auto_43082 ?auto_43086 ) ) ( not ( = ?auto_43082 ?auto_43087 ) ) ( not ( = ?auto_43082 ?auto_43088 ) ) ( not ( = ?auto_43082 ?auto_43089 ) ) ( not ( = ?auto_43083 ?auto_43084 ) ) ( not ( = ?auto_43083 ?auto_43085 ) ) ( not ( = ?auto_43083 ?auto_43086 ) ) ( not ( = ?auto_43083 ?auto_43087 ) ) ( not ( = ?auto_43083 ?auto_43088 ) ) ( not ( = ?auto_43083 ?auto_43089 ) ) ( not ( = ?auto_43084 ?auto_43085 ) ) ( not ( = ?auto_43084 ?auto_43086 ) ) ( not ( = ?auto_43084 ?auto_43087 ) ) ( not ( = ?auto_43084 ?auto_43088 ) ) ( not ( = ?auto_43084 ?auto_43089 ) ) ( not ( = ?auto_43085 ?auto_43086 ) ) ( not ( = ?auto_43085 ?auto_43087 ) ) ( not ( = ?auto_43085 ?auto_43088 ) ) ( not ( = ?auto_43085 ?auto_43089 ) ) ( not ( = ?auto_43086 ?auto_43087 ) ) ( not ( = ?auto_43086 ?auto_43088 ) ) ( not ( = ?auto_43086 ?auto_43089 ) ) ( not ( = ?auto_43087 ?auto_43088 ) ) ( not ( = ?auto_43087 ?auto_43089 ) ) ( not ( = ?auto_43088 ?auto_43089 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_43089 )
      ( !STACK ?auto_43089 ?auto_43088 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43098 - BLOCK
      ?auto_43099 - BLOCK
      ?auto_43100 - BLOCK
      ?auto_43101 - BLOCK
      ?auto_43102 - BLOCK
      ?auto_43103 - BLOCK
      ?auto_43104 - BLOCK
      ?auto_43105 - BLOCK
    )
    :vars
    (
      ?auto_43106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43105 ?auto_43106 ) ( ON-TABLE ?auto_43098 ) ( ON ?auto_43099 ?auto_43098 ) ( ON ?auto_43100 ?auto_43099 ) ( ON ?auto_43101 ?auto_43100 ) ( ON ?auto_43102 ?auto_43101 ) ( ON ?auto_43103 ?auto_43102 ) ( not ( = ?auto_43098 ?auto_43099 ) ) ( not ( = ?auto_43098 ?auto_43100 ) ) ( not ( = ?auto_43098 ?auto_43101 ) ) ( not ( = ?auto_43098 ?auto_43102 ) ) ( not ( = ?auto_43098 ?auto_43103 ) ) ( not ( = ?auto_43098 ?auto_43104 ) ) ( not ( = ?auto_43098 ?auto_43105 ) ) ( not ( = ?auto_43098 ?auto_43106 ) ) ( not ( = ?auto_43099 ?auto_43100 ) ) ( not ( = ?auto_43099 ?auto_43101 ) ) ( not ( = ?auto_43099 ?auto_43102 ) ) ( not ( = ?auto_43099 ?auto_43103 ) ) ( not ( = ?auto_43099 ?auto_43104 ) ) ( not ( = ?auto_43099 ?auto_43105 ) ) ( not ( = ?auto_43099 ?auto_43106 ) ) ( not ( = ?auto_43100 ?auto_43101 ) ) ( not ( = ?auto_43100 ?auto_43102 ) ) ( not ( = ?auto_43100 ?auto_43103 ) ) ( not ( = ?auto_43100 ?auto_43104 ) ) ( not ( = ?auto_43100 ?auto_43105 ) ) ( not ( = ?auto_43100 ?auto_43106 ) ) ( not ( = ?auto_43101 ?auto_43102 ) ) ( not ( = ?auto_43101 ?auto_43103 ) ) ( not ( = ?auto_43101 ?auto_43104 ) ) ( not ( = ?auto_43101 ?auto_43105 ) ) ( not ( = ?auto_43101 ?auto_43106 ) ) ( not ( = ?auto_43102 ?auto_43103 ) ) ( not ( = ?auto_43102 ?auto_43104 ) ) ( not ( = ?auto_43102 ?auto_43105 ) ) ( not ( = ?auto_43102 ?auto_43106 ) ) ( not ( = ?auto_43103 ?auto_43104 ) ) ( not ( = ?auto_43103 ?auto_43105 ) ) ( not ( = ?auto_43103 ?auto_43106 ) ) ( not ( = ?auto_43104 ?auto_43105 ) ) ( not ( = ?auto_43104 ?auto_43106 ) ) ( not ( = ?auto_43105 ?auto_43106 ) ) ( CLEAR ?auto_43103 ) ( ON ?auto_43104 ?auto_43105 ) ( CLEAR ?auto_43104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_43098 ?auto_43099 ?auto_43100 ?auto_43101 ?auto_43102 ?auto_43103 ?auto_43104 )
      ( MAKE-8PILE ?auto_43098 ?auto_43099 ?auto_43100 ?auto_43101 ?auto_43102 ?auto_43103 ?auto_43104 ?auto_43105 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43115 - BLOCK
      ?auto_43116 - BLOCK
      ?auto_43117 - BLOCK
      ?auto_43118 - BLOCK
      ?auto_43119 - BLOCK
      ?auto_43120 - BLOCK
      ?auto_43121 - BLOCK
      ?auto_43122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43122 ) ( ON-TABLE ?auto_43115 ) ( ON ?auto_43116 ?auto_43115 ) ( ON ?auto_43117 ?auto_43116 ) ( ON ?auto_43118 ?auto_43117 ) ( ON ?auto_43119 ?auto_43118 ) ( ON ?auto_43120 ?auto_43119 ) ( not ( = ?auto_43115 ?auto_43116 ) ) ( not ( = ?auto_43115 ?auto_43117 ) ) ( not ( = ?auto_43115 ?auto_43118 ) ) ( not ( = ?auto_43115 ?auto_43119 ) ) ( not ( = ?auto_43115 ?auto_43120 ) ) ( not ( = ?auto_43115 ?auto_43121 ) ) ( not ( = ?auto_43115 ?auto_43122 ) ) ( not ( = ?auto_43116 ?auto_43117 ) ) ( not ( = ?auto_43116 ?auto_43118 ) ) ( not ( = ?auto_43116 ?auto_43119 ) ) ( not ( = ?auto_43116 ?auto_43120 ) ) ( not ( = ?auto_43116 ?auto_43121 ) ) ( not ( = ?auto_43116 ?auto_43122 ) ) ( not ( = ?auto_43117 ?auto_43118 ) ) ( not ( = ?auto_43117 ?auto_43119 ) ) ( not ( = ?auto_43117 ?auto_43120 ) ) ( not ( = ?auto_43117 ?auto_43121 ) ) ( not ( = ?auto_43117 ?auto_43122 ) ) ( not ( = ?auto_43118 ?auto_43119 ) ) ( not ( = ?auto_43118 ?auto_43120 ) ) ( not ( = ?auto_43118 ?auto_43121 ) ) ( not ( = ?auto_43118 ?auto_43122 ) ) ( not ( = ?auto_43119 ?auto_43120 ) ) ( not ( = ?auto_43119 ?auto_43121 ) ) ( not ( = ?auto_43119 ?auto_43122 ) ) ( not ( = ?auto_43120 ?auto_43121 ) ) ( not ( = ?auto_43120 ?auto_43122 ) ) ( not ( = ?auto_43121 ?auto_43122 ) ) ( CLEAR ?auto_43120 ) ( ON ?auto_43121 ?auto_43122 ) ( CLEAR ?auto_43121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_43115 ?auto_43116 ?auto_43117 ?auto_43118 ?auto_43119 ?auto_43120 ?auto_43121 )
      ( MAKE-8PILE ?auto_43115 ?auto_43116 ?auto_43117 ?auto_43118 ?auto_43119 ?auto_43120 ?auto_43121 ?auto_43122 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43131 - BLOCK
      ?auto_43132 - BLOCK
      ?auto_43133 - BLOCK
      ?auto_43134 - BLOCK
      ?auto_43135 - BLOCK
      ?auto_43136 - BLOCK
      ?auto_43137 - BLOCK
      ?auto_43138 - BLOCK
    )
    :vars
    (
      ?auto_43139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43138 ?auto_43139 ) ( ON-TABLE ?auto_43131 ) ( ON ?auto_43132 ?auto_43131 ) ( ON ?auto_43133 ?auto_43132 ) ( ON ?auto_43134 ?auto_43133 ) ( ON ?auto_43135 ?auto_43134 ) ( not ( = ?auto_43131 ?auto_43132 ) ) ( not ( = ?auto_43131 ?auto_43133 ) ) ( not ( = ?auto_43131 ?auto_43134 ) ) ( not ( = ?auto_43131 ?auto_43135 ) ) ( not ( = ?auto_43131 ?auto_43136 ) ) ( not ( = ?auto_43131 ?auto_43137 ) ) ( not ( = ?auto_43131 ?auto_43138 ) ) ( not ( = ?auto_43131 ?auto_43139 ) ) ( not ( = ?auto_43132 ?auto_43133 ) ) ( not ( = ?auto_43132 ?auto_43134 ) ) ( not ( = ?auto_43132 ?auto_43135 ) ) ( not ( = ?auto_43132 ?auto_43136 ) ) ( not ( = ?auto_43132 ?auto_43137 ) ) ( not ( = ?auto_43132 ?auto_43138 ) ) ( not ( = ?auto_43132 ?auto_43139 ) ) ( not ( = ?auto_43133 ?auto_43134 ) ) ( not ( = ?auto_43133 ?auto_43135 ) ) ( not ( = ?auto_43133 ?auto_43136 ) ) ( not ( = ?auto_43133 ?auto_43137 ) ) ( not ( = ?auto_43133 ?auto_43138 ) ) ( not ( = ?auto_43133 ?auto_43139 ) ) ( not ( = ?auto_43134 ?auto_43135 ) ) ( not ( = ?auto_43134 ?auto_43136 ) ) ( not ( = ?auto_43134 ?auto_43137 ) ) ( not ( = ?auto_43134 ?auto_43138 ) ) ( not ( = ?auto_43134 ?auto_43139 ) ) ( not ( = ?auto_43135 ?auto_43136 ) ) ( not ( = ?auto_43135 ?auto_43137 ) ) ( not ( = ?auto_43135 ?auto_43138 ) ) ( not ( = ?auto_43135 ?auto_43139 ) ) ( not ( = ?auto_43136 ?auto_43137 ) ) ( not ( = ?auto_43136 ?auto_43138 ) ) ( not ( = ?auto_43136 ?auto_43139 ) ) ( not ( = ?auto_43137 ?auto_43138 ) ) ( not ( = ?auto_43137 ?auto_43139 ) ) ( not ( = ?auto_43138 ?auto_43139 ) ) ( ON ?auto_43137 ?auto_43138 ) ( CLEAR ?auto_43135 ) ( ON ?auto_43136 ?auto_43137 ) ( CLEAR ?auto_43136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43131 ?auto_43132 ?auto_43133 ?auto_43134 ?auto_43135 ?auto_43136 )
      ( MAKE-8PILE ?auto_43131 ?auto_43132 ?auto_43133 ?auto_43134 ?auto_43135 ?auto_43136 ?auto_43137 ?auto_43138 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43148 - BLOCK
      ?auto_43149 - BLOCK
      ?auto_43150 - BLOCK
      ?auto_43151 - BLOCK
      ?auto_43152 - BLOCK
      ?auto_43153 - BLOCK
      ?auto_43154 - BLOCK
      ?auto_43155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43155 ) ( ON-TABLE ?auto_43148 ) ( ON ?auto_43149 ?auto_43148 ) ( ON ?auto_43150 ?auto_43149 ) ( ON ?auto_43151 ?auto_43150 ) ( ON ?auto_43152 ?auto_43151 ) ( not ( = ?auto_43148 ?auto_43149 ) ) ( not ( = ?auto_43148 ?auto_43150 ) ) ( not ( = ?auto_43148 ?auto_43151 ) ) ( not ( = ?auto_43148 ?auto_43152 ) ) ( not ( = ?auto_43148 ?auto_43153 ) ) ( not ( = ?auto_43148 ?auto_43154 ) ) ( not ( = ?auto_43148 ?auto_43155 ) ) ( not ( = ?auto_43149 ?auto_43150 ) ) ( not ( = ?auto_43149 ?auto_43151 ) ) ( not ( = ?auto_43149 ?auto_43152 ) ) ( not ( = ?auto_43149 ?auto_43153 ) ) ( not ( = ?auto_43149 ?auto_43154 ) ) ( not ( = ?auto_43149 ?auto_43155 ) ) ( not ( = ?auto_43150 ?auto_43151 ) ) ( not ( = ?auto_43150 ?auto_43152 ) ) ( not ( = ?auto_43150 ?auto_43153 ) ) ( not ( = ?auto_43150 ?auto_43154 ) ) ( not ( = ?auto_43150 ?auto_43155 ) ) ( not ( = ?auto_43151 ?auto_43152 ) ) ( not ( = ?auto_43151 ?auto_43153 ) ) ( not ( = ?auto_43151 ?auto_43154 ) ) ( not ( = ?auto_43151 ?auto_43155 ) ) ( not ( = ?auto_43152 ?auto_43153 ) ) ( not ( = ?auto_43152 ?auto_43154 ) ) ( not ( = ?auto_43152 ?auto_43155 ) ) ( not ( = ?auto_43153 ?auto_43154 ) ) ( not ( = ?auto_43153 ?auto_43155 ) ) ( not ( = ?auto_43154 ?auto_43155 ) ) ( ON ?auto_43154 ?auto_43155 ) ( CLEAR ?auto_43152 ) ( ON ?auto_43153 ?auto_43154 ) ( CLEAR ?auto_43153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43148 ?auto_43149 ?auto_43150 ?auto_43151 ?auto_43152 ?auto_43153 )
      ( MAKE-8PILE ?auto_43148 ?auto_43149 ?auto_43150 ?auto_43151 ?auto_43152 ?auto_43153 ?auto_43154 ?auto_43155 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43164 - BLOCK
      ?auto_43165 - BLOCK
      ?auto_43166 - BLOCK
      ?auto_43167 - BLOCK
      ?auto_43168 - BLOCK
      ?auto_43169 - BLOCK
      ?auto_43170 - BLOCK
      ?auto_43171 - BLOCK
    )
    :vars
    (
      ?auto_43172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43171 ?auto_43172 ) ( ON-TABLE ?auto_43164 ) ( ON ?auto_43165 ?auto_43164 ) ( ON ?auto_43166 ?auto_43165 ) ( ON ?auto_43167 ?auto_43166 ) ( not ( = ?auto_43164 ?auto_43165 ) ) ( not ( = ?auto_43164 ?auto_43166 ) ) ( not ( = ?auto_43164 ?auto_43167 ) ) ( not ( = ?auto_43164 ?auto_43168 ) ) ( not ( = ?auto_43164 ?auto_43169 ) ) ( not ( = ?auto_43164 ?auto_43170 ) ) ( not ( = ?auto_43164 ?auto_43171 ) ) ( not ( = ?auto_43164 ?auto_43172 ) ) ( not ( = ?auto_43165 ?auto_43166 ) ) ( not ( = ?auto_43165 ?auto_43167 ) ) ( not ( = ?auto_43165 ?auto_43168 ) ) ( not ( = ?auto_43165 ?auto_43169 ) ) ( not ( = ?auto_43165 ?auto_43170 ) ) ( not ( = ?auto_43165 ?auto_43171 ) ) ( not ( = ?auto_43165 ?auto_43172 ) ) ( not ( = ?auto_43166 ?auto_43167 ) ) ( not ( = ?auto_43166 ?auto_43168 ) ) ( not ( = ?auto_43166 ?auto_43169 ) ) ( not ( = ?auto_43166 ?auto_43170 ) ) ( not ( = ?auto_43166 ?auto_43171 ) ) ( not ( = ?auto_43166 ?auto_43172 ) ) ( not ( = ?auto_43167 ?auto_43168 ) ) ( not ( = ?auto_43167 ?auto_43169 ) ) ( not ( = ?auto_43167 ?auto_43170 ) ) ( not ( = ?auto_43167 ?auto_43171 ) ) ( not ( = ?auto_43167 ?auto_43172 ) ) ( not ( = ?auto_43168 ?auto_43169 ) ) ( not ( = ?auto_43168 ?auto_43170 ) ) ( not ( = ?auto_43168 ?auto_43171 ) ) ( not ( = ?auto_43168 ?auto_43172 ) ) ( not ( = ?auto_43169 ?auto_43170 ) ) ( not ( = ?auto_43169 ?auto_43171 ) ) ( not ( = ?auto_43169 ?auto_43172 ) ) ( not ( = ?auto_43170 ?auto_43171 ) ) ( not ( = ?auto_43170 ?auto_43172 ) ) ( not ( = ?auto_43171 ?auto_43172 ) ) ( ON ?auto_43170 ?auto_43171 ) ( ON ?auto_43169 ?auto_43170 ) ( CLEAR ?auto_43167 ) ( ON ?auto_43168 ?auto_43169 ) ( CLEAR ?auto_43168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43164 ?auto_43165 ?auto_43166 ?auto_43167 ?auto_43168 )
      ( MAKE-8PILE ?auto_43164 ?auto_43165 ?auto_43166 ?auto_43167 ?auto_43168 ?auto_43169 ?auto_43170 ?auto_43171 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43181 - BLOCK
      ?auto_43182 - BLOCK
      ?auto_43183 - BLOCK
      ?auto_43184 - BLOCK
      ?auto_43185 - BLOCK
      ?auto_43186 - BLOCK
      ?auto_43187 - BLOCK
      ?auto_43188 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43188 ) ( ON-TABLE ?auto_43181 ) ( ON ?auto_43182 ?auto_43181 ) ( ON ?auto_43183 ?auto_43182 ) ( ON ?auto_43184 ?auto_43183 ) ( not ( = ?auto_43181 ?auto_43182 ) ) ( not ( = ?auto_43181 ?auto_43183 ) ) ( not ( = ?auto_43181 ?auto_43184 ) ) ( not ( = ?auto_43181 ?auto_43185 ) ) ( not ( = ?auto_43181 ?auto_43186 ) ) ( not ( = ?auto_43181 ?auto_43187 ) ) ( not ( = ?auto_43181 ?auto_43188 ) ) ( not ( = ?auto_43182 ?auto_43183 ) ) ( not ( = ?auto_43182 ?auto_43184 ) ) ( not ( = ?auto_43182 ?auto_43185 ) ) ( not ( = ?auto_43182 ?auto_43186 ) ) ( not ( = ?auto_43182 ?auto_43187 ) ) ( not ( = ?auto_43182 ?auto_43188 ) ) ( not ( = ?auto_43183 ?auto_43184 ) ) ( not ( = ?auto_43183 ?auto_43185 ) ) ( not ( = ?auto_43183 ?auto_43186 ) ) ( not ( = ?auto_43183 ?auto_43187 ) ) ( not ( = ?auto_43183 ?auto_43188 ) ) ( not ( = ?auto_43184 ?auto_43185 ) ) ( not ( = ?auto_43184 ?auto_43186 ) ) ( not ( = ?auto_43184 ?auto_43187 ) ) ( not ( = ?auto_43184 ?auto_43188 ) ) ( not ( = ?auto_43185 ?auto_43186 ) ) ( not ( = ?auto_43185 ?auto_43187 ) ) ( not ( = ?auto_43185 ?auto_43188 ) ) ( not ( = ?auto_43186 ?auto_43187 ) ) ( not ( = ?auto_43186 ?auto_43188 ) ) ( not ( = ?auto_43187 ?auto_43188 ) ) ( ON ?auto_43187 ?auto_43188 ) ( ON ?auto_43186 ?auto_43187 ) ( CLEAR ?auto_43184 ) ( ON ?auto_43185 ?auto_43186 ) ( CLEAR ?auto_43185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43181 ?auto_43182 ?auto_43183 ?auto_43184 ?auto_43185 )
      ( MAKE-8PILE ?auto_43181 ?auto_43182 ?auto_43183 ?auto_43184 ?auto_43185 ?auto_43186 ?auto_43187 ?auto_43188 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43197 - BLOCK
      ?auto_43198 - BLOCK
      ?auto_43199 - BLOCK
      ?auto_43200 - BLOCK
      ?auto_43201 - BLOCK
      ?auto_43202 - BLOCK
      ?auto_43203 - BLOCK
      ?auto_43204 - BLOCK
    )
    :vars
    (
      ?auto_43205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43204 ?auto_43205 ) ( ON-TABLE ?auto_43197 ) ( ON ?auto_43198 ?auto_43197 ) ( ON ?auto_43199 ?auto_43198 ) ( not ( = ?auto_43197 ?auto_43198 ) ) ( not ( = ?auto_43197 ?auto_43199 ) ) ( not ( = ?auto_43197 ?auto_43200 ) ) ( not ( = ?auto_43197 ?auto_43201 ) ) ( not ( = ?auto_43197 ?auto_43202 ) ) ( not ( = ?auto_43197 ?auto_43203 ) ) ( not ( = ?auto_43197 ?auto_43204 ) ) ( not ( = ?auto_43197 ?auto_43205 ) ) ( not ( = ?auto_43198 ?auto_43199 ) ) ( not ( = ?auto_43198 ?auto_43200 ) ) ( not ( = ?auto_43198 ?auto_43201 ) ) ( not ( = ?auto_43198 ?auto_43202 ) ) ( not ( = ?auto_43198 ?auto_43203 ) ) ( not ( = ?auto_43198 ?auto_43204 ) ) ( not ( = ?auto_43198 ?auto_43205 ) ) ( not ( = ?auto_43199 ?auto_43200 ) ) ( not ( = ?auto_43199 ?auto_43201 ) ) ( not ( = ?auto_43199 ?auto_43202 ) ) ( not ( = ?auto_43199 ?auto_43203 ) ) ( not ( = ?auto_43199 ?auto_43204 ) ) ( not ( = ?auto_43199 ?auto_43205 ) ) ( not ( = ?auto_43200 ?auto_43201 ) ) ( not ( = ?auto_43200 ?auto_43202 ) ) ( not ( = ?auto_43200 ?auto_43203 ) ) ( not ( = ?auto_43200 ?auto_43204 ) ) ( not ( = ?auto_43200 ?auto_43205 ) ) ( not ( = ?auto_43201 ?auto_43202 ) ) ( not ( = ?auto_43201 ?auto_43203 ) ) ( not ( = ?auto_43201 ?auto_43204 ) ) ( not ( = ?auto_43201 ?auto_43205 ) ) ( not ( = ?auto_43202 ?auto_43203 ) ) ( not ( = ?auto_43202 ?auto_43204 ) ) ( not ( = ?auto_43202 ?auto_43205 ) ) ( not ( = ?auto_43203 ?auto_43204 ) ) ( not ( = ?auto_43203 ?auto_43205 ) ) ( not ( = ?auto_43204 ?auto_43205 ) ) ( ON ?auto_43203 ?auto_43204 ) ( ON ?auto_43202 ?auto_43203 ) ( ON ?auto_43201 ?auto_43202 ) ( CLEAR ?auto_43199 ) ( ON ?auto_43200 ?auto_43201 ) ( CLEAR ?auto_43200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43197 ?auto_43198 ?auto_43199 ?auto_43200 )
      ( MAKE-8PILE ?auto_43197 ?auto_43198 ?auto_43199 ?auto_43200 ?auto_43201 ?auto_43202 ?auto_43203 ?auto_43204 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43214 - BLOCK
      ?auto_43215 - BLOCK
      ?auto_43216 - BLOCK
      ?auto_43217 - BLOCK
      ?auto_43218 - BLOCK
      ?auto_43219 - BLOCK
      ?auto_43220 - BLOCK
      ?auto_43221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43221 ) ( ON-TABLE ?auto_43214 ) ( ON ?auto_43215 ?auto_43214 ) ( ON ?auto_43216 ?auto_43215 ) ( not ( = ?auto_43214 ?auto_43215 ) ) ( not ( = ?auto_43214 ?auto_43216 ) ) ( not ( = ?auto_43214 ?auto_43217 ) ) ( not ( = ?auto_43214 ?auto_43218 ) ) ( not ( = ?auto_43214 ?auto_43219 ) ) ( not ( = ?auto_43214 ?auto_43220 ) ) ( not ( = ?auto_43214 ?auto_43221 ) ) ( not ( = ?auto_43215 ?auto_43216 ) ) ( not ( = ?auto_43215 ?auto_43217 ) ) ( not ( = ?auto_43215 ?auto_43218 ) ) ( not ( = ?auto_43215 ?auto_43219 ) ) ( not ( = ?auto_43215 ?auto_43220 ) ) ( not ( = ?auto_43215 ?auto_43221 ) ) ( not ( = ?auto_43216 ?auto_43217 ) ) ( not ( = ?auto_43216 ?auto_43218 ) ) ( not ( = ?auto_43216 ?auto_43219 ) ) ( not ( = ?auto_43216 ?auto_43220 ) ) ( not ( = ?auto_43216 ?auto_43221 ) ) ( not ( = ?auto_43217 ?auto_43218 ) ) ( not ( = ?auto_43217 ?auto_43219 ) ) ( not ( = ?auto_43217 ?auto_43220 ) ) ( not ( = ?auto_43217 ?auto_43221 ) ) ( not ( = ?auto_43218 ?auto_43219 ) ) ( not ( = ?auto_43218 ?auto_43220 ) ) ( not ( = ?auto_43218 ?auto_43221 ) ) ( not ( = ?auto_43219 ?auto_43220 ) ) ( not ( = ?auto_43219 ?auto_43221 ) ) ( not ( = ?auto_43220 ?auto_43221 ) ) ( ON ?auto_43220 ?auto_43221 ) ( ON ?auto_43219 ?auto_43220 ) ( ON ?auto_43218 ?auto_43219 ) ( CLEAR ?auto_43216 ) ( ON ?auto_43217 ?auto_43218 ) ( CLEAR ?auto_43217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43214 ?auto_43215 ?auto_43216 ?auto_43217 )
      ( MAKE-8PILE ?auto_43214 ?auto_43215 ?auto_43216 ?auto_43217 ?auto_43218 ?auto_43219 ?auto_43220 ?auto_43221 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43230 - BLOCK
      ?auto_43231 - BLOCK
      ?auto_43232 - BLOCK
      ?auto_43233 - BLOCK
      ?auto_43234 - BLOCK
      ?auto_43235 - BLOCK
      ?auto_43236 - BLOCK
      ?auto_43237 - BLOCK
    )
    :vars
    (
      ?auto_43238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43237 ?auto_43238 ) ( ON-TABLE ?auto_43230 ) ( ON ?auto_43231 ?auto_43230 ) ( not ( = ?auto_43230 ?auto_43231 ) ) ( not ( = ?auto_43230 ?auto_43232 ) ) ( not ( = ?auto_43230 ?auto_43233 ) ) ( not ( = ?auto_43230 ?auto_43234 ) ) ( not ( = ?auto_43230 ?auto_43235 ) ) ( not ( = ?auto_43230 ?auto_43236 ) ) ( not ( = ?auto_43230 ?auto_43237 ) ) ( not ( = ?auto_43230 ?auto_43238 ) ) ( not ( = ?auto_43231 ?auto_43232 ) ) ( not ( = ?auto_43231 ?auto_43233 ) ) ( not ( = ?auto_43231 ?auto_43234 ) ) ( not ( = ?auto_43231 ?auto_43235 ) ) ( not ( = ?auto_43231 ?auto_43236 ) ) ( not ( = ?auto_43231 ?auto_43237 ) ) ( not ( = ?auto_43231 ?auto_43238 ) ) ( not ( = ?auto_43232 ?auto_43233 ) ) ( not ( = ?auto_43232 ?auto_43234 ) ) ( not ( = ?auto_43232 ?auto_43235 ) ) ( not ( = ?auto_43232 ?auto_43236 ) ) ( not ( = ?auto_43232 ?auto_43237 ) ) ( not ( = ?auto_43232 ?auto_43238 ) ) ( not ( = ?auto_43233 ?auto_43234 ) ) ( not ( = ?auto_43233 ?auto_43235 ) ) ( not ( = ?auto_43233 ?auto_43236 ) ) ( not ( = ?auto_43233 ?auto_43237 ) ) ( not ( = ?auto_43233 ?auto_43238 ) ) ( not ( = ?auto_43234 ?auto_43235 ) ) ( not ( = ?auto_43234 ?auto_43236 ) ) ( not ( = ?auto_43234 ?auto_43237 ) ) ( not ( = ?auto_43234 ?auto_43238 ) ) ( not ( = ?auto_43235 ?auto_43236 ) ) ( not ( = ?auto_43235 ?auto_43237 ) ) ( not ( = ?auto_43235 ?auto_43238 ) ) ( not ( = ?auto_43236 ?auto_43237 ) ) ( not ( = ?auto_43236 ?auto_43238 ) ) ( not ( = ?auto_43237 ?auto_43238 ) ) ( ON ?auto_43236 ?auto_43237 ) ( ON ?auto_43235 ?auto_43236 ) ( ON ?auto_43234 ?auto_43235 ) ( ON ?auto_43233 ?auto_43234 ) ( CLEAR ?auto_43231 ) ( ON ?auto_43232 ?auto_43233 ) ( CLEAR ?auto_43232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43230 ?auto_43231 ?auto_43232 )
      ( MAKE-8PILE ?auto_43230 ?auto_43231 ?auto_43232 ?auto_43233 ?auto_43234 ?auto_43235 ?auto_43236 ?auto_43237 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43247 - BLOCK
      ?auto_43248 - BLOCK
      ?auto_43249 - BLOCK
      ?auto_43250 - BLOCK
      ?auto_43251 - BLOCK
      ?auto_43252 - BLOCK
      ?auto_43253 - BLOCK
      ?auto_43254 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43254 ) ( ON-TABLE ?auto_43247 ) ( ON ?auto_43248 ?auto_43247 ) ( not ( = ?auto_43247 ?auto_43248 ) ) ( not ( = ?auto_43247 ?auto_43249 ) ) ( not ( = ?auto_43247 ?auto_43250 ) ) ( not ( = ?auto_43247 ?auto_43251 ) ) ( not ( = ?auto_43247 ?auto_43252 ) ) ( not ( = ?auto_43247 ?auto_43253 ) ) ( not ( = ?auto_43247 ?auto_43254 ) ) ( not ( = ?auto_43248 ?auto_43249 ) ) ( not ( = ?auto_43248 ?auto_43250 ) ) ( not ( = ?auto_43248 ?auto_43251 ) ) ( not ( = ?auto_43248 ?auto_43252 ) ) ( not ( = ?auto_43248 ?auto_43253 ) ) ( not ( = ?auto_43248 ?auto_43254 ) ) ( not ( = ?auto_43249 ?auto_43250 ) ) ( not ( = ?auto_43249 ?auto_43251 ) ) ( not ( = ?auto_43249 ?auto_43252 ) ) ( not ( = ?auto_43249 ?auto_43253 ) ) ( not ( = ?auto_43249 ?auto_43254 ) ) ( not ( = ?auto_43250 ?auto_43251 ) ) ( not ( = ?auto_43250 ?auto_43252 ) ) ( not ( = ?auto_43250 ?auto_43253 ) ) ( not ( = ?auto_43250 ?auto_43254 ) ) ( not ( = ?auto_43251 ?auto_43252 ) ) ( not ( = ?auto_43251 ?auto_43253 ) ) ( not ( = ?auto_43251 ?auto_43254 ) ) ( not ( = ?auto_43252 ?auto_43253 ) ) ( not ( = ?auto_43252 ?auto_43254 ) ) ( not ( = ?auto_43253 ?auto_43254 ) ) ( ON ?auto_43253 ?auto_43254 ) ( ON ?auto_43252 ?auto_43253 ) ( ON ?auto_43251 ?auto_43252 ) ( ON ?auto_43250 ?auto_43251 ) ( CLEAR ?auto_43248 ) ( ON ?auto_43249 ?auto_43250 ) ( CLEAR ?auto_43249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43247 ?auto_43248 ?auto_43249 )
      ( MAKE-8PILE ?auto_43247 ?auto_43248 ?auto_43249 ?auto_43250 ?auto_43251 ?auto_43252 ?auto_43253 ?auto_43254 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43263 - BLOCK
      ?auto_43264 - BLOCK
      ?auto_43265 - BLOCK
      ?auto_43266 - BLOCK
      ?auto_43267 - BLOCK
      ?auto_43268 - BLOCK
      ?auto_43269 - BLOCK
      ?auto_43270 - BLOCK
    )
    :vars
    (
      ?auto_43271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43270 ?auto_43271 ) ( ON-TABLE ?auto_43263 ) ( not ( = ?auto_43263 ?auto_43264 ) ) ( not ( = ?auto_43263 ?auto_43265 ) ) ( not ( = ?auto_43263 ?auto_43266 ) ) ( not ( = ?auto_43263 ?auto_43267 ) ) ( not ( = ?auto_43263 ?auto_43268 ) ) ( not ( = ?auto_43263 ?auto_43269 ) ) ( not ( = ?auto_43263 ?auto_43270 ) ) ( not ( = ?auto_43263 ?auto_43271 ) ) ( not ( = ?auto_43264 ?auto_43265 ) ) ( not ( = ?auto_43264 ?auto_43266 ) ) ( not ( = ?auto_43264 ?auto_43267 ) ) ( not ( = ?auto_43264 ?auto_43268 ) ) ( not ( = ?auto_43264 ?auto_43269 ) ) ( not ( = ?auto_43264 ?auto_43270 ) ) ( not ( = ?auto_43264 ?auto_43271 ) ) ( not ( = ?auto_43265 ?auto_43266 ) ) ( not ( = ?auto_43265 ?auto_43267 ) ) ( not ( = ?auto_43265 ?auto_43268 ) ) ( not ( = ?auto_43265 ?auto_43269 ) ) ( not ( = ?auto_43265 ?auto_43270 ) ) ( not ( = ?auto_43265 ?auto_43271 ) ) ( not ( = ?auto_43266 ?auto_43267 ) ) ( not ( = ?auto_43266 ?auto_43268 ) ) ( not ( = ?auto_43266 ?auto_43269 ) ) ( not ( = ?auto_43266 ?auto_43270 ) ) ( not ( = ?auto_43266 ?auto_43271 ) ) ( not ( = ?auto_43267 ?auto_43268 ) ) ( not ( = ?auto_43267 ?auto_43269 ) ) ( not ( = ?auto_43267 ?auto_43270 ) ) ( not ( = ?auto_43267 ?auto_43271 ) ) ( not ( = ?auto_43268 ?auto_43269 ) ) ( not ( = ?auto_43268 ?auto_43270 ) ) ( not ( = ?auto_43268 ?auto_43271 ) ) ( not ( = ?auto_43269 ?auto_43270 ) ) ( not ( = ?auto_43269 ?auto_43271 ) ) ( not ( = ?auto_43270 ?auto_43271 ) ) ( ON ?auto_43269 ?auto_43270 ) ( ON ?auto_43268 ?auto_43269 ) ( ON ?auto_43267 ?auto_43268 ) ( ON ?auto_43266 ?auto_43267 ) ( ON ?auto_43265 ?auto_43266 ) ( CLEAR ?auto_43263 ) ( ON ?auto_43264 ?auto_43265 ) ( CLEAR ?auto_43264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43263 ?auto_43264 )
      ( MAKE-8PILE ?auto_43263 ?auto_43264 ?auto_43265 ?auto_43266 ?auto_43267 ?auto_43268 ?auto_43269 ?auto_43270 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43280 - BLOCK
      ?auto_43281 - BLOCK
      ?auto_43282 - BLOCK
      ?auto_43283 - BLOCK
      ?auto_43284 - BLOCK
      ?auto_43285 - BLOCK
      ?auto_43286 - BLOCK
      ?auto_43287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43287 ) ( ON-TABLE ?auto_43280 ) ( not ( = ?auto_43280 ?auto_43281 ) ) ( not ( = ?auto_43280 ?auto_43282 ) ) ( not ( = ?auto_43280 ?auto_43283 ) ) ( not ( = ?auto_43280 ?auto_43284 ) ) ( not ( = ?auto_43280 ?auto_43285 ) ) ( not ( = ?auto_43280 ?auto_43286 ) ) ( not ( = ?auto_43280 ?auto_43287 ) ) ( not ( = ?auto_43281 ?auto_43282 ) ) ( not ( = ?auto_43281 ?auto_43283 ) ) ( not ( = ?auto_43281 ?auto_43284 ) ) ( not ( = ?auto_43281 ?auto_43285 ) ) ( not ( = ?auto_43281 ?auto_43286 ) ) ( not ( = ?auto_43281 ?auto_43287 ) ) ( not ( = ?auto_43282 ?auto_43283 ) ) ( not ( = ?auto_43282 ?auto_43284 ) ) ( not ( = ?auto_43282 ?auto_43285 ) ) ( not ( = ?auto_43282 ?auto_43286 ) ) ( not ( = ?auto_43282 ?auto_43287 ) ) ( not ( = ?auto_43283 ?auto_43284 ) ) ( not ( = ?auto_43283 ?auto_43285 ) ) ( not ( = ?auto_43283 ?auto_43286 ) ) ( not ( = ?auto_43283 ?auto_43287 ) ) ( not ( = ?auto_43284 ?auto_43285 ) ) ( not ( = ?auto_43284 ?auto_43286 ) ) ( not ( = ?auto_43284 ?auto_43287 ) ) ( not ( = ?auto_43285 ?auto_43286 ) ) ( not ( = ?auto_43285 ?auto_43287 ) ) ( not ( = ?auto_43286 ?auto_43287 ) ) ( ON ?auto_43286 ?auto_43287 ) ( ON ?auto_43285 ?auto_43286 ) ( ON ?auto_43284 ?auto_43285 ) ( ON ?auto_43283 ?auto_43284 ) ( ON ?auto_43282 ?auto_43283 ) ( CLEAR ?auto_43280 ) ( ON ?auto_43281 ?auto_43282 ) ( CLEAR ?auto_43281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43280 ?auto_43281 )
      ( MAKE-8PILE ?auto_43280 ?auto_43281 ?auto_43282 ?auto_43283 ?auto_43284 ?auto_43285 ?auto_43286 ?auto_43287 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43296 - BLOCK
      ?auto_43297 - BLOCK
      ?auto_43298 - BLOCK
      ?auto_43299 - BLOCK
      ?auto_43300 - BLOCK
      ?auto_43301 - BLOCK
      ?auto_43302 - BLOCK
      ?auto_43303 - BLOCK
    )
    :vars
    (
      ?auto_43304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43303 ?auto_43304 ) ( not ( = ?auto_43296 ?auto_43297 ) ) ( not ( = ?auto_43296 ?auto_43298 ) ) ( not ( = ?auto_43296 ?auto_43299 ) ) ( not ( = ?auto_43296 ?auto_43300 ) ) ( not ( = ?auto_43296 ?auto_43301 ) ) ( not ( = ?auto_43296 ?auto_43302 ) ) ( not ( = ?auto_43296 ?auto_43303 ) ) ( not ( = ?auto_43296 ?auto_43304 ) ) ( not ( = ?auto_43297 ?auto_43298 ) ) ( not ( = ?auto_43297 ?auto_43299 ) ) ( not ( = ?auto_43297 ?auto_43300 ) ) ( not ( = ?auto_43297 ?auto_43301 ) ) ( not ( = ?auto_43297 ?auto_43302 ) ) ( not ( = ?auto_43297 ?auto_43303 ) ) ( not ( = ?auto_43297 ?auto_43304 ) ) ( not ( = ?auto_43298 ?auto_43299 ) ) ( not ( = ?auto_43298 ?auto_43300 ) ) ( not ( = ?auto_43298 ?auto_43301 ) ) ( not ( = ?auto_43298 ?auto_43302 ) ) ( not ( = ?auto_43298 ?auto_43303 ) ) ( not ( = ?auto_43298 ?auto_43304 ) ) ( not ( = ?auto_43299 ?auto_43300 ) ) ( not ( = ?auto_43299 ?auto_43301 ) ) ( not ( = ?auto_43299 ?auto_43302 ) ) ( not ( = ?auto_43299 ?auto_43303 ) ) ( not ( = ?auto_43299 ?auto_43304 ) ) ( not ( = ?auto_43300 ?auto_43301 ) ) ( not ( = ?auto_43300 ?auto_43302 ) ) ( not ( = ?auto_43300 ?auto_43303 ) ) ( not ( = ?auto_43300 ?auto_43304 ) ) ( not ( = ?auto_43301 ?auto_43302 ) ) ( not ( = ?auto_43301 ?auto_43303 ) ) ( not ( = ?auto_43301 ?auto_43304 ) ) ( not ( = ?auto_43302 ?auto_43303 ) ) ( not ( = ?auto_43302 ?auto_43304 ) ) ( not ( = ?auto_43303 ?auto_43304 ) ) ( ON ?auto_43302 ?auto_43303 ) ( ON ?auto_43301 ?auto_43302 ) ( ON ?auto_43300 ?auto_43301 ) ( ON ?auto_43299 ?auto_43300 ) ( ON ?auto_43298 ?auto_43299 ) ( ON ?auto_43297 ?auto_43298 ) ( ON ?auto_43296 ?auto_43297 ) ( CLEAR ?auto_43296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43296 )
      ( MAKE-8PILE ?auto_43296 ?auto_43297 ?auto_43298 ?auto_43299 ?auto_43300 ?auto_43301 ?auto_43302 ?auto_43303 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43313 - BLOCK
      ?auto_43314 - BLOCK
      ?auto_43315 - BLOCK
      ?auto_43316 - BLOCK
      ?auto_43317 - BLOCK
      ?auto_43318 - BLOCK
      ?auto_43319 - BLOCK
      ?auto_43320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43320 ) ( not ( = ?auto_43313 ?auto_43314 ) ) ( not ( = ?auto_43313 ?auto_43315 ) ) ( not ( = ?auto_43313 ?auto_43316 ) ) ( not ( = ?auto_43313 ?auto_43317 ) ) ( not ( = ?auto_43313 ?auto_43318 ) ) ( not ( = ?auto_43313 ?auto_43319 ) ) ( not ( = ?auto_43313 ?auto_43320 ) ) ( not ( = ?auto_43314 ?auto_43315 ) ) ( not ( = ?auto_43314 ?auto_43316 ) ) ( not ( = ?auto_43314 ?auto_43317 ) ) ( not ( = ?auto_43314 ?auto_43318 ) ) ( not ( = ?auto_43314 ?auto_43319 ) ) ( not ( = ?auto_43314 ?auto_43320 ) ) ( not ( = ?auto_43315 ?auto_43316 ) ) ( not ( = ?auto_43315 ?auto_43317 ) ) ( not ( = ?auto_43315 ?auto_43318 ) ) ( not ( = ?auto_43315 ?auto_43319 ) ) ( not ( = ?auto_43315 ?auto_43320 ) ) ( not ( = ?auto_43316 ?auto_43317 ) ) ( not ( = ?auto_43316 ?auto_43318 ) ) ( not ( = ?auto_43316 ?auto_43319 ) ) ( not ( = ?auto_43316 ?auto_43320 ) ) ( not ( = ?auto_43317 ?auto_43318 ) ) ( not ( = ?auto_43317 ?auto_43319 ) ) ( not ( = ?auto_43317 ?auto_43320 ) ) ( not ( = ?auto_43318 ?auto_43319 ) ) ( not ( = ?auto_43318 ?auto_43320 ) ) ( not ( = ?auto_43319 ?auto_43320 ) ) ( ON ?auto_43319 ?auto_43320 ) ( ON ?auto_43318 ?auto_43319 ) ( ON ?auto_43317 ?auto_43318 ) ( ON ?auto_43316 ?auto_43317 ) ( ON ?auto_43315 ?auto_43316 ) ( ON ?auto_43314 ?auto_43315 ) ( ON ?auto_43313 ?auto_43314 ) ( CLEAR ?auto_43313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43313 )
      ( MAKE-8PILE ?auto_43313 ?auto_43314 ?auto_43315 ?auto_43316 ?auto_43317 ?auto_43318 ?auto_43319 ?auto_43320 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_43329 - BLOCK
      ?auto_43330 - BLOCK
      ?auto_43331 - BLOCK
      ?auto_43332 - BLOCK
      ?auto_43333 - BLOCK
      ?auto_43334 - BLOCK
      ?auto_43335 - BLOCK
      ?auto_43336 - BLOCK
    )
    :vars
    (
      ?auto_43337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43329 ?auto_43330 ) ) ( not ( = ?auto_43329 ?auto_43331 ) ) ( not ( = ?auto_43329 ?auto_43332 ) ) ( not ( = ?auto_43329 ?auto_43333 ) ) ( not ( = ?auto_43329 ?auto_43334 ) ) ( not ( = ?auto_43329 ?auto_43335 ) ) ( not ( = ?auto_43329 ?auto_43336 ) ) ( not ( = ?auto_43330 ?auto_43331 ) ) ( not ( = ?auto_43330 ?auto_43332 ) ) ( not ( = ?auto_43330 ?auto_43333 ) ) ( not ( = ?auto_43330 ?auto_43334 ) ) ( not ( = ?auto_43330 ?auto_43335 ) ) ( not ( = ?auto_43330 ?auto_43336 ) ) ( not ( = ?auto_43331 ?auto_43332 ) ) ( not ( = ?auto_43331 ?auto_43333 ) ) ( not ( = ?auto_43331 ?auto_43334 ) ) ( not ( = ?auto_43331 ?auto_43335 ) ) ( not ( = ?auto_43331 ?auto_43336 ) ) ( not ( = ?auto_43332 ?auto_43333 ) ) ( not ( = ?auto_43332 ?auto_43334 ) ) ( not ( = ?auto_43332 ?auto_43335 ) ) ( not ( = ?auto_43332 ?auto_43336 ) ) ( not ( = ?auto_43333 ?auto_43334 ) ) ( not ( = ?auto_43333 ?auto_43335 ) ) ( not ( = ?auto_43333 ?auto_43336 ) ) ( not ( = ?auto_43334 ?auto_43335 ) ) ( not ( = ?auto_43334 ?auto_43336 ) ) ( not ( = ?auto_43335 ?auto_43336 ) ) ( ON ?auto_43329 ?auto_43337 ) ( not ( = ?auto_43336 ?auto_43337 ) ) ( not ( = ?auto_43335 ?auto_43337 ) ) ( not ( = ?auto_43334 ?auto_43337 ) ) ( not ( = ?auto_43333 ?auto_43337 ) ) ( not ( = ?auto_43332 ?auto_43337 ) ) ( not ( = ?auto_43331 ?auto_43337 ) ) ( not ( = ?auto_43330 ?auto_43337 ) ) ( not ( = ?auto_43329 ?auto_43337 ) ) ( ON ?auto_43330 ?auto_43329 ) ( ON ?auto_43331 ?auto_43330 ) ( ON ?auto_43332 ?auto_43331 ) ( ON ?auto_43333 ?auto_43332 ) ( ON ?auto_43334 ?auto_43333 ) ( ON ?auto_43335 ?auto_43334 ) ( ON ?auto_43336 ?auto_43335 ) ( CLEAR ?auto_43336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_43336 ?auto_43335 ?auto_43334 ?auto_43333 ?auto_43332 ?auto_43331 ?auto_43330 ?auto_43329 )
      ( MAKE-8PILE ?auto_43329 ?auto_43330 ?auto_43331 ?auto_43332 ?auto_43333 ?auto_43334 ?auto_43335 ?auto_43336 ) )
  )

)
