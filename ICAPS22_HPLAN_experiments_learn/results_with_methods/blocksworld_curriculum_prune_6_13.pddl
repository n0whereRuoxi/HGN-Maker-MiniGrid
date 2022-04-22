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
      ?auto_15410 - BLOCK
    )
    :vars
    (
      ?auto_15411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15410 ?auto_15411 ) ( CLEAR ?auto_15410 ) ( HAND-EMPTY ) ( not ( = ?auto_15410 ?auto_15411 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15410 ?auto_15411 )
      ( !PUTDOWN ?auto_15410 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15417 - BLOCK
      ?auto_15418 - BLOCK
    )
    :vars
    (
      ?auto_15419 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15417 ) ( ON ?auto_15418 ?auto_15419 ) ( CLEAR ?auto_15418 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15417 ) ( not ( = ?auto_15417 ?auto_15418 ) ) ( not ( = ?auto_15417 ?auto_15419 ) ) ( not ( = ?auto_15418 ?auto_15419 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15418 ?auto_15419 )
      ( !STACK ?auto_15418 ?auto_15417 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15427 - BLOCK
      ?auto_15428 - BLOCK
    )
    :vars
    (
      ?auto_15429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15428 ?auto_15429 ) ( not ( = ?auto_15427 ?auto_15428 ) ) ( not ( = ?auto_15427 ?auto_15429 ) ) ( not ( = ?auto_15428 ?auto_15429 ) ) ( ON ?auto_15427 ?auto_15428 ) ( CLEAR ?auto_15427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15427 )
      ( MAKE-2PILE ?auto_15427 ?auto_15428 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15438 - BLOCK
      ?auto_15439 - BLOCK
      ?auto_15440 - BLOCK
    )
    :vars
    (
      ?auto_15441 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15439 ) ( ON ?auto_15440 ?auto_15441 ) ( CLEAR ?auto_15440 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15438 ) ( ON ?auto_15439 ?auto_15438 ) ( not ( = ?auto_15438 ?auto_15439 ) ) ( not ( = ?auto_15438 ?auto_15440 ) ) ( not ( = ?auto_15438 ?auto_15441 ) ) ( not ( = ?auto_15439 ?auto_15440 ) ) ( not ( = ?auto_15439 ?auto_15441 ) ) ( not ( = ?auto_15440 ?auto_15441 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15440 ?auto_15441 )
      ( !STACK ?auto_15440 ?auto_15439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15452 - BLOCK
      ?auto_15453 - BLOCK
      ?auto_15454 - BLOCK
    )
    :vars
    (
      ?auto_15455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15454 ?auto_15455 ) ( ON-TABLE ?auto_15452 ) ( not ( = ?auto_15452 ?auto_15453 ) ) ( not ( = ?auto_15452 ?auto_15454 ) ) ( not ( = ?auto_15452 ?auto_15455 ) ) ( not ( = ?auto_15453 ?auto_15454 ) ) ( not ( = ?auto_15453 ?auto_15455 ) ) ( not ( = ?auto_15454 ?auto_15455 ) ) ( CLEAR ?auto_15452 ) ( ON ?auto_15453 ?auto_15454 ) ( CLEAR ?auto_15453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15452 ?auto_15453 )
      ( MAKE-3PILE ?auto_15452 ?auto_15453 ?auto_15454 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15466 - BLOCK
      ?auto_15467 - BLOCK
      ?auto_15468 - BLOCK
    )
    :vars
    (
      ?auto_15469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15468 ?auto_15469 ) ( not ( = ?auto_15466 ?auto_15467 ) ) ( not ( = ?auto_15466 ?auto_15468 ) ) ( not ( = ?auto_15466 ?auto_15469 ) ) ( not ( = ?auto_15467 ?auto_15468 ) ) ( not ( = ?auto_15467 ?auto_15469 ) ) ( not ( = ?auto_15468 ?auto_15469 ) ) ( ON ?auto_15467 ?auto_15468 ) ( ON ?auto_15466 ?auto_15467 ) ( CLEAR ?auto_15466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15466 )
      ( MAKE-3PILE ?auto_15466 ?auto_15467 ?auto_15468 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15481 - BLOCK
      ?auto_15482 - BLOCK
      ?auto_15483 - BLOCK
      ?auto_15484 - BLOCK
    )
    :vars
    (
      ?auto_15485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15483 ) ( ON ?auto_15484 ?auto_15485 ) ( CLEAR ?auto_15484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15481 ) ( ON ?auto_15482 ?auto_15481 ) ( ON ?auto_15483 ?auto_15482 ) ( not ( = ?auto_15481 ?auto_15482 ) ) ( not ( = ?auto_15481 ?auto_15483 ) ) ( not ( = ?auto_15481 ?auto_15484 ) ) ( not ( = ?auto_15481 ?auto_15485 ) ) ( not ( = ?auto_15482 ?auto_15483 ) ) ( not ( = ?auto_15482 ?auto_15484 ) ) ( not ( = ?auto_15482 ?auto_15485 ) ) ( not ( = ?auto_15483 ?auto_15484 ) ) ( not ( = ?auto_15483 ?auto_15485 ) ) ( not ( = ?auto_15484 ?auto_15485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15484 ?auto_15485 )
      ( !STACK ?auto_15484 ?auto_15483 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15499 - BLOCK
      ?auto_15500 - BLOCK
      ?auto_15501 - BLOCK
      ?auto_15502 - BLOCK
    )
    :vars
    (
      ?auto_15503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15502 ?auto_15503 ) ( ON-TABLE ?auto_15499 ) ( ON ?auto_15500 ?auto_15499 ) ( not ( = ?auto_15499 ?auto_15500 ) ) ( not ( = ?auto_15499 ?auto_15501 ) ) ( not ( = ?auto_15499 ?auto_15502 ) ) ( not ( = ?auto_15499 ?auto_15503 ) ) ( not ( = ?auto_15500 ?auto_15501 ) ) ( not ( = ?auto_15500 ?auto_15502 ) ) ( not ( = ?auto_15500 ?auto_15503 ) ) ( not ( = ?auto_15501 ?auto_15502 ) ) ( not ( = ?auto_15501 ?auto_15503 ) ) ( not ( = ?auto_15502 ?auto_15503 ) ) ( CLEAR ?auto_15500 ) ( ON ?auto_15501 ?auto_15502 ) ( CLEAR ?auto_15501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15499 ?auto_15500 ?auto_15501 )
      ( MAKE-4PILE ?auto_15499 ?auto_15500 ?auto_15501 ?auto_15502 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15517 - BLOCK
      ?auto_15518 - BLOCK
      ?auto_15519 - BLOCK
      ?auto_15520 - BLOCK
    )
    :vars
    (
      ?auto_15521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15520 ?auto_15521 ) ( ON-TABLE ?auto_15517 ) ( not ( = ?auto_15517 ?auto_15518 ) ) ( not ( = ?auto_15517 ?auto_15519 ) ) ( not ( = ?auto_15517 ?auto_15520 ) ) ( not ( = ?auto_15517 ?auto_15521 ) ) ( not ( = ?auto_15518 ?auto_15519 ) ) ( not ( = ?auto_15518 ?auto_15520 ) ) ( not ( = ?auto_15518 ?auto_15521 ) ) ( not ( = ?auto_15519 ?auto_15520 ) ) ( not ( = ?auto_15519 ?auto_15521 ) ) ( not ( = ?auto_15520 ?auto_15521 ) ) ( ON ?auto_15519 ?auto_15520 ) ( CLEAR ?auto_15517 ) ( ON ?auto_15518 ?auto_15519 ) ( CLEAR ?auto_15518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15517 ?auto_15518 )
      ( MAKE-4PILE ?auto_15517 ?auto_15518 ?auto_15519 ?auto_15520 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15535 - BLOCK
      ?auto_15536 - BLOCK
      ?auto_15537 - BLOCK
      ?auto_15538 - BLOCK
    )
    :vars
    (
      ?auto_15539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15538 ?auto_15539 ) ( not ( = ?auto_15535 ?auto_15536 ) ) ( not ( = ?auto_15535 ?auto_15537 ) ) ( not ( = ?auto_15535 ?auto_15538 ) ) ( not ( = ?auto_15535 ?auto_15539 ) ) ( not ( = ?auto_15536 ?auto_15537 ) ) ( not ( = ?auto_15536 ?auto_15538 ) ) ( not ( = ?auto_15536 ?auto_15539 ) ) ( not ( = ?auto_15537 ?auto_15538 ) ) ( not ( = ?auto_15537 ?auto_15539 ) ) ( not ( = ?auto_15538 ?auto_15539 ) ) ( ON ?auto_15537 ?auto_15538 ) ( ON ?auto_15536 ?auto_15537 ) ( ON ?auto_15535 ?auto_15536 ) ( CLEAR ?auto_15535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15535 )
      ( MAKE-4PILE ?auto_15535 ?auto_15536 ?auto_15537 ?auto_15538 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_15554 - BLOCK
      ?auto_15555 - BLOCK
      ?auto_15556 - BLOCK
      ?auto_15557 - BLOCK
      ?auto_15558 - BLOCK
    )
    :vars
    (
      ?auto_15559 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15557 ) ( ON ?auto_15558 ?auto_15559 ) ( CLEAR ?auto_15558 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15554 ) ( ON ?auto_15555 ?auto_15554 ) ( ON ?auto_15556 ?auto_15555 ) ( ON ?auto_15557 ?auto_15556 ) ( not ( = ?auto_15554 ?auto_15555 ) ) ( not ( = ?auto_15554 ?auto_15556 ) ) ( not ( = ?auto_15554 ?auto_15557 ) ) ( not ( = ?auto_15554 ?auto_15558 ) ) ( not ( = ?auto_15554 ?auto_15559 ) ) ( not ( = ?auto_15555 ?auto_15556 ) ) ( not ( = ?auto_15555 ?auto_15557 ) ) ( not ( = ?auto_15555 ?auto_15558 ) ) ( not ( = ?auto_15555 ?auto_15559 ) ) ( not ( = ?auto_15556 ?auto_15557 ) ) ( not ( = ?auto_15556 ?auto_15558 ) ) ( not ( = ?auto_15556 ?auto_15559 ) ) ( not ( = ?auto_15557 ?auto_15558 ) ) ( not ( = ?auto_15557 ?auto_15559 ) ) ( not ( = ?auto_15558 ?auto_15559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15558 ?auto_15559 )
      ( !STACK ?auto_15558 ?auto_15557 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_15576 - BLOCK
      ?auto_15577 - BLOCK
      ?auto_15578 - BLOCK
      ?auto_15579 - BLOCK
      ?auto_15580 - BLOCK
    )
    :vars
    (
      ?auto_15581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15580 ?auto_15581 ) ( ON-TABLE ?auto_15576 ) ( ON ?auto_15577 ?auto_15576 ) ( ON ?auto_15578 ?auto_15577 ) ( not ( = ?auto_15576 ?auto_15577 ) ) ( not ( = ?auto_15576 ?auto_15578 ) ) ( not ( = ?auto_15576 ?auto_15579 ) ) ( not ( = ?auto_15576 ?auto_15580 ) ) ( not ( = ?auto_15576 ?auto_15581 ) ) ( not ( = ?auto_15577 ?auto_15578 ) ) ( not ( = ?auto_15577 ?auto_15579 ) ) ( not ( = ?auto_15577 ?auto_15580 ) ) ( not ( = ?auto_15577 ?auto_15581 ) ) ( not ( = ?auto_15578 ?auto_15579 ) ) ( not ( = ?auto_15578 ?auto_15580 ) ) ( not ( = ?auto_15578 ?auto_15581 ) ) ( not ( = ?auto_15579 ?auto_15580 ) ) ( not ( = ?auto_15579 ?auto_15581 ) ) ( not ( = ?auto_15580 ?auto_15581 ) ) ( CLEAR ?auto_15578 ) ( ON ?auto_15579 ?auto_15580 ) ( CLEAR ?auto_15579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15576 ?auto_15577 ?auto_15578 ?auto_15579 )
      ( MAKE-5PILE ?auto_15576 ?auto_15577 ?auto_15578 ?auto_15579 ?auto_15580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_15598 - BLOCK
      ?auto_15599 - BLOCK
      ?auto_15600 - BLOCK
      ?auto_15601 - BLOCK
      ?auto_15602 - BLOCK
    )
    :vars
    (
      ?auto_15603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15602 ?auto_15603 ) ( ON-TABLE ?auto_15598 ) ( ON ?auto_15599 ?auto_15598 ) ( not ( = ?auto_15598 ?auto_15599 ) ) ( not ( = ?auto_15598 ?auto_15600 ) ) ( not ( = ?auto_15598 ?auto_15601 ) ) ( not ( = ?auto_15598 ?auto_15602 ) ) ( not ( = ?auto_15598 ?auto_15603 ) ) ( not ( = ?auto_15599 ?auto_15600 ) ) ( not ( = ?auto_15599 ?auto_15601 ) ) ( not ( = ?auto_15599 ?auto_15602 ) ) ( not ( = ?auto_15599 ?auto_15603 ) ) ( not ( = ?auto_15600 ?auto_15601 ) ) ( not ( = ?auto_15600 ?auto_15602 ) ) ( not ( = ?auto_15600 ?auto_15603 ) ) ( not ( = ?auto_15601 ?auto_15602 ) ) ( not ( = ?auto_15601 ?auto_15603 ) ) ( not ( = ?auto_15602 ?auto_15603 ) ) ( ON ?auto_15601 ?auto_15602 ) ( CLEAR ?auto_15599 ) ( ON ?auto_15600 ?auto_15601 ) ( CLEAR ?auto_15600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15598 ?auto_15599 ?auto_15600 )
      ( MAKE-5PILE ?auto_15598 ?auto_15599 ?auto_15600 ?auto_15601 ?auto_15602 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_15620 - BLOCK
      ?auto_15621 - BLOCK
      ?auto_15622 - BLOCK
      ?auto_15623 - BLOCK
      ?auto_15624 - BLOCK
    )
    :vars
    (
      ?auto_15625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15624 ?auto_15625 ) ( ON-TABLE ?auto_15620 ) ( not ( = ?auto_15620 ?auto_15621 ) ) ( not ( = ?auto_15620 ?auto_15622 ) ) ( not ( = ?auto_15620 ?auto_15623 ) ) ( not ( = ?auto_15620 ?auto_15624 ) ) ( not ( = ?auto_15620 ?auto_15625 ) ) ( not ( = ?auto_15621 ?auto_15622 ) ) ( not ( = ?auto_15621 ?auto_15623 ) ) ( not ( = ?auto_15621 ?auto_15624 ) ) ( not ( = ?auto_15621 ?auto_15625 ) ) ( not ( = ?auto_15622 ?auto_15623 ) ) ( not ( = ?auto_15622 ?auto_15624 ) ) ( not ( = ?auto_15622 ?auto_15625 ) ) ( not ( = ?auto_15623 ?auto_15624 ) ) ( not ( = ?auto_15623 ?auto_15625 ) ) ( not ( = ?auto_15624 ?auto_15625 ) ) ( ON ?auto_15623 ?auto_15624 ) ( ON ?auto_15622 ?auto_15623 ) ( CLEAR ?auto_15620 ) ( ON ?auto_15621 ?auto_15622 ) ( CLEAR ?auto_15621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15620 ?auto_15621 )
      ( MAKE-5PILE ?auto_15620 ?auto_15621 ?auto_15622 ?auto_15623 ?auto_15624 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_15642 - BLOCK
      ?auto_15643 - BLOCK
      ?auto_15644 - BLOCK
      ?auto_15645 - BLOCK
      ?auto_15646 - BLOCK
    )
    :vars
    (
      ?auto_15647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15646 ?auto_15647 ) ( not ( = ?auto_15642 ?auto_15643 ) ) ( not ( = ?auto_15642 ?auto_15644 ) ) ( not ( = ?auto_15642 ?auto_15645 ) ) ( not ( = ?auto_15642 ?auto_15646 ) ) ( not ( = ?auto_15642 ?auto_15647 ) ) ( not ( = ?auto_15643 ?auto_15644 ) ) ( not ( = ?auto_15643 ?auto_15645 ) ) ( not ( = ?auto_15643 ?auto_15646 ) ) ( not ( = ?auto_15643 ?auto_15647 ) ) ( not ( = ?auto_15644 ?auto_15645 ) ) ( not ( = ?auto_15644 ?auto_15646 ) ) ( not ( = ?auto_15644 ?auto_15647 ) ) ( not ( = ?auto_15645 ?auto_15646 ) ) ( not ( = ?auto_15645 ?auto_15647 ) ) ( not ( = ?auto_15646 ?auto_15647 ) ) ( ON ?auto_15645 ?auto_15646 ) ( ON ?auto_15644 ?auto_15645 ) ( ON ?auto_15643 ?auto_15644 ) ( ON ?auto_15642 ?auto_15643 ) ( CLEAR ?auto_15642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15642 )
      ( MAKE-5PILE ?auto_15642 ?auto_15643 ?auto_15644 ?auto_15645 ?auto_15646 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15665 - BLOCK
      ?auto_15666 - BLOCK
      ?auto_15667 - BLOCK
      ?auto_15668 - BLOCK
      ?auto_15669 - BLOCK
      ?auto_15670 - BLOCK
    )
    :vars
    (
      ?auto_15671 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15669 ) ( ON ?auto_15670 ?auto_15671 ) ( CLEAR ?auto_15670 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15665 ) ( ON ?auto_15666 ?auto_15665 ) ( ON ?auto_15667 ?auto_15666 ) ( ON ?auto_15668 ?auto_15667 ) ( ON ?auto_15669 ?auto_15668 ) ( not ( = ?auto_15665 ?auto_15666 ) ) ( not ( = ?auto_15665 ?auto_15667 ) ) ( not ( = ?auto_15665 ?auto_15668 ) ) ( not ( = ?auto_15665 ?auto_15669 ) ) ( not ( = ?auto_15665 ?auto_15670 ) ) ( not ( = ?auto_15665 ?auto_15671 ) ) ( not ( = ?auto_15666 ?auto_15667 ) ) ( not ( = ?auto_15666 ?auto_15668 ) ) ( not ( = ?auto_15666 ?auto_15669 ) ) ( not ( = ?auto_15666 ?auto_15670 ) ) ( not ( = ?auto_15666 ?auto_15671 ) ) ( not ( = ?auto_15667 ?auto_15668 ) ) ( not ( = ?auto_15667 ?auto_15669 ) ) ( not ( = ?auto_15667 ?auto_15670 ) ) ( not ( = ?auto_15667 ?auto_15671 ) ) ( not ( = ?auto_15668 ?auto_15669 ) ) ( not ( = ?auto_15668 ?auto_15670 ) ) ( not ( = ?auto_15668 ?auto_15671 ) ) ( not ( = ?auto_15669 ?auto_15670 ) ) ( not ( = ?auto_15669 ?auto_15671 ) ) ( not ( = ?auto_15670 ?auto_15671 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15670 ?auto_15671 )
      ( !STACK ?auto_15670 ?auto_15669 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15678 - BLOCK
      ?auto_15679 - BLOCK
      ?auto_15680 - BLOCK
      ?auto_15681 - BLOCK
      ?auto_15682 - BLOCK
      ?auto_15683 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15682 ) ( ON-TABLE ?auto_15683 ) ( CLEAR ?auto_15683 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15678 ) ( ON ?auto_15679 ?auto_15678 ) ( ON ?auto_15680 ?auto_15679 ) ( ON ?auto_15681 ?auto_15680 ) ( ON ?auto_15682 ?auto_15681 ) ( not ( = ?auto_15678 ?auto_15679 ) ) ( not ( = ?auto_15678 ?auto_15680 ) ) ( not ( = ?auto_15678 ?auto_15681 ) ) ( not ( = ?auto_15678 ?auto_15682 ) ) ( not ( = ?auto_15678 ?auto_15683 ) ) ( not ( = ?auto_15679 ?auto_15680 ) ) ( not ( = ?auto_15679 ?auto_15681 ) ) ( not ( = ?auto_15679 ?auto_15682 ) ) ( not ( = ?auto_15679 ?auto_15683 ) ) ( not ( = ?auto_15680 ?auto_15681 ) ) ( not ( = ?auto_15680 ?auto_15682 ) ) ( not ( = ?auto_15680 ?auto_15683 ) ) ( not ( = ?auto_15681 ?auto_15682 ) ) ( not ( = ?auto_15681 ?auto_15683 ) ) ( not ( = ?auto_15682 ?auto_15683 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_15683 )
      ( !STACK ?auto_15683 ?auto_15682 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15690 - BLOCK
      ?auto_15691 - BLOCK
      ?auto_15692 - BLOCK
      ?auto_15693 - BLOCK
      ?auto_15694 - BLOCK
      ?auto_15695 - BLOCK
    )
    :vars
    (
      ?auto_15696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15695 ?auto_15696 ) ( ON-TABLE ?auto_15690 ) ( ON ?auto_15691 ?auto_15690 ) ( ON ?auto_15692 ?auto_15691 ) ( ON ?auto_15693 ?auto_15692 ) ( not ( = ?auto_15690 ?auto_15691 ) ) ( not ( = ?auto_15690 ?auto_15692 ) ) ( not ( = ?auto_15690 ?auto_15693 ) ) ( not ( = ?auto_15690 ?auto_15694 ) ) ( not ( = ?auto_15690 ?auto_15695 ) ) ( not ( = ?auto_15690 ?auto_15696 ) ) ( not ( = ?auto_15691 ?auto_15692 ) ) ( not ( = ?auto_15691 ?auto_15693 ) ) ( not ( = ?auto_15691 ?auto_15694 ) ) ( not ( = ?auto_15691 ?auto_15695 ) ) ( not ( = ?auto_15691 ?auto_15696 ) ) ( not ( = ?auto_15692 ?auto_15693 ) ) ( not ( = ?auto_15692 ?auto_15694 ) ) ( not ( = ?auto_15692 ?auto_15695 ) ) ( not ( = ?auto_15692 ?auto_15696 ) ) ( not ( = ?auto_15693 ?auto_15694 ) ) ( not ( = ?auto_15693 ?auto_15695 ) ) ( not ( = ?auto_15693 ?auto_15696 ) ) ( not ( = ?auto_15694 ?auto_15695 ) ) ( not ( = ?auto_15694 ?auto_15696 ) ) ( not ( = ?auto_15695 ?auto_15696 ) ) ( CLEAR ?auto_15693 ) ( ON ?auto_15694 ?auto_15695 ) ( CLEAR ?auto_15694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_15690 ?auto_15691 ?auto_15692 ?auto_15693 ?auto_15694 )
      ( MAKE-6PILE ?auto_15690 ?auto_15691 ?auto_15692 ?auto_15693 ?auto_15694 ?auto_15695 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15703 - BLOCK
      ?auto_15704 - BLOCK
      ?auto_15705 - BLOCK
      ?auto_15706 - BLOCK
      ?auto_15707 - BLOCK
      ?auto_15708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15708 ) ( ON-TABLE ?auto_15703 ) ( ON ?auto_15704 ?auto_15703 ) ( ON ?auto_15705 ?auto_15704 ) ( ON ?auto_15706 ?auto_15705 ) ( not ( = ?auto_15703 ?auto_15704 ) ) ( not ( = ?auto_15703 ?auto_15705 ) ) ( not ( = ?auto_15703 ?auto_15706 ) ) ( not ( = ?auto_15703 ?auto_15707 ) ) ( not ( = ?auto_15703 ?auto_15708 ) ) ( not ( = ?auto_15704 ?auto_15705 ) ) ( not ( = ?auto_15704 ?auto_15706 ) ) ( not ( = ?auto_15704 ?auto_15707 ) ) ( not ( = ?auto_15704 ?auto_15708 ) ) ( not ( = ?auto_15705 ?auto_15706 ) ) ( not ( = ?auto_15705 ?auto_15707 ) ) ( not ( = ?auto_15705 ?auto_15708 ) ) ( not ( = ?auto_15706 ?auto_15707 ) ) ( not ( = ?auto_15706 ?auto_15708 ) ) ( not ( = ?auto_15707 ?auto_15708 ) ) ( CLEAR ?auto_15706 ) ( ON ?auto_15707 ?auto_15708 ) ( CLEAR ?auto_15707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_15703 ?auto_15704 ?auto_15705 ?auto_15706 ?auto_15707 )
      ( MAKE-6PILE ?auto_15703 ?auto_15704 ?auto_15705 ?auto_15706 ?auto_15707 ?auto_15708 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15715 - BLOCK
      ?auto_15716 - BLOCK
      ?auto_15717 - BLOCK
      ?auto_15718 - BLOCK
      ?auto_15719 - BLOCK
      ?auto_15720 - BLOCK
    )
    :vars
    (
      ?auto_15721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15720 ?auto_15721 ) ( ON-TABLE ?auto_15715 ) ( ON ?auto_15716 ?auto_15715 ) ( ON ?auto_15717 ?auto_15716 ) ( not ( = ?auto_15715 ?auto_15716 ) ) ( not ( = ?auto_15715 ?auto_15717 ) ) ( not ( = ?auto_15715 ?auto_15718 ) ) ( not ( = ?auto_15715 ?auto_15719 ) ) ( not ( = ?auto_15715 ?auto_15720 ) ) ( not ( = ?auto_15715 ?auto_15721 ) ) ( not ( = ?auto_15716 ?auto_15717 ) ) ( not ( = ?auto_15716 ?auto_15718 ) ) ( not ( = ?auto_15716 ?auto_15719 ) ) ( not ( = ?auto_15716 ?auto_15720 ) ) ( not ( = ?auto_15716 ?auto_15721 ) ) ( not ( = ?auto_15717 ?auto_15718 ) ) ( not ( = ?auto_15717 ?auto_15719 ) ) ( not ( = ?auto_15717 ?auto_15720 ) ) ( not ( = ?auto_15717 ?auto_15721 ) ) ( not ( = ?auto_15718 ?auto_15719 ) ) ( not ( = ?auto_15718 ?auto_15720 ) ) ( not ( = ?auto_15718 ?auto_15721 ) ) ( not ( = ?auto_15719 ?auto_15720 ) ) ( not ( = ?auto_15719 ?auto_15721 ) ) ( not ( = ?auto_15720 ?auto_15721 ) ) ( ON ?auto_15719 ?auto_15720 ) ( CLEAR ?auto_15717 ) ( ON ?auto_15718 ?auto_15719 ) ( CLEAR ?auto_15718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15715 ?auto_15716 ?auto_15717 ?auto_15718 )
      ( MAKE-6PILE ?auto_15715 ?auto_15716 ?auto_15717 ?auto_15718 ?auto_15719 ?auto_15720 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15728 - BLOCK
      ?auto_15729 - BLOCK
      ?auto_15730 - BLOCK
      ?auto_15731 - BLOCK
      ?auto_15732 - BLOCK
      ?auto_15733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15733 ) ( ON-TABLE ?auto_15728 ) ( ON ?auto_15729 ?auto_15728 ) ( ON ?auto_15730 ?auto_15729 ) ( not ( = ?auto_15728 ?auto_15729 ) ) ( not ( = ?auto_15728 ?auto_15730 ) ) ( not ( = ?auto_15728 ?auto_15731 ) ) ( not ( = ?auto_15728 ?auto_15732 ) ) ( not ( = ?auto_15728 ?auto_15733 ) ) ( not ( = ?auto_15729 ?auto_15730 ) ) ( not ( = ?auto_15729 ?auto_15731 ) ) ( not ( = ?auto_15729 ?auto_15732 ) ) ( not ( = ?auto_15729 ?auto_15733 ) ) ( not ( = ?auto_15730 ?auto_15731 ) ) ( not ( = ?auto_15730 ?auto_15732 ) ) ( not ( = ?auto_15730 ?auto_15733 ) ) ( not ( = ?auto_15731 ?auto_15732 ) ) ( not ( = ?auto_15731 ?auto_15733 ) ) ( not ( = ?auto_15732 ?auto_15733 ) ) ( ON ?auto_15732 ?auto_15733 ) ( CLEAR ?auto_15730 ) ( ON ?auto_15731 ?auto_15732 ) ( CLEAR ?auto_15731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15728 ?auto_15729 ?auto_15730 ?auto_15731 )
      ( MAKE-6PILE ?auto_15728 ?auto_15729 ?auto_15730 ?auto_15731 ?auto_15732 ?auto_15733 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15740 - BLOCK
      ?auto_15741 - BLOCK
      ?auto_15742 - BLOCK
      ?auto_15743 - BLOCK
      ?auto_15744 - BLOCK
      ?auto_15745 - BLOCK
    )
    :vars
    (
      ?auto_15746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15745 ?auto_15746 ) ( ON-TABLE ?auto_15740 ) ( ON ?auto_15741 ?auto_15740 ) ( not ( = ?auto_15740 ?auto_15741 ) ) ( not ( = ?auto_15740 ?auto_15742 ) ) ( not ( = ?auto_15740 ?auto_15743 ) ) ( not ( = ?auto_15740 ?auto_15744 ) ) ( not ( = ?auto_15740 ?auto_15745 ) ) ( not ( = ?auto_15740 ?auto_15746 ) ) ( not ( = ?auto_15741 ?auto_15742 ) ) ( not ( = ?auto_15741 ?auto_15743 ) ) ( not ( = ?auto_15741 ?auto_15744 ) ) ( not ( = ?auto_15741 ?auto_15745 ) ) ( not ( = ?auto_15741 ?auto_15746 ) ) ( not ( = ?auto_15742 ?auto_15743 ) ) ( not ( = ?auto_15742 ?auto_15744 ) ) ( not ( = ?auto_15742 ?auto_15745 ) ) ( not ( = ?auto_15742 ?auto_15746 ) ) ( not ( = ?auto_15743 ?auto_15744 ) ) ( not ( = ?auto_15743 ?auto_15745 ) ) ( not ( = ?auto_15743 ?auto_15746 ) ) ( not ( = ?auto_15744 ?auto_15745 ) ) ( not ( = ?auto_15744 ?auto_15746 ) ) ( not ( = ?auto_15745 ?auto_15746 ) ) ( ON ?auto_15744 ?auto_15745 ) ( ON ?auto_15743 ?auto_15744 ) ( CLEAR ?auto_15741 ) ( ON ?auto_15742 ?auto_15743 ) ( CLEAR ?auto_15742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15740 ?auto_15741 ?auto_15742 )
      ( MAKE-6PILE ?auto_15740 ?auto_15741 ?auto_15742 ?auto_15743 ?auto_15744 ?auto_15745 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15753 - BLOCK
      ?auto_15754 - BLOCK
      ?auto_15755 - BLOCK
      ?auto_15756 - BLOCK
      ?auto_15757 - BLOCK
      ?auto_15758 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15758 ) ( ON-TABLE ?auto_15753 ) ( ON ?auto_15754 ?auto_15753 ) ( not ( = ?auto_15753 ?auto_15754 ) ) ( not ( = ?auto_15753 ?auto_15755 ) ) ( not ( = ?auto_15753 ?auto_15756 ) ) ( not ( = ?auto_15753 ?auto_15757 ) ) ( not ( = ?auto_15753 ?auto_15758 ) ) ( not ( = ?auto_15754 ?auto_15755 ) ) ( not ( = ?auto_15754 ?auto_15756 ) ) ( not ( = ?auto_15754 ?auto_15757 ) ) ( not ( = ?auto_15754 ?auto_15758 ) ) ( not ( = ?auto_15755 ?auto_15756 ) ) ( not ( = ?auto_15755 ?auto_15757 ) ) ( not ( = ?auto_15755 ?auto_15758 ) ) ( not ( = ?auto_15756 ?auto_15757 ) ) ( not ( = ?auto_15756 ?auto_15758 ) ) ( not ( = ?auto_15757 ?auto_15758 ) ) ( ON ?auto_15757 ?auto_15758 ) ( ON ?auto_15756 ?auto_15757 ) ( CLEAR ?auto_15754 ) ( ON ?auto_15755 ?auto_15756 ) ( CLEAR ?auto_15755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15753 ?auto_15754 ?auto_15755 )
      ( MAKE-6PILE ?auto_15753 ?auto_15754 ?auto_15755 ?auto_15756 ?auto_15757 ?auto_15758 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15765 - BLOCK
      ?auto_15766 - BLOCK
      ?auto_15767 - BLOCK
      ?auto_15768 - BLOCK
      ?auto_15769 - BLOCK
      ?auto_15770 - BLOCK
    )
    :vars
    (
      ?auto_15771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15770 ?auto_15771 ) ( ON-TABLE ?auto_15765 ) ( not ( = ?auto_15765 ?auto_15766 ) ) ( not ( = ?auto_15765 ?auto_15767 ) ) ( not ( = ?auto_15765 ?auto_15768 ) ) ( not ( = ?auto_15765 ?auto_15769 ) ) ( not ( = ?auto_15765 ?auto_15770 ) ) ( not ( = ?auto_15765 ?auto_15771 ) ) ( not ( = ?auto_15766 ?auto_15767 ) ) ( not ( = ?auto_15766 ?auto_15768 ) ) ( not ( = ?auto_15766 ?auto_15769 ) ) ( not ( = ?auto_15766 ?auto_15770 ) ) ( not ( = ?auto_15766 ?auto_15771 ) ) ( not ( = ?auto_15767 ?auto_15768 ) ) ( not ( = ?auto_15767 ?auto_15769 ) ) ( not ( = ?auto_15767 ?auto_15770 ) ) ( not ( = ?auto_15767 ?auto_15771 ) ) ( not ( = ?auto_15768 ?auto_15769 ) ) ( not ( = ?auto_15768 ?auto_15770 ) ) ( not ( = ?auto_15768 ?auto_15771 ) ) ( not ( = ?auto_15769 ?auto_15770 ) ) ( not ( = ?auto_15769 ?auto_15771 ) ) ( not ( = ?auto_15770 ?auto_15771 ) ) ( ON ?auto_15769 ?auto_15770 ) ( ON ?auto_15768 ?auto_15769 ) ( ON ?auto_15767 ?auto_15768 ) ( CLEAR ?auto_15765 ) ( ON ?auto_15766 ?auto_15767 ) ( CLEAR ?auto_15766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15765 ?auto_15766 )
      ( MAKE-6PILE ?auto_15765 ?auto_15766 ?auto_15767 ?auto_15768 ?auto_15769 ?auto_15770 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15778 - BLOCK
      ?auto_15779 - BLOCK
      ?auto_15780 - BLOCK
      ?auto_15781 - BLOCK
      ?auto_15782 - BLOCK
      ?auto_15783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15783 ) ( ON-TABLE ?auto_15778 ) ( not ( = ?auto_15778 ?auto_15779 ) ) ( not ( = ?auto_15778 ?auto_15780 ) ) ( not ( = ?auto_15778 ?auto_15781 ) ) ( not ( = ?auto_15778 ?auto_15782 ) ) ( not ( = ?auto_15778 ?auto_15783 ) ) ( not ( = ?auto_15779 ?auto_15780 ) ) ( not ( = ?auto_15779 ?auto_15781 ) ) ( not ( = ?auto_15779 ?auto_15782 ) ) ( not ( = ?auto_15779 ?auto_15783 ) ) ( not ( = ?auto_15780 ?auto_15781 ) ) ( not ( = ?auto_15780 ?auto_15782 ) ) ( not ( = ?auto_15780 ?auto_15783 ) ) ( not ( = ?auto_15781 ?auto_15782 ) ) ( not ( = ?auto_15781 ?auto_15783 ) ) ( not ( = ?auto_15782 ?auto_15783 ) ) ( ON ?auto_15782 ?auto_15783 ) ( ON ?auto_15781 ?auto_15782 ) ( ON ?auto_15780 ?auto_15781 ) ( CLEAR ?auto_15778 ) ( ON ?auto_15779 ?auto_15780 ) ( CLEAR ?auto_15779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15778 ?auto_15779 )
      ( MAKE-6PILE ?auto_15778 ?auto_15779 ?auto_15780 ?auto_15781 ?auto_15782 ?auto_15783 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15790 - BLOCK
      ?auto_15791 - BLOCK
      ?auto_15792 - BLOCK
      ?auto_15793 - BLOCK
      ?auto_15794 - BLOCK
      ?auto_15795 - BLOCK
    )
    :vars
    (
      ?auto_15796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15795 ?auto_15796 ) ( not ( = ?auto_15790 ?auto_15791 ) ) ( not ( = ?auto_15790 ?auto_15792 ) ) ( not ( = ?auto_15790 ?auto_15793 ) ) ( not ( = ?auto_15790 ?auto_15794 ) ) ( not ( = ?auto_15790 ?auto_15795 ) ) ( not ( = ?auto_15790 ?auto_15796 ) ) ( not ( = ?auto_15791 ?auto_15792 ) ) ( not ( = ?auto_15791 ?auto_15793 ) ) ( not ( = ?auto_15791 ?auto_15794 ) ) ( not ( = ?auto_15791 ?auto_15795 ) ) ( not ( = ?auto_15791 ?auto_15796 ) ) ( not ( = ?auto_15792 ?auto_15793 ) ) ( not ( = ?auto_15792 ?auto_15794 ) ) ( not ( = ?auto_15792 ?auto_15795 ) ) ( not ( = ?auto_15792 ?auto_15796 ) ) ( not ( = ?auto_15793 ?auto_15794 ) ) ( not ( = ?auto_15793 ?auto_15795 ) ) ( not ( = ?auto_15793 ?auto_15796 ) ) ( not ( = ?auto_15794 ?auto_15795 ) ) ( not ( = ?auto_15794 ?auto_15796 ) ) ( not ( = ?auto_15795 ?auto_15796 ) ) ( ON ?auto_15794 ?auto_15795 ) ( ON ?auto_15793 ?auto_15794 ) ( ON ?auto_15792 ?auto_15793 ) ( ON ?auto_15791 ?auto_15792 ) ( ON ?auto_15790 ?auto_15791 ) ( CLEAR ?auto_15790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15790 )
      ( MAKE-6PILE ?auto_15790 ?auto_15791 ?auto_15792 ?auto_15793 ?auto_15794 ?auto_15795 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15803 - BLOCK
      ?auto_15804 - BLOCK
      ?auto_15805 - BLOCK
      ?auto_15806 - BLOCK
      ?auto_15807 - BLOCK
      ?auto_15808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15808 ) ( not ( = ?auto_15803 ?auto_15804 ) ) ( not ( = ?auto_15803 ?auto_15805 ) ) ( not ( = ?auto_15803 ?auto_15806 ) ) ( not ( = ?auto_15803 ?auto_15807 ) ) ( not ( = ?auto_15803 ?auto_15808 ) ) ( not ( = ?auto_15804 ?auto_15805 ) ) ( not ( = ?auto_15804 ?auto_15806 ) ) ( not ( = ?auto_15804 ?auto_15807 ) ) ( not ( = ?auto_15804 ?auto_15808 ) ) ( not ( = ?auto_15805 ?auto_15806 ) ) ( not ( = ?auto_15805 ?auto_15807 ) ) ( not ( = ?auto_15805 ?auto_15808 ) ) ( not ( = ?auto_15806 ?auto_15807 ) ) ( not ( = ?auto_15806 ?auto_15808 ) ) ( not ( = ?auto_15807 ?auto_15808 ) ) ( ON ?auto_15807 ?auto_15808 ) ( ON ?auto_15806 ?auto_15807 ) ( ON ?auto_15805 ?auto_15806 ) ( ON ?auto_15804 ?auto_15805 ) ( ON ?auto_15803 ?auto_15804 ) ( CLEAR ?auto_15803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15803 )
      ( MAKE-6PILE ?auto_15803 ?auto_15804 ?auto_15805 ?auto_15806 ?auto_15807 ?auto_15808 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_15815 - BLOCK
      ?auto_15816 - BLOCK
      ?auto_15817 - BLOCK
      ?auto_15818 - BLOCK
      ?auto_15819 - BLOCK
      ?auto_15820 - BLOCK
    )
    :vars
    (
      ?auto_15821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15815 ?auto_15816 ) ) ( not ( = ?auto_15815 ?auto_15817 ) ) ( not ( = ?auto_15815 ?auto_15818 ) ) ( not ( = ?auto_15815 ?auto_15819 ) ) ( not ( = ?auto_15815 ?auto_15820 ) ) ( not ( = ?auto_15816 ?auto_15817 ) ) ( not ( = ?auto_15816 ?auto_15818 ) ) ( not ( = ?auto_15816 ?auto_15819 ) ) ( not ( = ?auto_15816 ?auto_15820 ) ) ( not ( = ?auto_15817 ?auto_15818 ) ) ( not ( = ?auto_15817 ?auto_15819 ) ) ( not ( = ?auto_15817 ?auto_15820 ) ) ( not ( = ?auto_15818 ?auto_15819 ) ) ( not ( = ?auto_15818 ?auto_15820 ) ) ( not ( = ?auto_15819 ?auto_15820 ) ) ( ON ?auto_15815 ?auto_15821 ) ( not ( = ?auto_15820 ?auto_15821 ) ) ( not ( = ?auto_15819 ?auto_15821 ) ) ( not ( = ?auto_15818 ?auto_15821 ) ) ( not ( = ?auto_15817 ?auto_15821 ) ) ( not ( = ?auto_15816 ?auto_15821 ) ) ( not ( = ?auto_15815 ?auto_15821 ) ) ( ON ?auto_15816 ?auto_15815 ) ( ON ?auto_15817 ?auto_15816 ) ( ON ?auto_15818 ?auto_15817 ) ( ON ?auto_15819 ?auto_15818 ) ( ON ?auto_15820 ?auto_15819 ) ( CLEAR ?auto_15820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_15820 ?auto_15819 ?auto_15818 ?auto_15817 ?auto_15816 ?auto_15815 )
      ( MAKE-6PILE ?auto_15815 ?auto_15816 ?auto_15817 ?auto_15818 ?auto_15819 ?auto_15820 ) )
  )

)

