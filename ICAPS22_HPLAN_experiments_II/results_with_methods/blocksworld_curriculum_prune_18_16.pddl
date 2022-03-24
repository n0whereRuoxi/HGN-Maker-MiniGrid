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
      ?auto_880433 - BLOCK
    )
    :vars
    (
      ?auto_880434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880433 ?auto_880434 ) ( CLEAR ?auto_880433 ) ( HAND-EMPTY ) ( not ( = ?auto_880433 ?auto_880434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_880433 ?auto_880434 )
      ( !PUTDOWN ?auto_880433 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_880440 - BLOCK
      ?auto_880441 - BLOCK
    )
    :vars
    (
      ?auto_880442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_880440 ) ( ON ?auto_880441 ?auto_880442 ) ( CLEAR ?auto_880441 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_880440 ) ( not ( = ?auto_880440 ?auto_880441 ) ) ( not ( = ?auto_880440 ?auto_880442 ) ) ( not ( = ?auto_880441 ?auto_880442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_880441 ?auto_880442 )
      ( !STACK ?auto_880441 ?auto_880440 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_880450 - BLOCK
      ?auto_880451 - BLOCK
    )
    :vars
    (
      ?auto_880452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880451 ?auto_880452 ) ( not ( = ?auto_880450 ?auto_880451 ) ) ( not ( = ?auto_880450 ?auto_880452 ) ) ( not ( = ?auto_880451 ?auto_880452 ) ) ( ON ?auto_880450 ?auto_880451 ) ( CLEAR ?auto_880450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_880450 )
      ( MAKE-2PILE ?auto_880450 ?auto_880451 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_880461 - BLOCK
      ?auto_880462 - BLOCK
      ?auto_880463 - BLOCK
    )
    :vars
    (
      ?auto_880464 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_880462 ) ( ON ?auto_880463 ?auto_880464 ) ( CLEAR ?auto_880463 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_880461 ) ( ON ?auto_880462 ?auto_880461 ) ( not ( = ?auto_880461 ?auto_880462 ) ) ( not ( = ?auto_880461 ?auto_880463 ) ) ( not ( = ?auto_880461 ?auto_880464 ) ) ( not ( = ?auto_880462 ?auto_880463 ) ) ( not ( = ?auto_880462 ?auto_880464 ) ) ( not ( = ?auto_880463 ?auto_880464 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_880463 ?auto_880464 )
      ( !STACK ?auto_880463 ?auto_880462 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_880475 - BLOCK
      ?auto_880476 - BLOCK
      ?auto_880477 - BLOCK
    )
    :vars
    (
      ?auto_880478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880477 ?auto_880478 ) ( ON-TABLE ?auto_880475 ) ( not ( = ?auto_880475 ?auto_880476 ) ) ( not ( = ?auto_880475 ?auto_880477 ) ) ( not ( = ?auto_880475 ?auto_880478 ) ) ( not ( = ?auto_880476 ?auto_880477 ) ) ( not ( = ?auto_880476 ?auto_880478 ) ) ( not ( = ?auto_880477 ?auto_880478 ) ) ( CLEAR ?auto_880475 ) ( ON ?auto_880476 ?auto_880477 ) ( CLEAR ?auto_880476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_880475 ?auto_880476 )
      ( MAKE-3PILE ?auto_880475 ?auto_880476 ?auto_880477 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_880489 - BLOCK
      ?auto_880490 - BLOCK
      ?auto_880491 - BLOCK
    )
    :vars
    (
      ?auto_880492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880491 ?auto_880492 ) ( not ( = ?auto_880489 ?auto_880490 ) ) ( not ( = ?auto_880489 ?auto_880491 ) ) ( not ( = ?auto_880489 ?auto_880492 ) ) ( not ( = ?auto_880490 ?auto_880491 ) ) ( not ( = ?auto_880490 ?auto_880492 ) ) ( not ( = ?auto_880491 ?auto_880492 ) ) ( ON ?auto_880490 ?auto_880491 ) ( ON ?auto_880489 ?auto_880490 ) ( CLEAR ?auto_880489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_880489 )
      ( MAKE-3PILE ?auto_880489 ?auto_880490 ?auto_880491 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_880504 - BLOCK
      ?auto_880505 - BLOCK
      ?auto_880506 - BLOCK
      ?auto_880507 - BLOCK
    )
    :vars
    (
      ?auto_880508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_880506 ) ( ON ?auto_880507 ?auto_880508 ) ( CLEAR ?auto_880507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_880504 ) ( ON ?auto_880505 ?auto_880504 ) ( ON ?auto_880506 ?auto_880505 ) ( not ( = ?auto_880504 ?auto_880505 ) ) ( not ( = ?auto_880504 ?auto_880506 ) ) ( not ( = ?auto_880504 ?auto_880507 ) ) ( not ( = ?auto_880504 ?auto_880508 ) ) ( not ( = ?auto_880505 ?auto_880506 ) ) ( not ( = ?auto_880505 ?auto_880507 ) ) ( not ( = ?auto_880505 ?auto_880508 ) ) ( not ( = ?auto_880506 ?auto_880507 ) ) ( not ( = ?auto_880506 ?auto_880508 ) ) ( not ( = ?auto_880507 ?auto_880508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_880507 ?auto_880508 )
      ( !STACK ?auto_880507 ?auto_880506 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_880522 - BLOCK
      ?auto_880523 - BLOCK
      ?auto_880524 - BLOCK
      ?auto_880525 - BLOCK
    )
    :vars
    (
      ?auto_880526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880525 ?auto_880526 ) ( ON-TABLE ?auto_880522 ) ( ON ?auto_880523 ?auto_880522 ) ( not ( = ?auto_880522 ?auto_880523 ) ) ( not ( = ?auto_880522 ?auto_880524 ) ) ( not ( = ?auto_880522 ?auto_880525 ) ) ( not ( = ?auto_880522 ?auto_880526 ) ) ( not ( = ?auto_880523 ?auto_880524 ) ) ( not ( = ?auto_880523 ?auto_880525 ) ) ( not ( = ?auto_880523 ?auto_880526 ) ) ( not ( = ?auto_880524 ?auto_880525 ) ) ( not ( = ?auto_880524 ?auto_880526 ) ) ( not ( = ?auto_880525 ?auto_880526 ) ) ( CLEAR ?auto_880523 ) ( ON ?auto_880524 ?auto_880525 ) ( CLEAR ?auto_880524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_880522 ?auto_880523 ?auto_880524 )
      ( MAKE-4PILE ?auto_880522 ?auto_880523 ?auto_880524 ?auto_880525 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_880540 - BLOCK
      ?auto_880541 - BLOCK
      ?auto_880542 - BLOCK
      ?auto_880543 - BLOCK
    )
    :vars
    (
      ?auto_880544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880543 ?auto_880544 ) ( ON-TABLE ?auto_880540 ) ( not ( = ?auto_880540 ?auto_880541 ) ) ( not ( = ?auto_880540 ?auto_880542 ) ) ( not ( = ?auto_880540 ?auto_880543 ) ) ( not ( = ?auto_880540 ?auto_880544 ) ) ( not ( = ?auto_880541 ?auto_880542 ) ) ( not ( = ?auto_880541 ?auto_880543 ) ) ( not ( = ?auto_880541 ?auto_880544 ) ) ( not ( = ?auto_880542 ?auto_880543 ) ) ( not ( = ?auto_880542 ?auto_880544 ) ) ( not ( = ?auto_880543 ?auto_880544 ) ) ( ON ?auto_880542 ?auto_880543 ) ( CLEAR ?auto_880540 ) ( ON ?auto_880541 ?auto_880542 ) ( CLEAR ?auto_880541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_880540 ?auto_880541 )
      ( MAKE-4PILE ?auto_880540 ?auto_880541 ?auto_880542 ?auto_880543 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_880558 - BLOCK
      ?auto_880559 - BLOCK
      ?auto_880560 - BLOCK
      ?auto_880561 - BLOCK
    )
    :vars
    (
      ?auto_880562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880561 ?auto_880562 ) ( not ( = ?auto_880558 ?auto_880559 ) ) ( not ( = ?auto_880558 ?auto_880560 ) ) ( not ( = ?auto_880558 ?auto_880561 ) ) ( not ( = ?auto_880558 ?auto_880562 ) ) ( not ( = ?auto_880559 ?auto_880560 ) ) ( not ( = ?auto_880559 ?auto_880561 ) ) ( not ( = ?auto_880559 ?auto_880562 ) ) ( not ( = ?auto_880560 ?auto_880561 ) ) ( not ( = ?auto_880560 ?auto_880562 ) ) ( not ( = ?auto_880561 ?auto_880562 ) ) ( ON ?auto_880560 ?auto_880561 ) ( ON ?auto_880559 ?auto_880560 ) ( ON ?auto_880558 ?auto_880559 ) ( CLEAR ?auto_880558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_880558 )
      ( MAKE-4PILE ?auto_880558 ?auto_880559 ?auto_880560 ?auto_880561 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_880577 - BLOCK
      ?auto_880578 - BLOCK
      ?auto_880579 - BLOCK
      ?auto_880580 - BLOCK
      ?auto_880581 - BLOCK
    )
    :vars
    (
      ?auto_880582 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_880580 ) ( ON ?auto_880581 ?auto_880582 ) ( CLEAR ?auto_880581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_880577 ) ( ON ?auto_880578 ?auto_880577 ) ( ON ?auto_880579 ?auto_880578 ) ( ON ?auto_880580 ?auto_880579 ) ( not ( = ?auto_880577 ?auto_880578 ) ) ( not ( = ?auto_880577 ?auto_880579 ) ) ( not ( = ?auto_880577 ?auto_880580 ) ) ( not ( = ?auto_880577 ?auto_880581 ) ) ( not ( = ?auto_880577 ?auto_880582 ) ) ( not ( = ?auto_880578 ?auto_880579 ) ) ( not ( = ?auto_880578 ?auto_880580 ) ) ( not ( = ?auto_880578 ?auto_880581 ) ) ( not ( = ?auto_880578 ?auto_880582 ) ) ( not ( = ?auto_880579 ?auto_880580 ) ) ( not ( = ?auto_880579 ?auto_880581 ) ) ( not ( = ?auto_880579 ?auto_880582 ) ) ( not ( = ?auto_880580 ?auto_880581 ) ) ( not ( = ?auto_880580 ?auto_880582 ) ) ( not ( = ?auto_880581 ?auto_880582 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_880581 ?auto_880582 )
      ( !STACK ?auto_880581 ?auto_880580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_880599 - BLOCK
      ?auto_880600 - BLOCK
      ?auto_880601 - BLOCK
      ?auto_880602 - BLOCK
      ?auto_880603 - BLOCK
    )
    :vars
    (
      ?auto_880604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880603 ?auto_880604 ) ( ON-TABLE ?auto_880599 ) ( ON ?auto_880600 ?auto_880599 ) ( ON ?auto_880601 ?auto_880600 ) ( not ( = ?auto_880599 ?auto_880600 ) ) ( not ( = ?auto_880599 ?auto_880601 ) ) ( not ( = ?auto_880599 ?auto_880602 ) ) ( not ( = ?auto_880599 ?auto_880603 ) ) ( not ( = ?auto_880599 ?auto_880604 ) ) ( not ( = ?auto_880600 ?auto_880601 ) ) ( not ( = ?auto_880600 ?auto_880602 ) ) ( not ( = ?auto_880600 ?auto_880603 ) ) ( not ( = ?auto_880600 ?auto_880604 ) ) ( not ( = ?auto_880601 ?auto_880602 ) ) ( not ( = ?auto_880601 ?auto_880603 ) ) ( not ( = ?auto_880601 ?auto_880604 ) ) ( not ( = ?auto_880602 ?auto_880603 ) ) ( not ( = ?auto_880602 ?auto_880604 ) ) ( not ( = ?auto_880603 ?auto_880604 ) ) ( CLEAR ?auto_880601 ) ( ON ?auto_880602 ?auto_880603 ) ( CLEAR ?auto_880602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_880599 ?auto_880600 ?auto_880601 ?auto_880602 )
      ( MAKE-5PILE ?auto_880599 ?auto_880600 ?auto_880601 ?auto_880602 ?auto_880603 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_880621 - BLOCK
      ?auto_880622 - BLOCK
      ?auto_880623 - BLOCK
      ?auto_880624 - BLOCK
      ?auto_880625 - BLOCK
    )
    :vars
    (
      ?auto_880626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880625 ?auto_880626 ) ( ON-TABLE ?auto_880621 ) ( ON ?auto_880622 ?auto_880621 ) ( not ( = ?auto_880621 ?auto_880622 ) ) ( not ( = ?auto_880621 ?auto_880623 ) ) ( not ( = ?auto_880621 ?auto_880624 ) ) ( not ( = ?auto_880621 ?auto_880625 ) ) ( not ( = ?auto_880621 ?auto_880626 ) ) ( not ( = ?auto_880622 ?auto_880623 ) ) ( not ( = ?auto_880622 ?auto_880624 ) ) ( not ( = ?auto_880622 ?auto_880625 ) ) ( not ( = ?auto_880622 ?auto_880626 ) ) ( not ( = ?auto_880623 ?auto_880624 ) ) ( not ( = ?auto_880623 ?auto_880625 ) ) ( not ( = ?auto_880623 ?auto_880626 ) ) ( not ( = ?auto_880624 ?auto_880625 ) ) ( not ( = ?auto_880624 ?auto_880626 ) ) ( not ( = ?auto_880625 ?auto_880626 ) ) ( ON ?auto_880624 ?auto_880625 ) ( CLEAR ?auto_880622 ) ( ON ?auto_880623 ?auto_880624 ) ( CLEAR ?auto_880623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_880621 ?auto_880622 ?auto_880623 )
      ( MAKE-5PILE ?auto_880621 ?auto_880622 ?auto_880623 ?auto_880624 ?auto_880625 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_880643 - BLOCK
      ?auto_880644 - BLOCK
      ?auto_880645 - BLOCK
      ?auto_880646 - BLOCK
      ?auto_880647 - BLOCK
    )
    :vars
    (
      ?auto_880648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880647 ?auto_880648 ) ( ON-TABLE ?auto_880643 ) ( not ( = ?auto_880643 ?auto_880644 ) ) ( not ( = ?auto_880643 ?auto_880645 ) ) ( not ( = ?auto_880643 ?auto_880646 ) ) ( not ( = ?auto_880643 ?auto_880647 ) ) ( not ( = ?auto_880643 ?auto_880648 ) ) ( not ( = ?auto_880644 ?auto_880645 ) ) ( not ( = ?auto_880644 ?auto_880646 ) ) ( not ( = ?auto_880644 ?auto_880647 ) ) ( not ( = ?auto_880644 ?auto_880648 ) ) ( not ( = ?auto_880645 ?auto_880646 ) ) ( not ( = ?auto_880645 ?auto_880647 ) ) ( not ( = ?auto_880645 ?auto_880648 ) ) ( not ( = ?auto_880646 ?auto_880647 ) ) ( not ( = ?auto_880646 ?auto_880648 ) ) ( not ( = ?auto_880647 ?auto_880648 ) ) ( ON ?auto_880646 ?auto_880647 ) ( ON ?auto_880645 ?auto_880646 ) ( CLEAR ?auto_880643 ) ( ON ?auto_880644 ?auto_880645 ) ( CLEAR ?auto_880644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_880643 ?auto_880644 )
      ( MAKE-5PILE ?auto_880643 ?auto_880644 ?auto_880645 ?auto_880646 ?auto_880647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_880665 - BLOCK
      ?auto_880666 - BLOCK
      ?auto_880667 - BLOCK
      ?auto_880668 - BLOCK
      ?auto_880669 - BLOCK
    )
    :vars
    (
      ?auto_880670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880669 ?auto_880670 ) ( not ( = ?auto_880665 ?auto_880666 ) ) ( not ( = ?auto_880665 ?auto_880667 ) ) ( not ( = ?auto_880665 ?auto_880668 ) ) ( not ( = ?auto_880665 ?auto_880669 ) ) ( not ( = ?auto_880665 ?auto_880670 ) ) ( not ( = ?auto_880666 ?auto_880667 ) ) ( not ( = ?auto_880666 ?auto_880668 ) ) ( not ( = ?auto_880666 ?auto_880669 ) ) ( not ( = ?auto_880666 ?auto_880670 ) ) ( not ( = ?auto_880667 ?auto_880668 ) ) ( not ( = ?auto_880667 ?auto_880669 ) ) ( not ( = ?auto_880667 ?auto_880670 ) ) ( not ( = ?auto_880668 ?auto_880669 ) ) ( not ( = ?auto_880668 ?auto_880670 ) ) ( not ( = ?auto_880669 ?auto_880670 ) ) ( ON ?auto_880668 ?auto_880669 ) ( ON ?auto_880667 ?auto_880668 ) ( ON ?auto_880666 ?auto_880667 ) ( ON ?auto_880665 ?auto_880666 ) ( CLEAR ?auto_880665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_880665 )
      ( MAKE-5PILE ?auto_880665 ?auto_880666 ?auto_880667 ?auto_880668 ?auto_880669 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_880688 - BLOCK
      ?auto_880689 - BLOCK
      ?auto_880690 - BLOCK
      ?auto_880691 - BLOCK
      ?auto_880692 - BLOCK
      ?auto_880693 - BLOCK
    )
    :vars
    (
      ?auto_880694 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_880692 ) ( ON ?auto_880693 ?auto_880694 ) ( CLEAR ?auto_880693 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_880688 ) ( ON ?auto_880689 ?auto_880688 ) ( ON ?auto_880690 ?auto_880689 ) ( ON ?auto_880691 ?auto_880690 ) ( ON ?auto_880692 ?auto_880691 ) ( not ( = ?auto_880688 ?auto_880689 ) ) ( not ( = ?auto_880688 ?auto_880690 ) ) ( not ( = ?auto_880688 ?auto_880691 ) ) ( not ( = ?auto_880688 ?auto_880692 ) ) ( not ( = ?auto_880688 ?auto_880693 ) ) ( not ( = ?auto_880688 ?auto_880694 ) ) ( not ( = ?auto_880689 ?auto_880690 ) ) ( not ( = ?auto_880689 ?auto_880691 ) ) ( not ( = ?auto_880689 ?auto_880692 ) ) ( not ( = ?auto_880689 ?auto_880693 ) ) ( not ( = ?auto_880689 ?auto_880694 ) ) ( not ( = ?auto_880690 ?auto_880691 ) ) ( not ( = ?auto_880690 ?auto_880692 ) ) ( not ( = ?auto_880690 ?auto_880693 ) ) ( not ( = ?auto_880690 ?auto_880694 ) ) ( not ( = ?auto_880691 ?auto_880692 ) ) ( not ( = ?auto_880691 ?auto_880693 ) ) ( not ( = ?auto_880691 ?auto_880694 ) ) ( not ( = ?auto_880692 ?auto_880693 ) ) ( not ( = ?auto_880692 ?auto_880694 ) ) ( not ( = ?auto_880693 ?auto_880694 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_880693 ?auto_880694 )
      ( !STACK ?auto_880693 ?auto_880692 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_880714 - BLOCK
      ?auto_880715 - BLOCK
      ?auto_880716 - BLOCK
      ?auto_880717 - BLOCK
      ?auto_880718 - BLOCK
      ?auto_880719 - BLOCK
    )
    :vars
    (
      ?auto_880720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880719 ?auto_880720 ) ( ON-TABLE ?auto_880714 ) ( ON ?auto_880715 ?auto_880714 ) ( ON ?auto_880716 ?auto_880715 ) ( ON ?auto_880717 ?auto_880716 ) ( not ( = ?auto_880714 ?auto_880715 ) ) ( not ( = ?auto_880714 ?auto_880716 ) ) ( not ( = ?auto_880714 ?auto_880717 ) ) ( not ( = ?auto_880714 ?auto_880718 ) ) ( not ( = ?auto_880714 ?auto_880719 ) ) ( not ( = ?auto_880714 ?auto_880720 ) ) ( not ( = ?auto_880715 ?auto_880716 ) ) ( not ( = ?auto_880715 ?auto_880717 ) ) ( not ( = ?auto_880715 ?auto_880718 ) ) ( not ( = ?auto_880715 ?auto_880719 ) ) ( not ( = ?auto_880715 ?auto_880720 ) ) ( not ( = ?auto_880716 ?auto_880717 ) ) ( not ( = ?auto_880716 ?auto_880718 ) ) ( not ( = ?auto_880716 ?auto_880719 ) ) ( not ( = ?auto_880716 ?auto_880720 ) ) ( not ( = ?auto_880717 ?auto_880718 ) ) ( not ( = ?auto_880717 ?auto_880719 ) ) ( not ( = ?auto_880717 ?auto_880720 ) ) ( not ( = ?auto_880718 ?auto_880719 ) ) ( not ( = ?auto_880718 ?auto_880720 ) ) ( not ( = ?auto_880719 ?auto_880720 ) ) ( CLEAR ?auto_880717 ) ( ON ?auto_880718 ?auto_880719 ) ( CLEAR ?auto_880718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_880714 ?auto_880715 ?auto_880716 ?auto_880717 ?auto_880718 )
      ( MAKE-6PILE ?auto_880714 ?auto_880715 ?auto_880716 ?auto_880717 ?auto_880718 ?auto_880719 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_880740 - BLOCK
      ?auto_880741 - BLOCK
      ?auto_880742 - BLOCK
      ?auto_880743 - BLOCK
      ?auto_880744 - BLOCK
      ?auto_880745 - BLOCK
    )
    :vars
    (
      ?auto_880746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880745 ?auto_880746 ) ( ON-TABLE ?auto_880740 ) ( ON ?auto_880741 ?auto_880740 ) ( ON ?auto_880742 ?auto_880741 ) ( not ( = ?auto_880740 ?auto_880741 ) ) ( not ( = ?auto_880740 ?auto_880742 ) ) ( not ( = ?auto_880740 ?auto_880743 ) ) ( not ( = ?auto_880740 ?auto_880744 ) ) ( not ( = ?auto_880740 ?auto_880745 ) ) ( not ( = ?auto_880740 ?auto_880746 ) ) ( not ( = ?auto_880741 ?auto_880742 ) ) ( not ( = ?auto_880741 ?auto_880743 ) ) ( not ( = ?auto_880741 ?auto_880744 ) ) ( not ( = ?auto_880741 ?auto_880745 ) ) ( not ( = ?auto_880741 ?auto_880746 ) ) ( not ( = ?auto_880742 ?auto_880743 ) ) ( not ( = ?auto_880742 ?auto_880744 ) ) ( not ( = ?auto_880742 ?auto_880745 ) ) ( not ( = ?auto_880742 ?auto_880746 ) ) ( not ( = ?auto_880743 ?auto_880744 ) ) ( not ( = ?auto_880743 ?auto_880745 ) ) ( not ( = ?auto_880743 ?auto_880746 ) ) ( not ( = ?auto_880744 ?auto_880745 ) ) ( not ( = ?auto_880744 ?auto_880746 ) ) ( not ( = ?auto_880745 ?auto_880746 ) ) ( ON ?auto_880744 ?auto_880745 ) ( CLEAR ?auto_880742 ) ( ON ?auto_880743 ?auto_880744 ) ( CLEAR ?auto_880743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_880740 ?auto_880741 ?auto_880742 ?auto_880743 )
      ( MAKE-6PILE ?auto_880740 ?auto_880741 ?auto_880742 ?auto_880743 ?auto_880744 ?auto_880745 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_880766 - BLOCK
      ?auto_880767 - BLOCK
      ?auto_880768 - BLOCK
      ?auto_880769 - BLOCK
      ?auto_880770 - BLOCK
      ?auto_880771 - BLOCK
    )
    :vars
    (
      ?auto_880772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880771 ?auto_880772 ) ( ON-TABLE ?auto_880766 ) ( ON ?auto_880767 ?auto_880766 ) ( not ( = ?auto_880766 ?auto_880767 ) ) ( not ( = ?auto_880766 ?auto_880768 ) ) ( not ( = ?auto_880766 ?auto_880769 ) ) ( not ( = ?auto_880766 ?auto_880770 ) ) ( not ( = ?auto_880766 ?auto_880771 ) ) ( not ( = ?auto_880766 ?auto_880772 ) ) ( not ( = ?auto_880767 ?auto_880768 ) ) ( not ( = ?auto_880767 ?auto_880769 ) ) ( not ( = ?auto_880767 ?auto_880770 ) ) ( not ( = ?auto_880767 ?auto_880771 ) ) ( not ( = ?auto_880767 ?auto_880772 ) ) ( not ( = ?auto_880768 ?auto_880769 ) ) ( not ( = ?auto_880768 ?auto_880770 ) ) ( not ( = ?auto_880768 ?auto_880771 ) ) ( not ( = ?auto_880768 ?auto_880772 ) ) ( not ( = ?auto_880769 ?auto_880770 ) ) ( not ( = ?auto_880769 ?auto_880771 ) ) ( not ( = ?auto_880769 ?auto_880772 ) ) ( not ( = ?auto_880770 ?auto_880771 ) ) ( not ( = ?auto_880770 ?auto_880772 ) ) ( not ( = ?auto_880771 ?auto_880772 ) ) ( ON ?auto_880770 ?auto_880771 ) ( ON ?auto_880769 ?auto_880770 ) ( CLEAR ?auto_880767 ) ( ON ?auto_880768 ?auto_880769 ) ( CLEAR ?auto_880768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_880766 ?auto_880767 ?auto_880768 )
      ( MAKE-6PILE ?auto_880766 ?auto_880767 ?auto_880768 ?auto_880769 ?auto_880770 ?auto_880771 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_880792 - BLOCK
      ?auto_880793 - BLOCK
      ?auto_880794 - BLOCK
      ?auto_880795 - BLOCK
      ?auto_880796 - BLOCK
      ?auto_880797 - BLOCK
    )
    :vars
    (
      ?auto_880798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880797 ?auto_880798 ) ( ON-TABLE ?auto_880792 ) ( not ( = ?auto_880792 ?auto_880793 ) ) ( not ( = ?auto_880792 ?auto_880794 ) ) ( not ( = ?auto_880792 ?auto_880795 ) ) ( not ( = ?auto_880792 ?auto_880796 ) ) ( not ( = ?auto_880792 ?auto_880797 ) ) ( not ( = ?auto_880792 ?auto_880798 ) ) ( not ( = ?auto_880793 ?auto_880794 ) ) ( not ( = ?auto_880793 ?auto_880795 ) ) ( not ( = ?auto_880793 ?auto_880796 ) ) ( not ( = ?auto_880793 ?auto_880797 ) ) ( not ( = ?auto_880793 ?auto_880798 ) ) ( not ( = ?auto_880794 ?auto_880795 ) ) ( not ( = ?auto_880794 ?auto_880796 ) ) ( not ( = ?auto_880794 ?auto_880797 ) ) ( not ( = ?auto_880794 ?auto_880798 ) ) ( not ( = ?auto_880795 ?auto_880796 ) ) ( not ( = ?auto_880795 ?auto_880797 ) ) ( not ( = ?auto_880795 ?auto_880798 ) ) ( not ( = ?auto_880796 ?auto_880797 ) ) ( not ( = ?auto_880796 ?auto_880798 ) ) ( not ( = ?auto_880797 ?auto_880798 ) ) ( ON ?auto_880796 ?auto_880797 ) ( ON ?auto_880795 ?auto_880796 ) ( ON ?auto_880794 ?auto_880795 ) ( CLEAR ?auto_880792 ) ( ON ?auto_880793 ?auto_880794 ) ( CLEAR ?auto_880793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_880792 ?auto_880793 )
      ( MAKE-6PILE ?auto_880792 ?auto_880793 ?auto_880794 ?auto_880795 ?auto_880796 ?auto_880797 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_880818 - BLOCK
      ?auto_880819 - BLOCK
      ?auto_880820 - BLOCK
      ?auto_880821 - BLOCK
      ?auto_880822 - BLOCK
      ?auto_880823 - BLOCK
    )
    :vars
    (
      ?auto_880824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880823 ?auto_880824 ) ( not ( = ?auto_880818 ?auto_880819 ) ) ( not ( = ?auto_880818 ?auto_880820 ) ) ( not ( = ?auto_880818 ?auto_880821 ) ) ( not ( = ?auto_880818 ?auto_880822 ) ) ( not ( = ?auto_880818 ?auto_880823 ) ) ( not ( = ?auto_880818 ?auto_880824 ) ) ( not ( = ?auto_880819 ?auto_880820 ) ) ( not ( = ?auto_880819 ?auto_880821 ) ) ( not ( = ?auto_880819 ?auto_880822 ) ) ( not ( = ?auto_880819 ?auto_880823 ) ) ( not ( = ?auto_880819 ?auto_880824 ) ) ( not ( = ?auto_880820 ?auto_880821 ) ) ( not ( = ?auto_880820 ?auto_880822 ) ) ( not ( = ?auto_880820 ?auto_880823 ) ) ( not ( = ?auto_880820 ?auto_880824 ) ) ( not ( = ?auto_880821 ?auto_880822 ) ) ( not ( = ?auto_880821 ?auto_880823 ) ) ( not ( = ?auto_880821 ?auto_880824 ) ) ( not ( = ?auto_880822 ?auto_880823 ) ) ( not ( = ?auto_880822 ?auto_880824 ) ) ( not ( = ?auto_880823 ?auto_880824 ) ) ( ON ?auto_880822 ?auto_880823 ) ( ON ?auto_880821 ?auto_880822 ) ( ON ?auto_880820 ?auto_880821 ) ( ON ?auto_880819 ?auto_880820 ) ( ON ?auto_880818 ?auto_880819 ) ( CLEAR ?auto_880818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_880818 )
      ( MAKE-6PILE ?auto_880818 ?auto_880819 ?auto_880820 ?auto_880821 ?auto_880822 ?auto_880823 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_880845 - BLOCK
      ?auto_880846 - BLOCK
      ?auto_880847 - BLOCK
      ?auto_880848 - BLOCK
      ?auto_880849 - BLOCK
      ?auto_880850 - BLOCK
      ?auto_880851 - BLOCK
    )
    :vars
    (
      ?auto_880852 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_880850 ) ( ON ?auto_880851 ?auto_880852 ) ( CLEAR ?auto_880851 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_880845 ) ( ON ?auto_880846 ?auto_880845 ) ( ON ?auto_880847 ?auto_880846 ) ( ON ?auto_880848 ?auto_880847 ) ( ON ?auto_880849 ?auto_880848 ) ( ON ?auto_880850 ?auto_880849 ) ( not ( = ?auto_880845 ?auto_880846 ) ) ( not ( = ?auto_880845 ?auto_880847 ) ) ( not ( = ?auto_880845 ?auto_880848 ) ) ( not ( = ?auto_880845 ?auto_880849 ) ) ( not ( = ?auto_880845 ?auto_880850 ) ) ( not ( = ?auto_880845 ?auto_880851 ) ) ( not ( = ?auto_880845 ?auto_880852 ) ) ( not ( = ?auto_880846 ?auto_880847 ) ) ( not ( = ?auto_880846 ?auto_880848 ) ) ( not ( = ?auto_880846 ?auto_880849 ) ) ( not ( = ?auto_880846 ?auto_880850 ) ) ( not ( = ?auto_880846 ?auto_880851 ) ) ( not ( = ?auto_880846 ?auto_880852 ) ) ( not ( = ?auto_880847 ?auto_880848 ) ) ( not ( = ?auto_880847 ?auto_880849 ) ) ( not ( = ?auto_880847 ?auto_880850 ) ) ( not ( = ?auto_880847 ?auto_880851 ) ) ( not ( = ?auto_880847 ?auto_880852 ) ) ( not ( = ?auto_880848 ?auto_880849 ) ) ( not ( = ?auto_880848 ?auto_880850 ) ) ( not ( = ?auto_880848 ?auto_880851 ) ) ( not ( = ?auto_880848 ?auto_880852 ) ) ( not ( = ?auto_880849 ?auto_880850 ) ) ( not ( = ?auto_880849 ?auto_880851 ) ) ( not ( = ?auto_880849 ?auto_880852 ) ) ( not ( = ?auto_880850 ?auto_880851 ) ) ( not ( = ?auto_880850 ?auto_880852 ) ) ( not ( = ?auto_880851 ?auto_880852 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_880851 ?auto_880852 )
      ( !STACK ?auto_880851 ?auto_880850 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_880875 - BLOCK
      ?auto_880876 - BLOCK
      ?auto_880877 - BLOCK
      ?auto_880878 - BLOCK
      ?auto_880879 - BLOCK
      ?auto_880880 - BLOCK
      ?auto_880881 - BLOCK
    )
    :vars
    (
      ?auto_880882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880881 ?auto_880882 ) ( ON-TABLE ?auto_880875 ) ( ON ?auto_880876 ?auto_880875 ) ( ON ?auto_880877 ?auto_880876 ) ( ON ?auto_880878 ?auto_880877 ) ( ON ?auto_880879 ?auto_880878 ) ( not ( = ?auto_880875 ?auto_880876 ) ) ( not ( = ?auto_880875 ?auto_880877 ) ) ( not ( = ?auto_880875 ?auto_880878 ) ) ( not ( = ?auto_880875 ?auto_880879 ) ) ( not ( = ?auto_880875 ?auto_880880 ) ) ( not ( = ?auto_880875 ?auto_880881 ) ) ( not ( = ?auto_880875 ?auto_880882 ) ) ( not ( = ?auto_880876 ?auto_880877 ) ) ( not ( = ?auto_880876 ?auto_880878 ) ) ( not ( = ?auto_880876 ?auto_880879 ) ) ( not ( = ?auto_880876 ?auto_880880 ) ) ( not ( = ?auto_880876 ?auto_880881 ) ) ( not ( = ?auto_880876 ?auto_880882 ) ) ( not ( = ?auto_880877 ?auto_880878 ) ) ( not ( = ?auto_880877 ?auto_880879 ) ) ( not ( = ?auto_880877 ?auto_880880 ) ) ( not ( = ?auto_880877 ?auto_880881 ) ) ( not ( = ?auto_880877 ?auto_880882 ) ) ( not ( = ?auto_880878 ?auto_880879 ) ) ( not ( = ?auto_880878 ?auto_880880 ) ) ( not ( = ?auto_880878 ?auto_880881 ) ) ( not ( = ?auto_880878 ?auto_880882 ) ) ( not ( = ?auto_880879 ?auto_880880 ) ) ( not ( = ?auto_880879 ?auto_880881 ) ) ( not ( = ?auto_880879 ?auto_880882 ) ) ( not ( = ?auto_880880 ?auto_880881 ) ) ( not ( = ?auto_880880 ?auto_880882 ) ) ( not ( = ?auto_880881 ?auto_880882 ) ) ( CLEAR ?auto_880879 ) ( ON ?auto_880880 ?auto_880881 ) ( CLEAR ?auto_880880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_880875 ?auto_880876 ?auto_880877 ?auto_880878 ?auto_880879 ?auto_880880 )
      ( MAKE-7PILE ?auto_880875 ?auto_880876 ?auto_880877 ?auto_880878 ?auto_880879 ?auto_880880 ?auto_880881 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_880905 - BLOCK
      ?auto_880906 - BLOCK
      ?auto_880907 - BLOCK
      ?auto_880908 - BLOCK
      ?auto_880909 - BLOCK
      ?auto_880910 - BLOCK
      ?auto_880911 - BLOCK
    )
    :vars
    (
      ?auto_880912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880911 ?auto_880912 ) ( ON-TABLE ?auto_880905 ) ( ON ?auto_880906 ?auto_880905 ) ( ON ?auto_880907 ?auto_880906 ) ( ON ?auto_880908 ?auto_880907 ) ( not ( = ?auto_880905 ?auto_880906 ) ) ( not ( = ?auto_880905 ?auto_880907 ) ) ( not ( = ?auto_880905 ?auto_880908 ) ) ( not ( = ?auto_880905 ?auto_880909 ) ) ( not ( = ?auto_880905 ?auto_880910 ) ) ( not ( = ?auto_880905 ?auto_880911 ) ) ( not ( = ?auto_880905 ?auto_880912 ) ) ( not ( = ?auto_880906 ?auto_880907 ) ) ( not ( = ?auto_880906 ?auto_880908 ) ) ( not ( = ?auto_880906 ?auto_880909 ) ) ( not ( = ?auto_880906 ?auto_880910 ) ) ( not ( = ?auto_880906 ?auto_880911 ) ) ( not ( = ?auto_880906 ?auto_880912 ) ) ( not ( = ?auto_880907 ?auto_880908 ) ) ( not ( = ?auto_880907 ?auto_880909 ) ) ( not ( = ?auto_880907 ?auto_880910 ) ) ( not ( = ?auto_880907 ?auto_880911 ) ) ( not ( = ?auto_880907 ?auto_880912 ) ) ( not ( = ?auto_880908 ?auto_880909 ) ) ( not ( = ?auto_880908 ?auto_880910 ) ) ( not ( = ?auto_880908 ?auto_880911 ) ) ( not ( = ?auto_880908 ?auto_880912 ) ) ( not ( = ?auto_880909 ?auto_880910 ) ) ( not ( = ?auto_880909 ?auto_880911 ) ) ( not ( = ?auto_880909 ?auto_880912 ) ) ( not ( = ?auto_880910 ?auto_880911 ) ) ( not ( = ?auto_880910 ?auto_880912 ) ) ( not ( = ?auto_880911 ?auto_880912 ) ) ( ON ?auto_880910 ?auto_880911 ) ( CLEAR ?auto_880908 ) ( ON ?auto_880909 ?auto_880910 ) ( CLEAR ?auto_880909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_880905 ?auto_880906 ?auto_880907 ?auto_880908 ?auto_880909 )
      ( MAKE-7PILE ?auto_880905 ?auto_880906 ?auto_880907 ?auto_880908 ?auto_880909 ?auto_880910 ?auto_880911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_880935 - BLOCK
      ?auto_880936 - BLOCK
      ?auto_880937 - BLOCK
      ?auto_880938 - BLOCK
      ?auto_880939 - BLOCK
      ?auto_880940 - BLOCK
      ?auto_880941 - BLOCK
    )
    :vars
    (
      ?auto_880942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880941 ?auto_880942 ) ( ON-TABLE ?auto_880935 ) ( ON ?auto_880936 ?auto_880935 ) ( ON ?auto_880937 ?auto_880936 ) ( not ( = ?auto_880935 ?auto_880936 ) ) ( not ( = ?auto_880935 ?auto_880937 ) ) ( not ( = ?auto_880935 ?auto_880938 ) ) ( not ( = ?auto_880935 ?auto_880939 ) ) ( not ( = ?auto_880935 ?auto_880940 ) ) ( not ( = ?auto_880935 ?auto_880941 ) ) ( not ( = ?auto_880935 ?auto_880942 ) ) ( not ( = ?auto_880936 ?auto_880937 ) ) ( not ( = ?auto_880936 ?auto_880938 ) ) ( not ( = ?auto_880936 ?auto_880939 ) ) ( not ( = ?auto_880936 ?auto_880940 ) ) ( not ( = ?auto_880936 ?auto_880941 ) ) ( not ( = ?auto_880936 ?auto_880942 ) ) ( not ( = ?auto_880937 ?auto_880938 ) ) ( not ( = ?auto_880937 ?auto_880939 ) ) ( not ( = ?auto_880937 ?auto_880940 ) ) ( not ( = ?auto_880937 ?auto_880941 ) ) ( not ( = ?auto_880937 ?auto_880942 ) ) ( not ( = ?auto_880938 ?auto_880939 ) ) ( not ( = ?auto_880938 ?auto_880940 ) ) ( not ( = ?auto_880938 ?auto_880941 ) ) ( not ( = ?auto_880938 ?auto_880942 ) ) ( not ( = ?auto_880939 ?auto_880940 ) ) ( not ( = ?auto_880939 ?auto_880941 ) ) ( not ( = ?auto_880939 ?auto_880942 ) ) ( not ( = ?auto_880940 ?auto_880941 ) ) ( not ( = ?auto_880940 ?auto_880942 ) ) ( not ( = ?auto_880941 ?auto_880942 ) ) ( ON ?auto_880940 ?auto_880941 ) ( ON ?auto_880939 ?auto_880940 ) ( CLEAR ?auto_880937 ) ( ON ?auto_880938 ?auto_880939 ) ( CLEAR ?auto_880938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_880935 ?auto_880936 ?auto_880937 ?auto_880938 )
      ( MAKE-7PILE ?auto_880935 ?auto_880936 ?auto_880937 ?auto_880938 ?auto_880939 ?auto_880940 ?auto_880941 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_880965 - BLOCK
      ?auto_880966 - BLOCK
      ?auto_880967 - BLOCK
      ?auto_880968 - BLOCK
      ?auto_880969 - BLOCK
      ?auto_880970 - BLOCK
      ?auto_880971 - BLOCK
    )
    :vars
    (
      ?auto_880972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_880971 ?auto_880972 ) ( ON-TABLE ?auto_880965 ) ( ON ?auto_880966 ?auto_880965 ) ( not ( = ?auto_880965 ?auto_880966 ) ) ( not ( = ?auto_880965 ?auto_880967 ) ) ( not ( = ?auto_880965 ?auto_880968 ) ) ( not ( = ?auto_880965 ?auto_880969 ) ) ( not ( = ?auto_880965 ?auto_880970 ) ) ( not ( = ?auto_880965 ?auto_880971 ) ) ( not ( = ?auto_880965 ?auto_880972 ) ) ( not ( = ?auto_880966 ?auto_880967 ) ) ( not ( = ?auto_880966 ?auto_880968 ) ) ( not ( = ?auto_880966 ?auto_880969 ) ) ( not ( = ?auto_880966 ?auto_880970 ) ) ( not ( = ?auto_880966 ?auto_880971 ) ) ( not ( = ?auto_880966 ?auto_880972 ) ) ( not ( = ?auto_880967 ?auto_880968 ) ) ( not ( = ?auto_880967 ?auto_880969 ) ) ( not ( = ?auto_880967 ?auto_880970 ) ) ( not ( = ?auto_880967 ?auto_880971 ) ) ( not ( = ?auto_880967 ?auto_880972 ) ) ( not ( = ?auto_880968 ?auto_880969 ) ) ( not ( = ?auto_880968 ?auto_880970 ) ) ( not ( = ?auto_880968 ?auto_880971 ) ) ( not ( = ?auto_880968 ?auto_880972 ) ) ( not ( = ?auto_880969 ?auto_880970 ) ) ( not ( = ?auto_880969 ?auto_880971 ) ) ( not ( = ?auto_880969 ?auto_880972 ) ) ( not ( = ?auto_880970 ?auto_880971 ) ) ( not ( = ?auto_880970 ?auto_880972 ) ) ( not ( = ?auto_880971 ?auto_880972 ) ) ( ON ?auto_880970 ?auto_880971 ) ( ON ?auto_880969 ?auto_880970 ) ( ON ?auto_880968 ?auto_880969 ) ( CLEAR ?auto_880966 ) ( ON ?auto_880967 ?auto_880968 ) ( CLEAR ?auto_880967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_880965 ?auto_880966 ?auto_880967 )
      ( MAKE-7PILE ?auto_880965 ?auto_880966 ?auto_880967 ?auto_880968 ?auto_880969 ?auto_880970 ?auto_880971 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_880995 - BLOCK
      ?auto_880996 - BLOCK
      ?auto_880997 - BLOCK
      ?auto_880998 - BLOCK
      ?auto_880999 - BLOCK
      ?auto_881000 - BLOCK
      ?auto_881001 - BLOCK
    )
    :vars
    (
      ?auto_881002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881001 ?auto_881002 ) ( ON-TABLE ?auto_880995 ) ( not ( = ?auto_880995 ?auto_880996 ) ) ( not ( = ?auto_880995 ?auto_880997 ) ) ( not ( = ?auto_880995 ?auto_880998 ) ) ( not ( = ?auto_880995 ?auto_880999 ) ) ( not ( = ?auto_880995 ?auto_881000 ) ) ( not ( = ?auto_880995 ?auto_881001 ) ) ( not ( = ?auto_880995 ?auto_881002 ) ) ( not ( = ?auto_880996 ?auto_880997 ) ) ( not ( = ?auto_880996 ?auto_880998 ) ) ( not ( = ?auto_880996 ?auto_880999 ) ) ( not ( = ?auto_880996 ?auto_881000 ) ) ( not ( = ?auto_880996 ?auto_881001 ) ) ( not ( = ?auto_880996 ?auto_881002 ) ) ( not ( = ?auto_880997 ?auto_880998 ) ) ( not ( = ?auto_880997 ?auto_880999 ) ) ( not ( = ?auto_880997 ?auto_881000 ) ) ( not ( = ?auto_880997 ?auto_881001 ) ) ( not ( = ?auto_880997 ?auto_881002 ) ) ( not ( = ?auto_880998 ?auto_880999 ) ) ( not ( = ?auto_880998 ?auto_881000 ) ) ( not ( = ?auto_880998 ?auto_881001 ) ) ( not ( = ?auto_880998 ?auto_881002 ) ) ( not ( = ?auto_880999 ?auto_881000 ) ) ( not ( = ?auto_880999 ?auto_881001 ) ) ( not ( = ?auto_880999 ?auto_881002 ) ) ( not ( = ?auto_881000 ?auto_881001 ) ) ( not ( = ?auto_881000 ?auto_881002 ) ) ( not ( = ?auto_881001 ?auto_881002 ) ) ( ON ?auto_881000 ?auto_881001 ) ( ON ?auto_880999 ?auto_881000 ) ( ON ?auto_880998 ?auto_880999 ) ( ON ?auto_880997 ?auto_880998 ) ( CLEAR ?auto_880995 ) ( ON ?auto_880996 ?auto_880997 ) ( CLEAR ?auto_880996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_880995 ?auto_880996 )
      ( MAKE-7PILE ?auto_880995 ?auto_880996 ?auto_880997 ?auto_880998 ?auto_880999 ?auto_881000 ?auto_881001 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_881025 - BLOCK
      ?auto_881026 - BLOCK
      ?auto_881027 - BLOCK
      ?auto_881028 - BLOCK
      ?auto_881029 - BLOCK
      ?auto_881030 - BLOCK
      ?auto_881031 - BLOCK
    )
    :vars
    (
      ?auto_881032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881031 ?auto_881032 ) ( not ( = ?auto_881025 ?auto_881026 ) ) ( not ( = ?auto_881025 ?auto_881027 ) ) ( not ( = ?auto_881025 ?auto_881028 ) ) ( not ( = ?auto_881025 ?auto_881029 ) ) ( not ( = ?auto_881025 ?auto_881030 ) ) ( not ( = ?auto_881025 ?auto_881031 ) ) ( not ( = ?auto_881025 ?auto_881032 ) ) ( not ( = ?auto_881026 ?auto_881027 ) ) ( not ( = ?auto_881026 ?auto_881028 ) ) ( not ( = ?auto_881026 ?auto_881029 ) ) ( not ( = ?auto_881026 ?auto_881030 ) ) ( not ( = ?auto_881026 ?auto_881031 ) ) ( not ( = ?auto_881026 ?auto_881032 ) ) ( not ( = ?auto_881027 ?auto_881028 ) ) ( not ( = ?auto_881027 ?auto_881029 ) ) ( not ( = ?auto_881027 ?auto_881030 ) ) ( not ( = ?auto_881027 ?auto_881031 ) ) ( not ( = ?auto_881027 ?auto_881032 ) ) ( not ( = ?auto_881028 ?auto_881029 ) ) ( not ( = ?auto_881028 ?auto_881030 ) ) ( not ( = ?auto_881028 ?auto_881031 ) ) ( not ( = ?auto_881028 ?auto_881032 ) ) ( not ( = ?auto_881029 ?auto_881030 ) ) ( not ( = ?auto_881029 ?auto_881031 ) ) ( not ( = ?auto_881029 ?auto_881032 ) ) ( not ( = ?auto_881030 ?auto_881031 ) ) ( not ( = ?auto_881030 ?auto_881032 ) ) ( not ( = ?auto_881031 ?auto_881032 ) ) ( ON ?auto_881030 ?auto_881031 ) ( ON ?auto_881029 ?auto_881030 ) ( ON ?auto_881028 ?auto_881029 ) ( ON ?auto_881027 ?auto_881028 ) ( ON ?auto_881026 ?auto_881027 ) ( ON ?auto_881025 ?auto_881026 ) ( CLEAR ?auto_881025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_881025 )
      ( MAKE-7PILE ?auto_881025 ?auto_881026 ?auto_881027 ?auto_881028 ?auto_881029 ?auto_881030 ?auto_881031 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_881056 - BLOCK
      ?auto_881057 - BLOCK
      ?auto_881058 - BLOCK
      ?auto_881059 - BLOCK
      ?auto_881060 - BLOCK
      ?auto_881061 - BLOCK
      ?auto_881062 - BLOCK
      ?auto_881063 - BLOCK
    )
    :vars
    (
      ?auto_881064 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_881062 ) ( ON ?auto_881063 ?auto_881064 ) ( CLEAR ?auto_881063 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_881056 ) ( ON ?auto_881057 ?auto_881056 ) ( ON ?auto_881058 ?auto_881057 ) ( ON ?auto_881059 ?auto_881058 ) ( ON ?auto_881060 ?auto_881059 ) ( ON ?auto_881061 ?auto_881060 ) ( ON ?auto_881062 ?auto_881061 ) ( not ( = ?auto_881056 ?auto_881057 ) ) ( not ( = ?auto_881056 ?auto_881058 ) ) ( not ( = ?auto_881056 ?auto_881059 ) ) ( not ( = ?auto_881056 ?auto_881060 ) ) ( not ( = ?auto_881056 ?auto_881061 ) ) ( not ( = ?auto_881056 ?auto_881062 ) ) ( not ( = ?auto_881056 ?auto_881063 ) ) ( not ( = ?auto_881056 ?auto_881064 ) ) ( not ( = ?auto_881057 ?auto_881058 ) ) ( not ( = ?auto_881057 ?auto_881059 ) ) ( not ( = ?auto_881057 ?auto_881060 ) ) ( not ( = ?auto_881057 ?auto_881061 ) ) ( not ( = ?auto_881057 ?auto_881062 ) ) ( not ( = ?auto_881057 ?auto_881063 ) ) ( not ( = ?auto_881057 ?auto_881064 ) ) ( not ( = ?auto_881058 ?auto_881059 ) ) ( not ( = ?auto_881058 ?auto_881060 ) ) ( not ( = ?auto_881058 ?auto_881061 ) ) ( not ( = ?auto_881058 ?auto_881062 ) ) ( not ( = ?auto_881058 ?auto_881063 ) ) ( not ( = ?auto_881058 ?auto_881064 ) ) ( not ( = ?auto_881059 ?auto_881060 ) ) ( not ( = ?auto_881059 ?auto_881061 ) ) ( not ( = ?auto_881059 ?auto_881062 ) ) ( not ( = ?auto_881059 ?auto_881063 ) ) ( not ( = ?auto_881059 ?auto_881064 ) ) ( not ( = ?auto_881060 ?auto_881061 ) ) ( not ( = ?auto_881060 ?auto_881062 ) ) ( not ( = ?auto_881060 ?auto_881063 ) ) ( not ( = ?auto_881060 ?auto_881064 ) ) ( not ( = ?auto_881061 ?auto_881062 ) ) ( not ( = ?auto_881061 ?auto_881063 ) ) ( not ( = ?auto_881061 ?auto_881064 ) ) ( not ( = ?auto_881062 ?auto_881063 ) ) ( not ( = ?auto_881062 ?auto_881064 ) ) ( not ( = ?auto_881063 ?auto_881064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_881063 ?auto_881064 )
      ( !STACK ?auto_881063 ?auto_881062 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_881090 - BLOCK
      ?auto_881091 - BLOCK
      ?auto_881092 - BLOCK
      ?auto_881093 - BLOCK
      ?auto_881094 - BLOCK
      ?auto_881095 - BLOCK
      ?auto_881096 - BLOCK
      ?auto_881097 - BLOCK
    )
    :vars
    (
      ?auto_881098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881097 ?auto_881098 ) ( ON-TABLE ?auto_881090 ) ( ON ?auto_881091 ?auto_881090 ) ( ON ?auto_881092 ?auto_881091 ) ( ON ?auto_881093 ?auto_881092 ) ( ON ?auto_881094 ?auto_881093 ) ( ON ?auto_881095 ?auto_881094 ) ( not ( = ?auto_881090 ?auto_881091 ) ) ( not ( = ?auto_881090 ?auto_881092 ) ) ( not ( = ?auto_881090 ?auto_881093 ) ) ( not ( = ?auto_881090 ?auto_881094 ) ) ( not ( = ?auto_881090 ?auto_881095 ) ) ( not ( = ?auto_881090 ?auto_881096 ) ) ( not ( = ?auto_881090 ?auto_881097 ) ) ( not ( = ?auto_881090 ?auto_881098 ) ) ( not ( = ?auto_881091 ?auto_881092 ) ) ( not ( = ?auto_881091 ?auto_881093 ) ) ( not ( = ?auto_881091 ?auto_881094 ) ) ( not ( = ?auto_881091 ?auto_881095 ) ) ( not ( = ?auto_881091 ?auto_881096 ) ) ( not ( = ?auto_881091 ?auto_881097 ) ) ( not ( = ?auto_881091 ?auto_881098 ) ) ( not ( = ?auto_881092 ?auto_881093 ) ) ( not ( = ?auto_881092 ?auto_881094 ) ) ( not ( = ?auto_881092 ?auto_881095 ) ) ( not ( = ?auto_881092 ?auto_881096 ) ) ( not ( = ?auto_881092 ?auto_881097 ) ) ( not ( = ?auto_881092 ?auto_881098 ) ) ( not ( = ?auto_881093 ?auto_881094 ) ) ( not ( = ?auto_881093 ?auto_881095 ) ) ( not ( = ?auto_881093 ?auto_881096 ) ) ( not ( = ?auto_881093 ?auto_881097 ) ) ( not ( = ?auto_881093 ?auto_881098 ) ) ( not ( = ?auto_881094 ?auto_881095 ) ) ( not ( = ?auto_881094 ?auto_881096 ) ) ( not ( = ?auto_881094 ?auto_881097 ) ) ( not ( = ?auto_881094 ?auto_881098 ) ) ( not ( = ?auto_881095 ?auto_881096 ) ) ( not ( = ?auto_881095 ?auto_881097 ) ) ( not ( = ?auto_881095 ?auto_881098 ) ) ( not ( = ?auto_881096 ?auto_881097 ) ) ( not ( = ?auto_881096 ?auto_881098 ) ) ( not ( = ?auto_881097 ?auto_881098 ) ) ( CLEAR ?auto_881095 ) ( ON ?auto_881096 ?auto_881097 ) ( CLEAR ?auto_881096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_881090 ?auto_881091 ?auto_881092 ?auto_881093 ?auto_881094 ?auto_881095 ?auto_881096 )
      ( MAKE-8PILE ?auto_881090 ?auto_881091 ?auto_881092 ?auto_881093 ?auto_881094 ?auto_881095 ?auto_881096 ?auto_881097 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_881124 - BLOCK
      ?auto_881125 - BLOCK
      ?auto_881126 - BLOCK
      ?auto_881127 - BLOCK
      ?auto_881128 - BLOCK
      ?auto_881129 - BLOCK
      ?auto_881130 - BLOCK
      ?auto_881131 - BLOCK
    )
    :vars
    (
      ?auto_881132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881131 ?auto_881132 ) ( ON-TABLE ?auto_881124 ) ( ON ?auto_881125 ?auto_881124 ) ( ON ?auto_881126 ?auto_881125 ) ( ON ?auto_881127 ?auto_881126 ) ( ON ?auto_881128 ?auto_881127 ) ( not ( = ?auto_881124 ?auto_881125 ) ) ( not ( = ?auto_881124 ?auto_881126 ) ) ( not ( = ?auto_881124 ?auto_881127 ) ) ( not ( = ?auto_881124 ?auto_881128 ) ) ( not ( = ?auto_881124 ?auto_881129 ) ) ( not ( = ?auto_881124 ?auto_881130 ) ) ( not ( = ?auto_881124 ?auto_881131 ) ) ( not ( = ?auto_881124 ?auto_881132 ) ) ( not ( = ?auto_881125 ?auto_881126 ) ) ( not ( = ?auto_881125 ?auto_881127 ) ) ( not ( = ?auto_881125 ?auto_881128 ) ) ( not ( = ?auto_881125 ?auto_881129 ) ) ( not ( = ?auto_881125 ?auto_881130 ) ) ( not ( = ?auto_881125 ?auto_881131 ) ) ( not ( = ?auto_881125 ?auto_881132 ) ) ( not ( = ?auto_881126 ?auto_881127 ) ) ( not ( = ?auto_881126 ?auto_881128 ) ) ( not ( = ?auto_881126 ?auto_881129 ) ) ( not ( = ?auto_881126 ?auto_881130 ) ) ( not ( = ?auto_881126 ?auto_881131 ) ) ( not ( = ?auto_881126 ?auto_881132 ) ) ( not ( = ?auto_881127 ?auto_881128 ) ) ( not ( = ?auto_881127 ?auto_881129 ) ) ( not ( = ?auto_881127 ?auto_881130 ) ) ( not ( = ?auto_881127 ?auto_881131 ) ) ( not ( = ?auto_881127 ?auto_881132 ) ) ( not ( = ?auto_881128 ?auto_881129 ) ) ( not ( = ?auto_881128 ?auto_881130 ) ) ( not ( = ?auto_881128 ?auto_881131 ) ) ( not ( = ?auto_881128 ?auto_881132 ) ) ( not ( = ?auto_881129 ?auto_881130 ) ) ( not ( = ?auto_881129 ?auto_881131 ) ) ( not ( = ?auto_881129 ?auto_881132 ) ) ( not ( = ?auto_881130 ?auto_881131 ) ) ( not ( = ?auto_881130 ?auto_881132 ) ) ( not ( = ?auto_881131 ?auto_881132 ) ) ( ON ?auto_881130 ?auto_881131 ) ( CLEAR ?auto_881128 ) ( ON ?auto_881129 ?auto_881130 ) ( CLEAR ?auto_881129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_881124 ?auto_881125 ?auto_881126 ?auto_881127 ?auto_881128 ?auto_881129 )
      ( MAKE-8PILE ?auto_881124 ?auto_881125 ?auto_881126 ?auto_881127 ?auto_881128 ?auto_881129 ?auto_881130 ?auto_881131 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_881158 - BLOCK
      ?auto_881159 - BLOCK
      ?auto_881160 - BLOCK
      ?auto_881161 - BLOCK
      ?auto_881162 - BLOCK
      ?auto_881163 - BLOCK
      ?auto_881164 - BLOCK
      ?auto_881165 - BLOCK
    )
    :vars
    (
      ?auto_881166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881165 ?auto_881166 ) ( ON-TABLE ?auto_881158 ) ( ON ?auto_881159 ?auto_881158 ) ( ON ?auto_881160 ?auto_881159 ) ( ON ?auto_881161 ?auto_881160 ) ( not ( = ?auto_881158 ?auto_881159 ) ) ( not ( = ?auto_881158 ?auto_881160 ) ) ( not ( = ?auto_881158 ?auto_881161 ) ) ( not ( = ?auto_881158 ?auto_881162 ) ) ( not ( = ?auto_881158 ?auto_881163 ) ) ( not ( = ?auto_881158 ?auto_881164 ) ) ( not ( = ?auto_881158 ?auto_881165 ) ) ( not ( = ?auto_881158 ?auto_881166 ) ) ( not ( = ?auto_881159 ?auto_881160 ) ) ( not ( = ?auto_881159 ?auto_881161 ) ) ( not ( = ?auto_881159 ?auto_881162 ) ) ( not ( = ?auto_881159 ?auto_881163 ) ) ( not ( = ?auto_881159 ?auto_881164 ) ) ( not ( = ?auto_881159 ?auto_881165 ) ) ( not ( = ?auto_881159 ?auto_881166 ) ) ( not ( = ?auto_881160 ?auto_881161 ) ) ( not ( = ?auto_881160 ?auto_881162 ) ) ( not ( = ?auto_881160 ?auto_881163 ) ) ( not ( = ?auto_881160 ?auto_881164 ) ) ( not ( = ?auto_881160 ?auto_881165 ) ) ( not ( = ?auto_881160 ?auto_881166 ) ) ( not ( = ?auto_881161 ?auto_881162 ) ) ( not ( = ?auto_881161 ?auto_881163 ) ) ( not ( = ?auto_881161 ?auto_881164 ) ) ( not ( = ?auto_881161 ?auto_881165 ) ) ( not ( = ?auto_881161 ?auto_881166 ) ) ( not ( = ?auto_881162 ?auto_881163 ) ) ( not ( = ?auto_881162 ?auto_881164 ) ) ( not ( = ?auto_881162 ?auto_881165 ) ) ( not ( = ?auto_881162 ?auto_881166 ) ) ( not ( = ?auto_881163 ?auto_881164 ) ) ( not ( = ?auto_881163 ?auto_881165 ) ) ( not ( = ?auto_881163 ?auto_881166 ) ) ( not ( = ?auto_881164 ?auto_881165 ) ) ( not ( = ?auto_881164 ?auto_881166 ) ) ( not ( = ?auto_881165 ?auto_881166 ) ) ( ON ?auto_881164 ?auto_881165 ) ( ON ?auto_881163 ?auto_881164 ) ( CLEAR ?auto_881161 ) ( ON ?auto_881162 ?auto_881163 ) ( CLEAR ?auto_881162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_881158 ?auto_881159 ?auto_881160 ?auto_881161 ?auto_881162 )
      ( MAKE-8PILE ?auto_881158 ?auto_881159 ?auto_881160 ?auto_881161 ?auto_881162 ?auto_881163 ?auto_881164 ?auto_881165 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_881192 - BLOCK
      ?auto_881193 - BLOCK
      ?auto_881194 - BLOCK
      ?auto_881195 - BLOCK
      ?auto_881196 - BLOCK
      ?auto_881197 - BLOCK
      ?auto_881198 - BLOCK
      ?auto_881199 - BLOCK
    )
    :vars
    (
      ?auto_881200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881199 ?auto_881200 ) ( ON-TABLE ?auto_881192 ) ( ON ?auto_881193 ?auto_881192 ) ( ON ?auto_881194 ?auto_881193 ) ( not ( = ?auto_881192 ?auto_881193 ) ) ( not ( = ?auto_881192 ?auto_881194 ) ) ( not ( = ?auto_881192 ?auto_881195 ) ) ( not ( = ?auto_881192 ?auto_881196 ) ) ( not ( = ?auto_881192 ?auto_881197 ) ) ( not ( = ?auto_881192 ?auto_881198 ) ) ( not ( = ?auto_881192 ?auto_881199 ) ) ( not ( = ?auto_881192 ?auto_881200 ) ) ( not ( = ?auto_881193 ?auto_881194 ) ) ( not ( = ?auto_881193 ?auto_881195 ) ) ( not ( = ?auto_881193 ?auto_881196 ) ) ( not ( = ?auto_881193 ?auto_881197 ) ) ( not ( = ?auto_881193 ?auto_881198 ) ) ( not ( = ?auto_881193 ?auto_881199 ) ) ( not ( = ?auto_881193 ?auto_881200 ) ) ( not ( = ?auto_881194 ?auto_881195 ) ) ( not ( = ?auto_881194 ?auto_881196 ) ) ( not ( = ?auto_881194 ?auto_881197 ) ) ( not ( = ?auto_881194 ?auto_881198 ) ) ( not ( = ?auto_881194 ?auto_881199 ) ) ( not ( = ?auto_881194 ?auto_881200 ) ) ( not ( = ?auto_881195 ?auto_881196 ) ) ( not ( = ?auto_881195 ?auto_881197 ) ) ( not ( = ?auto_881195 ?auto_881198 ) ) ( not ( = ?auto_881195 ?auto_881199 ) ) ( not ( = ?auto_881195 ?auto_881200 ) ) ( not ( = ?auto_881196 ?auto_881197 ) ) ( not ( = ?auto_881196 ?auto_881198 ) ) ( not ( = ?auto_881196 ?auto_881199 ) ) ( not ( = ?auto_881196 ?auto_881200 ) ) ( not ( = ?auto_881197 ?auto_881198 ) ) ( not ( = ?auto_881197 ?auto_881199 ) ) ( not ( = ?auto_881197 ?auto_881200 ) ) ( not ( = ?auto_881198 ?auto_881199 ) ) ( not ( = ?auto_881198 ?auto_881200 ) ) ( not ( = ?auto_881199 ?auto_881200 ) ) ( ON ?auto_881198 ?auto_881199 ) ( ON ?auto_881197 ?auto_881198 ) ( ON ?auto_881196 ?auto_881197 ) ( CLEAR ?auto_881194 ) ( ON ?auto_881195 ?auto_881196 ) ( CLEAR ?auto_881195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_881192 ?auto_881193 ?auto_881194 ?auto_881195 )
      ( MAKE-8PILE ?auto_881192 ?auto_881193 ?auto_881194 ?auto_881195 ?auto_881196 ?auto_881197 ?auto_881198 ?auto_881199 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_881226 - BLOCK
      ?auto_881227 - BLOCK
      ?auto_881228 - BLOCK
      ?auto_881229 - BLOCK
      ?auto_881230 - BLOCK
      ?auto_881231 - BLOCK
      ?auto_881232 - BLOCK
      ?auto_881233 - BLOCK
    )
    :vars
    (
      ?auto_881234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881233 ?auto_881234 ) ( ON-TABLE ?auto_881226 ) ( ON ?auto_881227 ?auto_881226 ) ( not ( = ?auto_881226 ?auto_881227 ) ) ( not ( = ?auto_881226 ?auto_881228 ) ) ( not ( = ?auto_881226 ?auto_881229 ) ) ( not ( = ?auto_881226 ?auto_881230 ) ) ( not ( = ?auto_881226 ?auto_881231 ) ) ( not ( = ?auto_881226 ?auto_881232 ) ) ( not ( = ?auto_881226 ?auto_881233 ) ) ( not ( = ?auto_881226 ?auto_881234 ) ) ( not ( = ?auto_881227 ?auto_881228 ) ) ( not ( = ?auto_881227 ?auto_881229 ) ) ( not ( = ?auto_881227 ?auto_881230 ) ) ( not ( = ?auto_881227 ?auto_881231 ) ) ( not ( = ?auto_881227 ?auto_881232 ) ) ( not ( = ?auto_881227 ?auto_881233 ) ) ( not ( = ?auto_881227 ?auto_881234 ) ) ( not ( = ?auto_881228 ?auto_881229 ) ) ( not ( = ?auto_881228 ?auto_881230 ) ) ( not ( = ?auto_881228 ?auto_881231 ) ) ( not ( = ?auto_881228 ?auto_881232 ) ) ( not ( = ?auto_881228 ?auto_881233 ) ) ( not ( = ?auto_881228 ?auto_881234 ) ) ( not ( = ?auto_881229 ?auto_881230 ) ) ( not ( = ?auto_881229 ?auto_881231 ) ) ( not ( = ?auto_881229 ?auto_881232 ) ) ( not ( = ?auto_881229 ?auto_881233 ) ) ( not ( = ?auto_881229 ?auto_881234 ) ) ( not ( = ?auto_881230 ?auto_881231 ) ) ( not ( = ?auto_881230 ?auto_881232 ) ) ( not ( = ?auto_881230 ?auto_881233 ) ) ( not ( = ?auto_881230 ?auto_881234 ) ) ( not ( = ?auto_881231 ?auto_881232 ) ) ( not ( = ?auto_881231 ?auto_881233 ) ) ( not ( = ?auto_881231 ?auto_881234 ) ) ( not ( = ?auto_881232 ?auto_881233 ) ) ( not ( = ?auto_881232 ?auto_881234 ) ) ( not ( = ?auto_881233 ?auto_881234 ) ) ( ON ?auto_881232 ?auto_881233 ) ( ON ?auto_881231 ?auto_881232 ) ( ON ?auto_881230 ?auto_881231 ) ( ON ?auto_881229 ?auto_881230 ) ( CLEAR ?auto_881227 ) ( ON ?auto_881228 ?auto_881229 ) ( CLEAR ?auto_881228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_881226 ?auto_881227 ?auto_881228 )
      ( MAKE-8PILE ?auto_881226 ?auto_881227 ?auto_881228 ?auto_881229 ?auto_881230 ?auto_881231 ?auto_881232 ?auto_881233 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_881260 - BLOCK
      ?auto_881261 - BLOCK
      ?auto_881262 - BLOCK
      ?auto_881263 - BLOCK
      ?auto_881264 - BLOCK
      ?auto_881265 - BLOCK
      ?auto_881266 - BLOCK
      ?auto_881267 - BLOCK
    )
    :vars
    (
      ?auto_881268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881267 ?auto_881268 ) ( ON-TABLE ?auto_881260 ) ( not ( = ?auto_881260 ?auto_881261 ) ) ( not ( = ?auto_881260 ?auto_881262 ) ) ( not ( = ?auto_881260 ?auto_881263 ) ) ( not ( = ?auto_881260 ?auto_881264 ) ) ( not ( = ?auto_881260 ?auto_881265 ) ) ( not ( = ?auto_881260 ?auto_881266 ) ) ( not ( = ?auto_881260 ?auto_881267 ) ) ( not ( = ?auto_881260 ?auto_881268 ) ) ( not ( = ?auto_881261 ?auto_881262 ) ) ( not ( = ?auto_881261 ?auto_881263 ) ) ( not ( = ?auto_881261 ?auto_881264 ) ) ( not ( = ?auto_881261 ?auto_881265 ) ) ( not ( = ?auto_881261 ?auto_881266 ) ) ( not ( = ?auto_881261 ?auto_881267 ) ) ( not ( = ?auto_881261 ?auto_881268 ) ) ( not ( = ?auto_881262 ?auto_881263 ) ) ( not ( = ?auto_881262 ?auto_881264 ) ) ( not ( = ?auto_881262 ?auto_881265 ) ) ( not ( = ?auto_881262 ?auto_881266 ) ) ( not ( = ?auto_881262 ?auto_881267 ) ) ( not ( = ?auto_881262 ?auto_881268 ) ) ( not ( = ?auto_881263 ?auto_881264 ) ) ( not ( = ?auto_881263 ?auto_881265 ) ) ( not ( = ?auto_881263 ?auto_881266 ) ) ( not ( = ?auto_881263 ?auto_881267 ) ) ( not ( = ?auto_881263 ?auto_881268 ) ) ( not ( = ?auto_881264 ?auto_881265 ) ) ( not ( = ?auto_881264 ?auto_881266 ) ) ( not ( = ?auto_881264 ?auto_881267 ) ) ( not ( = ?auto_881264 ?auto_881268 ) ) ( not ( = ?auto_881265 ?auto_881266 ) ) ( not ( = ?auto_881265 ?auto_881267 ) ) ( not ( = ?auto_881265 ?auto_881268 ) ) ( not ( = ?auto_881266 ?auto_881267 ) ) ( not ( = ?auto_881266 ?auto_881268 ) ) ( not ( = ?auto_881267 ?auto_881268 ) ) ( ON ?auto_881266 ?auto_881267 ) ( ON ?auto_881265 ?auto_881266 ) ( ON ?auto_881264 ?auto_881265 ) ( ON ?auto_881263 ?auto_881264 ) ( ON ?auto_881262 ?auto_881263 ) ( CLEAR ?auto_881260 ) ( ON ?auto_881261 ?auto_881262 ) ( CLEAR ?auto_881261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_881260 ?auto_881261 )
      ( MAKE-8PILE ?auto_881260 ?auto_881261 ?auto_881262 ?auto_881263 ?auto_881264 ?auto_881265 ?auto_881266 ?auto_881267 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_881294 - BLOCK
      ?auto_881295 - BLOCK
      ?auto_881296 - BLOCK
      ?auto_881297 - BLOCK
      ?auto_881298 - BLOCK
      ?auto_881299 - BLOCK
      ?auto_881300 - BLOCK
      ?auto_881301 - BLOCK
    )
    :vars
    (
      ?auto_881302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881301 ?auto_881302 ) ( not ( = ?auto_881294 ?auto_881295 ) ) ( not ( = ?auto_881294 ?auto_881296 ) ) ( not ( = ?auto_881294 ?auto_881297 ) ) ( not ( = ?auto_881294 ?auto_881298 ) ) ( not ( = ?auto_881294 ?auto_881299 ) ) ( not ( = ?auto_881294 ?auto_881300 ) ) ( not ( = ?auto_881294 ?auto_881301 ) ) ( not ( = ?auto_881294 ?auto_881302 ) ) ( not ( = ?auto_881295 ?auto_881296 ) ) ( not ( = ?auto_881295 ?auto_881297 ) ) ( not ( = ?auto_881295 ?auto_881298 ) ) ( not ( = ?auto_881295 ?auto_881299 ) ) ( not ( = ?auto_881295 ?auto_881300 ) ) ( not ( = ?auto_881295 ?auto_881301 ) ) ( not ( = ?auto_881295 ?auto_881302 ) ) ( not ( = ?auto_881296 ?auto_881297 ) ) ( not ( = ?auto_881296 ?auto_881298 ) ) ( not ( = ?auto_881296 ?auto_881299 ) ) ( not ( = ?auto_881296 ?auto_881300 ) ) ( not ( = ?auto_881296 ?auto_881301 ) ) ( not ( = ?auto_881296 ?auto_881302 ) ) ( not ( = ?auto_881297 ?auto_881298 ) ) ( not ( = ?auto_881297 ?auto_881299 ) ) ( not ( = ?auto_881297 ?auto_881300 ) ) ( not ( = ?auto_881297 ?auto_881301 ) ) ( not ( = ?auto_881297 ?auto_881302 ) ) ( not ( = ?auto_881298 ?auto_881299 ) ) ( not ( = ?auto_881298 ?auto_881300 ) ) ( not ( = ?auto_881298 ?auto_881301 ) ) ( not ( = ?auto_881298 ?auto_881302 ) ) ( not ( = ?auto_881299 ?auto_881300 ) ) ( not ( = ?auto_881299 ?auto_881301 ) ) ( not ( = ?auto_881299 ?auto_881302 ) ) ( not ( = ?auto_881300 ?auto_881301 ) ) ( not ( = ?auto_881300 ?auto_881302 ) ) ( not ( = ?auto_881301 ?auto_881302 ) ) ( ON ?auto_881300 ?auto_881301 ) ( ON ?auto_881299 ?auto_881300 ) ( ON ?auto_881298 ?auto_881299 ) ( ON ?auto_881297 ?auto_881298 ) ( ON ?auto_881296 ?auto_881297 ) ( ON ?auto_881295 ?auto_881296 ) ( ON ?auto_881294 ?auto_881295 ) ( CLEAR ?auto_881294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_881294 )
      ( MAKE-8PILE ?auto_881294 ?auto_881295 ?auto_881296 ?auto_881297 ?auto_881298 ?auto_881299 ?auto_881300 ?auto_881301 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_881329 - BLOCK
      ?auto_881330 - BLOCK
      ?auto_881331 - BLOCK
      ?auto_881332 - BLOCK
      ?auto_881333 - BLOCK
      ?auto_881334 - BLOCK
      ?auto_881335 - BLOCK
      ?auto_881336 - BLOCK
      ?auto_881337 - BLOCK
    )
    :vars
    (
      ?auto_881338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_881336 ) ( ON ?auto_881337 ?auto_881338 ) ( CLEAR ?auto_881337 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_881329 ) ( ON ?auto_881330 ?auto_881329 ) ( ON ?auto_881331 ?auto_881330 ) ( ON ?auto_881332 ?auto_881331 ) ( ON ?auto_881333 ?auto_881332 ) ( ON ?auto_881334 ?auto_881333 ) ( ON ?auto_881335 ?auto_881334 ) ( ON ?auto_881336 ?auto_881335 ) ( not ( = ?auto_881329 ?auto_881330 ) ) ( not ( = ?auto_881329 ?auto_881331 ) ) ( not ( = ?auto_881329 ?auto_881332 ) ) ( not ( = ?auto_881329 ?auto_881333 ) ) ( not ( = ?auto_881329 ?auto_881334 ) ) ( not ( = ?auto_881329 ?auto_881335 ) ) ( not ( = ?auto_881329 ?auto_881336 ) ) ( not ( = ?auto_881329 ?auto_881337 ) ) ( not ( = ?auto_881329 ?auto_881338 ) ) ( not ( = ?auto_881330 ?auto_881331 ) ) ( not ( = ?auto_881330 ?auto_881332 ) ) ( not ( = ?auto_881330 ?auto_881333 ) ) ( not ( = ?auto_881330 ?auto_881334 ) ) ( not ( = ?auto_881330 ?auto_881335 ) ) ( not ( = ?auto_881330 ?auto_881336 ) ) ( not ( = ?auto_881330 ?auto_881337 ) ) ( not ( = ?auto_881330 ?auto_881338 ) ) ( not ( = ?auto_881331 ?auto_881332 ) ) ( not ( = ?auto_881331 ?auto_881333 ) ) ( not ( = ?auto_881331 ?auto_881334 ) ) ( not ( = ?auto_881331 ?auto_881335 ) ) ( not ( = ?auto_881331 ?auto_881336 ) ) ( not ( = ?auto_881331 ?auto_881337 ) ) ( not ( = ?auto_881331 ?auto_881338 ) ) ( not ( = ?auto_881332 ?auto_881333 ) ) ( not ( = ?auto_881332 ?auto_881334 ) ) ( not ( = ?auto_881332 ?auto_881335 ) ) ( not ( = ?auto_881332 ?auto_881336 ) ) ( not ( = ?auto_881332 ?auto_881337 ) ) ( not ( = ?auto_881332 ?auto_881338 ) ) ( not ( = ?auto_881333 ?auto_881334 ) ) ( not ( = ?auto_881333 ?auto_881335 ) ) ( not ( = ?auto_881333 ?auto_881336 ) ) ( not ( = ?auto_881333 ?auto_881337 ) ) ( not ( = ?auto_881333 ?auto_881338 ) ) ( not ( = ?auto_881334 ?auto_881335 ) ) ( not ( = ?auto_881334 ?auto_881336 ) ) ( not ( = ?auto_881334 ?auto_881337 ) ) ( not ( = ?auto_881334 ?auto_881338 ) ) ( not ( = ?auto_881335 ?auto_881336 ) ) ( not ( = ?auto_881335 ?auto_881337 ) ) ( not ( = ?auto_881335 ?auto_881338 ) ) ( not ( = ?auto_881336 ?auto_881337 ) ) ( not ( = ?auto_881336 ?auto_881338 ) ) ( not ( = ?auto_881337 ?auto_881338 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_881337 ?auto_881338 )
      ( !STACK ?auto_881337 ?auto_881336 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_881367 - BLOCK
      ?auto_881368 - BLOCK
      ?auto_881369 - BLOCK
      ?auto_881370 - BLOCK
      ?auto_881371 - BLOCK
      ?auto_881372 - BLOCK
      ?auto_881373 - BLOCK
      ?auto_881374 - BLOCK
      ?auto_881375 - BLOCK
    )
    :vars
    (
      ?auto_881376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881375 ?auto_881376 ) ( ON-TABLE ?auto_881367 ) ( ON ?auto_881368 ?auto_881367 ) ( ON ?auto_881369 ?auto_881368 ) ( ON ?auto_881370 ?auto_881369 ) ( ON ?auto_881371 ?auto_881370 ) ( ON ?auto_881372 ?auto_881371 ) ( ON ?auto_881373 ?auto_881372 ) ( not ( = ?auto_881367 ?auto_881368 ) ) ( not ( = ?auto_881367 ?auto_881369 ) ) ( not ( = ?auto_881367 ?auto_881370 ) ) ( not ( = ?auto_881367 ?auto_881371 ) ) ( not ( = ?auto_881367 ?auto_881372 ) ) ( not ( = ?auto_881367 ?auto_881373 ) ) ( not ( = ?auto_881367 ?auto_881374 ) ) ( not ( = ?auto_881367 ?auto_881375 ) ) ( not ( = ?auto_881367 ?auto_881376 ) ) ( not ( = ?auto_881368 ?auto_881369 ) ) ( not ( = ?auto_881368 ?auto_881370 ) ) ( not ( = ?auto_881368 ?auto_881371 ) ) ( not ( = ?auto_881368 ?auto_881372 ) ) ( not ( = ?auto_881368 ?auto_881373 ) ) ( not ( = ?auto_881368 ?auto_881374 ) ) ( not ( = ?auto_881368 ?auto_881375 ) ) ( not ( = ?auto_881368 ?auto_881376 ) ) ( not ( = ?auto_881369 ?auto_881370 ) ) ( not ( = ?auto_881369 ?auto_881371 ) ) ( not ( = ?auto_881369 ?auto_881372 ) ) ( not ( = ?auto_881369 ?auto_881373 ) ) ( not ( = ?auto_881369 ?auto_881374 ) ) ( not ( = ?auto_881369 ?auto_881375 ) ) ( not ( = ?auto_881369 ?auto_881376 ) ) ( not ( = ?auto_881370 ?auto_881371 ) ) ( not ( = ?auto_881370 ?auto_881372 ) ) ( not ( = ?auto_881370 ?auto_881373 ) ) ( not ( = ?auto_881370 ?auto_881374 ) ) ( not ( = ?auto_881370 ?auto_881375 ) ) ( not ( = ?auto_881370 ?auto_881376 ) ) ( not ( = ?auto_881371 ?auto_881372 ) ) ( not ( = ?auto_881371 ?auto_881373 ) ) ( not ( = ?auto_881371 ?auto_881374 ) ) ( not ( = ?auto_881371 ?auto_881375 ) ) ( not ( = ?auto_881371 ?auto_881376 ) ) ( not ( = ?auto_881372 ?auto_881373 ) ) ( not ( = ?auto_881372 ?auto_881374 ) ) ( not ( = ?auto_881372 ?auto_881375 ) ) ( not ( = ?auto_881372 ?auto_881376 ) ) ( not ( = ?auto_881373 ?auto_881374 ) ) ( not ( = ?auto_881373 ?auto_881375 ) ) ( not ( = ?auto_881373 ?auto_881376 ) ) ( not ( = ?auto_881374 ?auto_881375 ) ) ( not ( = ?auto_881374 ?auto_881376 ) ) ( not ( = ?auto_881375 ?auto_881376 ) ) ( CLEAR ?auto_881373 ) ( ON ?auto_881374 ?auto_881375 ) ( CLEAR ?auto_881374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_881367 ?auto_881368 ?auto_881369 ?auto_881370 ?auto_881371 ?auto_881372 ?auto_881373 ?auto_881374 )
      ( MAKE-9PILE ?auto_881367 ?auto_881368 ?auto_881369 ?auto_881370 ?auto_881371 ?auto_881372 ?auto_881373 ?auto_881374 ?auto_881375 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_881405 - BLOCK
      ?auto_881406 - BLOCK
      ?auto_881407 - BLOCK
      ?auto_881408 - BLOCK
      ?auto_881409 - BLOCK
      ?auto_881410 - BLOCK
      ?auto_881411 - BLOCK
      ?auto_881412 - BLOCK
      ?auto_881413 - BLOCK
    )
    :vars
    (
      ?auto_881414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881413 ?auto_881414 ) ( ON-TABLE ?auto_881405 ) ( ON ?auto_881406 ?auto_881405 ) ( ON ?auto_881407 ?auto_881406 ) ( ON ?auto_881408 ?auto_881407 ) ( ON ?auto_881409 ?auto_881408 ) ( ON ?auto_881410 ?auto_881409 ) ( not ( = ?auto_881405 ?auto_881406 ) ) ( not ( = ?auto_881405 ?auto_881407 ) ) ( not ( = ?auto_881405 ?auto_881408 ) ) ( not ( = ?auto_881405 ?auto_881409 ) ) ( not ( = ?auto_881405 ?auto_881410 ) ) ( not ( = ?auto_881405 ?auto_881411 ) ) ( not ( = ?auto_881405 ?auto_881412 ) ) ( not ( = ?auto_881405 ?auto_881413 ) ) ( not ( = ?auto_881405 ?auto_881414 ) ) ( not ( = ?auto_881406 ?auto_881407 ) ) ( not ( = ?auto_881406 ?auto_881408 ) ) ( not ( = ?auto_881406 ?auto_881409 ) ) ( not ( = ?auto_881406 ?auto_881410 ) ) ( not ( = ?auto_881406 ?auto_881411 ) ) ( not ( = ?auto_881406 ?auto_881412 ) ) ( not ( = ?auto_881406 ?auto_881413 ) ) ( not ( = ?auto_881406 ?auto_881414 ) ) ( not ( = ?auto_881407 ?auto_881408 ) ) ( not ( = ?auto_881407 ?auto_881409 ) ) ( not ( = ?auto_881407 ?auto_881410 ) ) ( not ( = ?auto_881407 ?auto_881411 ) ) ( not ( = ?auto_881407 ?auto_881412 ) ) ( not ( = ?auto_881407 ?auto_881413 ) ) ( not ( = ?auto_881407 ?auto_881414 ) ) ( not ( = ?auto_881408 ?auto_881409 ) ) ( not ( = ?auto_881408 ?auto_881410 ) ) ( not ( = ?auto_881408 ?auto_881411 ) ) ( not ( = ?auto_881408 ?auto_881412 ) ) ( not ( = ?auto_881408 ?auto_881413 ) ) ( not ( = ?auto_881408 ?auto_881414 ) ) ( not ( = ?auto_881409 ?auto_881410 ) ) ( not ( = ?auto_881409 ?auto_881411 ) ) ( not ( = ?auto_881409 ?auto_881412 ) ) ( not ( = ?auto_881409 ?auto_881413 ) ) ( not ( = ?auto_881409 ?auto_881414 ) ) ( not ( = ?auto_881410 ?auto_881411 ) ) ( not ( = ?auto_881410 ?auto_881412 ) ) ( not ( = ?auto_881410 ?auto_881413 ) ) ( not ( = ?auto_881410 ?auto_881414 ) ) ( not ( = ?auto_881411 ?auto_881412 ) ) ( not ( = ?auto_881411 ?auto_881413 ) ) ( not ( = ?auto_881411 ?auto_881414 ) ) ( not ( = ?auto_881412 ?auto_881413 ) ) ( not ( = ?auto_881412 ?auto_881414 ) ) ( not ( = ?auto_881413 ?auto_881414 ) ) ( ON ?auto_881412 ?auto_881413 ) ( CLEAR ?auto_881410 ) ( ON ?auto_881411 ?auto_881412 ) ( CLEAR ?auto_881411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_881405 ?auto_881406 ?auto_881407 ?auto_881408 ?auto_881409 ?auto_881410 ?auto_881411 )
      ( MAKE-9PILE ?auto_881405 ?auto_881406 ?auto_881407 ?auto_881408 ?auto_881409 ?auto_881410 ?auto_881411 ?auto_881412 ?auto_881413 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_881443 - BLOCK
      ?auto_881444 - BLOCK
      ?auto_881445 - BLOCK
      ?auto_881446 - BLOCK
      ?auto_881447 - BLOCK
      ?auto_881448 - BLOCK
      ?auto_881449 - BLOCK
      ?auto_881450 - BLOCK
      ?auto_881451 - BLOCK
    )
    :vars
    (
      ?auto_881452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881451 ?auto_881452 ) ( ON-TABLE ?auto_881443 ) ( ON ?auto_881444 ?auto_881443 ) ( ON ?auto_881445 ?auto_881444 ) ( ON ?auto_881446 ?auto_881445 ) ( ON ?auto_881447 ?auto_881446 ) ( not ( = ?auto_881443 ?auto_881444 ) ) ( not ( = ?auto_881443 ?auto_881445 ) ) ( not ( = ?auto_881443 ?auto_881446 ) ) ( not ( = ?auto_881443 ?auto_881447 ) ) ( not ( = ?auto_881443 ?auto_881448 ) ) ( not ( = ?auto_881443 ?auto_881449 ) ) ( not ( = ?auto_881443 ?auto_881450 ) ) ( not ( = ?auto_881443 ?auto_881451 ) ) ( not ( = ?auto_881443 ?auto_881452 ) ) ( not ( = ?auto_881444 ?auto_881445 ) ) ( not ( = ?auto_881444 ?auto_881446 ) ) ( not ( = ?auto_881444 ?auto_881447 ) ) ( not ( = ?auto_881444 ?auto_881448 ) ) ( not ( = ?auto_881444 ?auto_881449 ) ) ( not ( = ?auto_881444 ?auto_881450 ) ) ( not ( = ?auto_881444 ?auto_881451 ) ) ( not ( = ?auto_881444 ?auto_881452 ) ) ( not ( = ?auto_881445 ?auto_881446 ) ) ( not ( = ?auto_881445 ?auto_881447 ) ) ( not ( = ?auto_881445 ?auto_881448 ) ) ( not ( = ?auto_881445 ?auto_881449 ) ) ( not ( = ?auto_881445 ?auto_881450 ) ) ( not ( = ?auto_881445 ?auto_881451 ) ) ( not ( = ?auto_881445 ?auto_881452 ) ) ( not ( = ?auto_881446 ?auto_881447 ) ) ( not ( = ?auto_881446 ?auto_881448 ) ) ( not ( = ?auto_881446 ?auto_881449 ) ) ( not ( = ?auto_881446 ?auto_881450 ) ) ( not ( = ?auto_881446 ?auto_881451 ) ) ( not ( = ?auto_881446 ?auto_881452 ) ) ( not ( = ?auto_881447 ?auto_881448 ) ) ( not ( = ?auto_881447 ?auto_881449 ) ) ( not ( = ?auto_881447 ?auto_881450 ) ) ( not ( = ?auto_881447 ?auto_881451 ) ) ( not ( = ?auto_881447 ?auto_881452 ) ) ( not ( = ?auto_881448 ?auto_881449 ) ) ( not ( = ?auto_881448 ?auto_881450 ) ) ( not ( = ?auto_881448 ?auto_881451 ) ) ( not ( = ?auto_881448 ?auto_881452 ) ) ( not ( = ?auto_881449 ?auto_881450 ) ) ( not ( = ?auto_881449 ?auto_881451 ) ) ( not ( = ?auto_881449 ?auto_881452 ) ) ( not ( = ?auto_881450 ?auto_881451 ) ) ( not ( = ?auto_881450 ?auto_881452 ) ) ( not ( = ?auto_881451 ?auto_881452 ) ) ( ON ?auto_881450 ?auto_881451 ) ( ON ?auto_881449 ?auto_881450 ) ( CLEAR ?auto_881447 ) ( ON ?auto_881448 ?auto_881449 ) ( CLEAR ?auto_881448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_881443 ?auto_881444 ?auto_881445 ?auto_881446 ?auto_881447 ?auto_881448 )
      ( MAKE-9PILE ?auto_881443 ?auto_881444 ?auto_881445 ?auto_881446 ?auto_881447 ?auto_881448 ?auto_881449 ?auto_881450 ?auto_881451 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_881481 - BLOCK
      ?auto_881482 - BLOCK
      ?auto_881483 - BLOCK
      ?auto_881484 - BLOCK
      ?auto_881485 - BLOCK
      ?auto_881486 - BLOCK
      ?auto_881487 - BLOCK
      ?auto_881488 - BLOCK
      ?auto_881489 - BLOCK
    )
    :vars
    (
      ?auto_881490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881489 ?auto_881490 ) ( ON-TABLE ?auto_881481 ) ( ON ?auto_881482 ?auto_881481 ) ( ON ?auto_881483 ?auto_881482 ) ( ON ?auto_881484 ?auto_881483 ) ( not ( = ?auto_881481 ?auto_881482 ) ) ( not ( = ?auto_881481 ?auto_881483 ) ) ( not ( = ?auto_881481 ?auto_881484 ) ) ( not ( = ?auto_881481 ?auto_881485 ) ) ( not ( = ?auto_881481 ?auto_881486 ) ) ( not ( = ?auto_881481 ?auto_881487 ) ) ( not ( = ?auto_881481 ?auto_881488 ) ) ( not ( = ?auto_881481 ?auto_881489 ) ) ( not ( = ?auto_881481 ?auto_881490 ) ) ( not ( = ?auto_881482 ?auto_881483 ) ) ( not ( = ?auto_881482 ?auto_881484 ) ) ( not ( = ?auto_881482 ?auto_881485 ) ) ( not ( = ?auto_881482 ?auto_881486 ) ) ( not ( = ?auto_881482 ?auto_881487 ) ) ( not ( = ?auto_881482 ?auto_881488 ) ) ( not ( = ?auto_881482 ?auto_881489 ) ) ( not ( = ?auto_881482 ?auto_881490 ) ) ( not ( = ?auto_881483 ?auto_881484 ) ) ( not ( = ?auto_881483 ?auto_881485 ) ) ( not ( = ?auto_881483 ?auto_881486 ) ) ( not ( = ?auto_881483 ?auto_881487 ) ) ( not ( = ?auto_881483 ?auto_881488 ) ) ( not ( = ?auto_881483 ?auto_881489 ) ) ( not ( = ?auto_881483 ?auto_881490 ) ) ( not ( = ?auto_881484 ?auto_881485 ) ) ( not ( = ?auto_881484 ?auto_881486 ) ) ( not ( = ?auto_881484 ?auto_881487 ) ) ( not ( = ?auto_881484 ?auto_881488 ) ) ( not ( = ?auto_881484 ?auto_881489 ) ) ( not ( = ?auto_881484 ?auto_881490 ) ) ( not ( = ?auto_881485 ?auto_881486 ) ) ( not ( = ?auto_881485 ?auto_881487 ) ) ( not ( = ?auto_881485 ?auto_881488 ) ) ( not ( = ?auto_881485 ?auto_881489 ) ) ( not ( = ?auto_881485 ?auto_881490 ) ) ( not ( = ?auto_881486 ?auto_881487 ) ) ( not ( = ?auto_881486 ?auto_881488 ) ) ( not ( = ?auto_881486 ?auto_881489 ) ) ( not ( = ?auto_881486 ?auto_881490 ) ) ( not ( = ?auto_881487 ?auto_881488 ) ) ( not ( = ?auto_881487 ?auto_881489 ) ) ( not ( = ?auto_881487 ?auto_881490 ) ) ( not ( = ?auto_881488 ?auto_881489 ) ) ( not ( = ?auto_881488 ?auto_881490 ) ) ( not ( = ?auto_881489 ?auto_881490 ) ) ( ON ?auto_881488 ?auto_881489 ) ( ON ?auto_881487 ?auto_881488 ) ( ON ?auto_881486 ?auto_881487 ) ( CLEAR ?auto_881484 ) ( ON ?auto_881485 ?auto_881486 ) ( CLEAR ?auto_881485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_881481 ?auto_881482 ?auto_881483 ?auto_881484 ?auto_881485 )
      ( MAKE-9PILE ?auto_881481 ?auto_881482 ?auto_881483 ?auto_881484 ?auto_881485 ?auto_881486 ?auto_881487 ?auto_881488 ?auto_881489 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_881519 - BLOCK
      ?auto_881520 - BLOCK
      ?auto_881521 - BLOCK
      ?auto_881522 - BLOCK
      ?auto_881523 - BLOCK
      ?auto_881524 - BLOCK
      ?auto_881525 - BLOCK
      ?auto_881526 - BLOCK
      ?auto_881527 - BLOCK
    )
    :vars
    (
      ?auto_881528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881527 ?auto_881528 ) ( ON-TABLE ?auto_881519 ) ( ON ?auto_881520 ?auto_881519 ) ( ON ?auto_881521 ?auto_881520 ) ( not ( = ?auto_881519 ?auto_881520 ) ) ( not ( = ?auto_881519 ?auto_881521 ) ) ( not ( = ?auto_881519 ?auto_881522 ) ) ( not ( = ?auto_881519 ?auto_881523 ) ) ( not ( = ?auto_881519 ?auto_881524 ) ) ( not ( = ?auto_881519 ?auto_881525 ) ) ( not ( = ?auto_881519 ?auto_881526 ) ) ( not ( = ?auto_881519 ?auto_881527 ) ) ( not ( = ?auto_881519 ?auto_881528 ) ) ( not ( = ?auto_881520 ?auto_881521 ) ) ( not ( = ?auto_881520 ?auto_881522 ) ) ( not ( = ?auto_881520 ?auto_881523 ) ) ( not ( = ?auto_881520 ?auto_881524 ) ) ( not ( = ?auto_881520 ?auto_881525 ) ) ( not ( = ?auto_881520 ?auto_881526 ) ) ( not ( = ?auto_881520 ?auto_881527 ) ) ( not ( = ?auto_881520 ?auto_881528 ) ) ( not ( = ?auto_881521 ?auto_881522 ) ) ( not ( = ?auto_881521 ?auto_881523 ) ) ( not ( = ?auto_881521 ?auto_881524 ) ) ( not ( = ?auto_881521 ?auto_881525 ) ) ( not ( = ?auto_881521 ?auto_881526 ) ) ( not ( = ?auto_881521 ?auto_881527 ) ) ( not ( = ?auto_881521 ?auto_881528 ) ) ( not ( = ?auto_881522 ?auto_881523 ) ) ( not ( = ?auto_881522 ?auto_881524 ) ) ( not ( = ?auto_881522 ?auto_881525 ) ) ( not ( = ?auto_881522 ?auto_881526 ) ) ( not ( = ?auto_881522 ?auto_881527 ) ) ( not ( = ?auto_881522 ?auto_881528 ) ) ( not ( = ?auto_881523 ?auto_881524 ) ) ( not ( = ?auto_881523 ?auto_881525 ) ) ( not ( = ?auto_881523 ?auto_881526 ) ) ( not ( = ?auto_881523 ?auto_881527 ) ) ( not ( = ?auto_881523 ?auto_881528 ) ) ( not ( = ?auto_881524 ?auto_881525 ) ) ( not ( = ?auto_881524 ?auto_881526 ) ) ( not ( = ?auto_881524 ?auto_881527 ) ) ( not ( = ?auto_881524 ?auto_881528 ) ) ( not ( = ?auto_881525 ?auto_881526 ) ) ( not ( = ?auto_881525 ?auto_881527 ) ) ( not ( = ?auto_881525 ?auto_881528 ) ) ( not ( = ?auto_881526 ?auto_881527 ) ) ( not ( = ?auto_881526 ?auto_881528 ) ) ( not ( = ?auto_881527 ?auto_881528 ) ) ( ON ?auto_881526 ?auto_881527 ) ( ON ?auto_881525 ?auto_881526 ) ( ON ?auto_881524 ?auto_881525 ) ( ON ?auto_881523 ?auto_881524 ) ( CLEAR ?auto_881521 ) ( ON ?auto_881522 ?auto_881523 ) ( CLEAR ?auto_881522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_881519 ?auto_881520 ?auto_881521 ?auto_881522 )
      ( MAKE-9PILE ?auto_881519 ?auto_881520 ?auto_881521 ?auto_881522 ?auto_881523 ?auto_881524 ?auto_881525 ?auto_881526 ?auto_881527 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_881557 - BLOCK
      ?auto_881558 - BLOCK
      ?auto_881559 - BLOCK
      ?auto_881560 - BLOCK
      ?auto_881561 - BLOCK
      ?auto_881562 - BLOCK
      ?auto_881563 - BLOCK
      ?auto_881564 - BLOCK
      ?auto_881565 - BLOCK
    )
    :vars
    (
      ?auto_881566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881565 ?auto_881566 ) ( ON-TABLE ?auto_881557 ) ( ON ?auto_881558 ?auto_881557 ) ( not ( = ?auto_881557 ?auto_881558 ) ) ( not ( = ?auto_881557 ?auto_881559 ) ) ( not ( = ?auto_881557 ?auto_881560 ) ) ( not ( = ?auto_881557 ?auto_881561 ) ) ( not ( = ?auto_881557 ?auto_881562 ) ) ( not ( = ?auto_881557 ?auto_881563 ) ) ( not ( = ?auto_881557 ?auto_881564 ) ) ( not ( = ?auto_881557 ?auto_881565 ) ) ( not ( = ?auto_881557 ?auto_881566 ) ) ( not ( = ?auto_881558 ?auto_881559 ) ) ( not ( = ?auto_881558 ?auto_881560 ) ) ( not ( = ?auto_881558 ?auto_881561 ) ) ( not ( = ?auto_881558 ?auto_881562 ) ) ( not ( = ?auto_881558 ?auto_881563 ) ) ( not ( = ?auto_881558 ?auto_881564 ) ) ( not ( = ?auto_881558 ?auto_881565 ) ) ( not ( = ?auto_881558 ?auto_881566 ) ) ( not ( = ?auto_881559 ?auto_881560 ) ) ( not ( = ?auto_881559 ?auto_881561 ) ) ( not ( = ?auto_881559 ?auto_881562 ) ) ( not ( = ?auto_881559 ?auto_881563 ) ) ( not ( = ?auto_881559 ?auto_881564 ) ) ( not ( = ?auto_881559 ?auto_881565 ) ) ( not ( = ?auto_881559 ?auto_881566 ) ) ( not ( = ?auto_881560 ?auto_881561 ) ) ( not ( = ?auto_881560 ?auto_881562 ) ) ( not ( = ?auto_881560 ?auto_881563 ) ) ( not ( = ?auto_881560 ?auto_881564 ) ) ( not ( = ?auto_881560 ?auto_881565 ) ) ( not ( = ?auto_881560 ?auto_881566 ) ) ( not ( = ?auto_881561 ?auto_881562 ) ) ( not ( = ?auto_881561 ?auto_881563 ) ) ( not ( = ?auto_881561 ?auto_881564 ) ) ( not ( = ?auto_881561 ?auto_881565 ) ) ( not ( = ?auto_881561 ?auto_881566 ) ) ( not ( = ?auto_881562 ?auto_881563 ) ) ( not ( = ?auto_881562 ?auto_881564 ) ) ( not ( = ?auto_881562 ?auto_881565 ) ) ( not ( = ?auto_881562 ?auto_881566 ) ) ( not ( = ?auto_881563 ?auto_881564 ) ) ( not ( = ?auto_881563 ?auto_881565 ) ) ( not ( = ?auto_881563 ?auto_881566 ) ) ( not ( = ?auto_881564 ?auto_881565 ) ) ( not ( = ?auto_881564 ?auto_881566 ) ) ( not ( = ?auto_881565 ?auto_881566 ) ) ( ON ?auto_881564 ?auto_881565 ) ( ON ?auto_881563 ?auto_881564 ) ( ON ?auto_881562 ?auto_881563 ) ( ON ?auto_881561 ?auto_881562 ) ( ON ?auto_881560 ?auto_881561 ) ( CLEAR ?auto_881558 ) ( ON ?auto_881559 ?auto_881560 ) ( CLEAR ?auto_881559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_881557 ?auto_881558 ?auto_881559 )
      ( MAKE-9PILE ?auto_881557 ?auto_881558 ?auto_881559 ?auto_881560 ?auto_881561 ?auto_881562 ?auto_881563 ?auto_881564 ?auto_881565 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_881595 - BLOCK
      ?auto_881596 - BLOCK
      ?auto_881597 - BLOCK
      ?auto_881598 - BLOCK
      ?auto_881599 - BLOCK
      ?auto_881600 - BLOCK
      ?auto_881601 - BLOCK
      ?auto_881602 - BLOCK
      ?auto_881603 - BLOCK
    )
    :vars
    (
      ?auto_881604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881603 ?auto_881604 ) ( ON-TABLE ?auto_881595 ) ( not ( = ?auto_881595 ?auto_881596 ) ) ( not ( = ?auto_881595 ?auto_881597 ) ) ( not ( = ?auto_881595 ?auto_881598 ) ) ( not ( = ?auto_881595 ?auto_881599 ) ) ( not ( = ?auto_881595 ?auto_881600 ) ) ( not ( = ?auto_881595 ?auto_881601 ) ) ( not ( = ?auto_881595 ?auto_881602 ) ) ( not ( = ?auto_881595 ?auto_881603 ) ) ( not ( = ?auto_881595 ?auto_881604 ) ) ( not ( = ?auto_881596 ?auto_881597 ) ) ( not ( = ?auto_881596 ?auto_881598 ) ) ( not ( = ?auto_881596 ?auto_881599 ) ) ( not ( = ?auto_881596 ?auto_881600 ) ) ( not ( = ?auto_881596 ?auto_881601 ) ) ( not ( = ?auto_881596 ?auto_881602 ) ) ( not ( = ?auto_881596 ?auto_881603 ) ) ( not ( = ?auto_881596 ?auto_881604 ) ) ( not ( = ?auto_881597 ?auto_881598 ) ) ( not ( = ?auto_881597 ?auto_881599 ) ) ( not ( = ?auto_881597 ?auto_881600 ) ) ( not ( = ?auto_881597 ?auto_881601 ) ) ( not ( = ?auto_881597 ?auto_881602 ) ) ( not ( = ?auto_881597 ?auto_881603 ) ) ( not ( = ?auto_881597 ?auto_881604 ) ) ( not ( = ?auto_881598 ?auto_881599 ) ) ( not ( = ?auto_881598 ?auto_881600 ) ) ( not ( = ?auto_881598 ?auto_881601 ) ) ( not ( = ?auto_881598 ?auto_881602 ) ) ( not ( = ?auto_881598 ?auto_881603 ) ) ( not ( = ?auto_881598 ?auto_881604 ) ) ( not ( = ?auto_881599 ?auto_881600 ) ) ( not ( = ?auto_881599 ?auto_881601 ) ) ( not ( = ?auto_881599 ?auto_881602 ) ) ( not ( = ?auto_881599 ?auto_881603 ) ) ( not ( = ?auto_881599 ?auto_881604 ) ) ( not ( = ?auto_881600 ?auto_881601 ) ) ( not ( = ?auto_881600 ?auto_881602 ) ) ( not ( = ?auto_881600 ?auto_881603 ) ) ( not ( = ?auto_881600 ?auto_881604 ) ) ( not ( = ?auto_881601 ?auto_881602 ) ) ( not ( = ?auto_881601 ?auto_881603 ) ) ( not ( = ?auto_881601 ?auto_881604 ) ) ( not ( = ?auto_881602 ?auto_881603 ) ) ( not ( = ?auto_881602 ?auto_881604 ) ) ( not ( = ?auto_881603 ?auto_881604 ) ) ( ON ?auto_881602 ?auto_881603 ) ( ON ?auto_881601 ?auto_881602 ) ( ON ?auto_881600 ?auto_881601 ) ( ON ?auto_881599 ?auto_881600 ) ( ON ?auto_881598 ?auto_881599 ) ( ON ?auto_881597 ?auto_881598 ) ( CLEAR ?auto_881595 ) ( ON ?auto_881596 ?auto_881597 ) ( CLEAR ?auto_881596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_881595 ?auto_881596 )
      ( MAKE-9PILE ?auto_881595 ?auto_881596 ?auto_881597 ?auto_881598 ?auto_881599 ?auto_881600 ?auto_881601 ?auto_881602 ?auto_881603 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_881633 - BLOCK
      ?auto_881634 - BLOCK
      ?auto_881635 - BLOCK
      ?auto_881636 - BLOCK
      ?auto_881637 - BLOCK
      ?auto_881638 - BLOCK
      ?auto_881639 - BLOCK
      ?auto_881640 - BLOCK
      ?auto_881641 - BLOCK
    )
    :vars
    (
      ?auto_881642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881641 ?auto_881642 ) ( not ( = ?auto_881633 ?auto_881634 ) ) ( not ( = ?auto_881633 ?auto_881635 ) ) ( not ( = ?auto_881633 ?auto_881636 ) ) ( not ( = ?auto_881633 ?auto_881637 ) ) ( not ( = ?auto_881633 ?auto_881638 ) ) ( not ( = ?auto_881633 ?auto_881639 ) ) ( not ( = ?auto_881633 ?auto_881640 ) ) ( not ( = ?auto_881633 ?auto_881641 ) ) ( not ( = ?auto_881633 ?auto_881642 ) ) ( not ( = ?auto_881634 ?auto_881635 ) ) ( not ( = ?auto_881634 ?auto_881636 ) ) ( not ( = ?auto_881634 ?auto_881637 ) ) ( not ( = ?auto_881634 ?auto_881638 ) ) ( not ( = ?auto_881634 ?auto_881639 ) ) ( not ( = ?auto_881634 ?auto_881640 ) ) ( not ( = ?auto_881634 ?auto_881641 ) ) ( not ( = ?auto_881634 ?auto_881642 ) ) ( not ( = ?auto_881635 ?auto_881636 ) ) ( not ( = ?auto_881635 ?auto_881637 ) ) ( not ( = ?auto_881635 ?auto_881638 ) ) ( not ( = ?auto_881635 ?auto_881639 ) ) ( not ( = ?auto_881635 ?auto_881640 ) ) ( not ( = ?auto_881635 ?auto_881641 ) ) ( not ( = ?auto_881635 ?auto_881642 ) ) ( not ( = ?auto_881636 ?auto_881637 ) ) ( not ( = ?auto_881636 ?auto_881638 ) ) ( not ( = ?auto_881636 ?auto_881639 ) ) ( not ( = ?auto_881636 ?auto_881640 ) ) ( not ( = ?auto_881636 ?auto_881641 ) ) ( not ( = ?auto_881636 ?auto_881642 ) ) ( not ( = ?auto_881637 ?auto_881638 ) ) ( not ( = ?auto_881637 ?auto_881639 ) ) ( not ( = ?auto_881637 ?auto_881640 ) ) ( not ( = ?auto_881637 ?auto_881641 ) ) ( not ( = ?auto_881637 ?auto_881642 ) ) ( not ( = ?auto_881638 ?auto_881639 ) ) ( not ( = ?auto_881638 ?auto_881640 ) ) ( not ( = ?auto_881638 ?auto_881641 ) ) ( not ( = ?auto_881638 ?auto_881642 ) ) ( not ( = ?auto_881639 ?auto_881640 ) ) ( not ( = ?auto_881639 ?auto_881641 ) ) ( not ( = ?auto_881639 ?auto_881642 ) ) ( not ( = ?auto_881640 ?auto_881641 ) ) ( not ( = ?auto_881640 ?auto_881642 ) ) ( not ( = ?auto_881641 ?auto_881642 ) ) ( ON ?auto_881640 ?auto_881641 ) ( ON ?auto_881639 ?auto_881640 ) ( ON ?auto_881638 ?auto_881639 ) ( ON ?auto_881637 ?auto_881638 ) ( ON ?auto_881636 ?auto_881637 ) ( ON ?auto_881635 ?auto_881636 ) ( ON ?auto_881634 ?auto_881635 ) ( ON ?auto_881633 ?auto_881634 ) ( CLEAR ?auto_881633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_881633 )
      ( MAKE-9PILE ?auto_881633 ?auto_881634 ?auto_881635 ?auto_881636 ?auto_881637 ?auto_881638 ?auto_881639 ?auto_881640 ?auto_881641 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_881672 - BLOCK
      ?auto_881673 - BLOCK
      ?auto_881674 - BLOCK
      ?auto_881675 - BLOCK
      ?auto_881676 - BLOCK
      ?auto_881677 - BLOCK
      ?auto_881678 - BLOCK
      ?auto_881679 - BLOCK
      ?auto_881680 - BLOCK
      ?auto_881681 - BLOCK
    )
    :vars
    (
      ?auto_881682 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_881680 ) ( ON ?auto_881681 ?auto_881682 ) ( CLEAR ?auto_881681 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_881672 ) ( ON ?auto_881673 ?auto_881672 ) ( ON ?auto_881674 ?auto_881673 ) ( ON ?auto_881675 ?auto_881674 ) ( ON ?auto_881676 ?auto_881675 ) ( ON ?auto_881677 ?auto_881676 ) ( ON ?auto_881678 ?auto_881677 ) ( ON ?auto_881679 ?auto_881678 ) ( ON ?auto_881680 ?auto_881679 ) ( not ( = ?auto_881672 ?auto_881673 ) ) ( not ( = ?auto_881672 ?auto_881674 ) ) ( not ( = ?auto_881672 ?auto_881675 ) ) ( not ( = ?auto_881672 ?auto_881676 ) ) ( not ( = ?auto_881672 ?auto_881677 ) ) ( not ( = ?auto_881672 ?auto_881678 ) ) ( not ( = ?auto_881672 ?auto_881679 ) ) ( not ( = ?auto_881672 ?auto_881680 ) ) ( not ( = ?auto_881672 ?auto_881681 ) ) ( not ( = ?auto_881672 ?auto_881682 ) ) ( not ( = ?auto_881673 ?auto_881674 ) ) ( not ( = ?auto_881673 ?auto_881675 ) ) ( not ( = ?auto_881673 ?auto_881676 ) ) ( not ( = ?auto_881673 ?auto_881677 ) ) ( not ( = ?auto_881673 ?auto_881678 ) ) ( not ( = ?auto_881673 ?auto_881679 ) ) ( not ( = ?auto_881673 ?auto_881680 ) ) ( not ( = ?auto_881673 ?auto_881681 ) ) ( not ( = ?auto_881673 ?auto_881682 ) ) ( not ( = ?auto_881674 ?auto_881675 ) ) ( not ( = ?auto_881674 ?auto_881676 ) ) ( not ( = ?auto_881674 ?auto_881677 ) ) ( not ( = ?auto_881674 ?auto_881678 ) ) ( not ( = ?auto_881674 ?auto_881679 ) ) ( not ( = ?auto_881674 ?auto_881680 ) ) ( not ( = ?auto_881674 ?auto_881681 ) ) ( not ( = ?auto_881674 ?auto_881682 ) ) ( not ( = ?auto_881675 ?auto_881676 ) ) ( not ( = ?auto_881675 ?auto_881677 ) ) ( not ( = ?auto_881675 ?auto_881678 ) ) ( not ( = ?auto_881675 ?auto_881679 ) ) ( not ( = ?auto_881675 ?auto_881680 ) ) ( not ( = ?auto_881675 ?auto_881681 ) ) ( not ( = ?auto_881675 ?auto_881682 ) ) ( not ( = ?auto_881676 ?auto_881677 ) ) ( not ( = ?auto_881676 ?auto_881678 ) ) ( not ( = ?auto_881676 ?auto_881679 ) ) ( not ( = ?auto_881676 ?auto_881680 ) ) ( not ( = ?auto_881676 ?auto_881681 ) ) ( not ( = ?auto_881676 ?auto_881682 ) ) ( not ( = ?auto_881677 ?auto_881678 ) ) ( not ( = ?auto_881677 ?auto_881679 ) ) ( not ( = ?auto_881677 ?auto_881680 ) ) ( not ( = ?auto_881677 ?auto_881681 ) ) ( not ( = ?auto_881677 ?auto_881682 ) ) ( not ( = ?auto_881678 ?auto_881679 ) ) ( not ( = ?auto_881678 ?auto_881680 ) ) ( not ( = ?auto_881678 ?auto_881681 ) ) ( not ( = ?auto_881678 ?auto_881682 ) ) ( not ( = ?auto_881679 ?auto_881680 ) ) ( not ( = ?auto_881679 ?auto_881681 ) ) ( not ( = ?auto_881679 ?auto_881682 ) ) ( not ( = ?auto_881680 ?auto_881681 ) ) ( not ( = ?auto_881680 ?auto_881682 ) ) ( not ( = ?auto_881681 ?auto_881682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_881681 ?auto_881682 )
      ( !STACK ?auto_881681 ?auto_881680 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_881714 - BLOCK
      ?auto_881715 - BLOCK
      ?auto_881716 - BLOCK
      ?auto_881717 - BLOCK
      ?auto_881718 - BLOCK
      ?auto_881719 - BLOCK
      ?auto_881720 - BLOCK
      ?auto_881721 - BLOCK
      ?auto_881722 - BLOCK
      ?auto_881723 - BLOCK
    )
    :vars
    (
      ?auto_881724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881723 ?auto_881724 ) ( ON-TABLE ?auto_881714 ) ( ON ?auto_881715 ?auto_881714 ) ( ON ?auto_881716 ?auto_881715 ) ( ON ?auto_881717 ?auto_881716 ) ( ON ?auto_881718 ?auto_881717 ) ( ON ?auto_881719 ?auto_881718 ) ( ON ?auto_881720 ?auto_881719 ) ( ON ?auto_881721 ?auto_881720 ) ( not ( = ?auto_881714 ?auto_881715 ) ) ( not ( = ?auto_881714 ?auto_881716 ) ) ( not ( = ?auto_881714 ?auto_881717 ) ) ( not ( = ?auto_881714 ?auto_881718 ) ) ( not ( = ?auto_881714 ?auto_881719 ) ) ( not ( = ?auto_881714 ?auto_881720 ) ) ( not ( = ?auto_881714 ?auto_881721 ) ) ( not ( = ?auto_881714 ?auto_881722 ) ) ( not ( = ?auto_881714 ?auto_881723 ) ) ( not ( = ?auto_881714 ?auto_881724 ) ) ( not ( = ?auto_881715 ?auto_881716 ) ) ( not ( = ?auto_881715 ?auto_881717 ) ) ( not ( = ?auto_881715 ?auto_881718 ) ) ( not ( = ?auto_881715 ?auto_881719 ) ) ( not ( = ?auto_881715 ?auto_881720 ) ) ( not ( = ?auto_881715 ?auto_881721 ) ) ( not ( = ?auto_881715 ?auto_881722 ) ) ( not ( = ?auto_881715 ?auto_881723 ) ) ( not ( = ?auto_881715 ?auto_881724 ) ) ( not ( = ?auto_881716 ?auto_881717 ) ) ( not ( = ?auto_881716 ?auto_881718 ) ) ( not ( = ?auto_881716 ?auto_881719 ) ) ( not ( = ?auto_881716 ?auto_881720 ) ) ( not ( = ?auto_881716 ?auto_881721 ) ) ( not ( = ?auto_881716 ?auto_881722 ) ) ( not ( = ?auto_881716 ?auto_881723 ) ) ( not ( = ?auto_881716 ?auto_881724 ) ) ( not ( = ?auto_881717 ?auto_881718 ) ) ( not ( = ?auto_881717 ?auto_881719 ) ) ( not ( = ?auto_881717 ?auto_881720 ) ) ( not ( = ?auto_881717 ?auto_881721 ) ) ( not ( = ?auto_881717 ?auto_881722 ) ) ( not ( = ?auto_881717 ?auto_881723 ) ) ( not ( = ?auto_881717 ?auto_881724 ) ) ( not ( = ?auto_881718 ?auto_881719 ) ) ( not ( = ?auto_881718 ?auto_881720 ) ) ( not ( = ?auto_881718 ?auto_881721 ) ) ( not ( = ?auto_881718 ?auto_881722 ) ) ( not ( = ?auto_881718 ?auto_881723 ) ) ( not ( = ?auto_881718 ?auto_881724 ) ) ( not ( = ?auto_881719 ?auto_881720 ) ) ( not ( = ?auto_881719 ?auto_881721 ) ) ( not ( = ?auto_881719 ?auto_881722 ) ) ( not ( = ?auto_881719 ?auto_881723 ) ) ( not ( = ?auto_881719 ?auto_881724 ) ) ( not ( = ?auto_881720 ?auto_881721 ) ) ( not ( = ?auto_881720 ?auto_881722 ) ) ( not ( = ?auto_881720 ?auto_881723 ) ) ( not ( = ?auto_881720 ?auto_881724 ) ) ( not ( = ?auto_881721 ?auto_881722 ) ) ( not ( = ?auto_881721 ?auto_881723 ) ) ( not ( = ?auto_881721 ?auto_881724 ) ) ( not ( = ?auto_881722 ?auto_881723 ) ) ( not ( = ?auto_881722 ?auto_881724 ) ) ( not ( = ?auto_881723 ?auto_881724 ) ) ( CLEAR ?auto_881721 ) ( ON ?auto_881722 ?auto_881723 ) ( CLEAR ?auto_881722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_881714 ?auto_881715 ?auto_881716 ?auto_881717 ?auto_881718 ?auto_881719 ?auto_881720 ?auto_881721 ?auto_881722 )
      ( MAKE-10PILE ?auto_881714 ?auto_881715 ?auto_881716 ?auto_881717 ?auto_881718 ?auto_881719 ?auto_881720 ?auto_881721 ?auto_881722 ?auto_881723 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_881756 - BLOCK
      ?auto_881757 - BLOCK
      ?auto_881758 - BLOCK
      ?auto_881759 - BLOCK
      ?auto_881760 - BLOCK
      ?auto_881761 - BLOCK
      ?auto_881762 - BLOCK
      ?auto_881763 - BLOCK
      ?auto_881764 - BLOCK
      ?auto_881765 - BLOCK
    )
    :vars
    (
      ?auto_881766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881765 ?auto_881766 ) ( ON-TABLE ?auto_881756 ) ( ON ?auto_881757 ?auto_881756 ) ( ON ?auto_881758 ?auto_881757 ) ( ON ?auto_881759 ?auto_881758 ) ( ON ?auto_881760 ?auto_881759 ) ( ON ?auto_881761 ?auto_881760 ) ( ON ?auto_881762 ?auto_881761 ) ( not ( = ?auto_881756 ?auto_881757 ) ) ( not ( = ?auto_881756 ?auto_881758 ) ) ( not ( = ?auto_881756 ?auto_881759 ) ) ( not ( = ?auto_881756 ?auto_881760 ) ) ( not ( = ?auto_881756 ?auto_881761 ) ) ( not ( = ?auto_881756 ?auto_881762 ) ) ( not ( = ?auto_881756 ?auto_881763 ) ) ( not ( = ?auto_881756 ?auto_881764 ) ) ( not ( = ?auto_881756 ?auto_881765 ) ) ( not ( = ?auto_881756 ?auto_881766 ) ) ( not ( = ?auto_881757 ?auto_881758 ) ) ( not ( = ?auto_881757 ?auto_881759 ) ) ( not ( = ?auto_881757 ?auto_881760 ) ) ( not ( = ?auto_881757 ?auto_881761 ) ) ( not ( = ?auto_881757 ?auto_881762 ) ) ( not ( = ?auto_881757 ?auto_881763 ) ) ( not ( = ?auto_881757 ?auto_881764 ) ) ( not ( = ?auto_881757 ?auto_881765 ) ) ( not ( = ?auto_881757 ?auto_881766 ) ) ( not ( = ?auto_881758 ?auto_881759 ) ) ( not ( = ?auto_881758 ?auto_881760 ) ) ( not ( = ?auto_881758 ?auto_881761 ) ) ( not ( = ?auto_881758 ?auto_881762 ) ) ( not ( = ?auto_881758 ?auto_881763 ) ) ( not ( = ?auto_881758 ?auto_881764 ) ) ( not ( = ?auto_881758 ?auto_881765 ) ) ( not ( = ?auto_881758 ?auto_881766 ) ) ( not ( = ?auto_881759 ?auto_881760 ) ) ( not ( = ?auto_881759 ?auto_881761 ) ) ( not ( = ?auto_881759 ?auto_881762 ) ) ( not ( = ?auto_881759 ?auto_881763 ) ) ( not ( = ?auto_881759 ?auto_881764 ) ) ( not ( = ?auto_881759 ?auto_881765 ) ) ( not ( = ?auto_881759 ?auto_881766 ) ) ( not ( = ?auto_881760 ?auto_881761 ) ) ( not ( = ?auto_881760 ?auto_881762 ) ) ( not ( = ?auto_881760 ?auto_881763 ) ) ( not ( = ?auto_881760 ?auto_881764 ) ) ( not ( = ?auto_881760 ?auto_881765 ) ) ( not ( = ?auto_881760 ?auto_881766 ) ) ( not ( = ?auto_881761 ?auto_881762 ) ) ( not ( = ?auto_881761 ?auto_881763 ) ) ( not ( = ?auto_881761 ?auto_881764 ) ) ( not ( = ?auto_881761 ?auto_881765 ) ) ( not ( = ?auto_881761 ?auto_881766 ) ) ( not ( = ?auto_881762 ?auto_881763 ) ) ( not ( = ?auto_881762 ?auto_881764 ) ) ( not ( = ?auto_881762 ?auto_881765 ) ) ( not ( = ?auto_881762 ?auto_881766 ) ) ( not ( = ?auto_881763 ?auto_881764 ) ) ( not ( = ?auto_881763 ?auto_881765 ) ) ( not ( = ?auto_881763 ?auto_881766 ) ) ( not ( = ?auto_881764 ?auto_881765 ) ) ( not ( = ?auto_881764 ?auto_881766 ) ) ( not ( = ?auto_881765 ?auto_881766 ) ) ( ON ?auto_881764 ?auto_881765 ) ( CLEAR ?auto_881762 ) ( ON ?auto_881763 ?auto_881764 ) ( CLEAR ?auto_881763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_881756 ?auto_881757 ?auto_881758 ?auto_881759 ?auto_881760 ?auto_881761 ?auto_881762 ?auto_881763 )
      ( MAKE-10PILE ?auto_881756 ?auto_881757 ?auto_881758 ?auto_881759 ?auto_881760 ?auto_881761 ?auto_881762 ?auto_881763 ?auto_881764 ?auto_881765 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_881798 - BLOCK
      ?auto_881799 - BLOCK
      ?auto_881800 - BLOCK
      ?auto_881801 - BLOCK
      ?auto_881802 - BLOCK
      ?auto_881803 - BLOCK
      ?auto_881804 - BLOCK
      ?auto_881805 - BLOCK
      ?auto_881806 - BLOCK
      ?auto_881807 - BLOCK
    )
    :vars
    (
      ?auto_881808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881807 ?auto_881808 ) ( ON-TABLE ?auto_881798 ) ( ON ?auto_881799 ?auto_881798 ) ( ON ?auto_881800 ?auto_881799 ) ( ON ?auto_881801 ?auto_881800 ) ( ON ?auto_881802 ?auto_881801 ) ( ON ?auto_881803 ?auto_881802 ) ( not ( = ?auto_881798 ?auto_881799 ) ) ( not ( = ?auto_881798 ?auto_881800 ) ) ( not ( = ?auto_881798 ?auto_881801 ) ) ( not ( = ?auto_881798 ?auto_881802 ) ) ( not ( = ?auto_881798 ?auto_881803 ) ) ( not ( = ?auto_881798 ?auto_881804 ) ) ( not ( = ?auto_881798 ?auto_881805 ) ) ( not ( = ?auto_881798 ?auto_881806 ) ) ( not ( = ?auto_881798 ?auto_881807 ) ) ( not ( = ?auto_881798 ?auto_881808 ) ) ( not ( = ?auto_881799 ?auto_881800 ) ) ( not ( = ?auto_881799 ?auto_881801 ) ) ( not ( = ?auto_881799 ?auto_881802 ) ) ( not ( = ?auto_881799 ?auto_881803 ) ) ( not ( = ?auto_881799 ?auto_881804 ) ) ( not ( = ?auto_881799 ?auto_881805 ) ) ( not ( = ?auto_881799 ?auto_881806 ) ) ( not ( = ?auto_881799 ?auto_881807 ) ) ( not ( = ?auto_881799 ?auto_881808 ) ) ( not ( = ?auto_881800 ?auto_881801 ) ) ( not ( = ?auto_881800 ?auto_881802 ) ) ( not ( = ?auto_881800 ?auto_881803 ) ) ( not ( = ?auto_881800 ?auto_881804 ) ) ( not ( = ?auto_881800 ?auto_881805 ) ) ( not ( = ?auto_881800 ?auto_881806 ) ) ( not ( = ?auto_881800 ?auto_881807 ) ) ( not ( = ?auto_881800 ?auto_881808 ) ) ( not ( = ?auto_881801 ?auto_881802 ) ) ( not ( = ?auto_881801 ?auto_881803 ) ) ( not ( = ?auto_881801 ?auto_881804 ) ) ( not ( = ?auto_881801 ?auto_881805 ) ) ( not ( = ?auto_881801 ?auto_881806 ) ) ( not ( = ?auto_881801 ?auto_881807 ) ) ( not ( = ?auto_881801 ?auto_881808 ) ) ( not ( = ?auto_881802 ?auto_881803 ) ) ( not ( = ?auto_881802 ?auto_881804 ) ) ( not ( = ?auto_881802 ?auto_881805 ) ) ( not ( = ?auto_881802 ?auto_881806 ) ) ( not ( = ?auto_881802 ?auto_881807 ) ) ( not ( = ?auto_881802 ?auto_881808 ) ) ( not ( = ?auto_881803 ?auto_881804 ) ) ( not ( = ?auto_881803 ?auto_881805 ) ) ( not ( = ?auto_881803 ?auto_881806 ) ) ( not ( = ?auto_881803 ?auto_881807 ) ) ( not ( = ?auto_881803 ?auto_881808 ) ) ( not ( = ?auto_881804 ?auto_881805 ) ) ( not ( = ?auto_881804 ?auto_881806 ) ) ( not ( = ?auto_881804 ?auto_881807 ) ) ( not ( = ?auto_881804 ?auto_881808 ) ) ( not ( = ?auto_881805 ?auto_881806 ) ) ( not ( = ?auto_881805 ?auto_881807 ) ) ( not ( = ?auto_881805 ?auto_881808 ) ) ( not ( = ?auto_881806 ?auto_881807 ) ) ( not ( = ?auto_881806 ?auto_881808 ) ) ( not ( = ?auto_881807 ?auto_881808 ) ) ( ON ?auto_881806 ?auto_881807 ) ( ON ?auto_881805 ?auto_881806 ) ( CLEAR ?auto_881803 ) ( ON ?auto_881804 ?auto_881805 ) ( CLEAR ?auto_881804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_881798 ?auto_881799 ?auto_881800 ?auto_881801 ?auto_881802 ?auto_881803 ?auto_881804 )
      ( MAKE-10PILE ?auto_881798 ?auto_881799 ?auto_881800 ?auto_881801 ?auto_881802 ?auto_881803 ?auto_881804 ?auto_881805 ?auto_881806 ?auto_881807 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_881840 - BLOCK
      ?auto_881841 - BLOCK
      ?auto_881842 - BLOCK
      ?auto_881843 - BLOCK
      ?auto_881844 - BLOCK
      ?auto_881845 - BLOCK
      ?auto_881846 - BLOCK
      ?auto_881847 - BLOCK
      ?auto_881848 - BLOCK
      ?auto_881849 - BLOCK
    )
    :vars
    (
      ?auto_881850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881849 ?auto_881850 ) ( ON-TABLE ?auto_881840 ) ( ON ?auto_881841 ?auto_881840 ) ( ON ?auto_881842 ?auto_881841 ) ( ON ?auto_881843 ?auto_881842 ) ( ON ?auto_881844 ?auto_881843 ) ( not ( = ?auto_881840 ?auto_881841 ) ) ( not ( = ?auto_881840 ?auto_881842 ) ) ( not ( = ?auto_881840 ?auto_881843 ) ) ( not ( = ?auto_881840 ?auto_881844 ) ) ( not ( = ?auto_881840 ?auto_881845 ) ) ( not ( = ?auto_881840 ?auto_881846 ) ) ( not ( = ?auto_881840 ?auto_881847 ) ) ( not ( = ?auto_881840 ?auto_881848 ) ) ( not ( = ?auto_881840 ?auto_881849 ) ) ( not ( = ?auto_881840 ?auto_881850 ) ) ( not ( = ?auto_881841 ?auto_881842 ) ) ( not ( = ?auto_881841 ?auto_881843 ) ) ( not ( = ?auto_881841 ?auto_881844 ) ) ( not ( = ?auto_881841 ?auto_881845 ) ) ( not ( = ?auto_881841 ?auto_881846 ) ) ( not ( = ?auto_881841 ?auto_881847 ) ) ( not ( = ?auto_881841 ?auto_881848 ) ) ( not ( = ?auto_881841 ?auto_881849 ) ) ( not ( = ?auto_881841 ?auto_881850 ) ) ( not ( = ?auto_881842 ?auto_881843 ) ) ( not ( = ?auto_881842 ?auto_881844 ) ) ( not ( = ?auto_881842 ?auto_881845 ) ) ( not ( = ?auto_881842 ?auto_881846 ) ) ( not ( = ?auto_881842 ?auto_881847 ) ) ( not ( = ?auto_881842 ?auto_881848 ) ) ( not ( = ?auto_881842 ?auto_881849 ) ) ( not ( = ?auto_881842 ?auto_881850 ) ) ( not ( = ?auto_881843 ?auto_881844 ) ) ( not ( = ?auto_881843 ?auto_881845 ) ) ( not ( = ?auto_881843 ?auto_881846 ) ) ( not ( = ?auto_881843 ?auto_881847 ) ) ( not ( = ?auto_881843 ?auto_881848 ) ) ( not ( = ?auto_881843 ?auto_881849 ) ) ( not ( = ?auto_881843 ?auto_881850 ) ) ( not ( = ?auto_881844 ?auto_881845 ) ) ( not ( = ?auto_881844 ?auto_881846 ) ) ( not ( = ?auto_881844 ?auto_881847 ) ) ( not ( = ?auto_881844 ?auto_881848 ) ) ( not ( = ?auto_881844 ?auto_881849 ) ) ( not ( = ?auto_881844 ?auto_881850 ) ) ( not ( = ?auto_881845 ?auto_881846 ) ) ( not ( = ?auto_881845 ?auto_881847 ) ) ( not ( = ?auto_881845 ?auto_881848 ) ) ( not ( = ?auto_881845 ?auto_881849 ) ) ( not ( = ?auto_881845 ?auto_881850 ) ) ( not ( = ?auto_881846 ?auto_881847 ) ) ( not ( = ?auto_881846 ?auto_881848 ) ) ( not ( = ?auto_881846 ?auto_881849 ) ) ( not ( = ?auto_881846 ?auto_881850 ) ) ( not ( = ?auto_881847 ?auto_881848 ) ) ( not ( = ?auto_881847 ?auto_881849 ) ) ( not ( = ?auto_881847 ?auto_881850 ) ) ( not ( = ?auto_881848 ?auto_881849 ) ) ( not ( = ?auto_881848 ?auto_881850 ) ) ( not ( = ?auto_881849 ?auto_881850 ) ) ( ON ?auto_881848 ?auto_881849 ) ( ON ?auto_881847 ?auto_881848 ) ( ON ?auto_881846 ?auto_881847 ) ( CLEAR ?auto_881844 ) ( ON ?auto_881845 ?auto_881846 ) ( CLEAR ?auto_881845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_881840 ?auto_881841 ?auto_881842 ?auto_881843 ?auto_881844 ?auto_881845 )
      ( MAKE-10PILE ?auto_881840 ?auto_881841 ?auto_881842 ?auto_881843 ?auto_881844 ?auto_881845 ?auto_881846 ?auto_881847 ?auto_881848 ?auto_881849 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_881882 - BLOCK
      ?auto_881883 - BLOCK
      ?auto_881884 - BLOCK
      ?auto_881885 - BLOCK
      ?auto_881886 - BLOCK
      ?auto_881887 - BLOCK
      ?auto_881888 - BLOCK
      ?auto_881889 - BLOCK
      ?auto_881890 - BLOCK
      ?auto_881891 - BLOCK
    )
    :vars
    (
      ?auto_881892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881891 ?auto_881892 ) ( ON-TABLE ?auto_881882 ) ( ON ?auto_881883 ?auto_881882 ) ( ON ?auto_881884 ?auto_881883 ) ( ON ?auto_881885 ?auto_881884 ) ( not ( = ?auto_881882 ?auto_881883 ) ) ( not ( = ?auto_881882 ?auto_881884 ) ) ( not ( = ?auto_881882 ?auto_881885 ) ) ( not ( = ?auto_881882 ?auto_881886 ) ) ( not ( = ?auto_881882 ?auto_881887 ) ) ( not ( = ?auto_881882 ?auto_881888 ) ) ( not ( = ?auto_881882 ?auto_881889 ) ) ( not ( = ?auto_881882 ?auto_881890 ) ) ( not ( = ?auto_881882 ?auto_881891 ) ) ( not ( = ?auto_881882 ?auto_881892 ) ) ( not ( = ?auto_881883 ?auto_881884 ) ) ( not ( = ?auto_881883 ?auto_881885 ) ) ( not ( = ?auto_881883 ?auto_881886 ) ) ( not ( = ?auto_881883 ?auto_881887 ) ) ( not ( = ?auto_881883 ?auto_881888 ) ) ( not ( = ?auto_881883 ?auto_881889 ) ) ( not ( = ?auto_881883 ?auto_881890 ) ) ( not ( = ?auto_881883 ?auto_881891 ) ) ( not ( = ?auto_881883 ?auto_881892 ) ) ( not ( = ?auto_881884 ?auto_881885 ) ) ( not ( = ?auto_881884 ?auto_881886 ) ) ( not ( = ?auto_881884 ?auto_881887 ) ) ( not ( = ?auto_881884 ?auto_881888 ) ) ( not ( = ?auto_881884 ?auto_881889 ) ) ( not ( = ?auto_881884 ?auto_881890 ) ) ( not ( = ?auto_881884 ?auto_881891 ) ) ( not ( = ?auto_881884 ?auto_881892 ) ) ( not ( = ?auto_881885 ?auto_881886 ) ) ( not ( = ?auto_881885 ?auto_881887 ) ) ( not ( = ?auto_881885 ?auto_881888 ) ) ( not ( = ?auto_881885 ?auto_881889 ) ) ( not ( = ?auto_881885 ?auto_881890 ) ) ( not ( = ?auto_881885 ?auto_881891 ) ) ( not ( = ?auto_881885 ?auto_881892 ) ) ( not ( = ?auto_881886 ?auto_881887 ) ) ( not ( = ?auto_881886 ?auto_881888 ) ) ( not ( = ?auto_881886 ?auto_881889 ) ) ( not ( = ?auto_881886 ?auto_881890 ) ) ( not ( = ?auto_881886 ?auto_881891 ) ) ( not ( = ?auto_881886 ?auto_881892 ) ) ( not ( = ?auto_881887 ?auto_881888 ) ) ( not ( = ?auto_881887 ?auto_881889 ) ) ( not ( = ?auto_881887 ?auto_881890 ) ) ( not ( = ?auto_881887 ?auto_881891 ) ) ( not ( = ?auto_881887 ?auto_881892 ) ) ( not ( = ?auto_881888 ?auto_881889 ) ) ( not ( = ?auto_881888 ?auto_881890 ) ) ( not ( = ?auto_881888 ?auto_881891 ) ) ( not ( = ?auto_881888 ?auto_881892 ) ) ( not ( = ?auto_881889 ?auto_881890 ) ) ( not ( = ?auto_881889 ?auto_881891 ) ) ( not ( = ?auto_881889 ?auto_881892 ) ) ( not ( = ?auto_881890 ?auto_881891 ) ) ( not ( = ?auto_881890 ?auto_881892 ) ) ( not ( = ?auto_881891 ?auto_881892 ) ) ( ON ?auto_881890 ?auto_881891 ) ( ON ?auto_881889 ?auto_881890 ) ( ON ?auto_881888 ?auto_881889 ) ( ON ?auto_881887 ?auto_881888 ) ( CLEAR ?auto_881885 ) ( ON ?auto_881886 ?auto_881887 ) ( CLEAR ?auto_881886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_881882 ?auto_881883 ?auto_881884 ?auto_881885 ?auto_881886 )
      ( MAKE-10PILE ?auto_881882 ?auto_881883 ?auto_881884 ?auto_881885 ?auto_881886 ?auto_881887 ?auto_881888 ?auto_881889 ?auto_881890 ?auto_881891 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_881924 - BLOCK
      ?auto_881925 - BLOCK
      ?auto_881926 - BLOCK
      ?auto_881927 - BLOCK
      ?auto_881928 - BLOCK
      ?auto_881929 - BLOCK
      ?auto_881930 - BLOCK
      ?auto_881931 - BLOCK
      ?auto_881932 - BLOCK
      ?auto_881933 - BLOCK
    )
    :vars
    (
      ?auto_881934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881933 ?auto_881934 ) ( ON-TABLE ?auto_881924 ) ( ON ?auto_881925 ?auto_881924 ) ( ON ?auto_881926 ?auto_881925 ) ( not ( = ?auto_881924 ?auto_881925 ) ) ( not ( = ?auto_881924 ?auto_881926 ) ) ( not ( = ?auto_881924 ?auto_881927 ) ) ( not ( = ?auto_881924 ?auto_881928 ) ) ( not ( = ?auto_881924 ?auto_881929 ) ) ( not ( = ?auto_881924 ?auto_881930 ) ) ( not ( = ?auto_881924 ?auto_881931 ) ) ( not ( = ?auto_881924 ?auto_881932 ) ) ( not ( = ?auto_881924 ?auto_881933 ) ) ( not ( = ?auto_881924 ?auto_881934 ) ) ( not ( = ?auto_881925 ?auto_881926 ) ) ( not ( = ?auto_881925 ?auto_881927 ) ) ( not ( = ?auto_881925 ?auto_881928 ) ) ( not ( = ?auto_881925 ?auto_881929 ) ) ( not ( = ?auto_881925 ?auto_881930 ) ) ( not ( = ?auto_881925 ?auto_881931 ) ) ( not ( = ?auto_881925 ?auto_881932 ) ) ( not ( = ?auto_881925 ?auto_881933 ) ) ( not ( = ?auto_881925 ?auto_881934 ) ) ( not ( = ?auto_881926 ?auto_881927 ) ) ( not ( = ?auto_881926 ?auto_881928 ) ) ( not ( = ?auto_881926 ?auto_881929 ) ) ( not ( = ?auto_881926 ?auto_881930 ) ) ( not ( = ?auto_881926 ?auto_881931 ) ) ( not ( = ?auto_881926 ?auto_881932 ) ) ( not ( = ?auto_881926 ?auto_881933 ) ) ( not ( = ?auto_881926 ?auto_881934 ) ) ( not ( = ?auto_881927 ?auto_881928 ) ) ( not ( = ?auto_881927 ?auto_881929 ) ) ( not ( = ?auto_881927 ?auto_881930 ) ) ( not ( = ?auto_881927 ?auto_881931 ) ) ( not ( = ?auto_881927 ?auto_881932 ) ) ( not ( = ?auto_881927 ?auto_881933 ) ) ( not ( = ?auto_881927 ?auto_881934 ) ) ( not ( = ?auto_881928 ?auto_881929 ) ) ( not ( = ?auto_881928 ?auto_881930 ) ) ( not ( = ?auto_881928 ?auto_881931 ) ) ( not ( = ?auto_881928 ?auto_881932 ) ) ( not ( = ?auto_881928 ?auto_881933 ) ) ( not ( = ?auto_881928 ?auto_881934 ) ) ( not ( = ?auto_881929 ?auto_881930 ) ) ( not ( = ?auto_881929 ?auto_881931 ) ) ( not ( = ?auto_881929 ?auto_881932 ) ) ( not ( = ?auto_881929 ?auto_881933 ) ) ( not ( = ?auto_881929 ?auto_881934 ) ) ( not ( = ?auto_881930 ?auto_881931 ) ) ( not ( = ?auto_881930 ?auto_881932 ) ) ( not ( = ?auto_881930 ?auto_881933 ) ) ( not ( = ?auto_881930 ?auto_881934 ) ) ( not ( = ?auto_881931 ?auto_881932 ) ) ( not ( = ?auto_881931 ?auto_881933 ) ) ( not ( = ?auto_881931 ?auto_881934 ) ) ( not ( = ?auto_881932 ?auto_881933 ) ) ( not ( = ?auto_881932 ?auto_881934 ) ) ( not ( = ?auto_881933 ?auto_881934 ) ) ( ON ?auto_881932 ?auto_881933 ) ( ON ?auto_881931 ?auto_881932 ) ( ON ?auto_881930 ?auto_881931 ) ( ON ?auto_881929 ?auto_881930 ) ( ON ?auto_881928 ?auto_881929 ) ( CLEAR ?auto_881926 ) ( ON ?auto_881927 ?auto_881928 ) ( CLEAR ?auto_881927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_881924 ?auto_881925 ?auto_881926 ?auto_881927 )
      ( MAKE-10PILE ?auto_881924 ?auto_881925 ?auto_881926 ?auto_881927 ?auto_881928 ?auto_881929 ?auto_881930 ?auto_881931 ?auto_881932 ?auto_881933 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_881966 - BLOCK
      ?auto_881967 - BLOCK
      ?auto_881968 - BLOCK
      ?auto_881969 - BLOCK
      ?auto_881970 - BLOCK
      ?auto_881971 - BLOCK
      ?auto_881972 - BLOCK
      ?auto_881973 - BLOCK
      ?auto_881974 - BLOCK
      ?auto_881975 - BLOCK
    )
    :vars
    (
      ?auto_881976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_881975 ?auto_881976 ) ( ON-TABLE ?auto_881966 ) ( ON ?auto_881967 ?auto_881966 ) ( not ( = ?auto_881966 ?auto_881967 ) ) ( not ( = ?auto_881966 ?auto_881968 ) ) ( not ( = ?auto_881966 ?auto_881969 ) ) ( not ( = ?auto_881966 ?auto_881970 ) ) ( not ( = ?auto_881966 ?auto_881971 ) ) ( not ( = ?auto_881966 ?auto_881972 ) ) ( not ( = ?auto_881966 ?auto_881973 ) ) ( not ( = ?auto_881966 ?auto_881974 ) ) ( not ( = ?auto_881966 ?auto_881975 ) ) ( not ( = ?auto_881966 ?auto_881976 ) ) ( not ( = ?auto_881967 ?auto_881968 ) ) ( not ( = ?auto_881967 ?auto_881969 ) ) ( not ( = ?auto_881967 ?auto_881970 ) ) ( not ( = ?auto_881967 ?auto_881971 ) ) ( not ( = ?auto_881967 ?auto_881972 ) ) ( not ( = ?auto_881967 ?auto_881973 ) ) ( not ( = ?auto_881967 ?auto_881974 ) ) ( not ( = ?auto_881967 ?auto_881975 ) ) ( not ( = ?auto_881967 ?auto_881976 ) ) ( not ( = ?auto_881968 ?auto_881969 ) ) ( not ( = ?auto_881968 ?auto_881970 ) ) ( not ( = ?auto_881968 ?auto_881971 ) ) ( not ( = ?auto_881968 ?auto_881972 ) ) ( not ( = ?auto_881968 ?auto_881973 ) ) ( not ( = ?auto_881968 ?auto_881974 ) ) ( not ( = ?auto_881968 ?auto_881975 ) ) ( not ( = ?auto_881968 ?auto_881976 ) ) ( not ( = ?auto_881969 ?auto_881970 ) ) ( not ( = ?auto_881969 ?auto_881971 ) ) ( not ( = ?auto_881969 ?auto_881972 ) ) ( not ( = ?auto_881969 ?auto_881973 ) ) ( not ( = ?auto_881969 ?auto_881974 ) ) ( not ( = ?auto_881969 ?auto_881975 ) ) ( not ( = ?auto_881969 ?auto_881976 ) ) ( not ( = ?auto_881970 ?auto_881971 ) ) ( not ( = ?auto_881970 ?auto_881972 ) ) ( not ( = ?auto_881970 ?auto_881973 ) ) ( not ( = ?auto_881970 ?auto_881974 ) ) ( not ( = ?auto_881970 ?auto_881975 ) ) ( not ( = ?auto_881970 ?auto_881976 ) ) ( not ( = ?auto_881971 ?auto_881972 ) ) ( not ( = ?auto_881971 ?auto_881973 ) ) ( not ( = ?auto_881971 ?auto_881974 ) ) ( not ( = ?auto_881971 ?auto_881975 ) ) ( not ( = ?auto_881971 ?auto_881976 ) ) ( not ( = ?auto_881972 ?auto_881973 ) ) ( not ( = ?auto_881972 ?auto_881974 ) ) ( not ( = ?auto_881972 ?auto_881975 ) ) ( not ( = ?auto_881972 ?auto_881976 ) ) ( not ( = ?auto_881973 ?auto_881974 ) ) ( not ( = ?auto_881973 ?auto_881975 ) ) ( not ( = ?auto_881973 ?auto_881976 ) ) ( not ( = ?auto_881974 ?auto_881975 ) ) ( not ( = ?auto_881974 ?auto_881976 ) ) ( not ( = ?auto_881975 ?auto_881976 ) ) ( ON ?auto_881974 ?auto_881975 ) ( ON ?auto_881973 ?auto_881974 ) ( ON ?auto_881972 ?auto_881973 ) ( ON ?auto_881971 ?auto_881972 ) ( ON ?auto_881970 ?auto_881971 ) ( ON ?auto_881969 ?auto_881970 ) ( CLEAR ?auto_881967 ) ( ON ?auto_881968 ?auto_881969 ) ( CLEAR ?auto_881968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_881966 ?auto_881967 ?auto_881968 )
      ( MAKE-10PILE ?auto_881966 ?auto_881967 ?auto_881968 ?auto_881969 ?auto_881970 ?auto_881971 ?auto_881972 ?auto_881973 ?auto_881974 ?auto_881975 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_882008 - BLOCK
      ?auto_882009 - BLOCK
      ?auto_882010 - BLOCK
      ?auto_882011 - BLOCK
      ?auto_882012 - BLOCK
      ?auto_882013 - BLOCK
      ?auto_882014 - BLOCK
      ?auto_882015 - BLOCK
      ?auto_882016 - BLOCK
      ?auto_882017 - BLOCK
    )
    :vars
    (
      ?auto_882018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882017 ?auto_882018 ) ( ON-TABLE ?auto_882008 ) ( not ( = ?auto_882008 ?auto_882009 ) ) ( not ( = ?auto_882008 ?auto_882010 ) ) ( not ( = ?auto_882008 ?auto_882011 ) ) ( not ( = ?auto_882008 ?auto_882012 ) ) ( not ( = ?auto_882008 ?auto_882013 ) ) ( not ( = ?auto_882008 ?auto_882014 ) ) ( not ( = ?auto_882008 ?auto_882015 ) ) ( not ( = ?auto_882008 ?auto_882016 ) ) ( not ( = ?auto_882008 ?auto_882017 ) ) ( not ( = ?auto_882008 ?auto_882018 ) ) ( not ( = ?auto_882009 ?auto_882010 ) ) ( not ( = ?auto_882009 ?auto_882011 ) ) ( not ( = ?auto_882009 ?auto_882012 ) ) ( not ( = ?auto_882009 ?auto_882013 ) ) ( not ( = ?auto_882009 ?auto_882014 ) ) ( not ( = ?auto_882009 ?auto_882015 ) ) ( not ( = ?auto_882009 ?auto_882016 ) ) ( not ( = ?auto_882009 ?auto_882017 ) ) ( not ( = ?auto_882009 ?auto_882018 ) ) ( not ( = ?auto_882010 ?auto_882011 ) ) ( not ( = ?auto_882010 ?auto_882012 ) ) ( not ( = ?auto_882010 ?auto_882013 ) ) ( not ( = ?auto_882010 ?auto_882014 ) ) ( not ( = ?auto_882010 ?auto_882015 ) ) ( not ( = ?auto_882010 ?auto_882016 ) ) ( not ( = ?auto_882010 ?auto_882017 ) ) ( not ( = ?auto_882010 ?auto_882018 ) ) ( not ( = ?auto_882011 ?auto_882012 ) ) ( not ( = ?auto_882011 ?auto_882013 ) ) ( not ( = ?auto_882011 ?auto_882014 ) ) ( not ( = ?auto_882011 ?auto_882015 ) ) ( not ( = ?auto_882011 ?auto_882016 ) ) ( not ( = ?auto_882011 ?auto_882017 ) ) ( not ( = ?auto_882011 ?auto_882018 ) ) ( not ( = ?auto_882012 ?auto_882013 ) ) ( not ( = ?auto_882012 ?auto_882014 ) ) ( not ( = ?auto_882012 ?auto_882015 ) ) ( not ( = ?auto_882012 ?auto_882016 ) ) ( not ( = ?auto_882012 ?auto_882017 ) ) ( not ( = ?auto_882012 ?auto_882018 ) ) ( not ( = ?auto_882013 ?auto_882014 ) ) ( not ( = ?auto_882013 ?auto_882015 ) ) ( not ( = ?auto_882013 ?auto_882016 ) ) ( not ( = ?auto_882013 ?auto_882017 ) ) ( not ( = ?auto_882013 ?auto_882018 ) ) ( not ( = ?auto_882014 ?auto_882015 ) ) ( not ( = ?auto_882014 ?auto_882016 ) ) ( not ( = ?auto_882014 ?auto_882017 ) ) ( not ( = ?auto_882014 ?auto_882018 ) ) ( not ( = ?auto_882015 ?auto_882016 ) ) ( not ( = ?auto_882015 ?auto_882017 ) ) ( not ( = ?auto_882015 ?auto_882018 ) ) ( not ( = ?auto_882016 ?auto_882017 ) ) ( not ( = ?auto_882016 ?auto_882018 ) ) ( not ( = ?auto_882017 ?auto_882018 ) ) ( ON ?auto_882016 ?auto_882017 ) ( ON ?auto_882015 ?auto_882016 ) ( ON ?auto_882014 ?auto_882015 ) ( ON ?auto_882013 ?auto_882014 ) ( ON ?auto_882012 ?auto_882013 ) ( ON ?auto_882011 ?auto_882012 ) ( ON ?auto_882010 ?auto_882011 ) ( CLEAR ?auto_882008 ) ( ON ?auto_882009 ?auto_882010 ) ( CLEAR ?auto_882009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_882008 ?auto_882009 )
      ( MAKE-10PILE ?auto_882008 ?auto_882009 ?auto_882010 ?auto_882011 ?auto_882012 ?auto_882013 ?auto_882014 ?auto_882015 ?auto_882016 ?auto_882017 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_882050 - BLOCK
      ?auto_882051 - BLOCK
      ?auto_882052 - BLOCK
      ?auto_882053 - BLOCK
      ?auto_882054 - BLOCK
      ?auto_882055 - BLOCK
      ?auto_882056 - BLOCK
      ?auto_882057 - BLOCK
      ?auto_882058 - BLOCK
      ?auto_882059 - BLOCK
    )
    :vars
    (
      ?auto_882060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882059 ?auto_882060 ) ( not ( = ?auto_882050 ?auto_882051 ) ) ( not ( = ?auto_882050 ?auto_882052 ) ) ( not ( = ?auto_882050 ?auto_882053 ) ) ( not ( = ?auto_882050 ?auto_882054 ) ) ( not ( = ?auto_882050 ?auto_882055 ) ) ( not ( = ?auto_882050 ?auto_882056 ) ) ( not ( = ?auto_882050 ?auto_882057 ) ) ( not ( = ?auto_882050 ?auto_882058 ) ) ( not ( = ?auto_882050 ?auto_882059 ) ) ( not ( = ?auto_882050 ?auto_882060 ) ) ( not ( = ?auto_882051 ?auto_882052 ) ) ( not ( = ?auto_882051 ?auto_882053 ) ) ( not ( = ?auto_882051 ?auto_882054 ) ) ( not ( = ?auto_882051 ?auto_882055 ) ) ( not ( = ?auto_882051 ?auto_882056 ) ) ( not ( = ?auto_882051 ?auto_882057 ) ) ( not ( = ?auto_882051 ?auto_882058 ) ) ( not ( = ?auto_882051 ?auto_882059 ) ) ( not ( = ?auto_882051 ?auto_882060 ) ) ( not ( = ?auto_882052 ?auto_882053 ) ) ( not ( = ?auto_882052 ?auto_882054 ) ) ( not ( = ?auto_882052 ?auto_882055 ) ) ( not ( = ?auto_882052 ?auto_882056 ) ) ( not ( = ?auto_882052 ?auto_882057 ) ) ( not ( = ?auto_882052 ?auto_882058 ) ) ( not ( = ?auto_882052 ?auto_882059 ) ) ( not ( = ?auto_882052 ?auto_882060 ) ) ( not ( = ?auto_882053 ?auto_882054 ) ) ( not ( = ?auto_882053 ?auto_882055 ) ) ( not ( = ?auto_882053 ?auto_882056 ) ) ( not ( = ?auto_882053 ?auto_882057 ) ) ( not ( = ?auto_882053 ?auto_882058 ) ) ( not ( = ?auto_882053 ?auto_882059 ) ) ( not ( = ?auto_882053 ?auto_882060 ) ) ( not ( = ?auto_882054 ?auto_882055 ) ) ( not ( = ?auto_882054 ?auto_882056 ) ) ( not ( = ?auto_882054 ?auto_882057 ) ) ( not ( = ?auto_882054 ?auto_882058 ) ) ( not ( = ?auto_882054 ?auto_882059 ) ) ( not ( = ?auto_882054 ?auto_882060 ) ) ( not ( = ?auto_882055 ?auto_882056 ) ) ( not ( = ?auto_882055 ?auto_882057 ) ) ( not ( = ?auto_882055 ?auto_882058 ) ) ( not ( = ?auto_882055 ?auto_882059 ) ) ( not ( = ?auto_882055 ?auto_882060 ) ) ( not ( = ?auto_882056 ?auto_882057 ) ) ( not ( = ?auto_882056 ?auto_882058 ) ) ( not ( = ?auto_882056 ?auto_882059 ) ) ( not ( = ?auto_882056 ?auto_882060 ) ) ( not ( = ?auto_882057 ?auto_882058 ) ) ( not ( = ?auto_882057 ?auto_882059 ) ) ( not ( = ?auto_882057 ?auto_882060 ) ) ( not ( = ?auto_882058 ?auto_882059 ) ) ( not ( = ?auto_882058 ?auto_882060 ) ) ( not ( = ?auto_882059 ?auto_882060 ) ) ( ON ?auto_882058 ?auto_882059 ) ( ON ?auto_882057 ?auto_882058 ) ( ON ?auto_882056 ?auto_882057 ) ( ON ?auto_882055 ?auto_882056 ) ( ON ?auto_882054 ?auto_882055 ) ( ON ?auto_882053 ?auto_882054 ) ( ON ?auto_882052 ?auto_882053 ) ( ON ?auto_882051 ?auto_882052 ) ( ON ?auto_882050 ?auto_882051 ) ( CLEAR ?auto_882050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_882050 )
      ( MAKE-10PILE ?auto_882050 ?auto_882051 ?auto_882052 ?auto_882053 ?auto_882054 ?auto_882055 ?auto_882056 ?auto_882057 ?auto_882058 ?auto_882059 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_882093 - BLOCK
      ?auto_882094 - BLOCK
      ?auto_882095 - BLOCK
      ?auto_882096 - BLOCK
      ?auto_882097 - BLOCK
      ?auto_882098 - BLOCK
      ?auto_882099 - BLOCK
      ?auto_882100 - BLOCK
      ?auto_882101 - BLOCK
      ?auto_882102 - BLOCK
      ?auto_882103 - BLOCK
    )
    :vars
    (
      ?auto_882104 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_882102 ) ( ON ?auto_882103 ?auto_882104 ) ( CLEAR ?auto_882103 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_882093 ) ( ON ?auto_882094 ?auto_882093 ) ( ON ?auto_882095 ?auto_882094 ) ( ON ?auto_882096 ?auto_882095 ) ( ON ?auto_882097 ?auto_882096 ) ( ON ?auto_882098 ?auto_882097 ) ( ON ?auto_882099 ?auto_882098 ) ( ON ?auto_882100 ?auto_882099 ) ( ON ?auto_882101 ?auto_882100 ) ( ON ?auto_882102 ?auto_882101 ) ( not ( = ?auto_882093 ?auto_882094 ) ) ( not ( = ?auto_882093 ?auto_882095 ) ) ( not ( = ?auto_882093 ?auto_882096 ) ) ( not ( = ?auto_882093 ?auto_882097 ) ) ( not ( = ?auto_882093 ?auto_882098 ) ) ( not ( = ?auto_882093 ?auto_882099 ) ) ( not ( = ?auto_882093 ?auto_882100 ) ) ( not ( = ?auto_882093 ?auto_882101 ) ) ( not ( = ?auto_882093 ?auto_882102 ) ) ( not ( = ?auto_882093 ?auto_882103 ) ) ( not ( = ?auto_882093 ?auto_882104 ) ) ( not ( = ?auto_882094 ?auto_882095 ) ) ( not ( = ?auto_882094 ?auto_882096 ) ) ( not ( = ?auto_882094 ?auto_882097 ) ) ( not ( = ?auto_882094 ?auto_882098 ) ) ( not ( = ?auto_882094 ?auto_882099 ) ) ( not ( = ?auto_882094 ?auto_882100 ) ) ( not ( = ?auto_882094 ?auto_882101 ) ) ( not ( = ?auto_882094 ?auto_882102 ) ) ( not ( = ?auto_882094 ?auto_882103 ) ) ( not ( = ?auto_882094 ?auto_882104 ) ) ( not ( = ?auto_882095 ?auto_882096 ) ) ( not ( = ?auto_882095 ?auto_882097 ) ) ( not ( = ?auto_882095 ?auto_882098 ) ) ( not ( = ?auto_882095 ?auto_882099 ) ) ( not ( = ?auto_882095 ?auto_882100 ) ) ( not ( = ?auto_882095 ?auto_882101 ) ) ( not ( = ?auto_882095 ?auto_882102 ) ) ( not ( = ?auto_882095 ?auto_882103 ) ) ( not ( = ?auto_882095 ?auto_882104 ) ) ( not ( = ?auto_882096 ?auto_882097 ) ) ( not ( = ?auto_882096 ?auto_882098 ) ) ( not ( = ?auto_882096 ?auto_882099 ) ) ( not ( = ?auto_882096 ?auto_882100 ) ) ( not ( = ?auto_882096 ?auto_882101 ) ) ( not ( = ?auto_882096 ?auto_882102 ) ) ( not ( = ?auto_882096 ?auto_882103 ) ) ( not ( = ?auto_882096 ?auto_882104 ) ) ( not ( = ?auto_882097 ?auto_882098 ) ) ( not ( = ?auto_882097 ?auto_882099 ) ) ( not ( = ?auto_882097 ?auto_882100 ) ) ( not ( = ?auto_882097 ?auto_882101 ) ) ( not ( = ?auto_882097 ?auto_882102 ) ) ( not ( = ?auto_882097 ?auto_882103 ) ) ( not ( = ?auto_882097 ?auto_882104 ) ) ( not ( = ?auto_882098 ?auto_882099 ) ) ( not ( = ?auto_882098 ?auto_882100 ) ) ( not ( = ?auto_882098 ?auto_882101 ) ) ( not ( = ?auto_882098 ?auto_882102 ) ) ( not ( = ?auto_882098 ?auto_882103 ) ) ( not ( = ?auto_882098 ?auto_882104 ) ) ( not ( = ?auto_882099 ?auto_882100 ) ) ( not ( = ?auto_882099 ?auto_882101 ) ) ( not ( = ?auto_882099 ?auto_882102 ) ) ( not ( = ?auto_882099 ?auto_882103 ) ) ( not ( = ?auto_882099 ?auto_882104 ) ) ( not ( = ?auto_882100 ?auto_882101 ) ) ( not ( = ?auto_882100 ?auto_882102 ) ) ( not ( = ?auto_882100 ?auto_882103 ) ) ( not ( = ?auto_882100 ?auto_882104 ) ) ( not ( = ?auto_882101 ?auto_882102 ) ) ( not ( = ?auto_882101 ?auto_882103 ) ) ( not ( = ?auto_882101 ?auto_882104 ) ) ( not ( = ?auto_882102 ?auto_882103 ) ) ( not ( = ?auto_882102 ?auto_882104 ) ) ( not ( = ?auto_882103 ?auto_882104 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_882103 ?auto_882104 )
      ( !STACK ?auto_882103 ?auto_882102 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_882139 - BLOCK
      ?auto_882140 - BLOCK
      ?auto_882141 - BLOCK
      ?auto_882142 - BLOCK
      ?auto_882143 - BLOCK
      ?auto_882144 - BLOCK
      ?auto_882145 - BLOCK
      ?auto_882146 - BLOCK
      ?auto_882147 - BLOCK
      ?auto_882148 - BLOCK
      ?auto_882149 - BLOCK
    )
    :vars
    (
      ?auto_882150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882149 ?auto_882150 ) ( ON-TABLE ?auto_882139 ) ( ON ?auto_882140 ?auto_882139 ) ( ON ?auto_882141 ?auto_882140 ) ( ON ?auto_882142 ?auto_882141 ) ( ON ?auto_882143 ?auto_882142 ) ( ON ?auto_882144 ?auto_882143 ) ( ON ?auto_882145 ?auto_882144 ) ( ON ?auto_882146 ?auto_882145 ) ( ON ?auto_882147 ?auto_882146 ) ( not ( = ?auto_882139 ?auto_882140 ) ) ( not ( = ?auto_882139 ?auto_882141 ) ) ( not ( = ?auto_882139 ?auto_882142 ) ) ( not ( = ?auto_882139 ?auto_882143 ) ) ( not ( = ?auto_882139 ?auto_882144 ) ) ( not ( = ?auto_882139 ?auto_882145 ) ) ( not ( = ?auto_882139 ?auto_882146 ) ) ( not ( = ?auto_882139 ?auto_882147 ) ) ( not ( = ?auto_882139 ?auto_882148 ) ) ( not ( = ?auto_882139 ?auto_882149 ) ) ( not ( = ?auto_882139 ?auto_882150 ) ) ( not ( = ?auto_882140 ?auto_882141 ) ) ( not ( = ?auto_882140 ?auto_882142 ) ) ( not ( = ?auto_882140 ?auto_882143 ) ) ( not ( = ?auto_882140 ?auto_882144 ) ) ( not ( = ?auto_882140 ?auto_882145 ) ) ( not ( = ?auto_882140 ?auto_882146 ) ) ( not ( = ?auto_882140 ?auto_882147 ) ) ( not ( = ?auto_882140 ?auto_882148 ) ) ( not ( = ?auto_882140 ?auto_882149 ) ) ( not ( = ?auto_882140 ?auto_882150 ) ) ( not ( = ?auto_882141 ?auto_882142 ) ) ( not ( = ?auto_882141 ?auto_882143 ) ) ( not ( = ?auto_882141 ?auto_882144 ) ) ( not ( = ?auto_882141 ?auto_882145 ) ) ( not ( = ?auto_882141 ?auto_882146 ) ) ( not ( = ?auto_882141 ?auto_882147 ) ) ( not ( = ?auto_882141 ?auto_882148 ) ) ( not ( = ?auto_882141 ?auto_882149 ) ) ( not ( = ?auto_882141 ?auto_882150 ) ) ( not ( = ?auto_882142 ?auto_882143 ) ) ( not ( = ?auto_882142 ?auto_882144 ) ) ( not ( = ?auto_882142 ?auto_882145 ) ) ( not ( = ?auto_882142 ?auto_882146 ) ) ( not ( = ?auto_882142 ?auto_882147 ) ) ( not ( = ?auto_882142 ?auto_882148 ) ) ( not ( = ?auto_882142 ?auto_882149 ) ) ( not ( = ?auto_882142 ?auto_882150 ) ) ( not ( = ?auto_882143 ?auto_882144 ) ) ( not ( = ?auto_882143 ?auto_882145 ) ) ( not ( = ?auto_882143 ?auto_882146 ) ) ( not ( = ?auto_882143 ?auto_882147 ) ) ( not ( = ?auto_882143 ?auto_882148 ) ) ( not ( = ?auto_882143 ?auto_882149 ) ) ( not ( = ?auto_882143 ?auto_882150 ) ) ( not ( = ?auto_882144 ?auto_882145 ) ) ( not ( = ?auto_882144 ?auto_882146 ) ) ( not ( = ?auto_882144 ?auto_882147 ) ) ( not ( = ?auto_882144 ?auto_882148 ) ) ( not ( = ?auto_882144 ?auto_882149 ) ) ( not ( = ?auto_882144 ?auto_882150 ) ) ( not ( = ?auto_882145 ?auto_882146 ) ) ( not ( = ?auto_882145 ?auto_882147 ) ) ( not ( = ?auto_882145 ?auto_882148 ) ) ( not ( = ?auto_882145 ?auto_882149 ) ) ( not ( = ?auto_882145 ?auto_882150 ) ) ( not ( = ?auto_882146 ?auto_882147 ) ) ( not ( = ?auto_882146 ?auto_882148 ) ) ( not ( = ?auto_882146 ?auto_882149 ) ) ( not ( = ?auto_882146 ?auto_882150 ) ) ( not ( = ?auto_882147 ?auto_882148 ) ) ( not ( = ?auto_882147 ?auto_882149 ) ) ( not ( = ?auto_882147 ?auto_882150 ) ) ( not ( = ?auto_882148 ?auto_882149 ) ) ( not ( = ?auto_882148 ?auto_882150 ) ) ( not ( = ?auto_882149 ?auto_882150 ) ) ( CLEAR ?auto_882147 ) ( ON ?auto_882148 ?auto_882149 ) ( CLEAR ?auto_882148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_882139 ?auto_882140 ?auto_882141 ?auto_882142 ?auto_882143 ?auto_882144 ?auto_882145 ?auto_882146 ?auto_882147 ?auto_882148 )
      ( MAKE-11PILE ?auto_882139 ?auto_882140 ?auto_882141 ?auto_882142 ?auto_882143 ?auto_882144 ?auto_882145 ?auto_882146 ?auto_882147 ?auto_882148 ?auto_882149 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_882185 - BLOCK
      ?auto_882186 - BLOCK
      ?auto_882187 - BLOCK
      ?auto_882188 - BLOCK
      ?auto_882189 - BLOCK
      ?auto_882190 - BLOCK
      ?auto_882191 - BLOCK
      ?auto_882192 - BLOCK
      ?auto_882193 - BLOCK
      ?auto_882194 - BLOCK
      ?auto_882195 - BLOCK
    )
    :vars
    (
      ?auto_882196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882195 ?auto_882196 ) ( ON-TABLE ?auto_882185 ) ( ON ?auto_882186 ?auto_882185 ) ( ON ?auto_882187 ?auto_882186 ) ( ON ?auto_882188 ?auto_882187 ) ( ON ?auto_882189 ?auto_882188 ) ( ON ?auto_882190 ?auto_882189 ) ( ON ?auto_882191 ?auto_882190 ) ( ON ?auto_882192 ?auto_882191 ) ( not ( = ?auto_882185 ?auto_882186 ) ) ( not ( = ?auto_882185 ?auto_882187 ) ) ( not ( = ?auto_882185 ?auto_882188 ) ) ( not ( = ?auto_882185 ?auto_882189 ) ) ( not ( = ?auto_882185 ?auto_882190 ) ) ( not ( = ?auto_882185 ?auto_882191 ) ) ( not ( = ?auto_882185 ?auto_882192 ) ) ( not ( = ?auto_882185 ?auto_882193 ) ) ( not ( = ?auto_882185 ?auto_882194 ) ) ( not ( = ?auto_882185 ?auto_882195 ) ) ( not ( = ?auto_882185 ?auto_882196 ) ) ( not ( = ?auto_882186 ?auto_882187 ) ) ( not ( = ?auto_882186 ?auto_882188 ) ) ( not ( = ?auto_882186 ?auto_882189 ) ) ( not ( = ?auto_882186 ?auto_882190 ) ) ( not ( = ?auto_882186 ?auto_882191 ) ) ( not ( = ?auto_882186 ?auto_882192 ) ) ( not ( = ?auto_882186 ?auto_882193 ) ) ( not ( = ?auto_882186 ?auto_882194 ) ) ( not ( = ?auto_882186 ?auto_882195 ) ) ( not ( = ?auto_882186 ?auto_882196 ) ) ( not ( = ?auto_882187 ?auto_882188 ) ) ( not ( = ?auto_882187 ?auto_882189 ) ) ( not ( = ?auto_882187 ?auto_882190 ) ) ( not ( = ?auto_882187 ?auto_882191 ) ) ( not ( = ?auto_882187 ?auto_882192 ) ) ( not ( = ?auto_882187 ?auto_882193 ) ) ( not ( = ?auto_882187 ?auto_882194 ) ) ( not ( = ?auto_882187 ?auto_882195 ) ) ( not ( = ?auto_882187 ?auto_882196 ) ) ( not ( = ?auto_882188 ?auto_882189 ) ) ( not ( = ?auto_882188 ?auto_882190 ) ) ( not ( = ?auto_882188 ?auto_882191 ) ) ( not ( = ?auto_882188 ?auto_882192 ) ) ( not ( = ?auto_882188 ?auto_882193 ) ) ( not ( = ?auto_882188 ?auto_882194 ) ) ( not ( = ?auto_882188 ?auto_882195 ) ) ( not ( = ?auto_882188 ?auto_882196 ) ) ( not ( = ?auto_882189 ?auto_882190 ) ) ( not ( = ?auto_882189 ?auto_882191 ) ) ( not ( = ?auto_882189 ?auto_882192 ) ) ( not ( = ?auto_882189 ?auto_882193 ) ) ( not ( = ?auto_882189 ?auto_882194 ) ) ( not ( = ?auto_882189 ?auto_882195 ) ) ( not ( = ?auto_882189 ?auto_882196 ) ) ( not ( = ?auto_882190 ?auto_882191 ) ) ( not ( = ?auto_882190 ?auto_882192 ) ) ( not ( = ?auto_882190 ?auto_882193 ) ) ( not ( = ?auto_882190 ?auto_882194 ) ) ( not ( = ?auto_882190 ?auto_882195 ) ) ( not ( = ?auto_882190 ?auto_882196 ) ) ( not ( = ?auto_882191 ?auto_882192 ) ) ( not ( = ?auto_882191 ?auto_882193 ) ) ( not ( = ?auto_882191 ?auto_882194 ) ) ( not ( = ?auto_882191 ?auto_882195 ) ) ( not ( = ?auto_882191 ?auto_882196 ) ) ( not ( = ?auto_882192 ?auto_882193 ) ) ( not ( = ?auto_882192 ?auto_882194 ) ) ( not ( = ?auto_882192 ?auto_882195 ) ) ( not ( = ?auto_882192 ?auto_882196 ) ) ( not ( = ?auto_882193 ?auto_882194 ) ) ( not ( = ?auto_882193 ?auto_882195 ) ) ( not ( = ?auto_882193 ?auto_882196 ) ) ( not ( = ?auto_882194 ?auto_882195 ) ) ( not ( = ?auto_882194 ?auto_882196 ) ) ( not ( = ?auto_882195 ?auto_882196 ) ) ( ON ?auto_882194 ?auto_882195 ) ( CLEAR ?auto_882192 ) ( ON ?auto_882193 ?auto_882194 ) ( CLEAR ?auto_882193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_882185 ?auto_882186 ?auto_882187 ?auto_882188 ?auto_882189 ?auto_882190 ?auto_882191 ?auto_882192 ?auto_882193 )
      ( MAKE-11PILE ?auto_882185 ?auto_882186 ?auto_882187 ?auto_882188 ?auto_882189 ?auto_882190 ?auto_882191 ?auto_882192 ?auto_882193 ?auto_882194 ?auto_882195 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_882231 - BLOCK
      ?auto_882232 - BLOCK
      ?auto_882233 - BLOCK
      ?auto_882234 - BLOCK
      ?auto_882235 - BLOCK
      ?auto_882236 - BLOCK
      ?auto_882237 - BLOCK
      ?auto_882238 - BLOCK
      ?auto_882239 - BLOCK
      ?auto_882240 - BLOCK
      ?auto_882241 - BLOCK
    )
    :vars
    (
      ?auto_882242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882241 ?auto_882242 ) ( ON-TABLE ?auto_882231 ) ( ON ?auto_882232 ?auto_882231 ) ( ON ?auto_882233 ?auto_882232 ) ( ON ?auto_882234 ?auto_882233 ) ( ON ?auto_882235 ?auto_882234 ) ( ON ?auto_882236 ?auto_882235 ) ( ON ?auto_882237 ?auto_882236 ) ( not ( = ?auto_882231 ?auto_882232 ) ) ( not ( = ?auto_882231 ?auto_882233 ) ) ( not ( = ?auto_882231 ?auto_882234 ) ) ( not ( = ?auto_882231 ?auto_882235 ) ) ( not ( = ?auto_882231 ?auto_882236 ) ) ( not ( = ?auto_882231 ?auto_882237 ) ) ( not ( = ?auto_882231 ?auto_882238 ) ) ( not ( = ?auto_882231 ?auto_882239 ) ) ( not ( = ?auto_882231 ?auto_882240 ) ) ( not ( = ?auto_882231 ?auto_882241 ) ) ( not ( = ?auto_882231 ?auto_882242 ) ) ( not ( = ?auto_882232 ?auto_882233 ) ) ( not ( = ?auto_882232 ?auto_882234 ) ) ( not ( = ?auto_882232 ?auto_882235 ) ) ( not ( = ?auto_882232 ?auto_882236 ) ) ( not ( = ?auto_882232 ?auto_882237 ) ) ( not ( = ?auto_882232 ?auto_882238 ) ) ( not ( = ?auto_882232 ?auto_882239 ) ) ( not ( = ?auto_882232 ?auto_882240 ) ) ( not ( = ?auto_882232 ?auto_882241 ) ) ( not ( = ?auto_882232 ?auto_882242 ) ) ( not ( = ?auto_882233 ?auto_882234 ) ) ( not ( = ?auto_882233 ?auto_882235 ) ) ( not ( = ?auto_882233 ?auto_882236 ) ) ( not ( = ?auto_882233 ?auto_882237 ) ) ( not ( = ?auto_882233 ?auto_882238 ) ) ( not ( = ?auto_882233 ?auto_882239 ) ) ( not ( = ?auto_882233 ?auto_882240 ) ) ( not ( = ?auto_882233 ?auto_882241 ) ) ( not ( = ?auto_882233 ?auto_882242 ) ) ( not ( = ?auto_882234 ?auto_882235 ) ) ( not ( = ?auto_882234 ?auto_882236 ) ) ( not ( = ?auto_882234 ?auto_882237 ) ) ( not ( = ?auto_882234 ?auto_882238 ) ) ( not ( = ?auto_882234 ?auto_882239 ) ) ( not ( = ?auto_882234 ?auto_882240 ) ) ( not ( = ?auto_882234 ?auto_882241 ) ) ( not ( = ?auto_882234 ?auto_882242 ) ) ( not ( = ?auto_882235 ?auto_882236 ) ) ( not ( = ?auto_882235 ?auto_882237 ) ) ( not ( = ?auto_882235 ?auto_882238 ) ) ( not ( = ?auto_882235 ?auto_882239 ) ) ( not ( = ?auto_882235 ?auto_882240 ) ) ( not ( = ?auto_882235 ?auto_882241 ) ) ( not ( = ?auto_882235 ?auto_882242 ) ) ( not ( = ?auto_882236 ?auto_882237 ) ) ( not ( = ?auto_882236 ?auto_882238 ) ) ( not ( = ?auto_882236 ?auto_882239 ) ) ( not ( = ?auto_882236 ?auto_882240 ) ) ( not ( = ?auto_882236 ?auto_882241 ) ) ( not ( = ?auto_882236 ?auto_882242 ) ) ( not ( = ?auto_882237 ?auto_882238 ) ) ( not ( = ?auto_882237 ?auto_882239 ) ) ( not ( = ?auto_882237 ?auto_882240 ) ) ( not ( = ?auto_882237 ?auto_882241 ) ) ( not ( = ?auto_882237 ?auto_882242 ) ) ( not ( = ?auto_882238 ?auto_882239 ) ) ( not ( = ?auto_882238 ?auto_882240 ) ) ( not ( = ?auto_882238 ?auto_882241 ) ) ( not ( = ?auto_882238 ?auto_882242 ) ) ( not ( = ?auto_882239 ?auto_882240 ) ) ( not ( = ?auto_882239 ?auto_882241 ) ) ( not ( = ?auto_882239 ?auto_882242 ) ) ( not ( = ?auto_882240 ?auto_882241 ) ) ( not ( = ?auto_882240 ?auto_882242 ) ) ( not ( = ?auto_882241 ?auto_882242 ) ) ( ON ?auto_882240 ?auto_882241 ) ( ON ?auto_882239 ?auto_882240 ) ( CLEAR ?auto_882237 ) ( ON ?auto_882238 ?auto_882239 ) ( CLEAR ?auto_882238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_882231 ?auto_882232 ?auto_882233 ?auto_882234 ?auto_882235 ?auto_882236 ?auto_882237 ?auto_882238 )
      ( MAKE-11PILE ?auto_882231 ?auto_882232 ?auto_882233 ?auto_882234 ?auto_882235 ?auto_882236 ?auto_882237 ?auto_882238 ?auto_882239 ?auto_882240 ?auto_882241 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_882277 - BLOCK
      ?auto_882278 - BLOCK
      ?auto_882279 - BLOCK
      ?auto_882280 - BLOCK
      ?auto_882281 - BLOCK
      ?auto_882282 - BLOCK
      ?auto_882283 - BLOCK
      ?auto_882284 - BLOCK
      ?auto_882285 - BLOCK
      ?auto_882286 - BLOCK
      ?auto_882287 - BLOCK
    )
    :vars
    (
      ?auto_882288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882287 ?auto_882288 ) ( ON-TABLE ?auto_882277 ) ( ON ?auto_882278 ?auto_882277 ) ( ON ?auto_882279 ?auto_882278 ) ( ON ?auto_882280 ?auto_882279 ) ( ON ?auto_882281 ?auto_882280 ) ( ON ?auto_882282 ?auto_882281 ) ( not ( = ?auto_882277 ?auto_882278 ) ) ( not ( = ?auto_882277 ?auto_882279 ) ) ( not ( = ?auto_882277 ?auto_882280 ) ) ( not ( = ?auto_882277 ?auto_882281 ) ) ( not ( = ?auto_882277 ?auto_882282 ) ) ( not ( = ?auto_882277 ?auto_882283 ) ) ( not ( = ?auto_882277 ?auto_882284 ) ) ( not ( = ?auto_882277 ?auto_882285 ) ) ( not ( = ?auto_882277 ?auto_882286 ) ) ( not ( = ?auto_882277 ?auto_882287 ) ) ( not ( = ?auto_882277 ?auto_882288 ) ) ( not ( = ?auto_882278 ?auto_882279 ) ) ( not ( = ?auto_882278 ?auto_882280 ) ) ( not ( = ?auto_882278 ?auto_882281 ) ) ( not ( = ?auto_882278 ?auto_882282 ) ) ( not ( = ?auto_882278 ?auto_882283 ) ) ( not ( = ?auto_882278 ?auto_882284 ) ) ( not ( = ?auto_882278 ?auto_882285 ) ) ( not ( = ?auto_882278 ?auto_882286 ) ) ( not ( = ?auto_882278 ?auto_882287 ) ) ( not ( = ?auto_882278 ?auto_882288 ) ) ( not ( = ?auto_882279 ?auto_882280 ) ) ( not ( = ?auto_882279 ?auto_882281 ) ) ( not ( = ?auto_882279 ?auto_882282 ) ) ( not ( = ?auto_882279 ?auto_882283 ) ) ( not ( = ?auto_882279 ?auto_882284 ) ) ( not ( = ?auto_882279 ?auto_882285 ) ) ( not ( = ?auto_882279 ?auto_882286 ) ) ( not ( = ?auto_882279 ?auto_882287 ) ) ( not ( = ?auto_882279 ?auto_882288 ) ) ( not ( = ?auto_882280 ?auto_882281 ) ) ( not ( = ?auto_882280 ?auto_882282 ) ) ( not ( = ?auto_882280 ?auto_882283 ) ) ( not ( = ?auto_882280 ?auto_882284 ) ) ( not ( = ?auto_882280 ?auto_882285 ) ) ( not ( = ?auto_882280 ?auto_882286 ) ) ( not ( = ?auto_882280 ?auto_882287 ) ) ( not ( = ?auto_882280 ?auto_882288 ) ) ( not ( = ?auto_882281 ?auto_882282 ) ) ( not ( = ?auto_882281 ?auto_882283 ) ) ( not ( = ?auto_882281 ?auto_882284 ) ) ( not ( = ?auto_882281 ?auto_882285 ) ) ( not ( = ?auto_882281 ?auto_882286 ) ) ( not ( = ?auto_882281 ?auto_882287 ) ) ( not ( = ?auto_882281 ?auto_882288 ) ) ( not ( = ?auto_882282 ?auto_882283 ) ) ( not ( = ?auto_882282 ?auto_882284 ) ) ( not ( = ?auto_882282 ?auto_882285 ) ) ( not ( = ?auto_882282 ?auto_882286 ) ) ( not ( = ?auto_882282 ?auto_882287 ) ) ( not ( = ?auto_882282 ?auto_882288 ) ) ( not ( = ?auto_882283 ?auto_882284 ) ) ( not ( = ?auto_882283 ?auto_882285 ) ) ( not ( = ?auto_882283 ?auto_882286 ) ) ( not ( = ?auto_882283 ?auto_882287 ) ) ( not ( = ?auto_882283 ?auto_882288 ) ) ( not ( = ?auto_882284 ?auto_882285 ) ) ( not ( = ?auto_882284 ?auto_882286 ) ) ( not ( = ?auto_882284 ?auto_882287 ) ) ( not ( = ?auto_882284 ?auto_882288 ) ) ( not ( = ?auto_882285 ?auto_882286 ) ) ( not ( = ?auto_882285 ?auto_882287 ) ) ( not ( = ?auto_882285 ?auto_882288 ) ) ( not ( = ?auto_882286 ?auto_882287 ) ) ( not ( = ?auto_882286 ?auto_882288 ) ) ( not ( = ?auto_882287 ?auto_882288 ) ) ( ON ?auto_882286 ?auto_882287 ) ( ON ?auto_882285 ?auto_882286 ) ( ON ?auto_882284 ?auto_882285 ) ( CLEAR ?auto_882282 ) ( ON ?auto_882283 ?auto_882284 ) ( CLEAR ?auto_882283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_882277 ?auto_882278 ?auto_882279 ?auto_882280 ?auto_882281 ?auto_882282 ?auto_882283 )
      ( MAKE-11PILE ?auto_882277 ?auto_882278 ?auto_882279 ?auto_882280 ?auto_882281 ?auto_882282 ?auto_882283 ?auto_882284 ?auto_882285 ?auto_882286 ?auto_882287 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_882323 - BLOCK
      ?auto_882324 - BLOCK
      ?auto_882325 - BLOCK
      ?auto_882326 - BLOCK
      ?auto_882327 - BLOCK
      ?auto_882328 - BLOCK
      ?auto_882329 - BLOCK
      ?auto_882330 - BLOCK
      ?auto_882331 - BLOCK
      ?auto_882332 - BLOCK
      ?auto_882333 - BLOCK
    )
    :vars
    (
      ?auto_882334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882333 ?auto_882334 ) ( ON-TABLE ?auto_882323 ) ( ON ?auto_882324 ?auto_882323 ) ( ON ?auto_882325 ?auto_882324 ) ( ON ?auto_882326 ?auto_882325 ) ( ON ?auto_882327 ?auto_882326 ) ( not ( = ?auto_882323 ?auto_882324 ) ) ( not ( = ?auto_882323 ?auto_882325 ) ) ( not ( = ?auto_882323 ?auto_882326 ) ) ( not ( = ?auto_882323 ?auto_882327 ) ) ( not ( = ?auto_882323 ?auto_882328 ) ) ( not ( = ?auto_882323 ?auto_882329 ) ) ( not ( = ?auto_882323 ?auto_882330 ) ) ( not ( = ?auto_882323 ?auto_882331 ) ) ( not ( = ?auto_882323 ?auto_882332 ) ) ( not ( = ?auto_882323 ?auto_882333 ) ) ( not ( = ?auto_882323 ?auto_882334 ) ) ( not ( = ?auto_882324 ?auto_882325 ) ) ( not ( = ?auto_882324 ?auto_882326 ) ) ( not ( = ?auto_882324 ?auto_882327 ) ) ( not ( = ?auto_882324 ?auto_882328 ) ) ( not ( = ?auto_882324 ?auto_882329 ) ) ( not ( = ?auto_882324 ?auto_882330 ) ) ( not ( = ?auto_882324 ?auto_882331 ) ) ( not ( = ?auto_882324 ?auto_882332 ) ) ( not ( = ?auto_882324 ?auto_882333 ) ) ( not ( = ?auto_882324 ?auto_882334 ) ) ( not ( = ?auto_882325 ?auto_882326 ) ) ( not ( = ?auto_882325 ?auto_882327 ) ) ( not ( = ?auto_882325 ?auto_882328 ) ) ( not ( = ?auto_882325 ?auto_882329 ) ) ( not ( = ?auto_882325 ?auto_882330 ) ) ( not ( = ?auto_882325 ?auto_882331 ) ) ( not ( = ?auto_882325 ?auto_882332 ) ) ( not ( = ?auto_882325 ?auto_882333 ) ) ( not ( = ?auto_882325 ?auto_882334 ) ) ( not ( = ?auto_882326 ?auto_882327 ) ) ( not ( = ?auto_882326 ?auto_882328 ) ) ( not ( = ?auto_882326 ?auto_882329 ) ) ( not ( = ?auto_882326 ?auto_882330 ) ) ( not ( = ?auto_882326 ?auto_882331 ) ) ( not ( = ?auto_882326 ?auto_882332 ) ) ( not ( = ?auto_882326 ?auto_882333 ) ) ( not ( = ?auto_882326 ?auto_882334 ) ) ( not ( = ?auto_882327 ?auto_882328 ) ) ( not ( = ?auto_882327 ?auto_882329 ) ) ( not ( = ?auto_882327 ?auto_882330 ) ) ( not ( = ?auto_882327 ?auto_882331 ) ) ( not ( = ?auto_882327 ?auto_882332 ) ) ( not ( = ?auto_882327 ?auto_882333 ) ) ( not ( = ?auto_882327 ?auto_882334 ) ) ( not ( = ?auto_882328 ?auto_882329 ) ) ( not ( = ?auto_882328 ?auto_882330 ) ) ( not ( = ?auto_882328 ?auto_882331 ) ) ( not ( = ?auto_882328 ?auto_882332 ) ) ( not ( = ?auto_882328 ?auto_882333 ) ) ( not ( = ?auto_882328 ?auto_882334 ) ) ( not ( = ?auto_882329 ?auto_882330 ) ) ( not ( = ?auto_882329 ?auto_882331 ) ) ( not ( = ?auto_882329 ?auto_882332 ) ) ( not ( = ?auto_882329 ?auto_882333 ) ) ( not ( = ?auto_882329 ?auto_882334 ) ) ( not ( = ?auto_882330 ?auto_882331 ) ) ( not ( = ?auto_882330 ?auto_882332 ) ) ( not ( = ?auto_882330 ?auto_882333 ) ) ( not ( = ?auto_882330 ?auto_882334 ) ) ( not ( = ?auto_882331 ?auto_882332 ) ) ( not ( = ?auto_882331 ?auto_882333 ) ) ( not ( = ?auto_882331 ?auto_882334 ) ) ( not ( = ?auto_882332 ?auto_882333 ) ) ( not ( = ?auto_882332 ?auto_882334 ) ) ( not ( = ?auto_882333 ?auto_882334 ) ) ( ON ?auto_882332 ?auto_882333 ) ( ON ?auto_882331 ?auto_882332 ) ( ON ?auto_882330 ?auto_882331 ) ( ON ?auto_882329 ?auto_882330 ) ( CLEAR ?auto_882327 ) ( ON ?auto_882328 ?auto_882329 ) ( CLEAR ?auto_882328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_882323 ?auto_882324 ?auto_882325 ?auto_882326 ?auto_882327 ?auto_882328 )
      ( MAKE-11PILE ?auto_882323 ?auto_882324 ?auto_882325 ?auto_882326 ?auto_882327 ?auto_882328 ?auto_882329 ?auto_882330 ?auto_882331 ?auto_882332 ?auto_882333 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_882369 - BLOCK
      ?auto_882370 - BLOCK
      ?auto_882371 - BLOCK
      ?auto_882372 - BLOCK
      ?auto_882373 - BLOCK
      ?auto_882374 - BLOCK
      ?auto_882375 - BLOCK
      ?auto_882376 - BLOCK
      ?auto_882377 - BLOCK
      ?auto_882378 - BLOCK
      ?auto_882379 - BLOCK
    )
    :vars
    (
      ?auto_882380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882379 ?auto_882380 ) ( ON-TABLE ?auto_882369 ) ( ON ?auto_882370 ?auto_882369 ) ( ON ?auto_882371 ?auto_882370 ) ( ON ?auto_882372 ?auto_882371 ) ( not ( = ?auto_882369 ?auto_882370 ) ) ( not ( = ?auto_882369 ?auto_882371 ) ) ( not ( = ?auto_882369 ?auto_882372 ) ) ( not ( = ?auto_882369 ?auto_882373 ) ) ( not ( = ?auto_882369 ?auto_882374 ) ) ( not ( = ?auto_882369 ?auto_882375 ) ) ( not ( = ?auto_882369 ?auto_882376 ) ) ( not ( = ?auto_882369 ?auto_882377 ) ) ( not ( = ?auto_882369 ?auto_882378 ) ) ( not ( = ?auto_882369 ?auto_882379 ) ) ( not ( = ?auto_882369 ?auto_882380 ) ) ( not ( = ?auto_882370 ?auto_882371 ) ) ( not ( = ?auto_882370 ?auto_882372 ) ) ( not ( = ?auto_882370 ?auto_882373 ) ) ( not ( = ?auto_882370 ?auto_882374 ) ) ( not ( = ?auto_882370 ?auto_882375 ) ) ( not ( = ?auto_882370 ?auto_882376 ) ) ( not ( = ?auto_882370 ?auto_882377 ) ) ( not ( = ?auto_882370 ?auto_882378 ) ) ( not ( = ?auto_882370 ?auto_882379 ) ) ( not ( = ?auto_882370 ?auto_882380 ) ) ( not ( = ?auto_882371 ?auto_882372 ) ) ( not ( = ?auto_882371 ?auto_882373 ) ) ( not ( = ?auto_882371 ?auto_882374 ) ) ( not ( = ?auto_882371 ?auto_882375 ) ) ( not ( = ?auto_882371 ?auto_882376 ) ) ( not ( = ?auto_882371 ?auto_882377 ) ) ( not ( = ?auto_882371 ?auto_882378 ) ) ( not ( = ?auto_882371 ?auto_882379 ) ) ( not ( = ?auto_882371 ?auto_882380 ) ) ( not ( = ?auto_882372 ?auto_882373 ) ) ( not ( = ?auto_882372 ?auto_882374 ) ) ( not ( = ?auto_882372 ?auto_882375 ) ) ( not ( = ?auto_882372 ?auto_882376 ) ) ( not ( = ?auto_882372 ?auto_882377 ) ) ( not ( = ?auto_882372 ?auto_882378 ) ) ( not ( = ?auto_882372 ?auto_882379 ) ) ( not ( = ?auto_882372 ?auto_882380 ) ) ( not ( = ?auto_882373 ?auto_882374 ) ) ( not ( = ?auto_882373 ?auto_882375 ) ) ( not ( = ?auto_882373 ?auto_882376 ) ) ( not ( = ?auto_882373 ?auto_882377 ) ) ( not ( = ?auto_882373 ?auto_882378 ) ) ( not ( = ?auto_882373 ?auto_882379 ) ) ( not ( = ?auto_882373 ?auto_882380 ) ) ( not ( = ?auto_882374 ?auto_882375 ) ) ( not ( = ?auto_882374 ?auto_882376 ) ) ( not ( = ?auto_882374 ?auto_882377 ) ) ( not ( = ?auto_882374 ?auto_882378 ) ) ( not ( = ?auto_882374 ?auto_882379 ) ) ( not ( = ?auto_882374 ?auto_882380 ) ) ( not ( = ?auto_882375 ?auto_882376 ) ) ( not ( = ?auto_882375 ?auto_882377 ) ) ( not ( = ?auto_882375 ?auto_882378 ) ) ( not ( = ?auto_882375 ?auto_882379 ) ) ( not ( = ?auto_882375 ?auto_882380 ) ) ( not ( = ?auto_882376 ?auto_882377 ) ) ( not ( = ?auto_882376 ?auto_882378 ) ) ( not ( = ?auto_882376 ?auto_882379 ) ) ( not ( = ?auto_882376 ?auto_882380 ) ) ( not ( = ?auto_882377 ?auto_882378 ) ) ( not ( = ?auto_882377 ?auto_882379 ) ) ( not ( = ?auto_882377 ?auto_882380 ) ) ( not ( = ?auto_882378 ?auto_882379 ) ) ( not ( = ?auto_882378 ?auto_882380 ) ) ( not ( = ?auto_882379 ?auto_882380 ) ) ( ON ?auto_882378 ?auto_882379 ) ( ON ?auto_882377 ?auto_882378 ) ( ON ?auto_882376 ?auto_882377 ) ( ON ?auto_882375 ?auto_882376 ) ( ON ?auto_882374 ?auto_882375 ) ( CLEAR ?auto_882372 ) ( ON ?auto_882373 ?auto_882374 ) ( CLEAR ?auto_882373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_882369 ?auto_882370 ?auto_882371 ?auto_882372 ?auto_882373 )
      ( MAKE-11PILE ?auto_882369 ?auto_882370 ?auto_882371 ?auto_882372 ?auto_882373 ?auto_882374 ?auto_882375 ?auto_882376 ?auto_882377 ?auto_882378 ?auto_882379 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_882415 - BLOCK
      ?auto_882416 - BLOCK
      ?auto_882417 - BLOCK
      ?auto_882418 - BLOCK
      ?auto_882419 - BLOCK
      ?auto_882420 - BLOCK
      ?auto_882421 - BLOCK
      ?auto_882422 - BLOCK
      ?auto_882423 - BLOCK
      ?auto_882424 - BLOCK
      ?auto_882425 - BLOCK
    )
    :vars
    (
      ?auto_882426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882425 ?auto_882426 ) ( ON-TABLE ?auto_882415 ) ( ON ?auto_882416 ?auto_882415 ) ( ON ?auto_882417 ?auto_882416 ) ( not ( = ?auto_882415 ?auto_882416 ) ) ( not ( = ?auto_882415 ?auto_882417 ) ) ( not ( = ?auto_882415 ?auto_882418 ) ) ( not ( = ?auto_882415 ?auto_882419 ) ) ( not ( = ?auto_882415 ?auto_882420 ) ) ( not ( = ?auto_882415 ?auto_882421 ) ) ( not ( = ?auto_882415 ?auto_882422 ) ) ( not ( = ?auto_882415 ?auto_882423 ) ) ( not ( = ?auto_882415 ?auto_882424 ) ) ( not ( = ?auto_882415 ?auto_882425 ) ) ( not ( = ?auto_882415 ?auto_882426 ) ) ( not ( = ?auto_882416 ?auto_882417 ) ) ( not ( = ?auto_882416 ?auto_882418 ) ) ( not ( = ?auto_882416 ?auto_882419 ) ) ( not ( = ?auto_882416 ?auto_882420 ) ) ( not ( = ?auto_882416 ?auto_882421 ) ) ( not ( = ?auto_882416 ?auto_882422 ) ) ( not ( = ?auto_882416 ?auto_882423 ) ) ( not ( = ?auto_882416 ?auto_882424 ) ) ( not ( = ?auto_882416 ?auto_882425 ) ) ( not ( = ?auto_882416 ?auto_882426 ) ) ( not ( = ?auto_882417 ?auto_882418 ) ) ( not ( = ?auto_882417 ?auto_882419 ) ) ( not ( = ?auto_882417 ?auto_882420 ) ) ( not ( = ?auto_882417 ?auto_882421 ) ) ( not ( = ?auto_882417 ?auto_882422 ) ) ( not ( = ?auto_882417 ?auto_882423 ) ) ( not ( = ?auto_882417 ?auto_882424 ) ) ( not ( = ?auto_882417 ?auto_882425 ) ) ( not ( = ?auto_882417 ?auto_882426 ) ) ( not ( = ?auto_882418 ?auto_882419 ) ) ( not ( = ?auto_882418 ?auto_882420 ) ) ( not ( = ?auto_882418 ?auto_882421 ) ) ( not ( = ?auto_882418 ?auto_882422 ) ) ( not ( = ?auto_882418 ?auto_882423 ) ) ( not ( = ?auto_882418 ?auto_882424 ) ) ( not ( = ?auto_882418 ?auto_882425 ) ) ( not ( = ?auto_882418 ?auto_882426 ) ) ( not ( = ?auto_882419 ?auto_882420 ) ) ( not ( = ?auto_882419 ?auto_882421 ) ) ( not ( = ?auto_882419 ?auto_882422 ) ) ( not ( = ?auto_882419 ?auto_882423 ) ) ( not ( = ?auto_882419 ?auto_882424 ) ) ( not ( = ?auto_882419 ?auto_882425 ) ) ( not ( = ?auto_882419 ?auto_882426 ) ) ( not ( = ?auto_882420 ?auto_882421 ) ) ( not ( = ?auto_882420 ?auto_882422 ) ) ( not ( = ?auto_882420 ?auto_882423 ) ) ( not ( = ?auto_882420 ?auto_882424 ) ) ( not ( = ?auto_882420 ?auto_882425 ) ) ( not ( = ?auto_882420 ?auto_882426 ) ) ( not ( = ?auto_882421 ?auto_882422 ) ) ( not ( = ?auto_882421 ?auto_882423 ) ) ( not ( = ?auto_882421 ?auto_882424 ) ) ( not ( = ?auto_882421 ?auto_882425 ) ) ( not ( = ?auto_882421 ?auto_882426 ) ) ( not ( = ?auto_882422 ?auto_882423 ) ) ( not ( = ?auto_882422 ?auto_882424 ) ) ( not ( = ?auto_882422 ?auto_882425 ) ) ( not ( = ?auto_882422 ?auto_882426 ) ) ( not ( = ?auto_882423 ?auto_882424 ) ) ( not ( = ?auto_882423 ?auto_882425 ) ) ( not ( = ?auto_882423 ?auto_882426 ) ) ( not ( = ?auto_882424 ?auto_882425 ) ) ( not ( = ?auto_882424 ?auto_882426 ) ) ( not ( = ?auto_882425 ?auto_882426 ) ) ( ON ?auto_882424 ?auto_882425 ) ( ON ?auto_882423 ?auto_882424 ) ( ON ?auto_882422 ?auto_882423 ) ( ON ?auto_882421 ?auto_882422 ) ( ON ?auto_882420 ?auto_882421 ) ( ON ?auto_882419 ?auto_882420 ) ( CLEAR ?auto_882417 ) ( ON ?auto_882418 ?auto_882419 ) ( CLEAR ?auto_882418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_882415 ?auto_882416 ?auto_882417 ?auto_882418 )
      ( MAKE-11PILE ?auto_882415 ?auto_882416 ?auto_882417 ?auto_882418 ?auto_882419 ?auto_882420 ?auto_882421 ?auto_882422 ?auto_882423 ?auto_882424 ?auto_882425 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_882461 - BLOCK
      ?auto_882462 - BLOCK
      ?auto_882463 - BLOCK
      ?auto_882464 - BLOCK
      ?auto_882465 - BLOCK
      ?auto_882466 - BLOCK
      ?auto_882467 - BLOCK
      ?auto_882468 - BLOCK
      ?auto_882469 - BLOCK
      ?auto_882470 - BLOCK
      ?auto_882471 - BLOCK
    )
    :vars
    (
      ?auto_882472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882471 ?auto_882472 ) ( ON-TABLE ?auto_882461 ) ( ON ?auto_882462 ?auto_882461 ) ( not ( = ?auto_882461 ?auto_882462 ) ) ( not ( = ?auto_882461 ?auto_882463 ) ) ( not ( = ?auto_882461 ?auto_882464 ) ) ( not ( = ?auto_882461 ?auto_882465 ) ) ( not ( = ?auto_882461 ?auto_882466 ) ) ( not ( = ?auto_882461 ?auto_882467 ) ) ( not ( = ?auto_882461 ?auto_882468 ) ) ( not ( = ?auto_882461 ?auto_882469 ) ) ( not ( = ?auto_882461 ?auto_882470 ) ) ( not ( = ?auto_882461 ?auto_882471 ) ) ( not ( = ?auto_882461 ?auto_882472 ) ) ( not ( = ?auto_882462 ?auto_882463 ) ) ( not ( = ?auto_882462 ?auto_882464 ) ) ( not ( = ?auto_882462 ?auto_882465 ) ) ( not ( = ?auto_882462 ?auto_882466 ) ) ( not ( = ?auto_882462 ?auto_882467 ) ) ( not ( = ?auto_882462 ?auto_882468 ) ) ( not ( = ?auto_882462 ?auto_882469 ) ) ( not ( = ?auto_882462 ?auto_882470 ) ) ( not ( = ?auto_882462 ?auto_882471 ) ) ( not ( = ?auto_882462 ?auto_882472 ) ) ( not ( = ?auto_882463 ?auto_882464 ) ) ( not ( = ?auto_882463 ?auto_882465 ) ) ( not ( = ?auto_882463 ?auto_882466 ) ) ( not ( = ?auto_882463 ?auto_882467 ) ) ( not ( = ?auto_882463 ?auto_882468 ) ) ( not ( = ?auto_882463 ?auto_882469 ) ) ( not ( = ?auto_882463 ?auto_882470 ) ) ( not ( = ?auto_882463 ?auto_882471 ) ) ( not ( = ?auto_882463 ?auto_882472 ) ) ( not ( = ?auto_882464 ?auto_882465 ) ) ( not ( = ?auto_882464 ?auto_882466 ) ) ( not ( = ?auto_882464 ?auto_882467 ) ) ( not ( = ?auto_882464 ?auto_882468 ) ) ( not ( = ?auto_882464 ?auto_882469 ) ) ( not ( = ?auto_882464 ?auto_882470 ) ) ( not ( = ?auto_882464 ?auto_882471 ) ) ( not ( = ?auto_882464 ?auto_882472 ) ) ( not ( = ?auto_882465 ?auto_882466 ) ) ( not ( = ?auto_882465 ?auto_882467 ) ) ( not ( = ?auto_882465 ?auto_882468 ) ) ( not ( = ?auto_882465 ?auto_882469 ) ) ( not ( = ?auto_882465 ?auto_882470 ) ) ( not ( = ?auto_882465 ?auto_882471 ) ) ( not ( = ?auto_882465 ?auto_882472 ) ) ( not ( = ?auto_882466 ?auto_882467 ) ) ( not ( = ?auto_882466 ?auto_882468 ) ) ( not ( = ?auto_882466 ?auto_882469 ) ) ( not ( = ?auto_882466 ?auto_882470 ) ) ( not ( = ?auto_882466 ?auto_882471 ) ) ( not ( = ?auto_882466 ?auto_882472 ) ) ( not ( = ?auto_882467 ?auto_882468 ) ) ( not ( = ?auto_882467 ?auto_882469 ) ) ( not ( = ?auto_882467 ?auto_882470 ) ) ( not ( = ?auto_882467 ?auto_882471 ) ) ( not ( = ?auto_882467 ?auto_882472 ) ) ( not ( = ?auto_882468 ?auto_882469 ) ) ( not ( = ?auto_882468 ?auto_882470 ) ) ( not ( = ?auto_882468 ?auto_882471 ) ) ( not ( = ?auto_882468 ?auto_882472 ) ) ( not ( = ?auto_882469 ?auto_882470 ) ) ( not ( = ?auto_882469 ?auto_882471 ) ) ( not ( = ?auto_882469 ?auto_882472 ) ) ( not ( = ?auto_882470 ?auto_882471 ) ) ( not ( = ?auto_882470 ?auto_882472 ) ) ( not ( = ?auto_882471 ?auto_882472 ) ) ( ON ?auto_882470 ?auto_882471 ) ( ON ?auto_882469 ?auto_882470 ) ( ON ?auto_882468 ?auto_882469 ) ( ON ?auto_882467 ?auto_882468 ) ( ON ?auto_882466 ?auto_882467 ) ( ON ?auto_882465 ?auto_882466 ) ( ON ?auto_882464 ?auto_882465 ) ( CLEAR ?auto_882462 ) ( ON ?auto_882463 ?auto_882464 ) ( CLEAR ?auto_882463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_882461 ?auto_882462 ?auto_882463 )
      ( MAKE-11PILE ?auto_882461 ?auto_882462 ?auto_882463 ?auto_882464 ?auto_882465 ?auto_882466 ?auto_882467 ?auto_882468 ?auto_882469 ?auto_882470 ?auto_882471 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_882507 - BLOCK
      ?auto_882508 - BLOCK
      ?auto_882509 - BLOCK
      ?auto_882510 - BLOCK
      ?auto_882511 - BLOCK
      ?auto_882512 - BLOCK
      ?auto_882513 - BLOCK
      ?auto_882514 - BLOCK
      ?auto_882515 - BLOCK
      ?auto_882516 - BLOCK
      ?auto_882517 - BLOCK
    )
    :vars
    (
      ?auto_882518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882517 ?auto_882518 ) ( ON-TABLE ?auto_882507 ) ( not ( = ?auto_882507 ?auto_882508 ) ) ( not ( = ?auto_882507 ?auto_882509 ) ) ( not ( = ?auto_882507 ?auto_882510 ) ) ( not ( = ?auto_882507 ?auto_882511 ) ) ( not ( = ?auto_882507 ?auto_882512 ) ) ( not ( = ?auto_882507 ?auto_882513 ) ) ( not ( = ?auto_882507 ?auto_882514 ) ) ( not ( = ?auto_882507 ?auto_882515 ) ) ( not ( = ?auto_882507 ?auto_882516 ) ) ( not ( = ?auto_882507 ?auto_882517 ) ) ( not ( = ?auto_882507 ?auto_882518 ) ) ( not ( = ?auto_882508 ?auto_882509 ) ) ( not ( = ?auto_882508 ?auto_882510 ) ) ( not ( = ?auto_882508 ?auto_882511 ) ) ( not ( = ?auto_882508 ?auto_882512 ) ) ( not ( = ?auto_882508 ?auto_882513 ) ) ( not ( = ?auto_882508 ?auto_882514 ) ) ( not ( = ?auto_882508 ?auto_882515 ) ) ( not ( = ?auto_882508 ?auto_882516 ) ) ( not ( = ?auto_882508 ?auto_882517 ) ) ( not ( = ?auto_882508 ?auto_882518 ) ) ( not ( = ?auto_882509 ?auto_882510 ) ) ( not ( = ?auto_882509 ?auto_882511 ) ) ( not ( = ?auto_882509 ?auto_882512 ) ) ( not ( = ?auto_882509 ?auto_882513 ) ) ( not ( = ?auto_882509 ?auto_882514 ) ) ( not ( = ?auto_882509 ?auto_882515 ) ) ( not ( = ?auto_882509 ?auto_882516 ) ) ( not ( = ?auto_882509 ?auto_882517 ) ) ( not ( = ?auto_882509 ?auto_882518 ) ) ( not ( = ?auto_882510 ?auto_882511 ) ) ( not ( = ?auto_882510 ?auto_882512 ) ) ( not ( = ?auto_882510 ?auto_882513 ) ) ( not ( = ?auto_882510 ?auto_882514 ) ) ( not ( = ?auto_882510 ?auto_882515 ) ) ( not ( = ?auto_882510 ?auto_882516 ) ) ( not ( = ?auto_882510 ?auto_882517 ) ) ( not ( = ?auto_882510 ?auto_882518 ) ) ( not ( = ?auto_882511 ?auto_882512 ) ) ( not ( = ?auto_882511 ?auto_882513 ) ) ( not ( = ?auto_882511 ?auto_882514 ) ) ( not ( = ?auto_882511 ?auto_882515 ) ) ( not ( = ?auto_882511 ?auto_882516 ) ) ( not ( = ?auto_882511 ?auto_882517 ) ) ( not ( = ?auto_882511 ?auto_882518 ) ) ( not ( = ?auto_882512 ?auto_882513 ) ) ( not ( = ?auto_882512 ?auto_882514 ) ) ( not ( = ?auto_882512 ?auto_882515 ) ) ( not ( = ?auto_882512 ?auto_882516 ) ) ( not ( = ?auto_882512 ?auto_882517 ) ) ( not ( = ?auto_882512 ?auto_882518 ) ) ( not ( = ?auto_882513 ?auto_882514 ) ) ( not ( = ?auto_882513 ?auto_882515 ) ) ( not ( = ?auto_882513 ?auto_882516 ) ) ( not ( = ?auto_882513 ?auto_882517 ) ) ( not ( = ?auto_882513 ?auto_882518 ) ) ( not ( = ?auto_882514 ?auto_882515 ) ) ( not ( = ?auto_882514 ?auto_882516 ) ) ( not ( = ?auto_882514 ?auto_882517 ) ) ( not ( = ?auto_882514 ?auto_882518 ) ) ( not ( = ?auto_882515 ?auto_882516 ) ) ( not ( = ?auto_882515 ?auto_882517 ) ) ( not ( = ?auto_882515 ?auto_882518 ) ) ( not ( = ?auto_882516 ?auto_882517 ) ) ( not ( = ?auto_882516 ?auto_882518 ) ) ( not ( = ?auto_882517 ?auto_882518 ) ) ( ON ?auto_882516 ?auto_882517 ) ( ON ?auto_882515 ?auto_882516 ) ( ON ?auto_882514 ?auto_882515 ) ( ON ?auto_882513 ?auto_882514 ) ( ON ?auto_882512 ?auto_882513 ) ( ON ?auto_882511 ?auto_882512 ) ( ON ?auto_882510 ?auto_882511 ) ( ON ?auto_882509 ?auto_882510 ) ( CLEAR ?auto_882507 ) ( ON ?auto_882508 ?auto_882509 ) ( CLEAR ?auto_882508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_882507 ?auto_882508 )
      ( MAKE-11PILE ?auto_882507 ?auto_882508 ?auto_882509 ?auto_882510 ?auto_882511 ?auto_882512 ?auto_882513 ?auto_882514 ?auto_882515 ?auto_882516 ?auto_882517 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_882553 - BLOCK
      ?auto_882554 - BLOCK
      ?auto_882555 - BLOCK
      ?auto_882556 - BLOCK
      ?auto_882557 - BLOCK
      ?auto_882558 - BLOCK
      ?auto_882559 - BLOCK
      ?auto_882560 - BLOCK
      ?auto_882561 - BLOCK
      ?auto_882562 - BLOCK
      ?auto_882563 - BLOCK
    )
    :vars
    (
      ?auto_882564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882563 ?auto_882564 ) ( not ( = ?auto_882553 ?auto_882554 ) ) ( not ( = ?auto_882553 ?auto_882555 ) ) ( not ( = ?auto_882553 ?auto_882556 ) ) ( not ( = ?auto_882553 ?auto_882557 ) ) ( not ( = ?auto_882553 ?auto_882558 ) ) ( not ( = ?auto_882553 ?auto_882559 ) ) ( not ( = ?auto_882553 ?auto_882560 ) ) ( not ( = ?auto_882553 ?auto_882561 ) ) ( not ( = ?auto_882553 ?auto_882562 ) ) ( not ( = ?auto_882553 ?auto_882563 ) ) ( not ( = ?auto_882553 ?auto_882564 ) ) ( not ( = ?auto_882554 ?auto_882555 ) ) ( not ( = ?auto_882554 ?auto_882556 ) ) ( not ( = ?auto_882554 ?auto_882557 ) ) ( not ( = ?auto_882554 ?auto_882558 ) ) ( not ( = ?auto_882554 ?auto_882559 ) ) ( not ( = ?auto_882554 ?auto_882560 ) ) ( not ( = ?auto_882554 ?auto_882561 ) ) ( not ( = ?auto_882554 ?auto_882562 ) ) ( not ( = ?auto_882554 ?auto_882563 ) ) ( not ( = ?auto_882554 ?auto_882564 ) ) ( not ( = ?auto_882555 ?auto_882556 ) ) ( not ( = ?auto_882555 ?auto_882557 ) ) ( not ( = ?auto_882555 ?auto_882558 ) ) ( not ( = ?auto_882555 ?auto_882559 ) ) ( not ( = ?auto_882555 ?auto_882560 ) ) ( not ( = ?auto_882555 ?auto_882561 ) ) ( not ( = ?auto_882555 ?auto_882562 ) ) ( not ( = ?auto_882555 ?auto_882563 ) ) ( not ( = ?auto_882555 ?auto_882564 ) ) ( not ( = ?auto_882556 ?auto_882557 ) ) ( not ( = ?auto_882556 ?auto_882558 ) ) ( not ( = ?auto_882556 ?auto_882559 ) ) ( not ( = ?auto_882556 ?auto_882560 ) ) ( not ( = ?auto_882556 ?auto_882561 ) ) ( not ( = ?auto_882556 ?auto_882562 ) ) ( not ( = ?auto_882556 ?auto_882563 ) ) ( not ( = ?auto_882556 ?auto_882564 ) ) ( not ( = ?auto_882557 ?auto_882558 ) ) ( not ( = ?auto_882557 ?auto_882559 ) ) ( not ( = ?auto_882557 ?auto_882560 ) ) ( not ( = ?auto_882557 ?auto_882561 ) ) ( not ( = ?auto_882557 ?auto_882562 ) ) ( not ( = ?auto_882557 ?auto_882563 ) ) ( not ( = ?auto_882557 ?auto_882564 ) ) ( not ( = ?auto_882558 ?auto_882559 ) ) ( not ( = ?auto_882558 ?auto_882560 ) ) ( not ( = ?auto_882558 ?auto_882561 ) ) ( not ( = ?auto_882558 ?auto_882562 ) ) ( not ( = ?auto_882558 ?auto_882563 ) ) ( not ( = ?auto_882558 ?auto_882564 ) ) ( not ( = ?auto_882559 ?auto_882560 ) ) ( not ( = ?auto_882559 ?auto_882561 ) ) ( not ( = ?auto_882559 ?auto_882562 ) ) ( not ( = ?auto_882559 ?auto_882563 ) ) ( not ( = ?auto_882559 ?auto_882564 ) ) ( not ( = ?auto_882560 ?auto_882561 ) ) ( not ( = ?auto_882560 ?auto_882562 ) ) ( not ( = ?auto_882560 ?auto_882563 ) ) ( not ( = ?auto_882560 ?auto_882564 ) ) ( not ( = ?auto_882561 ?auto_882562 ) ) ( not ( = ?auto_882561 ?auto_882563 ) ) ( not ( = ?auto_882561 ?auto_882564 ) ) ( not ( = ?auto_882562 ?auto_882563 ) ) ( not ( = ?auto_882562 ?auto_882564 ) ) ( not ( = ?auto_882563 ?auto_882564 ) ) ( ON ?auto_882562 ?auto_882563 ) ( ON ?auto_882561 ?auto_882562 ) ( ON ?auto_882560 ?auto_882561 ) ( ON ?auto_882559 ?auto_882560 ) ( ON ?auto_882558 ?auto_882559 ) ( ON ?auto_882557 ?auto_882558 ) ( ON ?auto_882556 ?auto_882557 ) ( ON ?auto_882555 ?auto_882556 ) ( ON ?auto_882554 ?auto_882555 ) ( ON ?auto_882553 ?auto_882554 ) ( CLEAR ?auto_882553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_882553 )
      ( MAKE-11PILE ?auto_882553 ?auto_882554 ?auto_882555 ?auto_882556 ?auto_882557 ?auto_882558 ?auto_882559 ?auto_882560 ?auto_882561 ?auto_882562 ?auto_882563 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_882600 - BLOCK
      ?auto_882601 - BLOCK
      ?auto_882602 - BLOCK
      ?auto_882603 - BLOCK
      ?auto_882604 - BLOCK
      ?auto_882605 - BLOCK
      ?auto_882606 - BLOCK
      ?auto_882607 - BLOCK
      ?auto_882608 - BLOCK
      ?auto_882609 - BLOCK
      ?auto_882610 - BLOCK
      ?auto_882611 - BLOCK
    )
    :vars
    (
      ?auto_882612 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_882610 ) ( ON ?auto_882611 ?auto_882612 ) ( CLEAR ?auto_882611 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_882600 ) ( ON ?auto_882601 ?auto_882600 ) ( ON ?auto_882602 ?auto_882601 ) ( ON ?auto_882603 ?auto_882602 ) ( ON ?auto_882604 ?auto_882603 ) ( ON ?auto_882605 ?auto_882604 ) ( ON ?auto_882606 ?auto_882605 ) ( ON ?auto_882607 ?auto_882606 ) ( ON ?auto_882608 ?auto_882607 ) ( ON ?auto_882609 ?auto_882608 ) ( ON ?auto_882610 ?auto_882609 ) ( not ( = ?auto_882600 ?auto_882601 ) ) ( not ( = ?auto_882600 ?auto_882602 ) ) ( not ( = ?auto_882600 ?auto_882603 ) ) ( not ( = ?auto_882600 ?auto_882604 ) ) ( not ( = ?auto_882600 ?auto_882605 ) ) ( not ( = ?auto_882600 ?auto_882606 ) ) ( not ( = ?auto_882600 ?auto_882607 ) ) ( not ( = ?auto_882600 ?auto_882608 ) ) ( not ( = ?auto_882600 ?auto_882609 ) ) ( not ( = ?auto_882600 ?auto_882610 ) ) ( not ( = ?auto_882600 ?auto_882611 ) ) ( not ( = ?auto_882600 ?auto_882612 ) ) ( not ( = ?auto_882601 ?auto_882602 ) ) ( not ( = ?auto_882601 ?auto_882603 ) ) ( not ( = ?auto_882601 ?auto_882604 ) ) ( not ( = ?auto_882601 ?auto_882605 ) ) ( not ( = ?auto_882601 ?auto_882606 ) ) ( not ( = ?auto_882601 ?auto_882607 ) ) ( not ( = ?auto_882601 ?auto_882608 ) ) ( not ( = ?auto_882601 ?auto_882609 ) ) ( not ( = ?auto_882601 ?auto_882610 ) ) ( not ( = ?auto_882601 ?auto_882611 ) ) ( not ( = ?auto_882601 ?auto_882612 ) ) ( not ( = ?auto_882602 ?auto_882603 ) ) ( not ( = ?auto_882602 ?auto_882604 ) ) ( not ( = ?auto_882602 ?auto_882605 ) ) ( not ( = ?auto_882602 ?auto_882606 ) ) ( not ( = ?auto_882602 ?auto_882607 ) ) ( not ( = ?auto_882602 ?auto_882608 ) ) ( not ( = ?auto_882602 ?auto_882609 ) ) ( not ( = ?auto_882602 ?auto_882610 ) ) ( not ( = ?auto_882602 ?auto_882611 ) ) ( not ( = ?auto_882602 ?auto_882612 ) ) ( not ( = ?auto_882603 ?auto_882604 ) ) ( not ( = ?auto_882603 ?auto_882605 ) ) ( not ( = ?auto_882603 ?auto_882606 ) ) ( not ( = ?auto_882603 ?auto_882607 ) ) ( not ( = ?auto_882603 ?auto_882608 ) ) ( not ( = ?auto_882603 ?auto_882609 ) ) ( not ( = ?auto_882603 ?auto_882610 ) ) ( not ( = ?auto_882603 ?auto_882611 ) ) ( not ( = ?auto_882603 ?auto_882612 ) ) ( not ( = ?auto_882604 ?auto_882605 ) ) ( not ( = ?auto_882604 ?auto_882606 ) ) ( not ( = ?auto_882604 ?auto_882607 ) ) ( not ( = ?auto_882604 ?auto_882608 ) ) ( not ( = ?auto_882604 ?auto_882609 ) ) ( not ( = ?auto_882604 ?auto_882610 ) ) ( not ( = ?auto_882604 ?auto_882611 ) ) ( not ( = ?auto_882604 ?auto_882612 ) ) ( not ( = ?auto_882605 ?auto_882606 ) ) ( not ( = ?auto_882605 ?auto_882607 ) ) ( not ( = ?auto_882605 ?auto_882608 ) ) ( not ( = ?auto_882605 ?auto_882609 ) ) ( not ( = ?auto_882605 ?auto_882610 ) ) ( not ( = ?auto_882605 ?auto_882611 ) ) ( not ( = ?auto_882605 ?auto_882612 ) ) ( not ( = ?auto_882606 ?auto_882607 ) ) ( not ( = ?auto_882606 ?auto_882608 ) ) ( not ( = ?auto_882606 ?auto_882609 ) ) ( not ( = ?auto_882606 ?auto_882610 ) ) ( not ( = ?auto_882606 ?auto_882611 ) ) ( not ( = ?auto_882606 ?auto_882612 ) ) ( not ( = ?auto_882607 ?auto_882608 ) ) ( not ( = ?auto_882607 ?auto_882609 ) ) ( not ( = ?auto_882607 ?auto_882610 ) ) ( not ( = ?auto_882607 ?auto_882611 ) ) ( not ( = ?auto_882607 ?auto_882612 ) ) ( not ( = ?auto_882608 ?auto_882609 ) ) ( not ( = ?auto_882608 ?auto_882610 ) ) ( not ( = ?auto_882608 ?auto_882611 ) ) ( not ( = ?auto_882608 ?auto_882612 ) ) ( not ( = ?auto_882609 ?auto_882610 ) ) ( not ( = ?auto_882609 ?auto_882611 ) ) ( not ( = ?auto_882609 ?auto_882612 ) ) ( not ( = ?auto_882610 ?auto_882611 ) ) ( not ( = ?auto_882610 ?auto_882612 ) ) ( not ( = ?auto_882611 ?auto_882612 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_882611 ?auto_882612 )
      ( !STACK ?auto_882611 ?auto_882610 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_882650 - BLOCK
      ?auto_882651 - BLOCK
      ?auto_882652 - BLOCK
      ?auto_882653 - BLOCK
      ?auto_882654 - BLOCK
      ?auto_882655 - BLOCK
      ?auto_882656 - BLOCK
      ?auto_882657 - BLOCK
      ?auto_882658 - BLOCK
      ?auto_882659 - BLOCK
      ?auto_882660 - BLOCK
      ?auto_882661 - BLOCK
    )
    :vars
    (
      ?auto_882662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882661 ?auto_882662 ) ( ON-TABLE ?auto_882650 ) ( ON ?auto_882651 ?auto_882650 ) ( ON ?auto_882652 ?auto_882651 ) ( ON ?auto_882653 ?auto_882652 ) ( ON ?auto_882654 ?auto_882653 ) ( ON ?auto_882655 ?auto_882654 ) ( ON ?auto_882656 ?auto_882655 ) ( ON ?auto_882657 ?auto_882656 ) ( ON ?auto_882658 ?auto_882657 ) ( ON ?auto_882659 ?auto_882658 ) ( not ( = ?auto_882650 ?auto_882651 ) ) ( not ( = ?auto_882650 ?auto_882652 ) ) ( not ( = ?auto_882650 ?auto_882653 ) ) ( not ( = ?auto_882650 ?auto_882654 ) ) ( not ( = ?auto_882650 ?auto_882655 ) ) ( not ( = ?auto_882650 ?auto_882656 ) ) ( not ( = ?auto_882650 ?auto_882657 ) ) ( not ( = ?auto_882650 ?auto_882658 ) ) ( not ( = ?auto_882650 ?auto_882659 ) ) ( not ( = ?auto_882650 ?auto_882660 ) ) ( not ( = ?auto_882650 ?auto_882661 ) ) ( not ( = ?auto_882650 ?auto_882662 ) ) ( not ( = ?auto_882651 ?auto_882652 ) ) ( not ( = ?auto_882651 ?auto_882653 ) ) ( not ( = ?auto_882651 ?auto_882654 ) ) ( not ( = ?auto_882651 ?auto_882655 ) ) ( not ( = ?auto_882651 ?auto_882656 ) ) ( not ( = ?auto_882651 ?auto_882657 ) ) ( not ( = ?auto_882651 ?auto_882658 ) ) ( not ( = ?auto_882651 ?auto_882659 ) ) ( not ( = ?auto_882651 ?auto_882660 ) ) ( not ( = ?auto_882651 ?auto_882661 ) ) ( not ( = ?auto_882651 ?auto_882662 ) ) ( not ( = ?auto_882652 ?auto_882653 ) ) ( not ( = ?auto_882652 ?auto_882654 ) ) ( not ( = ?auto_882652 ?auto_882655 ) ) ( not ( = ?auto_882652 ?auto_882656 ) ) ( not ( = ?auto_882652 ?auto_882657 ) ) ( not ( = ?auto_882652 ?auto_882658 ) ) ( not ( = ?auto_882652 ?auto_882659 ) ) ( not ( = ?auto_882652 ?auto_882660 ) ) ( not ( = ?auto_882652 ?auto_882661 ) ) ( not ( = ?auto_882652 ?auto_882662 ) ) ( not ( = ?auto_882653 ?auto_882654 ) ) ( not ( = ?auto_882653 ?auto_882655 ) ) ( not ( = ?auto_882653 ?auto_882656 ) ) ( not ( = ?auto_882653 ?auto_882657 ) ) ( not ( = ?auto_882653 ?auto_882658 ) ) ( not ( = ?auto_882653 ?auto_882659 ) ) ( not ( = ?auto_882653 ?auto_882660 ) ) ( not ( = ?auto_882653 ?auto_882661 ) ) ( not ( = ?auto_882653 ?auto_882662 ) ) ( not ( = ?auto_882654 ?auto_882655 ) ) ( not ( = ?auto_882654 ?auto_882656 ) ) ( not ( = ?auto_882654 ?auto_882657 ) ) ( not ( = ?auto_882654 ?auto_882658 ) ) ( not ( = ?auto_882654 ?auto_882659 ) ) ( not ( = ?auto_882654 ?auto_882660 ) ) ( not ( = ?auto_882654 ?auto_882661 ) ) ( not ( = ?auto_882654 ?auto_882662 ) ) ( not ( = ?auto_882655 ?auto_882656 ) ) ( not ( = ?auto_882655 ?auto_882657 ) ) ( not ( = ?auto_882655 ?auto_882658 ) ) ( not ( = ?auto_882655 ?auto_882659 ) ) ( not ( = ?auto_882655 ?auto_882660 ) ) ( not ( = ?auto_882655 ?auto_882661 ) ) ( not ( = ?auto_882655 ?auto_882662 ) ) ( not ( = ?auto_882656 ?auto_882657 ) ) ( not ( = ?auto_882656 ?auto_882658 ) ) ( not ( = ?auto_882656 ?auto_882659 ) ) ( not ( = ?auto_882656 ?auto_882660 ) ) ( not ( = ?auto_882656 ?auto_882661 ) ) ( not ( = ?auto_882656 ?auto_882662 ) ) ( not ( = ?auto_882657 ?auto_882658 ) ) ( not ( = ?auto_882657 ?auto_882659 ) ) ( not ( = ?auto_882657 ?auto_882660 ) ) ( not ( = ?auto_882657 ?auto_882661 ) ) ( not ( = ?auto_882657 ?auto_882662 ) ) ( not ( = ?auto_882658 ?auto_882659 ) ) ( not ( = ?auto_882658 ?auto_882660 ) ) ( not ( = ?auto_882658 ?auto_882661 ) ) ( not ( = ?auto_882658 ?auto_882662 ) ) ( not ( = ?auto_882659 ?auto_882660 ) ) ( not ( = ?auto_882659 ?auto_882661 ) ) ( not ( = ?auto_882659 ?auto_882662 ) ) ( not ( = ?auto_882660 ?auto_882661 ) ) ( not ( = ?auto_882660 ?auto_882662 ) ) ( not ( = ?auto_882661 ?auto_882662 ) ) ( CLEAR ?auto_882659 ) ( ON ?auto_882660 ?auto_882661 ) ( CLEAR ?auto_882660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_882650 ?auto_882651 ?auto_882652 ?auto_882653 ?auto_882654 ?auto_882655 ?auto_882656 ?auto_882657 ?auto_882658 ?auto_882659 ?auto_882660 )
      ( MAKE-12PILE ?auto_882650 ?auto_882651 ?auto_882652 ?auto_882653 ?auto_882654 ?auto_882655 ?auto_882656 ?auto_882657 ?auto_882658 ?auto_882659 ?auto_882660 ?auto_882661 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_882700 - BLOCK
      ?auto_882701 - BLOCK
      ?auto_882702 - BLOCK
      ?auto_882703 - BLOCK
      ?auto_882704 - BLOCK
      ?auto_882705 - BLOCK
      ?auto_882706 - BLOCK
      ?auto_882707 - BLOCK
      ?auto_882708 - BLOCK
      ?auto_882709 - BLOCK
      ?auto_882710 - BLOCK
      ?auto_882711 - BLOCK
    )
    :vars
    (
      ?auto_882712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882711 ?auto_882712 ) ( ON-TABLE ?auto_882700 ) ( ON ?auto_882701 ?auto_882700 ) ( ON ?auto_882702 ?auto_882701 ) ( ON ?auto_882703 ?auto_882702 ) ( ON ?auto_882704 ?auto_882703 ) ( ON ?auto_882705 ?auto_882704 ) ( ON ?auto_882706 ?auto_882705 ) ( ON ?auto_882707 ?auto_882706 ) ( ON ?auto_882708 ?auto_882707 ) ( not ( = ?auto_882700 ?auto_882701 ) ) ( not ( = ?auto_882700 ?auto_882702 ) ) ( not ( = ?auto_882700 ?auto_882703 ) ) ( not ( = ?auto_882700 ?auto_882704 ) ) ( not ( = ?auto_882700 ?auto_882705 ) ) ( not ( = ?auto_882700 ?auto_882706 ) ) ( not ( = ?auto_882700 ?auto_882707 ) ) ( not ( = ?auto_882700 ?auto_882708 ) ) ( not ( = ?auto_882700 ?auto_882709 ) ) ( not ( = ?auto_882700 ?auto_882710 ) ) ( not ( = ?auto_882700 ?auto_882711 ) ) ( not ( = ?auto_882700 ?auto_882712 ) ) ( not ( = ?auto_882701 ?auto_882702 ) ) ( not ( = ?auto_882701 ?auto_882703 ) ) ( not ( = ?auto_882701 ?auto_882704 ) ) ( not ( = ?auto_882701 ?auto_882705 ) ) ( not ( = ?auto_882701 ?auto_882706 ) ) ( not ( = ?auto_882701 ?auto_882707 ) ) ( not ( = ?auto_882701 ?auto_882708 ) ) ( not ( = ?auto_882701 ?auto_882709 ) ) ( not ( = ?auto_882701 ?auto_882710 ) ) ( not ( = ?auto_882701 ?auto_882711 ) ) ( not ( = ?auto_882701 ?auto_882712 ) ) ( not ( = ?auto_882702 ?auto_882703 ) ) ( not ( = ?auto_882702 ?auto_882704 ) ) ( not ( = ?auto_882702 ?auto_882705 ) ) ( not ( = ?auto_882702 ?auto_882706 ) ) ( not ( = ?auto_882702 ?auto_882707 ) ) ( not ( = ?auto_882702 ?auto_882708 ) ) ( not ( = ?auto_882702 ?auto_882709 ) ) ( not ( = ?auto_882702 ?auto_882710 ) ) ( not ( = ?auto_882702 ?auto_882711 ) ) ( not ( = ?auto_882702 ?auto_882712 ) ) ( not ( = ?auto_882703 ?auto_882704 ) ) ( not ( = ?auto_882703 ?auto_882705 ) ) ( not ( = ?auto_882703 ?auto_882706 ) ) ( not ( = ?auto_882703 ?auto_882707 ) ) ( not ( = ?auto_882703 ?auto_882708 ) ) ( not ( = ?auto_882703 ?auto_882709 ) ) ( not ( = ?auto_882703 ?auto_882710 ) ) ( not ( = ?auto_882703 ?auto_882711 ) ) ( not ( = ?auto_882703 ?auto_882712 ) ) ( not ( = ?auto_882704 ?auto_882705 ) ) ( not ( = ?auto_882704 ?auto_882706 ) ) ( not ( = ?auto_882704 ?auto_882707 ) ) ( not ( = ?auto_882704 ?auto_882708 ) ) ( not ( = ?auto_882704 ?auto_882709 ) ) ( not ( = ?auto_882704 ?auto_882710 ) ) ( not ( = ?auto_882704 ?auto_882711 ) ) ( not ( = ?auto_882704 ?auto_882712 ) ) ( not ( = ?auto_882705 ?auto_882706 ) ) ( not ( = ?auto_882705 ?auto_882707 ) ) ( not ( = ?auto_882705 ?auto_882708 ) ) ( not ( = ?auto_882705 ?auto_882709 ) ) ( not ( = ?auto_882705 ?auto_882710 ) ) ( not ( = ?auto_882705 ?auto_882711 ) ) ( not ( = ?auto_882705 ?auto_882712 ) ) ( not ( = ?auto_882706 ?auto_882707 ) ) ( not ( = ?auto_882706 ?auto_882708 ) ) ( not ( = ?auto_882706 ?auto_882709 ) ) ( not ( = ?auto_882706 ?auto_882710 ) ) ( not ( = ?auto_882706 ?auto_882711 ) ) ( not ( = ?auto_882706 ?auto_882712 ) ) ( not ( = ?auto_882707 ?auto_882708 ) ) ( not ( = ?auto_882707 ?auto_882709 ) ) ( not ( = ?auto_882707 ?auto_882710 ) ) ( not ( = ?auto_882707 ?auto_882711 ) ) ( not ( = ?auto_882707 ?auto_882712 ) ) ( not ( = ?auto_882708 ?auto_882709 ) ) ( not ( = ?auto_882708 ?auto_882710 ) ) ( not ( = ?auto_882708 ?auto_882711 ) ) ( not ( = ?auto_882708 ?auto_882712 ) ) ( not ( = ?auto_882709 ?auto_882710 ) ) ( not ( = ?auto_882709 ?auto_882711 ) ) ( not ( = ?auto_882709 ?auto_882712 ) ) ( not ( = ?auto_882710 ?auto_882711 ) ) ( not ( = ?auto_882710 ?auto_882712 ) ) ( not ( = ?auto_882711 ?auto_882712 ) ) ( ON ?auto_882710 ?auto_882711 ) ( CLEAR ?auto_882708 ) ( ON ?auto_882709 ?auto_882710 ) ( CLEAR ?auto_882709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_882700 ?auto_882701 ?auto_882702 ?auto_882703 ?auto_882704 ?auto_882705 ?auto_882706 ?auto_882707 ?auto_882708 ?auto_882709 )
      ( MAKE-12PILE ?auto_882700 ?auto_882701 ?auto_882702 ?auto_882703 ?auto_882704 ?auto_882705 ?auto_882706 ?auto_882707 ?auto_882708 ?auto_882709 ?auto_882710 ?auto_882711 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_882750 - BLOCK
      ?auto_882751 - BLOCK
      ?auto_882752 - BLOCK
      ?auto_882753 - BLOCK
      ?auto_882754 - BLOCK
      ?auto_882755 - BLOCK
      ?auto_882756 - BLOCK
      ?auto_882757 - BLOCK
      ?auto_882758 - BLOCK
      ?auto_882759 - BLOCK
      ?auto_882760 - BLOCK
      ?auto_882761 - BLOCK
    )
    :vars
    (
      ?auto_882762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882761 ?auto_882762 ) ( ON-TABLE ?auto_882750 ) ( ON ?auto_882751 ?auto_882750 ) ( ON ?auto_882752 ?auto_882751 ) ( ON ?auto_882753 ?auto_882752 ) ( ON ?auto_882754 ?auto_882753 ) ( ON ?auto_882755 ?auto_882754 ) ( ON ?auto_882756 ?auto_882755 ) ( ON ?auto_882757 ?auto_882756 ) ( not ( = ?auto_882750 ?auto_882751 ) ) ( not ( = ?auto_882750 ?auto_882752 ) ) ( not ( = ?auto_882750 ?auto_882753 ) ) ( not ( = ?auto_882750 ?auto_882754 ) ) ( not ( = ?auto_882750 ?auto_882755 ) ) ( not ( = ?auto_882750 ?auto_882756 ) ) ( not ( = ?auto_882750 ?auto_882757 ) ) ( not ( = ?auto_882750 ?auto_882758 ) ) ( not ( = ?auto_882750 ?auto_882759 ) ) ( not ( = ?auto_882750 ?auto_882760 ) ) ( not ( = ?auto_882750 ?auto_882761 ) ) ( not ( = ?auto_882750 ?auto_882762 ) ) ( not ( = ?auto_882751 ?auto_882752 ) ) ( not ( = ?auto_882751 ?auto_882753 ) ) ( not ( = ?auto_882751 ?auto_882754 ) ) ( not ( = ?auto_882751 ?auto_882755 ) ) ( not ( = ?auto_882751 ?auto_882756 ) ) ( not ( = ?auto_882751 ?auto_882757 ) ) ( not ( = ?auto_882751 ?auto_882758 ) ) ( not ( = ?auto_882751 ?auto_882759 ) ) ( not ( = ?auto_882751 ?auto_882760 ) ) ( not ( = ?auto_882751 ?auto_882761 ) ) ( not ( = ?auto_882751 ?auto_882762 ) ) ( not ( = ?auto_882752 ?auto_882753 ) ) ( not ( = ?auto_882752 ?auto_882754 ) ) ( not ( = ?auto_882752 ?auto_882755 ) ) ( not ( = ?auto_882752 ?auto_882756 ) ) ( not ( = ?auto_882752 ?auto_882757 ) ) ( not ( = ?auto_882752 ?auto_882758 ) ) ( not ( = ?auto_882752 ?auto_882759 ) ) ( not ( = ?auto_882752 ?auto_882760 ) ) ( not ( = ?auto_882752 ?auto_882761 ) ) ( not ( = ?auto_882752 ?auto_882762 ) ) ( not ( = ?auto_882753 ?auto_882754 ) ) ( not ( = ?auto_882753 ?auto_882755 ) ) ( not ( = ?auto_882753 ?auto_882756 ) ) ( not ( = ?auto_882753 ?auto_882757 ) ) ( not ( = ?auto_882753 ?auto_882758 ) ) ( not ( = ?auto_882753 ?auto_882759 ) ) ( not ( = ?auto_882753 ?auto_882760 ) ) ( not ( = ?auto_882753 ?auto_882761 ) ) ( not ( = ?auto_882753 ?auto_882762 ) ) ( not ( = ?auto_882754 ?auto_882755 ) ) ( not ( = ?auto_882754 ?auto_882756 ) ) ( not ( = ?auto_882754 ?auto_882757 ) ) ( not ( = ?auto_882754 ?auto_882758 ) ) ( not ( = ?auto_882754 ?auto_882759 ) ) ( not ( = ?auto_882754 ?auto_882760 ) ) ( not ( = ?auto_882754 ?auto_882761 ) ) ( not ( = ?auto_882754 ?auto_882762 ) ) ( not ( = ?auto_882755 ?auto_882756 ) ) ( not ( = ?auto_882755 ?auto_882757 ) ) ( not ( = ?auto_882755 ?auto_882758 ) ) ( not ( = ?auto_882755 ?auto_882759 ) ) ( not ( = ?auto_882755 ?auto_882760 ) ) ( not ( = ?auto_882755 ?auto_882761 ) ) ( not ( = ?auto_882755 ?auto_882762 ) ) ( not ( = ?auto_882756 ?auto_882757 ) ) ( not ( = ?auto_882756 ?auto_882758 ) ) ( not ( = ?auto_882756 ?auto_882759 ) ) ( not ( = ?auto_882756 ?auto_882760 ) ) ( not ( = ?auto_882756 ?auto_882761 ) ) ( not ( = ?auto_882756 ?auto_882762 ) ) ( not ( = ?auto_882757 ?auto_882758 ) ) ( not ( = ?auto_882757 ?auto_882759 ) ) ( not ( = ?auto_882757 ?auto_882760 ) ) ( not ( = ?auto_882757 ?auto_882761 ) ) ( not ( = ?auto_882757 ?auto_882762 ) ) ( not ( = ?auto_882758 ?auto_882759 ) ) ( not ( = ?auto_882758 ?auto_882760 ) ) ( not ( = ?auto_882758 ?auto_882761 ) ) ( not ( = ?auto_882758 ?auto_882762 ) ) ( not ( = ?auto_882759 ?auto_882760 ) ) ( not ( = ?auto_882759 ?auto_882761 ) ) ( not ( = ?auto_882759 ?auto_882762 ) ) ( not ( = ?auto_882760 ?auto_882761 ) ) ( not ( = ?auto_882760 ?auto_882762 ) ) ( not ( = ?auto_882761 ?auto_882762 ) ) ( ON ?auto_882760 ?auto_882761 ) ( ON ?auto_882759 ?auto_882760 ) ( CLEAR ?auto_882757 ) ( ON ?auto_882758 ?auto_882759 ) ( CLEAR ?auto_882758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_882750 ?auto_882751 ?auto_882752 ?auto_882753 ?auto_882754 ?auto_882755 ?auto_882756 ?auto_882757 ?auto_882758 )
      ( MAKE-12PILE ?auto_882750 ?auto_882751 ?auto_882752 ?auto_882753 ?auto_882754 ?auto_882755 ?auto_882756 ?auto_882757 ?auto_882758 ?auto_882759 ?auto_882760 ?auto_882761 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_882800 - BLOCK
      ?auto_882801 - BLOCK
      ?auto_882802 - BLOCK
      ?auto_882803 - BLOCK
      ?auto_882804 - BLOCK
      ?auto_882805 - BLOCK
      ?auto_882806 - BLOCK
      ?auto_882807 - BLOCK
      ?auto_882808 - BLOCK
      ?auto_882809 - BLOCK
      ?auto_882810 - BLOCK
      ?auto_882811 - BLOCK
    )
    :vars
    (
      ?auto_882812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882811 ?auto_882812 ) ( ON-TABLE ?auto_882800 ) ( ON ?auto_882801 ?auto_882800 ) ( ON ?auto_882802 ?auto_882801 ) ( ON ?auto_882803 ?auto_882802 ) ( ON ?auto_882804 ?auto_882803 ) ( ON ?auto_882805 ?auto_882804 ) ( ON ?auto_882806 ?auto_882805 ) ( not ( = ?auto_882800 ?auto_882801 ) ) ( not ( = ?auto_882800 ?auto_882802 ) ) ( not ( = ?auto_882800 ?auto_882803 ) ) ( not ( = ?auto_882800 ?auto_882804 ) ) ( not ( = ?auto_882800 ?auto_882805 ) ) ( not ( = ?auto_882800 ?auto_882806 ) ) ( not ( = ?auto_882800 ?auto_882807 ) ) ( not ( = ?auto_882800 ?auto_882808 ) ) ( not ( = ?auto_882800 ?auto_882809 ) ) ( not ( = ?auto_882800 ?auto_882810 ) ) ( not ( = ?auto_882800 ?auto_882811 ) ) ( not ( = ?auto_882800 ?auto_882812 ) ) ( not ( = ?auto_882801 ?auto_882802 ) ) ( not ( = ?auto_882801 ?auto_882803 ) ) ( not ( = ?auto_882801 ?auto_882804 ) ) ( not ( = ?auto_882801 ?auto_882805 ) ) ( not ( = ?auto_882801 ?auto_882806 ) ) ( not ( = ?auto_882801 ?auto_882807 ) ) ( not ( = ?auto_882801 ?auto_882808 ) ) ( not ( = ?auto_882801 ?auto_882809 ) ) ( not ( = ?auto_882801 ?auto_882810 ) ) ( not ( = ?auto_882801 ?auto_882811 ) ) ( not ( = ?auto_882801 ?auto_882812 ) ) ( not ( = ?auto_882802 ?auto_882803 ) ) ( not ( = ?auto_882802 ?auto_882804 ) ) ( not ( = ?auto_882802 ?auto_882805 ) ) ( not ( = ?auto_882802 ?auto_882806 ) ) ( not ( = ?auto_882802 ?auto_882807 ) ) ( not ( = ?auto_882802 ?auto_882808 ) ) ( not ( = ?auto_882802 ?auto_882809 ) ) ( not ( = ?auto_882802 ?auto_882810 ) ) ( not ( = ?auto_882802 ?auto_882811 ) ) ( not ( = ?auto_882802 ?auto_882812 ) ) ( not ( = ?auto_882803 ?auto_882804 ) ) ( not ( = ?auto_882803 ?auto_882805 ) ) ( not ( = ?auto_882803 ?auto_882806 ) ) ( not ( = ?auto_882803 ?auto_882807 ) ) ( not ( = ?auto_882803 ?auto_882808 ) ) ( not ( = ?auto_882803 ?auto_882809 ) ) ( not ( = ?auto_882803 ?auto_882810 ) ) ( not ( = ?auto_882803 ?auto_882811 ) ) ( not ( = ?auto_882803 ?auto_882812 ) ) ( not ( = ?auto_882804 ?auto_882805 ) ) ( not ( = ?auto_882804 ?auto_882806 ) ) ( not ( = ?auto_882804 ?auto_882807 ) ) ( not ( = ?auto_882804 ?auto_882808 ) ) ( not ( = ?auto_882804 ?auto_882809 ) ) ( not ( = ?auto_882804 ?auto_882810 ) ) ( not ( = ?auto_882804 ?auto_882811 ) ) ( not ( = ?auto_882804 ?auto_882812 ) ) ( not ( = ?auto_882805 ?auto_882806 ) ) ( not ( = ?auto_882805 ?auto_882807 ) ) ( not ( = ?auto_882805 ?auto_882808 ) ) ( not ( = ?auto_882805 ?auto_882809 ) ) ( not ( = ?auto_882805 ?auto_882810 ) ) ( not ( = ?auto_882805 ?auto_882811 ) ) ( not ( = ?auto_882805 ?auto_882812 ) ) ( not ( = ?auto_882806 ?auto_882807 ) ) ( not ( = ?auto_882806 ?auto_882808 ) ) ( not ( = ?auto_882806 ?auto_882809 ) ) ( not ( = ?auto_882806 ?auto_882810 ) ) ( not ( = ?auto_882806 ?auto_882811 ) ) ( not ( = ?auto_882806 ?auto_882812 ) ) ( not ( = ?auto_882807 ?auto_882808 ) ) ( not ( = ?auto_882807 ?auto_882809 ) ) ( not ( = ?auto_882807 ?auto_882810 ) ) ( not ( = ?auto_882807 ?auto_882811 ) ) ( not ( = ?auto_882807 ?auto_882812 ) ) ( not ( = ?auto_882808 ?auto_882809 ) ) ( not ( = ?auto_882808 ?auto_882810 ) ) ( not ( = ?auto_882808 ?auto_882811 ) ) ( not ( = ?auto_882808 ?auto_882812 ) ) ( not ( = ?auto_882809 ?auto_882810 ) ) ( not ( = ?auto_882809 ?auto_882811 ) ) ( not ( = ?auto_882809 ?auto_882812 ) ) ( not ( = ?auto_882810 ?auto_882811 ) ) ( not ( = ?auto_882810 ?auto_882812 ) ) ( not ( = ?auto_882811 ?auto_882812 ) ) ( ON ?auto_882810 ?auto_882811 ) ( ON ?auto_882809 ?auto_882810 ) ( ON ?auto_882808 ?auto_882809 ) ( CLEAR ?auto_882806 ) ( ON ?auto_882807 ?auto_882808 ) ( CLEAR ?auto_882807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_882800 ?auto_882801 ?auto_882802 ?auto_882803 ?auto_882804 ?auto_882805 ?auto_882806 ?auto_882807 )
      ( MAKE-12PILE ?auto_882800 ?auto_882801 ?auto_882802 ?auto_882803 ?auto_882804 ?auto_882805 ?auto_882806 ?auto_882807 ?auto_882808 ?auto_882809 ?auto_882810 ?auto_882811 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_882850 - BLOCK
      ?auto_882851 - BLOCK
      ?auto_882852 - BLOCK
      ?auto_882853 - BLOCK
      ?auto_882854 - BLOCK
      ?auto_882855 - BLOCK
      ?auto_882856 - BLOCK
      ?auto_882857 - BLOCK
      ?auto_882858 - BLOCK
      ?auto_882859 - BLOCK
      ?auto_882860 - BLOCK
      ?auto_882861 - BLOCK
    )
    :vars
    (
      ?auto_882862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882861 ?auto_882862 ) ( ON-TABLE ?auto_882850 ) ( ON ?auto_882851 ?auto_882850 ) ( ON ?auto_882852 ?auto_882851 ) ( ON ?auto_882853 ?auto_882852 ) ( ON ?auto_882854 ?auto_882853 ) ( ON ?auto_882855 ?auto_882854 ) ( not ( = ?auto_882850 ?auto_882851 ) ) ( not ( = ?auto_882850 ?auto_882852 ) ) ( not ( = ?auto_882850 ?auto_882853 ) ) ( not ( = ?auto_882850 ?auto_882854 ) ) ( not ( = ?auto_882850 ?auto_882855 ) ) ( not ( = ?auto_882850 ?auto_882856 ) ) ( not ( = ?auto_882850 ?auto_882857 ) ) ( not ( = ?auto_882850 ?auto_882858 ) ) ( not ( = ?auto_882850 ?auto_882859 ) ) ( not ( = ?auto_882850 ?auto_882860 ) ) ( not ( = ?auto_882850 ?auto_882861 ) ) ( not ( = ?auto_882850 ?auto_882862 ) ) ( not ( = ?auto_882851 ?auto_882852 ) ) ( not ( = ?auto_882851 ?auto_882853 ) ) ( not ( = ?auto_882851 ?auto_882854 ) ) ( not ( = ?auto_882851 ?auto_882855 ) ) ( not ( = ?auto_882851 ?auto_882856 ) ) ( not ( = ?auto_882851 ?auto_882857 ) ) ( not ( = ?auto_882851 ?auto_882858 ) ) ( not ( = ?auto_882851 ?auto_882859 ) ) ( not ( = ?auto_882851 ?auto_882860 ) ) ( not ( = ?auto_882851 ?auto_882861 ) ) ( not ( = ?auto_882851 ?auto_882862 ) ) ( not ( = ?auto_882852 ?auto_882853 ) ) ( not ( = ?auto_882852 ?auto_882854 ) ) ( not ( = ?auto_882852 ?auto_882855 ) ) ( not ( = ?auto_882852 ?auto_882856 ) ) ( not ( = ?auto_882852 ?auto_882857 ) ) ( not ( = ?auto_882852 ?auto_882858 ) ) ( not ( = ?auto_882852 ?auto_882859 ) ) ( not ( = ?auto_882852 ?auto_882860 ) ) ( not ( = ?auto_882852 ?auto_882861 ) ) ( not ( = ?auto_882852 ?auto_882862 ) ) ( not ( = ?auto_882853 ?auto_882854 ) ) ( not ( = ?auto_882853 ?auto_882855 ) ) ( not ( = ?auto_882853 ?auto_882856 ) ) ( not ( = ?auto_882853 ?auto_882857 ) ) ( not ( = ?auto_882853 ?auto_882858 ) ) ( not ( = ?auto_882853 ?auto_882859 ) ) ( not ( = ?auto_882853 ?auto_882860 ) ) ( not ( = ?auto_882853 ?auto_882861 ) ) ( not ( = ?auto_882853 ?auto_882862 ) ) ( not ( = ?auto_882854 ?auto_882855 ) ) ( not ( = ?auto_882854 ?auto_882856 ) ) ( not ( = ?auto_882854 ?auto_882857 ) ) ( not ( = ?auto_882854 ?auto_882858 ) ) ( not ( = ?auto_882854 ?auto_882859 ) ) ( not ( = ?auto_882854 ?auto_882860 ) ) ( not ( = ?auto_882854 ?auto_882861 ) ) ( not ( = ?auto_882854 ?auto_882862 ) ) ( not ( = ?auto_882855 ?auto_882856 ) ) ( not ( = ?auto_882855 ?auto_882857 ) ) ( not ( = ?auto_882855 ?auto_882858 ) ) ( not ( = ?auto_882855 ?auto_882859 ) ) ( not ( = ?auto_882855 ?auto_882860 ) ) ( not ( = ?auto_882855 ?auto_882861 ) ) ( not ( = ?auto_882855 ?auto_882862 ) ) ( not ( = ?auto_882856 ?auto_882857 ) ) ( not ( = ?auto_882856 ?auto_882858 ) ) ( not ( = ?auto_882856 ?auto_882859 ) ) ( not ( = ?auto_882856 ?auto_882860 ) ) ( not ( = ?auto_882856 ?auto_882861 ) ) ( not ( = ?auto_882856 ?auto_882862 ) ) ( not ( = ?auto_882857 ?auto_882858 ) ) ( not ( = ?auto_882857 ?auto_882859 ) ) ( not ( = ?auto_882857 ?auto_882860 ) ) ( not ( = ?auto_882857 ?auto_882861 ) ) ( not ( = ?auto_882857 ?auto_882862 ) ) ( not ( = ?auto_882858 ?auto_882859 ) ) ( not ( = ?auto_882858 ?auto_882860 ) ) ( not ( = ?auto_882858 ?auto_882861 ) ) ( not ( = ?auto_882858 ?auto_882862 ) ) ( not ( = ?auto_882859 ?auto_882860 ) ) ( not ( = ?auto_882859 ?auto_882861 ) ) ( not ( = ?auto_882859 ?auto_882862 ) ) ( not ( = ?auto_882860 ?auto_882861 ) ) ( not ( = ?auto_882860 ?auto_882862 ) ) ( not ( = ?auto_882861 ?auto_882862 ) ) ( ON ?auto_882860 ?auto_882861 ) ( ON ?auto_882859 ?auto_882860 ) ( ON ?auto_882858 ?auto_882859 ) ( ON ?auto_882857 ?auto_882858 ) ( CLEAR ?auto_882855 ) ( ON ?auto_882856 ?auto_882857 ) ( CLEAR ?auto_882856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_882850 ?auto_882851 ?auto_882852 ?auto_882853 ?auto_882854 ?auto_882855 ?auto_882856 )
      ( MAKE-12PILE ?auto_882850 ?auto_882851 ?auto_882852 ?auto_882853 ?auto_882854 ?auto_882855 ?auto_882856 ?auto_882857 ?auto_882858 ?auto_882859 ?auto_882860 ?auto_882861 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_882900 - BLOCK
      ?auto_882901 - BLOCK
      ?auto_882902 - BLOCK
      ?auto_882903 - BLOCK
      ?auto_882904 - BLOCK
      ?auto_882905 - BLOCK
      ?auto_882906 - BLOCK
      ?auto_882907 - BLOCK
      ?auto_882908 - BLOCK
      ?auto_882909 - BLOCK
      ?auto_882910 - BLOCK
      ?auto_882911 - BLOCK
    )
    :vars
    (
      ?auto_882912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882911 ?auto_882912 ) ( ON-TABLE ?auto_882900 ) ( ON ?auto_882901 ?auto_882900 ) ( ON ?auto_882902 ?auto_882901 ) ( ON ?auto_882903 ?auto_882902 ) ( ON ?auto_882904 ?auto_882903 ) ( not ( = ?auto_882900 ?auto_882901 ) ) ( not ( = ?auto_882900 ?auto_882902 ) ) ( not ( = ?auto_882900 ?auto_882903 ) ) ( not ( = ?auto_882900 ?auto_882904 ) ) ( not ( = ?auto_882900 ?auto_882905 ) ) ( not ( = ?auto_882900 ?auto_882906 ) ) ( not ( = ?auto_882900 ?auto_882907 ) ) ( not ( = ?auto_882900 ?auto_882908 ) ) ( not ( = ?auto_882900 ?auto_882909 ) ) ( not ( = ?auto_882900 ?auto_882910 ) ) ( not ( = ?auto_882900 ?auto_882911 ) ) ( not ( = ?auto_882900 ?auto_882912 ) ) ( not ( = ?auto_882901 ?auto_882902 ) ) ( not ( = ?auto_882901 ?auto_882903 ) ) ( not ( = ?auto_882901 ?auto_882904 ) ) ( not ( = ?auto_882901 ?auto_882905 ) ) ( not ( = ?auto_882901 ?auto_882906 ) ) ( not ( = ?auto_882901 ?auto_882907 ) ) ( not ( = ?auto_882901 ?auto_882908 ) ) ( not ( = ?auto_882901 ?auto_882909 ) ) ( not ( = ?auto_882901 ?auto_882910 ) ) ( not ( = ?auto_882901 ?auto_882911 ) ) ( not ( = ?auto_882901 ?auto_882912 ) ) ( not ( = ?auto_882902 ?auto_882903 ) ) ( not ( = ?auto_882902 ?auto_882904 ) ) ( not ( = ?auto_882902 ?auto_882905 ) ) ( not ( = ?auto_882902 ?auto_882906 ) ) ( not ( = ?auto_882902 ?auto_882907 ) ) ( not ( = ?auto_882902 ?auto_882908 ) ) ( not ( = ?auto_882902 ?auto_882909 ) ) ( not ( = ?auto_882902 ?auto_882910 ) ) ( not ( = ?auto_882902 ?auto_882911 ) ) ( not ( = ?auto_882902 ?auto_882912 ) ) ( not ( = ?auto_882903 ?auto_882904 ) ) ( not ( = ?auto_882903 ?auto_882905 ) ) ( not ( = ?auto_882903 ?auto_882906 ) ) ( not ( = ?auto_882903 ?auto_882907 ) ) ( not ( = ?auto_882903 ?auto_882908 ) ) ( not ( = ?auto_882903 ?auto_882909 ) ) ( not ( = ?auto_882903 ?auto_882910 ) ) ( not ( = ?auto_882903 ?auto_882911 ) ) ( not ( = ?auto_882903 ?auto_882912 ) ) ( not ( = ?auto_882904 ?auto_882905 ) ) ( not ( = ?auto_882904 ?auto_882906 ) ) ( not ( = ?auto_882904 ?auto_882907 ) ) ( not ( = ?auto_882904 ?auto_882908 ) ) ( not ( = ?auto_882904 ?auto_882909 ) ) ( not ( = ?auto_882904 ?auto_882910 ) ) ( not ( = ?auto_882904 ?auto_882911 ) ) ( not ( = ?auto_882904 ?auto_882912 ) ) ( not ( = ?auto_882905 ?auto_882906 ) ) ( not ( = ?auto_882905 ?auto_882907 ) ) ( not ( = ?auto_882905 ?auto_882908 ) ) ( not ( = ?auto_882905 ?auto_882909 ) ) ( not ( = ?auto_882905 ?auto_882910 ) ) ( not ( = ?auto_882905 ?auto_882911 ) ) ( not ( = ?auto_882905 ?auto_882912 ) ) ( not ( = ?auto_882906 ?auto_882907 ) ) ( not ( = ?auto_882906 ?auto_882908 ) ) ( not ( = ?auto_882906 ?auto_882909 ) ) ( not ( = ?auto_882906 ?auto_882910 ) ) ( not ( = ?auto_882906 ?auto_882911 ) ) ( not ( = ?auto_882906 ?auto_882912 ) ) ( not ( = ?auto_882907 ?auto_882908 ) ) ( not ( = ?auto_882907 ?auto_882909 ) ) ( not ( = ?auto_882907 ?auto_882910 ) ) ( not ( = ?auto_882907 ?auto_882911 ) ) ( not ( = ?auto_882907 ?auto_882912 ) ) ( not ( = ?auto_882908 ?auto_882909 ) ) ( not ( = ?auto_882908 ?auto_882910 ) ) ( not ( = ?auto_882908 ?auto_882911 ) ) ( not ( = ?auto_882908 ?auto_882912 ) ) ( not ( = ?auto_882909 ?auto_882910 ) ) ( not ( = ?auto_882909 ?auto_882911 ) ) ( not ( = ?auto_882909 ?auto_882912 ) ) ( not ( = ?auto_882910 ?auto_882911 ) ) ( not ( = ?auto_882910 ?auto_882912 ) ) ( not ( = ?auto_882911 ?auto_882912 ) ) ( ON ?auto_882910 ?auto_882911 ) ( ON ?auto_882909 ?auto_882910 ) ( ON ?auto_882908 ?auto_882909 ) ( ON ?auto_882907 ?auto_882908 ) ( ON ?auto_882906 ?auto_882907 ) ( CLEAR ?auto_882904 ) ( ON ?auto_882905 ?auto_882906 ) ( CLEAR ?auto_882905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_882900 ?auto_882901 ?auto_882902 ?auto_882903 ?auto_882904 ?auto_882905 )
      ( MAKE-12PILE ?auto_882900 ?auto_882901 ?auto_882902 ?auto_882903 ?auto_882904 ?auto_882905 ?auto_882906 ?auto_882907 ?auto_882908 ?auto_882909 ?auto_882910 ?auto_882911 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_882950 - BLOCK
      ?auto_882951 - BLOCK
      ?auto_882952 - BLOCK
      ?auto_882953 - BLOCK
      ?auto_882954 - BLOCK
      ?auto_882955 - BLOCK
      ?auto_882956 - BLOCK
      ?auto_882957 - BLOCK
      ?auto_882958 - BLOCK
      ?auto_882959 - BLOCK
      ?auto_882960 - BLOCK
      ?auto_882961 - BLOCK
    )
    :vars
    (
      ?auto_882962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_882961 ?auto_882962 ) ( ON-TABLE ?auto_882950 ) ( ON ?auto_882951 ?auto_882950 ) ( ON ?auto_882952 ?auto_882951 ) ( ON ?auto_882953 ?auto_882952 ) ( not ( = ?auto_882950 ?auto_882951 ) ) ( not ( = ?auto_882950 ?auto_882952 ) ) ( not ( = ?auto_882950 ?auto_882953 ) ) ( not ( = ?auto_882950 ?auto_882954 ) ) ( not ( = ?auto_882950 ?auto_882955 ) ) ( not ( = ?auto_882950 ?auto_882956 ) ) ( not ( = ?auto_882950 ?auto_882957 ) ) ( not ( = ?auto_882950 ?auto_882958 ) ) ( not ( = ?auto_882950 ?auto_882959 ) ) ( not ( = ?auto_882950 ?auto_882960 ) ) ( not ( = ?auto_882950 ?auto_882961 ) ) ( not ( = ?auto_882950 ?auto_882962 ) ) ( not ( = ?auto_882951 ?auto_882952 ) ) ( not ( = ?auto_882951 ?auto_882953 ) ) ( not ( = ?auto_882951 ?auto_882954 ) ) ( not ( = ?auto_882951 ?auto_882955 ) ) ( not ( = ?auto_882951 ?auto_882956 ) ) ( not ( = ?auto_882951 ?auto_882957 ) ) ( not ( = ?auto_882951 ?auto_882958 ) ) ( not ( = ?auto_882951 ?auto_882959 ) ) ( not ( = ?auto_882951 ?auto_882960 ) ) ( not ( = ?auto_882951 ?auto_882961 ) ) ( not ( = ?auto_882951 ?auto_882962 ) ) ( not ( = ?auto_882952 ?auto_882953 ) ) ( not ( = ?auto_882952 ?auto_882954 ) ) ( not ( = ?auto_882952 ?auto_882955 ) ) ( not ( = ?auto_882952 ?auto_882956 ) ) ( not ( = ?auto_882952 ?auto_882957 ) ) ( not ( = ?auto_882952 ?auto_882958 ) ) ( not ( = ?auto_882952 ?auto_882959 ) ) ( not ( = ?auto_882952 ?auto_882960 ) ) ( not ( = ?auto_882952 ?auto_882961 ) ) ( not ( = ?auto_882952 ?auto_882962 ) ) ( not ( = ?auto_882953 ?auto_882954 ) ) ( not ( = ?auto_882953 ?auto_882955 ) ) ( not ( = ?auto_882953 ?auto_882956 ) ) ( not ( = ?auto_882953 ?auto_882957 ) ) ( not ( = ?auto_882953 ?auto_882958 ) ) ( not ( = ?auto_882953 ?auto_882959 ) ) ( not ( = ?auto_882953 ?auto_882960 ) ) ( not ( = ?auto_882953 ?auto_882961 ) ) ( not ( = ?auto_882953 ?auto_882962 ) ) ( not ( = ?auto_882954 ?auto_882955 ) ) ( not ( = ?auto_882954 ?auto_882956 ) ) ( not ( = ?auto_882954 ?auto_882957 ) ) ( not ( = ?auto_882954 ?auto_882958 ) ) ( not ( = ?auto_882954 ?auto_882959 ) ) ( not ( = ?auto_882954 ?auto_882960 ) ) ( not ( = ?auto_882954 ?auto_882961 ) ) ( not ( = ?auto_882954 ?auto_882962 ) ) ( not ( = ?auto_882955 ?auto_882956 ) ) ( not ( = ?auto_882955 ?auto_882957 ) ) ( not ( = ?auto_882955 ?auto_882958 ) ) ( not ( = ?auto_882955 ?auto_882959 ) ) ( not ( = ?auto_882955 ?auto_882960 ) ) ( not ( = ?auto_882955 ?auto_882961 ) ) ( not ( = ?auto_882955 ?auto_882962 ) ) ( not ( = ?auto_882956 ?auto_882957 ) ) ( not ( = ?auto_882956 ?auto_882958 ) ) ( not ( = ?auto_882956 ?auto_882959 ) ) ( not ( = ?auto_882956 ?auto_882960 ) ) ( not ( = ?auto_882956 ?auto_882961 ) ) ( not ( = ?auto_882956 ?auto_882962 ) ) ( not ( = ?auto_882957 ?auto_882958 ) ) ( not ( = ?auto_882957 ?auto_882959 ) ) ( not ( = ?auto_882957 ?auto_882960 ) ) ( not ( = ?auto_882957 ?auto_882961 ) ) ( not ( = ?auto_882957 ?auto_882962 ) ) ( not ( = ?auto_882958 ?auto_882959 ) ) ( not ( = ?auto_882958 ?auto_882960 ) ) ( not ( = ?auto_882958 ?auto_882961 ) ) ( not ( = ?auto_882958 ?auto_882962 ) ) ( not ( = ?auto_882959 ?auto_882960 ) ) ( not ( = ?auto_882959 ?auto_882961 ) ) ( not ( = ?auto_882959 ?auto_882962 ) ) ( not ( = ?auto_882960 ?auto_882961 ) ) ( not ( = ?auto_882960 ?auto_882962 ) ) ( not ( = ?auto_882961 ?auto_882962 ) ) ( ON ?auto_882960 ?auto_882961 ) ( ON ?auto_882959 ?auto_882960 ) ( ON ?auto_882958 ?auto_882959 ) ( ON ?auto_882957 ?auto_882958 ) ( ON ?auto_882956 ?auto_882957 ) ( ON ?auto_882955 ?auto_882956 ) ( CLEAR ?auto_882953 ) ( ON ?auto_882954 ?auto_882955 ) ( CLEAR ?auto_882954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_882950 ?auto_882951 ?auto_882952 ?auto_882953 ?auto_882954 )
      ( MAKE-12PILE ?auto_882950 ?auto_882951 ?auto_882952 ?auto_882953 ?auto_882954 ?auto_882955 ?auto_882956 ?auto_882957 ?auto_882958 ?auto_882959 ?auto_882960 ?auto_882961 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_883000 - BLOCK
      ?auto_883001 - BLOCK
      ?auto_883002 - BLOCK
      ?auto_883003 - BLOCK
      ?auto_883004 - BLOCK
      ?auto_883005 - BLOCK
      ?auto_883006 - BLOCK
      ?auto_883007 - BLOCK
      ?auto_883008 - BLOCK
      ?auto_883009 - BLOCK
      ?auto_883010 - BLOCK
      ?auto_883011 - BLOCK
    )
    :vars
    (
      ?auto_883012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883011 ?auto_883012 ) ( ON-TABLE ?auto_883000 ) ( ON ?auto_883001 ?auto_883000 ) ( ON ?auto_883002 ?auto_883001 ) ( not ( = ?auto_883000 ?auto_883001 ) ) ( not ( = ?auto_883000 ?auto_883002 ) ) ( not ( = ?auto_883000 ?auto_883003 ) ) ( not ( = ?auto_883000 ?auto_883004 ) ) ( not ( = ?auto_883000 ?auto_883005 ) ) ( not ( = ?auto_883000 ?auto_883006 ) ) ( not ( = ?auto_883000 ?auto_883007 ) ) ( not ( = ?auto_883000 ?auto_883008 ) ) ( not ( = ?auto_883000 ?auto_883009 ) ) ( not ( = ?auto_883000 ?auto_883010 ) ) ( not ( = ?auto_883000 ?auto_883011 ) ) ( not ( = ?auto_883000 ?auto_883012 ) ) ( not ( = ?auto_883001 ?auto_883002 ) ) ( not ( = ?auto_883001 ?auto_883003 ) ) ( not ( = ?auto_883001 ?auto_883004 ) ) ( not ( = ?auto_883001 ?auto_883005 ) ) ( not ( = ?auto_883001 ?auto_883006 ) ) ( not ( = ?auto_883001 ?auto_883007 ) ) ( not ( = ?auto_883001 ?auto_883008 ) ) ( not ( = ?auto_883001 ?auto_883009 ) ) ( not ( = ?auto_883001 ?auto_883010 ) ) ( not ( = ?auto_883001 ?auto_883011 ) ) ( not ( = ?auto_883001 ?auto_883012 ) ) ( not ( = ?auto_883002 ?auto_883003 ) ) ( not ( = ?auto_883002 ?auto_883004 ) ) ( not ( = ?auto_883002 ?auto_883005 ) ) ( not ( = ?auto_883002 ?auto_883006 ) ) ( not ( = ?auto_883002 ?auto_883007 ) ) ( not ( = ?auto_883002 ?auto_883008 ) ) ( not ( = ?auto_883002 ?auto_883009 ) ) ( not ( = ?auto_883002 ?auto_883010 ) ) ( not ( = ?auto_883002 ?auto_883011 ) ) ( not ( = ?auto_883002 ?auto_883012 ) ) ( not ( = ?auto_883003 ?auto_883004 ) ) ( not ( = ?auto_883003 ?auto_883005 ) ) ( not ( = ?auto_883003 ?auto_883006 ) ) ( not ( = ?auto_883003 ?auto_883007 ) ) ( not ( = ?auto_883003 ?auto_883008 ) ) ( not ( = ?auto_883003 ?auto_883009 ) ) ( not ( = ?auto_883003 ?auto_883010 ) ) ( not ( = ?auto_883003 ?auto_883011 ) ) ( not ( = ?auto_883003 ?auto_883012 ) ) ( not ( = ?auto_883004 ?auto_883005 ) ) ( not ( = ?auto_883004 ?auto_883006 ) ) ( not ( = ?auto_883004 ?auto_883007 ) ) ( not ( = ?auto_883004 ?auto_883008 ) ) ( not ( = ?auto_883004 ?auto_883009 ) ) ( not ( = ?auto_883004 ?auto_883010 ) ) ( not ( = ?auto_883004 ?auto_883011 ) ) ( not ( = ?auto_883004 ?auto_883012 ) ) ( not ( = ?auto_883005 ?auto_883006 ) ) ( not ( = ?auto_883005 ?auto_883007 ) ) ( not ( = ?auto_883005 ?auto_883008 ) ) ( not ( = ?auto_883005 ?auto_883009 ) ) ( not ( = ?auto_883005 ?auto_883010 ) ) ( not ( = ?auto_883005 ?auto_883011 ) ) ( not ( = ?auto_883005 ?auto_883012 ) ) ( not ( = ?auto_883006 ?auto_883007 ) ) ( not ( = ?auto_883006 ?auto_883008 ) ) ( not ( = ?auto_883006 ?auto_883009 ) ) ( not ( = ?auto_883006 ?auto_883010 ) ) ( not ( = ?auto_883006 ?auto_883011 ) ) ( not ( = ?auto_883006 ?auto_883012 ) ) ( not ( = ?auto_883007 ?auto_883008 ) ) ( not ( = ?auto_883007 ?auto_883009 ) ) ( not ( = ?auto_883007 ?auto_883010 ) ) ( not ( = ?auto_883007 ?auto_883011 ) ) ( not ( = ?auto_883007 ?auto_883012 ) ) ( not ( = ?auto_883008 ?auto_883009 ) ) ( not ( = ?auto_883008 ?auto_883010 ) ) ( not ( = ?auto_883008 ?auto_883011 ) ) ( not ( = ?auto_883008 ?auto_883012 ) ) ( not ( = ?auto_883009 ?auto_883010 ) ) ( not ( = ?auto_883009 ?auto_883011 ) ) ( not ( = ?auto_883009 ?auto_883012 ) ) ( not ( = ?auto_883010 ?auto_883011 ) ) ( not ( = ?auto_883010 ?auto_883012 ) ) ( not ( = ?auto_883011 ?auto_883012 ) ) ( ON ?auto_883010 ?auto_883011 ) ( ON ?auto_883009 ?auto_883010 ) ( ON ?auto_883008 ?auto_883009 ) ( ON ?auto_883007 ?auto_883008 ) ( ON ?auto_883006 ?auto_883007 ) ( ON ?auto_883005 ?auto_883006 ) ( ON ?auto_883004 ?auto_883005 ) ( CLEAR ?auto_883002 ) ( ON ?auto_883003 ?auto_883004 ) ( CLEAR ?auto_883003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_883000 ?auto_883001 ?auto_883002 ?auto_883003 )
      ( MAKE-12PILE ?auto_883000 ?auto_883001 ?auto_883002 ?auto_883003 ?auto_883004 ?auto_883005 ?auto_883006 ?auto_883007 ?auto_883008 ?auto_883009 ?auto_883010 ?auto_883011 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_883050 - BLOCK
      ?auto_883051 - BLOCK
      ?auto_883052 - BLOCK
      ?auto_883053 - BLOCK
      ?auto_883054 - BLOCK
      ?auto_883055 - BLOCK
      ?auto_883056 - BLOCK
      ?auto_883057 - BLOCK
      ?auto_883058 - BLOCK
      ?auto_883059 - BLOCK
      ?auto_883060 - BLOCK
      ?auto_883061 - BLOCK
    )
    :vars
    (
      ?auto_883062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883061 ?auto_883062 ) ( ON-TABLE ?auto_883050 ) ( ON ?auto_883051 ?auto_883050 ) ( not ( = ?auto_883050 ?auto_883051 ) ) ( not ( = ?auto_883050 ?auto_883052 ) ) ( not ( = ?auto_883050 ?auto_883053 ) ) ( not ( = ?auto_883050 ?auto_883054 ) ) ( not ( = ?auto_883050 ?auto_883055 ) ) ( not ( = ?auto_883050 ?auto_883056 ) ) ( not ( = ?auto_883050 ?auto_883057 ) ) ( not ( = ?auto_883050 ?auto_883058 ) ) ( not ( = ?auto_883050 ?auto_883059 ) ) ( not ( = ?auto_883050 ?auto_883060 ) ) ( not ( = ?auto_883050 ?auto_883061 ) ) ( not ( = ?auto_883050 ?auto_883062 ) ) ( not ( = ?auto_883051 ?auto_883052 ) ) ( not ( = ?auto_883051 ?auto_883053 ) ) ( not ( = ?auto_883051 ?auto_883054 ) ) ( not ( = ?auto_883051 ?auto_883055 ) ) ( not ( = ?auto_883051 ?auto_883056 ) ) ( not ( = ?auto_883051 ?auto_883057 ) ) ( not ( = ?auto_883051 ?auto_883058 ) ) ( not ( = ?auto_883051 ?auto_883059 ) ) ( not ( = ?auto_883051 ?auto_883060 ) ) ( not ( = ?auto_883051 ?auto_883061 ) ) ( not ( = ?auto_883051 ?auto_883062 ) ) ( not ( = ?auto_883052 ?auto_883053 ) ) ( not ( = ?auto_883052 ?auto_883054 ) ) ( not ( = ?auto_883052 ?auto_883055 ) ) ( not ( = ?auto_883052 ?auto_883056 ) ) ( not ( = ?auto_883052 ?auto_883057 ) ) ( not ( = ?auto_883052 ?auto_883058 ) ) ( not ( = ?auto_883052 ?auto_883059 ) ) ( not ( = ?auto_883052 ?auto_883060 ) ) ( not ( = ?auto_883052 ?auto_883061 ) ) ( not ( = ?auto_883052 ?auto_883062 ) ) ( not ( = ?auto_883053 ?auto_883054 ) ) ( not ( = ?auto_883053 ?auto_883055 ) ) ( not ( = ?auto_883053 ?auto_883056 ) ) ( not ( = ?auto_883053 ?auto_883057 ) ) ( not ( = ?auto_883053 ?auto_883058 ) ) ( not ( = ?auto_883053 ?auto_883059 ) ) ( not ( = ?auto_883053 ?auto_883060 ) ) ( not ( = ?auto_883053 ?auto_883061 ) ) ( not ( = ?auto_883053 ?auto_883062 ) ) ( not ( = ?auto_883054 ?auto_883055 ) ) ( not ( = ?auto_883054 ?auto_883056 ) ) ( not ( = ?auto_883054 ?auto_883057 ) ) ( not ( = ?auto_883054 ?auto_883058 ) ) ( not ( = ?auto_883054 ?auto_883059 ) ) ( not ( = ?auto_883054 ?auto_883060 ) ) ( not ( = ?auto_883054 ?auto_883061 ) ) ( not ( = ?auto_883054 ?auto_883062 ) ) ( not ( = ?auto_883055 ?auto_883056 ) ) ( not ( = ?auto_883055 ?auto_883057 ) ) ( not ( = ?auto_883055 ?auto_883058 ) ) ( not ( = ?auto_883055 ?auto_883059 ) ) ( not ( = ?auto_883055 ?auto_883060 ) ) ( not ( = ?auto_883055 ?auto_883061 ) ) ( not ( = ?auto_883055 ?auto_883062 ) ) ( not ( = ?auto_883056 ?auto_883057 ) ) ( not ( = ?auto_883056 ?auto_883058 ) ) ( not ( = ?auto_883056 ?auto_883059 ) ) ( not ( = ?auto_883056 ?auto_883060 ) ) ( not ( = ?auto_883056 ?auto_883061 ) ) ( not ( = ?auto_883056 ?auto_883062 ) ) ( not ( = ?auto_883057 ?auto_883058 ) ) ( not ( = ?auto_883057 ?auto_883059 ) ) ( not ( = ?auto_883057 ?auto_883060 ) ) ( not ( = ?auto_883057 ?auto_883061 ) ) ( not ( = ?auto_883057 ?auto_883062 ) ) ( not ( = ?auto_883058 ?auto_883059 ) ) ( not ( = ?auto_883058 ?auto_883060 ) ) ( not ( = ?auto_883058 ?auto_883061 ) ) ( not ( = ?auto_883058 ?auto_883062 ) ) ( not ( = ?auto_883059 ?auto_883060 ) ) ( not ( = ?auto_883059 ?auto_883061 ) ) ( not ( = ?auto_883059 ?auto_883062 ) ) ( not ( = ?auto_883060 ?auto_883061 ) ) ( not ( = ?auto_883060 ?auto_883062 ) ) ( not ( = ?auto_883061 ?auto_883062 ) ) ( ON ?auto_883060 ?auto_883061 ) ( ON ?auto_883059 ?auto_883060 ) ( ON ?auto_883058 ?auto_883059 ) ( ON ?auto_883057 ?auto_883058 ) ( ON ?auto_883056 ?auto_883057 ) ( ON ?auto_883055 ?auto_883056 ) ( ON ?auto_883054 ?auto_883055 ) ( ON ?auto_883053 ?auto_883054 ) ( CLEAR ?auto_883051 ) ( ON ?auto_883052 ?auto_883053 ) ( CLEAR ?auto_883052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_883050 ?auto_883051 ?auto_883052 )
      ( MAKE-12PILE ?auto_883050 ?auto_883051 ?auto_883052 ?auto_883053 ?auto_883054 ?auto_883055 ?auto_883056 ?auto_883057 ?auto_883058 ?auto_883059 ?auto_883060 ?auto_883061 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_883100 - BLOCK
      ?auto_883101 - BLOCK
      ?auto_883102 - BLOCK
      ?auto_883103 - BLOCK
      ?auto_883104 - BLOCK
      ?auto_883105 - BLOCK
      ?auto_883106 - BLOCK
      ?auto_883107 - BLOCK
      ?auto_883108 - BLOCK
      ?auto_883109 - BLOCK
      ?auto_883110 - BLOCK
      ?auto_883111 - BLOCK
    )
    :vars
    (
      ?auto_883112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883111 ?auto_883112 ) ( ON-TABLE ?auto_883100 ) ( not ( = ?auto_883100 ?auto_883101 ) ) ( not ( = ?auto_883100 ?auto_883102 ) ) ( not ( = ?auto_883100 ?auto_883103 ) ) ( not ( = ?auto_883100 ?auto_883104 ) ) ( not ( = ?auto_883100 ?auto_883105 ) ) ( not ( = ?auto_883100 ?auto_883106 ) ) ( not ( = ?auto_883100 ?auto_883107 ) ) ( not ( = ?auto_883100 ?auto_883108 ) ) ( not ( = ?auto_883100 ?auto_883109 ) ) ( not ( = ?auto_883100 ?auto_883110 ) ) ( not ( = ?auto_883100 ?auto_883111 ) ) ( not ( = ?auto_883100 ?auto_883112 ) ) ( not ( = ?auto_883101 ?auto_883102 ) ) ( not ( = ?auto_883101 ?auto_883103 ) ) ( not ( = ?auto_883101 ?auto_883104 ) ) ( not ( = ?auto_883101 ?auto_883105 ) ) ( not ( = ?auto_883101 ?auto_883106 ) ) ( not ( = ?auto_883101 ?auto_883107 ) ) ( not ( = ?auto_883101 ?auto_883108 ) ) ( not ( = ?auto_883101 ?auto_883109 ) ) ( not ( = ?auto_883101 ?auto_883110 ) ) ( not ( = ?auto_883101 ?auto_883111 ) ) ( not ( = ?auto_883101 ?auto_883112 ) ) ( not ( = ?auto_883102 ?auto_883103 ) ) ( not ( = ?auto_883102 ?auto_883104 ) ) ( not ( = ?auto_883102 ?auto_883105 ) ) ( not ( = ?auto_883102 ?auto_883106 ) ) ( not ( = ?auto_883102 ?auto_883107 ) ) ( not ( = ?auto_883102 ?auto_883108 ) ) ( not ( = ?auto_883102 ?auto_883109 ) ) ( not ( = ?auto_883102 ?auto_883110 ) ) ( not ( = ?auto_883102 ?auto_883111 ) ) ( not ( = ?auto_883102 ?auto_883112 ) ) ( not ( = ?auto_883103 ?auto_883104 ) ) ( not ( = ?auto_883103 ?auto_883105 ) ) ( not ( = ?auto_883103 ?auto_883106 ) ) ( not ( = ?auto_883103 ?auto_883107 ) ) ( not ( = ?auto_883103 ?auto_883108 ) ) ( not ( = ?auto_883103 ?auto_883109 ) ) ( not ( = ?auto_883103 ?auto_883110 ) ) ( not ( = ?auto_883103 ?auto_883111 ) ) ( not ( = ?auto_883103 ?auto_883112 ) ) ( not ( = ?auto_883104 ?auto_883105 ) ) ( not ( = ?auto_883104 ?auto_883106 ) ) ( not ( = ?auto_883104 ?auto_883107 ) ) ( not ( = ?auto_883104 ?auto_883108 ) ) ( not ( = ?auto_883104 ?auto_883109 ) ) ( not ( = ?auto_883104 ?auto_883110 ) ) ( not ( = ?auto_883104 ?auto_883111 ) ) ( not ( = ?auto_883104 ?auto_883112 ) ) ( not ( = ?auto_883105 ?auto_883106 ) ) ( not ( = ?auto_883105 ?auto_883107 ) ) ( not ( = ?auto_883105 ?auto_883108 ) ) ( not ( = ?auto_883105 ?auto_883109 ) ) ( not ( = ?auto_883105 ?auto_883110 ) ) ( not ( = ?auto_883105 ?auto_883111 ) ) ( not ( = ?auto_883105 ?auto_883112 ) ) ( not ( = ?auto_883106 ?auto_883107 ) ) ( not ( = ?auto_883106 ?auto_883108 ) ) ( not ( = ?auto_883106 ?auto_883109 ) ) ( not ( = ?auto_883106 ?auto_883110 ) ) ( not ( = ?auto_883106 ?auto_883111 ) ) ( not ( = ?auto_883106 ?auto_883112 ) ) ( not ( = ?auto_883107 ?auto_883108 ) ) ( not ( = ?auto_883107 ?auto_883109 ) ) ( not ( = ?auto_883107 ?auto_883110 ) ) ( not ( = ?auto_883107 ?auto_883111 ) ) ( not ( = ?auto_883107 ?auto_883112 ) ) ( not ( = ?auto_883108 ?auto_883109 ) ) ( not ( = ?auto_883108 ?auto_883110 ) ) ( not ( = ?auto_883108 ?auto_883111 ) ) ( not ( = ?auto_883108 ?auto_883112 ) ) ( not ( = ?auto_883109 ?auto_883110 ) ) ( not ( = ?auto_883109 ?auto_883111 ) ) ( not ( = ?auto_883109 ?auto_883112 ) ) ( not ( = ?auto_883110 ?auto_883111 ) ) ( not ( = ?auto_883110 ?auto_883112 ) ) ( not ( = ?auto_883111 ?auto_883112 ) ) ( ON ?auto_883110 ?auto_883111 ) ( ON ?auto_883109 ?auto_883110 ) ( ON ?auto_883108 ?auto_883109 ) ( ON ?auto_883107 ?auto_883108 ) ( ON ?auto_883106 ?auto_883107 ) ( ON ?auto_883105 ?auto_883106 ) ( ON ?auto_883104 ?auto_883105 ) ( ON ?auto_883103 ?auto_883104 ) ( ON ?auto_883102 ?auto_883103 ) ( CLEAR ?auto_883100 ) ( ON ?auto_883101 ?auto_883102 ) ( CLEAR ?auto_883101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_883100 ?auto_883101 )
      ( MAKE-12PILE ?auto_883100 ?auto_883101 ?auto_883102 ?auto_883103 ?auto_883104 ?auto_883105 ?auto_883106 ?auto_883107 ?auto_883108 ?auto_883109 ?auto_883110 ?auto_883111 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_883150 - BLOCK
      ?auto_883151 - BLOCK
      ?auto_883152 - BLOCK
      ?auto_883153 - BLOCK
      ?auto_883154 - BLOCK
      ?auto_883155 - BLOCK
      ?auto_883156 - BLOCK
      ?auto_883157 - BLOCK
      ?auto_883158 - BLOCK
      ?auto_883159 - BLOCK
      ?auto_883160 - BLOCK
      ?auto_883161 - BLOCK
    )
    :vars
    (
      ?auto_883162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883161 ?auto_883162 ) ( not ( = ?auto_883150 ?auto_883151 ) ) ( not ( = ?auto_883150 ?auto_883152 ) ) ( not ( = ?auto_883150 ?auto_883153 ) ) ( not ( = ?auto_883150 ?auto_883154 ) ) ( not ( = ?auto_883150 ?auto_883155 ) ) ( not ( = ?auto_883150 ?auto_883156 ) ) ( not ( = ?auto_883150 ?auto_883157 ) ) ( not ( = ?auto_883150 ?auto_883158 ) ) ( not ( = ?auto_883150 ?auto_883159 ) ) ( not ( = ?auto_883150 ?auto_883160 ) ) ( not ( = ?auto_883150 ?auto_883161 ) ) ( not ( = ?auto_883150 ?auto_883162 ) ) ( not ( = ?auto_883151 ?auto_883152 ) ) ( not ( = ?auto_883151 ?auto_883153 ) ) ( not ( = ?auto_883151 ?auto_883154 ) ) ( not ( = ?auto_883151 ?auto_883155 ) ) ( not ( = ?auto_883151 ?auto_883156 ) ) ( not ( = ?auto_883151 ?auto_883157 ) ) ( not ( = ?auto_883151 ?auto_883158 ) ) ( not ( = ?auto_883151 ?auto_883159 ) ) ( not ( = ?auto_883151 ?auto_883160 ) ) ( not ( = ?auto_883151 ?auto_883161 ) ) ( not ( = ?auto_883151 ?auto_883162 ) ) ( not ( = ?auto_883152 ?auto_883153 ) ) ( not ( = ?auto_883152 ?auto_883154 ) ) ( not ( = ?auto_883152 ?auto_883155 ) ) ( not ( = ?auto_883152 ?auto_883156 ) ) ( not ( = ?auto_883152 ?auto_883157 ) ) ( not ( = ?auto_883152 ?auto_883158 ) ) ( not ( = ?auto_883152 ?auto_883159 ) ) ( not ( = ?auto_883152 ?auto_883160 ) ) ( not ( = ?auto_883152 ?auto_883161 ) ) ( not ( = ?auto_883152 ?auto_883162 ) ) ( not ( = ?auto_883153 ?auto_883154 ) ) ( not ( = ?auto_883153 ?auto_883155 ) ) ( not ( = ?auto_883153 ?auto_883156 ) ) ( not ( = ?auto_883153 ?auto_883157 ) ) ( not ( = ?auto_883153 ?auto_883158 ) ) ( not ( = ?auto_883153 ?auto_883159 ) ) ( not ( = ?auto_883153 ?auto_883160 ) ) ( not ( = ?auto_883153 ?auto_883161 ) ) ( not ( = ?auto_883153 ?auto_883162 ) ) ( not ( = ?auto_883154 ?auto_883155 ) ) ( not ( = ?auto_883154 ?auto_883156 ) ) ( not ( = ?auto_883154 ?auto_883157 ) ) ( not ( = ?auto_883154 ?auto_883158 ) ) ( not ( = ?auto_883154 ?auto_883159 ) ) ( not ( = ?auto_883154 ?auto_883160 ) ) ( not ( = ?auto_883154 ?auto_883161 ) ) ( not ( = ?auto_883154 ?auto_883162 ) ) ( not ( = ?auto_883155 ?auto_883156 ) ) ( not ( = ?auto_883155 ?auto_883157 ) ) ( not ( = ?auto_883155 ?auto_883158 ) ) ( not ( = ?auto_883155 ?auto_883159 ) ) ( not ( = ?auto_883155 ?auto_883160 ) ) ( not ( = ?auto_883155 ?auto_883161 ) ) ( not ( = ?auto_883155 ?auto_883162 ) ) ( not ( = ?auto_883156 ?auto_883157 ) ) ( not ( = ?auto_883156 ?auto_883158 ) ) ( not ( = ?auto_883156 ?auto_883159 ) ) ( not ( = ?auto_883156 ?auto_883160 ) ) ( not ( = ?auto_883156 ?auto_883161 ) ) ( not ( = ?auto_883156 ?auto_883162 ) ) ( not ( = ?auto_883157 ?auto_883158 ) ) ( not ( = ?auto_883157 ?auto_883159 ) ) ( not ( = ?auto_883157 ?auto_883160 ) ) ( not ( = ?auto_883157 ?auto_883161 ) ) ( not ( = ?auto_883157 ?auto_883162 ) ) ( not ( = ?auto_883158 ?auto_883159 ) ) ( not ( = ?auto_883158 ?auto_883160 ) ) ( not ( = ?auto_883158 ?auto_883161 ) ) ( not ( = ?auto_883158 ?auto_883162 ) ) ( not ( = ?auto_883159 ?auto_883160 ) ) ( not ( = ?auto_883159 ?auto_883161 ) ) ( not ( = ?auto_883159 ?auto_883162 ) ) ( not ( = ?auto_883160 ?auto_883161 ) ) ( not ( = ?auto_883160 ?auto_883162 ) ) ( not ( = ?auto_883161 ?auto_883162 ) ) ( ON ?auto_883160 ?auto_883161 ) ( ON ?auto_883159 ?auto_883160 ) ( ON ?auto_883158 ?auto_883159 ) ( ON ?auto_883157 ?auto_883158 ) ( ON ?auto_883156 ?auto_883157 ) ( ON ?auto_883155 ?auto_883156 ) ( ON ?auto_883154 ?auto_883155 ) ( ON ?auto_883153 ?auto_883154 ) ( ON ?auto_883152 ?auto_883153 ) ( ON ?auto_883151 ?auto_883152 ) ( ON ?auto_883150 ?auto_883151 ) ( CLEAR ?auto_883150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_883150 )
      ( MAKE-12PILE ?auto_883150 ?auto_883151 ?auto_883152 ?auto_883153 ?auto_883154 ?auto_883155 ?auto_883156 ?auto_883157 ?auto_883158 ?auto_883159 ?auto_883160 ?auto_883161 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_883201 - BLOCK
      ?auto_883202 - BLOCK
      ?auto_883203 - BLOCK
      ?auto_883204 - BLOCK
      ?auto_883205 - BLOCK
      ?auto_883206 - BLOCK
      ?auto_883207 - BLOCK
      ?auto_883208 - BLOCK
      ?auto_883209 - BLOCK
      ?auto_883210 - BLOCK
      ?auto_883211 - BLOCK
      ?auto_883212 - BLOCK
      ?auto_883213 - BLOCK
    )
    :vars
    (
      ?auto_883214 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_883212 ) ( ON ?auto_883213 ?auto_883214 ) ( CLEAR ?auto_883213 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_883201 ) ( ON ?auto_883202 ?auto_883201 ) ( ON ?auto_883203 ?auto_883202 ) ( ON ?auto_883204 ?auto_883203 ) ( ON ?auto_883205 ?auto_883204 ) ( ON ?auto_883206 ?auto_883205 ) ( ON ?auto_883207 ?auto_883206 ) ( ON ?auto_883208 ?auto_883207 ) ( ON ?auto_883209 ?auto_883208 ) ( ON ?auto_883210 ?auto_883209 ) ( ON ?auto_883211 ?auto_883210 ) ( ON ?auto_883212 ?auto_883211 ) ( not ( = ?auto_883201 ?auto_883202 ) ) ( not ( = ?auto_883201 ?auto_883203 ) ) ( not ( = ?auto_883201 ?auto_883204 ) ) ( not ( = ?auto_883201 ?auto_883205 ) ) ( not ( = ?auto_883201 ?auto_883206 ) ) ( not ( = ?auto_883201 ?auto_883207 ) ) ( not ( = ?auto_883201 ?auto_883208 ) ) ( not ( = ?auto_883201 ?auto_883209 ) ) ( not ( = ?auto_883201 ?auto_883210 ) ) ( not ( = ?auto_883201 ?auto_883211 ) ) ( not ( = ?auto_883201 ?auto_883212 ) ) ( not ( = ?auto_883201 ?auto_883213 ) ) ( not ( = ?auto_883201 ?auto_883214 ) ) ( not ( = ?auto_883202 ?auto_883203 ) ) ( not ( = ?auto_883202 ?auto_883204 ) ) ( not ( = ?auto_883202 ?auto_883205 ) ) ( not ( = ?auto_883202 ?auto_883206 ) ) ( not ( = ?auto_883202 ?auto_883207 ) ) ( not ( = ?auto_883202 ?auto_883208 ) ) ( not ( = ?auto_883202 ?auto_883209 ) ) ( not ( = ?auto_883202 ?auto_883210 ) ) ( not ( = ?auto_883202 ?auto_883211 ) ) ( not ( = ?auto_883202 ?auto_883212 ) ) ( not ( = ?auto_883202 ?auto_883213 ) ) ( not ( = ?auto_883202 ?auto_883214 ) ) ( not ( = ?auto_883203 ?auto_883204 ) ) ( not ( = ?auto_883203 ?auto_883205 ) ) ( not ( = ?auto_883203 ?auto_883206 ) ) ( not ( = ?auto_883203 ?auto_883207 ) ) ( not ( = ?auto_883203 ?auto_883208 ) ) ( not ( = ?auto_883203 ?auto_883209 ) ) ( not ( = ?auto_883203 ?auto_883210 ) ) ( not ( = ?auto_883203 ?auto_883211 ) ) ( not ( = ?auto_883203 ?auto_883212 ) ) ( not ( = ?auto_883203 ?auto_883213 ) ) ( not ( = ?auto_883203 ?auto_883214 ) ) ( not ( = ?auto_883204 ?auto_883205 ) ) ( not ( = ?auto_883204 ?auto_883206 ) ) ( not ( = ?auto_883204 ?auto_883207 ) ) ( not ( = ?auto_883204 ?auto_883208 ) ) ( not ( = ?auto_883204 ?auto_883209 ) ) ( not ( = ?auto_883204 ?auto_883210 ) ) ( not ( = ?auto_883204 ?auto_883211 ) ) ( not ( = ?auto_883204 ?auto_883212 ) ) ( not ( = ?auto_883204 ?auto_883213 ) ) ( not ( = ?auto_883204 ?auto_883214 ) ) ( not ( = ?auto_883205 ?auto_883206 ) ) ( not ( = ?auto_883205 ?auto_883207 ) ) ( not ( = ?auto_883205 ?auto_883208 ) ) ( not ( = ?auto_883205 ?auto_883209 ) ) ( not ( = ?auto_883205 ?auto_883210 ) ) ( not ( = ?auto_883205 ?auto_883211 ) ) ( not ( = ?auto_883205 ?auto_883212 ) ) ( not ( = ?auto_883205 ?auto_883213 ) ) ( not ( = ?auto_883205 ?auto_883214 ) ) ( not ( = ?auto_883206 ?auto_883207 ) ) ( not ( = ?auto_883206 ?auto_883208 ) ) ( not ( = ?auto_883206 ?auto_883209 ) ) ( not ( = ?auto_883206 ?auto_883210 ) ) ( not ( = ?auto_883206 ?auto_883211 ) ) ( not ( = ?auto_883206 ?auto_883212 ) ) ( not ( = ?auto_883206 ?auto_883213 ) ) ( not ( = ?auto_883206 ?auto_883214 ) ) ( not ( = ?auto_883207 ?auto_883208 ) ) ( not ( = ?auto_883207 ?auto_883209 ) ) ( not ( = ?auto_883207 ?auto_883210 ) ) ( not ( = ?auto_883207 ?auto_883211 ) ) ( not ( = ?auto_883207 ?auto_883212 ) ) ( not ( = ?auto_883207 ?auto_883213 ) ) ( not ( = ?auto_883207 ?auto_883214 ) ) ( not ( = ?auto_883208 ?auto_883209 ) ) ( not ( = ?auto_883208 ?auto_883210 ) ) ( not ( = ?auto_883208 ?auto_883211 ) ) ( not ( = ?auto_883208 ?auto_883212 ) ) ( not ( = ?auto_883208 ?auto_883213 ) ) ( not ( = ?auto_883208 ?auto_883214 ) ) ( not ( = ?auto_883209 ?auto_883210 ) ) ( not ( = ?auto_883209 ?auto_883211 ) ) ( not ( = ?auto_883209 ?auto_883212 ) ) ( not ( = ?auto_883209 ?auto_883213 ) ) ( not ( = ?auto_883209 ?auto_883214 ) ) ( not ( = ?auto_883210 ?auto_883211 ) ) ( not ( = ?auto_883210 ?auto_883212 ) ) ( not ( = ?auto_883210 ?auto_883213 ) ) ( not ( = ?auto_883210 ?auto_883214 ) ) ( not ( = ?auto_883211 ?auto_883212 ) ) ( not ( = ?auto_883211 ?auto_883213 ) ) ( not ( = ?auto_883211 ?auto_883214 ) ) ( not ( = ?auto_883212 ?auto_883213 ) ) ( not ( = ?auto_883212 ?auto_883214 ) ) ( not ( = ?auto_883213 ?auto_883214 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_883213 ?auto_883214 )
      ( !STACK ?auto_883213 ?auto_883212 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_883255 - BLOCK
      ?auto_883256 - BLOCK
      ?auto_883257 - BLOCK
      ?auto_883258 - BLOCK
      ?auto_883259 - BLOCK
      ?auto_883260 - BLOCK
      ?auto_883261 - BLOCK
      ?auto_883262 - BLOCK
      ?auto_883263 - BLOCK
      ?auto_883264 - BLOCK
      ?auto_883265 - BLOCK
      ?auto_883266 - BLOCK
      ?auto_883267 - BLOCK
    )
    :vars
    (
      ?auto_883268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883267 ?auto_883268 ) ( ON-TABLE ?auto_883255 ) ( ON ?auto_883256 ?auto_883255 ) ( ON ?auto_883257 ?auto_883256 ) ( ON ?auto_883258 ?auto_883257 ) ( ON ?auto_883259 ?auto_883258 ) ( ON ?auto_883260 ?auto_883259 ) ( ON ?auto_883261 ?auto_883260 ) ( ON ?auto_883262 ?auto_883261 ) ( ON ?auto_883263 ?auto_883262 ) ( ON ?auto_883264 ?auto_883263 ) ( ON ?auto_883265 ?auto_883264 ) ( not ( = ?auto_883255 ?auto_883256 ) ) ( not ( = ?auto_883255 ?auto_883257 ) ) ( not ( = ?auto_883255 ?auto_883258 ) ) ( not ( = ?auto_883255 ?auto_883259 ) ) ( not ( = ?auto_883255 ?auto_883260 ) ) ( not ( = ?auto_883255 ?auto_883261 ) ) ( not ( = ?auto_883255 ?auto_883262 ) ) ( not ( = ?auto_883255 ?auto_883263 ) ) ( not ( = ?auto_883255 ?auto_883264 ) ) ( not ( = ?auto_883255 ?auto_883265 ) ) ( not ( = ?auto_883255 ?auto_883266 ) ) ( not ( = ?auto_883255 ?auto_883267 ) ) ( not ( = ?auto_883255 ?auto_883268 ) ) ( not ( = ?auto_883256 ?auto_883257 ) ) ( not ( = ?auto_883256 ?auto_883258 ) ) ( not ( = ?auto_883256 ?auto_883259 ) ) ( not ( = ?auto_883256 ?auto_883260 ) ) ( not ( = ?auto_883256 ?auto_883261 ) ) ( not ( = ?auto_883256 ?auto_883262 ) ) ( not ( = ?auto_883256 ?auto_883263 ) ) ( not ( = ?auto_883256 ?auto_883264 ) ) ( not ( = ?auto_883256 ?auto_883265 ) ) ( not ( = ?auto_883256 ?auto_883266 ) ) ( not ( = ?auto_883256 ?auto_883267 ) ) ( not ( = ?auto_883256 ?auto_883268 ) ) ( not ( = ?auto_883257 ?auto_883258 ) ) ( not ( = ?auto_883257 ?auto_883259 ) ) ( not ( = ?auto_883257 ?auto_883260 ) ) ( not ( = ?auto_883257 ?auto_883261 ) ) ( not ( = ?auto_883257 ?auto_883262 ) ) ( not ( = ?auto_883257 ?auto_883263 ) ) ( not ( = ?auto_883257 ?auto_883264 ) ) ( not ( = ?auto_883257 ?auto_883265 ) ) ( not ( = ?auto_883257 ?auto_883266 ) ) ( not ( = ?auto_883257 ?auto_883267 ) ) ( not ( = ?auto_883257 ?auto_883268 ) ) ( not ( = ?auto_883258 ?auto_883259 ) ) ( not ( = ?auto_883258 ?auto_883260 ) ) ( not ( = ?auto_883258 ?auto_883261 ) ) ( not ( = ?auto_883258 ?auto_883262 ) ) ( not ( = ?auto_883258 ?auto_883263 ) ) ( not ( = ?auto_883258 ?auto_883264 ) ) ( not ( = ?auto_883258 ?auto_883265 ) ) ( not ( = ?auto_883258 ?auto_883266 ) ) ( not ( = ?auto_883258 ?auto_883267 ) ) ( not ( = ?auto_883258 ?auto_883268 ) ) ( not ( = ?auto_883259 ?auto_883260 ) ) ( not ( = ?auto_883259 ?auto_883261 ) ) ( not ( = ?auto_883259 ?auto_883262 ) ) ( not ( = ?auto_883259 ?auto_883263 ) ) ( not ( = ?auto_883259 ?auto_883264 ) ) ( not ( = ?auto_883259 ?auto_883265 ) ) ( not ( = ?auto_883259 ?auto_883266 ) ) ( not ( = ?auto_883259 ?auto_883267 ) ) ( not ( = ?auto_883259 ?auto_883268 ) ) ( not ( = ?auto_883260 ?auto_883261 ) ) ( not ( = ?auto_883260 ?auto_883262 ) ) ( not ( = ?auto_883260 ?auto_883263 ) ) ( not ( = ?auto_883260 ?auto_883264 ) ) ( not ( = ?auto_883260 ?auto_883265 ) ) ( not ( = ?auto_883260 ?auto_883266 ) ) ( not ( = ?auto_883260 ?auto_883267 ) ) ( not ( = ?auto_883260 ?auto_883268 ) ) ( not ( = ?auto_883261 ?auto_883262 ) ) ( not ( = ?auto_883261 ?auto_883263 ) ) ( not ( = ?auto_883261 ?auto_883264 ) ) ( not ( = ?auto_883261 ?auto_883265 ) ) ( not ( = ?auto_883261 ?auto_883266 ) ) ( not ( = ?auto_883261 ?auto_883267 ) ) ( not ( = ?auto_883261 ?auto_883268 ) ) ( not ( = ?auto_883262 ?auto_883263 ) ) ( not ( = ?auto_883262 ?auto_883264 ) ) ( not ( = ?auto_883262 ?auto_883265 ) ) ( not ( = ?auto_883262 ?auto_883266 ) ) ( not ( = ?auto_883262 ?auto_883267 ) ) ( not ( = ?auto_883262 ?auto_883268 ) ) ( not ( = ?auto_883263 ?auto_883264 ) ) ( not ( = ?auto_883263 ?auto_883265 ) ) ( not ( = ?auto_883263 ?auto_883266 ) ) ( not ( = ?auto_883263 ?auto_883267 ) ) ( not ( = ?auto_883263 ?auto_883268 ) ) ( not ( = ?auto_883264 ?auto_883265 ) ) ( not ( = ?auto_883264 ?auto_883266 ) ) ( not ( = ?auto_883264 ?auto_883267 ) ) ( not ( = ?auto_883264 ?auto_883268 ) ) ( not ( = ?auto_883265 ?auto_883266 ) ) ( not ( = ?auto_883265 ?auto_883267 ) ) ( not ( = ?auto_883265 ?auto_883268 ) ) ( not ( = ?auto_883266 ?auto_883267 ) ) ( not ( = ?auto_883266 ?auto_883268 ) ) ( not ( = ?auto_883267 ?auto_883268 ) ) ( CLEAR ?auto_883265 ) ( ON ?auto_883266 ?auto_883267 ) ( CLEAR ?auto_883266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_883255 ?auto_883256 ?auto_883257 ?auto_883258 ?auto_883259 ?auto_883260 ?auto_883261 ?auto_883262 ?auto_883263 ?auto_883264 ?auto_883265 ?auto_883266 )
      ( MAKE-13PILE ?auto_883255 ?auto_883256 ?auto_883257 ?auto_883258 ?auto_883259 ?auto_883260 ?auto_883261 ?auto_883262 ?auto_883263 ?auto_883264 ?auto_883265 ?auto_883266 ?auto_883267 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_883309 - BLOCK
      ?auto_883310 - BLOCK
      ?auto_883311 - BLOCK
      ?auto_883312 - BLOCK
      ?auto_883313 - BLOCK
      ?auto_883314 - BLOCK
      ?auto_883315 - BLOCK
      ?auto_883316 - BLOCK
      ?auto_883317 - BLOCK
      ?auto_883318 - BLOCK
      ?auto_883319 - BLOCK
      ?auto_883320 - BLOCK
      ?auto_883321 - BLOCK
    )
    :vars
    (
      ?auto_883322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883321 ?auto_883322 ) ( ON-TABLE ?auto_883309 ) ( ON ?auto_883310 ?auto_883309 ) ( ON ?auto_883311 ?auto_883310 ) ( ON ?auto_883312 ?auto_883311 ) ( ON ?auto_883313 ?auto_883312 ) ( ON ?auto_883314 ?auto_883313 ) ( ON ?auto_883315 ?auto_883314 ) ( ON ?auto_883316 ?auto_883315 ) ( ON ?auto_883317 ?auto_883316 ) ( ON ?auto_883318 ?auto_883317 ) ( not ( = ?auto_883309 ?auto_883310 ) ) ( not ( = ?auto_883309 ?auto_883311 ) ) ( not ( = ?auto_883309 ?auto_883312 ) ) ( not ( = ?auto_883309 ?auto_883313 ) ) ( not ( = ?auto_883309 ?auto_883314 ) ) ( not ( = ?auto_883309 ?auto_883315 ) ) ( not ( = ?auto_883309 ?auto_883316 ) ) ( not ( = ?auto_883309 ?auto_883317 ) ) ( not ( = ?auto_883309 ?auto_883318 ) ) ( not ( = ?auto_883309 ?auto_883319 ) ) ( not ( = ?auto_883309 ?auto_883320 ) ) ( not ( = ?auto_883309 ?auto_883321 ) ) ( not ( = ?auto_883309 ?auto_883322 ) ) ( not ( = ?auto_883310 ?auto_883311 ) ) ( not ( = ?auto_883310 ?auto_883312 ) ) ( not ( = ?auto_883310 ?auto_883313 ) ) ( not ( = ?auto_883310 ?auto_883314 ) ) ( not ( = ?auto_883310 ?auto_883315 ) ) ( not ( = ?auto_883310 ?auto_883316 ) ) ( not ( = ?auto_883310 ?auto_883317 ) ) ( not ( = ?auto_883310 ?auto_883318 ) ) ( not ( = ?auto_883310 ?auto_883319 ) ) ( not ( = ?auto_883310 ?auto_883320 ) ) ( not ( = ?auto_883310 ?auto_883321 ) ) ( not ( = ?auto_883310 ?auto_883322 ) ) ( not ( = ?auto_883311 ?auto_883312 ) ) ( not ( = ?auto_883311 ?auto_883313 ) ) ( not ( = ?auto_883311 ?auto_883314 ) ) ( not ( = ?auto_883311 ?auto_883315 ) ) ( not ( = ?auto_883311 ?auto_883316 ) ) ( not ( = ?auto_883311 ?auto_883317 ) ) ( not ( = ?auto_883311 ?auto_883318 ) ) ( not ( = ?auto_883311 ?auto_883319 ) ) ( not ( = ?auto_883311 ?auto_883320 ) ) ( not ( = ?auto_883311 ?auto_883321 ) ) ( not ( = ?auto_883311 ?auto_883322 ) ) ( not ( = ?auto_883312 ?auto_883313 ) ) ( not ( = ?auto_883312 ?auto_883314 ) ) ( not ( = ?auto_883312 ?auto_883315 ) ) ( not ( = ?auto_883312 ?auto_883316 ) ) ( not ( = ?auto_883312 ?auto_883317 ) ) ( not ( = ?auto_883312 ?auto_883318 ) ) ( not ( = ?auto_883312 ?auto_883319 ) ) ( not ( = ?auto_883312 ?auto_883320 ) ) ( not ( = ?auto_883312 ?auto_883321 ) ) ( not ( = ?auto_883312 ?auto_883322 ) ) ( not ( = ?auto_883313 ?auto_883314 ) ) ( not ( = ?auto_883313 ?auto_883315 ) ) ( not ( = ?auto_883313 ?auto_883316 ) ) ( not ( = ?auto_883313 ?auto_883317 ) ) ( not ( = ?auto_883313 ?auto_883318 ) ) ( not ( = ?auto_883313 ?auto_883319 ) ) ( not ( = ?auto_883313 ?auto_883320 ) ) ( not ( = ?auto_883313 ?auto_883321 ) ) ( not ( = ?auto_883313 ?auto_883322 ) ) ( not ( = ?auto_883314 ?auto_883315 ) ) ( not ( = ?auto_883314 ?auto_883316 ) ) ( not ( = ?auto_883314 ?auto_883317 ) ) ( not ( = ?auto_883314 ?auto_883318 ) ) ( not ( = ?auto_883314 ?auto_883319 ) ) ( not ( = ?auto_883314 ?auto_883320 ) ) ( not ( = ?auto_883314 ?auto_883321 ) ) ( not ( = ?auto_883314 ?auto_883322 ) ) ( not ( = ?auto_883315 ?auto_883316 ) ) ( not ( = ?auto_883315 ?auto_883317 ) ) ( not ( = ?auto_883315 ?auto_883318 ) ) ( not ( = ?auto_883315 ?auto_883319 ) ) ( not ( = ?auto_883315 ?auto_883320 ) ) ( not ( = ?auto_883315 ?auto_883321 ) ) ( not ( = ?auto_883315 ?auto_883322 ) ) ( not ( = ?auto_883316 ?auto_883317 ) ) ( not ( = ?auto_883316 ?auto_883318 ) ) ( not ( = ?auto_883316 ?auto_883319 ) ) ( not ( = ?auto_883316 ?auto_883320 ) ) ( not ( = ?auto_883316 ?auto_883321 ) ) ( not ( = ?auto_883316 ?auto_883322 ) ) ( not ( = ?auto_883317 ?auto_883318 ) ) ( not ( = ?auto_883317 ?auto_883319 ) ) ( not ( = ?auto_883317 ?auto_883320 ) ) ( not ( = ?auto_883317 ?auto_883321 ) ) ( not ( = ?auto_883317 ?auto_883322 ) ) ( not ( = ?auto_883318 ?auto_883319 ) ) ( not ( = ?auto_883318 ?auto_883320 ) ) ( not ( = ?auto_883318 ?auto_883321 ) ) ( not ( = ?auto_883318 ?auto_883322 ) ) ( not ( = ?auto_883319 ?auto_883320 ) ) ( not ( = ?auto_883319 ?auto_883321 ) ) ( not ( = ?auto_883319 ?auto_883322 ) ) ( not ( = ?auto_883320 ?auto_883321 ) ) ( not ( = ?auto_883320 ?auto_883322 ) ) ( not ( = ?auto_883321 ?auto_883322 ) ) ( ON ?auto_883320 ?auto_883321 ) ( CLEAR ?auto_883318 ) ( ON ?auto_883319 ?auto_883320 ) ( CLEAR ?auto_883319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_883309 ?auto_883310 ?auto_883311 ?auto_883312 ?auto_883313 ?auto_883314 ?auto_883315 ?auto_883316 ?auto_883317 ?auto_883318 ?auto_883319 )
      ( MAKE-13PILE ?auto_883309 ?auto_883310 ?auto_883311 ?auto_883312 ?auto_883313 ?auto_883314 ?auto_883315 ?auto_883316 ?auto_883317 ?auto_883318 ?auto_883319 ?auto_883320 ?auto_883321 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_883363 - BLOCK
      ?auto_883364 - BLOCK
      ?auto_883365 - BLOCK
      ?auto_883366 - BLOCK
      ?auto_883367 - BLOCK
      ?auto_883368 - BLOCK
      ?auto_883369 - BLOCK
      ?auto_883370 - BLOCK
      ?auto_883371 - BLOCK
      ?auto_883372 - BLOCK
      ?auto_883373 - BLOCK
      ?auto_883374 - BLOCK
      ?auto_883375 - BLOCK
    )
    :vars
    (
      ?auto_883376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883375 ?auto_883376 ) ( ON-TABLE ?auto_883363 ) ( ON ?auto_883364 ?auto_883363 ) ( ON ?auto_883365 ?auto_883364 ) ( ON ?auto_883366 ?auto_883365 ) ( ON ?auto_883367 ?auto_883366 ) ( ON ?auto_883368 ?auto_883367 ) ( ON ?auto_883369 ?auto_883368 ) ( ON ?auto_883370 ?auto_883369 ) ( ON ?auto_883371 ?auto_883370 ) ( not ( = ?auto_883363 ?auto_883364 ) ) ( not ( = ?auto_883363 ?auto_883365 ) ) ( not ( = ?auto_883363 ?auto_883366 ) ) ( not ( = ?auto_883363 ?auto_883367 ) ) ( not ( = ?auto_883363 ?auto_883368 ) ) ( not ( = ?auto_883363 ?auto_883369 ) ) ( not ( = ?auto_883363 ?auto_883370 ) ) ( not ( = ?auto_883363 ?auto_883371 ) ) ( not ( = ?auto_883363 ?auto_883372 ) ) ( not ( = ?auto_883363 ?auto_883373 ) ) ( not ( = ?auto_883363 ?auto_883374 ) ) ( not ( = ?auto_883363 ?auto_883375 ) ) ( not ( = ?auto_883363 ?auto_883376 ) ) ( not ( = ?auto_883364 ?auto_883365 ) ) ( not ( = ?auto_883364 ?auto_883366 ) ) ( not ( = ?auto_883364 ?auto_883367 ) ) ( not ( = ?auto_883364 ?auto_883368 ) ) ( not ( = ?auto_883364 ?auto_883369 ) ) ( not ( = ?auto_883364 ?auto_883370 ) ) ( not ( = ?auto_883364 ?auto_883371 ) ) ( not ( = ?auto_883364 ?auto_883372 ) ) ( not ( = ?auto_883364 ?auto_883373 ) ) ( not ( = ?auto_883364 ?auto_883374 ) ) ( not ( = ?auto_883364 ?auto_883375 ) ) ( not ( = ?auto_883364 ?auto_883376 ) ) ( not ( = ?auto_883365 ?auto_883366 ) ) ( not ( = ?auto_883365 ?auto_883367 ) ) ( not ( = ?auto_883365 ?auto_883368 ) ) ( not ( = ?auto_883365 ?auto_883369 ) ) ( not ( = ?auto_883365 ?auto_883370 ) ) ( not ( = ?auto_883365 ?auto_883371 ) ) ( not ( = ?auto_883365 ?auto_883372 ) ) ( not ( = ?auto_883365 ?auto_883373 ) ) ( not ( = ?auto_883365 ?auto_883374 ) ) ( not ( = ?auto_883365 ?auto_883375 ) ) ( not ( = ?auto_883365 ?auto_883376 ) ) ( not ( = ?auto_883366 ?auto_883367 ) ) ( not ( = ?auto_883366 ?auto_883368 ) ) ( not ( = ?auto_883366 ?auto_883369 ) ) ( not ( = ?auto_883366 ?auto_883370 ) ) ( not ( = ?auto_883366 ?auto_883371 ) ) ( not ( = ?auto_883366 ?auto_883372 ) ) ( not ( = ?auto_883366 ?auto_883373 ) ) ( not ( = ?auto_883366 ?auto_883374 ) ) ( not ( = ?auto_883366 ?auto_883375 ) ) ( not ( = ?auto_883366 ?auto_883376 ) ) ( not ( = ?auto_883367 ?auto_883368 ) ) ( not ( = ?auto_883367 ?auto_883369 ) ) ( not ( = ?auto_883367 ?auto_883370 ) ) ( not ( = ?auto_883367 ?auto_883371 ) ) ( not ( = ?auto_883367 ?auto_883372 ) ) ( not ( = ?auto_883367 ?auto_883373 ) ) ( not ( = ?auto_883367 ?auto_883374 ) ) ( not ( = ?auto_883367 ?auto_883375 ) ) ( not ( = ?auto_883367 ?auto_883376 ) ) ( not ( = ?auto_883368 ?auto_883369 ) ) ( not ( = ?auto_883368 ?auto_883370 ) ) ( not ( = ?auto_883368 ?auto_883371 ) ) ( not ( = ?auto_883368 ?auto_883372 ) ) ( not ( = ?auto_883368 ?auto_883373 ) ) ( not ( = ?auto_883368 ?auto_883374 ) ) ( not ( = ?auto_883368 ?auto_883375 ) ) ( not ( = ?auto_883368 ?auto_883376 ) ) ( not ( = ?auto_883369 ?auto_883370 ) ) ( not ( = ?auto_883369 ?auto_883371 ) ) ( not ( = ?auto_883369 ?auto_883372 ) ) ( not ( = ?auto_883369 ?auto_883373 ) ) ( not ( = ?auto_883369 ?auto_883374 ) ) ( not ( = ?auto_883369 ?auto_883375 ) ) ( not ( = ?auto_883369 ?auto_883376 ) ) ( not ( = ?auto_883370 ?auto_883371 ) ) ( not ( = ?auto_883370 ?auto_883372 ) ) ( not ( = ?auto_883370 ?auto_883373 ) ) ( not ( = ?auto_883370 ?auto_883374 ) ) ( not ( = ?auto_883370 ?auto_883375 ) ) ( not ( = ?auto_883370 ?auto_883376 ) ) ( not ( = ?auto_883371 ?auto_883372 ) ) ( not ( = ?auto_883371 ?auto_883373 ) ) ( not ( = ?auto_883371 ?auto_883374 ) ) ( not ( = ?auto_883371 ?auto_883375 ) ) ( not ( = ?auto_883371 ?auto_883376 ) ) ( not ( = ?auto_883372 ?auto_883373 ) ) ( not ( = ?auto_883372 ?auto_883374 ) ) ( not ( = ?auto_883372 ?auto_883375 ) ) ( not ( = ?auto_883372 ?auto_883376 ) ) ( not ( = ?auto_883373 ?auto_883374 ) ) ( not ( = ?auto_883373 ?auto_883375 ) ) ( not ( = ?auto_883373 ?auto_883376 ) ) ( not ( = ?auto_883374 ?auto_883375 ) ) ( not ( = ?auto_883374 ?auto_883376 ) ) ( not ( = ?auto_883375 ?auto_883376 ) ) ( ON ?auto_883374 ?auto_883375 ) ( ON ?auto_883373 ?auto_883374 ) ( CLEAR ?auto_883371 ) ( ON ?auto_883372 ?auto_883373 ) ( CLEAR ?auto_883372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_883363 ?auto_883364 ?auto_883365 ?auto_883366 ?auto_883367 ?auto_883368 ?auto_883369 ?auto_883370 ?auto_883371 ?auto_883372 )
      ( MAKE-13PILE ?auto_883363 ?auto_883364 ?auto_883365 ?auto_883366 ?auto_883367 ?auto_883368 ?auto_883369 ?auto_883370 ?auto_883371 ?auto_883372 ?auto_883373 ?auto_883374 ?auto_883375 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_883417 - BLOCK
      ?auto_883418 - BLOCK
      ?auto_883419 - BLOCK
      ?auto_883420 - BLOCK
      ?auto_883421 - BLOCK
      ?auto_883422 - BLOCK
      ?auto_883423 - BLOCK
      ?auto_883424 - BLOCK
      ?auto_883425 - BLOCK
      ?auto_883426 - BLOCK
      ?auto_883427 - BLOCK
      ?auto_883428 - BLOCK
      ?auto_883429 - BLOCK
    )
    :vars
    (
      ?auto_883430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883429 ?auto_883430 ) ( ON-TABLE ?auto_883417 ) ( ON ?auto_883418 ?auto_883417 ) ( ON ?auto_883419 ?auto_883418 ) ( ON ?auto_883420 ?auto_883419 ) ( ON ?auto_883421 ?auto_883420 ) ( ON ?auto_883422 ?auto_883421 ) ( ON ?auto_883423 ?auto_883422 ) ( ON ?auto_883424 ?auto_883423 ) ( not ( = ?auto_883417 ?auto_883418 ) ) ( not ( = ?auto_883417 ?auto_883419 ) ) ( not ( = ?auto_883417 ?auto_883420 ) ) ( not ( = ?auto_883417 ?auto_883421 ) ) ( not ( = ?auto_883417 ?auto_883422 ) ) ( not ( = ?auto_883417 ?auto_883423 ) ) ( not ( = ?auto_883417 ?auto_883424 ) ) ( not ( = ?auto_883417 ?auto_883425 ) ) ( not ( = ?auto_883417 ?auto_883426 ) ) ( not ( = ?auto_883417 ?auto_883427 ) ) ( not ( = ?auto_883417 ?auto_883428 ) ) ( not ( = ?auto_883417 ?auto_883429 ) ) ( not ( = ?auto_883417 ?auto_883430 ) ) ( not ( = ?auto_883418 ?auto_883419 ) ) ( not ( = ?auto_883418 ?auto_883420 ) ) ( not ( = ?auto_883418 ?auto_883421 ) ) ( not ( = ?auto_883418 ?auto_883422 ) ) ( not ( = ?auto_883418 ?auto_883423 ) ) ( not ( = ?auto_883418 ?auto_883424 ) ) ( not ( = ?auto_883418 ?auto_883425 ) ) ( not ( = ?auto_883418 ?auto_883426 ) ) ( not ( = ?auto_883418 ?auto_883427 ) ) ( not ( = ?auto_883418 ?auto_883428 ) ) ( not ( = ?auto_883418 ?auto_883429 ) ) ( not ( = ?auto_883418 ?auto_883430 ) ) ( not ( = ?auto_883419 ?auto_883420 ) ) ( not ( = ?auto_883419 ?auto_883421 ) ) ( not ( = ?auto_883419 ?auto_883422 ) ) ( not ( = ?auto_883419 ?auto_883423 ) ) ( not ( = ?auto_883419 ?auto_883424 ) ) ( not ( = ?auto_883419 ?auto_883425 ) ) ( not ( = ?auto_883419 ?auto_883426 ) ) ( not ( = ?auto_883419 ?auto_883427 ) ) ( not ( = ?auto_883419 ?auto_883428 ) ) ( not ( = ?auto_883419 ?auto_883429 ) ) ( not ( = ?auto_883419 ?auto_883430 ) ) ( not ( = ?auto_883420 ?auto_883421 ) ) ( not ( = ?auto_883420 ?auto_883422 ) ) ( not ( = ?auto_883420 ?auto_883423 ) ) ( not ( = ?auto_883420 ?auto_883424 ) ) ( not ( = ?auto_883420 ?auto_883425 ) ) ( not ( = ?auto_883420 ?auto_883426 ) ) ( not ( = ?auto_883420 ?auto_883427 ) ) ( not ( = ?auto_883420 ?auto_883428 ) ) ( not ( = ?auto_883420 ?auto_883429 ) ) ( not ( = ?auto_883420 ?auto_883430 ) ) ( not ( = ?auto_883421 ?auto_883422 ) ) ( not ( = ?auto_883421 ?auto_883423 ) ) ( not ( = ?auto_883421 ?auto_883424 ) ) ( not ( = ?auto_883421 ?auto_883425 ) ) ( not ( = ?auto_883421 ?auto_883426 ) ) ( not ( = ?auto_883421 ?auto_883427 ) ) ( not ( = ?auto_883421 ?auto_883428 ) ) ( not ( = ?auto_883421 ?auto_883429 ) ) ( not ( = ?auto_883421 ?auto_883430 ) ) ( not ( = ?auto_883422 ?auto_883423 ) ) ( not ( = ?auto_883422 ?auto_883424 ) ) ( not ( = ?auto_883422 ?auto_883425 ) ) ( not ( = ?auto_883422 ?auto_883426 ) ) ( not ( = ?auto_883422 ?auto_883427 ) ) ( not ( = ?auto_883422 ?auto_883428 ) ) ( not ( = ?auto_883422 ?auto_883429 ) ) ( not ( = ?auto_883422 ?auto_883430 ) ) ( not ( = ?auto_883423 ?auto_883424 ) ) ( not ( = ?auto_883423 ?auto_883425 ) ) ( not ( = ?auto_883423 ?auto_883426 ) ) ( not ( = ?auto_883423 ?auto_883427 ) ) ( not ( = ?auto_883423 ?auto_883428 ) ) ( not ( = ?auto_883423 ?auto_883429 ) ) ( not ( = ?auto_883423 ?auto_883430 ) ) ( not ( = ?auto_883424 ?auto_883425 ) ) ( not ( = ?auto_883424 ?auto_883426 ) ) ( not ( = ?auto_883424 ?auto_883427 ) ) ( not ( = ?auto_883424 ?auto_883428 ) ) ( not ( = ?auto_883424 ?auto_883429 ) ) ( not ( = ?auto_883424 ?auto_883430 ) ) ( not ( = ?auto_883425 ?auto_883426 ) ) ( not ( = ?auto_883425 ?auto_883427 ) ) ( not ( = ?auto_883425 ?auto_883428 ) ) ( not ( = ?auto_883425 ?auto_883429 ) ) ( not ( = ?auto_883425 ?auto_883430 ) ) ( not ( = ?auto_883426 ?auto_883427 ) ) ( not ( = ?auto_883426 ?auto_883428 ) ) ( not ( = ?auto_883426 ?auto_883429 ) ) ( not ( = ?auto_883426 ?auto_883430 ) ) ( not ( = ?auto_883427 ?auto_883428 ) ) ( not ( = ?auto_883427 ?auto_883429 ) ) ( not ( = ?auto_883427 ?auto_883430 ) ) ( not ( = ?auto_883428 ?auto_883429 ) ) ( not ( = ?auto_883428 ?auto_883430 ) ) ( not ( = ?auto_883429 ?auto_883430 ) ) ( ON ?auto_883428 ?auto_883429 ) ( ON ?auto_883427 ?auto_883428 ) ( ON ?auto_883426 ?auto_883427 ) ( CLEAR ?auto_883424 ) ( ON ?auto_883425 ?auto_883426 ) ( CLEAR ?auto_883425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_883417 ?auto_883418 ?auto_883419 ?auto_883420 ?auto_883421 ?auto_883422 ?auto_883423 ?auto_883424 ?auto_883425 )
      ( MAKE-13PILE ?auto_883417 ?auto_883418 ?auto_883419 ?auto_883420 ?auto_883421 ?auto_883422 ?auto_883423 ?auto_883424 ?auto_883425 ?auto_883426 ?auto_883427 ?auto_883428 ?auto_883429 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_883471 - BLOCK
      ?auto_883472 - BLOCK
      ?auto_883473 - BLOCK
      ?auto_883474 - BLOCK
      ?auto_883475 - BLOCK
      ?auto_883476 - BLOCK
      ?auto_883477 - BLOCK
      ?auto_883478 - BLOCK
      ?auto_883479 - BLOCK
      ?auto_883480 - BLOCK
      ?auto_883481 - BLOCK
      ?auto_883482 - BLOCK
      ?auto_883483 - BLOCK
    )
    :vars
    (
      ?auto_883484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883483 ?auto_883484 ) ( ON-TABLE ?auto_883471 ) ( ON ?auto_883472 ?auto_883471 ) ( ON ?auto_883473 ?auto_883472 ) ( ON ?auto_883474 ?auto_883473 ) ( ON ?auto_883475 ?auto_883474 ) ( ON ?auto_883476 ?auto_883475 ) ( ON ?auto_883477 ?auto_883476 ) ( not ( = ?auto_883471 ?auto_883472 ) ) ( not ( = ?auto_883471 ?auto_883473 ) ) ( not ( = ?auto_883471 ?auto_883474 ) ) ( not ( = ?auto_883471 ?auto_883475 ) ) ( not ( = ?auto_883471 ?auto_883476 ) ) ( not ( = ?auto_883471 ?auto_883477 ) ) ( not ( = ?auto_883471 ?auto_883478 ) ) ( not ( = ?auto_883471 ?auto_883479 ) ) ( not ( = ?auto_883471 ?auto_883480 ) ) ( not ( = ?auto_883471 ?auto_883481 ) ) ( not ( = ?auto_883471 ?auto_883482 ) ) ( not ( = ?auto_883471 ?auto_883483 ) ) ( not ( = ?auto_883471 ?auto_883484 ) ) ( not ( = ?auto_883472 ?auto_883473 ) ) ( not ( = ?auto_883472 ?auto_883474 ) ) ( not ( = ?auto_883472 ?auto_883475 ) ) ( not ( = ?auto_883472 ?auto_883476 ) ) ( not ( = ?auto_883472 ?auto_883477 ) ) ( not ( = ?auto_883472 ?auto_883478 ) ) ( not ( = ?auto_883472 ?auto_883479 ) ) ( not ( = ?auto_883472 ?auto_883480 ) ) ( not ( = ?auto_883472 ?auto_883481 ) ) ( not ( = ?auto_883472 ?auto_883482 ) ) ( not ( = ?auto_883472 ?auto_883483 ) ) ( not ( = ?auto_883472 ?auto_883484 ) ) ( not ( = ?auto_883473 ?auto_883474 ) ) ( not ( = ?auto_883473 ?auto_883475 ) ) ( not ( = ?auto_883473 ?auto_883476 ) ) ( not ( = ?auto_883473 ?auto_883477 ) ) ( not ( = ?auto_883473 ?auto_883478 ) ) ( not ( = ?auto_883473 ?auto_883479 ) ) ( not ( = ?auto_883473 ?auto_883480 ) ) ( not ( = ?auto_883473 ?auto_883481 ) ) ( not ( = ?auto_883473 ?auto_883482 ) ) ( not ( = ?auto_883473 ?auto_883483 ) ) ( not ( = ?auto_883473 ?auto_883484 ) ) ( not ( = ?auto_883474 ?auto_883475 ) ) ( not ( = ?auto_883474 ?auto_883476 ) ) ( not ( = ?auto_883474 ?auto_883477 ) ) ( not ( = ?auto_883474 ?auto_883478 ) ) ( not ( = ?auto_883474 ?auto_883479 ) ) ( not ( = ?auto_883474 ?auto_883480 ) ) ( not ( = ?auto_883474 ?auto_883481 ) ) ( not ( = ?auto_883474 ?auto_883482 ) ) ( not ( = ?auto_883474 ?auto_883483 ) ) ( not ( = ?auto_883474 ?auto_883484 ) ) ( not ( = ?auto_883475 ?auto_883476 ) ) ( not ( = ?auto_883475 ?auto_883477 ) ) ( not ( = ?auto_883475 ?auto_883478 ) ) ( not ( = ?auto_883475 ?auto_883479 ) ) ( not ( = ?auto_883475 ?auto_883480 ) ) ( not ( = ?auto_883475 ?auto_883481 ) ) ( not ( = ?auto_883475 ?auto_883482 ) ) ( not ( = ?auto_883475 ?auto_883483 ) ) ( not ( = ?auto_883475 ?auto_883484 ) ) ( not ( = ?auto_883476 ?auto_883477 ) ) ( not ( = ?auto_883476 ?auto_883478 ) ) ( not ( = ?auto_883476 ?auto_883479 ) ) ( not ( = ?auto_883476 ?auto_883480 ) ) ( not ( = ?auto_883476 ?auto_883481 ) ) ( not ( = ?auto_883476 ?auto_883482 ) ) ( not ( = ?auto_883476 ?auto_883483 ) ) ( not ( = ?auto_883476 ?auto_883484 ) ) ( not ( = ?auto_883477 ?auto_883478 ) ) ( not ( = ?auto_883477 ?auto_883479 ) ) ( not ( = ?auto_883477 ?auto_883480 ) ) ( not ( = ?auto_883477 ?auto_883481 ) ) ( not ( = ?auto_883477 ?auto_883482 ) ) ( not ( = ?auto_883477 ?auto_883483 ) ) ( not ( = ?auto_883477 ?auto_883484 ) ) ( not ( = ?auto_883478 ?auto_883479 ) ) ( not ( = ?auto_883478 ?auto_883480 ) ) ( not ( = ?auto_883478 ?auto_883481 ) ) ( not ( = ?auto_883478 ?auto_883482 ) ) ( not ( = ?auto_883478 ?auto_883483 ) ) ( not ( = ?auto_883478 ?auto_883484 ) ) ( not ( = ?auto_883479 ?auto_883480 ) ) ( not ( = ?auto_883479 ?auto_883481 ) ) ( not ( = ?auto_883479 ?auto_883482 ) ) ( not ( = ?auto_883479 ?auto_883483 ) ) ( not ( = ?auto_883479 ?auto_883484 ) ) ( not ( = ?auto_883480 ?auto_883481 ) ) ( not ( = ?auto_883480 ?auto_883482 ) ) ( not ( = ?auto_883480 ?auto_883483 ) ) ( not ( = ?auto_883480 ?auto_883484 ) ) ( not ( = ?auto_883481 ?auto_883482 ) ) ( not ( = ?auto_883481 ?auto_883483 ) ) ( not ( = ?auto_883481 ?auto_883484 ) ) ( not ( = ?auto_883482 ?auto_883483 ) ) ( not ( = ?auto_883482 ?auto_883484 ) ) ( not ( = ?auto_883483 ?auto_883484 ) ) ( ON ?auto_883482 ?auto_883483 ) ( ON ?auto_883481 ?auto_883482 ) ( ON ?auto_883480 ?auto_883481 ) ( ON ?auto_883479 ?auto_883480 ) ( CLEAR ?auto_883477 ) ( ON ?auto_883478 ?auto_883479 ) ( CLEAR ?auto_883478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_883471 ?auto_883472 ?auto_883473 ?auto_883474 ?auto_883475 ?auto_883476 ?auto_883477 ?auto_883478 )
      ( MAKE-13PILE ?auto_883471 ?auto_883472 ?auto_883473 ?auto_883474 ?auto_883475 ?auto_883476 ?auto_883477 ?auto_883478 ?auto_883479 ?auto_883480 ?auto_883481 ?auto_883482 ?auto_883483 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_883525 - BLOCK
      ?auto_883526 - BLOCK
      ?auto_883527 - BLOCK
      ?auto_883528 - BLOCK
      ?auto_883529 - BLOCK
      ?auto_883530 - BLOCK
      ?auto_883531 - BLOCK
      ?auto_883532 - BLOCK
      ?auto_883533 - BLOCK
      ?auto_883534 - BLOCK
      ?auto_883535 - BLOCK
      ?auto_883536 - BLOCK
      ?auto_883537 - BLOCK
    )
    :vars
    (
      ?auto_883538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883537 ?auto_883538 ) ( ON-TABLE ?auto_883525 ) ( ON ?auto_883526 ?auto_883525 ) ( ON ?auto_883527 ?auto_883526 ) ( ON ?auto_883528 ?auto_883527 ) ( ON ?auto_883529 ?auto_883528 ) ( ON ?auto_883530 ?auto_883529 ) ( not ( = ?auto_883525 ?auto_883526 ) ) ( not ( = ?auto_883525 ?auto_883527 ) ) ( not ( = ?auto_883525 ?auto_883528 ) ) ( not ( = ?auto_883525 ?auto_883529 ) ) ( not ( = ?auto_883525 ?auto_883530 ) ) ( not ( = ?auto_883525 ?auto_883531 ) ) ( not ( = ?auto_883525 ?auto_883532 ) ) ( not ( = ?auto_883525 ?auto_883533 ) ) ( not ( = ?auto_883525 ?auto_883534 ) ) ( not ( = ?auto_883525 ?auto_883535 ) ) ( not ( = ?auto_883525 ?auto_883536 ) ) ( not ( = ?auto_883525 ?auto_883537 ) ) ( not ( = ?auto_883525 ?auto_883538 ) ) ( not ( = ?auto_883526 ?auto_883527 ) ) ( not ( = ?auto_883526 ?auto_883528 ) ) ( not ( = ?auto_883526 ?auto_883529 ) ) ( not ( = ?auto_883526 ?auto_883530 ) ) ( not ( = ?auto_883526 ?auto_883531 ) ) ( not ( = ?auto_883526 ?auto_883532 ) ) ( not ( = ?auto_883526 ?auto_883533 ) ) ( not ( = ?auto_883526 ?auto_883534 ) ) ( not ( = ?auto_883526 ?auto_883535 ) ) ( not ( = ?auto_883526 ?auto_883536 ) ) ( not ( = ?auto_883526 ?auto_883537 ) ) ( not ( = ?auto_883526 ?auto_883538 ) ) ( not ( = ?auto_883527 ?auto_883528 ) ) ( not ( = ?auto_883527 ?auto_883529 ) ) ( not ( = ?auto_883527 ?auto_883530 ) ) ( not ( = ?auto_883527 ?auto_883531 ) ) ( not ( = ?auto_883527 ?auto_883532 ) ) ( not ( = ?auto_883527 ?auto_883533 ) ) ( not ( = ?auto_883527 ?auto_883534 ) ) ( not ( = ?auto_883527 ?auto_883535 ) ) ( not ( = ?auto_883527 ?auto_883536 ) ) ( not ( = ?auto_883527 ?auto_883537 ) ) ( not ( = ?auto_883527 ?auto_883538 ) ) ( not ( = ?auto_883528 ?auto_883529 ) ) ( not ( = ?auto_883528 ?auto_883530 ) ) ( not ( = ?auto_883528 ?auto_883531 ) ) ( not ( = ?auto_883528 ?auto_883532 ) ) ( not ( = ?auto_883528 ?auto_883533 ) ) ( not ( = ?auto_883528 ?auto_883534 ) ) ( not ( = ?auto_883528 ?auto_883535 ) ) ( not ( = ?auto_883528 ?auto_883536 ) ) ( not ( = ?auto_883528 ?auto_883537 ) ) ( not ( = ?auto_883528 ?auto_883538 ) ) ( not ( = ?auto_883529 ?auto_883530 ) ) ( not ( = ?auto_883529 ?auto_883531 ) ) ( not ( = ?auto_883529 ?auto_883532 ) ) ( not ( = ?auto_883529 ?auto_883533 ) ) ( not ( = ?auto_883529 ?auto_883534 ) ) ( not ( = ?auto_883529 ?auto_883535 ) ) ( not ( = ?auto_883529 ?auto_883536 ) ) ( not ( = ?auto_883529 ?auto_883537 ) ) ( not ( = ?auto_883529 ?auto_883538 ) ) ( not ( = ?auto_883530 ?auto_883531 ) ) ( not ( = ?auto_883530 ?auto_883532 ) ) ( not ( = ?auto_883530 ?auto_883533 ) ) ( not ( = ?auto_883530 ?auto_883534 ) ) ( not ( = ?auto_883530 ?auto_883535 ) ) ( not ( = ?auto_883530 ?auto_883536 ) ) ( not ( = ?auto_883530 ?auto_883537 ) ) ( not ( = ?auto_883530 ?auto_883538 ) ) ( not ( = ?auto_883531 ?auto_883532 ) ) ( not ( = ?auto_883531 ?auto_883533 ) ) ( not ( = ?auto_883531 ?auto_883534 ) ) ( not ( = ?auto_883531 ?auto_883535 ) ) ( not ( = ?auto_883531 ?auto_883536 ) ) ( not ( = ?auto_883531 ?auto_883537 ) ) ( not ( = ?auto_883531 ?auto_883538 ) ) ( not ( = ?auto_883532 ?auto_883533 ) ) ( not ( = ?auto_883532 ?auto_883534 ) ) ( not ( = ?auto_883532 ?auto_883535 ) ) ( not ( = ?auto_883532 ?auto_883536 ) ) ( not ( = ?auto_883532 ?auto_883537 ) ) ( not ( = ?auto_883532 ?auto_883538 ) ) ( not ( = ?auto_883533 ?auto_883534 ) ) ( not ( = ?auto_883533 ?auto_883535 ) ) ( not ( = ?auto_883533 ?auto_883536 ) ) ( not ( = ?auto_883533 ?auto_883537 ) ) ( not ( = ?auto_883533 ?auto_883538 ) ) ( not ( = ?auto_883534 ?auto_883535 ) ) ( not ( = ?auto_883534 ?auto_883536 ) ) ( not ( = ?auto_883534 ?auto_883537 ) ) ( not ( = ?auto_883534 ?auto_883538 ) ) ( not ( = ?auto_883535 ?auto_883536 ) ) ( not ( = ?auto_883535 ?auto_883537 ) ) ( not ( = ?auto_883535 ?auto_883538 ) ) ( not ( = ?auto_883536 ?auto_883537 ) ) ( not ( = ?auto_883536 ?auto_883538 ) ) ( not ( = ?auto_883537 ?auto_883538 ) ) ( ON ?auto_883536 ?auto_883537 ) ( ON ?auto_883535 ?auto_883536 ) ( ON ?auto_883534 ?auto_883535 ) ( ON ?auto_883533 ?auto_883534 ) ( ON ?auto_883532 ?auto_883533 ) ( CLEAR ?auto_883530 ) ( ON ?auto_883531 ?auto_883532 ) ( CLEAR ?auto_883531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_883525 ?auto_883526 ?auto_883527 ?auto_883528 ?auto_883529 ?auto_883530 ?auto_883531 )
      ( MAKE-13PILE ?auto_883525 ?auto_883526 ?auto_883527 ?auto_883528 ?auto_883529 ?auto_883530 ?auto_883531 ?auto_883532 ?auto_883533 ?auto_883534 ?auto_883535 ?auto_883536 ?auto_883537 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_883579 - BLOCK
      ?auto_883580 - BLOCK
      ?auto_883581 - BLOCK
      ?auto_883582 - BLOCK
      ?auto_883583 - BLOCK
      ?auto_883584 - BLOCK
      ?auto_883585 - BLOCK
      ?auto_883586 - BLOCK
      ?auto_883587 - BLOCK
      ?auto_883588 - BLOCK
      ?auto_883589 - BLOCK
      ?auto_883590 - BLOCK
      ?auto_883591 - BLOCK
    )
    :vars
    (
      ?auto_883592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883591 ?auto_883592 ) ( ON-TABLE ?auto_883579 ) ( ON ?auto_883580 ?auto_883579 ) ( ON ?auto_883581 ?auto_883580 ) ( ON ?auto_883582 ?auto_883581 ) ( ON ?auto_883583 ?auto_883582 ) ( not ( = ?auto_883579 ?auto_883580 ) ) ( not ( = ?auto_883579 ?auto_883581 ) ) ( not ( = ?auto_883579 ?auto_883582 ) ) ( not ( = ?auto_883579 ?auto_883583 ) ) ( not ( = ?auto_883579 ?auto_883584 ) ) ( not ( = ?auto_883579 ?auto_883585 ) ) ( not ( = ?auto_883579 ?auto_883586 ) ) ( not ( = ?auto_883579 ?auto_883587 ) ) ( not ( = ?auto_883579 ?auto_883588 ) ) ( not ( = ?auto_883579 ?auto_883589 ) ) ( not ( = ?auto_883579 ?auto_883590 ) ) ( not ( = ?auto_883579 ?auto_883591 ) ) ( not ( = ?auto_883579 ?auto_883592 ) ) ( not ( = ?auto_883580 ?auto_883581 ) ) ( not ( = ?auto_883580 ?auto_883582 ) ) ( not ( = ?auto_883580 ?auto_883583 ) ) ( not ( = ?auto_883580 ?auto_883584 ) ) ( not ( = ?auto_883580 ?auto_883585 ) ) ( not ( = ?auto_883580 ?auto_883586 ) ) ( not ( = ?auto_883580 ?auto_883587 ) ) ( not ( = ?auto_883580 ?auto_883588 ) ) ( not ( = ?auto_883580 ?auto_883589 ) ) ( not ( = ?auto_883580 ?auto_883590 ) ) ( not ( = ?auto_883580 ?auto_883591 ) ) ( not ( = ?auto_883580 ?auto_883592 ) ) ( not ( = ?auto_883581 ?auto_883582 ) ) ( not ( = ?auto_883581 ?auto_883583 ) ) ( not ( = ?auto_883581 ?auto_883584 ) ) ( not ( = ?auto_883581 ?auto_883585 ) ) ( not ( = ?auto_883581 ?auto_883586 ) ) ( not ( = ?auto_883581 ?auto_883587 ) ) ( not ( = ?auto_883581 ?auto_883588 ) ) ( not ( = ?auto_883581 ?auto_883589 ) ) ( not ( = ?auto_883581 ?auto_883590 ) ) ( not ( = ?auto_883581 ?auto_883591 ) ) ( not ( = ?auto_883581 ?auto_883592 ) ) ( not ( = ?auto_883582 ?auto_883583 ) ) ( not ( = ?auto_883582 ?auto_883584 ) ) ( not ( = ?auto_883582 ?auto_883585 ) ) ( not ( = ?auto_883582 ?auto_883586 ) ) ( not ( = ?auto_883582 ?auto_883587 ) ) ( not ( = ?auto_883582 ?auto_883588 ) ) ( not ( = ?auto_883582 ?auto_883589 ) ) ( not ( = ?auto_883582 ?auto_883590 ) ) ( not ( = ?auto_883582 ?auto_883591 ) ) ( not ( = ?auto_883582 ?auto_883592 ) ) ( not ( = ?auto_883583 ?auto_883584 ) ) ( not ( = ?auto_883583 ?auto_883585 ) ) ( not ( = ?auto_883583 ?auto_883586 ) ) ( not ( = ?auto_883583 ?auto_883587 ) ) ( not ( = ?auto_883583 ?auto_883588 ) ) ( not ( = ?auto_883583 ?auto_883589 ) ) ( not ( = ?auto_883583 ?auto_883590 ) ) ( not ( = ?auto_883583 ?auto_883591 ) ) ( not ( = ?auto_883583 ?auto_883592 ) ) ( not ( = ?auto_883584 ?auto_883585 ) ) ( not ( = ?auto_883584 ?auto_883586 ) ) ( not ( = ?auto_883584 ?auto_883587 ) ) ( not ( = ?auto_883584 ?auto_883588 ) ) ( not ( = ?auto_883584 ?auto_883589 ) ) ( not ( = ?auto_883584 ?auto_883590 ) ) ( not ( = ?auto_883584 ?auto_883591 ) ) ( not ( = ?auto_883584 ?auto_883592 ) ) ( not ( = ?auto_883585 ?auto_883586 ) ) ( not ( = ?auto_883585 ?auto_883587 ) ) ( not ( = ?auto_883585 ?auto_883588 ) ) ( not ( = ?auto_883585 ?auto_883589 ) ) ( not ( = ?auto_883585 ?auto_883590 ) ) ( not ( = ?auto_883585 ?auto_883591 ) ) ( not ( = ?auto_883585 ?auto_883592 ) ) ( not ( = ?auto_883586 ?auto_883587 ) ) ( not ( = ?auto_883586 ?auto_883588 ) ) ( not ( = ?auto_883586 ?auto_883589 ) ) ( not ( = ?auto_883586 ?auto_883590 ) ) ( not ( = ?auto_883586 ?auto_883591 ) ) ( not ( = ?auto_883586 ?auto_883592 ) ) ( not ( = ?auto_883587 ?auto_883588 ) ) ( not ( = ?auto_883587 ?auto_883589 ) ) ( not ( = ?auto_883587 ?auto_883590 ) ) ( not ( = ?auto_883587 ?auto_883591 ) ) ( not ( = ?auto_883587 ?auto_883592 ) ) ( not ( = ?auto_883588 ?auto_883589 ) ) ( not ( = ?auto_883588 ?auto_883590 ) ) ( not ( = ?auto_883588 ?auto_883591 ) ) ( not ( = ?auto_883588 ?auto_883592 ) ) ( not ( = ?auto_883589 ?auto_883590 ) ) ( not ( = ?auto_883589 ?auto_883591 ) ) ( not ( = ?auto_883589 ?auto_883592 ) ) ( not ( = ?auto_883590 ?auto_883591 ) ) ( not ( = ?auto_883590 ?auto_883592 ) ) ( not ( = ?auto_883591 ?auto_883592 ) ) ( ON ?auto_883590 ?auto_883591 ) ( ON ?auto_883589 ?auto_883590 ) ( ON ?auto_883588 ?auto_883589 ) ( ON ?auto_883587 ?auto_883588 ) ( ON ?auto_883586 ?auto_883587 ) ( ON ?auto_883585 ?auto_883586 ) ( CLEAR ?auto_883583 ) ( ON ?auto_883584 ?auto_883585 ) ( CLEAR ?auto_883584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_883579 ?auto_883580 ?auto_883581 ?auto_883582 ?auto_883583 ?auto_883584 )
      ( MAKE-13PILE ?auto_883579 ?auto_883580 ?auto_883581 ?auto_883582 ?auto_883583 ?auto_883584 ?auto_883585 ?auto_883586 ?auto_883587 ?auto_883588 ?auto_883589 ?auto_883590 ?auto_883591 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_883633 - BLOCK
      ?auto_883634 - BLOCK
      ?auto_883635 - BLOCK
      ?auto_883636 - BLOCK
      ?auto_883637 - BLOCK
      ?auto_883638 - BLOCK
      ?auto_883639 - BLOCK
      ?auto_883640 - BLOCK
      ?auto_883641 - BLOCK
      ?auto_883642 - BLOCK
      ?auto_883643 - BLOCK
      ?auto_883644 - BLOCK
      ?auto_883645 - BLOCK
    )
    :vars
    (
      ?auto_883646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883645 ?auto_883646 ) ( ON-TABLE ?auto_883633 ) ( ON ?auto_883634 ?auto_883633 ) ( ON ?auto_883635 ?auto_883634 ) ( ON ?auto_883636 ?auto_883635 ) ( not ( = ?auto_883633 ?auto_883634 ) ) ( not ( = ?auto_883633 ?auto_883635 ) ) ( not ( = ?auto_883633 ?auto_883636 ) ) ( not ( = ?auto_883633 ?auto_883637 ) ) ( not ( = ?auto_883633 ?auto_883638 ) ) ( not ( = ?auto_883633 ?auto_883639 ) ) ( not ( = ?auto_883633 ?auto_883640 ) ) ( not ( = ?auto_883633 ?auto_883641 ) ) ( not ( = ?auto_883633 ?auto_883642 ) ) ( not ( = ?auto_883633 ?auto_883643 ) ) ( not ( = ?auto_883633 ?auto_883644 ) ) ( not ( = ?auto_883633 ?auto_883645 ) ) ( not ( = ?auto_883633 ?auto_883646 ) ) ( not ( = ?auto_883634 ?auto_883635 ) ) ( not ( = ?auto_883634 ?auto_883636 ) ) ( not ( = ?auto_883634 ?auto_883637 ) ) ( not ( = ?auto_883634 ?auto_883638 ) ) ( not ( = ?auto_883634 ?auto_883639 ) ) ( not ( = ?auto_883634 ?auto_883640 ) ) ( not ( = ?auto_883634 ?auto_883641 ) ) ( not ( = ?auto_883634 ?auto_883642 ) ) ( not ( = ?auto_883634 ?auto_883643 ) ) ( not ( = ?auto_883634 ?auto_883644 ) ) ( not ( = ?auto_883634 ?auto_883645 ) ) ( not ( = ?auto_883634 ?auto_883646 ) ) ( not ( = ?auto_883635 ?auto_883636 ) ) ( not ( = ?auto_883635 ?auto_883637 ) ) ( not ( = ?auto_883635 ?auto_883638 ) ) ( not ( = ?auto_883635 ?auto_883639 ) ) ( not ( = ?auto_883635 ?auto_883640 ) ) ( not ( = ?auto_883635 ?auto_883641 ) ) ( not ( = ?auto_883635 ?auto_883642 ) ) ( not ( = ?auto_883635 ?auto_883643 ) ) ( not ( = ?auto_883635 ?auto_883644 ) ) ( not ( = ?auto_883635 ?auto_883645 ) ) ( not ( = ?auto_883635 ?auto_883646 ) ) ( not ( = ?auto_883636 ?auto_883637 ) ) ( not ( = ?auto_883636 ?auto_883638 ) ) ( not ( = ?auto_883636 ?auto_883639 ) ) ( not ( = ?auto_883636 ?auto_883640 ) ) ( not ( = ?auto_883636 ?auto_883641 ) ) ( not ( = ?auto_883636 ?auto_883642 ) ) ( not ( = ?auto_883636 ?auto_883643 ) ) ( not ( = ?auto_883636 ?auto_883644 ) ) ( not ( = ?auto_883636 ?auto_883645 ) ) ( not ( = ?auto_883636 ?auto_883646 ) ) ( not ( = ?auto_883637 ?auto_883638 ) ) ( not ( = ?auto_883637 ?auto_883639 ) ) ( not ( = ?auto_883637 ?auto_883640 ) ) ( not ( = ?auto_883637 ?auto_883641 ) ) ( not ( = ?auto_883637 ?auto_883642 ) ) ( not ( = ?auto_883637 ?auto_883643 ) ) ( not ( = ?auto_883637 ?auto_883644 ) ) ( not ( = ?auto_883637 ?auto_883645 ) ) ( not ( = ?auto_883637 ?auto_883646 ) ) ( not ( = ?auto_883638 ?auto_883639 ) ) ( not ( = ?auto_883638 ?auto_883640 ) ) ( not ( = ?auto_883638 ?auto_883641 ) ) ( not ( = ?auto_883638 ?auto_883642 ) ) ( not ( = ?auto_883638 ?auto_883643 ) ) ( not ( = ?auto_883638 ?auto_883644 ) ) ( not ( = ?auto_883638 ?auto_883645 ) ) ( not ( = ?auto_883638 ?auto_883646 ) ) ( not ( = ?auto_883639 ?auto_883640 ) ) ( not ( = ?auto_883639 ?auto_883641 ) ) ( not ( = ?auto_883639 ?auto_883642 ) ) ( not ( = ?auto_883639 ?auto_883643 ) ) ( not ( = ?auto_883639 ?auto_883644 ) ) ( not ( = ?auto_883639 ?auto_883645 ) ) ( not ( = ?auto_883639 ?auto_883646 ) ) ( not ( = ?auto_883640 ?auto_883641 ) ) ( not ( = ?auto_883640 ?auto_883642 ) ) ( not ( = ?auto_883640 ?auto_883643 ) ) ( not ( = ?auto_883640 ?auto_883644 ) ) ( not ( = ?auto_883640 ?auto_883645 ) ) ( not ( = ?auto_883640 ?auto_883646 ) ) ( not ( = ?auto_883641 ?auto_883642 ) ) ( not ( = ?auto_883641 ?auto_883643 ) ) ( not ( = ?auto_883641 ?auto_883644 ) ) ( not ( = ?auto_883641 ?auto_883645 ) ) ( not ( = ?auto_883641 ?auto_883646 ) ) ( not ( = ?auto_883642 ?auto_883643 ) ) ( not ( = ?auto_883642 ?auto_883644 ) ) ( not ( = ?auto_883642 ?auto_883645 ) ) ( not ( = ?auto_883642 ?auto_883646 ) ) ( not ( = ?auto_883643 ?auto_883644 ) ) ( not ( = ?auto_883643 ?auto_883645 ) ) ( not ( = ?auto_883643 ?auto_883646 ) ) ( not ( = ?auto_883644 ?auto_883645 ) ) ( not ( = ?auto_883644 ?auto_883646 ) ) ( not ( = ?auto_883645 ?auto_883646 ) ) ( ON ?auto_883644 ?auto_883645 ) ( ON ?auto_883643 ?auto_883644 ) ( ON ?auto_883642 ?auto_883643 ) ( ON ?auto_883641 ?auto_883642 ) ( ON ?auto_883640 ?auto_883641 ) ( ON ?auto_883639 ?auto_883640 ) ( ON ?auto_883638 ?auto_883639 ) ( CLEAR ?auto_883636 ) ( ON ?auto_883637 ?auto_883638 ) ( CLEAR ?auto_883637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_883633 ?auto_883634 ?auto_883635 ?auto_883636 ?auto_883637 )
      ( MAKE-13PILE ?auto_883633 ?auto_883634 ?auto_883635 ?auto_883636 ?auto_883637 ?auto_883638 ?auto_883639 ?auto_883640 ?auto_883641 ?auto_883642 ?auto_883643 ?auto_883644 ?auto_883645 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_883687 - BLOCK
      ?auto_883688 - BLOCK
      ?auto_883689 - BLOCK
      ?auto_883690 - BLOCK
      ?auto_883691 - BLOCK
      ?auto_883692 - BLOCK
      ?auto_883693 - BLOCK
      ?auto_883694 - BLOCK
      ?auto_883695 - BLOCK
      ?auto_883696 - BLOCK
      ?auto_883697 - BLOCK
      ?auto_883698 - BLOCK
      ?auto_883699 - BLOCK
    )
    :vars
    (
      ?auto_883700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883699 ?auto_883700 ) ( ON-TABLE ?auto_883687 ) ( ON ?auto_883688 ?auto_883687 ) ( ON ?auto_883689 ?auto_883688 ) ( not ( = ?auto_883687 ?auto_883688 ) ) ( not ( = ?auto_883687 ?auto_883689 ) ) ( not ( = ?auto_883687 ?auto_883690 ) ) ( not ( = ?auto_883687 ?auto_883691 ) ) ( not ( = ?auto_883687 ?auto_883692 ) ) ( not ( = ?auto_883687 ?auto_883693 ) ) ( not ( = ?auto_883687 ?auto_883694 ) ) ( not ( = ?auto_883687 ?auto_883695 ) ) ( not ( = ?auto_883687 ?auto_883696 ) ) ( not ( = ?auto_883687 ?auto_883697 ) ) ( not ( = ?auto_883687 ?auto_883698 ) ) ( not ( = ?auto_883687 ?auto_883699 ) ) ( not ( = ?auto_883687 ?auto_883700 ) ) ( not ( = ?auto_883688 ?auto_883689 ) ) ( not ( = ?auto_883688 ?auto_883690 ) ) ( not ( = ?auto_883688 ?auto_883691 ) ) ( not ( = ?auto_883688 ?auto_883692 ) ) ( not ( = ?auto_883688 ?auto_883693 ) ) ( not ( = ?auto_883688 ?auto_883694 ) ) ( not ( = ?auto_883688 ?auto_883695 ) ) ( not ( = ?auto_883688 ?auto_883696 ) ) ( not ( = ?auto_883688 ?auto_883697 ) ) ( not ( = ?auto_883688 ?auto_883698 ) ) ( not ( = ?auto_883688 ?auto_883699 ) ) ( not ( = ?auto_883688 ?auto_883700 ) ) ( not ( = ?auto_883689 ?auto_883690 ) ) ( not ( = ?auto_883689 ?auto_883691 ) ) ( not ( = ?auto_883689 ?auto_883692 ) ) ( not ( = ?auto_883689 ?auto_883693 ) ) ( not ( = ?auto_883689 ?auto_883694 ) ) ( not ( = ?auto_883689 ?auto_883695 ) ) ( not ( = ?auto_883689 ?auto_883696 ) ) ( not ( = ?auto_883689 ?auto_883697 ) ) ( not ( = ?auto_883689 ?auto_883698 ) ) ( not ( = ?auto_883689 ?auto_883699 ) ) ( not ( = ?auto_883689 ?auto_883700 ) ) ( not ( = ?auto_883690 ?auto_883691 ) ) ( not ( = ?auto_883690 ?auto_883692 ) ) ( not ( = ?auto_883690 ?auto_883693 ) ) ( not ( = ?auto_883690 ?auto_883694 ) ) ( not ( = ?auto_883690 ?auto_883695 ) ) ( not ( = ?auto_883690 ?auto_883696 ) ) ( not ( = ?auto_883690 ?auto_883697 ) ) ( not ( = ?auto_883690 ?auto_883698 ) ) ( not ( = ?auto_883690 ?auto_883699 ) ) ( not ( = ?auto_883690 ?auto_883700 ) ) ( not ( = ?auto_883691 ?auto_883692 ) ) ( not ( = ?auto_883691 ?auto_883693 ) ) ( not ( = ?auto_883691 ?auto_883694 ) ) ( not ( = ?auto_883691 ?auto_883695 ) ) ( not ( = ?auto_883691 ?auto_883696 ) ) ( not ( = ?auto_883691 ?auto_883697 ) ) ( not ( = ?auto_883691 ?auto_883698 ) ) ( not ( = ?auto_883691 ?auto_883699 ) ) ( not ( = ?auto_883691 ?auto_883700 ) ) ( not ( = ?auto_883692 ?auto_883693 ) ) ( not ( = ?auto_883692 ?auto_883694 ) ) ( not ( = ?auto_883692 ?auto_883695 ) ) ( not ( = ?auto_883692 ?auto_883696 ) ) ( not ( = ?auto_883692 ?auto_883697 ) ) ( not ( = ?auto_883692 ?auto_883698 ) ) ( not ( = ?auto_883692 ?auto_883699 ) ) ( not ( = ?auto_883692 ?auto_883700 ) ) ( not ( = ?auto_883693 ?auto_883694 ) ) ( not ( = ?auto_883693 ?auto_883695 ) ) ( not ( = ?auto_883693 ?auto_883696 ) ) ( not ( = ?auto_883693 ?auto_883697 ) ) ( not ( = ?auto_883693 ?auto_883698 ) ) ( not ( = ?auto_883693 ?auto_883699 ) ) ( not ( = ?auto_883693 ?auto_883700 ) ) ( not ( = ?auto_883694 ?auto_883695 ) ) ( not ( = ?auto_883694 ?auto_883696 ) ) ( not ( = ?auto_883694 ?auto_883697 ) ) ( not ( = ?auto_883694 ?auto_883698 ) ) ( not ( = ?auto_883694 ?auto_883699 ) ) ( not ( = ?auto_883694 ?auto_883700 ) ) ( not ( = ?auto_883695 ?auto_883696 ) ) ( not ( = ?auto_883695 ?auto_883697 ) ) ( not ( = ?auto_883695 ?auto_883698 ) ) ( not ( = ?auto_883695 ?auto_883699 ) ) ( not ( = ?auto_883695 ?auto_883700 ) ) ( not ( = ?auto_883696 ?auto_883697 ) ) ( not ( = ?auto_883696 ?auto_883698 ) ) ( not ( = ?auto_883696 ?auto_883699 ) ) ( not ( = ?auto_883696 ?auto_883700 ) ) ( not ( = ?auto_883697 ?auto_883698 ) ) ( not ( = ?auto_883697 ?auto_883699 ) ) ( not ( = ?auto_883697 ?auto_883700 ) ) ( not ( = ?auto_883698 ?auto_883699 ) ) ( not ( = ?auto_883698 ?auto_883700 ) ) ( not ( = ?auto_883699 ?auto_883700 ) ) ( ON ?auto_883698 ?auto_883699 ) ( ON ?auto_883697 ?auto_883698 ) ( ON ?auto_883696 ?auto_883697 ) ( ON ?auto_883695 ?auto_883696 ) ( ON ?auto_883694 ?auto_883695 ) ( ON ?auto_883693 ?auto_883694 ) ( ON ?auto_883692 ?auto_883693 ) ( ON ?auto_883691 ?auto_883692 ) ( CLEAR ?auto_883689 ) ( ON ?auto_883690 ?auto_883691 ) ( CLEAR ?auto_883690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_883687 ?auto_883688 ?auto_883689 ?auto_883690 )
      ( MAKE-13PILE ?auto_883687 ?auto_883688 ?auto_883689 ?auto_883690 ?auto_883691 ?auto_883692 ?auto_883693 ?auto_883694 ?auto_883695 ?auto_883696 ?auto_883697 ?auto_883698 ?auto_883699 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_883741 - BLOCK
      ?auto_883742 - BLOCK
      ?auto_883743 - BLOCK
      ?auto_883744 - BLOCK
      ?auto_883745 - BLOCK
      ?auto_883746 - BLOCK
      ?auto_883747 - BLOCK
      ?auto_883748 - BLOCK
      ?auto_883749 - BLOCK
      ?auto_883750 - BLOCK
      ?auto_883751 - BLOCK
      ?auto_883752 - BLOCK
      ?auto_883753 - BLOCK
    )
    :vars
    (
      ?auto_883754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883753 ?auto_883754 ) ( ON-TABLE ?auto_883741 ) ( ON ?auto_883742 ?auto_883741 ) ( not ( = ?auto_883741 ?auto_883742 ) ) ( not ( = ?auto_883741 ?auto_883743 ) ) ( not ( = ?auto_883741 ?auto_883744 ) ) ( not ( = ?auto_883741 ?auto_883745 ) ) ( not ( = ?auto_883741 ?auto_883746 ) ) ( not ( = ?auto_883741 ?auto_883747 ) ) ( not ( = ?auto_883741 ?auto_883748 ) ) ( not ( = ?auto_883741 ?auto_883749 ) ) ( not ( = ?auto_883741 ?auto_883750 ) ) ( not ( = ?auto_883741 ?auto_883751 ) ) ( not ( = ?auto_883741 ?auto_883752 ) ) ( not ( = ?auto_883741 ?auto_883753 ) ) ( not ( = ?auto_883741 ?auto_883754 ) ) ( not ( = ?auto_883742 ?auto_883743 ) ) ( not ( = ?auto_883742 ?auto_883744 ) ) ( not ( = ?auto_883742 ?auto_883745 ) ) ( not ( = ?auto_883742 ?auto_883746 ) ) ( not ( = ?auto_883742 ?auto_883747 ) ) ( not ( = ?auto_883742 ?auto_883748 ) ) ( not ( = ?auto_883742 ?auto_883749 ) ) ( not ( = ?auto_883742 ?auto_883750 ) ) ( not ( = ?auto_883742 ?auto_883751 ) ) ( not ( = ?auto_883742 ?auto_883752 ) ) ( not ( = ?auto_883742 ?auto_883753 ) ) ( not ( = ?auto_883742 ?auto_883754 ) ) ( not ( = ?auto_883743 ?auto_883744 ) ) ( not ( = ?auto_883743 ?auto_883745 ) ) ( not ( = ?auto_883743 ?auto_883746 ) ) ( not ( = ?auto_883743 ?auto_883747 ) ) ( not ( = ?auto_883743 ?auto_883748 ) ) ( not ( = ?auto_883743 ?auto_883749 ) ) ( not ( = ?auto_883743 ?auto_883750 ) ) ( not ( = ?auto_883743 ?auto_883751 ) ) ( not ( = ?auto_883743 ?auto_883752 ) ) ( not ( = ?auto_883743 ?auto_883753 ) ) ( not ( = ?auto_883743 ?auto_883754 ) ) ( not ( = ?auto_883744 ?auto_883745 ) ) ( not ( = ?auto_883744 ?auto_883746 ) ) ( not ( = ?auto_883744 ?auto_883747 ) ) ( not ( = ?auto_883744 ?auto_883748 ) ) ( not ( = ?auto_883744 ?auto_883749 ) ) ( not ( = ?auto_883744 ?auto_883750 ) ) ( not ( = ?auto_883744 ?auto_883751 ) ) ( not ( = ?auto_883744 ?auto_883752 ) ) ( not ( = ?auto_883744 ?auto_883753 ) ) ( not ( = ?auto_883744 ?auto_883754 ) ) ( not ( = ?auto_883745 ?auto_883746 ) ) ( not ( = ?auto_883745 ?auto_883747 ) ) ( not ( = ?auto_883745 ?auto_883748 ) ) ( not ( = ?auto_883745 ?auto_883749 ) ) ( not ( = ?auto_883745 ?auto_883750 ) ) ( not ( = ?auto_883745 ?auto_883751 ) ) ( not ( = ?auto_883745 ?auto_883752 ) ) ( not ( = ?auto_883745 ?auto_883753 ) ) ( not ( = ?auto_883745 ?auto_883754 ) ) ( not ( = ?auto_883746 ?auto_883747 ) ) ( not ( = ?auto_883746 ?auto_883748 ) ) ( not ( = ?auto_883746 ?auto_883749 ) ) ( not ( = ?auto_883746 ?auto_883750 ) ) ( not ( = ?auto_883746 ?auto_883751 ) ) ( not ( = ?auto_883746 ?auto_883752 ) ) ( not ( = ?auto_883746 ?auto_883753 ) ) ( not ( = ?auto_883746 ?auto_883754 ) ) ( not ( = ?auto_883747 ?auto_883748 ) ) ( not ( = ?auto_883747 ?auto_883749 ) ) ( not ( = ?auto_883747 ?auto_883750 ) ) ( not ( = ?auto_883747 ?auto_883751 ) ) ( not ( = ?auto_883747 ?auto_883752 ) ) ( not ( = ?auto_883747 ?auto_883753 ) ) ( not ( = ?auto_883747 ?auto_883754 ) ) ( not ( = ?auto_883748 ?auto_883749 ) ) ( not ( = ?auto_883748 ?auto_883750 ) ) ( not ( = ?auto_883748 ?auto_883751 ) ) ( not ( = ?auto_883748 ?auto_883752 ) ) ( not ( = ?auto_883748 ?auto_883753 ) ) ( not ( = ?auto_883748 ?auto_883754 ) ) ( not ( = ?auto_883749 ?auto_883750 ) ) ( not ( = ?auto_883749 ?auto_883751 ) ) ( not ( = ?auto_883749 ?auto_883752 ) ) ( not ( = ?auto_883749 ?auto_883753 ) ) ( not ( = ?auto_883749 ?auto_883754 ) ) ( not ( = ?auto_883750 ?auto_883751 ) ) ( not ( = ?auto_883750 ?auto_883752 ) ) ( not ( = ?auto_883750 ?auto_883753 ) ) ( not ( = ?auto_883750 ?auto_883754 ) ) ( not ( = ?auto_883751 ?auto_883752 ) ) ( not ( = ?auto_883751 ?auto_883753 ) ) ( not ( = ?auto_883751 ?auto_883754 ) ) ( not ( = ?auto_883752 ?auto_883753 ) ) ( not ( = ?auto_883752 ?auto_883754 ) ) ( not ( = ?auto_883753 ?auto_883754 ) ) ( ON ?auto_883752 ?auto_883753 ) ( ON ?auto_883751 ?auto_883752 ) ( ON ?auto_883750 ?auto_883751 ) ( ON ?auto_883749 ?auto_883750 ) ( ON ?auto_883748 ?auto_883749 ) ( ON ?auto_883747 ?auto_883748 ) ( ON ?auto_883746 ?auto_883747 ) ( ON ?auto_883745 ?auto_883746 ) ( ON ?auto_883744 ?auto_883745 ) ( CLEAR ?auto_883742 ) ( ON ?auto_883743 ?auto_883744 ) ( CLEAR ?auto_883743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_883741 ?auto_883742 ?auto_883743 )
      ( MAKE-13PILE ?auto_883741 ?auto_883742 ?auto_883743 ?auto_883744 ?auto_883745 ?auto_883746 ?auto_883747 ?auto_883748 ?auto_883749 ?auto_883750 ?auto_883751 ?auto_883752 ?auto_883753 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_883795 - BLOCK
      ?auto_883796 - BLOCK
      ?auto_883797 - BLOCK
      ?auto_883798 - BLOCK
      ?auto_883799 - BLOCK
      ?auto_883800 - BLOCK
      ?auto_883801 - BLOCK
      ?auto_883802 - BLOCK
      ?auto_883803 - BLOCK
      ?auto_883804 - BLOCK
      ?auto_883805 - BLOCK
      ?auto_883806 - BLOCK
      ?auto_883807 - BLOCK
    )
    :vars
    (
      ?auto_883808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883807 ?auto_883808 ) ( ON-TABLE ?auto_883795 ) ( not ( = ?auto_883795 ?auto_883796 ) ) ( not ( = ?auto_883795 ?auto_883797 ) ) ( not ( = ?auto_883795 ?auto_883798 ) ) ( not ( = ?auto_883795 ?auto_883799 ) ) ( not ( = ?auto_883795 ?auto_883800 ) ) ( not ( = ?auto_883795 ?auto_883801 ) ) ( not ( = ?auto_883795 ?auto_883802 ) ) ( not ( = ?auto_883795 ?auto_883803 ) ) ( not ( = ?auto_883795 ?auto_883804 ) ) ( not ( = ?auto_883795 ?auto_883805 ) ) ( not ( = ?auto_883795 ?auto_883806 ) ) ( not ( = ?auto_883795 ?auto_883807 ) ) ( not ( = ?auto_883795 ?auto_883808 ) ) ( not ( = ?auto_883796 ?auto_883797 ) ) ( not ( = ?auto_883796 ?auto_883798 ) ) ( not ( = ?auto_883796 ?auto_883799 ) ) ( not ( = ?auto_883796 ?auto_883800 ) ) ( not ( = ?auto_883796 ?auto_883801 ) ) ( not ( = ?auto_883796 ?auto_883802 ) ) ( not ( = ?auto_883796 ?auto_883803 ) ) ( not ( = ?auto_883796 ?auto_883804 ) ) ( not ( = ?auto_883796 ?auto_883805 ) ) ( not ( = ?auto_883796 ?auto_883806 ) ) ( not ( = ?auto_883796 ?auto_883807 ) ) ( not ( = ?auto_883796 ?auto_883808 ) ) ( not ( = ?auto_883797 ?auto_883798 ) ) ( not ( = ?auto_883797 ?auto_883799 ) ) ( not ( = ?auto_883797 ?auto_883800 ) ) ( not ( = ?auto_883797 ?auto_883801 ) ) ( not ( = ?auto_883797 ?auto_883802 ) ) ( not ( = ?auto_883797 ?auto_883803 ) ) ( not ( = ?auto_883797 ?auto_883804 ) ) ( not ( = ?auto_883797 ?auto_883805 ) ) ( not ( = ?auto_883797 ?auto_883806 ) ) ( not ( = ?auto_883797 ?auto_883807 ) ) ( not ( = ?auto_883797 ?auto_883808 ) ) ( not ( = ?auto_883798 ?auto_883799 ) ) ( not ( = ?auto_883798 ?auto_883800 ) ) ( not ( = ?auto_883798 ?auto_883801 ) ) ( not ( = ?auto_883798 ?auto_883802 ) ) ( not ( = ?auto_883798 ?auto_883803 ) ) ( not ( = ?auto_883798 ?auto_883804 ) ) ( not ( = ?auto_883798 ?auto_883805 ) ) ( not ( = ?auto_883798 ?auto_883806 ) ) ( not ( = ?auto_883798 ?auto_883807 ) ) ( not ( = ?auto_883798 ?auto_883808 ) ) ( not ( = ?auto_883799 ?auto_883800 ) ) ( not ( = ?auto_883799 ?auto_883801 ) ) ( not ( = ?auto_883799 ?auto_883802 ) ) ( not ( = ?auto_883799 ?auto_883803 ) ) ( not ( = ?auto_883799 ?auto_883804 ) ) ( not ( = ?auto_883799 ?auto_883805 ) ) ( not ( = ?auto_883799 ?auto_883806 ) ) ( not ( = ?auto_883799 ?auto_883807 ) ) ( not ( = ?auto_883799 ?auto_883808 ) ) ( not ( = ?auto_883800 ?auto_883801 ) ) ( not ( = ?auto_883800 ?auto_883802 ) ) ( not ( = ?auto_883800 ?auto_883803 ) ) ( not ( = ?auto_883800 ?auto_883804 ) ) ( not ( = ?auto_883800 ?auto_883805 ) ) ( not ( = ?auto_883800 ?auto_883806 ) ) ( not ( = ?auto_883800 ?auto_883807 ) ) ( not ( = ?auto_883800 ?auto_883808 ) ) ( not ( = ?auto_883801 ?auto_883802 ) ) ( not ( = ?auto_883801 ?auto_883803 ) ) ( not ( = ?auto_883801 ?auto_883804 ) ) ( not ( = ?auto_883801 ?auto_883805 ) ) ( not ( = ?auto_883801 ?auto_883806 ) ) ( not ( = ?auto_883801 ?auto_883807 ) ) ( not ( = ?auto_883801 ?auto_883808 ) ) ( not ( = ?auto_883802 ?auto_883803 ) ) ( not ( = ?auto_883802 ?auto_883804 ) ) ( not ( = ?auto_883802 ?auto_883805 ) ) ( not ( = ?auto_883802 ?auto_883806 ) ) ( not ( = ?auto_883802 ?auto_883807 ) ) ( not ( = ?auto_883802 ?auto_883808 ) ) ( not ( = ?auto_883803 ?auto_883804 ) ) ( not ( = ?auto_883803 ?auto_883805 ) ) ( not ( = ?auto_883803 ?auto_883806 ) ) ( not ( = ?auto_883803 ?auto_883807 ) ) ( not ( = ?auto_883803 ?auto_883808 ) ) ( not ( = ?auto_883804 ?auto_883805 ) ) ( not ( = ?auto_883804 ?auto_883806 ) ) ( not ( = ?auto_883804 ?auto_883807 ) ) ( not ( = ?auto_883804 ?auto_883808 ) ) ( not ( = ?auto_883805 ?auto_883806 ) ) ( not ( = ?auto_883805 ?auto_883807 ) ) ( not ( = ?auto_883805 ?auto_883808 ) ) ( not ( = ?auto_883806 ?auto_883807 ) ) ( not ( = ?auto_883806 ?auto_883808 ) ) ( not ( = ?auto_883807 ?auto_883808 ) ) ( ON ?auto_883806 ?auto_883807 ) ( ON ?auto_883805 ?auto_883806 ) ( ON ?auto_883804 ?auto_883805 ) ( ON ?auto_883803 ?auto_883804 ) ( ON ?auto_883802 ?auto_883803 ) ( ON ?auto_883801 ?auto_883802 ) ( ON ?auto_883800 ?auto_883801 ) ( ON ?auto_883799 ?auto_883800 ) ( ON ?auto_883798 ?auto_883799 ) ( ON ?auto_883797 ?auto_883798 ) ( CLEAR ?auto_883795 ) ( ON ?auto_883796 ?auto_883797 ) ( CLEAR ?auto_883796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_883795 ?auto_883796 )
      ( MAKE-13PILE ?auto_883795 ?auto_883796 ?auto_883797 ?auto_883798 ?auto_883799 ?auto_883800 ?auto_883801 ?auto_883802 ?auto_883803 ?auto_883804 ?auto_883805 ?auto_883806 ?auto_883807 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_883849 - BLOCK
      ?auto_883850 - BLOCK
      ?auto_883851 - BLOCK
      ?auto_883852 - BLOCK
      ?auto_883853 - BLOCK
      ?auto_883854 - BLOCK
      ?auto_883855 - BLOCK
      ?auto_883856 - BLOCK
      ?auto_883857 - BLOCK
      ?auto_883858 - BLOCK
      ?auto_883859 - BLOCK
      ?auto_883860 - BLOCK
      ?auto_883861 - BLOCK
    )
    :vars
    (
      ?auto_883862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883861 ?auto_883862 ) ( not ( = ?auto_883849 ?auto_883850 ) ) ( not ( = ?auto_883849 ?auto_883851 ) ) ( not ( = ?auto_883849 ?auto_883852 ) ) ( not ( = ?auto_883849 ?auto_883853 ) ) ( not ( = ?auto_883849 ?auto_883854 ) ) ( not ( = ?auto_883849 ?auto_883855 ) ) ( not ( = ?auto_883849 ?auto_883856 ) ) ( not ( = ?auto_883849 ?auto_883857 ) ) ( not ( = ?auto_883849 ?auto_883858 ) ) ( not ( = ?auto_883849 ?auto_883859 ) ) ( not ( = ?auto_883849 ?auto_883860 ) ) ( not ( = ?auto_883849 ?auto_883861 ) ) ( not ( = ?auto_883849 ?auto_883862 ) ) ( not ( = ?auto_883850 ?auto_883851 ) ) ( not ( = ?auto_883850 ?auto_883852 ) ) ( not ( = ?auto_883850 ?auto_883853 ) ) ( not ( = ?auto_883850 ?auto_883854 ) ) ( not ( = ?auto_883850 ?auto_883855 ) ) ( not ( = ?auto_883850 ?auto_883856 ) ) ( not ( = ?auto_883850 ?auto_883857 ) ) ( not ( = ?auto_883850 ?auto_883858 ) ) ( not ( = ?auto_883850 ?auto_883859 ) ) ( not ( = ?auto_883850 ?auto_883860 ) ) ( not ( = ?auto_883850 ?auto_883861 ) ) ( not ( = ?auto_883850 ?auto_883862 ) ) ( not ( = ?auto_883851 ?auto_883852 ) ) ( not ( = ?auto_883851 ?auto_883853 ) ) ( not ( = ?auto_883851 ?auto_883854 ) ) ( not ( = ?auto_883851 ?auto_883855 ) ) ( not ( = ?auto_883851 ?auto_883856 ) ) ( not ( = ?auto_883851 ?auto_883857 ) ) ( not ( = ?auto_883851 ?auto_883858 ) ) ( not ( = ?auto_883851 ?auto_883859 ) ) ( not ( = ?auto_883851 ?auto_883860 ) ) ( not ( = ?auto_883851 ?auto_883861 ) ) ( not ( = ?auto_883851 ?auto_883862 ) ) ( not ( = ?auto_883852 ?auto_883853 ) ) ( not ( = ?auto_883852 ?auto_883854 ) ) ( not ( = ?auto_883852 ?auto_883855 ) ) ( not ( = ?auto_883852 ?auto_883856 ) ) ( not ( = ?auto_883852 ?auto_883857 ) ) ( not ( = ?auto_883852 ?auto_883858 ) ) ( not ( = ?auto_883852 ?auto_883859 ) ) ( not ( = ?auto_883852 ?auto_883860 ) ) ( not ( = ?auto_883852 ?auto_883861 ) ) ( not ( = ?auto_883852 ?auto_883862 ) ) ( not ( = ?auto_883853 ?auto_883854 ) ) ( not ( = ?auto_883853 ?auto_883855 ) ) ( not ( = ?auto_883853 ?auto_883856 ) ) ( not ( = ?auto_883853 ?auto_883857 ) ) ( not ( = ?auto_883853 ?auto_883858 ) ) ( not ( = ?auto_883853 ?auto_883859 ) ) ( not ( = ?auto_883853 ?auto_883860 ) ) ( not ( = ?auto_883853 ?auto_883861 ) ) ( not ( = ?auto_883853 ?auto_883862 ) ) ( not ( = ?auto_883854 ?auto_883855 ) ) ( not ( = ?auto_883854 ?auto_883856 ) ) ( not ( = ?auto_883854 ?auto_883857 ) ) ( not ( = ?auto_883854 ?auto_883858 ) ) ( not ( = ?auto_883854 ?auto_883859 ) ) ( not ( = ?auto_883854 ?auto_883860 ) ) ( not ( = ?auto_883854 ?auto_883861 ) ) ( not ( = ?auto_883854 ?auto_883862 ) ) ( not ( = ?auto_883855 ?auto_883856 ) ) ( not ( = ?auto_883855 ?auto_883857 ) ) ( not ( = ?auto_883855 ?auto_883858 ) ) ( not ( = ?auto_883855 ?auto_883859 ) ) ( not ( = ?auto_883855 ?auto_883860 ) ) ( not ( = ?auto_883855 ?auto_883861 ) ) ( not ( = ?auto_883855 ?auto_883862 ) ) ( not ( = ?auto_883856 ?auto_883857 ) ) ( not ( = ?auto_883856 ?auto_883858 ) ) ( not ( = ?auto_883856 ?auto_883859 ) ) ( not ( = ?auto_883856 ?auto_883860 ) ) ( not ( = ?auto_883856 ?auto_883861 ) ) ( not ( = ?auto_883856 ?auto_883862 ) ) ( not ( = ?auto_883857 ?auto_883858 ) ) ( not ( = ?auto_883857 ?auto_883859 ) ) ( not ( = ?auto_883857 ?auto_883860 ) ) ( not ( = ?auto_883857 ?auto_883861 ) ) ( not ( = ?auto_883857 ?auto_883862 ) ) ( not ( = ?auto_883858 ?auto_883859 ) ) ( not ( = ?auto_883858 ?auto_883860 ) ) ( not ( = ?auto_883858 ?auto_883861 ) ) ( not ( = ?auto_883858 ?auto_883862 ) ) ( not ( = ?auto_883859 ?auto_883860 ) ) ( not ( = ?auto_883859 ?auto_883861 ) ) ( not ( = ?auto_883859 ?auto_883862 ) ) ( not ( = ?auto_883860 ?auto_883861 ) ) ( not ( = ?auto_883860 ?auto_883862 ) ) ( not ( = ?auto_883861 ?auto_883862 ) ) ( ON ?auto_883860 ?auto_883861 ) ( ON ?auto_883859 ?auto_883860 ) ( ON ?auto_883858 ?auto_883859 ) ( ON ?auto_883857 ?auto_883858 ) ( ON ?auto_883856 ?auto_883857 ) ( ON ?auto_883855 ?auto_883856 ) ( ON ?auto_883854 ?auto_883855 ) ( ON ?auto_883853 ?auto_883854 ) ( ON ?auto_883852 ?auto_883853 ) ( ON ?auto_883851 ?auto_883852 ) ( ON ?auto_883850 ?auto_883851 ) ( ON ?auto_883849 ?auto_883850 ) ( CLEAR ?auto_883849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_883849 )
      ( MAKE-13PILE ?auto_883849 ?auto_883850 ?auto_883851 ?auto_883852 ?auto_883853 ?auto_883854 ?auto_883855 ?auto_883856 ?auto_883857 ?auto_883858 ?auto_883859 ?auto_883860 ?auto_883861 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_883904 - BLOCK
      ?auto_883905 - BLOCK
      ?auto_883906 - BLOCK
      ?auto_883907 - BLOCK
      ?auto_883908 - BLOCK
      ?auto_883909 - BLOCK
      ?auto_883910 - BLOCK
      ?auto_883911 - BLOCK
      ?auto_883912 - BLOCK
      ?auto_883913 - BLOCK
      ?auto_883914 - BLOCK
      ?auto_883915 - BLOCK
      ?auto_883916 - BLOCK
      ?auto_883917 - BLOCK
    )
    :vars
    (
      ?auto_883918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_883916 ) ( ON ?auto_883917 ?auto_883918 ) ( CLEAR ?auto_883917 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_883904 ) ( ON ?auto_883905 ?auto_883904 ) ( ON ?auto_883906 ?auto_883905 ) ( ON ?auto_883907 ?auto_883906 ) ( ON ?auto_883908 ?auto_883907 ) ( ON ?auto_883909 ?auto_883908 ) ( ON ?auto_883910 ?auto_883909 ) ( ON ?auto_883911 ?auto_883910 ) ( ON ?auto_883912 ?auto_883911 ) ( ON ?auto_883913 ?auto_883912 ) ( ON ?auto_883914 ?auto_883913 ) ( ON ?auto_883915 ?auto_883914 ) ( ON ?auto_883916 ?auto_883915 ) ( not ( = ?auto_883904 ?auto_883905 ) ) ( not ( = ?auto_883904 ?auto_883906 ) ) ( not ( = ?auto_883904 ?auto_883907 ) ) ( not ( = ?auto_883904 ?auto_883908 ) ) ( not ( = ?auto_883904 ?auto_883909 ) ) ( not ( = ?auto_883904 ?auto_883910 ) ) ( not ( = ?auto_883904 ?auto_883911 ) ) ( not ( = ?auto_883904 ?auto_883912 ) ) ( not ( = ?auto_883904 ?auto_883913 ) ) ( not ( = ?auto_883904 ?auto_883914 ) ) ( not ( = ?auto_883904 ?auto_883915 ) ) ( not ( = ?auto_883904 ?auto_883916 ) ) ( not ( = ?auto_883904 ?auto_883917 ) ) ( not ( = ?auto_883904 ?auto_883918 ) ) ( not ( = ?auto_883905 ?auto_883906 ) ) ( not ( = ?auto_883905 ?auto_883907 ) ) ( not ( = ?auto_883905 ?auto_883908 ) ) ( not ( = ?auto_883905 ?auto_883909 ) ) ( not ( = ?auto_883905 ?auto_883910 ) ) ( not ( = ?auto_883905 ?auto_883911 ) ) ( not ( = ?auto_883905 ?auto_883912 ) ) ( not ( = ?auto_883905 ?auto_883913 ) ) ( not ( = ?auto_883905 ?auto_883914 ) ) ( not ( = ?auto_883905 ?auto_883915 ) ) ( not ( = ?auto_883905 ?auto_883916 ) ) ( not ( = ?auto_883905 ?auto_883917 ) ) ( not ( = ?auto_883905 ?auto_883918 ) ) ( not ( = ?auto_883906 ?auto_883907 ) ) ( not ( = ?auto_883906 ?auto_883908 ) ) ( not ( = ?auto_883906 ?auto_883909 ) ) ( not ( = ?auto_883906 ?auto_883910 ) ) ( not ( = ?auto_883906 ?auto_883911 ) ) ( not ( = ?auto_883906 ?auto_883912 ) ) ( not ( = ?auto_883906 ?auto_883913 ) ) ( not ( = ?auto_883906 ?auto_883914 ) ) ( not ( = ?auto_883906 ?auto_883915 ) ) ( not ( = ?auto_883906 ?auto_883916 ) ) ( not ( = ?auto_883906 ?auto_883917 ) ) ( not ( = ?auto_883906 ?auto_883918 ) ) ( not ( = ?auto_883907 ?auto_883908 ) ) ( not ( = ?auto_883907 ?auto_883909 ) ) ( not ( = ?auto_883907 ?auto_883910 ) ) ( not ( = ?auto_883907 ?auto_883911 ) ) ( not ( = ?auto_883907 ?auto_883912 ) ) ( not ( = ?auto_883907 ?auto_883913 ) ) ( not ( = ?auto_883907 ?auto_883914 ) ) ( not ( = ?auto_883907 ?auto_883915 ) ) ( not ( = ?auto_883907 ?auto_883916 ) ) ( not ( = ?auto_883907 ?auto_883917 ) ) ( not ( = ?auto_883907 ?auto_883918 ) ) ( not ( = ?auto_883908 ?auto_883909 ) ) ( not ( = ?auto_883908 ?auto_883910 ) ) ( not ( = ?auto_883908 ?auto_883911 ) ) ( not ( = ?auto_883908 ?auto_883912 ) ) ( not ( = ?auto_883908 ?auto_883913 ) ) ( not ( = ?auto_883908 ?auto_883914 ) ) ( not ( = ?auto_883908 ?auto_883915 ) ) ( not ( = ?auto_883908 ?auto_883916 ) ) ( not ( = ?auto_883908 ?auto_883917 ) ) ( not ( = ?auto_883908 ?auto_883918 ) ) ( not ( = ?auto_883909 ?auto_883910 ) ) ( not ( = ?auto_883909 ?auto_883911 ) ) ( not ( = ?auto_883909 ?auto_883912 ) ) ( not ( = ?auto_883909 ?auto_883913 ) ) ( not ( = ?auto_883909 ?auto_883914 ) ) ( not ( = ?auto_883909 ?auto_883915 ) ) ( not ( = ?auto_883909 ?auto_883916 ) ) ( not ( = ?auto_883909 ?auto_883917 ) ) ( not ( = ?auto_883909 ?auto_883918 ) ) ( not ( = ?auto_883910 ?auto_883911 ) ) ( not ( = ?auto_883910 ?auto_883912 ) ) ( not ( = ?auto_883910 ?auto_883913 ) ) ( not ( = ?auto_883910 ?auto_883914 ) ) ( not ( = ?auto_883910 ?auto_883915 ) ) ( not ( = ?auto_883910 ?auto_883916 ) ) ( not ( = ?auto_883910 ?auto_883917 ) ) ( not ( = ?auto_883910 ?auto_883918 ) ) ( not ( = ?auto_883911 ?auto_883912 ) ) ( not ( = ?auto_883911 ?auto_883913 ) ) ( not ( = ?auto_883911 ?auto_883914 ) ) ( not ( = ?auto_883911 ?auto_883915 ) ) ( not ( = ?auto_883911 ?auto_883916 ) ) ( not ( = ?auto_883911 ?auto_883917 ) ) ( not ( = ?auto_883911 ?auto_883918 ) ) ( not ( = ?auto_883912 ?auto_883913 ) ) ( not ( = ?auto_883912 ?auto_883914 ) ) ( not ( = ?auto_883912 ?auto_883915 ) ) ( not ( = ?auto_883912 ?auto_883916 ) ) ( not ( = ?auto_883912 ?auto_883917 ) ) ( not ( = ?auto_883912 ?auto_883918 ) ) ( not ( = ?auto_883913 ?auto_883914 ) ) ( not ( = ?auto_883913 ?auto_883915 ) ) ( not ( = ?auto_883913 ?auto_883916 ) ) ( not ( = ?auto_883913 ?auto_883917 ) ) ( not ( = ?auto_883913 ?auto_883918 ) ) ( not ( = ?auto_883914 ?auto_883915 ) ) ( not ( = ?auto_883914 ?auto_883916 ) ) ( not ( = ?auto_883914 ?auto_883917 ) ) ( not ( = ?auto_883914 ?auto_883918 ) ) ( not ( = ?auto_883915 ?auto_883916 ) ) ( not ( = ?auto_883915 ?auto_883917 ) ) ( not ( = ?auto_883915 ?auto_883918 ) ) ( not ( = ?auto_883916 ?auto_883917 ) ) ( not ( = ?auto_883916 ?auto_883918 ) ) ( not ( = ?auto_883917 ?auto_883918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_883917 ?auto_883918 )
      ( !STACK ?auto_883917 ?auto_883916 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_883962 - BLOCK
      ?auto_883963 - BLOCK
      ?auto_883964 - BLOCK
      ?auto_883965 - BLOCK
      ?auto_883966 - BLOCK
      ?auto_883967 - BLOCK
      ?auto_883968 - BLOCK
      ?auto_883969 - BLOCK
      ?auto_883970 - BLOCK
      ?auto_883971 - BLOCK
      ?auto_883972 - BLOCK
      ?auto_883973 - BLOCK
      ?auto_883974 - BLOCK
      ?auto_883975 - BLOCK
    )
    :vars
    (
      ?auto_883976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_883975 ?auto_883976 ) ( ON-TABLE ?auto_883962 ) ( ON ?auto_883963 ?auto_883962 ) ( ON ?auto_883964 ?auto_883963 ) ( ON ?auto_883965 ?auto_883964 ) ( ON ?auto_883966 ?auto_883965 ) ( ON ?auto_883967 ?auto_883966 ) ( ON ?auto_883968 ?auto_883967 ) ( ON ?auto_883969 ?auto_883968 ) ( ON ?auto_883970 ?auto_883969 ) ( ON ?auto_883971 ?auto_883970 ) ( ON ?auto_883972 ?auto_883971 ) ( ON ?auto_883973 ?auto_883972 ) ( not ( = ?auto_883962 ?auto_883963 ) ) ( not ( = ?auto_883962 ?auto_883964 ) ) ( not ( = ?auto_883962 ?auto_883965 ) ) ( not ( = ?auto_883962 ?auto_883966 ) ) ( not ( = ?auto_883962 ?auto_883967 ) ) ( not ( = ?auto_883962 ?auto_883968 ) ) ( not ( = ?auto_883962 ?auto_883969 ) ) ( not ( = ?auto_883962 ?auto_883970 ) ) ( not ( = ?auto_883962 ?auto_883971 ) ) ( not ( = ?auto_883962 ?auto_883972 ) ) ( not ( = ?auto_883962 ?auto_883973 ) ) ( not ( = ?auto_883962 ?auto_883974 ) ) ( not ( = ?auto_883962 ?auto_883975 ) ) ( not ( = ?auto_883962 ?auto_883976 ) ) ( not ( = ?auto_883963 ?auto_883964 ) ) ( not ( = ?auto_883963 ?auto_883965 ) ) ( not ( = ?auto_883963 ?auto_883966 ) ) ( not ( = ?auto_883963 ?auto_883967 ) ) ( not ( = ?auto_883963 ?auto_883968 ) ) ( not ( = ?auto_883963 ?auto_883969 ) ) ( not ( = ?auto_883963 ?auto_883970 ) ) ( not ( = ?auto_883963 ?auto_883971 ) ) ( not ( = ?auto_883963 ?auto_883972 ) ) ( not ( = ?auto_883963 ?auto_883973 ) ) ( not ( = ?auto_883963 ?auto_883974 ) ) ( not ( = ?auto_883963 ?auto_883975 ) ) ( not ( = ?auto_883963 ?auto_883976 ) ) ( not ( = ?auto_883964 ?auto_883965 ) ) ( not ( = ?auto_883964 ?auto_883966 ) ) ( not ( = ?auto_883964 ?auto_883967 ) ) ( not ( = ?auto_883964 ?auto_883968 ) ) ( not ( = ?auto_883964 ?auto_883969 ) ) ( not ( = ?auto_883964 ?auto_883970 ) ) ( not ( = ?auto_883964 ?auto_883971 ) ) ( not ( = ?auto_883964 ?auto_883972 ) ) ( not ( = ?auto_883964 ?auto_883973 ) ) ( not ( = ?auto_883964 ?auto_883974 ) ) ( not ( = ?auto_883964 ?auto_883975 ) ) ( not ( = ?auto_883964 ?auto_883976 ) ) ( not ( = ?auto_883965 ?auto_883966 ) ) ( not ( = ?auto_883965 ?auto_883967 ) ) ( not ( = ?auto_883965 ?auto_883968 ) ) ( not ( = ?auto_883965 ?auto_883969 ) ) ( not ( = ?auto_883965 ?auto_883970 ) ) ( not ( = ?auto_883965 ?auto_883971 ) ) ( not ( = ?auto_883965 ?auto_883972 ) ) ( not ( = ?auto_883965 ?auto_883973 ) ) ( not ( = ?auto_883965 ?auto_883974 ) ) ( not ( = ?auto_883965 ?auto_883975 ) ) ( not ( = ?auto_883965 ?auto_883976 ) ) ( not ( = ?auto_883966 ?auto_883967 ) ) ( not ( = ?auto_883966 ?auto_883968 ) ) ( not ( = ?auto_883966 ?auto_883969 ) ) ( not ( = ?auto_883966 ?auto_883970 ) ) ( not ( = ?auto_883966 ?auto_883971 ) ) ( not ( = ?auto_883966 ?auto_883972 ) ) ( not ( = ?auto_883966 ?auto_883973 ) ) ( not ( = ?auto_883966 ?auto_883974 ) ) ( not ( = ?auto_883966 ?auto_883975 ) ) ( not ( = ?auto_883966 ?auto_883976 ) ) ( not ( = ?auto_883967 ?auto_883968 ) ) ( not ( = ?auto_883967 ?auto_883969 ) ) ( not ( = ?auto_883967 ?auto_883970 ) ) ( not ( = ?auto_883967 ?auto_883971 ) ) ( not ( = ?auto_883967 ?auto_883972 ) ) ( not ( = ?auto_883967 ?auto_883973 ) ) ( not ( = ?auto_883967 ?auto_883974 ) ) ( not ( = ?auto_883967 ?auto_883975 ) ) ( not ( = ?auto_883967 ?auto_883976 ) ) ( not ( = ?auto_883968 ?auto_883969 ) ) ( not ( = ?auto_883968 ?auto_883970 ) ) ( not ( = ?auto_883968 ?auto_883971 ) ) ( not ( = ?auto_883968 ?auto_883972 ) ) ( not ( = ?auto_883968 ?auto_883973 ) ) ( not ( = ?auto_883968 ?auto_883974 ) ) ( not ( = ?auto_883968 ?auto_883975 ) ) ( not ( = ?auto_883968 ?auto_883976 ) ) ( not ( = ?auto_883969 ?auto_883970 ) ) ( not ( = ?auto_883969 ?auto_883971 ) ) ( not ( = ?auto_883969 ?auto_883972 ) ) ( not ( = ?auto_883969 ?auto_883973 ) ) ( not ( = ?auto_883969 ?auto_883974 ) ) ( not ( = ?auto_883969 ?auto_883975 ) ) ( not ( = ?auto_883969 ?auto_883976 ) ) ( not ( = ?auto_883970 ?auto_883971 ) ) ( not ( = ?auto_883970 ?auto_883972 ) ) ( not ( = ?auto_883970 ?auto_883973 ) ) ( not ( = ?auto_883970 ?auto_883974 ) ) ( not ( = ?auto_883970 ?auto_883975 ) ) ( not ( = ?auto_883970 ?auto_883976 ) ) ( not ( = ?auto_883971 ?auto_883972 ) ) ( not ( = ?auto_883971 ?auto_883973 ) ) ( not ( = ?auto_883971 ?auto_883974 ) ) ( not ( = ?auto_883971 ?auto_883975 ) ) ( not ( = ?auto_883971 ?auto_883976 ) ) ( not ( = ?auto_883972 ?auto_883973 ) ) ( not ( = ?auto_883972 ?auto_883974 ) ) ( not ( = ?auto_883972 ?auto_883975 ) ) ( not ( = ?auto_883972 ?auto_883976 ) ) ( not ( = ?auto_883973 ?auto_883974 ) ) ( not ( = ?auto_883973 ?auto_883975 ) ) ( not ( = ?auto_883973 ?auto_883976 ) ) ( not ( = ?auto_883974 ?auto_883975 ) ) ( not ( = ?auto_883974 ?auto_883976 ) ) ( not ( = ?auto_883975 ?auto_883976 ) ) ( CLEAR ?auto_883973 ) ( ON ?auto_883974 ?auto_883975 ) ( CLEAR ?auto_883974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_883962 ?auto_883963 ?auto_883964 ?auto_883965 ?auto_883966 ?auto_883967 ?auto_883968 ?auto_883969 ?auto_883970 ?auto_883971 ?auto_883972 ?auto_883973 ?auto_883974 )
      ( MAKE-14PILE ?auto_883962 ?auto_883963 ?auto_883964 ?auto_883965 ?auto_883966 ?auto_883967 ?auto_883968 ?auto_883969 ?auto_883970 ?auto_883971 ?auto_883972 ?auto_883973 ?auto_883974 ?auto_883975 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_884020 - BLOCK
      ?auto_884021 - BLOCK
      ?auto_884022 - BLOCK
      ?auto_884023 - BLOCK
      ?auto_884024 - BLOCK
      ?auto_884025 - BLOCK
      ?auto_884026 - BLOCK
      ?auto_884027 - BLOCK
      ?auto_884028 - BLOCK
      ?auto_884029 - BLOCK
      ?auto_884030 - BLOCK
      ?auto_884031 - BLOCK
      ?auto_884032 - BLOCK
      ?auto_884033 - BLOCK
    )
    :vars
    (
      ?auto_884034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884033 ?auto_884034 ) ( ON-TABLE ?auto_884020 ) ( ON ?auto_884021 ?auto_884020 ) ( ON ?auto_884022 ?auto_884021 ) ( ON ?auto_884023 ?auto_884022 ) ( ON ?auto_884024 ?auto_884023 ) ( ON ?auto_884025 ?auto_884024 ) ( ON ?auto_884026 ?auto_884025 ) ( ON ?auto_884027 ?auto_884026 ) ( ON ?auto_884028 ?auto_884027 ) ( ON ?auto_884029 ?auto_884028 ) ( ON ?auto_884030 ?auto_884029 ) ( not ( = ?auto_884020 ?auto_884021 ) ) ( not ( = ?auto_884020 ?auto_884022 ) ) ( not ( = ?auto_884020 ?auto_884023 ) ) ( not ( = ?auto_884020 ?auto_884024 ) ) ( not ( = ?auto_884020 ?auto_884025 ) ) ( not ( = ?auto_884020 ?auto_884026 ) ) ( not ( = ?auto_884020 ?auto_884027 ) ) ( not ( = ?auto_884020 ?auto_884028 ) ) ( not ( = ?auto_884020 ?auto_884029 ) ) ( not ( = ?auto_884020 ?auto_884030 ) ) ( not ( = ?auto_884020 ?auto_884031 ) ) ( not ( = ?auto_884020 ?auto_884032 ) ) ( not ( = ?auto_884020 ?auto_884033 ) ) ( not ( = ?auto_884020 ?auto_884034 ) ) ( not ( = ?auto_884021 ?auto_884022 ) ) ( not ( = ?auto_884021 ?auto_884023 ) ) ( not ( = ?auto_884021 ?auto_884024 ) ) ( not ( = ?auto_884021 ?auto_884025 ) ) ( not ( = ?auto_884021 ?auto_884026 ) ) ( not ( = ?auto_884021 ?auto_884027 ) ) ( not ( = ?auto_884021 ?auto_884028 ) ) ( not ( = ?auto_884021 ?auto_884029 ) ) ( not ( = ?auto_884021 ?auto_884030 ) ) ( not ( = ?auto_884021 ?auto_884031 ) ) ( not ( = ?auto_884021 ?auto_884032 ) ) ( not ( = ?auto_884021 ?auto_884033 ) ) ( not ( = ?auto_884021 ?auto_884034 ) ) ( not ( = ?auto_884022 ?auto_884023 ) ) ( not ( = ?auto_884022 ?auto_884024 ) ) ( not ( = ?auto_884022 ?auto_884025 ) ) ( not ( = ?auto_884022 ?auto_884026 ) ) ( not ( = ?auto_884022 ?auto_884027 ) ) ( not ( = ?auto_884022 ?auto_884028 ) ) ( not ( = ?auto_884022 ?auto_884029 ) ) ( not ( = ?auto_884022 ?auto_884030 ) ) ( not ( = ?auto_884022 ?auto_884031 ) ) ( not ( = ?auto_884022 ?auto_884032 ) ) ( not ( = ?auto_884022 ?auto_884033 ) ) ( not ( = ?auto_884022 ?auto_884034 ) ) ( not ( = ?auto_884023 ?auto_884024 ) ) ( not ( = ?auto_884023 ?auto_884025 ) ) ( not ( = ?auto_884023 ?auto_884026 ) ) ( not ( = ?auto_884023 ?auto_884027 ) ) ( not ( = ?auto_884023 ?auto_884028 ) ) ( not ( = ?auto_884023 ?auto_884029 ) ) ( not ( = ?auto_884023 ?auto_884030 ) ) ( not ( = ?auto_884023 ?auto_884031 ) ) ( not ( = ?auto_884023 ?auto_884032 ) ) ( not ( = ?auto_884023 ?auto_884033 ) ) ( not ( = ?auto_884023 ?auto_884034 ) ) ( not ( = ?auto_884024 ?auto_884025 ) ) ( not ( = ?auto_884024 ?auto_884026 ) ) ( not ( = ?auto_884024 ?auto_884027 ) ) ( not ( = ?auto_884024 ?auto_884028 ) ) ( not ( = ?auto_884024 ?auto_884029 ) ) ( not ( = ?auto_884024 ?auto_884030 ) ) ( not ( = ?auto_884024 ?auto_884031 ) ) ( not ( = ?auto_884024 ?auto_884032 ) ) ( not ( = ?auto_884024 ?auto_884033 ) ) ( not ( = ?auto_884024 ?auto_884034 ) ) ( not ( = ?auto_884025 ?auto_884026 ) ) ( not ( = ?auto_884025 ?auto_884027 ) ) ( not ( = ?auto_884025 ?auto_884028 ) ) ( not ( = ?auto_884025 ?auto_884029 ) ) ( not ( = ?auto_884025 ?auto_884030 ) ) ( not ( = ?auto_884025 ?auto_884031 ) ) ( not ( = ?auto_884025 ?auto_884032 ) ) ( not ( = ?auto_884025 ?auto_884033 ) ) ( not ( = ?auto_884025 ?auto_884034 ) ) ( not ( = ?auto_884026 ?auto_884027 ) ) ( not ( = ?auto_884026 ?auto_884028 ) ) ( not ( = ?auto_884026 ?auto_884029 ) ) ( not ( = ?auto_884026 ?auto_884030 ) ) ( not ( = ?auto_884026 ?auto_884031 ) ) ( not ( = ?auto_884026 ?auto_884032 ) ) ( not ( = ?auto_884026 ?auto_884033 ) ) ( not ( = ?auto_884026 ?auto_884034 ) ) ( not ( = ?auto_884027 ?auto_884028 ) ) ( not ( = ?auto_884027 ?auto_884029 ) ) ( not ( = ?auto_884027 ?auto_884030 ) ) ( not ( = ?auto_884027 ?auto_884031 ) ) ( not ( = ?auto_884027 ?auto_884032 ) ) ( not ( = ?auto_884027 ?auto_884033 ) ) ( not ( = ?auto_884027 ?auto_884034 ) ) ( not ( = ?auto_884028 ?auto_884029 ) ) ( not ( = ?auto_884028 ?auto_884030 ) ) ( not ( = ?auto_884028 ?auto_884031 ) ) ( not ( = ?auto_884028 ?auto_884032 ) ) ( not ( = ?auto_884028 ?auto_884033 ) ) ( not ( = ?auto_884028 ?auto_884034 ) ) ( not ( = ?auto_884029 ?auto_884030 ) ) ( not ( = ?auto_884029 ?auto_884031 ) ) ( not ( = ?auto_884029 ?auto_884032 ) ) ( not ( = ?auto_884029 ?auto_884033 ) ) ( not ( = ?auto_884029 ?auto_884034 ) ) ( not ( = ?auto_884030 ?auto_884031 ) ) ( not ( = ?auto_884030 ?auto_884032 ) ) ( not ( = ?auto_884030 ?auto_884033 ) ) ( not ( = ?auto_884030 ?auto_884034 ) ) ( not ( = ?auto_884031 ?auto_884032 ) ) ( not ( = ?auto_884031 ?auto_884033 ) ) ( not ( = ?auto_884031 ?auto_884034 ) ) ( not ( = ?auto_884032 ?auto_884033 ) ) ( not ( = ?auto_884032 ?auto_884034 ) ) ( not ( = ?auto_884033 ?auto_884034 ) ) ( ON ?auto_884032 ?auto_884033 ) ( CLEAR ?auto_884030 ) ( ON ?auto_884031 ?auto_884032 ) ( CLEAR ?auto_884031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_884020 ?auto_884021 ?auto_884022 ?auto_884023 ?auto_884024 ?auto_884025 ?auto_884026 ?auto_884027 ?auto_884028 ?auto_884029 ?auto_884030 ?auto_884031 )
      ( MAKE-14PILE ?auto_884020 ?auto_884021 ?auto_884022 ?auto_884023 ?auto_884024 ?auto_884025 ?auto_884026 ?auto_884027 ?auto_884028 ?auto_884029 ?auto_884030 ?auto_884031 ?auto_884032 ?auto_884033 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_884078 - BLOCK
      ?auto_884079 - BLOCK
      ?auto_884080 - BLOCK
      ?auto_884081 - BLOCK
      ?auto_884082 - BLOCK
      ?auto_884083 - BLOCK
      ?auto_884084 - BLOCK
      ?auto_884085 - BLOCK
      ?auto_884086 - BLOCK
      ?auto_884087 - BLOCK
      ?auto_884088 - BLOCK
      ?auto_884089 - BLOCK
      ?auto_884090 - BLOCK
      ?auto_884091 - BLOCK
    )
    :vars
    (
      ?auto_884092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884091 ?auto_884092 ) ( ON-TABLE ?auto_884078 ) ( ON ?auto_884079 ?auto_884078 ) ( ON ?auto_884080 ?auto_884079 ) ( ON ?auto_884081 ?auto_884080 ) ( ON ?auto_884082 ?auto_884081 ) ( ON ?auto_884083 ?auto_884082 ) ( ON ?auto_884084 ?auto_884083 ) ( ON ?auto_884085 ?auto_884084 ) ( ON ?auto_884086 ?auto_884085 ) ( ON ?auto_884087 ?auto_884086 ) ( not ( = ?auto_884078 ?auto_884079 ) ) ( not ( = ?auto_884078 ?auto_884080 ) ) ( not ( = ?auto_884078 ?auto_884081 ) ) ( not ( = ?auto_884078 ?auto_884082 ) ) ( not ( = ?auto_884078 ?auto_884083 ) ) ( not ( = ?auto_884078 ?auto_884084 ) ) ( not ( = ?auto_884078 ?auto_884085 ) ) ( not ( = ?auto_884078 ?auto_884086 ) ) ( not ( = ?auto_884078 ?auto_884087 ) ) ( not ( = ?auto_884078 ?auto_884088 ) ) ( not ( = ?auto_884078 ?auto_884089 ) ) ( not ( = ?auto_884078 ?auto_884090 ) ) ( not ( = ?auto_884078 ?auto_884091 ) ) ( not ( = ?auto_884078 ?auto_884092 ) ) ( not ( = ?auto_884079 ?auto_884080 ) ) ( not ( = ?auto_884079 ?auto_884081 ) ) ( not ( = ?auto_884079 ?auto_884082 ) ) ( not ( = ?auto_884079 ?auto_884083 ) ) ( not ( = ?auto_884079 ?auto_884084 ) ) ( not ( = ?auto_884079 ?auto_884085 ) ) ( not ( = ?auto_884079 ?auto_884086 ) ) ( not ( = ?auto_884079 ?auto_884087 ) ) ( not ( = ?auto_884079 ?auto_884088 ) ) ( not ( = ?auto_884079 ?auto_884089 ) ) ( not ( = ?auto_884079 ?auto_884090 ) ) ( not ( = ?auto_884079 ?auto_884091 ) ) ( not ( = ?auto_884079 ?auto_884092 ) ) ( not ( = ?auto_884080 ?auto_884081 ) ) ( not ( = ?auto_884080 ?auto_884082 ) ) ( not ( = ?auto_884080 ?auto_884083 ) ) ( not ( = ?auto_884080 ?auto_884084 ) ) ( not ( = ?auto_884080 ?auto_884085 ) ) ( not ( = ?auto_884080 ?auto_884086 ) ) ( not ( = ?auto_884080 ?auto_884087 ) ) ( not ( = ?auto_884080 ?auto_884088 ) ) ( not ( = ?auto_884080 ?auto_884089 ) ) ( not ( = ?auto_884080 ?auto_884090 ) ) ( not ( = ?auto_884080 ?auto_884091 ) ) ( not ( = ?auto_884080 ?auto_884092 ) ) ( not ( = ?auto_884081 ?auto_884082 ) ) ( not ( = ?auto_884081 ?auto_884083 ) ) ( not ( = ?auto_884081 ?auto_884084 ) ) ( not ( = ?auto_884081 ?auto_884085 ) ) ( not ( = ?auto_884081 ?auto_884086 ) ) ( not ( = ?auto_884081 ?auto_884087 ) ) ( not ( = ?auto_884081 ?auto_884088 ) ) ( not ( = ?auto_884081 ?auto_884089 ) ) ( not ( = ?auto_884081 ?auto_884090 ) ) ( not ( = ?auto_884081 ?auto_884091 ) ) ( not ( = ?auto_884081 ?auto_884092 ) ) ( not ( = ?auto_884082 ?auto_884083 ) ) ( not ( = ?auto_884082 ?auto_884084 ) ) ( not ( = ?auto_884082 ?auto_884085 ) ) ( not ( = ?auto_884082 ?auto_884086 ) ) ( not ( = ?auto_884082 ?auto_884087 ) ) ( not ( = ?auto_884082 ?auto_884088 ) ) ( not ( = ?auto_884082 ?auto_884089 ) ) ( not ( = ?auto_884082 ?auto_884090 ) ) ( not ( = ?auto_884082 ?auto_884091 ) ) ( not ( = ?auto_884082 ?auto_884092 ) ) ( not ( = ?auto_884083 ?auto_884084 ) ) ( not ( = ?auto_884083 ?auto_884085 ) ) ( not ( = ?auto_884083 ?auto_884086 ) ) ( not ( = ?auto_884083 ?auto_884087 ) ) ( not ( = ?auto_884083 ?auto_884088 ) ) ( not ( = ?auto_884083 ?auto_884089 ) ) ( not ( = ?auto_884083 ?auto_884090 ) ) ( not ( = ?auto_884083 ?auto_884091 ) ) ( not ( = ?auto_884083 ?auto_884092 ) ) ( not ( = ?auto_884084 ?auto_884085 ) ) ( not ( = ?auto_884084 ?auto_884086 ) ) ( not ( = ?auto_884084 ?auto_884087 ) ) ( not ( = ?auto_884084 ?auto_884088 ) ) ( not ( = ?auto_884084 ?auto_884089 ) ) ( not ( = ?auto_884084 ?auto_884090 ) ) ( not ( = ?auto_884084 ?auto_884091 ) ) ( not ( = ?auto_884084 ?auto_884092 ) ) ( not ( = ?auto_884085 ?auto_884086 ) ) ( not ( = ?auto_884085 ?auto_884087 ) ) ( not ( = ?auto_884085 ?auto_884088 ) ) ( not ( = ?auto_884085 ?auto_884089 ) ) ( not ( = ?auto_884085 ?auto_884090 ) ) ( not ( = ?auto_884085 ?auto_884091 ) ) ( not ( = ?auto_884085 ?auto_884092 ) ) ( not ( = ?auto_884086 ?auto_884087 ) ) ( not ( = ?auto_884086 ?auto_884088 ) ) ( not ( = ?auto_884086 ?auto_884089 ) ) ( not ( = ?auto_884086 ?auto_884090 ) ) ( not ( = ?auto_884086 ?auto_884091 ) ) ( not ( = ?auto_884086 ?auto_884092 ) ) ( not ( = ?auto_884087 ?auto_884088 ) ) ( not ( = ?auto_884087 ?auto_884089 ) ) ( not ( = ?auto_884087 ?auto_884090 ) ) ( not ( = ?auto_884087 ?auto_884091 ) ) ( not ( = ?auto_884087 ?auto_884092 ) ) ( not ( = ?auto_884088 ?auto_884089 ) ) ( not ( = ?auto_884088 ?auto_884090 ) ) ( not ( = ?auto_884088 ?auto_884091 ) ) ( not ( = ?auto_884088 ?auto_884092 ) ) ( not ( = ?auto_884089 ?auto_884090 ) ) ( not ( = ?auto_884089 ?auto_884091 ) ) ( not ( = ?auto_884089 ?auto_884092 ) ) ( not ( = ?auto_884090 ?auto_884091 ) ) ( not ( = ?auto_884090 ?auto_884092 ) ) ( not ( = ?auto_884091 ?auto_884092 ) ) ( ON ?auto_884090 ?auto_884091 ) ( ON ?auto_884089 ?auto_884090 ) ( CLEAR ?auto_884087 ) ( ON ?auto_884088 ?auto_884089 ) ( CLEAR ?auto_884088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_884078 ?auto_884079 ?auto_884080 ?auto_884081 ?auto_884082 ?auto_884083 ?auto_884084 ?auto_884085 ?auto_884086 ?auto_884087 ?auto_884088 )
      ( MAKE-14PILE ?auto_884078 ?auto_884079 ?auto_884080 ?auto_884081 ?auto_884082 ?auto_884083 ?auto_884084 ?auto_884085 ?auto_884086 ?auto_884087 ?auto_884088 ?auto_884089 ?auto_884090 ?auto_884091 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_884136 - BLOCK
      ?auto_884137 - BLOCK
      ?auto_884138 - BLOCK
      ?auto_884139 - BLOCK
      ?auto_884140 - BLOCK
      ?auto_884141 - BLOCK
      ?auto_884142 - BLOCK
      ?auto_884143 - BLOCK
      ?auto_884144 - BLOCK
      ?auto_884145 - BLOCK
      ?auto_884146 - BLOCK
      ?auto_884147 - BLOCK
      ?auto_884148 - BLOCK
      ?auto_884149 - BLOCK
    )
    :vars
    (
      ?auto_884150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884149 ?auto_884150 ) ( ON-TABLE ?auto_884136 ) ( ON ?auto_884137 ?auto_884136 ) ( ON ?auto_884138 ?auto_884137 ) ( ON ?auto_884139 ?auto_884138 ) ( ON ?auto_884140 ?auto_884139 ) ( ON ?auto_884141 ?auto_884140 ) ( ON ?auto_884142 ?auto_884141 ) ( ON ?auto_884143 ?auto_884142 ) ( ON ?auto_884144 ?auto_884143 ) ( not ( = ?auto_884136 ?auto_884137 ) ) ( not ( = ?auto_884136 ?auto_884138 ) ) ( not ( = ?auto_884136 ?auto_884139 ) ) ( not ( = ?auto_884136 ?auto_884140 ) ) ( not ( = ?auto_884136 ?auto_884141 ) ) ( not ( = ?auto_884136 ?auto_884142 ) ) ( not ( = ?auto_884136 ?auto_884143 ) ) ( not ( = ?auto_884136 ?auto_884144 ) ) ( not ( = ?auto_884136 ?auto_884145 ) ) ( not ( = ?auto_884136 ?auto_884146 ) ) ( not ( = ?auto_884136 ?auto_884147 ) ) ( not ( = ?auto_884136 ?auto_884148 ) ) ( not ( = ?auto_884136 ?auto_884149 ) ) ( not ( = ?auto_884136 ?auto_884150 ) ) ( not ( = ?auto_884137 ?auto_884138 ) ) ( not ( = ?auto_884137 ?auto_884139 ) ) ( not ( = ?auto_884137 ?auto_884140 ) ) ( not ( = ?auto_884137 ?auto_884141 ) ) ( not ( = ?auto_884137 ?auto_884142 ) ) ( not ( = ?auto_884137 ?auto_884143 ) ) ( not ( = ?auto_884137 ?auto_884144 ) ) ( not ( = ?auto_884137 ?auto_884145 ) ) ( not ( = ?auto_884137 ?auto_884146 ) ) ( not ( = ?auto_884137 ?auto_884147 ) ) ( not ( = ?auto_884137 ?auto_884148 ) ) ( not ( = ?auto_884137 ?auto_884149 ) ) ( not ( = ?auto_884137 ?auto_884150 ) ) ( not ( = ?auto_884138 ?auto_884139 ) ) ( not ( = ?auto_884138 ?auto_884140 ) ) ( not ( = ?auto_884138 ?auto_884141 ) ) ( not ( = ?auto_884138 ?auto_884142 ) ) ( not ( = ?auto_884138 ?auto_884143 ) ) ( not ( = ?auto_884138 ?auto_884144 ) ) ( not ( = ?auto_884138 ?auto_884145 ) ) ( not ( = ?auto_884138 ?auto_884146 ) ) ( not ( = ?auto_884138 ?auto_884147 ) ) ( not ( = ?auto_884138 ?auto_884148 ) ) ( not ( = ?auto_884138 ?auto_884149 ) ) ( not ( = ?auto_884138 ?auto_884150 ) ) ( not ( = ?auto_884139 ?auto_884140 ) ) ( not ( = ?auto_884139 ?auto_884141 ) ) ( not ( = ?auto_884139 ?auto_884142 ) ) ( not ( = ?auto_884139 ?auto_884143 ) ) ( not ( = ?auto_884139 ?auto_884144 ) ) ( not ( = ?auto_884139 ?auto_884145 ) ) ( not ( = ?auto_884139 ?auto_884146 ) ) ( not ( = ?auto_884139 ?auto_884147 ) ) ( not ( = ?auto_884139 ?auto_884148 ) ) ( not ( = ?auto_884139 ?auto_884149 ) ) ( not ( = ?auto_884139 ?auto_884150 ) ) ( not ( = ?auto_884140 ?auto_884141 ) ) ( not ( = ?auto_884140 ?auto_884142 ) ) ( not ( = ?auto_884140 ?auto_884143 ) ) ( not ( = ?auto_884140 ?auto_884144 ) ) ( not ( = ?auto_884140 ?auto_884145 ) ) ( not ( = ?auto_884140 ?auto_884146 ) ) ( not ( = ?auto_884140 ?auto_884147 ) ) ( not ( = ?auto_884140 ?auto_884148 ) ) ( not ( = ?auto_884140 ?auto_884149 ) ) ( not ( = ?auto_884140 ?auto_884150 ) ) ( not ( = ?auto_884141 ?auto_884142 ) ) ( not ( = ?auto_884141 ?auto_884143 ) ) ( not ( = ?auto_884141 ?auto_884144 ) ) ( not ( = ?auto_884141 ?auto_884145 ) ) ( not ( = ?auto_884141 ?auto_884146 ) ) ( not ( = ?auto_884141 ?auto_884147 ) ) ( not ( = ?auto_884141 ?auto_884148 ) ) ( not ( = ?auto_884141 ?auto_884149 ) ) ( not ( = ?auto_884141 ?auto_884150 ) ) ( not ( = ?auto_884142 ?auto_884143 ) ) ( not ( = ?auto_884142 ?auto_884144 ) ) ( not ( = ?auto_884142 ?auto_884145 ) ) ( not ( = ?auto_884142 ?auto_884146 ) ) ( not ( = ?auto_884142 ?auto_884147 ) ) ( not ( = ?auto_884142 ?auto_884148 ) ) ( not ( = ?auto_884142 ?auto_884149 ) ) ( not ( = ?auto_884142 ?auto_884150 ) ) ( not ( = ?auto_884143 ?auto_884144 ) ) ( not ( = ?auto_884143 ?auto_884145 ) ) ( not ( = ?auto_884143 ?auto_884146 ) ) ( not ( = ?auto_884143 ?auto_884147 ) ) ( not ( = ?auto_884143 ?auto_884148 ) ) ( not ( = ?auto_884143 ?auto_884149 ) ) ( not ( = ?auto_884143 ?auto_884150 ) ) ( not ( = ?auto_884144 ?auto_884145 ) ) ( not ( = ?auto_884144 ?auto_884146 ) ) ( not ( = ?auto_884144 ?auto_884147 ) ) ( not ( = ?auto_884144 ?auto_884148 ) ) ( not ( = ?auto_884144 ?auto_884149 ) ) ( not ( = ?auto_884144 ?auto_884150 ) ) ( not ( = ?auto_884145 ?auto_884146 ) ) ( not ( = ?auto_884145 ?auto_884147 ) ) ( not ( = ?auto_884145 ?auto_884148 ) ) ( not ( = ?auto_884145 ?auto_884149 ) ) ( not ( = ?auto_884145 ?auto_884150 ) ) ( not ( = ?auto_884146 ?auto_884147 ) ) ( not ( = ?auto_884146 ?auto_884148 ) ) ( not ( = ?auto_884146 ?auto_884149 ) ) ( not ( = ?auto_884146 ?auto_884150 ) ) ( not ( = ?auto_884147 ?auto_884148 ) ) ( not ( = ?auto_884147 ?auto_884149 ) ) ( not ( = ?auto_884147 ?auto_884150 ) ) ( not ( = ?auto_884148 ?auto_884149 ) ) ( not ( = ?auto_884148 ?auto_884150 ) ) ( not ( = ?auto_884149 ?auto_884150 ) ) ( ON ?auto_884148 ?auto_884149 ) ( ON ?auto_884147 ?auto_884148 ) ( ON ?auto_884146 ?auto_884147 ) ( CLEAR ?auto_884144 ) ( ON ?auto_884145 ?auto_884146 ) ( CLEAR ?auto_884145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_884136 ?auto_884137 ?auto_884138 ?auto_884139 ?auto_884140 ?auto_884141 ?auto_884142 ?auto_884143 ?auto_884144 ?auto_884145 )
      ( MAKE-14PILE ?auto_884136 ?auto_884137 ?auto_884138 ?auto_884139 ?auto_884140 ?auto_884141 ?auto_884142 ?auto_884143 ?auto_884144 ?auto_884145 ?auto_884146 ?auto_884147 ?auto_884148 ?auto_884149 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_884194 - BLOCK
      ?auto_884195 - BLOCK
      ?auto_884196 - BLOCK
      ?auto_884197 - BLOCK
      ?auto_884198 - BLOCK
      ?auto_884199 - BLOCK
      ?auto_884200 - BLOCK
      ?auto_884201 - BLOCK
      ?auto_884202 - BLOCK
      ?auto_884203 - BLOCK
      ?auto_884204 - BLOCK
      ?auto_884205 - BLOCK
      ?auto_884206 - BLOCK
      ?auto_884207 - BLOCK
    )
    :vars
    (
      ?auto_884208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884207 ?auto_884208 ) ( ON-TABLE ?auto_884194 ) ( ON ?auto_884195 ?auto_884194 ) ( ON ?auto_884196 ?auto_884195 ) ( ON ?auto_884197 ?auto_884196 ) ( ON ?auto_884198 ?auto_884197 ) ( ON ?auto_884199 ?auto_884198 ) ( ON ?auto_884200 ?auto_884199 ) ( ON ?auto_884201 ?auto_884200 ) ( not ( = ?auto_884194 ?auto_884195 ) ) ( not ( = ?auto_884194 ?auto_884196 ) ) ( not ( = ?auto_884194 ?auto_884197 ) ) ( not ( = ?auto_884194 ?auto_884198 ) ) ( not ( = ?auto_884194 ?auto_884199 ) ) ( not ( = ?auto_884194 ?auto_884200 ) ) ( not ( = ?auto_884194 ?auto_884201 ) ) ( not ( = ?auto_884194 ?auto_884202 ) ) ( not ( = ?auto_884194 ?auto_884203 ) ) ( not ( = ?auto_884194 ?auto_884204 ) ) ( not ( = ?auto_884194 ?auto_884205 ) ) ( not ( = ?auto_884194 ?auto_884206 ) ) ( not ( = ?auto_884194 ?auto_884207 ) ) ( not ( = ?auto_884194 ?auto_884208 ) ) ( not ( = ?auto_884195 ?auto_884196 ) ) ( not ( = ?auto_884195 ?auto_884197 ) ) ( not ( = ?auto_884195 ?auto_884198 ) ) ( not ( = ?auto_884195 ?auto_884199 ) ) ( not ( = ?auto_884195 ?auto_884200 ) ) ( not ( = ?auto_884195 ?auto_884201 ) ) ( not ( = ?auto_884195 ?auto_884202 ) ) ( not ( = ?auto_884195 ?auto_884203 ) ) ( not ( = ?auto_884195 ?auto_884204 ) ) ( not ( = ?auto_884195 ?auto_884205 ) ) ( not ( = ?auto_884195 ?auto_884206 ) ) ( not ( = ?auto_884195 ?auto_884207 ) ) ( not ( = ?auto_884195 ?auto_884208 ) ) ( not ( = ?auto_884196 ?auto_884197 ) ) ( not ( = ?auto_884196 ?auto_884198 ) ) ( not ( = ?auto_884196 ?auto_884199 ) ) ( not ( = ?auto_884196 ?auto_884200 ) ) ( not ( = ?auto_884196 ?auto_884201 ) ) ( not ( = ?auto_884196 ?auto_884202 ) ) ( not ( = ?auto_884196 ?auto_884203 ) ) ( not ( = ?auto_884196 ?auto_884204 ) ) ( not ( = ?auto_884196 ?auto_884205 ) ) ( not ( = ?auto_884196 ?auto_884206 ) ) ( not ( = ?auto_884196 ?auto_884207 ) ) ( not ( = ?auto_884196 ?auto_884208 ) ) ( not ( = ?auto_884197 ?auto_884198 ) ) ( not ( = ?auto_884197 ?auto_884199 ) ) ( not ( = ?auto_884197 ?auto_884200 ) ) ( not ( = ?auto_884197 ?auto_884201 ) ) ( not ( = ?auto_884197 ?auto_884202 ) ) ( not ( = ?auto_884197 ?auto_884203 ) ) ( not ( = ?auto_884197 ?auto_884204 ) ) ( not ( = ?auto_884197 ?auto_884205 ) ) ( not ( = ?auto_884197 ?auto_884206 ) ) ( not ( = ?auto_884197 ?auto_884207 ) ) ( not ( = ?auto_884197 ?auto_884208 ) ) ( not ( = ?auto_884198 ?auto_884199 ) ) ( not ( = ?auto_884198 ?auto_884200 ) ) ( not ( = ?auto_884198 ?auto_884201 ) ) ( not ( = ?auto_884198 ?auto_884202 ) ) ( not ( = ?auto_884198 ?auto_884203 ) ) ( not ( = ?auto_884198 ?auto_884204 ) ) ( not ( = ?auto_884198 ?auto_884205 ) ) ( not ( = ?auto_884198 ?auto_884206 ) ) ( not ( = ?auto_884198 ?auto_884207 ) ) ( not ( = ?auto_884198 ?auto_884208 ) ) ( not ( = ?auto_884199 ?auto_884200 ) ) ( not ( = ?auto_884199 ?auto_884201 ) ) ( not ( = ?auto_884199 ?auto_884202 ) ) ( not ( = ?auto_884199 ?auto_884203 ) ) ( not ( = ?auto_884199 ?auto_884204 ) ) ( not ( = ?auto_884199 ?auto_884205 ) ) ( not ( = ?auto_884199 ?auto_884206 ) ) ( not ( = ?auto_884199 ?auto_884207 ) ) ( not ( = ?auto_884199 ?auto_884208 ) ) ( not ( = ?auto_884200 ?auto_884201 ) ) ( not ( = ?auto_884200 ?auto_884202 ) ) ( not ( = ?auto_884200 ?auto_884203 ) ) ( not ( = ?auto_884200 ?auto_884204 ) ) ( not ( = ?auto_884200 ?auto_884205 ) ) ( not ( = ?auto_884200 ?auto_884206 ) ) ( not ( = ?auto_884200 ?auto_884207 ) ) ( not ( = ?auto_884200 ?auto_884208 ) ) ( not ( = ?auto_884201 ?auto_884202 ) ) ( not ( = ?auto_884201 ?auto_884203 ) ) ( not ( = ?auto_884201 ?auto_884204 ) ) ( not ( = ?auto_884201 ?auto_884205 ) ) ( not ( = ?auto_884201 ?auto_884206 ) ) ( not ( = ?auto_884201 ?auto_884207 ) ) ( not ( = ?auto_884201 ?auto_884208 ) ) ( not ( = ?auto_884202 ?auto_884203 ) ) ( not ( = ?auto_884202 ?auto_884204 ) ) ( not ( = ?auto_884202 ?auto_884205 ) ) ( not ( = ?auto_884202 ?auto_884206 ) ) ( not ( = ?auto_884202 ?auto_884207 ) ) ( not ( = ?auto_884202 ?auto_884208 ) ) ( not ( = ?auto_884203 ?auto_884204 ) ) ( not ( = ?auto_884203 ?auto_884205 ) ) ( not ( = ?auto_884203 ?auto_884206 ) ) ( not ( = ?auto_884203 ?auto_884207 ) ) ( not ( = ?auto_884203 ?auto_884208 ) ) ( not ( = ?auto_884204 ?auto_884205 ) ) ( not ( = ?auto_884204 ?auto_884206 ) ) ( not ( = ?auto_884204 ?auto_884207 ) ) ( not ( = ?auto_884204 ?auto_884208 ) ) ( not ( = ?auto_884205 ?auto_884206 ) ) ( not ( = ?auto_884205 ?auto_884207 ) ) ( not ( = ?auto_884205 ?auto_884208 ) ) ( not ( = ?auto_884206 ?auto_884207 ) ) ( not ( = ?auto_884206 ?auto_884208 ) ) ( not ( = ?auto_884207 ?auto_884208 ) ) ( ON ?auto_884206 ?auto_884207 ) ( ON ?auto_884205 ?auto_884206 ) ( ON ?auto_884204 ?auto_884205 ) ( ON ?auto_884203 ?auto_884204 ) ( CLEAR ?auto_884201 ) ( ON ?auto_884202 ?auto_884203 ) ( CLEAR ?auto_884202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_884194 ?auto_884195 ?auto_884196 ?auto_884197 ?auto_884198 ?auto_884199 ?auto_884200 ?auto_884201 ?auto_884202 )
      ( MAKE-14PILE ?auto_884194 ?auto_884195 ?auto_884196 ?auto_884197 ?auto_884198 ?auto_884199 ?auto_884200 ?auto_884201 ?auto_884202 ?auto_884203 ?auto_884204 ?auto_884205 ?auto_884206 ?auto_884207 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_884252 - BLOCK
      ?auto_884253 - BLOCK
      ?auto_884254 - BLOCK
      ?auto_884255 - BLOCK
      ?auto_884256 - BLOCK
      ?auto_884257 - BLOCK
      ?auto_884258 - BLOCK
      ?auto_884259 - BLOCK
      ?auto_884260 - BLOCK
      ?auto_884261 - BLOCK
      ?auto_884262 - BLOCK
      ?auto_884263 - BLOCK
      ?auto_884264 - BLOCK
      ?auto_884265 - BLOCK
    )
    :vars
    (
      ?auto_884266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884265 ?auto_884266 ) ( ON-TABLE ?auto_884252 ) ( ON ?auto_884253 ?auto_884252 ) ( ON ?auto_884254 ?auto_884253 ) ( ON ?auto_884255 ?auto_884254 ) ( ON ?auto_884256 ?auto_884255 ) ( ON ?auto_884257 ?auto_884256 ) ( ON ?auto_884258 ?auto_884257 ) ( not ( = ?auto_884252 ?auto_884253 ) ) ( not ( = ?auto_884252 ?auto_884254 ) ) ( not ( = ?auto_884252 ?auto_884255 ) ) ( not ( = ?auto_884252 ?auto_884256 ) ) ( not ( = ?auto_884252 ?auto_884257 ) ) ( not ( = ?auto_884252 ?auto_884258 ) ) ( not ( = ?auto_884252 ?auto_884259 ) ) ( not ( = ?auto_884252 ?auto_884260 ) ) ( not ( = ?auto_884252 ?auto_884261 ) ) ( not ( = ?auto_884252 ?auto_884262 ) ) ( not ( = ?auto_884252 ?auto_884263 ) ) ( not ( = ?auto_884252 ?auto_884264 ) ) ( not ( = ?auto_884252 ?auto_884265 ) ) ( not ( = ?auto_884252 ?auto_884266 ) ) ( not ( = ?auto_884253 ?auto_884254 ) ) ( not ( = ?auto_884253 ?auto_884255 ) ) ( not ( = ?auto_884253 ?auto_884256 ) ) ( not ( = ?auto_884253 ?auto_884257 ) ) ( not ( = ?auto_884253 ?auto_884258 ) ) ( not ( = ?auto_884253 ?auto_884259 ) ) ( not ( = ?auto_884253 ?auto_884260 ) ) ( not ( = ?auto_884253 ?auto_884261 ) ) ( not ( = ?auto_884253 ?auto_884262 ) ) ( not ( = ?auto_884253 ?auto_884263 ) ) ( not ( = ?auto_884253 ?auto_884264 ) ) ( not ( = ?auto_884253 ?auto_884265 ) ) ( not ( = ?auto_884253 ?auto_884266 ) ) ( not ( = ?auto_884254 ?auto_884255 ) ) ( not ( = ?auto_884254 ?auto_884256 ) ) ( not ( = ?auto_884254 ?auto_884257 ) ) ( not ( = ?auto_884254 ?auto_884258 ) ) ( not ( = ?auto_884254 ?auto_884259 ) ) ( not ( = ?auto_884254 ?auto_884260 ) ) ( not ( = ?auto_884254 ?auto_884261 ) ) ( not ( = ?auto_884254 ?auto_884262 ) ) ( not ( = ?auto_884254 ?auto_884263 ) ) ( not ( = ?auto_884254 ?auto_884264 ) ) ( not ( = ?auto_884254 ?auto_884265 ) ) ( not ( = ?auto_884254 ?auto_884266 ) ) ( not ( = ?auto_884255 ?auto_884256 ) ) ( not ( = ?auto_884255 ?auto_884257 ) ) ( not ( = ?auto_884255 ?auto_884258 ) ) ( not ( = ?auto_884255 ?auto_884259 ) ) ( not ( = ?auto_884255 ?auto_884260 ) ) ( not ( = ?auto_884255 ?auto_884261 ) ) ( not ( = ?auto_884255 ?auto_884262 ) ) ( not ( = ?auto_884255 ?auto_884263 ) ) ( not ( = ?auto_884255 ?auto_884264 ) ) ( not ( = ?auto_884255 ?auto_884265 ) ) ( not ( = ?auto_884255 ?auto_884266 ) ) ( not ( = ?auto_884256 ?auto_884257 ) ) ( not ( = ?auto_884256 ?auto_884258 ) ) ( not ( = ?auto_884256 ?auto_884259 ) ) ( not ( = ?auto_884256 ?auto_884260 ) ) ( not ( = ?auto_884256 ?auto_884261 ) ) ( not ( = ?auto_884256 ?auto_884262 ) ) ( not ( = ?auto_884256 ?auto_884263 ) ) ( not ( = ?auto_884256 ?auto_884264 ) ) ( not ( = ?auto_884256 ?auto_884265 ) ) ( not ( = ?auto_884256 ?auto_884266 ) ) ( not ( = ?auto_884257 ?auto_884258 ) ) ( not ( = ?auto_884257 ?auto_884259 ) ) ( not ( = ?auto_884257 ?auto_884260 ) ) ( not ( = ?auto_884257 ?auto_884261 ) ) ( not ( = ?auto_884257 ?auto_884262 ) ) ( not ( = ?auto_884257 ?auto_884263 ) ) ( not ( = ?auto_884257 ?auto_884264 ) ) ( not ( = ?auto_884257 ?auto_884265 ) ) ( not ( = ?auto_884257 ?auto_884266 ) ) ( not ( = ?auto_884258 ?auto_884259 ) ) ( not ( = ?auto_884258 ?auto_884260 ) ) ( not ( = ?auto_884258 ?auto_884261 ) ) ( not ( = ?auto_884258 ?auto_884262 ) ) ( not ( = ?auto_884258 ?auto_884263 ) ) ( not ( = ?auto_884258 ?auto_884264 ) ) ( not ( = ?auto_884258 ?auto_884265 ) ) ( not ( = ?auto_884258 ?auto_884266 ) ) ( not ( = ?auto_884259 ?auto_884260 ) ) ( not ( = ?auto_884259 ?auto_884261 ) ) ( not ( = ?auto_884259 ?auto_884262 ) ) ( not ( = ?auto_884259 ?auto_884263 ) ) ( not ( = ?auto_884259 ?auto_884264 ) ) ( not ( = ?auto_884259 ?auto_884265 ) ) ( not ( = ?auto_884259 ?auto_884266 ) ) ( not ( = ?auto_884260 ?auto_884261 ) ) ( not ( = ?auto_884260 ?auto_884262 ) ) ( not ( = ?auto_884260 ?auto_884263 ) ) ( not ( = ?auto_884260 ?auto_884264 ) ) ( not ( = ?auto_884260 ?auto_884265 ) ) ( not ( = ?auto_884260 ?auto_884266 ) ) ( not ( = ?auto_884261 ?auto_884262 ) ) ( not ( = ?auto_884261 ?auto_884263 ) ) ( not ( = ?auto_884261 ?auto_884264 ) ) ( not ( = ?auto_884261 ?auto_884265 ) ) ( not ( = ?auto_884261 ?auto_884266 ) ) ( not ( = ?auto_884262 ?auto_884263 ) ) ( not ( = ?auto_884262 ?auto_884264 ) ) ( not ( = ?auto_884262 ?auto_884265 ) ) ( not ( = ?auto_884262 ?auto_884266 ) ) ( not ( = ?auto_884263 ?auto_884264 ) ) ( not ( = ?auto_884263 ?auto_884265 ) ) ( not ( = ?auto_884263 ?auto_884266 ) ) ( not ( = ?auto_884264 ?auto_884265 ) ) ( not ( = ?auto_884264 ?auto_884266 ) ) ( not ( = ?auto_884265 ?auto_884266 ) ) ( ON ?auto_884264 ?auto_884265 ) ( ON ?auto_884263 ?auto_884264 ) ( ON ?auto_884262 ?auto_884263 ) ( ON ?auto_884261 ?auto_884262 ) ( ON ?auto_884260 ?auto_884261 ) ( CLEAR ?auto_884258 ) ( ON ?auto_884259 ?auto_884260 ) ( CLEAR ?auto_884259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_884252 ?auto_884253 ?auto_884254 ?auto_884255 ?auto_884256 ?auto_884257 ?auto_884258 ?auto_884259 )
      ( MAKE-14PILE ?auto_884252 ?auto_884253 ?auto_884254 ?auto_884255 ?auto_884256 ?auto_884257 ?auto_884258 ?auto_884259 ?auto_884260 ?auto_884261 ?auto_884262 ?auto_884263 ?auto_884264 ?auto_884265 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_884310 - BLOCK
      ?auto_884311 - BLOCK
      ?auto_884312 - BLOCK
      ?auto_884313 - BLOCK
      ?auto_884314 - BLOCK
      ?auto_884315 - BLOCK
      ?auto_884316 - BLOCK
      ?auto_884317 - BLOCK
      ?auto_884318 - BLOCK
      ?auto_884319 - BLOCK
      ?auto_884320 - BLOCK
      ?auto_884321 - BLOCK
      ?auto_884322 - BLOCK
      ?auto_884323 - BLOCK
    )
    :vars
    (
      ?auto_884324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884323 ?auto_884324 ) ( ON-TABLE ?auto_884310 ) ( ON ?auto_884311 ?auto_884310 ) ( ON ?auto_884312 ?auto_884311 ) ( ON ?auto_884313 ?auto_884312 ) ( ON ?auto_884314 ?auto_884313 ) ( ON ?auto_884315 ?auto_884314 ) ( not ( = ?auto_884310 ?auto_884311 ) ) ( not ( = ?auto_884310 ?auto_884312 ) ) ( not ( = ?auto_884310 ?auto_884313 ) ) ( not ( = ?auto_884310 ?auto_884314 ) ) ( not ( = ?auto_884310 ?auto_884315 ) ) ( not ( = ?auto_884310 ?auto_884316 ) ) ( not ( = ?auto_884310 ?auto_884317 ) ) ( not ( = ?auto_884310 ?auto_884318 ) ) ( not ( = ?auto_884310 ?auto_884319 ) ) ( not ( = ?auto_884310 ?auto_884320 ) ) ( not ( = ?auto_884310 ?auto_884321 ) ) ( not ( = ?auto_884310 ?auto_884322 ) ) ( not ( = ?auto_884310 ?auto_884323 ) ) ( not ( = ?auto_884310 ?auto_884324 ) ) ( not ( = ?auto_884311 ?auto_884312 ) ) ( not ( = ?auto_884311 ?auto_884313 ) ) ( not ( = ?auto_884311 ?auto_884314 ) ) ( not ( = ?auto_884311 ?auto_884315 ) ) ( not ( = ?auto_884311 ?auto_884316 ) ) ( not ( = ?auto_884311 ?auto_884317 ) ) ( not ( = ?auto_884311 ?auto_884318 ) ) ( not ( = ?auto_884311 ?auto_884319 ) ) ( not ( = ?auto_884311 ?auto_884320 ) ) ( not ( = ?auto_884311 ?auto_884321 ) ) ( not ( = ?auto_884311 ?auto_884322 ) ) ( not ( = ?auto_884311 ?auto_884323 ) ) ( not ( = ?auto_884311 ?auto_884324 ) ) ( not ( = ?auto_884312 ?auto_884313 ) ) ( not ( = ?auto_884312 ?auto_884314 ) ) ( not ( = ?auto_884312 ?auto_884315 ) ) ( not ( = ?auto_884312 ?auto_884316 ) ) ( not ( = ?auto_884312 ?auto_884317 ) ) ( not ( = ?auto_884312 ?auto_884318 ) ) ( not ( = ?auto_884312 ?auto_884319 ) ) ( not ( = ?auto_884312 ?auto_884320 ) ) ( not ( = ?auto_884312 ?auto_884321 ) ) ( not ( = ?auto_884312 ?auto_884322 ) ) ( not ( = ?auto_884312 ?auto_884323 ) ) ( not ( = ?auto_884312 ?auto_884324 ) ) ( not ( = ?auto_884313 ?auto_884314 ) ) ( not ( = ?auto_884313 ?auto_884315 ) ) ( not ( = ?auto_884313 ?auto_884316 ) ) ( not ( = ?auto_884313 ?auto_884317 ) ) ( not ( = ?auto_884313 ?auto_884318 ) ) ( not ( = ?auto_884313 ?auto_884319 ) ) ( not ( = ?auto_884313 ?auto_884320 ) ) ( not ( = ?auto_884313 ?auto_884321 ) ) ( not ( = ?auto_884313 ?auto_884322 ) ) ( not ( = ?auto_884313 ?auto_884323 ) ) ( not ( = ?auto_884313 ?auto_884324 ) ) ( not ( = ?auto_884314 ?auto_884315 ) ) ( not ( = ?auto_884314 ?auto_884316 ) ) ( not ( = ?auto_884314 ?auto_884317 ) ) ( not ( = ?auto_884314 ?auto_884318 ) ) ( not ( = ?auto_884314 ?auto_884319 ) ) ( not ( = ?auto_884314 ?auto_884320 ) ) ( not ( = ?auto_884314 ?auto_884321 ) ) ( not ( = ?auto_884314 ?auto_884322 ) ) ( not ( = ?auto_884314 ?auto_884323 ) ) ( not ( = ?auto_884314 ?auto_884324 ) ) ( not ( = ?auto_884315 ?auto_884316 ) ) ( not ( = ?auto_884315 ?auto_884317 ) ) ( not ( = ?auto_884315 ?auto_884318 ) ) ( not ( = ?auto_884315 ?auto_884319 ) ) ( not ( = ?auto_884315 ?auto_884320 ) ) ( not ( = ?auto_884315 ?auto_884321 ) ) ( not ( = ?auto_884315 ?auto_884322 ) ) ( not ( = ?auto_884315 ?auto_884323 ) ) ( not ( = ?auto_884315 ?auto_884324 ) ) ( not ( = ?auto_884316 ?auto_884317 ) ) ( not ( = ?auto_884316 ?auto_884318 ) ) ( not ( = ?auto_884316 ?auto_884319 ) ) ( not ( = ?auto_884316 ?auto_884320 ) ) ( not ( = ?auto_884316 ?auto_884321 ) ) ( not ( = ?auto_884316 ?auto_884322 ) ) ( not ( = ?auto_884316 ?auto_884323 ) ) ( not ( = ?auto_884316 ?auto_884324 ) ) ( not ( = ?auto_884317 ?auto_884318 ) ) ( not ( = ?auto_884317 ?auto_884319 ) ) ( not ( = ?auto_884317 ?auto_884320 ) ) ( not ( = ?auto_884317 ?auto_884321 ) ) ( not ( = ?auto_884317 ?auto_884322 ) ) ( not ( = ?auto_884317 ?auto_884323 ) ) ( not ( = ?auto_884317 ?auto_884324 ) ) ( not ( = ?auto_884318 ?auto_884319 ) ) ( not ( = ?auto_884318 ?auto_884320 ) ) ( not ( = ?auto_884318 ?auto_884321 ) ) ( not ( = ?auto_884318 ?auto_884322 ) ) ( not ( = ?auto_884318 ?auto_884323 ) ) ( not ( = ?auto_884318 ?auto_884324 ) ) ( not ( = ?auto_884319 ?auto_884320 ) ) ( not ( = ?auto_884319 ?auto_884321 ) ) ( not ( = ?auto_884319 ?auto_884322 ) ) ( not ( = ?auto_884319 ?auto_884323 ) ) ( not ( = ?auto_884319 ?auto_884324 ) ) ( not ( = ?auto_884320 ?auto_884321 ) ) ( not ( = ?auto_884320 ?auto_884322 ) ) ( not ( = ?auto_884320 ?auto_884323 ) ) ( not ( = ?auto_884320 ?auto_884324 ) ) ( not ( = ?auto_884321 ?auto_884322 ) ) ( not ( = ?auto_884321 ?auto_884323 ) ) ( not ( = ?auto_884321 ?auto_884324 ) ) ( not ( = ?auto_884322 ?auto_884323 ) ) ( not ( = ?auto_884322 ?auto_884324 ) ) ( not ( = ?auto_884323 ?auto_884324 ) ) ( ON ?auto_884322 ?auto_884323 ) ( ON ?auto_884321 ?auto_884322 ) ( ON ?auto_884320 ?auto_884321 ) ( ON ?auto_884319 ?auto_884320 ) ( ON ?auto_884318 ?auto_884319 ) ( ON ?auto_884317 ?auto_884318 ) ( CLEAR ?auto_884315 ) ( ON ?auto_884316 ?auto_884317 ) ( CLEAR ?auto_884316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_884310 ?auto_884311 ?auto_884312 ?auto_884313 ?auto_884314 ?auto_884315 ?auto_884316 )
      ( MAKE-14PILE ?auto_884310 ?auto_884311 ?auto_884312 ?auto_884313 ?auto_884314 ?auto_884315 ?auto_884316 ?auto_884317 ?auto_884318 ?auto_884319 ?auto_884320 ?auto_884321 ?auto_884322 ?auto_884323 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_884368 - BLOCK
      ?auto_884369 - BLOCK
      ?auto_884370 - BLOCK
      ?auto_884371 - BLOCK
      ?auto_884372 - BLOCK
      ?auto_884373 - BLOCK
      ?auto_884374 - BLOCK
      ?auto_884375 - BLOCK
      ?auto_884376 - BLOCK
      ?auto_884377 - BLOCK
      ?auto_884378 - BLOCK
      ?auto_884379 - BLOCK
      ?auto_884380 - BLOCK
      ?auto_884381 - BLOCK
    )
    :vars
    (
      ?auto_884382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884381 ?auto_884382 ) ( ON-TABLE ?auto_884368 ) ( ON ?auto_884369 ?auto_884368 ) ( ON ?auto_884370 ?auto_884369 ) ( ON ?auto_884371 ?auto_884370 ) ( ON ?auto_884372 ?auto_884371 ) ( not ( = ?auto_884368 ?auto_884369 ) ) ( not ( = ?auto_884368 ?auto_884370 ) ) ( not ( = ?auto_884368 ?auto_884371 ) ) ( not ( = ?auto_884368 ?auto_884372 ) ) ( not ( = ?auto_884368 ?auto_884373 ) ) ( not ( = ?auto_884368 ?auto_884374 ) ) ( not ( = ?auto_884368 ?auto_884375 ) ) ( not ( = ?auto_884368 ?auto_884376 ) ) ( not ( = ?auto_884368 ?auto_884377 ) ) ( not ( = ?auto_884368 ?auto_884378 ) ) ( not ( = ?auto_884368 ?auto_884379 ) ) ( not ( = ?auto_884368 ?auto_884380 ) ) ( not ( = ?auto_884368 ?auto_884381 ) ) ( not ( = ?auto_884368 ?auto_884382 ) ) ( not ( = ?auto_884369 ?auto_884370 ) ) ( not ( = ?auto_884369 ?auto_884371 ) ) ( not ( = ?auto_884369 ?auto_884372 ) ) ( not ( = ?auto_884369 ?auto_884373 ) ) ( not ( = ?auto_884369 ?auto_884374 ) ) ( not ( = ?auto_884369 ?auto_884375 ) ) ( not ( = ?auto_884369 ?auto_884376 ) ) ( not ( = ?auto_884369 ?auto_884377 ) ) ( not ( = ?auto_884369 ?auto_884378 ) ) ( not ( = ?auto_884369 ?auto_884379 ) ) ( not ( = ?auto_884369 ?auto_884380 ) ) ( not ( = ?auto_884369 ?auto_884381 ) ) ( not ( = ?auto_884369 ?auto_884382 ) ) ( not ( = ?auto_884370 ?auto_884371 ) ) ( not ( = ?auto_884370 ?auto_884372 ) ) ( not ( = ?auto_884370 ?auto_884373 ) ) ( not ( = ?auto_884370 ?auto_884374 ) ) ( not ( = ?auto_884370 ?auto_884375 ) ) ( not ( = ?auto_884370 ?auto_884376 ) ) ( not ( = ?auto_884370 ?auto_884377 ) ) ( not ( = ?auto_884370 ?auto_884378 ) ) ( not ( = ?auto_884370 ?auto_884379 ) ) ( not ( = ?auto_884370 ?auto_884380 ) ) ( not ( = ?auto_884370 ?auto_884381 ) ) ( not ( = ?auto_884370 ?auto_884382 ) ) ( not ( = ?auto_884371 ?auto_884372 ) ) ( not ( = ?auto_884371 ?auto_884373 ) ) ( not ( = ?auto_884371 ?auto_884374 ) ) ( not ( = ?auto_884371 ?auto_884375 ) ) ( not ( = ?auto_884371 ?auto_884376 ) ) ( not ( = ?auto_884371 ?auto_884377 ) ) ( not ( = ?auto_884371 ?auto_884378 ) ) ( not ( = ?auto_884371 ?auto_884379 ) ) ( not ( = ?auto_884371 ?auto_884380 ) ) ( not ( = ?auto_884371 ?auto_884381 ) ) ( not ( = ?auto_884371 ?auto_884382 ) ) ( not ( = ?auto_884372 ?auto_884373 ) ) ( not ( = ?auto_884372 ?auto_884374 ) ) ( not ( = ?auto_884372 ?auto_884375 ) ) ( not ( = ?auto_884372 ?auto_884376 ) ) ( not ( = ?auto_884372 ?auto_884377 ) ) ( not ( = ?auto_884372 ?auto_884378 ) ) ( not ( = ?auto_884372 ?auto_884379 ) ) ( not ( = ?auto_884372 ?auto_884380 ) ) ( not ( = ?auto_884372 ?auto_884381 ) ) ( not ( = ?auto_884372 ?auto_884382 ) ) ( not ( = ?auto_884373 ?auto_884374 ) ) ( not ( = ?auto_884373 ?auto_884375 ) ) ( not ( = ?auto_884373 ?auto_884376 ) ) ( not ( = ?auto_884373 ?auto_884377 ) ) ( not ( = ?auto_884373 ?auto_884378 ) ) ( not ( = ?auto_884373 ?auto_884379 ) ) ( not ( = ?auto_884373 ?auto_884380 ) ) ( not ( = ?auto_884373 ?auto_884381 ) ) ( not ( = ?auto_884373 ?auto_884382 ) ) ( not ( = ?auto_884374 ?auto_884375 ) ) ( not ( = ?auto_884374 ?auto_884376 ) ) ( not ( = ?auto_884374 ?auto_884377 ) ) ( not ( = ?auto_884374 ?auto_884378 ) ) ( not ( = ?auto_884374 ?auto_884379 ) ) ( not ( = ?auto_884374 ?auto_884380 ) ) ( not ( = ?auto_884374 ?auto_884381 ) ) ( not ( = ?auto_884374 ?auto_884382 ) ) ( not ( = ?auto_884375 ?auto_884376 ) ) ( not ( = ?auto_884375 ?auto_884377 ) ) ( not ( = ?auto_884375 ?auto_884378 ) ) ( not ( = ?auto_884375 ?auto_884379 ) ) ( not ( = ?auto_884375 ?auto_884380 ) ) ( not ( = ?auto_884375 ?auto_884381 ) ) ( not ( = ?auto_884375 ?auto_884382 ) ) ( not ( = ?auto_884376 ?auto_884377 ) ) ( not ( = ?auto_884376 ?auto_884378 ) ) ( not ( = ?auto_884376 ?auto_884379 ) ) ( not ( = ?auto_884376 ?auto_884380 ) ) ( not ( = ?auto_884376 ?auto_884381 ) ) ( not ( = ?auto_884376 ?auto_884382 ) ) ( not ( = ?auto_884377 ?auto_884378 ) ) ( not ( = ?auto_884377 ?auto_884379 ) ) ( not ( = ?auto_884377 ?auto_884380 ) ) ( not ( = ?auto_884377 ?auto_884381 ) ) ( not ( = ?auto_884377 ?auto_884382 ) ) ( not ( = ?auto_884378 ?auto_884379 ) ) ( not ( = ?auto_884378 ?auto_884380 ) ) ( not ( = ?auto_884378 ?auto_884381 ) ) ( not ( = ?auto_884378 ?auto_884382 ) ) ( not ( = ?auto_884379 ?auto_884380 ) ) ( not ( = ?auto_884379 ?auto_884381 ) ) ( not ( = ?auto_884379 ?auto_884382 ) ) ( not ( = ?auto_884380 ?auto_884381 ) ) ( not ( = ?auto_884380 ?auto_884382 ) ) ( not ( = ?auto_884381 ?auto_884382 ) ) ( ON ?auto_884380 ?auto_884381 ) ( ON ?auto_884379 ?auto_884380 ) ( ON ?auto_884378 ?auto_884379 ) ( ON ?auto_884377 ?auto_884378 ) ( ON ?auto_884376 ?auto_884377 ) ( ON ?auto_884375 ?auto_884376 ) ( ON ?auto_884374 ?auto_884375 ) ( CLEAR ?auto_884372 ) ( ON ?auto_884373 ?auto_884374 ) ( CLEAR ?auto_884373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_884368 ?auto_884369 ?auto_884370 ?auto_884371 ?auto_884372 ?auto_884373 )
      ( MAKE-14PILE ?auto_884368 ?auto_884369 ?auto_884370 ?auto_884371 ?auto_884372 ?auto_884373 ?auto_884374 ?auto_884375 ?auto_884376 ?auto_884377 ?auto_884378 ?auto_884379 ?auto_884380 ?auto_884381 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_884426 - BLOCK
      ?auto_884427 - BLOCK
      ?auto_884428 - BLOCK
      ?auto_884429 - BLOCK
      ?auto_884430 - BLOCK
      ?auto_884431 - BLOCK
      ?auto_884432 - BLOCK
      ?auto_884433 - BLOCK
      ?auto_884434 - BLOCK
      ?auto_884435 - BLOCK
      ?auto_884436 - BLOCK
      ?auto_884437 - BLOCK
      ?auto_884438 - BLOCK
      ?auto_884439 - BLOCK
    )
    :vars
    (
      ?auto_884440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884439 ?auto_884440 ) ( ON-TABLE ?auto_884426 ) ( ON ?auto_884427 ?auto_884426 ) ( ON ?auto_884428 ?auto_884427 ) ( ON ?auto_884429 ?auto_884428 ) ( not ( = ?auto_884426 ?auto_884427 ) ) ( not ( = ?auto_884426 ?auto_884428 ) ) ( not ( = ?auto_884426 ?auto_884429 ) ) ( not ( = ?auto_884426 ?auto_884430 ) ) ( not ( = ?auto_884426 ?auto_884431 ) ) ( not ( = ?auto_884426 ?auto_884432 ) ) ( not ( = ?auto_884426 ?auto_884433 ) ) ( not ( = ?auto_884426 ?auto_884434 ) ) ( not ( = ?auto_884426 ?auto_884435 ) ) ( not ( = ?auto_884426 ?auto_884436 ) ) ( not ( = ?auto_884426 ?auto_884437 ) ) ( not ( = ?auto_884426 ?auto_884438 ) ) ( not ( = ?auto_884426 ?auto_884439 ) ) ( not ( = ?auto_884426 ?auto_884440 ) ) ( not ( = ?auto_884427 ?auto_884428 ) ) ( not ( = ?auto_884427 ?auto_884429 ) ) ( not ( = ?auto_884427 ?auto_884430 ) ) ( not ( = ?auto_884427 ?auto_884431 ) ) ( not ( = ?auto_884427 ?auto_884432 ) ) ( not ( = ?auto_884427 ?auto_884433 ) ) ( not ( = ?auto_884427 ?auto_884434 ) ) ( not ( = ?auto_884427 ?auto_884435 ) ) ( not ( = ?auto_884427 ?auto_884436 ) ) ( not ( = ?auto_884427 ?auto_884437 ) ) ( not ( = ?auto_884427 ?auto_884438 ) ) ( not ( = ?auto_884427 ?auto_884439 ) ) ( not ( = ?auto_884427 ?auto_884440 ) ) ( not ( = ?auto_884428 ?auto_884429 ) ) ( not ( = ?auto_884428 ?auto_884430 ) ) ( not ( = ?auto_884428 ?auto_884431 ) ) ( not ( = ?auto_884428 ?auto_884432 ) ) ( not ( = ?auto_884428 ?auto_884433 ) ) ( not ( = ?auto_884428 ?auto_884434 ) ) ( not ( = ?auto_884428 ?auto_884435 ) ) ( not ( = ?auto_884428 ?auto_884436 ) ) ( not ( = ?auto_884428 ?auto_884437 ) ) ( not ( = ?auto_884428 ?auto_884438 ) ) ( not ( = ?auto_884428 ?auto_884439 ) ) ( not ( = ?auto_884428 ?auto_884440 ) ) ( not ( = ?auto_884429 ?auto_884430 ) ) ( not ( = ?auto_884429 ?auto_884431 ) ) ( not ( = ?auto_884429 ?auto_884432 ) ) ( not ( = ?auto_884429 ?auto_884433 ) ) ( not ( = ?auto_884429 ?auto_884434 ) ) ( not ( = ?auto_884429 ?auto_884435 ) ) ( not ( = ?auto_884429 ?auto_884436 ) ) ( not ( = ?auto_884429 ?auto_884437 ) ) ( not ( = ?auto_884429 ?auto_884438 ) ) ( not ( = ?auto_884429 ?auto_884439 ) ) ( not ( = ?auto_884429 ?auto_884440 ) ) ( not ( = ?auto_884430 ?auto_884431 ) ) ( not ( = ?auto_884430 ?auto_884432 ) ) ( not ( = ?auto_884430 ?auto_884433 ) ) ( not ( = ?auto_884430 ?auto_884434 ) ) ( not ( = ?auto_884430 ?auto_884435 ) ) ( not ( = ?auto_884430 ?auto_884436 ) ) ( not ( = ?auto_884430 ?auto_884437 ) ) ( not ( = ?auto_884430 ?auto_884438 ) ) ( not ( = ?auto_884430 ?auto_884439 ) ) ( not ( = ?auto_884430 ?auto_884440 ) ) ( not ( = ?auto_884431 ?auto_884432 ) ) ( not ( = ?auto_884431 ?auto_884433 ) ) ( not ( = ?auto_884431 ?auto_884434 ) ) ( not ( = ?auto_884431 ?auto_884435 ) ) ( not ( = ?auto_884431 ?auto_884436 ) ) ( not ( = ?auto_884431 ?auto_884437 ) ) ( not ( = ?auto_884431 ?auto_884438 ) ) ( not ( = ?auto_884431 ?auto_884439 ) ) ( not ( = ?auto_884431 ?auto_884440 ) ) ( not ( = ?auto_884432 ?auto_884433 ) ) ( not ( = ?auto_884432 ?auto_884434 ) ) ( not ( = ?auto_884432 ?auto_884435 ) ) ( not ( = ?auto_884432 ?auto_884436 ) ) ( not ( = ?auto_884432 ?auto_884437 ) ) ( not ( = ?auto_884432 ?auto_884438 ) ) ( not ( = ?auto_884432 ?auto_884439 ) ) ( not ( = ?auto_884432 ?auto_884440 ) ) ( not ( = ?auto_884433 ?auto_884434 ) ) ( not ( = ?auto_884433 ?auto_884435 ) ) ( not ( = ?auto_884433 ?auto_884436 ) ) ( not ( = ?auto_884433 ?auto_884437 ) ) ( not ( = ?auto_884433 ?auto_884438 ) ) ( not ( = ?auto_884433 ?auto_884439 ) ) ( not ( = ?auto_884433 ?auto_884440 ) ) ( not ( = ?auto_884434 ?auto_884435 ) ) ( not ( = ?auto_884434 ?auto_884436 ) ) ( not ( = ?auto_884434 ?auto_884437 ) ) ( not ( = ?auto_884434 ?auto_884438 ) ) ( not ( = ?auto_884434 ?auto_884439 ) ) ( not ( = ?auto_884434 ?auto_884440 ) ) ( not ( = ?auto_884435 ?auto_884436 ) ) ( not ( = ?auto_884435 ?auto_884437 ) ) ( not ( = ?auto_884435 ?auto_884438 ) ) ( not ( = ?auto_884435 ?auto_884439 ) ) ( not ( = ?auto_884435 ?auto_884440 ) ) ( not ( = ?auto_884436 ?auto_884437 ) ) ( not ( = ?auto_884436 ?auto_884438 ) ) ( not ( = ?auto_884436 ?auto_884439 ) ) ( not ( = ?auto_884436 ?auto_884440 ) ) ( not ( = ?auto_884437 ?auto_884438 ) ) ( not ( = ?auto_884437 ?auto_884439 ) ) ( not ( = ?auto_884437 ?auto_884440 ) ) ( not ( = ?auto_884438 ?auto_884439 ) ) ( not ( = ?auto_884438 ?auto_884440 ) ) ( not ( = ?auto_884439 ?auto_884440 ) ) ( ON ?auto_884438 ?auto_884439 ) ( ON ?auto_884437 ?auto_884438 ) ( ON ?auto_884436 ?auto_884437 ) ( ON ?auto_884435 ?auto_884436 ) ( ON ?auto_884434 ?auto_884435 ) ( ON ?auto_884433 ?auto_884434 ) ( ON ?auto_884432 ?auto_884433 ) ( ON ?auto_884431 ?auto_884432 ) ( CLEAR ?auto_884429 ) ( ON ?auto_884430 ?auto_884431 ) ( CLEAR ?auto_884430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_884426 ?auto_884427 ?auto_884428 ?auto_884429 ?auto_884430 )
      ( MAKE-14PILE ?auto_884426 ?auto_884427 ?auto_884428 ?auto_884429 ?auto_884430 ?auto_884431 ?auto_884432 ?auto_884433 ?auto_884434 ?auto_884435 ?auto_884436 ?auto_884437 ?auto_884438 ?auto_884439 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_884484 - BLOCK
      ?auto_884485 - BLOCK
      ?auto_884486 - BLOCK
      ?auto_884487 - BLOCK
      ?auto_884488 - BLOCK
      ?auto_884489 - BLOCK
      ?auto_884490 - BLOCK
      ?auto_884491 - BLOCK
      ?auto_884492 - BLOCK
      ?auto_884493 - BLOCK
      ?auto_884494 - BLOCK
      ?auto_884495 - BLOCK
      ?auto_884496 - BLOCK
      ?auto_884497 - BLOCK
    )
    :vars
    (
      ?auto_884498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884497 ?auto_884498 ) ( ON-TABLE ?auto_884484 ) ( ON ?auto_884485 ?auto_884484 ) ( ON ?auto_884486 ?auto_884485 ) ( not ( = ?auto_884484 ?auto_884485 ) ) ( not ( = ?auto_884484 ?auto_884486 ) ) ( not ( = ?auto_884484 ?auto_884487 ) ) ( not ( = ?auto_884484 ?auto_884488 ) ) ( not ( = ?auto_884484 ?auto_884489 ) ) ( not ( = ?auto_884484 ?auto_884490 ) ) ( not ( = ?auto_884484 ?auto_884491 ) ) ( not ( = ?auto_884484 ?auto_884492 ) ) ( not ( = ?auto_884484 ?auto_884493 ) ) ( not ( = ?auto_884484 ?auto_884494 ) ) ( not ( = ?auto_884484 ?auto_884495 ) ) ( not ( = ?auto_884484 ?auto_884496 ) ) ( not ( = ?auto_884484 ?auto_884497 ) ) ( not ( = ?auto_884484 ?auto_884498 ) ) ( not ( = ?auto_884485 ?auto_884486 ) ) ( not ( = ?auto_884485 ?auto_884487 ) ) ( not ( = ?auto_884485 ?auto_884488 ) ) ( not ( = ?auto_884485 ?auto_884489 ) ) ( not ( = ?auto_884485 ?auto_884490 ) ) ( not ( = ?auto_884485 ?auto_884491 ) ) ( not ( = ?auto_884485 ?auto_884492 ) ) ( not ( = ?auto_884485 ?auto_884493 ) ) ( not ( = ?auto_884485 ?auto_884494 ) ) ( not ( = ?auto_884485 ?auto_884495 ) ) ( not ( = ?auto_884485 ?auto_884496 ) ) ( not ( = ?auto_884485 ?auto_884497 ) ) ( not ( = ?auto_884485 ?auto_884498 ) ) ( not ( = ?auto_884486 ?auto_884487 ) ) ( not ( = ?auto_884486 ?auto_884488 ) ) ( not ( = ?auto_884486 ?auto_884489 ) ) ( not ( = ?auto_884486 ?auto_884490 ) ) ( not ( = ?auto_884486 ?auto_884491 ) ) ( not ( = ?auto_884486 ?auto_884492 ) ) ( not ( = ?auto_884486 ?auto_884493 ) ) ( not ( = ?auto_884486 ?auto_884494 ) ) ( not ( = ?auto_884486 ?auto_884495 ) ) ( not ( = ?auto_884486 ?auto_884496 ) ) ( not ( = ?auto_884486 ?auto_884497 ) ) ( not ( = ?auto_884486 ?auto_884498 ) ) ( not ( = ?auto_884487 ?auto_884488 ) ) ( not ( = ?auto_884487 ?auto_884489 ) ) ( not ( = ?auto_884487 ?auto_884490 ) ) ( not ( = ?auto_884487 ?auto_884491 ) ) ( not ( = ?auto_884487 ?auto_884492 ) ) ( not ( = ?auto_884487 ?auto_884493 ) ) ( not ( = ?auto_884487 ?auto_884494 ) ) ( not ( = ?auto_884487 ?auto_884495 ) ) ( not ( = ?auto_884487 ?auto_884496 ) ) ( not ( = ?auto_884487 ?auto_884497 ) ) ( not ( = ?auto_884487 ?auto_884498 ) ) ( not ( = ?auto_884488 ?auto_884489 ) ) ( not ( = ?auto_884488 ?auto_884490 ) ) ( not ( = ?auto_884488 ?auto_884491 ) ) ( not ( = ?auto_884488 ?auto_884492 ) ) ( not ( = ?auto_884488 ?auto_884493 ) ) ( not ( = ?auto_884488 ?auto_884494 ) ) ( not ( = ?auto_884488 ?auto_884495 ) ) ( not ( = ?auto_884488 ?auto_884496 ) ) ( not ( = ?auto_884488 ?auto_884497 ) ) ( not ( = ?auto_884488 ?auto_884498 ) ) ( not ( = ?auto_884489 ?auto_884490 ) ) ( not ( = ?auto_884489 ?auto_884491 ) ) ( not ( = ?auto_884489 ?auto_884492 ) ) ( not ( = ?auto_884489 ?auto_884493 ) ) ( not ( = ?auto_884489 ?auto_884494 ) ) ( not ( = ?auto_884489 ?auto_884495 ) ) ( not ( = ?auto_884489 ?auto_884496 ) ) ( not ( = ?auto_884489 ?auto_884497 ) ) ( not ( = ?auto_884489 ?auto_884498 ) ) ( not ( = ?auto_884490 ?auto_884491 ) ) ( not ( = ?auto_884490 ?auto_884492 ) ) ( not ( = ?auto_884490 ?auto_884493 ) ) ( not ( = ?auto_884490 ?auto_884494 ) ) ( not ( = ?auto_884490 ?auto_884495 ) ) ( not ( = ?auto_884490 ?auto_884496 ) ) ( not ( = ?auto_884490 ?auto_884497 ) ) ( not ( = ?auto_884490 ?auto_884498 ) ) ( not ( = ?auto_884491 ?auto_884492 ) ) ( not ( = ?auto_884491 ?auto_884493 ) ) ( not ( = ?auto_884491 ?auto_884494 ) ) ( not ( = ?auto_884491 ?auto_884495 ) ) ( not ( = ?auto_884491 ?auto_884496 ) ) ( not ( = ?auto_884491 ?auto_884497 ) ) ( not ( = ?auto_884491 ?auto_884498 ) ) ( not ( = ?auto_884492 ?auto_884493 ) ) ( not ( = ?auto_884492 ?auto_884494 ) ) ( not ( = ?auto_884492 ?auto_884495 ) ) ( not ( = ?auto_884492 ?auto_884496 ) ) ( not ( = ?auto_884492 ?auto_884497 ) ) ( not ( = ?auto_884492 ?auto_884498 ) ) ( not ( = ?auto_884493 ?auto_884494 ) ) ( not ( = ?auto_884493 ?auto_884495 ) ) ( not ( = ?auto_884493 ?auto_884496 ) ) ( not ( = ?auto_884493 ?auto_884497 ) ) ( not ( = ?auto_884493 ?auto_884498 ) ) ( not ( = ?auto_884494 ?auto_884495 ) ) ( not ( = ?auto_884494 ?auto_884496 ) ) ( not ( = ?auto_884494 ?auto_884497 ) ) ( not ( = ?auto_884494 ?auto_884498 ) ) ( not ( = ?auto_884495 ?auto_884496 ) ) ( not ( = ?auto_884495 ?auto_884497 ) ) ( not ( = ?auto_884495 ?auto_884498 ) ) ( not ( = ?auto_884496 ?auto_884497 ) ) ( not ( = ?auto_884496 ?auto_884498 ) ) ( not ( = ?auto_884497 ?auto_884498 ) ) ( ON ?auto_884496 ?auto_884497 ) ( ON ?auto_884495 ?auto_884496 ) ( ON ?auto_884494 ?auto_884495 ) ( ON ?auto_884493 ?auto_884494 ) ( ON ?auto_884492 ?auto_884493 ) ( ON ?auto_884491 ?auto_884492 ) ( ON ?auto_884490 ?auto_884491 ) ( ON ?auto_884489 ?auto_884490 ) ( ON ?auto_884488 ?auto_884489 ) ( CLEAR ?auto_884486 ) ( ON ?auto_884487 ?auto_884488 ) ( CLEAR ?auto_884487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_884484 ?auto_884485 ?auto_884486 ?auto_884487 )
      ( MAKE-14PILE ?auto_884484 ?auto_884485 ?auto_884486 ?auto_884487 ?auto_884488 ?auto_884489 ?auto_884490 ?auto_884491 ?auto_884492 ?auto_884493 ?auto_884494 ?auto_884495 ?auto_884496 ?auto_884497 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_884542 - BLOCK
      ?auto_884543 - BLOCK
      ?auto_884544 - BLOCK
      ?auto_884545 - BLOCK
      ?auto_884546 - BLOCK
      ?auto_884547 - BLOCK
      ?auto_884548 - BLOCK
      ?auto_884549 - BLOCK
      ?auto_884550 - BLOCK
      ?auto_884551 - BLOCK
      ?auto_884552 - BLOCK
      ?auto_884553 - BLOCK
      ?auto_884554 - BLOCK
      ?auto_884555 - BLOCK
    )
    :vars
    (
      ?auto_884556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884555 ?auto_884556 ) ( ON-TABLE ?auto_884542 ) ( ON ?auto_884543 ?auto_884542 ) ( not ( = ?auto_884542 ?auto_884543 ) ) ( not ( = ?auto_884542 ?auto_884544 ) ) ( not ( = ?auto_884542 ?auto_884545 ) ) ( not ( = ?auto_884542 ?auto_884546 ) ) ( not ( = ?auto_884542 ?auto_884547 ) ) ( not ( = ?auto_884542 ?auto_884548 ) ) ( not ( = ?auto_884542 ?auto_884549 ) ) ( not ( = ?auto_884542 ?auto_884550 ) ) ( not ( = ?auto_884542 ?auto_884551 ) ) ( not ( = ?auto_884542 ?auto_884552 ) ) ( not ( = ?auto_884542 ?auto_884553 ) ) ( not ( = ?auto_884542 ?auto_884554 ) ) ( not ( = ?auto_884542 ?auto_884555 ) ) ( not ( = ?auto_884542 ?auto_884556 ) ) ( not ( = ?auto_884543 ?auto_884544 ) ) ( not ( = ?auto_884543 ?auto_884545 ) ) ( not ( = ?auto_884543 ?auto_884546 ) ) ( not ( = ?auto_884543 ?auto_884547 ) ) ( not ( = ?auto_884543 ?auto_884548 ) ) ( not ( = ?auto_884543 ?auto_884549 ) ) ( not ( = ?auto_884543 ?auto_884550 ) ) ( not ( = ?auto_884543 ?auto_884551 ) ) ( not ( = ?auto_884543 ?auto_884552 ) ) ( not ( = ?auto_884543 ?auto_884553 ) ) ( not ( = ?auto_884543 ?auto_884554 ) ) ( not ( = ?auto_884543 ?auto_884555 ) ) ( not ( = ?auto_884543 ?auto_884556 ) ) ( not ( = ?auto_884544 ?auto_884545 ) ) ( not ( = ?auto_884544 ?auto_884546 ) ) ( not ( = ?auto_884544 ?auto_884547 ) ) ( not ( = ?auto_884544 ?auto_884548 ) ) ( not ( = ?auto_884544 ?auto_884549 ) ) ( not ( = ?auto_884544 ?auto_884550 ) ) ( not ( = ?auto_884544 ?auto_884551 ) ) ( not ( = ?auto_884544 ?auto_884552 ) ) ( not ( = ?auto_884544 ?auto_884553 ) ) ( not ( = ?auto_884544 ?auto_884554 ) ) ( not ( = ?auto_884544 ?auto_884555 ) ) ( not ( = ?auto_884544 ?auto_884556 ) ) ( not ( = ?auto_884545 ?auto_884546 ) ) ( not ( = ?auto_884545 ?auto_884547 ) ) ( not ( = ?auto_884545 ?auto_884548 ) ) ( not ( = ?auto_884545 ?auto_884549 ) ) ( not ( = ?auto_884545 ?auto_884550 ) ) ( not ( = ?auto_884545 ?auto_884551 ) ) ( not ( = ?auto_884545 ?auto_884552 ) ) ( not ( = ?auto_884545 ?auto_884553 ) ) ( not ( = ?auto_884545 ?auto_884554 ) ) ( not ( = ?auto_884545 ?auto_884555 ) ) ( not ( = ?auto_884545 ?auto_884556 ) ) ( not ( = ?auto_884546 ?auto_884547 ) ) ( not ( = ?auto_884546 ?auto_884548 ) ) ( not ( = ?auto_884546 ?auto_884549 ) ) ( not ( = ?auto_884546 ?auto_884550 ) ) ( not ( = ?auto_884546 ?auto_884551 ) ) ( not ( = ?auto_884546 ?auto_884552 ) ) ( not ( = ?auto_884546 ?auto_884553 ) ) ( not ( = ?auto_884546 ?auto_884554 ) ) ( not ( = ?auto_884546 ?auto_884555 ) ) ( not ( = ?auto_884546 ?auto_884556 ) ) ( not ( = ?auto_884547 ?auto_884548 ) ) ( not ( = ?auto_884547 ?auto_884549 ) ) ( not ( = ?auto_884547 ?auto_884550 ) ) ( not ( = ?auto_884547 ?auto_884551 ) ) ( not ( = ?auto_884547 ?auto_884552 ) ) ( not ( = ?auto_884547 ?auto_884553 ) ) ( not ( = ?auto_884547 ?auto_884554 ) ) ( not ( = ?auto_884547 ?auto_884555 ) ) ( not ( = ?auto_884547 ?auto_884556 ) ) ( not ( = ?auto_884548 ?auto_884549 ) ) ( not ( = ?auto_884548 ?auto_884550 ) ) ( not ( = ?auto_884548 ?auto_884551 ) ) ( not ( = ?auto_884548 ?auto_884552 ) ) ( not ( = ?auto_884548 ?auto_884553 ) ) ( not ( = ?auto_884548 ?auto_884554 ) ) ( not ( = ?auto_884548 ?auto_884555 ) ) ( not ( = ?auto_884548 ?auto_884556 ) ) ( not ( = ?auto_884549 ?auto_884550 ) ) ( not ( = ?auto_884549 ?auto_884551 ) ) ( not ( = ?auto_884549 ?auto_884552 ) ) ( not ( = ?auto_884549 ?auto_884553 ) ) ( not ( = ?auto_884549 ?auto_884554 ) ) ( not ( = ?auto_884549 ?auto_884555 ) ) ( not ( = ?auto_884549 ?auto_884556 ) ) ( not ( = ?auto_884550 ?auto_884551 ) ) ( not ( = ?auto_884550 ?auto_884552 ) ) ( not ( = ?auto_884550 ?auto_884553 ) ) ( not ( = ?auto_884550 ?auto_884554 ) ) ( not ( = ?auto_884550 ?auto_884555 ) ) ( not ( = ?auto_884550 ?auto_884556 ) ) ( not ( = ?auto_884551 ?auto_884552 ) ) ( not ( = ?auto_884551 ?auto_884553 ) ) ( not ( = ?auto_884551 ?auto_884554 ) ) ( not ( = ?auto_884551 ?auto_884555 ) ) ( not ( = ?auto_884551 ?auto_884556 ) ) ( not ( = ?auto_884552 ?auto_884553 ) ) ( not ( = ?auto_884552 ?auto_884554 ) ) ( not ( = ?auto_884552 ?auto_884555 ) ) ( not ( = ?auto_884552 ?auto_884556 ) ) ( not ( = ?auto_884553 ?auto_884554 ) ) ( not ( = ?auto_884553 ?auto_884555 ) ) ( not ( = ?auto_884553 ?auto_884556 ) ) ( not ( = ?auto_884554 ?auto_884555 ) ) ( not ( = ?auto_884554 ?auto_884556 ) ) ( not ( = ?auto_884555 ?auto_884556 ) ) ( ON ?auto_884554 ?auto_884555 ) ( ON ?auto_884553 ?auto_884554 ) ( ON ?auto_884552 ?auto_884553 ) ( ON ?auto_884551 ?auto_884552 ) ( ON ?auto_884550 ?auto_884551 ) ( ON ?auto_884549 ?auto_884550 ) ( ON ?auto_884548 ?auto_884549 ) ( ON ?auto_884547 ?auto_884548 ) ( ON ?auto_884546 ?auto_884547 ) ( ON ?auto_884545 ?auto_884546 ) ( CLEAR ?auto_884543 ) ( ON ?auto_884544 ?auto_884545 ) ( CLEAR ?auto_884544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_884542 ?auto_884543 ?auto_884544 )
      ( MAKE-14PILE ?auto_884542 ?auto_884543 ?auto_884544 ?auto_884545 ?auto_884546 ?auto_884547 ?auto_884548 ?auto_884549 ?auto_884550 ?auto_884551 ?auto_884552 ?auto_884553 ?auto_884554 ?auto_884555 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_884600 - BLOCK
      ?auto_884601 - BLOCK
      ?auto_884602 - BLOCK
      ?auto_884603 - BLOCK
      ?auto_884604 - BLOCK
      ?auto_884605 - BLOCK
      ?auto_884606 - BLOCK
      ?auto_884607 - BLOCK
      ?auto_884608 - BLOCK
      ?auto_884609 - BLOCK
      ?auto_884610 - BLOCK
      ?auto_884611 - BLOCK
      ?auto_884612 - BLOCK
      ?auto_884613 - BLOCK
    )
    :vars
    (
      ?auto_884614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884613 ?auto_884614 ) ( ON-TABLE ?auto_884600 ) ( not ( = ?auto_884600 ?auto_884601 ) ) ( not ( = ?auto_884600 ?auto_884602 ) ) ( not ( = ?auto_884600 ?auto_884603 ) ) ( not ( = ?auto_884600 ?auto_884604 ) ) ( not ( = ?auto_884600 ?auto_884605 ) ) ( not ( = ?auto_884600 ?auto_884606 ) ) ( not ( = ?auto_884600 ?auto_884607 ) ) ( not ( = ?auto_884600 ?auto_884608 ) ) ( not ( = ?auto_884600 ?auto_884609 ) ) ( not ( = ?auto_884600 ?auto_884610 ) ) ( not ( = ?auto_884600 ?auto_884611 ) ) ( not ( = ?auto_884600 ?auto_884612 ) ) ( not ( = ?auto_884600 ?auto_884613 ) ) ( not ( = ?auto_884600 ?auto_884614 ) ) ( not ( = ?auto_884601 ?auto_884602 ) ) ( not ( = ?auto_884601 ?auto_884603 ) ) ( not ( = ?auto_884601 ?auto_884604 ) ) ( not ( = ?auto_884601 ?auto_884605 ) ) ( not ( = ?auto_884601 ?auto_884606 ) ) ( not ( = ?auto_884601 ?auto_884607 ) ) ( not ( = ?auto_884601 ?auto_884608 ) ) ( not ( = ?auto_884601 ?auto_884609 ) ) ( not ( = ?auto_884601 ?auto_884610 ) ) ( not ( = ?auto_884601 ?auto_884611 ) ) ( not ( = ?auto_884601 ?auto_884612 ) ) ( not ( = ?auto_884601 ?auto_884613 ) ) ( not ( = ?auto_884601 ?auto_884614 ) ) ( not ( = ?auto_884602 ?auto_884603 ) ) ( not ( = ?auto_884602 ?auto_884604 ) ) ( not ( = ?auto_884602 ?auto_884605 ) ) ( not ( = ?auto_884602 ?auto_884606 ) ) ( not ( = ?auto_884602 ?auto_884607 ) ) ( not ( = ?auto_884602 ?auto_884608 ) ) ( not ( = ?auto_884602 ?auto_884609 ) ) ( not ( = ?auto_884602 ?auto_884610 ) ) ( not ( = ?auto_884602 ?auto_884611 ) ) ( not ( = ?auto_884602 ?auto_884612 ) ) ( not ( = ?auto_884602 ?auto_884613 ) ) ( not ( = ?auto_884602 ?auto_884614 ) ) ( not ( = ?auto_884603 ?auto_884604 ) ) ( not ( = ?auto_884603 ?auto_884605 ) ) ( not ( = ?auto_884603 ?auto_884606 ) ) ( not ( = ?auto_884603 ?auto_884607 ) ) ( not ( = ?auto_884603 ?auto_884608 ) ) ( not ( = ?auto_884603 ?auto_884609 ) ) ( not ( = ?auto_884603 ?auto_884610 ) ) ( not ( = ?auto_884603 ?auto_884611 ) ) ( not ( = ?auto_884603 ?auto_884612 ) ) ( not ( = ?auto_884603 ?auto_884613 ) ) ( not ( = ?auto_884603 ?auto_884614 ) ) ( not ( = ?auto_884604 ?auto_884605 ) ) ( not ( = ?auto_884604 ?auto_884606 ) ) ( not ( = ?auto_884604 ?auto_884607 ) ) ( not ( = ?auto_884604 ?auto_884608 ) ) ( not ( = ?auto_884604 ?auto_884609 ) ) ( not ( = ?auto_884604 ?auto_884610 ) ) ( not ( = ?auto_884604 ?auto_884611 ) ) ( not ( = ?auto_884604 ?auto_884612 ) ) ( not ( = ?auto_884604 ?auto_884613 ) ) ( not ( = ?auto_884604 ?auto_884614 ) ) ( not ( = ?auto_884605 ?auto_884606 ) ) ( not ( = ?auto_884605 ?auto_884607 ) ) ( not ( = ?auto_884605 ?auto_884608 ) ) ( not ( = ?auto_884605 ?auto_884609 ) ) ( not ( = ?auto_884605 ?auto_884610 ) ) ( not ( = ?auto_884605 ?auto_884611 ) ) ( not ( = ?auto_884605 ?auto_884612 ) ) ( not ( = ?auto_884605 ?auto_884613 ) ) ( not ( = ?auto_884605 ?auto_884614 ) ) ( not ( = ?auto_884606 ?auto_884607 ) ) ( not ( = ?auto_884606 ?auto_884608 ) ) ( not ( = ?auto_884606 ?auto_884609 ) ) ( not ( = ?auto_884606 ?auto_884610 ) ) ( not ( = ?auto_884606 ?auto_884611 ) ) ( not ( = ?auto_884606 ?auto_884612 ) ) ( not ( = ?auto_884606 ?auto_884613 ) ) ( not ( = ?auto_884606 ?auto_884614 ) ) ( not ( = ?auto_884607 ?auto_884608 ) ) ( not ( = ?auto_884607 ?auto_884609 ) ) ( not ( = ?auto_884607 ?auto_884610 ) ) ( not ( = ?auto_884607 ?auto_884611 ) ) ( not ( = ?auto_884607 ?auto_884612 ) ) ( not ( = ?auto_884607 ?auto_884613 ) ) ( not ( = ?auto_884607 ?auto_884614 ) ) ( not ( = ?auto_884608 ?auto_884609 ) ) ( not ( = ?auto_884608 ?auto_884610 ) ) ( not ( = ?auto_884608 ?auto_884611 ) ) ( not ( = ?auto_884608 ?auto_884612 ) ) ( not ( = ?auto_884608 ?auto_884613 ) ) ( not ( = ?auto_884608 ?auto_884614 ) ) ( not ( = ?auto_884609 ?auto_884610 ) ) ( not ( = ?auto_884609 ?auto_884611 ) ) ( not ( = ?auto_884609 ?auto_884612 ) ) ( not ( = ?auto_884609 ?auto_884613 ) ) ( not ( = ?auto_884609 ?auto_884614 ) ) ( not ( = ?auto_884610 ?auto_884611 ) ) ( not ( = ?auto_884610 ?auto_884612 ) ) ( not ( = ?auto_884610 ?auto_884613 ) ) ( not ( = ?auto_884610 ?auto_884614 ) ) ( not ( = ?auto_884611 ?auto_884612 ) ) ( not ( = ?auto_884611 ?auto_884613 ) ) ( not ( = ?auto_884611 ?auto_884614 ) ) ( not ( = ?auto_884612 ?auto_884613 ) ) ( not ( = ?auto_884612 ?auto_884614 ) ) ( not ( = ?auto_884613 ?auto_884614 ) ) ( ON ?auto_884612 ?auto_884613 ) ( ON ?auto_884611 ?auto_884612 ) ( ON ?auto_884610 ?auto_884611 ) ( ON ?auto_884609 ?auto_884610 ) ( ON ?auto_884608 ?auto_884609 ) ( ON ?auto_884607 ?auto_884608 ) ( ON ?auto_884606 ?auto_884607 ) ( ON ?auto_884605 ?auto_884606 ) ( ON ?auto_884604 ?auto_884605 ) ( ON ?auto_884603 ?auto_884604 ) ( ON ?auto_884602 ?auto_884603 ) ( CLEAR ?auto_884600 ) ( ON ?auto_884601 ?auto_884602 ) ( CLEAR ?auto_884601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_884600 ?auto_884601 )
      ( MAKE-14PILE ?auto_884600 ?auto_884601 ?auto_884602 ?auto_884603 ?auto_884604 ?auto_884605 ?auto_884606 ?auto_884607 ?auto_884608 ?auto_884609 ?auto_884610 ?auto_884611 ?auto_884612 ?auto_884613 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_884658 - BLOCK
      ?auto_884659 - BLOCK
      ?auto_884660 - BLOCK
      ?auto_884661 - BLOCK
      ?auto_884662 - BLOCK
      ?auto_884663 - BLOCK
      ?auto_884664 - BLOCK
      ?auto_884665 - BLOCK
      ?auto_884666 - BLOCK
      ?auto_884667 - BLOCK
      ?auto_884668 - BLOCK
      ?auto_884669 - BLOCK
      ?auto_884670 - BLOCK
      ?auto_884671 - BLOCK
    )
    :vars
    (
      ?auto_884672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884671 ?auto_884672 ) ( not ( = ?auto_884658 ?auto_884659 ) ) ( not ( = ?auto_884658 ?auto_884660 ) ) ( not ( = ?auto_884658 ?auto_884661 ) ) ( not ( = ?auto_884658 ?auto_884662 ) ) ( not ( = ?auto_884658 ?auto_884663 ) ) ( not ( = ?auto_884658 ?auto_884664 ) ) ( not ( = ?auto_884658 ?auto_884665 ) ) ( not ( = ?auto_884658 ?auto_884666 ) ) ( not ( = ?auto_884658 ?auto_884667 ) ) ( not ( = ?auto_884658 ?auto_884668 ) ) ( not ( = ?auto_884658 ?auto_884669 ) ) ( not ( = ?auto_884658 ?auto_884670 ) ) ( not ( = ?auto_884658 ?auto_884671 ) ) ( not ( = ?auto_884658 ?auto_884672 ) ) ( not ( = ?auto_884659 ?auto_884660 ) ) ( not ( = ?auto_884659 ?auto_884661 ) ) ( not ( = ?auto_884659 ?auto_884662 ) ) ( not ( = ?auto_884659 ?auto_884663 ) ) ( not ( = ?auto_884659 ?auto_884664 ) ) ( not ( = ?auto_884659 ?auto_884665 ) ) ( not ( = ?auto_884659 ?auto_884666 ) ) ( not ( = ?auto_884659 ?auto_884667 ) ) ( not ( = ?auto_884659 ?auto_884668 ) ) ( not ( = ?auto_884659 ?auto_884669 ) ) ( not ( = ?auto_884659 ?auto_884670 ) ) ( not ( = ?auto_884659 ?auto_884671 ) ) ( not ( = ?auto_884659 ?auto_884672 ) ) ( not ( = ?auto_884660 ?auto_884661 ) ) ( not ( = ?auto_884660 ?auto_884662 ) ) ( not ( = ?auto_884660 ?auto_884663 ) ) ( not ( = ?auto_884660 ?auto_884664 ) ) ( not ( = ?auto_884660 ?auto_884665 ) ) ( not ( = ?auto_884660 ?auto_884666 ) ) ( not ( = ?auto_884660 ?auto_884667 ) ) ( not ( = ?auto_884660 ?auto_884668 ) ) ( not ( = ?auto_884660 ?auto_884669 ) ) ( not ( = ?auto_884660 ?auto_884670 ) ) ( not ( = ?auto_884660 ?auto_884671 ) ) ( not ( = ?auto_884660 ?auto_884672 ) ) ( not ( = ?auto_884661 ?auto_884662 ) ) ( not ( = ?auto_884661 ?auto_884663 ) ) ( not ( = ?auto_884661 ?auto_884664 ) ) ( not ( = ?auto_884661 ?auto_884665 ) ) ( not ( = ?auto_884661 ?auto_884666 ) ) ( not ( = ?auto_884661 ?auto_884667 ) ) ( not ( = ?auto_884661 ?auto_884668 ) ) ( not ( = ?auto_884661 ?auto_884669 ) ) ( not ( = ?auto_884661 ?auto_884670 ) ) ( not ( = ?auto_884661 ?auto_884671 ) ) ( not ( = ?auto_884661 ?auto_884672 ) ) ( not ( = ?auto_884662 ?auto_884663 ) ) ( not ( = ?auto_884662 ?auto_884664 ) ) ( not ( = ?auto_884662 ?auto_884665 ) ) ( not ( = ?auto_884662 ?auto_884666 ) ) ( not ( = ?auto_884662 ?auto_884667 ) ) ( not ( = ?auto_884662 ?auto_884668 ) ) ( not ( = ?auto_884662 ?auto_884669 ) ) ( not ( = ?auto_884662 ?auto_884670 ) ) ( not ( = ?auto_884662 ?auto_884671 ) ) ( not ( = ?auto_884662 ?auto_884672 ) ) ( not ( = ?auto_884663 ?auto_884664 ) ) ( not ( = ?auto_884663 ?auto_884665 ) ) ( not ( = ?auto_884663 ?auto_884666 ) ) ( not ( = ?auto_884663 ?auto_884667 ) ) ( not ( = ?auto_884663 ?auto_884668 ) ) ( not ( = ?auto_884663 ?auto_884669 ) ) ( not ( = ?auto_884663 ?auto_884670 ) ) ( not ( = ?auto_884663 ?auto_884671 ) ) ( not ( = ?auto_884663 ?auto_884672 ) ) ( not ( = ?auto_884664 ?auto_884665 ) ) ( not ( = ?auto_884664 ?auto_884666 ) ) ( not ( = ?auto_884664 ?auto_884667 ) ) ( not ( = ?auto_884664 ?auto_884668 ) ) ( not ( = ?auto_884664 ?auto_884669 ) ) ( not ( = ?auto_884664 ?auto_884670 ) ) ( not ( = ?auto_884664 ?auto_884671 ) ) ( not ( = ?auto_884664 ?auto_884672 ) ) ( not ( = ?auto_884665 ?auto_884666 ) ) ( not ( = ?auto_884665 ?auto_884667 ) ) ( not ( = ?auto_884665 ?auto_884668 ) ) ( not ( = ?auto_884665 ?auto_884669 ) ) ( not ( = ?auto_884665 ?auto_884670 ) ) ( not ( = ?auto_884665 ?auto_884671 ) ) ( not ( = ?auto_884665 ?auto_884672 ) ) ( not ( = ?auto_884666 ?auto_884667 ) ) ( not ( = ?auto_884666 ?auto_884668 ) ) ( not ( = ?auto_884666 ?auto_884669 ) ) ( not ( = ?auto_884666 ?auto_884670 ) ) ( not ( = ?auto_884666 ?auto_884671 ) ) ( not ( = ?auto_884666 ?auto_884672 ) ) ( not ( = ?auto_884667 ?auto_884668 ) ) ( not ( = ?auto_884667 ?auto_884669 ) ) ( not ( = ?auto_884667 ?auto_884670 ) ) ( not ( = ?auto_884667 ?auto_884671 ) ) ( not ( = ?auto_884667 ?auto_884672 ) ) ( not ( = ?auto_884668 ?auto_884669 ) ) ( not ( = ?auto_884668 ?auto_884670 ) ) ( not ( = ?auto_884668 ?auto_884671 ) ) ( not ( = ?auto_884668 ?auto_884672 ) ) ( not ( = ?auto_884669 ?auto_884670 ) ) ( not ( = ?auto_884669 ?auto_884671 ) ) ( not ( = ?auto_884669 ?auto_884672 ) ) ( not ( = ?auto_884670 ?auto_884671 ) ) ( not ( = ?auto_884670 ?auto_884672 ) ) ( not ( = ?auto_884671 ?auto_884672 ) ) ( ON ?auto_884670 ?auto_884671 ) ( ON ?auto_884669 ?auto_884670 ) ( ON ?auto_884668 ?auto_884669 ) ( ON ?auto_884667 ?auto_884668 ) ( ON ?auto_884666 ?auto_884667 ) ( ON ?auto_884665 ?auto_884666 ) ( ON ?auto_884664 ?auto_884665 ) ( ON ?auto_884663 ?auto_884664 ) ( ON ?auto_884662 ?auto_884663 ) ( ON ?auto_884661 ?auto_884662 ) ( ON ?auto_884660 ?auto_884661 ) ( ON ?auto_884659 ?auto_884660 ) ( ON ?auto_884658 ?auto_884659 ) ( CLEAR ?auto_884658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_884658 )
      ( MAKE-14PILE ?auto_884658 ?auto_884659 ?auto_884660 ?auto_884661 ?auto_884662 ?auto_884663 ?auto_884664 ?auto_884665 ?auto_884666 ?auto_884667 ?auto_884668 ?auto_884669 ?auto_884670 ?auto_884671 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_884717 - BLOCK
      ?auto_884718 - BLOCK
      ?auto_884719 - BLOCK
      ?auto_884720 - BLOCK
      ?auto_884721 - BLOCK
      ?auto_884722 - BLOCK
      ?auto_884723 - BLOCK
      ?auto_884724 - BLOCK
      ?auto_884725 - BLOCK
      ?auto_884726 - BLOCK
      ?auto_884727 - BLOCK
      ?auto_884728 - BLOCK
      ?auto_884729 - BLOCK
      ?auto_884730 - BLOCK
      ?auto_884731 - BLOCK
    )
    :vars
    (
      ?auto_884732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_884730 ) ( ON ?auto_884731 ?auto_884732 ) ( CLEAR ?auto_884731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_884717 ) ( ON ?auto_884718 ?auto_884717 ) ( ON ?auto_884719 ?auto_884718 ) ( ON ?auto_884720 ?auto_884719 ) ( ON ?auto_884721 ?auto_884720 ) ( ON ?auto_884722 ?auto_884721 ) ( ON ?auto_884723 ?auto_884722 ) ( ON ?auto_884724 ?auto_884723 ) ( ON ?auto_884725 ?auto_884724 ) ( ON ?auto_884726 ?auto_884725 ) ( ON ?auto_884727 ?auto_884726 ) ( ON ?auto_884728 ?auto_884727 ) ( ON ?auto_884729 ?auto_884728 ) ( ON ?auto_884730 ?auto_884729 ) ( not ( = ?auto_884717 ?auto_884718 ) ) ( not ( = ?auto_884717 ?auto_884719 ) ) ( not ( = ?auto_884717 ?auto_884720 ) ) ( not ( = ?auto_884717 ?auto_884721 ) ) ( not ( = ?auto_884717 ?auto_884722 ) ) ( not ( = ?auto_884717 ?auto_884723 ) ) ( not ( = ?auto_884717 ?auto_884724 ) ) ( not ( = ?auto_884717 ?auto_884725 ) ) ( not ( = ?auto_884717 ?auto_884726 ) ) ( not ( = ?auto_884717 ?auto_884727 ) ) ( not ( = ?auto_884717 ?auto_884728 ) ) ( not ( = ?auto_884717 ?auto_884729 ) ) ( not ( = ?auto_884717 ?auto_884730 ) ) ( not ( = ?auto_884717 ?auto_884731 ) ) ( not ( = ?auto_884717 ?auto_884732 ) ) ( not ( = ?auto_884718 ?auto_884719 ) ) ( not ( = ?auto_884718 ?auto_884720 ) ) ( not ( = ?auto_884718 ?auto_884721 ) ) ( not ( = ?auto_884718 ?auto_884722 ) ) ( not ( = ?auto_884718 ?auto_884723 ) ) ( not ( = ?auto_884718 ?auto_884724 ) ) ( not ( = ?auto_884718 ?auto_884725 ) ) ( not ( = ?auto_884718 ?auto_884726 ) ) ( not ( = ?auto_884718 ?auto_884727 ) ) ( not ( = ?auto_884718 ?auto_884728 ) ) ( not ( = ?auto_884718 ?auto_884729 ) ) ( not ( = ?auto_884718 ?auto_884730 ) ) ( not ( = ?auto_884718 ?auto_884731 ) ) ( not ( = ?auto_884718 ?auto_884732 ) ) ( not ( = ?auto_884719 ?auto_884720 ) ) ( not ( = ?auto_884719 ?auto_884721 ) ) ( not ( = ?auto_884719 ?auto_884722 ) ) ( not ( = ?auto_884719 ?auto_884723 ) ) ( not ( = ?auto_884719 ?auto_884724 ) ) ( not ( = ?auto_884719 ?auto_884725 ) ) ( not ( = ?auto_884719 ?auto_884726 ) ) ( not ( = ?auto_884719 ?auto_884727 ) ) ( not ( = ?auto_884719 ?auto_884728 ) ) ( not ( = ?auto_884719 ?auto_884729 ) ) ( not ( = ?auto_884719 ?auto_884730 ) ) ( not ( = ?auto_884719 ?auto_884731 ) ) ( not ( = ?auto_884719 ?auto_884732 ) ) ( not ( = ?auto_884720 ?auto_884721 ) ) ( not ( = ?auto_884720 ?auto_884722 ) ) ( not ( = ?auto_884720 ?auto_884723 ) ) ( not ( = ?auto_884720 ?auto_884724 ) ) ( not ( = ?auto_884720 ?auto_884725 ) ) ( not ( = ?auto_884720 ?auto_884726 ) ) ( not ( = ?auto_884720 ?auto_884727 ) ) ( not ( = ?auto_884720 ?auto_884728 ) ) ( not ( = ?auto_884720 ?auto_884729 ) ) ( not ( = ?auto_884720 ?auto_884730 ) ) ( not ( = ?auto_884720 ?auto_884731 ) ) ( not ( = ?auto_884720 ?auto_884732 ) ) ( not ( = ?auto_884721 ?auto_884722 ) ) ( not ( = ?auto_884721 ?auto_884723 ) ) ( not ( = ?auto_884721 ?auto_884724 ) ) ( not ( = ?auto_884721 ?auto_884725 ) ) ( not ( = ?auto_884721 ?auto_884726 ) ) ( not ( = ?auto_884721 ?auto_884727 ) ) ( not ( = ?auto_884721 ?auto_884728 ) ) ( not ( = ?auto_884721 ?auto_884729 ) ) ( not ( = ?auto_884721 ?auto_884730 ) ) ( not ( = ?auto_884721 ?auto_884731 ) ) ( not ( = ?auto_884721 ?auto_884732 ) ) ( not ( = ?auto_884722 ?auto_884723 ) ) ( not ( = ?auto_884722 ?auto_884724 ) ) ( not ( = ?auto_884722 ?auto_884725 ) ) ( not ( = ?auto_884722 ?auto_884726 ) ) ( not ( = ?auto_884722 ?auto_884727 ) ) ( not ( = ?auto_884722 ?auto_884728 ) ) ( not ( = ?auto_884722 ?auto_884729 ) ) ( not ( = ?auto_884722 ?auto_884730 ) ) ( not ( = ?auto_884722 ?auto_884731 ) ) ( not ( = ?auto_884722 ?auto_884732 ) ) ( not ( = ?auto_884723 ?auto_884724 ) ) ( not ( = ?auto_884723 ?auto_884725 ) ) ( not ( = ?auto_884723 ?auto_884726 ) ) ( not ( = ?auto_884723 ?auto_884727 ) ) ( not ( = ?auto_884723 ?auto_884728 ) ) ( not ( = ?auto_884723 ?auto_884729 ) ) ( not ( = ?auto_884723 ?auto_884730 ) ) ( not ( = ?auto_884723 ?auto_884731 ) ) ( not ( = ?auto_884723 ?auto_884732 ) ) ( not ( = ?auto_884724 ?auto_884725 ) ) ( not ( = ?auto_884724 ?auto_884726 ) ) ( not ( = ?auto_884724 ?auto_884727 ) ) ( not ( = ?auto_884724 ?auto_884728 ) ) ( not ( = ?auto_884724 ?auto_884729 ) ) ( not ( = ?auto_884724 ?auto_884730 ) ) ( not ( = ?auto_884724 ?auto_884731 ) ) ( not ( = ?auto_884724 ?auto_884732 ) ) ( not ( = ?auto_884725 ?auto_884726 ) ) ( not ( = ?auto_884725 ?auto_884727 ) ) ( not ( = ?auto_884725 ?auto_884728 ) ) ( not ( = ?auto_884725 ?auto_884729 ) ) ( not ( = ?auto_884725 ?auto_884730 ) ) ( not ( = ?auto_884725 ?auto_884731 ) ) ( not ( = ?auto_884725 ?auto_884732 ) ) ( not ( = ?auto_884726 ?auto_884727 ) ) ( not ( = ?auto_884726 ?auto_884728 ) ) ( not ( = ?auto_884726 ?auto_884729 ) ) ( not ( = ?auto_884726 ?auto_884730 ) ) ( not ( = ?auto_884726 ?auto_884731 ) ) ( not ( = ?auto_884726 ?auto_884732 ) ) ( not ( = ?auto_884727 ?auto_884728 ) ) ( not ( = ?auto_884727 ?auto_884729 ) ) ( not ( = ?auto_884727 ?auto_884730 ) ) ( not ( = ?auto_884727 ?auto_884731 ) ) ( not ( = ?auto_884727 ?auto_884732 ) ) ( not ( = ?auto_884728 ?auto_884729 ) ) ( not ( = ?auto_884728 ?auto_884730 ) ) ( not ( = ?auto_884728 ?auto_884731 ) ) ( not ( = ?auto_884728 ?auto_884732 ) ) ( not ( = ?auto_884729 ?auto_884730 ) ) ( not ( = ?auto_884729 ?auto_884731 ) ) ( not ( = ?auto_884729 ?auto_884732 ) ) ( not ( = ?auto_884730 ?auto_884731 ) ) ( not ( = ?auto_884730 ?auto_884732 ) ) ( not ( = ?auto_884731 ?auto_884732 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_884731 ?auto_884732 )
      ( !STACK ?auto_884731 ?auto_884730 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_884779 - BLOCK
      ?auto_884780 - BLOCK
      ?auto_884781 - BLOCK
      ?auto_884782 - BLOCK
      ?auto_884783 - BLOCK
      ?auto_884784 - BLOCK
      ?auto_884785 - BLOCK
      ?auto_884786 - BLOCK
      ?auto_884787 - BLOCK
      ?auto_884788 - BLOCK
      ?auto_884789 - BLOCK
      ?auto_884790 - BLOCK
      ?auto_884791 - BLOCK
      ?auto_884792 - BLOCK
      ?auto_884793 - BLOCK
    )
    :vars
    (
      ?auto_884794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884793 ?auto_884794 ) ( ON-TABLE ?auto_884779 ) ( ON ?auto_884780 ?auto_884779 ) ( ON ?auto_884781 ?auto_884780 ) ( ON ?auto_884782 ?auto_884781 ) ( ON ?auto_884783 ?auto_884782 ) ( ON ?auto_884784 ?auto_884783 ) ( ON ?auto_884785 ?auto_884784 ) ( ON ?auto_884786 ?auto_884785 ) ( ON ?auto_884787 ?auto_884786 ) ( ON ?auto_884788 ?auto_884787 ) ( ON ?auto_884789 ?auto_884788 ) ( ON ?auto_884790 ?auto_884789 ) ( ON ?auto_884791 ?auto_884790 ) ( not ( = ?auto_884779 ?auto_884780 ) ) ( not ( = ?auto_884779 ?auto_884781 ) ) ( not ( = ?auto_884779 ?auto_884782 ) ) ( not ( = ?auto_884779 ?auto_884783 ) ) ( not ( = ?auto_884779 ?auto_884784 ) ) ( not ( = ?auto_884779 ?auto_884785 ) ) ( not ( = ?auto_884779 ?auto_884786 ) ) ( not ( = ?auto_884779 ?auto_884787 ) ) ( not ( = ?auto_884779 ?auto_884788 ) ) ( not ( = ?auto_884779 ?auto_884789 ) ) ( not ( = ?auto_884779 ?auto_884790 ) ) ( not ( = ?auto_884779 ?auto_884791 ) ) ( not ( = ?auto_884779 ?auto_884792 ) ) ( not ( = ?auto_884779 ?auto_884793 ) ) ( not ( = ?auto_884779 ?auto_884794 ) ) ( not ( = ?auto_884780 ?auto_884781 ) ) ( not ( = ?auto_884780 ?auto_884782 ) ) ( not ( = ?auto_884780 ?auto_884783 ) ) ( not ( = ?auto_884780 ?auto_884784 ) ) ( not ( = ?auto_884780 ?auto_884785 ) ) ( not ( = ?auto_884780 ?auto_884786 ) ) ( not ( = ?auto_884780 ?auto_884787 ) ) ( not ( = ?auto_884780 ?auto_884788 ) ) ( not ( = ?auto_884780 ?auto_884789 ) ) ( not ( = ?auto_884780 ?auto_884790 ) ) ( not ( = ?auto_884780 ?auto_884791 ) ) ( not ( = ?auto_884780 ?auto_884792 ) ) ( not ( = ?auto_884780 ?auto_884793 ) ) ( not ( = ?auto_884780 ?auto_884794 ) ) ( not ( = ?auto_884781 ?auto_884782 ) ) ( not ( = ?auto_884781 ?auto_884783 ) ) ( not ( = ?auto_884781 ?auto_884784 ) ) ( not ( = ?auto_884781 ?auto_884785 ) ) ( not ( = ?auto_884781 ?auto_884786 ) ) ( not ( = ?auto_884781 ?auto_884787 ) ) ( not ( = ?auto_884781 ?auto_884788 ) ) ( not ( = ?auto_884781 ?auto_884789 ) ) ( not ( = ?auto_884781 ?auto_884790 ) ) ( not ( = ?auto_884781 ?auto_884791 ) ) ( not ( = ?auto_884781 ?auto_884792 ) ) ( not ( = ?auto_884781 ?auto_884793 ) ) ( not ( = ?auto_884781 ?auto_884794 ) ) ( not ( = ?auto_884782 ?auto_884783 ) ) ( not ( = ?auto_884782 ?auto_884784 ) ) ( not ( = ?auto_884782 ?auto_884785 ) ) ( not ( = ?auto_884782 ?auto_884786 ) ) ( not ( = ?auto_884782 ?auto_884787 ) ) ( not ( = ?auto_884782 ?auto_884788 ) ) ( not ( = ?auto_884782 ?auto_884789 ) ) ( not ( = ?auto_884782 ?auto_884790 ) ) ( not ( = ?auto_884782 ?auto_884791 ) ) ( not ( = ?auto_884782 ?auto_884792 ) ) ( not ( = ?auto_884782 ?auto_884793 ) ) ( not ( = ?auto_884782 ?auto_884794 ) ) ( not ( = ?auto_884783 ?auto_884784 ) ) ( not ( = ?auto_884783 ?auto_884785 ) ) ( not ( = ?auto_884783 ?auto_884786 ) ) ( not ( = ?auto_884783 ?auto_884787 ) ) ( not ( = ?auto_884783 ?auto_884788 ) ) ( not ( = ?auto_884783 ?auto_884789 ) ) ( not ( = ?auto_884783 ?auto_884790 ) ) ( not ( = ?auto_884783 ?auto_884791 ) ) ( not ( = ?auto_884783 ?auto_884792 ) ) ( not ( = ?auto_884783 ?auto_884793 ) ) ( not ( = ?auto_884783 ?auto_884794 ) ) ( not ( = ?auto_884784 ?auto_884785 ) ) ( not ( = ?auto_884784 ?auto_884786 ) ) ( not ( = ?auto_884784 ?auto_884787 ) ) ( not ( = ?auto_884784 ?auto_884788 ) ) ( not ( = ?auto_884784 ?auto_884789 ) ) ( not ( = ?auto_884784 ?auto_884790 ) ) ( not ( = ?auto_884784 ?auto_884791 ) ) ( not ( = ?auto_884784 ?auto_884792 ) ) ( not ( = ?auto_884784 ?auto_884793 ) ) ( not ( = ?auto_884784 ?auto_884794 ) ) ( not ( = ?auto_884785 ?auto_884786 ) ) ( not ( = ?auto_884785 ?auto_884787 ) ) ( not ( = ?auto_884785 ?auto_884788 ) ) ( not ( = ?auto_884785 ?auto_884789 ) ) ( not ( = ?auto_884785 ?auto_884790 ) ) ( not ( = ?auto_884785 ?auto_884791 ) ) ( not ( = ?auto_884785 ?auto_884792 ) ) ( not ( = ?auto_884785 ?auto_884793 ) ) ( not ( = ?auto_884785 ?auto_884794 ) ) ( not ( = ?auto_884786 ?auto_884787 ) ) ( not ( = ?auto_884786 ?auto_884788 ) ) ( not ( = ?auto_884786 ?auto_884789 ) ) ( not ( = ?auto_884786 ?auto_884790 ) ) ( not ( = ?auto_884786 ?auto_884791 ) ) ( not ( = ?auto_884786 ?auto_884792 ) ) ( not ( = ?auto_884786 ?auto_884793 ) ) ( not ( = ?auto_884786 ?auto_884794 ) ) ( not ( = ?auto_884787 ?auto_884788 ) ) ( not ( = ?auto_884787 ?auto_884789 ) ) ( not ( = ?auto_884787 ?auto_884790 ) ) ( not ( = ?auto_884787 ?auto_884791 ) ) ( not ( = ?auto_884787 ?auto_884792 ) ) ( not ( = ?auto_884787 ?auto_884793 ) ) ( not ( = ?auto_884787 ?auto_884794 ) ) ( not ( = ?auto_884788 ?auto_884789 ) ) ( not ( = ?auto_884788 ?auto_884790 ) ) ( not ( = ?auto_884788 ?auto_884791 ) ) ( not ( = ?auto_884788 ?auto_884792 ) ) ( not ( = ?auto_884788 ?auto_884793 ) ) ( not ( = ?auto_884788 ?auto_884794 ) ) ( not ( = ?auto_884789 ?auto_884790 ) ) ( not ( = ?auto_884789 ?auto_884791 ) ) ( not ( = ?auto_884789 ?auto_884792 ) ) ( not ( = ?auto_884789 ?auto_884793 ) ) ( not ( = ?auto_884789 ?auto_884794 ) ) ( not ( = ?auto_884790 ?auto_884791 ) ) ( not ( = ?auto_884790 ?auto_884792 ) ) ( not ( = ?auto_884790 ?auto_884793 ) ) ( not ( = ?auto_884790 ?auto_884794 ) ) ( not ( = ?auto_884791 ?auto_884792 ) ) ( not ( = ?auto_884791 ?auto_884793 ) ) ( not ( = ?auto_884791 ?auto_884794 ) ) ( not ( = ?auto_884792 ?auto_884793 ) ) ( not ( = ?auto_884792 ?auto_884794 ) ) ( not ( = ?auto_884793 ?auto_884794 ) ) ( CLEAR ?auto_884791 ) ( ON ?auto_884792 ?auto_884793 ) ( CLEAR ?auto_884792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_884779 ?auto_884780 ?auto_884781 ?auto_884782 ?auto_884783 ?auto_884784 ?auto_884785 ?auto_884786 ?auto_884787 ?auto_884788 ?auto_884789 ?auto_884790 ?auto_884791 ?auto_884792 )
      ( MAKE-15PILE ?auto_884779 ?auto_884780 ?auto_884781 ?auto_884782 ?auto_884783 ?auto_884784 ?auto_884785 ?auto_884786 ?auto_884787 ?auto_884788 ?auto_884789 ?auto_884790 ?auto_884791 ?auto_884792 ?auto_884793 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_884841 - BLOCK
      ?auto_884842 - BLOCK
      ?auto_884843 - BLOCK
      ?auto_884844 - BLOCK
      ?auto_884845 - BLOCK
      ?auto_884846 - BLOCK
      ?auto_884847 - BLOCK
      ?auto_884848 - BLOCK
      ?auto_884849 - BLOCK
      ?auto_884850 - BLOCK
      ?auto_884851 - BLOCK
      ?auto_884852 - BLOCK
      ?auto_884853 - BLOCK
      ?auto_884854 - BLOCK
      ?auto_884855 - BLOCK
    )
    :vars
    (
      ?auto_884856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884855 ?auto_884856 ) ( ON-TABLE ?auto_884841 ) ( ON ?auto_884842 ?auto_884841 ) ( ON ?auto_884843 ?auto_884842 ) ( ON ?auto_884844 ?auto_884843 ) ( ON ?auto_884845 ?auto_884844 ) ( ON ?auto_884846 ?auto_884845 ) ( ON ?auto_884847 ?auto_884846 ) ( ON ?auto_884848 ?auto_884847 ) ( ON ?auto_884849 ?auto_884848 ) ( ON ?auto_884850 ?auto_884849 ) ( ON ?auto_884851 ?auto_884850 ) ( ON ?auto_884852 ?auto_884851 ) ( not ( = ?auto_884841 ?auto_884842 ) ) ( not ( = ?auto_884841 ?auto_884843 ) ) ( not ( = ?auto_884841 ?auto_884844 ) ) ( not ( = ?auto_884841 ?auto_884845 ) ) ( not ( = ?auto_884841 ?auto_884846 ) ) ( not ( = ?auto_884841 ?auto_884847 ) ) ( not ( = ?auto_884841 ?auto_884848 ) ) ( not ( = ?auto_884841 ?auto_884849 ) ) ( not ( = ?auto_884841 ?auto_884850 ) ) ( not ( = ?auto_884841 ?auto_884851 ) ) ( not ( = ?auto_884841 ?auto_884852 ) ) ( not ( = ?auto_884841 ?auto_884853 ) ) ( not ( = ?auto_884841 ?auto_884854 ) ) ( not ( = ?auto_884841 ?auto_884855 ) ) ( not ( = ?auto_884841 ?auto_884856 ) ) ( not ( = ?auto_884842 ?auto_884843 ) ) ( not ( = ?auto_884842 ?auto_884844 ) ) ( not ( = ?auto_884842 ?auto_884845 ) ) ( not ( = ?auto_884842 ?auto_884846 ) ) ( not ( = ?auto_884842 ?auto_884847 ) ) ( not ( = ?auto_884842 ?auto_884848 ) ) ( not ( = ?auto_884842 ?auto_884849 ) ) ( not ( = ?auto_884842 ?auto_884850 ) ) ( not ( = ?auto_884842 ?auto_884851 ) ) ( not ( = ?auto_884842 ?auto_884852 ) ) ( not ( = ?auto_884842 ?auto_884853 ) ) ( not ( = ?auto_884842 ?auto_884854 ) ) ( not ( = ?auto_884842 ?auto_884855 ) ) ( not ( = ?auto_884842 ?auto_884856 ) ) ( not ( = ?auto_884843 ?auto_884844 ) ) ( not ( = ?auto_884843 ?auto_884845 ) ) ( not ( = ?auto_884843 ?auto_884846 ) ) ( not ( = ?auto_884843 ?auto_884847 ) ) ( not ( = ?auto_884843 ?auto_884848 ) ) ( not ( = ?auto_884843 ?auto_884849 ) ) ( not ( = ?auto_884843 ?auto_884850 ) ) ( not ( = ?auto_884843 ?auto_884851 ) ) ( not ( = ?auto_884843 ?auto_884852 ) ) ( not ( = ?auto_884843 ?auto_884853 ) ) ( not ( = ?auto_884843 ?auto_884854 ) ) ( not ( = ?auto_884843 ?auto_884855 ) ) ( not ( = ?auto_884843 ?auto_884856 ) ) ( not ( = ?auto_884844 ?auto_884845 ) ) ( not ( = ?auto_884844 ?auto_884846 ) ) ( not ( = ?auto_884844 ?auto_884847 ) ) ( not ( = ?auto_884844 ?auto_884848 ) ) ( not ( = ?auto_884844 ?auto_884849 ) ) ( not ( = ?auto_884844 ?auto_884850 ) ) ( not ( = ?auto_884844 ?auto_884851 ) ) ( not ( = ?auto_884844 ?auto_884852 ) ) ( not ( = ?auto_884844 ?auto_884853 ) ) ( not ( = ?auto_884844 ?auto_884854 ) ) ( not ( = ?auto_884844 ?auto_884855 ) ) ( not ( = ?auto_884844 ?auto_884856 ) ) ( not ( = ?auto_884845 ?auto_884846 ) ) ( not ( = ?auto_884845 ?auto_884847 ) ) ( not ( = ?auto_884845 ?auto_884848 ) ) ( not ( = ?auto_884845 ?auto_884849 ) ) ( not ( = ?auto_884845 ?auto_884850 ) ) ( not ( = ?auto_884845 ?auto_884851 ) ) ( not ( = ?auto_884845 ?auto_884852 ) ) ( not ( = ?auto_884845 ?auto_884853 ) ) ( not ( = ?auto_884845 ?auto_884854 ) ) ( not ( = ?auto_884845 ?auto_884855 ) ) ( not ( = ?auto_884845 ?auto_884856 ) ) ( not ( = ?auto_884846 ?auto_884847 ) ) ( not ( = ?auto_884846 ?auto_884848 ) ) ( not ( = ?auto_884846 ?auto_884849 ) ) ( not ( = ?auto_884846 ?auto_884850 ) ) ( not ( = ?auto_884846 ?auto_884851 ) ) ( not ( = ?auto_884846 ?auto_884852 ) ) ( not ( = ?auto_884846 ?auto_884853 ) ) ( not ( = ?auto_884846 ?auto_884854 ) ) ( not ( = ?auto_884846 ?auto_884855 ) ) ( not ( = ?auto_884846 ?auto_884856 ) ) ( not ( = ?auto_884847 ?auto_884848 ) ) ( not ( = ?auto_884847 ?auto_884849 ) ) ( not ( = ?auto_884847 ?auto_884850 ) ) ( not ( = ?auto_884847 ?auto_884851 ) ) ( not ( = ?auto_884847 ?auto_884852 ) ) ( not ( = ?auto_884847 ?auto_884853 ) ) ( not ( = ?auto_884847 ?auto_884854 ) ) ( not ( = ?auto_884847 ?auto_884855 ) ) ( not ( = ?auto_884847 ?auto_884856 ) ) ( not ( = ?auto_884848 ?auto_884849 ) ) ( not ( = ?auto_884848 ?auto_884850 ) ) ( not ( = ?auto_884848 ?auto_884851 ) ) ( not ( = ?auto_884848 ?auto_884852 ) ) ( not ( = ?auto_884848 ?auto_884853 ) ) ( not ( = ?auto_884848 ?auto_884854 ) ) ( not ( = ?auto_884848 ?auto_884855 ) ) ( not ( = ?auto_884848 ?auto_884856 ) ) ( not ( = ?auto_884849 ?auto_884850 ) ) ( not ( = ?auto_884849 ?auto_884851 ) ) ( not ( = ?auto_884849 ?auto_884852 ) ) ( not ( = ?auto_884849 ?auto_884853 ) ) ( not ( = ?auto_884849 ?auto_884854 ) ) ( not ( = ?auto_884849 ?auto_884855 ) ) ( not ( = ?auto_884849 ?auto_884856 ) ) ( not ( = ?auto_884850 ?auto_884851 ) ) ( not ( = ?auto_884850 ?auto_884852 ) ) ( not ( = ?auto_884850 ?auto_884853 ) ) ( not ( = ?auto_884850 ?auto_884854 ) ) ( not ( = ?auto_884850 ?auto_884855 ) ) ( not ( = ?auto_884850 ?auto_884856 ) ) ( not ( = ?auto_884851 ?auto_884852 ) ) ( not ( = ?auto_884851 ?auto_884853 ) ) ( not ( = ?auto_884851 ?auto_884854 ) ) ( not ( = ?auto_884851 ?auto_884855 ) ) ( not ( = ?auto_884851 ?auto_884856 ) ) ( not ( = ?auto_884852 ?auto_884853 ) ) ( not ( = ?auto_884852 ?auto_884854 ) ) ( not ( = ?auto_884852 ?auto_884855 ) ) ( not ( = ?auto_884852 ?auto_884856 ) ) ( not ( = ?auto_884853 ?auto_884854 ) ) ( not ( = ?auto_884853 ?auto_884855 ) ) ( not ( = ?auto_884853 ?auto_884856 ) ) ( not ( = ?auto_884854 ?auto_884855 ) ) ( not ( = ?auto_884854 ?auto_884856 ) ) ( not ( = ?auto_884855 ?auto_884856 ) ) ( ON ?auto_884854 ?auto_884855 ) ( CLEAR ?auto_884852 ) ( ON ?auto_884853 ?auto_884854 ) ( CLEAR ?auto_884853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_884841 ?auto_884842 ?auto_884843 ?auto_884844 ?auto_884845 ?auto_884846 ?auto_884847 ?auto_884848 ?auto_884849 ?auto_884850 ?auto_884851 ?auto_884852 ?auto_884853 )
      ( MAKE-15PILE ?auto_884841 ?auto_884842 ?auto_884843 ?auto_884844 ?auto_884845 ?auto_884846 ?auto_884847 ?auto_884848 ?auto_884849 ?auto_884850 ?auto_884851 ?auto_884852 ?auto_884853 ?auto_884854 ?auto_884855 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_884903 - BLOCK
      ?auto_884904 - BLOCK
      ?auto_884905 - BLOCK
      ?auto_884906 - BLOCK
      ?auto_884907 - BLOCK
      ?auto_884908 - BLOCK
      ?auto_884909 - BLOCK
      ?auto_884910 - BLOCK
      ?auto_884911 - BLOCK
      ?auto_884912 - BLOCK
      ?auto_884913 - BLOCK
      ?auto_884914 - BLOCK
      ?auto_884915 - BLOCK
      ?auto_884916 - BLOCK
      ?auto_884917 - BLOCK
    )
    :vars
    (
      ?auto_884918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884917 ?auto_884918 ) ( ON-TABLE ?auto_884903 ) ( ON ?auto_884904 ?auto_884903 ) ( ON ?auto_884905 ?auto_884904 ) ( ON ?auto_884906 ?auto_884905 ) ( ON ?auto_884907 ?auto_884906 ) ( ON ?auto_884908 ?auto_884907 ) ( ON ?auto_884909 ?auto_884908 ) ( ON ?auto_884910 ?auto_884909 ) ( ON ?auto_884911 ?auto_884910 ) ( ON ?auto_884912 ?auto_884911 ) ( ON ?auto_884913 ?auto_884912 ) ( not ( = ?auto_884903 ?auto_884904 ) ) ( not ( = ?auto_884903 ?auto_884905 ) ) ( not ( = ?auto_884903 ?auto_884906 ) ) ( not ( = ?auto_884903 ?auto_884907 ) ) ( not ( = ?auto_884903 ?auto_884908 ) ) ( not ( = ?auto_884903 ?auto_884909 ) ) ( not ( = ?auto_884903 ?auto_884910 ) ) ( not ( = ?auto_884903 ?auto_884911 ) ) ( not ( = ?auto_884903 ?auto_884912 ) ) ( not ( = ?auto_884903 ?auto_884913 ) ) ( not ( = ?auto_884903 ?auto_884914 ) ) ( not ( = ?auto_884903 ?auto_884915 ) ) ( not ( = ?auto_884903 ?auto_884916 ) ) ( not ( = ?auto_884903 ?auto_884917 ) ) ( not ( = ?auto_884903 ?auto_884918 ) ) ( not ( = ?auto_884904 ?auto_884905 ) ) ( not ( = ?auto_884904 ?auto_884906 ) ) ( not ( = ?auto_884904 ?auto_884907 ) ) ( not ( = ?auto_884904 ?auto_884908 ) ) ( not ( = ?auto_884904 ?auto_884909 ) ) ( not ( = ?auto_884904 ?auto_884910 ) ) ( not ( = ?auto_884904 ?auto_884911 ) ) ( not ( = ?auto_884904 ?auto_884912 ) ) ( not ( = ?auto_884904 ?auto_884913 ) ) ( not ( = ?auto_884904 ?auto_884914 ) ) ( not ( = ?auto_884904 ?auto_884915 ) ) ( not ( = ?auto_884904 ?auto_884916 ) ) ( not ( = ?auto_884904 ?auto_884917 ) ) ( not ( = ?auto_884904 ?auto_884918 ) ) ( not ( = ?auto_884905 ?auto_884906 ) ) ( not ( = ?auto_884905 ?auto_884907 ) ) ( not ( = ?auto_884905 ?auto_884908 ) ) ( not ( = ?auto_884905 ?auto_884909 ) ) ( not ( = ?auto_884905 ?auto_884910 ) ) ( not ( = ?auto_884905 ?auto_884911 ) ) ( not ( = ?auto_884905 ?auto_884912 ) ) ( not ( = ?auto_884905 ?auto_884913 ) ) ( not ( = ?auto_884905 ?auto_884914 ) ) ( not ( = ?auto_884905 ?auto_884915 ) ) ( not ( = ?auto_884905 ?auto_884916 ) ) ( not ( = ?auto_884905 ?auto_884917 ) ) ( not ( = ?auto_884905 ?auto_884918 ) ) ( not ( = ?auto_884906 ?auto_884907 ) ) ( not ( = ?auto_884906 ?auto_884908 ) ) ( not ( = ?auto_884906 ?auto_884909 ) ) ( not ( = ?auto_884906 ?auto_884910 ) ) ( not ( = ?auto_884906 ?auto_884911 ) ) ( not ( = ?auto_884906 ?auto_884912 ) ) ( not ( = ?auto_884906 ?auto_884913 ) ) ( not ( = ?auto_884906 ?auto_884914 ) ) ( not ( = ?auto_884906 ?auto_884915 ) ) ( not ( = ?auto_884906 ?auto_884916 ) ) ( not ( = ?auto_884906 ?auto_884917 ) ) ( not ( = ?auto_884906 ?auto_884918 ) ) ( not ( = ?auto_884907 ?auto_884908 ) ) ( not ( = ?auto_884907 ?auto_884909 ) ) ( not ( = ?auto_884907 ?auto_884910 ) ) ( not ( = ?auto_884907 ?auto_884911 ) ) ( not ( = ?auto_884907 ?auto_884912 ) ) ( not ( = ?auto_884907 ?auto_884913 ) ) ( not ( = ?auto_884907 ?auto_884914 ) ) ( not ( = ?auto_884907 ?auto_884915 ) ) ( not ( = ?auto_884907 ?auto_884916 ) ) ( not ( = ?auto_884907 ?auto_884917 ) ) ( not ( = ?auto_884907 ?auto_884918 ) ) ( not ( = ?auto_884908 ?auto_884909 ) ) ( not ( = ?auto_884908 ?auto_884910 ) ) ( not ( = ?auto_884908 ?auto_884911 ) ) ( not ( = ?auto_884908 ?auto_884912 ) ) ( not ( = ?auto_884908 ?auto_884913 ) ) ( not ( = ?auto_884908 ?auto_884914 ) ) ( not ( = ?auto_884908 ?auto_884915 ) ) ( not ( = ?auto_884908 ?auto_884916 ) ) ( not ( = ?auto_884908 ?auto_884917 ) ) ( not ( = ?auto_884908 ?auto_884918 ) ) ( not ( = ?auto_884909 ?auto_884910 ) ) ( not ( = ?auto_884909 ?auto_884911 ) ) ( not ( = ?auto_884909 ?auto_884912 ) ) ( not ( = ?auto_884909 ?auto_884913 ) ) ( not ( = ?auto_884909 ?auto_884914 ) ) ( not ( = ?auto_884909 ?auto_884915 ) ) ( not ( = ?auto_884909 ?auto_884916 ) ) ( not ( = ?auto_884909 ?auto_884917 ) ) ( not ( = ?auto_884909 ?auto_884918 ) ) ( not ( = ?auto_884910 ?auto_884911 ) ) ( not ( = ?auto_884910 ?auto_884912 ) ) ( not ( = ?auto_884910 ?auto_884913 ) ) ( not ( = ?auto_884910 ?auto_884914 ) ) ( not ( = ?auto_884910 ?auto_884915 ) ) ( not ( = ?auto_884910 ?auto_884916 ) ) ( not ( = ?auto_884910 ?auto_884917 ) ) ( not ( = ?auto_884910 ?auto_884918 ) ) ( not ( = ?auto_884911 ?auto_884912 ) ) ( not ( = ?auto_884911 ?auto_884913 ) ) ( not ( = ?auto_884911 ?auto_884914 ) ) ( not ( = ?auto_884911 ?auto_884915 ) ) ( not ( = ?auto_884911 ?auto_884916 ) ) ( not ( = ?auto_884911 ?auto_884917 ) ) ( not ( = ?auto_884911 ?auto_884918 ) ) ( not ( = ?auto_884912 ?auto_884913 ) ) ( not ( = ?auto_884912 ?auto_884914 ) ) ( not ( = ?auto_884912 ?auto_884915 ) ) ( not ( = ?auto_884912 ?auto_884916 ) ) ( not ( = ?auto_884912 ?auto_884917 ) ) ( not ( = ?auto_884912 ?auto_884918 ) ) ( not ( = ?auto_884913 ?auto_884914 ) ) ( not ( = ?auto_884913 ?auto_884915 ) ) ( not ( = ?auto_884913 ?auto_884916 ) ) ( not ( = ?auto_884913 ?auto_884917 ) ) ( not ( = ?auto_884913 ?auto_884918 ) ) ( not ( = ?auto_884914 ?auto_884915 ) ) ( not ( = ?auto_884914 ?auto_884916 ) ) ( not ( = ?auto_884914 ?auto_884917 ) ) ( not ( = ?auto_884914 ?auto_884918 ) ) ( not ( = ?auto_884915 ?auto_884916 ) ) ( not ( = ?auto_884915 ?auto_884917 ) ) ( not ( = ?auto_884915 ?auto_884918 ) ) ( not ( = ?auto_884916 ?auto_884917 ) ) ( not ( = ?auto_884916 ?auto_884918 ) ) ( not ( = ?auto_884917 ?auto_884918 ) ) ( ON ?auto_884916 ?auto_884917 ) ( ON ?auto_884915 ?auto_884916 ) ( CLEAR ?auto_884913 ) ( ON ?auto_884914 ?auto_884915 ) ( CLEAR ?auto_884914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_884903 ?auto_884904 ?auto_884905 ?auto_884906 ?auto_884907 ?auto_884908 ?auto_884909 ?auto_884910 ?auto_884911 ?auto_884912 ?auto_884913 ?auto_884914 )
      ( MAKE-15PILE ?auto_884903 ?auto_884904 ?auto_884905 ?auto_884906 ?auto_884907 ?auto_884908 ?auto_884909 ?auto_884910 ?auto_884911 ?auto_884912 ?auto_884913 ?auto_884914 ?auto_884915 ?auto_884916 ?auto_884917 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_884965 - BLOCK
      ?auto_884966 - BLOCK
      ?auto_884967 - BLOCK
      ?auto_884968 - BLOCK
      ?auto_884969 - BLOCK
      ?auto_884970 - BLOCK
      ?auto_884971 - BLOCK
      ?auto_884972 - BLOCK
      ?auto_884973 - BLOCK
      ?auto_884974 - BLOCK
      ?auto_884975 - BLOCK
      ?auto_884976 - BLOCK
      ?auto_884977 - BLOCK
      ?auto_884978 - BLOCK
      ?auto_884979 - BLOCK
    )
    :vars
    (
      ?auto_884980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_884979 ?auto_884980 ) ( ON-TABLE ?auto_884965 ) ( ON ?auto_884966 ?auto_884965 ) ( ON ?auto_884967 ?auto_884966 ) ( ON ?auto_884968 ?auto_884967 ) ( ON ?auto_884969 ?auto_884968 ) ( ON ?auto_884970 ?auto_884969 ) ( ON ?auto_884971 ?auto_884970 ) ( ON ?auto_884972 ?auto_884971 ) ( ON ?auto_884973 ?auto_884972 ) ( ON ?auto_884974 ?auto_884973 ) ( not ( = ?auto_884965 ?auto_884966 ) ) ( not ( = ?auto_884965 ?auto_884967 ) ) ( not ( = ?auto_884965 ?auto_884968 ) ) ( not ( = ?auto_884965 ?auto_884969 ) ) ( not ( = ?auto_884965 ?auto_884970 ) ) ( not ( = ?auto_884965 ?auto_884971 ) ) ( not ( = ?auto_884965 ?auto_884972 ) ) ( not ( = ?auto_884965 ?auto_884973 ) ) ( not ( = ?auto_884965 ?auto_884974 ) ) ( not ( = ?auto_884965 ?auto_884975 ) ) ( not ( = ?auto_884965 ?auto_884976 ) ) ( not ( = ?auto_884965 ?auto_884977 ) ) ( not ( = ?auto_884965 ?auto_884978 ) ) ( not ( = ?auto_884965 ?auto_884979 ) ) ( not ( = ?auto_884965 ?auto_884980 ) ) ( not ( = ?auto_884966 ?auto_884967 ) ) ( not ( = ?auto_884966 ?auto_884968 ) ) ( not ( = ?auto_884966 ?auto_884969 ) ) ( not ( = ?auto_884966 ?auto_884970 ) ) ( not ( = ?auto_884966 ?auto_884971 ) ) ( not ( = ?auto_884966 ?auto_884972 ) ) ( not ( = ?auto_884966 ?auto_884973 ) ) ( not ( = ?auto_884966 ?auto_884974 ) ) ( not ( = ?auto_884966 ?auto_884975 ) ) ( not ( = ?auto_884966 ?auto_884976 ) ) ( not ( = ?auto_884966 ?auto_884977 ) ) ( not ( = ?auto_884966 ?auto_884978 ) ) ( not ( = ?auto_884966 ?auto_884979 ) ) ( not ( = ?auto_884966 ?auto_884980 ) ) ( not ( = ?auto_884967 ?auto_884968 ) ) ( not ( = ?auto_884967 ?auto_884969 ) ) ( not ( = ?auto_884967 ?auto_884970 ) ) ( not ( = ?auto_884967 ?auto_884971 ) ) ( not ( = ?auto_884967 ?auto_884972 ) ) ( not ( = ?auto_884967 ?auto_884973 ) ) ( not ( = ?auto_884967 ?auto_884974 ) ) ( not ( = ?auto_884967 ?auto_884975 ) ) ( not ( = ?auto_884967 ?auto_884976 ) ) ( not ( = ?auto_884967 ?auto_884977 ) ) ( not ( = ?auto_884967 ?auto_884978 ) ) ( not ( = ?auto_884967 ?auto_884979 ) ) ( not ( = ?auto_884967 ?auto_884980 ) ) ( not ( = ?auto_884968 ?auto_884969 ) ) ( not ( = ?auto_884968 ?auto_884970 ) ) ( not ( = ?auto_884968 ?auto_884971 ) ) ( not ( = ?auto_884968 ?auto_884972 ) ) ( not ( = ?auto_884968 ?auto_884973 ) ) ( not ( = ?auto_884968 ?auto_884974 ) ) ( not ( = ?auto_884968 ?auto_884975 ) ) ( not ( = ?auto_884968 ?auto_884976 ) ) ( not ( = ?auto_884968 ?auto_884977 ) ) ( not ( = ?auto_884968 ?auto_884978 ) ) ( not ( = ?auto_884968 ?auto_884979 ) ) ( not ( = ?auto_884968 ?auto_884980 ) ) ( not ( = ?auto_884969 ?auto_884970 ) ) ( not ( = ?auto_884969 ?auto_884971 ) ) ( not ( = ?auto_884969 ?auto_884972 ) ) ( not ( = ?auto_884969 ?auto_884973 ) ) ( not ( = ?auto_884969 ?auto_884974 ) ) ( not ( = ?auto_884969 ?auto_884975 ) ) ( not ( = ?auto_884969 ?auto_884976 ) ) ( not ( = ?auto_884969 ?auto_884977 ) ) ( not ( = ?auto_884969 ?auto_884978 ) ) ( not ( = ?auto_884969 ?auto_884979 ) ) ( not ( = ?auto_884969 ?auto_884980 ) ) ( not ( = ?auto_884970 ?auto_884971 ) ) ( not ( = ?auto_884970 ?auto_884972 ) ) ( not ( = ?auto_884970 ?auto_884973 ) ) ( not ( = ?auto_884970 ?auto_884974 ) ) ( not ( = ?auto_884970 ?auto_884975 ) ) ( not ( = ?auto_884970 ?auto_884976 ) ) ( not ( = ?auto_884970 ?auto_884977 ) ) ( not ( = ?auto_884970 ?auto_884978 ) ) ( not ( = ?auto_884970 ?auto_884979 ) ) ( not ( = ?auto_884970 ?auto_884980 ) ) ( not ( = ?auto_884971 ?auto_884972 ) ) ( not ( = ?auto_884971 ?auto_884973 ) ) ( not ( = ?auto_884971 ?auto_884974 ) ) ( not ( = ?auto_884971 ?auto_884975 ) ) ( not ( = ?auto_884971 ?auto_884976 ) ) ( not ( = ?auto_884971 ?auto_884977 ) ) ( not ( = ?auto_884971 ?auto_884978 ) ) ( not ( = ?auto_884971 ?auto_884979 ) ) ( not ( = ?auto_884971 ?auto_884980 ) ) ( not ( = ?auto_884972 ?auto_884973 ) ) ( not ( = ?auto_884972 ?auto_884974 ) ) ( not ( = ?auto_884972 ?auto_884975 ) ) ( not ( = ?auto_884972 ?auto_884976 ) ) ( not ( = ?auto_884972 ?auto_884977 ) ) ( not ( = ?auto_884972 ?auto_884978 ) ) ( not ( = ?auto_884972 ?auto_884979 ) ) ( not ( = ?auto_884972 ?auto_884980 ) ) ( not ( = ?auto_884973 ?auto_884974 ) ) ( not ( = ?auto_884973 ?auto_884975 ) ) ( not ( = ?auto_884973 ?auto_884976 ) ) ( not ( = ?auto_884973 ?auto_884977 ) ) ( not ( = ?auto_884973 ?auto_884978 ) ) ( not ( = ?auto_884973 ?auto_884979 ) ) ( not ( = ?auto_884973 ?auto_884980 ) ) ( not ( = ?auto_884974 ?auto_884975 ) ) ( not ( = ?auto_884974 ?auto_884976 ) ) ( not ( = ?auto_884974 ?auto_884977 ) ) ( not ( = ?auto_884974 ?auto_884978 ) ) ( not ( = ?auto_884974 ?auto_884979 ) ) ( not ( = ?auto_884974 ?auto_884980 ) ) ( not ( = ?auto_884975 ?auto_884976 ) ) ( not ( = ?auto_884975 ?auto_884977 ) ) ( not ( = ?auto_884975 ?auto_884978 ) ) ( not ( = ?auto_884975 ?auto_884979 ) ) ( not ( = ?auto_884975 ?auto_884980 ) ) ( not ( = ?auto_884976 ?auto_884977 ) ) ( not ( = ?auto_884976 ?auto_884978 ) ) ( not ( = ?auto_884976 ?auto_884979 ) ) ( not ( = ?auto_884976 ?auto_884980 ) ) ( not ( = ?auto_884977 ?auto_884978 ) ) ( not ( = ?auto_884977 ?auto_884979 ) ) ( not ( = ?auto_884977 ?auto_884980 ) ) ( not ( = ?auto_884978 ?auto_884979 ) ) ( not ( = ?auto_884978 ?auto_884980 ) ) ( not ( = ?auto_884979 ?auto_884980 ) ) ( ON ?auto_884978 ?auto_884979 ) ( ON ?auto_884977 ?auto_884978 ) ( ON ?auto_884976 ?auto_884977 ) ( CLEAR ?auto_884974 ) ( ON ?auto_884975 ?auto_884976 ) ( CLEAR ?auto_884975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_884965 ?auto_884966 ?auto_884967 ?auto_884968 ?auto_884969 ?auto_884970 ?auto_884971 ?auto_884972 ?auto_884973 ?auto_884974 ?auto_884975 )
      ( MAKE-15PILE ?auto_884965 ?auto_884966 ?auto_884967 ?auto_884968 ?auto_884969 ?auto_884970 ?auto_884971 ?auto_884972 ?auto_884973 ?auto_884974 ?auto_884975 ?auto_884976 ?auto_884977 ?auto_884978 ?auto_884979 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_885027 - BLOCK
      ?auto_885028 - BLOCK
      ?auto_885029 - BLOCK
      ?auto_885030 - BLOCK
      ?auto_885031 - BLOCK
      ?auto_885032 - BLOCK
      ?auto_885033 - BLOCK
      ?auto_885034 - BLOCK
      ?auto_885035 - BLOCK
      ?auto_885036 - BLOCK
      ?auto_885037 - BLOCK
      ?auto_885038 - BLOCK
      ?auto_885039 - BLOCK
      ?auto_885040 - BLOCK
      ?auto_885041 - BLOCK
    )
    :vars
    (
      ?auto_885042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885041 ?auto_885042 ) ( ON-TABLE ?auto_885027 ) ( ON ?auto_885028 ?auto_885027 ) ( ON ?auto_885029 ?auto_885028 ) ( ON ?auto_885030 ?auto_885029 ) ( ON ?auto_885031 ?auto_885030 ) ( ON ?auto_885032 ?auto_885031 ) ( ON ?auto_885033 ?auto_885032 ) ( ON ?auto_885034 ?auto_885033 ) ( ON ?auto_885035 ?auto_885034 ) ( not ( = ?auto_885027 ?auto_885028 ) ) ( not ( = ?auto_885027 ?auto_885029 ) ) ( not ( = ?auto_885027 ?auto_885030 ) ) ( not ( = ?auto_885027 ?auto_885031 ) ) ( not ( = ?auto_885027 ?auto_885032 ) ) ( not ( = ?auto_885027 ?auto_885033 ) ) ( not ( = ?auto_885027 ?auto_885034 ) ) ( not ( = ?auto_885027 ?auto_885035 ) ) ( not ( = ?auto_885027 ?auto_885036 ) ) ( not ( = ?auto_885027 ?auto_885037 ) ) ( not ( = ?auto_885027 ?auto_885038 ) ) ( not ( = ?auto_885027 ?auto_885039 ) ) ( not ( = ?auto_885027 ?auto_885040 ) ) ( not ( = ?auto_885027 ?auto_885041 ) ) ( not ( = ?auto_885027 ?auto_885042 ) ) ( not ( = ?auto_885028 ?auto_885029 ) ) ( not ( = ?auto_885028 ?auto_885030 ) ) ( not ( = ?auto_885028 ?auto_885031 ) ) ( not ( = ?auto_885028 ?auto_885032 ) ) ( not ( = ?auto_885028 ?auto_885033 ) ) ( not ( = ?auto_885028 ?auto_885034 ) ) ( not ( = ?auto_885028 ?auto_885035 ) ) ( not ( = ?auto_885028 ?auto_885036 ) ) ( not ( = ?auto_885028 ?auto_885037 ) ) ( not ( = ?auto_885028 ?auto_885038 ) ) ( not ( = ?auto_885028 ?auto_885039 ) ) ( not ( = ?auto_885028 ?auto_885040 ) ) ( not ( = ?auto_885028 ?auto_885041 ) ) ( not ( = ?auto_885028 ?auto_885042 ) ) ( not ( = ?auto_885029 ?auto_885030 ) ) ( not ( = ?auto_885029 ?auto_885031 ) ) ( not ( = ?auto_885029 ?auto_885032 ) ) ( not ( = ?auto_885029 ?auto_885033 ) ) ( not ( = ?auto_885029 ?auto_885034 ) ) ( not ( = ?auto_885029 ?auto_885035 ) ) ( not ( = ?auto_885029 ?auto_885036 ) ) ( not ( = ?auto_885029 ?auto_885037 ) ) ( not ( = ?auto_885029 ?auto_885038 ) ) ( not ( = ?auto_885029 ?auto_885039 ) ) ( not ( = ?auto_885029 ?auto_885040 ) ) ( not ( = ?auto_885029 ?auto_885041 ) ) ( not ( = ?auto_885029 ?auto_885042 ) ) ( not ( = ?auto_885030 ?auto_885031 ) ) ( not ( = ?auto_885030 ?auto_885032 ) ) ( not ( = ?auto_885030 ?auto_885033 ) ) ( not ( = ?auto_885030 ?auto_885034 ) ) ( not ( = ?auto_885030 ?auto_885035 ) ) ( not ( = ?auto_885030 ?auto_885036 ) ) ( not ( = ?auto_885030 ?auto_885037 ) ) ( not ( = ?auto_885030 ?auto_885038 ) ) ( not ( = ?auto_885030 ?auto_885039 ) ) ( not ( = ?auto_885030 ?auto_885040 ) ) ( not ( = ?auto_885030 ?auto_885041 ) ) ( not ( = ?auto_885030 ?auto_885042 ) ) ( not ( = ?auto_885031 ?auto_885032 ) ) ( not ( = ?auto_885031 ?auto_885033 ) ) ( not ( = ?auto_885031 ?auto_885034 ) ) ( not ( = ?auto_885031 ?auto_885035 ) ) ( not ( = ?auto_885031 ?auto_885036 ) ) ( not ( = ?auto_885031 ?auto_885037 ) ) ( not ( = ?auto_885031 ?auto_885038 ) ) ( not ( = ?auto_885031 ?auto_885039 ) ) ( not ( = ?auto_885031 ?auto_885040 ) ) ( not ( = ?auto_885031 ?auto_885041 ) ) ( not ( = ?auto_885031 ?auto_885042 ) ) ( not ( = ?auto_885032 ?auto_885033 ) ) ( not ( = ?auto_885032 ?auto_885034 ) ) ( not ( = ?auto_885032 ?auto_885035 ) ) ( not ( = ?auto_885032 ?auto_885036 ) ) ( not ( = ?auto_885032 ?auto_885037 ) ) ( not ( = ?auto_885032 ?auto_885038 ) ) ( not ( = ?auto_885032 ?auto_885039 ) ) ( not ( = ?auto_885032 ?auto_885040 ) ) ( not ( = ?auto_885032 ?auto_885041 ) ) ( not ( = ?auto_885032 ?auto_885042 ) ) ( not ( = ?auto_885033 ?auto_885034 ) ) ( not ( = ?auto_885033 ?auto_885035 ) ) ( not ( = ?auto_885033 ?auto_885036 ) ) ( not ( = ?auto_885033 ?auto_885037 ) ) ( not ( = ?auto_885033 ?auto_885038 ) ) ( not ( = ?auto_885033 ?auto_885039 ) ) ( not ( = ?auto_885033 ?auto_885040 ) ) ( not ( = ?auto_885033 ?auto_885041 ) ) ( not ( = ?auto_885033 ?auto_885042 ) ) ( not ( = ?auto_885034 ?auto_885035 ) ) ( not ( = ?auto_885034 ?auto_885036 ) ) ( not ( = ?auto_885034 ?auto_885037 ) ) ( not ( = ?auto_885034 ?auto_885038 ) ) ( not ( = ?auto_885034 ?auto_885039 ) ) ( not ( = ?auto_885034 ?auto_885040 ) ) ( not ( = ?auto_885034 ?auto_885041 ) ) ( not ( = ?auto_885034 ?auto_885042 ) ) ( not ( = ?auto_885035 ?auto_885036 ) ) ( not ( = ?auto_885035 ?auto_885037 ) ) ( not ( = ?auto_885035 ?auto_885038 ) ) ( not ( = ?auto_885035 ?auto_885039 ) ) ( not ( = ?auto_885035 ?auto_885040 ) ) ( not ( = ?auto_885035 ?auto_885041 ) ) ( not ( = ?auto_885035 ?auto_885042 ) ) ( not ( = ?auto_885036 ?auto_885037 ) ) ( not ( = ?auto_885036 ?auto_885038 ) ) ( not ( = ?auto_885036 ?auto_885039 ) ) ( not ( = ?auto_885036 ?auto_885040 ) ) ( not ( = ?auto_885036 ?auto_885041 ) ) ( not ( = ?auto_885036 ?auto_885042 ) ) ( not ( = ?auto_885037 ?auto_885038 ) ) ( not ( = ?auto_885037 ?auto_885039 ) ) ( not ( = ?auto_885037 ?auto_885040 ) ) ( not ( = ?auto_885037 ?auto_885041 ) ) ( not ( = ?auto_885037 ?auto_885042 ) ) ( not ( = ?auto_885038 ?auto_885039 ) ) ( not ( = ?auto_885038 ?auto_885040 ) ) ( not ( = ?auto_885038 ?auto_885041 ) ) ( not ( = ?auto_885038 ?auto_885042 ) ) ( not ( = ?auto_885039 ?auto_885040 ) ) ( not ( = ?auto_885039 ?auto_885041 ) ) ( not ( = ?auto_885039 ?auto_885042 ) ) ( not ( = ?auto_885040 ?auto_885041 ) ) ( not ( = ?auto_885040 ?auto_885042 ) ) ( not ( = ?auto_885041 ?auto_885042 ) ) ( ON ?auto_885040 ?auto_885041 ) ( ON ?auto_885039 ?auto_885040 ) ( ON ?auto_885038 ?auto_885039 ) ( ON ?auto_885037 ?auto_885038 ) ( CLEAR ?auto_885035 ) ( ON ?auto_885036 ?auto_885037 ) ( CLEAR ?auto_885036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_885027 ?auto_885028 ?auto_885029 ?auto_885030 ?auto_885031 ?auto_885032 ?auto_885033 ?auto_885034 ?auto_885035 ?auto_885036 )
      ( MAKE-15PILE ?auto_885027 ?auto_885028 ?auto_885029 ?auto_885030 ?auto_885031 ?auto_885032 ?auto_885033 ?auto_885034 ?auto_885035 ?auto_885036 ?auto_885037 ?auto_885038 ?auto_885039 ?auto_885040 ?auto_885041 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_885089 - BLOCK
      ?auto_885090 - BLOCK
      ?auto_885091 - BLOCK
      ?auto_885092 - BLOCK
      ?auto_885093 - BLOCK
      ?auto_885094 - BLOCK
      ?auto_885095 - BLOCK
      ?auto_885096 - BLOCK
      ?auto_885097 - BLOCK
      ?auto_885098 - BLOCK
      ?auto_885099 - BLOCK
      ?auto_885100 - BLOCK
      ?auto_885101 - BLOCK
      ?auto_885102 - BLOCK
      ?auto_885103 - BLOCK
    )
    :vars
    (
      ?auto_885104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885103 ?auto_885104 ) ( ON-TABLE ?auto_885089 ) ( ON ?auto_885090 ?auto_885089 ) ( ON ?auto_885091 ?auto_885090 ) ( ON ?auto_885092 ?auto_885091 ) ( ON ?auto_885093 ?auto_885092 ) ( ON ?auto_885094 ?auto_885093 ) ( ON ?auto_885095 ?auto_885094 ) ( ON ?auto_885096 ?auto_885095 ) ( not ( = ?auto_885089 ?auto_885090 ) ) ( not ( = ?auto_885089 ?auto_885091 ) ) ( not ( = ?auto_885089 ?auto_885092 ) ) ( not ( = ?auto_885089 ?auto_885093 ) ) ( not ( = ?auto_885089 ?auto_885094 ) ) ( not ( = ?auto_885089 ?auto_885095 ) ) ( not ( = ?auto_885089 ?auto_885096 ) ) ( not ( = ?auto_885089 ?auto_885097 ) ) ( not ( = ?auto_885089 ?auto_885098 ) ) ( not ( = ?auto_885089 ?auto_885099 ) ) ( not ( = ?auto_885089 ?auto_885100 ) ) ( not ( = ?auto_885089 ?auto_885101 ) ) ( not ( = ?auto_885089 ?auto_885102 ) ) ( not ( = ?auto_885089 ?auto_885103 ) ) ( not ( = ?auto_885089 ?auto_885104 ) ) ( not ( = ?auto_885090 ?auto_885091 ) ) ( not ( = ?auto_885090 ?auto_885092 ) ) ( not ( = ?auto_885090 ?auto_885093 ) ) ( not ( = ?auto_885090 ?auto_885094 ) ) ( not ( = ?auto_885090 ?auto_885095 ) ) ( not ( = ?auto_885090 ?auto_885096 ) ) ( not ( = ?auto_885090 ?auto_885097 ) ) ( not ( = ?auto_885090 ?auto_885098 ) ) ( not ( = ?auto_885090 ?auto_885099 ) ) ( not ( = ?auto_885090 ?auto_885100 ) ) ( not ( = ?auto_885090 ?auto_885101 ) ) ( not ( = ?auto_885090 ?auto_885102 ) ) ( not ( = ?auto_885090 ?auto_885103 ) ) ( not ( = ?auto_885090 ?auto_885104 ) ) ( not ( = ?auto_885091 ?auto_885092 ) ) ( not ( = ?auto_885091 ?auto_885093 ) ) ( not ( = ?auto_885091 ?auto_885094 ) ) ( not ( = ?auto_885091 ?auto_885095 ) ) ( not ( = ?auto_885091 ?auto_885096 ) ) ( not ( = ?auto_885091 ?auto_885097 ) ) ( not ( = ?auto_885091 ?auto_885098 ) ) ( not ( = ?auto_885091 ?auto_885099 ) ) ( not ( = ?auto_885091 ?auto_885100 ) ) ( not ( = ?auto_885091 ?auto_885101 ) ) ( not ( = ?auto_885091 ?auto_885102 ) ) ( not ( = ?auto_885091 ?auto_885103 ) ) ( not ( = ?auto_885091 ?auto_885104 ) ) ( not ( = ?auto_885092 ?auto_885093 ) ) ( not ( = ?auto_885092 ?auto_885094 ) ) ( not ( = ?auto_885092 ?auto_885095 ) ) ( not ( = ?auto_885092 ?auto_885096 ) ) ( not ( = ?auto_885092 ?auto_885097 ) ) ( not ( = ?auto_885092 ?auto_885098 ) ) ( not ( = ?auto_885092 ?auto_885099 ) ) ( not ( = ?auto_885092 ?auto_885100 ) ) ( not ( = ?auto_885092 ?auto_885101 ) ) ( not ( = ?auto_885092 ?auto_885102 ) ) ( not ( = ?auto_885092 ?auto_885103 ) ) ( not ( = ?auto_885092 ?auto_885104 ) ) ( not ( = ?auto_885093 ?auto_885094 ) ) ( not ( = ?auto_885093 ?auto_885095 ) ) ( not ( = ?auto_885093 ?auto_885096 ) ) ( not ( = ?auto_885093 ?auto_885097 ) ) ( not ( = ?auto_885093 ?auto_885098 ) ) ( not ( = ?auto_885093 ?auto_885099 ) ) ( not ( = ?auto_885093 ?auto_885100 ) ) ( not ( = ?auto_885093 ?auto_885101 ) ) ( not ( = ?auto_885093 ?auto_885102 ) ) ( not ( = ?auto_885093 ?auto_885103 ) ) ( not ( = ?auto_885093 ?auto_885104 ) ) ( not ( = ?auto_885094 ?auto_885095 ) ) ( not ( = ?auto_885094 ?auto_885096 ) ) ( not ( = ?auto_885094 ?auto_885097 ) ) ( not ( = ?auto_885094 ?auto_885098 ) ) ( not ( = ?auto_885094 ?auto_885099 ) ) ( not ( = ?auto_885094 ?auto_885100 ) ) ( not ( = ?auto_885094 ?auto_885101 ) ) ( not ( = ?auto_885094 ?auto_885102 ) ) ( not ( = ?auto_885094 ?auto_885103 ) ) ( not ( = ?auto_885094 ?auto_885104 ) ) ( not ( = ?auto_885095 ?auto_885096 ) ) ( not ( = ?auto_885095 ?auto_885097 ) ) ( not ( = ?auto_885095 ?auto_885098 ) ) ( not ( = ?auto_885095 ?auto_885099 ) ) ( not ( = ?auto_885095 ?auto_885100 ) ) ( not ( = ?auto_885095 ?auto_885101 ) ) ( not ( = ?auto_885095 ?auto_885102 ) ) ( not ( = ?auto_885095 ?auto_885103 ) ) ( not ( = ?auto_885095 ?auto_885104 ) ) ( not ( = ?auto_885096 ?auto_885097 ) ) ( not ( = ?auto_885096 ?auto_885098 ) ) ( not ( = ?auto_885096 ?auto_885099 ) ) ( not ( = ?auto_885096 ?auto_885100 ) ) ( not ( = ?auto_885096 ?auto_885101 ) ) ( not ( = ?auto_885096 ?auto_885102 ) ) ( not ( = ?auto_885096 ?auto_885103 ) ) ( not ( = ?auto_885096 ?auto_885104 ) ) ( not ( = ?auto_885097 ?auto_885098 ) ) ( not ( = ?auto_885097 ?auto_885099 ) ) ( not ( = ?auto_885097 ?auto_885100 ) ) ( not ( = ?auto_885097 ?auto_885101 ) ) ( not ( = ?auto_885097 ?auto_885102 ) ) ( not ( = ?auto_885097 ?auto_885103 ) ) ( not ( = ?auto_885097 ?auto_885104 ) ) ( not ( = ?auto_885098 ?auto_885099 ) ) ( not ( = ?auto_885098 ?auto_885100 ) ) ( not ( = ?auto_885098 ?auto_885101 ) ) ( not ( = ?auto_885098 ?auto_885102 ) ) ( not ( = ?auto_885098 ?auto_885103 ) ) ( not ( = ?auto_885098 ?auto_885104 ) ) ( not ( = ?auto_885099 ?auto_885100 ) ) ( not ( = ?auto_885099 ?auto_885101 ) ) ( not ( = ?auto_885099 ?auto_885102 ) ) ( not ( = ?auto_885099 ?auto_885103 ) ) ( not ( = ?auto_885099 ?auto_885104 ) ) ( not ( = ?auto_885100 ?auto_885101 ) ) ( not ( = ?auto_885100 ?auto_885102 ) ) ( not ( = ?auto_885100 ?auto_885103 ) ) ( not ( = ?auto_885100 ?auto_885104 ) ) ( not ( = ?auto_885101 ?auto_885102 ) ) ( not ( = ?auto_885101 ?auto_885103 ) ) ( not ( = ?auto_885101 ?auto_885104 ) ) ( not ( = ?auto_885102 ?auto_885103 ) ) ( not ( = ?auto_885102 ?auto_885104 ) ) ( not ( = ?auto_885103 ?auto_885104 ) ) ( ON ?auto_885102 ?auto_885103 ) ( ON ?auto_885101 ?auto_885102 ) ( ON ?auto_885100 ?auto_885101 ) ( ON ?auto_885099 ?auto_885100 ) ( ON ?auto_885098 ?auto_885099 ) ( CLEAR ?auto_885096 ) ( ON ?auto_885097 ?auto_885098 ) ( CLEAR ?auto_885097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_885089 ?auto_885090 ?auto_885091 ?auto_885092 ?auto_885093 ?auto_885094 ?auto_885095 ?auto_885096 ?auto_885097 )
      ( MAKE-15PILE ?auto_885089 ?auto_885090 ?auto_885091 ?auto_885092 ?auto_885093 ?auto_885094 ?auto_885095 ?auto_885096 ?auto_885097 ?auto_885098 ?auto_885099 ?auto_885100 ?auto_885101 ?auto_885102 ?auto_885103 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_885151 - BLOCK
      ?auto_885152 - BLOCK
      ?auto_885153 - BLOCK
      ?auto_885154 - BLOCK
      ?auto_885155 - BLOCK
      ?auto_885156 - BLOCK
      ?auto_885157 - BLOCK
      ?auto_885158 - BLOCK
      ?auto_885159 - BLOCK
      ?auto_885160 - BLOCK
      ?auto_885161 - BLOCK
      ?auto_885162 - BLOCK
      ?auto_885163 - BLOCK
      ?auto_885164 - BLOCK
      ?auto_885165 - BLOCK
    )
    :vars
    (
      ?auto_885166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885165 ?auto_885166 ) ( ON-TABLE ?auto_885151 ) ( ON ?auto_885152 ?auto_885151 ) ( ON ?auto_885153 ?auto_885152 ) ( ON ?auto_885154 ?auto_885153 ) ( ON ?auto_885155 ?auto_885154 ) ( ON ?auto_885156 ?auto_885155 ) ( ON ?auto_885157 ?auto_885156 ) ( not ( = ?auto_885151 ?auto_885152 ) ) ( not ( = ?auto_885151 ?auto_885153 ) ) ( not ( = ?auto_885151 ?auto_885154 ) ) ( not ( = ?auto_885151 ?auto_885155 ) ) ( not ( = ?auto_885151 ?auto_885156 ) ) ( not ( = ?auto_885151 ?auto_885157 ) ) ( not ( = ?auto_885151 ?auto_885158 ) ) ( not ( = ?auto_885151 ?auto_885159 ) ) ( not ( = ?auto_885151 ?auto_885160 ) ) ( not ( = ?auto_885151 ?auto_885161 ) ) ( not ( = ?auto_885151 ?auto_885162 ) ) ( not ( = ?auto_885151 ?auto_885163 ) ) ( not ( = ?auto_885151 ?auto_885164 ) ) ( not ( = ?auto_885151 ?auto_885165 ) ) ( not ( = ?auto_885151 ?auto_885166 ) ) ( not ( = ?auto_885152 ?auto_885153 ) ) ( not ( = ?auto_885152 ?auto_885154 ) ) ( not ( = ?auto_885152 ?auto_885155 ) ) ( not ( = ?auto_885152 ?auto_885156 ) ) ( not ( = ?auto_885152 ?auto_885157 ) ) ( not ( = ?auto_885152 ?auto_885158 ) ) ( not ( = ?auto_885152 ?auto_885159 ) ) ( not ( = ?auto_885152 ?auto_885160 ) ) ( not ( = ?auto_885152 ?auto_885161 ) ) ( not ( = ?auto_885152 ?auto_885162 ) ) ( not ( = ?auto_885152 ?auto_885163 ) ) ( not ( = ?auto_885152 ?auto_885164 ) ) ( not ( = ?auto_885152 ?auto_885165 ) ) ( not ( = ?auto_885152 ?auto_885166 ) ) ( not ( = ?auto_885153 ?auto_885154 ) ) ( not ( = ?auto_885153 ?auto_885155 ) ) ( not ( = ?auto_885153 ?auto_885156 ) ) ( not ( = ?auto_885153 ?auto_885157 ) ) ( not ( = ?auto_885153 ?auto_885158 ) ) ( not ( = ?auto_885153 ?auto_885159 ) ) ( not ( = ?auto_885153 ?auto_885160 ) ) ( not ( = ?auto_885153 ?auto_885161 ) ) ( not ( = ?auto_885153 ?auto_885162 ) ) ( not ( = ?auto_885153 ?auto_885163 ) ) ( not ( = ?auto_885153 ?auto_885164 ) ) ( not ( = ?auto_885153 ?auto_885165 ) ) ( not ( = ?auto_885153 ?auto_885166 ) ) ( not ( = ?auto_885154 ?auto_885155 ) ) ( not ( = ?auto_885154 ?auto_885156 ) ) ( not ( = ?auto_885154 ?auto_885157 ) ) ( not ( = ?auto_885154 ?auto_885158 ) ) ( not ( = ?auto_885154 ?auto_885159 ) ) ( not ( = ?auto_885154 ?auto_885160 ) ) ( not ( = ?auto_885154 ?auto_885161 ) ) ( not ( = ?auto_885154 ?auto_885162 ) ) ( not ( = ?auto_885154 ?auto_885163 ) ) ( not ( = ?auto_885154 ?auto_885164 ) ) ( not ( = ?auto_885154 ?auto_885165 ) ) ( not ( = ?auto_885154 ?auto_885166 ) ) ( not ( = ?auto_885155 ?auto_885156 ) ) ( not ( = ?auto_885155 ?auto_885157 ) ) ( not ( = ?auto_885155 ?auto_885158 ) ) ( not ( = ?auto_885155 ?auto_885159 ) ) ( not ( = ?auto_885155 ?auto_885160 ) ) ( not ( = ?auto_885155 ?auto_885161 ) ) ( not ( = ?auto_885155 ?auto_885162 ) ) ( not ( = ?auto_885155 ?auto_885163 ) ) ( not ( = ?auto_885155 ?auto_885164 ) ) ( not ( = ?auto_885155 ?auto_885165 ) ) ( not ( = ?auto_885155 ?auto_885166 ) ) ( not ( = ?auto_885156 ?auto_885157 ) ) ( not ( = ?auto_885156 ?auto_885158 ) ) ( not ( = ?auto_885156 ?auto_885159 ) ) ( not ( = ?auto_885156 ?auto_885160 ) ) ( not ( = ?auto_885156 ?auto_885161 ) ) ( not ( = ?auto_885156 ?auto_885162 ) ) ( not ( = ?auto_885156 ?auto_885163 ) ) ( not ( = ?auto_885156 ?auto_885164 ) ) ( not ( = ?auto_885156 ?auto_885165 ) ) ( not ( = ?auto_885156 ?auto_885166 ) ) ( not ( = ?auto_885157 ?auto_885158 ) ) ( not ( = ?auto_885157 ?auto_885159 ) ) ( not ( = ?auto_885157 ?auto_885160 ) ) ( not ( = ?auto_885157 ?auto_885161 ) ) ( not ( = ?auto_885157 ?auto_885162 ) ) ( not ( = ?auto_885157 ?auto_885163 ) ) ( not ( = ?auto_885157 ?auto_885164 ) ) ( not ( = ?auto_885157 ?auto_885165 ) ) ( not ( = ?auto_885157 ?auto_885166 ) ) ( not ( = ?auto_885158 ?auto_885159 ) ) ( not ( = ?auto_885158 ?auto_885160 ) ) ( not ( = ?auto_885158 ?auto_885161 ) ) ( not ( = ?auto_885158 ?auto_885162 ) ) ( not ( = ?auto_885158 ?auto_885163 ) ) ( not ( = ?auto_885158 ?auto_885164 ) ) ( not ( = ?auto_885158 ?auto_885165 ) ) ( not ( = ?auto_885158 ?auto_885166 ) ) ( not ( = ?auto_885159 ?auto_885160 ) ) ( not ( = ?auto_885159 ?auto_885161 ) ) ( not ( = ?auto_885159 ?auto_885162 ) ) ( not ( = ?auto_885159 ?auto_885163 ) ) ( not ( = ?auto_885159 ?auto_885164 ) ) ( not ( = ?auto_885159 ?auto_885165 ) ) ( not ( = ?auto_885159 ?auto_885166 ) ) ( not ( = ?auto_885160 ?auto_885161 ) ) ( not ( = ?auto_885160 ?auto_885162 ) ) ( not ( = ?auto_885160 ?auto_885163 ) ) ( not ( = ?auto_885160 ?auto_885164 ) ) ( not ( = ?auto_885160 ?auto_885165 ) ) ( not ( = ?auto_885160 ?auto_885166 ) ) ( not ( = ?auto_885161 ?auto_885162 ) ) ( not ( = ?auto_885161 ?auto_885163 ) ) ( not ( = ?auto_885161 ?auto_885164 ) ) ( not ( = ?auto_885161 ?auto_885165 ) ) ( not ( = ?auto_885161 ?auto_885166 ) ) ( not ( = ?auto_885162 ?auto_885163 ) ) ( not ( = ?auto_885162 ?auto_885164 ) ) ( not ( = ?auto_885162 ?auto_885165 ) ) ( not ( = ?auto_885162 ?auto_885166 ) ) ( not ( = ?auto_885163 ?auto_885164 ) ) ( not ( = ?auto_885163 ?auto_885165 ) ) ( not ( = ?auto_885163 ?auto_885166 ) ) ( not ( = ?auto_885164 ?auto_885165 ) ) ( not ( = ?auto_885164 ?auto_885166 ) ) ( not ( = ?auto_885165 ?auto_885166 ) ) ( ON ?auto_885164 ?auto_885165 ) ( ON ?auto_885163 ?auto_885164 ) ( ON ?auto_885162 ?auto_885163 ) ( ON ?auto_885161 ?auto_885162 ) ( ON ?auto_885160 ?auto_885161 ) ( ON ?auto_885159 ?auto_885160 ) ( CLEAR ?auto_885157 ) ( ON ?auto_885158 ?auto_885159 ) ( CLEAR ?auto_885158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_885151 ?auto_885152 ?auto_885153 ?auto_885154 ?auto_885155 ?auto_885156 ?auto_885157 ?auto_885158 )
      ( MAKE-15PILE ?auto_885151 ?auto_885152 ?auto_885153 ?auto_885154 ?auto_885155 ?auto_885156 ?auto_885157 ?auto_885158 ?auto_885159 ?auto_885160 ?auto_885161 ?auto_885162 ?auto_885163 ?auto_885164 ?auto_885165 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_885213 - BLOCK
      ?auto_885214 - BLOCK
      ?auto_885215 - BLOCK
      ?auto_885216 - BLOCK
      ?auto_885217 - BLOCK
      ?auto_885218 - BLOCK
      ?auto_885219 - BLOCK
      ?auto_885220 - BLOCK
      ?auto_885221 - BLOCK
      ?auto_885222 - BLOCK
      ?auto_885223 - BLOCK
      ?auto_885224 - BLOCK
      ?auto_885225 - BLOCK
      ?auto_885226 - BLOCK
      ?auto_885227 - BLOCK
    )
    :vars
    (
      ?auto_885228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885227 ?auto_885228 ) ( ON-TABLE ?auto_885213 ) ( ON ?auto_885214 ?auto_885213 ) ( ON ?auto_885215 ?auto_885214 ) ( ON ?auto_885216 ?auto_885215 ) ( ON ?auto_885217 ?auto_885216 ) ( ON ?auto_885218 ?auto_885217 ) ( not ( = ?auto_885213 ?auto_885214 ) ) ( not ( = ?auto_885213 ?auto_885215 ) ) ( not ( = ?auto_885213 ?auto_885216 ) ) ( not ( = ?auto_885213 ?auto_885217 ) ) ( not ( = ?auto_885213 ?auto_885218 ) ) ( not ( = ?auto_885213 ?auto_885219 ) ) ( not ( = ?auto_885213 ?auto_885220 ) ) ( not ( = ?auto_885213 ?auto_885221 ) ) ( not ( = ?auto_885213 ?auto_885222 ) ) ( not ( = ?auto_885213 ?auto_885223 ) ) ( not ( = ?auto_885213 ?auto_885224 ) ) ( not ( = ?auto_885213 ?auto_885225 ) ) ( not ( = ?auto_885213 ?auto_885226 ) ) ( not ( = ?auto_885213 ?auto_885227 ) ) ( not ( = ?auto_885213 ?auto_885228 ) ) ( not ( = ?auto_885214 ?auto_885215 ) ) ( not ( = ?auto_885214 ?auto_885216 ) ) ( not ( = ?auto_885214 ?auto_885217 ) ) ( not ( = ?auto_885214 ?auto_885218 ) ) ( not ( = ?auto_885214 ?auto_885219 ) ) ( not ( = ?auto_885214 ?auto_885220 ) ) ( not ( = ?auto_885214 ?auto_885221 ) ) ( not ( = ?auto_885214 ?auto_885222 ) ) ( not ( = ?auto_885214 ?auto_885223 ) ) ( not ( = ?auto_885214 ?auto_885224 ) ) ( not ( = ?auto_885214 ?auto_885225 ) ) ( not ( = ?auto_885214 ?auto_885226 ) ) ( not ( = ?auto_885214 ?auto_885227 ) ) ( not ( = ?auto_885214 ?auto_885228 ) ) ( not ( = ?auto_885215 ?auto_885216 ) ) ( not ( = ?auto_885215 ?auto_885217 ) ) ( not ( = ?auto_885215 ?auto_885218 ) ) ( not ( = ?auto_885215 ?auto_885219 ) ) ( not ( = ?auto_885215 ?auto_885220 ) ) ( not ( = ?auto_885215 ?auto_885221 ) ) ( not ( = ?auto_885215 ?auto_885222 ) ) ( not ( = ?auto_885215 ?auto_885223 ) ) ( not ( = ?auto_885215 ?auto_885224 ) ) ( not ( = ?auto_885215 ?auto_885225 ) ) ( not ( = ?auto_885215 ?auto_885226 ) ) ( not ( = ?auto_885215 ?auto_885227 ) ) ( not ( = ?auto_885215 ?auto_885228 ) ) ( not ( = ?auto_885216 ?auto_885217 ) ) ( not ( = ?auto_885216 ?auto_885218 ) ) ( not ( = ?auto_885216 ?auto_885219 ) ) ( not ( = ?auto_885216 ?auto_885220 ) ) ( not ( = ?auto_885216 ?auto_885221 ) ) ( not ( = ?auto_885216 ?auto_885222 ) ) ( not ( = ?auto_885216 ?auto_885223 ) ) ( not ( = ?auto_885216 ?auto_885224 ) ) ( not ( = ?auto_885216 ?auto_885225 ) ) ( not ( = ?auto_885216 ?auto_885226 ) ) ( not ( = ?auto_885216 ?auto_885227 ) ) ( not ( = ?auto_885216 ?auto_885228 ) ) ( not ( = ?auto_885217 ?auto_885218 ) ) ( not ( = ?auto_885217 ?auto_885219 ) ) ( not ( = ?auto_885217 ?auto_885220 ) ) ( not ( = ?auto_885217 ?auto_885221 ) ) ( not ( = ?auto_885217 ?auto_885222 ) ) ( not ( = ?auto_885217 ?auto_885223 ) ) ( not ( = ?auto_885217 ?auto_885224 ) ) ( not ( = ?auto_885217 ?auto_885225 ) ) ( not ( = ?auto_885217 ?auto_885226 ) ) ( not ( = ?auto_885217 ?auto_885227 ) ) ( not ( = ?auto_885217 ?auto_885228 ) ) ( not ( = ?auto_885218 ?auto_885219 ) ) ( not ( = ?auto_885218 ?auto_885220 ) ) ( not ( = ?auto_885218 ?auto_885221 ) ) ( not ( = ?auto_885218 ?auto_885222 ) ) ( not ( = ?auto_885218 ?auto_885223 ) ) ( not ( = ?auto_885218 ?auto_885224 ) ) ( not ( = ?auto_885218 ?auto_885225 ) ) ( not ( = ?auto_885218 ?auto_885226 ) ) ( not ( = ?auto_885218 ?auto_885227 ) ) ( not ( = ?auto_885218 ?auto_885228 ) ) ( not ( = ?auto_885219 ?auto_885220 ) ) ( not ( = ?auto_885219 ?auto_885221 ) ) ( not ( = ?auto_885219 ?auto_885222 ) ) ( not ( = ?auto_885219 ?auto_885223 ) ) ( not ( = ?auto_885219 ?auto_885224 ) ) ( not ( = ?auto_885219 ?auto_885225 ) ) ( not ( = ?auto_885219 ?auto_885226 ) ) ( not ( = ?auto_885219 ?auto_885227 ) ) ( not ( = ?auto_885219 ?auto_885228 ) ) ( not ( = ?auto_885220 ?auto_885221 ) ) ( not ( = ?auto_885220 ?auto_885222 ) ) ( not ( = ?auto_885220 ?auto_885223 ) ) ( not ( = ?auto_885220 ?auto_885224 ) ) ( not ( = ?auto_885220 ?auto_885225 ) ) ( not ( = ?auto_885220 ?auto_885226 ) ) ( not ( = ?auto_885220 ?auto_885227 ) ) ( not ( = ?auto_885220 ?auto_885228 ) ) ( not ( = ?auto_885221 ?auto_885222 ) ) ( not ( = ?auto_885221 ?auto_885223 ) ) ( not ( = ?auto_885221 ?auto_885224 ) ) ( not ( = ?auto_885221 ?auto_885225 ) ) ( not ( = ?auto_885221 ?auto_885226 ) ) ( not ( = ?auto_885221 ?auto_885227 ) ) ( not ( = ?auto_885221 ?auto_885228 ) ) ( not ( = ?auto_885222 ?auto_885223 ) ) ( not ( = ?auto_885222 ?auto_885224 ) ) ( not ( = ?auto_885222 ?auto_885225 ) ) ( not ( = ?auto_885222 ?auto_885226 ) ) ( not ( = ?auto_885222 ?auto_885227 ) ) ( not ( = ?auto_885222 ?auto_885228 ) ) ( not ( = ?auto_885223 ?auto_885224 ) ) ( not ( = ?auto_885223 ?auto_885225 ) ) ( not ( = ?auto_885223 ?auto_885226 ) ) ( not ( = ?auto_885223 ?auto_885227 ) ) ( not ( = ?auto_885223 ?auto_885228 ) ) ( not ( = ?auto_885224 ?auto_885225 ) ) ( not ( = ?auto_885224 ?auto_885226 ) ) ( not ( = ?auto_885224 ?auto_885227 ) ) ( not ( = ?auto_885224 ?auto_885228 ) ) ( not ( = ?auto_885225 ?auto_885226 ) ) ( not ( = ?auto_885225 ?auto_885227 ) ) ( not ( = ?auto_885225 ?auto_885228 ) ) ( not ( = ?auto_885226 ?auto_885227 ) ) ( not ( = ?auto_885226 ?auto_885228 ) ) ( not ( = ?auto_885227 ?auto_885228 ) ) ( ON ?auto_885226 ?auto_885227 ) ( ON ?auto_885225 ?auto_885226 ) ( ON ?auto_885224 ?auto_885225 ) ( ON ?auto_885223 ?auto_885224 ) ( ON ?auto_885222 ?auto_885223 ) ( ON ?auto_885221 ?auto_885222 ) ( ON ?auto_885220 ?auto_885221 ) ( CLEAR ?auto_885218 ) ( ON ?auto_885219 ?auto_885220 ) ( CLEAR ?auto_885219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_885213 ?auto_885214 ?auto_885215 ?auto_885216 ?auto_885217 ?auto_885218 ?auto_885219 )
      ( MAKE-15PILE ?auto_885213 ?auto_885214 ?auto_885215 ?auto_885216 ?auto_885217 ?auto_885218 ?auto_885219 ?auto_885220 ?auto_885221 ?auto_885222 ?auto_885223 ?auto_885224 ?auto_885225 ?auto_885226 ?auto_885227 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_885275 - BLOCK
      ?auto_885276 - BLOCK
      ?auto_885277 - BLOCK
      ?auto_885278 - BLOCK
      ?auto_885279 - BLOCK
      ?auto_885280 - BLOCK
      ?auto_885281 - BLOCK
      ?auto_885282 - BLOCK
      ?auto_885283 - BLOCK
      ?auto_885284 - BLOCK
      ?auto_885285 - BLOCK
      ?auto_885286 - BLOCK
      ?auto_885287 - BLOCK
      ?auto_885288 - BLOCK
      ?auto_885289 - BLOCK
    )
    :vars
    (
      ?auto_885290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885289 ?auto_885290 ) ( ON-TABLE ?auto_885275 ) ( ON ?auto_885276 ?auto_885275 ) ( ON ?auto_885277 ?auto_885276 ) ( ON ?auto_885278 ?auto_885277 ) ( ON ?auto_885279 ?auto_885278 ) ( not ( = ?auto_885275 ?auto_885276 ) ) ( not ( = ?auto_885275 ?auto_885277 ) ) ( not ( = ?auto_885275 ?auto_885278 ) ) ( not ( = ?auto_885275 ?auto_885279 ) ) ( not ( = ?auto_885275 ?auto_885280 ) ) ( not ( = ?auto_885275 ?auto_885281 ) ) ( not ( = ?auto_885275 ?auto_885282 ) ) ( not ( = ?auto_885275 ?auto_885283 ) ) ( not ( = ?auto_885275 ?auto_885284 ) ) ( not ( = ?auto_885275 ?auto_885285 ) ) ( not ( = ?auto_885275 ?auto_885286 ) ) ( not ( = ?auto_885275 ?auto_885287 ) ) ( not ( = ?auto_885275 ?auto_885288 ) ) ( not ( = ?auto_885275 ?auto_885289 ) ) ( not ( = ?auto_885275 ?auto_885290 ) ) ( not ( = ?auto_885276 ?auto_885277 ) ) ( not ( = ?auto_885276 ?auto_885278 ) ) ( not ( = ?auto_885276 ?auto_885279 ) ) ( not ( = ?auto_885276 ?auto_885280 ) ) ( not ( = ?auto_885276 ?auto_885281 ) ) ( not ( = ?auto_885276 ?auto_885282 ) ) ( not ( = ?auto_885276 ?auto_885283 ) ) ( not ( = ?auto_885276 ?auto_885284 ) ) ( not ( = ?auto_885276 ?auto_885285 ) ) ( not ( = ?auto_885276 ?auto_885286 ) ) ( not ( = ?auto_885276 ?auto_885287 ) ) ( not ( = ?auto_885276 ?auto_885288 ) ) ( not ( = ?auto_885276 ?auto_885289 ) ) ( not ( = ?auto_885276 ?auto_885290 ) ) ( not ( = ?auto_885277 ?auto_885278 ) ) ( not ( = ?auto_885277 ?auto_885279 ) ) ( not ( = ?auto_885277 ?auto_885280 ) ) ( not ( = ?auto_885277 ?auto_885281 ) ) ( not ( = ?auto_885277 ?auto_885282 ) ) ( not ( = ?auto_885277 ?auto_885283 ) ) ( not ( = ?auto_885277 ?auto_885284 ) ) ( not ( = ?auto_885277 ?auto_885285 ) ) ( not ( = ?auto_885277 ?auto_885286 ) ) ( not ( = ?auto_885277 ?auto_885287 ) ) ( not ( = ?auto_885277 ?auto_885288 ) ) ( not ( = ?auto_885277 ?auto_885289 ) ) ( not ( = ?auto_885277 ?auto_885290 ) ) ( not ( = ?auto_885278 ?auto_885279 ) ) ( not ( = ?auto_885278 ?auto_885280 ) ) ( not ( = ?auto_885278 ?auto_885281 ) ) ( not ( = ?auto_885278 ?auto_885282 ) ) ( not ( = ?auto_885278 ?auto_885283 ) ) ( not ( = ?auto_885278 ?auto_885284 ) ) ( not ( = ?auto_885278 ?auto_885285 ) ) ( not ( = ?auto_885278 ?auto_885286 ) ) ( not ( = ?auto_885278 ?auto_885287 ) ) ( not ( = ?auto_885278 ?auto_885288 ) ) ( not ( = ?auto_885278 ?auto_885289 ) ) ( not ( = ?auto_885278 ?auto_885290 ) ) ( not ( = ?auto_885279 ?auto_885280 ) ) ( not ( = ?auto_885279 ?auto_885281 ) ) ( not ( = ?auto_885279 ?auto_885282 ) ) ( not ( = ?auto_885279 ?auto_885283 ) ) ( not ( = ?auto_885279 ?auto_885284 ) ) ( not ( = ?auto_885279 ?auto_885285 ) ) ( not ( = ?auto_885279 ?auto_885286 ) ) ( not ( = ?auto_885279 ?auto_885287 ) ) ( not ( = ?auto_885279 ?auto_885288 ) ) ( not ( = ?auto_885279 ?auto_885289 ) ) ( not ( = ?auto_885279 ?auto_885290 ) ) ( not ( = ?auto_885280 ?auto_885281 ) ) ( not ( = ?auto_885280 ?auto_885282 ) ) ( not ( = ?auto_885280 ?auto_885283 ) ) ( not ( = ?auto_885280 ?auto_885284 ) ) ( not ( = ?auto_885280 ?auto_885285 ) ) ( not ( = ?auto_885280 ?auto_885286 ) ) ( not ( = ?auto_885280 ?auto_885287 ) ) ( not ( = ?auto_885280 ?auto_885288 ) ) ( not ( = ?auto_885280 ?auto_885289 ) ) ( not ( = ?auto_885280 ?auto_885290 ) ) ( not ( = ?auto_885281 ?auto_885282 ) ) ( not ( = ?auto_885281 ?auto_885283 ) ) ( not ( = ?auto_885281 ?auto_885284 ) ) ( not ( = ?auto_885281 ?auto_885285 ) ) ( not ( = ?auto_885281 ?auto_885286 ) ) ( not ( = ?auto_885281 ?auto_885287 ) ) ( not ( = ?auto_885281 ?auto_885288 ) ) ( not ( = ?auto_885281 ?auto_885289 ) ) ( not ( = ?auto_885281 ?auto_885290 ) ) ( not ( = ?auto_885282 ?auto_885283 ) ) ( not ( = ?auto_885282 ?auto_885284 ) ) ( not ( = ?auto_885282 ?auto_885285 ) ) ( not ( = ?auto_885282 ?auto_885286 ) ) ( not ( = ?auto_885282 ?auto_885287 ) ) ( not ( = ?auto_885282 ?auto_885288 ) ) ( not ( = ?auto_885282 ?auto_885289 ) ) ( not ( = ?auto_885282 ?auto_885290 ) ) ( not ( = ?auto_885283 ?auto_885284 ) ) ( not ( = ?auto_885283 ?auto_885285 ) ) ( not ( = ?auto_885283 ?auto_885286 ) ) ( not ( = ?auto_885283 ?auto_885287 ) ) ( not ( = ?auto_885283 ?auto_885288 ) ) ( not ( = ?auto_885283 ?auto_885289 ) ) ( not ( = ?auto_885283 ?auto_885290 ) ) ( not ( = ?auto_885284 ?auto_885285 ) ) ( not ( = ?auto_885284 ?auto_885286 ) ) ( not ( = ?auto_885284 ?auto_885287 ) ) ( not ( = ?auto_885284 ?auto_885288 ) ) ( not ( = ?auto_885284 ?auto_885289 ) ) ( not ( = ?auto_885284 ?auto_885290 ) ) ( not ( = ?auto_885285 ?auto_885286 ) ) ( not ( = ?auto_885285 ?auto_885287 ) ) ( not ( = ?auto_885285 ?auto_885288 ) ) ( not ( = ?auto_885285 ?auto_885289 ) ) ( not ( = ?auto_885285 ?auto_885290 ) ) ( not ( = ?auto_885286 ?auto_885287 ) ) ( not ( = ?auto_885286 ?auto_885288 ) ) ( not ( = ?auto_885286 ?auto_885289 ) ) ( not ( = ?auto_885286 ?auto_885290 ) ) ( not ( = ?auto_885287 ?auto_885288 ) ) ( not ( = ?auto_885287 ?auto_885289 ) ) ( not ( = ?auto_885287 ?auto_885290 ) ) ( not ( = ?auto_885288 ?auto_885289 ) ) ( not ( = ?auto_885288 ?auto_885290 ) ) ( not ( = ?auto_885289 ?auto_885290 ) ) ( ON ?auto_885288 ?auto_885289 ) ( ON ?auto_885287 ?auto_885288 ) ( ON ?auto_885286 ?auto_885287 ) ( ON ?auto_885285 ?auto_885286 ) ( ON ?auto_885284 ?auto_885285 ) ( ON ?auto_885283 ?auto_885284 ) ( ON ?auto_885282 ?auto_885283 ) ( ON ?auto_885281 ?auto_885282 ) ( CLEAR ?auto_885279 ) ( ON ?auto_885280 ?auto_885281 ) ( CLEAR ?auto_885280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_885275 ?auto_885276 ?auto_885277 ?auto_885278 ?auto_885279 ?auto_885280 )
      ( MAKE-15PILE ?auto_885275 ?auto_885276 ?auto_885277 ?auto_885278 ?auto_885279 ?auto_885280 ?auto_885281 ?auto_885282 ?auto_885283 ?auto_885284 ?auto_885285 ?auto_885286 ?auto_885287 ?auto_885288 ?auto_885289 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_885337 - BLOCK
      ?auto_885338 - BLOCK
      ?auto_885339 - BLOCK
      ?auto_885340 - BLOCK
      ?auto_885341 - BLOCK
      ?auto_885342 - BLOCK
      ?auto_885343 - BLOCK
      ?auto_885344 - BLOCK
      ?auto_885345 - BLOCK
      ?auto_885346 - BLOCK
      ?auto_885347 - BLOCK
      ?auto_885348 - BLOCK
      ?auto_885349 - BLOCK
      ?auto_885350 - BLOCK
      ?auto_885351 - BLOCK
    )
    :vars
    (
      ?auto_885352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885351 ?auto_885352 ) ( ON-TABLE ?auto_885337 ) ( ON ?auto_885338 ?auto_885337 ) ( ON ?auto_885339 ?auto_885338 ) ( ON ?auto_885340 ?auto_885339 ) ( not ( = ?auto_885337 ?auto_885338 ) ) ( not ( = ?auto_885337 ?auto_885339 ) ) ( not ( = ?auto_885337 ?auto_885340 ) ) ( not ( = ?auto_885337 ?auto_885341 ) ) ( not ( = ?auto_885337 ?auto_885342 ) ) ( not ( = ?auto_885337 ?auto_885343 ) ) ( not ( = ?auto_885337 ?auto_885344 ) ) ( not ( = ?auto_885337 ?auto_885345 ) ) ( not ( = ?auto_885337 ?auto_885346 ) ) ( not ( = ?auto_885337 ?auto_885347 ) ) ( not ( = ?auto_885337 ?auto_885348 ) ) ( not ( = ?auto_885337 ?auto_885349 ) ) ( not ( = ?auto_885337 ?auto_885350 ) ) ( not ( = ?auto_885337 ?auto_885351 ) ) ( not ( = ?auto_885337 ?auto_885352 ) ) ( not ( = ?auto_885338 ?auto_885339 ) ) ( not ( = ?auto_885338 ?auto_885340 ) ) ( not ( = ?auto_885338 ?auto_885341 ) ) ( not ( = ?auto_885338 ?auto_885342 ) ) ( not ( = ?auto_885338 ?auto_885343 ) ) ( not ( = ?auto_885338 ?auto_885344 ) ) ( not ( = ?auto_885338 ?auto_885345 ) ) ( not ( = ?auto_885338 ?auto_885346 ) ) ( not ( = ?auto_885338 ?auto_885347 ) ) ( not ( = ?auto_885338 ?auto_885348 ) ) ( not ( = ?auto_885338 ?auto_885349 ) ) ( not ( = ?auto_885338 ?auto_885350 ) ) ( not ( = ?auto_885338 ?auto_885351 ) ) ( not ( = ?auto_885338 ?auto_885352 ) ) ( not ( = ?auto_885339 ?auto_885340 ) ) ( not ( = ?auto_885339 ?auto_885341 ) ) ( not ( = ?auto_885339 ?auto_885342 ) ) ( not ( = ?auto_885339 ?auto_885343 ) ) ( not ( = ?auto_885339 ?auto_885344 ) ) ( not ( = ?auto_885339 ?auto_885345 ) ) ( not ( = ?auto_885339 ?auto_885346 ) ) ( not ( = ?auto_885339 ?auto_885347 ) ) ( not ( = ?auto_885339 ?auto_885348 ) ) ( not ( = ?auto_885339 ?auto_885349 ) ) ( not ( = ?auto_885339 ?auto_885350 ) ) ( not ( = ?auto_885339 ?auto_885351 ) ) ( not ( = ?auto_885339 ?auto_885352 ) ) ( not ( = ?auto_885340 ?auto_885341 ) ) ( not ( = ?auto_885340 ?auto_885342 ) ) ( not ( = ?auto_885340 ?auto_885343 ) ) ( not ( = ?auto_885340 ?auto_885344 ) ) ( not ( = ?auto_885340 ?auto_885345 ) ) ( not ( = ?auto_885340 ?auto_885346 ) ) ( not ( = ?auto_885340 ?auto_885347 ) ) ( not ( = ?auto_885340 ?auto_885348 ) ) ( not ( = ?auto_885340 ?auto_885349 ) ) ( not ( = ?auto_885340 ?auto_885350 ) ) ( not ( = ?auto_885340 ?auto_885351 ) ) ( not ( = ?auto_885340 ?auto_885352 ) ) ( not ( = ?auto_885341 ?auto_885342 ) ) ( not ( = ?auto_885341 ?auto_885343 ) ) ( not ( = ?auto_885341 ?auto_885344 ) ) ( not ( = ?auto_885341 ?auto_885345 ) ) ( not ( = ?auto_885341 ?auto_885346 ) ) ( not ( = ?auto_885341 ?auto_885347 ) ) ( not ( = ?auto_885341 ?auto_885348 ) ) ( not ( = ?auto_885341 ?auto_885349 ) ) ( not ( = ?auto_885341 ?auto_885350 ) ) ( not ( = ?auto_885341 ?auto_885351 ) ) ( not ( = ?auto_885341 ?auto_885352 ) ) ( not ( = ?auto_885342 ?auto_885343 ) ) ( not ( = ?auto_885342 ?auto_885344 ) ) ( not ( = ?auto_885342 ?auto_885345 ) ) ( not ( = ?auto_885342 ?auto_885346 ) ) ( not ( = ?auto_885342 ?auto_885347 ) ) ( not ( = ?auto_885342 ?auto_885348 ) ) ( not ( = ?auto_885342 ?auto_885349 ) ) ( not ( = ?auto_885342 ?auto_885350 ) ) ( not ( = ?auto_885342 ?auto_885351 ) ) ( not ( = ?auto_885342 ?auto_885352 ) ) ( not ( = ?auto_885343 ?auto_885344 ) ) ( not ( = ?auto_885343 ?auto_885345 ) ) ( not ( = ?auto_885343 ?auto_885346 ) ) ( not ( = ?auto_885343 ?auto_885347 ) ) ( not ( = ?auto_885343 ?auto_885348 ) ) ( not ( = ?auto_885343 ?auto_885349 ) ) ( not ( = ?auto_885343 ?auto_885350 ) ) ( not ( = ?auto_885343 ?auto_885351 ) ) ( not ( = ?auto_885343 ?auto_885352 ) ) ( not ( = ?auto_885344 ?auto_885345 ) ) ( not ( = ?auto_885344 ?auto_885346 ) ) ( not ( = ?auto_885344 ?auto_885347 ) ) ( not ( = ?auto_885344 ?auto_885348 ) ) ( not ( = ?auto_885344 ?auto_885349 ) ) ( not ( = ?auto_885344 ?auto_885350 ) ) ( not ( = ?auto_885344 ?auto_885351 ) ) ( not ( = ?auto_885344 ?auto_885352 ) ) ( not ( = ?auto_885345 ?auto_885346 ) ) ( not ( = ?auto_885345 ?auto_885347 ) ) ( not ( = ?auto_885345 ?auto_885348 ) ) ( not ( = ?auto_885345 ?auto_885349 ) ) ( not ( = ?auto_885345 ?auto_885350 ) ) ( not ( = ?auto_885345 ?auto_885351 ) ) ( not ( = ?auto_885345 ?auto_885352 ) ) ( not ( = ?auto_885346 ?auto_885347 ) ) ( not ( = ?auto_885346 ?auto_885348 ) ) ( not ( = ?auto_885346 ?auto_885349 ) ) ( not ( = ?auto_885346 ?auto_885350 ) ) ( not ( = ?auto_885346 ?auto_885351 ) ) ( not ( = ?auto_885346 ?auto_885352 ) ) ( not ( = ?auto_885347 ?auto_885348 ) ) ( not ( = ?auto_885347 ?auto_885349 ) ) ( not ( = ?auto_885347 ?auto_885350 ) ) ( not ( = ?auto_885347 ?auto_885351 ) ) ( not ( = ?auto_885347 ?auto_885352 ) ) ( not ( = ?auto_885348 ?auto_885349 ) ) ( not ( = ?auto_885348 ?auto_885350 ) ) ( not ( = ?auto_885348 ?auto_885351 ) ) ( not ( = ?auto_885348 ?auto_885352 ) ) ( not ( = ?auto_885349 ?auto_885350 ) ) ( not ( = ?auto_885349 ?auto_885351 ) ) ( not ( = ?auto_885349 ?auto_885352 ) ) ( not ( = ?auto_885350 ?auto_885351 ) ) ( not ( = ?auto_885350 ?auto_885352 ) ) ( not ( = ?auto_885351 ?auto_885352 ) ) ( ON ?auto_885350 ?auto_885351 ) ( ON ?auto_885349 ?auto_885350 ) ( ON ?auto_885348 ?auto_885349 ) ( ON ?auto_885347 ?auto_885348 ) ( ON ?auto_885346 ?auto_885347 ) ( ON ?auto_885345 ?auto_885346 ) ( ON ?auto_885344 ?auto_885345 ) ( ON ?auto_885343 ?auto_885344 ) ( ON ?auto_885342 ?auto_885343 ) ( CLEAR ?auto_885340 ) ( ON ?auto_885341 ?auto_885342 ) ( CLEAR ?auto_885341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_885337 ?auto_885338 ?auto_885339 ?auto_885340 ?auto_885341 )
      ( MAKE-15PILE ?auto_885337 ?auto_885338 ?auto_885339 ?auto_885340 ?auto_885341 ?auto_885342 ?auto_885343 ?auto_885344 ?auto_885345 ?auto_885346 ?auto_885347 ?auto_885348 ?auto_885349 ?auto_885350 ?auto_885351 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_885399 - BLOCK
      ?auto_885400 - BLOCK
      ?auto_885401 - BLOCK
      ?auto_885402 - BLOCK
      ?auto_885403 - BLOCK
      ?auto_885404 - BLOCK
      ?auto_885405 - BLOCK
      ?auto_885406 - BLOCK
      ?auto_885407 - BLOCK
      ?auto_885408 - BLOCK
      ?auto_885409 - BLOCK
      ?auto_885410 - BLOCK
      ?auto_885411 - BLOCK
      ?auto_885412 - BLOCK
      ?auto_885413 - BLOCK
    )
    :vars
    (
      ?auto_885414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885413 ?auto_885414 ) ( ON-TABLE ?auto_885399 ) ( ON ?auto_885400 ?auto_885399 ) ( ON ?auto_885401 ?auto_885400 ) ( not ( = ?auto_885399 ?auto_885400 ) ) ( not ( = ?auto_885399 ?auto_885401 ) ) ( not ( = ?auto_885399 ?auto_885402 ) ) ( not ( = ?auto_885399 ?auto_885403 ) ) ( not ( = ?auto_885399 ?auto_885404 ) ) ( not ( = ?auto_885399 ?auto_885405 ) ) ( not ( = ?auto_885399 ?auto_885406 ) ) ( not ( = ?auto_885399 ?auto_885407 ) ) ( not ( = ?auto_885399 ?auto_885408 ) ) ( not ( = ?auto_885399 ?auto_885409 ) ) ( not ( = ?auto_885399 ?auto_885410 ) ) ( not ( = ?auto_885399 ?auto_885411 ) ) ( not ( = ?auto_885399 ?auto_885412 ) ) ( not ( = ?auto_885399 ?auto_885413 ) ) ( not ( = ?auto_885399 ?auto_885414 ) ) ( not ( = ?auto_885400 ?auto_885401 ) ) ( not ( = ?auto_885400 ?auto_885402 ) ) ( not ( = ?auto_885400 ?auto_885403 ) ) ( not ( = ?auto_885400 ?auto_885404 ) ) ( not ( = ?auto_885400 ?auto_885405 ) ) ( not ( = ?auto_885400 ?auto_885406 ) ) ( not ( = ?auto_885400 ?auto_885407 ) ) ( not ( = ?auto_885400 ?auto_885408 ) ) ( not ( = ?auto_885400 ?auto_885409 ) ) ( not ( = ?auto_885400 ?auto_885410 ) ) ( not ( = ?auto_885400 ?auto_885411 ) ) ( not ( = ?auto_885400 ?auto_885412 ) ) ( not ( = ?auto_885400 ?auto_885413 ) ) ( not ( = ?auto_885400 ?auto_885414 ) ) ( not ( = ?auto_885401 ?auto_885402 ) ) ( not ( = ?auto_885401 ?auto_885403 ) ) ( not ( = ?auto_885401 ?auto_885404 ) ) ( not ( = ?auto_885401 ?auto_885405 ) ) ( not ( = ?auto_885401 ?auto_885406 ) ) ( not ( = ?auto_885401 ?auto_885407 ) ) ( not ( = ?auto_885401 ?auto_885408 ) ) ( not ( = ?auto_885401 ?auto_885409 ) ) ( not ( = ?auto_885401 ?auto_885410 ) ) ( not ( = ?auto_885401 ?auto_885411 ) ) ( not ( = ?auto_885401 ?auto_885412 ) ) ( not ( = ?auto_885401 ?auto_885413 ) ) ( not ( = ?auto_885401 ?auto_885414 ) ) ( not ( = ?auto_885402 ?auto_885403 ) ) ( not ( = ?auto_885402 ?auto_885404 ) ) ( not ( = ?auto_885402 ?auto_885405 ) ) ( not ( = ?auto_885402 ?auto_885406 ) ) ( not ( = ?auto_885402 ?auto_885407 ) ) ( not ( = ?auto_885402 ?auto_885408 ) ) ( not ( = ?auto_885402 ?auto_885409 ) ) ( not ( = ?auto_885402 ?auto_885410 ) ) ( not ( = ?auto_885402 ?auto_885411 ) ) ( not ( = ?auto_885402 ?auto_885412 ) ) ( not ( = ?auto_885402 ?auto_885413 ) ) ( not ( = ?auto_885402 ?auto_885414 ) ) ( not ( = ?auto_885403 ?auto_885404 ) ) ( not ( = ?auto_885403 ?auto_885405 ) ) ( not ( = ?auto_885403 ?auto_885406 ) ) ( not ( = ?auto_885403 ?auto_885407 ) ) ( not ( = ?auto_885403 ?auto_885408 ) ) ( not ( = ?auto_885403 ?auto_885409 ) ) ( not ( = ?auto_885403 ?auto_885410 ) ) ( not ( = ?auto_885403 ?auto_885411 ) ) ( not ( = ?auto_885403 ?auto_885412 ) ) ( not ( = ?auto_885403 ?auto_885413 ) ) ( not ( = ?auto_885403 ?auto_885414 ) ) ( not ( = ?auto_885404 ?auto_885405 ) ) ( not ( = ?auto_885404 ?auto_885406 ) ) ( not ( = ?auto_885404 ?auto_885407 ) ) ( not ( = ?auto_885404 ?auto_885408 ) ) ( not ( = ?auto_885404 ?auto_885409 ) ) ( not ( = ?auto_885404 ?auto_885410 ) ) ( not ( = ?auto_885404 ?auto_885411 ) ) ( not ( = ?auto_885404 ?auto_885412 ) ) ( not ( = ?auto_885404 ?auto_885413 ) ) ( not ( = ?auto_885404 ?auto_885414 ) ) ( not ( = ?auto_885405 ?auto_885406 ) ) ( not ( = ?auto_885405 ?auto_885407 ) ) ( not ( = ?auto_885405 ?auto_885408 ) ) ( not ( = ?auto_885405 ?auto_885409 ) ) ( not ( = ?auto_885405 ?auto_885410 ) ) ( not ( = ?auto_885405 ?auto_885411 ) ) ( not ( = ?auto_885405 ?auto_885412 ) ) ( not ( = ?auto_885405 ?auto_885413 ) ) ( not ( = ?auto_885405 ?auto_885414 ) ) ( not ( = ?auto_885406 ?auto_885407 ) ) ( not ( = ?auto_885406 ?auto_885408 ) ) ( not ( = ?auto_885406 ?auto_885409 ) ) ( not ( = ?auto_885406 ?auto_885410 ) ) ( not ( = ?auto_885406 ?auto_885411 ) ) ( not ( = ?auto_885406 ?auto_885412 ) ) ( not ( = ?auto_885406 ?auto_885413 ) ) ( not ( = ?auto_885406 ?auto_885414 ) ) ( not ( = ?auto_885407 ?auto_885408 ) ) ( not ( = ?auto_885407 ?auto_885409 ) ) ( not ( = ?auto_885407 ?auto_885410 ) ) ( not ( = ?auto_885407 ?auto_885411 ) ) ( not ( = ?auto_885407 ?auto_885412 ) ) ( not ( = ?auto_885407 ?auto_885413 ) ) ( not ( = ?auto_885407 ?auto_885414 ) ) ( not ( = ?auto_885408 ?auto_885409 ) ) ( not ( = ?auto_885408 ?auto_885410 ) ) ( not ( = ?auto_885408 ?auto_885411 ) ) ( not ( = ?auto_885408 ?auto_885412 ) ) ( not ( = ?auto_885408 ?auto_885413 ) ) ( not ( = ?auto_885408 ?auto_885414 ) ) ( not ( = ?auto_885409 ?auto_885410 ) ) ( not ( = ?auto_885409 ?auto_885411 ) ) ( not ( = ?auto_885409 ?auto_885412 ) ) ( not ( = ?auto_885409 ?auto_885413 ) ) ( not ( = ?auto_885409 ?auto_885414 ) ) ( not ( = ?auto_885410 ?auto_885411 ) ) ( not ( = ?auto_885410 ?auto_885412 ) ) ( not ( = ?auto_885410 ?auto_885413 ) ) ( not ( = ?auto_885410 ?auto_885414 ) ) ( not ( = ?auto_885411 ?auto_885412 ) ) ( not ( = ?auto_885411 ?auto_885413 ) ) ( not ( = ?auto_885411 ?auto_885414 ) ) ( not ( = ?auto_885412 ?auto_885413 ) ) ( not ( = ?auto_885412 ?auto_885414 ) ) ( not ( = ?auto_885413 ?auto_885414 ) ) ( ON ?auto_885412 ?auto_885413 ) ( ON ?auto_885411 ?auto_885412 ) ( ON ?auto_885410 ?auto_885411 ) ( ON ?auto_885409 ?auto_885410 ) ( ON ?auto_885408 ?auto_885409 ) ( ON ?auto_885407 ?auto_885408 ) ( ON ?auto_885406 ?auto_885407 ) ( ON ?auto_885405 ?auto_885406 ) ( ON ?auto_885404 ?auto_885405 ) ( ON ?auto_885403 ?auto_885404 ) ( CLEAR ?auto_885401 ) ( ON ?auto_885402 ?auto_885403 ) ( CLEAR ?auto_885402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_885399 ?auto_885400 ?auto_885401 ?auto_885402 )
      ( MAKE-15PILE ?auto_885399 ?auto_885400 ?auto_885401 ?auto_885402 ?auto_885403 ?auto_885404 ?auto_885405 ?auto_885406 ?auto_885407 ?auto_885408 ?auto_885409 ?auto_885410 ?auto_885411 ?auto_885412 ?auto_885413 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_885461 - BLOCK
      ?auto_885462 - BLOCK
      ?auto_885463 - BLOCK
      ?auto_885464 - BLOCK
      ?auto_885465 - BLOCK
      ?auto_885466 - BLOCK
      ?auto_885467 - BLOCK
      ?auto_885468 - BLOCK
      ?auto_885469 - BLOCK
      ?auto_885470 - BLOCK
      ?auto_885471 - BLOCK
      ?auto_885472 - BLOCK
      ?auto_885473 - BLOCK
      ?auto_885474 - BLOCK
      ?auto_885475 - BLOCK
    )
    :vars
    (
      ?auto_885476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885475 ?auto_885476 ) ( ON-TABLE ?auto_885461 ) ( ON ?auto_885462 ?auto_885461 ) ( not ( = ?auto_885461 ?auto_885462 ) ) ( not ( = ?auto_885461 ?auto_885463 ) ) ( not ( = ?auto_885461 ?auto_885464 ) ) ( not ( = ?auto_885461 ?auto_885465 ) ) ( not ( = ?auto_885461 ?auto_885466 ) ) ( not ( = ?auto_885461 ?auto_885467 ) ) ( not ( = ?auto_885461 ?auto_885468 ) ) ( not ( = ?auto_885461 ?auto_885469 ) ) ( not ( = ?auto_885461 ?auto_885470 ) ) ( not ( = ?auto_885461 ?auto_885471 ) ) ( not ( = ?auto_885461 ?auto_885472 ) ) ( not ( = ?auto_885461 ?auto_885473 ) ) ( not ( = ?auto_885461 ?auto_885474 ) ) ( not ( = ?auto_885461 ?auto_885475 ) ) ( not ( = ?auto_885461 ?auto_885476 ) ) ( not ( = ?auto_885462 ?auto_885463 ) ) ( not ( = ?auto_885462 ?auto_885464 ) ) ( not ( = ?auto_885462 ?auto_885465 ) ) ( not ( = ?auto_885462 ?auto_885466 ) ) ( not ( = ?auto_885462 ?auto_885467 ) ) ( not ( = ?auto_885462 ?auto_885468 ) ) ( not ( = ?auto_885462 ?auto_885469 ) ) ( not ( = ?auto_885462 ?auto_885470 ) ) ( not ( = ?auto_885462 ?auto_885471 ) ) ( not ( = ?auto_885462 ?auto_885472 ) ) ( not ( = ?auto_885462 ?auto_885473 ) ) ( not ( = ?auto_885462 ?auto_885474 ) ) ( not ( = ?auto_885462 ?auto_885475 ) ) ( not ( = ?auto_885462 ?auto_885476 ) ) ( not ( = ?auto_885463 ?auto_885464 ) ) ( not ( = ?auto_885463 ?auto_885465 ) ) ( not ( = ?auto_885463 ?auto_885466 ) ) ( not ( = ?auto_885463 ?auto_885467 ) ) ( not ( = ?auto_885463 ?auto_885468 ) ) ( not ( = ?auto_885463 ?auto_885469 ) ) ( not ( = ?auto_885463 ?auto_885470 ) ) ( not ( = ?auto_885463 ?auto_885471 ) ) ( not ( = ?auto_885463 ?auto_885472 ) ) ( not ( = ?auto_885463 ?auto_885473 ) ) ( not ( = ?auto_885463 ?auto_885474 ) ) ( not ( = ?auto_885463 ?auto_885475 ) ) ( not ( = ?auto_885463 ?auto_885476 ) ) ( not ( = ?auto_885464 ?auto_885465 ) ) ( not ( = ?auto_885464 ?auto_885466 ) ) ( not ( = ?auto_885464 ?auto_885467 ) ) ( not ( = ?auto_885464 ?auto_885468 ) ) ( not ( = ?auto_885464 ?auto_885469 ) ) ( not ( = ?auto_885464 ?auto_885470 ) ) ( not ( = ?auto_885464 ?auto_885471 ) ) ( not ( = ?auto_885464 ?auto_885472 ) ) ( not ( = ?auto_885464 ?auto_885473 ) ) ( not ( = ?auto_885464 ?auto_885474 ) ) ( not ( = ?auto_885464 ?auto_885475 ) ) ( not ( = ?auto_885464 ?auto_885476 ) ) ( not ( = ?auto_885465 ?auto_885466 ) ) ( not ( = ?auto_885465 ?auto_885467 ) ) ( not ( = ?auto_885465 ?auto_885468 ) ) ( not ( = ?auto_885465 ?auto_885469 ) ) ( not ( = ?auto_885465 ?auto_885470 ) ) ( not ( = ?auto_885465 ?auto_885471 ) ) ( not ( = ?auto_885465 ?auto_885472 ) ) ( not ( = ?auto_885465 ?auto_885473 ) ) ( not ( = ?auto_885465 ?auto_885474 ) ) ( not ( = ?auto_885465 ?auto_885475 ) ) ( not ( = ?auto_885465 ?auto_885476 ) ) ( not ( = ?auto_885466 ?auto_885467 ) ) ( not ( = ?auto_885466 ?auto_885468 ) ) ( not ( = ?auto_885466 ?auto_885469 ) ) ( not ( = ?auto_885466 ?auto_885470 ) ) ( not ( = ?auto_885466 ?auto_885471 ) ) ( not ( = ?auto_885466 ?auto_885472 ) ) ( not ( = ?auto_885466 ?auto_885473 ) ) ( not ( = ?auto_885466 ?auto_885474 ) ) ( not ( = ?auto_885466 ?auto_885475 ) ) ( not ( = ?auto_885466 ?auto_885476 ) ) ( not ( = ?auto_885467 ?auto_885468 ) ) ( not ( = ?auto_885467 ?auto_885469 ) ) ( not ( = ?auto_885467 ?auto_885470 ) ) ( not ( = ?auto_885467 ?auto_885471 ) ) ( not ( = ?auto_885467 ?auto_885472 ) ) ( not ( = ?auto_885467 ?auto_885473 ) ) ( not ( = ?auto_885467 ?auto_885474 ) ) ( not ( = ?auto_885467 ?auto_885475 ) ) ( not ( = ?auto_885467 ?auto_885476 ) ) ( not ( = ?auto_885468 ?auto_885469 ) ) ( not ( = ?auto_885468 ?auto_885470 ) ) ( not ( = ?auto_885468 ?auto_885471 ) ) ( not ( = ?auto_885468 ?auto_885472 ) ) ( not ( = ?auto_885468 ?auto_885473 ) ) ( not ( = ?auto_885468 ?auto_885474 ) ) ( not ( = ?auto_885468 ?auto_885475 ) ) ( not ( = ?auto_885468 ?auto_885476 ) ) ( not ( = ?auto_885469 ?auto_885470 ) ) ( not ( = ?auto_885469 ?auto_885471 ) ) ( not ( = ?auto_885469 ?auto_885472 ) ) ( not ( = ?auto_885469 ?auto_885473 ) ) ( not ( = ?auto_885469 ?auto_885474 ) ) ( not ( = ?auto_885469 ?auto_885475 ) ) ( not ( = ?auto_885469 ?auto_885476 ) ) ( not ( = ?auto_885470 ?auto_885471 ) ) ( not ( = ?auto_885470 ?auto_885472 ) ) ( not ( = ?auto_885470 ?auto_885473 ) ) ( not ( = ?auto_885470 ?auto_885474 ) ) ( not ( = ?auto_885470 ?auto_885475 ) ) ( not ( = ?auto_885470 ?auto_885476 ) ) ( not ( = ?auto_885471 ?auto_885472 ) ) ( not ( = ?auto_885471 ?auto_885473 ) ) ( not ( = ?auto_885471 ?auto_885474 ) ) ( not ( = ?auto_885471 ?auto_885475 ) ) ( not ( = ?auto_885471 ?auto_885476 ) ) ( not ( = ?auto_885472 ?auto_885473 ) ) ( not ( = ?auto_885472 ?auto_885474 ) ) ( not ( = ?auto_885472 ?auto_885475 ) ) ( not ( = ?auto_885472 ?auto_885476 ) ) ( not ( = ?auto_885473 ?auto_885474 ) ) ( not ( = ?auto_885473 ?auto_885475 ) ) ( not ( = ?auto_885473 ?auto_885476 ) ) ( not ( = ?auto_885474 ?auto_885475 ) ) ( not ( = ?auto_885474 ?auto_885476 ) ) ( not ( = ?auto_885475 ?auto_885476 ) ) ( ON ?auto_885474 ?auto_885475 ) ( ON ?auto_885473 ?auto_885474 ) ( ON ?auto_885472 ?auto_885473 ) ( ON ?auto_885471 ?auto_885472 ) ( ON ?auto_885470 ?auto_885471 ) ( ON ?auto_885469 ?auto_885470 ) ( ON ?auto_885468 ?auto_885469 ) ( ON ?auto_885467 ?auto_885468 ) ( ON ?auto_885466 ?auto_885467 ) ( ON ?auto_885465 ?auto_885466 ) ( ON ?auto_885464 ?auto_885465 ) ( CLEAR ?auto_885462 ) ( ON ?auto_885463 ?auto_885464 ) ( CLEAR ?auto_885463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_885461 ?auto_885462 ?auto_885463 )
      ( MAKE-15PILE ?auto_885461 ?auto_885462 ?auto_885463 ?auto_885464 ?auto_885465 ?auto_885466 ?auto_885467 ?auto_885468 ?auto_885469 ?auto_885470 ?auto_885471 ?auto_885472 ?auto_885473 ?auto_885474 ?auto_885475 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_885523 - BLOCK
      ?auto_885524 - BLOCK
      ?auto_885525 - BLOCK
      ?auto_885526 - BLOCK
      ?auto_885527 - BLOCK
      ?auto_885528 - BLOCK
      ?auto_885529 - BLOCK
      ?auto_885530 - BLOCK
      ?auto_885531 - BLOCK
      ?auto_885532 - BLOCK
      ?auto_885533 - BLOCK
      ?auto_885534 - BLOCK
      ?auto_885535 - BLOCK
      ?auto_885536 - BLOCK
      ?auto_885537 - BLOCK
    )
    :vars
    (
      ?auto_885538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885537 ?auto_885538 ) ( ON-TABLE ?auto_885523 ) ( not ( = ?auto_885523 ?auto_885524 ) ) ( not ( = ?auto_885523 ?auto_885525 ) ) ( not ( = ?auto_885523 ?auto_885526 ) ) ( not ( = ?auto_885523 ?auto_885527 ) ) ( not ( = ?auto_885523 ?auto_885528 ) ) ( not ( = ?auto_885523 ?auto_885529 ) ) ( not ( = ?auto_885523 ?auto_885530 ) ) ( not ( = ?auto_885523 ?auto_885531 ) ) ( not ( = ?auto_885523 ?auto_885532 ) ) ( not ( = ?auto_885523 ?auto_885533 ) ) ( not ( = ?auto_885523 ?auto_885534 ) ) ( not ( = ?auto_885523 ?auto_885535 ) ) ( not ( = ?auto_885523 ?auto_885536 ) ) ( not ( = ?auto_885523 ?auto_885537 ) ) ( not ( = ?auto_885523 ?auto_885538 ) ) ( not ( = ?auto_885524 ?auto_885525 ) ) ( not ( = ?auto_885524 ?auto_885526 ) ) ( not ( = ?auto_885524 ?auto_885527 ) ) ( not ( = ?auto_885524 ?auto_885528 ) ) ( not ( = ?auto_885524 ?auto_885529 ) ) ( not ( = ?auto_885524 ?auto_885530 ) ) ( not ( = ?auto_885524 ?auto_885531 ) ) ( not ( = ?auto_885524 ?auto_885532 ) ) ( not ( = ?auto_885524 ?auto_885533 ) ) ( not ( = ?auto_885524 ?auto_885534 ) ) ( not ( = ?auto_885524 ?auto_885535 ) ) ( not ( = ?auto_885524 ?auto_885536 ) ) ( not ( = ?auto_885524 ?auto_885537 ) ) ( not ( = ?auto_885524 ?auto_885538 ) ) ( not ( = ?auto_885525 ?auto_885526 ) ) ( not ( = ?auto_885525 ?auto_885527 ) ) ( not ( = ?auto_885525 ?auto_885528 ) ) ( not ( = ?auto_885525 ?auto_885529 ) ) ( not ( = ?auto_885525 ?auto_885530 ) ) ( not ( = ?auto_885525 ?auto_885531 ) ) ( not ( = ?auto_885525 ?auto_885532 ) ) ( not ( = ?auto_885525 ?auto_885533 ) ) ( not ( = ?auto_885525 ?auto_885534 ) ) ( not ( = ?auto_885525 ?auto_885535 ) ) ( not ( = ?auto_885525 ?auto_885536 ) ) ( not ( = ?auto_885525 ?auto_885537 ) ) ( not ( = ?auto_885525 ?auto_885538 ) ) ( not ( = ?auto_885526 ?auto_885527 ) ) ( not ( = ?auto_885526 ?auto_885528 ) ) ( not ( = ?auto_885526 ?auto_885529 ) ) ( not ( = ?auto_885526 ?auto_885530 ) ) ( not ( = ?auto_885526 ?auto_885531 ) ) ( not ( = ?auto_885526 ?auto_885532 ) ) ( not ( = ?auto_885526 ?auto_885533 ) ) ( not ( = ?auto_885526 ?auto_885534 ) ) ( not ( = ?auto_885526 ?auto_885535 ) ) ( not ( = ?auto_885526 ?auto_885536 ) ) ( not ( = ?auto_885526 ?auto_885537 ) ) ( not ( = ?auto_885526 ?auto_885538 ) ) ( not ( = ?auto_885527 ?auto_885528 ) ) ( not ( = ?auto_885527 ?auto_885529 ) ) ( not ( = ?auto_885527 ?auto_885530 ) ) ( not ( = ?auto_885527 ?auto_885531 ) ) ( not ( = ?auto_885527 ?auto_885532 ) ) ( not ( = ?auto_885527 ?auto_885533 ) ) ( not ( = ?auto_885527 ?auto_885534 ) ) ( not ( = ?auto_885527 ?auto_885535 ) ) ( not ( = ?auto_885527 ?auto_885536 ) ) ( not ( = ?auto_885527 ?auto_885537 ) ) ( not ( = ?auto_885527 ?auto_885538 ) ) ( not ( = ?auto_885528 ?auto_885529 ) ) ( not ( = ?auto_885528 ?auto_885530 ) ) ( not ( = ?auto_885528 ?auto_885531 ) ) ( not ( = ?auto_885528 ?auto_885532 ) ) ( not ( = ?auto_885528 ?auto_885533 ) ) ( not ( = ?auto_885528 ?auto_885534 ) ) ( not ( = ?auto_885528 ?auto_885535 ) ) ( not ( = ?auto_885528 ?auto_885536 ) ) ( not ( = ?auto_885528 ?auto_885537 ) ) ( not ( = ?auto_885528 ?auto_885538 ) ) ( not ( = ?auto_885529 ?auto_885530 ) ) ( not ( = ?auto_885529 ?auto_885531 ) ) ( not ( = ?auto_885529 ?auto_885532 ) ) ( not ( = ?auto_885529 ?auto_885533 ) ) ( not ( = ?auto_885529 ?auto_885534 ) ) ( not ( = ?auto_885529 ?auto_885535 ) ) ( not ( = ?auto_885529 ?auto_885536 ) ) ( not ( = ?auto_885529 ?auto_885537 ) ) ( not ( = ?auto_885529 ?auto_885538 ) ) ( not ( = ?auto_885530 ?auto_885531 ) ) ( not ( = ?auto_885530 ?auto_885532 ) ) ( not ( = ?auto_885530 ?auto_885533 ) ) ( not ( = ?auto_885530 ?auto_885534 ) ) ( not ( = ?auto_885530 ?auto_885535 ) ) ( not ( = ?auto_885530 ?auto_885536 ) ) ( not ( = ?auto_885530 ?auto_885537 ) ) ( not ( = ?auto_885530 ?auto_885538 ) ) ( not ( = ?auto_885531 ?auto_885532 ) ) ( not ( = ?auto_885531 ?auto_885533 ) ) ( not ( = ?auto_885531 ?auto_885534 ) ) ( not ( = ?auto_885531 ?auto_885535 ) ) ( not ( = ?auto_885531 ?auto_885536 ) ) ( not ( = ?auto_885531 ?auto_885537 ) ) ( not ( = ?auto_885531 ?auto_885538 ) ) ( not ( = ?auto_885532 ?auto_885533 ) ) ( not ( = ?auto_885532 ?auto_885534 ) ) ( not ( = ?auto_885532 ?auto_885535 ) ) ( not ( = ?auto_885532 ?auto_885536 ) ) ( not ( = ?auto_885532 ?auto_885537 ) ) ( not ( = ?auto_885532 ?auto_885538 ) ) ( not ( = ?auto_885533 ?auto_885534 ) ) ( not ( = ?auto_885533 ?auto_885535 ) ) ( not ( = ?auto_885533 ?auto_885536 ) ) ( not ( = ?auto_885533 ?auto_885537 ) ) ( not ( = ?auto_885533 ?auto_885538 ) ) ( not ( = ?auto_885534 ?auto_885535 ) ) ( not ( = ?auto_885534 ?auto_885536 ) ) ( not ( = ?auto_885534 ?auto_885537 ) ) ( not ( = ?auto_885534 ?auto_885538 ) ) ( not ( = ?auto_885535 ?auto_885536 ) ) ( not ( = ?auto_885535 ?auto_885537 ) ) ( not ( = ?auto_885535 ?auto_885538 ) ) ( not ( = ?auto_885536 ?auto_885537 ) ) ( not ( = ?auto_885536 ?auto_885538 ) ) ( not ( = ?auto_885537 ?auto_885538 ) ) ( ON ?auto_885536 ?auto_885537 ) ( ON ?auto_885535 ?auto_885536 ) ( ON ?auto_885534 ?auto_885535 ) ( ON ?auto_885533 ?auto_885534 ) ( ON ?auto_885532 ?auto_885533 ) ( ON ?auto_885531 ?auto_885532 ) ( ON ?auto_885530 ?auto_885531 ) ( ON ?auto_885529 ?auto_885530 ) ( ON ?auto_885528 ?auto_885529 ) ( ON ?auto_885527 ?auto_885528 ) ( ON ?auto_885526 ?auto_885527 ) ( ON ?auto_885525 ?auto_885526 ) ( CLEAR ?auto_885523 ) ( ON ?auto_885524 ?auto_885525 ) ( CLEAR ?auto_885524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_885523 ?auto_885524 )
      ( MAKE-15PILE ?auto_885523 ?auto_885524 ?auto_885525 ?auto_885526 ?auto_885527 ?auto_885528 ?auto_885529 ?auto_885530 ?auto_885531 ?auto_885532 ?auto_885533 ?auto_885534 ?auto_885535 ?auto_885536 ?auto_885537 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_885585 - BLOCK
      ?auto_885586 - BLOCK
      ?auto_885587 - BLOCK
      ?auto_885588 - BLOCK
      ?auto_885589 - BLOCK
      ?auto_885590 - BLOCK
      ?auto_885591 - BLOCK
      ?auto_885592 - BLOCK
      ?auto_885593 - BLOCK
      ?auto_885594 - BLOCK
      ?auto_885595 - BLOCK
      ?auto_885596 - BLOCK
      ?auto_885597 - BLOCK
      ?auto_885598 - BLOCK
      ?auto_885599 - BLOCK
    )
    :vars
    (
      ?auto_885600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885599 ?auto_885600 ) ( not ( = ?auto_885585 ?auto_885586 ) ) ( not ( = ?auto_885585 ?auto_885587 ) ) ( not ( = ?auto_885585 ?auto_885588 ) ) ( not ( = ?auto_885585 ?auto_885589 ) ) ( not ( = ?auto_885585 ?auto_885590 ) ) ( not ( = ?auto_885585 ?auto_885591 ) ) ( not ( = ?auto_885585 ?auto_885592 ) ) ( not ( = ?auto_885585 ?auto_885593 ) ) ( not ( = ?auto_885585 ?auto_885594 ) ) ( not ( = ?auto_885585 ?auto_885595 ) ) ( not ( = ?auto_885585 ?auto_885596 ) ) ( not ( = ?auto_885585 ?auto_885597 ) ) ( not ( = ?auto_885585 ?auto_885598 ) ) ( not ( = ?auto_885585 ?auto_885599 ) ) ( not ( = ?auto_885585 ?auto_885600 ) ) ( not ( = ?auto_885586 ?auto_885587 ) ) ( not ( = ?auto_885586 ?auto_885588 ) ) ( not ( = ?auto_885586 ?auto_885589 ) ) ( not ( = ?auto_885586 ?auto_885590 ) ) ( not ( = ?auto_885586 ?auto_885591 ) ) ( not ( = ?auto_885586 ?auto_885592 ) ) ( not ( = ?auto_885586 ?auto_885593 ) ) ( not ( = ?auto_885586 ?auto_885594 ) ) ( not ( = ?auto_885586 ?auto_885595 ) ) ( not ( = ?auto_885586 ?auto_885596 ) ) ( not ( = ?auto_885586 ?auto_885597 ) ) ( not ( = ?auto_885586 ?auto_885598 ) ) ( not ( = ?auto_885586 ?auto_885599 ) ) ( not ( = ?auto_885586 ?auto_885600 ) ) ( not ( = ?auto_885587 ?auto_885588 ) ) ( not ( = ?auto_885587 ?auto_885589 ) ) ( not ( = ?auto_885587 ?auto_885590 ) ) ( not ( = ?auto_885587 ?auto_885591 ) ) ( not ( = ?auto_885587 ?auto_885592 ) ) ( not ( = ?auto_885587 ?auto_885593 ) ) ( not ( = ?auto_885587 ?auto_885594 ) ) ( not ( = ?auto_885587 ?auto_885595 ) ) ( not ( = ?auto_885587 ?auto_885596 ) ) ( not ( = ?auto_885587 ?auto_885597 ) ) ( not ( = ?auto_885587 ?auto_885598 ) ) ( not ( = ?auto_885587 ?auto_885599 ) ) ( not ( = ?auto_885587 ?auto_885600 ) ) ( not ( = ?auto_885588 ?auto_885589 ) ) ( not ( = ?auto_885588 ?auto_885590 ) ) ( not ( = ?auto_885588 ?auto_885591 ) ) ( not ( = ?auto_885588 ?auto_885592 ) ) ( not ( = ?auto_885588 ?auto_885593 ) ) ( not ( = ?auto_885588 ?auto_885594 ) ) ( not ( = ?auto_885588 ?auto_885595 ) ) ( not ( = ?auto_885588 ?auto_885596 ) ) ( not ( = ?auto_885588 ?auto_885597 ) ) ( not ( = ?auto_885588 ?auto_885598 ) ) ( not ( = ?auto_885588 ?auto_885599 ) ) ( not ( = ?auto_885588 ?auto_885600 ) ) ( not ( = ?auto_885589 ?auto_885590 ) ) ( not ( = ?auto_885589 ?auto_885591 ) ) ( not ( = ?auto_885589 ?auto_885592 ) ) ( not ( = ?auto_885589 ?auto_885593 ) ) ( not ( = ?auto_885589 ?auto_885594 ) ) ( not ( = ?auto_885589 ?auto_885595 ) ) ( not ( = ?auto_885589 ?auto_885596 ) ) ( not ( = ?auto_885589 ?auto_885597 ) ) ( not ( = ?auto_885589 ?auto_885598 ) ) ( not ( = ?auto_885589 ?auto_885599 ) ) ( not ( = ?auto_885589 ?auto_885600 ) ) ( not ( = ?auto_885590 ?auto_885591 ) ) ( not ( = ?auto_885590 ?auto_885592 ) ) ( not ( = ?auto_885590 ?auto_885593 ) ) ( not ( = ?auto_885590 ?auto_885594 ) ) ( not ( = ?auto_885590 ?auto_885595 ) ) ( not ( = ?auto_885590 ?auto_885596 ) ) ( not ( = ?auto_885590 ?auto_885597 ) ) ( not ( = ?auto_885590 ?auto_885598 ) ) ( not ( = ?auto_885590 ?auto_885599 ) ) ( not ( = ?auto_885590 ?auto_885600 ) ) ( not ( = ?auto_885591 ?auto_885592 ) ) ( not ( = ?auto_885591 ?auto_885593 ) ) ( not ( = ?auto_885591 ?auto_885594 ) ) ( not ( = ?auto_885591 ?auto_885595 ) ) ( not ( = ?auto_885591 ?auto_885596 ) ) ( not ( = ?auto_885591 ?auto_885597 ) ) ( not ( = ?auto_885591 ?auto_885598 ) ) ( not ( = ?auto_885591 ?auto_885599 ) ) ( not ( = ?auto_885591 ?auto_885600 ) ) ( not ( = ?auto_885592 ?auto_885593 ) ) ( not ( = ?auto_885592 ?auto_885594 ) ) ( not ( = ?auto_885592 ?auto_885595 ) ) ( not ( = ?auto_885592 ?auto_885596 ) ) ( not ( = ?auto_885592 ?auto_885597 ) ) ( not ( = ?auto_885592 ?auto_885598 ) ) ( not ( = ?auto_885592 ?auto_885599 ) ) ( not ( = ?auto_885592 ?auto_885600 ) ) ( not ( = ?auto_885593 ?auto_885594 ) ) ( not ( = ?auto_885593 ?auto_885595 ) ) ( not ( = ?auto_885593 ?auto_885596 ) ) ( not ( = ?auto_885593 ?auto_885597 ) ) ( not ( = ?auto_885593 ?auto_885598 ) ) ( not ( = ?auto_885593 ?auto_885599 ) ) ( not ( = ?auto_885593 ?auto_885600 ) ) ( not ( = ?auto_885594 ?auto_885595 ) ) ( not ( = ?auto_885594 ?auto_885596 ) ) ( not ( = ?auto_885594 ?auto_885597 ) ) ( not ( = ?auto_885594 ?auto_885598 ) ) ( not ( = ?auto_885594 ?auto_885599 ) ) ( not ( = ?auto_885594 ?auto_885600 ) ) ( not ( = ?auto_885595 ?auto_885596 ) ) ( not ( = ?auto_885595 ?auto_885597 ) ) ( not ( = ?auto_885595 ?auto_885598 ) ) ( not ( = ?auto_885595 ?auto_885599 ) ) ( not ( = ?auto_885595 ?auto_885600 ) ) ( not ( = ?auto_885596 ?auto_885597 ) ) ( not ( = ?auto_885596 ?auto_885598 ) ) ( not ( = ?auto_885596 ?auto_885599 ) ) ( not ( = ?auto_885596 ?auto_885600 ) ) ( not ( = ?auto_885597 ?auto_885598 ) ) ( not ( = ?auto_885597 ?auto_885599 ) ) ( not ( = ?auto_885597 ?auto_885600 ) ) ( not ( = ?auto_885598 ?auto_885599 ) ) ( not ( = ?auto_885598 ?auto_885600 ) ) ( not ( = ?auto_885599 ?auto_885600 ) ) ( ON ?auto_885598 ?auto_885599 ) ( ON ?auto_885597 ?auto_885598 ) ( ON ?auto_885596 ?auto_885597 ) ( ON ?auto_885595 ?auto_885596 ) ( ON ?auto_885594 ?auto_885595 ) ( ON ?auto_885593 ?auto_885594 ) ( ON ?auto_885592 ?auto_885593 ) ( ON ?auto_885591 ?auto_885592 ) ( ON ?auto_885590 ?auto_885591 ) ( ON ?auto_885589 ?auto_885590 ) ( ON ?auto_885588 ?auto_885589 ) ( ON ?auto_885587 ?auto_885588 ) ( ON ?auto_885586 ?auto_885587 ) ( ON ?auto_885585 ?auto_885586 ) ( CLEAR ?auto_885585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_885585 )
      ( MAKE-15PILE ?auto_885585 ?auto_885586 ?auto_885587 ?auto_885588 ?auto_885589 ?auto_885590 ?auto_885591 ?auto_885592 ?auto_885593 ?auto_885594 ?auto_885595 ?auto_885596 ?auto_885597 ?auto_885598 ?auto_885599 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_885648 - BLOCK
      ?auto_885649 - BLOCK
      ?auto_885650 - BLOCK
      ?auto_885651 - BLOCK
      ?auto_885652 - BLOCK
      ?auto_885653 - BLOCK
      ?auto_885654 - BLOCK
      ?auto_885655 - BLOCK
      ?auto_885656 - BLOCK
      ?auto_885657 - BLOCK
      ?auto_885658 - BLOCK
      ?auto_885659 - BLOCK
      ?auto_885660 - BLOCK
      ?auto_885661 - BLOCK
      ?auto_885662 - BLOCK
      ?auto_885663 - BLOCK
    )
    :vars
    (
      ?auto_885664 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_885662 ) ( ON ?auto_885663 ?auto_885664 ) ( CLEAR ?auto_885663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_885648 ) ( ON ?auto_885649 ?auto_885648 ) ( ON ?auto_885650 ?auto_885649 ) ( ON ?auto_885651 ?auto_885650 ) ( ON ?auto_885652 ?auto_885651 ) ( ON ?auto_885653 ?auto_885652 ) ( ON ?auto_885654 ?auto_885653 ) ( ON ?auto_885655 ?auto_885654 ) ( ON ?auto_885656 ?auto_885655 ) ( ON ?auto_885657 ?auto_885656 ) ( ON ?auto_885658 ?auto_885657 ) ( ON ?auto_885659 ?auto_885658 ) ( ON ?auto_885660 ?auto_885659 ) ( ON ?auto_885661 ?auto_885660 ) ( ON ?auto_885662 ?auto_885661 ) ( not ( = ?auto_885648 ?auto_885649 ) ) ( not ( = ?auto_885648 ?auto_885650 ) ) ( not ( = ?auto_885648 ?auto_885651 ) ) ( not ( = ?auto_885648 ?auto_885652 ) ) ( not ( = ?auto_885648 ?auto_885653 ) ) ( not ( = ?auto_885648 ?auto_885654 ) ) ( not ( = ?auto_885648 ?auto_885655 ) ) ( not ( = ?auto_885648 ?auto_885656 ) ) ( not ( = ?auto_885648 ?auto_885657 ) ) ( not ( = ?auto_885648 ?auto_885658 ) ) ( not ( = ?auto_885648 ?auto_885659 ) ) ( not ( = ?auto_885648 ?auto_885660 ) ) ( not ( = ?auto_885648 ?auto_885661 ) ) ( not ( = ?auto_885648 ?auto_885662 ) ) ( not ( = ?auto_885648 ?auto_885663 ) ) ( not ( = ?auto_885648 ?auto_885664 ) ) ( not ( = ?auto_885649 ?auto_885650 ) ) ( not ( = ?auto_885649 ?auto_885651 ) ) ( not ( = ?auto_885649 ?auto_885652 ) ) ( not ( = ?auto_885649 ?auto_885653 ) ) ( not ( = ?auto_885649 ?auto_885654 ) ) ( not ( = ?auto_885649 ?auto_885655 ) ) ( not ( = ?auto_885649 ?auto_885656 ) ) ( not ( = ?auto_885649 ?auto_885657 ) ) ( not ( = ?auto_885649 ?auto_885658 ) ) ( not ( = ?auto_885649 ?auto_885659 ) ) ( not ( = ?auto_885649 ?auto_885660 ) ) ( not ( = ?auto_885649 ?auto_885661 ) ) ( not ( = ?auto_885649 ?auto_885662 ) ) ( not ( = ?auto_885649 ?auto_885663 ) ) ( not ( = ?auto_885649 ?auto_885664 ) ) ( not ( = ?auto_885650 ?auto_885651 ) ) ( not ( = ?auto_885650 ?auto_885652 ) ) ( not ( = ?auto_885650 ?auto_885653 ) ) ( not ( = ?auto_885650 ?auto_885654 ) ) ( not ( = ?auto_885650 ?auto_885655 ) ) ( not ( = ?auto_885650 ?auto_885656 ) ) ( not ( = ?auto_885650 ?auto_885657 ) ) ( not ( = ?auto_885650 ?auto_885658 ) ) ( not ( = ?auto_885650 ?auto_885659 ) ) ( not ( = ?auto_885650 ?auto_885660 ) ) ( not ( = ?auto_885650 ?auto_885661 ) ) ( not ( = ?auto_885650 ?auto_885662 ) ) ( not ( = ?auto_885650 ?auto_885663 ) ) ( not ( = ?auto_885650 ?auto_885664 ) ) ( not ( = ?auto_885651 ?auto_885652 ) ) ( not ( = ?auto_885651 ?auto_885653 ) ) ( not ( = ?auto_885651 ?auto_885654 ) ) ( not ( = ?auto_885651 ?auto_885655 ) ) ( not ( = ?auto_885651 ?auto_885656 ) ) ( not ( = ?auto_885651 ?auto_885657 ) ) ( not ( = ?auto_885651 ?auto_885658 ) ) ( not ( = ?auto_885651 ?auto_885659 ) ) ( not ( = ?auto_885651 ?auto_885660 ) ) ( not ( = ?auto_885651 ?auto_885661 ) ) ( not ( = ?auto_885651 ?auto_885662 ) ) ( not ( = ?auto_885651 ?auto_885663 ) ) ( not ( = ?auto_885651 ?auto_885664 ) ) ( not ( = ?auto_885652 ?auto_885653 ) ) ( not ( = ?auto_885652 ?auto_885654 ) ) ( not ( = ?auto_885652 ?auto_885655 ) ) ( not ( = ?auto_885652 ?auto_885656 ) ) ( not ( = ?auto_885652 ?auto_885657 ) ) ( not ( = ?auto_885652 ?auto_885658 ) ) ( not ( = ?auto_885652 ?auto_885659 ) ) ( not ( = ?auto_885652 ?auto_885660 ) ) ( not ( = ?auto_885652 ?auto_885661 ) ) ( not ( = ?auto_885652 ?auto_885662 ) ) ( not ( = ?auto_885652 ?auto_885663 ) ) ( not ( = ?auto_885652 ?auto_885664 ) ) ( not ( = ?auto_885653 ?auto_885654 ) ) ( not ( = ?auto_885653 ?auto_885655 ) ) ( not ( = ?auto_885653 ?auto_885656 ) ) ( not ( = ?auto_885653 ?auto_885657 ) ) ( not ( = ?auto_885653 ?auto_885658 ) ) ( not ( = ?auto_885653 ?auto_885659 ) ) ( not ( = ?auto_885653 ?auto_885660 ) ) ( not ( = ?auto_885653 ?auto_885661 ) ) ( not ( = ?auto_885653 ?auto_885662 ) ) ( not ( = ?auto_885653 ?auto_885663 ) ) ( not ( = ?auto_885653 ?auto_885664 ) ) ( not ( = ?auto_885654 ?auto_885655 ) ) ( not ( = ?auto_885654 ?auto_885656 ) ) ( not ( = ?auto_885654 ?auto_885657 ) ) ( not ( = ?auto_885654 ?auto_885658 ) ) ( not ( = ?auto_885654 ?auto_885659 ) ) ( not ( = ?auto_885654 ?auto_885660 ) ) ( not ( = ?auto_885654 ?auto_885661 ) ) ( not ( = ?auto_885654 ?auto_885662 ) ) ( not ( = ?auto_885654 ?auto_885663 ) ) ( not ( = ?auto_885654 ?auto_885664 ) ) ( not ( = ?auto_885655 ?auto_885656 ) ) ( not ( = ?auto_885655 ?auto_885657 ) ) ( not ( = ?auto_885655 ?auto_885658 ) ) ( not ( = ?auto_885655 ?auto_885659 ) ) ( not ( = ?auto_885655 ?auto_885660 ) ) ( not ( = ?auto_885655 ?auto_885661 ) ) ( not ( = ?auto_885655 ?auto_885662 ) ) ( not ( = ?auto_885655 ?auto_885663 ) ) ( not ( = ?auto_885655 ?auto_885664 ) ) ( not ( = ?auto_885656 ?auto_885657 ) ) ( not ( = ?auto_885656 ?auto_885658 ) ) ( not ( = ?auto_885656 ?auto_885659 ) ) ( not ( = ?auto_885656 ?auto_885660 ) ) ( not ( = ?auto_885656 ?auto_885661 ) ) ( not ( = ?auto_885656 ?auto_885662 ) ) ( not ( = ?auto_885656 ?auto_885663 ) ) ( not ( = ?auto_885656 ?auto_885664 ) ) ( not ( = ?auto_885657 ?auto_885658 ) ) ( not ( = ?auto_885657 ?auto_885659 ) ) ( not ( = ?auto_885657 ?auto_885660 ) ) ( not ( = ?auto_885657 ?auto_885661 ) ) ( not ( = ?auto_885657 ?auto_885662 ) ) ( not ( = ?auto_885657 ?auto_885663 ) ) ( not ( = ?auto_885657 ?auto_885664 ) ) ( not ( = ?auto_885658 ?auto_885659 ) ) ( not ( = ?auto_885658 ?auto_885660 ) ) ( not ( = ?auto_885658 ?auto_885661 ) ) ( not ( = ?auto_885658 ?auto_885662 ) ) ( not ( = ?auto_885658 ?auto_885663 ) ) ( not ( = ?auto_885658 ?auto_885664 ) ) ( not ( = ?auto_885659 ?auto_885660 ) ) ( not ( = ?auto_885659 ?auto_885661 ) ) ( not ( = ?auto_885659 ?auto_885662 ) ) ( not ( = ?auto_885659 ?auto_885663 ) ) ( not ( = ?auto_885659 ?auto_885664 ) ) ( not ( = ?auto_885660 ?auto_885661 ) ) ( not ( = ?auto_885660 ?auto_885662 ) ) ( not ( = ?auto_885660 ?auto_885663 ) ) ( not ( = ?auto_885660 ?auto_885664 ) ) ( not ( = ?auto_885661 ?auto_885662 ) ) ( not ( = ?auto_885661 ?auto_885663 ) ) ( not ( = ?auto_885661 ?auto_885664 ) ) ( not ( = ?auto_885662 ?auto_885663 ) ) ( not ( = ?auto_885662 ?auto_885664 ) ) ( not ( = ?auto_885663 ?auto_885664 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_885663 ?auto_885664 )
      ( !STACK ?auto_885663 ?auto_885662 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_885714 - BLOCK
      ?auto_885715 - BLOCK
      ?auto_885716 - BLOCK
      ?auto_885717 - BLOCK
      ?auto_885718 - BLOCK
      ?auto_885719 - BLOCK
      ?auto_885720 - BLOCK
      ?auto_885721 - BLOCK
      ?auto_885722 - BLOCK
      ?auto_885723 - BLOCK
      ?auto_885724 - BLOCK
      ?auto_885725 - BLOCK
      ?auto_885726 - BLOCK
      ?auto_885727 - BLOCK
      ?auto_885728 - BLOCK
      ?auto_885729 - BLOCK
    )
    :vars
    (
      ?auto_885730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885729 ?auto_885730 ) ( ON-TABLE ?auto_885714 ) ( ON ?auto_885715 ?auto_885714 ) ( ON ?auto_885716 ?auto_885715 ) ( ON ?auto_885717 ?auto_885716 ) ( ON ?auto_885718 ?auto_885717 ) ( ON ?auto_885719 ?auto_885718 ) ( ON ?auto_885720 ?auto_885719 ) ( ON ?auto_885721 ?auto_885720 ) ( ON ?auto_885722 ?auto_885721 ) ( ON ?auto_885723 ?auto_885722 ) ( ON ?auto_885724 ?auto_885723 ) ( ON ?auto_885725 ?auto_885724 ) ( ON ?auto_885726 ?auto_885725 ) ( ON ?auto_885727 ?auto_885726 ) ( not ( = ?auto_885714 ?auto_885715 ) ) ( not ( = ?auto_885714 ?auto_885716 ) ) ( not ( = ?auto_885714 ?auto_885717 ) ) ( not ( = ?auto_885714 ?auto_885718 ) ) ( not ( = ?auto_885714 ?auto_885719 ) ) ( not ( = ?auto_885714 ?auto_885720 ) ) ( not ( = ?auto_885714 ?auto_885721 ) ) ( not ( = ?auto_885714 ?auto_885722 ) ) ( not ( = ?auto_885714 ?auto_885723 ) ) ( not ( = ?auto_885714 ?auto_885724 ) ) ( not ( = ?auto_885714 ?auto_885725 ) ) ( not ( = ?auto_885714 ?auto_885726 ) ) ( not ( = ?auto_885714 ?auto_885727 ) ) ( not ( = ?auto_885714 ?auto_885728 ) ) ( not ( = ?auto_885714 ?auto_885729 ) ) ( not ( = ?auto_885714 ?auto_885730 ) ) ( not ( = ?auto_885715 ?auto_885716 ) ) ( not ( = ?auto_885715 ?auto_885717 ) ) ( not ( = ?auto_885715 ?auto_885718 ) ) ( not ( = ?auto_885715 ?auto_885719 ) ) ( not ( = ?auto_885715 ?auto_885720 ) ) ( not ( = ?auto_885715 ?auto_885721 ) ) ( not ( = ?auto_885715 ?auto_885722 ) ) ( not ( = ?auto_885715 ?auto_885723 ) ) ( not ( = ?auto_885715 ?auto_885724 ) ) ( not ( = ?auto_885715 ?auto_885725 ) ) ( not ( = ?auto_885715 ?auto_885726 ) ) ( not ( = ?auto_885715 ?auto_885727 ) ) ( not ( = ?auto_885715 ?auto_885728 ) ) ( not ( = ?auto_885715 ?auto_885729 ) ) ( not ( = ?auto_885715 ?auto_885730 ) ) ( not ( = ?auto_885716 ?auto_885717 ) ) ( not ( = ?auto_885716 ?auto_885718 ) ) ( not ( = ?auto_885716 ?auto_885719 ) ) ( not ( = ?auto_885716 ?auto_885720 ) ) ( not ( = ?auto_885716 ?auto_885721 ) ) ( not ( = ?auto_885716 ?auto_885722 ) ) ( not ( = ?auto_885716 ?auto_885723 ) ) ( not ( = ?auto_885716 ?auto_885724 ) ) ( not ( = ?auto_885716 ?auto_885725 ) ) ( not ( = ?auto_885716 ?auto_885726 ) ) ( not ( = ?auto_885716 ?auto_885727 ) ) ( not ( = ?auto_885716 ?auto_885728 ) ) ( not ( = ?auto_885716 ?auto_885729 ) ) ( not ( = ?auto_885716 ?auto_885730 ) ) ( not ( = ?auto_885717 ?auto_885718 ) ) ( not ( = ?auto_885717 ?auto_885719 ) ) ( not ( = ?auto_885717 ?auto_885720 ) ) ( not ( = ?auto_885717 ?auto_885721 ) ) ( not ( = ?auto_885717 ?auto_885722 ) ) ( not ( = ?auto_885717 ?auto_885723 ) ) ( not ( = ?auto_885717 ?auto_885724 ) ) ( not ( = ?auto_885717 ?auto_885725 ) ) ( not ( = ?auto_885717 ?auto_885726 ) ) ( not ( = ?auto_885717 ?auto_885727 ) ) ( not ( = ?auto_885717 ?auto_885728 ) ) ( not ( = ?auto_885717 ?auto_885729 ) ) ( not ( = ?auto_885717 ?auto_885730 ) ) ( not ( = ?auto_885718 ?auto_885719 ) ) ( not ( = ?auto_885718 ?auto_885720 ) ) ( not ( = ?auto_885718 ?auto_885721 ) ) ( not ( = ?auto_885718 ?auto_885722 ) ) ( not ( = ?auto_885718 ?auto_885723 ) ) ( not ( = ?auto_885718 ?auto_885724 ) ) ( not ( = ?auto_885718 ?auto_885725 ) ) ( not ( = ?auto_885718 ?auto_885726 ) ) ( not ( = ?auto_885718 ?auto_885727 ) ) ( not ( = ?auto_885718 ?auto_885728 ) ) ( not ( = ?auto_885718 ?auto_885729 ) ) ( not ( = ?auto_885718 ?auto_885730 ) ) ( not ( = ?auto_885719 ?auto_885720 ) ) ( not ( = ?auto_885719 ?auto_885721 ) ) ( not ( = ?auto_885719 ?auto_885722 ) ) ( not ( = ?auto_885719 ?auto_885723 ) ) ( not ( = ?auto_885719 ?auto_885724 ) ) ( not ( = ?auto_885719 ?auto_885725 ) ) ( not ( = ?auto_885719 ?auto_885726 ) ) ( not ( = ?auto_885719 ?auto_885727 ) ) ( not ( = ?auto_885719 ?auto_885728 ) ) ( not ( = ?auto_885719 ?auto_885729 ) ) ( not ( = ?auto_885719 ?auto_885730 ) ) ( not ( = ?auto_885720 ?auto_885721 ) ) ( not ( = ?auto_885720 ?auto_885722 ) ) ( not ( = ?auto_885720 ?auto_885723 ) ) ( not ( = ?auto_885720 ?auto_885724 ) ) ( not ( = ?auto_885720 ?auto_885725 ) ) ( not ( = ?auto_885720 ?auto_885726 ) ) ( not ( = ?auto_885720 ?auto_885727 ) ) ( not ( = ?auto_885720 ?auto_885728 ) ) ( not ( = ?auto_885720 ?auto_885729 ) ) ( not ( = ?auto_885720 ?auto_885730 ) ) ( not ( = ?auto_885721 ?auto_885722 ) ) ( not ( = ?auto_885721 ?auto_885723 ) ) ( not ( = ?auto_885721 ?auto_885724 ) ) ( not ( = ?auto_885721 ?auto_885725 ) ) ( not ( = ?auto_885721 ?auto_885726 ) ) ( not ( = ?auto_885721 ?auto_885727 ) ) ( not ( = ?auto_885721 ?auto_885728 ) ) ( not ( = ?auto_885721 ?auto_885729 ) ) ( not ( = ?auto_885721 ?auto_885730 ) ) ( not ( = ?auto_885722 ?auto_885723 ) ) ( not ( = ?auto_885722 ?auto_885724 ) ) ( not ( = ?auto_885722 ?auto_885725 ) ) ( not ( = ?auto_885722 ?auto_885726 ) ) ( not ( = ?auto_885722 ?auto_885727 ) ) ( not ( = ?auto_885722 ?auto_885728 ) ) ( not ( = ?auto_885722 ?auto_885729 ) ) ( not ( = ?auto_885722 ?auto_885730 ) ) ( not ( = ?auto_885723 ?auto_885724 ) ) ( not ( = ?auto_885723 ?auto_885725 ) ) ( not ( = ?auto_885723 ?auto_885726 ) ) ( not ( = ?auto_885723 ?auto_885727 ) ) ( not ( = ?auto_885723 ?auto_885728 ) ) ( not ( = ?auto_885723 ?auto_885729 ) ) ( not ( = ?auto_885723 ?auto_885730 ) ) ( not ( = ?auto_885724 ?auto_885725 ) ) ( not ( = ?auto_885724 ?auto_885726 ) ) ( not ( = ?auto_885724 ?auto_885727 ) ) ( not ( = ?auto_885724 ?auto_885728 ) ) ( not ( = ?auto_885724 ?auto_885729 ) ) ( not ( = ?auto_885724 ?auto_885730 ) ) ( not ( = ?auto_885725 ?auto_885726 ) ) ( not ( = ?auto_885725 ?auto_885727 ) ) ( not ( = ?auto_885725 ?auto_885728 ) ) ( not ( = ?auto_885725 ?auto_885729 ) ) ( not ( = ?auto_885725 ?auto_885730 ) ) ( not ( = ?auto_885726 ?auto_885727 ) ) ( not ( = ?auto_885726 ?auto_885728 ) ) ( not ( = ?auto_885726 ?auto_885729 ) ) ( not ( = ?auto_885726 ?auto_885730 ) ) ( not ( = ?auto_885727 ?auto_885728 ) ) ( not ( = ?auto_885727 ?auto_885729 ) ) ( not ( = ?auto_885727 ?auto_885730 ) ) ( not ( = ?auto_885728 ?auto_885729 ) ) ( not ( = ?auto_885728 ?auto_885730 ) ) ( not ( = ?auto_885729 ?auto_885730 ) ) ( CLEAR ?auto_885727 ) ( ON ?auto_885728 ?auto_885729 ) ( CLEAR ?auto_885728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_885714 ?auto_885715 ?auto_885716 ?auto_885717 ?auto_885718 ?auto_885719 ?auto_885720 ?auto_885721 ?auto_885722 ?auto_885723 ?auto_885724 ?auto_885725 ?auto_885726 ?auto_885727 ?auto_885728 )
      ( MAKE-16PILE ?auto_885714 ?auto_885715 ?auto_885716 ?auto_885717 ?auto_885718 ?auto_885719 ?auto_885720 ?auto_885721 ?auto_885722 ?auto_885723 ?auto_885724 ?auto_885725 ?auto_885726 ?auto_885727 ?auto_885728 ?auto_885729 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_885780 - BLOCK
      ?auto_885781 - BLOCK
      ?auto_885782 - BLOCK
      ?auto_885783 - BLOCK
      ?auto_885784 - BLOCK
      ?auto_885785 - BLOCK
      ?auto_885786 - BLOCK
      ?auto_885787 - BLOCK
      ?auto_885788 - BLOCK
      ?auto_885789 - BLOCK
      ?auto_885790 - BLOCK
      ?auto_885791 - BLOCK
      ?auto_885792 - BLOCK
      ?auto_885793 - BLOCK
      ?auto_885794 - BLOCK
      ?auto_885795 - BLOCK
    )
    :vars
    (
      ?auto_885796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885795 ?auto_885796 ) ( ON-TABLE ?auto_885780 ) ( ON ?auto_885781 ?auto_885780 ) ( ON ?auto_885782 ?auto_885781 ) ( ON ?auto_885783 ?auto_885782 ) ( ON ?auto_885784 ?auto_885783 ) ( ON ?auto_885785 ?auto_885784 ) ( ON ?auto_885786 ?auto_885785 ) ( ON ?auto_885787 ?auto_885786 ) ( ON ?auto_885788 ?auto_885787 ) ( ON ?auto_885789 ?auto_885788 ) ( ON ?auto_885790 ?auto_885789 ) ( ON ?auto_885791 ?auto_885790 ) ( ON ?auto_885792 ?auto_885791 ) ( not ( = ?auto_885780 ?auto_885781 ) ) ( not ( = ?auto_885780 ?auto_885782 ) ) ( not ( = ?auto_885780 ?auto_885783 ) ) ( not ( = ?auto_885780 ?auto_885784 ) ) ( not ( = ?auto_885780 ?auto_885785 ) ) ( not ( = ?auto_885780 ?auto_885786 ) ) ( not ( = ?auto_885780 ?auto_885787 ) ) ( not ( = ?auto_885780 ?auto_885788 ) ) ( not ( = ?auto_885780 ?auto_885789 ) ) ( not ( = ?auto_885780 ?auto_885790 ) ) ( not ( = ?auto_885780 ?auto_885791 ) ) ( not ( = ?auto_885780 ?auto_885792 ) ) ( not ( = ?auto_885780 ?auto_885793 ) ) ( not ( = ?auto_885780 ?auto_885794 ) ) ( not ( = ?auto_885780 ?auto_885795 ) ) ( not ( = ?auto_885780 ?auto_885796 ) ) ( not ( = ?auto_885781 ?auto_885782 ) ) ( not ( = ?auto_885781 ?auto_885783 ) ) ( not ( = ?auto_885781 ?auto_885784 ) ) ( not ( = ?auto_885781 ?auto_885785 ) ) ( not ( = ?auto_885781 ?auto_885786 ) ) ( not ( = ?auto_885781 ?auto_885787 ) ) ( not ( = ?auto_885781 ?auto_885788 ) ) ( not ( = ?auto_885781 ?auto_885789 ) ) ( not ( = ?auto_885781 ?auto_885790 ) ) ( not ( = ?auto_885781 ?auto_885791 ) ) ( not ( = ?auto_885781 ?auto_885792 ) ) ( not ( = ?auto_885781 ?auto_885793 ) ) ( not ( = ?auto_885781 ?auto_885794 ) ) ( not ( = ?auto_885781 ?auto_885795 ) ) ( not ( = ?auto_885781 ?auto_885796 ) ) ( not ( = ?auto_885782 ?auto_885783 ) ) ( not ( = ?auto_885782 ?auto_885784 ) ) ( not ( = ?auto_885782 ?auto_885785 ) ) ( not ( = ?auto_885782 ?auto_885786 ) ) ( not ( = ?auto_885782 ?auto_885787 ) ) ( not ( = ?auto_885782 ?auto_885788 ) ) ( not ( = ?auto_885782 ?auto_885789 ) ) ( not ( = ?auto_885782 ?auto_885790 ) ) ( not ( = ?auto_885782 ?auto_885791 ) ) ( not ( = ?auto_885782 ?auto_885792 ) ) ( not ( = ?auto_885782 ?auto_885793 ) ) ( not ( = ?auto_885782 ?auto_885794 ) ) ( not ( = ?auto_885782 ?auto_885795 ) ) ( not ( = ?auto_885782 ?auto_885796 ) ) ( not ( = ?auto_885783 ?auto_885784 ) ) ( not ( = ?auto_885783 ?auto_885785 ) ) ( not ( = ?auto_885783 ?auto_885786 ) ) ( not ( = ?auto_885783 ?auto_885787 ) ) ( not ( = ?auto_885783 ?auto_885788 ) ) ( not ( = ?auto_885783 ?auto_885789 ) ) ( not ( = ?auto_885783 ?auto_885790 ) ) ( not ( = ?auto_885783 ?auto_885791 ) ) ( not ( = ?auto_885783 ?auto_885792 ) ) ( not ( = ?auto_885783 ?auto_885793 ) ) ( not ( = ?auto_885783 ?auto_885794 ) ) ( not ( = ?auto_885783 ?auto_885795 ) ) ( not ( = ?auto_885783 ?auto_885796 ) ) ( not ( = ?auto_885784 ?auto_885785 ) ) ( not ( = ?auto_885784 ?auto_885786 ) ) ( not ( = ?auto_885784 ?auto_885787 ) ) ( not ( = ?auto_885784 ?auto_885788 ) ) ( not ( = ?auto_885784 ?auto_885789 ) ) ( not ( = ?auto_885784 ?auto_885790 ) ) ( not ( = ?auto_885784 ?auto_885791 ) ) ( not ( = ?auto_885784 ?auto_885792 ) ) ( not ( = ?auto_885784 ?auto_885793 ) ) ( not ( = ?auto_885784 ?auto_885794 ) ) ( not ( = ?auto_885784 ?auto_885795 ) ) ( not ( = ?auto_885784 ?auto_885796 ) ) ( not ( = ?auto_885785 ?auto_885786 ) ) ( not ( = ?auto_885785 ?auto_885787 ) ) ( not ( = ?auto_885785 ?auto_885788 ) ) ( not ( = ?auto_885785 ?auto_885789 ) ) ( not ( = ?auto_885785 ?auto_885790 ) ) ( not ( = ?auto_885785 ?auto_885791 ) ) ( not ( = ?auto_885785 ?auto_885792 ) ) ( not ( = ?auto_885785 ?auto_885793 ) ) ( not ( = ?auto_885785 ?auto_885794 ) ) ( not ( = ?auto_885785 ?auto_885795 ) ) ( not ( = ?auto_885785 ?auto_885796 ) ) ( not ( = ?auto_885786 ?auto_885787 ) ) ( not ( = ?auto_885786 ?auto_885788 ) ) ( not ( = ?auto_885786 ?auto_885789 ) ) ( not ( = ?auto_885786 ?auto_885790 ) ) ( not ( = ?auto_885786 ?auto_885791 ) ) ( not ( = ?auto_885786 ?auto_885792 ) ) ( not ( = ?auto_885786 ?auto_885793 ) ) ( not ( = ?auto_885786 ?auto_885794 ) ) ( not ( = ?auto_885786 ?auto_885795 ) ) ( not ( = ?auto_885786 ?auto_885796 ) ) ( not ( = ?auto_885787 ?auto_885788 ) ) ( not ( = ?auto_885787 ?auto_885789 ) ) ( not ( = ?auto_885787 ?auto_885790 ) ) ( not ( = ?auto_885787 ?auto_885791 ) ) ( not ( = ?auto_885787 ?auto_885792 ) ) ( not ( = ?auto_885787 ?auto_885793 ) ) ( not ( = ?auto_885787 ?auto_885794 ) ) ( not ( = ?auto_885787 ?auto_885795 ) ) ( not ( = ?auto_885787 ?auto_885796 ) ) ( not ( = ?auto_885788 ?auto_885789 ) ) ( not ( = ?auto_885788 ?auto_885790 ) ) ( not ( = ?auto_885788 ?auto_885791 ) ) ( not ( = ?auto_885788 ?auto_885792 ) ) ( not ( = ?auto_885788 ?auto_885793 ) ) ( not ( = ?auto_885788 ?auto_885794 ) ) ( not ( = ?auto_885788 ?auto_885795 ) ) ( not ( = ?auto_885788 ?auto_885796 ) ) ( not ( = ?auto_885789 ?auto_885790 ) ) ( not ( = ?auto_885789 ?auto_885791 ) ) ( not ( = ?auto_885789 ?auto_885792 ) ) ( not ( = ?auto_885789 ?auto_885793 ) ) ( not ( = ?auto_885789 ?auto_885794 ) ) ( not ( = ?auto_885789 ?auto_885795 ) ) ( not ( = ?auto_885789 ?auto_885796 ) ) ( not ( = ?auto_885790 ?auto_885791 ) ) ( not ( = ?auto_885790 ?auto_885792 ) ) ( not ( = ?auto_885790 ?auto_885793 ) ) ( not ( = ?auto_885790 ?auto_885794 ) ) ( not ( = ?auto_885790 ?auto_885795 ) ) ( not ( = ?auto_885790 ?auto_885796 ) ) ( not ( = ?auto_885791 ?auto_885792 ) ) ( not ( = ?auto_885791 ?auto_885793 ) ) ( not ( = ?auto_885791 ?auto_885794 ) ) ( not ( = ?auto_885791 ?auto_885795 ) ) ( not ( = ?auto_885791 ?auto_885796 ) ) ( not ( = ?auto_885792 ?auto_885793 ) ) ( not ( = ?auto_885792 ?auto_885794 ) ) ( not ( = ?auto_885792 ?auto_885795 ) ) ( not ( = ?auto_885792 ?auto_885796 ) ) ( not ( = ?auto_885793 ?auto_885794 ) ) ( not ( = ?auto_885793 ?auto_885795 ) ) ( not ( = ?auto_885793 ?auto_885796 ) ) ( not ( = ?auto_885794 ?auto_885795 ) ) ( not ( = ?auto_885794 ?auto_885796 ) ) ( not ( = ?auto_885795 ?auto_885796 ) ) ( ON ?auto_885794 ?auto_885795 ) ( CLEAR ?auto_885792 ) ( ON ?auto_885793 ?auto_885794 ) ( CLEAR ?auto_885793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_885780 ?auto_885781 ?auto_885782 ?auto_885783 ?auto_885784 ?auto_885785 ?auto_885786 ?auto_885787 ?auto_885788 ?auto_885789 ?auto_885790 ?auto_885791 ?auto_885792 ?auto_885793 )
      ( MAKE-16PILE ?auto_885780 ?auto_885781 ?auto_885782 ?auto_885783 ?auto_885784 ?auto_885785 ?auto_885786 ?auto_885787 ?auto_885788 ?auto_885789 ?auto_885790 ?auto_885791 ?auto_885792 ?auto_885793 ?auto_885794 ?auto_885795 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_885846 - BLOCK
      ?auto_885847 - BLOCK
      ?auto_885848 - BLOCK
      ?auto_885849 - BLOCK
      ?auto_885850 - BLOCK
      ?auto_885851 - BLOCK
      ?auto_885852 - BLOCK
      ?auto_885853 - BLOCK
      ?auto_885854 - BLOCK
      ?auto_885855 - BLOCK
      ?auto_885856 - BLOCK
      ?auto_885857 - BLOCK
      ?auto_885858 - BLOCK
      ?auto_885859 - BLOCK
      ?auto_885860 - BLOCK
      ?auto_885861 - BLOCK
    )
    :vars
    (
      ?auto_885862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885861 ?auto_885862 ) ( ON-TABLE ?auto_885846 ) ( ON ?auto_885847 ?auto_885846 ) ( ON ?auto_885848 ?auto_885847 ) ( ON ?auto_885849 ?auto_885848 ) ( ON ?auto_885850 ?auto_885849 ) ( ON ?auto_885851 ?auto_885850 ) ( ON ?auto_885852 ?auto_885851 ) ( ON ?auto_885853 ?auto_885852 ) ( ON ?auto_885854 ?auto_885853 ) ( ON ?auto_885855 ?auto_885854 ) ( ON ?auto_885856 ?auto_885855 ) ( ON ?auto_885857 ?auto_885856 ) ( not ( = ?auto_885846 ?auto_885847 ) ) ( not ( = ?auto_885846 ?auto_885848 ) ) ( not ( = ?auto_885846 ?auto_885849 ) ) ( not ( = ?auto_885846 ?auto_885850 ) ) ( not ( = ?auto_885846 ?auto_885851 ) ) ( not ( = ?auto_885846 ?auto_885852 ) ) ( not ( = ?auto_885846 ?auto_885853 ) ) ( not ( = ?auto_885846 ?auto_885854 ) ) ( not ( = ?auto_885846 ?auto_885855 ) ) ( not ( = ?auto_885846 ?auto_885856 ) ) ( not ( = ?auto_885846 ?auto_885857 ) ) ( not ( = ?auto_885846 ?auto_885858 ) ) ( not ( = ?auto_885846 ?auto_885859 ) ) ( not ( = ?auto_885846 ?auto_885860 ) ) ( not ( = ?auto_885846 ?auto_885861 ) ) ( not ( = ?auto_885846 ?auto_885862 ) ) ( not ( = ?auto_885847 ?auto_885848 ) ) ( not ( = ?auto_885847 ?auto_885849 ) ) ( not ( = ?auto_885847 ?auto_885850 ) ) ( not ( = ?auto_885847 ?auto_885851 ) ) ( not ( = ?auto_885847 ?auto_885852 ) ) ( not ( = ?auto_885847 ?auto_885853 ) ) ( not ( = ?auto_885847 ?auto_885854 ) ) ( not ( = ?auto_885847 ?auto_885855 ) ) ( not ( = ?auto_885847 ?auto_885856 ) ) ( not ( = ?auto_885847 ?auto_885857 ) ) ( not ( = ?auto_885847 ?auto_885858 ) ) ( not ( = ?auto_885847 ?auto_885859 ) ) ( not ( = ?auto_885847 ?auto_885860 ) ) ( not ( = ?auto_885847 ?auto_885861 ) ) ( not ( = ?auto_885847 ?auto_885862 ) ) ( not ( = ?auto_885848 ?auto_885849 ) ) ( not ( = ?auto_885848 ?auto_885850 ) ) ( not ( = ?auto_885848 ?auto_885851 ) ) ( not ( = ?auto_885848 ?auto_885852 ) ) ( not ( = ?auto_885848 ?auto_885853 ) ) ( not ( = ?auto_885848 ?auto_885854 ) ) ( not ( = ?auto_885848 ?auto_885855 ) ) ( not ( = ?auto_885848 ?auto_885856 ) ) ( not ( = ?auto_885848 ?auto_885857 ) ) ( not ( = ?auto_885848 ?auto_885858 ) ) ( not ( = ?auto_885848 ?auto_885859 ) ) ( not ( = ?auto_885848 ?auto_885860 ) ) ( not ( = ?auto_885848 ?auto_885861 ) ) ( not ( = ?auto_885848 ?auto_885862 ) ) ( not ( = ?auto_885849 ?auto_885850 ) ) ( not ( = ?auto_885849 ?auto_885851 ) ) ( not ( = ?auto_885849 ?auto_885852 ) ) ( not ( = ?auto_885849 ?auto_885853 ) ) ( not ( = ?auto_885849 ?auto_885854 ) ) ( not ( = ?auto_885849 ?auto_885855 ) ) ( not ( = ?auto_885849 ?auto_885856 ) ) ( not ( = ?auto_885849 ?auto_885857 ) ) ( not ( = ?auto_885849 ?auto_885858 ) ) ( not ( = ?auto_885849 ?auto_885859 ) ) ( not ( = ?auto_885849 ?auto_885860 ) ) ( not ( = ?auto_885849 ?auto_885861 ) ) ( not ( = ?auto_885849 ?auto_885862 ) ) ( not ( = ?auto_885850 ?auto_885851 ) ) ( not ( = ?auto_885850 ?auto_885852 ) ) ( not ( = ?auto_885850 ?auto_885853 ) ) ( not ( = ?auto_885850 ?auto_885854 ) ) ( not ( = ?auto_885850 ?auto_885855 ) ) ( not ( = ?auto_885850 ?auto_885856 ) ) ( not ( = ?auto_885850 ?auto_885857 ) ) ( not ( = ?auto_885850 ?auto_885858 ) ) ( not ( = ?auto_885850 ?auto_885859 ) ) ( not ( = ?auto_885850 ?auto_885860 ) ) ( not ( = ?auto_885850 ?auto_885861 ) ) ( not ( = ?auto_885850 ?auto_885862 ) ) ( not ( = ?auto_885851 ?auto_885852 ) ) ( not ( = ?auto_885851 ?auto_885853 ) ) ( not ( = ?auto_885851 ?auto_885854 ) ) ( not ( = ?auto_885851 ?auto_885855 ) ) ( not ( = ?auto_885851 ?auto_885856 ) ) ( not ( = ?auto_885851 ?auto_885857 ) ) ( not ( = ?auto_885851 ?auto_885858 ) ) ( not ( = ?auto_885851 ?auto_885859 ) ) ( not ( = ?auto_885851 ?auto_885860 ) ) ( not ( = ?auto_885851 ?auto_885861 ) ) ( not ( = ?auto_885851 ?auto_885862 ) ) ( not ( = ?auto_885852 ?auto_885853 ) ) ( not ( = ?auto_885852 ?auto_885854 ) ) ( not ( = ?auto_885852 ?auto_885855 ) ) ( not ( = ?auto_885852 ?auto_885856 ) ) ( not ( = ?auto_885852 ?auto_885857 ) ) ( not ( = ?auto_885852 ?auto_885858 ) ) ( not ( = ?auto_885852 ?auto_885859 ) ) ( not ( = ?auto_885852 ?auto_885860 ) ) ( not ( = ?auto_885852 ?auto_885861 ) ) ( not ( = ?auto_885852 ?auto_885862 ) ) ( not ( = ?auto_885853 ?auto_885854 ) ) ( not ( = ?auto_885853 ?auto_885855 ) ) ( not ( = ?auto_885853 ?auto_885856 ) ) ( not ( = ?auto_885853 ?auto_885857 ) ) ( not ( = ?auto_885853 ?auto_885858 ) ) ( not ( = ?auto_885853 ?auto_885859 ) ) ( not ( = ?auto_885853 ?auto_885860 ) ) ( not ( = ?auto_885853 ?auto_885861 ) ) ( not ( = ?auto_885853 ?auto_885862 ) ) ( not ( = ?auto_885854 ?auto_885855 ) ) ( not ( = ?auto_885854 ?auto_885856 ) ) ( not ( = ?auto_885854 ?auto_885857 ) ) ( not ( = ?auto_885854 ?auto_885858 ) ) ( not ( = ?auto_885854 ?auto_885859 ) ) ( not ( = ?auto_885854 ?auto_885860 ) ) ( not ( = ?auto_885854 ?auto_885861 ) ) ( not ( = ?auto_885854 ?auto_885862 ) ) ( not ( = ?auto_885855 ?auto_885856 ) ) ( not ( = ?auto_885855 ?auto_885857 ) ) ( not ( = ?auto_885855 ?auto_885858 ) ) ( not ( = ?auto_885855 ?auto_885859 ) ) ( not ( = ?auto_885855 ?auto_885860 ) ) ( not ( = ?auto_885855 ?auto_885861 ) ) ( not ( = ?auto_885855 ?auto_885862 ) ) ( not ( = ?auto_885856 ?auto_885857 ) ) ( not ( = ?auto_885856 ?auto_885858 ) ) ( not ( = ?auto_885856 ?auto_885859 ) ) ( not ( = ?auto_885856 ?auto_885860 ) ) ( not ( = ?auto_885856 ?auto_885861 ) ) ( not ( = ?auto_885856 ?auto_885862 ) ) ( not ( = ?auto_885857 ?auto_885858 ) ) ( not ( = ?auto_885857 ?auto_885859 ) ) ( not ( = ?auto_885857 ?auto_885860 ) ) ( not ( = ?auto_885857 ?auto_885861 ) ) ( not ( = ?auto_885857 ?auto_885862 ) ) ( not ( = ?auto_885858 ?auto_885859 ) ) ( not ( = ?auto_885858 ?auto_885860 ) ) ( not ( = ?auto_885858 ?auto_885861 ) ) ( not ( = ?auto_885858 ?auto_885862 ) ) ( not ( = ?auto_885859 ?auto_885860 ) ) ( not ( = ?auto_885859 ?auto_885861 ) ) ( not ( = ?auto_885859 ?auto_885862 ) ) ( not ( = ?auto_885860 ?auto_885861 ) ) ( not ( = ?auto_885860 ?auto_885862 ) ) ( not ( = ?auto_885861 ?auto_885862 ) ) ( ON ?auto_885860 ?auto_885861 ) ( ON ?auto_885859 ?auto_885860 ) ( CLEAR ?auto_885857 ) ( ON ?auto_885858 ?auto_885859 ) ( CLEAR ?auto_885858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_885846 ?auto_885847 ?auto_885848 ?auto_885849 ?auto_885850 ?auto_885851 ?auto_885852 ?auto_885853 ?auto_885854 ?auto_885855 ?auto_885856 ?auto_885857 ?auto_885858 )
      ( MAKE-16PILE ?auto_885846 ?auto_885847 ?auto_885848 ?auto_885849 ?auto_885850 ?auto_885851 ?auto_885852 ?auto_885853 ?auto_885854 ?auto_885855 ?auto_885856 ?auto_885857 ?auto_885858 ?auto_885859 ?auto_885860 ?auto_885861 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_885912 - BLOCK
      ?auto_885913 - BLOCK
      ?auto_885914 - BLOCK
      ?auto_885915 - BLOCK
      ?auto_885916 - BLOCK
      ?auto_885917 - BLOCK
      ?auto_885918 - BLOCK
      ?auto_885919 - BLOCK
      ?auto_885920 - BLOCK
      ?auto_885921 - BLOCK
      ?auto_885922 - BLOCK
      ?auto_885923 - BLOCK
      ?auto_885924 - BLOCK
      ?auto_885925 - BLOCK
      ?auto_885926 - BLOCK
      ?auto_885927 - BLOCK
    )
    :vars
    (
      ?auto_885928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885927 ?auto_885928 ) ( ON-TABLE ?auto_885912 ) ( ON ?auto_885913 ?auto_885912 ) ( ON ?auto_885914 ?auto_885913 ) ( ON ?auto_885915 ?auto_885914 ) ( ON ?auto_885916 ?auto_885915 ) ( ON ?auto_885917 ?auto_885916 ) ( ON ?auto_885918 ?auto_885917 ) ( ON ?auto_885919 ?auto_885918 ) ( ON ?auto_885920 ?auto_885919 ) ( ON ?auto_885921 ?auto_885920 ) ( ON ?auto_885922 ?auto_885921 ) ( not ( = ?auto_885912 ?auto_885913 ) ) ( not ( = ?auto_885912 ?auto_885914 ) ) ( not ( = ?auto_885912 ?auto_885915 ) ) ( not ( = ?auto_885912 ?auto_885916 ) ) ( not ( = ?auto_885912 ?auto_885917 ) ) ( not ( = ?auto_885912 ?auto_885918 ) ) ( not ( = ?auto_885912 ?auto_885919 ) ) ( not ( = ?auto_885912 ?auto_885920 ) ) ( not ( = ?auto_885912 ?auto_885921 ) ) ( not ( = ?auto_885912 ?auto_885922 ) ) ( not ( = ?auto_885912 ?auto_885923 ) ) ( not ( = ?auto_885912 ?auto_885924 ) ) ( not ( = ?auto_885912 ?auto_885925 ) ) ( not ( = ?auto_885912 ?auto_885926 ) ) ( not ( = ?auto_885912 ?auto_885927 ) ) ( not ( = ?auto_885912 ?auto_885928 ) ) ( not ( = ?auto_885913 ?auto_885914 ) ) ( not ( = ?auto_885913 ?auto_885915 ) ) ( not ( = ?auto_885913 ?auto_885916 ) ) ( not ( = ?auto_885913 ?auto_885917 ) ) ( not ( = ?auto_885913 ?auto_885918 ) ) ( not ( = ?auto_885913 ?auto_885919 ) ) ( not ( = ?auto_885913 ?auto_885920 ) ) ( not ( = ?auto_885913 ?auto_885921 ) ) ( not ( = ?auto_885913 ?auto_885922 ) ) ( not ( = ?auto_885913 ?auto_885923 ) ) ( not ( = ?auto_885913 ?auto_885924 ) ) ( not ( = ?auto_885913 ?auto_885925 ) ) ( not ( = ?auto_885913 ?auto_885926 ) ) ( not ( = ?auto_885913 ?auto_885927 ) ) ( not ( = ?auto_885913 ?auto_885928 ) ) ( not ( = ?auto_885914 ?auto_885915 ) ) ( not ( = ?auto_885914 ?auto_885916 ) ) ( not ( = ?auto_885914 ?auto_885917 ) ) ( not ( = ?auto_885914 ?auto_885918 ) ) ( not ( = ?auto_885914 ?auto_885919 ) ) ( not ( = ?auto_885914 ?auto_885920 ) ) ( not ( = ?auto_885914 ?auto_885921 ) ) ( not ( = ?auto_885914 ?auto_885922 ) ) ( not ( = ?auto_885914 ?auto_885923 ) ) ( not ( = ?auto_885914 ?auto_885924 ) ) ( not ( = ?auto_885914 ?auto_885925 ) ) ( not ( = ?auto_885914 ?auto_885926 ) ) ( not ( = ?auto_885914 ?auto_885927 ) ) ( not ( = ?auto_885914 ?auto_885928 ) ) ( not ( = ?auto_885915 ?auto_885916 ) ) ( not ( = ?auto_885915 ?auto_885917 ) ) ( not ( = ?auto_885915 ?auto_885918 ) ) ( not ( = ?auto_885915 ?auto_885919 ) ) ( not ( = ?auto_885915 ?auto_885920 ) ) ( not ( = ?auto_885915 ?auto_885921 ) ) ( not ( = ?auto_885915 ?auto_885922 ) ) ( not ( = ?auto_885915 ?auto_885923 ) ) ( not ( = ?auto_885915 ?auto_885924 ) ) ( not ( = ?auto_885915 ?auto_885925 ) ) ( not ( = ?auto_885915 ?auto_885926 ) ) ( not ( = ?auto_885915 ?auto_885927 ) ) ( not ( = ?auto_885915 ?auto_885928 ) ) ( not ( = ?auto_885916 ?auto_885917 ) ) ( not ( = ?auto_885916 ?auto_885918 ) ) ( not ( = ?auto_885916 ?auto_885919 ) ) ( not ( = ?auto_885916 ?auto_885920 ) ) ( not ( = ?auto_885916 ?auto_885921 ) ) ( not ( = ?auto_885916 ?auto_885922 ) ) ( not ( = ?auto_885916 ?auto_885923 ) ) ( not ( = ?auto_885916 ?auto_885924 ) ) ( not ( = ?auto_885916 ?auto_885925 ) ) ( not ( = ?auto_885916 ?auto_885926 ) ) ( not ( = ?auto_885916 ?auto_885927 ) ) ( not ( = ?auto_885916 ?auto_885928 ) ) ( not ( = ?auto_885917 ?auto_885918 ) ) ( not ( = ?auto_885917 ?auto_885919 ) ) ( not ( = ?auto_885917 ?auto_885920 ) ) ( not ( = ?auto_885917 ?auto_885921 ) ) ( not ( = ?auto_885917 ?auto_885922 ) ) ( not ( = ?auto_885917 ?auto_885923 ) ) ( not ( = ?auto_885917 ?auto_885924 ) ) ( not ( = ?auto_885917 ?auto_885925 ) ) ( not ( = ?auto_885917 ?auto_885926 ) ) ( not ( = ?auto_885917 ?auto_885927 ) ) ( not ( = ?auto_885917 ?auto_885928 ) ) ( not ( = ?auto_885918 ?auto_885919 ) ) ( not ( = ?auto_885918 ?auto_885920 ) ) ( not ( = ?auto_885918 ?auto_885921 ) ) ( not ( = ?auto_885918 ?auto_885922 ) ) ( not ( = ?auto_885918 ?auto_885923 ) ) ( not ( = ?auto_885918 ?auto_885924 ) ) ( not ( = ?auto_885918 ?auto_885925 ) ) ( not ( = ?auto_885918 ?auto_885926 ) ) ( not ( = ?auto_885918 ?auto_885927 ) ) ( not ( = ?auto_885918 ?auto_885928 ) ) ( not ( = ?auto_885919 ?auto_885920 ) ) ( not ( = ?auto_885919 ?auto_885921 ) ) ( not ( = ?auto_885919 ?auto_885922 ) ) ( not ( = ?auto_885919 ?auto_885923 ) ) ( not ( = ?auto_885919 ?auto_885924 ) ) ( not ( = ?auto_885919 ?auto_885925 ) ) ( not ( = ?auto_885919 ?auto_885926 ) ) ( not ( = ?auto_885919 ?auto_885927 ) ) ( not ( = ?auto_885919 ?auto_885928 ) ) ( not ( = ?auto_885920 ?auto_885921 ) ) ( not ( = ?auto_885920 ?auto_885922 ) ) ( not ( = ?auto_885920 ?auto_885923 ) ) ( not ( = ?auto_885920 ?auto_885924 ) ) ( not ( = ?auto_885920 ?auto_885925 ) ) ( not ( = ?auto_885920 ?auto_885926 ) ) ( not ( = ?auto_885920 ?auto_885927 ) ) ( not ( = ?auto_885920 ?auto_885928 ) ) ( not ( = ?auto_885921 ?auto_885922 ) ) ( not ( = ?auto_885921 ?auto_885923 ) ) ( not ( = ?auto_885921 ?auto_885924 ) ) ( not ( = ?auto_885921 ?auto_885925 ) ) ( not ( = ?auto_885921 ?auto_885926 ) ) ( not ( = ?auto_885921 ?auto_885927 ) ) ( not ( = ?auto_885921 ?auto_885928 ) ) ( not ( = ?auto_885922 ?auto_885923 ) ) ( not ( = ?auto_885922 ?auto_885924 ) ) ( not ( = ?auto_885922 ?auto_885925 ) ) ( not ( = ?auto_885922 ?auto_885926 ) ) ( not ( = ?auto_885922 ?auto_885927 ) ) ( not ( = ?auto_885922 ?auto_885928 ) ) ( not ( = ?auto_885923 ?auto_885924 ) ) ( not ( = ?auto_885923 ?auto_885925 ) ) ( not ( = ?auto_885923 ?auto_885926 ) ) ( not ( = ?auto_885923 ?auto_885927 ) ) ( not ( = ?auto_885923 ?auto_885928 ) ) ( not ( = ?auto_885924 ?auto_885925 ) ) ( not ( = ?auto_885924 ?auto_885926 ) ) ( not ( = ?auto_885924 ?auto_885927 ) ) ( not ( = ?auto_885924 ?auto_885928 ) ) ( not ( = ?auto_885925 ?auto_885926 ) ) ( not ( = ?auto_885925 ?auto_885927 ) ) ( not ( = ?auto_885925 ?auto_885928 ) ) ( not ( = ?auto_885926 ?auto_885927 ) ) ( not ( = ?auto_885926 ?auto_885928 ) ) ( not ( = ?auto_885927 ?auto_885928 ) ) ( ON ?auto_885926 ?auto_885927 ) ( ON ?auto_885925 ?auto_885926 ) ( ON ?auto_885924 ?auto_885925 ) ( CLEAR ?auto_885922 ) ( ON ?auto_885923 ?auto_885924 ) ( CLEAR ?auto_885923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_885912 ?auto_885913 ?auto_885914 ?auto_885915 ?auto_885916 ?auto_885917 ?auto_885918 ?auto_885919 ?auto_885920 ?auto_885921 ?auto_885922 ?auto_885923 )
      ( MAKE-16PILE ?auto_885912 ?auto_885913 ?auto_885914 ?auto_885915 ?auto_885916 ?auto_885917 ?auto_885918 ?auto_885919 ?auto_885920 ?auto_885921 ?auto_885922 ?auto_885923 ?auto_885924 ?auto_885925 ?auto_885926 ?auto_885927 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_885978 - BLOCK
      ?auto_885979 - BLOCK
      ?auto_885980 - BLOCK
      ?auto_885981 - BLOCK
      ?auto_885982 - BLOCK
      ?auto_885983 - BLOCK
      ?auto_885984 - BLOCK
      ?auto_885985 - BLOCK
      ?auto_885986 - BLOCK
      ?auto_885987 - BLOCK
      ?auto_885988 - BLOCK
      ?auto_885989 - BLOCK
      ?auto_885990 - BLOCK
      ?auto_885991 - BLOCK
      ?auto_885992 - BLOCK
      ?auto_885993 - BLOCK
    )
    :vars
    (
      ?auto_885994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_885993 ?auto_885994 ) ( ON-TABLE ?auto_885978 ) ( ON ?auto_885979 ?auto_885978 ) ( ON ?auto_885980 ?auto_885979 ) ( ON ?auto_885981 ?auto_885980 ) ( ON ?auto_885982 ?auto_885981 ) ( ON ?auto_885983 ?auto_885982 ) ( ON ?auto_885984 ?auto_885983 ) ( ON ?auto_885985 ?auto_885984 ) ( ON ?auto_885986 ?auto_885985 ) ( ON ?auto_885987 ?auto_885986 ) ( not ( = ?auto_885978 ?auto_885979 ) ) ( not ( = ?auto_885978 ?auto_885980 ) ) ( not ( = ?auto_885978 ?auto_885981 ) ) ( not ( = ?auto_885978 ?auto_885982 ) ) ( not ( = ?auto_885978 ?auto_885983 ) ) ( not ( = ?auto_885978 ?auto_885984 ) ) ( not ( = ?auto_885978 ?auto_885985 ) ) ( not ( = ?auto_885978 ?auto_885986 ) ) ( not ( = ?auto_885978 ?auto_885987 ) ) ( not ( = ?auto_885978 ?auto_885988 ) ) ( not ( = ?auto_885978 ?auto_885989 ) ) ( not ( = ?auto_885978 ?auto_885990 ) ) ( not ( = ?auto_885978 ?auto_885991 ) ) ( not ( = ?auto_885978 ?auto_885992 ) ) ( not ( = ?auto_885978 ?auto_885993 ) ) ( not ( = ?auto_885978 ?auto_885994 ) ) ( not ( = ?auto_885979 ?auto_885980 ) ) ( not ( = ?auto_885979 ?auto_885981 ) ) ( not ( = ?auto_885979 ?auto_885982 ) ) ( not ( = ?auto_885979 ?auto_885983 ) ) ( not ( = ?auto_885979 ?auto_885984 ) ) ( not ( = ?auto_885979 ?auto_885985 ) ) ( not ( = ?auto_885979 ?auto_885986 ) ) ( not ( = ?auto_885979 ?auto_885987 ) ) ( not ( = ?auto_885979 ?auto_885988 ) ) ( not ( = ?auto_885979 ?auto_885989 ) ) ( not ( = ?auto_885979 ?auto_885990 ) ) ( not ( = ?auto_885979 ?auto_885991 ) ) ( not ( = ?auto_885979 ?auto_885992 ) ) ( not ( = ?auto_885979 ?auto_885993 ) ) ( not ( = ?auto_885979 ?auto_885994 ) ) ( not ( = ?auto_885980 ?auto_885981 ) ) ( not ( = ?auto_885980 ?auto_885982 ) ) ( not ( = ?auto_885980 ?auto_885983 ) ) ( not ( = ?auto_885980 ?auto_885984 ) ) ( not ( = ?auto_885980 ?auto_885985 ) ) ( not ( = ?auto_885980 ?auto_885986 ) ) ( not ( = ?auto_885980 ?auto_885987 ) ) ( not ( = ?auto_885980 ?auto_885988 ) ) ( not ( = ?auto_885980 ?auto_885989 ) ) ( not ( = ?auto_885980 ?auto_885990 ) ) ( not ( = ?auto_885980 ?auto_885991 ) ) ( not ( = ?auto_885980 ?auto_885992 ) ) ( not ( = ?auto_885980 ?auto_885993 ) ) ( not ( = ?auto_885980 ?auto_885994 ) ) ( not ( = ?auto_885981 ?auto_885982 ) ) ( not ( = ?auto_885981 ?auto_885983 ) ) ( not ( = ?auto_885981 ?auto_885984 ) ) ( not ( = ?auto_885981 ?auto_885985 ) ) ( not ( = ?auto_885981 ?auto_885986 ) ) ( not ( = ?auto_885981 ?auto_885987 ) ) ( not ( = ?auto_885981 ?auto_885988 ) ) ( not ( = ?auto_885981 ?auto_885989 ) ) ( not ( = ?auto_885981 ?auto_885990 ) ) ( not ( = ?auto_885981 ?auto_885991 ) ) ( not ( = ?auto_885981 ?auto_885992 ) ) ( not ( = ?auto_885981 ?auto_885993 ) ) ( not ( = ?auto_885981 ?auto_885994 ) ) ( not ( = ?auto_885982 ?auto_885983 ) ) ( not ( = ?auto_885982 ?auto_885984 ) ) ( not ( = ?auto_885982 ?auto_885985 ) ) ( not ( = ?auto_885982 ?auto_885986 ) ) ( not ( = ?auto_885982 ?auto_885987 ) ) ( not ( = ?auto_885982 ?auto_885988 ) ) ( not ( = ?auto_885982 ?auto_885989 ) ) ( not ( = ?auto_885982 ?auto_885990 ) ) ( not ( = ?auto_885982 ?auto_885991 ) ) ( not ( = ?auto_885982 ?auto_885992 ) ) ( not ( = ?auto_885982 ?auto_885993 ) ) ( not ( = ?auto_885982 ?auto_885994 ) ) ( not ( = ?auto_885983 ?auto_885984 ) ) ( not ( = ?auto_885983 ?auto_885985 ) ) ( not ( = ?auto_885983 ?auto_885986 ) ) ( not ( = ?auto_885983 ?auto_885987 ) ) ( not ( = ?auto_885983 ?auto_885988 ) ) ( not ( = ?auto_885983 ?auto_885989 ) ) ( not ( = ?auto_885983 ?auto_885990 ) ) ( not ( = ?auto_885983 ?auto_885991 ) ) ( not ( = ?auto_885983 ?auto_885992 ) ) ( not ( = ?auto_885983 ?auto_885993 ) ) ( not ( = ?auto_885983 ?auto_885994 ) ) ( not ( = ?auto_885984 ?auto_885985 ) ) ( not ( = ?auto_885984 ?auto_885986 ) ) ( not ( = ?auto_885984 ?auto_885987 ) ) ( not ( = ?auto_885984 ?auto_885988 ) ) ( not ( = ?auto_885984 ?auto_885989 ) ) ( not ( = ?auto_885984 ?auto_885990 ) ) ( not ( = ?auto_885984 ?auto_885991 ) ) ( not ( = ?auto_885984 ?auto_885992 ) ) ( not ( = ?auto_885984 ?auto_885993 ) ) ( not ( = ?auto_885984 ?auto_885994 ) ) ( not ( = ?auto_885985 ?auto_885986 ) ) ( not ( = ?auto_885985 ?auto_885987 ) ) ( not ( = ?auto_885985 ?auto_885988 ) ) ( not ( = ?auto_885985 ?auto_885989 ) ) ( not ( = ?auto_885985 ?auto_885990 ) ) ( not ( = ?auto_885985 ?auto_885991 ) ) ( not ( = ?auto_885985 ?auto_885992 ) ) ( not ( = ?auto_885985 ?auto_885993 ) ) ( not ( = ?auto_885985 ?auto_885994 ) ) ( not ( = ?auto_885986 ?auto_885987 ) ) ( not ( = ?auto_885986 ?auto_885988 ) ) ( not ( = ?auto_885986 ?auto_885989 ) ) ( not ( = ?auto_885986 ?auto_885990 ) ) ( not ( = ?auto_885986 ?auto_885991 ) ) ( not ( = ?auto_885986 ?auto_885992 ) ) ( not ( = ?auto_885986 ?auto_885993 ) ) ( not ( = ?auto_885986 ?auto_885994 ) ) ( not ( = ?auto_885987 ?auto_885988 ) ) ( not ( = ?auto_885987 ?auto_885989 ) ) ( not ( = ?auto_885987 ?auto_885990 ) ) ( not ( = ?auto_885987 ?auto_885991 ) ) ( not ( = ?auto_885987 ?auto_885992 ) ) ( not ( = ?auto_885987 ?auto_885993 ) ) ( not ( = ?auto_885987 ?auto_885994 ) ) ( not ( = ?auto_885988 ?auto_885989 ) ) ( not ( = ?auto_885988 ?auto_885990 ) ) ( not ( = ?auto_885988 ?auto_885991 ) ) ( not ( = ?auto_885988 ?auto_885992 ) ) ( not ( = ?auto_885988 ?auto_885993 ) ) ( not ( = ?auto_885988 ?auto_885994 ) ) ( not ( = ?auto_885989 ?auto_885990 ) ) ( not ( = ?auto_885989 ?auto_885991 ) ) ( not ( = ?auto_885989 ?auto_885992 ) ) ( not ( = ?auto_885989 ?auto_885993 ) ) ( not ( = ?auto_885989 ?auto_885994 ) ) ( not ( = ?auto_885990 ?auto_885991 ) ) ( not ( = ?auto_885990 ?auto_885992 ) ) ( not ( = ?auto_885990 ?auto_885993 ) ) ( not ( = ?auto_885990 ?auto_885994 ) ) ( not ( = ?auto_885991 ?auto_885992 ) ) ( not ( = ?auto_885991 ?auto_885993 ) ) ( not ( = ?auto_885991 ?auto_885994 ) ) ( not ( = ?auto_885992 ?auto_885993 ) ) ( not ( = ?auto_885992 ?auto_885994 ) ) ( not ( = ?auto_885993 ?auto_885994 ) ) ( ON ?auto_885992 ?auto_885993 ) ( ON ?auto_885991 ?auto_885992 ) ( ON ?auto_885990 ?auto_885991 ) ( ON ?auto_885989 ?auto_885990 ) ( CLEAR ?auto_885987 ) ( ON ?auto_885988 ?auto_885989 ) ( CLEAR ?auto_885988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_885978 ?auto_885979 ?auto_885980 ?auto_885981 ?auto_885982 ?auto_885983 ?auto_885984 ?auto_885985 ?auto_885986 ?auto_885987 ?auto_885988 )
      ( MAKE-16PILE ?auto_885978 ?auto_885979 ?auto_885980 ?auto_885981 ?auto_885982 ?auto_885983 ?auto_885984 ?auto_885985 ?auto_885986 ?auto_885987 ?auto_885988 ?auto_885989 ?auto_885990 ?auto_885991 ?auto_885992 ?auto_885993 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_886044 - BLOCK
      ?auto_886045 - BLOCK
      ?auto_886046 - BLOCK
      ?auto_886047 - BLOCK
      ?auto_886048 - BLOCK
      ?auto_886049 - BLOCK
      ?auto_886050 - BLOCK
      ?auto_886051 - BLOCK
      ?auto_886052 - BLOCK
      ?auto_886053 - BLOCK
      ?auto_886054 - BLOCK
      ?auto_886055 - BLOCK
      ?auto_886056 - BLOCK
      ?auto_886057 - BLOCK
      ?auto_886058 - BLOCK
      ?auto_886059 - BLOCK
    )
    :vars
    (
      ?auto_886060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_886059 ?auto_886060 ) ( ON-TABLE ?auto_886044 ) ( ON ?auto_886045 ?auto_886044 ) ( ON ?auto_886046 ?auto_886045 ) ( ON ?auto_886047 ?auto_886046 ) ( ON ?auto_886048 ?auto_886047 ) ( ON ?auto_886049 ?auto_886048 ) ( ON ?auto_886050 ?auto_886049 ) ( ON ?auto_886051 ?auto_886050 ) ( ON ?auto_886052 ?auto_886051 ) ( not ( = ?auto_886044 ?auto_886045 ) ) ( not ( = ?auto_886044 ?auto_886046 ) ) ( not ( = ?auto_886044 ?auto_886047 ) ) ( not ( = ?auto_886044 ?auto_886048 ) ) ( not ( = ?auto_886044 ?auto_886049 ) ) ( not ( = ?auto_886044 ?auto_886050 ) ) ( not ( = ?auto_886044 ?auto_886051 ) ) ( not ( = ?auto_886044 ?auto_886052 ) ) ( not ( = ?auto_886044 ?auto_886053 ) ) ( not ( = ?auto_886044 ?auto_886054 ) ) ( not ( = ?auto_886044 ?auto_886055 ) ) ( not ( = ?auto_886044 ?auto_886056 ) ) ( not ( = ?auto_886044 ?auto_886057 ) ) ( not ( = ?auto_886044 ?auto_886058 ) ) ( not ( = ?auto_886044 ?auto_886059 ) ) ( not ( = ?auto_886044 ?auto_886060 ) ) ( not ( = ?auto_886045 ?auto_886046 ) ) ( not ( = ?auto_886045 ?auto_886047 ) ) ( not ( = ?auto_886045 ?auto_886048 ) ) ( not ( = ?auto_886045 ?auto_886049 ) ) ( not ( = ?auto_886045 ?auto_886050 ) ) ( not ( = ?auto_886045 ?auto_886051 ) ) ( not ( = ?auto_886045 ?auto_886052 ) ) ( not ( = ?auto_886045 ?auto_886053 ) ) ( not ( = ?auto_886045 ?auto_886054 ) ) ( not ( = ?auto_886045 ?auto_886055 ) ) ( not ( = ?auto_886045 ?auto_886056 ) ) ( not ( = ?auto_886045 ?auto_886057 ) ) ( not ( = ?auto_886045 ?auto_886058 ) ) ( not ( = ?auto_886045 ?auto_886059 ) ) ( not ( = ?auto_886045 ?auto_886060 ) ) ( not ( = ?auto_886046 ?auto_886047 ) ) ( not ( = ?auto_886046 ?auto_886048 ) ) ( not ( = ?auto_886046 ?auto_886049 ) ) ( not ( = ?auto_886046 ?auto_886050 ) ) ( not ( = ?auto_886046 ?auto_886051 ) ) ( not ( = ?auto_886046 ?auto_886052 ) ) ( not ( = ?auto_886046 ?auto_886053 ) ) ( not ( = ?auto_886046 ?auto_886054 ) ) ( not ( = ?auto_886046 ?auto_886055 ) ) ( not ( = ?auto_886046 ?auto_886056 ) ) ( not ( = ?auto_886046 ?auto_886057 ) ) ( not ( = ?auto_886046 ?auto_886058 ) ) ( not ( = ?auto_886046 ?auto_886059 ) ) ( not ( = ?auto_886046 ?auto_886060 ) ) ( not ( = ?auto_886047 ?auto_886048 ) ) ( not ( = ?auto_886047 ?auto_886049 ) ) ( not ( = ?auto_886047 ?auto_886050 ) ) ( not ( = ?auto_886047 ?auto_886051 ) ) ( not ( = ?auto_886047 ?auto_886052 ) ) ( not ( = ?auto_886047 ?auto_886053 ) ) ( not ( = ?auto_886047 ?auto_886054 ) ) ( not ( = ?auto_886047 ?auto_886055 ) ) ( not ( = ?auto_886047 ?auto_886056 ) ) ( not ( = ?auto_886047 ?auto_886057 ) ) ( not ( = ?auto_886047 ?auto_886058 ) ) ( not ( = ?auto_886047 ?auto_886059 ) ) ( not ( = ?auto_886047 ?auto_886060 ) ) ( not ( = ?auto_886048 ?auto_886049 ) ) ( not ( = ?auto_886048 ?auto_886050 ) ) ( not ( = ?auto_886048 ?auto_886051 ) ) ( not ( = ?auto_886048 ?auto_886052 ) ) ( not ( = ?auto_886048 ?auto_886053 ) ) ( not ( = ?auto_886048 ?auto_886054 ) ) ( not ( = ?auto_886048 ?auto_886055 ) ) ( not ( = ?auto_886048 ?auto_886056 ) ) ( not ( = ?auto_886048 ?auto_886057 ) ) ( not ( = ?auto_886048 ?auto_886058 ) ) ( not ( = ?auto_886048 ?auto_886059 ) ) ( not ( = ?auto_886048 ?auto_886060 ) ) ( not ( = ?auto_886049 ?auto_886050 ) ) ( not ( = ?auto_886049 ?auto_886051 ) ) ( not ( = ?auto_886049 ?auto_886052 ) ) ( not ( = ?auto_886049 ?auto_886053 ) ) ( not ( = ?auto_886049 ?auto_886054 ) ) ( not ( = ?auto_886049 ?auto_886055 ) ) ( not ( = ?auto_886049 ?auto_886056 ) ) ( not ( = ?auto_886049 ?auto_886057 ) ) ( not ( = ?auto_886049 ?auto_886058 ) ) ( not ( = ?auto_886049 ?auto_886059 ) ) ( not ( = ?auto_886049 ?auto_886060 ) ) ( not ( = ?auto_886050 ?auto_886051 ) ) ( not ( = ?auto_886050 ?auto_886052 ) ) ( not ( = ?auto_886050 ?auto_886053 ) ) ( not ( = ?auto_886050 ?auto_886054 ) ) ( not ( = ?auto_886050 ?auto_886055 ) ) ( not ( = ?auto_886050 ?auto_886056 ) ) ( not ( = ?auto_886050 ?auto_886057 ) ) ( not ( = ?auto_886050 ?auto_886058 ) ) ( not ( = ?auto_886050 ?auto_886059 ) ) ( not ( = ?auto_886050 ?auto_886060 ) ) ( not ( = ?auto_886051 ?auto_886052 ) ) ( not ( = ?auto_886051 ?auto_886053 ) ) ( not ( = ?auto_886051 ?auto_886054 ) ) ( not ( = ?auto_886051 ?auto_886055 ) ) ( not ( = ?auto_886051 ?auto_886056 ) ) ( not ( = ?auto_886051 ?auto_886057 ) ) ( not ( = ?auto_886051 ?auto_886058 ) ) ( not ( = ?auto_886051 ?auto_886059 ) ) ( not ( = ?auto_886051 ?auto_886060 ) ) ( not ( = ?auto_886052 ?auto_886053 ) ) ( not ( = ?auto_886052 ?auto_886054 ) ) ( not ( = ?auto_886052 ?auto_886055 ) ) ( not ( = ?auto_886052 ?auto_886056 ) ) ( not ( = ?auto_886052 ?auto_886057 ) ) ( not ( = ?auto_886052 ?auto_886058 ) ) ( not ( = ?auto_886052 ?auto_886059 ) ) ( not ( = ?auto_886052 ?auto_886060 ) ) ( not ( = ?auto_886053 ?auto_886054 ) ) ( not ( = ?auto_886053 ?auto_886055 ) ) ( not ( = ?auto_886053 ?auto_886056 ) ) ( not ( = ?auto_886053 ?auto_886057 ) ) ( not ( = ?auto_886053 ?auto_886058 ) ) ( not ( = ?auto_886053 ?auto_886059 ) ) ( not ( = ?auto_886053 ?auto_886060 ) ) ( not ( = ?auto_886054 ?auto_886055 ) ) ( not ( = ?auto_886054 ?auto_886056 ) ) ( not ( = ?auto_886054 ?auto_886057 ) ) ( not ( = ?auto_886054 ?auto_886058 ) ) ( not ( = ?auto_886054 ?auto_886059 ) ) ( not ( = ?auto_886054 ?auto_886060 ) ) ( not ( = ?auto_886055 ?auto_886056 ) ) ( not ( = ?auto_886055 ?auto_886057 ) ) ( not ( = ?auto_886055 ?auto_886058 ) ) ( not ( = ?auto_886055 ?auto_886059 ) ) ( not ( = ?auto_886055 ?auto_886060 ) ) ( not ( = ?auto_886056 ?auto_886057 ) ) ( not ( = ?auto_886056 ?auto_886058 ) ) ( not ( = ?auto_886056 ?auto_886059 ) ) ( not ( = ?auto_886056 ?auto_886060 ) ) ( not ( = ?auto_886057 ?auto_886058 ) ) ( not ( = ?auto_886057 ?auto_886059 ) ) ( not ( = ?auto_886057 ?auto_886060 ) ) ( not ( = ?auto_886058 ?auto_886059 ) ) ( not ( = ?auto_886058 ?auto_886060 ) ) ( not ( = ?auto_886059 ?auto_886060 ) ) ( ON ?auto_886058 ?auto_886059 ) ( ON ?auto_886057 ?auto_886058 ) ( ON ?auto_886056 ?auto_886057 ) ( ON ?auto_886055 ?auto_886056 ) ( ON ?auto_886054 ?auto_886055 ) ( CLEAR ?auto_886052 ) ( ON ?auto_886053 ?auto_886054 ) ( CLEAR ?auto_886053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_886044 ?auto_886045 ?auto_886046 ?auto_886047 ?auto_886048 ?auto_886049 ?auto_886050 ?auto_886051 ?auto_886052 ?auto_886053 )
      ( MAKE-16PILE ?auto_886044 ?auto_886045 ?auto_886046 ?auto_886047 ?auto_886048 ?auto_886049 ?auto_886050 ?auto_886051 ?auto_886052 ?auto_886053 ?auto_886054 ?auto_886055 ?auto_886056 ?auto_886057 ?auto_886058 ?auto_886059 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_886110 - BLOCK
      ?auto_886111 - BLOCK
      ?auto_886112 - BLOCK
      ?auto_886113 - BLOCK
      ?auto_886114 - BLOCK
      ?auto_886115 - BLOCK
      ?auto_886116 - BLOCK
      ?auto_886117 - BLOCK
      ?auto_886118 - BLOCK
      ?auto_886119 - BLOCK
      ?auto_886120 - BLOCK
      ?auto_886121 - BLOCK
      ?auto_886122 - BLOCK
      ?auto_886123 - BLOCK
      ?auto_886124 - BLOCK
      ?auto_886125 - BLOCK
    )
    :vars
    (
      ?auto_886126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_886125 ?auto_886126 ) ( ON-TABLE ?auto_886110 ) ( ON ?auto_886111 ?auto_886110 ) ( ON ?auto_886112 ?auto_886111 ) ( ON ?auto_886113 ?auto_886112 ) ( ON ?auto_886114 ?auto_886113 ) ( ON ?auto_886115 ?auto_886114 ) ( ON ?auto_886116 ?auto_886115 ) ( ON ?auto_886117 ?auto_886116 ) ( not ( = ?auto_886110 ?auto_886111 ) ) ( not ( = ?auto_886110 ?auto_886112 ) ) ( not ( = ?auto_886110 ?auto_886113 ) ) ( not ( = ?auto_886110 ?auto_886114 ) ) ( not ( = ?auto_886110 ?auto_886115 ) ) ( not ( = ?auto_886110 ?auto_886116 ) ) ( not ( = ?auto_886110 ?auto_886117 ) ) ( not ( = ?auto_886110 ?auto_886118 ) ) ( not ( = ?auto_886110 ?auto_886119 ) ) ( not ( = ?auto_886110 ?auto_886120 ) ) ( not ( = ?auto_886110 ?auto_886121 ) ) ( not ( = ?auto_886110 ?auto_886122 ) ) ( not ( = ?auto_886110 ?auto_886123 ) ) ( not ( = ?auto_886110 ?auto_886124 ) ) ( not ( = ?auto_886110 ?auto_886125 ) ) ( not ( = ?auto_886110 ?auto_886126 ) ) ( not ( = ?auto_886111 ?auto_886112 ) ) ( not ( = ?auto_886111 ?auto_886113 ) ) ( not ( = ?auto_886111 ?auto_886114 ) ) ( not ( = ?auto_886111 ?auto_886115 ) ) ( not ( = ?auto_886111 ?auto_886116 ) ) ( not ( = ?auto_886111 ?auto_886117 ) ) ( not ( = ?auto_886111 ?auto_886118 ) ) ( not ( = ?auto_886111 ?auto_886119 ) ) ( not ( = ?auto_886111 ?auto_886120 ) ) ( not ( = ?auto_886111 ?auto_886121 ) ) ( not ( = ?auto_886111 ?auto_886122 ) ) ( not ( = ?auto_886111 ?auto_886123 ) ) ( not ( = ?auto_886111 ?auto_886124 ) ) ( not ( = ?auto_886111 ?auto_886125 ) ) ( not ( = ?auto_886111 ?auto_886126 ) ) ( not ( = ?auto_886112 ?auto_886113 ) ) ( not ( = ?auto_886112 ?auto_886114 ) ) ( not ( = ?auto_886112 ?auto_886115 ) ) ( not ( = ?auto_886112 ?auto_886116 ) ) ( not ( = ?auto_886112 ?auto_886117 ) ) ( not ( = ?auto_886112 ?auto_886118 ) ) ( not ( = ?auto_886112 ?auto_886119 ) ) ( not ( = ?auto_886112 ?auto_886120 ) ) ( not ( = ?auto_886112 ?auto_886121 ) ) ( not ( = ?auto_886112 ?auto_886122 ) ) ( not ( = ?auto_886112 ?auto_886123 ) ) ( not ( = ?auto_886112 ?auto_886124 ) ) ( not ( = ?auto_886112 ?auto_886125 ) ) ( not ( = ?auto_886112 ?auto_886126 ) ) ( not ( = ?auto_886113 ?auto_886114 ) ) ( not ( = ?auto_886113 ?auto_886115 ) ) ( not ( = ?auto_886113 ?auto_886116 ) ) ( not ( = ?auto_886113 ?auto_886117 ) ) ( not ( = ?auto_886113 ?auto_886118 ) ) ( not ( = ?auto_886113 ?auto_886119 ) ) ( not ( = ?auto_886113 ?auto_886120 ) ) ( not ( = ?auto_886113 ?auto_886121 ) ) ( not ( = ?auto_886113 ?auto_886122 ) ) ( not ( = ?auto_886113 ?auto_886123 ) ) ( not ( = ?auto_886113 ?auto_886124 ) ) ( not ( = ?auto_886113 ?auto_886125 ) ) ( not ( = ?auto_886113 ?auto_886126 ) ) ( not ( = ?auto_886114 ?auto_886115 ) ) ( not ( = ?auto_886114 ?auto_886116 ) ) ( not ( = ?auto_886114 ?auto_886117 ) ) ( not ( = ?auto_886114 ?auto_886118 ) ) ( not ( = ?auto_886114 ?auto_886119 ) ) ( not ( = ?auto_886114 ?auto_886120 ) ) ( not ( = ?auto_886114 ?auto_886121 ) ) ( not ( = ?auto_886114 ?auto_886122 ) ) ( not ( = ?auto_886114 ?auto_886123 ) ) ( not ( = ?auto_886114 ?auto_886124 ) ) ( not ( = ?auto_886114 ?auto_886125 ) ) ( not ( = ?auto_886114 ?auto_886126 ) ) ( not ( = ?auto_886115 ?auto_886116 ) ) ( not ( = ?auto_886115 ?auto_886117 ) ) ( not ( = ?auto_886115 ?auto_886118 ) ) ( not ( = ?auto_886115 ?auto_886119 ) ) ( not ( = ?auto_886115 ?auto_886120 ) ) ( not ( = ?auto_886115 ?auto_886121 ) ) ( not ( = ?auto_886115 ?auto_886122 ) ) ( not ( = ?auto_886115 ?auto_886123 ) ) ( not ( = ?auto_886115 ?auto_886124 ) ) ( not ( = ?auto_886115 ?auto_886125 ) ) ( not ( = ?auto_886115 ?auto_886126 ) ) ( not ( = ?auto_886116 ?auto_886117 ) ) ( not ( = ?auto_886116 ?auto_886118 ) ) ( not ( = ?auto_886116 ?auto_886119 ) ) ( not ( = ?auto_886116 ?auto_886120 ) ) ( not ( = ?auto_886116 ?auto_886121 ) ) ( not ( = ?auto_886116 ?auto_886122 ) ) ( not ( = ?auto_886116 ?auto_886123 ) ) ( not ( = ?auto_886116 ?auto_886124 ) ) ( not ( = ?auto_886116 ?auto_886125 ) ) ( not ( = ?auto_886116 ?auto_886126 ) ) ( not ( = ?auto_886117 ?auto_886118 ) ) ( not ( = ?auto_886117 ?auto_886119 ) ) ( not ( = ?auto_886117 ?auto_886120 ) ) ( not ( = ?auto_886117 ?auto_886121 ) ) ( not ( = ?auto_886117 ?auto_886122 ) ) ( not ( = ?auto_886117 ?auto_886123 ) ) ( not ( = ?auto_886117 ?auto_886124 ) ) ( not ( = ?auto_886117 ?auto_886125 ) ) ( not ( = ?auto_886117 ?auto_886126 ) ) ( not ( = ?auto_886118 ?auto_886119 ) ) ( not ( = ?auto_886118 ?auto_886120 ) ) ( not ( = ?auto_886118 ?auto_886121 ) ) ( not ( = ?auto_886118 ?auto_886122 ) ) ( not ( = ?auto_886118 ?auto_886123 ) ) ( not ( = ?auto_886118 ?auto_886124 ) ) ( not ( = ?auto_886118 ?auto_886125 ) ) ( not ( = ?auto_886118 ?auto_886126 ) ) ( not ( = ?auto_886119 ?auto_886120 ) ) ( not ( = ?auto_886119 ?auto_886121 ) ) ( not ( = ?auto_886119 ?auto_886122 ) ) ( not ( = ?auto_886119 ?auto_886123 ) ) ( not ( = ?auto_886119 ?auto_886124 ) ) ( not ( = ?auto_886119 ?auto_886125 ) ) ( not ( = ?auto_886119 ?auto_886126 ) ) ( not ( = ?auto_886120 ?auto_886121 ) ) ( not ( = ?auto_886120 ?auto_886122 ) ) ( not ( = ?auto_886120 ?auto_886123 ) ) ( not ( = ?auto_886120 ?auto_886124 ) ) ( not ( = ?auto_886120 ?auto_886125 ) ) ( not ( = ?auto_886120 ?auto_886126 ) ) ( not ( = ?auto_886121 ?auto_886122 ) ) ( not ( = ?auto_886121 ?auto_886123 ) ) ( not ( = ?auto_886121 ?auto_886124 ) ) ( not ( = ?auto_886121 ?auto_886125 ) ) ( not ( = ?auto_886121 ?auto_886126 ) ) ( not ( = ?auto_886122 ?auto_886123 ) ) ( not ( = ?auto_886122 ?auto_886124 ) ) ( not ( = ?auto_886122 ?auto_886125 ) ) ( not ( = ?auto_886122 ?auto_886126 ) ) ( not ( = ?auto_886123 ?auto_886124 ) ) ( not ( = ?auto_886123 ?auto_886125 ) ) ( not ( = ?auto_886123 ?auto_886126 ) ) ( not ( = ?auto_886124 ?auto_886125 ) ) ( not ( = ?auto_886124 ?auto_886126 ) ) ( not ( = ?auto_886125 ?auto_886126 ) ) ( ON ?auto_886124 ?auto_886125 ) ( ON ?auto_886123 ?auto_886124 ) ( ON ?auto_886122 ?auto_886123 ) ( ON ?auto_886121 ?auto_886122 ) ( ON ?auto_886120 ?auto_886121 ) ( ON ?auto_886119 ?auto_886120 ) ( CLEAR ?auto_886117 ) ( ON ?auto_886118 ?auto_886119 ) ( CLEAR ?auto_886118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_886110 ?auto_886111 ?auto_886112 ?auto_886113 ?auto_886114 ?auto_886115 ?auto_886116 ?auto_886117 ?auto_886118 )
      ( MAKE-16PILE ?auto_886110 ?auto_886111 ?auto_886112 ?auto_886113 ?auto_886114 ?auto_886115 ?auto_886116 ?auto_886117 ?auto_886118 ?auto_886119 ?auto_886120 ?auto_886121 ?auto_886122 ?auto_886123 ?auto_886124 ?auto_886125 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_886176 - BLOCK
      ?auto_886177 - BLOCK
      ?auto_886178 - BLOCK
      ?auto_886179 - BLOCK
      ?auto_886180 - BLOCK
      ?auto_886181 - BLOCK
      ?auto_886182 - BLOCK
      ?auto_886183 - BLOCK
      ?auto_886184 - BLOCK
      ?auto_886185 - BLOCK
      ?auto_886186 - BLOCK
      ?auto_886187 - BLOCK
      ?auto_886188 - BLOCK
      ?auto_886189 - BLOCK
      ?auto_886190 - BLOCK
      ?auto_886191 - BLOCK
    )
    :vars
    (
      ?auto_886192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_886191 ?auto_886192 ) ( ON-TABLE ?auto_886176 ) ( ON ?auto_886177 ?auto_886176 ) ( ON ?auto_886178 ?auto_886177 ) ( ON ?auto_886179 ?auto_886178 ) ( ON ?auto_886180 ?auto_886179 ) ( ON ?auto_886181 ?auto_886180 ) ( ON ?auto_886182 ?auto_886181 ) ( not ( = ?auto_886176 ?auto_886177 ) ) ( not ( = ?auto_886176 ?auto_886178 ) ) ( not ( = ?auto_886176 ?auto_886179 ) ) ( not ( = ?auto_886176 ?auto_886180 ) ) ( not ( = ?auto_886176 ?auto_886181 ) ) ( not ( = ?auto_886176 ?auto_886182 ) ) ( not ( = ?auto_886176 ?auto_886183 ) ) ( not ( = ?auto_886176 ?auto_886184 ) ) ( not ( = ?auto_886176 ?auto_886185 ) ) ( not ( = ?auto_886176 ?auto_886186 ) ) ( not ( = ?auto_886176 ?auto_886187 ) ) ( not ( = ?auto_886176 ?auto_886188 ) ) ( not ( = ?auto_886176 ?auto_886189 ) ) ( not ( = ?auto_886176 ?auto_886190 ) ) ( not ( = ?auto_886176 ?auto_886191 ) ) ( not ( = ?auto_886176 ?auto_886192 ) ) ( not ( = ?auto_886177 ?auto_886178 ) ) ( not ( = ?auto_886177 ?auto_886179 ) ) ( not ( = ?auto_886177 ?auto_886180 ) ) ( not ( = ?auto_886177 ?auto_886181 ) ) ( not ( = ?auto_886177 ?auto_886182 ) ) ( not ( = ?auto_886177 ?auto_886183 ) ) ( not ( = ?auto_886177 ?auto_886184 ) ) ( not ( = ?auto_886177 ?auto_886185 ) ) ( not ( = ?auto_886177 ?auto_886186 ) ) ( not ( = ?auto_886177 ?auto_886187 ) ) ( not ( = ?auto_886177 ?auto_886188 ) ) ( not ( = ?auto_886177 ?auto_886189 ) ) ( not ( = ?auto_886177 ?auto_886190 ) ) ( not ( = ?auto_886177 ?auto_886191 ) ) ( not ( = ?auto_886177 ?auto_886192 ) ) ( not ( = ?auto_886178 ?auto_886179 ) ) ( not ( = ?auto_886178 ?auto_886180 ) ) ( not ( = ?auto_886178 ?auto_886181 ) ) ( not ( = ?auto_886178 ?auto_886182 ) ) ( not ( = ?auto_886178 ?auto_886183 ) ) ( not ( = ?auto_886178 ?auto_886184 ) ) ( not ( = ?auto_886178 ?auto_886185 ) ) ( not ( = ?auto_886178 ?auto_886186 ) ) ( not ( = ?auto_886178 ?auto_886187 ) ) ( not ( = ?auto_886178 ?auto_886188 ) ) ( not ( = ?auto_886178 ?auto_886189 ) ) ( not ( = ?auto_886178 ?auto_886190 ) ) ( not ( = ?auto_886178 ?auto_886191 ) ) ( not ( = ?auto_886178 ?auto_886192 ) ) ( not ( = ?auto_886179 ?auto_886180 ) ) ( not ( = ?auto_886179 ?auto_886181 ) ) ( not ( = ?auto_886179 ?auto_886182 ) ) ( not ( = ?auto_886179 ?auto_886183 ) ) ( not ( = ?auto_886179 ?auto_886184 ) ) ( not ( = ?auto_886179 ?auto_886185 ) ) ( not ( = ?auto_886179 ?auto_886186 ) ) ( not ( = ?auto_886179 ?auto_886187 ) ) ( not ( = ?auto_886179 ?auto_886188 ) ) ( not ( = ?auto_886179 ?auto_886189 ) ) ( not ( = ?auto_886179 ?auto_886190 ) ) ( not ( = ?auto_886179 ?auto_886191 ) ) ( not ( = ?auto_886179 ?auto_886192 ) ) ( not ( = ?auto_886180 ?auto_886181 ) ) ( not ( = ?auto_886180 ?auto_886182 ) ) ( not ( = ?auto_886180 ?auto_886183 ) ) ( not ( = ?auto_886180 ?auto_886184 ) ) ( not ( = ?auto_886180 ?auto_886185 ) ) ( not ( = ?auto_886180 ?auto_886186 ) ) ( not ( = ?auto_886180 ?auto_886187 ) ) ( not ( = ?auto_886180 ?auto_886188 ) ) ( not ( = ?auto_886180 ?auto_886189 ) ) ( not ( = ?auto_886180 ?auto_886190 ) ) ( not ( = ?auto_886180 ?auto_886191 ) ) ( not ( = ?auto_886180 ?auto_886192 ) ) ( not ( = ?auto_886181 ?auto_886182 ) ) ( not ( = ?auto_886181 ?auto_886183 ) ) ( not ( = ?auto_886181 ?auto_886184 ) ) ( not ( = ?auto_886181 ?auto_886185 ) ) ( not ( = ?auto_886181 ?auto_886186 ) ) ( not ( = ?auto_886181 ?auto_886187 ) ) ( not ( = ?auto_886181 ?auto_886188 ) ) ( not ( = ?auto_886181 ?auto_886189 ) ) ( not ( = ?auto_886181 ?auto_886190 ) ) ( not ( = ?auto_886181 ?auto_886191 ) ) ( not ( = ?auto_886181 ?auto_886192 ) ) ( not ( = ?auto_886182 ?auto_886183 ) ) ( not ( = ?auto_886182 ?auto_886184 ) ) ( not ( = ?auto_886182 ?auto_886185 ) ) ( not ( = ?auto_886182 ?auto_886186 ) ) ( not ( = ?auto_886182 ?auto_886187 ) ) ( not ( = ?auto_886182 ?auto_886188 ) ) ( not ( = ?auto_886182 ?auto_886189 ) ) ( not ( = ?auto_886182 ?auto_886190 ) ) ( not ( = ?auto_886182 ?auto_886191 ) ) ( not ( = ?auto_886182 ?auto_886192 ) ) ( not ( = ?auto_886183 ?auto_886184 ) ) ( not ( = ?auto_886183 ?auto_886185 ) ) ( not ( = ?auto_886183 ?auto_886186 ) ) ( not ( = ?auto_886183 ?auto_886187 ) ) ( not ( = ?auto_886183 ?auto_886188 ) ) ( not ( = ?auto_886183 ?auto_886189 ) ) ( not ( = ?auto_886183 ?auto_886190 ) ) ( not ( = ?auto_886183 ?auto_886191 ) ) ( not ( = ?auto_886183 ?auto_886192 ) ) ( not ( = ?auto_886184 ?auto_886185 ) ) ( not ( = ?auto_886184 ?auto_886186 ) ) ( not ( = ?auto_886184 ?auto_886187 ) ) ( not ( = ?auto_886184 ?auto_886188 ) ) ( not ( = ?auto_886184 ?auto_886189 ) ) ( not ( = ?auto_886184 ?auto_886190 ) ) ( not ( = ?auto_886184 ?auto_886191 ) ) ( not ( = ?auto_886184 ?auto_886192 ) ) ( not ( = ?auto_886185 ?auto_886186 ) ) ( not ( = ?auto_886185 ?auto_886187 ) ) ( not ( = ?auto_886185 ?auto_886188 ) ) ( not ( = ?auto_886185 ?auto_886189 ) ) ( not ( = ?auto_886185 ?auto_886190 ) ) ( not ( = ?auto_886185 ?auto_886191 ) ) ( not ( = ?auto_886185 ?auto_886192 ) ) ( not ( = ?auto_886186 ?auto_886187 ) ) ( not ( = ?auto_886186 ?auto_886188 ) ) ( not ( = ?auto_886186 ?auto_886189 ) ) ( not ( = ?auto_886186 ?auto_886190 ) ) ( not ( = ?auto_886186 ?auto_886191 ) ) ( not ( = ?auto_886186 ?auto_886192 ) ) ( not ( = ?auto_886187 ?auto_886188 ) ) ( not ( = ?auto_886187 ?auto_886189 ) ) ( not ( = ?auto_886187 ?auto_886190 ) ) ( not ( = ?auto_886187 ?auto_886191 ) ) ( not ( = ?auto_886187 ?auto_886192 ) ) ( not ( = ?auto_886188 ?auto_886189 ) ) ( not ( = ?auto_886188 ?auto_886190 ) ) ( not ( = ?auto_886188 ?auto_886191 ) ) ( not ( = ?auto_886188 ?auto_886192 ) ) ( not ( = ?auto_886189 ?auto_886190 ) ) ( not ( = ?auto_886189 ?auto_886191 ) ) ( not ( = ?auto_886189 ?auto_886192 ) ) ( not ( = ?auto_886190 ?auto_886191 ) ) ( not ( = ?auto_886190 ?auto_886192 ) ) ( not ( = ?auto_886191 ?auto_886192 ) ) ( ON ?auto_886190 ?auto_886191 ) ( ON ?auto_886189 ?auto_886190 ) ( ON ?auto_886188 ?auto_886189 ) ( ON ?auto_886187 ?auto_886188 ) ( ON ?auto_886186 ?auto_886187 ) ( ON ?auto_886185 ?auto_886186 ) ( ON ?auto_886184 ?auto_886185 ) ( CLEAR ?auto_886182 ) ( ON ?auto_886183 ?auto_886184 ) ( CLEAR ?auto_886183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_886176 ?auto_886177 ?auto_886178 ?auto_886179 ?auto_886180 ?auto_886181 ?auto_886182 ?auto_886183 )
      ( MAKE-16PILE ?auto_886176 ?auto_886177 ?auto_886178 ?auto_886179 ?auto_886180 ?auto_886181 ?auto_886182 ?auto_886183 ?auto_886184 ?auto_886185 ?auto_886186 ?auto_886187 ?auto_886188 ?auto_886189 ?auto_886190 ?auto_886191 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_886242 - BLOCK
      ?auto_886243 - BLOCK
      ?auto_886244 - BLOCK
      ?auto_886245 - BLOCK
      ?auto_886246 - BLOCK
      ?auto_886247 - BLOCK
      ?auto_886248 - BLOCK
      ?auto_886249 - BLOCK
      ?auto_886250 - BLOCK
      ?auto_886251 - BLOCK
      ?auto_886252 - BLOCK
      ?auto_886253 - BLOCK
      ?auto_886254 - BLOCK
      ?auto_886255 - BLOCK
      ?auto_886256 - BLOCK
      ?auto_886257 - BLOCK
    )
    :vars
    (
      ?auto_886258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_886257 ?auto_886258 ) ( ON-TABLE ?auto_886242 ) ( ON ?auto_886243 ?auto_886242 ) ( ON ?auto_886244 ?auto_886243 ) ( ON ?auto_886245 ?auto_886244 ) ( ON ?auto_886246 ?auto_886245 ) ( ON ?auto_886247 ?auto_886246 ) ( not ( = ?auto_886242 ?auto_886243 ) ) ( not ( = ?auto_886242 ?auto_886244 ) ) ( not ( = ?auto_886242 ?auto_886245 ) ) ( not ( = ?auto_886242 ?auto_886246 ) ) ( not ( = ?auto_886242 ?auto_886247 ) ) ( not ( = ?auto_886242 ?auto_886248 ) ) ( not ( = ?auto_886242 ?auto_886249 ) ) ( not ( = ?auto_886242 ?auto_886250 ) ) ( not ( = ?auto_886242 ?auto_886251 ) ) ( not ( = ?auto_886242 ?auto_886252 ) ) ( not ( = ?auto_886242 ?auto_886253 ) ) ( not ( = ?auto_886242 ?auto_886254 ) ) ( not ( = ?auto_886242 ?auto_886255 ) ) ( not ( = ?auto_886242 ?auto_886256 ) ) ( not ( = ?auto_886242 ?auto_886257 ) ) ( not ( = ?auto_886242 ?auto_886258 ) ) ( not ( = ?auto_886243 ?auto_886244 ) ) ( not ( = ?auto_886243 ?auto_886245 ) ) ( not ( = ?auto_886243 ?auto_886246 ) ) ( not ( = ?auto_886243 ?auto_886247 ) ) ( not ( = ?auto_886243 ?auto_886248 ) ) ( not ( = ?auto_886243 ?auto_886249 ) ) ( not ( = ?auto_886243 ?auto_886250 ) ) ( not ( = ?auto_886243 ?auto_886251 ) ) ( not ( = ?auto_886243 ?auto_886252 ) ) ( not ( = ?auto_886243 ?auto_886253 ) ) ( not ( = ?auto_886243 ?auto_886254 ) ) ( not ( = ?auto_886243 ?auto_886255 ) ) ( not ( = ?auto_886243 ?auto_886256 ) ) ( not ( = ?auto_886243 ?auto_886257 ) ) ( not ( = ?auto_886243 ?auto_886258 ) ) ( not ( = ?auto_886244 ?auto_886245 ) ) ( not ( = ?auto_886244 ?auto_886246 ) ) ( not ( = ?auto_886244 ?auto_886247 ) ) ( not ( = ?auto_886244 ?auto_886248 ) ) ( not ( = ?auto_886244 ?auto_886249 ) ) ( not ( = ?auto_886244 ?auto_886250 ) ) ( not ( = ?auto_886244 ?auto_886251 ) ) ( not ( = ?auto_886244 ?auto_886252 ) ) ( not ( = ?auto_886244 ?auto_886253 ) ) ( not ( = ?auto_886244 ?auto_886254 ) ) ( not ( = ?auto_886244 ?auto_886255 ) ) ( not ( = ?auto_886244 ?auto_886256 ) ) ( not ( = ?auto_886244 ?auto_886257 ) ) ( not ( = ?auto_886244 ?auto_886258 ) ) ( not ( = ?auto_886245 ?auto_886246 ) ) ( not ( = ?auto_886245 ?auto_886247 ) ) ( not ( = ?auto_886245 ?auto_886248 ) ) ( not ( = ?auto_886245 ?auto_886249 ) ) ( not ( = ?auto_886245 ?auto_886250 ) ) ( not ( = ?auto_886245 ?auto_886251 ) ) ( not ( = ?auto_886245 ?auto_886252 ) ) ( not ( = ?auto_886245 ?auto_886253 ) ) ( not ( = ?auto_886245 ?auto_886254 ) ) ( not ( = ?auto_886245 ?auto_886255 ) ) ( not ( = ?auto_886245 ?auto_886256 ) ) ( not ( = ?auto_886245 ?auto_886257 ) ) ( not ( = ?auto_886245 ?auto_886258 ) ) ( not ( = ?auto_886246 ?auto_886247 ) ) ( not ( = ?auto_886246 ?auto_886248 ) ) ( not ( = ?auto_886246 ?auto_886249 ) ) ( not ( = ?auto_886246 ?auto_886250 ) ) ( not ( = ?auto_886246 ?auto_886251 ) ) ( not ( = ?auto_886246 ?auto_886252 ) ) ( not ( = ?auto_886246 ?auto_886253 ) ) ( not ( = ?auto_886246 ?auto_886254 ) ) ( not ( = ?auto_886246 ?auto_886255 ) ) ( not ( = ?auto_886246 ?auto_886256 ) ) ( not ( = ?auto_886246 ?auto_886257 ) ) ( not ( = ?auto_886246 ?auto_886258 ) ) ( not ( = ?auto_886247 ?auto_886248 ) ) ( not ( = ?auto_886247 ?auto_886249 ) ) ( not ( = ?auto_886247 ?auto_886250 ) ) ( not ( = ?auto_886247 ?auto_886251 ) ) ( not ( = ?auto_886247 ?auto_886252 ) ) ( not ( = ?auto_886247 ?auto_886253 ) ) ( not ( = ?auto_886247 ?auto_886254 ) ) ( not ( = ?auto_886247 ?auto_886255 ) ) ( not ( = ?auto_886247 ?auto_886256 ) ) ( not ( = ?auto_886247 ?auto_886257 ) ) ( not ( = ?auto_886247 ?auto_886258 ) ) ( not ( = ?auto_886248 ?auto_886249 ) ) ( not ( = ?auto_886248 ?auto_886250 ) ) ( not ( = ?auto_886248 ?auto_886251 ) ) ( not ( = ?auto_886248 ?auto_886252 ) ) ( not ( = ?auto_886248 ?auto_886253 ) ) ( not ( = ?auto_886248 ?auto_886254 ) ) ( not ( = ?auto_886248 ?auto_886255 ) ) ( not ( = ?auto_886248 ?auto_886256 ) ) ( not ( = ?auto_886248 ?auto_886257 ) ) ( not ( = ?auto_886248 ?auto_886258 ) ) ( not ( = ?auto_886249 ?auto_886250 ) ) ( not ( = ?auto_886249 ?auto_886251 ) ) ( not ( = ?auto_886249 ?auto_886252 ) ) ( not ( = ?auto_886249 ?auto_886253 ) ) ( not ( = ?auto_886249 ?auto_886254 ) ) ( not ( = ?auto_886249 ?auto_886255 ) ) ( not ( = ?auto_886249 ?auto_886256 ) ) ( not ( = ?auto_886249 ?auto_886257 ) ) ( not ( = ?auto_886249 ?auto_886258 ) ) ( not ( = ?auto_886250 ?auto_886251 ) ) ( not ( = ?auto_886250 ?auto_886252 ) ) ( not ( = ?auto_886250 ?auto_886253 ) ) ( not ( = ?auto_886250 ?auto_886254 ) ) ( not ( = ?auto_886250 ?auto_886255 ) ) ( not ( = ?auto_886250 ?auto_886256 ) ) ( not ( = ?auto_886250 ?auto_886257 ) ) ( not ( = ?auto_886250 ?auto_886258 ) ) ( not ( = ?auto_886251 ?auto_886252 ) ) ( not ( = ?auto_886251 ?auto_886253 ) ) ( not ( = ?auto_886251 ?auto_886254 ) ) ( not ( = ?auto_886251 ?auto_886255 ) ) ( not ( = ?auto_886251 ?auto_886256 ) ) ( not ( = ?auto_886251 ?auto_886257 ) ) ( not ( = ?auto_886251 ?auto_886258 ) ) ( not ( = ?auto_886252 ?auto_886253 ) ) ( not ( = ?auto_886252 ?auto_886254 ) ) ( not ( = ?auto_886252 ?auto_886255 ) ) ( not ( = ?auto_886252 ?auto_886256 ) ) ( not ( = ?auto_886252 ?auto_886257 ) ) ( not ( = ?auto_886252 ?auto_886258 ) ) ( not ( = ?auto_886253 ?auto_886254 ) ) ( not ( = ?auto_886253 ?auto_886255 ) ) ( not ( = ?auto_886253 ?auto_886256 ) ) ( not ( = ?auto_886253 ?auto_886257 ) ) ( not ( = ?auto_886253 ?auto_886258 ) ) ( not ( = ?auto_886254 ?auto_886255 ) ) ( not ( = ?auto_886254 ?auto_886256 ) ) ( not ( = ?auto_886254 ?auto_886257 ) ) ( not ( = ?auto_886254 ?auto_886258 ) ) ( not ( = ?auto_886255 ?auto_886256 ) ) ( not ( = ?auto_886255 ?auto_886257 ) ) ( not ( = ?auto_886255 ?auto_886258 ) ) ( not ( = ?auto_886256 ?auto_886257 ) ) ( not ( = ?auto_886256 ?auto_886258 ) ) ( not ( = ?auto_886257 ?auto_886258 ) ) ( ON ?auto_886256 ?auto_886257 ) ( ON ?auto_886255 ?auto_886256 ) ( ON ?auto_886254 ?auto_886255 ) ( ON ?auto_886253 ?auto_886254 ) ( ON ?auto_886252 ?auto_886253 ) ( ON ?auto_886251 ?auto_886252 ) ( ON ?auto_886250 ?auto_886251 ) ( ON ?auto_886249 ?auto_886250 ) ( CLEAR ?auto_886247 ) ( ON ?auto_886248 ?auto_886249 ) ( CLEAR ?auto_886248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_886242 ?auto_886243 ?auto_886244 ?auto_886245 ?auto_886246 ?auto_886247 ?auto_886248 )
      ( MAKE-16PILE ?auto_886242 ?auto_886243 ?auto_886244 ?auto_886245 ?auto_886246 ?auto_886247 ?auto_886248 ?auto_886249 ?auto_886250 ?auto_886251 ?auto_886252 ?auto_886253 ?auto_886254 ?auto_886255 ?auto_886256 ?auto_886257 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_886308 - BLOCK
      ?auto_886309 - BLOCK
      ?auto_886310 - BLOCK
      ?auto_886311 - BLOCK
      ?auto_886312 - BLOCK
      ?auto_886313 - BLOCK
      ?auto_886314 - BLOCK
      ?auto_886315 - BLOCK
      ?auto_886316 - BLOCK
      ?auto_886317 - BLOCK
      ?auto_886318 - BLOCK
      ?auto_886319 - BLOCK
      ?auto_886320 - BLOCK
      ?auto_886321 - BLOCK
      ?auto_886322 - BLOCK
      ?auto_886323 - BLOCK
    )
    :vars
    (
      ?auto_886324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_886323 ?auto_886324 ) ( ON-TABLE ?auto_886308 ) ( ON ?auto_886309 ?auto_886308 ) ( ON ?auto_886310 ?auto_886309 ) ( ON ?auto_886311 ?auto_886310 ) ( ON ?auto_886312 ?auto_886311 ) ( not ( = ?auto_886308 ?auto_886309 ) ) ( not ( = ?auto_886308 ?auto_886310 ) ) ( not ( = ?auto_886308 ?auto_886311 ) ) ( not ( = ?auto_886308 ?auto_886312 ) ) ( not ( = ?auto_886308 ?auto_886313 ) ) ( not ( = ?auto_886308 ?auto_886314 ) ) ( not ( = ?auto_886308 ?auto_886315 ) ) ( not ( = ?auto_886308 ?auto_886316 ) ) ( not ( = ?auto_886308 ?auto_886317 ) ) ( not ( = ?auto_886308 ?auto_886318 ) ) ( not ( = ?auto_886308 ?auto_886319 ) ) ( not ( = ?auto_886308 ?auto_886320 ) ) ( not ( = ?auto_886308 ?auto_886321 ) ) ( not ( = ?auto_886308 ?auto_886322 ) ) ( not ( = ?auto_886308 ?auto_886323 ) ) ( not ( = ?auto_886308 ?auto_886324 ) ) ( not ( = ?auto_886309 ?auto_886310 ) ) ( not ( = ?auto_886309 ?auto_886311 ) ) ( not ( = ?auto_886309 ?auto_886312 ) ) ( not ( = ?auto_886309 ?auto_886313 ) ) ( not ( = ?auto_886309 ?auto_886314 ) ) ( not ( = ?auto_886309 ?auto_886315 ) ) ( not ( = ?auto_886309 ?auto_886316 ) ) ( not ( = ?auto_886309 ?auto_886317 ) ) ( not ( = ?auto_886309 ?auto_886318 ) ) ( not ( = ?auto_886309 ?auto_886319 ) ) ( not ( = ?auto_886309 ?auto_886320 ) ) ( not ( = ?auto_886309 ?auto_886321 ) ) ( not ( = ?auto_886309 ?auto_886322 ) ) ( not ( = ?auto_886309 ?auto_886323 ) ) ( not ( = ?auto_886309 ?auto_886324 ) ) ( not ( = ?auto_886310 ?auto_886311 ) ) ( not ( = ?auto_886310 ?auto_886312 ) ) ( not ( = ?auto_886310 ?auto_886313 ) ) ( not ( = ?auto_886310 ?auto_886314 ) ) ( not ( = ?auto_886310 ?auto_886315 ) ) ( not ( = ?auto_886310 ?auto_886316 ) ) ( not ( = ?auto_886310 ?auto_886317 ) ) ( not ( = ?auto_886310 ?auto_886318 ) ) ( not ( = ?auto_886310 ?auto_886319 ) ) ( not ( = ?auto_886310 ?auto_886320 ) ) ( not ( = ?auto_886310 ?auto_886321 ) ) ( not ( = ?auto_886310 ?auto_886322 ) ) ( not ( = ?auto_886310 ?auto_886323 ) ) ( not ( = ?auto_886310 ?auto_886324 ) ) ( not ( = ?auto_886311 ?auto_886312 ) ) ( not ( = ?auto_886311 ?auto_886313 ) ) ( not ( = ?auto_886311 ?auto_886314 ) ) ( not ( = ?auto_886311 ?auto_886315 ) ) ( not ( = ?auto_886311 ?auto_886316 ) ) ( not ( = ?auto_886311 ?auto_886317 ) ) ( not ( = ?auto_886311 ?auto_886318 ) ) ( not ( = ?auto_886311 ?auto_886319 ) ) ( not ( = ?auto_886311 ?auto_886320 ) ) ( not ( = ?auto_886311 ?auto_886321 ) ) ( not ( = ?auto_886311 ?auto_886322 ) ) ( not ( = ?auto_886311 ?auto_886323 ) ) ( not ( = ?auto_886311 ?auto_886324 ) ) ( not ( = ?auto_886312 ?auto_886313 ) ) ( not ( = ?auto_886312 ?auto_886314 ) ) ( not ( = ?auto_886312 ?auto_886315 ) ) ( not ( = ?auto_886312 ?auto_886316 ) ) ( not ( = ?auto_886312 ?auto_886317 ) ) ( not ( = ?auto_886312 ?auto_886318 ) ) ( not ( = ?auto_886312 ?auto_886319 ) ) ( not ( = ?auto_886312 ?auto_886320 ) ) ( not ( = ?auto_886312 ?auto_886321 ) ) ( not ( = ?auto_886312 ?auto_886322 ) ) ( not ( = ?auto_886312 ?auto_886323 ) ) ( not ( = ?auto_886312 ?auto_886324 ) ) ( not ( = ?auto_886313 ?auto_886314 ) ) ( not ( = ?auto_886313 ?auto_886315 ) ) ( not ( = ?auto_886313 ?auto_886316 ) ) ( not ( = ?auto_886313 ?auto_886317 ) ) ( not ( = ?auto_886313 ?auto_886318 ) ) ( not ( = ?auto_886313 ?auto_886319 ) ) ( not ( = ?auto_886313 ?auto_886320 ) ) ( not ( = ?auto_886313 ?auto_886321 ) ) ( not ( = ?auto_886313 ?auto_886322 ) ) ( not ( = ?auto_886313 ?auto_886323 ) ) ( not ( = ?auto_886313 ?auto_886324 ) ) ( not ( = ?auto_886314 ?auto_886315 ) ) ( not ( = ?auto_886314 ?auto_886316 ) ) ( not ( = ?auto_886314 ?auto_886317 ) ) ( not ( = ?auto_886314 ?auto_886318 ) ) ( not ( = ?auto_886314 ?auto_886319 ) ) ( not ( = ?auto_886314 ?auto_886320 ) ) ( not ( = ?auto_886314 ?auto_886321 ) ) ( not ( = ?auto_886314 ?auto_886322 ) ) ( not ( = ?auto_886314 ?auto_886323 ) ) ( not ( = ?auto_886314 ?auto_886324 ) ) ( not ( = ?auto_886315 ?auto_886316 ) ) ( not ( = ?auto_886315 ?auto_886317 ) ) ( not ( = ?auto_886315 ?auto_886318 ) ) ( not ( = ?auto_886315 ?auto_886319 ) ) ( not ( = ?auto_886315 ?auto_886320 ) ) ( not ( = ?auto_886315 ?auto_886321 ) ) ( not ( = ?auto_886315 ?auto_886322 ) ) ( not ( = ?auto_886315 ?auto_886323 ) ) ( not ( = ?auto_886315 ?auto_886324 ) ) ( not ( = ?auto_886316 ?auto_886317 ) ) ( not ( = ?auto_886316 ?auto_886318 ) ) ( not ( = ?auto_886316 ?auto_886319 ) ) ( not ( = ?auto_886316 ?auto_886320 ) ) ( not ( = ?auto_886316 ?auto_886321 ) ) ( not ( = ?auto_886316 ?auto_886322 ) ) ( not ( = ?auto_886316 ?auto_886323 ) ) ( not ( = ?auto_886316 ?auto_886324 ) ) ( not ( = ?auto_886317 ?auto_886318 ) ) ( not ( = ?auto_886317 ?auto_886319 ) ) ( not ( = ?auto_886317 ?auto_886320 ) ) ( not ( = ?auto_886317 ?auto_886321 ) ) ( not ( = ?auto_886317 ?auto_886322 ) ) ( not ( = ?auto_886317 ?auto_886323 ) ) ( not ( = ?auto_886317 ?auto_886324 ) ) ( not ( = ?auto_886318 ?auto_886319 ) ) ( not ( = ?auto_886318 ?auto_886320 ) ) ( not ( = ?auto_886318 ?auto_886321 ) ) ( not ( = ?auto_886318 ?auto_886322 ) ) ( not ( = ?auto_886318 ?auto_886323 ) ) ( not ( = ?auto_886318 ?auto_886324 ) ) ( not ( = ?auto_886319 ?auto_886320 ) ) ( not ( = ?auto_886319 ?auto_886321 ) ) ( not ( = ?auto_886319 ?auto_886322 ) ) ( not ( = ?auto_886319 ?auto_886323 ) ) ( not ( = ?auto_886319 ?auto_886324 ) ) ( not ( = ?auto_886320 ?auto_886321 ) ) ( not ( = ?auto_886320 ?auto_886322 ) ) ( not ( = ?auto_886320 ?auto_886323 ) ) ( not ( = ?auto_886320 ?auto_886324 ) ) ( not ( = ?auto_886321 ?auto_886322 ) ) ( not ( = ?auto_886321 ?auto_886323 ) ) ( not ( = ?auto_886321 ?auto_886324 ) ) ( not ( = ?auto_886322 ?auto_886323 ) ) ( not ( = ?auto_886322 ?auto_886324 ) ) ( not ( = ?auto_886323 ?auto_886324 ) ) ( ON ?auto_886322 ?auto_886323 ) ( ON ?auto_886321 ?auto_886322 ) ( ON ?auto_886320 ?auto_886321 ) ( ON ?auto_886319 ?auto_886320 ) ( ON ?auto_886318 ?auto_886319 ) ( ON ?auto_886317 ?auto_886318 ) ( ON ?auto_886316 ?auto_886317 ) ( ON ?auto_886315 ?auto_886316 ) ( ON ?auto_886314 ?auto_886315 ) ( CLEAR ?auto_886312 ) ( ON ?auto_886313 ?auto_886314 ) ( CLEAR ?auto_886313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_886308 ?auto_886309 ?auto_886310 ?auto_886311 ?auto_886312 ?auto_886313 )
      ( MAKE-16PILE ?auto_886308 ?auto_886309 ?auto_886310 ?auto_886311 ?auto_886312 ?auto_886313 ?auto_886314 ?auto_886315 ?auto_886316 ?auto_886317 ?auto_886318 ?auto_886319 ?auto_886320 ?auto_886321 ?auto_886322 ?auto_886323 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_886374 - BLOCK
      ?auto_886375 - BLOCK
      ?auto_886376 - BLOCK
      ?auto_886377 - BLOCK
      ?auto_886378 - BLOCK
      ?auto_886379 - BLOCK
      ?auto_886380 - BLOCK
      ?auto_886381 - BLOCK
      ?auto_886382 - BLOCK
      ?auto_886383 - BLOCK
      ?auto_886384 - BLOCK
      ?auto_886385 - BLOCK
      ?auto_886386 - BLOCK
      ?auto_886387 - BLOCK
      ?auto_886388 - BLOCK
      ?auto_886389 - BLOCK
    )
    :vars
    (
      ?auto_886390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_886389 ?auto_886390 ) ( ON-TABLE ?auto_886374 ) ( ON ?auto_886375 ?auto_886374 ) ( ON ?auto_886376 ?auto_886375 ) ( ON ?auto_886377 ?auto_886376 ) ( not ( = ?auto_886374 ?auto_886375 ) ) ( not ( = ?auto_886374 ?auto_886376 ) ) ( not ( = ?auto_886374 ?auto_886377 ) ) ( not ( = ?auto_886374 ?auto_886378 ) ) ( not ( = ?auto_886374 ?auto_886379 ) ) ( not ( = ?auto_886374 ?auto_886380 ) ) ( not ( = ?auto_886374 ?auto_886381 ) ) ( not ( = ?auto_886374 ?auto_886382 ) ) ( not ( = ?auto_886374 ?auto_886383 ) ) ( not ( = ?auto_886374 ?auto_886384 ) ) ( not ( = ?auto_886374 ?auto_886385 ) ) ( not ( = ?auto_886374 ?auto_886386 ) ) ( not ( = ?auto_886374 ?auto_886387 ) ) ( not ( = ?auto_886374 ?auto_886388 ) ) ( not ( = ?auto_886374 ?auto_886389 ) ) ( not ( = ?auto_886374 ?auto_886390 ) ) ( not ( = ?auto_886375 ?auto_886376 ) ) ( not ( = ?auto_886375 ?auto_886377 ) ) ( not ( = ?auto_886375 ?auto_886378 ) ) ( not ( = ?auto_886375 ?auto_886379 ) ) ( not ( = ?auto_886375 ?auto_886380 ) ) ( not ( = ?auto_886375 ?auto_886381 ) ) ( not ( = ?auto_886375 ?auto_886382 ) ) ( not ( = ?auto_886375 ?auto_886383 ) ) ( not ( = ?auto_886375 ?auto_886384 ) ) ( not ( = ?auto_886375 ?auto_886385 ) ) ( not ( = ?auto_886375 ?auto_886386 ) ) ( not ( = ?auto_886375 ?auto_886387 ) ) ( not ( = ?auto_886375 ?auto_886388 ) ) ( not ( = ?auto_886375 ?auto_886389 ) ) ( not ( = ?auto_886375 ?auto_886390 ) ) ( not ( = ?auto_886376 ?auto_886377 ) ) ( not ( = ?auto_886376 ?auto_886378 ) ) ( not ( = ?auto_886376 ?auto_886379 ) ) ( not ( = ?auto_886376 ?auto_886380 ) ) ( not ( = ?auto_886376 ?auto_886381 ) ) ( not ( = ?auto_886376 ?auto_886382 ) ) ( not ( = ?auto_886376 ?auto_886383 ) ) ( not ( = ?auto_886376 ?auto_886384 ) ) ( not ( = ?auto_886376 ?auto_886385 ) ) ( not ( = ?auto_886376 ?auto_886386 ) ) ( not ( = ?auto_886376 ?auto_886387 ) ) ( not ( = ?auto_886376 ?auto_886388 ) ) ( not ( = ?auto_886376 ?auto_886389 ) ) ( not ( = ?auto_886376 ?auto_886390 ) ) ( not ( = ?auto_886377 ?auto_886378 ) ) ( not ( = ?auto_886377 ?auto_886379 ) ) ( not ( = ?auto_886377 ?auto_886380 ) ) ( not ( = ?auto_886377 ?auto_886381 ) ) ( not ( = ?auto_886377 ?auto_886382 ) ) ( not ( = ?auto_886377 ?auto_886383 ) ) ( not ( = ?auto_886377 ?auto_886384 ) ) ( not ( = ?auto_886377 ?auto_886385 ) ) ( not ( = ?auto_886377 ?auto_886386 ) ) ( not ( = ?auto_886377 ?auto_886387 ) ) ( not ( = ?auto_886377 ?auto_886388 ) ) ( not ( = ?auto_886377 ?auto_886389 ) ) ( not ( = ?auto_886377 ?auto_886390 ) ) ( not ( = ?auto_886378 ?auto_886379 ) ) ( not ( = ?auto_886378 ?auto_886380 ) ) ( not ( = ?auto_886378 ?auto_886381 ) ) ( not ( = ?auto_886378 ?auto_886382 ) ) ( not ( = ?auto_886378 ?auto_886383 ) ) ( not ( = ?auto_886378 ?auto_886384 ) ) ( not ( = ?auto_886378 ?auto_886385 ) ) ( not ( = ?auto_886378 ?auto_886386 ) ) ( not ( = ?auto_886378 ?auto_886387 ) ) ( not ( = ?auto_886378 ?auto_886388 ) ) ( not ( = ?auto_886378 ?auto_886389 ) ) ( not ( = ?auto_886378 ?auto_886390 ) ) ( not ( = ?auto_886379 ?auto_886380 ) ) ( not ( = ?auto_886379 ?auto_886381 ) ) ( not ( = ?auto_886379 ?auto_886382 ) ) ( not ( = ?auto_886379 ?auto_886383 ) ) ( not ( = ?auto_886379 ?auto_886384 ) ) ( not ( = ?auto_886379 ?auto_886385 ) ) ( not ( = ?auto_886379 ?auto_886386 ) ) ( not ( = ?auto_886379 ?auto_886387 ) ) ( not ( = ?auto_886379 ?auto_886388 ) ) ( not ( = ?auto_886379 ?auto_886389 ) ) ( not ( = ?auto_886379 ?auto_886390 ) ) ( not ( = ?auto_886380 ?auto_886381 ) ) ( not ( = ?auto_886380 ?auto_886382 ) ) ( not ( = ?auto_886380 ?auto_886383 ) ) ( not ( = ?auto_886380 ?auto_886384 ) ) ( not ( = ?auto_886380 ?auto_886385 ) ) ( not ( = ?auto_886380 ?auto_886386 ) ) ( not ( = ?auto_886380 ?auto_886387 ) ) ( not ( = ?auto_886380 ?auto_886388 ) ) ( not ( = ?auto_886380 ?auto_886389 ) ) ( not ( = ?auto_886380 ?auto_886390 ) ) ( not ( = ?auto_886381 ?auto_886382 ) ) ( not ( = ?auto_886381 ?auto_886383 ) ) ( not ( = ?auto_886381 ?auto_886384 ) ) ( not ( = ?auto_886381 ?auto_886385 ) ) ( not ( = ?auto_886381 ?auto_886386 ) ) ( not ( = ?auto_886381 ?auto_886387 ) ) ( not ( = ?auto_886381 ?auto_886388 ) ) ( not ( = ?auto_886381 ?auto_886389 ) ) ( not ( = ?auto_886381 ?auto_886390 ) ) ( not ( = ?auto_886382 ?auto_886383 ) ) ( not ( = ?auto_886382 ?auto_886384 ) ) ( not ( = ?auto_886382 ?auto_886385 ) ) ( not ( = ?auto_886382 ?auto_886386 ) ) ( not ( = ?auto_886382 ?auto_886387 ) ) ( not ( = ?auto_886382 ?auto_886388 ) ) ( not ( = ?auto_886382 ?auto_886389 ) ) ( not ( = ?auto_886382 ?auto_886390 ) ) ( not ( = ?auto_886383 ?auto_886384 ) ) ( not ( = ?auto_886383 ?auto_886385 ) ) ( not ( = ?auto_886383 ?auto_886386 ) ) ( not ( = ?auto_886383 ?auto_886387 ) ) ( not ( = ?auto_886383 ?auto_886388 ) ) ( not ( = ?auto_886383 ?auto_886389 ) ) ( not ( = ?auto_886383 ?auto_886390 ) ) ( not ( = ?auto_886384 ?auto_886385 ) ) ( not ( = ?auto_886384 ?auto_886386 ) ) ( not ( = ?auto_886384 ?auto_886387 ) ) ( not ( = ?auto_886384 ?auto_886388 ) ) ( not ( = ?auto_886384 ?auto_886389 ) ) ( not ( = ?auto_886384 ?auto_886390 ) ) ( not ( = ?auto_886385 ?auto_886386 ) ) ( not ( = ?auto_886385 ?auto_886387 ) ) ( not ( = ?auto_886385 ?auto_886388 ) ) ( not ( = ?auto_886385 ?auto_886389 ) ) ( not ( = ?auto_886385 ?auto_886390 ) ) ( not ( = ?auto_886386 ?auto_886387 ) ) ( not ( = ?auto_886386 ?auto_886388 ) ) ( not ( = ?auto_886386 ?auto_886389 ) ) ( not ( = ?auto_886386 ?auto_886390 ) ) ( not ( = ?auto_886387 ?auto_886388 ) ) ( not ( = ?auto_886387 ?auto_886389 ) ) ( not ( = ?auto_886387 ?auto_886390 ) ) ( not ( = ?auto_886388 ?auto_886389 ) ) ( not ( = ?auto_886388 ?auto_886390 ) ) ( not ( = ?auto_886389 ?auto_886390 ) ) ( ON ?auto_886388 ?auto_886389 ) ( ON ?auto_886387 ?auto_886388 ) ( ON ?auto_886386 ?auto_886387 ) ( ON ?auto_886385 ?auto_886386 ) ( ON ?auto_886384 ?auto_886385 ) ( ON ?auto_886383 ?auto_886384 ) ( ON ?auto_886382 ?auto_886383 ) ( ON ?auto_886381 ?auto_886382 ) ( ON ?auto_886380 ?auto_886381 ) ( ON ?auto_886379 ?auto_886380 ) ( CLEAR ?auto_886377 ) ( ON ?auto_886378 ?auto_886379 ) ( CLEAR ?auto_886378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_886374 ?auto_886375 ?auto_886376 ?auto_886377 ?auto_886378 )
      ( MAKE-16PILE ?auto_886374 ?auto_886375 ?auto_886376 ?auto_886377 ?auto_886378 ?auto_886379 ?auto_886380 ?auto_886381 ?auto_886382 ?auto_886383 ?auto_886384 ?auto_886385 ?auto_886386 ?auto_886387 ?auto_886388 ?auto_886389 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_886440 - BLOCK
      ?auto_886441 - BLOCK
      ?auto_886442 - BLOCK
      ?auto_886443 - BLOCK
      ?auto_886444 - BLOCK
      ?auto_886445 - BLOCK
      ?auto_886446 - BLOCK
      ?auto_886447 - BLOCK
      ?auto_886448 - BLOCK
      ?auto_886449 - BLOCK
      ?auto_886450 - BLOCK
      ?auto_886451 - BLOCK
      ?auto_886452 - BLOCK
      ?auto_886453 - BLOCK
      ?auto_886454 - BLOCK
      ?auto_886455 - BLOCK
    )
    :vars
    (
      ?auto_886456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_886455 ?auto_886456 ) ( ON-TABLE ?auto_886440 ) ( ON ?auto_886441 ?auto_886440 ) ( ON ?auto_886442 ?auto_886441 ) ( not ( = ?auto_886440 ?auto_886441 ) ) ( not ( = ?auto_886440 ?auto_886442 ) ) ( not ( = ?auto_886440 ?auto_886443 ) ) ( not ( = ?auto_886440 ?auto_886444 ) ) ( not ( = ?auto_886440 ?auto_886445 ) ) ( not ( = ?auto_886440 ?auto_886446 ) ) ( not ( = ?auto_886440 ?auto_886447 ) ) ( not ( = ?auto_886440 ?auto_886448 ) ) ( not ( = ?auto_886440 ?auto_886449 ) ) ( not ( = ?auto_886440 ?auto_886450 ) ) ( not ( = ?auto_886440 ?auto_886451 ) ) ( not ( = ?auto_886440 ?auto_886452 ) ) ( not ( = ?auto_886440 ?auto_886453 ) ) ( not ( = ?auto_886440 ?auto_886454 ) ) ( not ( = ?auto_886440 ?auto_886455 ) ) ( not ( = ?auto_886440 ?auto_886456 ) ) ( not ( = ?auto_886441 ?auto_886442 ) ) ( not ( = ?auto_886441 ?auto_886443 ) ) ( not ( = ?auto_886441 ?auto_886444 ) ) ( not ( = ?auto_886441 ?auto_886445 ) ) ( not ( = ?auto_886441 ?auto_886446 ) ) ( not ( = ?auto_886441 ?auto_886447 ) ) ( not ( = ?auto_886441 ?auto_886448 ) ) ( not ( = ?auto_886441 ?auto_886449 ) ) ( not ( = ?auto_886441 ?auto_886450 ) ) ( not ( = ?auto_886441 ?auto_886451 ) ) ( not ( = ?auto_886441 ?auto_886452 ) ) ( not ( = ?auto_886441 ?auto_886453 ) ) ( not ( = ?auto_886441 ?auto_886454 ) ) ( not ( = ?auto_886441 ?auto_886455 ) ) ( not ( = ?auto_886441 ?auto_886456 ) ) ( not ( = ?auto_886442 ?auto_886443 ) ) ( not ( = ?auto_886442 ?auto_886444 ) ) ( not ( = ?auto_886442 ?auto_886445 ) ) ( not ( = ?auto_886442 ?auto_886446 ) ) ( not ( = ?auto_886442 ?auto_886447 ) ) ( not ( = ?auto_886442 ?auto_886448 ) ) ( not ( = ?auto_886442 ?auto_886449 ) ) ( not ( = ?auto_886442 ?auto_886450 ) ) ( not ( = ?auto_886442 ?auto_886451 ) ) ( not ( = ?auto_886442 ?auto_886452 ) ) ( not ( = ?auto_886442 ?auto_886453 ) ) ( not ( = ?auto_886442 ?auto_886454 ) ) ( not ( = ?auto_886442 ?auto_886455 ) ) ( not ( = ?auto_886442 ?auto_886456 ) ) ( not ( = ?auto_886443 ?auto_886444 ) ) ( not ( = ?auto_886443 ?auto_886445 ) ) ( not ( = ?auto_886443 ?auto_886446 ) ) ( not ( = ?auto_886443 ?auto_886447 ) ) ( not ( = ?auto_886443 ?auto_886448 ) ) ( not ( = ?auto_886443 ?auto_886449 ) ) ( not ( = ?auto_886443 ?auto_886450 ) ) ( not ( = ?auto_886443 ?auto_886451 ) ) ( not ( = ?auto_886443 ?auto_886452 ) ) ( not ( = ?auto_886443 ?auto_886453 ) ) ( not ( = ?auto_886443 ?auto_886454 ) ) ( not ( = ?auto_886443 ?auto_886455 ) ) ( not ( = ?auto_886443 ?auto_886456 ) ) ( not ( = ?auto_886444 ?auto_886445 ) ) ( not ( = ?auto_886444 ?auto_886446 ) ) ( not ( = ?auto_886444 ?auto_886447 ) ) ( not ( = ?auto_886444 ?auto_886448 ) ) ( not ( = ?auto_886444 ?auto_886449 ) ) ( not ( = ?auto_886444 ?auto_886450 ) ) ( not ( = ?auto_886444 ?auto_886451 ) ) ( not ( = ?auto_886444 ?auto_886452 ) ) ( not ( = ?auto_886444 ?auto_886453 ) ) ( not ( = ?auto_886444 ?auto_886454 ) ) ( not ( = ?auto_886444 ?auto_886455 ) ) ( not ( = ?auto_886444 ?auto_886456 ) ) ( not ( = ?auto_886445 ?auto_886446 ) ) ( not ( = ?auto_886445 ?auto_886447 ) ) ( not ( = ?auto_886445 ?auto_886448 ) ) ( not ( = ?auto_886445 ?auto_886449 ) ) ( not ( = ?auto_886445 ?auto_886450 ) ) ( not ( = ?auto_886445 ?auto_886451 ) ) ( not ( = ?auto_886445 ?auto_886452 ) ) ( not ( = ?auto_886445 ?auto_886453 ) ) ( not ( = ?auto_886445 ?auto_886454 ) ) ( not ( = ?auto_886445 ?auto_886455 ) ) ( not ( = ?auto_886445 ?auto_886456 ) ) ( not ( = ?auto_886446 ?auto_886447 ) ) ( not ( = ?auto_886446 ?auto_886448 ) ) ( not ( = ?auto_886446 ?auto_886449 ) ) ( not ( = ?auto_886446 ?auto_886450 ) ) ( not ( = ?auto_886446 ?auto_886451 ) ) ( not ( = ?auto_886446 ?auto_886452 ) ) ( not ( = ?auto_886446 ?auto_886453 ) ) ( not ( = ?auto_886446 ?auto_886454 ) ) ( not ( = ?auto_886446 ?auto_886455 ) ) ( not ( = ?auto_886446 ?auto_886456 ) ) ( not ( = ?auto_886447 ?auto_886448 ) ) ( not ( = ?auto_886447 ?auto_886449 ) ) ( not ( = ?auto_886447 ?auto_886450 ) ) ( not ( = ?auto_886447 ?auto_886451 ) ) ( not ( = ?auto_886447 ?auto_886452 ) ) ( not ( = ?auto_886447 ?auto_886453 ) ) ( not ( = ?auto_886447 ?auto_886454 ) ) ( not ( = ?auto_886447 ?auto_886455 ) ) ( not ( = ?auto_886447 ?auto_886456 ) ) ( not ( = ?auto_886448 ?auto_886449 ) ) ( not ( = ?auto_886448 ?auto_886450 ) ) ( not ( = ?auto_886448 ?auto_886451 ) ) ( not ( = ?auto_886448 ?auto_886452 ) ) ( not ( = ?auto_886448 ?auto_886453 ) ) ( not ( = ?auto_886448 ?auto_886454 ) ) ( not ( = ?auto_886448 ?auto_886455 ) ) ( not ( = ?auto_886448 ?auto_886456 ) ) ( not ( = ?auto_886449 ?auto_886450 ) ) ( not ( = ?auto_886449 ?auto_886451 ) ) ( not ( = ?auto_886449 ?auto_886452 ) ) ( not ( = ?auto_886449 ?auto_886453 ) ) ( not ( = ?auto_886449 ?auto_886454 ) ) ( not ( = ?auto_886449 ?auto_886455 ) ) ( not ( = ?auto_886449 ?auto_886456 ) ) ( not ( = ?auto_886450 ?auto_886451 ) ) ( not ( = ?auto_886450 ?auto_886452 ) ) ( not ( = ?auto_886450 ?auto_886453 ) ) ( not ( = ?auto_886450 ?auto_886454 ) ) ( not ( = ?auto_886450 ?auto_886455 ) ) ( not ( = ?auto_886450 ?auto_886456 ) ) ( not ( = ?auto_886451 ?auto_886452 ) ) ( not ( = ?auto_886451 ?auto_886453 ) ) ( not ( = ?auto_886451 ?auto_886454 ) ) ( not ( = ?auto_886451 ?auto_886455 ) ) ( not ( = ?auto_886451 ?auto_886456 ) ) ( not ( = ?auto_886452 ?auto_886453 ) ) ( not ( = ?auto_886452 ?auto_886454 ) ) ( not ( = ?auto_886452 ?auto_886455 ) ) ( not ( = ?auto_886452 ?auto_886456 ) ) ( not ( = ?auto_886453 ?auto_886454 ) ) ( not ( = ?auto_886453 ?auto_886455 ) ) ( not ( = ?auto_886453 ?auto_886456 ) ) ( not ( = ?auto_886454 ?auto_886455 ) ) ( not ( = ?auto_886454 ?auto_886456 ) ) ( not ( = ?auto_886455 ?auto_886456 ) ) ( ON ?auto_886454 ?auto_886455 ) ( ON ?auto_886453 ?auto_886454 ) ( ON ?auto_886452 ?auto_886453 ) ( ON ?auto_886451 ?auto_886452 ) ( ON ?auto_886450 ?auto_886451 ) ( ON ?auto_886449 ?auto_886450 ) ( ON ?auto_886448 ?auto_886449 ) ( ON ?auto_886447 ?auto_886448 ) ( ON ?auto_886446 ?auto_886447 ) ( ON ?auto_886445 ?auto_886446 ) ( ON ?auto_886444 ?auto_886445 ) ( CLEAR ?auto_886442 ) ( ON ?auto_886443 ?auto_886444 ) ( CLEAR ?auto_886443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_886440 ?auto_886441 ?auto_886442 ?auto_886443 )
      ( MAKE-16PILE ?auto_886440 ?auto_886441 ?auto_886442 ?auto_886443 ?auto_886444 ?auto_886445 ?auto_886446 ?auto_886447 ?auto_886448 ?auto_886449 ?auto_886450 ?auto_886451 ?auto_886452 ?auto_886453 ?auto_886454 ?auto_886455 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_886506 - BLOCK
      ?auto_886507 - BLOCK
      ?auto_886508 - BLOCK
      ?auto_886509 - BLOCK
      ?auto_886510 - BLOCK
      ?auto_886511 - BLOCK
      ?auto_886512 - BLOCK
      ?auto_886513 - BLOCK
      ?auto_886514 - BLOCK
      ?auto_886515 - BLOCK
      ?auto_886516 - BLOCK
      ?auto_886517 - BLOCK
      ?auto_886518 - BLOCK
      ?auto_886519 - BLOCK
      ?auto_886520 - BLOCK
      ?auto_886521 - BLOCK
    )
    :vars
    (
      ?auto_886522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_886521 ?auto_886522 ) ( ON-TABLE ?auto_886506 ) ( ON ?auto_886507 ?auto_886506 ) ( not ( = ?auto_886506 ?auto_886507 ) ) ( not ( = ?auto_886506 ?auto_886508 ) ) ( not ( = ?auto_886506 ?auto_886509 ) ) ( not ( = ?auto_886506 ?auto_886510 ) ) ( not ( = ?auto_886506 ?auto_886511 ) ) ( not ( = ?auto_886506 ?auto_886512 ) ) ( not ( = ?auto_886506 ?auto_886513 ) ) ( not ( = ?auto_886506 ?auto_886514 ) ) ( not ( = ?auto_886506 ?auto_886515 ) ) ( not ( = ?auto_886506 ?auto_886516 ) ) ( not ( = ?auto_886506 ?auto_886517 ) ) ( not ( = ?auto_886506 ?auto_886518 ) ) ( not ( = ?auto_886506 ?auto_886519 ) ) ( not ( = ?auto_886506 ?auto_886520 ) ) ( not ( = ?auto_886506 ?auto_886521 ) ) ( not ( = ?auto_886506 ?auto_886522 ) ) ( not ( = ?auto_886507 ?auto_886508 ) ) ( not ( = ?auto_886507 ?auto_886509 ) ) ( not ( = ?auto_886507 ?auto_886510 ) ) ( not ( = ?auto_886507 ?auto_886511 ) ) ( not ( = ?auto_886507 ?auto_886512 ) ) ( not ( = ?auto_886507 ?auto_886513 ) ) ( not ( = ?auto_886507 ?auto_886514 ) ) ( not ( = ?auto_886507 ?auto_886515 ) ) ( not ( = ?auto_886507 ?auto_886516 ) ) ( not ( = ?auto_886507 ?auto_886517 ) ) ( not ( = ?auto_886507 ?auto_886518 ) ) ( not ( = ?auto_886507 ?auto_886519 ) ) ( not ( = ?auto_886507 ?auto_886520 ) ) ( not ( = ?auto_886507 ?auto_886521 ) ) ( not ( = ?auto_886507 ?auto_886522 ) ) ( not ( = ?auto_886508 ?auto_886509 ) ) ( not ( = ?auto_886508 ?auto_886510 ) ) ( not ( = ?auto_886508 ?auto_886511 ) ) ( not ( = ?auto_886508 ?auto_886512 ) ) ( not ( = ?auto_886508 ?auto_886513 ) ) ( not ( = ?auto_886508 ?auto_886514 ) ) ( not ( = ?auto_886508 ?auto_886515 ) ) ( not ( = ?auto_886508 ?auto_886516 ) ) ( not ( = ?auto_886508 ?auto_886517 ) ) ( not ( = ?auto_886508 ?auto_886518 ) ) ( not ( = ?auto_886508 ?auto_886519 ) ) ( not ( = ?auto_886508 ?auto_886520 ) ) ( not ( = ?auto_886508 ?auto_886521 ) ) ( not ( = ?auto_886508 ?auto_886522 ) ) ( not ( = ?auto_886509 ?auto_886510 ) ) ( not ( = ?auto_886509 ?auto_886511 ) ) ( not ( = ?auto_886509 ?auto_886512 ) ) ( not ( = ?auto_886509 ?auto_886513 ) ) ( not ( = ?auto_886509 ?auto_886514 ) ) ( not ( = ?auto_886509 ?auto_886515 ) ) ( not ( = ?auto_886509 ?auto_886516 ) ) ( not ( = ?auto_886509 ?auto_886517 ) ) ( not ( = ?auto_886509 ?auto_886518 ) ) ( not ( = ?auto_886509 ?auto_886519 ) ) ( not ( = ?auto_886509 ?auto_886520 ) ) ( not ( = ?auto_886509 ?auto_886521 ) ) ( not ( = ?auto_886509 ?auto_886522 ) ) ( not ( = ?auto_886510 ?auto_886511 ) ) ( not ( = ?auto_886510 ?auto_886512 ) ) ( not ( = ?auto_886510 ?auto_886513 ) ) ( not ( = ?auto_886510 ?auto_886514 ) ) ( not ( = ?auto_886510 ?auto_886515 ) ) ( not ( = ?auto_886510 ?auto_886516 ) ) ( not ( = ?auto_886510 ?auto_886517 ) ) ( not ( = ?auto_886510 ?auto_886518 ) ) ( not ( = ?auto_886510 ?auto_886519 ) ) ( not ( = ?auto_886510 ?auto_886520 ) ) ( not ( = ?auto_886510 ?auto_886521 ) ) ( not ( = ?auto_886510 ?auto_886522 ) ) ( not ( = ?auto_886511 ?auto_886512 ) ) ( not ( = ?auto_886511 ?auto_886513 ) ) ( not ( = ?auto_886511 ?auto_886514 ) ) ( not ( = ?auto_886511 ?auto_886515 ) ) ( not ( = ?auto_886511 ?auto_886516 ) ) ( not ( = ?auto_886511 ?auto_886517 ) ) ( not ( = ?auto_886511 ?auto_886518 ) ) ( not ( = ?auto_886511 ?auto_886519 ) ) ( not ( = ?auto_886511 ?auto_886520 ) ) ( not ( = ?auto_886511 ?auto_886521 ) ) ( not ( = ?auto_886511 ?auto_886522 ) ) ( not ( = ?auto_886512 ?auto_886513 ) ) ( not ( = ?auto_886512 ?auto_886514 ) ) ( not ( = ?auto_886512 ?auto_886515 ) ) ( not ( = ?auto_886512 ?auto_886516 ) ) ( not ( = ?auto_886512 ?auto_886517 ) ) ( not ( = ?auto_886512 ?auto_886518 ) ) ( not ( = ?auto_886512 ?auto_886519 ) ) ( not ( = ?auto_886512 ?auto_886520 ) ) ( not ( = ?auto_886512 ?auto_886521 ) ) ( not ( = ?auto_886512 ?auto_886522 ) ) ( not ( = ?auto_886513 ?auto_886514 ) ) ( not ( = ?auto_886513 ?auto_886515 ) ) ( not ( = ?auto_886513 ?auto_886516 ) ) ( not ( = ?auto_886513 ?auto_886517 ) ) ( not ( = ?auto_886513 ?auto_886518 ) ) ( not ( = ?auto_886513 ?auto_886519 ) ) ( not ( = ?auto_886513 ?auto_886520 ) ) ( not ( = ?auto_886513 ?auto_886521 ) ) ( not ( = ?auto_886513 ?auto_886522 ) ) ( not ( = ?auto_886514 ?auto_886515 ) ) ( not ( = ?auto_886514 ?auto_886516 ) ) ( not ( = ?auto_886514 ?auto_886517 ) ) ( not ( = ?auto_886514 ?auto_886518 ) ) ( not ( = ?auto_886514 ?auto_886519 ) ) ( not ( = ?auto_886514 ?auto_886520 ) ) ( not ( = ?auto_886514 ?auto_886521 ) ) ( not ( = ?auto_886514 ?auto_886522 ) ) ( not ( = ?auto_886515 ?auto_886516 ) ) ( not ( = ?auto_886515 ?auto_886517 ) ) ( not ( = ?auto_886515 ?auto_886518 ) ) ( not ( = ?auto_886515 ?auto_886519 ) ) ( not ( = ?auto_886515 ?auto_886520 ) ) ( not ( = ?auto_886515 ?auto_886521 ) ) ( not ( = ?auto_886515 ?auto_886522 ) ) ( not ( = ?auto_886516 ?auto_886517 ) ) ( not ( = ?auto_886516 ?auto_886518 ) ) ( not ( = ?auto_886516 ?auto_886519 ) ) ( not ( = ?auto_886516 ?auto_886520 ) ) ( not ( = ?auto_886516 ?auto_886521 ) ) ( not ( = ?auto_886516 ?auto_886522 ) ) ( not ( = ?auto_886517 ?auto_886518 ) ) ( not ( = ?auto_886517 ?auto_886519 ) ) ( not ( = ?auto_886517 ?auto_886520 ) ) ( not ( = ?auto_886517 ?auto_886521 ) ) ( not ( = ?auto_886517 ?auto_886522 ) ) ( not ( = ?auto_886518 ?auto_886519 ) ) ( not ( = ?auto_886518 ?auto_886520 ) ) ( not ( = ?auto_886518 ?auto_886521 ) ) ( not ( = ?auto_886518 ?auto_886522 ) ) ( not ( = ?auto_886519 ?auto_886520 ) ) ( not ( = ?auto_886519 ?auto_886521 ) ) ( not ( = ?auto_886519 ?auto_886522 ) ) ( not ( = ?auto_886520 ?auto_886521 ) ) ( not ( = ?auto_886520 ?auto_886522 ) ) ( not ( = ?auto_886521 ?auto_886522 ) ) ( ON ?auto_886520 ?auto_886521 ) ( ON ?auto_886519 ?auto_886520 ) ( ON ?auto_886518 ?auto_886519 ) ( ON ?auto_886517 ?auto_886518 ) ( ON ?auto_886516 ?auto_886517 ) ( ON ?auto_886515 ?auto_886516 ) ( ON ?auto_886514 ?auto_886515 ) ( ON ?auto_886513 ?auto_886514 ) ( ON ?auto_886512 ?auto_886513 ) ( ON ?auto_886511 ?auto_886512 ) ( ON ?auto_886510 ?auto_886511 ) ( ON ?auto_886509 ?auto_886510 ) ( CLEAR ?auto_886507 ) ( ON ?auto_886508 ?auto_886509 ) ( CLEAR ?auto_886508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_886506 ?auto_886507 ?auto_886508 )
      ( MAKE-16PILE ?auto_886506 ?auto_886507 ?auto_886508 ?auto_886509 ?auto_886510 ?auto_886511 ?auto_886512 ?auto_886513 ?auto_886514 ?auto_886515 ?auto_886516 ?auto_886517 ?auto_886518 ?auto_886519 ?auto_886520 ?auto_886521 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_886572 - BLOCK
      ?auto_886573 - BLOCK
      ?auto_886574 - BLOCK
      ?auto_886575 - BLOCK
      ?auto_886576 - BLOCK
      ?auto_886577 - BLOCK
      ?auto_886578 - BLOCK
      ?auto_886579 - BLOCK
      ?auto_886580 - BLOCK
      ?auto_886581 - BLOCK
      ?auto_886582 - BLOCK
      ?auto_886583 - BLOCK
      ?auto_886584 - BLOCK
      ?auto_886585 - BLOCK
      ?auto_886586 - BLOCK
      ?auto_886587 - BLOCK
    )
    :vars
    (
      ?auto_886588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_886587 ?auto_886588 ) ( ON-TABLE ?auto_886572 ) ( not ( = ?auto_886572 ?auto_886573 ) ) ( not ( = ?auto_886572 ?auto_886574 ) ) ( not ( = ?auto_886572 ?auto_886575 ) ) ( not ( = ?auto_886572 ?auto_886576 ) ) ( not ( = ?auto_886572 ?auto_886577 ) ) ( not ( = ?auto_886572 ?auto_886578 ) ) ( not ( = ?auto_886572 ?auto_886579 ) ) ( not ( = ?auto_886572 ?auto_886580 ) ) ( not ( = ?auto_886572 ?auto_886581 ) ) ( not ( = ?auto_886572 ?auto_886582 ) ) ( not ( = ?auto_886572 ?auto_886583 ) ) ( not ( = ?auto_886572 ?auto_886584 ) ) ( not ( = ?auto_886572 ?auto_886585 ) ) ( not ( = ?auto_886572 ?auto_886586 ) ) ( not ( = ?auto_886572 ?auto_886587 ) ) ( not ( = ?auto_886572 ?auto_886588 ) ) ( not ( = ?auto_886573 ?auto_886574 ) ) ( not ( = ?auto_886573 ?auto_886575 ) ) ( not ( = ?auto_886573 ?auto_886576 ) ) ( not ( = ?auto_886573 ?auto_886577 ) ) ( not ( = ?auto_886573 ?auto_886578 ) ) ( not ( = ?auto_886573 ?auto_886579 ) ) ( not ( = ?auto_886573 ?auto_886580 ) ) ( not ( = ?auto_886573 ?auto_886581 ) ) ( not ( = ?auto_886573 ?auto_886582 ) ) ( not ( = ?auto_886573 ?auto_886583 ) ) ( not ( = ?auto_886573 ?auto_886584 ) ) ( not ( = ?auto_886573 ?auto_886585 ) ) ( not ( = ?auto_886573 ?auto_886586 ) ) ( not ( = ?auto_886573 ?auto_886587 ) ) ( not ( = ?auto_886573 ?auto_886588 ) ) ( not ( = ?auto_886574 ?auto_886575 ) ) ( not ( = ?auto_886574 ?auto_886576 ) ) ( not ( = ?auto_886574 ?auto_886577 ) ) ( not ( = ?auto_886574 ?auto_886578 ) ) ( not ( = ?auto_886574 ?auto_886579 ) ) ( not ( = ?auto_886574 ?auto_886580 ) ) ( not ( = ?auto_886574 ?auto_886581 ) ) ( not ( = ?auto_886574 ?auto_886582 ) ) ( not ( = ?auto_886574 ?auto_886583 ) ) ( not ( = ?auto_886574 ?auto_886584 ) ) ( not ( = ?auto_886574 ?auto_886585 ) ) ( not ( = ?auto_886574 ?auto_886586 ) ) ( not ( = ?auto_886574 ?auto_886587 ) ) ( not ( = ?auto_886574 ?auto_886588 ) ) ( not ( = ?auto_886575 ?auto_886576 ) ) ( not ( = ?auto_886575 ?auto_886577 ) ) ( not ( = ?auto_886575 ?auto_886578 ) ) ( not ( = ?auto_886575 ?auto_886579 ) ) ( not ( = ?auto_886575 ?auto_886580 ) ) ( not ( = ?auto_886575 ?auto_886581 ) ) ( not ( = ?auto_886575 ?auto_886582 ) ) ( not ( = ?auto_886575 ?auto_886583 ) ) ( not ( = ?auto_886575 ?auto_886584 ) ) ( not ( = ?auto_886575 ?auto_886585 ) ) ( not ( = ?auto_886575 ?auto_886586 ) ) ( not ( = ?auto_886575 ?auto_886587 ) ) ( not ( = ?auto_886575 ?auto_886588 ) ) ( not ( = ?auto_886576 ?auto_886577 ) ) ( not ( = ?auto_886576 ?auto_886578 ) ) ( not ( = ?auto_886576 ?auto_886579 ) ) ( not ( = ?auto_886576 ?auto_886580 ) ) ( not ( = ?auto_886576 ?auto_886581 ) ) ( not ( = ?auto_886576 ?auto_886582 ) ) ( not ( = ?auto_886576 ?auto_886583 ) ) ( not ( = ?auto_886576 ?auto_886584 ) ) ( not ( = ?auto_886576 ?auto_886585 ) ) ( not ( = ?auto_886576 ?auto_886586 ) ) ( not ( = ?auto_886576 ?auto_886587 ) ) ( not ( = ?auto_886576 ?auto_886588 ) ) ( not ( = ?auto_886577 ?auto_886578 ) ) ( not ( = ?auto_886577 ?auto_886579 ) ) ( not ( = ?auto_886577 ?auto_886580 ) ) ( not ( = ?auto_886577 ?auto_886581 ) ) ( not ( = ?auto_886577 ?auto_886582 ) ) ( not ( = ?auto_886577 ?auto_886583 ) ) ( not ( = ?auto_886577 ?auto_886584 ) ) ( not ( = ?auto_886577 ?auto_886585 ) ) ( not ( = ?auto_886577 ?auto_886586 ) ) ( not ( = ?auto_886577 ?auto_886587 ) ) ( not ( = ?auto_886577 ?auto_886588 ) ) ( not ( = ?auto_886578 ?auto_886579 ) ) ( not ( = ?auto_886578 ?auto_886580 ) ) ( not ( = ?auto_886578 ?auto_886581 ) ) ( not ( = ?auto_886578 ?auto_886582 ) ) ( not ( = ?auto_886578 ?auto_886583 ) ) ( not ( = ?auto_886578 ?auto_886584 ) ) ( not ( = ?auto_886578 ?auto_886585 ) ) ( not ( = ?auto_886578 ?auto_886586 ) ) ( not ( = ?auto_886578 ?auto_886587 ) ) ( not ( = ?auto_886578 ?auto_886588 ) ) ( not ( = ?auto_886579 ?auto_886580 ) ) ( not ( = ?auto_886579 ?auto_886581 ) ) ( not ( = ?auto_886579 ?auto_886582 ) ) ( not ( = ?auto_886579 ?auto_886583 ) ) ( not ( = ?auto_886579 ?auto_886584 ) ) ( not ( = ?auto_886579 ?auto_886585 ) ) ( not ( = ?auto_886579 ?auto_886586 ) ) ( not ( = ?auto_886579 ?auto_886587 ) ) ( not ( = ?auto_886579 ?auto_886588 ) ) ( not ( = ?auto_886580 ?auto_886581 ) ) ( not ( = ?auto_886580 ?auto_886582 ) ) ( not ( = ?auto_886580 ?auto_886583 ) ) ( not ( = ?auto_886580 ?auto_886584 ) ) ( not ( = ?auto_886580 ?auto_886585 ) ) ( not ( = ?auto_886580 ?auto_886586 ) ) ( not ( = ?auto_886580 ?auto_886587 ) ) ( not ( = ?auto_886580 ?auto_886588 ) ) ( not ( = ?auto_886581 ?auto_886582 ) ) ( not ( = ?auto_886581 ?auto_886583 ) ) ( not ( = ?auto_886581 ?auto_886584 ) ) ( not ( = ?auto_886581 ?auto_886585 ) ) ( not ( = ?auto_886581 ?auto_886586 ) ) ( not ( = ?auto_886581 ?auto_886587 ) ) ( not ( = ?auto_886581 ?auto_886588 ) ) ( not ( = ?auto_886582 ?auto_886583 ) ) ( not ( = ?auto_886582 ?auto_886584 ) ) ( not ( = ?auto_886582 ?auto_886585 ) ) ( not ( = ?auto_886582 ?auto_886586 ) ) ( not ( = ?auto_886582 ?auto_886587 ) ) ( not ( = ?auto_886582 ?auto_886588 ) ) ( not ( = ?auto_886583 ?auto_886584 ) ) ( not ( = ?auto_886583 ?auto_886585 ) ) ( not ( = ?auto_886583 ?auto_886586 ) ) ( not ( = ?auto_886583 ?auto_886587 ) ) ( not ( = ?auto_886583 ?auto_886588 ) ) ( not ( = ?auto_886584 ?auto_886585 ) ) ( not ( = ?auto_886584 ?auto_886586 ) ) ( not ( = ?auto_886584 ?auto_886587 ) ) ( not ( = ?auto_886584 ?auto_886588 ) ) ( not ( = ?auto_886585 ?auto_886586 ) ) ( not ( = ?auto_886585 ?auto_886587 ) ) ( not ( = ?auto_886585 ?auto_886588 ) ) ( not ( = ?auto_886586 ?auto_886587 ) ) ( not ( = ?auto_886586 ?auto_886588 ) ) ( not ( = ?auto_886587 ?auto_886588 ) ) ( ON ?auto_886586 ?auto_886587 ) ( ON ?auto_886585 ?auto_886586 ) ( ON ?auto_886584 ?auto_886585 ) ( ON ?auto_886583 ?auto_886584 ) ( ON ?auto_886582 ?auto_886583 ) ( ON ?auto_886581 ?auto_886582 ) ( ON ?auto_886580 ?auto_886581 ) ( ON ?auto_886579 ?auto_886580 ) ( ON ?auto_886578 ?auto_886579 ) ( ON ?auto_886577 ?auto_886578 ) ( ON ?auto_886576 ?auto_886577 ) ( ON ?auto_886575 ?auto_886576 ) ( ON ?auto_886574 ?auto_886575 ) ( CLEAR ?auto_886572 ) ( ON ?auto_886573 ?auto_886574 ) ( CLEAR ?auto_886573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_886572 ?auto_886573 )
      ( MAKE-16PILE ?auto_886572 ?auto_886573 ?auto_886574 ?auto_886575 ?auto_886576 ?auto_886577 ?auto_886578 ?auto_886579 ?auto_886580 ?auto_886581 ?auto_886582 ?auto_886583 ?auto_886584 ?auto_886585 ?auto_886586 ?auto_886587 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_886638 - BLOCK
      ?auto_886639 - BLOCK
      ?auto_886640 - BLOCK
      ?auto_886641 - BLOCK
      ?auto_886642 - BLOCK
      ?auto_886643 - BLOCK
      ?auto_886644 - BLOCK
      ?auto_886645 - BLOCK
      ?auto_886646 - BLOCK
      ?auto_886647 - BLOCK
      ?auto_886648 - BLOCK
      ?auto_886649 - BLOCK
      ?auto_886650 - BLOCK
      ?auto_886651 - BLOCK
      ?auto_886652 - BLOCK
      ?auto_886653 - BLOCK
    )
    :vars
    (
      ?auto_886654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_886653 ?auto_886654 ) ( not ( = ?auto_886638 ?auto_886639 ) ) ( not ( = ?auto_886638 ?auto_886640 ) ) ( not ( = ?auto_886638 ?auto_886641 ) ) ( not ( = ?auto_886638 ?auto_886642 ) ) ( not ( = ?auto_886638 ?auto_886643 ) ) ( not ( = ?auto_886638 ?auto_886644 ) ) ( not ( = ?auto_886638 ?auto_886645 ) ) ( not ( = ?auto_886638 ?auto_886646 ) ) ( not ( = ?auto_886638 ?auto_886647 ) ) ( not ( = ?auto_886638 ?auto_886648 ) ) ( not ( = ?auto_886638 ?auto_886649 ) ) ( not ( = ?auto_886638 ?auto_886650 ) ) ( not ( = ?auto_886638 ?auto_886651 ) ) ( not ( = ?auto_886638 ?auto_886652 ) ) ( not ( = ?auto_886638 ?auto_886653 ) ) ( not ( = ?auto_886638 ?auto_886654 ) ) ( not ( = ?auto_886639 ?auto_886640 ) ) ( not ( = ?auto_886639 ?auto_886641 ) ) ( not ( = ?auto_886639 ?auto_886642 ) ) ( not ( = ?auto_886639 ?auto_886643 ) ) ( not ( = ?auto_886639 ?auto_886644 ) ) ( not ( = ?auto_886639 ?auto_886645 ) ) ( not ( = ?auto_886639 ?auto_886646 ) ) ( not ( = ?auto_886639 ?auto_886647 ) ) ( not ( = ?auto_886639 ?auto_886648 ) ) ( not ( = ?auto_886639 ?auto_886649 ) ) ( not ( = ?auto_886639 ?auto_886650 ) ) ( not ( = ?auto_886639 ?auto_886651 ) ) ( not ( = ?auto_886639 ?auto_886652 ) ) ( not ( = ?auto_886639 ?auto_886653 ) ) ( not ( = ?auto_886639 ?auto_886654 ) ) ( not ( = ?auto_886640 ?auto_886641 ) ) ( not ( = ?auto_886640 ?auto_886642 ) ) ( not ( = ?auto_886640 ?auto_886643 ) ) ( not ( = ?auto_886640 ?auto_886644 ) ) ( not ( = ?auto_886640 ?auto_886645 ) ) ( not ( = ?auto_886640 ?auto_886646 ) ) ( not ( = ?auto_886640 ?auto_886647 ) ) ( not ( = ?auto_886640 ?auto_886648 ) ) ( not ( = ?auto_886640 ?auto_886649 ) ) ( not ( = ?auto_886640 ?auto_886650 ) ) ( not ( = ?auto_886640 ?auto_886651 ) ) ( not ( = ?auto_886640 ?auto_886652 ) ) ( not ( = ?auto_886640 ?auto_886653 ) ) ( not ( = ?auto_886640 ?auto_886654 ) ) ( not ( = ?auto_886641 ?auto_886642 ) ) ( not ( = ?auto_886641 ?auto_886643 ) ) ( not ( = ?auto_886641 ?auto_886644 ) ) ( not ( = ?auto_886641 ?auto_886645 ) ) ( not ( = ?auto_886641 ?auto_886646 ) ) ( not ( = ?auto_886641 ?auto_886647 ) ) ( not ( = ?auto_886641 ?auto_886648 ) ) ( not ( = ?auto_886641 ?auto_886649 ) ) ( not ( = ?auto_886641 ?auto_886650 ) ) ( not ( = ?auto_886641 ?auto_886651 ) ) ( not ( = ?auto_886641 ?auto_886652 ) ) ( not ( = ?auto_886641 ?auto_886653 ) ) ( not ( = ?auto_886641 ?auto_886654 ) ) ( not ( = ?auto_886642 ?auto_886643 ) ) ( not ( = ?auto_886642 ?auto_886644 ) ) ( not ( = ?auto_886642 ?auto_886645 ) ) ( not ( = ?auto_886642 ?auto_886646 ) ) ( not ( = ?auto_886642 ?auto_886647 ) ) ( not ( = ?auto_886642 ?auto_886648 ) ) ( not ( = ?auto_886642 ?auto_886649 ) ) ( not ( = ?auto_886642 ?auto_886650 ) ) ( not ( = ?auto_886642 ?auto_886651 ) ) ( not ( = ?auto_886642 ?auto_886652 ) ) ( not ( = ?auto_886642 ?auto_886653 ) ) ( not ( = ?auto_886642 ?auto_886654 ) ) ( not ( = ?auto_886643 ?auto_886644 ) ) ( not ( = ?auto_886643 ?auto_886645 ) ) ( not ( = ?auto_886643 ?auto_886646 ) ) ( not ( = ?auto_886643 ?auto_886647 ) ) ( not ( = ?auto_886643 ?auto_886648 ) ) ( not ( = ?auto_886643 ?auto_886649 ) ) ( not ( = ?auto_886643 ?auto_886650 ) ) ( not ( = ?auto_886643 ?auto_886651 ) ) ( not ( = ?auto_886643 ?auto_886652 ) ) ( not ( = ?auto_886643 ?auto_886653 ) ) ( not ( = ?auto_886643 ?auto_886654 ) ) ( not ( = ?auto_886644 ?auto_886645 ) ) ( not ( = ?auto_886644 ?auto_886646 ) ) ( not ( = ?auto_886644 ?auto_886647 ) ) ( not ( = ?auto_886644 ?auto_886648 ) ) ( not ( = ?auto_886644 ?auto_886649 ) ) ( not ( = ?auto_886644 ?auto_886650 ) ) ( not ( = ?auto_886644 ?auto_886651 ) ) ( not ( = ?auto_886644 ?auto_886652 ) ) ( not ( = ?auto_886644 ?auto_886653 ) ) ( not ( = ?auto_886644 ?auto_886654 ) ) ( not ( = ?auto_886645 ?auto_886646 ) ) ( not ( = ?auto_886645 ?auto_886647 ) ) ( not ( = ?auto_886645 ?auto_886648 ) ) ( not ( = ?auto_886645 ?auto_886649 ) ) ( not ( = ?auto_886645 ?auto_886650 ) ) ( not ( = ?auto_886645 ?auto_886651 ) ) ( not ( = ?auto_886645 ?auto_886652 ) ) ( not ( = ?auto_886645 ?auto_886653 ) ) ( not ( = ?auto_886645 ?auto_886654 ) ) ( not ( = ?auto_886646 ?auto_886647 ) ) ( not ( = ?auto_886646 ?auto_886648 ) ) ( not ( = ?auto_886646 ?auto_886649 ) ) ( not ( = ?auto_886646 ?auto_886650 ) ) ( not ( = ?auto_886646 ?auto_886651 ) ) ( not ( = ?auto_886646 ?auto_886652 ) ) ( not ( = ?auto_886646 ?auto_886653 ) ) ( not ( = ?auto_886646 ?auto_886654 ) ) ( not ( = ?auto_886647 ?auto_886648 ) ) ( not ( = ?auto_886647 ?auto_886649 ) ) ( not ( = ?auto_886647 ?auto_886650 ) ) ( not ( = ?auto_886647 ?auto_886651 ) ) ( not ( = ?auto_886647 ?auto_886652 ) ) ( not ( = ?auto_886647 ?auto_886653 ) ) ( not ( = ?auto_886647 ?auto_886654 ) ) ( not ( = ?auto_886648 ?auto_886649 ) ) ( not ( = ?auto_886648 ?auto_886650 ) ) ( not ( = ?auto_886648 ?auto_886651 ) ) ( not ( = ?auto_886648 ?auto_886652 ) ) ( not ( = ?auto_886648 ?auto_886653 ) ) ( not ( = ?auto_886648 ?auto_886654 ) ) ( not ( = ?auto_886649 ?auto_886650 ) ) ( not ( = ?auto_886649 ?auto_886651 ) ) ( not ( = ?auto_886649 ?auto_886652 ) ) ( not ( = ?auto_886649 ?auto_886653 ) ) ( not ( = ?auto_886649 ?auto_886654 ) ) ( not ( = ?auto_886650 ?auto_886651 ) ) ( not ( = ?auto_886650 ?auto_886652 ) ) ( not ( = ?auto_886650 ?auto_886653 ) ) ( not ( = ?auto_886650 ?auto_886654 ) ) ( not ( = ?auto_886651 ?auto_886652 ) ) ( not ( = ?auto_886651 ?auto_886653 ) ) ( not ( = ?auto_886651 ?auto_886654 ) ) ( not ( = ?auto_886652 ?auto_886653 ) ) ( not ( = ?auto_886652 ?auto_886654 ) ) ( not ( = ?auto_886653 ?auto_886654 ) ) ( ON ?auto_886652 ?auto_886653 ) ( ON ?auto_886651 ?auto_886652 ) ( ON ?auto_886650 ?auto_886651 ) ( ON ?auto_886649 ?auto_886650 ) ( ON ?auto_886648 ?auto_886649 ) ( ON ?auto_886647 ?auto_886648 ) ( ON ?auto_886646 ?auto_886647 ) ( ON ?auto_886645 ?auto_886646 ) ( ON ?auto_886644 ?auto_886645 ) ( ON ?auto_886643 ?auto_886644 ) ( ON ?auto_886642 ?auto_886643 ) ( ON ?auto_886641 ?auto_886642 ) ( ON ?auto_886640 ?auto_886641 ) ( ON ?auto_886639 ?auto_886640 ) ( ON ?auto_886638 ?auto_886639 ) ( CLEAR ?auto_886638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_886638 )
      ( MAKE-16PILE ?auto_886638 ?auto_886639 ?auto_886640 ?auto_886641 ?auto_886642 ?auto_886643 ?auto_886644 ?auto_886645 ?auto_886646 ?auto_886647 ?auto_886648 ?auto_886649 ?auto_886650 ?auto_886651 ?auto_886652 ?auto_886653 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_886705 - BLOCK
      ?auto_886706 - BLOCK
      ?auto_886707 - BLOCK
      ?auto_886708 - BLOCK
      ?auto_886709 - BLOCK
      ?auto_886710 - BLOCK
      ?auto_886711 - BLOCK
      ?auto_886712 - BLOCK
      ?auto_886713 - BLOCK
      ?auto_886714 - BLOCK
      ?auto_886715 - BLOCK
      ?auto_886716 - BLOCK
      ?auto_886717 - BLOCK
      ?auto_886718 - BLOCK
      ?auto_886719 - BLOCK
      ?auto_886720 - BLOCK
      ?auto_886721 - BLOCK
    )
    :vars
    (
      ?auto_886722 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_886720 ) ( ON ?auto_886721 ?auto_886722 ) ( CLEAR ?auto_886721 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_886705 ) ( ON ?auto_886706 ?auto_886705 ) ( ON ?auto_886707 ?auto_886706 ) ( ON ?auto_886708 ?auto_886707 ) ( ON ?auto_886709 ?auto_886708 ) ( ON ?auto_886710 ?auto_886709 ) ( ON ?auto_886711 ?auto_886710 ) ( ON ?auto_886712 ?auto_886711 ) ( ON ?auto_886713 ?auto_886712 ) ( ON ?auto_886714 ?auto_886713 ) ( ON ?auto_886715 ?auto_886714 ) ( ON ?auto_886716 ?auto_886715 ) ( ON ?auto_886717 ?auto_886716 ) ( ON ?auto_886718 ?auto_886717 ) ( ON ?auto_886719 ?auto_886718 ) ( ON ?auto_886720 ?auto_886719 ) ( not ( = ?auto_886705 ?auto_886706 ) ) ( not ( = ?auto_886705 ?auto_886707 ) ) ( not ( = ?auto_886705 ?auto_886708 ) ) ( not ( = ?auto_886705 ?auto_886709 ) ) ( not ( = ?auto_886705 ?auto_886710 ) ) ( not ( = ?auto_886705 ?auto_886711 ) ) ( not ( = ?auto_886705 ?auto_886712 ) ) ( not ( = ?auto_886705 ?auto_886713 ) ) ( not ( = ?auto_886705 ?auto_886714 ) ) ( not ( = ?auto_886705 ?auto_886715 ) ) ( not ( = ?auto_886705 ?auto_886716 ) ) ( not ( = ?auto_886705 ?auto_886717 ) ) ( not ( = ?auto_886705 ?auto_886718 ) ) ( not ( = ?auto_886705 ?auto_886719 ) ) ( not ( = ?auto_886705 ?auto_886720 ) ) ( not ( = ?auto_886705 ?auto_886721 ) ) ( not ( = ?auto_886705 ?auto_886722 ) ) ( not ( = ?auto_886706 ?auto_886707 ) ) ( not ( = ?auto_886706 ?auto_886708 ) ) ( not ( = ?auto_886706 ?auto_886709 ) ) ( not ( = ?auto_886706 ?auto_886710 ) ) ( not ( = ?auto_886706 ?auto_886711 ) ) ( not ( = ?auto_886706 ?auto_886712 ) ) ( not ( = ?auto_886706 ?auto_886713 ) ) ( not ( = ?auto_886706 ?auto_886714 ) ) ( not ( = ?auto_886706 ?auto_886715 ) ) ( not ( = ?auto_886706 ?auto_886716 ) ) ( not ( = ?auto_886706 ?auto_886717 ) ) ( not ( = ?auto_886706 ?auto_886718 ) ) ( not ( = ?auto_886706 ?auto_886719 ) ) ( not ( = ?auto_886706 ?auto_886720 ) ) ( not ( = ?auto_886706 ?auto_886721 ) ) ( not ( = ?auto_886706 ?auto_886722 ) ) ( not ( = ?auto_886707 ?auto_886708 ) ) ( not ( = ?auto_886707 ?auto_886709 ) ) ( not ( = ?auto_886707 ?auto_886710 ) ) ( not ( = ?auto_886707 ?auto_886711 ) ) ( not ( = ?auto_886707 ?auto_886712 ) ) ( not ( = ?auto_886707 ?auto_886713 ) ) ( not ( = ?auto_886707 ?auto_886714 ) ) ( not ( = ?auto_886707 ?auto_886715 ) ) ( not ( = ?auto_886707 ?auto_886716 ) ) ( not ( = ?auto_886707 ?auto_886717 ) ) ( not ( = ?auto_886707 ?auto_886718 ) ) ( not ( = ?auto_886707 ?auto_886719 ) ) ( not ( = ?auto_886707 ?auto_886720 ) ) ( not ( = ?auto_886707 ?auto_886721 ) ) ( not ( = ?auto_886707 ?auto_886722 ) ) ( not ( = ?auto_886708 ?auto_886709 ) ) ( not ( = ?auto_886708 ?auto_886710 ) ) ( not ( = ?auto_886708 ?auto_886711 ) ) ( not ( = ?auto_886708 ?auto_886712 ) ) ( not ( = ?auto_886708 ?auto_886713 ) ) ( not ( = ?auto_886708 ?auto_886714 ) ) ( not ( = ?auto_886708 ?auto_886715 ) ) ( not ( = ?auto_886708 ?auto_886716 ) ) ( not ( = ?auto_886708 ?auto_886717 ) ) ( not ( = ?auto_886708 ?auto_886718 ) ) ( not ( = ?auto_886708 ?auto_886719 ) ) ( not ( = ?auto_886708 ?auto_886720 ) ) ( not ( = ?auto_886708 ?auto_886721 ) ) ( not ( = ?auto_886708 ?auto_886722 ) ) ( not ( = ?auto_886709 ?auto_886710 ) ) ( not ( = ?auto_886709 ?auto_886711 ) ) ( not ( = ?auto_886709 ?auto_886712 ) ) ( not ( = ?auto_886709 ?auto_886713 ) ) ( not ( = ?auto_886709 ?auto_886714 ) ) ( not ( = ?auto_886709 ?auto_886715 ) ) ( not ( = ?auto_886709 ?auto_886716 ) ) ( not ( = ?auto_886709 ?auto_886717 ) ) ( not ( = ?auto_886709 ?auto_886718 ) ) ( not ( = ?auto_886709 ?auto_886719 ) ) ( not ( = ?auto_886709 ?auto_886720 ) ) ( not ( = ?auto_886709 ?auto_886721 ) ) ( not ( = ?auto_886709 ?auto_886722 ) ) ( not ( = ?auto_886710 ?auto_886711 ) ) ( not ( = ?auto_886710 ?auto_886712 ) ) ( not ( = ?auto_886710 ?auto_886713 ) ) ( not ( = ?auto_886710 ?auto_886714 ) ) ( not ( = ?auto_886710 ?auto_886715 ) ) ( not ( = ?auto_886710 ?auto_886716 ) ) ( not ( = ?auto_886710 ?auto_886717 ) ) ( not ( = ?auto_886710 ?auto_886718 ) ) ( not ( = ?auto_886710 ?auto_886719 ) ) ( not ( = ?auto_886710 ?auto_886720 ) ) ( not ( = ?auto_886710 ?auto_886721 ) ) ( not ( = ?auto_886710 ?auto_886722 ) ) ( not ( = ?auto_886711 ?auto_886712 ) ) ( not ( = ?auto_886711 ?auto_886713 ) ) ( not ( = ?auto_886711 ?auto_886714 ) ) ( not ( = ?auto_886711 ?auto_886715 ) ) ( not ( = ?auto_886711 ?auto_886716 ) ) ( not ( = ?auto_886711 ?auto_886717 ) ) ( not ( = ?auto_886711 ?auto_886718 ) ) ( not ( = ?auto_886711 ?auto_886719 ) ) ( not ( = ?auto_886711 ?auto_886720 ) ) ( not ( = ?auto_886711 ?auto_886721 ) ) ( not ( = ?auto_886711 ?auto_886722 ) ) ( not ( = ?auto_886712 ?auto_886713 ) ) ( not ( = ?auto_886712 ?auto_886714 ) ) ( not ( = ?auto_886712 ?auto_886715 ) ) ( not ( = ?auto_886712 ?auto_886716 ) ) ( not ( = ?auto_886712 ?auto_886717 ) ) ( not ( = ?auto_886712 ?auto_886718 ) ) ( not ( = ?auto_886712 ?auto_886719 ) ) ( not ( = ?auto_886712 ?auto_886720 ) ) ( not ( = ?auto_886712 ?auto_886721 ) ) ( not ( = ?auto_886712 ?auto_886722 ) ) ( not ( = ?auto_886713 ?auto_886714 ) ) ( not ( = ?auto_886713 ?auto_886715 ) ) ( not ( = ?auto_886713 ?auto_886716 ) ) ( not ( = ?auto_886713 ?auto_886717 ) ) ( not ( = ?auto_886713 ?auto_886718 ) ) ( not ( = ?auto_886713 ?auto_886719 ) ) ( not ( = ?auto_886713 ?auto_886720 ) ) ( not ( = ?auto_886713 ?auto_886721 ) ) ( not ( = ?auto_886713 ?auto_886722 ) ) ( not ( = ?auto_886714 ?auto_886715 ) ) ( not ( = ?auto_886714 ?auto_886716 ) ) ( not ( = ?auto_886714 ?auto_886717 ) ) ( not ( = ?auto_886714 ?auto_886718 ) ) ( not ( = ?auto_886714 ?auto_886719 ) ) ( not ( = ?auto_886714 ?auto_886720 ) ) ( not ( = ?auto_886714 ?auto_886721 ) ) ( not ( = ?auto_886714 ?auto_886722 ) ) ( not ( = ?auto_886715 ?auto_886716 ) ) ( not ( = ?auto_886715 ?auto_886717 ) ) ( not ( = ?auto_886715 ?auto_886718 ) ) ( not ( = ?auto_886715 ?auto_886719 ) ) ( not ( = ?auto_886715 ?auto_886720 ) ) ( not ( = ?auto_886715 ?auto_886721 ) ) ( not ( = ?auto_886715 ?auto_886722 ) ) ( not ( = ?auto_886716 ?auto_886717 ) ) ( not ( = ?auto_886716 ?auto_886718 ) ) ( not ( = ?auto_886716 ?auto_886719 ) ) ( not ( = ?auto_886716 ?auto_886720 ) ) ( not ( = ?auto_886716 ?auto_886721 ) ) ( not ( = ?auto_886716 ?auto_886722 ) ) ( not ( = ?auto_886717 ?auto_886718 ) ) ( not ( = ?auto_886717 ?auto_886719 ) ) ( not ( = ?auto_886717 ?auto_886720 ) ) ( not ( = ?auto_886717 ?auto_886721 ) ) ( not ( = ?auto_886717 ?auto_886722 ) ) ( not ( = ?auto_886718 ?auto_886719 ) ) ( not ( = ?auto_886718 ?auto_886720 ) ) ( not ( = ?auto_886718 ?auto_886721 ) ) ( not ( = ?auto_886718 ?auto_886722 ) ) ( not ( = ?auto_886719 ?auto_886720 ) ) ( not ( = ?auto_886719 ?auto_886721 ) ) ( not ( = ?auto_886719 ?auto_886722 ) ) ( not ( = ?auto_886720 ?auto_886721 ) ) ( not ( = ?auto_886720 ?auto_886722 ) ) ( not ( = ?auto_886721 ?auto_886722 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_886721 ?auto_886722 )
      ( !STACK ?auto_886721 ?auto_886720 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_886775 - BLOCK
      ?auto_886776 - BLOCK
      ?auto_886777 - BLOCK
      ?auto_886778 - BLOCK
      ?auto_886779 - BLOCK
      ?auto_886780 - BLOCK
      ?auto_886781 - BLOCK
      ?auto_886782 - BLOCK
      ?auto_886783 - BLOCK
      ?auto_886784 - BLOCK
      ?auto_886785 - BLOCK
      ?auto_886786 - BLOCK
      ?auto_886787 - BLOCK
      ?auto_886788 - BLOCK
      ?auto_886789 - BLOCK
      ?auto_886790 - BLOCK
      ?auto_886791 - BLOCK
    )
    :vars
    (
      ?auto_886792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_886791 ?auto_886792 ) ( ON-TABLE ?auto_886775 ) ( ON ?auto_886776 ?auto_886775 ) ( ON ?auto_886777 ?auto_886776 ) ( ON ?auto_886778 ?auto_886777 ) ( ON ?auto_886779 ?auto_886778 ) ( ON ?auto_886780 ?auto_886779 ) ( ON ?auto_886781 ?auto_886780 ) ( ON ?auto_886782 ?auto_886781 ) ( ON ?auto_886783 ?auto_886782 ) ( ON ?auto_886784 ?auto_886783 ) ( ON ?auto_886785 ?auto_886784 ) ( ON ?auto_886786 ?auto_886785 ) ( ON ?auto_886787 ?auto_886786 ) ( ON ?auto_886788 ?auto_886787 ) ( ON ?auto_886789 ?auto_886788 ) ( not ( = ?auto_886775 ?auto_886776 ) ) ( not ( = ?auto_886775 ?auto_886777 ) ) ( not ( = ?auto_886775 ?auto_886778 ) ) ( not ( = ?auto_886775 ?auto_886779 ) ) ( not ( = ?auto_886775 ?auto_886780 ) ) ( not ( = ?auto_886775 ?auto_886781 ) ) ( not ( = ?auto_886775 ?auto_886782 ) ) ( not ( = ?auto_886775 ?auto_886783 ) ) ( not ( = ?auto_886775 ?auto_886784 ) ) ( not ( = ?auto_886775 ?auto_886785 ) ) ( not ( = ?auto_886775 ?auto_886786 ) ) ( not ( = ?auto_886775 ?auto_886787 ) ) ( not ( = ?auto_886775 ?auto_886788 ) ) ( not ( = ?auto_886775 ?auto_886789 ) ) ( not ( = ?auto_886775 ?auto_886790 ) ) ( not ( = ?auto_886775 ?auto_886791 ) ) ( not ( = ?auto_886775 ?auto_886792 ) ) ( not ( = ?auto_886776 ?auto_886777 ) ) ( not ( = ?auto_886776 ?auto_886778 ) ) ( not ( = ?auto_886776 ?auto_886779 ) ) ( not ( = ?auto_886776 ?auto_886780 ) ) ( not ( = ?auto_886776 ?auto_886781 ) ) ( not ( = ?auto_886776 ?auto_886782 ) ) ( not ( = ?auto_886776 ?auto_886783 ) ) ( not ( = ?auto_886776 ?auto_886784 ) ) ( not ( = ?auto_886776 ?auto_886785 ) ) ( not ( = ?auto_886776 ?auto_886786 ) ) ( not ( = ?auto_886776 ?auto_886787 ) ) ( not ( = ?auto_886776 ?auto_886788 ) ) ( not ( = ?auto_886776 ?auto_886789 ) ) ( not ( = ?auto_886776 ?auto_886790 ) ) ( not ( = ?auto_886776 ?auto_886791 ) ) ( not ( = ?auto_886776 ?auto_886792 ) ) ( not ( = ?auto_886777 ?auto_886778 ) ) ( not ( = ?auto_886777 ?auto_886779 ) ) ( not ( = ?auto_886777 ?auto_886780 ) ) ( not ( = ?auto_886777 ?auto_886781 ) ) ( not ( = ?auto_886777 ?auto_886782 ) ) ( not ( = ?auto_886777 ?auto_886783 ) ) ( not ( = ?auto_886777 ?auto_886784 ) ) ( not ( = ?auto_886777 ?auto_886785 ) ) ( not ( = ?auto_886777 ?auto_886786 ) ) ( not ( = ?auto_886777 ?auto_886787 ) ) ( not ( = ?auto_886777 ?auto_886788 ) ) ( not ( = ?auto_886777 ?auto_886789 ) ) ( not ( = ?auto_886777 ?auto_886790 ) ) ( not ( = ?auto_886777 ?auto_886791 ) ) ( not ( = ?auto_886777 ?auto_886792 ) ) ( not ( = ?auto_886778 ?auto_886779 ) ) ( not ( = ?auto_886778 ?auto_886780 ) ) ( not ( = ?auto_886778 ?auto_886781 ) ) ( not ( = ?auto_886778 ?auto_886782 ) ) ( not ( = ?auto_886778 ?auto_886783 ) ) ( not ( = ?auto_886778 ?auto_886784 ) ) ( not ( = ?auto_886778 ?auto_886785 ) ) ( not ( = ?auto_886778 ?auto_886786 ) ) ( not ( = ?auto_886778 ?auto_886787 ) ) ( not ( = ?auto_886778 ?auto_886788 ) ) ( not ( = ?auto_886778 ?auto_886789 ) ) ( not ( = ?auto_886778 ?auto_886790 ) ) ( not ( = ?auto_886778 ?auto_886791 ) ) ( not ( = ?auto_886778 ?auto_886792 ) ) ( not ( = ?auto_886779 ?auto_886780 ) ) ( not ( = ?auto_886779 ?auto_886781 ) ) ( not ( = ?auto_886779 ?auto_886782 ) ) ( not ( = ?auto_886779 ?auto_886783 ) ) ( not ( = ?auto_886779 ?auto_886784 ) ) ( not ( = ?auto_886779 ?auto_886785 ) ) ( not ( = ?auto_886779 ?auto_886786 ) ) ( not ( = ?auto_886779 ?auto_886787 ) ) ( not ( = ?auto_886779 ?auto_886788 ) ) ( not ( = ?auto_886779 ?auto_886789 ) ) ( not ( = ?auto_886779 ?auto_886790 ) ) ( not ( = ?auto_886779 ?auto_886791 ) ) ( not ( = ?auto_886779 ?auto_886792 ) ) ( not ( = ?auto_886780 ?auto_886781 ) ) ( not ( = ?auto_886780 ?auto_886782 ) ) ( not ( = ?auto_886780 ?auto_886783 ) ) ( not ( = ?auto_886780 ?auto_886784 ) ) ( not ( = ?auto_886780 ?auto_886785 ) ) ( not ( = ?auto_886780 ?auto_886786 ) ) ( not ( = ?auto_886780 ?auto_886787 ) ) ( not ( = ?auto_886780 ?auto_886788 ) ) ( not ( = ?auto_886780 ?auto_886789 ) ) ( not ( = ?auto_886780 ?auto_886790 ) ) ( not ( = ?auto_886780 ?auto_886791 ) ) ( not ( = ?auto_886780 ?auto_886792 ) ) ( not ( = ?auto_886781 ?auto_886782 ) ) ( not ( = ?auto_886781 ?auto_886783 ) ) ( not ( = ?auto_886781 ?auto_886784 ) ) ( not ( = ?auto_886781 ?auto_886785 ) ) ( not ( = ?auto_886781 ?auto_886786 ) ) ( not ( = ?auto_886781 ?auto_886787 ) ) ( not ( = ?auto_886781 ?auto_886788 ) ) ( not ( = ?auto_886781 ?auto_886789 ) ) ( not ( = ?auto_886781 ?auto_886790 ) ) ( not ( = ?auto_886781 ?auto_886791 ) ) ( not ( = ?auto_886781 ?auto_886792 ) ) ( not ( = ?auto_886782 ?auto_886783 ) ) ( not ( = ?auto_886782 ?auto_886784 ) ) ( not ( = ?auto_886782 ?auto_886785 ) ) ( not ( = ?auto_886782 ?auto_886786 ) ) ( not ( = ?auto_886782 ?auto_886787 ) ) ( not ( = ?auto_886782 ?auto_886788 ) ) ( not ( = ?auto_886782 ?auto_886789 ) ) ( not ( = ?auto_886782 ?auto_886790 ) ) ( not ( = ?auto_886782 ?auto_886791 ) ) ( not ( = ?auto_886782 ?auto_886792 ) ) ( not ( = ?auto_886783 ?auto_886784 ) ) ( not ( = ?auto_886783 ?auto_886785 ) ) ( not ( = ?auto_886783 ?auto_886786 ) ) ( not ( = ?auto_886783 ?auto_886787 ) ) ( not ( = ?auto_886783 ?auto_886788 ) ) ( not ( = ?auto_886783 ?auto_886789 ) ) ( not ( = ?auto_886783 ?auto_886790 ) ) ( not ( = ?auto_886783 ?auto_886791 ) ) ( not ( = ?auto_886783 ?auto_886792 ) ) ( not ( = ?auto_886784 ?auto_886785 ) ) ( not ( = ?auto_886784 ?auto_886786 ) ) ( not ( = ?auto_886784 ?auto_886787 ) ) ( not ( = ?auto_886784 ?auto_886788 ) ) ( not ( = ?auto_886784 ?auto_886789 ) ) ( not ( = ?auto_886784 ?auto_886790 ) ) ( not ( = ?auto_886784 ?auto_886791 ) ) ( not ( = ?auto_886784 ?auto_886792 ) ) ( not ( = ?auto_886785 ?auto_886786 ) ) ( not ( = ?auto_886785 ?auto_886787 ) ) ( not ( = ?auto_886785 ?auto_886788 ) ) ( not ( = ?auto_886785 ?auto_886789 ) ) ( not ( = ?auto_886785 ?auto_886790 ) ) ( not ( = ?auto_886785 ?auto_886791 ) ) ( not ( = ?auto_886785 ?auto_886792 ) ) ( not ( = ?auto_886786 ?auto_886787 ) ) ( not ( = ?auto_886786 ?auto_886788 ) ) ( not ( = ?auto_886786 ?auto_886789 ) ) ( not ( = ?auto_886786 ?auto_886790 ) ) ( not ( = ?auto_886786 ?auto_886791 ) ) ( not ( = ?auto_886786 ?auto_886792 ) ) ( not ( = ?auto_886787 ?auto_886788 ) ) ( not ( = ?auto_886787 ?auto_886789 ) ) ( not ( = ?auto_886787 ?auto_886790 ) ) ( not ( = ?auto_886787 ?auto_886791 ) ) ( not ( = ?auto_886787 ?auto_886792 ) ) ( not ( = ?auto_886788 ?auto_886789 ) ) ( not ( = ?auto_886788 ?auto_886790 ) ) ( not ( = ?auto_886788 ?auto_886791 ) ) ( not ( = ?auto_886788 ?auto_886792 ) ) ( not ( = ?auto_886789 ?auto_886790 ) ) ( not ( = ?auto_886789 ?auto_886791 ) ) ( not ( = ?auto_886789 ?auto_886792 ) ) ( not ( = ?auto_886790 ?auto_886791 ) ) ( not ( = ?auto_886790 ?auto_886792 ) ) ( not ( = ?auto_886791 ?auto_886792 ) ) ( CLEAR ?auto_886789 ) ( ON ?auto_886790 ?auto_886791 ) ( CLEAR ?auto_886790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_886775 ?auto_886776 ?auto_886777 ?auto_886778 ?auto_886779 ?auto_886780 ?auto_886781 ?auto_886782 ?auto_886783 ?auto_886784 ?auto_886785 ?auto_886786 ?auto_886787 ?auto_886788 ?auto_886789 ?auto_886790 )
      ( MAKE-17PILE ?auto_886775 ?auto_886776 ?auto_886777 ?auto_886778 ?auto_886779 ?auto_886780 ?auto_886781 ?auto_886782 ?auto_886783 ?auto_886784 ?auto_886785 ?auto_886786 ?auto_886787 ?auto_886788 ?auto_886789 ?auto_886790 ?auto_886791 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_886845 - BLOCK
      ?auto_886846 - BLOCK
      ?auto_886847 - BLOCK
      ?auto_886848 - BLOCK
      ?auto_886849 - BLOCK
      ?auto_886850 - BLOCK
      ?auto_886851 - BLOCK
      ?auto_886852 - BLOCK
      ?auto_886853 - BLOCK
      ?auto_886854 - BLOCK
      ?auto_886855 - BLOCK
      ?auto_886856 - BLOCK
      ?auto_886857 - BLOCK
      ?auto_886858 - BLOCK
      ?auto_886859 - BLOCK
      ?auto_886860 - BLOCK
      ?auto_886861 - BLOCK
    )
    :vars
    (
      ?auto_886862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_886861 ?auto_886862 ) ( ON-TABLE ?auto_886845 ) ( ON ?auto_886846 ?auto_886845 ) ( ON ?auto_886847 ?auto_886846 ) ( ON ?auto_886848 ?auto_886847 ) ( ON ?auto_886849 ?auto_886848 ) ( ON ?auto_886850 ?auto_886849 ) ( ON ?auto_886851 ?auto_886850 ) ( ON ?auto_886852 ?auto_886851 ) ( ON ?auto_886853 ?auto_886852 ) ( ON ?auto_886854 ?auto_886853 ) ( ON ?auto_886855 ?auto_886854 ) ( ON ?auto_886856 ?auto_886855 ) ( ON ?auto_886857 ?auto_886856 ) ( ON ?auto_886858 ?auto_886857 ) ( not ( = ?auto_886845 ?auto_886846 ) ) ( not ( = ?auto_886845 ?auto_886847 ) ) ( not ( = ?auto_886845 ?auto_886848 ) ) ( not ( = ?auto_886845 ?auto_886849 ) ) ( not ( = ?auto_886845 ?auto_886850 ) ) ( not ( = ?auto_886845 ?auto_886851 ) ) ( not ( = ?auto_886845 ?auto_886852 ) ) ( not ( = ?auto_886845 ?auto_886853 ) ) ( not ( = ?auto_886845 ?auto_886854 ) ) ( not ( = ?auto_886845 ?auto_886855 ) ) ( not ( = ?auto_886845 ?auto_886856 ) ) ( not ( = ?auto_886845 ?auto_886857 ) ) ( not ( = ?auto_886845 ?auto_886858 ) ) ( not ( = ?auto_886845 ?auto_886859 ) ) ( not ( = ?auto_886845 ?auto_886860 ) ) ( not ( = ?auto_886845 ?auto_886861 ) ) ( not ( = ?auto_886845 ?auto_886862 ) ) ( not ( = ?auto_886846 ?auto_886847 ) ) ( not ( = ?auto_886846 ?auto_886848 ) ) ( not ( = ?auto_886846 ?auto_886849 ) ) ( not ( = ?auto_886846 ?auto_886850 ) ) ( not ( = ?auto_886846 ?auto_886851 ) ) ( not ( = ?auto_886846 ?auto_886852 ) ) ( not ( = ?auto_886846 ?auto_886853 ) ) ( not ( = ?auto_886846 ?auto_886854 ) ) ( not ( = ?auto_886846 ?auto_886855 ) ) ( not ( = ?auto_886846 ?auto_886856 ) ) ( not ( = ?auto_886846 ?auto_886857 ) ) ( not ( = ?auto_886846 ?auto_886858 ) ) ( not ( = ?auto_886846 ?auto_886859 ) ) ( not ( = ?auto_886846 ?auto_886860 ) ) ( not ( = ?auto_886846 ?auto_886861 ) ) ( not ( = ?auto_886846 ?auto_886862 ) ) ( not ( = ?auto_886847 ?auto_886848 ) ) ( not ( = ?auto_886847 ?auto_886849 ) ) ( not ( = ?auto_886847 ?auto_886850 ) ) ( not ( = ?auto_886847 ?auto_886851 ) ) ( not ( = ?auto_886847 ?auto_886852 ) ) ( not ( = ?auto_886847 ?auto_886853 ) ) ( not ( = ?auto_886847 ?auto_886854 ) ) ( not ( = ?auto_886847 ?auto_886855 ) ) ( not ( = ?auto_886847 ?auto_886856 ) ) ( not ( = ?auto_886847 ?auto_886857 ) ) ( not ( = ?auto_886847 ?auto_886858 ) ) ( not ( = ?auto_886847 ?auto_886859 ) ) ( not ( = ?auto_886847 ?auto_886860 ) ) ( not ( = ?auto_886847 ?auto_886861 ) ) ( not ( = ?auto_886847 ?auto_886862 ) ) ( not ( = ?auto_886848 ?auto_886849 ) ) ( not ( = ?auto_886848 ?auto_886850 ) ) ( not ( = ?auto_886848 ?auto_886851 ) ) ( not ( = ?auto_886848 ?auto_886852 ) ) ( not ( = ?auto_886848 ?auto_886853 ) ) ( not ( = ?auto_886848 ?auto_886854 ) ) ( not ( = ?auto_886848 ?auto_886855 ) ) ( not ( = ?auto_886848 ?auto_886856 ) ) ( not ( = ?auto_886848 ?auto_886857 ) ) ( not ( = ?auto_886848 ?auto_886858 ) ) ( not ( = ?auto_886848 ?auto_886859 ) ) ( not ( = ?auto_886848 ?auto_886860 ) ) ( not ( = ?auto_886848 ?auto_886861 ) ) ( not ( = ?auto_886848 ?auto_886862 ) ) ( not ( = ?auto_886849 ?auto_886850 ) ) ( not ( = ?auto_886849 ?auto_886851 ) ) ( not ( = ?auto_886849 ?auto_886852 ) ) ( not ( = ?auto_886849 ?auto_886853 ) ) ( not ( = ?auto_886849 ?auto_886854 ) ) ( not ( = ?auto_886849 ?auto_886855 ) ) ( not ( = ?auto_886849 ?auto_886856 ) ) ( not ( = ?auto_886849 ?auto_886857 ) ) ( not ( = ?auto_886849 ?auto_886858 ) ) ( not ( = ?auto_886849 ?auto_886859 ) ) ( not ( = ?auto_886849 ?auto_886860 ) ) ( not ( = ?auto_886849 ?auto_886861 ) ) ( not ( = ?auto_886849 ?auto_886862 ) ) ( not ( = ?auto_886850 ?auto_886851 ) ) ( not ( = ?auto_886850 ?auto_886852 ) ) ( not ( = ?auto_886850 ?auto_886853 ) ) ( not ( = ?auto_886850 ?auto_886854 ) ) ( not ( = ?auto_886850 ?auto_886855 ) ) ( not ( = ?auto_886850 ?auto_886856 ) ) ( not ( = ?auto_886850 ?auto_886857 ) ) ( not ( = ?auto_886850 ?auto_886858 ) ) ( not ( = ?auto_886850 ?auto_886859 ) ) ( not ( = ?auto_886850 ?auto_886860 ) ) ( not ( = ?auto_886850 ?auto_886861 ) ) ( not ( = ?auto_886850 ?auto_886862 ) ) ( not ( = ?auto_886851 ?auto_886852 ) ) ( not ( = ?auto_886851 ?auto_886853 ) ) ( not ( = ?auto_886851 ?auto_886854 ) ) ( not ( = ?auto_886851 ?auto_886855 ) ) ( not ( = ?auto_886851 ?auto_886856 ) ) ( not ( = ?auto_886851 ?auto_886857 ) ) ( not ( = ?auto_886851 ?auto_886858 ) ) ( not ( = ?auto_886851 ?auto_886859 ) ) ( not ( = ?auto_886851 ?auto_886860 ) ) ( not ( = ?auto_886851 ?auto_886861 ) ) ( not ( = ?auto_886851 ?auto_886862 ) ) ( not ( = ?auto_886852 ?auto_886853 ) ) ( not ( = ?auto_886852 ?auto_886854 ) ) ( not ( = ?auto_886852 ?auto_886855 ) ) ( not ( = ?auto_886852 ?auto_886856 ) ) ( not ( = ?auto_886852 ?auto_886857 ) ) ( not ( = ?auto_886852 ?auto_886858 ) ) ( not ( = ?auto_886852 ?auto_886859 ) ) ( not ( = ?auto_886852 ?auto_886860 ) ) ( not ( = ?auto_886852 ?auto_886861 ) ) ( not ( = ?auto_886852 ?auto_886862 ) ) ( not ( = ?auto_886853 ?auto_886854 ) ) ( not ( = ?auto_886853 ?auto_886855 ) ) ( not ( = ?auto_886853 ?auto_886856 ) ) ( not ( = ?auto_886853 ?auto_886857 ) ) ( not ( = ?auto_886853 ?auto_886858 ) ) ( not ( = ?auto_886853 ?auto_886859 ) ) ( not ( = ?auto_886853 ?auto_886860 ) ) ( not ( = ?auto_886853 ?auto_886861 ) ) ( not ( = ?auto_886853 ?auto_886862 ) ) ( not ( = ?auto_886854 ?auto_886855 ) ) ( not ( = ?auto_886854 ?auto_886856 ) ) ( not ( = ?auto_886854 ?auto_886857 ) ) ( not ( = ?auto_886854 ?auto_886858 ) ) ( not ( = ?auto_886854 ?auto_886859 ) ) ( not ( = ?auto_886854 ?auto_886860 ) ) ( not ( = ?auto_886854 ?auto_886861 ) ) ( not ( = ?auto_886854 ?auto_886862 ) ) ( not ( = ?auto_886855 ?auto_886856 ) ) ( not ( = ?auto_886855 ?auto_886857 ) ) ( not ( = ?auto_886855 ?auto_886858 ) ) ( not ( = ?auto_886855 ?auto_886859 ) ) ( not ( = ?auto_886855 ?auto_886860 ) ) ( not ( = ?auto_886855 ?auto_886861 ) ) ( not ( = ?auto_886855 ?auto_886862 ) ) ( not ( = ?auto_886856 ?auto_886857 ) ) ( not ( = ?auto_886856 ?auto_886858 ) ) ( not ( = ?auto_886856 ?auto_886859 ) ) ( not ( = ?auto_886856 ?auto_886860 ) ) ( not ( = ?auto_886856 ?auto_886861 ) ) ( not ( = ?auto_886856 ?auto_886862 ) ) ( not ( = ?auto_886857 ?auto_886858 ) ) ( not ( = ?auto_886857 ?auto_886859 ) ) ( not ( = ?auto_886857 ?auto_886860 ) ) ( not ( = ?auto_886857 ?auto_886861 ) ) ( not ( = ?auto_886857 ?auto_886862 ) ) ( not ( = ?auto_886858 ?auto_886859 ) ) ( not ( = ?auto_886858 ?auto_886860 ) ) ( not ( = ?auto_886858 ?auto_886861 ) ) ( not ( = ?auto_886858 ?auto_886862 ) ) ( not ( = ?auto_886859 ?auto_886860 ) ) ( not ( = ?auto_886859 ?auto_886861 ) ) ( not ( = ?auto_886859 ?auto_886862 ) ) ( not ( = ?auto_886860 ?auto_886861 ) ) ( not ( = ?auto_886860 ?auto_886862 ) ) ( not ( = ?auto_886861 ?auto_886862 ) ) ( ON ?auto_886860 ?auto_886861 ) ( CLEAR ?auto_886858 ) ( ON ?auto_886859 ?auto_886860 ) ( CLEAR ?auto_886859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_886845 ?auto_886846 ?auto_886847 ?auto_886848 ?auto_886849 ?auto_886850 ?auto_886851 ?auto_886852 ?auto_886853 ?auto_886854 ?auto_886855 ?auto_886856 ?auto_886857 ?auto_886858 ?auto_886859 )
      ( MAKE-17PILE ?auto_886845 ?auto_886846 ?auto_886847 ?auto_886848 ?auto_886849 ?auto_886850 ?auto_886851 ?auto_886852 ?auto_886853 ?auto_886854 ?auto_886855 ?auto_886856 ?auto_886857 ?auto_886858 ?auto_886859 ?auto_886860 ?auto_886861 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_886915 - BLOCK
      ?auto_886916 - BLOCK
      ?auto_886917 - BLOCK
      ?auto_886918 - BLOCK
      ?auto_886919 - BLOCK
      ?auto_886920 - BLOCK
      ?auto_886921 - BLOCK
      ?auto_886922 - BLOCK
      ?auto_886923 - BLOCK
      ?auto_886924 - BLOCK
      ?auto_886925 - BLOCK
      ?auto_886926 - BLOCK
      ?auto_886927 - BLOCK
      ?auto_886928 - BLOCK
      ?auto_886929 - BLOCK
      ?auto_886930 - BLOCK
      ?auto_886931 - BLOCK
    )
    :vars
    (
      ?auto_886932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_886931 ?auto_886932 ) ( ON-TABLE ?auto_886915 ) ( ON ?auto_886916 ?auto_886915 ) ( ON ?auto_886917 ?auto_886916 ) ( ON ?auto_886918 ?auto_886917 ) ( ON ?auto_886919 ?auto_886918 ) ( ON ?auto_886920 ?auto_886919 ) ( ON ?auto_886921 ?auto_886920 ) ( ON ?auto_886922 ?auto_886921 ) ( ON ?auto_886923 ?auto_886922 ) ( ON ?auto_886924 ?auto_886923 ) ( ON ?auto_886925 ?auto_886924 ) ( ON ?auto_886926 ?auto_886925 ) ( ON ?auto_886927 ?auto_886926 ) ( not ( = ?auto_886915 ?auto_886916 ) ) ( not ( = ?auto_886915 ?auto_886917 ) ) ( not ( = ?auto_886915 ?auto_886918 ) ) ( not ( = ?auto_886915 ?auto_886919 ) ) ( not ( = ?auto_886915 ?auto_886920 ) ) ( not ( = ?auto_886915 ?auto_886921 ) ) ( not ( = ?auto_886915 ?auto_886922 ) ) ( not ( = ?auto_886915 ?auto_886923 ) ) ( not ( = ?auto_886915 ?auto_886924 ) ) ( not ( = ?auto_886915 ?auto_886925 ) ) ( not ( = ?auto_886915 ?auto_886926 ) ) ( not ( = ?auto_886915 ?auto_886927 ) ) ( not ( = ?auto_886915 ?auto_886928 ) ) ( not ( = ?auto_886915 ?auto_886929 ) ) ( not ( = ?auto_886915 ?auto_886930 ) ) ( not ( = ?auto_886915 ?auto_886931 ) ) ( not ( = ?auto_886915 ?auto_886932 ) ) ( not ( = ?auto_886916 ?auto_886917 ) ) ( not ( = ?auto_886916 ?auto_886918 ) ) ( not ( = ?auto_886916 ?auto_886919 ) ) ( not ( = ?auto_886916 ?auto_886920 ) ) ( not ( = ?auto_886916 ?auto_886921 ) ) ( not ( = ?auto_886916 ?auto_886922 ) ) ( not ( = ?auto_886916 ?auto_886923 ) ) ( not ( = ?auto_886916 ?auto_886924 ) ) ( not ( = ?auto_886916 ?auto_886925 ) ) ( not ( = ?auto_886916 ?auto_886926 ) ) ( not ( = ?auto_886916 ?auto_886927 ) ) ( not ( = ?auto_886916 ?auto_886928 ) ) ( not ( = ?auto_886916 ?auto_886929 ) ) ( not ( = ?auto_886916 ?auto_886930 ) ) ( not ( = ?auto_886916 ?auto_886931 ) ) ( not ( = ?auto_886916 ?auto_886932 ) ) ( not ( = ?auto_886917 ?auto_886918 ) ) ( not ( = ?auto_886917 ?auto_886919 ) ) ( not ( = ?auto_886917 ?auto_886920 ) ) ( not ( = ?auto_886917 ?auto_886921 ) ) ( not ( = ?auto_886917 ?auto_886922 ) ) ( not ( = ?auto_886917 ?auto_886923 ) ) ( not ( = ?auto_886917 ?auto_886924 ) ) ( not ( = ?auto_886917 ?auto_886925 ) ) ( not ( = ?auto_886917 ?auto_886926 ) ) ( not ( = ?auto_886917 ?auto_886927 ) ) ( not ( = ?auto_886917 ?auto_886928 ) ) ( not ( = ?auto_886917 ?auto_886929 ) ) ( not ( = ?auto_886917 ?auto_886930 ) ) ( not ( = ?auto_886917 ?auto_886931 ) ) ( not ( = ?auto_886917 ?auto_886932 ) ) ( not ( = ?auto_886918 ?auto_886919 ) ) ( not ( = ?auto_886918 ?auto_886920 ) ) ( not ( = ?auto_886918 ?auto_886921 ) ) ( not ( = ?auto_886918 ?auto_886922 ) ) ( not ( = ?auto_886918 ?auto_886923 ) ) ( not ( = ?auto_886918 ?auto_886924 ) ) ( not ( = ?auto_886918 ?auto_886925 ) ) ( not ( = ?auto_886918 ?auto_886926 ) ) ( not ( = ?auto_886918 ?auto_886927 ) ) ( not ( = ?auto_886918 ?auto_886928 ) ) ( not ( = ?auto_886918 ?auto_886929 ) ) ( not ( = ?auto_886918 ?auto_886930 ) ) ( not ( = ?auto_886918 ?auto_886931 ) ) ( not ( = ?auto_886918 ?auto_886932 ) ) ( not ( = ?auto_886919 ?auto_886920 ) ) ( not ( = ?auto_886919 ?auto_886921 ) ) ( not ( = ?auto_886919 ?auto_886922 ) ) ( not ( = ?auto_886919 ?auto_886923 ) ) ( not ( = ?auto_886919 ?auto_886924 ) ) ( not ( = ?auto_886919 ?auto_886925 ) ) ( not ( = ?auto_886919 ?auto_886926 ) ) ( not ( = ?auto_886919 ?auto_886927 ) ) ( not ( = ?auto_886919 ?auto_886928 ) ) ( not ( = ?auto_886919 ?auto_886929 ) ) ( not ( = ?auto_886919 ?auto_886930 ) ) ( not ( = ?auto_886919 ?auto_886931 ) ) ( not ( = ?auto_886919 ?auto_886932 ) ) ( not ( = ?auto_886920 ?auto_886921 ) ) ( not ( = ?auto_886920 ?auto_886922 ) ) ( not ( = ?auto_886920 ?auto_886923 ) ) ( not ( = ?auto_886920 ?auto_886924 ) ) ( not ( = ?auto_886920 ?auto_886925 ) ) ( not ( = ?auto_886920 ?auto_886926 ) ) ( not ( = ?auto_886920 ?auto_886927 ) ) ( not ( = ?auto_886920 ?auto_886928 ) ) ( not ( = ?auto_886920 ?auto_886929 ) ) ( not ( = ?auto_886920 ?auto_886930 ) ) ( not ( = ?auto_886920 ?auto_886931 ) ) ( not ( = ?auto_886920 ?auto_886932 ) ) ( not ( = ?auto_886921 ?auto_886922 ) ) ( not ( = ?auto_886921 ?auto_886923 ) ) ( not ( = ?auto_886921 ?auto_886924 ) ) ( not ( = ?auto_886921 ?auto_886925 ) ) ( not ( = ?auto_886921 ?auto_886926 ) ) ( not ( = ?auto_886921 ?auto_886927 ) ) ( not ( = ?auto_886921 ?auto_886928 ) ) ( not ( = ?auto_886921 ?auto_886929 ) ) ( not ( = ?auto_886921 ?auto_886930 ) ) ( not ( = ?auto_886921 ?auto_886931 ) ) ( not ( = ?auto_886921 ?auto_886932 ) ) ( not ( = ?auto_886922 ?auto_886923 ) ) ( not ( = ?auto_886922 ?auto_886924 ) ) ( not ( = ?auto_886922 ?auto_886925 ) ) ( not ( = ?auto_886922 ?auto_886926 ) ) ( not ( = ?auto_886922 ?auto_886927 ) ) ( not ( = ?auto_886922 ?auto_886928 ) ) ( not ( = ?auto_886922 ?auto_886929 ) ) ( not ( = ?auto_886922 ?auto_886930 ) ) ( not ( = ?auto_886922 ?auto_886931 ) ) ( not ( = ?auto_886922 ?auto_886932 ) ) ( not ( = ?auto_886923 ?auto_886924 ) ) ( not ( = ?auto_886923 ?auto_886925 ) ) ( not ( = ?auto_886923 ?auto_886926 ) ) ( not ( = ?auto_886923 ?auto_886927 ) ) ( not ( = ?auto_886923 ?auto_886928 ) ) ( not ( = ?auto_886923 ?auto_886929 ) ) ( not ( = ?auto_886923 ?auto_886930 ) ) ( not ( = ?auto_886923 ?auto_886931 ) ) ( not ( = ?auto_886923 ?auto_886932 ) ) ( not ( = ?auto_886924 ?auto_886925 ) ) ( not ( = ?auto_886924 ?auto_886926 ) ) ( not ( = ?auto_886924 ?auto_886927 ) ) ( not ( = ?auto_886924 ?auto_886928 ) ) ( not ( = ?auto_886924 ?auto_886929 ) ) ( not ( = ?auto_886924 ?auto_886930 ) ) ( not ( = ?auto_886924 ?auto_886931 ) ) ( not ( = ?auto_886924 ?auto_886932 ) ) ( not ( = ?auto_886925 ?auto_886926 ) ) ( not ( = ?auto_886925 ?auto_886927 ) ) ( not ( = ?auto_886925 ?auto_886928 ) ) ( not ( = ?auto_886925 ?auto_886929 ) ) ( not ( = ?auto_886925 ?auto_886930 ) ) ( not ( = ?auto_886925 ?auto_886931 ) ) ( not ( = ?auto_886925 ?auto_886932 ) ) ( not ( = ?auto_886926 ?auto_886927 ) ) ( not ( = ?auto_886926 ?auto_886928 ) ) ( not ( = ?auto_886926 ?auto_886929 ) ) ( not ( = ?auto_886926 ?auto_886930 ) ) ( not ( = ?auto_886926 ?auto_886931 ) ) ( not ( = ?auto_886926 ?auto_886932 ) ) ( not ( = ?auto_886927 ?auto_886928 ) ) ( not ( = ?auto_886927 ?auto_886929 ) ) ( not ( = ?auto_886927 ?auto_886930 ) ) ( not ( = ?auto_886927 ?auto_886931 ) ) ( not ( = ?auto_886927 ?auto_886932 ) ) ( not ( = ?auto_886928 ?auto_886929 ) ) ( not ( = ?auto_886928 ?auto_886930 ) ) ( not ( = ?auto_886928 ?auto_886931 ) ) ( not ( = ?auto_886928 ?auto_886932 ) ) ( not ( = ?auto_886929 ?auto_886930 ) ) ( not ( = ?auto_886929 ?auto_886931 ) ) ( not ( = ?auto_886929 ?auto_886932 ) ) ( not ( = ?auto_886930 ?auto_886931 ) ) ( not ( = ?auto_886930 ?auto_886932 ) ) ( not ( = ?auto_886931 ?auto_886932 ) ) ( ON ?auto_886930 ?auto_886931 ) ( ON ?auto_886929 ?auto_886930 ) ( CLEAR ?auto_886927 ) ( ON ?auto_886928 ?auto_886929 ) ( CLEAR ?auto_886928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_886915 ?auto_886916 ?auto_886917 ?auto_886918 ?auto_886919 ?auto_886920 ?auto_886921 ?auto_886922 ?auto_886923 ?auto_886924 ?auto_886925 ?auto_886926 ?auto_886927 ?auto_886928 )
      ( MAKE-17PILE ?auto_886915 ?auto_886916 ?auto_886917 ?auto_886918 ?auto_886919 ?auto_886920 ?auto_886921 ?auto_886922 ?auto_886923 ?auto_886924 ?auto_886925 ?auto_886926 ?auto_886927 ?auto_886928 ?auto_886929 ?auto_886930 ?auto_886931 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_886985 - BLOCK
      ?auto_886986 - BLOCK
      ?auto_886987 - BLOCK
      ?auto_886988 - BLOCK
      ?auto_886989 - BLOCK
      ?auto_886990 - BLOCK
      ?auto_886991 - BLOCK
      ?auto_886992 - BLOCK
      ?auto_886993 - BLOCK
      ?auto_886994 - BLOCK
      ?auto_886995 - BLOCK
      ?auto_886996 - BLOCK
      ?auto_886997 - BLOCK
      ?auto_886998 - BLOCK
      ?auto_886999 - BLOCK
      ?auto_887000 - BLOCK
      ?auto_887001 - BLOCK
    )
    :vars
    (
      ?auto_887002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887001 ?auto_887002 ) ( ON-TABLE ?auto_886985 ) ( ON ?auto_886986 ?auto_886985 ) ( ON ?auto_886987 ?auto_886986 ) ( ON ?auto_886988 ?auto_886987 ) ( ON ?auto_886989 ?auto_886988 ) ( ON ?auto_886990 ?auto_886989 ) ( ON ?auto_886991 ?auto_886990 ) ( ON ?auto_886992 ?auto_886991 ) ( ON ?auto_886993 ?auto_886992 ) ( ON ?auto_886994 ?auto_886993 ) ( ON ?auto_886995 ?auto_886994 ) ( ON ?auto_886996 ?auto_886995 ) ( not ( = ?auto_886985 ?auto_886986 ) ) ( not ( = ?auto_886985 ?auto_886987 ) ) ( not ( = ?auto_886985 ?auto_886988 ) ) ( not ( = ?auto_886985 ?auto_886989 ) ) ( not ( = ?auto_886985 ?auto_886990 ) ) ( not ( = ?auto_886985 ?auto_886991 ) ) ( not ( = ?auto_886985 ?auto_886992 ) ) ( not ( = ?auto_886985 ?auto_886993 ) ) ( not ( = ?auto_886985 ?auto_886994 ) ) ( not ( = ?auto_886985 ?auto_886995 ) ) ( not ( = ?auto_886985 ?auto_886996 ) ) ( not ( = ?auto_886985 ?auto_886997 ) ) ( not ( = ?auto_886985 ?auto_886998 ) ) ( not ( = ?auto_886985 ?auto_886999 ) ) ( not ( = ?auto_886985 ?auto_887000 ) ) ( not ( = ?auto_886985 ?auto_887001 ) ) ( not ( = ?auto_886985 ?auto_887002 ) ) ( not ( = ?auto_886986 ?auto_886987 ) ) ( not ( = ?auto_886986 ?auto_886988 ) ) ( not ( = ?auto_886986 ?auto_886989 ) ) ( not ( = ?auto_886986 ?auto_886990 ) ) ( not ( = ?auto_886986 ?auto_886991 ) ) ( not ( = ?auto_886986 ?auto_886992 ) ) ( not ( = ?auto_886986 ?auto_886993 ) ) ( not ( = ?auto_886986 ?auto_886994 ) ) ( not ( = ?auto_886986 ?auto_886995 ) ) ( not ( = ?auto_886986 ?auto_886996 ) ) ( not ( = ?auto_886986 ?auto_886997 ) ) ( not ( = ?auto_886986 ?auto_886998 ) ) ( not ( = ?auto_886986 ?auto_886999 ) ) ( not ( = ?auto_886986 ?auto_887000 ) ) ( not ( = ?auto_886986 ?auto_887001 ) ) ( not ( = ?auto_886986 ?auto_887002 ) ) ( not ( = ?auto_886987 ?auto_886988 ) ) ( not ( = ?auto_886987 ?auto_886989 ) ) ( not ( = ?auto_886987 ?auto_886990 ) ) ( not ( = ?auto_886987 ?auto_886991 ) ) ( not ( = ?auto_886987 ?auto_886992 ) ) ( not ( = ?auto_886987 ?auto_886993 ) ) ( not ( = ?auto_886987 ?auto_886994 ) ) ( not ( = ?auto_886987 ?auto_886995 ) ) ( not ( = ?auto_886987 ?auto_886996 ) ) ( not ( = ?auto_886987 ?auto_886997 ) ) ( not ( = ?auto_886987 ?auto_886998 ) ) ( not ( = ?auto_886987 ?auto_886999 ) ) ( not ( = ?auto_886987 ?auto_887000 ) ) ( not ( = ?auto_886987 ?auto_887001 ) ) ( not ( = ?auto_886987 ?auto_887002 ) ) ( not ( = ?auto_886988 ?auto_886989 ) ) ( not ( = ?auto_886988 ?auto_886990 ) ) ( not ( = ?auto_886988 ?auto_886991 ) ) ( not ( = ?auto_886988 ?auto_886992 ) ) ( not ( = ?auto_886988 ?auto_886993 ) ) ( not ( = ?auto_886988 ?auto_886994 ) ) ( not ( = ?auto_886988 ?auto_886995 ) ) ( not ( = ?auto_886988 ?auto_886996 ) ) ( not ( = ?auto_886988 ?auto_886997 ) ) ( not ( = ?auto_886988 ?auto_886998 ) ) ( not ( = ?auto_886988 ?auto_886999 ) ) ( not ( = ?auto_886988 ?auto_887000 ) ) ( not ( = ?auto_886988 ?auto_887001 ) ) ( not ( = ?auto_886988 ?auto_887002 ) ) ( not ( = ?auto_886989 ?auto_886990 ) ) ( not ( = ?auto_886989 ?auto_886991 ) ) ( not ( = ?auto_886989 ?auto_886992 ) ) ( not ( = ?auto_886989 ?auto_886993 ) ) ( not ( = ?auto_886989 ?auto_886994 ) ) ( not ( = ?auto_886989 ?auto_886995 ) ) ( not ( = ?auto_886989 ?auto_886996 ) ) ( not ( = ?auto_886989 ?auto_886997 ) ) ( not ( = ?auto_886989 ?auto_886998 ) ) ( not ( = ?auto_886989 ?auto_886999 ) ) ( not ( = ?auto_886989 ?auto_887000 ) ) ( not ( = ?auto_886989 ?auto_887001 ) ) ( not ( = ?auto_886989 ?auto_887002 ) ) ( not ( = ?auto_886990 ?auto_886991 ) ) ( not ( = ?auto_886990 ?auto_886992 ) ) ( not ( = ?auto_886990 ?auto_886993 ) ) ( not ( = ?auto_886990 ?auto_886994 ) ) ( not ( = ?auto_886990 ?auto_886995 ) ) ( not ( = ?auto_886990 ?auto_886996 ) ) ( not ( = ?auto_886990 ?auto_886997 ) ) ( not ( = ?auto_886990 ?auto_886998 ) ) ( not ( = ?auto_886990 ?auto_886999 ) ) ( not ( = ?auto_886990 ?auto_887000 ) ) ( not ( = ?auto_886990 ?auto_887001 ) ) ( not ( = ?auto_886990 ?auto_887002 ) ) ( not ( = ?auto_886991 ?auto_886992 ) ) ( not ( = ?auto_886991 ?auto_886993 ) ) ( not ( = ?auto_886991 ?auto_886994 ) ) ( not ( = ?auto_886991 ?auto_886995 ) ) ( not ( = ?auto_886991 ?auto_886996 ) ) ( not ( = ?auto_886991 ?auto_886997 ) ) ( not ( = ?auto_886991 ?auto_886998 ) ) ( not ( = ?auto_886991 ?auto_886999 ) ) ( not ( = ?auto_886991 ?auto_887000 ) ) ( not ( = ?auto_886991 ?auto_887001 ) ) ( not ( = ?auto_886991 ?auto_887002 ) ) ( not ( = ?auto_886992 ?auto_886993 ) ) ( not ( = ?auto_886992 ?auto_886994 ) ) ( not ( = ?auto_886992 ?auto_886995 ) ) ( not ( = ?auto_886992 ?auto_886996 ) ) ( not ( = ?auto_886992 ?auto_886997 ) ) ( not ( = ?auto_886992 ?auto_886998 ) ) ( not ( = ?auto_886992 ?auto_886999 ) ) ( not ( = ?auto_886992 ?auto_887000 ) ) ( not ( = ?auto_886992 ?auto_887001 ) ) ( not ( = ?auto_886992 ?auto_887002 ) ) ( not ( = ?auto_886993 ?auto_886994 ) ) ( not ( = ?auto_886993 ?auto_886995 ) ) ( not ( = ?auto_886993 ?auto_886996 ) ) ( not ( = ?auto_886993 ?auto_886997 ) ) ( not ( = ?auto_886993 ?auto_886998 ) ) ( not ( = ?auto_886993 ?auto_886999 ) ) ( not ( = ?auto_886993 ?auto_887000 ) ) ( not ( = ?auto_886993 ?auto_887001 ) ) ( not ( = ?auto_886993 ?auto_887002 ) ) ( not ( = ?auto_886994 ?auto_886995 ) ) ( not ( = ?auto_886994 ?auto_886996 ) ) ( not ( = ?auto_886994 ?auto_886997 ) ) ( not ( = ?auto_886994 ?auto_886998 ) ) ( not ( = ?auto_886994 ?auto_886999 ) ) ( not ( = ?auto_886994 ?auto_887000 ) ) ( not ( = ?auto_886994 ?auto_887001 ) ) ( not ( = ?auto_886994 ?auto_887002 ) ) ( not ( = ?auto_886995 ?auto_886996 ) ) ( not ( = ?auto_886995 ?auto_886997 ) ) ( not ( = ?auto_886995 ?auto_886998 ) ) ( not ( = ?auto_886995 ?auto_886999 ) ) ( not ( = ?auto_886995 ?auto_887000 ) ) ( not ( = ?auto_886995 ?auto_887001 ) ) ( not ( = ?auto_886995 ?auto_887002 ) ) ( not ( = ?auto_886996 ?auto_886997 ) ) ( not ( = ?auto_886996 ?auto_886998 ) ) ( not ( = ?auto_886996 ?auto_886999 ) ) ( not ( = ?auto_886996 ?auto_887000 ) ) ( not ( = ?auto_886996 ?auto_887001 ) ) ( not ( = ?auto_886996 ?auto_887002 ) ) ( not ( = ?auto_886997 ?auto_886998 ) ) ( not ( = ?auto_886997 ?auto_886999 ) ) ( not ( = ?auto_886997 ?auto_887000 ) ) ( not ( = ?auto_886997 ?auto_887001 ) ) ( not ( = ?auto_886997 ?auto_887002 ) ) ( not ( = ?auto_886998 ?auto_886999 ) ) ( not ( = ?auto_886998 ?auto_887000 ) ) ( not ( = ?auto_886998 ?auto_887001 ) ) ( not ( = ?auto_886998 ?auto_887002 ) ) ( not ( = ?auto_886999 ?auto_887000 ) ) ( not ( = ?auto_886999 ?auto_887001 ) ) ( not ( = ?auto_886999 ?auto_887002 ) ) ( not ( = ?auto_887000 ?auto_887001 ) ) ( not ( = ?auto_887000 ?auto_887002 ) ) ( not ( = ?auto_887001 ?auto_887002 ) ) ( ON ?auto_887000 ?auto_887001 ) ( ON ?auto_886999 ?auto_887000 ) ( ON ?auto_886998 ?auto_886999 ) ( CLEAR ?auto_886996 ) ( ON ?auto_886997 ?auto_886998 ) ( CLEAR ?auto_886997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_886985 ?auto_886986 ?auto_886987 ?auto_886988 ?auto_886989 ?auto_886990 ?auto_886991 ?auto_886992 ?auto_886993 ?auto_886994 ?auto_886995 ?auto_886996 ?auto_886997 )
      ( MAKE-17PILE ?auto_886985 ?auto_886986 ?auto_886987 ?auto_886988 ?auto_886989 ?auto_886990 ?auto_886991 ?auto_886992 ?auto_886993 ?auto_886994 ?auto_886995 ?auto_886996 ?auto_886997 ?auto_886998 ?auto_886999 ?auto_887000 ?auto_887001 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_887055 - BLOCK
      ?auto_887056 - BLOCK
      ?auto_887057 - BLOCK
      ?auto_887058 - BLOCK
      ?auto_887059 - BLOCK
      ?auto_887060 - BLOCK
      ?auto_887061 - BLOCK
      ?auto_887062 - BLOCK
      ?auto_887063 - BLOCK
      ?auto_887064 - BLOCK
      ?auto_887065 - BLOCK
      ?auto_887066 - BLOCK
      ?auto_887067 - BLOCK
      ?auto_887068 - BLOCK
      ?auto_887069 - BLOCK
      ?auto_887070 - BLOCK
      ?auto_887071 - BLOCK
    )
    :vars
    (
      ?auto_887072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887071 ?auto_887072 ) ( ON-TABLE ?auto_887055 ) ( ON ?auto_887056 ?auto_887055 ) ( ON ?auto_887057 ?auto_887056 ) ( ON ?auto_887058 ?auto_887057 ) ( ON ?auto_887059 ?auto_887058 ) ( ON ?auto_887060 ?auto_887059 ) ( ON ?auto_887061 ?auto_887060 ) ( ON ?auto_887062 ?auto_887061 ) ( ON ?auto_887063 ?auto_887062 ) ( ON ?auto_887064 ?auto_887063 ) ( ON ?auto_887065 ?auto_887064 ) ( not ( = ?auto_887055 ?auto_887056 ) ) ( not ( = ?auto_887055 ?auto_887057 ) ) ( not ( = ?auto_887055 ?auto_887058 ) ) ( not ( = ?auto_887055 ?auto_887059 ) ) ( not ( = ?auto_887055 ?auto_887060 ) ) ( not ( = ?auto_887055 ?auto_887061 ) ) ( not ( = ?auto_887055 ?auto_887062 ) ) ( not ( = ?auto_887055 ?auto_887063 ) ) ( not ( = ?auto_887055 ?auto_887064 ) ) ( not ( = ?auto_887055 ?auto_887065 ) ) ( not ( = ?auto_887055 ?auto_887066 ) ) ( not ( = ?auto_887055 ?auto_887067 ) ) ( not ( = ?auto_887055 ?auto_887068 ) ) ( not ( = ?auto_887055 ?auto_887069 ) ) ( not ( = ?auto_887055 ?auto_887070 ) ) ( not ( = ?auto_887055 ?auto_887071 ) ) ( not ( = ?auto_887055 ?auto_887072 ) ) ( not ( = ?auto_887056 ?auto_887057 ) ) ( not ( = ?auto_887056 ?auto_887058 ) ) ( not ( = ?auto_887056 ?auto_887059 ) ) ( not ( = ?auto_887056 ?auto_887060 ) ) ( not ( = ?auto_887056 ?auto_887061 ) ) ( not ( = ?auto_887056 ?auto_887062 ) ) ( not ( = ?auto_887056 ?auto_887063 ) ) ( not ( = ?auto_887056 ?auto_887064 ) ) ( not ( = ?auto_887056 ?auto_887065 ) ) ( not ( = ?auto_887056 ?auto_887066 ) ) ( not ( = ?auto_887056 ?auto_887067 ) ) ( not ( = ?auto_887056 ?auto_887068 ) ) ( not ( = ?auto_887056 ?auto_887069 ) ) ( not ( = ?auto_887056 ?auto_887070 ) ) ( not ( = ?auto_887056 ?auto_887071 ) ) ( not ( = ?auto_887056 ?auto_887072 ) ) ( not ( = ?auto_887057 ?auto_887058 ) ) ( not ( = ?auto_887057 ?auto_887059 ) ) ( not ( = ?auto_887057 ?auto_887060 ) ) ( not ( = ?auto_887057 ?auto_887061 ) ) ( not ( = ?auto_887057 ?auto_887062 ) ) ( not ( = ?auto_887057 ?auto_887063 ) ) ( not ( = ?auto_887057 ?auto_887064 ) ) ( not ( = ?auto_887057 ?auto_887065 ) ) ( not ( = ?auto_887057 ?auto_887066 ) ) ( not ( = ?auto_887057 ?auto_887067 ) ) ( not ( = ?auto_887057 ?auto_887068 ) ) ( not ( = ?auto_887057 ?auto_887069 ) ) ( not ( = ?auto_887057 ?auto_887070 ) ) ( not ( = ?auto_887057 ?auto_887071 ) ) ( not ( = ?auto_887057 ?auto_887072 ) ) ( not ( = ?auto_887058 ?auto_887059 ) ) ( not ( = ?auto_887058 ?auto_887060 ) ) ( not ( = ?auto_887058 ?auto_887061 ) ) ( not ( = ?auto_887058 ?auto_887062 ) ) ( not ( = ?auto_887058 ?auto_887063 ) ) ( not ( = ?auto_887058 ?auto_887064 ) ) ( not ( = ?auto_887058 ?auto_887065 ) ) ( not ( = ?auto_887058 ?auto_887066 ) ) ( not ( = ?auto_887058 ?auto_887067 ) ) ( not ( = ?auto_887058 ?auto_887068 ) ) ( not ( = ?auto_887058 ?auto_887069 ) ) ( not ( = ?auto_887058 ?auto_887070 ) ) ( not ( = ?auto_887058 ?auto_887071 ) ) ( not ( = ?auto_887058 ?auto_887072 ) ) ( not ( = ?auto_887059 ?auto_887060 ) ) ( not ( = ?auto_887059 ?auto_887061 ) ) ( not ( = ?auto_887059 ?auto_887062 ) ) ( not ( = ?auto_887059 ?auto_887063 ) ) ( not ( = ?auto_887059 ?auto_887064 ) ) ( not ( = ?auto_887059 ?auto_887065 ) ) ( not ( = ?auto_887059 ?auto_887066 ) ) ( not ( = ?auto_887059 ?auto_887067 ) ) ( not ( = ?auto_887059 ?auto_887068 ) ) ( not ( = ?auto_887059 ?auto_887069 ) ) ( not ( = ?auto_887059 ?auto_887070 ) ) ( not ( = ?auto_887059 ?auto_887071 ) ) ( not ( = ?auto_887059 ?auto_887072 ) ) ( not ( = ?auto_887060 ?auto_887061 ) ) ( not ( = ?auto_887060 ?auto_887062 ) ) ( not ( = ?auto_887060 ?auto_887063 ) ) ( not ( = ?auto_887060 ?auto_887064 ) ) ( not ( = ?auto_887060 ?auto_887065 ) ) ( not ( = ?auto_887060 ?auto_887066 ) ) ( not ( = ?auto_887060 ?auto_887067 ) ) ( not ( = ?auto_887060 ?auto_887068 ) ) ( not ( = ?auto_887060 ?auto_887069 ) ) ( not ( = ?auto_887060 ?auto_887070 ) ) ( not ( = ?auto_887060 ?auto_887071 ) ) ( not ( = ?auto_887060 ?auto_887072 ) ) ( not ( = ?auto_887061 ?auto_887062 ) ) ( not ( = ?auto_887061 ?auto_887063 ) ) ( not ( = ?auto_887061 ?auto_887064 ) ) ( not ( = ?auto_887061 ?auto_887065 ) ) ( not ( = ?auto_887061 ?auto_887066 ) ) ( not ( = ?auto_887061 ?auto_887067 ) ) ( not ( = ?auto_887061 ?auto_887068 ) ) ( not ( = ?auto_887061 ?auto_887069 ) ) ( not ( = ?auto_887061 ?auto_887070 ) ) ( not ( = ?auto_887061 ?auto_887071 ) ) ( not ( = ?auto_887061 ?auto_887072 ) ) ( not ( = ?auto_887062 ?auto_887063 ) ) ( not ( = ?auto_887062 ?auto_887064 ) ) ( not ( = ?auto_887062 ?auto_887065 ) ) ( not ( = ?auto_887062 ?auto_887066 ) ) ( not ( = ?auto_887062 ?auto_887067 ) ) ( not ( = ?auto_887062 ?auto_887068 ) ) ( not ( = ?auto_887062 ?auto_887069 ) ) ( not ( = ?auto_887062 ?auto_887070 ) ) ( not ( = ?auto_887062 ?auto_887071 ) ) ( not ( = ?auto_887062 ?auto_887072 ) ) ( not ( = ?auto_887063 ?auto_887064 ) ) ( not ( = ?auto_887063 ?auto_887065 ) ) ( not ( = ?auto_887063 ?auto_887066 ) ) ( not ( = ?auto_887063 ?auto_887067 ) ) ( not ( = ?auto_887063 ?auto_887068 ) ) ( not ( = ?auto_887063 ?auto_887069 ) ) ( not ( = ?auto_887063 ?auto_887070 ) ) ( not ( = ?auto_887063 ?auto_887071 ) ) ( not ( = ?auto_887063 ?auto_887072 ) ) ( not ( = ?auto_887064 ?auto_887065 ) ) ( not ( = ?auto_887064 ?auto_887066 ) ) ( not ( = ?auto_887064 ?auto_887067 ) ) ( not ( = ?auto_887064 ?auto_887068 ) ) ( not ( = ?auto_887064 ?auto_887069 ) ) ( not ( = ?auto_887064 ?auto_887070 ) ) ( not ( = ?auto_887064 ?auto_887071 ) ) ( not ( = ?auto_887064 ?auto_887072 ) ) ( not ( = ?auto_887065 ?auto_887066 ) ) ( not ( = ?auto_887065 ?auto_887067 ) ) ( not ( = ?auto_887065 ?auto_887068 ) ) ( not ( = ?auto_887065 ?auto_887069 ) ) ( not ( = ?auto_887065 ?auto_887070 ) ) ( not ( = ?auto_887065 ?auto_887071 ) ) ( not ( = ?auto_887065 ?auto_887072 ) ) ( not ( = ?auto_887066 ?auto_887067 ) ) ( not ( = ?auto_887066 ?auto_887068 ) ) ( not ( = ?auto_887066 ?auto_887069 ) ) ( not ( = ?auto_887066 ?auto_887070 ) ) ( not ( = ?auto_887066 ?auto_887071 ) ) ( not ( = ?auto_887066 ?auto_887072 ) ) ( not ( = ?auto_887067 ?auto_887068 ) ) ( not ( = ?auto_887067 ?auto_887069 ) ) ( not ( = ?auto_887067 ?auto_887070 ) ) ( not ( = ?auto_887067 ?auto_887071 ) ) ( not ( = ?auto_887067 ?auto_887072 ) ) ( not ( = ?auto_887068 ?auto_887069 ) ) ( not ( = ?auto_887068 ?auto_887070 ) ) ( not ( = ?auto_887068 ?auto_887071 ) ) ( not ( = ?auto_887068 ?auto_887072 ) ) ( not ( = ?auto_887069 ?auto_887070 ) ) ( not ( = ?auto_887069 ?auto_887071 ) ) ( not ( = ?auto_887069 ?auto_887072 ) ) ( not ( = ?auto_887070 ?auto_887071 ) ) ( not ( = ?auto_887070 ?auto_887072 ) ) ( not ( = ?auto_887071 ?auto_887072 ) ) ( ON ?auto_887070 ?auto_887071 ) ( ON ?auto_887069 ?auto_887070 ) ( ON ?auto_887068 ?auto_887069 ) ( ON ?auto_887067 ?auto_887068 ) ( CLEAR ?auto_887065 ) ( ON ?auto_887066 ?auto_887067 ) ( CLEAR ?auto_887066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_887055 ?auto_887056 ?auto_887057 ?auto_887058 ?auto_887059 ?auto_887060 ?auto_887061 ?auto_887062 ?auto_887063 ?auto_887064 ?auto_887065 ?auto_887066 )
      ( MAKE-17PILE ?auto_887055 ?auto_887056 ?auto_887057 ?auto_887058 ?auto_887059 ?auto_887060 ?auto_887061 ?auto_887062 ?auto_887063 ?auto_887064 ?auto_887065 ?auto_887066 ?auto_887067 ?auto_887068 ?auto_887069 ?auto_887070 ?auto_887071 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_887125 - BLOCK
      ?auto_887126 - BLOCK
      ?auto_887127 - BLOCK
      ?auto_887128 - BLOCK
      ?auto_887129 - BLOCK
      ?auto_887130 - BLOCK
      ?auto_887131 - BLOCK
      ?auto_887132 - BLOCK
      ?auto_887133 - BLOCK
      ?auto_887134 - BLOCK
      ?auto_887135 - BLOCK
      ?auto_887136 - BLOCK
      ?auto_887137 - BLOCK
      ?auto_887138 - BLOCK
      ?auto_887139 - BLOCK
      ?auto_887140 - BLOCK
      ?auto_887141 - BLOCK
    )
    :vars
    (
      ?auto_887142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887141 ?auto_887142 ) ( ON-TABLE ?auto_887125 ) ( ON ?auto_887126 ?auto_887125 ) ( ON ?auto_887127 ?auto_887126 ) ( ON ?auto_887128 ?auto_887127 ) ( ON ?auto_887129 ?auto_887128 ) ( ON ?auto_887130 ?auto_887129 ) ( ON ?auto_887131 ?auto_887130 ) ( ON ?auto_887132 ?auto_887131 ) ( ON ?auto_887133 ?auto_887132 ) ( ON ?auto_887134 ?auto_887133 ) ( not ( = ?auto_887125 ?auto_887126 ) ) ( not ( = ?auto_887125 ?auto_887127 ) ) ( not ( = ?auto_887125 ?auto_887128 ) ) ( not ( = ?auto_887125 ?auto_887129 ) ) ( not ( = ?auto_887125 ?auto_887130 ) ) ( not ( = ?auto_887125 ?auto_887131 ) ) ( not ( = ?auto_887125 ?auto_887132 ) ) ( not ( = ?auto_887125 ?auto_887133 ) ) ( not ( = ?auto_887125 ?auto_887134 ) ) ( not ( = ?auto_887125 ?auto_887135 ) ) ( not ( = ?auto_887125 ?auto_887136 ) ) ( not ( = ?auto_887125 ?auto_887137 ) ) ( not ( = ?auto_887125 ?auto_887138 ) ) ( not ( = ?auto_887125 ?auto_887139 ) ) ( not ( = ?auto_887125 ?auto_887140 ) ) ( not ( = ?auto_887125 ?auto_887141 ) ) ( not ( = ?auto_887125 ?auto_887142 ) ) ( not ( = ?auto_887126 ?auto_887127 ) ) ( not ( = ?auto_887126 ?auto_887128 ) ) ( not ( = ?auto_887126 ?auto_887129 ) ) ( not ( = ?auto_887126 ?auto_887130 ) ) ( not ( = ?auto_887126 ?auto_887131 ) ) ( not ( = ?auto_887126 ?auto_887132 ) ) ( not ( = ?auto_887126 ?auto_887133 ) ) ( not ( = ?auto_887126 ?auto_887134 ) ) ( not ( = ?auto_887126 ?auto_887135 ) ) ( not ( = ?auto_887126 ?auto_887136 ) ) ( not ( = ?auto_887126 ?auto_887137 ) ) ( not ( = ?auto_887126 ?auto_887138 ) ) ( not ( = ?auto_887126 ?auto_887139 ) ) ( not ( = ?auto_887126 ?auto_887140 ) ) ( not ( = ?auto_887126 ?auto_887141 ) ) ( not ( = ?auto_887126 ?auto_887142 ) ) ( not ( = ?auto_887127 ?auto_887128 ) ) ( not ( = ?auto_887127 ?auto_887129 ) ) ( not ( = ?auto_887127 ?auto_887130 ) ) ( not ( = ?auto_887127 ?auto_887131 ) ) ( not ( = ?auto_887127 ?auto_887132 ) ) ( not ( = ?auto_887127 ?auto_887133 ) ) ( not ( = ?auto_887127 ?auto_887134 ) ) ( not ( = ?auto_887127 ?auto_887135 ) ) ( not ( = ?auto_887127 ?auto_887136 ) ) ( not ( = ?auto_887127 ?auto_887137 ) ) ( not ( = ?auto_887127 ?auto_887138 ) ) ( not ( = ?auto_887127 ?auto_887139 ) ) ( not ( = ?auto_887127 ?auto_887140 ) ) ( not ( = ?auto_887127 ?auto_887141 ) ) ( not ( = ?auto_887127 ?auto_887142 ) ) ( not ( = ?auto_887128 ?auto_887129 ) ) ( not ( = ?auto_887128 ?auto_887130 ) ) ( not ( = ?auto_887128 ?auto_887131 ) ) ( not ( = ?auto_887128 ?auto_887132 ) ) ( not ( = ?auto_887128 ?auto_887133 ) ) ( not ( = ?auto_887128 ?auto_887134 ) ) ( not ( = ?auto_887128 ?auto_887135 ) ) ( not ( = ?auto_887128 ?auto_887136 ) ) ( not ( = ?auto_887128 ?auto_887137 ) ) ( not ( = ?auto_887128 ?auto_887138 ) ) ( not ( = ?auto_887128 ?auto_887139 ) ) ( not ( = ?auto_887128 ?auto_887140 ) ) ( not ( = ?auto_887128 ?auto_887141 ) ) ( not ( = ?auto_887128 ?auto_887142 ) ) ( not ( = ?auto_887129 ?auto_887130 ) ) ( not ( = ?auto_887129 ?auto_887131 ) ) ( not ( = ?auto_887129 ?auto_887132 ) ) ( not ( = ?auto_887129 ?auto_887133 ) ) ( not ( = ?auto_887129 ?auto_887134 ) ) ( not ( = ?auto_887129 ?auto_887135 ) ) ( not ( = ?auto_887129 ?auto_887136 ) ) ( not ( = ?auto_887129 ?auto_887137 ) ) ( not ( = ?auto_887129 ?auto_887138 ) ) ( not ( = ?auto_887129 ?auto_887139 ) ) ( not ( = ?auto_887129 ?auto_887140 ) ) ( not ( = ?auto_887129 ?auto_887141 ) ) ( not ( = ?auto_887129 ?auto_887142 ) ) ( not ( = ?auto_887130 ?auto_887131 ) ) ( not ( = ?auto_887130 ?auto_887132 ) ) ( not ( = ?auto_887130 ?auto_887133 ) ) ( not ( = ?auto_887130 ?auto_887134 ) ) ( not ( = ?auto_887130 ?auto_887135 ) ) ( not ( = ?auto_887130 ?auto_887136 ) ) ( not ( = ?auto_887130 ?auto_887137 ) ) ( not ( = ?auto_887130 ?auto_887138 ) ) ( not ( = ?auto_887130 ?auto_887139 ) ) ( not ( = ?auto_887130 ?auto_887140 ) ) ( not ( = ?auto_887130 ?auto_887141 ) ) ( not ( = ?auto_887130 ?auto_887142 ) ) ( not ( = ?auto_887131 ?auto_887132 ) ) ( not ( = ?auto_887131 ?auto_887133 ) ) ( not ( = ?auto_887131 ?auto_887134 ) ) ( not ( = ?auto_887131 ?auto_887135 ) ) ( not ( = ?auto_887131 ?auto_887136 ) ) ( not ( = ?auto_887131 ?auto_887137 ) ) ( not ( = ?auto_887131 ?auto_887138 ) ) ( not ( = ?auto_887131 ?auto_887139 ) ) ( not ( = ?auto_887131 ?auto_887140 ) ) ( not ( = ?auto_887131 ?auto_887141 ) ) ( not ( = ?auto_887131 ?auto_887142 ) ) ( not ( = ?auto_887132 ?auto_887133 ) ) ( not ( = ?auto_887132 ?auto_887134 ) ) ( not ( = ?auto_887132 ?auto_887135 ) ) ( not ( = ?auto_887132 ?auto_887136 ) ) ( not ( = ?auto_887132 ?auto_887137 ) ) ( not ( = ?auto_887132 ?auto_887138 ) ) ( not ( = ?auto_887132 ?auto_887139 ) ) ( not ( = ?auto_887132 ?auto_887140 ) ) ( not ( = ?auto_887132 ?auto_887141 ) ) ( not ( = ?auto_887132 ?auto_887142 ) ) ( not ( = ?auto_887133 ?auto_887134 ) ) ( not ( = ?auto_887133 ?auto_887135 ) ) ( not ( = ?auto_887133 ?auto_887136 ) ) ( not ( = ?auto_887133 ?auto_887137 ) ) ( not ( = ?auto_887133 ?auto_887138 ) ) ( not ( = ?auto_887133 ?auto_887139 ) ) ( not ( = ?auto_887133 ?auto_887140 ) ) ( not ( = ?auto_887133 ?auto_887141 ) ) ( not ( = ?auto_887133 ?auto_887142 ) ) ( not ( = ?auto_887134 ?auto_887135 ) ) ( not ( = ?auto_887134 ?auto_887136 ) ) ( not ( = ?auto_887134 ?auto_887137 ) ) ( not ( = ?auto_887134 ?auto_887138 ) ) ( not ( = ?auto_887134 ?auto_887139 ) ) ( not ( = ?auto_887134 ?auto_887140 ) ) ( not ( = ?auto_887134 ?auto_887141 ) ) ( not ( = ?auto_887134 ?auto_887142 ) ) ( not ( = ?auto_887135 ?auto_887136 ) ) ( not ( = ?auto_887135 ?auto_887137 ) ) ( not ( = ?auto_887135 ?auto_887138 ) ) ( not ( = ?auto_887135 ?auto_887139 ) ) ( not ( = ?auto_887135 ?auto_887140 ) ) ( not ( = ?auto_887135 ?auto_887141 ) ) ( not ( = ?auto_887135 ?auto_887142 ) ) ( not ( = ?auto_887136 ?auto_887137 ) ) ( not ( = ?auto_887136 ?auto_887138 ) ) ( not ( = ?auto_887136 ?auto_887139 ) ) ( not ( = ?auto_887136 ?auto_887140 ) ) ( not ( = ?auto_887136 ?auto_887141 ) ) ( not ( = ?auto_887136 ?auto_887142 ) ) ( not ( = ?auto_887137 ?auto_887138 ) ) ( not ( = ?auto_887137 ?auto_887139 ) ) ( not ( = ?auto_887137 ?auto_887140 ) ) ( not ( = ?auto_887137 ?auto_887141 ) ) ( not ( = ?auto_887137 ?auto_887142 ) ) ( not ( = ?auto_887138 ?auto_887139 ) ) ( not ( = ?auto_887138 ?auto_887140 ) ) ( not ( = ?auto_887138 ?auto_887141 ) ) ( not ( = ?auto_887138 ?auto_887142 ) ) ( not ( = ?auto_887139 ?auto_887140 ) ) ( not ( = ?auto_887139 ?auto_887141 ) ) ( not ( = ?auto_887139 ?auto_887142 ) ) ( not ( = ?auto_887140 ?auto_887141 ) ) ( not ( = ?auto_887140 ?auto_887142 ) ) ( not ( = ?auto_887141 ?auto_887142 ) ) ( ON ?auto_887140 ?auto_887141 ) ( ON ?auto_887139 ?auto_887140 ) ( ON ?auto_887138 ?auto_887139 ) ( ON ?auto_887137 ?auto_887138 ) ( ON ?auto_887136 ?auto_887137 ) ( CLEAR ?auto_887134 ) ( ON ?auto_887135 ?auto_887136 ) ( CLEAR ?auto_887135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_887125 ?auto_887126 ?auto_887127 ?auto_887128 ?auto_887129 ?auto_887130 ?auto_887131 ?auto_887132 ?auto_887133 ?auto_887134 ?auto_887135 )
      ( MAKE-17PILE ?auto_887125 ?auto_887126 ?auto_887127 ?auto_887128 ?auto_887129 ?auto_887130 ?auto_887131 ?auto_887132 ?auto_887133 ?auto_887134 ?auto_887135 ?auto_887136 ?auto_887137 ?auto_887138 ?auto_887139 ?auto_887140 ?auto_887141 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_887195 - BLOCK
      ?auto_887196 - BLOCK
      ?auto_887197 - BLOCK
      ?auto_887198 - BLOCK
      ?auto_887199 - BLOCK
      ?auto_887200 - BLOCK
      ?auto_887201 - BLOCK
      ?auto_887202 - BLOCK
      ?auto_887203 - BLOCK
      ?auto_887204 - BLOCK
      ?auto_887205 - BLOCK
      ?auto_887206 - BLOCK
      ?auto_887207 - BLOCK
      ?auto_887208 - BLOCK
      ?auto_887209 - BLOCK
      ?auto_887210 - BLOCK
      ?auto_887211 - BLOCK
    )
    :vars
    (
      ?auto_887212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887211 ?auto_887212 ) ( ON-TABLE ?auto_887195 ) ( ON ?auto_887196 ?auto_887195 ) ( ON ?auto_887197 ?auto_887196 ) ( ON ?auto_887198 ?auto_887197 ) ( ON ?auto_887199 ?auto_887198 ) ( ON ?auto_887200 ?auto_887199 ) ( ON ?auto_887201 ?auto_887200 ) ( ON ?auto_887202 ?auto_887201 ) ( ON ?auto_887203 ?auto_887202 ) ( not ( = ?auto_887195 ?auto_887196 ) ) ( not ( = ?auto_887195 ?auto_887197 ) ) ( not ( = ?auto_887195 ?auto_887198 ) ) ( not ( = ?auto_887195 ?auto_887199 ) ) ( not ( = ?auto_887195 ?auto_887200 ) ) ( not ( = ?auto_887195 ?auto_887201 ) ) ( not ( = ?auto_887195 ?auto_887202 ) ) ( not ( = ?auto_887195 ?auto_887203 ) ) ( not ( = ?auto_887195 ?auto_887204 ) ) ( not ( = ?auto_887195 ?auto_887205 ) ) ( not ( = ?auto_887195 ?auto_887206 ) ) ( not ( = ?auto_887195 ?auto_887207 ) ) ( not ( = ?auto_887195 ?auto_887208 ) ) ( not ( = ?auto_887195 ?auto_887209 ) ) ( not ( = ?auto_887195 ?auto_887210 ) ) ( not ( = ?auto_887195 ?auto_887211 ) ) ( not ( = ?auto_887195 ?auto_887212 ) ) ( not ( = ?auto_887196 ?auto_887197 ) ) ( not ( = ?auto_887196 ?auto_887198 ) ) ( not ( = ?auto_887196 ?auto_887199 ) ) ( not ( = ?auto_887196 ?auto_887200 ) ) ( not ( = ?auto_887196 ?auto_887201 ) ) ( not ( = ?auto_887196 ?auto_887202 ) ) ( not ( = ?auto_887196 ?auto_887203 ) ) ( not ( = ?auto_887196 ?auto_887204 ) ) ( not ( = ?auto_887196 ?auto_887205 ) ) ( not ( = ?auto_887196 ?auto_887206 ) ) ( not ( = ?auto_887196 ?auto_887207 ) ) ( not ( = ?auto_887196 ?auto_887208 ) ) ( not ( = ?auto_887196 ?auto_887209 ) ) ( not ( = ?auto_887196 ?auto_887210 ) ) ( not ( = ?auto_887196 ?auto_887211 ) ) ( not ( = ?auto_887196 ?auto_887212 ) ) ( not ( = ?auto_887197 ?auto_887198 ) ) ( not ( = ?auto_887197 ?auto_887199 ) ) ( not ( = ?auto_887197 ?auto_887200 ) ) ( not ( = ?auto_887197 ?auto_887201 ) ) ( not ( = ?auto_887197 ?auto_887202 ) ) ( not ( = ?auto_887197 ?auto_887203 ) ) ( not ( = ?auto_887197 ?auto_887204 ) ) ( not ( = ?auto_887197 ?auto_887205 ) ) ( not ( = ?auto_887197 ?auto_887206 ) ) ( not ( = ?auto_887197 ?auto_887207 ) ) ( not ( = ?auto_887197 ?auto_887208 ) ) ( not ( = ?auto_887197 ?auto_887209 ) ) ( not ( = ?auto_887197 ?auto_887210 ) ) ( not ( = ?auto_887197 ?auto_887211 ) ) ( not ( = ?auto_887197 ?auto_887212 ) ) ( not ( = ?auto_887198 ?auto_887199 ) ) ( not ( = ?auto_887198 ?auto_887200 ) ) ( not ( = ?auto_887198 ?auto_887201 ) ) ( not ( = ?auto_887198 ?auto_887202 ) ) ( not ( = ?auto_887198 ?auto_887203 ) ) ( not ( = ?auto_887198 ?auto_887204 ) ) ( not ( = ?auto_887198 ?auto_887205 ) ) ( not ( = ?auto_887198 ?auto_887206 ) ) ( not ( = ?auto_887198 ?auto_887207 ) ) ( not ( = ?auto_887198 ?auto_887208 ) ) ( not ( = ?auto_887198 ?auto_887209 ) ) ( not ( = ?auto_887198 ?auto_887210 ) ) ( not ( = ?auto_887198 ?auto_887211 ) ) ( not ( = ?auto_887198 ?auto_887212 ) ) ( not ( = ?auto_887199 ?auto_887200 ) ) ( not ( = ?auto_887199 ?auto_887201 ) ) ( not ( = ?auto_887199 ?auto_887202 ) ) ( not ( = ?auto_887199 ?auto_887203 ) ) ( not ( = ?auto_887199 ?auto_887204 ) ) ( not ( = ?auto_887199 ?auto_887205 ) ) ( not ( = ?auto_887199 ?auto_887206 ) ) ( not ( = ?auto_887199 ?auto_887207 ) ) ( not ( = ?auto_887199 ?auto_887208 ) ) ( not ( = ?auto_887199 ?auto_887209 ) ) ( not ( = ?auto_887199 ?auto_887210 ) ) ( not ( = ?auto_887199 ?auto_887211 ) ) ( not ( = ?auto_887199 ?auto_887212 ) ) ( not ( = ?auto_887200 ?auto_887201 ) ) ( not ( = ?auto_887200 ?auto_887202 ) ) ( not ( = ?auto_887200 ?auto_887203 ) ) ( not ( = ?auto_887200 ?auto_887204 ) ) ( not ( = ?auto_887200 ?auto_887205 ) ) ( not ( = ?auto_887200 ?auto_887206 ) ) ( not ( = ?auto_887200 ?auto_887207 ) ) ( not ( = ?auto_887200 ?auto_887208 ) ) ( not ( = ?auto_887200 ?auto_887209 ) ) ( not ( = ?auto_887200 ?auto_887210 ) ) ( not ( = ?auto_887200 ?auto_887211 ) ) ( not ( = ?auto_887200 ?auto_887212 ) ) ( not ( = ?auto_887201 ?auto_887202 ) ) ( not ( = ?auto_887201 ?auto_887203 ) ) ( not ( = ?auto_887201 ?auto_887204 ) ) ( not ( = ?auto_887201 ?auto_887205 ) ) ( not ( = ?auto_887201 ?auto_887206 ) ) ( not ( = ?auto_887201 ?auto_887207 ) ) ( not ( = ?auto_887201 ?auto_887208 ) ) ( not ( = ?auto_887201 ?auto_887209 ) ) ( not ( = ?auto_887201 ?auto_887210 ) ) ( not ( = ?auto_887201 ?auto_887211 ) ) ( not ( = ?auto_887201 ?auto_887212 ) ) ( not ( = ?auto_887202 ?auto_887203 ) ) ( not ( = ?auto_887202 ?auto_887204 ) ) ( not ( = ?auto_887202 ?auto_887205 ) ) ( not ( = ?auto_887202 ?auto_887206 ) ) ( not ( = ?auto_887202 ?auto_887207 ) ) ( not ( = ?auto_887202 ?auto_887208 ) ) ( not ( = ?auto_887202 ?auto_887209 ) ) ( not ( = ?auto_887202 ?auto_887210 ) ) ( not ( = ?auto_887202 ?auto_887211 ) ) ( not ( = ?auto_887202 ?auto_887212 ) ) ( not ( = ?auto_887203 ?auto_887204 ) ) ( not ( = ?auto_887203 ?auto_887205 ) ) ( not ( = ?auto_887203 ?auto_887206 ) ) ( not ( = ?auto_887203 ?auto_887207 ) ) ( not ( = ?auto_887203 ?auto_887208 ) ) ( not ( = ?auto_887203 ?auto_887209 ) ) ( not ( = ?auto_887203 ?auto_887210 ) ) ( not ( = ?auto_887203 ?auto_887211 ) ) ( not ( = ?auto_887203 ?auto_887212 ) ) ( not ( = ?auto_887204 ?auto_887205 ) ) ( not ( = ?auto_887204 ?auto_887206 ) ) ( not ( = ?auto_887204 ?auto_887207 ) ) ( not ( = ?auto_887204 ?auto_887208 ) ) ( not ( = ?auto_887204 ?auto_887209 ) ) ( not ( = ?auto_887204 ?auto_887210 ) ) ( not ( = ?auto_887204 ?auto_887211 ) ) ( not ( = ?auto_887204 ?auto_887212 ) ) ( not ( = ?auto_887205 ?auto_887206 ) ) ( not ( = ?auto_887205 ?auto_887207 ) ) ( not ( = ?auto_887205 ?auto_887208 ) ) ( not ( = ?auto_887205 ?auto_887209 ) ) ( not ( = ?auto_887205 ?auto_887210 ) ) ( not ( = ?auto_887205 ?auto_887211 ) ) ( not ( = ?auto_887205 ?auto_887212 ) ) ( not ( = ?auto_887206 ?auto_887207 ) ) ( not ( = ?auto_887206 ?auto_887208 ) ) ( not ( = ?auto_887206 ?auto_887209 ) ) ( not ( = ?auto_887206 ?auto_887210 ) ) ( not ( = ?auto_887206 ?auto_887211 ) ) ( not ( = ?auto_887206 ?auto_887212 ) ) ( not ( = ?auto_887207 ?auto_887208 ) ) ( not ( = ?auto_887207 ?auto_887209 ) ) ( not ( = ?auto_887207 ?auto_887210 ) ) ( not ( = ?auto_887207 ?auto_887211 ) ) ( not ( = ?auto_887207 ?auto_887212 ) ) ( not ( = ?auto_887208 ?auto_887209 ) ) ( not ( = ?auto_887208 ?auto_887210 ) ) ( not ( = ?auto_887208 ?auto_887211 ) ) ( not ( = ?auto_887208 ?auto_887212 ) ) ( not ( = ?auto_887209 ?auto_887210 ) ) ( not ( = ?auto_887209 ?auto_887211 ) ) ( not ( = ?auto_887209 ?auto_887212 ) ) ( not ( = ?auto_887210 ?auto_887211 ) ) ( not ( = ?auto_887210 ?auto_887212 ) ) ( not ( = ?auto_887211 ?auto_887212 ) ) ( ON ?auto_887210 ?auto_887211 ) ( ON ?auto_887209 ?auto_887210 ) ( ON ?auto_887208 ?auto_887209 ) ( ON ?auto_887207 ?auto_887208 ) ( ON ?auto_887206 ?auto_887207 ) ( ON ?auto_887205 ?auto_887206 ) ( CLEAR ?auto_887203 ) ( ON ?auto_887204 ?auto_887205 ) ( CLEAR ?auto_887204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_887195 ?auto_887196 ?auto_887197 ?auto_887198 ?auto_887199 ?auto_887200 ?auto_887201 ?auto_887202 ?auto_887203 ?auto_887204 )
      ( MAKE-17PILE ?auto_887195 ?auto_887196 ?auto_887197 ?auto_887198 ?auto_887199 ?auto_887200 ?auto_887201 ?auto_887202 ?auto_887203 ?auto_887204 ?auto_887205 ?auto_887206 ?auto_887207 ?auto_887208 ?auto_887209 ?auto_887210 ?auto_887211 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_887265 - BLOCK
      ?auto_887266 - BLOCK
      ?auto_887267 - BLOCK
      ?auto_887268 - BLOCK
      ?auto_887269 - BLOCK
      ?auto_887270 - BLOCK
      ?auto_887271 - BLOCK
      ?auto_887272 - BLOCK
      ?auto_887273 - BLOCK
      ?auto_887274 - BLOCK
      ?auto_887275 - BLOCK
      ?auto_887276 - BLOCK
      ?auto_887277 - BLOCK
      ?auto_887278 - BLOCK
      ?auto_887279 - BLOCK
      ?auto_887280 - BLOCK
      ?auto_887281 - BLOCK
    )
    :vars
    (
      ?auto_887282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887281 ?auto_887282 ) ( ON-TABLE ?auto_887265 ) ( ON ?auto_887266 ?auto_887265 ) ( ON ?auto_887267 ?auto_887266 ) ( ON ?auto_887268 ?auto_887267 ) ( ON ?auto_887269 ?auto_887268 ) ( ON ?auto_887270 ?auto_887269 ) ( ON ?auto_887271 ?auto_887270 ) ( ON ?auto_887272 ?auto_887271 ) ( not ( = ?auto_887265 ?auto_887266 ) ) ( not ( = ?auto_887265 ?auto_887267 ) ) ( not ( = ?auto_887265 ?auto_887268 ) ) ( not ( = ?auto_887265 ?auto_887269 ) ) ( not ( = ?auto_887265 ?auto_887270 ) ) ( not ( = ?auto_887265 ?auto_887271 ) ) ( not ( = ?auto_887265 ?auto_887272 ) ) ( not ( = ?auto_887265 ?auto_887273 ) ) ( not ( = ?auto_887265 ?auto_887274 ) ) ( not ( = ?auto_887265 ?auto_887275 ) ) ( not ( = ?auto_887265 ?auto_887276 ) ) ( not ( = ?auto_887265 ?auto_887277 ) ) ( not ( = ?auto_887265 ?auto_887278 ) ) ( not ( = ?auto_887265 ?auto_887279 ) ) ( not ( = ?auto_887265 ?auto_887280 ) ) ( not ( = ?auto_887265 ?auto_887281 ) ) ( not ( = ?auto_887265 ?auto_887282 ) ) ( not ( = ?auto_887266 ?auto_887267 ) ) ( not ( = ?auto_887266 ?auto_887268 ) ) ( not ( = ?auto_887266 ?auto_887269 ) ) ( not ( = ?auto_887266 ?auto_887270 ) ) ( not ( = ?auto_887266 ?auto_887271 ) ) ( not ( = ?auto_887266 ?auto_887272 ) ) ( not ( = ?auto_887266 ?auto_887273 ) ) ( not ( = ?auto_887266 ?auto_887274 ) ) ( not ( = ?auto_887266 ?auto_887275 ) ) ( not ( = ?auto_887266 ?auto_887276 ) ) ( not ( = ?auto_887266 ?auto_887277 ) ) ( not ( = ?auto_887266 ?auto_887278 ) ) ( not ( = ?auto_887266 ?auto_887279 ) ) ( not ( = ?auto_887266 ?auto_887280 ) ) ( not ( = ?auto_887266 ?auto_887281 ) ) ( not ( = ?auto_887266 ?auto_887282 ) ) ( not ( = ?auto_887267 ?auto_887268 ) ) ( not ( = ?auto_887267 ?auto_887269 ) ) ( not ( = ?auto_887267 ?auto_887270 ) ) ( not ( = ?auto_887267 ?auto_887271 ) ) ( not ( = ?auto_887267 ?auto_887272 ) ) ( not ( = ?auto_887267 ?auto_887273 ) ) ( not ( = ?auto_887267 ?auto_887274 ) ) ( not ( = ?auto_887267 ?auto_887275 ) ) ( not ( = ?auto_887267 ?auto_887276 ) ) ( not ( = ?auto_887267 ?auto_887277 ) ) ( not ( = ?auto_887267 ?auto_887278 ) ) ( not ( = ?auto_887267 ?auto_887279 ) ) ( not ( = ?auto_887267 ?auto_887280 ) ) ( not ( = ?auto_887267 ?auto_887281 ) ) ( not ( = ?auto_887267 ?auto_887282 ) ) ( not ( = ?auto_887268 ?auto_887269 ) ) ( not ( = ?auto_887268 ?auto_887270 ) ) ( not ( = ?auto_887268 ?auto_887271 ) ) ( not ( = ?auto_887268 ?auto_887272 ) ) ( not ( = ?auto_887268 ?auto_887273 ) ) ( not ( = ?auto_887268 ?auto_887274 ) ) ( not ( = ?auto_887268 ?auto_887275 ) ) ( not ( = ?auto_887268 ?auto_887276 ) ) ( not ( = ?auto_887268 ?auto_887277 ) ) ( not ( = ?auto_887268 ?auto_887278 ) ) ( not ( = ?auto_887268 ?auto_887279 ) ) ( not ( = ?auto_887268 ?auto_887280 ) ) ( not ( = ?auto_887268 ?auto_887281 ) ) ( not ( = ?auto_887268 ?auto_887282 ) ) ( not ( = ?auto_887269 ?auto_887270 ) ) ( not ( = ?auto_887269 ?auto_887271 ) ) ( not ( = ?auto_887269 ?auto_887272 ) ) ( not ( = ?auto_887269 ?auto_887273 ) ) ( not ( = ?auto_887269 ?auto_887274 ) ) ( not ( = ?auto_887269 ?auto_887275 ) ) ( not ( = ?auto_887269 ?auto_887276 ) ) ( not ( = ?auto_887269 ?auto_887277 ) ) ( not ( = ?auto_887269 ?auto_887278 ) ) ( not ( = ?auto_887269 ?auto_887279 ) ) ( not ( = ?auto_887269 ?auto_887280 ) ) ( not ( = ?auto_887269 ?auto_887281 ) ) ( not ( = ?auto_887269 ?auto_887282 ) ) ( not ( = ?auto_887270 ?auto_887271 ) ) ( not ( = ?auto_887270 ?auto_887272 ) ) ( not ( = ?auto_887270 ?auto_887273 ) ) ( not ( = ?auto_887270 ?auto_887274 ) ) ( not ( = ?auto_887270 ?auto_887275 ) ) ( not ( = ?auto_887270 ?auto_887276 ) ) ( not ( = ?auto_887270 ?auto_887277 ) ) ( not ( = ?auto_887270 ?auto_887278 ) ) ( not ( = ?auto_887270 ?auto_887279 ) ) ( not ( = ?auto_887270 ?auto_887280 ) ) ( not ( = ?auto_887270 ?auto_887281 ) ) ( not ( = ?auto_887270 ?auto_887282 ) ) ( not ( = ?auto_887271 ?auto_887272 ) ) ( not ( = ?auto_887271 ?auto_887273 ) ) ( not ( = ?auto_887271 ?auto_887274 ) ) ( not ( = ?auto_887271 ?auto_887275 ) ) ( not ( = ?auto_887271 ?auto_887276 ) ) ( not ( = ?auto_887271 ?auto_887277 ) ) ( not ( = ?auto_887271 ?auto_887278 ) ) ( not ( = ?auto_887271 ?auto_887279 ) ) ( not ( = ?auto_887271 ?auto_887280 ) ) ( not ( = ?auto_887271 ?auto_887281 ) ) ( not ( = ?auto_887271 ?auto_887282 ) ) ( not ( = ?auto_887272 ?auto_887273 ) ) ( not ( = ?auto_887272 ?auto_887274 ) ) ( not ( = ?auto_887272 ?auto_887275 ) ) ( not ( = ?auto_887272 ?auto_887276 ) ) ( not ( = ?auto_887272 ?auto_887277 ) ) ( not ( = ?auto_887272 ?auto_887278 ) ) ( not ( = ?auto_887272 ?auto_887279 ) ) ( not ( = ?auto_887272 ?auto_887280 ) ) ( not ( = ?auto_887272 ?auto_887281 ) ) ( not ( = ?auto_887272 ?auto_887282 ) ) ( not ( = ?auto_887273 ?auto_887274 ) ) ( not ( = ?auto_887273 ?auto_887275 ) ) ( not ( = ?auto_887273 ?auto_887276 ) ) ( not ( = ?auto_887273 ?auto_887277 ) ) ( not ( = ?auto_887273 ?auto_887278 ) ) ( not ( = ?auto_887273 ?auto_887279 ) ) ( not ( = ?auto_887273 ?auto_887280 ) ) ( not ( = ?auto_887273 ?auto_887281 ) ) ( not ( = ?auto_887273 ?auto_887282 ) ) ( not ( = ?auto_887274 ?auto_887275 ) ) ( not ( = ?auto_887274 ?auto_887276 ) ) ( not ( = ?auto_887274 ?auto_887277 ) ) ( not ( = ?auto_887274 ?auto_887278 ) ) ( not ( = ?auto_887274 ?auto_887279 ) ) ( not ( = ?auto_887274 ?auto_887280 ) ) ( not ( = ?auto_887274 ?auto_887281 ) ) ( not ( = ?auto_887274 ?auto_887282 ) ) ( not ( = ?auto_887275 ?auto_887276 ) ) ( not ( = ?auto_887275 ?auto_887277 ) ) ( not ( = ?auto_887275 ?auto_887278 ) ) ( not ( = ?auto_887275 ?auto_887279 ) ) ( not ( = ?auto_887275 ?auto_887280 ) ) ( not ( = ?auto_887275 ?auto_887281 ) ) ( not ( = ?auto_887275 ?auto_887282 ) ) ( not ( = ?auto_887276 ?auto_887277 ) ) ( not ( = ?auto_887276 ?auto_887278 ) ) ( not ( = ?auto_887276 ?auto_887279 ) ) ( not ( = ?auto_887276 ?auto_887280 ) ) ( not ( = ?auto_887276 ?auto_887281 ) ) ( not ( = ?auto_887276 ?auto_887282 ) ) ( not ( = ?auto_887277 ?auto_887278 ) ) ( not ( = ?auto_887277 ?auto_887279 ) ) ( not ( = ?auto_887277 ?auto_887280 ) ) ( not ( = ?auto_887277 ?auto_887281 ) ) ( not ( = ?auto_887277 ?auto_887282 ) ) ( not ( = ?auto_887278 ?auto_887279 ) ) ( not ( = ?auto_887278 ?auto_887280 ) ) ( not ( = ?auto_887278 ?auto_887281 ) ) ( not ( = ?auto_887278 ?auto_887282 ) ) ( not ( = ?auto_887279 ?auto_887280 ) ) ( not ( = ?auto_887279 ?auto_887281 ) ) ( not ( = ?auto_887279 ?auto_887282 ) ) ( not ( = ?auto_887280 ?auto_887281 ) ) ( not ( = ?auto_887280 ?auto_887282 ) ) ( not ( = ?auto_887281 ?auto_887282 ) ) ( ON ?auto_887280 ?auto_887281 ) ( ON ?auto_887279 ?auto_887280 ) ( ON ?auto_887278 ?auto_887279 ) ( ON ?auto_887277 ?auto_887278 ) ( ON ?auto_887276 ?auto_887277 ) ( ON ?auto_887275 ?auto_887276 ) ( ON ?auto_887274 ?auto_887275 ) ( CLEAR ?auto_887272 ) ( ON ?auto_887273 ?auto_887274 ) ( CLEAR ?auto_887273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_887265 ?auto_887266 ?auto_887267 ?auto_887268 ?auto_887269 ?auto_887270 ?auto_887271 ?auto_887272 ?auto_887273 )
      ( MAKE-17PILE ?auto_887265 ?auto_887266 ?auto_887267 ?auto_887268 ?auto_887269 ?auto_887270 ?auto_887271 ?auto_887272 ?auto_887273 ?auto_887274 ?auto_887275 ?auto_887276 ?auto_887277 ?auto_887278 ?auto_887279 ?auto_887280 ?auto_887281 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_887335 - BLOCK
      ?auto_887336 - BLOCK
      ?auto_887337 - BLOCK
      ?auto_887338 - BLOCK
      ?auto_887339 - BLOCK
      ?auto_887340 - BLOCK
      ?auto_887341 - BLOCK
      ?auto_887342 - BLOCK
      ?auto_887343 - BLOCK
      ?auto_887344 - BLOCK
      ?auto_887345 - BLOCK
      ?auto_887346 - BLOCK
      ?auto_887347 - BLOCK
      ?auto_887348 - BLOCK
      ?auto_887349 - BLOCK
      ?auto_887350 - BLOCK
      ?auto_887351 - BLOCK
    )
    :vars
    (
      ?auto_887352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887351 ?auto_887352 ) ( ON-TABLE ?auto_887335 ) ( ON ?auto_887336 ?auto_887335 ) ( ON ?auto_887337 ?auto_887336 ) ( ON ?auto_887338 ?auto_887337 ) ( ON ?auto_887339 ?auto_887338 ) ( ON ?auto_887340 ?auto_887339 ) ( ON ?auto_887341 ?auto_887340 ) ( not ( = ?auto_887335 ?auto_887336 ) ) ( not ( = ?auto_887335 ?auto_887337 ) ) ( not ( = ?auto_887335 ?auto_887338 ) ) ( not ( = ?auto_887335 ?auto_887339 ) ) ( not ( = ?auto_887335 ?auto_887340 ) ) ( not ( = ?auto_887335 ?auto_887341 ) ) ( not ( = ?auto_887335 ?auto_887342 ) ) ( not ( = ?auto_887335 ?auto_887343 ) ) ( not ( = ?auto_887335 ?auto_887344 ) ) ( not ( = ?auto_887335 ?auto_887345 ) ) ( not ( = ?auto_887335 ?auto_887346 ) ) ( not ( = ?auto_887335 ?auto_887347 ) ) ( not ( = ?auto_887335 ?auto_887348 ) ) ( not ( = ?auto_887335 ?auto_887349 ) ) ( not ( = ?auto_887335 ?auto_887350 ) ) ( not ( = ?auto_887335 ?auto_887351 ) ) ( not ( = ?auto_887335 ?auto_887352 ) ) ( not ( = ?auto_887336 ?auto_887337 ) ) ( not ( = ?auto_887336 ?auto_887338 ) ) ( not ( = ?auto_887336 ?auto_887339 ) ) ( not ( = ?auto_887336 ?auto_887340 ) ) ( not ( = ?auto_887336 ?auto_887341 ) ) ( not ( = ?auto_887336 ?auto_887342 ) ) ( not ( = ?auto_887336 ?auto_887343 ) ) ( not ( = ?auto_887336 ?auto_887344 ) ) ( not ( = ?auto_887336 ?auto_887345 ) ) ( not ( = ?auto_887336 ?auto_887346 ) ) ( not ( = ?auto_887336 ?auto_887347 ) ) ( not ( = ?auto_887336 ?auto_887348 ) ) ( not ( = ?auto_887336 ?auto_887349 ) ) ( not ( = ?auto_887336 ?auto_887350 ) ) ( not ( = ?auto_887336 ?auto_887351 ) ) ( not ( = ?auto_887336 ?auto_887352 ) ) ( not ( = ?auto_887337 ?auto_887338 ) ) ( not ( = ?auto_887337 ?auto_887339 ) ) ( not ( = ?auto_887337 ?auto_887340 ) ) ( not ( = ?auto_887337 ?auto_887341 ) ) ( not ( = ?auto_887337 ?auto_887342 ) ) ( not ( = ?auto_887337 ?auto_887343 ) ) ( not ( = ?auto_887337 ?auto_887344 ) ) ( not ( = ?auto_887337 ?auto_887345 ) ) ( not ( = ?auto_887337 ?auto_887346 ) ) ( not ( = ?auto_887337 ?auto_887347 ) ) ( not ( = ?auto_887337 ?auto_887348 ) ) ( not ( = ?auto_887337 ?auto_887349 ) ) ( not ( = ?auto_887337 ?auto_887350 ) ) ( not ( = ?auto_887337 ?auto_887351 ) ) ( not ( = ?auto_887337 ?auto_887352 ) ) ( not ( = ?auto_887338 ?auto_887339 ) ) ( not ( = ?auto_887338 ?auto_887340 ) ) ( not ( = ?auto_887338 ?auto_887341 ) ) ( not ( = ?auto_887338 ?auto_887342 ) ) ( not ( = ?auto_887338 ?auto_887343 ) ) ( not ( = ?auto_887338 ?auto_887344 ) ) ( not ( = ?auto_887338 ?auto_887345 ) ) ( not ( = ?auto_887338 ?auto_887346 ) ) ( not ( = ?auto_887338 ?auto_887347 ) ) ( not ( = ?auto_887338 ?auto_887348 ) ) ( not ( = ?auto_887338 ?auto_887349 ) ) ( not ( = ?auto_887338 ?auto_887350 ) ) ( not ( = ?auto_887338 ?auto_887351 ) ) ( not ( = ?auto_887338 ?auto_887352 ) ) ( not ( = ?auto_887339 ?auto_887340 ) ) ( not ( = ?auto_887339 ?auto_887341 ) ) ( not ( = ?auto_887339 ?auto_887342 ) ) ( not ( = ?auto_887339 ?auto_887343 ) ) ( not ( = ?auto_887339 ?auto_887344 ) ) ( not ( = ?auto_887339 ?auto_887345 ) ) ( not ( = ?auto_887339 ?auto_887346 ) ) ( not ( = ?auto_887339 ?auto_887347 ) ) ( not ( = ?auto_887339 ?auto_887348 ) ) ( not ( = ?auto_887339 ?auto_887349 ) ) ( not ( = ?auto_887339 ?auto_887350 ) ) ( not ( = ?auto_887339 ?auto_887351 ) ) ( not ( = ?auto_887339 ?auto_887352 ) ) ( not ( = ?auto_887340 ?auto_887341 ) ) ( not ( = ?auto_887340 ?auto_887342 ) ) ( not ( = ?auto_887340 ?auto_887343 ) ) ( not ( = ?auto_887340 ?auto_887344 ) ) ( not ( = ?auto_887340 ?auto_887345 ) ) ( not ( = ?auto_887340 ?auto_887346 ) ) ( not ( = ?auto_887340 ?auto_887347 ) ) ( not ( = ?auto_887340 ?auto_887348 ) ) ( not ( = ?auto_887340 ?auto_887349 ) ) ( not ( = ?auto_887340 ?auto_887350 ) ) ( not ( = ?auto_887340 ?auto_887351 ) ) ( not ( = ?auto_887340 ?auto_887352 ) ) ( not ( = ?auto_887341 ?auto_887342 ) ) ( not ( = ?auto_887341 ?auto_887343 ) ) ( not ( = ?auto_887341 ?auto_887344 ) ) ( not ( = ?auto_887341 ?auto_887345 ) ) ( not ( = ?auto_887341 ?auto_887346 ) ) ( not ( = ?auto_887341 ?auto_887347 ) ) ( not ( = ?auto_887341 ?auto_887348 ) ) ( not ( = ?auto_887341 ?auto_887349 ) ) ( not ( = ?auto_887341 ?auto_887350 ) ) ( not ( = ?auto_887341 ?auto_887351 ) ) ( not ( = ?auto_887341 ?auto_887352 ) ) ( not ( = ?auto_887342 ?auto_887343 ) ) ( not ( = ?auto_887342 ?auto_887344 ) ) ( not ( = ?auto_887342 ?auto_887345 ) ) ( not ( = ?auto_887342 ?auto_887346 ) ) ( not ( = ?auto_887342 ?auto_887347 ) ) ( not ( = ?auto_887342 ?auto_887348 ) ) ( not ( = ?auto_887342 ?auto_887349 ) ) ( not ( = ?auto_887342 ?auto_887350 ) ) ( not ( = ?auto_887342 ?auto_887351 ) ) ( not ( = ?auto_887342 ?auto_887352 ) ) ( not ( = ?auto_887343 ?auto_887344 ) ) ( not ( = ?auto_887343 ?auto_887345 ) ) ( not ( = ?auto_887343 ?auto_887346 ) ) ( not ( = ?auto_887343 ?auto_887347 ) ) ( not ( = ?auto_887343 ?auto_887348 ) ) ( not ( = ?auto_887343 ?auto_887349 ) ) ( not ( = ?auto_887343 ?auto_887350 ) ) ( not ( = ?auto_887343 ?auto_887351 ) ) ( not ( = ?auto_887343 ?auto_887352 ) ) ( not ( = ?auto_887344 ?auto_887345 ) ) ( not ( = ?auto_887344 ?auto_887346 ) ) ( not ( = ?auto_887344 ?auto_887347 ) ) ( not ( = ?auto_887344 ?auto_887348 ) ) ( not ( = ?auto_887344 ?auto_887349 ) ) ( not ( = ?auto_887344 ?auto_887350 ) ) ( not ( = ?auto_887344 ?auto_887351 ) ) ( not ( = ?auto_887344 ?auto_887352 ) ) ( not ( = ?auto_887345 ?auto_887346 ) ) ( not ( = ?auto_887345 ?auto_887347 ) ) ( not ( = ?auto_887345 ?auto_887348 ) ) ( not ( = ?auto_887345 ?auto_887349 ) ) ( not ( = ?auto_887345 ?auto_887350 ) ) ( not ( = ?auto_887345 ?auto_887351 ) ) ( not ( = ?auto_887345 ?auto_887352 ) ) ( not ( = ?auto_887346 ?auto_887347 ) ) ( not ( = ?auto_887346 ?auto_887348 ) ) ( not ( = ?auto_887346 ?auto_887349 ) ) ( not ( = ?auto_887346 ?auto_887350 ) ) ( not ( = ?auto_887346 ?auto_887351 ) ) ( not ( = ?auto_887346 ?auto_887352 ) ) ( not ( = ?auto_887347 ?auto_887348 ) ) ( not ( = ?auto_887347 ?auto_887349 ) ) ( not ( = ?auto_887347 ?auto_887350 ) ) ( not ( = ?auto_887347 ?auto_887351 ) ) ( not ( = ?auto_887347 ?auto_887352 ) ) ( not ( = ?auto_887348 ?auto_887349 ) ) ( not ( = ?auto_887348 ?auto_887350 ) ) ( not ( = ?auto_887348 ?auto_887351 ) ) ( not ( = ?auto_887348 ?auto_887352 ) ) ( not ( = ?auto_887349 ?auto_887350 ) ) ( not ( = ?auto_887349 ?auto_887351 ) ) ( not ( = ?auto_887349 ?auto_887352 ) ) ( not ( = ?auto_887350 ?auto_887351 ) ) ( not ( = ?auto_887350 ?auto_887352 ) ) ( not ( = ?auto_887351 ?auto_887352 ) ) ( ON ?auto_887350 ?auto_887351 ) ( ON ?auto_887349 ?auto_887350 ) ( ON ?auto_887348 ?auto_887349 ) ( ON ?auto_887347 ?auto_887348 ) ( ON ?auto_887346 ?auto_887347 ) ( ON ?auto_887345 ?auto_887346 ) ( ON ?auto_887344 ?auto_887345 ) ( ON ?auto_887343 ?auto_887344 ) ( CLEAR ?auto_887341 ) ( ON ?auto_887342 ?auto_887343 ) ( CLEAR ?auto_887342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_887335 ?auto_887336 ?auto_887337 ?auto_887338 ?auto_887339 ?auto_887340 ?auto_887341 ?auto_887342 )
      ( MAKE-17PILE ?auto_887335 ?auto_887336 ?auto_887337 ?auto_887338 ?auto_887339 ?auto_887340 ?auto_887341 ?auto_887342 ?auto_887343 ?auto_887344 ?auto_887345 ?auto_887346 ?auto_887347 ?auto_887348 ?auto_887349 ?auto_887350 ?auto_887351 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_887405 - BLOCK
      ?auto_887406 - BLOCK
      ?auto_887407 - BLOCK
      ?auto_887408 - BLOCK
      ?auto_887409 - BLOCK
      ?auto_887410 - BLOCK
      ?auto_887411 - BLOCK
      ?auto_887412 - BLOCK
      ?auto_887413 - BLOCK
      ?auto_887414 - BLOCK
      ?auto_887415 - BLOCK
      ?auto_887416 - BLOCK
      ?auto_887417 - BLOCK
      ?auto_887418 - BLOCK
      ?auto_887419 - BLOCK
      ?auto_887420 - BLOCK
      ?auto_887421 - BLOCK
    )
    :vars
    (
      ?auto_887422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887421 ?auto_887422 ) ( ON-TABLE ?auto_887405 ) ( ON ?auto_887406 ?auto_887405 ) ( ON ?auto_887407 ?auto_887406 ) ( ON ?auto_887408 ?auto_887407 ) ( ON ?auto_887409 ?auto_887408 ) ( ON ?auto_887410 ?auto_887409 ) ( not ( = ?auto_887405 ?auto_887406 ) ) ( not ( = ?auto_887405 ?auto_887407 ) ) ( not ( = ?auto_887405 ?auto_887408 ) ) ( not ( = ?auto_887405 ?auto_887409 ) ) ( not ( = ?auto_887405 ?auto_887410 ) ) ( not ( = ?auto_887405 ?auto_887411 ) ) ( not ( = ?auto_887405 ?auto_887412 ) ) ( not ( = ?auto_887405 ?auto_887413 ) ) ( not ( = ?auto_887405 ?auto_887414 ) ) ( not ( = ?auto_887405 ?auto_887415 ) ) ( not ( = ?auto_887405 ?auto_887416 ) ) ( not ( = ?auto_887405 ?auto_887417 ) ) ( not ( = ?auto_887405 ?auto_887418 ) ) ( not ( = ?auto_887405 ?auto_887419 ) ) ( not ( = ?auto_887405 ?auto_887420 ) ) ( not ( = ?auto_887405 ?auto_887421 ) ) ( not ( = ?auto_887405 ?auto_887422 ) ) ( not ( = ?auto_887406 ?auto_887407 ) ) ( not ( = ?auto_887406 ?auto_887408 ) ) ( not ( = ?auto_887406 ?auto_887409 ) ) ( not ( = ?auto_887406 ?auto_887410 ) ) ( not ( = ?auto_887406 ?auto_887411 ) ) ( not ( = ?auto_887406 ?auto_887412 ) ) ( not ( = ?auto_887406 ?auto_887413 ) ) ( not ( = ?auto_887406 ?auto_887414 ) ) ( not ( = ?auto_887406 ?auto_887415 ) ) ( not ( = ?auto_887406 ?auto_887416 ) ) ( not ( = ?auto_887406 ?auto_887417 ) ) ( not ( = ?auto_887406 ?auto_887418 ) ) ( not ( = ?auto_887406 ?auto_887419 ) ) ( not ( = ?auto_887406 ?auto_887420 ) ) ( not ( = ?auto_887406 ?auto_887421 ) ) ( not ( = ?auto_887406 ?auto_887422 ) ) ( not ( = ?auto_887407 ?auto_887408 ) ) ( not ( = ?auto_887407 ?auto_887409 ) ) ( not ( = ?auto_887407 ?auto_887410 ) ) ( not ( = ?auto_887407 ?auto_887411 ) ) ( not ( = ?auto_887407 ?auto_887412 ) ) ( not ( = ?auto_887407 ?auto_887413 ) ) ( not ( = ?auto_887407 ?auto_887414 ) ) ( not ( = ?auto_887407 ?auto_887415 ) ) ( not ( = ?auto_887407 ?auto_887416 ) ) ( not ( = ?auto_887407 ?auto_887417 ) ) ( not ( = ?auto_887407 ?auto_887418 ) ) ( not ( = ?auto_887407 ?auto_887419 ) ) ( not ( = ?auto_887407 ?auto_887420 ) ) ( not ( = ?auto_887407 ?auto_887421 ) ) ( not ( = ?auto_887407 ?auto_887422 ) ) ( not ( = ?auto_887408 ?auto_887409 ) ) ( not ( = ?auto_887408 ?auto_887410 ) ) ( not ( = ?auto_887408 ?auto_887411 ) ) ( not ( = ?auto_887408 ?auto_887412 ) ) ( not ( = ?auto_887408 ?auto_887413 ) ) ( not ( = ?auto_887408 ?auto_887414 ) ) ( not ( = ?auto_887408 ?auto_887415 ) ) ( not ( = ?auto_887408 ?auto_887416 ) ) ( not ( = ?auto_887408 ?auto_887417 ) ) ( not ( = ?auto_887408 ?auto_887418 ) ) ( not ( = ?auto_887408 ?auto_887419 ) ) ( not ( = ?auto_887408 ?auto_887420 ) ) ( not ( = ?auto_887408 ?auto_887421 ) ) ( not ( = ?auto_887408 ?auto_887422 ) ) ( not ( = ?auto_887409 ?auto_887410 ) ) ( not ( = ?auto_887409 ?auto_887411 ) ) ( not ( = ?auto_887409 ?auto_887412 ) ) ( not ( = ?auto_887409 ?auto_887413 ) ) ( not ( = ?auto_887409 ?auto_887414 ) ) ( not ( = ?auto_887409 ?auto_887415 ) ) ( not ( = ?auto_887409 ?auto_887416 ) ) ( not ( = ?auto_887409 ?auto_887417 ) ) ( not ( = ?auto_887409 ?auto_887418 ) ) ( not ( = ?auto_887409 ?auto_887419 ) ) ( not ( = ?auto_887409 ?auto_887420 ) ) ( not ( = ?auto_887409 ?auto_887421 ) ) ( not ( = ?auto_887409 ?auto_887422 ) ) ( not ( = ?auto_887410 ?auto_887411 ) ) ( not ( = ?auto_887410 ?auto_887412 ) ) ( not ( = ?auto_887410 ?auto_887413 ) ) ( not ( = ?auto_887410 ?auto_887414 ) ) ( not ( = ?auto_887410 ?auto_887415 ) ) ( not ( = ?auto_887410 ?auto_887416 ) ) ( not ( = ?auto_887410 ?auto_887417 ) ) ( not ( = ?auto_887410 ?auto_887418 ) ) ( not ( = ?auto_887410 ?auto_887419 ) ) ( not ( = ?auto_887410 ?auto_887420 ) ) ( not ( = ?auto_887410 ?auto_887421 ) ) ( not ( = ?auto_887410 ?auto_887422 ) ) ( not ( = ?auto_887411 ?auto_887412 ) ) ( not ( = ?auto_887411 ?auto_887413 ) ) ( not ( = ?auto_887411 ?auto_887414 ) ) ( not ( = ?auto_887411 ?auto_887415 ) ) ( not ( = ?auto_887411 ?auto_887416 ) ) ( not ( = ?auto_887411 ?auto_887417 ) ) ( not ( = ?auto_887411 ?auto_887418 ) ) ( not ( = ?auto_887411 ?auto_887419 ) ) ( not ( = ?auto_887411 ?auto_887420 ) ) ( not ( = ?auto_887411 ?auto_887421 ) ) ( not ( = ?auto_887411 ?auto_887422 ) ) ( not ( = ?auto_887412 ?auto_887413 ) ) ( not ( = ?auto_887412 ?auto_887414 ) ) ( not ( = ?auto_887412 ?auto_887415 ) ) ( not ( = ?auto_887412 ?auto_887416 ) ) ( not ( = ?auto_887412 ?auto_887417 ) ) ( not ( = ?auto_887412 ?auto_887418 ) ) ( not ( = ?auto_887412 ?auto_887419 ) ) ( not ( = ?auto_887412 ?auto_887420 ) ) ( not ( = ?auto_887412 ?auto_887421 ) ) ( not ( = ?auto_887412 ?auto_887422 ) ) ( not ( = ?auto_887413 ?auto_887414 ) ) ( not ( = ?auto_887413 ?auto_887415 ) ) ( not ( = ?auto_887413 ?auto_887416 ) ) ( not ( = ?auto_887413 ?auto_887417 ) ) ( not ( = ?auto_887413 ?auto_887418 ) ) ( not ( = ?auto_887413 ?auto_887419 ) ) ( not ( = ?auto_887413 ?auto_887420 ) ) ( not ( = ?auto_887413 ?auto_887421 ) ) ( not ( = ?auto_887413 ?auto_887422 ) ) ( not ( = ?auto_887414 ?auto_887415 ) ) ( not ( = ?auto_887414 ?auto_887416 ) ) ( not ( = ?auto_887414 ?auto_887417 ) ) ( not ( = ?auto_887414 ?auto_887418 ) ) ( not ( = ?auto_887414 ?auto_887419 ) ) ( not ( = ?auto_887414 ?auto_887420 ) ) ( not ( = ?auto_887414 ?auto_887421 ) ) ( not ( = ?auto_887414 ?auto_887422 ) ) ( not ( = ?auto_887415 ?auto_887416 ) ) ( not ( = ?auto_887415 ?auto_887417 ) ) ( not ( = ?auto_887415 ?auto_887418 ) ) ( not ( = ?auto_887415 ?auto_887419 ) ) ( not ( = ?auto_887415 ?auto_887420 ) ) ( not ( = ?auto_887415 ?auto_887421 ) ) ( not ( = ?auto_887415 ?auto_887422 ) ) ( not ( = ?auto_887416 ?auto_887417 ) ) ( not ( = ?auto_887416 ?auto_887418 ) ) ( not ( = ?auto_887416 ?auto_887419 ) ) ( not ( = ?auto_887416 ?auto_887420 ) ) ( not ( = ?auto_887416 ?auto_887421 ) ) ( not ( = ?auto_887416 ?auto_887422 ) ) ( not ( = ?auto_887417 ?auto_887418 ) ) ( not ( = ?auto_887417 ?auto_887419 ) ) ( not ( = ?auto_887417 ?auto_887420 ) ) ( not ( = ?auto_887417 ?auto_887421 ) ) ( not ( = ?auto_887417 ?auto_887422 ) ) ( not ( = ?auto_887418 ?auto_887419 ) ) ( not ( = ?auto_887418 ?auto_887420 ) ) ( not ( = ?auto_887418 ?auto_887421 ) ) ( not ( = ?auto_887418 ?auto_887422 ) ) ( not ( = ?auto_887419 ?auto_887420 ) ) ( not ( = ?auto_887419 ?auto_887421 ) ) ( not ( = ?auto_887419 ?auto_887422 ) ) ( not ( = ?auto_887420 ?auto_887421 ) ) ( not ( = ?auto_887420 ?auto_887422 ) ) ( not ( = ?auto_887421 ?auto_887422 ) ) ( ON ?auto_887420 ?auto_887421 ) ( ON ?auto_887419 ?auto_887420 ) ( ON ?auto_887418 ?auto_887419 ) ( ON ?auto_887417 ?auto_887418 ) ( ON ?auto_887416 ?auto_887417 ) ( ON ?auto_887415 ?auto_887416 ) ( ON ?auto_887414 ?auto_887415 ) ( ON ?auto_887413 ?auto_887414 ) ( ON ?auto_887412 ?auto_887413 ) ( CLEAR ?auto_887410 ) ( ON ?auto_887411 ?auto_887412 ) ( CLEAR ?auto_887411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_887405 ?auto_887406 ?auto_887407 ?auto_887408 ?auto_887409 ?auto_887410 ?auto_887411 )
      ( MAKE-17PILE ?auto_887405 ?auto_887406 ?auto_887407 ?auto_887408 ?auto_887409 ?auto_887410 ?auto_887411 ?auto_887412 ?auto_887413 ?auto_887414 ?auto_887415 ?auto_887416 ?auto_887417 ?auto_887418 ?auto_887419 ?auto_887420 ?auto_887421 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_887475 - BLOCK
      ?auto_887476 - BLOCK
      ?auto_887477 - BLOCK
      ?auto_887478 - BLOCK
      ?auto_887479 - BLOCK
      ?auto_887480 - BLOCK
      ?auto_887481 - BLOCK
      ?auto_887482 - BLOCK
      ?auto_887483 - BLOCK
      ?auto_887484 - BLOCK
      ?auto_887485 - BLOCK
      ?auto_887486 - BLOCK
      ?auto_887487 - BLOCK
      ?auto_887488 - BLOCK
      ?auto_887489 - BLOCK
      ?auto_887490 - BLOCK
      ?auto_887491 - BLOCK
    )
    :vars
    (
      ?auto_887492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887491 ?auto_887492 ) ( ON-TABLE ?auto_887475 ) ( ON ?auto_887476 ?auto_887475 ) ( ON ?auto_887477 ?auto_887476 ) ( ON ?auto_887478 ?auto_887477 ) ( ON ?auto_887479 ?auto_887478 ) ( not ( = ?auto_887475 ?auto_887476 ) ) ( not ( = ?auto_887475 ?auto_887477 ) ) ( not ( = ?auto_887475 ?auto_887478 ) ) ( not ( = ?auto_887475 ?auto_887479 ) ) ( not ( = ?auto_887475 ?auto_887480 ) ) ( not ( = ?auto_887475 ?auto_887481 ) ) ( not ( = ?auto_887475 ?auto_887482 ) ) ( not ( = ?auto_887475 ?auto_887483 ) ) ( not ( = ?auto_887475 ?auto_887484 ) ) ( not ( = ?auto_887475 ?auto_887485 ) ) ( not ( = ?auto_887475 ?auto_887486 ) ) ( not ( = ?auto_887475 ?auto_887487 ) ) ( not ( = ?auto_887475 ?auto_887488 ) ) ( not ( = ?auto_887475 ?auto_887489 ) ) ( not ( = ?auto_887475 ?auto_887490 ) ) ( not ( = ?auto_887475 ?auto_887491 ) ) ( not ( = ?auto_887475 ?auto_887492 ) ) ( not ( = ?auto_887476 ?auto_887477 ) ) ( not ( = ?auto_887476 ?auto_887478 ) ) ( not ( = ?auto_887476 ?auto_887479 ) ) ( not ( = ?auto_887476 ?auto_887480 ) ) ( not ( = ?auto_887476 ?auto_887481 ) ) ( not ( = ?auto_887476 ?auto_887482 ) ) ( not ( = ?auto_887476 ?auto_887483 ) ) ( not ( = ?auto_887476 ?auto_887484 ) ) ( not ( = ?auto_887476 ?auto_887485 ) ) ( not ( = ?auto_887476 ?auto_887486 ) ) ( not ( = ?auto_887476 ?auto_887487 ) ) ( not ( = ?auto_887476 ?auto_887488 ) ) ( not ( = ?auto_887476 ?auto_887489 ) ) ( not ( = ?auto_887476 ?auto_887490 ) ) ( not ( = ?auto_887476 ?auto_887491 ) ) ( not ( = ?auto_887476 ?auto_887492 ) ) ( not ( = ?auto_887477 ?auto_887478 ) ) ( not ( = ?auto_887477 ?auto_887479 ) ) ( not ( = ?auto_887477 ?auto_887480 ) ) ( not ( = ?auto_887477 ?auto_887481 ) ) ( not ( = ?auto_887477 ?auto_887482 ) ) ( not ( = ?auto_887477 ?auto_887483 ) ) ( not ( = ?auto_887477 ?auto_887484 ) ) ( not ( = ?auto_887477 ?auto_887485 ) ) ( not ( = ?auto_887477 ?auto_887486 ) ) ( not ( = ?auto_887477 ?auto_887487 ) ) ( not ( = ?auto_887477 ?auto_887488 ) ) ( not ( = ?auto_887477 ?auto_887489 ) ) ( not ( = ?auto_887477 ?auto_887490 ) ) ( not ( = ?auto_887477 ?auto_887491 ) ) ( not ( = ?auto_887477 ?auto_887492 ) ) ( not ( = ?auto_887478 ?auto_887479 ) ) ( not ( = ?auto_887478 ?auto_887480 ) ) ( not ( = ?auto_887478 ?auto_887481 ) ) ( not ( = ?auto_887478 ?auto_887482 ) ) ( not ( = ?auto_887478 ?auto_887483 ) ) ( not ( = ?auto_887478 ?auto_887484 ) ) ( not ( = ?auto_887478 ?auto_887485 ) ) ( not ( = ?auto_887478 ?auto_887486 ) ) ( not ( = ?auto_887478 ?auto_887487 ) ) ( not ( = ?auto_887478 ?auto_887488 ) ) ( not ( = ?auto_887478 ?auto_887489 ) ) ( not ( = ?auto_887478 ?auto_887490 ) ) ( not ( = ?auto_887478 ?auto_887491 ) ) ( not ( = ?auto_887478 ?auto_887492 ) ) ( not ( = ?auto_887479 ?auto_887480 ) ) ( not ( = ?auto_887479 ?auto_887481 ) ) ( not ( = ?auto_887479 ?auto_887482 ) ) ( not ( = ?auto_887479 ?auto_887483 ) ) ( not ( = ?auto_887479 ?auto_887484 ) ) ( not ( = ?auto_887479 ?auto_887485 ) ) ( not ( = ?auto_887479 ?auto_887486 ) ) ( not ( = ?auto_887479 ?auto_887487 ) ) ( not ( = ?auto_887479 ?auto_887488 ) ) ( not ( = ?auto_887479 ?auto_887489 ) ) ( not ( = ?auto_887479 ?auto_887490 ) ) ( not ( = ?auto_887479 ?auto_887491 ) ) ( not ( = ?auto_887479 ?auto_887492 ) ) ( not ( = ?auto_887480 ?auto_887481 ) ) ( not ( = ?auto_887480 ?auto_887482 ) ) ( not ( = ?auto_887480 ?auto_887483 ) ) ( not ( = ?auto_887480 ?auto_887484 ) ) ( not ( = ?auto_887480 ?auto_887485 ) ) ( not ( = ?auto_887480 ?auto_887486 ) ) ( not ( = ?auto_887480 ?auto_887487 ) ) ( not ( = ?auto_887480 ?auto_887488 ) ) ( not ( = ?auto_887480 ?auto_887489 ) ) ( not ( = ?auto_887480 ?auto_887490 ) ) ( not ( = ?auto_887480 ?auto_887491 ) ) ( not ( = ?auto_887480 ?auto_887492 ) ) ( not ( = ?auto_887481 ?auto_887482 ) ) ( not ( = ?auto_887481 ?auto_887483 ) ) ( not ( = ?auto_887481 ?auto_887484 ) ) ( not ( = ?auto_887481 ?auto_887485 ) ) ( not ( = ?auto_887481 ?auto_887486 ) ) ( not ( = ?auto_887481 ?auto_887487 ) ) ( not ( = ?auto_887481 ?auto_887488 ) ) ( not ( = ?auto_887481 ?auto_887489 ) ) ( not ( = ?auto_887481 ?auto_887490 ) ) ( not ( = ?auto_887481 ?auto_887491 ) ) ( not ( = ?auto_887481 ?auto_887492 ) ) ( not ( = ?auto_887482 ?auto_887483 ) ) ( not ( = ?auto_887482 ?auto_887484 ) ) ( not ( = ?auto_887482 ?auto_887485 ) ) ( not ( = ?auto_887482 ?auto_887486 ) ) ( not ( = ?auto_887482 ?auto_887487 ) ) ( not ( = ?auto_887482 ?auto_887488 ) ) ( not ( = ?auto_887482 ?auto_887489 ) ) ( not ( = ?auto_887482 ?auto_887490 ) ) ( not ( = ?auto_887482 ?auto_887491 ) ) ( not ( = ?auto_887482 ?auto_887492 ) ) ( not ( = ?auto_887483 ?auto_887484 ) ) ( not ( = ?auto_887483 ?auto_887485 ) ) ( not ( = ?auto_887483 ?auto_887486 ) ) ( not ( = ?auto_887483 ?auto_887487 ) ) ( not ( = ?auto_887483 ?auto_887488 ) ) ( not ( = ?auto_887483 ?auto_887489 ) ) ( not ( = ?auto_887483 ?auto_887490 ) ) ( not ( = ?auto_887483 ?auto_887491 ) ) ( not ( = ?auto_887483 ?auto_887492 ) ) ( not ( = ?auto_887484 ?auto_887485 ) ) ( not ( = ?auto_887484 ?auto_887486 ) ) ( not ( = ?auto_887484 ?auto_887487 ) ) ( not ( = ?auto_887484 ?auto_887488 ) ) ( not ( = ?auto_887484 ?auto_887489 ) ) ( not ( = ?auto_887484 ?auto_887490 ) ) ( not ( = ?auto_887484 ?auto_887491 ) ) ( not ( = ?auto_887484 ?auto_887492 ) ) ( not ( = ?auto_887485 ?auto_887486 ) ) ( not ( = ?auto_887485 ?auto_887487 ) ) ( not ( = ?auto_887485 ?auto_887488 ) ) ( not ( = ?auto_887485 ?auto_887489 ) ) ( not ( = ?auto_887485 ?auto_887490 ) ) ( not ( = ?auto_887485 ?auto_887491 ) ) ( not ( = ?auto_887485 ?auto_887492 ) ) ( not ( = ?auto_887486 ?auto_887487 ) ) ( not ( = ?auto_887486 ?auto_887488 ) ) ( not ( = ?auto_887486 ?auto_887489 ) ) ( not ( = ?auto_887486 ?auto_887490 ) ) ( not ( = ?auto_887486 ?auto_887491 ) ) ( not ( = ?auto_887486 ?auto_887492 ) ) ( not ( = ?auto_887487 ?auto_887488 ) ) ( not ( = ?auto_887487 ?auto_887489 ) ) ( not ( = ?auto_887487 ?auto_887490 ) ) ( not ( = ?auto_887487 ?auto_887491 ) ) ( not ( = ?auto_887487 ?auto_887492 ) ) ( not ( = ?auto_887488 ?auto_887489 ) ) ( not ( = ?auto_887488 ?auto_887490 ) ) ( not ( = ?auto_887488 ?auto_887491 ) ) ( not ( = ?auto_887488 ?auto_887492 ) ) ( not ( = ?auto_887489 ?auto_887490 ) ) ( not ( = ?auto_887489 ?auto_887491 ) ) ( not ( = ?auto_887489 ?auto_887492 ) ) ( not ( = ?auto_887490 ?auto_887491 ) ) ( not ( = ?auto_887490 ?auto_887492 ) ) ( not ( = ?auto_887491 ?auto_887492 ) ) ( ON ?auto_887490 ?auto_887491 ) ( ON ?auto_887489 ?auto_887490 ) ( ON ?auto_887488 ?auto_887489 ) ( ON ?auto_887487 ?auto_887488 ) ( ON ?auto_887486 ?auto_887487 ) ( ON ?auto_887485 ?auto_887486 ) ( ON ?auto_887484 ?auto_887485 ) ( ON ?auto_887483 ?auto_887484 ) ( ON ?auto_887482 ?auto_887483 ) ( ON ?auto_887481 ?auto_887482 ) ( CLEAR ?auto_887479 ) ( ON ?auto_887480 ?auto_887481 ) ( CLEAR ?auto_887480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_887475 ?auto_887476 ?auto_887477 ?auto_887478 ?auto_887479 ?auto_887480 )
      ( MAKE-17PILE ?auto_887475 ?auto_887476 ?auto_887477 ?auto_887478 ?auto_887479 ?auto_887480 ?auto_887481 ?auto_887482 ?auto_887483 ?auto_887484 ?auto_887485 ?auto_887486 ?auto_887487 ?auto_887488 ?auto_887489 ?auto_887490 ?auto_887491 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_887545 - BLOCK
      ?auto_887546 - BLOCK
      ?auto_887547 - BLOCK
      ?auto_887548 - BLOCK
      ?auto_887549 - BLOCK
      ?auto_887550 - BLOCK
      ?auto_887551 - BLOCK
      ?auto_887552 - BLOCK
      ?auto_887553 - BLOCK
      ?auto_887554 - BLOCK
      ?auto_887555 - BLOCK
      ?auto_887556 - BLOCK
      ?auto_887557 - BLOCK
      ?auto_887558 - BLOCK
      ?auto_887559 - BLOCK
      ?auto_887560 - BLOCK
      ?auto_887561 - BLOCK
    )
    :vars
    (
      ?auto_887562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887561 ?auto_887562 ) ( ON-TABLE ?auto_887545 ) ( ON ?auto_887546 ?auto_887545 ) ( ON ?auto_887547 ?auto_887546 ) ( ON ?auto_887548 ?auto_887547 ) ( not ( = ?auto_887545 ?auto_887546 ) ) ( not ( = ?auto_887545 ?auto_887547 ) ) ( not ( = ?auto_887545 ?auto_887548 ) ) ( not ( = ?auto_887545 ?auto_887549 ) ) ( not ( = ?auto_887545 ?auto_887550 ) ) ( not ( = ?auto_887545 ?auto_887551 ) ) ( not ( = ?auto_887545 ?auto_887552 ) ) ( not ( = ?auto_887545 ?auto_887553 ) ) ( not ( = ?auto_887545 ?auto_887554 ) ) ( not ( = ?auto_887545 ?auto_887555 ) ) ( not ( = ?auto_887545 ?auto_887556 ) ) ( not ( = ?auto_887545 ?auto_887557 ) ) ( not ( = ?auto_887545 ?auto_887558 ) ) ( not ( = ?auto_887545 ?auto_887559 ) ) ( not ( = ?auto_887545 ?auto_887560 ) ) ( not ( = ?auto_887545 ?auto_887561 ) ) ( not ( = ?auto_887545 ?auto_887562 ) ) ( not ( = ?auto_887546 ?auto_887547 ) ) ( not ( = ?auto_887546 ?auto_887548 ) ) ( not ( = ?auto_887546 ?auto_887549 ) ) ( not ( = ?auto_887546 ?auto_887550 ) ) ( not ( = ?auto_887546 ?auto_887551 ) ) ( not ( = ?auto_887546 ?auto_887552 ) ) ( not ( = ?auto_887546 ?auto_887553 ) ) ( not ( = ?auto_887546 ?auto_887554 ) ) ( not ( = ?auto_887546 ?auto_887555 ) ) ( not ( = ?auto_887546 ?auto_887556 ) ) ( not ( = ?auto_887546 ?auto_887557 ) ) ( not ( = ?auto_887546 ?auto_887558 ) ) ( not ( = ?auto_887546 ?auto_887559 ) ) ( not ( = ?auto_887546 ?auto_887560 ) ) ( not ( = ?auto_887546 ?auto_887561 ) ) ( not ( = ?auto_887546 ?auto_887562 ) ) ( not ( = ?auto_887547 ?auto_887548 ) ) ( not ( = ?auto_887547 ?auto_887549 ) ) ( not ( = ?auto_887547 ?auto_887550 ) ) ( not ( = ?auto_887547 ?auto_887551 ) ) ( not ( = ?auto_887547 ?auto_887552 ) ) ( not ( = ?auto_887547 ?auto_887553 ) ) ( not ( = ?auto_887547 ?auto_887554 ) ) ( not ( = ?auto_887547 ?auto_887555 ) ) ( not ( = ?auto_887547 ?auto_887556 ) ) ( not ( = ?auto_887547 ?auto_887557 ) ) ( not ( = ?auto_887547 ?auto_887558 ) ) ( not ( = ?auto_887547 ?auto_887559 ) ) ( not ( = ?auto_887547 ?auto_887560 ) ) ( not ( = ?auto_887547 ?auto_887561 ) ) ( not ( = ?auto_887547 ?auto_887562 ) ) ( not ( = ?auto_887548 ?auto_887549 ) ) ( not ( = ?auto_887548 ?auto_887550 ) ) ( not ( = ?auto_887548 ?auto_887551 ) ) ( not ( = ?auto_887548 ?auto_887552 ) ) ( not ( = ?auto_887548 ?auto_887553 ) ) ( not ( = ?auto_887548 ?auto_887554 ) ) ( not ( = ?auto_887548 ?auto_887555 ) ) ( not ( = ?auto_887548 ?auto_887556 ) ) ( not ( = ?auto_887548 ?auto_887557 ) ) ( not ( = ?auto_887548 ?auto_887558 ) ) ( not ( = ?auto_887548 ?auto_887559 ) ) ( not ( = ?auto_887548 ?auto_887560 ) ) ( not ( = ?auto_887548 ?auto_887561 ) ) ( not ( = ?auto_887548 ?auto_887562 ) ) ( not ( = ?auto_887549 ?auto_887550 ) ) ( not ( = ?auto_887549 ?auto_887551 ) ) ( not ( = ?auto_887549 ?auto_887552 ) ) ( not ( = ?auto_887549 ?auto_887553 ) ) ( not ( = ?auto_887549 ?auto_887554 ) ) ( not ( = ?auto_887549 ?auto_887555 ) ) ( not ( = ?auto_887549 ?auto_887556 ) ) ( not ( = ?auto_887549 ?auto_887557 ) ) ( not ( = ?auto_887549 ?auto_887558 ) ) ( not ( = ?auto_887549 ?auto_887559 ) ) ( not ( = ?auto_887549 ?auto_887560 ) ) ( not ( = ?auto_887549 ?auto_887561 ) ) ( not ( = ?auto_887549 ?auto_887562 ) ) ( not ( = ?auto_887550 ?auto_887551 ) ) ( not ( = ?auto_887550 ?auto_887552 ) ) ( not ( = ?auto_887550 ?auto_887553 ) ) ( not ( = ?auto_887550 ?auto_887554 ) ) ( not ( = ?auto_887550 ?auto_887555 ) ) ( not ( = ?auto_887550 ?auto_887556 ) ) ( not ( = ?auto_887550 ?auto_887557 ) ) ( not ( = ?auto_887550 ?auto_887558 ) ) ( not ( = ?auto_887550 ?auto_887559 ) ) ( not ( = ?auto_887550 ?auto_887560 ) ) ( not ( = ?auto_887550 ?auto_887561 ) ) ( not ( = ?auto_887550 ?auto_887562 ) ) ( not ( = ?auto_887551 ?auto_887552 ) ) ( not ( = ?auto_887551 ?auto_887553 ) ) ( not ( = ?auto_887551 ?auto_887554 ) ) ( not ( = ?auto_887551 ?auto_887555 ) ) ( not ( = ?auto_887551 ?auto_887556 ) ) ( not ( = ?auto_887551 ?auto_887557 ) ) ( not ( = ?auto_887551 ?auto_887558 ) ) ( not ( = ?auto_887551 ?auto_887559 ) ) ( not ( = ?auto_887551 ?auto_887560 ) ) ( not ( = ?auto_887551 ?auto_887561 ) ) ( not ( = ?auto_887551 ?auto_887562 ) ) ( not ( = ?auto_887552 ?auto_887553 ) ) ( not ( = ?auto_887552 ?auto_887554 ) ) ( not ( = ?auto_887552 ?auto_887555 ) ) ( not ( = ?auto_887552 ?auto_887556 ) ) ( not ( = ?auto_887552 ?auto_887557 ) ) ( not ( = ?auto_887552 ?auto_887558 ) ) ( not ( = ?auto_887552 ?auto_887559 ) ) ( not ( = ?auto_887552 ?auto_887560 ) ) ( not ( = ?auto_887552 ?auto_887561 ) ) ( not ( = ?auto_887552 ?auto_887562 ) ) ( not ( = ?auto_887553 ?auto_887554 ) ) ( not ( = ?auto_887553 ?auto_887555 ) ) ( not ( = ?auto_887553 ?auto_887556 ) ) ( not ( = ?auto_887553 ?auto_887557 ) ) ( not ( = ?auto_887553 ?auto_887558 ) ) ( not ( = ?auto_887553 ?auto_887559 ) ) ( not ( = ?auto_887553 ?auto_887560 ) ) ( not ( = ?auto_887553 ?auto_887561 ) ) ( not ( = ?auto_887553 ?auto_887562 ) ) ( not ( = ?auto_887554 ?auto_887555 ) ) ( not ( = ?auto_887554 ?auto_887556 ) ) ( not ( = ?auto_887554 ?auto_887557 ) ) ( not ( = ?auto_887554 ?auto_887558 ) ) ( not ( = ?auto_887554 ?auto_887559 ) ) ( not ( = ?auto_887554 ?auto_887560 ) ) ( not ( = ?auto_887554 ?auto_887561 ) ) ( not ( = ?auto_887554 ?auto_887562 ) ) ( not ( = ?auto_887555 ?auto_887556 ) ) ( not ( = ?auto_887555 ?auto_887557 ) ) ( not ( = ?auto_887555 ?auto_887558 ) ) ( not ( = ?auto_887555 ?auto_887559 ) ) ( not ( = ?auto_887555 ?auto_887560 ) ) ( not ( = ?auto_887555 ?auto_887561 ) ) ( not ( = ?auto_887555 ?auto_887562 ) ) ( not ( = ?auto_887556 ?auto_887557 ) ) ( not ( = ?auto_887556 ?auto_887558 ) ) ( not ( = ?auto_887556 ?auto_887559 ) ) ( not ( = ?auto_887556 ?auto_887560 ) ) ( not ( = ?auto_887556 ?auto_887561 ) ) ( not ( = ?auto_887556 ?auto_887562 ) ) ( not ( = ?auto_887557 ?auto_887558 ) ) ( not ( = ?auto_887557 ?auto_887559 ) ) ( not ( = ?auto_887557 ?auto_887560 ) ) ( not ( = ?auto_887557 ?auto_887561 ) ) ( not ( = ?auto_887557 ?auto_887562 ) ) ( not ( = ?auto_887558 ?auto_887559 ) ) ( not ( = ?auto_887558 ?auto_887560 ) ) ( not ( = ?auto_887558 ?auto_887561 ) ) ( not ( = ?auto_887558 ?auto_887562 ) ) ( not ( = ?auto_887559 ?auto_887560 ) ) ( not ( = ?auto_887559 ?auto_887561 ) ) ( not ( = ?auto_887559 ?auto_887562 ) ) ( not ( = ?auto_887560 ?auto_887561 ) ) ( not ( = ?auto_887560 ?auto_887562 ) ) ( not ( = ?auto_887561 ?auto_887562 ) ) ( ON ?auto_887560 ?auto_887561 ) ( ON ?auto_887559 ?auto_887560 ) ( ON ?auto_887558 ?auto_887559 ) ( ON ?auto_887557 ?auto_887558 ) ( ON ?auto_887556 ?auto_887557 ) ( ON ?auto_887555 ?auto_887556 ) ( ON ?auto_887554 ?auto_887555 ) ( ON ?auto_887553 ?auto_887554 ) ( ON ?auto_887552 ?auto_887553 ) ( ON ?auto_887551 ?auto_887552 ) ( ON ?auto_887550 ?auto_887551 ) ( CLEAR ?auto_887548 ) ( ON ?auto_887549 ?auto_887550 ) ( CLEAR ?auto_887549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_887545 ?auto_887546 ?auto_887547 ?auto_887548 ?auto_887549 )
      ( MAKE-17PILE ?auto_887545 ?auto_887546 ?auto_887547 ?auto_887548 ?auto_887549 ?auto_887550 ?auto_887551 ?auto_887552 ?auto_887553 ?auto_887554 ?auto_887555 ?auto_887556 ?auto_887557 ?auto_887558 ?auto_887559 ?auto_887560 ?auto_887561 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_887615 - BLOCK
      ?auto_887616 - BLOCK
      ?auto_887617 - BLOCK
      ?auto_887618 - BLOCK
      ?auto_887619 - BLOCK
      ?auto_887620 - BLOCK
      ?auto_887621 - BLOCK
      ?auto_887622 - BLOCK
      ?auto_887623 - BLOCK
      ?auto_887624 - BLOCK
      ?auto_887625 - BLOCK
      ?auto_887626 - BLOCK
      ?auto_887627 - BLOCK
      ?auto_887628 - BLOCK
      ?auto_887629 - BLOCK
      ?auto_887630 - BLOCK
      ?auto_887631 - BLOCK
    )
    :vars
    (
      ?auto_887632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887631 ?auto_887632 ) ( ON-TABLE ?auto_887615 ) ( ON ?auto_887616 ?auto_887615 ) ( ON ?auto_887617 ?auto_887616 ) ( not ( = ?auto_887615 ?auto_887616 ) ) ( not ( = ?auto_887615 ?auto_887617 ) ) ( not ( = ?auto_887615 ?auto_887618 ) ) ( not ( = ?auto_887615 ?auto_887619 ) ) ( not ( = ?auto_887615 ?auto_887620 ) ) ( not ( = ?auto_887615 ?auto_887621 ) ) ( not ( = ?auto_887615 ?auto_887622 ) ) ( not ( = ?auto_887615 ?auto_887623 ) ) ( not ( = ?auto_887615 ?auto_887624 ) ) ( not ( = ?auto_887615 ?auto_887625 ) ) ( not ( = ?auto_887615 ?auto_887626 ) ) ( not ( = ?auto_887615 ?auto_887627 ) ) ( not ( = ?auto_887615 ?auto_887628 ) ) ( not ( = ?auto_887615 ?auto_887629 ) ) ( not ( = ?auto_887615 ?auto_887630 ) ) ( not ( = ?auto_887615 ?auto_887631 ) ) ( not ( = ?auto_887615 ?auto_887632 ) ) ( not ( = ?auto_887616 ?auto_887617 ) ) ( not ( = ?auto_887616 ?auto_887618 ) ) ( not ( = ?auto_887616 ?auto_887619 ) ) ( not ( = ?auto_887616 ?auto_887620 ) ) ( not ( = ?auto_887616 ?auto_887621 ) ) ( not ( = ?auto_887616 ?auto_887622 ) ) ( not ( = ?auto_887616 ?auto_887623 ) ) ( not ( = ?auto_887616 ?auto_887624 ) ) ( not ( = ?auto_887616 ?auto_887625 ) ) ( not ( = ?auto_887616 ?auto_887626 ) ) ( not ( = ?auto_887616 ?auto_887627 ) ) ( not ( = ?auto_887616 ?auto_887628 ) ) ( not ( = ?auto_887616 ?auto_887629 ) ) ( not ( = ?auto_887616 ?auto_887630 ) ) ( not ( = ?auto_887616 ?auto_887631 ) ) ( not ( = ?auto_887616 ?auto_887632 ) ) ( not ( = ?auto_887617 ?auto_887618 ) ) ( not ( = ?auto_887617 ?auto_887619 ) ) ( not ( = ?auto_887617 ?auto_887620 ) ) ( not ( = ?auto_887617 ?auto_887621 ) ) ( not ( = ?auto_887617 ?auto_887622 ) ) ( not ( = ?auto_887617 ?auto_887623 ) ) ( not ( = ?auto_887617 ?auto_887624 ) ) ( not ( = ?auto_887617 ?auto_887625 ) ) ( not ( = ?auto_887617 ?auto_887626 ) ) ( not ( = ?auto_887617 ?auto_887627 ) ) ( not ( = ?auto_887617 ?auto_887628 ) ) ( not ( = ?auto_887617 ?auto_887629 ) ) ( not ( = ?auto_887617 ?auto_887630 ) ) ( not ( = ?auto_887617 ?auto_887631 ) ) ( not ( = ?auto_887617 ?auto_887632 ) ) ( not ( = ?auto_887618 ?auto_887619 ) ) ( not ( = ?auto_887618 ?auto_887620 ) ) ( not ( = ?auto_887618 ?auto_887621 ) ) ( not ( = ?auto_887618 ?auto_887622 ) ) ( not ( = ?auto_887618 ?auto_887623 ) ) ( not ( = ?auto_887618 ?auto_887624 ) ) ( not ( = ?auto_887618 ?auto_887625 ) ) ( not ( = ?auto_887618 ?auto_887626 ) ) ( not ( = ?auto_887618 ?auto_887627 ) ) ( not ( = ?auto_887618 ?auto_887628 ) ) ( not ( = ?auto_887618 ?auto_887629 ) ) ( not ( = ?auto_887618 ?auto_887630 ) ) ( not ( = ?auto_887618 ?auto_887631 ) ) ( not ( = ?auto_887618 ?auto_887632 ) ) ( not ( = ?auto_887619 ?auto_887620 ) ) ( not ( = ?auto_887619 ?auto_887621 ) ) ( not ( = ?auto_887619 ?auto_887622 ) ) ( not ( = ?auto_887619 ?auto_887623 ) ) ( not ( = ?auto_887619 ?auto_887624 ) ) ( not ( = ?auto_887619 ?auto_887625 ) ) ( not ( = ?auto_887619 ?auto_887626 ) ) ( not ( = ?auto_887619 ?auto_887627 ) ) ( not ( = ?auto_887619 ?auto_887628 ) ) ( not ( = ?auto_887619 ?auto_887629 ) ) ( not ( = ?auto_887619 ?auto_887630 ) ) ( not ( = ?auto_887619 ?auto_887631 ) ) ( not ( = ?auto_887619 ?auto_887632 ) ) ( not ( = ?auto_887620 ?auto_887621 ) ) ( not ( = ?auto_887620 ?auto_887622 ) ) ( not ( = ?auto_887620 ?auto_887623 ) ) ( not ( = ?auto_887620 ?auto_887624 ) ) ( not ( = ?auto_887620 ?auto_887625 ) ) ( not ( = ?auto_887620 ?auto_887626 ) ) ( not ( = ?auto_887620 ?auto_887627 ) ) ( not ( = ?auto_887620 ?auto_887628 ) ) ( not ( = ?auto_887620 ?auto_887629 ) ) ( not ( = ?auto_887620 ?auto_887630 ) ) ( not ( = ?auto_887620 ?auto_887631 ) ) ( not ( = ?auto_887620 ?auto_887632 ) ) ( not ( = ?auto_887621 ?auto_887622 ) ) ( not ( = ?auto_887621 ?auto_887623 ) ) ( not ( = ?auto_887621 ?auto_887624 ) ) ( not ( = ?auto_887621 ?auto_887625 ) ) ( not ( = ?auto_887621 ?auto_887626 ) ) ( not ( = ?auto_887621 ?auto_887627 ) ) ( not ( = ?auto_887621 ?auto_887628 ) ) ( not ( = ?auto_887621 ?auto_887629 ) ) ( not ( = ?auto_887621 ?auto_887630 ) ) ( not ( = ?auto_887621 ?auto_887631 ) ) ( not ( = ?auto_887621 ?auto_887632 ) ) ( not ( = ?auto_887622 ?auto_887623 ) ) ( not ( = ?auto_887622 ?auto_887624 ) ) ( not ( = ?auto_887622 ?auto_887625 ) ) ( not ( = ?auto_887622 ?auto_887626 ) ) ( not ( = ?auto_887622 ?auto_887627 ) ) ( not ( = ?auto_887622 ?auto_887628 ) ) ( not ( = ?auto_887622 ?auto_887629 ) ) ( not ( = ?auto_887622 ?auto_887630 ) ) ( not ( = ?auto_887622 ?auto_887631 ) ) ( not ( = ?auto_887622 ?auto_887632 ) ) ( not ( = ?auto_887623 ?auto_887624 ) ) ( not ( = ?auto_887623 ?auto_887625 ) ) ( not ( = ?auto_887623 ?auto_887626 ) ) ( not ( = ?auto_887623 ?auto_887627 ) ) ( not ( = ?auto_887623 ?auto_887628 ) ) ( not ( = ?auto_887623 ?auto_887629 ) ) ( not ( = ?auto_887623 ?auto_887630 ) ) ( not ( = ?auto_887623 ?auto_887631 ) ) ( not ( = ?auto_887623 ?auto_887632 ) ) ( not ( = ?auto_887624 ?auto_887625 ) ) ( not ( = ?auto_887624 ?auto_887626 ) ) ( not ( = ?auto_887624 ?auto_887627 ) ) ( not ( = ?auto_887624 ?auto_887628 ) ) ( not ( = ?auto_887624 ?auto_887629 ) ) ( not ( = ?auto_887624 ?auto_887630 ) ) ( not ( = ?auto_887624 ?auto_887631 ) ) ( not ( = ?auto_887624 ?auto_887632 ) ) ( not ( = ?auto_887625 ?auto_887626 ) ) ( not ( = ?auto_887625 ?auto_887627 ) ) ( not ( = ?auto_887625 ?auto_887628 ) ) ( not ( = ?auto_887625 ?auto_887629 ) ) ( not ( = ?auto_887625 ?auto_887630 ) ) ( not ( = ?auto_887625 ?auto_887631 ) ) ( not ( = ?auto_887625 ?auto_887632 ) ) ( not ( = ?auto_887626 ?auto_887627 ) ) ( not ( = ?auto_887626 ?auto_887628 ) ) ( not ( = ?auto_887626 ?auto_887629 ) ) ( not ( = ?auto_887626 ?auto_887630 ) ) ( not ( = ?auto_887626 ?auto_887631 ) ) ( not ( = ?auto_887626 ?auto_887632 ) ) ( not ( = ?auto_887627 ?auto_887628 ) ) ( not ( = ?auto_887627 ?auto_887629 ) ) ( not ( = ?auto_887627 ?auto_887630 ) ) ( not ( = ?auto_887627 ?auto_887631 ) ) ( not ( = ?auto_887627 ?auto_887632 ) ) ( not ( = ?auto_887628 ?auto_887629 ) ) ( not ( = ?auto_887628 ?auto_887630 ) ) ( not ( = ?auto_887628 ?auto_887631 ) ) ( not ( = ?auto_887628 ?auto_887632 ) ) ( not ( = ?auto_887629 ?auto_887630 ) ) ( not ( = ?auto_887629 ?auto_887631 ) ) ( not ( = ?auto_887629 ?auto_887632 ) ) ( not ( = ?auto_887630 ?auto_887631 ) ) ( not ( = ?auto_887630 ?auto_887632 ) ) ( not ( = ?auto_887631 ?auto_887632 ) ) ( ON ?auto_887630 ?auto_887631 ) ( ON ?auto_887629 ?auto_887630 ) ( ON ?auto_887628 ?auto_887629 ) ( ON ?auto_887627 ?auto_887628 ) ( ON ?auto_887626 ?auto_887627 ) ( ON ?auto_887625 ?auto_887626 ) ( ON ?auto_887624 ?auto_887625 ) ( ON ?auto_887623 ?auto_887624 ) ( ON ?auto_887622 ?auto_887623 ) ( ON ?auto_887621 ?auto_887622 ) ( ON ?auto_887620 ?auto_887621 ) ( ON ?auto_887619 ?auto_887620 ) ( CLEAR ?auto_887617 ) ( ON ?auto_887618 ?auto_887619 ) ( CLEAR ?auto_887618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_887615 ?auto_887616 ?auto_887617 ?auto_887618 )
      ( MAKE-17PILE ?auto_887615 ?auto_887616 ?auto_887617 ?auto_887618 ?auto_887619 ?auto_887620 ?auto_887621 ?auto_887622 ?auto_887623 ?auto_887624 ?auto_887625 ?auto_887626 ?auto_887627 ?auto_887628 ?auto_887629 ?auto_887630 ?auto_887631 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_887685 - BLOCK
      ?auto_887686 - BLOCK
      ?auto_887687 - BLOCK
      ?auto_887688 - BLOCK
      ?auto_887689 - BLOCK
      ?auto_887690 - BLOCK
      ?auto_887691 - BLOCK
      ?auto_887692 - BLOCK
      ?auto_887693 - BLOCK
      ?auto_887694 - BLOCK
      ?auto_887695 - BLOCK
      ?auto_887696 - BLOCK
      ?auto_887697 - BLOCK
      ?auto_887698 - BLOCK
      ?auto_887699 - BLOCK
      ?auto_887700 - BLOCK
      ?auto_887701 - BLOCK
    )
    :vars
    (
      ?auto_887702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887701 ?auto_887702 ) ( ON-TABLE ?auto_887685 ) ( ON ?auto_887686 ?auto_887685 ) ( not ( = ?auto_887685 ?auto_887686 ) ) ( not ( = ?auto_887685 ?auto_887687 ) ) ( not ( = ?auto_887685 ?auto_887688 ) ) ( not ( = ?auto_887685 ?auto_887689 ) ) ( not ( = ?auto_887685 ?auto_887690 ) ) ( not ( = ?auto_887685 ?auto_887691 ) ) ( not ( = ?auto_887685 ?auto_887692 ) ) ( not ( = ?auto_887685 ?auto_887693 ) ) ( not ( = ?auto_887685 ?auto_887694 ) ) ( not ( = ?auto_887685 ?auto_887695 ) ) ( not ( = ?auto_887685 ?auto_887696 ) ) ( not ( = ?auto_887685 ?auto_887697 ) ) ( not ( = ?auto_887685 ?auto_887698 ) ) ( not ( = ?auto_887685 ?auto_887699 ) ) ( not ( = ?auto_887685 ?auto_887700 ) ) ( not ( = ?auto_887685 ?auto_887701 ) ) ( not ( = ?auto_887685 ?auto_887702 ) ) ( not ( = ?auto_887686 ?auto_887687 ) ) ( not ( = ?auto_887686 ?auto_887688 ) ) ( not ( = ?auto_887686 ?auto_887689 ) ) ( not ( = ?auto_887686 ?auto_887690 ) ) ( not ( = ?auto_887686 ?auto_887691 ) ) ( not ( = ?auto_887686 ?auto_887692 ) ) ( not ( = ?auto_887686 ?auto_887693 ) ) ( not ( = ?auto_887686 ?auto_887694 ) ) ( not ( = ?auto_887686 ?auto_887695 ) ) ( not ( = ?auto_887686 ?auto_887696 ) ) ( not ( = ?auto_887686 ?auto_887697 ) ) ( not ( = ?auto_887686 ?auto_887698 ) ) ( not ( = ?auto_887686 ?auto_887699 ) ) ( not ( = ?auto_887686 ?auto_887700 ) ) ( not ( = ?auto_887686 ?auto_887701 ) ) ( not ( = ?auto_887686 ?auto_887702 ) ) ( not ( = ?auto_887687 ?auto_887688 ) ) ( not ( = ?auto_887687 ?auto_887689 ) ) ( not ( = ?auto_887687 ?auto_887690 ) ) ( not ( = ?auto_887687 ?auto_887691 ) ) ( not ( = ?auto_887687 ?auto_887692 ) ) ( not ( = ?auto_887687 ?auto_887693 ) ) ( not ( = ?auto_887687 ?auto_887694 ) ) ( not ( = ?auto_887687 ?auto_887695 ) ) ( not ( = ?auto_887687 ?auto_887696 ) ) ( not ( = ?auto_887687 ?auto_887697 ) ) ( not ( = ?auto_887687 ?auto_887698 ) ) ( not ( = ?auto_887687 ?auto_887699 ) ) ( not ( = ?auto_887687 ?auto_887700 ) ) ( not ( = ?auto_887687 ?auto_887701 ) ) ( not ( = ?auto_887687 ?auto_887702 ) ) ( not ( = ?auto_887688 ?auto_887689 ) ) ( not ( = ?auto_887688 ?auto_887690 ) ) ( not ( = ?auto_887688 ?auto_887691 ) ) ( not ( = ?auto_887688 ?auto_887692 ) ) ( not ( = ?auto_887688 ?auto_887693 ) ) ( not ( = ?auto_887688 ?auto_887694 ) ) ( not ( = ?auto_887688 ?auto_887695 ) ) ( not ( = ?auto_887688 ?auto_887696 ) ) ( not ( = ?auto_887688 ?auto_887697 ) ) ( not ( = ?auto_887688 ?auto_887698 ) ) ( not ( = ?auto_887688 ?auto_887699 ) ) ( not ( = ?auto_887688 ?auto_887700 ) ) ( not ( = ?auto_887688 ?auto_887701 ) ) ( not ( = ?auto_887688 ?auto_887702 ) ) ( not ( = ?auto_887689 ?auto_887690 ) ) ( not ( = ?auto_887689 ?auto_887691 ) ) ( not ( = ?auto_887689 ?auto_887692 ) ) ( not ( = ?auto_887689 ?auto_887693 ) ) ( not ( = ?auto_887689 ?auto_887694 ) ) ( not ( = ?auto_887689 ?auto_887695 ) ) ( not ( = ?auto_887689 ?auto_887696 ) ) ( not ( = ?auto_887689 ?auto_887697 ) ) ( not ( = ?auto_887689 ?auto_887698 ) ) ( not ( = ?auto_887689 ?auto_887699 ) ) ( not ( = ?auto_887689 ?auto_887700 ) ) ( not ( = ?auto_887689 ?auto_887701 ) ) ( not ( = ?auto_887689 ?auto_887702 ) ) ( not ( = ?auto_887690 ?auto_887691 ) ) ( not ( = ?auto_887690 ?auto_887692 ) ) ( not ( = ?auto_887690 ?auto_887693 ) ) ( not ( = ?auto_887690 ?auto_887694 ) ) ( not ( = ?auto_887690 ?auto_887695 ) ) ( not ( = ?auto_887690 ?auto_887696 ) ) ( not ( = ?auto_887690 ?auto_887697 ) ) ( not ( = ?auto_887690 ?auto_887698 ) ) ( not ( = ?auto_887690 ?auto_887699 ) ) ( not ( = ?auto_887690 ?auto_887700 ) ) ( not ( = ?auto_887690 ?auto_887701 ) ) ( not ( = ?auto_887690 ?auto_887702 ) ) ( not ( = ?auto_887691 ?auto_887692 ) ) ( not ( = ?auto_887691 ?auto_887693 ) ) ( not ( = ?auto_887691 ?auto_887694 ) ) ( not ( = ?auto_887691 ?auto_887695 ) ) ( not ( = ?auto_887691 ?auto_887696 ) ) ( not ( = ?auto_887691 ?auto_887697 ) ) ( not ( = ?auto_887691 ?auto_887698 ) ) ( not ( = ?auto_887691 ?auto_887699 ) ) ( not ( = ?auto_887691 ?auto_887700 ) ) ( not ( = ?auto_887691 ?auto_887701 ) ) ( not ( = ?auto_887691 ?auto_887702 ) ) ( not ( = ?auto_887692 ?auto_887693 ) ) ( not ( = ?auto_887692 ?auto_887694 ) ) ( not ( = ?auto_887692 ?auto_887695 ) ) ( not ( = ?auto_887692 ?auto_887696 ) ) ( not ( = ?auto_887692 ?auto_887697 ) ) ( not ( = ?auto_887692 ?auto_887698 ) ) ( not ( = ?auto_887692 ?auto_887699 ) ) ( not ( = ?auto_887692 ?auto_887700 ) ) ( not ( = ?auto_887692 ?auto_887701 ) ) ( not ( = ?auto_887692 ?auto_887702 ) ) ( not ( = ?auto_887693 ?auto_887694 ) ) ( not ( = ?auto_887693 ?auto_887695 ) ) ( not ( = ?auto_887693 ?auto_887696 ) ) ( not ( = ?auto_887693 ?auto_887697 ) ) ( not ( = ?auto_887693 ?auto_887698 ) ) ( not ( = ?auto_887693 ?auto_887699 ) ) ( not ( = ?auto_887693 ?auto_887700 ) ) ( not ( = ?auto_887693 ?auto_887701 ) ) ( not ( = ?auto_887693 ?auto_887702 ) ) ( not ( = ?auto_887694 ?auto_887695 ) ) ( not ( = ?auto_887694 ?auto_887696 ) ) ( not ( = ?auto_887694 ?auto_887697 ) ) ( not ( = ?auto_887694 ?auto_887698 ) ) ( not ( = ?auto_887694 ?auto_887699 ) ) ( not ( = ?auto_887694 ?auto_887700 ) ) ( not ( = ?auto_887694 ?auto_887701 ) ) ( not ( = ?auto_887694 ?auto_887702 ) ) ( not ( = ?auto_887695 ?auto_887696 ) ) ( not ( = ?auto_887695 ?auto_887697 ) ) ( not ( = ?auto_887695 ?auto_887698 ) ) ( not ( = ?auto_887695 ?auto_887699 ) ) ( not ( = ?auto_887695 ?auto_887700 ) ) ( not ( = ?auto_887695 ?auto_887701 ) ) ( not ( = ?auto_887695 ?auto_887702 ) ) ( not ( = ?auto_887696 ?auto_887697 ) ) ( not ( = ?auto_887696 ?auto_887698 ) ) ( not ( = ?auto_887696 ?auto_887699 ) ) ( not ( = ?auto_887696 ?auto_887700 ) ) ( not ( = ?auto_887696 ?auto_887701 ) ) ( not ( = ?auto_887696 ?auto_887702 ) ) ( not ( = ?auto_887697 ?auto_887698 ) ) ( not ( = ?auto_887697 ?auto_887699 ) ) ( not ( = ?auto_887697 ?auto_887700 ) ) ( not ( = ?auto_887697 ?auto_887701 ) ) ( not ( = ?auto_887697 ?auto_887702 ) ) ( not ( = ?auto_887698 ?auto_887699 ) ) ( not ( = ?auto_887698 ?auto_887700 ) ) ( not ( = ?auto_887698 ?auto_887701 ) ) ( not ( = ?auto_887698 ?auto_887702 ) ) ( not ( = ?auto_887699 ?auto_887700 ) ) ( not ( = ?auto_887699 ?auto_887701 ) ) ( not ( = ?auto_887699 ?auto_887702 ) ) ( not ( = ?auto_887700 ?auto_887701 ) ) ( not ( = ?auto_887700 ?auto_887702 ) ) ( not ( = ?auto_887701 ?auto_887702 ) ) ( ON ?auto_887700 ?auto_887701 ) ( ON ?auto_887699 ?auto_887700 ) ( ON ?auto_887698 ?auto_887699 ) ( ON ?auto_887697 ?auto_887698 ) ( ON ?auto_887696 ?auto_887697 ) ( ON ?auto_887695 ?auto_887696 ) ( ON ?auto_887694 ?auto_887695 ) ( ON ?auto_887693 ?auto_887694 ) ( ON ?auto_887692 ?auto_887693 ) ( ON ?auto_887691 ?auto_887692 ) ( ON ?auto_887690 ?auto_887691 ) ( ON ?auto_887689 ?auto_887690 ) ( ON ?auto_887688 ?auto_887689 ) ( CLEAR ?auto_887686 ) ( ON ?auto_887687 ?auto_887688 ) ( CLEAR ?auto_887687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_887685 ?auto_887686 ?auto_887687 )
      ( MAKE-17PILE ?auto_887685 ?auto_887686 ?auto_887687 ?auto_887688 ?auto_887689 ?auto_887690 ?auto_887691 ?auto_887692 ?auto_887693 ?auto_887694 ?auto_887695 ?auto_887696 ?auto_887697 ?auto_887698 ?auto_887699 ?auto_887700 ?auto_887701 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_887755 - BLOCK
      ?auto_887756 - BLOCK
      ?auto_887757 - BLOCK
      ?auto_887758 - BLOCK
      ?auto_887759 - BLOCK
      ?auto_887760 - BLOCK
      ?auto_887761 - BLOCK
      ?auto_887762 - BLOCK
      ?auto_887763 - BLOCK
      ?auto_887764 - BLOCK
      ?auto_887765 - BLOCK
      ?auto_887766 - BLOCK
      ?auto_887767 - BLOCK
      ?auto_887768 - BLOCK
      ?auto_887769 - BLOCK
      ?auto_887770 - BLOCK
      ?auto_887771 - BLOCK
    )
    :vars
    (
      ?auto_887772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887771 ?auto_887772 ) ( ON-TABLE ?auto_887755 ) ( not ( = ?auto_887755 ?auto_887756 ) ) ( not ( = ?auto_887755 ?auto_887757 ) ) ( not ( = ?auto_887755 ?auto_887758 ) ) ( not ( = ?auto_887755 ?auto_887759 ) ) ( not ( = ?auto_887755 ?auto_887760 ) ) ( not ( = ?auto_887755 ?auto_887761 ) ) ( not ( = ?auto_887755 ?auto_887762 ) ) ( not ( = ?auto_887755 ?auto_887763 ) ) ( not ( = ?auto_887755 ?auto_887764 ) ) ( not ( = ?auto_887755 ?auto_887765 ) ) ( not ( = ?auto_887755 ?auto_887766 ) ) ( not ( = ?auto_887755 ?auto_887767 ) ) ( not ( = ?auto_887755 ?auto_887768 ) ) ( not ( = ?auto_887755 ?auto_887769 ) ) ( not ( = ?auto_887755 ?auto_887770 ) ) ( not ( = ?auto_887755 ?auto_887771 ) ) ( not ( = ?auto_887755 ?auto_887772 ) ) ( not ( = ?auto_887756 ?auto_887757 ) ) ( not ( = ?auto_887756 ?auto_887758 ) ) ( not ( = ?auto_887756 ?auto_887759 ) ) ( not ( = ?auto_887756 ?auto_887760 ) ) ( not ( = ?auto_887756 ?auto_887761 ) ) ( not ( = ?auto_887756 ?auto_887762 ) ) ( not ( = ?auto_887756 ?auto_887763 ) ) ( not ( = ?auto_887756 ?auto_887764 ) ) ( not ( = ?auto_887756 ?auto_887765 ) ) ( not ( = ?auto_887756 ?auto_887766 ) ) ( not ( = ?auto_887756 ?auto_887767 ) ) ( not ( = ?auto_887756 ?auto_887768 ) ) ( not ( = ?auto_887756 ?auto_887769 ) ) ( not ( = ?auto_887756 ?auto_887770 ) ) ( not ( = ?auto_887756 ?auto_887771 ) ) ( not ( = ?auto_887756 ?auto_887772 ) ) ( not ( = ?auto_887757 ?auto_887758 ) ) ( not ( = ?auto_887757 ?auto_887759 ) ) ( not ( = ?auto_887757 ?auto_887760 ) ) ( not ( = ?auto_887757 ?auto_887761 ) ) ( not ( = ?auto_887757 ?auto_887762 ) ) ( not ( = ?auto_887757 ?auto_887763 ) ) ( not ( = ?auto_887757 ?auto_887764 ) ) ( not ( = ?auto_887757 ?auto_887765 ) ) ( not ( = ?auto_887757 ?auto_887766 ) ) ( not ( = ?auto_887757 ?auto_887767 ) ) ( not ( = ?auto_887757 ?auto_887768 ) ) ( not ( = ?auto_887757 ?auto_887769 ) ) ( not ( = ?auto_887757 ?auto_887770 ) ) ( not ( = ?auto_887757 ?auto_887771 ) ) ( not ( = ?auto_887757 ?auto_887772 ) ) ( not ( = ?auto_887758 ?auto_887759 ) ) ( not ( = ?auto_887758 ?auto_887760 ) ) ( not ( = ?auto_887758 ?auto_887761 ) ) ( not ( = ?auto_887758 ?auto_887762 ) ) ( not ( = ?auto_887758 ?auto_887763 ) ) ( not ( = ?auto_887758 ?auto_887764 ) ) ( not ( = ?auto_887758 ?auto_887765 ) ) ( not ( = ?auto_887758 ?auto_887766 ) ) ( not ( = ?auto_887758 ?auto_887767 ) ) ( not ( = ?auto_887758 ?auto_887768 ) ) ( not ( = ?auto_887758 ?auto_887769 ) ) ( not ( = ?auto_887758 ?auto_887770 ) ) ( not ( = ?auto_887758 ?auto_887771 ) ) ( not ( = ?auto_887758 ?auto_887772 ) ) ( not ( = ?auto_887759 ?auto_887760 ) ) ( not ( = ?auto_887759 ?auto_887761 ) ) ( not ( = ?auto_887759 ?auto_887762 ) ) ( not ( = ?auto_887759 ?auto_887763 ) ) ( not ( = ?auto_887759 ?auto_887764 ) ) ( not ( = ?auto_887759 ?auto_887765 ) ) ( not ( = ?auto_887759 ?auto_887766 ) ) ( not ( = ?auto_887759 ?auto_887767 ) ) ( not ( = ?auto_887759 ?auto_887768 ) ) ( not ( = ?auto_887759 ?auto_887769 ) ) ( not ( = ?auto_887759 ?auto_887770 ) ) ( not ( = ?auto_887759 ?auto_887771 ) ) ( not ( = ?auto_887759 ?auto_887772 ) ) ( not ( = ?auto_887760 ?auto_887761 ) ) ( not ( = ?auto_887760 ?auto_887762 ) ) ( not ( = ?auto_887760 ?auto_887763 ) ) ( not ( = ?auto_887760 ?auto_887764 ) ) ( not ( = ?auto_887760 ?auto_887765 ) ) ( not ( = ?auto_887760 ?auto_887766 ) ) ( not ( = ?auto_887760 ?auto_887767 ) ) ( not ( = ?auto_887760 ?auto_887768 ) ) ( not ( = ?auto_887760 ?auto_887769 ) ) ( not ( = ?auto_887760 ?auto_887770 ) ) ( not ( = ?auto_887760 ?auto_887771 ) ) ( not ( = ?auto_887760 ?auto_887772 ) ) ( not ( = ?auto_887761 ?auto_887762 ) ) ( not ( = ?auto_887761 ?auto_887763 ) ) ( not ( = ?auto_887761 ?auto_887764 ) ) ( not ( = ?auto_887761 ?auto_887765 ) ) ( not ( = ?auto_887761 ?auto_887766 ) ) ( not ( = ?auto_887761 ?auto_887767 ) ) ( not ( = ?auto_887761 ?auto_887768 ) ) ( not ( = ?auto_887761 ?auto_887769 ) ) ( not ( = ?auto_887761 ?auto_887770 ) ) ( not ( = ?auto_887761 ?auto_887771 ) ) ( not ( = ?auto_887761 ?auto_887772 ) ) ( not ( = ?auto_887762 ?auto_887763 ) ) ( not ( = ?auto_887762 ?auto_887764 ) ) ( not ( = ?auto_887762 ?auto_887765 ) ) ( not ( = ?auto_887762 ?auto_887766 ) ) ( not ( = ?auto_887762 ?auto_887767 ) ) ( not ( = ?auto_887762 ?auto_887768 ) ) ( not ( = ?auto_887762 ?auto_887769 ) ) ( not ( = ?auto_887762 ?auto_887770 ) ) ( not ( = ?auto_887762 ?auto_887771 ) ) ( not ( = ?auto_887762 ?auto_887772 ) ) ( not ( = ?auto_887763 ?auto_887764 ) ) ( not ( = ?auto_887763 ?auto_887765 ) ) ( not ( = ?auto_887763 ?auto_887766 ) ) ( not ( = ?auto_887763 ?auto_887767 ) ) ( not ( = ?auto_887763 ?auto_887768 ) ) ( not ( = ?auto_887763 ?auto_887769 ) ) ( not ( = ?auto_887763 ?auto_887770 ) ) ( not ( = ?auto_887763 ?auto_887771 ) ) ( not ( = ?auto_887763 ?auto_887772 ) ) ( not ( = ?auto_887764 ?auto_887765 ) ) ( not ( = ?auto_887764 ?auto_887766 ) ) ( not ( = ?auto_887764 ?auto_887767 ) ) ( not ( = ?auto_887764 ?auto_887768 ) ) ( not ( = ?auto_887764 ?auto_887769 ) ) ( not ( = ?auto_887764 ?auto_887770 ) ) ( not ( = ?auto_887764 ?auto_887771 ) ) ( not ( = ?auto_887764 ?auto_887772 ) ) ( not ( = ?auto_887765 ?auto_887766 ) ) ( not ( = ?auto_887765 ?auto_887767 ) ) ( not ( = ?auto_887765 ?auto_887768 ) ) ( not ( = ?auto_887765 ?auto_887769 ) ) ( not ( = ?auto_887765 ?auto_887770 ) ) ( not ( = ?auto_887765 ?auto_887771 ) ) ( not ( = ?auto_887765 ?auto_887772 ) ) ( not ( = ?auto_887766 ?auto_887767 ) ) ( not ( = ?auto_887766 ?auto_887768 ) ) ( not ( = ?auto_887766 ?auto_887769 ) ) ( not ( = ?auto_887766 ?auto_887770 ) ) ( not ( = ?auto_887766 ?auto_887771 ) ) ( not ( = ?auto_887766 ?auto_887772 ) ) ( not ( = ?auto_887767 ?auto_887768 ) ) ( not ( = ?auto_887767 ?auto_887769 ) ) ( not ( = ?auto_887767 ?auto_887770 ) ) ( not ( = ?auto_887767 ?auto_887771 ) ) ( not ( = ?auto_887767 ?auto_887772 ) ) ( not ( = ?auto_887768 ?auto_887769 ) ) ( not ( = ?auto_887768 ?auto_887770 ) ) ( not ( = ?auto_887768 ?auto_887771 ) ) ( not ( = ?auto_887768 ?auto_887772 ) ) ( not ( = ?auto_887769 ?auto_887770 ) ) ( not ( = ?auto_887769 ?auto_887771 ) ) ( not ( = ?auto_887769 ?auto_887772 ) ) ( not ( = ?auto_887770 ?auto_887771 ) ) ( not ( = ?auto_887770 ?auto_887772 ) ) ( not ( = ?auto_887771 ?auto_887772 ) ) ( ON ?auto_887770 ?auto_887771 ) ( ON ?auto_887769 ?auto_887770 ) ( ON ?auto_887768 ?auto_887769 ) ( ON ?auto_887767 ?auto_887768 ) ( ON ?auto_887766 ?auto_887767 ) ( ON ?auto_887765 ?auto_887766 ) ( ON ?auto_887764 ?auto_887765 ) ( ON ?auto_887763 ?auto_887764 ) ( ON ?auto_887762 ?auto_887763 ) ( ON ?auto_887761 ?auto_887762 ) ( ON ?auto_887760 ?auto_887761 ) ( ON ?auto_887759 ?auto_887760 ) ( ON ?auto_887758 ?auto_887759 ) ( ON ?auto_887757 ?auto_887758 ) ( CLEAR ?auto_887755 ) ( ON ?auto_887756 ?auto_887757 ) ( CLEAR ?auto_887756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_887755 ?auto_887756 )
      ( MAKE-17PILE ?auto_887755 ?auto_887756 ?auto_887757 ?auto_887758 ?auto_887759 ?auto_887760 ?auto_887761 ?auto_887762 ?auto_887763 ?auto_887764 ?auto_887765 ?auto_887766 ?auto_887767 ?auto_887768 ?auto_887769 ?auto_887770 ?auto_887771 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_887825 - BLOCK
      ?auto_887826 - BLOCK
      ?auto_887827 - BLOCK
      ?auto_887828 - BLOCK
      ?auto_887829 - BLOCK
      ?auto_887830 - BLOCK
      ?auto_887831 - BLOCK
      ?auto_887832 - BLOCK
      ?auto_887833 - BLOCK
      ?auto_887834 - BLOCK
      ?auto_887835 - BLOCK
      ?auto_887836 - BLOCK
      ?auto_887837 - BLOCK
      ?auto_887838 - BLOCK
      ?auto_887839 - BLOCK
      ?auto_887840 - BLOCK
      ?auto_887841 - BLOCK
    )
    :vars
    (
      ?auto_887842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887841 ?auto_887842 ) ( not ( = ?auto_887825 ?auto_887826 ) ) ( not ( = ?auto_887825 ?auto_887827 ) ) ( not ( = ?auto_887825 ?auto_887828 ) ) ( not ( = ?auto_887825 ?auto_887829 ) ) ( not ( = ?auto_887825 ?auto_887830 ) ) ( not ( = ?auto_887825 ?auto_887831 ) ) ( not ( = ?auto_887825 ?auto_887832 ) ) ( not ( = ?auto_887825 ?auto_887833 ) ) ( not ( = ?auto_887825 ?auto_887834 ) ) ( not ( = ?auto_887825 ?auto_887835 ) ) ( not ( = ?auto_887825 ?auto_887836 ) ) ( not ( = ?auto_887825 ?auto_887837 ) ) ( not ( = ?auto_887825 ?auto_887838 ) ) ( not ( = ?auto_887825 ?auto_887839 ) ) ( not ( = ?auto_887825 ?auto_887840 ) ) ( not ( = ?auto_887825 ?auto_887841 ) ) ( not ( = ?auto_887825 ?auto_887842 ) ) ( not ( = ?auto_887826 ?auto_887827 ) ) ( not ( = ?auto_887826 ?auto_887828 ) ) ( not ( = ?auto_887826 ?auto_887829 ) ) ( not ( = ?auto_887826 ?auto_887830 ) ) ( not ( = ?auto_887826 ?auto_887831 ) ) ( not ( = ?auto_887826 ?auto_887832 ) ) ( not ( = ?auto_887826 ?auto_887833 ) ) ( not ( = ?auto_887826 ?auto_887834 ) ) ( not ( = ?auto_887826 ?auto_887835 ) ) ( not ( = ?auto_887826 ?auto_887836 ) ) ( not ( = ?auto_887826 ?auto_887837 ) ) ( not ( = ?auto_887826 ?auto_887838 ) ) ( not ( = ?auto_887826 ?auto_887839 ) ) ( not ( = ?auto_887826 ?auto_887840 ) ) ( not ( = ?auto_887826 ?auto_887841 ) ) ( not ( = ?auto_887826 ?auto_887842 ) ) ( not ( = ?auto_887827 ?auto_887828 ) ) ( not ( = ?auto_887827 ?auto_887829 ) ) ( not ( = ?auto_887827 ?auto_887830 ) ) ( not ( = ?auto_887827 ?auto_887831 ) ) ( not ( = ?auto_887827 ?auto_887832 ) ) ( not ( = ?auto_887827 ?auto_887833 ) ) ( not ( = ?auto_887827 ?auto_887834 ) ) ( not ( = ?auto_887827 ?auto_887835 ) ) ( not ( = ?auto_887827 ?auto_887836 ) ) ( not ( = ?auto_887827 ?auto_887837 ) ) ( not ( = ?auto_887827 ?auto_887838 ) ) ( not ( = ?auto_887827 ?auto_887839 ) ) ( not ( = ?auto_887827 ?auto_887840 ) ) ( not ( = ?auto_887827 ?auto_887841 ) ) ( not ( = ?auto_887827 ?auto_887842 ) ) ( not ( = ?auto_887828 ?auto_887829 ) ) ( not ( = ?auto_887828 ?auto_887830 ) ) ( not ( = ?auto_887828 ?auto_887831 ) ) ( not ( = ?auto_887828 ?auto_887832 ) ) ( not ( = ?auto_887828 ?auto_887833 ) ) ( not ( = ?auto_887828 ?auto_887834 ) ) ( not ( = ?auto_887828 ?auto_887835 ) ) ( not ( = ?auto_887828 ?auto_887836 ) ) ( not ( = ?auto_887828 ?auto_887837 ) ) ( not ( = ?auto_887828 ?auto_887838 ) ) ( not ( = ?auto_887828 ?auto_887839 ) ) ( not ( = ?auto_887828 ?auto_887840 ) ) ( not ( = ?auto_887828 ?auto_887841 ) ) ( not ( = ?auto_887828 ?auto_887842 ) ) ( not ( = ?auto_887829 ?auto_887830 ) ) ( not ( = ?auto_887829 ?auto_887831 ) ) ( not ( = ?auto_887829 ?auto_887832 ) ) ( not ( = ?auto_887829 ?auto_887833 ) ) ( not ( = ?auto_887829 ?auto_887834 ) ) ( not ( = ?auto_887829 ?auto_887835 ) ) ( not ( = ?auto_887829 ?auto_887836 ) ) ( not ( = ?auto_887829 ?auto_887837 ) ) ( not ( = ?auto_887829 ?auto_887838 ) ) ( not ( = ?auto_887829 ?auto_887839 ) ) ( not ( = ?auto_887829 ?auto_887840 ) ) ( not ( = ?auto_887829 ?auto_887841 ) ) ( not ( = ?auto_887829 ?auto_887842 ) ) ( not ( = ?auto_887830 ?auto_887831 ) ) ( not ( = ?auto_887830 ?auto_887832 ) ) ( not ( = ?auto_887830 ?auto_887833 ) ) ( not ( = ?auto_887830 ?auto_887834 ) ) ( not ( = ?auto_887830 ?auto_887835 ) ) ( not ( = ?auto_887830 ?auto_887836 ) ) ( not ( = ?auto_887830 ?auto_887837 ) ) ( not ( = ?auto_887830 ?auto_887838 ) ) ( not ( = ?auto_887830 ?auto_887839 ) ) ( not ( = ?auto_887830 ?auto_887840 ) ) ( not ( = ?auto_887830 ?auto_887841 ) ) ( not ( = ?auto_887830 ?auto_887842 ) ) ( not ( = ?auto_887831 ?auto_887832 ) ) ( not ( = ?auto_887831 ?auto_887833 ) ) ( not ( = ?auto_887831 ?auto_887834 ) ) ( not ( = ?auto_887831 ?auto_887835 ) ) ( not ( = ?auto_887831 ?auto_887836 ) ) ( not ( = ?auto_887831 ?auto_887837 ) ) ( not ( = ?auto_887831 ?auto_887838 ) ) ( not ( = ?auto_887831 ?auto_887839 ) ) ( not ( = ?auto_887831 ?auto_887840 ) ) ( not ( = ?auto_887831 ?auto_887841 ) ) ( not ( = ?auto_887831 ?auto_887842 ) ) ( not ( = ?auto_887832 ?auto_887833 ) ) ( not ( = ?auto_887832 ?auto_887834 ) ) ( not ( = ?auto_887832 ?auto_887835 ) ) ( not ( = ?auto_887832 ?auto_887836 ) ) ( not ( = ?auto_887832 ?auto_887837 ) ) ( not ( = ?auto_887832 ?auto_887838 ) ) ( not ( = ?auto_887832 ?auto_887839 ) ) ( not ( = ?auto_887832 ?auto_887840 ) ) ( not ( = ?auto_887832 ?auto_887841 ) ) ( not ( = ?auto_887832 ?auto_887842 ) ) ( not ( = ?auto_887833 ?auto_887834 ) ) ( not ( = ?auto_887833 ?auto_887835 ) ) ( not ( = ?auto_887833 ?auto_887836 ) ) ( not ( = ?auto_887833 ?auto_887837 ) ) ( not ( = ?auto_887833 ?auto_887838 ) ) ( not ( = ?auto_887833 ?auto_887839 ) ) ( not ( = ?auto_887833 ?auto_887840 ) ) ( not ( = ?auto_887833 ?auto_887841 ) ) ( not ( = ?auto_887833 ?auto_887842 ) ) ( not ( = ?auto_887834 ?auto_887835 ) ) ( not ( = ?auto_887834 ?auto_887836 ) ) ( not ( = ?auto_887834 ?auto_887837 ) ) ( not ( = ?auto_887834 ?auto_887838 ) ) ( not ( = ?auto_887834 ?auto_887839 ) ) ( not ( = ?auto_887834 ?auto_887840 ) ) ( not ( = ?auto_887834 ?auto_887841 ) ) ( not ( = ?auto_887834 ?auto_887842 ) ) ( not ( = ?auto_887835 ?auto_887836 ) ) ( not ( = ?auto_887835 ?auto_887837 ) ) ( not ( = ?auto_887835 ?auto_887838 ) ) ( not ( = ?auto_887835 ?auto_887839 ) ) ( not ( = ?auto_887835 ?auto_887840 ) ) ( not ( = ?auto_887835 ?auto_887841 ) ) ( not ( = ?auto_887835 ?auto_887842 ) ) ( not ( = ?auto_887836 ?auto_887837 ) ) ( not ( = ?auto_887836 ?auto_887838 ) ) ( not ( = ?auto_887836 ?auto_887839 ) ) ( not ( = ?auto_887836 ?auto_887840 ) ) ( not ( = ?auto_887836 ?auto_887841 ) ) ( not ( = ?auto_887836 ?auto_887842 ) ) ( not ( = ?auto_887837 ?auto_887838 ) ) ( not ( = ?auto_887837 ?auto_887839 ) ) ( not ( = ?auto_887837 ?auto_887840 ) ) ( not ( = ?auto_887837 ?auto_887841 ) ) ( not ( = ?auto_887837 ?auto_887842 ) ) ( not ( = ?auto_887838 ?auto_887839 ) ) ( not ( = ?auto_887838 ?auto_887840 ) ) ( not ( = ?auto_887838 ?auto_887841 ) ) ( not ( = ?auto_887838 ?auto_887842 ) ) ( not ( = ?auto_887839 ?auto_887840 ) ) ( not ( = ?auto_887839 ?auto_887841 ) ) ( not ( = ?auto_887839 ?auto_887842 ) ) ( not ( = ?auto_887840 ?auto_887841 ) ) ( not ( = ?auto_887840 ?auto_887842 ) ) ( not ( = ?auto_887841 ?auto_887842 ) ) ( ON ?auto_887840 ?auto_887841 ) ( ON ?auto_887839 ?auto_887840 ) ( ON ?auto_887838 ?auto_887839 ) ( ON ?auto_887837 ?auto_887838 ) ( ON ?auto_887836 ?auto_887837 ) ( ON ?auto_887835 ?auto_887836 ) ( ON ?auto_887834 ?auto_887835 ) ( ON ?auto_887833 ?auto_887834 ) ( ON ?auto_887832 ?auto_887833 ) ( ON ?auto_887831 ?auto_887832 ) ( ON ?auto_887830 ?auto_887831 ) ( ON ?auto_887829 ?auto_887830 ) ( ON ?auto_887828 ?auto_887829 ) ( ON ?auto_887827 ?auto_887828 ) ( ON ?auto_887826 ?auto_887827 ) ( ON ?auto_887825 ?auto_887826 ) ( CLEAR ?auto_887825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_887825 )
      ( MAKE-17PILE ?auto_887825 ?auto_887826 ?auto_887827 ?auto_887828 ?auto_887829 ?auto_887830 ?auto_887831 ?auto_887832 ?auto_887833 ?auto_887834 ?auto_887835 ?auto_887836 ?auto_887837 ?auto_887838 ?auto_887839 ?auto_887840 ?auto_887841 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_887896 - BLOCK
      ?auto_887897 - BLOCK
      ?auto_887898 - BLOCK
      ?auto_887899 - BLOCK
      ?auto_887900 - BLOCK
      ?auto_887901 - BLOCK
      ?auto_887902 - BLOCK
      ?auto_887903 - BLOCK
      ?auto_887904 - BLOCK
      ?auto_887905 - BLOCK
      ?auto_887906 - BLOCK
      ?auto_887907 - BLOCK
      ?auto_887908 - BLOCK
      ?auto_887909 - BLOCK
      ?auto_887910 - BLOCK
      ?auto_887911 - BLOCK
      ?auto_887912 - BLOCK
      ?auto_887913 - BLOCK
    )
    :vars
    (
      ?auto_887914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_887912 ) ( ON ?auto_887913 ?auto_887914 ) ( CLEAR ?auto_887913 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_887896 ) ( ON ?auto_887897 ?auto_887896 ) ( ON ?auto_887898 ?auto_887897 ) ( ON ?auto_887899 ?auto_887898 ) ( ON ?auto_887900 ?auto_887899 ) ( ON ?auto_887901 ?auto_887900 ) ( ON ?auto_887902 ?auto_887901 ) ( ON ?auto_887903 ?auto_887902 ) ( ON ?auto_887904 ?auto_887903 ) ( ON ?auto_887905 ?auto_887904 ) ( ON ?auto_887906 ?auto_887905 ) ( ON ?auto_887907 ?auto_887906 ) ( ON ?auto_887908 ?auto_887907 ) ( ON ?auto_887909 ?auto_887908 ) ( ON ?auto_887910 ?auto_887909 ) ( ON ?auto_887911 ?auto_887910 ) ( ON ?auto_887912 ?auto_887911 ) ( not ( = ?auto_887896 ?auto_887897 ) ) ( not ( = ?auto_887896 ?auto_887898 ) ) ( not ( = ?auto_887896 ?auto_887899 ) ) ( not ( = ?auto_887896 ?auto_887900 ) ) ( not ( = ?auto_887896 ?auto_887901 ) ) ( not ( = ?auto_887896 ?auto_887902 ) ) ( not ( = ?auto_887896 ?auto_887903 ) ) ( not ( = ?auto_887896 ?auto_887904 ) ) ( not ( = ?auto_887896 ?auto_887905 ) ) ( not ( = ?auto_887896 ?auto_887906 ) ) ( not ( = ?auto_887896 ?auto_887907 ) ) ( not ( = ?auto_887896 ?auto_887908 ) ) ( not ( = ?auto_887896 ?auto_887909 ) ) ( not ( = ?auto_887896 ?auto_887910 ) ) ( not ( = ?auto_887896 ?auto_887911 ) ) ( not ( = ?auto_887896 ?auto_887912 ) ) ( not ( = ?auto_887896 ?auto_887913 ) ) ( not ( = ?auto_887896 ?auto_887914 ) ) ( not ( = ?auto_887897 ?auto_887898 ) ) ( not ( = ?auto_887897 ?auto_887899 ) ) ( not ( = ?auto_887897 ?auto_887900 ) ) ( not ( = ?auto_887897 ?auto_887901 ) ) ( not ( = ?auto_887897 ?auto_887902 ) ) ( not ( = ?auto_887897 ?auto_887903 ) ) ( not ( = ?auto_887897 ?auto_887904 ) ) ( not ( = ?auto_887897 ?auto_887905 ) ) ( not ( = ?auto_887897 ?auto_887906 ) ) ( not ( = ?auto_887897 ?auto_887907 ) ) ( not ( = ?auto_887897 ?auto_887908 ) ) ( not ( = ?auto_887897 ?auto_887909 ) ) ( not ( = ?auto_887897 ?auto_887910 ) ) ( not ( = ?auto_887897 ?auto_887911 ) ) ( not ( = ?auto_887897 ?auto_887912 ) ) ( not ( = ?auto_887897 ?auto_887913 ) ) ( not ( = ?auto_887897 ?auto_887914 ) ) ( not ( = ?auto_887898 ?auto_887899 ) ) ( not ( = ?auto_887898 ?auto_887900 ) ) ( not ( = ?auto_887898 ?auto_887901 ) ) ( not ( = ?auto_887898 ?auto_887902 ) ) ( not ( = ?auto_887898 ?auto_887903 ) ) ( not ( = ?auto_887898 ?auto_887904 ) ) ( not ( = ?auto_887898 ?auto_887905 ) ) ( not ( = ?auto_887898 ?auto_887906 ) ) ( not ( = ?auto_887898 ?auto_887907 ) ) ( not ( = ?auto_887898 ?auto_887908 ) ) ( not ( = ?auto_887898 ?auto_887909 ) ) ( not ( = ?auto_887898 ?auto_887910 ) ) ( not ( = ?auto_887898 ?auto_887911 ) ) ( not ( = ?auto_887898 ?auto_887912 ) ) ( not ( = ?auto_887898 ?auto_887913 ) ) ( not ( = ?auto_887898 ?auto_887914 ) ) ( not ( = ?auto_887899 ?auto_887900 ) ) ( not ( = ?auto_887899 ?auto_887901 ) ) ( not ( = ?auto_887899 ?auto_887902 ) ) ( not ( = ?auto_887899 ?auto_887903 ) ) ( not ( = ?auto_887899 ?auto_887904 ) ) ( not ( = ?auto_887899 ?auto_887905 ) ) ( not ( = ?auto_887899 ?auto_887906 ) ) ( not ( = ?auto_887899 ?auto_887907 ) ) ( not ( = ?auto_887899 ?auto_887908 ) ) ( not ( = ?auto_887899 ?auto_887909 ) ) ( not ( = ?auto_887899 ?auto_887910 ) ) ( not ( = ?auto_887899 ?auto_887911 ) ) ( not ( = ?auto_887899 ?auto_887912 ) ) ( not ( = ?auto_887899 ?auto_887913 ) ) ( not ( = ?auto_887899 ?auto_887914 ) ) ( not ( = ?auto_887900 ?auto_887901 ) ) ( not ( = ?auto_887900 ?auto_887902 ) ) ( not ( = ?auto_887900 ?auto_887903 ) ) ( not ( = ?auto_887900 ?auto_887904 ) ) ( not ( = ?auto_887900 ?auto_887905 ) ) ( not ( = ?auto_887900 ?auto_887906 ) ) ( not ( = ?auto_887900 ?auto_887907 ) ) ( not ( = ?auto_887900 ?auto_887908 ) ) ( not ( = ?auto_887900 ?auto_887909 ) ) ( not ( = ?auto_887900 ?auto_887910 ) ) ( not ( = ?auto_887900 ?auto_887911 ) ) ( not ( = ?auto_887900 ?auto_887912 ) ) ( not ( = ?auto_887900 ?auto_887913 ) ) ( not ( = ?auto_887900 ?auto_887914 ) ) ( not ( = ?auto_887901 ?auto_887902 ) ) ( not ( = ?auto_887901 ?auto_887903 ) ) ( not ( = ?auto_887901 ?auto_887904 ) ) ( not ( = ?auto_887901 ?auto_887905 ) ) ( not ( = ?auto_887901 ?auto_887906 ) ) ( not ( = ?auto_887901 ?auto_887907 ) ) ( not ( = ?auto_887901 ?auto_887908 ) ) ( not ( = ?auto_887901 ?auto_887909 ) ) ( not ( = ?auto_887901 ?auto_887910 ) ) ( not ( = ?auto_887901 ?auto_887911 ) ) ( not ( = ?auto_887901 ?auto_887912 ) ) ( not ( = ?auto_887901 ?auto_887913 ) ) ( not ( = ?auto_887901 ?auto_887914 ) ) ( not ( = ?auto_887902 ?auto_887903 ) ) ( not ( = ?auto_887902 ?auto_887904 ) ) ( not ( = ?auto_887902 ?auto_887905 ) ) ( not ( = ?auto_887902 ?auto_887906 ) ) ( not ( = ?auto_887902 ?auto_887907 ) ) ( not ( = ?auto_887902 ?auto_887908 ) ) ( not ( = ?auto_887902 ?auto_887909 ) ) ( not ( = ?auto_887902 ?auto_887910 ) ) ( not ( = ?auto_887902 ?auto_887911 ) ) ( not ( = ?auto_887902 ?auto_887912 ) ) ( not ( = ?auto_887902 ?auto_887913 ) ) ( not ( = ?auto_887902 ?auto_887914 ) ) ( not ( = ?auto_887903 ?auto_887904 ) ) ( not ( = ?auto_887903 ?auto_887905 ) ) ( not ( = ?auto_887903 ?auto_887906 ) ) ( not ( = ?auto_887903 ?auto_887907 ) ) ( not ( = ?auto_887903 ?auto_887908 ) ) ( not ( = ?auto_887903 ?auto_887909 ) ) ( not ( = ?auto_887903 ?auto_887910 ) ) ( not ( = ?auto_887903 ?auto_887911 ) ) ( not ( = ?auto_887903 ?auto_887912 ) ) ( not ( = ?auto_887903 ?auto_887913 ) ) ( not ( = ?auto_887903 ?auto_887914 ) ) ( not ( = ?auto_887904 ?auto_887905 ) ) ( not ( = ?auto_887904 ?auto_887906 ) ) ( not ( = ?auto_887904 ?auto_887907 ) ) ( not ( = ?auto_887904 ?auto_887908 ) ) ( not ( = ?auto_887904 ?auto_887909 ) ) ( not ( = ?auto_887904 ?auto_887910 ) ) ( not ( = ?auto_887904 ?auto_887911 ) ) ( not ( = ?auto_887904 ?auto_887912 ) ) ( not ( = ?auto_887904 ?auto_887913 ) ) ( not ( = ?auto_887904 ?auto_887914 ) ) ( not ( = ?auto_887905 ?auto_887906 ) ) ( not ( = ?auto_887905 ?auto_887907 ) ) ( not ( = ?auto_887905 ?auto_887908 ) ) ( not ( = ?auto_887905 ?auto_887909 ) ) ( not ( = ?auto_887905 ?auto_887910 ) ) ( not ( = ?auto_887905 ?auto_887911 ) ) ( not ( = ?auto_887905 ?auto_887912 ) ) ( not ( = ?auto_887905 ?auto_887913 ) ) ( not ( = ?auto_887905 ?auto_887914 ) ) ( not ( = ?auto_887906 ?auto_887907 ) ) ( not ( = ?auto_887906 ?auto_887908 ) ) ( not ( = ?auto_887906 ?auto_887909 ) ) ( not ( = ?auto_887906 ?auto_887910 ) ) ( not ( = ?auto_887906 ?auto_887911 ) ) ( not ( = ?auto_887906 ?auto_887912 ) ) ( not ( = ?auto_887906 ?auto_887913 ) ) ( not ( = ?auto_887906 ?auto_887914 ) ) ( not ( = ?auto_887907 ?auto_887908 ) ) ( not ( = ?auto_887907 ?auto_887909 ) ) ( not ( = ?auto_887907 ?auto_887910 ) ) ( not ( = ?auto_887907 ?auto_887911 ) ) ( not ( = ?auto_887907 ?auto_887912 ) ) ( not ( = ?auto_887907 ?auto_887913 ) ) ( not ( = ?auto_887907 ?auto_887914 ) ) ( not ( = ?auto_887908 ?auto_887909 ) ) ( not ( = ?auto_887908 ?auto_887910 ) ) ( not ( = ?auto_887908 ?auto_887911 ) ) ( not ( = ?auto_887908 ?auto_887912 ) ) ( not ( = ?auto_887908 ?auto_887913 ) ) ( not ( = ?auto_887908 ?auto_887914 ) ) ( not ( = ?auto_887909 ?auto_887910 ) ) ( not ( = ?auto_887909 ?auto_887911 ) ) ( not ( = ?auto_887909 ?auto_887912 ) ) ( not ( = ?auto_887909 ?auto_887913 ) ) ( not ( = ?auto_887909 ?auto_887914 ) ) ( not ( = ?auto_887910 ?auto_887911 ) ) ( not ( = ?auto_887910 ?auto_887912 ) ) ( not ( = ?auto_887910 ?auto_887913 ) ) ( not ( = ?auto_887910 ?auto_887914 ) ) ( not ( = ?auto_887911 ?auto_887912 ) ) ( not ( = ?auto_887911 ?auto_887913 ) ) ( not ( = ?auto_887911 ?auto_887914 ) ) ( not ( = ?auto_887912 ?auto_887913 ) ) ( not ( = ?auto_887912 ?auto_887914 ) ) ( not ( = ?auto_887913 ?auto_887914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_887913 ?auto_887914 )
      ( !STACK ?auto_887913 ?auto_887912 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_887933 - BLOCK
      ?auto_887934 - BLOCK
      ?auto_887935 - BLOCK
      ?auto_887936 - BLOCK
      ?auto_887937 - BLOCK
      ?auto_887938 - BLOCK
      ?auto_887939 - BLOCK
      ?auto_887940 - BLOCK
      ?auto_887941 - BLOCK
      ?auto_887942 - BLOCK
      ?auto_887943 - BLOCK
      ?auto_887944 - BLOCK
      ?auto_887945 - BLOCK
      ?auto_887946 - BLOCK
      ?auto_887947 - BLOCK
      ?auto_887948 - BLOCK
      ?auto_887949 - BLOCK
      ?auto_887950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_887949 ) ( ON-TABLE ?auto_887950 ) ( CLEAR ?auto_887950 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_887933 ) ( ON ?auto_887934 ?auto_887933 ) ( ON ?auto_887935 ?auto_887934 ) ( ON ?auto_887936 ?auto_887935 ) ( ON ?auto_887937 ?auto_887936 ) ( ON ?auto_887938 ?auto_887937 ) ( ON ?auto_887939 ?auto_887938 ) ( ON ?auto_887940 ?auto_887939 ) ( ON ?auto_887941 ?auto_887940 ) ( ON ?auto_887942 ?auto_887941 ) ( ON ?auto_887943 ?auto_887942 ) ( ON ?auto_887944 ?auto_887943 ) ( ON ?auto_887945 ?auto_887944 ) ( ON ?auto_887946 ?auto_887945 ) ( ON ?auto_887947 ?auto_887946 ) ( ON ?auto_887948 ?auto_887947 ) ( ON ?auto_887949 ?auto_887948 ) ( not ( = ?auto_887933 ?auto_887934 ) ) ( not ( = ?auto_887933 ?auto_887935 ) ) ( not ( = ?auto_887933 ?auto_887936 ) ) ( not ( = ?auto_887933 ?auto_887937 ) ) ( not ( = ?auto_887933 ?auto_887938 ) ) ( not ( = ?auto_887933 ?auto_887939 ) ) ( not ( = ?auto_887933 ?auto_887940 ) ) ( not ( = ?auto_887933 ?auto_887941 ) ) ( not ( = ?auto_887933 ?auto_887942 ) ) ( not ( = ?auto_887933 ?auto_887943 ) ) ( not ( = ?auto_887933 ?auto_887944 ) ) ( not ( = ?auto_887933 ?auto_887945 ) ) ( not ( = ?auto_887933 ?auto_887946 ) ) ( not ( = ?auto_887933 ?auto_887947 ) ) ( not ( = ?auto_887933 ?auto_887948 ) ) ( not ( = ?auto_887933 ?auto_887949 ) ) ( not ( = ?auto_887933 ?auto_887950 ) ) ( not ( = ?auto_887934 ?auto_887935 ) ) ( not ( = ?auto_887934 ?auto_887936 ) ) ( not ( = ?auto_887934 ?auto_887937 ) ) ( not ( = ?auto_887934 ?auto_887938 ) ) ( not ( = ?auto_887934 ?auto_887939 ) ) ( not ( = ?auto_887934 ?auto_887940 ) ) ( not ( = ?auto_887934 ?auto_887941 ) ) ( not ( = ?auto_887934 ?auto_887942 ) ) ( not ( = ?auto_887934 ?auto_887943 ) ) ( not ( = ?auto_887934 ?auto_887944 ) ) ( not ( = ?auto_887934 ?auto_887945 ) ) ( not ( = ?auto_887934 ?auto_887946 ) ) ( not ( = ?auto_887934 ?auto_887947 ) ) ( not ( = ?auto_887934 ?auto_887948 ) ) ( not ( = ?auto_887934 ?auto_887949 ) ) ( not ( = ?auto_887934 ?auto_887950 ) ) ( not ( = ?auto_887935 ?auto_887936 ) ) ( not ( = ?auto_887935 ?auto_887937 ) ) ( not ( = ?auto_887935 ?auto_887938 ) ) ( not ( = ?auto_887935 ?auto_887939 ) ) ( not ( = ?auto_887935 ?auto_887940 ) ) ( not ( = ?auto_887935 ?auto_887941 ) ) ( not ( = ?auto_887935 ?auto_887942 ) ) ( not ( = ?auto_887935 ?auto_887943 ) ) ( not ( = ?auto_887935 ?auto_887944 ) ) ( not ( = ?auto_887935 ?auto_887945 ) ) ( not ( = ?auto_887935 ?auto_887946 ) ) ( not ( = ?auto_887935 ?auto_887947 ) ) ( not ( = ?auto_887935 ?auto_887948 ) ) ( not ( = ?auto_887935 ?auto_887949 ) ) ( not ( = ?auto_887935 ?auto_887950 ) ) ( not ( = ?auto_887936 ?auto_887937 ) ) ( not ( = ?auto_887936 ?auto_887938 ) ) ( not ( = ?auto_887936 ?auto_887939 ) ) ( not ( = ?auto_887936 ?auto_887940 ) ) ( not ( = ?auto_887936 ?auto_887941 ) ) ( not ( = ?auto_887936 ?auto_887942 ) ) ( not ( = ?auto_887936 ?auto_887943 ) ) ( not ( = ?auto_887936 ?auto_887944 ) ) ( not ( = ?auto_887936 ?auto_887945 ) ) ( not ( = ?auto_887936 ?auto_887946 ) ) ( not ( = ?auto_887936 ?auto_887947 ) ) ( not ( = ?auto_887936 ?auto_887948 ) ) ( not ( = ?auto_887936 ?auto_887949 ) ) ( not ( = ?auto_887936 ?auto_887950 ) ) ( not ( = ?auto_887937 ?auto_887938 ) ) ( not ( = ?auto_887937 ?auto_887939 ) ) ( not ( = ?auto_887937 ?auto_887940 ) ) ( not ( = ?auto_887937 ?auto_887941 ) ) ( not ( = ?auto_887937 ?auto_887942 ) ) ( not ( = ?auto_887937 ?auto_887943 ) ) ( not ( = ?auto_887937 ?auto_887944 ) ) ( not ( = ?auto_887937 ?auto_887945 ) ) ( not ( = ?auto_887937 ?auto_887946 ) ) ( not ( = ?auto_887937 ?auto_887947 ) ) ( not ( = ?auto_887937 ?auto_887948 ) ) ( not ( = ?auto_887937 ?auto_887949 ) ) ( not ( = ?auto_887937 ?auto_887950 ) ) ( not ( = ?auto_887938 ?auto_887939 ) ) ( not ( = ?auto_887938 ?auto_887940 ) ) ( not ( = ?auto_887938 ?auto_887941 ) ) ( not ( = ?auto_887938 ?auto_887942 ) ) ( not ( = ?auto_887938 ?auto_887943 ) ) ( not ( = ?auto_887938 ?auto_887944 ) ) ( not ( = ?auto_887938 ?auto_887945 ) ) ( not ( = ?auto_887938 ?auto_887946 ) ) ( not ( = ?auto_887938 ?auto_887947 ) ) ( not ( = ?auto_887938 ?auto_887948 ) ) ( not ( = ?auto_887938 ?auto_887949 ) ) ( not ( = ?auto_887938 ?auto_887950 ) ) ( not ( = ?auto_887939 ?auto_887940 ) ) ( not ( = ?auto_887939 ?auto_887941 ) ) ( not ( = ?auto_887939 ?auto_887942 ) ) ( not ( = ?auto_887939 ?auto_887943 ) ) ( not ( = ?auto_887939 ?auto_887944 ) ) ( not ( = ?auto_887939 ?auto_887945 ) ) ( not ( = ?auto_887939 ?auto_887946 ) ) ( not ( = ?auto_887939 ?auto_887947 ) ) ( not ( = ?auto_887939 ?auto_887948 ) ) ( not ( = ?auto_887939 ?auto_887949 ) ) ( not ( = ?auto_887939 ?auto_887950 ) ) ( not ( = ?auto_887940 ?auto_887941 ) ) ( not ( = ?auto_887940 ?auto_887942 ) ) ( not ( = ?auto_887940 ?auto_887943 ) ) ( not ( = ?auto_887940 ?auto_887944 ) ) ( not ( = ?auto_887940 ?auto_887945 ) ) ( not ( = ?auto_887940 ?auto_887946 ) ) ( not ( = ?auto_887940 ?auto_887947 ) ) ( not ( = ?auto_887940 ?auto_887948 ) ) ( not ( = ?auto_887940 ?auto_887949 ) ) ( not ( = ?auto_887940 ?auto_887950 ) ) ( not ( = ?auto_887941 ?auto_887942 ) ) ( not ( = ?auto_887941 ?auto_887943 ) ) ( not ( = ?auto_887941 ?auto_887944 ) ) ( not ( = ?auto_887941 ?auto_887945 ) ) ( not ( = ?auto_887941 ?auto_887946 ) ) ( not ( = ?auto_887941 ?auto_887947 ) ) ( not ( = ?auto_887941 ?auto_887948 ) ) ( not ( = ?auto_887941 ?auto_887949 ) ) ( not ( = ?auto_887941 ?auto_887950 ) ) ( not ( = ?auto_887942 ?auto_887943 ) ) ( not ( = ?auto_887942 ?auto_887944 ) ) ( not ( = ?auto_887942 ?auto_887945 ) ) ( not ( = ?auto_887942 ?auto_887946 ) ) ( not ( = ?auto_887942 ?auto_887947 ) ) ( not ( = ?auto_887942 ?auto_887948 ) ) ( not ( = ?auto_887942 ?auto_887949 ) ) ( not ( = ?auto_887942 ?auto_887950 ) ) ( not ( = ?auto_887943 ?auto_887944 ) ) ( not ( = ?auto_887943 ?auto_887945 ) ) ( not ( = ?auto_887943 ?auto_887946 ) ) ( not ( = ?auto_887943 ?auto_887947 ) ) ( not ( = ?auto_887943 ?auto_887948 ) ) ( not ( = ?auto_887943 ?auto_887949 ) ) ( not ( = ?auto_887943 ?auto_887950 ) ) ( not ( = ?auto_887944 ?auto_887945 ) ) ( not ( = ?auto_887944 ?auto_887946 ) ) ( not ( = ?auto_887944 ?auto_887947 ) ) ( not ( = ?auto_887944 ?auto_887948 ) ) ( not ( = ?auto_887944 ?auto_887949 ) ) ( not ( = ?auto_887944 ?auto_887950 ) ) ( not ( = ?auto_887945 ?auto_887946 ) ) ( not ( = ?auto_887945 ?auto_887947 ) ) ( not ( = ?auto_887945 ?auto_887948 ) ) ( not ( = ?auto_887945 ?auto_887949 ) ) ( not ( = ?auto_887945 ?auto_887950 ) ) ( not ( = ?auto_887946 ?auto_887947 ) ) ( not ( = ?auto_887946 ?auto_887948 ) ) ( not ( = ?auto_887946 ?auto_887949 ) ) ( not ( = ?auto_887946 ?auto_887950 ) ) ( not ( = ?auto_887947 ?auto_887948 ) ) ( not ( = ?auto_887947 ?auto_887949 ) ) ( not ( = ?auto_887947 ?auto_887950 ) ) ( not ( = ?auto_887948 ?auto_887949 ) ) ( not ( = ?auto_887948 ?auto_887950 ) ) ( not ( = ?auto_887949 ?auto_887950 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_887950 )
      ( !STACK ?auto_887950 ?auto_887949 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_887969 - BLOCK
      ?auto_887970 - BLOCK
      ?auto_887971 - BLOCK
      ?auto_887972 - BLOCK
      ?auto_887973 - BLOCK
      ?auto_887974 - BLOCK
      ?auto_887975 - BLOCK
      ?auto_887976 - BLOCK
      ?auto_887977 - BLOCK
      ?auto_887978 - BLOCK
      ?auto_887979 - BLOCK
      ?auto_887980 - BLOCK
      ?auto_887981 - BLOCK
      ?auto_887982 - BLOCK
      ?auto_887983 - BLOCK
      ?auto_887984 - BLOCK
      ?auto_887985 - BLOCK
      ?auto_887986 - BLOCK
    )
    :vars
    (
      ?auto_887987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887986 ?auto_887987 ) ( ON-TABLE ?auto_887969 ) ( ON ?auto_887970 ?auto_887969 ) ( ON ?auto_887971 ?auto_887970 ) ( ON ?auto_887972 ?auto_887971 ) ( ON ?auto_887973 ?auto_887972 ) ( ON ?auto_887974 ?auto_887973 ) ( ON ?auto_887975 ?auto_887974 ) ( ON ?auto_887976 ?auto_887975 ) ( ON ?auto_887977 ?auto_887976 ) ( ON ?auto_887978 ?auto_887977 ) ( ON ?auto_887979 ?auto_887978 ) ( ON ?auto_887980 ?auto_887979 ) ( ON ?auto_887981 ?auto_887980 ) ( ON ?auto_887982 ?auto_887981 ) ( ON ?auto_887983 ?auto_887982 ) ( ON ?auto_887984 ?auto_887983 ) ( not ( = ?auto_887969 ?auto_887970 ) ) ( not ( = ?auto_887969 ?auto_887971 ) ) ( not ( = ?auto_887969 ?auto_887972 ) ) ( not ( = ?auto_887969 ?auto_887973 ) ) ( not ( = ?auto_887969 ?auto_887974 ) ) ( not ( = ?auto_887969 ?auto_887975 ) ) ( not ( = ?auto_887969 ?auto_887976 ) ) ( not ( = ?auto_887969 ?auto_887977 ) ) ( not ( = ?auto_887969 ?auto_887978 ) ) ( not ( = ?auto_887969 ?auto_887979 ) ) ( not ( = ?auto_887969 ?auto_887980 ) ) ( not ( = ?auto_887969 ?auto_887981 ) ) ( not ( = ?auto_887969 ?auto_887982 ) ) ( not ( = ?auto_887969 ?auto_887983 ) ) ( not ( = ?auto_887969 ?auto_887984 ) ) ( not ( = ?auto_887969 ?auto_887985 ) ) ( not ( = ?auto_887969 ?auto_887986 ) ) ( not ( = ?auto_887969 ?auto_887987 ) ) ( not ( = ?auto_887970 ?auto_887971 ) ) ( not ( = ?auto_887970 ?auto_887972 ) ) ( not ( = ?auto_887970 ?auto_887973 ) ) ( not ( = ?auto_887970 ?auto_887974 ) ) ( not ( = ?auto_887970 ?auto_887975 ) ) ( not ( = ?auto_887970 ?auto_887976 ) ) ( not ( = ?auto_887970 ?auto_887977 ) ) ( not ( = ?auto_887970 ?auto_887978 ) ) ( not ( = ?auto_887970 ?auto_887979 ) ) ( not ( = ?auto_887970 ?auto_887980 ) ) ( not ( = ?auto_887970 ?auto_887981 ) ) ( not ( = ?auto_887970 ?auto_887982 ) ) ( not ( = ?auto_887970 ?auto_887983 ) ) ( not ( = ?auto_887970 ?auto_887984 ) ) ( not ( = ?auto_887970 ?auto_887985 ) ) ( not ( = ?auto_887970 ?auto_887986 ) ) ( not ( = ?auto_887970 ?auto_887987 ) ) ( not ( = ?auto_887971 ?auto_887972 ) ) ( not ( = ?auto_887971 ?auto_887973 ) ) ( not ( = ?auto_887971 ?auto_887974 ) ) ( not ( = ?auto_887971 ?auto_887975 ) ) ( not ( = ?auto_887971 ?auto_887976 ) ) ( not ( = ?auto_887971 ?auto_887977 ) ) ( not ( = ?auto_887971 ?auto_887978 ) ) ( not ( = ?auto_887971 ?auto_887979 ) ) ( not ( = ?auto_887971 ?auto_887980 ) ) ( not ( = ?auto_887971 ?auto_887981 ) ) ( not ( = ?auto_887971 ?auto_887982 ) ) ( not ( = ?auto_887971 ?auto_887983 ) ) ( not ( = ?auto_887971 ?auto_887984 ) ) ( not ( = ?auto_887971 ?auto_887985 ) ) ( not ( = ?auto_887971 ?auto_887986 ) ) ( not ( = ?auto_887971 ?auto_887987 ) ) ( not ( = ?auto_887972 ?auto_887973 ) ) ( not ( = ?auto_887972 ?auto_887974 ) ) ( not ( = ?auto_887972 ?auto_887975 ) ) ( not ( = ?auto_887972 ?auto_887976 ) ) ( not ( = ?auto_887972 ?auto_887977 ) ) ( not ( = ?auto_887972 ?auto_887978 ) ) ( not ( = ?auto_887972 ?auto_887979 ) ) ( not ( = ?auto_887972 ?auto_887980 ) ) ( not ( = ?auto_887972 ?auto_887981 ) ) ( not ( = ?auto_887972 ?auto_887982 ) ) ( not ( = ?auto_887972 ?auto_887983 ) ) ( not ( = ?auto_887972 ?auto_887984 ) ) ( not ( = ?auto_887972 ?auto_887985 ) ) ( not ( = ?auto_887972 ?auto_887986 ) ) ( not ( = ?auto_887972 ?auto_887987 ) ) ( not ( = ?auto_887973 ?auto_887974 ) ) ( not ( = ?auto_887973 ?auto_887975 ) ) ( not ( = ?auto_887973 ?auto_887976 ) ) ( not ( = ?auto_887973 ?auto_887977 ) ) ( not ( = ?auto_887973 ?auto_887978 ) ) ( not ( = ?auto_887973 ?auto_887979 ) ) ( not ( = ?auto_887973 ?auto_887980 ) ) ( not ( = ?auto_887973 ?auto_887981 ) ) ( not ( = ?auto_887973 ?auto_887982 ) ) ( not ( = ?auto_887973 ?auto_887983 ) ) ( not ( = ?auto_887973 ?auto_887984 ) ) ( not ( = ?auto_887973 ?auto_887985 ) ) ( not ( = ?auto_887973 ?auto_887986 ) ) ( not ( = ?auto_887973 ?auto_887987 ) ) ( not ( = ?auto_887974 ?auto_887975 ) ) ( not ( = ?auto_887974 ?auto_887976 ) ) ( not ( = ?auto_887974 ?auto_887977 ) ) ( not ( = ?auto_887974 ?auto_887978 ) ) ( not ( = ?auto_887974 ?auto_887979 ) ) ( not ( = ?auto_887974 ?auto_887980 ) ) ( not ( = ?auto_887974 ?auto_887981 ) ) ( not ( = ?auto_887974 ?auto_887982 ) ) ( not ( = ?auto_887974 ?auto_887983 ) ) ( not ( = ?auto_887974 ?auto_887984 ) ) ( not ( = ?auto_887974 ?auto_887985 ) ) ( not ( = ?auto_887974 ?auto_887986 ) ) ( not ( = ?auto_887974 ?auto_887987 ) ) ( not ( = ?auto_887975 ?auto_887976 ) ) ( not ( = ?auto_887975 ?auto_887977 ) ) ( not ( = ?auto_887975 ?auto_887978 ) ) ( not ( = ?auto_887975 ?auto_887979 ) ) ( not ( = ?auto_887975 ?auto_887980 ) ) ( not ( = ?auto_887975 ?auto_887981 ) ) ( not ( = ?auto_887975 ?auto_887982 ) ) ( not ( = ?auto_887975 ?auto_887983 ) ) ( not ( = ?auto_887975 ?auto_887984 ) ) ( not ( = ?auto_887975 ?auto_887985 ) ) ( not ( = ?auto_887975 ?auto_887986 ) ) ( not ( = ?auto_887975 ?auto_887987 ) ) ( not ( = ?auto_887976 ?auto_887977 ) ) ( not ( = ?auto_887976 ?auto_887978 ) ) ( not ( = ?auto_887976 ?auto_887979 ) ) ( not ( = ?auto_887976 ?auto_887980 ) ) ( not ( = ?auto_887976 ?auto_887981 ) ) ( not ( = ?auto_887976 ?auto_887982 ) ) ( not ( = ?auto_887976 ?auto_887983 ) ) ( not ( = ?auto_887976 ?auto_887984 ) ) ( not ( = ?auto_887976 ?auto_887985 ) ) ( not ( = ?auto_887976 ?auto_887986 ) ) ( not ( = ?auto_887976 ?auto_887987 ) ) ( not ( = ?auto_887977 ?auto_887978 ) ) ( not ( = ?auto_887977 ?auto_887979 ) ) ( not ( = ?auto_887977 ?auto_887980 ) ) ( not ( = ?auto_887977 ?auto_887981 ) ) ( not ( = ?auto_887977 ?auto_887982 ) ) ( not ( = ?auto_887977 ?auto_887983 ) ) ( not ( = ?auto_887977 ?auto_887984 ) ) ( not ( = ?auto_887977 ?auto_887985 ) ) ( not ( = ?auto_887977 ?auto_887986 ) ) ( not ( = ?auto_887977 ?auto_887987 ) ) ( not ( = ?auto_887978 ?auto_887979 ) ) ( not ( = ?auto_887978 ?auto_887980 ) ) ( not ( = ?auto_887978 ?auto_887981 ) ) ( not ( = ?auto_887978 ?auto_887982 ) ) ( not ( = ?auto_887978 ?auto_887983 ) ) ( not ( = ?auto_887978 ?auto_887984 ) ) ( not ( = ?auto_887978 ?auto_887985 ) ) ( not ( = ?auto_887978 ?auto_887986 ) ) ( not ( = ?auto_887978 ?auto_887987 ) ) ( not ( = ?auto_887979 ?auto_887980 ) ) ( not ( = ?auto_887979 ?auto_887981 ) ) ( not ( = ?auto_887979 ?auto_887982 ) ) ( not ( = ?auto_887979 ?auto_887983 ) ) ( not ( = ?auto_887979 ?auto_887984 ) ) ( not ( = ?auto_887979 ?auto_887985 ) ) ( not ( = ?auto_887979 ?auto_887986 ) ) ( not ( = ?auto_887979 ?auto_887987 ) ) ( not ( = ?auto_887980 ?auto_887981 ) ) ( not ( = ?auto_887980 ?auto_887982 ) ) ( not ( = ?auto_887980 ?auto_887983 ) ) ( not ( = ?auto_887980 ?auto_887984 ) ) ( not ( = ?auto_887980 ?auto_887985 ) ) ( not ( = ?auto_887980 ?auto_887986 ) ) ( not ( = ?auto_887980 ?auto_887987 ) ) ( not ( = ?auto_887981 ?auto_887982 ) ) ( not ( = ?auto_887981 ?auto_887983 ) ) ( not ( = ?auto_887981 ?auto_887984 ) ) ( not ( = ?auto_887981 ?auto_887985 ) ) ( not ( = ?auto_887981 ?auto_887986 ) ) ( not ( = ?auto_887981 ?auto_887987 ) ) ( not ( = ?auto_887982 ?auto_887983 ) ) ( not ( = ?auto_887982 ?auto_887984 ) ) ( not ( = ?auto_887982 ?auto_887985 ) ) ( not ( = ?auto_887982 ?auto_887986 ) ) ( not ( = ?auto_887982 ?auto_887987 ) ) ( not ( = ?auto_887983 ?auto_887984 ) ) ( not ( = ?auto_887983 ?auto_887985 ) ) ( not ( = ?auto_887983 ?auto_887986 ) ) ( not ( = ?auto_887983 ?auto_887987 ) ) ( not ( = ?auto_887984 ?auto_887985 ) ) ( not ( = ?auto_887984 ?auto_887986 ) ) ( not ( = ?auto_887984 ?auto_887987 ) ) ( not ( = ?auto_887985 ?auto_887986 ) ) ( not ( = ?auto_887985 ?auto_887987 ) ) ( not ( = ?auto_887986 ?auto_887987 ) ) ( CLEAR ?auto_887984 ) ( ON ?auto_887985 ?auto_887986 ) ( CLEAR ?auto_887985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_887969 ?auto_887970 ?auto_887971 ?auto_887972 ?auto_887973 ?auto_887974 ?auto_887975 ?auto_887976 ?auto_887977 ?auto_887978 ?auto_887979 ?auto_887980 ?auto_887981 ?auto_887982 ?auto_887983 ?auto_887984 ?auto_887985 )
      ( MAKE-18PILE ?auto_887969 ?auto_887970 ?auto_887971 ?auto_887972 ?auto_887973 ?auto_887974 ?auto_887975 ?auto_887976 ?auto_887977 ?auto_887978 ?auto_887979 ?auto_887980 ?auto_887981 ?auto_887982 ?auto_887983 ?auto_887984 ?auto_887985 ?auto_887986 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888006 - BLOCK
      ?auto_888007 - BLOCK
      ?auto_888008 - BLOCK
      ?auto_888009 - BLOCK
      ?auto_888010 - BLOCK
      ?auto_888011 - BLOCK
      ?auto_888012 - BLOCK
      ?auto_888013 - BLOCK
      ?auto_888014 - BLOCK
      ?auto_888015 - BLOCK
      ?auto_888016 - BLOCK
      ?auto_888017 - BLOCK
      ?auto_888018 - BLOCK
      ?auto_888019 - BLOCK
      ?auto_888020 - BLOCK
      ?auto_888021 - BLOCK
      ?auto_888022 - BLOCK
      ?auto_888023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_888023 ) ( ON-TABLE ?auto_888006 ) ( ON ?auto_888007 ?auto_888006 ) ( ON ?auto_888008 ?auto_888007 ) ( ON ?auto_888009 ?auto_888008 ) ( ON ?auto_888010 ?auto_888009 ) ( ON ?auto_888011 ?auto_888010 ) ( ON ?auto_888012 ?auto_888011 ) ( ON ?auto_888013 ?auto_888012 ) ( ON ?auto_888014 ?auto_888013 ) ( ON ?auto_888015 ?auto_888014 ) ( ON ?auto_888016 ?auto_888015 ) ( ON ?auto_888017 ?auto_888016 ) ( ON ?auto_888018 ?auto_888017 ) ( ON ?auto_888019 ?auto_888018 ) ( ON ?auto_888020 ?auto_888019 ) ( ON ?auto_888021 ?auto_888020 ) ( not ( = ?auto_888006 ?auto_888007 ) ) ( not ( = ?auto_888006 ?auto_888008 ) ) ( not ( = ?auto_888006 ?auto_888009 ) ) ( not ( = ?auto_888006 ?auto_888010 ) ) ( not ( = ?auto_888006 ?auto_888011 ) ) ( not ( = ?auto_888006 ?auto_888012 ) ) ( not ( = ?auto_888006 ?auto_888013 ) ) ( not ( = ?auto_888006 ?auto_888014 ) ) ( not ( = ?auto_888006 ?auto_888015 ) ) ( not ( = ?auto_888006 ?auto_888016 ) ) ( not ( = ?auto_888006 ?auto_888017 ) ) ( not ( = ?auto_888006 ?auto_888018 ) ) ( not ( = ?auto_888006 ?auto_888019 ) ) ( not ( = ?auto_888006 ?auto_888020 ) ) ( not ( = ?auto_888006 ?auto_888021 ) ) ( not ( = ?auto_888006 ?auto_888022 ) ) ( not ( = ?auto_888006 ?auto_888023 ) ) ( not ( = ?auto_888007 ?auto_888008 ) ) ( not ( = ?auto_888007 ?auto_888009 ) ) ( not ( = ?auto_888007 ?auto_888010 ) ) ( not ( = ?auto_888007 ?auto_888011 ) ) ( not ( = ?auto_888007 ?auto_888012 ) ) ( not ( = ?auto_888007 ?auto_888013 ) ) ( not ( = ?auto_888007 ?auto_888014 ) ) ( not ( = ?auto_888007 ?auto_888015 ) ) ( not ( = ?auto_888007 ?auto_888016 ) ) ( not ( = ?auto_888007 ?auto_888017 ) ) ( not ( = ?auto_888007 ?auto_888018 ) ) ( not ( = ?auto_888007 ?auto_888019 ) ) ( not ( = ?auto_888007 ?auto_888020 ) ) ( not ( = ?auto_888007 ?auto_888021 ) ) ( not ( = ?auto_888007 ?auto_888022 ) ) ( not ( = ?auto_888007 ?auto_888023 ) ) ( not ( = ?auto_888008 ?auto_888009 ) ) ( not ( = ?auto_888008 ?auto_888010 ) ) ( not ( = ?auto_888008 ?auto_888011 ) ) ( not ( = ?auto_888008 ?auto_888012 ) ) ( not ( = ?auto_888008 ?auto_888013 ) ) ( not ( = ?auto_888008 ?auto_888014 ) ) ( not ( = ?auto_888008 ?auto_888015 ) ) ( not ( = ?auto_888008 ?auto_888016 ) ) ( not ( = ?auto_888008 ?auto_888017 ) ) ( not ( = ?auto_888008 ?auto_888018 ) ) ( not ( = ?auto_888008 ?auto_888019 ) ) ( not ( = ?auto_888008 ?auto_888020 ) ) ( not ( = ?auto_888008 ?auto_888021 ) ) ( not ( = ?auto_888008 ?auto_888022 ) ) ( not ( = ?auto_888008 ?auto_888023 ) ) ( not ( = ?auto_888009 ?auto_888010 ) ) ( not ( = ?auto_888009 ?auto_888011 ) ) ( not ( = ?auto_888009 ?auto_888012 ) ) ( not ( = ?auto_888009 ?auto_888013 ) ) ( not ( = ?auto_888009 ?auto_888014 ) ) ( not ( = ?auto_888009 ?auto_888015 ) ) ( not ( = ?auto_888009 ?auto_888016 ) ) ( not ( = ?auto_888009 ?auto_888017 ) ) ( not ( = ?auto_888009 ?auto_888018 ) ) ( not ( = ?auto_888009 ?auto_888019 ) ) ( not ( = ?auto_888009 ?auto_888020 ) ) ( not ( = ?auto_888009 ?auto_888021 ) ) ( not ( = ?auto_888009 ?auto_888022 ) ) ( not ( = ?auto_888009 ?auto_888023 ) ) ( not ( = ?auto_888010 ?auto_888011 ) ) ( not ( = ?auto_888010 ?auto_888012 ) ) ( not ( = ?auto_888010 ?auto_888013 ) ) ( not ( = ?auto_888010 ?auto_888014 ) ) ( not ( = ?auto_888010 ?auto_888015 ) ) ( not ( = ?auto_888010 ?auto_888016 ) ) ( not ( = ?auto_888010 ?auto_888017 ) ) ( not ( = ?auto_888010 ?auto_888018 ) ) ( not ( = ?auto_888010 ?auto_888019 ) ) ( not ( = ?auto_888010 ?auto_888020 ) ) ( not ( = ?auto_888010 ?auto_888021 ) ) ( not ( = ?auto_888010 ?auto_888022 ) ) ( not ( = ?auto_888010 ?auto_888023 ) ) ( not ( = ?auto_888011 ?auto_888012 ) ) ( not ( = ?auto_888011 ?auto_888013 ) ) ( not ( = ?auto_888011 ?auto_888014 ) ) ( not ( = ?auto_888011 ?auto_888015 ) ) ( not ( = ?auto_888011 ?auto_888016 ) ) ( not ( = ?auto_888011 ?auto_888017 ) ) ( not ( = ?auto_888011 ?auto_888018 ) ) ( not ( = ?auto_888011 ?auto_888019 ) ) ( not ( = ?auto_888011 ?auto_888020 ) ) ( not ( = ?auto_888011 ?auto_888021 ) ) ( not ( = ?auto_888011 ?auto_888022 ) ) ( not ( = ?auto_888011 ?auto_888023 ) ) ( not ( = ?auto_888012 ?auto_888013 ) ) ( not ( = ?auto_888012 ?auto_888014 ) ) ( not ( = ?auto_888012 ?auto_888015 ) ) ( not ( = ?auto_888012 ?auto_888016 ) ) ( not ( = ?auto_888012 ?auto_888017 ) ) ( not ( = ?auto_888012 ?auto_888018 ) ) ( not ( = ?auto_888012 ?auto_888019 ) ) ( not ( = ?auto_888012 ?auto_888020 ) ) ( not ( = ?auto_888012 ?auto_888021 ) ) ( not ( = ?auto_888012 ?auto_888022 ) ) ( not ( = ?auto_888012 ?auto_888023 ) ) ( not ( = ?auto_888013 ?auto_888014 ) ) ( not ( = ?auto_888013 ?auto_888015 ) ) ( not ( = ?auto_888013 ?auto_888016 ) ) ( not ( = ?auto_888013 ?auto_888017 ) ) ( not ( = ?auto_888013 ?auto_888018 ) ) ( not ( = ?auto_888013 ?auto_888019 ) ) ( not ( = ?auto_888013 ?auto_888020 ) ) ( not ( = ?auto_888013 ?auto_888021 ) ) ( not ( = ?auto_888013 ?auto_888022 ) ) ( not ( = ?auto_888013 ?auto_888023 ) ) ( not ( = ?auto_888014 ?auto_888015 ) ) ( not ( = ?auto_888014 ?auto_888016 ) ) ( not ( = ?auto_888014 ?auto_888017 ) ) ( not ( = ?auto_888014 ?auto_888018 ) ) ( not ( = ?auto_888014 ?auto_888019 ) ) ( not ( = ?auto_888014 ?auto_888020 ) ) ( not ( = ?auto_888014 ?auto_888021 ) ) ( not ( = ?auto_888014 ?auto_888022 ) ) ( not ( = ?auto_888014 ?auto_888023 ) ) ( not ( = ?auto_888015 ?auto_888016 ) ) ( not ( = ?auto_888015 ?auto_888017 ) ) ( not ( = ?auto_888015 ?auto_888018 ) ) ( not ( = ?auto_888015 ?auto_888019 ) ) ( not ( = ?auto_888015 ?auto_888020 ) ) ( not ( = ?auto_888015 ?auto_888021 ) ) ( not ( = ?auto_888015 ?auto_888022 ) ) ( not ( = ?auto_888015 ?auto_888023 ) ) ( not ( = ?auto_888016 ?auto_888017 ) ) ( not ( = ?auto_888016 ?auto_888018 ) ) ( not ( = ?auto_888016 ?auto_888019 ) ) ( not ( = ?auto_888016 ?auto_888020 ) ) ( not ( = ?auto_888016 ?auto_888021 ) ) ( not ( = ?auto_888016 ?auto_888022 ) ) ( not ( = ?auto_888016 ?auto_888023 ) ) ( not ( = ?auto_888017 ?auto_888018 ) ) ( not ( = ?auto_888017 ?auto_888019 ) ) ( not ( = ?auto_888017 ?auto_888020 ) ) ( not ( = ?auto_888017 ?auto_888021 ) ) ( not ( = ?auto_888017 ?auto_888022 ) ) ( not ( = ?auto_888017 ?auto_888023 ) ) ( not ( = ?auto_888018 ?auto_888019 ) ) ( not ( = ?auto_888018 ?auto_888020 ) ) ( not ( = ?auto_888018 ?auto_888021 ) ) ( not ( = ?auto_888018 ?auto_888022 ) ) ( not ( = ?auto_888018 ?auto_888023 ) ) ( not ( = ?auto_888019 ?auto_888020 ) ) ( not ( = ?auto_888019 ?auto_888021 ) ) ( not ( = ?auto_888019 ?auto_888022 ) ) ( not ( = ?auto_888019 ?auto_888023 ) ) ( not ( = ?auto_888020 ?auto_888021 ) ) ( not ( = ?auto_888020 ?auto_888022 ) ) ( not ( = ?auto_888020 ?auto_888023 ) ) ( not ( = ?auto_888021 ?auto_888022 ) ) ( not ( = ?auto_888021 ?auto_888023 ) ) ( not ( = ?auto_888022 ?auto_888023 ) ) ( CLEAR ?auto_888021 ) ( ON ?auto_888022 ?auto_888023 ) ( CLEAR ?auto_888022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_888006 ?auto_888007 ?auto_888008 ?auto_888009 ?auto_888010 ?auto_888011 ?auto_888012 ?auto_888013 ?auto_888014 ?auto_888015 ?auto_888016 ?auto_888017 ?auto_888018 ?auto_888019 ?auto_888020 ?auto_888021 ?auto_888022 )
      ( MAKE-18PILE ?auto_888006 ?auto_888007 ?auto_888008 ?auto_888009 ?auto_888010 ?auto_888011 ?auto_888012 ?auto_888013 ?auto_888014 ?auto_888015 ?auto_888016 ?auto_888017 ?auto_888018 ?auto_888019 ?auto_888020 ?auto_888021 ?auto_888022 ?auto_888023 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888042 - BLOCK
      ?auto_888043 - BLOCK
      ?auto_888044 - BLOCK
      ?auto_888045 - BLOCK
      ?auto_888046 - BLOCK
      ?auto_888047 - BLOCK
      ?auto_888048 - BLOCK
      ?auto_888049 - BLOCK
      ?auto_888050 - BLOCK
      ?auto_888051 - BLOCK
      ?auto_888052 - BLOCK
      ?auto_888053 - BLOCK
      ?auto_888054 - BLOCK
      ?auto_888055 - BLOCK
      ?auto_888056 - BLOCK
      ?auto_888057 - BLOCK
      ?auto_888058 - BLOCK
      ?auto_888059 - BLOCK
    )
    :vars
    (
      ?auto_888060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_888059 ?auto_888060 ) ( ON-TABLE ?auto_888042 ) ( ON ?auto_888043 ?auto_888042 ) ( ON ?auto_888044 ?auto_888043 ) ( ON ?auto_888045 ?auto_888044 ) ( ON ?auto_888046 ?auto_888045 ) ( ON ?auto_888047 ?auto_888046 ) ( ON ?auto_888048 ?auto_888047 ) ( ON ?auto_888049 ?auto_888048 ) ( ON ?auto_888050 ?auto_888049 ) ( ON ?auto_888051 ?auto_888050 ) ( ON ?auto_888052 ?auto_888051 ) ( ON ?auto_888053 ?auto_888052 ) ( ON ?auto_888054 ?auto_888053 ) ( ON ?auto_888055 ?auto_888054 ) ( ON ?auto_888056 ?auto_888055 ) ( not ( = ?auto_888042 ?auto_888043 ) ) ( not ( = ?auto_888042 ?auto_888044 ) ) ( not ( = ?auto_888042 ?auto_888045 ) ) ( not ( = ?auto_888042 ?auto_888046 ) ) ( not ( = ?auto_888042 ?auto_888047 ) ) ( not ( = ?auto_888042 ?auto_888048 ) ) ( not ( = ?auto_888042 ?auto_888049 ) ) ( not ( = ?auto_888042 ?auto_888050 ) ) ( not ( = ?auto_888042 ?auto_888051 ) ) ( not ( = ?auto_888042 ?auto_888052 ) ) ( not ( = ?auto_888042 ?auto_888053 ) ) ( not ( = ?auto_888042 ?auto_888054 ) ) ( not ( = ?auto_888042 ?auto_888055 ) ) ( not ( = ?auto_888042 ?auto_888056 ) ) ( not ( = ?auto_888042 ?auto_888057 ) ) ( not ( = ?auto_888042 ?auto_888058 ) ) ( not ( = ?auto_888042 ?auto_888059 ) ) ( not ( = ?auto_888042 ?auto_888060 ) ) ( not ( = ?auto_888043 ?auto_888044 ) ) ( not ( = ?auto_888043 ?auto_888045 ) ) ( not ( = ?auto_888043 ?auto_888046 ) ) ( not ( = ?auto_888043 ?auto_888047 ) ) ( not ( = ?auto_888043 ?auto_888048 ) ) ( not ( = ?auto_888043 ?auto_888049 ) ) ( not ( = ?auto_888043 ?auto_888050 ) ) ( not ( = ?auto_888043 ?auto_888051 ) ) ( not ( = ?auto_888043 ?auto_888052 ) ) ( not ( = ?auto_888043 ?auto_888053 ) ) ( not ( = ?auto_888043 ?auto_888054 ) ) ( not ( = ?auto_888043 ?auto_888055 ) ) ( not ( = ?auto_888043 ?auto_888056 ) ) ( not ( = ?auto_888043 ?auto_888057 ) ) ( not ( = ?auto_888043 ?auto_888058 ) ) ( not ( = ?auto_888043 ?auto_888059 ) ) ( not ( = ?auto_888043 ?auto_888060 ) ) ( not ( = ?auto_888044 ?auto_888045 ) ) ( not ( = ?auto_888044 ?auto_888046 ) ) ( not ( = ?auto_888044 ?auto_888047 ) ) ( not ( = ?auto_888044 ?auto_888048 ) ) ( not ( = ?auto_888044 ?auto_888049 ) ) ( not ( = ?auto_888044 ?auto_888050 ) ) ( not ( = ?auto_888044 ?auto_888051 ) ) ( not ( = ?auto_888044 ?auto_888052 ) ) ( not ( = ?auto_888044 ?auto_888053 ) ) ( not ( = ?auto_888044 ?auto_888054 ) ) ( not ( = ?auto_888044 ?auto_888055 ) ) ( not ( = ?auto_888044 ?auto_888056 ) ) ( not ( = ?auto_888044 ?auto_888057 ) ) ( not ( = ?auto_888044 ?auto_888058 ) ) ( not ( = ?auto_888044 ?auto_888059 ) ) ( not ( = ?auto_888044 ?auto_888060 ) ) ( not ( = ?auto_888045 ?auto_888046 ) ) ( not ( = ?auto_888045 ?auto_888047 ) ) ( not ( = ?auto_888045 ?auto_888048 ) ) ( not ( = ?auto_888045 ?auto_888049 ) ) ( not ( = ?auto_888045 ?auto_888050 ) ) ( not ( = ?auto_888045 ?auto_888051 ) ) ( not ( = ?auto_888045 ?auto_888052 ) ) ( not ( = ?auto_888045 ?auto_888053 ) ) ( not ( = ?auto_888045 ?auto_888054 ) ) ( not ( = ?auto_888045 ?auto_888055 ) ) ( not ( = ?auto_888045 ?auto_888056 ) ) ( not ( = ?auto_888045 ?auto_888057 ) ) ( not ( = ?auto_888045 ?auto_888058 ) ) ( not ( = ?auto_888045 ?auto_888059 ) ) ( not ( = ?auto_888045 ?auto_888060 ) ) ( not ( = ?auto_888046 ?auto_888047 ) ) ( not ( = ?auto_888046 ?auto_888048 ) ) ( not ( = ?auto_888046 ?auto_888049 ) ) ( not ( = ?auto_888046 ?auto_888050 ) ) ( not ( = ?auto_888046 ?auto_888051 ) ) ( not ( = ?auto_888046 ?auto_888052 ) ) ( not ( = ?auto_888046 ?auto_888053 ) ) ( not ( = ?auto_888046 ?auto_888054 ) ) ( not ( = ?auto_888046 ?auto_888055 ) ) ( not ( = ?auto_888046 ?auto_888056 ) ) ( not ( = ?auto_888046 ?auto_888057 ) ) ( not ( = ?auto_888046 ?auto_888058 ) ) ( not ( = ?auto_888046 ?auto_888059 ) ) ( not ( = ?auto_888046 ?auto_888060 ) ) ( not ( = ?auto_888047 ?auto_888048 ) ) ( not ( = ?auto_888047 ?auto_888049 ) ) ( not ( = ?auto_888047 ?auto_888050 ) ) ( not ( = ?auto_888047 ?auto_888051 ) ) ( not ( = ?auto_888047 ?auto_888052 ) ) ( not ( = ?auto_888047 ?auto_888053 ) ) ( not ( = ?auto_888047 ?auto_888054 ) ) ( not ( = ?auto_888047 ?auto_888055 ) ) ( not ( = ?auto_888047 ?auto_888056 ) ) ( not ( = ?auto_888047 ?auto_888057 ) ) ( not ( = ?auto_888047 ?auto_888058 ) ) ( not ( = ?auto_888047 ?auto_888059 ) ) ( not ( = ?auto_888047 ?auto_888060 ) ) ( not ( = ?auto_888048 ?auto_888049 ) ) ( not ( = ?auto_888048 ?auto_888050 ) ) ( not ( = ?auto_888048 ?auto_888051 ) ) ( not ( = ?auto_888048 ?auto_888052 ) ) ( not ( = ?auto_888048 ?auto_888053 ) ) ( not ( = ?auto_888048 ?auto_888054 ) ) ( not ( = ?auto_888048 ?auto_888055 ) ) ( not ( = ?auto_888048 ?auto_888056 ) ) ( not ( = ?auto_888048 ?auto_888057 ) ) ( not ( = ?auto_888048 ?auto_888058 ) ) ( not ( = ?auto_888048 ?auto_888059 ) ) ( not ( = ?auto_888048 ?auto_888060 ) ) ( not ( = ?auto_888049 ?auto_888050 ) ) ( not ( = ?auto_888049 ?auto_888051 ) ) ( not ( = ?auto_888049 ?auto_888052 ) ) ( not ( = ?auto_888049 ?auto_888053 ) ) ( not ( = ?auto_888049 ?auto_888054 ) ) ( not ( = ?auto_888049 ?auto_888055 ) ) ( not ( = ?auto_888049 ?auto_888056 ) ) ( not ( = ?auto_888049 ?auto_888057 ) ) ( not ( = ?auto_888049 ?auto_888058 ) ) ( not ( = ?auto_888049 ?auto_888059 ) ) ( not ( = ?auto_888049 ?auto_888060 ) ) ( not ( = ?auto_888050 ?auto_888051 ) ) ( not ( = ?auto_888050 ?auto_888052 ) ) ( not ( = ?auto_888050 ?auto_888053 ) ) ( not ( = ?auto_888050 ?auto_888054 ) ) ( not ( = ?auto_888050 ?auto_888055 ) ) ( not ( = ?auto_888050 ?auto_888056 ) ) ( not ( = ?auto_888050 ?auto_888057 ) ) ( not ( = ?auto_888050 ?auto_888058 ) ) ( not ( = ?auto_888050 ?auto_888059 ) ) ( not ( = ?auto_888050 ?auto_888060 ) ) ( not ( = ?auto_888051 ?auto_888052 ) ) ( not ( = ?auto_888051 ?auto_888053 ) ) ( not ( = ?auto_888051 ?auto_888054 ) ) ( not ( = ?auto_888051 ?auto_888055 ) ) ( not ( = ?auto_888051 ?auto_888056 ) ) ( not ( = ?auto_888051 ?auto_888057 ) ) ( not ( = ?auto_888051 ?auto_888058 ) ) ( not ( = ?auto_888051 ?auto_888059 ) ) ( not ( = ?auto_888051 ?auto_888060 ) ) ( not ( = ?auto_888052 ?auto_888053 ) ) ( not ( = ?auto_888052 ?auto_888054 ) ) ( not ( = ?auto_888052 ?auto_888055 ) ) ( not ( = ?auto_888052 ?auto_888056 ) ) ( not ( = ?auto_888052 ?auto_888057 ) ) ( not ( = ?auto_888052 ?auto_888058 ) ) ( not ( = ?auto_888052 ?auto_888059 ) ) ( not ( = ?auto_888052 ?auto_888060 ) ) ( not ( = ?auto_888053 ?auto_888054 ) ) ( not ( = ?auto_888053 ?auto_888055 ) ) ( not ( = ?auto_888053 ?auto_888056 ) ) ( not ( = ?auto_888053 ?auto_888057 ) ) ( not ( = ?auto_888053 ?auto_888058 ) ) ( not ( = ?auto_888053 ?auto_888059 ) ) ( not ( = ?auto_888053 ?auto_888060 ) ) ( not ( = ?auto_888054 ?auto_888055 ) ) ( not ( = ?auto_888054 ?auto_888056 ) ) ( not ( = ?auto_888054 ?auto_888057 ) ) ( not ( = ?auto_888054 ?auto_888058 ) ) ( not ( = ?auto_888054 ?auto_888059 ) ) ( not ( = ?auto_888054 ?auto_888060 ) ) ( not ( = ?auto_888055 ?auto_888056 ) ) ( not ( = ?auto_888055 ?auto_888057 ) ) ( not ( = ?auto_888055 ?auto_888058 ) ) ( not ( = ?auto_888055 ?auto_888059 ) ) ( not ( = ?auto_888055 ?auto_888060 ) ) ( not ( = ?auto_888056 ?auto_888057 ) ) ( not ( = ?auto_888056 ?auto_888058 ) ) ( not ( = ?auto_888056 ?auto_888059 ) ) ( not ( = ?auto_888056 ?auto_888060 ) ) ( not ( = ?auto_888057 ?auto_888058 ) ) ( not ( = ?auto_888057 ?auto_888059 ) ) ( not ( = ?auto_888057 ?auto_888060 ) ) ( not ( = ?auto_888058 ?auto_888059 ) ) ( not ( = ?auto_888058 ?auto_888060 ) ) ( not ( = ?auto_888059 ?auto_888060 ) ) ( ON ?auto_888058 ?auto_888059 ) ( CLEAR ?auto_888056 ) ( ON ?auto_888057 ?auto_888058 ) ( CLEAR ?auto_888057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_888042 ?auto_888043 ?auto_888044 ?auto_888045 ?auto_888046 ?auto_888047 ?auto_888048 ?auto_888049 ?auto_888050 ?auto_888051 ?auto_888052 ?auto_888053 ?auto_888054 ?auto_888055 ?auto_888056 ?auto_888057 )
      ( MAKE-18PILE ?auto_888042 ?auto_888043 ?auto_888044 ?auto_888045 ?auto_888046 ?auto_888047 ?auto_888048 ?auto_888049 ?auto_888050 ?auto_888051 ?auto_888052 ?auto_888053 ?auto_888054 ?auto_888055 ?auto_888056 ?auto_888057 ?auto_888058 ?auto_888059 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888079 - BLOCK
      ?auto_888080 - BLOCK
      ?auto_888081 - BLOCK
      ?auto_888082 - BLOCK
      ?auto_888083 - BLOCK
      ?auto_888084 - BLOCK
      ?auto_888085 - BLOCK
      ?auto_888086 - BLOCK
      ?auto_888087 - BLOCK
      ?auto_888088 - BLOCK
      ?auto_888089 - BLOCK
      ?auto_888090 - BLOCK
      ?auto_888091 - BLOCK
      ?auto_888092 - BLOCK
      ?auto_888093 - BLOCK
      ?auto_888094 - BLOCK
      ?auto_888095 - BLOCK
      ?auto_888096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_888096 ) ( ON-TABLE ?auto_888079 ) ( ON ?auto_888080 ?auto_888079 ) ( ON ?auto_888081 ?auto_888080 ) ( ON ?auto_888082 ?auto_888081 ) ( ON ?auto_888083 ?auto_888082 ) ( ON ?auto_888084 ?auto_888083 ) ( ON ?auto_888085 ?auto_888084 ) ( ON ?auto_888086 ?auto_888085 ) ( ON ?auto_888087 ?auto_888086 ) ( ON ?auto_888088 ?auto_888087 ) ( ON ?auto_888089 ?auto_888088 ) ( ON ?auto_888090 ?auto_888089 ) ( ON ?auto_888091 ?auto_888090 ) ( ON ?auto_888092 ?auto_888091 ) ( ON ?auto_888093 ?auto_888092 ) ( not ( = ?auto_888079 ?auto_888080 ) ) ( not ( = ?auto_888079 ?auto_888081 ) ) ( not ( = ?auto_888079 ?auto_888082 ) ) ( not ( = ?auto_888079 ?auto_888083 ) ) ( not ( = ?auto_888079 ?auto_888084 ) ) ( not ( = ?auto_888079 ?auto_888085 ) ) ( not ( = ?auto_888079 ?auto_888086 ) ) ( not ( = ?auto_888079 ?auto_888087 ) ) ( not ( = ?auto_888079 ?auto_888088 ) ) ( not ( = ?auto_888079 ?auto_888089 ) ) ( not ( = ?auto_888079 ?auto_888090 ) ) ( not ( = ?auto_888079 ?auto_888091 ) ) ( not ( = ?auto_888079 ?auto_888092 ) ) ( not ( = ?auto_888079 ?auto_888093 ) ) ( not ( = ?auto_888079 ?auto_888094 ) ) ( not ( = ?auto_888079 ?auto_888095 ) ) ( not ( = ?auto_888079 ?auto_888096 ) ) ( not ( = ?auto_888080 ?auto_888081 ) ) ( not ( = ?auto_888080 ?auto_888082 ) ) ( not ( = ?auto_888080 ?auto_888083 ) ) ( not ( = ?auto_888080 ?auto_888084 ) ) ( not ( = ?auto_888080 ?auto_888085 ) ) ( not ( = ?auto_888080 ?auto_888086 ) ) ( not ( = ?auto_888080 ?auto_888087 ) ) ( not ( = ?auto_888080 ?auto_888088 ) ) ( not ( = ?auto_888080 ?auto_888089 ) ) ( not ( = ?auto_888080 ?auto_888090 ) ) ( not ( = ?auto_888080 ?auto_888091 ) ) ( not ( = ?auto_888080 ?auto_888092 ) ) ( not ( = ?auto_888080 ?auto_888093 ) ) ( not ( = ?auto_888080 ?auto_888094 ) ) ( not ( = ?auto_888080 ?auto_888095 ) ) ( not ( = ?auto_888080 ?auto_888096 ) ) ( not ( = ?auto_888081 ?auto_888082 ) ) ( not ( = ?auto_888081 ?auto_888083 ) ) ( not ( = ?auto_888081 ?auto_888084 ) ) ( not ( = ?auto_888081 ?auto_888085 ) ) ( not ( = ?auto_888081 ?auto_888086 ) ) ( not ( = ?auto_888081 ?auto_888087 ) ) ( not ( = ?auto_888081 ?auto_888088 ) ) ( not ( = ?auto_888081 ?auto_888089 ) ) ( not ( = ?auto_888081 ?auto_888090 ) ) ( not ( = ?auto_888081 ?auto_888091 ) ) ( not ( = ?auto_888081 ?auto_888092 ) ) ( not ( = ?auto_888081 ?auto_888093 ) ) ( not ( = ?auto_888081 ?auto_888094 ) ) ( not ( = ?auto_888081 ?auto_888095 ) ) ( not ( = ?auto_888081 ?auto_888096 ) ) ( not ( = ?auto_888082 ?auto_888083 ) ) ( not ( = ?auto_888082 ?auto_888084 ) ) ( not ( = ?auto_888082 ?auto_888085 ) ) ( not ( = ?auto_888082 ?auto_888086 ) ) ( not ( = ?auto_888082 ?auto_888087 ) ) ( not ( = ?auto_888082 ?auto_888088 ) ) ( not ( = ?auto_888082 ?auto_888089 ) ) ( not ( = ?auto_888082 ?auto_888090 ) ) ( not ( = ?auto_888082 ?auto_888091 ) ) ( not ( = ?auto_888082 ?auto_888092 ) ) ( not ( = ?auto_888082 ?auto_888093 ) ) ( not ( = ?auto_888082 ?auto_888094 ) ) ( not ( = ?auto_888082 ?auto_888095 ) ) ( not ( = ?auto_888082 ?auto_888096 ) ) ( not ( = ?auto_888083 ?auto_888084 ) ) ( not ( = ?auto_888083 ?auto_888085 ) ) ( not ( = ?auto_888083 ?auto_888086 ) ) ( not ( = ?auto_888083 ?auto_888087 ) ) ( not ( = ?auto_888083 ?auto_888088 ) ) ( not ( = ?auto_888083 ?auto_888089 ) ) ( not ( = ?auto_888083 ?auto_888090 ) ) ( not ( = ?auto_888083 ?auto_888091 ) ) ( not ( = ?auto_888083 ?auto_888092 ) ) ( not ( = ?auto_888083 ?auto_888093 ) ) ( not ( = ?auto_888083 ?auto_888094 ) ) ( not ( = ?auto_888083 ?auto_888095 ) ) ( not ( = ?auto_888083 ?auto_888096 ) ) ( not ( = ?auto_888084 ?auto_888085 ) ) ( not ( = ?auto_888084 ?auto_888086 ) ) ( not ( = ?auto_888084 ?auto_888087 ) ) ( not ( = ?auto_888084 ?auto_888088 ) ) ( not ( = ?auto_888084 ?auto_888089 ) ) ( not ( = ?auto_888084 ?auto_888090 ) ) ( not ( = ?auto_888084 ?auto_888091 ) ) ( not ( = ?auto_888084 ?auto_888092 ) ) ( not ( = ?auto_888084 ?auto_888093 ) ) ( not ( = ?auto_888084 ?auto_888094 ) ) ( not ( = ?auto_888084 ?auto_888095 ) ) ( not ( = ?auto_888084 ?auto_888096 ) ) ( not ( = ?auto_888085 ?auto_888086 ) ) ( not ( = ?auto_888085 ?auto_888087 ) ) ( not ( = ?auto_888085 ?auto_888088 ) ) ( not ( = ?auto_888085 ?auto_888089 ) ) ( not ( = ?auto_888085 ?auto_888090 ) ) ( not ( = ?auto_888085 ?auto_888091 ) ) ( not ( = ?auto_888085 ?auto_888092 ) ) ( not ( = ?auto_888085 ?auto_888093 ) ) ( not ( = ?auto_888085 ?auto_888094 ) ) ( not ( = ?auto_888085 ?auto_888095 ) ) ( not ( = ?auto_888085 ?auto_888096 ) ) ( not ( = ?auto_888086 ?auto_888087 ) ) ( not ( = ?auto_888086 ?auto_888088 ) ) ( not ( = ?auto_888086 ?auto_888089 ) ) ( not ( = ?auto_888086 ?auto_888090 ) ) ( not ( = ?auto_888086 ?auto_888091 ) ) ( not ( = ?auto_888086 ?auto_888092 ) ) ( not ( = ?auto_888086 ?auto_888093 ) ) ( not ( = ?auto_888086 ?auto_888094 ) ) ( not ( = ?auto_888086 ?auto_888095 ) ) ( not ( = ?auto_888086 ?auto_888096 ) ) ( not ( = ?auto_888087 ?auto_888088 ) ) ( not ( = ?auto_888087 ?auto_888089 ) ) ( not ( = ?auto_888087 ?auto_888090 ) ) ( not ( = ?auto_888087 ?auto_888091 ) ) ( not ( = ?auto_888087 ?auto_888092 ) ) ( not ( = ?auto_888087 ?auto_888093 ) ) ( not ( = ?auto_888087 ?auto_888094 ) ) ( not ( = ?auto_888087 ?auto_888095 ) ) ( not ( = ?auto_888087 ?auto_888096 ) ) ( not ( = ?auto_888088 ?auto_888089 ) ) ( not ( = ?auto_888088 ?auto_888090 ) ) ( not ( = ?auto_888088 ?auto_888091 ) ) ( not ( = ?auto_888088 ?auto_888092 ) ) ( not ( = ?auto_888088 ?auto_888093 ) ) ( not ( = ?auto_888088 ?auto_888094 ) ) ( not ( = ?auto_888088 ?auto_888095 ) ) ( not ( = ?auto_888088 ?auto_888096 ) ) ( not ( = ?auto_888089 ?auto_888090 ) ) ( not ( = ?auto_888089 ?auto_888091 ) ) ( not ( = ?auto_888089 ?auto_888092 ) ) ( not ( = ?auto_888089 ?auto_888093 ) ) ( not ( = ?auto_888089 ?auto_888094 ) ) ( not ( = ?auto_888089 ?auto_888095 ) ) ( not ( = ?auto_888089 ?auto_888096 ) ) ( not ( = ?auto_888090 ?auto_888091 ) ) ( not ( = ?auto_888090 ?auto_888092 ) ) ( not ( = ?auto_888090 ?auto_888093 ) ) ( not ( = ?auto_888090 ?auto_888094 ) ) ( not ( = ?auto_888090 ?auto_888095 ) ) ( not ( = ?auto_888090 ?auto_888096 ) ) ( not ( = ?auto_888091 ?auto_888092 ) ) ( not ( = ?auto_888091 ?auto_888093 ) ) ( not ( = ?auto_888091 ?auto_888094 ) ) ( not ( = ?auto_888091 ?auto_888095 ) ) ( not ( = ?auto_888091 ?auto_888096 ) ) ( not ( = ?auto_888092 ?auto_888093 ) ) ( not ( = ?auto_888092 ?auto_888094 ) ) ( not ( = ?auto_888092 ?auto_888095 ) ) ( not ( = ?auto_888092 ?auto_888096 ) ) ( not ( = ?auto_888093 ?auto_888094 ) ) ( not ( = ?auto_888093 ?auto_888095 ) ) ( not ( = ?auto_888093 ?auto_888096 ) ) ( not ( = ?auto_888094 ?auto_888095 ) ) ( not ( = ?auto_888094 ?auto_888096 ) ) ( not ( = ?auto_888095 ?auto_888096 ) ) ( ON ?auto_888095 ?auto_888096 ) ( CLEAR ?auto_888093 ) ( ON ?auto_888094 ?auto_888095 ) ( CLEAR ?auto_888094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_888079 ?auto_888080 ?auto_888081 ?auto_888082 ?auto_888083 ?auto_888084 ?auto_888085 ?auto_888086 ?auto_888087 ?auto_888088 ?auto_888089 ?auto_888090 ?auto_888091 ?auto_888092 ?auto_888093 ?auto_888094 )
      ( MAKE-18PILE ?auto_888079 ?auto_888080 ?auto_888081 ?auto_888082 ?auto_888083 ?auto_888084 ?auto_888085 ?auto_888086 ?auto_888087 ?auto_888088 ?auto_888089 ?auto_888090 ?auto_888091 ?auto_888092 ?auto_888093 ?auto_888094 ?auto_888095 ?auto_888096 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888115 - BLOCK
      ?auto_888116 - BLOCK
      ?auto_888117 - BLOCK
      ?auto_888118 - BLOCK
      ?auto_888119 - BLOCK
      ?auto_888120 - BLOCK
      ?auto_888121 - BLOCK
      ?auto_888122 - BLOCK
      ?auto_888123 - BLOCK
      ?auto_888124 - BLOCK
      ?auto_888125 - BLOCK
      ?auto_888126 - BLOCK
      ?auto_888127 - BLOCK
      ?auto_888128 - BLOCK
      ?auto_888129 - BLOCK
      ?auto_888130 - BLOCK
      ?auto_888131 - BLOCK
      ?auto_888132 - BLOCK
    )
    :vars
    (
      ?auto_888133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_888132 ?auto_888133 ) ( ON-TABLE ?auto_888115 ) ( ON ?auto_888116 ?auto_888115 ) ( ON ?auto_888117 ?auto_888116 ) ( ON ?auto_888118 ?auto_888117 ) ( ON ?auto_888119 ?auto_888118 ) ( ON ?auto_888120 ?auto_888119 ) ( ON ?auto_888121 ?auto_888120 ) ( ON ?auto_888122 ?auto_888121 ) ( ON ?auto_888123 ?auto_888122 ) ( ON ?auto_888124 ?auto_888123 ) ( ON ?auto_888125 ?auto_888124 ) ( ON ?auto_888126 ?auto_888125 ) ( ON ?auto_888127 ?auto_888126 ) ( ON ?auto_888128 ?auto_888127 ) ( not ( = ?auto_888115 ?auto_888116 ) ) ( not ( = ?auto_888115 ?auto_888117 ) ) ( not ( = ?auto_888115 ?auto_888118 ) ) ( not ( = ?auto_888115 ?auto_888119 ) ) ( not ( = ?auto_888115 ?auto_888120 ) ) ( not ( = ?auto_888115 ?auto_888121 ) ) ( not ( = ?auto_888115 ?auto_888122 ) ) ( not ( = ?auto_888115 ?auto_888123 ) ) ( not ( = ?auto_888115 ?auto_888124 ) ) ( not ( = ?auto_888115 ?auto_888125 ) ) ( not ( = ?auto_888115 ?auto_888126 ) ) ( not ( = ?auto_888115 ?auto_888127 ) ) ( not ( = ?auto_888115 ?auto_888128 ) ) ( not ( = ?auto_888115 ?auto_888129 ) ) ( not ( = ?auto_888115 ?auto_888130 ) ) ( not ( = ?auto_888115 ?auto_888131 ) ) ( not ( = ?auto_888115 ?auto_888132 ) ) ( not ( = ?auto_888115 ?auto_888133 ) ) ( not ( = ?auto_888116 ?auto_888117 ) ) ( not ( = ?auto_888116 ?auto_888118 ) ) ( not ( = ?auto_888116 ?auto_888119 ) ) ( not ( = ?auto_888116 ?auto_888120 ) ) ( not ( = ?auto_888116 ?auto_888121 ) ) ( not ( = ?auto_888116 ?auto_888122 ) ) ( not ( = ?auto_888116 ?auto_888123 ) ) ( not ( = ?auto_888116 ?auto_888124 ) ) ( not ( = ?auto_888116 ?auto_888125 ) ) ( not ( = ?auto_888116 ?auto_888126 ) ) ( not ( = ?auto_888116 ?auto_888127 ) ) ( not ( = ?auto_888116 ?auto_888128 ) ) ( not ( = ?auto_888116 ?auto_888129 ) ) ( not ( = ?auto_888116 ?auto_888130 ) ) ( not ( = ?auto_888116 ?auto_888131 ) ) ( not ( = ?auto_888116 ?auto_888132 ) ) ( not ( = ?auto_888116 ?auto_888133 ) ) ( not ( = ?auto_888117 ?auto_888118 ) ) ( not ( = ?auto_888117 ?auto_888119 ) ) ( not ( = ?auto_888117 ?auto_888120 ) ) ( not ( = ?auto_888117 ?auto_888121 ) ) ( not ( = ?auto_888117 ?auto_888122 ) ) ( not ( = ?auto_888117 ?auto_888123 ) ) ( not ( = ?auto_888117 ?auto_888124 ) ) ( not ( = ?auto_888117 ?auto_888125 ) ) ( not ( = ?auto_888117 ?auto_888126 ) ) ( not ( = ?auto_888117 ?auto_888127 ) ) ( not ( = ?auto_888117 ?auto_888128 ) ) ( not ( = ?auto_888117 ?auto_888129 ) ) ( not ( = ?auto_888117 ?auto_888130 ) ) ( not ( = ?auto_888117 ?auto_888131 ) ) ( not ( = ?auto_888117 ?auto_888132 ) ) ( not ( = ?auto_888117 ?auto_888133 ) ) ( not ( = ?auto_888118 ?auto_888119 ) ) ( not ( = ?auto_888118 ?auto_888120 ) ) ( not ( = ?auto_888118 ?auto_888121 ) ) ( not ( = ?auto_888118 ?auto_888122 ) ) ( not ( = ?auto_888118 ?auto_888123 ) ) ( not ( = ?auto_888118 ?auto_888124 ) ) ( not ( = ?auto_888118 ?auto_888125 ) ) ( not ( = ?auto_888118 ?auto_888126 ) ) ( not ( = ?auto_888118 ?auto_888127 ) ) ( not ( = ?auto_888118 ?auto_888128 ) ) ( not ( = ?auto_888118 ?auto_888129 ) ) ( not ( = ?auto_888118 ?auto_888130 ) ) ( not ( = ?auto_888118 ?auto_888131 ) ) ( not ( = ?auto_888118 ?auto_888132 ) ) ( not ( = ?auto_888118 ?auto_888133 ) ) ( not ( = ?auto_888119 ?auto_888120 ) ) ( not ( = ?auto_888119 ?auto_888121 ) ) ( not ( = ?auto_888119 ?auto_888122 ) ) ( not ( = ?auto_888119 ?auto_888123 ) ) ( not ( = ?auto_888119 ?auto_888124 ) ) ( not ( = ?auto_888119 ?auto_888125 ) ) ( not ( = ?auto_888119 ?auto_888126 ) ) ( not ( = ?auto_888119 ?auto_888127 ) ) ( not ( = ?auto_888119 ?auto_888128 ) ) ( not ( = ?auto_888119 ?auto_888129 ) ) ( not ( = ?auto_888119 ?auto_888130 ) ) ( not ( = ?auto_888119 ?auto_888131 ) ) ( not ( = ?auto_888119 ?auto_888132 ) ) ( not ( = ?auto_888119 ?auto_888133 ) ) ( not ( = ?auto_888120 ?auto_888121 ) ) ( not ( = ?auto_888120 ?auto_888122 ) ) ( not ( = ?auto_888120 ?auto_888123 ) ) ( not ( = ?auto_888120 ?auto_888124 ) ) ( not ( = ?auto_888120 ?auto_888125 ) ) ( not ( = ?auto_888120 ?auto_888126 ) ) ( not ( = ?auto_888120 ?auto_888127 ) ) ( not ( = ?auto_888120 ?auto_888128 ) ) ( not ( = ?auto_888120 ?auto_888129 ) ) ( not ( = ?auto_888120 ?auto_888130 ) ) ( not ( = ?auto_888120 ?auto_888131 ) ) ( not ( = ?auto_888120 ?auto_888132 ) ) ( not ( = ?auto_888120 ?auto_888133 ) ) ( not ( = ?auto_888121 ?auto_888122 ) ) ( not ( = ?auto_888121 ?auto_888123 ) ) ( not ( = ?auto_888121 ?auto_888124 ) ) ( not ( = ?auto_888121 ?auto_888125 ) ) ( not ( = ?auto_888121 ?auto_888126 ) ) ( not ( = ?auto_888121 ?auto_888127 ) ) ( not ( = ?auto_888121 ?auto_888128 ) ) ( not ( = ?auto_888121 ?auto_888129 ) ) ( not ( = ?auto_888121 ?auto_888130 ) ) ( not ( = ?auto_888121 ?auto_888131 ) ) ( not ( = ?auto_888121 ?auto_888132 ) ) ( not ( = ?auto_888121 ?auto_888133 ) ) ( not ( = ?auto_888122 ?auto_888123 ) ) ( not ( = ?auto_888122 ?auto_888124 ) ) ( not ( = ?auto_888122 ?auto_888125 ) ) ( not ( = ?auto_888122 ?auto_888126 ) ) ( not ( = ?auto_888122 ?auto_888127 ) ) ( not ( = ?auto_888122 ?auto_888128 ) ) ( not ( = ?auto_888122 ?auto_888129 ) ) ( not ( = ?auto_888122 ?auto_888130 ) ) ( not ( = ?auto_888122 ?auto_888131 ) ) ( not ( = ?auto_888122 ?auto_888132 ) ) ( not ( = ?auto_888122 ?auto_888133 ) ) ( not ( = ?auto_888123 ?auto_888124 ) ) ( not ( = ?auto_888123 ?auto_888125 ) ) ( not ( = ?auto_888123 ?auto_888126 ) ) ( not ( = ?auto_888123 ?auto_888127 ) ) ( not ( = ?auto_888123 ?auto_888128 ) ) ( not ( = ?auto_888123 ?auto_888129 ) ) ( not ( = ?auto_888123 ?auto_888130 ) ) ( not ( = ?auto_888123 ?auto_888131 ) ) ( not ( = ?auto_888123 ?auto_888132 ) ) ( not ( = ?auto_888123 ?auto_888133 ) ) ( not ( = ?auto_888124 ?auto_888125 ) ) ( not ( = ?auto_888124 ?auto_888126 ) ) ( not ( = ?auto_888124 ?auto_888127 ) ) ( not ( = ?auto_888124 ?auto_888128 ) ) ( not ( = ?auto_888124 ?auto_888129 ) ) ( not ( = ?auto_888124 ?auto_888130 ) ) ( not ( = ?auto_888124 ?auto_888131 ) ) ( not ( = ?auto_888124 ?auto_888132 ) ) ( not ( = ?auto_888124 ?auto_888133 ) ) ( not ( = ?auto_888125 ?auto_888126 ) ) ( not ( = ?auto_888125 ?auto_888127 ) ) ( not ( = ?auto_888125 ?auto_888128 ) ) ( not ( = ?auto_888125 ?auto_888129 ) ) ( not ( = ?auto_888125 ?auto_888130 ) ) ( not ( = ?auto_888125 ?auto_888131 ) ) ( not ( = ?auto_888125 ?auto_888132 ) ) ( not ( = ?auto_888125 ?auto_888133 ) ) ( not ( = ?auto_888126 ?auto_888127 ) ) ( not ( = ?auto_888126 ?auto_888128 ) ) ( not ( = ?auto_888126 ?auto_888129 ) ) ( not ( = ?auto_888126 ?auto_888130 ) ) ( not ( = ?auto_888126 ?auto_888131 ) ) ( not ( = ?auto_888126 ?auto_888132 ) ) ( not ( = ?auto_888126 ?auto_888133 ) ) ( not ( = ?auto_888127 ?auto_888128 ) ) ( not ( = ?auto_888127 ?auto_888129 ) ) ( not ( = ?auto_888127 ?auto_888130 ) ) ( not ( = ?auto_888127 ?auto_888131 ) ) ( not ( = ?auto_888127 ?auto_888132 ) ) ( not ( = ?auto_888127 ?auto_888133 ) ) ( not ( = ?auto_888128 ?auto_888129 ) ) ( not ( = ?auto_888128 ?auto_888130 ) ) ( not ( = ?auto_888128 ?auto_888131 ) ) ( not ( = ?auto_888128 ?auto_888132 ) ) ( not ( = ?auto_888128 ?auto_888133 ) ) ( not ( = ?auto_888129 ?auto_888130 ) ) ( not ( = ?auto_888129 ?auto_888131 ) ) ( not ( = ?auto_888129 ?auto_888132 ) ) ( not ( = ?auto_888129 ?auto_888133 ) ) ( not ( = ?auto_888130 ?auto_888131 ) ) ( not ( = ?auto_888130 ?auto_888132 ) ) ( not ( = ?auto_888130 ?auto_888133 ) ) ( not ( = ?auto_888131 ?auto_888132 ) ) ( not ( = ?auto_888131 ?auto_888133 ) ) ( not ( = ?auto_888132 ?auto_888133 ) ) ( ON ?auto_888131 ?auto_888132 ) ( ON ?auto_888130 ?auto_888131 ) ( CLEAR ?auto_888128 ) ( ON ?auto_888129 ?auto_888130 ) ( CLEAR ?auto_888129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_888115 ?auto_888116 ?auto_888117 ?auto_888118 ?auto_888119 ?auto_888120 ?auto_888121 ?auto_888122 ?auto_888123 ?auto_888124 ?auto_888125 ?auto_888126 ?auto_888127 ?auto_888128 ?auto_888129 )
      ( MAKE-18PILE ?auto_888115 ?auto_888116 ?auto_888117 ?auto_888118 ?auto_888119 ?auto_888120 ?auto_888121 ?auto_888122 ?auto_888123 ?auto_888124 ?auto_888125 ?auto_888126 ?auto_888127 ?auto_888128 ?auto_888129 ?auto_888130 ?auto_888131 ?auto_888132 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888152 - BLOCK
      ?auto_888153 - BLOCK
      ?auto_888154 - BLOCK
      ?auto_888155 - BLOCK
      ?auto_888156 - BLOCK
      ?auto_888157 - BLOCK
      ?auto_888158 - BLOCK
      ?auto_888159 - BLOCK
      ?auto_888160 - BLOCK
      ?auto_888161 - BLOCK
      ?auto_888162 - BLOCK
      ?auto_888163 - BLOCK
      ?auto_888164 - BLOCK
      ?auto_888165 - BLOCK
      ?auto_888166 - BLOCK
      ?auto_888167 - BLOCK
      ?auto_888168 - BLOCK
      ?auto_888169 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_888169 ) ( ON-TABLE ?auto_888152 ) ( ON ?auto_888153 ?auto_888152 ) ( ON ?auto_888154 ?auto_888153 ) ( ON ?auto_888155 ?auto_888154 ) ( ON ?auto_888156 ?auto_888155 ) ( ON ?auto_888157 ?auto_888156 ) ( ON ?auto_888158 ?auto_888157 ) ( ON ?auto_888159 ?auto_888158 ) ( ON ?auto_888160 ?auto_888159 ) ( ON ?auto_888161 ?auto_888160 ) ( ON ?auto_888162 ?auto_888161 ) ( ON ?auto_888163 ?auto_888162 ) ( ON ?auto_888164 ?auto_888163 ) ( ON ?auto_888165 ?auto_888164 ) ( not ( = ?auto_888152 ?auto_888153 ) ) ( not ( = ?auto_888152 ?auto_888154 ) ) ( not ( = ?auto_888152 ?auto_888155 ) ) ( not ( = ?auto_888152 ?auto_888156 ) ) ( not ( = ?auto_888152 ?auto_888157 ) ) ( not ( = ?auto_888152 ?auto_888158 ) ) ( not ( = ?auto_888152 ?auto_888159 ) ) ( not ( = ?auto_888152 ?auto_888160 ) ) ( not ( = ?auto_888152 ?auto_888161 ) ) ( not ( = ?auto_888152 ?auto_888162 ) ) ( not ( = ?auto_888152 ?auto_888163 ) ) ( not ( = ?auto_888152 ?auto_888164 ) ) ( not ( = ?auto_888152 ?auto_888165 ) ) ( not ( = ?auto_888152 ?auto_888166 ) ) ( not ( = ?auto_888152 ?auto_888167 ) ) ( not ( = ?auto_888152 ?auto_888168 ) ) ( not ( = ?auto_888152 ?auto_888169 ) ) ( not ( = ?auto_888153 ?auto_888154 ) ) ( not ( = ?auto_888153 ?auto_888155 ) ) ( not ( = ?auto_888153 ?auto_888156 ) ) ( not ( = ?auto_888153 ?auto_888157 ) ) ( not ( = ?auto_888153 ?auto_888158 ) ) ( not ( = ?auto_888153 ?auto_888159 ) ) ( not ( = ?auto_888153 ?auto_888160 ) ) ( not ( = ?auto_888153 ?auto_888161 ) ) ( not ( = ?auto_888153 ?auto_888162 ) ) ( not ( = ?auto_888153 ?auto_888163 ) ) ( not ( = ?auto_888153 ?auto_888164 ) ) ( not ( = ?auto_888153 ?auto_888165 ) ) ( not ( = ?auto_888153 ?auto_888166 ) ) ( not ( = ?auto_888153 ?auto_888167 ) ) ( not ( = ?auto_888153 ?auto_888168 ) ) ( not ( = ?auto_888153 ?auto_888169 ) ) ( not ( = ?auto_888154 ?auto_888155 ) ) ( not ( = ?auto_888154 ?auto_888156 ) ) ( not ( = ?auto_888154 ?auto_888157 ) ) ( not ( = ?auto_888154 ?auto_888158 ) ) ( not ( = ?auto_888154 ?auto_888159 ) ) ( not ( = ?auto_888154 ?auto_888160 ) ) ( not ( = ?auto_888154 ?auto_888161 ) ) ( not ( = ?auto_888154 ?auto_888162 ) ) ( not ( = ?auto_888154 ?auto_888163 ) ) ( not ( = ?auto_888154 ?auto_888164 ) ) ( not ( = ?auto_888154 ?auto_888165 ) ) ( not ( = ?auto_888154 ?auto_888166 ) ) ( not ( = ?auto_888154 ?auto_888167 ) ) ( not ( = ?auto_888154 ?auto_888168 ) ) ( not ( = ?auto_888154 ?auto_888169 ) ) ( not ( = ?auto_888155 ?auto_888156 ) ) ( not ( = ?auto_888155 ?auto_888157 ) ) ( not ( = ?auto_888155 ?auto_888158 ) ) ( not ( = ?auto_888155 ?auto_888159 ) ) ( not ( = ?auto_888155 ?auto_888160 ) ) ( not ( = ?auto_888155 ?auto_888161 ) ) ( not ( = ?auto_888155 ?auto_888162 ) ) ( not ( = ?auto_888155 ?auto_888163 ) ) ( not ( = ?auto_888155 ?auto_888164 ) ) ( not ( = ?auto_888155 ?auto_888165 ) ) ( not ( = ?auto_888155 ?auto_888166 ) ) ( not ( = ?auto_888155 ?auto_888167 ) ) ( not ( = ?auto_888155 ?auto_888168 ) ) ( not ( = ?auto_888155 ?auto_888169 ) ) ( not ( = ?auto_888156 ?auto_888157 ) ) ( not ( = ?auto_888156 ?auto_888158 ) ) ( not ( = ?auto_888156 ?auto_888159 ) ) ( not ( = ?auto_888156 ?auto_888160 ) ) ( not ( = ?auto_888156 ?auto_888161 ) ) ( not ( = ?auto_888156 ?auto_888162 ) ) ( not ( = ?auto_888156 ?auto_888163 ) ) ( not ( = ?auto_888156 ?auto_888164 ) ) ( not ( = ?auto_888156 ?auto_888165 ) ) ( not ( = ?auto_888156 ?auto_888166 ) ) ( not ( = ?auto_888156 ?auto_888167 ) ) ( not ( = ?auto_888156 ?auto_888168 ) ) ( not ( = ?auto_888156 ?auto_888169 ) ) ( not ( = ?auto_888157 ?auto_888158 ) ) ( not ( = ?auto_888157 ?auto_888159 ) ) ( not ( = ?auto_888157 ?auto_888160 ) ) ( not ( = ?auto_888157 ?auto_888161 ) ) ( not ( = ?auto_888157 ?auto_888162 ) ) ( not ( = ?auto_888157 ?auto_888163 ) ) ( not ( = ?auto_888157 ?auto_888164 ) ) ( not ( = ?auto_888157 ?auto_888165 ) ) ( not ( = ?auto_888157 ?auto_888166 ) ) ( not ( = ?auto_888157 ?auto_888167 ) ) ( not ( = ?auto_888157 ?auto_888168 ) ) ( not ( = ?auto_888157 ?auto_888169 ) ) ( not ( = ?auto_888158 ?auto_888159 ) ) ( not ( = ?auto_888158 ?auto_888160 ) ) ( not ( = ?auto_888158 ?auto_888161 ) ) ( not ( = ?auto_888158 ?auto_888162 ) ) ( not ( = ?auto_888158 ?auto_888163 ) ) ( not ( = ?auto_888158 ?auto_888164 ) ) ( not ( = ?auto_888158 ?auto_888165 ) ) ( not ( = ?auto_888158 ?auto_888166 ) ) ( not ( = ?auto_888158 ?auto_888167 ) ) ( not ( = ?auto_888158 ?auto_888168 ) ) ( not ( = ?auto_888158 ?auto_888169 ) ) ( not ( = ?auto_888159 ?auto_888160 ) ) ( not ( = ?auto_888159 ?auto_888161 ) ) ( not ( = ?auto_888159 ?auto_888162 ) ) ( not ( = ?auto_888159 ?auto_888163 ) ) ( not ( = ?auto_888159 ?auto_888164 ) ) ( not ( = ?auto_888159 ?auto_888165 ) ) ( not ( = ?auto_888159 ?auto_888166 ) ) ( not ( = ?auto_888159 ?auto_888167 ) ) ( not ( = ?auto_888159 ?auto_888168 ) ) ( not ( = ?auto_888159 ?auto_888169 ) ) ( not ( = ?auto_888160 ?auto_888161 ) ) ( not ( = ?auto_888160 ?auto_888162 ) ) ( not ( = ?auto_888160 ?auto_888163 ) ) ( not ( = ?auto_888160 ?auto_888164 ) ) ( not ( = ?auto_888160 ?auto_888165 ) ) ( not ( = ?auto_888160 ?auto_888166 ) ) ( not ( = ?auto_888160 ?auto_888167 ) ) ( not ( = ?auto_888160 ?auto_888168 ) ) ( not ( = ?auto_888160 ?auto_888169 ) ) ( not ( = ?auto_888161 ?auto_888162 ) ) ( not ( = ?auto_888161 ?auto_888163 ) ) ( not ( = ?auto_888161 ?auto_888164 ) ) ( not ( = ?auto_888161 ?auto_888165 ) ) ( not ( = ?auto_888161 ?auto_888166 ) ) ( not ( = ?auto_888161 ?auto_888167 ) ) ( not ( = ?auto_888161 ?auto_888168 ) ) ( not ( = ?auto_888161 ?auto_888169 ) ) ( not ( = ?auto_888162 ?auto_888163 ) ) ( not ( = ?auto_888162 ?auto_888164 ) ) ( not ( = ?auto_888162 ?auto_888165 ) ) ( not ( = ?auto_888162 ?auto_888166 ) ) ( not ( = ?auto_888162 ?auto_888167 ) ) ( not ( = ?auto_888162 ?auto_888168 ) ) ( not ( = ?auto_888162 ?auto_888169 ) ) ( not ( = ?auto_888163 ?auto_888164 ) ) ( not ( = ?auto_888163 ?auto_888165 ) ) ( not ( = ?auto_888163 ?auto_888166 ) ) ( not ( = ?auto_888163 ?auto_888167 ) ) ( not ( = ?auto_888163 ?auto_888168 ) ) ( not ( = ?auto_888163 ?auto_888169 ) ) ( not ( = ?auto_888164 ?auto_888165 ) ) ( not ( = ?auto_888164 ?auto_888166 ) ) ( not ( = ?auto_888164 ?auto_888167 ) ) ( not ( = ?auto_888164 ?auto_888168 ) ) ( not ( = ?auto_888164 ?auto_888169 ) ) ( not ( = ?auto_888165 ?auto_888166 ) ) ( not ( = ?auto_888165 ?auto_888167 ) ) ( not ( = ?auto_888165 ?auto_888168 ) ) ( not ( = ?auto_888165 ?auto_888169 ) ) ( not ( = ?auto_888166 ?auto_888167 ) ) ( not ( = ?auto_888166 ?auto_888168 ) ) ( not ( = ?auto_888166 ?auto_888169 ) ) ( not ( = ?auto_888167 ?auto_888168 ) ) ( not ( = ?auto_888167 ?auto_888169 ) ) ( not ( = ?auto_888168 ?auto_888169 ) ) ( ON ?auto_888168 ?auto_888169 ) ( ON ?auto_888167 ?auto_888168 ) ( CLEAR ?auto_888165 ) ( ON ?auto_888166 ?auto_888167 ) ( CLEAR ?auto_888166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_888152 ?auto_888153 ?auto_888154 ?auto_888155 ?auto_888156 ?auto_888157 ?auto_888158 ?auto_888159 ?auto_888160 ?auto_888161 ?auto_888162 ?auto_888163 ?auto_888164 ?auto_888165 ?auto_888166 )
      ( MAKE-18PILE ?auto_888152 ?auto_888153 ?auto_888154 ?auto_888155 ?auto_888156 ?auto_888157 ?auto_888158 ?auto_888159 ?auto_888160 ?auto_888161 ?auto_888162 ?auto_888163 ?auto_888164 ?auto_888165 ?auto_888166 ?auto_888167 ?auto_888168 ?auto_888169 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888188 - BLOCK
      ?auto_888189 - BLOCK
      ?auto_888190 - BLOCK
      ?auto_888191 - BLOCK
      ?auto_888192 - BLOCK
      ?auto_888193 - BLOCK
      ?auto_888194 - BLOCK
      ?auto_888195 - BLOCK
      ?auto_888196 - BLOCK
      ?auto_888197 - BLOCK
      ?auto_888198 - BLOCK
      ?auto_888199 - BLOCK
      ?auto_888200 - BLOCK
      ?auto_888201 - BLOCK
      ?auto_888202 - BLOCK
      ?auto_888203 - BLOCK
      ?auto_888204 - BLOCK
      ?auto_888205 - BLOCK
    )
    :vars
    (
      ?auto_888206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_888205 ?auto_888206 ) ( ON-TABLE ?auto_888188 ) ( ON ?auto_888189 ?auto_888188 ) ( ON ?auto_888190 ?auto_888189 ) ( ON ?auto_888191 ?auto_888190 ) ( ON ?auto_888192 ?auto_888191 ) ( ON ?auto_888193 ?auto_888192 ) ( ON ?auto_888194 ?auto_888193 ) ( ON ?auto_888195 ?auto_888194 ) ( ON ?auto_888196 ?auto_888195 ) ( ON ?auto_888197 ?auto_888196 ) ( ON ?auto_888198 ?auto_888197 ) ( ON ?auto_888199 ?auto_888198 ) ( ON ?auto_888200 ?auto_888199 ) ( not ( = ?auto_888188 ?auto_888189 ) ) ( not ( = ?auto_888188 ?auto_888190 ) ) ( not ( = ?auto_888188 ?auto_888191 ) ) ( not ( = ?auto_888188 ?auto_888192 ) ) ( not ( = ?auto_888188 ?auto_888193 ) ) ( not ( = ?auto_888188 ?auto_888194 ) ) ( not ( = ?auto_888188 ?auto_888195 ) ) ( not ( = ?auto_888188 ?auto_888196 ) ) ( not ( = ?auto_888188 ?auto_888197 ) ) ( not ( = ?auto_888188 ?auto_888198 ) ) ( not ( = ?auto_888188 ?auto_888199 ) ) ( not ( = ?auto_888188 ?auto_888200 ) ) ( not ( = ?auto_888188 ?auto_888201 ) ) ( not ( = ?auto_888188 ?auto_888202 ) ) ( not ( = ?auto_888188 ?auto_888203 ) ) ( not ( = ?auto_888188 ?auto_888204 ) ) ( not ( = ?auto_888188 ?auto_888205 ) ) ( not ( = ?auto_888188 ?auto_888206 ) ) ( not ( = ?auto_888189 ?auto_888190 ) ) ( not ( = ?auto_888189 ?auto_888191 ) ) ( not ( = ?auto_888189 ?auto_888192 ) ) ( not ( = ?auto_888189 ?auto_888193 ) ) ( not ( = ?auto_888189 ?auto_888194 ) ) ( not ( = ?auto_888189 ?auto_888195 ) ) ( not ( = ?auto_888189 ?auto_888196 ) ) ( not ( = ?auto_888189 ?auto_888197 ) ) ( not ( = ?auto_888189 ?auto_888198 ) ) ( not ( = ?auto_888189 ?auto_888199 ) ) ( not ( = ?auto_888189 ?auto_888200 ) ) ( not ( = ?auto_888189 ?auto_888201 ) ) ( not ( = ?auto_888189 ?auto_888202 ) ) ( not ( = ?auto_888189 ?auto_888203 ) ) ( not ( = ?auto_888189 ?auto_888204 ) ) ( not ( = ?auto_888189 ?auto_888205 ) ) ( not ( = ?auto_888189 ?auto_888206 ) ) ( not ( = ?auto_888190 ?auto_888191 ) ) ( not ( = ?auto_888190 ?auto_888192 ) ) ( not ( = ?auto_888190 ?auto_888193 ) ) ( not ( = ?auto_888190 ?auto_888194 ) ) ( not ( = ?auto_888190 ?auto_888195 ) ) ( not ( = ?auto_888190 ?auto_888196 ) ) ( not ( = ?auto_888190 ?auto_888197 ) ) ( not ( = ?auto_888190 ?auto_888198 ) ) ( not ( = ?auto_888190 ?auto_888199 ) ) ( not ( = ?auto_888190 ?auto_888200 ) ) ( not ( = ?auto_888190 ?auto_888201 ) ) ( not ( = ?auto_888190 ?auto_888202 ) ) ( not ( = ?auto_888190 ?auto_888203 ) ) ( not ( = ?auto_888190 ?auto_888204 ) ) ( not ( = ?auto_888190 ?auto_888205 ) ) ( not ( = ?auto_888190 ?auto_888206 ) ) ( not ( = ?auto_888191 ?auto_888192 ) ) ( not ( = ?auto_888191 ?auto_888193 ) ) ( not ( = ?auto_888191 ?auto_888194 ) ) ( not ( = ?auto_888191 ?auto_888195 ) ) ( not ( = ?auto_888191 ?auto_888196 ) ) ( not ( = ?auto_888191 ?auto_888197 ) ) ( not ( = ?auto_888191 ?auto_888198 ) ) ( not ( = ?auto_888191 ?auto_888199 ) ) ( not ( = ?auto_888191 ?auto_888200 ) ) ( not ( = ?auto_888191 ?auto_888201 ) ) ( not ( = ?auto_888191 ?auto_888202 ) ) ( not ( = ?auto_888191 ?auto_888203 ) ) ( not ( = ?auto_888191 ?auto_888204 ) ) ( not ( = ?auto_888191 ?auto_888205 ) ) ( not ( = ?auto_888191 ?auto_888206 ) ) ( not ( = ?auto_888192 ?auto_888193 ) ) ( not ( = ?auto_888192 ?auto_888194 ) ) ( not ( = ?auto_888192 ?auto_888195 ) ) ( not ( = ?auto_888192 ?auto_888196 ) ) ( not ( = ?auto_888192 ?auto_888197 ) ) ( not ( = ?auto_888192 ?auto_888198 ) ) ( not ( = ?auto_888192 ?auto_888199 ) ) ( not ( = ?auto_888192 ?auto_888200 ) ) ( not ( = ?auto_888192 ?auto_888201 ) ) ( not ( = ?auto_888192 ?auto_888202 ) ) ( not ( = ?auto_888192 ?auto_888203 ) ) ( not ( = ?auto_888192 ?auto_888204 ) ) ( not ( = ?auto_888192 ?auto_888205 ) ) ( not ( = ?auto_888192 ?auto_888206 ) ) ( not ( = ?auto_888193 ?auto_888194 ) ) ( not ( = ?auto_888193 ?auto_888195 ) ) ( not ( = ?auto_888193 ?auto_888196 ) ) ( not ( = ?auto_888193 ?auto_888197 ) ) ( not ( = ?auto_888193 ?auto_888198 ) ) ( not ( = ?auto_888193 ?auto_888199 ) ) ( not ( = ?auto_888193 ?auto_888200 ) ) ( not ( = ?auto_888193 ?auto_888201 ) ) ( not ( = ?auto_888193 ?auto_888202 ) ) ( not ( = ?auto_888193 ?auto_888203 ) ) ( not ( = ?auto_888193 ?auto_888204 ) ) ( not ( = ?auto_888193 ?auto_888205 ) ) ( not ( = ?auto_888193 ?auto_888206 ) ) ( not ( = ?auto_888194 ?auto_888195 ) ) ( not ( = ?auto_888194 ?auto_888196 ) ) ( not ( = ?auto_888194 ?auto_888197 ) ) ( not ( = ?auto_888194 ?auto_888198 ) ) ( not ( = ?auto_888194 ?auto_888199 ) ) ( not ( = ?auto_888194 ?auto_888200 ) ) ( not ( = ?auto_888194 ?auto_888201 ) ) ( not ( = ?auto_888194 ?auto_888202 ) ) ( not ( = ?auto_888194 ?auto_888203 ) ) ( not ( = ?auto_888194 ?auto_888204 ) ) ( not ( = ?auto_888194 ?auto_888205 ) ) ( not ( = ?auto_888194 ?auto_888206 ) ) ( not ( = ?auto_888195 ?auto_888196 ) ) ( not ( = ?auto_888195 ?auto_888197 ) ) ( not ( = ?auto_888195 ?auto_888198 ) ) ( not ( = ?auto_888195 ?auto_888199 ) ) ( not ( = ?auto_888195 ?auto_888200 ) ) ( not ( = ?auto_888195 ?auto_888201 ) ) ( not ( = ?auto_888195 ?auto_888202 ) ) ( not ( = ?auto_888195 ?auto_888203 ) ) ( not ( = ?auto_888195 ?auto_888204 ) ) ( not ( = ?auto_888195 ?auto_888205 ) ) ( not ( = ?auto_888195 ?auto_888206 ) ) ( not ( = ?auto_888196 ?auto_888197 ) ) ( not ( = ?auto_888196 ?auto_888198 ) ) ( not ( = ?auto_888196 ?auto_888199 ) ) ( not ( = ?auto_888196 ?auto_888200 ) ) ( not ( = ?auto_888196 ?auto_888201 ) ) ( not ( = ?auto_888196 ?auto_888202 ) ) ( not ( = ?auto_888196 ?auto_888203 ) ) ( not ( = ?auto_888196 ?auto_888204 ) ) ( not ( = ?auto_888196 ?auto_888205 ) ) ( not ( = ?auto_888196 ?auto_888206 ) ) ( not ( = ?auto_888197 ?auto_888198 ) ) ( not ( = ?auto_888197 ?auto_888199 ) ) ( not ( = ?auto_888197 ?auto_888200 ) ) ( not ( = ?auto_888197 ?auto_888201 ) ) ( not ( = ?auto_888197 ?auto_888202 ) ) ( not ( = ?auto_888197 ?auto_888203 ) ) ( not ( = ?auto_888197 ?auto_888204 ) ) ( not ( = ?auto_888197 ?auto_888205 ) ) ( not ( = ?auto_888197 ?auto_888206 ) ) ( not ( = ?auto_888198 ?auto_888199 ) ) ( not ( = ?auto_888198 ?auto_888200 ) ) ( not ( = ?auto_888198 ?auto_888201 ) ) ( not ( = ?auto_888198 ?auto_888202 ) ) ( not ( = ?auto_888198 ?auto_888203 ) ) ( not ( = ?auto_888198 ?auto_888204 ) ) ( not ( = ?auto_888198 ?auto_888205 ) ) ( not ( = ?auto_888198 ?auto_888206 ) ) ( not ( = ?auto_888199 ?auto_888200 ) ) ( not ( = ?auto_888199 ?auto_888201 ) ) ( not ( = ?auto_888199 ?auto_888202 ) ) ( not ( = ?auto_888199 ?auto_888203 ) ) ( not ( = ?auto_888199 ?auto_888204 ) ) ( not ( = ?auto_888199 ?auto_888205 ) ) ( not ( = ?auto_888199 ?auto_888206 ) ) ( not ( = ?auto_888200 ?auto_888201 ) ) ( not ( = ?auto_888200 ?auto_888202 ) ) ( not ( = ?auto_888200 ?auto_888203 ) ) ( not ( = ?auto_888200 ?auto_888204 ) ) ( not ( = ?auto_888200 ?auto_888205 ) ) ( not ( = ?auto_888200 ?auto_888206 ) ) ( not ( = ?auto_888201 ?auto_888202 ) ) ( not ( = ?auto_888201 ?auto_888203 ) ) ( not ( = ?auto_888201 ?auto_888204 ) ) ( not ( = ?auto_888201 ?auto_888205 ) ) ( not ( = ?auto_888201 ?auto_888206 ) ) ( not ( = ?auto_888202 ?auto_888203 ) ) ( not ( = ?auto_888202 ?auto_888204 ) ) ( not ( = ?auto_888202 ?auto_888205 ) ) ( not ( = ?auto_888202 ?auto_888206 ) ) ( not ( = ?auto_888203 ?auto_888204 ) ) ( not ( = ?auto_888203 ?auto_888205 ) ) ( not ( = ?auto_888203 ?auto_888206 ) ) ( not ( = ?auto_888204 ?auto_888205 ) ) ( not ( = ?auto_888204 ?auto_888206 ) ) ( not ( = ?auto_888205 ?auto_888206 ) ) ( ON ?auto_888204 ?auto_888205 ) ( ON ?auto_888203 ?auto_888204 ) ( ON ?auto_888202 ?auto_888203 ) ( CLEAR ?auto_888200 ) ( ON ?auto_888201 ?auto_888202 ) ( CLEAR ?auto_888201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_888188 ?auto_888189 ?auto_888190 ?auto_888191 ?auto_888192 ?auto_888193 ?auto_888194 ?auto_888195 ?auto_888196 ?auto_888197 ?auto_888198 ?auto_888199 ?auto_888200 ?auto_888201 )
      ( MAKE-18PILE ?auto_888188 ?auto_888189 ?auto_888190 ?auto_888191 ?auto_888192 ?auto_888193 ?auto_888194 ?auto_888195 ?auto_888196 ?auto_888197 ?auto_888198 ?auto_888199 ?auto_888200 ?auto_888201 ?auto_888202 ?auto_888203 ?auto_888204 ?auto_888205 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888225 - BLOCK
      ?auto_888226 - BLOCK
      ?auto_888227 - BLOCK
      ?auto_888228 - BLOCK
      ?auto_888229 - BLOCK
      ?auto_888230 - BLOCK
      ?auto_888231 - BLOCK
      ?auto_888232 - BLOCK
      ?auto_888233 - BLOCK
      ?auto_888234 - BLOCK
      ?auto_888235 - BLOCK
      ?auto_888236 - BLOCK
      ?auto_888237 - BLOCK
      ?auto_888238 - BLOCK
      ?auto_888239 - BLOCK
      ?auto_888240 - BLOCK
      ?auto_888241 - BLOCK
      ?auto_888242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_888242 ) ( ON-TABLE ?auto_888225 ) ( ON ?auto_888226 ?auto_888225 ) ( ON ?auto_888227 ?auto_888226 ) ( ON ?auto_888228 ?auto_888227 ) ( ON ?auto_888229 ?auto_888228 ) ( ON ?auto_888230 ?auto_888229 ) ( ON ?auto_888231 ?auto_888230 ) ( ON ?auto_888232 ?auto_888231 ) ( ON ?auto_888233 ?auto_888232 ) ( ON ?auto_888234 ?auto_888233 ) ( ON ?auto_888235 ?auto_888234 ) ( ON ?auto_888236 ?auto_888235 ) ( ON ?auto_888237 ?auto_888236 ) ( not ( = ?auto_888225 ?auto_888226 ) ) ( not ( = ?auto_888225 ?auto_888227 ) ) ( not ( = ?auto_888225 ?auto_888228 ) ) ( not ( = ?auto_888225 ?auto_888229 ) ) ( not ( = ?auto_888225 ?auto_888230 ) ) ( not ( = ?auto_888225 ?auto_888231 ) ) ( not ( = ?auto_888225 ?auto_888232 ) ) ( not ( = ?auto_888225 ?auto_888233 ) ) ( not ( = ?auto_888225 ?auto_888234 ) ) ( not ( = ?auto_888225 ?auto_888235 ) ) ( not ( = ?auto_888225 ?auto_888236 ) ) ( not ( = ?auto_888225 ?auto_888237 ) ) ( not ( = ?auto_888225 ?auto_888238 ) ) ( not ( = ?auto_888225 ?auto_888239 ) ) ( not ( = ?auto_888225 ?auto_888240 ) ) ( not ( = ?auto_888225 ?auto_888241 ) ) ( not ( = ?auto_888225 ?auto_888242 ) ) ( not ( = ?auto_888226 ?auto_888227 ) ) ( not ( = ?auto_888226 ?auto_888228 ) ) ( not ( = ?auto_888226 ?auto_888229 ) ) ( not ( = ?auto_888226 ?auto_888230 ) ) ( not ( = ?auto_888226 ?auto_888231 ) ) ( not ( = ?auto_888226 ?auto_888232 ) ) ( not ( = ?auto_888226 ?auto_888233 ) ) ( not ( = ?auto_888226 ?auto_888234 ) ) ( not ( = ?auto_888226 ?auto_888235 ) ) ( not ( = ?auto_888226 ?auto_888236 ) ) ( not ( = ?auto_888226 ?auto_888237 ) ) ( not ( = ?auto_888226 ?auto_888238 ) ) ( not ( = ?auto_888226 ?auto_888239 ) ) ( not ( = ?auto_888226 ?auto_888240 ) ) ( not ( = ?auto_888226 ?auto_888241 ) ) ( not ( = ?auto_888226 ?auto_888242 ) ) ( not ( = ?auto_888227 ?auto_888228 ) ) ( not ( = ?auto_888227 ?auto_888229 ) ) ( not ( = ?auto_888227 ?auto_888230 ) ) ( not ( = ?auto_888227 ?auto_888231 ) ) ( not ( = ?auto_888227 ?auto_888232 ) ) ( not ( = ?auto_888227 ?auto_888233 ) ) ( not ( = ?auto_888227 ?auto_888234 ) ) ( not ( = ?auto_888227 ?auto_888235 ) ) ( not ( = ?auto_888227 ?auto_888236 ) ) ( not ( = ?auto_888227 ?auto_888237 ) ) ( not ( = ?auto_888227 ?auto_888238 ) ) ( not ( = ?auto_888227 ?auto_888239 ) ) ( not ( = ?auto_888227 ?auto_888240 ) ) ( not ( = ?auto_888227 ?auto_888241 ) ) ( not ( = ?auto_888227 ?auto_888242 ) ) ( not ( = ?auto_888228 ?auto_888229 ) ) ( not ( = ?auto_888228 ?auto_888230 ) ) ( not ( = ?auto_888228 ?auto_888231 ) ) ( not ( = ?auto_888228 ?auto_888232 ) ) ( not ( = ?auto_888228 ?auto_888233 ) ) ( not ( = ?auto_888228 ?auto_888234 ) ) ( not ( = ?auto_888228 ?auto_888235 ) ) ( not ( = ?auto_888228 ?auto_888236 ) ) ( not ( = ?auto_888228 ?auto_888237 ) ) ( not ( = ?auto_888228 ?auto_888238 ) ) ( not ( = ?auto_888228 ?auto_888239 ) ) ( not ( = ?auto_888228 ?auto_888240 ) ) ( not ( = ?auto_888228 ?auto_888241 ) ) ( not ( = ?auto_888228 ?auto_888242 ) ) ( not ( = ?auto_888229 ?auto_888230 ) ) ( not ( = ?auto_888229 ?auto_888231 ) ) ( not ( = ?auto_888229 ?auto_888232 ) ) ( not ( = ?auto_888229 ?auto_888233 ) ) ( not ( = ?auto_888229 ?auto_888234 ) ) ( not ( = ?auto_888229 ?auto_888235 ) ) ( not ( = ?auto_888229 ?auto_888236 ) ) ( not ( = ?auto_888229 ?auto_888237 ) ) ( not ( = ?auto_888229 ?auto_888238 ) ) ( not ( = ?auto_888229 ?auto_888239 ) ) ( not ( = ?auto_888229 ?auto_888240 ) ) ( not ( = ?auto_888229 ?auto_888241 ) ) ( not ( = ?auto_888229 ?auto_888242 ) ) ( not ( = ?auto_888230 ?auto_888231 ) ) ( not ( = ?auto_888230 ?auto_888232 ) ) ( not ( = ?auto_888230 ?auto_888233 ) ) ( not ( = ?auto_888230 ?auto_888234 ) ) ( not ( = ?auto_888230 ?auto_888235 ) ) ( not ( = ?auto_888230 ?auto_888236 ) ) ( not ( = ?auto_888230 ?auto_888237 ) ) ( not ( = ?auto_888230 ?auto_888238 ) ) ( not ( = ?auto_888230 ?auto_888239 ) ) ( not ( = ?auto_888230 ?auto_888240 ) ) ( not ( = ?auto_888230 ?auto_888241 ) ) ( not ( = ?auto_888230 ?auto_888242 ) ) ( not ( = ?auto_888231 ?auto_888232 ) ) ( not ( = ?auto_888231 ?auto_888233 ) ) ( not ( = ?auto_888231 ?auto_888234 ) ) ( not ( = ?auto_888231 ?auto_888235 ) ) ( not ( = ?auto_888231 ?auto_888236 ) ) ( not ( = ?auto_888231 ?auto_888237 ) ) ( not ( = ?auto_888231 ?auto_888238 ) ) ( not ( = ?auto_888231 ?auto_888239 ) ) ( not ( = ?auto_888231 ?auto_888240 ) ) ( not ( = ?auto_888231 ?auto_888241 ) ) ( not ( = ?auto_888231 ?auto_888242 ) ) ( not ( = ?auto_888232 ?auto_888233 ) ) ( not ( = ?auto_888232 ?auto_888234 ) ) ( not ( = ?auto_888232 ?auto_888235 ) ) ( not ( = ?auto_888232 ?auto_888236 ) ) ( not ( = ?auto_888232 ?auto_888237 ) ) ( not ( = ?auto_888232 ?auto_888238 ) ) ( not ( = ?auto_888232 ?auto_888239 ) ) ( not ( = ?auto_888232 ?auto_888240 ) ) ( not ( = ?auto_888232 ?auto_888241 ) ) ( not ( = ?auto_888232 ?auto_888242 ) ) ( not ( = ?auto_888233 ?auto_888234 ) ) ( not ( = ?auto_888233 ?auto_888235 ) ) ( not ( = ?auto_888233 ?auto_888236 ) ) ( not ( = ?auto_888233 ?auto_888237 ) ) ( not ( = ?auto_888233 ?auto_888238 ) ) ( not ( = ?auto_888233 ?auto_888239 ) ) ( not ( = ?auto_888233 ?auto_888240 ) ) ( not ( = ?auto_888233 ?auto_888241 ) ) ( not ( = ?auto_888233 ?auto_888242 ) ) ( not ( = ?auto_888234 ?auto_888235 ) ) ( not ( = ?auto_888234 ?auto_888236 ) ) ( not ( = ?auto_888234 ?auto_888237 ) ) ( not ( = ?auto_888234 ?auto_888238 ) ) ( not ( = ?auto_888234 ?auto_888239 ) ) ( not ( = ?auto_888234 ?auto_888240 ) ) ( not ( = ?auto_888234 ?auto_888241 ) ) ( not ( = ?auto_888234 ?auto_888242 ) ) ( not ( = ?auto_888235 ?auto_888236 ) ) ( not ( = ?auto_888235 ?auto_888237 ) ) ( not ( = ?auto_888235 ?auto_888238 ) ) ( not ( = ?auto_888235 ?auto_888239 ) ) ( not ( = ?auto_888235 ?auto_888240 ) ) ( not ( = ?auto_888235 ?auto_888241 ) ) ( not ( = ?auto_888235 ?auto_888242 ) ) ( not ( = ?auto_888236 ?auto_888237 ) ) ( not ( = ?auto_888236 ?auto_888238 ) ) ( not ( = ?auto_888236 ?auto_888239 ) ) ( not ( = ?auto_888236 ?auto_888240 ) ) ( not ( = ?auto_888236 ?auto_888241 ) ) ( not ( = ?auto_888236 ?auto_888242 ) ) ( not ( = ?auto_888237 ?auto_888238 ) ) ( not ( = ?auto_888237 ?auto_888239 ) ) ( not ( = ?auto_888237 ?auto_888240 ) ) ( not ( = ?auto_888237 ?auto_888241 ) ) ( not ( = ?auto_888237 ?auto_888242 ) ) ( not ( = ?auto_888238 ?auto_888239 ) ) ( not ( = ?auto_888238 ?auto_888240 ) ) ( not ( = ?auto_888238 ?auto_888241 ) ) ( not ( = ?auto_888238 ?auto_888242 ) ) ( not ( = ?auto_888239 ?auto_888240 ) ) ( not ( = ?auto_888239 ?auto_888241 ) ) ( not ( = ?auto_888239 ?auto_888242 ) ) ( not ( = ?auto_888240 ?auto_888241 ) ) ( not ( = ?auto_888240 ?auto_888242 ) ) ( not ( = ?auto_888241 ?auto_888242 ) ) ( ON ?auto_888241 ?auto_888242 ) ( ON ?auto_888240 ?auto_888241 ) ( ON ?auto_888239 ?auto_888240 ) ( CLEAR ?auto_888237 ) ( ON ?auto_888238 ?auto_888239 ) ( CLEAR ?auto_888238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_888225 ?auto_888226 ?auto_888227 ?auto_888228 ?auto_888229 ?auto_888230 ?auto_888231 ?auto_888232 ?auto_888233 ?auto_888234 ?auto_888235 ?auto_888236 ?auto_888237 ?auto_888238 )
      ( MAKE-18PILE ?auto_888225 ?auto_888226 ?auto_888227 ?auto_888228 ?auto_888229 ?auto_888230 ?auto_888231 ?auto_888232 ?auto_888233 ?auto_888234 ?auto_888235 ?auto_888236 ?auto_888237 ?auto_888238 ?auto_888239 ?auto_888240 ?auto_888241 ?auto_888242 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888261 - BLOCK
      ?auto_888262 - BLOCK
      ?auto_888263 - BLOCK
      ?auto_888264 - BLOCK
      ?auto_888265 - BLOCK
      ?auto_888266 - BLOCK
      ?auto_888267 - BLOCK
      ?auto_888268 - BLOCK
      ?auto_888269 - BLOCK
      ?auto_888270 - BLOCK
      ?auto_888271 - BLOCK
      ?auto_888272 - BLOCK
      ?auto_888273 - BLOCK
      ?auto_888274 - BLOCK
      ?auto_888275 - BLOCK
      ?auto_888276 - BLOCK
      ?auto_888277 - BLOCK
      ?auto_888278 - BLOCK
    )
    :vars
    (
      ?auto_888279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_888278 ?auto_888279 ) ( ON-TABLE ?auto_888261 ) ( ON ?auto_888262 ?auto_888261 ) ( ON ?auto_888263 ?auto_888262 ) ( ON ?auto_888264 ?auto_888263 ) ( ON ?auto_888265 ?auto_888264 ) ( ON ?auto_888266 ?auto_888265 ) ( ON ?auto_888267 ?auto_888266 ) ( ON ?auto_888268 ?auto_888267 ) ( ON ?auto_888269 ?auto_888268 ) ( ON ?auto_888270 ?auto_888269 ) ( ON ?auto_888271 ?auto_888270 ) ( ON ?auto_888272 ?auto_888271 ) ( not ( = ?auto_888261 ?auto_888262 ) ) ( not ( = ?auto_888261 ?auto_888263 ) ) ( not ( = ?auto_888261 ?auto_888264 ) ) ( not ( = ?auto_888261 ?auto_888265 ) ) ( not ( = ?auto_888261 ?auto_888266 ) ) ( not ( = ?auto_888261 ?auto_888267 ) ) ( not ( = ?auto_888261 ?auto_888268 ) ) ( not ( = ?auto_888261 ?auto_888269 ) ) ( not ( = ?auto_888261 ?auto_888270 ) ) ( not ( = ?auto_888261 ?auto_888271 ) ) ( not ( = ?auto_888261 ?auto_888272 ) ) ( not ( = ?auto_888261 ?auto_888273 ) ) ( not ( = ?auto_888261 ?auto_888274 ) ) ( not ( = ?auto_888261 ?auto_888275 ) ) ( not ( = ?auto_888261 ?auto_888276 ) ) ( not ( = ?auto_888261 ?auto_888277 ) ) ( not ( = ?auto_888261 ?auto_888278 ) ) ( not ( = ?auto_888261 ?auto_888279 ) ) ( not ( = ?auto_888262 ?auto_888263 ) ) ( not ( = ?auto_888262 ?auto_888264 ) ) ( not ( = ?auto_888262 ?auto_888265 ) ) ( not ( = ?auto_888262 ?auto_888266 ) ) ( not ( = ?auto_888262 ?auto_888267 ) ) ( not ( = ?auto_888262 ?auto_888268 ) ) ( not ( = ?auto_888262 ?auto_888269 ) ) ( not ( = ?auto_888262 ?auto_888270 ) ) ( not ( = ?auto_888262 ?auto_888271 ) ) ( not ( = ?auto_888262 ?auto_888272 ) ) ( not ( = ?auto_888262 ?auto_888273 ) ) ( not ( = ?auto_888262 ?auto_888274 ) ) ( not ( = ?auto_888262 ?auto_888275 ) ) ( not ( = ?auto_888262 ?auto_888276 ) ) ( not ( = ?auto_888262 ?auto_888277 ) ) ( not ( = ?auto_888262 ?auto_888278 ) ) ( not ( = ?auto_888262 ?auto_888279 ) ) ( not ( = ?auto_888263 ?auto_888264 ) ) ( not ( = ?auto_888263 ?auto_888265 ) ) ( not ( = ?auto_888263 ?auto_888266 ) ) ( not ( = ?auto_888263 ?auto_888267 ) ) ( not ( = ?auto_888263 ?auto_888268 ) ) ( not ( = ?auto_888263 ?auto_888269 ) ) ( not ( = ?auto_888263 ?auto_888270 ) ) ( not ( = ?auto_888263 ?auto_888271 ) ) ( not ( = ?auto_888263 ?auto_888272 ) ) ( not ( = ?auto_888263 ?auto_888273 ) ) ( not ( = ?auto_888263 ?auto_888274 ) ) ( not ( = ?auto_888263 ?auto_888275 ) ) ( not ( = ?auto_888263 ?auto_888276 ) ) ( not ( = ?auto_888263 ?auto_888277 ) ) ( not ( = ?auto_888263 ?auto_888278 ) ) ( not ( = ?auto_888263 ?auto_888279 ) ) ( not ( = ?auto_888264 ?auto_888265 ) ) ( not ( = ?auto_888264 ?auto_888266 ) ) ( not ( = ?auto_888264 ?auto_888267 ) ) ( not ( = ?auto_888264 ?auto_888268 ) ) ( not ( = ?auto_888264 ?auto_888269 ) ) ( not ( = ?auto_888264 ?auto_888270 ) ) ( not ( = ?auto_888264 ?auto_888271 ) ) ( not ( = ?auto_888264 ?auto_888272 ) ) ( not ( = ?auto_888264 ?auto_888273 ) ) ( not ( = ?auto_888264 ?auto_888274 ) ) ( not ( = ?auto_888264 ?auto_888275 ) ) ( not ( = ?auto_888264 ?auto_888276 ) ) ( not ( = ?auto_888264 ?auto_888277 ) ) ( not ( = ?auto_888264 ?auto_888278 ) ) ( not ( = ?auto_888264 ?auto_888279 ) ) ( not ( = ?auto_888265 ?auto_888266 ) ) ( not ( = ?auto_888265 ?auto_888267 ) ) ( not ( = ?auto_888265 ?auto_888268 ) ) ( not ( = ?auto_888265 ?auto_888269 ) ) ( not ( = ?auto_888265 ?auto_888270 ) ) ( not ( = ?auto_888265 ?auto_888271 ) ) ( not ( = ?auto_888265 ?auto_888272 ) ) ( not ( = ?auto_888265 ?auto_888273 ) ) ( not ( = ?auto_888265 ?auto_888274 ) ) ( not ( = ?auto_888265 ?auto_888275 ) ) ( not ( = ?auto_888265 ?auto_888276 ) ) ( not ( = ?auto_888265 ?auto_888277 ) ) ( not ( = ?auto_888265 ?auto_888278 ) ) ( not ( = ?auto_888265 ?auto_888279 ) ) ( not ( = ?auto_888266 ?auto_888267 ) ) ( not ( = ?auto_888266 ?auto_888268 ) ) ( not ( = ?auto_888266 ?auto_888269 ) ) ( not ( = ?auto_888266 ?auto_888270 ) ) ( not ( = ?auto_888266 ?auto_888271 ) ) ( not ( = ?auto_888266 ?auto_888272 ) ) ( not ( = ?auto_888266 ?auto_888273 ) ) ( not ( = ?auto_888266 ?auto_888274 ) ) ( not ( = ?auto_888266 ?auto_888275 ) ) ( not ( = ?auto_888266 ?auto_888276 ) ) ( not ( = ?auto_888266 ?auto_888277 ) ) ( not ( = ?auto_888266 ?auto_888278 ) ) ( not ( = ?auto_888266 ?auto_888279 ) ) ( not ( = ?auto_888267 ?auto_888268 ) ) ( not ( = ?auto_888267 ?auto_888269 ) ) ( not ( = ?auto_888267 ?auto_888270 ) ) ( not ( = ?auto_888267 ?auto_888271 ) ) ( not ( = ?auto_888267 ?auto_888272 ) ) ( not ( = ?auto_888267 ?auto_888273 ) ) ( not ( = ?auto_888267 ?auto_888274 ) ) ( not ( = ?auto_888267 ?auto_888275 ) ) ( not ( = ?auto_888267 ?auto_888276 ) ) ( not ( = ?auto_888267 ?auto_888277 ) ) ( not ( = ?auto_888267 ?auto_888278 ) ) ( not ( = ?auto_888267 ?auto_888279 ) ) ( not ( = ?auto_888268 ?auto_888269 ) ) ( not ( = ?auto_888268 ?auto_888270 ) ) ( not ( = ?auto_888268 ?auto_888271 ) ) ( not ( = ?auto_888268 ?auto_888272 ) ) ( not ( = ?auto_888268 ?auto_888273 ) ) ( not ( = ?auto_888268 ?auto_888274 ) ) ( not ( = ?auto_888268 ?auto_888275 ) ) ( not ( = ?auto_888268 ?auto_888276 ) ) ( not ( = ?auto_888268 ?auto_888277 ) ) ( not ( = ?auto_888268 ?auto_888278 ) ) ( not ( = ?auto_888268 ?auto_888279 ) ) ( not ( = ?auto_888269 ?auto_888270 ) ) ( not ( = ?auto_888269 ?auto_888271 ) ) ( not ( = ?auto_888269 ?auto_888272 ) ) ( not ( = ?auto_888269 ?auto_888273 ) ) ( not ( = ?auto_888269 ?auto_888274 ) ) ( not ( = ?auto_888269 ?auto_888275 ) ) ( not ( = ?auto_888269 ?auto_888276 ) ) ( not ( = ?auto_888269 ?auto_888277 ) ) ( not ( = ?auto_888269 ?auto_888278 ) ) ( not ( = ?auto_888269 ?auto_888279 ) ) ( not ( = ?auto_888270 ?auto_888271 ) ) ( not ( = ?auto_888270 ?auto_888272 ) ) ( not ( = ?auto_888270 ?auto_888273 ) ) ( not ( = ?auto_888270 ?auto_888274 ) ) ( not ( = ?auto_888270 ?auto_888275 ) ) ( not ( = ?auto_888270 ?auto_888276 ) ) ( not ( = ?auto_888270 ?auto_888277 ) ) ( not ( = ?auto_888270 ?auto_888278 ) ) ( not ( = ?auto_888270 ?auto_888279 ) ) ( not ( = ?auto_888271 ?auto_888272 ) ) ( not ( = ?auto_888271 ?auto_888273 ) ) ( not ( = ?auto_888271 ?auto_888274 ) ) ( not ( = ?auto_888271 ?auto_888275 ) ) ( not ( = ?auto_888271 ?auto_888276 ) ) ( not ( = ?auto_888271 ?auto_888277 ) ) ( not ( = ?auto_888271 ?auto_888278 ) ) ( not ( = ?auto_888271 ?auto_888279 ) ) ( not ( = ?auto_888272 ?auto_888273 ) ) ( not ( = ?auto_888272 ?auto_888274 ) ) ( not ( = ?auto_888272 ?auto_888275 ) ) ( not ( = ?auto_888272 ?auto_888276 ) ) ( not ( = ?auto_888272 ?auto_888277 ) ) ( not ( = ?auto_888272 ?auto_888278 ) ) ( not ( = ?auto_888272 ?auto_888279 ) ) ( not ( = ?auto_888273 ?auto_888274 ) ) ( not ( = ?auto_888273 ?auto_888275 ) ) ( not ( = ?auto_888273 ?auto_888276 ) ) ( not ( = ?auto_888273 ?auto_888277 ) ) ( not ( = ?auto_888273 ?auto_888278 ) ) ( not ( = ?auto_888273 ?auto_888279 ) ) ( not ( = ?auto_888274 ?auto_888275 ) ) ( not ( = ?auto_888274 ?auto_888276 ) ) ( not ( = ?auto_888274 ?auto_888277 ) ) ( not ( = ?auto_888274 ?auto_888278 ) ) ( not ( = ?auto_888274 ?auto_888279 ) ) ( not ( = ?auto_888275 ?auto_888276 ) ) ( not ( = ?auto_888275 ?auto_888277 ) ) ( not ( = ?auto_888275 ?auto_888278 ) ) ( not ( = ?auto_888275 ?auto_888279 ) ) ( not ( = ?auto_888276 ?auto_888277 ) ) ( not ( = ?auto_888276 ?auto_888278 ) ) ( not ( = ?auto_888276 ?auto_888279 ) ) ( not ( = ?auto_888277 ?auto_888278 ) ) ( not ( = ?auto_888277 ?auto_888279 ) ) ( not ( = ?auto_888278 ?auto_888279 ) ) ( ON ?auto_888277 ?auto_888278 ) ( ON ?auto_888276 ?auto_888277 ) ( ON ?auto_888275 ?auto_888276 ) ( ON ?auto_888274 ?auto_888275 ) ( CLEAR ?auto_888272 ) ( ON ?auto_888273 ?auto_888274 ) ( CLEAR ?auto_888273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_888261 ?auto_888262 ?auto_888263 ?auto_888264 ?auto_888265 ?auto_888266 ?auto_888267 ?auto_888268 ?auto_888269 ?auto_888270 ?auto_888271 ?auto_888272 ?auto_888273 )
      ( MAKE-18PILE ?auto_888261 ?auto_888262 ?auto_888263 ?auto_888264 ?auto_888265 ?auto_888266 ?auto_888267 ?auto_888268 ?auto_888269 ?auto_888270 ?auto_888271 ?auto_888272 ?auto_888273 ?auto_888274 ?auto_888275 ?auto_888276 ?auto_888277 ?auto_888278 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888298 - BLOCK
      ?auto_888299 - BLOCK
      ?auto_888300 - BLOCK
      ?auto_888301 - BLOCK
      ?auto_888302 - BLOCK
      ?auto_888303 - BLOCK
      ?auto_888304 - BLOCK
      ?auto_888305 - BLOCK
      ?auto_888306 - BLOCK
      ?auto_888307 - BLOCK
      ?auto_888308 - BLOCK
      ?auto_888309 - BLOCK
      ?auto_888310 - BLOCK
      ?auto_888311 - BLOCK
      ?auto_888312 - BLOCK
      ?auto_888313 - BLOCK
      ?auto_888314 - BLOCK
      ?auto_888315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_888315 ) ( ON-TABLE ?auto_888298 ) ( ON ?auto_888299 ?auto_888298 ) ( ON ?auto_888300 ?auto_888299 ) ( ON ?auto_888301 ?auto_888300 ) ( ON ?auto_888302 ?auto_888301 ) ( ON ?auto_888303 ?auto_888302 ) ( ON ?auto_888304 ?auto_888303 ) ( ON ?auto_888305 ?auto_888304 ) ( ON ?auto_888306 ?auto_888305 ) ( ON ?auto_888307 ?auto_888306 ) ( ON ?auto_888308 ?auto_888307 ) ( ON ?auto_888309 ?auto_888308 ) ( not ( = ?auto_888298 ?auto_888299 ) ) ( not ( = ?auto_888298 ?auto_888300 ) ) ( not ( = ?auto_888298 ?auto_888301 ) ) ( not ( = ?auto_888298 ?auto_888302 ) ) ( not ( = ?auto_888298 ?auto_888303 ) ) ( not ( = ?auto_888298 ?auto_888304 ) ) ( not ( = ?auto_888298 ?auto_888305 ) ) ( not ( = ?auto_888298 ?auto_888306 ) ) ( not ( = ?auto_888298 ?auto_888307 ) ) ( not ( = ?auto_888298 ?auto_888308 ) ) ( not ( = ?auto_888298 ?auto_888309 ) ) ( not ( = ?auto_888298 ?auto_888310 ) ) ( not ( = ?auto_888298 ?auto_888311 ) ) ( not ( = ?auto_888298 ?auto_888312 ) ) ( not ( = ?auto_888298 ?auto_888313 ) ) ( not ( = ?auto_888298 ?auto_888314 ) ) ( not ( = ?auto_888298 ?auto_888315 ) ) ( not ( = ?auto_888299 ?auto_888300 ) ) ( not ( = ?auto_888299 ?auto_888301 ) ) ( not ( = ?auto_888299 ?auto_888302 ) ) ( not ( = ?auto_888299 ?auto_888303 ) ) ( not ( = ?auto_888299 ?auto_888304 ) ) ( not ( = ?auto_888299 ?auto_888305 ) ) ( not ( = ?auto_888299 ?auto_888306 ) ) ( not ( = ?auto_888299 ?auto_888307 ) ) ( not ( = ?auto_888299 ?auto_888308 ) ) ( not ( = ?auto_888299 ?auto_888309 ) ) ( not ( = ?auto_888299 ?auto_888310 ) ) ( not ( = ?auto_888299 ?auto_888311 ) ) ( not ( = ?auto_888299 ?auto_888312 ) ) ( not ( = ?auto_888299 ?auto_888313 ) ) ( not ( = ?auto_888299 ?auto_888314 ) ) ( not ( = ?auto_888299 ?auto_888315 ) ) ( not ( = ?auto_888300 ?auto_888301 ) ) ( not ( = ?auto_888300 ?auto_888302 ) ) ( not ( = ?auto_888300 ?auto_888303 ) ) ( not ( = ?auto_888300 ?auto_888304 ) ) ( not ( = ?auto_888300 ?auto_888305 ) ) ( not ( = ?auto_888300 ?auto_888306 ) ) ( not ( = ?auto_888300 ?auto_888307 ) ) ( not ( = ?auto_888300 ?auto_888308 ) ) ( not ( = ?auto_888300 ?auto_888309 ) ) ( not ( = ?auto_888300 ?auto_888310 ) ) ( not ( = ?auto_888300 ?auto_888311 ) ) ( not ( = ?auto_888300 ?auto_888312 ) ) ( not ( = ?auto_888300 ?auto_888313 ) ) ( not ( = ?auto_888300 ?auto_888314 ) ) ( not ( = ?auto_888300 ?auto_888315 ) ) ( not ( = ?auto_888301 ?auto_888302 ) ) ( not ( = ?auto_888301 ?auto_888303 ) ) ( not ( = ?auto_888301 ?auto_888304 ) ) ( not ( = ?auto_888301 ?auto_888305 ) ) ( not ( = ?auto_888301 ?auto_888306 ) ) ( not ( = ?auto_888301 ?auto_888307 ) ) ( not ( = ?auto_888301 ?auto_888308 ) ) ( not ( = ?auto_888301 ?auto_888309 ) ) ( not ( = ?auto_888301 ?auto_888310 ) ) ( not ( = ?auto_888301 ?auto_888311 ) ) ( not ( = ?auto_888301 ?auto_888312 ) ) ( not ( = ?auto_888301 ?auto_888313 ) ) ( not ( = ?auto_888301 ?auto_888314 ) ) ( not ( = ?auto_888301 ?auto_888315 ) ) ( not ( = ?auto_888302 ?auto_888303 ) ) ( not ( = ?auto_888302 ?auto_888304 ) ) ( not ( = ?auto_888302 ?auto_888305 ) ) ( not ( = ?auto_888302 ?auto_888306 ) ) ( not ( = ?auto_888302 ?auto_888307 ) ) ( not ( = ?auto_888302 ?auto_888308 ) ) ( not ( = ?auto_888302 ?auto_888309 ) ) ( not ( = ?auto_888302 ?auto_888310 ) ) ( not ( = ?auto_888302 ?auto_888311 ) ) ( not ( = ?auto_888302 ?auto_888312 ) ) ( not ( = ?auto_888302 ?auto_888313 ) ) ( not ( = ?auto_888302 ?auto_888314 ) ) ( not ( = ?auto_888302 ?auto_888315 ) ) ( not ( = ?auto_888303 ?auto_888304 ) ) ( not ( = ?auto_888303 ?auto_888305 ) ) ( not ( = ?auto_888303 ?auto_888306 ) ) ( not ( = ?auto_888303 ?auto_888307 ) ) ( not ( = ?auto_888303 ?auto_888308 ) ) ( not ( = ?auto_888303 ?auto_888309 ) ) ( not ( = ?auto_888303 ?auto_888310 ) ) ( not ( = ?auto_888303 ?auto_888311 ) ) ( not ( = ?auto_888303 ?auto_888312 ) ) ( not ( = ?auto_888303 ?auto_888313 ) ) ( not ( = ?auto_888303 ?auto_888314 ) ) ( not ( = ?auto_888303 ?auto_888315 ) ) ( not ( = ?auto_888304 ?auto_888305 ) ) ( not ( = ?auto_888304 ?auto_888306 ) ) ( not ( = ?auto_888304 ?auto_888307 ) ) ( not ( = ?auto_888304 ?auto_888308 ) ) ( not ( = ?auto_888304 ?auto_888309 ) ) ( not ( = ?auto_888304 ?auto_888310 ) ) ( not ( = ?auto_888304 ?auto_888311 ) ) ( not ( = ?auto_888304 ?auto_888312 ) ) ( not ( = ?auto_888304 ?auto_888313 ) ) ( not ( = ?auto_888304 ?auto_888314 ) ) ( not ( = ?auto_888304 ?auto_888315 ) ) ( not ( = ?auto_888305 ?auto_888306 ) ) ( not ( = ?auto_888305 ?auto_888307 ) ) ( not ( = ?auto_888305 ?auto_888308 ) ) ( not ( = ?auto_888305 ?auto_888309 ) ) ( not ( = ?auto_888305 ?auto_888310 ) ) ( not ( = ?auto_888305 ?auto_888311 ) ) ( not ( = ?auto_888305 ?auto_888312 ) ) ( not ( = ?auto_888305 ?auto_888313 ) ) ( not ( = ?auto_888305 ?auto_888314 ) ) ( not ( = ?auto_888305 ?auto_888315 ) ) ( not ( = ?auto_888306 ?auto_888307 ) ) ( not ( = ?auto_888306 ?auto_888308 ) ) ( not ( = ?auto_888306 ?auto_888309 ) ) ( not ( = ?auto_888306 ?auto_888310 ) ) ( not ( = ?auto_888306 ?auto_888311 ) ) ( not ( = ?auto_888306 ?auto_888312 ) ) ( not ( = ?auto_888306 ?auto_888313 ) ) ( not ( = ?auto_888306 ?auto_888314 ) ) ( not ( = ?auto_888306 ?auto_888315 ) ) ( not ( = ?auto_888307 ?auto_888308 ) ) ( not ( = ?auto_888307 ?auto_888309 ) ) ( not ( = ?auto_888307 ?auto_888310 ) ) ( not ( = ?auto_888307 ?auto_888311 ) ) ( not ( = ?auto_888307 ?auto_888312 ) ) ( not ( = ?auto_888307 ?auto_888313 ) ) ( not ( = ?auto_888307 ?auto_888314 ) ) ( not ( = ?auto_888307 ?auto_888315 ) ) ( not ( = ?auto_888308 ?auto_888309 ) ) ( not ( = ?auto_888308 ?auto_888310 ) ) ( not ( = ?auto_888308 ?auto_888311 ) ) ( not ( = ?auto_888308 ?auto_888312 ) ) ( not ( = ?auto_888308 ?auto_888313 ) ) ( not ( = ?auto_888308 ?auto_888314 ) ) ( not ( = ?auto_888308 ?auto_888315 ) ) ( not ( = ?auto_888309 ?auto_888310 ) ) ( not ( = ?auto_888309 ?auto_888311 ) ) ( not ( = ?auto_888309 ?auto_888312 ) ) ( not ( = ?auto_888309 ?auto_888313 ) ) ( not ( = ?auto_888309 ?auto_888314 ) ) ( not ( = ?auto_888309 ?auto_888315 ) ) ( not ( = ?auto_888310 ?auto_888311 ) ) ( not ( = ?auto_888310 ?auto_888312 ) ) ( not ( = ?auto_888310 ?auto_888313 ) ) ( not ( = ?auto_888310 ?auto_888314 ) ) ( not ( = ?auto_888310 ?auto_888315 ) ) ( not ( = ?auto_888311 ?auto_888312 ) ) ( not ( = ?auto_888311 ?auto_888313 ) ) ( not ( = ?auto_888311 ?auto_888314 ) ) ( not ( = ?auto_888311 ?auto_888315 ) ) ( not ( = ?auto_888312 ?auto_888313 ) ) ( not ( = ?auto_888312 ?auto_888314 ) ) ( not ( = ?auto_888312 ?auto_888315 ) ) ( not ( = ?auto_888313 ?auto_888314 ) ) ( not ( = ?auto_888313 ?auto_888315 ) ) ( not ( = ?auto_888314 ?auto_888315 ) ) ( ON ?auto_888314 ?auto_888315 ) ( ON ?auto_888313 ?auto_888314 ) ( ON ?auto_888312 ?auto_888313 ) ( ON ?auto_888311 ?auto_888312 ) ( CLEAR ?auto_888309 ) ( ON ?auto_888310 ?auto_888311 ) ( CLEAR ?auto_888310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_888298 ?auto_888299 ?auto_888300 ?auto_888301 ?auto_888302 ?auto_888303 ?auto_888304 ?auto_888305 ?auto_888306 ?auto_888307 ?auto_888308 ?auto_888309 ?auto_888310 )
      ( MAKE-18PILE ?auto_888298 ?auto_888299 ?auto_888300 ?auto_888301 ?auto_888302 ?auto_888303 ?auto_888304 ?auto_888305 ?auto_888306 ?auto_888307 ?auto_888308 ?auto_888309 ?auto_888310 ?auto_888311 ?auto_888312 ?auto_888313 ?auto_888314 ?auto_888315 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888334 - BLOCK
      ?auto_888335 - BLOCK
      ?auto_888336 - BLOCK
      ?auto_888337 - BLOCK
      ?auto_888338 - BLOCK
      ?auto_888339 - BLOCK
      ?auto_888340 - BLOCK
      ?auto_888341 - BLOCK
      ?auto_888342 - BLOCK
      ?auto_888343 - BLOCK
      ?auto_888344 - BLOCK
      ?auto_888345 - BLOCK
      ?auto_888346 - BLOCK
      ?auto_888347 - BLOCK
      ?auto_888348 - BLOCK
      ?auto_888349 - BLOCK
      ?auto_888350 - BLOCK
      ?auto_888351 - BLOCK
    )
    :vars
    (
      ?auto_888352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_888351 ?auto_888352 ) ( ON-TABLE ?auto_888334 ) ( ON ?auto_888335 ?auto_888334 ) ( ON ?auto_888336 ?auto_888335 ) ( ON ?auto_888337 ?auto_888336 ) ( ON ?auto_888338 ?auto_888337 ) ( ON ?auto_888339 ?auto_888338 ) ( ON ?auto_888340 ?auto_888339 ) ( ON ?auto_888341 ?auto_888340 ) ( ON ?auto_888342 ?auto_888341 ) ( ON ?auto_888343 ?auto_888342 ) ( ON ?auto_888344 ?auto_888343 ) ( not ( = ?auto_888334 ?auto_888335 ) ) ( not ( = ?auto_888334 ?auto_888336 ) ) ( not ( = ?auto_888334 ?auto_888337 ) ) ( not ( = ?auto_888334 ?auto_888338 ) ) ( not ( = ?auto_888334 ?auto_888339 ) ) ( not ( = ?auto_888334 ?auto_888340 ) ) ( not ( = ?auto_888334 ?auto_888341 ) ) ( not ( = ?auto_888334 ?auto_888342 ) ) ( not ( = ?auto_888334 ?auto_888343 ) ) ( not ( = ?auto_888334 ?auto_888344 ) ) ( not ( = ?auto_888334 ?auto_888345 ) ) ( not ( = ?auto_888334 ?auto_888346 ) ) ( not ( = ?auto_888334 ?auto_888347 ) ) ( not ( = ?auto_888334 ?auto_888348 ) ) ( not ( = ?auto_888334 ?auto_888349 ) ) ( not ( = ?auto_888334 ?auto_888350 ) ) ( not ( = ?auto_888334 ?auto_888351 ) ) ( not ( = ?auto_888334 ?auto_888352 ) ) ( not ( = ?auto_888335 ?auto_888336 ) ) ( not ( = ?auto_888335 ?auto_888337 ) ) ( not ( = ?auto_888335 ?auto_888338 ) ) ( not ( = ?auto_888335 ?auto_888339 ) ) ( not ( = ?auto_888335 ?auto_888340 ) ) ( not ( = ?auto_888335 ?auto_888341 ) ) ( not ( = ?auto_888335 ?auto_888342 ) ) ( not ( = ?auto_888335 ?auto_888343 ) ) ( not ( = ?auto_888335 ?auto_888344 ) ) ( not ( = ?auto_888335 ?auto_888345 ) ) ( not ( = ?auto_888335 ?auto_888346 ) ) ( not ( = ?auto_888335 ?auto_888347 ) ) ( not ( = ?auto_888335 ?auto_888348 ) ) ( not ( = ?auto_888335 ?auto_888349 ) ) ( not ( = ?auto_888335 ?auto_888350 ) ) ( not ( = ?auto_888335 ?auto_888351 ) ) ( not ( = ?auto_888335 ?auto_888352 ) ) ( not ( = ?auto_888336 ?auto_888337 ) ) ( not ( = ?auto_888336 ?auto_888338 ) ) ( not ( = ?auto_888336 ?auto_888339 ) ) ( not ( = ?auto_888336 ?auto_888340 ) ) ( not ( = ?auto_888336 ?auto_888341 ) ) ( not ( = ?auto_888336 ?auto_888342 ) ) ( not ( = ?auto_888336 ?auto_888343 ) ) ( not ( = ?auto_888336 ?auto_888344 ) ) ( not ( = ?auto_888336 ?auto_888345 ) ) ( not ( = ?auto_888336 ?auto_888346 ) ) ( not ( = ?auto_888336 ?auto_888347 ) ) ( not ( = ?auto_888336 ?auto_888348 ) ) ( not ( = ?auto_888336 ?auto_888349 ) ) ( not ( = ?auto_888336 ?auto_888350 ) ) ( not ( = ?auto_888336 ?auto_888351 ) ) ( not ( = ?auto_888336 ?auto_888352 ) ) ( not ( = ?auto_888337 ?auto_888338 ) ) ( not ( = ?auto_888337 ?auto_888339 ) ) ( not ( = ?auto_888337 ?auto_888340 ) ) ( not ( = ?auto_888337 ?auto_888341 ) ) ( not ( = ?auto_888337 ?auto_888342 ) ) ( not ( = ?auto_888337 ?auto_888343 ) ) ( not ( = ?auto_888337 ?auto_888344 ) ) ( not ( = ?auto_888337 ?auto_888345 ) ) ( not ( = ?auto_888337 ?auto_888346 ) ) ( not ( = ?auto_888337 ?auto_888347 ) ) ( not ( = ?auto_888337 ?auto_888348 ) ) ( not ( = ?auto_888337 ?auto_888349 ) ) ( not ( = ?auto_888337 ?auto_888350 ) ) ( not ( = ?auto_888337 ?auto_888351 ) ) ( not ( = ?auto_888337 ?auto_888352 ) ) ( not ( = ?auto_888338 ?auto_888339 ) ) ( not ( = ?auto_888338 ?auto_888340 ) ) ( not ( = ?auto_888338 ?auto_888341 ) ) ( not ( = ?auto_888338 ?auto_888342 ) ) ( not ( = ?auto_888338 ?auto_888343 ) ) ( not ( = ?auto_888338 ?auto_888344 ) ) ( not ( = ?auto_888338 ?auto_888345 ) ) ( not ( = ?auto_888338 ?auto_888346 ) ) ( not ( = ?auto_888338 ?auto_888347 ) ) ( not ( = ?auto_888338 ?auto_888348 ) ) ( not ( = ?auto_888338 ?auto_888349 ) ) ( not ( = ?auto_888338 ?auto_888350 ) ) ( not ( = ?auto_888338 ?auto_888351 ) ) ( not ( = ?auto_888338 ?auto_888352 ) ) ( not ( = ?auto_888339 ?auto_888340 ) ) ( not ( = ?auto_888339 ?auto_888341 ) ) ( not ( = ?auto_888339 ?auto_888342 ) ) ( not ( = ?auto_888339 ?auto_888343 ) ) ( not ( = ?auto_888339 ?auto_888344 ) ) ( not ( = ?auto_888339 ?auto_888345 ) ) ( not ( = ?auto_888339 ?auto_888346 ) ) ( not ( = ?auto_888339 ?auto_888347 ) ) ( not ( = ?auto_888339 ?auto_888348 ) ) ( not ( = ?auto_888339 ?auto_888349 ) ) ( not ( = ?auto_888339 ?auto_888350 ) ) ( not ( = ?auto_888339 ?auto_888351 ) ) ( not ( = ?auto_888339 ?auto_888352 ) ) ( not ( = ?auto_888340 ?auto_888341 ) ) ( not ( = ?auto_888340 ?auto_888342 ) ) ( not ( = ?auto_888340 ?auto_888343 ) ) ( not ( = ?auto_888340 ?auto_888344 ) ) ( not ( = ?auto_888340 ?auto_888345 ) ) ( not ( = ?auto_888340 ?auto_888346 ) ) ( not ( = ?auto_888340 ?auto_888347 ) ) ( not ( = ?auto_888340 ?auto_888348 ) ) ( not ( = ?auto_888340 ?auto_888349 ) ) ( not ( = ?auto_888340 ?auto_888350 ) ) ( not ( = ?auto_888340 ?auto_888351 ) ) ( not ( = ?auto_888340 ?auto_888352 ) ) ( not ( = ?auto_888341 ?auto_888342 ) ) ( not ( = ?auto_888341 ?auto_888343 ) ) ( not ( = ?auto_888341 ?auto_888344 ) ) ( not ( = ?auto_888341 ?auto_888345 ) ) ( not ( = ?auto_888341 ?auto_888346 ) ) ( not ( = ?auto_888341 ?auto_888347 ) ) ( not ( = ?auto_888341 ?auto_888348 ) ) ( not ( = ?auto_888341 ?auto_888349 ) ) ( not ( = ?auto_888341 ?auto_888350 ) ) ( not ( = ?auto_888341 ?auto_888351 ) ) ( not ( = ?auto_888341 ?auto_888352 ) ) ( not ( = ?auto_888342 ?auto_888343 ) ) ( not ( = ?auto_888342 ?auto_888344 ) ) ( not ( = ?auto_888342 ?auto_888345 ) ) ( not ( = ?auto_888342 ?auto_888346 ) ) ( not ( = ?auto_888342 ?auto_888347 ) ) ( not ( = ?auto_888342 ?auto_888348 ) ) ( not ( = ?auto_888342 ?auto_888349 ) ) ( not ( = ?auto_888342 ?auto_888350 ) ) ( not ( = ?auto_888342 ?auto_888351 ) ) ( not ( = ?auto_888342 ?auto_888352 ) ) ( not ( = ?auto_888343 ?auto_888344 ) ) ( not ( = ?auto_888343 ?auto_888345 ) ) ( not ( = ?auto_888343 ?auto_888346 ) ) ( not ( = ?auto_888343 ?auto_888347 ) ) ( not ( = ?auto_888343 ?auto_888348 ) ) ( not ( = ?auto_888343 ?auto_888349 ) ) ( not ( = ?auto_888343 ?auto_888350 ) ) ( not ( = ?auto_888343 ?auto_888351 ) ) ( not ( = ?auto_888343 ?auto_888352 ) ) ( not ( = ?auto_888344 ?auto_888345 ) ) ( not ( = ?auto_888344 ?auto_888346 ) ) ( not ( = ?auto_888344 ?auto_888347 ) ) ( not ( = ?auto_888344 ?auto_888348 ) ) ( not ( = ?auto_888344 ?auto_888349 ) ) ( not ( = ?auto_888344 ?auto_888350 ) ) ( not ( = ?auto_888344 ?auto_888351 ) ) ( not ( = ?auto_888344 ?auto_888352 ) ) ( not ( = ?auto_888345 ?auto_888346 ) ) ( not ( = ?auto_888345 ?auto_888347 ) ) ( not ( = ?auto_888345 ?auto_888348 ) ) ( not ( = ?auto_888345 ?auto_888349 ) ) ( not ( = ?auto_888345 ?auto_888350 ) ) ( not ( = ?auto_888345 ?auto_888351 ) ) ( not ( = ?auto_888345 ?auto_888352 ) ) ( not ( = ?auto_888346 ?auto_888347 ) ) ( not ( = ?auto_888346 ?auto_888348 ) ) ( not ( = ?auto_888346 ?auto_888349 ) ) ( not ( = ?auto_888346 ?auto_888350 ) ) ( not ( = ?auto_888346 ?auto_888351 ) ) ( not ( = ?auto_888346 ?auto_888352 ) ) ( not ( = ?auto_888347 ?auto_888348 ) ) ( not ( = ?auto_888347 ?auto_888349 ) ) ( not ( = ?auto_888347 ?auto_888350 ) ) ( not ( = ?auto_888347 ?auto_888351 ) ) ( not ( = ?auto_888347 ?auto_888352 ) ) ( not ( = ?auto_888348 ?auto_888349 ) ) ( not ( = ?auto_888348 ?auto_888350 ) ) ( not ( = ?auto_888348 ?auto_888351 ) ) ( not ( = ?auto_888348 ?auto_888352 ) ) ( not ( = ?auto_888349 ?auto_888350 ) ) ( not ( = ?auto_888349 ?auto_888351 ) ) ( not ( = ?auto_888349 ?auto_888352 ) ) ( not ( = ?auto_888350 ?auto_888351 ) ) ( not ( = ?auto_888350 ?auto_888352 ) ) ( not ( = ?auto_888351 ?auto_888352 ) ) ( ON ?auto_888350 ?auto_888351 ) ( ON ?auto_888349 ?auto_888350 ) ( ON ?auto_888348 ?auto_888349 ) ( ON ?auto_888347 ?auto_888348 ) ( ON ?auto_888346 ?auto_888347 ) ( CLEAR ?auto_888344 ) ( ON ?auto_888345 ?auto_888346 ) ( CLEAR ?auto_888345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_888334 ?auto_888335 ?auto_888336 ?auto_888337 ?auto_888338 ?auto_888339 ?auto_888340 ?auto_888341 ?auto_888342 ?auto_888343 ?auto_888344 ?auto_888345 )
      ( MAKE-18PILE ?auto_888334 ?auto_888335 ?auto_888336 ?auto_888337 ?auto_888338 ?auto_888339 ?auto_888340 ?auto_888341 ?auto_888342 ?auto_888343 ?auto_888344 ?auto_888345 ?auto_888346 ?auto_888347 ?auto_888348 ?auto_888349 ?auto_888350 ?auto_888351 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888371 - BLOCK
      ?auto_888372 - BLOCK
      ?auto_888373 - BLOCK
      ?auto_888374 - BLOCK
      ?auto_888375 - BLOCK
      ?auto_888376 - BLOCK
      ?auto_888377 - BLOCK
      ?auto_888378 - BLOCK
      ?auto_888379 - BLOCK
      ?auto_888380 - BLOCK
      ?auto_888381 - BLOCK
      ?auto_888382 - BLOCK
      ?auto_888383 - BLOCK
      ?auto_888384 - BLOCK
      ?auto_888385 - BLOCK
      ?auto_888386 - BLOCK
      ?auto_888387 - BLOCK
      ?auto_888388 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_888388 ) ( ON-TABLE ?auto_888371 ) ( ON ?auto_888372 ?auto_888371 ) ( ON ?auto_888373 ?auto_888372 ) ( ON ?auto_888374 ?auto_888373 ) ( ON ?auto_888375 ?auto_888374 ) ( ON ?auto_888376 ?auto_888375 ) ( ON ?auto_888377 ?auto_888376 ) ( ON ?auto_888378 ?auto_888377 ) ( ON ?auto_888379 ?auto_888378 ) ( ON ?auto_888380 ?auto_888379 ) ( ON ?auto_888381 ?auto_888380 ) ( not ( = ?auto_888371 ?auto_888372 ) ) ( not ( = ?auto_888371 ?auto_888373 ) ) ( not ( = ?auto_888371 ?auto_888374 ) ) ( not ( = ?auto_888371 ?auto_888375 ) ) ( not ( = ?auto_888371 ?auto_888376 ) ) ( not ( = ?auto_888371 ?auto_888377 ) ) ( not ( = ?auto_888371 ?auto_888378 ) ) ( not ( = ?auto_888371 ?auto_888379 ) ) ( not ( = ?auto_888371 ?auto_888380 ) ) ( not ( = ?auto_888371 ?auto_888381 ) ) ( not ( = ?auto_888371 ?auto_888382 ) ) ( not ( = ?auto_888371 ?auto_888383 ) ) ( not ( = ?auto_888371 ?auto_888384 ) ) ( not ( = ?auto_888371 ?auto_888385 ) ) ( not ( = ?auto_888371 ?auto_888386 ) ) ( not ( = ?auto_888371 ?auto_888387 ) ) ( not ( = ?auto_888371 ?auto_888388 ) ) ( not ( = ?auto_888372 ?auto_888373 ) ) ( not ( = ?auto_888372 ?auto_888374 ) ) ( not ( = ?auto_888372 ?auto_888375 ) ) ( not ( = ?auto_888372 ?auto_888376 ) ) ( not ( = ?auto_888372 ?auto_888377 ) ) ( not ( = ?auto_888372 ?auto_888378 ) ) ( not ( = ?auto_888372 ?auto_888379 ) ) ( not ( = ?auto_888372 ?auto_888380 ) ) ( not ( = ?auto_888372 ?auto_888381 ) ) ( not ( = ?auto_888372 ?auto_888382 ) ) ( not ( = ?auto_888372 ?auto_888383 ) ) ( not ( = ?auto_888372 ?auto_888384 ) ) ( not ( = ?auto_888372 ?auto_888385 ) ) ( not ( = ?auto_888372 ?auto_888386 ) ) ( not ( = ?auto_888372 ?auto_888387 ) ) ( not ( = ?auto_888372 ?auto_888388 ) ) ( not ( = ?auto_888373 ?auto_888374 ) ) ( not ( = ?auto_888373 ?auto_888375 ) ) ( not ( = ?auto_888373 ?auto_888376 ) ) ( not ( = ?auto_888373 ?auto_888377 ) ) ( not ( = ?auto_888373 ?auto_888378 ) ) ( not ( = ?auto_888373 ?auto_888379 ) ) ( not ( = ?auto_888373 ?auto_888380 ) ) ( not ( = ?auto_888373 ?auto_888381 ) ) ( not ( = ?auto_888373 ?auto_888382 ) ) ( not ( = ?auto_888373 ?auto_888383 ) ) ( not ( = ?auto_888373 ?auto_888384 ) ) ( not ( = ?auto_888373 ?auto_888385 ) ) ( not ( = ?auto_888373 ?auto_888386 ) ) ( not ( = ?auto_888373 ?auto_888387 ) ) ( not ( = ?auto_888373 ?auto_888388 ) ) ( not ( = ?auto_888374 ?auto_888375 ) ) ( not ( = ?auto_888374 ?auto_888376 ) ) ( not ( = ?auto_888374 ?auto_888377 ) ) ( not ( = ?auto_888374 ?auto_888378 ) ) ( not ( = ?auto_888374 ?auto_888379 ) ) ( not ( = ?auto_888374 ?auto_888380 ) ) ( not ( = ?auto_888374 ?auto_888381 ) ) ( not ( = ?auto_888374 ?auto_888382 ) ) ( not ( = ?auto_888374 ?auto_888383 ) ) ( not ( = ?auto_888374 ?auto_888384 ) ) ( not ( = ?auto_888374 ?auto_888385 ) ) ( not ( = ?auto_888374 ?auto_888386 ) ) ( not ( = ?auto_888374 ?auto_888387 ) ) ( not ( = ?auto_888374 ?auto_888388 ) ) ( not ( = ?auto_888375 ?auto_888376 ) ) ( not ( = ?auto_888375 ?auto_888377 ) ) ( not ( = ?auto_888375 ?auto_888378 ) ) ( not ( = ?auto_888375 ?auto_888379 ) ) ( not ( = ?auto_888375 ?auto_888380 ) ) ( not ( = ?auto_888375 ?auto_888381 ) ) ( not ( = ?auto_888375 ?auto_888382 ) ) ( not ( = ?auto_888375 ?auto_888383 ) ) ( not ( = ?auto_888375 ?auto_888384 ) ) ( not ( = ?auto_888375 ?auto_888385 ) ) ( not ( = ?auto_888375 ?auto_888386 ) ) ( not ( = ?auto_888375 ?auto_888387 ) ) ( not ( = ?auto_888375 ?auto_888388 ) ) ( not ( = ?auto_888376 ?auto_888377 ) ) ( not ( = ?auto_888376 ?auto_888378 ) ) ( not ( = ?auto_888376 ?auto_888379 ) ) ( not ( = ?auto_888376 ?auto_888380 ) ) ( not ( = ?auto_888376 ?auto_888381 ) ) ( not ( = ?auto_888376 ?auto_888382 ) ) ( not ( = ?auto_888376 ?auto_888383 ) ) ( not ( = ?auto_888376 ?auto_888384 ) ) ( not ( = ?auto_888376 ?auto_888385 ) ) ( not ( = ?auto_888376 ?auto_888386 ) ) ( not ( = ?auto_888376 ?auto_888387 ) ) ( not ( = ?auto_888376 ?auto_888388 ) ) ( not ( = ?auto_888377 ?auto_888378 ) ) ( not ( = ?auto_888377 ?auto_888379 ) ) ( not ( = ?auto_888377 ?auto_888380 ) ) ( not ( = ?auto_888377 ?auto_888381 ) ) ( not ( = ?auto_888377 ?auto_888382 ) ) ( not ( = ?auto_888377 ?auto_888383 ) ) ( not ( = ?auto_888377 ?auto_888384 ) ) ( not ( = ?auto_888377 ?auto_888385 ) ) ( not ( = ?auto_888377 ?auto_888386 ) ) ( not ( = ?auto_888377 ?auto_888387 ) ) ( not ( = ?auto_888377 ?auto_888388 ) ) ( not ( = ?auto_888378 ?auto_888379 ) ) ( not ( = ?auto_888378 ?auto_888380 ) ) ( not ( = ?auto_888378 ?auto_888381 ) ) ( not ( = ?auto_888378 ?auto_888382 ) ) ( not ( = ?auto_888378 ?auto_888383 ) ) ( not ( = ?auto_888378 ?auto_888384 ) ) ( not ( = ?auto_888378 ?auto_888385 ) ) ( not ( = ?auto_888378 ?auto_888386 ) ) ( not ( = ?auto_888378 ?auto_888387 ) ) ( not ( = ?auto_888378 ?auto_888388 ) ) ( not ( = ?auto_888379 ?auto_888380 ) ) ( not ( = ?auto_888379 ?auto_888381 ) ) ( not ( = ?auto_888379 ?auto_888382 ) ) ( not ( = ?auto_888379 ?auto_888383 ) ) ( not ( = ?auto_888379 ?auto_888384 ) ) ( not ( = ?auto_888379 ?auto_888385 ) ) ( not ( = ?auto_888379 ?auto_888386 ) ) ( not ( = ?auto_888379 ?auto_888387 ) ) ( not ( = ?auto_888379 ?auto_888388 ) ) ( not ( = ?auto_888380 ?auto_888381 ) ) ( not ( = ?auto_888380 ?auto_888382 ) ) ( not ( = ?auto_888380 ?auto_888383 ) ) ( not ( = ?auto_888380 ?auto_888384 ) ) ( not ( = ?auto_888380 ?auto_888385 ) ) ( not ( = ?auto_888380 ?auto_888386 ) ) ( not ( = ?auto_888380 ?auto_888387 ) ) ( not ( = ?auto_888380 ?auto_888388 ) ) ( not ( = ?auto_888381 ?auto_888382 ) ) ( not ( = ?auto_888381 ?auto_888383 ) ) ( not ( = ?auto_888381 ?auto_888384 ) ) ( not ( = ?auto_888381 ?auto_888385 ) ) ( not ( = ?auto_888381 ?auto_888386 ) ) ( not ( = ?auto_888381 ?auto_888387 ) ) ( not ( = ?auto_888381 ?auto_888388 ) ) ( not ( = ?auto_888382 ?auto_888383 ) ) ( not ( = ?auto_888382 ?auto_888384 ) ) ( not ( = ?auto_888382 ?auto_888385 ) ) ( not ( = ?auto_888382 ?auto_888386 ) ) ( not ( = ?auto_888382 ?auto_888387 ) ) ( not ( = ?auto_888382 ?auto_888388 ) ) ( not ( = ?auto_888383 ?auto_888384 ) ) ( not ( = ?auto_888383 ?auto_888385 ) ) ( not ( = ?auto_888383 ?auto_888386 ) ) ( not ( = ?auto_888383 ?auto_888387 ) ) ( not ( = ?auto_888383 ?auto_888388 ) ) ( not ( = ?auto_888384 ?auto_888385 ) ) ( not ( = ?auto_888384 ?auto_888386 ) ) ( not ( = ?auto_888384 ?auto_888387 ) ) ( not ( = ?auto_888384 ?auto_888388 ) ) ( not ( = ?auto_888385 ?auto_888386 ) ) ( not ( = ?auto_888385 ?auto_888387 ) ) ( not ( = ?auto_888385 ?auto_888388 ) ) ( not ( = ?auto_888386 ?auto_888387 ) ) ( not ( = ?auto_888386 ?auto_888388 ) ) ( not ( = ?auto_888387 ?auto_888388 ) ) ( ON ?auto_888387 ?auto_888388 ) ( ON ?auto_888386 ?auto_888387 ) ( ON ?auto_888385 ?auto_888386 ) ( ON ?auto_888384 ?auto_888385 ) ( ON ?auto_888383 ?auto_888384 ) ( CLEAR ?auto_888381 ) ( ON ?auto_888382 ?auto_888383 ) ( CLEAR ?auto_888382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_888371 ?auto_888372 ?auto_888373 ?auto_888374 ?auto_888375 ?auto_888376 ?auto_888377 ?auto_888378 ?auto_888379 ?auto_888380 ?auto_888381 ?auto_888382 )
      ( MAKE-18PILE ?auto_888371 ?auto_888372 ?auto_888373 ?auto_888374 ?auto_888375 ?auto_888376 ?auto_888377 ?auto_888378 ?auto_888379 ?auto_888380 ?auto_888381 ?auto_888382 ?auto_888383 ?auto_888384 ?auto_888385 ?auto_888386 ?auto_888387 ?auto_888388 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888407 - BLOCK
      ?auto_888408 - BLOCK
      ?auto_888409 - BLOCK
      ?auto_888410 - BLOCK
      ?auto_888411 - BLOCK
      ?auto_888412 - BLOCK
      ?auto_888413 - BLOCK
      ?auto_888414 - BLOCK
      ?auto_888415 - BLOCK
      ?auto_888416 - BLOCK
      ?auto_888417 - BLOCK
      ?auto_888418 - BLOCK
      ?auto_888419 - BLOCK
      ?auto_888420 - BLOCK
      ?auto_888421 - BLOCK
      ?auto_888422 - BLOCK
      ?auto_888423 - BLOCK
      ?auto_888424 - BLOCK
    )
    :vars
    (
      ?auto_888425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_888424 ?auto_888425 ) ( ON-TABLE ?auto_888407 ) ( ON ?auto_888408 ?auto_888407 ) ( ON ?auto_888409 ?auto_888408 ) ( ON ?auto_888410 ?auto_888409 ) ( ON ?auto_888411 ?auto_888410 ) ( ON ?auto_888412 ?auto_888411 ) ( ON ?auto_888413 ?auto_888412 ) ( ON ?auto_888414 ?auto_888413 ) ( ON ?auto_888415 ?auto_888414 ) ( ON ?auto_888416 ?auto_888415 ) ( not ( = ?auto_888407 ?auto_888408 ) ) ( not ( = ?auto_888407 ?auto_888409 ) ) ( not ( = ?auto_888407 ?auto_888410 ) ) ( not ( = ?auto_888407 ?auto_888411 ) ) ( not ( = ?auto_888407 ?auto_888412 ) ) ( not ( = ?auto_888407 ?auto_888413 ) ) ( not ( = ?auto_888407 ?auto_888414 ) ) ( not ( = ?auto_888407 ?auto_888415 ) ) ( not ( = ?auto_888407 ?auto_888416 ) ) ( not ( = ?auto_888407 ?auto_888417 ) ) ( not ( = ?auto_888407 ?auto_888418 ) ) ( not ( = ?auto_888407 ?auto_888419 ) ) ( not ( = ?auto_888407 ?auto_888420 ) ) ( not ( = ?auto_888407 ?auto_888421 ) ) ( not ( = ?auto_888407 ?auto_888422 ) ) ( not ( = ?auto_888407 ?auto_888423 ) ) ( not ( = ?auto_888407 ?auto_888424 ) ) ( not ( = ?auto_888407 ?auto_888425 ) ) ( not ( = ?auto_888408 ?auto_888409 ) ) ( not ( = ?auto_888408 ?auto_888410 ) ) ( not ( = ?auto_888408 ?auto_888411 ) ) ( not ( = ?auto_888408 ?auto_888412 ) ) ( not ( = ?auto_888408 ?auto_888413 ) ) ( not ( = ?auto_888408 ?auto_888414 ) ) ( not ( = ?auto_888408 ?auto_888415 ) ) ( not ( = ?auto_888408 ?auto_888416 ) ) ( not ( = ?auto_888408 ?auto_888417 ) ) ( not ( = ?auto_888408 ?auto_888418 ) ) ( not ( = ?auto_888408 ?auto_888419 ) ) ( not ( = ?auto_888408 ?auto_888420 ) ) ( not ( = ?auto_888408 ?auto_888421 ) ) ( not ( = ?auto_888408 ?auto_888422 ) ) ( not ( = ?auto_888408 ?auto_888423 ) ) ( not ( = ?auto_888408 ?auto_888424 ) ) ( not ( = ?auto_888408 ?auto_888425 ) ) ( not ( = ?auto_888409 ?auto_888410 ) ) ( not ( = ?auto_888409 ?auto_888411 ) ) ( not ( = ?auto_888409 ?auto_888412 ) ) ( not ( = ?auto_888409 ?auto_888413 ) ) ( not ( = ?auto_888409 ?auto_888414 ) ) ( not ( = ?auto_888409 ?auto_888415 ) ) ( not ( = ?auto_888409 ?auto_888416 ) ) ( not ( = ?auto_888409 ?auto_888417 ) ) ( not ( = ?auto_888409 ?auto_888418 ) ) ( not ( = ?auto_888409 ?auto_888419 ) ) ( not ( = ?auto_888409 ?auto_888420 ) ) ( not ( = ?auto_888409 ?auto_888421 ) ) ( not ( = ?auto_888409 ?auto_888422 ) ) ( not ( = ?auto_888409 ?auto_888423 ) ) ( not ( = ?auto_888409 ?auto_888424 ) ) ( not ( = ?auto_888409 ?auto_888425 ) ) ( not ( = ?auto_888410 ?auto_888411 ) ) ( not ( = ?auto_888410 ?auto_888412 ) ) ( not ( = ?auto_888410 ?auto_888413 ) ) ( not ( = ?auto_888410 ?auto_888414 ) ) ( not ( = ?auto_888410 ?auto_888415 ) ) ( not ( = ?auto_888410 ?auto_888416 ) ) ( not ( = ?auto_888410 ?auto_888417 ) ) ( not ( = ?auto_888410 ?auto_888418 ) ) ( not ( = ?auto_888410 ?auto_888419 ) ) ( not ( = ?auto_888410 ?auto_888420 ) ) ( not ( = ?auto_888410 ?auto_888421 ) ) ( not ( = ?auto_888410 ?auto_888422 ) ) ( not ( = ?auto_888410 ?auto_888423 ) ) ( not ( = ?auto_888410 ?auto_888424 ) ) ( not ( = ?auto_888410 ?auto_888425 ) ) ( not ( = ?auto_888411 ?auto_888412 ) ) ( not ( = ?auto_888411 ?auto_888413 ) ) ( not ( = ?auto_888411 ?auto_888414 ) ) ( not ( = ?auto_888411 ?auto_888415 ) ) ( not ( = ?auto_888411 ?auto_888416 ) ) ( not ( = ?auto_888411 ?auto_888417 ) ) ( not ( = ?auto_888411 ?auto_888418 ) ) ( not ( = ?auto_888411 ?auto_888419 ) ) ( not ( = ?auto_888411 ?auto_888420 ) ) ( not ( = ?auto_888411 ?auto_888421 ) ) ( not ( = ?auto_888411 ?auto_888422 ) ) ( not ( = ?auto_888411 ?auto_888423 ) ) ( not ( = ?auto_888411 ?auto_888424 ) ) ( not ( = ?auto_888411 ?auto_888425 ) ) ( not ( = ?auto_888412 ?auto_888413 ) ) ( not ( = ?auto_888412 ?auto_888414 ) ) ( not ( = ?auto_888412 ?auto_888415 ) ) ( not ( = ?auto_888412 ?auto_888416 ) ) ( not ( = ?auto_888412 ?auto_888417 ) ) ( not ( = ?auto_888412 ?auto_888418 ) ) ( not ( = ?auto_888412 ?auto_888419 ) ) ( not ( = ?auto_888412 ?auto_888420 ) ) ( not ( = ?auto_888412 ?auto_888421 ) ) ( not ( = ?auto_888412 ?auto_888422 ) ) ( not ( = ?auto_888412 ?auto_888423 ) ) ( not ( = ?auto_888412 ?auto_888424 ) ) ( not ( = ?auto_888412 ?auto_888425 ) ) ( not ( = ?auto_888413 ?auto_888414 ) ) ( not ( = ?auto_888413 ?auto_888415 ) ) ( not ( = ?auto_888413 ?auto_888416 ) ) ( not ( = ?auto_888413 ?auto_888417 ) ) ( not ( = ?auto_888413 ?auto_888418 ) ) ( not ( = ?auto_888413 ?auto_888419 ) ) ( not ( = ?auto_888413 ?auto_888420 ) ) ( not ( = ?auto_888413 ?auto_888421 ) ) ( not ( = ?auto_888413 ?auto_888422 ) ) ( not ( = ?auto_888413 ?auto_888423 ) ) ( not ( = ?auto_888413 ?auto_888424 ) ) ( not ( = ?auto_888413 ?auto_888425 ) ) ( not ( = ?auto_888414 ?auto_888415 ) ) ( not ( = ?auto_888414 ?auto_888416 ) ) ( not ( = ?auto_888414 ?auto_888417 ) ) ( not ( = ?auto_888414 ?auto_888418 ) ) ( not ( = ?auto_888414 ?auto_888419 ) ) ( not ( = ?auto_888414 ?auto_888420 ) ) ( not ( = ?auto_888414 ?auto_888421 ) ) ( not ( = ?auto_888414 ?auto_888422 ) ) ( not ( = ?auto_888414 ?auto_888423 ) ) ( not ( = ?auto_888414 ?auto_888424 ) ) ( not ( = ?auto_888414 ?auto_888425 ) ) ( not ( = ?auto_888415 ?auto_888416 ) ) ( not ( = ?auto_888415 ?auto_888417 ) ) ( not ( = ?auto_888415 ?auto_888418 ) ) ( not ( = ?auto_888415 ?auto_888419 ) ) ( not ( = ?auto_888415 ?auto_888420 ) ) ( not ( = ?auto_888415 ?auto_888421 ) ) ( not ( = ?auto_888415 ?auto_888422 ) ) ( not ( = ?auto_888415 ?auto_888423 ) ) ( not ( = ?auto_888415 ?auto_888424 ) ) ( not ( = ?auto_888415 ?auto_888425 ) ) ( not ( = ?auto_888416 ?auto_888417 ) ) ( not ( = ?auto_888416 ?auto_888418 ) ) ( not ( = ?auto_888416 ?auto_888419 ) ) ( not ( = ?auto_888416 ?auto_888420 ) ) ( not ( = ?auto_888416 ?auto_888421 ) ) ( not ( = ?auto_888416 ?auto_888422 ) ) ( not ( = ?auto_888416 ?auto_888423 ) ) ( not ( = ?auto_888416 ?auto_888424 ) ) ( not ( = ?auto_888416 ?auto_888425 ) ) ( not ( = ?auto_888417 ?auto_888418 ) ) ( not ( = ?auto_888417 ?auto_888419 ) ) ( not ( = ?auto_888417 ?auto_888420 ) ) ( not ( = ?auto_888417 ?auto_888421 ) ) ( not ( = ?auto_888417 ?auto_888422 ) ) ( not ( = ?auto_888417 ?auto_888423 ) ) ( not ( = ?auto_888417 ?auto_888424 ) ) ( not ( = ?auto_888417 ?auto_888425 ) ) ( not ( = ?auto_888418 ?auto_888419 ) ) ( not ( = ?auto_888418 ?auto_888420 ) ) ( not ( = ?auto_888418 ?auto_888421 ) ) ( not ( = ?auto_888418 ?auto_888422 ) ) ( not ( = ?auto_888418 ?auto_888423 ) ) ( not ( = ?auto_888418 ?auto_888424 ) ) ( not ( = ?auto_888418 ?auto_888425 ) ) ( not ( = ?auto_888419 ?auto_888420 ) ) ( not ( = ?auto_888419 ?auto_888421 ) ) ( not ( = ?auto_888419 ?auto_888422 ) ) ( not ( = ?auto_888419 ?auto_888423 ) ) ( not ( = ?auto_888419 ?auto_888424 ) ) ( not ( = ?auto_888419 ?auto_888425 ) ) ( not ( = ?auto_888420 ?auto_888421 ) ) ( not ( = ?auto_888420 ?auto_888422 ) ) ( not ( = ?auto_888420 ?auto_888423 ) ) ( not ( = ?auto_888420 ?auto_888424 ) ) ( not ( = ?auto_888420 ?auto_888425 ) ) ( not ( = ?auto_888421 ?auto_888422 ) ) ( not ( = ?auto_888421 ?auto_888423 ) ) ( not ( = ?auto_888421 ?auto_888424 ) ) ( not ( = ?auto_888421 ?auto_888425 ) ) ( not ( = ?auto_888422 ?auto_888423 ) ) ( not ( = ?auto_888422 ?auto_888424 ) ) ( not ( = ?auto_888422 ?auto_888425 ) ) ( not ( = ?auto_888423 ?auto_888424 ) ) ( not ( = ?auto_888423 ?auto_888425 ) ) ( not ( = ?auto_888424 ?auto_888425 ) ) ( ON ?auto_888423 ?auto_888424 ) ( ON ?auto_888422 ?auto_888423 ) ( ON ?auto_888421 ?auto_888422 ) ( ON ?auto_888420 ?auto_888421 ) ( ON ?auto_888419 ?auto_888420 ) ( ON ?auto_888418 ?auto_888419 ) ( CLEAR ?auto_888416 ) ( ON ?auto_888417 ?auto_888418 ) ( CLEAR ?auto_888417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_888407 ?auto_888408 ?auto_888409 ?auto_888410 ?auto_888411 ?auto_888412 ?auto_888413 ?auto_888414 ?auto_888415 ?auto_888416 ?auto_888417 )
      ( MAKE-18PILE ?auto_888407 ?auto_888408 ?auto_888409 ?auto_888410 ?auto_888411 ?auto_888412 ?auto_888413 ?auto_888414 ?auto_888415 ?auto_888416 ?auto_888417 ?auto_888418 ?auto_888419 ?auto_888420 ?auto_888421 ?auto_888422 ?auto_888423 ?auto_888424 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888444 - BLOCK
      ?auto_888445 - BLOCK
      ?auto_888446 - BLOCK
      ?auto_888447 - BLOCK
      ?auto_888448 - BLOCK
      ?auto_888449 - BLOCK
      ?auto_888450 - BLOCK
      ?auto_888451 - BLOCK
      ?auto_888452 - BLOCK
      ?auto_888453 - BLOCK
      ?auto_888454 - BLOCK
      ?auto_888455 - BLOCK
      ?auto_888456 - BLOCK
      ?auto_888457 - BLOCK
      ?auto_888458 - BLOCK
      ?auto_888459 - BLOCK
      ?auto_888460 - BLOCK
      ?auto_888461 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_888461 ) ( ON-TABLE ?auto_888444 ) ( ON ?auto_888445 ?auto_888444 ) ( ON ?auto_888446 ?auto_888445 ) ( ON ?auto_888447 ?auto_888446 ) ( ON ?auto_888448 ?auto_888447 ) ( ON ?auto_888449 ?auto_888448 ) ( ON ?auto_888450 ?auto_888449 ) ( ON ?auto_888451 ?auto_888450 ) ( ON ?auto_888452 ?auto_888451 ) ( ON ?auto_888453 ?auto_888452 ) ( not ( = ?auto_888444 ?auto_888445 ) ) ( not ( = ?auto_888444 ?auto_888446 ) ) ( not ( = ?auto_888444 ?auto_888447 ) ) ( not ( = ?auto_888444 ?auto_888448 ) ) ( not ( = ?auto_888444 ?auto_888449 ) ) ( not ( = ?auto_888444 ?auto_888450 ) ) ( not ( = ?auto_888444 ?auto_888451 ) ) ( not ( = ?auto_888444 ?auto_888452 ) ) ( not ( = ?auto_888444 ?auto_888453 ) ) ( not ( = ?auto_888444 ?auto_888454 ) ) ( not ( = ?auto_888444 ?auto_888455 ) ) ( not ( = ?auto_888444 ?auto_888456 ) ) ( not ( = ?auto_888444 ?auto_888457 ) ) ( not ( = ?auto_888444 ?auto_888458 ) ) ( not ( = ?auto_888444 ?auto_888459 ) ) ( not ( = ?auto_888444 ?auto_888460 ) ) ( not ( = ?auto_888444 ?auto_888461 ) ) ( not ( = ?auto_888445 ?auto_888446 ) ) ( not ( = ?auto_888445 ?auto_888447 ) ) ( not ( = ?auto_888445 ?auto_888448 ) ) ( not ( = ?auto_888445 ?auto_888449 ) ) ( not ( = ?auto_888445 ?auto_888450 ) ) ( not ( = ?auto_888445 ?auto_888451 ) ) ( not ( = ?auto_888445 ?auto_888452 ) ) ( not ( = ?auto_888445 ?auto_888453 ) ) ( not ( = ?auto_888445 ?auto_888454 ) ) ( not ( = ?auto_888445 ?auto_888455 ) ) ( not ( = ?auto_888445 ?auto_888456 ) ) ( not ( = ?auto_888445 ?auto_888457 ) ) ( not ( = ?auto_888445 ?auto_888458 ) ) ( not ( = ?auto_888445 ?auto_888459 ) ) ( not ( = ?auto_888445 ?auto_888460 ) ) ( not ( = ?auto_888445 ?auto_888461 ) ) ( not ( = ?auto_888446 ?auto_888447 ) ) ( not ( = ?auto_888446 ?auto_888448 ) ) ( not ( = ?auto_888446 ?auto_888449 ) ) ( not ( = ?auto_888446 ?auto_888450 ) ) ( not ( = ?auto_888446 ?auto_888451 ) ) ( not ( = ?auto_888446 ?auto_888452 ) ) ( not ( = ?auto_888446 ?auto_888453 ) ) ( not ( = ?auto_888446 ?auto_888454 ) ) ( not ( = ?auto_888446 ?auto_888455 ) ) ( not ( = ?auto_888446 ?auto_888456 ) ) ( not ( = ?auto_888446 ?auto_888457 ) ) ( not ( = ?auto_888446 ?auto_888458 ) ) ( not ( = ?auto_888446 ?auto_888459 ) ) ( not ( = ?auto_888446 ?auto_888460 ) ) ( not ( = ?auto_888446 ?auto_888461 ) ) ( not ( = ?auto_888447 ?auto_888448 ) ) ( not ( = ?auto_888447 ?auto_888449 ) ) ( not ( = ?auto_888447 ?auto_888450 ) ) ( not ( = ?auto_888447 ?auto_888451 ) ) ( not ( = ?auto_888447 ?auto_888452 ) ) ( not ( = ?auto_888447 ?auto_888453 ) ) ( not ( = ?auto_888447 ?auto_888454 ) ) ( not ( = ?auto_888447 ?auto_888455 ) ) ( not ( = ?auto_888447 ?auto_888456 ) ) ( not ( = ?auto_888447 ?auto_888457 ) ) ( not ( = ?auto_888447 ?auto_888458 ) ) ( not ( = ?auto_888447 ?auto_888459 ) ) ( not ( = ?auto_888447 ?auto_888460 ) ) ( not ( = ?auto_888447 ?auto_888461 ) ) ( not ( = ?auto_888448 ?auto_888449 ) ) ( not ( = ?auto_888448 ?auto_888450 ) ) ( not ( = ?auto_888448 ?auto_888451 ) ) ( not ( = ?auto_888448 ?auto_888452 ) ) ( not ( = ?auto_888448 ?auto_888453 ) ) ( not ( = ?auto_888448 ?auto_888454 ) ) ( not ( = ?auto_888448 ?auto_888455 ) ) ( not ( = ?auto_888448 ?auto_888456 ) ) ( not ( = ?auto_888448 ?auto_888457 ) ) ( not ( = ?auto_888448 ?auto_888458 ) ) ( not ( = ?auto_888448 ?auto_888459 ) ) ( not ( = ?auto_888448 ?auto_888460 ) ) ( not ( = ?auto_888448 ?auto_888461 ) ) ( not ( = ?auto_888449 ?auto_888450 ) ) ( not ( = ?auto_888449 ?auto_888451 ) ) ( not ( = ?auto_888449 ?auto_888452 ) ) ( not ( = ?auto_888449 ?auto_888453 ) ) ( not ( = ?auto_888449 ?auto_888454 ) ) ( not ( = ?auto_888449 ?auto_888455 ) ) ( not ( = ?auto_888449 ?auto_888456 ) ) ( not ( = ?auto_888449 ?auto_888457 ) ) ( not ( = ?auto_888449 ?auto_888458 ) ) ( not ( = ?auto_888449 ?auto_888459 ) ) ( not ( = ?auto_888449 ?auto_888460 ) ) ( not ( = ?auto_888449 ?auto_888461 ) ) ( not ( = ?auto_888450 ?auto_888451 ) ) ( not ( = ?auto_888450 ?auto_888452 ) ) ( not ( = ?auto_888450 ?auto_888453 ) ) ( not ( = ?auto_888450 ?auto_888454 ) ) ( not ( = ?auto_888450 ?auto_888455 ) ) ( not ( = ?auto_888450 ?auto_888456 ) ) ( not ( = ?auto_888450 ?auto_888457 ) ) ( not ( = ?auto_888450 ?auto_888458 ) ) ( not ( = ?auto_888450 ?auto_888459 ) ) ( not ( = ?auto_888450 ?auto_888460 ) ) ( not ( = ?auto_888450 ?auto_888461 ) ) ( not ( = ?auto_888451 ?auto_888452 ) ) ( not ( = ?auto_888451 ?auto_888453 ) ) ( not ( = ?auto_888451 ?auto_888454 ) ) ( not ( = ?auto_888451 ?auto_888455 ) ) ( not ( = ?auto_888451 ?auto_888456 ) ) ( not ( = ?auto_888451 ?auto_888457 ) ) ( not ( = ?auto_888451 ?auto_888458 ) ) ( not ( = ?auto_888451 ?auto_888459 ) ) ( not ( = ?auto_888451 ?auto_888460 ) ) ( not ( = ?auto_888451 ?auto_888461 ) ) ( not ( = ?auto_888452 ?auto_888453 ) ) ( not ( = ?auto_888452 ?auto_888454 ) ) ( not ( = ?auto_888452 ?auto_888455 ) ) ( not ( = ?auto_888452 ?auto_888456 ) ) ( not ( = ?auto_888452 ?auto_888457 ) ) ( not ( = ?auto_888452 ?auto_888458 ) ) ( not ( = ?auto_888452 ?auto_888459 ) ) ( not ( = ?auto_888452 ?auto_888460 ) ) ( not ( = ?auto_888452 ?auto_888461 ) ) ( not ( = ?auto_888453 ?auto_888454 ) ) ( not ( = ?auto_888453 ?auto_888455 ) ) ( not ( = ?auto_888453 ?auto_888456 ) ) ( not ( = ?auto_888453 ?auto_888457 ) ) ( not ( = ?auto_888453 ?auto_888458 ) ) ( not ( = ?auto_888453 ?auto_888459 ) ) ( not ( = ?auto_888453 ?auto_888460 ) ) ( not ( = ?auto_888453 ?auto_888461 ) ) ( not ( = ?auto_888454 ?auto_888455 ) ) ( not ( = ?auto_888454 ?auto_888456 ) ) ( not ( = ?auto_888454 ?auto_888457 ) ) ( not ( = ?auto_888454 ?auto_888458 ) ) ( not ( = ?auto_888454 ?auto_888459 ) ) ( not ( = ?auto_888454 ?auto_888460 ) ) ( not ( = ?auto_888454 ?auto_888461 ) ) ( not ( = ?auto_888455 ?auto_888456 ) ) ( not ( = ?auto_888455 ?auto_888457 ) ) ( not ( = ?auto_888455 ?auto_888458 ) ) ( not ( = ?auto_888455 ?auto_888459 ) ) ( not ( = ?auto_888455 ?auto_888460 ) ) ( not ( = ?auto_888455 ?auto_888461 ) ) ( not ( = ?auto_888456 ?auto_888457 ) ) ( not ( = ?auto_888456 ?auto_888458 ) ) ( not ( = ?auto_888456 ?auto_888459 ) ) ( not ( = ?auto_888456 ?auto_888460 ) ) ( not ( = ?auto_888456 ?auto_888461 ) ) ( not ( = ?auto_888457 ?auto_888458 ) ) ( not ( = ?auto_888457 ?auto_888459 ) ) ( not ( = ?auto_888457 ?auto_888460 ) ) ( not ( = ?auto_888457 ?auto_888461 ) ) ( not ( = ?auto_888458 ?auto_888459 ) ) ( not ( = ?auto_888458 ?auto_888460 ) ) ( not ( = ?auto_888458 ?auto_888461 ) ) ( not ( = ?auto_888459 ?auto_888460 ) ) ( not ( = ?auto_888459 ?auto_888461 ) ) ( not ( = ?auto_888460 ?auto_888461 ) ) ( ON ?auto_888460 ?auto_888461 ) ( ON ?auto_888459 ?auto_888460 ) ( ON ?auto_888458 ?auto_888459 ) ( ON ?auto_888457 ?auto_888458 ) ( ON ?auto_888456 ?auto_888457 ) ( ON ?auto_888455 ?auto_888456 ) ( CLEAR ?auto_888453 ) ( ON ?auto_888454 ?auto_888455 ) ( CLEAR ?auto_888454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_888444 ?auto_888445 ?auto_888446 ?auto_888447 ?auto_888448 ?auto_888449 ?auto_888450 ?auto_888451 ?auto_888452 ?auto_888453 ?auto_888454 )
      ( MAKE-18PILE ?auto_888444 ?auto_888445 ?auto_888446 ?auto_888447 ?auto_888448 ?auto_888449 ?auto_888450 ?auto_888451 ?auto_888452 ?auto_888453 ?auto_888454 ?auto_888455 ?auto_888456 ?auto_888457 ?auto_888458 ?auto_888459 ?auto_888460 ?auto_888461 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888480 - BLOCK
      ?auto_888481 - BLOCK
      ?auto_888482 - BLOCK
      ?auto_888483 - BLOCK
      ?auto_888484 - BLOCK
      ?auto_888485 - BLOCK
      ?auto_888486 - BLOCK
      ?auto_888487 - BLOCK
      ?auto_888488 - BLOCK
      ?auto_888489 - BLOCK
      ?auto_888490 - BLOCK
      ?auto_888491 - BLOCK
      ?auto_888492 - BLOCK
      ?auto_888493 - BLOCK
      ?auto_888494 - BLOCK
      ?auto_888495 - BLOCK
      ?auto_888496 - BLOCK
      ?auto_888497 - BLOCK
    )
    :vars
    (
      ?auto_888498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_888497 ?auto_888498 ) ( ON-TABLE ?auto_888480 ) ( ON ?auto_888481 ?auto_888480 ) ( ON ?auto_888482 ?auto_888481 ) ( ON ?auto_888483 ?auto_888482 ) ( ON ?auto_888484 ?auto_888483 ) ( ON ?auto_888485 ?auto_888484 ) ( ON ?auto_888486 ?auto_888485 ) ( ON ?auto_888487 ?auto_888486 ) ( ON ?auto_888488 ?auto_888487 ) ( not ( = ?auto_888480 ?auto_888481 ) ) ( not ( = ?auto_888480 ?auto_888482 ) ) ( not ( = ?auto_888480 ?auto_888483 ) ) ( not ( = ?auto_888480 ?auto_888484 ) ) ( not ( = ?auto_888480 ?auto_888485 ) ) ( not ( = ?auto_888480 ?auto_888486 ) ) ( not ( = ?auto_888480 ?auto_888487 ) ) ( not ( = ?auto_888480 ?auto_888488 ) ) ( not ( = ?auto_888480 ?auto_888489 ) ) ( not ( = ?auto_888480 ?auto_888490 ) ) ( not ( = ?auto_888480 ?auto_888491 ) ) ( not ( = ?auto_888480 ?auto_888492 ) ) ( not ( = ?auto_888480 ?auto_888493 ) ) ( not ( = ?auto_888480 ?auto_888494 ) ) ( not ( = ?auto_888480 ?auto_888495 ) ) ( not ( = ?auto_888480 ?auto_888496 ) ) ( not ( = ?auto_888480 ?auto_888497 ) ) ( not ( = ?auto_888480 ?auto_888498 ) ) ( not ( = ?auto_888481 ?auto_888482 ) ) ( not ( = ?auto_888481 ?auto_888483 ) ) ( not ( = ?auto_888481 ?auto_888484 ) ) ( not ( = ?auto_888481 ?auto_888485 ) ) ( not ( = ?auto_888481 ?auto_888486 ) ) ( not ( = ?auto_888481 ?auto_888487 ) ) ( not ( = ?auto_888481 ?auto_888488 ) ) ( not ( = ?auto_888481 ?auto_888489 ) ) ( not ( = ?auto_888481 ?auto_888490 ) ) ( not ( = ?auto_888481 ?auto_888491 ) ) ( not ( = ?auto_888481 ?auto_888492 ) ) ( not ( = ?auto_888481 ?auto_888493 ) ) ( not ( = ?auto_888481 ?auto_888494 ) ) ( not ( = ?auto_888481 ?auto_888495 ) ) ( not ( = ?auto_888481 ?auto_888496 ) ) ( not ( = ?auto_888481 ?auto_888497 ) ) ( not ( = ?auto_888481 ?auto_888498 ) ) ( not ( = ?auto_888482 ?auto_888483 ) ) ( not ( = ?auto_888482 ?auto_888484 ) ) ( not ( = ?auto_888482 ?auto_888485 ) ) ( not ( = ?auto_888482 ?auto_888486 ) ) ( not ( = ?auto_888482 ?auto_888487 ) ) ( not ( = ?auto_888482 ?auto_888488 ) ) ( not ( = ?auto_888482 ?auto_888489 ) ) ( not ( = ?auto_888482 ?auto_888490 ) ) ( not ( = ?auto_888482 ?auto_888491 ) ) ( not ( = ?auto_888482 ?auto_888492 ) ) ( not ( = ?auto_888482 ?auto_888493 ) ) ( not ( = ?auto_888482 ?auto_888494 ) ) ( not ( = ?auto_888482 ?auto_888495 ) ) ( not ( = ?auto_888482 ?auto_888496 ) ) ( not ( = ?auto_888482 ?auto_888497 ) ) ( not ( = ?auto_888482 ?auto_888498 ) ) ( not ( = ?auto_888483 ?auto_888484 ) ) ( not ( = ?auto_888483 ?auto_888485 ) ) ( not ( = ?auto_888483 ?auto_888486 ) ) ( not ( = ?auto_888483 ?auto_888487 ) ) ( not ( = ?auto_888483 ?auto_888488 ) ) ( not ( = ?auto_888483 ?auto_888489 ) ) ( not ( = ?auto_888483 ?auto_888490 ) ) ( not ( = ?auto_888483 ?auto_888491 ) ) ( not ( = ?auto_888483 ?auto_888492 ) ) ( not ( = ?auto_888483 ?auto_888493 ) ) ( not ( = ?auto_888483 ?auto_888494 ) ) ( not ( = ?auto_888483 ?auto_888495 ) ) ( not ( = ?auto_888483 ?auto_888496 ) ) ( not ( = ?auto_888483 ?auto_888497 ) ) ( not ( = ?auto_888483 ?auto_888498 ) ) ( not ( = ?auto_888484 ?auto_888485 ) ) ( not ( = ?auto_888484 ?auto_888486 ) ) ( not ( = ?auto_888484 ?auto_888487 ) ) ( not ( = ?auto_888484 ?auto_888488 ) ) ( not ( = ?auto_888484 ?auto_888489 ) ) ( not ( = ?auto_888484 ?auto_888490 ) ) ( not ( = ?auto_888484 ?auto_888491 ) ) ( not ( = ?auto_888484 ?auto_888492 ) ) ( not ( = ?auto_888484 ?auto_888493 ) ) ( not ( = ?auto_888484 ?auto_888494 ) ) ( not ( = ?auto_888484 ?auto_888495 ) ) ( not ( = ?auto_888484 ?auto_888496 ) ) ( not ( = ?auto_888484 ?auto_888497 ) ) ( not ( = ?auto_888484 ?auto_888498 ) ) ( not ( = ?auto_888485 ?auto_888486 ) ) ( not ( = ?auto_888485 ?auto_888487 ) ) ( not ( = ?auto_888485 ?auto_888488 ) ) ( not ( = ?auto_888485 ?auto_888489 ) ) ( not ( = ?auto_888485 ?auto_888490 ) ) ( not ( = ?auto_888485 ?auto_888491 ) ) ( not ( = ?auto_888485 ?auto_888492 ) ) ( not ( = ?auto_888485 ?auto_888493 ) ) ( not ( = ?auto_888485 ?auto_888494 ) ) ( not ( = ?auto_888485 ?auto_888495 ) ) ( not ( = ?auto_888485 ?auto_888496 ) ) ( not ( = ?auto_888485 ?auto_888497 ) ) ( not ( = ?auto_888485 ?auto_888498 ) ) ( not ( = ?auto_888486 ?auto_888487 ) ) ( not ( = ?auto_888486 ?auto_888488 ) ) ( not ( = ?auto_888486 ?auto_888489 ) ) ( not ( = ?auto_888486 ?auto_888490 ) ) ( not ( = ?auto_888486 ?auto_888491 ) ) ( not ( = ?auto_888486 ?auto_888492 ) ) ( not ( = ?auto_888486 ?auto_888493 ) ) ( not ( = ?auto_888486 ?auto_888494 ) ) ( not ( = ?auto_888486 ?auto_888495 ) ) ( not ( = ?auto_888486 ?auto_888496 ) ) ( not ( = ?auto_888486 ?auto_888497 ) ) ( not ( = ?auto_888486 ?auto_888498 ) ) ( not ( = ?auto_888487 ?auto_888488 ) ) ( not ( = ?auto_888487 ?auto_888489 ) ) ( not ( = ?auto_888487 ?auto_888490 ) ) ( not ( = ?auto_888487 ?auto_888491 ) ) ( not ( = ?auto_888487 ?auto_888492 ) ) ( not ( = ?auto_888487 ?auto_888493 ) ) ( not ( = ?auto_888487 ?auto_888494 ) ) ( not ( = ?auto_888487 ?auto_888495 ) ) ( not ( = ?auto_888487 ?auto_888496 ) ) ( not ( = ?auto_888487 ?auto_888497 ) ) ( not ( = ?auto_888487 ?auto_888498 ) ) ( not ( = ?auto_888488 ?auto_888489 ) ) ( not ( = ?auto_888488 ?auto_888490 ) ) ( not ( = ?auto_888488 ?auto_888491 ) ) ( not ( = ?auto_888488 ?auto_888492 ) ) ( not ( = ?auto_888488 ?auto_888493 ) ) ( not ( = ?auto_888488 ?auto_888494 ) ) ( not ( = ?auto_888488 ?auto_888495 ) ) ( not ( = ?auto_888488 ?auto_888496 ) ) ( not ( = ?auto_888488 ?auto_888497 ) ) ( not ( = ?auto_888488 ?auto_888498 ) ) ( not ( = ?auto_888489 ?auto_888490 ) ) ( not ( = ?auto_888489 ?auto_888491 ) ) ( not ( = ?auto_888489 ?auto_888492 ) ) ( not ( = ?auto_888489 ?auto_888493 ) ) ( not ( = ?auto_888489 ?auto_888494 ) ) ( not ( = ?auto_888489 ?auto_888495 ) ) ( not ( = ?auto_888489 ?auto_888496 ) ) ( not ( = ?auto_888489 ?auto_888497 ) ) ( not ( = ?auto_888489 ?auto_888498 ) ) ( not ( = ?auto_888490 ?auto_888491 ) ) ( not ( = ?auto_888490 ?auto_888492 ) ) ( not ( = ?auto_888490 ?auto_888493 ) ) ( not ( = ?auto_888490 ?auto_888494 ) ) ( not ( = ?auto_888490 ?auto_888495 ) ) ( not ( = ?auto_888490 ?auto_888496 ) ) ( not ( = ?auto_888490 ?auto_888497 ) ) ( not ( = ?auto_888490 ?auto_888498 ) ) ( not ( = ?auto_888491 ?auto_888492 ) ) ( not ( = ?auto_888491 ?auto_888493 ) ) ( not ( = ?auto_888491 ?auto_888494 ) ) ( not ( = ?auto_888491 ?auto_888495 ) ) ( not ( = ?auto_888491 ?auto_888496 ) ) ( not ( = ?auto_888491 ?auto_888497 ) ) ( not ( = ?auto_888491 ?auto_888498 ) ) ( not ( = ?auto_888492 ?auto_888493 ) ) ( not ( = ?auto_888492 ?auto_888494 ) ) ( not ( = ?auto_888492 ?auto_888495 ) ) ( not ( = ?auto_888492 ?auto_888496 ) ) ( not ( = ?auto_888492 ?auto_888497 ) ) ( not ( = ?auto_888492 ?auto_888498 ) ) ( not ( = ?auto_888493 ?auto_888494 ) ) ( not ( = ?auto_888493 ?auto_888495 ) ) ( not ( = ?auto_888493 ?auto_888496 ) ) ( not ( = ?auto_888493 ?auto_888497 ) ) ( not ( = ?auto_888493 ?auto_888498 ) ) ( not ( = ?auto_888494 ?auto_888495 ) ) ( not ( = ?auto_888494 ?auto_888496 ) ) ( not ( = ?auto_888494 ?auto_888497 ) ) ( not ( = ?auto_888494 ?auto_888498 ) ) ( not ( = ?auto_888495 ?auto_888496 ) ) ( not ( = ?auto_888495 ?auto_888497 ) ) ( not ( = ?auto_888495 ?auto_888498 ) ) ( not ( = ?auto_888496 ?auto_888497 ) ) ( not ( = ?auto_888496 ?auto_888498 ) ) ( not ( = ?auto_888497 ?auto_888498 ) ) ( ON ?auto_888496 ?auto_888497 ) ( ON ?auto_888495 ?auto_888496 ) ( ON ?auto_888494 ?auto_888495 ) ( ON ?auto_888493 ?auto_888494 ) ( ON ?auto_888492 ?auto_888493 ) ( ON ?auto_888491 ?auto_888492 ) ( ON ?auto_888490 ?auto_888491 ) ( CLEAR ?auto_888488 ) ( ON ?auto_888489 ?auto_888490 ) ( CLEAR ?auto_888489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_888480 ?auto_888481 ?auto_888482 ?auto_888483 ?auto_888484 ?auto_888485 ?auto_888486 ?auto_888487 ?auto_888488 ?auto_888489 )
      ( MAKE-18PILE ?auto_888480 ?auto_888481 ?auto_888482 ?auto_888483 ?auto_888484 ?auto_888485 ?auto_888486 ?auto_888487 ?auto_888488 ?auto_888489 ?auto_888490 ?auto_888491 ?auto_888492 ?auto_888493 ?auto_888494 ?auto_888495 ?auto_888496 ?auto_888497 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888517 - BLOCK
      ?auto_888518 - BLOCK
      ?auto_888519 - BLOCK
      ?auto_888520 - BLOCK
      ?auto_888521 - BLOCK
      ?auto_888522 - BLOCK
      ?auto_888523 - BLOCK
      ?auto_888524 - BLOCK
      ?auto_888525 - BLOCK
      ?auto_888526 - BLOCK
      ?auto_888527 - BLOCK
      ?auto_888528 - BLOCK
      ?auto_888529 - BLOCK
      ?auto_888530 - BLOCK
      ?auto_888531 - BLOCK
      ?auto_888532 - BLOCK
      ?auto_888533 - BLOCK
      ?auto_888534 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_888534 ) ( ON-TABLE ?auto_888517 ) ( ON ?auto_888518 ?auto_888517 ) ( ON ?auto_888519 ?auto_888518 ) ( ON ?auto_888520 ?auto_888519 ) ( ON ?auto_888521 ?auto_888520 ) ( ON ?auto_888522 ?auto_888521 ) ( ON ?auto_888523 ?auto_888522 ) ( ON ?auto_888524 ?auto_888523 ) ( ON ?auto_888525 ?auto_888524 ) ( not ( = ?auto_888517 ?auto_888518 ) ) ( not ( = ?auto_888517 ?auto_888519 ) ) ( not ( = ?auto_888517 ?auto_888520 ) ) ( not ( = ?auto_888517 ?auto_888521 ) ) ( not ( = ?auto_888517 ?auto_888522 ) ) ( not ( = ?auto_888517 ?auto_888523 ) ) ( not ( = ?auto_888517 ?auto_888524 ) ) ( not ( = ?auto_888517 ?auto_888525 ) ) ( not ( = ?auto_888517 ?auto_888526 ) ) ( not ( = ?auto_888517 ?auto_888527 ) ) ( not ( = ?auto_888517 ?auto_888528 ) ) ( not ( = ?auto_888517 ?auto_888529 ) ) ( not ( = ?auto_888517 ?auto_888530 ) ) ( not ( = ?auto_888517 ?auto_888531 ) ) ( not ( = ?auto_888517 ?auto_888532 ) ) ( not ( = ?auto_888517 ?auto_888533 ) ) ( not ( = ?auto_888517 ?auto_888534 ) ) ( not ( = ?auto_888518 ?auto_888519 ) ) ( not ( = ?auto_888518 ?auto_888520 ) ) ( not ( = ?auto_888518 ?auto_888521 ) ) ( not ( = ?auto_888518 ?auto_888522 ) ) ( not ( = ?auto_888518 ?auto_888523 ) ) ( not ( = ?auto_888518 ?auto_888524 ) ) ( not ( = ?auto_888518 ?auto_888525 ) ) ( not ( = ?auto_888518 ?auto_888526 ) ) ( not ( = ?auto_888518 ?auto_888527 ) ) ( not ( = ?auto_888518 ?auto_888528 ) ) ( not ( = ?auto_888518 ?auto_888529 ) ) ( not ( = ?auto_888518 ?auto_888530 ) ) ( not ( = ?auto_888518 ?auto_888531 ) ) ( not ( = ?auto_888518 ?auto_888532 ) ) ( not ( = ?auto_888518 ?auto_888533 ) ) ( not ( = ?auto_888518 ?auto_888534 ) ) ( not ( = ?auto_888519 ?auto_888520 ) ) ( not ( = ?auto_888519 ?auto_888521 ) ) ( not ( = ?auto_888519 ?auto_888522 ) ) ( not ( = ?auto_888519 ?auto_888523 ) ) ( not ( = ?auto_888519 ?auto_888524 ) ) ( not ( = ?auto_888519 ?auto_888525 ) ) ( not ( = ?auto_888519 ?auto_888526 ) ) ( not ( = ?auto_888519 ?auto_888527 ) ) ( not ( = ?auto_888519 ?auto_888528 ) ) ( not ( = ?auto_888519 ?auto_888529 ) ) ( not ( = ?auto_888519 ?auto_888530 ) ) ( not ( = ?auto_888519 ?auto_888531 ) ) ( not ( = ?auto_888519 ?auto_888532 ) ) ( not ( = ?auto_888519 ?auto_888533 ) ) ( not ( = ?auto_888519 ?auto_888534 ) ) ( not ( = ?auto_888520 ?auto_888521 ) ) ( not ( = ?auto_888520 ?auto_888522 ) ) ( not ( = ?auto_888520 ?auto_888523 ) ) ( not ( = ?auto_888520 ?auto_888524 ) ) ( not ( = ?auto_888520 ?auto_888525 ) ) ( not ( = ?auto_888520 ?auto_888526 ) ) ( not ( = ?auto_888520 ?auto_888527 ) ) ( not ( = ?auto_888520 ?auto_888528 ) ) ( not ( = ?auto_888520 ?auto_888529 ) ) ( not ( = ?auto_888520 ?auto_888530 ) ) ( not ( = ?auto_888520 ?auto_888531 ) ) ( not ( = ?auto_888520 ?auto_888532 ) ) ( not ( = ?auto_888520 ?auto_888533 ) ) ( not ( = ?auto_888520 ?auto_888534 ) ) ( not ( = ?auto_888521 ?auto_888522 ) ) ( not ( = ?auto_888521 ?auto_888523 ) ) ( not ( = ?auto_888521 ?auto_888524 ) ) ( not ( = ?auto_888521 ?auto_888525 ) ) ( not ( = ?auto_888521 ?auto_888526 ) ) ( not ( = ?auto_888521 ?auto_888527 ) ) ( not ( = ?auto_888521 ?auto_888528 ) ) ( not ( = ?auto_888521 ?auto_888529 ) ) ( not ( = ?auto_888521 ?auto_888530 ) ) ( not ( = ?auto_888521 ?auto_888531 ) ) ( not ( = ?auto_888521 ?auto_888532 ) ) ( not ( = ?auto_888521 ?auto_888533 ) ) ( not ( = ?auto_888521 ?auto_888534 ) ) ( not ( = ?auto_888522 ?auto_888523 ) ) ( not ( = ?auto_888522 ?auto_888524 ) ) ( not ( = ?auto_888522 ?auto_888525 ) ) ( not ( = ?auto_888522 ?auto_888526 ) ) ( not ( = ?auto_888522 ?auto_888527 ) ) ( not ( = ?auto_888522 ?auto_888528 ) ) ( not ( = ?auto_888522 ?auto_888529 ) ) ( not ( = ?auto_888522 ?auto_888530 ) ) ( not ( = ?auto_888522 ?auto_888531 ) ) ( not ( = ?auto_888522 ?auto_888532 ) ) ( not ( = ?auto_888522 ?auto_888533 ) ) ( not ( = ?auto_888522 ?auto_888534 ) ) ( not ( = ?auto_888523 ?auto_888524 ) ) ( not ( = ?auto_888523 ?auto_888525 ) ) ( not ( = ?auto_888523 ?auto_888526 ) ) ( not ( = ?auto_888523 ?auto_888527 ) ) ( not ( = ?auto_888523 ?auto_888528 ) ) ( not ( = ?auto_888523 ?auto_888529 ) ) ( not ( = ?auto_888523 ?auto_888530 ) ) ( not ( = ?auto_888523 ?auto_888531 ) ) ( not ( = ?auto_888523 ?auto_888532 ) ) ( not ( = ?auto_888523 ?auto_888533 ) ) ( not ( = ?auto_888523 ?auto_888534 ) ) ( not ( = ?auto_888524 ?auto_888525 ) ) ( not ( = ?auto_888524 ?auto_888526 ) ) ( not ( = ?auto_888524 ?auto_888527 ) ) ( not ( = ?auto_888524 ?auto_888528 ) ) ( not ( = ?auto_888524 ?auto_888529 ) ) ( not ( = ?auto_888524 ?auto_888530 ) ) ( not ( = ?auto_888524 ?auto_888531 ) ) ( not ( = ?auto_888524 ?auto_888532 ) ) ( not ( = ?auto_888524 ?auto_888533 ) ) ( not ( = ?auto_888524 ?auto_888534 ) ) ( not ( = ?auto_888525 ?auto_888526 ) ) ( not ( = ?auto_888525 ?auto_888527 ) ) ( not ( = ?auto_888525 ?auto_888528 ) ) ( not ( = ?auto_888525 ?auto_888529 ) ) ( not ( = ?auto_888525 ?auto_888530 ) ) ( not ( = ?auto_888525 ?auto_888531 ) ) ( not ( = ?auto_888525 ?auto_888532 ) ) ( not ( = ?auto_888525 ?auto_888533 ) ) ( not ( = ?auto_888525 ?auto_888534 ) ) ( not ( = ?auto_888526 ?auto_888527 ) ) ( not ( = ?auto_888526 ?auto_888528 ) ) ( not ( = ?auto_888526 ?auto_888529 ) ) ( not ( = ?auto_888526 ?auto_888530 ) ) ( not ( = ?auto_888526 ?auto_888531 ) ) ( not ( = ?auto_888526 ?auto_888532 ) ) ( not ( = ?auto_888526 ?auto_888533 ) ) ( not ( = ?auto_888526 ?auto_888534 ) ) ( not ( = ?auto_888527 ?auto_888528 ) ) ( not ( = ?auto_888527 ?auto_888529 ) ) ( not ( = ?auto_888527 ?auto_888530 ) ) ( not ( = ?auto_888527 ?auto_888531 ) ) ( not ( = ?auto_888527 ?auto_888532 ) ) ( not ( = ?auto_888527 ?auto_888533 ) ) ( not ( = ?auto_888527 ?auto_888534 ) ) ( not ( = ?auto_888528 ?auto_888529 ) ) ( not ( = ?auto_888528 ?auto_888530 ) ) ( not ( = ?auto_888528 ?auto_888531 ) ) ( not ( = ?auto_888528 ?auto_888532 ) ) ( not ( = ?auto_888528 ?auto_888533 ) ) ( not ( = ?auto_888528 ?auto_888534 ) ) ( not ( = ?auto_888529 ?auto_888530 ) ) ( not ( = ?auto_888529 ?auto_888531 ) ) ( not ( = ?auto_888529 ?auto_888532 ) ) ( not ( = ?auto_888529 ?auto_888533 ) ) ( not ( = ?auto_888529 ?auto_888534 ) ) ( not ( = ?auto_888530 ?auto_888531 ) ) ( not ( = ?auto_888530 ?auto_888532 ) ) ( not ( = ?auto_888530 ?auto_888533 ) ) ( not ( = ?auto_888530 ?auto_888534 ) ) ( not ( = ?auto_888531 ?auto_888532 ) ) ( not ( = ?auto_888531 ?auto_888533 ) ) ( not ( = ?auto_888531 ?auto_888534 ) ) ( not ( = ?auto_888532 ?auto_888533 ) ) ( not ( = ?auto_888532 ?auto_888534 ) ) ( not ( = ?auto_888533 ?auto_888534 ) ) ( ON ?auto_888533 ?auto_888534 ) ( ON ?auto_888532 ?auto_888533 ) ( ON ?auto_888531 ?auto_888532 ) ( ON ?auto_888530 ?auto_888531 ) ( ON ?auto_888529 ?auto_888530 ) ( ON ?auto_888528 ?auto_888529 ) ( ON ?auto_888527 ?auto_888528 ) ( CLEAR ?auto_888525 ) ( ON ?auto_888526 ?auto_888527 ) ( CLEAR ?auto_888526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_888517 ?auto_888518 ?auto_888519 ?auto_888520 ?auto_888521 ?auto_888522 ?auto_888523 ?auto_888524 ?auto_888525 ?auto_888526 )
      ( MAKE-18PILE ?auto_888517 ?auto_888518 ?auto_888519 ?auto_888520 ?auto_888521 ?auto_888522 ?auto_888523 ?auto_888524 ?auto_888525 ?auto_888526 ?auto_888527 ?auto_888528 ?auto_888529 ?auto_888530 ?auto_888531 ?auto_888532 ?auto_888533 ?auto_888534 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888553 - BLOCK
      ?auto_888554 - BLOCK
      ?auto_888555 - BLOCK
      ?auto_888556 - BLOCK
      ?auto_888557 - BLOCK
      ?auto_888558 - BLOCK
      ?auto_888559 - BLOCK
      ?auto_888560 - BLOCK
      ?auto_888561 - BLOCK
      ?auto_888562 - BLOCK
      ?auto_888563 - BLOCK
      ?auto_888564 - BLOCK
      ?auto_888565 - BLOCK
      ?auto_888566 - BLOCK
      ?auto_888567 - BLOCK
      ?auto_888568 - BLOCK
      ?auto_888569 - BLOCK
      ?auto_888570 - BLOCK
    )
    :vars
    (
      ?auto_888571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_888570 ?auto_888571 ) ( ON-TABLE ?auto_888553 ) ( ON ?auto_888554 ?auto_888553 ) ( ON ?auto_888555 ?auto_888554 ) ( ON ?auto_888556 ?auto_888555 ) ( ON ?auto_888557 ?auto_888556 ) ( ON ?auto_888558 ?auto_888557 ) ( ON ?auto_888559 ?auto_888558 ) ( ON ?auto_888560 ?auto_888559 ) ( not ( = ?auto_888553 ?auto_888554 ) ) ( not ( = ?auto_888553 ?auto_888555 ) ) ( not ( = ?auto_888553 ?auto_888556 ) ) ( not ( = ?auto_888553 ?auto_888557 ) ) ( not ( = ?auto_888553 ?auto_888558 ) ) ( not ( = ?auto_888553 ?auto_888559 ) ) ( not ( = ?auto_888553 ?auto_888560 ) ) ( not ( = ?auto_888553 ?auto_888561 ) ) ( not ( = ?auto_888553 ?auto_888562 ) ) ( not ( = ?auto_888553 ?auto_888563 ) ) ( not ( = ?auto_888553 ?auto_888564 ) ) ( not ( = ?auto_888553 ?auto_888565 ) ) ( not ( = ?auto_888553 ?auto_888566 ) ) ( not ( = ?auto_888553 ?auto_888567 ) ) ( not ( = ?auto_888553 ?auto_888568 ) ) ( not ( = ?auto_888553 ?auto_888569 ) ) ( not ( = ?auto_888553 ?auto_888570 ) ) ( not ( = ?auto_888553 ?auto_888571 ) ) ( not ( = ?auto_888554 ?auto_888555 ) ) ( not ( = ?auto_888554 ?auto_888556 ) ) ( not ( = ?auto_888554 ?auto_888557 ) ) ( not ( = ?auto_888554 ?auto_888558 ) ) ( not ( = ?auto_888554 ?auto_888559 ) ) ( not ( = ?auto_888554 ?auto_888560 ) ) ( not ( = ?auto_888554 ?auto_888561 ) ) ( not ( = ?auto_888554 ?auto_888562 ) ) ( not ( = ?auto_888554 ?auto_888563 ) ) ( not ( = ?auto_888554 ?auto_888564 ) ) ( not ( = ?auto_888554 ?auto_888565 ) ) ( not ( = ?auto_888554 ?auto_888566 ) ) ( not ( = ?auto_888554 ?auto_888567 ) ) ( not ( = ?auto_888554 ?auto_888568 ) ) ( not ( = ?auto_888554 ?auto_888569 ) ) ( not ( = ?auto_888554 ?auto_888570 ) ) ( not ( = ?auto_888554 ?auto_888571 ) ) ( not ( = ?auto_888555 ?auto_888556 ) ) ( not ( = ?auto_888555 ?auto_888557 ) ) ( not ( = ?auto_888555 ?auto_888558 ) ) ( not ( = ?auto_888555 ?auto_888559 ) ) ( not ( = ?auto_888555 ?auto_888560 ) ) ( not ( = ?auto_888555 ?auto_888561 ) ) ( not ( = ?auto_888555 ?auto_888562 ) ) ( not ( = ?auto_888555 ?auto_888563 ) ) ( not ( = ?auto_888555 ?auto_888564 ) ) ( not ( = ?auto_888555 ?auto_888565 ) ) ( not ( = ?auto_888555 ?auto_888566 ) ) ( not ( = ?auto_888555 ?auto_888567 ) ) ( not ( = ?auto_888555 ?auto_888568 ) ) ( not ( = ?auto_888555 ?auto_888569 ) ) ( not ( = ?auto_888555 ?auto_888570 ) ) ( not ( = ?auto_888555 ?auto_888571 ) ) ( not ( = ?auto_888556 ?auto_888557 ) ) ( not ( = ?auto_888556 ?auto_888558 ) ) ( not ( = ?auto_888556 ?auto_888559 ) ) ( not ( = ?auto_888556 ?auto_888560 ) ) ( not ( = ?auto_888556 ?auto_888561 ) ) ( not ( = ?auto_888556 ?auto_888562 ) ) ( not ( = ?auto_888556 ?auto_888563 ) ) ( not ( = ?auto_888556 ?auto_888564 ) ) ( not ( = ?auto_888556 ?auto_888565 ) ) ( not ( = ?auto_888556 ?auto_888566 ) ) ( not ( = ?auto_888556 ?auto_888567 ) ) ( not ( = ?auto_888556 ?auto_888568 ) ) ( not ( = ?auto_888556 ?auto_888569 ) ) ( not ( = ?auto_888556 ?auto_888570 ) ) ( not ( = ?auto_888556 ?auto_888571 ) ) ( not ( = ?auto_888557 ?auto_888558 ) ) ( not ( = ?auto_888557 ?auto_888559 ) ) ( not ( = ?auto_888557 ?auto_888560 ) ) ( not ( = ?auto_888557 ?auto_888561 ) ) ( not ( = ?auto_888557 ?auto_888562 ) ) ( not ( = ?auto_888557 ?auto_888563 ) ) ( not ( = ?auto_888557 ?auto_888564 ) ) ( not ( = ?auto_888557 ?auto_888565 ) ) ( not ( = ?auto_888557 ?auto_888566 ) ) ( not ( = ?auto_888557 ?auto_888567 ) ) ( not ( = ?auto_888557 ?auto_888568 ) ) ( not ( = ?auto_888557 ?auto_888569 ) ) ( not ( = ?auto_888557 ?auto_888570 ) ) ( not ( = ?auto_888557 ?auto_888571 ) ) ( not ( = ?auto_888558 ?auto_888559 ) ) ( not ( = ?auto_888558 ?auto_888560 ) ) ( not ( = ?auto_888558 ?auto_888561 ) ) ( not ( = ?auto_888558 ?auto_888562 ) ) ( not ( = ?auto_888558 ?auto_888563 ) ) ( not ( = ?auto_888558 ?auto_888564 ) ) ( not ( = ?auto_888558 ?auto_888565 ) ) ( not ( = ?auto_888558 ?auto_888566 ) ) ( not ( = ?auto_888558 ?auto_888567 ) ) ( not ( = ?auto_888558 ?auto_888568 ) ) ( not ( = ?auto_888558 ?auto_888569 ) ) ( not ( = ?auto_888558 ?auto_888570 ) ) ( not ( = ?auto_888558 ?auto_888571 ) ) ( not ( = ?auto_888559 ?auto_888560 ) ) ( not ( = ?auto_888559 ?auto_888561 ) ) ( not ( = ?auto_888559 ?auto_888562 ) ) ( not ( = ?auto_888559 ?auto_888563 ) ) ( not ( = ?auto_888559 ?auto_888564 ) ) ( not ( = ?auto_888559 ?auto_888565 ) ) ( not ( = ?auto_888559 ?auto_888566 ) ) ( not ( = ?auto_888559 ?auto_888567 ) ) ( not ( = ?auto_888559 ?auto_888568 ) ) ( not ( = ?auto_888559 ?auto_888569 ) ) ( not ( = ?auto_888559 ?auto_888570 ) ) ( not ( = ?auto_888559 ?auto_888571 ) ) ( not ( = ?auto_888560 ?auto_888561 ) ) ( not ( = ?auto_888560 ?auto_888562 ) ) ( not ( = ?auto_888560 ?auto_888563 ) ) ( not ( = ?auto_888560 ?auto_888564 ) ) ( not ( = ?auto_888560 ?auto_888565 ) ) ( not ( = ?auto_888560 ?auto_888566 ) ) ( not ( = ?auto_888560 ?auto_888567 ) ) ( not ( = ?auto_888560 ?auto_888568 ) ) ( not ( = ?auto_888560 ?auto_888569 ) ) ( not ( = ?auto_888560 ?auto_888570 ) ) ( not ( = ?auto_888560 ?auto_888571 ) ) ( not ( = ?auto_888561 ?auto_888562 ) ) ( not ( = ?auto_888561 ?auto_888563 ) ) ( not ( = ?auto_888561 ?auto_888564 ) ) ( not ( = ?auto_888561 ?auto_888565 ) ) ( not ( = ?auto_888561 ?auto_888566 ) ) ( not ( = ?auto_888561 ?auto_888567 ) ) ( not ( = ?auto_888561 ?auto_888568 ) ) ( not ( = ?auto_888561 ?auto_888569 ) ) ( not ( = ?auto_888561 ?auto_888570 ) ) ( not ( = ?auto_888561 ?auto_888571 ) ) ( not ( = ?auto_888562 ?auto_888563 ) ) ( not ( = ?auto_888562 ?auto_888564 ) ) ( not ( = ?auto_888562 ?auto_888565 ) ) ( not ( = ?auto_888562 ?auto_888566 ) ) ( not ( = ?auto_888562 ?auto_888567 ) ) ( not ( = ?auto_888562 ?auto_888568 ) ) ( not ( = ?auto_888562 ?auto_888569 ) ) ( not ( = ?auto_888562 ?auto_888570 ) ) ( not ( = ?auto_888562 ?auto_888571 ) ) ( not ( = ?auto_888563 ?auto_888564 ) ) ( not ( = ?auto_888563 ?auto_888565 ) ) ( not ( = ?auto_888563 ?auto_888566 ) ) ( not ( = ?auto_888563 ?auto_888567 ) ) ( not ( = ?auto_888563 ?auto_888568 ) ) ( not ( = ?auto_888563 ?auto_888569 ) ) ( not ( = ?auto_888563 ?auto_888570 ) ) ( not ( = ?auto_888563 ?auto_888571 ) ) ( not ( = ?auto_888564 ?auto_888565 ) ) ( not ( = ?auto_888564 ?auto_888566 ) ) ( not ( = ?auto_888564 ?auto_888567 ) ) ( not ( = ?auto_888564 ?auto_888568 ) ) ( not ( = ?auto_888564 ?auto_888569 ) ) ( not ( = ?auto_888564 ?auto_888570 ) ) ( not ( = ?auto_888564 ?auto_888571 ) ) ( not ( = ?auto_888565 ?auto_888566 ) ) ( not ( = ?auto_888565 ?auto_888567 ) ) ( not ( = ?auto_888565 ?auto_888568 ) ) ( not ( = ?auto_888565 ?auto_888569 ) ) ( not ( = ?auto_888565 ?auto_888570 ) ) ( not ( = ?auto_888565 ?auto_888571 ) ) ( not ( = ?auto_888566 ?auto_888567 ) ) ( not ( = ?auto_888566 ?auto_888568 ) ) ( not ( = ?auto_888566 ?auto_888569 ) ) ( not ( = ?auto_888566 ?auto_888570 ) ) ( not ( = ?auto_888566 ?auto_888571 ) ) ( not ( = ?auto_888567 ?auto_888568 ) ) ( not ( = ?auto_888567 ?auto_888569 ) ) ( not ( = ?auto_888567 ?auto_888570 ) ) ( not ( = ?auto_888567 ?auto_888571 ) ) ( not ( = ?auto_888568 ?auto_888569 ) ) ( not ( = ?auto_888568 ?auto_888570 ) ) ( not ( = ?auto_888568 ?auto_888571 ) ) ( not ( = ?auto_888569 ?auto_888570 ) ) ( not ( = ?auto_888569 ?auto_888571 ) ) ( not ( = ?auto_888570 ?auto_888571 ) ) ( ON ?auto_888569 ?auto_888570 ) ( ON ?auto_888568 ?auto_888569 ) ( ON ?auto_888567 ?auto_888568 ) ( ON ?auto_888566 ?auto_888567 ) ( ON ?auto_888565 ?auto_888566 ) ( ON ?auto_888564 ?auto_888565 ) ( ON ?auto_888563 ?auto_888564 ) ( ON ?auto_888562 ?auto_888563 ) ( CLEAR ?auto_888560 ) ( ON ?auto_888561 ?auto_888562 ) ( CLEAR ?auto_888561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_888553 ?auto_888554 ?auto_888555 ?auto_888556 ?auto_888557 ?auto_888558 ?auto_888559 ?auto_888560 ?auto_888561 )
      ( MAKE-18PILE ?auto_888553 ?auto_888554 ?auto_888555 ?auto_888556 ?auto_888557 ?auto_888558 ?auto_888559 ?auto_888560 ?auto_888561 ?auto_888562 ?auto_888563 ?auto_888564 ?auto_888565 ?auto_888566 ?auto_888567 ?auto_888568 ?auto_888569 ?auto_888570 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888590 - BLOCK
      ?auto_888591 - BLOCK
      ?auto_888592 - BLOCK
      ?auto_888593 - BLOCK
      ?auto_888594 - BLOCK
      ?auto_888595 - BLOCK
      ?auto_888596 - BLOCK
      ?auto_888597 - BLOCK
      ?auto_888598 - BLOCK
      ?auto_888599 - BLOCK
      ?auto_888600 - BLOCK
      ?auto_888601 - BLOCK
      ?auto_888602 - BLOCK
      ?auto_888603 - BLOCK
      ?auto_888604 - BLOCK
      ?auto_888605 - BLOCK
      ?auto_888606 - BLOCK
      ?auto_888607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_888607 ) ( ON-TABLE ?auto_888590 ) ( ON ?auto_888591 ?auto_888590 ) ( ON ?auto_888592 ?auto_888591 ) ( ON ?auto_888593 ?auto_888592 ) ( ON ?auto_888594 ?auto_888593 ) ( ON ?auto_888595 ?auto_888594 ) ( ON ?auto_888596 ?auto_888595 ) ( ON ?auto_888597 ?auto_888596 ) ( not ( = ?auto_888590 ?auto_888591 ) ) ( not ( = ?auto_888590 ?auto_888592 ) ) ( not ( = ?auto_888590 ?auto_888593 ) ) ( not ( = ?auto_888590 ?auto_888594 ) ) ( not ( = ?auto_888590 ?auto_888595 ) ) ( not ( = ?auto_888590 ?auto_888596 ) ) ( not ( = ?auto_888590 ?auto_888597 ) ) ( not ( = ?auto_888590 ?auto_888598 ) ) ( not ( = ?auto_888590 ?auto_888599 ) ) ( not ( = ?auto_888590 ?auto_888600 ) ) ( not ( = ?auto_888590 ?auto_888601 ) ) ( not ( = ?auto_888590 ?auto_888602 ) ) ( not ( = ?auto_888590 ?auto_888603 ) ) ( not ( = ?auto_888590 ?auto_888604 ) ) ( not ( = ?auto_888590 ?auto_888605 ) ) ( not ( = ?auto_888590 ?auto_888606 ) ) ( not ( = ?auto_888590 ?auto_888607 ) ) ( not ( = ?auto_888591 ?auto_888592 ) ) ( not ( = ?auto_888591 ?auto_888593 ) ) ( not ( = ?auto_888591 ?auto_888594 ) ) ( not ( = ?auto_888591 ?auto_888595 ) ) ( not ( = ?auto_888591 ?auto_888596 ) ) ( not ( = ?auto_888591 ?auto_888597 ) ) ( not ( = ?auto_888591 ?auto_888598 ) ) ( not ( = ?auto_888591 ?auto_888599 ) ) ( not ( = ?auto_888591 ?auto_888600 ) ) ( not ( = ?auto_888591 ?auto_888601 ) ) ( not ( = ?auto_888591 ?auto_888602 ) ) ( not ( = ?auto_888591 ?auto_888603 ) ) ( not ( = ?auto_888591 ?auto_888604 ) ) ( not ( = ?auto_888591 ?auto_888605 ) ) ( not ( = ?auto_888591 ?auto_888606 ) ) ( not ( = ?auto_888591 ?auto_888607 ) ) ( not ( = ?auto_888592 ?auto_888593 ) ) ( not ( = ?auto_888592 ?auto_888594 ) ) ( not ( = ?auto_888592 ?auto_888595 ) ) ( not ( = ?auto_888592 ?auto_888596 ) ) ( not ( = ?auto_888592 ?auto_888597 ) ) ( not ( = ?auto_888592 ?auto_888598 ) ) ( not ( = ?auto_888592 ?auto_888599 ) ) ( not ( = ?auto_888592 ?auto_888600 ) ) ( not ( = ?auto_888592 ?auto_888601 ) ) ( not ( = ?auto_888592 ?auto_888602 ) ) ( not ( = ?auto_888592 ?auto_888603 ) ) ( not ( = ?auto_888592 ?auto_888604 ) ) ( not ( = ?auto_888592 ?auto_888605 ) ) ( not ( = ?auto_888592 ?auto_888606 ) ) ( not ( = ?auto_888592 ?auto_888607 ) ) ( not ( = ?auto_888593 ?auto_888594 ) ) ( not ( = ?auto_888593 ?auto_888595 ) ) ( not ( = ?auto_888593 ?auto_888596 ) ) ( not ( = ?auto_888593 ?auto_888597 ) ) ( not ( = ?auto_888593 ?auto_888598 ) ) ( not ( = ?auto_888593 ?auto_888599 ) ) ( not ( = ?auto_888593 ?auto_888600 ) ) ( not ( = ?auto_888593 ?auto_888601 ) ) ( not ( = ?auto_888593 ?auto_888602 ) ) ( not ( = ?auto_888593 ?auto_888603 ) ) ( not ( = ?auto_888593 ?auto_888604 ) ) ( not ( = ?auto_888593 ?auto_888605 ) ) ( not ( = ?auto_888593 ?auto_888606 ) ) ( not ( = ?auto_888593 ?auto_888607 ) ) ( not ( = ?auto_888594 ?auto_888595 ) ) ( not ( = ?auto_888594 ?auto_888596 ) ) ( not ( = ?auto_888594 ?auto_888597 ) ) ( not ( = ?auto_888594 ?auto_888598 ) ) ( not ( = ?auto_888594 ?auto_888599 ) ) ( not ( = ?auto_888594 ?auto_888600 ) ) ( not ( = ?auto_888594 ?auto_888601 ) ) ( not ( = ?auto_888594 ?auto_888602 ) ) ( not ( = ?auto_888594 ?auto_888603 ) ) ( not ( = ?auto_888594 ?auto_888604 ) ) ( not ( = ?auto_888594 ?auto_888605 ) ) ( not ( = ?auto_888594 ?auto_888606 ) ) ( not ( = ?auto_888594 ?auto_888607 ) ) ( not ( = ?auto_888595 ?auto_888596 ) ) ( not ( = ?auto_888595 ?auto_888597 ) ) ( not ( = ?auto_888595 ?auto_888598 ) ) ( not ( = ?auto_888595 ?auto_888599 ) ) ( not ( = ?auto_888595 ?auto_888600 ) ) ( not ( = ?auto_888595 ?auto_888601 ) ) ( not ( = ?auto_888595 ?auto_888602 ) ) ( not ( = ?auto_888595 ?auto_888603 ) ) ( not ( = ?auto_888595 ?auto_888604 ) ) ( not ( = ?auto_888595 ?auto_888605 ) ) ( not ( = ?auto_888595 ?auto_888606 ) ) ( not ( = ?auto_888595 ?auto_888607 ) ) ( not ( = ?auto_888596 ?auto_888597 ) ) ( not ( = ?auto_888596 ?auto_888598 ) ) ( not ( = ?auto_888596 ?auto_888599 ) ) ( not ( = ?auto_888596 ?auto_888600 ) ) ( not ( = ?auto_888596 ?auto_888601 ) ) ( not ( = ?auto_888596 ?auto_888602 ) ) ( not ( = ?auto_888596 ?auto_888603 ) ) ( not ( = ?auto_888596 ?auto_888604 ) ) ( not ( = ?auto_888596 ?auto_888605 ) ) ( not ( = ?auto_888596 ?auto_888606 ) ) ( not ( = ?auto_888596 ?auto_888607 ) ) ( not ( = ?auto_888597 ?auto_888598 ) ) ( not ( = ?auto_888597 ?auto_888599 ) ) ( not ( = ?auto_888597 ?auto_888600 ) ) ( not ( = ?auto_888597 ?auto_888601 ) ) ( not ( = ?auto_888597 ?auto_888602 ) ) ( not ( = ?auto_888597 ?auto_888603 ) ) ( not ( = ?auto_888597 ?auto_888604 ) ) ( not ( = ?auto_888597 ?auto_888605 ) ) ( not ( = ?auto_888597 ?auto_888606 ) ) ( not ( = ?auto_888597 ?auto_888607 ) ) ( not ( = ?auto_888598 ?auto_888599 ) ) ( not ( = ?auto_888598 ?auto_888600 ) ) ( not ( = ?auto_888598 ?auto_888601 ) ) ( not ( = ?auto_888598 ?auto_888602 ) ) ( not ( = ?auto_888598 ?auto_888603 ) ) ( not ( = ?auto_888598 ?auto_888604 ) ) ( not ( = ?auto_888598 ?auto_888605 ) ) ( not ( = ?auto_888598 ?auto_888606 ) ) ( not ( = ?auto_888598 ?auto_888607 ) ) ( not ( = ?auto_888599 ?auto_888600 ) ) ( not ( = ?auto_888599 ?auto_888601 ) ) ( not ( = ?auto_888599 ?auto_888602 ) ) ( not ( = ?auto_888599 ?auto_888603 ) ) ( not ( = ?auto_888599 ?auto_888604 ) ) ( not ( = ?auto_888599 ?auto_888605 ) ) ( not ( = ?auto_888599 ?auto_888606 ) ) ( not ( = ?auto_888599 ?auto_888607 ) ) ( not ( = ?auto_888600 ?auto_888601 ) ) ( not ( = ?auto_888600 ?auto_888602 ) ) ( not ( = ?auto_888600 ?auto_888603 ) ) ( not ( = ?auto_888600 ?auto_888604 ) ) ( not ( = ?auto_888600 ?auto_888605 ) ) ( not ( = ?auto_888600 ?auto_888606 ) ) ( not ( = ?auto_888600 ?auto_888607 ) ) ( not ( = ?auto_888601 ?auto_888602 ) ) ( not ( = ?auto_888601 ?auto_888603 ) ) ( not ( = ?auto_888601 ?auto_888604 ) ) ( not ( = ?auto_888601 ?auto_888605 ) ) ( not ( = ?auto_888601 ?auto_888606 ) ) ( not ( = ?auto_888601 ?auto_888607 ) ) ( not ( = ?auto_888602 ?auto_888603 ) ) ( not ( = ?auto_888602 ?auto_888604 ) ) ( not ( = ?auto_888602 ?auto_888605 ) ) ( not ( = ?auto_888602 ?auto_888606 ) ) ( not ( = ?auto_888602 ?auto_888607 ) ) ( not ( = ?auto_888603 ?auto_888604 ) ) ( not ( = ?auto_888603 ?auto_888605 ) ) ( not ( = ?auto_888603 ?auto_888606 ) ) ( not ( = ?auto_888603 ?auto_888607 ) ) ( not ( = ?auto_888604 ?auto_888605 ) ) ( not ( = ?auto_888604 ?auto_888606 ) ) ( not ( = ?auto_888604 ?auto_888607 ) ) ( not ( = ?auto_888605 ?auto_888606 ) ) ( not ( = ?auto_888605 ?auto_888607 ) ) ( not ( = ?auto_888606 ?auto_888607 ) ) ( ON ?auto_888606 ?auto_888607 ) ( ON ?auto_888605 ?auto_888606 ) ( ON ?auto_888604 ?auto_888605 ) ( ON ?auto_888603 ?auto_888604 ) ( ON ?auto_888602 ?auto_888603 ) ( ON ?auto_888601 ?auto_888602 ) ( ON ?auto_888600 ?auto_888601 ) ( ON ?auto_888599 ?auto_888600 ) ( CLEAR ?auto_888597 ) ( ON ?auto_888598 ?auto_888599 ) ( CLEAR ?auto_888598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_888590 ?auto_888591 ?auto_888592 ?auto_888593 ?auto_888594 ?auto_888595 ?auto_888596 ?auto_888597 ?auto_888598 )
      ( MAKE-18PILE ?auto_888590 ?auto_888591 ?auto_888592 ?auto_888593 ?auto_888594 ?auto_888595 ?auto_888596 ?auto_888597 ?auto_888598 ?auto_888599 ?auto_888600 ?auto_888601 ?auto_888602 ?auto_888603 ?auto_888604 ?auto_888605 ?auto_888606 ?auto_888607 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888626 - BLOCK
      ?auto_888627 - BLOCK
      ?auto_888628 - BLOCK
      ?auto_888629 - BLOCK
      ?auto_888630 - BLOCK
      ?auto_888631 - BLOCK
      ?auto_888632 - BLOCK
      ?auto_888633 - BLOCK
      ?auto_888634 - BLOCK
      ?auto_888635 - BLOCK
      ?auto_888636 - BLOCK
      ?auto_888637 - BLOCK
      ?auto_888638 - BLOCK
      ?auto_888639 - BLOCK
      ?auto_888640 - BLOCK
      ?auto_888641 - BLOCK
      ?auto_888642 - BLOCK
      ?auto_888643 - BLOCK
    )
    :vars
    (
      ?auto_888644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_888643 ?auto_888644 ) ( ON-TABLE ?auto_888626 ) ( ON ?auto_888627 ?auto_888626 ) ( ON ?auto_888628 ?auto_888627 ) ( ON ?auto_888629 ?auto_888628 ) ( ON ?auto_888630 ?auto_888629 ) ( ON ?auto_888631 ?auto_888630 ) ( ON ?auto_888632 ?auto_888631 ) ( not ( = ?auto_888626 ?auto_888627 ) ) ( not ( = ?auto_888626 ?auto_888628 ) ) ( not ( = ?auto_888626 ?auto_888629 ) ) ( not ( = ?auto_888626 ?auto_888630 ) ) ( not ( = ?auto_888626 ?auto_888631 ) ) ( not ( = ?auto_888626 ?auto_888632 ) ) ( not ( = ?auto_888626 ?auto_888633 ) ) ( not ( = ?auto_888626 ?auto_888634 ) ) ( not ( = ?auto_888626 ?auto_888635 ) ) ( not ( = ?auto_888626 ?auto_888636 ) ) ( not ( = ?auto_888626 ?auto_888637 ) ) ( not ( = ?auto_888626 ?auto_888638 ) ) ( not ( = ?auto_888626 ?auto_888639 ) ) ( not ( = ?auto_888626 ?auto_888640 ) ) ( not ( = ?auto_888626 ?auto_888641 ) ) ( not ( = ?auto_888626 ?auto_888642 ) ) ( not ( = ?auto_888626 ?auto_888643 ) ) ( not ( = ?auto_888626 ?auto_888644 ) ) ( not ( = ?auto_888627 ?auto_888628 ) ) ( not ( = ?auto_888627 ?auto_888629 ) ) ( not ( = ?auto_888627 ?auto_888630 ) ) ( not ( = ?auto_888627 ?auto_888631 ) ) ( not ( = ?auto_888627 ?auto_888632 ) ) ( not ( = ?auto_888627 ?auto_888633 ) ) ( not ( = ?auto_888627 ?auto_888634 ) ) ( not ( = ?auto_888627 ?auto_888635 ) ) ( not ( = ?auto_888627 ?auto_888636 ) ) ( not ( = ?auto_888627 ?auto_888637 ) ) ( not ( = ?auto_888627 ?auto_888638 ) ) ( not ( = ?auto_888627 ?auto_888639 ) ) ( not ( = ?auto_888627 ?auto_888640 ) ) ( not ( = ?auto_888627 ?auto_888641 ) ) ( not ( = ?auto_888627 ?auto_888642 ) ) ( not ( = ?auto_888627 ?auto_888643 ) ) ( not ( = ?auto_888627 ?auto_888644 ) ) ( not ( = ?auto_888628 ?auto_888629 ) ) ( not ( = ?auto_888628 ?auto_888630 ) ) ( not ( = ?auto_888628 ?auto_888631 ) ) ( not ( = ?auto_888628 ?auto_888632 ) ) ( not ( = ?auto_888628 ?auto_888633 ) ) ( not ( = ?auto_888628 ?auto_888634 ) ) ( not ( = ?auto_888628 ?auto_888635 ) ) ( not ( = ?auto_888628 ?auto_888636 ) ) ( not ( = ?auto_888628 ?auto_888637 ) ) ( not ( = ?auto_888628 ?auto_888638 ) ) ( not ( = ?auto_888628 ?auto_888639 ) ) ( not ( = ?auto_888628 ?auto_888640 ) ) ( not ( = ?auto_888628 ?auto_888641 ) ) ( not ( = ?auto_888628 ?auto_888642 ) ) ( not ( = ?auto_888628 ?auto_888643 ) ) ( not ( = ?auto_888628 ?auto_888644 ) ) ( not ( = ?auto_888629 ?auto_888630 ) ) ( not ( = ?auto_888629 ?auto_888631 ) ) ( not ( = ?auto_888629 ?auto_888632 ) ) ( not ( = ?auto_888629 ?auto_888633 ) ) ( not ( = ?auto_888629 ?auto_888634 ) ) ( not ( = ?auto_888629 ?auto_888635 ) ) ( not ( = ?auto_888629 ?auto_888636 ) ) ( not ( = ?auto_888629 ?auto_888637 ) ) ( not ( = ?auto_888629 ?auto_888638 ) ) ( not ( = ?auto_888629 ?auto_888639 ) ) ( not ( = ?auto_888629 ?auto_888640 ) ) ( not ( = ?auto_888629 ?auto_888641 ) ) ( not ( = ?auto_888629 ?auto_888642 ) ) ( not ( = ?auto_888629 ?auto_888643 ) ) ( not ( = ?auto_888629 ?auto_888644 ) ) ( not ( = ?auto_888630 ?auto_888631 ) ) ( not ( = ?auto_888630 ?auto_888632 ) ) ( not ( = ?auto_888630 ?auto_888633 ) ) ( not ( = ?auto_888630 ?auto_888634 ) ) ( not ( = ?auto_888630 ?auto_888635 ) ) ( not ( = ?auto_888630 ?auto_888636 ) ) ( not ( = ?auto_888630 ?auto_888637 ) ) ( not ( = ?auto_888630 ?auto_888638 ) ) ( not ( = ?auto_888630 ?auto_888639 ) ) ( not ( = ?auto_888630 ?auto_888640 ) ) ( not ( = ?auto_888630 ?auto_888641 ) ) ( not ( = ?auto_888630 ?auto_888642 ) ) ( not ( = ?auto_888630 ?auto_888643 ) ) ( not ( = ?auto_888630 ?auto_888644 ) ) ( not ( = ?auto_888631 ?auto_888632 ) ) ( not ( = ?auto_888631 ?auto_888633 ) ) ( not ( = ?auto_888631 ?auto_888634 ) ) ( not ( = ?auto_888631 ?auto_888635 ) ) ( not ( = ?auto_888631 ?auto_888636 ) ) ( not ( = ?auto_888631 ?auto_888637 ) ) ( not ( = ?auto_888631 ?auto_888638 ) ) ( not ( = ?auto_888631 ?auto_888639 ) ) ( not ( = ?auto_888631 ?auto_888640 ) ) ( not ( = ?auto_888631 ?auto_888641 ) ) ( not ( = ?auto_888631 ?auto_888642 ) ) ( not ( = ?auto_888631 ?auto_888643 ) ) ( not ( = ?auto_888631 ?auto_888644 ) ) ( not ( = ?auto_888632 ?auto_888633 ) ) ( not ( = ?auto_888632 ?auto_888634 ) ) ( not ( = ?auto_888632 ?auto_888635 ) ) ( not ( = ?auto_888632 ?auto_888636 ) ) ( not ( = ?auto_888632 ?auto_888637 ) ) ( not ( = ?auto_888632 ?auto_888638 ) ) ( not ( = ?auto_888632 ?auto_888639 ) ) ( not ( = ?auto_888632 ?auto_888640 ) ) ( not ( = ?auto_888632 ?auto_888641 ) ) ( not ( = ?auto_888632 ?auto_888642 ) ) ( not ( = ?auto_888632 ?auto_888643 ) ) ( not ( = ?auto_888632 ?auto_888644 ) ) ( not ( = ?auto_888633 ?auto_888634 ) ) ( not ( = ?auto_888633 ?auto_888635 ) ) ( not ( = ?auto_888633 ?auto_888636 ) ) ( not ( = ?auto_888633 ?auto_888637 ) ) ( not ( = ?auto_888633 ?auto_888638 ) ) ( not ( = ?auto_888633 ?auto_888639 ) ) ( not ( = ?auto_888633 ?auto_888640 ) ) ( not ( = ?auto_888633 ?auto_888641 ) ) ( not ( = ?auto_888633 ?auto_888642 ) ) ( not ( = ?auto_888633 ?auto_888643 ) ) ( not ( = ?auto_888633 ?auto_888644 ) ) ( not ( = ?auto_888634 ?auto_888635 ) ) ( not ( = ?auto_888634 ?auto_888636 ) ) ( not ( = ?auto_888634 ?auto_888637 ) ) ( not ( = ?auto_888634 ?auto_888638 ) ) ( not ( = ?auto_888634 ?auto_888639 ) ) ( not ( = ?auto_888634 ?auto_888640 ) ) ( not ( = ?auto_888634 ?auto_888641 ) ) ( not ( = ?auto_888634 ?auto_888642 ) ) ( not ( = ?auto_888634 ?auto_888643 ) ) ( not ( = ?auto_888634 ?auto_888644 ) ) ( not ( = ?auto_888635 ?auto_888636 ) ) ( not ( = ?auto_888635 ?auto_888637 ) ) ( not ( = ?auto_888635 ?auto_888638 ) ) ( not ( = ?auto_888635 ?auto_888639 ) ) ( not ( = ?auto_888635 ?auto_888640 ) ) ( not ( = ?auto_888635 ?auto_888641 ) ) ( not ( = ?auto_888635 ?auto_888642 ) ) ( not ( = ?auto_888635 ?auto_888643 ) ) ( not ( = ?auto_888635 ?auto_888644 ) ) ( not ( = ?auto_888636 ?auto_888637 ) ) ( not ( = ?auto_888636 ?auto_888638 ) ) ( not ( = ?auto_888636 ?auto_888639 ) ) ( not ( = ?auto_888636 ?auto_888640 ) ) ( not ( = ?auto_888636 ?auto_888641 ) ) ( not ( = ?auto_888636 ?auto_888642 ) ) ( not ( = ?auto_888636 ?auto_888643 ) ) ( not ( = ?auto_888636 ?auto_888644 ) ) ( not ( = ?auto_888637 ?auto_888638 ) ) ( not ( = ?auto_888637 ?auto_888639 ) ) ( not ( = ?auto_888637 ?auto_888640 ) ) ( not ( = ?auto_888637 ?auto_888641 ) ) ( not ( = ?auto_888637 ?auto_888642 ) ) ( not ( = ?auto_888637 ?auto_888643 ) ) ( not ( = ?auto_888637 ?auto_888644 ) ) ( not ( = ?auto_888638 ?auto_888639 ) ) ( not ( = ?auto_888638 ?auto_888640 ) ) ( not ( = ?auto_888638 ?auto_888641 ) ) ( not ( = ?auto_888638 ?auto_888642 ) ) ( not ( = ?auto_888638 ?auto_888643 ) ) ( not ( = ?auto_888638 ?auto_888644 ) ) ( not ( = ?auto_888639 ?auto_888640 ) ) ( not ( = ?auto_888639 ?auto_888641 ) ) ( not ( = ?auto_888639 ?auto_888642 ) ) ( not ( = ?auto_888639 ?auto_888643 ) ) ( not ( = ?auto_888639 ?auto_888644 ) ) ( not ( = ?auto_888640 ?auto_888641 ) ) ( not ( = ?auto_888640 ?auto_888642 ) ) ( not ( = ?auto_888640 ?auto_888643 ) ) ( not ( = ?auto_888640 ?auto_888644 ) ) ( not ( = ?auto_888641 ?auto_888642 ) ) ( not ( = ?auto_888641 ?auto_888643 ) ) ( not ( = ?auto_888641 ?auto_888644 ) ) ( not ( = ?auto_888642 ?auto_888643 ) ) ( not ( = ?auto_888642 ?auto_888644 ) ) ( not ( = ?auto_888643 ?auto_888644 ) ) ( ON ?auto_888642 ?auto_888643 ) ( ON ?auto_888641 ?auto_888642 ) ( ON ?auto_888640 ?auto_888641 ) ( ON ?auto_888639 ?auto_888640 ) ( ON ?auto_888638 ?auto_888639 ) ( ON ?auto_888637 ?auto_888638 ) ( ON ?auto_888636 ?auto_888637 ) ( ON ?auto_888635 ?auto_888636 ) ( ON ?auto_888634 ?auto_888635 ) ( CLEAR ?auto_888632 ) ( ON ?auto_888633 ?auto_888634 ) ( CLEAR ?auto_888633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_888626 ?auto_888627 ?auto_888628 ?auto_888629 ?auto_888630 ?auto_888631 ?auto_888632 ?auto_888633 )
      ( MAKE-18PILE ?auto_888626 ?auto_888627 ?auto_888628 ?auto_888629 ?auto_888630 ?auto_888631 ?auto_888632 ?auto_888633 ?auto_888634 ?auto_888635 ?auto_888636 ?auto_888637 ?auto_888638 ?auto_888639 ?auto_888640 ?auto_888641 ?auto_888642 ?auto_888643 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888663 - BLOCK
      ?auto_888664 - BLOCK
      ?auto_888665 - BLOCK
      ?auto_888666 - BLOCK
      ?auto_888667 - BLOCK
      ?auto_888668 - BLOCK
      ?auto_888669 - BLOCK
      ?auto_888670 - BLOCK
      ?auto_888671 - BLOCK
      ?auto_888672 - BLOCK
      ?auto_888673 - BLOCK
      ?auto_888674 - BLOCK
      ?auto_888675 - BLOCK
      ?auto_888676 - BLOCK
      ?auto_888677 - BLOCK
      ?auto_888678 - BLOCK
      ?auto_888679 - BLOCK
      ?auto_888680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_888680 ) ( ON-TABLE ?auto_888663 ) ( ON ?auto_888664 ?auto_888663 ) ( ON ?auto_888665 ?auto_888664 ) ( ON ?auto_888666 ?auto_888665 ) ( ON ?auto_888667 ?auto_888666 ) ( ON ?auto_888668 ?auto_888667 ) ( ON ?auto_888669 ?auto_888668 ) ( not ( = ?auto_888663 ?auto_888664 ) ) ( not ( = ?auto_888663 ?auto_888665 ) ) ( not ( = ?auto_888663 ?auto_888666 ) ) ( not ( = ?auto_888663 ?auto_888667 ) ) ( not ( = ?auto_888663 ?auto_888668 ) ) ( not ( = ?auto_888663 ?auto_888669 ) ) ( not ( = ?auto_888663 ?auto_888670 ) ) ( not ( = ?auto_888663 ?auto_888671 ) ) ( not ( = ?auto_888663 ?auto_888672 ) ) ( not ( = ?auto_888663 ?auto_888673 ) ) ( not ( = ?auto_888663 ?auto_888674 ) ) ( not ( = ?auto_888663 ?auto_888675 ) ) ( not ( = ?auto_888663 ?auto_888676 ) ) ( not ( = ?auto_888663 ?auto_888677 ) ) ( not ( = ?auto_888663 ?auto_888678 ) ) ( not ( = ?auto_888663 ?auto_888679 ) ) ( not ( = ?auto_888663 ?auto_888680 ) ) ( not ( = ?auto_888664 ?auto_888665 ) ) ( not ( = ?auto_888664 ?auto_888666 ) ) ( not ( = ?auto_888664 ?auto_888667 ) ) ( not ( = ?auto_888664 ?auto_888668 ) ) ( not ( = ?auto_888664 ?auto_888669 ) ) ( not ( = ?auto_888664 ?auto_888670 ) ) ( not ( = ?auto_888664 ?auto_888671 ) ) ( not ( = ?auto_888664 ?auto_888672 ) ) ( not ( = ?auto_888664 ?auto_888673 ) ) ( not ( = ?auto_888664 ?auto_888674 ) ) ( not ( = ?auto_888664 ?auto_888675 ) ) ( not ( = ?auto_888664 ?auto_888676 ) ) ( not ( = ?auto_888664 ?auto_888677 ) ) ( not ( = ?auto_888664 ?auto_888678 ) ) ( not ( = ?auto_888664 ?auto_888679 ) ) ( not ( = ?auto_888664 ?auto_888680 ) ) ( not ( = ?auto_888665 ?auto_888666 ) ) ( not ( = ?auto_888665 ?auto_888667 ) ) ( not ( = ?auto_888665 ?auto_888668 ) ) ( not ( = ?auto_888665 ?auto_888669 ) ) ( not ( = ?auto_888665 ?auto_888670 ) ) ( not ( = ?auto_888665 ?auto_888671 ) ) ( not ( = ?auto_888665 ?auto_888672 ) ) ( not ( = ?auto_888665 ?auto_888673 ) ) ( not ( = ?auto_888665 ?auto_888674 ) ) ( not ( = ?auto_888665 ?auto_888675 ) ) ( not ( = ?auto_888665 ?auto_888676 ) ) ( not ( = ?auto_888665 ?auto_888677 ) ) ( not ( = ?auto_888665 ?auto_888678 ) ) ( not ( = ?auto_888665 ?auto_888679 ) ) ( not ( = ?auto_888665 ?auto_888680 ) ) ( not ( = ?auto_888666 ?auto_888667 ) ) ( not ( = ?auto_888666 ?auto_888668 ) ) ( not ( = ?auto_888666 ?auto_888669 ) ) ( not ( = ?auto_888666 ?auto_888670 ) ) ( not ( = ?auto_888666 ?auto_888671 ) ) ( not ( = ?auto_888666 ?auto_888672 ) ) ( not ( = ?auto_888666 ?auto_888673 ) ) ( not ( = ?auto_888666 ?auto_888674 ) ) ( not ( = ?auto_888666 ?auto_888675 ) ) ( not ( = ?auto_888666 ?auto_888676 ) ) ( not ( = ?auto_888666 ?auto_888677 ) ) ( not ( = ?auto_888666 ?auto_888678 ) ) ( not ( = ?auto_888666 ?auto_888679 ) ) ( not ( = ?auto_888666 ?auto_888680 ) ) ( not ( = ?auto_888667 ?auto_888668 ) ) ( not ( = ?auto_888667 ?auto_888669 ) ) ( not ( = ?auto_888667 ?auto_888670 ) ) ( not ( = ?auto_888667 ?auto_888671 ) ) ( not ( = ?auto_888667 ?auto_888672 ) ) ( not ( = ?auto_888667 ?auto_888673 ) ) ( not ( = ?auto_888667 ?auto_888674 ) ) ( not ( = ?auto_888667 ?auto_888675 ) ) ( not ( = ?auto_888667 ?auto_888676 ) ) ( not ( = ?auto_888667 ?auto_888677 ) ) ( not ( = ?auto_888667 ?auto_888678 ) ) ( not ( = ?auto_888667 ?auto_888679 ) ) ( not ( = ?auto_888667 ?auto_888680 ) ) ( not ( = ?auto_888668 ?auto_888669 ) ) ( not ( = ?auto_888668 ?auto_888670 ) ) ( not ( = ?auto_888668 ?auto_888671 ) ) ( not ( = ?auto_888668 ?auto_888672 ) ) ( not ( = ?auto_888668 ?auto_888673 ) ) ( not ( = ?auto_888668 ?auto_888674 ) ) ( not ( = ?auto_888668 ?auto_888675 ) ) ( not ( = ?auto_888668 ?auto_888676 ) ) ( not ( = ?auto_888668 ?auto_888677 ) ) ( not ( = ?auto_888668 ?auto_888678 ) ) ( not ( = ?auto_888668 ?auto_888679 ) ) ( not ( = ?auto_888668 ?auto_888680 ) ) ( not ( = ?auto_888669 ?auto_888670 ) ) ( not ( = ?auto_888669 ?auto_888671 ) ) ( not ( = ?auto_888669 ?auto_888672 ) ) ( not ( = ?auto_888669 ?auto_888673 ) ) ( not ( = ?auto_888669 ?auto_888674 ) ) ( not ( = ?auto_888669 ?auto_888675 ) ) ( not ( = ?auto_888669 ?auto_888676 ) ) ( not ( = ?auto_888669 ?auto_888677 ) ) ( not ( = ?auto_888669 ?auto_888678 ) ) ( not ( = ?auto_888669 ?auto_888679 ) ) ( not ( = ?auto_888669 ?auto_888680 ) ) ( not ( = ?auto_888670 ?auto_888671 ) ) ( not ( = ?auto_888670 ?auto_888672 ) ) ( not ( = ?auto_888670 ?auto_888673 ) ) ( not ( = ?auto_888670 ?auto_888674 ) ) ( not ( = ?auto_888670 ?auto_888675 ) ) ( not ( = ?auto_888670 ?auto_888676 ) ) ( not ( = ?auto_888670 ?auto_888677 ) ) ( not ( = ?auto_888670 ?auto_888678 ) ) ( not ( = ?auto_888670 ?auto_888679 ) ) ( not ( = ?auto_888670 ?auto_888680 ) ) ( not ( = ?auto_888671 ?auto_888672 ) ) ( not ( = ?auto_888671 ?auto_888673 ) ) ( not ( = ?auto_888671 ?auto_888674 ) ) ( not ( = ?auto_888671 ?auto_888675 ) ) ( not ( = ?auto_888671 ?auto_888676 ) ) ( not ( = ?auto_888671 ?auto_888677 ) ) ( not ( = ?auto_888671 ?auto_888678 ) ) ( not ( = ?auto_888671 ?auto_888679 ) ) ( not ( = ?auto_888671 ?auto_888680 ) ) ( not ( = ?auto_888672 ?auto_888673 ) ) ( not ( = ?auto_888672 ?auto_888674 ) ) ( not ( = ?auto_888672 ?auto_888675 ) ) ( not ( = ?auto_888672 ?auto_888676 ) ) ( not ( = ?auto_888672 ?auto_888677 ) ) ( not ( = ?auto_888672 ?auto_888678 ) ) ( not ( = ?auto_888672 ?auto_888679 ) ) ( not ( = ?auto_888672 ?auto_888680 ) ) ( not ( = ?auto_888673 ?auto_888674 ) ) ( not ( = ?auto_888673 ?auto_888675 ) ) ( not ( = ?auto_888673 ?auto_888676 ) ) ( not ( = ?auto_888673 ?auto_888677 ) ) ( not ( = ?auto_888673 ?auto_888678 ) ) ( not ( = ?auto_888673 ?auto_888679 ) ) ( not ( = ?auto_888673 ?auto_888680 ) ) ( not ( = ?auto_888674 ?auto_888675 ) ) ( not ( = ?auto_888674 ?auto_888676 ) ) ( not ( = ?auto_888674 ?auto_888677 ) ) ( not ( = ?auto_888674 ?auto_888678 ) ) ( not ( = ?auto_888674 ?auto_888679 ) ) ( not ( = ?auto_888674 ?auto_888680 ) ) ( not ( = ?auto_888675 ?auto_888676 ) ) ( not ( = ?auto_888675 ?auto_888677 ) ) ( not ( = ?auto_888675 ?auto_888678 ) ) ( not ( = ?auto_888675 ?auto_888679 ) ) ( not ( = ?auto_888675 ?auto_888680 ) ) ( not ( = ?auto_888676 ?auto_888677 ) ) ( not ( = ?auto_888676 ?auto_888678 ) ) ( not ( = ?auto_888676 ?auto_888679 ) ) ( not ( = ?auto_888676 ?auto_888680 ) ) ( not ( = ?auto_888677 ?auto_888678 ) ) ( not ( = ?auto_888677 ?auto_888679 ) ) ( not ( = ?auto_888677 ?auto_888680 ) ) ( not ( = ?auto_888678 ?auto_888679 ) ) ( not ( = ?auto_888678 ?auto_888680 ) ) ( not ( = ?auto_888679 ?auto_888680 ) ) ( ON ?auto_888679 ?auto_888680 ) ( ON ?auto_888678 ?auto_888679 ) ( ON ?auto_888677 ?auto_888678 ) ( ON ?auto_888676 ?auto_888677 ) ( ON ?auto_888675 ?auto_888676 ) ( ON ?auto_888674 ?auto_888675 ) ( ON ?auto_888673 ?auto_888674 ) ( ON ?auto_888672 ?auto_888673 ) ( ON ?auto_888671 ?auto_888672 ) ( CLEAR ?auto_888669 ) ( ON ?auto_888670 ?auto_888671 ) ( CLEAR ?auto_888670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_888663 ?auto_888664 ?auto_888665 ?auto_888666 ?auto_888667 ?auto_888668 ?auto_888669 ?auto_888670 )
      ( MAKE-18PILE ?auto_888663 ?auto_888664 ?auto_888665 ?auto_888666 ?auto_888667 ?auto_888668 ?auto_888669 ?auto_888670 ?auto_888671 ?auto_888672 ?auto_888673 ?auto_888674 ?auto_888675 ?auto_888676 ?auto_888677 ?auto_888678 ?auto_888679 ?auto_888680 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888699 - BLOCK
      ?auto_888700 - BLOCK
      ?auto_888701 - BLOCK
      ?auto_888702 - BLOCK
      ?auto_888703 - BLOCK
      ?auto_888704 - BLOCK
      ?auto_888705 - BLOCK
      ?auto_888706 - BLOCK
      ?auto_888707 - BLOCK
      ?auto_888708 - BLOCK
      ?auto_888709 - BLOCK
      ?auto_888710 - BLOCK
      ?auto_888711 - BLOCK
      ?auto_888712 - BLOCK
      ?auto_888713 - BLOCK
      ?auto_888714 - BLOCK
      ?auto_888715 - BLOCK
      ?auto_888716 - BLOCK
    )
    :vars
    (
      ?auto_888717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_888716 ?auto_888717 ) ( ON-TABLE ?auto_888699 ) ( ON ?auto_888700 ?auto_888699 ) ( ON ?auto_888701 ?auto_888700 ) ( ON ?auto_888702 ?auto_888701 ) ( ON ?auto_888703 ?auto_888702 ) ( ON ?auto_888704 ?auto_888703 ) ( not ( = ?auto_888699 ?auto_888700 ) ) ( not ( = ?auto_888699 ?auto_888701 ) ) ( not ( = ?auto_888699 ?auto_888702 ) ) ( not ( = ?auto_888699 ?auto_888703 ) ) ( not ( = ?auto_888699 ?auto_888704 ) ) ( not ( = ?auto_888699 ?auto_888705 ) ) ( not ( = ?auto_888699 ?auto_888706 ) ) ( not ( = ?auto_888699 ?auto_888707 ) ) ( not ( = ?auto_888699 ?auto_888708 ) ) ( not ( = ?auto_888699 ?auto_888709 ) ) ( not ( = ?auto_888699 ?auto_888710 ) ) ( not ( = ?auto_888699 ?auto_888711 ) ) ( not ( = ?auto_888699 ?auto_888712 ) ) ( not ( = ?auto_888699 ?auto_888713 ) ) ( not ( = ?auto_888699 ?auto_888714 ) ) ( not ( = ?auto_888699 ?auto_888715 ) ) ( not ( = ?auto_888699 ?auto_888716 ) ) ( not ( = ?auto_888699 ?auto_888717 ) ) ( not ( = ?auto_888700 ?auto_888701 ) ) ( not ( = ?auto_888700 ?auto_888702 ) ) ( not ( = ?auto_888700 ?auto_888703 ) ) ( not ( = ?auto_888700 ?auto_888704 ) ) ( not ( = ?auto_888700 ?auto_888705 ) ) ( not ( = ?auto_888700 ?auto_888706 ) ) ( not ( = ?auto_888700 ?auto_888707 ) ) ( not ( = ?auto_888700 ?auto_888708 ) ) ( not ( = ?auto_888700 ?auto_888709 ) ) ( not ( = ?auto_888700 ?auto_888710 ) ) ( not ( = ?auto_888700 ?auto_888711 ) ) ( not ( = ?auto_888700 ?auto_888712 ) ) ( not ( = ?auto_888700 ?auto_888713 ) ) ( not ( = ?auto_888700 ?auto_888714 ) ) ( not ( = ?auto_888700 ?auto_888715 ) ) ( not ( = ?auto_888700 ?auto_888716 ) ) ( not ( = ?auto_888700 ?auto_888717 ) ) ( not ( = ?auto_888701 ?auto_888702 ) ) ( not ( = ?auto_888701 ?auto_888703 ) ) ( not ( = ?auto_888701 ?auto_888704 ) ) ( not ( = ?auto_888701 ?auto_888705 ) ) ( not ( = ?auto_888701 ?auto_888706 ) ) ( not ( = ?auto_888701 ?auto_888707 ) ) ( not ( = ?auto_888701 ?auto_888708 ) ) ( not ( = ?auto_888701 ?auto_888709 ) ) ( not ( = ?auto_888701 ?auto_888710 ) ) ( not ( = ?auto_888701 ?auto_888711 ) ) ( not ( = ?auto_888701 ?auto_888712 ) ) ( not ( = ?auto_888701 ?auto_888713 ) ) ( not ( = ?auto_888701 ?auto_888714 ) ) ( not ( = ?auto_888701 ?auto_888715 ) ) ( not ( = ?auto_888701 ?auto_888716 ) ) ( not ( = ?auto_888701 ?auto_888717 ) ) ( not ( = ?auto_888702 ?auto_888703 ) ) ( not ( = ?auto_888702 ?auto_888704 ) ) ( not ( = ?auto_888702 ?auto_888705 ) ) ( not ( = ?auto_888702 ?auto_888706 ) ) ( not ( = ?auto_888702 ?auto_888707 ) ) ( not ( = ?auto_888702 ?auto_888708 ) ) ( not ( = ?auto_888702 ?auto_888709 ) ) ( not ( = ?auto_888702 ?auto_888710 ) ) ( not ( = ?auto_888702 ?auto_888711 ) ) ( not ( = ?auto_888702 ?auto_888712 ) ) ( not ( = ?auto_888702 ?auto_888713 ) ) ( not ( = ?auto_888702 ?auto_888714 ) ) ( not ( = ?auto_888702 ?auto_888715 ) ) ( not ( = ?auto_888702 ?auto_888716 ) ) ( not ( = ?auto_888702 ?auto_888717 ) ) ( not ( = ?auto_888703 ?auto_888704 ) ) ( not ( = ?auto_888703 ?auto_888705 ) ) ( not ( = ?auto_888703 ?auto_888706 ) ) ( not ( = ?auto_888703 ?auto_888707 ) ) ( not ( = ?auto_888703 ?auto_888708 ) ) ( not ( = ?auto_888703 ?auto_888709 ) ) ( not ( = ?auto_888703 ?auto_888710 ) ) ( not ( = ?auto_888703 ?auto_888711 ) ) ( not ( = ?auto_888703 ?auto_888712 ) ) ( not ( = ?auto_888703 ?auto_888713 ) ) ( not ( = ?auto_888703 ?auto_888714 ) ) ( not ( = ?auto_888703 ?auto_888715 ) ) ( not ( = ?auto_888703 ?auto_888716 ) ) ( not ( = ?auto_888703 ?auto_888717 ) ) ( not ( = ?auto_888704 ?auto_888705 ) ) ( not ( = ?auto_888704 ?auto_888706 ) ) ( not ( = ?auto_888704 ?auto_888707 ) ) ( not ( = ?auto_888704 ?auto_888708 ) ) ( not ( = ?auto_888704 ?auto_888709 ) ) ( not ( = ?auto_888704 ?auto_888710 ) ) ( not ( = ?auto_888704 ?auto_888711 ) ) ( not ( = ?auto_888704 ?auto_888712 ) ) ( not ( = ?auto_888704 ?auto_888713 ) ) ( not ( = ?auto_888704 ?auto_888714 ) ) ( not ( = ?auto_888704 ?auto_888715 ) ) ( not ( = ?auto_888704 ?auto_888716 ) ) ( not ( = ?auto_888704 ?auto_888717 ) ) ( not ( = ?auto_888705 ?auto_888706 ) ) ( not ( = ?auto_888705 ?auto_888707 ) ) ( not ( = ?auto_888705 ?auto_888708 ) ) ( not ( = ?auto_888705 ?auto_888709 ) ) ( not ( = ?auto_888705 ?auto_888710 ) ) ( not ( = ?auto_888705 ?auto_888711 ) ) ( not ( = ?auto_888705 ?auto_888712 ) ) ( not ( = ?auto_888705 ?auto_888713 ) ) ( not ( = ?auto_888705 ?auto_888714 ) ) ( not ( = ?auto_888705 ?auto_888715 ) ) ( not ( = ?auto_888705 ?auto_888716 ) ) ( not ( = ?auto_888705 ?auto_888717 ) ) ( not ( = ?auto_888706 ?auto_888707 ) ) ( not ( = ?auto_888706 ?auto_888708 ) ) ( not ( = ?auto_888706 ?auto_888709 ) ) ( not ( = ?auto_888706 ?auto_888710 ) ) ( not ( = ?auto_888706 ?auto_888711 ) ) ( not ( = ?auto_888706 ?auto_888712 ) ) ( not ( = ?auto_888706 ?auto_888713 ) ) ( not ( = ?auto_888706 ?auto_888714 ) ) ( not ( = ?auto_888706 ?auto_888715 ) ) ( not ( = ?auto_888706 ?auto_888716 ) ) ( not ( = ?auto_888706 ?auto_888717 ) ) ( not ( = ?auto_888707 ?auto_888708 ) ) ( not ( = ?auto_888707 ?auto_888709 ) ) ( not ( = ?auto_888707 ?auto_888710 ) ) ( not ( = ?auto_888707 ?auto_888711 ) ) ( not ( = ?auto_888707 ?auto_888712 ) ) ( not ( = ?auto_888707 ?auto_888713 ) ) ( not ( = ?auto_888707 ?auto_888714 ) ) ( not ( = ?auto_888707 ?auto_888715 ) ) ( not ( = ?auto_888707 ?auto_888716 ) ) ( not ( = ?auto_888707 ?auto_888717 ) ) ( not ( = ?auto_888708 ?auto_888709 ) ) ( not ( = ?auto_888708 ?auto_888710 ) ) ( not ( = ?auto_888708 ?auto_888711 ) ) ( not ( = ?auto_888708 ?auto_888712 ) ) ( not ( = ?auto_888708 ?auto_888713 ) ) ( not ( = ?auto_888708 ?auto_888714 ) ) ( not ( = ?auto_888708 ?auto_888715 ) ) ( not ( = ?auto_888708 ?auto_888716 ) ) ( not ( = ?auto_888708 ?auto_888717 ) ) ( not ( = ?auto_888709 ?auto_888710 ) ) ( not ( = ?auto_888709 ?auto_888711 ) ) ( not ( = ?auto_888709 ?auto_888712 ) ) ( not ( = ?auto_888709 ?auto_888713 ) ) ( not ( = ?auto_888709 ?auto_888714 ) ) ( not ( = ?auto_888709 ?auto_888715 ) ) ( not ( = ?auto_888709 ?auto_888716 ) ) ( not ( = ?auto_888709 ?auto_888717 ) ) ( not ( = ?auto_888710 ?auto_888711 ) ) ( not ( = ?auto_888710 ?auto_888712 ) ) ( not ( = ?auto_888710 ?auto_888713 ) ) ( not ( = ?auto_888710 ?auto_888714 ) ) ( not ( = ?auto_888710 ?auto_888715 ) ) ( not ( = ?auto_888710 ?auto_888716 ) ) ( not ( = ?auto_888710 ?auto_888717 ) ) ( not ( = ?auto_888711 ?auto_888712 ) ) ( not ( = ?auto_888711 ?auto_888713 ) ) ( not ( = ?auto_888711 ?auto_888714 ) ) ( not ( = ?auto_888711 ?auto_888715 ) ) ( not ( = ?auto_888711 ?auto_888716 ) ) ( not ( = ?auto_888711 ?auto_888717 ) ) ( not ( = ?auto_888712 ?auto_888713 ) ) ( not ( = ?auto_888712 ?auto_888714 ) ) ( not ( = ?auto_888712 ?auto_888715 ) ) ( not ( = ?auto_888712 ?auto_888716 ) ) ( not ( = ?auto_888712 ?auto_888717 ) ) ( not ( = ?auto_888713 ?auto_888714 ) ) ( not ( = ?auto_888713 ?auto_888715 ) ) ( not ( = ?auto_888713 ?auto_888716 ) ) ( not ( = ?auto_888713 ?auto_888717 ) ) ( not ( = ?auto_888714 ?auto_888715 ) ) ( not ( = ?auto_888714 ?auto_888716 ) ) ( not ( = ?auto_888714 ?auto_888717 ) ) ( not ( = ?auto_888715 ?auto_888716 ) ) ( not ( = ?auto_888715 ?auto_888717 ) ) ( not ( = ?auto_888716 ?auto_888717 ) ) ( ON ?auto_888715 ?auto_888716 ) ( ON ?auto_888714 ?auto_888715 ) ( ON ?auto_888713 ?auto_888714 ) ( ON ?auto_888712 ?auto_888713 ) ( ON ?auto_888711 ?auto_888712 ) ( ON ?auto_888710 ?auto_888711 ) ( ON ?auto_888709 ?auto_888710 ) ( ON ?auto_888708 ?auto_888709 ) ( ON ?auto_888707 ?auto_888708 ) ( ON ?auto_888706 ?auto_888707 ) ( CLEAR ?auto_888704 ) ( ON ?auto_888705 ?auto_888706 ) ( CLEAR ?auto_888705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_888699 ?auto_888700 ?auto_888701 ?auto_888702 ?auto_888703 ?auto_888704 ?auto_888705 )
      ( MAKE-18PILE ?auto_888699 ?auto_888700 ?auto_888701 ?auto_888702 ?auto_888703 ?auto_888704 ?auto_888705 ?auto_888706 ?auto_888707 ?auto_888708 ?auto_888709 ?auto_888710 ?auto_888711 ?auto_888712 ?auto_888713 ?auto_888714 ?auto_888715 ?auto_888716 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888736 - BLOCK
      ?auto_888737 - BLOCK
      ?auto_888738 - BLOCK
      ?auto_888739 - BLOCK
      ?auto_888740 - BLOCK
      ?auto_888741 - BLOCK
      ?auto_888742 - BLOCK
      ?auto_888743 - BLOCK
      ?auto_888744 - BLOCK
      ?auto_888745 - BLOCK
      ?auto_888746 - BLOCK
      ?auto_888747 - BLOCK
      ?auto_888748 - BLOCK
      ?auto_888749 - BLOCK
      ?auto_888750 - BLOCK
      ?auto_888751 - BLOCK
      ?auto_888752 - BLOCK
      ?auto_888753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_888753 ) ( ON-TABLE ?auto_888736 ) ( ON ?auto_888737 ?auto_888736 ) ( ON ?auto_888738 ?auto_888737 ) ( ON ?auto_888739 ?auto_888738 ) ( ON ?auto_888740 ?auto_888739 ) ( ON ?auto_888741 ?auto_888740 ) ( not ( = ?auto_888736 ?auto_888737 ) ) ( not ( = ?auto_888736 ?auto_888738 ) ) ( not ( = ?auto_888736 ?auto_888739 ) ) ( not ( = ?auto_888736 ?auto_888740 ) ) ( not ( = ?auto_888736 ?auto_888741 ) ) ( not ( = ?auto_888736 ?auto_888742 ) ) ( not ( = ?auto_888736 ?auto_888743 ) ) ( not ( = ?auto_888736 ?auto_888744 ) ) ( not ( = ?auto_888736 ?auto_888745 ) ) ( not ( = ?auto_888736 ?auto_888746 ) ) ( not ( = ?auto_888736 ?auto_888747 ) ) ( not ( = ?auto_888736 ?auto_888748 ) ) ( not ( = ?auto_888736 ?auto_888749 ) ) ( not ( = ?auto_888736 ?auto_888750 ) ) ( not ( = ?auto_888736 ?auto_888751 ) ) ( not ( = ?auto_888736 ?auto_888752 ) ) ( not ( = ?auto_888736 ?auto_888753 ) ) ( not ( = ?auto_888737 ?auto_888738 ) ) ( not ( = ?auto_888737 ?auto_888739 ) ) ( not ( = ?auto_888737 ?auto_888740 ) ) ( not ( = ?auto_888737 ?auto_888741 ) ) ( not ( = ?auto_888737 ?auto_888742 ) ) ( not ( = ?auto_888737 ?auto_888743 ) ) ( not ( = ?auto_888737 ?auto_888744 ) ) ( not ( = ?auto_888737 ?auto_888745 ) ) ( not ( = ?auto_888737 ?auto_888746 ) ) ( not ( = ?auto_888737 ?auto_888747 ) ) ( not ( = ?auto_888737 ?auto_888748 ) ) ( not ( = ?auto_888737 ?auto_888749 ) ) ( not ( = ?auto_888737 ?auto_888750 ) ) ( not ( = ?auto_888737 ?auto_888751 ) ) ( not ( = ?auto_888737 ?auto_888752 ) ) ( not ( = ?auto_888737 ?auto_888753 ) ) ( not ( = ?auto_888738 ?auto_888739 ) ) ( not ( = ?auto_888738 ?auto_888740 ) ) ( not ( = ?auto_888738 ?auto_888741 ) ) ( not ( = ?auto_888738 ?auto_888742 ) ) ( not ( = ?auto_888738 ?auto_888743 ) ) ( not ( = ?auto_888738 ?auto_888744 ) ) ( not ( = ?auto_888738 ?auto_888745 ) ) ( not ( = ?auto_888738 ?auto_888746 ) ) ( not ( = ?auto_888738 ?auto_888747 ) ) ( not ( = ?auto_888738 ?auto_888748 ) ) ( not ( = ?auto_888738 ?auto_888749 ) ) ( not ( = ?auto_888738 ?auto_888750 ) ) ( not ( = ?auto_888738 ?auto_888751 ) ) ( not ( = ?auto_888738 ?auto_888752 ) ) ( not ( = ?auto_888738 ?auto_888753 ) ) ( not ( = ?auto_888739 ?auto_888740 ) ) ( not ( = ?auto_888739 ?auto_888741 ) ) ( not ( = ?auto_888739 ?auto_888742 ) ) ( not ( = ?auto_888739 ?auto_888743 ) ) ( not ( = ?auto_888739 ?auto_888744 ) ) ( not ( = ?auto_888739 ?auto_888745 ) ) ( not ( = ?auto_888739 ?auto_888746 ) ) ( not ( = ?auto_888739 ?auto_888747 ) ) ( not ( = ?auto_888739 ?auto_888748 ) ) ( not ( = ?auto_888739 ?auto_888749 ) ) ( not ( = ?auto_888739 ?auto_888750 ) ) ( not ( = ?auto_888739 ?auto_888751 ) ) ( not ( = ?auto_888739 ?auto_888752 ) ) ( not ( = ?auto_888739 ?auto_888753 ) ) ( not ( = ?auto_888740 ?auto_888741 ) ) ( not ( = ?auto_888740 ?auto_888742 ) ) ( not ( = ?auto_888740 ?auto_888743 ) ) ( not ( = ?auto_888740 ?auto_888744 ) ) ( not ( = ?auto_888740 ?auto_888745 ) ) ( not ( = ?auto_888740 ?auto_888746 ) ) ( not ( = ?auto_888740 ?auto_888747 ) ) ( not ( = ?auto_888740 ?auto_888748 ) ) ( not ( = ?auto_888740 ?auto_888749 ) ) ( not ( = ?auto_888740 ?auto_888750 ) ) ( not ( = ?auto_888740 ?auto_888751 ) ) ( not ( = ?auto_888740 ?auto_888752 ) ) ( not ( = ?auto_888740 ?auto_888753 ) ) ( not ( = ?auto_888741 ?auto_888742 ) ) ( not ( = ?auto_888741 ?auto_888743 ) ) ( not ( = ?auto_888741 ?auto_888744 ) ) ( not ( = ?auto_888741 ?auto_888745 ) ) ( not ( = ?auto_888741 ?auto_888746 ) ) ( not ( = ?auto_888741 ?auto_888747 ) ) ( not ( = ?auto_888741 ?auto_888748 ) ) ( not ( = ?auto_888741 ?auto_888749 ) ) ( not ( = ?auto_888741 ?auto_888750 ) ) ( not ( = ?auto_888741 ?auto_888751 ) ) ( not ( = ?auto_888741 ?auto_888752 ) ) ( not ( = ?auto_888741 ?auto_888753 ) ) ( not ( = ?auto_888742 ?auto_888743 ) ) ( not ( = ?auto_888742 ?auto_888744 ) ) ( not ( = ?auto_888742 ?auto_888745 ) ) ( not ( = ?auto_888742 ?auto_888746 ) ) ( not ( = ?auto_888742 ?auto_888747 ) ) ( not ( = ?auto_888742 ?auto_888748 ) ) ( not ( = ?auto_888742 ?auto_888749 ) ) ( not ( = ?auto_888742 ?auto_888750 ) ) ( not ( = ?auto_888742 ?auto_888751 ) ) ( not ( = ?auto_888742 ?auto_888752 ) ) ( not ( = ?auto_888742 ?auto_888753 ) ) ( not ( = ?auto_888743 ?auto_888744 ) ) ( not ( = ?auto_888743 ?auto_888745 ) ) ( not ( = ?auto_888743 ?auto_888746 ) ) ( not ( = ?auto_888743 ?auto_888747 ) ) ( not ( = ?auto_888743 ?auto_888748 ) ) ( not ( = ?auto_888743 ?auto_888749 ) ) ( not ( = ?auto_888743 ?auto_888750 ) ) ( not ( = ?auto_888743 ?auto_888751 ) ) ( not ( = ?auto_888743 ?auto_888752 ) ) ( not ( = ?auto_888743 ?auto_888753 ) ) ( not ( = ?auto_888744 ?auto_888745 ) ) ( not ( = ?auto_888744 ?auto_888746 ) ) ( not ( = ?auto_888744 ?auto_888747 ) ) ( not ( = ?auto_888744 ?auto_888748 ) ) ( not ( = ?auto_888744 ?auto_888749 ) ) ( not ( = ?auto_888744 ?auto_888750 ) ) ( not ( = ?auto_888744 ?auto_888751 ) ) ( not ( = ?auto_888744 ?auto_888752 ) ) ( not ( = ?auto_888744 ?auto_888753 ) ) ( not ( = ?auto_888745 ?auto_888746 ) ) ( not ( = ?auto_888745 ?auto_888747 ) ) ( not ( = ?auto_888745 ?auto_888748 ) ) ( not ( = ?auto_888745 ?auto_888749 ) ) ( not ( = ?auto_888745 ?auto_888750 ) ) ( not ( = ?auto_888745 ?auto_888751 ) ) ( not ( = ?auto_888745 ?auto_888752 ) ) ( not ( = ?auto_888745 ?auto_888753 ) ) ( not ( = ?auto_888746 ?auto_888747 ) ) ( not ( = ?auto_888746 ?auto_888748 ) ) ( not ( = ?auto_888746 ?auto_888749 ) ) ( not ( = ?auto_888746 ?auto_888750 ) ) ( not ( = ?auto_888746 ?auto_888751 ) ) ( not ( = ?auto_888746 ?auto_888752 ) ) ( not ( = ?auto_888746 ?auto_888753 ) ) ( not ( = ?auto_888747 ?auto_888748 ) ) ( not ( = ?auto_888747 ?auto_888749 ) ) ( not ( = ?auto_888747 ?auto_888750 ) ) ( not ( = ?auto_888747 ?auto_888751 ) ) ( not ( = ?auto_888747 ?auto_888752 ) ) ( not ( = ?auto_888747 ?auto_888753 ) ) ( not ( = ?auto_888748 ?auto_888749 ) ) ( not ( = ?auto_888748 ?auto_888750 ) ) ( not ( = ?auto_888748 ?auto_888751 ) ) ( not ( = ?auto_888748 ?auto_888752 ) ) ( not ( = ?auto_888748 ?auto_888753 ) ) ( not ( = ?auto_888749 ?auto_888750 ) ) ( not ( = ?auto_888749 ?auto_888751 ) ) ( not ( = ?auto_888749 ?auto_888752 ) ) ( not ( = ?auto_888749 ?auto_888753 ) ) ( not ( = ?auto_888750 ?auto_888751 ) ) ( not ( = ?auto_888750 ?auto_888752 ) ) ( not ( = ?auto_888750 ?auto_888753 ) ) ( not ( = ?auto_888751 ?auto_888752 ) ) ( not ( = ?auto_888751 ?auto_888753 ) ) ( not ( = ?auto_888752 ?auto_888753 ) ) ( ON ?auto_888752 ?auto_888753 ) ( ON ?auto_888751 ?auto_888752 ) ( ON ?auto_888750 ?auto_888751 ) ( ON ?auto_888749 ?auto_888750 ) ( ON ?auto_888748 ?auto_888749 ) ( ON ?auto_888747 ?auto_888748 ) ( ON ?auto_888746 ?auto_888747 ) ( ON ?auto_888745 ?auto_888746 ) ( ON ?auto_888744 ?auto_888745 ) ( ON ?auto_888743 ?auto_888744 ) ( CLEAR ?auto_888741 ) ( ON ?auto_888742 ?auto_888743 ) ( CLEAR ?auto_888742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_888736 ?auto_888737 ?auto_888738 ?auto_888739 ?auto_888740 ?auto_888741 ?auto_888742 )
      ( MAKE-18PILE ?auto_888736 ?auto_888737 ?auto_888738 ?auto_888739 ?auto_888740 ?auto_888741 ?auto_888742 ?auto_888743 ?auto_888744 ?auto_888745 ?auto_888746 ?auto_888747 ?auto_888748 ?auto_888749 ?auto_888750 ?auto_888751 ?auto_888752 ?auto_888753 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888772 - BLOCK
      ?auto_888773 - BLOCK
      ?auto_888774 - BLOCK
      ?auto_888775 - BLOCK
      ?auto_888776 - BLOCK
      ?auto_888777 - BLOCK
      ?auto_888778 - BLOCK
      ?auto_888779 - BLOCK
      ?auto_888780 - BLOCK
      ?auto_888781 - BLOCK
      ?auto_888782 - BLOCK
      ?auto_888783 - BLOCK
      ?auto_888784 - BLOCK
      ?auto_888785 - BLOCK
      ?auto_888786 - BLOCK
      ?auto_888787 - BLOCK
      ?auto_888788 - BLOCK
      ?auto_888789 - BLOCK
    )
    :vars
    (
      ?auto_888790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_888789 ?auto_888790 ) ( ON-TABLE ?auto_888772 ) ( ON ?auto_888773 ?auto_888772 ) ( ON ?auto_888774 ?auto_888773 ) ( ON ?auto_888775 ?auto_888774 ) ( ON ?auto_888776 ?auto_888775 ) ( not ( = ?auto_888772 ?auto_888773 ) ) ( not ( = ?auto_888772 ?auto_888774 ) ) ( not ( = ?auto_888772 ?auto_888775 ) ) ( not ( = ?auto_888772 ?auto_888776 ) ) ( not ( = ?auto_888772 ?auto_888777 ) ) ( not ( = ?auto_888772 ?auto_888778 ) ) ( not ( = ?auto_888772 ?auto_888779 ) ) ( not ( = ?auto_888772 ?auto_888780 ) ) ( not ( = ?auto_888772 ?auto_888781 ) ) ( not ( = ?auto_888772 ?auto_888782 ) ) ( not ( = ?auto_888772 ?auto_888783 ) ) ( not ( = ?auto_888772 ?auto_888784 ) ) ( not ( = ?auto_888772 ?auto_888785 ) ) ( not ( = ?auto_888772 ?auto_888786 ) ) ( not ( = ?auto_888772 ?auto_888787 ) ) ( not ( = ?auto_888772 ?auto_888788 ) ) ( not ( = ?auto_888772 ?auto_888789 ) ) ( not ( = ?auto_888772 ?auto_888790 ) ) ( not ( = ?auto_888773 ?auto_888774 ) ) ( not ( = ?auto_888773 ?auto_888775 ) ) ( not ( = ?auto_888773 ?auto_888776 ) ) ( not ( = ?auto_888773 ?auto_888777 ) ) ( not ( = ?auto_888773 ?auto_888778 ) ) ( not ( = ?auto_888773 ?auto_888779 ) ) ( not ( = ?auto_888773 ?auto_888780 ) ) ( not ( = ?auto_888773 ?auto_888781 ) ) ( not ( = ?auto_888773 ?auto_888782 ) ) ( not ( = ?auto_888773 ?auto_888783 ) ) ( not ( = ?auto_888773 ?auto_888784 ) ) ( not ( = ?auto_888773 ?auto_888785 ) ) ( not ( = ?auto_888773 ?auto_888786 ) ) ( not ( = ?auto_888773 ?auto_888787 ) ) ( not ( = ?auto_888773 ?auto_888788 ) ) ( not ( = ?auto_888773 ?auto_888789 ) ) ( not ( = ?auto_888773 ?auto_888790 ) ) ( not ( = ?auto_888774 ?auto_888775 ) ) ( not ( = ?auto_888774 ?auto_888776 ) ) ( not ( = ?auto_888774 ?auto_888777 ) ) ( not ( = ?auto_888774 ?auto_888778 ) ) ( not ( = ?auto_888774 ?auto_888779 ) ) ( not ( = ?auto_888774 ?auto_888780 ) ) ( not ( = ?auto_888774 ?auto_888781 ) ) ( not ( = ?auto_888774 ?auto_888782 ) ) ( not ( = ?auto_888774 ?auto_888783 ) ) ( not ( = ?auto_888774 ?auto_888784 ) ) ( not ( = ?auto_888774 ?auto_888785 ) ) ( not ( = ?auto_888774 ?auto_888786 ) ) ( not ( = ?auto_888774 ?auto_888787 ) ) ( not ( = ?auto_888774 ?auto_888788 ) ) ( not ( = ?auto_888774 ?auto_888789 ) ) ( not ( = ?auto_888774 ?auto_888790 ) ) ( not ( = ?auto_888775 ?auto_888776 ) ) ( not ( = ?auto_888775 ?auto_888777 ) ) ( not ( = ?auto_888775 ?auto_888778 ) ) ( not ( = ?auto_888775 ?auto_888779 ) ) ( not ( = ?auto_888775 ?auto_888780 ) ) ( not ( = ?auto_888775 ?auto_888781 ) ) ( not ( = ?auto_888775 ?auto_888782 ) ) ( not ( = ?auto_888775 ?auto_888783 ) ) ( not ( = ?auto_888775 ?auto_888784 ) ) ( not ( = ?auto_888775 ?auto_888785 ) ) ( not ( = ?auto_888775 ?auto_888786 ) ) ( not ( = ?auto_888775 ?auto_888787 ) ) ( not ( = ?auto_888775 ?auto_888788 ) ) ( not ( = ?auto_888775 ?auto_888789 ) ) ( not ( = ?auto_888775 ?auto_888790 ) ) ( not ( = ?auto_888776 ?auto_888777 ) ) ( not ( = ?auto_888776 ?auto_888778 ) ) ( not ( = ?auto_888776 ?auto_888779 ) ) ( not ( = ?auto_888776 ?auto_888780 ) ) ( not ( = ?auto_888776 ?auto_888781 ) ) ( not ( = ?auto_888776 ?auto_888782 ) ) ( not ( = ?auto_888776 ?auto_888783 ) ) ( not ( = ?auto_888776 ?auto_888784 ) ) ( not ( = ?auto_888776 ?auto_888785 ) ) ( not ( = ?auto_888776 ?auto_888786 ) ) ( not ( = ?auto_888776 ?auto_888787 ) ) ( not ( = ?auto_888776 ?auto_888788 ) ) ( not ( = ?auto_888776 ?auto_888789 ) ) ( not ( = ?auto_888776 ?auto_888790 ) ) ( not ( = ?auto_888777 ?auto_888778 ) ) ( not ( = ?auto_888777 ?auto_888779 ) ) ( not ( = ?auto_888777 ?auto_888780 ) ) ( not ( = ?auto_888777 ?auto_888781 ) ) ( not ( = ?auto_888777 ?auto_888782 ) ) ( not ( = ?auto_888777 ?auto_888783 ) ) ( not ( = ?auto_888777 ?auto_888784 ) ) ( not ( = ?auto_888777 ?auto_888785 ) ) ( not ( = ?auto_888777 ?auto_888786 ) ) ( not ( = ?auto_888777 ?auto_888787 ) ) ( not ( = ?auto_888777 ?auto_888788 ) ) ( not ( = ?auto_888777 ?auto_888789 ) ) ( not ( = ?auto_888777 ?auto_888790 ) ) ( not ( = ?auto_888778 ?auto_888779 ) ) ( not ( = ?auto_888778 ?auto_888780 ) ) ( not ( = ?auto_888778 ?auto_888781 ) ) ( not ( = ?auto_888778 ?auto_888782 ) ) ( not ( = ?auto_888778 ?auto_888783 ) ) ( not ( = ?auto_888778 ?auto_888784 ) ) ( not ( = ?auto_888778 ?auto_888785 ) ) ( not ( = ?auto_888778 ?auto_888786 ) ) ( not ( = ?auto_888778 ?auto_888787 ) ) ( not ( = ?auto_888778 ?auto_888788 ) ) ( not ( = ?auto_888778 ?auto_888789 ) ) ( not ( = ?auto_888778 ?auto_888790 ) ) ( not ( = ?auto_888779 ?auto_888780 ) ) ( not ( = ?auto_888779 ?auto_888781 ) ) ( not ( = ?auto_888779 ?auto_888782 ) ) ( not ( = ?auto_888779 ?auto_888783 ) ) ( not ( = ?auto_888779 ?auto_888784 ) ) ( not ( = ?auto_888779 ?auto_888785 ) ) ( not ( = ?auto_888779 ?auto_888786 ) ) ( not ( = ?auto_888779 ?auto_888787 ) ) ( not ( = ?auto_888779 ?auto_888788 ) ) ( not ( = ?auto_888779 ?auto_888789 ) ) ( not ( = ?auto_888779 ?auto_888790 ) ) ( not ( = ?auto_888780 ?auto_888781 ) ) ( not ( = ?auto_888780 ?auto_888782 ) ) ( not ( = ?auto_888780 ?auto_888783 ) ) ( not ( = ?auto_888780 ?auto_888784 ) ) ( not ( = ?auto_888780 ?auto_888785 ) ) ( not ( = ?auto_888780 ?auto_888786 ) ) ( not ( = ?auto_888780 ?auto_888787 ) ) ( not ( = ?auto_888780 ?auto_888788 ) ) ( not ( = ?auto_888780 ?auto_888789 ) ) ( not ( = ?auto_888780 ?auto_888790 ) ) ( not ( = ?auto_888781 ?auto_888782 ) ) ( not ( = ?auto_888781 ?auto_888783 ) ) ( not ( = ?auto_888781 ?auto_888784 ) ) ( not ( = ?auto_888781 ?auto_888785 ) ) ( not ( = ?auto_888781 ?auto_888786 ) ) ( not ( = ?auto_888781 ?auto_888787 ) ) ( not ( = ?auto_888781 ?auto_888788 ) ) ( not ( = ?auto_888781 ?auto_888789 ) ) ( not ( = ?auto_888781 ?auto_888790 ) ) ( not ( = ?auto_888782 ?auto_888783 ) ) ( not ( = ?auto_888782 ?auto_888784 ) ) ( not ( = ?auto_888782 ?auto_888785 ) ) ( not ( = ?auto_888782 ?auto_888786 ) ) ( not ( = ?auto_888782 ?auto_888787 ) ) ( not ( = ?auto_888782 ?auto_888788 ) ) ( not ( = ?auto_888782 ?auto_888789 ) ) ( not ( = ?auto_888782 ?auto_888790 ) ) ( not ( = ?auto_888783 ?auto_888784 ) ) ( not ( = ?auto_888783 ?auto_888785 ) ) ( not ( = ?auto_888783 ?auto_888786 ) ) ( not ( = ?auto_888783 ?auto_888787 ) ) ( not ( = ?auto_888783 ?auto_888788 ) ) ( not ( = ?auto_888783 ?auto_888789 ) ) ( not ( = ?auto_888783 ?auto_888790 ) ) ( not ( = ?auto_888784 ?auto_888785 ) ) ( not ( = ?auto_888784 ?auto_888786 ) ) ( not ( = ?auto_888784 ?auto_888787 ) ) ( not ( = ?auto_888784 ?auto_888788 ) ) ( not ( = ?auto_888784 ?auto_888789 ) ) ( not ( = ?auto_888784 ?auto_888790 ) ) ( not ( = ?auto_888785 ?auto_888786 ) ) ( not ( = ?auto_888785 ?auto_888787 ) ) ( not ( = ?auto_888785 ?auto_888788 ) ) ( not ( = ?auto_888785 ?auto_888789 ) ) ( not ( = ?auto_888785 ?auto_888790 ) ) ( not ( = ?auto_888786 ?auto_888787 ) ) ( not ( = ?auto_888786 ?auto_888788 ) ) ( not ( = ?auto_888786 ?auto_888789 ) ) ( not ( = ?auto_888786 ?auto_888790 ) ) ( not ( = ?auto_888787 ?auto_888788 ) ) ( not ( = ?auto_888787 ?auto_888789 ) ) ( not ( = ?auto_888787 ?auto_888790 ) ) ( not ( = ?auto_888788 ?auto_888789 ) ) ( not ( = ?auto_888788 ?auto_888790 ) ) ( not ( = ?auto_888789 ?auto_888790 ) ) ( ON ?auto_888788 ?auto_888789 ) ( ON ?auto_888787 ?auto_888788 ) ( ON ?auto_888786 ?auto_888787 ) ( ON ?auto_888785 ?auto_888786 ) ( ON ?auto_888784 ?auto_888785 ) ( ON ?auto_888783 ?auto_888784 ) ( ON ?auto_888782 ?auto_888783 ) ( ON ?auto_888781 ?auto_888782 ) ( ON ?auto_888780 ?auto_888781 ) ( ON ?auto_888779 ?auto_888780 ) ( ON ?auto_888778 ?auto_888779 ) ( CLEAR ?auto_888776 ) ( ON ?auto_888777 ?auto_888778 ) ( CLEAR ?auto_888777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_888772 ?auto_888773 ?auto_888774 ?auto_888775 ?auto_888776 ?auto_888777 )
      ( MAKE-18PILE ?auto_888772 ?auto_888773 ?auto_888774 ?auto_888775 ?auto_888776 ?auto_888777 ?auto_888778 ?auto_888779 ?auto_888780 ?auto_888781 ?auto_888782 ?auto_888783 ?auto_888784 ?auto_888785 ?auto_888786 ?auto_888787 ?auto_888788 ?auto_888789 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888809 - BLOCK
      ?auto_888810 - BLOCK
      ?auto_888811 - BLOCK
      ?auto_888812 - BLOCK
      ?auto_888813 - BLOCK
      ?auto_888814 - BLOCK
      ?auto_888815 - BLOCK
      ?auto_888816 - BLOCK
      ?auto_888817 - BLOCK
      ?auto_888818 - BLOCK
      ?auto_888819 - BLOCK
      ?auto_888820 - BLOCK
      ?auto_888821 - BLOCK
      ?auto_888822 - BLOCK
      ?auto_888823 - BLOCK
      ?auto_888824 - BLOCK
      ?auto_888825 - BLOCK
      ?auto_888826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_888826 ) ( ON-TABLE ?auto_888809 ) ( ON ?auto_888810 ?auto_888809 ) ( ON ?auto_888811 ?auto_888810 ) ( ON ?auto_888812 ?auto_888811 ) ( ON ?auto_888813 ?auto_888812 ) ( not ( = ?auto_888809 ?auto_888810 ) ) ( not ( = ?auto_888809 ?auto_888811 ) ) ( not ( = ?auto_888809 ?auto_888812 ) ) ( not ( = ?auto_888809 ?auto_888813 ) ) ( not ( = ?auto_888809 ?auto_888814 ) ) ( not ( = ?auto_888809 ?auto_888815 ) ) ( not ( = ?auto_888809 ?auto_888816 ) ) ( not ( = ?auto_888809 ?auto_888817 ) ) ( not ( = ?auto_888809 ?auto_888818 ) ) ( not ( = ?auto_888809 ?auto_888819 ) ) ( not ( = ?auto_888809 ?auto_888820 ) ) ( not ( = ?auto_888809 ?auto_888821 ) ) ( not ( = ?auto_888809 ?auto_888822 ) ) ( not ( = ?auto_888809 ?auto_888823 ) ) ( not ( = ?auto_888809 ?auto_888824 ) ) ( not ( = ?auto_888809 ?auto_888825 ) ) ( not ( = ?auto_888809 ?auto_888826 ) ) ( not ( = ?auto_888810 ?auto_888811 ) ) ( not ( = ?auto_888810 ?auto_888812 ) ) ( not ( = ?auto_888810 ?auto_888813 ) ) ( not ( = ?auto_888810 ?auto_888814 ) ) ( not ( = ?auto_888810 ?auto_888815 ) ) ( not ( = ?auto_888810 ?auto_888816 ) ) ( not ( = ?auto_888810 ?auto_888817 ) ) ( not ( = ?auto_888810 ?auto_888818 ) ) ( not ( = ?auto_888810 ?auto_888819 ) ) ( not ( = ?auto_888810 ?auto_888820 ) ) ( not ( = ?auto_888810 ?auto_888821 ) ) ( not ( = ?auto_888810 ?auto_888822 ) ) ( not ( = ?auto_888810 ?auto_888823 ) ) ( not ( = ?auto_888810 ?auto_888824 ) ) ( not ( = ?auto_888810 ?auto_888825 ) ) ( not ( = ?auto_888810 ?auto_888826 ) ) ( not ( = ?auto_888811 ?auto_888812 ) ) ( not ( = ?auto_888811 ?auto_888813 ) ) ( not ( = ?auto_888811 ?auto_888814 ) ) ( not ( = ?auto_888811 ?auto_888815 ) ) ( not ( = ?auto_888811 ?auto_888816 ) ) ( not ( = ?auto_888811 ?auto_888817 ) ) ( not ( = ?auto_888811 ?auto_888818 ) ) ( not ( = ?auto_888811 ?auto_888819 ) ) ( not ( = ?auto_888811 ?auto_888820 ) ) ( not ( = ?auto_888811 ?auto_888821 ) ) ( not ( = ?auto_888811 ?auto_888822 ) ) ( not ( = ?auto_888811 ?auto_888823 ) ) ( not ( = ?auto_888811 ?auto_888824 ) ) ( not ( = ?auto_888811 ?auto_888825 ) ) ( not ( = ?auto_888811 ?auto_888826 ) ) ( not ( = ?auto_888812 ?auto_888813 ) ) ( not ( = ?auto_888812 ?auto_888814 ) ) ( not ( = ?auto_888812 ?auto_888815 ) ) ( not ( = ?auto_888812 ?auto_888816 ) ) ( not ( = ?auto_888812 ?auto_888817 ) ) ( not ( = ?auto_888812 ?auto_888818 ) ) ( not ( = ?auto_888812 ?auto_888819 ) ) ( not ( = ?auto_888812 ?auto_888820 ) ) ( not ( = ?auto_888812 ?auto_888821 ) ) ( not ( = ?auto_888812 ?auto_888822 ) ) ( not ( = ?auto_888812 ?auto_888823 ) ) ( not ( = ?auto_888812 ?auto_888824 ) ) ( not ( = ?auto_888812 ?auto_888825 ) ) ( not ( = ?auto_888812 ?auto_888826 ) ) ( not ( = ?auto_888813 ?auto_888814 ) ) ( not ( = ?auto_888813 ?auto_888815 ) ) ( not ( = ?auto_888813 ?auto_888816 ) ) ( not ( = ?auto_888813 ?auto_888817 ) ) ( not ( = ?auto_888813 ?auto_888818 ) ) ( not ( = ?auto_888813 ?auto_888819 ) ) ( not ( = ?auto_888813 ?auto_888820 ) ) ( not ( = ?auto_888813 ?auto_888821 ) ) ( not ( = ?auto_888813 ?auto_888822 ) ) ( not ( = ?auto_888813 ?auto_888823 ) ) ( not ( = ?auto_888813 ?auto_888824 ) ) ( not ( = ?auto_888813 ?auto_888825 ) ) ( not ( = ?auto_888813 ?auto_888826 ) ) ( not ( = ?auto_888814 ?auto_888815 ) ) ( not ( = ?auto_888814 ?auto_888816 ) ) ( not ( = ?auto_888814 ?auto_888817 ) ) ( not ( = ?auto_888814 ?auto_888818 ) ) ( not ( = ?auto_888814 ?auto_888819 ) ) ( not ( = ?auto_888814 ?auto_888820 ) ) ( not ( = ?auto_888814 ?auto_888821 ) ) ( not ( = ?auto_888814 ?auto_888822 ) ) ( not ( = ?auto_888814 ?auto_888823 ) ) ( not ( = ?auto_888814 ?auto_888824 ) ) ( not ( = ?auto_888814 ?auto_888825 ) ) ( not ( = ?auto_888814 ?auto_888826 ) ) ( not ( = ?auto_888815 ?auto_888816 ) ) ( not ( = ?auto_888815 ?auto_888817 ) ) ( not ( = ?auto_888815 ?auto_888818 ) ) ( not ( = ?auto_888815 ?auto_888819 ) ) ( not ( = ?auto_888815 ?auto_888820 ) ) ( not ( = ?auto_888815 ?auto_888821 ) ) ( not ( = ?auto_888815 ?auto_888822 ) ) ( not ( = ?auto_888815 ?auto_888823 ) ) ( not ( = ?auto_888815 ?auto_888824 ) ) ( not ( = ?auto_888815 ?auto_888825 ) ) ( not ( = ?auto_888815 ?auto_888826 ) ) ( not ( = ?auto_888816 ?auto_888817 ) ) ( not ( = ?auto_888816 ?auto_888818 ) ) ( not ( = ?auto_888816 ?auto_888819 ) ) ( not ( = ?auto_888816 ?auto_888820 ) ) ( not ( = ?auto_888816 ?auto_888821 ) ) ( not ( = ?auto_888816 ?auto_888822 ) ) ( not ( = ?auto_888816 ?auto_888823 ) ) ( not ( = ?auto_888816 ?auto_888824 ) ) ( not ( = ?auto_888816 ?auto_888825 ) ) ( not ( = ?auto_888816 ?auto_888826 ) ) ( not ( = ?auto_888817 ?auto_888818 ) ) ( not ( = ?auto_888817 ?auto_888819 ) ) ( not ( = ?auto_888817 ?auto_888820 ) ) ( not ( = ?auto_888817 ?auto_888821 ) ) ( not ( = ?auto_888817 ?auto_888822 ) ) ( not ( = ?auto_888817 ?auto_888823 ) ) ( not ( = ?auto_888817 ?auto_888824 ) ) ( not ( = ?auto_888817 ?auto_888825 ) ) ( not ( = ?auto_888817 ?auto_888826 ) ) ( not ( = ?auto_888818 ?auto_888819 ) ) ( not ( = ?auto_888818 ?auto_888820 ) ) ( not ( = ?auto_888818 ?auto_888821 ) ) ( not ( = ?auto_888818 ?auto_888822 ) ) ( not ( = ?auto_888818 ?auto_888823 ) ) ( not ( = ?auto_888818 ?auto_888824 ) ) ( not ( = ?auto_888818 ?auto_888825 ) ) ( not ( = ?auto_888818 ?auto_888826 ) ) ( not ( = ?auto_888819 ?auto_888820 ) ) ( not ( = ?auto_888819 ?auto_888821 ) ) ( not ( = ?auto_888819 ?auto_888822 ) ) ( not ( = ?auto_888819 ?auto_888823 ) ) ( not ( = ?auto_888819 ?auto_888824 ) ) ( not ( = ?auto_888819 ?auto_888825 ) ) ( not ( = ?auto_888819 ?auto_888826 ) ) ( not ( = ?auto_888820 ?auto_888821 ) ) ( not ( = ?auto_888820 ?auto_888822 ) ) ( not ( = ?auto_888820 ?auto_888823 ) ) ( not ( = ?auto_888820 ?auto_888824 ) ) ( not ( = ?auto_888820 ?auto_888825 ) ) ( not ( = ?auto_888820 ?auto_888826 ) ) ( not ( = ?auto_888821 ?auto_888822 ) ) ( not ( = ?auto_888821 ?auto_888823 ) ) ( not ( = ?auto_888821 ?auto_888824 ) ) ( not ( = ?auto_888821 ?auto_888825 ) ) ( not ( = ?auto_888821 ?auto_888826 ) ) ( not ( = ?auto_888822 ?auto_888823 ) ) ( not ( = ?auto_888822 ?auto_888824 ) ) ( not ( = ?auto_888822 ?auto_888825 ) ) ( not ( = ?auto_888822 ?auto_888826 ) ) ( not ( = ?auto_888823 ?auto_888824 ) ) ( not ( = ?auto_888823 ?auto_888825 ) ) ( not ( = ?auto_888823 ?auto_888826 ) ) ( not ( = ?auto_888824 ?auto_888825 ) ) ( not ( = ?auto_888824 ?auto_888826 ) ) ( not ( = ?auto_888825 ?auto_888826 ) ) ( ON ?auto_888825 ?auto_888826 ) ( ON ?auto_888824 ?auto_888825 ) ( ON ?auto_888823 ?auto_888824 ) ( ON ?auto_888822 ?auto_888823 ) ( ON ?auto_888821 ?auto_888822 ) ( ON ?auto_888820 ?auto_888821 ) ( ON ?auto_888819 ?auto_888820 ) ( ON ?auto_888818 ?auto_888819 ) ( ON ?auto_888817 ?auto_888818 ) ( ON ?auto_888816 ?auto_888817 ) ( ON ?auto_888815 ?auto_888816 ) ( CLEAR ?auto_888813 ) ( ON ?auto_888814 ?auto_888815 ) ( CLEAR ?auto_888814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_888809 ?auto_888810 ?auto_888811 ?auto_888812 ?auto_888813 ?auto_888814 )
      ( MAKE-18PILE ?auto_888809 ?auto_888810 ?auto_888811 ?auto_888812 ?auto_888813 ?auto_888814 ?auto_888815 ?auto_888816 ?auto_888817 ?auto_888818 ?auto_888819 ?auto_888820 ?auto_888821 ?auto_888822 ?auto_888823 ?auto_888824 ?auto_888825 ?auto_888826 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888845 - BLOCK
      ?auto_888846 - BLOCK
      ?auto_888847 - BLOCK
      ?auto_888848 - BLOCK
      ?auto_888849 - BLOCK
      ?auto_888850 - BLOCK
      ?auto_888851 - BLOCK
      ?auto_888852 - BLOCK
      ?auto_888853 - BLOCK
      ?auto_888854 - BLOCK
      ?auto_888855 - BLOCK
      ?auto_888856 - BLOCK
      ?auto_888857 - BLOCK
      ?auto_888858 - BLOCK
      ?auto_888859 - BLOCK
      ?auto_888860 - BLOCK
      ?auto_888861 - BLOCK
      ?auto_888862 - BLOCK
    )
    :vars
    (
      ?auto_888863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_888862 ?auto_888863 ) ( ON-TABLE ?auto_888845 ) ( ON ?auto_888846 ?auto_888845 ) ( ON ?auto_888847 ?auto_888846 ) ( ON ?auto_888848 ?auto_888847 ) ( not ( = ?auto_888845 ?auto_888846 ) ) ( not ( = ?auto_888845 ?auto_888847 ) ) ( not ( = ?auto_888845 ?auto_888848 ) ) ( not ( = ?auto_888845 ?auto_888849 ) ) ( not ( = ?auto_888845 ?auto_888850 ) ) ( not ( = ?auto_888845 ?auto_888851 ) ) ( not ( = ?auto_888845 ?auto_888852 ) ) ( not ( = ?auto_888845 ?auto_888853 ) ) ( not ( = ?auto_888845 ?auto_888854 ) ) ( not ( = ?auto_888845 ?auto_888855 ) ) ( not ( = ?auto_888845 ?auto_888856 ) ) ( not ( = ?auto_888845 ?auto_888857 ) ) ( not ( = ?auto_888845 ?auto_888858 ) ) ( not ( = ?auto_888845 ?auto_888859 ) ) ( not ( = ?auto_888845 ?auto_888860 ) ) ( not ( = ?auto_888845 ?auto_888861 ) ) ( not ( = ?auto_888845 ?auto_888862 ) ) ( not ( = ?auto_888845 ?auto_888863 ) ) ( not ( = ?auto_888846 ?auto_888847 ) ) ( not ( = ?auto_888846 ?auto_888848 ) ) ( not ( = ?auto_888846 ?auto_888849 ) ) ( not ( = ?auto_888846 ?auto_888850 ) ) ( not ( = ?auto_888846 ?auto_888851 ) ) ( not ( = ?auto_888846 ?auto_888852 ) ) ( not ( = ?auto_888846 ?auto_888853 ) ) ( not ( = ?auto_888846 ?auto_888854 ) ) ( not ( = ?auto_888846 ?auto_888855 ) ) ( not ( = ?auto_888846 ?auto_888856 ) ) ( not ( = ?auto_888846 ?auto_888857 ) ) ( not ( = ?auto_888846 ?auto_888858 ) ) ( not ( = ?auto_888846 ?auto_888859 ) ) ( not ( = ?auto_888846 ?auto_888860 ) ) ( not ( = ?auto_888846 ?auto_888861 ) ) ( not ( = ?auto_888846 ?auto_888862 ) ) ( not ( = ?auto_888846 ?auto_888863 ) ) ( not ( = ?auto_888847 ?auto_888848 ) ) ( not ( = ?auto_888847 ?auto_888849 ) ) ( not ( = ?auto_888847 ?auto_888850 ) ) ( not ( = ?auto_888847 ?auto_888851 ) ) ( not ( = ?auto_888847 ?auto_888852 ) ) ( not ( = ?auto_888847 ?auto_888853 ) ) ( not ( = ?auto_888847 ?auto_888854 ) ) ( not ( = ?auto_888847 ?auto_888855 ) ) ( not ( = ?auto_888847 ?auto_888856 ) ) ( not ( = ?auto_888847 ?auto_888857 ) ) ( not ( = ?auto_888847 ?auto_888858 ) ) ( not ( = ?auto_888847 ?auto_888859 ) ) ( not ( = ?auto_888847 ?auto_888860 ) ) ( not ( = ?auto_888847 ?auto_888861 ) ) ( not ( = ?auto_888847 ?auto_888862 ) ) ( not ( = ?auto_888847 ?auto_888863 ) ) ( not ( = ?auto_888848 ?auto_888849 ) ) ( not ( = ?auto_888848 ?auto_888850 ) ) ( not ( = ?auto_888848 ?auto_888851 ) ) ( not ( = ?auto_888848 ?auto_888852 ) ) ( not ( = ?auto_888848 ?auto_888853 ) ) ( not ( = ?auto_888848 ?auto_888854 ) ) ( not ( = ?auto_888848 ?auto_888855 ) ) ( not ( = ?auto_888848 ?auto_888856 ) ) ( not ( = ?auto_888848 ?auto_888857 ) ) ( not ( = ?auto_888848 ?auto_888858 ) ) ( not ( = ?auto_888848 ?auto_888859 ) ) ( not ( = ?auto_888848 ?auto_888860 ) ) ( not ( = ?auto_888848 ?auto_888861 ) ) ( not ( = ?auto_888848 ?auto_888862 ) ) ( not ( = ?auto_888848 ?auto_888863 ) ) ( not ( = ?auto_888849 ?auto_888850 ) ) ( not ( = ?auto_888849 ?auto_888851 ) ) ( not ( = ?auto_888849 ?auto_888852 ) ) ( not ( = ?auto_888849 ?auto_888853 ) ) ( not ( = ?auto_888849 ?auto_888854 ) ) ( not ( = ?auto_888849 ?auto_888855 ) ) ( not ( = ?auto_888849 ?auto_888856 ) ) ( not ( = ?auto_888849 ?auto_888857 ) ) ( not ( = ?auto_888849 ?auto_888858 ) ) ( not ( = ?auto_888849 ?auto_888859 ) ) ( not ( = ?auto_888849 ?auto_888860 ) ) ( not ( = ?auto_888849 ?auto_888861 ) ) ( not ( = ?auto_888849 ?auto_888862 ) ) ( not ( = ?auto_888849 ?auto_888863 ) ) ( not ( = ?auto_888850 ?auto_888851 ) ) ( not ( = ?auto_888850 ?auto_888852 ) ) ( not ( = ?auto_888850 ?auto_888853 ) ) ( not ( = ?auto_888850 ?auto_888854 ) ) ( not ( = ?auto_888850 ?auto_888855 ) ) ( not ( = ?auto_888850 ?auto_888856 ) ) ( not ( = ?auto_888850 ?auto_888857 ) ) ( not ( = ?auto_888850 ?auto_888858 ) ) ( not ( = ?auto_888850 ?auto_888859 ) ) ( not ( = ?auto_888850 ?auto_888860 ) ) ( not ( = ?auto_888850 ?auto_888861 ) ) ( not ( = ?auto_888850 ?auto_888862 ) ) ( not ( = ?auto_888850 ?auto_888863 ) ) ( not ( = ?auto_888851 ?auto_888852 ) ) ( not ( = ?auto_888851 ?auto_888853 ) ) ( not ( = ?auto_888851 ?auto_888854 ) ) ( not ( = ?auto_888851 ?auto_888855 ) ) ( not ( = ?auto_888851 ?auto_888856 ) ) ( not ( = ?auto_888851 ?auto_888857 ) ) ( not ( = ?auto_888851 ?auto_888858 ) ) ( not ( = ?auto_888851 ?auto_888859 ) ) ( not ( = ?auto_888851 ?auto_888860 ) ) ( not ( = ?auto_888851 ?auto_888861 ) ) ( not ( = ?auto_888851 ?auto_888862 ) ) ( not ( = ?auto_888851 ?auto_888863 ) ) ( not ( = ?auto_888852 ?auto_888853 ) ) ( not ( = ?auto_888852 ?auto_888854 ) ) ( not ( = ?auto_888852 ?auto_888855 ) ) ( not ( = ?auto_888852 ?auto_888856 ) ) ( not ( = ?auto_888852 ?auto_888857 ) ) ( not ( = ?auto_888852 ?auto_888858 ) ) ( not ( = ?auto_888852 ?auto_888859 ) ) ( not ( = ?auto_888852 ?auto_888860 ) ) ( not ( = ?auto_888852 ?auto_888861 ) ) ( not ( = ?auto_888852 ?auto_888862 ) ) ( not ( = ?auto_888852 ?auto_888863 ) ) ( not ( = ?auto_888853 ?auto_888854 ) ) ( not ( = ?auto_888853 ?auto_888855 ) ) ( not ( = ?auto_888853 ?auto_888856 ) ) ( not ( = ?auto_888853 ?auto_888857 ) ) ( not ( = ?auto_888853 ?auto_888858 ) ) ( not ( = ?auto_888853 ?auto_888859 ) ) ( not ( = ?auto_888853 ?auto_888860 ) ) ( not ( = ?auto_888853 ?auto_888861 ) ) ( not ( = ?auto_888853 ?auto_888862 ) ) ( not ( = ?auto_888853 ?auto_888863 ) ) ( not ( = ?auto_888854 ?auto_888855 ) ) ( not ( = ?auto_888854 ?auto_888856 ) ) ( not ( = ?auto_888854 ?auto_888857 ) ) ( not ( = ?auto_888854 ?auto_888858 ) ) ( not ( = ?auto_888854 ?auto_888859 ) ) ( not ( = ?auto_888854 ?auto_888860 ) ) ( not ( = ?auto_888854 ?auto_888861 ) ) ( not ( = ?auto_888854 ?auto_888862 ) ) ( not ( = ?auto_888854 ?auto_888863 ) ) ( not ( = ?auto_888855 ?auto_888856 ) ) ( not ( = ?auto_888855 ?auto_888857 ) ) ( not ( = ?auto_888855 ?auto_888858 ) ) ( not ( = ?auto_888855 ?auto_888859 ) ) ( not ( = ?auto_888855 ?auto_888860 ) ) ( not ( = ?auto_888855 ?auto_888861 ) ) ( not ( = ?auto_888855 ?auto_888862 ) ) ( not ( = ?auto_888855 ?auto_888863 ) ) ( not ( = ?auto_888856 ?auto_888857 ) ) ( not ( = ?auto_888856 ?auto_888858 ) ) ( not ( = ?auto_888856 ?auto_888859 ) ) ( not ( = ?auto_888856 ?auto_888860 ) ) ( not ( = ?auto_888856 ?auto_888861 ) ) ( not ( = ?auto_888856 ?auto_888862 ) ) ( not ( = ?auto_888856 ?auto_888863 ) ) ( not ( = ?auto_888857 ?auto_888858 ) ) ( not ( = ?auto_888857 ?auto_888859 ) ) ( not ( = ?auto_888857 ?auto_888860 ) ) ( not ( = ?auto_888857 ?auto_888861 ) ) ( not ( = ?auto_888857 ?auto_888862 ) ) ( not ( = ?auto_888857 ?auto_888863 ) ) ( not ( = ?auto_888858 ?auto_888859 ) ) ( not ( = ?auto_888858 ?auto_888860 ) ) ( not ( = ?auto_888858 ?auto_888861 ) ) ( not ( = ?auto_888858 ?auto_888862 ) ) ( not ( = ?auto_888858 ?auto_888863 ) ) ( not ( = ?auto_888859 ?auto_888860 ) ) ( not ( = ?auto_888859 ?auto_888861 ) ) ( not ( = ?auto_888859 ?auto_888862 ) ) ( not ( = ?auto_888859 ?auto_888863 ) ) ( not ( = ?auto_888860 ?auto_888861 ) ) ( not ( = ?auto_888860 ?auto_888862 ) ) ( not ( = ?auto_888860 ?auto_888863 ) ) ( not ( = ?auto_888861 ?auto_888862 ) ) ( not ( = ?auto_888861 ?auto_888863 ) ) ( not ( = ?auto_888862 ?auto_888863 ) ) ( ON ?auto_888861 ?auto_888862 ) ( ON ?auto_888860 ?auto_888861 ) ( ON ?auto_888859 ?auto_888860 ) ( ON ?auto_888858 ?auto_888859 ) ( ON ?auto_888857 ?auto_888858 ) ( ON ?auto_888856 ?auto_888857 ) ( ON ?auto_888855 ?auto_888856 ) ( ON ?auto_888854 ?auto_888855 ) ( ON ?auto_888853 ?auto_888854 ) ( ON ?auto_888852 ?auto_888853 ) ( ON ?auto_888851 ?auto_888852 ) ( ON ?auto_888850 ?auto_888851 ) ( CLEAR ?auto_888848 ) ( ON ?auto_888849 ?auto_888850 ) ( CLEAR ?auto_888849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_888845 ?auto_888846 ?auto_888847 ?auto_888848 ?auto_888849 )
      ( MAKE-18PILE ?auto_888845 ?auto_888846 ?auto_888847 ?auto_888848 ?auto_888849 ?auto_888850 ?auto_888851 ?auto_888852 ?auto_888853 ?auto_888854 ?auto_888855 ?auto_888856 ?auto_888857 ?auto_888858 ?auto_888859 ?auto_888860 ?auto_888861 ?auto_888862 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888882 - BLOCK
      ?auto_888883 - BLOCK
      ?auto_888884 - BLOCK
      ?auto_888885 - BLOCK
      ?auto_888886 - BLOCK
      ?auto_888887 - BLOCK
      ?auto_888888 - BLOCK
      ?auto_888889 - BLOCK
      ?auto_888890 - BLOCK
      ?auto_888891 - BLOCK
      ?auto_888892 - BLOCK
      ?auto_888893 - BLOCK
      ?auto_888894 - BLOCK
      ?auto_888895 - BLOCK
      ?auto_888896 - BLOCK
      ?auto_888897 - BLOCK
      ?auto_888898 - BLOCK
      ?auto_888899 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_888899 ) ( ON-TABLE ?auto_888882 ) ( ON ?auto_888883 ?auto_888882 ) ( ON ?auto_888884 ?auto_888883 ) ( ON ?auto_888885 ?auto_888884 ) ( not ( = ?auto_888882 ?auto_888883 ) ) ( not ( = ?auto_888882 ?auto_888884 ) ) ( not ( = ?auto_888882 ?auto_888885 ) ) ( not ( = ?auto_888882 ?auto_888886 ) ) ( not ( = ?auto_888882 ?auto_888887 ) ) ( not ( = ?auto_888882 ?auto_888888 ) ) ( not ( = ?auto_888882 ?auto_888889 ) ) ( not ( = ?auto_888882 ?auto_888890 ) ) ( not ( = ?auto_888882 ?auto_888891 ) ) ( not ( = ?auto_888882 ?auto_888892 ) ) ( not ( = ?auto_888882 ?auto_888893 ) ) ( not ( = ?auto_888882 ?auto_888894 ) ) ( not ( = ?auto_888882 ?auto_888895 ) ) ( not ( = ?auto_888882 ?auto_888896 ) ) ( not ( = ?auto_888882 ?auto_888897 ) ) ( not ( = ?auto_888882 ?auto_888898 ) ) ( not ( = ?auto_888882 ?auto_888899 ) ) ( not ( = ?auto_888883 ?auto_888884 ) ) ( not ( = ?auto_888883 ?auto_888885 ) ) ( not ( = ?auto_888883 ?auto_888886 ) ) ( not ( = ?auto_888883 ?auto_888887 ) ) ( not ( = ?auto_888883 ?auto_888888 ) ) ( not ( = ?auto_888883 ?auto_888889 ) ) ( not ( = ?auto_888883 ?auto_888890 ) ) ( not ( = ?auto_888883 ?auto_888891 ) ) ( not ( = ?auto_888883 ?auto_888892 ) ) ( not ( = ?auto_888883 ?auto_888893 ) ) ( not ( = ?auto_888883 ?auto_888894 ) ) ( not ( = ?auto_888883 ?auto_888895 ) ) ( not ( = ?auto_888883 ?auto_888896 ) ) ( not ( = ?auto_888883 ?auto_888897 ) ) ( not ( = ?auto_888883 ?auto_888898 ) ) ( not ( = ?auto_888883 ?auto_888899 ) ) ( not ( = ?auto_888884 ?auto_888885 ) ) ( not ( = ?auto_888884 ?auto_888886 ) ) ( not ( = ?auto_888884 ?auto_888887 ) ) ( not ( = ?auto_888884 ?auto_888888 ) ) ( not ( = ?auto_888884 ?auto_888889 ) ) ( not ( = ?auto_888884 ?auto_888890 ) ) ( not ( = ?auto_888884 ?auto_888891 ) ) ( not ( = ?auto_888884 ?auto_888892 ) ) ( not ( = ?auto_888884 ?auto_888893 ) ) ( not ( = ?auto_888884 ?auto_888894 ) ) ( not ( = ?auto_888884 ?auto_888895 ) ) ( not ( = ?auto_888884 ?auto_888896 ) ) ( not ( = ?auto_888884 ?auto_888897 ) ) ( not ( = ?auto_888884 ?auto_888898 ) ) ( not ( = ?auto_888884 ?auto_888899 ) ) ( not ( = ?auto_888885 ?auto_888886 ) ) ( not ( = ?auto_888885 ?auto_888887 ) ) ( not ( = ?auto_888885 ?auto_888888 ) ) ( not ( = ?auto_888885 ?auto_888889 ) ) ( not ( = ?auto_888885 ?auto_888890 ) ) ( not ( = ?auto_888885 ?auto_888891 ) ) ( not ( = ?auto_888885 ?auto_888892 ) ) ( not ( = ?auto_888885 ?auto_888893 ) ) ( not ( = ?auto_888885 ?auto_888894 ) ) ( not ( = ?auto_888885 ?auto_888895 ) ) ( not ( = ?auto_888885 ?auto_888896 ) ) ( not ( = ?auto_888885 ?auto_888897 ) ) ( not ( = ?auto_888885 ?auto_888898 ) ) ( not ( = ?auto_888885 ?auto_888899 ) ) ( not ( = ?auto_888886 ?auto_888887 ) ) ( not ( = ?auto_888886 ?auto_888888 ) ) ( not ( = ?auto_888886 ?auto_888889 ) ) ( not ( = ?auto_888886 ?auto_888890 ) ) ( not ( = ?auto_888886 ?auto_888891 ) ) ( not ( = ?auto_888886 ?auto_888892 ) ) ( not ( = ?auto_888886 ?auto_888893 ) ) ( not ( = ?auto_888886 ?auto_888894 ) ) ( not ( = ?auto_888886 ?auto_888895 ) ) ( not ( = ?auto_888886 ?auto_888896 ) ) ( not ( = ?auto_888886 ?auto_888897 ) ) ( not ( = ?auto_888886 ?auto_888898 ) ) ( not ( = ?auto_888886 ?auto_888899 ) ) ( not ( = ?auto_888887 ?auto_888888 ) ) ( not ( = ?auto_888887 ?auto_888889 ) ) ( not ( = ?auto_888887 ?auto_888890 ) ) ( not ( = ?auto_888887 ?auto_888891 ) ) ( not ( = ?auto_888887 ?auto_888892 ) ) ( not ( = ?auto_888887 ?auto_888893 ) ) ( not ( = ?auto_888887 ?auto_888894 ) ) ( not ( = ?auto_888887 ?auto_888895 ) ) ( not ( = ?auto_888887 ?auto_888896 ) ) ( not ( = ?auto_888887 ?auto_888897 ) ) ( not ( = ?auto_888887 ?auto_888898 ) ) ( not ( = ?auto_888887 ?auto_888899 ) ) ( not ( = ?auto_888888 ?auto_888889 ) ) ( not ( = ?auto_888888 ?auto_888890 ) ) ( not ( = ?auto_888888 ?auto_888891 ) ) ( not ( = ?auto_888888 ?auto_888892 ) ) ( not ( = ?auto_888888 ?auto_888893 ) ) ( not ( = ?auto_888888 ?auto_888894 ) ) ( not ( = ?auto_888888 ?auto_888895 ) ) ( not ( = ?auto_888888 ?auto_888896 ) ) ( not ( = ?auto_888888 ?auto_888897 ) ) ( not ( = ?auto_888888 ?auto_888898 ) ) ( not ( = ?auto_888888 ?auto_888899 ) ) ( not ( = ?auto_888889 ?auto_888890 ) ) ( not ( = ?auto_888889 ?auto_888891 ) ) ( not ( = ?auto_888889 ?auto_888892 ) ) ( not ( = ?auto_888889 ?auto_888893 ) ) ( not ( = ?auto_888889 ?auto_888894 ) ) ( not ( = ?auto_888889 ?auto_888895 ) ) ( not ( = ?auto_888889 ?auto_888896 ) ) ( not ( = ?auto_888889 ?auto_888897 ) ) ( not ( = ?auto_888889 ?auto_888898 ) ) ( not ( = ?auto_888889 ?auto_888899 ) ) ( not ( = ?auto_888890 ?auto_888891 ) ) ( not ( = ?auto_888890 ?auto_888892 ) ) ( not ( = ?auto_888890 ?auto_888893 ) ) ( not ( = ?auto_888890 ?auto_888894 ) ) ( not ( = ?auto_888890 ?auto_888895 ) ) ( not ( = ?auto_888890 ?auto_888896 ) ) ( not ( = ?auto_888890 ?auto_888897 ) ) ( not ( = ?auto_888890 ?auto_888898 ) ) ( not ( = ?auto_888890 ?auto_888899 ) ) ( not ( = ?auto_888891 ?auto_888892 ) ) ( not ( = ?auto_888891 ?auto_888893 ) ) ( not ( = ?auto_888891 ?auto_888894 ) ) ( not ( = ?auto_888891 ?auto_888895 ) ) ( not ( = ?auto_888891 ?auto_888896 ) ) ( not ( = ?auto_888891 ?auto_888897 ) ) ( not ( = ?auto_888891 ?auto_888898 ) ) ( not ( = ?auto_888891 ?auto_888899 ) ) ( not ( = ?auto_888892 ?auto_888893 ) ) ( not ( = ?auto_888892 ?auto_888894 ) ) ( not ( = ?auto_888892 ?auto_888895 ) ) ( not ( = ?auto_888892 ?auto_888896 ) ) ( not ( = ?auto_888892 ?auto_888897 ) ) ( not ( = ?auto_888892 ?auto_888898 ) ) ( not ( = ?auto_888892 ?auto_888899 ) ) ( not ( = ?auto_888893 ?auto_888894 ) ) ( not ( = ?auto_888893 ?auto_888895 ) ) ( not ( = ?auto_888893 ?auto_888896 ) ) ( not ( = ?auto_888893 ?auto_888897 ) ) ( not ( = ?auto_888893 ?auto_888898 ) ) ( not ( = ?auto_888893 ?auto_888899 ) ) ( not ( = ?auto_888894 ?auto_888895 ) ) ( not ( = ?auto_888894 ?auto_888896 ) ) ( not ( = ?auto_888894 ?auto_888897 ) ) ( not ( = ?auto_888894 ?auto_888898 ) ) ( not ( = ?auto_888894 ?auto_888899 ) ) ( not ( = ?auto_888895 ?auto_888896 ) ) ( not ( = ?auto_888895 ?auto_888897 ) ) ( not ( = ?auto_888895 ?auto_888898 ) ) ( not ( = ?auto_888895 ?auto_888899 ) ) ( not ( = ?auto_888896 ?auto_888897 ) ) ( not ( = ?auto_888896 ?auto_888898 ) ) ( not ( = ?auto_888896 ?auto_888899 ) ) ( not ( = ?auto_888897 ?auto_888898 ) ) ( not ( = ?auto_888897 ?auto_888899 ) ) ( not ( = ?auto_888898 ?auto_888899 ) ) ( ON ?auto_888898 ?auto_888899 ) ( ON ?auto_888897 ?auto_888898 ) ( ON ?auto_888896 ?auto_888897 ) ( ON ?auto_888895 ?auto_888896 ) ( ON ?auto_888894 ?auto_888895 ) ( ON ?auto_888893 ?auto_888894 ) ( ON ?auto_888892 ?auto_888893 ) ( ON ?auto_888891 ?auto_888892 ) ( ON ?auto_888890 ?auto_888891 ) ( ON ?auto_888889 ?auto_888890 ) ( ON ?auto_888888 ?auto_888889 ) ( ON ?auto_888887 ?auto_888888 ) ( CLEAR ?auto_888885 ) ( ON ?auto_888886 ?auto_888887 ) ( CLEAR ?auto_888886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_888882 ?auto_888883 ?auto_888884 ?auto_888885 ?auto_888886 )
      ( MAKE-18PILE ?auto_888882 ?auto_888883 ?auto_888884 ?auto_888885 ?auto_888886 ?auto_888887 ?auto_888888 ?auto_888889 ?auto_888890 ?auto_888891 ?auto_888892 ?auto_888893 ?auto_888894 ?auto_888895 ?auto_888896 ?auto_888897 ?auto_888898 ?auto_888899 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888918 - BLOCK
      ?auto_888919 - BLOCK
      ?auto_888920 - BLOCK
      ?auto_888921 - BLOCK
      ?auto_888922 - BLOCK
      ?auto_888923 - BLOCK
      ?auto_888924 - BLOCK
      ?auto_888925 - BLOCK
      ?auto_888926 - BLOCK
      ?auto_888927 - BLOCK
      ?auto_888928 - BLOCK
      ?auto_888929 - BLOCK
      ?auto_888930 - BLOCK
      ?auto_888931 - BLOCK
      ?auto_888932 - BLOCK
      ?auto_888933 - BLOCK
      ?auto_888934 - BLOCK
      ?auto_888935 - BLOCK
    )
    :vars
    (
      ?auto_888936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_888935 ?auto_888936 ) ( ON-TABLE ?auto_888918 ) ( ON ?auto_888919 ?auto_888918 ) ( ON ?auto_888920 ?auto_888919 ) ( not ( = ?auto_888918 ?auto_888919 ) ) ( not ( = ?auto_888918 ?auto_888920 ) ) ( not ( = ?auto_888918 ?auto_888921 ) ) ( not ( = ?auto_888918 ?auto_888922 ) ) ( not ( = ?auto_888918 ?auto_888923 ) ) ( not ( = ?auto_888918 ?auto_888924 ) ) ( not ( = ?auto_888918 ?auto_888925 ) ) ( not ( = ?auto_888918 ?auto_888926 ) ) ( not ( = ?auto_888918 ?auto_888927 ) ) ( not ( = ?auto_888918 ?auto_888928 ) ) ( not ( = ?auto_888918 ?auto_888929 ) ) ( not ( = ?auto_888918 ?auto_888930 ) ) ( not ( = ?auto_888918 ?auto_888931 ) ) ( not ( = ?auto_888918 ?auto_888932 ) ) ( not ( = ?auto_888918 ?auto_888933 ) ) ( not ( = ?auto_888918 ?auto_888934 ) ) ( not ( = ?auto_888918 ?auto_888935 ) ) ( not ( = ?auto_888918 ?auto_888936 ) ) ( not ( = ?auto_888919 ?auto_888920 ) ) ( not ( = ?auto_888919 ?auto_888921 ) ) ( not ( = ?auto_888919 ?auto_888922 ) ) ( not ( = ?auto_888919 ?auto_888923 ) ) ( not ( = ?auto_888919 ?auto_888924 ) ) ( not ( = ?auto_888919 ?auto_888925 ) ) ( not ( = ?auto_888919 ?auto_888926 ) ) ( not ( = ?auto_888919 ?auto_888927 ) ) ( not ( = ?auto_888919 ?auto_888928 ) ) ( not ( = ?auto_888919 ?auto_888929 ) ) ( not ( = ?auto_888919 ?auto_888930 ) ) ( not ( = ?auto_888919 ?auto_888931 ) ) ( not ( = ?auto_888919 ?auto_888932 ) ) ( not ( = ?auto_888919 ?auto_888933 ) ) ( not ( = ?auto_888919 ?auto_888934 ) ) ( not ( = ?auto_888919 ?auto_888935 ) ) ( not ( = ?auto_888919 ?auto_888936 ) ) ( not ( = ?auto_888920 ?auto_888921 ) ) ( not ( = ?auto_888920 ?auto_888922 ) ) ( not ( = ?auto_888920 ?auto_888923 ) ) ( not ( = ?auto_888920 ?auto_888924 ) ) ( not ( = ?auto_888920 ?auto_888925 ) ) ( not ( = ?auto_888920 ?auto_888926 ) ) ( not ( = ?auto_888920 ?auto_888927 ) ) ( not ( = ?auto_888920 ?auto_888928 ) ) ( not ( = ?auto_888920 ?auto_888929 ) ) ( not ( = ?auto_888920 ?auto_888930 ) ) ( not ( = ?auto_888920 ?auto_888931 ) ) ( not ( = ?auto_888920 ?auto_888932 ) ) ( not ( = ?auto_888920 ?auto_888933 ) ) ( not ( = ?auto_888920 ?auto_888934 ) ) ( not ( = ?auto_888920 ?auto_888935 ) ) ( not ( = ?auto_888920 ?auto_888936 ) ) ( not ( = ?auto_888921 ?auto_888922 ) ) ( not ( = ?auto_888921 ?auto_888923 ) ) ( not ( = ?auto_888921 ?auto_888924 ) ) ( not ( = ?auto_888921 ?auto_888925 ) ) ( not ( = ?auto_888921 ?auto_888926 ) ) ( not ( = ?auto_888921 ?auto_888927 ) ) ( not ( = ?auto_888921 ?auto_888928 ) ) ( not ( = ?auto_888921 ?auto_888929 ) ) ( not ( = ?auto_888921 ?auto_888930 ) ) ( not ( = ?auto_888921 ?auto_888931 ) ) ( not ( = ?auto_888921 ?auto_888932 ) ) ( not ( = ?auto_888921 ?auto_888933 ) ) ( not ( = ?auto_888921 ?auto_888934 ) ) ( not ( = ?auto_888921 ?auto_888935 ) ) ( not ( = ?auto_888921 ?auto_888936 ) ) ( not ( = ?auto_888922 ?auto_888923 ) ) ( not ( = ?auto_888922 ?auto_888924 ) ) ( not ( = ?auto_888922 ?auto_888925 ) ) ( not ( = ?auto_888922 ?auto_888926 ) ) ( not ( = ?auto_888922 ?auto_888927 ) ) ( not ( = ?auto_888922 ?auto_888928 ) ) ( not ( = ?auto_888922 ?auto_888929 ) ) ( not ( = ?auto_888922 ?auto_888930 ) ) ( not ( = ?auto_888922 ?auto_888931 ) ) ( not ( = ?auto_888922 ?auto_888932 ) ) ( not ( = ?auto_888922 ?auto_888933 ) ) ( not ( = ?auto_888922 ?auto_888934 ) ) ( not ( = ?auto_888922 ?auto_888935 ) ) ( not ( = ?auto_888922 ?auto_888936 ) ) ( not ( = ?auto_888923 ?auto_888924 ) ) ( not ( = ?auto_888923 ?auto_888925 ) ) ( not ( = ?auto_888923 ?auto_888926 ) ) ( not ( = ?auto_888923 ?auto_888927 ) ) ( not ( = ?auto_888923 ?auto_888928 ) ) ( not ( = ?auto_888923 ?auto_888929 ) ) ( not ( = ?auto_888923 ?auto_888930 ) ) ( not ( = ?auto_888923 ?auto_888931 ) ) ( not ( = ?auto_888923 ?auto_888932 ) ) ( not ( = ?auto_888923 ?auto_888933 ) ) ( not ( = ?auto_888923 ?auto_888934 ) ) ( not ( = ?auto_888923 ?auto_888935 ) ) ( not ( = ?auto_888923 ?auto_888936 ) ) ( not ( = ?auto_888924 ?auto_888925 ) ) ( not ( = ?auto_888924 ?auto_888926 ) ) ( not ( = ?auto_888924 ?auto_888927 ) ) ( not ( = ?auto_888924 ?auto_888928 ) ) ( not ( = ?auto_888924 ?auto_888929 ) ) ( not ( = ?auto_888924 ?auto_888930 ) ) ( not ( = ?auto_888924 ?auto_888931 ) ) ( not ( = ?auto_888924 ?auto_888932 ) ) ( not ( = ?auto_888924 ?auto_888933 ) ) ( not ( = ?auto_888924 ?auto_888934 ) ) ( not ( = ?auto_888924 ?auto_888935 ) ) ( not ( = ?auto_888924 ?auto_888936 ) ) ( not ( = ?auto_888925 ?auto_888926 ) ) ( not ( = ?auto_888925 ?auto_888927 ) ) ( not ( = ?auto_888925 ?auto_888928 ) ) ( not ( = ?auto_888925 ?auto_888929 ) ) ( not ( = ?auto_888925 ?auto_888930 ) ) ( not ( = ?auto_888925 ?auto_888931 ) ) ( not ( = ?auto_888925 ?auto_888932 ) ) ( not ( = ?auto_888925 ?auto_888933 ) ) ( not ( = ?auto_888925 ?auto_888934 ) ) ( not ( = ?auto_888925 ?auto_888935 ) ) ( not ( = ?auto_888925 ?auto_888936 ) ) ( not ( = ?auto_888926 ?auto_888927 ) ) ( not ( = ?auto_888926 ?auto_888928 ) ) ( not ( = ?auto_888926 ?auto_888929 ) ) ( not ( = ?auto_888926 ?auto_888930 ) ) ( not ( = ?auto_888926 ?auto_888931 ) ) ( not ( = ?auto_888926 ?auto_888932 ) ) ( not ( = ?auto_888926 ?auto_888933 ) ) ( not ( = ?auto_888926 ?auto_888934 ) ) ( not ( = ?auto_888926 ?auto_888935 ) ) ( not ( = ?auto_888926 ?auto_888936 ) ) ( not ( = ?auto_888927 ?auto_888928 ) ) ( not ( = ?auto_888927 ?auto_888929 ) ) ( not ( = ?auto_888927 ?auto_888930 ) ) ( not ( = ?auto_888927 ?auto_888931 ) ) ( not ( = ?auto_888927 ?auto_888932 ) ) ( not ( = ?auto_888927 ?auto_888933 ) ) ( not ( = ?auto_888927 ?auto_888934 ) ) ( not ( = ?auto_888927 ?auto_888935 ) ) ( not ( = ?auto_888927 ?auto_888936 ) ) ( not ( = ?auto_888928 ?auto_888929 ) ) ( not ( = ?auto_888928 ?auto_888930 ) ) ( not ( = ?auto_888928 ?auto_888931 ) ) ( not ( = ?auto_888928 ?auto_888932 ) ) ( not ( = ?auto_888928 ?auto_888933 ) ) ( not ( = ?auto_888928 ?auto_888934 ) ) ( not ( = ?auto_888928 ?auto_888935 ) ) ( not ( = ?auto_888928 ?auto_888936 ) ) ( not ( = ?auto_888929 ?auto_888930 ) ) ( not ( = ?auto_888929 ?auto_888931 ) ) ( not ( = ?auto_888929 ?auto_888932 ) ) ( not ( = ?auto_888929 ?auto_888933 ) ) ( not ( = ?auto_888929 ?auto_888934 ) ) ( not ( = ?auto_888929 ?auto_888935 ) ) ( not ( = ?auto_888929 ?auto_888936 ) ) ( not ( = ?auto_888930 ?auto_888931 ) ) ( not ( = ?auto_888930 ?auto_888932 ) ) ( not ( = ?auto_888930 ?auto_888933 ) ) ( not ( = ?auto_888930 ?auto_888934 ) ) ( not ( = ?auto_888930 ?auto_888935 ) ) ( not ( = ?auto_888930 ?auto_888936 ) ) ( not ( = ?auto_888931 ?auto_888932 ) ) ( not ( = ?auto_888931 ?auto_888933 ) ) ( not ( = ?auto_888931 ?auto_888934 ) ) ( not ( = ?auto_888931 ?auto_888935 ) ) ( not ( = ?auto_888931 ?auto_888936 ) ) ( not ( = ?auto_888932 ?auto_888933 ) ) ( not ( = ?auto_888932 ?auto_888934 ) ) ( not ( = ?auto_888932 ?auto_888935 ) ) ( not ( = ?auto_888932 ?auto_888936 ) ) ( not ( = ?auto_888933 ?auto_888934 ) ) ( not ( = ?auto_888933 ?auto_888935 ) ) ( not ( = ?auto_888933 ?auto_888936 ) ) ( not ( = ?auto_888934 ?auto_888935 ) ) ( not ( = ?auto_888934 ?auto_888936 ) ) ( not ( = ?auto_888935 ?auto_888936 ) ) ( ON ?auto_888934 ?auto_888935 ) ( ON ?auto_888933 ?auto_888934 ) ( ON ?auto_888932 ?auto_888933 ) ( ON ?auto_888931 ?auto_888932 ) ( ON ?auto_888930 ?auto_888931 ) ( ON ?auto_888929 ?auto_888930 ) ( ON ?auto_888928 ?auto_888929 ) ( ON ?auto_888927 ?auto_888928 ) ( ON ?auto_888926 ?auto_888927 ) ( ON ?auto_888925 ?auto_888926 ) ( ON ?auto_888924 ?auto_888925 ) ( ON ?auto_888923 ?auto_888924 ) ( ON ?auto_888922 ?auto_888923 ) ( CLEAR ?auto_888920 ) ( ON ?auto_888921 ?auto_888922 ) ( CLEAR ?auto_888921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_888918 ?auto_888919 ?auto_888920 ?auto_888921 )
      ( MAKE-18PILE ?auto_888918 ?auto_888919 ?auto_888920 ?auto_888921 ?auto_888922 ?auto_888923 ?auto_888924 ?auto_888925 ?auto_888926 ?auto_888927 ?auto_888928 ?auto_888929 ?auto_888930 ?auto_888931 ?auto_888932 ?auto_888933 ?auto_888934 ?auto_888935 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888955 - BLOCK
      ?auto_888956 - BLOCK
      ?auto_888957 - BLOCK
      ?auto_888958 - BLOCK
      ?auto_888959 - BLOCK
      ?auto_888960 - BLOCK
      ?auto_888961 - BLOCK
      ?auto_888962 - BLOCK
      ?auto_888963 - BLOCK
      ?auto_888964 - BLOCK
      ?auto_888965 - BLOCK
      ?auto_888966 - BLOCK
      ?auto_888967 - BLOCK
      ?auto_888968 - BLOCK
      ?auto_888969 - BLOCK
      ?auto_888970 - BLOCK
      ?auto_888971 - BLOCK
      ?auto_888972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_888972 ) ( ON-TABLE ?auto_888955 ) ( ON ?auto_888956 ?auto_888955 ) ( ON ?auto_888957 ?auto_888956 ) ( not ( = ?auto_888955 ?auto_888956 ) ) ( not ( = ?auto_888955 ?auto_888957 ) ) ( not ( = ?auto_888955 ?auto_888958 ) ) ( not ( = ?auto_888955 ?auto_888959 ) ) ( not ( = ?auto_888955 ?auto_888960 ) ) ( not ( = ?auto_888955 ?auto_888961 ) ) ( not ( = ?auto_888955 ?auto_888962 ) ) ( not ( = ?auto_888955 ?auto_888963 ) ) ( not ( = ?auto_888955 ?auto_888964 ) ) ( not ( = ?auto_888955 ?auto_888965 ) ) ( not ( = ?auto_888955 ?auto_888966 ) ) ( not ( = ?auto_888955 ?auto_888967 ) ) ( not ( = ?auto_888955 ?auto_888968 ) ) ( not ( = ?auto_888955 ?auto_888969 ) ) ( not ( = ?auto_888955 ?auto_888970 ) ) ( not ( = ?auto_888955 ?auto_888971 ) ) ( not ( = ?auto_888955 ?auto_888972 ) ) ( not ( = ?auto_888956 ?auto_888957 ) ) ( not ( = ?auto_888956 ?auto_888958 ) ) ( not ( = ?auto_888956 ?auto_888959 ) ) ( not ( = ?auto_888956 ?auto_888960 ) ) ( not ( = ?auto_888956 ?auto_888961 ) ) ( not ( = ?auto_888956 ?auto_888962 ) ) ( not ( = ?auto_888956 ?auto_888963 ) ) ( not ( = ?auto_888956 ?auto_888964 ) ) ( not ( = ?auto_888956 ?auto_888965 ) ) ( not ( = ?auto_888956 ?auto_888966 ) ) ( not ( = ?auto_888956 ?auto_888967 ) ) ( not ( = ?auto_888956 ?auto_888968 ) ) ( not ( = ?auto_888956 ?auto_888969 ) ) ( not ( = ?auto_888956 ?auto_888970 ) ) ( not ( = ?auto_888956 ?auto_888971 ) ) ( not ( = ?auto_888956 ?auto_888972 ) ) ( not ( = ?auto_888957 ?auto_888958 ) ) ( not ( = ?auto_888957 ?auto_888959 ) ) ( not ( = ?auto_888957 ?auto_888960 ) ) ( not ( = ?auto_888957 ?auto_888961 ) ) ( not ( = ?auto_888957 ?auto_888962 ) ) ( not ( = ?auto_888957 ?auto_888963 ) ) ( not ( = ?auto_888957 ?auto_888964 ) ) ( not ( = ?auto_888957 ?auto_888965 ) ) ( not ( = ?auto_888957 ?auto_888966 ) ) ( not ( = ?auto_888957 ?auto_888967 ) ) ( not ( = ?auto_888957 ?auto_888968 ) ) ( not ( = ?auto_888957 ?auto_888969 ) ) ( not ( = ?auto_888957 ?auto_888970 ) ) ( not ( = ?auto_888957 ?auto_888971 ) ) ( not ( = ?auto_888957 ?auto_888972 ) ) ( not ( = ?auto_888958 ?auto_888959 ) ) ( not ( = ?auto_888958 ?auto_888960 ) ) ( not ( = ?auto_888958 ?auto_888961 ) ) ( not ( = ?auto_888958 ?auto_888962 ) ) ( not ( = ?auto_888958 ?auto_888963 ) ) ( not ( = ?auto_888958 ?auto_888964 ) ) ( not ( = ?auto_888958 ?auto_888965 ) ) ( not ( = ?auto_888958 ?auto_888966 ) ) ( not ( = ?auto_888958 ?auto_888967 ) ) ( not ( = ?auto_888958 ?auto_888968 ) ) ( not ( = ?auto_888958 ?auto_888969 ) ) ( not ( = ?auto_888958 ?auto_888970 ) ) ( not ( = ?auto_888958 ?auto_888971 ) ) ( not ( = ?auto_888958 ?auto_888972 ) ) ( not ( = ?auto_888959 ?auto_888960 ) ) ( not ( = ?auto_888959 ?auto_888961 ) ) ( not ( = ?auto_888959 ?auto_888962 ) ) ( not ( = ?auto_888959 ?auto_888963 ) ) ( not ( = ?auto_888959 ?auto_888964 ) ) ( not ( = ?auto_888959 ?auto_888965 ) ) ( not ( = ?auto_888959 ?auto_888966 ) ) ( not ( = ?auto_888959 ?auto_888967 ) ) ( not ( = ?auto_888959 ?auto_888968 ) ) ( not ( = ?auto_888959 ?auto_888969 ) ) ( not ( = ?auto_888959 ?auto_888970 ) ) ( not ( = ?auto_888959 ?auto_888971 ) ) ( not ( = ?auto_888959 ?auto_888972 ) ) ( not ( = ?auto_888960 ?auto_888961 ) ) ( not ( = ?auto_888960 ?auto_888962 ) ) ( not ( = ?auto_888960 ?auto_888963 ) ) ( not ( = ?auto_888960 ?auto_888964 ) ) ( not ( = ?auto_888960 ?auto_888965 ) ) ( not ( = ?auto_888960 ?auto_888966 ) ) ( not ( = ?auto_888960 ?auto_888967 ) ) ( not ( = ?auto_888960 ?auto_888968 ) ) ( not ( = ?auto_888960 ?auto_888969 ) ) ( not ( = ?auto_888960 ?auto_888970 ) ) ( not ( = ?auto_888960 ?auto_888971 ) ) ( not ( = ?auto_888960 ?auto_888972 ) ) ( not ( = ?auto_888961 ?auto_888962 ) ) ( not ( = ?auto_888961 ?auto_888963 ) ) ( not ( = ?auto_888961 ?auto_888964 ) ) ( not ( = ?auto_888961 ?auto_888965 ) ) ( not ( = ?auto_888961 ?auto_888966 ) ) ( not ( = ?auto_888961 ?auto_888967 ) ) ( not ( = ?auto_888961 ?auto_888968 ) ) ( not ( = ?auto_888961 ?auto_888969 ) ) ( not ( = ?auto_888961 ?auto_888970 ) ) ( not ( = ?auto_888961 ?auto_888971 ) ) ( not ( = ?auto_888961 ?auto_888972 ) ) ( not ( = ?auto_888962 ?auto_888963 ) ) ( not ( = ?auto_888962 ?auto_888964 ) ) ( not ( = ?auto_888962 ?auto_888965 ) ) ( not ( = ?auto_888962 ?auto_888966 ) ) ( not ( = ?auto_888962 ?auto_888967 ) ) ( not ( = ?auto_888962 ?auto_888968 ) ) ( not ( = ?auto_888962 ?auto_888969 ) ) ( not ( = ?auto_888962 ?auto_888970 ) ) ( not ( = ?auto_888962 ?auto_888971 ) ) ( not ( = ?auto_888962 ?auto_888972 ) ) ( not ( = ?auto_888963 ?auto_888964 ) ) ( not ( = ?auto_888963 ?auto_888965 ) ) ( not ( = ?auto_888963 ?auto_888966 ) ) ( not ( = ?auto_888963 ?auto_888967 ) ) ( not ( = ?auto_888963 ?auto_888968 ) ) ( not ( = ?auto_888963 ?auto_888969 ) ) ( not ( = ?auto_888963 ?auto_888970 ) ) ( not ( = ?auto_888963 ?auto_888971 ) ) ( not ( = ?auto_888963 ?auto_888972 ) ) ( not ( = ?auto_888964 ?auto_888965 ) ) ( not ( = ?auto_888964 ?auto_888966 ) ) ( not ( = ?auto_888964 ?auto_888967 ) ) ( not ( = ?auto_888964 ?auto_888968 ) ) ( not ( = ?auto_888964 ?auto_888969 ) ) ( not ( = ?auto_888964 ?auto_888970 ) ) ( not ( = ?auto_888964 ?auto_888971 ) ) ( not ( = ?auto_888964 ?auto_888972 ) ) ( not ( = ?auto_888965 ?auto_888966 ) ) ( not ( = ?auto_888965 ?auto_888967 ) ) ( not ( = ?auto_888965 ?auto_888968 ) ) ( not ( = ?auto_888965 ?auto_888969 ) ) ( not ( = ?auto_888965 ?auto_888970 ) ) ( not ( = ?auto_888965 ?auto_888971 ) ) ( not ( = ?auto_888965 ?auto_888972 ) ) ( not ( = ?auto_888966 ?auto_888967 ) ) ( not ( = ?auto_888966 ?auto_888968 ) ) ( not ( = ?auto_888966 ?auto_888969 ) ) ( not ( = ?auto_888966 ?auto_888970 ) ) ( not ( = ?auto_888966 ?auto_888971 ) ) ( not ( = ?auto_888966 ?auto_888972 ) ) ( not ( = ?auto_888967 ?auto_888968 ) ) ( not ( = ?auto_888967 ?auto_888969 ) ) ( not ( = ?auto_888967 ?auto_888970 ) ) ( not ( = ?auto_888967 ?auto_888971 ) ) ( not ( = ?auto_888967 ?auto_888972 ) ) ( not ( = ?auto_888968 ?auto_888969 ) ) ( not ( = ?auto_888968 ?auto_888970 ) ) ( not ( = ?auto_888968 ?auto_888971 ) ) ( not ( = ?auto_888968 ?auto_888972 ) ) ( not ( = ?auto_888969 ?auto_888970 ) ) ( not ( = ?auto_888969 ?auto_888971 ) ) ( not ( = ?auto_888969 ?auto_888972 ) ) ( not ( = ?auto_888970 ?auto_888971 ) ) ( not ( = ?auto_888970 ?auto_888972 ) ) ( not ( = ?auto_888971 ?auto_888972 ) ) ( ON ?auto_888971 ?auto_888972 ) ( ON ?auto_888970 ?auto_888971 ) ( ON ?auto_888969 ?auto_888970 ) ( ON ?auto_888968 ?auto_888969 ) ( ON ?auto_888967 ?auto_888968 ) ( ON ?auto_888966 ?auto_888967 ) ( ON ?auto_888965 ?auto_888966 ) ( ON ?auto_888964 ?auto_888965 ) ( ON ?auto_888963 ?auto_888964 ) ( ON ?auto_888962 ?auto_888963 ) ( ON ?auto_888961 ?auto_888962 ) ( ON ?auto_888960 ?auto_888961 ) ( ON ?auto_888959 ?auto_888960 ) ( CLEAR ?auto_888957 ) ( ON ?auto_888958 ?auto_888959 ) ( CLEAR ?auto_888958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_888955 ?auto_888956 ?auto_888957 ?auto_888958 )
      ( MAKE-18PILE ?auto_888955 ?auto_888956 ?auto_888957 ?auto_888958 ?auto_888959 ?auto_888960 ?auto_888961 ?auto_888962 ?auto_888963 ?auto_888964 ?auto_888965 ?auto_888966 ?auto_888967 ?auto_888968 ?auto_888969 ?auto_888970 ?auto_888971 ?auto_888972 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_888991 - BLOCK
      ?auto_888992 - BLOCK
      ?auto_888993 - BLOCK
      ?auto_888994 - BLOCK
      ?auto_888995 - BLOCK
      ?auto_888996 - BLOCK
      ?auto_888997 - BLOCK
      ?auto_888998 - BLOCK
      ?auto_888999 - BLOCK
      ?auto_889000 - BLOCK
      ?auto_889001 - BLOCK
      ?auto_889002 - BLOCK
      ?auto_889003 - BLOCK
      ?auto_889004 - BLOCK
      ?auto_889005 - BLOCK
      ?auto_889006 - BLOCK
      ?auto_889007 - BLOCK
      ?auto_889008 - BLOCK
    )
    :vars
    (
      ?auto_889009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889008 ?auto_889009 ) ( ON-TABLE ?auto_888991 ) ( ON ?auto_888992 ?auto_888991 ) ( not ( = ?auto_888991 ?auto_888992 ) ) ( not ( = ?auto_888991 ?auto_888993 ) ) ( not ( = ?auto_888991 ?auto_888994 ) ) ( not ( = ?auto_888991 ?auto_888995 ) ) ( not ( = ?auto_888991 ?auto_888996 ) ) ( not ( = ?auto_888991 ?auto_888997 ) ) ( not ( = ?auto_888991 ?auto_888998 ) ) ( not ( = ?auto_888991 ?auto_888999 ) ) ( not ( = ?auto_888991 ?auto_889000 ) ) ( not ( = ?auto_888991 ?auto_889001 ) ) ( not ( = ?auto_888991 ?auto_889002 ) ) ( not ( = ?auto_888991 ?auto_889003 ) ) ( not ( = ?auto_888991 ?auto_889004 ) ) ( not ( = ?auto_888991 ?auto_889005 ) ) ( not ( = ?auto_888991 ?auto_889006 ) ) ( not ( = ?auto_888991 ?auto_889007 ) ) ( not ( = ?auto_888991 ?auto_889008 ) ) ( not ( = ?auto_888991 ?auto_889009 ) ) ( not ( = ?auto_888992 ?auto_888993 ) ) ( not ( = ?auto_888992 ?auto_888994 ) ) ( not ( = ?auto_888992 ?auto_888995 ) ) ( not ( = ?auto_888992 ?auto_888996 ) ) ( not ( = ?auto_888992 ?auto_888997 ) ) ( not ( = ?auto_888992 ?auto_888998 ) ) ( not ( = ?auto_888992 ?auto_888999 ) ) ( not ( = ?auto_888992 ?auto_889000 ) ) ( not ( = ?auto_888992 ?auto_889001 ) ) ( not ( = ?auto_888992 ?auto_889002 ) ) ( not ( = ?auto_888992 ?auto_889003 ) ) ( not ( = ?auto_888992 ?auto_889004 ) ) ( not ( = ?auto_888992 ?auto_889005 ) ) ( not ( = ?auto_888992 ?auto_889006 ) ) ( not ( = ?auto_888992 ?auto_889007 ) ) ( not ( = ?auto_888992 ?auto_889008 ) ) ( not ( = ?auto_888992 ?auto_889009 ) ) ( not ( = ?auto_888993 ?auto_888994 ) ) ( not ( = ?auto_888993 ?auto_888995 ) ) ( not ( = ?auto_888993 ?auto_888996 ) ) ( not ( = ?auto_888993 ?auto_888997 ) ) ( not ( = ?auto_888993 ?auto_888998 ) ) ( not ( = ?auto_888993 ?auto_888999 ) ) ( not ( = ?auto_888993 ?auto_889000 ) ) ( not ( = ?auto_888993 ?auto_889001 ) ) ( not ( = ?auto_888993 ?auto_889002 ) ) ( not ( = ?auto_888993 ?auto_889003 ) ) ( not ( = ?auto_888993 ?auto_889004 ) ) ( not ( = ?auto_888993 ?auto_889005 ) ) ( not ( = ?auto_888993 ?auto_889006 ) ) ( not ( = ?auto_888993 ?auto_889007 ) ) ( not ( = ?auto_888993 ?auto_889008 ) ) ( not ( = ?auto_888993 ?auto_889009 ) ) ( not ( = ?auto_888994 ?auto_888995 ) ) ( not ( = ?auto_888994 ?auto_888996 ) ) ( not ( = ?auto_888994 ?auto_888997 ) ) ( not ( = ?auto_888994 ?auto_888998 ) ) ( not ( = ?auto_888994 ?auto_888999 ) ) ( not ( = ?auto_888994 ?auto_889000 ) ) ( not ( = ?auto_888994 ?auto_889001 ) ) ( not ( = ?auto_888994 ?auto_889002 ) ) ( not ( = ?auto_888994 ?auto_889003 ) ) ( not ( = ?auto_888994 ?auto_889004 ) ) ( not ( = ?auto_888994 ?auto_889005 ) ) ( not ( = ?auto_888994 ?auto_889006 ) ) ( not ( = ?auto_888994 ?auto_889007 ) ) ( not ( = ?auto_888994 ?auto_889008 ) ) ( not ( = ?auto_888994 ?auto_889009 ) ) ( not ( = ?auto_888995 ?auto_888996 ) ) ( not ( = ?auto_888995 ?auto_888997 ) ) ( not ( = ?auto_888995 ?auto_888998 ) ) ( not ( = ?auto_888995 ?auto_888999 ) ) ( not ( = ?auto_888995 ?auto_889000 ) ) ( not ( = ?auto_888995 ?auto_889001 ) ) ( not ( = ?auto_888995 ?auto_889002 ) ) ( not ( = ?auto_888995 ?auto_889003 ) ) ( not ( = ?auto_888995 ?auto_889004 ) ) ( not ( = ?auto_888995 ?auto_889005 ) ) ( not ( = ?auto_888995 ?auto_889006 ) ) ( not ( = ?auto_888995 ?auto_889007 ) ) ( not ( = ?auto_888995 ?auto_889008 ) ) ( not ( = ?auto_888995 ?auto_889009 ) ) ( not ( = ?auto_888996 ?auto_888997 ) ) ( not ( = ?auto_888996 ?auto_888998 ) ) ( not ( = ?auto_888996 ?auto_888999 ) ) ( not ( = ?auto_888996 ?auto_889000 ) ) ( not ( = ?auto_888996 ?auto_889001 ) ) ( not ( = ?auto_888996 ?auto_889002 ) ) ( not ( = ?auto_888996 ?auto_889003 ) ) ( not ( = ?auto_888996 ?auto_889004 ) ) ( not ( = ?auto_888996 ?auto_889005 ) ) ( not ( = ?auto_888996 ?auto_889006 ) ) ( not ( = ?auto_888996 ?auto_889007 ) ) ( not ( = ?auto_888996 ?auto_889008 ) ) ( not ( = ?auto_888996 ?auto_889009 ) ) ( not ( = ?auto_888997 ?auto_888998 ) ) ( not ( = ?auto_888997 ?auto_888999 ) ) ( not ( = ?auto_888997 ?auto_889000 ) ) ( not ( = ?auto_888997 ?auto_889001 ) ) ( not ( = ?auto_888997 ?auto_889002 ) ) ( not ( = ?auto_888997 ?auto_889003 ) ) ( not ( = ?auto_888997 ?auto_889004 ) ) ( not ( = ?auto_888997 ?auto_889005 ) ) ( not ( = ?auto_888997 ?auto_889006 ) ) ( not ( = ?auto_888997 ?auto_889007 ) ) ( not ( = ?auto_888997 ?auto_889008 ) ) ( not ( = ?auto_888997 ?auto_889009 ) ) ( not ( = ?auto_888998 ?auto_888999 ) ) ( not ( = ?auto_888998 ?auto_889000 ) ) ( not ( = ?auto_888998 ?auto_889001 ) ) ( not ( = ?auto_888998 ?auto_889002 ) ) ( not ( = ?auto_888998 ?auto_889003 ) ) ( not ( = ?auto_888998 ?auto_889004 ) ) ( not ( = ?auto_888998 ?auto_889005 ) ) ( not ( = ?auto_888998 ?auto_889006 ) ) ( not ( = ?auto_888998 ?auto_889007 ) ) ( not ( = ?auto_888998 ?auto_889008 ) ) ( not ( = ?auto_888998 ?auto_889009 ) ) ( not ( = ?auto_888999 ?auto_889000 ) ) ( not ( = ?auto_888999 ?auto_889001 ) ) ( not ( = ?auto_888999 ?auto_889002 ) ) ( not ( = ?auto_888999 ?auto_889003 ) ) ( not ( = ?auto_888999 ?auto_889004 ) ) ( not ( = ?auto_888999 ?auto_889005 ) ) ( not ( = ?auto_888999 ?auto_889006 ) ) ( not ( = ?auto_888999 ?auto_889007 ) ) ( not ( = ?auto_888999 ?auto_889008 ) ) ( not ( = ?auto_888999 ?auto_889009 ) ) ( not ( = ?auto_889000 ?auto_889001 ) ) ( not ( = ?auto_889000 ?auto_889002 ) ) ( not ( = ?auto_889000 ?auto_889003 ) ) ( not ( = ?auto_889000 ?auto_889004 ) ) ( not ( = ?auto_889000 ?auto_889005 ) ) ( not ( = ?auto_889000 ?auto_889006 ) ) ( not ( = ?auto_889000 ?auto_889007 ) ) ( not ( = ?auto_889000 ?auto_889008 ) ) ( not ( = ?auto_889000 ?auto_889009 ) ) ( not ( = ?auto_889001 ?auto_889002 ) ) ( not ( = ?auto_889001 ?auto_889003 ) ) ( not ( = ?auto_889001 ?auto_889004 ) ) ( not ( = ?auto_889001 ?auto_889005 ) ) ( not ( = ?auto_889001 ?auto_889006 ) ) ( not ( = ?auto_889001 ?auto_889007 ) ) ( not ( = ?auto_889001 ?auto_889008 ) ) ( not ( = ?auto_889001 ?auto_889009 ) ) ( not ( = ?auto_889002 ?auto_889003 ) ) ( not ( = ?auto_889002 ?auto_889004 ) ) ( not ( = ?auto_889002 ?auto_889005 ) ) ( not ( = ?auto_889002 ?auto_889006 ) ) ( not ( = ?auto_889002 ?auto_889007 ) ) ( not ( = ?auto_889002 ?auto_889008 ) ) ( not ( = ?auto_889002 ?auto_889009 ) ) ( not ( = ?auto_889003 ?auto_889004 ) ) ( not ( = ?auto_889003 ?auto_889005 ) ) ( not ( = ?auto_889003 ?auto_889006 ) ) ( not ( = ?auto_889003 ?auto_889007 ) ) ( not ( = ?auto_889003 ?auto_889008 ) ) ( not ( = ?auto_889003 ?auto_889009 ) ) ( not ( = ?auto_889004 ?auto_889005 ) ) ( not ( = ?auto_889004 ?auto_889006 ) ) ( not ( = ?auto_889004 ?auto_889007 ) ) ( not ( = ?auto_889004 ?auto_889008 ) ) ( not ( = ?auto_889004 ?auto_889009 ) ) ( not ( = ?auto_889005 ?auto_889006 ) ) ( not ( = ?auto_889005 ?auto_889007 ) ) ( not ( = ?auto_889005 ?auto_889008 ) ) ( not ( = ?auto_889005 ?auto_889009 ) ) ( not ( = ?auto_889006 ?auto_889007 ) ) ( not ( = ?auto_889006 ?auto_889008 ) ) ( not ( = ?auto_889006 ?auto_889009 ) ) ( not ( = ?auto_889007 ?auto_889008 ) ) ( not ( = ?auto_889007 ?auto_889009 ) ) ( not ( = ?auto_889008 ?auto_889009 ) ) ( ON ?auto_889007 ?auto_889008 ) ( ON ?auto_889006 ?auto_889007 ) ( ON ?auto_889005 ?auto_889006 ) ( ON ?auto_889004 ?auto_889005 ) ( ON ?auto_889003 ?auto_889004 ) ( ON ?auto_889002 ?auto_889003 ) ( ON ?auto_889001 ?auto_889002 ) ( ON ?auto_889000 ?auto_889001 ) ( ON ?auto_888999 ?auto_889000 ) ( ON ?auto_888998 ?auto_888999 ) ( ON ?auto_888997 ?auto_888998 ) ( ON ?auto_888996 ?auto_888997 ) ( ON ?auto_888995 ?auto_888996 ) ( ON ?auto_888994 ?auto_888995 ) ( CLEAR ?auto_888992 ) ( ON ?auto_888993 ?auto_888994 ) ( CLEAR ?auto_888993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_888991 ?auto_888992 ?auto_888993 )
      ( MAKE-18PILE ?auto_888991 ?auto_888992 ?auto_888993 ?auto_888994 ?auto_888995 ?auto_888996 ?auto_888997 ?auto_888998 ?auto_888999 ?auto_889000 ?auto_889001 ?auto_889002 ?auto_889003 ?auto_889004 ?auto_889005 ?auto_889006 ?auto_889007 ?auto_889008 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_889028 - BLOCK
      ?auto_889029 - BLOCK
      ?auto_889030 - BLOCK
      ?auto_889031 - BLOCK
      ?auto_889032 - BLOCK
      ?auto_889033 - BLOCK
      ?auto_889034 - BLOCK
      ?auto_889035 - BLOCK
      ?auto_889036 - BLOCK
      ?auto_889037 - BLOCK
      ?auto_889038 - BLOCK
      ?auto_889039 - BLOCK
      ?auto_889040 - BLOCK
      ?auto_889041 - BLOCK
      ?auto_889042 - BLOCK
      ?auto_889043 - BLOCK
      ?auto_889044 - BLOCK
      ?auto_889045 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_889045 ) ( ON-TABLE ?auto_889028 ) ( ON ?auto_889029 ?auto_889028 ) ( not ( = ?auto_889028 ?auto_889029 ) ) ( not ( = ?auto_889028 ?auto_889030 ) ) ( not ( = ?auto_889028 ?auto_889031 ) ) ( not ( = ?auto_889028 ?auto_889032 ) ) ( not ( = ?auto_889028 ?auto_889033 ) ) ( not ( = ?auto_889028 ?auto_889034 ) ) ( not ( = ?auto_889028 ?auto_889035 ) ) ( not ( = ?auto_889028 ?auto_889036 ) ) ( not ( = ?auto_889028 ?auto_889037 ) ) ( not ( = ?auto_889028 ?auto_889038 ) ) ( not ( = ?auto_889028 ?auto_889039 ) ) ( not ( = ?auto_889028 ?auto_889040 ) ) ( not ( = ?auto_889028 ?auto_889041 ) ) ( not ( = ?auto_889028 ?auto_889042 ) ) ( not ( = ?auto_889028 ?auto_889043 ) ) ( not ( = ?auto_889028 ?auto_889044 ) ) ( not ( = ?auto_889028 ?auto_889045 ) ) ( not ( = ?auto_889029 ?auto_889030 ) ) ( not ( = ?auto_889029 ?auto_889031 ) ) ( not ( = ?auto_889029 ?auto_889032 ) ) ( not ( = ?auto_889029 ?auto_889033 ) ) ( not ( = ?auto_889029 ?auto_889034 ) ) ( not ( = ?auto_889029 ?auto_889035 ) ) ( not ( = ?auto_889029 ?auto_889036 ) ) ( not ( = ?auto_889029 ?auto_889037 ) ) ( not ( = ?auto_889029 ?auto_889038 ) ) ( not ( = ?auto_889029 ?auto_889039 ) ) ( not ( = ?auto_889029 ?auto_889040 ) ) ( not ( = ?auto_889029 ?auto_889041 ) ) ( not ( = ?auto_889029 ?auto_889042 ) ) ( not ( = ?auto_889029 ?auto_889043 ) ) ( not ( = ?auto_889029 ?auto_889044 ) ) ( not ( = ?auto_889029 ?auto_889045 ) ) ( not ( = ?auto_889030 ?auto_889031 ) ) ( not ( = ?auto_889030 ?auto_889032 ) ) ( not ( = ?auto_889030 ?auto_889033 ) ) ( not ( = ?auto_889030 ?auto_889034 ) ) ( not ( = ?auto_889030 ?auto_889035 ) ) ( not ( = ?auto_889030 ?auto_889036 ) ) ( not ( = ?auto_889030 ?auto_889037 ) ) ( not ( = ?auto_889030 ?auto_889038 ) ) ( not ( = ?auto_889030 ?auto_889039 ) ) ( not ( = ?auto_889030 ?auto_889040 ) ) ( not ( = ?auto_889030 ?auto_889041 ) ) ( not ( = ?auto_889030 ?auto_889042 ) ) ( not ( = ?auto_889030 ?auto_889043 ) ) ( not ( = ?auto_889030 ?auto_889044 ) ) ( not ( = ?auto_889030 ?auto_889045 ) ) ( not ( = ?auto_889031 ?auto_889032 ) ) ( not ( = ?auto_889031 ?auto_889033 ) ) ( not ( = ?auto_889031 ?auto_889034 ) ) ( not ( = ?auto_889031 ?auto_889035 ) ) ( not ( = ?auto_889031 ?auto_889036 ) ) ( not ( = ?auto_889031 ?auto_889037 ) ) ( not ( = ?auto_889031 ?auto_889038 ) ) ( not ( = ?auto_889031 ?auto_889039 ) ) ( not ( = ?auto_889031 ?auto_889040 ) ) ( not ( = ?auto_889031 ?auto_889041 ) ) ( not ( = ?auto_889031 ?auto_889042 ) ) ( not ( = ?auto_889031 ?auto_889043 ) ) ( not ( = ?auto_889031 ?auto_889044 ) ) ( not ( = ?auto_889031 ?auto_889045 ) ) ( not ( = ?auto_889032 ?auto_889033 ) ) ( not ( = ?auto_889032 ?auto_889034 ) ) ( not ( = ?auto_889032 ?auto_889035 ) ) ( not ( = ?auto_889032 ?auto_889036 ) ) ( not ( = ?auto_889032 ?auto_889037 ) ) ( not ( = ?auto_889032 ?auto_889038 ) ) ( not ( = ?auto_889032 ?auto_889039 ) ) ( not ( = ?auto_889032 ?auto_889040 ) ) ( not ( = ?auto_889032 ?auto_889041 ) ) ( not ( = ?auto_889032 ?auto_889042 ) ) ( not ( = ?auto_889032 ?auto_889043 ) ) ( not ( = ?auto_889032 ?auto_889044 ) ) ( not ( = ?auto_889032 ?auto_889045 ) ) ( not ( = ?auto_889033 ?auto_889034 ) ) ( not ( = ?auto_889033 ?auto_889035 ) ) ( not ( = ?auto_889033 ?auto_889036 ) ) ( not ( = ?auto_889033 ?auto_889037 ) ) ( not ( = ?auto_889033 ?auto_889038 ) ) ( not ( = ?auto_889033 ?auto_889039 ) ) ( not ( = ?auto_889033 ?auto_889040 ) ) ( not ( = ?auto_889033 ?auto_889041 ) ) ( not ( = ?auto_889033 ?auto_889042 ) ) ( not ( = ?auto_889033 ?auto_889043 ) ) ( not ( = ?auto_889033 ?auto_889044 ) ) ( not ( = ?auto_889033 ?auto_889045 ) ) ( not ( = ?auto_889034 ?auto_889035 ) ) ( not ( = ?auto_889034 ?auto_889036 ) ) ( not ( = ?auto_889034 ?auto_889037 ) ) ( not ( = ?auto_889034 ?auto_889038 ) ) ( not ( = ?auto_889034 ?auto_889039 ) ) ( not ( = ?auto_889034 ?auto_889040 ) ) ( not ( = ?auto_889034 ?auto_889041 ) ) ( not ( = ?auto_889034 ?auto_889042 ) ) ( not ( = ?auto_889034 ?auto_889043 ) ) ( not ( = ?auto_889034 ?auto_889044 ) ) ( not ( = ?auto_889034 ?auto_889045 ) ) ( not ( = ?auto_889035 ?auto_889036 ) ) ( not ( = ?auto_889035 ?auto_889037 ) ) ( not ( = ?auto_889035 ?auto_889038 ) ) ( not ( = ?auto_889035 ?auto_889039 ) ) ( not ( = ?auto_889035 ?auto_889040 ) ) ( not ( = ?auto_889035 ?auto_889041 ) ) ( not ( = ?auto_889035 ?auto_889042 ) ) ( not ( = ?auto_889035 ?auto_889043 ) ) ( not ( = ?auto_889035 ?auto_889044 ) ) ( not ( = ?auto_889035 ?auto_889045 ) ) ( not ( = ?auto_889036 ?auto_889037 ) ) ( not ( = ?auto_889036 ?auto_889038 ) ) ( not ( = ?auto_889036 ?auto_889039 ) ) ( not ( = ?auto_889036 ?auto_889040 ) ) ( not ( = ?auto_889036 ?auto_889041 ) ) ( not ( = ?auto_889036 ?auto_889042 ) ) ( not ( = ?auto_889036 ?auto_889043 ) ) ( not ( = ?auto_889036 ?auto_889044 ) ) ( not ( = ?auto_889036 ?auto_889045 ) ) ( not ( = ?auto_889037 ?auto_889038 ) ) ( not ( = ?auto_889037 ?auto_889039 ) ) ( not ( = ?auto_889037 ?auto_889040 ) ) ( not ( = ?auto_889037 ?auto_889041 ) ) ( not ( = ?auto_889037 ?auto_889042 ) ) ( not ( = ?auto_889037 ?auto_889043 ) ) ( not ( = ?auto_889037 ?auto_889044 ) ) ( not ( = ?auto_889037 ?auto_889045 ) ) ( not ( = ?auto_889038 ?auto_889039 ) ) ( not ( = ?auto_889038 ?auto_889040 ) ) ( not ( = ?auto_889038 ?auto_889041 ) ) ( not ( = ?auto_889038 ?auto_889042 ) ) ( not ( = ?auto_889038 ?auto_889043 ) ) ( not ( = ?auto_889038 ?auto_889044 ) ) ( not ( = ?auto_889038 ?auto_889045 ) ) ( not ( = ?auto_889039 ?auto_889040 ) ) ( not ( = ?auto_889039 ?auto_889041 ) ) ( not ( = ?auto_889039 ?auto_889042 ) ) ( not ( = ?auto_889039 ?auto_889043 ) ) ( not ( = ?auto_889039 ?auto_889044 ) ) ( not ( = ?auto_889039 ?auto_889045 ) ) ( not ( = ?auto_889040 ?auto_889041 ) ) ( not ( = ?auto_889040 ?auto_889042 ) ) ( not ( = ?auto_889040 ?auto_889043 ) ) ( not ( = ?auto_889040 ?auto_889044 ) ) ( not ( = ?auto_889040 ?auto_889045 ) ) ( not ( = ?auto_889041 ?auto_889042 ) ) ( not ( = ?auto_889041 ?auto_889043 ) ) ( not ( = ?auto_889041 ?auto_889044 ) ) ( not ( = ?auto_889041 ?auto_889045 ) ) ( not ( = ?auto_889042 ?auto_889043 ) ) ( not ( = ?auto_889042 ?auto_889044 ) ) ( not ( = ?auto_889042 ?auto_889045 ) ) ( not ( = ?auto_889043 ?auto_889044 ) ) ( not ( = ?auto_889043 ?auto_889045 ) ) ( not ( = ?auto_889044 ?auto_889045 ) ) ( ON ?auto_889044 ?auto_889045 ) ( ON ?auto_889043 ?auto_889044 ) ( ON ?auto_889042 ?auto_889043 ) ( ON ?auto_889041 ?auto_889042 ) ( ON ?auto_889040 ?auto_889041 ) ( ON ?auto_889039 ?auto_889040 ) ( ON ?auto_889038 ?auto_889039 ) ( ON ?auto_889037 ?auto_889038 ) ( ON ?auto_889036 ?auto_889037 ) ( ON ?auto_889035 ?auto_889036 ) ( ON ?auto_889034 ?auto_889035 ) ( ON ?auto_889033 ?auto_889034 ) ( ON ?auto_889032 ?auto_889033 ) ( ON ?auto_889031 ?auto_889032 ) ( CLEAR ?auto_889029 ) ( ON ?auto_889030 ?auto_889031 ) ( CLEAR ?auto_889030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_889028 ?auto_889029 ?auto_889030 )
      ( MAKE-18PILE ?auto_889028 ?auto_889029 ?auto_889030 ?auto_889031 ?auto_889032 ?auto_889033 ?auto_889034 ?auto_889035 ?auto_889036 ?auto_889037 ?auto_889038 ?auto_889039 ?auto_889040 ?auto_889041 ?auto_889042 ?auto_889043 ?auto_889044 ?auto_889045 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_889064 - BLOCK
      ?auto_889065 - BLOCK
      ?auto_889066 - BLOCK
      ?auto_889067 - BLOCK
      ?auto_889068 - BLOCK
      ?auto_889069 - BLOCK
      ?auto_889070 - BLOCK
      ?auto_889071 - BLOCK
      ?auto_889072 - BLOCK
      ?auto_889073 - BLOCK
      ?auto_889074 - BLOCK
      ?auto_889075 - BLOCK
      ?auto_889076 - BLOCK
      ?auto_889077 - BLOCK
      ?auto_889078 - BLOCK
      ?auto_889079 - BLOCK
      ?auto_889080 - BLOCK
      ?auto_889081 - BLOCK
    )
    :vars
    (
      ?auto_889082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889081 ?auto_889082 ) ( ON-TABLE ?auto_889064 ) ( not ( = ?auto_889064 ?auto_889065 ) ) ( not ( = ?auto_889064 ?auto_889066 ) ) ( not ( = ?auto_889064 ?auto_889067 ) ) ( not ( = ?auto_889064 ?auto_889068 ) ) ( not ( = ?auto_889064 ?auto_889069 ) ) ( not ( = ?auto_889064 ?auto_889070 ) ) ( not ( = ?auto_889064 ?auto_889071 ) ) ( not ( = ?auto_889064 ?auto_889072 ) ) ( not ( = ?auto_889064 ?auto_889073 ) ) ( not ( = ?auto_889064 ?auto_889074 ) ) ( not ( = ?auto_889064 ?auto_889075 ) ) ( not ( = ?auto_889064 ?auto_889076 ) ) ( not ( = ?auto_889064 ?auto_889077 ) ) ( not ( = ?auto_889064 ?auto_889078 ) ) ( not ( = ?auto_889064 ?auto_889079 ) ) ( not ( = ?auto_889064 ?auto_889080 ) ) ( not ( = ?auto_889064 ?auto_889081 ) ) ( not ( = ?auto_889064 ?auto_889082 ) ) ( not ( = ?auto_889065 ?auto_889066 ) ) ( not ( = ?auto_889065 ?auto_889067 ) ) ( not ( = ?auto_889065 ?auto_889068 ) ) ( not ( = ?auto_889065 ?auto_889069 ) ) ( not ( = ?auto_889065 ?auto_889070 ) ) ( not ( = ?auto_889065 ?auto_889071 ) ) ( not ( = ?auto_889065 ?auto_889072 ) ) ( not ( = ?auto_889065 ?auto_889073 ) ) ( not ( = ?auto_889065 ?auto_889074 ) ) ( not ( = ?auto_889065 ?auto_889075 ) ) ( not ( = ?auto_889065 ?auto_889076 ) ) ( not ( = ?auto_889065 ?auto_889077 ) ) ( not ( = ?auto_889065 ?auto_889078 ) ) ( not ( = ?auto_889065 ?auto_889079 ) ) ( not ( = ?auto_889065 ?auto_889080 ) ) ( not ( = ?auto_889065 ?auto_889081 ) ) ( not ( = ?auto_889065 ?auto_889082 ) ) ( not ( = ?auto_889066 ?auto_889067 ) ) ( not ( = ?auto_889066 ?auto_889068 ) ) ( not ( = ?auto_889066 ?auto_889069 ) ) ( not ( = ?auto_889066 ?auto_889070 ) ) ( not ( = ?auto_889066 ?auto_889071 ) ) ( not ( = ?auto_889066 ?auto_889072 ) ) ( not ( = ?auto_889066 ?auto_889073 ) ) ( not ( = ?auto_889066 ?auto_889074 ) ) ( not ( = ?auto_889066 ?auto_889075 ) ) ( not ( = ?auto_889066 ?auto_889076 ) ) ( not ( = ?auto_889066 ?auto_889077 ) ) ( not ( = ?auto_889066 ?auto_889078 ) ) ( not ( = ?auto_889066 ?auto_889079 ) ) ( not ( = ?auto_889066 ?auto_889080 ) ) ( not ( = ?auto_889066 ?auto_889081 ) ) ( not ( = ?auto_889066 ?auto_889082 ) ) ( not ( = ?auto_889067 ?auto_889068 ) ) ( not ( = ?auto_889067 ?auto_889069 ) ) ( not ( = ?auto_889067 ?auto_889070 ) ) ( not ( = ?auto_889067 ?auto_889071 ) ) ( not ( = ?auto_889067 ?auto_889072 ) ) ( not ( = ?auto_889067 ?auto_889073 ) ) ( not ( = ?auto_889067 ?auto_889074 ) ) ( not ( = ?auto_889067 ?auto_889075 ) ) ( not ( = ?auto_889067 ?auto_889076 ) ) ( not ( = ?auto_889067 ?auto_889077 ) ) ( not ( = ?auto_889067 ?auto_889078 ) ) ( not ( = ?auto_889067 ?auto_889079 ) ) ( not ( = ?auto_889067 ?auto_889080 ) ) ( not ( = ?auto_889067 ?auto_889081 ) ) ( not ( = ?auto_889067 ?auto_889082 ) ) ( not ( = ?auto_889068 ?auto_889069 ) ) ( not ( = ?auto_889068 ?auto_889070 ) ) ( not ( = ?auto_889068 ?auto_889071 ) ) ( not ( = ?auto_889068 ?auto_889072 ) ) ( not ( = ?auto_889068 ?auto_889073 ) ) ( not ( = ?auto_889068 ?auto_889074 ) ) ( not ( = ?auto_889068 ?auto_889075 ) ) ( not ( = ?auto_889068 ?auto_889076 ) ) ( not ( = ?auto_889068 ?auto_889077 ) ) ( not ( = ?auto_889068 ?auto_889078 ) ) ( not ( = ?auto_889068 ?auto_889079 ) ) ( not ( = ?auto_889068 ?auto_889080 ) ) ( not ( = ?auto_889068 ?auto_889081 ) ) ( not ( = ?auto_889068 ?auto_889082 ) ) ( not ( = ?auto_889069 ?auto_889070 ) ) ( not ( = ?auto_889069 ?auto_889071 ) ) ( not ( = ?auto_889069 ?auto_889072 ) ) ( not ( = ?auto_889069 ?auto_889073 ) ) ( not ( = ?auto_889069 ?auto_889074 ) ) ( not ( = ?auto_889069 ?auto_889075 ) ) ( not ( = ?auto_889069 ?auto_889076 ) ) ( not ( = ?auto_889069 ?auto_889077 ) ) ( not ( = ?auto_889069 ?auto_889078 ) ) ( not ( = ?auto_889069 ?auto_889079 ) ) ( not ( = ?auto_889069 ?auto_889080 ) ) ( not ( = ?auto_889069 ?auto_889081 ) ) ( not ( = ?auto_889069 ?auto_889082 ) ) ( not ( = ?auto_889070 ?auto_889071 ) ) ( not ( = ?auto_889070 ?auto_889072 ) ) ( not ( = ?auto_889070 ?auto_889073 ) ) ( not ( = ?auto_889070 ?auto_889074 ) ) ( not ( = ?auto_889070 ?auto_889075 ) ) ( not ( = ?auto_889070 ?auto_889076 ) ) ( not ( = ?auto_889070 ?auto_889077 ) ) ( not ( = ?auto_889070 ?auto_889078 ) ) ( not ( = ?auto_889070 ?auto_889079 ) ) ( not ( = ?auto_889070 ?auto_889080 ) ) ( not ( = ?auto_889070 ?auto_889081 ) ) ( not ( = ?auto_889070 ?auto_889082 ) ) ( not ( = ?auto_889071 ?auto_889072 ) ) ( not ( = ?auto_889071 ?auto_889073 ) ) ( not ( = ?auto_889071 ?auto_889074 ) ) ( not ( = ?auto_889071 ?auto_889075 ) ) ( not ( = ?auto_889071 ?auto_889076 ) ) ( not ( = ?auto_889071 ?auto_889077 ) ) ( not ( = ?auto_889071 ?auto_889078 ) ) ( not ( = ?auto_889071 ?auto_889079 ) ) ( not ( = ?auto_889071 ?auto_889080 ) ) ( not ( = ?auto_889071 ?auto_889081 ) ) ( not ( = ?auto_889071 ?auto_889082 ) ) ( not ( = ?auto_889072 ?auto_889073 ) ) ( not ( = ?auto_889072 ?auto_889074 ) ) ( not ( = ?auto_889072 ?auto_889075 ) ) ( not ( = ?auto_889072 ?auto_889076 ) ) ( not ( = ?auto_889072 ?auto_889077 ) ) ( not ( = ?auto_889072 ?auto_889078 ) ) ( not ( = ?auto_889072 ?auto_889079 ) ) ( not ( = ?auto_889072 ?auto_889080 ) ) ( not ( = ?auto_889072 ?auto_889081 ) ) ( not ( = ?auto_889072 ?auto_889082 ) ) ( not ( = ?auto_889073 ?auto_889074 ) ) ( not ( = ?auto_889073 ?auto_889075 ) ) ( not ( = ?auto_889073 ?auto_889076 ) ) ( not ( = ?auto_889073 ?auto_889077 ) ) ( not ( = ?auto_889073 ?auto_889078 ) ) ( not ( = ?auto_889073 ?auto_889079 ) ) ( not ( = ?auto_889073 ?auto_889080 ) ) ( not ( = ?auto_889073 ?auto_889081 ) ) ( not ( = ?auto_889073 ?auto_889082 ) ) ( not ( = ?auto_889074 ?auto_889075 ) ) ( not ( = ?auto_889074 ?auto_889076 ) ) ( not ( = ?auto_889074 ?auto_889077 ) ) ( not ( = ?auto_889074 ?auto_889078 ) ) ( not ( = ?auto_889074 ?auto_889079 ) ) ( not ( = ?auto_889074 ?auto_889080 ) ) ( not ( = ?auto_889074 ?auto_889081 ) ) ( not ( = ?auto_889074 ?auto_889082 ) ) ( not ( = ?auto_889075 ?auto_889076 ) ) ( not ( = ?auto_889075 ?auto_889077 ) ) ( not ( = ?auto_889075 ?auto_889078 ) ) ( not ( = ?auto_889075 ?auto_889079 ) ) ( not ( = ?auto_889075 ?auto_889080 ) ) ( not ( = ?auto_889075 ?auto_889081 ) ) ( not ( = ?auto_889075 ?auto_889082 ) ) ( not ( = ?auto_889076 ?auto_889077 ) ) ( not ( = ?auto_889076 ?auto_889078 ) ) ( not ( = ?auto_889076 ?auto_889079 ) ) ( not ( = ?auto_889076 ?auto_889080 ) ) ( not ( = ?auto_889076 ?auto_889081 ) ) ( not ( = ?auto_889076 ?auto_889082 ) ) ( not ( = ?auto_889077 ?auto_889078 ) ) ( not ( = ?auto_889077 ?auto_889079 ) ) ( not ( = ?auto_889077 ?auto_889080 ) ) ( not ( = ?auto_889077 ?auto_889081 ) ) ( not ( = ?auto_889077 ?auto_889082 ) ) ( not ( = ?auto_889078 ?auto_889079 ) ) ( not ( = ?auto_889078 ?auto_889080 ) ) ( not ( = ?auto_889078 ?auto_889081 ) ) ( not ( = ?auto_889078 ?auto_889082 ) ) ( not ( = ?auto_889079 ?auto_889080 ) ) ( not ( = ?auto_889079 ?auto_889081 ) ) ( not ( = ?auto_889079 ?auto_889082 ) ) ( not ( = ?auto_889080 ?auto_889081 ) ) ( not ( = ?auto_889080 ?auto_889082 ) ) ( not ( = ?auto_889081 ?auto_889082 ) ) ( ON ?auto_889080 ?auto_889081 ) ( ON ?auto_889079 ?auto_889080 ) ( ON ?auto_889078 ?auto_889079 ) ( ON ?auto_889077 ?auto_889078 ) ( ON ?auto_889076 ?auto_889077 ) ( ON ?auto_889075 ?auto_889076 ) ( ON ?auto_889074 ?auto_889075 ) ( ON ?auto_889073 ?auto_889074 ) ( ON ?auto_889072 ?auto_889073 ) ( ON ?auto_889071 ?auto_889072 ) ( ON ?auto_889070 ?auto_889071 ) ( ON ?auto_889069 ?auto_889070 ) ( ON ?auto_889068 ?auto_889069 ) ( ON ?auto_889067 ?auto_889068 ) ( ON ?auto_889066 ?auto_889067 ) ( CLEAR ?auto_889064 ) ( ON ?auto_889065 ?auto_889066 ) ( CLEAR ?auto_889065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_889064 ?auto_889065 )
      ( MAKE-18PILE ?auto_889064 ?auto_889065 ?auto_889066 ?auto_889067 ?auto_889068 ?auto_889069 ?auto_889070 ?auto_889071 ?auto_889072 ?auto_889073 ?auto_889074 ?auto_889075 ?auto_889076 ?auto_889077 ?auto_889078 ?auto_889079 ?auto_889080 ?auto_889081 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_889101 - BLOCK
      ?auto_889102 - BLOCK
      ?auto_889103 - BLOCK
      ?auto_889104 - BLOCK
      ?auto_889105 - BLOCK
      ?auto_889106 - BLOCK
      ?auto_889107 - BLOCK
      ?auto_889108 - BLOCK
      ?auto_889109 - BLOCK
      ?auto_889110 - BLOCK
      ?auto_889111 - BLOCK
      ?auto_889112 - BLOCK
      ?auto_889113 - BLOCK
      ?auto_889114 - BLOCK
      ?auto_889115 - BLOCK
      ?auto_889116 - BLOCK
      ?auto_889117 - BLOCK
      ?auto_889118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_889118 ) ( ON-TABLE ?auto_889101 ) ( not ( = ?auto_889101 ?auto_889102 ) ) ( not ( = ?auto_889101 ?auto_889103 ) ) ( not ( = ?auto_889101 ?auto_889104 ) ) ( not ( = ?auto_889101 ?auto_889105 ) ) ( not ( = ?auto_889101 ?auto_889106 ) ) ( not ( = ?auto_889101 ?auto_889107 ) ) ( not ( = ?auto_889101 ?auto_889108 ) ) ( not ( = ?auto_889101 ?auto_889109 ) ) ( not ( = ?auto_889101 ?auto_889110 ) ) ( not ( = ?auto_889101 ?auto_889111 ) ) ( not ( = ?auto_889101 ?auto_889112 ) ) ( not ( = ?auto_889101 ?auto_889113 ) ) ( not ( = ?auto_889101 ?auto_889114 ) ) ( not ( = ?auto_889101 ?auto_889115 ) ) ( not ( = ?auto_889101 ?auto_889116 ) ) ( not ( = ?auto_889101 ?auto_889117 ) ) ( not ( = ?auto_889101 ?auto_889118 ) ) ( not ( = ?auto_889102 ?auto_889103 ) ) ( not ( = ?auto_889102 ?auto_889104 ) ) ( not ( = ?auto_889102 ?auto_889105 ) ) ( not ( = ?auto_889102 ?auto_889106 ) ) ( not ( = ?auto_889102 ?auto_889107 ) ) ( not ( = ?auto_889102 ?auto_889108 ) ) ( not ( = ?auto_889102 ?auto_889109 ) ) ( not ( = ?auto_889102 ?auto_889110 ) ) ( not ( = ?auto_889102 ?auto_889111 ) ) ( not ( = ?auto_889102 ?auto_889112 ) ) ( not ( = ?auto_889102 ?auto_889113 ) ) ( not ( = ?auto_889102 ?auto_889114 ) ) ( not ( = ?auto_889102 ?auto_889115 ) ) ( not ( = ?auto_889102 ?auto_889116 ) ) ( not ( = ?auto_889102 ?auto_889117 ) ) ( not ( = ?auto_889102 ?auto_889118 ) ) ( not ( = ?auto_889103 ?auto_889104 ) ) ( not ( = ?auto_889103 ?auto_889105 ) ) ( not ( = ?auto_889103 ?auto_889106 ) ) ( not ( = ?auto_889103 ?auto_889107 ) ) ( not ( = ?auto_889103 ?auto_889108 ) ) ( not ( = ?auto_889103 ?auto_889109 ) ) ( not ( = ?auto_889103 ?auto_889110 ) ) ( not ( = ?auto_889103 ?auto_889111 ) ) ( not ( = ?auto_889103 ?auto_889112 ) ) ( not ( = ?auto_889103 ?auto_889113 ) ) ( not ( = ?auto_889103 ?auto_889114 ) ) ( not ( = ?auto_889103 ?auto_889115 ) ) ( not ( = ?auto_889103 ?auto_889116 ) ) ( not ( = ?auto_889103 ?auto_889117 ) ) ( not ( = ?auto_889103 ?auto_889118 ) ) ( not ( = ?auto_889104 ?auto_889105 ) ) ( not ( = ?auto_889104 ?auto_889106 ) ) ( not ( = ?auto_889104 ?auto_889107 ) ) ( not ( = ?auto_889104 ?auto_889108 ) ) ( not ( = ?auto_889104 ?auto_889109 ) ) ( not ( = ?auto_889104 ?auto_889110 ) ) ( not ( = ?auto_889104 ?auto_889111 ) ) ( not ( = ?auto_889104 ?auto_889112 ) ) ( not ( = ?auto_889104 ?auto_889113 ) ) ( not ( = ?auto_889104 ?auto_889114 ) ) ( not ( = ?auto_889104 ?auto_889115 ) ) ( not ( = ?auto_889104 ?auto_889116 ) ) ( not ( = ?auto_889104 ?auto_889117 ) ) ( not ( = ?auto_889104 ?auto_889118 ) ) ( not ( = ?auto_889105 ?auto_889106 ) ) ( not ( = ?auto_889105 ?auto_889107 ) ) ( not ( = ?auto_889105 ?auto_889108 ) ) ( not ( = ?auto_889105 ?auto_889109 ) ) ( not ( = ?auto_889105 ?auto_889110 ) ) ( not ( = ?auto_889105 ?auto_889111 ) ) ( not ( = ?auto_889105 ?auto_889112 ) ) ( not ( = ?auto_889105 ?auto_889113 ) ) ( not ( = ?auto_889105 ?auto_889114 ) ) ( not ( = ?auto_889105 ?auto_889115 ) ) ( not ( = ?auto_889105 ?auto_889116 ) ) ( not ( = ?auto_889105 ?auto_889117 ) ) ( not ( = ?auto_889105 ?auto_889118 ) ) ( not ( = ?auto_889106 ?auto_889107 ) ) ( not ( = ?auto_889106 ?auto_889108 ) ) ( not ( = ?auto_889106 ?auto_889109 ) ) ( not ( = ?auto_889106 ?auto_889110 ) ) ( not ( = ?auto_889106 ?auto_889111 ) ) ( not ( = ?auto_889106 ?auto_889112 ) ) ( not ( = ?auto_889106 ?auto_889113 ) ) ( not ( = ?auto_889106 ?auto_889114 ) ) ( not ( = ?auto_889106 ?auto_889115 ) ) ( not ( = ?auto_889106 ?auto_889116 ) ) ( not ( = ?auto_889106 ?auto_889117 ) ) ( not ( = ?auto_889106 ?auto_889118 ) ) ( not ( = ?auto_889107 ?auto_889108 ) ) ( not ( = ?auto_889107 ?auto_889109 ) ) ( not ( = ?auto_889107 ?auto_889110 ) ) ( not ( = ?auto_889107 ?auto_889111 ) ) ( not ( = ?auto_889107 ?auto_889112 ) ) ( not ( = ?auto_889107 ?auto_889113 ) ) ( not ( = ?auto_889107 ?auto_889114 ) ) ( not ( = ?auto_889107 ?auto_889115 ) ) ( not ( = ?auto_889107 ?auto_889116 ) ) ( not ( = ?auto_889107 ?auto_889117 ) ) ( not ( = ?auto_889107 ?auto_889118 ) ) ( not ( = ?auto_889108 ?auto_889109 ) ) ( not ( = ?auto_889108 ?auto_889110 ) ) ( not ( = ?auto_889108 ?auto_889111 ) ) ( not ( = ?auto_889108 ?auto_889112 ) ) ( not ( = ?auto_889108 ?auto_889113 ) ) ( not ( = ?auto_889108 ?auto_889114 ) ) ( not ( = ?auto_889108 ?auto_889115 ) ) ( not ( = ?auto_889108 ?auto_889116 ) ) ( not ( = ?auto_889108 ?auto_889117 ) ) ( not ( = ?auto_889108 ?auto_889118 ) ) ( not ( = ?auto_889109 ?auto_889110 ) ) ( not ( = ?auto_889109 ?auto_889111 ) ) ( not ( = ?auto_889109 ?auto_889112 ) ) ( not ( = ?auto_889109 ?auto_889113 ) ) ( not ( = ?auto_889109 ?auto_889114 ) ) ( not ( = ?auto_889109 ?auto_889115 ) ) ( not ( = ?auto_889109 ?auto_889116 ) ) ( not ( = ?auto_889109 ?auto_889117 ) ) ( not ( = ?auto_889109 ?auto_889118 ) ) ( not ( = ?auto_889110 ?auto_889111 ) ) ( not ( = ?auto_889110 ?auto_889112 ) ) ( not ( = ?auto_889110 ?auto_889113 ) ) ( not ( = ?auto_889110 ?auto_889114 ) ) ( not ( = ?auto_889110 ?auto_889115 ) ) ( not ( = ?auto_889110 ?auto_889116 ) ) ( not ( = ?auto_889110 ?auto_889117 ) ) ( not ( = ?auto_889110 ?auto_889118 ) ) ( not ( = ?auto_889111 ?auto_889112 ) ) ( not ( = ?auto_889111 ?auto_889113 ) ) ( not ( = ?auto_889111 ?auto_889114 ) ) ( not ( = ?auto_889111 ?auto_889115 ) ) ( not ( = ?auto_889111 ?auto_889116 ) ) ( not ( = ?auto_889111 ?auto_889117 ) ) ( not ( = ?auto_889111 ?auto_889118 ) ) ( not ( = ?auto_889112 ?auto_889113 ) ) ( not ( = ?auto_889112 ?auto_889114 ) ) ( not ( = ?auto_889112 ?auto_889115 ) ) ( not ( = ?auto_889112 ?auto_889116 ) ) ( not ( = ?auto_889112 ?auto_889117 ) ) ( not ( = ?auto_889112 ?auto_889118 ) ) ( not ( = ?auto_889113 ?auto_889114 ) ) ( not ( = ?auto_889113 ?auto_889115 ) ) ( not ( = ?auto_889113 ?auto_889116 ) ) ( not ( = ?auto_889113 ?auto_889117 ) ) ( not ( = ?auto_889113 ?auto_889118 ) ) ( not ( = ?auto_889114 ?auto_889115 ) ) ( not ( = ?auto_889114 ?auto_889116 ) ) ( not ( = ?auto_889114 ?auto_889117 ) ) ( not ( = ?auto_889114 ?auto_889118 ) ) ( not ( = ?auto_889115 ?auto_889116 ) ) ( not ( = ?auto_889115 ?auto_889117 ) ) ( not ( = ?auto_889115 ?auto_889118 ) ) ( not ( = ?auto_889116 ?auto_889117 ) ) ( not ( = ?auto_889116 ?auto_889118 ) ) ( not ( = ?auto_889117 ?auto_889118 ) ) ( ON ?auto_889117 ?auto_889118 ) ( ON ?auto_889116 ?auto_889117 ) ( ON ?auto_889115 ?auto_889116 ) ( ON ?auto_889114 ?auto_889115 ) ( ON ?auto_889113 ?auto_889114 ) ( ON ?auto_889112 ?auto_889113 ) ( ON ?auto_889111 ?auto_889112 ) ( ON ?auto_889110 ?auto_889111 ) ( ON ?auto_889109 ?auto_889110 ) ( ON ?auto_889108 ?auto_889109 ) ( ON ?auto_889107 ?auto_889108 ) ( ON ?auto_889106 ?auto_889107 ) ( ON ?auto_889105 ?auto_889106 ) ( ON ?auto_889104 ?auto_889105 ) ( ON ?auto_889103 ?auto_889104 ) ( CLEAR ?auto_889101 ) ( ON ?auto_889102 ?auto_889103 ) ( CLEAR ?auto_889102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_889101 ?auto_889102 )
      ( MAKE-18PILE ?auto_889101 ?auto_889102 ?auto_889103 ?auto_889104 ?auto_889105 ?auto_889106 ?auto_889107 ?auto_889108 ?auto_889109 ?auto_889110 ?auto_889111 ?auto_889112 ?auto_889113 ?auto_889114 ?auto_889115 ?auto_889116 ?auto_889117 ?auto_889118 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_889137 - BLOCK
      ?auto_889138 - BLOCK
      ?auto_889139 - BLOCK
      ?auto_889140 - BLOCK
      ?auto_889141 - BLOCK
      ?auto_889142 - BLOCK
      ?auto_889143 - BLOCK
      ?auto_889144 - BLOCK
      ?auto_889145 - BLOCK
      ?auto_889146 - BLOCK
      ?auto_889147 - BLOCK
      ?auto_889148 - BLOCK
      ?auto_889149 - BLOCK
      ?auto_889150 - BLOCK
      ?auto_889151 - BLOCK
      ?auto_889152 - BLOCK
      ?auto_889153 - BLOCK
      ?auto_889154 - BLOCK
    )
    :vars
    (
      ?auto_889155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889154 ?auto_889155 ) ( not ( = ?auto_889137 ?auto_889138 ) ) ( not ( = ?auto_889137 ?auto_889139 ) ) ( not ( = ?auto_889137 ?auto_889140 ) ) ( not ( = ?auto_889137 ?auto_889141 ) ) ( not ( = ?auto_889137 ?auto_889142 ) ) ( not ( = ?auto_889137 ?auto_889143 ) ) ( not ( = ?auto_889137 ?auto_889144 ) ) ( not ( = ?auto_889137 ?auto_889145 ) ) ( not ( = ?auto_889137 ?auto_889146 ) ) ( not ( = ?auto_889137 ?auto_889147 ) ) ( not ( = ?auto_889137 ?auto_889148 ) ) ( not ( = ?auto_889137 ?auto_889149 ) ) ( not ( = ?auto_889137 ?auto_889150 ) ) ( not ( = ?auto_889137 ?auto_889151 ) ) ( not ( = ?auto_889137 ?auto_889152 ) ) ( not ( = ?auto_889137 ?auto_889153 ) ) ( not ( = ?auto_889137 ?auto_889154 ) ) ( not ( = ?auto_889137 ?auto_889155 ) ) ( not ( = ?auto_889138 ?auto_889139 ) ) ( not ( = ?auto_889138 ?auto_889140 ) ) ( not ( = ?auto_889138 ?auto_889141 ) ) ( not ( = ?auto_889138 ?auto_889142 ) ) ( not ( = ?auto_889138 ?auto_889143 ) ) ( not ( = ?auto_889138 ?auto_889144 ) ) ( not ( = ?auto_889138 ?auto_889145 ) ) ( not ( = ?auto_889138 ?auto_889146 ) ) ( not ( = ?auto_889138 ?auto_889147 ) ) ( not ( = ?auto_889138 ?auto_889148 ) ) ( not ( = ?auto_889138 ?auto_889149 ) ) ( not ( = ?auto_889138 ?auto_889150 ) ) ( not ( = ?auto_889138 ?auto_889151 ) ) ( not ( = ?auto_889138 ?auto_889152 ) ) ( not ( = ?auto_889138 ?auto_889153 ) ) ( not ( = ?auto_889138 ?auto_889154 ) ) ( not ( = ?auto_889138 ?auto_889155 ) ) ( not ( = ?auto_889139 ?auto_889140 ) ) ( not ( = ?auto_889139 ?auto_889141 ) ) ( not ( = ?auto_889139 ?auto_889142 ) ) ( not ( = ?auto_889139 ?auto_889143 ) ) ( not ( = ?auto_889139 ?auto_889144 ) ) ( not ( = ?auto_889139 ?auto_889145 ) ) ( not ( = ?auto_889139 ?auto_889146 ) ) ( not ( = ?auto_889139 ?auto_889147 ) ) ( not ( = ?auto_889139 ?auto_889148 ) ) ( not ( = ?auto_889139 ?auto_889149 ) ) ( not ( = ?auto_889139 ?auto_889150 ) ) ( not ( = ?auto_889139 ?auto_889151 ) ) ( not ( = ?auto_889139 ?auto_889152 ) ) ( not ( = ?auto_889139 ?auto_889153 ) ) ( not ( = ?auto_889139 ?auto_889154 ) ) ( not ( = ?auto_889139 ?auto_889155 ) ) ( not ( = ?auto_889140 ?auto_889141 ) ) ( not ( = ?auto_889140 ?auto_889142 ) ) ( not ( = ?auto_889140 ?auto_889143 ) ) ( not ( = ?auto_889140 ?auto_889144 ) ) ( not ( = ?auto_889140 ?auto_889145 ) ) ( not ( = ?auto_889140 ?auto_889146 ) ) ( not ( = ?auto_889140 ?auto_889147 ) ) ( not ( = ?auto_889140 ?auto_889148 ) ) ( not ( = ?auto_889140 ?auto_889149 ) ) ( not ( = ?auto_889140 ?auto_889150 ) ) ( not ( = ?auto_889140 ?auto_889151 ) ) ( not ( = ?auto_889140 ?auto_889152 ) ) ( not ( = ?auto_889140 ?auto_889153 ) ) ( not ( = ?auto_889140 ?auto_889154 ) ) ( not ( = ?auto_889140 ?auto_889155 ) ) ( not ( = ?auto_889141 ?auto_889142 ) ) ( not ( = ?auto_889141 ?auto_889143 ) ) ( not ( = ?auto_889141 ?auto_889144 ) ) ( not ( = ?auto_889141 ?auto_889145 ) ) ( not ( = ?auto_889141 ?auto_889146 ) ) ( not ( = ?auto_889141 ?auto_889147 ) ) ( not ( = ?auto_889141 ?auto_889148 ) ) ( not ( = ?auto_889141 ?auto_889149 ) ) ( not ( = ?auto_889141 ?auto_889150 ) ) ( not ( = ?auto_889141 ?auto_889151 ) ) ( not ( = ?auto_889141 ?auto_889152 ) ) ( not ( = ?auto_889141 ?auto_889153 ) ) ( not ( = ?auto_889141 ?auto_889154 ) ) ( not ( = ?auto_889141 ?auto_889155 ) ) ( not ( = ?auto_889142 ?auto_889143 ) ) ( not ( = ?auto_889142 ?auto_889144 ) ) ( not ( = ?auto_889142 ?auto_889145 ) ) ( not ( = ?auto_889142 ?auto_889146 ) ) ( not ( = ?auto_889142 ?auto_889147 ) ) ( not ( = ?auto_889142 ?auto_889148 ) ) ( not ( = ?auto_889142 ?auto_889149 ) ) ( not ( = ?auto_889142 ?auto_889150 ) ) ( not ( = ?auto_889142 ?auto_889151 ) ) ( not ( = ?auto_889142 ?auto_889152 ) ) ( not ( = ?auto_889142 ?auto_889153 ) ) ( not ( = ?auto_889142 ?auto_889154 ) ) ( not ( = ?auto_889142 ?auto_889155 ) ) ( not ( = ?auto_889143 ?auto_889144 ) ) ( not ( = ?auto_889143 ?auto_889145 ) ) ( not ( = ?auto_889143 ?auto_889146 ) ) ( not ( = ?auto_889143 ?auto_889147 ) ) ( not ( = ?auto_889143 ?auto_889148 ) ) ( not ( = ?auto_889143 ?auto_889149 ) ) ( not ( = ?auto_889143 ?auto_889150 ) ) ( not ( = ?auto_889143 ?auto_889151 ) ) ( not ( = ?auto_889143 ?auto_889152 ) ) ( not ( = ?auto_889143 ?auto_889153 ) ) ( not ( = ?auto_889143 ?auto_889154 ) ) ( not ( = ?auto_889143 ?auto_889155 ) ) ( not ( = ?auto_889144 ?auto_889145 ) ) ( not ( = ?auto_889144 ?auto_889146 ) ) ( not ( = ?auto_889144 ?auto_889147 ) ) ( not ( = ?auto_889144 ?auto_889148 ) ) ( not ( = ?auto_889144 ?auto_889149 ) ) ( not ( = ?auto_889144 ?auto_889150 ) ) ( not ( = ?auto_889144 ?auto_889151 ) ) ( not ( = ?auto_889144 ?auto_889152 ) ) ( not ( = ?auto_889144 ?auto_889153 ) ) ( not ( = ?auto_889144 ?auto_889154 ) ) ( not ( = ?auto_889144 ?auto_889155 ) ) ( not ( = ?auto_889145 ?auto_889146 ) ) ( not ( = ?auto_889145 ?auto_889147 ) ) ( not ( = ?auto_889145 ?auto_889148 ) ) ( not ( = ?auto_889145 ?auto_889149 ) ) ( not ( = ?auto_889145 ?auto_889150 ) ) ( not ( = ?auto_889145 ?auto_889151 ) ) ( not ( = ?auto_889145 ?auto_889152 ) ) ( not ( = ?auto_889145 ?auto_889153 ) ) ( not ( = ?auto_889145 ?auto_889154 ) ) ( not ( = ?auto_889145 ?auto_889155 ) ) ( not ( = ?auto_889146 ?auto_889147 ) ) ( not ( = ?auto_889146 ?auto_889148 ) ) ( not ( = ?auto_889146 ?auto_889149 ) ) ( not ( = ?auto_889146 ?auto_889150 ) ) ( not ( = ?auto_889146 ?auto_889151 ) ) ( not ( = ?auto_889146 ?auto_889152 ) ) ( not ( = ?auto_889146 ?auto_889153 ) ) ( not ( = ?auto_889146 ?auto_889154 ) ) ( not ( = ?auto_889146 ?auto_889155 ) ) ( not ( = ?auto_889147 ?auto_889148 ) ) ( not ( = ?auto_889147 ?auto_889149 ) ) ( not ( = ?auto_889147 ?auto_889150 ) ) ( not ( = ?auto_889147 ?auto_889151 ) ) ( not ( = ?auto_889147 ?auto_889152 ) ) ( not ( = ?auto_889147 ?auto_889153 ) ) ( not ( = ?auto_889147 ?auto_889154 ) ) ( not ( = ?auto_889147 ?auto_889155 ) ) ( not ( = ?auto_889148 ?auto_889149 ) ) ( not ( = ?auto_889148 ?auto_889150 ) ) ( not ( = ?auto_889148 ?auto_889151 ) ) ( not ( = ?auto_889148 ?auto_889152 ) ) ( not ( = ?auto_889148 ?auto_889153 ) ) ( not ( = ?auto_889148 ?auto_889154 ) ) ( not ( = ?auto_889148 ?auto_889155 ) ) ( not ( = ?auto_889149 ?auto_889150 ) ) ( not ( = ?auto_889149 ?auto_889151 ) ) ( not ( = ?auto_889149 ?auto_889152 ) ) ( not ( = ?auto_889149 ?auto_889153 ) ) ( not ( = ?auto_889149 ?auto_889154 ) ) ( not ( = ?auto_889149 ?auto_889155 ) ) ( not ( = ?auto_889150 ?auto_889151 ) ) ( not ( = ?auto_889150 ?auto_889152 ) ) ( not ( = ?auto_889150 ?auto_889153 ) ) ( not ( = ?auto_889150 ?auto_889154 ) ) ( not ( = ?auto_889150 ?auto_889155 ) ) ( not ( = ?auto_889151 ?auto_889152 ) ) ( not ( = ?auto_889151 ?auto_889153 ) ) ( not ( = ?auto_889151 ?auto_889154 ) ) ( not ( = ?auto_889151 ?auto_889155 ) ) ( not ( = ?auto_889152 ?auto_889153 ) ) ( not ( = ?auto_889152 ?auto_889154 ) ) ( not ( = ?auto_889152 ?auto_889155 ) ) ( not ( = ?auto_889153 ?auto_889154 ) ) ( not ( = ?auto_889153 ?auto_889155 ) ) ( not ( = ?auto_889154 ?auto_889155 ) ) ( ON ?auto_889153 ?auto_889154 ) ( ON ?auto_889152 ?auto_889153 ) ( ON ?auto_889151 ?auto_889152 ) ( ON ?auto_889150 ?auto_889151 ) ( ON ?auto_889149 ?auto_889150 ) ( ON ?auto_889148 ?auto_889149 ) ( ON ?auto_889147 ?auto_889148 ) ( ON ?auto_889146 ?auto_889147 ) ( ON ?auto_889145 ?auto_889146 ) ( ON ?auto_889144 ?auto_889145 ) ( ON ?auto_889143 ?auto_889144 ) ( ON ?auto_889142 ?auto_889143 ) ( ON ?auto_889141 ?auto_889142 ) ( ON ?auto_889140 ?auto_889141 ) ( ON ?auto_889139 ?auto_889140 ) ( ON ?auto_889138 ?auto_889139 ) ( ON ?auto_889137 ?auto_889138 ) ( CLEAR ?auto_889137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_889137 )
      ( MAKE-18PILE ?auto_889137 ?auto_889138 ?auto_889139 ?auto_889140 ?auto_889141 ?auto_889142 ?auto_889143 ?auto_889144 ?auto_889145 ?auto_889146 ?auto_889147 ?auto_889148 ?auto_889149 ?auto_889150 ?auto_889151 ?auto_889152 ?auto_889153 ?auto_889154 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_889174 - BLOCK
      ?auto_889175 - BLOCK
      ?auto_889176 - BLOCK
      ?auto_889177 - BLOCK
      ?auto_889178 - BLOCK
      ?auto_889179 - BLOCK
      ?auto_889180 - BLOCK
      ?auto_889181 - BLOCK
      ?auto_889182 - BLOCK
      ?auto_889183 - BLOCK
      ?auto_889184 - BLOCK
      ?auto_889185 - BLOCK
      ?auto_889186 - BLOCK
      ?auto_889187 - BLOCK
      ?auto_889188 - BLOCK
      ?auto_889189 - BLOCK
      ?auto_889190 - BLOCK
      ?auto_889191 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_889191 ) ( not ( = ?auto_889174 ?auto_889175 ) ) ( not ( = ?auto_889174 ?auto_889176 ) ) ( not ( = ?auto_889174 ?auto_889177 ) ) ( not ( = ?auto_889174 ?auto_889178 ) ) ( not ( = ?auto_889174 ?auto_889179 ) ) ( not ( = ?auto_889174 ?auto_889180 ) ) ( not ( = ?auto_889174 ?auto_889181 ) ) ( not ( = ?auto_889174 ?auto_889182 ) ) ( not ( = ?auto_889174 ?auto_889183 ) ) ( not ( = ?auto_889174 ?auto_889184 ) ) ( not ( = ?auto_889174 ?auto_889185 ) ) ( not ( = ?auto_889174 ?auto_889186 ) ) ( not ( = ?auto_889174 ?auto_889187 ) ) ( not ( = ?auto_889174 ?auto_889188 ) ) ( not ( = ?auto_889174 ?auto_889189 ) ) ( not ( = ?auto_889174 ?auto_889190 ) ) ( not ( = ?auto_889174 ?auto_889191 ) ) ( not ( = ?auto_889175 ?auto_889176 ) ) ( not ( = ?auto_889175 ?auto_889177 ) ) ( not ( = ?auto_889175 ?auto_889178 ) ) ( not ( = ?auto_889175 ?auto_889179 ) ) ( not ( = ?auto_889175 ?auto_889180 ) ) ( not ( = ?auto_889175 ?auto_889181 ) ) ( not ( = ?auto_889175 ?auto_889182 ) ) ( not ( = ?auto_889175 ?auto_889183 ) ) ( not ( = ?auto_889175 ?auto_889184 ) ) ( not ( = ?auto_889175 ?auto_889185 ) ) ( not ( = ?auto_889175 ?auto_889186 ) ) ( not ( = ?auto_889175 ?auto_889187 ) ) ( not ( = ?auto_889175 ?auto_889188 ) ) ( not ( = ?auto_889175 ?auto_889189 ) ) ( not ( = ?auto_889175 ?auto_889190 ) ) ( not ( = ?auto_889175 ?auto_889191 ) ) ( not ( = ?auto_889176 ?auto_889177 ) ) ( not ( = ?auto_889176 ?auto_889178 ) ) ( not ( = ?auto_889176 ?auto_889179 ) ) ( not ( = ?auto_889176 ?auto_889180 ) ) ( not ( = ?auto_889176 ?auto_889181 ) ) ( not ( = ?auto_889176 ?auto_889182 ) ) ( not ( = ?auto_889176 ?auto_889183 ) ) ( not ( = ?auto_889176 ?auto_889184 ) ) ( not ( = ?auto_889176 ?auto_889185 ) ) ( not ( = ?auto_889176 ?auto_889186 ) ) ( not ( = ?auto_889176 ?auto_889187 ) ) ( not ( = ?auto_889176 ?auto_889188 ) ) ( not ( = ?auto_889176 ?auto_889189 ) ) ( not ( = ?auto_889176 ?auto_889190 ) ) ( not ( = ?auto_889176 ?auto_889191 ) ) ( not ( = ?auto_889177 ?auto_889178 ) ) ( not ( = ?auto_889177 ?auto_889179 ) ) ( not ( = ?auto_889177 ?auto_889180 ) ) ( not ( = ?auto_889177 ?auto_889181 ) ) ( not ( = ?auto_889177 ?auto_889182 ) ) ( not ( = ?auto_889177 ?auto_889183 ) ) ( not ( = ?auto_889177 ?auto_889184 ) ) ( not ( = ?auto_889177 ?auto_889185 ) ) ( not ( = ?auto_889177 ?auto_889186 ) ) ( not ( = ?auto_889177 ?auto_889187 ) ) ( not ( = ?auto_889177 ?auto_889188 ) ) ( not ( = ?auto_889177 ?auto_889189 ) ) ( not ( = ?auto_889177 ?auto_889190 ) ) ( not ( = ?auto_889177 ?auto_889191 ) ) ( not ( = ?auto_889178 ?auto_889179 ) ) ( not ( = ?auto_889178 ?auto_889180 ) ) ( not ( = ?auto_889178 ?auto_889181 ) ) ( not ( = ?auto_889178 ?auto_889182 ) ) ( not ( = ?auto_889178 ?auto_889183 ) ) ( not ( = ?auto_889178 ?auto_889184 ) ) ( not ( = ?auto_889178 ?auto_889185 ) ) ( not ( = ?auto_889178 ?auto_889186 ) ) ( not ( = ?auto_889178 ?auto_889187 ) ) ( not ( = ?auto_889178 ?auto_889188 ) ) ( not ( = ?auto_889178 ?auto_889189 ) ) ( not ( = ?auto_889178 ?auto_889190 ) ) ( not ( = ?auto_889178 ?auto_889191 ) ) ( not ( = ?auto_889179 ?auto_889180 ) ) ( not ( = ?auto_889179 ?auto_889181 ) ) ( not ( = ?auto_889179 ?auto_889182 ) ) ( not ( = ?auto_889179 ?auto_889183 ) ) ( not ( = ?auto_889179 ?auto_889184 ) ) ( not ( = ?auto_889179 ?auto_889185 ) ) ( not ( = ?auto_889179 ?auto_889186 ) ) ( not ( = ?auto_889179 ?auto_889187 ) ) ( not ( = ?auto_889179 ?auto_889188 ) ) ( not ( = ?auto_889179 ?auto_889189 ) ) ( not ( = ?auto_889179 ?auto_889190 ) ) ( not ( = ?auto_889179 ?auto_889191 ) ) ( not ( = ?auto_889180 ?auto_889181 ) ) ( not ( = ?auto_889180 ?auto_889182 ) ) ( not ( = ?auto_889180 ?auto_889183 ) ) ( not ( = ?auto_889180 ?auto_889184 ) ) ( not ( = ?auto_889180 ?auto_889185 ) ) ( not ( = ?auto_889180 ?auto_889186 ) ) ( not ( = ?auto_889180 ?auto_889187 ) ) ( not ( = ?auto_889180 ?auto_889188 ) ) ( not ( = ?auto_889180 ?auto_889189 ) ) ( not ( = ?auto_889180 ?auto_889190 ) ) ( not ( = ?auto_889180 ?auto_889191 ) ) ( not ( = ?auto_889181 ?auto_889182 ) ) ( not ( = ?auto_889181 ?auto_889183 ) ) ( not ( = ?auto_889181 ?auto_889184 ) ) ( not ( = ?auto_889181 ?auto_889185 ) ) ( not ( = ?auto_889181 ?auto_889186 ) ) ( not ( = ?auto_889181 ?auto_889187 ) ) ( not ( = ?auto_889181 ?auto_889188 ) ) ( not ( = ?auto_889181 ?auto_889189 ) ) ( not ( = ?auto_889181 ?auto_889190 ) ) ( not ( = ?auto_889181 ?auto_889191 ) ) ( not ( = ?auto_889182 ?auto_889183 ) ) ( not ( = ?auto_889182 ?auto_889184 ) ) ( not ( = ?auto_889182 ?auto_889185 ) ) ( not ( = ?auto_889182 ?auto_889186 ) ) ( not ( = ?auto_889182 ?auto_889187 ) ) ( not ( = ?auto_889182 ?auto_889188 ) ) ( not ( = ?auto_889182 ?auto_889189 ) ) ( not ( = ?auto_889182 ?auto_889190 ) ) ( not ( = ?auto_889182 ?auto_889191 ) ) ( not ( = ?auto_889183 ?auto_889184 ) ) ( not ( = ?auto_889183 ?auto_889185 ) ) ( not ( = ?auto_889183 ?auto_889186 ) ) ( not ( = ?auto_889183 ?auto_889187 ) ) ( not ( = ?auto_889183 ?auto_889188 ) ) ( not ( = ?auto_889183 ?auto_889189 ) ) ( not ( = ?auto_889183 ?auto_889190 ) ) ( not ( = ?auto_889183 ?auto_889191 ) ) ( not ( = ?auto_889184 ?auto_889185 ) ) ( not ( = ?auto_889184 ?auto_889186 ) ) ( not ( = ?auto_889184 ?auto_889187 ) ) ( not ( = ?auto_889184 ?auto_889188 ) ) ( not ( = ?auto_889184 ?auto_889189 ) ) ( not ( = ?auto_889184 ?auto_889190 ) ) ( not ( = ?auto_889184 ?auto_889191 ) ) ( not ( = ?auto_889185 ?auto_889186 ) ) ( not ( = ?auto_889185 ?auto_889187 ) ) ( not ( = ?auto_889185 ?auto_889188 ) ) ( not ( = ?auto_889185 ?auto_889189 ) ) ( not ( = ?auto_889185 ?auto_889190 ) ) ( not ( = ?auto_889185 ?auto_889191 ) ) ( not ( = ?auto_889186 ?auto_889187 ) ) ( not ( = ?auto_889186 ?auto_889188 ) ) ( not ( = ?auto_889186 ?auto_889189 ) ) ( not ( = ?auto_889186 ?auto_889190 ) ) ( not ( = ?auto_889186 ?auto_889191 ) ) ( not ( = ?auto_889187 ?auto_889188 ) ) ( not ( = ?auto_889187 ?auto_889189 ) ) ( not ( = ?auto_889187 ?auto_889190 ) ) ( not ( = ?auto_889187 ?auto_889191 ) ) ( not ( = ?auto_889188 ?auto_889189 ) ) ( not ( = ?auto_889188 ?auto_889190 ) ) ( not ( = ?auto_889188 ?auto_889191 ) ) ( not ( = ?auto_889189 ?auto_889190 ) ) ( not ( = ?auto_889189 ?auto_889191 ) ) ( not ( = ?auto_889190 ?auto_889191 ) ) ( ON ?auto_889190 ?auto_889191 ) ( ON ?auto_889189 ?auto_889190 ) ( ON ?auto_889188 ?auto_889189 ) ( ON ?auto_889187 ?auto_889188 ) ( ON ?auto_889186 ?auto_889187 ) ( ON ?auto_889185 ?auto_889186 ) ( ON ?auto_889184 ?auto_889185 ) ( ON ?auto_889183 ?auto_889184 ) ( ON ?auto_889182 ?auto_889183 ) ( ON ?auto_889181 ?auto_889182 ) ( ON ?auto_889180 ?auto_889181 ) ( ON ?auto_889179 ?auto_889180 ) ( ON ?auto_889178 ?auto_889179 ) ( ON ?auto_889177 ?auto_889178 ) ( ON ?auto_889176 ?auto_889177 ) ( ON ?auto_889175 ?auto_889176 ) ( ON ?auto_889174 ?auto_889175 ) ( CLEAR ?auto_889174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_889174 )
      ( MAKE-18PILE ?auto_889174 ?auto_889175 ?auto_889176 ?auto_889177 ?auto_889178 ?auto_889179 ?auto_889180 ?auto_889181 ?auto_889182 ?auto_889183 ?auto_889184 ?auto_889185 ?auto_889186 ?auto_889187 ?auto_889188 ?auto_889189 ?auto_889190 ?auto_889191 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_889210 - BLOCK
      ?auto_889211 - BLOCK
      ?auto_889212 - BLOCK
      ?auto_889213 - BLOCK
      ?auto_889214 - BLOCK
      ?auto_889215 - BLOCK
      ?auto_889216 - BLOCK
      ?auto_889217 - BLOCK
      ?auto_889218 - BLOCK
      ?auto_889219 - BLOCK
      ?auto_889220 - BLOCK
      ?auto_889221 - BLOCK
      ?auto_889222 - BLOCK
      ?auto_889223 - BLOCK
      ?auto_889224 - BLOCK
      ?auto_889225 - BLOCK
      ?auto_889226 - BLOCK
      ?auto_889227 - BLOCK
    )
    :vars
    (
      ?auto_889228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_889210 ?auto_889211 ) ) ( not ( = ?auto_889210 ?auto_889212 ) ) ( not ( = ?auto_889210 ?auto_889213 ) ) ( not ( = ?auto_889210 ?auto_889214 ) ) ( not ( = ?auto_889210 ?auto_889215 ) ) ( not ( = ?auto_889210 ?auto_889216 ) ) ( not ( = ?auto_889210 ?auto_889217 ) ) ( not ( = ?auto_889210 ?auto_889218 ) ) ( not ( = ?auto_889210 ?auto_889219 ) ) ( not ( = ?auto_889210 ?auto_889220 ) ) ( not ( = ?auto_889210 ?auto_889221 ) ) ( not ( = ?auto_889210 ?auto_889222 ) ) ( not ( = ?auto_889210 ?auto_889223 ) ) ( not ( = ?auto_889210 ?auto_889224 ) ) ( not ( = ?auto_889210 ?auto_889225 ) ) ( not ( = ?auto_889210 ?auto_889226 ) ) ( not ( = ?auto_889210 ?auto_889227 ) ) ( not ( = ?auto_889211 ?auto_889212 ) ) ( not ( = ?auto_889211 ?auto_889213 ) ) ( not ( = ?auto_889211 ?auto_889214 ) ) ( not ( = ?auto_889211 ?auto_889215 ) ) ( not ( = ?auto_889211 ?auto_889216 ) ) ( not ( = ?auto_889211 ?auto_889217 ) ) ( not ( = ?auto_889211 ?auto_889218 ) ) ( not ( = ?auto_889211 ?auto_889219 ) ) ( not ( = ?auto_889211 ?auto_889220 ) ) ( not ( = ?auto_889211 ?auto_889221 ) ) ( not ( = ?auto_889211 ?auto_889222 ) ) ( not ( = ?auto_889211 ?auto_889223 ) ) ( not ( = ?auto_889211 ?auto_889224 ) ) ( not ( = ?auto_889211 ?auto_889225 ) ) ( not ( = ?auto_889211 ?auto_889226 ) ) ( not ( = ?auto_889211 ?auto_889227 ) ) ( not ( = ?auto_889212 ?auto_889213 ) ) ( not ( = ?auto_889212 ?auto_889214 ) ) ( not ( = ?auto_889212 ?auto_889215 ) ) ( not ( = ?auto_889212 ?auto_889216 ) ) ( not ( = ?auto_889212 ?auto_889217 ) ) ( not ( = ?auto_889212 ?auto_889218 ) ) ( not ( = ?auto_889212 ?auto_889219 ) ) ( not ( = ?auto_889212 ?auto_889220 ) ) ( not ( = ?auto_889212 ?auto_889221 ) ) ( not ( = ?auto_889212 ?auto_889222 ) ) ( not ( = ?auto_889212 ?auto_889223 ) ) ( not ( = ?auto_889212 ?auto_889224 ) ) ( not ( = ?auto_889212 ?auto_889225 ) ) ( not ( = ?auto_889212 ?auto_889226 ) ) ( not ( = ?auto_889212 ?auto_889227 ) ) ( not ( = ?auto_889213 ?auto_889214 ) ) ( not ( = ?auto_889213 ?auto_889215 ) ) ( not ( = ?auto_889213 ?auto_889216 ) ) ( not ( = ?auto_889213 ?auto_889217 ) ) ( not ( = ?auto_889213 ?auto_889218 ) ) ( not ( = ?auto_889213 ?auto_889219 ) ) ( not ( = ?auto_889213 ?auto_889220 ) ) ( not ( = ?auto_889213 ?auto_889221 ) ) ( not ( = ?auto_889213 ?auto_889222 ) ) ( not ( = ?auto_889213 ?auto_889223 ) ) ( not ( = ?auto_889213 ?auto_889224 ) ) ( not ( = ?auto_889213 ?auto_889225 ) ) ( not ( = ?auto_889213 ?auto_889226 ) ) ( not ( = ?auto_889213 ?auto_889227 ) ) ( not ( = ?auto_889214 ?auto_889215 ) ) ( not ( = ?auto_889214 ?auto_889216 ) ) ( not ( = ?auto_889214 ?auto_889217 ) ) ( not ( = ?auto_889214 ?auto_889218 ) ) ( not ( = ?auto_889214 ?auto_889219 ) ) ( not ( = ?auto_889214 ?auto_889220 ) ) ( not ( = ?auto_889214 ?auto_889221 ) ) ( not ( = ?auto_889214 ?auto_889222 ) ) ( not ( = ?auto_889214 ?auto_889223 ) ) ( not ( = ?auto_889214 ?auto_889224 ) ) ( not ( = ?auto_889214 ?auto_889225 ) ) ( not ( = ?auto_889214 ?auto_889226 ) ) ( not ( = ?auto_889214 ?auto_889227 ) ) ( not ( = ?auto_889215 ?auto_889216 ) ) ( not ( = ?auto_889215 ?auto_889217 ) ) ( not ( = ?auto_889215 ?auto_889218 ) ) ( not ( = ?auto_889215 ?auto_889219 ) ) ( not ( = ?auto_889215 ?auto_889220 ) ) ( not ( = ?auto_889215 ?auto_889221 ) ) ( not ( = ?auto_889215 ?auto_889222 ) ) ( not ( = ?auto_889215 ?auto_889223 ) ) ( not ( = ?auto_889215 ?auto_889224 ) ) ( not ( = ?auto_889215 ?auto_889225 ) ) ( not ( = ?auto_889215 ?auto_889226 ) ) ( not ( = ?auto_889215 ?auto_889227 ) ) ( not ( = ?auto_889216 ?auto_889217 ) ) ( not ( = ?auto_889216 ?auto_889218 ) ) ( not ( = ?auto_889216 ?auto_889219 ) ) ( not ( = ?auto_889216 ?auto_889220 ) ) ( not ( = ?auto_889216 ?auto_889221 ) ) ( not ( = ?auto_889216 ?auto_889222 ) ) ( not ( = ?auto_889216 ?auto_889223 ) ) ( not ( = ?auto_889216 ?auto_889224 ) ) ( not ( = ?auto_889216 ?auto_889225 ) ) ( not ( = ?auto_889216 ?auto_889226 ) ) ( not ( = ?auto_889216 ?auto_889227 ) ) ( not ( = ?auto_889217 ?auto_889218 ) ) ( not ( = ?auto_889217 ?auto_889219 ) ) ( not ( = ?auto_889217 ?auto_889220 ) ) ( not ( = ?auto_889217 ?auto_889221 ) ) ( not ( = ?auto_889217 ?auto_889222 ) ) ( not ( = ?auto_889217 ?auto_889223 ) ) ( not ( = ?auto_889217 ?auto_889224 ) ) ( not ( = ?auto_889217 ?auto_889225 ) ) ( not ( = ?auto_889217 ?auto_889226 ) ) ( not ( = ?auto_889217 ?auto_889227 ) ) ( not ( = ?auto_889218 ?auto_889219 ) ) ( not ( = ?auto_889218 ?auto_889220 ) ) ( not ( = ?auto_889218 ?auto_889221 ) ) ( not ( = ?auto_889218 ?auto_889222 ) ) ( not ( = ?auto_889218 ?auto_889223 ) ) ( not ( = ?auto_889218 ?auto_889224 ) ) ( not ( = ?auto_889218 ?auto_889225 ) ) ( not ( = ?auto_889218 ?auto_889226 ) ) ( not ( = ?auto_889218 ?auto_889227 ) ) ( not ( = ?auto_889219 ?auto_889220 ) ) ( not ( = ?auto_889219 ?auto_889221 ) ) ( not ( = ?auto_889219 ?auto_889222 ) ) ( not ( = ?auto_889219 ?auto_889223 ) ) ( not ( = ?auto_889219 ?auto_889224 ) ) ( not ( = ?auto_889219 ?auto_889225 ) ) ( not ( = ?auto_889219 ?auto_889226 ) ) ( not ( = ?auto_889219 ?auto_889227 ) ) ( not ( = ?auto_889220 ?auto_889221 ) ) ( not ( = ?auto_889220 ?auto_889222 ) ) ( not ( = ?auto_889220 ?auto_889223 ) ) ( not ( = ?auto_889220 ?auto_889224 ) ) ( not ( = ?auto_889220 ?auto_889225 ) ) ( not ( = ?auto_889220 ?auto_889226 ) ) ( not ( = ?auto_889220 ?auto_889227 ) ) ( not ( = ?auto_889221 ?auto_889222 ) ) ( not ( = ?auto_889221 ?auto_889223 ) ) ( not ( = ?auto_889221 ?auto_889224 ) ) ( not ( = ?auto_889221 ?auto_889225 ) ) ( not ( = ?auto_889221 ?auto_889226 ) ) ( not ( = ?auto_889221 ?auto_889227 ) ) ( not ( = ?auto_889222 ?auto_889223 ) ) ( not ( = ?auto_889222 ?auto_889224 ) ) ( not ( = ?auto_889222 ?auto_889225 ) ) ( not ( = ?auto_889222 ?auto_889226 ) ) ( not ( = ?auto_889222 ?auto_889227 ) ) ( not ( = ?auto_889223 ?auto_889224 ) ) ( not ( = ?auto_889223 ?auto_889225 ) ) ( not ( = ?auto_889223 ?auto_889226 ) ) ( not ( = ?auto_889223 ?auto_889227 ) ) ( not ( = ?auto_889224 ?auto_889225 ) ) ( not ( = ?auto_889224 ?auto_889226 ) ) ( not ( = ?auto_889224 ?auto_889227 ) ) ( not ( = ?auto_889225 ?auto_889226 ) ) ( not ( = ?auto_889225 ?auto_889227 ) ) ( not ( = ?auto_889226 ?auto_889227 ) ) ( ON ?auto_889210 ?auto_889228 ) ( not ( = ?auto_889227 ?auto_889228 ) ) ( not ( = ?auto_889226 ?auto_889228 ) ) ( not ( = ?auto_889225 ?auto_889228 ) ) ( not ( = ?auto_889224 ?auto_889228 ) ) ( not ( = ?auto_889223 ?auto_889228 ) ) ( not ( = ?auto_889222 ?auto_889228 ) ) ( not ( = ?auto_889221 ?auto_889228 ) ) ( not ( = ?auto_889220 ?auto_889228 ) ) ( not ( = ?auto_889219 ?auto_889228 ) ) ( not ( = ?auto_889218 ?auto_889228 ) ) ( not ( = ?auto_889217 ?auto_889228 ) ) ( not ( = ?auto_889216 ?auto_889228 ) ) ( not ( = ?auto_889215 ?auto_889228 ) ) ( not ( = ?auto_889214 ?auto_889228 ) ) ( not ( = ?auto_889213 ?auto_889228 ) ) ( not ( = ?auto_889212 ?auto_889228 ) ) ( not ( = ?auto_889211 ?auto_889228 ) ) ( not ( = ?auto_889210 ?auto_889228 ) ) ( ON ?auto_889211 ?auto_889210 ) ( ON ?auto_889212 ?auto_889211 ) ( ON ?auto_889213 ?auto_889212 ) ( ON ?auto_889214 ?auto_889213 ) ( ON ?auto_889215 ?auto_889214 ) ( ON ?auto_889216 ?auto_889215 ) ( ON ?auto_889217 ?auto_889216 ) ( ON ?auto_889218 ?auto_889217 ) ( ON ?auto_889219 ?auto_889218 ) ( ON ?auto_889220 ?auto_889219 ) ( ON ?auto_889221 ?auto_889220 ) ( ON ?auto_889222 ?auto_889221 ) ( ON ?auto_889223 ?auto_889222 ) ( ON ?auto_889224 ?auto_889223 ) ( ON ?auto_889225 ?auto_889224 ) ( ON ?auto_889226 ?auto_889225 ) ( ON ?auto_889227 ?auto_889226 ) ( CLEAR ?auto_889227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_889227 ?auto_889226 ?auto_889225 ?auto_889224 ?auto_889223 ?auto_889222 ?auto_889221 ?auto_889220 ?auto_889219 ?auto_889218 ?auto_889217 ?auto_889216 ?auto_889215 ?auto_889214 ?auto_889213 ?auto_889212 ?auto_889211 ?auto_889210 )
      ( MAKE-18PILE ?auto_889210 ?auto_889211 ?auto_889212 ?auto_889213 ?auto_889214 ?auto_889215 ?auto_889216 ?auto_889217 ?auto_889218 ?auto_889219 ?auto_889220 ?auto_889221 ?auto_889222 ?auto_889223 ?auto_889224 ?auto_889225 ?auto_889226 ?auto_889227 ) )
  )

)

