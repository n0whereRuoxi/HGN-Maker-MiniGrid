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
      ?auto_521398 - BLOCK
    )
    :vars
    (
      ?auto_521399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521398 ?auto_521399 ) ( CLEAR ?auto_521398 ) ( HAND-EMPTY ) ( not ( = ?auto_521398 ?auto_521399 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_521398 ?auto_521399 )
      ( !PUTDOWN ?auto_521398 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_521405 - BLOCK
      ?auto_521406 - BLOCK
    )
    :vars
    (
      ?auto_521407 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_521405 ) ( ON ?auto_521406 ?auto_521407 ) ( CLEAR ?auto_521406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_521405 ) ( not ( = ?auto_521405 ?auto_521406 ) ) ( not ( = ?auto_521405 ?auto_521407 ) ) ( not ( = ?auto_521406 ?auto_521407 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_521406 ?auto_521407 )
      ( !STACK ?auto_521406 ?auto_521405 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_521415 - BLOCK
      ?auto_521416 - BLOCK
    )
    :vars
    (
      ?auto_521417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521416 ?auto_521417 ) ( not ( = ?auto_521415 ?auto_521416 ) ) ( not ( = ?auto_521415 ?auto_521417 ) ) ( not ( = ?auto_521416 ?auto_521417 ) ) ( ON ?auto_521415 ?auto_521416 ) ( CLEAR ?auto_521415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_521415 )
      ( MAKE-2PILE ?auto_521415 ?auto_521416 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_521426 - BLOCK
      ?auto_521427 - BLOCK
      ?auto_521428 - BLOCK
    )
    :vars
    (
      ?auto_521429 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_521427 ) ( ON ?auto_521428 ?auto_521429 ) ( CLEAR ?auto_521428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_521426 ) ( ON ?auto_521427 ?auto_521426 ) ( not ( = ?auto_521426 ?auto_521427 ) ) ( not ( = ?auto_521426 ?auto_521428 ) ) ( not ( = ?auto_521426 ?auto_521429 ) ) ( not ( = ?auto_521427 ?auto_521428 ) ) ( not ( = ?auto_521427 ?auto_521429 ) ) ( not ( = ?auto_521428 ?auto_521429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_521428 ?auto_521429 )
      ( !STACK ?auto_521428 ?auto_521427 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_521440 - BLOCK
      ?auto_521441 - BLOCK
      ?auto_521442 - BLOCK
    )
    :vars
    (
      ?auto_521443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521442 ?auto_521443 ) ( ON-TABLE ?auto_521440 ) ( not ( = ?auto_521440 ?auto_521441 ) ) ( not ( = ?auto_521440 ?auto_521442 ) ) ( not ( = ?auto_521440 ?auto_521443 ) ) ( not ( = ?auto_521441 ?auto_521442 ) ) ( not ( = ?auto_521441 ?auto_521443 ) ) ( not ( = ?auto_521442 ?auto_521443 ) ) ( CLEAR ?auto_521440 ) ( ON ?auto_521441 ?auto_521442 ) ( CLEAR ?auto_521441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_521440 ?auto_521441 )
      ( MAKE-3PILE ?auto_521440 ?auto_521441 ?auto_521442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_521454 - BLOCK
      ?auto_521455 - BLOCK
      ?auto_521456 - BLOCK
    )
    :vars
    (
      ?auto_521457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521456 ?auto_521457 ) ( not ( = ?auto_521454 ?auto_521455 ) ) ( not ( = ?auto_521454 ?auto_521456 ) ) ( not ( = ?auto_521454 ?auto_521457 ) ) ( not ( = ?auto_521455 ?auto_521456 ) ) ( not ( = ?auto_521455 ?auto_521457 ) ) ( not ( = ?auto_521456 ?auto_521457 ) ) ( ON ?auto_521455 ?auto_521456 ) ( ON ?auto_521454 ?auto_521455 ) ( CLEAR ?auto_521454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_521454 )
      ( MAKE-3PILE ?auto_521454 ?auto_521455 ?auto_521456 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_521469 - BLOCK
      ?auto_521470 - BLOCK
      ?auto_521471 - BLOCK
      ?auto_521472 - BLOCK
    )
    :vars
    (
      ?auto_521473 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_521471 ) ( ON ?auto_521472 ?auto_521473 ) ( CLEAR ?auto_521472 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_521469 ) ( ON ?auto_521470 ?auto_521469 ) ( ON ?auto_521471 ?auto_521470 ) ( not ( = ?auto_521469 ?auto_521470 ) ) ( not ( = ?auto_521469 ?auto_521471 ) ) ( not ( = ?auto_521469 ?auto_521472 ) ) ( not ( = ?auto_521469 ?auto_521473 ) ) ( not ( = ?auto_521470 ?auto_521471 ) ) ( not ( = ?auto_521470 ?auto_521472 ) ) ( not ( = ?auto_521470 ?auto_521473 ) ) ( not ( = ?auto_521471 ?auto_521472 ) ) ( not ( = ?auto_521471 ?auto_521473 ) ) ( not ( = ?auto_521472 ?auto_521473 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_521472 ?auto_521473 )
      ( !STACK ?auto_521472 ?auto_521471 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_521487 - BLOCK
      ?auto_521488 - BLOCK
      ?auto_521489 - BLOCK
      ?auto_521490 - BLOCK
    )
    :vars
    (
      ?auto_521491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521490 ?auto_521491 ) ( ON-TABLE ?auto_521487 ) ( ON ?auto_521488 ?auto_521487 ) ( not ( = ?auto_521487 ?auto_521488 ) ) ( not ( = ?auto_521487 ?auto_521489 ) ) ( not ( = ?auto_521487 ?auto_521490 ) ) ( not ( = ?auto_521487 ?auto_521491 ) ) ( not ( = ?auto_521488 ?auto_521489 ) ) ( not ( = ?auto_521488 ?auto_521490 ) ) ( not ( = ?auto_521488 ?auto_521491 ) ) ( not ( = ?auto_521489 ?auto_521490 ) ) ( not ( = ?auto_521489 ?auto_521491 ) ) ( not ( = ?auto_521490 ?auto_521491 ) ) ( CLEAR ?auto_521488 ) ( ON ?auto_521489 ?auto_521490 ) ( CLEAR ?auto_521489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_521487 ?auto_521488 ?auto_521489 )
      ( MAKE-4PILE ?auto_521487 ?auto_521488 ?auto_521489 ?auto_521490 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_521505 - BLOCK
      ?auto_521506 - BLOCK
      ?auto_521507 - BLOCK
      ?auto_521508 - BLOCK
    )
    :vars
    (
      ?auto_521509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521508 ?auto_521509 ) ( ON-TABLE ?auto_521505 ) ( not ( = ?auto_521505 ?auto_521506 ) ) ( not ( = ?auto_521505 ?auto_521507 ) ) ( not ( = ?auto_521505 ?auto_521508 ) ) ( not ( = ?auto_521505 ?auto_521509 ) ) ( not ( = ?auto_521506 ?auto_521507 ) ) ( not ( = ?auto_521506 ?auto_521508 ) ) ( not ( = ?auto_521506 ?auto_521509 ) ) ( not ( = ?auto_521507 ?auto_521508 ) ) ( not ( = ?auto_521507 ?auto_521509 ) ) ( not ( = ?auto_521508 ?auto_521509 ) ) ( ON ?auto_521507 ?auto_521508 ) ( CLEAR ?auto_521505 ) ( ON ?auto_521506 ?auto_521507 ) ( CLEAR ?auto_521506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_521505 ?auto_521506 )
      ( MAKE-4PILE ?auto_521505 ?auto_521506 ?auto_521507 ?auto_521508 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_521523 - BLOCK
      ?auto_521524 - BLOCK
      ?auto_521525 - BLOCK
      ?auto_521526 - BLOCK
    )
    :vars
    (
      ?auto_521527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521526 ?auto_521527 ) ( not ( = ?auto_521523 ?auto_521524 ) ) ( not ( = ?auto_521523 ?auto_521525 ) ) ( not ( = ?auto_521523 ?auto_521526 ) ) ( not ( = ?auto_521523 ?auto_521527 ) ) ( not ( = ?auto_521524 ?auto_521525 ) ) ( not ( = ?auto_521524 ?auto_521526 ) ) ( not ( = ?auto_521524 ?auto_521527 ) ) ( not ( = ?auto_521525 ?auto_521526 ) ) ( not ( = ?auto_521525 ?auto_521527 ) ) ( not ( = ?auto_521526 ?auto_521527 ) ) ( ON ?auto_521525 ?auto_521526 ) ( ON ?auto_521524 ?auto_521525 ) ( ON ?auto_521523 ?auto_521524 ) ( CLEAR ?auto_521523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_521523 )
      ( MAKE-4PILE ?auto_521523 ?auto_521524 ?auto_521525 ?auto_521526 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_521542 - BLOCK
      ?auto_521543 - BLOCK
      ?auto_521544 - BLOCK
      ?auto_521545 - BLOCK
      ?auto_521546 - BLOCK
    )
    :vars
    (
      ?auto_521547 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_521545 ) ( ON ?auto_521546 ?auto_521547 ) ( CLEAR ?auto_521546 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_521542 ) ( ON ?auto_521543 ?auto_521542 ) ( ON ?auto_521544 ?auto_521543 ) ( ON ?auto_521545 ?auto_521544 ) ( not ( = ?auto_521542 ?auto_521543 ) ) ( not ( = ?auto_521542 ?auto_521544 ) ) ( not ( = ?auto_521542 ?auto_521545 ) ) ( not ( = ?auto_521542 ?auto_521546 ) ) ( not ( = ?auto_521542 ?auto_521547 ) ) ( not ( = ?auto_521543 ?auto_521544 ) ) ( not ( = ?auto_521543 ?auto_521545 ) ) ( not ( = ?auto_521543 ?auto_521546 ) ) ( not ( = ?auto_521543 ?auto_521547 ) ) ( not ( = ?auto_521544 ?auto_521545 ) ) ( not ( = ?auto_521544 ?auto_521546 ) ) ( not ( = ?auto_521544 ?auto_521547 ) ) ( not ( = ?auto_521545 ?auto_521546 ) ) ( not ( = ?auto_521545 ?auto_521547 ) ) ( not ( = ?auto_521546 ?auto_521547 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_521546 ?auto_521547 )
      ( !STACK ?auto_521546 ?auto_521545 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_521564 - BLOCK
      ?auto_521565 - BLOCK
      ?auto_521566 - BLOCK
      ?auto_521567 - BLOCK
      ?auto_521568 - BLOCK
    )
    :vars
    (
      ?auto_521569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521568 ?auto_521569 ) ( ON-TABLE ?auto_521564 ) ( ON ?auto_521565 ?auto_521564 ) ( ON ?auto_521566 ?auto_521565 ) ( not ( = ?auto_521564 ?auto_521565 ) ) ( not ( = ?auto_521564 ?auto_521566 ) ) ( not ( = ?auto_521564 ?auto_521567 ) ) ( not ( = ?auto_521564 ?auto_521568 ) ) ( not ( = ?auto_521564 ?auto_521569 ) ) ( not ( = ?auto_521565 ?auto_521566 ) ) ( not ( = ?auto_521565 ?auto_521567 ) ) ( not ( = ?auto_521565 ?auto_521568 ) ) ( not ( = ?auto_521565 ?auto_521569 ) ) ( not ( = ?auto_521566 ?auto_521567 ) ) ( not ( = ?auto_521566 ?auto_521568 ) ) ( not ( = ?auto_521566 ?auto_521569 ) ) ( not ( = ?auto_521567 ?auto_521568 ) ) ( not ( = ?auto_521567 ?auto_521569 ) ) ( not ( = ?auto_521568 ?auto_521569 ) ) ( CLEAR ?auto_521566 ) ( ON ?auto_521567 ?auto_521568 ) ( CLEAR ?auto_521567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_521564 ?auto_521565 ?auto_521566 ?auto_521567 )
      ( MAKE-5PILE ?auto_521564 ?auto_521565 ?auto_521566 ?auto_521567 ?auto_521568 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_521586 - BLOCK
      ?auto_521587 - BLOCK
      ?auto_521588 - BLOCK
      ?auto_521589 - BLOCK
      ?auto_521590 - BLOCK
    )
    :vars
    (
      ?auto_521591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521590 ?auto_521591 ) ( ON-TABLE ?auto_521586 ) ( ON ?auto_521587 ?auto_521586 ) ( not ( = ?auto_521586 ?auto_521587 ) ) ( not ( = ?auto_521586 ?auto_521588 ) ) ( not ( = ?auto_521586 ?auto_521589 ) ) ( not ( = ?auto_521586 ?auto_521590 ) ) ( not ( = ?auto_521586 ?auto_521591 ) ) ( not ( = ?auto_521587 ?auto_521588 ) ) ( not ( = ?auto_521587 ?auto_521589 ) ) ( not ( = ?auto_521587 ?auto_521590 ) ) ( not ( = ?auto_521587 ?auto_521591 ) ) ( not ( = ?auto_521588 ?auto_521589 ) ) ( not ( = ?auto_521588 ?auto_521590 ) ) ( not ( = ?auto_521588 ?auto_521591 ) ) ( not ( = ?auto_521589 ?auto_521590 ) ) ( not ( = ?auto_521589 ?auto_521591 ) ) ( not ( = ?auto_521590 ?auto_521591 ) ) ( ON ?auto_521589 ?auto_521590 ) ( CLEAR ?auto_521587 ) ( ON ?auto_521588 ?auto_521589 ) ( CLEAR ?auto_521588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_521586 ?auto_521587 ?auto_521588 )
      ( MAKE-5PILE ?auto_521586 ?auto_521587 ?auto_521588 ?auto_521589 ?auto_521590 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_521608 - BLOCK
      ?auto_521609 - BLOCK
      ?auto_521610 - BLOCK
      ?auto_521611 - BLOCK
      ?auto_521612 - BLOCK
    )
    :vars
    (
      ?auto_521613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521612 ?auto_521613 ) ( ON-TABLE ?auto_521608 ) ( not ( = ?auto_521608 ?auto_521609 ) ) ( not ( = ?auto_521608 ?auto_521610 ) ) ( not ( = ?auto_521608 ?auto_521611 ) ) ( not ( = ?auto_521608 ?auto_521612 ) ) ( not ( = ?auto_521608 ?auto_521613 ) ) ( not ( = ?auto_521609 ?auto_521610 ) ) ( not ( = ?auto_521609 ?auto_521611 ) ) ( not ( = ?auto_521609 ?auto_521612 ) ) ( not ( = ?auto_521609 ?auto_521613 ) ) ( not ( = ?auto_521610 ?auto_521611 ) ) ( not ( = ?auto_521610 ?auto_521612 ) ) ( not ( = ?auto_521610 ?auto_521613 ) ) ( not ( = ?auto_521611 ?auto_521612 ) ) ( not ( = ?auto_521611 ?auto_521613 ) ) ( not ( = ?auto_521612 ?auto_521613 ) ) ( ON ?auto_521611 ?auto_521612 ) ( ON ?auto_521610 ?auto_521611 ) ( CLEAR ?auto_521608 ) ( ON ?auto_521609 ?auto_521610 ) ( CLEAR ?auto_521609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_521608 ?auto_521609 )
      ( MAKE-5PILE ?auto_521608 ?auto_521609 ?auto_521610 ?auto_521611 ?auto_521612 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_521630 - BLOCK
      ?auto_521631 - BLOCK
      ?auto_521632 - BLOCK
      ?auto_521633 - BLOCK
      ?auto_521634 - BLOCK
    )
    :vars
    (
      ?auto_521635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521634 ?auto_521635 ) ( not ( = ?auto_521630 ?auto_521631 ) ) ( not ( = ?auto_521630 ?auto_521632 ) ) ( not ( = ?auto_521630 ?auto_521633 ) ) ( not ( = ?auto_521630 ?auto_521634 ) ) ( not ( = ?auto_521630 ?auto_521635 ) ) ( not ( = ?auto_521631 ?auto_521632 ) ) ( not ( = ?auto_521631 ?auto_521633 ) ) ( not ( = ?auto_521631 ?auto_521634 ) ) ( not ( = ?auto_521631 ?auto_521635 ) ) ( not ( = ?auto_521632 ?auto_521633 ) ) ( not ( = ?auto_521632 ?auto_521634 ) ) ( not ( = ?auto_521632 ?auto_521635 ) ) ( not ( = ?auto_521633 ?auto_521634 ) ) ( not ( = ?auto_521633 ?auto_521635 ) ) ( not ( = ?auto_521634 ?auto_521635 ) ) ( ON ?auto_521633 ?auto_521634 ) ( ON ?auto_521632 ?auto_521633 ) ( ON ?auto_521631 ?auto_521632 ) ( ON ?auto_521630 ?auto_521631 ) ( CLEAR ?auto_521630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_521630 )
      ( MAKE-5PILE ?auto_521630 ?auto_521631 ?auto_521632 ?auto_521633 ?auto_521634 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_521653 - BLOCK
      ?auto_521654 - BLOCK
      ?auto_521655 - BLOCK
      ?auto_521656 - BLOCK
      ?auto_521657 - BLOCK
      ?auto_521658 - BLOCK
    )
    :vars
    (
      ?auto_521659 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_521657 ) ( ON ?auto_521658 ?auto_521659 ) ( CLEAR ?auto_521658 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_521653 ) ( ON ?auto_521654 ?auto_521653 ) ( ON ?auto_521655 ?auto_521654 ) ( ON ?auto_521656 ?auto_521655 ) ( ON ?auto_521657 ?auto_521656 ) ( not ( = ?auto_521653 ?auto_521654 ) ) ( not ( = ?auto_521653 ?auto_521655 ) ) ( not ( = ?auto_521653 ?auto_521656 ) ) ( not ( = ?auto_521653 ?auto_521657 ) ) ( not ( = ?auto_521653 ?auto_521658 ) ) ( not ( = ?auto_521653 ?auto_521659 ) ) ( not ( = ?auto_521654 ?auto_521655 ) ) ( not ( = ?auto_521654 ?auto_521656 ) ) ( not ( = ?auto_521654 ?auto_521657 ) ) ( not ( = ?auto_521654 ?auto_521658 ) ) ( not ( = ?auto_521654 ?auto_521659 ) ) ( not ( = ?auto_521655 ?auto_521656 ) ) ( not ( = ?auto_521655 ?auto_521657 ) ) ( not ( = ?auto_521655 ?auto_521658 ) ) ( not ( = ?auto_521655 ?auto_521659 ) ) ( not ( = ?auto_521656 ?auto_521657 ) ) ( not ( = ?auto_521656 ?auto_521658 ) ) ( not ( = ?auto_521656 ?auto_521659 ) ) ( not ( = ?auto_521657 ?auto_521658 ) ) ( not ( = ?auto_521657 ?auto_521659 ) ) ( not ( = ?auto_521658 ?auto_521659 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_521658 ?auto_521659 )
      ( !STACK ?auto_521658 ?auto_521657 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_521679 - BLOCK
      ?auto_521680 - BLOCK
      ?auto_521681 - BLOCK
      ?auto_521682 - BLOCK
      ?auto_521683 - BLOCK
      ?auto_521684 - BLOCK
    )
    :vars
    (
      ?auto_521685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521684 ?auto_521685 ) ( ON-TABLE ?auto_521679 ) ( ON ?auto_521680 ?auto_521679 ) ( ON ?auto_521681 ?auto_521680 ) ( ON ?auto_521682 ?auto_521681 ) ( not ( = ?auto_521679 ?auto_521680 ) ) ( not ( = ?auto_521679 ?auto_521681 ) ) ( not ( = ?auto_521679 ?auto_521682 ) ) ( not ( = ?auto_521679 ?auto_521683 ) ) ( not ( = ?auto_521679 ?auto_521684 ) ) ( not ( = ?auto_521679 ?auto_521685 ) ) ( not ( = ?auto_521680 ?auto_521681 ) ) ( not ( = ?auto_521680 ?auto_521682 ) ) ( not ( = ?auto_521680 ?auto_521683 ) ) ( not ( = ?auto_521680 ?auto_521684 ) ) ( not ( = ?auto_521680 ?auto_521685 ) ) ( not ( = ?auto_521681 ?auto_521682 ) ) ( not ( = ?auto_521681 ?auto_521683 ) ) ( not ( = ?auto_521681 ?auto_521684 ) ) ( not ( = ?auto_521681 ?auto_521685 ) ) ( not ( = ?auto_521682 ?auto_521683 ) ) ( not ( = ?auto_521682 ?auto_521684 ) ) ( not ( = ?auto_521682 ?auto_521685 ) ) ( not ( = ?auto_521683 ?auto_521684 ) ) ( not ( = ?auto_521683 ?auto_521685 ) ) ( not ( = ?auto_521684 ?auto_521685 ) ) ( CLEAR ?auto_521682 ) ( ON ?auto_521683 ?auto_521684 ) ( CLEAR ?auto_521683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_521679 ?auto_521680 ?auto_521681 ?auto_521682 ?auto_521683 )
      ( MAKE-6PILE ?auto_521679 ?auto_521680 ?auto_521681 ?auto_521682 ?auto_521683 ?auto_521684 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_521705 - BLOCK
      ?auto_521706 - BLOCK
      ?auto_521707 - BLOCK
      ?auto_521708 - BLOCK
      ?auto_521709 - BLOCK
      ?auto_521710 - BLOCK
    )
    :vars
    (
      ?auto_521711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521710 ?auto_521711 ) ( ON-TABLE ?auto_521705 ) ( ON ?auto_521706 ?auto_521705 ) ( ON ?auto_521707 ?auto_521706 ) ( not ( = ?auto_521705 ?auto_521706 ) ) ( not ( = ?auto_521705 ?auto_521707 ) ) ( not ( = ?auto_521705 ?auto_521708 ) ) ( not ( = ?auto_521705 ?auto_521709 ) ) ( not ( = ?auto_521705 ?auto_521710 ) ) ( not ( = ?auto_521705 ?auto_521711 ) ) ( not ( = ?auto_521706 ?auto_521707 ) ) ( not ( = ?auto_521706 ?auto_521708 ) ) ( not ( = ?auto_521706 ?auto_521709 ) ) ( not ( = ?auto_521706 ?auto_521710 ) ) ( not ( = ?auto_521706 ?auto_521711 ) ) ( not ( = ?auto_521707 ?auto_521708 ) ) ( not ( = ?auto_521707 ?auto_521709 ) ) ( not ( = ?auto_521707 ?auto_521710 ) ) ( not ( = ?auto_521707 ?auto_521711 ) ) ( not ( = ?auto_521708 ?auto_521709 ) ) ( not ( = ?auto_521708 ?auto_521710 ) ) ( not ( = ?auto_521708 ?auto_521711 ) ) ( not ( = ?auto_521709 ?auto_521710 ) ) ( not ( = ?auto_521709 ?auto_521711 ) ) ( not ( = ?auto_521710 ?auto_521711 ) ) ( ON ?auto_521709 ?auto_521710 ) ( CLEAR ?auto_521707 ) ( ON ?auto_521708 ?auto_521709 ) ( CLEAR ?auto_521708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_521705 ?auto_521706 ?auto_521707 ?auto_521708 )
      ( MAKE-6PILE ?auto_521705 ?auto_521706 ?auto_521707 ?auto_521708 ?auto_521709 ?auto_521710 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_521731 - BLOCK
      ?auto_521732 - BLOCK
      ?auto_521733 - BLOCK
      ?auto_521734 - BLOCK
      ?auto_521735 - BLOCK
      ?auto_521736 - BLOCK
    )
    :vars
    (
      ?auto_521737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521736 ?auto_521737 ) ( ON-TABLE ?auto_521731 ) ( ON ?auto_521732 ?auto_521731 ) ( not ( = ?auto_521731 ?auto_521732 ) ) ( not ( = ?auto_521731 ?auto_521733 ) ) ( not ( = ?auto_521731 ?auto_521734 ) ) ( not ( = ?auto_521731 ?auto_521735 ) ) ( not ( = ?auto_521731 ?auto_521736 ) ) ( not ( = ?auto_521731 ?auto_521737 ) ) ( not ( = ?auto_521732 ?auto_521733 ) ) ( not ( = ?auto_521732 ?auto_521734 ) ) ( not ( = ?auto_521732 ?auto_521735 ) ) ( not ( = ?auto_521732 ?auto_521736 ) ) ( not ( = ?auto_521732 ?auto_521737 ) ) ( not ( = ?auto_521733 ?auto_521734 ) ) ( not ( = ?auto_521733 ?auto_521735 ) ) ( not ( = ?auto_521733 ?auto_521736 ) ) ( not ( = ?auto_521733 ?auto_521737 ) ) ( not ( = ?auto_521734 ?auto_521735 ) ) ( not ( = ?auto_521734 ?auto_521736 ) ) ( not ( = ?auto_521734 ?auto_521737 ) ) ( not ( = ?auto_521735 ?auto_521736 ) ) ( not ( = ?auto_521735 ?auto_521737 ) ) ( not ( = ?auto_521736 ?auto_521737 ) ) ( ON ?auto_521735 ?auto_521736 ) ( ON ?auto_521734 ?auto_521735 ) ( CLEAR ?auto_521732 ) ( ON ?auto_521733 ?auto_521734 ) ( CLEAR ?auto_521733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_521731 ?auto_521732 ?auto_521733 )
      ( MAKE-6PILE ?auto_521731 ?auto_521732 ?auto_521733 ?auto_521734 ?auto_521735 ?auto_521736 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_521757 - BLOCK
      ?auto_521758 - BLOCK
      ?auto_521759 - BLOCK
      ?auto_521760 - BLOCK
      ?auto_521761 - BLOCK
      ?auto_521762 - BLOCK
    )
    :vars
    (
      ?auto_521763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521762 ?auto_521763 ) ( ON-TABLE ?auto_521757 ) ( not ( = ?auto_521757 ?auto_521758 ) ) ( not ( = ?auto_521757 ?auto_521759 ) ) ( not ( = ?auto_521757 ?auto_521760 ) ) ( not ( = ?auto_521757 ?auto_521761 ) ) ( not ( = ?auto_521757 ?auto_521762 ) ) ( not ( = ?auto_521757 ?auto_521763 ) ) ( not ( = ?auto_521758 ?auto_521759 ) ) ( not ( = ?auto_521758 ?auto_521760 ) ) ( not ( = ?auto_521758 ?auto_521761 ) ) ( not ( = ?auto_521758 ?auto_521762 ) ) ( not ( = ?auto_521758 ?auto_521763 ) ) ( not ( = ?auto_521759 ?auto_521760 ) ) ( not ( = ?auto_521759 ?auto_521761 ) ) ( not ( = ?auto_521759 ?auto_521762 ) ) ( not ( = ?auto_521759 ?auto_521763 ) ) ( not ( = ?auto_521760 ?auto_521761 ) ) ( not ( = ?auto_521760 ?auto_521762 ) ) ( not ( = ?auto_521760 ?auto_521763 ) ) ( not ( = ?auto_521761 ?auto_521762 ) ) ( not ( = ?auto_521761 ?auto_521763 ) ) ( not ( = ?auto_521762 ?auto_521763 ) ) ( ON ?auto_521761 ?auto_521762 ) ( ON ?auto_521760 ?auto_521761 ) ( ON ?auto_521759 ?auto_521760 ) ( CLEAR ?auto_521757 ) ( ON ?auto_521758 ?auto_521759 ) ( CLEAR ?auto_521758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_521757 ?auto_521758 )
      ( MAKE-6PILE ?auto_521757 ?auto_521758 ?auto_521759 ?auto_521760 ?auto_521761 ?auto_521762 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_521783 - BLOCK
      ?auto_521784 - BLOCK
      ?auto_521785 - BLOCK
      ?auto_521786 - BLOCK
      ?auto_521787 - BLOCK
      ?auto_521788 - BLOCK
    )
    :vars
    (
      ?auto_521789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521788 ?auto_521789 ) ( not ( = ?auto_521783 ?auto_521784 ) ) ( not ( = ?auto_521783 ?auto_521785 ) ) ( not ( = ?auto_521783 ?auto_521786 ) ) ( not ( = ?auto_521783 ?auto_521787 ) ) ( not ( = ?auto_521783 ?auto_521788 ) ) ( not ( = ?auto_521783 ?auto_521789 ) ) ( not ( = ?auto_521784 ?auto_521785 ) ) ( not ( = ?auto_521784 ?auto_521786 ) ) ( not ( = ?auto_521784 ?auto_521787 ) ) ( not ( = ?auto_521784 ?auto_521788 ) ) ( not ( = ?auto_521784 ?auto_521789 ) ) ( not ( = ?auto_521785 ?auto_521786 ) ) ( not ( = ?auto_521785 ?auto_521787 ) ) ( not ( = ?auto_521785 ?auto_521788 ) ) ( not ( = ?auto_521785 ?auto_521789 ) ) ( not ( = ?auto_521786 ?auto_521787 ) ) ( not ( = ?auto_521786 ?auto_521788 ) ) ( not ( = ?auto_521786 ?auto_521789 ) ) ( not ( = ?auto_521787 ?auto_521788 ) ) ( not ( = ?auto_521787 ?auto_521789 ) ) ( not ( = ?auto_521788 ?auto_521789 ) ) ( ON ?auto_521787 ?auto_521788 ) ( ON ?auto_521786 ?auto_521787 ) ( ON ?auto_521785 ?auto_521786 ) ( ON ?auto_521784 ?auto_521785 ) ( ON ?auto_521783 ?auto_521784 ) ( CLEAR ?auto_521783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_521783 )
      ( MAKE-6PILE ?auto_521783 ?auto_521784 ?auto_521785 ?auto_521786 ?auto_521787 ?auto_521788 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_521810 - BLOCK
      ?auto_521811 - BLOCK
      ?auto_521812 - BLOCK
      ?auto_521813 - BLOCK
      ?auto_521814 - BLOCK
      ?auto_521815 - BLOCK
      ?auto_521816 - BLOCK
    )
    :vars
    (
      ?auto_521817 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_521815 ) ( ON ?auto_521816 ?auto_521817 ) ( CLEAR ?auto_521816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_521810 ) ( ON ?auto_521811 ?auto_521810 ) ( ON ?auto_521812 ?auto_521811 ) ( ON ?auto_521813 ?auto_521812 ) ( ON ?auto_521814 ?auto_521813 ) ( ON ?auto_521815 ?auto_521814 ) ( not ( = ?auto_521810 ?auto_521811 ) ) ( not ( = ?auto_521810 ?auto_521812 ) ) ( not ( = ?auto_521810 ?auto_521813 ) ) ( not ( = ?auto_521810 ?auto_521814 ) ) ( not ( = ?auto_521810 ?auto_521815 ) ) ( not ( = ?auto_521810 ?auto_521816 ) ) ( not ( = ?auto_521810 ?auto_521817 ) ) ( not ( = ?auto_521811 ?auto_521812 ) ) ( not ( = ?auto_521811 ?auto_521813 ) ) ( not ( = ?auto_521811 ?auto_521814 ) ) ( not ( = ?auto_521811 ?auto_521815 ) ) ( not ( = ?auto_521811 ?auto_521816 ) ) ( not ( = ?auto_521811 ?auto_521817 ) ) ( not ( = ?auto_521812 ?auto_521813 ) ) ( not ( = ?auto_521812 ?auto_521814 ) ) ( not ( = ?auto_521812 ?auto_521815 ) ) ( not ( = ?auto_521812 ?auto_521816 ) ) ( not ( = ?auto_521812 ?auto_521817 ) ) ( not ( = ?auto_521813 ?auto_521814 ) ) ( not ( = ?auto_521813 ?auto_521815 ) ) ( not ( = ?auto_521813 ?auto_521816 ) ) ( not ( = ?auto_521813 ?auto_521817 ) ) ( not ( = ?auto_521814 ?auto_521815 ) ) ( not ( = ?auto_521814 ?auto_521816 ) ) ( not ( = ?auto_521814 ?auto_521817 ) ) ( not ( = ?auto_521815 ?auto_521816 ) ) ( not ( = ?auto_521815 ?auto_521817 ) ) ( not ( = ?auto_521816 ?auto_521817 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_521816 ?auto_521817 )
      ( !STACK ?auto_521816 ?auto_521815 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_521840 - BLOCK
      ?auto_521841 - BLOCK
      ?auto_521842 - BLOCK
      ?auto_521843 - BLOCK
      ?auto_521844 - BLOCK
      ?auto_521845 - BLOCK
      ?auto_521846 - BLOCK
    )
    :vars
    (
      ?auto_521847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521846 ?auto_521847 ) ( ON-TABLE ?auto_521840 ) ( ON ?auto_521841 ?auto_521840 ) ( ON ?auto_521842 ?auto_521841 ) ( ON ?auto_521843 ?auto_521842 ) ( ON ?auto_521844 ?auto_521843 ) ( not ( = ?auto_521840 ?auto_521841 ) ) ( not ( = ?auto_521840 ?auto_521842 ) ) ( not ( = ?auto_521840 ?auto_521843 ) ) ( not ( = ?auto_521840 ?auto_521844 ) ) ( not ( = ?auto_521840 ?auto_521845 ) ) ( not ( = ?auto_521840 ?auto_521846 ) ) ( not ( = ?auto_521840 ?auto_521847 ) ) ( not ( = ?auto_521841 ?auto_521842 ) ) ( not ( = ?auto_521841 ?auto_521843 ) ) ( not ( = ?auto_521841 ?auto_521844 ) ) ( not ( = ?auto_521841 ?auto_521845 ) ) ( not ( = ?auto_521841 ?auto_521846 ) ) ( not ( = ?auto_521841 ?auto_521847 ) ) ( not ( = ?auto_521842 ?auto_521843 ) ) ( not ( = ?auto_521842 ?auto_521844 ) ) ( not ( = ?auto_521842 ?auto_521845 ) ) ( not ( = ?auto_521842 ?auto_521846 ) ) ( not ( = ?auto_521842 ?auto_521847 ) ) ( not ( = ?auto_521843 ?auto_521844 ) ) ( not ( = ?auto_521843 ?auto_521845 ) ) ( not ( = ?auto_521843 ?auto_521846 ) ) ( not ( = ?auto_521843 ?auto_521847 ) ) ( not ( = ?auto_521844 ?auto_521845 ) ) ( not ( = ?auto_521844 ?auto_521846 ) ) ( not ( = ?auto_521844 ?auto_521847 ) ) ( not ( = ?auto_521845 ?auto_521846 ) ) ( not ( = ?auto_521845 ?auto_521847 ) ) ( not ( = ?auto_521846 ?auto_521847 ) ) ( CLEAR ?auto_521844 ) ( ON ?auto_521845 ?auto_521846 ) ( CLEAR ?auto_521845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_521840 ?auto_521841 ?auto_521842 ?auto_521843 ?auto_521844 ?auto_521845 )
      ( MAKE-7PILE ?auto_521840 ?auto_521841 ?auto_521842 ?auto_521843 ?auto_521844 ?auto_521845 ?auto_521846 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_521870 - BLOCK
      ?auto_521871 - BLOCK
      ?auto_521872 - BLOCK
      ?auto_521873 - BLOCK
      ?auto_521874 - BLOCK
      ?auto_521875 - BLOCK
      ?auto_521876 - BLOCK
    )
    :vars
    (
      ?auto_521877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521876 ?auto_521877 ) ( ON-TABLE ?auto_521870 ) ( ON ?auto_521871 ?auto_521870 ) ( ON ?auto_521872 ?auto_521871 ) ( ON ?auto_521873 ?auto_521872 ) ( not ( = ?auto_521870 ?auto_521871 ) ) ( not ( = ?auto_521870 ?auto_521872 ) ) ( not ( = ?auto_521870 ?auto_521873 ) ) ( not ( = ?auto_521870 ?auto_521874 ) ) ( not ( = ?auto_521870 ?auto_521875 ) ) ( not ( = ?auto_521870 ?auto_521876 ) ) ( not ( = ?auto_521870 ?auto_521877 ) ) ( not ( = ?auto_521871 ?auto_521872 ) ) ( not ( = ?auto_521871 ?auto_521873 ) ) ( not ( = ?auto_521871 ?auto_521874 ) ) ( not ( = ?auto_521871 ?auto_521875 ) ) ( not ( = ?auto_521871 ?auto_521876 ) ) ( not ( = ?auto_521871 ?auto_521877 ) ) ( not ( = ?auto_521872 ?auto_521873 ) ) ( not ( = ?auto_521872 ?auto_521874 ) ) ( not ( = ?auto_521872 ?auto_521875 ) ) ( not ( = ?auto_521872 ?auto_521876 ) ) ( not ( = ?auto_521872 ?auto_521877 ) ) ( not ( = ?auto_521873 ?auto_521874 ) ) ( not ( = ?auto_521873 ?auto_521875 ) ) ( not ( = ?auto_521873 ?auto_521876 ) ) ( not ( = ?auto_521873 ?auto_521877 ) ) ( not ( = ?auto_521874 ?auto_521875 ) ) ( not ( = ?auto_521874 ?auto_521876 ) ) ( not ( = ?auto_521874 ?auto_521877 ) ) ( not ( = ?auto_521875 ?auto_521876 ) ) ( not ( = ?auto_521875 ?auto_521877 ) ) ( not ( = ?auto_521876 ?auto_521877 ) ) ( ON ?auto_521875 ?auto_521876 ) ( CLEAR ?auto_521873 ) ( ON ?auto_521874 ?auto_521875 ) ( CLEAR ?auto_521874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_521870 ?auto_521871 ?auto_521872 ?auto_521873 ?auto_521874 )
      ( MAKE-7PILE ?auto_521870 ?auto_521871 ?auto_521872 ?auto_521873 ?auto_521874 ?auto_521875 ?auto_521876 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_521900 - BLOCK
      ?auto_521901 - BLOCK
      ?auto_521902 - BLOCK
      ?auto_521903 - BLOCK
      ?auto_521904 - BLOCK
      ?auto_521905 - BLOCK
      ?auto_521906 - BLOCK
    )
    :vars
    (
      ?auto_521907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521906 ?auto_521907 ) ( ON-TABLE ?auto_521900 ) ( ON ?auto_521901 ?auto_521900 ) ( ON ?auto_521902 ?auto_521901 ) ( not ( = ?auto_521900 ?auto_521901 ) ) ( not ( = ?auto_521900 ?auto_521902 ) ) ( not ( = ?auto_521900 ?auto_521903 ) ) ( not ( = ?auto_521900 ?auto_521904 ) ) ( not ( = ?auto_521900 ?auto_521905 ) ) ( not ( = ?auto_521900 ?auto_521906 ) ) ( not ( = ?auto_521900 ?auto_521907 ) ) ( not ( = ?auto_521901 ?auto_521902 ) ) ( not ( = ?auto_521901 ?auto_521903 ) ) ( not ( = ?auto_521901 ?auto_521904 ) ) ( not ( = ?auto_521901 ?auto_521905 ) ) ( not ( = ?auto_521901 ?auto_521906 ) ) ( not ( = ?auto_521901 ?auto_521907 ) ) ( not ( = ?auto_521902 ?auto_521903 ) ) ( not ( = ?auto_521902 ?auto_521904 ) ) ( not ( = ?auto_521902 ?auto_521905 ) ) ( not ( = ?auto_521902 ?auto_521906 ) ) ( not ( = ?auto_521902 ?auto_521907 ) ) ( not ( = ?auto_521903 ?auto_521904 ) ) ( not ( = ?auto_521903 ?auto_521905 ) ) ( not ( = ?auto_521903 ?auto_521906 ) ) ( not ( = ?auto_521903 ?auto_521907 ) ) ( not ( = ?auto_521904 ?auto_521905 ) ) ( not ( = ?auto_521904 ?auto_521906 ) ) ( not ( = ?auto_521904 ?auto_521907 ) ) ( not ( = ?auto_521905 ?auto_521906 ) ) ( not ( = ?auto_521905 ?auto_521907 ) ) ( not ( = ?auto_521906 ?auto_521907 ) ) ( ON ?auto_521905 ?auto_521906 ) ( ON ?auto_521904 ?auto_521905 ) ( CLEAR ?auto_521902 ) ( ON ?auto_521903 ?auto_521904 ) ( CLEAR ?auto_521903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_521900 ?auto_521901 ?auto_521902 ?auto_521903 )
      ( MAKE-7PILE ?auto_521900 ?auto_521901 ?auto_521902 ?auto_521903 ?auto_521904 ?auto_521905 ?auto_521906 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_521930 - BLOCK
      ?auto_521931 - BLOCK
      ?auto_521932 - BLOCK
      ?auto_521933 - BLOCK
      ?auto_521934 - BLOCK
      ?auto_521935 - BLOCK
      ?auto_521936 - BLOCK
    )
    :vars
    (
      ?auto_521937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521936 ?auto_521937 ) ( ON-TABLE ?auto_521930 ) ( ON ?auto_521931 ?auto_521930 ) ( not ( = ?auto_521930 ?auto_521931 ) ) ( not ( = ?auto_521930 ?auto_521932 ) ) ( not ( = ?auto_521930 ?auto_521933 ) ) ( not ( = ?auto_521930 ?auto_521934 ) ) ( not ( = ?auto_521930 ?auto_521935 ) ) ( not ( = ?auto_521930 ?auto_521936 ) ) ( not ( = ?auto_521930 ?auto_521937 ) ) ( not ( = ?auto_521931 ?auto_521932 ) ) ( not ( = ?auto_521931 ?auto_521933 ) ) ( not ( = ?auto_521931 ?auto_521934 ) ) ( not ( = ?auto_521931 ?auto_521935 ) ) ( not ( = ?auto_521931 ?auto_521936 ) ) ( not ( = ?auto_521931 ?auto_521937 ) ) ( not ( = ?auto_521932 ?auto_521933 ) ) ( not ( = ?auto_521932 ?auto_521934 ) ) ( not ( = ?auto_521932 ?auto_521935 ) ) ( not ( = ?auto_521932 ?auto_521936 ) ) ( not ( = ?auto_521932 ?auto_521937 ) ) ( not ( = ?auto_521933 ?auto_521934 ) ) ( not ( = ?auto_521933 ?auto_521935 ) ) ( not ( = ?auto_521933 ?auto_521936 ) ) ( not ( = ?auto_521933 ?auto_521937 ) ) ( not ( = ?auto_521934 ?auto_521935 ) ) ( not ( = ?auto_521934 ?auto_521936 ) ) ( not ( = ?auto_521934 ?auto_521937 ) ) ( not ( = ?auto_521935 ?auto_521936 ) ) ( not ( = ?auto_521935 ?auto_521937 ) ) ( not ( = ?auto_521936 ?auto_521937 ) ) ( ON ?auto_521935 ?auto_521936 ) ( ON ?auto_521934 ?auto_521935 ) ( ON ?auto_521933 ?auto_521934 ) ( CLEAR ?auto_521931 ) ( ON ?auto_521932 ?auto_521933 ) ( CLEAR ?auto_521932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_521930 ?auto_521931 ?auto_521932 )
      ( MAKE-7PILE ?auto_521930 ?auto_521931 ?auto_521932 ?auto_521933 ?auto_521934 ?auto_521935 ?auto_521936 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_521960 - BLOCK
      ?auto_521961 - BLOCK
      ?auto_521962 - BLOCK
      ?auto_521963 - BLOCK
      ?auto_521964 - BLOCK
      ?auto_521965 - BLOCK
      ?auto_521966 - BLOCK
    )
    :vars
    (
      ?auto_521967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521966 ?auto_521967 ) ( ON-TABLE ?auto_521960 ) ( not ( = ?auto_521960 ?auto_521961 ) ) ( not ( = ?auto_521960 ?auto_521962 ) ) ( not ( = ?auto_521960 ?auto_521963 ) ) ( not ( = ?auto_521960 ?auto_521964 ) ) ( not ( = ?auto_521960 ?auto_521965 ) ) ( not ( = ?auto_521960 ?auto_521966 ) ) ( not ( = ?auto_521960 ?auto_521967 ) ) ( not ( = ?auto_521961 ?auto_521962 ) ) ( not ( = ?auto_521961 ?auto_521963 ) ) ( not ( = ?auto_521961 ?auto_521964 ) ) ( not ( = ?auto_521961 ?auto_521965 ) ) ( not ( = ?auto_521961 ?auto_521966 ) ) ( not ( = ?auto_521961 ?auto_521967 ) ) ( not ( = ?auto_521962 ?auto_521963 ) ) ( not ( = ?auto_521962 ?auto_521964 ) ) ( not ( = ?auto_521962 ?auto_521965 ) ) ( not ( = ?auto_521962 ?auto_521966 ) ) ( not ( = ?auto_521962 ?auto_521967 ) ) ( not ( = ?auto_521963 ?auto_521964 ) ) ( not ( = ?auto_521963 ?auto_521965 ) ) ( not ( = ?auto_521963 ?auto_521966 ) ) ( not ( = ?auto_521963 ?auto_521967 ) ) ( not ( = ?auto_521964 ?auto_521965 ) ) ( not ( = ?auto_521964 ?auto_521966 ) ) ( not ( = ?auto_521964 ?auto_521967 ) ) ( not ( = ?auto_521965 ?auto_521966 ) ) ( not ( = ?auto_521965 ?auto_521967 ) ) ( not ( = ?auto_521966 ?auto_521967 ) ) ( ON ?auto_521965 ?auto_521966 ) ( ON ?auto_521964 ?auto_521965 ) ( ON ?auto_521963 ?auto_521964 ) ( ON ?auto_521962 ?auto_521963 ) ( CLEAR ?auto_521960 ) ( ON ?auto_521961 ?auto_521962 ) ( CLEAR ?auto_521961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_521960 ?auto_521961 )
      ( MAKE-7PILE ?auto_521960 ?auto_521961 ?auto_521962 ?auto_521963 ?auto_521964 ?auto_521965 ?auto_521966 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_521990 - BLOCK
      ?auto_521991 - BLOCK
      ?auto_521992 - BLOCK
      ?auto_521993 - BLOCK
      ?auto_521994 - BLOCK
      ?auto_521995 - BLOCK
      ?auto_521996 - BLOCK
    )
    :vars
    (
      ?auto_521997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521996 ?auto_521997 ) ( not ( = ?auto_521990 ?auto_521991 ) ) ( not ( = ?auto_521990 ?auto_521992 ) ) ( not ( = ?auto_521990 ?auto_521993 ) ) ( not ( = ?auto_521990 ?auto_521994 ) ) ( not ( = ?auto_521990 ?auto_521995 ) ) ( not ( = ?auto_521990 ?auto_521996 ) ) ( not ( = ?auto_521990 ?auto_521997 ) ) ( not ( = ?auto_521991 ?auto_521992 ) ) ( not ( = ?auto_521991 ?auto_521993 ) ) ( not ( = ?auto_521991 ?auto_521994 ) ) ( not ( = ?auto_521991 ?auto_521995 ) ) ( not ( = ?auto_521991 ?auto_521996 ) ) ( not ( = ?auto_521991 ?auto_521997 ) ) ( not ( = ?auto_521992 ?auto_521993 ) ) ( not ( = ?auto_521992 ?auto_521994 ) ) ( not ( = ?auto_521992 ?auto_521995 ) ) ( not ( = ?auto_521992 ?auto_521996 ) ) ( not ( = ?auto_521992 ?auto_521997 ) ) ( not ( = ?auto_521993 ?auto_521994 ) ) ( not ( = ?auto_521993 ?auto_521995 ) ) ( not ( = ?auto_521993 ?auto_521996 ) ) ( not ( = ?auto_521993 ?auto_521997 ) ) ( not ( = ?auto_521994 ?auto_521995 ) ) ( not ( = ?auto_521994 ?auto_521996 ) ) ( not ( = ?auto_521994 ?auto_521997 ) ) ( not ( = ?auto_521995 ?auto_521996 ) ) ( not ( = ?auto_521995 ?auto_521997 ) ) ( not ( = ?auto_521996 ?auto_521997 ) ) ( ON ?auto_521995 ?auto_521996 ) ( ON ?auto_521994 ?auto_521995 ) ( ON ?auto_521993 ?auto_521994 ) ( ON ?auto_521992 ?auto_521993 ) ( ON ?auto_521991 ?auto_521992 ) ( ON ?auto_521990 ?auto_521991 ) ( CLEAR ?auto_521990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_521990 )
      ( MAKE-7PILE ?auto_521990 ?auto_521991 ?auto_521992 ?auto_521993 ?auto_521994 ?auto_521995 ?auto_521996 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_522021 - BLOCK
      ?auto_522022 - BLOCK
      ?auto_522023 - BLOCK
      ?auto_522024 - BLOCK
      ?auto_522025 - BLOCK
      ?auto_522026 - BLOCK
      ?auto_522027 - BLOCK
      ?auto_522028 - BLOCK
    )
    :vars
    (
      ?auto_522029 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_522027 ) ( ON ?auto_522028 ?auto_522029 ) ( CLEAR ?auto_522028 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_522021 ) ( ON ?auto_522022 ?auto_522021 ) ( ON ?auto_522023 ?auto_522022 ) ( ON ?auto_522024 ?auto_522023 ) ( ON ?auto_522025 ?auto_522024 ) ( ON ?auto_522026 ?auto_522025 ) ( ON ?auto_522027 ?auto_522026 ) ( not ( = ?auto_522021 ?auto_522022 ) ) ( not ( = ?auto_522021 ?auto_522023 ) ) ( not ( = ?auto_522021 ?auto_522024 ) ) ( not ( = ?auto_522021 ?auto_522025 ) ) ( not ( = ?auto_522021 ?auto_522026 ) ) ( not ( = ?auto_522021 ?auto_522027 ) ) ( not ( = ?auto_522021 ?auto_522028 ) ) ( not ( = ?auto_522021 ?auto_522029 ) ) ( not ( = ?auto_522022 ?auto_522023 ) ) ( not ( = ?auto_522022 ?auto_522024 ) ) ( not ( = ?auto_522022 ?auto_522025 ) ) ( not ( = ?auto_522022 ?auto_522026 ) ) ( not ( = ?auto_522022 ?auto_522027 ) ) ( not ( = ?auto_522022 ?auto_522028 ) ) ( not ( = ?auto_522022 ?auto_522029 ) ) ( not ( = ?auto_522023 ?auto_522024 ) ) ( not ( = ?auto_522023 ?auto_522025 ) ) ( not ( = ?auto_522023 ?auto_522026 ) ) ( not ( = ?auto_522023 ?auto_522027 ) ) ( not ( = ?auto_522023 ?auto_522028 ) ) ( not ( = ?auto_522023 ?auto_522029 ) ) ( not ( = ?auto_522024 ?auto_522025 ) ) ( not ( = ?auto_522024 ?auto_522026 ) ) ( not ( = ?auto_522024 ?auto_522027 ) ) ( not ( = ?auto_522024 ?auto_522028 ) ) ( not ( = ?auto_522024 ?auto_522029 ) ) ( not ( = ?auto_522025 ?auto_522026 ) ) ( not ( = ?auto_522025 ?auto_522027 ) ) ( not ( = ?auto_522025 ?auto_522028 ) ) ( not ( = ?auto_522025 ?auto_522029 ) ) ( not ( = ?auto_522026 ?auto_522027 ) ) ( not ( = ?auto_522026 ?auto_522028 ) ) ( not ( = ?auto_522026 ?auto_522029 ) ) ( not ( = ?auto_522027 ?auto_522028 ) ) ( not ( = ?auto_522027 ?auto_522029 ) ) ( not ( = ?auto_522028 ?auto_522029 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_522028 ?auto_522029 )
      ( !STACK ?auto_522028 ?auto_522027 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_522055 - BLOCK
      ?auto_522056 - BLOCK
      ?auto_522057 - BLOCK
      ?auto_522058 - BLOCK
      ?auto_522059 - BLOCK
      ?auto_522060 - BLOCK
      ?auto_522061 - BLOCK
      ?auto_522062 - BLOCK
    )
    :vars
    (
      ?auto_522063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522062 ?auto_522063 ) ( ON-TABLE ?auto_522055 ) ( ON ?auto_522056 ?auto_522055 ) ( ON ?auto_522057 ?auto_522056 ) ( ON ?auto_522058 ?auto_522057 ) ( ON ?auto_522059 ?auto_522058 ) ( ON ?auto_522060 ?auto_522059 ) ( not ( = ?auto_522055 ?auto_522056 ) ) ( not ( = ?auto_522055 ?auto_522057 ) ) ( not ( = ?auto_522055 ?auto_522058 ) ) ( not ( = ?auto_522055 ?auto_522059 ) ) ( not ( = ?auto_522055 ?auto_522060 ) ) ( not ( = ?auto_522055 ?auto_522061 ) ) ( not ( = ?auto_522055 ?auto_522062 ) ) ( not ( = ?auto_522055 ?auto_522063 ) ) ( not ( = ?auto_522056 ?auto_522057 ) ) ( not ( = ?auto_522056 ?auto_522058 ) ) ( not ( = ?auto_522056 ?auto_522059 ) ) ( not ( = ?auto_522056 ?auto_522060 ) ) ( not ( = ?auto_522056 ?auto_522061 ) ) ( not ( = ?auto_522056 ?auto_522062 ) ) ( not ( = ?auto_522056 ?auto_522063 ) ) ( not ( = ?auto_522057 ?auto_522058 ) ) ( not ( = ?auto_522057 ?auto_522059 ) ) ( not ( = ?auto_522057 ?auto_522060 ) ) ( not ( = ?auto_522057 ?auto_522061 ) ) ( not ( = ?auto_522057 ?auto_522062 ) ) ( not ( = ?auto_522057 ?auto_522063 ) ) ( not ( = ?auto_522058 ?auto_522059 ) ) ( not ( = ?auto_522058 ?auto_522060 ) ) ( not ( = ?auto_522058 ?auto_522061 ) ) ( not ( = ?auto_522058 ?auto_522062 ) ) ( not ( = ?auto_522058 ?auto_522063 ) ) ( not ( = ?auto_522059 ?auto_522060 ) ) ( not ( = ?auto_522059 ?auto_522061 ) ) ( not ( = ?auto_522059 ?auto_522062 ) ) ( not ( = ?auto_522059 ?auto_522063 ) ) ( not ( = ?auto_522060 ?auto_522061 ) ) ( not ( = ?auto_522060 ?auto_522062 ) ) ( not ( = ?auto_522060 ?auto_522063 ) ) ( not ( = ?auto_522061 ?auto_522062 ) ) ( not ( = ?auto_522061 ?auto_522063 ) ) ( not ( = ?auto_522062 ?auto_522063 ) ) ( CLEAR ?auto_522060 ) ( ON ?auto_522061 ?auto_522062 ) ( CLEAR ?auto_522061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_522055 ?auto_522056 ?auto_522057 ?auto_522058 ?auto_522059 ?auto_522060 ?auto_522061 )
      ( MAKE-8PILE ?auto_522055 ?auto_522056 ?auto_522057 ?auto_522058 ?auto_522059 ?auto_522060 ?auto_522061 ?auto_522062 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_522089 - BLOCK
      ?auto_522090 - BLOCK
      ?auto_522091 - BLOCK
      ?auto_522092 - BLOCK
      ?auto_522093 - BLOCK
      ?auto_522094 - BLOCK
      ?auto_522095 - BLOCK
      ?auto_522096 - BLOCK
    )
    :vars
    (
      ?auto_522097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522096 ?auto_522097 ) ( ON-TABLE ?auto_522089 ) ( ON ?auto_522090 ?auto_522089 ) ( ON ?auto_522091 ?auto_522090 ) ( ON ?auto_522092 ?auto_522091 ) ( ON ?auto_522093 ?auto_522092 ) ( not ( = ?auto_522089 ?auto_522090 ) ) ( not ( = ?auto_522089 ?auto_522091 ) ) ( not ( = ?auto_522089 ?auto_522092 ) ) ( not ( = ?auto_522089 ?auto_522093 ) ) ( not ( = ?auto_522089 ?auto_522094 ) ) ( not ( = ?auto_522089 ?auto_522095 ) ) ( not ( = ?auto_522089 ?auto_522096 ) ) ( not ( = ?auto_522089 ?auto_522097 ) ) ( not ( = ?auto_522090 ?auto_522091 ) ) ( not ( = ?auto_522090 ?auto_522092 ) ) ( not ( = ?auto_522090 ?auto_522093 ) ) ( not ( = ?auto_522090 ?auto_522094 ) ) ( not ( = ?auto_522090 ?auto_522095 ) ) ( not ( = ?auto_522090 ?auto_522096 ) ) ( not ( = ?auto_522090 ?auto_522097 ) ) ( not ( = ?auto_522091 ?auto_522092 ) ) ( not ( = ?auto_522091 ?auto_522093 ) ) ( not ( = ?auto_522091 ?auto_522094 ) ) ( not ( = ?auto_522091 ?auto_522095 ) ) ( not ( = ?auto_522091 ?auto_522096 ) ) ( not ( = ?auto_522091 ?auto_522097 ) ) ( not ( = ?auto_522092 ?auto_522093 ) ) ( not ( = ?auto_522092 ?auto_522094 ) ) ( not ( = ?auto_522092 ?auto_522095 ) ) ( not ( = ?auto_522092 ?auto_522096 ) ) ( not ( = ?auto_522092 ?auto_522097 ) ) ( not ( = ?auto_522093 ?auto_522094 ) ) ( not ( = ?auto_522093 ?auto_522095 ) ) ( not ( = ?auto_522093 ?auto_522096 ) ) ( not ( = ?auto_522093 ?auto_522097 ) ) ( not ( = ?auto_522094 ?auto_522095 ) ) ( not ( = ?auto_522094 ?auto_522096 ) ) ( not ( = ?auto_522094 ?auto_522097 ) ) ( not ( = ?auto_522095 ?auto_522096 ) ) ( not ( = ?auto_522095 ?auto_522097 ) ) ( not ( = ?auto_522096 ?auto_522097 ) ) ( ON ?auto_522095 ?auto_522096 ) ( CLEAR ?auto_522093 ) ( ON ?auto_522094 ?auto_522095 ) ( CLEAR ?auto_522094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_522089 ?auto_522090 ?auto_522091 ?auto_522092 ?auto_522093 ?auto_522094 )
      ( MAKE-8PILE ?auto_522089 ?auto_522090 ?auto_522091 ?auto_522092 ?auto_522093 ?auto_522094 ?auto_522095 ?auto_522096 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_522123 - BLOCK
      ?auto_522124 - BLOCK
      ?auto_522125 - BLOCK
      ?auto_522126 - BLOCK
      ?auto_522127 - BLOCK
      ?auto_522128 - BLOCK
      ?auto_522129 - BLOCK
      ?auto_522130 - BLOCK
    )
    :vars
    (
      ?auto_522131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522130 ?auto_522131 ) ( ON-TABLE ?auto_522123 ) ( ON ?auto_522124 ?auto_522123 ) ( ON ?auto_522125 ?auto_522124 ) ( ON ?auto_522126 ?auto_522125 ) ( not ( = ?auto_522123 ?auto_522124 ) ) ( not ( = ?auto_522123 ?auto_522125 ) ) ( not ( = ?auto_522123 ?auto_522126 ) ) ( not ( = ?auto_522123 ?auto_522127 ) ) ( not ( = ?auto_522123 ?auto_522128 ) ) ( not ( = ?auto_522123 ?auto_522129 ) ) ( not ( = ?auto_522123 ?auto_522130 ) ) ( not ( = ?auto_522123 ?auto_522131 ) ) ( not ( = ?auto_522124 ?auto_522125 ) ) ( not ( = ?auto_522124 ?auto_522126 ) ) ( not ( = ?auto_522124 ?auto_522127 ) ) ( not ( = ?auto_522124 ?auto_522128 ) ) ( not ( = ?auto_522124 ?auto_522129 ) ) ( not ( = ?auto_522124 ?auto_522130 ) ) ( not ( = ?auto_522124 ?auto_522131 ) ) ( not ( = ?auto_522125 ?auto_522126 ) ) ( not ( = ?auto_522125 ?auto_522127 ) ) ( not ( = ?auto_522125 ?auto_522128 ) ) ( not ( = ?auto_522125 ?auto_522129 ) ) ( not ( = ?auto_522125 ?auto_522130 ) ) ( not ( = ?auto_522125 ?auto_522131 ) ) ( not ( = ?auto_522126 ?auto_522127 ) ) ( not ( = ?auto_522126 ?auto_522128 ) ) ( not ( = ?auto_522126 ?auto_522129 ) ) ( not ( = ?auto_522126 ?auto_522130 ) ) ( not ( = ?auto_522126 ?auto_522131 ) ) ( not ( = ?auto_522127 ?auto_522128 ) ) ( not ( = ?auto_522127 ?auto_522129 ) ) ( not ( = ?auto_522127 ?auto_522130 ) ) ( not ( = ?auto_522127 ?auto_522131 ) ) ( not ( = ?auto_522128 ?auto_522129 ) ) ( not ( = ?auto_522128 ?auto_522130 ) ) ( not ( = ?auto_522128 ?auto_522131 ) ) ( not ( = ?auto_522129 ?auto_522130 ) ) ( not ( = ?auto_522129 ?auto_522131 ) ) ( not ( = ?auto_522130 ?auto_522131 ) ) ( ON ?auto_522129 ?auto_522130 ) ( ON ?auto_522128 ?auto_522129 ) ( CLEAR ?auto_522126 ) ( ON ?auto_522127 ?auto_522128 ) ( CLEAR ?auto_522127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_522123 ?auto_522124 ?auto_522125 ?auto_522126 ?auto_522127 )
      ( MAKE-8PILE ?auto_522123 ?auto_522124 ?auto_522125 ?auto_522126 ?auto_522127 ?auto_522128 ?auto_522129 ?auto_522130 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_522157 - BLOCK
      ?auto_522158 - BLOCK
      ?auto_522159 - BLOCK
      ?auto_522160 - BLOCK
      ?auto_522161 - BLOCK
      ?auto_522162 - BLOCK
      ?auto_522163 - BLOCK
      ?auto_522164 - BLOCK
    )
    :vars
    (
      ?auto_522165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522164 ?auto_522165 ) ( ON-TABLE ?auto_522157 ) ( ON ?auto_522158 ?auto_522157 ) ( ON ?auto_522159 ?auto_522158 ) ( not ( = ?auto_522157 ?auto_522158 ) ) ( not ( = ?auto_522157 ?auto_522159 ) ) ( not ( = ?auto_522157 ?auto_522160 ) ) ( not ( = ?auto_522157 ?auto_522161 ) ) ( not ( = ?auto_522157 ?auto_522162 ) ) ( not ( = ?auto_522157 ?auto_522163 ) ) ( not ( = ?auto_522157 ?auto_522164 ) ) ( not ( = ?auto_522157 ?auto_522165 ) ) ( not ( = ?auto_522158 ?auto_522159 ) ) ( not ( = ?auto_522158 ?auto_522160 ) ) ( not ( = ?auto_522158 ?auto_522161 ) ) ( not ( = ?auto_522158 ?auto_522162 ) ) ( not ( = ?auto_522158 ?auto_522163 ) ) ( not ( = ?auto_522158 ?auto_522164 ) ) ( not ( = ?auto_522158 ?auto_522165 ) ) ( not ( = ?auto_522159 ?auto_522160 ) ) ( not ( = ?auto_522159 ?auto_522161 ) ) ( not ( = ?auto_522159 ?auto_522162 ) ) ( not ( = ?auto_522159 ?auto_522163 ) ) ( not ( = ?auto_522159 ?auto_522164 ) ) ( not ( = ?auto_522159 ?auto_522165 ) ) ( not ( = ?auto_522160 ?auto_522161 ) ) ( not ( = ?auto_522160 ?auto_522162 ) ) ( not ( = ?auto_522160 ?auto_522163 ) ) ( not ( = ?auto_522160 ?auto_522164 ) ) ( not ( = ?auto_522160 ?auto_522165 ) ) ( not ( = ?auto_522161 ?auto_522162 ) ) ( not ( = ?auto_522161 ?auto_522163 ) ) ( not ( = ?auto_522161 ?auto_522164 ) ) ( not ( = ?auto_522161 ?auto_522165 ) ) ( not ( = ?auto_522162 ?auto_522163 ) ) ( not ( = ?auto_522162 ?auto_522164 ) ) ( not ( = ?auto_522162 ?auto_522165 ) ) ( not ( = ?auto_522163 ?auto_522164 ) ) ( not ( = ?auto_522163 ?auto_522165 ) ) ( not ( = ?auto_522164 ?auto_522165 ) ) ( ON ?auto_522163 ?auto_522164 ) ( ON ?auto_522162 ?auto_522163 ) ( ON ?auto_522161 ?auto_522162 ) ( CLEAR ?auto_522159 ) ( ON ?auto_522160 ?auto_522161 ) ( CLEAR ?auto_522160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_522157 ?auto_522158 ?auto_522159 ?auto_522160 )
      ( MAKE-8PILE ?auto_522157 ?auto_522158 ?auto_522159 ?auto_522160 ?auto_522161 ?auto_522162 ?auto_522163 ?auto_522164 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_522191 - BLOCK
      ?auto_522192 - BLOCK
      ?auto_522193 - BLOCK
      ?auto_522194 - BLOCK
      ?auto_522195 - BLOCK
      ?auto_522196 - BLOCK
      ?auto_522197 - BLOCK
      ?auto_522198 - BLOCK
    )
    :vars
    (
      ?auto_522199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522198 ?auto_522199 ) ( ON-TABLE ?auto_522191 ) ( ON ?auto_522192 ?auto_522191 ) ( not ( = ?auto_522191 ?auto_522192 ) ) ( not ( = ?auto_522191 ?auto_522193 ) ) ( not ( = ?auto_522191 ?auto_522194 ) ) ( not ( = ?auto_522191 ?auto_522195 ) ) ( not ( = ?auto_522191 ?auto_522196 ) ) ( not ( = ?auto_522191 ?auto_522197 ) ) ( not ( = ?auto_522191 ?auto_522198 ) ) ( not ( = ?auto_522191 ?auto_522199 ) ) ( not ( = ?auto_522192 ?auto_522193 ) ) ( not ( = ?auto_522192 ?auto_522194 ) ) ( not ( = ?auto_522192 ?auto_522195 ) ) ( not ( = ?auto_522192 ?auto_522196 ) ) ( not ( = ?auto_522192 ?auto_522197 ) ) ( not ( = ?auto_522192 ?auto_522198 ) ) ( not ( = ?auto_522192 ?auto_522199 ) ) ( not ( = ?auto_522193 ?auto_522194 ) ) ( not ( = ?auto_522193 ?auto_522195 ) ) ( not ( = ?auto_522193 ?auto_522196 ) ) ( not ( = ?auto_522193 ?auto_522197 ) ) ( not ( = ?auto_522193 ?auto_522198 ) ) ( not ( = ?auto_522193 ?auto_522199 ) ) ( not ( = ?auto_522194 ?auto_522195 ) ) ( not ( = ?auto_522194 ?auto_522196 ) ) ( not ( = ?auto_522194 ?auto_522197 ) ) ( not ( = ?auto_522194 ?auto_522198 ) ) ( not ( = ?auto_522194 ?auto_522199 ) ) ( not ( = ?auto_522195 ?auto_522196 ) ) ( not ( = ?auto_522195 ?auto_522197 ) ) ( not ( = ?auto_522195 ?auto_522198 ) ) ( not ( = ?auto_522195 ?auto_522199 ) ) ( not ( = ?auto_522196 ?auto_522197 ) ) ( not ( = ?auto_522196 ?auto_522198 ) ) ( not ( = ?auto_522196 ?auto_522199 ) ) ( not ( = ?auto_522197 ?auto_522198 ) ) ( not ( = ?auto_522197 ?auto_522199 ) ) ( not ( = ?auto_522198 ?auto_522199 ) ) ( ON ?auto_522197 ?auto_522198 ) ( ON ?auto_522196 ?auto_522197 ) ( ON ?auto_522195 ?auto_522196 ) ( ON ?auto_522194 ?auto_522195 ) ( CLEAR ?auto_522192 ) ( ON ?auto_522193 ?auto_522194 ) ( CLEAR ?auto_522193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_522191 ?auto_522192 ?auto_522193 )
      ( MAKE-8PILE ?auto_522191 ?auto_522192 ?auto_522193 ?auto_522194 ?auto_522195 ?auto_522196 ?auto_522197 ?auto_522198 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_522225 - BLOCK
      ?auto_522226 - BLOCK
      ?auto_522227 - BLOCK
      ?auto_522228 - BLOCK
      ?auto_522229 - BLOCK
      ?auto_522230 - BLOCK
      ?auto_522231 - BLOCK
      ?auto_522232 - BLOCK
    )
    :vars
    (
      ?auto_522233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522232 ?auto_522233 ) ( ON-TABLE ?auto_522225 ) ( not ( = ?auto_522225 ?auto_522226 ) ) ( not ( = ?auto_522225 ?auto_522227 ) ) ( not ( = ?auto_522225 ?auto_522228 ) ) ( not ( = ?auto_522225 ?auto_522229 ) ) ( not ( = ?auto_522225 ?auto_522230 ) ) ( not ( = ?auto_522225 ?auto_522231 ) ) ( not ( = ?auto_522225 ?auto_522232 ) ) ( not ( = ?auto_522225 ?auto_522233 ) ) ( not ( = ?auto_522226 ?auto_522227 ) ) ( not ( = ?auto_522226 ?auto_522228 ) ) ( not ( = ?auto_522226 ?auto_522229 ) ) ( not ( = ?auto_522226 ?auto_522230 ) ) ( not ( = ?auto_522226 ?auto_522231 ) ) ( not ( = ?auto_522226 ?auto_522232 ) ) ( not ( = ?auto_522226 ?auto_522233 ) ) ( not ( = ?auto_522227 ?auto_522228 ) ) ( not ( = ?auto_522227 ?auto_522229 ) ) ( not ( = ?auto_522227 ?auto_522230 ) ) ( not ( = ?auto_522227 ?auto_522231 ) ) ( not ( = ?auto_522227 ?auto_522232 ) ) ( not ( = ?auto_522227 ?auto_522233 ) ) ( not ( = ?auto_522228 ?auto_522229 ) ) ( not ( = ?auto_522228 ?auto_522230 ) ) ( not ( = ?auto_522228 ?auto_522231 ) ) ( not ( = ?auto_522228 ?auto_522232 ) ) ( not ( = ?auto_522228 ?auto_522233 ) ) ( not ( = ?auto_522229 ?auto_522230 ) ) ( not ( = ?auto_522229 ?auto_522231 ) ) ( not ( = ?auto_522229 ?auto_522232 ) ) ( not ( = ?auto_522229 ?auto_522233 ) ) ( not ( = ?auto_522230 ?auto_522231 ) ) ( not ( = ?auto_522230 ?auto_522232 ) ) ( not ( = ?auto_522230 ?auto_522233 ) ) ( not ( = ?auto_522231 ?auto_522232 ) ) ( not ( = ?auto_522231 ?auto_522233 ) ) ( not ( = ?auto_522232 ?auto_522233 ) ) ( ON ?auto_522231 ?auto_522232 ) ( ON ?auto_522230 ?auto_522231 ) ( ON ?auto_522229 ?auto_522230 ) ( ON ?auto_522228 ?auto_522229 ) ( ON ?auto_522227 ?auto_522228 ) ( CLEAR ?auto_522225 ) ( ON ?auto_522226 ?auto_522227 ) ( CLEAR ?auto_522226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_522225 ?auto_522226 )
      ( MAKE-8PILE ?auto_522225 ?auto_522226 ?auto_522227 ?auto_522228 ?auto_522229 ?auto_522230 ?auto_522231 ?auto_522232 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_522259 - BLOCK
      ?auto_522260 - BLOCK
      ?auto_522261 - BLOCK
      ?auto_522262 - BLOCK
      ?auto_522263 - BLOCK
      ?auto_522264 - BLOCK
      ?auto_522265 - BLOCK
      ?auto_522266 - BLOCK
    )
    :vars
    (
      ?auto_522267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522266 ?auto_522267 ) ( not ( = ?auto_522259 ?auto_522260 ) ) ( not ( = ?auto_522259 ?auto_522261 ) ) ( not ( = ?auto_522259 ?auto_522262 ) ) ( not ( = ?auto_522259 ?auto_522263 ) ) ( not ( = ?auto_522259 ?auto_522264 ) ) ( not ( = ?auto_522259 ?auto_522265 ) ) ( not ( = ?auto_522259 ?auto_522266 ) ) ( not ( = ?auto_522259 ?auto_522267 ) ) ( not ( = ?auto_522260 ?auto_522261 ) ) ( not ( = ?auto_522260 ?auto_522262 ) ) ( not ( = ?auto_522260 ?auto_522263 ) ) ( not ( = ?auto_522260 ?auto_522264 ) ) ( not ( = ?auto_522260 ?auto_522265 ) ) ( not ( = ?auto_522260 ?auto_522266 ) ) ( not ( = ?auto_522260 ?auto_522267 ) ) ( not ( = ?auto_522261 ?auto_522262 ) ) ( not ( = ?auto_522261 ?auto_522263 ) ) ( not ( = ?auto_522261 ?auto_522264 ) ) ( not ( = ?auto_522261 ?auto_522265 ) ) ( not ( = ?auto_522261 ?auto_522266 ) ) ( not ( = ?auto_522261 ?auto_522267 ) ) ( not ( = ?auto_522262 ?auto_522263 ) ) ( not ( = ?auto_522262 ?auto_522264 ) ) ( not ( = ?auto_522262 ?auto_522265 ) ) ( not ( = ?auto_522262 ?auto_522266 ) ) ( not ( = ?auto_522262 ?auto_522267 ) ) ( not ( = ?auto_522263 ?auto_522264 ) ) ( not ( = ?auto_522263 ?auto_522265 ) ) ( not ( = ?auto_522263 ?auto_522266 ) ) ( not ( = ?auto_522263 ?auto_522267 ) ) ( not ( = ?auto_522264 ?auto_522265 ) ) ( not ( = ?auto_522264 ?auto_522266 ) ) ( not ( = ?auto_522264 ?auto_522267 ) ) ( not ( = ?auto_522265 ?auto_522266 ) ) ( not ( = ?auto_522265 ?auto_522267 ) ) ( not ( = ?auto_522266 ?auto_522267 ) ) ( ON ?auto_522265 ?auto_522266 ) ( ON ?auto_522264 ?auto_522265 ) ( ON ?auto_522263 ?auto_522264 ) ( ON ?auto_522262 ?auto_522263 ) ( ON ?auto_522261 ?auto_522262 ) ( ON ?auto_522260 ?auto_522261 ) ( ON ?auto_522259 ?auto_522260 ) ( CLEAR ?auto_522259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_522259 )
      ( MAKE-8PILE ?auto_522259 ?auto_522260 ?auto_522261 ?auto_522262 ?auto_522263 ?auto_522264 ?auto_522265 ?auto_522266 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_522294 - BLOCK
      ?auto_522295 - BLOCK
      ?auto_522296 - BLOCK
      ?auto_522297 - BLOCK
      ?auto_522298 - BLOCK
      ?auto_522299 - BLOCK
      ?auto_522300 - BLOCK
      ?auto_522301 - BLOCK
      ?auto_522302 - BLOCK
    )
    :vars
    (
      ?auto_522303 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_522301 ) ( ON ?auto_522302 ?auto_522303 ) ( CLEAR ?auto_522302 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_522294 ) ( ON ?auto_522295 ?auto_522294 ) ( ON ?auto_522296 ?auto_522295 ) ( ON ?auto_522297 ?auto_522296 ) ( ON ?auto_522298 ?auto_522297 ) ( ON ?auto_522299 ?auto_522298 ) ( ON ?auto_522300 ?auto_522299 ) ( ON ?auto_522301 ?auto_522300 ) ( not ( = ?auto_522294 ?auto_522295 ) ) ( not ( = ?auto_522294 ?auto_522296 ) ) ( not ( = ?auto_522294 ?auto_522297 ) ) ( not ( = ?auto_522294 ?auto_522298 ) ) ( not ( = ?auto_522294 ?auto_522299 ) ) ( not ( = ?auto_522294 ?auto_522300 ) ) ( not ( = ?auto_522294 ?auto_522301 ) ) ( not ( = ?auto_522294 ?auto_522302 ) ) ( not ( = ?auto_522294 ?auto_522303 ) ) ( not ( = ?auto_522295 ?auto_522296 ) ) ( not ( = ?auto_522295 ?auto_522297 ) ) ( not ( = ?auto_522295 ?auto_522298 ) ) ( not ( = ?auto_522295 ?auto_522299 ) ) ( not ( = ?auto_522295 ?auto_522300 ) ) ( not ( = ?auto_522295 ?auto_522301 ) ) ( not ( = ?auto_522295 ?auto_522302 ) ) ( not ( = ?auto_522295 ?auto_522303 ) ) ( not ( = ?auto_522296 ?auto_522297 ) ) ( not ( = ?auto_522296 ?auto_522298 ) ) ( not ( = ?auto_522296 ?auto_522299 ) ) ( not ( = ?auto_522296 ?auto_522300 ) ) ( not ( = ?auto_522296 ?auto_522301 ) ) ( not ( = ?auto_522296 ?auto_522302 ) ) ( not ( = ?auto_522296 ?auto_522303 ) ) ( not ( = ?auto_522297 ?auto_522298 ) ) ( not ( = ?auto_522297 ?auto_522299 ) ) ( not ( = ?auto_522297 ?auto_522300 ) ) ( not ( = ?auto_522297 ?auto_522301 ) ) ( not ( = ?auto_522297 ?auto_522302 ) ) ( not ( = ?auto_522297 ?auto_522303 ) ) ( not ( = ?auto_522298 ?auto_522299 ) ) ( not ( = ?auto_522298 ?auto_522300 ) ) ( not ( = ?auto_522298 ?auto_522301 ) ) ( not ( = ?auto_522298 ?auto_522302 ) ) ( not ( = ?auto_522298 ?auto_522303 ) ) ( not ( = ?auto_522299 ?auto_522300 ) ) ( not ( = ?auto_522299 ?auto_522301 ) ) ( not ( = ?auto_522299 ?auto_522302 ) ) ( not ( = ?auto_522299 ?auto_522303 ) ) ( not ( = ?auto_522300 ?auto_522301 ) ) ( not ( = ?auto_522300 ?auto_522302 ) ) ( not ( = ?auto_522300 ?auto_522303 ) ) ( not ( = ?auto_522301 ?auto_522302 ) ) ( not ( = ?auto_522301 ?auto_522303 ) ) ( not ( = ?auto_522302 ?auto_522303 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_522302 ?auto_522303 )
      ( !STACK ?auto_522302 ?auto_522301 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_522332 - BLOCK
      ?auto_522333 - BLOCK
      ?auto_522334 - BLOCK
      ?auto_522335 - BLOCK
      ?auto_522336 - BLOCK
      ?auto_522337 - BLOCK
      ?auto_522338 - BLOCK
      ?auto_522339 - BLOCK
      ?auto_522340 - BLOCK
    )
    :vars
    (
      ?auto_522341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522340 ?auto_522341 ) ( ON-TABLE ?auto_522332 ) ( ON ?auto_522333 ?auto_522332 ) ( ON ?auto_522334 ?auto_522333 ) ( ON ?auto_522335 ?auto_522334 ) ( ON ?auto_522336 ?auto_522335 ) ( ON ?auto_522337 ?auto_522336 ) ( ON ?auto_522338 ?auto_522337 ) ( not ( = ?auto_522332 ?auto_522333 ) ) ( not ( = ?auto_522332 ?auto_522334 ) ) ( not ( = ?auto_522332 ?auto_522335 ) ) ( not ( = ?auto_522332 ?auto_522336 ) ) ( not ( = ?auto_522332 ?auto_522337 ) ) ( not ( = ?auto_522332 ?auto_522338 ) ) ( not ( = ?auto_522332 ?auto_522339 ) ) ( not ( = ?auto_522332 ?auto_522340 ) ) ( not ( = ?auto_522332 ?auto_522341 ) ) ( not ( = ?auto_522333 ?auto_522334 ) ) ( not ( = ?auto_522333 ?auto_522335 ) ) ( not ( = ?auto_522333 ?auto_522336 ) ) ( not ( = ?auto_522333 ?auto_522337 ) ) ( not ( = ?auto_522333 ?auto_522338 ) ) ( not ( = ?auto_522333 ?auto_522339 ) ) ( not ( = ?auto_522333 ?auto_522340 ) ) ( not ( = ?auto_522333 ?auto_522341 ) ) ( not ( = ?auto_522334 ?auto_522335 ) ) ( not ( = ?auto_522334 ?auto_522336 ) ) ( not ( = ?auto_522334 ?auto_522337 ) ) ( not ( = ?auto_522334 ?auto_522338 ) ) ( not ( = ?auto_522334 ?auto_522339 ) ) ( not ( = ?auto_522334 ?auto_522340 ) ) ( not ( = ?auto_522334 ?auto_522341 ) ) ( not ( = ?auto_522335 ?auto_522336 ) ) ( not ( = ?auto_522335 ?auto_522337 ) ) ( not ( = ?auto_522335 ?auto_522338 ) ) ( not ( = ?auto_522335 ?auto_522339 ) ) ( not ( = ?auto_522335 ?auto_522340 ) ) ( not ( = ?auto_522335 ?auto_522341 ) ) ( not ( = ?auto_522336 ?auto_522337 ) ) ( not ( = ?auto_522336 ?auto_522338 ) ) ( not ( = ?auto_522336 ?auto_522339 ) ) ( not ( = ?auto_522336 ?auto_522340 ) ) ( not ( = ?auto_522336 ?auto_522341 ) ) ( not ( = ?auto_522337 ?auto_522338 ) ) ( not ( = ?auto_522337 ?auto_522339 ) ) ( not ( = ?auto_522337 ?auto_522340 ) ) ( not ( = ?auto_522337 ?auto_522341 ) ) ( not ( = ?auto_522338 ?auto_522339 ) ) ( not ( = ?auto_522338 ?auto_522340 ) ) ( not ( = ?auto_522338 ?auto_522341 ) ) ( not ( = ?auto_522339 ?auto_522340 ) ) ( not ( = ?auto_522339 ?auto_522341 ) ) ( not ( = ?auto_522340 ?auto_522341 ) ) ( CLEAR ?auto_522338 ) ( ON ?auto_522339 ?auto_522340 ) ( CLEAR ?auto_522339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_522332 ?auto_522333 ?auto_522334 ?auto_522335 ?auto_522336 ?auto_522337 ?auto_522338 ?auto_522339 )
      ( MAKE-9PILE ?auto_522332 ?auto_522333 ?auto_522334 ?auto_522335 ?auto_522336 ?auto_522337 ?auto_522338 ?auto_522339 ?auto_522340 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_522370 - BLOCK
      ?auto_522371 - BLOCK
      ?auto_522372 - BLOCK
      ?auto_522373 - BLOCK
      ?auto_522374 - BLOCK
      ?auto_522375 - BLOCK
      ?auto_522376 - BLOCK
      ?auto_522377 - BLOCK
      ?auto_522378 - BLOCK
    )
    :vars
    (
      ?auto_522379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522378 ?auto_522379 ) ( ON-TABLE ?auto_522370 ) ( ON ?auto_522371 ?auto_522370 ) ( ON ?auto_522372 ?auto_522371 ) ( ON ?auto_522373 ?auto_522372 ) ( ON ?auto_522374 ?auto_522373 ) ( ON ?auto_522375 ?auto_522374 ) ( not ( = ?auto_522370 ?auto_522371 ) ) ( not ( = ?auto_522370 ?auto_522372 ) ) ( not ( = ?auto_522370 ?auto_522373 ) ) ( not ( = ?auto_522370 ?auto_522374 ) ) ( not ( = ?auto_522370 ?auto_522375 ) ) ( not ( = ?auto_522370 ?auto_522376 ) ) ( not ( = ?auto_522370 ?auto_522377 ) ) ( not ( = ?auto_522370 ?auto_522378 ) ) ( not ( = ?auto_522370 ?auto_522379 ) ) ( not ( = ?auto_522371 ?auto_522372 ) ) ( not ( = ?auto_522371 ?auto_522373 ) ) ( not ( = ?auto_522371 ?auto_522374 ) ) ( not ( = ?auto_522371 ?auto_522375 ) ) ( not ( = ?auto_522371 ?auto_522376 ) ) ( not ( = ?auto_522371 ?auto_522377 ) ) ( not ( = ?auto_522371 ?auto_522378 ) ) ( not ( = ?auto_522371 ?auto_522379 ) ) ( not ( = ?auto_522372 ?auto_522373 ) ) ( not ( = ?auto_522372 ?auto_522374 ) ) ( not ( = ?auto_522372 ?auto_522375 ) ) ( not ( = ?auto_522372 ?auto_522376 ) ) ( not ( = ?auto_522372 ?auto_522377 ) ) ( not ( = ?auto_522372 ?auto_522378 ) ) ( not ( = ?auto_522372 ?auto_522379 ) ) ( not ( = ?auto_522373 ?auto_522374 ) ) ( not ( = ?auto_522373 ?auto_522375 ) ) ( not ( = ?auto_522373 ?auto_522376 ) ) ( not ( = ?auto_522373 ?auto_522377 ) ) ( not ( = ?auto_522373 ?auto_522378 ) ) ( not ( = ?auto_522373 ?auto_522379 ) ) ( not ( = ?auto_522374 ?auto_522375 ) ) ( not ( = ?auto_522374 ?auto_522376 ) ) ( not ( = ?auto_522374 ?auto_522377 ) ) ( not ( = ?auto_522374 ?auto_522378 ) ) ( not ( = ?auto_522374 ?auto_522379 ) ) ( not ( = ?auto_522375 ?auto_522376 ) ) ( not ( = ?auto_522375 ?auto_522377 ) ) ( not ( = ?auto_522375 ?auto_522378 ) ) ( not ( = ?auto_522375 ?auto_522379 ) ) ( not ( = ?auto_522376 ?auto_522377 ) ) ( not ( = ?auto_522376 ?auto_522378 ) ) ( not ( = ?auto_522376 ?auto_522379 ) ) ( not ( = ?auto_522377 ?auto_522378 ) ) ( not ( = ?auto_522377 ?auto_522379 ) ) ( not ( = ?auto_522378 ?auto_522379 ) ) ( ON ?auto_522377 ?auto_522378 ) ( CLEAR ?auto_522375 ) ( ON ?auto_522376 ?auto_522377 ) ( CLEAR ?auto_522376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_522370 ?auto_522371 ?auto_522372 ?auto_522373 ?auto_522374 ?auto_522375 ?auto_522376 )
      ( MAKE-9PILE ?auto_522370 ?auto_522371 ?auto_522372 ?auto_522373 ?auto_522374 ?auto_522375 ?auto_522376 ?auto_522377 ?auto_522378 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_522408 - BLOCK
      ?auto_522409 - BLOCK
      ?auto_522410 - BLOCK
      ?auto_522411 - BLOCK
      ?auto_522412 - BLOCK
      ?auto_522413 - BLOCK
      ?auto_522414 - BLOCK
      ?auto_522415 - BLOCK
      ?auto_522416 - BLOCK
    )
    :vars
    (
      ?auto_522417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522416 ?auto_522417 ) ( ON-TABLE ?auto_522408 ) ( ON ?auto_522409 ?auto_522408 ) ( ON ?auto_522410 ?auto_522409 ) ( ON ?auto_522411 ?auto_522410 ) ( ON ?auto_522412 ?auto_522411 ) ( not ( = ?auto_522408 ?auto_522409 ) ) ( not ( = ?auto_522408 ?auto_522410 ) ) ( not ( = ?auto_522408 ?auto_522411 ) ) ( not ( = ?auto_522408 ?auto_522412 ) ) ( not ( = ?auto_522408 ?auto_522413 ) ) ( not ( = ?auto_522408 ?auto_522414 ) ) ( not ( = ?auto_522408 ?auto_522415 ) ) ( not ( = ?auto_522408 ?auto_522416 ) ) ( not ( = ?auto_522408 ?auto_522417 ) ) ( not ( = ?auto_522409 ?auto_522410 ) ) ( not ( = ?auto_522409 ?auto_522411 ) ) ( not ( = ?auto_522409 ?auto_522412 ) ) ( not ( = ?auto_522409 ?auto_522413 ) ) ( not ( = ?auto_522409 ?auto_522414 ) ) ( not ( = ?auto_522409 ?auto_522415 ) ) ( not ( = ?auto_522409 ?auto_522416 ) ) ( not ( = ?auto_522409 ?auto_522417 ) ) ( not ( = ?auto_522410 ?auto_522411 ) ) ( not ( = ?auto_522410 ?auto_522412 ) ) ( not ( = ?auto_522410 ?auto_522413 ) ) ( not ( = ?auto_522410 ?auto_522414 ) ) ( not ( = ?auto_522410 ?auto_522415 ) ) ( not ( = ?auto_522410 ?auto_522416 ) ) ( not ( = ?auto_522410 ?auto_522417 ) ) ( not ( = ?auto_522411 ?auto_522412 ) ) ( not ( = ?auto_522411 ?auto_522413 ) ) ( not ( = ?auto_522411 ?auto_522414 ) ) ( not ( = ?auto_522411 ?auto_522415 ) ) ( not ( = ?auto_522411 ?auto_522416 ) ) ( not ( = ?auto_522411 ?auto_522417 ) ) ( not ( = ?auto_522412 ?auto_522413 ) ) ( not ( = ?auto_522412 ?auto_522414 ) ) ( not ( = ?auto_522412 ?auto_522415 ) ) ( not ( = ?auto_522412 ?auto_522416 ) ) ( not ( = ?auto_522412 ?auto_522417 ) ) ( not ( = ?auto_522413 ?auto_522414 ) ) ( not ( = ?auto_522413 ?auto_522415 ) ) ( not ( = ?auto_522413 ?auto_522416 ) ) ( not ( = ?auto_522413 ?auto_522417 ) ) ( not ( = ?auto_522414 ?auto_522415 ) ) ( not ( = ?auto_522414 ?auto_522416 ) ) ( not ( = ?auto_522414 ?auto_522417 ) ) ( not ( = ?auto_522415 ?auto_522416 ) ) ( not ( = ?auto_522415 ?auto_522417 ) ) ( not ( = ?auto_522416 ?auto_522417 ) ) ( ON ?auto_522415 ?auto_522416 ) ( ON ?auto_522414 ?auto_522415 ) ( CLEAR ?auto_522412 ) ( ON ?auto_522413 ?auto_522414 ) ( CLEAR ?auto_522413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_522408 ?auto_522409 ?auto_522410 ?auto_522411 ?auto_522412 ?auto_522413 )
      ( MAKE-9PILE ?auto_522408 ?auto_522409 ?auto_522410 ?auto_522411 ?auto_522412 ?auto_522413 ?auto_522414 ?auto_522415 ?auto_522416 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_522446 - BLOCK
      ?auto_522447 - BLOCK
      ?auto_522448 - BLOCK
      ?auto_522449 - BLOCK
      ?auto_522450 - BLOCK
      ?auto_522451 - BLOCK
      ?auto_522452 - BLOCK
      ?auto_522453 - BLOCK
      ?auto_522454 - BLOCK
    )
    :vars
    (
      ?auto_522455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522454 ?auto_522455 ) ( ON-TABLE ?auto_522446 ) ( ON ?auto_522447 ?auto_522446 ) ( ON ?auto_522448 ?auto_522447 ) ( ON ?auto_522449 ?auto_522448 ) ( not ( = ?auto_522446 ?auto_522447 ) ) ( not ( = ?auto_522446 ?auto_522448 ) ) ( not ( = ?auto_522446 ?auto_522449 ) ) ( not ( = ?auto_522446 ?auto_522450 ) ) ( not ( = ?auto_522446 ?auto_522451 ) ) ( not ( = ?auto_522446 ?auto_522452 ) ) ( not ( = ?auto_522446 ?auto_522453 ) ) ( not ( = ?auto_522446 ?auto_522454 ) ) ( not ( = ?auto_522446 ?auto_522455 ) ) ( not ( = ?auto_522447 ?auto_522448 ) ) ( not ( = ?auto_522447 ?auto_522449 ) ) ( not ( = ?auto_522447 ?auto_522450 ) ) ( not ( = ?auto_522447 ?auto_522451 ) ) ( not ( = ?auto_522447 ?auto_522452 ) ) ( not ( = ?auto_522447 ?auto_522453 ) ) ( not ( = ?auto_522447 ?auto_522454 ) ) ( not ( = ?auto_522447 ?auto_522455 ) ) ( not ( = ?auto_522448 ?auto_522449 ) ) ( not ( = ?auto_522448 ?auto_522450 ) ) ( not ( = ?auto_522448 ?auto_522451 ) ) ( not ( = ?auto_522448 ?auto_522452 ) ) ( not ( = ?auto_522448 ?auto_522453 ) ) ( not ( = ?auto_522448 ?auto_522454 ) ) ( not ( = ?auto_522448 ?auto_522455 ) ) ( not ( = ?auto_522449 ?auto_522450 ) ) ( not ( = ?auto_522449 ?auto_522451 ) ) ( not ( = ?auto_522449 ?auto_522452 ) ) ( not ( = ?auto_522449 ?auto_522453 ) ) ( not ( = ?auto_522449 ?auto_522454 ) ) ( not ( = ?auto_522449 ?auto_522455 ) ) ( not ( = ?auto_522450 ?auto_522451 ) ) ( not ( = ?auto_522450 ?auto_522452 ) ) ( not ( = ?auto_522450 ?auto_522453 ) ) ( not ( = ?auto_522450 ?auto_522454 ) ) ( not ( = ?auto_522450 ?auto_522455 ) ) ( not ( = ?auto_522451 ?auto_522452 ) ) ( not ( = ?auto_522451 ?auto_522453 ) ) ( not ( = ?auto_522451 ?auto_522454 ) ) ( not ( = ?auto_522451 ?auto_522455 ) ) ( not ( = ?auto_522452 ?auto_522453 ) ) ( not ( = ?auto_522452 ?auto_522454 ) ) ( not ( = ?auto_522452 ?auto_522455 ) ) ( not ( = ?auto_522453 ?auto_522454 ) ) ( not ( = ?auto_522453 ?auto_522455 ) ) ( not ( = ?auto_522454 ?auto_522455 ) ) ( ON ?auto_522453 ?auto_522454 ) ( ON ?auto_522452 ?auto_522453 ) ( ON ?auto_522451 ?auto_522452 ) ( CLEAR ?auto_522449 ) ( ON ?auto_522450 ?auto_522451 ) ( CLEAR ?auto_522450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_522446 ?auto_522447 ?auto_522448 ?auto_522449 ?auto_522450 )
      ( MAKE-9PILE ?auto_522446 ?auto_522447 ?auto_522448 ?auto_522449 ?auto_522450 ?auto_522451 ?auto_522452 ?auto_522453 ?auto_522454 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_522484 - BLOCK
      ?auto_522485 - BLOCK
      ?auto_522486 - BLOCK
      ?auto_522487 - BLOCK
      ?auto_522488 - BLOCK
      ?auto_522489 - BLOCK
      ?auto_522490 - BLOCK
      ?auto_522491 - BLOCK
      ?auto_522492 - BLOCK
    )
    :vars
    (
      ?auto_522493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522492 ?auto_522493 ) ( ON-TABLE ?auto_522484 ) ( ON ?auto_522485 ?auto_522484 ) ( ON ?auto_522486 ?auto_522485 ) ( not ( = ?auto_522484 ?auto_522485 ) ) ( not ( = ?auto_522484 ?auto_522486 ) ) ( not ( = ?auto_522484 ?auto_522487 ) ) ( not ( = ?auto_522484 ?auto_522488 ) ) ( not ( = ?auto_522484 ?auto_522489 ) ) ( not ( = ?auto_522484 ?auto_522490 ) ) ( not ( = ?auto_522484 ?auto_522491 ) ) ( not ( = ?auto_522484 ?auto_522492 ) ) ( not ( = ?auto_522484 ?auto_522493 ) ) ( not ( = ?auto_522485 ?auto_522486 ) ) ( not ( = ?auto_522485 ?auto_522487 ) ) ( not ( = ?auto_522485 ?auto_522488 ) ) ( not ( = ?auto_522485 ?auto_522489 ) ) ( not ( = ?auto_522485 ?auto_522490 ) ) ( not ( = ?auto_522485 ?auto_522491 ) ) ( not ( = ?auto_522485 ?auto_522492 ) ) ( not ( = ?auto_522485 ?auto_522493 ) ) ( not ( = ?auto_522486 ?auto_522487 ) ) ( not ( = ?auto_522486 ?auto_522488 ) ) ( not ( = ?auto_522486 ?auto_522489 ) ) ( not ( = ?auto_522486 ?auto_522490 ) ) ( not ( = ?auto_522486 ?auto_522491 ) ) ( not ( = ?auto_522486 ?auto_522492 ) ) ( not ( = ?auto_522486 ?auto_522493 ) ) ( not ( = ?auto_522487 ?auto_522488 ) ) ( not ( = ?auto_522487 ?auto_522489 ) ) ( not ( = ?auto_522487 ?auto_522490 ) ) ( not ( = ?auto_522487 ?auto_522491 ) ) ( not ( = ?auto_522487 ?auto_522492 ) ) ( not ( = ?auto_522487 ?auto_522493 ) ) ( not ( = ?auto_522488 ?auto_522489 ) ) ( not ( = ?auto_522488 ?auto_522490 ) ) ( not ( = ?auto_522488 ?auto_522491 ) ) ( not ( = ?auto_522488 ?auto_522492 ) ) ( not ( = ?auto_522488 ?auto_522493 ) ) ( not ( = ?auto_522489 ?auto_522490 ) ) ( not ( = ?auto_522489 ?auto_522491 ) ) ( not ( = ?auto_522489 ?auto_522492 ) ) ( not ( = ?auto_522489 ?auto_522493 ) ) ( not ( = ?auto_522490 ?auto_522491 ) ) ( not ( = ?auto_522490 ?auto_522492 ) ) ( not ( = ?auto_522490 ?auto_522493 ) ) ( not ( = ?auto_522491 ?auto_522492 ) ) ( not ( = ?auto_522491 ?auto_522493 ) ) ( not ( = ?auto_522492 ?auto_522493 ) ) ( ON ?auto_522491 ?auto_522492 ) ( ON ?auto_522490 ?auto_522491 ) ( ON ?auto_522489 ?auto_522490 ) ( ON ?auto_522488 ?auto_522489 ) ( CLEAR ?auto_522486 ) ( ON ?auto_522487 ?auto_522488 ) ( CLEAR ?auto_522487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_522484 ?auto_522485 ?auto_522486 ?auto_522487 )
      ( MAKE-9PILE ?auto_522484 ?auto_522485 ?auto_522486 ?auto_522487 ?auto_522488 ?auto_522489 ?auto_522490 ?auto_522491 ?auto_522492 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_522522 - BLOCK
      ?auto_522523 - BLOCK
      ?auto_522524 - BLOCK
      ?auto_522525 - BLOCK
      ?auto_522526 - BLOCK
      ?auto_522527 - BLOCK
      ?auto_522528 - BLOCK
      ?auto_522529 - BLOCK
      ?auto_522530 - BLOCK
    )
    :vars
    (
      ?auto_522531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522530 ?auto_522531 ) ( ON-TABLE ?auto_522522 ) ( ON ?auto_522523 ?auto_522522 ) ( not ( = ?auto_522522 ?auto_522523 ) ) ( not ( = ?auto_522522 ?auto_522524 ) ) ( not ( = ?auto_522522 ?auto_522525 ) ) ( not ( = ?auto_522522 ?auto_522526 ) ) ( not ( = ?auto_522522 ?auto_522527 ) ) ( not ( = ?auto_522522 ?auto_522528 ) ) ( not ( = ?auto_522522 ?auto_522529 ) ) ( not ( = ?auto_522522 ?auto_522530 ) ) ( not ( = ?auto_522522 ?auto_522531 ) ) ( not ( = ?auto_522523 ?auto_522524 ) ) ( not ( = ?auto_522523 ?auto_522525 ) ) ( not ( = ?auto_522523 ?auto_522526 ) ) ( not ( = ?auto_522523 ?auto_522527 ) ) ( not ( = ?auto_522523 ?auto_522528 ) ) ( not ( = ?auto_522523 ?auto_522529 ) ) ( not ( = ?auto_522523 ?auto_522530 ) ) ( not ( = ?auto_522523 ?auto_522531 ) ) ( not ( = ?auto_522524 ?auto_522525 ) ) ( not ( = ?auto_522524 ?auto_522526 ) ) ( not ( = ?auto_522524 ?auto_522527 ) ) ( not ( = ?auto_522524 ?auto_522528 ) ) ( not ( = ?auto_522524 ?auto_522529 ) ) ( not ( = ?auto_522524 ?auto_522530 ) ) ( not ( = ?auto_522524 ?auto_522531 ) ) ( not ( = ?auto_522525 ?auto_522526 ) ) ( not ( = ?auto_522525 ?auto_522527 ) ) ( not ( = ?auto_522525 ?auto_522528 ) ) ( not ( = ?auto_522525 ?auto_522529 ) ) ( not ( = ?auto_522525 ?auto_522530 ) ) ( not ( = ?auto_522525 ?auto_522531 ) ) ( not ( = ?auto_522526 ?auto_522527 ) ) ( not ( = ?auto_522526 ?auto_522528 ) ) ( not ( = ?auto_522526 ?auto_522529 ) ) ( not ( = ?auto_522526 ?auto_522530 ) ) ( not ( = ?auto_522526 ?auto_522531 ) ) ( not ( = ?auto_522527 ?auto_522528 ) ) ( not ( = ?auto_522527 ?auto_522529 ) ) ( not ( = ?auto_522527 ?auto_522530 ) ) ( not ( = ?auto_522527 ?auto_522531 ) ) ( not ( = ?auto_522528 ?auto_522529 ) ) ( not ( = ?auto_522528 ?auto_522530 ) ) ( not ( = ?auto_522528 ?auto_522531 ) ) ( not ( = ?auto_522529 ?auto_522530 ) ) ( not ( = ?auto_522529 ?auto_522531 ) ) ( not ( = ?auto_522530 ?auto_522531 ) ) ( ON ?auto_522529 ?auto_522530 ) ( ON ?auto_522528 ?auto_522529 ) ( ON ?auto_522527 ?auto_522528 ) ( ON ?auto_522526 ?auto_522527 ) ( ON ?auto_522525 ?auto_522526 ) ( CLEAR ?auto_522523 ) ( ON ?auto_522524 ?auto_522525 ) ( CLEAR ?auto_522524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_522522 ?auto_522523 ?auto_522524 )
      ( MAKE-9PILE ?auto_522522 ?auto_522523 ?auto_522524 ?auto_522525 ?auto_522526 ?auto_522527 ?auto_522528 ?auto_522529 ?auto_522530 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_522560 - BLOCK
      ?auto_522561 - BLOCK
      ?auto_522562 - BLOCK
      ?auto_522563 - BLOCK
      ?auto_522564 - BLOCK
      ?auto_522565 - BLOCK
      ?auto_522566 - BLOCK
      ?auto_522567 - BLOCK
      ?auto_522568 - BLOCK
    )
    :vars
    (
      ?auto_522569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522568 ?auto_522569 ) ( ON-TABLE ?auto_522560 ) ( not ( = ?auto_522560 ?auto_522561 ) ) ( not ( = ?auto_522560 ?auto_522562 ) ) ( not ( = ?auto_522560 ?auto_522563 ) ) ( not ( = ?auto_522560 ?auto_522564 ) ) ( not ( = ?auto_522560 ?auto_522565 ) ) ( not ( = ?auto_522560 ?auto_522566 ) ) ( not ( = ?auto_522560 ?auto_522567 ) ) ( not ( = ?auto_522560 ?auto_522568 ) ) ( not ( = ?auto_522560 ?auto_522569 ) ) ( not ( = ?auto_522561 ?auto_522562 ) ) ( not ( = ?auto_522561 ?auto_522563 ) ) ( not ( = ?auto_522561 ?auto_522564 ) ) ( not ( = ?auto_522561 ?auto_522565 ) ) ( not ( = ?auto_522561 ?auto_522566 ) ) ( not ( = ?auto_522561 ?auto_522567 ) ) ( not ( = ?auto_522561 ?auto_522568 ) ) ( not ( = ?auto_522561 ?auto_522569 ) ) ( not ( = ?auto_522562 ?auto_522563 ) ) ( not ( = ?auto_522562 ?auto_522564 ) ) ( not ( = ?auto_522562 ?auto_522565 ) ) ( not ( = ?auto_522562 ?auto_522566 ) ) ( not ( = ?auto_522562 ?auto_522567 ) ) ( not ( = ?auto_522562 ?auto_522568 ) ) ( not ( = ?auto_522562 ?auto_522569 ) ) ( not ( = ?auto_522563 ?auto_522564 ) ) ( not ( = ?auto_522563 ?auto_522565 ) ) ( not ( = ?auto_522563 ?auto_522566 ) ) ( not ( = ?auto_522563 ?auto_522567 ) ) ( not ( = ?auto_522563 ?auto_522568 ) ) ( not ( = ?auto_522563 ?auto_522569 ) ) ( not ( = ?auto_522564 ?auto_522565 ) ) ( not ( = ?auto_522564 ?auto_522566 ) ) ( not ( = ?auto_522564 ?auto_522567 ) ) ( not ( = ?auto_522564 ?auto_522568 ) ) ( not ( = ?auto_522564 ?auto_522569 ) ) ( not ( = ?auto_522565 ?auto_522566 ) ) ( not ( = ?auto_522565 ?auto_522567 ) ) ( not ( = ?auto_522565 ?auto_522568 ) ) ( not ( = ?auto_522565 ?auto_522569 ) ) ( not ( = ?auto_522566 ?auto_522567 ) ) ( not ( = ?auto_522566 ?auto_522568 ) ) ( not ( = ?auto_522566 ?auto_522569 ) ) ( not ( = ?auto_522567 ?auto_522568 ) ) ( not ( = ?auto_522567 ?auto_522569 ) ) ( not ( = ?auto_522568 ?auto_522569 ) ) ( ON ?auto_522567 ?auto_522568 ) ( ON ?auto_522566 ?auto_522567 ) ( ON ?auto_522565 ?auto_522566 ) ( ON ?auto_522564 ?auto_522565 ) ( ON ?auto_522563 ?auto_522564 ) ( ON ?auto_522562 ?auto_522563 ) ( CLEAR ?auto_522560 ) ( ON ?auto_522561 ?auto_522562 ) ( CLEAR ?auto_522561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_522560 ?auto_522561 )
      ( MAKE-9PILE ?auto_522560 ?auto_522561 ?auto_522562 ?auto_522563 ?auto_522564 ?auto_522565 ?auto_522566 ?auto_522567 ?auto_522568 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_522598 - BLOCK
      ?auto_522599 - BLOCK
      ?auto_522600 - BLOCK
      ?auto_522601 - BLOCK
      ?auto_522602 - BLOCK
      ?auto_522603 - BLOCK
      ?auto_522604 - BLOCK
      ?auto_522605 - BLOCK
      ?auto_522606 - BLOCK
    )
    :vars
    (
      ?auto_522607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522606 ?auto_522607 ) ( not ( = ?auto_522598 ?auto_522599 ) ) ( not ( = ?auto_522598 ?auto_522600 ) ) ( not ( = ?auto_522598 ?auto_522601 ) ) ( not ( = ?auto_522598 ?auto_522602 ) ) ( not ( = ?auto_522598 ?auto_522603 ) ) ( not ( = ?auto_522598 ?auto_522604 ) ) ( not ( = ?auto_522598 ?auto_522605 ) ) ( not ( = ?auto_522598 ?auto_522606 ) ) ( not ( = ?auto_522598 ?auto_522607 ) ) ( not ( = ?auto_522599 ?auto_522600 ) ) ( not ( = ?auto_522599 ?auto_522601 ) ) ( not ( = ?auto_522599 ?auto_522602 ) ) ( not ( = ?auto_522599 ?auto_522603 ) ) ( not ( = ?auto_522599 ?auto_522604 ) ) ( not ( = ?auto_522599 ?auto_522605 ) ) ( not ( = ?auto_522599 ?auto_522606 ) ) ( not ( = ?auto_522599 ?auto_522607 ) ) ( not ( = ?auto_522600 ?auto_522601 ) ) ( not ( = ?auto_522600 ?auto_522602 ) ) ( not ( = ?auto_522600 ?auto_522603 ) ) ( not ( = ?auto_522600 ?auto_522604 ) ) ( not ( = ?auto_522600 ?auto_522605 ) ) ( not ( = ?auto_522600 ?auto_522606 ) ) ( not ( = ?auto_522600 ?auto_522607 ) ) ( not ( = ?auto_522601 ?auto_522602 ) ) ( not ( = ?auto_522601 ?auto_522603 ) ) ( not ( = ?auto_522601 ?auto_522604 ) ) ( not ( = ?auto_522601 ?auto_522605 ) ) ( not ( = ?auto_522601 ?auto_522606 ) ) ( not ( = ?auto_522601 ?auto_522607 ) ) ( not ( = ?auto_522602 ?auto_522603 ) ) ( not ( = ?auto_522602 ?auto_522604 ) ) ( not ( = ?auto_522602 ?auto_522605 ) ) ( not ( = ?auto_522602 ?auto_522606 ) ) ( not ( = ?auto_522602 ?auto_522607 ) ) ( not ( = ?auto_522603 ?auto_522604 ) ) ( not ( = ?auto_522603 ?auto_522605 ) ) ( not ( = ?auto_522603 ?auto_522606 ) ) ( not ( = ?auto_522603 ?auto_522607 ) ) ( not ( = ?auto_522604 ?auto_522605 ) ) ( not ( = ?auto_522604 ?auto_522606 ) ) ( not ( = ?auto_522604 ?auto_522607 ) ) ( not ( = ?auto_522605 ?auto_522606 ) ) ( not ( = ?auto_522605 ?auto_522607 ) ) ( not ( = ?auto_522606 ?auto_522607 ) ) ( ON ?auto_522605 ?auto_522606 ) ( ON ?auto_522604 ?auto_522605 ) ( ON ?auto_522603 ?auto_522604 ) ( ON ?auto_522602 ?auto_522603 ) ( ON ?auto_522601 ?auto_522602 ) ( ON ?auto_522600 ?auto_522601 ) ( ON ?auto_522599 ?auto_522600 ) ( ON ?auto_522598 ?auto_522599 ) ( CLEAR ?auto_522598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_522598 )
      ( MAKE-9PILE ?auto_522598 ?auto_522599 ?auto_522600 ?auto_522601 ?auto_522602 ?auto_522603 ?auto_522604 ?auto_522605 ?auto_522606 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_522637 - BLOCK
      ?auto_522638 - BLOCK
      ?auto_522639 - BLOCK
      ?auto_522640 - BLOCK
      ?auto_522641 - BLOCK
      ?auto_522642 - BLOCK
      ?auto_522643 - BLOCK
      ?auto_522644 - BLOCK
      ?auto_522645 - BLOCK
      ?auto_522646 - BLOCK
    )
    :vars
    (
      ?auto_522647 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_522645 ) ( ON ?auto_522646 ?auto_522647 ) ( CLEAR ?auto_522646 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_522637 ) ( ON ?auto_522638 ?auto_522637 ) ( ON ?auto_522639 ?auto_522638 ) ( ON ?auto_522640 ?auto_522639 ) ( ON ?auto_522641 ?auto_522640 ) ( ON ?auto_522642 ?auto_522641 ) ( ON ?auto_522643 ?auto_522642 ) ( ON ?auto_522644 ?auto_522643 ) ( ON ?auto_522645 ?auto_522644 ) ( not ( = ?auto_522637 ?auto_522638 ) ) ( not ( = ?auto_522637 ?auto_522639 ) ) ( not ( = ?auto_522637 ?auto_522640 ) ) ( not ( = ?auto_522637 ?auto_522641 ) ) ( not ( = ?auto_522637 ?auto_522642 ) ) ( not ( = ?auto_522637 ?auto_522643 ) ) ( not ( = ?auto_522637 ?auto_522644 ) ) ( not ( = ?auto_522637 ?auto_522645 ) ) ( not ( = ?auto_522637 ?auto_522646 ) ) ( not ( = ?auto_522637 ?auto_522647 ) ) ( not ( = ?auto_522638 ?auto_522639 ) ) ( not ( = ?auto_522638 ?auto_522640 ) ) ( not ( = ?auto_522638 ?auto_522641 ) ) ( not ( = ?auto_522638 ?auto_522642 ) ) ( not ( = ?auto_522638 ?auto_522643 ) ) ( not ( = ?auto_522638 ?auto_522644 ) ) ( not ( = ?auto_522638 ?auto_522645 ) ) ( not ( = ?auto_522638 ?auto_522646 ) ) ( not ( = ?auto_522638 ?auto_522647 ) ) ( not ( = ?auto_522639 ?auto_522640 ) ) ( not ( = ?auto_522639 ?auto_522641 ) ) ( not ( = ?auto_522639 ?auto_522642 ) ) ( not ( = ?auto_522639 ?auto_522643 ) ) ( not ( = ?auto_522639 ?auto_522644 ) ) ( not ( = ?auto_522639 ?auto_522645 ) ) ( not ( = ?auto_522639 ?auto_522646 ) ) ( not ( = ?auto_522639 ?auto_522647 ) ) ( not ( = ?auto_522640 ?auto_522641 ) ) ( not ( = ?auto_522640 ?auto_522642 ) ) ( not ( = ?auto_522640 ?auto_522643 ) ) ( not ( = ?auto_522640 ?auto_522644 ) ) ( not ( = ?auto_522640 ?auto_522645 ) ) ( not ( = ?auto_522640 ?auto_522646 ) ) ( not ( = ?auto_522640 ?auto_522647 ) ) ( not ( = ?auto_522641 ?auto_522642 ) ) ( not ( = ?auto_522641 ?auto_522643 ) ) ( not ( = ?auto_522641 ?auto_522644 ) ) ( not ( = ?auto_522641 ?auto_522645 ) ) ( not ( = ?auto_522641 ?auto_522646 ) ) ( not ( = ?auto_522641 ?auto_522647 ) ) ( not ( = ?auto_522642 ?auto_522643 ) ) ( not ( = ?auto_522642 ?auto_522644 ) ) ( not ( = ?auto_522642 ?auto_522645 ) ) ( not ( = ?auto_522642 ?auto_522646 ) ) ( not ( = ?auto_522642 ?auto_522647 ) ) ( not ( = ?auto_522643 ?auto_522644 ) ) ( not ( = ?auto_522643 ?auto_522645 ) ) ( not ( = ?auto_522643 ?auto_522646 ) ) ( not ( = ?auto_522643 ?auto_522647 ) ) ( not ( = ?auto_522644 ?auto_522645 ) ) ( not ( = ?auto_522644 ?auto_522646 ) ) ( not ( = ?auto_522644 ?auto_522647 ) ) ( not ( = ?auto_522645 ?auto_522646 ) ) ( not ( = ?auto_522645 ?auto_522647 ) ) ( not ( = ?auto_522646 ?auto_522647 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_522646 ?auto_522647 )
      ( !STACK ?auto_522646 ?auto_522645 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_522679 - BLOCK
      ?auto_522680 - BLOCK
      ?auto_522681 - BLOCK
      ?auto_522682 - BLOCK
      ?auto_522683 - BLOCK
      ?auto_522684 - BLOCK
      ?auto_522685 - BLOCK
      ?auto_522686 - BLOCK
      ?auto_522687 - BLOCK
      ?auto_522688 - BLOCK
    )
    :vars
    (
      ?auto_522689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522688 ?auto_522689 ) ( ON-TABLE ?auto_522679 ) ( ON ?auto_522680 ?auto_522679 ) ( ON ?auto_522681 ?auto_522680 ) ( ON ?auto_522682 ?auto_522681 ) ( ON ?auto_522683 ?auto_522682 ) ( ON ?auto_522684 ?auto_522683 ) ( ON ?auto_522685 ?auto_522684 ) ( ON ?auto_522686 ?auto_522685 ) ( not ( = ?auto_522679 ?auto_522680 ) ) ( not ( = ?auto_522679 ?auto_522681 ) ) ( not ( = ?auto_522679 ?auto_522682 ) ) ( not ( = ?auto_522679 ?auto_522683 ) ) ( not ( = ?auto_522679 ?auto_522684 ) ) ( not ( = ?auto_522679 ?auto_522685 ) ) ( not ( = ?auto_522679 ?auto_522686 ) ) ( not ( = ?auto_522679 ?auto_522687 ) ) ( not ( = ?auto_522679 ?auto_522688 ) ) ( not ( = ?auto_522679 ?auto_522689 ) ) ( not ( = ?auto_522680 ?auto_522681 ) ) ( not ( = ?auto_522680 ?auto_522682 ) ) ( not ( = ?auto_522680 ?auto_522683 ) ) ( not ( = ?auto_522680 ?auto_522684 ) ) ( not ( = ?auto_522680 ?auto_522685 ) ) ( not ( = ?auto_522680 ?auto_522686 ) ) ( not ( = ?auto_522680 ?auto_522687 ) ) ( not ( = ?auto_522680 ?auto_522688 ) ) ( not ( = ?auto_522680 ?auto_522689 ) ) ( not ( = ?auto_522681 ?auto_522682 ) ) ( not ( = ?auto_522681 ?auto_522683 ) ) ( not ( = ?auto_522681 ?auto_522684 ) ) ( not ( = ?auto_522681 ?auto_522685 ) ) ( not ( = ?auto_522681 ?auto_522686 ) ) ( not ( = ?auto_522681 ?auto_522687 ) ) ( not ( = ?auto_522681 ?auto_522688 ) ) ( not ( = ?auto_522681 ?auto_522689 ) ) ( not ( = ?auto_522682 ?auto_522683 ) ) ( not ( = ?auto_522682 ?auto_522684 ) ) ( not ( = ?auto_522682 ?auto_522685 ) ) ( not ( = ?auto_522682 ?auto_522686 ) ) ( not ( = ?auto_522682 ?auto_522687 ) ) ( not ( = ?auto_522682 ?auto_522688 ) ) ( not ( = ?auto_522682 ?auto_522689 ) ) ( not ( = ?auto_522683 ?auto_522684 ) ) ( not ( = ?auto_522683 ?auto_522685 ) ) ( not ( = ?auto_522683 ?auto_522686 ) ) ( not ( = ?auto_522683 ?auto_522687 ) ) ( not ( = ?auto_522683 ?auto_522688 ) ) ( not ( = ?auto_522683 ?auto_522689 ) ) ( not ( = ?auto_522684 ?auto_522685 ) ) ( not ( = ?auto_522684 ?auto_522686 ) ) ( not ( = ?auto_522684 ?auto_522687 ) ) ( not ( = ?auto_522684 ?auto_522688 ) ) ( not ( = ?auto_522684 ?auto_522689 ) ) ( not ( = ?auto_522685 ?auto_522686 ) ) ( not ( = ?auto_522685 ?auto_522687 ) ) ( not ( = ?auto_522685 ?auto_522688 ) ) ( not ( = ?auto_522685 ?auto_522689 ) ) ( not ( = ?auto_522686 ?auto_522687 ) ) ( not ( = ?auto_522686 ?auto_522688 ) ) ( not ( = ?auto_522686 ?auto_522689 ) ) ( not ( = ?auto_522687 ?auto_522688 ) ) ( not ( = ?auto_522687 ?auto_522689 ) ) ( not ( = ?auto_522688 ?auto_522689 ) ) ( CLEAR ?auto_522686 ) ( ON ?auto_522687 ?auto_522688 ) ( CLEAR ?auto_522687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_522679 ?auto_522680 ?auto_522681 ?auto_522682 ?auto_522683 ?auto_522684 ?auto_522685 ?auto_522686 ?auto_522687 )
      ( MAKE-10PILE ?auto_522679 ?auto_522680 ?auto_522681 ?auto_522682 ?auto_522683 ?auto_522684 ?auto_522685 ?auto_522686 ?auto_522687 ?auto_522688 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_522721 - BLOCK
      ?auto_522722 - BLOCK
      ?auto_522723 - BLOCK
      ?auto_522724 - BLOCK
      ?auto_522725 - BLOCK
      ?auto_522726 - BLOCK
      ?auto_522727 - BLOCK
      ?auto_522728 - BLOCK
      ?auto_522729 - BLOCK
      ?auto_522730 - BLOCK
    )
    :vars
    (
      ?auto_522731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522730 ?auto_522731 ) ( ON-TABLE ?auto_522721 ) ( ON ?auto_522722 ?auto_522721 ) ( ON ?auto_522723 ?auto_522722 ) ( ON ?auto_522724 ?auto_522723 ) ( ON ?auto_522725 ?auto_522724 ) ( ON ?auto_522726 ?auto_522725 ) ( ON ?auto_522727 ?auto_522726 ) ( not ( = ?auto_522721 ?auto_522722 ) ) ( not ( = ?auto_522721 ?auto_522723 ) ) ( not ( = ?auto_522721 ?auto_522724 ) ) ( not ( = ?auto_522721 ?auto_522725 ) ) ( not ( = ?auto_522721 ?auto_522726 ) ) ( not ( = ?auto_522721 ?auto_522727 ) ) ( not ( = ?auto_522721 ?auto_522728 ) ) ( not ( = ?auto_522721 ?auto_522729 ) ) ( not ( = ?auto_522721 ?auto_522730 ) ) ( not ( = ?auto_522721 ?auto_522731 ) ) ( not ( = ?auto_522722 ?auto_522723 ) ) ( not ( = ?auto_522722 ?auto_522724 ) ) ( not ( = ?auto_522722 ?auto_522725 ) ) ( not ( = ?auto_522722 ?auto_522726 ) ) ( not ( = ?auto_522722 ?auto_522727 ) ) ( not ( = ?auto_522722 ?auto_522728 ) ) ( not ( = ?auto_522722 ?auto_522729 ) ) ( not ( = ?auto_522722 ?auto_522730 ) ) ( not ( = ?auto_522722 ?auto_522731 ) ) ( not ( = ?auto_522723 ?auto_522724 ) ) ( not ( = ?auto_522723 ?auto_522725 ) ) ( not ( = ?auto_522723 ?auto_522726 ) ) ( not ( = ?auto_522723 ?auto_522727 ) ) ( not ( = ?auto_522723 ?auto_522728 ) ) ( not ( = ?auto_522723 ?auto_522729 ) ) ( not ( = ?auto_522723 ?auto_522730 ) ) ( not ( = ?auto_522723 ?auto_522731 ) ) ( not ( = ?auto_522724 ?auto_522725 ) ) ( not ( = ?auto_522724 ?auto_522726 ) ) ( not ( = ?auto_522724 ?auto_522727 ) ) ( not ( = ?auto_522724 ?auto_522728 ) ) ( not ( = ?auto_522724 ?auto_522729 ) ) ( not ( = ?auto_522724 ?auto_522730 ) ) ( not ( = ?auto_522724 ?auto_522731 ) ) ( not ( = ?auto_522725 ?auto_522726 ) ) ( not ( = ?auto_522725 ?auto_522727 ) ) ( not ( = ?auto_522725 ?auto_522728 ) ) ( not ( = ?auto_522725 ?auto_522729 ) ) ( not ( = ?auto_522725 ?auto_522730 ) ) ( not ( = ?auto_522725 ?auto_522731 ) ) ( not ( = ?auto_522726 ?auto_522727 ) ) ( not ( = ?auto_522726 ?auto_522728 ) ) ( not ( = ?auto_522726 ?auto_522729 ) ) ( not ( = ?auto_522726 ?auto_522730 ) ) ( not ( = ?auto_522726 ?auto_522731 ) ) ( not ( = ?auto_522727 ?auto_522728 ) ) ( not ( = ?auto_522727 ?auto_522729 ) ) ( not ( = ?auto_522727 ?auto_522730 ) ) ( not ( = ?auto_522727 ?auto_522731 ) ) ( not ( = ?auto_522728 ?auto_522729 ) ) ( not ( = ?auto_522728 ?auto_522730 ) ) ( not ( = ?auto_522728 ?auto_522731 ) ) ( not ( = ?auto_522729 ?auto_522730 ) ) ( not ( = ?auto_522729 ?auto_522731 ) ) ( not ( = ?auto_522730 ?auto_522731 ) ) ( ON ?auto_522729 ?auto_522730 ) ( CLEAR ?auto_522727 ) ( ON ?auto_522728 ?auto_522729 ) ( CLEAR ?auto_522728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_522721 ?auto_522722 ?auto_522723 ?auto_522724 ?auto_522725 ?auto_522726 ?auto_522727 ?auto_522728 )
      ( MAKE-10PILE ?auto_522721 ?auto_522722 ?auto_522723 ?auto_522724 ?auto_522725 ?auto_522726 ?auto_522727 ?auto_522728 ?auto_522729 ?auto_522730 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_522763 - BLOCK
      ?auto_522764 - BLOCK
      ?auto_522765 - BLOCK
      ?auto_522766 - BLOCK
      ?auto_522767 - BLOCK
      ?auto_522768 - BLOCK
      ?auto_522769 - BLOCK
      ?auto_522770 - BLOCK
      ?auto_522771 - BLOCK
      ?auto_522772 - BLOCK
    )
    :vars
    (
      ?auto_522773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522772 ?auto_522773 ) ( ON-TABLE ?auto_522763 ) ( ON ?auto_522764 ?auto_522763 ) ( ON ?auto_522765 ?auto_522764 ) ( ON ?auto_522766 ?auto_522765 ) ( ON ?auto_522767 ?auto_522766 ) ( ON ?auto_522768 ?auto_522767 ) ( not ( = ?auto_522763 ?auto_522764 ) ) ( not ( = ?auto_522763 ?auto_522765 ) ) ( not ( = ?auto_522763 ?auto_522766 ) ) ( not ( = ?auto_522763 ?auto_522767 ) ) ( not ( = ?auto_522763 ?auto_522768 ) ) ( not ( = ?auto_522763 ?auto_522769 ) ) ( not ( = ?auto_522763 ?auto_522770 ) ) ( not ( = ?auto_522763 ?auto_522771 ) ) ( not ( = ?auto_522763 ?auto_522772 ) ) ( not ( = ?auto_522763 ?auto_522773 ) ) ( not ( = ?auto_522764 ?auto_522765 ) ) ( not ( = ?auto_522764 ?auto_522766 ) ) ( not ( = ?auto_522764 ?auto_522767 ) ) ( not ( = ?auto_522764 ?auto_522768 ) ) ( not ( = ?auto_522764 ?auto_522769 ) ) ( not ( = ?auto_522764 ?auto_522770 ) ) ( not ( = ?auto_522764 ?auto_522771 ) ) ( not ( = ?auto_522764 ?auto_522772 ) ) ( not ( = ?auto_522764 ?auto_522773 ) ) ( not ( = ?auto_522765 ?auto_522766 ) ) ( not ( = ?auto_522765 ?auto_522767 ) ) ( not ( = ?auto_522765 ?auto_522768 ) ) ( not ( = ?auto_522765 ?auto_522769 ) ) ( not ( = ?auto_522765 ?auto_522770 ) ) ( not ( = ?auto_522765 ?auto_522771 ) ) ( not ( = ?auto_522765 ?auto_522772 ) ) ( not ( = ?auto_522765 ?auto_522773 ) ) ( not ( = ?auto_522766 ?auto_522767 ) ) ( not ( = ?auto_522766 ?auto_522768 ) ) ( not ( = ?auto_522766 ?auto_522769 ) ) ( not ( = ?auto_522766 ?auto_522770 ) ) ( not ( = ?auto_522766 ?auto_522771 ) ) ( not ( = ?auto_522766 ?auto_522772 ) ) ( not ( = ?auto_522766 ?auto_522773 ) ) ( not ( = ?auto_522767 ?auto_522768 ) ) ( not ( = ?auto_522767 ?auto_522769 ) ) ( not ( = ?auto_522767 ?auto_522770 ) ) ( not ( = ?auto_522767 ?auto_522771 ) ) ( not ( = ?auto_522767 ?auto_522772 ) ) ( not ( = ?auto_522767 ?auto_522773 ) ) ( not ( = ?auto_522768 ?auto_522769 ) ) ( not ( = ?auto_522768 ?auto_522770 ) ) ( not ( = ?auto_522768 ?auto_522771 ) ) ( not ( = ?auto_522768 ?auto_522772 ) ) ( not ( = ?auto_522768 ?auto_522773 ) ) ( not ( = ?auto_522769 ?auto_522770 ) ) ( not ( = ?auto_522769 ?auto_522771 ) ) ( not ( = ?auto_522769 ?auto_522772 ) ) ( not ( = ?auto_522769 ?auto_522773 ) ) ( not ( = ?auto_522770 ?auto_522771 ) ) ( not ( = ?auto_522770 ?auto_522772 ) ) ( not ( = ?auto_522770 ?auto_522773 ) ) ( not ( = ?auto_522771 ?auto_522772 ) ) ( not ( = ?auto_522771 ?auto_522773 ) ) ( not ( = ?auto_522772 ?auto_522773 ) ) ( ON ?auto_522771 ?auto_522772 ) ( ON ?auto_522770 ?auto_522771 ) ( CLEAR ?auto_522768 ) ( ON ?auto_522769 ?auto_522770 ) ( CLEAR ?auto_522769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_522763 ?auto_522764 ?auto_522765 ?auto_522766 ?auto_522767 ?auto_522768 ?auto_522769 )
      ( MAKE-10PILE ?auto_522763 ?auto_522764 ?auto_522765 ?auto_522766 ?auto_522767 ?auto_522768 ?auto_522769 ?auto_522770 ?auto_522771 ?auto_522772 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_522805 - BLOCK
      ?auto_522806 - BLOCK
      ?auto_522807 - BLOCK
      ?auto_522808 - BLOCK
      ?auto_522809 - BLOCK
      ?auto_522810 - BLOCK
      ?auto_522811 - BLOCK
      ?auto_522812 - BLOCK
      ?auto_522813 - BLOCK
      ?auto_522814 - BLOCK
    )
    :vars
    (
      ?auto_522815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522814 ?auto_522815 ) ( ON-TABLE ?auto_522805 ) ( ON ?auto_522806 ?auto_522805 ) ( ON ?auto_522807 ?auto_522806 ) ( ON ?auto_522808 ?auto_522807 ) ( ON ?auto_522809 ?auto_522808 ) ( not ( = ?auto_522805 ?auto_522806 ) ) ( not ( = ?auto_522805 ?auto_522807 ) ) ( not ( = ?auto_522805 ?auto_522808 ) ) ( not ( = ?auto_522805 ?auto_522809 ) ) ( not ( = ?auto_522805 ?auto_522810 ) ) ( not ( = ?auto_522805 ?auto_522811 ) ) ( not ( = ?auto_522805 ?auto_522812 ) ) ( not ( = ?auto_522805 ?auto_522813 ) ) ( not ( = ?auto_522805 ?auto_522814 ) ) ( not ( = ?auto_522805 ?auto_522815 ) ) ( not ( = ?auto_522806 ?auto_522807 ) ) ( not ( = ?auto_522806 ?auto_522808 ) ) ( not ( = ?auto_522806 ?auto_522809 ) ) ( not ( = ?auto_522806 ?auto_522810 ) ) ( not ( = ?auto_522806 ?auto_522811 ) ) ( not ( = ?auto_522806 ?auto_522812 ) ) ( not ( = ?auto_522806 ?auto_522813 ) ) ( not ( = ?auto_522806 ?auto_522814 ) ) ( not ( = ?auto_522806 ?auto_522815 ) ) ( not ( = ?auto_522807 ?auto_522808 ) ) ( not ( = ?auto_522807 ?auto_522809 ) ) ( not ( = ?auto_522807 ?auto_522810 ) ) ( not ( = ?auto_522807 ?auto_522811 ) ) ( not ( = ?auto_522807 ?auto_522812 ) ) ( not ( = ?auto_522807 ?auto_522813 ) ) ( not ( = ?auto_522807 ?auto_522814 ) ) ( not ( = ?auto_522807 ?auto_522815 ) ) ( not ( = ?auto_522808 ?auto_522809 ) ) ( not ( = ?auto_522808 ?auto_522810 ) ) ( not ( = ?auto_522808 ?auto_522811 ) ) ( not ( = ?auto_522808 ?auto_522812 ) ) ( not ( = ?auto_522808 ?auto_522813 ) ) ( not ( = ?auto_522808 ?auto_522814 ) ) ( not ( = ?auto_522808 ?auto_522815 ) ) ( not ( = ?auto_522809 ?auto_522810 ) ) ( not ( = ?auto_522809 ?auto_522811 ) ) ( not ( = ?auto_522809 ?auto_522812 ) ) ( not ( = ?auto_522809 ?auto_522813 ) ) ( not ( = ?auto_522809 ?auto_522814 ) ) ( not ( = ?auto_522809 ?auto_522815 ) ) ( not ( = ?auto_522810 ?auto_522811 ) ) ( not ( = ?auto_522810 ?auto_522812 ) ) ( not ( = ?auto_522810 ?auto_522813 ) ) ( not ( = ?auto_522810 ?auto_522814 ) ) ( not ( = ?auto_522810 ?auto_522815 ) ) ( not ( = ?auto_522811 ?auto_522812 ) ) ( not ( = ?auto_522811 ?auto_522813 ) ) ( not ( = ?auto_522811 ?auto_522814 ) ) ( not ( = ?auto_522811 ?auto_522815 ) ) ( not ( = ?auto_522812 ?auto_522813 ) ) ( not ( = ?auto_522812 ?auto_522814 ) ) ( not ( = ?auto_522812 ?auto_522815 ) ) ( not ( = ?auto_522813 ?auto_522814 ) ) ( not ( = ?auto_522813 ?auto_522815 ) ) ( not ( = ?auto_522814 ?auto_522815 ) ) ( ON ?auto_522813 ?auto_522814 ) ( ON ?auto_522812 ?auto_522813 ) ( ON ?auto_522811 ?auto_522812 ) ( CLEAR ?auto_522809 ) ( ON ?auto_522810 ?auto_522811 ) ( CLEAR ?auto_522810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_522805 ?auto_522806 ?auto_522807 ?auto_522808 ?auto_522809 ?auto_522810 )
      ( MAKE-10PILE ?auto_522805 ?auto_522806 ?auto_522807 ?auto_522808 ?auto_522809 ?auto_522810 ?auto_522811 ?auto_522812 ?auto_522813 ?auto_522814 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_522847 - BLOCK
      ?auto_522848 - BLOCK
      ?auto_522849 - BLOCK
      ?auto_522850 - BLOCK
      ?auto_522851 - BLOCK
      ?auto_522852 - BLOCK
      ?auto_522853 - BLOCK
      ?auto_522854 - BLOCK
      ?auto_522855 - BLOCK
      ?auto_522856 - BLOCK
    )
    :vars
    (
      ?auto_522857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522856 ?auto_522857 ) ( ON-TABLE ?auto_522847 ) ( ON ?auto_522848 ?auto_522847 ) ( ON ?auto_522849 ?auto_522848 ) ( ON ?auto_522850 ?auto_522849 ) ( not ( = ?auto_522847 ?auto_522848 ) ) ( not ( = ?auto_522847 ?auto_522849 ) ) ( not ( = ?auto_522847 ?auto_522850 ) ) ( not ( = ?auto_522847 ?auto_522851 ) ) ( not ( = ?auto_522847 ?auto_522852 ) ) ( not ( = ?auto_522847 ?auto_522853 ) ) ( not ( = ?auto_522847 ?auto_522854 ) ) ( not ( = ?auto_522847 ?auto_522855 ) ) ( not ( = ?auto_522847 ?auto_522856 ) ) ( not ( = ?auto_522847 ?auto_522857 ) ) ( not ( = ?auto_522848 ?auto_522849 ) ) ( not ( = ?auto_522848 ?auto_522850 ) ) ( not ( = ?auto_522848 ?auto_522851 ) ) ( not ( = ?auto_522848 ?auto_522852 ) ) ( not ( = ?auto_522848 ?auto_522853 ) ) ( not ( = ?auto_522848 ?auto_522854 ) ) ( not ( = ?auto_522848 ?auto_522855 ) ) ( not ( = ?auto_522848 ?auto_522856 ) ) ( not ( = ?auto_522848 ?auto_522857 ) ) ( not ( = ?auto_522849 ?auto_522850 ) ) ( not ( = ?auto_522849 ?auto_522851 ) ) ( not ( = ?auto_522849 ?auto_522852 ) ) ( not ( = ?auto_522849 ?auto_522853 ) ) ( not ( = ?auto_522849 ?auto_522854 ) ) ( not ( = ?auto_522849 ?auto_522855 ) ) ( not ( = ?auto_522849 ?auto_522856 ) ) ( not ( = ?auto_522849 ?auto_522857 ) ) ( not ( = ?auto_522850 ?auto_522851 ) ) ( not ( = ?auto_522850 ?auto_522852 ) ) ( not ( = ?auto_522850 ?auto_522853 ) ) ( not ( = ?auto_522850 ?auto_522854 ) ) ( not ( = ?auto_522850 ?auto_522855 ) ) ( not ( = ?auto_522850 ?auto_522856 ) ) ( not ( = ?auto_522850 ?auto_522857 ) ) ( not ( = ?auto_522851 ?auto_522852 ) ) ( not ( = ?auto_522851 ?auto_522853 ) ) ( not ( = ?auto_522851 ?auto_522854 ) ) ( not ( = ?auto_522851 ?auto_522855 ) ) ( not ( = ?auto_522851 ?auto_522856 ) ) ( not ( = ?auto_522851 ?auto_522857 ) ) ( not ( = ?auto_522852 ?auto_522853 ) ) ( not ( = ?auto_522852 ?auto_522854 ) ) ( not ( = ?auto_522852 ?auto_522855 ) ) ( not ( = ?auto_522852 ?auto_522856 ) ) ( not ( = ?auto_522852 ?auto_522857 ) ) ( not ( = ?auto_522853 ?auto_522854 ) ) ( not ( = ?auto_522853 ?auto_522855 ) ) ( not ( = ?auto_522853 ?auto_522856 ) ) ( not ( = ?auto_522853 ?auto_522857 ) ) ( not ( = ?auto_522854 ?auto_522855 ) ) ( not ( = ?auto_522854 ?auto_522856 ) ) ( not ( = ?auto_522854 ?auto_522857 ) ) ( not ( = ?auto_522855 ?auto_522856 ) ) ( not ( = ?auto_522855 ?auto_522857 ) ) ( not ( = ?auto_522856 ?auto_522857 ) ) ( ON ?auto_522855 ?auto_522856 ) ( ON ?auto_522854 ?auto_522855 ) ( ON ?auto_522853 ?auto_522854 ) ( ON ?auto_522852 ?auto_522853 ) ( CLEAR ?auto_522850 ) ( ON ?auto_522851 ?auto_522852 ) ( CLEAR ?auto_522851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_522847 ?auto_522848 ?auto_522849 ?auto_522850 ?auto_522851 )
      ( MAKE-10PILE ?auto_522847 ?auto_522848 ?auto_522849 ?auto_522850 ?auto_522851 ?auto_522852 ?auto_522853 ?auto_522854 ?auto_522855 ?auto_522856 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_522889 - BLOCK
      ?auto_522890 - BLOCK
      ?auto_522891 - BLOCK
      ?auto_522892 - BLOCK
      ?auto_522893 - BLOCK
      ?auto_522894 - BLOCK
      ?auto_522895 - BLOCK
      ?auto_522896 - BLOCK
      ?auto_522897 - BLOCK
      ?auto_522898 - BLOCK
    )
    :vars
    (
      ?auto_522899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522898 ?auto_522899 ) ( ON-TABLE ?auto_522889 ) ( ON ?auto_522890 ?auto_522889 ) ( ON ?auto_522891 ?auto_522890 ) ( not ( = ?auto_522889 ?auto_522890 ) ) ( not ( = ?auto_522889 ?auto_522891 ) ) ( not ( = ?auto_522889 ?auto_522892 ) ) ( not ( = ?auto_522889 ?auto_522893 ) ) ( not ( = ?auto_522889 ?auto_522894 ) ) ( not ( = ?auto_522889 ?auto_522895 ) ) ( not ( = ?auto_522889 ?auto_522896 ) ) ( not ( = ?auto_522889 ?auto_522897 ) ) ( not ( = ?auto_522889 ?auto_522898 ) ) ( not ( = ?auto_522889 ?auto_522899 ) ) ( not ( = ?auto_522890 ?auto_522891 ) ) ( not ( = ?auto_522890 ?auto_522892 ) ) ( not ( = ?auto_522890 ?auto_522893 ) ) ( not ( = ?auto_522890 ?auto_522894 ) ) ( not ( = ?auto_522890 ?auto_522895 ) ) ( not ( = ?auto_522890 ?auto_522896 ) ) ( not ( = ?auto_522890 ?auto_522897 ) ) ( not ( = ?auto_522890 ?auto_522898 ) ) ( not ( = ?auto_522890 ?auto_522899 ) ) ( not ( = ?auto_522891 ?auto_522892 ) ) ( not ( = ?auto_522891 ?auto_522893 ) ) ( not ( = ?auto_522891 ?auto_522894 ) ) ( not ( = ?auto_522891 ?auto_522895 ) ) ( not ( = ?auto_522891 ?auto_522896 ) ) ( not ( = ?auto_522891 ?auto_522897 ) ) ( not ( = ?auto_522891 ?auto_522898 ) ) ( not ( = ?auto_522891 ?auto_522899 ) ) ( not ( = ?auto_522892 ?auto_522893 ) ) ( not ( = ?auto_522892 ?auto_522894 ) ) ( not ( = ?auto_522892 ?auto_522895 ) ) ( not ( = ?auto_522892 ?auto_522896 ) ) ( not ( = ?auto_522892 ?auto_522897 ) ) ( not ( = ?auto_522892 ?auto_522898 ) ) ( not ( = ?auto_522892 ?auto_522899 ) ) ( not ( = ?auto_522893 ?auto_522894 ) ) ( not ( = ?auto_522893 ?auto_522895 ) ) ( not ( = ?auto_522893 ?auto_522896 ) ) ( not ( = ?auto_522893 ?auto_522897 ) ) ( not ( = ?auto_522893 ?auto_522898 ) ) ( not ( = ?auto_522893 ?auto_522899 ) ) ( not ( = ?auto_522894 ?auto_522895 ) ) ( not ( = ?auto_522894 ?auto_522896 ) ) ( not ( = ?auto_522894 ?auto_522897 ) ) ( not ( = ?auto_522894 ?auto_522898 ) ) ( not ( = ?auto_522894 ?auto_522899 ) ) ( not ( = ?auto_522895 ?auto_522896 ) ) ( not ( = ?auto_522895 ?auto_522897 ) ) ( not ( = ?auto_522895 ?auto_522898 ) ) ( not ( = ?auto_522895 ?auto_522899 ) ) ( not ( = ?auto_522896 ?auto_522897 ) ) ( not ( = ?auto_522896 ?auto_522898 ) ) ( not ( = ?auto_522896 ?auto_522899 ) ) ( not ( = ?auto_522897 ?auto_522898 ) ) ( not ( = ?auto_522897 ?auto_522899 ) ) ( not ( = ?auto_522898 ?auto_522899 ) ) ( ON ?auto_522897 ?auto_522898 ) ( ON ?auto_522896 ?auto_522897 ) ( ON ?auto_522895 ?auto_522896 ) ( ON ?auto_522894 ?auto_522895 ) ( ON ?auto_522893 ?auto_522894 ) ( CLEAR ?auto_522891 ) ( ON ?auto_522892 ?auto_522893 ) ( CLEAR ?auto_522892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_522889 ?auto_522890 ?auto_522891 ?auto_522892 )
      ( MAKE-10PILE ?auto_522889 ?auto_522890 ?auto_522891 ?auto_522892 ?auto_522893 ?auto_522894 ?auto_522895 ?auto_522896 ?auto_522897 ?auto_522898 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_522931 - BLOCK
      ?auto_522932 - BLOCK
      ?auto_522933 - BLOCK
      ?auto_522934 - BLOCK
      ?auto_522935 - BLOCK
      ?auto_522936 - BLOCK
      ?auto_522937 - BLOCK
      ?auto_522938 - BLOCK
      ?auto_522939 - BLOCK
      ?auto_522940 - BLOCK
    )
    :vars
    (
      ?auto_522941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522940 ?auto_522941 ) ( ON-TABLE ?auto_522931 ) ( ON ?auto_522932 ?auto_522931 ) ( not ( = ?auto_522931 ?auto_522932 ) ) ( not ( = ?auto_522931 ?auto_522933 ) ) ( not ( = ?auto_522931 ?auto_522934 ) ) ( not ( = ?auto_522931 ?auto_522935 ) ) ( not ( = ?auto_522931 ?auto_522936 ) ) ( not ( = ?auto_522931 ?auto_522937 ) ) ( not ( = ?auto_522931 ?auto_522938 ) ) ( not ( = ?auto_522931 ?auto_522939 ) ) ( not ( = ?auto_522931 ?auto_522940 ) ) ( not ( = ?auto_522931 ?auto_522941 ) ) ( not ( = ?auto_522932 ?auto_522933 ) ) ( not ( = ?auto_522932 ?auto_522934 ) ) ( not ( = ?auto_522932 ?auto_522935 ) ) ( not ( = ?auto_522932 ?auto_522936 ) ) ( not ( = ?auto_522932 ?auto_522937 ) ) ( not ( = ?auto_522932 ?auto_522938 ) ) ( not ( = ?auto_522932 ?auto_522939 ) ) ( not ( = ?auto_522932 ?auto_522940 ) ) ( not ( = ?auto_522932 ?auto_522941 ) ) ( not ( = ?auto_522933 ?auto_522934 ) ) ( not ( = ?auto_522933 ?auto_522935 ) ) ( not ( = ?auto_522933 ?auto_522936 ) ) ( not ( = ?auto_522933 ?auto_522937 ) ) ( not ( = ?auto_522933 ?auto_522938 ) ) ( not ( = ?auto_522933 ?auto_522939 ) ) ( not ( = ?auto_522933 ?auto_522940 ) ) ( not ( = ?auto_522933 ?auto_522941 ) ) ( not ( = ?auto_522934 ?auto_522935 ) ) ( not ( = ?auto_522934 ?auto_522936 ) ) ( not ( = ?auto_522934 ?auto_522937 ) ) ( not ( = ?auto_522934 ?auto_522938 ) ) ( not ( = ?auto_522934 ?auto_522939 ) ) ( not ( = ?auto_522934 ?auto_522940 ) ) ( not ( = ?auto_522934 ?auto_522941 ) ) ( not ( = ?auto_522935 ?auto_522936 ) ) ( not ( = ?auto_522935 ?auto_522937 ) ) ( not ( = ?auto_522935 ?auto_522938 ) ) ( not ( = ?auto_522935 ?auto_522939 ) ) ( not ( = ?auto_522935 ?auto_522940 ) ) ( not ( = ?auto_522935 ?auto_522941 ) ) ( not ( = ?auto_522936 ?auto_522937 ) ) ( not ( = ?auto_522936 ?auto_522938 ) ) ( not ( = ?auto_522936 ?auto_522939 ) ) ( not ( = ?auto_522936 ?auto_522940 ) ) ( not ( = ?auto_522936 ?auto_522941 ) ) ( not ( = ?auto_522937 ?auto_522938 ) ) ( not ( = ?auto_522937 ?auto_522939 ) ) ( not ( = ?auto_522937 ?auto_522940 ) ) ( not ( = ?auto_522937 ?auto_522941 ) ) ( not ( = ?auto_522938 ?auto_522939 ) ) ( not ( = ?auto_522938 ?auto_522940 ) ) ( not ( = ?auto_522938 ?auto_522941 ) ) ( not ( = ?auto_522939 ?auto_522940 ) ) ( not ( = ?auto_522939 ?auto_522941 ) ) ( not ( = ?auto_522940 ?auto_522941 ) ) ( ON ?auto_522939 ?auto_522940 ) ( ON ?auto_522938 ?auto_522939 ) ( ON ?auto_522937 ?auto_522938 ) ( ON ?auto_522936 ?auto_522937 ) ( ON ?auto_522935 ?auto_522936 ) ( ON ?auto_522934 ?auto_522935 ) ( CLEAR ?auto_522932 ) ( ON ?auto_522933 ?auto_522934 ) ( CLEAR ?auto_522933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_522931 ?auto_522932 ?auto_522933 )
      ( MAKE-10PILE ?auto_522931 ?auto_522932 ?auto_522933 ?auto_522934 ?auto_522935 ?auto_522936 ?auto_522937 ?auto_522938 ?auto_522939 ?auto_522940 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_522973 - BLOCK
      ?auto_522974 - BLOCK
      ?auto_522975 - BLOCK
      ?auto_522976 - BLOCK
      ?auto_522977 - BLOCK
      ?auto_522978 - BLOCK
      ?auto_522979 - BLOCK
      ?auto_522980 - BLOCK
      ?auto_522981 - BLOCK
      ?auto_522982 - BLOCK
    )
    :vars
    (
      ?auto_522983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_522982 ?auto_522983 ) ( ON-TABLE ?auto_522973 ) ( not ( = ?auto_522973 ?auto_522974 ) ) ( not ( = ?auto_522973 ?auto_522975 ) ) ( not ( = ?auto_522973 ?auto_522976 ) ) ( not ( = ?auto_522973 ?auto_522977 ) ) ( not ( = ?auto_522973 ?auto_522978 ) ) ( not ( = ?auto_522973 ?auto_522979 ) ) ( not ( = ?auto_522973 ?auto_522980 ) ) ( not ( = ?auto_522973 ?auto_522981 ) ) ( not ( = ?auto_522973 ?auto_522982 ) ) ( not ( = ?auto_522973 ?auto_522983 ) ) ( not ( = ?auto_522974 ?auto_522975 ) ) ( not ( = ?auto_522974 ?auto_522976 ) ) ( not ( = ?auto_522974 ?auto_522977 ) ) ( not ( = ?auto_522974 ?auto_522978 ) ) ( not ( = ?auto_522974 ?auto_522979 ) ) ( not ( = ?auto_522974 ?auto_522980 ) ) ( not ( = ?auto_522974 ?auto_522981 ) ) ( not ( = ?auto_522974 ?auto_522982 ) ) ( not ( = ?auto_522974 ?auto_522983 ) ) ( not ( = ?auto_522975 ?auto_522976 ) ) ( not ( = ?auto_522975 ?auto_522977 ) ) ( not ( = ?auto_522975 ?auto_522978 ) ) ( not ( = ?auto_522975 ?auto_522979 ) ) ( not ( = ?auto_522975 ?auto_522980 ) ) ( not ( = ?auto_522975 ?auto_522981 ) ) ( not ( = ?auto_522975 ?auto_522982 ) ) ( not ( = ?auto_522975 ?auto_522983 ) ) ( not ( = ?auto_522976 ?auto_522977 ) ) ( not ( = ?auto_522976 ?auto_522978 ) ) ( not ( = ?auto_522976 ?auto_522979 ) ) ( not ( = ?auto_522976 ?auto_522980 ) ) ( not ( = ?auto_522976 ?auto_522981 ) ) ( not ( = ?auto_522976 ?auto_522982 ) ) ( not ( = ?auto_522976 ?auto_522983 ) ) ( not ( = ?auto_522977 ?auto_522978 ) ) ( not ( = ?auto_522977 ?auto_522979 ) ) ( not ( = ?auto_522977 ?auto_522980 ) ) ( not ( = ?auto_522977 ?auto_522981 ) ) ( not ( = ?auto_522977 ?auto_522982 ) ) ( not ( = ?auto_522977 ?auto_522983 ) ) ( not ( = ?auto_522978 ?auto_522979 ) ) ( not ( = ?auto_522978 ?auto_522980 ) ) ( not ( = ?auto_522978 ?auto_522981 ) ) ( not ( = ?auto_522978 ?auto_522982 ) ) ( not ( = ?auto_522978 ?auto_522983 ) ) ( not ( = ?auto_522979 ?auto_522980 ) ) ( not ( = ?auto_522979 ?auto_522981 ) ) ( not ( = ?auto_522979 ?auto_522982 ) ) ( not ( = ?auto_522979 ?auto_522983 ) ) ( not ( = ?auto_522980 ?auto_522981 ) ) ( not ( = ?auto_522980 ?auto_522982 ) ) ( not ( = ?auto_522980 ?auto_522983 ) ) ( not ( = ?auto_522981 ?auto_522982 ) ) ( not ( = ?auto_522981 ?auto_522983 ) ) ( not ( = ?auto_522982 ?auto_522983 ) ) ( ON ?auto_522981 ?auto_522982 ) ( ON ?auto_522980 ?auto_522981 ) ( ON ?auto_522979 ?auto_522980 ) ( ON ?auto_522978 ?auto_522979 ) ( ON ?auto_522977 ?auto_522978 ) ( ON ?auto_522976 ?auto_522977 ) ( ON ?auto_522975 ?auto_522976 ) ( CLEAR ?auto_522973 ) ( ON ?auto_522974 ?auto_522975 ) ( CLEAR ?auto_522974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_522973 ?auto_522974 )
      ( MAKE-10PILE ?auto_522973 ?auto_522974 ?auto_522975 ?auto_522976 ?auto_522977 ?auto_522978 ?auto_522979 ?auto_522980 ?auto_522981 ?auto_522982 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_523015 - BLOCK
      ?auto_523016 - BLOCK
      ?auto_523017 - BLOCK
      ?auto_523018 - BLOCK
      ?auto_523019 - BLOCK
      ?auto_523020 - BLOCK
      ?auto_523021 - BLOCK
      ?auto_523022 - BLOCK
      ?auto_523023 - BLOCK
      ?auto_523024 - BLOCK
    )
    :vars
    (
      ?auto_523025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523024 ?auto_523025 ) ( not ( = ?auto_523015 ?auto_523016 ) ) ( not ( = ?auto_523015 ?auto_523017 ) ) ( not ( = ?auto_523015 ?auto_523018 ) ) ( not ( = ?auto_523015 ?auto_523019 ) ) ( not ( = ?auto_523015 ?auto_523020 ) ) ( not ( = ?auto_523015 ?auto_523021 ) ) ( not ( = ?auto_523015 ?auto_523022 ) ) ( not ( = ?auto_523015 ?auto_523023 ) ) ( not ( = ?auto_523015 ?auto_523024 ) ) ( not ( = ?auto_523015 ?auto_523025 ) ) ( not ( = ?auto_523016 ?auto_523017 ) ) ( not ( = ?auto_523016 ?auto_523018 ) ) ( not ( = ?auto_523016 ?auto_523019 ) ) ( not ( = ?auto_523016 ?auto_523020 ) ) ( not ( = ?auto_523016 ?auto_523021 ) ) ( not ( = ?auto_523016 ?auto_523022 ) ) ( not ( = ?auto_523016 ?auto_523023 ) ) ( not ( = ?auto_523016 ?auto_523024 ) ) ( not ( = ?auto_523016 ?auto_523025 ) ) ( not ( = ?auto_523017 ?auto_523018 ) ) ( not ( = ?auto_523017 ?auto_523019 ) ) ( not ( = ?auto_523017 ?auto_523020 ) ) ( not ( = ?auto_523017 ?auto_523021 ) ) ( not ( = ?auto_523017 ?auto_523022 ) ) ( not ( = ?auto_523017 ?auto_523023 ) ) ( not ( = ?auto_523017 ?auto_523024 ) ) ( not ( = ?auto_523017 ?auto_523025 ) ) ( not ( = ?auto_523018 ?auto_523019 ) ) ( not ( = ?auto_523018 ?auto_523020 ) ) ( not ( = ?auto_523018 ?auto_523021 ) ) ( not ( = ?auto_523018 ?auto_523022 ) ) ( not ( = ?auto_523018 ?auto_523023 ) ) ( not ( = ?auto_523018 ?auto_523024 ) ) ( not ( = ?auto_523018 ?auto_523025 ) ) ( not ( = ?auto_523019 ?auto_523020 ) ) ( not ( = ?auto_523019 ?auto_523021 ) ) ( not ( = ?auto_523019 ?auto_523022 ) ) ( not ( = ?auto_523019 ?auto_523023 ) ) ( not ( = ?auto_523019 ?auto_523024 ) ) ( not ( = ?auto_523019 ?auto_523025 ) ) ( not ( = ?auto_523020 ?auto_523021 ) ) ( not ( = ?auto_523020 ?auto_523022 ) ) ( not ( = ?auto_523020 ?auto_523023 ) ) ( not ( = ?auto_523020 ?auto_523024 ) ) ( not ( = ?auto_523020 ?auto_523025 ) ) ( not ( = ?auto_523021 ?auto_523022 ) ) ( not ( = ?auto_523021 ?auto_523023 ) ) ( not ( = ?auto_523021 ?auto_523024 ) ) ( not ( = ?auto_523021 ?auto_523025 ) ) ( not ( = ?auto_523022 ?auto_523023 ) ) ( not ( = ?auto_523022 ?auto_523024 ) ) ( not ( = ?auto_523022 ?auto_523025 ) ) ( not ( = ?auto_523023 ?auto_523024 ) ) ( not ( = ?auto_523023 ?auto_523025 ) ) ( not ( = ?auto_523024 ?auto_523025 ) ) ( ON ?auto_523023 ?auto_523024 ) ( ON ?auto_523022 ?auto_523023 ) ( ON ?auto_523021 ?auto_523022 ) ( ON ?auto_523020 ?auto_523021 ) ( ON ?auto_523019 ?auto_523020 ) ( ON ?auto_523018 ?auto_523019 ) ( ON ?auto_523017 ?auto_523018 ) ( ON ?auto_523016 ?auto_523017 ) ( ON ?auto_523015 ?auto_523016 ) ( CLEAR ?auto_523015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_523015 )
      ( MAKE-10PILE ?auto_523015 ?auto_523016 ?auto_523017 ?auto_523018 ?auto_523019 ?auto_523020 ?auto_523021 ?auto_523022 ?auto_523023 ?auto_523024 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_523058 - BLOCK
      ?auto_523059 - BLOCK
      ?auto_523060 - BLOCK
      ?auto_523061 - BLOCK
      ?auto_523062 - BLOCK
      ?auto_523063 - BLOCK
      ?auto_523064 - BLOCK
      ?auto_523065 - BLOCK
      ?auto_523066 - BLOCK
      ?auto_523067 - BLOCK
      ?auto_523068 - BLOCK
    )
    :vars
    (
      ?auto_523069 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_523067 ) ( ON ?auto_523068 ?auto_523069 ) ( CLEAR ?auto_523068 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_523058 ) ( ON ?auto_523059 ?auto_523058 ) ( ON ?auto_523060 ?auto_523059 ) ( ON ?auto_523061 ?auto_523060 ) ( ON ?auto_523062 ?auto_523061 ) ( ON ?auto_523063 ?auto_523062 ) ( ON ?auto_523064 ?auto_523063 ) ( ON ?auto_523065 ?auto_523064 ) ( ON ?auto_523066 ?auto_523065 ) ( ON ?auto_523067 ?auto_523066 ) ( not ( = ?auto_523058 ?auto_523059 ) ) ( not ( = ?auto_523058 ?auto_523060 ) ) ( not ( = ?auto_523058 ?auto_523061 ) ) ( not ( = ?auto_523058 ?auto_523062 ) ) ( not ( = ?auto_523058 ?auto_523063 ) ) ( not ( = ?auto_523058 ?auto_523064 ) ) ( not ( = ?auto_523058 ?auto_523065 ) ) ( not ( = ?auto_523058 ?auto_523066 ) ) ( not ( = ?auto_523058 ?auto_523067 ) ) ( not ( = ?auto_523058 ?auto_523068 ) ) ( not ( = ?auto_523058 ?auto_523069 ) ) ( not ( = ?auto_523059 ?auto_523060 ) ) ( not ( = ?auto_523059 ?auto_523061 ) ) ( not ( = ?auto_523059 ?auto_523062 ) ) ( not ( = ?auto_523059 ?auto_523063 ) ) ( not ( = ?auto_523059 ?auto_523064 ) ) ( not ( = ?auto_523059 ?auto_523065 ) ) ( not ( = ?auto_523059 ?auto_523066 ) ) ( not ( = ?auto_523059 ?auto_523067 ) ) ( not ( = ?auto_523059 ?auto_523068 ) ) ( not ( = ?auto_523059 ?auto_523069 ) ) ( not ( = ?auto_523060 ?auto_523061 ) ) ( not ( = ?auto_523060 ?auto_523062 ) ) ( not ( = ?auto_523060 ?auto_523063 ) ) ( not ( = ?auto_523060 ?auto_523064 ) ) ( not ( = ?auto_523060 ?auto_523065 ) ) ( not ( = ?auto_523060 ?auto_523066 ) ) ( not ( = ?auto_523060 ?auto_523067 ) ) ( not ( = ?auto_523060 ?auto_523068 ) ) ( not ( = ?auto_523060 ?auto_523069 ) ) ( not ( = ?auto_523061 ?auto_523062 ) ) ( not ( = ?auto_523061 ?auto_523063 ) ) ( not ( = ?auto_523061 ?auto_523064 ) ) ( not ( = ?auto_523061 ?auto_523065 ) ) ( not ( = ?auto_523061 ?auto_523066 ) ) ( not ( = ?auto_523061 ?auto_523067 ) ) ( not ( = ?auto_523061 ?auto_523068 ) ) ( not ( = ?auto_523061 ?auto_523069 ) ) ( not ( = ?auto_523062 ?auto_523063 ) ) ( not ( = ?auto_523062 ?auto_523064 ) ) ( not ( = ?auto_523062 ?auto_523065 ) ) ( not ( = ?auto_523062 ?auto_523066 ) ) ( not ( = ?auto_523062 ?auto_523067 ) ) ( not ( = ?auto_523062 ?auto_523068 ) ) ( not ( = ?auto_523062 ?auto_523069 ) ) ( not ( = ?auto_523063 ?auto_523064 ) ) ( not ( = ?auto_523063 ?auto_523065 ) ) ( not ( = ?auto_523063 ?auto_523066 ) ) ( not ( = ?auto_523063 ?auto_523067 ) ) ( not ( = ?auto_523063 ?auto_523068 ) ) ( not ( = ?auto_523063 ?auto_523069 ) ) ( not ( = ?auto_523064 ?auto_523065 ) ) ( not ( = ?auto_523064 ?auto_523066 ) ) ( not ( = ?auto_523064 ?auto_523067 ) ) ( not ( = ?auto_523064 ?auto_523068 ) ) ( not ( = ?auto_523064 ?auto_523069 ) ) ( not ( = ?auto_523065 ?auto_523066 ) ) ( not ( = ?auto_523065 ?auto_523067 ) ) ( not ( = ?auto_523065 ?auto_523068 ) ) ( not ( = ?auto_523065 ?auto_523069 ) ) ( not ( = ?auto_523066 ?auto_523067 ) ) ( not ( = ?auto_523066 ?auto_523068 ) ) ( not ( = ?auto_523066 ?auto_523069 ) ) ( not ( = ?auto_523067 ?auto_523068 ) ) ( not ( = ?auto_523067 ?auto_523069 ) ) ( not ( = ?auto_523068 ?auto_523069 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_523068 ?auto_523069 )
      ( !STACK ?auto_523068 ?auto_523067 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_523104 - BLOCK
      ?auto_523105 - BLOCK
      ?auto_523106 - BLOCK
      ?auto_523107 - BLOCK
      ?auto_523108 - BLOCK
      ?auto_523109 - BLOCK
      ?auto_523110 - BLOCK
      ?auto_523111 - BLOCK
      ?auto_523112 - BLOCK
      ?auto_523113 - BLOCK
      ?auto_523114 - BLOCK
    )
    :vars
    (
      ?auto_523115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523114 ?auto_523115 ) ( ON-TABLE ?auto_523104 ) ( ON ?auto_523105 ?auto_523104 ) ( ON ?auto_523106 ?auto_523105 ) ( ON ?auto_523107 ?auto_523106 ) ( ON ?auto_523108 ?auto_523107 ) ( ON ?auto_523109 ?auto_523108 ) ( ON ?auto_523110 ?auto_523109 ) ( ON ?auto_523111 ?auto_523110 ) ( ON ?auto_523112 ?auto_523111 ) ( not ( = ?auto_523104 ?auto_523105 ) ) ( not ( = ?auto_523104 ?auto_523106 ) ) ( not ( = ?auto_523104 ?auto_523107 ) ) ( not ( = ?auto_523104 ?auto_523108 ) ) ( not ( = ?auto_523104 ?auto_523109 ) ) ( not ( = ?auto_523104 ?auto_523110 ) ) ( not ( = ?auto_523104 ?auto_523111 ) ) ( not ( = ?auto_523104 ?auto_523112 ) ) ( not ( = ?auto_523104 ?auto_523113 ) ) ( not ( = ?auto_523104 ?auto_523114 ) ) ( not ( = ?auto_523104 ?auto_523115 ) ) ( not ( = ?auto_523105 ?auto_523106 ) ) ( not ( = ?auto_523105 ?auto_523107 ) ) ( not ( = ?auto_523105 ?auto_523108 ) ) ( not ( = ?auto_523105 ?auto_523109 ) ) ( not ( = ?auto_523105 ?auto_523110 ) ) ( not ( = ?auto_523105 ?auto_523111 ) ) ( not ( = ?auto_523105 ?auto_523112 ) ) ( not ( = ?auto_523105 ?auto_523113 ) ) ( not ( = ?auto_523105 ?auto_523114 ) ) ( not ( = ?auto_523105 ?auto_523115 ) ) ( not ( = ?auto_523106 ?auto_523107 ) ) ( not ( = ?auto_523106 ?auto_523108 ) ) ( not ( = ?auto_523106 ?auto_523109 ) ) ( not ( = ?auto_523106 ?auto_523110 ) ) ( not ( = ?auto_523106 ?auto_523111 ) ) ( not ( = ?auto_523106 ?auto_523112 ) ) ( not ( = ?auto_523106 ?auto_523113 ) ) ( not ( = ?auto_523106 ?auto_523114 ) ) ( not ( = ?auto_523106 ?auto_523115 ) ) ( not ( = ?auto_523107 ?auto_523108 ) ) ( not ( = ?auto_523107 ?auto_523109 ) ) ( not ( = ?auto_523107 ?auto_523110 ) ) ( not ( = ?auto_523107 ?auto_523111 ) ) ( not ( = ?auto_523107 ?auto_523112 ) ) ( not ( = ?auto_523107 ?auto_523113 ) ) ( not ( = ?auto_523107 ?auto_523114 ) ) ( not ( = ?auto_523107 ?auto_523115 ) ) ( not ( = ?auto_523108 ?auto_523109 ) ) ( not ( = ?auto_523108 ?auto_523110 ) ) ( not ( = ?auto_523108 ?auto_523111 ) ) ( not ( = ?auto_523108 ?auto_523112 ) ) ( not ( = ?auto_523108 ?auto_523113 ) ) ( not ( = ?auto_523108 ?auto_523114 ) ) ( not ( = ?auto_523108 ?auto_523115 ) ) ( not ( = ?auto_523109 ?auto_523110 ) ) ( not ( = ?auto_523109 ?auto_523111 ) ) ( not ( = ?auto_523109 ?auto_523112 ) ) ( not ( = ?auto_523109 ?auto_523113 ) ) ( not ( = ?auto_523109 ?auto_523114 ) ) ( not ( = ?auto_523109 ?auto_523115 ) ) ( not ( = ?auto_523110 ?auto_523111 ) ) ( not ( = ?auto_523110 ?auto_523112 ) ) ( not ( = ?auto_523110 ?auto_523113 ) ) ( not ( = ?auto_523110 ?auto_523114 ) ) ( not ( = ?auto_523110 ?auto_523115 ) ) ( not ( = ?auto_523111 ?auto_523112 ) ) ( not ( = ?auto_523111 ?auto_523113 ) ) ( not ( = ?auto_523111 ?auto_523114 ) ) ( not ( = ?auto_523111 ?auto_523115 ) ) ( not ( = ?auto_523112 ?auto_523113 ) ) ( not ( = ?auto_523112 ?auto_523114 ) ) ( not ( = ?auto_523112 ?auto_523115 ) ) ( not ( = ?auto_523113 ?auto_523114 ) ) ( not ( = ?auto_523113 ?auto_523115 ) ) ( not ( = ?auto_523114 ?auto_523115 ) ) ( CLEAR ?auto_523112 ) ( ON ?auto_523113 ?auto_523114 ) ( CLEAR ?auto_523113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_523104 ?auto_523105 ?auto_523106 ?auto_523107 ?auto_523108 ?auto_523109 ?auto_523110 ?auto_523111 ?auto_523112 ?auto_523113 )
      ( MAKE-11PILE ?auto_523104 ?auto_523105 ?auto_523106 ?auto_523107 ?auto_523108 ?auto_523109 ?auto_523110 ?auto_523111 ?auto_523112 ?auto_523113 ?auto_523114 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_523150 - BLOCK
      ?auto_523151 - BLOCK
      ?auto_523152 - BLOCK
      ?auto_523153 - BLOCK
      ?auto_523154 - BLOCK
      ?auto_523155 - BLOCK
      ?auto_523156 - BLOCK
      ?auto_523157 - BLOCK
      ?auto_523158 - BLOCK
      ?auto_523159 - BLOCK
      ?auto_523160 - BLOCK
    )
    :vars
    (
      ?auto_523161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523160 ?auto_523161 ) ( ON-TABLE ?auto_523150 ) ( ON ?auto_523151 ?auto_523150 ) ( ON ?auto_523152 ?auto_523151 ) ( ON ?auto_523153 ?auto_523152 ) ( ON ?auto_523154 ?auto_523153 ) ( ON ?auto_523155 ?auto_523154 ) ( ON ?auto_523156 ?auto_523155 ) ( ON ?auto_523157 ?auto_523156 ) ( not ( = ?auto_523150 ?auto_523151 ) ) ( not ( = ?auto_523150 ?auto_523152 ) ) ( not ( = ?auto_523150 ?auto_523153 ) ) ( not ( = ?auto_523150 ?auto_523154 ) ) ( not ( = ?auto_523150 ?auto_523155 ) ) ( not ( = ?auto_523150 ?auto_523156 ) ) ( not ( = ?auto_523150 ?auto_523157 ) ) ( not ( = ?auto_523150 ?auto_523158 ) ) ( not ( = ?auto_523150 ?auto_523159 ) ) ( not ( = ?auto_523150 ?auto_523160 ) ) ( not ( = ?auto_523150 ?auto_523161 ) ) ( not ( = ?auto_523151 ?auto_523152 ) ) ( not ( = ?auto_523151 ?auto_523153 ) ) ( not ( = ?auto_523151 ?auto_523154 ) ) ( not ( = ?auto_523151 ?auto_523155 ) ) ( not ( = ?auto_523151 ?auto_523156 ) ) ( not ( = ?auto_523151 ?auto_523157 ) ) ( not ( = ?auto_523151 ?auto_523158 ) ) ( not ( = ?auto_523151 ?auto_523159 ) ) ( not ( = ?auto_523151 ?auto_523160 ) ) ( not ( = ?auto_523151 ?auto_523161 ) ) ( not ( = ?auto_523152 ?auto_523153 ) ) ( not ( = ?auto_523152 ?auto_523154 ) ) ( not ( = ?auto_523152 ?auto_523155 ) ) ( not ( = ?auto_523152 ?auto_523156 ) ) ( not ( = ?auto_523152 ?auto_523157 ) ) ( not ( = ?auto_523152 ?auto_523158 ) ) ( not ( = ?auto_523152 ?auto_523159 ) ) ( not ( = ?auto_523152 ?auto_523160 ) ) ( not ( = ?auto_523152 ?auto_523161 ) ) ( not ( = ?auto_523153 ?auto_523154 ) ) ( not ( = ?auto_523153 ?auto_523155 ) ) ( not ( = ?auto_523153 ?auto_523156 ) ) ( not ( = ?auto_523153 ?auto_523157 ) ) ( not ( = ?auto_523153 ?auto_523158 ) ) ( not ( = ?auto_523153 ?auto_523159 ) ) ( not ( = ?auto_523153 ?auto_523160 ) ) ( not ( = ?auto_523153 ?auto_523161 ) ) ( not ( = ?auto_523154 ?auto_523155 ) ) ( not ( = ?auto_523154 ?auto_523156 ) ) ( not ( = ?auto_523154 ?auto_523157 ) ) ( not ( = ?auto_523154 ?auto_523158 ) ) ( not ( = ?auto_523154 ?auto_523159 ) ) ( not ( = ?auto_523154 ?auto_523160 ) ) ( not ( = ?auto_523154 ?auto_523161 ) ) ( not ( = ?auto_523155 ?auto_523156 ) ) ( not ( = ?auto_523155 ?auto_523157 ) ) ( not ( = ?auto_523155 ?auto_523158 ) ) ( not ( = ?auto_523155 ?auto_523159 ) ) ( not ( = ?auto_523155 ?auto_523160 ) ) ( not ( = ?auto_523155 ?auto_523161 ) ) ( not ( = ?auto_523156 ?auto_523157 ) ) ( not ( = ?auto_523156 ?auto_523158 ) ) ( not ( = ?auto_523156 ?auto_523159 ) ) ( not ( = ?auto_523156 ?auto_523160 ) ) ( not ( = ?auto_523156 ?auto_523161 ) ) ( not ( = ?auto_523157 ?auto_523158 ) ) ( not ( = ?auto_523157 ?auto_523159 ) ) ( not ( = ?auto_523157 ?auto_523160 ) ) ( not ( = ?auto_523157 ?auto_523161 ) ) ( not ( = ?auto_523158 ?auto_523159 ) ) ( not ( = ?auto_523158 ?auto_523160 ) ) ( not ( = ?auto_523158 ?auto_523161 ) ) ( not ( = ?auto_523159 ?auto_523160 ) ) ( not ( = ?auto_523159 ?auto_523161 ) ) ( not ( = ?auto_523160 ?auto_523161 ) ) ( ON ?auto_523159 ?auto_523160 ) ( CLEAR ?auto_523157 ) ( ON ?auto_523158 ?auto_523159 ) ( CLEAR ?auto_523158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_523150 ?auto_523151 ?auto_523152 ?auto_523153 ?auto_523154 ?auto_523155 ?auto_523156 ?auto_523157 ?auto_523158 )
      ( MAKE-11PILE ?auto_523150 ?auto_523151 ?auto_523152 ?auto_523153 ?auto_523154 ?auto_523155 ?auto_523156 ?auto_523157 ?auto_523158 ?auto_523159 ?auto_523160 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_523196 - BLOCK
      ?auto_523197 - BLOCK
      ?auto_523198 - BLOCK
      ?auto_523199 - BLOCK
      ?auto_523200 - BLOCK
      ?auto_523201 - BLOCK
      ?auto_523202 - BLOCK
      ?auto_523203 - BLOCK
      ?auto_523204 - BLOCK
      ?auto_523205 - BLOCK
      ?auto_523206 - BLOCK
    )
    :vars
    (
      ?auto_523207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523206 ?auto_523207 ) ( ON-TABLE ?auto_523196 ) ( ON ?auto_523197 ?auto_523196 ) ( ON ?auto_523198 ?auto_523197 ) ( ON ?auto_523199 ?auto_523198 ) ( ON ?auto_523200 ?auto_523199 ) ( ON ?auto_523201 ?auto_523200 ) ( ON ?auto_523202 ?auto_523201 ) ( not ( = ?auto_523196 ?auto_523197 ) ) ( not ( = ?auto_523196 ?auto_523198 ) ) ( not ( = ?auto_523196 ?auto_523199 ) ) ( not ( = ?auto_523196 ?auto_523200 ) ) ( not ( = ?auto_523196 ?auto_523201 ) ) ( not ( = ?auto_523196 ?auto_523202 ) ) ( not ( = ?auto_523196 ?auto_523203 ) ) ( not ( = ?auto_523196 ?auto_523204 ) ) ( not ( = ?auto_523196 ?auto_523205 ) ) ( not ( = ?auto_523196 ?auto_523206 ) ) ( not ( = ?auto_523196 ?auto_523207 ) ) ( not ( = ?auto_523197 ?auto_523198 ) ) ( not ( = ?auto_523197 ?auto_523199 ) ) ( not ( = ?auto_523197 ?auto_523200 ) ) ( not ( = ?auto_523197 ?auto_523201 ) ) ( not ( = ?auto_523197 ?auto_523202 ) ) ( not ( = ?auto_523197 ?auto_523203 ) ) ( not ( = ?auto_523197 ?auto_523204 ) ) ( not ( = ?auto_523197 ?auto_523205 ) ) ( not ( = ?auto_523197 ?auto_523206 ) ) ( not ( = ?auto_523197 ?auto_523207 ) ) ( not ( = ?auto_523198 ?auto_523199 ) ) ( not ( = ?auto_523198 ?auto_523200 ) ) ( not ( = ?auto_523198 ?auto_523201 ) ) ( not ( = ?auto_523198 ?auto_523202 ) ) ( not ( = ?auto_523198 ?auto_523203 ) ) ( not ( = ?auto_523198 ?auto_523204 ) ) ( not ( = ?auto_523198 ?auto_523205 ) ) ( not ( = ?auto_523198 ?auto_523206 ) ) ( not ( = ?auto_523198 ?auto_523207 ) ) ( not ( = ?auto_523199 ?auto_523200 ) ) ( not ( = ?auto_523199 ?auto_523201 ) ) ( not ( = ?auto_523199 ?auto_523202 ) ) ( not ( = ?auto_523199 ?auto_523203 ) ) ( not ( = ?auto_523199 ?auto_523204 ) ) ( not ( = ?auto_523199 ?auto_523205 ) ) ( not ( = ?auto_523199 ?auto_523206 ) ) ( not ( = ?auto_523199 ?auto_523207 ) ) ( not ( = ?auto_523200 ?auto_523201 ) ) ( not ( = ?auto_523200 ?auto_523202 ) ) ( not ( = ?auto_523200 ?auto_523203 ) ) ( not ( = ?auto_523200 ?auto_523204 ) ) ( not ( = ?auto_523200 ?auto_523205 ) ) ( not ( = ?auto_523200 ?auto_523206 ) ) ( not ( = ?auto_523200 ?auto_523207 ) ) ( not ( = ?auto_523201 ?auto_523202 ) ) ( not ( = ?auto_523201 ?auto_523203 ) ) ( not ( = ?auto_523201 ?auto_523204 ) ) ( not ( = ?auto_523201 ?auto_523205 ) ) ( not ( = ?auto_523201 ?auto_523206 ) ) ( not ( = ?auto_523201 ?auto_523207 ) ) ( not ( = ?auto_523202 ?auto_523203 ) ) ( not ( = ?auto_523202 ?auto_523204 ) ) ( not ( = ?auto_523202 ?auto_523205 ) ) ( not ( = ?auto_523202 ?auto_523206 ) ) ( not ( = ?auto_523202 ?auto_523207 ) ) ( not ( = ?auto_523203 ?auto_523204 ) ) ( not ( = ?auto_523203 ?auto_523205 ) ) ( not ( = ?auto_523203 ?auto_523206 ) ) ( not ( = ?auto_523203 ?auto_523207 ) ) ( not ( = ?auto_523204 ?auto_523205 ) ) ( not ( = ?auto_523204 ?auto_523206 ) ) ( not ( = ?auto_523204 ?auto_523207 ) ) ( not ( = ?auto_523205 ?auto_523206 ) ) ( not ( = ?auto_523205 ?auto_523207 ) ) ( not ( = ?auto_523206 ?auto_523207 ) ) ( ON ?auto_523205 ?auto_523206 ) ( ON ?auto_523204 ?auto_523205 ) ( CLEAR ?auto_523202 ) ( ON ?auto_523203 ?auto_523204 ) ( CLEAR ?auto_523203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_523196 ?auto_523197 ?auto_523198 ?auto_523199 ?auto_523200 ?auto_523201 ?auto_523202 ?auto_523203 )
      ( MAKE-11PILE ?auto_523196 ?auto_523197 ?auto_523198 ?auto_523199 ?auto_523200 ?auto_523201 ?auto_523202 ?auto_523203 ?auto_523204 ?auto_523205 ?auto_523206 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_523242 - BLOCK
      ?auto_523243 - BLOCK
      ?auto_523244 - BLOCK
      ?auto_523245 - BLOCK
      ?auto_523246 - BLOCK
      ?auto_523247 - BLOCK
      ?auto_523248 - BLOCK
      ?auto_523249 - BLOCK
      ?auto_523250 - BLOCK
      ?auto_523251 - BLOCK
      ?auto_523252 - BLOCK
    )
    :vars
    (
      ?auto_523253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523252 ?auto_523253 ) ( ON-TABLE ?auto_523242 ) ( ON ?auto_523243 ?auto_523242 ) ( ON ?auto_523244 ?auto_523243 ) ( ON ?auto_523245 ?auto_523244 ) ( ON ?auto_523246 ?auto_523245 ) ( ON ?auto_523247 ?auto_523246 ) ( not ( = ?auto_523242 ?auto_523243 ) ) ( not ( = ?auto_523242 ?auto_523244 ) ) ( not ( = ?auto_523242 ?auto_523245 ) ) ( not ( = ?auto_523242 ?auto_523246 ) ) ( not ( = ?auto_523242 ?auto_523247 ) ) ( not ( = ?auto_523242 ?auto_523248 ) ) ( not ( = ?auto_523242 ?auto_523249 ) ) ( not ( = ?auto_523242 ?auto_523250 ) ) ( not ( = ?auto_523242 ?auto_523251 ) ) ( not ( = ?auto_523242 ?auto_523252 ) ) ( not ( = ?auto_523242 ?auto_523253 ) ) ( not ( = ?auto_523243 ?auto_523244 ) ) ( not ( = ?auto_523243 ?auto_523245 ) ) ( not ( = ?auto_523243 ?auto_523246 ) ) ( not ( = ?auto_523243 ?auto_523247 ) ) ( not ( = ?auto_523243 ?auto_523248 ) ) ( not ( = ?auto_523243 ?auto_523249 ) ) ( not ( = ?auto_523243 ?auto_523250 ) ) ( not ( = ?auto_523243 ?auto_523251 ) ) ( not ( = ?auto_523243 ?auto_523252 ) ) ( not ( = ?auto_523243 ?auto_523253 ) ) ( not ( = ?auto_523244 ?auto_523245 ) ) ( not ( = ?auto_523244 ?auto_523246 ) ) ( not ( = ?auto_523244 ?auto_523247 ) ) ( not ( = ?auto_523244 ?auto_523248 ) ) ( not ( = ?auto_523244 ?auto_523249 ) ) ( not ( = ?auto_523244 ?auto_523250 ) ) ( not ( = ?auto_523244 ?auto_523251 ) ) ( not ( = ?auto_523244 ?auto_523252 ) ) ( not ( = ?auto_523244 ?auto_523253 ) ) ( not ( = ?auto_523245 ?auto_523246 ) ) ( not ( = ?auto_523245 ?auto_523247 ) ) ( not ( = ?auto_523245 ?auto_523248 ) ) ( not ( = ?auto_523245 ?auto_523249 ) ) ( not ( = ?auto_523245 ?auto_523250 ) ) ( not ( = ?auto_523245 ?auto_523251 ) ) ( not ( = ?auto_523245 ?auto_523252 ) ) ( not ( = ?auto_523245 ?auto_523253 ) ) ( not ( = ?auto_523246 ?auto_523247 ) ) ( not ( = ?auto_523246 ?auto_523248 ) ) ( not ( = ?auto_523246 ?auto_523249 ) ) ( not ( = ?auto_523246 ?auto_523250 ) ) ( not ( = ?auto_523246 ?auto_523251 ) ) ( not ( = ?auto_523246 ?auto_523252 ) ) ( not ( = ?auto_523246 ?auto_523253 ) ) ( not ( = ?auto_523247 ?auto_523248 ) ) ( not ( = ?auto_523247 ?auto_523249 ) ) ( not ( = ?auto_523247 ?auto_523250 ) ) ( not ( = ?auto_523247 ?auto_523251 ) ) ( not ( = ?auto_523247 ?auto_523252 ) ) ( not ( = ?auto_523247 ?auto_523253 ) ) ( not ( = ?auto_523248 ?auto_523249 ) ) ( not ( = ?auto_523248 ?auto_523250 ) ) ( not ( = ?auto_523248 ?auto_523251 ) ) ( not ( = ?auto_523248 ?auto_523252 ) ) ( not ( = ?auto_523248 ?auto_523253 ) ) ( not ( = ?auto_523249 ?auto_523250 ) ) ( not ( = ?auto_523249 ?auto_523251 ) ) ( not ( = ?auto_523249 ?auto_523252 ) ) ( not ( = ?auto_523249 ?auto_523253 ) ) ( not ( = ?auto_523250 ?auto_523251 ) ) ( not ( = ?auto_523250 ?auto_523252 ) ) ( not ( = ?auto_523250 ?auto_523253 ) ) ( not ( = ?auto_523251 ?auto_523252 ) ) ( not ( = ?auto_523251 ?auto_523253 ) ) ( not ( = ?auto_523252 ?auto_523253 ) ) ( ON ?auto_523251 ?auto_523252 ) ( ON ?auto_523250 ?auto_523251 ) ( ON ?auto_523249 ?auto_523250 ) ( CLEAR ?auto_523247 ) ( ON ?auto_523248 ?auto_523249 ) ( CLEAR ?auto_523248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_523242 ?auto_523243 ?auto_523244 ?auto_523245 ?auto_523246 ?auto_523247 ?auto_523248 )
      ( MAKE-11PILE ?auto_523242 ?auto_523243 ?auto_523244 ?auto_523245 ?auto_523246 ?auto_523247 ?auto_523248 ?auto_523249 ?auto_523250 ?auto_523251 ?auto_523252 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_523288 - BLOCK
      ?auto_523289 - BLOCK
      ?auto_523290 - BLOCK
      ?auto_523291 - BLOCK
      ?auto_523292 - BLOCK
      ?auto_523293 - BLOCK
      ?auto_523294 - BLOCK
      ?auto_523295 - BLOCK
      ?auto_523296 - BLOCK
      ?auto_523297 - BLOCK
      ?auto_523298 - BLOCK
    )
    :vars
    (
      ?auto_523299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523298 ?auto_523299 ) ( ON-TABLE ?auto_523288 ) ( ON ?auto_523289 ?auto_523288 ) ( ON ?auto_523290 ?auto_523289 ) ( ON ?auto_523291 ?auto_523290 ) ( ON ?auto_523292 ?auto_523291 ) ( not ( = ?auto_523288 ?auto_523289 ) ) ( not ( = ?auto_523288 ?auto_523290 ) ) ( not ( = ?auto_523288 ?auto_523291 ) ) ( not ( = ?auto_523288 ?auto_523292 ) ) ( not ( = ?auto_523288 ?auto_523293 ) ) ( not ( = ?auto_523288 ?auto_523294 ) ) ( not ( = ?auto_523288 ?auto_523295 ) ) ( not ( = ?auto_523288 ?auto_523296 ) ) ( not ( = ?auto_523288 ?auto_523297 ) ) ( not ( = ?auto_523288 ?auto_523298 ) ) ( not ( = ?auto_523288 ?auto_523299 ) ) ( not ( = ?auto_523289 ?auto_523290 ) ) ( not ( = ?auto_523289 ?auto_523291 ) ) ( not ( = ?auto_523289 ?auto_523292 ) ) ( not ( = ?auto_523289 ?auto_523293 ) ) ( not ( = ?auto_523289 ?auto_523294 ) ) ( not ( = ?auto_523289 ?auto_523295 ) ) ( not ( = ?auto_523289 ?auto_523296 ) ) ( not ( = ?auto_523289 ?auto_523297 ) ) ( not ( = ?auto_523289 ?auto_523298 ) ) ( not ( = ?auto_523289 ?auto_523299 ) ) ( not ( = ?auto_523290 ?auto_523291 ) ) ( not ( = ?auto_523290 ?auto_523292 ) ) ( not ( = ?auto_523290 ?auto_523293 ) ) ( not ( = ?auto_523290 ?auto_523294 ) ) ( not ( = ?auto_523290 ?auto_523295 ) ) ( not ( = ?auto_523290 ?auto_523296 ) ) ( not ( = ?auto_523290 ?auto_523297 ) ) ( not ( = ?auto_523290 ?auto_523298 ) ) ( not ( = ?auto_523290 ?auto_523299 ) ) ( not ( = ?auto_523291 ?auto_523292 ) ) ( not ( = ?auto_523291 ?auto_523293 ) ) ( not ( = ?auto_523291 ?auto_523294 ) ) ( not ( = ?auto_523291 ?auto_523295 ) ) ( not ( = ?auto_523291 ?auto_523296 ) ) ( not ( = ?auto_523291 ?auto_523297 ) ) ( not ( = ?auto_523291 ?auto_523298 ) ) ( not ( = ?auto_523291 ?auto_523299 ) ) ( not ( = ?auto_523292 ?auto_523293 ) ) ( not ( = ?auto_523292 ?auto_523294 ) ) ( not ( = ?auto_523292 ?auto_523295 ) ) ( not ( = ?auto_523292 ?auto_523296 ) ) ( not ( = ?auto_523292 ?auto_523297 ) ) ( not ( = ?auto_523292 ?auto_523298 ) ) ( not ( = ?auto_523292 ?auto_523299 ) ) ( not ( = ?auto_523293 ?auto_523294 ) ) ( not ( = ?auto_523293 ?auto_523295 ) ) ( not ( = ?auto_523293 ?auto_523296 ) ) ( not ( = ?auto_523293 ?auto_523297 ) ) ( not ( = ?auto_523293 ?auto_523298 ) ) ( not ( = ?auto_523293 ?auto_523299 ) ) ( not ( = ?auto_523294 ?auto_523295 ) ) ( not ( = ?auto_523294 ?auto_523296 ) ) ( not ( = ?auto_523294 ?auto_523297 ) ) ( not ( = ?auto_523294 ?auto_523298 ) ) ( not ( = ?auto_523294 ?auto_523299 ) ) ( not ( = ?auto_523295 ?auto_523296 ) ) ( not ( = ?auto_523295 ?auto_523297 ) ) ( not ( = ?auto_523295 ?auto_523298 ) ) ( not ( = ?auto_523295 ?auto_523299 ) ) ( not ( = ?auto_523296 ?auto_523297 ) ) ( not ( = ?auto_523296 ?auto_523298 ) ) ( not ( = ?auto_523296 ?auto_523299 ) ) ( not ( = ?auto_523297 ?auto_523298 ) ) ( not ( = ?auto_523297 ?auto_523299 ) ) ( not ( = ?auto_523298 ?auto_523299 ) ) ( ON ?auto_523297 ?auto_523298 ) ( ON ?auto_523296 ?auto_523297 ) ( ON ?auto_523295 ?auto_523296 ) ( ON ?auto_523294 ?auto_523295 ) ( CLEAR ?auto_523292 ) ( ON ?auto_523293 ?auto_523294 ) ( CLEAR ?auto_523293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_523288 ?auto_523289 ?auto_523290 ?auto_523291 ?auto_523292 ?auto_523293 )
      ( MAKE-11PILE ?auto_523288 ?auto_523289 ?auto_523290 ?auto_523291 ?auto_523292 ?auto_523293 ?auto_523294 ?auto_523295 ?auto_523296 ?auto_523297 ?auto_523298 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_523334 - BLOCK
      ?auto_523335 - BLOCK
      ?auto_523336 - BLOCK
      ?auto_523337 - BLOCK
      ?auto_523338 - BLOCK
      ?auto_523339 - BLOCK
      ?auto_523340 - BLOCK
      ?auto_523341 - BLOCK
      ?auto_523342 - BLOCK
      ?auto_523343 - BLOCK
      ?auto_523344 - BLOCK
    )
    :vars
    (
      ?auto_523345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523344 ?auto_523345 ) ( ON-TABLE ?auto_523334 ) ( ON ?auto_523335 ?auto_523334 ) ( ON ?auto_523336 ?auto_523335 ) ( ON ?auto_523337 ?auto_523336 ) ( not ( = ?auto_523334 ?auto_523335 ) ) ( not ( = ?auto_523334 ?auto_523336 ) ) ( not ( = ?auto_523334 ?auto_523337 ) ) ( not ( = ?auto_523334 ?auto_523338 ) ) ( not ( = ?auto_523334 ?auto_523339 ) ) ( not ( = ?auto_523334 ?auto_523340 ) ) ( not ( = ?auto_523334 ?auto_523341 ) ) ( not ( = ?auto_523334 ?auto_523342 ) ) ( not ( = ?auto_523334 ?auto_523343 ) ) ( not ( = ?auto_523334 ?auto_523344 ) ) ( not ( = ?auto_523334 ?auto_523345 ) ) ( not ( = ?auto_523335 ?auto_523336 ) ) ( not ( = ?auto_523335 ?auto_523337 ) ) ( not ( = ?auto_523335 ?auto_523338 ) ) ( not ( = ?auto_523335 ?auto_523339 ) ) ( not ( = ?auto_523335 ?auto_523340 ) ) ( not ( = ?auto_523335 ?auto_523341 ) ) ( not ( = ?auto_523335 ?auto_523342 ) ) ( not ( = ?auto_523335 ?auto_523343 ) ) ( not ( = ?auto_523335 ?auto_523344 ) ) ( not ( = ?auto_523335 ?auto_523345 ) ) ( not ( = ?auto_523336 ?auto_523337 ) ) ( not ( = ?auto_523336 ?auto_523338 ) ) ( not ( = ?auto_523336 ?auto_523339 ) ) ( not ( = ?auto_523336 ?auto_523340 ) ) ( not ( = ?auto_523336 ?auto_523341 ) ) ( not ( = ?auto_523336 ?auto_523342 ) ) ( not ( = ?auto_523336 ?auto_523343 ) ) ( not ( = ?auto_523336 ?auto_523344 ) ) ( not ( = ?auto_523336 ?auto_523345 ) ) ( not ( = ?auto_523337 ?auto_523338 ) ) ( not ( = ?auto_523337 ?auto_523339 ) ) ( not ( = ?auto_523337 ?auto_523340 ) ) ( not ( = ?auto_523337 ?auto_523341 ) ) ( not ( = ?auto_523337 ?auto_523342 ) ) ( not ( = ?auto_523337 ?auto_523343 ) ) ( not ( = ?auto_523337 ?auto_523344 ) ) ( not ( = ?auto_523337 ?auto_523345 ) ) ( not ( = ?auto_523338 ?auto_523339 ) ) ( not ( = ?auto_523338 ?auto_523340 ) ) ( not ( = ?auto_523338 ?auto_523341 ) ) ( not ( = ?auto_523338 ?auto_523342 ) ) ( not ( = ?auto_523338 ?auto_523343 ) ) ( not ( = ?auto_523338 ?auto_523344 ) ) ( not ( = ?auto_523338 ?auto_523345 ) ) ( not ( = ?auto_523339 ?auto_523340 ) ) ( not ( = ?auto_523339 ?auto_523341 ) ) ( not ( = ?auto_523339 ?auto_523342 ) ) ( not ( = ?auto_523339 ?auto_523343 ) ) ( not ( = ?auto_523339 ?auto_523344 ) ) ( not ( = ?auto_523339 ?auto_523345 ) ) ( not ( = ?auto_523340 ?auto_523341 ) ) ( not ( = ?auto_523340 ?auto_523342 ) ) ( not ( = ?auto_523340 ?auto_523343 ) ) ( not ( = ?auto_523340 ?auto_523344 ) ) ( not ( = ?auto_523340 ?auto_523345 ) ) ( not ( = ?auto_523341 ?auto_523342 ) ) ( not ( = ?auto_523341 ?auto_523343 ) ) ( not ( = ?auto_523341 ?auto_523344 ) ) ( not ( = ?auto_523341 ?auto_523345 ) ) ( not ( = ?auto_523342 ?auto_523343 ) ) ( not ( = ?auto_523342 ?auto_523344 ) ) ( not ( = ?auto_523342 ?auto_523345 ) ) ( not ( = ?auto_523343 ?auto_523344 ) ) ( not ( = ?auto_523343 ?auto_523345 ) ) ( not ( = ?auto_523344 ?auto_523345 ) ) ( ON ?auto_523343 ?auto_523344 ) ( ON ?auto_523342 ?auto_523343 ) ( ON ?auto_523341 ?auto_523342 ) ( ON ?auto_523340 ?auto_523341 ) ( ON ?auto_523339 ?auto_523340 ) ( CLEAR ?auto_523337 ) ( ON ?auto_523338 ?auto_523339 ) ( CLEAR ?auto_523338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_523334 ?auto_523335 ?auto_523336 ?auto_523337 ?auto_523338 )
      ( MAKE-11PILE ?auto_523334 ?auto_523335 ?auto_523336 ?auto_523337 ?auto_523338 ?auto_523339 ?auto_523340 ?auto_523341 ?auto_523342 ?auto_523343 ?auto_523344 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_523380 - BLOCK
      ?auto_523381 - BLOCK
      ?auto_523382 - BLOCK
      ?auto_523383 - BLOCK
      ?auto_523384 - BLOCK
      ?auto_523385 - BLOCK
      ?auto_523386 - BLOCK
      ?auto_523387 - BLOCK
      ?auto_523388 - BLOCK
      ?auto_523389 - BLOCK
      ?auto_523390 - BLOCK
    )
    :vars
    (
      ?auto_523391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523390 ?auto_523391 ) ( ON-TABLE ?auto_523380 ) ( ON ?auto_523381 ?auto_523380 ) ( ON ?auto_523382 ?auto_523381 ) ( not ( = ?auto_523380 ?auto_523381 ) ) ( not ( = ?auto_523380 ?auto_523382 ) ) ( not ( = ?auto_523380 ?auto_523383 ) ) ( not ( = ?auto_523380 ?auto_523384 ) ) ( not ( = ?auto_523380 ?auto_523385 ) ) ( not ( = ?auto_523380 ?auto_523386 ) ) ( not ( = ?auto_523380 ?auto_523387 ) ) ( not ( = ?auto_523380 ?auto_523388 ) ) ( not ( = ?auto_523380 ?auto_523389 ) ) ( not ( = ?auto_523380 ?auto_523390 ) ) ( not ( = ?auto_523380 ?auto_523391 ) ) ( not ( = ?auto_523381 ?auto_523382 ) ) ( not ( = ?auto_523381 ?auto_523383 ) ) ( not ( = ?auto_523381 ?auto_523384 ) ) ( not ( = ?auto_523381 ?auto_523385 ) ) ( not ( = ?auto_523381 ?auto_523386 ) ) ( not ( = ?auto_523381 ?auto_523387 ) ) ( not ( = ?auto_523381 ?auto_523388 ) ) ( not ( = ?auto_523381 ?auto_523389 ) ) ( not ( = ?auto_523381 ?auto_523390 ) ) ( not ( = ?auto_523381 ?auto_523391 ) ) ( not ( = ?auto_523382 ?auto_523383 ) ) ( not ( = ?auto_523382 ?auto_523384 ) ) ( not ( = ?auto_523382 ?auto_523385 ) ) ( not ( = ?auto_523382 ?auto_523386 ) ) ( not ( = ?auto_523382 ?auto_523387 ) ) ( not ( = ?auto_523382 ?auto_523388 ) ) ( not ( = ?auto_523382 ?auto_523389 ) ) ( not ( = ?auto_523382 ?auto_523390 ) ) ( not ( = ?auto_523382 ?auto_523391 ) ) ( not ( = ?auto_523383 ?auto_523384 ) ) ( not ( = ?auto_523383 ?auto_523385 ) ) ( not ( = ?auto_523383 ?auto_523386 ) ) ( not ( = ?auto_523383 ?auto_523387 ) ) ( not ( = ?auto_523383 ?auto_523388 ) ) ( not ( = ?auto_523383 ?auto_523389 ) ) ( not ( = ?auto_523383 ?auto_523390 ) ) ( not ( = ?auto_523383 ?auto_523391 ) ) ( not ( = ?auto_523384 ?auto_523385 ) ) ( not ( = ?auto_523384 ?auto_523386 ) ) ( not ( = ?auto_523384 ?auto_523387 ) ) ( not ( = ?auto_523384 ?auto_523388 ) ) ( not ( = ?auto_523384 ?auto_523389 ) ) ( not ( = ?auto_523384 ?auto_523390 ) ) ( not ( = ?auto_523384 ?auto_523391 ) ) ( not ( = ?auto_523385 ?auto_523386 ) ) ( not ( = ?auto_523385 ?auto_523387 ) ) ( not ( = ?auto_523385 ?auto_523388 ) ) ( not ( = ?auto_523385 ?auto_523389 ) ) ( not ( = ?auto_523385 ?auto_523390 ) ) ( not ( = ?auto_523385 ?auto_523391 ) ) ( not ( = ?auto_523386 ?auto_523387 ) ) ( not ( = ?auto_523386 ?auto_523388 ) ) ( not ( = ?auto_523386 ?auto_523389 ) ) ( not ( = ?auto_523386 ?auto_523390 ) ) ( not ( = ?auto_523386 ?auto_523391 ) ) ( not ( = ?auto_523387 ?auto_523388 ) ) ( not ( = ?auto_523387 ?auto_523389 ) ) ( not ( = ?auto_523387 ?auto_523390 ) ) ( not ( = ?auto_523387 ?auto_523391 ) ) ( not ( = ?auto_523388 ?auto_523389 ) ) ( not ( = ?auto_523388 ?auto_523390 ) ) ( not ( = ?auto_523388 ?auto_523391 ) ) ( not ( = ?auto_523389 ?auto_523390 ) ) ( not ( = ?auto_523389 ?auto_523391 ) ) ( not ( = ?auto_523390 ?auto_523391 ) ) ( ON ?auto_523389 ?auto_523390 ) ( ON ?auto_523388 ?auto_523389 ) ( ON ?auto_523387 ?auto_523388 ) ( ON ?auto_523386 ?auto_523387 ) ( ON ?auto_523385 ?auto_523386 ) ( ON ?auto_523384 ?auto_523385 ) ( CLEAR ?auto_523382 ) ( ON ?auto_523383 ?auto_523384 ) ( CLEAR ?auto_523383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_523380 ?auto_523381 ?auto_523382 ?auto_523383 )
      ( MAKE-11PILE ?auto_523380 ?auto_523381 ?auto_523382 ?auto_523383 ?auto_523384 ?auto_523385 ?auto_523386 ?auto_523387 ?auto_523388 ?auto_523389 ?auto_523390 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_523426 - BLOCK
      ?auto_523427 - BLOCK
      ?auto_523428 - BLOCK
      ?auto_523429 - BLOCK
      ?auto_523430 - BLOCK
      ?auto_523431 - BLOCK
      ?auto_523432 - BLOCK
      ?auto_523433 - BLOCK
      ?auto_523434 - BLOCK
      ?auto_523435 - BLOCK
      ?auto_523436 - BLOCK
    )
    :vars
    (
      ?auto_523437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523436 ?auto_523437 ) ( ON-TABLE ?auto_523426 ) ( ON ?auto_523427 ?auto_523426 ) ( not ( = ?auto_523426 ?auto_523427 ) ) ( not ( = ?auto_523426 ?auto_523428 ) ) ( not ( = ?auto_523426 ?auto_523429 ) ) ( not ( = ?auto_523426 ?auto_523430 ) ) ( not ( = ?auto_523426 ?auto_523431 ) ) ( not ( = ?auto_523426 ?auto_523432 ) ) ( not ( = ?auto_523426 ?auto_523433 ) ) ( not ( = ?auto_523426 ?auto_523434 ) ) ( not ( = ?auto_523426 ?auto_523435 ) ) ( not ( = ?auto_523426 ?auto_523436 ) ) ( not ( = ?auto_523426 ?auto_523437 ) ) ( not ( = ?auto_523427 ?auto_523428 ) ) ( not ( = ?auto_523427 ?auto_523429 ) ) ( not ( = ?auto_523427 ?auto_523430 ) ) ( not ( = ?auto_523427 ?auto_523431 ) ) ( not ( = ?auto_523427 ?auto_523432 ) ) ( not ( = ?auto_523427 ?auto_523433 ) ) ( not ( = ?auto_523427 ?auto_523434 ) ) ( not ( = ?auto_523427 ?auto_523435 ) ) ( not ( = ?auto_523427 ?auto_523436 ) ) ( not ( = ?auto_523427 ?auto_523437 ) ) ( not ( = ?auto_523428 ?auto_523429 ) ) ( not ( = ?auto_523428 ?auto_523430 ) ) ( not ( = ?auto_523428 ?auto_523431 ) ) ( not ( = ?auto_523428 ?auto_523432 ) ) ( not ( = ?auto_523428 ?auto_523433 ) ) ( not ( = ?auto_523428 ?auto_523434 ) ) ( not ( = ?auto_523428 ?auto_523435 ) ) ( not ( = ?auto_523428 ?auto_523436 ) ) ( not ( = ?auto_523428 ?auto_523437 ) ) ( not ( = ?auto_523429 ?auto_523430 ) ) ( not ( = ?auto_523429 ?auto_523431 ) ) ( not ( = ?auto_523429 ?auto_523432 ) ) ( not ( = ?auto_523429 ?auto_523433 ) ) ( not ( = ?auto_523429 ?auto_523434 ) ) ( not ( = ?auto_523429 ?auto_523435 ) ) ( not ( = ?auto_523429 ?auto_523436 ) ) ( not ( = ?auto_523429 ?auto_523437 ) ) ( not ( = ?auto_523430 ?auto_523431 ) ) ( not ( = ?auto_523430 ?auto_523432 ) ) ( not ( = ?auto_523430 ?auto_523433 ) ) ( not ( = ?auto_523430 ?auto_523434 ) ) ( not ( = ?auto_523430 ?auto_523435 ) ) ( not ( = ?auto_523430 ?auto_523436 ) ) ( not ( = ?auto_523430 ?auto_523437 ) ) ( not ( = ?auto_523431 ?auto_523432 ) ) ( not ( = ?auto_523431 ?auto_523433 ) ) ( not ( = ?auto_523431 ?auto_523434 ) ) ( not ( = ?auto_523431 ?auto_523435 ) ) ( not ( = ?auto_523431 ?auto_523436 ) ) ( not ( = ?auto_523431 ?auto_523437 ) ) ( not ( = ?auto_523432 ?auto_523433 ) ) ( not ( = ?auto_523432 ?auto_523434 ) ) ( not ( = ?auto_523432 ?auto_523435 ) ) ( not ( = ?auto_523432 ?auto_523436 ) ) ( not ( = ?auto_523432 ?auto_523437 ) ) ( not ( = ?auto_523433 ?auto_523434 ) ) ( not ( = ?auto_523433 ?auto_523435 ) ) ( not ( = ?auto_523433 ?auto_523436 ) ) ( not ( = ?auto_523433 ?auto_523437 ) ) ( not ( = ?auto_523434 ?auto_523435 ) ) ( not ( = ?auto_523434 ?auto_523436 ) ) ( not ( = ?auto_523434 ?auto_523437 ) ) ( not ( = ?auto_523435 ?auto_523436 ) ) ( not ( = ?auto_523435 ?auto_523437 ) ) ( not ( = ?auto_523436 ?auto_523437 ) ) ( ON ?auto_523435 ?auto_523436 ) ( ON ?auto_523434 ?auto_523435 ) ( ON ?auto_523433 ?auto_523434 ) ( ON ?auto_523432 ?auto_523433 ) ( ON ?auto_523431 ?auto_523432 ) ( ON ?auto_523430 ?auto_523431 ) ( ON ?auto_523429 ?auto_523430 ) ( CLEAR ?auto_523427 ) ( ON ?auto_523428 ?auto_523429 ) ( CLEAR ?auto_523428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_523426 ?auto_523427 ?auto_523428 )
      ( MAKE-11PILE ?auto_523426 ?auto_523427 ?auto_523428 ?auto_523429 ?auto_523430 ?auto_523431 ?auto_523432 ?auto_523433 ?auto_523434 ?auto_523435 ?auto_523436 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_523472 - BLOCK
      ?auto_523473 - BLOCK
      ?auto_523474 - BLOCK
      ?auto_523475 - BLOCK
      ?auto_523476 - BLOCK
      ?auto_523477 - BLOCK
      ?auto_523478 - BLOCK
      ?auto_523479 - BLOCK
      ?auto_523480 - BLOCK
      ?auto_523481 - BLOCK
      ?auto_523482 - BLOCK
    )
    :vars
    (
      ?auto_523483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523482 ?auto_523483 ) ( ON-TABLE ?auto_523472 ) ( not ( = ?auto_523472 ?auto_523473 ) ) ( not ( = ?auto_523472 ?auto_523474 ) ) ( not ( = ?auto_523472 ?auto_523475 ) ) ( not ( = ?auto_523472 ?auto_523476 ) ) ( not ( = ?auto_523472 ?auto_523477 ) ) ( not ( = ?auto_523472 ?auto_523478 ) ) ( not ( = ?auto_523472 ?auto_523479 ) ) ( not ( = ?auto_523472 ?auto_523480 ) ) ( not ( = ?auto_523472 ?auto_523481 ) ) ( not ( = ?auto_523472 ?auto_523482 ) ) ( not ( = ?auto_523472 ?auto_523483 ) ) ( not ( = ?auto_523473 ?auto_523474 ) ) ( not ( = ?auto_523473 ?auto_523475 ) ) ( not ( = ?auto_523473 ?auto_523476 ) ) ( not ( = ?auto_523473 ?auto_523477 ) ) ( not ( = ?auto_523473 ?auto_523478 ) ) ( not ( = ?auto_523473 ?auto_523479 ) ) ( not ( = ?auto_523473 ?auto_523480 ) ) ( not ( = ?auto_523473 ?auto_523481 ) ) ( not ( = ?auto_523473 ?auto_523482 ) ) ( not ( = ?auto_523473 ?auto_523483 ) ) ( not ( = ?auto_523474 ?auto_523475 ) ) ( not ( = ?auto_523474 ?auto_523476 ) ) ( not ( = ?auto_523474 ?auto_523477 ) ) ( not ( = ?auto_523474 ?auto_523478 ) ) ( not ( = ?auto_523474 ?auto_523479 ) ) ( not ( = ?auto_523474 ?auto_523480 ) ) ( not ( = ?auto_523474 ?auto_523481 ) ) ( not ( = ?auto_523474 ?auto_523482 ) ) ( not ( = ?auto_523474 ?auto_523483 ) ) ( not ( = ?auto_523475 ?auto_523476 ) ) ( not ( = ?auto_523475 ?auto_523477 ) ) ( not ( = ?auto_523475 ?auto_523478 ) ) ( not ( = ?auto_523475 ?auto_523479 ) ) ( not ( = ?auto_523475 ?auto_523480 ) ) ( not ( = ?auto_523475 ?auto_523481 ) ) ( not ( = ?auto_523475 ?auto_523482 ) ) ( not ( = ?auto_523475 ?auto_523483 ) ) ( not ( = ?auto_523476 ?auto_523477 ) ) ( not ( = ?auto_523476 ?auto_523478 ) ) ( not ( = ?auto_523476 ?auto_523479 ) ) ( not ( = ?auto_523476 ?auto_523480 ) ) ( not ( = ?auto_523476 ?auto_523481 ) ) ( not ( = ?auto_523476 ?auto_523482 ) ) ( not ( = ?auto_523476 ?auto_523483 ) ) ( not ( = ?auto_523477 ?auto_523478 ) ) ( not ( = ?auto_523477 ?auto_523479 ) ) ( not ( = ?auto_523477 ?auto_523480 ) ) ( not ( = ?auto_523477 ?auto_523481 ) ) ( not ( = ?auto_523477 ?auto_523482 ) ) ( not ( = ?auto_523477 ?auto_523483 ) ) ( not ( = ?auto_523478 ?auto_523479 ) ) ( not ( = ?auto_523478 ?auto_523480 ) ) ( not ( = ?auto_523478 ?auto_523481 ) ) ( not ( = ?auto_523478 ?auto_523482 ) ) ( not ( = ?auto_523478 ?auto_523483 ) ) ( not ( = ?auto_523479 ?auto_523480 ) ) ( not ( = ?auto_523479 ?auto_523481 ) ) ( not ( = ?auto_523479 ?auto_523482 ) ) ( not ( = ?auto_523479 ?auto_523483 ) ) ( not ( = ?auto_523480 ?auto_523481 ) ) ( not ( = ?auto_523480 ?auto_523482 ) ) ( not ( = ?auto_523480 ?auto_523483 ) ) ( not ( = ?auto_523481 ?auto_523482 ) ) ( not ( = ?auto_523481 ?auto_523483 ) ) ( not ( = ?auto_523482 ?auto_523483 ) ) ( ON ?auto_523481 ?auto_523482 ) ( ON ?auto_523480 ?auto_523481 ) ( ON ?auto_523479 ?auto_523480 ) ( ON ?auto_523478 ?auto_523479 ) ( ON ?auto_523477 ?auto_523478 ) ( ON ?auto_523476 ?auto_523477 ) ( ON ?auto_523475 ?auto_523476 ) ( ON ?auto_523474 ?auto_523475 ) ( CLEAR ?auto_523472 ) ( ON ?auto_523473 ?auto_523474 ) ( CLEAR ?auto_523473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_523472 ?auto_523473 )
      ( MAKE-11PILE ?auto_523472 ?auto_523473 ?auto_523474 ?auto_523475 ?auto_523476 ?auto_523477 ?auto_523478 ?auto_523479 ?auto_523480 ?auto_523481 ?auto_523482 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_523518 - BLOCK
      ?auto_523519 - BLOCK
      ?auto_523520 - BLOCK
      ?auto_523521 - BLOCK
      ?auto_523522 - BLOCK
      ?auto_523523 - BLOCK
      ?auto_523524 - BLOCK
      ?auto_523525 - BLOCK
      ?auto_523526 - BLOCK
      ?auto_523527 - BLOCK
      ?auto_523528 - BLOCK
    )
    :vars
    (
      ?auto_523529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523528 ?auto_523529 ) ( not ( = ?auto_523518 ?auto_523519 ) ) ( not ( = ?auto_523518 ?auto_523520 ) ) ( not ( = ?auto_523518 ?auto_523521 ) ) ( not ( = ?auto_523518 ?auto_523522 ) ) ( not ( = ?auto_523518 ?auto_523523 ) ) ( not ( = ?auto_523518 ?auto_523524 ) ) ( not ( = ?auto_523518 ?auto_523525 ) ) ( not ( = ?auto_523518 ?auto_523526 ) ) ( not ( = ?auto_523518 ?auto_523527 ) ) ( not ( = ?auto_523518 ?auto_523528 ) ) ( not ( = ?auto_523518 ?auto_523529 ) ) ( not ( = ?auto_523519 ?auto_523520 ) ) ( not ( = ?auto_523519 ?auto_523521 ) ) ( not ( = ?auto_523519 ?auto_523522 ) ) ( not ( = ?auto_523519 ?auto_523523 ) ) ( not ( = ?auto_523519 ?auto_523524 ) ) ( not ( = ?auto_523519 ?auto_523525 ) ) ( not ( = ?auto_523519 ?auto_523526 ) ) ( not ( = ?auto_523519 ?auto_523527 ) ) ( not ( = ?auto_523519 ?auto_523528 ) ) ( not ( = ?auto_523519 ?auto_523529 ) ) ( not ( = ?auto_523520 ?auto_523521 ) ) ( not ( = ?auto_523520 ?auto_523522 ) ) ( not ( = ?auto_523520 ?auto_523523 ) ) ( not ( = ?auto_523520 ?auto_523524 ) ) ( not ( = ?auto_523520 ?auto_523525 ) ) ( not ( = ?auto_523520 ?auto_523526 ) ) ( not ( = ?auto_523520 ?auto_523527 ) ) ( not ( = ?auto_523520 ?auto_523528 ) ) ( not ( = ?auto_523520 ?auto_523529 ) ) ( not ( = ?auto_523521 ?auto_523522 ) ) ( not ( = ?auto_523521 ?auto_523523 ) ) ( not ( = ?auto_523521 ?auto_523524 ) ) ( not ( = ?auto_523521 ?auto_523525 ) ) ( not ( = ?auto_523521 ?auto_523526 ) ) ( not ( = ?auto_523521 ?auto_523527 ) ) ( not ( = ?auto_523521 ?auto_523528 ) ) ( not ( = ?auto_523521 ?auto_523529 ) ) ( not ( = ?auto_523522 ?auto_523523 ) ) ( not ( = ?auto_523522 ?auto_523524 ) ) ( not ( = ?auto_523522 ?auto_523525 ) ) ( not ( = ?auto_523522 ?auto_523526 ) ) ( not ( = ?auto_523522 ?auto_523527 ) ) ( not ( = ?auto_523522 ?auto_523528 ) ) ( not ( = ?auto_523522 ?auto_523529 ) ) ( not ( = ?auto_523523 ?auto_523524 ) ) ( not ( = ?auto_523523 ?auto_523525 ) ) ( not ( = ?auto_523523 ?auto_523526 ) ) ( not ( = ?auto_523523 ?auto_523527 ) ) ( not ( = ?auto_523523 ?auto_523528 ) ) ( not ( = ?auto_523523 ?auto_523529 ) ) ( not ( = ?auto_523524 ?auto_523525 ) ) ( not ( = ?auto_523524 ?auto_523526 ) ) ( not ( = ?auto_523524 ?auto_523527 ) ) ( not ( = ?auto_523524 ?auto_523528 ) ) ( not ( = ?auto_523524 ?auto_523529 ) ) ( not ( = ?auto_523525 ?auto_523526 ) ) ( not ( = ?auto_523525 ?auto_523527 ) ) ( not ( = ?auto_523525 ?auto_523528 ) ) ( not ( = ?auto_523525 ?auto_523529 ) ) ( not ( = ?auto_523526 ?auto_523527 ) ) ( not ( = ?auto_523526 ?auto_523528 ) ) ( not ( = ?auto_523526 ?auto_523529 ) ) ( not ( = ?auto_523527 ?auto_523528 ) ) ( not ( = ?auto_523527 ?auto_523529 ) ) ( not ( = ?auto_523528 ?auto_523529 ) ) ( ON ?auto_523527 ?auto_523528 ) ( ON ?auto_523526 ?auto_523527 ) ( ON ?auto_523525 ?auto_523526 ) ( ON ?auto_523524 ?auto_523525 ) ( ON ?auto_523523 ?auto_523524 ) ( ON ?auto_523522 ?auto_523523 ) ( ON ?auto_523521 ?auto_523522 ) ( ON ?auto_523520 ?auto_523521 ) ( ON ?auto_523519 ?auto_523520 ) ( ON ?auto_523518 ?auto_523519 ) ( CLEAR ?auto_523518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_523518 )
      ( MAKE-11PILE ?auto_523518 ?auto_523519 ?auto_523520 ?auto_523521 ?auto_523522 ?auto_523523 ?auto_523524 ?auto_523525 ?auto_523526 ?auto_523527 ?auto_523528 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_523565 - BLOCK
      ?auto_523566 - BLOCK
      ?auto_523567 - BLOCK
      ?auto_523568 - BLOCK
      ?auto_523569 - BLOCK
      ?auto_523570 - BLOCK
      ?auto_523571 - BLOCK
      ?auto_523572 - BLOCK
      ?auto_523573 - BLOCK
      ?auto_523574 - BLOCK
      ?auto_523575 - BLOCK
      ?auto_523576 - BLOCK
    )
    :vars
    (
      ?auto_523577 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_523575 ) ( ON ?auto_523576 ?auto_523577 ) ( CLEAR ?auto_523576 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_523565 ) ( ON ?auto_523566 ?auto_523565 ) ( ON ?auto_523567 ?auto_523566 ) ( ON ?auto_523568 ?auto_523567 ) ( ON ?auto_523569 ?auto_523568 ) ( ON ?auto_523570 ?auto_523569 ) ( ON ?auto_523571 ?auto_523570 ) ( ON ?auto_523572 ?auto_523571 ) ( ON ?auto_523573 ?auto_523572 ) ( ON ?auto_523574 ?auto_523573 ) ( ON ?auto_523575 ?auto_523574 ) ( not ( = ?auto_523565 ?auto_523566 ) ) ( not ( = ?auto_523565 ?auto_523567 ) ) ( not ( = ?auto_523565 ?auto_523568 ) ) ( not ( = ?auto_523565 ?auto_523569 ) ) ( not ( = ?auto_523565 ?auto_523570 ) ) ( not ( = ?auto_523565 ?auto_523571 ) ) ( not ( = ?auto_523565 ?auto_523572 ) ) ( not ( = ?auto_523565 ?auto_523573 ) ) ( not ( = ?auto_523565 ?auto_523574 ) ) ( not ( = ?auto_523565 ?auto_523575 ) ) ( not ( = ?auto_523565 ?auto_523576 ) ) ( not ( = ?auto_523565 ?auto_523577 ) ) ( not ( = ?auto_523566 ?auto_523567 ) ) ( not ( = ?auto_523566 ?auto_523568 ) ) ( not ( = ?auto_523566 ?auto_523569 ) ) ( not ( = ?auto_523566 ?auto_523570 ) ) ( not ( = ?auto_523566 ?auto_523571 ) ) ( not ( = ?auto_523566 ?auto_523572 ) ) ( not ( = ?auto_523566 ?auto_523573 ) ) ( not ( = ?auto_523566 ?auto_523574 ) ) ( not ( = ?auto_523566 ?auto_523575 ) ) ( not ( = ?auto_523566 ?auto_523576 ) ) ( not ( = ?auto_523566 ?auto_523577 ) ) ( not ( = ?auto_523567 ?auto_523568 ) ) ( not ( = ?auto_523567 ?auto_523569 ) ) ( not ( = ?auto_523567 ?auto_523570 ) ) ( not ( = ?auto_523567 ?auto_523571 ) ) ( not ( = ?auto_523567 ?auto_523572 ) ) ( not ( = ?auto_523567 ?auto_523573 ) ) ( not ( = ?auto_523567 ?auto_523574 ) ) ( not ( = ?auto_523567 ?auto_523575 ) ) ( not ( = ?auto_523567 ?auto_523576 ) ) ( not ( = ?auto_523567 ?auto_523577 ) ) ( not ( = ?auto_523568 ?auto_523569 ) ) ( not ( = ?auto_523568 ?auto_523570 ) ) ( not ( = ?auto_523568 ?auto_523571 ) ) ( not ( = ?auto_523568 ?auto_523572 ) ) ( not ( = ?auto_523568 ?auto_523573 ) ) ( not ( = ?auto_523568 ?auto_523574 ) ) ( not ( = ?auto_523568 ?auto_523575 ) ) ( not ( = ?auto_523568 ?auto_523576 ) ) ( not ( = ?auto_523568 ?auto_523577 ) ) ( not ( = ?auto_523569 ?auto_523570 ) ) ( not ( = ?auto_523569 ?auto_523571 ) ) ( not ( = ?auto_523569 ?auto_523572 ) ) ( not ( = ?auto_523569 ?auto_523573 ) ) ( not ( = ?auto_523569 ?auto_523574 ) ) ( not ( = ?auto_523569 ?auto_523575 ) ) ( not ( = ?auto_523569 ?auto_523576 ) ) ( not ( = ?auto_523569 ?auto_523577 ) ) ( not ( = ?auto_523570 ?auto_523571 ) ) ( not ( = ?auto_523570 ?auto_523572 ) ) ( not ( = ?auto_523570 ?auto_523573 ) ) ( not ( = ?auto_523570 ?auto_523574 ) ) ( not ( = ?auto_523570 ?auto_523575 ) ) ( not ( = ?auto_523570 ?auto_523576 ) ) ( not ( = ?auto_523570 ?auto_523577 ) ) ( not ( = ?auto_523571 ?auto_523572 ) ) ( not ( = ?auto_523571 ?auto_523573 ) ) ( not ( = ?auto_523571 ?auto_523574 ) ) ( not ( = ?auto_523571 ?auto_523575 ) ) ( not ( = ?auto_523571 ?auto_523576 ) ) ( not ( = ?auto_523571 ?auto_523577 ) ) ( not ( = ?auto_523572 ?auto_523573 ) ) ( not ( = ?auto_523572 ?auto_523574 ) ) ( not ( = ?auto_523572 ?auto_523575 ) ) ( not ( = ?auto_523572 ?auto_523576 ) ) ( not ( = ?auto_523572 ?auto_523577 ) ) ( not ( = ?auto_523573 ?auto_523574 ) ) ( not ( = ?auto_523573 ?auto_523575 ) ) ( not ( = ?auto_523573 ?auto_523576 ) ) ( not ( = ?auto_523573 ?auto_523577 ) ) ( not ( = ?auto_523574 ?auto_523575 ) ) ( not ( = ?auto_523574 ?auto_523576 ) ) ( not ( = ?auto_523574 ?auto_523577 ) ) ( not ( = ?auto_523575 ?auto_523576 ) ) ( not ( = ?auto_523575 ?auto_523577 ) ) ( not ( = ?auto_523576 ?auto_523577 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_523576 ?auto_523577 )
      ( !STACK ?auto_523576 ?auto_523575 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_523615 - BLOCK
      ?auto_523616 - BLOCK
      ?auto_523617 - BLOCK
      ?auto_523618 - BLOCK
      ?auto_523619 - BLOCK
      ?auto_523620 - BLOCK
      ?auto_523621 - BLOCK
      ?auto_523622 - BLOCK
      ?auto_523623 - BLOCK
      ?auto_523624 - BLOCK
      ?auto_523625 - BLOCK
      ?auto_523626 - BLOCK
    )
    :vars
    (
      ?auto_523627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523626 ?auto_523627 ) ( ON-TABLE ?auto_523615 ) ( ON ?auto_523616 ?auto_523615 ) ( ON ?auto_523617 ?auto_523616 ) ( ON ?auto_523618 ?auto_523617 ) ( ON ?auto_523619 ?auto_523618 ) ( ON ?auto_523620 ?auto_523619 ) ( ON ?auto_523621 ?auto_523620 ) ( ON ?auto_523622 ?auto_523621 ) ( ON ?auto_523623 ?auto_523622 ) ( ON ?auto_523624 ?auto_523623 ) ( not ( = ?auto_523615 ?auto_523616 ) ) ( not ( = ?auto_523615 ?auto_523617 ) ) ( not ( = ?auto_523615 ?auto_523618 ) ) ( not ( = ?auto_523615 ?auto_523619 ) ) ( not ( = ?auto_523615 ?auto_523620 ) ) ( not ( = ?auto_523615 ?auto_523621 ) ) ( not ( = ?auto_523615 ?auto_523622 ) ) ( not ( = ?auto_523615 ?auto_523623 ) ) ( not ( = ?auto_523615 ?auto_523624 ) ) ( not ( = ?auto_523615 ?auto_523625 ) ) ( not ( = ?auto_523615 ?auto_523626 ) ) ( not ( = ?auto_523615 ?auto_523627 ) ) ( not ( = ?auto_523616 ?auto_523617 ) ) ( not ( = ?auto_523616 ?auto_523618 ) ) ( not ( = ?auto_523616 ?auto_523619 ) ) ( not ( = ?auto_523616 ?auto_523620 ) ) ( not ( = ?auto_523616 ?auto_523621 ) ) ( not ( = ?auto_523616 ?auto_523622 ) ) ( not ( = ?auto_523616 ?auto_523623 ) ) ( not ( = ?auto_523616 ?auto_523624 ) ) ( not ( = ?auto_523616 ?auto_523625 ) ) ( not ( = ?auto_523616 ?auto_523626 ) ) ( not ( = ?auto_523616 ?auto_523627 ) ) ( not ( = ?auto_523617 ?auto_523618 ) ) ( not ( = ?auto_523617 ?auto_523619 ) ) ( not ( = ?auto_523617 ?auto_523620 ) ) ( not ( = ?auto_523617 ?auto_523621 ) ) ( not ( = ?auto_523617 ?auto_523622 ) ) ( not ( = ?auto_523617 ?auto_523623 ) ) ( not ( = ?auto_523617 ?auto_523624 ) ) ( not ( = ?auto_523617 ?auto_523625 ) ) ( not ( = ?auto_523617 ?auto_523626 ) ) ( not ( = ?auto_523617 ?auto_523627 ) ) ( not ( = ?auto_523618 ?auto_523619 ) ) ( not ( = ?auto_523618 ?auto_523620 ) ) ( not ( = ?auto_523618 ?auto_523621 ) ) ( not ( = ?auto_523618 ?auto_523622 ) ) ( not ( = ?auto_523618 ?auto_523623 ) ) ( not ( = ?auto_523618 ?auto_523624 ) ) ( not ( = ?auto_523618 ?auto_523625 ) ) ( not ( = ?auto_523618 ?auto_523626 ) ) ( not ( = ?auto_523618 ?auto_523627 ) ) ( not ( = ?auto_523619 ?auto_523620 ) ) ( not ( = ?auto_523619 ?auto_523621 ) ) ( not ( = ?auto_523619 ?auto_523622 ) ) ( not ( = ?auto_523619 ?auto_523623 ) ) ( not ( = ?auto_523619 ?auto_523624 ) ) ( not ( = ?auto_523619 ?auto_523625 ) ) ( not ( = ?auto_523619 ?auto_523626 ) ) ( not ( = ?auto_523619 ?auto_523627 ) ) ( not ( = ?auto_523620 ?auto_523621 ) ) ( not ( = ?auto_523620 ?auto_523622 ) ) ( not ( = ?auto_523620 ?auto_523623 ) ) ( not ( = ?auto_523620 ?auto_523624 ) ) ( not ( = ?auto_523620 ?auto_523625 ) ) ( not ( = ?auto_523620 ?auto_523626 ) ) ( not ( = ?auto_523620 ?auto_523627 ) ) ( not ( = ?auto_523621 ?auto_523622 ) ) ( not ( = ?auto_523621 ?auto_523623 ) ) ( not ( = ?auto_523621 ?auto_523624 ) ) ( not ( = ?auto_523621 ?auto_523625 ) ) ( not ( = ?auto_523621 ?auto_523626 ) ) ( not ( = ?auto_523621 ?auto_523627 ) ) ( not ( = ?auto_523622 ?auto_523623 ) ) ( not ( = ?auto_523622 ?auto_523624 ) ) ( not ( = ?auto_523622 ?auto_523625 ) ) ( not ( = ?auto_523622 ?auto_523626 ) ) ( not ( = ?auto_523622 ?auto_523627 ) ) ( not ( = ?auto_523623 ?auto_523624 ) ) ( not ( = ?auto_523623 ?auto_523625 ) ) ( not ( = ?auto_523623 ?auto_523626 ) ) ( not ( = ?auto_523623 ?auto_523627 ) ) ( not ( = ?auto_523624 ?auto_523625 ) ) ( not ( = ?auto_523624 ?auto_523626 ) ) ( not ( = ?auto_523624 ?auto_523627 ) ) ( not ( = ?auto_523625 ?auto_523626 ) ) ( not ( = ?auto_523625 ?auto_523627 ) ) ( not ( = ?auto_523626 ?auto_523627 ) ) ( CLEAR ?auto_523624 ) ( ON ?auto_523625 ?auto_523626 ) ( CLEAR ?auto_523625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_523615 ?auto_523616 ?auto_523617 ?auto_523618 ?auto_523619 ?auto_523620 ?auto_523621 ?auto_523622 ?auto_523623 ?auto_523624 ?auto_523625 )
      ( MAKE-12PILE ?auto_523615 ?auto_523616 ?auto_523617 ?auto_523618 ?auto_523619 ?auto_523620 ?auto_523621 ?auto_523622 ?auto_523623 ?auto_523624 ?auto_523625 ?auto_523626 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_523665 - BLOCK
      ?auto_523666 - BLOCK
      ?auto_523667 - BLOCK
      ?auto_523668 - BLOCK
      ?auto_523669 - BLOCK
      ?auto_523670 - BLOCK
      ?auto_523671 - BLOCK
      ?auto_523672 - BLOCK
      ?auto_523673 - BLOCK
      ?auto_523674 - BLOCK
      ?auto_523675 - BLOCK
      ?auto_523676 - BLOCK
    )
    :vars
    (
      ?auto_523677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523676 ?auto_523677 ) ( ON-TABLE ?auto_523665 ) ( ON ?auto_523666 ?auto_523665 ) ( ON ?auto_523667 ?auto_523666 ) ( ON ?auto_523668 ?auto_523667 ) ( ON ?auto_523669 ?auto_523668 ) ( ON ?auto_523670 ?auto_523669 ) ( ON ?auto_523671 ?auto_523670 ) ( ON ?auto_523672 ?auto_523671 ) ( ON ?auto_523673 ?auto_523672 ) ( not ( = ?auto_523665 ?auto_523666 ) ) ( not ( = ?auto_523665 ?auto_523667 ) ) ( not ( = ?auto_523665 ?auto_523668 ) ) ( not ( = ?auto_523665 ?auto_523669 ) ) ( not ( = ?auto_523665 ?auto_523670 ) ) ( not ( = ?auto_523665 ?auto_523671 ) ) ( not ( = ?auto_523665 ?auto_523672 ) ) ( not ( = ?auto_523665 ?auto_523673 ) ) ( not ( = ?auto_523665 ?auto_523674 ) ) ( not ( = ?auto_523665 ?auto_523675 ) ) ( not ( = ?auto_523665 ?auto_523676 ) ) ( not ( = ?auto_523665 ?auto_523677 ) ) ( not ( = ?auto_523666 ?auto_523667 ) ) ( not ( = ?auto_523666 ?auto_523668 ) ) ( not ( = ?auto_523666 ?auto_523669 ) ) ( not ( = ?auto_523666 ?auto_523670 ) ) ( not ( = ?auto_523666 ?auto_523671 ) ) ( not ( = ?auto_523666 ?auto_523672 ) ) ( not ( = ?auto_523666 ?auto_523673 ) ) ( not ( = ?auto_523666 ?auto_523674 ) ) ( not ( = ?auto_523666 ?auto_523675 ) ) ( not ( = ?auto_523666 ?auto_523676 ) ) ( not ( = ?auto_523666 ?auto_523677 ) ) ( not ( = ?auto_523667 ?auto_523668 ) ) ( not ( = ?auto_523667 ?auto_523669 ) ) ( not ( = ?auto_523667 ?auto_523670 ) ) ( not ( = ?auto_523667 ?auto_523671 ) ) ( not ( = ?auto_523667 ?auto_523672 ) ) ( not ( = ?auto_523667 ?auto_523673 ) ) ( not ( = ?auto_523667 ?auto_523674 ) ) ( not ( = ?auto_523667 ?auto_523675 ) ) ( not ( = ?auto_523667 ?auto_523676 ) ) ( not ( = ?auto_523667 ?auto_523677 ) ) ( not ( = ?auto_523668 ?auto_523669 ) ) ( not ( = ?auto_523668 ?auto_523670 ) ) ( not ( = ?auto_523668 ?auto_523671 ) ) ( not ( = ?auto_523668 ?auto_523672 ) ) ( not ( = ?auto_523668 ?auto_523673 ) ) ( not ( = ?auto_523668 ?auto_523674 ) ) ( not ( = ?auto_523668 ?auto_523675 ) ) ( not ( = ?auto_523668 ?auto_523676 ) ) ( not ( = ?auto_523668 ?auto_523677 ) ) ( not ( = ?auto_523669 ?auto_523670 ) ) ( not ( = ?auto_523669 ?auto_523671 ) ) ( not ( = ?auto_523669 ?auto_523672 ) ) ( not ( = ?auto_523669 ?auto_523673 ) ) ( not ( = ?auto_523669 ?auto_523674 ) ) ( not ( = ?auto_523669 ?auto_523675 ) ) ( not ( = ?auto_523669 ?auto_523676 ) ) ( not ( = ?auto_523669 ?auto_523677 ) ) ( not ( = ?auto_523670 ?auto_523671 ) ) ( not ( = ?auto_523670 ?auto_523672 ) ) ( not ( = ?auto_523670 ?auto_523673 ) ) ( not ( = ?auto_523670 ?auto_523674 ) ) ( not ( = ?auto_523670 ?auto_523675 ) ) ( not ( = ?auto_523670 ?auto_523676 ) ) ( not ( = ?auto_523670 ?auto_523677 ) ) ( not ( = ?auto_523671 ?auto_523672 ) ) ( not ( = ?auto_523671 ?auto_523673 ) ) ( not ( = ?auto_523671 ?auto_523674 ) ) ( not ( = ?auto_523671 ?auto_523675 ) ) ( not ( = ?auto_523671 ?auto_523676 ) ) ( not ( = ?auto_523671 ?auto_523677 ) ) ( not ( = ?auto_523672 ?auto_523673 ) ) ( not ( = ?auto_523672 ?auto_523674 ) ) ( not ( = ?auto_523672 ?auto_523675 ) ) ( not ( = ?auto_523672 ?auto_523676 ) ) ( not ( = ?auto_523672 ?auto_523677 ) ) ( not ( = ?auto_523673 ?auto_523674 ) ) ( not ( = ?auto_523673 ?auto_523675 ) ) ( not ( = ?auto_523673 ?auto_523676 ) ) ( not ( = ?auto_523673 ?auto_523677 ) ) ( not ( = ?auto_523674 ?auto_523675 ) ) ( not ( = ?auto_523674 ?auto_523676 ) ) ( not ( = ?auto_523674 ?auto_523677 ) ) ( not ( = ?auto_523675 ?auto_523676 ) ) ( not ( = ?auto_523675 ?auto_523677 ) ) ( not ( = ?auto_523676 ?auto_523677 ) ) ( ON ?auto_523675 ?auto_523676 ) ( CLEAR ?auto_523673 ) ( ON ?auto_523674 ?auto_523675 ) ( CLEAR ?auto_523674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_523665 ?auto_523666 ?auto_523667 ?auto_523668 ?auto_523669 ?auto_523670 ?auto_523671 ?auto_523672 ?auto_523673 ?auto_523674 )
      ( MAKE-12PILE ?auto_523665 ?auto_523666 ?auto_523667 ?auto_523668 ?auto_523669 ?auto_523670 ?auto_523671 ?auto_523672 ?auto_523673 ?auto_523674 ?auto_523675 ?auto_523676 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_523715 - BLOCK
      ?auto_523716 - BLOCK
      ?auto_523717 - BLOCK
      ?auto_523718 - BLOCK
      ?auto_523719 - BLOCK
      ?auto_523720 - BLOCK
      ?auto_523721 - BLOCK
      ?auto_523722 - BLOCK
      ?auto_523723 - BLOCK
      ?auto_523724 - BLOCK
      ?auto_523725 - BLOCK
      ?auto_523726 - BLOCK
    )
    :vars
    (
      ?auto_523727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523726 ?auto_523727 ) ( ON-TABLE ?auto_523715 ) ( ON ?auto_523716 ?auto_523715 ) ( ON ?auto_523717 ?auto_523716 ) ( ON ?auto_523718 ?auto_523717 ) ( ON ?auto_523719 ?auto_523718 ) ( ON ?auto_523720 ?auto_523719 ) ( ON ?auto_523721 ?auto_523720 ) ( ON ?auto_523722 ?auto_523721 ) ( not ( = ?auto_523715 ?auto_523716 ) ) ( not ( = ?auto_523715 ?auto_523717 ) ) ( not ( = ?auto_523715 ?auto_523718 ) ) ( not ( = ?auto_523715 ?auto_523719 ) ) ( not ( = ?auto_523715 ?auto_523720 ) ) ( not ( = ?auto_523715 ?auto_523721 ) ) ( not ( = ?auto_523715 ?auto_523722 ) ) ( not ( = ?auto_523715 ?auto_523723 ) ) ( not ( = ?auto_523715 ?auto_523724 ) ) ( not ( = ?auto_523715 ?auto_523725 ) ) ( not ( = ?auto_523715 ?auto_523726 ) ) ( not ( = ?auto_523715 ?auto_523727 ) ) ( not ( = ?auto_523716 ?auto_523717 ) ) ( not ( = ?auto_523716 ?auto_523718 ) ) ( not ( = ?auto_523716 ?auto_523719 ) ) ( not ( = ?auto_523716 ?auto_523720 ) ) ( not ( = ?auto_523716 ?auto_523721 ) ) ( not ( = ?auto_523716 ?auto_523722 ) ) ( not ( = ?auto_523716 ?auto_523723 ) ) ( not ( = ?auto_523716 ?auto_523724 ) ) ( not ( = ?auto_523716 ?auto_523725 ) ) ( not ( = ?auto_523716 ?auto_523726 ) ) ( not ( = ?auto_523716 ?auto_523727 ) ) ( not ( = ?auto_523717 ?auto_523718 ) ) ( not ( = ?auto_523717 ?auto_523719 ) ) ( not ( = ?auto_523717 ?auto_523720 ) ) ( not ( = ?auto_523717 ?auto_523721 ) ) ( not ( = ?auto_523717 ?auto_523722 ) ) ( not ( = ?auto_523717 ?auto_523723 ) ) ( not ( = ?auto_523717 ?auto_523724 ) ) ( not ( = ?auto_523717 ?auto_523725 ) ) ( not ( = ?auto_523717 ?auto_523726 ) ) ( not ( = ?auto_523717 ?auto_523727 ) ) ( not ( = ?auto_523718 ?auto_523719 ) ) ( not ( = ?auto_523718 ?auto_523720 ) ) ( not ( = ?auto_523718 ?auto_523721 ) ) ( not ( = ?auto_523718 ?auto_523722 ) ) ( not ( = ?auto_523718 ?auto_523723 ) ) ( not ( = ?auto_523718 ?auto_523724 ) ) ( not ( = ?auto_523718 ?auto_523725 ) ) ( not ( = ?auto_523718 ?auto_523726 ) ) ( not ( = ?auto_523718 ?auto_523727 ) ) ( not ( = ?auto_523719 ?auto_523720 ) ) ( not ( = ?auto_523719 ?auto_523721 ) ) ( not ( = ?auto_523719 ?auto_523722 ) ) ( not ( = ?auto_523719 ?auto_523723 ) ) ( not ( = ?auto_523719 ?auto_523724 ) ) ( not ( = ?auto_523719 ?auto_523725 ) ) ( not ( = ?auto_523719 ?auto_523726 ) ) ( not ( = ?auto_523719 ?auto_523727 ) ) ( not ( = ?auto_523720 ?auto_523721 ) ) ( not ( = ?auto_523720 ?auto_523722 ) ) ( not ( = ?auto_523720 ?auto_523723 ) ) ( not ( = ?auto_523720 ?auto_523724 ) ) ( not ( = ?auto_523720 ?auto_523725 ) ) ( not ( = ?auto_523720 ?auto_523726 ) ) ( not ( = ?auto_523720 ?auto_523727 ) ) ( not ( = ?auto_523721 ?auto_523722 ) ) ( not ( = ?auto_523721 ?auto_523723 ) ) ( not ( = ?auto_523721 ?auto_523724 ) ) ( not ( = ?auto_523721 ?auto_523725 ) ) ( not ( = ?auto_523721 ?auto_523726 ) ) ( not ( = ?auto_523721 ?auto_523727 ) ) ( not ( = ?auto_523722 ?auto_523723 ) ) ( not ( = ?auto_523722 ?auto_523724 ) ) ( not ( = ?auto_523722 ?auto_523725 ) ) ( not ( = ?auto_523722 ?auto_523726 ) ) ( not ( = ?auto_523722 ?auto_523727 ) ) ( not ( = ?auto_523723 ?auto_523724 ) ) ( not ( = ?auto_523723 ?auto_523725 ) ) ( not ( = ?auto_523723 ?auto_523726 ) ) ( not ( = ?auto_523723 ?auto_523727 ) ) ( not ( = ?auto_523724 ?auto_523725 ) ) ( not ( = ?auto_523724 ?auto_523726 ) ) ( not ( = ?auto_523724 ?auto_523727 ) ) ( not ( = ?auto_523725 ?auto_523726 ) ) ( not ( = ?auto_523725 ?auto_523727 ) ) ( not ( = ?auto_523726 ?auto_523727 ) ) ( ON ?auto_523725 ?auto_523726 ) ( ON ?auto_523724 ?auto_523725 ) ( CLEAR ?auto_523722 ) ( ON ?auto_523723 ?auto_523724 ) ( CLEAR ?auto_523723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_523715 ?auto_523716 ?auto_523717 ?auto_523718 ?auto_523719 ?auto_523720 ?auto_523721 ?auto_523722 ?auto_523723 )
      ( MAKE-12PILE ?auto_523715 ?auto_523716 ?auto_523717 ?auto_523718 ?auto_523719 ?auto_523720 ?auto_523721 ?auto_523722 ?auto_523723 ?auto_523724 ?auto_523725 ?auto_523726 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_523765 - BLOCK
      ?auto_523766 - BLOCK
      ?auto_523767 - BLOCK
      ?auto_523768 - BLOCK
      ?auto_523769 - BLOCK
      ?auto_523770 - BLOCK
      ?auto_523771 - BLOCK
      ?auto_523772 - BLOCK
      ?auto_523773 - BLOCK
      ?auto_523774 - BLOCK
      ?auto_523775 - BLOCK
      ?auto_523776 - BLOCK
    )
    :vars
    (
      ?auto_523777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523776 ?auto_523777 ) ( ON-TABLE ?auto_523765 ) ( ON ?auto_523766 ?auto_523765 ) ( ON ?auto_523767 ?auto_523766 ) ( ON ?auto_523768 ?auto_523767 ) ( ON ?auto_523769 ?auto_523768 ) ( ON ?auto_523770 ?auto_523769 ) ( ON ?auto_523771 ?auto_523770 ) ( not ( = ?auto_523765 ?auto_523766 ) ) ( not ( = ?auto_523765 ?auto_523767 ) ) ( not ( = ?auto_523765 ?auto_523768 ) ) ( not ( = ?auto_523765 ?auto_523769 ) ) ( not ( = ?auto_523765 ?auto_523770 ) ) ( not ( = ?auto_523765 ?auto_523771 ) ) ( not ( = ?auto_523765 ?auto_523772 ) ) ( not ( = ?auto_523765 ?auto_523773 ) ) ( not ( = ?auto_523765 ?auto_523774 ) ) ( not ( = ?auto_523765 ?auto_523775 ) ) ( not ( = ?auto_523765 ?auto_523776 ) ) ( not ( = ?auto_523765 ?auto_523777 ) ) ( not ( = ?auto_523766 ?auto_523767 ) ) ( not ( = ?auto_523766 ?auto_523768 ) ) ( not ( = ?auto_523766 ?auto_523769 ) ) ( not ( = ?auto_523766 ?auto_523770 ) ) ( not ( = ?auto_523766 ?auto_523771 ) ) ( not ( = ?auto_523766 ?auto_523772 ) ) ( not ( = ?auto_523766 ?auto_523773 ) ) ( not ( = ?auto_523766 ?auto_523774 ) ) ( not ( = ?auto_523766 ?auto_523775 ) ) ( not ( = ?auto_523766 ?auto_523776 ) ) ( not ( = ?auto_523766 ?auto_523777 ) ) ( not ( = ?auto_523767 ?auto_523768 ) ) ( not ( = ?auto_523767 ?auto_523769 ) ) ( not ( = ?auto_523767 ?auto_523770 ) ) ( not ( = ?auto_523767 ?auto_523771 ) ) ( not ( = ?auto_523767 ?auto_523772 ) ) ( not ( = ?auto_523767 ?auto_523773 ) ) ( not ( = ?auto_523767 ?auto_523774 ) ) ( not ( = ?auto_523767 ?auto_523775 ) ) ( not ( = ?auto_523767 ?auto_523776 ) ) ( not ( = ?auto_523767 ?auto_523777 ) ) ( not ( = ?auto_523768 ?auto_523769 ) ) ( not ( = ?auto_523768 ?auto_523770 ) ) ( not ( = ?auto_523768 ?auto_523771 ) ) ( not ( = ?auto_523768 ?auto_523772 ) ) ( not ( = ?auto_523768 ?auto_523773 ) ) ( not ( = ?auto_523768 ?auto_523774 ) ) ( not ( = ?auto_523768 ?auto_523775 ) ) ( not ( = ?auto_523768 ?auto_523776 ) ) ( not ( = ?auto_523768 ?auto_523777 ) ) ( not ( = ?auto_523769 ?auto_523770 ) ) ( not ( = ?auto_523769 ?auto_523771 ) ) ( not ( = ?auto_523769 ?auto_523772 ) ) ( not ( = ?auto_523769 ?auto_523773 ) ) ( not ( = ?auto_523769 ?auto_523774 ) ) ( not ( = ?auto_523769 ?auto_523775 ) ) ( not ( = ?auto_523769 ?auto_523776 ) ) ( not ( = ?auto_523769 ?auto_523777 ) ) ( not ( = ?auto_523770 ?auto_523771 ) ) ( not ( = ?auto_523770 ?auto_523772 ) ) ( not ( = ?auto_523770 ?auto_523773 ) ) ( not ( = ?auto_523770 ?auto_523774 ) ) ( not ( = ?auto_523770 ?auto_523775 ) ) ( not ( = ?auto_523770 ?auto_523776 ) ) ( not ( = ?auto_523770 ?auto_523777 ) ) ( not ( = ?auto_523771 ?auto_523772 ) ) ( not ( = ?auto_523771 ?auto_523773 ) ) ( not ( = ?auto_523771 ?auto_523774 ) ) ( not ( = ?auto_523771 ?auto_523775 ) ) ( not ( = ?auto_523771 ?auto_523776 ) ) ( not ( = ?auto_523771 ?auto_523777 ) ) ( not ( = ?auto_523772 ?auto_523773 ) ) ( not ( = ?auto_523772 ?auto_523774 ) ) ( not ( = ?auto_523772 ?auto_523775 ) ) ( not ( = ?auto_523772 ?auto_523776 ) ) ( not ( = ?auto_523772 ?auto_523777 ) ) ( not ( = ?auto_523773 ?auto_523774 ) ) ( not ( = ?auto_523773 ?auto_523775 ) ) ( not ( = ?auto_523773 ?auto_523776 ) ) ( not ( = ?auto_523773 ?auto_523777 ) ) ( not ( = ?auto_523774 ?auto_523775 ) ) ( not ( = ?auto_523774 ?auto_523776 ) ) ( not ( = ?auto_523774 ?auto_523777 ) ) ( not ( = ?auto_523775 ?auto_523776 ) ) ( not ( = ?auto_523775 ?auto_523777 ) ) ( not ( = ?auto_523776 ?auto_523777 ) ) ( ON ?auto_523775 ?auto_523776 ) ( ON ?auto_523774 ?auto_523775 ) ( ON ?auto_523773 ?auto_523774 ) ( CLEAR ?auto_523771 ) ( ON ?auto_523772 ?auto_523773 ) ( CLEAR ?auto_523772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_523765 ?auto_523766 ?auto_523767 ?auto_523768 ?auto_523769 ?auto_523770 ?auto_523771 ?auto_523772 )
      ( MAKE-12PILE ?auto_523765 ?auto_523766 ?auto_523767 ?auto_523768 ?auto_523769 ?auto_523770 ?auto_523771 ?auto_523772 ?auto_523773 ?auto_523774 ?auto_523775 ?auto_523776 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_523815 - BLOCK
      ?auto_523816 - BLOCK
      ?auto_523817 - BLOCK
      ?auto_523818 - BLOCK
      ?auto_523819 - BLOCK
      ?auto_523820 - BLOCK
      ?auto_523821 - BLOCK
      ?auto_523822 - BLOCK
      ?auto_523823 - BLOCK
      ?auto_523824 - BLOCK
      ?auto_523825 - BLOCK
      ?auto_523826 - BLOCK
    )
    :vars
    (
      ?auto_523827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523826 ?auto_523827 ) ( ON-TABLE ?auto_523815 ) ( ON ?auto_523816 ?auto_523815 ) ( ON ?auto_523817 ?auto_523816 ) ( ON ?auto_523818 ?auto_523817 ) ( ON ?auto_523819 ?auto_523818 ) ( ON ?auto_523820 ?auto_523819 ) ( not ( = ?auto_523815 ?auto_523816 ) ) ( not ( = ?auto_523815 ?auto_523817 ) ) ( not ( = ?auto_523815 ?auto_523818 ) ) ( not ( = ?auto_523815 ?auto_523819 ) ) ( not ( = ?auto_523815 ?auto_523820 ) ) ( not ( = ?auto_523815 ?auto_523821 ) ) ( not ( = ?auto_523815 ?auto_523822 ) ) ( not ( = ?auto_523815 ?auto_523823 ) ) ( not ( = ?auto_523815 ?auto_523824 ) ) ( not ( = ?auto_523815 ?auto_523825 ) ) ( not ( = ?auto_523815 ?auto_523826 ) ) ( not ( = ?auto_523815 ?auto_523827 ) ) ( not ( = ?auto_523816 ?auto_523817 ) ) ( not ( = ?auto_523816 ?auto_523818 ) ) ( not ( = ?auto_523816 ?auto_523819 ) ) ( not ( = ?auto_523816 ?auto_523820 ) ) ( not ( = ?auto_523816 ?auto_523821 ) ) ( not ( = ?auto_523816 ?auto_523822 ) ) ( not ( = ?auto_523816 ?auto_523823 ) ) ( not ( = ?auto_523816 ?auto_523824 ) ) ( not ( = ?auto_523816 ?auto_523825 ) ) ( not ( = ?auto_523816 ?auto_523826 ) ) ( not ( = ?auto_523816 ?auto_523827 ) ) ( not ( = ?auto_523817 ?auto_523818 ) ) ( not ( = ?auto_523817 ?auto_523819 ) ) ( not ( = ?auto_523817 ?auto_523820 ) ) ( not ( = ?auto_523817 ?auto_523821 ) ) ( not ( = ?auto_523817 ?auto_523822 ) ) ( not ( = ?auto_523817 ?auto_523823 ) ) ( not ( = ?auto_523817 ?auto_523824 ) ) ( not ( = ?auto_523817 ?auto_523825 ) ) ( not ( = ?auto_523817 ?auto_523826 ) ) ( not ( = ?auto_523817 ?auto_523827 ) ) ( not ( = ?auto_523818 ?auto_523819 ) ) ( not ( = ?auto_523818 ?auto_523820 ) ) ( not ( = ?auto_523818 ?auto_523821 ) ) ( not ( = ?auto_523818 ?auto_523822 ) ) ( not ( = ?auto_523818 ?auto_523823 ) ) ( not ( = ?auto_523818 ?auto_523824 ) ) ( not ( = ?auto_523818 ?auto_523825 ) ) ( not ( = ?auto_523818 ?auto_523826 ) ) ( not ( = ?auto_523818 ?auto_523827 ) ) ( not ( = ?auto_523819 ?auto_523820 ) ) ( not ( = ?auto_523819 ?auto_523821 ) ) ( not ( = ?auto_523819 ?auto_523822 ) ) ( not ( = ?auto_523819 ?auto_523823 ) ) ( not ( = ?auto_523819 ?auto_523824 ) ) ( not ( = ?auto_523819 ?auto_523825 ) ) ( not ( = ?auto_523819 ?auto_523826 ) ) ( not ( = ?auto_523819 ?auto_523827 ) ) ( not ( = ?auto_523820 ?auto_523821 ) ) ( not ( = ?auto_523820 ?auto_523822 ) ) ( not ( = ?auto_523820 ?auto_523823 ) ) ( not ( = ?auto_523820 ?auto_523824 ) ) ( not ( = ?auto_523820 ?auto_523825 ) ) ( not ( = ?auto_523820 ?auto_523826 ) ) ( not ( = ?auto_523820 ?auto_523827 ) ) ( not ( = ?auto_523821 ?auto_523822 ) ) ( not ( = ?auto_523821 ?auto_523823 ) ) ( not ( = ?auto_523821 ?auto_523824 ) ) ( not ( = ?auto_523821 ?auto_523825 ) ) ( not ( = ?auto_523821 ?auto_523826 ) ) ( not ( = ?auto_523821 ?auto_523827 ) ) ( not ( = ?auto_523822 ?auto_523823 ) ) ( not ( = ?auto_523822 ?auto_523824 ) ) ( not ( = ?auto_523822 ?auto_523825 ) ) ( not ( = ?auto_523822 ?auto_523826 ) ) ( not ( = ?auto_523822 ?auto_523827 ) ) ( not ( = ?auto_523823 ?auto_523824 ) ) ( not ( = ?auto_523823 ?auto_523825 ) ) ( not ( = ?auto_523823 ?auto_523826 ) ) ( not ( = ?auto_523823 ?auto_523827 ) ) ( not ( = ?auto_523824 ?auto_523825 ) ) ( not ( = ?auto_523824 ?auto_523826 ) ) ( not ( = ?auto_523824 ?auto_523827 ) ) ( not ( = ?auto_523825 ?auto_523826 ) ) ( not ( = ?auto_523825 ?auto_523827 ) ) ( not ( = ?auto_523826 ?auto_523827 ) ) ( ON ?auto_523825 ?auto_523826 ) ( ON ?auto_523824 ?auto_523825 ) ( ON ?auto_523823 ?auto_523824 ) ( ON ?auto_523822 ?auto_523823 ) ( CLEAR ?auto_523820 ) ( ON ?auto_523821 ?auto_523822 ) ( CLEAR ?auto_523821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_523815 ?auto_523816 ?auto_523817 ?auto_523818 ?auto_523819 ?auto_523820 ?auto_523821 )
      ( MAKE-12PILE ?auto_523815 ?auto_523816 ?auto_523817 ?auto_523818 ?auto_523819 ?auto_523820 ?auto_523821 ?auto_523822 ?auto_523823 ?auto_523824 ?auto_523825 ?auto_523826 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_523865 - BLOCK
      ?auto_523866 - BLOCK
      ?auto_523867 - BLOCK
      ?auto_523868 - BLOCK
      ?auto_523869 - BLOCK
      ?auto_523870 - BLOCK
      ?auto_523871 - BLOCK
      ?auto_523872 - BLOCK
      ?auto_523873 - BLOCK
      ?auto_523874 - BLOCK
      ?auto_523875 - BLOCK
      ?auto_523876 - BLOCK
    )
    :vars
    (
      ?auto_523877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523876 ?auto_523877 ) ( ON-TABLE ?auto_523865 ) ( ON ?auto_523866 ?auto_523865 ) ( ON ?auto_523867 ?auto_523866 ) ( ON ?auto_523868 ?auto_523867 ) ( ON ?auto_523869 ?auto_523868 ) ( not ( = ?auto_523865 ?auto_523866 ) ) ( not ( = ?auto_523865 ?auto_523867 ) ) ( not ( = ?auto_523865 ?auto_523868 ) ) ( not ( = ?auto_523865 ?auto_523869 ) ) ( not ( = ?auto_523865 ?auto_523870 ) ) ( not ( = ?auto_523865 ?auto_523871 ) ) ( not ( = ?auto_523865 ?auto_523872 ) ) ( not ( = ?auto_523865 ?auto_523873 ) ) ( not ( = ?auto_523865 ?auto_523874 ) ) ( not ( = ?auto_523865 ?auto_523875 ) ) ( not ( = ?auto_523865 ?auto_523876 ) ) ( not ( = ?auto_523865 ?auto_523877 ) ) ( not ( = ?auto_523866 ?auto_523867 ) ) ( not ( = ?auto_523866 ?auto_523868 ) ) ( not ( = ?auto_523866 ?auto_523869 ) ) ( not ( = ?auto_523866 ?auto_523870 ) ) ( not ( = ?auto_523866 ?auto_523871 ) ) ( not ( = ?auto_523866 ?auto_523872 ) ) ( not ( = ?auto_523866 ?auto_523873 ) ) ( not ( = ?auto_523866 ?auto_523874 ) ) ( not ( = ?auto_523866 ?auto_523875 ) ) ( not ( = ?auto_523866 ?auto_523876 ) ) ( not ( = ?auto_523866 ?auto_523877 ) ) ( not ( = ?auto_523867 ?auto_523868 ) ) ( not ( = ?auto_523867 ?auto_523869 ) ) ( not ( = ?auto_523867 ?auto_523870 ) ) ( not ( = ?auto_523867 ?auto_523871 ) ) ( not ( = ?auto_523867 ?auto_523872 ) ) ( not ( = ?auto_523867 ?auto_523873 ) ) ( not ( = ?auto_523867 ?auto_523874 ) ) ( not ( = ?auto_523867 ?auto_523875 ) ) ( not ( = ?auto_523867 ?auto_523876 ) ) ( not ( = ?auto_523867 ?auto_523877 ) ) ( not ( = ?auto_523868 ?auto_523869 ) ) ( not ( = ?auto_523868 ?auto_523870 ) ) ( not ( = ?auto_523868 ?auto_523871 ) ) ( not ( = ?auto_523868 ?auto_523872 ) ) ( not ( = ?auto_523868 ?auto_523873 ) ) ( not ( = ?auto_523868 ?auto_523874 ) ) ( not ( = ?auto_523868 ?auto_523875 ) ) ( not ( = ?auto_523868 ?auto_523876 ) ) ( not ( = ?auto_523868 ?auto_523877 ) ) ( not ( = ?auto_523869 ?auto_523870 ) ) ( not ( = ?auto_523869 ?auto_523871 ) ) ( not ( = ?auto_523869 ?auto_523872 ) ) ( not ( = ?auto_523869 ?auto_523873 ) ) ( not ( = ?auto_523869 ?auto_523874 ) ) ( not ( = ?auto_523869 ?auto_523875 ) ) ( not ( = ?auto_523869 ?auto_523876 ) ) ( not ( = ?auto_523869 ?auto_523877 ) ) ( not ( = ?auto_523870 ?auto_523871 ) ) ( not ( = ?auto_523870 ?auto_523872 ) ) ( not ( = ?auto_523870 ?auto_523873 ) ) ( not ( = ?auto_523870 ?auto_523874 ) ) ( not ( = ?auto_523870 ?auto_523875 ) ) ( not ( = ?auto_523870 ?auto_523876 ) ) ( not ( = ?auto_523870 ?auto_523877 ) ) ( not ( = ?auto_523871 ?auto_523872 ) ) ( not ( = ?auto_523871 ?auto_523873 ) ) ( not ( = ?auto_523871 ?auto_523874 ) ) ( not ( = ?auto_523871 ?auto_523875 ) ) ( not ( = ?auto_523871 ?auto_523876 ) ) ( not ( = ?auto_523871 ?auto_523877 ) ) ( not ( = ?auto_523872 ?auto_523873 ) ) ( not ( = ?auto_523872 ?auto_523874 ) ) ( not ( = ?auto_523872 ?auto_523875 ) ) ( not ( = ?auto_523872 ?auto_523876 ) ) ( not ( = ?auto_523872 ?auto_523877 ) ) ( not ( = ?auto_523873 ?auto_523874 ) ) ( not ( = ?auto_523873 ?auto_523875 ) ) ( not ( = ?auto_523873 ?auto_523876 ) ) ( not ( = ?auto_523873 ?auto_523877 ) ) ( not ( = ?auto_523874 ?auto_523875 ) ) ( not ( = ?auto_523874 ?auto_523876 ) ) ( not ( = ?auto_523874 ?auto_523877 ) ) ( not ( = ?auto_523875 ?auto_523876 ) ) ( not ( = ?auto_523875 ?auto_523877 ) ) ( not ( = ?auto_523876 ?auto_523877 ) ) ( ON ?auto_523875 ?auto_523876 ) ( ON ?auto_523874 ?auto_523875 ) ( ON ?auto_523873 ?auto_523874 ) ( ON ?auto_523872 ?auto_523873 ) ( ON ?auto_523871 ?auto_523872 ) ( CLEAR ?auto_523869 ) ( ON ?auto_523870 ?auto_523871 ) ( CLEAR ?auto_523870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_523865 ?auto_523866 ?auto_523867 ?auto_523868 ?auto_523869 ?auto_523870 )
      ( MAKE-12PILE ?auto_523865 ?auto_523866 ?auto_523867 ?auto_523868 ?auto_523869 ?auto_523870 ?auto_523871 ?auto_523872 ?auto_523873 ?auto_523874 ?auto_523875 ?auto_523876 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_523915 - BLOCK
      ?auto_523916 - BLOCK
      ?auto_523917 - BLOCK
      ?auto_523918 - BLOCK
      ?auto_523919 - BLOCK
      ?auto_523920 - BLOCK
      ?auto_523921 - BLOCK
      ?auto_523922 - BLOCK
      ?auto_523923 - BLOCK
      ?auto_523924 - BLOCK
      ?auto_523925 - BLOCK
      ?auto_523926 - BLOCK
    )
    :vars
    (
      ?auto_523927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523926 ?auto_523927 ) ( ON-TABLE ?auto_523915 ) ( ON ?auto_523916 ?auto_523915 ) ( ON ?auto_523917 ?auto_523916 ) ( ON ?auto_523918 ?auto_523917 ) ( not ( = ?auto_523915 ?auto_523916 ) ) ( not ( = ?auto_523915 ?auto_523917 ) ) ( not ( = ?auto_523915 ?auto_523918 ) ) ( not ( = ?auto_523915 ?auto_523919 ) ) ( not ( = ?auto_523915 ?auto_523920 ) ) ( not ( = ?auto_523915 ?auto_523921 ) ) ( not ( = ?auto_523915 ?auto_523922 ) ) ( not ( = ?auto_523915 ?auto_523923 ) ) ( not ( = ?auto_523915 ?auto_523924 ) ) ( not ( = ?auto_523915 ?auto_523925 ) ) ( not ( = ?auto_523915 ?auto_523926 ) ) ( not ( = ?auto_523915 ?auto_523927 ) ) ( not ( = ?auto_523916 ?auto_523917 ) ) ( not ( = ?auto_523916 ?auto_523918 ) ) ( not ( = ?auto_523916 ?auto_523919 ) ) ( not ( = ?auto_523916 ?auto_523920 ) ) ( not ( = ?auto_523916 ?auto_523921 ) ) ( not ( = ?auto_523916 ?auto_523922 ) ) ( not ( = ?auto_523916 ?auto_523923 ) ) ( not ( = ?auto_523916 ?auto_523924 ) ) ( not ( = ?auto_523916 ?auto_523925 ) ) ( not ( = ?auto_523916 ?auto_523926 ) ) ( not ( = ?auto_523916 ?auto_523927 ) ) ( not ( = ?auto_523917 ?auto_523918 ) ) ( not ( = ?auto_523917 ?auto_523919 ) ) ( not ( = ?auto_523917 ?auto_523920 ) ) ( not ( = ?auto_523917 ?auto_523921 ) ) ( not ( = ?auto_523917 ?auto_523922 ) ) ( not ( = ?auto_523917 ?auto_523923 ) ) ( not ( = ?auto_523917 ?auto_523924 ) ) ( not ( = ?auto_523917 ?auto_523925 ) ) ( not ( = ?auto_523917 ?auto_523926 ) ) ( not ( = ?auto_523917 ?auto_523927 ) ) ( not ( = ?auto_523918 ?auto_523919 ) ) ( not ( = ?auto_523918 ?auto_523920 ) ) ( not ( = ?auto_523918 ?auto_523921 ) ) ( not ( = ?auto_523918 ?auto_523922 ) ) ( not ( = ?auto_523918 ?auto_523923 ) ) ( not ( = ?auto_523918 ?auto_523924 ) ) ( not ( = ?auto_523918 ?auto_523925 ) ) ( not ( = ?auto_523918 ?auto_523926 ) ) ( not ( = ?auto_523918 ?auto_523927 ) ) ( not ( = ?auto_523919 ?auto_523920 ) ) ( not ( = ?auto_523919 ?auto_523921 ) ) ( not ( = ?auto_523919 ?auto_523922 ) ) ( not ( = ?auto_523919 ?auto_523923 ) ) ( not ( = ?auto_523919 ?auto_523924 ) ) ( not ( = ?auto_523919 ?auto_523925 ) ) ( not ( = ?auto_523919 ?auto_523926 ) ) ( not ( = ?auto_523919 ?auto_523927 ) ) ( not ( = ?auto_523920 ?auto_523921 ) ) ( not ( = ?auto_523920 ?auto_523922 ) ) ( not ( = ?auto_523920 ?auto_523923 ) ) ( not ( = ?auto_523920 ?auto_523924 ) ) ( not ( = ?auto_523920 ?auto_523925 ) ) ( not ( = ?auto_523920 ?auto_523926 ) ) ( not ( = ?auto_523920 ?auto_523927 ) ) ( not ( = ?auto_523921 ?auto_523922 ) ) ( not ( = ?auto_523921 ?auto_523923 ) ) ( not ( = ?auto_523921 ?auto_523924 ) ) ( not ( = ?auto_523921 ?auto_523925 ) ) ( not ( = ?auto_523921 ?auto_523926 ) ) ( not ( = ?auto_523921 ?auto_523927 ) ) ( not ( = ?auto_523922 ?auto_523923 ) ) ( not ( = ?auto_523922 ?auto_523924 ) ) ( not ( = ?auto_523922 ?auto_523925 ) ) ( not ( = ?auto_523922 ?auto_523926 ) ) ( not ( = ?auto_523922 ?auto_523927 ) ) ( not ( = ?auto_523923 ?auto_523924 ) ) ( not ( = ?auto_523923 ?auto_523925 ) ) ( not ( = ?auto_523923 ?auto_523926 ) ) ( not ( = ?auto_523923 ?auto_523927 ) ) ( not ( = ?auto_523924 ?auto_523925 ) ) ( not ( = ?auto_523924 ?auto_523926 ) ) ( not ( = ?auto_523924 ?auto_523927 ) ) ( not ( = ?auto_523925 ?auto_523926 ) ) ( not ( = ?auto_523925 ?auto_523927 ) ) ( not ( = ?auto_523926 ?auto_523927 ) ) ( ON ?auto_523925 ?auto_523926 ) ( ON ?auto_523924 ?auto_523925 ) ( ON ?auto_523923 ?auto_523924 ) ( ON ?auto_523922 ?auto_523923 ) ( ON ?auto_523921 ?auto_523922 ) ( ON ?auto_523920 ?auto_523921 ) ( CLEAR ?auto_523918 ) ( ON ?auto_523919 ?auto_523920 ) ( CLEAR ?auto_523919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_523915 ?auto_523916 ?auto_523917 ?auto_523918 ?auto_523919 )
      ( MAKE-12PILE ?auto_523915 ?auto_523916 ?auto_523917 ?auto_523918 ?auto_523919 ?auto_523920 ?auto_523921 ?auto_523922 ?auto_523923 ?auto_523924 ?auto_523925 ?auto_523926 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_523965 - BLOCK
      ?auto_523966 - BLOCK
      ?auto_523967 - BLOCK
      ?auto_523968 - BLOCK
      ?auto_523969 - BLOCK
      ?auto_523970 - BLOCK
      ?auto_523971 - BLOCK
      ?auto_523972 - BLOCK
      ?auto_523973 - BLOCK
      ?auto_523974 - BLOCK
      ?auto_523975 - BLOCK
      ?auto_523976 - BLOCK
    )
    :vars
    (
      ?auto_523977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_523976 ?auto_523977 ) ( ON-TABLE ?auto_523965 ) ( ON ?auto_523966 ?auto_523965 ) ( ON ?auto_523967 ?auto_523966 ) ( not ( = ?auto_523965 ?auto_523966 ) ) ( not ( = ?auto_523965 ?auto_523967 ) ) ( not ( = ?auto_523965 ?auto_523968 ) ) ( not ( = ?auto_523965 ?auto_523969 ) ) ( not ( = ?auto_523965 ?auto_523970 ) ) ( not ( = ?auto_523965 ?auto_523971 ) ) ( not ( = ?auto_523965 ?auto_523972 ) ) ( not ( = ?auto_523965 ?auto_523973 ) ) ( not ( = ?auto_523965 ?auto_523974 ) ) ( not ( = ?auto_523965 ?auto_523975 ) ) ( not ( = ?auto_523965 ?auto_523976 ) ) ( not ( = ?auto_523965 ?auto_523977 ) ) ( not ( = ?auto_523966 ?auto_523967 ) ) ( not ( = ?auto_523966 ?auto_523968 ) ) ( not ( = ?auto_523966 ?auto_523969 ) ) ( not ( = ?auto_523966 ?auto_523970 ) ) ( not ( = ?auto_523966 ?auto_523971 ) ) ( not ( = ?auto_523966 ?auto_523972 ) ) ( not ( = ?auto_523966 ?auto_523973 ) ) ( not ( = ?auto_523966 ?auto_523974 ) ) ( not ( = ?auto_523966 ?auto_523975 ) ) ( not ( = ?auto_523966 ?auto_523976 ) ) ( not ( = ?auto_523966 ?auto_523977 ) ) ( not ( = ?auto_523967 ?auto_523968 ) ) ( not ( = ?auto_523967 ?auto_523969 ) ) ( not ( = ?auto_523967 ?auto_523970 ) ) ( not ( = ?auto_523967 ?auto_523971 ) ) ( not ( = ?auto_523967 ?auto_523972 ) ) ( not ( = ?auto_523967 ?auto_523973 ) ) ( not ( = ?auto_523967 ?auto_523974 ) ) ( not ( = ?auto_523967 ?auto_523975 ) ) ( not ( = ?auto_523967 ?auto_523976 ) ) ( not ( = ?auto_523967 ?auto_523977 ) ) ( not ( = ?auto_523968 ?auto_523969 ) ) ( not ( = ?auto_523968 ?auto_523970 ) ) ( not ( = ?auto_523968 ?auto_523971 ) ) ( not ( = ?auto_523968 ?auto_523972 ) ) ( not ( = ?auto_523968 ?auto_523973 ) ) ( not ( = ?auto_523968 ?auto_523974 ) ) ( not ( = ?auto_523968 ?auto_523975 ) ) ( not ( = ?auto_523968 ?auto_523976 ) ) ( not ( = ?auto_523968 ?auto_523977 ) ) ( not ( = ?auto_523969 ?auto_523970 ) ) ( not ( = ?auto_523969 ?auto_523971 ) ) ( not ( = ?auto_523969 ?auto_523972 ) ) ( not ( = ?auto_523969 ?auto_523973 ) ) ( not ( = ?auto_523969 ?auto_523974 ) ) ( not ( = ?auto_523969 ?auto_523975 ) ) ( not ( = ?auto_523969 ?auto_523976 ) ) ( not ( = ?auto_523969 ?auto_523977 ) ) ( not ( = ?auto_523970 ?auto_523971 ) ) ( not ( = ?auto_523970 ?auto_523972 ) ) ( not ( = ?auto_523970 ?auto_523973 ) ) ( not ( = ?auto_523970 ?auto_523974 ) ) ( not ( = ?auto_523970 ?auto_523975 ) ) ( not ( = ?auto_523970 ?auto_523976 ) ) ( not ( = ?auto_523970 ?auto_523977 ) ) ( not ( = ?auto_523971 ?auto_523972 ) ) ( not ( = ?auto_523971 ?auto_523973 ) ) ( not ( = ?auto_523971 ?auto_523974 ) ) ( not ( = ?auto_523971 ?auto_523975 ) ) ( not ( = ?auto_523971 ?auto_523976 ) ) ( not ( = ?auto_523971 ?auto_523977 ) ) ( not ( = ?auto_523972 ?auto_523973 ) ) ( not ( = ?auto_523972 ?auto_523974 ) ) ( not ( = ?auto_523972 ?auto_523975 ) ) ( not ( = ?auto_523972 ?auto_523976 ) ) ( not ( = ?auto_523972 ?auto_523977 ) ) ( not ( = ?auto_523973 ?auto_523974 ) ) ( not ( = ?auto_523973 ?auto_523975 ) ) ( not ( = ?auto_523973 ?auto_523976 ) ) ( not ( = ?auto_523973 ?auto_523977 ) ) ( not ( = ?auto_523974 ?auto_523975 ) ) ( not ( = ?auto_523974 ?auto_523976 ) ) ( not ( = ?auto_523974 ?auto_523977 ) ) ( not ( = ?auto_523975 ?auto_523976 ) ) ( not ( = ?auto_523975 ?auto_523977 ) ) ( not ( = ?auto_523976 ?auto_523977 ) ) ( ON ?auto_523975 ?auto_523976 ) ( ON ?auto_523974 ?auto_523975 ) ( ON ?auto_523973 ?auto_523974 ) ( ON ?auto_523972 ?auto_523973 ) ( ON ?auto_523971 ?auto_523972 ) ( ON ?auto_523970 ?auto_523971 ) ( ON ?auto_523969 ?auto_523970 ) ( CLEAR ?auto_523967 ) ( ON ?auto_523968 ?auto_523969 ) ( CLEAR ?auto_523968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_523965 ?auto_523966 ?auto_523967 ?auto_523968 )
      ( MAKE-12PILE ?auto_523965 ?auto_523966 ?auto_523967 ?auto_523968 ?auto_523969 ?auto_523970 ?auto_523971 ?auto_523972 ?auto_523973 ?auto_523974 ?auto_523975 ?auto_523976 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_524015 - BLOCK
      ?auto_524016 - BLOCK
      ?auto_524017 - BLOCK
      ?auto_524018 - BLOCK
      ?auto_524019 - BLOCK
      ?auto_524020 - BLOCK
      ?auto_524021 - BLOCK
      ?auto_524022 - BLOCK
      ?auto_524023 - BLOCK
      ?auto_524024 - BLOCK
      ?auto_524025 - BLOCK
      ?auto_524026 - BLOCK
    )
    :vars
    (
      ?auto_524027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524026 ?auto_524027 ) ( ON-TABLE ?auto_524015 ) ( ON ?auto_524016 ?auto_524015 ) ( not ( = ?auto_524015 ?auto_524016 ) ) ( not ( = ?auto_524015 ?auto_524017 ) ) ( not ( = ?auto_524015 ?auto_524018 ) ) ( not ( = ?auto_524015 ?auto_524019 ) ) ( not ( = ?auto_524015 ?auto_524020 ) ) ( not ( = ?auto_524015 ?auto_524021 ) ) ( not ( = ?auto_524015 ?auto_524022 ) ) ( not ( = ?auto_524015 ?auto_524023 ) ) ( not ( = ?auto_524015 ?auto_524024 ) ) ( not ( = ?auto_524015 ?auto_524025 ) ) ( not ( = ?auto_524015 ?auto_524026 ) ) ( not ( = ?auto_524015 ?auto_524027 ) ) ( not ( = ?auto_524016 ?auto_524017 ) ) ( not ( = ?auto_524016 ?auto_524018 ) ) ( not ( = ?auto_524016 ?auto_524019 ) ) ( not ( = ?auto_524016 ?auto_524020 ) ) ( not ( = ?auto_524016 ?auto_524021 ) ) ( not ( = ?auto_524016 ?auto_524022 ) ) ( not ( = ?auto_524016 ?auto_524023 ) ) ( not ( = ?auto_524016 ?auto_524024 ) ) ( not ( = ?auto_524016 ?auto_524025 ) ) ( not ( = ?auto_524016 ?auto_524026 ) ) ( not ( = ?auto_524016 ?auto_524027 ) ) ( not ( = ?auto_524017 ?auto_524018 ) ) ( not ( = ?auto_524017 ?auto_524019 ) ) ( not ( = ?auto_524017 ?auto_524020 ) ) ( not ( = ?auto_524017 ?auto_524021 ) ) ( not ( = ?auto_524017 ?auto_524022 ) ) ( not ( = ?auto_524017 ?auto_524023 ) ) ( not ( = ?auto_524017 ?auto_524024 ) ) ( not ( = ?auto_524017 ?auto_524025 ) ) ( not ( = ?auto_524017 ?auto_524026 ) ) ( not ( = ?auto_524017 ?auto_524027 ) ) ( not ( = ?auto_524018 ?auto_524019 ) ) ( not ( = ?auto_524018 ?auto_524020 ) ) ( not ( = ?auto_524018 ?auto_524021 ) ) ( not ( = ?auto_524018 ?auto_524022 ) ) ( not ( = ?auto_524018 ?auto_524023 ) ) ( not ( = ?auto_524018 ?auto_524024 ) ) ( not ( = ?auto_524018 ?auto_524025 ) ) ( not ( = ?auto_524018 ?auto_524026 ) ) ( not ( = ?auto_524018 ?auto_524027 ) ) ( not ( = ?auto_524019 ?auto_524020 ) ) ( not ( = ?auto_524019 ?auto_524021 ) ) ( not ( = ?auto_524019 ?auto_524022 ) ) ( not ( = ?auto_524019 ?auto_524023 ) ) ( not ( = ?auto_524019 ?auto_524024 ) ) ( not ( = ?auto_524019 ?auto_524025 ) ) ( not ( = ?auto_524019 ?auto_524026 ) ) ( not ( = ?auto_524019 ?auto_524027 ) ) ( not ( = ?auto_524020 ?auto_524021 ) ) ( not ( = ?auto_524020 ?auto_524022 ) ) ( not ( = ?auto_524020 ?auto_524023 ) ) ( not ( = ?auto_524020 ?auto_524024 ) ) ( not ( = ?auto_524020 ?auto_524025 ) ) ( not ( = ?auto_524020 ?auto_524026 ) ) ( not ( = ?auto_524020 ?auto_524027 ) ) ( not ( = ?auto_524021 ?auto_524022 ) ) ( not ( = ?auto_524021 ?auto_524023 ) ) ( not ( = ?auto_524021 ?auto_524024 ) ) ( not ( = ?auto_524021 ?auto_524025 ) ) ( not ( = ?auto_524021 ?auto_524026 ) ) ( not ( = ?auto_524021 ?auto_524027 ) ) ( not ( = ?auto_524022 ?auto_524023 ) ) ( not ( = ?auto_524022 ?auto_524024 ) ) ( not ( = ?auto_524022 ?auto_524025 ) ) ( not ( = ?auto_524022 ?auto_524026 ) ) ( not ( = ?auto_524022 ?auto_524027 ) ) ( not ( = ?auto_524023 ?auto_524024 ) ) ( not ( = ?auto_524023 ?auto_524025 ) ) ( not ( = ?auto_524023 ?auto_524026 ) ) ( not ( = ?auto_524023 ?auto_524027 ) ) ( not ( = ?auto_524024 ?auto_524025 ) ) ( not ( = ?auto_524024 ?auto_524026 ) ) ( not ( = ?auto_524024 ?auto_524027 ) ) ( not ( = ?auto_524025 ?auto_524026 ) ) ( not ( = ?auto_524025 ?auto_524027 ) ) ( not ( = ?auto_524026 ?auto_524027 ) ) ( ON ?auto_524025 ?auto_524026 ) ( ON ?auto_524024 ?auto_524025 ) ( ON ?auto_524023 ?auto_524024 ) ( ON ?auto_524022 ?auto_524023 ) ( ON ?auto_524021 ?auto_524022 ) ( ON ?auto_524020 ?auto_524021 ) ( ON ?auto_524019 ?auto_524020 ) ( ON ?auto_524018 ?auto_524019 ) ( CLEAR ?auto_524016 ) ( ON ?auto_524017 ?auto_524018 ) ( CLEAR ?auto_524017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_524015 ?auto_524016 ?auto_524017 )
      ( MAKE-12PILE ?auto_524015 ?auto_524016 ?auto_524017 ?auto_524018 ?auto_524019 ?auto_524020 ?auto_524021 ?auto_524022 ?auto_524023 ?auto_524024 ?auto_524025 ?auto_524026 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_524065 - BLOCK
      ?auto_524066 - BLOCK
      ?auto_524067 - BLOCK
      ?auto_524068 - BLOCK
      ?auto_524069 - BLOCK
      ?auto_524070 - BLOCK
      ?auto_524071 - BLOCK
      ?auto_524072 - BLOCK
      ?auto_524073 - BLOCK
      ?auto_524074 - BLOCK
      ?auto_524075 - BLOCK
      ?auto_524076 - BLOCK
    )
    :vars
    (
      ?auto_524077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524076 ?auto_524077 ) ( ON-TABLE ?auto_524065 ) ( not ( = ?auto_524065 ?auto_524066 ) ) ( not ( = ?auto_524065 ?auto_524067 ) ) ( not ( = ?auto_524065 ?auto_524068 ) ) ( not ( = ?auto_524065 ?auto_524069 ) ) ( not ( = ?auto_524065 ?auto_524070 ) ) ( not ( = ?auto_524065 ?auto_524071 ) ) ( not ( = ?auto_524065 ?auto_524072 ) ) ( not ( = ?auto_524065 ?auto_524073 ) ) ( not ( = ?auto_524065 ?auto_524074 ) ) ( not ( = ?auto_524065 ?auto_524075 ) ) ( not ( = ?auto_524065 ?auto_524076 ) ) ( not ( = ?auto_524065 ?auto_524077 ) ) ( not ( = ?auto_524066 ?auto_524067 ) ) ( not ( = ?auto_524066 ?auto_524068 ) ) ( not ( = ?auto_524066 ?auto_524069 ) ) ( not ( = ?auto_524066 ?auto_524070 ) ) ( not ( = ?auto_524066 ?auto_524071 ) ) ( not ( = ?auto_524066 ?auto_524072 ) ) ( not ( = ?auto_524066 ?auto_524073 ) ) ( not ( = ?auto_524066 ?auto_524074 ) ) ( not ( = ?auto_524066 ?auto_524075 ) ) ( not ( = ?auto_524066 ?auto_524076 ) ) ( not ( = ?auto_524066 ?auto_524077 ) ) ( not ( = ?auto_524067 ?auto_524068 ) ) ( not ( = ?auto_524067 ?auto_524069 ) ) ( not ( = ?auto_524067 ?auto_524070 ) ) ( not ( = ?auto_524067 ?auto_524071 ) ) ( not ( = ?auto_524067 ?auto_524072 ) ) ( not ( = ?auto_524067 ?auto_524073 ) ) ( not ( = ?auto_524067 ?auto_524074 ) ) ( not ( = ?auto_524067 ?auto_524075 ) ) ( not ( = ?auto_524067 ?auto_524076 ) ) ( not ( = ?auto_524067 ?auto_524077 ) ) ( not ( = ?auto_524068 ?auto_524069 ) ) ( not ( = ?auto_524068 ?auto_524070 ) ) ( not ( = ?auto_524068 ?auto_524071 ) ) ( not ( = ?auto_524068 ?auto_524072 ) ) ( not ( = ?auto_524068 ?auto_524073 ) ) ( not ( = ?auto_524068 ?auto_524074 ) ) ( not ( = ?auto_524068 ?auto_524075 ) ) ( not ( = ?auto_524068 ?auto_524076 ) ) ( not ( = ?auto_524068 ?auto_524077 ) ) ( not ( = ?auto_524069 ?auto_524070 ) ) ( not ( = ?auto_524069 ?auto_524071 ) ) ( not ( = ?auto_524069 ?auto_524072 ) ) ( not ( = ?auto_524069 ?auto_524073 ) ) ( not ( = ?auto_524069 ?auto_524074 ) ) ( not ( = ?auto_524069 ?auto_524075 ) ) ( not ( = ?auto_524069 ?auto_524076 ) ) ( not ( = ?auto_524069 ?auto_524077 ) ) ( not ( = ?auto_524070 ?auto_524071 ) ) ( not ( = ?auto_524070 ?auto_524072 ) ) ( not ( = ?auto_524070 ?auto_524073 ) ) ( not ( = ?auto_524070 ?auto_524074 ) ) ( not ( = ?auto_524070 ?auto_524075 ) ) ( not ( = ?auto_524070 ?auto_524076 ) ) ( not ( = ?auto_524070 ?auto_524077 ) ) ( not ( = ?auto_524071 ?auto_524072 ) ) ( not ( = ?auto_524071 ?auto_524073 ) ) ( not ( = ?auto_524071 ?auto_524074 ) ) ( not ( = ?auto_524071 ?auto_524075 ) ) ( not ( = ?auto_524071 ?auto_524076 ) ) ( not ( = ?auto_524071 ?auto_524077 ) ) ( not ( = ?auto_524072 ?auto_524073 ) ) ( not ( = ?auto_524072 ?auto_524074 ) ) ( not ( = ?auto_524072 ?auto_524075 ) ) ( not ( = ?auto_524072 ?auto_524076 ) ) ( not ( = ?auto_524072 ?auto_524077 ) ) ( not ( = ?auto_524073 ?auto_524074 ) ) ( not ( = ?auto_524073 ?auto_524075 ) ) ( not ( = ?auto_524073 ?auto_524076 ) ) ( not ( = ?auto_524073 ?auto_524077 ) ) ( not ( = ?auto_524074 ?auto_524075 ) ) ( not ( = ?auto_524074 ?auto_524076 ) ) ( not ( = ?auto_524074 ?auto_524077 ) ) ( not ( = ?auto_524075 ?auto_524076 ) ) ( not ( = ?auto_524075 ?auto_524077 ) ) ( not ( = ?auto_524076 ?auto_524077 ) ) ( ON ?auto_524075 ?auto_524076 ) ( ON ?auto_524074 ?auto_524075 ) ( ON ?auto_524073 ?auto_524074 ) ( ON ?auto_524072 ?auto_524073 ) ( ON ?auto_524071 ?auto_524072 ) ( ON ?auto_524070 ?auto_524071 ) ( ON ?auto_524069 ?auto_524070 ) ( ON ?auto_524068 ?auto_524069 ) ( ON ?auto_524067 ?auto_524068 ) ( CLEAR ?auto_524065 ) ( ON ?auto_524066 ?auto_524067 ) ( CLEAR ?auto_524066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_524065 ?auto_524066 )
      ( MAKE-12PILE ?auto_524065 ?auto_524066 ?auto_524067 ?auto_524068 ?auto_524069 ?auto_524070 ?auto_524071 ?auto_524072 ?auto_524073 ?auto_524074 ?auto_524075 ?auto_524076 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_524115 - BLOCK
      ?auto_524116 - BLOCK
      ?auto_524117 - BLOCK
      ?auto_524118 - BLOCK
      ?auto_524119 - BLOCK
      ?auto_524120 - BLOCK
      ?auto_524121 - BLOCK
      ?auto_524122 - BLOCK
      ?auto_524123 - BLOCK
      ?auto_524124 - BLOCK
      ?auto_524125 - BLOCK
      ?auto_524126 - BLOCK
    )
    :vars
    (
      ?auto_524127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524126 ?auto_524127 ) ( not ( = ?auto_524115 ?auto_524116 ) ) ( not ( = ?auto_524115 ?auto_524117 ) ) ( not ( = ?auto_524115 ?auto_524118 ) ) ( not ( = ?auto_524115 ?auto_524119 ) ) ( not ( = ?auto_524115 ?auto_524120 ) ) ( not ( = ?auto_524115 ?auto_524121 ) ) ( not ( = ?auto_524115 ?auto_524122 ) ) ( not ( = ?auto_524115 ?auto_524123 ) ) ( not ( = ?auto_524115 ?auto_524124 ) ) ( not ( = ?auto_524115 ?auto_524125 ) ) ( not ( = ?auto_524115 ?auto_524126 ) ) ( not ( = ?auto_524115 ?auto_524127 ) ) ( not ( = ?auto_524116 ?auto_524117 ) ) ( not ( = ?auto_524116 ?auto_524118 ) ) ( not ( = ?auto_524116 ?auto_524119 ) ) ( not ( = ?auto_524116 ?auto_524120 ) ) ( not ( = ?auto_524116 ?auto_524121 ) ) ( not ( = ?auto_524116 ?auto_524122 ) ) ( not ( = ?auto_524116 ?auto_524123 ) ) ( not ( = ?auto_524116 ?auto_524124 ) ) ( not ( = ?auto_524116 ?auto_524125 ) ) ( not ( = ?auto_524116 ?auto_524126 ) ) ( not ( = ?auto_524116 ?auto_524127 ) ) ( not ( = ?auto_524117 ?auto_524118 ) ) ( not ( = ?auto_524117 ?auto_524119 ) ) ( not ( = ?auto_524117 ?auto_524120 ) ) ( not ( = ?auto_524117 ?auto_524121 ) ) ( not ( = ?auto_524117 ?auto_524122 ) ) ( not ( = ?auto_524117 ?auto_524123 ) ) ( not ( = ?auto_524117 ?auto_524124 ) ) ( not ( = ?auto_524117 ?auto_524125 ) ) ( not ( = ?auto_524117 ?auto_524126 ) ) ( not ( = ?auto_524117 ?auto_524127 ) ) ( not ( = ?auto_524118 ?auto_524119 ) ) ( not ( = ?auto_524118 ?auto_524120 ) ) ( not ( = ?auto_524118 ?auto_524121 ) ) ( not ( = ?auto_524118 ?auto_524122 ) ) ( not ( = ?auto_524118 ?auto_524123 ) ) ( not ( = ?auto_524118 ?auto_524124 ) ) ( not ( = ?auto_524118 ?auto_524125 ) ) ( not ( = ?auto_524118 ?auto_524126 ) ) ( not ( = ?auto_524118 ?auto_524127 ) ) ( not ( = ?auto_524119 ?auto_524120 ) ) ( not ( = ?auto_524119 ?auto_524121 ) ) ( not ( = ?auto_524119 ?auto_524122 ) ) ( not ( = ?auto_524119 ?auto_524123 ) ) ( not ( = ?auto_524119 ?auto_524124 ) ) ( not ( = ?auto_524119 ?auto_524125 ) ) ( not ( = ?auto_524119 ?auto_524126 ) ) ( not ( = ?auto_524119 ?auto_524127 ) ) ( not ( = ?auto_524120 ?auto_524121 ) ) ( not ( = ?auto_524120 ?auto_524122 ) ) ( not ( = ?auto_524120 ?auto_524123 ) ) ( not ( = ?auto_524120 ?auto_524124 ) ) ( not ( = ?auto_524120 ?auto_524125 ) ) ( not ( = ?auto_524120 ?auto_524126 ) ) ( not ( = ?auto_524120 ?auto_524127 ) ) ( not ( = ?auto_524121 ?auto_524122 ) ) ( not ( = ?auto_524121 ?auto_524123 ) ) ( not ( = ?auto_524121 ?auto_524124 ) ) ( not ( = ?auto_524121 ?auto_524125 ) ) ( not ( = ?auto_524121 ?auto_524126 ) ) ( not ( = ?auto_524121 ?auto_524127 ) ) ( not ( = ?auto_524122 ?auto_524123 ) ) ( not ( = ?auto_524122 ?auto_524124 ) ) ( not ( = ?auto_524122 ?auto_524125 ) ) ( not ( = ?auto_524122 ?auto_524126 ) ) ( not ( = ?auto_524122 ?auto_524127 ) ) ( not ( = ?auto_524123 ?auto_524124 ) ) ( not ( = ?auto_524123 ?auto_524125 ) ) ( not ( = ?auto_524123 ?auto_524126 ) ) ( not ( = ?auto_524123 ?auto_524127 ) ) ( not ( = ?auto_524124 ?auto_524125 ) ) ( not ( = ?auto_524124 ?auto_524126 ) ) ( not ( = ?auto_524124 ?auto_524127 ) ) ( not ( = ?auto_524125 ?auto_524126 ) ) ( not ( = ?auto_524125 ?auto_524127 ) ) ( not ( = ?auto_524126 ?auto_524127 ) ) ( ON ?auto_524125 ?auto_524126 ) ( ON ?auto_524124 ?auto_524125 ) ( ON ?auto_524123 ?auto_524124 ) ( ON ?auto_524122 ?auto_524123 ) ( ON ?auto_524121 ?auto_524122 ) ( ON ?auto_524120 ?auto_524121 ) ( ON ?auto_524119 ?auto_524120 ) ( ON ?auto_524118 ?auto_524119 ) ( ON ?auto_524117 ?auto_524118 ) ( ON ?auto_524116 ?auto_524117 ) ( ON ?auto_524115 ?auto_524116 ) ( CLEAR ?auto_524115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_524115 )
      ( MAKE-12PILE ?auto_524115 ?auto_524116 ?auto_524117 ?auto_524118 ?auto_524119 ?auto_524120 ?auto_524121 ?auto_524122 ?auto_524123 ?auto_524124 ?auto_524125 ?auto_524126 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_524166 - BLOCK
      ?auto_524167 - BLOCK
      ?auto_524168 - BLOCK
      ?auto_524169 - BLOCK
      ?auto_524170 - BLOCK
      ?auto_524171 - BLOCK
      ?auto_524172 - BLOCK
      ?auto_524173 - BLOCK
      ?auto_524174 - BLOCK
      ?auto_524175 - BLOCK
      ?auto_524176 - BLOCK
      ?auto_524177 - BLOCK
      ?auto_524178 - BLOCK
    )
    :vars
    (
      ?auto_524179 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_524177 ) ( ON ?auto_524178 ?auto_524179 ) ( CLEAR ?auto_524178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_524166 ) ( ON ?auto_524167 ?auto_524166 ) ( ON ?auto_524168 ?auto_524167 ) ( ON ?auto_524169 ?auto_524168 ) ( ON ?auto_524170 ?auto_524169 ) ( ON ?auto_524171 ?auto_524170 ) ( ON ?auto_524172 ?auto_524171 ) ( ON ?auto_524173 ?auto_524172 ) ( ON ?auto_524174 ?auto_524173 ) ( ON ?auto_524175 ?auto_524174 ) ( ON ?auto_524176 ?auto_524175 ) ( ON ?auto_524177 ?auto_524176 ) ( not ( = ?auto_524166 ?auto_524167 ) ) ( not ( = ?auto_524166 ?auto_524168 ) ) ( not ( = ?auto_524166 ?auto_524169 ) ) ( not ( = ?auto_524166 ?auto_524170 ) ) ( not ( = ?auto_524166 ?auto_524171 ) ) ( not ( = ?auto_524166 ?auto_524172 ) ) ( not ( = ?auto_524166 ?auto_524173 ) ) ( not ( = ?auto_524166 ?auto_524174 ) ) ( not ( = ?auto_524166 ?auto_524175 ) ) ( not ( = ?auto_524166 ?auto_524176 ) ) ( not ( = ?auto_524166 ?auto_524177 ) ) ( not ( = ?auto_524166 ?auto_524178 ) ) ( not ( = ?auto_524166 ?auto_524179 ) ) ( not ( = ?auto_524167 ?auto_524168 ) ) ( not ( = ?auto_524167 ?auto_524169 ) ) ( not ( = ?auto_524167 ?auto_524170 ) ) ( not ( = ?auto_524167 ?auto_524171 ) ) ( not ( = ?auto_524167 ?auto_524172 ) ) ( not ( = ?auto_524167 ?auto_524173 ) ) ( not ( = ?auto_524167 ?auto_524174 ) ) ( not ( = ?auto_524167 ?auto_524175 ) ) ( not ( = ?auto_524167 ?auto_524176 ) ) ( not ( = ?auto_524167 ?auto_524177 ) ) ( not ( = ?auto_524167 ?auto_524178 ) ) ( not ( = ?auto_524167 ?auto_524179 ) ) ( not ( = ?auto_524168 ?auto_524169 ) ) ( not ( = ?auto_524168 ?auto_524170 ) ) ( not ( = ?auto_524168 ?auto_524171 ) ) ( not ( = ?auto_524168 ?auto_524172 ) ) ( not ( = ?auto_524168 ?auto_524173 ) ) ( not ( = ?auto_524168 ?auto_524174 ) ) ( not ( = ?auto_524168 ?auto_524175 ) ) ( not ( = ?auto_524168 ?auto_524176 ) ) ( not ( = ?auto_524168 ?auto_524177 ) ) ( not ( = ?auto_524168 ?auto_524178 ) ) ( not ( = ?auto_524168 ?auto_524179 ) ) ( not ( = ?auto_524169 ?auto_524170 ) ) ( not ( = ?auto_524169 ?auto_524171 ) ) ( not ( = ?auto_524169 ?auto_524172 ) ) ( not ( = ?auto_524169 ?auto_524173 ) ) ( not ( = ?auto_524169 ?auto_524174 ) ) ( not ( = ?auto_524169 ?auto_524175 ) ) ( not ( = ?auto_524169 ?auto_524176 ) ) ( not ( = ?auto_524169 ?auto_524177 ) ) ( not ( = ?auto_524169 ?auto_524178 ) ) ( not ( = ?auto_524169 ?auto_524179 ) ) ( not ( = ?auto_524170 ?auto_524171 ) ) ( not ( = ?auto_524170 ?auto_524172 ) ) ( not ( = ?auto_524170 ?auto_524173 ) ) ( not ( = ?auto_524170 ?auto_524174 ) ) ( not ( = ?auto_524170 ?auto_524175 ) ) ( not ( = ?auto_524170 ?auto_524176 ) ) ( not ( = ?auto_524170 ?auto_524177 ) ) ( not ( = ?auto_524170 ?auto_524178 ) ) ( not ( = ?auto_524170 ?auto_524179 ) ) ( not ( = ?auto_524171 ?auto_524172 ) ) ( not ( = ?auto_524171 ?auto_524173 ) ) ( not ( = ?auto_524171 ?auto_524174 ) ) ( not ( = ?auto_524171 ?auto_524175 ) ) ( not ( = ?auto_524171 ?auto_524176 ) ) ( not ( = ?auto_524171 ?auto_524177 ) ) ( not ( = ?auto_524171 ?auto_524178 ) ) ( not ( = ?auto_524171 ?auto_524179 ) ) ( not ( = ?auto_524172 ?auto_524173 ) ) ( not ( = ?auto_524172 ?auto_524174 ) ) ( not ( = ?auto_524172 ?auto_524175 ) ) ( not ( = ?auto_524172 ?auto_524176 ) ) ( not ( = ?auto_524172 ?auto_524177 ) ) ( not ( = ?auto_524172 ?auto_524178 ) ) ( not ( = ?auto_524172 ?auto_524179 ) ) ( not ( = ?auto_524173 ?auto_524174 ) ) ( not ( = ?auto_524173 ?auto_524175 ) ) ( not ( = ?auto_524173 ?auto_524176 ) ) ( not ( = ?auto_524173 ?auto_524177 ) ) ( not ( = ?auto_524173 ?auto_524178 ) ) ( not ( = ?auto_524173 ?auto_524179 ) ) ( not ( = ?auto_524174 ?auto_524175 ) ) ( not ( = ?auto_524174 ?auto_524176 ) ) ( not ( = ?auto_524174 ?auto_524177 ) ) ( not ( = ?auto_524174 ?auto_524178 ) ) ( not ( = ?auto_524174 ?auto_524179 ) ) ( not ( = ?auto_524175 ?auto_524176 ) ) ( not ( = ?auto_524175 ?auto_524177 ) ) ( not ( = ?auto_524175 ?auto_524178 ) ) ( not ( = ?auto_524175 ?auto_524179 ) ) ( not ( = ?auto_524176 ?auto_524177 ) ) ( not ( = ?auto_524176 ?auto_524178 ) ) ( not ( = ?auto_524176 ?auto_524179 ) ) ( not ( = ?auto_524177 ?auto_524178 ) ) ( not ( = ?auto_524177 ?auto_524179 ) ) ( not ( = ?auto_524178 ?auto_524179 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_524178 ?auto_524179 )
      ( !STACK ?auto_524178 ?auto_524177 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_524220 - BLOCK
      ?auto_524221 - BLOCK
      ?auto_524222 - BLOCK
      ?auto_524223 - BLOCK
      ?auto_524224 - BLOCK
      ?auto_524225 - BLOCK
      ?auto_524226 - BLOCK
      ?auto_524227 - BLOCK
      ?auto_524228 - BLOCK
      ?auto_524229 - BLOCK
      ?auto_524230 - BLOCK
      ?auto_524231 - BLOCK
      ?auto_524232 - BLOCK
    )
    :vars
    (
      ?auto_524233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524232 ?auto_524233 ) ( ON-TABLE ?auto_524220 ) ( ON ?auto_524221 ?auto_524220 ) ( ON ?auto_524222 ?auto_524221 ) ( ON ?auto_524223 ?auto_524222 ) ( ON ?auto_524224 ?auto_524223 ) ( ON ?auto_524225 ?auto_524224 ) ( ON ?auto_524226 ?auto_524225 ) ( ON ?auto_524227 ?auto_524226 ) ( ON ?auto_524228 ?auto_524227 ) ( ON ?auto_524229 ?auto_524228 ) ( ON ?auto_524230 ?auto_524229 ) ( not ( = ?auto_524220 ?auto_524221 ) ) ( not ( = ?auto_524220 ?auto_524222 ) ) ( not ( = ?auto_524220 ?auto_524223 ) ) ( not ( = ?auto_524220 ?auto_524224 ) ) ( not ( = ?auto_524220 ?auto_524225 ) ) ( not ( = ?auto_524220 ?auto_524226 ) ) ( not ( = ?auto_524220 ?auto_524227 ) ) ( not ( = ?auto_524220 ?auto_524228 ) ) ( not ( = ?auto_524220 ?auto_524229 ) ) ( not ( = ?auto_524220 ?auto_524230 ) ) ( not ( = ?auto_524220 ?auto_524231 ) ) ( not ( = ?auto_524220 ?auto_524232 ) ) ( not ( = ?auto_524220 ?auto_524233 ) ) ( not ( = ?auto_524221 ?auto_524222 ) ) ( not ( = ?auto_524221 ?auto_524223 ) ) ( not ( = ?auto_524221 ?auto_524224 ) ) ( not ( = ?auto_524221 ?auto_524225 ) ) ( not ( = ?auto_524221 ?auto_524226 ) ) ( not ( = ?auto_524221 ?auto_524227 ) ) ( not ( = ?auto_524221 ?auto_524228 ) ) ( not ( = ?auto_524221 ?auto_524229 ) ) ( not ( = ?auto_524221 ?auto_524230 ) ) ( not ( = ?auto_524221 ?auto_524231 ) ) ( not ( = ?auto_524221 ?auto_524232 ) ) ( not ( = ?auto_524221 ?auto_524233 ) ) ( not ( = ?auto_524222 ?auto_524223 ) ) ( not ( = ?auto_524222 ?auto_524224 ) ) ( not ( = ?auto_524222 ?auto_524225 ) ) ( not ( = ?auto_524222 ?auto_524226 ) ) ( not ( = ?auto_524222 ?auto_524227 ) ) ( not ( = ?auto_524222 ?auto_524228 ) ) ( not ( = ?auto_524222 ?auto_524229 ) ) ( not ( = ?auto_524222 ?auto_524230 ) ) ( not ( = ?auto_524222 ?auto_524231 ) ) ( not ( = ?auto_524222 ?auto_524232 ) ) ( not ( = ?auto_524222 ?auto_524233 ) ) ( not ( = ?auto_524223 ?auto_524224 ) ) ( not ( = ?auto_524223 ?auto_524225 ) ) ( not ( = ?auto_524223 ?auto_524226 ) ) ( not ( = ?auto_524223 ?auto_524227 ) ) ( not ( = ?auto_524223 ?auto_524228 ) ) ( not ( = ?auto_524223 ?auto_524229 ) ) ( not ( = ?auto_524223 ?auto_524230 ) ) ( not ( = ?auto_524223 ?auto_524231 ) ) ( not ( = ?auto_524223 ?auto_524232 ) ) ( not ( = ?auto_524223 ?auto_524233 ) ) ( not ( = ?auto_524224 ?auto_524225 ) ) ( not ( = ?auto_524224 ?auto_524226 ) ) ( not ( = ?auto_524224 ?auto_524227 ) ) ( not ( = ?auto_524224 ?auto_524228 ) ) ( not ( = ?auto_524224 ?auto_524229 ) ) ( not ( = ?auto_524224 ?auto_524230 ) ) ( not ( = ?auto_524224 ?auto_524231 ) ) ( not ( = ?auto_524224 ?auto_524232 ) ) ( not ( = ?auto_524224 ?auto_524233 ) ) ( not ( = ?auto_524225 ?auto_524226 ) ) ( not ( = ?auto_524225 ?auto_524227 ) ) ( not ( = ?auto_524225 ?auto_524228 ) ) ( not ( = ?auto_524225 ?auto_524229 ) ) ( not ( = ?auto_524225 ?auto_524230 ) ) ( not ( = ?auto_524225 ?auto_524231 ) ) ( not ( = ?auto_524225 ?auto_524232 ) ) ( not ( = ?auto_524225 ?auto_524233 ) ) ( not ( = ?auto_524226 ?auto_524227 ) ) ( not ( = ?auto_524226 ?auto_524228 ) ) ( not ( = ?auto_524226 ?auto_524229 ) ) ( not ( = ?auto_524226 ?auto_524230 ) ) ( not ( = ?auto_524226 ?auto_524231 ) ) ( not ( = ?auto_524226 ?auto_524232 ) ) ( not ( = ?auto_524226 ?auto_524233 ) ) ( not ( = ?auto_524227 ?auto_524228 ) ) ( not ( = ?auto_524227 ?auto_524229 ) ) ( not ( = ?auto_524227 ?auto_524230 ) ) ( not ( = ?auto_524227 ?auto_524231 ) ) ( not ( = ?auto_524227 ?auto_524232 ) ) ( not ( = ?auto_524227 ?auto_524233 ) ) ( not ( = ?auto_524228 ?auto_524229 ) ) ( not ( = ?auto_524228 ?auto_524230 ) ) ( not ( = ?auto_524228 ?auto_524231 ) ) ( not ( = ?auto_524228 ?auto_524232 ) ) ( not ( = ?auto_524228 ?auto_524233 ) ) ( not ( = ?auto_524229 ?auto_524230 ) ) ( not ( = ?auto_524229 ?auto_524231 ) ) ( not ( = ?auto_524229 ?auto_524232 ) ) ( not ( = ?auto_524229 ?auto_524233 ) ) ( not ( = ?auto_524230 ?auto_524231 ) ) ( not ( = ?auto_524230 ?auto_524232 ) ) ( not ( = ?auto_524230 ?auto_524233 ) ) ( not ( = ?auto_524231 ?auto_524232 ) ) ( not ( = ?auto_524231 ?auto_524233 ) ) ( not ( = ?auto_524232 ?auto_524233 ) ) ( CLEAR ?auto_524230 ) ( ON ?auto_524231 ?auto_524232 ) ( CLEAR ?auto_524231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_524220 ?auto_524221 ?auto_524222 ?auto_524223 ?auto_524224 ?auto_524225 ?auto_524226 ?auto_524227 ?auto_524228 ?auto_524229 ?auto_524230 ?auto_524231 )
      ( MAKE-13PILE ?auto_524220 ?auto_524221 ?auto_524222 ?auto_524223 ?auto_524224 ?auto_524225 ?auto_524226 ?auto_524227 ?auto_524228 ?auto_524229 ?auto_524230 ?auto_524231 ?auto_524232 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_524274 - BLOCK
      ?auto_524275 - BLOCK
      ?auto_524276 - BLOCK
      ?auto_524277 - BLOCK
      ?auto_524278 - BLOCK
      ?auto_524279 - BLOCK
      ?auto_524280 - BLOCK
      ?auto_524281 - BLOCK
      ?auto_524282 - BLOCK
      ?auto_524283 - BLOCK
      ?auto_524284 - BLOCK
      ?auto_524285 - BLOCK
      ?auto_524286 - BLOCK
    )
    :vars
    (
      ?auto_524287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524286 ?auto_524287 ) ( ON-TABLE ?auto_524274 ) ( ON ?auto_524275 ?auto_524274 ) ( ON ?auto_524276 ?auto_524275 ) ( ON ?auto_524277 ?auto_524276 ) ( ON ?auto_524278 ?auto_524277 ) ( ON ?auto_524279 ?auto_524278 ) ( ON ?auto_524280 ?auto_524279 ) ( ON ?auto_524281 ?auto_524280 ) ( ON ?auto_524282 ?auto_524281 ) ( ON ?auto_524283 ?auto_524282 ) ( not ( = ?auto_524274 ?auto_524275 ) ) ( not ( = ?auto_524274 ?auto_524276 ) ) ( not ( = ?auto_524274 ?auto_524277 ) ) ( not ( = ?auto_524274 ?auto_524278 ) ) ( not ( = ?auto_524274 ?auto_524279 ) ) ( not ( = ?auto_524274 ?auto_524280 ) ) ( not ( = ?auto_524274 ?auto_524281 ) ) ( not ( = ?auto_524274 ?auto_524282 ) ) ( not ( = ?auto_524274 ?auto_524283 ) ) ( not ( = ?auto_524274 ?auto_524284 ) ) ( not ( = ?auto_524274 ?auto_524285 ) ) ( not ( = ?auto_524274 ?auto_524286 ) ) ( not ( = ?auto_524274 ?auto_524287 ) ) ( not ( = ?auto_524275 ?auto_524276 ) ) ( not ( = ?auto_524275 ?auto_524277 ) ) ( not ( = ?auto_524275 ?auto_524278 ) ) ( not ( = ?auto_524275 ?auto_524279 ) ) ( not ( = ?auto_524275 ?auto_524280 ) ) ( not ( = ?auto_524275 ?auto_524281 ) ) ( not ( = ?auto_524275 ?auto_524282 ) ) ( not ( = ?auto_524275 ?auto_524283 ) ) ( not ( = ?auto_524275 ?auto_524284 ) ) ( not ( = ?auto_524275 ?auto_524285 ) ) ( not ( = ?auto_524275 ?auto_524286 ) ) ( not ( = ?auto_524275 ?auto_524287 ) ) ( not ( = ?auto_524276 ?auto_524277 ) ) ( not ( = ?auto_524276 ?auto_524278 ) ) ( not ( = ?auto_524276 ?auto_524279 ) ) ( not ( = ?auto_524276 ?auto_524280 ) ) ( not ( = ?auto_524276 ?auto_524281 ) ) ( not ( = ?auto_524276 ?auto_524282 ) ) ( not ( = ?auto_524276 ?auto_524283 ) ) ( not ( = ?auto_524276 ?auto_524284 ) ) ( not ( = ?auto_524276 ?auto_524285 ) ) ( not ( = ?auto_524276 ?auto_524286 ) ) ( not ( = ?auto_524276 ?auto_524287 ) ) ( not ( = ?auto_524277 ?auto_524278 ) ) ( not ( = ?auto_524277 ?auto_524279 ) ) ( not ( = ?auto_524277 ?auto_524280 ) ) ( not ( = ?auto_524277 ?auto_524281 ) ) ( not ( = ?auto_524277 ?auto_524282 ) ) ( not ( = ?auto_524277 ?auto_524283 ) ) ( not ( = ?auto_524277 ?auto_524284 ) ) ( not ( = ?auto_524277 ?auto_524285 ) ) ( not ( = ?auto_524277 ?auto_524286 ) ) ( not ( = ?auto_524277 ?auto_524287 ) ) ( not ( = ?auto_524278 ?auto_524279 ) ) ( not ( = ?auto_524278 ?auto_524280 ) ) ( not ( = ?auto_524278 ?auto_524281 ) ) ( not ( = ?auto_524278 ?auto_524282 ) ) ( not ( = ?auto_524278 ?auto_524283 ) ) ( not ( = ?auto_524278 ?auto_524284 ) ) ( not ( = ?auto_524278 ?auto_524285 ) ) ( not ( = ?auto_524278 ?auto_524286 ) ) ( not ( = ?auto_524278 ?auto_524287 ) ) ( not ( = ?auto_524279 ?auto_524280 ) ) ( not ( = ?auto_524279 ?auto_524281 ) ) ( not ( = ?auto_524279 ?auto_524282 ) ) ( not ( = ?auto_524279 ?auto_524283 ) ) ( not ( = ?auto_524279 ?auto_524284 ) ) ( not ( = ?auto_524279 ?auto_524285 ) ) ( not ( = ?auto_524279 ?auto_524286 ) ) ( not ( = ?auto_524279 ?auto_524287 ) ) ( not ( = ?auto_524280 ?auto_524281 ) ) ( not ( = ?auto_524280 ?auto_524282 ) ) ( not ( = ?auto_524280 ?auto_524283 ) ) ( not ( = ?auto_524280 ?auto_524284 ) ) ( not ( = ?auto_524280 ?auto_524285 ) ) ( not ( = ?auto_524280 ?auto_524286 ) ) ( not ( = ?auto_524280 ?auto_524287 ) ) ( not ( = ?auto_524281 ?auto_524282 ) ) ( not ( = ?auto_524281 ?auto_524283 ) ) ( not ( = ?auto_524281 ?auto_524284 ) ) ( not ( = ?auto_524281 ?auto_524285 ) ) ( not ( = ?auto_524281 ?auto_524286 ) ) ( not ( = ?auto_524281 ?auto_524287 ) ) ( not ( = ?auto_524282 ?auto_524283 ) ) ( not ( = ?auto_524282 ?auto_524284 ) ) ( not ( = ?auto_524282 ?auto_524285 ) ) ( not ( = ?auto_524282 ?auto_524286 ) ) ( not ( = ?auto_524282 ?auto_524287 ) ) ( not ( = ?auto_524283 ?auto_524284 ) ) ( not ( = ?auto_524283 ?auto_524285 ) ) ( not ( = ?auto_524283 ?auto_524286 ) ) ( not ( = ?auto_524283 ?auto_524287 ) ) ( not ( = ?auto_524284 ?auto_524285 ) ) ( not ( = ?auto_524284 ?auto_524286 ) ) ( not ( = ?auto_524284 ?auto_524287 ) ) ( not ( = ?auto_524285 ?auto_524286 ) ) ( not ( = ?auto_524285 ?auto_524287 ) ) ( not ( = ?auto_524286 ?auto_524287 ) ) ( ON ?auto_524285 ?auto_524286 ) ( CLEAR ?auto_524283 ) ( ON ?auto_524284 ?auto_524285 ) ( CLEAR ?auto_524284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_524274 ?auto_524275 ?auto_524276 ?auto_524277 ?auto_524278 ?auto_524279 ?auto_524280 ?auto_524281 ?auto_524282 ?auto_524283 ?auto_524284 )
      ( MAKE-13PILE ?auto_524274 ?auto_524275 ?auto_524276 ?auto_524277 ?auto_524278 ?auto_524279 ?auto_524280 ?auto_524281 ?auto_524282 ?auto_524283 ?auto_524284 ?auto_524285 ?auto_524286 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_524328 - BLOCK
      ?auto_524329 - BLOCK
      ?auto_524330 - BLOCK
      ?auto_524331 - BLOCK
      ?auto_524332 - BLOCK
      ?auto_524333 - BLOCK
      ?auto_524334 - BLOCK
      ?auto_524335 - BLOCK
      ?auto_524336 - BLOCK
      ?auto_524337 - BLOCK
      ?auto_524338 - BLOCK
      ?auto_524339 - BLOCK
      ?auto_524340 - BLOCK
    )
    :vars
    (
      ?auto_524341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524340 ?auto_524341 ) ( ON-TABLE ?auto_524328 ) ( ON ?auto_524329 ?auto_524328 ) ( ON ?auto_524330 ?auto_524329 ) ( ON ?auto_524331 ?auto_524330 ) ( ON ?auto_524332 ?auto_524331 ) ( ON ?auto_524333 ?auto_524332 ) ( ON ?auto_524334 ?auto_524333 ) ( ON ?auto_524335 ?auto_524334 ) ( ON ?auto_524336 ?auto_524335 ) ( not ( = ?auto_524328 ?auto_524329 ) ) ( not ( = ?auto_524328 ?auto_524330 ) ) ( not ( = ?auto_524328 ?auto_524331 ) ) ( not ( = ?auto_524328 ?auto_524332 ) ) ( not ( = ?auto_524328 ?auto_524333 ) ) ( not ( = ?auto_524328 ?auto_524334 ) ) ( not ( = ?auto_524328 ?auto_524335 ) ) ( not ( = ?auto_524328 ?auto_524336 ) ) ( not ( = ?auto_524328 ?auto_524337 ) ) ( not ( = ?auto_524328 ?auto_524338 ) ) ( not ( = ?auto_524328 ?auto_524339 ) ) ( not ( = ?auto_524328 ?auto_524340 ) ) ( not ( = ?auto_524328 ?auto_524341 ) ) ( not ( = ?auto_524329 ?auto_524330 ) ) ( not ( = ?auto_524329 ?auto_524331 ) ) ( not ( = ?auto_524329 ?auto_524332 ) ) ( not ( = ?auto_524329 ?auto_524333 ) ) ( not ( = ?auto_524329 ?auto_524334 ) ) ( not ( = ?auto_524329 ?auto_524335 ) ) ( not ( = ?auto_524329 ?auto_524336 ) ) ( not ( = ?auto_524329 ?auto_524337 ) ) ( not ( = ?auto_524329 ?auto_524338 ) ) ( not ( = ?auto_524329 ?auto_524339 ) ) ( not ( = ?auto_524329 ?auto_524340 ) ) ( not ( = ?auto_524329 ?auto_524341 ) ) ( not ( = ?auto_524330 ?auto_524331 ) ) ( not ( = ?auto_524330 ?auto_524332 ) ) ( not ( = ?auto_524330 ?auto_524333 ) ) ( not ( = ?auto_524330 ?auto_524334 ) ) ( not ( = ?auto_524330 ?auto_524335 ) ) ( not ( = ?auto_524330 ?auto_524336 ) ) ( not ( = ?auto_524330 ?auto_524337 ) ) ( not ( = ?auto_524330 ?auto_524338 ) ) ( not ( = ?auto_524330 ?auto_524339 ) ) ( not ( = ?auto_524330 ?auto_524340 ) ) ( not ( = ?auto_524330 ?auto_524341 ) ) ( not ( = ?auto_524331 ?auto_524332 ) ) ( not ( = ?auto_524331 ?auto_524333 ) ) ( not ( = ?auto_524331 ?auto_524334 ) ) ( not ( = ?auto_524331 ?auto_524335 ) ) ( not ( = ?auto_524331 ?auto_524336 ) ) ( not ( = ?auto_524331 ?auto_524337 ) ) ( not ( = ?auto_524331 ?auto_524338 ) ) ( not ( = ?auto_524331 ?auto_524339 ) ) ( not ( = ?auto_524331 ?auto_524340 ) ) ( not ( = ?auto_524331 ?auto_524341 ) ) ( not ( = ?auto_524332 ?auto_524333 ) ) ( not ( = ?auto_524332 ?auto_524334 ) ) ( not ( = ?auto_524332 ?auto_524335 ) ) ( not ( = ?auto_524332 ?auto_524336 ) ) ( not ( = ?auto_524332 ?auto_524337 ) ) ( not ( = ?auto_524332 ?auto_524338 ) ) ( not ( = ?auto_524332 ?auto_524339 ) ) ( not ( = ?auto_524332 ?auto_524340 ) ) ( not ( = ?auto_524332 ?auto_524341 ) ) ( not ( = ?auto_524333 ?auto_524334 ) ) ( not ( = ?auto_524333 ?auto_524335 ) ) ( not ( = ?auto_524333 ?auto_524336 ) ) ( not ( = ?auto_524333 ?auto_524337 ) ) ( not ( = ?auto_524333 ?auto_524338 ) ) ( not ( = ?auto_524333 ?auto_524339 ) ) ( not ( = ?auto_524333 ?auto_524340 ) ) ( not ( = ?auto_524333 ?auto_524341 ) ) ( not ( = ?auto_524334 ?auto_524335 ) ) ( not ( = ?auto_524334 ?auto_524336 ) ) ( not ( = ?auto_524334 ?auto_524337 ) ) ( not ( = ?auto_524334 ?auto_524338 ) ) ( not ( = ?auto_524334 ?auto_524339 ) ) ( not ( = ?auto_524334 ?auto_524340 ) ) ( not ( = ?auto_524334 ?auto_524341 ) ) ( not ( = ?auto_524335 ?auto_524336 ) ) ( not ( = ?auto_524335 ?auto_524337 ) ) ( not ( = ?auto_524335 ?auto_524338 ) ) ( not ( = ?auto_524335 ?auto_524339 ) ) ( not ( = ?auto_524335 ?auto_524340 ) ) ( not ( = ?auto_524335 ?auto_524341 ) ) ( not ( = ?auto_524336 ?auto_524337 ) ) ( not ( = ?auto_524336 ?auto_524338 ) ) ( not ( = ?auto_524336 ?auto_524339 ) ) ( not ( = ?auto_524336 ?auto_524340 ) ) ( not ( = ?auto_524336 ?auto_524341 ) ) ( not ( = ?auto_524337 ?auto_524338 ) ) ( not ( = ?auto_524337 ?auto_524339 ) ) ( not ( = ?auto_524337 ?auto_524340 ) ) ( not ( = ?auto_524337 ?auto_524341 ) ) ( not ( = ?auto_524338 ?auto_524339 ) ) ( not ( = ?auto_524338 ?auto_524340 ) ) ( not ( = ?auto_524338 ?auto_524341 ) ) ( not ( = ?auto_524339 ?auto_524340 ) ) ( not ( = ?auto_524339 ?auto_524341 ) ) ( not ( = ?auto_524340 ?auto_524341 ) ) ( ON ?auto_524339 ?auto_524340 ) ( ON ?auto_524338 ?auto_524339 ) ( CLEAR ?auto_524336 ) ( ON ?auto_524337 ?auto_524338 ) ( CLEAR ?auto_524337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_524328 ?auto_524329 ?auto_524330 ?auto_524331 ?auto_524332 ?auto_524333 ?auto_524334 ?auto_524335 ?auto_524336 ?auto_524337 )
      ( MAKE-13PILE ?auto_524328 ?auto_524329 ?auto_524330 ?auto_524331 ?auto_524332 ?auto_524333 ?auto_524334 ?auto_524335 ?auto_524336 ?auto_524337 ?auto_524338 ?auto_524339 ?auto_524340 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_524382 - BLOCK
      ?auto_524383 - BLOCK
      ?auto_524384 - BLOCK
      ?auto_524385 - BLOCK
      ?auto_524386 - BLOCK
      ?auto_524387 - BLOCK
      ?auto_524388 - BLOCK
      ?auto_524389 - BLOCK
      ?auto_524390 - BLOCK
      ?auto_524391 - BLOCK
      ?auto_524392 - BLOCK
      ?auto_524393 - BLOCK
      ?auto_524394 - BLOCK
    )
    :vars
    (
      ?auto_524395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524394 ?auto_524395 ) ( ON-TABLE ?auto_524382 ) ( ON ?auto_524383 ?auto_524382 ) ( ON ?auto_524384 ?auto_524383 ) ( ON ?auto_524385 ?auto_524384 ) ( ON ?auto_524386 ?auto_524385 ) ( ON ?auto_524387 ?auto_524386 ) ( ON ?auto_524388 ?auto_524387 ) ( ON ?auto_524389 ?auto_524388 ) ( not ( = ?auto_524382 ?auto_524383 ) ) ( not ( = ?auto_524382 ?auto_524384 ) ) ( not ( = ?auto_524382 ?auto_524385 ) ) ( not ( = ?auto_524382 ?auto_524386 ) ) ( not ( = ?auto_524382 ?auto_524387 ) ) ( not ( = ?auto_524382 ?auto_524388 ) ) ( not ( = ?auto_524382 ?auto_524389 ) ) ( not ( = ?auto_524382 ?auto_524390 ) ) ( not ( = ?auto_524382 ?auto_524391 ) ) ( not ( = ?auto_524382 ?auto_524392 ) ) ( not ( = ?auto_524382 ?auto_524393 ) ) ( not ( = ?auto_524382 ?auto_524394 ) ) ( not ( = ?auto_524382 ?auto_524395 ) ) ( not ( = ?auto_524383 ?auto_524384 ) ) ( not ( = ?auto_524383 ?auto_524385 ) ) ( not ( = ?auto_524383 ?auto_524386 ) ) ( not ( = ?auto_524383 ?auto_524387 ) ) ( not ( = ?auto_524383 ?auto_524388 ) ) ( not ( = ?auto_524383 ?auto_524389 ) ) ( not ( = ?auto_524383 ?auto_524390 ) ) ( not ( = ?auto_524383 ?auto_524391 ) ) ( not ( = ?auto_524383 ?auto_524392 ) ) ( not ( = ?auto_524383 ?auto_524393 ) ) ( not ( = ?auto_524383 ?auto_524394 ) ) ( not ( = ?auto_524383 ?auto_524395 ) ) ( not ( = ?auto_524384 ?auto_524385 ) ) ( not ( = ?auto_524384 ?auto_524386 ) ) ( not ( = ?auto_524384 ?auto_524387 ) ) ( not ( = ?auto_524384 ?auto_524388 ) ) ( not ( = ?auto_524384 ?auto_524389 ) ) ( not ( = ?auto_524384 ?auto_524390 ) ) ( not ( = ?auto_524384 ?auto_524391 ) ) ( not ( = ?auto_524384 ?auto_524392 ) ) ( not ( = ?auto_524384 ?auto_524393 ) ) ( not ( = ?auto_524384 ?auto_524394 ) ) ( not ( = ?auto_524384 ?auto_524395 ) ) ( not ( = ?auto_524385 ?auto_524386 ) ) ( not ( = ?auto_524385 ?auto_524387 ) ) ( not ( = ?auto_524385 ?auto_524388 ) ) ( not ( = ?auto_524385 ?auto_524389 ) ) ( not ( = ?auto_524385 ?auto_524390 ) ) ( not ( = ?auto_524385 ?auto_524391 ) ) ( not ( = ?auto_524385 ?auto_524392 ) ) ( not ( = ?auto_524385 ?auto_524393 ) ) ( not ( = ?auto_524385 ?auto_524394 ) ) ( not ( = ?auto_524385 ?auto_524395 ) ) ( not ( = ?auto_524386 ?auto_524387 ) ) ( not ( = ?auto_524386 ?auto_524388 ) ) ( not ( = ?auto_524386 ?auto_524389 ) ) ( not ( = ?auto_524386 ?auto_524390 ) ) ( not ( = ?auto_524386 ?auto_524391 ) ) ( not ( = ?auto_524386 ?auto_524392 ) ) ( not ( = ?auto_524386 ?auto_524393 ) ) ( not ( = ?auto_524386 ?auto_524394 ) ) ( not ( = ?auto_524386 ?auto_524395 ) ) ( not ( = ?auto_524387 ?auto_524388 ) ) ( not ( = ?auto_524387 ?auto_524389 ) ) ( not ( = ?auto_524387 ?auto_524390 ) ) ( not ( = ?auto_524387 ?auto_524391 ) ) ( not ( = ?auto_524387 ?auto_524392 ) ) ( not ( = ?auto_524387 ?auto_524393 ) ) ( not ( = ?auto_524387 ?auto_524394 ) ) ( not ( = ?auto_524387 ?auto_524395 ) ) ( not ( = ?auto_524388 ?auto_524389 ) ) ( not ( = ?auto_524388 ?auto_524390 ) ) ( not ( = ?auto_524388 ?auto_524391 ) ) ( not ( = ?auto_524388 ?auto_524392 ) ) ( not ( = ?auto_524388 ?auto_524393 ) ) ( not ( = ?auto_524388 ?auto_524394 ) ) ( not ( = ?auto_524388 ?auto_524395 ) ) ( not ( = ?auto_524389 ?auto_524390 ) ) ( not ( = ?auto_524389 ?auto_524391 ) ) ( not ( = ?auto_524389 ?auto_524392 ) ) ( not ( = ?auto_524389 ?auto_524393 ) ) ( not ( = ?auto_524389 ?auto_524394 ) ) ( not ( = ?auto_524389 ?auto_524395 ) ) ( not ( = ?auto_524390 ?auto_524391 ) ) ( not ( = ?auto_524390 ?auto_524392 ) ) ( not ( = ?auto_524390 ?auto_524393 ) ) ( not ( = ?auto_524390 ?auto_524394 ) ) ( not ( = ?auto_524390 ?auto_524395 ) ) ( not ( = ?auto_524391 ?auto_524392 ) ) ( not ( = ?auto_524391 ?auto_524393 ) ) ( not ( = ?auto_524391 ?auto_524394 ) ) ( not ( = ?auto_524391 ?auto_524395 ) ) ( not ( = ?auto_524392 ?auto_524393 ) ) ( not ( = ?auto_524392 ?auto_524394 ) ) ( not ( = ?auto_524392 ?auto_524395 ) ) ( not ( = ?auto_524393 ?auto_524394 ) ) ( not ( = ?auto_524393 ?auto_524395 ) ) ( not ( = ?auto_524394 ?auto_524395 ) ) ( ON ?auto_524393 ?auto_524394 ) ( ON ?auto_524392 ?auto_524393 ) ( ON ?auto_524391 ?auto_524392 ) ( CLEAR ?auto_524389 ) ( ON ?auto_524390 ?auto_524391 ) ( CLEAR ?auto_524390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_524382 ?auto_524383 ?auto_524384 ?auto_524385 ?auto_524386 ?auto_524387 ?auto_524388 ?auto_524389 ?auto_524390 )
      ( MAKE-13PILE ?auto_524382 ?auto_524383 ?auto_524384 ?auto_524385 ?auto_524386 ?auto_524387 ?auto_524388 ?auto_524389 ?auto_524390 ?auto_524391 ?auto_524392 ?auto_524393 ?auto_524394 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_524436 - BLOCK
      ?auto_524437 - BLOCK
      ?auto_524438 - BLOCK
      ?auto_524439 - BLOCK
      ?auto_524440 - BLOCK
      ?auto_524441 - BLOCK
      ?auto_524442 - BLOCK
      ?auto_524443 - BLOCK
      ?auto_524444 - BLOCK
      ?auto_524445 - BLOCK
      ?auto_524446 - BLOCK
      ?auto_524447 - BLOCK
      ?auto_524448 - BLOCK
    )
    :vars
    (
      ?auto_524449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524448 ?auto_524449 ) ( ON-TABLE ?auto_524436 ) ( ON ?auto_524437 ?auto_524436 ) ( ON ?auto_524438 ?auto_524437 ) ( ON ?auto_524439 ?auto_524438 ) ( ON ?auto_524440 ?auto_524439 ) ( ON ?auto_524441 ?auto_524440 ) ( ON ?auto_524442 ?auto_524441 ) ( not ( = ?auto_524436 ?auto_524437 ) ) ( not ( = ?auto_524436 ?auto_524438 ) ) ( not ( = ?auto_524436 ?auto_524439 ) ) ( not ( = ?auto_524436 ?auto_524440 ) ) ( not ( = ?auto_524436 ?auto_524441 ) ) ( not ( = ?auto_524436 ?auto_524442 ) ) ( not ( = ?auto_524436 ?auto_524443 ) ) ( not ( = ?auto_524436 ?auto_524444 ) ) ( not ( = ?auto_524436 ?auto_524445 ) ) ( not ( = ?auto_524436 ?auto_524446 ) ) ( not ( = ?auto_524436 ?auto_524447 ) ) ( not ( = ?auto_524436 ?auto_524448 ) ) ( not ( = ?auto_524436 ?auto_524449 ) ) ( not ( = ?auto_524437 ?auto_524438 ) ) ( not ( = ?auto_524437 ?auto_524439 ) ) ( not ( = ?auto_524437 ?auto_524440 ) ) ( not ( = ?auto_524437 ?auto_524441 ) ) ( not ( = ?auto_524437 ?auto_524442 ) ) ( not ( = ?auto_524437 ?auto_524443 ) ) ( not ( = ?auto_524437 ?auto_524444 ) ) ( not ( = ?auto_524437 ?auto_524445 ) ) ( not ( = ?auto_524437 ?auto_524446 ) ) ( not ( = ?auto_524437 ?auto_524447 ) ) ( not ( = ?auto_524437 ?auto_524448 ) ) ( not ( = ?auto_524437 ?auto_524449 ) ) ( not ( = ?auto_524438 ?auto_524439 ) ) ( not ( = ?auto_524438 ?auto_524440 ) ) ( not ( = ?auto_524438 ?auto_524441 ) ) ( not ( = ?auto_524438 ?auto_524442 ) ) ( not ( = ?auto_524438 ?auto_524443 ) ) ( not ( = ?auto_524438 ?auto_524444 ) ) ( not ( = ?auto_524438 ?auto_524445 ) ) ( not ( = ?auto_524438 ?auto_524446 ) ) ( not ( = ?auto_524438 ?auto_524447 ) ) ( not ( = ?auto_524438 ?auto_524448 ) ) ( not ( = ?auto_524438 ?auto_524449 ) ) ( not ( = ?auto_524439 ?auto_524440 ) ) ( not ( = ?auto_524439 ?auto_524441 ) ) ( not ( = ?auto_524439 ?auto_524442 ) ) ( not ( = ?auto_524439 ?auto_524443 ) ) ( not ( = ?auto_524439 ?auto_524444 ) ) ( not ( = ?auto_524439 ?auto_524445 ) ) ( not ( = ?auto_524439 ?auto_524446 ) ) ( not ( = ?auto_524439 ?auto_524447 ) ) ( not ( = ?auto_524439 ?auto_524448 ) ) ( not ( = ?auto_524439 ?auto_524449 ) ) ( not ( = ?auto_524440 ?auto_524441 ) ) ( not ( = ?auto_524440 ?auto_524442 ) ) ( not ( = ?auto_524440 ?auto_524443 ) ) ( not ( = ?auto_524440 ?auto_524444 ) ) ( not ( = ?auto_524440 ?auto_524445 ) ) ( not ( = ?auto_524440 ?auto_524446 ) ) ( not ( = ?auto_524440 ?auto_524447 ) ) ( not ( = ?auto_524440 ?auto_524448 ) ) ( not ( = ?auto_524440 ?auto_524449 ) ) ( not ( = ?auto_524441 ?auto_524442 ) ) ( not ( = ?auto_524441 ?auto_524443 ) ) ( not ( = ?auto_524441 ?auto_524444 ) ) ( not ( = ?auto_524441 ?auto_524445 ) ) ( not ( = ?auto_524441 ?auto_524446 ) ) ( not ( = ?auto_524441 ?auto_524447 ) ) ( not ( = ?auto_524441 ?auto_524448 ) ) ( not ( = ?auto_524441 ?auto_524449 ) ) ( not ( = ?auto_524442 ?auto_524443 ) ) ( not ( = ?auto_524442 ?auto_524444 ) ) ( not ( = ?auto_524442 ?auto_524445 ) ) ( not ( = ?auto_524442 ?auto_524446 ) ) ( not ( = ?auto_524442 ?auto_524447 ) ) ( not ( = ?auto_524442 ?auto_524448 ) ) ( not ( = ?auto_524442 ?auto_524449 ) ) ( not ( = ?auto_524443 ?auto_524444 ) ) ( not ( = ?auto_524443 ?auto_524445 ) ) ( not ( = ?auto_524443 ?auto_524446 ) ) ( not ( = ?auto_524443 ?auto_524447 ) ) ( not ( = ?auto_524443 ?auto_524448 ) ) ( not ( = ?auto_524443 ?auto_524449 ) ) ( not ( = ?auto_524444 ?auto_524445 ) ) ( not ( = ?auto_524444 ?auto_524446 ) ) ( not ( = ?auto_524444 ?auto_524447 ) ) ( not ( = ?auto_524444 ?auto_524448 ) ) ( not ( = ?auto_524444 ?auto_524449 ) ) ( not ( = ?auto_524445 ?auto_524446 ) ) ( not ( = ?auto_524445 ?auto_524447 ) ) ( not ( = ?auto_524445 ?auto_524448 ) ) ( not ( = ?auto_524445 ?auto_524449 ) ) ( not ( = ?auto_524446 ?auto_524447 ) ) ( not ( = ?auto_524446 ?auto_524448 ) ) ( not ( = ?auto_524446 ?auto_524449 ) ) ( not ( = ?auto_524447 ?auto_524448 ) ) ( not ( = ?auto_524447 ?auto_524449 ) ) ( not ( = ?auto_524448 ?auto_524449 ) ) ( ON ?auto_524447 ?auto_524448 ) ( ON ?auto_524446 ?auto_524447 ) ( ON ?auto_524445 ?auto_524446 ) ( ON ?auto_524444 ?auto_524445 ) ( CLEAR ?auto_524442 ) ( ON ?auto_524443 ?auto_524444 ) ( CLEAR ?auto_524443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_524436 ?auto_524437 ?auto_524438 ?auto_524439 ?auto_524440 ?auto_524441 ?auto_524442 ?auto_524443 )
      ( MAKE-13PILE ?auto_524436 ?auto_524437 ?auto_524438 ?auto_524439 ?auto_524440 ?auto_524441 ?auto_524442 ?auto_524443 ?auto_524444 ?auto_524445 ?auto_524446 ?auto_524447 ?auto_524448 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_524490 - BLOCK
      ?auto_524491 - BLOCK
      ?auto_524492 - BLOCK
      ?auto_524493 - BLOCK
      ?auto_524494 - BLOCK
      ?auto_524495 - BLOCK
      ?auto_524496 - BLOCK
      ?auto_524497 - BLOCK
      ?auto_524498 - BLOCK
      ?auto_524499 - BLOCK
      ?auto_524500 - BLOCK
      ?auto_524501 - BLOCK
      ?auto_524502 - BLOCK
    )
    :vars
    (
      ?auto_524503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524502 ?auto_524503 ) ( ON-TABLE ?auto_524490 ) ( ON ?auto_524491 ?auto_524490 ) ( ON ?auto_524492 ?auto_524491 ) ( ON ?auto_524493 ?auto_524492 ) ( ON ?auto_524494 ?auto_524493 ) ( ON ?auto_524495 ?auto_524494 ) ( not ( = ?auto_524490 ?auto_524491 ) ) ( not ( = ?auto_524490 ?auto_524492 ) ) ( not ( = ?auto_524490 ?auto_524493 ) ) ( not ( = ?auto_524490 ?auto_524494 ) ) ( not ( = ?auto_524490 ?auto_524495 ) ) ( not ( = ?auto_524490 ?auto_524496 ) ) ( not ( = ?auto_524490 ?auto_524497 ) ) ( not ( = ?auto_524490 ?auto_524498 ) ) ( not ( = ?auto_524490 ?auto_524499 ) ) ( not ( = ?auto_524490 ?auto_524500 ) ) ( not ( = ?auto_524490 ?auto_524501 ) ) ( not ( = ?auto_524490 ?auto_524502 ) ) ( not ( = ?auto_524490 ?auto_524503 ) ) ( not ( = ?auto_524491 ?auto_524492 ) ) ( not ( = ?auto_524491 ?auto_524493 ) ) ( not ( = ?auto_524491 ?auto_524494 ) ) ( not ( = ?auto_524491 ?auto_524495 ) ) ( not ( = ?auto_524491 ?auto_524496 ) ) ( not ( = ?auto_524491 ?auto_524497 ) ) ( not ( = ?auto_524491 ?auto_524498 ) ) ( not ( = ?auto_524491 ?auto_524499 ) ) ( not ( = ?auto_524491 ?auto_524500 ) ) ( not ( = ?auto_524491 ?auto_524501 ) ) ( not ( = ?auto_524491 ?auto_524502 ) ) ( not ( = ?auto_524491 ?auto_524503 ) ) ( not ( = ?auto_524492 ?auto_524493 ) ) ( not ( = ?auto_524492 ?auto_524494 ) ) ( not ( = ?auto_524492 ?auto_524495 ) ) ( not ( = ?auto_524492 ?auto_524496 ) ) ( not ( = ?auto_524492 ?auto_524497 ) ) ( not ( = ?auto_524492 ?auto_524498 ) ) ( not ( = ?auto_524492 ?auto_524499 ) ) ( not ( = ?auto_524492 ?auto_524500 ) ) ( not ( = ?auto_524492 ?auto_524501 ) ) ( not ( = ?auto_524492 ?auto_524502 ) ) ( not ( = ?auto_524492 ?auto_524503 ) ) ( not ( = ?auto_524493 ?auto_524494 ) ) ( not ( = ?auto_524493 ?auto_524495 ) ) ( not ( = ?auto_524493 ?auto_524496 ) ) ( not ( = ?auto_524493 ?auto_524497 ) ) ( not ( = ?auto_524493 ?auto_524498 ) ) ( not ( = ?auto_524493 ?auto_524499 ) ) ( not ( = ?auto_524493 ?auto_524500 ) ) ( not ( = ?auto_524493 ?auto_524501 ) ) ( not ( = ?auto_524493 ?auto_524502 ) ) ( not ( = ?auto_524493 ?auto_524503 ) ) ( not ( = ?auto_524494 ?auto_524495 ) ) ( not ( = ?auto_524494 ?auto_524496 ) ) ( not ( = ?auto_524494 ?auto_524497 ) ) ( not ( = ?auto_524494 ?auto_524498 ) ) ( not ( = ?auto_524494 ?auto_524499 ) ) ( not ( = ?auto_524494 ?auto_524500 ) ) ( not ( = ?auto_524494 ?auto_524501 ) ) ( not ( = ?auto_524494 ?auto_524502 ) ) ( not ( = ?auto_524494 ?auto_524503 ) ) ( not ( = ?auto_524495 ?auto_524496 ) ) ( not ( = ?auto_524495 ?auto_524497 ) ) ( not ( = ?auto_524495 ?auto_524498 ) ) ( not ( = ?auto_524495 ?auto_524499 ) ) ( not ( = ?auto_524495 ?auto_524500 ) ) ( not ( = ?auto_524495 ?auto_524501 ) ) ( not ( = ?auto_524495 ?auto_524502 ) ) ( not ( = ?auto_524495 ?auto_524503 ) ) ( not ( = ?auto_524496 ?auto_524497 ) ) ( not ( = ?auto_524496 ?auto_524498 ) ) ( not ( = ?auto_524496 ?auto_524499 ) ) ( not ( = ?auto_524496 ?auto_524500 ) ) ( not ( = ?auto_524496 ?auto_524501 ) ) ( not ( = ?auto_524496 ?auto_524502 ) ) ( not ( = ?auto_524496 ?auto_524503 ) ) ( not ( = ?auto_524497 ?auto_524498 ) ) ( not ( = ?auto_524497 ?auto_524499 ) ) ( not ( = ?auto_524497 ?auto_524500 ) ) ( not ( = ?auto_524497 ?auto_524501 ) ) ( not ( = ?auto_524497 ?auto_524502 ) ) ( not ( = ?auto_524497 ?auto_524503 ) ) ( not ( = ?auto_524498 ?auto_524499 ) ) ( not ( = ?auto_524498 ?auto_524500 ) ) ( not ( = ?auto_524498 ?auto_524501 ) ) ( not ( = ?auto_524498 ?auto_524502 ) ) ( not ( = ?auto_524498 ?auto_524503 ) ) ( not ( = ?auto_524499 ?auto_524500 ) ) ( not ( = ?auto_524499 ?auto_524501 ) ) ( not ( = ?auto_524499 ?auto_524502 ) ) ( not ( = ?auto_524499 ?auto_524503 ) ) ( not ( = ?auto_524500 ?auto_524501 ) ) ( not ( = ?auto_524500 ?auto_524502 ) ) ( not ( = ?auto_524500 ?auto_524503 ) ) ( not ( = ?auto_524501 ?auto_524502 ) ) ( not ( = ?auto_524501 ?auto_524503 ) ) ( not ( = ?auto_524502 ?auto_524503 ) ) ( ON ?auto_524501 ?auto_524502 ) ( ON ?auto_524500 ?auto_524501 ) ( ON ?auto_524499 ?auto_524500 ) ( ON ?auto_524498 ?auto_524499 ) ( ON ?auto_524497 ?auto_524498 ) ( CLEAR ?auto_524495 ) ( ON ?auto_524496 ?auto_524497 ) ( CLEAR ?auto_524496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_524490 ?auto_524491 ?auto_524492 ?auto_524493 ?auto_524494 ?auto_524495 ?auto_524496 )
      ( MAKE-13PILE ?auto_524490 ?auto_524491 ?auto_524492 ?auto_524493 ?auto_524494 ?auto_524495 ?auto_524496 ?auto_524497 ?auto_524498 ?auto_524499 ?auto_524500 ?auto_524501 ?auto_524502 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_524544 - BLOCK
      ?auto_524545 - BLOCK
      ?auto_524546 - BLOCK
      ?auto_524547 - BLOCK
      ?auto_524548 - BLOCK
      ?auto_524549 - BLOCK
      ?auto_524550 - BLOCK
      ?auto_524551 - BLOCK
      ?auto_524552 - BLOCK
      ?auto_524553 - BLOCK
      ?auto_524554 - BLOCK
      ?auto_524555 - BLOCK
      ?auto_524556 - BLOCK
    )
    :vars
    (
      ?auto_524557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524556 ?auto_524557 ) ( ON-TABLE ?auto_524544 ) ( ON ?auto_524545 ?auto_524544 ) ( ON ?auto_524546 ?auto_524545 ) ( ON ?auto_524547 ?auto_524546 ) ( ON ?auto_524548 ?auto_524547 ) ( not ( = ?auto_524544 ?auto_524545 ) ) ( not ( = ?auto_524544 ?auto_524546 ) ) ( not ( = ?auto_524544 ?auto_524547 ) ) ( not ( = ?auto_524544 ?auto_524548 ) ) ( not ( = ?auto_524544 ?auto_524549 ) ) ( not ( = ?auto_524544 ?auto_524550 ) ) ( not ( = ?auto_524544 ?auto_524551 ) ) ( not ( = ?auto_524544 ?auto_524552 ) ) ( not ( = ?auto_524544 ?auto_524553 ) ) ( not ( = ?auto_524544 ?auto_524554 ) ) ( not ( = ?auto_524544 ?auto_524555 ) ) ( not ( = ?auto_524544 ?auto_524556 ) ) ( not ( = ?auto_524544 ?auto_524557 ) ) ( not ( = ?auto_524545 ?auto_524546 ) ) ( not ( = ?auto_524545 ?auto_524547 ) ) ( not ( = ?auto_524545 ?auto_524548 ) ) ( not ( = ?auto_524545 ?auto_524549 ) ) ( not ( = ?auto_524545 ?auto_524550 ) ) ( not ( = ?auto_524545 ?auto_524551 ) ) ( not ( = ?auto_524545 ?auto_524552 ) ) ( not ( = ?auto_524545 ?auto_524553 ) ) ( not ( = ?auto_524545 ?auto_524554 ) ) ( not ( = ?auto_524545 ?auto_524555 ) ) ( not ( = ?auto_524545 ?auto_524556 ) ) ( not ( = ?auto_524545 ?auto_524557 ) ) ( not ( = ?auto_524546 ?auto_524547 ) ) ( not ( = ?auto_524546 ?auto_524548 ) ) ( not ( = ?auto_524546 ?auto_524549 ) ) ( not ( = ?auto_524546 ?auto_524550 ) ) ( not ( = ?auto_524546 ?auto_524551 ) ) ( not ( = ?auto_524546 ?auto_524552 ) ) ( not ( = ?auto_524546 ?auto_524553 ) ) ( not ( = ?auto_524546 ?auto_524554 ) ) ( not ( = ?auto_524546 ?auto_524555 ) ) ( not ( = ?auto_524546 ?auto_524556 ) ) ( not ( = ?auto_524546 ?auto_524557 ) ) ( not ( = ?auto_524547 ?auto_524548 ) ) ( not ( = ?auto_524547 ?auto_524549 ) ) ( not ( = ?auto_524547 ?auto_524550 ) ) ( not ( = ?auto_524547 ?auto_524551 ) ) ( not ( = ?auto_524547 ?auto_524552 ) ) ( not ( = ?auto_524547 ?auto_524553 ) ) ( not ( = ?auto_524547 ?auto_524554 ) ) ( not ( = ?auto_524547 ?auto_524555 ) ) ( not ( = ?auto_524547 ?auto_524556 ) ) ( not ( = ?auto_524547 ?auto_524557 ) ) ( not ( = ?auto_524548 ?auto_524549 ) ) ( not ( = ?auto_524548 ?auto_524550 ) ) ( not ( = ?auto_524548 ?auto_524551 ) ) ( not ( = ?auto_524548 ?auto_524552 ) ) ( not ( = ?auto_524548 ?auto_524553 ) ) ( not ( = ?auto_524548 ?auto_524554 ) ) ( not ( = ?auto_524548 ?auto_524555 ) ) ( not ( = ?auto_524548 ?auto_524556 ) ) ( not ( = ?auto_524548 ?auto_524557 ) ) ( not ( = ?auto_524549 ?auto_524550 ) ) ( not ( = ?auto_524549 ?auto_524551 ) ) ( not ( = ?auto_524549 ?auto_524552 ) ) ( not ( = ?auto_524549 ?auto_524553 ) ) ( not ( = ?auto_524549 ?auto_524554 ) ) ( not ( = ?auto_524549 ?auto_524555 ) ) ( not ( = ?auto_524549 ?auto_524556 ) ) ( not ( = ?auto_524549 ?auto_524557 ) ) ( not ( = ?auto_524550 ?auto_524551 ) ) ( not ( = ?auto_524550 ?auto_524552 ) ) ( not ( = ?auto_524550 ?auto_524553 ) ) ( not ( = ?auto_524550 ?auto_524554 ) ) ( not ( = ?auto_524550 ?auto_524555 ) ) ( not ( = ?auto_524550 ?auto_524556 ) ) ( not ( = ?auto_524550 ?auto_524557 ) ) ( not ( = ?auto_524551 ?auto_524552 ) ) ( not ( = ?auto_524551 ?auto_524553 ) ) ( not ( = ?auto_524551 ?auto_524554 ) ) ( not ( = ?auto_524551 ?auto_524555 ) ) ( not ( = ?auto_524551 ?auto_524556 ) ) ( not ( = ?auto_524551 ?auto_524557 ) ) ( not ( = ?auto_524552 ?auto_524553 ) ) ( not ( = ?auto_524552 ?auto_524554 ) ) ( not ( = ?auto_524552 ?auto_524555 ) ) ( not ( = ?auto_524552 ?auto_524556 ) ) ( not ( = ?auto_524552 ?auto_524557 ) ) ( not ( = ?auto_524553 ?auto_524554 ) ) ( not ( = ?auto_524553 ?auto_524555 ) ) ( not ( = ?auto_524553 ?auto_524556 ) ) ( not ( = ?auto_524553 ?auto_524557 ) ) ( not ( = ?auto_524554 ?auto_524555 ) ) ( not ( = ?auto_524554 ?auto_524556 ) ) ( not ( = ?auto_524554 ?auto_524557 ) ) ( not ( = ?auto_524555 ?auto_524556 ) ) ( not ( = ?auto_524555 ?auto_524557 ) ) ( not ( = ?auto_524556 ?auto_524557 ) ) ( ON ?auto_524555 ?auto_524556 ) ( ON ?auto_524554 ?auto_524555 ) ( ON ?auto_524553 ?auto_524554 ) ( ON ?auto_524552 ?auto_524553 ) ( ON ?auto_524551 ?auto_524552 ) ( ON ?auto_524550 ?auto_524551 ) ( CLEAR ?auto_524548 ) ( ON ?auto_524549 ?auto_524550 ) ( CLEAR ?auto_524549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_524544 ?auto_524545 ?auto_524546 ?auto_524547 ?auto_524548 ?auto_524549 )
      ( MAKE-13PILE ?auto_524544 ?auto_524545 ?auto_524546 ?auto_524547 ?auto_524548 ?auto_524549 ?auto_524550 ?auto_524551 ?auto_524552 ?auto_524553 ?auto_524554 ?auto_524555 ?auto_524556 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_524598 - BLOCK
      ?auto_524599 - BLOCK
      ?auto_524600 - BLOCK
      ?auto_524601 - BLOCK
      ?auto_524602 - BLOCK
      ?auto_524603 - BLOCK
      ?auto_524604 - BLOCK
      ?auto_524605 - BLOCK
      ?auto_524606 - BLOCK
      ?auto_524607 - BLOCK
      ?auto_524608 - BLOCK
      ?auto_524609 - BLOCK
      ?auto_524610 - BLOCK
    )
    :vars
    (
      ?auto_524611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524610 ?auto_524611 ) ( ON-TABLE ?auto_524598 ) ( ON ?auto_524599 ?auto_524598 ) ( ON ?auto_524600 ?auto_524599 ) ( ON ?auto_524601 ?auto_524600 ) ( not ( = ?auto_524598 ?auto_524599 ) ) ( not ( = ?auto_524598 ?auto_524600 ) ) ( not ( = ?auto_524598 ?auto_524601 ) ) ( not ( = ?auto_524598 ?auto_524602 ) ) ( not ( = ?auto_524598 ?auto_524603 ) ) ( not ( = ?auto_524598 ?auto_524604 ) ) ( not ( = ?auto_524598 ?auto_524605 ) ) ( not ( = ?auto_524598 ?auto_524606 ) ) ( not ( = ?auto_524598 ?auto_524607 ) ) ( not ( = ?auto_524598 ?auto_524608 ) ) ( not ( = ?auto_524598 ?auto_524609 ) ) ( not ( = ?auto_524598 ?auto_524610 ) ) ( not ( = ?auto_524598 ?auto_524611 ) ) ( not ( = ?auto_524599 ?auto_524600 ) ) ( not ( = ?auto_524599 ?auto_524601 ) ) ( not ( = ?auto_524599 ?auto_524602 ) ) ( not ( = ?auto_524599 ?auto_524603 ) ) ( not ( = ?auto_524599 ?auto_524604 ) ) ( not ( = ?auto_524599 ?auto_524605 ) ) ( not ( = ?auto_524599 ?auto_524606 ) ) ( not ( = ?auto_524599 ?auto_524607 ) ) ( not ( = ?auto_524599 ?auto_524608 ) ) ( not ( = ?auto_524599 ?auto_524609 ) ) ( not ( = ?auto_524599 ?auto_524610 ) ) ( not ( = ?auto_524599 ?auto_524611 ) ) ( not ( = ?auto_524600 ?auto_524601 ) ) ( not ( = ?auto_524600 ?auto_524602 ) ) ( not ( = ?auto_524600 ?auto_524603 ) ) ( not ( = ?auto_524600 ?auto_524604 ) ) ( not ( = ?auto_524600 ?auto_524605 ) ) ( not ( = ?auto_524600 ?auto_524606 ) ) ( not ( = ?auto_524600 ?auto_524607 ) ) ( not ( = ?auto_524600 ?auto_524608 ) ) ( not ( = ?auto_524600 ?auto_524609 ) ) ( not ( = ?auto_524600 ?auto_524610 ) ) ( not ( = ?auto_524600 ?auto_524611 ) ) ( not ( = ?auto_524601 ?auto_524602 ) ) ( not ( = ?auto_524601 ?auto_524603 ) ) ( not ( = ?auto_524601 ?auto_524604 ) ) ( not ( = ?auto_524601 ?auto_524605 ) ) ( not ( = ?auto_524601 ?auto_524606 ) ) ( not ( = ?auto_524601 ?auto_524607 ) ) ( not ( = ?auto_524601 ?auto_524608 ) ) ( not ( = ?auto_524601 ?auto_524609 ) ) ( not ( = ?auto_524601 ?auto_524610 ) ) ( not ( = ?auto_524601 ?auto_524611 ) ) ( not ( = ?auto_524602 ?auto_524603 ) ) ( not ( = ?auto_524602 ?auto_524604 ) ) ( not ( = ?auto_524602 ?auto_524605 ) ) ( not ( = ?auto_524602 ?auto_524606 ) ) ( not ( = ?auto_524602 ?auto_524607 ) ) ( not ( = ?auto_524602 ?auto_524608 ) ) ( not ( = ?auto_524602 ?auto_524609 ) ) ( not ( = ?auto_524602 ?auto_524610 ) ) ( not ( = ?auto_524602 ?auto_524611 ) ) ( not ( = ?auto_524603 ?auto_524604 ) ) ( not ( = ?auto_524603 ?auto_524605 ) ) ( not ( = ?auto_524603 ?auto_524606 ) ) ( not ( = ?auto_524603 ?auto_524607 ) ) ( not ( = ?auto_524603 ?auto_524608 ) ) ( not ( = ?auto_524603 ?auto_524609 ) ) ( not ( = ?auto_524603 ?auto_524610 ) ) ( not ( = ?auto_524603 ?auto_524611 ) ) ( not ( = ?auto_524604 ?auto_524605 ) ) ( not ( = ?auto_524604 ?auto_524606 ) ) ( not ( = ?auto_524604 ?auto_524607 ) ) ( not ( = ?auto_524604 ?auto_524608 ) ) ( not ( = ?auto_524604 ?auto_524609 ) ) ( not ( = ?auto_524604 ?auto_524610 ) ) ( not ( = ?auto_524604 ?auto_524611 ) ) ( not ( = ?auto_524605 ?auto_524606 ) ) ( not ( = ?auto_524605 ?auto_524607 ) ) ( not ( = ?auto_524605 ?auto_524608 ) ) ( not ( = ?auto_524605 ?auto_524609 ) ) ( not ( = ?auto_524605 ?auto_524610 ) ) ( not ( = ?auto_524605 ?auto_524611 ) ) ( not ( = ?auto_524606 ?auto_524607 ) ) ( not ( = ?auto_524606 ?auto_524608 ) ) ( not ( = ?auto_524606 ?auto_524609 ) ) ( not ( = ?auto_524606 ?auto_524610 ) ) ( not ( = ?auto_524606 ?auto_524611 ) ) ( not ( = ?auto_524607 ?auto_524608 ) ) ( not ( = ?auto_524607 ?auto_524609 ) ) ( not ( = ?auto_524607 ?auto_524610 ) ) ( not ( = ?auto_524607 ?auto_524611 ) ) ( not ( = ?auto_524608 ?auto_524609 ) ) ( not ( = ?auto_524608 ?auto_524610 ) ) ( not ( = ?auto_524608 ?auto_524611 ) ) ( not ( = ?auto_524609 ?auto_524610 ) ) ( not ( = ?auto_524609 ?auto_524611 ) ) ( not ( = ?auto_524610 ?auto_524611 ) ) ( ON ?auto_524609 ?auto_524610 ) ( ON ?auto_524608 ?auto_524609 ) ( ON ?auto_524607 ?auto_524608 ) ( ON ?auto_524606 ?auto_524607 ) ( ON ?auto_524605 ?auto_524606 ) ( ON ?auto_524604 ?auto_524605 ) ( ON ?auto_524603 ?auto_524604 ) ( CLEAR ?auto_524601 ) ( ON ?auto_524602 ?auto_524603 ) ( CLEAR ?auto_524602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_524598 ?auto_524599 ?auto_524600 ?auto_524601 ?auto_524602 )
      ( MAKE-13PILE ?auto_524598 ?auto_524599 ?auto_524600 ?auto_524601 ?auto_524602 ?auto_524603 ?auto_524604 ?auto_524605 ?auto_524606 ?auto_524607 ?auto_524608 ?auto_524609 ?auto_524610 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_524652 - BLOCK
      ?auto_524653 - BLOCK
      ?auto_524654 - BLOCK
      ?auto_524655 - BLOCK
      ?auto_524656 - BLOCK
      ?auto_524657 - BLOCK
      ?auto_524658 - BLOCK
      ?auto_524659 - BLOCK
      ?auto_524660 - BLOCK
      ?auto_524661 - BLOCK
      ?auto_524662 - BLOCK
      ?auto_524663 - BLOCK
      ?auto_524664 - BLOCK
    )
    :vars
    (
      ?auto_524665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524664 ?auto_524665 ) ( ON-TABLE ?auto_524652 ) ( ON ?auto_524653 ?auto_524652 ) ( ON ?auto_524654 ?auto_524653 ) ( not ( = ?auto_524652 ?auto_524653 ) ) ( not ( = ?auto_524652 ?auto_524654 ) ) ( not ( = ?auto_524652 ?auto_524655 ) ) ( not ( = ?auto_524652 ?auto_524656 ) ) ( not ( = ?auto_524652 ?auto_524657 ) ) ( not ( = ?auto_524652 ?auto_524658 ) ) ( not ( = ?auto_524652 ?auto_524659 ) ) ( not ( = ?auto_524652 ?auto_524660 ) ) ( not ( = ?auto_524652 ?auto_524661 ) ) ( not ( = ?auto_524652 ?auto_524662 ) ) ( not ( = ?auto_524652 ?auto_524663 ) ) ( not ( = ?auto_524652 ?auto_524664 ) ) ( not ( = ?auto_524652 ?auto_524665 ) ) ( not ( = ?auto_524653 ?auto_524654 ) ) ( not ( = ?auto_524653 ?auto_524655 ) ) ( not ( = ?auto_524653 ?auto_524656 ) ) ( not ( = ?auto_524653 ?auto_524657 ) ) ( not ( = ?auto_524653 ?auto_524658 ) ) ( not ( = ?auto_524653 ?auto_524659 ) ) ( not ( = ?auto_524653 ?auto_524660 ) ) ( not ( = ?auto_524653 ?auto_524661 ) ) ( not ( = ?auto_524653 ?auto_524662 ) ) ( not ( = ?auto_524653 ?auto_524663 ) ) ( not ( = ?auto_524653 ?auto_524664 ) ) ( not ( = ?auto_524653 ?auto_524665 ) ) ( not ( = ?auto_524654 ?auto_524655 ) ) ( not ( = ?auto_524654 ?auto_524656 ) ) ( not ( = ?auto_524654 ?auto_524657 ) ) ( not ( = ?auto_524654 ?auto_524658 ) ) ( not ( = ?auto_524654 ?auto_524659 ) ) ( not ( = ?auto_524654 ?auto_524660 ) ) ( not ( = ?auto_524654 ?auto_524661 ) ) ( not ( = ?auto_524654 ?auto_524662 ) ) ( not ( = ?auto_524654 ?auto_524663 ) ) ( not ( = ?auto_524654 ?auto_524664 ) ) ( not ( = ?auto_524654 ?auto_524665 ) ) ( not ( = ?auto_524655 ?auto_524656 ) ) ( not ( = ?auto_524655 ?auto_524657 ) ) ( not ( = ?auto_524655 ?auto_524658 ) ) ( not ( = ?auto_524655 ?auto_524659 ) ) ( not ( = ?auto_524655 ?auto_524660 ) ) ( not ( = ?auto_524655 ?auto_524661 ) ) ( not ( = ?auto_524655 ?auto_524662 ) ) ( not ( = ?auto_524655 ?auto_524663 ) ) ( not ( = ?auto_524655 ?auto_524664 ) ) ( not ( = ?auto_524655 ?auto_524665 ) ) ( not ( = ?auto_524656 ?auto_524657 ) ) ( not ( = ?auto_524656 ?auto_524658 ) ) ( not ( = ?auto_524656 ?auto_524659 ) ) ( not ( = ?auto_524656 ?auto_524660 ) ) ( not ( = ?auto_524656 ?auto_524661 ) ) ( not ( = ?auto_524656 ?auto_524662 ) ) ( not ( = ?auto_524656 ?auto_524663 ) ) ( not ( = ?auto_524656 ?auto_524664 ) ) ( not ( = ?auto_524656 ?auto_524665 ) ) ( not ( = ?auto_524657 ?auto_524658 ) ) ( not ( = ?auto_524657 ?auto_524659 ) ) ( not ( = ?auto_524657 ?auto_524660 ) ) ( not ( = ?auto_524657 ?auto_524661 ) ) ( not ( = ?auto_524657 ?auto_524662 ) ) ( not ( = ?auto_524657 ?auto_524663 ) ) ( not ( = ?auto_524657 ?auto_524664 ) ) ( not ( = ?auto_524657 ?auto_524665 ) ) ( not ( = ?auto_524658 ?auto_524659 ) ) ( not ( = ?auto_524658 ?auto_524660 ) ) ( not ( = ?auto_524658 ?auto_524661 ) ) ( not ( = ?auto_524658 ?auto_524662 ) ) ( not ( = ?auto_524658 ?auto_524663 ) ) ( not ( = ?auto_524658 ?auto_524664 ) ) ( not ( = ?auto_524658 ?auto_524665 ) ) ( not ( = ?auto_524659 ?auto_524660 ) ) ( not ( = ?auto_524659 ?auto_524661 ) ) ( not ( = ?auto_524659 ?auto_524662 ) ) ( not ( = ?auto_524659 ?auto_524663 ) ) ( not ( = ?auto_524659 ?auto_524664 ) ) ( not ( = ?auto_524659 ?auto_524665 ) ) ( not ( = ?auto_524660 ?auto_524661 ) ) ( not ( = ?auto_524660 ?auto_524662 ) ) ( not ( = ?auto_524660 ?auto_524663 ) ) ( not ( = ?auto_524660 ?auto_524664 ) ) ( not ( = ?auto_524660 ?auto_524665 ) ) ( not ( = ?auto_524661 ?auto_524662 ) ) ( not ( = ?auto_524661 ?auto_524663 ) ) ( not ( = ?auto_524661 ?auto_524664 ) ) ( not ( = ?auto_524661 ?auto_524665 ) ) ( not ( = ?auto_524662 ?auto_524663 ) ) ( not ( = ?auto_524662 ?auto_524664 ) ) ( not ( = ?auto_524662 ?auto_524665 ) ) ( not ( = ?auto_524663 ?auto_524664 ) ) ( not ( = ?auto_524663 ?auto_524665 ) ) ( not ( = ?auto_524664 ?auto_524665 ) ) ( ON ?auto_524663 ?auto_524664 ) ( ON ?auto_524662 ?auto_524663 ) ( ON ?auto_524661 ?auto_524662 ) ( ON ?auto_524660 ?auto_524661 ) ( ON ?auto_524659 ?auto_524660 ) ( ON ?auto_524658 ?auto_524659 ) ( ON ?auto_524657 ?auto_524658 ) ( ON ?auto_524656 ?auto_524657 ) ( CLEAR ?auto_524654 ) ( ON ?auto_524655 ?auto_524656 ) ( CLEAR ?auto_524655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_524652 ?auto_524653 ?auto_524654 ?auto_524655 )
      ( MAKE-13PILE ?auto_524652 ?auto_524653 ?auto_524654 ?auto_524655 ?auto_524656 ?auto_524657 ?auto_524658 ?auto_524659 ?auto_524660 ?auto_524661 ?auto_524662 ?auto_524663 ?auto_524664 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_524706 - BLOCK
      ?auto_524707 - BLOCK
      ?auto_524708 - BLOCK
      ?auto_524709 - BLOCK
      ?auto_524710 - BLOCK
      ?auto_524711 - BLOCK
      ?auto_524712 - BLOCK
      ?auto_524713 - BLOCK
      ?auto_524714 - BLOCK
      ?auto_524715 - BLOCK
      ?auto_524716 - BLOCK
      ?auto_524717 - BLOCK
      ?auto_524718 - BLOCK
    )
    :vars
    (
      ?auto_524719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524718 ?auto_524719 ) ( ON-TABLE ?auto_524706 ) ( ON ?auto_524707 ?auto_524706 ) ( not ( = ?auto_524706 ?auto_524707 ) ) ( not ( = ?auto_524706 ?auto_524708 ) ) ( not ( = ?auto_524706 ?auto_524709 ) ) ( not ( = ?auto_524706 ?auto_524710 ) ) ( not ( = ?auto_524706 ?auto_524711 ) ) ( not ( = ?auto_524706 ?auto_524712 ) ) ( not ( = ?auto_524706 ?auto_524713 ) ) ( not ( = ?auto_524706 ?auto_524714 ) ) ( not ( = ?auto_524706 ?auto_524715 ) ) ( not ( = ?auto_524706 ?auto_524716 ) ) ( not ( = ?auto_524706 ?auto_524717 ) ) ( not ( = ?auto_524706 ?auto_524718 ) ) ( not ( = ?auto_524706 ?auto_524719 ) ) ( not ( = ?auto_524707 ?auto_524708 ) ) ( not ( = ?auto_524707 ?auto_524709 ) ) ( not ( = ?auto_524707 ?auto_524710 ) ) ( not ( = ?auto_524707 ?auto_524711 ) ) ( not ( = ?auto_524707 ?auto_524712 ) ) ( not ( = ?auto_524707 ?auto_524713 ) ) ( not ( = ?auto_524707 ?auto_524714 ) ) ( not ( = ?auto_524707 ?auto_524715 ) ) ( not ( = ?auto_524707 ?auto_524716 ) ) ( not ( = ?auto_524707 ?auto_524717 ) ) ( not ( = ?auto_524707 ?auto_524718 ) ) ( not ( = ?auto_524707 ?auto_524719 ) ) ( not ( = ?auto_524708 ?auto_524709 ) ) ( not ( = ?auto_524708 ?auto_524710 ) ) ( not ( = ?auto_524708 ?auto_524711 ) ) ( not ( = ?auto_524708 ?auto_524712 ) ) ( not ( = ?auto_524708 ?auto_524713 ) ) ( not ( = ?auto_524708 ?auto_524714 ) ) ( not ( = ?auto_524708 ?auto_524715 ) ) ( not ( = ?auto_524708 ?auto_524716 ) ) ( not ( = ?auto_524708 ?auto_524717 ) ) ( not ( = ?auto_524708 ?auto_524718 ) ) ( not ( = ?auto_524708 ?auto_524719 ) ) ( not ( = ?auto_524709 ?auto_524710 ) ) ( not ( = ?auto_524709 ?auto_524711 ) ) ( not ( = ?auto_524709 ?auto_524712 ) ) ( not ( = ?auto_524709 ?auto_524713 ) ) ( not ( = ?auto_524709 ?auto_524714 ) ) ( not ( = ?auto_524709 ?auto_524715 ) ) ( not ( = ?auto_524709 ?auto_524716 ) ) ( not ( = ?auto_524709 ?auto_524717 ) ) ( not ( = ?auto_524709 ?auto_524718 ) ) ( not ( = ?auto_524709 ?auto_524719 ) ) ( not ( = ?auto_524710 ?auto_524711 ) ) ( not ( = ?auto_524710 ?auto_524712 ) ) ( not ( = ?auto_524710 ?auto_524713 ) ) ( not ( = ?auto_524710 ?auto_524714 ) ) ( not ( = ?auto_524710 ?auto_524715 ) ) ( not ( = ?auto_524710 ?auto_524716 ) ) ( not ( = ?auto_524710 ?auto_524717 ) ) ( not ( = ?auto_524710 ?auto_524718 ) ) ( not ( = ?auto_524710 ?auto_524719 ) ) ( not ( = ?auto_524711 ?auto_524712 ) ) ( not ( = ?auto_524711 ?auto_524713 ) ) ( not ( = ?auto_524711 ?auto_524714 ) ) ( not ( = ?auto_524711 ?auto_524715 ) ) ( not ( = ?auto_524711 ?auto_524716 ) ) ( not ( = ?auto_524711 ?auto_524717 ) ) ( not ( = ?auto_524711 ?auto_524718 ) ) ( not ( = ?auto_524711 ?auto_524719 ) ) ( not ( = ?auto_524712 ?auto_524713 ) ) ( not ( = ?auto_524712 ?auto_524714 ) ) ( not ( = ?auto_524712 ?auto_524715 ) ) ( not ( = ?auto_524712 ?auto_524716 ) ) ( not ( = ?auto_524712 ?auto_524717 ) ) ( not ( = ?auto_524712 ?auto_524718 ) ) ( not ( = ?auto_524712 ?auto_524719 ) ) ( not ( = ?auto_524713 ?auto_524714 ) ) ( not ( = ?auto_524713 ?auto_524715 ) ) ( not ( = ?auto_524713 ?auto_524716 ) ) ( not ( = ?auto_524713 ?auto_524717 ) ) ( not ( = ?auto_524713 ?auto_524718 ) ) ( not ( = ?auto_524713 ?auto_524719 ) ) ( not ( = ?auto_524714 ?auto_524715 ) ) ( not ( = ?auto_524714 ?auto_524716 ) ) ( not ( = ?auto_524714 ?auto_524717 ) ) ( not ( = ?auto_524714 ?auto_524718 ) ) ( not ( = ?auto_524714 ?auto_524719 ) ) ( not ( = ?auto_524715 ?auto_524716 ) ) ( not ( = ?auto_524715 ?auto_524717 ) ) ( not ( = ?auto_524715 ?auto_524718 ) ) ( not ( = ?auto_524715 ?auto_524719 ) ) ( not ( = ?auto_524716 ?auto_524717 ) ) ( not ( = ?auto_524716 ?auto_524718 ) ) ( not ( = ?auto_524716 ?auto_524719 ) ) ( not ( = ?auto_524717 ?auto_524718 ) ) ( not ( = ?auto_524717 ?auto_524719 ) ) ( not ( = ?auto_524718 ?auto_524719 ) ) ( ON ?auto_524717 ?auto_524718 ) ( ON ?auto_524716 ?auto_524717 ) ( ON ?auto_524715 ?auto_524716 ) ( ON ?auto_524714 ?auto_524715 ) ( ON ?auto_524713 ?auto_524714 ) ( ON ?auto_524712 ?auto_524713 ) ( ON ?auto_524711 ?auto_524712 ) ( ON ?auto_524710 ?auto_524711 ) ( ON ?auto_524709 ?auto_524710 ) ( CLEAR ?auto_524707 ) ( ON ?auto_524708 ?auto_524709 ) ( CLEAR ?auto_524708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_524706 ?auto_524707 ?auto_524708 )
      ( MAKE-13PILE ?auto_524706 ?auto_524707 ?auto_524708 ?auto_524709 ?auto_524710 ?auto_524711 ?auto_524712 ?auto_524713 ?auto_524714 ?auto_524715 ?auto_524716 ?auto_524717 ?auto_524718 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_524760 - BLOCK
      ?auto_524761 - BLOCK
      ?auto_524762 - BLOCK
      ?auto_524763 - BLOCK
      ?auto_524764 - BLOCK
      ?auto_524765 - BLOCK
      ?auto_524766 - BLOCK
      ?auto_524767 - BLOCK
      ?auto_524768 - BLOCK
      ?auto_524769 - BLOCK
      ?auto_524770 - BLOCK
      ?auto_524771 - BLOCK
      ?auto_524772 - BLOCK
    )
    :vars
    (
      ?auto_524773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524772 ?auto_524773 ) ( ON-TABLE ?auto_524760 ) ( not ( = ?auto_524760 ?auto_524761 ) ) ( not ( = ?auto_524760 ?auto_524762 ) ) ( not ( = ?auto_524760 ?auto_524763 ) ) ( not ( = ?auto_524760 ?auto_524764 ) ) ( not ( = ?auto_524760 ?auto_524765 ) ) ( not ( = ?auto_524760 ?auto_524766 ) ) ( not ( = ?auto_524760 ?auto_524767 ) ) ( not ( = ?auto_524760 ?auto_524768 ) ) ( not ( = ?auto_524760 ?auto_524769 ) ) ( not ( = ?auto_524760 ?auto_524770 ) ) ( not ( = ?auto_524760 ?auto_524771 ) ) ( not ( = ?auto_524760 ?auto_524772 ) ) ( not ( = ?auto_524760 ?auto_524773 ) ) ( not ( = ?auto_524761 ?auto_524762 ) ) ( not ( = ?auto_524761 ?auto_524763 ) ) ( not ( = ?auto_524761 ?auto_524764 ) ) ( not ( = ?auto_524761 ?auto_524765 ) ) ( not ( = ?auto_524761 ?auto_524766 ) ) ( not ( = ?auto_524761 ?auto_524767 ) ) ( not ( = ?auto_524761 ?auto_524768 ) ) ( not ( = ?auto_524761 ?auto_524769 ) ) ( not ( = ?auto_524761 ?auto_524770 ) ) ( not ( = ?auto_524761 ?auto_524771 ) ) ( not ( = ?auto_524761 ?auto_524772 ) ) ( not ( = ?auto_524761 ?auto_524773 ) ) ( not ( = ?auto_524762 ?auto_524763 ) ) ( not ( = ?auto_524762 ?auto_524764 ) ) ( not ( = ?auto_524762 ?auto_524765 ) ) ( not ( = ?auto_524762 ?auto_524766 ) ) ( not ( = ?auto_524762 ?auto_524767 ) ) ( not ( = ?auto_524762 ?auto_524768 ) ) ( not ( = ?auto_524762 ?auto_524769 ) ) ( not ( = ?auto_524762 ?auto_524770 ) ) ( not ( = ?auto_524762 ?auto_524771 ) ) ( not ( = ?auto_524762 ?auto_524772 ) ) ( not ( = ?auto_524762 ?auto_524773 ) ) ( not ( = ?auto_524763 ?auto_524764 ) ) ( not ( = ?auto_524763 ?auto_524765 ) ) ( not ( = ?auto_524763 ?auto_524766 ) ) ( not ( = ?auto_524763 ?auto_524767 ) ) ( not ( = ?auto_524763 ?auto_524768 ) ) ( not ( = ?auto_524763 ?auto_524769 ) ) ( not ( = ?auto_524763 ?auto_524770 ) ) ( not ( = ?auto_524763 ?auto_524771 ) ) ( not ( = ?auto_524763 ?auto_524772 ) ) ( not ( = ?auto_524763 ?auto_524773 ) ) ( not ( = ?auto_524764 ?auto_524765 ) ) ( not ( = ?auto_524764 ?auto_524766 ) ) ( not ( = ?auto_524764 ?auto_524767 ) ) ( not ( = ?auto_524764 ?auto_524768 ) ) ( not ( = ?auto_524764 ?auto_524769 ) ) ( not ( = ?auto_524764 ?auto_524770 ) ) ( not ( = ?auto_524764 ?auto_524771 ) ) ( not ( = ?auto_524764 ?auto_524772 ) ) ( not ( = ?auto_524764 ?auto_524773 ) ) ( not ( = ?auto_524765 ?auto_524766 ) ) ( not ( = ?auto_524765 ?auto_524767 ) ) ( not ( = ?auto_524765 ?auto_524768 ) ) ( not ( = ?auto_524765 ?auto_524769 ) ) ( not ( = ?auto_524765 ?auto_524770 ) ) ( not ( = ?auto_524765 ?auto_524771 ) ) ( not ( = ?auto_524765 ?auto_524772 ) ) ( not ( = ?auto_524765 ?auto_524773 ) ) ( not ( = ?auto_524766 ?auto_524767 ) ) ( not ( = ?auto_524766 ?auto_524768 ) ) ( not ( = ?auto_524766 ?auto_524769 ) ) ( not ( = ?auto_524766 ?auto_524770 ) ) ( not ( = ?auto_524766 ?auto_524771 ) ) ( not ( = ?auto_524766 ?auto_524772 ) ) ( not ( = ?auto_524766 ?auto_524773 ) ) ( not ( = ?auto_524767 ?auto_524768 ) ) ( not ( = ?auto_524767 ?auto_524769 ) ) ( not ( = ?auto_524767 ?auto_524770 ) ) ( not ( = ?auto_524767 ?auto_524771 ) ) ( not ( = ?auto_524767 ?auto_524772 ) ) ( not ( = ?auto_524767 ?auto_524773 ) ) ( not ( = ?auto_524768 ?auto_524769 ) ) ( not ( = ?auto_524768 ?auto_524770 ) ) ( not ( = ?auto_524768 ?auto_524771 ) ) ( not ( = ?auto_524768 ?auto_524772 ) ) ( not ( = ?auto_524768 ?auto_524773 ) ) ( not ( = ?auto_524769 ?auto_524770 ) ) ( not ( = ?auto_524769 ?auto_524771 ) ) ( not ( = ?auto_524769 ?auto_524772 ) ) ( not ( = ?auto_524769 ?auto_524773 ) ) ( not ( = ?auto_524770 ?auto_524771 ) ) ( not ( = ?auto_524770 ?auto_524772 ) ) ( not ( = ?auto_524770 ?auto_524773 ) ) ( not ( = ?auto_524771 ?auto_524772 ) ) ( not ( = ?auto_524771 ?auto_524773 ) ) ( not ( = ?auto_524772 ?auto_524773 ) ) ( ON ?auto_524771 ?auto_524772 ) ( ON ?auto_524770 ?auto_524771 ) ( ON ?auto_524769 ?auto_524770 ) ( ON ?auto_524768 ?auto_524769 ) ( ON ?auto_524767 ?auto_524768 ) ( ON ?auto_524766 ?auto_524767 ) ( ON ?auto_524765 ?auto_524766 ) ( ON ?auto_524764 ?auto_524765 ) ( ON ?auto_524763 ?auto_524764 ) ( ON ?auto_524762 ?auto_524763 ) ( CLEAR ?auto_524760 ) ( ON ?auto_524761 ?auto_524762 ) ( CLEAR ?auto_524761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_524760 ?auto_524761 )
      ( MAKE-13PILE ?auto_524760 ?auto_524761 ?auto_524762 ?auto_524763 ?auto_524764 ?auto_524765 ?auto_524766 ?auto_524767 ?auto_524768 ?auto_524769 ?auto_524770 ?auto_524771 ?auto_524772 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_524814 - BLOCK
      ?auto_524815 - BLOCK
      ?auto_524816 - BLOCK
      ?auto_524817 - BLOCK
      ?auto_524818 - BLOCK
      ?auto_524819 - BLOCK
      ?auto_524820 - BLOCK
      ?auto_524821 - BLOCK
      ?auto_524822 - BLOCK
      ?auto_524823 - BLOCK
      ?auto_524824 - BLOCK
      ?auto_524825 - BLOCK
      ?auto_524826 - BLOCK
    )
    :vars
    (
      ?auto_524827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524826 ?auto_524827 ) ( not ( = ?auto_524814 ?auto_524815 ) ) ( not ( = ?auto_524814 ?auto_524816 ) ) ( not ( = ?auto_524814 ?auto_524817 ) ) ( not ( = ?auto_524814 ?auto_524818 ) ) ( not ( = ?auto_524814 ?auto_524819 ) ) ( not ( = ?auto_524814 ?auto_524820 ) ) ( not ( = ?auto_524814 ?auto_524821 ) ) ( not ( = ?auto_524814 ?auto_524822 ) ) ( not ( = ?auto_524814 ?auto_524823 ) ) ( not ( = ?auto_524814 ?auto_524824 ) ) ( not ( = ?auto_524814 ?auto_524825 ) ) ( not ( = ?auto_524814 ?auto_524826 ) ) ( not ( = ?auto_524814 ?auto_524827 ) ) ( not ( = ?auto_524815 ?auto_524816 ) ) ( not ( = ?auto_524815 ?auto_524817 ) ) ( not ( = ?auto_524815 ?auto_524818 ) ) ( not ( = ?auto_524815 ?auto_524819 ) ) ( not ( = ?auto_524815 ?auto_524820 ) ) ( not ( = ?auto_524815 ?auto_524821 ) ) ( not ( = ?auto_524815 ?auto_524822 ) ) ( not ( = ?auto_524815 ?auto_524823 ) ) ( not ( = ?auto_524815 ?auto_524824 ) ) ( not ( = ?auto_524815 ?auto_524825 ) ) ( not ( = ?auto_524815 ?auto_524826 ) ) ( not ( = ?auto_524815 ?auto_524827 ) ) ( not ( = ?auto_524816 ?auto_524817 ) ) ( not ( = ?auto_524816 ?auto_524818 ) ) ( not ( = ?auto_524816 ?auto_524819 ) ) ( not ( = ?auto_524816 ?auto_524820 ) ) ( not ( = ?auto_524816 ?auto_524821 ) ) ( not ( = ?auto_524816 ?auto_524822 ) ) ( not ( = ?auto_524816 ?auto_524823 ) ) ( not ( = ?auto_524816 ?auto_524824 ) ) ( not ( = ?auto_524816 ?auto_524825 ) ) ( not ( = ?auto_524816 ?auto_524826 ) ) ( not ( = ?auto_524816 ?auto_524827 ) ) ( not ( = ?auto_524817 ?auto_524818 ) ) ( not ( = ?auto_524817 ?auto_524819 ) ) ( not ( = ?auto_524817 ?auto_524820 ) ) ( not ( = ?auto_524817 ?auto_524821 ) ) ( not ( = ?auto_524817 ?auto_524822 ) ) ( not ( = ?auto_524817 ?auto_524823 ) ) ( not ( = ?auto_524817 ?auto_524824 ) ) ( not ( = ?auto_524817 ?auto_524825 ) ) ( not ( = ?auto_524817 ?auto_524826 ) ) ( not ( = ?auto_524817 ?auto_524827 ) ) ( not ( = ?auto_524818 ?auto_524819 ) ) ( not ( = ?auto_524818 ?auto_524820 ) ) ( not ( = ?auto_524818 ?auto_524821 ) ) ( not ( = ?auto_524818 ?auto_524822 ) ) ( not ( = ?auto_524818 ?auto_524823 ) ) ( not ( = ?auto_524818 ?auto_524824 ) ) ( not ( = ?auto_524818 ?auto_524825 ) ) ( not ( = ?auto_524818 ?auto_524826 ) ) ( not ( = ?auto_524818 ?auto_524827 ) ) ( not ( = ?auto_524819 ?auto_524820 ) ) ( not ( = ?auto_524819 ?auto_524821 ) ) ( not ( = ?auto_524819 ?auto_524822 ) ) ( not ( = ?auto_524819 ?auto_524823 ) ) ( not ( = ?auto_524819 ?auto_524824 ) ) ( not ( = ?auto_524819 ?auto_524825 ) ) ( not ( = ?auto_524819 ?auto_524826 ) ) ( not ( = ?auto_524819 ?auto_524827 ) ) ( not ( = ?auto_524820 ?auto_524821 ) ) ( not ( = ?auto_524820 ?auto_524822 ) ) ( not ( = ?auto_524820 ?auto_524823 ) ) ( not ( = ?auto_524820 ?auto_524824 ) ) ( not ( = ?auto_524820 ?auto_524825 ) ) ( not ( = ?auto_524820 ?auto_524826 ) ) ( not ( = ?auto_524820 ?auto_524827 ) ) ( not ( = ?auto_524821 ?auto_524822 ) ) ( not ( = ?auto_524821 ?auto_524823 ) ) ( not ( = ?auto_524821 ?auto_524824 ) ) ( not ( = ?auto_524821 ?auto_524825 ) ) ( not ( = ?auto_524821 ?auto_524826 ) ) ( not ( = ?auto_524821 ?auto_524827 ) ) ( not ( = ?auto_524822 ?auto_524823 ) ) ( not ( = ?auto_524822 ?auto_524824 ) ) ( not ( = ?auto_524822 ?auto_524825 ) ) ( not ( = ?auto_524822 ?auto_524826 ) ) ( not ( = ?auto_524822 ?auto_524827 ) ) ( not ( = ?auto_524823 ?auto_524824 ) ) ( not ( = ?auto_524823 ?auto_524825 ) ) ( not ( = ?auto_524823 ?auto_524826 ) ) ( not ( = ?auto_524823 ?auto_524827 ) ) ( not ( = ?auto_524824 ?auto_524825 ) ) ( not ( = ?auto_524824 ?auto_524826 ) ) ( not ( = ?auto_524824 ?auto_524827 ) ) ( not ( = ?auto_524825 ?auto_524826 ) ) ( not ( = ?auto_524825 ?auto_524827 ) ) ( not ( = ?auto_524826 ?auto_524827 ) ) ( ON ?auto_524825 ?auto_524826 ) ( ON ?auto_524824 ?auto_524825 ) ( ON ?auto_524823 ?auto_524824 ) ( ON ?auto_524822 ?auto_524823 ) ( ON ?auto_524821 ?auto_524822 ) ( ON ?auto_524820 ?auto_524821 ) ( ON ?auto_524819 ?auto_524820 ) ( ON ?auto_524818 ?auto_524819 ) ( ON ?auto_524817 ?auto_524818 ) ( ON ?auto_524816 ?auto_524817 ) ( ON ?auto_524815 ?auto_524816 ) ( ON ?auto_524814 ?auto_524815 ) ( CLEAR ?auto_524814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_524814 )
      ( MAKE-13PILE ?auto_524814 ?auto_524815 ?auto_524816 ?auto_524817 ?auto_524818 ?auto_524819 ?auto_524820 ?auto_524821 ?auto_524822 ?auto_524823 ?auto_524824 ?auto_524825 ?auto_524826 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_524869 - BLOCK
      ?auto_524870 - BLOCK
      ?auto_524871 - BLOCK
      ?auto_524872 - BLOCK
      ?auto_524873 - BLOCK
      ?auto_524874 - BLOCK
      ?auto_524875 - BLOCK
      ?auto_524876 - BLOCK
      ?auto_524877 - BLOCK
      ?auto_524878 - BLOCK
      ?auto_524879 - BLOCK
      ?auto_524880 - BLOCK
      ?auto_524881 - BLOCK
      ?auto_524882 - BLOCK
    )
    :vars
    (
      ?auto_524883 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_524881 ) ( ON ?auto_524882 ?auto_524883 ) ( CLEAR ?auto_524882 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_524869 ) ( ON ?auto_524870 ?auto_524869 ) ( ON ?auto_524871 ?auto_524870 ) ( ON ?auto_524872 ?auto_524871 ) ( ON ?auto_524873 ?auto_524872 ) ( ON ?auto_524874 ?auto_524873 ) ( ON ?auto_524875 ?auto_524874 ) ( ON ?auto_524876 ?auto_524875 ) ( ON ?auto_524877 ?auto_524876 ) ( ON ?auto_524878 ?auto_524877 ) ( ON ?auto_524879 ?auto_524878 ) ( ON ?auto_524880 ?auto_524879 ) ( ON ?auto_524881 ?auto_524880 ) ( not ( = ?auto_524869 ?auto_524870 ) ) ( not ( = ?auto_524869 ?auto_524871 ) ) ( not ( = ?auto_524869 ?auto_524872 ) ) ( not ( = ?auto_524869 ?auto_524873 ) ) ( not ( = ?auto_524869 ?auto_524874 ) ) ( not ( = ?auto_524869 ?auto_524875 ) ) ( not ( = ?auto_524869 ?auto_524876 ) ) ( not ( = ?auto_524869 ?auto_524877 ) ) ( not ( = ?auto_524869 ?auto_524878 ) ) ( not ( = ?auto_524869 ?auto_524879 ) ) ( not ( = ?auto_524869 ?auto_524880 ) ) ( not ( = ?auto_524869 ?auto_524881 ) ) ( not ( = ?auto_524869 ?auto_524882 ) ) ( not ( = ?auto_524869 ?auto_524883 ) ) ( not ( = ?auto_524870 ?auto_524871 ) ) ( not ( = ?auto_524870 ?auto_524872 ) ) ( not ( = ?auto_524870 ?auto_524873 ) ) ( not ( = ?auto_524870 ?auto_524874 ) ) ( not ( = ?auto_524870 ?auto_524875 ) ) ( not ( = ?auto_524870 ?auto_524876 ) ) ( not ( = ?auto_524870 ?auto_524877 ) ) ( not ( = ?auto_524870 ?auto_524878 ) ) ( not ( = ?auto_524870 ?auto_524879 ) ) ( not ( = ?auto_524870 ?auto_524880 ) ) ( not ( = ?auto_524870 ?auto_524881 ) ) ( not ( = ?auto_524870 ?auto_524882 ) ) ( not ( = ?auto_524870 ?auto_524883 ) ) ( not ( = ?auto_524871 ?auto_524872 ) ) ( not ( = ?auto_524871 ?auto_524873 ) ) ( not ( = ?auto_524871 ?auto_524874 ) ) ( not ( = ?auto_524871 ?auto_524875 ) ) ( not ( = ?auto_524871 ?auto_524876 ) ) ( not ( = ?auto_524871 ?auto_524877 ) ) ( not ( = ?auto_524871 ?auto_524878 ) ) ( not ( = ?auto_524871 ?auto_524879 ) ) ( not ( = ?auto_524871 ?auto_524880 ) ) ( not ( = ?auto_524871 ?auto_524881 ) ) ( not ( = ?auto_524871 ?auto_524882 ) ) ( not ( = ?auto_524871 ?auto_524883 ) ) ( not ( = ?auto_524872 ?auto_524873 ) ) ( not ( = ?auto_524872 ?auto_524874 ) ) ( not ( = ?auto_524872 ?auto_524875 ) ) ( not ( = ?auto_524872 ?auto_524876 ) ) ( not ( = ?auto_524872 ?auto_524877 ) ) ( not ( = ?auto_524872 ?auto_524878 ) ) ( not ( = ?auto_524872 ?auto_524879 ) ) ( not ( = ?auto_524872 ?auto_524880 ) ) ( not ( = ?auto_524872 ?auto_524881 ) ) ( not ( = ?auto_524872 ?auto_524882 ) ) ( not ( = ?auto_524872 ?auto_524883 ) ) ( not ( = ?auto_524873 ?auto_524874 ) ) ( not ( = ?auto_524873 ?auto_524875 ) ) ( not ( = ?auto_524873 ?auto_524876 ) ) ( not ( = ?auto_524873 ?auto_524877 ) ) ( not ( = ?auto_524873 ?auto_524878 ) ) ( not ( = ?auto_524873 ?auto_524879 ) ) ( not ( = ?auto_524873 ?auto_524880 ) ) ( not ( = ?auto_524873 ?auto_524881 ) ) ( not ( = ?auto_524873 ?auto_524882 ) ) ( not ( = ?auto_524873 ?auto_524883 ) ) ( not ( = ?auto_524874 ?auto_524875 ) ) ( not ( = ?auto_524874 ?auto_524876 ) ) ( not ( = ?auto_524874 ?auto_524877 ) ) ( not ( = ?auto_524874 ?auto_524878 ) ) ( not ( = ?auto_524874 ?auto_524879 ) ) ( not ( = ?auto_524874 ?auto_524880 ) ) ( not ( = ?auto_524874 ?auto_524881 ) ) ( not ( = ?auto_524874 ?auto_524882 ) ) ( not ( = ?auto_524874 ?auto_524883 ) ) ( not ( = ?auto_524875 ?auto_524876 ) ) ( not ( = ?auto_524875 ?auto_524877 ) ) ( not ( = ?auto_524875 ?auto_524878 ) ) ( not ( = ?auto_524875 ?auto_524879 ) ) ( not ( = ?auto_524875 ?auto_524880 ) ) ( not ( = ?auto_524875 ?auto_524881 ) ) ( not ( = ?auto_524875 ?auto_524882 ) ) ( not ( = ?auto_524875 ?auto_524883 ) ) ( not ( = ?auto_524876 ?auto_524877 ) ) ( not ( = ?auto_524876 ?auto_524878 ) ) ( not ( = ?auto_524876 ?auto_524879 ) ) ( not ( = ?auto_524876 ?auto_524880 ) ) ( not ( = ?auto_524876 ?auto_524881 ) ) ( not ( = ?auto_524876 ?auto_524882 ) ) ( not ( = ?auto_524876 ?auto_524883 ) ) ( not ( = ?auto_524877 ?auto_524878 ) ) ( not ( = ?auto_524877 ?auto_524879 ) ) ( not ( = ?auto_524877 ?auto_524880 ) ) ( not ( = ?auto_524877 ?auto_524881 ) ) ( not ( = ?auto_524877 ?auto_524882 ) ) ( not ( = ?auto_524877 ?auto_524883 ) ) ( not ( = ?auto_524878 ?auto_524879 ) ) ( not ( = ?auto_524878 ?auto_524880 ) ) ( not ( = ?auto_524878 ?auto_524881 ) ) ( not ( = ?auto_524878 ?auto_524882 ) ) ( not ( = ?auto_524878 ?auto_524883 ) ) ( not ( = ?auto_524879 ?auto_524880 ) ) ( not ( = ?auto_524879 ?auto_524881 ) ) ( not ( = ?auto_524879 ?auto_524882 ) ) ( not ( = ?auto_524879 ?auto_524883 ) ) ( not ( = ?auto_524880 ?auto_524881 ) ) ( not ( = ?auto_524880 ?auto_524882 ) ) ( not ( = ?auto_524880 ?auto_524883 ) ) ( not ( = ?auto_524881 ?auto_524882 ) ) ( not ( = ?auto_524881 ?auto_524883 ) ) ( not ( = ?auto_524882 ?auto_524883 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_524882 ?auto_524883 )
      ( !STACK ?auto_524882 ?auto_524881 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_524927 - BLOCK
      ?auto_524928 - BLOCK
      ?auto_524929 - BLOCK
      ?auto_524930 - BLOCK
      ?auto_524931 - BLOCK
      ?auto_524932 - BLOCK
      ?auto_524933 - BLOCK
      ?auto_524934 - BLOCK
      ?auto_524935 - BLOCK
      ?auto_524936 - BLOCK
      ?auto_524937 - BLOCK
      ?auto_524938 - BLOCK
      ?auto_524939 - BLOCK
      ?auto_524940 - BLOCK
    )
    :vars
    (
      ?auto_524941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524940 ?auto_524941 ) ( ON-TABLE ?auto_524927 ) ( ON ?auto_524928 ?auto_524927 ) ( ON ?auto_524929 ?auto_524928 ) ( ON ?auto_524930 ?auto_524929 ) ( ON ?auto_524931 ?auto_524930 ) ( ON ?auto_524932 ?auto_524931 ) ( ON ?auto_524933 ?auto_524932 ) ( ON ?auto_524934 ?auto_524933 ) ( ON ?auto_524935 ?auto_524934 ) ( ON ?auto_524936 ?auto_524935 ) ( ON ?auto_524937 ?auto_524936 ) ( ON ?auto_524938 ?auto_524937 ) ( not ( = ?auto_524927 ?auto_524928 ) ) ( not ( = ?auto_524927 ?auto_524929 ) ) ( not ( = ?auto_524927 ?auto_524930 ) ) ( not ( = ?auto_524927 ?auto_524931 ) ) ( not ( = ?auto_524927 ?auto_524932 ) ) ( not ( = ?auto_524927 ?auto_524933 ) ) ( not ( = ?auto_524927 ?auto_524934 ) ) ( not ( = ?auto_524927 ?auto_524935 ) ) ( not ( = ?auto_524927 ?auto_524936 ) ) ( not ( = ?auto_524927 ?auto_524937 ) ) ( not ( = ?auto_524927 ?auto_524938 ) ) ( not ( = ?auto_524927 ?auto_524939 ) ) ( not ( = ?auto_524927 ?auto_524940 ) ) ( not ( = ?auto_524927 ?auto_524941 ) ) ( not ( = ?auto_524928 ?auto_524929 ) ) ( not ( = ?auto_524928 ?auto_524930 ) ) ( not ( = ?auto_524928 ?auto_524931 ) ) ( not ( = ?auto_524928 ?auto_524932 ) ) ( not ( = ?auto_524928 ?auto_524933 ) ) ( not ( = ?auto_524928 ?auto_524934 ) ) ( not ( = ?auto_524928 ?auto_524935 ) ) ( not ( = ?auto_524928 ?auto_524936 ) ) ( not ( = ?auto_524928 ?auto_524937 ) ) ( not ( = ?auto_524928 ?auto_524938 ) ) ( not ( = ?auto_524928 ?auto_524939 ) ) ( not ( = ?auto_524928 ?auto_524940 ) ) ( not ( = ?auto_524928 ?auto_524941 ) ) ( not ( = ?auto_524929 ?auto_524930 ) ) ( not ( = ?auto_524929 ?auto_524931 ) ) ( not ( = ?auto_524929 ?auto_524932 ) ) ( not ( = ?auto_524929 ?auto_524933 ) ) ( not ( = ?auto_524929 ?auto_524934 ) ) ( not ( = ?auto_524929 ?auto_524935 ) ) ( not ( = ?auto_524929 ?auto_524936 ) ) ( not ( = ?auto_524929 ?auto_524937 ) ) ( not ( = ?auto_524929 ?auto_524938 ) ) ( not ( = ?auto_524929 ?auto_524939 ) ) ( not ( = ?auto_524929 ?auto_524940 ) ) ( not ( = ?auto_524929 ?auto_524941 ) ) ( not ( = ?auto_524930 ?auto_524931 ) ) ( not ( = ?auto_524930 ?auto_524932 ) ) ( not ( = ?auto_524930 ?auto_524933 ) ) ( not ( = ?auto_524930 ?auto_524934 ) ) ( not ( = ?auto_524930 ?auto_524935 ) ) ( not ( = ?auto_524930 ?auto_524936 ) ) ( not ( = ?auto_524930 ?auto_524937 ) ) ( not ( = ?auto_524930 ?auto_524938 ) ) ( not ( = ?auto_524930 ?auto_524939 ) ) ( not ( = ?auto_524930 ?auto_524940 ) ) ( not ( = ?auto_524930 ?auto_524941 ) ) ( not ( = ?auto_524931 ?auto_524932 ) ) ( not ( = ?auto_524931 ?auto_524933 ) ) ( not ( = ?auto_524931 ?auto_524934 ) ) ( not ( = ?auto_524931 ?auto_524935 ) ) ( not ( = ?auto_524931 ?auto_524936 ) ) ( not ( = ?auto_524931 ?auto_524937 ) ) ( not ( = ?auto_524931 ?auto_524938 ) ) ( not ( = ?auto_524931 ?auto_524939 ) ) ( not ( = ?auto_524931 ?auto_524940 ) ) ( not ( = ?auto_524931 ?auto_524941 ) ) ( not ( = ?auto_524932 ?auto_524933 ) ) ( not ( = ?auto_524932 ?auto_524934 ) ) ( not ( = ?auto_524932 ?auto_524935 ) ) ( not ( = ?auto_524932 ?auto_524936 ) ) ( not ( = ?auto_524932 ?auto_524937 ) ) ( not ( = ?auto_524932 ?auto_524938 ) ) ( not ( = ?auto_524932 ?auto_524939 ) ) ( not ( = ?auto_524932 ?auto_524940 ) ) ( not ( = ?auto_524932 ?auto_524941 ) ) ( not ( = ?auto_524933 ?auto_524934 ) ) ( not ( = ?auto_524933 ?auto_524935 ) ) ( not ( = ?auto_524933 ?auto_524936 ) ) ( not ( = ?auto_524933 ?auto_524937 ) ) ( not ( = ?auto_524933 ?auto_524938 ) ) ( not ( = ?auto_524933 ?auto_524939 ) ) ( not ( = ?auto_524933 ?auto_524940 ) ) ( not ( = ?auto_524933 ?auto_524941 ) ) ( not ( = ?auto_524934 ?auto_524935 ) ) ( not ( = ?auto_524934 ?auto_524936 ) ) ( not ( = ?auto_524934 ?auto_524937 ) ) ( not ( = ?auto_524934 ?auto_524938 ) ) ( not ( = ?auto_524934 ?auto_524939 ) ) ( not ( = ?auto_524934 ?auto_524940 ) ) ( not ( = ?auto_524934 ?auto_524941 ) ) ( not ( = ?auto_524935 ?auto_524936 ) ) ( not ( = ?auto_524935 ?auto_524937 ) ) ( not ( = ?auto_524935 ?auto_524938 ) ) ( not ( = ?auto_524935 ?auto_524939 ) ) ( not ( = ?auto_524935 ?auto_524940 ) ) ( not ( = ?auto_524935 ?auto_524941 ) ) ( not ( = ?auto_524936 ?auto_524937 ) ) ( not ( = ?auto_524936 ?auto_524938 ) ) ( not ( = ?auto_524936 ?auto_524939 ) ) ( not ( = ?auto_524936 ?auto_524940 ) ) ( not ( = ?auto_524936 ?auto_524941 ) ) ( not ( = ?auto_524937 ?auto_524938 ) ) ( not ( = ?auto_524937 ?auto_524939 ) ) ( not ( = ?auto_524937 ?auto_524940 ) ) ( not ( = ?auto_524937 ?auto_524941 ) ) ( not ( = ?auto_524938 ?auto_524939 ) ) ( not ( = ?auto_524938 ?auto_524940 ) ) ( not ( = ?auto_524938 ?auto_524941 ) ) ( not ( = ?auto_524939 ?auto_524940 ) ) ( not ( = ?auto_524939 ?auto_524941 ) ) ( not ( = ?auto_524940 ?auto_524941 ) ) ( CLEAR ?auto_524938 ) ( ON ?auto_524939 ?auto_524940 ) ( CLEAR ?auto_524939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_524927 ?auto_524928 ?auto_524929 ?auto_524930 ?auto_524931 ?auto_524932 ?auto_524933 ?auto_524934 ?auto_524935 ?auto_524936 ?auto_524937 ?auto_524938 ?auto_524939 )
      ( MAKE-14PILE ?auto_524927 ?auto_524928 ?auto_524929 ?auto_524930 ?auto_524931 ?auto_524932 ?auto_524933 ?auto_524934 ?auto_524935 ?auto_524936 ?auto_524937 ?auto_524938 ?auto_524939 ?auto_524940 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_524985 - BLOCK
      ?auto_524986 - BLOCK
      ?auto_524987 - BLOCK
      ?auto_524988 - BLOCK
      ?auto_524989 - BLOCK
      ?auto_524990 - BLOCK
      ?auto_524991 - BLOCK
      ?auto_524992 - BLOCK
      ?auto_524993 - BLOCK
      ?auto_524994 - BLOCK
      ?auto_524995 - BLOCK
      ?auto_524996 - BLOCK
      ?auto_524997 - BLOCK
      ?auto_524998 - BLOCK
    )
    :vars
    (
      ?auto_524999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_524998 ?auto_524999 ) ( ON-TABLE ?auto_524985 ) ( ON ?auto_524986 ?auto_524985 ) ( ON ?auto_524987 ?auto_524986 ) ( ON ?auto_524988 ?auto_524987 ) ( ON ?auto_524989 ?auto_524988 ) ( ON ?auto_524990 ?auto_524989 ) ( ON ?auto_524991 ?auto_524990 ) ( ON ?auto_524992 ?auto_524991 ) ( ON ?auto_524993 ?auto_524992 ) ( ON ?auto_524994 ?auto_524993 ) ( ON ?auto_524995 ?auto_524994 ) ( not ( = ?auto_524985 ?auto_524986 ) ) ( not ( = ?auto_524985 ?auto_524987 ) ) ( not ( = ?auto_524985 ?auto_524988 ) ) ( not ( = ?auto_524985 ?auto_524989 ) ) ( not ( = ?auto_524985 ?auto_524990 ) ) ( not ( = ?auto_524985 ?auto_524991 ) ) ( not ( = ?auto_524985 ?auto_524992 ) ) ( not ( = ?auto_524985 ?auto_524993 ) ) ( not ( = ?auto_524985 ?auto_524994 ) ) ( not ( = ?auto_524985 ?auto_524995 ) ) ( not ( = ?auto_524985 ?auto_524996 ) ) ( not ( = ?auto_524985 ?auto_524997 ) ) ( not ( = ?auto_524985 ?auto_524998 ) ) ( not ( = ?auto_524985 ?auto_524999 ) ) ( not ( = ?auto_524986 ?auto_524987 ) ) ( not ( = ?auto_524986 ?auto_524988 ) ) ( not ( = ?auto_524986 ?auto_524989 ) ) ( not ( = ?auto_524986 ?auto_524990 ) ) ( not ( = ?auto_524986 ?auto_524991 ) ) ( not ( = ?auto_524986 ?auto_524992 ) ) ( not ( = ?auto_524986 ?auto_524993 ) ) ( not ( = ?auto_524986 ?auto_524994 ) ) ( not ( = ?auto_524986 ?auto_524995 ) ) ( not ( = ?auto_524986 ?auto_524996 ) ) ( not ( = ?auto_524986 ?auto_524997 ) ) ( not ( = ?auto_524986 ?auto_524998 ) ) ( not ( = ?auto_524986 ?auto_524999 ) ) ( not ( = ?auto_524987 ?auto_524988 ) ) ( not ( = ?auto_524987 ?auto_524989 ) ) ( not ( = ?auto_524987 ?auto_524990 ) ) ( not ( = ?auto_524987 ?auto_524991 ) ) ( not ( = ?auto_524987 ?auto_524992 ) ) ( not ( = ?auto_524987 ?auto_524993 ) ) ( not ( = ?auto_524987 ?auto_524994 ) ) ( not ( = ?auto_524987 ?auto_524995 ) ) ( not ( = ?auto_524987 ?auto_524996 ) ) ( not ( = ?auto_524987 ?auto_524997 ) ) ( not ( = ?auto_524987 ?auto_524998 ) ) ( not ( = ?auto_524987 ?auto_524999 ) ) ( not ( = ?auto_524988 ?auto_524989 ) ) ( not ( = ?auto_524988 ?auto_524990 ) ) ( not ( = ?auto_524988 ?auto_524991 ) ) ( not ( = ?auto_524988 ?auto_524992 ) ) ( not ( = ?auto_524988 ?auto_524993 ) ) ( not ( = ?auto_524988 ?auto_524994 ) ) ( not ( = ?auto_524988 ?auto_524995 ) ) ( not ( = ?auto_524988 ?auto_524996 ) ) ( not ( = ?auto_524988 ?auto_524997 ) ) ( not ( = ?auto_524988 ?auto_524998 ) ) ( not ( = ?auto_524988 ?auto_524999 ) ) ( not ( = ?auto_524989 ?auto_524990 ) ) ( not ( = ?auto_524989 ?auto_524991 ) ) ( not ( = ?auto_524989 ?auto_524992 ) ) ( not ( = ?auto_524989 ?auto_524993 ) ) ( not ( = ?auto_524989 ?auto_524994 ) ) ( not ( = ?auto_524989 ?auto_524995 ) ) ( not ( = ?auto_524989 ?auto_524996 ) ) ( not ( = ?auto_524989 ?auto_524997 ) ) ( not ( = ?auto_524989 ?auto_524998 ) ) ( not ( = ?auto_524989 ?auto_524999 ) ) ( not ( = ?auto_524990 ?auto_524991 ) ) ( not ( = ?auto_524990 ?auto_524992 ) ) ( not ( = ?auto_524990 ?auto_524993 ) ) ( not ( = ?auto_524990 ?auto_524994 ) ) ( not ( = ?auto_524990 ?auto_524995 ) ) ( not ( = ?auto_524990 ?auto_524996 ) ) ( not ( = ?auto_524990 ?auto_524997 ) ) ( not ( = ?auto_524990 ?auto_524998 ) ) ( not ( = ?auto_524990 ?auto_524999 ) ) ( not ( = ?auto_524991 ?auto_524992 ) ) ( not ( = ?auto_524991 ?auto_524993 ) ) ( not ( = ?auto_524991 ?auto_524994 ) ) ( not ( = ?auto_524991 ?auto_524995 ) ) ( not ( = ?auto_524991 ?auto_524996 ) ) ( not ( = ?auto_524991 ?auto_524997 ) ) ( not ( = ?auto_524991 ?auto_524998 ) ) ( not ( = ?auto_524991 ?auto_524999 ) ) ( not ( = ?auto_524992 ?auto_524993 ) ) ( not ( = ?auto_524992 ?auto_524994 ) ) ( not ( = ?auto_524992 ?auto_524995 ) ) ( not ( = ?auto_524992 ?auto_524996 ) ) ( not ( = ?auto_524992 ?auto_524997 ) ) ( not ( = ?auto_524992 ?auto_524998 ) ) ( not ( = ?auto_524992 ?auto_524999 ) ) ( not ( = ?auto_524993 ?auto_524994 ) ) ( not ( = ?auto_524993 ?auto_524995 ) ) ( not ( = ?auto_524993 ?auto_524996 ) ) ( not ( = ?auto_524993 ?auto_524997 ) ) ( not ( = ?auto_524993 ?auto_524998 ) ) ( not ( = ?auto_524993 ?auto_524999 ) ) ( not ( = ?auto_524994 ?auto_524995 ) ) ( not ( = ?auto_524994 ?auto_524996 ) ) ( not ( = ?auto_524994 ?auto_524997 ) ) ( not ( = ?auto_524994 ?auto_524998 ) ) ( not ( = ?auto_524994 ?auto_524999 ) ) ( not ( = ?auto_524995 ?auto_524996 ) ) ( not ( = ?auto_524995 ?auto_524997 ) ) ( not ( = ?auto_524995 ?auto_524998 ) ) ( not ( = ?auto_524995 ?auto_524999 ) ) ( not ( = ?auto_524996 ?auto_524997 ) ) ( not ( = ?auto_524996 ?auto_524998 ) ) ( not ( = ?auto_524996 ?auto_524999 ) ) ( not ( = ?auto_524997 ?auto_524998 ) ) ( not ( = ?auto_524997 ?auto_524999 ) ) ( not ( = ?auto_524998 ?auto_524999 ) ) ( ON ?auto_524997 ?auto_524998 ) ( CLEAR ?auto_524995 ) ( ON ?auto_524996 ?auto_524997 ) ( CLEAR ?auto_524996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_524985 ?auto_524986 ?auto_524987 ?auto_524988 ?auto_524989 ?auto_524990 ?auto_524991 ?auto_524992 ?auto_524993 ?auto_524994 ?auto_524995 ?auto_524996 )
      ( MAKE-14PILE ?auto_524985 ?auto_524986 ?auto_524987 ?auto_524988 ?auto_524989 ?auto_524990 ?auto_524991 ?auto_524992 ?auto_524993 ?auto_524994 ?auto_524995 ?auto_524996 ?auto_524997 ?auto_524998 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_525043 - BLOCK
      ?auto_525044 - BLOCK
      ?auto_525045 - BLOCK
      ?auto_525046 - BLOCK
      ?auto_525047 - BLOCK
      ?auto_525048 - BLOCK
      ?auto_525049 - BLOCK
      ?auto_525050 - BLOCK
      ?auto_525051 - BLOCK
      ?auto_525052 - BLOCK
      ?auto_525053 - BLOCK
      ?auto_525054 - BLOCK
      ?auto_525055 - BLOCK
      ?auto_525056 - BLOCK
    )
    :vars
    (
      ?auto_525057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525056 ?auto_525057 ) ( ON-TABLE ?auto_525043 ) ( ON ?auto_525044 ?auto_525043 ) ( ON ?auto_525045 ?auto_525044 ) ( ON ?auto_525046 ?auto_525045 ) ( ON ?auto_525047 ?auto_525046 ) ( ON ?auto_525048 ?auto_525047 ) ( ON ?auto_525049 ?auto_525048 ) ( ON ?auto_525050 ?auto_525049 ) ( ON ?auto_525051 ?auto_525050 ) ( ON ?auto_525052 ?auto_525051 ) ( not ( = ?auto_525043 ?auto_525044 ) ) ( not ( = ?auto_525043 ?auto_525045 ) ) ( not ( = ?auto_525043 ?auto_525046 ) ) ( not ( = ?auto_525043 ?auto_525047 ) ) ( not ( = ?auto_525043 ?auto_525048 ) ) ( not ( = ?auto_525043 ?auto_525049 ) ) ( not ( = ?auto_525043 ?auto_525050 ) ) ( not ( = ?auto_525043 ?auto_525051 ) ) ( not ( = ?auto_525043 ?auto_525052 ) ) ( not ( = ?auto_525043 ?auto_525053 ) ) ( not ( = ?auto_525043 ?auto_525054 ) ) ( not ( = ?auto_525043 ?auto_525055 ) ) ( not ( = ?auto_525043 ?auto_525056 ) ) ( not ( = ?auto_525043 ?auto_525057 ) ) ( not ( = ?auto_525044 ?auto_525045 ) ) ( not ( = ?auto_525044 ?auto_525046 ) ) ( not ( = ?auto_525044 ?auto_525047 ) ) ( not ( = ?auto_525044 ?auto_525048 ) ) ( not ( = ?auto_525044 ?auto_525049 ) ) ( not ( = ?auto_525044 ?auto_525050 ) ) ( not ( = ?auto_525044 ?auto_525051 ) ) ( not ( = ?auto_525044 ?auto_525052 ) ) ( not ( = ?auto_525044 ?auto_525053 ) ) ( not ( = ?auto_525044 ?auto_525054 ) ) ( not ( = ?auto_525044 ?auto_525055 ) ) ( not ( = ?auto_525044 ?auto_525056 ) ) ( not ( = ?auto_525044 ?auto_525057 ) ) ( not ( = ?auto_525045 ?auto_525046 ) ) ( not ( = ?auto_525045 ?auto_525047 ) ) ( not ( = ?auto_525045 ?auto_525048 ) ) ( not ( = ?auto_525045 ?auto_525049 ) ) ( not ( = ?auto_525045 ?auto_525050 ) ) ( not ( = ?auto_525045 ?auto_525051 ) ) ( not ( = ?auto_525045 ?auto_525052 ) ) ( not ( = ?auto_525045 ?auto_525053 ) ) ( not ( = ?auto_525045 ?auto_525054 ) ) ( not ( = ?auto_525045 ?auto_525055 ) ) ( not ( = ?auto_525045 ?auto_525056 ) ) ( not ( = ?auto_525045 ?auto_525057 ) ) ( not ( = ?auto_525046 ?auto_525047 ) ) ( not ( = ?auto_525046 ?auto_525048 ) ) ( not ( = ?auto_525046 ?auto_525049 ) ) ( not ( = ?auto_525046 ?auto_525050 ) ) ( not ( = ?auto_525046 ?auto_525051 ) ) ( not ( = ?auto_525046 ?auto_525052 ) ) ( not ( = ?auto_525046 ?auto_525053 ) ) ( not ( = ?auto_525046 ?auto_525054 ) ) ( not ( = ?auto_525046 ?auto_525055 ) ) ( not ( = ?auto_525046 ?auto_525056 ) ) ( not ( = ?auto_525046 ?auto_525057 ) ) ( not ( = ?auto_525047 ?auto_525048 ) ) ( not ( = ?auto_525047 ?auto_525049 ) ) ( not ( = ?auto_525047 ?auto_525050 ) ) ( not ( = ?auto_525047 ?auto_525051 ) ) ( not ( = ?auto_525047 ?auto_525052 ) ) ( not ( = ?auto_525047 ?auto_525053 ) ) ( not ( = ?auto_525047 ?auto_525054 ) ) ( not ( = ?auto_525047 ?auto_525055 ) ) ( not ( = ?auto_525047 ?auto_525056 ) ) ( not ( = ?auto_525047 ?auto_525057 ) ) ( not ( = ?auto_525048 ?auto_525049 ) ) ( not ( = ?auto_525048 ?auto_525050 ) ) ( not ( = ?auto_525048 ?auto_525051 ) ) ( not ( = ?auto_525048 ?auto_525052 ) ) ( not ( = ?auto_525048 ?auto_525053 ) ) ( not ( = ?auto_525048 ?auto_525054 ) ) ( not ( = ?auto_525048 ?auto_525055 ) ) ( not ( = ?auto_525048 ?auto_525056 ) ) ( not ( = ?auto_525048 ?auto_525057 ) ) ( not ( = ?auto_525049 ?auto_525050 ) ) ( not ( = ?auto_525049 ?auto_525051 ) ) ( not ( = ?auto_525049 ?auto_525052 ) ) ( not ( = ?auto_525049 ?auto_525053 ) ) ( not ( = ?auto_525049 ?auto_525054 ) ) ( not ( = ?auto_525049 ?auto_525055 ) ) ( not ( = ?auto_525049 ?auto_525056 ) ) ( not ( = ?auto_525049 ?auto_525057 ) ) ( not ( = ?auto_525050 ?auto_525051 ) ) ( not ( = ?auto_525050 ?auto_525052 ) ) ( not ( = ?auto_525050 ?auto_525053 ) ) ( not ( = ?auto_525050 ?auto_525054 ) ) ( not ( = ?auto_525050 ?auto_525055 ) ) ( not ( = ?auto_525050 ?auto_525056 ) ) ( not ( = ?auto_525050 ?auto_525057 ) ) ( not ( = ?auto_525051 ?auto_525052 ) ) ( not ( = ?auto_525051 ?auto_525053 ) ) ( not ( = ?auto_525051 ?auto_525054 ) ) ( not ( = ?auto_525051 ?auto_525055 ) ) ( not ( = ?auto_525051 ?auto_525056 ) ) ( not ( = ?auto_525051 ?auto_525057 ) ) ( not ( = ?auto_525052 ?auto_525053 ) ) ( not ( = ?auto_525052 ?auto_525054 ) ) ( not ( = ?auto_525052 ?auto_525055 ) ) ( not ( = ?auto_525052 ?auto_525056 ) ) ( not ( = ?auto_525052 ?auto_525057 ) ) ( not ( = ?auto_525053 ?auto_525054 ) ) ( not ( = ?auto_525053 ?auto_525055 ) ) ( not ( = ?auto_525053 ?auto_525056 ) ) ( not ( = ?auto_525053 ?auto_525057 ) ) ( not ( = ?auto_525054 ?auto_525055 ) ) ( not ( = ?auto_525054 ?auto_525056 ) ) ( not ( = ?auto_525054 ?auto_525057 ) ) ( not ( = ?auto_525055 ?auto_525056 ) ) ( not ( = ?auto_525055 ?auto_525057 ) ) ( not ( = ?auto_525056 ?auto_525057 ) ) ( ON ?auto_525055 ?auto_525056 ) ( ON ?auto_525054 ?auto_525055 ) ( CLEAR ?auto_525052 ) ( ON ?auto_525053 ?auto_525054 ) ( CLEAR ?auto_525053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_525043 ?auto_525044 ?auto_525045 ?auto_525046 ?auto_525047 ?auto_525048 ?auto_525049 ?auto_525050 ?auto_525051 ?auto_525052 ?auto_525053 )
      ( MAKE-14PILE ?auto_525043 ?auto_525044 ?auto_525045 ?auto_525046 ?auto_525047 ?auto_525048 ?auto_525049 ?auto_525050 ?auto_525051 ?auto_525052 ?auto_525053 ?auto_525054 ?auto_525055 ?auto_525056 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_525101 - BLOCK
      ?auto_525102 - BLOCK
      ?auto_525103 - BLOCK
      ?auto_525104 - BLOCK
      ?auto_525105 - BLOCK
      ?auto_525106 - BLOCK
      ?auto_525107 - BLOCK
      ?auto_525108 - BLOCK
      ?auto_525109 - BLOCK
      ?auto_525110 - BLOCK
      ?auto_525111 - BLOCK
      ?auto_525112 - BLOCK
      ?auto_525113 - BLOCK
      ?auto_525114 - BLOCK
    )
    :vars
    (
      ?auto_525115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525114 ?auto_525115 ) ( ON-TABLE ?auto_525101 ) ( ON ?auto_525102 ?auto_525101 ) ( ON ?auto_525103 ?auto_525102 ) ( ON ?auto_525104 ?auto_525103 ) ( ON ?auto_525105 ?auto_525104 ) ( ON ?auto_525106 ?auto_525105 ) ( ON ?auto_525107 ?auto_525106 ) ( ON ?auto_525108 ?auto_525107 ) ( ON ?auto_525109 ?auto_525108 ) ( not ( = ?auto_525101 ?auto_525102 ) ) ( not ( = ?auto_525101 ?auto_525103 ) ) ( not ( = ?auto_525101 ?auto_525104 ) ) ( not ( = ?auto_525101 ?auto_525105 ) ) ( not ( = ?auto_525101 ?auto_525106 ) ) ( not ( = ?auto_525101 ?auto_525107 ) ) ( not ( = ?auto_525101 ?auto_525108 ) ) ( not ( = ?auto_525101 ?auto_525109 ) ) ( not ( = ?auto_525101 ?auto_525110 ) ) ( not ( = ?auto_525101 ?auto_525111 ) ) ( not ( = ?auto_525101 ?auto_525112 ) ) ( not ( = ?auto_525101 ?auto_525113 ) ) ( not ( = ?auto_525101 ?auto_525114 ) ) ( not ( = ?auto_525101 ?auto_525115 ) ) ( not ( = ?auto_525102 ?auto_525103 ) ) ( not ( = ?auto_525102 ?auto_525104 ) ) ( not ( = ?auto_525102 ?auto_525105 ) ) ( not ( = ?auto_525102 ?auto_525106 ) ) ( not ( = ?auto_525102 ?auto_525107 ) ) ( not ( = ?auto_525102 ?auto_525108 ) ) ( not ( = ?auto_525102 ?auto_525109 ) ) ( not ( = ?auto_525102 ?auto_525110 ) ) ( not ( = ?auto_525102 ?auto_525111 ) ) ( not ( = ?auto_525102 ?auto_525112 ) ) ( not ( = ?auto_525102 ?auto_525113 ) ) ( not ( = ?auto_525102 ?auto_525114 ) ) ( not ( = ?auto_525102 ?auto_525115 ) ) ( not ( = ?auto_525103 ?auto_525104 ) ) ( not ( = ?auto_525103 ?auto_525105 ) ) ( not ( = ?auto_525103 ?auto_525106 ) ) ( not ( = ?auto_525103 ?auto_525107 ) ) ( not ( = ?auto_525103 ?auto_525108 ) ) ( not ( = ?auto_525103 ?auto_525109 ) ) ( not ( = ?auto_525103 ?auto_525110 ) ) ( not ( = ?auto_525103 ?auto_525111 ) ) ( not ( = ?auto_525103 ?auto_525112 ) ) ( not ( = ?auto_525103 ?auto_525113 ) ) ( not ( = ?auto_525103 ?auto_525114 ) ) ( not ( = ?auto_525103 ?auto_525115 ) ) ( not ( = ?auto_525104 ?auto_525105 ) ) ( not ( = ?auto_525104 ?auto_525106 ) ) ( not ( = ?auto_525104 ?auto_525107 ) ) ( not ( = ?auto_525104 ?auto_525108 ) ) ( not ( = ?auto_525104 ?auto_525109 ) ) ( not ( = ?auto_525104 ?auto_525110 ) ) ( not ( = ?auto_525104 ?auto_525111 ) ) ( not ( = ?auto_525104 ?auto_525112 ) ) ( not ( = ?auto_525104 ?auto_525113 ) ) ( not ( = ?auto_525104 ?auto_525114 ) ) ( not ( = ?auto_525104 ?auto_525115 ) ) ( not ( = ?auto_525105 ?auto_525106 ) ) ( not ( = ?auto_525105 ?auto_525107 ) ) ( not ( = ?auto_525105 ?auto_525108 ) ) ( not ( = ?auto_525105 ?auto_525109 ) ) ( not ( = ?auto_525105 ?auto_525110 ) ) ( not ( = ?auto_525105 ?auto_525111 ) ) ( not ( = ?auto_525105 ?auto_525112 ) ) ( not ( = ?auto_525105 ?auto_525113 ) ) ( not ( = ?auto_525105 ?auto_525114 ) ) ( not ( = ?auto_525105 ?auto_525115 ) ) ( not ( = ?auto_525106 ?auto_525107 ) ) ( not ( = ?auto_525106 ?auto_525108 ) ) ( not ( = ?auto_525106 ?auto_525109 ) ) ( not ( = ?auto_525106 ?auto_525110 ) ) ( not ( = ?auto_525106 ?auto_525111 ) ) ( not ( = ?auto_525106 ?auto_525112 ) ) ( not ( = ?auto_525106 ?auto_525113 ) ) ( not ( = ?auto_525106 ?auto_525114 ) ) ( not ( = ?auto_525106 ?auto_525115 ) ) ( not ( = ?auto_525107 ?auto_525108 ) ) ( not ( = ?auto_525107 ?auto_525109 ) ) ( not ( = ?auto_525107 ?auto_525110 ) ) ( not ( = ?auto_525107 ?auto_525111 ) ) ( not ( = ?auto_525107 ?auto_525112 ) ) ( not ( = ?auto_525107 ?auto_525113 ) ) ( not ( = ?auto_525107 ?auto_525114 ) ) ( not ( = ?auto_525107 ?auto_525115 ) ) ( not ( = ?auto_525108 ?auto_525109 ) ) ( not ( = ?auto_525108 ?auto_525110 ) ) ( not ( = ?auto_525108 ?auto_525111 ) ) ( not ( = ?auto_525108 ?auto_525112 ) ) ( not ( = ?auto_525108 ?auto_525113 ) ) ( not ( = ?auto_525108 ?auto_525114 ) ) ( not ( = ?auto_525108 ?auto_525115 ) ) ( not ( = ?auto_525109 ?auto_525110 ) ) ( not ( = ?auto_525109 ?auto_525111 ) ) ( not ( = ?auto_525109 ?auto_525112 ) ) ( not ( = ?auto_525109 ?auto_525113 ) ) ( not ( = ?auto_525109 ?auto_525114 ) ) ( not ( = ?auto_525109 ?auto_525115 ) ) ( not ( = ?auto_525110 ?auto_525111 ) ) ( not ( = ?auto_525110 ?auto_525112 ) ) ( not ( = ?auto_525110 ?auto_525113 ) ) ( not ( = ?auto_525110 ?auto_525114 ) ) ( not ( = ?auto_525110 ?auto_525115 ) ) ( not ( = ?auto_525111 ?auto_525112 ) ) ( not ( = ?auto_525111 ?auto_525113 ) ) ( not ( = ?auto_525111 ?auto_525114 ) ) ( not ( = ?auto_525111 ?auto_525115 ) ) ( not ( = ?auto_525112 ?auto_525113 ) ) ( not ( = ?auto_525112 ?auto_525114 ) ) ( not ( = ?auto_525112 ?auto_525115 ) ) ( not ( = ?auto_525113 ?auto_525114 ) ) ( not ( = ?auto_525113 ?auto_525115 ) ) ( not ( = ?auto_525114 ?auto_525115 ) ) ( ON ?auto_525113 ?auto_525114 ) ( ON ?auto_525112 ?auto_525113 ) ( ON ?auto_525111 ?auto_525112 ) ( CLEAR ?auto_525109 ) ( ON ?auto_525110 ?auto_525111 ) ( CLEAR ?auto_525110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_525101 ?auto_525102 ?auto_525103 ?auto_525104 ?auto_525105 ?auto_525106 ?auto_525107 ?auto_525108 ?auto_525109 ?auto_525110 )
      ( MAKE-14PILE ?auto_525101 ?auto_525102 ?auto_525103 ?auto_525104 ?auto_525105 ?auto_525106 ?auto_525107 ?auto_525108 ?auto_525109 ?auto_525110 ?auto_525111 ?auto_525112 ?auto_525113 ?auto_525114 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_525159 - BLOCK
      ?auto_525160 - BLOCK
      ?auto_525161 - BLOCK
      ?auto_525162 - BLOCK
      ?auto_525163 - BLOCK
      ?auto_525164 - BLOCK
      ?auto_525165 - BLOCK
      ?auto_525166 - BLOCK
      ?auto_525167 - BLOCK
      ?auto_525168 - BLOCK
      ?auto_525169 - BLOCK
      ?auto_525170 - BLOCK
      ?auto_525171 - BLOCK
      ?auto_525172 - BLOCK
    )
    :vars
    (
      ?auto_525173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525172 ?auto_525173 ) ( ON-TABLE ?auto_525159 ) ( ON ?auto_525160 ?auto_525159 ) ( ON ?auto_525161 ?auto_525160 ) ( ON ?auto_525162 ?auto_525161 ) ( ON ?auto_525163 ?auto_525162 ) ( ON ?auto_525164 ?auto_525163 ) ( ON ?auto_525165 ?auto_525164 ) ( ON ?auto_525166 ?auto_525165 ) ( not ( = ?auto_525159 ?auto_525160 ) ) ( not ( = ?auto_525159 ?auto_525161 ) ) ( not ( = ?auto_525159 ?auto_525162 ) ) ( not ( = ?auto_525159 ?auto_525163 ) ) ( not ( = ?auto_525159 ?auto_525164 ) ) ( not ( = ?auto_525159 ?auto_525165 ) ) ( not ( = ?auto_525159 ?auto_525166 ) ) ( not ( = ?auto_525159 ?auto_525167 ) ) ( not ( = ?auto_525159 ?auto_525168 ) ) ( not ( = ?auto_525159 ?auto_525169 ) ) ( not ( = ?auto_525159 ?auto_525170 ) ) ( not ( = ?auto_525159 ?auto_525171 ) ) ( not ( = ?auto_525159 ?auto_525172 ) ) ( not ( = ?auto_525159 ?auto_525173 ) ) ( not ( = ?auto_525160 ?auto_525161 ) ) ( not ( = ?auto_525160 ?auto_525162 ) ) ( not ( = ?auto_525160 ?auto_525163 ) ) ( not ( = ?auto_525160 ?auto_525164 ) ) ( not ( = ?auto_525160 ?auto_525165 ) ) ( not ( = ?auto_525160 ?auto_525166 ) ) ( not ( = ?auto_525160 ?auto_525167 ) ) ( not ( = ?auto_525160 ?auto_525168 ) ) ( not ( = ?auto_525160 ?auto_525169 ) ) ( not ( = ?auto_525160 ?auto_525170 ) ) ( not ( = ?auto_525160 ?auto_525171 ) ) ( not ( = ?auto_525160 ?auto_525172 ) ) ( not ( = ?auto_525160 ?auto_525173 ) ) ( not ( = ?auto_525161 ?auto_525162 ) ) ( not ( = ?auto_525161 ?auto_525163 ) ) ( not ( = ?auto_525161 ?auto_525164 ) ) ( not ( = ?auto_525161 ?auto_525165 ) ) ( not ( = ?auto_525161 ?auto_525166 ) ) ( not ( = ?auto_525161 ?auto_525167 ) ) ( not ( = ?auto_525161 ?auto_525168 ) ) ( not ( = ?auto_525161 ?auto_525169 ) ) ( not ( = ?auto_525161 ?auto_525170 ) ) ( not ( = ?auto_525161 ?auto_525171 ) ) ( not ( = ?auto_525161 ?auto_525172 ) ) ( not ( = ?auto_525161 ?auto_525173 ) ) ( not ( = ?auto_525162 ?auto_525163 ) ) ( not ( = ?auto_525162 ?auto_525164 ) ) ( not ( = ?auto_525162 ?auto_525165 ) ) ( not ( = ?auto_525162 ?auto_525166 ) ) ( not ( = ?auto_525162 ?auto_525167 ) ) ( not ( = ?auto_525162 ?auto_525168 ) ) ( not ( = ?auto_525162 ?auto_525169 ) ) ( not ( = ?auto_525162 ?auto_525170 ) ) ( not ( = ?auto_525162 ?auto_525171 ) ) ( not ( = ?auto_525162 ?auto_525172 ) ) ( not ( = ?auto_525162 ?auto_525173 ) ) ( not ( = ?auto_525163 ?auto_525164 ) ) ( not ( = ?auto_525163 ?auto_525165 ) ) ( not ( = ?auto_525163 ?auto_525166 ) ) ( not ( = ?auto_525163 ?auto_525167 ) ) ( not ( = ?auto_525163 ?auto_525168 ) ) ( not ( = ?auto_525163 ?auto_525169 ) ) ( not ( = ?auto_525163 ?auto_525170 ) ) ( not ( = ?auto_525163 ?auto_525171 ) ) ( not ( = ?auto_525163 ?auto_525172 ) ) ( not ( = ?auto_525163 ?auto_525173 ) ) ( not ( = ?auto_525164 ?auto_525165 ) ) ( not ( = ?auto_525164 ?auto_525166 ) ) ( not ( = ?auto_525164 ?auto_525167 ) ) ( not ( = ?auto_525164 ?auto_525168 ) ) ( not ( = ?auto_525164 ?auto_525169 ) ) ( not ( = ?auto_525164 ?auto_525170 ) ) ( not ( = ?auto_525164 ?auto_525171 ) ) ( not ( = ?auto_525164 ?auto_525172 ) ) ( not ( = ?auto_525164 ?auto_525173 ) ) ( not ( = ?auto_525165 ?auto_525166 ) ) ( not ( = ?auto_525165 ?auto_525167 ) ) ( not ( = ?auto_525165 ?auto_525168 ) ) ( not ( = ?auto_525165 ?auto_525169 ) ) ( not ( = ?auto_525165 ?auto_525170 ) ) ( not ( = ?auto_525165 ?auto_525171 ) ) ( not ( = ?auto_525165 ?auto_525172 ) ) ( not ( = ?auto_525165 ?auto_525173 ) ) ( not ( = ?auto_525166 ?auto_525167 ) ) ( not ( = ?auto_525166 ?auto_525168 ) ) ( not ( = ?auto_525166 ?auto_525169 ) ) ( not ( = ?auto_525166 ?auto_525170 ) ) ( not ( = ?auto_525166 ?auto_525171 ) ) ( not ( = ?auto_525166 ?auto_525172 ) ) ( not ( = ?auto_525166 ?auto_525173 ) ) ( not ( = ?auto_525167 ?auto_525168 ) ) ( not ( = ?auto_525167 ?auto_525169 ) ) ( not ( = ?auto_525167 ?auto_525170 ) ) ( not ( = ?auto_525167 ?auto_525171 ) ) ( not ( = ?auto_525167 ?auto_525172 ) ) ( not ( = ?auto_525167 ?auto_525173 ) ) ( not ( = ?auto_525168 ?auto_525169 ) ) ( not ( = ?auto_525168 ?auto_525170 ) ) ( not ( = ?auto_525168 ?auto_525171 ) ) ( not ( = ?auto_525168 ?auto_525172 ) ) ( not ( = ?auto_525168 ?auto_525173 ) ) ( not ( = ?auto_525169 ?auto_525170 ) ) ( not ( = ?auto_525169 ?auto_525171 ) ) ( not ( = ?auto_525169 ?auto_525172 ) ) ( not ( = ?auto_525169 ?auto_525173 ) ) ( not ( = ?auto_525170 ?auto_525171 ) ) ( not ( = ?auto_525170 ?auto_525172 ) ) ( not ( = ?auto_525170 ?auto_525173 ) ) ( not ( = ?auto_525171 ?auto_525172 ) ) ( not ( = ?auto_525171 ?auto_525173 ) ) ( not ( = ?auto_525172 ?auto_525173 ) ) ( ON ?auto_525171 ?auto_525172 ) ( ON ?auto_525170 ?auto_525171 ) ( ON ?auto_525169 ?auto_525170 ) ( ON ?auto_525168 ?auto_525169 ) ( CLEAR ?auto_525166 ) ( ON ?auto_525167 ?auto_525168 ) ( CLEAR ?auto_525167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_525159 ?auto_525160 ?auto_525161 ?auto_525162 ?auto_525163 ?auto_525164 ?auto_525165 ?auto_525166 ?auto_525167 )
      ( MAKE-14PILE ?auto_525159 ?auto_525160 ?auto_525161 ?auto_525162 ?auto_525163 ?auto_525164 ?auto_525165 ?auto_525166 ?auto_525167 ?auto_525168 ?auto_525169 ?auto_525170 ?auto_525171 ?auto_525172 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_525217 - BLOCK
      ?auto_525218 - BLOCK
      ?auto_525219 - BLOCK
      ?auto_525220 - BLOCK
      ?auto_525221 - BLOCK
      ?auto_525222 - BLOCK
      ?auto_525223 - BLOCK
      ?auto_525224 - BLOCK
      ?auto_525225 - BLOCK
      ?auto_525226 - BLOCK
      ?auto_525227 - BLOCK
      ?auto_525228 - BLOCK
      ?auto_525229 - BLOCK
      ?auto_525230 - BLOCK
    )
    :vars
    (
      ?auto_525231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525230 ?auto_525231 ) ( ON-TABLE ?auto_525217 ) ( ON ?auto_525218 ?auto_525217 ) ( ON ?auto_525219 ?auto_525218 ) ( ON ?auto_525220 ?auto_525219 ) ( ON ?auto_525221 ?auto_525220 ) ( ON ?auto_525222 ?auto_525221 ) ( ON ?auto_525223 ?auto_525222 ) ( not ( = ?auto_525217 ?auto_525218 ) ) ( not ( = ?auto_525217 ?auto_525219 ) ) ( not ( = ?auto_525217 ?auto_525220 ) ) ( not ( = ?auto_525217 ?auto_525221 ) ) ( not ( = ?auto_525217 ?auto_525222 ) ) ( not ( = ?auto_525217 ?auto_525223 ) ) ( not ( = ?auto_525217 ?auto_525224 ) ) ( not ( = ?auto_525217 ?auto_525225 ) ) ( not ( = ?auto_525217 ?auto_525226 ) ) ( not ( = ?auto_525217 ?auto_525227 ) ) ( not ( = ?auto_525217 ?auto_525228 ) ) ( not ( = ?auto_525217 ?auto_525229 ) ) ( not ( = ?auto_525217 ?auto_525230 ) ) ( not ( = ?auto_525217 ?auto_525231 ) ) ( not ( = ?auto_525218 ?auto_525219 ) ) ( not ( = ?auto_525218 ?auto_525220 ) ) ( not ( = ?auto_525218 ?auto_525221 ) ) ( not ( = ?auto_525218 ?auto_525222 ) ) ( not ( = ?auto_525218 ?auto_525223 ) ) ( not ( = ?auto_525218 ?auto_525224 ) ) ( not ( = ?auto_525218 ?auto_525225 ) ) ( not ( = ?auto_525218 ?auto_525226 ) ) ( not ( = ?auto_525218 ?auto_525227 ) ) ( not ( = ?auto_525218 ?auto_525228 ) ) ( not ( = ?auto_525218 ?auto_525229 ) ) ( not ( = ?auto_525218 ?auto_525230 ) ) ( not ( = ?auto_525218 ?auto_525231 ) ) ( not ( = ?auto_525219 ?auto_525220 ) ) ( not ( = ?auto_525219 ?auto_525221 ) ) ( not ( = ?auto_525219 ?auto_525222 ) ) ( not ( = ?auto_525219 ?auto_525223 ) ) ( not ( = ?auto_525219 ?auto_525224 ) ) ( not ( = ?auto_525219 ?auto_525225 ) ) ( not ( = ?auto_525219 ?auto_525226 ) ) ( not ( = ?auto_525219 ?auto_525227 ) ) ( not ( = ?auto_525219 ?auto_525228 ) ) ( not ( = ?auto_525219 ?auto_525229 ) ) ( not ( = ?auto_525219 ?auto_525230 ) ) ( not ( = ?auto_525219 ?auto_525231 ) ) ( not ( = ?auto_525220 ?auto_525221 ) ) ( not ( = ?auto_525220 ?auto_525222 ) ) ( not ( = ?auto_525220 ?auto_525223 ) ) ( not ( = ?auto_525220 ?auto_525224 ) ) ( not ( = ?auto_525220 ?auto_525225 ) ) ( not ( = ?auto_525220 ?auto_525226 ) ) ( not ( = ?auto_525220 ?auto_525227 ) ) ( not ( = ?auto_525220 ?auto_525228 ) ) ( not ( = ?auto_525220 ?auto_525229 ) ) ( not ( = ?auto_525220 ?auto_525230 ) ) ( not ( = ?auto_525220 ?auto_525231 ) ) ( not ( = ?auto_525221 ?auto_525222 ) ) ( not ( = ?auto_525221 ?auto_525223 ) ) ( not ( = ?auto_525221 ?auto_525224 ) ) ( not ( = ?auto_525221 ?auto_525225 ) ) ( not ( = ?auto_525221 ?auto_525226 ) ) ( not ( = ?auto_525221 ?auto_525227 ) ) ( not ( = ?auto_525221 ?auto_525228 ) ) ( not ( = ?auto_525221 ?auto_525229 ) ) ( not ( = ?auto_525221 ?auto_525230 ) ) ( not ( = ?auto_525221 ?auto_525231 ) ) ( not ( = ?auto_525222 ?auto_525223 ) ) ( not ( = ?auto_525222 ?auto_525224 ) ) ( not ( = ?auto_525222 ?auto_525225 ) ) ( not ( = ?auto_525222 ?auto_525226 ) ) ( not ( = ?auto_525222 ?auto_525227 ) ) ( not ( = ?auto_525222 ?auto_525228 ) ) ( not ( = ?auto_525222 ?auto_525229 ) ) ( not ( = ?auto_525222 ?auto_525230 ) ) ( not ( = ?auto_525222 ?auto_525231 ) ) ( not ( = ?auto_525223 ?auto_525224 ) ) ( not ( = ?auto_525223 ?auto_525225 ) ) ( not ( = ?auto_525223 ?auto_525226 ) ) ( not ( = ?auto_525223 ?auto_525227 ) ) ( not ( = ?auto_525223 ?auto_525228 ) ) ( not ( = ?auto_525223 ?auto_525229 ) ) ( not ( = ?auto_525223 ?auto_525230 ) ) ( not ( = ?auto_525223 ?auto_525231 ) ) ( not ( = ?auto_525224 ?auto_525225 ) ) ( not ( = ?auto_525224 ?auto_525226 ) ) ( not ( = ?auto_525224 ?auto_525227 ) ) ( not ( = ?auto_525224 ?auto_525228 ) ) ( not ( = ?auto_525224 ?auto_525229 ) ) ( not ( = ?auto_525224 ?auto_525230 ) ) ( not ( = ?auto_525224 ?auto_525231 ) ) ( not ( = ?auto_525225 ?auto_525226 ) ) ( not ( = ?auto_525225 ?auto_525227 ) ) ( not ( = ?auto_525225 ?auto_525228 ) ) ( not ( = ?auto_525225 ?auto_525229 ) ) ( not ( = ?auto_525225 ?auto_525230 ) ) ( not ( = ?auto_525225 ?auto_525231 ) ) ( not ( = ?auto_525226 ?auto_525227 ) ) ( not ( = ?auto_525226 ?auto_525228 ) ) ( not ( = ?auto_525226 ?auto_525229 ) ) ( not ( = ?auto_525226 ?auto_525230 ) ) ( not ( = ?auto_525226 ?auto_525231 ) ) ( not ( = ?auto_525227 ?auto_525228 ) ) ( not ( = ?auto_525227 ?auto_525229 ) ) ( not ( = ?auto_525227 ?auto_525230 ) ) ( not ( = ?auto_525227 ?auto_525231 ) ) ( not ( = ?auto_525228 ?auto_525229 ) ) ( not ( = ?auto_525228 ?auto_525230 ) ) ( not ( = ?auto_525228 ?auto_525231 ) ) ( not ( = ?auto_525229 ?auto_525230 ) ) ( not ( = ?auto_525229 ?auto_525231 ) ) ( not ( = ?auto_525230 ?auto_525231 ) ) ( ON ?auto_525229 ?auto_525230 ) ( ON ?auto_525228 ?auto_525229 ) ( ON ?auto_525227 ?auto_525228 ) ( ON ?auto_525226 ?auto_525227 ) ( ON ?auto_525225 ?auto_525226 ) ( CLEAR ?auto_525223 ) ( ON ?auto_525224 ?auto_525225 ) ( CLEAR ?auto_525224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_525217 ?auto_525218 ?auto_525219 ?auto_525220 ?auto_525221 ?auto_525222 ?auto_525223 ?auto_525224 )
      ( MAKE-14PILE ?auto_525217 ?auto_525218 ?auto_525219 ?auto_525220 ?auto_525221 ?auto_525222 ?auto_525223 ?auto_525224 ?auto_525225 ?auto_525226 ?auto_525227 ?auto_525228 ?auto_525229 ?auto_525230 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_525275 - BLOCK
      ?auto_525276 - BLOCK
      ?auto_525277 - BLOCK
      ?auto_525278 - BLOCK
      ?auto_525279 - BLOCK
      ?auto_525280 - BLOCK
      ?auto_525281 - BLOCK
      ?auto_525282 - BLOCK
      ?auto_525283 - BLOCK
      ?auto_525284 - BLOCK
      ?auto_525285 - BLOCK
      ?auto_525286 - BLOCK
      ?auto_525287 - BLOCK
      ?auto_525288 - BLOCK
    )
    :vars
    (
      ?auto_525289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525288 ?auto_525289 ) ( ON-TABLE ?auto_525275 ) ( ON ?auto_525276 ?auto_525275 ) ( ON ?auto_525277 ?auto_525276 ) ( ON ?auto_525278 ?auto_525277 ) ( ON ?auto_525279 ?auto_525278 ) ( ON ?auto_525280 ?auto_525279 ) ( not ( = ?auto_525275 ?auto_525276 ) ) ( not ( = ?auto_525275 ?auto_525277 ) ) ( not ( = ?auto_525275 ?auto_525278 ) ) ( not ( = ?auto_525275 ?auto_525279 ) ) ( not ( = ?auto_525275 ?auto_525280 ) ) ( not ( = ?auto_525275 ?auto_525281 ) ) ( not ( = ?auto_525275 ?auto_525282 ) ) ( not ( = ?auto_525275 ?auto_525283 ) ) ( not ( = ?auto_525275 ?auto_525284 ) ) ( not ( = ?auto_525275 ?auto_525285 ) ) ( not ( = ?auto_525275 ?auto_525286 ) ) ( not ( = ?auto_525275 ?auto_525287 ) ) ( not ( = ?auto_525275 ?auto_525288 ) ) ( not ( = ?auto_525275 ?auto_525289 ) ) ( not ( = ?auto_525276 ?auto_525277 ) ) ( not ( = ?auto_525276 ?auto_525278 ) ) ( not ( = ?auto_525276 ?auto_525279 ) ) ( not ( = ?auto_525276 ?auto_525280 ) ) ( not ( = ?auto_525276 ?auto_525281 ) ) ( not ( = ?auto_525276 ?auto_525282 ) ) ( not ( = ?auto_525276 ?auto_525283 ) ) ( not ( = ?auto_525276 ?auto_525284 ) ) ( not ( = ?auto_525276 ?auto_525285 ) ) ( not ( = ?auto_525276 ?auto_525286 ) ) ( not ( = ?auto_525276 ?auto_525287 ) ) ( not ( = ?auto_525276 ?auto_525288 ) ) ( not ( = ?auto_525276 ?auto_525289 ) ) ( not ( = ?auto_525277 ?auto_525278 ) ) ( not ( = ?auto_525277 ?auto_525279 ) ) ( not ( = ?auto_525277 ?auto_525280 ) ) ( not ( = ?auto_525277 ?auto_525281 ) ) ( not ( = ?auto_525277 ?auto_525282 ) ) ( not ( = ?auto_525277 ?auto_525283 ) ) ( not ( = ?auto_525277 ?auto_525284 ) ) ( not ( = ?auto_525277 ?auto_525285 ) ) ( not ( = ?auto_525277 ?auto_525286 ) ) ( not ( = ?auto_525277 ?auto_525287 ) ) ( not ( = ?auto_525277 ?auto_525288 ) ) ( not ( = ?auto_525277 ?auto_525289 ) ) ( not ( = ?auto_525278 ?auto_525279 ) ) ( not ( = ?auto_525278 ?auto_525280 ) ) ( not ( = ?auto_525278 ?auto_525281 ) ) ( not ( = ?auto_525278 ?auto_525282 ) ) ( not ( = ?auto_525278 ?auto_525283 ) ) ( not ( = ?auto_525278 ?auto_525284 ) ) ( not ( = ?auto_525278 ?auto_525285 ) ) ( not ( = ?auto_525278 ?auto_525286 ) ) ( not ( = ?auto_525278 ?auto_525287 ) ) ( not ( = ?auto_525278 ?auto_525288 ) ) ( not ( = ?auto_525278 ?auto_525289 ) ) ( not ( = ?auto_525279 ?auto_525280 ) ) ( not ( = ?auto_525279 ?auto_525281 ) ) ( not ( = ?auto_525279 ?auto_525282 ) ) ( not ( = ?auto_525279 ?auto_525283 ) ) ( not ( = ?auto_525279 ?auto_525284 ) ) ( not ( = ?auto_525279 ?auto_525285 ) ) ( not ( = ?auto_525279 ?auto_525286 ) ) ( not ( = ?auto_525279 ?auto_525287 ) ) ( not ( = ?auto_525279 ?auto_525288 ) ) ( not ( = ?auto_525279 ?auto_525289 ) ) ( not ( = ?auto_525280 ?auto_525281 ) ) ( not ( = ?auto_525280 ?auto_525282 ) ) ( not ( = ?auto_525280 ?auto_525283 ) ) ( not ( = ?auto_525280 ?auto_525284 ) ) ( not ( = ?auto_525280 ?auto_525285 ) ) ( not ( = ?auto_525280 ?auto_525286 ) ) ( not ( = ?auto_525280 ?auto_525287 ) ) ( not ( = ?auto_525280 ?auto_525288 ) ) ( not ( = ?auto_525280 ?auto_525289 ) ) ( not ( = ?auto_525281 ?auto_525282 ) ) ( not ( = ?auto_525281 ?auto_525283 ) ) ( not ( = ?auto_525281 ?auto_525284 ) ) ( not ( = ?auto_525281 ?auto_525285 ) ) ( not ( = ?auto_525281 ?auto_525286 ) ) ( not ( = ?auto_525281 ?auto_525287 ) ) ( not ( = ?auto_525281 ?auto_525288 ) ) ( not ( = ?auto_525281 ?auto_525289 ) ) ( not ( = ?auto_525282 ?auto_525283 ) ) ( not ( = ?auto_525282 ?auto_525284 ) ) ( not ( = ?auto_525282 ?auto_525285 ) ) ( not ( = ?auto_525282 ?auto_525286 ) ) ( not ( = ?auto_525282 ?auto_525287 ) ) ( not ( = ?auto_525282 ?auto_525288 ) ) ( not ( = ?auto_525282 ?auto_525289 ) ) ( not ( = ?auto_525283 ?auto_525284 ) ) ( not ( = ?auto_525283 ?auto_525285 ) ) ( not ( = ?auto_525283 ?auto_525286 ) ) ( not ( = ?auto_525283 ?auto_525287 ) ) ( not ( = ?auto_525283 ?auto_525288 ) ) ( not ( = ?auto_525283 ?auto_525289 ) ) ( not ( = ?auto_525284 ?auto_525285 ) ) ( not ( = ?auto_525284 ?auto_525286 ) ) ( not ( = ?auto_525284 ?auto_525287 ) ) ( not ( = ?auto_525284 ?auto_525288 ) ) ( not ( = ?auto_525284 ?auto_525289 ) ) ( not ( = ?auto_525285 ?auto_525286 ) ) ( not ( = ?auto_525285 ?auto_525287 ) ) ( not ( = ?auto_525285 ?auto_525288 ) ) ( not ( = ?auto_525285 ?auto_525289 ) ) ( not ( = ?auto_525286 ?auto_525287 ) ) ( not ( = ?auto_525286 ?auto_525288 ) ) ( not ( = ?auto_525286 ?auto_525289 ) ) ( not ( = ?auto_525287 ?auto_525288 ) ) ( not ( = ?auto_525287 ?auto_525289 ) ) ( not ( = ?auto_525288 ?auto_525289 ) ) ( ON ?auto_525287 ?auto_525288 ) ( ON ?auto_525286 ?auto_525287 ) ( ON ?auto_525285 ?auto_525286 ) ( ON ?auto_525284 ?auto_525285 ) ( ON ?auto_525283 ?auto_525284 ) ( ON ?auto_525282 ?auto_525283 ) ( CLEAR ?auto_525280 ) ( ON ?auto_525281 ?auto_525282 ) ( CLEAR ?auto_525281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_525275 ?auto_525276 ?auto_525277 ?auto_525278 ?auto_525279 ?auto_525280 ?auto_525281 )
      ( MAKE-14PILE ?auto_525275 ?auto_525276 ?auto_525277 ?auto_525278 ?auto_525279 ?auto_525280 ?auto_525281 ?auto_525282 ?auto_525283 ?auto_525284 ?auto_525285 ?auto_525286 ?auto_525287 ?auto_525288 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_525333 - BLOCK
      ?auto_525334 - BLOCK
      ?auto_525335 - BLOCK
      ?auto_525336 - BLOCK
      ?auto_525337 - BLOCK
      ?auto_525338 - BLOCK
      ?auto_525339 - BLOCK
      ?auto_525340 - BLOCK
      ?auto_525341 - BLOCK
      ?auto_525342 - BLOCK
      ?auto_525343 - BLOCK
      ?auto_525344 - BLOCK
      ?auto_525345 - BLOCK
      ?auto_525346 - BLOCK
    )
    :vars
    (
      ?auto_525347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525346 ?auto_525347 ) ( ON-TABLE ?auto_525333 ) ( ON ?auto_525334 ?auto_525333 ) ( ON ?auto_525335 ?auto_525334 ) ( ON ?auto_525336 ?auto_525335 ) ( ON ?auto_525337 ?auto_525336 ) ( not ( = ?auto_525333 ?auto_525334 ) ) ( not ( = ?auto_525333 ?auto_525335 ) ) ( not ( = ?auto_525333 ?auto_525336 ) ) ( not ( = ?auto_525333 ?auto_525337 ) ) ( not ( = ?auto_525333 ?auto_525338 ) ) ( not ( = ?auto_525333 ?auto_525339 ) ) ( not ( = ?auto_525333 ?auto_525340 ) ) ( not ( = ?auto_525333 ?auto_525341 ) ) ( not ( = ?auto_525333 ?auto_525342 ) ) ( not ( = ?auto_525333 ?auto_525343 ) ) ( not ( = ?auto_525333 ?auto_525344 ) ) ( not ( = ?auto_525333 ?auto_525345 ) ) ( not ( = ?auto_525333 ?auto_525346 ) ) ( not ( = ?auto_525333 ?auto_525347 ) ) ( not ( = ?auto_525334 ?auto_525335 ) ) ( not ( = ?auto_525334 ?auto_525336 ) ) ( not ( = ?auto_525334 ?auto_525337 ) ) ( not ( = ?auto_525334 ?auto_525338 ) ) ( not ( = ?auto_525334 ?auto_525339 ) ) ( not ( = ?auto_525334 ?auto_525340 ) ) ( not ( = ?auto_525334 ?auto_525341 ) ) ( not ( = ?auto_525334 ?auto_525342 ) ) ( not ( = ?auto_525334 ?auto_525343 ) ) ( not ( = ?auto_525334 ?auto_525344 ) ) ( not ( = ?auto_525334 ?auto_525345 ) ) ( not ( = ?auto_525334 ?auto_525346 ) ) ( not ( = ?auto_525334 ?auto_525347 ) ) ( not ( = ?auto_525335 ?auto_525336 ) ) ( not ( = ?auto_525335 ?auto_525337 ) ) ( not ( = ?auto_525335 ?auto_525338 ) ) ( not ( = ?auto_525335 ?auto_525339 ) ) ( not ( = ?auto_525335 ?auto_525340 ) ) ( not ( = ?auto_525335 ?auto_525341 ) ) ( not ( = ?auto_525335 ?auto_525342 ) ) ( not ( = ?auto_525335 ?auto_525343 ) ) ( not ( = ?auto_525335 ?auto_525344 ) ) ( not ( = ?auto_525335 ?auto_525345 ) ) ( not ( = ?auto_525335 ?auto_525346 ) ) ( not ( = ?auto_525335 ?auto_525347 ) ) ( not ( = ?auto_525336 ?auto_525337 ) ) ( not ( = ?auto_525336 ?auto_525338 ) ) ( not ( = ?auto_525336 ?auto_525339 ) ) ( not ( = ?auto_525336 ?auto_525340 ) ) ( not ( = ?auto_525336 ?auto_525341 ) ) ( not ( = ?auto_525336 ?auto_525342 ) ) ( not ( = ?auto_525336 ?auto_525343 ) ) ( not ( = ?auto_525336 ?auto_525344 ) ) ( not ( = ?auto_525336 ?auto_525345 ) ) ( not ( = ?auto_525336 ?auto_525346 ) ) ( not ( = ?auto_525336 ?auto_525347 ) ) ( not ( = ?auto_525337 ?auto_525338 ) ) ( not ( = ?auto_525337 ?auto_525339 ) ) ( not ( = ?auto_525337 ?auto_525340 ) ) ( not ( = ?auto_525337 ?auto_525341 ) ) ( not ( = ?auto_525337 ?auto_525342 ) ) ( not ( = ?auto_525337 ?auto_525343 ) ) ( not ( = ?auto_525337 ?auto_525344 ) ) ( not ( = ?auto_525337 ?auto_525345 ) ) ( not ( = ?auto_525337 ?auto_525346 ) ) ( not ( = ?auto_525337 ?auto_525347 ) ) ( not ( = ?auto_525338 ?auto_525339 ) ) ( not ( = ?auto_525338 ?auto_525340 ) ) ( not ( = ?auto_525338 ?auto_525341 ) ) ( not ( = ?auto_525338 ?auto_525342 ) ) ( not ( = ?auto_525338 ?auto_525343 ) ) ( not ( = ?auto_525338 ?auto_525344 ) ) ( not ( = ?auto_525338 ?auto_525345 ) ) ( not ( = ?auto_525338 ?auto_525346 ) ) ( not ( = ?auto_525338 ?auto_525347 ) ) ( not ( = ?auto_525339 ?auto_525340 ) ) ( not ( = ?auto_525339 ?auto_525341 ) ) ( not ( = ?auto_525339 ?auto_525342 ) ) ( not ( = ?auto_525339 ?auto_525343 ) ) ( not ( = ?auto_525339 ?auto_525344 ) ) ( not ( = ?auto_525339 ?auto_525345 ) ) ( not ( = ?auto_525339 ?auto_525346 ) ) ( not ( = ?auto_525339 ?auto_525347 ) ) ( not ( = ?auto_525340 ?auto_525341 ) ) ( not ( = ?auto_525340 ?auto_525342 ) ) ( not ( = ?auto_525340 ?auto_525343 ) ) ( not ( = ?auto_525340 ?auto_525344 ) ) ( not ( = ?auto_525340 ?auto_525345 ) ) ( not ( = ?auto_525340 ?auto_525346 ) ) ( not ( = ?auto_525340 ?auto_525347 ) ) ( not ( = ?auto_525341 ?auto_525342 ) ) ( not ( = ?auto_525341 ?auto_525343 ) ) ( not ( = ?auto_525341 ?auto_525344 ) ) ( not ( = ?auto_525341 ?auto_525345 ) ) ( not ( = ?auto_525341 ?auto_525346 ) ) ( not ( = ?auto_525341 ?auto_525347 ) ) ( not ( = ?auto_525342 ?auto_525343 ) ) ( not ( = ?auto_525342 ?auto_525344 ) ) ( not ( = ?auto_525342 ?auto_525345 ) ) ( not ( = ?auto_525342 ?auto_525346 ) ) ( not ( = ?auto_525342 ?auto_525347 ) ) ( not ( = ?auto_525343 ?auto_525344 ) ) ( not ( = ?auto_525343 ?auto_525345 ) ) ( not ( = ?auto_525343 ?auto_525346 ) ) ( not ( = ?auto_525343 ?auto_525347 ) ) ( not ( = ?auto_525344 ?auto_525345 ) ) ( not ( = ?auto_525344 ?auto_525346 ) ) ( not ( = ?auto_525344 ?auto_525347 ) ) ( not ( = ?auto_525345 ?auto_525346 ) ) ( not ( = ?auto_525345 ?auto_525347 ) ) ( not ( = ?auto_525346 ?auto_525347 ) ) ( ON ?auto_525345 ?auto_525346 ) ( ON ?auto_525344 ?auto_525345 ) ( ON ?auto_525343 ?auto_525344 ) ( ON ?auto_525342 ?auto_525343 ) ( ON ?auto_525341 ?auto_525342 ) ( ON ?auto_525340 ?auto_525341 ) ( ON ?auto_525339 ?auto_525340 ) ( CLEAR ?auto_525337 ) ( ON ?auto_525338 ?auto_525339 ) ( CLEAR ?auto_525338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_525333 ?auto_525334 ?auto_525335 ?auto_525336 ?auto_525337 ?auto_525338 )
      ( MAKE-14PILE ?auto_525333 ?auto_525334 ?auto_525335 ?auto_525336 ?auto_525337 ?auto_525338 ?auto_525339 ?auto_525340 ?auto_525341 ?auto_525342 ?auto_525343 ?auto_525344 ?auto_525345 ?auto_525346 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_525391 - BLOCK
      ?auto_525392 - BLOCK
      ?auto_525393 - BLOCK
      ?auto_525394 - BLOCK
      ?auto_525395 - BLOCK
      ?auto_525396 - BLOCK
      ?auto_525397 - BLOCK
      ?auto_525398 - BLOCK
      ?auto_525399 - BLOCK
      ?auto_525400 - BLOCK
      ?auto_525401 - BLOCK
      ?auto_525402 - BLOCK
      ?auto_525403 - BLOCK
      ?auto_525404 - BLOCK
    )
    :vars
    (
      ?auto_525405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525404 ?auto_525405 ) ( ON-TABLE ?auto_525391 ) ( ON ?auto_525392 ?auto_525391 ) ( ON ?auto_525393 ?auto_525392 ) ( ON ?auto_525394 ?auto_525393 ) ( not ( = ?auto_525391 ?auto_525392 ) ) ( not ( = ?auto_525391 ?auto_525393 ) ) ( not ( = ?auto_525391 ?auto_525394 ) ) ( not ( = ?auto_525391 ?auto_525395 ) ) ( not ( = ?auto_525391 ?auto_525396 ) ) ( not ( = ?auto_525391 ?auto_525397 ) ) ( not ( = ?auto_525391 ?auto_525398 ) ) ( not ( = ?auto_525391 ?auto_525399 ) ) ( not ( = ?auto_525391 ?auto_525400 ) ) ( not ( = ?auto_525391 ?auto_525401 ) ) ( not ( = ?auto_525391 ?auto_525402 ) ) ( not ( = ?auto_525391 ?auto_525403 ) ) ( not ( = ?auto_525391 ?auto_525404 ) ) ( not ( = ?auto_525391 ?auto_525405 ) ) ( not ( = ?auto_525392 ?auto_525393 ) ) ( not ( = ?auto_525392 ?auto_525394 ) ) ( not ( = ?auto_525392 ?auto_525395 ) ) ( not ( = ?auto_525392 ?auto_525396 ) ) ( not ( = ?auto_525392 ?auto_525397 ) ) ( not ( = ?auto_525392 ?auto_525398 ) ) ( not ( = ?auto_525392 ?auto_525399 ) ) ( not ( = ?auto_525392 ?auto_525400 ) ) ( not ( = ?auto_525392 ?auto_525401 ) ) ( not ( = ?auto_525392 ?auto_525402 ) ) ( not ( = ?auto_525392 ?auto_525403 ) ) ( not ( = ?auto_525392 ?auto_525404 ) ) ( not ( = ?auto_525392 ?auto_525405 ) ) ( not ( = ?auto_525393 ?auto_525394 ) ) ( not ( = ?auto_525393 ?auto_525395 ) ) ( not ( = ?auto_525393 ?auto_525396 ) ) ( not ( = ?auto_525393 ?auto_525397 ) ) ( not ( = ?auto_525393 ?auto_525398 ) ) ( not ( = ?auto_525393 ?auto_525399 ) ) ( not ( = ?auto_525393 ?auto_525400 ) ) ( not ( = ?auto_525393 ?auto_525401 ) ) ( not ( = ?auto_525393 ?auto_525402 ) ) ( not ( = ?auto_525393 ?auto_525403 ) ) ( not ( = ?auto_525393 ?auto_525404 ) ) ( not ( = ?auto_525393 ?auto_525405 ) ) ( not ( = ?auto_525394 ?auto_525395 ) ) ( not ( = ?auto_525394 ?auto_525396 ) ) ( not ( = ?auto_525394 ?auto_525397 ) ) ( not ( = ?auto_525394 ?auto_525398 ) ) ( not ( = ?auto_525394 ?auto_525399 ) ) ( not ( = ?auto_525394 ?auto_525400 ) ) ( not ( = ?auto_525394 ?auto_525401 ) ) ( not ( = ?auto_525394 ?auto_525402 ) ) ( not ( = ?auto_525394 ?auto_525403 ) ) ( not ( = ?auto_525394 ?auto_525404 ) ) ( not ( = ?auto_525394 ?auto_525405 ) ) ( not ( = ?auto_525395 ?auto_525396 ) ) ( not ( = ?auto_525395 ?auto_525397 ) ) ( not ( = ?auto_525395 ?auto_525398 ) ) ( not ( = ?auto_525395 ?auto_525399 ) ) ( not ( = ?auto_525395 ?auto_525400 ) ) ( not ( = ?auto_525395 ?auto_525401 ) ) ( not ( = ?auto_525395 ?auto_525402 ) ) ( not ( = ?auto_525395 ?auto_525403 ) ) ( not ( = ?auto_525395 ?auto_525404 ) ) ( not ( = ?auto_525395 ?auto_525405 ) ) ( not ( = ?auto_525396 ?auto_525397 ) ) ( not ( = ?auto_525396 ?auto_525398 ) ) ( not ( = ?auto_525396 ?auto_525399 ) ) ( not ( = ?auto_525396 ?auto_525400 ) ) ( not ( = ?auto_525396 ?auto_525401 ) ) ( not ( = ?auto_525396 ?auto_525402 ) ) ( not ( = ?auto_525396 ?auto_525403 ) ) ( not ( = ?auto_525396 ?auto_525404 ) ) ( not ( = ?auto_525396 ?auto_525405 ) ) ( not ( = ?auto_525397 ?auto_525398 ) ) ( not ( = ?auto_525397 ?auto_525399 ) ) ( not ( = ?auto_525397 ?auto_525400 ) ) ( not ( = ?auto_525397 ?auto_525401 ) ) ( not ( = ?auto_525397 ?auto_525402 ) ) ( not ( = ?auto_525397 ?auto_525403 ) ) ( not ( = ?auto_525397 ?auto_525404 ) ) ( not ( = ?auto_525397 ?auto_525405 ) ) ( not ( = ?auto_525398 ?auto_525399 ) ) ( not ( = ?auto_525398 ?auto_525400 ) ) ( not ( = ?auto_525398 ?auto_525401 ) ) ( not ( = ?auto_525398 ?auto_525402 ) ) ( not ( = ?auto_525398 ?auto_525403 ) ) ( not ( = ?auto_525398 ?auto_525404 ) ) ( not ( = ?auto_525398 ?auto_525405 ) ) ( not ( = ?auto_525399 ?auto_525400 ) ) ( not ( = ?auto_525399 ?auto_525401 ) ) ( not ( = ?auto_525399 ?auto_525402 ) ) ( not ( = ?auto_525399 ?auto_525403 ) ) ( not ( = ?auto_525399 ?auto_525404 ) ) ( not ( = ?auto_525399 ?auto_525405 ) ) ( not ( = ?auto_525400 ?auto_525401 ) ) ( not ( = ?auto_525400 ?auto_525402 ) ) ( not ( = ?auto_525400 ?auto_525403 ) ) ( not ( = ?auto_525400 ?auto_525404 ) ) ( not ( = ?auto_525400 ?auto_525405 ) ) ( not ( = ?auto_525401 ?auto_525402 ) ) ( not ( = ?auto_525401 ?auto_525403 ) ) ( not ( = ?auto_525401 ?auto_525404 ) ) ( not ( = ?auto_525401 ?auto_525405 ) ) ( not ( = ?auto_525402 ?auto_525403 ) ) ( not ( = ?auto_525402 ?auto_525404 ) ) ( not ( = ?auto_525402 ?auto_525405 ) ) ( not ( = ?auto_525403 ?auto_525404 ) ) ( not ( = ?auto_525403 ?auto_525405 ) ) ( not ( = ?auto_525404 ?auto_525405 ) ) ( ON ?auto_525403 ?auto_525404 ) ( ON ?auto_525402 ?auto_525403 ) ( ON ?auto_525401 ?auto_525402 ) ( ON ?auto_525400 ?auto_525401 ) ( ON ?auto_525399 ?auto_525400 ) ( ON ?auto_525398 ?auto_525399 ) ( ON ?auto_525397 ?auto_525398 ) ( ON ?auto_525396 ?auto_525397 ) ( CLEAR ?auto_525394 ) ( ON ?auto_525395 ?auto_525396 ) ( CLEAR ?auto_525395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_525391 ?auto_525392 ?auto_525393 ?auto_525394 ?auto_525395 )
      ( MAKE-14PILE ?auto_525391 ?auto_525392 ?auto_525393 ?auto_525394 ?auto_525395 ?auto_525396 ?auto_525397 ?auto_525398 ?auto_525399 ?auto_525400 ?auto_525401 ?auto_525402 ?auto_525403 ?auto_525404 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_525449 - BLOCK
      ?auto_525450 - BLOCK
      ?auto_525451 - BLOCK
      ?auto_525452 - BLOCK
      ?auto_525453 - BLOCK
      ?auto_525454 - BLOCK
      ?auto_525455 - BLOCK
      ?auto_525456 - BLOCK
      ?auto_525457 - BLOCK
      ?auto_525458 - BLOCK
      ?auto_525459 - BLOCK
      ?auto_525460 - BLOCK
      ?auto_525461 - BLOCK
      ?auto_525462 - BLOCK
    )
    :vars
    (
      ?auto_525463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525462 ?auto_525463 ) ( ON-TABLE ?auto_525449 ) ( ON ?auto_525450 ?auto_525449 ) ( ON ?auto_525451 ?auto_525450 ) ( not ( = ?auto_525449 ?auto_525450 ) ) ( not ( = ?auto_525449 ?auto_525451 ) ) ( not ( = ?auto_525449 ?auto_525452 ) ) ( not ( = ?auto_525449 ?auto_525453 ) ) ( not ( = ?auto_525449 ?auto_525454 ) ) ( not ( = ?auto_525449 ?auto_525455 ) ) ( not ( = ?auto_525449 ?auto_525456 ) ) ( not ( = ?auto_525449 ?auto_525457 ) ) ( not ( = ?auto_525449 ?auto_525458 ) ) ( not ( = ?auto_525449 ?auto_525459 ) ) ( not ( = ?auto_525449 ?auto_525460 ) ) ( not ( = ?auto_525449 ?auto_525461 ) ) ( not ( = ?auto_525449 ?auto_525462 ) ) ( not ( = ?auto_525449 ?auto_525463 ) ) ( not ( = ?auto_525450 ?auto_525451 ) ) ( not ( = ?auto_525450 ?auto_525452 ) ) ( not ( = ?auto_525450 ?auto_525453 ) ) ( not ( = ?auto_525450 ?auto_525454 ) ) ( not ( = ?auto_525450 ?auto_525455 ) ) ( not ( = ?auto_525450 ?auto_525456 ) ) ( not ( = ?auto_525450 ?auto_525457 ) ) ( not ( = ?auto_525450 ?auto_525458 ) ) ( not ( = ?auto_525450 ?auto_525459 ) ) ( not ( = ?auto_525450 ?auto_525460 ) ) ( not ( = ?auto_525450 ?auto_525461 ) ) ( not ( = ?auto_525450 ?auto_525462 ) ) ( not ( = ?auto_525450 ?auto_525463 ) ) ( not ( = ?auto_525451 ?auto_525452 ) ) ( not ( = ?auto_525451 ?auto_525453 ) ) ( not ( = ?auto_525451 ?auto_525454 ) ) ( not ( = ?auto_525451 ?auto_525455 ) ) ( not ( = ?auto_525451 ?auto_525456 ) ) ( not ( = ?auto_525451 ?auto_525457 ) ) ( not ( = ?auto_525451 ?auto_525458 ) ) ( not ( = ?auto_525451 ?auto_525459 ) ) ( not ( = ?auto_525451 ?auto_525460 ) ) ( not ( = ?auto_525451 ?auto_525461 ) ) ( not ( = ?auto_525451 ?auto_525462 ) ) ( not ( = ?auto_525451 ?auto_525463 ) ) ( not ( = ?auto_525452 ?auto_525453 ) ) ( not ( = ?auto_525452 ?auto_525454 ) ) ( not ( = ?auto_525452 ?auto_525455 ) ) ( not ( = ?auto_525452 ?auto_525456 ) ) ( not ( = ?auto_525452 ?auto_525457 ) ) ( not ( = ?auto_525452 ?auto_525458 ) ) ( not ( = ?auto_525452 ?auto_525459 ) ) ( not ( = ?auto_525452 ?auto_525460 ) ) ( not ( = ?auto_525452 ?auto_525461 ) ) ( not ( = ?auto_525452 ?auto_525462 ) ) ( not ( = ?auto_525452 ?auto_525463 ) ) ( not ( = ?auto_525453 ?auto_525454 ) ) ( not ( = ?auto_525453 ?auto_525455 ) ) ( not ( = ?auto_525453 ?auto_525456 ) ) ( not ( = ?auto_525453 ?auto_525457 ) ) ( not ( = ?auto_525453 ?auto_525458 ) ) ( not ( = ?auto_525453 ?auto_525459 ) ) ( not ( = ?auto_525453 ?auto_525460 ) ) ( not ( = ?auto_525453 ?auto_525461 ) ) ( not ( = ?auto_525453 ?auto_525462 ) ) ( not ( = ?auto_525453 ?auto_525463 ) ) ( not ( = ?auto_525454 ?auto_525455 ) ) ( not ( = ?auto_525454 ?auto_525456 ) ) ( not ( = ?auto_525454 ?auto_525457 ) ) ( not ( = ?auto_525454 ?auto_525458 ) ) ( not ( = ?auto_525454 ?auto_525459 ) ) ( not ( = ?auto_525454 ?auto_525460 ) ) ( not ( = ?auto_525454 ?auto_525461 ) ) ( not ( = ?auto_525454 ?auto_525462 ) ) ( not ( = ?auto_525454 ?auto_525463 ) ) ( not ( = ?auto_525455 ?auto_525456 ) ) ( not ( = ?auto_525455 ?auto_525457 ) ) ( not ( = ?auto_525455 ?auto_525458 ) ) ( not ( = ?auto_525455 ?auto_525459 ) ) ( not ( = ?auto_525455 ?auto_525460 ) ) ( not ( = ?auto_525455 ?auto_525461 ) ) ( not ( = ?auto_525455 ?auto_525462 ) ) ( not ( = ?auto_525455 ?auto_525463 ) ) ( not ( = ?auto_525456 ?auto_525457 ) ) ( not ( = ?auto_525456 ?auto_525458 ) ) ( not ( = ?auto_525456 ?auto_525459 ) ) ( not ( = ?auto_525456 ?auto_525460 ) ) ( not ( = ?auto_525456 ?auto_525461 ) ) ( not ( = ?auto_525456 ?auto_525462 ) ) ( not ( = ?auto_525456 ?auto_525463 ) ) ( not ( = ?auto_525457 ?auto_525458 ) ) ( not ( = ?auto_525457 ?auto_525459 ) ) ( not ( = ?auto_525457 ?auto_525460 ) ) ( not ( = ?auto_525457 ?auto_525461 ) ) ( not ( = ?auto_525457 ?auto_525462 ) ) ( not ( = ?auto_525457 ?auto_525463 ) ) ( not ( = ?auto_525458 ?auto_525459 ) ) ( not ( = ?auto_525458 ?auto_525460 ) ) ( not ( = ?auto_525458 ?auto_525461 ) ) ( not ( = ?auto_525458 ?auto_525462 ) ) ( not ( = ?auto_525458 ?auto_525463 ) ) ( not ( = ?auto_525459 ?auto_525460 ) ) ( not ( = ?auto_525459 ?auto_525461 ) ) ( not ( = ?auto_525459 ?auto_525462 ) ) ( not ( = ?auto_525459 ?auto_525463 ) ) ( not ( = ?auto_525460 ?auto_525461 ) ) ( not ( = ?auto_525460 ?auto_525462 ) ) ( not ( = ?auto_525460 ?auto_525463 ) ) ( not ( = ?auto_525461 ?auto_525462 ) ) ( not ( = ?auto_525461 ?auto_525463 ) ) ( not ( = ?auto_525462 ?auto_525463 ) ) ( ON ?auto_525461 ?auto_525462 ) ( ON ?auto_525460 ?auto_525461 ) ( ON ?auto_525459 ?auto_525460 ) ( ON ?auto_525458 ?auto_525459 ) ( ON ?auto_525457 ?auto_525458 ) ( ON ?auto_525456 ?auto_525457 ) ( ON ?auto_525455 ?auto_525456 ) ( ON ?auto_525454 ?auto_525455 ) ( ON ?auto_525453 ?auto_525454 ) ( CLEAR ?auto_525451 ) ( ON ?auto_525452 ?auto_525453 ) ( CLEAR ?auto_525452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_525449 ?auto_525450 ?auto_525451 ?auto_525452 )
      ( MAKE-14PILE ?auto_525449 ?auto_525450 ?auto_525451 ?auto_525452 ?auto_525453 ?auto_525454 ?auto_525455 ?auto_525456 ?auto_525457 ?auto_525458 ?auto_525459 ?auto_525460 ?auto_525461 ?auto_525462 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_525507 - BLOCK
      ?auto_525508 - BLOCK
      ?auto_525509 - BLOCK
      ?auto_525510 - BLOCK
      ?auto_525511 - BLOCK
      ?auto_525512 - BLOCK
      ?auto_525513 - BLOCK
      ?auto_525514 - BLOCK
      ?auto_525515 - BLOCK
      ?auto_525516 - BLOCK
      ?auto_525517 - BLOCK
      ?auto_525518 - BLOCK
      ?auto_525519 - BLOCK
      ?auto_525520 - BLOCK
    )
    :vars
    (
      ?auto_525521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525520 ?auto_525521 ) ( ON-TABLE ?auto_525507 ) ( ON ?auto_525508 ?auto_525507 ) ( not ( = ?auto_525507 ?auto_525508 ) ) ( not ( = ?auto_525507 ?auto_525509 ) ) ( not ( = ?auto_525507 ?auto_525510 ) ) ( not ( = ?auto_525507 ?auto_525511 ) ) ( not ( = ?auto_525507 ?auto_525512 ) ) ( not ( = ?auto_525507 ?auto_525513 ) ) ( not ( = ?auto_525507 ?auto_525514 ) ) ( not ( = ?auto_525507 ?auto_525515 ) ) ( not ( = ?auto_525507 ?auto_525516 ) ) ( not ( = ?auto_525507 ?auto_525517 ) ) ( not ( = ?auto_525507 ?auto_525518 ) ) ( not ( = ?auto_525507 ?auto_525519 ) ) ( not ( = ?auto_525507 ?auto_525520 ) ) ( not ( = ?auto_525507 ?auto_525521 ) ) ( not ( = ?auto_525508 ?auto_525509 ) ) ( not ( = ?auto_525508 ?auto_525510 ) ) ( not ( = ?auto_525508 ?auto_525511 ) ) ( not ( = ?auto_525508 ?auto_525512 ) ) ( not ( = ?auto_525508 ?auto_525513 ) ) ( not ( = ?auto_525508 ?auto_525514 ) ) ( not ( = ?auto_525508 ?auto_525515 ) ) ( not ( = ?auto_525508 ?auto_525516 ) ) ( not ( = ?auto_525508 ?auto_525517 ) ) ( not ( = ?auto_525508 ?auto_525518 ) ) ( not ( = ?auto_525508 ?auto_525519 ) ) ( not ( = ?auto_525508 ?auto_525520 ) ) ( not ( = ?auto_525508 ?auto_525521 ) ) ( not ( = ?auto_525509 ?auto_525510 ) ) ( not ( = ?auto_525509 ?auto_525511 ) ) ( not ( = ?auto_525509 ?auto_525512 ) ) ( not ( = ?auto_525509 ?auto_525513 ) ) ( not ( = ?auto_525509 ?auto_525514 ) ) ( not ( = ?auto_525509 ?auto_525515 ) ) ( not ( = ?auto_525509 ?auto_525516 ) ) ( not ( = ?auto_525509 ?auto_525517 ) ) ( not ( = ?auto_525509 ?auto_525518 ) ) ( not ( = ?auto_525509 ?auto_525519 ) ) ( not ( = ?auto_525509 ?auto_525520 ) ) ( not ( = ?auto_525509 ?auto_525521 ) ) ( not ( = ?auto_525510 ?auto_525511 ) ) ( not ( = ?auto_525510 ?auto_525512 ) ) ( not ( = ?auto_525510 ?auto_525513 ) ) ( not ( = ?auto_525510 ?auto_525514 ) ) ( not ( = ?auto_525510 ?auto_525515 ) ) ( not ( = ?auto_525510 ?auto_525516 ) ) ( not ( = ?auto_525510 ?auto_525517 ) ) ( not ( = ?auto_525510 ?auto_525518 ) ) ( not ( = ?auto_525510 ?auto_525519 ) ) ( not ( = ?auto_525510 ?auto_525520 ) ) ( not ( = ?auto_525510 ?auto_525521 ) ) ( not ( = ?auto_525511 ?auto_525512 ) ) ( not ( = ?auto_525511 ?auto_525513 ) ) ( not ( = ?auto_525511 ?auto_525514 ) ) ( not ( = ?auto_525511 ?auto_525515 ) ) ( not ( = ?auto_525511 ?auto_525516 ) ) ( not ( = ?auto_525511 ?auto_525517 ) ) ( not ( = ?auto_525511 ?auto_525518 ) ) ( not ( = ?auto_525511 ?auto_525519 ) ) ( not ( = ?auto_525511 ?auto_525520 ) ) ( not ( = ?auto_525511 ?auto_525521 ) ) ( not ( = ?auto_525512 ?auto_525513 ) ) ( not ( = ?auto_525512 ?auto_525514 ) ) ( not ( = ?auto_525512 ?auto_525515 ) ) ( not ( = ?auto_525512 ?auto_525516 ) ) ( not ( = ?auto_525512 ?auto_525517 ) ) ( not ( = ?auto_525512 ?auto_525518 ) ) ( not ( = ?auto_525512 ?auto_525519 ) ) ( not ( = ?auto_525512 ?auto_525520 ) ) ( not ( = ?auto_525512 ?auto_525521 ) ) ( not ( = ?auto_525513 ?auto_525514 ) ) ( not ( = ?auto_525513 ?auto_525515 ) ) ( not ( = ?auto_525513 ?auto_525516 ) ) ( not ( = ?auto_525513 ?auto_525517 ) ) ( not ( = ?auto_525513 ?auto_525518 ) ) ( not ( = ?auto_525513 ?auto_525519 ) ) ( not ( = ?auto_525513 ?auto_525520 ) ) ( not ( = ?auto_525513 ?auto_525521 ) ) ( not ( = ?auto_525514 ?auto_525515 ) ) ( not ( = ?auto_525514 ?auto_525516 ) ) ( not ( = ?auto_525514 ?auto_525517 ) ) ( not ( = ?auto_525514 ?auto_525518 ) ) ( not ( = ?auto_525514 ?auto_525519 ) ) ( not ( = ?auto_525514 ?auto_525520 ) ) ( not ( = ?auto_525514 ?auto_525521 ) ) ( not ( = ?auto_525515 ?auto_525516 ) ) ( not ( = ?auto_525515 ?auto_525517 ) ) ( not ( = ?auto_525515 ?auto_525518 ) ) ( not ( = ?auto_525515 ?auto_525519 ) ) ( not ( = ?auto_525515 ?auto_525520 ) ) ( not ( = ?auto_525515 ?auto_525521 ) ) ( not ( = ?auto_525516 ?auto_525517 ) ) ( not ( = ?auto_525516 ?auto_525518 ) ) ( not ( = ?auto_525516 ?auto_525519 ) ) ( not ( = ?auto_525516 ?auto_525520 ) ) ( not ( = ?auto_525516 ?auto_525521 ) ) ( not ( = ?auto_525517 ?auto_525518 ) ) ( not ( = ?auto_525517 ?auto_525519 ) ) ( not ( = ?auto_525517 ?auto_525520 ) ) ( not ( = ?auto_525517 ?auto_525521 ) ) ( not ( = ?auto_525518 ?auto_525519 ) ) ( not ( = ?auto_525518 ?auto_525520 ) ) ( not ( = ?auto_525518 ?auto_525521 ) ) ( not ( = ?auto_525519 ?auto_525520 ) ) ( not ( = ?auto_525519 ?auto_525521 ) ) ( not ( = ?auto_525520 ?auto_525521 ) ) ( ON ?auto_525519 ?auto_525520 ) ( ON ?auto_525518 ?auto_525519 ) ( ON ?auto_525517 ?auto_525518 ) ( ON ?auto_525516 ?auto_525517 ) ( ON ?auto_525515 ?auto_525516 ) ( ON ?auto_525514 ?auto_525515 ) ( ON ?auto_525513 ?auto_525514 ) ( ON ?auto_525512 ?auto_525513 ) ( ON ?auto_525511 ?auto_525512 ) ( ON ?auto_525510 ?auto_525511 ) ( CLEAR ?auto_525508 ) ( ON ?auto_525509 ?auto_525510 ) ( CLEAR ?auto_525509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_525507 ?auto_525508 ?auto_525509 )
      ( MAKE-14PILE ?auto_525507 ?auto_525508 ?auto_525509 ?auto_525510 ?auto_525511 ?auto_525512 ?auto_525513 ?auto_525514 ?auto_525515 ?auto_525516 ?auto_525517 ?auto_525518 ?auto_525519 ?auto_525520 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_525565 - BLOCK
      ?auto_525566 - BLOCK
      ?auto_525567 - BLOCK
      ?auto_525568 - BLOCK
      ?auto_525569 - BLOCK
      ?auto_525570 - BLOCK
      ?auto_525571 - BLOCK
      ?auto_525572 - BLOCK
      ?auto_525573 - BLOCK
      ?auto_525574 - BLOCK
      ?auto_525575 - BLOCK
      ?auto_525576 - BLOCK
      ?auto_525577 - BLOCK
      ?auto_525578 - BLOCK
    )
    :vars
    (
      ?auto_525579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525578 ?auto_525579 ) ( ON-TABLE ?auto_525565 ) ( not ( = ?auto_525565 ?auto_525566 ) ) ( not ( = ?auto_525565 ?auto_525567 ) ) ( not ( = ?auto_525565 ?auto_525568 ) ) ( not ( = ?auto_525565 ?auto_525569 ) ) ( not ( = ?auto_525565 ?auto_525570 ) ) ( not ( = ?auto_525565 ?auto_525571 ) ) ( not ( = ?auto_525565 ?auto_525572 ) ) ( not ( = ?auto_525565 ?auto_525573 ) ) ( not ( = ?auto_525565 ?auto_525574 ) ) ( not ( = ?auto_525565 ?auto_525575 ) ) ( not ( = ?auto_525565 ?auto_525576 ) ) ( not ( = ?auto_525565 ?auto_525577 ) ) ( not ( = ?auto_525565 ?auto_525578 ) ) ( not ( = ?auto_525565 ?auto_525579 ) ) ( not ( = ?auto_525566 ?auto_525567 ) ) ( not ( = ?auto_525566 ?auto_525568 ) ) ( not ( = ?auto_525566 ?auto_525569 ) ) ( not ( = ?auto_525566 ?auto_525570 ) ) ( not ( = ?auto_525566 ?auto_525571 ) ) ( not ( = ?auto_525566 ?auto_525572 ) ) ( not ( = ?auto_525566 ?auto_525573 ) ) ( not ( = ?auto_525566 ?auto_525574 ) ) ( not ( = ?auto_525566 ?auto_525575 ) ) ( not ( = ?auto_525566 ?auto_525576 ) ) ( not ( = ?auto_525566 ?auto_525577 ) ) ( not ( = ?auto_525566 ?auto_525578 ) ) ( not ( = ?auto_525566 ?auto_525579 ) ) ( not ( = ?auto_525567 ?auto_525568 ) ) ( not ( = ?auto_525567 ?auto_525569 ) ) ( not ( = ?auto_525567 ?auto_525570 ) ) ( not ( = ?auto_525567 ?auto_525571 ) ) ( not ( = ?auto_525567 ?auto_525572 ) ) ( not ( = ?auto_525567 ?auto_525573 ) ) ( not ( = ?auto_525567 ?auto_525574 ) ) ( not ( = ?auto_525567 ?auto_525575 ) ) ( not ( = ?auto_525567 ?auto_525576 ) ) ( not ( = ?auto_525567 ?auto_525577 ) ) ( not ( = ?auto_525567 ?auto_525578 ) ) ( not ( = ?auto_525567 ?auto_525579 ) ) ( not ( = ?auto_525568 ?auto_525569 ) ) ( not ( = ?auto_525568 ?auto_525570 ) ) ( not ( = ?auto_525568 ?auto_525571 ) ) ( not ( = ?auto_525568 ?auto_525572 ) ) ( not ( = ?auto_525568 ?auto_525573 ) ) ( not ( = ?auto_525568 ?auto_525574 ) ) ( not ( = ?auto_525568 ?auto_525575 ) ) ( not ( = ?auto_525568 ?auto_525576 ) ) ( not ( = ?auto_525568 ?auto_525577 ) ) ( not ( = ?auto_525568 ?auto_525578 ) ) ( not ( = ?auto_525568 ?auto_525579 ) ) ( not ( = ?auto_525569 ?auto_525570 ) ) ( not ( = ?auto_525569 ?auto_525571 ) ) ( not ( = ?auto_525569 ?auto_525572 ) ) ( not ( = ?auto_525569 ?auto_525573 ) ) ( not ( = ?auto_525569 ?auto_525574 ) ) ( not ( = ?auto_525569 ?auto_525575 ) ) ( not ( = ?auto_525569 ?auto_525576 ) ) ( not ( = ?auto_525569 ?auto_525577 ) ) ( not ( = ?auto_525569 ?auto_525578 ) ) ( not ( = ?auto_525569 ?auto_525579 ) ) ( not ( = ?auto_525570 ?auto_525571 ) ) ( not ( = ?auto_525570 ?auto_525572 ) ) ( not ( = ?auto_525570 ?auto_525573 ) ) ( not ( = ?auto_525570 ?auto_525574 ) ) ( not ( = ?auto_525570 ?auto_525575 ) ) ( not ( = ?auto_525570 ?auto_525576 ) ) ( not ( = ?auto_525570 ?auto_525577 ) ) ( not ( = ?auto_525570 ?auto_525578 ) ) ( not ( = ?auto_525570 ?auto_525579 ) ) ( not ( = ?auto_525571 ?auto_525572 ) ) ( not ( = ?auto_525571 ?auto_525573 ) ) ( not ( = ?auto_525571 ?auto_525574 ) ) ( not ( = ?auto_525571 ?auto_525575 ) ) ( not ( = ?auto_525571 ?auto_525576 ) ) ( not ( = ?auto_525571 ?auto_525577 ) ) ( not ( = ?auto_525571 ?auto_525578 ) ) ( not ( = ?auto_525571 ?auto_525579 ) ) ( not ( = ?auto_525572 ?auto_525573 ) ) ( not ( = ?auto_525572 ?auto_525574 ) ) ( not ( = ?auto_525572 ?auto_525575 ) ) ( not ( = ?auto_525572 ?auto_525576 ) ) ( not ( = ?auto_525572 ?auto_525577 ) ) ( not ( = ?auto_525572 ?auto_525578 ) ) ( not ( = ?auto_525572 ?auto_525579 ) ) ( not ( = ?auto_525573 ?auto_525574 ) ) ( not ( = ?auto_525573 ?auto_525575 ) ) ( not ( = ?auto_525573 ?auto_525576 ) ) ( not ( = ?auto_525573 ?auto_525577 ) ) ( not ( = ?auto_525573 ?auto_525578 ) ) ( not ( = ?auto_525573 ?auto_525579 ) ) ( not ( = ?auto_525574 ?auto_525575 ) ) ( not ( = ?auto_525574 ?auto_525576 ) ) ( not ( = ?auto_525574 ?auto_525577 ) ) ( not ( = ?auto_525574 ?auto_525578 ) ) ( not ( = ?auto_525574 ?auto_525579 ) ) ( not ( = ?auto_525575 ?auto_525576 ) ) ( not ( = ?auto_525575 ?auto_525577 ) ) ( not ( = ?auto_525575 ?auto_525578 ) ) ( not ( = ?auto_525575 ?auto_525579 ) ) ( not ( = ?auto_525576 ?auto_525577 ) ) ( not ( = ?auto_525576 ?auto_525578 ) ) ( not ( = ?auto_525576 ?auto_525579 ) ) ( not ( = ?auto_525577 ?auto_525578 ) ) ( not ( = ?auto_525577 ?auto_525579 ) ) ( not ( = ?auto_525578 ?auto_525579 ) ) ( ON ?auto_525577 ?auto_525578 ) ( ON ?auto_525576 ?auto_525577 ) ( ON ?auto_525575 ?auto_525576 ) ( ON ?auto_525574 ?auto_525575 ) ( ON ?auto_525573 ?auto_525574 ) ( ON ?auto_525572 ?auto_525573 ) ( ON ?auto_525571 ?auto_525572 ) ( ON ?auto_525570 ?auto_525571 ) ( ON ?auto_525569 ?auto_525570 ) ( ON ?auto_525568 ?auto_525569 ) ( ON ?auto_525567 ?auto_525568 ) ( CLEAR ?auto_525565 ) ( ON ?auto_525566 ?auto_525567 ) ( CLEAR ?auto_525566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_525565 ?auto_525566 )
      ( MAKE-14PILE ?auto_525565 ?auto_525566 ?auto_525567 ?auto_525568 ?auto_525569 ?auto_525570 ?auto_525571 ?auto_525572 ?auto_525573 ?auto_525574 ?auto_525575 ?auto_525576 ?auto_525577 ?auto_525578 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_525623 - BLOCK
      ?auto_525624 - BLOCK
      ?auto_525625 - BLOCK
      ?auto_525626 - BLOCK
      ?auto_525627 - BLOCK
      ?auto_525628 - BLOCK
      ?auto_525629 - BLOCK
      ?auto_525630 - BLOCK
      ?auto_525631 - BLOCK
      ?auto_525632 - BLOCK
      ?auto_525633 - BLOCK
      ?auto_525634 - BLOCK
      ?auto_525635 - BLOCK
      ?auto_525636 - BLOCK
    )
    :vars
    (
      ?auto_525637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525636 ?auto_525637 ) ( not ( = ?auto_525623 ?auto_525624 ) ) ( not ( = ?auto_525623 ?auto_525625 ) ) ( not ( = ?auto_525623 ?auto_525626 ) ) ( not ( = ?auto_525623 ?auto_525627 ) ) ( not ( = ?auto_525623 ?auto_525628 ) ) ( not ( = ?auto_525623 ?auto_525629 ) ) ( not ( = ?auto_525623 ?auto_525630 ) ) ( not ( = ?auto_525623 ?auto_525631 ) ) ( not ( = ?auto_525623 ?auto_525632 ) ) ( not ( = ?auto_525623 ?auto_525633 ) ) ( not ( = ?auto_525623 ?auto_525634 ) ) ( not ( = ?auto_525623 ?auto_525635 ) ) ( not ( = ?auto_525623 ?auto_525636 ) ) ( not ( = ?auto_525623 ?auto_525637 ) ) ( not ( = ?auto_525624 ?auto_525625 ) ) ( not ( = ?auto_525624 ?auto_525626 ) ) ( not ( = ?auto_525624 ?auto_525627 ) ) ( not ( = ?auto_525624 ?auto_525628 ) ) ( not ( = ?auto_525624 ?auto_525629 ) ) ( not ( = ?auto_525624 ?auto_525630 ) ) ( not ( = ?auto_525624 ?auto_525631 ) ) ( not ( = ?auto_525624 ?auto_525632 ) ) ( not ( = ?auto_525624 ?auto_525633 ) ) ( not ( = ?auto_525624 ?auto_525634 ) ) ( not ( = ?auto_525624 ?auto_525635 ) ) ( not ( = ?auto_525624 ?auto_525636 ) ) ( not ( = ?auto_525624 ?auto_525637 ) ) ( not ( = ?auto_525625 ?auto_525626 ) ) ( not ( = ?auto_525625 ?auto_525627 ) ) ( not ( = ?auto_525625 ?auto_525628 ) ) ( not ( = ?auto_525625 ?auto_525629 ) ) ( not ( = ?auto_525625 ?auto_525630 ) ) ( not ( = ?auto_525625 ?auto_525631 ) ) ( not ( = ?auto_525625 ?auto_525632 ) ) ( not ( = ?auto_525625 ?auto_525633 ) ) ( not ( = ?auto_525625 ?auto_525634 ) ) ( not ( = ?auto_525625 ?auto_525635 ) ) ( not ( = ?auto_525625 ?auto_525636 ) ) ( not ( = ?auto_525625 ?auto_525637 ) ) ( not ( = ?auto_525626 ?auto_525627 ) ) ( not ( = ?auto_525626 ?auto_525628 ) ) ( not ( = ?auto_525626 ?auto_525629 ) ) ( not ( = ?auto_525626 ?auto_525630 ) ) ( not ( = ?auto_525626 ?auto_525631 ) ) ( not ( = ?auto_525626 ?auto_525632 ) ) ( not ( = ?auto_525626 ?auto_525633 ) ) ( not ( = ?auto_525626 ?auto_525634 ) ) ( not ( = ?auto_525626 ?auto_525635 ) ) ( not ( = ?auto_525626 ?auto_525636 ) ) ( not ( = ?auto_525626 ?auto_525637 ) ) ( not ( = ?auto_525627 ?auto_525628 ) ) ( not ( = ?auto_525627 ?auto_525629 ) ) ( not ( = ?auto_525627 ?auto_525630 ) ) ( not ( = ?auto_525627 ?auto_525631 ) ) ( not ( = ?auto_525627 ?auto_525632 ) ) ( not ( = ?auto_525627 ?auto_525633 ) ) ( not ( = ?auto_525627 ?auto_525634 ) ) ( not ( = ?auto_525627 ?auto_525635 ) ) ( not ( = ?auto_525627 ?auto_525636 ) ) ( not ( = ?auto_525627 ?auto_525637 ) ) ( not ( = ?auto_525628 ?auto_525629 ) ) ( not ( = ?auto_525628 ?auto_525630 ) ) ( not ( = ?auto_525628 ?auto_525631 ) ) ( not ( = ?auto_525628 ?auto_525632 ) ) ( not ( = ?auto_525628 ?auto_525633 ) ) ( not ( = ?auto_525628 ?auto_525634 ) ) ( not ( = ?auto_525628 ?auto_525635 ) ) ( not ( = ?auto_525628 ?auto_525636 ) ) ( not ( = ?auto_525628 ?auto_525637 ) ) ( not ( = ?auto_525629 ?auto_525630 ) ) ( not ( = ?auto_525629 ?auto_525631 ) ) ( not ( = ?auto_525629 ?auto_525632 ) ) ( not ( = ?auto_525629 ?auto_525633 ) ) ( not ( = ?auto_525629 ?auto_525634 ) ) ( not ( = ?auto_525629 ?auto_525635 ) ) ( not ( = ?auto_525629 ?auto_525636 ) ) ( not ( = ?auto_525629 ?auto_525637 ) ) ( not ( = ?auto_525630 ?auto_525631 ) ) ( not ( = ?auto_525630 ?auto_525632 ) ) ( not ( = ?auto_525630 ?auto_525633 ) ) ( not ( = ?auto_525630 ?auto_525634 ) ) ( not ( = ?auto_525630 ?auto_525635 ) ) ( not ( = ?auto_525630 ?auto_525636 ) ) ( not ( = ?auto_525630 ?auto_525637 ) ) ( not ( = ?auto_525631 ?auto_525632 ) ) ( not ( = ?auto_525631 ?auto_525633 ) ) ( not ( = ?auto_525631 ?auto_525634 ) ) ( not ( = ?auto_525631 ?auto_525635 ) ) ( not ( = ?auto_525631 ?auto_525636 ) ) ( not ( = ?auto_525631 ?auto_525637 ) ) ( not ( = ?auto_525632 ?auto_525633 ) ) ( not ( = ?auto_525632 ?auto_525634 ) ) ( not ( = ?auto_525632 ?auto_525635 ) ) ( not ( = ?auto_525632 ?auto_525636 ) ) ( not ( = ?auto_525632 ?auto_525637 ) ) ( not ( = ?auto_525633 ?auto_525634 ) ) ( not ( = ?auto_525633 ?auto_525635 ) ) ( not ( = ?auto_525633 ?auto_525636 ) ) ( not ( = ?auto_525633 ?auto_525637 ) ) ( not ( = ?auto_525634 ?auto_525635 ) ) ( not ( = ?auto_525634 ?auto_525636 ) ) ( not ( = ?auto_525634 ?auto_525637 ) ) ( not ( = ?auto_525635 ?auto_525636 ) ) ( not ( = ?auto_525635 ?auto_525637 ) ) ( not ( = ?auto_525636 ?auto_525637 ) ) ( ON ?auto_525635 ?auto_525636 ) ( ON ?auto_525634 ?auto_525635 ) ( ON ?auto_525633 ?auto_525634 ) ( ON ?auto_525632 ?auto_525633 ) ( ON ?auto_525631 ?auto_525632 ) ( ON ?auto_525630 ?auto_525631 ) ( ON ?auto_525629 ?auto_525630 ) ( ON ?auto_525628 ?auto_525629 ) ( ON ?auto_525627 ?auto_525628 ) ( ON ?auto_525626 ?auto_525627 ) ( ON ?auto_525625 ?auto_525626 ) ( ON ?auto_525624 ?auto_525625 ) ( ON ?auto_525623 ?auto_525624 ) ( CLEAR ?auto_525623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_525623 )
      ( MAKE-14PILE ?auto_525623 ?auto_525624 ?auto_525625 ?auto_525626 ?auto_525627 ?auto_525628 ?auto_525629 ?auto_525630 ?auto_525631 ?auto_525632 ?auto_525633 ?auto_525634 ?auto_525635 ?auto_525636 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_525682 - BLOCK
      ?auto_525683 - BLOCK
      ?auto_525684 - BLOCK
      ?auto_525685 - BLOCK
      ?auto_525686 - BLOCK
      ?auto_525687 - BLOCK
      ?auto_525688 - BLOCK
      ?auto_525689 - BLOCK
      ?auto_525690 - BLOCK
      ?auto_525691 - BLOCK
      ?auto_525692 - BLOCK
      ?auto_525693 - BLOCK
      ?auto_525694 - BLOCK
      ?auto_525695 - BLOCK
      ?auto_525696 - BLOCK
    )
    :vars
    (
      ?auto_525697 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_525695 ) ( ON ?auto_525696 ?auto_525697 ) ( CLEAR ?auto_525696 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_525682 ) ( ON ?auto_525683 ?auto_525682 ) ( ON ?auto_525684 ?auto_525683 ) ( ON ?auto_525685 ?auto_525684 ) ( ON ?auto_525686 ?auto_525685 ) ( ON ?auto_525687 ?auto_525686 ) ( ON ?auto_525688 ?auto_525687 ) ( ON ?auto_525689 ?auto_525688 ) ( ON ?auto_525690 ?auto_525689 ) ( ON ?auto_525691 ?auto_525690 ) ( ON ?auto_525692 ?auto_525691 ) ( ON ?auto_525693 ?auto_525692 ) ( ON ?auto_525694 ?auto_525693 ) ( ON ?auto_525695 ?auto_525694 ) ( not ( = ?auto_525682 ?auto_525683 ) ) ( not ( = ?auto_525682 ?auto_525684 ) ) ( not ( = ?auto_525682 ?auto_525685 ) ) ( not ( = ?auto_525682 ?auto_525686 ) ) ( not ( = ?auto_525682 ?auto_525687 ) ) ( not ( = ?auto_525682 ?auto_525688 ) ) ( not ( = ?auto_525682 ?auto_525689 ) ) ( not ( = ?auto_525682 ?auto_525690 ) ) ( not ( = ?auto_525682 ?auto_525691 ) ) ( not ( = ?auto_525682 ?auto_525692 ) ) ( not ( = ?auto_525682 ?auto_525693 ) ) ( not ( = ?auto_525682 ?auto_525694 ) ) ( not ( = ?auto_525682 ?auto_525695 ) ) ( not ( = ?auto_525682 ?auto_525696 ) ) ( not ( = ?auto_525682 ?auto_525697 ) ) ( not ( = ?auto_525683 ?auto_525684 ) ) ( not ( = ?auto_525683 ?auto_525685 ) ) ( not ( = ?auto_525683 ?auto_525686 ) ) ( not ( = ?auto_525683 ?auto_525687 ) ) ( not ( = ?auto_525683 ?auto_525688 ) ) ( not ( = ?auto_525683 ?auto_525689 ) ) ( not ( = ?auto_525683 ?auto_525690 ) ) ( not ( = ?auto_525683 ?auto_525691 ) ) ( not ( = ?auto_525683 ?auto_525692 ) ) ( not ( = ?auto_525683 ?auto_525693 ) ) ( not ( = ?auto_525683 ?auto_525694 ) ) ( not ( = ?auto_525683 ?auto_525695 ) ) ( not ( = ?auto_525683 ?auto_525696 ) ) ( not ( = ?auto_525683 ?auto_525697 ) ) ( not ( = ?auto_525684 ?auto_525685 ) ) ( not ( = ?auto_525684 ?auto_525686 ) ) ( not ( = ?auto_525684 ?auto_525687 ) ) ( not ( = ?auto_525684 ?auto_525688 ) ) ( not ( = ?auto_525684 ?auto_525689 ) ) ( not ( = ?auto_525684 ?auto_525690 ) ) ( not ( = ?auto_525684 ?auto_525691 ) ) ( not ( = ?auto_525684 ?auto_525692 ) ) ( not ( = ?auto_525684 ?auto_525693 ) ) ( not ( = ?auto_525684 ?auto_525694 ) ) ( not ( = ?auto_525684 ?auto_525695 ) ) ( not ( = ?auto_525684 ?auto_525696 ) ) ( not ( = ?auto_525684 ?auto_525697 ) ) ( not ( = ?auto_525685 ?auto_525686 ) ) ( not ( = ?auto_525685 ?auto_525687 ) ) ( not ( = ?auto_525685 ?auto_525688 ) ) ( not ( = ?auto_525685 ?auto_525689 ) ) ( not ( = ?auto_525685 ?auto_525690 ) ) ( not ( = ?auto_525685 ?auto_525691 ) ) ( not ( = ?auto_525685 ?auto_525692 ) ) ( not ( = ?auto_525685 ?auto_525693 ) ) ( not ( = ?auto_525685 ?auto_525694 ) ) ( not ( = ?auto_525685 ?auto_525695 ) ) ( not ( = ?auto_525685 ?auto_525696 ) ) ( not ( = ?auto_525685 ?auto_525697 ) ) ( not ( = ?auto_525686 ?auto_525687 ) ) ( not ( = ?auto_525686 ?auto_525688 ) ) ( not ( = ?auto_525686 ?auto_525689 ) ) ( not ( = ?auto_525686 ?auto_525690 ) ) ( not ( = ?auto_525686 ?auto_525691 ) ) ( not ( = ?auto_525686 ?auto_525692 ) ) ( not ( = ?auto_525686 ?auto_525693 ) ) ( not ( = ?auto_525686 ?auto_525694 ) ) ( not ( = ?auto_525686 ?auto_525695 ) ) ( not ( = ?auto_525686 ?auto_525696 ) ) ( not ( = ?auto_525686 ?auto_525697 ) ) ( not ( = ?auto_525687 ?auto_525688 ) ) ( not ( = ?auto_525687 ?auto_525689 ) ) ( not ( = ?auto_525687 ?auto_525690 ) ) ( not ( = ?auto_525687 ?auto_525691 ) ) ( not ( = ?auto_525687 ?auto_525692 ) ) ( not ( = ?auto_525687 ?auto_525693 ) ) ( not ( = ?auto_525687 ?auto_525694 ) ) ( not ( = ?auto_525687 ?auto_525695 ) ) ( not ( = ?auto_525687 ?auto_525696 ) ) ( not ( = ?auto_525687 ?auto_525697 ) ) ( not ( = ?auto_525688 ?auto_525689 ) ) ( not ( = ?auto_525688 ?auto_525690 ) ) ( not ( = ?auto_525688 ?auto_525691 ) ) ( not ( = ?auto_525688 ?auto_525692 ) ) ( not ( = ?auto_525688 ?auto_525693 ) ) ( not ( = ?auto_525688 ?auto_525694 ) ) ( not ( = ?auto_525688 ?auto_525695 ) ) ( not ( = ?auto_525688 ?auto_525696 ) ) ( not ( = ?auto_525688 ?auto_525697 ) ) ( not ( = ?auto_525689 ?auto_525690 ) ) ( not ( = ?auto_525689 ?auto_525691 ) ) ( not ( = ?auto_525689 ?auto_525692 ) ) ( not ( = ?auto_525689 ?auto_525693 ) ) ( not ( = ?auto_525689 ?auto_525694 ) ) ( not ( = ?auto_525689 ?auto_525695 ) ) ( not ( = ?auto_525689 ?auto_525696 ) ) ( not ( = ?auto_525689 ?auto_525697 ) ) ( not ( = ?auto_525690 ?auto_525691 ) ) ( not ( = ?auto_525690 ?auto_525692 ) ) ( not ( = ?auto_525690 ?auto_525693 ) ) ( not ( = ?auto_525690 ?auto_525694 ) ) ( not ( = ?auto_525690 ?auto_525695 ) ) ( not ( = ?auto_525690 ?auto_525696 ) ) ( not ( = ?auto_525690 ?auto_525697 ) ) ( not ( = ?auto_525691 ?auto_525692 ) ) ( not ( = ?auto_525691 ?auto_525693 ) ) ( not ( = ?auto_525691 ?auto_525694 ) ) ( not ( = ?auto_525691 ?auto_525695 ) ) ( not ( = ?auto_525691 ?auto_525696 ) ) ( not ( = ?auto_525691 ?auto_525697 ) ) ( not ( = ?auto_525692 ?auto_525693 ) ) ( not ( = ?auto_525692 ?auto_525694 ) ) ( not ( = ?auto_525692 ?auto_525695 ) ) ( not ( = ?auto_525692 ?auto_525696 ) ) ( not ( = ?auto_525692 ?auto_525697 ) ) ( not ( = ?auto_525693 ?auto_525694 ) ) ( not ( = ?auto_525693 ?auto_525695 ) ) ( not ( = ?auto_525693 ?auto_525696 ) ) ( not ( = ?auto_525693 ?auto_525697 ) ) ( not ( = ?auto_525694 ?auto_525695 ) ) ( not ( = ?auto_525694 ?auto_525696 ) ) ( not ( = ?auto_525694 ?auto_525697 ) ) ( not ( = ?auto_525695 ?auto_525696 ) ) ( not ( = ?auto_525695 ?auto_525697 ) ) ( not ( = ?auto_525696 ?auto_525697 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_525696 ?auto_525697 )
      ( !STACK ?auto_525696 ?auto_525695 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_525744 - BLOCK
      ?auto_525745 - BLOCK
      ?auto_525746 - BLOCK
      ?auto_525747 - BLOCK
      ?auto_525748 - BLOCK
      ?auto_525749 - BLOCK
      ?auto_525750 - BLOCK
      ?auto_525751 - BLOCK
      ?auto_525752 - BLOCK
      ?auto_525753 - BLOCK
      ?auto_525754 - BLOCK
      ?auto_525755 - BLOCK
      ?auto_525756 - BLOCK
      ?auto_525757 - BLOCK
      ?auto_525758 - BLOCK
    )
    :vars
    (
      ?auto_525759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525758 ?auto_525759 ) ( ON-TABLE ?auto_525744 ) ( ON ?auto_525745 ?auto_525744 ) ( ON ?auto_525746 ?auto_525745 ) ( ON ?auto_525747 ?auto_525746 ) ( ON ?auto_525748 ?auto_525747 ) ( ON ?auto_525749 ?auto_525748 ) ( ON ?auto_525750 ?auto_525749 ) ( ON ?auto_525751 ?auto_525750 ) ( ON ?auto_525752 ?auto_525751 ) ( ON ?auto_525753 ?auto_525752 ) ( ON ?auto_525754 ?auto_525753 ) ( ON ?auto_525755 ?auto_525754 ) ( ON ?auto_525756 ?auto_525755 ) ( not ( = ?auto_525744 ?auto_525745 ) ) ( not ( = ?auto_525744 ?auto_525746 ) ) ( not ( = ?auto_525744 ?auto_525747 ) ) ( not ( = ?auto_525744 ?auto_525748 ) ) ( not ( = ?auto_525744 ?auto_525749 ) ) ( not ( = ?auto_525744 ?auto_525750 ) ) ( not ( = ?auto_525744 ?auto_525751 ) ) ( not ( = ?auto_525744 ?auto_525752 ) ) ( not ( = ?auto_525744 ?auto_525753 ) ) ( not ( = ?auto_525744 ?auto_525754 ) ) ( not ( = ?auto_525744 ?auto_525755 ) ) ( not ( = ?auto_525744 ?auto_525756 ) ) ( not ( = ?auto_525744 ?auto_525757 ) ) ( not ( = ?auto_525744 ?auto_525758 ) ) ( not ( = ?auto_525744 ?auto_525759 ) ) ( not ( = ?auto_525745 ?auto_525746 ) ) ( not ( = ?auto_525745 ?auto_525747 ) ) ( not ( = ?auto_525745 ?auto_525748 ) ) ( not ( = ?auto_525745 ?auto_525749 ) ) ( not ( = ?auto_525745 ?auto_525750 ) ) ( not ( = ?auto_525745 ?auto_525751 ) ) ( not ( = ?auto_525745 ?auto_525752 ) ) ( not ( = ?auto_525745 ?auto_525753 ) ) ( not ( = ?auto_525745 ?auto_525754 ) ) ( not ( = ?auto_525745 ?auto_525755 ) ) ( not ( = ?auto_525745 ?auto_525756 ) ) ( not ( = ?auto_525745 ?auto_525757 ) ) ( not ( = ?auto_525745 ?auto_525758 ) ) ( not ( = ?auto_525745 ?auto_525759 ) ) ( not ( = ?auto_525746 ?auto_525747 ) ) ( not ( = ?auto_525746 ?auto_525748 ) ) ( not ( = ?auto_525746 ?auto_525749 ) ) ( not ( = ?auto_525746 ?auto_525750 ) ) ( not ( = ?auto_525746 ?auto_525751 ) ) ( not ( = ?auto_525746 ?auto_525752 ) ) ( not ( = ?auto_525746 ?auto_525753 ) ) ( not ( = ?auto_525746 ?auto_525754 ) ) ( not ( = ?auto_525746 ?auto_525755 ) ) ( not ( = ?auto_525746 ?auto_525756 ) ) ( not ( = ?auto_525746 ?auto_525757 ) ) ( not ( = ?auto_525746 ?auto_525758 ) ) ( not ( = ?auto_525746 ?auto_525759 ) ) ( not ( = ?auto_525747 ?auto_525748 ) ) ( not ( = ?auto_525747 ?auto_525749 ) ) ( not ( = ?auto_525747 ?auto_525750 ) ) ( not ( = ?auto_525747 ?auto_525751 ) ) ( not ( = ?auto_525747 ?auto_525752 ) ) ( not ( = ?auto_525747 ?auto_525753 ) ) ( not ( = ?auto_525747 ?auto_525754 ) ) ( not ( = ?auto_525747 ?auto_525755 ) ) ( not ( = ?auto_525747 ?auto_525756 ) ) ( not ( = ?auto_525747 ?auto_525757 ) ) ( not ( = ?auto_525747 ?auto_525758 ) ) ( not ( = ?auto_525747 ?auto_525759 ) ) ( not ( = ?auto_525748 ?auto_525749 ) ) ( not ( = ?auto_525748 ?auto_525750 ) ) ( not ( = ?auto_525748 ?auto_525751 ) ) ( not ( = ?auto_525748 ?auto_525752 ) ) ( not ( = ?auto_525748 ?auto_525753 ) ) ( not ( = ?auto_525748 ?auto_525754 ) ) ( not ( = ?auto_525748 ?auto_525755 ) ) ( not ( = ?auto_525748 ?auto_525756 ) ) ( not ( = ?auto_525748 ?auto_525757 ) ) ( not ( = ?auto_525748 ?auto_525758 ) ) ( not ( = ?auto_525748 ?auto_525759 ) ) ( not ( = ?auto_525749 ?auto_525750 ) ) ( not ( = ?auto_525749 ?auto_525751 ) ) ( not ( = ?auto_525749 ?auto_525752 ) ) ( not ( = ?auto_525749 ?auto_525753 ) ) ( not ( = ?auto_525749 ?auto_525754 ) ) ( not ( = ?auto_525749 ?auto_525755 ) ) ( not ( = ?auto_525749 ?auto_525756 ) ) ( not ( = ?auto_525749 ?auto_525757 ) ) ( not ( = ?auto_525749 ?auto_525758 ) ) ( not ( = ?auto_525749 ?auto_525759 ) ) ( not ( = ?auto_525750 ?auto_525751 ) ) ( not ( = ?auto_525750 ?auto_525752 ) ) ( not ( = ?auto_525750 ?auto_525753 ) ) ( not ( = ?auto_525750 ?auto_525754 ) ) ( not ( = ?auto_525750 ?auto_525755 ) ) ( not ( = ?auto_525750 ?auto_525756 ) ) ( not ( = ?auto_525750 ?auto_525757 ) ) ( not ( = ?auto_525750 ?auto_525758 ) ) ( not ( = ?auto_525750 ?auto_525759 ) ) ( not ( = ?auto_525751 ?auto_525752 ) ) ( not ( = ?auto_525751 ?auto_525753 ) ) ( not ( = ?auto_525751 ?auto_525754 ) ) ( not ( = ?auto_525751 ?auto_525755 ) ) ( not ( = ?auto_525751 ?auto_525756 ) ) ( not ( = ?auto_525751 ?auto_525757 ) ) ( not ( = ?auto_525751 ?auto_525758 ) ) ( not ( = ?auto_525751 ?auto_525759 ) ) ( not ( = ?auto_525752 ?auto_525753 ) ) ( not ( = ?auto_525752 ?auto_525754 ) ) ( not ( = ?auto_525752 ?auto_525755 ) ) ( not ( = ?auto_525752 ?auto_525756 ) ) ( not ( = ?auto_525752 ?auto_525757 ) ) ( not ( = ?auto_525752 ?auto_525758 ) ) ( not ( = ?auto_525752 ?auto_525759 ) ) ( not ( = ?auto_525753 ?auto_525754 ) ) ( not ( = ?auto_525753 ?auto_525755 ) ) ( not ( = ?auto_525753 ?auto_525756 ) ) ( not ( = ?auto_525753 ?auto_525757 ) ) ( not ( = ?auto_525753 ?auto_525758 ) ) ( not ( = ?auto_525753 ?auto_525759 ) ) ( not ( = ?auto_525754 ?auto_525755 ) ) ( not ( = ?auto_525754 ?auto_525756 ) ) ( not ( = ?auto_525754 ?auto_525757 ) ) ( not ( = ?auto_525754 ?auto_525758 ) ) ( not ( = ?auto_525754 ?auto_525759 ) ) ( not ( = ?auto_525755 ?auto_525756 ) ) ( not ( = ?auto_525755 ?auto_525757 ) ) ( not ( = ?auto_525755 ?auto_525758 ) ) ( not ( = ?auto_525755 ?auto_525759 ) ) ( not ( = ?auto_525756 ?auto_525757 ) ) ( not ( = ?auto_525756 ?auto_525758 ) ) ( not ( = ?auto_525756 ?auto_525759 ) ) ( not ( = ?auto_525757 ?auto_525758 ) ) ( not ( = ?auto_525757 ?auto_525759 ) ) ( not ( = ?auto_525758 ?auto_525759 ) ) ( CLEAR ?auto_525756 ) ( ON ?auto_525757 ?auto_525758 ) ( CLEAR ?auto_525757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_525744 ?auto_525745 ?auto_525746 ?auto_525747 ?auto_525748 ?auto_525749 ?auto_525750 ?auto_525751 ?auto_525752 ?auto_525753 ?auto_525754 ?auto_525755 ?auto_525756 ?auto_525757 )
      ( MAKE-15PILE ?auto_525744 ?auto_525745 ?auto_525746 ?auto_525747 ?auto_525748 ?auto_525749 ?auto_525750 ?auto_525751 ?auto_525752 ?auto_525753 ?auto_525754 ?auto_525755 ?auto_525756 ?auto_525757 ?auto_525758 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_525806 - BLOCK
      ?auto_525807 - BLOCK
      ?auto_525808 - BLOCK
      ?auto_525809 - BLOCK
      ?auto_525810 - BLOCK
      ?auto_525811 - BLOCK
      ?auto_525812 - BLOCK
      ?auto_525813 - BLOCK
      ?auto_525814 - BLOCK
      ?auto_525815 - BLOCK
      ?auto_525816 - BLOCK
      ?auto_525817 - BLOCK
      ?auto_525818 - BLOCK
      ?auto_525819 - BLOCK
      ?auto_525820 - BLOCK
    )
    :vars
    (
      ?auto_525821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525820 ?auto_525821 ) ( ON-TABLE ?auto_525806 ) ( ON ?auto_525807 ?auto_525806 ) ( ON ?auto_525808 ?auto_525807 ) ( ON ?auto_525809 ?auto_525808 ) ( ON ?auto_525810 ?auto_525809 ) ( ON ?auto_525811 ?auto_525810 ) ( ON ?auto_525812 ?auto_525811 ) ( ON ?auto_525813 ?auto_525812 ) ( ON ?auto_525814 ?auto_525813 ) ( ON ?auto_525815 ?auto_525814 ) ( ON ?auto_525816 ?auto_525815 ) ( ON ?auto_525817 ?auto_525816 ) ( not ( = ?auto_525806 ?auto_525807 ) ) ( not ( = ?auto_525806 ?auto_525808 ) ) ( not ( = ?auto_525806 ?auto_525809 ) ) ( not ( = ?auto_525806 ?auto_525810 ) ) ( not ( = ?auto_525806 ?auto_525811 ) ) ( not ( = ?auto_525806 ?auto_525812 ) ) ( not ( = ?auto_525806 ?auto_525813 ) ) ( not ( = ?auto_525806 ?auto_525814 ) ) ( not ( = ?auto_525806 ?auto_525815 ) ) ( not ( = ?auto_525806 ?auto_525816 ) ) ( not ( = ?auto_525806 ?auto_525817 ) ) ( not ( = ?auto_525806 ?auto_525818 ) ) ( not ( = ?auto_525806 ?auto_525819 ) ) ( not ( = ?auto_525806 ?auto_525820 ) ) ( not ( = ?auto_525806 ?auto_525821 ) ) ( not ( = ?auto_525807 ?auto_525808 ) ) ( not ( = ?auto_525807 ?auto_525809 ) ) ( not ( = ?auto_525807 ?auto_525810 ) ) ( not ( = ?auto_525807 ?auto_525811 ) ) ( not ( = ?auto_525807 ?auto_525812 ) ) ( not ( = ?auto_525807 ?auto_525813 ) ) ( not ( = ?auto_525807 ?auto_525814 ) ) ( not ( = ?auto_525807 ?auto_525815 ) ) ( not ( = ?auto_525807 ?auto_525816 ) ) ( not ( = ?auto_525807 ?auto_525817 ) ) ( not ( = ?auto_525807 ?auto_525818 ) ) ( not ( = ?auto_525807 ?auto_525819 ) ) ( not ( = ?auto_525807 ?auto_525820 ) ) ( not ( = ?auto_525807 ?auto_525821 ) ) ( not ( = ?auto_525808 ?auto_525809 ) ) ( not ( = ?auto_525808 ?auto_525810 ) ) ( not ( = ?auto_525808 ?auto_525811 ) ) ( not ( = ?auto_525808 ?auto_525812 ) ) ( not ( = ?auto_525808 ?auto_525813 ) ) ( not ( = ?auto_525808 ?auto_525814 ) ) ( not ( = ?auto_525808 ?auto_525815 ) ) ( not ( = ?auto_525808 ?auto_525816 ) ) ( not ( = ?auto_525808 ?auto_525817 ) ) ( not ( = ?auto_525808 ?auto_525818 ) ) ( not ( = ?auto_525808 ?auto_525819 ) ) ( not ( = ?auto_525808 ?auto_525820 ) ) ( not ( = ?auto_525808 ?auto_525821 ) ) ( not ( = ?auto_525809 ?auto_525810 ) ) ( not ( = ?auto_525809 ?auto_525811 ) ) ( not ( = ?auto_525809 ?auto_525812 ) ) ( not ( = ?auto_525809 ?auto_525813 ) ) ( not ( = ?auto_525809 ?auto_525814 ) ) ( not ( = ?auto_525809 ?auto_525815 ) ) ( not ( = ?auto_525809 ?auto_525816 ) ) ( not ( = ?auto_525809 ?auto_525817 ) ) ( not ( = ?auto_525809 ?auto_525818 ) ) ( not ( = ?auto_525809 ?auto_525819 ) ) ( not ( = ?auto_525809 ?auto_525820 ) ) ( not ( = ?auto_525809 ?auto_525821 ) ) ( not ( = ?auto_525810 ?auto_525811 ) ) ( not ( = ?auto_525810 ?auto_525812 ) ) ( not ( = ?auto_525810 ?auto_525813 ) ) ( not ( = ?auto_525810 ?auto_525814 ) ) ( not ( = ?auto_525810 ?auto_525815 ) ) ( not ( = ?auto_525810 ?auto_525816 ) ) ( not ( = ?auto_525810 ?auto_525817 ) ) ( not ( = ?auto_525810 ?auto_525818 ) ) ( not ( = ?auto_525810 ?auto_525819 ) ) ( not ( = ?auto_525810 ?auto_525820 ) ) ( not ( = ?auto_525810 ?auto_525821 ) ) ( not ( = ?auto_525811 ?auto_525812 ) ) ( not ( = ?auto_525811 ?auto_525813 ) ) ( not ( = ?auto_525811 ?auto_525814 ) ) ( not ( = ?auto_525811 ?auto_525815 ) ) ( not ( = ?auto_525811 ?auto_525816 ) ) ( not ( = ?auto_525811 ?auto_525817 ) ) ( not ( = ?auto_525811 ?auto_525818 ) ) ( not ( = ?auto_525811 ?auto_525819 ) ) ( not ( = ?auto_525811 ?auto_525820 ) ) ( not ( = ?auto_525811 ?auto_525821 ) ) ( not ( = ?auto_525812 ?auto_525813 ) ) ( not ( = ?auto_525812 ?auto_525814 ) ) ( not ( = ?auto_525812 ?auto_525815 ) ) ( not ( = ?auto_525812 ?auto_525816 ) ) ( not ( = ?auto_525812 ?auto_525817 ) ) ( not ( = ?auto_525812 ?auto_525818 ) ) ( not ( = ?auto_525812 ?auto_525819 ) ) ( not ( = ?auto_525812 ?auto_525820 ) ) ( not ( = ?auto_525812 ?auto_525821 ) ) ( not ( = ?auto_525813 ?auto_525814 ) ) ( not ( = ?auto_525813 ?auto_525815 ) ) ( not ( = ?auto_525813 ?auto_525816 ) ) ( not ( = ?auto_525813 ?auto_525817 ) ) ( not ( = ?auto_525813 ?auto_525818 ) ) ( not ( = ?auto_525813 ?auto_525819 ) ) ( not ( = ?auto_525813 ?auto_525820 ) ) ( not ( = ?auto_525813 ?auto_525821 ) ) ( not ( = ?auto_525814 ?auto_525815 ) ) ( not ( = ?auto_525814 ?auto_525816 ) ) ( not ( = ?auto_525814 ?auto_525817 ) ) ( not ( = ?auto_525814 ?auto_525818 ) ) ( not ( = ?auto_525814 ?auto_525819 ) ) ( not ( = ?auto_525814 ?auto_525820 ) ) ( not ( = ?auto_525814 ?auto_525821 ) ) ( not ( = ?auto_525815 ?auto_525816 ) ) ( not ( = ?auto_525815 ?auto_525817 ) ) ( not ( = ?auto_525815 ?auto_525818 ) ) ( not ( = ?auto_525815 ?auto_525819 ) ) ( not ( = ?auto_525815 ?auto_525820 ) ) ( not ( = ?auto_525815 ?auto_525821 ) ) ( not ( = ?auto_525816 ?auto_525817 ) ) ( not ( = ?auto_525816 ?auto_525818 ) ) ( not ( = ?auto_525816 ?auto_525819 ) ) ( not ( = ?auto_525816 ?auto_525820 ) ) ( not ( = ?auto_525816 ?auto_525821 ) ) ( not ( = ?auto_525817 ?auto_525818 ) ) ( not ( = ?auto_525817 ?auto_525819 ) ) ( not ( = ?auto_525817 ?auto_525820 ) ) ( not ( = ?auto_525817 ?auto_525821 ) ) ( not ( = ?auto_525818 ?auto_525819 ) ) ( not ( = ?auto_525818 ?auto_525820 ) ) ( not ( = ?auto_525818 ?auto_525821 ) ) ( not ( = ?auto_525819 ?auto_525820 ) ) ( not ( = ?auto_525819 ?auto_525821 ) ) ( not ( = ?auto_525820 ?auto_525821 ) ) ( ON ?auto_525819 ?auto_525820 ) ( CLEAR ?auto_525817 ) ( ON ?auto_525818 ?auto_525819 ) ( CLEAR ?auto_525818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_525806 ?auto_525807 ?auto_525808 ?auto_525809 ?auto_525810 ?auto_525811 ?auto_525812 ?auto_525813 ?auto_525814 ?auto_525815 ?auto_525816 ?auto_525817 ?auto_525818 )
      ( MAKE-15PILE ?auto_525806 ?auto_525807 ?auto_525808 ?auto_525809 ?auto_525810 ?auto_525811 ?auto_525812 ?auto_525813 ?auto_525814 ?auto_525815 ?auto_525816 ?auto_525817 ?auto_525818 ?auto_525819 ?auto_525820 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_525868 - BLOCK
      ?auto_525869 - BLOCK
      ?auto_525870 - BLOCK
      ?auto_525871 - BLOCK
      ?auto_525872 - BLOCK
      ?auto_525873 - BLOCK
      ?auto_525874 - BLOCK
      ?auto_525875 - BLOCK
      ?auto_525876 - BLOCK
      ?auto_525877 - BLOCK
      ?auto_525878 - BLOCK
      ?auto_525879 - BLOCK
      ?auto_525880 - BLOCK
      ?auto_525881 - BLOCK
      ?auto_525882 - BLOCK
    )
    :vars
    (
      ?auto_525883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525882 ?auto_525883 ) ( ON-TABLE ?auto_525868 ) ( ON ?auto_525869 ?auto_525868 ) ( ON ?auto_525870 ?auto_525869 ) ( ON ?auto_525871 ?auto_525870 ) ( ON ?auto_525872 ?auto_525871 ) ( ON ?auto_525873 ?auto_525872 ) ( ON ?auto_525874 ?auto_525873 ) ( ON ?auto_525875 ?auto_525874 ) ( ON ?auto_525876 ?auto_525875 ) ( ON ?auto_525877 ?auto_525876 ) ( ON ?auto_525878 ?auto_525877 ) ( not ( = ?auto_525868 ?auto_525869 ) ) ( not ( = ?auto_525868 ?auto_525870 ) ) ( not ( = ?auto_525868 ?auto_525871 ) ) ( not ( = ?auto_525868 ?auto_525872 ) ) ( not ( = ?auto_525868 ?auto_525873 ) ) ( not ( = ?auto_525868 ?auto_525874 ) ) ( not ( = ?auto_525868 ?auto_525875 ) ) ( not ( = ?auto_525868 ?auto_525876 ) ) ( not ( = ?auto_525868 ?auto_525877 ) ) ( not ( = ?auto_525868 ?auto_525878 ) ) ( not ( = ?auto_525868 ?auto_525879 ) ) ( not ( = ?auto_525868 ?auto_525880 ) ) ( not ( = ?auto_525868 ?auto_525881 ) ) ( not ( = ?auto_525868 ?auto_525882 ) ) ( not ( = ?auto_525868 ?auto_525883 ) ) ( not ( = ?auto_525869 ?auto_525870 ) ) ( not ( = ?auto_525869 ?auto_525871 ) ) ( not ( = ?auto_525869 ?auto_525872 ) ) ( not ( = ?auto_525869 ?auto_525873 ) ) ( not ( = ?auto_525869 ?auto_525874 ) ) ( not ( = ?auto_525869 ?auto_525875 ) ) ( not ( = ?auto_525869 ?auto_525876 ) ) ( not ( = ?auto_525869 ?auto_525877 ) ) ( not ( = ?auto_525869 ?auto_525878 ) ) ( not ( = ?auto_525869 ?auto_525879 ) ) ( not ( = ?auto_525869 ?auto_525880 ) ) ( not ( = ?auto_525869 ?auto_525881 ) ) ( not ( = ?auto_525869 ?auto_525882 ) ) ( not ( = ?auto_525869 ?auto_525883 ) ) ( not ( = ?auto_525870 ?auto_525871 ) ) ( not ( = ?auto_525870 ?auto_525872 ) ) ( not ( = ?auto_525870 ?auto_525873 ) ) ( not ( = ?auto_525870 ?auto_525874 ) ) ( not ( = ?auto_525870 ?auto_525875 ) ) ( not ( = ?auto_525870 ?auto_525876 ) ) ( not ( = ?auto_525870 ?auto_525877 ) ) ( not ( = ?auto_525870 ?auto_525878 ) ) ( not ( = ?auto_525870 ?auto_525879 ) ) ( not ( = ?auto_525870 ?auto_525880 ) ) ( not ( = ?auto_525870 ?auto_525881 ) ) ( not ( = ?auto_525870 ?auto_525882 ) ) ( not ( = ?auto_525870 ?auto_525883 ) ) ( not ( = ?auto_525871 ?auto_525872 ) ) ( not ( = ?auto_525871 ?auto_525873 ) ) ( not ( = ?auto_525871 ?auto_525874 ) ) ( not ( = ?auto_525871 ?auto_525875 ) ) ( not ( = ?auto_525871 ?auto_525876 ) ) ( not ( = ?auto_525871 ?auto_525877 ) ) ( not ( = ?auto_525871 ?auto_525878 ) ) ( not ( = ?auto_525871 ?auto_525879 ) ) ( not ( = ?auto_525871 ?auto_525880 ) ) ( not ( = ?auto_525871 ?auto_525881 ) ) ( not ( = ?auto_525871 ?auto_525882 ) ) ( not ( = ?auto_525871 ?auto_525883 ) ) ( not ( = ?auto_525872 ?auto_525873 ) ) ( not ( = ?auto_525872 ?auto_525874 ) ) ( not ( = ?auto_525872 ?auto_525875 ) ) ( not ( = ?auto_525872 ?auto_525876 ) ) ( not ( = ?auto_525872 ?auto_525877 ) ) ( not ( = ?auto_525872 ?auto_525878 ) ) ( not ( = ?auto_525872 ?auto_525879 ) ) ( not ( = ?auto_525872 ?auto_525880 ) ) ( not ( = ?auto_525872 ?auto_525881 ) ) ( not ( = ?auto_525872 ?auto_525882 ) ) ( not ( = ?auto_525872 ?auto_525883 ) ) ( not ( = ?auto_525873 ?auto_525874 ) ) ( not ( = ?auto_525873 ?auto_525875 ) ) ( not ( = ?auto_525873 ?auto_525876 ) ) ( not ( = ?auto_525873 ?auto_525877 ) ) ( not ( = ?auto_525873 ?auto_525878 ) ) ( not ( = ?auto_525873 ?auto_525879 ) ) ( not ( = ?auto_525873 ?auto_525880 ) ) ( not ( = ?auto_525873 ?auto_525881 ) ) ( not ( = ?auto_525873 ?auto_525882 ) ) ( not ( = ?auto_525873 ?auto_525883 ) ) ( not ( = ?auto_525874 ?auto_525875 ) ) ( not ( = ?auto_525874 ?auto_525876 ) ) ( not ( = ?auto_525874 ?auto_525877 ) ) ( not ( = ?auto_525874 ?auto_525878 ) ) ( not ( = ?auto_525874 ?auto_525879 ) ) ( not ( = ?auto_525874 ?auto_525880 ) ) ( not ( = ?auto_525874 ?auto_525881 ) ) ( not ( = ?auto_525874 ?auto_525882 ) ) ( not ( = ?auto_525874 ?auto_525883 ) ) ( not ( = ?auto_525875 ?auto_525876 ) ) ( not ( = ?auto_525875 ?auto_525877 ) ) ( not ( = ?auto_525875 ?auto_525878 ) ) ( not ( = ?auto_525875 ?auto_525879 ) ) ( not ( = ?auto_525875 ?auto_525880 ) ) ( not ( = ?auto_525875 ?auto_525881 ) ) ( not ( = ?auto_525875 ?auto_525882 ) ) ( not ( = ?auto_525875 ?auto_525883 ) ) ( not ( = ?auto_525876 ?auto_525877 ) ) ( not ( = ?auto_525876 ?auto_525878 ) ) ( not ( = ?auto_525876 ?auto_525879 ) ) ( not ( = ?auto_525876 ?auto_525880 ) ) ( not ( = ?auto_525876 ?auto_525881 ) ) ( not ( = ?auto_525876 ?auto_525882 ) ) ( not ( = ?auto_525876 ?auto_525883 ) ) ( not ( = ?auto_525877 ?auto_525878 ) ) ( not ( = ?auto_525877 ?auto_525879 ) ) ( not ( = ?auto_525877 ?auto_525880 ) ) ( not ( = ?auto_525877 ?auto_525881 ) ) ( not ( = ?auto_525877 ?auto_525882 ) ) ( not ( = ?auto_525877 ?auto_525883 ) ) ( not ( = ?auto_525878 ?auto_525879 ) ) ( not ( = ?auto_525878 ?auto_525880 ) ) ( not ( = ?auto_525878 ?auto_525881 ) ) ( not ( = ?auto_525878 ?auto_525882 ) ) ( not ( = ?auto_525878 ?auto_525883 ) ) ( not ( = ?auto_525879 ?auto_525880 ) ) ( not ( = ?auto_525879 ?auto_525881 ) ) ( not ( = ?auto_525879 ?auto_525882 ) ) ( not ( = ?auto_525879 ?auto_525883 ) ) ( not ( = ?auto_525880 ?auto_525881 ) ) ( not ( = ?auto_525880 ?auto_525882 ) ) ( not ( = ?auto_525880 ?auto_525883 ) ) ( not ( = ?auto_525881 ?auto_525882 ) ) ( not ( = ?auto_525881 ?auto_525883 ) ) ( not ( = ?auto_525882 ?auto_525883 ) ) ( ON ?auto_525881 ?auto_525882 ) ( ON ?auto_525880 ?auto_525881 ) ( CLEAR ?auto_525878 ) ( ON ?auto_525879 ?auto_525880 ) ( CLEAR ?auto_525879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_525868 ?auto_525869 ?auto_525870 ?auto_525871 ?auto_525872 ?auto_525873 ?auto_525874 ?auto_525875 ?auto_525876 ?auto_525877 ?auto_525878 ?auto_525879 )
      ( MAKE-15PILE ?auto_525868 ?auto_525869 ?auto_525870 ?auto_525871 ?auto_525872 ?auto_525873 ?auto_525874 ?auto_525875 ?auto_525876 ?auto_525877 ?auto_525878 ?auto_525879 ?auto_525880 ?auto_525881 ?auto_525882 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_525930 - BLOCK
      ?auto_525931 - BLOCK
      ?auto_525932 - BLOCK
      ?auto_525933 - BLOCK
      ?auto_525934 - BLOCK
      ?auto_525935 - BLOCK
      ?auto_525936 - BLOCK
      ?auto_525937 - BLOCK
      ?auto_525938 - BLOCK
      ?auto_525939 - BLOCK
      ?auto_525940 - BLOCK
      ?auto_525941 - BLOCK
      ?auto_525942 - BLOCK
      ?auto_525943 - BLOCK
      ?auto_525944 - BLOCK
    )
    :vars
    (
      ?auto_525945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_525944 ?auto_525945 ) ( ON-TABLE ?auto_525930 ) ( ON ?auto_525931 ?auto_525930 ) ( ON ?auto_525932 ?auto_525931 ) ( ON ?auto_525933 ?auto_525932 ) ( ON ?auto_525934 ?auto_525933 ) ( ON ?auto_525935 ?auto_525934 ) ( ON ?auto_525936 ?auto_525935 ) ( ON ?auto_525937 ?auto_525936 ) ( ON ?auto_525938 ?auto_525937 ) ( ON ?auto_525939 ?auto_525938 ) ( not ( = ?auto_525930 ?auto_525931 ) ) ( not ( = ?auto_525930 ?auto_525932 ) ) ( not ( = ?auto_525930 ?auto_525933 ) ) ( not ( = ?auto_525930 ?auto_525934 ) ) ( not ( = ?auto_525930 ?auto_525935 ) ) ( not ( = ?auto_525930 ?auto_525936 ) ) ( not ( = ?auto_525930 ?auto_525937 ) ) ( not ( = ?auto_525930 ?auto_525938 ) ) ( not ( = ?auto_525930 ?auto_525939 ) ) ( not ( = ?auto_525930 ?auto_525940 ) ) ( not ( = ?auto_525930 ?auto_525941 ) ) ( not ( = ?auto_525930 ?auto_525942 ) ) ( not ( = ?auto_525930 ?auto_525943 ) ) ( not ( = ?auto_525930 ?auto_525944 ) ) ( not ( = ?auto_525930 ?auto_525945 ) ) ( not ( = ?auto_525931 ?auto_525932 ) ) ( not ( = ?auto_525931 ?auto_525933 ) ) ( not ( = ?auto_525931 ?auto_525934 ) ) ( not ( = ?auto_525931 ?auto_525935 ) ) ( not ( = ?auto_525931 ?auto_525936 ) ) ( not ( = ?auto_525931 ?auto_525937 ) ) ( not ( = ?auto_525931 ?auto_525938 ) ) ( not ( = ?auto_525931 ?auto_525939 ) ) ( not ( = ?auto_525931 ?auto_525940 ) ) ( not ( = ?auto_525931 ?auto_525941 ) ) ( not ( = ?auto_525931 ?auto_525942 ) ) ( not ( = ?auto_525931 ?auto_525943 ) ) ( not ( = ?auto_525931 ?auto_525944 ) ) ( not ( = ?auto_525931 ?auto_525945 ) ) ( not ( = ?auto_525932 ?auto_525933 ) ) ( not ( = ?auto_525932 ?auto_525934 ) ) ( not ( = ?auto_525932 ?auto_525935 ) ) ( not ( = ?auto_525932 ?auto_525936 ) ) ( not ( = ?auto_525932 ?auto_525937 ) ) ( not ( = ?auto_525932 ?auto_525938 ) ) ( not ( = ?auto_525932 ?auto_525939 ) ) ( not ( = ?auto_525932 ?auto_525940 ) ) ( not ( = ?auto_525932 ?auto_525941 ) ) ( not ( = ?auto_525932 ?auto_525942 ) ) ( not ( = ?auto_525932 ?auto_525943 ) ) ( not ( = ?auto_525932 ?auto_525944 ) ) ( not ( = ?auto_525932 ?auto_525945 ) ) ( not ( = ?auto_525933 ?auto_525934 ) ) ( not ( = ?auto_525933 ?auto_525935 ) ) ( not ( = ?auto_525933 ?auto_525936 ) ) ( not ( = ?auto_525933 ?auto_525937 ) ) ( not ( = ?auto_525933 ?auto_525938 ) ) ( not ( = ?auto_525933 ?auto_525939 ) ) ( not ( = ?auto_525933 ?auto_525940 ) ) ( not ( = ?auto_525933 ?auto_525941 ) ) ( not ( = ?auto_525933 ?auto_525942 ) ) ( not ( = ?auto_525933 ?auto_525943 ) ) ( not ( = ?auto_525933 ?auto_525944 ) ) ( not ( = ?auto_525933 ?auto_525945 ) ) ( not ( = ?auto_525934 ?auto_525935 ) ) ( not ( = ?auto_525934 ?auto_525936 ) ) ( not ( = ?auto_525934 ?auto_525937 ) ) ( not ( = ?auto_525934 ?auto_525938 ) ) ( not ( = ?auto_525934 ?auto_525939 ) ) ( not ( = ?auto_525934 ?auto_525940 ) ) ( not ( = ?auto_525934 ?auto_525941 ) ) ( not ( = ?auto_525934 ?auto_525942 ) ) ( not ( = ?auto_525934 ?auto_525943 ) ) ( not ( = ?auto_525934 ?auto_525944 ) ) ( not ( = ?auto_525934 ?auto_525945 ) ) ( not ( = ?auto_525935 ?auto_525936 ) ) ( not ( = ?auto_525935 ?auto_525937 ) ) ( not ( = ?auto_525935 ?auto_525938 ) ) ( not ( = ?auto_525935 ?auto_525939 ) ) ( not ( = ?auto_525935 ?auto_525940 ) ) ( not ( = ?auto_525935 ?auto_525941 ) ) ( not ( = ?auto_525935 ?auto_525942 ) ) ( not ( = ?auto_525935 ?auto_525943 ) ) ( not ( = ?auto_525935 ?auto_525944 ) ) ( not ( = ?auto_525935 ?auto_525945 ) ) ( not ( = ?auto_525936 ?auto_525937 ) ) ( not ( = ?auto_525936 ?auto_525938 ) ) ( not ( = ?auto_525936 ?auto_525939 ) ) ( not ( = ?auto_525936 ?auto_525940 ) ) ( not ( = ?auto_525936 ?auto_525941 ) ) ( not ( = ?auto_525936 ?auto_525942 ) ) ( not ( = ?auto_525936 ?auto_525943 ) ) ( not ( = ?auto_525936 ?auto_525944 ) ) ( not ( = ?auto_525936 ?auto_525945 ) ) ( not ( = ?auto_525937 ?auto_525938 ) ) ( not ( = ?auto_525937 ?auto_525939 ) ) ( not ( = ?auto_525937 ?auto_525940 ) ) ( not ( = ?auto_525937 ?auto_525941 ) ) ( not ( = ?auto_525937 ?auto_525942 ) ) ( not ( = ?auto_525937 ?auto_525943 ) ) ( not ( = ?auto_525937 ?auto_525944 ) ) ( not ( = ?auto_525937 ?auto_525945 ) ) ( not ( = ?auto_525938 ?auto_525939 ) ) ( not ( = ?auto_525938 ?auto_525940 ) ) ( not ( = ?auto_525938 ?auto_525941 ) ) ( not ( = ?auto_525938 ?auto_525942 ) ) ( not ( = ?auto_525938 ?auto_525943 ) ) ( not ( = ?auto_525938 ?auto_525944 ) ) ( not ( = ?auto_525938 ?auto_525945 ) ) ( not ( = ?auto_525939 ?auto_525940 ) ) ( not ( = ?auto_525939 ?auto_525941 ) ) ( not ( = ?auto_525939 ?auto_525942 ) ) ( not ( = ?auto_525939 ?auto_525943 ) ) ( not ( = ?auto_525939 ?auto_525944 ) ) ( not ( = ?auto_525939 ?auto_525945 ) ) ( not ( = ?auto_525940 ?auto_525941 ) ) ( not ( = ?auto_525940 ?auto_525942 ) ) ( not ( = ?auto_525940 ?auto_525943 ) ) ( not ( = ?auto_525940 ?auto_525944 ) ) ( not ( = ?auto_525940 ?auto_525945 ) ) ( not ( = ?auto_525941 ?auto_525942 ) ) ( not ( = ?auto_525941 ?auto_525943 ) ) ( not ( = ?auto_525941 ?auto_525944 ) ) ( not ( = ?auto_525941 ?auto_525945 ) ) ( not ( = ?auto_525942 ?auto_525943 ) ) ( not ( = ?auto_525942 ?auto_525944 ) ) ( not ( = ?auto_525942 ?auto_525945 ) ) ( not ( = ?auto_525943 ?auto_525944 ) ) ( not ( = ?auto_525943 ?auto_525945 ) ) ( not ( = ?auto_525944 ?auto_525945 ) ) ( ON ?auto_525943 ?auto_525944 ) ( ON ?auto_525942 ?auto_525943 ) ( ON ?auto_525941 ?auto_525942 ) ( CLEAR ?auto_525939 ) ( ON ?auto_525940 ?auto_525941 ) ( CLEAR ?auto_525940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_525930 ?auto_525931 ?auto_525932 ?auto_525933 ?auto_525934 ?auto_525935 ?auto_525936 ?auto_525937 ?auto_525938 ?auto_525939 ?auto_525940 )
      ( MAKE-15PILE ?auto_525930 ?auto_525931 ?auto_525932 ?auto_525933 ?auto_525934 ?auto_525935 ?auto_525936 ?auto_525937 ?auto_525938 ?auto_525939 ?auto_525940 ?auto_525941 ?auto_525942 ?auto_525943 ?auto_525944 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_525992 - BLOCK
      ?auto_525993 - BLOCK
      ?auto_525994 - BLOCK
      ?auto_525995 - BLOCK
      ?auto_525996 - BLOCK
      ?auto_525997 - BLOCK
      ?auto_525998 - BLOCK
      ?auto_525999 - BLOCK
      ?auto_526000 - BLOCK
      ?auto_526001 - BLOCK
      ?auto_526002 - BLOCK
      ?auto_526003 - BLOCK
      ?auto_526004 - BLOCK
      ?auto_526005 - BLOCK
      ?auto_526006 - BLOCK
    )
    :vars
    (
      ?auto_526007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526006 ?auto_526007 ) ( ON-TABLE ?auto_525992 ) ( ON ?auto_525993 ?auto_525992 ) ( ON ?auto_525994 ?auto_525993 ) ( ON ?auto_525995 ?auto_525994 ) ( ON ?auto_525996 ?auto_525995 ) ( ON ?auto_525997 ?auto_525996 ) ( ON ?auto_525998 ?auto_525997 ) ( ON ?auto_525999 ?auto_525998 ) ( ON ?auto_526000 ?auto_525999 ) ( not ( = ?auto_525992 ?auto_525993 ) ) ( not ( = ?auto_525992 ?auto_525994 ) ) ( not ( = ?auto_525992 ?auto_525995 ) ) ( not ( = ?auto_525992 ?auto_525996 ) ) ( not ( = ?auto_525992 ?auto_525997 ) ) ( not ( = ?auto_525992 ?auto_525998 ) ) ( not ( = ?auto_525992 ?auto_525999 ) ) ( not ( = ?auto_525992 ?auto_526000 ) ) ( not ( = ?auto_525992 ?auto_526001 ) ) ( not ( = ?auto_525992 ?auto_526002 ) ) ( not ( = ?auto_525992 ?auto_526003 ) ) ( not ( = ?auto_525992 ?auto_526004 ) ) ( not ( = ?auto_525992 ?auto_526005 ) ) ( not ( = ?auto_525992 ?auto_526006 ) ) ( not ( = ?auto_525992 ?auto_526007 ) ) ( not ( = ?auto_525993 ?auto_525994 ) ) ( not ( = ?auto_525993 ?auto_525995 ) ) ( not ( = ?auto_525993 ?auto_525996 ) ) ( not ( = ?auto_525993 ?auto_525997 ) ) ( not ( = ?auto_525993 ?auto_525998 ) ) ( not ( = ?auto_525993 ?auto_525999 ) ) ( not ( = ?auto_525993 ?auto_526000 ) ) ( not ( = ?auto_525993 ?auto_526001 ) ) ( not ( = ?auto_525993 ?auto_526002 ) ) ( not ( = ?auto_525993 ?auto_526003 ) ) ( not ( = ?auto_525993 ?auto_526004 ) ) ( not ( = ?auto_525993 ?auto_526005 ) ) ( not ( = ?auto_525993 ?auto_526006 ) ) ( not ( = ?auto_525993 ?auto_526007 ) ) ( not ( = ?auto_525994 ?auto_525995 ) ) ( not ( = ?auto_525994 ?auto_525996 ) ) ( not ( = ?auto_525994 ?auto_525997 ) ) ( not ( = ?auto_525994 ?auto_525998 ) ) ( not ( = ?auto_525994 ?auto_525999 ) ) ( not ( = ?auto_525994 ?auto_526000 ) ) ( not ( = ?auto_525994 ?auto_526001 ) ) ( not ( = ?auto_525994 ?auto_526002 ) ) ( not ( = ?auto_525994 ?auto_526003 ) ) ( not ( = ?auto_525994 ?auto_526004 ) ) ( not ( = ?auto_525994 ?auto_526005 ) ) ( not ( = ?auto_525994 ?auto_526006 ) ) ( not ( = ?auto_525994 ?auto_526007 ) ) ( not ( = ?auto_525995 ?auto_525996 ) ) ( not ( = ?auto_525995 ?auto_525997 ) ) ( not ( = ?auto_525995 ?auto_525998 ) ) ( not ( = ?auto_525995 ?auto_525999 ) ) ( not ( = ?auto_525995 ?auto_526000 ) ) ( not ( = ?auto_525995 ?auto_526001 ) ) ( not ( = ?auto_525995 ?auto_526002 ) ) ( not ( = ?auto_525995 ?auto_526003 ) ) ( not ( = ?auto_525995 ?auto_526004 ) ) ( not ( = ?auto_525995 ?auto_526005 ) ) ( not ( = ?auto_525995 ?auto_526006 ) ) ( not ( = ?auto_525995 ?auto_526007 ) ) ( not ( = ?auto_525996 ?auto_525997 ) ) ( not ( = ?auto_525996 ?auto_525998 ) ) ( not ( = ?auto_525996 ?auto_525999 ) ) ( not ( = ?auto_525996 ?auto_526000 ) ) ( not ( = ?auto_525996 ?auto_526001 ) ) ( not ( = ?auto_525996 ?auto_526002 ) ) ( not ( = ?auto_525996 ?auto_526003 ) ) ( not ( = ?auto_525996 ?auto_526004 ) ) ( not ( = ?auto_525996 ?auto_526005 ) ) ( not ( = ?auto_525996 ?auto_526006 ) ) ( not ( = ?auto_525996 ?auto_526007 ) ) ( not ( = ?auto_525997 ?auto_525998 ) ) ( not ( = ?auto_525997 ?auto_525999 ) ) ( not ( = ?auto_525997 ?auto_526000 ) ) ( not ( = ?auto_525997 ?auto_526001 ) ) ( not ( = ?auto_525997 ?auto_526002 ) ) ( not ( = ?auto_525997 ?auto_526003 ) ) ( not ( = ?auto_525997 ?auto_526004 ) ) ( not ( = ?auto_525997 ?auto_526005 ) ) ( not ( = ?auto_525997 ?auto_526006 ) ) ( not ( = ?auto_525997 ?auto_526007 ) ) ( not ( = ?auto_525998 ?auto_525999 ) ) ( not ( = ?auto_525998 ?auto_526000 ) ) ( not ( = ?auto_525998 ?auto_526001 ) ) ( not ( = ?auto_525998 ?auto_526002 ) ) ( not ( = ?auto_525998 ?auto_526003 ) ) ( not ( = ?auto_525998 ?auto_526004 ) ) ( not ( = ?auto_525998 ?auto_526005 ) ) ( not ( = ?auto_525998 ?auto_526006 ) ) ( not ( = ?auto_525998 ?auto_526007 ) ) ( not ( = ?auto_525999 ?auto_526000 ) ) ( not ( = ?auto_525999 ?auto_526001 ) ) ( not ( = ?auto_525999 ?auto_526002 ) ) ( not ( = ?auto_525999 ?auto_526003 ) ) ( not ( = ?auto_525999 ?auto_526004 ) ) ( not ( = ?auto_525999 ?auto_526005 ) ) ( not ( = ?auto_525999 ?auto_526006 ) ) ( not ( = ?auto_525999 ?auto_526007 ) ) ( not ( = ?auto_526000 ?auto_526001 ) ) ( not ( = ?auto_526000 ?auto_526002 ) ) ( not ( = ?auto_526000 ?auto_526003 ) ) ( not ( = ?auto_526000 ?auto_526004 ) ) ( not ( = ?auto_526000 ?auto_526005 ) ) ( not ( = ?auto_526000 ?auto_526006 ) ) ( not ( = ?auto_526000 ?auto_526007 ) ) ( not ( = ?auto_526001 ?auto_526002 ) ) ( not ( = ?auto_526001 ?auto_526003 ) ) ( not ( = ?auto_526001 ?auto_526004 ) ) ( not ( = ?auto_526001 ?auto_526005 ) ) ( not ( = ?auto_526001 ?auto_526006 ) ) ( not ( = ?auto_526001 ?auto_526007 ) ) ( not ( = ?auto_526002 ?auto_526003 ) ) ( not ( = ?auto_526002 ?auto_526004 ) ) ( not ( = ?auto_526002 ?auto_526005 ) ) ( not ( = ?auto_526002 ?auto_526006 ) ) ( not ( = ?auto_526002 ?auto_526007 ) ) ( not ( = ?auto_526003 ?auto_526004 ) ) ( not ( = ?auto_526003 ?auto_526005 ) ) ( not ( = ?auto_526003 ?auto_526006 ) ) ( not ( = ?auto_526003 ?auto_526007 ) ) ( not ( = ?auto_526004 ?auto_526005 ) ) ( not ( = ?auto_526004 ?auto_526006 ) ) ( not ( = ?auto_526004 ?auto_526007 ) ) ( not ( = ?auto_526005 ?auto_526006 ) ) ( not ( = ?auto_526005 ?auto_526007 ) ) ( not ( = ?auto_526006 ?auto_526007 ) ) ( ON ?auto_526005 ?auto_526006 ) ( ON ?auto_526004 ?auto_526005 ) ( ON ?auto_526003 ?auto_526004 ) ( ON ?auto_526002 ?auto_526003 ) ( CLEAR ?auto_526000 ) ( ON ?auto_526001 ?auto_526002 ) ( CLEAR ?auto_526001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_525992 ?auto_525993 ?auto_525994 ?auto_525995 ?auto_525996 ?auto_525997 ?auto_525998 ?auto_525999 ?auto_526000 ?auto_526001 )
      ( MAKE-15PILE ?auto_525992 ?auto_525993 ?auto_525994 ?auto_525995 ?auto_525996 ?auto_525997 ?auto_525998 ?auto_525999 ?auto_526000 ?auto_526001 ?auto_526002 ?auto_526003 ?auto_526004 ?auto_526005 ?auto_526006 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_526054 - BLOCK
      ?auto_526055 - BLOCK
      ?auto_526056 - BLOCK
      ?auto_526057 - BLOCK
      ?auto_526058 - BLOCK
      ?auto_526059 - BLOCK
      ?auto_526060 - BLOCK
      ?auto_526061 - BLOCK
      ?auto_526062 - BLOCK
      ?auto_526063 - BLOCK
      ?auto_526064 - BLOCK
      ?auto_526065 - BLOCK
      ?auto_526066 - BLOCK
      ?auto_526067 - BLOCK
      ?auto_526068 - BLOCK
    )
    :vars
    (
      ?auto_526069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526068 ?auto_526069 ) ( ON-TABLE ?auto_526054 ) ( ON ?auto_526055 ?auto_526054 ) ( ON ?auto_526056 ?auto_526055 ) ( ON ?auto_526057 ?auto_526056 ) ( ON ?auto_526058 ?auto_526057 ) ( ON ?auto_526059 ?auto_526058 ) ( ON ?auto_526060 ?auto_526059 ) ( ON ?auto_526061 ?auto_526060 ) ( not ( = ?auto_526054 ?auto_526055 ) ) ( not ( = ?auto_526054 ?auto_526056 ) ) ( not ( = ?auto_526054 ?auto_526057 ) ) ( not ( = ?auto_526054 ?auto_526058 ) ) ( not ( = ?auto_526054 ?auto_526059 ) ) ( not ( = ?auto_526054 ?auto_526060 ) ) ( not ( = ?auto_526054 ?auto_526061 ) ) ( not ( = ?auto_526054 ?auto_526062 ) ) ( not ( = ?auto_526054 ?auto_526063 ) ) ( not ( = ?auto_526054 ?auto_526064 ) ) ( not ( = ?auto_526054 ?auto_526065 ) ) ( not ( = ?auto_526054 ?auto_526066 ) ) ( not ( = ?auto_526054 ?auto_526067 ) ) ( not ( = ?auto_526054 ?auto_526068 ) ) ( not ( = ?auto_526054 ?auto_526069 ) ) ( not ( = ?auto_526055 ?auto_526056 ) ) ( not ( = ?auto_526055 ?auto_526057 ) ) ( not ( = ?auto_526055 ?auto_526058 ) ) ( not ( = ?auto_526055 ?auto_526059 ) ) ( not ( = ?auto_526055 ?auto_526060 ) ) ( not ( = ?auto_526055 ?auto_526061 ) ) ( not ( = ?auto_526055 ?auto_526062 ) ) ( not ( = ?auto_526055 ?auto_526063 ) ) ( not ( = ?auto_526055 ?auto_526064 ) ) ( not ( = ?auto_526055 ?auto_526065 ) ) ( not ( = ?auto_526055 ?auto_526066 ) ) ( not ( = ?auto_526055 ?auto_526067 ) ) ( not ( = ?auto_526055 ?auto_526068 ) ) ( not ( = ?auto_526055 ?auto_526069 ) ) ( not ( = ?auto_526056 ?auto_526057 ) ) ( not ( = ?auto_526056 ?auto_526058 ) ) ( not ( = ?auto_526056 ?auto_526059 ) ) ( not ( = ?auto_526056 ?auto_526060 ) ) ( not ( = ?auto_526056 ?auto_526061 ) ) ( not ( = ?auto_526056 ?auto_526062 ) ) ( not ( = ?auto_526056 ?auto_526063 ) ) ( not ( = ?auto_526056 ?auto_526064 ) ) ( not ( = ?auto_526056 ?auto_526065 ) ) ( not ( = ?auto_526056 ?auto_526066 ) ) ( not ( = ?auto_526056 ?auto_526067 ) ) ( not ( = ?auto_526056 ?auto_526068 ) ) ( not ( = ?auto_526056 ?auto_526069 ) ) ( not ( = ?auto_526057 ?auto_526058 ) ) ( not ( = ?auto_526057 ?auto_526059 ) ) ( not ( = ?auto_526057 ?auto_526060 ) ) ( not ( = ?auto_526057 ?auto_526061 ) ) ( not ( = ?auto_526057 ?auto_526062 ) ) ( not ( = ?auto_526057 ?auto_526063 ) ) ( not ( = ?auto_526057 ?auto_526064 ) ) ( not ( = ?auto_526057 ?auto_526065 ) ) ( not ( = ?auto_526057 ?auto_526066 ) ) ( not ( = ?auto_526057 ?auto_526067 ) ) ( not ( = ?auto_526057 ?auto_526068 ) ) ( not ( = ?auto_526057 ?auto_526069 ) ) ( not ( = ?auto_526058 ?auto_526059 ) ) ( not ( = ?auto_526058 ?auto_526060 ) ) ( not ( = ?auto_526058 ?auto_526061 ) ) ( not ( = ?auto_526058 ?auto_526062 ) ) ( not ( = ?auto_526058 ?auto_526063 ) ) ( not ( = ?auto_526058 ?auto_526064 ) ) ( not ( = ?auto_526058 ?auto_526065 ) ) ( not ( = ?auto_526058 ?auto_526066 ) ) ( not ( = ?auto_526058 ?auto_526067 ) ) ( not ( = ?auto_526058 ?auto_526068 ) ) ( not ( = ?auto_526058 ?auto_526069 ) ) ( not ( = ?auto_526059 ?auto_526060 ) ) ( not ( = ?auto_526059 ?auto_526061 ) ) ( not ( = ?auto_526059 ?auto_526062 ) ) ( not ( = ?auto_526059 ?auto_526063 ) ) ( not ( = ?auto_526059 ?auto_526064 ) ) ( not ( = ?auto_526059 ?auto_526065 ) ) ( not ( = ?auto_526059 ?auto_526066 ) ) ( not ( = ?auto_526059 ?auto_526067 ) ) ( not ( = ?auto_526059 ?auto_526068 ) ) ( not ( = ?auto_526059 ?auto_526069 ) ) ( not ( = ?auto_526060 ?auto_526061 ) ) ( not ( = ?auto_526060 ?auto_526062 ) ) ( not ( = ?auto_526060 ?auto_526063 ) ) ( not ( = ?auto_526060 ?auto_526064 ) ) ( not ( = ?auto_526060 ?auto_526065 ) ) ( not ( = ?auto_526060 ?auto_526066 ) ) ( not ( = ?auto_526060 ?auto_526067 ) ) ( not ( = ?auto_526060 ?auto_526068 ) ) ( not ( = ?auto_526060 ?auto_526069 ) ) ( not ( = ?auto_526061 ?auto_526062 ) ) ( not ( = ?auto_526061 ?auto_526063 ) ) ( not ( = ?auto_526061 ?auto_526064 ) ) ( not ( = ?auto_526061 ?auto_526065 ) ) ( not ( = ?auto_526061 ?auto_526066 ) ) ( not ( = ?auto_526061 ?auto_526067 ) ) ( not ( = ?auto_526061 ?auto_526068 ) ) ( not ( = ?auto_526061 ?auto_526069 ) ) ( not ( = ?auto_526062 ?auto_526063 ) ) ( not ( = ?auto_526062 ?auto_526064 ) ) ( not ( = ?auto_526062 ?auto_526065 ) ) ( not ( = ?auto_526062 ?auto_526066 ) ) ( not ( = ?auto_526062 ?auto_526067 ) ) ( not ( = ?auto_526062 ?auto_526068 ) ) ( not ( = ?auto_526062 ?auto_526069 ) ) ( not ( = ?auto_526063 ?auto_526064 ) ) ( not ( = ?auto_526063 ?auto_526065 ) ) ( not ( = ?auto_526063 ?auto_526066 ) ) ( not ( = ?auto_526063 ?auto_526067 ) ) ( not ( = ?auto_526063 ?auto_526068 ) ) ( not ( = ?auto_526063 ?auto_526069 ) ) ( not ( = ?auto_526064 ?auto_526065 ) ) ( not ( = ?auto_526064 ?auto_526066 ) ) ( not ( = ?auto_526064 ?auto_526067 ) ) ( not ( = ?auto_526064 ?auto_526068 ) ) ( not ( = ?auto_526064 ?auto_526069 ) ) ( not ( = ?auto_526065 ?auto_526066 ) ) ( not ( = ?auto_526065 ?auto_526067 ) ) ( not ( = ?auto_526065 ?auto_526068 ) ) ( not ( = ?auto_526065 ?auto_526069 ) ) ( not ( = ?auto_526066 ?auto_526067 ) ) ( not ( = ?auto_526066 ?auto_526068 ) ) ( not ( = ?auto_526066 ?auto_526069 ) ) ( not ( = ?auto_526067 ?auto_526068 ) ) ( not ( = ?auto_526067 ?auto_526069 ) ) ( not ( = ?auto_526068 ?auto_526069 ) ) ( ON ?auto_526067 ?auto_526068 ) ( ON ?auto_526066 ?auto_526067 ) ( ON ?auto_526065 ?auto_526066 ) ( ON ?auto_526064 ?auto_526065 ) ( ON ?auto_526063 ?auto_526064 ) ( CLEAR ?auto_526061 ) ( ON ?auto_526062 ?auto_526063 ) ( CLEAR ?auto_526062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_526054 ?auto_526055 ?auto_526056 ?auto_526057 ?auto_526058 ?auto_526059 ?auto_526060 ?auto_526061 ?auto_526062 )
      ( MAKE-15PILE ?auto_526054 ?auto_526055 ?auto_526056 ?auto_526057 ?auto_526058 ?auto_526059 ?auto_526060 ?auto_526061 ?auto_526062 ?auto_526063 ?auto_526064 ?auto_526065 ?auto_526066 ?auto_526067 ?auto_526068 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_526116 - BLOCK
      ?auto_526117 - BLOCK
      ?auto_526118 - BLOCK
      ?auto_526119 - BLOCK
      ?auto_526120 - BLOCK
      ?auto_526121 - BLOCK
      ?auto_526122 - BLOCK
      ?auto_526123 - BLOCK
      ?auto_526124 - BLOCK
      ?auto_526125 - BLOCK
      ?auto_526126 - BLOCK
      ?auto_526127 - BLOCK
      ?auto_526128 - BLOCK
      ?auto_526129 - BLOCK
      ?auto_526130 - BLOCK
    )
    :vars
    (
      ?auto_526131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526130 ?auto_526131 ) ( ON-TABLE ?auto_526116 ) ( ON ?auto_526117 ?auto_526116 ) ( ON ?auto_526118 ?auto_526117 ) ( ON ?auto_526119 ?auto_526118 ) ( ON ?auto_526120 ?auto_526119 ) ( ON ?auto_526121 ?auto_526120 ) ( ON ?auto_526122 ?auto_526121 ) ( not ( = ?auto_526116 ?auto_526117 ) ) ( not ( = ?auto_526116 ?auto_526118 ) ) ( not ( = ?auto_526116 ?auto_526119 ) ) ( not ( = ?auto_526116 ?auto_526120 ) ) ( not ( = ?auto_526116 ?auto_526121 ) ) ( not ( = ?auto_526116 ?auto_526122 ) ) ( not ( = ?auto_526116 ?auto_526123 ) ) ( not ( = ?auto_526116 ?auto_526124 ) ) ( not ( = ?auto_526116 ?auto_526125 ) ) ( not ( = ?auto_526116 ?auto_526126 ) ) ( not ( = ?auto_526116 ?auto_526127 ) ) ( not ( = ?auto_526116 ?auto_526128 ) ) ( not ( = ?auto_526116 ?auto_526129 ) ) ( not ( = ?auto_526116 ?auto_526130 ) ) ( not ( = ?auto_526116 ?auto_526131 ) ) ( not ( = ?auto_526117 ?auto_526118 ) ) ( not ( = ?auto_526117 ?auto_526119 ) ) ( not ( = ?auto_526117 ?auto_526120 ) ) ( not ( = ?auto_526117 ?auto_526121 ) ) ( not ( = ?auto_526117 ?auto_526122 ) ) ( not ( = ?auto_526117 ?auto_526123 ) ) ( not ( = ?auto_526117 ?auto_526124 ) ) ( not ( = ?auto_526117 ?auto_526125 ) ) ( not ( = ?auto_526117 ?auto_526126 ) ) ( not ( = ?auto_526117 ?auto_526127 ) ) ( not ( = ?auto_526117 ?auto_526128 ) ) ( not ( = ?auto_526117 ?auto_526129 ) ) ( not ( = ?auto_526117 ?auto_526130 ) ) ( not ( = ?auto_526117 ?auto_526131 ) ) ( not ( = ?auto_526118 ?auto_526119 ) ) ( not ( = ?auto_526118 ?auto_526120 ) ) ( not ( = ?auto_526118 ?auto_526121 ) ) ( not ( = ?auto_526118 ?auto_526122 ) ) ( not ( = ?auto_526118 ?auto_526123 ) ) ( not ( = ?auto_526118 ?auto_526124 ) ) ( not ( = ?auto_526118 ?auto_526125 ) ) ( not ( = ?auto_526118 ?auto_526126 ) ) ( not ( = ?auto_526118 ?auto_526127 ) ) ( not ( = ?auto_526118 ?auto_526128 ) ) ( not ( = ?auto_526118 ?auto_526129 ) ) ( not ( = ?auto_526118 ?auto_526130 ) ) ( not ( = ?auto_526118 ?auto_526131 ) ) ( not ( = ?auto_526119 ?auto_526120 ) ) ( not ( = ?auto_526119 ?auto_526121 ) ) ( not ( = ?auto_526119 ?auto_526122 ) ) ( not ( = ?auto_526119 ?auto_526123 ) ) ( not ( = ?auto_526119 ?auto_526124 ) ) ( not ( = ?auto_526119 ?auto_526125 ) ) ( not ( = ?auto_526119 ?auto_526126 ) ) ( not ( = ?auto_526119 ?auto_526127 ) ) ( not ( = ?auto_526119 ?auto_526128 ) ) ( not ( = ?auto_526119 ?auto_526129 ) ) ( not ( = ?auto_526119 ?auto_526130 ) ) ( not ( = ?auto_526119 ?auto_526131 ) ) ( not ( = ?auto_526120 ?auto_526121 ) ) ( not ( = ?auto_526120 ?auto_526122 ) ) ( not ( = ?auto_526120 ?auto_526123 ) ) ( not ( = ?auto_526120 ?auto_526124 ) ) ( not ( = ?auto_526120 ?auto_526125 ) ) ( not ( = ?auto_526120 ?auto_526126 ) ) ( not ( = ?auto_526120 ?auto_526127 ) ) ( not ( = ?auto_526120 ?auto_526128 ) ) ( not ( = ?auto_526120 ?auto_526129 ) ) ( not ( = ?auto_526120 ?auto_526130 ) ) ( not ( = ?auto_526120 ?auto_526131 ) ) ( not ( = ?auto_526121 ?auto_526122 ) ) ( not ( = ?auto_526121 ?auto_526123 ) ) ( not ( = ?auto_526121 ?auto_526124 ) ) ( not ( = ?auto_526121 ?auto_526125 ) ) ( not ( = ?auto_526121 ?auto_526126 ) ) ( not ( = ?auto_526121 ?auto_526127 ) ) ( not ( = ?auto_526121 ?auto_526128 ) ) ( not ( = ?auto_526121 ?auto_526129 ) ) ( not ( = ?auto_526121 ?auto_526130 ) ) ( not ( = ?auto_526121 ?auto_526131 ) ) ( not ( = ?auto_526122 ?auto_526123 ) ) ( not ( = ?auto_526122 ?auto_526124 ) ) ( not ( = ?auto_526122 ?auto_526125 ) ) ( not ( = ?auto_526122 ?auto_526126 ) ) ( not ( = ?auto_526122 ?auto_526127 ) ) ( not ( = ?auto_526122 ?auto_526128 ) ) ( not ( = ?auto_526122 ?auto_526129 ) ) ( not ( = ?auto_526122 ?auto_526130 ) ) ( not ( = ?auto_526122 ?auto_526131 ) ) ( not ( = ?auto_526123 ?auto_526124 ) ) ( not ( = ?auto_526123 ?auto_526125 ) ) ( not ( = ?auto_526123 ?auto_526126 ) ) ( not ( = ?auto_526123 ?auto_526127 ) ) ( not ( = ?auto_526123 ?auto_526128 ) ) ( not ( = ?auto_526123 ?auto_526129 ) ) ( not ( = ?auto_526123 ?auto_526130 ) ) ( not ( = ?auto_526123 ?auto_526131 ) ) ( not ( = ?auto_526124 ?auto_526125 ) ) ( not ( = ?auto_526124 ?auto_526126 ) ) ( not ( = ?auto_526124 ?auto_526127 ) ) ( not ( = ?auto_526124 ?auto_526128 ) ) ( not ( = ?auto_526124 ?auto_526129 ) ) ( not ( = ?auto_526124 ?auto_526130 ) ) ( not ( = ?auto_526124 ?auto_526131 ) ) ( not ( = ?auto_526125 ?auto_526126 ) ) ( not ( = ?auto_526125 ?auto_526127 ) ) ( not ( = ?auto_526125 ?auto_526128 ) ) ( not ( = ?auto_526125 ?auto_526129 ) ) ( not ( = ?auto_526125 ?auto_526130 ) ) ( not ( = ?auto_526125 ?auto_526131 ) ) ( not ( = ?auto_526126 ?auto_526127 ) ) ( not ( = ?auto_526126 ?auto_526128 ) ) ( not ( = ?auto_526126 ?auto_526129 ) ) ( not ( = ?auto_526126 ?auto_526130 ) ) ( not ( = ?auto_526126 ?auto_526131 ) ) ( not ( = ?auto_526127 ?auto_526128 ) ) ( not ( = ?auto_526127 ?auto_526129 ) ) ( not ( = ?auto_526127 ?auto_526130 ) ) ( not ( = ?auto_526127 ?auto_526131 ) ) ( not ( = ?auto_526128 ?auto_526129 ) ) ( not ( = ?auto_526128 ?auto_526130 ) ) ( not ( = ?auto_526128 ?auto_526131 ) ) ( not ( = ?auto_526129 ?auto_526130 ) ) ( not ( = ?auto_526129 ?auto_526131 ) ) ( not ( = ?auto_526130 ?auto_526131 ) ) ( ON ?auto_526129 ?auto_526130 ) ( ON ?auto_526128 ?auto_526129 ) ( ON ?auto_526127 ?auto_526128 ) ( ON ?auto_526126 ?auto_526127 ) ( ON ?auto_526125 ?auto_526126 ) ( ON ?auto_526124 ?auto_526125 ) ( CLEAR ?auto_526122 ) ( ON ?auto_526123 ?auto_526124 ) ( CLEAR ?auto_526123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_526116 ?auto_526117 ?auto_526118 ?auto_526119 ?auto_526120 ?auto_526121 ?auto_526122 ?auto_526123 )
      ( MAKE-15PILE ?auto_526116 ?auto_526117 ?auto_526118 ?auto_526119 ?auto_526120 ?auto_526121 ?auto_526122 ?auto_526123 ?auto_526124 ?auto_526125 ?auto_526126 ?auto_526127 ?auto_526128 ?auto_526129 ?auto_526130 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_526178 - BLOCK
      ?auto_526179 - BLOCK
      ?auto_526180 - BLOCK
      ?auto_526181 - BLOCK
      ?auto_526182 - BLOCK
      ?auto_526183 - BLOCK
      ?auto_526184 - BLOCK
      ?auto_526185 - BLOCK
      ?auto_526186 - BLOCK
      ?auto_526187 - BLOCK
      ?auto_526188 - BLOCK
      ?auto_526189 - BLOCK
      ?auto_526190 - BLOCK
      ?auto_526191 - BLOCK
      ?auto_526192 - BLOCK
    )
    :vars
    (
      ?auto_526193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526192 ?auto_526193 ) ( ON-TABLE ?auto_526178 ) ( ON ?auto_526179 ?auto_526178 ) ( ON ?auto_526180 ?auto_526179 ) ( ON ?auto_526181 ?auto_526180 ) ( ON ?auto_526182 ?auto_526181 ) ( ON ?auto_526183 ?auto_526182 ) ( not ( = ?auto_526178 ?auto_526179 ) ) ( not ( = ?auto_526178 ?auto_526180 ) ) ( not ( = ?auto_526178 ?auto_526181 ) ) ( not ( = ?auto_526178 ?auto_526182 ) ) ( not ( = ?auto_526178 ?auto_526183 ) ) ( not ( = ?auto_526178 ?auto_526184 ) ) ( not ( = ?auto_526178 ?auto_526185 ) ) ( not ( = ?auto_526178 ?auto_526186 ) ) ( not ( = ?auto_526178 ?auto_526187 ) ) ( not ( = ?auto_526178 ?auto_526188 ) ) ( not ( = ?auto_526178 ?auto_526189 ) ) ( not ( = ?auto_526178 ?auto_526190 ) ) ( not ( = ?auto_526178 ?auto_526191 ) ) ( not ( = ?auto_526178 ?auto_526192 ) ) ( not ( = ?auto_526178 ?auto_526193 ) ) ( not ( = ?auto_526179 ?auto_526180 ) ) ( not ( = ?auto_526179 ?auto_526181 ) ) ( not ( = ?auto_526179 ?auto_526182 ) ) ( not ( = ?auto_526179 ?auto_526183 ) ) ( not ( = ?auto_526179 ?auto_526184 ) ) ( not ( = ?auto_526179 ?auto_526185 ) ) ( not ( = ?auto_526179 ?auto_526186 ) ) ( not ( = ?auto_526179 ?auto_526187 ) ) ( not ( = ?auto_526179 ?auto_526188 ) ) ( not ( = ?auto_526179 ?auto_526189 ) ) ( not ( = ?auto_526179 ?auto_526190 ) ) ( not ( = ?auto_526179 ?auto_526191 ) ) ( not ( = ?auto_526179 ?auto_526192 ) ) ( not ( = ?auto_526179 ?auto_526193 ) ) ( not ( = ?auto_526180 ?auto_526181 ) ) ( not ( = ?auto_526180 ?auto_526182 ) ) ( not ( = ?auto_526180 ?auto_526183 ) ) ( not ( = ?auto_526180 ?auto_526184 ) ) ( not ( = ?auto_526180 ?auto_526185 ) ) ( not ( = ?auto_526180 ?auto_526186 ) ) ( not ( = ?auto_526180 ?auto_526187 ) ) ( not ( = ?auto_526180 ?auto_526188 ) ) ( not ( = ?auto_526180 ?auto_526189 ) ) ( not ( = ?auto_526180 ?auto_526190 ) ) ( not ( = ?auto_526180 ?auto_526191 ) ) ( not ( = ?auto_526180 ?auto_526192 ) ) ( not ( = ?auto_526180 ?auto_526193 ) ) ( not ( = ?auto_526181 ?auto_526182 ) ) ( not ( = ?auto_526181 ?auto_526183 ) ) ( not ( = ?auto_526181 ?auto_526184 ) ) ( not ( = ?auto_526181 ?auto_526185 ) ) ( not ( = ?auto_526181 ?auto_526186 ) ) ( not ( = ?auto_526181 ?auto_526187 ) ) ( not ( = ?auto_526181 ?auto_526188 ) ) ( not ( = ?auto_526181 ?auto_526189 ) ) ( not ( = ?auto_526181 ?auto_526190 ) ) ( not ( = ?auto_526181 ?auto_526191 ) ) ( not ( = ?auto_526181 ?auto_526192 ) ) ( not ( = ?auto_526181 ?auto_526193 ) ) ( not ( = ?auto_526182 ?auto_526183 ) ) ( not ( = ?auto_526182 ?auto_526184 ) ) ( not ( = ?auto_526182 ?auto_526185 ) ) ( not ( = ?auto_526182 ?auto_526186 ) ) ( not ( = ?auto_526182 ?auto_526187 ) ) ( not ( = ?auto_526182 ?auto_526188 ) ) ( not ( = ?auto_526182 ?auto_526189 ) ) ( not ( = ?auto_526182 ?auto_526190 ) ) ( not ( = ?auto_526182 ?auto_526191 ) ) ( not ( = ?auto_526182 ?auto_526192 ) ) ( not ( = ?auto_526182 ?auto_526193 ) ) ( not ( = ?auto_526183 ?auto_526184 ) ) ( not ( = ?auto_526183 ?auto_526185 ) ) ( not ( = ?auto_526183 ?auto_526186 ) ) ( not ( = ?auto_526183 ?auto_526187 ) ) ( not ( = ?auto_526183 ?auto_526188 ) ) ( not ( = ?auto_526183 ?auto_526189 ) ) ( not ( = ?auto_526183 ?auto_526190 ) ) ( not ( = ?auto_526183 ?auto_526191 ) ) ( not ( = ?auto_526183 ?auto_526192 ) ) ( not ( = ?auto_526183 ?auto_526193 ) ) ( not ( = ?auto_526184 ?auto_526185 ) ) ( not ( = ?auto_526184 ?auto_526186 ) ) ( not ( = ?auto_526184 ?auto_526187 ) ) ( not ( = ?auto_526184 ?auto_526188 ) ) ( not ( = ?auto_526184 ?auto_526189 ) ) ( not ( = ?auto_526184 ?auto_526190 ) ) ( not ( = ?auto_526184 ?auto_526191 ) ) ( not ( = ?auto_526184 ?auto_526192 ) ) ( not ( = ?auto_526184 ?auto_526193 ) ) ( not ( = ?auto_526185 ?auto_526186 ) ) ( not ( = ?auto_526185 ?auto_526187 ) ) ( not ( = ?auto_526185 ?auto_526188 ) ) ( not ( = ?auto_526185 ?auto_526189 ) ) ( not ( = ?auto_526185 ?auto_526190 ) ) ( not ( = ?auto_526185 ?auto_526191 ) ) ( not ( = ?auto_526185 ?auto_526192 ) ) ( not ( = ?auto_526185 ?auto_526193 ) ) ( not ( = ?auto_526186 ?auto_526187 ) ) ( not ( = ?auto_526186 ?auto_526188 ) ) ( not ( = ?auto_526186 ?auto_526189 ) ) ( not ( = ?auto_526186 ?auto_526190 ) ) ( not ( = ?auto_526186 ?auto_526191 ) ) ( not ( = ?auto_526186 ?auto_526192 ) ) ( not ( = ?auto_526186 ?auto_526193 ) ) ( not ( = ?auto_526187 ?auto_526188 ) ) ( not ( = ?auto_526187 ?auto_526189 ) ) ( not ( = ?auto_526187 ?auto_526190 ) ) ( not ( = ?auto_526187 ?auto_526191 ) ) ( not ( = ?auto_526187 ?auto_526192 ) ) ( not ( = ?auto_526187 ?auto_526193 ) ) ( not ( = ?auto_526188 ?auto_526189 ) ) ( not ( = ?auto_526188 ?auto_526190 ) ) ( not ( = ?auto_526188 ?auto_526191 ) ) ( not ( = ?auto_526188 ?auto_526192 ) ) ( not ( = ?auto_526188 ?auto_526193 ) ) ( not ( = ?auto_526189 ?auto_526190 ) ) ( not ( = ?auto_526189 ?auto_526191 ) ) ( not ( = ?auto_526189 ?auto_526192 ) ) ( not ( = ?auto_526189 ?auto_526193 ) ) ( not ( = ?auto_526190 ?auto_526191 ) ) ( not ( = ?auto_526190 ?auto_526192 ) ) ( not ( = ?auto_526190 ?auto_526193 ) ) ( not ( = ?auto_526191 ?auto_526192 ) ) ( not ( = ?auto_526191 ?auto_526193 ) ) ( not ( = ?auto_526192 ?auto_526193 ) ) ( ON ?auto_526191 ?auto_526192 ) ( ON ?auto_526190 ?auto_526191 ) ( ON ?auto_526189 ?auto_526190 ) ( ON ?auto_526188 ?auto_526189 ) ( ON ?auto_526187 ?auto_526188 ) ( ON ?auto_526186 ?auto_526187 ) ( ON ?auto_526185 ?auto_526186 ) ( CLEAR ?auto_526183 ) ( ON ?auto_526184 ?auto_526185 ) ( CLEAR ?auto_526184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_526178 ?auto_526179 ?auto_526180 ?auto_526181 ?auto_526182 ?auto_526183 ?auto_526184 )
      ( MAKE-15PILE ?auto_526178 ?auto_526179 ?auto_526180 ?auto_526181 ?auto_526182 ?auto_526183 ?auto_526184 ?auto_526185 ?auto_526186 ?auto_526187 ?auto_526188 ?auto_526189 ?auto_526190 ?auto_526191 ?auto_526192 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_526240 - BLOCK
      ?auto_526241 - BLOCK
      ?auto_526242 - BLOCK
      ?auto_526243 - BLOCK
      ?auto_526244 - BLOCK
      ?auto_526245 - BLOCK
      ?auto_526246 - BLOCK
      ?auto_526247 - BLOCK
      ?auto_526248 - BLOCK
      ?auto_526249 - BLOCK
      ?auto_526250 - BLOCK
      ?auto_526251 - BLOCK
      ?auto_526252 - BLOCK
      ?auto_526253 - BLOCK
      ?auto_526254 - BLOCK
    )
    :vars
    (
      ?auto_526255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526254 ?auto_526255 ) ( ON-TABLE ?auto_526240 ) ( ON ?auto_526241 ?auto_526240 ) ( ON ?auto_526242 ?auto_526241 ) ( ON ?auto_526243 ?auto_526242 ) ( ON ?auto_526244 ?auto_526243 ) ( not ( = ?auto_526240 ?auto_526241 ) ) ( not ( = ?auto_526240 ?auto_526242 ) ) ( not ( = ?auto_526240 ?auto_526243 ) ) ( not ( = ?auto_526240 ?auto_526244 ) ) ( not ( = ?auto_526240 ?auto_526245 ) ) ( not ( = ?auto_526240 ?auto_526246 ) ) ( not ( = ?auto_526240 ?auto_526247 ) ) ( not ( = ?auto_526240 ?auto_526248 ) ) ( not ( = ?auto_526240 ?auto_526249 ) ) ( not ( = ?auto_526240 ?auto_526250 ) ) ( not ( = ?auto_526240 ?auto_526251 ) ) ( not ( = ?auto_526240 ?auto_526252 ) ) ( not ( = ?auto_526240 ?auto_526253 ) ) ( not ( = ?auto_526240 ?auto_526254 ) ) ( not ( = ?auto_526240 ?auto_526255 ) ) ( not ( = ?auto_526241 ?auto_526242 ) ) ( not ( = ?auto_526241 ?auto_526243 ) ) ( not ( = ?auto_526241 ?auto_526244 ) ) ( not ( = ?auto_526241 ?auto_526245 ) ) ( not ( = ?auto_526241 ?auto_526246 ) ) ( not ( = ?auto_526241 ?auto_526247 ) ) ( not ( = ?auto_526241 ?auto_526248 ) ) ( not ( = ?auto_526241 ?auto_526249 ) ) ( not ( = ?auto_526241 ?auto_526250 ) ) ( not ( = ?auto_526241 ?auto_526251 ) ) ( not ( = ?auto_526241 ?auto_526252 ) ) ( not ( = ?auto_526241 ?auto_526253 ) ) ( not ( = ?auto_526241 ?auto_526254 ) ) ( not ( = ?auto_526241 ?auto_526255 ) ) ( not ( = ?auto_526242 ?auto_526243 ) ) ( not ( = ?auto_526242 ?auto_526244 ) ) ( not ( = ?auto_526242 ?auto_526245 ) ) ( not ( = ?auto_526242 ?auto_526246 ) ) ( not ( = ?auto_526242 ?auto_526247 ) ) ( not ( = ?auto_526242 ?auto_526248 ) ) ( not ( = ?auto_526242 ?auto_526249 ) ) ( not ( = ?auto_526242 ?auto_526250 ) ) ( not ( = ?auto_526242 ?auto_526251 ) ) ( not ( = ?auto_526242 ?auto_526252 ) ) ( not ( = ?auto_526242 ?auto_526253 ) ) ( not ( = ?auto_526242 ?auto_526254 ) ) ( not ( = ?auto_526242 ?auto_526255 ) ) ( not ( = ?auto_526243 ?auto_526244 ) ) ( not ( = ?auto_526243 ?auto_526245 ) ) ( not ( = ?auto_526243 ?auto_526246 ) ) ( not ( = ?auto_526243 ?auto_526247 ) ) ( not ( = ?auto_526243 ?auto_526248 ) ) ( not ( = ?auto_526243 ?auto_526249 ) ) ( not ( = ?auto_526243 ?auto_526250 ) ) ( not ( = ?auto_526243 ?auto_526251 ) ) ( not ( = ?auto_526243 ?auto_526252 ) ) ( not ( = ?auto_526243 ?auto_526253 ) ) ( not ( = ?auto_526243 ?auto_526254 ) ) ( not ( = ?auto_526243 ?auto_526255 ) ) ( not ( = ?auto_526244 ?auto_526245 ) ) ( not ( = ?auto_526244 ?auto_526246 ) ) ( not ( = ?auto_526244 ?auto_526247 ) ) ( not ( = ?auto_526244 ?auto_526248 ) ) ( not ( = ?auto_526244 ?auto_526249 ) ) ( not ( = ?auto_526244 ?auto_526250 ) ) ( not ( = ?auto_526244 ?auto_526251 ) ) ( not ( = ?auto_526244 ?auto_526252 ) ) ( not ( = ?auto_526244 ?auto_526253 ) ) ( not ( = ?auto_526244 ?auto_526254 ) ) ( not ( = ?auto_526244 ?auto_526255 ) ) ( not ( = ?auto_526245 ?auto_526246 ) ) ( not ( = ?auto_526245 ?auto_526247 ) ) ( not ( = ?auto_526245 ?auto_526248 ) ) ( not ( = ?auto_526245 ?auto_526249 ) ) ( not ( = ?auto_526245 ?auto_526250 ) ) ( not ( = ?auto_526245 ?auto_526251 ) ) ( not ( = ?auto_526245 ?auto_526252 ) ) ( not ( = ?auto_526245 ?auto_526253 ) ) ( not ( = ?auto_526245 ?auto_526254 ) ) ( not ( = ?auto_526245 ?auto_526255 ) ) ( not ( = ?auto_526246 ?auto_526247 ) ) ( not ( = ?auto_526246 ?auto_526248 ) ) ( not ( = ?auto_526246 ?auto_526249 ) ) ( not ( = ?auto_526246 ?auto_526250 ) ) ( not ( = ?auto_526246 ?auto_526251 ) ) ( not ( = ?auto_526246 ?auto_526252 ) ) ( not ( = ?auto_526246 ?auto_526253 ) ) ( not ( = ?auto_526246 ?auto_526254 ) ) ( not ( = ?auto_526246 ?auto_526255 ) ) ( not ( = ?auto_526247 ?auto_526248 ) ) ( not ( = ?auto_526247 ?auto_526249 ) ) ( not ( = ?auto_526247 ?auto_526250 ) ) ( not ( = ?auto_526247 ?auto_526251 ) ) ( not ( = ?auto_526247 ?auto_526252 ) ) ( not ( = ?auto_526247 ?auto_526253 ) ) ( not ( = ?auto_526247 ?auto_526254 ) ) ( not ( = ?auto_526247 ?auto_526255 ) ) ( not ( = ?auto_526248 ?auto_526249 ) ) ( not ( = ?auto_526248 ?auto_526250 ) ) ( not ( = ?auto_526248 ?auto_526251 ) ) ( not ( = ?auto_526248 ?auto_526252 ) ) ( not ( = ?auto_526248 ?auto_526253 ) ) ( not ( = ?auto_526248 ?auto_526254 ) ) ( not ( = ?auto_526248 ?auto_526255 ) ) ( not ( = ?auto_526249 ?auto_526250 ) ) ( not ( = ?auto_526249 ?auto_526251 ) ) ( not ( = ?auto_526249 ?auto_526252 ) ) ( not ( = ?auto_526249 ?auto_526253 ) ) ( not ( = ?auto_526249 ?auto_526254 ) ) ( not ( = ?auto_526249 ?auto_526255 ) ) ( not ( = ?auto_526250 ?auto_526251 ) ) ( not ( = ?auto_526250 ?auto_526252 ) ) ( not ( = ?auto_526250 ?auto_526253 ) ) ( not ( = ?auto_526250 ?auto_526254 ) ) ( not ( = ?auto_526250 ?auto_526255 ) ) ( not ( = ?auto_526251 ?auto_526252 ) ) ( not ( = ?auto_526251 ?auto_526253 ) ) ( not ( = ?auto_526251 ?auto_526254 ) ) ( not ( = ?auto_526251 ?auto_526255 ) ) ( not ( = ?auto_526252 ?auto_526253 ) ) ( not ( = ?auto_526252 ?auto_526254 ) ) ( not ( = ?auto_526252 ?auto_526255 ) ) ( not ( = ?auto_526253 ?auto_526254 ) ) ( not ( = ?auto_526253 ?auto_526255 ) ) ( not ( = ?auto_526254 ?auto_526255 ) ) ( ON ?auto_526253 ?auto_526254 ) ( ON ?auto_526252 ?auto_526253 ) ( ON ?auto_526251 ?auto_526252 ) ( ON ?auto_526250 ?auto_526251 ) ( ON ?auto_526249 ?auto_526250 ) ( ON ?auto_526248 ?auto_526249 ) ( ON ?auto_526247 ?auto_526248 ) ( ON ?auto_526246 ?auto_526247 ) ( CLEAR ?auto_526244 ) ( ON ?auto_526245 ?auto_526246 ) ( CLEAR ?auto_526245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_526240 ?auto_526241 ?auto_526242 ?auto_526243 ?auto_526244 ?auto_526245 )
      ( MAKE-15PILE ?auto_526240 ?auto_526241 ?auto_526242 ?auto_526243 ?auto_526244 ?auto_526245 ?auto_526246 ?auto_526247 ?auto_526248 ?auto_526249 ?auto_526250 ?auto_526251 ?auto_526252 ?auto_526253 ?auto_526254 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_526302 - BLOCK
      ?auto_526303 - BLOCK
      ?auto_526304 - BLOCK
      ?auto_526305 - BLOCK
      ?auto_526306 - BLOCK
      ?auto_526307 - BLOCK
      ?auto_526308 - BLOCK
      ?auto_526309 - BLOCK
      ?auto_526310 - BLOCK
      ?auto_526311 - BLOCK
      ?auto_526312 - BLOCK
      ?auto_526313 - BLOCK
      ?auto_526314 - BLOCK
      ?auto_526315 - BLOCK
      ?auto_526316 - BLOCK
    )
    :vars
    (
      ?auto_526317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526316 ?auto_526317 ) ( ON-TABLE ?auto_526302 ) ( ON ?auto_526303 ?auto_526302 ) ( ON ?auto_526304 ?auto_526303 ) ( ON ?auto_526305 ?auto_526304 ) ( not ( = ?auto_526302 ?auto_526303 ) ) ( not ( = ?auto_526302 ?auto_526304 ) ) ( not ( = ?auto_526302 ?auto_526305 ) ) ( not ( = ?auto_526302 ?auto_526306 ) ) ( not ( = ?auto_526302 ?auto_526307 ) ) ( not ( = ?auto_526302 ?auto_526308 ) ) ( not ( = ?auto_526302 ?auto_526309 ) ) ( not ( = ?auto_526302 ?auto_526310 ) ) ( not ( = ?auto_526302 ?auto_526311 ) ) ( not ( = ?auto_526302 ?auto_526312 ) ) ( not ( = ?auto_526302 ?auto_526313 ) ) ( not ( = ?auto_526302 ?auto_526314 ) ) ( not ( = ?auto_526302 ?auto_526315 ) ) ( not ( = ?auto_526302 ?auto_526316 ) ) ( not ( = ?auto_526302 ?auto_526317 ) ) ( not ( = ?auto_526303 ?auto_526304 ) ) ( not ( = ?auto_526303 ?auto_526305 ) ) ( not ( = ?auto_526303 ?auto_526306 ) ) ( not ( = ?auto_526303 ?auto_526307 ) ) ( not ( = ?auto_526303 ?auto_526308 ) ) ( not ( = ?auto_526303 ?auto_526309 ) ) ( not ( = ?auto_526303 ?auto_526310 ) ) ( not ( = ?auto_526303 ?auto_526311 ) ) ( not ( = ?auto_526303 ?auto_526312 ) ) ( not ( = ?auto_526303 ?auto_526313 ) ) ( not ( = ?auto_526303 ?auto_526314 ) ) ( not ( = ?auto_526303 ?auto_526315 ) ) ( not ( = ?auto_526303 ?auto_526316 ) ) ( not ( = ?auto_526303 ?auto_526317 ) ) ( not ( = ?auto_526304 ?auto_526305 ) ) ( not ( = ?auto_526304 ?auto_526306 ) ) ( not ( = ?auto_526304 ?auto_526307 ) ) ( not ( = ?auto_526304 ?auto_526308 ) ) ( not ( = ?auto_526304 ?auto_526309 ) ) ( not ( = ?auto_526304 ?auto_526310 ) ) ( not ( = ?auto_526304 ?auto_526311 ) ) ( not ( = ?auto_526304 ?auto_526312 ) ) ( not ( = ?auto_526304 ?auto_526313 ) ) ( not ( = ?auto_526304 ?auto_526314 ) ) ( not ( = ?auto_526304 ?auto_526315 ) ) ( not ( = ?auto_526304 ?auto_526316 ) ) ( not ( = ?auto_526304 ?auto_526317 ) ) ( not ( = ?auto_526305 ?auto_526306 ) ) ( not ( = ?auto_526305 ?auto_526307 ) ) ( not ( = ?auto_526305 ?auto_526308 ) ) ( not ( = ?auto_526305 ?auto_526309 ) ) ( not ( = ?auto_526305 ?auto_526310 ) ) ( not ( = ?auto_526305 ?auto_526311 ) ) ( not ( = ?auto_526305 ?auto_526312 ) ) ( not ( = ?auto_526305 ?auto_526313 ) ) ( not ( = ?auto_526305 ?auto_526314 ) ) ( not ( = ?auto_526305 ?auto_526315 ) ) ( not ( = ?auto_526305 ?auto_526316 ) ) ( not ( = ?auto_526305 ?auto_526317 ) ) ( not ( = ?auto_526306 ?auto_526307 ) ) ( not ( = ?auto_526306 ?auto_526308 ) ) ( not ( = ?auto_526306 ?auto_526309 ) ) ( not ( = ?auto_526306 ?auto_526310 ) ) ( not ( = ?auto_526306 ?auto_526311 ) ) ( not ( = ?auto_526306 ?auto_526312 ) ) ( not ( = ?auto_526306 ?auto_526313 ) ) ( not ( = ?auto_526306 ?auto_526314 ) ) ( not ( = ?auto_526306 ?auto_526315 ) ) ( not ( = ?auto_526306 ?auto_526316 ) ) ( not ( = ?auto_526306 ?auto_526317 ) ) ( not ( = ?auto_526307 ?auto_526308 ) ) ( not ( = ?auto_526307 ?auto_526309 ) ) ( not ( = ?auto_526307 ?auto_526310 ) ) ( not ( = ?auto_526307 ?auto_526311 ) ) ( not ( = ?auto_526307 ?auto_526312 ) ) ( not ( = ?auto_526307 ?auto_526313 ) ) ( not ( = ?auto_526307 ?auto_526314 ) ) ( not ( = ?auto_526307 ?auto_526315 ) ) ( not ( = ?auto_526307 ?auto_526316 ) ) ( not ( = ?auto_526307 ?auto_526317 ) ) ( not ( = ?auto_526308 ?auto_526309 ) ) ( not ( = ?auto_526308 ?auto_526310 ) ) ( not ( = ?auto_526308 ?auto_526311 ) ) ( not ( = ?auto_526308 ?auto_526312 ) ) ( not ( = ?auto_526308 ?auto_526313 ) ) ( not ( = ?auto_526308 ?auto_526314 ) ) ( not ( = ?auto_526308 ?auto_526315 ) ) ( not ( = ?auto_526308 ?auto_526316 ) ) ( not ( = ?auto_526308 ?auto_526317 ) ) ( not ( = ?auto_526309 ?auto_526310 ) ) ( not ( = ?auto_526309 ?auto_526311 ) ) ( not ( = ?auto_526309 ?auto_526312 ) ) ( not ( = ?auto_526309 ?auto_526313 ) ) ( not ( = ?auto_526309 ?auto_526314 ) ) ( not ( = ?auto_526309 ?auto_526315 ) ) ( not ( = ?auto_526309 ?auto_526316 ) ) ( not ( = ?auto_526309 ?auto_526317 ) ) ( not ( = ?auto_526310 ?auto_526311 ) ) ( not ( = ?auto_526310 ?auto_526312 ) ) ( not ( = ?auto_526310 ?auto_526313 ) ) ( not ( = ?auto_526310 ?auto_526314 ) ) ( not ( = ?auto_526310 ?auto_526315 ) ) ( not ( = ?auto_526310 ?auto_526316 ) ) ( not ( = ?auto_526310 ?auto_526317 ) ) ( not ( = ?auto_526311 ?auto_526312 ) ) ( not ( = ?auto_526311 ?auto_526313 ) ) ( not ( = ?auto_526311 ?auto_526314 ) ) ( not ( = ?auto_526311 ?auto_526315 ) ) ( not ( = ?auto_526311 ?auto_526316 ) ) ( not ( = ?auto_526311 ?auto_526317 ) ) ( not ( = ?auto_526312 ?auto_526313 ) ) ( not ( = ?auto_526312 ?auto_526314 ) ) ( not ( = ?auto_526312 ?auto_526315 ) ) ( not ( = ?auto_526312 ?auto_526316 ) ) ( not ( = ?auto_526312 ?auto_526317 ) ) ( not ( = ?auto_526313 ?auto_526314 ) ) ( not ( = ?auto_526313 ?auto_526315 ) ) ( not ( = ?auto_526313 ?auto_526316 ) ) ( not ( = ?auto_526313 ?auto_526317 ) ) ( not ( = ?auto_526314 ?auto_526315 ) ) ( not ( = ?auto_526314 ?auto_526316 ) ) ( not ( = ?auto_526314 ?auto_526317 ) ) ( not ( = ?auto_526315 ?auto_526316 ) ) ( not ( = ?auto_526315 ?auto_526317 ) ) ( not ( = ?auto_526316 ?auto_526317 ) ) ( ON ?auto_526315 ?auto_526316 ) ( ON ?auto_526314 ?auto_526315 ) ( ON ?auto_526313 ?auto_526314 ) ( ON ?auto_526312 ?auto_526313 ) ( ON ?auto_526311 ?auto_526312 ) ( ON ?auto_526310 ?auto_526311 ) ( ON ?auto_526309 ?auto_526310 ) ( ON ?auto_526308 ?auto_526309 ) ( ON ?auto_526307 ?auto_526308 ) ( CLEAR ?auto_526305 ) ( ON ?auto_526306 ?auto_526307 ) ( CLEAR ?auto_526306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_526302 ?auto_526303 ?auto_526304 ?auto_526305 ?auto_526306 )
      ( MAKE-15PILE ?auto_526302 ?auto_526303 ?auto_526304 ?auto_526305 ?auto_526306 ?auto_526307 ?auto_526308 ?auto_526309 ?auto_526310 ?auto_526311 ?auto_526312 ?auto_526313 ?auto_526314 ?auto_526315 ?auto_526316 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_526364 - BLOCK
      ?auto_526365 - BLOCK
      ?auto_526366 - BLOCK
      ?auto_526367 - BLOCK
      ?auto_526368 - BLOCK
      ?auto_526369 - BLOCK
      ?auto_526370 - BLOCK
      ?auto_526371 - BLOCK
      ?auto_526372 - BLOCK
      ?auto_526373 - BLOCK
      ?auto_526374 - BLOCK
      ?auto_526375 - BLOCK
      ?auto_526376 - BLOCK
      ?auto_526377 - BLOCK
      ?auto_526378 - BLOCK
    )
    :vars
    (
      ?auto_526379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526378 ?auto_526379 ) ( ON-TABLE ?auto_526364 ) ( ON ?auto_526365 ?auto_526364 ) ( ON ?auto_526366 ?auto_526365 ) ( not ( = ?auto_526364 ?auto_526365 ) ) ( not ( = ?auto_526364 ?auto_526366 ) ) ( not ( = ?auto_526364 ?auto_526367 ) ) ( not ( = ?auto_526364 ?auto_526368 ) ) ( not ( = ?auto_526364 ?auto_526369 ) ) ( not ( = ?auto_526364 ?auto_526370 ) ) ( not ( = ?auto_526364 ?auto_526371 ) ) ( not ( = ?auto_526364 ?auto_526372 ) ) ( not ( = ?auto_526364 ?auto_526373 ) ) ( not ( = ?auto_526364 ?auto_526374 ) ) ( not ( = ?auto_526364 ?auto_526375 ) ) ( not ( = ?auto_526364 ?auto_526376 ) ) ( not ( = ?auto_526364 ?auto_526377 ) ) ( not ( = ?auto_526364 ?auto_526378 ) ) ( not ( = ?auto_526364 ?auto_526379 ) ) ( not ( = ?auto_526365 ?auto_526366 ) ) ( not ( = ?auto_526365 ?auto_526367 ) ) ( not ( = ?auto_526365 ?auto_526368 ) ) ( not ( = ?auto_526365 ?auto_526369 ) ) ( not ( = ?auto_526365 ?auto_526370 ) ) ( not ( = ?auto_526365 ?auto_526371 ) ) ( not ( = ?auto_526365 ?auto_526372 ) ) ( not ( = ?auto_526365 ?auto_526373 ) ) ( not ( = ?auto_526365 ?auto_526374 ) ) ( not ( = ?auto_526365 ?auto_526375 ) ) ( not ( = ?auto_526365 ?auto_526376 ) ) ( not ( = ?auto_526365 ?auto_526377 ) ) ( not ( = ?auto_526365 ?auto_526378 ) ) ( not ( = ?auto_526365 ?auto_526379 ) ) ( not ( = ?auto_526366 ?auto_526367 ) ) ( not ( = ?auto_526366 ?auto_526368 ) ) ( not ( = ?auto_526366 ?auto_526369 ) ) ( not ( = ?auto_526366 ?auto_526370 ) ) ( not ( = ?auto_526366 ?auto_526371 ) ) ( not ( = ?auto_526366 ?auto_526372 ) ) ( not ( = ?auto_526366 ?auto_526373 ) ) ( not ( = ?auto_526366 ?auto_526374 ) ) ( not ( = ?auto_526366 ?auto_526375 ) ) ( not ( = ?auto_526366 ?auto_526376 ) ) ( not ( = ?auto_526366 ?auto_526377 ) ) ( not ( = ?auto_526366 ?auto_526378 ) ) ( not ( = ?auto_526366 ?auto_526379 ) ) ( not ( = ?auto_526367 ?auto_526368 ) ) ( not ( = ?auto_526367 ?auto_526369 ) ) ( not ( = ?auto_526367 ?auto_526370 ) ) ( not ( = ?auto_526367 ?auto_526371 ) ) ( not ( = ?auto_526367 ?auto_526372 ) ) ( not ( = ?auto_526367 ?auto_526373 ) ) ( not ( = ?auto_526367 ?auto_526374 ) ) ( not ( = ?auto_526367 ?auto_526375 ) ) ( not ( = ?auto_526367 ?auto_526376 ) ) ( not ( = ?auto_526367 ?auto_526377 ) ) ( not ( = ?auto_526367 ?auto_526378 ) ) ( not ( = ?auto_526367 ?auto_526379 ) ) ( not ( = ?auto_526368 ?auto_526369 ) ) ( not ( = ?auto_526368 ?auto_526370 ) ) ( not ( = ?auto_526368 ?auto_526371 ) ) ( not ( = ?auto_526368 ?auto_526372 ) ) ( not ( = ?auto_526368 ?auto_526373 ) ) ( not ( = ?auto_526368 ?auto_526374 ) ) ( not ( = ?auto_526368 ?auto_526375 ) ) ( not ( = ?auto_526368 ?auto_526376 ) ) ( not ( = ?auto_526368 ?auto_526377 ) ) ( not ( = ?auto_526368 ?auto_526378 ) ) ( not ( = ?auto_526368 ?auto_526379 ) ) ( not ( = ?auto_526369 ?auto_526370 ) ) ( not ( = ?auto_526369 ?auto_526371 ) ) ( not ( = ?auto_526369 ?auto_526372 ) ) ( not ( = ?auto_526369 ?auto_526373 ) ) ( not ( = ?auto_526369 ?auto_526374 ) ) ( not ( = ?auto_526369 ?auto_526375 ) ) ( not ( = ?auto_526369 ?auto_526376 ) ) ( not ( = ?auto_526369 ?auto_526377 ) ) ( not ( = ?auto_526369 ?auto_526378 ) ) ( not ( = ?auto_526369 ?auto_526379 ) ) ( not ( = ?auto_526370 ?auto_526371 ) ) ( not ( = ?auto_526370 ?auto_526372 ) ) ( not ( = ?auto_526370 ?auto_526373 ) ) ( not ( = ?auto_526370 ?auto_526374 ) ) ( not ( = ?auto_526370 ?auto_526375 ) ) ( not ( = ?auto_526370 ?auto_526376 ) ) ( not ( = ?auto_526370 ?auto_526377 ) ) ( not ( = ?auto_526370 ?auto_526378 ) ) ( not ( = ?auto_526370 ?auto_526379 ) ) ( not ( = ?auto_526371 ?auto_526372 ) ) ( not ( = ?auto_526371 ?auto_526373 ) ) ( not ( = ?auto_526371 ?auto_526374 ) ) ( not ( = ?auto_526371 ?auto_526375 ) ) ( not ( = ?auto_526371 ?auto_526376 ) ) ( not ( = ?auto_526371 ?auto_526377 ) ) ( not ( = ?auto_526371 ?auto_526378 ) ) ( not ( = ?auto_526371 ?auto_526379 ) ) ( not ( = ?auto_526372 ?auto_526373 ) ) ( not ( = ?auto_526372 ?auto_526374 ) ) ( not ( = ?auto_526372 ?auto_526375 ) ) ( not ( = ?auto_526372 ?auto_526376 ) ) ( not ( = ?auto_526372 ?auto_526377 ) ) ( not ( = ?auto_526372 ?auto_526378 ) ) ( not ( = ?auto_526372 ?auto_526379 ) ) ( not ( = ?auto_526373 ?auto_526374 ) ) ( not ( = ?auto_526373 ?auto_526375 ) ) ( not ( = ?auto_526373 ?auto_526376 ) ) ( not ( = ?auto_526373 ?auto_526377 ) ) ( not ( = ?auto_526373 ?auto_526378 ) ) ( not ( = ?auto_526373 ?auto_526379 ) ) ( not ( = ?auto_526374 ?auto_526375 ) ) ( not ( = ?auto_526374 ?auto_526376 ) ) ( not ( = ?auto_526374 ?auto_526377 ) ) ( not ( = ?auto_526374 ?auto_526378 ) ) ( not ( = ?auto_526374 ?auto_526379 ) ) ( not ( = ?auto_526375 ?auto_526376 ) ) ( not ( = ?auto_526375 ?auto_526377 ) ) ( not ( = ?auto_526375 ?auto_526378 ) ) ( not ( = ?auto_526375 ?auto_526379 ) ) ( not ( = ?auto_526376 ?auto_526377 ) ) ( not ( = ?auto_526376 ?auto_526378 ) ) ( not ( = ?auto_526376 ?auto_526379 ) ) ( not ( = ?auto_526377 ?auto_526378 ) ) ( not ( = ?auto_526377 ?auto_526379 ) ) ( not ( = ?auto_526378 ?auto_526379 ) ) ( ON ?auto_526377 ?auto_526378 ) ( ON ?auto_526376 ?auto_526377 ) ( ON ?auto_526375 ?auto_526376 ) ( ON ?auto_526374 ?auto_526375 ) ( ON ?auto_526373 ?auto_526374 ) ( ON ?auto_526372 ?auto_526373 ) ( ON ?auto_526371 ?auto_526372 ) ( ON ?auto_526370 ?auto_526371 ) ( ON ?auto_526369 ?auto_526370 ) ( ON ?auto_526368 ?auto_526369 ) ( CLEAR ?auto_526366 ) ( ON ?auto_526367 ?auto_526368 ) ( CLEAR ?auto_526367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_526364 ?auto_526365 ?auto_526366 ?auto_526367 )
      ( MAKE-15PILE ?auto_526364 ?auto_526365 ?auto_526366 ?auto_526367 ?auto_526368 ?auto_526369 ?auto_526370 ?auto_526371 ?auto_526372 ?auto_526373 ?auto_526374 ?auto_526375 ?auto_526376 ?auto_526377 ?auto_526378 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_526426 - BLOCK
      ?auto_526427 - BLOCK
      ?auto_526428 - BLOCK
      ?auto_526429 - BLOCK
      ?auto_526430 - BLOCK
      ?auto_526431 - BLOCK
      ?auto_526432 - BLOCK
      ?auto_526433 - BLOCK
      ?auto_526434 - BLOCK
      ?auto_526435 - BLOCK
      ?auto_526436 - BLOCK
      ?auto_526437 - BLOCK
      ?auto_526438 - BLOCK
      ?auto_526439 - BLOCK
      ?auto_526440 - BLOCK
    )
    :vars
    (
      ?auto_526441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526440 ?auto_526441 ) ( ON-TABLE ?auto_526426 ) ( ON ?auto_526427 ?auto_526426 ) ( not ( = ?auto_526426 ?auto_526427 ) ) ( not ( = ?auto_526426 ?auto_526428 ) ) ( not ( = ?auto_526426 ?auto_526429 ) ) ( not ( = ?auto_526426 ?auto_526430 ) ) ( not ( = ?auto_526426 ?auto_526431 ) ) ( not ( = ?auto_526426 ?auto_526432 ) ) ( not ( = ?auto_526426 ?auto_526433 ) ) ( not ( = ?auto_526426 ?auto_526434 ) ) ( not ( = ?auto_526426 ?auto_526435 ) ) ( not ( = ?auto_526426 ?auto_526436 ) ) ( not ( = ?auto_526426 ?auto_526437 ) ) ( not ( = ?auto_526426 ?auto_526438 ) ) ( not ( = ?auto_526426 ?auto_526439 ) ) ( not ( = ?auto_526426 ?auto_526440 ) ) ( not ( = ?auto_526426 ?auto_526441 ) ) ( not ( = ?auto_526427 ?auto_526428 ) ) ( not ( = ?auto_526427 ?auto_526429 ) ) ( not ( = ?auto_526427 ?auto_526430 ) ) ( not ( = ?auto_526427 ?auto_526431 ) ) ( not ( = ?auto_526427 ?auto_526432 ) ) ( not ( = ?auto_526427 ?auto_526433 ) ) ( not ( = ?auto_526427 ?auto_526434 ) ) ( not ( = ?auto_526427 ?auto_526435 ) ) ( not ( = ?auto_526427 ?auto_526436 ) ) ( not ( = ?auto_526427 ?auto_526437 ) ) ( not ( = ?auto_526427 ?auto_526438 ) ) ( not ( = ?auto_526427 ?auto_526439 ) ) ( not ( = ?auto_526427 ?auto_526440 ) ) ( not ( = ?auto_526427 ?auto_526441 ) ) ( not ( = ?auto_526428 ?auto_526429 ) ) ( not ( = ?auto_526428 ?auto_526430 ) ) ( not ( = ?auto_526428 ?auto_526431 ) ) ( not ( = ?auto_526428 ?auto_526432 ) ) ( not ( = ?auto_526428 ?auto_526433 ) ) ( not ( = ?auto_526428 ?auto_526434 ) ) ( not ( = ?auto_526428 ?auto_526435 ) ) ( not ( = ?auto_526428 ?auto_526436 ) ) ( not ( = ?auto_526428 ?auto_526437 ) ) ( not ( = ?auto_526428 ?auto_526438 ) ) ( not ( = ?auto_526428 ?auto_526439 ) ) ( not ( = ?auto_526428 ?auto_526440 ) ) ( not ( = ?auto_526428 ?auto_526441 ) ) ( not ( = ?auto_526429 ?auto_526430 ) ) ( not ( = ?auto_526429 ?auto_526431 ) ) ( not ( = ?auto_526429 ?auto_526432 ) ) ( not ( = ?auto_526429 ?auto_526433 ) ) ( not ( = ?auto_526429 ?auto_526434 ) ) ( not ( = ?auto_526429 ?auto_526435 ) ) ( not ( = ?auto_526429 ?auto_526436 ) ) ( not ( = ?auto_526429 ?auto_526437 ) ) ( not ( = ?auto_526429 ?auto_526438 ) ) ( not ( = ?auto_526429 ?auto_526439 ) ) ( not ( = ?auto_526429 ?auto_526440 ) ) ( not ( = ?auto_526429 ?auto_526441 ) ) ( not ( = ?auto_526430 ?auto_526431 ) ) ( not ( = ?auto_526430 ?auto_526432 ) ) ( not ( = ?auto_526430 ?auto_526433 ) ) ( not ( = ?auto_526430 ?auto_526434 ) ) ( not ( = ?auto_526430 ?auto_526435 ) ) ( not ( = ?auto_526430 ?auto_526436 ) ) ( not ( = ?auto_526430 ?auto_526437 ) ) ( not ( = ?auto_526430 ?auto_526438 ) ) ( not ( = ?auto_526430 ?auto_526439 ) ) ( not ( = ?auto_526430 ?auto_526440 ) ) ( not ( = ?auto_526430 ?auto_526441 ) ) ( not ( = ?auto_526431 ?auto_526432 ) ) ( not ( = ?auto_526431 ?auto_526433 ) ) ( not ( = ?auto_526431 ?auto_526434 ) ) ( not ( = ?auto_526431 ?auto_526435 ) ) ( not ( = ?auto_526431 ?auto_526436 ) ) ( not ( = ?auto_526431 ?auto_526437 ) ) ( not ( = ?auto_526431 ?auto_526438 ) ) ( not ( = ?auto_526431 ?auto_526439 ) ) ( not ( = ?auto_526431 ?auto_526440 ) ) ( not ( = ?auto_526431 ?auto_526441 ) ) ( not ( = ?auto_526432 ?auto_526433 ) ) ( not ( = ?auto_526432 ?auto_526434 ) ) ( not ( = ?auto_526432 ?auto_526435 ) ) ( not ( = ?auto_526432 ?auto_526436 ) ) ( not ( = ?auto_526432 ?auto_526437 ) ) ( not ( = ?auto_526432 ?auto_526438 ) ) ( not ( = ?auto_526432 ?auto_526439 ) ) ( not ( = ?auto_526432 ?auto_526440 ) ) ( not ( = ?auto_526432 ?auto_526441 ) ) ( not ( = ?auto_526433 ?auto_526434 ) ) ( not ( = ?auto_526433 ?auto_526435 ) ) ( not ( = ?auto_526433 ?auto_526436 ) ) ( not ( = ?auto_526433 ?auto_526437 ) ) ( not ( = ?auto_526433 ?auto_526438 ) ) ( not ( = ?auto_526433 ?auto_526439 ) ) ( not ( = ?auto_526433 ?auto_526440 ) ) ( not ( = ?auto_526433 ?auto_526441 ) ) ( not ( = ?auto_526434 ?auto_526435 ) ) ( not ( = ?auto_526434 ?auto_526436 ) ) ( not ( = ?auto_526434 ?auto_526437 ) ) ( not ( = ?auto_526434 ?auto_526438 ) ) ( not ( = ?auto_526434 ?auto_526439 ) ) ( not ( = ?auto_526434 ?auto_526440 ) ) ( not ( = ?auto_526434 ?auto_526441 ) ) ( not ( = ?auto_526435 ?auto_526436 ) ) ( not ( = ?auto_526435 ?auto_526437 ) ) ( not ( = ?auto_526435 ?auto_526438 ) ) ( not ( = ?auto_526435 ?auto_526439 ) ) ( not ( = ?auto_526435 ?auto_526440 ) ) ( not ( = ?auto_526435 ?auto_526441 ) ) ( not ( = ?auto_526436 ?auto_526437 ) ) ( not ( = ?auto_526436 ?auto_526438 ) ) ( not ( = ?auto_526436 ?auto_526439 ) ) ( not ( = ?auto_526436 ?auto_526440 ) ) ( not ( = ?auto_526436 ?auto_526441 ) ) ( not ( = ?auto_526437 ?auto_526438 ) ) ( not ( = ?auto_526437 ?auto_526439 ) ) ( not ( = ?auto_526437 ?auto_526440 ) ) ( not ( = ?auto_526437 ?auto_526441 ) ) ( not ( = ?auto_526438 ?auto_526439 ) ) ( not ( = ?auto_526438 ?auto_526440 ) ) ( not ( = ?auto_526438 ?auto_526441 ) ) ( not ( = ?auto_526439 ?auto_526440 ) ) ( not ( = ?auto_526439 ?auto_526441 ) ) ( not ( = ?auto_526440 ?auto_526441 ) ) ( ON ?auto_526439 ?auto_526440 ) ( ON ?auto_526438 ?auto_526439 ) ( ON ?auto_526437 ?auto_526438 ) ( ON ?auto_526436 ?auto_526437 ) ( ON ?auto_526435 ?auto_526436 ) ( ON ?auto_526434 ?auto_526435 ) ( ON ?auto_526433 ?auto_526434 ) ( ON ?auto_526432 ?auto_526433 ) ( ON ?auto_526431 ?auto_526432 ) ( ON ?auto_526430 ?auto_526431 ) ( ON ?auto_526429 ?auto_526430 ) ( CLEAR ?auto_526427 ) ( ON ?auto_526428 ?auto_526429 ) ( CLEAR ?auto_526428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_526426 ?auto_526427 ?auto_526428 )
      ( MAKE-15PILE ?auto_526426 ?auto_526427 ?auto_526428 ?auto_526429 ?auto_526430 ?auto_526431 ?auto_526432 ?auto_526433 ?auto_526434 ?auto_526435 ?auto_526436 ?auto_526437 ?auto_526438 ?auto_526439 ?auto_526440 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_526488 - BLOCK
      ?auto_526489 - BLOCK
      ?auto_526490 - BLOCK
      ?auto_526491 - BLOCK
      ?auto_526492 - BLOCK
      ?auto_526493 - BLOCK
      ?auto_526494 - BLOCK
      ?auto_526495 - BLOCK
      ?auto_526496 - BLOCK
      ?auto_526497 - BLOCK
      ?auto_526498 - BLOCK
      ?auto_526499 - BLOCK
      ?auto_526500 - BLOCK
      ?auto_526501 - BLOCK
      ?auto_526502 - BLOCK
    )
    :vars
    (
      ?auto_526503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526502 ?auto_526503 ) ( ON-TABLE ?auto_526488 ) ( not ( = ?auto_526488 ?auto_526489 ) ) ( not ( = ?auto_526488 ?auto_526490 ) ) ( not ( = ?auto_526488 ?auto_526491 ) ) ( not ( = ?auto_526488 ?auto_526492 ) ) ( not ( = ?auto_526488 ?auto_526493 ) ) ( not ( = ?auto_526488 ?auto_526494 ) ) ( not ( = ?auto_526488 ?auto_526495 ) ) ( not ( = ?auto_526488 ?auto_526496 ) ) ( not ( = ?auto_526488 ?auto_526497 ) ) ( not ( = ?auto_526488 ?auto_526498 ) ) ( not ( = ?auto_526488 ?auto_526499 ) ) ( not ( = ?auto_526488 ?auto_526500 ) ) ( not ( = ?auto_526488 ?auto_526501 ) ) ( not ( = ?auto_526488 ?auto_526502 ) ) ( not ( = ?auto_526488 ?auto_526503 ) ) ( not ( = ?auto_526489 ?auto_526490 ) ) ( not ( = ?auto_526489 ?auto_526491 ) ) ( not ( = ?auto_526489 ?auto_526492 ) ) ( not ( = ?auto_526489 ?auto_526493 ) ) ( not ( = ?auto_526489 ?auto_526494 ) ) ( not ( = ?auto_526489 ?auto_526495 ) ) ( not ( = ?auto_526489 ?auto_526496 ) ) ( not ( = ?auto_526489 ?auto_526497 ) ) ( not ( = ?auto_526489 ?auto_526498 ) ) ( not ( = ?auto_526489 ?auto_526499 ) ) ( not ( = ?auto_526489 ?auto_526500 ) ) ( not ( = ?auto_526489 ?auto_526501 ) ) ( not ( = ?auto_526489 ?auto_526502 ) ) ( not ( = ?auto_526489 ?auto_526503 ) ) ( not ( = ?auto_526490 ?auto_526491 ) ) ( not ( = ?auto_526490 ?auto_526492 ) ) ( not ( = ?auto_526490 ?auto_526493 ) ) ( not ( = ?auto_526490 ?auto_526494 ) ) ( not ( = ?auto_526490 ?auto_526495 ) ) ( not ( = ?auto_526490 ?auto_526496 ) ) ( not ( = ?auto_526490 ?auto_526497 ) ) ( not ( = ?auto_526490 ?auto_526498 ) ) ( not ( = ?auto_526490 ?auto_526499 ) ) ( not ( = ?auto_526490 ?auto_526500 ) ) ( not ( = ?auto_526490 ?auto_526501 ) ) ( not ( = ?auto_526490 ?auto_526502 ) ) ( not ( = ?auto_526490 ?auto_526503 ) ) ( not ( = ?auto_526491 ?auto_526492 ) ) ( not ( = ?auto_526491 ?auto_526493 ) ) ( not ( = ?auto_526491 ?auto_526494 ) ) ( not ( = ?auto_526491 ?auto_526495 ) ) ( not ( = ?auto_526491 ?auto_526496 ) ) ( not ( = ?auto_526491 ?auto_526497 ) ) ( not ( = ?auto_526491 ?auto_526498 ) ) ( not ( = ?auto_526491 ?auto_526499 ) ) ( not ( = ?auto_526491 ?auto_526500 ) ) ( not ( = ?auto_526491 ?auto_526501 ) ) ( not ( = ?auto_526491 ?auto_526502 ) ) ( not ( = ?auto_526491 ?auto_526503 ) ) ( not ( = ?auto_526492 ?auto_526493 ) ) ( not ( = ?auto_526492 ?auto_526494 ) ) ( not ( = ?auto_526492 ?auto_526495 ) ) ( not ( = ?auto_526492 ?auto_526496 ) ) ( not ( = ?auto_526492 ?auto_526497 ) ) ( not ( = ?auto_526492 ?auto_526498 ) ) ( not ( = ?auto_526492 ?auto_526499 ) ) ( not ( = ?auto_526492 ?auto_526500 ) ) ( not ( = ?auto_526492 ?auto_526501 ) ) ( not ( = ?auto_526492 ?auto_526502 ) ) ( not ( = ?auto_526492 ?auto_526503 ) ) ( not ( = ?auto_526493 ?auto_526494 ) ) ( not ( = ?auto_526493 ?auto_526495 ) ) ( not ( = ?auto_526493 ?auto_526496 ) ) ( not ( = ?auto_526493 ?auto_526497 ) ) ( not ( = ?auto_526493 ?auto_526498 ) ) ( not ( = ?auto_526493 ?auto_526499 ) ) ( not ( = ?auto_526493 ?auto_526500 ) ) ( not ( = ?auto_526493 ?auto_526501 ) ) ( not ( = ?auto_526493 ?auto_526502 ) ) ( not ( = ?auto_526493 ?auto_526503 ) ) ( not ( = ?auto_526494 ?auto_526495 ) ) ( not ( = ?auto_526494 ?auto_526496 ) ) ( not ( = ?auto_526494 ?auto_526497 ) ) ( not ( = ?auto_526494 ?auto_526498 ) ) ( not ( = ?auto_526494 ?auto_526499 ) ) ( not ( = ?auto_526494 ?auto_526500 ) ) ( not ( = ?auto_526494 ?auto_526501 ) ) ( not ( = ?auto_526494 ?auto_526502 ) ) ( not ( = ?auto_526494 ?auto_526503 ) ) ( not ( = ?auto_526495 ?auto_526496 ) ) ( not ( = ?auto_526495 ?auto_526497 ) ) ( not ( = ?auto_526495 ?auto_526498 ) ) ( not ( = ?auto_526495 ?auto_526499 ) ) ( not ( = ?auto_526495 ?auto_526500 ) ) ( not ( = ?auto_526495 ?auto_526501 ) ) ( not ( = ?auto_526495 ?auto_526502 ) ) ( not ( = ?auto_526495 ?auto_526503 ) ) ( not ( = ?auto_526496 ?auto_526497 ) ) ( not ( = ?auto_526496 ?auto_526498 ) ) ( not ( = ?auto_526496 ?auto_526499 ) ) ( not ( = ?auto_526496 ?auto_526500 ) ) ( not ( = ?auto_526496 ?auto_526501 ) ) ( not ( = ?auto_526496 ?auto_526502 ) ) ( not ( = ?auto_526496 ?auto_526503 ) ) ( not ( = ?auto_526497 ?auto_526498 ) ) ( not ( = ?auto_526497 ?auto_526499 ) ) ( not ( = ?auto_526497 ?auto_526500 ) ) ( not ( = ?auto_526497 ?auto_526501 ) ) ( not ( = ?auto_526497 ?auto_526502 ) ) ( not ( = ?auto_526497 ?auto_526503 ) ) ( not ( = ?auto_526498 ?auto_526499 ) ) ( not ( = ?auto_526498 ?auto_526500 ) ) ( not ( = ?auto_526498 ?auto_526501 ) ) ( not ( = ?auto_526498 ?auto_526502 ) ) ( not ( = ?auto_526498 ?auto_526503 ) ) ( not ( = ?auto_526499 ?auto_526500 ) ) ( not ( = ?auto_526499 ?auto_526501 ) ) ( not ( = ?auto_526499 ?auto_526502 ) ) ( not ( = ?auto_526499 ?auto_526503 ) ) ( not ( = ?auto_526500 ?auto_526501 ) ) ( not ( = ?auto_526500 ?auto_526502 ) ) ( not ( = ?auto_526500 ?auto_526503 ) ) ( not ( = ?auto_526501 ?auto_526502 ) ) ( not ( = ?auto_526501 ?auto_526503 ) ) ( not ( = ?auto_526502 ?auto_526503 ) ) ( ON ?auto_526501 ?auto_526502 ) ( ON ?auto_526500 ?auto_526501 ) ( ON ?auto_526499 ?auto_526500 ) ( ON ?auto_526498 ?auto_526499 ) ( ON ?auto_526497 ?auto_526498 ) ( ON ?auto_526496 ?auto_526497 ) ( ON ?auto_526495 ?auto_526496 ) ( ON ?auto_526494 ?auto_526495 ) ( ON ?auto_526493 ?auto_526494 ) ( ON ?auto_526492 ?auto_526493 ) ( ON ?auto_526491 ?auto_526492 ) ( ON ?auto_526490 ?auto_526491 ) ( CLEAR ?auto_526488 ) ( ON ?auto_526489 ?auto_526490 ) ( CLEAR ?auto_526489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_526488 ?auto_526489 )
      ( MAKE-15PILE ?auto_526488 ?auto_526489 ?auto_526490 ?auto_526491 ?auto_526492 ?auto_526493 ?auto_526494 ?auto_526495 ?auto_526496 ?auto_526497 ?auto_526498 ?auto_526499 ?auto_526500 ?auto_526501 ?auto_526502 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_526550 - BLOCK
      ?auto_526551 - BLOCK
      ?auto_526552 - BLOCK
      ?auto_526553 - BLOCK
      ?auto_526554 - BLOCK
      ?auto_526555 - BLOCK
      ?auto_526556 - BLOCK
      ?auto_526557 - BLOCK
      ?auto_526558 - BLOCK
      ?auto_526559 - BLOCK
      ?auto_526560 - BLOCK
      ?auto_526561 - BLOCK
      ?auto_526562 - BLOCK
      ?auto_526563 - BLOCK
      ?auto_526564 - BLOCK
    )
    :vars
    (
      ?auto_526565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526564 ?auto_526565 ) ( not ( = ?auto_526550 ?auto_526551 ) ) ( not ( = ?auto_526550 ?auto_526552 ) ) ( not ( = ?auto_526550 ?auto_526553 ) ) ( not ( = ?auto_526550 ?auto_526554 ) ) ( not ( = ?auto_526550 ?auto_526555 ) ) ( not ( = ?auto_526550 ?auto_526556 ) ) ( not ( = ?auto_526550 ?auto_526557 ) ) ( not ( = ?auto_526550 ?auto_526558 ) ) ( not ( = ?auto_526550 ?auto_526559 ) ) ( not ( = ?auto_526550 ?auto_526560 ) ) ( not ( = ?auto_526550 ?auto_526561 ) ) ( not ( = ?auto_526550 ?auto_526562 ) ) ( not ( = ?auto_526550 ?auto_526563 ) ) ( not ( = ?auto_526550 ?auto_526564 ) ) ( not ( = ?auto_526550 ?auto_526565 ) ) ( not ( = ?auto_526551 ?auto_526552 ) ) ( not ( = ?auto_526551 ?auto_526553 ) ) ( not ( = ?auto_526551 ?auto_526554 ) ) ( not ( = ?auto_526551 ?auto_526555 ) ) ( not ( = ?auto_526551 ?auto_526556 ) ) ( not ( = ?auto_526551 ?auto_526557 ) ) ( not ( = ?auto_526551 ?auto_526558 ) ) ( not ( = ?auto_526551 ?auto_526559 ) ) ( not ( = ?auto_526551 ?auto_526560 ) ) ( not ( = ?auto_526551 ?auto_526561 ) ) ( not ( = ?auto_526551 ?auto_526562 ) ) ( not ( = ?auto_526551 ?auto_526563 ) ) ( not ( = ?auto_526551 ?auto_526564 ) ) ( not ( = ?auto_526551 ?auto_526565 ) ) ( not ( = ?auto_526552 ?auto_526553 ) ) ( not ( = ?auto_526552 ?auto_526554 ) ) ( not ( = ?auto_526552 ?auto_526555 ) ) ( not ( = ?auto_526552 ?auto_526556 ) ) ( not ( = ?auto_526552 ?auto_526557 ) ) ( not ( = ?auto_526552 ?auto_526558 ) ) ( not ( = ?auto_526552 ?auto_526559 ) ) ( not ( = ?auto_526552 ?auto_526560 ) ) ( not ( = ?auto_526552 ?auto_526561 ) ) ( not ( = ?auto_526552 ?auto_526562 ) ) ( not ( = ?auto_526552 ?auto_526563 ) ) ( not ( = ?auto_526552 ?auto_526564 ) ) ( not ( = ?auto_526552 ?auto_526565 ) ) ( not ( = ?auto_526553 ?auto_526554 ) ) ( not ( = ?auto_526553 ?auto_526555 ) ) ( not ( = ?auto_526553 ?auto_526556 ) ) ( not ( = ?auto_526553 ?auto_526557 ) ) ( not ( = ?auto_526553 ?auto_526558 ) ) ( not ( = ?auto_526553 ?auto_526559 ) ) ( not ( = ?auto_526553 ?auto_526560 ) ) ( not ( = ?auto_526553 ?auto_526561 ) ) ( not ( = ?auto_526553 ?auto_526562 ) ) ( not ( = ?auto_526553 ?auto_526563 ) ) ( not ( = ?auto_526553 ?auto_526564 ) ) ( not ( = ?auto_526553 ?auto_526565 ) ) ( not ( = ?auto_526554 ?auto_526555 ) ) ( not ( = ?auto_526554 ?auto_526556 ) ) ( not ( = ?auto_526554 ?auto_526557 ) ) ( not ( = ?auto_526554 ?auto_526558 ) ) ( not ( = ?auto_526554 ?auto_526559 ) ) ( not ( = ?auto_526554 ?auto_526560 ) ) ( not ( = ?auto_526554 ?auto_526561 ) ) ( not ( = ?auto_526554 ?auto_526562 ) ) ( not ( = ?auto_526554 ?auto_526563 ) ) ( not ( = ?auto_526554 ?auto_526564 ) ) ( not ( = ?auto_526554 ?auto_526565 ) ) ( not ( = ?auto_526555 ?auto_526556 ) ) ( not ( = ?auto_526555 ?auto_526557 ) ) ( not ( = ?auto_526555 ?auto_526558 ) ) ( not ( = ?auto_526555 ?auto_526559 ) ) ( not ( = ?auto_526555 ?auto_526560 ) ) ( not ( = ?auto_526555 ?auto_526561 ) ) ( not ( = ?auto_526555 ?auto_526562 ) ) ( not ( = ?auto_526555 ?auto_526563 ) ) ( not ( = ?auto_526555 ?auto_526564 ) ) ( not ( = ?auto_526555 ?auto_526565 ) ) ( not ( = ?auto_526556 ?auto_526557 ) ) ( not ( = ?auto_526556 ?auto_526558 ) ) ( not ( = ?auto_526556 ?auto_526559 ) ) ( not ( = ?auto_526556 ?auto_526560 ) ) ( not ( = ?auto_526556 ?auto_526561 ) ) ( not ( = ?auto_526556 ?auto_526562 ) ) ( not ( = ?auto_526556 ?auto_526563 ) ) ( not ( = ?auto_526556 ?auto_526564 ) ) ( not ( = ?auto_526556 ?auto_526565 ) ) ( not ( = ?auto_526557 ?auto_526558 ) ) ( not ( = ?auto_526557 ?auto_526559 ) ) ( not ( = ?auto_526557 ?auto_526560 ) ) ( not ( = ?auto_526557 ?auto_526561 ) ) ( not ( = ?auto_526557 ?auto_526562 ) ) ( not ( = ?auto_526557 ?auto_526563 ) ) ( not ( = ?auto_526557 ?auto_526564 ) ) ( not ( = ?auto_526557 ?auto_526565 ) ) ( not ( = ?auto_526558 ?auto_526559 ) ) ( not ( = ?auto_526558 ?auto_526560 ) ) ( not ( = ?auto_526558 ?auto_526561 ) ) ( not ( = ?auto_526558 ?auto_526562 ) ) ( not ( = ?auto_526558 ?auto_526563 ) ) ( not ( = ?auto_526558 ?auto_526564 ) ) ( not ( = ?auto_526558 ?auto_526565 ) ) ( not ( = ?auto_526559 ?auto_526560 ) ) ( not ( = ?auto_526559 ?auto_526561 ) ) ( not ( = ?auto_526559 ?auto_526562 ) ) ( not ( = ?auto_526559 ?auto_526563 ) ) ( not ( = ?auto_526559 ?auto_526564 ) ) ( not ( = ?auto_526559 ?auto_526565 ) ) ( not ( = ?auto_526560 ?auto_526561 ) ) ( not ( = ?auto_526560 ?auto_526562 ) ) ( not ( = ?auto_526560 ?auto_526563 ) ) ( not ( = ?auto_526560 ?auto_526564 ) ) ( not ( = ?auto_526560 ?auto_526565 ) ) ( not ( = ?auto_526561 ?auto_526562 ) ) ( not ( = ?auto_526561 ?auto_526563 ) ) ( not ( = ?auto_526561 ?auto_526564 ) ) ( not ( = ?auto_526561 ?auto_526565 ) ) ( not ( = ?auto_526562 ?auto_526563 ) ) ( not ( = ?auto_526562 ?auto_526564 ) ) ( not ( = ?auto_526562 ?auto_526565 ) ) ( not ( = ?auto_526563 ?auto_526564 ) ) ( not ( = ?auto_526563 ?auto_526565 ) ) ( not ( = ?auto_526564 ?auto_526565 ) ) ( ON ?auto_526563 ?auto_526564 ) ( ON ?auto_526562 ?auto_526563 ) ( ON ?auto_526561 ?auto_526562 ) ( ON ?auto_526560 ?auto_526561 ) ( ON ?auto_526559 ?auto_526560 ) ( ON ?auto_526558 ?auto_526559 ) ( ON ?auto_526557 ?auto_526558 ) ( ON ?auto_526556 ?auto_526557 ) ( ON ?auto_526555 ?auto_526556 ) ( ON ?auto_526554 ?auto_526555 ) ( ON ?auto_526553 ?auto_526554 ) ( ON ?auto_526552 ?auto_526553 ) ( ON ?auto_526551 ?auto_526552 ) ( ON ?auto_526550 ?auto_526551 ) ( CLEAR ?auto_526550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_526550 )
      ( MAKE-15PILE ?auto_526550 ?auto_526551 ?auto_526552 ?auto_526553 ?auto_526554 ?auto_526555 ?auto_526556 ?auto_526557 ?auto_526558 ?auto_526559 ?auto_526560 ?auto_526561 ?auto_526562 ?auto_526563 ?auto_526564 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_526613 - BLOCK
      ?auto_526614 - BLOCK
      ?auto_526615 - BLOCK
      ?auto_526616 - BLOCK
      ?auto_526617 - BLOCK
      ?auto_526618 - BLOCK
      ?auto_526619 - BLOCK
      ?auto_526620 - BLOCK
      ?auto_526621 - BLOCK
      ?auto_526622 - BLOCK
      ?auto_526623 - BLOCK
      ?auto_526624 - BLOCK
      ?auto_526625 - BLOCK
      ?auto_526626 - BLOCK
      ?auto_526627 - BLOCK
      ?auto_526628 - BLOCK
    )
    :vars
    (
      ?auto_526629 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_526627 ) ( ON ?auto_526628 ?auto_526629 ) ( CLEAR ?auto_526628 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_526613 ) ( ON ?auto_526614 ?auto_526613 ) ( ON ?auto_526615 ?auto_526614 ) ( ON ?auto_526616 ?auto_526615 ) ( ON ?auto_526617 ?auto_526616 ) ( ON ?auto_526618 ?auto_526617 ) ( ON ?auto_526619 ?auto_526618 ) ( ON ?auto_526620 ?auto_526619 ) ( ON ?auto_526621 ?auto_526620 ) ( ON ?auto_526622 ?auto_526621 ) ( ON ?auto_526623 ?auto_526622 ) ( ON ?auto_526624 ?auto_526623 ) ( ON ?auto_526625 ?auto_526624 ) ( ON ?auto_526626 ?auto_526625 ) ( ON ?auto_526627 ?auto_526626 ) ( not ( = ?auto_526613 ?auto_526614 ) ) ( not ( = ?auto_526613 ?auto_526615 ) ) ( not ( = ?auto_526613 ?auto_526616 ) ) ( not ( = ?auto_526613 ?auto_526617 ) ) ( not ( = ?auto_526613 ?auto_526618 ) ) ( not ( = ?auto_526613 ?auto_526619 ) ) ( not ( = ?auto_526613 ?auto_526620 ) ) ( not ( = ?auto_526613 ?auto_526621 ) ) ( not ( = ?auto_526613 ?auto_526622 ) ) ( not ( = ?auto_526613 ?auto_526623 ) ) ( not ( = ?auto_526613 ?auto_526624 ) ) ( not ( = ?auto_526613 ?auto_526625 ) ) ( not ( = ?auto_526613 ?auto_526626 ) ) ( not ( = ?auto_526613 ?auto_526627 ) ) ( not ( = ?auto_526613 ?auto_526628 ) ) ( not ( = ?auto_526613 ?auto_526629 ) ) ( not ( = ?auto_526614 ?auto_526615 ) ) ( not ( = ?auto_526614 ?auto_526616 ) ) ( not ( = ?auto_526614 ?auto_526617 ) ) ( not ( = ?auto_526614 ?auto_526618 ) ) ( not ( = ?auto_526614 ?auto_526619 ) ) ( not ( = ?auto_526614 ?auto_526620 ) ) ( not ( = ?auto_526614 ?auto_526621 ) ) ( not ( = ?auto_526614 ?auto_526622 ) ) ( not ( = ?auto_526614 ?auto_526623 ) ) ( not ( = ?auto_526614 ?auto_526624 ) ) ( not ( = ?auto_526614 ?auto_526625 ) ) ( not ( = ?auto_526614 ?auto_526626 ) ) ( not ( = ?auto_526614 ?auto_526627 ) ) ( not ( = ?auto_526614 ?auto_526628 ) ) ( not ( = ?auto_526614 ?auto_526629 ) ) ( not ( = ?auto_526615 ?auto_526616 ) ) ( not ( = ?auto_526615 ?auto_526617 ) ) ( not ( = ?auto_526615 ?auto_526618 ) ) ( not ( = ?auto_526615 ?auto_526619 ) ) ( not ( = ?auto_526615 ?auto_526620 ) ) ( not ( = ?auto_526615 ?auto_526621 ) ) ( not ( = ?auto_526615 ?auto_526622 ) ) ( not ( = ?auto_526615 ?auto_526623 ) ) ( not ( = ?auto_526615 ?auto_526624 ) ) ( not ( = ?auto_526615 ?auto_526625 ) ) ( not ( = ?auto_526615 ?auto_526626 ) ) ( not ( = ?auto_526615 ?auto_526627 ) ) ( not ( = ?auto_526615 ?auto_526628 ) ) ( not ( = ?auto_526615 ?auto_526629 ) ) ( not ( = ?auto_526616 ?auto_526617 ) ) ( not ( = ?auto_526616 ?auto_526618 ) ) ( not ( = ?auto_526616 ?auto_526619 ) ) ( not ( = ?auto_526616 ?auto_526620 ) ) ( not ( = ?auto_526616 ?auto_526621 ) ) ( not ( = ?auto_526616 ?auto_526622 ) ) ( not ( = ?auto_526616 ?auto_526623 ) ) ( not ( = ?auto_526616 ?auto_526624 ) ) ( not ( = ?auto_526616 ?auto_526625 ) ) ( not ( = ?auto_526616 ?auto_526626 ) ) ( not ( = ?auto_526616 ?auto_526627 ) ) ( not ( = ?auto_526616 ?auto_526628 ) ) ( not ( = ?auto_526616 ?auto_526629 ) ) ( not ( = ?auto_526617 ?auto_526618 ) ) ( not ( = ?auto_526617 ?auto_526619 ) ) ( not ( = ?auto_526617 ?auto_526620 ) ) ( not ( = ?auto_526617 ?auto_526621 ) ) ( not ( = ?auto_526617 ?auto_526622 ) ) ( not ( = ?auto_526617 ?auto_526623 ) ) ( not ( = ?auto_526617 ?auto_526624 ) ) ( not ( = ?auto_526617 ?auto_526625 ) ) ( not ( = ?auto_526617 ?auto_526626 ) ) ( not ( = ?auto_526617 ?auto_526627 ) ) ( not ( = ?auto_526617 ?auto_526628 ) ) ( not ( = ?auto_526617 ?auto_526629 ) ) ( not ( = ?auto_526618 ?auto_526619 ) ) ( not ( = ?auto_526618 ?auto_526620 ) ) ( not ( = ?auto_526618 ?auto_526621 ) ) ( not ( = ?auto_526618 ?auto_526622 ) ) ( not ( = ?auto_526618 ?auto_526623 ) ) ( not ( = ?auto_526618 ?auto_526624 ) ) ( not ( = ?auto_526618 ?auto_526625 ) ) ( not ( = ?auto_526618 ?auto_526626 ) ) ( not ( = ?auto_526618 ?auto_526627 ) ) ( not ( = ?auto_526618 ?auto_526628 ) ) ( not ( = ?auto_526618 ?auto_526629 ) ) ( not ( = ?auto_526619 ?auto_526620 ) ) ( not ( = ?auto_526619 ?auto_526621 ) ) ( not ( = ?auto_526619 ?auto_526622 ) ) ( not ( = ?auto_526619 ?auto_526623 ) ) ( not ( = ?auto_526619 ?auto_526624 ) ) ( not ( = ?auto_526619 ?auto_526625 ) ) ( not ( = ?auto_526619 ?auto_526626 ) ) ( not ( = ?auto_526619 ?auto_526627 ) ) ( not ( = ?auto_526619 ?auto_526628 ) ) ( not ( = ?auto_526619 ?auto_526629 ) ) ( not ( = ?auto_526620 ?auto_526621 ) ) ( not ( = ?auto_526620 ?auto_526622 ) ) ( not ( = ?auto_526620 ?auto_526623 ) ) ( not ( = ?auto_526620 ?auto_526624 ) ) ( not ( = ?auto_526620 ?auto_526625 ) ) ( not ( = ?auto_526620 ?auto_526626 ) ) ( not ( = ?auto_526620 ?auto_526627 ) ) ( not ( = ?auto_526620 ?auto_526628 ) ) ( not ( = ?auto_526620 ?auto_526629 ) ) ( not ( = ?auto_526621 ?auto_526622 ) ) ( not ( = ?auto_526621 ?auto_526623 ) ) ( not ( = ?auto_526621 ?auto_526624 ) ) ( not ( = ?auto_526621 ?auto_526625 ) ) ( not ( = ?auto_526621 ?auto_526626 ) ) ( not ( = ?auto_526621 ?auto_526627 ) ) ( not ( = ?auto_526621 ?auto_526628 ) ) ( not ( = ?auto_526621 ?auto_526629 ) ) ( not ( = ?auto_526622 ?auto_526623 ) ) ( not ( = ?auto_526622 ?auto_526624 ) ) ( not ( = ?auto_526622 ?auto_526625 ) ) ( not ( = ?auto_526622 ?auto_526626 ) ) ( not ( = ?auto_526622 ?auto_526627 ) ) ( not ( = ?auto_526622 ?auto_526628 ) ) ( not ( = ?auto_526622 ?auto_526629 ) ) ( not ( = ?auto_526623 ?auto_526624 ) ) ( not ( = ?auto_526623 ?auto_526625 ) ) ( not ( = ?auto_526623 ?auto_526626 ) ) ( not ( = ?auto_526623 ?auto_526627 ) ) ( not ( = ?auto_526623 ?auto_526628 ) ) ( not ( = ?auto_526623 ?auto_526629 ) ) ( not ( = ?auto_526624 ?auto_526625 ) ) ( not ( = ?auto_526624 ?auto_526626 ) ) ( not ( = ?auto_526624 ?auto_526627 ) ) ( not ( = ?auto_526624 ?auto_526628 ) ) ( not ( = ?auto_526624 ?auto_526629 ) ) ( not ( = ?auto_526625 ?auto_526626 ) ) ( not ( = ?auto_526625 ?auto_526627 ) ) ( not ( = ?auto_526625 ?auto_526628 ) ) ( not ( = ?auto_526625 ?auto_526629 ) ) ( not ( = ?auto_526626 ?auto_526627 ) ) ( not ( = ?auto_526626 ?auto_526628 ) ) ( not ( = ?auto_526626 ?auto_526629 ) ) ( not ( = ?auto_526627 ?auto_526628 ) ) ( not ( = ?auto_526627 ?auto_526629 ) ) ( not ( = ?auto_526628 ?auto_526629 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_526628 ?auto_526629 )
      ( !STACK ?auto_526628 ?auto_526627 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_526646 - BLOCK
      ?auto_526647 - BLOCK
      ?auto_526648 - BLOCK
      ?auto_526649 - BLOCK
      ?auto_526650 - BLOCK
      ?auto_526651 - BLOCK
      ?auto_526652 - BLOCK
      ?auto_526653 - BLOCK
      ?auto_526654 - BLOCK
      ?auto_526655 - BLOCK
      ?auto_526656 - BLOCK
      ?auto_526657 - BLOCK
      ?auto_526658 - BLOCK
      ?auto_526659 - BLOCK
      ?auto_526660 - BLOCK
      ?auto_526661 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_526660 ) ( ON-TABLE ?auto_526661 ) ( CLEAR ?auto_526661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_526646 ) ( ON ?auto_526647 ?auto_526646 ) ( ON ?auto_526648 ?auto_526647 ) ( ON ?auto_526649 ?auto_526648 ) ( ON ?auto_526650 ?auto_526649 ) ( ON ?auto_526651 ?auto_526650 ) ( ON ?auto_526652 ?auto_526651 ) ( ON ?auto_526653 ?auto_526652 ) ( ON ?auto_526654 ?auto_526653 ) ( ON ?auto_526655 ?auto_526654 ) ( ON ?auto_526656 ?auto_526655 ) ( ON ?auto_526657 ?auto_526656 ) ( ON ?auto_526658 ?auto_526657 ) ( ON ?auto_526659 ?auto_526658 ) ( ON ?auto_526660 ?auto_526659 ) ( not ( = ?auto_526646 ?auto_526647 ) ) ( not ( = ?auto_526646 ?auto_526648 ) ) ( not ( = ?auto_526646 ?auto_526649 ) ) ( not ( = ?auto_526646 ?auto_526650 ) ) ( not ( = ?auto_526646 ?auto_526651 ) ) ( not ( = ?auto_526646 ?auto_526652 ) ) ( not ( = ?auto_526646 ?auto_526653 ) ) ( not ( = ?auto_526646 ?auto_526654 ) ) ( not ( = ?auto_526646 ?auto_526655 ) ) ( not ( = ?auto_526646 ?auto_526656 ) ) ( not ( = ?auto_526646 ?auto_526657 ) ) ( not ( = ?auto_526646 ?auto_526658 ) ) ( not ( = ?auto_526646 ?auto_526659 ) ) ( not ( = ?auto_526646 ?auto_526660 ) ) ( not ( = ?auto_526646 ?auto_526661 ) ) ( not ( = ?auto_526647 ?auto_526648 ) ) ( not ( = ?auto_526647 ?auto_526649 ) ) ( not ( = ?auto_526647 ?auto_526650 ) ) ( not ( = ?auto_526647 ?auto_526651 ) ) ( not ( = ?auto_526647 ?auto_526652 ) ) ( not ( = ?auto_526647 ?auto_526653 ) ) ( not ( = ?auto_526647 ?auto_526654 ) ) ( not ( = ?auto_526647 ?auto_526655 ) ) ( not ( = ?auto_526647 ?auto_526656 ) ) ( not ( = ?auto_526647 ?auto_526657 ) ) ( not ( = ?auto_526647 ?auto_526658 ) ) ( not ( = ?auto_526647 ?auto_526659 ) ) ( not ( = ?auto_526647 ?auto_526660 ) ) ( not ( = ?auto_526647 ?auto_526661 ) ) ( not ( = ?auto_526648 ?auto_526649 ) ) ( not ( = ?auto_526648 ?auto_526650 ) ) ( not ( = ?auto_526648 ?auto_526651 ) ) ( not ( = ?auto_526648 ?auto_526652 ) ) ( not ( = ?auto_526648 ?auto_526653 ) ) ( not ( = ?auto_526648 ?auto_526654 ) ) ( not ( = ?auto_526648 ?auto_526655 ) ) ( not ( = ?auto_526648 ?auto_526656 ) ) ( not ( = ?auto_526648 ?auto_526657 ) ) ( not ( = ?auto_526648 ?auto_526658 ) ) ( not ( = ?auto_526648 ?auto_526659 ) ) ( not ( = ?auto_526648 ?auto_526660 ) ) ( not ( = ?auto_526648 ?auto_526661 ) ) ( not ( = ?auto_526649 ?auto_526650 ) ) ( not ( = ?auto_526649 ?auto_526651 ) ) ( not ( = ?auto_526649 ?auto_526652 ) ) ( not ( = ?auto_526649 ?auto_526653 ) ) ( not ( = ?auto_526649 ?auto_526654 ) ) ( not ( = ?auto_526649 ?auto_526655 ) ) ( not ( = ?auto_526649 ?auto_526656 ) ) ( not ( = ?auto_526649 ?auto_526657 ) ) ( not ( = ?auto_526649 ?auto_526658 ) ) ( not ( = ?auto_526649 ?auto_526659 ) ) ( not ( = ?auto_526649 ?auto_526660 ) ) ( not ( = ?auto_526649 ?auto_526661 ) ) ( not ( = ?auto_526650 ?auto_526651 ) ) ( not ( = ?auto_526650 ?auto_526652 ) ) ( not ( = ?auto_526650 ?auto_526653 ) ) ( not ( = ?auto_526650 ?auto_526654 ) ) ( not ( = ?auto_526650 ?auto_526655 ) ) ( not ( = ?auto_526650 ?auto_526656 ) ) ( not ( = ?auto_526650 ?auto_526657 ) ) ( not ( = ?auto_526650 ?auto_526658 ) ) ( not ( = ?auto_526650 ?auto_526659 ) ) ( not ( = ?auto_526650 ?auto_526660 ) ) ( not ( = ?auto_526650 ?auto_526661 ) ) ( not ( = ?auto_526651 ?auto_526652 ) ) ( not ( = ?auto_526651 ?auto_526653 ) ) ( not ( = ?auto_526651 ?auto_526654 ) ) ( not ( = ?auto_526651 ?auto_526655 ) ) ( not ( = ?auto_526651 ?auto_526656 ) ) ( not ( = ?auto_526651 ?auto_526657 ) ) ( not ( = ?auto_526651 ?auto_526658 ) ) ( not ( = ?auto_526651 ?auto_526659 ) ) ( not ( = ?auto_526651 ?auto_526660 ) ) ( not ( = ?auto_526651 ?auto_526661 ) ) ( not ( = ?auto_526652 ?auto_526653 ) ) ( not ( = ?auto_526652 ?auto_526654 ) ) ( not ( = ?auto_526652 ?auto_526655 ) ) ( not ( = ?auto_526652 ?auto_526656 ) ) ( not ( = ?auto_526652 ?auto_526657 ) ) ( not ( = ?auto_526652 ?auto_526658 ) ) ( not ( = ?auto_526652 ?auto_526659 ) ) ( not ( = ?auto_526652 ?auto_526660 ) ) ( not ( = ?auto_526652 ?auto_526661 ) ) ( not ( = ?auto_526653 ?auto_526654 ) ) ( not ( = ?auto_526653 ?auto_526655 ) ) ( not ( = ?auto_526653 ?auto_526656 ) ) ( not ( = ?auto_526653 ?auto_526657 ) ) ( not ( = ?auto_526653 ?auto_526658 ) ) ( not ( = ?auto_526653 ?auto_526659 ) ) ( not ( = ?auto_526653 ?auto_526660 ) ) ( not ( = ?auto_526653 ?auto_526661 ) ) ( not ( = ?auto_526654 ?auto_526655 ) ) ( not ( = ?auto_526654 ?auto_526656 ) ) ( not ( = ?auto_526654 ?auto_526657 ) ) ( not ( = ?auto_526654 ?auto_526658 ) ) ( not ( = ?auto_526654 ?auto_526659 ) ) ( not ( = ?auto_526654 ?auto_526660 ) ) ( not ( = ?auto_526654 ?auto_526661 ) ) ( not ( = ?auto_526655 ?auto_526656 ) ) ( not ( = ?auto_526655 ?auto_526657 ) ) ( not ( = ?auto_526655 ?auto_526658 ) ) ( not ( = ?auto_526655 ?auto_526659 ) ) ( not ( = ?auto_526655 ?auto_526660 ) ) ( not ( = ?auto_526655 ?auto_526661 ) ) ( not ( = ?auto_526656 ?auto_526657 ) ) ( not ( = ?auto_526656 ?auto_526658 ) ) ( not ( = ?auto_526656 ?auto_526659 ) ) ( not ( = ?auto_526656 ?auto_526660 ) ) ( not ( = ?auto_526656 ?auto_526661 ) ) ( not ( = ?auto_526657 ?auto_526658 ) ) ( not ( = ?auto_526657 ?auto_526659 ) ) ( not ( = ?auto_526657 ?auto_526660 ) ) ( not ( = ?auto_526657 ?auto_526661 ) ) ( not ( = ?auto_526658 ?auto_526659 ) ) ( not ( = ?auto_526658 ?auto_526660 ) ) ( not ( = ?auto_526658 ?auto_526661 ) ) ( not ( = ?auto_526659 ?auto_526660 ) ) ( not ( = ?auto_526659 ?auto_526661 ) ) ( not ( = ?auto_526660 ?auto_526661 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_526661 )
      ( !STACK ?auto_526661 ?auto_526660 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_526678 - BLOCK
      ?auto_526679 - BLOCK
      ?auto_526680 - BLOCK
      ?auto_526681 - BLOCK
      ?auto_526682 - BLOCK
      ?auto_526683 - BLOCK
      ?auto_526684 - BLOCK
      ?auto_526685 - BLOCK
      ?auto_526686 - BLOCK
      ?auto_526687 - BLOCK
      ?auto_526688 - BLOCK
      ?auto_526689 - BLOCK
      ?auto_526690 - BLOCK
      ?auto_526691 - BLOCK
      ?auto_526692 - BLOCK
      ?auto_526693 - BLOCK
    )
    :vars
    (
      ?auto_526694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526693 ?auto_526694 ) ( ON-TABLE ?auto_526678 ) ( ON ?auto_526679 ?auto_526678 ) ( ON ?auto_526680 ?auto_526679 ) ( ON ?auto_526681 ?auto_526680 ) ( ON ?auto_526682 ?auto_526681 ) ( ON ?auto_526683 ?auto_526682 ) ( ON ?auto_526684 ?auto_526683 ) ( ON ?auto_526685 ?auto_526684 ) ( ON ?auto_526686 ?auto_526685 ) ( ON ?auto_526687 ?auto_526686 ) ( ON ?auto_526688 ?auto_526687 ) ( ON ?auto_526689 ?auto_526688 ) ( ON ?auto_526690 ?auto_526689 ) ( ON ?auto_526691 ?auto_526690 ) ( not ( = ?auto_526678 ?auto_526679 ) ) ( not ( = ?auto_526678 ?auto_526680 ) ) ( not ( = ?auto_526678 ?auto_526681 ) ) ( not ( = ?auto_526678 ?auto_526682 ) ) ( not ( = ?auto_526678 ?auto_526683 ) ) ( not ( = ?auto_526678 ?auto_526684 ) ) ( not ( = ?auto_526678 ?auto_526685 ) ) ( not ( = ?auto_526678 ?auto_526686 ) ) ( not ( = ?auto_526678 ?auto_526687 ) ) ( not ( = ?auto_526678 ?auto_526688 ) ) ( not ( = ?auto_526678 ?auto_526689 ) ) ( not ( = ?auto_526678 ?auto_526690 ) ) ( not ( = ?auto_526678 ?auto_526691 ) ) ( not ( = ?auto_526678 ?auto_526692 ) ) ( not ( = ?auto_526678 ?auto_526693 ) ) ( not ( = ?auto_526678 ?auto_526694 ) ) ( not ( = ?auto_526679 ?auto_526680 ) ) ( not ( = ?auto_526679 ?auto_526681 ) ) ( not ( = ?auto_526679 ?auto_526682 ) ) ( not ( = ?auto_526679 ?auto_526683 ) ) ( not ( = ?auto_526679 ?auto_526684 ) ) ( not ( = ?auto_526679 ?auto_526685 ) ) ( not ( = ?auto_526679 ?auto_526686 ) ) ( not ( = ?auto_526679 ?auto_526687 ) ) ( not ( = ?auto_526679 ?auto_526688 ) ) ( not ( = ?auto_526679 ?auto_526689 ) ) ( not ( = ?auto_526679 ?auto_526690 ) ) ( not ( = ?auto_526679 ?auto_526691 ) ) ( not ( = ?auto_526679 ?auto_526692 ) ) ( not ( = ?auto_526679 ?auto_526693 ) ) ( not ( = ?auto_526679 ?auto_526694 ) ) ( not ( = ?auto_526680 ?auto_526681 ) ) ( not ( = ?auto_526680 ?auto_526682 ) ) ( not ( = ?auto_526680 ?auto_526683 ) ) ( not ( = ?auto_526680 ?auto_526684 ) ) ( not ( = ?auto_526680 ?auto_526685 ) ) ( not ( = ?auto_526680 ?auto_526686 ) ) ( not ( = ?auto_526680 ?auto_526687 ) ) ( not ( = ?auto_526680 ?auto_526688 ) ) ( not ( = ?auto_526680 ?auto_526689 ) ) ( not ( = ?auto_526680 ?auto_526690 ) ) ( not ( = ?auto_526680 ?auto_526691 ) ) ( not ( = ?auto_526680 ?auto_526692 ) ) ( not ( = ?auto_526680 ?auto_526693 ) ) ( not ( = ?auto_526680 ?auto_526694 ) ) ( not ( = ?auto_526681 ?auto_526682 ) ) ( not ( = ?auto_526681 ?auto_526683 ) ) ( not ( = ?auto_526681 ?auto_526684 ) ) ( not ( = ?auto_526681 ?auto_526685 ) ) ( not ( = ?auto_526681 ?auto_526686 ) ) ( not ( = ?auto_526681 ?auto_526687 ) ) ( not ( = ?auto_526681 ?auto_526688 ) ) ( not ( = ?auto_526681 ?auto_526689 ) ) ( not ( = ?auto_526681 ?auto_526690 ) ) ( not ( = ?auto_526681 ?auto_526691 ) ) ( not ( = ?auto_526681 ?auto_526692 ) ) ( not ( = ?auto_526681 ?auto_526693 ) ) ( not ( = ?auto_526681 ?auto_526694 ) ) ( not ( = ?auto_526682 ?auto_526683 ) ) ( not ( = ?auto_526682 ?auto_526684 ) ) ( not ( = ?auto_526682 ?auto_526685 ) ) ( not ( = ?auto_526682 ?auto_526686 ) ) ( not ( = ?auto_526682 ?auto_526687 ) ) ( not ( = ?auto_526682 ?auto_526688 ) ) ( not ( = ?auto_526682 ?auto_526689 ) ) ( not ( = ?auto_526682 ?auto_526690 ) ) ( not ( = ?auto_526682 ?auto_526691 ) ) ( not ( = ?auto_526682 ?auto_526692 ) ) ( not ( = ?auto_526682 ?auto_526693 ) ) ( not ( = ?auto_526682 ?auto_526694 ) ) ( not ( = ?auto_526683 ?auto_526684 ) ) ( not ( = ?auto_526683 ?auto_526685 ) ) ( not ( = ?auto_526683 ?auto_526686 ) ) ( not ( = ?auto_526683 ?auto_526687 ) ) ( not ( = ?auto_526683 ?auto_526688 ) ) ( not ( = ?auto_526683 ?auto_526689 ) ) ( not ( = ?auto_526683 ?auto_526690 ) ) ( not ( = ?auto_526683 ?auto_526691 ) ) ( not ( = ?auto_526683 ?auto_526692 ) ) ( not ( = ?auto_526683 ?auto_526693 ) ) ( not ( = ?auto_526683 ?auto_526694 ) ) ( not ( = ?auto_526684 ?auto_526685 ) ) ( not ( = ?auto_526684 ?auto_526686 ) ) ( not ( = ?auto_526684 ?auto_526687 ) ) ( not ( = ?auto_526684 ?auto_526688 ) ) ( not ( = ?auto_526684 ?auto_526689 ) ) ( not ( = ?auto_526684 ?auto_526690 ) ) ( not ( = ?auto_526684 ?auto_526691 ) ) ( not ( = ?auto_526684 ?auto_526692 ) ) ( not ( = ?auto_526684 ?auto_526693 ) ) ( not ( = ?auto_526684 ?auto_526694 ) ) ( not ( = ?auto_526685 ?auto_526686 ) ) ( not ( = ?auto_526685 ?auto_526687 ) ) ( not ( = ?auto_526685 ?auto_526688 ) ) ( not ( = ?auto_526685 ?auto_526689 ) ) ( not ( = ?auto_526685 ?auto_526690 ) ) ( not ( = ?auto_526685 ?auto_526691 ) ) ( not ( = ?auto_526685 ?auto_526692 ) ) ( not ( = ?auto_526685 ?auto_526693 ) ) ( not ( = ?auto_526685 ?auto_526694 ) ) ( not ( = ?auto_526686 ?auto_526687 ) ) ( not ( = ?auto_526686 ?auto_526688 ) ) ( not ( = ?auto_526686 ?auto_526689 ) ) ( not ( = ?auto_526686 ?auto_526690 ) ) ( not ( = ?auto_526686 ?auto_526691 ) ) ( not ( = ?auto_526686 ?auto_526692 ) ) ( not ( = ?auto_526686 ?auto_526693 ) ) ( not ( = ?auto_526686 ?auto_526694 ) ) ( not ( = ?auto_526687 ?auto_526688 ) ) ( not ( = ?auto_526687 ?auto_526689 ) ) ( not ( = ?auto_526687 ?auto_526690 ) ) ( not ( = ?auto_526687 ?auto_526691 ) ) ( not ( = ?auto_526687 ?auto_526692 ) ) ( not ( = ?auto_526687 ?auto_526693 ) ) ( not ( = ?auto_526687 ?auto_526694 ) ) ( not ( = ?auto_526688 ?auto_526689 ) ) ( not ( = ?auto_526688 ?auto_526690 ) ) ( not ( = ?auto_526688 ?auto_526691 ) ) ( not ( = ?auto_526688 ?auto_526692 ) ) ( not ( = ?auto_526688 ?auto_526693 ) ) ( not ( = ?auto_526688 ?auto_526694 ) ) ( not ( = ?auto_526689 ?auto_526690 ) ) ( not ( = ?auto_526689 ?auto_526691 ) ) ( not ( = ?auto_526689 ?auto_526692 ) ) ( not ( = ?auto_526689 ?auto_526693 ) ) ( not ( = ?auto_526689 ?auto_526694 ) ) ( not ( = ?auto_526690 ?auto_526691 ) ) ( not ( = ?auto_526690 ?auto_526692 ) ) ( not ( = ?auto_526690 ?auto_526693 ) ) ( not ( = ?auto_526690 ?auto_526694 ) ) ( not ( = ?auto_526691 ?auto_526692 ) ) ( not ( = ?auto_526691 ?auto_526693 ) ) ( not ( = ?auto_526691 ?auto_526694 ) ) ( not ( = ?auto_526692 ?auto_526693 ) ) ( not ( = ?auto_526692 ?auto_526694 ) ) ( not ( = ?auto_526693 ?auto_526694 ) ) ( CLEAR ?auto_526691 ) ( ON ?auto_526692 ?auto_526693 ) ( CLEAR ?auto_526692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_526678 ?auto_526679 ?auto_526680 ?auto_526681 ?auto_526682 ?auto_526683 ?auto_526684 ?auto_526685 ?auto_526686 ?auto_526687 ?auto_526688 ?auto_526689 ?auto_526690 ?auto_526691 ?auto_526692 )
      ( MAKE-16PILE ?auto_526678 ?auto_526679 ?auto_526680 ?auto_526681 ?auto_526682 ?auto_526683 ?auto_526684 ?auto_526685 ?auto_526686 ?auto_526687 ?auto_526688 ?auto_526689 ?auto_526690 ?auto_526691 ?auto_526692 ?auto_526693 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_526711 - BLOCK
      ?auto_526712 - BLOCK
      ?auto_526713 - BLOCK
      ?auto_526714 - BLOCK
      ?auto_526715 - BLOCK
      ?auto_526716 - BLOCK
      ?auto_526717 - BLOCK
      ?auto_526718 - BLOCK
      ?auto_526719 - BLOCK
      ?auto_526720 - BLOCK
      ?auto_526721 - BLOCK
      ?auto_526722 - BLOCK
      ?auto_526723 - BLOCK
      ?auto_526724 - BLOCK
      ?auto_526725 - BLOCK
      ?auto_526726 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_526726 ) ( ON-TABLE ?auto_526711 ) ( ON ?auto_526712 ?auto_526711 ) ( ON ?auto_526713 ?auto_526712 ) ( ON ?auto_526714 ?auto_526713 ) ( ON ?auto_526715 ?auto_526714 ) ( ON ?auto_526716 ?auto_526715 ) ( ON ?auto_526717 ?auto_526716 ) ( ON ?auto_526718 ?auto_526717 ) ( ON ?auto_526719 ?auto_526718 ) ( ON ?auto_526720 ?auto_526719 ) ( ON ?auto_526721 ?auto_526720 ) ( ON ?auto_526722 ?auto_526721 ) ( ON ?auto_526723 ?auto_526722 ) ( ON ?auto_526724 ?auto_526723 ) ( not ( = ?auto_526711 ?auto_526712 ) ) ( not ( = ?auto_526711 ?auto_526713 ) ) ( not ( = ?auto_526711 ?auto_526714 ) ) ( not ( = ?auto_526711 ?auto_526715 ) ) ( not ( = ?auto_526711 ?auto_526716 ) ) ( not ( = ?auto_526711 ?auto_526717 ) ) ( not ( = ?auto_526711 ?auto_526718 ) ) ( not ( = ?auto_526711 ?auto_526719 ) ) ( not ( = ?auto_526711 ?auto_526720 ) ) ( not ( = ?auto_526711 ?auto_526721 ) ) ( not ( = ?auto_526711 ?auto_526722 ) ) ( not ( = ?auto_526711 ?auto_526723 ) ) ( not ( = ?auto_526711 ?auto_526724 ) ) ( not ( = ?auto_526711 ?auto_526725 ) ) ( not ( = ?auto_526711 ?auto_526726 ) ) ( not ( = ?auto_526712 ?auto_526713 ) ) ( not ( = ?auto_526712 ?auto_526714 ) ) ( not ( = ?auto_526712 ?auto_526715 ) ) ( not ( = ?auto_526712 ?auto_526716 ) ) ( not ( = ?auto_526712 ?auto_526717 ) ) ( not ( = ?auto_526712 ?auto_526718 ) ) ( not ( = ?auto_526712 ?auto_526719 ) ) ( not ( = ?auto_526712 ?auto_526720 ) ) ( not ( = ?auto_526712 ?auto_526721 ) ) ( not ( = ?auto_526712 ?auto_526722 ) ) ( not ( = ?auto_526712 ?auto_526723 ) ) ( not ( = ?auto_526712 ?auto_526724 ) ) ( not ( = ?auto_526712 ?auto_526725 ) ) ( not ( = ?auto_526712 ?auto_526726 ) ) ( not ( = ?auto_526713 ?auto_526714 ) ) ( not ( = ?auto_526713 ?auto_526715 ) ) ( not ( = ?auto_526713 ?auto_526716 ) ) ( not ( = ?auto_526713 ?auto_526717 ) ) ( not ( = ?auto_526713 ?auto_526718 ) ) ( not ( = ?auto_526713 ?auto_526719 ) ) ( not ( = ?auto_526713 ?auto_526720 ) ) ( not ( = ?auto_526713 ?auto_526721 ) ) ( not ( = ?auto_526713 ?auto_526722 ) ) ( not ( = ?auto_526713 ?auto_526723 ) ) ( not ( = ?auto_526713 ?auto_526724 ) ) ( not ( = ?auto_526713 ?auto_526725 ) ) ( not ( = ?auto_526713 ?auto_526726 ) ) ( not ( = ?auto_526714 ?auto_526715 ) ) ( not ( = ?auto_526714 ?auto_526716 ) ) ( not ( = ?auto_526714 ?auto_526717 ) ) ( not ( = ?auto_526714 ?auto_526718 ) ) ( not ( = ?auto_526714 ?auto_526719 ) ) ( not ( = ?auto_526714 ?auto_526720 ) ) ( not ( = ?auto_526714 ?auto_526721 ) ) ( not ( = ?auto_526714 ?auto_526722 ) ) ( not ( = ?auto_526714 ?auto_526723 ) ) ( not ( = ?auto_526714 ?auto_526724 ) ) ( not ( = ?auto_526714 ?auto_526725 ) ) ( not ( = ?auto_526714 ?auto_526726 ) ) ( not ( = ?auto_526715 ?auto_526716 ) ) ( not ( = ?auto_526715 ?auto_526717 ) ) ( not ( = ?auto_526715 ?auto_526718 ) ) ( not ( = ?auto_526715 ?auto_526719 ) ) ( not ( = ?auto_526715 ?auto_526720 ) ) ( not ( = ?auto_526715 ?auto_526721 ) ) ( not ( = ?auto_526715 ?auto_526722 ) ) ( not ( = ?auto_526715 ?auto_526723 ) ) ( not ( = ?auto_526715 ?auto_526724 ) ) ( not ( = ?auto_526715 ?auto_526725 ) ) ( not ( = ?auto_526715 ?auto_526726 ) ) ( not ( = ?auto_526716 ?auto_526717 ) ) ( not ( = ?auto_526716 ?auto_526718 ) ) ( not ( = ?auto_526716 ?auto_526719 ) ) ( not ( = ?auto_526716 ?auto_526720 ) ) ( not ( = ?auto_526716 ?auto_526721 ) ) ( not ( = ?auto_526716 ?auto_526722 ) ) ( not ( = ?auto_526716 ?auto_526723 ) ) ( not ( = ?auto_526716 ?auto_526724 ) ) ( not ( = ?auto_526716 ?auto_526725 ) ) ( not ( = ?auto_526716 ?auto_526726 ) ) ( not ( = ?auto_526717 ?auto_526718 ) ) ( not ( = ?auto_526717 ?auto_526719 ) ) ( not ( = ?auto_526717 ?auto_526720 ) ) ( not ( = ?auto_526717 ?auto_526721 ) ) ( not ( = ?auto_526717 ?auto_526722 ) ) ( not ( = ?auto_526717 ?auto_526723 ) ) ( not ( = ?auto_526717 ?auto_526724 ) ) ( not ( = ?auto_526717 ?auto_526725 ) ) ( not ( = ?auto_526717 ?auto_526726 ) ) ( not ( = ?auto_526718 ?auto_526719 ) ) ( not ( = ?auto_526718 ?auto_526720 ) ) ( not ( = ?auto_526718 ?auto_526721 ) ) ( not ( = ?auto_526718 ?auto_526722 ) ) ( not ( = ?auto_526718 ?auto_526723 ) ) ( not ( = ?auto_526718 ?auto_526724 ) ) ( not ( = ?auto_526718 ?auto_526725 ) ) ( not ( = ?auto_526718 ?auto_526726 ) ) ( not ( = ?auto_526719 ?auto_526720 ) ) ( not ( = ?auto_526719 ?auto_526721 ) ) ( not ( = ?auto_526719 ?auto_526722 ) ) ( not ( = ?auto_526719 ?auto_526723 ) ) ( not ( = ?auto_526719 ?auto_526724 ) ) ( not ( = ?auto_526719 ?auto_526725 ) ) ( not ( = ?auto_526719 ?auto_526726 ) ) ( not ( = ?auto_526720 ?auto_526721 ) ) ( not ( = ?auto_526720 ?auto_526722 ) ) ( not ( = ?auto_526720 ?auto_526723 ) ) ( not ( = ?auto_526720 ?auto_526724 ) ) ( not ( = ?auto_526720 ?auto_526725 ) ) ( not ( = ?auto_526720 ?auto_526726 ) ) ( not ( = ?auto_526721 ?auto_526722 ) ) ( not ( = ?auto_526721 ?auto_526723 ) ) ( not ( = ?auto_526721 ?auto_526724 ) ) ( not ( = ?auto_526721 ?auto_526725 ) ) ( not ( = ?auto_526721 ?auto_526726 ) ) ( not ( = ?auto_526722 ?auto_526723 ) ) ( not ( = ?auto_526722 ?auto_526724 ) ) ( not ( = ?auto_526722 ?auto_526725 ) ) ( not ( = ?auto_526722 ?auto_526726 ) ) ( not ( = ?auto_526723 ?auto_526724 ) ) ( not ( = ?auto_526723 ?auto_526725 ) ) ( not ( = ?auto_526723 ?auto_526726 ) ) ( not ( = ?auto_526724 ?auto_526725 ) ) ( not ( = ?auto_526724 ?auto_526726 ) ) ( not ( = ?auto_526725 ?auto_526726 ) ) ( CLEAR ?auto_526724 ) ( ON ?auto_526725 ?auto_526726 ) ( CLEAR ?auto_526725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_526711 ?auto_526712 ?auto_526713 ?auto_526714 ?auto_526715 ?auto_526716 ?auto_526717 ?auto_526718 ?auto_526719 ?auto_526720 ?auto_526721 ?auto_526722 ?auto_526723 ?auto_526724 ?auto_526725 )
      ( MAKE-16PILE ?auto_526711 ?auto_526712 ?auto_526713 ?auto_526714 ?auto_526715 ?auto_526716 ?auto_526717 ?auto_526718 ?auto_526719 ?auto_526720 ?auto_526721 ?auto_526722 ?auto_526723 ?auto_526724 ?auto_526725 ?auto_526726 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_526743 - BLOCK
      ?auto_526744 - BLOCK
      ?auto_526745 - BLOCK
      ?auto_526746 - BLOCK
      ?auto_526747 - BLOCK
      ?auto_526748 - BLOCK
      ?auto_526749 - BLOCK
      ?auto_526750 - BLOCK
      ?auto_526751 - BLOCK
      ?auto_526752 - BLOCK
      ?auto_526753 - BLOCK
      ?auto_526754 - BLOCK
      ?auto_526755 - BLOCK
      ?auto_526756 - BLOCK
      ?auto_526757 - BLOCK
      ?auto_526758 - BLOCK
    )
    :vars
    (
      ?auto_526759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526758 ?auto_526759 ) ( ON-TABLE ?auto_526743 ) ( ON ?auto_526744 ?auto_526743 ) ( ON ?auto_526745 ?auto_526744 ) ( ON ?auto_526746 ?auto_526745 ) ( ON ?auto_526747 ?auto_526746 ) ( ON ?auto_526748 ?auto_526747 ) ( ON ?auto_526749 ?auto_526748 ) ( ON ?auto_526750 ?auto_526749 ) ( ON ?auto_526751 ?auto_526750 ) ( ON ?auto_526752 ?auto_526751 ) ( ON ?auto_526753 ?auto_526752 ) ( ON ?auto_526754 ?auto_526753 ) ( ON ?auto_526755 ?auto_526754 ) ( not ( = ?auto_526743 ?auto_526744 ) ) ( not ( = ?auto_526743 ?auto_526745 ) ) ( not ( = ?auto_526743 ?auto_526746 ) ) ( not ( = ?auto_526743 ?auto_526747 ) ) ( not ( = ?auto_526743 ?auto_526748 ) ) ( not ( = ?auto_526743 ?auto_526749 ) ) ( not ( = ?auto_526743 ?auto_526750 ) ) ( not ( = ?auto_526743 ?auto_526751 ) ) ( not ( = ?auto_526743 ?auto_526752 ) ) ( not ( = ?auto_526743 ?auto_526753 ) ) ( not ( = ?auto_526743 ?auto_526754 ) ) ( not ( = ?auto_526743 ?auto_526755 ) ) ( not ( = ?auto_526743 ?auto_526756 ) ) ( not ( = ?auto_526743 ?auto_526757 ) ) ( not ( = ?auto_526743 ?auto_526758 ) ) ( not ( = ?auto_526743 ?auto_526759 ) ) ( not ( = ?auto_526744 ?auto_526745 ) ) ( not ( = ?auto_526744 ?auto_526746 ) ) ( not ( = ?auto_526744 ?auto_526747 ) ) ( not ( = ?auto_526744 ?auto_526748 ) ) ( not ( = ?auto_526744 ?auto_526749 ) ) ( not ( = ?auto_526744 ?auto_526750 ) ) ( not ( = ?auto_526744 ?auto_526751 ) ) ( not ( = ?auto_526744 ?auto_526752 ) ) ( not ( = ?auto_526744 ?auto_526753 ) ) ( not ( = ?auto_526744 ?auto_526754 ) ) ( not ( = ?auto_526744 ?auto_526755 ) ) ( not ( = ?auto_526744 ?auto_526756 ) ) ( not ( = ?auto_526744 ?auto_526757 ) ) ( not ( = ?auto_526744 ?auto_526758 ) ) ( not ( = ?auto_526744 ?auto_526759 ) ) ( not ( = ?auto_526745 ?auto_526746 ) ) ( not ( = ?auto_526745 ?auto_526747 ) ) ( not ( = ?auto_526745 ?auto_526748 ) ) ( not ( = ?auto_526745 ?auto_526749 ) ) ( not ( = ?auto_526745 ?auto_526750 ) ) ( not ( = ?auto_526745 ?auto_526751 ) ) ( not ( = ?auto_526745 ?auto_526752 ) ) ( not ( = ?auto_526745 ?auto_526753 ) ) ( not ( = ?auto_526745 ?auto_526754 ) ) ( not ( = ?auto_526745 ?auto_526755 ) ) ( not ( = ?auto_526745 ?auto_526756 ) ) ( not ( = ?auto_526745 ?auto_526757 ) ) ( not ( = ?auto_526745 ?auto_526758 ) ) ( not ( = ?auto_526745 ?auto_526759 ) ) ( not ( = ?auto_526746 ?auto_526747 ) ) ( not ( = ?auto_526746 ?auto_526748 ) ) ( not ( = ?auto_526746 ?auto_526749 ) ) ( not ( = ?auto_526746 ?auto_526750 ) ) ( not ( = ?auto_526746 ?auto_526751 ) ) ( not ( = ?auto_526746 ?auto_526752 ) ) ( not ( = ?auto_526746 ?auto_526753 ) ) ( not ( = ?auto_526746 ?auto_526754 ) ) ( not ( = ?auto_526746 ?auto_526755 ) ) ( not ( = ?auto_526746 ?auto_526756 ) ) ( not ( = ?auto_526746 ?auto_526757 ) ) ( not ( = ?auto_526746 ?auto_526758 ) ) ( not ( = ?auto_526746 ?auto_526759 ) ) ( not ( = ?auto_526747 ?auto_526748 ) ) ( not ( = ?auto_526747 ?auto_526749 ) ) ( not ( = ?auto_526747 ?auto_526750 ) ) ( not ( = ?auto_526747 ?auto_526751 ) ) ( not ( = ?auto_526747 ?auto_526752 ) ) ( not ( = ?auto_526747 ?auto_526753 ) ) ( not ( = ?auto_526747 ?auto_526754 ) ) ( not ( = ?auto_526747 ?auto_526755 ) ) ( not ( = ?auto_526747 ?auto_526756 ) ) ( not ( = ?auto_526747 ?auto_526757 ) ) ( not ( = ?auto_526747 ?auto_526758 ) ) ( not ( = ?auto_526747 ?auto_526759 ) ) ( not ( = ?auto_526748 ?auto_526749 ) ) ( not ( = ?auto_526748 ?auto_526750 ) ) ( not ( = ?auto_526748 ?auto_526751 ) ) ( not ( = ?auto_526748 ?auto_526752 ) ) ( not ( = ?auto_526748 ?auto_526753 ) ) ( not ( = ?auto_526748 ?auto_526754 ) ) ( not ( = ?auto_526748 ?auto_526755 ) ) ( not ( = ?auto_526748 ?auto_526756 ) ) ( not ( = ?auto_526748 ?auto_526757 ) ) ( not ( = ?auto_526748 ?auto_526758 ) ) ( not ( = ?auto_526748 ?auto_526759 ) ) ( not ( = ?auto_526749 ?auto_526750 ) ) ( not ( = ?auto_526749 ?auto_526751 ) ) ( not ( = ?auto_526749 ?auto_526752 ) ) ( not ( = ?auto_526749 ?auto_526753 ) ) ( not ( = ?auto_526749 ?auto_526754 ) ) ( not ( = ?auto_526749 ?auto_526755 ) ) ( not ( = ?auto_526749 ?auto_526756 ) ) ( not ( = ?auto_526749 ?auto_526757 ) ) ( not ( = ?auto_526749 ?auto_526758 ) ) ( not ( = ?auto_526749 ?auto_526759 ) ) ( not ( = ?auto_526750 ?auto_526751 ) ) ( not ( = ?auto_526750 ?auto_526752 ) ) ( not ( = ?auto_526750 ?auto_526753 ) ) ( not ( = ?auto_526750 ?auto_526754 ) ) ( not ( = ?auto_526750 ?auto_526755 ) ) ( not ( = ?auto_526750 ?auto_526756 ) ) ( not ( = ?auto_526750 ?auto_526757 ) ) ( not ( = ?auto_526750 ?auto_526758 ) ) ( not ( = ?auto_526750 ?auto_526759 ) ) ( not ( = ?auto_526751 ?auto_526752 ) ) ( not ( = ?auto_526751 ?auto_526753 ) ) ( not ( = ?auto_526751 ?auto_526754 ) ) ( not ( = ?auto_526751 ?auto_526755 ) ) ( not ( = ?auto_526751 ?auto_526756 ) ) ( not ( = ?auto_526751 ?auto_526757 ) ) ( not ( = ?auto_526751 ?auto_526758 ) ) ( not ( = ?auto_526751 ?auto_526759 ) ) ( not ( = ?auto_526752 ?auto_526753 ) ) ( not ( = ?auto_526752 ?auto_526754 ) ) ( not ( = ?auto_526752 ?auto_526755 ) ) ( not ( = ?auto_526752 ?auto_526756 ) ) ( not ( = ?auto_526752 ?auto_526757 ) ) ( not ( = ?auto_526752 ?auto_526758 ) ) ( not ( = ?auto_526752 ?auto_526759 ) ) ( not ( = ?auto_526753 ?auto_526754 ) ) ( not ( = ?auto_526753 ?auto_526755 ) ) ( not ( = ?auto_526753 ?auto_526756 ) ) ( not ( = ?auto_526753 ?auto_526757 ) ) ( not ( = ?auto_526753 ?auto_526758 ) ) ( not ( = ?auto_526753 ?auto_526759 ) ) ( not ( = ?auto_526754 ?auto_526755 ) ) ( not ( = ?auto_526754 ?auto_526756 ) ) ( not ( = ?auto_526754 ?auto_526757 ) ) ( not ( = ?auto_526754 ?auto_526758 ) ) ( not ( = ?auto_526754 ?auto_526759 ) ) ( not ( = ?auto_526755 ?auto_526756 ) ) ( not ( = ?auto_526755 ?auto_526757 ) ) ( not ( = ?auto_526755 ?auto_526758 ) ) ( not ( = ?auto_526755 ?auto_526759 ) ) ( not ( = ?auto_526756 ?auto_526757 ) ) ( not ( = ?auto_526756 ?auto_526758 ) ) ( not ( = ?auto_526756 ?auto_526759 ) ) ( not ( = ?auto_526757 ?auto_526758 ) ) ( not ( = ?auto_526757 ?auto_526759 ) ) ( not ( = ?auto_526758 ?auto_526759 ) ) ( ON ?auto_526757 ?auto_526758 ) ( CLEAR ?auto_526755 ) ( ON ?auto_526756 ?auto_526757 ) ( CLEAR ?auto_526756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_526743 ?auto_526744 ?auto_526745 ?auto_526746 ?auto_526747 ?auto_526748 ?auto_526749 ?auto_526750 ?auto_526751 ?auto_526752 ?auto_526753 ?auto_526754 ?auto_526755 ?auto_526756 )
      ( MAKE-16PILE ?auto_526743 ?auto_526744 ?auto_526745 ?auto_526746 ?auto_526747 ?auto_526748 ?auto_526749 ?auto_526750 ?auto_526751 ?auto_526752 ?auto_526753 ?auto_526754 ?auto_526755 ?auto_526756 ?auto_526757 ?auto_526758 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_526776 - BLOCK
      ?auto_526777 - BLOCK
      ?auto_526778 - BLOCK
      ?auto_526779 - BLOCK
      ?auto_526780 - BLOCK
      ?auto_526781 - BLOCK
      ?auto_526782 - BLOCK
      ?auto_526783 - BLOCK
      ?auto_526784 - BLOCK
      ?auto_526785 - BLOCK
      ?auto_526786 - BLOCK
      ?auto_526787 - BLOCK
      ?auto_526788 - BLOCK
      ?auto_526789 - BLOCK
      ?auto_526790 - BLOCK
      ?auto_526791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_526791 ) ( ON-TABLE ?auto_526776 ) ( ON ?auto_526777 ?auto_526776 ) ( ON ?auto_526778 ?auto_526777 ) ( ON ?auto_526779 ?auto_526778 ) ( ON ?auto_526780 ?auto_526779 ) ( ON ?auto_526781 ?auto_526780 ) ( ON ?auto_526782 ?auto_526781 ) ( ON ?auto_526783 ?auto_526782 ) ( ON ?auto_526784 ?auto_526783 ) ( ON ?auto_526785 ?auto_526784 ) ( ON ?auto_526786 ?auto_526785 ) ( ON ?auto_526787 ?auto_526786 ) ( ON ?auto_526788 ?auto_526787 ) ( not ( = ?auto_526776 ?auto_526777 ) ) ( not ( = ?auto_526776 ?auto_526778 ) ) ( not ( = ?auto_526776 ?auto_526779 ) ) ( not ( = ?auto_526776 ?auto_526780 ) ) ( not ( = ?auto_526776 ?auto_526781 ) ) ( not ( = ?auto_526776 ?auto_526782 ) ) ( not ( = ?auto_526776 ?auto_526783 ) ) ( not ( = ?auto_526776 ?auto_526784 ) ) ( not ( = ?auto_526776 ?auto_526785 ) ) ( not ( = ?auto_526776 ?auto_526786 ) ) ( not ( = ?auto_526776 ?auto_526787 ) ) ( not ( = ?auto_526776 ?auto_526788 ) ) ( not ( = ?auto_526776 ?auto_526789 ) ) ( not ( = ?auto_526776 ?auto_526790 ) ) ( not ( = ?auto_526776 ?auto_526791 ) ) ( not ( = ?auto_526777 ?auto_526778 ) ) ( not ( = ?auto_526777 ?auto_526779 ) ) ( not ( = ?auto_526777 ?auto_526780 ) ) ( not ( = ?auto_526777 ?auto_526781 ) ) ( not ( = ?auto_526777 ?auto_526782 ) ) ( not ( = ?auto_526777 ?auto_526783 ) ) ( not ( = ?auto_526777 ?auto_526784 ) ) ( not ( = ?auto_526777 ?auto_526785 ) ) ( not ( = ?auto_526777 ?auto_526786 ) ) ( not ( = ?auto_526777 ?auto_526787 ) ) ( not ( = ?auto_526777 ?auto_526788 ) ) ( not ( = ?auto_526777 ?auto_526789 ) ) ( not ( = ?auto_526777 ?auto_526790 ) ) ( not ( = ?auto_526777 ?auto_526791 ) ) ( not ( = ?auto_526778 ?auto_526779 ) ) ( not ( = ?auto_526778 ?auto_526780 ) ) ( not ( = ?auto_526778 ?auto_526781 ) ) ( not ( = ?auto_526778 ?auto_526782 ) ) ( not ( = ?auto_526778 ?auto_526783 ) ) ( not ( = ?auto_526778 ?auto_526784 ) ) ( not ( = ?auto_526778 ?auto_526785 ) ) ( not ( = ?auto_526778 ?auto_526786 ) ) ( not ( = ?auto_526778 ?auto_526787 ) ) ( not ( = ?auto_526778 ?auto_526788 ) ) ( not ( = ?auto_526778 ?auto_526789 ) ) ( not ( = ?auto_526778 ?auto_526790 ) ) ( not ( = ?auto_526778 ?auto_526791 ) ) ( not ( = ?auto_526779 ?auto_526780 ) ) ( not ( = ?auto_526779 ?auto_526781 ) ) ( not ( = ?auto_526779 ?auto_526782 ) ) ( not ( = ?auto_526779 ?auto_526783 ) ) ( not ( = ?auto_526779 ?auto_526784 ) ) ( not ( = ?auto_526779 ?auto_526785 ) ) ( not ( = ?auto_526779 ?auto_526786 ) ) ( not ( = ?auto_526779 ?auto_526787 ) ) ( not ( = ?auto_526779 ?auto_526788 ) ) ( not ( = ?auto_526779 ?auto_526789 ) ) ( not ( = ?auto_526779 ?auto_526790 ) ) ( not ( = ?auto_526779 ?auto_526791 ) ) ( not ( = ?auto_526780 ?auto_526781 ) ) ( not ( = ?auto_526780 ?auto_526782 ) ) ( not ( = ?auto_526780 ?auto_526783 ) ) ( not ( = ?auto_526780 ?auto_526784 ) ) ( not ( = ?auto_526780 ?auto_526785 ) ) ( not ( = ?auto_526780 ?auto_526786 ) ) ( not ( = ?auto_526780 ?auto_526787 ) ) ( not ( = ?auto_526780 ?auto_526788 ) ) ( not ( = ?auto_526780 ?auto_526789 ) ) ( not ( = ?auto_526780 ?auto_526790 ) ) ( not ( = ?auto_526780 ?auto_526791 ) ) ( not ( = ?auto_526781 ?auto_526782 ) ) ( not ( = ?auto_526781 ?auto_526783 ) ) ( not ( = ?auto_526781 ?auto_526784 ) ) ( not ( = ?auto_526781 ?auto_526785 ) ) ( not ( = ?auto_526781 ?auto_526786 ) ) ( not ( = ?auto_526781 ?auto_526787 ) ) ( not ( = ?auto_526781 ?auto_526788 ) ) ( not ( = ?auto_526781 ?auto_526789 ) ) ( not ( = ?auto_526781 ?auto_526790 ) ) ( not ( = ?auto_526781 ?auto_526791 ) ) ( not ( = ?auto_526782 ?auto_526783 ) ) ( not ( = ?auto_526782 ?auto_526784 ) ) ( not ( = ?auto_526782 ?auto_526785 ) ) ( not ( = ?auto_526782 ?auto_526786 ) ) ( not ( = ?auto_526782 ?auto_526787 ) ) ( not ( = ?auto_526782 ?auto_526788 ) ) ( not ( = ?auto_526782 ?auto_526789 ) ) ( not ( = ?auto_526782 ?auto_526790 ) ) ( not ( = ?auto_526782 ?auto_526791 ) ) ( not ( = ?auto_526783 ?auto_526784 ) ) ( not ( = ?auto_526783 ?auto_526785 ) ) ( not ( = ?auto_526783 ?auto_526786 ) ) ( not ( = ?auto_526783 ?auto_526787 ) ) ( not ( = ?auto_526783 ?auto_526788 ) ) ( not ( = ?auto_526783 ?auto_526789 ) ) ( not ( = ?auto_526783 ?auto_526790 ) ) ( not ( = ?auto_526783 ?auto_526791 ) ) ( not ( = ?auto_526784 ?auto_526785 ) ) ( not ( = ?auto_526784 ?auto_526786 ) ) ( not ( = ?auto_526784 ?auto_526787 ) ) ( not ( = ?auto_526784 ?auto_526788 ) ) ( not ( = ?auto_526784 ?auto_526789 ) ) ( not ( = ?auto_526784 ?auto_526790 ) ) ( not ( = ?auto_526784 ?auto_526791 ) ) ( not ( = ?auto_526785 ?auto_526786 ) ) ( not ( = ?auto_526785 ?auto_526787 ) ) ( not ( = ?auto_526785 ?auto_526788 ) ) ( not ( = ?auto_526785 ?auto_526789 ) ) ( not ( = ?auto_526785 ?auto_526790 ) ) ( not ( = ?auto_526785 ?auto_526791 ) ) ( not ( = ?auto_526786 ?auto_526787 ) ) ( not ( = ?auto_526786 ?auto_526788 ) ) ( not ( = ?auto_526786 ?auto_526789 ) ) ( not ( = ?auto_526786 ?auto_526790 ) ) ( not ( = ?auto_526786 ?auto_526791 ) ) ( not ( = ?auto_526787 ?auto_526788 ) ) ( not ( = ?auto_526787 ?auto_526789 ) ) ( not ( = ?auto_526787 ?auto_526790 ) ) ( not ( = ?auto_526787 ?auto_526791 ) ) ( not ( = ?auto_526788 ?auto_526789 ) ) ( not ( = ?auto_526788 ?auto_526790 ) ) ( not ( = ?auto_526788 ?auto_526791 ) ) ( not ( = ?auto_526789 ?auto_526790 ) ) ( not ( = ?auto_526789 ?auto_526791 ) ) ( not ( = ?auto_526790 ?auto_526791 ) ) ( ON ?auto_526790 ?auto_526791 ) ( CLEAR ?auto_526788 ) ( ON ?auto_526789 ?auto_526790 ) ( CLEAR ?auto_526789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_526776 ?auto_526777 ?auto_526778 ?auto_526779 ?auto_526780 ?auto_526781 ?auto_526782 ?auto_526783 ?auto_526784 ?auto_526785 ?auto_526786 ?auto_526787 ?auto_526788 ?auto_526789 )
      ( MAKE-16PILE ?auto_526776 ?auto_526777 ?auto_526778 ?auto_526779 ?auto_526780 ?auto_526781 ?auto_526782 ?auto_526783 ?auto_526784 ?auto_526785 ?auto_526786 ?auto_526787 ?auto_526788 ?auto_526789 ?auto_526790 ?auto_526791 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_526808 - BLOCK
      ?auto_526809 - BLOCK
      ?auto_526810 - BLOCK
      ?auto_526811 - BLOCK
      ?auto_526812 - BLOCK
      ?auto_526813 - BLOCK
      ?auto_526814 - BLOCK
      ?auto_526815 - BLOCK
      ?auto_526816 - BLOCK
      ?auto_526817 - BLOCK
      ?auto_526818 - BLOCK
      ?auto_526819 - BLOCK
      ?auto_526820 - BLOCK
      ?auto_526821 - BLOCK
      ?auto_526822 - BLOCK
      ?auto_526823 - BLOCK
    )
    :vars
    (
      ?auto_526824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526823 ?auto_526824 ) ( ON-TABLE ?auto_526808 ) ( ON ?auto_526809 ?auto_526808 ) ( ON ?auto_526810 ?auto_526809 ) ( ON ?auto_526811 ?auto_526810 ) ( ON ?auto_526812 ?auto_526811 ) ( ON ?auto_526813 ?auto_526812 ) ( ON ?auto_526814 ?auto_526813 ) ( ON ?auto_526815 ?auto_526814 ) ( ON ?auto_526816 ?auto_526815 ) ( ON ?auto_526817 ?auto_526816 ) ( ON ?auto_526818 ?auto_526817 ) ( ON ?auto_526819 ?auto_526818 ) ( not ( = ?auto_526808 ?auto_526809 ) ) ( not ( = ?auto_526808 ?auto_526810 ) ) ( not ( = ?auto_526808 ?auto_526811 ) ) ( not ( = ?auto_526808 ?auto_526812 ) ) ( not ( = ?auto_526808 ?auto_526813 ) ) ( not ( = ?auto_526808 ?auto_526814 ) ) ( not ( = ?auto_526808 ?auto_526815 ) ) ( not ( = ?auto_526808 ?auto_526816 ) ) ( not ( = ?auto_526808 ?auto_526817 ) ) ( not ( = ?auto_526808 ?auto_526818 ) ) ( not ( = ?auto_526808 ?auto_526819 ) ) ( not ( = ?auto_526808 ?auto_526820 ) ) ( not ( = ?auto_526808 ?auto_526821 ) ) ( not ( = ?auto_526808 ?auto_526822 ) ) ( not ( = ?auto_526808 ?auto_526823 ) ) ( not ( = ?auto_526808 ?auto_526824 ) ) ( not ( = ?auto_526809 ?auto_526810 ) ) ( not ( = ?auto_526809 ?auto_526811 ) ) ( not ( = ?auto_526809 ?auto_526812 ) ) ( not ( = ?auto_526809 ?auto_526813 ) ) ( not ( = ?auto_526809 ?auto_526814 ) ) ( not ( = ?auto_526809 ?auto_526815 ) ) ( not ( = ?auto_526809 ?auto_526816 ) ) ( not ( = ?auto_526809 ?auto_526817 ) ) ( not ( = ?auto_526809 ?auto_526818 ) ) ( not ( = ?auto_526809 ?auto_526819 ) ) ( not ( = ?auto_526809 ?auto_526820 ) ) ( not ( = ?auto_526809 ?auto_526821 ) ) ( not ( = ?auto_526809 ?auto_526822 ) ) ( not ( = ?auto_526809 ?auto_526823 ) ) ( not ( = ?auto_526809 ?auto_526824 ) ) ( not ( = ?auto_526810 ?auto_526811 ) ) ( not ( = ?auto_526810 ?auto_526812 ) ) ( not ( = ?auto_526810 ?auto_526813 ) ) ( not ( = ?auto_526810 ?auto_526814 ) ) ( not ( = ?auto_526810 ?auto_526815 ) ) ( not ( = ?auto_526810 ?auto_526816 ) ) ( not ( = ?auto_526810 ?auto_526817 ) ) ( not ( = ?auto_526810 ?auto_526818 ) ) ( not ( = ?auto_526810 ?auto_526819 ) ) ( not ( = ?auto_526810 ?auto_526820 ) ) ( not ( = ?auto_526810 ?auto_526821 ) ) ( not ( = ?auto_526810 ?auto_526822 ) ) ( not ( = ?auto_526810 ?auto_526823 ) ) ( not ( = ?auto_526810 ?auto_526824 ) ) ( not ( = ?auto_526811 ?auto_526812 ) ) ( not ( = ?auto_526811 ?auto_526813 ) ) ( not ( = ?auto_526811 ?auto_526814 ) ) ( not ( = ?auto_526811 ?auto_526815 ) ) ( not ( = ?auto_526811 ?auto_526816 ) ) ( not ( = ?auto_526811 ?auto_526817 ) ) ( not ( = ?auto_526811 ?auto_526818 ) ) ( not ( = ?auto_526811 ?auto_526819 ) ) ( not ( = ?auto_526811 ?auto_526820 ) ) ( not ( = ?auto_526811 ?auto_526821 ) ) ( not ( = ?auto_526811 ?auto_526822 ) ) ( not ( = ?auto_526811 ?auto_526823 ) ) ( not ( = ?auto_526811 ?auto_526824 ) ) ( not ( = ?auto_526812 ?auto_526813 ) ) ( not ( = ?auto_526812 ?auto_526814 ) ) ( not ( = ?auto_526812 ?auto_526815 ) ) ( not ( = ?auto_526812 ?auto_526816 ) ) ( not ( = ?auto_526812 ?auto_526817 ) ) ( not ( = ?auto_526812 ?auto_526818 ) ) ( not ( = ?auto_526812 ?auto_526819 ) ) ( not ( = ?auto_526812 ?auto_526820 ) ) ( not ( = ?auto_526812 ?auto_526821 ) ) ( not ( = ?auto_526812 ?auto_526822 ) ) ( not ( = ?auto_526812 ?auto_526823 ) ) ( not ( = ?auto_526812 ?auto_526824 ) ) ( not ( = ?auto_526813 ?auto_526814 ) ) ( not ( = ?auto_526813 ?auto_526815 ) ) ( not ( = ?auto_526813 ?auto_526816 ) ) ( not ( = ?auto_526813 ?auto_526817 ) ) ( not ( = ?auto_526813 ?auto_526818 ) ) ( not ( = ?auto_526813 ?auto_526819 ) ) ( not ( = ?auto_526813 ?auto_526820 ) ) ( not ( = ?auto_526813 ?auto_526821 ) ) ( not ( = ?auto_526813 ?auto_526822 ) ) ( not ( = ?auto_526813 ?auto_526823 ) ) ( not ( = ?auto_526813 ?auto_526824 ) ) ( not ( = ?auto_526814 ?auto_526815 ) ) ( not ( = ?auto_526814 ?auto_526816 ) ) ( not ( = ?auto_526814 ?auto_526817 ) ) ( not ( = ?auto_526814 ?auto_526818 ) ) ( not ( = ?auto_526814 ?auto_526819 ) ) ( not ( = ?auto_526814 ?auto_526820 ) ) ( not ( = ?auto_526814 ?auto_526821 ) ) ( not ( = ?auto_526814 ?auto_526822 ) ) ( not ( = ?auto_526814 ?auto_526823 ) ) ( not ( = ?auto_526814 ?auto_526824 ) ) ( not ( = ?auto_526815 ?auto_526816 ) ) ( not ( = ?auto_526815 ?auto_526817 ) ) ( not ( = ?auto_526815 ?auto_526818 ) ) ( not ( = ?auto_526815 ?auto_526819 ) ) ( not ( = ?auto_526815 ?auto_526820 ) ) ( not ( = ?auto_526815 ?auto_526821 ) ) ( not ( = ?auto_526815 ?auto_526822 ) ) ( not ( = ?auto_526815 ?auto_526823 ) ) ( not ( = ?auto_526815 ?auto_526824 ) ) ( not ( = ?auto_526816 ?auto_526817 ) ) ( not ( = ?auto_526816 ?auto_526818 ) ) ( not ( = ?auto_526816 ?auto_526819 ) ) ( not ( = ?auto_526816 ?auto_526820 ) ) ( not ( = ?auto_526816 ?auto_526821 ) ) ( not ( = ?auto_526816 ?auto_526822 ) ) ( not ( = ?auto_526816 ?auto_526823 ) ) ( not ( = ?auto_526816 ?auto_526824 ) ) ( not ( = ?auto_526817 ?auto_526818 ) ) ( not ( = ?auto_526817 ?auto_526819 ) ) ( not ( = ?auto_526817 ?auto_526820 ) ) ( not ( = ?auto_526817 ?auto_526821 ) ) ( not ( = ?auto_526817 ?auto_526822 ) ) ( not ( = ?auto_526817 ?auto_526823 ) ) ( not ( = ?auto_526817 ?auto_526824 ) ) ( not ( = ?auto_526818 ?auto_526819 ) ) ( not ( = ?auto_526818 ?auto_526820 ) ) ( not ( = ?auto_526818 ?auto_526821 ) ) ( not ( = ?auto_526818 ?auto_526822 ) ) ( not ( = ?auto_526818 ?auto_526823 ) ) ( not ( = ?auto_526818 ?auto_526824 ) ) ( not ( = ?auto_526819 ?auto_526820 ) ) ( not ( = ?auto_526819 ?auto_526821 ) ) ( not ( = ?auto_526819 ?auto_526822 ) ) ( not ( = ?auto_526819 ?auto_526823 ) ) ( not ( = ?auto_526819 ?auto_526824 ) ) ( not ( = ?auto_526820 ?auto_526821 ) ) ( not ( = ?auto_526820 ?auto_526822 ) ) ( not ( = ?auto_526820 ?auto_526823 ) ) ( not ( = ?auto_526820 ?auto_526824 ) ) ( not ( = ?auto_526821 ?auto_526822 ) ) ( not ( = ?auto_526821 ?auto_526823 ) ) ( not ( = ?auto_526821 ?auto_526824 ) ) ( not ( = ?auto_526822 ?auto_526823 ) ) ( not ( = ?auto_526822 ?auto_526824 ) ) ( not ( = ?auto_526823 ?auto_526824 ) ) ( ON ?auto_526822 ?auto_526823 ) ( ON ?auto_526821 ?auto_526822 ) ( CLEAR ?auto_526819 ) ( ON ?auto_526820 ?auto_526821 ) ( CLEAR ?auto_526820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_526808 ?auto_526809 ?auto_526810 ?auto_526811 ?auto_526812 ?auto_526813 ?auto_526814 ?auto_526815 ?auto_526816 ?auto_526817 ?auto_526818 ?auto_526819 ?auto_526820 )
      ( MAKE-16PILE ?auto_526808 ?auto_526809 ?auto_526810 ?auto_526811 ?auto_526812 ?auto_526813 ?auto_526814 ?auto_526815 ?auto_526816 ?auto_526817 ?auto_526818 ?auto_526819 ?auto_526820 ?auto_526821 ?auto_526822 ?auto_526823 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_526841 - BLOCK
      ?auto_526842 - BLOCK
      ?auto_526843 - BLOCK
      ?auto_526844 - BLOCK
      ?auto_526845 - BLOCK
      ?auto_526846 - BLOCK
      ?auto_526847 - BLOCK
      ?auto_526848 - BLOCK
      ?auto_526849 - BLOCK
      ?auto_526850 - BLOCK
      ?auto_526851 - BLOCK
      ?auto_526852 - BLOCK
      ?auto_526853 - BLOCK
      ?auto_526854 - BLOCK
      ?auto_526855 - BLOCK
      ?auto_526856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_526856 ) ( ON-TABLE ?auto_526841 ) ( ON ?auto_526842 ?auto_526841 ) ( ON ?auto_526843 ?auto_526842 ) ( ON ?auto_526844 ?auto_526843 ) ( ON ?auto_526845 ?auto_526844 ) ( ON ?auto_526846 ?auto_526845 ) ( ON ?auto_526847 ?auto_526846 ) ( ON ?auto_526848 ?auto_526847 ) ( ON ?auto_526849 ?auto_526848 ) ( ON ?auto_526850 ?auto_526849 ) ( ON ?auto_526851 ?auto_526850 ) ( ON ?auto_526852 ?auto_526851 ) ( not ( = ?auto_526841 ?auto_526842 ) ) ( not ( = ?auto_526841 ?auto_526843 ) ) ( not ( = ?auto_526841 ?auto_526844 ) ) ( not ( = ?auto_526841 ?auto_526845 ) ) ( not ( = ?auto_526841 ?auto_526846 ) ) ( not ( = ?auto_526841 ?auto_526847 ) ) ( not ( = ?auto_526841 ?auto_526848 ) ) ( not ( = ?auto_526841 ?auto_526849 ) ) ( not ( = ?auto_526841 ?auto_526850 ) ) ( not ( = ?auto_526841 ?auto_526851 ) ) ( not ( = ?auto_526841 ?auto_526852 ) ) ( not ( = ?auto_526841 ?auto_526853 ) ) ( not ( = ?auto_526841 ?auto_526854 ) ) ( not ( = ?auto_526841 ?auto_526855 ) ) ( not ( = ?auto_526841 ?auto_526856 ) ) ( not ( = ?auto_526842 ?auto_526843 ) ) ( not ( = ?auto_526842 ?auto_526844 ) ) ( not ( = ?auto_526842 ?auto_526845 ) ) ( not ( = ?auto_526842 ?auto_526846 ) ) ( not ( = ?auto_526842 ?auto_526847 ) ) ( not ( = ?auto_526842 ?auto_526848 ) ) ( not ( = ?auto_526842 ?auto_526849 ) ) ( not ( = ?auto_526842 ?auto_526850 ) ) ( not ( = ?auto_526842 ?auto_526851 ) ) ( not ( = ?auto_526842 ?auto_526852 ) ) ( not ( = ?auto_526842 ?auto_526853 ) ) ( not ( = ?auto_526842 ?auto_526854 ) ) ( not ( = ?auto_526842 ?auto_526855 ) ) ( not ( = ?auto_526842 ?auto_526856 ) ) ( not ( = ?auto_526843 ?auto_526844 ) ) ( not ( = ?auto_526843 ?auto_526845 ) ) ( not ( = ?auto_526843 ?auto_526846 ) ) ( not ( = ?auto_526843 ?auto_526847 ) ) ( not ( = ?auto_526843 ?auto_526848 ) ) ( not ( = ?auto_526843 ?auto_526849 ) ) ( not ( = ?auto_526843 ?auto_526850 ) ) ( not ( = ?auto_526843 ?auto_526851 ) ) ( not ( = ?auto_526843 ?auto_526852 ) ) ( not ( = ?auto_526843 ?auto_526853 ) ) ( not ( = ?auto_526843 ?auto_526854 ) ) ( not ( = ?auto_526843 ?auto_526855 ) ) ( not ( = ?auto_526843 ?auto_526856 ) ) ( not ( = ?auto_526844 ?auto_526845 ) ) ( not ( = ?auto_526844 ?auto_526846 ) ) ( not ( = ?auto_526844 ?auto_526847 ) ) ( not ( = ?auto_526844 ?auto_526848 ) ) ( not ( = ?auto_526844 ?auto_526849 ) ) ( not ( = ?auto_526844 ?auto_526850 ) ) ( not ( = ?auto_526844 ?auto_526851 ) ) ( not ( = ?auto_526844 ?auto_526852 ) ) ( not ( = ?auto_526844 ?auto_526853 ) ) ( not ( = ?auto_526844 ?auto_526854 ) ) ( not ( = ?auto_526844 ?auto_526855 ) ) ( not ( = ?auto_526844 ?auto_526856 ) ) ( not ( = ?auto_526845 ?auto_526846 ) ) ( not ( = ?auto_526845 ?auto_526847 ) ) ( not ( = ?auto_526845 ?auto_526848 ) ) ( not ( = ?auto_526845 ?auto_526849 ) ) ( not ( = ?auto_526845 ?auto_526850 ) ) ( not ( = ?auto_526845 ?auto_526851 ) ) ( not ( = ?auto_526845 ?auto_526852 ) ) ( not ( = ?auto_526845 ?auto_526853 ) ) ( not ( = ?auto_526845 ?auto_526854 ) ) ( not ( = ?auto_526845 ?auto_526855 ) ) ( not ( = ?auto_526845 ?auto_526856 ) ) ( not ( = ?auto_526846 ?auto_526847 ) ) ( not ( = ?auto_526846 ?auto_526848 ) ) ( not ( = ?auto_526846 ?auto_526849 ) ) ( not ( = ?auto_526846 ?auto_526850 ) ) ( not ( = ?auto_526846 ?auto_526851 ) ) ( not ( = ?auto_526846 ?auto_526852 ) ) ( not ( = ?auto_526846 ?auto_526853 ) ) ( not ( = ?auto_526846 ?auto_526854 ) ) ( not ( = ?auto_526846 ?auto_526855 ) ) ( not ( = ?auto_526846 ?auto_526856 ) ) ( not ( = ?auto_526847 ?auto_526848 ) ) ( not ( = ?auto_526847 ?auto_526849 ) ) ( not ( = ?auto_526847 ?auto_526850 ) ) ( not ( = ?auto_526847 ?auto_526851 ) ) ( not ( = ?auto_526847 ?auto_526852 ) ) ( not ( = ?auto_526847 ?auto_526853 ) ) ( not ( = ?auto_526847 ?auto_526854 ) ) ( not ( = ?auto_526847 ?auto_526855 ) ) ( not ( = ?auto_526847 ?auto_526856 ) ) ( not ( = ?auto_526848 ?auto_526849 ) ) ( not ( = ?auto_526848 ?auto_526850 ) ) ( not ( = ?auto_526848 ?auto_526851 ) ) ( not ( = ?auto_526848 ?auto_526852 ) ) ( not ( = ?auto_526848 ?auto_526853 ) ) ( not ( = ?auto_526848 ?auto_526854 ) ) ( not ( = ?auto_526848 ?auto_526855 ) ) ( not ( = ?auto_526848 ?auto_526856 ) ) ( not ( = ?auto_526849 ?auto_526850 ) ) ( not ( = ?auto_526849 ?auto_526851 ) ) ( not ( = ?auto_526849 ?auto_526852 ) ) ( not ( = ?auto_526849 ?auto_526853 ) ) ( not ( = ?auto_526849 ?auto_526854 ) ) ( not ( = ?auto_526849 ?auto_526855 ) ) ( not ( = ?auto_526849 ?auto_526856 ) ) ( not ( = ?auto_526850 ?auto_526851 ) ) ( not ( = ?auto_526850 ?auto_526852 ) ) ( not ( = ?auto_526850 ?auto_526853 ) ) ( not ( = ?auto_526850 ?auto_526854 ) ) ( not ( = ?auto_526850 ?auto_526855 ) ) ( not ( = ?auto_526850 ?auto_526856 ) ) ( not ( = ?auto_526851 ?auto_526852 ) ) ( not ( = ?auto_526851 ?auto_526853 ) ) ( not ( = ?auto_526851 ?auto_526854 ) ) ( not ( = ?auto_526851 ?auto_526855 ) ) ( not ( = ?auto_526851 ?auto_526856 ) ) ( not ( = ?auto_526852 ?auto_526853 ) ) ( not ( = ?auto_526852 ?auto_526854 ) ) ( not ( = ?auto_526852 ?auto_526855 ) ) ( not ( = ?auto_526852 ?auto_526856 ) ) ( not ( = ?auto_526853 ?auto_526854 ) ) ( not ( = ?auto_526853 ?auto_526855 ) ) ( not ( = ?auto_526853 ?auto_526856 ) ) ( not ( = ?auto_526854 ?auto_526855 ) ) ( not ( = ?auto_526854 ?auto_526856 ) ) ( not ( = ?auto_526855 ?auto_526856 ) ) ( ON ?auto_526855 ?auto_526856 ) ( ON ?auto_526854 ?auto_526855 ) ( CLEAR ?auto_526852 ) ( ON ?auto_526853 ?auto_526854 ) ( CLEAR ?auto_526853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_526841 ?auto_526842 ?auto_526843 ?auto_526844 ?auto_526845 ?auto_526846 ?auto_526847 ?auto_526848 ?auto_526849 ?auto_526850 ?auto_526851 ?auto_526852 ?auto_526853 )
      ( MAKE-16PILE ?auto_526841 ?auto_526842 ?auto_526843 ?auto_526844 ?auto_526845 ?auto_526846 ?auto_526847 ?auto_526848 ?auto_526849 ?auto_526850 ?auto_526851 ?auto_526852 ?auto_526853 ?auto_526854 ?auto_526855 ?auto_526856 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_526873 - BLOCK
      ?auto_526874 - BLOCK
      ?auto_526875 - BLOCK
      ?auto_526876 - BLOCK
      ?auto_526877 - BLOCK
      ?auto_526878 - BLOCK
      ?auto_526879 - BLOCK
      ?auto_526880 - BLOCK
      ?auto_526881 - BLOCK
      ?auto_526882 - BLOCK
      ?auto_526883 - BLOCK
      ?auto_526884 - BLOCK
      ?auto_526885 - BLOCK
      ?auto_526886 - BLOCK
      ?auto_526887 - BLOCK
      ?auto_526888 - BLOCK
    )
    :vars
    (
      ?auto_526889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526888 ?auto_526889 ) ( ON-TABLE ?auto_526873 ) ( ON ?auto_526874 ?auto_526873 ) ( ON ?auto_526875 ?auto_526874 ) ( ON ?auto_526876 ?auto_526875 ) ( ON ?auto_526877 ?auto_526876 ) ( ON ?auto_526878 ?auto_526877 ) ( ON ?auto_526879 ?auto_526878 ) ( ON ?auto_526880 ?auto_526879 ) ( ON ?auto_526881 ?auto_526880 ) ( ON ?auto_526882 ?auto_526881 ) ( ON ?auto_526883 ?auto_526882 ) ( not ( = ?auto_526873 ?auto_526874 ) ) ( not ( = ?auto_526873 ?auto_526875 ) ) ( not ( = ?auto_526873 ?auto_526876 ) ) ( not ( = ?auto_526873 ?auto_526877 ) ) ( not ( = ?auto_526873 ?auto_526878 ) ) ( not ( = ?auto_526873 ?auto_526879 ) ) ( not ( = ?auto_526873 ?auto_526880 ) ) ( not ( = ?auto_526873 ?auto_526881 ) ) ( not ( = ?auto_526873 ?auto_526882 ) ) ( not ( = ?auto_526873 ?auto_526883 ) ) ( not ( = ?auto_526873 ?auto_526884 ) ) ( not ( = ?auto_526873 ?auto_526885 ) ) ( not ( = ?auto_526873 ?auto_526886 ) ) ( not ( = ?auto_526873 ?auto_526887 ) ) ( not ( = ?auto_526873 ?auto_526888 ) ) ( not ( = ?auto_526873 ?auto_526889 ) ) ( not ( = ?auto_526874 ?auto_526875 ) ) ( not ( = ?auto_526874 ?auto_526876 ) ) ( not ( = ?auto_526874 ?auto_526877 ) ) ( not ( = ?auto_526874 ?auto_526878 ) ) ( not ( = ?auto_526874 ?auto_526879 ) ) ( not ( = ?auto_526874 ?auto_526880 ) ) ( not ( = ?auto_526874 ?auto_526881 ) ) ( not ( = ?auto_526874 ?auto_526882 ) ) ( not ( = ?auto_526874 ?auto_526883 ) ) ( not ( = ?auto_526874 ?auto_526884 ) ) ( not ( = ?auto_526874 ?auto_526885 ) ) ( not ( = ?auto_526874 ?auto_526886 ) ) ( not ( = ?auto_526874 ?auto_526887 ) ) ( not ( = ?auto_526874 ?auto_526888 ) ) ( not ( = ?auto_526874 ?auto_526889 ) ) ( not ( = ?auto_526875 ?auto_526876 ) ) ( not ( = ?auto_526875 ?auto_526877 ) ) ( not ( = ?auto_526875 ?auto_526878 ) ) ( not ( = ?auto_526875 ?auto_526879 ) ) ( not ( = ?auto_526875 ?auto_526880 ) ) ( not ( = ?auto_526875 ?auto_526881 ) ) ( not ( = ?auto_526875 ?auto_526882 ) ) ( not ( = ?auto_526875 ?auto_526883 ) ) ( not ( = ?auto_526875 ?auto_526884 ) ) ( not ( = ?auto_526875 ?auto_526885 ) ) ( not ( = ?auto_526875 ?auto_526886 ) ) ( not ( = ?auto_526875 ?auto_526887 ) ) ( not ( = ?auto_526875 ?auto_526888 ) ) ( not ( = ?auto_526875 ?auto_526889 ) ) ( not ( = ?auto_526876 ?auto_526877 ) ) ( not ( = ?auto_526876 ?auto_526878 ) ) ( not ( = ?auto_526876 ?auto_526879 ) ) ( not ( = ?auto_526876 ?auto_526880 ) ) ( not ( = ?auto_526876 ?auto_526881 ) ) ( not ( = ?auto_526876 ?auto_526882 ) ) ( not ( = ?auto_526876 ?auto_526883 ) ) ( not ( = ?auto_526876 ?auto_526884 ) ) ( not ( = ?auto_526876 ?auto_526885 ) ) ( not ( = ?auto_526876 ?auto_526886 ) ) ( not ( = ?auto_526876 ?auto_526887 ) ) ( not ( = ?auto_526876 ?auto_526888 ) ) ( not ( = ?auto_526876 ?auto_526889 ) ) ( not ( = ?auto_526877 ?auto_526878 ) ) ( not ( = ?auto_526877 ?auto_526879 ) ) ( not ( = ?auto_526877 ?auto_526880 ) ) ( not ( = ?auto_526877 ?auto_526881 ) ) ( not ( = ?auto_526877 ?auto_526882 ) ) ( not ( = ?auto_526877 ?auto_526883 ) ) ( not ( = ?auto_526877 ?auto_526884 ) ) ( not ( = ?auto_526877 ?auto_526885 ) ) ( not ( = ?auto_526877 ?auto_526886 ) ) ( not ( = ?auto_526877 ?auto_526887 ) ) ( not ( = ?auto_526877 ?auto_526888 ) ) ( not ( = ?auto_526877 ?auto_526889 ) ) ( not ( = ?auto_526878 ?auto_526879 ) ) ( not ( = ?auto_526878 ?auto_526880 ) ) ( not ( = ?auto_526878 ?auto_526881 ) ) ( not ( = ?auto_526878 ?auto_526882 ) ) ( not ( = ?auto_526878 ?auto_526883 ) ) ( not ( = ?auto_526878 ?auto_526884 ) ) ( not ( = ?auto_526878 ?auto_526885 ) ) ( not ( = ?auto_526878 ?auto_526886 ) ) ( not ( = ?auto_526878 ?auto_526887 ) ) ( not ( = ?auto_526878 ?auto_526888 ) ) ( not ( = ?auto_526878 ?auto_526889 ) ) ( not ( = ?auto_526879 ?auto_526880 ) ) ( not ( = ?auto_526879 ?auto_526881 ) ) ( not ( = ?auto_526879 ?auto_526882 ) ) ( not ( = ?auto_526879 ?auto_526883 ) ) ( not ( = ?auto_526879 ?auto_526884 ) ) ( not ( = ?auto_526879 ?auto_526885 ) ) ( not ( = ?auto_526879 ?auto_526886 ) ) ( not ( = ?auto_526879 ?auto_526887 ) ) ( not ( = ?auto_526879 ?auto_526888 ) ) ( not ( = ?auto_526879 ?auto_526889 ) ) ( not ( = ?auto_526880 ?auto_526881 ) ) ( not ( = ?auto_526880 ?auto_526882 ) ) ( not ( = ?auto_526880 ?auto_526883 ) ) ( not ( = ?auto_526880 ?auto_526884 ) ) ( not ( = ?auto_526880 ?auto_526885 ) ) ( not ( = ?auto_526880 ?auto_526886 ) ) ( not ( = ?auto_526880 ?auto_526887 ) ) ( not ( = ?auto_526880 ?auto_526888 ) ) ( not ( = ?auto_526880 ?auto_526889 ) ) ( not ( = ?auto_526881 ?auto_526882 ) ) ( not ( = ?auto_526881 ?auto_526883 ) ) ( not ( = ?auto_526881 ?auto_526884 ) ) ( not ( = ?auto_526881 ?auto_526885 ) ) ( not ( = ?auto_526881 ?auto_526886 ) ) ( not ( = ?auto_526881 ?auto_526887 ) ) ( not ( = ?auto_526881 ?auto_526888 ) ) ( not ( = ?auto_526881 ?auto_526889 ) ) ( not ( = ?auto_526882 ?auto_526883 ) ) ( not ( = ?auto_526882 ?auto_526884 ) ) ( not ( = ?auto_526882 ?auto_526885 ) ) ( not ( = ?auto_526882 ?auto_526886 ) ) ( not ( = ?auto_526882 ?auto_526887 ) ) ( not ( = ?auto_526882 ?auto_526888 ) ) ( not ( = ?auto_526882 ?auto_526889 ) ) ( not ( = ?auto_526883 ?auto_526884 ) ) ( not ( = ?auto_526883 ?auto_526885 ) ) ( not ( = ?auto_526883 ?auto_526886 ) ) ( not ( = ?auto_526883 ?auto_526887 ) ) ( not ( = ?auto_526883 ?auto_526888 ) ) ( not ( = ?auto_526883 ?auto_526889 ) ) ( not ( = ?auto_526884 ?auto_526885 ) ) ( not ( = ?auto_526884 ?auto_526886 ) ) ( not ( = ?auto_526884 ?auto_526887 ) ) ( not ( = ?auto_526884 ?auto_526888 ) ) ( not ( = ?auto_526884 ?auto_526889 ) ) ( not ( = ?auto_526885 ?auto_526886 ) ) ( not ( = ?auto_526885 ?auto_526887 ) ) ( not ( = ?auto_526885 ?auto_526888 ) ) ( not ( = ?auto_526885 ?auto_526889 ) ) ( not ( = ?auto_526886 ?auto_526887 ) ) ( not ( = ?auto_526886 ?auto_526888 ) ) ( not ( = ?auto_526886 ?auto_526889 ) ) ( not ( = ?auto_526887 ?auto_526888 ) ) ( not ( = ?auto_526887 ?auto_526889 ) ) ( not ( = ?auto_526888 ?auto_526889 ) ) ( ON ?auto_526887 ?auto_526888 ) ( ON ?auto_526886 ?auto_526887 ) ( ON ?auto_526885 ?auto_526886 ) ( CLEAR ?auto_526883 ) ( ON ?auto_526884 ?auto_526885 ) ( CLEAR ?auto_526884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_526873 ?auto_526874 ?auto_526875 ?auto_526876 ?auto_526877 ?auto_526878 ?auto_526879 ?auto_526880 ?auto_526881 ?auto_526882 ?auto_526883 ?auto_526884 )
      ( MAKE-16PILE ?auto_526873 ?auto_526874 ?auto_526875 ?auto_526876 ?auto_526877 ?auto_526878 ?auto_526879 ?auto_526880 ?auto_526881 ?auto_526882 ?auto_526883 ?auto_526884 ?auto_526885 ?auto_526886 ?auto_526887 ?auto_526888 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_526906 - BLOCK
      ?auto_526907 - BLOCK
      ?auto_526908 - BLOCK
      ?auto_526909 - BLOCK
      ?auto_526910 - BLOCK
      ?auto_526911 - BLOCK
      ?auto_526912 - BLOCK
      ?auto_526913 - BLOCK
      ?auto_526914 - BLOCK
      ?auto_526915 - BLOCK
      ?auto_526916 - BLOCK
      ?auto_526917 - BLOCK
      ?auto_526918 - BLOCK
      ?auto_526919 - BLOCK
      ?auto_526920 - BLOCK
      ?auto_526921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_526921 ) ( ON-TABLE ?auto_526906 ) ( ON ?auto_526907 ?auto_526906 ) ( ON ?auto_526908 ?auto_526907 ) ( ON ?auto_526909 ?auto_526908 ) ( ON ?auto_526910 ?auto_526909 ) ( ON ?auto_526911 ?auto_526910 ) ( ON ?auto_526912 ?auto_526911 ) ( ON ?auto_526913 ?auto_526912 ) ( ON ?auto_526914 ?auto_526913 ) ( ON ?auto_526915 ?auto_526914 ) ( ON ?auto_526916 ?auto_526915 ) ( not ( = ?auto_526906 ?auto_526907 ) ) ( not ( = ?auto_526906 ?auto_526908 ) ) ( not ( = ?auto_526906 ?auto_526909 ) ) ( not ( = ?auto_526906 ?auto_526910 ) ) ( not ( = ?auto_526906 ?auto_526911 ) ) ( not ( = ?auto_526906 ?auto_526912 ) ) ( not ( = ?auto_526906 ?auto_526913 ) ) ( not ( = ?auto_526906 ?auto_526914 ) ) ( not ( = ?auto_526906 ?auto_526915 ) ) ( not ( = ?auto_526906 ?auto_526916 ) ) ( not ( = ?auto_526906 ?auto_526917 ) ) ( not ( = ?auto_526906 ?auto_526918 ) ) ( not ( = ?auto_526906 ?auto_526919 ) ) ( not ( = ?auto_526906 ?auto_526920 ) ) ( not ( = ?auto_526906 ?auto_526921 ) ) ( not ( = ?auto_526907 ?auto_526908 ) ) ( not ( = ?auto_526907 ?auto_526909 ) ) ( not ( = ?auto_526907 ?auto_526910 ) ) ( not ( = ?auto_526907 ?auto_526911 ) ) ( not ( = ?auto_526907 ?auto_526912 ) ) ( not ( = ?auto_526907 ?auto_526913 ) ) ( not ( = ?auto_526907 ?auto_526914 ) ) ( not ( = ?auto_526907 ?auto_526915 ) ) ( not ( = ?auto_526907 ?auto_526916 ) ) ( not ( = ?auto_526907 ?auto_526917 ) ) ( not ( = ?auto_526907 ?auto_526918 ) ) ( not ( = ?auto_526907 ?auto_526919 ) ) ( not ( = ?auto_526907 ?auto_526920 ) ) ( not ( = ?auto_526907 ?auto_526921 ) ) ( not ( = ?auto_526908 ?auto_526909 ) ) ( not ( = ?auto_526908 ?auto_526910 ) ) ( not ( = ?auto_526908 ?auto_526911 ) ) ( not ( = ?auto_526908 ?auto_526912 ) ) ( not ( = ?auto_526908 ?auto_526913 ) ) ( not ( = ?auto_526908 ?auto_526914 ) ) ( not ( = ?auto_526908 ?auto_526915 ) ) ( not ( = ?auto_526908 ?auto_526916 ) ) ( not ( = ?auto_526908 ?auto_526917 ) ) ( not ( = ?auto_526908 ?auto_526918 ) ) ( not ( = ?auto_526908 ?auto_526919 ) ) ( not ( = ?auto_526908 ?auto_526920 ) ) ( not ( = ?auto_526908 ?auto_526921 ) ) ( not ( = ?auto_526909 ?auto_526910 ) ) ( not ( = ?auto_526909 ?auto_526911 ) ) ( not ( = ?auto_526909 ?auto_526912 ) ) ( not ( = ?auto_526909 ?auto_526913 ) ) ( not ( = ?auto_526909 ?auto_526914 ) ) ( not ( = ?auto_526909 ?auto_526915 ) ) ( not ( = ?auto_526909 ?auto_526916 ) ) ( not ( = ?auto_526909 ?auto_526917 ) ) ( not ( = ?auto_526909 ?auto_526918 ) ) ( not ( = ?auto_526909 ?auto_526919 ) ) ( not ( = ?auto_526909 ?auto_526920 ) ) ( not ( = ?auto_526909 ?auto_526921 ) ) ( not ( = ?auto_526910 ?auto_526911 ) ) ( not ( = ?auto_526910 ?auto_526912 ) ) ( not ( = ?auto_526910 ?auto_526913 ) ) ( not ( = ?auto_526910 ?auto_526914 ) ) ( not ( = ?auto_526910 ?auto_526915 ) ) ( not ( = ?auto_526910 ?auto_526916 ) ) ( not ( = ?auto_526910 ?auto_526917 ) ) ( not ( = ?auto_526910 ?auto_526918 ) ) ( not ( = ?auto_526910 ?auto_526919 ) ) ( not ( = ?auto_526910 ?auto_526920 ) ) ( not ( = ?auto_526910 ?auto_526921 ) ) ( not ( = ?auto_526911 ?auto_526912 ) ) ( not ( = ?auto_526911 ?auto_526913 ) ) ( not ( = ?auto_526911 ?auto_526914 ) ) ( not ( = ?auto_526911 ?auto_526915 ) ) ( not ( = ?auto_526911 ?auto_526916 ) ) ( not ( = ?auto_526911 ?auto_526917 ) ) ( not ( = ?auto_526911 ?auto_526918 ) ) ( not ( = ?auto_526911 ?auto_526919 ) ) ( not ( = ?auto_526911 ?auto_526920 ) ) ( not ( = ?auto_526911 ?auto_526921 ) ) ( not ( = ?auto_526912 ?auto_526913 ) ) ( not ( = ?auto_526912 ?auto_526914 ) ) ( not ( = ?auto_526912 ?auto_526915 ) ) ( not ( = ?auto_526912 ?auto_526916 ) ) ( not ( = ?auto_526912 ?auto_526917 ) ) ( not ( = ?auto_526912 ?auto_526918 ) ) ( not ( = ?auto_526912 ?auto_526919 ) ) ( not ( = ?auto_526912 ?auto_526920 ) ) ( not ( = ?auto_526912 ?auto_526921 ) ) ( not ( = ?auto_526913 ?auto_526914 ) ) ( not ( = ?auto_526913 ?auto_526915 ) ) ( not ( = ?auto_526913 ?auto_526916 ) ) ( not ( = ?auto_526913 ?auto_526917 ) ) ( not ( = ?auto_526913 ?auto_526918 ) ) ( not ( = ?auto_526913 ?auto_526919 ) ) ( not ( = ?auto_526913 ?auto_526920 ) ) ( not ( = ?auto_526913 ?auto_526921 ) ) ( not ( = ?auto_526914 ?auto_526915 ) ) ( not ( = ?auto_526914 ?auto_526916 ) ) ( not ( = ?auto_526914 ?auto_526917 ) ) ( not ( = ?auto_526914 ?auto_526918 ) ) ( not ( = ?auto_526914 ?auto_526919 ) ) ( not ( = ?auto_526914 ?auto_526920 ) ) ( not ( = ?auto_526914 ?auto_526921 ) ) ( not ( = ?auto_526915 ?auto_526916 ) ) ( not ( = ?auto_526915 ?auto_526917 ) ) ( not ( = ?auto_526915 ?auto_526918 ) ) ( not ( = ?auto_526915 ?auto_526919 ) ) ( not ( = ?auto_526915 ?auto_526920 ) ) ( not ( = ?auto_526915 ?auto_526921 ) ) ( not ( = ?auto_526916 ?auto_526917 ) ) ( not ( = ?auto_526916 ?auto_526918 ) ) ( not ( = ?auto_526916 ?auto_526919 ) ) ( not ( = ?auto_526916 ?auto_526920 ) ) ( not ( = ?auto_526916 ?auto_526921 ) ) ( not ( = ?auto_526917 ?auto_526918 ) ) ( not ( = ?auto_526917 ?auto_526919 ) ) ( not ( = ?auto_526917 ?auto_526920 ) ) ( not ( = ?auto_526917 ?auto_526921 ) ) ( not ( = ?auto_526918 ?auto_526919 ) ) ( not ( = ?auto_526918 ?auto_526920 ) ) ( not ( = ?auto_526918 ?auto_526921 ) ) ( not ( = ?auto_526919 ?auto_526920 ) ) ( not ( = ?auto_526919 ?auto_526921 ) ) ( not ( = ?auto_526920 ?auto_526921 ) ) ( ON ?auto_526920 ?auto_526921 ) ( ON ?auto_526919 ?auto_526920 ) ( ON ?auto_526918 ?auto_526919 ) ( CLEAR ?auto_526916 ) ( ON ?auto_526917 ?auto_526918 ) ( CLEAR ?auto_526917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_526906 ?auto_526907 ?auto_526908 ?auto_526909 ?auto_526910 ?auto_526911 ?auto_526912 ?auto_526913 ?auto_526914 ?auto_526915 ?auto_526916 ?auto_526917 )
      ( MAKE-16PILE ?auto_526906 ?auto_526907 ?auto_526908 ?auto_526909 ?auto_526910 ?auto_526911 ?auto_526912 ?auto_526913 ?auto_526914 ?auto_526915 ?auto_526916 ?auto_526917 ?auto_526918 ?auto_526919 ?auto_526920 ?auto_526921 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_526938 - BLOCK
      ?auto_526939 - BLOCK
      ?auto_526940 - BLOCK
      ?auto_526941 - BLOCK
      ?auto_526942 - BLOCK
      ?auto_526943 - BLOCK
      ?auto_526944 - BLOCK
      ?auto_526945 - BLOCK
      ?auto_526946 - BLOCK
      ?auto_526947 - BLOCK
      ?auto_526948 - BLOCK
      ?auto_526949 - BLOCK
      ?auto_526950 - BLOCK
      ?auto_526951 - BLOCK
      ?auto_526952 - BLOCK
      ?auto_526953 - BLOCK
    )
    :vars
    (
      ?auto_526954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_526953 ?auto_526954 ) ( ON-TABLE ?auto_526938 ) ( ON ?auto_526939 ?auto_526938 ) ( ON ?auto_526940 ?auto_526939 ) ( ON ?auto_526941 ?auto_526940 ) ( ON ?auto_526942 ?auto_526941 ) ( ON ?auto_526943 ?auto_526942 ) ( ON ?auto_526944 ?auto_526943 ) ( ON ?auto_526945 ?auto_526944 ) ( ON ?auto_526946 ?auto_526945 ) ( ON ?auto_526947 ?auto_526946 ) ( not ( = ?auto_526938 ?auto_526939 ) ) ( not ( = ?auto_526938 ?auto_526940 ) ) ( not ( = ?auto_526938 ?auto_526941 ) ) ( not ( = ?auto_526938 ?auto_526942 ) ) ( not ( = ?auto_526938 ?auto_526943 ) ) ( not ( = ?auto_526938 ?auto_526944 ) ) ( not ( = ?auto_526938 ?auto_526945 ) ) ( not ( = ?auto_526938 ?auto_526946 ) ) ( not ( = ?auto_526938 ?auto_526947 ) ) ( not ( = ?auto_526938 ?auto_526948 ) ) ( not ( = ?auto_526938 ?auto_526949 ) ) ( not ( = ?auto_526938 ?auto_526950 ) ) ( not ( = ?auto_526938 ?auto_526951 ) ) ( not ( = ?auto_526938 ?auto_526952 ) ) ( not ( = ?auto_526938 ?auto_526953 ) ) ( not ( = ?auto_526938 ?auto_526954 ) ) ( not ( = ?auto_526939 ?auto_526940 ) ) ( not ( = ?auto_526939 ?auto_526941 ) ) ( not ( = ?auto_526939 ?auto_526942 ) ) ( not ( = ?auto_526939 ?auto_526943 ) ) ( not ( = ?auto_526939 ?auto_526944 ) ) ( not ( = ?auto_526939 ?auto_526945 ) ) ( not ( = ?auto_526939 ?auto_526946 ) ) ( not ( = ?auto_526939 ?auto_526947 ) ) ( not ( = ?auto_526939 ?auto_526948 ) ) ( not ( = ?auto_526939 ?auto_526949 ) ) ( not ( = ?auto_526939 ?auto_526950 ) ) ( not ( = ?auto_526939 ?auto_526951 ) ) ( not ( = ?auto_526939 ?auto_526952 ) ) ( not ( = ?auto_526939 ?auto_526953 ) ) ( not ( = ?auto_526939 ?auto_526954 ) ) ( not ( = ?auto_526940 ?auto_526941 ) ) ( not ( = ?auto_526940 ?auto_526942 ) ) ( not ( = ?auto_526940 ?auto_526943 ) ) ( not ( = ?auto_526940 ?auto_526944 ) ) ( not ( = ?auto_526940 ?auto_526945 ) ) ( not ( = ?auto_526940 ?auto_526946 ) ) ( not ( = ?auto_526940 ?auto_526947 ) ) ( not ( = ?auto_526940 ?auto_526948 ) ) ( not ( = ?auto_526940 ?auto_526949 ) ) ( not ( = ?auto_526940 ?auto_526950 ) ) ( not ( = ?auto_526940 ?auto_526951 ) ) ( not ( = ?auto_526940 ?auto_526952 ) ) ( not ( = ?auto_526940 ?auto_526953 ) ) ( not ( = ?auto_526940 ?auto_526954 ) ) ( not ( = ?auto_526941 ?auto_526942 ) ) ( not ( = ?auto_526941 ?auto_526943 ) ) ( not ( = ?auto_526941 ?auto_526944 ) ) ( not ( = ?auto_526941 ?auto_526945 ) ) ( not ( = ?auto_526941 ?auto_526946 ) ) ( not ( = ?auto_526941 ?auto_526947 ) ) ( not ( = ?auto_526941 ?auto_526948 ) ) ( not ( = ?auto_526941 ?auto_526949 ) ) ( not ( = ?auto_526941 ?auto_526950 ) ) ( not ( = ?auto_526941 ?auto_526951 ) ) ( not ( = ?auto_526941 ?auto_526952 ) ) ( not ( = ?auto_526941 ?auto_526953 ) ) ( not ( = ?auto_526941 ?auto_526954 ) ) ( not ( = ?auto_526942 ?auto_526943 ) ) ( not ( = ?auto_526942 ?auto_526944 ) ) ( not ( = ?auto_526942 ?auto_526945 ) ) ( not ( = ?auto_526942 ?auto_526946 ) ) ( not ( = ?auto_526942 ?auto_526947 ) ) ( not ( = ?auto_526942 ?auto_526948 ) ) ( not ( = ?auto_526942 ?auto_526949 ) ) ( not ( = ?auto_526942 ?auto_526950 ) ) ( not ( = ?auto_526942 ?auto_526951 ) ) ( not ( = ?auto_526942 ?auto_526952 ) ) ( not ( = ?auto_526942 ?auto_526953 ) ) ( not ( = ?auto_526942 ?auto_526954 ) ) ( not ( = ?auto_526943 ?auto_526944 ) ) ( not ( = ?auto_526943 ?auto_526945 ) ) ( not ( = ?auto_526943 ?auto_526946 ) ) ( not ( = ?auto_526943 ?auto_526947 ) ) ( not ( = ?auto_526943 ?auto_526948 ) ) ( not ( = ?auto_526943 ?auto_526949 ) ) ( not ( = ?auto_526943 ?auto_526950 ) ) ( not ( = ?auto_526943 ?auto_526951 ) ) ( not ( = ?auto_526943 ?auto_526952 ) ) ( not ( = ?auto_526943 ?auto_526953 ) ) ( not ( = ?auto_526943 ?auto_526954 ) ) ( not ( = ?auto_526944 ?auto_526945 ) ) ( not ( = ?auto_526944 ?auto_526946 ) ) ( not ( = ?auto_526944 ?auto_526947 ) ) ( not ( = ?auto_526944 ?auto_526948 ) ) ( not ( = ?auto_526944 ?auto_526949 ) ) ( not ( = ?auto_526944 ?auto_526950 ) ) ( not ( = ?auto_526944 ?auto_526951 ) ) ( not ( = ?auto_526944 ?auto_526952 ) ) ( not ( = ?auto_526944 ?auto_526953 ) ) ( not ( = ?auto_526944 ?auto_526954 ) ) ( not ( = ?auto_526945 ?auto_526946 ) ) ( not ( = ?auto_526945 ?auto_526947 ) ) ( not ( = ?auto_526945 ?auto_526948 ) ) ( not ( = ?auto_526945 ?auto_526949 ) ) ( not ( = ?auto_526945 ?auto_526950 ) ) ( not ( = ?auto_526945 ?auto_526951 ) ) ( not ( = ?auto_526945 ?auto_526952 ) ) ( not ( = ?auto_526945 ?auto_526953 ) ) ( not ( = ?auto_526945 ?auto_526954 ) ) ( not ( = ?auto_526946 ?auto_526947 ) ) ( not ( = ?auto_526946 ?auto_526948 ) ) ( not ( = ?auto_526946 ?auto_526949 ) ) ( not ( = ?auto_526946 ?auto_526950 ) ) ( not ( = ?auto_526946 ?auto_526951 ) ) ( not ( = ?auto_526946 ?auto_526952 ) ) ( not ( = ?auto_526946 ?auto_526953 ) ) ( not ( = ?auto_526946 ?auto_526954 ) ) ( not ( = ?auto_526947 ?auto_526948 ) ) ( not ( = ?auto_526947 ?auto_526949 ) ) ( not ( = ?auto_526947 ?auto_526950 ) ) ( not ( = ?auto_526947 ?auto_526951 ) ) ( not ( = ?auto_526947 ?auto_526952 ) ) ( not ( = ?auto_526947 ?auto_526953 ) ) ( not ( = ?auto_526947 ?auto_526954 ) ) ( not ( = ?auto_526948 ?auto_526949 ) ) ( not ( = ?auto_526948 ?auto_526950 ) ) ( not ( = ?auto_526948 ?auto_526951 ) ) ( not ( = ?auto_526948 ?auto_526952 ) ) ( not ( = ?auto_526948 ?auto_526953 ) ) ( not ( = ?auto_526948 ?auto_526954 ) ) ( not ( = ?auto_526949 ?auto_526950 ) ) ( not ( = ?auto_526949 ?auto_526951 ) ) ( not ( = ?auto_526949 ?auto_526952 ) ) ( not ( = ?auto_526949 ?auto_526953 ) ) ( not ( = ?auto_526949 ?auto_526954 ) ) ( not ( = ?auto_526950 ?auto_526951 ) ) ( not ( = ?auto_526950 ?auto_526952 ) ) ( not ( = ?auto_526950 ?auto_526953 ) ) ( not ( = ?auto_526950 ?auto_526954 ) ) ( not ( = ?auto_526951 ?auto_526952 ) ) ( not ( = ?auto_526951 ?auto_526953 ) ) ( not ( = ?auto_526951 ?auto_526954 ) ) ( not ( = ?auto_526952 ?auto_526953 ) ) ( not ( = ?auto_526952 ?auto_526954 ) ) ( not ( = ?auto_526953 ?auto_526954 ) ) ( ON ?auto_526952 ?auto_526953 ) ( ON ?auto_526951 ?auto_526952 ) ( ON ?auto_526950 ?auto_526951 ) ( ON ?auto_526949 ?auto_526950 ) ( CLEAR ?auto_526947 ) ( ON ?auto_526948 ?auto_526949 ) ( CLEAR ?auto_526948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_526938 ?auto_526939 ?auto_526940 ?auto_526941 ?auto_526942 ?auto_526943 ?auto_526944 ?auto_526945 ?auto_526946 ?auto_526947 ?auto_526948 )
      ( MAKE-16PILE ?auto_526938 ?auto_526939 ?auto_526940 ?auto_526941 ?auto_526942 ?auto_526943 ?auto_526944 ?auto_526945 ?auto_526946 ?auto_526947 ?auto_526948 ?auto_526949 ?auto_526950 ?auto_526951 ?auto_526952 ?auto_526953 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_526971 - BLOCK
      ?auto_526972 - BLOCK
      ?auto_526973 - BLOCK
      ?auto_526974 - BLOCK
      ?auto_526975 - BLOCK
      ?auto_526976 - BLOCK
      ?auto_526977 - BLOCK
      ?auto_526978 - BLOCK
      ?auto_526979 - BLOCK
      ?auto_526980 - BLOCK
      ?auto_526981 - BLOCK
      ?auto_526982 - BLOCK
      ?auto_526983 - BLOCK
      ?auto_526984 - BLOCK
      ?auto_526985 - BLOCK
      ?auto_526986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_526986 ) ( ON-TABLE ?auto_526971 ) ( ON ?auto_526972 ?auto_526971 ) ( ON ?auto_526973 ?auto_526972 ) ( ON ?auto_526974 ?auto_526973 ) ( ON ?auto_526975 ?auto_526974 ) ( ON ?auto_526976 ?auto_526975 ) ( ON ?auto_526977 ?auto_526976 ) ( ON ?auto_526978 ?auto_526977 ) ( ON ?auto_526979 ?auto_526978 ) ( ON ?auto_526980 ?auto_526979 ) ( not ( = ?auto_526971 ?auto_526972 ) ) ( not ( = ?auto_526971 ?auto_526973 ) ) ( not ( = ?auto_526971 ?auto_526974 ) ) ( not ( = ?auto_526971 ?auto_526975 ) ) ( not ( = ?auto_526971 ?auto_526976 ) ) ( not ( = ?auto_526971 ?auto_526977 ) ) ( not ( = ?auto_526971 ?auto_526978 ) ) ( not ( = ?auto_526971 ?auto_526979 ) ) ( not ( = ?auto_526971 ?auto_526980 ) ) ( not ( = ?auto_526971 ?auto_526981 ) ) ( not ( = ?auto_526971 ?auto_526982 ) ) ( not ( = ?auto_526971 ?auto_526983 ) ) ( not ( = ?auto_526971 ?auto_526984 ) ) ( not ( = ?auto_526971 ?auto_526985 ) ) ( not ( = ?auto_526971 ?auto_526986 ) ) ( not ( = ?auto_526972 ?auto_526973 ) ) ( not ( = ?auto_526972 ?auto_526974 ) ) ( not ( = ?auto_526972 ?auto_526975 ) ) ( not ( = ?auto_526972 ?auto_526976 ) ) ( not ( = ?auto_526972 ?auto_526977 ) ) ( not ( = ?auto_526972 ?auto_526978 ) ) ( not ( = ?auto_526972 ?auto_526979 ) ) ( not ( = ?auto_526972 ?auto_526980 ) ) ( not ( = ?auto_526972 ?auto_526981 ) ) ( not ( = ?auto_526972 ?auto_526982 ) ) ( not ( = ?auto_526972 ?auto_526983 ) ) ( not ( = ?auto_526972 ?auto_526984 ) ) ( not ( = ?auto_526972 ?auto_526985 ) ) ( not ( = ?auto_526972 ?auto_526986 ) ) ( not ( = ?auto_526973 ?auto_526974 ) ) ( not ( = ?auto_526973 ?auto_526975 ) ) ( not ( = ?auto_526973 ?auto_526976 ) ) ( not ( = ?auto_526973 ?auto_526977 ) ) ( not ( = ?auto_526973 ?auto_526978 ) ) ( not ( = ?auto_526973 ?auto_526979 ) ) ( not ( = ?auto_526973 ?auto_526980 ) ) ( not ( = ?auto_526973 ?auto_526981 ) ) ( not ( = ?auto_526973 ?auto_526982 ) ) ( not ( = ?auto_526973 ?auto_526983 ) ) ( not ( = ?auto_526973 ?auto_526984 ) ) ( not ( = ?auto_526973 ?auto_526985 ) ) ( not ( = ?auto_526973 ?auto_526986 ) ) ( not ( = ?auto_526974 ?auto_526975 ) ) ( not ( = ?auto_526974 ?auto_526976 ) ) ( not ( = ?auto_526974 ?auto_526977 ) ) ( not ( = ?auto_526974 ?auto_526978 ) ) ( not ( = ?auto_526974 ?auto_526979 ) ) ( not ( = ?auto_526974 ?auto_526980 ) ) ( not ( = ?auto_526974 ?auto_526981 ) ) ( not ( = ?auto_526974 ?auto_526982 ) ) ( not ( = ?auto_526974 ?auto_526983 ) ) ( not ( = ?auto_526974 ?auto_526984 ) ) ( not ( = ?auto_526974 ?auto_526985 ) ) ( not ( = ?auto_526974 ?auto_526986 ) ) ( not ( = ?auto_526975 ?auto_526976 ) ) ( not ( = ?auto_526975 ?auto_526977 ) ) ( not ( = ?auto_526975 ?auto_526978 ) ) ( not ( = ?auto_526975 ?auto_526979 ) ) ( not ( = ?auto_526975 ?auto_526980 ) ) ( not ( = ?auto_526975 ?auto_526981 ) ) ( not ( = ?auto_526975 ?auto_526982 ) ) ( not ( = ?auto_526975 ?auto_526983 ) ) ( not ( = ?auto_526975 ?auto_526984 ) ) ( not ( = ?auto_526975 ?auto_526985 ) ) ( not ( = ?auto_526975 ?auto_526986 ) ) ( not ( = ?auto_526976 ?auto_526977 ) ) ( not ( = ?auto_526976 ?auto_526978 ) ) ( not ( = ?auto_526976 ?auto_526979 ) ) ( not ( = ?auto_526976 ?auto_526980 ) ) ( not ( = ?auto_526976 ?auto_526981 ) ) ( not ( = ?auto_526976 ?auto_526982 ) ) ( not ( = ?auto_526976 ?auto_526983 ) ) ( not ( = ?auto_526976 ?auto_526984 ) ) ( not ( = ?auto_526976 ?auto_526985 ) ) ( not ( = ?auto_526976 ?auto_526986 ) ) ( not ( = ?auto_526977 ?auto_526978 ) ) ( not ( = ?auto_526977 ?auto_526979 ) ) ( not ( = ?auto_526977 ?auto_526980 ) ) ( not ( = ?auto_526977 ?auto_526981 ) ) ( not ( = ?auto_526977 ?auto_526982 ) ) ( not ( = ?auto_526977 ?auto_526983 ) ) ( not ( = ?auto_526977 ?auto_526984 ) ) ( not ( = ?auto_526977 ?auto_526985 ) ) ( not ( = ?auto_526977 ?auto_526986 ) ) ( not ( = ?auto_526978 ?auto_526979 ) ) ( not ( = ?auto_526978 ?auto_526980 ) ) ( not ( = ?auto_526978 ?auto_526981 ) ) ( not ( = ?auto_526978 ?auto_526982 ) ) ( not ( = ?auto_526978 ?auto_526983 ) ) ( not ( = ?auto_526978 ?auto_526984 ) ) ( not ( = ?auto_526978 ?auto_526985 ) ) ( not ( = ?auto_526978 ?auto_526986 ) ) ( not ( = ?auto_526979 ?auto_526980 ) ) ( not ( = ?auto_526979 ?auto_526981 ) ) ( not ( = ?auto_526979 ?auto_526982 ) ) ( not ( = ?auto_526979 ?auto_526983 ) ) ( not ( = ?auto_526979 ?auto_526984 ) ) ( not ( = ?auto_526979 ?auto_526985 ) ) ( not ( = ?auto_526979 ?auto_526986 ) ) ( not ( = ?auto_526980 ?auto_526981 ) ) ( not ( = ?auto_526980 ?auto_526982 ) ) ( not ( = ?auto_526980 ?auto_526983 ) ) ( not ( = ?auto_526980 ?auto_526984 ) ) ( not ( = ?auto_526980 ?auto_526985 ) ) ( not ( = ?auto_526980 ?auto_526986 ) ) ( not ( = ?auto_526981 ?auto_526982 ) ) ( not ( = ?auto_526981 ?auto_526983 ) ) ( not ( = ?auto_526981 ?auto_526984 ) ) ( not ( = ?auto_526981 ?auto_526985 ) ) ( not ( = ?auto_526981 ?auto_526986 ) ) ( not ( = ?auto_526982 ?auto_526983 ) ) ( not ( = ?auto_526982 ?auto_526984 ) ) ( not ( = ?auto_526982 ?auto_526985 ) ) ( not ( = ?auto_526982 ?auto_526986 ) ) ( not ( = ?auto_526983 ?auto_526984 ) ) ( not ( = ?auto_526983 ?auto_526985 ) ) ( not ( = ?auto_526983 ?auto_526986 ) ) ( not ( = ?auto_526984 ?auto_526985 ) ) ( not ( = ?auto_526984 ?auto_526986 ) ) ( not ( = ?auto_526985 ?auto_526986 ) ) ( ON ?auto_526985 ?auto_526986 ) ( ON ?auto_526984 ?auto_526985 ) ( ON ?auto_526983 ?auto_526984 ) ( ON ?auto_526982 ?auto_526983 ) ( CLEAR ?auto_526980 ) ( ON ?auto_526981 ?auto_526982 ) ( CLEAR ?auto_526981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_526971 ?auto_526972 ?auto_526973 ?auto_526974 ?auto_526975 ?auto_526976 ?auto_526977 ?auto_526978 ?auto_526979 ?auto_526980 ?auto_526981 )
      ( MAKE-16PILE ?auto_526971 ?auto_526972 ?auto_526973 ?auto_526974 ?auto_526975 ?auto_526976 ?auto_526977 ?auto_526978 ?auto_526979 ?auto_526980 ?auto_526981 ?auto_526982 ?auto_526983 ?auto_526984 ?auto_526985 ?auto_526986 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527003 - BLOCK
      ?auto_527004 - BLOCK
      ?auto_527005 - BLOCK
      ?auto_527006 - BLOCK
      ?auto_527007 - BLOCK
      ?auto_527008 - BLOCK
      ?auto_527009 - BLOCK
      ?auto_527010 - BLOCK
      ?auto_527011 - BLOCK
      ?auto_527012 - BLOCK
      ?auto_527013 - BLOCK
      ?auto_527014 - BLOCK
      ?auto_527015 - BLOCK
      ?auto_527016 - BLOCK
      ?auto_527017 - BLOCK
      ?auto_527018 - BLOCK
    )
    :vars
    (
      ?auto_527019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527018 ?auto_527019 ) ( ON-TABLE ?auto_527003 ) ( ON ?auto_527004 ?auto_527003 ) ( ON ?auto_527005 ?auto_527004 ) ( ON ?auto_527006 ?auto_527005 ) ( ON ?auto_527007 ?auto_527006 ) ( ON ?auto_527008 ?auto_527007 ) ( ON ?auto_527009 ?auto_527008 ) ( ON ?auto_527010 ?auto_527009 ) ( ON ?auto_527011 ?auto_527010 ) ( not ( = ?auto_527003 ?auto_527004 ) ) ( not ( = ?auto_527003 ?auto_527005 ) ) ( not ( = ?auto_527003 ?auto_527006 ) ) ( not ( = ?auto_527003 ?auto_527007 ) ) ( not ( = ?auto_527003 ?auto_527008 ) ) ( not ( = ?auto_527003 ?auto_527009 ) ) ( not ( = ?auto_527003 ?auto_527010 ) ) ( not ( = ?auto_527003 ?auto_527011 ) ) ( not ( = ?auto_527003 ?auto_527012 ) ) ( not ( = ?auto_527003 ?auto_527013 ) ) ( not ( = ?auto_527003 ?auto_527014 ) ) ( not ( = ?auto_527003 ?auto_527015 ) ) ( not ( = ?auto_527003 ?auto_527016 ) ) ( not ( = ?auto_527003 ?auto_527017 ) ) ( not ( = ?auto_527003 ?auto_527018 ) ) ( not ( = ?auto_527003 ?auto_527019 ) ) ( not ( = ?auto_527004 ?auto_527005 ) ) ( not ( = ?auto_527004 ?auto_527006 ) ) ( not ( = ?auto_527004 ?auto_527007 ) ) ( not ( = ?auto_527004 ?auto_527008 ) ) ( not ( = ?auto_527004 ?auto_527009 ) ) ( not ( = ?auto_527004 ?auto_527010 ) ) ( not ( = ?auto_527004 ?auto_527011 ) ) ( not ( = ?auto_527004 ?auto_527012 ) ) ( not ( = ?auto_527004 ?auto_527013 ) ) ( not ( = ?auto_527004 ?auto_527014 ) ) ( not ( = ?auto_527004 ?auto_527015 ) ) ( not ( = ?auto_527004 ?auto_527016 ) ) ( not ( = ?auto_527004 ?auto_527017 ) ) ( not ( = ?auto_527004 ?auto_527018 ) ) ( not ( = ?auto_527004 ?auto_527019 ) ) ( not ( = ?auto_527005 ?auto_527006 ) ) ( not ( = ?auto_527005 ?auto_527007 ) ) ( not ( = ?auto_527005 ?auto_527008 ) ) ( not ( = ?auto_527005 ?auto_527009 ) ) ( not ( = ?auto_527005 ?auto_527010 ) ) ( not ( = ?auto_527005 ?auto_527011 ) ) ( not ( = ?auto_527005 ?auto_527012 ) ) ( not ( = ?auto_527005 ?auto_527013 ) ) ( not ( = ?auto_527005 ?auto_527014 ) ) ( not ( = ?auto_527005 ?auto_527015 ) ) ( not ( = ?auto_527005 ?auto_527016 ) ) ( not ( = ?auto_527005 ?auto_527017 ) ) ( not ( = ?auto_527005 ?auto_527018 ) ) ( not ( = ?auto_527005 ?auto_527019 ) ) ( not ( = ?auto_527006 ?auto_527007 ) ) ( not ( = ?auto_527006 ?auto_527008 ) ) ( not ( = ?auto_527006 ?auto_527009 ) ) ( not ( = ?auto_527006 ?auto_527010 ) ) ( not ( = ?auto_527006 ?auto_527011 ) ) ( not ( = ?auto_527006 ?auto_527012 ) ) ( not ( = ?auto_527006 ?auto_527013 ) ) ( not ( = ?auto_527006 ?auto_527014 ) ) ( not ( = ?auto_527006 ?auto_527015 ) ) ( not ( = ?auto_527006 ?auto_527016 ) ) ( not ( = ?auto_527006 ?auto_527017 ) ) ( not ( = ?auto_527006 ?auto_527018 ) ) ( not ( = ?auto_527006 ?auto_527019 ) ) ( not ( = ?auto_527007 ?auto_527008 ) ) ( not ( = ?auto_527007 ?auto_527009 ) ) ( not ( = ?auto_527007 ?auto_527010 ) ) ( not ( = ?auto_527007 ?auto_527011 ) ) ( not ( = ?auto_527007 ?auto_527012 ) ) ( not ( = ?auto_527007 ?auto_527013 ) ) ( not ( = ?auto_527007 ?auto_527014 ) ) ( not ( = ?auto_527007 ?auto_527015 ) ) ( not ( = ?auto_527007 ?auto_527016 ) ) ( not ( = ?auto_527007 ?auto_527017 ) ) ( not ( = ?auto_527007 ?auto_527018 ) ) ( not ( = ?auto_527007 ?auto_527019 ) ) ( not ( = ?auto_527008 ?auto_527009 ) ) ( not ( = ?auto_527008 ?auto_527010 ) ) ( not ( = ?auto_527008 ?auto_527011 ) ) ( not ( = ?auto_527008 ?auto_527012 ) ) ( not ( = ?auto_527008 ?auto_527013 ) ) ( not ( = ?auto_527008 ?auto_527014 ) ) ( not ( = ?auto_527008 ?auto_527015 ) ) ( not ( = ?auto_527008 ?auto_527016 ) ) ( not ( = ?auto_527008 ?auto_527017 ) ) ( not ( = ?auto_527008 ?auto_527018 ) ) ( not ( = ?auto_527008 ?auto_527019 ) ) ( not ( = ?auto_527009 ?auto_527010 ) ) ( not ( = ?auto_527009 ?auto_527011 ) ) ( not ( = ?auto_527009 ?auto_527012 ) ) ( not ( = ?auto_527009 ?auto_527013 ) ) ( not ( = ?auto_527009 ?auto_527014 ) ) ( not ( = ?auto_527009 ?auto_527015 ) ) ( not ( = ?auto_527009 ?auto_527016 ) ) ( not ( = ?auto_527009 ?auto_527017 ) ) ( not ( = ?auto_527009 ?auto_527018 ) ) ( not ( = ?auto_527009 ?auto_527019 ) ) ( not ( = ?auto_527010 ?auto_527011 ) ) ( not ( = ?auto_527010 ?auto_527012 ) ) ( not ( = ?auto_527010 ?auto_527013 ) ) ( not ( = ?auto_527010 ?auto_527014 ) ) ( not ( = ?auto_527010 ?auto_527015 ) ) ( not ( = ?auto_527010 ?auto_527016 ) ) ( not ( = ?auto_527010 ?auto_527017 ) ) ( not ( = ?auto_527010 ?auto_527018 ) ) ( not ( = ?auto_527010 ?auto_527019 ) ) ( not ( = ?auto_527011 ?auto_527012 ) ) ( not ( = ?auto_527011 ?auto_527013 ) ) ( not ( = ?auto_527011 ?auto_527014 ) ) ( not ( = ?auto_527011 ?auto_527015 ) ) ( not ( = ?auto_527011 ?auto_527016 ) ) ( not ( = ?auto_527011 ?auto_527017 ) ) ( not ( = ?auto_527011 ?auto_527018 ) ) ( not ( = ?auto_527011 ?auto_527019 ) ) ( not ( = ?auto_527012 ?auto_527013 ) ) ( not ( = ?auto_527012 ?auto_527014 ) ) ( not ( = ?auto_527012 ?auto_527015 ) ) ( not ( = ?auto_527012 ?auto_527016 ) ) ( not ( = ?auto_527012 ?auto_527017 ) ) ( not ( = ?auto_527012 ?auto_527018 ) ) ( not ( = ?auto_527012 ?auto_527019 ) ) ( not ( = ?auto_527013 ?auto_527014 ) ) ( not ( = ?auto_527013 ?auto_527015 ) ) ( not ( = ?auto_527013 ?auto_527016 ) ) ( not ( = ?auto_527013 ?auto_527017 ) ) ( not ( = ?auto_527013 ?auto_527018 ) ) ( not ( = ?auto_527013 ?auto_527019 ) ) ( not ( = ?auto_527014 ?auto_527015 ) ) ( not ( = ?auto_527014 ?auto_527016 ) ) ( not ( = ?auto_527014 ?auto_527017 ) ) ( not ( = ?auto_527014 ?auto_527018 ) ) ( not ( = ?auto_527014 ?auto_527019 ) ) ( not ( = ?auto_527015 ?auto_527016 ) ) ( not ( = ?auto_527015 ?auto_527017 ) ) ( not ( = ?auto_527015 ?auto_527018 ) ) ( not ( = ?auto_527015 ?auto_527019 ) ) ( not ( = ?auto_527016 ?auto_527017 ) ) ( not ( = ?auto_527016 ?auto_527018 ) ) ( not ( = ?auto_527016 ?auto_527019 ) ) ( not ( = ?auto_527017 ?auto_527018 ) ) ( not ( = ?auto_527017 ?auto_527019 ) ) ( not ( = ?auto_527018 ?auto_527019 ) ) ( ON ?auto_527017 ?auto_527018 ) ( ON ?auto_527016 ?auto_527017 ) ( ON ?auto_527015 ?auto_527016 ) ( ON ?auto_527014 ?auto_527015 ) ( ON ?auto_527013 ?auto_527014 ) ( CLEAR ?auto_527011 ) ( ON ?auto_527012 ?auto_527013 ) ( CLEAR ?auto_527012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_527003 ?auto_527004 ?auto_527005 ?auto_527006 ?auto_527007 ?auto_527008 ?auto_527009 ?auto_527010 ?auto_527011 ?auto_527012 )
      ( MAKE-16PILE ?auto_527003 ?auto_527004 ?auto_527005 ?auto_527006 ?auto_527007 ?auto_527008 ?auto_527009 ?auto_527010 ?auto_527011 ?auto_527012 ?auto_527013 ?auto_527014 ?auto_527015 ?auto_527016 ?auto_527017 ?auto_527018 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527036 - BLOCK
      ?auto_527037 - BLOCK
      ?auto_527038 - BLOCK
      ?auto_527039 - BLOCK
      ?auto_527040 - BLOCK
      ?auto_527041 - BLOCK
      ?auto_527042 - BLOCK
      ?auto_527043 - BLOCK
      ?auto_527044 - BLOCK
      ?auto_527045 - BLOCK
      ?auto_527046 - BLOCK
      ?auto_527047 - BLOCK
      ?auto_527048 - BLOCK
      ?auto_527049 - BLOCK
      ?auto_527050 - BLOCK
      ?auto_527051 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_527051 ) ( ON-TABLE ?auto_527036 ) ( ON ?auto_527037 ?auto_527036 ) ( ON ?auto_527038 ?auto_527037 ) ( ON ?auto_527039 ?auto_527038 ) ( ON ?auto_527040 ?auto_527039 ) ( ON ?auto_527041 ?auto_527040 ) ( ON ?auto_527042 ?auto_527041 ) ( ON ?auto_527043 ?auto_527042 ) ( ON ?auto_527044 ?auto_527043 ) ( not ( = ?auto_527036 ?auto_527037 ) ) ( not ( = ?auto_527036 ?auto_527038 ) ) ( not ( = ?auto_527036 ?auto_527039 ) ) ( not ( = ?auto_527036 ?auto_527040 ) ) ( not ( = ?auto_527036 ?auto_527041 ) ) ( not ( = ?auto_527036 ?auto_527042 ) ) ( not ( = ?auto_527036 ?auto_527043 ) ) ( not ( = ?auto_527036 ?auto_527044 ) ) ( not ( = ?auto_527036 ?auto_527045 ) ) ( not ( = ?auto_527036 ?auto_527046 ) ) ( not ( = ?auto_527036 ?auto_527047 ) ) ( not ( = ?auto_527036 ?auto_527048 ) ) ( not ( = ?auto_527036 ?auto_527049 ) ) ( not ( = ?auto_527036 ?auto_527050 ) ) ( not ( = ?auto_527036 ?auto_527051 ) ) ( not ( = ?auto_527037 ?auto_527038 ) ) ( not ( = ?auto_527037 ?auto_527039 ) ) ( not ( = ?auto_527037 ?auto_527040 ) ) ( not ( = ?auto_527037 ?auto_527041 ) ) ( not ( = ?auto_527037 ?auto_527042 ) ) ( not ( = ?auto_527037 ?auto_527043 ) ) ( not ( = ?auto_527037 ?auto_527044 ) ) ( not ( = ?auto_527037 ?auto_527045 ) ) ( not ( = ?auto_527037 ?auto_527046 ) ) ( not ( = ?auto_527037 ?auto_527047 ) ) ( not ( = ?auto_527037 ?auto_527048 ) ) ( not ( = ?auto_527037 ?auto_527049 ) ) ( not ( = ?auto_527037 ?auto_527050 ) ) ( not ( = ?auto_527037 ?auto_527051 ) ) ( not ( = ?auto_527038 ?auto_527039 ) ) ( not ( = ?auto_527038 ?auto_527040 ) ) ( not ( = ?auto_527038 ?auto_527041 ) ) ( not ( = ?auto_527038 ?auto_527042 ) ) ( not ( = ?auto_527038 ?auto_527043 ) ) ( not ( = ?auto_527038 ?auto_527044 ) ) ( not ( = ?auto_527038 ?auto_527045 ) ) ( not ( = ?auto_527038 ?auto_527046 ) ) ( not ( = ?auto_527038 ?auto_527047 ) ) ( not ( = ?auto_527038 ?auto_527048 ) ) ( not ( = ?auto_527038 ?auto_527049 ) ) ( not ( = ?auto_527038 ?auto_527050 ) ) ( not ( = ?auto_527038 ?auto_527051 ) ) ( not ( = ?auto_527039 ?auto_527040 ) ) ( not ( = ?auto_527039 ?auto_527041 ) ) ( not ( = ?auto_527039 ?auto_527042 ) ) ( not ( = ?auto_527039 ?auto_527043 ) ) ( not ( = ?auto_527039 ?auto_527044 ) ) ( not ( = ?auto_527039 ?auto_527045 ) ) ( not ( = ?auto_527039 ?auto_527046 ) ) ( not ( = ?auto_527039 ?auto_527047 ) ) ( not ( = ?auto_527039 ?auto_527048 ) ) ( not ( = ?auto_527039 ?auto_527049 ) ) ( not ( = ?auto_527039 ?auto_527050 ) ) ( not ( = ?auto_527039 ?auto_527051 ) ) ( not ( = ?auto_527040 ?auto_527041 ) ) ( not ( = ?auto_527040 ?auto_527042 ) ) ( not ( = ?auto_527040 ?auto_527043 ) ) ( not ( = ?auto_527040 ?auto_527044 ) ) ( not ( = ?auto_527040 ?auto_527045 ) ) ( not ( = ?auto_527040 ?auto_527046 ) ) ( not ( = ?auto_527040 ?auto_527047 ) ) ( not ( = ?auto_527040 ?auto_527048 ) ) ( not ( = ?auto_527040 ?auto_527049 ) ) ( not ( = ?auto_527040 ?auto_527050 ) ) ( not ( = ?auto_527040 ?auto_527051 ) ) ( not ( = ?auto_527041 ?auto_527042 ) ) ( not ( = ?auto_527041 ?auto_527043 ) ) ( not ( = ?auto_527041 ?auto_527044 ) ) ( not ( = ?auto_527041 ?auto_527045 ) ) ( not ( = ?auto_527041 ?auto_527046 ) ) ( not ( = ?auto_527041 ?auto_527047 ) ) ( not ( = ?auto_527041 ?auto_527048 ) ) ( not ( = ?auto_527041 ?auto_527049 ) ) ( not ( = ?auto_527041 ?auto_527050 ) ) ( not ( = ?auto_527041 ?auto_527051 ) ) ( not ( = ?auto_527042 ?auto_527043 ) ) ( not ( = ?auto_527042 ?auto_527044 ) ) ( not ( = ?auto_527042 ?auto_527045 ) ) ( not ( = ?auto_527042 ?auto_527046 ) ) ( not ( = ?auto_527042 ?auto_527047 ) ) ( not ( = ?auto_527042 ?auto_527048 ) ) ( not ( = ?auto_527042 ?auto_527049 ) ) ( not ( = ?auto_527042 ?auto_527050 ) ) ( not ( = ?auto_527042 ?auto_527051 ) ) ( not ( = ?auto_527043 ?auto_527044 ) ) ( not ( = ?auto_527043 ?auto_527045 ) ) ( not ( = ?auto_527043 ?auto_527046 ) ) ( not ( = ?auto_527043 ?auto_527047 ) ) ( not ( = ?auto_527043 ?auto_527048 ) ) ( not ( = ?auto_527043 ?auto_527049 ) ) ( not ( = ?auto_527043 ?auto_527050 ) ) ( not ( = ?auto_527043 ?auto_527051 ) ) ( not ( = ?auto_527044 ?auto_527045 ) ) ( not ( = ?auto_527044 ?auto_527046 ) ) ( not ( = ?auto_527044 ?auto_527047 ) ) ( not ( = ?auto_527044 ?auto_527048 ) ) ( not ( = ?auto_527044 ?auto_527049 ) ) ( not ( = ?auto_527044 ?auto_527050 ) ) ( not ( = ?auto_527044 ?auto_527051 ) ) ( not ( = ?auto_527045 ?auto_527046 ) ) ( not ( = ?auto_527045 ?auto_527047 ) ) ( not ( = ?auto_527045 ?auto_527048 ) ) ( not ( = ?auto_527045 ?auto_527049 ) ) ( not ( = ?auto_527045 ?auto_527050 ) ) ( not ( = ?auto_527045 ?auto_527051 ) ) ( not ( = ?auto_527046 ?auto_527047 ) ) ( not ( = ?auto_527046 ?auto_527048 ) ) ( not ( = ?auto_527046 ?auto_527049 ) ) ( not ( = ?auto_527046 ?auto_527050 ) ) ( not ( = ?auto_527046 ?auto_527051 ) ) ( not ( = ?auto_527047 ?auto_527048 ) ) ( not ( = ?auto_527047 ?auto_527049 ) ) ( not ( = ?auto_527047 ?auto_527050 ) ) ( not ( = ?auto_527047 ?auto_527051 ) ) ( not ( = ?auto_527048 ?auto_527049 ) ) ( not ( = ?auto_527048 ?auto_527050 ) ) ( not ( = ?auto_527048 ?auto_527051 ) ) ( not ( = ?auto_527049 ?auto_527050 ) ) ( not ( = ?auto_527049 ?auto_527051 ) ) ( not ( = ?auto_527050 ?auto_527051 ) ) ( ON ?auto_527050 ?auto_527051 ) ( ON ?auto_527049 ?auto_527050 ) ( ON ?auto_527048 ?auto_527049 ) ( ON ?auto_527047 ?auto_527048 ) ( ON ?auto_527046 ?auto_527047 ) ( CLEAR ?auto_527044 ) ( ON ?auto_527045 ?auto_527046 ) ( CLEAR ?auto_527045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_527036 ?auto_527037 ?auto_527038 ?auto_527039 ?auto_527040 ?auto_527041 ?auto_527042 ?auto_527043 ?auto_527044 ?auto_527045 )
      ( MAKE-16PILE ?auto_527036 ?auto_527037 ?auto_527038 ?auto_527039 ?auto_527040 ?auto_527041 ?auto_527042 ?auto_527043 ?auto_527044 ?auto_527045 ?auto_527046 ?auto_527047 ?auto_527048 ?auto_527049 ?auto_527050 ?auto_527051 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527068 - BLOCK
      ?auto_527069 - BLOCK
      ?auto_527070 - BLOCK
      ?auto_527071 - BLOCK
      ?auto_527072 - BLOCK
      ?auto_527073 - BLOCK
      ?auto_527074 - BLOCK
      ?auto_527075 - BLOCK
      ?auto_527076 - BLOCK
      ?auto_527077 - BLOCK
      ?auto_527078 - BLOCK
      ?auto_527079 - BLOCK
      ?auto_527080 - BLOCK
      ?auto_527081 - BLOCK
      ?auto_527082 - BLOCK
      ?auto_527083 - BLOCK
    )
    :vars
    (
      ?auto_527084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527083 ?auto_527084 ) ( ON-TABLE ?auto_527068 ) ( ON ?auto_527069 ?auto_527068 ) ( ON ?auto_527070 ?auto_527069 ) ( ON ?auto_527071 ?auto_527070 ) ( ON ?auto_527072 ?auto_527071 ) ( ON ?auto_527073 ?auto_527072 ) ( ON ?auto_527074 ?auto_527073 ) ( ON ?auto_527075 ?auto_527074 ) ( not ( = ?auto_527068 ?auto_527069 ) ) ( not ( = ?auto_527068 ?auto_527070 ) ) ( not ( = ?auto_527068 ?auto_527071 ) ) ( not ( = ?auto_527068 ?auto_527072 ) ) ( not ( = ?auto_527068 ?auto_527073 ) ) ( not ( = ?auto_527068 ?auto_527074 ) ) ( not ( = ?auto_527068 ?auto_527075 ) ) ( not ( = ?auto_527068 ?auto_527076 ) ) ( not ( = ?auto_527068 ?auto_527077 ) ) ( not ( = ?auto_527068 ?auto_527078 ) ) ( not ( = ?auto_527068 ?auto_527079 ) ) ( not ( = ?auto_527068 ?auto_527080 ) ) ( not ( = ?auto_527068 ?auto_527081 ) ) ( not ( = ?auto_527068 ?auto_527082 ) ) ( not ( = ?auto_527068 ?auto_527083 ) ) ( not ( = ?auto_527068 ?auto_527084 ) ) ( not ( = ?auto_527069 ?auto_527070 ) ) ( not ( = ?auto_527069 ?auto_527071 ) ) ( not ( = ?auto_527069 ?auto_527072 ) ) ( not ( = ?auto_527069 ?auto_527073 ) ) ( not ( = ?auto_527069 ?auto_527074 ) ) ( not ( = ?auto_527069 ?auto_527075 ) ) ( not ( = ?auto_527069 ?auto_527076 ) ) ( not ( = ?auto_527069 ?auto_527077 ) ) ( not ( = ?auto_527069 ?auto_527078 ) ) ( not ( = ?auto_527069 ?auto_527079 ) ) ( not ( = ?auto_527069 ?auto_527080 ) ) ( not ( = ?auto_527069 ?auto_527081 ) ) ( not ( = ?auto_527069 ?auto_527082 ) ) ( not ( = ?auto_527069 ?auto_527083 ) ) ( not ( = ?auto_527069 ?auto_527084 ) ) ( not ( = ?auto_527070 ?auto_527071 ) ) ( not ( = ?auto_527070 ?auto_527072 ) ) ( not ( = ?auto_527070 ?auto_527073 ) ) ( not ( = ?auto_527070 ?auto_527074 ) ) ( not ( = ?auto_527070 ?auto_527075 ) ) ( not ( = ?auto_527070 ?auto_527076 ) ) ( not ( = ?auto_527070 ?auto_527077 ) ) ( not ( = ?auto_527070 ?auto_527078 ) ) ( not ( = ?auto_527070 ?auto_527079 ) ) ( not ( = ?auto_527070 ?auto_527080 ) ) ( not ( = ?auto_527070 ?auto_527081 ) ) ( not ( = ?auto_527070 ?auto_527082 ) ) ( not ( = ?auto_527070 ?auto_527083 ) ) ( not ( = ?auto_527070 ?auto_527084 ) ) ( not ( = ?auto_527071 ?auto_527072 ) ) ( not ( = ?auto_527071 ?auto_527073 ) ) ( not ( = ?auto_527071 ?auto_527074 ) ) ( not ( = ?auto_527071 ?auto_527075 ) ) ( not ( = ?auto_527071 ?auto_527076 ) ) ( not ( = ?auto_527071 ?auto_527077 ) ) ( not ( = ?auto_527071 ?auto_527078 ) ) ( not ( = ?auto_527071 ?auto_527079 ) ) ( not ( = ?auto_527071 ?auto_527080 ) ) ( not ( = ?auto_527071 ?auto_527081 ) ) ( not ( = ?auto_527071 ?auto_527082 ) ) ( not ( = ?auto_527071 ?auto_527083 ) ) ( not ( = ?auto_527071 ?auto_527084 ) ) ( not ( = ?auto_527072 ?auto_527073 ) ) ( not ( = ?auto_527072 ?auto_527074 ) ) ( not ( = ?auto_527072 ?auto_527075 ) ) ( not ( = ?auto_527072 ?auto_527076 ) ) ( not ( = ?auto_527072 ?auto_527077 ) ) ( not ( = ?auto_527072 ?auto_527078 ) ) ( not ( = ?auto_527072 ?auto_527079 ) ) ( not ( = ?auto_527072 ?auto_527080 ) ) ( not ( = ?auto_527072 ?auto_527081 ) ) ( not ( = ?auto_527072 ?auto_527082 ) ) ( not ( = ?auto_527072 ?auto_527083 ) ) ( not ( = ?auto_527072 ?auto_527084 ) ) ( not ( = ?auto_527073 ?auto_527074 ) ) ( not ( = ?auto_527073 ?auto_527075 ) ) ( not ( = ?auto_527073 ?auto_527076 ) ) ( not ( = ?auto_527073 ?auto_527077 ) ) ( not ( = ?auto_527073 ?auto_527078 ) ) ( not ( = ?auto_527073 ?auto_527079 ) ) ( not ( = ?auto_527073 ?auto_527080 ) ) ( not ( = ?auto_527073 ?auto_527081 ) ) ( not ( = ?auto_527073 ?auto_527082 ) ) ( not ( = ?auto_527073 ?auto_527083 ) ) ( not ( = ?auto_527073 ?auto_527084 ) ) ( not ( = ?auto_527074 ?auto_527075 ) ) ( not ( = ?auto_527074 ?auto_527076 ) ) ( not ( = ?auto_527074 ?auto_527077 ) ) ( not ( = ?auto_527074 ?auto_527078 ) ) ( not ( = ?auto_527074 ?auto_527079 ) ) ( not ( = ?auto_527074 ?auto_527080 ) ) ( not ( = ?auto_527074 ?auto_527081 ) ) ( not ( = ?auto_527074 ?auto_527082 ) ) ( not ( = ?auto_527074 ?auto_527083 ) ) ( not ( = ?auto_527074 ?auto_527084 ) ) ( not ( = ?auto_527075 ?auto_527076 ) ) ( not ( = ?auto_527075 ?auto_527077 ) ) ( not ( = ?auto_527075 ?auto_527078 ) ) ( not ( = ?auto_527075 ?auto_527079 ) ) ( not ( = ?auto_527075 ?auto_527080 ) ) ( not ( = ?auto_527075 ?auto_527081 ) ) ( not ( = ?auto_527075 ?auto_527082 ) ) ( not ( = ?auto_527075 ?auto_527083 ) ) ( not ( = ?auto_527075 ?auto_527084 ) ) ( not ( = ?auto_527076 ?auto_527077 ) ) ( not ( = ?auto_527076 ?auto_527078 ) ) ( not ( = ?auto_527076 ?auto_527079 ) ) ( not ( = ?auto_527076 ?auto_527080 ) ) ( not ( = ?auto_527076 ?auto_527081 ) ) ( not ( = ?auto_527076 ?auto_527082 ) ) ( not ( = ?auto_527076 ?auto_527083 ) ) ( not ( = ?auto_527076 ?auto_527084 ) ) ( not ( = ?auto_527077 ?auto_527078 ) ) ( not ( = ?auto_527077 ?auto_527079 ) ) ( not ( = ?auto_527077 ?auto_527080 ) ) ( not ( = ?auto_527077 ?auto_527081 ) ) ( not ( = ?auto_527077 ?auto_527082 ) ) ( not ( = ?auto_527077 ?auto_527083 ) ) ( not ( = ?auto_527077 ?auto_527084 ) ) ( not ( = ?auto_527078 ?auto_527079 ) ) ( not ( = ?auto_527078 ?auto_527080 ) ) ( not ( = ?auto_527078 ?auto_527081 ) ) ( not ( = ?auto_527078 ?auto_527082 ) ) ( not ( = ?auto_527078 ?auto_527083 ) ) ( not ( = ?auto_527078 ?auto_527084 ) ) ( not ( = ?auto_527079 ?auto_527080 ) ) ( not ( = ?auto_527079 ?auto_527081 ) ) ( not ( = ?auto_527079 ?auto_527082 ) ) ( not ( = ?auto_527079 ?auto_527083 ) ) ( not ( = ?auto_527079 ?auto_527084 ) ) ( not ( = ?auto_527080 ?auto_527081 ) ) ( not ( = ?auto_527080 ?auto_527082 ) ) ( not ( = ?auto_527080 ?auto_527083 ) ) ( not ( = ?auto_527080 ?auto_527084 ) ) ( not ( = ?auto_527081 ?auto_527082 ) ) ( not ( = ?auto_527081 ?auto_527083 ) ) ( not ( = ?auto_527081 ?auto_527084 ) ) ( not ( = ?auto_527082 ?auto_527083 ) ) ( not ( = ?auto_527082 ?auto_527084 ) ) ( not ( = ?auto_527083 ?auto_527084 ) ) ( ON ?auto_527082 ?auto_527083 ) ( ON ?auto_527081 ?auto_527082 ) ( ON ?auto_527080 ?auto_527081 ) ( ON ?auto_527079 ?auto_527080 ) ( ON ?auto_527078 ?auto_527079 ) ( ON ?auto_527077 ?auto_527078 ) ( CLEAR ?auto_527075 ) ( ON ?auto_527076 ?auto_527077 ) ( CLEAR ?auto_527076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_527068 ?auto_527069 ?auto_527070 ?auto_527071 ?auto_527072 ?auto_527073 ?auto_527074 ?auto_527075 ?auto_527076 )
      ( MAKE-16PILE ?auto_527068 ?auto_527069 ?auto_527070 ?auto_527071 ?auto_527072 ?auto_527073 ?auto_527074 ?auto_527075 ?auto_527076 ?auto_527077 ?auto_527078 ?auto_527079 ?auto_527080 ?auto_527081 ?auto_527082 ?auto_527083 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527101 - BLOCK
      ?auto_527102 - BLOCK
      ?auto_527103 - BLOCK
      ?auto_527104 - BLOCK
      ?auto_527105 - BLOCK
      ?auto_527106 - BLOCK
      ?auto_527107 - BLOCK
      ?auto_527108 - BLOCK
      ?auto_527109 - BLOCK
      ?auto_527110 - BLOCK
      ?auto_527111 - BLOCK
      ?auto_527112 - BLOCK
      ?auto_527113 - BLOCK
      ?auto_527114 - BLOCK
      ?auto_527115 - BLOCK
      ?auto_527116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_527116 ) ( ON-TABLE ?auto_527101 ) ( ON ?auto_527102 ?auto_527101 ) ( ON ?auto_527103 ?auto_527102 ) ( ON ?auto_527104 ?auto_527103 ) ( ON ?auto_527105 ?auto_527104 ) ( ON ?auto_527106 ?auto_527105 ) ( ON ?auto_527107 ?auto_527106 ) ( ON ?auto_527108 ?auto_527107 ) ( not ( = ?auto_527101 ?auto_527102 ) ) ( not ( = ?auto_527101 ?auto_527103 ) ) ( not ( = ?auto_527101 ?auto_527104 ) ) ( not ( = ?auto_527101 ?auto_527105 ) ) ( not ( = ?auto_527101 ?auto_527106 ) ) ( not ( = ?auto_527101 ?auto_527107 ) ) ( not ( = ?auto_527101 ?auto_527108 ) ) ( not ( = ?auto_527101 ?auto_527109 ) ) ( not ( = ?auto_527101 ?auto_527110 ) ) ( not ( = ?auto_527101 ?auto_527111 ) ) ( not ( = ?auto_527101 ?auto_527112 ) ) ( not ( = ?auto_527101 ?auto_527113 ) ) ( not ( = ?auto_527101 ?auto_527114 ) ) ( not ( = ?auto_527101 ?auto_527115 ) ) ( not ( = ?auto_527101 ?auto_527116 ) ) ( not ( = ?auto_527102 ?auto_527103 ) ) ( not ( = ?auto_527102 ?auto_527104 ) ) ( not ( = ?auto_527102 ?auto_527105 ) ) ( not ( = ?auto_527102 ?auto_527106 ) ) ( not ( = ?auto_527102 ?auto_527107 ) ) ( not ( = ?auto_527102 ?auto_527108 ) ) ( not ( = ?auto_527102 ?auto_527109 ) ) ( not ( = ?auto_527102 ?auto_527110 ) ) ( not ( = ?auto_527102 ?auto_527111 ) ) ( not ( = ?auto_527102 ?auto_527112 ) ) ( not ( = ?auto_527102 ?auto_527113 ) ) ( not ( = ?auto_527102 ?auto_527114 ) ) ( not ( = ?auto_527102 ?auto_527115 ) ) ( not ( = ?auto_527102 ?auto_527116 ) ) ( not ( = ?auto_527103 ?auto_527104 ) ) ( not ( = ?auto_527103 ?auto_527105 ) ) ( not ( = ?auto_527103 ?auto_527106 ) ) ( not ( = ?auto_527103 ?auto_527107 ) ) ( not ( = ?auto_527103 ?auto_527108 ) ) ( not ( = ?auto_527103 ?auto_527109 ) ) ( not ( = ?auto_527103 ?auto_527110 ) ) ( not ( = ?auto_527103 ?auto_527111 ) ) ( not ( = ?auto_527103 ?auto_527112 ) ) ( not ( = ?auto_527103 ?auto_527113 ) ) ( not ( = ?auto_527103 ?auto_527114 ) ) ( not ( = ?auto_527103 ?auto_527115 ) ) ( not ( = ?auto_527103 ?auto_527116 ) ) ( not ( = ?auto_527104 ?auto_527105 ) ) ( not ( = ?auto_527104 ?auto_527106 ) ) ( not ( = ?auto_527104 ?auto_527107 ) ) ( not ( = ?auto_527104 ?auto_527108 ) ) ( not ( = ?auto_527104 ?auto_527109 ) ) ( not ( = ?auto_527104 ?auto_527110 ) ) ( not ( = ?auto_527104 ?auto_527111 ) ) ( not ( = ?auto_527104 ?auto_527112 ) ) ( not ( = ?auto_527104 ?auto_527113 ) ) ( not ( = ?auto_527104 ?auto_527114 ) ) ( not ( = ?auto_527104 ?auto_527115 ) ) ( not ( = ?auto_527104 ?auto_527116 ) ) ( not ( = ?auto_527105 ?auto_527106 ) ) ( not ( = ?auto_527105 ?auto_527107 ) ) ( not ( = ?auto_527105 ?auto_527108 ) ) ( not ( = ?auto_527105 ?auto_527109 ) ) ( not ( = ?auto_527105 ?auto_527110 ) ) ( not ( = ?auto_527105 ?auto_527111 ) ) ( not ( = ?auto_527105 ?auto_527112 ) ) ( not ( = ?auto_527105 ?auto_527113 ) ) ( not ( = ?auto_527105 ?auto_527114 ) ) ( not ( = ?auto_527105 ?auto_527115 ) ) ( not ( = ?auto_527105 ?auto_527116 ) ) ( not ( = ?auto_527106 ?auto_527107 ) ) ( not ( = ?auto_527106 ?auto_527108 ) ) ( not ( = ?auto_527106 ?auto_527109 ) ) ( not ( = ?auto_527106 ?auto_527110 ) ) ( not ( = ?auto_527106 ?auto_527111 ) ) ( not ( = ?auto_527106 ?auto_527112 ) ) ( not ( = ?auto_527106 ?auto_527113 ) ) ( not ( = ?auto_527106 ?auto_527114 ) ) ( not ( = ?auto_527106 ?auto_527115 ) ) ( not ( = ?auto_527106 ?auto_527116 ) ) ( not ( = ?auto_527107 ?auto_527108 ) ) ( not ( = ?auto_527107 ?auto_527109 ) ) ( not ( = ?auto_527107 ?auto_527110 ) ) ( not ( = ?auto_527107 ?auto_527111 ) ) ( not ( = ?auto_527107 ?auto_527112 ) ) ( not ( = ?auto_527107 ?auto_527113 ) ) ( not ( = ?auto_527107 ?auto_527114 ) ) ( not ( = ?auto_527107 ?auto_527115 ) ) ( not ( = ?auto_527107 ?auto_527116 ) ) ( not ( = ?auto_527108 ?auto_527109 ) ) ( not ( = ?auto_527108 ?auto_527110 ) ) ( not ( = ?auto_527108 ?auto_527111 ) ) ( not ( = ?auto_527108 ?auto_527112 ) ) ( not ( = ?auto_527108 ?auto_527113 ) ) ( not ( = ?auto_527108 ?auto_527114 ) ) ( not ( = ?auto_527108 ?auto_527115 ) ) ( not ( = ?auto_527108 ?auto_527116 ) ) ( not ( = ?auto_527109 ?auto_527110 ) ) ( not ( = ?auto_527109 ?auto_527111 ) ) ( not ( = ?auto_527109 ?auto_527112 ) ) ( not ( = ?auto_527109 ?auto_527113 ) ) ( not ( = ?auto_527109 ?auto_527114 ) ) ( not ( = ?auto_527109 ?auto_527115 ) ) ( not ( = ?auto_527109 ?auto_527116 ) ) ( not ( = ?auto_527110 ?auto_527111 ) ) ( not ( = ?auto_527110 ?auto_527112 ) ) ( not ( = ?auto_527110 ?auto_527113 ) ) ( not ( = ?auto_527110 ?auto_527114 ) ) ( not ( = ?auto_527110 ?auto_527115 ) ) ( not ( = ?auto_527110 ?auto_527116 ) ) ( not ( = ?auto_527111 ?auto_527112 ) ) ( not ( = ?auto_527111 ?auto_527113 ) ) ( not ( = ?auto_527111 ?auto_527114 ) ) ( not ( = ?auto_527111 ?auto_527115 ) ) ( not ( = ?auto_527111 ?auto_527116 ) ) ( not ( = ?auto_527112 ?auto_527113 ) ) ( not ( = ?auto_527112 ?auto_527114 ) ) ( not ( = ?auto_527112 ?auto_527115 ) ) ( not ( = ?auto_527112 ?auto_527116 ) ) ( not ( = ?auto_527113 ?auto_527114 ) ) ( not ( = ?auto_527113 ?auto_527115 ) ) ( not ( = ?auto_527113 ?auto_527116 ) ) ( not ( = ?auto_527114 ?auto_527115 ) ) ( not ( = ?auto_527114 ?auto_527116 ) ) ( not ( = ?auto_527115 ?auto_527116 ) ) ( ON ?auto_527115 ?auto_527116 ) ( ON ?auto_527114 ?auto_527115 ) ( ON ?auto_527113 ?auto_527114 ) ( ON ?auto_527112 ?auto_527113 ) ( ON ?auto_527111 ?auto_527112 ) ( ON ?auto_527110 ?auto_527111 ) ( CLEAR ?auto_527108 ) ( ON ?auto_527109 ?auto_527110 ) ( CLEAR ?auto_527109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_527101 ?auto_527102 ?auto_527103 ?auto_527104 ?auto_527105 ?auto_527106 ?auto_527107 ?auto_527108 ?auto_527109 )
      ( MAKE-16PILE ?auto_527101 ?auto_527102 ?auto_527103 ?auto_527104 ?auto_527105 ?auto_527106 ?auto_527107 ?auto_527108 ?auto_527109 ?auto_527110 ?auto_527111 ?auto_527112 ?auto_527113 ?auto_527114 ?auto_527115 ?auto_527116 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527133 - BLOCK
      ?auto_527134 - BLOCK
      ?auto_527135 - BLOCK
      ?auto_527136 - BLOCK
      ?auto_527137 - BLOCK
      ?auto_527138 - BLOCK
      ?auto_527139 - BLOCK
      ?auto_527140 - BLOCK
      ?auto_527141 - BLOCK
      ?auto_527142 - BLOCK
      ?auto_527143 - BLOCK
      ?auto_527144 - BLOCK
      ?auto_527145 - BLOCK
      ?auto_527146 - BLOCK
      ?auto_527147 - BLOCK
      ?auto_527148 - BLOCK
    )
    :vars
    (
      ?auto_527149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527148 ?auto_527149 ) ( ON-TABLE ?auto_527133 ) ( ON ?auto_527134 ?auto_527133 ) ( ON ?auto_527135 ?auto_527134 ) ( ON ?auto_527136 ?auto_527135 ) ( ON ?auto_527137 ?auto_527136 ) ( ON ?auto_527138 ?auto_527137 ) ( ON ?auto_527139 ?auto_527138 ) ( not ( = ?auto_527133 ?auto_527134 ) ) ( not ( = ?auto_527133 ?auto_527135 ) ) ( not ( = ?auto_527133 ?auto_527136 ) ) ( not ( = ?auto_527133 ?auto_527137 ) ) ( not ( = ?auto_527133 ?auto_527138 ) ) ( not ( = ?auto_527133 ?auto_527139 ) ) ( not ( = ?auto_527133 ?auto_527140 ) ) ( not ( = ?auto_527133 ?auto_527141 ) ) ( not ( = ?auto_527133 ?auto_527142 ) ) ( not ( = ?auto_527133 ?auto_527143 ) ) ( not ( = ?auto_527133 ?auto_527144 ) ) ( not ( = ?auto_527133 ?auto_527145 ) ) ( not ( = ?auto_527133 ?auto_527146 ) ) ( not ( = ?auto_527133 ?auto_527147 ) ) ( not ( = ?auto_527133 ?auto_527148 ) ) ( not ( = ?auto_527133 ?auto_527149 ) ) ( not ( = ?auto_527134 ?auto_527135 ) ) ( not ( = ?auto_527134 ?auto_527136 ) ) ( not ( = ?auto_527134 ?auto_527137 ) ) ( not ( = ?auto_527134 ?auto_527138 ) ) ( not ( = ?auto_527134 ?auto_527139 ) ) ( not ( = ?auto_527134 ?auto_527140 ) ) ( not ( = ?auto_527134 ?auto_527141 ) ) ( not ( = ?auto_527134 ?auto_527142 ) ) ( not ( = ?auto_527134 ?auto_527143 ) ) ( not ( = ?auto_527134 ?auto_527144 ) ) ( not ( = ?auto_527134 ?auto_527145 ) ) ( not ( = ?auto_527134 ?auto_527146 ) ) ( not ( = ?auto_527134 ?auto_527147 ) ) ( not ( = ?auto_527134 ?auto_527148 ) ) ( not ( = ?auto_527134 ?auto_527149 ) ) ( not ( = ?auto_527135 ?auto_527136 ) ) ( not ( = ?auto_527135 ?auto_527137 ) ) ( not ( = ?auto_527135 ?auto_527138 ) ) ( not ( = ?auto_527135 ?auto_527139 ) ) ( not ( = ?auto_527135 ?auto_527140 ) ) ( not ( = ?auto_527135 ?auto_527141 ) ) ( not ( = ?auto_527135 ?auto_527142 ) ) ( not ( = ?auto_527135 ?auto_527143 ) ) ( not ( = ?auto_527135 ?auto_527144 ) ) ( not ( = ?auto_527135 ?auto_527145 ) ) ( not ( = ?auto_527135 ?auto_527146 ) ) ( not ( = ?auto_527135 ?auto_527147 ) ) ( not ( = ?auto_527135 ?auto_527148 ) ) ( not ( = ?auto_527135 ?auto_527149 ) ) ( not ( = ?auto_527136 ?auto_527137 ) ) ( not ( = ?auto_527136 ?auto_527138 ) ) ( not ( = ?auto_527136 ?auto_527139 ) ) ( not ( = ?auto_527136 ?auto_527140 ) ) ( not ( = ?auto_527136 ?auto_527141 ) ) ( not ( = ?auto_527136 ?auto_527142 ) ) ( not ( = ?auto_527136 ?auto_527143 ) ) ( not ( = ?auto_527136 ?auto_527144 ) ) ( not ( = ?auto_527136 ?auto_527145 ) ) ( not ( = ?auto_527136 ?auto_527146 ) ) ( not ( = ?auto_527136 ?auto_527147 ) ) ( not ( = ?auto_527136 ?auto_527148 ) ) ( not ( = ?auto_527136 ?auto_527149 ) ) ( not ( = ?auto_527137 ?auto_527138 ) ) ( not ( = ?auto_527137 ?auto_527139 ) ) ( not ( = ?auto_527137 ?auto_527140 ) ) ( not ( = ?auto_527137 ?auto_527141 ) ) ( not ( = ?auto_527137 ?auto_527142 ) ) ( not ( = ?auto_527137 ?auto_527143 ) ) ( not ( = ?auto_527137 ?auto_527144 ) ) ( not ( = ?auto_527137 ?auto_527145 ) ) ( not ( = ?auto_527137 ?auto_527146 ) ) ( not ( = ?auto_527137 ?auto_527147 ) ) ( not ( = ?auto_527137 ?auto_527148 ) ) ( not ( = ?auto_527137 ?auto_527149 ) ) ( not ( = ?auto_527138 ?auto_527139 ) ) ( not ( = ?auto_527138 ?auto_527140 ) ) ( not ( = ?auto_527138 ?auto_527141 ) ) ( not ( = ?auto_527138 ?auto_527142 ) ) ( not ( = ?auto_527138 ?auto_527143 ) ) ( not ( = ?auto_527138 ?auto_527144 ) ) ( not ( = ?auto_527138 ?auto_527145 ) ) ( not ( = ?auto_527138 ?auto_527146 ) ) ( not ( = ?auto_527138 ?auto_527147 ) ) ( not ( = ?auto_527138 ?auto_527148 ) ) ( not ( = ?auto_527138 ?auto_527149 ) ) ( not ( = ?auto_527139 ?auto_527140 ) ) ( not ( = ?auto_527139 ?auto_527141 ) ) ( not ( = ?auto_527139 ?auto_527142 ) ) ( not ( = ?auto_527139 ?auto_527143 ) ) ( not ( = ?auto_527139 ?auto_527144 ) ) ( not ( = ?auto_527139 ?auto_527145 ) ) ( not ( = ?auto_527139 ?auto_527146 ) ) ( not ( = ?auto_527139 ?auto_527147 ) ) ( not ( = ?auto_527139 ?auto_527148 ) ) ( not ( = ?auto_527139 ?auto_527149 ) ) ( not ( = ?auto_527140 ?auto_527141 ) ) ( not ( = ?auto_527140 ?auto_527142 ) ) ( not ( = ?auto_527140 ?auto_527143 ) ) ( not ( = ?auto_527140 ?auto_527144 ) ) ( not ( = ?auto_527140 ?auto_527145 ) ) ( not ( = ?auto_527140 ?auto_527146 ) ) ( not ( = ?auto_527140 ?auto_527147 ) ) ( not ( = ?auto_527140 ?auto_527148 ) ) ( not ( = ?auto_527140 ?auto_527149 ) ) ( not ( = ?auto_527141 ?auto_527142 ) ) ( not ( = ?auto_527141 ?auto_527143 ) ) ( not ( = ?auto_527141 ?auto_527144 ) ) ( not ( = ?auto_527141 ?auto_527145 ) ) ( not ( = ?auto_527141 ?auto_527146 ) ) ( not ( = ?auto_527141 ?auto_527147 ) ) ( not ( = ?auto_527141 ?auto_527148 ) ) ( not ( = ?auto_527141 ?auto_527149 ) ) ( not ( = ?auto_527142 ?auto_527143 ) ) ( not ( = ?auto_527142 ?auto_527144 ) ) ( not ( = ?auto_527142 ?auto_527145 ) ) ( not ( = ?auto_527142 ?auto_527146 ) ) ( not ( = ?auto_527142 ?auto_527147 ) ) ( not ( = ?auto_527142 ?auto_527148 ) ) ( not ( = ?auto_527142 ?auto_527149 ) ) ( not ( = ?auto_527143 ?auto_527144 ) ) ( not ( = ?auto_527143 ?auto_527145 ) ) ( not ( = ?auto_527143 ?auto_527146 ) ) ( not ( = ?auto_527143 ?auto_527147 ) ) ( not ( = ?auto_527143 ?auto_527148 ) ) ( not ( = ?auto_527143 ?auto_527149 ) ) ( not ( = ?auto_527144 ?auto_527145 ) ) ( not ( = ?auto_527144 ?auto_527146 ) ) ( not ( = ?auto_527144 ?auto_527147 ) ) ( not ( = ?auto_527144 ?auto_527148 ) ) ( not ( = ?auto_527144 ?auto_527149 ) ) ( not ( = ?auto_527145 ?auto_527146 ) ) ( not ( = ?auto_527145 ?auto_527147 ) ) ( not ( = ?auto_527145 ?auto_527148 ) ) ( not ( = ?auto_527145 ?auto_527149 ) ) ( not ( = ?auto_527146 ?auto_527147 ) ) ( not ( = ?auto_527146 ?auto_527148 ) ) ( not ( = ?auto_527146 ?auto_527149 ) ) ( not ( = ?auto_527147 ?auto_527148 ) ) ( not ( = ?auto_527147 ?auto_527149 ) ) ( not ( = ?auto_527148 ?auto_527149 ) ) ( ON ?auto_527147 ?auto_527148 ) ( ON ?auto_527146 ?auto_527147 ) ( ON ?auto_527145 ?auto_527146 ) ( ON ?auto_527144 ?auto_527145 ) ( ON ?auto_527143 ?auto_527144 ) ( ON ?auto_527142 ?auto_527143 ) ( ON ?auto_527141 ?auto_527142 ) ( CLEAR ?auto_527139 ) ( ON ?auto_527140 ?auto_527141 ) ( CLEAR ?auto_527140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_527133 ?auto_527134 ?auto_527135 ?auto_527136 ?auto_527137 ?auto_527138 ?auto_527139 ?auto_527140 )
      ( MAKE-16PILE ?auto_527133 ?auto_527134 ?auto_527135 ?auto_527136 ?auto_527137 ?auto_527138 ?auto_527139 ?auto_527140 ?auto_527141 ?auto_527142 ?auto_527143 ?auto_527144 ?auto_527145 ?auto_527146 ?auto_527147 ?auto_527148 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527166 - BLOCK
      ?auto_527167 - BLOCK
      ?auto_527168 - BLOCK
      ?auto_527169 - BLOCK
      ?auto_527170 - BLOCK
      ?auto_527171 - BLOCK
      ?auto_527172 - BLOCK
      ?auto_527173 - BLOCK
      ?auto_527174 - BLOCK
      ?auto_527175 - BLOCK
      ?auto_527176 - BLOCK
      ?auto_527177 - BLOCK
      ?auto_527178 - BLOCK
      ?auto_527179 - BLOCK
      ?auto_527180 - BLOCK
      ?auto_527181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_527181 ) ( ON-TABLE ?auto_527166 ) ( ON ?auto_527167 ?auto_527166 ) ( ON ?auto_527168 ?auto_527167 ) ( ON ?auto_527169 ?auto_527168 ) ( ON ?auto_527170 ?auto_527169 ) ( ON ?auto_527171 ?auto_527170 ) ( ON ?auto_527172 ?auto_527171 ) ( not ( = ?auto_527166 ?auto_527167 ) ) ( not ( = ?auto_527166 ?auto_527168 ) ) ( not ( = ?auto_527166 ?auto_527169 ) ) ( not ( = ?auto_527166 ?auto_527170 ) ) ( not ( = ?auto_527166 ?auto_527171 ) ) ( not ( = ?auto_527166 ?auto_527172 ) ) ( not ( = ?auto_527166 ?auto_527173 ) ) ( not ( = ?auto_527166 ?auto_527174 ) ) ( not ( = ?auto_527166 ?auto_527175 ) ) ( not ( = ?auto_527166 ?auto_527176 ) ) ( not ( = ?auto_527166 ?auto_527177 ) ) ( not ( = ?auto_527166 ?auto_527178 ) ) ( not ( = ?auto_527166 ?auto_527179 ) ) ( not ( = ?auto_527166 ?auto_527180 ) ) ( not ( = ?auto_527166 ?auto_527181 ) ) ( not ( = ?auto_527167 ?auto_527168 ) ) ( not ( = ?auto_527167 ?auto_527169 ) ) ( not ( = ?auto_527167 ?auto_527170 ) ) ( not ( = ?auto_527167 ?auto_527171 ) ) ( not ( = ?auto_527167 ?auto_527172 ) ) ( not ( = ?auto_527167 ?auto_527173 ) ) ( not ( = ?auto_527167 ?auto_527174 ) ) ( not ( = ?auto_527167 ?auto_527175 ) ) ( not ( = ?auto_527167 ?auto_527176 ) ) ( not ( = ?auto_527167 ?auto_527177 ) ) ( not ( = ?auto_527167 ?auto_527178 ) ) ( not ( = ?auto_527167 ?auto_527179 ) ) ( not ( = ?auto_527167 ?auto_527180 ) ) ( not ( = ?auto_527167 ?auto_527181 ) ) ( not ( = ?auto_527168 ?auto_527169 ) ) ( not ( = ?auto_527168 ?auto_527170 ) ) ( not ( = ?auto_527168 ?auto_527171 ) ) ( not ( = ?auto_527168 ?auto_527172 ) ) ( not ( = ?auto_527168 ?auto_527173 ) ) ( not ( = ?auto_527168 ?auto_527174 ) ) ( not ( = ?auto_527168 ?auto_527175 ) ) ( not ( = ?auto_527168 ?auto_527176 ) ) ( not ( = ?auto_527168 ?auto_527177 ) ) ( not ( = ?auto_527168 ?auto_527178 ) ) ( not ( = ?auto_527168 ?auto_527179 ) ) ( not ( = ?auto_527168 ?auto_527180 ) ) ( not ( = ?auto_527168 ?auto_527181 ) ) ( not ( = ?auto_527169 ?auto_527170 ) ) ( not ( = ?auto_527169 ?auto_527171 ) ) ( not ( = ?auto_527169 ?auto_527172 ) ) ( not ( = ?auto_527169 ?auto_527173 ) ) ( not ( = ?auto_527169 ?auto_527174 ) ) ( not ( = ?auto_527169 ?auto_527175 ) ) ( not ( = ?auto_527169 ?auto_527176 ) ) ( not ( = ?auto_527169 ?auto_527177 ) ) ( not ( = ?auto_527169 ?auto_527178 ) ) ( not ( = ?auto_527169 ?auto_527179 ) ) ( not ( = ?auto_527169 ?auto_527180 ) ) ( not ( = ?auto_527169 ?auto_527181 ) ) ( not ( = ?auto_527170 ?auto_527171 ) ) ( not ( = ?auto_527170 ?auto_527172 ) ) ( not ( = ?auto_527170 ?auto_527173 ) ) ( not ( = ?auto_527170 ?auto_527174 ) ) ( not ( = ?auto_527170 ?auto_527175 ) ) ( not ( = ?auto_527170 ?auto_527176 ) ) ( not ( = ?auto_527170 ?auto_527177 ) ) ( not ( = ?auto_527170 ?auto_527178 ) ) ( not ( = ?auto_527170 ?auto_527179 ) ) ( not ( = ?auto_527170 ?auto_527180 ) ) ( not ( = ?auto_527170 ?auto_527181 ) ) ( not ( = ?auto_527171 ?auto_527172 ) ) ( not ( = ?auto_527171 ?auto_527173 ) ) ( not ( = ?auto_527171 ?auto_527174 ) ) ( not ( = ?auto_527171 ?auto_527175 ) ) ( not ( = ?auto_527171 ?auto_527176 ) ) ( not ( = ?auto_527171 ?auto_527177 ) ) ( not ( = ?auto_527171 ?auto_527178 ) ) ( not ( = ?auto_527171 ?auto_527179 ) ) ( not ( = ?auto_527171 ?auto_527180 ) ) ( not ( = ?auto_527171 ?auto_527181 ) ) ( not ( = ?auto_527172 ?auto_527173 ) ) ( not ( = ?auto_527172 ?auto_527174 ) ) ( not ( = ?auto_527172 ?auto_527175 ) ) ( not ( = ?auto_527172 ?auto_527176 ) ) ( not ( = ?auto_527172 ?auto_527177 ) ) ( not ( = ?auto_527172 ?auto_527178 ) ) ( not ( = ?auto_527172 ?auto_527179 ) ) ( not ( = ?auto_527172 ?auto_527180 ) ) ( not ( = ?auto_527172 ?auto_527181 ) ) ( not ( = ?auto_527173 ?auto_527174 ) ) ( not ( = ?auto_527173 ?auto_527175 ) ) ( not ( = ?auto_527173 ?auto_527176 ) ) ( not ( = ?auto_527173 ?auto_527177 ) ) ( not ( = ?auto_527173 ?auto_527178 ) ) ( not ( = ?auto_527173 ?auto_527179 ) ) ( not ( = ?auto_527173 ?auto_527180 ) ) ( not ( = ?auto_527173 ?auto_527181 ) ) ( not ( = ?auto_527174 ?auto_527175 ) ) ( not ( = ?auto_527174 ?auto_527176 ) ) ( not ( = ?auto_527174 ?auto_527177 ) ) ( not ( = ?auto_527174 ?auto_527178 ) ) ( not ( = ?auto_527174 ?auto_527179 ) ) ( not ( = ?auto_527174 ?auto_527180 ) ) ( not ( = ?auto_527174 ?auto_527181 ) ) ( not ( = ?auto_527175 ?auto_527176 ) ) ( not ( = ?auto_527175 ?auto_527177 ) ) ( not ( = ?auto_527175 ?auto_527178 ) ) ( not ( = ?auto_527175 ?auto_527179 ) ) ( not ( = ?auto_527175 ?auto_527180 ) ) ( not ( = ?auto_527175 ?auto_527181 ) ) ( not ( = ?auto_527176 ?auto_527177 ) ) ( not ( = ?auto_527176 ?auto_527178 ) ) ( not ( = ?auto_527176 ?auto_527179 ) ) ( not ( = ?auto_527176 ?auto_527180 ) ) ( not ( = ?auto_527176 ?auto_527181 ) ) ( not ( = ?auto_527177 ?auto_527178 ) ) ( not ( = ?auto_527177 ?auto_527179 ) ) ( not ( = ?auto_527177 ?auto_527180 ) ) ( not ( = ?auto_527177 ?auto_527181 ) ) ( not ( = ?auto_527178 ?auto_527179 ) ) ( not ( = ?auto_527178 ?auto_527180 ) ) ( not ( = ?auto_527178 ?auto_527181 ) ) ( not ( = ?auto_527179 ?auto_527180 ) ) ( not ( = ?auto_527179 ?auto_527181 ) ) ( not ( = ?auto_527180 ?auto_527181 ) ) ( ON ?auto_527180 ?auto_527181 ) ( ON ?auto_527179 ?auto_527180 ) ( ON ?auto_527178 ?auto_527179 ) ( ON ?auto_527177 ?auto_527178 ) ( ON ?auto_527176 ?auto_527177 ) ( ON ?auto_527175 ?auto_527176 ) ( ON ?auto_527174 ?auto_527175 ) ( CLEAR ?auto_527172 ) ( ON ?auto_527173 ?auto_527174 ) ( CLEAR ?auto_527173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_527166 ?auto_527167 ?auto_527168 ?auto_527169 ?auto_527170 ?auto_527171 ?auto_527172 ?auto_527173 )
      ( MAKE-16PILE ?auto_527166 ?auto_527167 ?auto_527168 ?auto_527169 ?auto_527170 ?auto_527171 ?auto_527172 ?auto_527173 ?auto_527174 ?auto_527175 ?auto_527176 ?auto_527177 ?auto_527178 ?auto_527179 ?auto_527180 ?auto_527181 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527198 - BLOCK
      ?auto_527199 - BLOCK
      ?auto_527200 - BLOCK
      ?auto_527201 - BLOCK
      ?auto_527202 - BLOCK
      ?auto_527203 - BLOCK
      ?auto_527204 - BLOCK
      ?auto_527205 - BLOCK
      ?auto_527206 - BLOCK
      ?auto_527207 - BLOCK
      ?auto_527208 - BLOCK
      ?auto_527209 - BLOCK
      ?auto_527210 - BLOCK
      ?auto_527211 - BLOCK
      ?auto_527212 - BLOCK
      ?auto_527213 - BLOCK
    )
    :vars
    (
      ?auto_527214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527213 ?auto_527214 ) ( ON-TABLE ?auto_527198 ) ( ON ?auto_527199 ?auto_527198 ) ( ON ?auto_527200 ?auto_527199 ) ( ON ?auto_527201 ?auto_527200 ) ( ON ?auto_527202 ?auto_527201 ) ( ON ?auto_527203 ?auto_527202 ) ( not ( = ?auto_527198 ?auto_527199 ) ) ( not ( = ?auto_527198 ?auto_527200 ) ) ( not ( = ?auto_527198 ?auto_527201 ) ) ( not ( = ?auto_527198 ?auto_527202 ) ) ( not ( = ?auto_527198 ?auto_527203 ) ) ( not ( = ?auto_527198 ?auto_527204 ) ) ( not ( = ?auto_527198 ?auto_527205 ) ) ( not ( = ?auto_527198 ?auto_527206 ) ) ( not ( = ?auto_527198 ?auto_527207 ) ) ( not ( = ?auto_527198 ?auto_527208 ) ) ( not ( = ?auto_527198 ?auto_527209 ) ) ( not ( = ?auto_527198 ?auto_527210 ) ) ( not ( = ?auto_527198 ?auto_527211 ) ) ( not ( = ?auto_527198 ?auto_527212 ) ) ( not ( = ?auto_527198 ?auto_527213 ) ) ( not ( = ?auto_527198 ?auto_527214 ) ) ( not ( = ?auto_527199 ?auto_527200 ) ) ( not ( = ?auto_527199 ?auto_527201 ) ) ( not ( = ?auto_527199 ?auto_527202 ) ) ( not ( = ?auto_527199 ?auto_527203 ) ) ( not ( = ?auto_527199 ?auto_527204 ) ) ( not ( = ?auto_527199 ?auto_527205 ) ) ( not ( = ?auto_527199 ?auto_527206 ) ) ( not ( = ?auto_527199 ?auto_527207 ) ) ( not ( = ?auto_527199 ?auto_527208 ) ) ( not ( = ?auto_527199 ?auto_527209 ) ) ( not ( = ?auto_527199 ?auto_527210 ) ) ( not ( = ?auto_527199 ?auto_527211 ) ) ( not ( = ?auto_527199 ?auto_527212 ) ) ( not ( = ?auto_527199 ?auto_527213 ) ) ( not ( = ?auto_527199 ?auto_527214 ) ) ( not ( = ?auto_527200 ?auto_527201 ) ) ( not ( = ?auto_527200 ?auto_527202 ) ) ( not ( = ?auto_527200 ?auto_527203 ) ) ( not ( = ?auto_527200 ?auto_527204 ) ) ( not ( = ?auto_527200 ?auto_527205 ) ) ( not ( = ?auto_527200 ?auto_527206 ) ) ( not ( = ?auto_527200 ?auto_527207 ) ) ( not ( = ?auto_527200 ?auto_527208 ) ) ( not ( = ?auto_527200 ?auto_527209 ) ) ( not ( = ?auto_527200 ?auto_527210 ) ) ( not ( = ?auto_527200 ?auto_527211 ) ) ( not ( = ?auto_527200 ?auto_527212 ) ) ( not ( = ?auto_527200 ?auto_527213 ) ) ( not ( = ?auto_527200 ?auto_527214 ) ) ( not ( = ?auto_527201 ?auto_527202 ) ) ( not ( = ?auto_527201 ?auto_527203 ) ) ( not ( = ?auto_527201 ?auto_527204 ) ) ( not ( = ?auto_527201 ?auto_527205 ) ) ( not ( = ?auto_527201 ?auto_527206 ) ) ( not ( = ?auto_527201 ?auto_527207 ) ) ( not ( = ?auto_527201 ?auto_527208 ) ) ( not ( = ?auto_527201 ?auto_527209 ) ) ( not ( = ?auto_527201 ?auto_527210 ) ) ( not ( = ?auto_527201 ?auto_527211 ) ) ( not ( = ?auto_527201 ?auto_527212 ) ) ( not ( = ?auto_527201 ?auto_527213 ) ) ( not ( = ?auto_527201 ?auto_527214 ) ) ( not ( = ?auto_527202 ?auto_527203 ) ) ( not ( = ?auto_527202 ?auto_527204 ) ) ( not ( = ?auto_527202 ?auto_527205 ) ) ( not ( = ?auto_527202 ?auto_527206 ) ) ( not ( = ?auto_527202 ?auto_527207 ) ) ( not ( = ?auto_527202 ?auto_527208 ) ) ( not ( = ?auto_527202 ?auto_527209 ) ) ( not ( = ?auto_527202 ?auto_527210 ) ) ( not ( = ?auto_527202 ?auto_527211 ) ) ( not ( = ?auto_527202 ?auto_527212 ) ) ( not ( = ?auto_527202 ?auto_527213 ) ) ( not ( = ?auto_527202 ?auto_527214 ) ) ( not ( = ?auto_527203 ?auto_527204 ) ) ( not ( = ?auto_527203 ?auto_527205 ) ) ( not ( = ?auto_527203 ?auto_527206 ) ) ( not ( = ?auto_527203 ?auto_527207 ) ) ( not ( = ?auto_527203 ?auto_527208 ) ) ( not ( = ?auto_527203 ?auto_527209 ) ) ( not ( = ?auto_527203 ?auto_527210 ) ) ( not ( = ?auto_527203 ?auto_527211 ) ) ( not ( = ?auto_527203 ?auto_527212 ) ) ( not ( = ?auto_527203 ?auto_527213 ) ) ( not ( = ?auto_527203 ?auto_527214 ) ) ( not ( = ?auto_527204 ?auto_527205 ) ) ( not ( = ?auto_527204 ?auto_527206 ) ) ( not ( = ?auto_527204 ?auto_527207 ) ) ( not ( = ?auto_527204 ?auto_527208 ) ) ( not ( = ?auto_527204 ?auto_527209 ) ) ( not ( = ?auto_527204 ?auto_527210 ) ) ( not ( = ?auto_527204 ?auto_527211 ) ) ( not ( = ?auto_527204 ?auto_527212 ) ) ( not ( = ?auto_527204 ?auto_527213 ) ) ( not ( = ?auto_527204 ?auto_527214 ) ) ( not ( = ?auto_527205 ?auto_527206 ) ) ( not ( = ?auto_527205 ?auto_527207 ) ) ( not ( = ?auto_527205 ?auto_527208 ) ) ( not ( = ?auto_527205 ?auto_527209 ) ) ( not ( = ?auto_527205 ?auto_527210 ) ) ( not ( = ?auto_527205 ?auto_527211 ) ) ( not ( = ?auto_527205 ?auto_527212 ) ) ( not ( = ?auto_527205 ?auto_527213 ) ) ( not ( = ?auto_527205 ?auto_527214 ) ) ( not ( = ?auto_527206 ?auto_527207 ) ) ( not ( = ?auto_527206 ?auto_527208 ) ) ( not ( = ?auto_527206 ?auto_527209 ) ) ( not ( = ?auto_527206 ?auto_527210 ) ) ( not ( = ?auto_527206 ?auto_527211 ) ) ( not ( = ?auto_527206 ?auto_527212 ) ) ( not ( = ?auto_527206 ?auto_527213 ) ) ( not ( = ?auto_527206 ?auto_527214 ) ) ( not ( = ?auto_527207 ?auto_527208 ) ) ( not ( = ?auto_527207 ?auto_527209 ) ) ( not ( = ?auto_527207 ?auto_527210 ) ) ( not ( = ?auto_527207 ?auto_527211 ) ) ( not ( = ?auto_527207 ?auto_527212 ) ) ( not ( = ?auto_527207 ?auto_527213 ) ) ( not ( = ?auto_527207 ?auto_527214 ) ) ( not ( = ?auto_527208 ?auto_527209 ) ) ( not ( = ?auto_527208 ?auto_527210 ) ) ( not ( = ?auto_527208 ?auto_527211 ) ) ( not ( = ?auto_527208 ?auto_527212 ) ) ( not ( = ?auto_527208 ?auto_527213 ) ) ( not ( = ?auto_527208 ?auto_527214 ) ) ( not ( = ?auto_527209 ?auto_527210 ) ) ( not ( = ?auto_527209 ?auto_527211 ) ) ( not ( = ?auto_527209 ?auto_527212 ) ) ( not ( = ?auto_527209 ?auto_527213 ) ) ( not ( = ?auto_527209 ?auto_527214 ) ) ( not ( = ?auto_527210 ?auto_527211 ) ) ( not ( = ?auto_527210 ?auto_527212 ) ) ( not ( = ?auto_527210 ?auto_527213 ) ) ( not ( = ?auto_527210 ?auto_527214 ) ) ( not ( = ?auto_527211 ?auto_527212 ) ) ( not ( = ?auto_527211 ?auto_527213 ) ) ( not ( = ?auto_527211 ?auto_527214 ) ) ( not ( = ?auto_527212 ?auto_527213 ) ) ( not ( = ?auto_527212 ?auto_527214 ) ) ( not ( = ?auto_527213 ?auto_527214 ) ) ( ON ?auto_527212 ?auto_527213 ) ( ON ?auto_527211 ?auto_527212 ) ( ON ?auto_527210 ?auto_527211 ) ( ON ?auto_527209 ?auto_527210 ) ( ON ?auto_527208 ?auto_527209 ) ( ON ?auto_527207 ?auto_527208 ) ( ON ?auto_527206 ?auto_527207 ) ( ON ?auto_527205 ?auto_527206 ) ( CLEAR ?auto_527203 ) ( ON ?auto_527204 ?auto_527205 ) ( CLEAR ?auto_527204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_527198 ?auto_527199 ?auto_527200 ?auto_527201 ?auto_527202 ?auto_527203 ?auto_527204 )
      ( MAKE-16PILE ?auto_527198 ?auto_527199 ?auto_527200 ?auto_527201 ?auto_527202 ?auto_527203 ?auto_527204 ?auto_527205 ?auto_527206 ?auto_527207 ?auto_527208 ?auto_527209 ?auto_527210 ?auto_527211 ?auto_527212 ?auto_527213 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527231 - BLOCK
      ?auto_527232 - BLOCK
      ?auto_527233 - BLOCK
      ?auto_527234 - BLOCK
      ?auto_527235 - BLOCK
      ?auto_527236 - BLOCK
      ?auto_527237 - BLOCK
      ?auto_527238 - BLOCK
      ?auto_527239 - BLOCK
      ?auto_527240 - BLOCK
      ?auto_527241 - BLOCK
      ?auto_527242 - BLOCK
      ?auto_527243 - BLOCK
      ?auto_527244 - BLOCK
      ?auto_527245 - BLOCK
      ?auto_527246 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_527246 ) ( ON-TABLE ?auto_527231 ) ( ON ?auto_527232 ?auto_527231 ) ( ON ?auto_527233 ?auto_527232 ) ( ON ?auto_527234 ?auto_527233 ) ( ON ?auto_527235 ?auto_527234 ) ( ON ?auto_527236 ?auto_527235 ) ( not ( = ?auto_527231 ?auto_527232 ) ) ( not ( = ?auto_527231 ?auto_527233 ) ) ( not ( = ?auto_527231 ?auto_527234 ) ) ( not ( = ?auto_527231 ?auto_527235 ) ) ( not ( = ?auto_527231 ?auto_527236 ) ) ( not ( = ?auto_527231 ?auto_527237 ) ) ( not ( = ?auto_527231 ?auto_527238 ) ) ( not ( = ?auto_527231 ?auto_527239 ) ) ( not ( = ?auto_527231 ?auto_527240 ) ) ( not ( = ?auto_527231 ?auto_527241 ) ) ( not ( = ?auto_527231 ?auto_527242 ) ) ( not ( = ?auto_527231 ?auto_527243 ) ) ( not ( = ?auto_527231 ?auto_527244 ) ) ( not ( = ?auto_527231 ?auto_527245 ) ) ( not ( = ?auto_527231 ?auto_527246 ) ) ( not ( = ?auto_527232 ?auto_527233 ) ) ( not ( = ?auto_527232 ?auto_527234 ) ) ( not ( = ?auto_527232 ?auto_527235 ) ) ( not ( = ?auto_527232 ?auto_527236 ) ) ( not ( = ?auto_527232 ?auto_527237 ) ) ( not ( = ?auto_527232 ?auto_527238 ) ) ( not ( = ?auto_527232 ?auto_527239 ) ) ( not ( = ?auto_527232 ?auto_527240 ) ) ( not ( = ?auto_527232 ?auto_527241 ) ) ( not ( = ?auto_527232 ?auto_527242 ) ) ( not ( = ?auto_527232 ?auto_527243 ) ) ( not ( = ?auto_527232 ?auto_527244 ) ) ( not ( = ?auto_527232 ?auto_527245 ) ) ( not ( = ?auto_527232 ?auto_527246 ) ) ( not ( = ?auto_527233 ?auto_527234 ) ) ( not ( = ?auto_527233 ?auto_527235 ) ) ( not ( = ?auto_527233 ?auto_527236 ) ) ( not ( = ?auto_527233 ?auto_527237 ) ) ( not ( = ?auto_527233 ?auto_527238 ) ) ( not ( = ?auto_527233 ?auto_527239 ) ) ( not ( = ?auto_527233 ?auto_527240 ) ) ( not ( = ?auto_527233 ?auto_527241 ) ) ( not ( = ?auto_527233 ?auto_527242 ) ) ( not ( = ?auto_527233 ?auto_527243 ) ) ( not ( = ?auto_527233 ?auto_527244 ) ) ( not ( = ?auto_527233 ?auto_527245 ) ) ( not ( = ?auto_527233 ?auto_527246 ) ) ( not ( = ?auto_527234 ?auto_527235 ) ) ( not ( = ?auto_527234 ?auto_527236 ) ) ( not ( = ?auto_527234 ?auto_527237 ) ) ( not ( = ?auto_527234 ?auto_527238 ) ) ( not ( = ?auto_527234 ?auto_527239 ) ) ( not ( = ?auto_527234 ?auto_527240 ) ) ( not ( = ?auto_527234 ?auto_527241 ) ) ( not ( = ?auto_527234 ?auto_527242 ) ) ( not ( = ?auto_527234 ?auto_527243 ) ) ( not ( = ?auto_527234 ?auto_527244 ) ) ( not ( = ?auto_527234 ?auto_527245 ) ) ( not ( = ?auto_527234 ?auto_527246 ) ) ( not ( = ?auto_527235 ?auto_527236 ) ) ( not ( = ?auto_527235 ?auto_527237 ) ) ( not ( = ?auto_527235 ?auto_527238 ) ) ( not ( = ?auto_527235 ?auto_527239 ) ) ( not ( = ?auto_527235 ?auto_527240 ) ) ( not ( = ?auto_527235 ?auto_527241 ) ) ( not ( = ?auto_527235 ?auto_527242 ) ) ( not ( = ?auto_527235 ?auto_527243 ) ) ( not ( = ?auto_527235 ?auto_527244 ) ) ( not ( = ?auto_527235 ?auto_527245 ) ) ( not ( = ?auto_527235 ?auto_527246 ) ) ( not ( = ?auto_527236 ?auto_527237 ) ) ( not ( = ?auto_527236 ?auto_527238 ) ) ( not ( = ?auto_527236 ?auto_527239 ) ) ( not ( = ?auto_527236 ?auto_527240 ) ) ( not ( = ?auto_527236 ?auto_527241 ) ) ( not ( = ?auto_527236 ?auto_527242 ) ) ( not ( = ?auto_527236 ?auto_527243 ) ) ( not ( = ?auto_527236 ?auto_527244 ) ) ( not ( = ?auto_527236 ?auto_527245 ) ) ( not ( = ?auto_527236 ?auto_527246 ) ) ( not ( = ?auto_527237 ?auto_527238 ) ) ( not ( = ?auto_527237 ?auto_527239 ) ) ( not ( = ?auto_527237 ?auto_527240 ) ) ( not ( = ?auto_527237 ?auto_527241 ) ) ( not ( = ?auto_527237 ?auto_527242 ) ) ( not ( = ?auto_527237 ?auto_527243 ) ) ( not ( = ?auto_527237 ?auto_527244 ) ) ( not ( = ?auto_527237 ?auto_527245 ) ) ( not ( = ?auto_527237 ?auto_527246 ) ) ( not ( = ?auto_527238 ?auto_527239 ) ) ( not ( = ?auto_527238 ?auto_527240 ) ) ( not ( = ?auto_527238 ?auto_527241 ) ) ( not ( = ?auto_527238 ?auto_527242 ) ) ( not ( = ?auto_527238 ?auto_527243 ) ) ( not ( = ?auto_527238 ?auto_527244 ) ) ( not ( = ?auto_527238 ?auto_527245 ) ) ( not ( = ?auto_527238 ?auto_527246 ) ) ( not ( = ?auto_527239 ?auto_527240 ) ) ( not ( = ?auto_527239 ?auto_527241 ) ) ( not ( = ?auto_527239 ?auto_527242 ) ) ( not ( = ?auto_527239 ?auto_527243 ) ) ( not ( = ?auto_527239 ?auto_527244 ) ) ( not ( = ?auto_527239 ?auto_527245 ) ) ( not ( = ?auto_527239 ?auto_527246 ) ) ( not ( = ?auto_527240 ?auto_527241 ) ) ( not ( = ?auto_527240 ?auto_527242 ) ) ( not ( = ?auto_527240 ?auto_527243 ) ) ( not ( = ?auto_527240 ?auto_527244 ) ) ( not ( = ?auto_527240 ?auto_527245 ) ) ( not ( = ?auto_527240 ?auto_527246 ) ) ( not ( = ?auto_527241 ?auto_527242 ) ) ( not ( = ?auto_527241 ?auto_527243 ) ) ( not ( = ?auto_527241 ?auto_527244 ) ) ( not ( = ?auto_527241 ?auto_527245 ) ) ( not ( = ?auto_527241 ?auto_527246 ) ) ( not ( = ?auto_527242 ?auto_527243 ) ) ( not ( = ?auto_527242 ?auto_527244 ) ) ( not ( = ?auto_527242 ?auto_527245 ) ) ( not ( = ?auto_527242 ?auto_527246 ) ) ( not ( = ?auto_527243 ?auto_527244 ) ) ( not ( = ?auto_527243 ?auto_527245 ) ) ( not ( = ?auto_527243 ?auto_527246 ) ) ( not ( = ?auto_527244 ?auto_527245 ) ) ( not ( = ?auto_527244 ?auto_527246 ) ) ( not ( = ?auto_527245 ?auto_527246 ) ) ( ON ?auto_527245 ?auto_527246 ) ( ON ?auto_527244 ?auto_527245 ) ( ON ?auto_527243 ?auto_527244 ) ( ON ?auto_527242 ?auto_527243 ) ( ON ?auto_527241 ?auto_527242 ) ( ON ?auto_527240 ?auto_527241 ) ( ON ?auto_527239 ?auto_527240 ) ( ON ?auto_527238 ?auto_527239 ) ( CLEAR ?auto_527236 ) ( ON ?auto_527237 ?auto_527238 ) ( CLEAR ?auto_527237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_527231 ?auto_527232 ?auto_527233 ?auto_527234 ?auto_527235 ?auto_527236 ?auto_527237 )
      ( MAKE-16PILE ?auto_527231 ?auto_527232 ?auto_527233 ?auto_527234 ?auto_527235 ?auto_527236 ?auto_527237 ?auto_527238 ?auto_527239 ?auto_527240 ?auto_527241 ?auto_527242 ?auto_527243 ?auto_527244 ?auto_527245 ?auto_527246 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527263 - BLOCK
      ?auto_527264 - BLOCK
      ?auto_527265 - BLOCK
      ?auto_527266 - BLOCK
      ?auto_527267 - BLOCK
      ?auto_527268 - BLOCK
      ?auto_527269 - BLOCK
      ?auto_527270 - BLOCK
      ?auto_527271 - BLOCK
      ?auto_527272 - BLOCK
      ?auto_527273 - BLOCK
      ?auto_527274 - BLOCK
      ?auto_527275 - BLOCK
      ?auto_527276 - BLOCK
      ?auto_527277 - BLOCK
      ?auto_527278 - BLOCK
    )
    :vars
    (
      ?auto_527279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527278 ?auto_527279 ) ( ON-TABLE ?auto_527263 ) ( ON ?auto_527264 ?auto_527263 ) ( ON ?auto_527265 ?auto_527264 ) ( ON ?auto_527266 ?auto_527265 ) ( ON ?auto_527267 ?auto_527266 ) ( not ( = ?auto_527263 ?auto_527264 ) ) ( not ( = ?auto_527263 ?auto_527265 ) ) ( not ( = ?auto_527263 ?auto_527266 ) ) ( not ( = ?auto_527263 ?auto_527267 ) ) ( not ( = ?auto_527263 ?auto_527268 ) ) ( not ( = ?auto_527263 ?auto_527269 ) ) ( not ( = ?auto_527263 ?auto_527270 ) ) ( not ( = ?auto_527263 ?auto_527271 ) ) ( not ( = ?auto_527263 ?auto_527272 ) ) ( not ( = ?auto_527263 ?auto_527273 ) ) ( not ( = ?auto_527263 ?auto_527274 ) ) ( not ( = ?auto_527263 ?auto_527275 ) ) ( not ( = ?auto_527263 ?auto_527276 ) ) ( not ( = ?auto_527263 ?auto_527277 ) ) ( not ( = ?auto_527263 ?auto_527278 ) ) ( not ( = ?auto_527263 ?auto_527279 ) ) ( not ( = ?auto_527264 ?auto_527265 ) ) ( not ( = ?auto_527264 ?auto_527266 ) ) ( not ( = ?auto_527264 ?auto_527267 ) ) ( not ( = ?auto_527264 ?auto_527268 ) ) ( not ( = ?auto_527264 ?auto_527269 ) ) ( not ( = ?auto_527264 ?auto_527270 ) ) ( not ( = ?auto_527264 ?auto_527271 ) ) ( not ( = ?auto_527264 ?auto_527272 ) ) ( not ( = ?auto_527264 ?auto_527273 ) ) ( not ( = ?auto_527264 ?auto_527274 ) ) ( not ( = ?auto_527264 ?auto_527275 ) ) ( not ( = ?auto_527264 ?auto_527276 ) ) ( not ( = ?auto_527264 ?auto_527277 ) ) ( not ( = ?auto_527264 ?auto_527278 ) ) ( not ( = ?auto_527264 ?auto_527279 ) ) ( not ( = ?auto_527265 ?auto_527266 ) ) ( not ( = ?auto_527265 ?auto_527267 ) ) ( not ( = ?auto_527265 ?auto_527268 ) ) ( not ( = ?auto_527265 ?auto_527269 ) ) ( not ( = ?auto_527265 ?auto_527270 ) ) ( not ( = ?auto_527265 ?auto_527271 ) ) ( not ( = ?auto_527265 ?auto_527272 ) ) ( not ( = ?auto_527265 ?auto_527273 ) ) ( not ( = ?auto_527265 ?auto_527274 ) ) ( not ( = ?auto_527265 ?auto_527275 ) ) ( not ( = ?auto_527265 ?auto_527276 ) ) ( not ( = ?auto_527265 ?auto_527277 ) ) ( not ( = ?auto_527265 ?auto_527278 ) ) ( not ( = ?auto_527265 ?auto_527279 ) ) ( not ( = ?auto_527266 ?auto_527267 ) ) ( not ( = ?auto_527266 ?auto_527268 ) ) ( not ( = ?auto_527266 ?auto_527269 ) ) ( not ( = ?auto_527266 ?auto_527270 ) ) ( not ( = ?auto_527266 ?auto_527271 ) ) ( not ( = ?auto_527266 ?auto_527272 ) ) ( not ( = ?auto_527266 ?auto_527273 ) ) ( not ( = ?auto_527266 ?auto_527274 ) ) ( not ( = ?auto_527266 ?auto_527275 ) ) ( not ( = ?auto_527266 ?auto_527276 ) ) ( not ( = ?auto_527266 ?auto_527277 ) ) ( not ( = ?auto_527266 ?auto_527278 ) ) ( not ( = ?auto_527266 ?auto_527279 ) ) ( not ( = ?auto_527267 ?auto_527268 ) ) ( not ( = ?auto_527267 ?auto_527269 ) ) ( not ( = ?auto_527267 ?auto_527270 ) ) ( not ( = ?auto_527267 ?auto_527271 ) ) ( not ( = ?auto_527267 ?auto_527272 ) ) ( not ( = ?auto_527267 ?auto_527273 ) ) ( not ( = ?auto_527267 ?auto_527274 ) ) ( not ( = ?auto_527267 ?auto_527275 ) ) ( not ( = ?auto_527267 ?auto_527276 ) ) ( not ( = ?auto_527267 ?auto_527277 ) ) ( not ( = ?auto_527267 ?auto_527278 ) ) ( not ( = ?auto_527267 ?auto_527279 ) ) ( not ( = ?auto_527268 ?auto_527269 ) ) ( not ( = ?auto_527268 ?auto_527270 ) ) ( not ( = ?auto_527268 ?auto_527271 ) ) ( not ( = ?auto_527268 ?auto_527272 ) ) ( not ( = ?auto_527268 ?auto_527273 ) ) ( not ( = ?auto_527268 ?auto_527274 ) ) ( not ( = ?auto_527268 ?auto_527275 ) ) ( not ( = ?auto_527268 ?auto_527276 ) ) ( not ( = ?auto_527268 ?auto_527277 ) ) ( not ( = ?auto_527268 ?auto_527278 ) ) ( not ( = ?auto_527268 ?auto_527279 ) ) ( not ( = ?auto_527269 ?auto_527270 ) ) ( not ( = ?auto_527269 ?auto_527271 ) ) ( not ( = ?auto_527269 ?auto_527272 ) ) ( not ( = ?auto_527269 ?auto_527273 ) ) ( not ( = ?auto_527269 ?auto_527274 ) ) ( not ( = ?auto_527269 ?auto_527275 ) ) ( not ( = ?auto_527269 ?auto_527276 ) ) ( not ( = ?auto_527269 ?auto_527277 ) ) ( not ( = ?auto_527269 ?auto_527278 ) ) ( not ( = ?auto_527269 ?auto_527279 ) ) ( not ( = ?auto_527270 ?auto_527271 ) ) ( not ( = ?auto_527270 ?auto_527272 ) ) ( not ( = ?auto_527270 ?auto_527273 ) ) ( not ( = ?auto_527270 ?auto_527274 ) ) ( not ( = ?auto_527270 ?auto_527275 ) ) ( not ( = ?auto_527270 ?auto_527276 ) ) ( not ( = ?auto_527270 ?auto_527277 ) ) ( not ( = ?auto_527270 ?auto_527278 ) ) ( not ( = ?auto_527270 ?auto_527279 ) ) ( not ( = ?auto_527271 ?auto_527272 ) ) ( not ( = ?auto_527271 ?auto_527273 ) ) ( not ( = ?auto_527271 ?auto_527274 ) ) ( not ( = ?auto_527271 ?auto_527275 ) ) ( not ( = ?auto_527271 ?auto_527276 ) ) ( not ( = ?auto_527271 ?auto_527277 ) ) ( not ( = ?auto_527271 ?auto_527278 ) ) ( not ( = ?auto_527271 ?auto_527279 ) ) ( not ( = ?auto_527272 ?auto_527273 ) ) ( not ( = ?auto_527272 ?auto_527274 ) ) ( not ( = ?auto_527272 ?auto_527275 ) ) ( not ( = ?auto_527272 ?auto_527276 ) ) ( not ( = ?auto_527272 ?auto_527277 ) ) ( not ( = ?auto_527272 ?auto_527278 ) ) ( not ( = ?auto_527272 ?auto_527279 ) ) ( not ( = ?auto_527273 ?auto_527274 ) ) ( not ( = ?auto_527273 ?auto_527275 ) ) ( not ( = ?auto_527273 ?auto_527276 ) ) ( not ( = ?auto_527273 ?auto_527277 ) ) ( not ( = ?auto_527273 ?auto_527278 ) ) ( not ( = ?auto_527273 ?auto_527279 ) ) ( not ( = ?auto_527274 ?auto_527275 ) ) ( not ( = ?auto_527274 ?auto_527276 ) ) ( not ( = ?auto_527274 ?auto_527277 ) ) ( not ( = ?auto_527274 ?auto_527278 ) ) ( not ( = ?auto_527274 ?auto_527279 ) ) ( not ( = ?auto_527275 ?auto_527276 ) ) ( not ( = ?auto_527275 ?auto_527277 ) ) ( not ( = ?auto_527275 ?auto_527278 ) ) ( not ( = ?auto_527275 ?auto_527279 ) ) ( not ( = ?auto_527276 ?auto_527277 ) ) ( not ( = ?auto_527276 ?auto_527278 ) ) ( not ( = ?auto_527276 ?auto_527279 ) ) ( not ( = ?auto_527277 ?auto_527278 ) ) ( not ( = ?auto_527277 ?auto_527279 ) ) ( not ( = ?auto_527278 ?auto_527279 ) ) ( ON ?auto_527277 ?auto_527278 ) ( ON ?auto_527276 ?auto_527277 ) ( ON ?auto_527275 ?auto_527276 ) ( ON ?auto_527274 ?auto_527275 ) ( ON ?auto_527273 ?auto_527274 ) ( ON ?auto_527272 ?auto_527273 ) ( ON ?auto_527271 ?auto_527272 ) ( ON ?auto_527270 ?auto_527271 ) ( ON ?auto_527269 ?auto_527270 ) ( CLEAR ?auto_527267 ) ( ON ?auto_527268 ?auto_527269 ) ( CLEAR ?auto_527268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_527263 ?auto_527264 ?auto_527265 ?auto_527266 ?auto_527267 ?auto_527268 )
      ( MAKE-16PILE ?auto_527263 ?auto_527264 ?auto_527265 ?auto_527266 ?auto_527267 ?auto_527268 ?auto_527269 ?auto_527270 ?auto_527271 ?auto_527272 ?auto_527273 ?auto_527274 ?auto_527275 ?auto_527276 ?auto_527277 ?auto_527278 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527296 - BLOCK
      ?auto_527297 - BLOCK
      ?auto_527298 - BLOCK
      ?auto_527299 - BLOCK
      ?auto_527300 - BLOCK
      ?auto_527301 - BLOCK
      ?auto_527302 - BLOCK
      ?auto_527303 - BLOCK
      ?auto_527304 - BLOCK
      ?auto_527305 - BLOCK
      ?auto_527306 - BLOCK
      ?auto_527307 - BLOCK
      ?auto_527308 - BLOCK
      ?auto_527309 - BLOCK
      ?auto_527310 - BLOCK
      ?auto_527311 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_527311 ) ( ON-TABLE ?auto_527296 ) ( ON ?auto_527297 ?auto_527296 ) ( ON ?auto_527298 ?auto_527297 ) ( ON ?auto_527299 ?auto_527298 ) ( ON ?auto_527300 ?auto_527299 ) ( not ( = ?auto_527296 ?auto_527297 ) ) ( not ( = ?auto_527296 ?auto_527298 ) ) ( not ( = ?auto_527296 ?auto_527299 ) ) ( not ( = ?auto_527296 ?auto_527300 ) ) ( not ( = ?auto_527296 ?auto_527301 ) ) ( not ( = ?auto_527296 ?auto_527302 ) ) ( not ( = ?auto_527296 ?auto_527303 ) ) ( not ( = ?auto_527296 ?auto_527304 ) ) ( not ( = ?auto_527296 ?auto_527305 ) ) ( not ( = ?auto_527296 ?auto_527306 ) ) ( not ( = ?auto_527296 ?auto_527307 ) ) ( not ( = ?auto_527296 ?auto_527308 ) ) ( not ( = ?auto_527296 ?auto_527309 ) ) ( not ( = ?auto_527296 ?auto_527310 ) ) ( not ( = ?auto_527296 ?auto_527311 ) ) ( not ( = ?auto_527297 ?auto_527298 ) ) ( not ( = ?auto_527297 ?auto_527299 ) ) ( not ( = ?auto_527297 ?auto_527300 ) ) ( not ( = ?auto_527297 ?auto_527301 ) ) ( not ( = ?auto_527297 ?auto_527302 ) ) ( not ( = ?auto_527297 ?auto_527303 ) ) ( not ( = ?auto_527297 ?auto_527304 ) ) ( not ( = ?auto_527297 ?auto_527305 ) ) ( not ( = ?auto_527297 ?auto_527306 ) ) ( not ( = ?auto_527297 ?auto_527307 ) ) ( not ( = ?auto_527297 ?auto_527308 ) ) ( not ( = ?auto_527297 ?auto_527309 ) ) ( not ( = ?auto_527297 ?auto_527310 ) ) ( not ( = ?auto_527297 ?auto_527311 ) ) ( not ( = ?auto_527298 ?auto_527299 ) ) ( not ( = ?auto_527298 ?auto_527300 ) ) ( not ( = ?auto_527298 ?auto_527301 ) ) ( not ( = ?auto_527298 ?auto_527302 ) ) ( not ( = ?auto_527298 ?auto_527303 ) ) ( not ( = ?auto_527298 ?auto_527304 ) ) ( not ( = ?auto_527298 ?auto_527305 ) ) ( not ( = ?auto_527298 ?auto_527306 ) ) ( not ( = ?auto_527298 ?auto_527307 ) ) ( not ( = ?auto_527298 ?auto_527308 ) ) ( not ( = ?auto_527298 ?auto_527309 ) ) ( not ( = ?auto_527298 ?auto_527310 ) ) ( not ( = ?auto_527298 ?auto_527311 ) ) ( not ( = ?auto_527299 ?auto_527300 ) ) ( not ( = ?auto_527299 ?auto_527301 ) ) ( not ( = ?auto_527299 ?auto_527302 ) ) ( not ( = ?auto_527299 ?auto_527303 ) ) ( not ( = ?auto_527299 ?auto_527304 ) ) ( not ( = ?auto_527299 ?auto_527305 ) ) ( not ( = ?auto_527299 ?auto_527306 ) ) ( not ( = ?auto_527299 ?auto_527307 ) ) ( not ( = ?auto_527299 ?auto_527308 ) ) ( not ( = ?auto_527299 ?auto_527309 ) ) ( not ( = ?auto_527299 ?auto_527310 ) ) ( not ( = ?auto_527299 ?auto_527311 ) ) ( not ( = ?auto_527300 ?auto_527301 ) ) ( not ( = ?auto_527300 ?auto_527302 ) ) ( not ( = ?auto_527300 ?auto_527303 ) ) ( not ( = ?auto_527300 ?auto_527304 ) ) ( not ( = ?auto_527300 ?auto_527305 ) ) ( not ( = ?auto_527300 ?auto_527306 ) ) ( not ( = ?auto_527300 ?auto_527307 ) ) ( not ( = ?auto_527300 ?auto_527308 ) ) ( not ( = ?auto_527300 ?auto_527309 ) ) ( not ( = ?auto_527300 ?auto_527310 ) ) ( not ( = ?auto_527300 ?auto_527311 ) ) ( not ( = ?auto_527301 ?auto_527302 ) ) ( not ( = ?auto_527301 ?auto_527303 ) ) ( not ( = ?auto_527301 ?auto_527304 ) ) ( not ( = ?auto_527301 ?auto_527305 ) ) ( not ( = ?auto_527301 ?auto_527306 ) ) ( not ( = ?auto_527301 ?auto_527307 ) ) ( not ( = ?auto_527301 ?auto_527308 ) ) ( not ( = ?auto_527301 ?auto_527309 ) ) ( not ( = ?auto_527301 ?auto_527310 ) ) ( not ( = ?auto_527301 ?auto_527311 ) ) ( not ( = ?auto_527302 ?auto_527303 ) ) ( not ( = ?auto_527302 ?auto_527304 ) ) ( not ( = ?auto_527302 ?auto_527305 ) ) ( not ( = ?auto_527302 ?auto_527306 ) ) ( not ( = ?auto_527302 ?auto_527307 ) ) ( not ( = ?auto_527302 ?auto_527308 ) ) ( not ( = ?auto_527302 ?auto_527309 ) ) ( not ( = ?auto_527302 ?auto_527310 ) ) ( not ( = ?auto_527302 ?auto_527311 ) ) ( not ( = ?auto_527303 ?auto_527304 ) ) ( not ( = ?auto_527303 ?auto_527305 ) ) ( not ( = ?auto_527303 ?auto_527306 ) ) ( not ( = ?auto_527303 ?auto_527307 ) ) ( not ( = ?auto_527303 ?auto_527308 ) ) ( not ( = ?auto_527303 ?auto_527309 ) ) ( not ( = ?auto_527303 ?auto_527310 ) ) ( not ( = ?auto_527303 ?auto_527311 ) ) ( not ( = ?auto_527304 ?auto_527305 ) ) ( not ( = ?auto_527304 ?auto_527306 ) ) ( not ( = ?auto_527304 ?auto_527307 ) ) ( not ( = ?auto_527304 ?auto_527308 ) ) ( not ( = ?auto_527304 ?auto_527309 ) ) ( not ( = ?auto_527304 ?auto_527310 ) ) ( not ( = ?auto_527304 ?auto_527311 ) ) ( not ( = ?auto_527305 ?auto_527306 ) ) ( not ( = ?auto_527305 ?auto_527307 ) ) ( not ( = ?auto_527305 ?auto_527308 ) ) ( not ( = ?auto_527305 ?auto_527309 ) ) ( not ( = ?auto_527305 ?auto_527310 ) ) ( not ( = ?auto_527305 ?auto_527311 ) ) ( not ( = ?auto_527306 ?auto_527307 ) ) ( not ( = ?auto_527306 ?auto_527308 ) ) ( not ( = ?auto_527306 ?auto_527309 ) ) ( not ( = ?auto_527306 ?auto_527310 ) ) ( not ( = ?auto_527306 ?auto_527311 ) ) ( not ( = ?auto_527307 ?auto_527308 ) ) ( not ( = ?auto_527307 ?auto_527309 ) ) ( not ( = ?auto_527307 ?auto_527310 ) ) ( not ( = ?auto_527307 ?auto_527311 ) ) ( not ( = ?auto_527308 ?auto_527309 ) ) ( not ( = ?auto_527308 ?auto_527310 ) ) ( not ( = ?auto_527308 ?auto_527311 ) ) ( not ( = ?auto_527309 ?auto_527310 ) ) ( not ( = ?auto_527309 ?auto_527311 ) ) ( not ( = ?auto_527310 ?auto_527311 ) ) ( ON ?auto_527310 ?auto_527311 ) ( ON ?auto_527309 ?auto_527310 ) ( ON ?auto_527308 ?auto_527309 ) ( ON ?auto_527307 ?auto_527308 ) ( ON ?auto_527306 ?auto_527307 ) ( ON ?auto_527305 ?auto_527306 ) ( ON ?auto_527304 ?auto_527305 ) ( ON ?auto_527303 ?auto_527304 ) ( ON ?auto_527302 ?auto_527303 ) ( CLEAR ?auto_527300 ) ( ON ?auto_527301 ?auto_527302 ) ( CLEAR ?auto_527301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_527296 ?auto_527297 ?auto_527298 ?auto_527299 ?auto_527300 ?auto_527301 )
      ( MAKE-16PILE ?auto_527296 ?auto_527297 ?auto_527298 ?auto_527299 ?auto_527300 ?auto_527301 ?auto_527302 ?auto_527303 ?auto_527304 ?auto_527305 ?auto_527306 ?auto_527307 ?auto_527308 ?auto_527309 ?auto_527310 ?auto_527311 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527328 - BLOCK
      ?auto_527329 - BLOCK
      ?auto_527330 - BLOCK
      ?auto_527331 - BLOCK
      ?auto_527332 - BLOCK
      ?auto_527333 - BLOCK
      ?auto_527334 - BLOCK
      ?auto_527335 - BLOCK
      ?auto_527336 - BLOCK
      ?auto_527337 - BLOCK
      ?auto_527338 - BLOCK
      ?auto_527339 - BLOCK
      ?auto_527340 - BLOCK
      ?auto_527341 - BLOCK
      ?auto_527342 - BLOCK
      ?auto_527343 - BLOCK
    )
    :vars
    (
      ?auto_527344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527343 ?auto_527344 ) ( ON-TABLE ?auto_527328 ) ( ON ?auto_527329 ?auto_527328 ) ( ON ?auto_527330 ?auto_527329 ) ( ON ?auto_527331 ?auto_527330 ) ( not ( = ?auto_527328 ?auto_527329 ) ) ( not ( = ?auto_527328 ?auto_527330 ) ) ( not ( = ?auto_527328 ?auto_527331 ) ) ( not ( = ?auto_527328 ?auto_527332 ) ) ( not ( = ?auto_527328 ?auto_527333 ) ) ( not ( = ?auto_527328 ?auto_527334 ) ) ( not ( = ?auto_527328 ?auto_527335 ) ) ( not ( = ?auto_527328 ?auto_527336 ) ) ( not ( = ?auto_527328 ?auto_527337 ) ) ( not ( = ?auto_527328 ?auto_527338 ) ) ( not ( = ?auto_527328 ?auto_527339 ) ) ( not ( = ?auto_527328 ?auto_527340 ) ) ( not ( = ?auto_527328 ?auto_527341 ) ) ( not ( = ?auto_527328 ?auto_527342 ) ) ( not ( = ?auto_527328 ?auto_527343 ) ) ( not ( = ?auto_527328 ?auto_527344 ) ) ( not ( = ?auto_527329 ?auto_527330 ) ) ( not ( = ?auto_527329 ?auto_527331 ) ) ( not ( = ?auto_527329 ?auto_527332 ) ) ( not ( = ?auto_527329 ?auto_527333 ) ) ( not ( = ?auto_527329 ?auto_527334 ) ) ( not ( = ?auto_527329 ?auto_527335 ) ) ( not ( = ?auto_527329 ?auto_527336 ) ) ( not ( = ?auto_527329 ?auto_527337 ) ) ( not ( = ?auto_527329 ?auto_527338 ) ) ( not ( = ?auto_527329 ?auto_527339 ) ) ( not ( = ?auto_527329 ?auto_527340 ) ) ( not ( = ?auto_527329 ?auto_527341 ) ) ( not ( = ?auto_527329 ?auto_527342 ) ) ( not ( = ?auto_527329 ?auto_527343 ) ) ( not ( = ?auto_527329 ?auto_527344 ) ) ( not ( = ?auto_527330 ?auto_527331 ) ) ( not ( = ?auto_527330 ?auto_527332 ) ) ( not ( = ?auto_527330 ?auto_527333 ) ) ( not ( = ?auto_527330 ?auto_527334 ) ) ( not ( = ?auto_527330 ?auto_527335 ) ) ( not ( = ?auto_527330 ?auto_527336 ) ) ( not ( = ?auto_527330 ?auto_527337 ) ) ( not ( = ?auto_527330 ?auto_527338 ) ) ( not ( = ?auto_527330 ?auto_527339 ) ) ( not ( = ?auto_527330 ?auto_527340 ) ) ( not ( = ?auto_527330 ?auto_527341 ) ) ( not ( = ?auto_527330 ?auto_527342 ) ) ( not ( = ?auto_527330 ?auto_527343 ) ) ( not ( = ?auto_527330 ?auto_527344 ) ) ( not ( = ?auto_527331 ?auto_527332 ) ) ( not ( = ?auto_527331 ?auto_527333 ) ) ( not ( = ?auto_527331 ?auto_527334 ) ) ( not ( = ?auto_527331 ?auto_527335 ) ) ( not ( = ?auto_527331 ?auto_527336 ) ) ( not ( = ?auto_527331 ?auto_527337 ) ) ( not ( = ?auto_527331 ?auto_527338 ) ) ( not ( = ?auto_527331 ?auto_527339 ) ) ( not ( = ?auto_527331 ?auto_527340 ) ) ( not ( = ?auto_527331 ?auto_527341 ) ) ( not ( = ?auto_527331 ?auto_527342 ) ) ( not ( = ?auto_527331 ?auto_527343 ) ) ( not ( = ?auto_527331 ?auto_527344 ) ) ( not ( = ?auto_527332 ?auto_527333 ) ) ( not ( = ?auto_527332 ?auto_527334 ) ) ( not ( = ?auto_527332 ?auto_527335 ) ) ( not ( = ?auto_527332 ?auto_527336 ) ) ( not ( = ?auto_527332 ?auto_527337 ) ) ( not ( = ?auto_527332 ?auto_527338 ) ) ( not ( = ?auto_527332 ?auto_527339 ) ) ( not ( = ?auto_527332 ?auto_527340 ) ) ( not ( = ?auto_527332 ?auto_527341 ) ) ( not ( = ?auto_527332 ?auto_527342 ) ) ( not ( = ?auto_527332 ?auto_527343 ) ) ( not ( = ?auto_527332 ?auto_527344 ) ) ( not ( = ?auto_527333 ?auto_527334 ) ) ( not ( = ?auto_527333 ?auto_527335 ) ) ( not ( = ?auto_527333 ?auto_527336 ) ) ( not ( = ?auto_527333 ?auto_527337 ) ) ( not ( = ?auto_527333 ?auto_527338 ) ) ( not ( = ?auto_527333 ?auto_527339 ) ) ( not ( = ?auto_527333 ?auto_527340 ) ) ( not ( = ?auto_527333 ?auto_527341 ) ) ( not ( = ?auto_527333 ?auto_527342 ) ) ( not ( = ?auto_527333 ?auto_527343 ) ) ( not ( = ?auto_527333 ?auto_527344 ) ) ( not ( = ?auto_527334 ?auto_527335 ) ) ( not ( = ?auto_527334 ?auto_527336 ) ) ( not ( = ?auto_527334 ?auto_527337 ) ) ( not ( = ?auto_527334 ?auto_527338 ) ) ( not ( = ?auto_527334 ?auto_527339 ) ) ( not ( = ?auto_527334 ?auto_527340 ) ) ( not ( = ?auto_527334 ?auto_527341 ) ) ( not ( = ?auto_527334 ?auto_527342 ) ) ( not ( = ?auto_527334 ?auto_527343 ) ) ( not ( = ?auto_527334 ?auto_527344 ) ) ( not ( = ?auto_527335 ?auto_527336 ) ) ( not ( = ?auto_527335 ?auto_527337 ) ) ( not ( = ?auto_527335 ?auto_527338 ) ) ( not ( = ?auto_527335 ?auto_527339 ) ) ( not ( = ?auto_527335 ?auto_527340 ) ) ( not ( = ?auto_527335 ?auto_527341 ) ) ( not ( = ?auto_527335 ?auto_527342 ) ) ( not ( = ?auto_527335 ?auto_527343 ) ) ( not ( = ?auto_527335 ?auto_527344 ) ) ( not ( = ?auto_527336 ?auto_527337 ) ) ( not ( = ?auto_527336 ?auto_527338 ) ) ( not ( = ?auto_527336 ?auto_527339 ) ) ( not ( = ?auto_527336 ?auto_527340 ) ) ( not ( = ?auto_527336 ?auto_527341 ) ) ( not ( = ?auto_527336 ?auto_527342 ) ) ( not ( = ?auto_527336 ?auto_527343 ) ) ( not ( = ?auto_527336 ?auto_527344 ) ) ( not ( = ?auto_527337 ?auto_527338 ) ) ( not ( = ?auto_527337 ?auto_527339 ) ) ( not ( = ?auto_527337 ?auto_527340 ) ) ( not ( = ?auto_527337 ?auto_527341 ) ) ( not ( = ?auto_527337 ?auto_527342 ) ) ( not ( = ?auto_527337 ?auto_527343 ) ) ( not ( = ?auto_527337 ?auto_527344 ) ) ( not ( = ?auto_527338 ?auto_527339 ) ) ( not ( = ?auto_527338 ?auto_527340 ) ) ( not ( = ?auto_527338 ?auto_527341 ) ) ( not ( = ?auto_527338 ?auto_527342 ) ) ( not ( = ?auto_527338 ?auto_527343 ) ) ( not ( = ?auto_527338 ?auto_527344 ) ) ( not ( = ?auto_527339 ?auto_527340 ) ) ( not ( = ?auto_527339 ?auto_527341 ) ) ( not ( = ?auto_527339 ?auto_527342 ) ) ( not ( = ?auto_527339 ?auto_527343 ) ) ( not ( = ?auto_527339 ?auto_527344 ) ) ( not ( = ?auto_527340 ?auto_527341 ) ) ( not ( = ?auto_527340 ?auto_527342 ) ) ( not ( = ?auto_527340 ?auto_527343 ) ) ( not ( = ?auto_527340 ?auto_527344 ) ) ( not ( = ?auto_527341 ?auto_527342 ) ) ( not ( = ?auto_527341 ?auto_527343 ) ) ( not ( = ?auto_527341 ?auto_527344 ) ) ( not ( = ?auto_527342 ?auto_527343 ) ) ( not ( = ?auto_527342 ?auto_527344 ) ) ( not ( = ?auto_527343 ?auto_527344 ) ) ( ON ?auto_527342 ?auto_527343 ) ( ON ?auto_527341 ?auto_527342 ) ( ON ?auto_527340 ?auto_527341 ) ( ON ?auto_527339 ?auto_527340 ) ( ON ?auto_527338 ?auto_527339 ) ( ON ?auto_527337 ?auto_527338 ) ( ON ?auto_527336 ?auto_527337 ) ( ON ?auto_527335 ?auto_527336 ) ( ON ?auto_527334 ?auto_527335 ) ( ON ?auto_527333 ?auto_527334 ) ( CLEAR ?auto_527331 ) ( ON ?auto_527332 ?auto_527333 ) ( CLEAR ?auto_527332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_527328 ?auto_527329 ?auto_527330 ?auto_527331 ?auto_527332 )
      ( MAKE-16PILE ?auto_527328 ?auto_527329 ?auto_527330 ?auto_527331 ?auto_527332 ?auto_527333 ?auto_527334 ?auto_527335 ?auto_527336 ?auto_527337 ?auto_527338 ?auto_527339 ?auto_527340 ?auto_527341 ?auto_527342 ?auto_527343 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527361 - BLOCK
      ?auto_527362 - BLOCK
      ?auto_527363 - BLOCK
      ?auto_527364 - BLOCK
      ?auto_527365 - BLOCK
      ?auto_527366 - BLOCK
      ?auto_527367 - BLOCK
      ?auto_527368 - BLOCK
      ?auto_527369 - BLOCK
      ?auto_527370 - BLOCK
      ?auto_527371 - BLOCK
      ?auto_527372 - BLOCK
      ?auto_527373 - BLOCK
      ?auto_527374 - BLOCK
      ?auto_527375 - BLOCK
      ?auto_527376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_527376 ) ( ON-TABLE ?auto_527361 ) ( ON ?auto_527362 ?auto_527361 ) ( ON ?auto_527363 ?auto_527362 ) ( ON ?auto_527364 ?auto_527363 ) ( not ( = ?auto_527361 ?auto_527362 ) ) ( not ( = ?auto_527361 ?auto_527363 ) ) ( not ( = ?auto_527361 ?auto_527364 ) ) ( not ( = ?auto_527361 ?auto_527365 ) ) ( not ( = ?auto_527361 ?auto_527366 ) ) ( not ( = ?auto_527361 ?auto_527367 ) ) ( not ( = ?auto_527361 ?auto_527368 ) ) ( not ( = ?auto_527361 ?auto_527369 ) ) ( not ( = ?auto_527361 ?auto_527370 ) ) ( not ( = ?auto_527361 ?auto_527371 ) ) ( not ( = ?auto_527361 ?auto_527372 ) ) ( not ( = ?auto_527361 ?auto_527373 ) ) ( not ( = ?auto_527361 ?auto_527374 ) ) ( not ( = ?auto_527361 ?auto_527375 ) ) ( not ( = ?auto_527361 ?auto_527376 ) ) ( not ( = ?auto_527362 ?auto_527363 ) ) ( not ( = ?auto_527362 ?auto_527364 ) ) ( not ( = ?auto_527362 ?auto_527365 ) ) ( not ( = ?auto_527362 ?auto_527366 ) ) ( not ( = ?auto_527362 ?auto_527367 ) ) ( not ( = ?auto_527362 ?auto_527368 ) ) ( not ( = ?auto_527362 ?auto_527369 ) ) ( not ( = ?auto_527362 ?auto_527370 ) ) ( not ( = ?auto_527362 ?auto_527371 ) ) ( not ( = ?auto_527362 ?auto_527372 ) ) ( not ( = ?auto_527362 ?auto_527373 ) ) ( not ( = ?auto_527362 ?auto_527374 ) ) ( not ( = ?auto_527362 ?auto_527375 ) ) ( not ( = ?auto_527362 ?auto_527376 ) ) ( not ( = ?auto_527363 ?auto_527364 ) ) ( not ( = ?auto_527363 ?auto_527365 ) ) ( not ( = ?auto_527363 ?auto_527366 ) ) ( not ( = ?auto_527363 ?auto_527367 ) ) ( not ( = ?auto_527363 ?auto_527368 ) ) ( not ( = ?auto_527363 ?auto_527369 ) ) ( not ( = ?auto_527363 ?auto_527370 ) ) ( not ( = ?auto_527363 ?auto_527371 ) ) ( not ( = ?auto_527363 ?auto_527372 ) ) ( not ( = ?auto_527363 ?auto_527373 ) ) ( not ( = ?auto_527363 ?auto_527374 ) ) ( not ( = ?auto_527363 ?auto_527375 ) ) ( not ( = ?auto_527363 ?auto_527376 ) ) ( not ( = ?auto_527364 ?auto_527365 ) ) ( not ( = ?auto_527364 ?auto_527366 ) ) ( not ( = ?auto_527364 ?auto_527367 ) ) ( not ( = ?auto_527364 ?auto_527368 ) ) ( not ( = ?auto_527364 ?auto_527369 ) ) ( not ( = ?auto_527364 ?auto_527370 ) ) ( not ( = ?auto_527364 ?auto_527371 ) ) ( not ( = ?auto_527364 ?auto_527372 ) ) ( not ( = ?auto_527364 ?auto_527373 ) ) ( not ( = ?auto_527364 ?auto_527374 ) ) ( not ( = ?auto_527364 ?auto_527375 ) ) ( not ( = ?auto_527364 ?auto_527376 ) ) ( not ( = ?auto_527365 ?auto_527366 ) ) ( not ( = ?auto_527365 ?auto_527367 ) ) ( not ( = ?auto_527365 ?auto_527368 ) ) ( not ( = ?auto_527365 ?auto_527369 ) ) ( not ( = ?auto_527365 ?auto_527370 ) ) ( not ( = ?auto_527365 ?auto_527371 ) ) ( not ( = ?auto_527365 ?auto_527372 ) ) ( not ( = ?auto_527365 ?auto_527373 ) ) ( not ( = ?auto_527365 ?auto_527374 ) ) ( not ( = ?auto_527365 ?auto_527375 ) ) ( not ( = ?auto_527365 ?auto_527376 ) ) ( not ( = ?auto_527366 ?auto_527367 ) ) ( not ( = ?auto_527366 ?auto_527368 ) ) ( not ( = ?auto_527366 ?auto_527369 ) ) ( not ( = ?auto_527366 ?auto_527370 ) ) ( not ( = ?auto_527366 ?auto_527371 ) ) ( not ( = ?auto_527366 ?auto_527372 ) ) ( not ( = ?auto_527366 ?auto_527373 ) ) ( not ( = ?auto_527366 ?auto_527374 ) ) ( not ( = ?auto_527366 ?auto_527375 ) ) ( not ( = ?auto_527366 ?auto_527376 ) ) ( not ( = ?auto_527367 ?auto_527368 ) ) ( not ( = ?auto_527367 ?auto_527369 ) ) ( not ( = ?auto_527367 ?auto_527370 ) ) ( not ( = ?auto_527367 ?auto_527371 ) ) ( not ( = ?auto_527367 ?auto_527372 ) ) ( not ( = ?auto_527367 ?auto_527373 ) ) ( not ( = ?auto_527367 ?auto_527374 ) ) ( not ( = ?auto_527367 ?auto_527375 ) ) ( not ( = ?auto_527367 ?auto_527376 ) ) ( not ( = ?auto_527368 ?auto_527369 ) ) ( not ( = ?auto_527368 ?auto_527370 ) ) ( not ( = ?auto_527368 ?auto_527371 ) ) ( not ( = ?auto_527368 ?auto_527372 ) ) ( not ( = ?auto_527368 ?auto_527373 ) ) ( not ( = ?auto_527368 ?auto_527374 ) ) ( not ( = ?auto_527368 ?auto_527375 ) ) ( not ( = ?auto_527368 ?auto_527376 ) ) ( not ( = ?auto_527369 ?auto_527370 ) ) ( not ( = ?auto_527369 ?auto_527371 ) ) ( not ( = ?auto_527369 ?auto_527372 ) ) ( not ( = ?auto_527369 ?auto_527373 ) ) ( not ( = ?auto_527369 ?auto_527374 ) ) ( not ( = ?auto_527369 ?auto_527375 ) ) ( not ( = ?auto_527369 ?auto_527376 ) ) ( not ( = ?auto_527370 ?auto_527371 ) ) ( not ( = ?auto_527370 ?auto_527372 ) ) ( not ( = ?auto_527370 ?auto_527373 ) ) ( not ( = ?auto_527370 ?auto_527374 ) ) ( not ( = ?auto_527370 ?auto_527375 ) ) ( not ( = ?auto_527370 ?auto_527376 ) ) ( not ( = ?auto_527371 ?auto_527372 ) ) ( not ( = ?auto_527371 ?auto_527373 ) ) ( not ( = ?auto_527371 ?auto_527374 ) ) ( not ( = ?auto_527371 ?auto_527375 ) ) ( not ( = ?auto_527371 ?auto_527376 ) ) ( not ( = ?auto_527372 ?auto_527373 ) ) ( not ( = ?auto_527372 ?auto_527374 ) ) ( not ( = ?auto_527372 ?auto_527375 ) ) ( not ( = ?auto_527372 ?auto_527376 ) ) ( not ( = ?auto_527373 ?auto_527374 ) ) ( not ( = ?auto_527373 ?auto_527375 ) ) ( not ( = ?auto_527373 ?auto_527376 ) ) ( not ( = ?auto_527374 ?auto_527375 ) ) ( not ( = ?auto_527374 ?auto_527376 ) ) ( not ( = ?auto_527375 ?auto_527376 ) ) ( ON ?auto_527375 ?auto_527376 ) ( ON ?auto_527374 ?auto_527375 ) ( ON ?auto_527373 ?auto_527374 ) ( ON ?auto_527372 ?auto_527373 ) ( ON ?auto_527371 ?auto_527372 ) ( ON ?auto_527370 ?auto_527371 ) ( ON ?auto_527369 ?auto_527370 ) ( ON ?auto_527368 ?auto_527369 ) ( ON ?auto_527367 ?auto_527368 ) ( ON ?auto_527366 ?auto_527367 ) ( CLEAR ?auto_527364 ) ( ON ?auto_527365 ?auto_527366 ) ( CLEAR ?auto_527365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_527361 ?auto_527362 ?auto_527363 ?auto_527364 ?auto_527365 )
      ( MAKE-16PILE ?auto_527361 ?auto_527362 ?auto_527363 ?auto_527364 ?auto_527365 ?auto_527366 ?auto_527367 ?auto_527368 ?auto_527369 ?auto_527370 ?auto_527371 ?auto_527372 ?auto_527373 ?auto_527374 ?auto_527375 ?auto_527376 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527393 - BLOCK
      ?auto_527394 - BLOCK
      ?auto_527395 - BLOCK
      ?auto_527396 - BLOCK
      ?auto_527397 - BLOCK
      ?auto_527398 - BLOCK
      ?auto_527399 - BLOCK
      ?auto_527400 - BLOCK
      ?auto_527401 - BLOCK
      ?auto_527402 - BLOCK
      ?auto_527403 - BLOCK
      ?auto_527404 - BLOCK
      ?auto_527405 - BLOCK
      ?auto_527406 - BLOCK
      ?auto_527407 - BLOCK
      ?auto_527408 - BLOCK
    )
    :vars
    (
      ?auto_527409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527408 ?auto_527409 ) ( ON-TABLE ?auto_527393 ) ( ON ?auto_527394 ?auto_527393 ) ( ON ?auto_527395 ?auto_527394 ) ( not ( = ?auto_527393 ?auto_527394 ) ) ( not ( = ?auto_527393 ?auto_527395 ) ) ( not ( = ?auto_527393 ?auto_527396 ) ) ( not ( = ?auto_527393 ?auto_527397 ) ) ( not ( = ?auto_527393 ?auto_527398 ) ) ( not ( = ?auto_527393 ?auto_527399 ) ) ( not ( = ?auto_527393 ?auto_527400 ) ) ( not ( = ?auto_527393 ?auto_527401 ) ) ( not ( = ?auto_527393 ?auto_527402 ) ) ( not ( = ?auto_527393 ?auto_527403 ) ) ( not ( = ?auto_527393 ?auto_527404 ) ) ( not ( = ?auto_527393 ?auto_527405 ) ) ( not ( = ?auto_527393 ?auto_527406 ) ) ( not ( = ?auto_527393 ?auto_527407 ) ) ( not ( = ?auto_527393 ?auto_527408 ) ) ( not ( = ?auto_527393 ?auto_527409 ) ) ( not ( = ?auto_527394 ?auto_527395 ) ) ( not ( = ?auto_527394 ?auto_527396 ) ) ( not ( = ?auto_527394 ?auto_527397 ) ) ( not ( = ?auto_527394 ?auto_527398 ) ) ( not ( = ?auto_527394 ?auto_527399 ) ) ( not ( = ?auto_527394 ?auto_527400 ) ) ( not ( = ?auto_527394 ?auto_527401 ) ) ( not ( = ?auto_527394 ?auto_527402 ) ) ( not ( = ?auto_527394 ?auto_527403 ) ) ( not ( = ?auto_527394 ?auto_527404 ) ) ( not ( = ?auto_527394 ?auto_527405 ) ) ( not ( = ?auto_527394 ?auto_527406 ) ) ( not ( = ?auto_527394 ?auto_527407 ) ) ( not ( = ?auto_527394 ?auto_527408 ) ) ( not ( = ?auto_527394 ?auto_527409 ) ) ( not ( = ?auto_527395 ?auto_527396 ) ) ( not ( = ?auto_527395 ?auto_527397 ) ) ( not ( = ?auto_527395 ?auto_527398 ) ) ( not ( = ?auto_527395 ?auto_527399 ) ) ( not ( = ?auto_527395 ?auto_527400 ) ) ( not ( = ?auto_527395 ?auto_527401 ) ) ( not ( = ?auto_527395 ?auto_527402 ) ) ( not ( = ?auto_527395 ?auto_527403 ) ) ( not ( = ?auto_527395 ?auto_527404 ) ) ( not ( = ?auto_527395 ?auto_527405 ) ) ( not ( = ?auto_527395 ?auto_527406 ) ) ( not ( = ?auto_527395 ?auto_527407 ) ) ( not ( = ?auto_527395 ?auto_527408 ) ) ( not ( = ?auto_527395 ?auto_527409 ) ) ( not ( = ?auto_527396 ?auto_527397 ) ) ( not ( = ?auto_527396 ?auto_527398 ) ) ( not ( = ?auto_527396 ?auto_527399 ) ) ( not ( = ?auto_527396 ?auto_527400 ) ) ( not ( = ?auto_527396 ?auto_527401 ) ) ( not ( = ?auto_527396 ?auto_527402 ) ) ( not ( = ?auto_527396 ?auto_527403 ) ) ( not ( = ?auto_527396 ?auto_527404 ) ) ( not ( = ?auto_527396 ?auto_527405 ) ) ( not ( = ?auto_527396 ?auto_527406 ) ) ( not ( = ?auto_527396 ?auto_527407 ) ) ( not ( = ?auto_527396 ?auto_527408 ) ) ( not ( = ?auto_527396 ?auto_527409 ) ) ( not ( = ?auto_527397 ?auto_527398 ) ) ( not ( = ?auto_527397 ?auto_527399 ) ) ( not ( = ?auto_527397 ?auto_527400 ) ) ( not ( = ?auto_527397 ?auto_527401 ) ) ( not ( = ?auto_527397 ?auto_527402 ) ) ( not ( = ?auto_527397 ?auto_527403 ) ) ( not ( = ?auto_527397 ?auto_527404 ) ) ( not ( = ?auto_527397 ?auto_527405 ) ) ( not ( = ?auto_527397 ?auto_527406 ) ) ( not ( = ?auto_527397 ?auto_527407 ) ) ( not ( = ?auto_527397 ?auto_527408 ) ) ( not ( = ?auto_527397 ?auto_527409 ) ) ( not ( = ?auto_527398 ?auto_527399 ) ) ( not ( = ?auto_527398 ?auto_527400 ) ) ( not ( = ?auto_527398 ?auto_527401 ) ) ( not ( = ?auto_527398 ?auto_527402 ) ) ( not ( = ?auto_527398 ?auto_527403 ) ) ( not ( = ?auto_527398 ?auto_527404 ) ) ( not ( = ?auto_527398 ?auto_527405 ) ) ( not ( = ?auto_527398 ?auto_527406 ) ) ( not ( = ?auto_527398 ?auto_527407 ) ) ( not ( = ?auto_527398 ?auto_527408 ) ) ( not ( = ?auto_527398 ?auto_527409 ) ) ( not ( = ?auto_527399 ?auto_527400 ) ) ( not ( = ?auto_527399 ?auto_527401 ) ) ( not ( = ?auto_527399 ?auto_527402 ) ) ( not ( = ?auto_527399 ?auto_527403 ) ) ( not ( = ?auto_527399 ?auto_527404 ) ) ( not ( = ?auto_527399 ?auto_527405 ) ) ( not ( = ?auto_527399 ?auto_527406 ) ) ( not ( = ?auto_527399 ?auto_527407 ) ) ( not ( = ?auto_527399 ?auto_527408 ) ) ( not ( = ?auto_527399 ?auto_527409 ) ) ( not ( = ?auto_527400 ?auto_527401 ) ) ( not ( = ?auto_527400 ?auto_527402 ) ) ( not ( = ?auto_527400 ?auto_527403 ) ) ( not ( = ?auto_527400 ?auto_527404 ) ) ( not ( = ?auto_527400 ?auto_527405 ) ) ( not ( = ?auto_527400 ?auto_527406 ) ) ( not ( = ?auto_527400 ?auto_527407 ) ) ( not ( = ?auto_527400 ?auto_527408 ) ) ( not ( = ?auto_527400 ?auto_527409 ) ) ( not ( = ?auto_527401 ?auto_527402 ) ) ( not ( = ?auto_527401 ?auto_527403 ) ) ( not ( = ?auto_527401 ?auto_527404 ) ) ( not ( = ?auto_527401 ?auto_527405 ) ) ( not ( = ?auto_527401 ?auto_527406 ) ) ( not ( = ?auto_527401 ?auto_527407 ) ) ( not ( = ?auto_527401 ?auto_527408 ) ) ( not ( = ?auto_527401 ?auto_527409 ) ) ( not ( = ?auto_527402 ?auto_527403 ) ) ( not ( = ?auto_527402 ?auto_527404 ) ) ( not ( = ?auto_527402 ?auto_527405 ) ) ( not ( = ?auto_527402 ?auto_527406 ) ) ( not ( = ?auto_527402 ?auto_527407 ) ) ( not ( = ?auto_527402 ?auto_527408 ) ) ( not ( = ?auto_527402 ?auto_527409 ) ) ( not ( = ?auto_527403 ?auto_527404 ) ) ( not ( = ?auto_527403 ?auto_527405 ) ) ( not ( = ?auto_527403 ?auto_527406 ) ) ( not ( = ?auto_527403 ?auto_527407 ) ) ( not ( = ?auto_527403 ?auto_527408 ) ) ( not ( = ?auto_527403 ?auto_527409 ) ) ( not ( = ?auto_527404 ?auto_527405 ) ) ( not ( = ?auto_527404 ?auto_527406 ) ) ( not ( = ?auto_527404 ?auto_527407 ) ) ( not ( = ?auto_527404 ?auto_527408 ) ) ( not ( = ?auto_527404 ?auto_527409 ) ) ( not ( = ?auto_527405 ?auto_527406 ) ) ( not ( = ?auto_527405 ?auto_527407 ) ) ( not ( = ?auto_527405 ?auto_527408 ) ) ( not ( = ?auto_527405 ?auto_527409 ) ) ( not ( = ?auto_527406 ?auto_527407 ) ) ( not ( = ?auto_527406 ?auto_527408 ) ) ( not ( = ?auto_527406 ?auto_527409 ) ) ( not ( = ?auto_527407 ?auto_527408 ) ) ( not ( = ?auto_527407 ?auto_527409 ) ) ( not ( = ?auto_527408 ?auto_527409 ) ) ( ON ?auto_527407 ?auto_527408 ) ( ON ?auto_527406 ?auto_527407 ) ( ON ?auto_527405 ?auto_527406 ) ( ON ?auto_527404 ?auto_527405 ) ( ON ?auto_527403 ?auto_527404 ) ( ON ?auto_527402 ?auto_527403 ) ( ON ?auto_527401 ?auto_527402 ) ( ON ?auto_527400 ?auto_527401 ) ( ON ?auto_527399 ?auto_527400 ) ( ON ?auto_527398 ?auto_527399 ) ( ON ?auto_527397 ?auto_527398 ) ( CLEAR ?auto_527395 ) ( ON ?auto_527396 ?auto_527397 ) ( CLEAR ?auto_527396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_527393 ?auto_527394 ?auto_527395 ?auto_527396 )
      ( MAKE-16PILE ?auto_527393 ?auto_527394 ?auto_527395 ?auto_527396 ?auto_527397 ?auto_527398 ?auto_527399 ?auto_527400 ?auto_527401 ?auto_527402 ?auto_527403 ?auto_527404 ?auto_527405 ?auto_527406 ?auto_527407 ?auto_527408 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527426 - BLOCK
      ?auto_527427 - BLOCK
      ?auto_527428 - BLOCK
      ?auto_527429 - BLOCK
      ?auto_527430 - BLOCK
      ?auto_527431 - BLOCK
      ?auto_527432 - BLOCK
      ?auto_527433 - BLOCK
      ?auto_527434 - BLOCK
      ?auto_527435 - BLOCK
      ?auto_527436 - BLOCK
      ?auto_527437 - BLOCK
      ?auto_527438 - BLOCK
      ?auto_527439 - BLOCK
      ?auto_527440 - BLOCK
      ?auto_527441 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_527441 ) ( ON-TABLE ?auto_527426 ) ( ON ?auto_527427 ?auto_527426 ) ( ON ?auto_527428 ?auto_527427 ) ( not ( = ?auto_527426 ?auto_527427 ) ) ( not ( = ?auto_527426 ?auto_527428 ) ) ( not ( = ?auto_527426 ?auto_527429 ) ) ( not ( = ?auto_527426 ?auto_527430 ) ) ( not ( = ?auto_527426 ?auto_527431 ) ) ( not ( = ?auto_527426 ?auto_527432 ) ) ( not ( = ?auto_527426 ?auto_527433 ) ) ( not ( = ?auto_527426 ?auto_527434 ) ) ( not ( = ?auto_527426 ?auto_527435 ) ) ( not ( = ?auto_527426 ?auto_527436 ) ) ( not ( = ?auto_527426 ?auto_527437 ) ) ( not ( = ?auto_527426 ?auto_527438 ) ) ( not ( = ?auto_527426 ?auto_527439 ) ) ( not ( = ?auto_527426 ?auto_527440 ) ) ( not ( = ?auto_527426 ?auto_527441 ) ) ( not ( = ?auto_527427 ?auto_527428 ) ) ( not ( = ?auto_527427 ?auto_527429 ) ) ( not ( = ?auto_527427 ?auto_527430 ) ) ( not ( = ?auto_527427 ?auto_527431 ) ) ( not ( = ?auto_527427 ?auto_527432 ) ) ( not ( = ?auto_527427 ?auto_527433 ) ) ( not ( = ?auto_527427 ?auto_527434 ) ) ( not ( = ?auto_527427 ?auto_527435 ) ) ( not ( = ?auto_527427 ?auto_527436 ) ) ( not ( = ?auto_527427 ?auto_527437 ) ) ( not ( = ?auto_527427 ?auto_527438 ) ) ( not ( = ?auto_527427 ?auto_527439 ) ) ( not ( = ?auto_527427 ?auto_527440 ) ) ( not ( = ?auto_527427 ?auto_527441 ) ) ( not ( = ?auto_527428 ?auto_527429 ) ) ( not ( = ?auto_527428 ?auto_527430 ) ) ( not ( = ?auto_527428 ?auto_527431 ) ) ( not ( = ?auto_527428 ?auto_527432 ) ) ( not ( = ?auto_527428 ?auto_527433 ) ) ( not ( = ?auto_527428 ?auto_527434 ) ) ( not ( = ?auto_527428 ?auto_527435 ) ) ( not ( = ?auto_527428 ?auto_527436 ) ) ( not ( = ?auto_527428 ?auto_527437 ) ) ( not ( = ?auto_527428 ?auto_527438 ) ) ( not ( = ?auto_527428 ?auto_527439 ) ) ( not ( = ?auto_527428 ?auto_527440 ) ) ( not ( = ?auto_527428 ?auto_527441 ) ) ( not ( = ?auto_527429 ?auto_527430 ) ) ( not ( = ?auto_527429 ?auto_527431 ) ) ( not ( = ?auto_527429 ?auto_527432 ) ) ( not ( = ?auto_527429 ?auto_527433 ) ) ( not ( = ?auto_527429 ?auto_527434 ) ) ( not ( = ?auto_527429 ?auto_527435 ) ) ( not ( = ?auto_527429 ?auto_527436 ) ) ( not ( = ?auto_527429 ?auto_527437 ) ) ( not ( = ?auto_527429 ?auto_527438 ) ) ( not ( = ?auto_527429 ?auto_527439 ) ) ( not ( = ?auto_527429 ?auto_527440 ) ) ( not ( = ?auto_527429 ?auto_527441 ) ) ( not ( = ?auto_527430 ?auto_527431 ) ) ( not ( = ?auto_527430 ?auto_527432 ) ) ( not ( = ?auto_527430 ?auto_527433 ) ) ( not ( = ?auto_527430 ?auto_527434 ) ) ( not ( = ?auto_527430 ?auto_527435 ) ) ( not ( = ?auto_527430 ?auto_527436 ) ) ( not ( = ?auto_527430 ?auto_527437 ) ) ( not ( = ?auto_527430 ?auto_527438 ) ) ( not ( = ?auto_527430 ?auto_527439 ) ) ( not ( = ?auto_527430 ?auto_527440 ) ) ( not ( = ?auto_527430 ?auto_527441 ) ) ( not ( = ?auto_527431 ?auto_527432 ) ) ( not ( = ?auto_527431 ?auto_527433 ) ) ( not ( = ?auto_527431 ?auto_527434 ) ) ( not ( = ?auto_527431 ?auto_527435 ) ) ( not ( = ?auto_527431 ?auto_527436 ) ) ( not ( = ?auto_527431 ?auto_527437 ) ) ( not ( = ?auto_527431 ?auto_527438 ) ) ( not ( = ?auto_527431 ?auto_527439 ) ) ( not ( = ?auto_527431 ?auto_527440 ) ) ( not ( = ?auto_527431 ?auto_527441 ) ) ( not ( = ?auto_527432 ?auto_527433 ) ) ( not ( = ?auto_527432 ?auto_527434 ) ) ( not ( = ?auto_527432 ?auto_527435 ) ) ( not ( = ?auto_527432 ?auto_527436 ) ) ( not ( = ?auto_527432 ?auto_527437 ) ) ( not ( = ?auto_527432 ?auto_527438 ) ) ( not ( = ?auto_527432 ?auto_527439 ) ) ( not ( = ?auto_527432 ?auto_527440 ) ) ( not ( = ?auto_527432 ?auto_527441 ) ) ( not ( = ?auto_527433 ?auto_527434 ) ) ( not ( = ?auto_527433 ?auto_527435 ) ) ( not ( = ?auto_527433 ?auto_527436 ) ) ( not ( = ?auto_527433 ?auto_527437 ) ) ( not ( = ?auto_527433 ?auto_527438 ) ) ( not ( = ?auto_527433 ?auto_527439 ) ) ( not ( = ?auto_527433 ?auto_527440 ) ) ( not ( = ?auto_527433 ?auto_527441 ) ) ( not ( = ?auto_527434 ?auto_527435 ) ) ( not ( = ?auto_527434 ?auto_527436 ) ) ( not ( = ?auto_527434 ?auto_527437 ) ) ( not ( = ?auto_527434 ?auto_527438 ) ) ( not ( = ?auto_527434 ?auto_527439 ) ) ( not ( = ?auto_527434 ?auto_527440 ) ) ( not ( = ?auto_527434 ?auto_527441 ) ) ( not ( = ?auto_527435 ?auto_527436 ) ) ( not ( = ?auto_527435 ?auto_527437 ) ) ( not ( = ?auto_527435 ?auto_527438 ) ) ( not ( = ?auto_527435 ?auto_527439 ) ) ( not ( = ?auto_527435 ?auto_527440 ) ) ( not ( = ?auto_527435 ?auto_527441 ) ) ( not ( = ?auto_527436 ?auto_527437 ) ) ( not ( = ?auto_527436 ?auto_527438 ) ) ( not ( = ?auto_527436 ?auto_527439 ) ) ( not ( = ?auto_527436 ?auto_527440 ) ) ( not ( = ?auto_527436 ?auto_527441 ) ) ( not ( = ?auto_527437 ?auto_527438 ) ) ( not ( = ?auto_527437 ?auto_527439 ) ) ( not ( = ?auto_527437 ?auto_527440 ) ) ( not ( = ?auto_527437 ?auto_527441 ) ) ( not ( = ?auto_527438 ?auto_527439 ) ) ( not ( = ?auto_527438 ?auto_527440 ) ) ( not ( = ?auto_527438 ?auto_527441 ) ) ( not ( = ?auto_527439 ?auto_527440 ) ) ( not ( = ?auto_527439 ?auto_527441 ) ) ( not ( = ?auto_527440 ?auto_527441 ) ) ( ON ?auto_527440 ?auto_527441 ) ( ON ?auto_527439 ?auto_527440 ) ( ON ?auto_527438 ?auto_527439 ) ( ON ?auto_527437 ?auto_527438 ) ( ON ?auto_527436 ?auto_527437 ) ( ON ?auto_527435 ?auto_527436 ) ( ON ?auto_527434 ?auto_527435 ) ( ON ?auto_527433 ?auto_527434 ) ( ON ?auto_527432 ?auto_527433 ) ( ON ?auto_527431 ?auto_527432 ) ( ON ?auto_527430 ?auto_527431 ) ( CLEAR ?auto_527428 ) ( ON ?auto_527429 ?auto_527430 ) ( CLEAR ?auto_527429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_527426 ?auto_527427 ?auto_527428 ?auto_527429 )
      ( MAKE-16PILE ?auto_527426 ?auto_527427 ?auto_527428 ?auto_527429 ?auto_527430 ?auto_527431 ?auto_527432 ?auto_527433 ?auto_527434 ?auto_527435 ?auto_527436 ?auto_527437 ?auto_527438 ?auto_527439 ?auto_527440 ?auto_527441 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527458 - BLOCK
      ?auto_527459 - BLOCK
      ?auto_527460 - BLOCK
      ?auto_527461 - BLOCK
      ?auto_527462 - BLOCK
      ?auto_527463 - BLOCK
      ?auto_527464 - BLOCK
      ?auto_527465 - BLOCK
      ?auto_527466 - BLOCK
      ?auto_527467 - BLOCK
      ?auto_527468 - BLOCK
      ?auto_527469 - BLOCK
      ?auto_527470 - BLOCK
      ?auto_527471 - BLOCK
      ?auto_527472 - BLOCK
      ?auto_527473 - BLOCK
    )
    :vars
    (
      ?auto_527474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527473 ?auto_527474 ) ( ON-TABLE ?auto_527458 ) ( ON ?auto_527459 ?auto_527458 ) ( not ( = ?auto_527458 ?auto_527459 ) ) ( not ( = ?auto_527458 ?auto_527460 ) ) ( not ( = ?auto_527458 ?auto_527461 ) ) ( not ( = ?auto_527458 ?auto_527462 ) ) ( not ( = ?auto_527458 ?auto_527463 ) ) ( not ( = ?auto_527458 ?auto_527464 ) ) ( not ( = ?auto_527458 ?auto_527465 ) ) ( not ( = ?auto_527458 ?auto_527466 ) ) ( not ( = ?auto_527458 ?auto_527467 ) ) ( not ( = ?auto_527458 ?auto_527468 ) ) ( not ( = ?auto_527458 ?auto_527469 ) ) ( not ( = ?auto_527458 ?auto_527470 ) ) ( not ( = ?auto_527458 ?auto_527471 ) ) ( not ( = ?auto_527458 ?auto_527472 ) ) ( not ( = ?auto_527458 ?auto_527473 ) ) ( not ( = ?auto_527458 ?auto_527474 ) ) ( not ( = ?auto_527459 ?auto_527460 ) ) ( not ( = ?auto_527459 ?auto_527461 ) ) ( not ( = ?auto_527459 ?auto_527462 ) ) ( not ( = ?auto_527459 ?auto_527463 ) ) ( not ( = ?auto_527459 ?auto_527464 ) ) ( not ( = ?auto_527459 ?auto_527465 ) ) ( not ( = ?auto_527459 ?auto_527466 ) ) ( not ( = ?auto_527459 ?auto_527467 ) ) ( not ( = ?auto_527459 ?auto_527468 ) ) ( not ( = ?auto_527459 ?auto_527469 ) ) ( not ( = ?auto_527459 ?auto_527470 ) ) ( not ( = ?auto_527459 ?auto_527471 ) ) ( not ( = ?auto_527459 ?auto_527472 ) ) ( not ( = ?auto_527459 ?auto_527473 ) ) ( not ( = ?auto_527459 ?auto_527474 ) ) ( not ( = ?auto_527460 ?auto_527461 ) ) ( not ( = ?auto_527460 ?auto_527462 ) ) ( not ( = ?auto_527460 ?auto_527463 ) ) ( not ( = ?auto_527460 ?auto_527464 ) ) ( not ( = ?auto_527460 ?auto_527465 ) ) ( not ( = ?auto_527460 ?auto_527466 ) ) ( not ( = ?auto_527460 ?auto_527467 ) ) ( not ( = ?auto_527460 ?auto_527468 ) ) ( not ( = ?auto_527460 ?auto_527469 ) ) ( not ( = ?auto_527460 ?auto_527470 ) ) ( not ( = ?auto_527460 ?auto_527471 ) ) ( not ( = ?auto_527460 ?auto_527472 ) ) ( not ( = ?auto_527460 ?auto_527473 ) ) ( not ( = ?auto_527460 ?auto_527474 ) ) ( not ( = ?auto_527461 ?auto_527462 ) ) ( not ( = ?auto_527461 ?auto_527463 ) ) ( not ( = ?auto_527461 ?auto_527464 ) ) ( not ( = ?auto_527461 ?auto_527465 ) ) ( not ( = ?auto_527461 ?auto_527466 ) ) ( not ( = ?auto_527461 ?auto_527467 ) ) ( not ( = ?auto_527461 ?auto_527468 ) ) ( not ( = ?auto_527461 ?auto_527469 ) ) ( not ( = ?auto_527461 ?auto_527470 ) ) ( not ( = ?auto_527461 ?auto_527471 ) ) ( not ( = ?auto_527461 ?auto_527472 ) ) ( not ( = ?auto_527461 ?auto_527473 ) ) ( not ( = ?auto_527461 ?auto_527474 ) ) ( not ( = ?auto_527462 ?auto_527463 ) ) ( not ( = ?auto_527462 ?auto_527464 ) ) ( not ( = ?auto_527462 ?auto_527465 ) ) ( not ( = ?auto_527462 ?auto_527466 ) ) ( not ( = ?auto_527462 ?auto_527467 ) ) ( not ( = ?auto_527462 ?auto_527468 ) ) ( not ( = ?auto_527462 ?auto_527469 ) ) ( not ( = ?auto_527462 ?auto_527470 ) ) ( not ( = ?auto_527462 ?auto_527471 ) ) ( not ( = ?auto_527462 ?auto_527472 ) ) ( not ( = ?auto_527462 ?auto_527473 ) ) ( not ( = ?auto_527462 ?auto_527474 ) ) ( not ( = ?auto_527463 ?auto_527464 ) ) ( not ( = ?auto_527463 ?auto_527465 ) ) ( not ( = ?auto_527463 ?auto_527466 ) ) ( not ( = ?auto_527463 ?auto_527467 ) ) ( not ( = ?auto_527463 ?auto_527468 ) ) ( not ( = ?auto_527463 ?auto_527469 ) ) ( not ( = ?auto_527463 ?auto_527470 ) ) ( not ( = ?auto_527463 ?auto_527471 ) ) ( not ( = ?auto_527463 ?auto_527472 ) ) ( not ( = ?auto_527463 ?auto_527473 ) ) ( not ( = ?auto_527463 ?auto_527474 ) ) ( not ( = ?auto_527464 ?auto_527465 ) ) ( not ( = ?auto_527464 ?auto_527466 ) ) ( not ( = ?auto_527464 ?auto_527467 ) ) ( not ( = ?auto_527464 ?auto_527468 ) ) ( not ( = ?auto_527464 ?auto_527469 ) ) ( not ( = ?auto_527464 ?auto_527470 ) ) ( not ( = ?auto_527464 ?auto_527471 ) ) ( not ( = ?auto_527464 ?auto_527472 ) ) ( not ( = ?auto_527464 ?auto_527473 ) ) ( not ( = ?auto_527464 ?auto_527474 ) ) ( not ( = ?auto_527465 ?auto_527466 ) ) ( not ( = ?auto_527465 ?auto_527467 ) ) ( not ( = ?auto_527465 ?auto_527468 ) ) ( not ( = ?auto_527465 ?auto_527469 ) ) ( not ( = ?auto_527465 ?auto_527470 ) ) ( not ( = ?auto_527465 ?auto_527471 ) ) ( not ( = ?auto_527465 ?auto_527472 ) ) ( not ( = ?auto_527465 ?auto_527473 ) ) ( not ( = ?auto_527465 ?auto_527474 ) ) ( not ( = ?auto_527466 ?auto_527467 ) ) ( not ( = ?auto_527466 ?auto_527468 ) ) ( not ( = ?auto_527466 ?auto_527469 ) ) ( not ( = ?auto_527466 ?auto_527470 ) ) ( not ( = ?auto_527466 ?auto_527471 ) ) ( not ( = ?auto_527466 ?auto_527472 ) ) ( not ( = ?auto_527466 ?auto_527473 ) ) ( not ( = ?auto_527466 ?auto_527474 ) ) ( not ( = ?auto_527467 ?auto_527468 ) ) ( not ( = ?auto_527467 ?auto_527469 ) ) ( not ( = ?auto_527467 ?auto_527470 ) ) ( not ( = ?auto_527467 ?auto_527471 ) ) ( not ( = ?auto_527467 ?auto_527472 ) ) ( not ( = ?auto_527467 ?auto_527473 ) ) ( not ( = ?auto_527467 ?auto_527474 ) ) ( not ( = ?auto_527468 ?auto_527469 ) ) ( not ( = ?auto_527468 ?auto_527470 ) ) ( not ( = ?auto_527468 ?auto_527471 ) ) ( not ( = ?auto_527468 ?auto_527472 ) ) ( not ( = ?auto_527468 ?auto_527473 ) ) ( not ( = ?auto_527468 ?auto_527474 ) ) ( not ( = ?auto_527469 ?auto_527470 ) ) ( not ( = ?auto_527469 ?auto_527471 ) ) ( not ( = ?auto_527469 ?auto_527472 ) ) ( not ( = ?auto_527469 ?auto_527473 ) ) ( not ( = ?auto_527469 ?auto_527474 ) ) ( not ( = ?auto_527470 ?auto_527471 ) ) ( not ( = ?auto_527470 ?auto_527472 ) ) ( not ( = ?auto_527470 ?auto_527473 ) ) ( not ( = ?auto_527470 ?auto_527474 ) ) ( not ( = ?auto_527471 ?auto_527472 ) ) ( not ( = ?auto_527471 ?auto_527473 ) ) ( not ( = ?auto_527471 ?auto_527474 ) ) ( not ( = ?auto_527472 ?auto_527473 ) ) ( not ( = ?auto_527472 ?auto_527474 ) ) ( not ( = ?auto_527473 ?auto_527474 ) ) ( ON ?auto_527472 ?auto_527473 ) ( ON ?auto_527471 ?auto_527472 ) ( ON ?auto_527470 ?auto_527471 ) ( ON ?auto_527469 ?auto_527470 ) ( ON ?auto_527468 ?auto_527469 ) ( ON ?auto_527467 ?auto_527468 ) ( ON ?auto_527466 ?auto_527467 ) ( ON ?auto_527465 ?auto_527466 ) ( ON ?auto_527464 ?auto_527465 ) ( ON ?auto_527463 ?auto_527464 ) ( ON ?auto_527462 ?auto_527463 ) ( ON ?auto_527461 ?auto_527462 ) ( CLEAR ?auto_527459 ) ( ON ?auto_527460 ?auto_527461 ) ( CLEAR ?auto_527460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_527458 ?auto_527459 ?auto_527460 )
      ( MAKE-16PILE ?auto_527458 ?auto_527459 ?auto_527460 ?auto_527461 ?auto_527462 ?auto_527463 ?auto_527464 ?auto_527465 ?auto_527466 ?auto_527467 ?auto_527468 ?auto_527469 ?auto_527470 ?auto_527471 ?auto_527472 ?auto_527473 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527491 - BLOCK
      ?auto_527492 - BLOCK
      ?auto_527493 - BLOCK
      ?auto_527494 - BLOCK
      ?auto_527495 - BLOCK
      ?auto_527496 - BLOCK
      ?auto_527497 - BLOCK
      ?auto_527498 - BLOCK
      ?auto_527499 - BLOCK
      ?auto_527500 - BLOCK
      ?auto_527501 - BLOCK
      ?auto_527502 - BLOCK
      ?auto_527503 - BLOCK
      ?auto_527504 - BLOCK
      ?auto_527505 - BLOCK
      ?auto_527506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_527506 ) ( ON-TABLE ?auto_527491 ) ( ON ?auto_527492 ?auto_527491 ) ( not ( = ?auto_527491 ?auto_527492 ) ) ( not ( = ?auto_527491 ?auto_527493 ) ) ( not ( = ?auto_527491 ?auto_527494 ) ) ( not ( = ?auto_527491 ?auto_527495 ) ) ( not ( = ?auto_527491 ?auto_527496 ) ) ( not ( = ?auto_527491 ?auto_527497 ) ) ( not ( = ?auto_527491 ?auto_527498 ) ) ( not ( = ?auto_527491 ?auto_527499 ) ) ( not ( = ?auto_527491 ?auto_527500 ) ) ( not ( = ?auto_527491 ?auto_527501 ) ) ( not ( = ?auto_527491 ?auto_527502 ) ) ( not ( = ?auto_527491 ?auto_527503 ) ) ( not ( = ?auto_527491 ?auto_527504 ) ) ( not ( = ?auto_527491 ?auto_527505 ) ) ( not ( = ?auto_527491 ?auto_527506 ) ) ( not ( = ?auto_527492 ?auto_527493 ) ) ( not ( = ?auto_527492 ?auto_527494 ) ) ( not ( = ?auto_527492 ?auto_527495 ) ) ( not ( = ?auto_527492 ?auto_527496 ) ) ( not ( = ?auto_527492 ?auto_527497 ) ) ( not ( = ?auto_527492 ?auto_527498 ) ) ( not ( = ?auto_527492 ?auto_527499 ) ) ( not ( = ?auto_527492 ?auto_527500 ) ) ( not ( = ?auto_527492 ?auto_527501 ) ) ( not ( = ?auto_527492 ?auto_527502 ) ) ( not ( = ?auto_527492 ?auto_527503 ) ) ( not ( = ?auto_527492 ?auto_527504 ) ) ( not ( = ?auto_527492 ?auto_527505 ) ) ( not ( = ?auto_527492 ?auto_527506 ) ) ( not ( = ?auto_527493 ?auto_527494 ) ) ( not ( = ?auto_527493 ?auto_527495 ) ) ( not ( = ?auto_527493 ?auto_527496 ) ) ( not ( = ?auto_527493 ?auto_527497 ) ) ( not ( = ?auto_527493 ?auto_527498 ) ) ( not ( = ?auto_527493 ?auto_527499 ) ) ( not ( = ?auto_527493 ?auto_527500 ) ) ( not ( = ?auto_527493 ?auto_527501 ) ) ( not ( = ?auto_527493 ?auto_527502 ) ) ( not ( = ?auto_527493 ?auto_527503 ) ) ( not ( = ?auto_527493 ?auto_527504 ) ) ( not ( = ?auto_527493 ?auto_527505 ) ) ( not ( = ?auto_527493 ?auto_527506 ) ) ( not ( = ?auto_527494 ?auto_527495 ) ) ( not ( = ?auto_527494 ?auto_527496 ) ) ( not ( = ?auto_527494 ?auto_527497 ) ) ( not ( = ?auto_527494 ?auto_527498 ) ) ( not ( = ?auto_527494 ?auto_527499 ) ) ( not ( = ?auto_527494 ?auto_527500 ) ) ( not ( = ?auto_527494 ?auto_527501 ) ) ( not ( = ?auto_527494 ?auto_527502 ) ) ( not ( = ?auto_527494 ?auto_527503 ) ) ( not ( = ?auto_527494 ?auto_527504 ) ) ( not ( = ?auto_527494 ?auto_527505 ) ) ( not ( = ?auto_527494 ?auto_527506 ) ) ( not ( = ?auto_527495 ?auto_527496 ) ) ( not ( = ?auto_527495 ?auto_527497 ) ) ( not ( = ?auto_527495 ?auto_527498 ) ) ( not ( = ?auto_527495 ?auto_527499 ) ) ( not ( = ?auto_527495 ?auto_527500 ) ) ( not ( = ?auto_527495 ?auto_527501 ) ) ( not ( = ?auto_527495 ?auto_527502 ) ) ( not ( = ?auto_527495 ?auto_527503 ) ) ( not ( = ?auto_527495 ?auto_527504 ) ) ( not ( = ?auto_527495 ?auto_527505 ) ) ( not ( = ?auto_527495 ?auto_527506 ) ) ( not ( = ?auto_527496 ?auto_527497 ) ) ( not ( = ?auto_527496 ?auto_527498 ) ) ( not ( = ?auto_527496 ?auto_527499 ) ) ( not ( = ?auto_527496 ?auto_527500 ) ) ( not ( = ?auto_527496 ?auto_527501 ) ) ( not ( = ?auto_527496 ?auto_527502 ) ) ( not ( = ?auto_527496 ?auto_527503 ) ) ( not ( = ?auto_527496 ?auto_527504 ) ) ( not ( = ?auto_527496 ?auto_527505 ) ) ( not ( = ?auto_527496 ?auto_527506 ) ) ( not ( = ?auto_527497 ?auto_527498 ) ) ( not ( = ?auto_527497 ?auto_527499 ) ) ( not ( = ?auto_527497 ?auto_527500 ) ) ( not ( = ?auto_527497 ?auto_527501 ) ) ( not ( = ?auto_527497 ?auto_527502 ) ) ( not ( = ?auto_527497 ?auto_527503 ) ) ( not ( = ?auto_527497 ?auto_527504 ) ) ( not ( = ?auto_527497 ?auto_527505 ) ) ( not ( = ?auto_527497 ?auto_527506 ) ) ( not ( = ?auto_527498 ?auto_527499 ) ) ( not ( = ?auto_527498 ?auto_527500 ) ) ( not ( = ?auto_527498 ?auto_527501 ) ) ( not ( = ?auto_527498 ?auto_527502 ) ) ( not ( = ?auto_527498 ?auto_527503 ) ) ( not ( = ?auto_527498 ?auto_527504 ) ) ( not ( = ?auto_527498 ?auto_527505 ) ) ( not ( = ?auto_527498 ?auto_527506 ) ) ( not ( = ?auto_527499 ?auto_527500 ) ) ( not ( = ?auto_527499 ?auto_527501 ) ) ( not ( = ?auto_527499 ?auto_527502 ) ) ( not ( = ?auto_527499 ?auto_527503 ) ) ( not ( = ?auto_527499 ?auto_527504 ) ) ( not ( = ?auto_527499 ?auto_527505 ) ) ( not ( = ?auto_527499 ?auto_527506 ) ) ( not ( = ?auto_527500 ?auto_527501 ) ) ( not ( = ?auto_527500 ?auto_527502 ) ) ( not ( = ?auto_527500 ?auto_527503 ) ) ( not ( = ?auto_527500 ?auto_527504 ) ) ( not ( = ?auto_527500 ?auto_527505 ) ) ( not ( = ?auto_527500 ?auto_527506 ) ) ( not ( = ?auto_527501 ?auto_527502 ) ) ( not ( = ?auto_527501 ?auto_527503 ) ) ( not ( = ?auto_527501 ?auto_527504 ) ) ( not ( = ?auto_527501 ?auto_527505 ) ) ( not ( = ?auto_527501 ?auto_527506 ) ) ( not ( = ?auto_527502 ?auto_527503 ) ) ( not ( = ?auto_527502 ?auto_527504 ) ) ( not ( = ?auto_527502 ?auto_527505 ) ) ( not ( = ?auto_527502 ?auto_527506 ) ) ( not ( = ?auto_527503 ?auto_527504 ) ) ( not ( = ?auto_527503 ?auto_527505 ) ) ( not ( = ?auto_527503 ?auto_527506 ) ) ( not ( = ?auto_527504 ?auto_527505 ) ) ( not ( = ?auto_527504 ?auto_527506 ) ) ( not ( = ?auto_527505 ?auto_527506 ) ) ( ON ?auto_527505 ?auto_527506 ) ( ON ?auto_527504 ?auto_527505 ) ( ON ?auto_527503 ?auto_527504 ) ( ON ?auto_527502 ?auto_527503 ) ( ON ?auto_527501 ?auto_527502 ) ( ON ?auto_527500 ?auto_527501 ) ( ON ?auto_527499 ?auto_527500 ) ( ON ?auto_527498 ?auto_527499 ) ( ON ?auto_527497 ?auto_527498 ) ( ON ?auto_527496 ?auto_527497 ) ( ON ?auto_527495 ?auto_527496 ) ( ON ?auto_527494 ?auto_527495 ) ( CLEAR ?auto_527492 ) ( ON ?auto_527493 ?auto_527494 ) ( CLEAR ?auto_527493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_527491 ?auto_527492 ?auto_527493 )
      ( MAKE-16PILE ?auto_527491 ?auto_527492 ?auto_527493 ?auto_527494 ?auto_527495 ?auto_527496 ?auto_527497 ?auto_527498 ?auto_527499 ?auto_527500 ?auto_527501 ?auto_527502 ?auto_527503 ?auto_527504 ?auto_527505 ?auto_527506 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527523 - BLOCK
      ?auto_527524 - BLOCK
      ?auto_527525 - BLOCK
      ?auto_527526 - BLOCK
      ?auto_527527 - BLOCK
      ?auto_527528 - BLOCK
      ?auto_527529 - BLOCK
      ?auto_527530 - BLOCK
      ?auto_527531 - BLOCK
      ?auto_527532 - BLOCK
      ?auto_527533 - BLOCK
      ?auto_527534 - BLOCK
      ?auto_527535 - BLOCK
      ?auto_527536 - BLOCK
      ?auto_527537 - BLOCK
      ?auto_527538 - BLOCK
    )
    :vars
    (
      ?auto_527539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527538 ?auto_527539 ) ( ON-TABLE ?auto_527523 ) ( not ( = ?auto_527523 ?auto_527524 ) ) ( not ( = ?auto_527523 ?auto_527525 ) ) ( not ( = ?auto_527523 ?auto_527526 ) ) ( not ( = ?auto_527523 ?auto_527527 ) ) ( not ( = ?auto_527523 ?auto_527528 ) ) ( not ( = ?auto_527523 ?auto_527529 ) ) ( not ( = ?auto_527523 ?auto_527530 ) ) ( not ( = ?auto_527523 ?auto_527531 ) ) ( not ( = ?auto_527523 ?auto_527532 ) ) ( not ( = ?auto_527523 ?auto_527533 ) ) ( not ( = ?auto_527523 ?auto_527534 ) ) ( not ( = ?auto_527523 ?auto_527535 ) ) ( not ( = ?auto_527523 ?auto_527536 ) ) ( not ( = ?auto_527523 ?auto_527537 ) ) ( not ( = ?auto_527523 ?auto_527538 ) ) ( not ( = ?auto_527523 ?auto_527539 ) ) ( not ( = ?auto_527524 ?auto_527525 ) ) ( not ( = ?auto_527524 ?auto_527526 ) ) ( not ( = ?auto_527524 ?auto_527527 ) ) ( not ( = ?auto_527524 ?auto_527528 ) ) ( not ( = ?auto_527524 ?auto_527529 ) ) ( not ( = ?auto_527524 ?auto_527530 ) ) ( not ( = ?auto_527524 ?auto_527531 ) ) ( not ( = ?auto_527524 ?auto_527532 ) ) ( not ( = ?auto_527524 ?auto_527533 ) ) ( not ( = ?auto_527524 ?auto_527534 ) ) ( not ( = ?auto_527524 ?auto_527535 ) ) ( not ( = ?auto_527524 ?auto_527536 ) ) ( not ( = ?auto_527524 ?auto_527537 ) ) ( not ( = ?auto_527524 ?auto_527538 ) ) ( not ( = ?auto_527524 ?auto_527539 ) ) ( not ( = ?auto_527525 ?auto_527526 ) ) ( not ( = ?auto_527525 ?auto_527527 ) ) ( not ( = ?auto_527525 ?auto_527528 ) ) ( not ( = ?auto_527525 ?auto_527529 ) ) ( not ( = ?auto_527525 ?auto_527530 ) ) ( not ( = ?auto_527525 ?auto_527531 ) ) ( not ( = ?auto_527525 ?auto_527532 ) ) ( not ( = ?auto_527525 ?auto_527533 ) ) ( not ( = ?auto_527525 ?auto_527534 ) ) ( not ( = ?auto_527525 ?auto_527535 ) ) ( not ( = ?auto_527525 ?auto_527536 ) ) ( not ( = ?auto_527525 ?auto_527537 ) ) ( not ( = ?auto_527525 ?auto_527538 ) ) ( not ( = ?auto_527525 ?auto_527539 ) ) ( not ( = ?auto_527526 ?auto_527527 ) ) ( not ( = ?auto_527526 ?auto_527528 ) ) ( not ( = ?auto_527526 ?auto_527529 ) ) ( not ( = ?auto_527526 ?auto_527530 ) ) ( not ( = ?auto_527526 ?auto_527531 ) ) ( not ( = ?auto_527526 ?auto_527532 ) ) ( not ( = ?auto_527526 ?auto_527533 ) ) ( not ( = ?auto_527526 ?auto_527534 ) ) ( not ( = ?auto_527526 ?auto_527535 ) ) ( not ( = ?auto_527526 ?auto_527536 ) ) ( not ( = ?auto_527526 ?auto_527537 ) ) ( not ( = ?auto_527526 ?auto_527538 ) ) ( not ( = ?auto_527526 ?auto_527539 ) ) ( not ( = ?auto_527527 ?auto_527528 ) ) ( not ( = ?auto_527527 ?auto_527529 ) ) ( not ( = ?auto_527527 ?auto_527530 ) ) ( not ( = ?auto_527527 ?auto_527531 ) ) ( not ( = ?auto_527527 ?auto_527532 ) ) ( not ( = ?auto_527527 ?auto_527533 ) ) ( not ( = ?auto_527527 ?auto_527534 ) ) ( not ( = ?auto_527527 ?auto_527535 ) ) ( not ( = ?auto_527527 ?auto_527536 ) ) ( not ( = ?auto_527527 ?auto_527537 ) ) ( not ( = ?auto_527527 ?auto_527538 ) ) ( not ( = ?auto_527527 ?auto_527539 ) ) ( not ( = ?auto_527528 ?auto_527529 ) ) ( not ( = ?auto_527528 ?auto_527530 ) ) ( not ( = ?auto_527528 ?auto_527531 ) ) ( not ( = ?auto_527528 ?auto_527532 ) ) ( not ( = ?auto_527528 ?auto_527533 ) ) ( not ( = ?auto_527528 ?auto_527534 ) ) ( not ( = ?auto_527528 ?auto_527535 ) ) ( not ( = ?auto_527528 ?auto_527536 ) ) ( not ( = ?auto_527528 ?auto_527537 ) ) ( not ( = ?auto_527528 ?auto_527538 ) ) ( not ( = ?auto_527528 ?auto_527539 ) ) ( not ( = ?auto_527529 ?auto_527530 ) ) ( not ( = ?auto_527529 ?auto_527531 ) ) ( not ( = ?auto_527529 ?auto_527532 ) ) ( not ( = ?auto_527529 ?auto_527533 ) ) ( not ( = ?auto_527529 ?auto_527534 ) ) ( not ( = ?auto_527529 ?auto_527535 ) ) ( not ( = ?auto_527529 ?auto_527536 ) ) ( not ( = ?auto_527529 ?auto_527537 ) ) ( not ( = ?auto_527529 ?auto_527538 ) ) ( not ( = ?auto_527529 ?auto_527539 ) ) ( not ( = ?auto_527530 ?auto_527531 ) ) ( not ( = ?auto_527530 ?auto_527532 ) ) ( not ( = ?auto_527530 ?auto_527533 ) ) ( not ( = ?auto_527530 ?auto_527534 ) ) ( not ( = ?auto_527530 ?auto_527535 ) ) ( not ( = ?auto_527530 ?auto_527536 ) ) ( not ( = ?auto_527530 ?auto_527537 ) ) ( not ( = ?auto_527530 ?auto_527538 ) ) ( not ( = ?auto_527530 ?auto_527539 ) ) ( not ( = ?auto_527531 ?auto_527532 ) ) ( not ( = ?auto_527531 ?auto_527533 ) ) ( not ( = ?auto_527531 ?auto_527534 ) ) ( not ( = ?auto_527531 ?auto_527535 ) ) ( not ( = ?auto_527531 ?auto_527536 ) ) ( not ( = ?auto_527531 ?auto_527537 ) ) ( not ( = ?auto_527531 ?auto_527538 ) ) ( not ( = ?auto_527531 ?auto_527539 ) ) ( not ( = ?auto_527532 ?auto_527533 ) ) ( not ( = ?auto_527532 ?auto_527534 ) ) ( not ( = ?auto_527532 ?auto_527535 ) ) ( not ( = ?auto_527532 ?auto_527536 ) ) ( not ( = ?auto_527532 ?auto_527537 ) ) ( not ( = ?auto_527532 ?auto_527538 ) ) ( not ( = ?auto_527532 ?auto_527539 ) ) ( not ( = ?auto_527533 ?auto_527534 ) ) ( not ( = ?auto_527533 ?auto_527535 ) ) ( not ( = ?auto_527533 ?auto_527536 ) ) ( not ( = ?auto_527533 ?auto_527537 ) ) ( not ( = ?auto_527533 ?auto_527538 ) ) ( not ( = ?auto_527533 ?auto_527539 ) ) ( not ( = ?auto_527534 ?auto_527535 ) ) ( not ( = ?auto_527534 ?auto_527536 ) ) ( not ( = ?auto_527534 ?auto_527537 ) ) ( not ( = ?auto_527534 ?auto_527538 ) ) ( not ( = ?auto_527534 ?auto_527539 ) ) ( not ( = ?auto_527535 ?auto_527536 ) ) ( not ( = ?auto_527535 ?auto_527537 ) ) ( not ( = ?auto_527535 ?auto_527538 ) ) ( not ( = ?auto_527535 ?auto_527539 ) ) ( not ( = ?auto_527536 ?auto_527537 ) ) ( not ( = ?auto_527536 ?auto_527538 ) ) ( not ( = ?auto_527536 ?auto_527539 ) ) ( not ( = ?auto_527537 ?auto_527538 ) ) ( not ( = ?auto_527537 ?auto_527539 ) ) ( not ( = ?auto_527538 ?auto_527539 ) ) ( ON ?auto_527537 ?auto_527538 ) ( ON ?auto_527536 ?auto_527537 ) ( ON ?auto_527535 ?auto_527536 ) ( ON ?auto_527534 ?auto_527535 ) ( ON ?auto_527533 ?auto_527534 ) ( ON ?auto_527532 ?auto_527533 ) ( ON ?auto_527531 ?auto_527532 ) ( ON ?auto_527530 ?auto_527531 ) ( ON ?auto_527529 ?auto_527530 ) ( ON ?auto_527528 ?auto_527529 ) ( ON ?auto_527527 ?auto_527528 ) ( ON ?auto_527526 ?auto_527527 ) ( ON ?auto_527525 ?auto_527526 ) ( CLEAR ?auto_527523 ) ( ON ?auto_527524 ?auto_527525 ) ( CLEAR ?auto_527524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_527523 ?auto_527524 )
      ( MAKE-16PILE ?auto_527523 ?auto_527524 ?auto_527525 ?auto_527526 ?auto_527527 ?auto_527528 ?auto_527529 ?auto_527530 ?auto_527531 ?auto_527532 ?auto_527533 ?auto_527534 ?auto_527535 ?auto_527536 ?auto_527537 ?auto_527538 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527556 - BLOCK
      ?auto_527557 - BLOCK
      ?auto_527558 - BLOCK
      ?auto_527559 - BLOCK
      ?auto_527560 - BLOCK
      ?auto_527561 - BLOCK
      ?auto_527562 - BLOCK
      ?auto_527563 - BLOCK
      ?auto_527564 - BLOCK
      ?auto_527565 - BLOCK
      ?auto_527566 - BLOCK
      ?auto_527567 - BLOCK
      ?auto_527568 - BLOCK
      ?auto_527569 - BLOCK
      ?auto_527570 - BLOCK
      ?auto_527571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_527571 ) ( ON-TABLE ?auto_527556 ) ( not ( = ?auto_527556 ?auto_527557 ) ) ( not ( = ?auto_527556 ?auto_527558 ) ) ( not ( = ?auto_527556 ?auto_527559 ) ) ( not ( = ?auto_527556 ?auto_527560 ) ) ( not ( = ?auto_527556 ?auto_527561 ) ) ( not ( = ?auto_527556 ?auto_527562 ) ) ( not ( = ?auto_527556 ?auto_527563 ) ) ( not ( = ?auto_527556 ?auto_527564 ) ) ( not ( = ?auto_527556 ?auto_527565 ) ) ( not ( = ?auto_527556 ?auto_527566 ) ) ( not ( = ?auto_527556 ?auto_527567 ) ) ( not ( = ?auto_527556 ?auto_527568 ) ) ( not ( = ?auto_527556 ?auto_527569 ) ) ( not ( = ?auto_527556 ?auto_527570 ) ) ( not ( = ?auto_527556 ?auto_527571 ) ) ( not ( = ?auto_527557 ?auto_527558 ) ) ( not ( = ?auto_527557 ?auto_527559 ) ) ( not ( = ?auto_527557 ?auto_527560 ) ) ( not ( = ?auto_527557 ?auto_527561 ) ) ( not ( = ?auto_527557 ?auto_527562 ) ) ( not ( = ?auto_527557 ?auto_527563 ) ) ( not ( = ?auto_527557 ?auto_527564 ) ) ( not ( = ?auto_527557 ?auto_527565 ) ) ( not ( = ?auto_527557 ?auto_527566 ) ) ( not ( = ?auto_527557 ?auto_527567 ) ) ( not ( = ?auto_527557 ?auto_527568 ) ) ( not ( = ?auto_527557 ?auto_527569 ) ) ( not ( = ?auto_527557 ?auto_527570 ) ) ( not ( = ?auto_527557 ?auto_527571 ) ) ( not ( = ?auto_527558 ?auto_527559 ) ) ( not ( = ?auto_527558 ?auto_527560 ) ) ( not ( = ?auto_527558 ?auto_527561 ) ) ( not ( = ?auto_527558 ?auto_527562 ) ) ( not ( = ?auto_527558 ?auto_527563 ) ) ( not ( = ?auto_527558 ?auto_527564 ) ) ( not ( = ?auto_527558 ?auto_527565 ) ) ( not ( = ?auto_527558 ?auto_527566 ) ) ( not ( = ?auto_527558 ?auto_527567 ) ) ( not ( = ?auto_527558 ?auto_527568 ) ) ( not ( = ?auto_527558 ?auto_527569 ) ) ( not ( = ?auto_527558 ?auto_527570 ) ) ( not ( = ?auto_527558 ?auto_527571 ) ) ( not ( = ?auto_527559 ?auto_527560 ) ) ( not ( = ?auto_527559 ?auto_527561 ) ) ( not ( = ?auto_527559 ?auto_527562 ) ) ( not ( = ?auto_527559 ?auto_527563 ) ) ( not ( = ?auto_527559 ?auto_527564 ) ) ( not ( = ?auto_527559 ?auto_527565 ) ) ( not ( = ?auto_527559 ?auto_527566 ) ) ( not ( = ?auto_527559 ?auto_527567 ) ) ( not ( = ?auto_527559 ?auto_527568 ) ) ( not ( = ?auto_527559 ?auto_527569 ) ) ( not ( = ?auto_527559 ?auto_527570 ) ) ( not ( = ?auto_527559 ?auto_527571 ) ) ( not ( = ?auto_527560 ?auto_527561 ) ) ( not ( = ?auto_527560 ?auto_527562 ) ) ( not ( = ?auto_527560 ?auto_527563 ) ) ( not ( = ?auto_527560 ?auto_527564 ) ) ( not ( = ?auto_527560 ?auto_527565 ) ) ( not ( = ?auto_527560 ?auto_527566 ) ) ( not ( = ?auto_527560 ?auto_527567 ) ) ( not ( = ?auto_527560 ?auto_527568 ) ) ( not ( = ?auto_527560 ?auto_527569 ) ) ( not ( = ?auto_527560 ?auto_527570 ) ) ( not ( = ?auto_527560 ?auto_527571 ) ) ( not ( = ?auto_527561 ?auto_527562 ) ) ( not ( = ?auto_527561 ?auto_527563 ) ) ( not ( = ?auto_527561 ?auto_527564 ) ) ( not ( = ?auto_527561 ?auto_527565 ) ) ( not ( = ?auto_527561 ?auto_527566 ) ) ( not ( = ?auto_527561 ?auto_527567 ) ) ( not ( = ?auto_527561 ?auto_527568 ) ) ( not ( = ?auto_527561 ?auto_527569 ) ) ( not ( = ?auto_527561 ?auto_527570 ) ) ( not ( = ?auto_527561 ?auto_527571 ) ) ( not ( = ?auto_527562 ?auto_527563 ) ) ( not ( = ?auto_527562 ?auto_527564 ) ) ( not ( = ?auto_527562 ?auto_527565 ) ) ( not ( = ?auto_527562 ?auto_527566 ) ) ( not ( = ?auto_527562 ?auto_527567 ) ) ( not ( = ?auto_527562 ?auto_527568 ) ) ( not ( = ?auto_527562 ?auto_527569 ) ) ( not ( = ?auto_527562 ?auto_527570 ) ) ( not ( = ?auto_527562 ?auto_527571 ) ) ( not ( = ?auto_527563 ?auto_527564 ) ) ( not ( = ?auto_527563 ?auto_527565 ) ) ( not ( = ?auto_527563 ?auto_527566 ) ) ( not ( = ?auto_527563 ?auto_527567 ) ) ( not ( = ?auto_527563 ?auto_527568 ) ) ( not ( = ?auto_527563 ?auto_527569 ) ) ( not ( = ?auto_527563 ?auto_527570 ) ) ( not ( = ?auto_527563 ?auto_527571 ) ) ( not ( = ?auto_527564 ?auto_527565 ) ) ( not ( = ?auto_527564 ?auto_527566 ) ) ( not ( = ?auto_527564 ?auto_527567 ) ) ( not ( = ?auto_527564 ?auto_527568 ) ) ( not ( = ?auto_527564 ?auto_527569 ) ) ( not ( = ?auto_527564 ?auto_527570 ) ) ( not ( = ?auto_527564 ?auto_527571 ) ) ( not ( = ?auto_527565 ?auto_527566 ) ) ( not ( = ?auto_527565 ?auto_527567 ) ) ( not ( = ?auto_527565 ?auto_527568 ) ) ( not ( = ?auto_527565 ?auto_527569 ) ) ( not ( = ?auto_527565 ?auto_527570 ) ) ( not ( = ?auto_527565 ?auto_527571 ) ) ( not ( = ?auto_527566 ?auto_527567 ) ) ( not ( = ?auto_527566 ?auto_527568 ) ) ( not ( = ?auto_527566 ?auto_527569 ) ) ( not ( = ?auto_527566 ?auto_527570 ) ) ( not ( = ?auto_527566 ?auto_527571 ) ) ( not ( = ?auto_527567 ?auto_527568 ) ) ( not ( = ?auto_527567 ?auto_527569 ) ) ( not ( = ?auto_527567 ?auto_527570 ) ) ( not ( = ?auto_527567 ?auto_527571 ) ) ( not ( = ?auto_527568 ?auto_527569 ) ) ( not ( = ?auto_527568 ?auto_527570 ) ) ( not ( = ?auto_527568 ?auto_527571 ) ) ( not ( = ?auto_527569 ?auto_527570 ) ) ( not ( = ?auto_527569 ?auto_527571 ) ) ( not ( = ?auto_527570 ?auto_527571 ) ) ( ON ?auto_527570 ?auto_527571 ) ( ON ?auto_527569 ?auto_527570 ) ( ON ?auto_527568 ?auto_527569 ) ( ON ?auto_527567 ?auto_527568 ) ( ON ?auto_527566 ?auto_527567 ) ( ON ?auto_527565 ?auto_527566 ) ( ON ?auto_527564 ?auto_527565 ) ( ON ?auto_527563 ?auto_527564 ) ( ON ?auto_527562 ?auto_527563 ) ( ON ?auto_527561 ?auto_527562 ) ( ON ?auto_527560 ?auto_527561 ) ( ON ?auto_527559 ?auto_527560 ) ( ON ?auto_527558 ?auto_527559 ) ( CLEAR ?auto_527556 ) ( ON ?auto_527557 ?auto_527558 ) ( CLEAR ?auto_527557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_527556 ?auto_527557 )
      ( MAKE-16PILE ?auto_527556 ?auto_527557 ?auto_527558 ?auto_527559 ?auto_527560 ?auto_527561 ?auto_527562 ?auto_527563 ?auto_527564 ?auto_527565 ?auto_527566 ?auto_527567 ?auto_527568 ?auto_527569 ?auto_527570 ?auto_527571 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527588 - BLOCK
      ?auto_527589 - BLOCK
      ?auto_527590 - BLOCK
      ?auto_527591 - BLOCK
      ?auto_527592 - BLOCK
      ?auto_527593 - BLOCK
      ?auto_527594 - BLOCK
      ?auto_527595 - BLOCK
      ?auto_527596 - BLOCK
      ?auto_527597 - BLOCK
      ?auto_527598 - BLOCK
      ?auto_527599 - BLOCK
      ?auto_527600 - BLOCK
      ?auto_527601 - BLOCK
      ?auto_527602 - BLOCK
      ?auto_527603 - BLOCK
    )
    :vars
    (
      ?auto_527604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527603 ?auto_527604 ) ( not ( = ?auto_527588 ?auto_527589 ) ) ( not ( = ?auto_527588 ?auto_527590 ) ) ( not ( = ?auto_527588 ?auto_527591 ) ) ( not ( = ?auto_527588 ?auto_527592 ) ) ( not ( = ?auto_527588 ?auto_527593 ) ) ( not ( = ?auto_527588 ?auto_527594 ) ) ( not ( = ?auto_527588 ?auto_527595 ) ) ( not ( = ?auto_527588 ?auto_527596 ) ) ( not ( = ?auto_527588 ?auto_527597 ) ) ( not ( = ?auto_527588 ?auto_527598 ) ) ( not ( = ?auto_527588 ?auto_527599 ) ) ( not ( = ?auto_527588 ?auto_527600 ) ) ( not ( = ?auto_527588 ?auto_527601 ) ) ( not ( = ?auto_527588 ?auto_527602 ) ) ( not ( = ?auto_527588 ?auto_527603 ) ) ( not ( = ?auto_527588 ?auto_527604 ) ) ( not ( = ?auto_527589 ?auto_527590 ) ) ( not ( = ?auto_527589 ?auto_527591 ) ) ( not ( = ?auto_527589 ?auto_527592 ) ) ( not ( = ?auto_527589 ?auto_527593 ) ) ( not ( = ?auto_527589 ?auto_527594 ) ) ( not ( = ?auto_527589 ?auto_527595 ) ) ( not ( = ?auto_527589 ?auto_527596 ) ) ( not ( = ?auto_527589 ?auto_527597 ) ) ( not ( = ?auto_527589 ?auto_527598 ) ) ( not ( = ?auto_527589 ?auto_527599 ) ) ( not ( = ?auto_527589 ?auto_527600 ) ) ( not ( = ?auto_527589 ?auto_527601 ) ) ( not ( = ?auto_527589 ?auto_527602 ) ) ( not ( = ?auto_527589 ?auto_527603 ) ) ( not ( = ?auto_527589 ?auto_527604 ) ) ( not ( = ?auto_527590 ?auto_527591 ) ) ( not ( = ?auto_527590 ?auto_527592 ) ) ( not ( = ?auto_527590 ?auto_527593 ) ) ( not ( = ?auto_527590 ?auto_527594 ) ) ( not ( = ?auto_527590 ?auto_527595 ) ) ( not ( = ?auto_527590 ?auto_527596 ) ) ( not ( = ?auto_527590 ?auto_527597 ) ) ( not ( = ?auto_527590 ?auto_527598 ) ) ( not ( = ?auto_527590 ?auto_527599 ) ) ( not ( = ?auto_527590 ?auto_527600 ) ) ( not ( = ?auto_527590 ?auto_527601 ) ) ( not ( = ?auto_527590 ?auto_527602 ) ) ( not ( = ?auto_527590 ?auto_527603 ) ) ( not ( = ?auto_527590 ?auto_527604 ) ) ( not ( = ?auto_527591 ?auto_527592 ) ) ( not ( = ?auto_527591 ?auto_527593 ) ) ( not ( = ?auto_527591 ?auto_527594 ) ) ( not ( = ?auto_527591 ?auto_527595 ) ) ( not ( = ?auto_527591 ?auto_527596 ) ) ( not ( = ?auto_527591 ?auto_527597 ) ) ( not ( = ?auto_527591 ?auto_527598 ) ) ( not ( = ?auto_527591 ?auto_527599 ) ) ( not ( = ?auto_527591 ?auto_527600 ) ) ( not ( = ?auto_527591 ?auto_527601 ) ) ( not ( = ?auto_527591 ?auto_527602 ) ) ( not ( = ?auto_527591 ?auto_527603 ) ) ( not ( = ?auto_527591 ?auto_527604 ) ) ( not ( = ?auto_527592 ?auto_527593 ) ) ( not ( = ?auto_527592 ?auto_527594 ) ) ( not ( = ?auto_527592 ?auto_527595 ) ) ( not ( = ?auto_527592 ?auto_527596 ) ) ( not ( = ?auto_527592 ?auto_527597 ) ) ( not ( = ?auto_527592 ?auto_527598 ) ) ( not ( = ?auto_527592 ?auto_527599 ) ) ( not ( = ?auto_527592 ?auto_527600 ) ) ( not ( = ?auto_527592 ?auto_527601 ) ) ( not ( = ?auto_527592 ?auto_527602 ) ) ( not ( = ?auto_527592 ?auto_527603 ) ) ( not ( = ?auto_527592 ?auto_527604 ) ) ( not ( = ?auto_527593 ?auto_527594 ) ) ( not ( = ?auto_527593 ?auto_527595 ) ) ( not ( = ?auto_527593 ?auto_527596 ) ) ( not ( = ?auto_527593 ?auto_527597 ) ) ( not ( = ?auto_527593 ?auto_527598 ) ) ( not ( = ?auto_527593 ?auto_527599 ) ) ( not ( = ?auto_527593 ?auto_527600 ) ) ( not ( = ?auto_527593 ?auto_527601 ) ) ( not ( = ?auto_527593 ?auto_527602 ) ) ( not ( = ?auto_527593 ?auto_527603 ) ) ( not ( = ?auto_527593 ?auto_527604 ) ) ( not ( = ?auto_527594 ?auto_527595 ) ) ( not ( = ?auto_527594 ?auto_527596 ) ) ( not ( = ?auto_527594 ?auto_527597 ) ) ( not ( = ?auto_527594 ?auto_527598 ) ) ( not ( = ?auto_527594 ?auto_527599 ) ) ( not ( = ?auto_527594 ?auto_527600 ) ) ( not ( = ?auto_527594 ?auto_527601 ) ) ( not ( = ?auto_527594 ?auto_527602 ) ) ( not ( = ?auto_527594 ?auto_527603 ) ) ( not ( = ?auto_527594 ?auto_527604 ) ) ( not ( = ?auto_527595 ?auto_527596 ) ) ( not ( = ?auto_527595 ?auto_527597 ) ) ( not ( = ?auto_527595 ?auto_527598 ) ) ( not ( = ?auto_527595 ?auto_527599 ) ) ( not ( = ?auto_527595 ?auto_527600 ) ) ( not ( = ?auto_527595 ?auto_527601 ) ) ( not ( = ?auto_527595 ?auto_527602 ) ) ( not ( = ?auto_527595 ?auto_527603 ) ) ( not ( = ?auto_527595 ?auto_527604 ) ) ( not ( = ?auto_527596 ?auto_527597 ) ) ( not ( = ?auto_527596 ?auto_527598 ) ) ( not ( = ?auto_527596 ?auto_527599 ) ) ( not ( = ?auto_527596 ?auto_527600 ) ) ( not ( = ?auto_527596 ?auto_527601 ) ) ( not ( = ?auto_527596 ?auto_527602 ) ) ( not ( = ?auto_527596 ?auto_527603 ) ) ( not ( = ?auto_527596 ?auto_527604 ) ) ( not ( = ?auto_527597 ?auto_527598 ) ) ( not ( = ?auto_527597 ?auto_527599 ) ) ( not ( = ?auto_527597 ?auto_527600 ) ) ( not ( = ?auto_527597 ?auto_527601 ) ) ( not ( = ?auto_527597 ?auto_527602 ) ) ( not ( = ?auto_527597 ?auto_527603 ) ) ( not ( = ?auto_527597 ?auto_527604 ) ) ( not ( = ?auto_527598 ?auto_527599 ) ) ( not ( = ?auto_527598 ?auto_527600 ) ) ( not ( = ?auto_527598 ?auto_527601 ) ) ( not ( = ?auto_527598 ?auto_527602 ) ) ( not ( = ?auto_527598 ?auto_527603 ) ) ( not ( = ?auto_527598 ?auto_527604 ) ) ( not ( = ?auto_527599 ?auto_527600 ) ) ( not ( = ?auto_527599 ?auto_527601 ) ) ( not ( = ?auto_527599 ?auto_527602 ) ) ( not ( = ?auto_527599 ?auto_527603 ) ) ( not ( = ?auto_527599 ?auto_527604 ) ) ( not ( = ?auto_527600 ?auto_527601 ) ) ( not ( = ?auto_527600 ?auto_527602 ) ) ( not ( = ?auto_527600 ?auto_527603 ) ) ( not ( = ?auto_527600 ?auto_527604 ) ) ( not ( = ?auto_527601 ?auto_527602 ) ) ( not ( = ?auto_527601 ?auto_527603 ) ) ( not ( = ?auto_527601 ?auto_527604 ) ) ( not ( = ?auto_527602 ?auto_527603 ) ) ( not ( = ?auto_527602 ?auto_527604 ) ) ( not ( = ?auto_527603 ?auto_527604 ) ) ( ON ?auto_527602 ?auto_527603 ) ( ON ?auto_527601 ?auto_527602 ) ( ON ?auto_527600 ?auto_527601 ) ( ON ?auto_527599 ?auto_527600 ) ( ON ?auto_527598 ?auto_527599 ) ( ON ?auto_527597 ?auto_527598 ) ( ON ?auto_527596 ?auto_527597 ) ( ON ?auto_527595 ?auto_527596 ) ( ON ?auto_527594 ?auto_527595 ) ( ON ?auto_527593 ?auto_527594 ) ( ON ?auto_527592 ?auto_527593 ) ( ON ?auto_527591 ?auto_527592 ) ( ON ?auto_527590 ?auto_527591 ) ( ON ?auto_527589 ?auto_527590 ) ( ON ?auto_527588 ?auto_527589 ) ( CLEAR ?auto_527588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_527588 )
      ( MAKE-16PILE ?auto_527588 ?auto_527589 ?auto_527590 ?auto_527591 ?auto_527592 ?auto_527593 ?auto_527594 ?auto_527595 ?auto_527596 ?auto_527597 ?auto_527598 ?auto_527599 ?auto_527600 ?auto_527601 ?auto_527602 ?auto_527603 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527621 - BLOCK
      ?auto_527622 - BLOCK
      ?auto_527623 - BLOCK
      ?auto_527624 - BLOCK
      ?auto_527625 - BLOCK
      ?auto_527626 - BLOCK
      ?auto_527627 - BLOCK
      ?auto_527628 - BLOCK
      ?auto_527629 - BLOCK
      ?auto_527630 - BLOCK
      ?auto_527631 - BLOCK
      ?auto_527632 - BLOCK
      ?auto_527633 - BLOCK
      ?auto_527634 - BLOCK
      ?auto_527635 - BLOCK
      ?auto_527636 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_527636 ) ( not ( = ?auto_527621 ?auto_527622 ) ) ( not ( = ?auto_527621 ?auto_527623 ) ) ( not ( = ?auto_527621 ?auto_527624 ) ) ( not ( = ?auto_527621 ?auto_527625 ) ) ( not ( = ?auto_527621 ?auto_527626 ) ) ( not ( = ?auto_527621 ?auto_527627 ) ) ( not ( = ?auto_527621 ?auto_527628 ) ) ( not ( = ?auto_527621 ?auto_527629 ) ) ( not ( = ?auto_527621 ?auto_527630 ) ) ( not ( = ?auto_527621 ?auto_527631 ) ) ( not ( = ?auto_527621 ?auto_527632 ) ) ( not ( = ?auto_527621 ?auto_527633 ) ) ( not ( = ?auto_527621 ?auto_527634 ) ) ( not ( = ?auto_527621 ?auto_527635 ) ) ( not ( = ?auto_527621 ?auto_527636 ) ) ( not ( = ?auto_527622 ?auto_527623 ) ) ( not ( = ?auto_527622 ?auto_527624 ) ) ( not ( = ?auto_527622 ?auto_527625 ) ) ( not ( = ?auto_527622 ?auto_527626 ) ) ( not ( = ?auto_527622 ?auto_527627 ) ) ( not ( = ?auto_527622 ?auto_527628 ) ) ( not ( = ?auto_527622 ?auto_527629 ) ) ( not ( = ?auto_527622 ?auto_527630 ) ) ( not ( = ?auto_527622 ?auto_527631 ) ) ( not ( = ?auto_527622 ?auto_527632 ) ) ( not ( = ?auto_527622 ?auto_527633 ) ) ( not ( = ?auto_527622 ?auto_527634 ) ) ( not ( = ?auto_527622 ?auto_527635 ) ) ( not ( = ?auto_527622 ?auto_527636 ) ) ( not ( = ?auto_527623 ?auto_527624 ) ) ( not ( = ?auto_527623 ?auto_527625 ) ) ( not ( = ?auto_527623 ?auto_527626 ) ) ( not ( = ?auto_527623 ?auto_527627 ) ) ( not ( = ?auto_527623 ?auto_527628 ) ) ( not ( = ?auto_527623 ?auto_527629 ) ) ( not ( = ?auto_527623 ?auto_527630 ) ) ( not ( = ?auto_527623 ?auto_527631 ) ) ( not ( = ?auto_527623 ?auto_527632 ) ) ( not ( = ?auto_527623 ?auto_527633 ) ) ( not ( = ?auto_527623 ?auto_527634 ) ) ( not ( = ?auto_527623 ?auto_527635 ) ) ( not ( = ?auto_527623 ?auto_527636 ) ) ( not ( = ?auto_527624 ?auto_527625 ) ) ( not ( = ?auto_527624 ?auto_527626 ) ) ( not ( = ?auto_527624 ?auto_527627 ) ) ( not ( = ?auto_527624 ?auto_527628 ) ) ( not ( = ?auto_527624 ?auto_527629 ) ) ( not ( = ?auto_527624 ?auto_527630 ) ) ( not ( = ?auto_527624 ?auto_527631 ) ) ( not ( = ?auto_527624 ?auto_527632 ) ) ( not ( = ?auto_527624 ?auto_527633 ) ) ( not ( = ?auto_527624 ?auto_527634 ) ) ( not ( = ?auto_527624 ?auto_527635 ) ) ( not ( = ?auto_527624 ?auto_527636 ) ) ( not ( = ?auto_527625 ?auto_527626 ) ) ( not ( = ?auto_527625 ?auto_527627 ) ) ( not ( = ?auto_527625 ?auto_527628 ) ) ( not ( = ?auto_527625 ?auto_527629 ) ) ( not ( = ?auto_527625 ?auto_527630 ) ) ( not ( = ?auto_527625 ?auto_527631 ) ) ( not ( = ?auto_527625 ?auto_527632 ) ) ( not ( = ?auto_527625 ?auto_527633 ) ) ( not ( = ?auto_527625 ?auto_527634 ) ) ( not ( = ?auto_527625 ?auto_527635 ) ) ( not ( = ?auto_527625 ?auto_527636 ) ) ( not ( = ?auto_527626 ?auto_527627 ) ) ( not ( = ?auto_527626 ?auto_527628 ) ) ( not ( = ?auto_527626 ?auto_527629 ) ) ( not ( = ?auto_527626 ?auto_527630 ) ) ( not ( = ?auto_527626 ?auto_527631 ) ) ( not ( = ?auto_527626 ?auto_527632 ) ) ( not ( = ?auto_527626 ?auto_527633 ) ) ( not ( = ?auto_527626 ?auto_527634 ) ) ( not ( = ?auto_527626 ?auto_527635 ) ) ( not ( = ?auto_527626 ?auto_527636 ) ) ( not ( = ?auto_527627 ?auto_527628 ) ) ( not ( = ?auto_527627 ?auto_527629 ) ) ( not ( = ?auto_527627 ?auto_527630 ) ) ( not ( = ?auto_527627 ?auto_527631 ) ) ( not ( = ?auto_527627 ?auto_527632 ) ) ( not ( = ?auto_527627 ?auto_527633 ) ) ( not ( = ?auto_527627 ?auto_527634 ) ) ( not ( = ?auto_527627 ?auto_527635 ) ) ( not ( = ?auto_527627 ?auto_527636 ) ) ( not ( = ?auto_527628 ?auto_527629 ) ) ( not ( = ?auto_527628 ?auto_527630 ) ) ( not ( = ?auto_527628 ?auto_527631 ) ) ( not ( = ?auto_527628 ?auto_527632 ) ) ( not ( = ?auto_527628 ?auto_527633 ) ) ( not ( = ?auto_527628 ?auto_527634 ) ) ( not ( = ?auto_527628 ?auto_527635 ) ) ( not ( = ?auto_527628 ?auto_527636 ) ) ( not ( = ?auto_527629 ?auto_527630 ) ) ( not ( = ?auto_527629 ?auto_527631 ) ) ( not ( = ?auto_527629 ?auto_527632 ) ) ( not ( = ?auto_527629 ?auto_527633 ) ) ( not ( = ?auto_527629 ?auto_527634 ) ) ( not ( = ?auto_527629 ?auto_527635 ) ) ( not ( = ?auto_527629 ?auto_527636 ) ) ( not ( = ?auto_527630 ?auto_527631 ) ) ( not ( = ?auto_527630 ?auto_527632 ) ) ( not ( = ?auto_527630 ?auto_527633 ) ) ( not ( = ?auto_527630 ?auto_527634 ) ) ( not ( = ?auto_527630 ?auto_527635 ) ) ( not ( = ?auto_527630 ?auto_527636 ) ) ( not ( = ?auto_527631 ?auto_527632 ) ) ( not ( = ?auto_527631 ?auto_527633 ) ) ( not ( = ?auto_527631 ?auto_527634 ) ) ( not ( = ?auto_527631 ?auto_527635 ) ) ( not ( = ?auto_527631 ?auto_527636 ) ) ( not ( = ?auto_527632 ?auto_527633 ) ) ( not ( = ?auto_527632 ?auto_527634 ) ) ( not ( = ?auto_527632 ?auto_527635 ) ) ( not ( = ?auto_527632 ?auto_527636 ) ) ( not ( = ?auto_527633 ?auto_527634 ) ) ( not ( = ?auto_527633 ?auto_527635 ) ) ( not ( = ?auto_527633 ?auto_527636 ) ) ( not ( = ?auto_527634 ?auto_527635 ) ) ( not ( = ?auto_527634 ?auto_527636 ) ) ( not ( = ?auto_527635 ?auto_527636 ) ) ( ON ?auto_527635 ?auto_527636 ) ( ON ?auto_527634 ?auto_527635 ) ( ON ?auto_527633 ?auto_527634 ) ( ON ?auto_527632 ?auto_527633 ) ( ON ?auto_527631 ?auto_527632 ) ( ON ?auto_527630 ?auto_527631 ) ( ON ?auto_527629 ?auto_527630 ) ( ON ?auto_527628 ?auto_527629 ) ( ON ?auto_527627 ?auto_527628 ) ( ON ?auto_527626 ?auto_527627 ) ( ON ?auto_527625 ?auto_527626 ) ( ON ?auto_527624 ?auto_527625 ) ( ON ?auto_527623 ?auto_527624 ) ( ON ?auto_527622 ?auto_527623 ) ( ON ?auto_527621 ?auto_527622 ) ( CLEAR ?auto_527621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_527621 )
      ( MAKE-16PILE ?auto_527621 ?auto_527622 ?auto_527623 ?auto_527624 ?auto_527625 ?auto_527626 ?auto_527627 ?auto_527628 ?auto_527629 ?auto_527630 ?auto_527631 ?auto_527632 ?auto_527633 ?auto_527634 ?auto_527635 ?auto_527636 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_527653 - BLOCK
      ?auto_527654 - BLOCK
      ?auto_527655 - BLOCK
      ?auto_527656 - BLOCK
      ?auto_527657 - BLOCK
      ?auto_527658 - BLOCK
      ?auto_527659 - BLOCK
      ?auto_527660 - BLOCK
      ?auto_527661 - BLOCK
      ?auto_527662 - BLOCK
      ?auto_527663 - BLOCK
      ?auto_527664 - BLOCK
      ?auto_527665 - BLOCK
      ?auto_527666 - BLOCK
      ?auto_527667 - BLOCK
      ?auto_527668 - BLOCK
    )
    :vars
    (
      ?auto_527669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_527653 ?auto_527654 ) ) ( not ( = ?auto_527653 ?auto_527655 ) ) ( not ( = ?auto_527653 ?auto_527656 ) ) ( not ( = ?auto_527653 ?auto_527657 ) ) ( not ( = ?auto_527653 ?auto_527658 ) ) ( not ( = ?auto_527653 ?auto_527659 ) ) ( not ( = ?auto_527653 ?auto_527660 ) ) ( not ( = ?auto_527653 ?auto_527661 ) ) ( not ( = ?auto_527653 ?auto_527662 ) ) ( not ( = ?auto_527653 ?auto_527663 ) ) ( not ( = ?auto_527653 ?auto_527664 ) ) ( not ( = ?auto_527653 ?auto_527665 ) ) ( not ( = ?auto_527653 ?auto_527666 ) ) ( not ( = ?auto_527653 ?auto_527667 ) ) ( not ( = ?auto_527653 ?auto_527668 ) ) ( not ( = ?auto_527654 ?auto_527655 ) ) ( not ( = ?auto_527654 ?auto_527656 ) ) ( not ( = ?auto_527654 ?auto_527657 ) ) ( not ( = ?auto_527654 ?auto_527658 ) ) ( not ( = ?auto_527654 ?auto_527659 ) ) ( not ( = ?auto_527654 ?auto_527660 ) ) ( not ( = ?auto_527654 ?auto_527661 ) ) ( not ( = ?auto_527654 ?auto_527662 ) ) ( not ( = ?auto_527654 ?auto_527663 ) ) ( not ( = ?auto_527654 ?auto_527664 ) ) ( not ( = ?auto_527654 ?auto_527665 ) ) ( not ( = ?auto_527654 ?auto_527666 ) ) ( not ( = ?auto_527654 ?auto_527667 ) ) ( not ( = ?auto_527654 ?auto_527668 ) ) ( not ( = ?auto_527655 ?auto_527656 ) ) ( not ( = ?auto_527655 ?auto_527657 ) ) ( not ( = ?auto_527655 ?auto_527658 ) ) ( not ( = ?auto_527655 ?auto_527659 ) ) ( not ( = ?auto_527655 ?auto_527660 ) ) ( not ( = ?auto_527655 ?auto_527661 ) ) ( not ( = ?auto_527655 ?auto_527662 ) ) ( not ( = ?auto_527655 ?auto_527663 ) ) ( not ( = ?auto_527655 ?auto_527664 ) ) ( not ( = ?auto_527655 ?auto_527665 ) ) ( not ( = ?auto_527655 ?auto_527666 ) ) ( not ( = ?auto_527655 ?auto_527667 ) ) ( not ( = ?auto_527655 ?auto_527668 ) ) ( not ( = ?auto_527656 ?auto_527657 ) ) ( not ( = ?auto_527656 ?auto_527658 ) ) ( not ( = ?auto_527656 ?auto_527659 ) ) ( not ( = ?auto_527656 ?auto_527660 ) ) ( not ( = ?auto_527656 ?auto_527661 ) ) ( not ( = ?auto_527656 ?auto_527662 ) ) ( not ( = ?auto_527656 ?auto_527663 ) ) ( not ( = ?auto_527656 ?auto_527664 ) ) ( not ( = ?auto_527656 ?auto_527665 ) ) ( not ( = ?auto_527656 ?auto_527666 ) ) ( not ( = ?auto_527656 ?auto_527667 ) ) ( not ( = ?auto_527656 ?auto_527668 ) ) ( not ( = ?auto_527657 ?auto_527658 ) ) ( not ( = ?auto_527657 ?auto_527659 ) ) ( not ( = ?auto_527657 ?auto_527660 ) ) ( not ( = ?auto_527657 ?auto_527661 ) ) ( not ( = ?auto_527657 ?auto_527662 ) ) ( not ( = ?auto_527657 ?auto_527663 ) ) ( not ( = ?auto_527657 ?auto_527664 ) ) ( not ( = ?auto_527657 ?auto_527665 ) ) ( not ( = ?auto_527657 ?auto_527666 ) ) ( not ( = ?auto_527657 ?auto_527667 ) ) ( not ( = ?auto_527657 ?auto_527668 ) ) ( not ( = ?auto_527658 ?auto_527659 ) ) ( not ( = ?auto_527658 ?auto_527660 ) ) ( not ( = ?auto_527658 ?auto_527661 ) ) ( not ( = ?auto_527658 ?auto_527662 ) ) ( not ( = ?auto_527658 ?auto_527663 ) ) ( not ( = ?auto_527658 ?auto_527664 ) ) ( not ( = ?auto_527658 ?auto_527665 ) ) ( not ( = ?auto_527658 ?auto_527666 ) ) ( not ( = ?auto_527658 ?auto_527667 ) ) ( not ( = ?auto_527658 ?auto_527668 ) ) ( not ( = ?auto_527659 ?auto_527660 ) ) ( not ( = ?auto_527659 ?auto_527661 ) ) ( not ( = ?auto_527659 ?auto_527662 ) ) ( not ( = ?auto_527659 ?auto_527663 ) ) ( not ( = ?auto_527659 ?auto_527664 ) ) ( not ( = ?auto_527659 ?auto_527665 ) ) ( not ( = ?auto_527659 ?auto_527666 ) ) ( not ( = ?auto_527659 ?auto_527667 ) ) ( not ( = ?auto_527659 ?auto_527668 ) ) ( not ( = ?auto_527660 ?auto_527661 ) ) ( not ( = ?auto_527660 ?auto_527662 ) ) ( not ( = ?auto_527660 ?auto_527663 ) ) ( not ( = ?auto_527660 ?auto_527664 ) ) ( not ( = ?auto_527660 ?auto_527665 ) ) ( not ( = ?auto_527660 ?auto_527666 ) ) ( not ( = ?auto_527660 ?auto_527667 ) ) ( not ( = ?auto_527660 ?auto_527668 ) ) ( not ( = ?auto_527661 ?auto_527662 ) ) ( not ( = ?auto_527661 ?auto_527663 ) ) ( not ( = ?auto_527661 ?auto_527664 ) ) ( not ( = ?auto_527661 ?auto_527665 ) ) ( not ( = ?auto_527661 ?auto_527666 ) ) ( not ( = ?auto_527661 ?auto_527667 ) ) ( not ( = ?auto_527661 ?auto_527668 ) ) ( not ( = ?auto_527662 ?auto_527663 ) ) ( not ( = ?auto_527662 ?auto_527664 ) ) ( not ( = ?auto_527662 ?auto_527665 ) ) ( not ( = ?auto_527662 ?auto_527666 ) ) ( not ( = ?auto_527662 ?auto_527667 ) ) ( not ( = ?auto_527662 ?auto_527668 ) ) ( not ( = ?auto_527663 ?auto_527664 ) ) ( not ( = ?auto_527663 ?auto_527665 ) ) ( not ( = ?auto_527663 ?auto_527666 ) ) ( not ( = ?auto_527663 ?auto_527667 ) ) ( not ( = ?auto_527663 ?auto_527668 ) ) ( not ( = ?auto_527664 ?auto_527665 ) ) ( not ( = ?auto_527664 ?auto_527666 ) ) ( not ( = ?auto_527664 ?auto_527667 ) ) ( not ( = ?auto_527664 ?auto_527668 ) ) ( not ( = ?auto_527665 ?auto_527666 ) ) ( not ( = ?auto_527665 ?auto_527667 ) ) ( not ( = ?auto_527665 ?auto_527668 ) ) ( not ( = ?auto_527666 ?auto_527667 ) ) ( not ( = ?auto_527666 ?auto_527668 ) ) ( not ( = ?auto_527667 ?auto_527668 ) ) ( ON ?auto_527653 ?auto_527669 ) ( not ( = ?auto_527668 ?auto_527669 ) ) ( not ( = ?auto_527667 ?auto_527669 ) ) ( not ( = ?auto_527666 ?auto_527669 ) ) ( not ( = ?auto_527665 ?auto_527669 ) ) ( not ( = ?auto_527664 ?auto_527669 ) ) ( not ( = ?auto_527663 ?auto_527669 ) ) ( not ( = ?auto_527662 ?auto_527669 ) ) ( not ( = ?auto_527661 ?auto_527669 ) ) ( not ( = ?auto_527660 ?auto_527669 ) ) ( not ( = ?auto_527659 ?auto_527669 ) ) ( not ( = ?auto_527658 ?auto_527669 ) ) ( not ( = ?auto_527657 ?auto_527669 ) ) ( not ( = ?auto_527656 ?auto_527669 ) ) ( not ( = ?auto_527655 ?auto_527669 ) ) ( not ( = ?auto_527654 ?auto_527669 ) ) ( not ( = ?auto_527653 ?auto_527669 ) ) ( ON ?auto_527654 ?auto_527653 ) ( ON ?auto_527655 ?auto_527654 ) ( ON ?auto_527656 ?auto_527655 ) ( ON ?auto_527657 ?auto_527656 ) ( ON ?auto_527658 ?auto_527657 ) ( ON ?auto_527659 ?auto_527658 ) ( ON ?auto_527660 ?auto_527659 ) ( ON ?auto_527661 ?auto_527660 ) ( ON ?auto_527662 ?auto_527661 ) ( ON ?auto_527663 ?auto_527662 ) ( ON ?auto_527664 ?auto_527663 ) ( ON ?auto_527665 ?auto_527664 ) ( ON ?auto_527666 ?auto_527665 ) ( ON ?auto_527667 ?auto_527666 ) ( ON ?auto_527668 ?auto_527667 ) ( CLEAR ?auto_527668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_527668 ?auto_527667 ?auto_527666 ?auto_527665 ?auto_527664 ?auto_527663 ?auto_527662 ?auto_527661 ?auto_527660 ?auto_527659 ?auto_527658 ?auto_527657 ?auto_527656 ?auto_527655 ?auto_527654 ?auto_527653 )
      ( MAKE-16PILE ?auto_527653 ?auto_527654 ?auto_527655 ?auto_527656 ?auto_527657 ?auto_527658 ?auto_527659 ?auto_527660 ?auto_527661 ?auto_527662 ?auto_527663 ?auto_527664 ?auto_527665 ?auto_527666 ?auto_527667 ?auto_527668 ) )
  )

)

