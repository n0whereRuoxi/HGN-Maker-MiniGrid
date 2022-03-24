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
      ?auto_687433 - BLOCK
    )
    :vars
    (
      ?auto_687434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687433 ?auto_687434 ) ( CLEAR ?auto_687433 ) ( HAND-EMPTY ) ( not ( = ?auto_687433 ?auto_687434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_687433 ?auto_687434 )
      ( !PUTDOWN ?auto_687433 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_687440 - BLOCK
      ?auto_687441 - BLOCK
    )
    :vars
    (
      ?auto_687442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_687440 ) ( ON ?auto_687441 ?auto_687442 ) ( CLEAR ?auto_687441 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_687440 ) ( not ( = ?auto_687440 ?auto_687441 ) ) ( not ( = ?auto_687440 ?auto_687442 ) ) ( not ( = ?auto_687441 ?auto_687442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_687441 ?auto_687442 )
      ( !STACK ?auto_687441 ?auto_687440 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_687450 - BLOCK
      ?auto_687451 - BLOCK
    )
    :vars
    (
      ?auto_687452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687451 ?auto_687452 ) ( not ( = ?auto_687450 ?auto_687451 ) ) ( not ( = ?auto_687450 ?auto_687452 ) ) ( not ( = ?auto_687451 ?auto_687452 ) ) ( ON ?auto_687450 ?auto_687451 ) ( CLEAR ?auto_687450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_687450 )
      ( MAKE-2PILE ?auto_687450 ?auto_687451 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_687461 - BLOCK
      ?auto_687462 - BLOCK
      ?auto_687463 - BLOCK
    )
    :vars
    (
      ?auto_687464 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_687462 ) ( ON ?auto_687463 ?auto_687464 ) ( CLEAR ?auto_687463 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_687461 ) ( ON ?auto_687462 ?auto_687461 ) ( not ( = ?auto_687461 ?auto_687462 ) ) ( not ( = ?auto_687461 ?auto_687463 ) ) ( not ( = ?auto_687461 ?auto_687464 ) ) ( not ( = ?auto_687462 ?auto_687463 ) ) ( not ( = ?auto_687462 ?auto_687464 ) ) ( not ( = ?auto_687463 ?auto_687464 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_687463 ?auto_687464 )
      ( !STACK ?auto_687463 ?auto_687462 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_687475 - BLOCK
      ?auto_687476 - BLOCK
      ?auto_687477 - BLOCK
    )
    :vars
    (
      ?auto_687478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687477 ?auto_687478 ) ( ON-TABLE ?auto_687475 ) ( not ( = ?auto_687475 ?auto_687476 ) ) ( not ( = ?auto_687475 ?auto_687477 ) ) ( not ( = ?auto_687475 ?auto_687478 ) ) ( not ( = ?auto_687476 ?auto_687477 ) ) ( not ( = ?auto_687476 ?auto_687478 ) ) ( not ( = ?auto_687477 ?auto_687478 ) ) ( CLEAR ?auto_687475 ) ( ON ?auto_687476 ?auto_687477 ) ( CLEAR ?auto_687476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_687475 ?auto_687476 )
      ( MAKE-3PILE ?auto_687475 ?auto_687476 ?auto_687477 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_687489 - BLOCK
      ?auto_687490 - BLOCK
      ?auto_687491 - BLOCK
    )
    :vars
    (
      ?auto_687492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687491 ?auto_687492 ) ( not ( = ?auto_687489 ?auto_687490 ) ) ( not ( = ?auto_687489 ?auto_687491 ) ) ( not ( = ?auto_687489 ?auto_687492 ) ) ( not ( = ?auto_687490 ?auto_687491 ) ) ( not ( = ?auto_687490 ?auto_687492 ) ) ( not ( = ?auto_687491 ?auto_687492 ) ) ( ON ?auto_687490 ?auto_687491 ) ( ON ?auto_687489 ?auto_687490 ) ( CLEAR ?auto_687489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_687489 )
      ( MAKE-3PILE ?auto_687489 ?auto_687490 ?auto_687491 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_687504 - BLOCK
      ?auto_687505 - BLOCK
      ?auto_687506 - BLOCK
      ?auto_687507 - BLOCK
    )
    :vars
    (
      ?auto_687508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_687506 ) ( ON ?auto_687507 ?auto_687508 ) ( CLEAR ?auto_687507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_687504 ) ( ON ?auto_687505 ?auto_687504 ) ( ON ?auto_687506 ?auto_687505 ) ( not ( = ?auto_687504 ?auto_687505 ) ) ( not ( = ?auto_687504 ?auto_687506 ) ) ( not ( = ?auto_687504 ?auto_687507 ) ) ( not ( = ?auto_687504 ?auto_687508 ) ) ( not ( = ?auto_687505 ?auto_687506 ) ) ( not ( = ?auto_687505 ?auto_687507 ) ) ( not ( = ?auto_687505 ?auto_687508 ) ) ( not ( = ?auto_687506 ?auto_687507 ) ) ( not ( = ?auto_687506 ?auto_687508 ) ) ( not ( = ?auto_687507 ?auto_687508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_687507 ?auto_687508 )
      ( !STACK ?auto_687507 ?auto_687506 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_687522 - BLOCK
      ?auto_687523 - BLOCK
      ?auto_687524 - BLOCK
      ?auto_687525 - BLOCK
    )
    :vars
    (
      ?auto_687526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687525 ?auto_687526 ) ( ON-TABLE ?auto_687522 ) ( ON ?auto_687523 ?auto_687522 ) ( not ( = ?auto_687522 ?auto_687523 ) ) ( not ( = ?auto_687522 ?auto_687524 ) ) ( not ( = ?auto_687522 ?auto_687525 ) ) ( not ( = ?auto_687522 ?auto_687526 ) ) ( not ( = ?auto_687523 ?auto_687524 ) ) ( not ( = ?auto_687523 ?auto_687525 ) ) ( not ( = ?auto_687523 ?auto_687526 ) ) ( not ( = ?auto_687524 ?auto_687525 ) ) ( not ( = ?auto_687524 ?auto_687526 ) ) ( not ( = ?auto_687525 ?auto_687526 ) ) ( CLEAR ?auto_687523 ) ( ON ?auto_687524 ?auto_687525 ) ( CLEAR ?auto_687524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_687522 ?auto_687523 ?auto_687524 )
      ( MAKE-4PILE ?auto_687522 ?auto_687523 ?auto_687524 ?auto_687525 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_687540 - BLOCK
      ?auto_687541 - BLOCK
      ?auto_687542 - BLOCK
      ?auto_687543 - BLOCK
    )
    :vars
    (
      ?auto_687544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687543 ?auto_687544 ) ( ON-TABLE ?auto_687540 ) ( not ( = ?auto_687540 ?auto_687541 ) ) ( not ( = ?auto_687540 ?auto_687542 ) ) ( not ( = ?auto_687540 ?auto_687543 ) ) ( not ( = ?auto_687540 ?auto_687544 ) ) ( not ( = ?auto_687541 ?auto_687542 ) ) ( not ( = ?auto_687541 ?auto_687543 ) ) ( not ( = ?auto_687541 ?auto_687544 ) ) ( not ( = ?auto_687542 ?auto_687543 ) ) ( not ( = ?auto_687542 ?auto_687544 ) ) ( not ( = ?auto_687543 ?auto_687544 ) ) ( ON ?auto_687542 ?auto_687543 ) ( CLEAR ?auto_687540 ) ( ON ?auto_687541 ?auto_687542 ) ( CLEAR ?auto_687541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_687540 ?auto_687541 )
      ( MAKE-4PILE ?auto_687540 ?auto_687541 ?auto_687542 ?auto_687543 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_687558 - BLOCK
      ?auto_687559 - BLOCK
      ?auto_687560 - BLOCK
      ?auto_687561 - BLOCK
    )
    :vars
    (
      ?auto_687562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687561 ?auto_687562 ) ( not ( = ?auto_687558 ?auto_687559 ) ) ( not ( = ?auto_687558 ?auto_687560 ) ) ( not ( = ?auto_687558 ?auto_687561 ) ) ( not ( = ?auto_687558 ?auto_687562 ) ) ( not ( = ?auto_687559 ?auto_687560 ) ) ( not ( = ?auto_687559 ?auto_687561 ) ) ( not ( = ?auto_687559 ?auto_687562 ) ) ( not ( = ?auto_687560 ?auto_687561 ) ) ( not ( = ?auto_687560 ?auto_687562 ) ) ( not ( = ?auto_687561 ?auto_687562 ) ) ( ON ?auto_687560 ?auto_687561 ) ( ON ?auto_687559 ?auto_687560 ) ( ON ?auto_687558 ?auto_687559 ) ( CLEAR ?auto_687558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_687558 )
      ( MAKE-4PILE ?auto_687558 ?auto_687559 ?auto_687560 ?auto_687561 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_687577 - BLOCK
      ?auto_687578 - BLOCK
      ?auto_687579 - BLOCK
      ?auto_687580 - BLOCK
      ?auto_687581 - BLOCK
    )
    :vars
    (
      ?auto_687582 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_687580 ) ( ON ?auto_687581 ?auto_687582 ) ( CLEAR ?auto_687581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_687577 ) ( ON ?auto_687578 ?auto_687577 ) ( ON ?auto_687579 ?auto_687578 ) ( ON ?auto_687580 ?auto_687579 ) ( not ( = ?auto_687577 ?auto_687578 ) ) ( not ( = ?auto_687577 ?auto_687579 ) ) ( not ( = ?auto_687577 ?auto_687580 ) ) ( not ( = ?auto_687577 ?auto_687581 ) ) ( not ( = ?auto_687577 ?auto_687582 ) ) ( not ( = ?auto_687578 ?auto_687579 ) ) ( not ( = ?auto_687578 ?auto_687580 ) ) ( not ( = ?auto_687578 ?auto_687581 ) ) ( not ( = ?auto_687578 ?auto_687582 ) ) ( not ( = ?auto_687579 ?auto_687580 ) ) ( not ( = ?auto_687579 ?auto_687581 ) ) ( not ( = ?auto_687579 ?auto_687582 ) ) ( not ( = ?auto_687580 ?auto_687581 ) ) ( not ( = ?auto_687580 ?auto_687582 ) ) ( not ( = ?auto_687581 ?auto_687582 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_687581 ?auto_687582 )
      ( !STACK ?auto_687581 ?auto_687580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_687599 - BLOCK
      ?auto_687600 - BLOCK
      ?auto_687601 - BLOCK
      ?auto_687602 - BLOCK
      ?auto_687603 - BLOCK
    )
    :vars
    (
      ?auto_687604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687603 ?auto_687604 ) ( ON-TABLE ?auto_687599 ) ( ON ?auto_687600 ?auto_687599 ) ( ON ?auto_687601 ?auto_687600 ) ( not ( = ?auto_687599 ?auto_687600 ) ) ( not ( = ?auto_687599 ?auto_687601 ) ) ( not ( = ?auto_687599 ?auto_687602 ) ) ( not ( = ?auto_687599 ?auto_687603 ) ) ( not ( = ?auto_687599 ?auto_687604 ) ) ( not ( = ?auto_687600 ?auto_687601 ) ) ( not ( = ?auto_687600 ?auto_687602 ) ) ( not ( = ?auto_687600 ?auto_687603 ) ) ( not ( = ?auto_687600 ?auto_687604 ) ) ( not ( = ?auto_687601 ?auto_687602 ) ) ( not ( = ?auto_687601 ?auto_687603 ) ) ( not ( = ?auto_687601 ?auto_687604 ) ) ( not ( = ?auto_687602 ?auto_687603 ) ) ( not ( = ?auto_687602 ?auto_687604 ) ) ( not ( = ?auto_687603 ?auto_687604 ) ) ( CLEAR ?auto_687601 ) ( ON ?auto_687602 ?auto_687603 ) ( CLEAR ?auto_687602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_687599 ?auto_687600 ?auto_687601 ?auto_687602 )
      ( MAKE-5PILE ?auto_687599 ?auto_687600 ?auto_687601 ?auto_687602 ?auto_687603 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_687621 - BLOCK
      ?auto_687622 - BLOCK
      ?auto_687623 - BLOCK
      ?auto_687624 - BLOCK
      ?auto_687625 - BLOCK
    )
    :vars
    (
      ?auto_687626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687625 ?auto_687626 ) ( ON-TABLE ?auto_687621 ) ( ON ?auto_687622 ?auto_687621 ) ( not ( = ?auto_687621 ?auto_687622 ) ) ( not ( = ?auto_687621 ?auto_687623 ) ) ( not ( = ?auto_687621 ?auto_687624 ) ) ( not ( = ?auto_687621 ?auto_687625 ) ) ( not ( = ?auto_687621 ?auto_687626 ) ) ( not ( = ?auto_687622 ?auto_687623 ) ) ( not ( = ?auto_687622 ?auto_687624 ) ) ( not ( = ?auto_687622 ?auto_687625 ) ) ( not ( = ?auto_687622 ?auto_687626 ) ) ( not ( = ?auto_687623 ?auto_687624 ) ) ( not ( = ?auto_687623 ?auto_687625 ) ) ( not ( = ?auto_687623 ?auto_687626 ) ) ( not ( = ?auto_687624 ?auto_687625 ) ) ( not ( = ?auto_687624 ?auto_687626 ) ) ( not ( = ?auto_687625 ?auto_687626 ) ) ( ON ?auto_687624 ?auto_687625 ) ( CLEAR ?auto_687622 ) ( ON ?auto_687623 ?auto_687624 ) ( CLEAR ?auto_687623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_687621 ?auto_687622 ?auto_687623 )
      ( MAKE-5PILE ?auto_687621 ?auto_687622 ?auto_687623 ?auto_687624 ?auto_687625 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_687643 - BLOCK
      ?auto_687644 - BLOCK
      ?auto_687645 - BLOCK
      ?auto_687646 - BLOCK
      ?auto_687647 - BLOCK
    )
    :vars
    (
      ?auto_687648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687647 ?auto_687648 ) ( ON-TABLE ?auto_687643 ) ( not ( = ?auto_687643 ?auto_687644 ) ) ( not ( = ?auto_687643 ?auto_687645 ) ) ( not ( = ?auto_687643 ?auto_687646 ) ) ( not ( = ?auto_687643 ?auto_687647 ) ) ( not ( = ?auto_687643 ?auto_687648 ) ) ( not ( = ?auto_687644 ?auto_687645 ) ) ( not ( = ?auto_687644 ?auto_687646 ) ) ( not ( = ?auto_687644 ?auto_687647 ) ) ( not ( = ?auto_687644 ?auto_687648 ) ) ( not ( = ?auto_687645 ?auto_687646 ) ) ( not ( = ?auto_687645 ?auto_687647 ) ) ( not ( = ?auto_687645 ?auto_687648 ) ) ( not ( = ?auto_687646 ?auto_687647 ) ) ( not ( = ?auto_687646 ?auto_687648 ) ) ( not ( = ?auto_687647 ?auto_687648 ) ) ( ON ?auto_687646 ?auto_687647 ) ( ON ?auto_687645 ?auto_687646 ) ( CLEAR ?auto_687643 ) ( ON ?auto_687644 ?auto_687645 ) ( CLEAR ?auto_687644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_687643 ?auto_687644 )
      ( MAKE-5PILE ?auto_687643 ?auto_687644 ?auto_687645 ?auto_687646 ?auto_687647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_687665 - BLOCK
      ?auto_687666 - BLOCK
      ?auto_687667 - BLOCK
      ?auto_687668 - BLOCK
      ?auto_687669 - BLOCK
    )
    :vars
    (
      ?auto_687670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687669 ?auto_687670 ) ( not ( = ?auto_687665 ?auto_687666 ) ) ( not ( = ?auto_687665 ?auto_687667 ) ) ( not ( = ?auto_687665 ?auto_687668 ) ) ( not ( = ?auto_687665 ?auto_687669 ) ) ( not ( = ?auto_687665 ?auto_687670 ) ) ( not ( = ?auto_687666 ?auto_687667 ) ) ( not ( = ?auto_687666 ?auto_687668 ) ) ( not ( = ?auto_687666 ?auto_687669 ) ) ( not ( = ?auto_687666 ?auto_687670 ) ) ( not ( = ?auto_687667 ?auto_687668 ) ) ( not ( = ?auto_687667 ?auto_687669 ) ) ( not ( = ?auto_687667 ?auto_687670 ) ) ( not ( = ?auto_687668 ?auto_687669 ) ) ( not ( = ?auto_687668 ?auto_687670 ) ) ( not ( = ?auto_687669 ?auto_687670 ) ) ( ON ?auto_687668 ?auto_687669 ) ( ON ?auto_687667 ?auto_687668 ) ( ON ?auto_687666 ?auto_687667 ) ( ON ?auto_687665 ?auto_687666 ) ( CLEAR ?auto_687665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_687665 )
      ( MAKE-5PILE ?auto_687665 ?auto_687666 ?auto_687667 ?auto_687668 ?auto_687669 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_687688 - BLOCK
      ?auto_687689 - BLOCK
      ?auto_687690 - BLOCK
      ?auto_687691 - BLOCK
      ?auto_687692 - BLOCK
      ?auto_687693 - BLOCK
    )
    :vars
    (
      ?auto_687694 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_687692 ) ( ON ?auto_687693 ?auto_687694 ) ( CLEAR ?auto_687693 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_687688 ) ( ON ?auto_687689 ?auto_687688 ) ( ON ?auto_687690 ?auto_687689 ) ( ON ?auto_687691 ?auto_687690 ) ( ON ?auto_687692 ?auto_687691 ) ( not ( = ?auto_687688 ?auto_687689 ) ) ( not ( = ?auto_687688 ?auto_687690 ) ) ( not ( = ?auto_687688 ?auto_687691 ) ) ( not ( = ?auto_687688 ?auto_687692 ) ) ( not ( = ?auto_687688 ?auto_687693 ) ) ( not ( = ?auto_687688 ?auto_687694 ) ) ( not ( = ?auto_687689 ?auto_687690 ) ) ( not ( = ?auto_687689 ?auto_687691 ) ) ( not ( = ?auto_687689 ?auto_687692 ) ) ( not ( = ?auto_687689 ?auto_687693 ) ) ( not ( = ?auto_687689 ?auto_687694 ) ) ( not ( = ?auto_687690 ?auto_687691 ) ) ( not ( = ?auto_687690 ?auto_687692 ) ) ( not ( = ?auto_687690 ?auto_687693 ) ) ( not ( = ?auto_687690 ?auto_687694 ) ) ( not ( = ?auto_687691 ?auto_687692 ) ) ( not ( = ?auto_687691 ?auto_687693 ) ) ( not ( = ?auto_687691 ?auto_687694 ) ) ( not ( = ?auto_687692 ?auto_687693 ) ) ( not ( = ?auto_687692 ?auto_687694 ) ) ( not ( = ?auto_687693 ?auto_687694 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_687693 ?auto_687694 )
      ( !STACK ?auto_687693 ?auto_687692 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_687714 - BLOCK
      ?auto_687715 - BLOCK
      ?auto_687716 - BLOCK
      ?auto_687717 - BLOCK
      ?auto_687718 - BLOCK
      ?auto_687719 - BLOCK
    )
    :vars
    (
      ?auto_687720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687719 ?auto_687720 ) ( ON-TABLE ?auto_687714 ) ( ON ?auto_687715 ?auto_687714 ) ( ON ?auto_687716 ?auto_687715 ) ( ON ?auto_687717 ?auto_687716 ) ( not ( = ?auto_687714 ?auto_687715 ) ) ( not ( = ?auto_687714 ?auto_687716 ) ) ( not ( = ?auto_687714 ?auto_687717 ) ) ( not ( = ?auto_687714 ?auto_687718 ) ) ( not ( = ?auto_687714 ?auto_687719 ) ) ( not ( = ?auto_687714 ?auto_687720 ) ) ( not ( = ?auto_687715 ?auto_687716 ) ) ( not ( = ?auto_687715 ?auto_687717 ) ) ( not ( = ?auto_687715 ?auto_687718 ) ) ( not ( = ?auto_687715 ?auto_687719 ) ) ( not ( = ?auto_687715 ?auto_687720 ) ) ( not ( = ?auto_687716 ?auto_687717 ) ) ( not ( = ?auto_687716 ?auto_687718 ) ) ( not ( = ?auto_687716 ?auto_687719 ) ) ( not ( = ?auto_687716 ?auto_687720 ) ) ( not ( = ?auto_687717 ?auto_687718 ) ) ( not ( = ?auto_687717 ?auto_687719 ) ) ( not ( = ?auto_687717 ?auto_687720 ) ) ( not ( = ?auto_687718 ?auto_687719 ) ) ( not ( = ?auto_687718 ?auto_687720 ) ) ( not ( = ?auto_687719 ?auto_687720 ) ) ( CLEAR ?auto_687717 ) ( ON ?auto_687718 ?auto_687719 ) ( CLEAR ?auto_687718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_687714 ?auto_687715 ?auto_687716 ?auto_687717 ?auto_687718 )
      ( MAKE-6PILE ?auto_687714 ?auto_687715 ?auto_687716 ?auto_687717 ?auto_687718 ?auto_687719 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_687740 - BLOCK
      ?auto_687741 - BLOCK
      ?auto_687742 - BLOCK
      ?auto_687743 - BLOCK
      ?auto_687744 - BLOCK
      ?auto_687745 - BLOCK
    )
    :vars
    (
      ?auto_687746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687745 ?auto_687746 ) ( ON-TABLE ?auto_687740 ) ( ON ?auto_687741 ?auto_687740 ) ( ON ?auto_687742 ?auto_687741 ) ( not ( = ?auto_687740 ?auto_687741 ) ) ( not ( = ?auto_687740 ?auto_687742 ) ) ( not ( = ?auto_687740 ?auto_687743 ) ) ( not ( = ?auto_687740 ?auto_687744 ) ) ( not ( = ?auto_687740 ?auto_687745 ) ) ( not ( = ?auto_687740 ?auto_687746 ) ) ( not ( = ?auto_687741 ?auto_687742 ) ) ( not ( = ?auto_687741 ?auto_687743 ) ) ( not ( = ?auto_687741 ?auto_687744 ) ) ( not ( = ?auto_687741 ?auto_687745 ) ) ( not ( = ?auto_687741 ?auto_687746 ) ) ( not ( = ?auto_687742 ?auto_687743 ) ) ( not ( = ?auto_687742 ?auto_687744 ) ) ( not ( = ?auto_687742 ?auto_687745 ) ) ( not ( = ?auto_687742 ?auto_687746 ) ) ( not ( = ?auto_687743 ?auto_687744 ) ) ( not ( = ?auto_687743 ?auto_687745 ) ) ( not ( = ?auto_687743 ?auto_687746 ) ) ( not ( = ?auto_687744 ?auto_687745 ) ) ( not ( = ?auto_687744 ?auto_687746 ) ) ( not ( = ?auto_687745 ?auto_687746 ) ) ( ON ?auto_687744 ?auto_687745 ) ( CLEAR ?auto_687742 ) ( ON ?auto_687743 ?auto_687744 ) ( CLEAR ?auto_687743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_687740 ?auto_687741 ?auto_687742 ?auto_687743 )
      ( MAKE-6PILE ?auto_687740 ?auto_687741 ?auto_687742 ?auto_687743 ?auto_687744 ?auto_687745 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_687766 - BLOCK
      ?auto_687767 - BLOCK
      ?auto_687768 - BLOCK
      ?auto_687769 - BLOCK
      ?auto_687770 - BLOCK
      ?auto_687771 - BLOCK
    )
    :vars
    (
      ?auto_687772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687771 ?auto_687772 ) ( ON-TABLE ?auto_687766 ) ( ON ?auto_687767 ?auto_687766 ) ( not ( = ?auto_687766 ?auto_687767 ) ) ( not ( = ?auto_687766 ?auto_687768 ) ) ( not ( = ?auto_687766 ?auto_687769 ) ) ( not ( = ?auto_687766 ?auto_687770 ) ) ( not ( = ?auto_687766 ?auto_687771 ) ) ( not ( = ?auto_687766 ?auto_687772 ) ) ( not ( = ?auto_687767 ?auto_687768 ) ) ( not ( = ?auto_687767 ?auto_687769 ) ) ( not ( = ?auto_687767 ?auto_687770 ) ) ( not ( = ?auto_687767 ?auto_687771 ) ) ( not ( = ?auto_687767 ?auto_687772 ) ) ( not ( = ?auto_687768 ?auto_687769 ) ) ( not ( = ?auto_687768 ?auto_687770 ) ) ( not ( = ?auto_687768 ?auto_687771 ) ) ( not ( = ?auto_687768 ?auto_687772 ) ) ( not ( = ?auto_687769 ?auto_687770 ) ) ( not ( = ?auto_687769 ?auto_687771 ) ) ( not ( = ?auto_687769 ?auto_687772 ) ) ( not ( = ?auto_687770 ?auto_687771 ) ) ( not ( = ?auto_687770 ?auto_687772 ) ) ( not ( = ?auto_687771 ?auto_687772 ) ) ( ON ?auto_687770 ?auto_687771 ) ( ON ?auto_687769 ?auto_687770 ) ( CLEAR ?auto_687767 ) ( ON ?auto_687768 ?auto_687769 ) ( CLEAR ?auto_687768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_687766 ?auto_687767 ?auto_687768 )
      ( MAKE-6PILE ?auto_687766 ?auto_687767 ?auto_687768 ?auto_687769 ?auto_687770 ?auto_687771 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_687792 - BLOCK
      ?auto_687793 - BLOCK
      ?auto_687794 - BLOCK
      ?auto_687795 - BLOCK
      ?auto_687796 - BLOCK
      ?auto_687797 - BLOCK
    )
    :vars
    (
      ?auto_687798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687797 ?auto_687798 ) ( ON-TABLE ?auto_687792 ) ( not ( = ?auto_687792 ?auto_687793 ) ) ( not ( = ?auto_687792 ?auto_687794 ) ) ( not ( = ?auto_687792 ?auto_687795 ) ) ( not ( = ?auto_687792 ?auto_687796 ) ) ( not ( = ?auto_687792 ?auto_687797 ) ) ( not ( = ?auto_687792 ?auto_687798 ) ) ( not ( = ?auto_687793 ?auto_687794 ) ) ( not ( = ?auto_687793 ?auto_687795 ) ) ( not ( = ?auto_687793 ?auto_687796 ) ) ( not ( = ?auto_687793 ?auto_687797 ) ) ( not ( = ?auto_687793 ?auto_687798 ) ) ( not ( = ?auto_687794 ?auto_687795 ) ) ( not ( = ?auto_687794 ?auto_687796 ) ) ( not ( = ?auto_687794 ?auto_687797 ) ) ( not ( = ?auto_687794 ?auto_687798 ) ) ( not ( = ?auto_687795 ?auto_687796 ) ) ( not ( = ?auto_687795 ?auto_687797 ) ) ( not ( = ?auto_687795 ?auto_687798 ) ) ( not ( = ?auto_687796 ?auto_687797 ) ) ( not ( = ?auto_687796 ?auto_687798 ) ) ( not ( = ?auto_687797 ?auto_687798 ) ) ( ON ?auto_687796 ?auto_687797 ) ( ON ?auto_687795 ?auto_687796 ) ( ON ?auto_687794 ?auto_687795 ) ( CLEAR ?auto_687792 ) ( ON ?auto_687793 ?auto_687794 ) ( CLEAR ?auto_687793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_687792 ?auto_687793 )
      ( MAKE-6PILE ?auto_687792 ?auto_687793 ?auto_687794 ?auto_687795 ?auto_687796 ?auto_687797 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_687818 - BLOCK
      ?auto_687819 - BLOCK
      ?auto_687820 - BLOCK
      ?auto_687821 - BLOCK
      ?auto_687822 - BLOCK
      ?auto_687823 - BLOCK
    )
    :vars
    (
      ?auto_687824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687823 ?auto_687824 ) ( not ( = ?auto_687818 ?auto_687819 ) ) ( not ( = ?auto_687818 ?auto_687820 ) ) ( not ( = ?auto_687818 ?auto_687821 ) ) ( not ( = ?auto_687818 ?auto_687822 ) ) ( not ( = ?auto_687818 ?auto_687823 ) ) ( not ( = ?auto_687818 ?auto_687824 ) ) ( not ( = ?auto_687819 ?auto_687820 ) ) ( not ( = ?auto_687819 ?auto_687821 ) ) ( not ( = ?auto_687819 ?auto_687822 ) ) ( not ( = ?auto_687819 ?auto_687823 ) ) ( not ( = ?auto_687819 ?auto_687824 ) ) ( not ( = ?auto_687820 ?auto_687821 ) ) ( not ( = ?auto_687820 ?auto_687822 ) ) ( not ( = ?auto_687820 ?auto_687823 ) ) ( not ( = ?auto_687820 ?auto_687824 ) ) ( not ( = ?auto_687821 ?auto_687822 ) ) ( not ( = ?auto_687821 ?auto_687823 ) ) ( not ( = ?auto_687821 ?auto_687824 ) ) ( not ( = ?auto_687822 ?auto_687823 ) ) ( not ( = ?auto_687822 ?auto_687824 ) ) ( not ( = ?auto_687823 ?auto_687824 ) ) ( ON ?auto_687822 ?auto_687823 ) ( ON ?auto_687821 ?auto_687822 ) ( ON ?auto_687820 ?auto_687821 ) ( ON ?auto_687819 ?auto_687820 ) ( ON ?auto_687818 ?auto_687819 ) ( CLEAR ?auto_687818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_687818 )
      ( MAKE-6PILE ?auto_687818 ?auto_687819 ?auto_687820 ?auto_687821 ?auto_687822 ?auto_687823 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_687845 - BLOCK
      ?auto_687846 - BLOCK
      ?auto_687847 - BLOCK
      ?auto_687848 - BLOCK
      ?auto_687849 - BLOCK
      ?auto_687850 - BLOCK
      ?auto_687851 - BLOCK
    )
    :vars
    (
      ?auto_687852 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_687850 ) ( ON ?auto_687851 ?auto_687852 ) ( CLEAR ?auto_687851 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_687845 ) ( ON ?auto_687846 ?auto_687845 ) ( ON ?auto_687847 ?auto_687846 ) ( ON ?auto_687848 ?auto_687847 ) ( ON ?auto_687849 ?auto_687848 ) ( ON ?auto_687850 ?auto_687849 ) ( not ( = ?auto_687845 ?auto_687846 ) ) ( not ( = ?auto_687845 ?auto_687847 ) ) ( not ( = ?auto_687845 ?auto_687848 ) ) ( not ( = ?auto_687845 ?auto_687849 ) ) ( not ( = ?auto_687845 ?auto_687850 ) ) ( not ( = ?auto_687845 ?auto_687851 ) ) ( not ( = ?auto_687845 ?auto_687852 ) ) ( not ( = ?auto_687846 ?auto_687847 ) ) ( not ( = ?auto_687846 ?auto_687848 ) ) ( not ( = ?auto_687846 ?auto_687849 ) ) ( not ( = ?auto_687846 ?auto_687850 ) ) ( not ( = ?auto_687846 ?auto_687851 ) ) ( not ( = ?auto_687846 ?auto_687852 ) ) ( not ( = ?auto_687847 ?auto_687848 ) ) ( not ( = ?auto_687847 ?auto_687849 ) ) ( not ( = ?auto_687847 ?auto_687850 ) ) ( not ( = ?auto_687847 ?auto_687851 ) ) ( not ( = ?auto_687847 ?auto_687852 ) ) ( not ( = ?auto_687848 ?auto_687849 ) ) ( not ( = ?auto_687848 ?auto_687850 ) ) ( not ( = ?auto_687848 ?auto_687851 ) ) ( not ( = ?auto_687848 ?auto_687852 ) ) ( not ( = ?auto_687849 ?auto_687850 ) ) ( not ( = ?auto_687849 ?auto_687851 ) ) ( not ( = ?auto_687849 ?auto_687852 ) ) ( not ( = ?auto_687850 ?auto_687851 ) ) ( not ( = ?auto_687850 ?auto_687852 ) ) ( not ( = ?auto_687851 ?auto_687852 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_687851 ?auto_687852 )
      ( !STACK ?auto_687851 ?auto_687850 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_687875 - BLOCK
      ?auto_687876 - BLOCK
      ?auto_687877 - BLOCK
      ?auto_687878 - BLOCK
      ?auto_687879 - BLOCK
      ?auto_687880 - BLOCK
      ?auto_687881 - BLOCK
    )
    :vars
    (
      ?auto_687882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687881 ?auto_687882 ) ( ON-TABLE ?auto_687875 ) ( ON ?auto_687876 ?auto_687875 ) ( ON ?auto_687877 ?auto_687876 ) ( ON ?auto_687878 ?auto_687877 ) ( ON ?auto_687879 ?auto_687878 ) ( not ( = ?auto_687875 ?auto_687876 ) ) ( not ( = ?auto_687875 ?auto_687877 ) ) ( not ( = ?auto_687875 ?auto_687878 ) ) ( not ( = ?auto_687875 ?auto_687879 ) ) ( not ( = ?auto_687875 ?auto_687880 ) ) ( not ( = ?auto_687875 ?auto_687881 ) ) ( not ( = ?auto_687875 ?auto_687882 ) ) ( not ( = ?auto_687876 ?auto_687877 ) ) ( not ( = ?auto_687876 ?auto_687878 ) ) ( not ( = ?auto_687876 ?auto_687879 ) ) ( not ( = ?auto_687876 ?auto_687880 ) ) ( not ( = ?auto_687876 ?auto_687881 ) ) ( not ( = ?auto_687876 ?auto_687882 ) ) ( not ( = ?auto_687877 ?auto_687878 ) ) ( not ( = ?auto_687877 ?auto_687879 ) ) ( not ( = ?auto_687877 ?auto_687880 ) ) ( not ( = ?auto_687877 ?auto_687881 ) ) ( not ( = ?auto_687877 ?auto_687882 ) ) ( not ( = ?auto_687878 ?auto_687879 ) ) ( not ( = ?auto_687878 ?auto_687880 ) ) ( not ( = ?auto_687878 ?auto_687881 ) ) ( not ( = ?auto_687878 ?auto_687882 ) ) ( not ( = ?auto_687879 ?auto_687880 ) ) ( not ( = ?auto_687879 ?auto_687881 ) ) ( not ( = ?auto_687879 ?auto_687882 ) ) ( not ( = ?auto_687880 ?auto_687881 ) ) ( not ( = ?auto_687880 ?auto_687882 ) ) ( not ( = ?auto_687881 ?auto_687882 ) ) ( CLEAR ?auto_687879 ) ( ON ?auto_687880 ?auto_687881 ) ( CLEAR ?auto_687880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_687875 ?auto_687876 ?auto_687877 ?auto_687878 ?auto_687879 ?auto_687880 )
      ( MAKE-7PILE ?auto_687875 ?auto_687876 ?auto_687877 ?auto_687878 ?auto_687879 ?auto_687880 ?auto_687881 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_687905 - BLOCK
      ?auto_687906 - BLOCK
      ?auto_687907 - BLOCK
      ?auto_687908 - BLOCK
      ?auto_687909 - BLOCK
      ?auto_687910 - BLOCK
      ?auto_687911 - BLOCK
    )
    :vars
    (
      ?auto_687912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687911 ?auto_687912 ) ( ON-TABLE ?auto_687905 ) ( ON ?auto_687906 ?auto_687905 ) ( ON ?auto_687907 ?auto_687906 ) ( ON ?auto_687908 ?auto_687907 ) ( not ( = ?auto_687905 ?auto_687906 ) ) ( not ( = ?auto_687905 ?auto_687907 ) ) ( not ( = ?auto_687905 ?auto_687908 ) ) ( not ( = ?auto_687905 ?auto_687909 ) ) ( not ( = ?auto_687905 ?auto_687910 ) ) ( not ( = ?auto_687905 ?auto_687911 ) ) ( not ( = ?auto_687905 ?auto_687912 ) ) ( not ( = ?auto_687906 ?auto_687907 ) ) ( not ( = ?auto_687906 ?auto_687908 ) ) ( not ( = ?auto_687906 ?auto_687909 ) ) ( not ( = ?auto_687906 ?auto_687910 ) ) ( not ( = ?auto_687906 ?auto_687911 ) ) ( not ( = ?auto_687906 ?auto_687912 ) ) ( not ( = ?auto_687907 ?auto_687908 ) ) ( not ( = ?auto_687907 ?auto_687909 ) ) ( not ( = ?auto_687907 ?auto_687910 ) ) ( not ( = ?auto_687907 ?auto_687911 ) ) ( not ( = ?auto_687907 ?auto_687912 ) ) ( not ( = ?auto_687908 ?auto_687909 ) ) ( not ( = ?auto_687908 ?auto_687910 ) ) ( not ( = ?auto_687908 ?auto_687911 ) ) ( not ( = ?auto_687908 ?auto_687912 ) ) ( not ( = ?auto_687909 ?auto_687910 ) ) ( not ( = ?auto_687909 ?auto_687911 ) ) ( not ( = ?auto_687909 ?auto_687912 ) ) ( not ( = ?auto_687910 ?auto_687911 ) ) ( not ( = ?auto_687910 ?auto_687912 ) ) ( not ( = ?auto_687911 ?auto_687912 ) ) ( ON ?auto_687910 ?auto_687911 ) ( CLEAR ?auto_687908 ) ( ON ?auto_687909 ?auto_687910 ) ( CLEAR ?auto_687909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_687905 ?auto_687906 ?auto_687907 ?auto_687908 ?auto_687909 )
      ( MAKE-7PILE ?auto_687905 ?auto_687906 ?auto_687907 ?auto_687908 ?auto_687909 ?auto_687910 ?auto_687911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_687935 - BLOCK
      ?auto_687936 - BLOCK
      ?auto_687937 - BLOCK
      ?auto_687938 - BLOCK
      ?auto_687939 - BLOCK
      ?auto_687940 - BLOCK
      ?auto_687941 - BLOCK
    )
    :vars
    (
      ?auto_687942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687941 ?auto_687942 ) ( ON-TABLE ?auto_687935 ) ( ON ?auto_687936 ?auto_687935 ) ( ON ?auto_687937 ?auto_687936 ) ( not ( = ?auto_687935 ?auto_687936 ) ) ( not ( = ?auto_687935 ?auto_687937 ) ) ( not ( = ?auto_687935 ?auto_687938 ) ) ( not ( = ?auto_687935 ?auto_687939 ) ) ( not ( = ?auto_687935 ?auto_687940 ) ) ( not ( = ?auto_687935 ?auto_687941 ) ) ( not ( = ?auto_687935 ?auto_687942 ) ) ( not ( = ?auto_687936 ?auto_687937 ) ) ( not ( = ?auto_687936 ?auto_687938 ) ) ( not ( = ?auto_687936 ?auto_687939 ) ) ( not ( = ?auto_687936 ?auto_687940 ) ) ( not ( = ?auto_687936 ?auto_687941 ) ) ( not ( = ?auto_687936 ?auto_687942 ) ) ( not ( = ?auto_687937 ?auto_687938 ) ) ( not ( = ?auto_687937 ?auto_687939 ) ) ( not ( = ?auto_687937 ?auto_687940 ) ) ( not ( = ?auto_687937 ?auto_687941 ) ) ( not ( = ?auto_687937 ?auto_687942 ) ) ( not ( = ?auto_687938 ?auto_687939 ) ) ( not ( = ?auto_687938 ?auto_687940 ) ) ( not ( = ?auto_687938 ?auto_687941 ) ) ( not ( = ?auto_687938 ?auto_687942 ) ) ( not ( = ?auto_687939 ?auto_687940 ) ) ( not ( = ?auto_687939 ?auto_687941 ) ) ( not ( = ?auto_687939 ?auto_687942 ) ) ( not ( = ?auto_687940 ?auto_687941 ) ) ( not ( = ?auto_687940 ?auto_687942 ) ) ( not ( = ?auto_687941 ?auto_687942 ) ) ( ON ?auto_687940 ?auto_687941 ) ( ON ?auto_687939 ?auto_687940 ) ( CLEAR ?auto_687937 ) ( ON ?auto_687938 ?auto_687939 ) ( CLEAR ?auto_687938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_687935 ?auto_687936 ?auto_687937 ?auto_687938 )
      ( MAKE-7PILE ?auto_687935 ?auto_687936 ?auto_687937 ?auto_687938 ?auto_687939 ?auto_687940 ?auto_687941 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_687965 - BLOCK
      ?auto_687966 - BLOCK
      ?auto_687967 - BLOCK
      ?auto_687968 - BLOCK
      ?auto_687969 - BLOCK
      ?auto_687970 - BLOCK
      ?auto_687971 - BLOCK
    )
    :vars
    (
      ?auto_687972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_687971 ?auto_687972 ) ( ON-TABLE ?auto_687965 ) ( ON ?auto_687966 ?auto_687965 ) ( not ( = ?auto_687965 ?auto_687966 ) ) ( not ( = ?auto_687965 ?auto_687967 ) ) ( not ( = ?auto_687965 ?auto_687968 ) ) ( not ( = ?auto_687965 ?auto_687969 ) ) ( not ( = ?auto_687965 ?auto_687970 ) ) ( not ( = ?auto_687965 ?auto_687971 ) ) ( not ( = ?auto_687965 ?auto_687972 ) ) ( not ( = ?auto_687966 ?auto_687967 ) ) ( not ( = ?auto_687966 ?auto_687968 ) ) ( not ( = ?auto_687966 ?auto_687969 ) ) ( not ( = ?auto_687966 ?auto_687970 ) ) ( not ( = ?auto_687966 ?auto_687971 ) ) ( not ( = ?auto_687966 ?auto_687972 ) ) ( not ( = ?auto_687967 ?auto_687968 ) ) ( not ( = ?auto_687967 ?auto_687969 ) ) ( not ( = ?auto_687967 ?auto_687970 ) ) ( not ( = ?auto_687967 ?auto_687971 ) ) ( not ( = ?auto_687967 ?auto_687972 ) ) ( not ( = ?auto_687968 ?auto_687969 ) ) ( not ( = ?auto_687968 ?auto_687970 ) ) ( not ( = ?auto_687968 ?auto_687971 ) ) ( not ( = ?auto_687968 ?auto_687972 ) ) ( not ( = ?auto_687969 ?auto_687970 ) ) ( not ( = ?auto_687969 ?auto_687971 ) ) ( not ( = ?auto_687969 ?auto_687972 ) ) ( not ( = ?auto_687970 ?auto_687971 ) ) ( not ( = ?auto_687970 ?auto_687972 ) ) ( not ( = ?auto_687971 ?auto_687972 ) ) ( ON ?auto_687970 ?auto_687971 ) ( ON ?auto_687969 ?auto_687970 ) ( ON ?auto_687968 ?auto_687969 ) ( CLEAR ?auto_687966 ) ( ON ?auto_687967 ?auto_687968 ) ( CLEAR ?auto_687967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_687965 ?auto_687966 ?auto_687967 )
      ( MAKE-7PILE ?auto_687965 ?auto_687966 ?auto_687967 ?auto_687968 ?auto_687969 ?auto_687970 ?auto_687971 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_687995 - BLOCK
      ?auto_687996 - BLOCK
      ?auto_687997 - BLOCK
      ?auto_687998 - BLOCK
      ?auto_687999 - BLOCK
      ?auto_688000 - BLOCK
      ?auto_688001 - BLOCK
    )
    :vars
    (
      ?auto_688002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688001 ?auto_688002 ) ( ON-TABLE ?auto_687995 ) ( not ( = ?auto_687995 ?auto_687996 ) ) ( not ( = ?auto_687995 ?auto_687997 ) ) ( not ( = ?auto_687995 ?auto_687998 ) ) ( not ( = ?auto_687995 ?auto_687999 ) ) ( not ( = ?auto_687995 ?auto_688000 ) ) ( not ( = ?auto_687995 ?auto_688001 ) ) ( not ( = ?auto_687995 ?auto_688002 ) ) ( not ( = ?auto_687996 ?auto_687997 ) ) ( not ( = ?auto_687996 ?auto_687998 ) ) ( not ( = ?auto_687996 ?auto_687999 ) ) ( not ( = ?auto_687996 ?auto_688000 ) ) ( not ( = ?auto_687996 ?auto_688001 ) ) ( not ( = ?auto_687996 ?auto_688002 ) ) ( not ( = ?auto_687997 ?auto_687998 ) ) ( not ( = ?auto_687997 ?auto_687999 ) ) ( not ( = ?auto_687997 ?auto_688000 ) ) ( not ( = ?auto_687997 ?auto_688001 ) ) ( not ( = ?auto_687997 ?auto_688002 ) ) ( not ( = ?auto_687998 ?auto_687999 ) ) ( not ( = ?auto_687998 ?auto_688000 ) ) ( not ( = ?auto_687998 ?auto_688001 ) ) ( not ( = ?auto_687998 ?auto_688002 ) ) ( not ( = ?auto_687999 ?auto_688000 ) ) ( not ( = ?auto_687999 ?auto_688001 ) ) ( not ( = ?auto_687999 ?auto_688002 ) ) ( not ( = ?auto_688000 ?auto_688001 ) ) ( not ( = ?auto_688000 ?auto_688002 ) ) ( not ( = ?auto_688001 ?auto_688002 ) ) ( ON ?auto_688000 ?auto_688001 ) ( ON ?auto_687999 ?auto_688000 ) ( ON ?auto_687998 ?auto_687999 ) ( ON ?auto_687997 ?auto_687998 ) ( CLEAR ?auto_687995 ) ( ON ?auto_687996 ?auto_687997 ) ( CLEAR ?auto_687996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_687995 ?auto_687996 )
      ( MAKE-7PILE ?auto_687995 ?auto_687996 ?auto_687997 ?auto_687998 ?auto_687999 ?auto_688000 ?auto_688001 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_688025 - BLOCK
      ?auto_688026 - BLOCK
      ?auto_688027 - BLOCK
      ?auto_688028 - BLOCK
      ?auto_688029 - BLOCK
      ?auto_688030 - BLOCK
      ?auto_688031 - BLOCK
    )
    :vars
    (
      ?auto_688032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688031 ?auto_688032 ) ( not ( = ?auto_688025 ?auto_688026 ) ) ( not ( = ?auto_688025 ?auto_688027 ) ) ( not ( = ?auto_688025 ?auto_688028 ) ) ( not ( = ?auto_688025 ?auto_688029 ) ) ( not ( = ?auto_688025 ?auto_688030 ) ) ( not ( = ?auto_688025 ?auto_688031 ) ) ( not ( = ?auto_688025 ?auto_688032 ) ) ( not ( = ?auto_688026 ?auto_688027 ) ) ( not ( = ?auto_688026 ?auto_688028 ) ) ( not ( = ?auto_688026 ?auto_688029 ) ) ( not ( = ?auto_688026 ?auto_688030 ) ) ( not ( = ?auto_688026 ?auto_688031 ) ) ( not ( = ?auto_688026 ?auto_688032 ) ) ( not ( = ?auto_688027 ?auto_688028 ) ) ( not ( = ?auto_688027 ?auto_688029 ) ) ( not ( = ?auto_688027 ?auto_688030 ) ) ( not ( = ?auto_688027 ?auto_688031 ) ) ( not ( = ?auto_688027 ?auto_688032 ) ) ( not ( = ?auto_688028 ?auto_688029 ) ) ( not ( = ?auto_688028 ?auto_688030 ) ) ( not ( = ?auto_688028 ?auto_688031 ) ) ( not ( = ?auto_688028 ?auto_688032 ) ) ( not ( = ?auto_688029 ?auto_688030 ) ) ( not ( = ?auto_688029 ?auto_688031 ) ) ( not ( = ?auto_688029 ?auto_688032 ) ) ( not ( = ?auto_688030 ?auto_688031 ) ) ( not ( = ?auto_688030 ?auto_688032 ) ) ( not ( = ?auto_688031 ?auto_688032 ) ) ( ON ?auto_688030 ?auto_688031 ) ( ON ?auto_688029 ?auto_688030 ) ( ON ?auto_688028 ?auto_688029 ) ( ON ?auto_688027 ?auto_688028 ) ( ON ?auto_688026 ?auto_688027 ) ( ON ?auto_688025 ?auto_688026 ) ( CLEAR ?auto_688025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_688025 )
      ( MAKE-7PILE ?auto_688025 ?auto_688026 ?auto_688027 ?auto_688028 ?auto_688029 ?auto_688030 ?auto_688031 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_688056 - BLOCK
      ?auto_688057 - BLOCK
      ?auto_688058 - BLOCK
      ?auto_688059 - BLOCK
      ?auto_688060 - BLOCK
      ?auto_688061 - BLOCK
      ?auto_688062 - BLOCK
      ?auto_688063 - BLOCK
    )
    :vars
    (
      ?auto_688064 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_688062 ) ( ON ?auto_688063 ?auto_688064 ) ( CLEAR ?auto_688063 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_688056 ) ( ON ?auto_688057 ?auto_688056 ) ( ON ?auto_688058 ?auto_688057 ) ( ON ?auto_688059 ?auto_688058 ) ( ON ?auto_688060 ?auto_688059 ) ( ON ?auto_688061 ?auto_688060 ) ( ON ?auto_688062 ?auto_688061 ) ( not ( = ?auto_688056 ?auto_688057 ) ) ( not ( = ?auto_688056 ?auto_688058 ) ) ( not ( = ?auto_688056 ?auto_688059 ) ) ( not ( = ?auto_688056 ?auto_688060 ) ) ( not ( = ?auto_688056 ?auto_688061 ) ) ( not ( = ?auto_688056 ?auto_688062 ) ) ( not ( = ?auto_688056 ?auto_688063 ) ) ( not ( = ?auto_688056 ?auto_688064 ) ) ( not ( = ?auto_688057 ?auto_688058 ) ) ( not ( = ?auto_688057 ?auto_688059 ) ) ( not ( = ?auto_688057 ?auto_688060 ) ) ( not ( = ?auto_688057 ?auto_688061 ) ) ( not ( = ?auto_688057 ?auto_688062 ) ) ( not ( = ?auto_688057 ?auto_688063 ) ) ( not ( = ?auto_688057 ?auto_688064 ) ) ( not ( = ?auto_688058 ?auto_688059 ) ) ( not ( = ?auto_688058 ?auto_688060 ) ) ( not ( = ?auto_688058 ?auto_688061 ) ) ( not ( = ?auto_688058 ?auto_688062 ) ) ( not ( = ?auto_688058 ?auto_688063 ) ) ( not ( = ?auto_688058 ?auto_688064 ) ) ( not ( = ?auto_688059 ?auto_688060 ) ) ( not ( = ?auto_688059 ?auto_688061 ) ) ( not ( = ?auto_688059 ?auto_688062 ) ) ( not ( = ?auto_688059 ?auto_688063 ) ) ( not ( = ?auto_688059 ?auto_688064 ) ) ( not ( = ?auto_688060 ?auto_688061 ) ) ( not ( = ?auto_688060 ?auto_688062 ) ) ( not ( = ?auto_688060 ?auto_688063 ) ) ( not ( = ?auto_688060 ?auto_688064 ) ) ( not ( = ?auto_688061 ?auto_688062 ) ) ( not ( = ?auto_688061 ?auto_688063 ) ) ( not ( = ?auto_688061 ?auto_688064 ) ) ( not ( = ?auto_688062 ?auto_688063 ) ) ( not ( = ?auto_688062 ?auto_688064 ) ) ( not ( = ?auto_688063 ?auto_688064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_688063 ?auto_688064 )
      ( !STACK ?auto_688063 ?auto_688062 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_688090 - BLOCK
      ?auto_688091 - BLOCK
      ?auto_688092 - BLOCK
      ?auto_688093 - BLOCK
      ?auto_688094 - BLOCK
      ?auto_688095 - BLOCK
      ?auto_688096 - BLOCK
      ?auto_688097 - BLOCK
    )
    :vars
    (
      ?auto_688098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688097 ?auto_688098 ) ( ON-TABLE ?auto_688090 ) ( ON ?auto_688091 ?auto_688090 ) ( ON ?auto_688092 ?auto_688091 ) ( ON ?auto_688093 ?auto_688092 ) ( ON ?auto_688094 ?auto_688093 ) ( ON ?auto_688095 ?auto_688094 ) ( not ( = ?auto_688090 ?auto_688091 ) ) ( not ( = ?auto_688090 ?auto_688092 ) ) ( not ( = ?auto_688090 ?auto_688093 ) ) ( not ( = ?auto_688090 ?auto_688094 ) ) ( not ( = ?auto_688090 ?auto_688095 ) ) ( not ( = ?auto_688090 ?auto_688096 ) ) ( not ( = ?auto_688090 ?auto_688097 ) ) ( not ( = ?auto_688090 ?auto_688098 ) ) ( not ( = ?auto_688091 ?auto_688092 ) ) ( not ( = ?auto_688091 ?auto_688093 ) ) ( not ( = ?auto_688091 ?auto_688094 ) ) ( not ( = ?auto_688091 ?auto_688095 ) ) ( not ( = ?auto_688091 ?auto_688096 ) ) ( not ( = ?auto_688091 ?auto_688097 ) ) ( not ( = ?auto_688091 ?auto_688098 ) ) ( not ( = ?auto_688092 ?auto_688093 ) ) ( not ( = ?auto_688092 ?auto_688094 ) ) ( not ( = ?auto_688092 ?auto_688095 ) ) ( not ( = ?auto_688092 ?auto_688096 ) ) ( not ( = ?auto_688092 ?auto_688097 ) ) ( not ( = ?auto_688092 ?auto_688098 ) ) ( not ( = ?auto_688093 ?auto_688094 ) ) ( not ( = ?auto_688093 ?auto_688095 ) ) ( not ( = ?auto_688093 ?auto_688096 ) ) ( not ( = ?auto_688093 ?auto_688097 ) ) ( not ( = ?auto_688093 ?auto_688098 ) ) ( not ( = ?auto_688094 ?auto_688095 ) ) ( not ( = ?auto_688094 ?auto_688096 ) ) ( not ( = ?auto_688094 ?auto_688097 ) ) ( not ( = ?auto_688094 ?auto_688098 ) ) ( not ( = ?auto_688095 ?auto_688096 ) ) ( not ( = ?auto_688095 ?auto_688097 ) ) ( not ( = ?auto_688095 ?auto_688098 ) ) ( not ( = ?auto_688096 ?auto_688097 ) ) ( not ( = ?auto_688096 ?auto_688098 ) ) ( not ( = ?auto_688097 ?auto_688098 ) ) ( CLEAR ?auto_688095 ) ( ON ?auto_688096 ?auto_688097 ) ( CLEAR ?auto_688096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_688090 ?auto_688091 ?auto_688092 ?auto_688093 ?auto_688094 ?auto_688095 ?auto_688096 )
      ( MAKE-8PILE ?auto_688090 ?auto_688091 ?auto_688092 ?auto_688093 ?auto_688094 ?auto_688095 ?auto_688096 ?auto_688097 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_688124 - BLOCK
      ?auto_688125 - BLOCK
      ?auto_688126 - BLOCK
      ?auto_688127 - BLOCK
      ?auto_688128 - BLOCK
      ?auto_688129 - BLOCK
      ?auto_688130 - BLOCK
      ?auto_688131 - BLOCK
    )
    :vars
    (
      ?auto_688132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688131 ?auto_688132 ) ( ON-TABLE ?auto_688124 ) ( ON ?auto_688125 ?auto_688124 ) ( ON ?auto_688126 ?auto_688125 ) ( ON ?auto_688127 ?auto_688126 ) ( ON ?auto_688128 ?auto_688127 ) ( not ( = ?auto_688124 ?auto_688125 ) ) ( not ( = ?auto_688124 ?auto_688126 ) ) ( not ( = ?auto_688124 ?auto_688127 ) ) ( not ( = ?auto_688124 ?auto_688128 ) ) ( not ( = ?auto_688124 ?auto_688129 ) ) ( not ( = ?auto_688124 ?auto_688130 ) ) ( not ( = ?auto_688124 ?auto_688131 ) ) ( not ( = ?auto_688124 ?auto_688132 ) ) ( not ( = ?auto_688125 ?auto_688126 ) ) ( not ( = ?auto_688125 ?auto_688127 ) ) ( not ( = ?auto_688125 ?auto_688128 ) ) ( not ( = ?auto_688125 ?auto_688129 ) ) ( not ( = ?auto_688125 ?auto_688130 ) ) ( not ( = ?auto_688125 ?auto_688131 ) ) ( not ( = ?auto_688125 ?auto_688132 ) ) ( not ( = ?auto_688126 ?auto_688127 ) ) ( not ( = ?auto_688126 ?auto_688128 ) ) ( not ( = ?auto_688126 ?auto_688129 ) ) ( not ( = ?auto_688126 ?auto_688130 ) ) ( not ( = ?auto_688126 ?auto_688131 ) ) ( not ( = ?auto_688126 ?auto_688132 ) ) ( not ( = ?auto_688127 ?auto_688128 ) ) ( not ( = ?auto_688127 ?auto_688129 ) ) ( not ( = ?auto_688127 ?auto_688130 ) ) ( not ( = ?auto_688127 ?auto_688131 ) ) ( not ( = ?auto_688127 ?auto_688132 ) ) ( not ( = ?auto_688128 ?auto_688129 ) ) ( not ( = ?auto_688128 ?auto_688130 ) ) ( not ( = ?auto_688128 ?auto_688131 ) ) ( not ( = ?auto_688128 ?auto_688132 ) ) ( not ( = ?auto_688129 ?auto_688130 ) ) ( not ( = ?auto_688129 ?auto_688131 ) ) ( not ( = ?auto_688129 ?auto_688132 ) ) ( not ( = ?auto_688130 ?auto_688131 ) ) ( not ( = ?auto_688130 ?auto_688132 ) ) ( not ( = ?auto_688131 ?auto_688132 ) ) ( ON ?auto_688130 ?auto_688131 ) ( CLEAR ?auto_688128 ) ( ON ?auto_688129 ?auto_688130 ) ( CLEAR ?auto_688129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_688124 ?auto_688125 ?auto_688126 ?auto_688127 ?auto_688128 ?auto_688129 )
      ( MAKE-8PILE ?auto_688124 ?auto_688125 ?auto_688126 ?auto_688127 ?auto_688128 ?auto_688129 ?auto_688130 ?auto_688131 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_688158 - BLOCK
      ?auto_688159 - BLOCK
      ?auto_688160 - BLOCK
      ?auto_688161 - BLOCK
      ?auto_688162 - BLOCK
      ?auto_688163 - BLOCK
      ?auto_688164 - BLOCK
      ?auto_688165 - BLOCK
    )
    :vars
    (
      ?auto_688166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688165 ?auto_688166 ) ( ON-TABLE ?auto_688158 ) ( ON ?auto_688159 ?auto_688158 ) ( ON ?auto_688160 ?auto_688159 ) ( ON ?auto_688161 ?auto_688160 ) ( not ( = ?auto_688158 ?auto_688159 ) ) ( not ( = ?auto_688158 ?auto_688160 ) ) ( not ( = ?auto_688158 ?auto_688161 ) ) ( not ( = ?auto_688158 ?auto_688162 ) ) ( not ( = ?auto_688158 ?auto_688163 ) ) ( not ( = ?auto_688158 ?auto_688164 ) ) ( not ( = ?auto_688158 ?auto_688165 ) ) ( not ( = ?auto_688158 ?auto_688166 ) ) ( not ( = ?auto_688159 ?auto_688160 ) ) ( not ( = ?auto_688159 ?auto_688161 ) ) ( not ( = ?auto_688159 ?auto_688162 ) ) ( not ( = ?auto_688159 ?auto_688163 ) ) ( not ( = ?auto_688159 ?auto_688164 ) ) ( not ( = ?auto_688159 ?auto_688165 ) ) ( not ( = ?auto_688159 ?auto_688166 ) ) ( not ( = ?auto_688160 ?auto_688161 ) ) ( not ( = ?auto_688160 ?auto_688162 ) ) ( not ( = ?auto_688160 ?auto_688163 ) ) ( not ( = ?auto_688160 ?auto_688164 ) ) ( not ( = ?auto_688160 ?auto_688165 ) ) ( not ( = ?auto_688160 ?auto_688166 ) ) ( not ( = ?auto_688161 ?auto_688162 ) ) ( not ( = ?auto_688161 ?auto_688163 ) ) ( not ( = ?auto_688161 ?auto_688164 ) ) ( not ( = ?auto_688161 ?auto_688165 ) ) ( not ( = ?auto_688161 ?auto_688166 ) ) ( not ( = ?auto_688162 ?auto_688163 ) ) ( not ( = ?auto_688162 ?auto_688164 ) ) ( not ( = ?auto_688162 ?auto_688165 ) ) ( not ( = ?auto_688162 ?auto_688166 ) ) ( not ( = ?auto_688163 ?auto_688164 ) ) ( not ( = ?auto_688163 ?auto_688165 ) ) ( not ( = ?auto_688163 ?auto_688166 ) ) ( not ( = ?auto_688164 ?auto_688165 ) ) ( not ( = ?auto_688164 ?auto_688166 ) ) ( not ( = ?auto_688165 ?auto_688166 ) ) ( ON ?auto_688164 ?auto_688165 ) ( ON ?auto_688163 ?auto_688164 ) ( CLEAR ?auto_688161 ) ( ON ?auto_688162 ?auto_688163 ) ( CLEAR ?auto_688162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_688158 ?auto_688159 ?auto_688160 ?auto_688161 ?auto_688162 )
      ( MAKE-8PILE ?auto_688158 ?auto_688159 ?auto_688160 ?auto_688161 ?auto_688162 ?auto_688163 ?auto_688164 ?auto_688165 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_688192 - BLOCK
      ?auto_688193 - BLOCK
      ?auto_688194 - BLOCK
      ?auto_688195 - BLOCK
      ?auto_688196 - BLOCK
      ?auto_688197 - BLOCK
      ?auto_688198 - BLOCK
      ?auto_688199 - BLOCK
    )
    :vars
    (
      ?auto_688200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688199 ?auto_688200 ) ( ON-TABLE ?auto_688192 ) ( ON ?auto_688193 ?auto_688192 ) ( ON ?auto_688194 ?auto_688193 ) ( not ( = ?auto_688192 ?auto_688193 ) ) ( not ( = ?auto_688192 ?auto_688194 ) ) ( not ( = ?auto_688192 ?auto_688195 ) ) ( not ( = ?auto_688192 ?auto_688196 ) ) ( not ( = ?auto_688192 ?auto_688197 ) ) ( not ( = ?auto_688192 ?auto_688198 ) ) ( not ( = ?auto_688192 ?auto_688199 ) ) ( not ( = ?auto_688192 ?auto_688200 ) ) ( not ( = ?auto_688193 ?auto_688194 ) ) ( not ( = ?auto_688193 ?auto_688195 ) ) ( not ( = ?auto_688193 ?auto_688196 ) ) ( not ( = ?auto_688193 ?auto_688197 ) ) ( not ( = ?auto_688193 ?auto_688198 ) ) ( not ( = ?auto_688193 ?auto_688199 ) ) ( not ( = ?auto_688193 ?auto_688200 ) ) ( not ( = ?auto_688194 ?auto_688195 ) ) ( not ( = ?auto_688194 ?auto_688196 ) ) ( not ( = ?auto_688194 ?auto_688197 ) ) ( not ( = ?auto_688194 ?auto_688198 ) ) ( not ( = ?auto_688194 ?auto_688199 ) ) ( not ( = ?auto_688194 ?auto_688200 ) ) ( not ( = ?auto_688195 ?auto_688196 ) ) ( not ( = ?auto_688195 ?auto_688197 ) ) ( not ( = ?auto_688195 ?auto_688198 ) ) ( not ( = ?auto_688195 ?auto_688199 ) ) ( not ( = ?auto_688195 ?auto_688200 ) ) ( not ( = ?auto_688196 ?auto_688197 ) ) ( not ( = ?auto_688196 ?auto_688198 ) ) ( not ( = ?auto_688196 ?auto_688199 ) ) ( not ( = ?auto_688196 ?auto_688200 ) ) ( not ( = ?auto_688197 ?auto_688198 ) ) ( not ( = ?auto_688197 ?auto_688199 ) ) ( not ( = ?auto_688197 ?auto_688200 ) ) ( not ( = ?auto_688198 ?auto_688199 ) ) ( not ( = ?auto_688198 ?auto_688200 ) ) ( not ( = ?auto_688199 ?auto_688200 ) ) ( ON ?auto_688198 ?auto_688199 ) ( ON ?auto_688197 ?auto_688198 ) ( ON ?auto_688196 ?auto_688197 ) ( CLEAR ?auto_688194 ) ( ON ?auto_688195 ?auto_688196 ) ( CLEAR ?auto_688195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_688192 ?auto_688193 ?auto_688194 ?auto_688195 )
      ( MAKE-8PILE ?auto_688192 ?auto_688193 ?auto_688194 ?auto_688195 ?auto_688196 ?auto_688197 ?auto_688198 ?auto_688199 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_688226 - BLOCK
      ?auto_688227 - BLOCK
      ?auto_688228 - BLOCK
      ?auto_688229 - BLOCK
      ?auto_688230 - BLOCK
      ?auto_688231 - BLOCK
      ?auto_688232 - BLOCK
      ?auto_688233 - BLOCK
    )
    :vars
    (
      ?auto_688234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688233 ?auto_688234 ) ( ON-TABLE ?auto_688226 ) ( ON ?auto_688227 ?auto_688226 ) ( not ( = ?auto_688226 ?auto_688227 ) ) ( not ( = ?auto_688226 ?auto_688228 ) ) ( not ( = ?auto_688226 ?auto_688229 ) ) ( not ( = ?auto_688226 ?auto_688230 ) ) ( not ( = ?auto_688226 ?auto_688231 ) ) ( not ( = ?auto_688226 ?auto_688232 ) ) ( not ( = ?auto_688226 ?auto_688233 ) ) ( not ( = ?auto_688226 ?auto_688234 ) ) ( not ( = ?auto_688227 ?auto_688228 ) ) ( not ( = ?auto_688227 ?auto_688229 ) ) ( not ( = ?auto_688227 ?auto_688230 ) ) ( not ( = ?auto_688227 ?auto_688231 ) ) ( not ( = ?auto_688227 ?auto_688232 ) ) ( not ( = ?auto_688227 ?auto_688233 ) ) ( not ( = ?auto_688227 ?auto_688234 ) ) ( not ( = ?auto_688228 ?auto_688229 ) ) ( not ( = ?auto_688228 ?auto_688230 ) ) ( not ( = ?auto_688228 ?auto_688231 ) ) ( not ( = ?auto_688228 ?auto_688232 ) ) ( not ( = ?auto_688228 ?auto_688233 ) ) ( not ( = ?auto_688228 ?auto_688234 ) ) ( not ( = ?auto_688229 ?auto_688230 ) ) ( not ( = ?auto_688229 ?auto_688231 ) ) ( not ( = ?auto_688229 ?auto_688232 ) ) ( not ( = ?auto_688229 ?auto_688233 ) ) ( not ( = ?auto_688229 ?auto_688234 ) ) ( not ( = ?auto_688230 ?auto_688231 ) ) ( not ( = ?auto_688230 ?auto_688232 ) ) ( not ( = ?auto_688230 ?auto_688233 ) ) ( not ( = ?auto_688230 ?auto_688234 ) ) ( not ( = ?auto_688231 ?auto_688232 ) ) ( not ( = ?auto_688231 ?auto_688233 ) ) ( not ( = ?auto_688231 ?auto_688234 ) ) ( not ( = ?auto_688232 ?auto_688233 ) ) ( not ( = ?auto_688232 ?auto_688234 ) ) ( not ( = ?auto_688233 ?auto_688234 ) ) ( ON ?auto_688232 ?auto_688233 ) ( ON ?auto_688231 ?auto_688232 ) ( ON ?auto_688230 ?auto_688231 ) ( ON ?auto_688229 ?auto_688230 ) ( CLEAR ?auto_688227 ) ( ON ?auto_688228 ?auto_688229 ) ( CLEAR ?auto_688228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_688226 ?auto_688227 ?auto_688228 )
      ( MAKE-8PILE ?auto_688226 ?auto_688227 ?auto_688228 ?auto_688229 ?auto_688230 ?auto_688231 ?auto_688232 ?auto_688233 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_688260 - BLOCK
      ?auto_688261 - BLOCK
      ?auto_688262 - BLOCK
      ?auto_688263 - BLOCK
      ?auto_688264 - BLOCK
      ?auto_688265 - BLOCK
      ?auto_688266 - BLOCK
      ?auto_688267 - BLOCK
    )
    :vars
    (
      ?auto_688268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688267 ?auto_688268 ) ( ON-TABLE ?auto_688260 ) ( not ( = ?auto_688260 ?auto_688261 ) ) ( not ( = ?auto_688260 ?auto_688262 ) ) ( not ( = ?auto_688260 ?auto_688263 ) ) ( not ( = ?auto_688260 ?auto_688264 ) ) ( not ( = ?auto_688260 ?auto_688265 ) ) ( not ( = ?auto_688260 ?auto_688266 ) ) ( not ( = ?auto_688260 ?auto_688267 ) ) ( not ( = ?auto_688260 ?auto_688268 ) ) ( not ( = ?auto_688261 ?auto_688262 ) ) ( not ( = ?auto_688261 ?auto_688263 ) ) ( not ( = ?auto_688261 ?auto_688264 ) ) ( not ( = ?auto_688261 ?auto_688265 ) ) ( not ( = ?auto_688261 ?auto_688266 ) ) ( not ( = ?auto_688261 ?auto_688267 ) ) ( not ( = ?auto_688261 ?auto_688268 ) ) ( not ( = ?auto_688262 ?auto_688263 ) ) ( not ( = ?auto_688262 ?auto_688264 ) ) ( not ( = ?auto_688262 ?auto_688265 ) ) ( not ( = ?auto_688262 ?auto_688266 ) ) ( not ( = ?auto_688262 ?auto_688267 ) ) ( not ( = ?auto_688262 ?auto_688268 ) ) ( not ( = ?auto_688263 ?auto_688264 ) ) ( not ( = ?auto_688263 ?auto_688265 ) ) ( not ( = ?auto_688263 ?auto_688266 ) ) ( not ( = ?auto_688263 ?auto_688267 ) ) ( not ( = ?auto_688263 ?auto_688268 ) ) ( not ( = ?auto_688264 ?auto_688265 ) ) ( not ( = ?auto_688264 ?auto_688266 ) ) ( not ( = ?auto_688264 ?auto_688267 ) ) ( not ( = ?auto_688264 ?auto_688268 ) ) ( not ( = ?auto_688265 ?auto_688266 ) ) ( not ( = ?auto_688265 ?auto_688267 ) ) ( not ( = ?auto_688265 ?auto_688268 ) ) ( not ( = ?auto_688266 ?auto_688267 ) ) ( not ( = ?auto_688266 ?auto_688268 ) ) ( not ( = ?auto_688267 ?auto_688268 ) ) ( ON ?auto_688266 ?auto_688267 ) ( ON ?auto_688265 ?auto_688266 ) ( ON ?auto_688264 ?auto_688265 ) ( ON ?auto_688263 ?auto_688264 ) ( ON ?auto_688262 ?auto_688263 ) ( CLEAR ?auto_688260 ) ( ON ?auto_688261 ?auto_688262 ) ( CLEAR ?auto_688261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_688260 ?auto_688261 )
      ( MAKE-8PILE ?auto_688260 ?auto_688261 ?auto_688262 ?auto_688263 ?auto_688264 ?auto_688265 ?auto_688266 ?auto_688267 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_688294 - BLOCK
      ?auto_688295 - BLOCK
      ?auto_688296 - BLOCK
      ?auto_688297 - BLOCK
      ?auto_688298 - BLOCK
      ?auto_688299 - BLOCK
      ?auto_688300 - BLOCK
      ?auto_688301 - BLOCK
    )
    :vars
    (
      ?auto_688302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688301 ?auto_688302 ) ( not ( = ?auto_688294 ?auto_688295 ) ) ( not ( = ?auto_688294 ?auto_688296 ) ) ( not ( = ?auto_688294 ?auto_688297 ) ) ( not ( = ?auto_688294 ?auto_688298 ) ) ( not ( = ?auto_688294 ?auto_688299 ) ) ( not ( = ?auto_688294 ?auto_688300 ) ) ( not ( = ?auto_688294 ?auto_688301 ) ) ( not ( = ?auto_688294 ?auto_688302 ) ) ( not ( = ?auto_688295 ?auto_688296 ) ) ( not ( = ?auto_688295 ?auto_688297 ) ) ( not ( = ?auto_688295 ?auto_688298 ) ) ( not ( = ?auto_688295 ?auto_688299 ) ) ( not ( = ?auto_688295 ?auto_688300 ) ) ( not ( = ?auto_688295 ?auto_688301 ) ) ( not ( = ?auto_688295 ?auto_688302 ) ) ( not ( = ?auto_688296 ?auto_688297 ) ) ( not ( = ?auto_688296 ?auto_688298 ) ) ( not ( = ?auto_688296 ?auto_688299 ) ) ( not ( = ?auto_688296 ?auto_688300 ) ) ( not ( = ?auto_688296 ?auto_688301 ) ) ( not ( = ?auto_688296 ?auto_688302 ) ) ( not ( = ?auto_688297 ?auto_688298 ) ) ( not ( = ?auto_688297 ?auto_688299 ) ) ( not ( = ?auto_688297 ?auto_688300 ) ) ( not ( = ?auto_688297 ?auto_688301 ) ) ( not ( = ?auto_688297 ?auto_688302 ) ) ( not ( = ?auto_688298 ?auto_688299 ) ) ( not ( = ?auto_688298 ?auto_688300 ) ) ( not ( = ?auto_688298 ?auto_688301 ) ) ( not ( = ?auto_688298 ?auto_688302 ) ) ( not ( = ?auto_688299 ?auto_688300 ) ) ( not ( = ?auto_688299 ?auto_688301 ) ) ( not ( = ?auto_688299 ?auto_688302 ) ) ( not ( = ?auto_688300 ?auto_688301 ) ) ( not ( = ?auto_688300 ?auto_688302 ) ) ( not ( = ?auto_688301 ?auto_688302 ) ) ( ON ?auto_688300 ?auto_688301 ) ( ON ?auto_688299 ?auto_688300 ) ( ON ?auto_688298 ?auto_688299 ) ( ON ?auto_688297 ?auto_688298 ) ( ON ?auto_688296 ?auto_688297 ) ( ON ?auto_688295 ?auto_688296 ) ( ON ?auto_688294 ?auto_688295 ) ( CLEAR ?auto_688294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_688294 )
      ( MAKE-8PILE ?auto_688294 ?auto_688295 ?auto_688296 ?auto_688297 ?auto_688298 ?auto_688299 ?auto_688300 ?auto_688301 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_688329 - BLOCK
      ?auto_688330 - BLOCK
      ?auto_688331 - BLOCK
      ?auto_688332 - BLOCK
      ?auto_688333 - BLOCK
      ?auto_688334 - BLOCK
      ?auto_688335 - BLOCK
      ?auto_688336 - BLOCK
      ?auto_688337 - BLOCK
    )
    :vars
    (
      ?auto_688338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_688336 ) ( ON ?auto_688337 ?auto_688338 ) ( CLEAR ?auto_688337 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_688329 ) ( ON ?auto_688330 ?auto_688329 ) ( ON ?auto_688331 ?auto_688330 ) ( ON ?auto_688332 ?auto_688331 ) ( ON ?auto_688333 ?auto_688332 ) ( ON ?auto_688334 ?auto_688333 ) ( ON ?auto_688335 ?auto_688334 ) ( ON ?auto_688336 ?auto_688335 ) ( not ( = ?auto_688329 ?auto_688330 ) ) ( not ( = ?auto_688329 ?auto_688331 ) ) ( not ( = ?auto_688329 ?auto_688332 ) ) ( not ( = ?auto_688329 ?auto_688333 ) ) ( not ( = ?auto_688329 ?auto_688334 ) ) ( not ( = ?auto_688329 ?auto_688335 ) ) ( not ( = ?auto_688329 ?auto_688336 ) ) ( not ( = ?auto_688329 ?auto_688337 ) ) ( not ( = ?auto_688329 ?auto_688338 ) ) ( not ( = ?auto_688330 ?auto_688331 ) ) ( not ( = ?auto_688330 ?auto_688332 ) ) ( not ( = ?auto_688330 ?auto_688333 ) ) ( not ( = ?auto_688330 ?auto_688334 ) ) ( not ( = ?auto_688330 ?auto_688335 ) ) ( not ( = ?auto_688330 ?auto_688336 ) ) ( not ( = ?auto_688330 ?auto_688337 ) ) ( not ( = ?auto_688330 ?auto_688338 ) ) ( not ( = ?auto_688331 ?auto_688332 ) ) ( not ( = ?auto_688331 ?auto_688333 ) ) ( not ( = ?auto_688331 ?auto_688334 ) ) ( not ( = ?auto_688331 ?auto_688335 ) ) ( not ( = ?auto_688331 ?auto_688336 ) ) ( not ( = ?auto_688331 ?auto_688337 ) ) ( not ( = ?auto_688331 ?auto_688338 ) ) ( not ( = ?auto_688332 ?auto_688333 ) ) ( not ( = ?auto_688332 ?auto_688334 ) ) ( not ( = ?auto_688332 ?auto_688335 ) ) ( not ( = ?auto_688332 ?auto_688336 ) ) ( not ( = ?auto_688332 ?auto_688337 ) ) ( not ( = ?auto_688332 ?auto_688338 ) ) ( not ( = ?auto_688333 ?auto_688334 ) ) ( not ( = ?auto_688333 ?auto_688335 ) ) ( not ( = ?auto_688333 ?auto_688336 ) ) ( not ( = ?auto_688333 ?auto_688337 ) ) ( not ( = ?auto_688333 ?auto_688338 ) ) ( not ( = ?auto_688334 ?auto_688335 ) ) ( not ( = ?auto_688334 ?auto_688336 ) ) ( not ( = ?auto_688334 ?auto_688337 ) ) ( not ( = ?auto_688334 ?auto_688338 ) ) ( not ( = ?auto_688335 ?auto_688336 ) ) ( not ( = ?auto_688335 ?auto_688337 ) ) ( not ( = ?auto_688335 ?auto_688338 ) ) ( not ( = ?auto_688336 ?auto_688337 ) ) ( not ( = ?auto_688336 ?auto_688338 ) ) ( not ( = ?auto_688337 ?auto_688338 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_688337 ?auto_688338 )
      ( !STACK ?auto_688337 ?auto_688336 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_688367 - BLOCK
      ?auto_688368 - BLOCK
      ?auto_688369 - BLOCK
      ?auto_688370 - BLOCK
      ?auto_688371 - BLOCK
      ?auto_688372 - BLOCK
      ?auto_688373 - BLOCK
      ?auto_688374 - BLOCK
      ?auto_688375 - BLOCK
    )
    :vars
    (
      ?auto_688376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688375 ?auto_688376 ) ( ON-TABLE ?auto_688367 ) ( ON ?auto_688368 ?auto_688367 ) ( ON ?auto_688369 ?auto_688368 ) ( ON ?auto_688370 ?auto_688369 ) ( ON ?auto_688371 ?auto_688370 ) ( ON ?auto_688372 ?auto_688371 ) ( ON ?auto_688373 ?auto_688372 ) ( not ( = ?auto_688367 ?auto_688368 ) ) ( not ( = ?auto_688367 ?auto_688369 ) ) ( not ( = ?auto_688367 ?auto_688370 ) ) ( not ( = ?auto_688367 ?auto_688371 ) ) ( not ( = ?auto_688367 ?auto_688372 ) ) ( not ( = ?auto_688367 ?auto_688373 ) ) ( not ( = ?auto_688367 ?auto_688374 ) ) ( not ( = ?auto_688367 ?auto_688375 ) ) ( not ( = ?auto_688367 ?auto_688376 ) ) ( not ( = ?auto_688368 ?auto_688369 ) ) ( not ( = ?auto_688368 ?auto_688370 ) ) ( not ( = ?auto_688368 ?auto_688371 ) ) ( not ( = ?auto_688368 ?auto_688372 ) ) ( not ( = ?auto_688368 ?auto_688373 ) ) ( not ( = ?auto_688368 ?auto_688374 ) ) ( not ( = ?auto_688368 ?auto_688375 ) ) ( not ( = ?auto_688368 ?auto_688376 ) ) ( not ( = ?auto_688369 ?auto_688370 ) ) ( not ( = ?auto_688369 ?auto_688371 ) ) ( not ( = ?auto_688369 ?auto_688372 ) ) ( not ( = ?auto_688369 ?auto_688373 ) ) ( not ( = ?auto_688369 ?auto_688374 ) ) ( not ( = ?auto_688369 ?auto_688375 ) ) ( not ( = ?auto_688369 ?auto_688376 ) ) ( not ( = ?auto_688370 ?auto_688371 ) ) ( not ( = ?auto_688370 ?auto_688372 ) ) ( not ( = ?auto_688370 ?auto_688373 ) ) ( not ( = ?auto_688370 ?auto_688374 ) ) ( not ( = ?auto_688370 ?auto_688375 ) ) ( not ( = ?auto_688370 ?auto_688376 ) ) ( not ( = ?auto_688371 ?auto_688372 ) ) ( not ( = ?auto_688371 ?auto_688373 ) ) ( not ( = ?auto_688371 ?auto_688374 ) ) ( not ( = ?auto_688371 ?auto_688375 ) ) ( not ( = ?auto_688371 ?auto_688376 ) ) ( not ( = ?auto_688372 ?auto_688373 ) ) ( not ( = ?auto_688372 ?auto_688374 ) ) ( not ( = ?auto_688372 ?auto_688375 ) ) ( not ( = ?auto_688372 ?auto_688376 ) ) ( not ( = ?auto_688373 ?auto_688374 ) ) ( not ( = ?auto_688373 ?auto_688375 ) ) ( not ( = ?auto_688373 ?auto_688376 ) ) ( not ( = ?auto_688374 ?auto_688375 ) ) ( not ( = ?auto_688374 ?auto_688376 ) ) ( not ( = ?auto_688375 ?auto_688376 ) ) ( CLEAR ?auto_688373 ) ( ON ?auto_688374 ?auto_688375 ) ( CLEAR ?auto_688374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_688367 ?auto_688368 ?auto_688369 ?auto_688370 ?auto_688371 ?auto_688372 ?auto_688373 ?auto_688374 )
      ( MAKE-9PILE ?auto_688367 ?auto_688368 ?auto_688369 ?auto_688370 ?auto_688371 ?auto_688372 ?auto_688373 ?auto_688374 ?auto_688375 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_688405 - BLOCK
      ?auto_688406 - BLOCK
      ?auto_688407 - BLOCK
      ?auto_688408 - BLOCK
      ?auto_688409 - BLOCK
      ?auto_688410 - BLOCK
      ?auto_688411 - BLOCK
      ?auto_688412 - BLOCK
      ?auto_688413 - BLOCK
    )
    :vars
    (
      ?auto_688414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688413 ?auto_688414 ) ( ON-TABLE ?auto_688405 ) ( ON ?auto_688406 ?auto_688405 ) ( ON ?auto_688407 ?auto_688406 ) ( ON ?auto_688408 ?auto_688407 ) ( ON ?auto_688409 ?auto_688408 ) ( ON ?auto_688410 ?auto_688409 ) ( not ( = ?auto_688405 ?auto_688406 ) ) ( not ( = ?auto_688405 ?auto_688407 ) ) ( not ( = ?auto_688405 ?auto_688408 ) ) ( not ( = ?auto_688405 ?auto_688409 ) ) ( not ( = ?auto_688405 ?auto_688410 ) ) ( not ( = ?auto_688405 ?auto_688411 ) ) ( not ( = ?auto_688405 ?auto_688412 ) ) ( not ( = ?auto_688405 ?auto_688413 ) ) ( not ( = ?auto_688405 ?auto_688414 ) ) ( not ( = ?auto_688406 ?auto_688407 ) ) ( not ( = ?auto_688406 ?auto_688408 ) ) ( not ( = ?auto_688406 ?auto_688409 ) ) ( not ( = ?auto_688406 ?auto_688410 ) ) ( not ( = ?auto_688406 ?auto_688411 ) ) ( not ( = ?auto_688406 ?auto_688412 ) ) ( not ( = ?auto_688406 ?auto_688413 ) ) ( not ( = ?auto_688406 ?auto_688414 ) ) ( not ( = ?auto_688407 ?auto_688408 ) ) ( not ( = ?auto_688407 ?auto_688409 ) ) ( not ( = ?auto_688407 ?auto_688410 ) ) ( not ( = ?auto_688407 ?auto_688411 ) ) ( not ( = ?auto_688407 ?auto_688412 ) ) ( not ( = ?auto_688407 ?auto_688413 ) ) ( not ( = ?auto_688407 ?auto_688414 ) ) ( not ( = ?auto_688408 ?auto_688409 ) ) ( not ( = ?auto_688408 ?auto_688410 ) ) ( not ( = ?auto_688408 ?auto_688411 ) ) ( not ( = ?auto_688408 ?auto_688412 ) ) ( not ( = ?auto_688408 ?auto_688413 ) ) ( not ( = ?auto_688408 ?auto_688414 ) ) ( not ( = ?auto_688409 ?auto_688410 ) ) ( not ( = ?auto_688409 ?auto_688411 ) ) ( not ( = ?auto_688409 ?auto_688412 ) ) ( not ( = ?auto_688409 ?auto_688413 ) ) ( not ( = ?auto_688409 ?auto_688414 ) ) ( not ( = ?auto_688410 ?auto_688411 ) ) ( not ( = ?auto_688410 ?auto_688412 ) ) ( not ( = ?auto_688410 ?auto_688413 ) ) ( not ( = ?auto_688410 ?auto_688414 ) ) ( not ( = ?auto_688411 ?auto_688412 ) ) ( not ( = ?auto_688411 ?auto_688413 ) ) ( not ( = ?auto_688411 ?auto_688414 ) ) ( not ( = ?auto_688412 ?auto_688413 ) ) ( not ( = ?auto_688412 ?auto_688414 ) ) ( not ( = ?auto_688413 ?auto_688414 ) ) ( ON ?auto_688412 ?auto_688413 ) ( CLEAR ?auto_688410 ) ( ON ?auto_688411 ?auto_688412 ) ( CLEAR ?auto_688411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_688405 ?auto_688406 ?auto_688407 ?auto_688408 ?auto_688409 ?auto_688410 ?auto_688411 )
      ( MAKE-9PILE ?auto_688405 ?auto_688406 ?auto_688407 ?auto_688408 ?auto_688409 ?auto_688410 ?auto_688411 ?auto_688412 ?auto_688413 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_688443 - BLOCK
      ?auto_688444 - BLOCK
      ?auto_688445 - BLOCK
      ?auto_688446 - BLOCK
      ?auto_688447 - BLOCK
      ?auto_688448 - BLOCK
      ?auto_688449 - BLOCK
      ?auto_688450 - BLOCK
      ?auto_688451 - BLOCK
    )
    :vars
    (
      ?auto_688452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688451 ?auto_688452 ) ( ON-TABLE ?auto_688443 ) ( ON ?auto_688444 ?auto_688443 ) ( ON ?auto_688445 ?auto_688444 ) ( ON ?auto_688446 ?auto_688445 ) ( ON ?auto_688447 ?auto_688446 ) ( not ( = ?auto_688443 ?auto_688444 ) ) ( not ( = ?auto_688443 ?auto_688445 ) ) ( not ( = ?auto_688443 ?auto_688446 ) ) ( not ( = ?auto_688443 ?auto_688447 ) ) ( not ( = ?auto_688443 ?auto_688448 ) ) ( not ( = ?auto_688443 ?auto_688449 ) ) ( not ( = ?auto_688443 ?auto_688450 ) ) ( not ( = ?auto_688443 ?auto_688451 ) ) ( not ( = ?auto_688443 ?auto_688452 ) ) ( not ( = ?auto_688444 ?auto_688445 ) ) ( not ( = ?auto_688444 ?auto_688446 ) ) ( not ( = ?auto_688444 ?auto_688447 ) ) ( not ( = ?auto_688444 ?auto_688448 ) ) ( not ( = ?auto_688444 ?auto_688449 ) ) ( not ( = ?auto_688444 ?auto_688450 ) ) ( not ( = ?auto_688444 ?auto_688451 ) ) ( not ( = ?auto_688444 ?auto_688452 ) ) ( not ( = ?auto_688445 ?auto_688446 ) ) ( not ( = ?auto_688445 ?auto_688447 ) ) ( not ( = ?auto_688445 ?auto_688448 ) ) ( not ( = ?auto_688445 ?auto_688449 ) ) ( not ( = ?auto_688445 ?auto_688450 ) ) ( not ( = ?auto_688445 ?auto_688451 ) ) ( not ( = ?auto_688445 ?auto_688452 ) ) ( not ( = ?auto_688446 ?auto_688447 ) ) ( not ( = ?auto_688446 ?auto_688448 ) ) ( not ( = ?auto_688446 ?auto_688449 ) ) ( not ( = ?auto_688446 ?auto_688450 ) ) ( not ( = ?auto_688446 ?auto_688451 ) ) ( not ( = ?auto_688446 ?auto_688452 ) ) ( not ( = ?auto_688447 ?auto_688448 ) ) ( not ( = ?auto_688447 ?auto_688449 ) ) ( not ( = ?auto_688447 ?auto_688450 ) ) ( not ( = ?auto_688447 ?auto_688451 ) ) ( not ( = ?auto_688447 ?auto_688452 ) ) ( not ( = ?auto_688448 ?auto_688449 ) ) ( not ( = ?auto_688448 ?auto_688450 ) ) ( not ( = ?auto_688448 ?auto_688451 ) ) ( not ( = ?auto_688448 ?auto_688452 ) ) ( not ( = ?auto_688449 ?auto_688450 ) ) ( not ( = ?auto_688449 ?auto_688451 ) ) ( not ( = ?auto_688449 ?auto_688452 ) ) ( not ( = ?auto_688450 ?auto_688451 ) ) ( not ( = ?auto_688450 ?auto_688452 ) ) ( not ( = ?auto_688451 ?auto_688452 ) ) ( ON ?auto_688450 ?auto_688451 ) ( ON ?auto_688449 ?auto_688450 ) ( CLEAR ?auto_688447 ) ( ON ?auto_688448 ?auto_688449 ) ( CLEAR ?auto_688448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_688443 ?auto_688444 ?auto_688445 ?auto_688446 ?auto_688447 ?auto_688448 )
      ( MAKE-9PILE ?auto_688443 ?auto_688444 ?auto_688445 ?auto_688446 ?auto_688447 ?auto_688448 ?auto_688449 ?auto_688450 ?auto_688451 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_688481 - BLOCK
      ?auto_688482 - BLOCK
      ?auto_688483 - BLOCK
      ?auto_688484 - BLOCK
      ?auto_688485 - BLOCK
      ?auto_688486 - BLOCK
      ?auto_688487 - BLOCK
      ?auto_688488 - BLOCK
      ?auto_688489 - BLOCK
    )
    :vars
    (
      ?auto_688490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688489 ?auto_688490 ) ( ON-TABLE ?auto_688481 ) ( ON ?auto_688482 ?auto_688481 ) ( ON ?auto_688483 ?auto_688482 ) ( ON ?auto_688484 ?auto_688483 ) ( not ( = ?auto_688481 ?auto_688482 ) ) ( not ( = ?auto_688481 ?auto_688483 ) ) ( not ( = ?auto_688481 ?auto_688484 ) ) ( not ( = ?auto_688481 ?auto_688485 ) ) ( not ( = ?auto_688481 ?auto_688486 ) ) ( not ( = ?auto_688481 ?auto_688487 ) ) ( not ( = ?auto_688481 ?auto_688488 ) ) ( not ( = ?auto_688481 ?auto_688489 ) ) ( not ( = ?auto_688481 ?auto_688490 ) ) ( not ( = ?auto_688482 ?auto_688483 ) ) ( not ( = ?auto_688482 ?auto_688484 ) ) ( not ( = ?auto_688482 ?auto_688485 ) ) ( not ( = ?auto_688482 ?auto_688486 ) ) ( not ( = ?auto_688482 ?auto_688487 ) ) ( not ( = ?auto_688482 ?auto_688488 ) ) ( not ( = ?auto_688482 ?auto_688489 ) ) ( not ( = ?auto_688482 ?auto_688490 ) ) ( not ( = ?auto_688483 ?auto_688484 ) ) ( not ( = ?auto_688483 ?auto_688485 ) ) ( not ( = ?auto_688483 ?auto_688486 ) ) ( not ( = ?auto_688483 ?auto_688487 ) ) ( not ( = ?auto_688483 ?auto_688488 ) ) ( not ( = ?auto_688483 ?auto_688489 ) ) ( not ( = ?auto_688483 ?auto_688490 ) ) ( not ( = ?auto_688484 ?auto_688485 ) ) ( not ( = ?auto_688484 ?auto_688486 ) ) ( not ( = ?auto_688484 ?auto_688487 ) ) ( not ( = ?auto_688484 ?auto_688488 ) ) ( not ( = ?auto_688484 ?auto_688489 ) ) ( not ( = ?auto_688484 ?auto_688490 ) ) ( not ( = ?auto_688485 ?auto_688486 ) ) ( not ( = ?auto_688485 ?auto_688487 ) ) ( not ( = ?auto_688485 ?auto_688488 ) ) ( not ( = ?auto_688485 ?auto_688489 ) ) ( not ( = ?auto_688485 ?auto_688490 ) ) ( not ( = ?auto_688486 ?auto_688487 ) ) ( not ( = ?auto_688486 ?auto_688488 ) ) ( not ( = ?auto_688486 ?auto_688489 ) ) ( not ( = ?auto_688486 ?auto_688490 ) ) ( not ( = ?auto_688487 ?auto_688488 ) ) ( not ( = ?auto_688487 ?auto_688489 ) ) ( not ( = ?auto_688487 ?auto_688490 ) ) ( not ( = ?auto_688488 ?auto_688489 ) ) ( not ( = ?auto_688488 ?auto_688490 ) ) ( not ( = ?auto_688489 ?auto_688490 ) ) ( ON ?auto_688488 ?auto_688489 ) ( ON ?auto_688487 ?auto_688488 ) ( ON ?auto_688486 ?auto_688487 ) ( CLEAR ?auto_688484 ) ( ON ?auto_688485 ?auto_688486 ) ( CLEAR ?auto_688485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_688481 ?auto_688482 ?auto_688483 ?auto_688484 ?auto_688485 )
      ( MAKE-9PILE ?auto_688481 ?auto_688482 ?auto_688483 ?auto_688484 ?auto_688485 ?auto_688486 ?auto_688487 ?auto_688488 ?auto_688489 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_688519 - BLOCK
      ?auto_688520 - BLOCK
      ?auto_688521 - BLOCK
      ?auto_688522 - BLOCK
      ?auto_688523 - BLOCK
      ?auto_688524 - BLOCK
      ?auto_688525 - BLOCK
      ?auto_688526 - BLOCK
      ?auto_688527 - BLOCK
    )
    :vars
    (
      ?auto_688528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688527 ?auto_688528 ) ( ON-TABLE ?auto_688519 ) ( ON ?auto_688520 ?auto_688519 ) ( ON ?auto_688521 ?auto_688520 ) ( not ( = ?auto_688519 ?auto_688520 ) ) ( not ( = ?auto_688519 ?auto_688521 ) ) ( not ( = ?auto_688519 ?auto_688522 ) ) ( not ( = ?auto_688519 ?auto_688523 ) ) ( not ( = ?auto_688519 ?auto_688524 ) ) ( not ( = ?auto_688519 ?auto_688525 ) ) ( not ( = ?auto_688519 ?auto_688526 ) ) ( not ( = ?auto_688519 ?auto_688527 ) ) ( not ( = ?auto_688519 ?auto_688528 ) ) ( not ( = ?auto_688520 ?auto_688521 ) ) ( not ( = ?auto_688520 ?auto_688522 ) ) ( not ( = ?auto_688520 ?auto_688523 ) ) ( not ( = ?auto_688520 ?auto_688524 ) ) ( not ( = ?auto_688520 ?auto_688525 ) ) ( not ( = ?auto_688520 ?auto_688526 ) ) ( not ( = ?auto_688520 ?auto_688527 ) ) ( not ( = ?auto_688520 ?auto_688528 ) ) ( not ( = ?auto_688521 ?auto_688522 ) ) ( not ( = ?auto_688521 ?auto_688523 ) ) ( not ( = ?auto_688521 ?auto_688524 ) ) ( not ( = ?auto_688521 ?auto_688525 ) ) ( not ( = ?auto_688521 ?auto_688526 ) ) ( not ( = ?auto_688521 ?auto_688527 ) ) ( not ( = ?auto_688521 ?auto_688528 ) ) ( not ( = ?auto_688522 ?auto_688523 ) ) ( not ( = ?auto_688522 ?auto_688524 ) ) ( not ( = ?auto_688522 ?auto_688525 ) ) ( not ( = ?auto_688522 ?auto_688526 ) ) ( not ( = ?auto_688522 ?auto_688527 ) ) ( not ( = ?auto_688522 ?auto_688528 ) ) ( not ( = ?auto_688523 ?auto_688524 ) ) ( not ( = ?auto_688523 ?auto_688525 ) ) ( not ( = ?auto_688523 ?auto_688526 ) ) ( not ( = ?auto_688523 ?auto_688527 ) ) ( not ( = ?auto_688523 ?auto_688528 ) ) ( not ( = ?auto_688524 ?auto_688525 ) ) ( not ( = ?auto_688524 ?auto_688526 ) ) ( not ( = ?auto_688524 ?auto_688527 ) ) ( not ( = ?auto_688524 ?auto_688528 ) ) ( not ( = ?auto_688525 ?auto_688526 ) ) ( not ( = ?auto_688525 ?auto_688527 ) ) ( not ( = ?auto_688525 ?auto_688528 ) ) ( not ( = ?auto_688526 ?auto_688527 ) ) ( not ( = ?auto_688526 ?auto_688528 ) ) ( not ( = ?auto_688527 ?auto_688528 ) ) ( ON ?auto_688526 ?auto_688527 ) ( ON ?auto_688525 ?auto_688526 ) ( ON ?auto_688524 ?auto_688525 ) ( ON ?auto_688523 ?auto_688524 ) ( CLEAR ?auto_688521 ) ( ON ?auto_688522 ?auto_688523 ) ( CLEAR ?auto_688522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_688519 ?auto_688520 ?auto_688521 ?auto_688522 )
      ( MAKE-9PILE ?auto_688519 ?auto_688520 ?auto_688521 ?auto_688522 ?auto_688523 ?auto_688524 ?auto_688525 ?auto_688526 ?auto_688527 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_688557 - BLOCK
      ?auto_688558 - BLOCK
      ?auto_688559 - BLOCK
      ?auto_688560 - BLOCK
      ?auto_688561 - BLOCK
      ?auto_688562 - BLOCK
      ?auto_688563 - BLOCK
      ?auto_688564 - BLOCK
      ?auto_688565 - BLOCK
    )
    :vars
    (
      ?auto_688566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688565 ?auto_688566 ) ( ON-TABLE ?auto_688557 ) ( ON ?auto_688558 ?auto_688557 ) ( not ( = ?auto_688557 ?auto_688558 ) ) ( not ( = ?auto_688557 ?auto_688559 ) ) ( not ( = ?auto_688557 ?auto_688560 ) ) ( not ( = ?auto_688557 ?auto_688561 ) ) ( not ( = ?auto_688557 ?auto_688562 ) ) ( not ( = ?auto_688557 ?auto_688563 ) ) ( not ( = ?auto_688557 ?auto_688564 ) ) ( not ( = ?auto_688557 ?auto_688565 ) ) ( not ( = ?auto_688557 ?auto_688566 ) ) ( not ( = ?auto_688558 ?auto_688559 ) ) ( not ( = ?auto_688558 ?auto_688560 ) ) ( not ( = ?auto_688558 ?auto_688561 ) ) ( not ( = ?auto_688558 ?auto_688562 ) ) ( not ( = ?auto_688558 ?auto_688563 ) ) ( not ( = ?auto_688558 ?auto_688564 ) ) ( not ( = ?auto_688558 ?auto_688565 ) ) ( not ( = ?auto_688558 ?auto_688566 ) ) ( not ( = ?auto_688559 ?auto_688560 ) ) ( not ( = ?auto_688559 ?auto_688561 ) ) ( not ( = ?auto_688559 ?auto_688562 ) ) ( not ( = ?auto_688559 ?auto_688563 ) ) ( not ( = ?auto_688559 ?auto_688564 ) ) ( not ( = ?auto_688559 ?auto_688565 ) ) ( not ( = ?auto_688559 ?auto_688566 ) ) ( not ( = ?auto_688560 ?auto_688561 ) ) ( not ( = ?auto_688560 ?auto_688562 ) ) ( not ( = ?auto_688560 ?auto_688563 ) ) ( not ( = ?auto_688560 ?auto_688564 ) ) ( not ( = ?auto_688560 ?auto_688565 ) ) ( not ( = ?auto_688560 ?auto_688566 ) ) ( not ( = ?auto_688561 ?auto_688562 ) ) ( not ( = ?auto_688561 ?auto_688563 ) ) ( not ( = ?auto_688561 ?auto_688564 ) ) ( not ( = ?auto_688561 ?auto_688565 ) ) ( not ( = ?auto_688561 ?auto_688566 ) ) ( not ( = ?auto_688562 ?auto_688563 ) ) ( not ( = ?auto_688562 ?auto_688564 ) ) ( not ( = ?auto_688562 ?auto_688565 ) ) ( not ( = ?auto_688562 ?auto_688566 ) ) ( not ( = ?auto_688563 ?auto_688564 ) ) ( not ( = ?auto_688563 ?auto_688565 ) ) ( not ( = ?auto_688563 ?auto_688566 ) ) ( not ( = ?auto_688564 ?auto_688565 ) ) ( not ( = ?auto_688564 ?auto_688566 ) ) ( not ( = ?auto_688565 ?auto_688566 ) ) ( ON ?auto_688564 ?auto_688565 ) ( ON ?auto_688563 ?auto_688564 ) ( ON ?auto_688562 ?auto_688563 ) ( ON ?auto_688561 ?auto_688562 ) ( ON ?auto_688560 ?auto_688561 ) ( CLEAR ?auto_688558 ) ( ON ?auto_688559 ?auto_688560 ) ( CLEAR ?auto_688559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_688557 ?auto_688558 ?auto_688559 )
      ( MAKE-9PILE ?auto_688557 ?auto_688558 ?auto_688559 ?auto_688560 ?auto_688561 ?auto_688562 ?auto_688563 ?auto_688564 ?auto_688565 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_688595 - BLOCK
      ?auto_688596 - BLOCK
      ?auto_688597 - BLOCK
      ?auto_688598 - BLOCK
      ?auto_688599 - BLOCK
      ?auto_688600 - BLOCK
      ?auto_688601 - BLOCK
      ?auto_688602 - BLOCK
      ?auto_688603 - BLOCK
    )
    :vars
    (
      ?auto_688604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688603 ?auto_688604 ) ( ON-TABLE ?auto_688595 ) ( not ( = ?auto_688595 ?auto_688596 ) ) ( not ( = ?auto_688595 ?auto_688597 ) ) ( not ( = ?auto_688595 ?auto_688598 ) ) ( not ( = ?auto_688595 ?auto_688599 ) ) ( not ( = ?auto_688595 ?auto_688600 ) ) ( not ( = ?auto_688595 ?auto_688601 ) ) ( not ( = ?auto_688595 ?auto_688602 ) ) ( not ( = ?auto_688595 ?auto_688603 ) ) ( not ( = ?auto_688595 ?auto_688604 ) ) ( not ( = ?auto_688596 ?auto_688597 ) ) ( not ( = ?auto_688596 ?auto_688598 ) ) ( not ( = ?auto_688596 ?auto_688599 ) ) ( not ( = ?auto_688596 ?auto_688600 ) ) ( not ( = ?auto_688596 ?auto_688601 ) ) ( not ( = ?auto_688596 ?auto_688602 ) ) ( not ( = ?auto_688596 ?auto_688603 ) ) ( not ( = ?auto_688596 ?auto_688604 ) ) ( not ( = ?auto_688597 ?auto_688598 ) ) ( not ( = ?auto_688597 ?auto_688599 ) ) ( not ( = ?auto_688597 ?auto_688600 ) ) ( not ( = ?auto_688597 ?auto_688601 ) ) ( not ( = ?auto_688597 ?auto_688602 ) ) ( not ( = ?auto_688597 ?auto_688603 ) ) ( not ( = ?auto_688597 ?auto_688604 ) ) ( not ( = ?auto_688598 ?auto_688599 ) ) ( not ( = ?auto_688598 ?auto_688600 ) ) ( not ( = ?auto_688598 ?auto_688601 ) ) ( not ( = ?auto_688598 ?auto_688602 ) ) ( not ( = ?auto_688598 ?auto_688603 ) ) ( not ( = ?auto_688598 ?auto_688604 ) ) ( not ( = ?auto_688599 ?auto_688600 ) ) ( not ( = ?auto_688599 ?auto_688601 ) ) ( not ( = ?auto_688599 ?auto_688602 ) ) ( not ( = ?auto_688599 ?auto_688603 ) ) ( not ( = ?auto_688599 ?auto_688604 ) ) ( not ( = ?auto_688600 ?auto_688601 ) ) ( not ( = ?auto_688600 ?auto_688602 ) ) ( not ( = ?auto_688600 ?auto_688603 ) ) ( not ( = ?auto_688600 ?auto_688604 ) ) ( not ( = ?auto_688601 ?auto_688602 ) ) ( not ( = ?auto_688601 ?auto_688603 ) ) ( not ( = ?auto_688601 ?auto_688604 ) ) ( not ( = ?auto_688602 ?auto_688603 ) ) ( not ( = ?auto_688602 ?auto_688604 ) ) ( not ( = ?auto_688603 ?auto_688604 ) ) ( ON ?auto_688602 ?auto_688603 ) ( ON ?auto_688601 ?auto_688602 ) ( ON ?auto_688600 ?auto_688601 ) ( ON ?auto_688599 ?auto_688600 ) ( ON ?auto_688598 ?auto_688599 ) ( ON ?auto_688597 ?auto_688598 ) ( CLEAR ?auto_688595 ) ( ON ?auto_688596 ?auto_688597 ) ( CLEAR ?auto_688596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_688595 ?auto_688596 )
      ( MAKE-9PILE ?auto_688595 ?auto_688596 ?auto_688597 ?auto_688598 ?auto_688599 ?auto_688600 ?auto_688601 ?auto_688602 ?auto_688603 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_688633 - BLOCK
      ?auto_688634 - BLOCK
      ?auto_688635 - BLOCK
      ?auto_688636 - BLOCK
      ?auto_688637 - BLOCK
      ?auto_688638 - BLOCK
      ?auto_688639 - BLOCK
      ?auto_688640 - BLOCK
      ?auto_688641 - BLOCK
    )
    :vars
    (
      ?auto_688642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688641 ?auto_688642 ) ( not ( = ?auto_688633 ?auto_688634 ) ) ( not ( = ?auto_688633 ?auto_688635 ) ) ( not ( = ?auto_688633 ?auto_688636 ) ) ( not ( = ?auto_688633 ?auto_688637 ) ) ( not ( = ?auto_688633 ?auto_688638 ) ) ( not ( = ?auto_688633 ?auto_688639 ) ) ( not ( = ?auto_688633 ?auto_688640 ) ) ( not ( = ?auto_688633 ?auto_688641 ) ) ( not ( = ?auto_688633 ?auto_688642 ) ) ( not ( = ?auto_688634 ?auto_688635 ) ) ( not ( = ?auto_688634 ?auto_688636 ) ) ( not ( = ?auto_688634 ?auto_688637 ) ) ( not ( = ?auto_688634 ?auto_688638 ) ) ( not ( = ?auto_688634 ?auto_688639 ) ) ( not ( = ?auto_688634 ?auto_688640 ) ) ( not ( = ?auto_688634 ?auto_688641 ) ) ( not ( = ?auto_688634 ?auto_688642 ) ) ( not ( = ?auto_688635 ?auto_688636 ) ) ( not ( = ?auto_688635 ?auto_688637 ) ) ( not ( = ?auto_688635 ?auto_688638 ) ) ( not ( = ?auto_688635 ?auto_688639 ) ) ( not ( = ?auto_688635 ?auto_688640 ) ) ( not ( = ?auto_688635 ?auto_688641 ) ) ( not ( = ?auto_688635 ?auto_688642 ) ) ( not ( = ?auto_688636 ?auto_688637 ) ) ( not ( = ?auto_688636 ?auto_688638 ) ) ( not ( = ?auto_688636 ?auto_688639 ) ) ( not ( = ?auto_688636 ?auto_688640 ) ) ( not ( = ?auto_688636 ?auto_688641 ) ) ( not ( = ?auto_688636 ?auto_688642 ) ) ( not ( = ?auto_688637 ?auto_688638 ) ) ( not ( = ?auto_688637 ?auto_688639 ) ) ( not ( = ?auto_688637 ?auto_688640 ) ) ( not ( = ?auto_688637 ?auto_688641 ) ) ( not ( = ?auto_688637 ?auto_688642 ) ) ( not ( = ?auto_688638 ?auto_688639 ) ) ( not ( = ?auto_688638 ?auto_688640 ) ) ( not ( = ?auto_688638 ?auto_688641 ) ) ( not ( = ?auto_688638 ?auto_688642 ) ) ( not ( = ?auto_688639 ?auto_688640 ) ) ( not ( = ?auto_688639 ?auto_688641 ) ) ( not ( = ?auto_688639 ?auto_688642 ) ) ( not ( = ?auto_688640 ?auto_688641 ) ) ( not ( = ?auto_688640 ?auto_688642 ) ) ( not ( = ?auto_688641 ?auto_688642 ) ) ( ON ?auto_688640 ?auto_688641 ) ( ON ?auto_688639 ?auto_688640 ) ( ON ?auto_688638 ?auto_688639 ) ( ON ?auto_688637 ?auto_688638 ) ( ON ?auto_688636 ?auto_688637 ) ( ON ?auto_688635 ?auto_688636 ) ( ON ?auto_688634 ?auto_688635 ) ( ON ?auto_688633 ?auto_688634 ) ( CLEAR ?auto_688633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_688633 )
      ( MAKE-9PILE ?auto_688633 ?auto_688634 ?auto_688635 ?auto_688636 ?auto_688637 ?auto_688638 ?auto_688639 ?auto_688640 ?auto_688641 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_688672 - BLOCK
      ?auto_688673 - BLOCK
      ?auto_688674 - BLOCK
      ?auto_688675 - BLOCK
      ?auto_688676 - BLOCK
      ?auto_688677 - BLOCK
      ?auto_688678 - BLOCK
      ?auto_688679 - BLOCK
      ?auto_688680 - BLOCK
      ?auto_688681 - BLOCK
    )
    :vars
    (
      ?auto_688682 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_688680 ) ( ON ?auto_688681 ?auto_688682 ) ( CLEAR ?auto_688681 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_688672 ) ( ON ?auto_688673 ?auto_688672 ) ( ON ?auto_688674 ?auto_688673 ) ( ON ?auto_688675 ?auto_688674 ) ( ON ?auto_688676 ?auto_688675 ) ( ON ?auto_688677 ?auto_688676 ) ( ON ?auto_688678 ?auto_688677 ) ( ON ?auto_688679 ?auto_688678 ) ( ON ?auto_688680 ?auto_688679 ) ( not ( = ?auto_688672 ?auto_688673 ) ) ( not ( = ?auto_688672 ?auto_688674 ) ) ( not ( = ?auto_688672 ?auto_688675 ) ) ( not ( = ?auto_688672 ?auto_688676 ) ) ( not ( = ?auto_688672 ?auto_688677 ) ) ( not ( = ?auto_688672 ?auto_688678 ) ) ( not ( = ?auto_688672 ?auto_688679 ) ) ( not ( = ?auto_688672 ?auto_688680 ) ) ( not ( = ?auto_688672 ?auto_688681 ) ) ( not ( = ?auto_688672 ?auto_688682 ) ) ( not ( = ?auto_688673 ?auto_688674 ) ) ( not ( = ?auto_688673 ?auto_688675 ) ) ( not ( = ?auto_688673 ?auto_688676 ) ) ( not ( = ?auto_688673 ?auto_688677 ) ) ( not ( = ?auto_688673 ?auto_688678 ) ) ( not ( = ?auto_688673 ?auto_688679 ) ) ( not ( = ?auto_688673 ?auto_688680 ) ) ( not ( = ?auto_688673 ?auto_688681 ) ) ( not ( = ?auto_688673 ?auto_688682 ) ) ( not ( = ?auto_688674 ?auto_688675 ) ) ( not ( = ?auto_688674 ?auto_688676 ) ) ( not ( = ?auto_688674 ?auto_688677 ) ) ( not ( = ?auto_688674 ?auto_688678 ) ) ( not ( = ?auto_688674 ?auto_688679 ) ) ( not ( = ?auto_688674 ?auto_688680 ) ) ( not ( = ?auto_688674 ?auto_688681 ) ) ( not ( = ?auto_688674 ?auto_688682 ) ) ( not ( = ?auto_688675 ?auto_688676 ) ) ( not ( = ?auto_688675 ?auto_688677 ) ) ( not ( = ?auto_688675 ?auto_688678 ) ) ( not ( = ?auto_688675 ?auto_688679 ) ) ( not ( = ?auto_688675 ?auto_688680 ) ) ( not ( = ?auto_688675 ?auto_688681 ) ) ( not ( = ?auto_688675 ?auto_688682 ) ) ( not ( = ?auto_688676 ?auto_688677 ) ) ( not ( = ?auto_688676 ?auto_688678 ) ) ( not ( = ?auto_688676 ?auto_688679 ) ) ( not ( = ?auto_688676 ?auto_688680 ) ) ( not ( = ?auto_688676 ?auto_688681 ) ) ( not ( = ?auto_688676 ?auto_688682 ) ) ( not ( = ?auto_688677 ?auto_688678 ) ) ( not ( = ?auto_688677 ?auto_688679 ) ) ( not ( = ?auto_688677 ?auto_688680 ) ) ( not ( = ?auto_688677 ?auto_688681 ) ) ( not ( = ?auto_688677 ?auto_688682 ) ) ( not ( = ?auto_688678 ?auto_688679 ) ) ( not ( = ?auto_688678 ?auto_688680 ) ) ( not ( = ?auto_688678 ?auto_688681 ) ) ( not ( = ?auto_688678 ?auto_688682 ) ) ( not ( = ?auto_688679 ?auto_688680 ) ) ( not ( = ?auto_688679 ?auto_688681 ) ) ( not ( = ?auto_688679 ?auto_688682 ) ) ( not ( = ?auto_688680 ?auto_688681 ) ) ( not ( = ?auto_688680 ?auto_688682 ) ) ( not ( = ?auto_688681 ?auto_688682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_688681 ?auto_688682 )
      ( !STACK ?auto_688681 ?auto_688680 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_688714 - BLOCK
      ?auto_688715 - BLOCK
      ?auto_688716 - BLOCK
      ?auto_688717 - BLOCK
      ?auto_688718 - BLOCK
      ?auto_688719 - BLOCK
      ?auto_688720 - BLOCK
      ?auto_688721 - BLOCK
      ?auto_688722 - BLOCK
      ?auto_688723 - BLOCK
    )
    :vars
    (
      ?auto_688724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688723 ?auto_688724 ) ( ON-TABLE ?auto_688714 ) ( ON ?auto_688715 ?auto_688714 ) ( ON ?auto_688716 ?auto_688715 ) ( ON ?auto_688717 ?auto_688716 ) ( ON ?auto_688718 ?auto_688717 ) ( ON ?auto_688719 ?auto_688718 ) ( ON ?auto_688720 ?auto_688719 ) ( ON ?auto_688721 ?auto_688720 ) ( not ( = ?auto_688714 ?auto_688715 ) ) ( not ( = ?auto_688714 ?auto_688716 ) ) ( not ( = ?auto_688714 ?auto_688717 ) ) ( not ( = ?auto_688714 ?auto_688718 ) ) ( not ( = ?auto_688714 ?auto_688719 ) ) ( not ( = ?auto_688714 ?auto_688720 ) ) ( not ( = ?auto_688714 ?auto_688721 ) ) ( not ( = ?auto_688714 ?auto_688722 ) ) ( not ( = ?auto_688714 ?auto_688723 ) ) ( not ( = ?auto_688714 ?auto_688724 ) ) ( not ( = ?auto_688715 ?auto_688716 ) ) ( not ( = ?auto_688715 ?auto_688717 ) ) ( not ( = ?auto_688715 ?auto_688718 ) ) ( not ( = ?auto_688715 ?auto_688719 ) ) ( not ( = ?auto_688715 ?auto_688720 ) ) ( not ( = ?auto_688715 ?auto_688721 ) ) ( not ( = ?auto_688715 ?auto_688722 ) ) ( not ( = ?auto_688715 ?auto_688723 ) ) ( not ( = ?auto_688715 ?auto_688724 ) ) ( not ( = ?auto_688716 ?auto_688717 ) ) ( not ( = ?auto_688716 ?auto_688718 ) ) ( not ( = ?auto_688716 ?auto_688719 ) ) ( not ( = ?auto_688716 ?auto_688720 ) ) ( not ( = ?auto_688716 ?auto_688721 ) ) ( not ( = ?auto_688716 ?auto_688722 ) ) ( not ( = ?auto_688716 ?auto_688723 ) ) ( not ( = ?auto_688716 ?auto_688724 ) ) ( not ( = ?auto_688717 ?auto_688718 ) ) ( not ( = ?auto_688717 ?auto_688719 ) ) ( not ( = ?auto_688717 ?auto_688720 ) ) ( not ( = ?auto_688717 ?auto_688721 ) ) ( not ( = ?auto_688717 ?auto_688722 ) ) ( not ( = ?auto_688717 ?auto_688723 ) ) ( not ( = ?auto_688717 ?auto_688724 ) ) ( not ( = ?auto_688718 ?auto_688719 ) ) ( not ( = ?auto_688718 ?auto_688720 ) ) ( not ( = ?auto_688718 ?auto_688721 ) ) ( not ( = ?auto_688718 ?auto_688722 ) ) ( not ( = ?auto_688718 ?auto_688723 ) ) ( not ( = ?auto_688718 ?auto_688724 ) ) ( not ( = ?auto_688719 ?auto_688720 ) ) ( not ( = ?auto_688719 ?auto_688721 ) ) ( not ( = ?auto_688719 ?auto_688722 ) ) ( not ( = ?auto_688719 ?auto_688723 ) ) ( not ( = ?auto_688719 ?auto_688724 ) ) ( not ( = ?auto_688720 ?auto_688721 ) ) ( not ( = ?auto_688720 ?auto_688722 ) ) ( not ( = ?auto_688720 ?auto_688723 ) ) ( not ( = ?auto_688720 ?auto_688724 ) ) ( not ( = ?auto_688721 ?auto_688722 ) ) ( not ( = ?auto_688721 ?auto_688723 ) ) ( not ( = ?auto_688721 ?auto_688724 ) ) ( not ( = ?auto_688722 ?auto_688723 ) ) ( not ( = ?auto_688722 ?auto_688724 ) ) ( not ( = ?auto_688723 ?auto_688724 ) ) ( CLEAR ?auto_688721 ) ( ON ?auto_688722 ?auto_688723 ) ( CLEAR ?auto_688722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_688714 ?auto_688715 ?auto_688716 ?auto_688717 ?auto_688718 ?auto_688719 ?auto_688720 ?auto_688721 ?auto_688722 )
      ( MAKE-10PILE ?auto_688714 ?auto_688715 ?auto_688716 ?auto_688717 ?auto_688718 ?auto_688719 ?auto_688720 ?auto_688721 ?auto_688722 ?auto_688723 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_688756 - BLOCK
      ?auto_688757 - BLOCK
      ?auto_688758 - BLOCK
      ?auto_688759 - BLOCK
      ?auto_688760 - BLOCK
      ?auto_688761 - BLOCK
      ?auto_688762 - BLOCK
      ?auto_688763 - BLOCK
      ?auto_688764 - BLOCK
      ?auto_688765 - BLOCK
    )
    :vars
    (
      ?auto_688766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688765 ?auto_688766 ) ( ON-TABLE ?auto_688756 ) ( ON ?auto_688757 ?auto_688756 ) ( ON ?auto_688758 ?auto_688757 ) ( ON ?auto_688759 ?auto_688758 ) ( ON ?auto_688760 ?auto_688759 ) ( ON ?auto_688761 ?auto_688760 ) ( ON ?auto_688762 ?auto_688761 ) ( not ( = ?auto_688756 ?auto_688757 ) ) ( not ( = ?auto_688756 ?auto_688758 ) ) ( not ( = ?auto_688756 ?auto_688759 ) ) ( not ( = ?auto_688756 ?auto_688760 ) ) ( not ( = ?auto_688756 ?auto_688761 ) ) ( not ( = ?auto_688756 ?auto_688762 ) ) ( not ( = ?auto_688756 ?auto_688763 ) ) ( not ( = ?auto_688756 ?auto_688764 ) ) ( not ( = ?auto_688756 ?auto_688765 ) ) ( not ( = ?auto_688756 ?auto_688766 ) ) ( not ( = ?auto_688757 ?auto_688758 ) ) ( not ( = ?auto_688757 ?auto_688759 ) ) ( not ( = ?auto_688757 ?auto_688760 ) ) ( not ( = ?auto_688757 ?auto_688761 ) ) ( not ( = ?auto_688757 ?auto_688762 ) ) ( not ( = ?auto_688757 ?auto_688763 ) ) ( not ( = ?auto_688757 ?auto_688764 ) ) ( not ( = ?auto_688757 ?auto_688765 ) ) ( not ( = ?auto_688757 ?auto_688766 ) ) ( not ( = ?auto_688758 ?auto_688759 ) ) ( not ( = ?auto_688758 ?auto_688760 ) ) ( not ( = ?auto_688758 ?auto_688761 ) ) ( not ( = ?auto_688758 ?auto_688762 ) ) ( not ( = ?auto_688758 ?auto_688763 ) ) ( not ( = ?auto_688758 ?auto_688764 ) ) ( not ( = ?auto_688758 ?auto_688765 ) ) ( not ( = ?auto_688758 ?auto_688766 ) ) ( not ( = ?auto_688759 ?auto_688760 ) ) ( not ( = ?auto_688759 ?auto_688761 ) ) ( not ( = ?auto_688759 ?auto_688762 ) ) ( not ( = ?auto_688759 ?auto_688763 ) ) ( not ( = ?auto_688759 ?auto_688764 ) ) ( not ( = ?auto_688759 ?auto_688765 ) ) ( not ( = ?auto_688759 ?auto_688766 ) ) ( not ( = ?auto_688760 ?auto_688761 ) ) ( not ( = ?auto_688760 ?auto_688762 ) ) ( not ( = ?auto_688760 ?auto_688763 ) ) ( not ( = ?auto_688760 ?auto_688764 ) ) ( not ( = ?auto_688760 ?auto_688765 ) ) ( not ( = ?auto_688760 ?auto_688766 ) ) ( not ( = ?auto_688761 ?auto_688762 ) ) ( not ( = ?auto_688761 ?auto_688763 ) ) ( not ( = ?auto_688761 ?auto_688764 ) ) ( not ( = ?auto_688761 ?auto_688765 ) ) ( not ( = ?auto_688761 ?auto_688766 ) ) ( not ( = ?auto_688762 ?auto_688763 ) ) ( not ( = ?auto_688762 ?auto_688764 ) ) ( not ( = ?auto_688762 ?auto_688765 ) ) ( not ( = ?auto_688762 ?auto_688766 ) ) ( not ( = ?auto_688763 ?auto_688764 ) ) ( not ( = ?auto_688763 ?auto_688765 ) ) ( not ( = ?auto_688763 ?auto_688766 ) ) ( not ( = ?auto_688764 ?auto_688765 ) ) ( not ( = ?auto_688764 ?auto_688766 ) ) ( not ( = ?auto_688765 ?auto_688766 ) ) ( ON ?auto_688764 ?auto_688765 ) ( CLEAR ?auto_688762 ) ( ON ?auto_688763 ?auto_688764 ) ( CLEAR ?auto_688763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_688756 ?auto_688757 ?auto_688758 ?auto_688759 ?auto_688760 ?auto_688761 ?auto_688762 ?auto_688763 )
      ( MAKE-10PILE ?auto_688756 ?auto_688757 ?auto_688758 ?auto_688759 ?auto_688760 ?auto_688761 ?auto_688762 ?auto_688763 ?auto_688764 ?auto_688765 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_688798 - BLOCK
      ?auto_688799 - BLOCK
      ?auto_688800 - BLOCK
      ?auto_688801 - BLOCK
      ?auto_688802 - BLOCK
      ?auto_688803 - BLOCK
      ?auto_688804 - BLOCK
      ?auto_688805 - BLOCK
      ?auto_688806 - BLOCK
      ?auto_688807 - BLOCK
    )
    :vars
    (
      ?auto_688808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688807 ?auto_688808 ) ( ON-TABLE ?auto_688798 ) ( ON ?auto_688799 ?auto_688798 ) ( ON ?auto_688800 ?auto_688799 ) ( ON ?auto_688801 ?auto_688800 ) ( ON ?auto_688802 ?auto_688801 ) ( ON ?auto_688803 ?auto_688802 ) ( not ( = ?auto_688798 ?auto_688799 ) ) ( not ( = ?auto_688798 ?auto_688800 ) ) ( not ( = ?auto_688798 ?auto_688801 ) ) ( not ( = ?auto_688798 ?auto_688802 ) ) ( not ( = ?auto_688798 ?auto_688803 ) ) ( not ( = ?auto_688798 ?auto_688804 ) ) ( not ( = ?auto_688798 ?auto_688805 ) ) ( not ( = ?auto_688798 ?auto_688806 ) ) ( not ( = ?auto_688798 ?auto_688807 ) ) ( not ( = ?auto_688798 ?auto_688808 ) ) ( not ( = ?auto_688799 ?auto_688800 ) ) ( not ( = ?auto_688799 ?auto_688801 ) ) ( not ( = ?auto_688799 ?auto_688802 ) ) ( not ( = ?auto_688799 ?auto_688803 ) ) ( not ( = ?auto_688799 ?auto_688804 ) ) ( not ( = ?auto_688799 ?auto_688805 ) ) ( not ( = ?auto_688799 ?auto_688806 ) ) ( not ( = ?auto_688799 ?auto_688807 ) ) ( not ( = ?auto_688799 ?auto_688808 ) ) ( not ( = ?auto_688800 ?auto_688801 ) ) ( not ( = ?auto_688800 ?auto_688802 ) ) ( not ( = ?auto_688800 ?auto_688803 ) ) ( not ( = ?auto_688800 ?auto_688804 ) ) ( not ( = ?auto_688800 ?auto_688805 ) ) ( not ( = ?auto_688800 ?auto_688806 ) ) ( not ( = ?auto_688800 ?auto_688807 ) ) ( not ( = ?auto_688800 ?auto_688808 ) ) ( not ( = ?auto_688801 ?auto_688802 ) ) ( not ( = ?auto_688801 ?auto_688803 ) ) ( not ( = ?auto_688801 ?auto_688804 ) ) ( not ( = ?auto_688801 ?auto_688805 ) ) ( not ( = ?auto_688801 ?auto_688806 ) ) ( not ( = ?auto_688801 ?auto_688807 ) ) ( not ( = ?auto_688801 ?auto_688808 ) ) ( not ( = ?auto_688802 ?auto_688803 ) ) ( not ( = ?auto_688802 ?auto_688804 ) ) ( not ( = ?auto_688802 ?auto_688805 ) ) ( not ( = ?auto_688802 ?auto_688806 ) ) ( not ( = ?auto_688802 ?auto_688807 ) ) ( not ( = ?auto_688802 ?auto_688808 ) ) ( not ( = ?auto_688803 ?auto_688804 ) ) ( not ( = ?auto_688803 ?auto_688805 ) ) ( not ( = ?auto_688803 ?auto_688806 ) ) ( not ( = ?auto_688803 ?auto_688807 ) ) ( not ( = ?auto_688803 ?auto_688808 ) ) ( not ( = ?auto_688804 ?auto_688805 ) ) ( not ( = ?auto_688804 ?auto_688806 ) ) ( not ( = ?auto_688804 ?auto_688807 ) ) ( not ( = ?auto_688804 ?auto_688808 ) ) ( not ( = ?auto_688805 ?auto_688806 ) ) ( not ( = ?auto_688805 ?auto_688807 ) ) ( not ( = ?auto_688805 ?auto_688808 ) ) ( not ( = ?auto_688806 ?auto_688807 ) ) ( not ( = ?auto_688806 ?auto_688808 ) ) ( not ( = ?auto_688807 ?auto_688808 ) ) ( ON ?auto_688806 ?auto_688807 ) ( ON ?auto_688805 ?auto_688806 ) ( CLEAR ?auto_688803 ) ( ON ?auto_688804 ?auto_688805 ) ( CLEAR ?auto_688804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_688798 ?auto_688799 ?auto_688800 ?auto_688801 ?auto_688802 ?auto_688803 ?auto_688804 )
      ( MAKE-10PILE ?auto_688798 ?auto_688799 ?auto_688800 ?auto_688801 ?auto_688802 ?auto_688803 ?auto_688804 ?auto_688805 ?auto_688806 ?auto_688807 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_688840 - BLOCK
      ?auto_688841 - BLOCK
      ?auto_688842 - BLOCK
      ?auto_688843 - BLOCK
      ?auto_688844 - BLOCK
      ?auto_688845 - BLOCK
      ?auto_688846 - BLOCK
      ?auto_688847 - BLOCK
      ?auto_688848 - BLOCK
      ?auto_688849 - BLOCK
    )
    :vars
    (
      ?auto_688850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688849 ?auto_688850 ) ( ON-TABLE ?auto_688840 ) ( ON ?auto_688841 ?auto_688840 ) ( ON ?auto_688842 ?auto_688841 ) ( ON ?auto_688843 ?auto_688842 ) ( ON ?auto_688844 ?auto_688843 ) ( not ( = ?auto_688840 ?auto_688841 ) ) ( not ( = ?auto_688840 ?auto_688842 ) ) ( not ( = ?auto_688840 ?auto_688843 ) ) ( not ( = ?auto_688840 ?auto_688844 ) ) ( not ( = ?auto_688840 ?auto_688845 ) ) ( not ( = ?auto_688840 ?auto_688846 ) ) ( not ( = ?auto_688840 ?auto_688847 ) ) ( not ( = ?auto_688840 ?auto_688848 ) ) ( not ( = ?auto_688840 ?auto_688849 ) ) ( not ( = ?auto_688840 ?auto_688850 ) ) ( not ( = ?auto_688841 ?auto_688842 ) ) ( not ( = ?auto_688841 ?auto_688843 ) ) ( not ( = ?auto_688841 ?auto_688844 ) ) ( not ( = ?auto_688841 ?auto_688845 ) ) ( not ( = ?auto_688841 ?auto_688846 ) ) ( not ( = ?auto_688841 ?auto_688847 ) ) ( not ( = ?auto_688841 ?auto_688848 ) ) ( not ( = ?auto_688841 ?auto_688849 ) ) ( not ( = ?auto_688841 ?auto_688850 ) ) ( not ( = ?auto_688842 ?auto_688843 ) ) ( not ( = ?auto_688842 ?auto_688844 ) ) ( not ( = ?auto_688842 ?auto_688845 ) ) ( not ( = ?auto_688842 ?auto_688846 ) ) ( not ( = ?auto_688842 ?auto_688847 ) ) ( not ( = ?auto_688842 ?auto_688848 ) ) ( not ( = ?auto_688842 ?auto_688849 ) ) ( not ( = ?auto_688842 ?auto_688850 ) ) ( not ( = ?auto_688843 ?auto_688844 ) ) ( not ( = ?auto_688843 ?auto_688845 ) ) ( not ( = ?auto_688843 ?auto_688846 ) ) ( not ( = ?auto_688843 ?auto_688847 ) ) ( not ( = ?auto_688843 ?auto_688848 ) ) ( not ( = ?auto_688843 ?auto_688849 ) ) ( not ( = ?auto_688843 ?auto_688850 ) ) ( not ( = ?auto_688844 ?auto_688845 ) ) ( not ( = ?auto_688844 ?auto_688846 ) ) ( not ( = ?auto_688844 ?auto_688847 ) ) ( not ( = ?auto_688844 ?auto_688848 ) ) ( not ( = ?auto_688844 ?auto_688849 ) ) ( not ( = ?auto_688844 ?auto_688850 ) ) ( not ( = ?auto_688845 ?auto_688846 ) ) ( not ( = ?auto_688845 ?auto_688847 ) ) ( not ( = ?auto_688845 ?auto_688848 ) ) ( not ( = ?auto_688845 ?auto_688849 ) ) ( not ( = ?auto_688845 ?auto_688850 ) ) ( not ( = ?auto_688846 ?auto_688847 ) ) ( not ( = ?auto_688846 ?auto_688848 ) ) ( not ( = ?auto_688846 ?auto_688849 ) ) ( not ( = ?auto_688846 ?auto_688850 ) ) ( not ( = ?auto_688847 ?auto_688848 ) ) ( not ( = ?auto_688847 ?auto_688849 ) ) ( not ( = ?auto_688847 ?auto_688850 ) ) ( not ( = ?auto_688848 ?auto_688849 ) ) ( not ( = ?auto_688848 ?auto_688850 ) ) ( not ( = ?auto_688849 ?auto_688850 ) ) ( ON ?auto_688848 ?auto_688849 ) ( ON ?auto_688847 ?auto_688848 ) ( ON ?auto_688846 ?auto_688847 ) ( CLEAR ?auto_688844 ) ( ON ?auto_688845 ?auto_688846 ) ( CLEAR ?auto_688845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_688840 ?auto_688841 ?auto_688842 ?auto_688843 ?auto_688844 ?auto_688845 )
      ( MAKE-10PILE ?auto_688840 ?auto_688841 ?auto_688842 ?auto_688843 ?auto_688844 ?auto_688845 ?auto_688846 ?auto_688847 ?auto_688848 ?auto_688849 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_688882 - BLOCK
      ?auto_688883 - BLOCK
      ?auto_688884 - BLOCK
      ?auto_688885 - BLOCK
      ?auto_688886 - BLOCK
      ?auto_688887 - BLOCK
      ?auto_688888 - BLOCK
      ?auto_688889 - BLOCK
      ?auto_688890 - BLOCK
      ?auto_688891 - BLOCK
    )
    :vars
    (
      ?auto_688892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688891 ?auto_688892 ) ( ON-TABLE ?auto_688882 ) ( ON ?auto_688883 ?auto_688882 ) ( ON ?auto_688884 ?auto_688883 ) ( ON ?auto_688885 ?auto_688884 ) ( not ( = ?auto_688882 ?auto_688883 ) ) ( not ( = ?auto_688882 ?auto_688884 ) ) ( not ( = ?auto_688882 ?auto_688885 ) ) ( not ( = ?auto_688882 ?auto_688886 ) ) ( not ( = ?auto_688882 ?auto_688887 ) ) ( not ( = ?auto_688882 ?auto_688888 ) ) ( not ( = ?auto_688882 ?auto_688889 ) ) ( not ( = ?auto_688882 ?auto_688890 ) ) ( not ( = ?auto_688882 ?auto_688891 ) ) ( not ( = ?auto_688882 ?auto_688892 ) ) ( not ( = ?auto_688883 ?auto_688884 ) ) ( not ( = ?auto_688883 ?auto_688885 ) ) ( not ( = ?auto_688883 ?auto_688886 ) ) ( not ( = ?auto_688883 ?auto_688887 ) ) ( not ( = ?auto_688883 ?auto_688888 ) ) ( not ( = ?auto_688883 ?auto_688889 ) ) ( not ( = ?auto_688883 ?auto_688890 ) ) ( not ( = ?auto_688883 ?auto_688891 ) ) ( not ( = ?auto_688883 ?auto_688892 ) ) ( not ( = ?auto_688884 ?auto_688885 ) ) ( not ( = ?auto_688884 ?auto_688886 ) ) ( not ( = ?auto_688884 ?auto_688887 ) ) ( not ( = ?auto_688884 ?auto_688888 ) ) ( not ( = ?auto_688884 ?auto_688889 ) ) ( not ( = ?auto_688884 ?auto_688890 ) ) ( not ( = ?auto_688884 ?auto_688891 ) ) ( not ( = ?auto_688884 ?auto_688892 ) ) ( not ( = ?auto_688885 ?auto_688886 ) ) ( not ( = ?auto_688885 ?auto_688887 ) ) ( not ( = ?auto_688885 ?auto_688888 ) ) ( not ( = ?auto_688885 ?auto_688889 ) ) ( not ( = ?auto_688885 ?auto_688890 ) ) ( not ( = ?auto_688885 ?auto_688891 ) ) ( not ( = ?auto_688885 ?auto_688892 ) ) ( not ( = ?auto_688886 ?auto_688887 ) ) ( not ( = ?auto_688886 ?auto_688888 ) ) ( not ( = ?auto_688886 ?auto_688889 ) ) ( not ( = ?auto_688886 ?auto_688890 ) ) ( not ( = ?auto_688886 ?auto_688891 ) ) ( not ( = ?auto_688886 ?auto_688892 ) ) ( not ( = ?auto_688887 ?auto_688888 ) ) ( not ( = ?auto_688887 ?auto_688889 ) ) ( not ( = ?auto_688887 ?auto_688890 ) ) ( not ( = ?auto_688887 ?auto_688891 ) ) ( not ( = ?auto_688887 ?auto_688892 ) ) ( not ( = ?auto_688888 ?auto_688889 ) ) ( not ( = ?auto_688888 ?auto_688890 ) ) ( not ( = ?auto_688888 ?auto_688891 ) ) ( not ( = ?auto_688888 ?auto_688892 ) ) ( not ( = ?auto_688889 ?auto_688890 ) ) ( not ( = ?auto_688889 ?auto_688891 ) ) ( not ( = ?auto_688889 ?auto_688892 ) ) ( not ( = ?auto_688890 ?auto_688891 ) ) ( not ( = ?auto_688890 ?auto_688892 ) ) ( not ( = ?auto_688891 ?auto_688892 ) ) ( ON ?auto_688890 ?auto_688891 ) ( ON ?auto_688889 ?auto_688890 ) ( ON ?auto_688888 ?auto_688889 ) ( ON ?auto_688887 ?auto_688888 ) ( CLEAR ?auto_688885 ) ( ON ?auto_688886 ?auto_688887 ) ( CLEAR ?auto_688886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_688882 ?auto_688883 ?auto_688884 ?auto_688885 ?auto_688886 )
      ( MAKE-10PILE ?auto_688882 ?auto_688883 ?auto_688884 ?auto_688885 ?auto_688886 ?auto_688887 ?auto_688888 ?auto_688889 ?auto_688890 ?auto_688891 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_688924 - BLOCK
      ?auto_688925 - BLOCK
      ?auto_688926 - BLOCK
      ?auto_688927 - BLOCK
      ?auto_688928 - BLOCK
      ?auto_688929 - BLOCK
      ?auto_688930 - BLOCK
      ?auto_688931 - BLOCK
      ?auto_688932 - BLOCK
      ?auto_688933 - BLOCK
    )
    :vars
    (
      ?auto_688934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688933 ?auto_688934 ) ( ON-TABLE ?auto_688924 ) ( ON ?auto_688925 ?auto_688924 ) ( ON ?auto_688926 ?auto_688925 ) ( not ( = ?auto_688924 ?auto_688925 ) ) ( not ( = ?auto_688924 ?auto_688926 ) ) ( not ( = ?auto_688924 ?auto_688927 ) ) ( not ( = ?auto_688924 ?auto_688928 ) ) ( not ( = ?auto_688924 ?auto_688929 ) ) ( not ( = ?auto_688924 ?auto_688930 ) ) ( not ( = ?auto_688924 ?auto_688931 ) ) ( not ( = ?auto_688924 ?auto_688932 ) ) ( not ( = ?auto_688924 ?auto_688933 ) ) ( not ( = ?auto_688924 ?auto_688934 ) ) ( not ( = ?auto_688925 ?auto_688926 ) ) ( not ( = ?auto_688925 ?auto_688927 ) ) ( not ( = ?auto_688925 ?auto_688928 ) ) ( not ( = ?auto_688925 ?auto_688929 ) ) ( not ( = ?auto_688925 ?auto_688930 ) ) ( not ( = ?auto_688925 ?auto_688931 ) ) ( not ( = ?auto_688925 ?auto_688932 ) ) ( not ( = ?auto_688925 ?auto_688933 ) ) ( not ( = ?auto_688925 ?auto_688934 ) ) ( not ( = ?auto_688926 ?auto_688927 ) ) ( not ( = ?auto_688926 ?auto_688928 ) ) ( not ( = ?auto_688926 ?auto_688929 ) ) ( not ( = ?auto_688926 ?auto_688930 ) ) ( not ( = ?auto_688926 ?auto_688931 ) ) ( not ( = ?auto_688926 ?auto_688932 ) ) ( not ( = ?auto_688926 ?auto_688933 ) ) ( not ( = ?auto_688926 ?auto_688934 ) ) ( not ( = ?auto_688927 ?auto_688928 ) ) ( not ( = ?auto_688927 ?auto_688929 ) ) ( not ( = ?auto_688927 ?auto_688930 ) ) ( not ( = ?auto_688927 ?auto_688931 ) ) ( not ( = ?auto_688927 ?auto_688932 ) ) ( not ( = ?auto_688927 ?auto_688933 ) ) ( not ( = ?auto_688927 ?auto_688934 ) ) ( not ( = ?auto_688928 ?auto_688929 ) ) ( not ( = ?auto_688928 ?auto_688930 ) ) ( not ( = ?auto_688928 ?auto_688931 ) ) ( not ( = ?auto_688928 ?auto_688932 ) ) ( not ( = ?auto_688928 ?auto_688933 ) ) ( not ( = ?auto_688928 ?auto_688934 ) ) ( not ( = ?auto_688929 ?auto_688930 ) ) ( not ( = ?auto_688929 ?auto_688931 ) ) ( not ( = ?auto_688929 ?auto_688932 ) ) ( not ( = ?auto_688929 ?auto_688933 ) ) ( not ( = ?auto_688929 ?auto_688934 ) ) ( not ( = ?auto_688930 ?auto_688931 ) ) ( not ( = ?auto_688930 ?auto_688932 ) ) ( not ( = ?auto_688930 ?auto_688933 ) ) ( not ( = ?auto_688930 ?auto_688934 ) ) ( not ( = ?auto_688931 ?auto_688932 ) ) ( not ( = ?auto_688931 ?auto_688933 ) ) ( not ( = ?auto_688931 ?auto_688934 ) ) ( not ( = ?auto_688932 ?auto_688933 ) ) ( not ( = ?auto_688932 ?auto_688934 ) ) ( not ( = ?auto_688933 ?auto_688934 ) ) ( ON ?auto_688932 ?auto_688933 ) ( ON ?auto_688931 ?auto_688932 ) ( ON ?auto_688930 ?auto_688931 ) ( ON ?auto_688929 ?auto_688930 ) ( ON ?auto_688928 ?auto_688929 ) ( CLEAR ?auto_688926 ) ( ON ?auto_688927 ?auto_688928 ) ( CLEAR ?auto_688927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_688924 ?auto_688925 ?auto_688926 ?auto_688927 )
      ( MAKE-10PILE ?auto_688924 ?auto_688925 ?auto_688926 ?auto_688927 ?auto_688928 ?auto_688929 ?auto_688930 ?auto_688931 ?auto_688932 ?auto_688933 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_688966 - BLOCK
      ?auto_688967 - BLOCK
      ?auto_688968 - BLOCK
      ?auto_688969 - BLOCK
      ?auto_688970 - BLOCK
      ?auto_688971 - BLOCK
      ?auto_688972 - BLOCK
      ?auto_688973 - BLOCK
      ?auto_688974 - BLOCK
      ?auto_688975 - BLOCK
    )
    :vars
    (
      ?auto_688976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_688975 ?auto_688976 ) ( ON-TABLE ?auto_688966 ) ( ON ?auto_688967 ?auto_688966 ) ( not ( = ?auto_688966 ?auto_688967 ) ) ( not ( = ?auto_688966 ?auto_688968 ) ) ( not ( = ?auto_688966 ?auto_688969 ) ) ( not ( = ?auto_688966 ?auto_688970 ) ) ( not ( = ?auto_688966 ?auto_688971 ) ) ( not ( = ?auto_688966 ?auto_688972 ) ) ( not ( = ?auto_688966 ?auto_688973 ) ) ( not ( = ?auto_688966 ?auto_688974 ) ) ( not ( = ?auto_688966 ?auto_688975 ) ) ( not ( = ?auto_688966 ?auto_688976 ) ) ( not ( = ?auto_688967 ?auto_688968 ) ) ( not ( = ?auto_688967 ?auto_688969 ) ) ( not ( = ?auto_688967 ?auto_688970 ) ) ( not ( = ?auto_688967 ?auto_688971 ) ) ( not ( = ?auto_688967 ?auto_688972 ) ) ( not ( = ?auto_688967 ?auto_688973 ) ) ( not ( = ?auto_688967 ?auto_688974 ) ) ( not ( = ?auto_688967 ?auto_688975 ) ) ( not ( = ?auto_688967 ?auto_688976 ) ) ( not ( = ?auto_688968 ?auto_688969 ) ) ( not ( = ?auto_688968 ?auto_688970 ) ) ( not ( = ?auto_688968 ?auto_688971 ) ) ( not ( = ?auto_688968 ?auto_688972 ) ) ( not ( = ?auto_688968 ?auto_688973 ) ) ( not ( = ?auto_688968 ?auto_688974 ) ) ( not ( = ?auto_688968 ?auto_688975 ) ) ( not ( = ?auto_688968 ?auto_688976 ) ) ( not ( = ?auto_688969 ?auto_688970 ) ) ( not ( = ?auto_688969 ?auto_688971 ) ) ( not ( = ?auto_688969 ?auto_688972 ) ) ( not ( = ?auto_688969 ?auto_688973 ) ) ( not ( = ?auto_688969 ?auto_688974 ) ) ( not ( = ?auto_688969 ?auto_688975 ) ) ( not ( = ?auto_688969 ?auto_688976 ) ) ( not ( = ?auto_688970 ?auto_688971 ) ) ( not ( = ?auto_688970 ?auto_688972 ) ) ( not ( = ?auto_688970 ?auto_688973 ) ) ( not ( = ?auto_688970 ?auto_688974 ) ) ( not ( = ?auto_688970 ?auto_688975 ) ) ( not ( = ?auto_688970 ?auto_688976 ) ) ( not ( = ?auto_688971 ?auto_688972 ) ) ( not ( = ?auto_688971 ?auto_688973 ) ) ( not ( = ?auto_688971 ?auto_688974 ) ) ( not ( = ?auto_688971 ?auto_688975 ) ) ( not ( = ?auto_688971 ?auto_688976 ) ) ( not ( = ?auto_688972 ?auto_688973 ) ) ( not ( = ?auto_688972 ?auto_688974 ) ) ( not ( = ?auto_688972 ?auto_688975 ) ) ( not ( = ?auto_688972 ?auto_688976 ) ) ( not ( = ?auto_688973 ?auto_688974 ) ) ( not ( = ?auto_688973 ?auto_688975 ) ) ( not ( = ?auto_688973 ?auto_688976 ) ) ( not ( = ?auto_688974 ?auto_688975 ) ) ( not ( = ?auto_688974 ?auto_688976 ) ) ( not ( = ?auto_688975 ?auto_688976 ) ) ( ON ?auto_688974 ?auto_688975 ) ( ON ?auto_688973 ?auto_688974 ) ( ON ?auto_688972 ?auto_688973 ) ( ON ?auto_688971 ?auto_688972 ) ( ON ?auto_688970 ?auto_688971 ) ( ON ?auto_688969 ?auto_688970 ) ( CLEAR ?auto_688967 ) ( ON ?auto_688968 ?auto_688969 ) ( CLEAR ?auto_688968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_688966 ?auto_688967 ?auto_688968 )
      ( MAKE-10PILE ?auto_688966 ?auto_688967 ?auto_688968 ?auto_688969 ?auto_688970 ?auto_688971 ?auto_688972 ?auto_688973 ?auto_688974 ?auto_688975 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_689008 - BLOCK
      ?auto_689009 - BLOCK
      ?auto_689010 - BLOCK
      ?auto_689011 - BLOCK
      ?auto_689012 - BLOCK
      ?auto_689013 - BLOCK
      ?auto_689014 - BLOCK
      ?auto_689015 - BLOCK
      ?auto_689016 - BLOCK
      ?auto_689017 - BLOCK
    )
    :vars
    (
      ?auto_689018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689017 ?auto_689018 ) ( ON-TABLE ?auto_689008 ) ( not ( = ?auto_689008 ?auto_689009 ) ) ( not ( = ?auto_689008 ?auto_689010 ) ) ( not ( = ?auto_689008 ?auto_689011 ) ) ( not ( = ?auto_689008 ?auto_689012 ) ) ( not ( = ?auto_689008 ?auto_689013 ) ) ( not ( = ?auto_689008 ?auto_689014 ) ) ( not ( = ?auto_689008 ?auto_689015 ) ) ( not ( = ?auto_689008 ?auto_689016 ) ) ( not ( = ?auto_689008 ?auto_689017 ) ) ( not ( = ?auto_689008 ?auto_689018 ) ) ( not ( = ?auto_689009 ?auto_689010 ) ) ( not ( = ?auto_689009 ?auto_689011 ) ) ( not ( = ?auto_689009 ?auto_689012 ) ) ( not ( = ?auto_689009 ?auto_689013 ) ) ( not ( = ?auto_689009 ?auto_689014 ) ) ( not ( = ?auto_689009 ?auto_689015 ) ) ( not ( = ?auto_689009 ?auto_689016 ) ) ( not ( = ?auto_689009 ?auto_689017 ) ) ( not ( = ?auto_689009 ?auto_689018 ) ) ( not ( = ?auto_689010 ?auto_689011 ) ) ( not ( = ?auto_689010 ?auto_689012 ) ) ( not ( = ?auto_689010 ?auto_689013 ) ) ( not ( = ?auto_689010 ?auto_689014 ) ) ( not ( = ?auto_689010 ?auto_689015 ) ) ( not ( = ?auto_689010 ?auto_689016 ) ) ( not ( = ?auto_689010 ?auto_689017 ) ) ( not ( = ?auto_689010 ?auto_689018 ) ) ( not ( = ?auto_689011 ?auto_689012 ) ) ( not ( = ?auto_689011 ?auto_689013 ) ) ( not ( = ?auto_689011 ?auto_689014 ) ) ( not ( = ?auto_689011 ?auto_689015 ) ) ( not ( = ?auto_689011 ?auto_689016 ) ) ( not ( = ?auto_689011 ?auto_689017 ) ) ( not ( = ?auto_689011 ?auto_689018 ) ) ( not ( = ?auto_689012 ?auto_689013 ) ) ( not ( = ?auto_689012 ?auto_689014 ) ) ( not ( = ?auto_689012 ?auto_689015 ) ) ( not ( = ?auto_689012 ?auto_689016 ) ) ( not ( = ?auto_689012 ?auto_689017 ) ) ( not ( = ?auto_689012 ?auto_689018 ) ) ( not ( = ?auto_689013 ?auto_689014 ) ) ( not ( = ?auto_689013 ?auto_689015 ) ) ( not ( = ?auto_689013 ?auto_689016 ) ) ( not ( = ?auto_689013 ?auto_689017 ) ) ( not ( = ?auto_689013 ?auto_689018 ) ) ( not ( = ?auto_689014 ?auto_689015 ) ) ( not ( = ?auto_689014 ?auto_689016 ) ) ( not ( = ?auto_689014 ?auto_689017 ) ) ( not ( = ?auto_689014 ?auto_689018 ) ) ( not ( = ?auto_689015 ?auto_689016 ) ) ( not ( = ?auto_689015 ?auto_689017 ) ) ( not ( = ?auto_689015 ?auto_689018 ) ) ( not ( = ?auto_689016 ?auto_689017 ) ) ( not ( = ?auto_689016 ?auto_689018 ) ) ( not ( = ?auto_689017 ?auto_689018 ) ) ( ON ?auto_689016 ?auto_689017 ) ( ON ?auto_689015 ?auto_689016 ) ( ON ?auto_689014 ?auto_689015 ) ( ON ?auto_689013 ?auto_689014 ) ( ON ?auto_689012 ?auto_689013 ) ( ON ?auto_689011 ?auto_689012 ) ( ON ?auto_689010 ?auto_689011 ) ( CLEAR ?auto_689008 ) ( ON ?auto_689009 ?auto_689010 ) ( CLEAR ?auto_689009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_689008 ?auto_689009 )
      ( MAKE-10PILE ?auto_689008 ?auto_689009 ?auto_689010 ?auto_689011 ?auto_689012 ?auto_689013 ?auto_689014 ?auto_689015 ?auto_689016 ?auto_689017 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_689050 - BLOCK
      ?auto_689051 - BLOCK
      ?auto_689052 - BLOCK
      ?auto_689053 - BLOCK
      ?auto_689054 - BLOCK
      ?auto_689055 - BLOCK
      ?auto_689056 - BLOCK
      ?auto_689057 - BLOCK
      ?auto_689058 - BLOCK
      ?auto_689059 - BLOCK
    )
    :vars
    (
      ?auto_689060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689059 ?auto_689060 ) ( not ( = ?auto_689050 ?auto_689051 ) ) ( not ( = ?auto_689050 ?auto_689052 ) ) ( not ( = ?auto_689050 ?auto_689053 ) ) ( not ( = ?auto_689050 ?auto_689054 ) ) ( not ( = ?auto_689050 ?auto_689055 ) ) ( not ( = ?auto_689050 ?auto_689056 ) ) ( not ( = ?auto_689050 ?auto_689057 ) ) ( not ( = ?auto_689050 ?auto_689058 ) ) ( not ( = ?auto_689050 ?auto_689059 ) ) ( not ( = ?auto_689050 ?auto_689060 ) ) ( not ( = ?auto_689051 ?auto_689052 ) ) ( not ( = ?auto_689051 ?auto_689053 ) ) ( not ( = ?auto_689051 ?auto_689054 ) ) ( not ( = ?auto_689051 ?auto_689055 ) ) ( not ( = ?auto_689051 ?auto_689056 ) ) ( not ( = ?auto_689051 ?auto_689057 ) ) ( not ( = ?auto_689051 ?auto_689058 ) ) ( not ( = ?auto_689051 ?auto_689059 ) ) ( not ( = ?auto_689051 ?auto_689060 ) ) ( not ( = ?auto_689052 ?auto_689053 ) ) ( not ( = ?auto_689052 ?auto_689054 ) ) ( not ( = ?auto_689052 ?auto_689055 ) ) ( not ( = ?auto_689052 ?auto_689056 ) ) ( not ( = ?auto_689052 ?auto_689057 ) ) ( not ( = ?auto_689052 ?auto_689058 ) ) ( not ( = ?auto_689052 ?auto_689059 ) ) ( not ( = ?auto_689052 ?auto_689060 ) ) ( not ( = ?auto_689053 ?auto_689054 ) ) ( not ( = ?auto_689053 ?auto_689055 ) ) ( not ( = ?auto_689053 ?auto_689056 ) ) ( not ( = ?auto_689053 ?auto_689057 ) ) ( not ( = ?auto_689053 ?auto_689058 ) ) ( not ( = ?auto_689053 ?auto_689059 ) ) ( not ( = ?auto_689053 ?auto_689060 ) ) ( not ( = ?auto_689054 ?auto_689055 ) ) ( not ( = ?auto_689054 ?auto_689056 ) ) ( not ( = ?auto_689054 ?auto_689057 ) ) ( not ( = ?auto_689054 ?auto_689058 ) ) ( not ( = ?auto_689054 ?auto_689059 ) ) ( not ( = ?auto_689054 ?auto_689060 ) ) ( not ( = ?auto_689055 ?auto_689056 ) ) ( not ( = ?auto_689055 ?auto_689057 ) ) ( not ( = ?auto_689055 ?auto_689058 ) ) ( not ( = ?auto_689055 ?auto_689059 ) ) ( not ( = ?auto_689055 ?auto_689060 ) ) ( not ( = ?auto_689056 ?auto_689057 ) ) ( not ( = ?auto_689056 ?auto_689058 ) ) ( not ( = ?auto_689056 ?auto_689059 ) ) ( not ( = ?auto_689056 ?auto_689060 ) ) ( not ( = ?auto_689057 ?auto_689058 ) ) ( not ( = ?auto_689057 ?auto_689059 ) ) ( not ( = ?auto_689057 ?auto_689060 ) ) ( not ( = ?auto_689058 ?auto_689059 ) ) ( not ( = ?auto_689058 ?auto_689060 ) ) ( not ( = ?auto_689059 ?auto_689060 ) ) ( ON ?auto_689058 ?auto_689059 ) ( ON ?auto_689057 ?auto_689058 ) ( ON ?auto_689056 ?auto_689057 ) ( ON ?auto_689055 ?auto_689056 ) ( ON ?auto_689054 ?auto_689055 ) ( ON ?auto_689053 ?auto_689054 ) ( ON ?auto_689052 ?auto_689053 ) ( ON ?auto_689051 ?auto_689052 ) ( ON ?auto_689050 ?auto_689051 ) ( CLEAR ?auto_689050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_689050 )
      ( MAKE-10PILE ?auto_689050 ?auto_689051 ?auto_689052 ?auto_689053 ?auto_689054 ?auto_689055 ?auto_689056 ?auto_689057 ?auto_689058 ?auto_689059 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_689093 - BLOCK
      ?auto_689094 - BLOCK
      ?auto_689095 - BLOCK
      ?auto_689096 - BLOCK
      ?auto_689097 - BLOCK
      ?auto_689098 - BLOCK
      ?auto_689099 - BLOCK
      ?auto_689100 - BLOCK
      ?auto_689101 - BLOCK
      ?auto_689102 - BLOCK
      ?auto_689103 - BLOCK
    )
    :vars
    (
      ?auto_689104 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_689102 ) ( ON ?auto_689103 ?auto_689104 ) ( CLEAR ?auto_689103 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_689093 ) ( ON ?auto_689094 ?auto_689093 ) ( ON ?auto_689095 ?auto_689094 ) ( ON ?auto_689096 ?auto_689095 ) ( ON ?auto_689097 ?auto_689096 ) ( ON ?auto_689098 ?auto_689097 ) ( ON ?auto_689099 ?auto_689098 ) ( ON ?auto_689100 ?auto_689099 ) ( ON ?auto_689101 ?auto_689100 ) ( ON ?auto_689102 ?auto_689101 ) ( not ( = ?auto_689093 ?auto_689094 ) ) ( not ( = ?auto_689093 ?auto_689095 ) ) ( not ( = ?auto_689093 ?auto_689096 ) ) ( not ( = ?auto_689093 ?auto_689097 ) ) ( not ( = ?auto_689093 ?auto_689098 ) ) ( not ( = ?auto_689093 ?auto_689099 ) ) ( not ( = ?auto_689093 ?auto_689100 ) ) ( not ( = ?auto_689093 ?auto_689101 ) ) ( not ( = ?auto_689093 ?auto_689102 ) ) ( not ( = ?auto_689093 ?auto_689103 ) ) ( not ( = ?auto_689093 ?auto_689104 ) ) ( not ( = ?auto_689094 ?auto_689095 ) ) ( not ( = ?auto_689094 ?auto_689096 ) ) ( not ( = ?auto_689094 ?auto_689097 ) ) ( not ( = ?auto_689094 ?auto_689098 ) ) ( not ( = ?auto_689094 ?auto_689099 ) ) ( not ( = ?auto_689094 ?auto_689100 ) ) ( not ( = ?auto_689094 ?auto_689101 ) ) ( not ( = ?auto_689094 ?auto_689102 ) ) ( not ( = ?auto_689094 ?auto_689103 ) ) ( not ( = ?auto_689094 ?auto_689104 ) ) ( not ( = ?auto_689095 ?auto_689096 ) ) ( not ( = ?auto_689095 ?auto_689097 ) ) ( not ( = ?auto_689095 ?auto_689098 ) ) ( not ( = ?auto_689095 ?auto_689099 ) ) ( not ( = ?auto_689095 ?auto_689100 ) ) ( not ( = ?auto_689095 ?auto_689101 ) ) ( not ( = ?auto_689095 ?auto_689102 ) ) ( not ( = ?auto_689095 ?auto_689103 ) ) ( not ( = ?auto_689095 ?auto_689104 ) ) ( not ( = ?auto_689096 ?auto_689097 ) ) ( not ( = ?auto_689096 ?auto_689098 ) ) ( not ( = ?auto_689096 ?auto_689099 ) ) ( not ( = ?auto_689096 ?auto_689100 ) ) ( not ( = ?auto_689096 ?auto_689101 ) ) ( not ( = ?auto_689096 ?auto_689102 ) ) ( not ( = ?auto_689096 ?auto_689103 ) ) ( not ( = ?auto_689096 ?auto_689104 ) ) ( not ( = ?auto_689097 ?auto_689098 ) ) ( not ( = ?auto_689097 ?auto_689099 ) ) ( not ( = ?auto_689097 ?auto_689100 ) ) ( not ( = ?auto_689097 ?auto_689101 ) ) ( not ( = ?auto_689097 ?auto_689102 ) ) ( not ( = ?auto_689097 ?auto_689103 ) ) ( not ( = ?auto_689097 ?auto_689104 ) ) ( not ( = ?auto_689098 ?auto_689099 ) ) ( not ( = ?auto_689098 ?auto_689100 ) ) ( not ( = ?auto_689098 ?auto_689101 ) ) ( not ( = ?auto_689098 ?auto_689102 ) ) ( not ( = ?auto_689098 ?auto_689103 ) ) ( not ( = ?auto_689098 ?auto_689104 ) ) ( not ( = ?auto_689099 ?auto_689100 ) ) ( not ( = ?auto_689099 ?auto_689101 ) ) ( not ( = ?auto_689099 ?auto_689102 ) ) ( not ( = ?auto_689099 ?auto_689103 ) ) ( not ( = ?auto_689099 ?auto_689104 ) ) ( not ( = ?auto_689100 ?auto_689101 ) ) ( not ( = ?auto_689100 ?auto_689102 ) ) ( not ( = ?auto_689100 ?auto_689103 ) ) ( not ( = ?auto_689100 ?auto_689104 ) ) ( not ( = ?auto_689101 ?auto_689102 ) ) ( not ( = ?auto_689101 ?auto_689103 ) ) ( not ( = ?auto_689101 ?auto_689104 ) ) ( not ( = ?auto_689102 ?auto_689103 ) ) ( not ( = ?auto_689102 ?auto_689104 ) ) ( not ( = ?auto_689103 ?auto_689104 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_689103 ?auto_689104 )
      ( !STACK ?auto_689103 ?auto_689102 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_689139 - BLOCK
      ?auto_689140 - BLOCK
      ?auto_689141 - BLOCK
      ?auto_689142 - BLOCK
      ?auto_689143 - BLOCK
      ?auto_689144 - BLOCK
      ?auto_689145 - BLOCK
      ?auto_689146 - BLOCK
      ?auto_689147 - BLOCK
      ?auto_689148 - BLOCK
      ?auto_689149 - BLOCK
    )
    :vars
    (
      ?auto_689150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689149 ?auto_689150 ) ( ON-TABLE ?auto_689139 ) ( ON ?auto_689140 ?auto_689139 ) ( ON ?auto_689141 ?auto_689140 ) ( ON ?auto_689142 ?auto_689141 ) ( ON ?auto_689143 ?auto_689142 ) ( ON ?auto_689144 ?auto_689143 ) ( ON ?auto_689145 ?auto_689144 ) ( ON ?auto_689146 ?auto_689145 ) ( ON ?auto_689147 ?auto_689146 ) ( not ( = ?auto_689139 ?auto_689140 ) ) ( not ( = ?auto_689139 ?auto_689141 ) ) ( not ( = ?auto_689139 ?auto_689142 ) ) ( not ( = ?auto_689139 ?auto_689143 ) ) ( not ( = ?auto_689139 ?auto_689144 ) ) ( not ( = ?auto_689139 ?auto_689145 ) ) ( not ( = ?auto_689139 ?auto_689146 ) ) ( not ( = ?auto_689139 ?auto_689147 ) ) ( not ( = ?auto_689139 ?auto_689148 ) ) ( not ( = ?auto_689139 ?auto_689149 ) ) ( not ( = ?auto_689139 ?auto_689150 ) ) ( not ( = ?auto_689140 ?auto_689141 ) ) ( not ( = ?auto_689140 ?auto_689142 ) ) ( not ( = ?auto_689140 ?auto_689143 ) ) ( not ( = ?auto_689140 ?auto_689144 ) ) ( not ( = ?auto_689140 ?auto_689145 ) ) ( not ( = ?auto_689140 ?auto_689146 ) ) ( not ( = ?auto_689140 ?auto_689147 ) ) ( not ( = ?auto_689140 ?auto_689148 ) ) ( not ( = ?auto_689140 ?auto_689149 ) ) ( not ( = ?auto_689140 ?auto_689150 ) ) ( not ( = ?auto_689141 ?auto_689142 ) ) ( not ( = ?auto_689141 ?auto_689143 ) ) ( not ( = ?auto_689141 ?auto_689144 ) ) ( not ( = ?auto_689141 ?auto_689145 ) ) ( not ( = ?auto_689141 ?auto_689146 ) ) ( not ( = ?auto_689141 ?auto_689147 ) ) ( not ( = ?auto_689141 ?auto_689148 ) ) ( not ( = ?auto_689141 ?auto_689149 ) ) ( not ( = ?auto_689141 ?auto_689150 ) ) ( not ( = ?auto_689142 ?auto_689143 ) ) ( not ( = ?auto_689142 ?auto_689144 ) ) ( not ( = ?auto_689142 ?auto_689145 ) ) ( not ( = ?auto_689142 ?auto_689146 ) ) ( not ( = ?auto_689142 ?auto_689147 ) ) ( not ( = ?auto_689142 ?auto_689148 ) ) ( not ( = ?auto_689142 ?auto_689149 ) ) ( not ( = ?auto_689142 ?auto_689150 ) ) ( not ( = ?auto_689143 ?auto_689144 ) ) ( not ( = ?auto_689143 ?auto_689145 ) ) ( not ( = ?auto_689143 ?auto_689146 ) ) ( not ( = ?auto_689143 ?auto_689147 ) ) ( not ( = ?auto_689143 ?auto_689148 ) ) ( not ( = ?auto_689143 ?auto_689149 ) ) ( not ( = ?auto_689143 ?auto_689150 ) ) ( not ( = ?auto_689144 ?auto_689145 ) ) ( not ( = ?auto_689144 ?auto_689146 ) ) ( not ( = ?auto_689144 ?auto_689147 ) ) ( not ( = ?auto_689144 ?auto_689148 ) ) ( not ( = ?auto_689144 ?auto_689149 ) ) ( not ( = ?auto_689144 ?auto_689150 ) ) ( not ( = ?auto_689145 ?auto_689146 ) ) ( not ( = ?auto_689145 ?auto_689147 ) ) ( not ( = ?auto_689145 ?auto_689148 ) ) ( not ( = ?auto_689145 ?auto_689149 ) ) ( not ( = ?auto_689145 ?auto_689150 ) ) ( not ( = ?auto_689146 ?auto_689147 ) ) ( not ( = ?auto_689146 ?auto_689148 ) ) ( not ( = ?auto_689146 ?auto_689149 ) ) ( not ( = ?auto_689146 ?auto_689150 ) ) ( not ( = ?auto_689147 ?auto_689148 ) ) ( not ( = ?auto_689147 ?auto_689149 ) ) ( not ( = ?auto_689147 ?auto_689150 ) ) ( not ( = ?auto_689148 ?auto_689149 ) ) ( not ( = ?auto_689148 ?auto_689150 ) ) ( not ( = ?auto_689149 ?auto_689150 ) ) ( CLEAR ?auto_689147 ) ( ON ?auto_689148 ?auto_689149 ) ( CLEAR ?auto_689148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_689139 ?auto_689140 ?auto_689141 ?auto_689142 ?auto_689143 ?auto_689144 ?auto_689145 ?auto_689146 ?auto_689147 ?auto_689148 )
      ( MAKE-11PILE ?auto_689139 ?auto_689140 ?auto_689141 ?auto_689142 ?auto_689143 ?auto_689144 ?auto_689145 ?auto_689146 ?auto_689147 ?auto_689148 ?auto_689149 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_689185 - BLOCK
      ?auto_689186 - BLOCK
      ?auto_689187 - BLOCK
      ?auto_689188 - BLOCK
      ?auto_689189 - BLOCK
      ?auto_689190 - BLOCK
      ?auto_689191 - BLOCK
      ?auto_689192 - BLOCK
      ?auto_689193 - BLOCK
      ?auto_689194 - BLOCK
      ?auto_689195 - BLOCK
    )
    :vars
    (
      ?auto_689196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689195 ?auto_689196 ) ( ON-TABLE ?auto_689185 ) ( ON ?auto_689186 ?auto_689185 ) ( ON ?auto_689187 ?auto_689186 ) ( ON ?auto_689188 ?auto_689187 ) ( ON ?auto_689189 ?auto_689188 ) ( ON ?auto_689190 ?auto_689189 ) ( ON ?auto_689191 ?auto_689190 ) ( ON ?auto_689192 ?auto_689191 ) ( not ( = ?auto_689185 ?auto_689186 ) ) ( not ( = ?auto_689185 ?auto_689187 ) ) ( not ( = ?auto_689185 ?auto_689188 ) ) ( not ( = ?auto_689185 ?auto_689189 ) ) ( not ( = ?auto_689185 ?auto_689190 ) ) ( not ( = ?auto_689185 ?auto_689191 ) ) ( not ( = ?auto_689185 ?auto_689192 ) ) ( not ( = ?auto_689185 ?auto_689193 ) ) ( not ( = ?auto_689185 ?auto_689194 ) ) ( not ( = ?auto_689185 ?auto_689195 ) ) ( not ( = ?auto_689185 ?auto_689196 ) ) ( not ( = ?auto_689186 ?auto_689187 ) ) ( not ( = ?auto_689186 ?auto_689188 ) ) ( not ( = ?auto_689186 ?auto_689189 ) ) ( not ( = ?auto_689186 ?auto_689190 ) ) ( not ( = ?auto_689186 ?auto_689191 ) ) ( not ( = ?auto_689186 ?auto_689192 ) ) ( not ( = ?auto_689186 ?auto_689193 ) ) ( not ( = ?auto_689186 ?auto_689194 ) ) ( not ( = ?auto_689186 ?auto_689195 ) ) ( not ( = ?auto_689186 ?auto_689196 ) ) ( not ( = ?auto_689187 ?auto_689188 ) ) ( not ( = ?auto_689187 ?auto_689189 ) ) ( not ( = ?auto_689187 ?auto_689190 ) ) ( not ( = ?auto_689187 ?auto_689191 ) ) ( not ( = ?auto_689187 ?auto_689192 ) ) ( not ( = ?auto_689187 ?auto_689193 ) ) ( not ( = ?auto_689187 ?auto_689194 ) ) ( not ( = ?auto_689187 ?auto_689195 ) ) ( not ( = ?auto_689187 ?auto_689196 ) ) ( not ( = ?auto_689188 ?auto_689189 ) ) ( not ( = ?auto_689188 ?auto_689190 ) ) ( not ( = ?auto_689188 ?auto_689191 ) ) ( not ( = ?auto_689188 ?auto_689192 ) ) ( not ( = ?auto_689188 ?auto_689193 ) ) ( not ( = ?auto_689188 ?auto_689194 ) ) ( not ( = ?auto_689188 ?auto_689195 ) ) ( not ( = ?auto_689188 ?auto_689196 ) ) ( not ( = ?auto_689189 ?auto_689190 ) ) ( not ( = ?auto_689189 ?auto_689191 ) ) ( not ( = ?auto_689189 ?auto_689192 ) ) ( not ( = ?auto_689189 ?auto_689193 ) ) ( not ( = ?auto_689189 ?auto_689194 ) ) ( not ( = ?auto_689189 ?auto_689195 ) ) ( not ( = ?auto_689189 ?auto_689196 ) ) ( not ( = ?auto_689190 ?auto_689191 ) ) ( not ( = ?auto_689190 ?auto_689192 ) ) ( not ( = ?auto_689190 ?auto_689193 ) ) ( not ( = ?auto_689190 ?auto_689194 ) ) ( not ( = ?auto_689190 ?auto_689195 ) ) ( not ( = ?auto_689190 ?auto_689196 ) ) ( not ( = ?auto_689191 ?auto_689192 ) ) ( not ( = ?auto_689191 ?auto_689193 ) ) ( not ( = ?auto_689191 ?auto_689194 ) ) ( not ( = ?auto_689191 ?auto_689195 ) ) ( not ( = ?auto_689191 ?auto_689196 ) ) ( not ( = ?auto_689192 ?auto_689193 ) ) ( not ( = ?auto_689192 ?auto_689194 ) ) ( not ( = ?auto_689192 ?auto_689195 ) ) ( not ( = ?auto_689192 ?auto_689196 ) ) ( not ( = ?auto_689193 ?auto_689194 ) ) ( not ( = ?auto_689193 ?auto_689195 ) ) ( not ( = ?auto_689193 ?auto_689196 ) ) ( not ( = ?auto_689194 ?auto_689195 ) ) ( not ( = ?auto_689194 ?auto_689196 ) ) ( not ( = ?auto_689195 ?auto_689196 ) ) ( ON ?auto_689194 ?auto_689195 ) ( CLEAR ?auto_689192 ) ( ON ?auto_689193 ?auto_689194 ) ( CLEAR ?auto_689193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_689185 ?auto_689186 ?auto_689187 ?auto_689188 ?auto_689189 ?auto_689190 ?auto_689191 ?auto_689192 ?auto_689193 )
      ( MAKE-11PILE ?auto_689185 ?auto_689186 ?auto_689187 ?auto_689188 ?auto_689189 ?auto_689190 ?auto_689191 ?auto_689192 ?auto_689193 ?auto_689194 ?auto_689195 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_689231 - BLOCK
      ?auto_689232 - BLOCK
      ?auto_689233 - BLOCK
      ?auto_689234 - BLOCK
      ?auto_689235 - BLOCK
      ?auto_689236 - BLOCK
      ?auto_689237 - BLOCK
      ?auto_689238 - BLOCK
      ?auto_689239 - BLOCK
      ?auto_689240 - BLOCK
      ?auto_689241 - BLOCK
    )
    :vars
    (
      ?auto_689242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689241 ?auto_689242 ) ( ON-TABLE ?auto_689231 ) ( ON ?auto_689232 ?auto_689231 ) ( ON ?auto_689233 ?auto_689232 ) ( ON ?auto_689234 ?auto_689233 ) ( ON ?auto_689235 ?auto_689234 ) ( ON ?auto_689236 ?auto_689235 ) ( ON ?auto_689237 ?auto_689236 ) ( not ( = ?auto_689231 ?auto_689232 ) ) ( not ( = ?auto_689231 ?auto_689233 ) ) ( not ( = ?auto_689231 ?auto_689234 ) ) ( not ( = ?auto_689231 ?auto_689235 ) ) ( not ( = ?auto_689231 ?auto_689236 ) ) ( not ( = ?auto_689231 ?auto_689237 ) ) ( not ( = ?auto_689231 ?auto_689238 ) ) ( not ( = ?auto_689231 ?auto_689239 ) ) ( not ( = ?auto_689231 ?auto_689240 ) ) ( not ( = ?auto_689231 ?auto_689241 ) ) ( not ( = ?auto_689231 ?auto_689242 ) ) ( not ( = ?auto_689232 ?auto_689233 ) ) ( not ( = ?auto_689232 ?auto_689234 ) ) ( not ( = ?auto_689232 ?auto_689235 ) ) ( not ( = ?auto_689232 ?auto_689236 ) ) ( not ( = ?auto_689232 ?auto_689237 ) ) ( not ( = ?auto_689232 ?auto_689238 ) ) ( not ( = ?auto_689232 ?auto_689239 ) ) ( not ( = ?auto_689232 ?auto_689240 ) ) ( not ( = ?auto_689232 ?auto_689241 ) ) ( not ( = ?auto_689232 ?auto_689242 ) ) ( not ( = ?auto_689233 ?auto_689234 ) ) ( not ( = ?auto_689233 ?auto_689235 ) ) ( not ( = ?auto_689233 ?auto_689236 ) ) ( not ( = ?auto_689233 ?auto_689237 ) ) ( not ( = ?auto_689233 ?auto_689238 ) ) ( not ( = ?auto_689233 ?auto_689239 ) ) ( not ( = ?auto_689233 ?auto_689240 ) ) ( not ( = ?auto_689233 ?auto_689241 ) ) ( not ( = ?auto_689233 ?auto_689242 ) ) ( not ( = ?auto_689234 ?auto_689235 ) ) ( not ( = ?auto_689234 ?auto_689236 ) ) ( not ( = ?auto_689234 ?auto_689237 ) ) ( not ( = ?auto_689234 ?auto_689238 ) ) ( not ( = ?auto_689234 ?auto_689239 ) ) ( not ( = ?auto_689234 ?auto_689240 ) ) ( not ( = ?auto_689234 ?auto_689241 ) ) ( not ( = ?auto_689234 ?auto_689242 ) ) ( not ( = ?auto_689235 ?auto_689236 ) ) ( not ( = ?auto_689235 ?auto_689237 ) ) ( not ( = ?auto_689235 ?auto_689238 ) ) ( not ( = ?auto_689235 ?auto_689239 ) ) ( not ( = ?auto_689235 ?auto_689240 ) ) ( not ( = ?auto_689235 ?auto_689241 ) ) ( not ( = ?auto_689235 ?auto_689242 ) ) ( not ( = ?auto_689236 ?auto_689237 ) ) ( not ( = ?auto_689236 ?auto_689238 ) ) ( not ( = ?auto_689236 ?auto_689239 ) ) ( not ( = ?auto_689236 ?auto_689240 ) ) ( not ( = ?auto_689236 ?auto_689241 ) ) ( not ( = ?auto_689236 ?auto_689242 ) ) ( not ( = ?auto_689237 ?auto_689238 ) ) ( not ( = ?auto_689237 ?auto_689239 ) ) ( not ( = ?auto_689237 ?auto_689240 ) ) ( not ( = ?auto_689237 ?auto_689241 ) ) ( not ( = ?auto_689237 ?auto_689242 ) ) ( not ( = ?auto_689238 ?auto_689239 ) ) ( not ( = ?auto_689238 ?auto_689240 ) ) ( not ( = ?auto_689238 ?auto_689241 ) ) ( not ( = ?auto_689238 ?auto_689242 ) ) ( not ( = ?auto_689239 ?auto_689240 ) ) ( not ( = ?auto_689239 ?auto_689241 ) ) ( not ( = ?auto_689239 ?auto_689242 ) ) ( not ( = ?auto_689240 ?auto_689241 ) ) ( not ( = ?auto_689240 ?auto_689242 ) ) ( not ( = ?auto_689241 ?auto_689242 ) ) ( ON ?auto_689240 ?auto_689241 ) ( ON ?auto_689239 ?auto_689240 ) ( CLEAR ?auto_689237 ) ( ON ?auto_689238 ?auto_689239 ) ( CLEAR ?auto_689238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_689231 ?auto_689232 ?auto_689233 ?auto_689234 ?auto_689235 ?auto_689236 ?auto_689237 ?auto_689238 )
      ( MAKE-11PILE ?auto_689231 ?auto_689232 ?auto_689233 ?auto_689234 ?auto_689235 ?auto_689236 ?auto_689237 ?auto_689238 ?auto_689239 ?auto_689240 ?auto_689241 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_689277 - BLOCK
      ?auto_689278 - BLOCK
      ?auto_689279 - BLOCK
      ?auto_689280 - BLOCK
      ?auto_689281 - BLOCK
      ?auto_689282 - BLOCK
      ?auto_689283 - BLOCK
      ?auto_689284 - BLOCK
      ?auto_689285 - BLOCK
      ?auto_689286 - BLOCK
      ?auto_689287 - BLOCK
    )
    :vars
    (
      ?auto_689288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689287 ?auto_689288 ) ( ON-TABLE ?auto_689277 ) ( ON ?auto_689278 ?auto_689277 ) ( ON ?auto_689279 ?auto_689278 ) ( ON ?auto_689280 ?auto_689279 ) ( ON ?auto_689281 ?auto_689280 ) ( ON ?auto_689282 ?auto_689281 ) ( not ( = ?auto_689277 ?auto_689278 ) ) ( not ( = ?auto_689277 ?auto_689279 ) ) ( not ( = ?auto_689277 ?auto_689280 ) ) ( not ( = ?auto_689277 ?auto_689281 ) ) ( not ( = ?auto_689277 ?auto_689282 ) ) ( not ( = ?auto_689277 ?auto_689283 ) ) ( not ( = ?auto_689277 ?auto_689284 ) ) ( not ( = ?auto_689277 ?auto_689285 ) ) ( not ( = ?auto_689277 ?auto_689286 ) ) ( not ( = ?auto_689277 ?auto_689287 ) ) ( not ( = ?auto_689277 ?auto_689288 ) ) ( not ( = ?auto_689278 ?auto_689279 ) ) ( not ( = ?auto_689278 ?auto_689280 ) ) ( not ( = ?auto_689278 ?auto_689281 ) ) ( not ( = ?auto_689278 ?auto_689282 ) ) ( not ( = ?auto_689278 ?auto_689283 ) ) ( not ( = ?auto_689278 ?auto_689284 ) ) ( not ( = ?auto_689278 ?auto_689285 ) ) ( not ( = ?auto_689278 ?auto_689286 ) ) ( not ( = ?auto_689278 ?auto_689287 ) ) ( not ( = ?auto_689278 ?auto_689288 ) ) ( not ( = ?auto_689279 ?auto_689280 ) ) ( not ( = ?auto_689279 ?auto_689281 ) ) ( not ( = ?auto_689279 ?auto_689282 ) ) ( not ( = ?auto_689279 ?auto_689283 ) ) ( not ( = ?auto_689279 ?auto_689284 ) ) ( not ( = ?auto_689279 ?auto_689285 ) ) ( not ( = ?auto_689279 ?auto_689286 ) ) ( not ( = ?auto_689279 ?auto_689287 ) ) ( not ( = ?auto_689279 ?auto_689288 ) ) ( not ( = ?auto_689280 ?auto_689281 ) ) ( not ( = ?auto_689280 ?auto_689282 ) ) ( not ( = ?auto_689280 ?auto_689283 ) ) ( not ( = ?auto_689280 ?auto_689284 ) ) ( not ( = ?auto_689280 ?auto_689285 ) ) ( not ( = ?auto_689280 ?auto_689286 ) ) ( not ( = ?auto_689280 ?auto_689287 ) ) ( not ( = ?auto_689280 ?auto_689288 ) ) ( not ( = ?auto_689281 ?auto_689282 ) ) ( not ( = ?auto_689281 ?auto_689283 ) ) ( not ( = ?auto_689281 ?auto_689284 ) ) ( not ( = ?auto_689281 ?auto_689285 ) ) ( not ( = ?auto_689281 ?auto_689286 ) ) ( not ( = ?auto_689281 ?auto_689287 ) ) ( not ( = ?auto_689281 ?auto_689288 ) ) ( not ( = ?auto_689282 ?auto_689283 ) ) ( not ( = ?auto_689282 ?auto_689284 ) ) ( not ( = ?auto_689282 ?auto_689285 ) ) ( not ( = ?auto_689282 ?auto_689286 ) ) ( not ( = ?auto_689282 ?auto_689287 ) ) ( not ( = ?auto_689282 ?auto_689288 ) ) ( not ( = ?auto_689283 ?auto_689284 ) ) ( not ( = ?auto_689283 ?auto_689285 ) ) ( not ( = ?auto_689283 ?auto_689286 ) ) ( not ( = ?auto_689283 ?auto_689287 ) ) ( not ( = ?auto_689283 ?auto_689288 ) ) ( not ( = ?auto_689284 ?auto_689285 ) ) ( not ( = ?auto_689284 ?auto_689286 ) ) ( not ( = ?auto_689284 ?auto_689287 ) ) ( not ( = ?auto_689284 ?auto_689288 ) ) ( not ( = ?auto_689285 ?auto_689286 ) ) ( not ( = ?auto_689285 ?auto_689287 ) ) ( not ( = ?auto_689285 ?auto_689288 ) ) ( not ( = ?auto_689286 ?auto_689287 ) ) ( not ( = ?auto_689286 ?auto_689288 ) ) ( not ( = ?auto_689287 ?auto_689288 ) ) ( ON ?auto_689286 ?auto_689287 ) ( ON ?auto_689285 ?auto_689286 ) ( ON ?auto_689284 ?auto_689285 ) ( CLEAR ?auto_689282 ) ( ON ?auto_689283 ?auto_689284 ) ( CLEAR ?auto_689283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_689277 ?auto_689278 ?auto_689279 ?auto_689280 ?auto_689281 ?auto_689282 ?auto_689283 )
      ( MAKE-11PILE ?auto_689277 ?auto_689278 ?auto_689279 ?auto_689280 ?auto_689281 ?auto_689282 ?auto_689283 ?auto_689284 ?auto_689285 ?auto_689286 ?auto_689287 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_689323 - BLOCK
      ?auto_689324 - BLOCK
      ?auto_689325 - BLOCK
      ?auto_689326 - BLOCK
      ?auto_689327 - BLOCK
      ?auto_689328 - BLOCK
      ?auto_689329 - BLOCK
      ?auto_689330 - BLOCK
      ?auto_689331 - BLOCK
      ?auto_689332 - BLOCK
      ?auto_689333 - BLOCK
    )
    :vars
    (
      ?auto_689334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689333 ?auto_689334 ) ( ON-TABLE ?auto_689323 ) ( ON ?auto_689324 ?auto_689323 ) ( ON ?auto_689325 ?auto_689324 ) ( ON ?auto_689326 ?auto_689325 ) ( ON ?auto_689327 ?auto_689326 ) ( not ( = ?auto_689323 ?auto_689324 ) ) ( not ( = ?auto_689323 ?auto_689325 ) ) ( not ( = ?auto_689323 ?auto_689326 ) ) ( not ( = ?auto_689323 ?auto_689327 ) ) ( not ( = ?auto_689323 ?auto_689328 ) ) ( not ( = ?auto_689323 ?auto_689329 ) ) ( not ( = ?auto_689323 ?auto_689330 ) ) ( not ( = ?auto_689323 ?auto_689331 ) ) ( not ( = ?auto_689323 ?auto_689332 ) ) ( not ( = ?auto_689323 ?auto_689333 ) ) ( not ( = ?auto_689323 ?auto_689334 ) ) ( not ( = ?auto_689324 ?auto_689325 ) ) ( not ( = ?auto_689324 ?auto_689326 ) ) ( not ( = ?auto_689324 ?auto_689327 ) ) ( not ( = ?auto_689324 ?auto_689328 ) ) ( not ( = ?auto_689324 ?auto_689329 ) ) ( not ( = ?auto_689324 ?auto_689330 ) ) ( not ( = ?auto_689324 ?auto_689331 ) ) ( not ( = ?auto_689324 ?auto_689332 ) ) ( not ( = ?auto_689324 ?auto_689333 ) ) ( not ( = ?auto_689324 ?auto_689334 ) ) ( not ( = ?auto_689325 ?auto_689326 ) ) ( not ( = ?auto_689325 ?auto_689327 ) ) ( not ( = ?auto_689325 ?auto_689328 ) ) ( not ( = ?auto_689325 ?auto_689329 ) ) ( not ( = ?auto_689325 ?auto_689330 ) ) ( not ( = ?auto_689325 ?auto_689331 ) ) ( not ( = ?auto_689325 ?auto_689332 ) ) ( not ( = ?auto_689325 ?auto_689333 ) ) ( not ( = ?auto_689325 ?auto_689334 ) ) ( not ( = ?auto_689326 ?auto_689327 ) ) ( not ( = ?auto_689326 ?auto_689328 ) ) ( not ( = ?auto_689326 ?auto_689329 ) ) ( not ( = ?auto_689326 ?auto_689330 ) ) ( not ( = ?auto_689326 ?auto_689331 ) ) ( not ( = ?auto_689326 ?auto_689332 ) ) ( not ( = ?auto_689326 ?auto_689333 ) ) ( not ( = ?auto_689326 ?auto_689334 ) ) ( not ( = ?auto_689327 ?auto_689328 ) ) ( not ( = ?auto_689327 ?auto_689329 ) ) ( not ( = ?auto_689327 ?auto_689330 ) ) ( not ( = ?auto_689327 ?auto_689331 ) ) ( not ( = ?auto_689327 ?auto_689332 ) ) ( not ( = ?auto_689327 ?auto_689333 ) ) ( not ( = ?auto_689327 ?auto_689334 ) ) ( not ( = ?auto_689328 ?auto_689329 ) ) ( not ( = ?auto_689328 ?auto_689330 ) ) ( not ( = ?auto_689328 ?auto_689331 ) ) ( not ( = ?auto_689328 ?auto_689332 ) ) ( not ( = ?auto_689328 ?auto_689333 ) ) ( not ( = ?auto_689328 ?auto_689334 ) ) ( not ( = ?auto_689329 ?auto_689330 ) ) ( not ( = ?auto_689329 ?auto_689331 ) ) ( not ( = ?auto_689329 ?auto_689332 ) ) ( not ( = ?auto_689329 ?auto_689333 ) ) ( not ( = ?auto_689329 ?auto_689334 ) ) ( not ( = ?auto_689330 ?auto_689331 ) ) ( not ( = ?auto_689330 ?auto_689332 ) ) ( not ( = ?auto_689330 ?auto_689333 ) ) ( not ( = ?auto_689330 ?auto_689334 ) ) ( not ( = ?auto_689331 ?auto_689332 ) ) ( not ( = ?auto_689331 ?auto_689333 ) ) ( not ( = ?auto_689331 ?auto_689334 ) ) ( not ( = ?auto_689332 ?auto_689333 ) ) ( not ( = ?auto_689332 ?auto_689334 ) ) ( not ( = ?auto_689333 ?auto_689334 ) ) ( ON ?auto_689332 ?auto_689333 ) ( ON ?auto_689331 ?auto_689332 ) ( ON ?auto_689330 ?auto_689331 ) ( ON ?auto_689329 ?auto_689330 ) ( CLEAR ?auto_689327 ) ( ON ?auto_689328 ?auto_689329 ) ( CLEAR ?auto_689328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_689323 ?auto_689324 ?auto_689325 ?auto_689326 ?auto_689327 ?auto_689328 )
      ( MAKE-11PILE ?auto_689323 ?auto_689324 ?auto_689325 ?auto_689326 ?auto_689327 ?auto_689328 ?auto_689329 ?auto_689330 ?auto_689331 ?auto_689332 ?auto_689333 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_689369 - BLOCK
      ?auto_689370 - BLOCK
      ?auto_689371 - BLOCK
      ?auto_689372 - BLOCK
      ?auto_689373 - BLOCK
      ?auto_689374 - BLOCK
      ?auto_689375 - BLOCK
      ?auto_689376 - BLOCK
      ?auto_689377 - BLOCK
      ?auto_689378 - BLOCK
      ?auto_689379 - BLOCK
    )
    :vars
    (
      ?auto_689380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689379 ?auto_689380 ) ( ON-TABLE ?auto_689369 ) ( ON ?auto_689370 ?auto_689369 ) ( ON ?auto_689371 ?auto_689370 ) ( ON ?auto_689372 ?auto_689371 ) ( not ( = ?auto_689369 ?auto_689370 ) ) ( not ( = ?auto_689369 ?auto_689371 ) ) ( not ( = ?auto_689369 ?auto_689372 ) ) ( not ( = ?auto_689369 ?auto_689373 ) ) ( not ( = ?auto_689369 ?auto_689374 ) ) ( not ( = ?auto_689369 ?auto_689375 ) ) ( not ( = ?auto_689369 ?auto_689376 ) ) ( not ( = ?auto_689369 ?auto_689377 ) ) ( not ( = ?auto_689369 ?auto_689378 ) ) ( not ( = ?auto_689369 ?auto_689379 ) ) ( not ( = ?auto_689369 ?auto_689380 ) ) ( not ( = ?auto_689370 ?auto_689371 ) ) ( not ( = ?auto_689370 ?auto_689372 ) ) ( not ( = ?auto_689370 ?auto_689373 ) ) ( not ( = ?auto_689370 ?auto_689374 ) ) ( not ( = ?auto_689370 ?auto_689375 ) ) ( not ( = ?auto_689370 ?auto_689376 ) ) ( not ( = ?auto_689370 ?auto_689377 ) ) ( not ( = ?auto_689370 ?auto_689378 ) ) ( not ( = ?auto_689370 ?auto_689379 ) ) ( not ( = ?auto_689370 ?auto_689380 ) ) ( not ( = ?auto_689371 ?auto_689372 ) ) ( not ( = ?auto_689371 ?auto_689373 ) ) ( not ( = ?auto_689371 ?auto_689374 ) ) ( not ( = ?auto_689371 ?auto_689375 ) ) ( not ( = ?auto_689371 ?auto_689376 ) ) ( not ( = ?auto_689371 ?auto_689377 ) ) ( not ( = ?auto_689371 ?auto_689378 ) ) ( not ( = ?auto_689371 ?auto_689379 ) ) ( not ( = ?auto_689371 ?auto_689380 ) ) ( not ( = ?auto_689372 ?auto_689373 ) ) ( not ( = ?auto_689372 ?auto_689374 ) ) ( not ( = ?auto_689372 ?auto_689375 ) ) ( not ( = ?auto_689372 ?auto_689376 ) ) ( not ( = ?auto_689372 ?auto_689377 ) ) ( not ( = ?auto_689372 ?auto_689378 ) ) ( not ( = ?auto_689372 ?auto_689379 ) ) ( not ( = ?auto_689372 ?auto_689380 ) ) ( not ( = ?auto_689373 ?auto_689374 ) ) ( not ( = ?auto_689373 ?auto_689375 ) ) ( not ( = ?auto_689373 ?auto_689376 ) ) ( not ( = ?auto_689373 ?auto_689377 ) ) ( not ( = ?auto_689373 ?auto_689378 ) ) ( not ( = ?auto_689373 ?auto_689379 ) ) ( not ( = ?auto_689373 ?auto_689380 ) ) ( not ( = ?auto_689374 ?auto_689375 ) ) ( not ( = ?auto_689374 ?auto_689376 ) ) ( not ( = ?auto_689374 ?auto_689377 ) ) ( not ( = ?auto_689374 ?auto_689378 ) ) ( not ( = ?auto_689374 ?auto_689379 ) ) ( not ( = ?auto_689374 ?auto_689380 ) ) ( not ( = ?auto_689375 ?auto_689376 ) ) ( not ( = ?auto_689375 ?auto_689377 ) ) ( not ( = ?auto_689375 ?auto_689378 ) ) ( not ( = ?auto_689375 ?auto_689379 ) ) ( not ( = ?auto_689375 ?auto_689380 ) ) ( not ( = ?auto_689376 ?auto_689377 ) ) ( not ( = ?auto_689376 ?auto_689378 ) ) ( not ( = ?auto_689376 ?auto_689379 ) ) ( not ( = ?auto_689376 ?auto_689380 ) ) ( not ( = ?auto_689377 ?auto_689378 ) ) ( not ( = ?auto_689377 ?auto_689379 ) ) ( not ( = ?auto_689377 ?auto_689380 ) ) ( not ( = ?auto_689378 ?auto_689379 ) ) ( not ( = ?auto_689378 ?auto_689380 ) ) ( not ( = ?auto_689379 ?auto_689380 ) ) ( ON ?auto_689378 ?auto_689379 ) ( ON ?auto_689377 ?auto_689378 ) ( ON ?auto_689376 ?auto_689377 ) ( ON ?auto_689375 ?auto_689376 ) ( ON ?auto_689374 ?auto_689375 ) ( CLEAR ?auto_689372 ) ( ON ?auto_689373 ?auto_689374 ) ( CLEAR ?auto_689373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_689369 ?auto_689370 ?auto_689371 ?auto_689372 ?auto_689373 )
      ( MAKE-11PILE ?auto_689369 ?auto_689370 ?auto_689371 ?auto_689372 ?auto_689373 ?auto_689374 ?auto_689375 ?auto_689376 ?auto_689377 ?auto_689378 ?auto_689379 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_689415 - BLOCK
      ?auto_689416 - BLOCK
      ?auto_689417 - BLOCK
      ?auto_689418 - BLOCK
      ?auto_689419 - BLOCK
      ?auto_689420 - BLOCK
      ?auto_689421 - BLOCK
      ?auto_689422 - BLOCK
      ?auto_689423 - BLOCK
      ?auto_689424 - BLOCK
      ?auto_689425 - BLOCK
    )
    :vars
    (
      ?auto_689426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689425 ?auto_689426 ) ( ON-TABLE ?auto_689415 ) ( ON ?auto_689416 ?auto_689415 ) ( ON ?auto_689417 ?auto_689416 ) ( not ( = ?auto_689415 ?auto_689416 ) ) ( not ( = ?auto_689415 ?auto_689417 ) ) ( not ( = ?auto_689415 ?auto_689418 ) ) ( not ( = ?auto_689415 ?auto_689419 ) ) ( not ( = ?auto_689415 ?auto_689420 ) ) ( not ( = ?auto_689415 ?auto_689421 ) ) ( not ( = ?auto_689415 ?auto_689422 ) ) ( not ( = ?auto_689415 ?auto_689423 ) ) ( not ( = ?auto_689415 ?auto_689424 ) ) ( not ( = ?auto_689415 ?auto_689425 ) ) ( not ( = ?auto_689415 ?auto_689426 ) ) ( not ( = ?auto_689416 ?auto_689417 ) ) ( not ( = ?auto_689416 ?auto_689418 ) ) ( not ( = ?auto_689416 ?auto_689419 ) ) ( not ( = ?auto_689416 ?auto_689420 ) ) ( not ( = ?auto_689416 ?auto_689421 ) ) ( not ( = ?auto_689416 ?auto_689422 ) ) ( not ( = ?auto_689416 ?auto_689423 ) ) ( not ( = ?auto_689416 ?auto_689424 ) ) ( not ( = ?auto_689416 ?auto_689425 ) ) ( not ( = ?auto_689416 ?auto_689426 ) ) ( not ( = ?auto_689417 ?auto_689418 ) ) ( not ( = ?auto_689417 ?auto_689419 ) ) ( not ( = ?auto_689417 ?auto_689420 ) ) ( not ( = ?auto_689417 ?auto_689421 ) ) ( not ( = ?auto_689417 ?auto_689422 ) ) ( not ( = ?auto_689417 ?auto_689423 ) ) ( not ( = ?auto_689417 ?auto_689424 ) ) ( not ( = ?auto_689417 ?auto_689425 ) ) ( not ( = ?auto_689417 ?auto_689426 ) ) ( not ( = ?auto_689418 ?auto_689419 ) ) ( not ( = ?auto_689418 ?auto_689420 ) ) ( not ( = ?auto_689418 ?auto_689421 ) ) ( not ( = ?auto_689418 ?auto_689422 ) ) ( not ( = ?auto_689418 ?auto_689423 ) ) ( not ( = ?auto_689418 ?auto_689424 ) ) ( not ( = ?auto_689418 ?auto_689425 ) ) ( not ( = ?auto_689418 ?auto_689426 ) ) ( not ( = ?auto_689419 ?auto_689420 ) ) ( not ( = ?auto_689419 ?auto_689421 ) ) ( not ( = ?auto_689419 ?auto_689422 ) ) ( not ( = ?auto_689419 ?auto_689423 ) ) ( not ( = ?auto_689419 ?auto_689424 ) ) ( not ( = ?auto_689419 ?auto_689425 ) ) ( not ( = ?auto_689419 ?auto_689426 ) ) ( not ( = ?auto_689420 ?auto_689421 ) ) ( not ( = ?auto_689420 ?auto_689422 ) ) ( not ( = ?auto_689420 ?auto_689423 ) ) ( not ( = ?auto_689420 ?auto_689424 ) ) ( not ( = ?auto_689420 ?auto_689425 ) ) ( not ( = ?auto_689420 ?auto_689426 ) ) ( not ( = ?auto_689421 ?auto_689422 ) ) ( not ( = ?auto_689421 ?auto_689423 ) ) ( not ( = ?auto_689421 ?auto_689424 ) ) ( not ( = ?auto_689421 ?auto_689425 ) ) ( not ( = ?auto_689421 ?auto_689426 ) ) ( not ( = ?auto_689422 ?auto_689423 ) ) ( not ( = ?auto_689422 ?auto_689424 ) ) ( not ( = ?auto_689422 ?auto_689425 ) ) ( not ( = ?auto_689422 ?auto_689426 ) ) ( not ( = ?auto_689423 ?auto_689424 ) ) ( not ( = ?auto_689423 ?auto_689425 ) ) ( not ( = ?auto_689423 ?auto_689426 ) ) ( not ( = ?auto_689424 ?auto_689425 ) ) ( not ( = ?auto_689424 ?auto_689426 ) ) ( not ( = ?auto_689425 ?auto_689426 ) ) ( ON ?auto_689424 ?auto_689425 ) ( ON ?auto_689423 ?auto_689424 ) ( ON ?auto_689422 ?auto_689423 ) ( ON ?auto_689421 ?auto_689422 ) ( ON ?auto_689420 ?auto_689421 ) ( ON ?auto_689419 ?auto_689420 ) ( CLEAR ?auto_689417 ) ( ON ?auto_689418 ?auto_689419 ) ( CLEAR ?auto_689418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_689415 ?auto_689416 ?auto_689417 ?auto_689418 )
      ( MAKE-11PILE ?auto_689415 ?auto_689416 ?auto_689417 ?auto_689418 ?auto_689419 ?auto_689420 ?auto_689421 ?auto_689422 ?auto_689423 ?auto_689424 ?auto_689425 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_689461 - BLOCK
      ?auto_689462 - BLOCK
      ?auto_689463 - BLOCK
      ?auto_689464 - BLOCK
      ?auto_689465 - BLOCK
      ?auto_689466 - BLOCK
      ?auto_689467 - BLOCK
      ?auto_689468 - BLOCK
      ?auto_689469 - BLOCK
      ?auto_689470 - BLOCK
      ?auto_689471 - BLOCK
    )
    :vars
    (
      ?auto_689472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689471 ?auto_689472 ) ( ON-TABLE ?auto_689461 ) ( ON ?auto_689462 ?auto_689461 ) ( not ( = ?auto_689461 ?auto_689462 ) ) ( not ( = ?auto_689461 ?auto_689463 ) ) ( not ( = ?auto_689461 ?auto_689464 ) ) ( not ( = ?auto_689461 ?auto_689465 ) ) ( not ( = ?auto_689461 ?auto_689466 ) ) ( not ( = ?auto_689461 ?auto_689467 ) ) ( not ( = ?auto_689461 ?auto_689468 ) ) ( not ( = ?auto_689461 ?auto_689469 ) ) ( not ( = ?auto_689461 ?auto_689470 ) ) ( not ( = ?auto_689461 ?auto_689471 ) ) ( not ( = ?auto_689461 ?auto_689472 ) ) ( not ( = ?auto_689462 ?auto_689463 ) ) ( not ( = ?auto_689462 ?auto_689464 ) ) ( not ( = ?auto_689462 ?auto_689465 ) ) ( not ( = ?auto_689462 ?auto_689466 ) ) ( not ( = ?auto_689462 ?auto_689467 ) ) ( not ( = ?auto_689462 ?auto_689468 ) ) ( not ( = ?auto_689462 ?auto_689469 ) ) ( not ( = ?auto_689462 ?auto_689470 ) ) ( not ( = ?auto_689462 ?auto_689471 ) ) ( not ( = ?auto_689462 ?auto_689472 ) ) ( not ( = ?auto_689463 ?auto_689464 ) ) ( not ( = ?auto_689463 ?auto_689465 ) ) ( not ( = ?auto_689463 ?auto_689466 ) ) ( not ( = ?auto_689463 ?auto_689467 ) ) ( not ( = ?auto_689463 ?auto_689468 ) ) ( not ( = ?auto_689463 ?auto_689469 ) ) ( not ( = ?auto_689463 ?auto_689470 ) ) ( not ( = ?auto_689463 ?auto_689471 ) ) ( not ( = ?auto_689463 ?auto_689472 ) ) ( not ( = ?auto_689464 ?auto_689465 ) ) ( not ( = ?auto_689464 ?auto_689466 ) ) ( not ( = ?auto_689464 ?auto_689467 ) ) ( not ( = ?auto_689464 ?auto_689468 ) ) ( not ( = ?auto_689464 ?auto_689469 ) ) ( not ( = ?auto_689464 ?auto_689470 ) ) ( not ( = ?auto_689464 ?auto_689471 ) ) ( not ( = ?auto_689464 ?auto_689472 ) ) ( not ( = ?auto_689465 ?auto_689466 ) ) ( not ( = ?auto_689465 ?auto_689467 ) ) ( not ( = ?auto_689465 ?auto_689468 ) ) ( not ( = ?auto_689465 ?auto_689469 ) ) ( not ( = ?auto_689465 ?auto_689470 ) ) ( not ( = ?auto_689465 ?auto_689471 ) ) ( not ( = ?auto_689465 ?auto_689472 ) ) ( not ( = ?auto_689466 ?auto_689467 ) ) ( not ( = ?auto_689466 ?auto_689468 ) ) ( not ( = ?auto_689466 ?auto_689469 ) ) ( not ( = ?auto_689466 ?auto_689470 ) ) ( not ( = ?auto_689466 ?auto_689471 ) ) ( not ( = ?auto_689466 ?auto_689472 ) ) ( not ( = ?auto_689467 ?auto_689468 ) ) ( not ( = ?auto_689467 ?auto_689469 ) ) ( not ( = ?auto_689467 ?auto_689470 ) ) ( not ( = ?auto_689467 ?auto_689471 ) ) ( not ( = ?auto_689467 ?auto_689472 ) ) ( not ( = ?auto_689468 ?auto_689469 ) ) ( not ( = ?auto_689468 ?auto_689470 ) ) ( not ( = ?auto_689468 ?auto_689471 ) ) ( not ( = ?auto_689468 ?auto_689472 ) ) ( not ( = ?auto_689469 ?auto_689470 ) ) ( not ( = ?auto_689469 ?auto_689471 ) ) ( not ( = ?auto_689469 ?auto_689472 ) ) ( not ( = ?auto_689470 ?auto_689471 ) ) ( not ( = ?auto_689470 ?auto_689472 ) ) ( not ( = ?auto_689471 ?auto_689472 ) ) ( ON ?auto_689470 ?auto_689471 ) ( ON ?auto_689469 ?auto_689470 ) ( ON ?auto_689468 ?auto_689469 ) ( ON ?auto_689467 ?auto_689468 ) ( ON ?auto_689466 ?auto_689467 ) ( ON ?auto_689465 ?auto_689466 ) ( ON ?auto_689464 ?auto_689465 ) ( CLEAR ?auto_689462 ) ( ON ?auto_689463 ?auto_689464 ) ( CLEAR ?auto_689463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_689461 ?auto_689462 ?auto_689463 )
      ( MAKE-11PILE ?auto_689461 ?auto_689462 ?auto_689463 ?auto_689464 ?auto_689465 ?auto_689466 ?auto_689467 ?auto_689468 ?auto_689469 ?auto_689470 ?auto_689471 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_689507 - BLOCK
      ?auto_689508 - BLOCK
      ?auto_689509 - BLOCK
      ?auto_689510 - BLOCK
      ?auto_689511 - BLOCK
      ?auto_689512 - BLOCK
      ?auto_689513 - BLOCK
      ?auto_689514 - BLOCK
      ?auto_689515 - BLOCK
      ?auto_689516 - BLOCK
      ?auto_689517 - BLOCK
    )
    :vars
    (
      ?auto_689518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689517 ?auto_689518 ) ( ON-TABLE ?auto_689507 ) ( not ( = ?auto_689507 ?auto_689508 ) ) ( not ( = ?auto_689507 ?auto_689509 ) ) ( not ( = ?auto_689507 ?auto_689510 ) ) ( not ( = ?auto_689507 ?auto_689511 ) ) ( not ( = ?auto_689507 ?auto_689512 ) ) ( not ( = ?auto_689507 ?auto_689513 ) ) ( not ( = ?auto_689507 ?auto_689514 ) ) ( not ( = ?auto_689507 ?auto_689515 ) ) ( not ( = ?auto_689507 ?auto_689516 ) ) ( not ( = ?auto_689507 ?auto_689517 ) ) ( not ( = ?auto_689507 ?auto_689518 ) ) ( not ( = ?auto_689508 ?auto_689509 ) ) ( not ( = ?auto_689508 ?auto_689510 ) ) ( not ( = ?auto_689508 ?auto_689511 ) ) ( not ( = ?auto_689508 ?auto_689512 ) ) ( not ( = ?auto_689508 ?auto_689513 ) ) ( not ( = ?auto_689508 ?auto_689514 ) ) ( not ( = ?auto_689508 ?auto_689515 ) ) ( not ( = ?auto_689508 ?auto_689516 ) ) ( not ( = ?auto_689508 ?auto_689517 ) ) ( not ( = ?auto_689508 ?auto_689518 ) ) ( not ( = ?auto_689509 ?auto_689510 ) ) ( not ( = ?auto_689509 ?auto_689511 ) ) ( not ( = ?auto_689509 ?auto_689512 ) ) ( not ( = ?auto_689509 ?auto_689513 ) ) ( not ( = ?auto_689509 ?auto_689514 ) ) ( not ( = ?auto_689509 ?auto_689515 ) ) ( not ( = ?auto_689509 ?auto_689516 ) ) ( not ( = ?auto_689509 ?auto_689517 ) ) ( not ( = ?auto_689509 ?auto_689518 ) ) ( not ( = ?auto_689510 ?auto_689511 ) ) ( not ( = ?auto_689510 ?auto_689512 ) ) ( not ( = ?auto_689510 ?auto_689513 ) ) ( not ( = ?auto_689510 ?auto_689514 ) ) ( not ( = ?auto_689510 ?auto_689515 ) ) ( not ( = ?auto_689510 ?auto_689516 ) ) ( not ( = ?auto_689510 ?auto_689517 ) ) ( not ( = ?auto_689510 ?auto_689518 ) ) ( not ( = ?auto_689511 ?auto_689512 ) ) ( not ( = ?auto_689511 ?auto_689513 ) ) ( not ( = ?auto_689511 ?auto_689514 ) ) ( not ( = ?auto_689511 ?auto_689515 ) ) ( not ( = ?auto_689511 ?auto_689516 ) ) ( not ( = ?auto_689511 ?auto_689517 ) ) ( not ( = ?auto_689511 ?auto_689518 ) ) ( not ( = ?auto_689512 ?auto_689513 ) ) ( not ( = ?auto_689512 ?auto_689514 ) ) ( not ( = ?auto_689512 ?auto_689515 ) ) ( not ( = ?auto_689512 ?auto_689516 ) ) ( not ( = ?auto_689512 ?auto_689517 ) ) ( not ( = ?auto_689512 ?auto_689518 ) ) ( not ( = ?auto_689513 ?auto_689514 ) ) ( not ( = ?auto_689513 ?auto_689515 ) ) ( not ( = ?auto_689513 ?auto_689516 ) ) ( not ( = ?auto_689513 ?auto_689517 ) ) ( not ( = ?auto_689513 ?auto_689518 ) ) ( not ( = ?auto_689514 ?auto_689515 ) ) ( not ( = ?auto_689514 ?auto_689516 ) ) ( not ( = ?auto_689514 ?auto_689517 ) ) ( not ( = ?auto_689514 ?auto_689518 ) ) ( not ( = ?auto_689515 ?auto_689516 ) ) ( not ( = ?auto_689515 ?auto_689517 ) ) ( not ( = ?auto_689515 ?auto_689518 ) ) ( not ( = ?auto_689516 ?auto_689517 ) ) ( not ( = ?auto_689516 ?auto_689518 ) ) ( not ( = ?auto_689517 ?auto_689518 ) ) ( ON ?auto_689516 ?auto_689517 ) ( ON ?auto_689515 ?auto_689516 ) ( ON ?auto_689514 ?auto_689515 ) ( ON ?auto_689513 ?auto_689514 ) ( ON ?auto_689512 ?auto_689513 ) ( ON ?auto_689511 ?auto_689512 ) ( ON ?auto_689510 ?auto_689511 ) ( ON ?auto_689509 ?auto_689510 ) ( CLEAR ?auto_689507 ) ( ON ?auto_689508 ?auto_689509 ) ( CLEAR ?auto_689508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_689507 ?auto_689508 )
      ( MAKE-11PILE ?auto_689507 ?auto_689508 ?auto_689509 ?auto_689510 ?auto_689511 ?auto_689512 ?auto_689513 ?auto_689514 ?auto_689515 ?auto_689516 ?auto_689517 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_689553 - BLOCK
      ?auto_689554 - BLOCK
      ?auto_689555 - BLOCK
      ?auto_689556 - BLOCK
      ?auto_689557 - BLOCK
      ?auto_689558 - BLOCK
      ?auto_689559 - BLOCK
      ?auto_689560 - BLOCK
      ?auto_689561 - BLOCK
      ?auto_689562 - BLOCK
      ?auto_689563 - BLOCK
    )
    :vars
    (
      ?auto_689564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689563 ?auto_689564 ) ( not ( = ?auto_689553 ?auto_689554 ) ) ( not ( = ?auto_689553 ?auto_689555 ) ) ( not ( = ?auto_689553 ?auto_689556 ) ) ( not ( = ?auto_689553 ?auto_689557 ) ) ( not ( = ?auto_689553 ?auto_689558 ) ) ( not ( = ?auto_689553 ?auto_689559 ) ) ( not ( = ?auto_689553 ?auto_689560 ) ) ( not ( = ?auto_689553 ?auto_689561 ) ) ( not ( = ?auto_689553 ?auto_689562 ) ) ( not ( = ?auto_689553 ?auto_689563 ) ) ( not ( = ?auto_689553 ?auto_689564 ) ) ( not ( = ?auto_689554 ?auto_689555 ) ) ( not ( = ?auto_689554 ?auto_689556 ) ) ( not ( = ?auto_689554 ?auto_689557 ) ) ( not ( = ?auto_689554 ?auto_689558 ) ) ( not ( = ?auto_689554 ?auto_689559 ) ) ( not ( = ?auto_689554 ?auto_689560 ) ) ( not ( = ?auto_689554 ?auto_689561 ) ) ( not ( = ?auto_689554 ?auto_689562 ) ) ( not ( = ?auto_689554 ?auto_689563 ) ) ( not ( = ?auto_689554 ?auto_689564 ) ) ( not ( = ?auto_689555 ?auto_689556 ) ) ( not ( = ?auto_689555 ?auto_689557 ) ) ( not ( = ?auto_689555 ?auto_689558 ) ) ( not ( = ?auto_689555 ?auto_689559 ) ) ( not ( = ?auto_689555 ?auto_689560 ) ) ( not ( = ?auto_689555 ?auto_689561 ) ) ( not ( = ?auto_689555 ?auto_689562 ) ) ( not ( = ?auto_689555 ?auto_689563 ) ) ( not ( = ?auto_689555 ?auto_689564 ) ) ( not ( = ?auto_689556 ?auto_689557 ) ) ( not ( = ?auto_689556 ?auto_689558 ) ) ( not ( = ?auto_689556 ?auto_689559 ) ) ( not ( = ?auto_689556 ?auto_689560 ) ) ( not ( = ?auto_689556 ?auto_689561 ) ) ( not ( = ?auto_689556 ?auto_689562 ) ) ( not ( = ?auto_689556 ?auto_689563 ) ) ( not ( = ?auto_689556 ?auto_689564 ) ) ( not ( = ?auto_689557 ?auto_689558 ) ) ( not ( = ?auto_689557 ?auto_689559 ) ) ( not ( = ?auto_689557 ?auto_689560 ) ) ( not ( = ?auto_689557 ?auto_689561 ) ) ( not ( = ?auto_689557 ?auto_689562 ) ) ( not ( = ?auto_689557 ?auto_689563 ) ) ( not ( = ?auto_689557 ?auto_689564 ) ) ( not ( = ?auto_689558 ?auto_689559 ) ) ( not ( = ?auto_689558 ?auto_689560 ) ) ( not ( = ?auto_689558 ?auto_689561 ) ) ( not ( = ?auto_689558 ?auto_689562 ) ) ( not ( = ?auto_689558 ?auto_689563 ) ) ( not ( = ?auto_689558 ?auto_689564 ) ) ( not ( = ?auto_689559 ?auto_689560 ) ) ( not ( = ?auto_689559 ?auto_689561 ) ) ( not ( = ?auto_689559 ?auto_689562 ) ) ( not ( = ?auto_689559 ?auto_689563 ) ) ( not ( = ?auto_689559 ?auto_689564 ) ) ( not ( = ?auto_689560 ?auto_689561 ) ) ( not ( = ?auto_689560 ?auto_689562 ) ) ( not ( = ?auto_689560 ?auto_689563 ) ) ( not ( = ?auto_689560 ?auto_689564 ) ) ( not ( = ?auto_689561 ?auto_689562 ) ) ( not ( = ?auto_689561 ?auto_689563 ) ) ( not ( = ?auto_689561 ?auto_689564 ) ) ( not ( = ?auto_689562 ?auto_689563 ) ) ( not ( = ?auto_689562 ?auto_689564 ) ) ( not ( = ?auto_689563 ?auto_689564 ) ) ( ON ?auto_689562 ?auto_689563 ) ( ON ?auto_689561 ?auto_689562 ) ( ON ?auto_689560 ?auto_689561 ) ( ON ?auto_689559 ?auto_689560 ) ( ON ?auto_689558 ?auto_689559 ) ( ON ?auto_689557 ?auto_689558 ) ( ON ?auto_689556 ?auto_689557 ) ( ON ?auto_689555 ?auto_689556 ) ( ON ?auto_689554 ?auto_689555 ) ( ON ?auto_689553 ?auto_689554 ) ( CLEAR ?auto_689553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_689553 )
      ( MAKE-11PILE ?auto_689553 ?auto_689554 ?auto_689555 ?auto_689556 ?auto_689557 ?auto_689558 ?auto_689559 ?auto_689560 ?auto_689561 ?auto_689562 ?auto_689563 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_689600 - BLOCK
      ?auto_689601 - BLOCK
      ?auto_689602 - BLOCK
      ?auto_689603 - BLOCK
      ?auto_689604 - BLOCK
      ?auto_689605 - BLOCK
      ?auto_689606 - BLOCK
      ?auto_689607 - BLOCK
      ?auto_689608 - BLOCK
      ?auto_689609 - BLOCK
      ?auto_689610 - BLOCK
      ?auto_689611 - BLOCK
    )
    :vars
    (
      ?auto_689612 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_689610 ) ( ON ?auto_689611 ?auto_689612 ) ( CLEAR ?auto_689611 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_689600 ) ( ON ?auto_689601 ?auto_689600 ) ( ON ?auto_689602 ?auto_689601 ) ( ON ?auto_689603 ?auto_689602 ) ( ON ?auto_689604 ?auto_689603 ) ( ON ?auto_689605 ?auto_689604 ) ( ON ?auto_689606 ?auto_689605 ) ( ON ?auto_689607 ?auto_689606 ) ( ON ?auto_689608 ?auto_689607 ) ( ON ?auto_689609 ?auto_689608 ) ( ON ?auto_689610 ?auto_689609 ) ( not ( = ?auto_689600 ?auto_689601 ) ) ( not ( = ?auto_689600 ?auto_689602 ) ) ( not ( = ?auto_689600 ?auto_689603 ) ) ( not ( = ?auto_689600 ?auto_689604 ) ) ( not ( = ?auto_689600 ?auto_689605 ) ) ( not ( = ?auto_689600 ?auto_689606 ) ) ( not ( = ?auto_689600 ?auto_689607 ) ) ( not ( = ?auto_689600 ?auto_689608 ) ) ( not ( = ?auto_689600 ?auto_689609 ) ) ( not ( = ?auto_689600 ?auto_689610 ) ) ( not ( = ?auto_689600 ?auto_689611 ) ) ( not ( = ?auto_689600 ?auto_689612 ) ) ( not ( = ?auto_689601 ?auto_689602 ) ) ( not ( = ?auto_689601 ?auto_689603 ) ) ( not ( = ?auto_689601 ?auto_689604 ) ) ( not ( = ?auto_689601 ?auto_689605 ) ) ( not ( = ?auto_689601 ?auto_689606 ) ) ( not ( = ?auto_689601 ?auto_689607 ) ) ( not ( = ?auto_689601 ?auto_689608 ) ) ( not ( = ?auto_689601 ?auto_689609 ) ) ( not ( = ?auto_689601 ?auto_689610 ) ) ( not ( = ?auto_689601 ?auto_689611 ) ) ( not ( = ?auto_689601 ?auto_689612 ) ) ( not ( = ?auto_689602 ?auto_689603 ) ) ( not ( = ?auto_689602 ?auto_689604 ) ) ( not ( = ?auto_689602 ?auto_689605 ) ) ( not ( = ?auto_689602 ?auto_689606 ) ) ( not ( = ?auto_689602 ?auto_689607 ) ) ( not ( = ?auto_689602 ?auto_689608 ) ) ( not ( = ?auto_689602 ?auto_689609 ) ) ( not ( = ?auto_689602 ?auto_689610 ) ) ( not ( = ?auto_689602 ?auto_689611 ) ) ( not ( = ?auto_689602 ?auto_689612 ) ) ( not ( = ?auto_689603 ?auto_689604 ) ) ( not ( = ?auto_689603 ?auto_689605 ) ) ( not ( = ?auto_689603 ?auto_689606 ) ) ( not ( = ?auto_689603 ?auto_689607 ) ) ( not ( = ?auto_689603 ?auto_689608 ) ) ( not ( = ?auto_689603 ?auto_689609 ) ) ( not ( = ?auto_689603 ?auto_689610 ) ) ( not ( = ?auto_689603 ?auto_689611 ) ) ( not ( = ?auto_689603 ?auto_689612 ) ) ( not ( = ?auto_689604 ?auto_689605 ) ) ( not ( = ?auto_689604 ?auto_689606 ) ) ( not ( = ?auto_689604 ?auto_689607 ) ) ( not ( = ?auto_689604 ?auto_689608 ) ) ( not ( = ?auto_689604 ?auto_689609 ) ) ( not ( = ?auto_689604 ?auto_689610 ) ) ( not ( = ?auto_689604 ?auto_689611 ) ) ( not ( = ?auto_689604 ?auto_689612 ) ) ( not ( = ?auto_689605 ?auto_689606 ) ) ( not ( = ?auto_689605 ?auto_689607 ) ) ( not ( = ?auto_689605 ?auto_689608 ) ) ( not ( = ?auto_689605 ?auto_689609 ) ) ( not ( = ?auto_689605 ?auto_689610 ) ) ( not ( = ?auto_689605 ?auto_689611 ) ) ( not ( = ?auto_689605 ?auto_689612 ) ) ( not ( = ?auto_689606 ?auto_689607 ) ) ( not ( = ?auto_689606 ?auto_689608 ) ) ( not ( = ?auto_689606 ?auto_689609 ) ) ( not ( = ?auto_689606 ?auto_689610 ) ) ( not ( = ?auto_689606 ?auto_689611 ) ) ( not ( = ?auto_689606 ?auto_689612 ) ) ( not ( = ?auto_689607 ?auto_689608 ) ) ( not ( = ?auto_689607 ?auto_689609 ) ) ( not ( = ?auto_689607 ?auto_689610 ) ) ( not ( = ?auto_689607 ?auto_689611 ) ) ( not ( = ?auto_689607 ?auto_689612 ) ) ( not ( = ?auto_689608 ?auto_689609 ) ) ( not ( = ?auto_689608 ?auto_689610 ) ) ( not ( = ?auto_689608 ?auto_689611 ) ) ( not ( = ?auto_689608 ?auto_689612 ) ) ( not ( = ?auto_689609 ?auto_689610 ) ) ( not ( = ?auto_689609 ?auto_689611 ) ) ( not ( = ?auto_689609 ?auto_689612 ) ) ( not ( = ?auto_689610 ?auto_689611 ) ) ( not ( = ?auto_689610 ?auto_689612 ) ) ( not ( = ?auto_689611 ?auto_689612 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_689611 ?auto_689612 )
      ( !STACK ?auto_689611 ?auto_689610 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_689650 - BLOCK
      ?auto_689651 - BLOCK
      ?auto_689652 - BLOCK
      ?auto_689653 - BLOCK
      ?auto_689654 - BLOCK
      ?auto_689655 - BLOCK
      ?auto_689656 - BLOCK
      ?auto_689657 - BLOCK
      ?auto_689658 - BLOCK
      ?auto_689659 - BLOCK
      ?auto_689660 - BLOCK
      ?auto_689661 - BLOCK
    )
    :vars
    (
      ?auto_689662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689661 ?auto_689662 ) ( ON-TABLE ?auto_689650 ) ( ON ?auto_689651 ?auto_689650 ) ( ON ?auto_689652 ?auto_689651 ) ( ON ?auto_689653 ?auto_689652 ) ( ON ?auto_689654 ?auto_689653 ) ( ON ?auto_689655 ?auto_689654 ) ( ON ?auto_689656 ?auto_689655 ) ( ON ?auto_689657 ?auto_689656 ) ( ON ?auto_689658 ?auto_689657 ) ( ON ?auto_689659 ?auto_689658 ) ( not ( = ?auto_689650 ?auto_689651 ) ) ( not ( = ?auto_689650 ?auto_689652 ) ) ( not ( = ?auto_689650 ?auto_689653 ) ) ( not ( = ?auto_689650 ?auto_689654 ) ) ( not ( = ?auto_689650 ?auto_689655 ) ) ( not ( = ?auto_689650 ?auto_689656 ) ) ( not ( = ?auto_689650 ?auto_689657 ) ) ( not ( = ?auto_689650 ?auto_689658 ) ) ( not ( = ?auto_689650 ?auto_689659 ) ) ( not ( = ?auto_689650 ?auto_689660 ) ) ( not ( = ?auto_689650 ?auto_689661 ) ) ( not ( = ?auto_689650 ?auto_689662 ) ) ( not ( = ?auto_689651 ?auto_689652 ) ) ( not ( = ?auto_689651 ?auto_689653 ) ) ( not ( = ?auto_689651 ?auto_689654 ) ) ( not ( = ?auto_689651 ?auto_689655 ) ) ( not ( = ?auto_689651 ?auto_689656 ) ) ( not ( = ?auto_689651 ?auto_689657 ) ) ( not ( = ?auto_689651 ?auto_689658 ) ) ( not ( = ?auto_689651 ?auto_689659 ) ) ( not ( = ?auto_689651 ?auto_689660 ) ) ( not ( = ?auto_689651 ?auto_689661 ) ) ( not ( = ?auto_689651 ?auto_689662 ) ) ( not ( = ?auto_689652 ?auto_689653 ) ) ( not ( = ?auto_689652 ?auto_689654 ) ) ( not ( = ?auto_689652 ?auto_689655 ) ) ( not ( = ?auto_689652 ?auto_689656 ) ) ( not ( = ?auto_689652 ?auto_689657 ) ) ( not ( = ?auto_689652 ?auto_689658 ) ) ( not ( = ?auto_689652 ?auto_689659 ) ) ( not ( = ?auto_689652 ?auto_689660 ) ) ( not ( = ?auto_689652 ?auto_689661 ) ) ( not ( = ?auto_689652 ?auto_689662 ) ) ( not ( = ?auto_689653 ?auto_689654 ) ) ( not ( = ?auto_689653 ?auto_689655 ) ) ( not ( = ?auto_689653 ?auto_689656 ) ) ( not ( = ?auto_689653 ?auto_689657 ) ) ( not ( = ?auto_689653 ?auto_689658 ) ) ( not ( = ?auto_689653 ?auto_689659 ) ) ( not ( = ?auto_689653 ?auto_689660 ) ) ( not ( = ?auto_689653 ?auto_689661 ) ) ( not ( = ?auto_689653 ?auto_689662 ) ) ( not ( = ?auto_689654 ?auto_689655 ) ) ( not ( = ?auto_689654 ?auto_689656 ) ) ( not ( = ?auto_689654 ?auto_689657 ) ) ( not ( = ?auto_689654 ?auto_689658 ) ) ( not ( = ?auto_689654 ?auto_689659 ) ) ( not ( = ?auto_689654 ?auto_689660 ) ) ( not ( = ?auto_689654 ?auto_689661 ) ) ( not ( = ?auto_689654 ?auto_689662 ) ) ( not ( = ?auto_689655 ?auto_689656 ) ) ( not ( = ?auto_689655 ?auto_689657 ) ) ( not ( = ?auto_689655 ?auto_689658 ) ) ( not ( = ?auto_689655 ?auto_689659 ) ) ( not ( = ?auto_689655 ?auto_689660 ) ) ( not ( = ?auto_689655 ?auto_689661 ) ) ( not ( = ?auto_689655 ?auto_689662 ) ) ( not ( = ?auto_689656 ?auto_689657 ) ) ( not ( = ?auto_689656 ?auto_689658 ) ) ( not ( = ?auto_689656 ?auto_689659 ) ) ( not ( = ?auto_689656 ?auto_689660 ) ) ( not ( = ?auto_689656 ?auto_689661 ) ) ( not ( = ?auto_689656 ?auto_689662 ) ) ( not ( = ?auto_689657 ?auto_689658 ) ) ( not ( = ?auto_689657 ?auto_689659 ) ) ( not ( = ?auto_689657 ?auto_689660 ) ) ( not ( = ?auto_689657 ?auto_689661 ) ) ( not ( = ?auto_689657 ?auto_689662 ) ) ( not ( = ?auto_689658 ?auto_689659 ) ) ( not ( = ?auto_689658 ?auto_689660 ) ) ( not ( = ?auto_689658 ?auto_689661 ) ) ( not ( = ?auto_689658 ?auto_689662 ) ) ( not ( = ?auto_689659 ?auto_689660 ) ) ( not ( = ?auto_689659 ?auto_689661 ) ) ( not ( = ?auto_689659 ?auto_689662 ) ) ( not ( = ?auto_689660 ?auto_689661 ) ) ( not ( = ?auto_689660 ?auto_689662 ) ) ( not ( = ?auto_689661 ?auto_689662 ) ) ( CLEAR ?auto_689659 ) ( ON ?auto_689660 ?auto_689661 ) ( CLEAR ?auto_689660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_689650 ?auto_689651 ?auto_689652 ?auto_689653 ?auto_689654 ?auto_689655 ?auto_689656 ?auto_689657 ?auto_689658 ?auto_689659 ?auto_689660 )
      ( MAKE-12PILE ?auto_689650 ?auto_689651 ?auto_689652 ?auto_689653 ?auto_689654 ?auto_689655 ?auto_689656 ?auto_689657 ?auto_689658 ?auto_689659 ?auto_689660 ?auto_689661 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_689700 - BLOCK
      ?auto_689701 - BLOCK
      ?auto_689702 - BLOCK
      ?auto_689703 - BLOCK
      ?auto_689704 - BLOCK
      ?auto_689705 - BLOCK
      ?auto_689706 - BLOCK
      ?auto_689707 - BLOCK
      ?auto_689708 - BLOCK
      ?auto_689709 - BLOCK
      ?auto_689710 - BLOCK
      ?auto_689711 - BLOCK
    )
    :vars
    (
      ?auto_689712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689711 ?auto_689712 ) ( ON-TABLE ?auto_689700 ) ( ON ?auto_689701 ?auto_689700 ) ( ON ?auto_689702 ?auto_689701 ) ( ON ?auto_689703 ?auto_689702 ) ( ON ?auto_689704 ?auto_689703 ) ( ON ?auto_689705 ?auto_689704 ) ( ON ?auto_689706 ?auto_689705 ) ( ON ?auto_689707 ?auto_689706 ) ( ON ?auto_689708 ?auto_689707 ) ( not ( = ?auto_689700 ?auto_689701 ) ) ( not ( = ?auto_689700 ?auto_689702 ) ) ( not ( = ?auto_689700 ?auto_689703 ) ) ( not ( = ?auto_689700 ?auto_689704 ) ) ( not ( = ?auto_689700 ?auto_689705 ) ) ( not ( = ?auto_689700 ?auto_689706 ) ) ( not ( = ?auto_689700 ?auto_689707 ) ) ( not ( = ?auto_689700 ?auto_689708 ) ) ( not ( = ?auto_689700 ?auto_689709 ) ) ( not ( = ?auto_689700 ?auto_689710 ) ) ( not ( = ?auto_689700 ?auto_689711 ) ) ( not ( = ?auto_689700 ?auto_689712 ) ) ( not ( = ?auto_689701 ?auto_689702 ) ) ( not ( = ?auto_689701 ?auto_689703 ) ) ( not ( = ?auto_689701 ?auto_689704 ) ) ( not ( = ?auto_689701 ?auto_689705 ) ) ( not ( = ?auto_689701 ?auto_689706 ) ) ( not ( = ?auto_689701 ?auto_689707 ) ) ( not ( = ?auto_689701 ?auto_689708 ) ) ( not ( = ?auto_689701 ?auto_689709 ) ) ( not ( = ?auto_689701 ?auto_689710 ) ) ( not ( = ?auto_689701 ?auto_689711 ) ) ( not ( = ?auto_689701 ?auto_689712 ) ) ( not ( = ?auto_689702 ?auto_689703 ) ) ( not ( = ?auto_689702 ?auto_689704 ) ) ( not ( = ?auto_689702 ?auto_689705 ) ) ( not ( = ?auto_689702 ?auto_689706 ) ) ( not ( = ?auto_689702 ?auto_689707 ) ) ( not ( = ?auto_689702 ?auto_689708 ) ) ( not ( = ?auto_689702 ?auto_689709 ) ) ( not ( = ?auto_689702 ?auto_689710 ) ) ( not ( = ?auto_689702 ?auto_689711 ) ) ( not ( = ?auto_689702 ?auto_689712 ) ) ( not ( = ?auto_689703 ?auto_689704 ) ) ( not ( = ?auto_689703 ?auto_689705 ) ) ( not ( = ?auto_689703 ?auto_689706 ) ) ( not ( = ?auto_689703 ?auto_689707 ) ) ( not ( = ?auto_689703 ?auto_689708 ) ) ( not ( = ?auto_689703 ?auto_689709 ) ) ( not ( = ?auto_689703 ?auto_689710 ) ) ( not ( = ?auto_689703 ?auto_689711 ) ) ( not ( = ?auto_689703 ?auto_689712 ) ) ( not ( = ?auto_689704 ?auto_689705 ) ) ( not ( = ?auto_689704 ?auto_689706 ) ) ( not ( = ?auto_689704 ?auto_689707 ) ) ( not ( = ?auto_689704 ?auto_689708 ) ) ( not ( = ?auto_689704 ?auto_689709 ) ) ( not ( = ?auto_689704 ?auto_689710 ) ) ( not ( = ?auto_689704 ?auto_689711 ) ) ( not ( = ?auto_689704 ?auto_689712 ) ) ( not ( = ?auto_689705 ?auto_689706 ) ) ( not ( = ?auto_689705 ?auto_689707 ) ) ( not ( = ?auto_689705 ?auto_689708 ) ) ( not ( = ?auto_689705 ?auto_689709 ) ) ( not ( = ?auto_689705 ?auto_689710 ) ) ( not ( = ?auto_689705 ?auto_689711 ) ) ( not ( = ?auto_689705 ?auto_689712 ) ) ( not ( = ?auto_689706 ?auto_689707 ) ) ( not ( = ?auto_689706 ?auto_689708 ) ) ( not ( = ?auto_689706 ?auto_689709 ) ) ( not ( = ?auto_689706 ?auto_689710 ) ) ( not ( = ?auto_689706 ?auto_689711 ) ) ( not ( = ?auto_689706 ?auto_689712 ) ) ( not ( = ?auto_689707 ?auto_689708 ) ) ( not ( = ?auto_689707 ?auto_689709 ) ) ( not ( = ?auto_689707 ?auto_689710 ) ) ( not ( = ?auto_689707 ?auto_689711 ) ) ( not ( = ?auto_689707 ?auto_689712 ) ) ( not ( = ?auto_689708 ?auto_689709 ) ) ( not ( = ?auto_689708 ?auto_689710 ) ) ( not ( = ?auto_689708 ?auto_689711 ) ) ( not ( = ?auto_689708 ?auto_689712 ) ) ( not ( = ?auto_689709 ?auto_689710 ) ) ( not ( = ?auto_689709 ?auto_689711 ) ) ( not ( = ?auto_689709 ?auto_689712 ) ) ( not ( = ?auto_689710 ?auto_689711 ) ) ( not ( = ?auto_689710 ?auto_689712 ) ) ( not ( = ?auto_689711 ?auto_689712 ) ) ( ON ?auto_689710 ?auto_689711 ) ( CLEAR ?auto_689708 ) ( ON ?auto_689709 ?auto_689710 ) ( CLEAR ?auto_689709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_689700 ?auto_689701 ?auto_689702 ?auto_689703 ?auto_689704 ?auto_689705 ?auto_689706 ?auto_689707 ?auto_689708 ?auto_689709 )
      ( MAKE-12PILE ?auto_689700 ?auto_689701 ?auto_689702 ?auto_689703 ?auto_689704 ?auto_689705 ?auto_689706 ?auto_689707 ?auto_689708 ?auto_689709 ?auto_689710 ?auto_689711 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_689750 - BLOCK
      ?auto_689751 - BLOCK
      ?auto_689752 - BLOCK
      ?auto_689753 - BLOCK
      ?auto_689754 - BLOCK
      ?auto_689755 - BLOCK
      ?auto_689756 - BLOCK
      ?auto_689757 - BLOCK
      ?auto_689758 - BLOCK
      ?auto_689759 - BLOCK
      ?auto_689760 - BLOCK
      ?auto_689761 - BLOCK
    )
    :vars
    (
      ?auto_689762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689761 ?auto_689762 ) ( ON-TABLE ?auto_689750 ) ( ON ?auto_689751 ?auto_689750 ) ( ON ?auto_689752 ?auto_689751 ) ( ON ?auto_689753 ?auto_689752 ) ( ON ?auto_689754 ?auto_689753 ) ( ON ?auto_689755 ?auto_689754 ) ( ON ?auto_689756 ?auto_689755 ) ( ON ?auto_689757 ?auto_689756 ) ( not ( = ?auto_689750 ?auto_689751 ) ) ( not ( = ?auto_689750 ?auto_689752 ) ) ( not ( = ?auto_689750 ?auto_689753 ) ) ( not ( = ?auto_689750 ?auto_689754 ) ) ( not ( = ?auto_689750 ?auto_689755 ) ) ( not ( = ?auto_689750 ?auto_689756 ) ) ( not ( = ?auto_689750 ?auto_689757 ) ) ( not ( = ?auto_689750 ?auto_689758 ) ) ( not ( = ?auto_689750 ?auto_689759 ) ) ( not ( = ?auto_689750 ?auto_689760 ) ) ( not ( = ?auto_689750 ?auto_689761 ) ) ( not ( = ?auto_689750 ?auto_689762 ) ) ( not ( = ?auto_689751 ?auto_689752 ) ) ( not ( = ?auto_689751 ?auto_689753 ) ) ( not ( = ?auto_689751 ?auto_689754 ) ) ( not ( = ?auto_689751 ?auto_689755 ) ) ( not ( = ?auto_689751 ?auto_689756 ) ) ( not ( = ?auto_689751 ?auto_689757 ) ) ( not ( = ?auto_689751 ?auto_689758 ) ) ( not ( = ?auto_689751 ?auto_689759 ) ) ( not ( = ?auto_689751 ?auto_689760 ) ) ( not ( = ?auto_689751 ?auto_689761 ) ) ( not ( = ?auto_689751 ?auto_689762 ) ) ( not ( = ?auto_689752 ?auto_689753 ) ) ( not ( = ?auto_689752 ?auto_689754 ) ) ( not ( = ?auto_689752 ?auto_689755 ) ) ( not ( = ?auto_689752 ?auto_689756 ) ) ( not ( = ?auto_689752 ?auto_689757 ) ) ( not ( = ?auto_689752 ?auto_689758 ) ) ( not ( = ?auto_689752 ?auto_689759 ) ) ( not ( = ?auto_689752 ?auto_689760 ) ) ( not ( = ?auto_689752 ?auto_689761 ) ) ( not ( = ?auto_689752 ?auto_689762 ) ) ( not ( = ?auto_689753 ?auto_689754 ) ) ( not ( = ?auto_689753 ?auto_689755 ) ) ( not ( = ?auto_689753 ?auto_689756 ) ) ( not ( = ?auto_689753 ?auto_689757 ) ) ( not ( = ?auto_689753 ?auto_689758 ) ) ( not ( = ?auto_689753 ?auto_689759 ) ) ( not ( = ?auto_689753 ?auto_689760 ) ) ( not ( = ?auto_689753 ?auto_689761 ) ) ( not ( = ?auto_689753 ?auto_689762 ) ) ( not ( = ?auto_689754 ?auto_689755 ) ) ( not ( = ?auto_689754 ?auto_689756 ) ) ( not ( = ?auto_689754 ?auto_689757 ) ) ( not ( = ?auto_689754 ?auto_689758 ) ) ( not ( = ?auto_689754 ?auto_689759 ) ) ( not ( = ?auto_689754 ?auto_689760 ) ) ( not ( = ?auto_689754 ?auto_689761 ) ) ( not ( = ?auto_689754 ?auto_689762 ) ) ( not ( = ?auto_689755 ?auto_689756 ) ) ( not ( = ?auto_689755 ?auto_689757 ) ) ( not ( = ?auto_689755 ?auto_689758 ) ) ( not ( = ?auto_689755 ?auto_689759 ) ) ( not ( = ?auto_689755 ?auto_689760 ) ) ( not ( = ?auto_689755 ?auto_689761 ) ) ( not ( = ?auto_689755 ?auto_689762 ) ) ( not ( = ?auto_689756 ?auto_689757 ) ) ( not ( = ?auto_689756 ?auto_689758 ) ) ( not ( = ?auto_689756 ?auto_689759 ) ) ( not ( = ?auto_689756 ?auto_689760 ) ) ( not ( = ?auto_689756 ?auto_689761 ) ) ( not ( = ?auto_689756 ?auto_689762 ) ) ( not ( = ?auto_689757 ?auto_689758 ) ) ( not ( = ?auto_689757 ?auto_689759 ) ) ( not ( = ?auto_689757 ?auto_689760 ) ) ( not ( = ?auto_689757 ?auto_689761 ) ) ( not ( = ?auto_689757 ?auto_689762 ) ) ( not ( = ?auto_689758 ?auto_689759 ) ) ( not ( = ?auto_689758 ?auto_689760 ) ) ( not ( = ?auto_689758 ?auto_689761 ) ) ( not ( = ?auto_689758 ?auto_689762 ) ) ( not ( = ?auto_689759 ?auto_689760 ) ) ( not ( = ?auto_689759 ?auto_689761 ) ) ( not ( = ?auto_689759 ?auto_689762 ) ) ( not ( = ?auto_689760 ?auto_689761 ) ) ( not ( = ?auto_689760 ?auto_689762 ) ) ( not ( = ?auto_689761 ?auto_689762 ) ) ( ON ?auto_689760 ?auto_689761 ) ( ON ?auto_689759 ?auto_689760 ) ( CLEAR ?auto_689757 ) ( ON ?auto_689758 ?auto_689759 ) ( CLEAR ?auto_689758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_689750 ?auto_689751 ?auto_689752 ?auto_689753 ?auto_689754 ?auto_689755 ?auto_689756 ?auto_689757 ?auto_689758 )
      ( MAKE-12PILE ?auto_689750 ?auto_689751 ?auto_689752 ?auto_689753 ?auto_689754 ?auto_689755 ?auto_689756 ?auto_689757 ?auto_689758 ?auto_689759 ?auto_689760 ?auto_689761 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_689800 - BLOCK
      ?auto_689801 - BLOCK
      ?auto_689802 - BLOCK
      ?auto_689803 - BLOCK
      ?auto_689804 - BLOCK
      ?auto_689805 - BLOCK
      ?auto_689806 - BLOCK
      ?auto_689807 - BLOCK
      ?auto_689808 - BLOCK
      ?auto_689809 - BLOCK
      ?auto_689810 - BLOCK
      ?auto_689811 - BLOCK
    )
    :vars
    (
      ?auto_689812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689811 ?auto_689812 ) ( ON-TABLE ?auto_689800 ) ( ON ?auto_689801 ?auto_689800 ) ( ON ?auto_689802 ?auto_689801 ) ( ON ?auto_689803 ?auto_689802 ) ( ON ?auto_689804 ?auto_689803 ) ( ON ?auto_689805 ?auto_689804 ) ( ON ?auto_689806 ?auto_689805 ) ( not ( = ?auto_689800 ?auto_689801 ) ) ( not ( = ?auto_689800 ?auto_689802 ) ) ( not ( = ?auto_689800 ?auto_689803 ) ) ( not ( = ?auto_689800 ?auto_689804 ) ) ( not ( = ?auto_689800 ?auto_689805 ) ) ( not ( = ?auto_689800 ?auto_689806 ) ) ( not ( = ?auto_689800 ?auto_689807 ) ) ( not ( = ?auto_689800 ?auto_689808 ) ) ( not ( = ?auto_689800 ?auto_689809 ) ) ( not ( = ?auto_689800 ?auto_689810 ) ) ( not ( = ?auto_689800 ?auto_689811 ) ) ( not ( = ?auto_689800 ?auto_689812 ) ) ( not ( = ?auto_689801 ?auto_689802 ) ) ( not ( = ?auto_689801 ?auto_689803 ) ) ( not ( = ?auto_689801 ?auto_689804 ) ) ( not ( = ?auto_689801 ?auto_689805 ) ) ( not ( = ?auto_689801 ?auto_689806 ) ) ( not ( = ?auto_689801 ?auto_689807 ) ) ( not ( = ?auto_689801 ?auto_689808 ) ) ( not ( = ?auto_689801 ?auto_689809 ) ) ( not ( = ?auto_689801 ?auto_689810 ) ) ( not ( = ?auto_689801 ?auto_689811 ) ) ( not ( = ?auto_689801 ?auto_689812 ) ) ( not ( = ?auto_689802 ?auto_689803 ) ) ( not ( = ?auto_689802 ?auto_689804 ) ) ( not ( = ?auto_689802 ?auto_689805 ) ) ( not ( = ?auto_689802 ?auto_689806 ) ) ( not ( = ?auto_689802 ?auto_689807 ) ) ( not ( = ?auto_689802 ?auto_689808 ) ) ( not ( = ?auto_689802 ?auto_689809 ) ) ( not ( = ?auto_689802 ?auto_689810 ) ) ( not ( = ?auto_689802 ?auto_689811 ) ) ( not ( = ?auto_689802 ?auto_689812 ) ) ( not ( = ?auto_689803 ?auto_689804 ) ) ( not ( = ?auto_689803 ?auto_689805 ) ) ( not ( = ?auto_689803 ?auto_689806 ) ) ( not ( = ?auto_689803 ?auto_689807 ) ) ( not ( = ?auto_689803 ?auto_689808 ) ) ( not ( = ?auto_689803 ?auto_689809 ) ) ( not ( = ?auto_689803 ?auto_689810 ) ) ( not ( = ?auto_689803 ?auto_689811 ) ) ( not ( = ?auto_689803 ?auto_689812 ) ) ( not ( = ?auto_689804 ?auto_689805 ) ) ( not ( = ?auto_689804 ?auto_689806 ) ) ( not ( = ?auto_689804 ?auto_689807 ) ) ( not ( = ?auto_689804 ?auto_689808 ) ) ( not ( = ?auto_689804 ?auto_689809 ) ) ( not ( = ?auto_689804 ?auto_689810 ) ) ( not ( = ?auto_689804 ?auto_689811 ) ) ( not ( = ?auto_689804 ?auto_689812 ) ) ( not ( = ?auto_689805 ?auto_689806 ) ) ( not ( = ?auto_689805 ?auto_689807 ) ) ( not ( = ?auto_689805 ?auto_689808 ) ) ( not ( = ?auto_689805 ?auto_689809 ) ) ( not ( = ?auto_689805 ?auto_689810 ) ) ( not ( = ?auto_689805 ?auto_689811 ) ) ( not ( = ?auto_689805 ?auto_689812 ) ) ( not ( = ?auto_689806 ?auto_689807 ) ) ( not ( = ?auto_689806 ?auto_689808 ) ) ( not ( = ?auto_689806 ?auto_689809 ) ) ( not ( = ?auto_689806 ?auto_689810 ) ) ( not ( = ?auto_689806 ?auto_689811 ) ) ( not ( = ?auto_689806 ?auto_689812 ) ) ( not ( = ?auto_689807 ?auto_689808 ) ) ( not ( = ?auto_689807 ?auto_689809 ) ) ( not ( = ?auto_689807 ?auto_689810 ) ) ( not ( = ?auto_689807 ?auto_689811 ) ) ( not ( = ?auto_689807 ?auto_689812 ) ) ( not ( = ?auto_689808 ?auto_689809 ) ) ( not ( = ?auto_689808 ?auto_689810 ) ) ( not ( = ?auto_689808 ?auto_689811 ) ) ( not ( = ?auto_689808 ?auto_689812 ) ) ( not ( = ?auto_689809 ?auto_689810 ) ) ( not ( = ?auto_689809 ?auto_689811 ) ) ( not ( = ?auto_689809 ?auto_689812 ) ) ( not ( = ?auto_689810 ?auto_689811 ) ) ( not ( = ?auto_689810 ?auto_689812 ) ) ( not ( = ?auto_689811 ?auto_689812 ) ) ( ON ?auto_689810 ?auto_689811 ) ( ON ?auto_689809 ?auto_689810 ) ( ON ?auto_689808 ?auto_689809 ) ( CLEAR ?auto_689806 ) ( ON ?auto_689807 ?auto_689808 ) ( CLEAR ?auto_689807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_689800 ?auto_689801 ?auto_689802 ?auto_689803 ?auto_689804 ?auto_689805 ?auto_689806 ?auto_689807 )
      ( MAKE-12PILE ?auto_689800 ?auto_689801 ?auto_689802 ?auto_689803 ?auto_689804 ?auto_689805 ?auto_689806 ?auto_689807 ?auto_689808 ?auto_689809 ?auto_689810 ?auto_689811 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_689850 - BLOCK
      ?auto_689851 - BLOCK
      ?auto_689852 - BLOCK
      ?auto_689853 - BLOCK
      ?auto_689854 - BLOCK
      ?auto_689855 - BLOCK
      ?auto_689856 - BLOCK
      ?auto_689857 - BLOCK
      ?auto_689858 - BLOCK
      ?auto_689859 - BLOCK
      ?auto_689860 - BLOCK
      ?auto_689861 - BLOCK
    )
    :vars
    (
      ?auto_689862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689861 ?auto_689862 ) ( ON-TABLE ?auto_689850 ) ( ON ?auto_689851 ?auto_689850 ) ( ON ?auto_689852 ?auto_689851 ) ( ON ?auto_689853 ?auto_689852 ) ( ON ?auto_689854 ?auto_689853 ) ( ON ?auto_689855 ?auto_689854 ) ( not ( = ?auto_689850 ?auto_689851 ) ) ( not ( = ?auto_689850 ?auto_689852 ) ) ( not ( = ?auto_689850 ?auto_689853 ) ) ( not ( = ?auto_689850 ?auto_689854 ) ) ( not ( = ?auto_689850 ?auto_689855 ) ) ( not ( = ?auto_689850 ?auto_689856 ) ) ( not ( = ?auto_689850 ?auto_689857 ) ) ( not ( = ?auto_689850 ?auto_689858 ) ) ( not ( = ?auto_689850 ?auto_689859 ) ) ( not ( = ?auto_689850 ?auto_689860 ) ) ( not ( = ?auto_689850 ?auto_689861 ) ) ( not ( = ?auto_689850 ?auto_689862 ) ) ( not ( = ?auto_689851 ?auto_689852 ) ) ( not ( = ?auto_689851 ?auto_689853 ) ) ( not ( = ?auto_689851 ?auto_689854 ) ) ( not ( = ?auto_689851 ?auto_689855 ) ) ( not ( = ?auto_689851 ?auto_689856 ) ) ( not ( = ?auto_689851 ?auto_689857 ) ) ( not ( = ?auto_689851 ?auto_689858 ) ) ( not ( = ?auto_689851 ?auto_689859 ) ) ( not ( = ?auto_689851 ?auto_689860 ) ) ( not ( = ?auto_689851 ?auto_689861 ) ) ( not ( = ?auto_689851 ?auto_689862 ) ) ( not ( = ?auto_689852 ?auto_689853 ) ) ( not ( = ?auto_689852 ?auto_689854 ) ) ( not ( = ?auto_689852 ?auto_689855 ) ) ( not ( = ?auto_689852 ?auto_689856 ) ) ( not ( = ?auto_689852 ?auto_689857 ) ) ( not ( = ?auto_689852 ?auto_689858 ) ) ( not ( = ?auto_689852 ?auto_689859 ) ) ( not ( = ?auto_689852 ?auto_689860 ) ) ( not ( = ?auto_689852 ?auto_689861 ) ) ( not ( = ?auto_689852 ?auto_689862 ) ) ( not ( = ?auto_689853 ?auto_689854 ) ) ( not ( = ?auto_689853 ?auto_689855 ) ) ( not ( = ?auto_689853 ?auto_689856 ) ) ( not ( = ?auto_689853 ?auto_689857 ) ) ( not ( = ?auto_689853 ?auto_689858 ) ) ( not ( = ?auto_689853 ?auto_689859 ) ) ( not ( = ?auto_689853 ?auto_689860 ) ) ( not ( = ?auto_689853 ?auto_689861 ) ) ( not ( = ?auto_689853 ?auto_689862 ) ) ( not ( = ?auto_689854 ?auto_689855 ) ) ( not ( = ?auto_689854 ?auto_689856 ) ) ( not ( = ?auto_689854 ?auto_689857 ) ) ( not ( = ?auto_689854 ?auto_689858 ) ) ( not ( = ?auto_689854 ?auto_689859 ) ) ( not ( = ?auto_689854 ?auto_689860 ) ) ( not ( = ?auto_689854 ?auto_689861 ) ) ( not ( = ?auto_689854 ?auto_689862 ) ) ( not ( = ?auto_689855 ?auto_689856 ) ) ( not ( = ?auto_689855 ?auto_689857 ) ) ( not ( = ?auto_689855 ?auto_689858 ) ) ( not ( = ?auto_689855 ?auto_689859 ) ) ( not ( = ?auto_689855 ?auto_689860 ) ) ( not ( = ?auto_689855 ?auto_689861 ) ) ( not ( = ?auto_689855 ?auto_689862 ) ) ( not ( = ?auto_689856 ?auto_689857 ) ) ( not ( = ?auto_689856 ?auto_689858 ) ) ( not ( = ?auto_689856 ?auto_689859 ) ) ( not ( = ?auto_689856 ?auto_689860 ) ) ( not ( = ?auto_689856 ?auto_689861 ) ) ( not ( = ?auto_689856 ?auto_689862 ) ) ( not ( = ?auto_689857 ?auto_689858 ) ) ( not ( = ?auto_689857 ?auto_689859 ) ) ( not ( = ?auto_689857 ?auto_689860 ) ) ( not ( = ?auto_689857 ?auto_689861 ) ) ( not ( = ?auto_689857 ?auto_689862 ) ) ( not ( = ?auto_689858 ?auto_689859 ) ) ( not ( = ?auto_689858 ?auto_689860 ) ) ( not ( = ?auto_689858 ?auto_689861 ) ) ( not ( = ?auto_689858 ?auto_689862 ) ) ( not ( = ?auto_689859 ?auto_689860 ) ) ( not ( = ?auto_689859 ?auto_689861 ) ) ( not ( = ?auto_689859 ?auto_689862 ) ) ( not ( = ?auto_689860 ?auto_689861 ) ) ( not ( = ?auto_689860 ?auto_689862 ) ) ( not ( = ?auto_689861 ?auto_689862 ) ) ( ON ?auto_689860 ?auto_689861 ) ( ON ?auto_689859 ?auto_689860 ) ( ON ?auto_689858 ?auto_689859 ) ( ON ?auto_689857 ?auto_689858 ) ( CLEAR ?auto_689855 ) ( ON ?auto_689856 ?auto_689857 ) ( CLEAR ?auto_689856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_689850 ?auto_689851 ?auto_689852 ?auto_689853 ?auto_689854 ?auto_689855 ?auto_689856 )
      ( MAKE-12PILE ?auto_689850 ?auto_689851 ?auto_689852 ?auto_689853 ?auto_689854 ?auto_689855 ?auto_689856 ?auto_689857 ?auto_689858 ?auto_689859 ?auto_689860 ?auto_689861 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_689900 - BLOCK
      ?auto_689901 - BLOCK
      ?auto_689902 - BLOCK
      ?auto_689903 - BLOCK
      ?auto_689904 - BLOCK
      ?auto_689905 - BLOCK
      ?auto_689906 - BLOCK
      ?auto_689907 - BLOCK
      ?auto_689908 - BLOCK
      ?auto_689909 - BLOCK
      ?auto_689910 - BLOCK
      ?auto_689911 - BLOCK
    )
    :vars
    (
      ?auto_689912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689911 ?auto_689912 ) ( ON-TABLE ?auto_689900 ) ( ON ?auto_689901 ?auto_689900 ) ( ON ?auto_689902 ?auto_689901 ) ( ON ?auto_689903 ?auto_689902 ) ( ON ?auto_689904 ?auto_689903 ) ( not ( = ?auto_689900 ?auto_689901 ) ) ( not ( = ?auto_689900 ?auto_689902 ) ) ( not ( = ?auto_689900 ?auto_689903 ) ) ( not ( = ?auto_689900 ?auto_689904 ) ) ( not ( = ?auto_689900 ?auto_689905 ) ) ( not ( = ?auto_689900 ?auto_689906 ) ) ( not ( = ?auto_689900 ?auto_689907 ) ) ( not ( = ?auto_689900 ?auto_689908 ) ) ( not ( = ?auto_689900 ?auto_689909 ) ) ( not ( = ?auto_689900 ?auto_689910 ) ) ( not ( = ?auto_689900 ?auto_689911 ) ) ( not ( = ?auto_689900 ?auto_689912 ) ) ( not ( = ?auto_689901 ?auto_689902 ) ) ( not ( = ?auto_689901 ?auto_689903 ) ) ( not ( = ?auto_689901 ?auto_689904 ) ) ( not ( = ?auto_689901 ?auto_689905 ) ) ( not ( = ?auto_689901 ?auto_689906 ) ) ( not ( = ?auto_689901 ?auto_689907 ) ) ( not ( = ?auto_689901 ?auto_689908 ) ) ( not ( = ?auto_689901 ?auto_689909 ) ) ( not ( = ?auto_689901 ?auto_689910 ) ) ( not ( = ?auto_689901 ?auto_689911 ) ) ( not ( = ?auto_689901 ?auto_689912 ) ) ( not ( = ?auto_689902 ?auto_689903 ) ) ( not ( = ?auto_689902 ?auto_689904 ) ) ( not ( = ?auto_689902 ?auto_689905 ) ) ( not ( = ?auto_689902 ?auto_689906 ) ) ( not ( = ?auto_689902 ?auto_689907 ) ) ( not ( = ?auto_689902 ?auto_689908 ) ) ( not ( = ?auto_689902 ?auto_689909 ) ) ( not ( = ?auto_689902 ?auto_689910 ) ) ( not ( = ?auto_689902 ?auto_689911 ) ) ( not ( = ?auto_689902 ?auto_689912 ) ) ( not ( = ?auto_689903 ?auto_689904 ) ) ( not ( = ?auto_689903 ?auto_689905 ) ) ( not ( = ?auto_689903 ?auto_689906 ) ) ( not ( = ?auto_689903 ?auto_689907 ) ) ( not ( = ?auto_689903 ?auto_689908 ) ) ( not ( = ?auto_689903 ?auto_689909 ) ) ( not ( = ?auto_689903 ?auto_689910 ) ) ( not ( = ?auto_689903 ?auto_689911 ) ) ( not ( = ?auto_689903 ?auto_689912 ) ) ( not ( = ?auto_689904 ?auto_689905 ) ) ( not ( = ?auto_689904 ?auto_689906 ) ) ( not ( = ?auto_689904 ?auto_689907 ) ) ( not ( = ?auto_689904 ?auto_689908 ) ) ( not ( = ?auto_689904 ?auto_689909 ) ) ( not ( = ?auto_689904 ?auto_689910 ) ) ( not ( = ?auto_689904 ?auto_689911 ) ) ( not ( = ?auto_689904 ?auto_689912 ) ) ( not ( = ?auto_689905 ?auto_689906 ) ) ( not ( = ?auto_689905 ?auto_689907 ) ) ( not ( = ?auto_689905 ?auto_689908 ) ) ( not ( = ?auto_689905 ?auto_689909 ) ) ( not ( = ?auto_689905 ?auto_689910 ) ) ( not ( = ?auto_689905 ?auto_689911 ) ) ( not ( = ?auto_689905 ?auto_689912 ) ) ( not ( = ?auto_689906 ?auto_689907 ) ) ( not ( = ?auto_689906 ?auto_689908 ) ) ( not ( = ?auto_689906 ?auto_689909 ) ) ( not ( = ?auto_689906 ?auto_689910 ) ) ( not ( = ?auto_689906 ?auto_689911 ) ) ( not ( = ?auto_689906 ?auto_689912 ) ) ( not ( = ?auto_689907 ?auto_689908 ) ) ( not ( = ?auto_689907 ?auto_689909 ) ) ( not ( = ?auto_689907 ?auto_689910 ) ) ( not ( = ?auto_689907 ?auto_689911 ) ) ( not ( = ?auto_689907 ?auto_689912 ) ) ( not ( = ?auto_689908 ?auto_689909 ) ) ( not ( = ?auto_689908 ?auto_689910 ) ) ( not ( = ?auto_689908 ?auto_689911 ) ) ( not ( = ?auto_689908 ?auto_689912 ) ) ( not ( = ?auto_689909 ?auto_689910 ) ) ( not ( = ?auto_689909 ?auto_689911 ) ) ( not ( = ?auto_689909 ?auto_689912 ) ) ( not ( = ?auto_689910 ?auto_689911 ) ) ( not ( = ?auto_689910 ?auto_689912 ) ) ( not ( = ?auto_689911 ?auto_689912 ) ) ( ON ?auto_689910 ?auto_689911 ) ( ON ?auto_689909 ?auto_689910 ) ( ON ?auto_689908 ?auto_689909 ) ( ON ?auto_689907 ?auto_689908 ) ( ON ?auto_689906 ?auto_689907 ) ( CLEAR ?auto_689904 ) ( ON ?auto_689905 ?auto_689906 ) ( CLEAR ?auto_689905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_689900 ?auto_689901 ?auto_689902 ?auto_689903 ?auto_689904 ?auto_689905 )
      ( MAKE-12PILE ?auto_689900 ?auto_689901 ?auto_689902 ?auto_689903 ?auto_689904 ?auto_689905 ?auto_689906 ?auto_689907 ?auto_689908 ?auto_689909 ?auto_689910 ?auto_689911 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_689950 - BLOCK
      ?auto_689951 - BLOCK
      ?auto_689952 - BLOCK
      ?auto_689953 - BLOCK
      ?auto_689954 - BLOCK
      ?auto_689955 - BLOCK
      ?auto_689956 - BLOCK
      ?auto_689957 - BLOCK
      ?auto_689958 - BLOCK
      ?auto_689959 - BLOCK
      ?auto_689960 - BLOCK
      ?auto_689961 - BLOCK
    )
    :vars
    (
      ?auto_689962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_689961 ?auto_689962 ) ( ON-TABLE ?auto_689950 ) ( ON ?auto_689951 ?auto_689950 ) ( ON ?auto_689952 ?auto_689951 ) ( ON ?auto_689953 ?auto_689952 ) ( not ( = ?auto_689950 ?auto_689951 ) ) ( not ( = ?auto_689950 ?auto_689952 ) ) ( not ( = ?auto_689950 ?auto_689953 ) ) ( not ( = ?auto_689950 ?auto_689954 ) ) ( not ( = ?auto_689950 ?auto_689955 ) ) ( not ( = ?auto_689950 ?auto_689956 ) ) ( not ( = ?auto_689950 ?auto_689957 ) ) ( not ( = ?auto_689950 ?auto_689958 ) ) ( not ( = ?auto_689950 ?auto_689959 ) ) ( not ( = ?auto_689950 ?auto_689960 ) ) ( not ( = ?auto_689950 ?auto_689961 ) ) ( not ( = ?auto_689950 ?auto_689962 ) ) ( not ( = ?auto_689951 ?auto_689952 ) ) ( not ( = ?auto_689951 ?auto_689953 ) ) ( not ( = ?auto_689951 ?auto_689954 ) ) ( not ( = ?auto_689951 ?auto_689955 ) ) ( not ( = ?auto_689951 ?auto_689956 ) ) ( not ( = ?auto_689951 ?auto_689957 ) ) ( not ( = ?auto_689951 ?auto_689958 ) ) ( not ( = ?auto_689951 ?auto_689959 ) ) ( not ( = ?auto_689951 ?auto_689960 ) ) ( not ( = ?auto_689951 ?auto_689961 ) ) ( not ( = ?auto_689951 ?auto_689962 ) ) ( not ( = ?auto_689952 ?auto_689953 ) ) ( not ( = ?auto_689952 ?auto_689954 ) ) ( not ( = ?auto_689952 ?auto_689955 ) ) ( not ( = ?auto_689952 ?auto_689956 ) ) ( not ( = ?auto_689952 ?auto_689957 ) ) ( not ( = ?auto_689952 ?auto_689958 ) ) ( not ( = ?auto_689952 ?auto_689959 ) ) ( not ( = ?auto_689952 ?auto_689960 ) ) ( not ( = ?auto_689952 ?auto_689961 ) ) ( not ( = ?auto_689952 ?auto_689962 ) ) ( not ( = ?auto_689953 ?auto_689954 ) ) ( not ( = ?auto_689953 ?auto_689955 ) ) ( not ( = ?auto_689953 ?auto_689956 ) ) ( not ( = ?auto_689953 ?auto_689957 ) ) ( not ( = ?auto_689953 ?auto_689958 ) ) ( not ( = ?auto_689953 ?auto_689959 ) ) ( not ( = ?auto_689953 ?auto_689960 ) ) ( not ( = ?auto_689953 ?auto_689961 ) ) ( not ( = ?auto_689953 ?auto_689962 ) ) ( not ( = ?auto_689954 ?auto_689955 ) ) ( not ( = ?auto_689954 ?auto_689956 ) ) ( not ( = ?auto_689954 ?auto_689957 ) ) ( not ( = ?auto_689954 ?auto_689958 ) ) ( not ( = ?auto_689954 ?auto_689959 ) ) ( not ( = ?auto_689954 ?auto_689960 ) ) ( not ( = ?auto_689954 ?auto_689961 ) ) ( not ( = ?auto_689954 ?auto_689962 ) ) ( not ( = ?auto_689955 ?auto_689956 ) ) ( not ( = ?auto_689955 ?auto_689957 ) ) ( not ( = ?auto_689955 ?auto_689958 ) ) ( not ( = ?auto_689955 ?auto_689959 ) ) ( not ( = ?auto_689955 ?auto_689960 ) ) ( not ( = ?auto_689955 ?auto_689961 ) ) ( not ( = ?auto_689955 ?auto_689962 ) ) ( not ( = ?auto_689956 ?auto_689957 ) ) ( not ( = ?auto_689956 ?auto_689958 ) ) ( not ( = ?auto_689956 ?auto_689959 ) ) ( not ( = ?auto_689956 ?auto_689960 ) ) ( not ( = ?auto_689956 ?auto_689961 ) ) ( not ( = ?auto_689956 ?auto_689962 ) ) ( not ( = ?auto_689957 ?auto_689958 ) ) ( not ( = ?auto_689957 ?auto_689959 ) ) ( not ( = ?auto_689957 ?auto_689960 ) ) ( not ( = ?auto_689957 ?auto_689961 ) ) ( not ( = ?auto_689957 ?auto_689962 ) ) ( not ( = ?auto_689958 ?auto_689959 ) ) ( not ( = ?auto_689958 ?auto_689960 ) ) ( not ( = ?auto_689958 ?auto_689961 ) ) ( not ( = ?auto_689958 ?auto_689962 ) ) ( not ( = ?auto_689959 ?auto_689960 ) ) ( not ( = ?auto_689959 ?auto_689961 ) ) ( not ( = ?auto_689959 ?auto_689962 ) ) ( not ( = ?auto_689960 ?auto_689961 ) ) ( not ( = ?auto_689960 ?auto_689962 ) ) ( not ( = ?auto_689961 ?auto_689962 ) ) ( ON ?auto_689960 ?auto_689961 ) ( ON ?auto_689959 ?auto_689960 ) ( ON ?auto_689958 ?auto_689959 ) ( ON ?auto_689957 ?auto_689958 ) ( ON ?auto_689956 ?auto_689957 ) ( ON ?auto_689955 ?auto_689956 ) ( CLEAR ?auto_689953 ) ( ON ?auto_689954 ?auto_689955 ) ( CLEAR ?auto_689954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_689950 ?auto_689951 ?auto_689952 ?auto_689953 ?auto_689954 )
      ( MAKE-12PILE ?auto_689950 ?auto_689951 ?auto_689952 ?auto_689953 ?auto_689954 ?auto_689955 ?auto_689956 ?auto_689957 ?auto_689958 ?auto_689959 ?auto_689960 ?auto_689961 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_690000 - BLOCK
      ?auto_690001 - BLOCK
      ?auto_690002 - BLOCK
      ?auto_690003 - BLOCK
      ?auto_690004 - BLOCK
      ?auto_690005 - BLOCK
      ?auto_690006 - BLOCK
      ?auto_690007 - BLOCK
      ?auto_690008 - BLOCK
      ?auto_690009 - BLOCK
      ?auto_690010 - BLOCK
      ?auto_690011 - BLOCK
    )
    :vars
    (
      ?auto_690012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690011 ?auto_690012 ) ( ON-TABLE ?auto_690000 ) ( ON ?auto_690001 ?auto_690000 ) ( ON ?auto_690002 ?auto_690001 ) ( not ( = ?auto_690000 ?auto_690001 ) ) ( not ( = ?auto_690000 ?auto_690002 ) ) ( not ( = ?auto_690000 ?auto_690003 ) ) ( not ( = ?auto_690000 ?auto_690004 ) ) ( not ( = ?auto_690000 ?auto_690005 ) ) ( not ( = ?auto_690000 ?auto_690006 ) ) ( not ( = ?auto_690000 ?auto_690007 ) ) ( not ( = ?auto_690000 ?auto_690008 ) ) ( not ( = ?auto_690000 ?auto_690009 ) ) ( not ( = ?auto_690000 ?auto_690010 ) ) ( not ( = ?auto_690000 ?auto_690011 ) ) ( not ( = ?auto_690000 ?auto_690012 ) ) ( not ( = ?auto_690001 ?auto_690002 ) ) ( not ( = ?auto_690001 ?auto_690003 ) ) ( not ( = ?auto_690001 ?auto_690004 ) ) ( not ( = ?auto_690001 ?auto_690005 ) ) ( not ( = ?auto_690001 ?auto_690006 ) ) ( not ( = ?auto_690001 ?auto_690007 ) ) ( not ( = ?auto_690001 ?auto_690008 ) ) ( not ( = ?auto_690001 ?auto_690009 ) ) ( not ( = ?auto_690001 ?auto_690010 ) ) ( not ( = ?auto_690001 ?auto_690011 ) ) ( not ( = ?auto_690001 ?auto_690012 ) ) ( not ( = ?auto_690002 ?auto_690003 ) ) ( not ( = ?auto_690002 ?auto_690004 ) ) ( not ( = ?auto_690002 ?auto_690005 ) ) ( not ( = ?auto_690002 ?auto_690006 ) ) ( not ( = ?auto_690002 ?auto_690007 ) ) ( not ( = ?auto_690002 ?auto_690008 ) ) ( not ( = ?auto_690002 ?auto_690009 ) ) ( not ( = ?auto_690002 ?auto_690010 ) ) ( not ( = ?auto_690002 ?auto_690011 ) ) ( not ( = ?auto_690002 ?auto_690012 ) ) ( not ( = ?auto_690003 ?auto_690004 ) ) ( not ( = ?auto_690003 ?auto_690005 ) ) ( not ( = ?auto_690003 ?auto_690006 ) ) ( not ( = ?auto_690003 ?auto_690007 ) ) ( not ( = ?auto_690003 ?auto_690008 ) ) ( not ( = ?auto_690003 ?auto_690009 ) ) ( not ( = ?auto_690003 ?auto_690010 ) ) ( not ( = ?auto_690003 ?auto_690011 ) ) ( not ( = ?auto_690003 ?auto_690012 ) ) ( not ( = ?auto_690004 ?auto_690005 ) ) ( not ( = ?auto_690004 ?auto_690006 ) ) ( not ( = ?auto_690004 ?auto_690007 ) ) ( not ( = ?auto_690004 ?auto_690008 ) ) ( not ( = ?auto_690004 ?auto_690009 ) ) ( not ( = ?auto_690004 ?auto_690010 ) ) ( not ( = ?auto_690004 ?auto_690011 ) ) ( not ( = ?auto_690004 ?auto_690012 ) ) ( not ( = ?auto_690005 ?auto_690006 ) ) ( not ( = ?auto_690005 ?auto_690007 ) ) ( not ( = ?auto_690005 ?auto_690008 ) ) ( not ( = ?auto_690005 ?auto_690009 ) ) ( not ( = ?auto_690005 ?auto_690010 ) ) ( not ( = ?auto_690005 ?auto_690011 ) ) ( not ( = ?auto_690005 ?auto_690012 ) ) ( not ( = ?auto_690006 ?auto_690007 ) ) ( not ( = ?auto_690006 ?auto_690008 ) ) ( not ( = ?auto_690006 ?auto_690009 ) ) ( not ( = ?auto_690006 ?auto_690010 ) ) ( not ( = ?auto_690006 ?auto_690011 ) ) ( not ( = ?auto_690006 ?auto_690012 ) ) ( not ( = ?auto_690007 ?auto_690008 ) ) ( not ( = ?auto_690007 ?auto_690009 ) ) ( not ( = ?auto_690007 ?auto_690010 ) ) ( not ( = ?auto_690007 ?auto_690011 ) ) ( not ( = ?auto_690007 ?auto_690012 ) ) ( not ( = ?auto_690008 ?auto_690009 ) ) ( not ( = ?auto_690008 ?auto_690010 ) ) ( not ( = ?auto_690008 ?auto_690011 ) ) ( not ( = ?auto_690008 ?auto_690012 ) ) ( not ( = ?auto_690009 ?auto_690010 ) ) ( not ( = ?auto_690009 ?auto_690011 ) ) ( not ( = ?auto_690009 ?auto_690012 ) ) ( not ( = ?auto_690010 ?auto_690011 ) ) ( not ( = ?auto_690010 ?auto_690012 ) ) ( not ( = ?auto_690011 ?auto_690012 ) ) ( ON ?auto_690010 ?auto_690011 ) ( ON ?auto_690009 ?auto_690010 ) ( ON ?auto_690008 ?auto_690009 ) ( ON ?auto_690007 ?auto_690008 ) ( ON ?auto_690006 ?auto_690007 ) ( ON ?auto_690005 ?auto_690006 ) ( ON ?auto_690004 ?auto_690005 ) ( CLEAR ?auto_690002 ) ( ON ?auto_690003 ?auto_690004 ) ( CLEAR ?auto_690003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_690000 ?auto_690001 ?auto_690002 ?auto_690003 )
      ( MAKE-12PILE ?auto_690000 ?auto_690001 ?auto_690002 ?auto_690003 ?auto_690004 ?auto_690005 ?auto_690006 ?auto_690007 ?auto_690008 ?auto_690009 ?auto_690010 ?auto_690011 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_690050 - BLOCK
      ?auto_690051 - BLOCK
      ?auto_690052 - BLOCK
      ?auto_690053 - BLOCK
      ?auto_690054 - BLOCK
      ?auto_690055 - BLOCK
      ?auto_690056 - BLOCK
      ?auto_690057 - BLOCK
      ?auto_690058 - BLOCK
      ?auto_690059 - BLOCK
      ?auto_690060 - BLOCK
      ?auto_690061 - BLOCK
    )
    :vars
    (
      ?auto_690062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690061 ?auto_690062 ) ( ON-TABLE ?auto_690050 ) ( ON ?auto_690051 ?auto_690050 ) ( not ( = ?auto_690050 ?auto_690051 ) ) ( not ( = ?auto_690050 ?auto_690052 ) ) ( not ( = ?auto_690050 ?auto_690053 ) ) ( not ( = ?auto_690050 ?auto_690054 ) ) ( not ( = ?auto_690050 ?auto_690055 ) ) ( not ( = ?auto_690050 ?auto_690056 ) ) ( not ( = ?auto_690050 ?auto_690057 ) ) ( not ( = ?auto_690050 ?auto_690058 ) ) ( not ( = ?auto_690050 ?auto_690059 ) ) ( not ( = ?auto_690050 ?auto_690060 ) ) ( not ( = ?auto_690050 ?auto_690061 ) ) ( not ( = ?auto_690050 ?auto_690062 ) ) ( not ( = ?auto_690051 ?auto_690052 ) ) ( not ( = ?auto_690051 ?auto_690053 ) ) ( not ( = ?auto_690051 ?auto_690054 ) ) ( not ( = ?auto_690051 ?auto_690055 ) ) ( not ( = ?auto_690051 ?auto_690056 ) ) ( not ( = ?auto_690051 ?auto_690057 ) ) ( not ( = ?auto_690051 ?auto_690058 ) ) ( not ( = ?auto_690051 ?auto_690059 ) ) ( not ( = ?auto_690051 ?auto_690060 ) ) ( not ( = ?auto_690051 ?auto_690061 ) ) ( not ( = ?auto_690051 ?auto_690062 ) ) ( not ( = ?auto_690052 ?auto_690053 ) ) ( not ( = ?auto_690052 ?auto_690054 ) ) ( not ( = ?auto_690052 ?auto_690055 ) ) ( not ( = ?auto_690052 ?auto_690056 ) ) ( not ( = ?auto_690052 ?auto_690057 ) ) ( not ( = ?auto_690052 ?auto_690058 ) ) ( not ( = ?auto_690052 ?auto_690059 ) ) ( not ( = ?auto_690052 ?auto_690060 ) ) ( not ( = ?auto_690052 ?auto_690061 ) ) ( not ( = ?auto_690052 ?auto_690062 ) ) ( not ( = ?auto_690053 ?auto_690054 ) ) ( not ( = ?auto_690053 ?auto_690055 ) ) ( not ( = ?auto_690053 ?auto_690056 ) ) ( not ( = ?auto_690053 ?auto_690057 ) ) ( not ( = ?auto_690053 ?auto_690058 ) ) ( not ( = ?auto_690053 ?auto_690059 ) ) ( not ( = ?auto_690053 ?auto_690060 ) ) ( not ( = ?auto_690053 ?auto_690061 ) ) ( not ( = ?auto_690053 ?auto_690062 ) ) ( not ( = ?auto_690054 ?auto_690055 ) ) ( not ( = ?auto_690054 ?auto_690056 ) ) ( not ( = ?auto_690054 ?auto_690057 ) ) ( not ( = ?auto_690054 ?auto_690058 ) ) ( not ( = ?auto_690054 ?auto_690059 ) ) ( not ( = ?auto_690054 ?auto_690060 ) ) ( not ( = ?auto_690054 ?auto_690061 ) ) ( not ( = ?auto_690054 ?auto_690062 ) ) ( not ( = ?auto_690055 ?auto_690056 ) ) ( not ( = ?auto_690055 ?auto_690057 ) ) ( not ( = ?auto_690055 ?auto_690058 ) ) ( not ( = ?auto_690055 ?auto_690059 ) ) ( not ( = ?auto_690055 ?auto_690060 ) ) ( not ( = ?auto_690055 ?auto_690061 ) ) ( not ( = ?auto_690055 ?auto_690062 ) ) ( not ( = ?auto_690056 ?auto_690057 ) ) ( not ( = ?auto_690056 ?auto_690058 ) ) ( not ( = ?auto_690056 ?auto_690059 ) ) ( not ( = ?auto_690056 ?auto_690060 ) ) ( not ( = ?auto_690056 ?auto_690061 ) ) ( not ( = ?auto_690056 ?auto_690062 ) ) ( not ( = ?auto_690057 ?auto_690058 ) ) ( not ( = ?auto_690057 ?auto_690059 ) ) ( not ( = ?auto_690057 ?auto_690060 ) ) ( not ( = ?auto_690057 ?auto_690061 ) ) ( not ( = ?auto_690057 ?auto_690062 ) ) ( not ( = ?auto_690058 ?auto_690059 ) ) ( not ( = ?auto_690058 ?auto_690060 ) ) ( not ( = ?auto_690058 ?auto_690061 ) ) ( not ( = ?auto_690058 ?auto_690062 ) ) ( not ( = ?auto_690059 ?auto_690060 ) ) ( not ( = ?auto_690059 ?auto_690061 ) ) ( not ( = ?auto_690059 ?auto_690062 ) ) ( not ( = ?auto_690060 ?auto_690061 ) ) ( not ( = ?auto_690060 ?auto_690062 ) ) ( not ( = ?auto_690061 ?auto_690062 ) ) ( ON ?auto_690060 ?auto_690061 ) ( ON ?auto_690059 ?auto_690060 ) ( ON ?auto_690058 ?auto_690059 ) ( ON ?auto_690057 ?auto_690058 ) ( ON ?auto_690056 ?auto_690057 ) ( ON ?auto_690055 ?auto_690056 ) ( ON ?auto_690054 ?auto_690055 ) ( ON ?auto_690053 ?auto_690054 ) ( CLEAR ?auto_690051 ) ( ON ?auto_690052 ?auto_690053 ) ( CLEAR ?auto_690052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_690050 ?auto_690051 ?auto_690052 )
      ( MAKE-12PILE ?auto_690050 ?auto_690051 ?auto_690052 ?auto_690053 ?auto_690054 ?auto_690055 ?auto_690056 ?auto_690057 ?auto_690058 ?auto_690059 ?auto_690060 ?auto_690061 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_690100 - BLOCK
      ?auto_690101 - BLOCK
      ?auto_690102 - BLOCK
      ?auto_690103 - BLOCK
      ?auto_690104 - BLOCK
      ?auto_690105 - BLOCK
      ?auto_690106 - BLOCK
      ?auto_690107 - BLOCK
      ?auto_690108 - BLOCK
      ?auto_690109 - BLOCK
      ?auto_690110 - BLOCK
      ?auto_690111 - BLOCK
    )
    :vars
    (
      ?auto_690112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690111 ?auto_690112 ) ( ON-TABLE ?auto_690100 ) ( not ( = ?auto_690100 ?auto_690101 ) ) ( not ( = ?auto_690100 ?auto_690102 ) ) ( not ( = ?auto_690100 ?auto_690103 ) ) ( not ( = ?auto_690100 ?auto_690104 ) ) ( not ( = ?auto_690100 ?auto_690105 ) ) ( not ( = ?auto_690100 ?auto_690106 ) ) ( not ( = ?auto_690100 ?auto_690107 ) ) ( not ( = ?auto_690100 ?auto_690108 ) ) ( not ( = ?auto_690100 ?auto_690109 ) ) ( not ( = ?auto_690100 ?auto_690110 ) ) ( not ( = ?auto_690100 ?auto_690111 ) ) ( not ( = ?auto_690100 ?auto_690112 ) ) ( not ( = ?auto_690101 ?auto_690102 ) ) ( not ( = ?auto_690101 ?auto_690103 ) ) ( not ( = ?auto_690101 ?auto_690104 ) ) ( not ( = ?auto_690101 ?auto_690105 ) ) ( not ( = ?auto_690101 ?auto_690106 ) ) ( not ( = ?auto_690101 ?auto_690107 ) ) ( not ( = ?auto_690101 ?auto_690108 ) ) ( not ( = ?auto_690101 ?auto_690109 ) ) ( not ( = ?auto_690101 ?auto_690110 ) ) ( not ( = ?auto_690101 ?auto_690111 ) ) ( not ( = ?auto_690101 ?auto_690112 ) ) ( not ( = ?auto_690102 ?auto_690103 ) ) ( not ( = ?auto_690102 ?auto_690104 ) ) ( not ( = ?auto_690102 ?auto_690105 ) ) ( not ( = ?auto_690102 ?auto_690106 ) ) ( not ( = ?auto_690102 ?auto_690107 ) ) ( not ( = ?auto_690102 ?auto_690108 ) ) ( not ( = ?auto_690102 ?auto_690109 ) ) ( not ( = ?auto_690102 ?auto_690110 ) ) ( not ( = ?auto_690102 ?auto_690111 ) ) ( not ( = ?auto_690102 ?auto_690112 ) ) ( not ( = ?auto_690103 ?auto_690104 ) ) ( not ( = ?auto_690103 ?auto_690105 ) ) ( not ( = ?auto_690103 ?auto_690106 ) ) ( not ( = ?auto_690103 ?auto_690107 ) ) ( not ( = ?auto_690103 ?auto_690108 ) ) ( not ( = ?auto_690103 ?auto_690109 ) ) ( not ( = ?auto_690103 ?auto_690110 ) ) ( not ( = ?auto_690103 ?auto_690111 ) ) ( not ( = ?auto_690103 ?auto_690112 ) ) ( not ( = ?auto_690104 ?auto_690105 ) ) ( not ( = ?auto_690104 ?auto_690106 ) ) ( not ( = ?auto_690104 ?auto_690107 ) ) ( not ( = ?auto_690104 ?auto_690108 ) ) ( not ( = ?auto_690104 ?auto_690109 ) ) ( not ( = ?auto_690104 ?auto_690110 ) ) ( not ( = ?auto_690104 ?auto_690111 ) ) ( not ( = ?auto_690104 ?auto_690112 ) ) ( not ( = ?auto_690105 ?auto_690106 ) ) ( not ( = ?auto_690105 ?auto_690107 ) ) ( not ( = ?auto_690105 ?auto_690108 ) ) ( not ( = ?auto_690105 ?auto_690109 ) ) ( not ( = ?auto_690105 ?auto_690110 ) ) ( not ( = ?auto_690105 ?auto_690111 ) ) ( not ( = ?auto_690105 ?auto_690112 ) ) ( not ( = ?auto_690106 ?auto_690107 ) ) ( not ( = ?auto_690106 ?auto_690108 ) ) ( not ( = ?auto_690106 ?auto_690109 ) ) ( not ( = ?auto_690106 ?auto_690110 ) ) ( not ( = ?auto_690106 ?auto_690111 ) ) ( not ( = ?auto_690106 ?auto_690112 ) ) ( not ( = ?auto_690107 ?auto_690108 ) ) ( not ( = ?auto_690107 ?auto_690109 ) ) ( not ( = ?auto_690107 ?auto_690110 ) ) ( not ( = ?auto_690107 ?auto_690111 ) ) ( not ( = ?auto_690107 ?auto_690112 ) ) ( not ( = ?auto_690108 ?auto_690109 ) ) ( not ( = ?auto_690108 ?auto_690110 ) ) ( not ( = ?auto_690108 ?auto_690111 ) ) ( not ( = ?auto_690108 ?auto_690112 ) ) ( not ( = ?auto_690109 ?auto_690110 ) ) ( not ( = ?auto_690109 ?auto_690111 ) ) ( not ( = ?auto_690109 ?auto_690112 ) ) ( not ( = ?auto_690110 ?auto_690111 ) ) ( not ( = ?auto_690110 ?auto_690112 ) ) ( not ( = ?auto_690111 ?auto_690112 ) ) ( ON ?auto_690110 ?auto_690111 ) ( ON ?auto_690109 ?auto_690110 ) ( ON ?auto_690108 ?auto_690109 ) ( ON ?auto_690107 ?auto_690108 ) ( ON ?auto_690106 ?auto_690107 ) ( ON ?auto_690105 ?auto_690106 ) ( ON ?auto_690104 ?auto_690105 ) ( ON ?auto_690103 ?auto_690104 ) ( ON ?auto_690102 ?auto_690103 ) ( CLEAR ?auto_690100 ) ( ON ?auto_690101 ?auto_690102 ) ( CLEAR ?auto_690101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_690100 ?auto_690101 )
      ( MAKE-12PILE ?auto_690100 ?auto_690101 ?auto_690102 ?auto_690103 ?auto_690104 ?auto_690105 ?auto_690106 ?auto_690107 ?auto_690108 ?auto_690109 ?auto_690110 ?auto_690111 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_690150 - BLOCK
      ?auto_690151 - BLOCK
      ?auto_690152 - BLOCK
      ?auto_690153 - BLOCK
      ?auto_690154 - BLOCK
      ?auto_690155 - BLOCK
      ?auto_690156 - BLOCK
      ?auto_690157 - BLOCK
      ?auto_690158 - BLOCK
      ?auto_690159 - BLOCK
      ?auto_690160 - BLOCK
      ?auto_690161 - BLOCK
    )
    :vars
    (
      ?auto_690162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690161 ?auto_690162 ) ( not ( = ?auto_690150 ?auto_690151 ) ) ( not ( = ?auto_690150 ?auto_690152 ) ) ( not ( = ?auto_690150 ?auto_690153 ) ) ( not ( = ?auto_690150 ?auto_690154 ) ) ( not ( = ?auto_690150 ?auto_690155 ) ) ( not ( = ?auto_690150 ?auto_690156 ) ) ( not ( = ?auto_690150 ?auto_690157 ) ) ( not ( = ?auto_690150 ?auto_690158 ) ) ( not ( = ?auto_690150 ?auto_690159 ) ) ( not ( = ?auto_690150 ?auto_690160 ) ) ( not ( = ?auto_690150 ?auto_690161 ) ) ( not ( = ?auto_690150 ?auto_690162 ) ) ( not ( = ?auto_690151 ?auto_690152 ) ) ( not ( = ?auto_690151 ?auto_690153 ) ) ( not ( = ?auto_690151 ?auto_690154 ) ) ( not ( = ?auto_690151 ?auto_690155 ) ) ( not ( = ?auto_690151 ?auto_690156 ) ) ( not ( = ?auto_690151 ?auto_690157 ) ) ( not ( = ?auto_690151 ?auto_690158 ) ) ( not ( = ?auto_690151 ?auto_690159 ) ) ( not ( = ?auto_690151 ?auto_690160 ) ) ( not ( = ?auto_690151 ?auto_690161 ) ) ( not ( = ?auto_690151 ?auto_690162 ) ) ( not ( = ?auto_690152 ?auto_690153 ) ) ( not ( = ?auto_690152 ?auto_690154 ) ) ( not ( = ?auto_690152 ?auto_690155 ) ) ( not ( = ?auto_690152 ?auto_690156 ) ) ( not ( = ?auto_690152 ?auto_690157 ) ) ( not ( = ?auto_690152 ?auto_690158 ) ) ( not ( = ?auto_690152 ?auto_690159 ) ) ( not ( = ?auto_690152 ?auto_690160 ) ) ( not ( = ?auto_690152 ?auto_690161 ) ) ( not ( = ?auto_690152 ?auto_690162 ) ) ( not ( = ?auto_690153 ?auto_690154 ) ) ( not ( = ?auto_690153 ?auto_690155 ) ) ( not ( = ?auto_690153 ?auto_690156 ) ) ( not ( = ?auto_690153 ?auto_690157 ) ) ( not ( = ?auto_690153 ?auto_690158 ) ) ( not ( = ?auto_690153 ?auto_690159 ) ) ( not ( = ?auto_690153 ?auto_690160 ) ) ( not ( = ?auto_690153 ?auto_690161 ) ) ( not ( = ?auto_690153 ?auto_690162 ) ) ( not ( = ?auto_690154 ?auto_690155 ) ) ( not ( = ?auto_690154 ?auto_690156 ) ) ( not ( = ?auto_690154 ?auto_690157 ) ) ( not ( = ?auto_690154 ?auto_690158 ) ) ( not ( = ?auto_690154 ?auto_690159 ) ) ( not ( = ?auto_690154 ?auto_690160 ) ) ( not ( = ?auto_690154 ?auto_690161 ) ) ( not ( = ?auto_690154 ?auto_690162 ) ) ( not ( = ?auto_690155 ?auto_690156 ) ) ( not ( = ?auto_690155 ?auto_690157 ) ) ( not ( = ?auto_690155 ?auto_690158 ) ) ( not ( = ?auto_690155 ?auto_690159 ) ) ( not ( = ?auto_690155 ?auto_690160 ) ) ( not ( = ?auto_690155 ?auto_690161 ) ) ( not ( = ?auto_690155 ?auto_690162 ) ) ( not ( = ?auto_690156 ?auto_690157 ) ) ( not ( = ?auto_690156 ?auto_690158 ) ) ( not ( = ?auto_690156 ?auto_690159 ) ) ( not ( = ?auto_690156 ?auto_690160 ) ) ( not ( = ?auto_690156 ?auto_690161 ) ) ( not ( = ?auto_690156 ?auto_690162 ) ) ( not ( = ?auto_690157 ?auto_690158 ) ) ( not ( = ?auto_690157 ?auto_690159 ) ) ( not ( = ?auto_690157 ?auto_690160 ) ) ( not ( = ?auto_690157 ?auto_690161 ) ) ( not ( = ?auto_690157 ?auto_690162 ) ) ( not ( = ?auto_690158 ?auto_690159 ) ) ( not ( = ?auto_690158 ?auto_690160 ) ) ( not ( = ?auto_690158 ?auto_690161 ) ) ( not ( = ?auto_690158 ?auto_690162 ) ) ( not ( = ?auto_690159 ?auto_690160 ) ) ( not ( = ?auto_690159 ?auto_690161 ) ) ( not ( = ?auto_690159 ?auto_690162 ) ) ( not ( = ?auto_690160 ?auto_690161 ) ) ( not ( = ?auto_690160 ?auto_690162 ) ) ( not ( = ?auto_690161 ?auto_690162 ) ) ( ON ?auto_690160 ?auto_690161 ) ( ON ?auto_690159 ?auto_690160 ) ( ON ?auto_690158 ?auto_690159 ) ( ON ?auto_690157 ?auto_690158 ) ( ON ?auto_690156 ?auto_690157 ) ( ON ?auto_690155 ?auto_690156 ) ( ON ?auto_690154 ?auto_690155 ) ( ON ?auto_690153 ?auto_690154 ) ( ON ?auto_690152 ?auto_690153 ) ( ON ?auto_690151 ?auto_690152 ) ( ON ?auto_690150 ?auto_690151 ) ( CLEAR ?auto_690150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_690150 )
      ( MAKE-12PILE ?auto_690150 ?auto_690151 ?auto_690152 ?auto_690153 ?auto_690154 ?auto_690155 ?auto_690156 ?auto_690157 ?auto_690158 ?auto_690159 ?auto_690160 ?auto_690161 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_690201 - BLOCK
      ?auto_690202 - BLOCK
      ?auto_690203 - BLOCK
      ?auto_690204 - BLOCK
      ?auto_690205 - BLOCK
      ?auto_690206 - BLOCK
      ?auto_690207 - BLOCK
      ?auto_690208 - BLOCK
      ?auto_690209 - BLOCK
      ?auto_690210 - BLOCK
      ?auto_690211 - BLOCK
      ?auto_690212 - BLOCK
      ?auto_690213 - BLOCK
    )
    :vars
    (
      ?auto_690214 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_690212 ) ( ON ?auto_690213 ?auto_690214 ) ( CLEAR ?auto_690213 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_690201 ) ( ON ?auto_690202 ?auto_690201 ) ( ON ?auto_690203 ?auto_690202 ) ( ON ?auto_690204 ?auto_690203 ) ( ON ?auto_690205 ?auto_690204 ) ( ON ?auto_690206 ?auto_690205 ) ( ON ?auto_690207 ?auto_690206 ) ( ON ?auto_690208 ?auto_690207 ) ( ON ?auto_690209 ?auto_690208 ) ( ON ?auto_690210 ?auto_690209 ) ( ON ?auto_690211 ?auto_690210 ) ( ON ?auto_690212 ?auto_690211 ) ( not ( = ?auto_690201 ?auto_690202 ) ) ( not ( = ?auto_690201 ?auto_690203 ) ) ( not ( = ?auto_690201 ?auto_690204 ) ) ( not ( = ?auto_690201 ?auto_690205 ) ) ( not ( = ?auto_690201 ?auto_690206 ) ) ( not ( = ?auto_690201 ?auto_690207 ) ) ( not ( = ?auto_690201 ?auto_690208 ) ) ( not ( = ?auto_690201 ?auto_690209 ) ) ( not ( = ?auto_690201 ?auto_690210 ) ) ( not ( = ?auto_690201 ?auto_690211 ) ) ( not ( = ?auto_690201 ?auto_690212 ) ) ( not ( = ?auto_690201 ?auto_690213 ) ) ( not ( = ?auto_690201 ?auto_690214 ) ) ( not ( = ?auto_690202 ?auto_690203 ) ) ( not ( = ?auto_690202 ?auto_690204 ) ) ( not ( = ?auto_690202 ?auto_690205 ) ) ( not ( = ?auto_690202 ?auto_690206 ) ) ( not ( = ?auto_690202 ?auto_690207 ) ) ( not ( = ?auto_690202 ?auto_690208 ) ) ( not ( = ?auto_690202 ?auto_690209 ) ) ( not ( = ?auto_690202 ?auto_690210 ) ) ( not ( = ?auto_690202 ?auto_690211 ) ) ( not ( = ?auto_690202 ?auto_690212 ) ) ( not ( = ?auto_690202 ?auto_690213 ) ) ( not ( = ?auto_690202 ?auto_690214 ) ) ( not ( = ?auto_690203 ?auto_690204 ) ) ( not ( = ?auto_690203 ?auto_690205 ) ) ( not ( = ?auto_690203 ?auto_690206 ) ) ( not ( = ?auto_690203 ?auto_690207 ) ) ( not ( = ?auto_690203 ?auto_690208 ) ) ( not ( = ?auto_690203 ?auto_690209 ) ) ( not ( = ?auto_690203 ?auto_690210 ) ) ( not ( = ?auto_690203 ?auto_690211 ) ) ( not ( = ?auto_690203 ?auto_690212 ) ) ( not ( = ?auto_690203 ?auto_690213 ) ) ( not ( = ?auto_690203 ?auto_690214 ) ) ( not ( = ?auto_690204 ?auto_690205 ) ) ( not ( = ?auto_690204 ?auto_690206 ) ) ( not ( = ?auto_690204 ?auto_690207 ) ) ( not ( = ?auto_690204 ?auto_690208 ) ) ( not ( = ?auto_690204 ?auto_690209 ) ) ( not ( = ?auto_690204 ?auto_690210 ) ) ( not ( = ?auto_690204 ?auto_690211 ) ) ( not ( = ?auto_690204 ?auto_690212 ) ) ( not ( = ?auto_690204 ?auto_690213 ) ) ( not ( = ?auto_690204 ?auto_690214 ) ) ( not ( = ?auto_690205 ?auto_690206 ) ) ( not ( = ?auto_690205 ?auto_690207 ) ) ( not ( = ?auto_690205 ?auto_690208 ) ) ( not ( = ?auto_690205 ?auto_690209 ) ) ( not ( = ?auto_690205 ?auto_690210 ) ) ( not ( = ?auto_690205 ?auto_690211 ) ) ( not ( = ?auto_690205 ?auto_690212 ) ) ( not ( = ?auto_690205 ?auto_690213 ) ) ( not ( = ?auto_690205 ?auto_690214 ) ) ( not ( = ?auto_690206 ?auto_690207 ) ) ( not ( = ?auto_690206 ?auto_690208 ) ) ( not ( = ?auto_690206 ?auto_690209 ) ) ( not ( = ?auto_690206 ?auto_690210 ) ) ( not ( = ?auto_690206 ?auto_690211 ) ) ( not ( = ?auto_690206 ?auto_690212 ) ) ( not ( = ?auto_690206 ?auto_690213 ) ) ( not ( = ?auto_690206 ?auto_690214 ) ) ( not ( = ?auto_690207 ?auto_690208 ) ) ( not ( = ?auto_690207 ?auto_690209 ) ) ( not ( = ?auto_690207 ?auto_690210 ) ) ( not ( = ?auto_690207 ?auto_690211 ) ) ( not ( = ?auto_690207 ?auto_690212 ) ) ( not ( = ?auto_690207 ?auto_690213 ) ) ( not ( = ?auto_690207 ?auto_690214 ) ) ( not ( = ?auto_690208 ?auto_690209 ) ) ( not ( = ?auto_690208 ?auto_690210 ) ) ( not ( = ?auto_690208 ?auto_690211 ) ) ( not ( = ?auto_690208 ?auto_690212 ) ) ( not ( = ?auto_690208 ?auto_690213 ) ) ( not ( = ?auto_690208 ?auto_690214 ) ) ( not ( = ?auto_690209 ?auto_690210 ) ) ( not ( = ?auto_690209 ?auto_690211 ) ) ( not ( = ?auto_690209 ?auto_690212 ) ) ( not ( = ?auto_690209 ?auto_690213 ) ) ( not ( = ?auto_690209 ?auto_690214 ) ) ( not ( = ?auto_690210 ?auto_690211 ) ) ( not ( = ?auto_690210 ?auto_690212 ) ) ( not ( = ?auto_690210 ?auto_690213 ) ) ( not ( = ?auto_690210 ?auto_690214 ) ) ( not ( = ?auto_690211 ?auto_690212 ) ) ( not ( = ?auto_690211 ?auto_690213 ) ) ( not ( = ?auto_690211 ?auto_690214 ) ) ( not ( = ?auto_690212 ?auto_690213 ) ) ( not ( = ?auto_690212 ?auto_690214 ) ) ( not ( = ?auto_690213 ?auto_690214 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_690213 ?auto_690214 )
      ( !STACK ?auto_690213 ?auto_690212 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_690255 - BLOCK
      ?auto_690256 - BLOCK
      ?auto_690257 - BLOCK
      ?auto_690258 - BLOCK
      ?auto_690259 - BLOCK
      ?auto_690260 - BLOCK
      ?auto_690261 - BLOCK
      ?auto_690262 - BLOCK
      ?auto_690263 - BLOCK
      ?auto_690264 - BLOCK
      ?auto_690265 - BLOCK
      ?auto_690266 - BLOCK
      ?auto_690267 - BLOCK
    )
    :vars
    (
      ?auto_690268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690267 ?auto_690268 ) ( ON-TABLE ?auto_690255 ) ( ON ?auto_690256 ?auto_690255 ) ( ON ?auto_690257 ?auto_690256 ) ( ON ?auto_690258 ?auto_690257 ) ( ON ?auto_690259 ?auto_690258 ) ( ON ?auto_690260 ?auto_690259 ) ( ON ?auto_690261 ?auto_690260 ) ( ON ?auto_690262 ?auto_690261 ) ( ON ?auto_690263 ?auto_690262 ) ( ON ?auto_690264 ?auto_690263 ) ( ON ?auto_690265 ?auto_690264 ) ( not ( = ?auto_690255 ?auto_690256 ) ) ( not ( = ?auto_690255 ?auto_690257 ) ) ( not ( = ?auto_690255 ?auto_690258 ) ) ( not ( = ?auto_690255 ?auto_690259 ) ) ( not ( = ?auto_690255 ?auto_690260 ) ) ( not ( = ?auto_690255 ?auto_690261 ) ) ( not ( = ?auto_690255 ?auto_690262 ) ) ( not ( = ?auto_690255 ?auto_690263 ) ) ( not ( = ?auto_690255 ?auto_690264 ) ) ( not ( = ?auto_690255 ?auto_690265 ) ) ( not ( = ?auto_690255 ?auto_690266 ) ) ( not ( = ?auto_690255 ?auto_690267 ) ) ( not ( = ?auto_690255 ?auto_690268 ) ) ( not ( = ?auto_690256 ?auto_690257 ) ) ( not ( = ?auto_690256 ?auto_690258 ) ) ( not ( = ?auto_690256 ?auto_690259 ) ) ( not ( = ?auto_690256 ?auto_690260 ) ) ( not ( = ?auto_690256 ?auto_690261 ) ) ( not ( = ?auto_690256 ?auto_690262 ) ) ( not ( = ?auto_690256 ?auto_690263 ) ) ( not ( = ?auto_690256 ?auto_690264 ) ) ( not ( = ?auto_690256 ?auto_690265 ) ) ( not ( = ?auto_690256 ?auto_690266 ) ) ( not ( = ?auto_690256 ?auto_690267 ) ) ( not ( = ?auto_690256 ?auto_690268 ) ) ( not ( = ?auto_690257 ?auto_690258 ) ) ( not ( = ?auto_690257 ?auto_690259 ) ) ( not ( = ?auto_690257 ?auto_690260 ) ) ( not ( = ?auto_690257 ?auto_690261 ) ) ( not ( = ?auto_690257 ?auto_690262 ) ) ( not ( = ?auto_690257 ?auto_690263 ) ) ( not ( = ?auto_690257 ?auto_690264 ) ) ( not ( = ?auto_690257 ?auto_690265 ) ) ( not ( = ?auto_690257 ?auto_690266 ) ) ( not ( = ?auto_690257 ?auto_690267 ) ) ( not ( = ?auto_690257 ?auto_690268 ) ) ( not ( = ?auto_690258 ?auto_690259 ) ) ( not ( = ?auto_690258 ?auto_690260 ) ) ( not ( = ?auto_690258 ?auto_690261 ) ) ( not ( = ?auto_690258 ?auto_690262 ) ) ( not ( = ?auto_690258 ?auto_690263 ) ) ( not ( = ?auto_690258 ?auto_690264 ) ) ( not ( = ?auto_690258 ?auto_690265 ) ) ( not ( = ?auto_690258 ?auto_690266 ) ) ( not ( = ?auto_690258 ?auto_690267 ) ) ( not ( = ?auto_690258 ?auto_690268 ) ) ( not ( = ?auto_690259 ?auto_690260 ) ) ( not ( = ?auto_690259 ?auto_690261 ) ) ( not ( = ?auto_690259 ?auto_690262 ) ) ( not ( = ?auto_690259 ?auto_690263 ) ) ( not ( = ?auto_690259 ?auto_690264 ) ) ( not ( = ?auto_690259 ?auto_690265 ) ) ( not ( = ?auto_690259 ?auto_690266 ) ) ( not ( = ?auto_690259 ?auto_690267 ) ) ( not ( = ?auto_690259 ?auto_690268 ) ) ( not ( = ?auto_690260 ?auto_690261 ) ) ( not ( = ?auto_690260 ?auto_690262 ) ) ( not ( = ?auto_690260 ?auto_690263 ) ) ( not ( = ?auto_690260 ?auto_690264 ) ) ( not ( = ?auto_690260 ?auto_690265 ) ) ( not ( = ?auto_690260 ?auto_690266 ) ) ( not ( = ?auto_690260 ?auto_690267 ) ) ( not ( = ?auto_690260 ?auto_690268 ) ) ( not ( = ?auto_690261 ?auto_690262 ) ) ( not ( = ?auto_690261 ?auto_690263 ) ) ( not ( = ?auto_690261 ?auto_690264 ) ) ( not ( = ?auto_690261 ?auto_690265 ) ) ( not ( = ?auto_690261 ?auto_690266 ) ) ( not ( = ?auto_690261 ?auto_690267 ) ) ( not ( = ?auto_690261 ?auto_690268 ) ) ( not ( = ?auto_690262 ?auto_690263 ) ) ( not ( = ?auto_690262 ?auto_690264 ) ) ( not ( = ?auto_690262 ?auto_690265 ) ) ( not ( = ?auto_690262 ?auto_690266 ) ) ( not ( = ?auto_690262 ?auto_690267 ) ) ( not ( = ?auto_690262 ?auto_690268 ) ) ( not ( = ?auto_690263 ?auto_690264 ) ) ( not ( = ?auto_690263 ?auto_690265 ) ) ( not ( = ?auto_690263 ?auto_690266 ) ) ( not ( = ?auto_690263 ?auto_690267 ) ) ( not ( = ?auto_690263 ?auto_690268 ) ) ( not ( = ?auto_690264 ?auto_690265 ) ) ( not ( = ?auto_690264 ?auto_690266 ) ) ( not ( = ?auto_690264 ?auto_690267 ) ) ( not ( = ?auto_690264 ?auto_690268 ) ) ( not ( = ?auto_690265 ?auto_690266 ) ) ( not ( = ?auto_690265 ?auto_690267 ) ) ( not ( = ?auto_690265 ?auto_690268 ) ) ( not ( = ?auto_690266 ?auto_690267 ) ) ( not ( = ?auto_690266 ?auto_690268 ) ) ( not ( = ?auto_690267 ?auto_690268 ) ) ( CLEAR ?auto_690265 ) ( ON ?auto_690266 ?auto_690267 ) ( CLEAR ?auto_690266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_690255 ?auto_690256 ?auto_690257 ?auto_690258 ?auto_690259 ?auto_690260 ?auto_690261 ?auto_690262 ?auto_690263 ?auto_690264 ?auto_690265 ?auto_690266 )
      ( MAKE-13PILE ?auto_690255 ?auto_690256 ?auto_690257 ?auto_690258 ?auto_690259 ?auto_690260 ?auto_690261 ?auto_690262 ?auto_690263 ?auto_690264 ?auto_690265 ?auto_690266 ?auto_690267 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_690309 - BLOCK
      ?auto_690310 - BLOCK
      ?auto_690311 - BLOCK
      ?auto_690312 - BLOCK
      ?auto_690313 - BLOCK
      ?auto_690314 - BLOCK
      ?auto_690315 - BLOCK
      ?auto_690316 - BLOCK
      ?auto_690317 - BLOCK
      ?auto_690318 - BLOCK
      ?auto_690319 - BLOCK
      ?auto_690320 - BLOCK
      ?auto_690321 - BLOCK
    )
    :vars
    (
      ?auto_690322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690321 ?auto_690322 ) ( ON-TABLE ?auto_690309 ) ( ON ?auto_690310 ?auto_690309 ) ( ON ?auto_690311 ?auto_690310 ) ( ON ?auto_690312 ?auto_690311 ) ( ON ?auto_690313 ?auto_690312 ) ( ON ?auto_690314 ?auto_690313 ) ( ON ?auto_690315 ?auto_690314 ) ( ON ?auto_690316 ?auto_690315 ) ( ON ?auto_690317 ?auto_690316 ) ( ON ?auto_690318 ?auto_690317 ) ( not ( = ?auto_690309 ?auto_690310 ) ) ( not ( = ?auto_690309 ?auto_690311 ) ) ( not ( = ?auto_690309 ?auto_690312 ) ) ( not ( = ?auto_690309 ?auto_690313 ) ) ( not ( = ?auto_690309 ?auto_690314 ) ) ( not ( = ?auto_690309 ?auto_690315 ) ) ( not ( = ?auto_690309 ?auto_690316 ) ) ( not ( = ?auto_690309 ?auto_690317 ) ) ( not ( = ?auto_690309 ?auto_690318 ) ) ( not ( = ?auto_690309 ?auto_690319 ) ) ( not ( = ?auto_690309 ?auto_690320 ) ) ( not ( = ?auto_690309 ?auto_690321 ) ) ( not ( = ?auto_690309 ?auto_690322 ) ) ( not ( = ?auto_690310 ?auto_690311 ) ) ( not ( = ?auto_690310 ?auto_690312 ) ) ( not ( = ?auto_690310 ?auto_690313 ) ) ( not ( = ?auto_690310 ?auto_690314 ) ) ( not ( = ?auto_690310 ?auto_690315 ) ) ( not ( = ?auto_690310 ?auto_690316 ) ) ( not ( = ?auto_690310 ?auto_690317 ) ) ( not ( = ?auto_690310 ?auto_690318 ) ) ( not ( = ?auto_690310 ?auto_690319 ) ) ( not ( = ?auto_690310 ?auto_690320 ) ) ( not ( = ?auto_690310 ?auto_690321 ) ) ( not ( = ?auto_690310 ?auto_690322 ) ) ( not ( = ?auto_690311 ?auto_690312 ) ) ( not ( = ?auto_690311 ?auto_690313 ) ) ( not ( = ?auto_690311 ?auto_690314 ) ) ( not ( = ?auto_690311 ?auto_690315 ) ) ( not ( = ?auto_690311 ?auto_690316 ) ) ( not ( = ?auto_690311 ?auto_690317 ) ) ( not ( = ?auto_690311 ?auto_690318 ) ) ( not ( = ?auto_690311 ?auto_690319 ) ) ( not ( = ?auto_690311 ?auto_690320 ) ) ( not ( = ?auto_690311 ?auto_690321 ) ) ( not ( = ?auto_690311 ?auto_690322 ) ) ( not ( = ?auto_690312 ?auto_690313 ) ) ( not ( = ?auto_690312 ?auto_690314 ) ) ( not ( = ?auto_690312 ?auto_690315 ) ) ( not ( = ?auto_690312 ?auto_690316 ) ) ( not ( = ?auto_690312 ?auto_690317 ) ) ( not ( = ?auto_690312 ?auto_690318 ) ) ( not ( = ?auto_690312 ?auto_690319 ) ) ( not ( = ?auto_690312 ?auto_690320 ) ) ( not ( = ?auto_690312 ?auto_690321 ) ) ( not ( = ?auto_690312 ?auto_690322 ) ) ( not ( = ?auto_690313 ?auto_690314 ) ) ( not ( = ?auto_690313 ?auto_690315 ) ) ( not ( = ?auto_690313 ?auto_690316 ) ) ( not ( = ?auto_690313 ?auto_690317 ) ) ( not ( = ?auto_690313 ?auto_690318 ) ) ( not ( = ?auto_690313 ?auto_690319 ) ) ( not ( = ?auto_690313 ?auto_690320 ) ) ( not ( = ?auto_690313 ?auto_690321 ) ) ( not ( = ?auto_690313 ?auto_690322 ) ) ( not ( = ?auto_690314 ?auto_690315 ) ) ( not ( = ?auto_690314 ?auto_690316 ) ) ( not ( = ?auto_690314 ?auto_690317 ) ) ( not ( = ?auto_690314 ?auto_690318 ) ) ( not ( = ?auto_690314 ?auto_690319 ) ) ( not ( = ?auto_690314 ?auto_690320 ) ) ( not ( = ?auto_690314 ?auto_690321 ) ) ( not ( = ?auto_690314 ?auto_690322 ) ) ( not ( = ?auto_690315 ?auto_690316 ) ) ( not ( = ?auto_690315 ?auto_690317 ) ) ( not ( = ?auto_690315 ?auto_690318 ) ) ( not ( = ?auto_690315 ?auto_690319 ) ) ( not ( = ?auto_690315 ?auto_690320 ) ) ( not ( = ?auto_690315 ?auto_690321 ) ) ( not ( = ?auto_690315 ?auto_690322 ) ) ( not ( = ?auto_690316 ?auto_690317 ) ) ( not ( = ?auto_690316 ?auto_690318 ) ) ( not ( = ?auto_690316 ?auto_690319 ) ) ( not ( = ?auto_690316 ?auto_690320 ) ) ( not ( = ?auto_690316 ?auto_690321 ) ) ( not ( = ?auto_690316 ?auto_690322 ) ) ( not ( = ?auto_690317 ?auto_690318 ) ) ( not ( = ?auto_690317 ?auto_690319 ) ) ( not ( = ?auto_690317 ?auto_690320 ) ) ( not ( = ?auto_690317 ?auto_690321 ) ) ( not ( = ?auto_690317 ?auto_690322 ) ) ( not ( = ?auto_690318 ?auto_690319 ) ) ( not ( = ?auto_690318 ?auto_690320 ) ) ( not ( = ?auto_690318 ?auto_690321 ) ) ( not ( = ?auto_690318 ?auto_690322 ) ) ( not ( = ?auto_690319 ?auto_690320 ) ) ( not ( = ?auto_690319 ?auto_690321 ) ) ( not ( = ?auto_690319 ?auto_690322 ) ) ( not ( = ?auto_690320 ?auto_690321 ) ) ( not ( = ?auto_690320 ?auto_690322 ) ) ( not ( = ?auto_690321 ?auto_690322 ) ) ( ON ?auto_690320 ?auto_690321 ) ( CLEAR ?auto_690318 ) ( ON ?auto_690319 ?auto_690320 ) ( CLEAR ?auto_690319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_690309 ?auto_690310 ?auto_690311 ?auto_690312 ?auto_690313 ?auto_690314 ?auto_690315 ?auto_690316 ?auto_690317 ?auto_690318 ?auto_690319 )
      ( MAKE-13PILE ?auto_690309 ?auto_690310 ?auto_690311 ?auto_690312 ?auto_690313 ?auto_690314 ?auto_690315 ?auto_690316 ?auto_690317 ?auto_690318 ?auto_690319 ?auto_690320 ?auto_690321 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_690363 - BLOCK
      ?auto_690364 - BLOCK
      ?auto_690365 - BLOCK
      ?auto_690366 - BLOCK
      ?auto_690367 - BLOCK
      ?auto_690368 - BLOCK
      ?auto_690369 - BLOCK
      ?auto_690370 - BLOCK
      ?auto_690371 - BLOCK
      ?auto_690372 - BLOCK
      ?auto_690373 - BLOCK
      ?auto_690374 - BLOCK
      ?auto_690375 - BLOCK
    )
    :vars
    (
      ?auto_690376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690375 ?auto_690376 ) ( ON-TABLE ?auto_690363 ) ( ON ?auto_690364 ?auto_690363 ) ( ON ?auto_690365 ?auto_690364 ) ( ON ?auto_690366 ?auto_690365 ) ( ON ?auto_690367 ?auto_690366 ) ( ON ?auto_690368 ?auto_690367 ) ( ON ?auto_690369 ?auto_690368 ) ( ON ?auto_690370 ?auto_690369 ) ( ON ?auto_690371 ?auto_690370 ) ( not ( = ?auto_690363 ?auto_690364 ) ) ( not ( = ?auto_690363 ?auto_690365 ) ) ( not ( = ?auto_690363 ?auto_690366 ) ) ( not ( = ?auto_690363 ?auto_690367 ) ) ( not ( = ?auto_690363 ?auto_690368 ) ) ( not ( = ?auto_690363 ?auto_690369 ) ) ( not ( = ?auto_690363 ?auto_690370 ) ) ( not ( = ?auto_690363 ?auto_690371 ) ) ( not ( = ?auto_690363 ?auto_690372 ) ) ( not ( = ?auto_690363 ?auto_690373 ) ) ( not ( = ?auto_690363 ?auto_690374 ) ) ( not ( = ?auto_690363 ?auto_690375 ) ) ( not ( = ?auto_690363 ?auto_690376 ) ) ( not ( = ?auto_690364 ?auto_690365 ) ) ( not ( = ?auto_690364 ?auto_690366 ) ) ( not ( = ?auto_690364 ?auto_690367 ) ) ( not ( = ?auto_690364 ?auto_690368 ) ) ( not ( = ?auto_690364 ?auto_690369 ) ) ( not ( = ?auto_690364 ?auto_690370 ) ) ( not ( = ?auto_690364 ?auto_690371 ) ) ( not ( = ?auto_690364 ?auto_690372 ) ) ( not ( = ?auto_690364 ?auto_690373 ) ) ( not ( = ?auto_690364 ?auto_690374 ) ) ( not ( = ?auto_690364 ?auto_690375 ) ) ( not ( = ?auto_690364 ?auto_690376 ) ) ( not ( = ?auto_690365 ?auto_690366 ) ) ( not ( = ?auto_690365 ?auto_690367 ) ) ( not ( = ?auto_690365 ?auto_690368 ) ) ( not ( = ?auto_690365 ?auto_690369 ) ) ( not ( = ?auto_690365 ?auto_690370 ) ) ( not ( = ?auto_690365 ?auto_690371 ) ) ( not ( = ?auto_690365 ?auto_690372 ) ) ( not ( = ?auto_690365 ?auto_690373 ) ) ( not ( = ?auto_690365 ?auto_690374 ) ) ( not ( = ?auto_690365 ?auto_690375 ) ) ( not ( = ?auto_690365 ?auto_690376 ) ) ( not ( = ?auto_690366 ?auto_690367 ) ) ( not ( = ?auto_690366 ?auto_690368 ) ) ( not ( = ?auto_690366 ?auto_690369 ) ) ( not ( = ?auto_690366 ?auto_690370 ) ) ( not ( = ?auto_690366 ?auto_690371 ) ) ( not ( = ?auto_690366 ?auto_690372 ) ) ( not ( = ?auto_690366 ?auto_690373 ) ) ( not ( = ?auto_690366 ?auto_690374 ) ) ( not ( = ?auto_690366 ?auto_690375 ) ) ( not ( = ?auto_690366 ?auto_690376 ) ) ( not ( = ?auto_690367 ?auto_690368 ) ) ( not ( = ?auto_690367 ?auto_690369 ) ) ( not ( = ?auto_690367 ?auto_690370 ) ) ( not ( = ?auto_690367 ?auto_690371 ) ) ( not ( = ?auto_690367 ?auto_690372 ) ) ( not ( = ?auto_690367 ?auto_690373 ) ) ( not ( = ?auto_690367 ?auto_690374 ) ) ( not ( = ?auto_690367 ?auto_690375 ) ) ( not ( = ?auto_690367 ?auto_690376 ) ) ( not ( = ?auto_690368 ?auto_690369 ) ) ( not ( = ?auto_690368 ?auto_690370 ) ) ( not ( = ?auto_690368 ?auto_690371 ) ) ( not ( = ?auto_690368 ?auto_690372 ) ) ( not ( = ?auto_690368 ?auto_690373 ) ) ( not ( = ?auto_690368 ?auto_690374 ) ) ( not ( = ?auto_690368 ?auto_690375 ) ) ( not ( = ?auto_690368 ?auto_690376 ) ) ( not ( = ?auto_690369 ?auto_690370 ) ) ( not ( = ?auto_690369 ?auto_690371 ) ) ( not ( = ?auto_690369 ?auto_690372 ) ) ( not ( = ?auto_690369 ?auto_690373 ) ) ( not ( = ?auto_690369 ?auto_690374 ) ) ( not ( = ?auto_690369 ?auto_690375 ) ) ( not ( = ?auto_690369 ?auto_690376 ) ) ( not ( = ?auto_690370 ?auto_690371 ) ) ( not ( = ?auto_690370 ?auto_690372 ) ) ( not ( = ?auto_690370 ?auto_690373 ) ) ( not ( = ?auto_690370 ?auto_690374 ) ) ( not ( = ?auto_690370 ?auto_690375 ) ) ( not ( = ?auto_690370 ?auto_690376 ) ) ( not ( = ?auto_690371 ?auto_690372 ) ) ( not ( = ?auto_690371 ?auto_690373 ) ) ( not ( = ?auto_690371 ?auto_690374 ) ) ( not ( = ?auto_690371 ?auto_690375 ) ) ( not ( = ?auto_690371 ?auto_690376 ) ) ( not ( = ?auto_690372 ?auto_690373 ) ) ( not ( = ?auto_690372 ?auto_690374 ) ) ( not ( = ?auto_690372 ?auto_690375 ) ) ( not ( = ?auto_690372 ?auto_690376 ) ) ( not ( = ?auto_690373 ?auto_690374 ) ) ( not ( = ?auto_690373 ?auto_690375 ) ) ( not ( = ?auto_690373 ?auto_690376 ) ) ( not ( = ?auto_690374 ?auto_690375 ) ) ( not ( = ?auto_690374 ?auto_690376 ) ) ( not ( = ?auto_690375 ?auto_690376 ) ) ( ON ?auto_690374 ?auto_690375 ) ( ON ?auto_690373 ?auto_690374 ) ( CLEAR ?auto_690371 ) ( ON ?auto_690372 ?auto_690373 ) ( CLEAR ?auto_690372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_690363 ?auto_690364 ?auto_690365 ?auto_690366 ?auto_690367 ?auto_690368 ?auto_690369 ?auto_690370 ?auto_690371 ?auto_690372 )
      ( MAKE-13PILE ?auto_690363 ?auto_690364 ?auto_690365 ?auto_690366 ?auto_690367 ?auto_690368 ?auto_690369 ?auto_690370 ?auto_690371 ?auto_690372 ?auto_690373 ?auto_690374 ?auto_690375 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_690417 - BLOCK
      ?auto_690418 - BLOCK
      ?auto_690419 - BLOCK
      ?auto_690420 - BLOCK
      ?auto_690421 - BLOCK
      ?auto_690422 - BLOCK
      ?auto_690423 - BLOCK
      ?auto_690424 - BLOCK
      ?auto_690425 - BLOCK
      ?auto_690426 - BLOCK
      ?auto_690427 - BLOCK
      ?auto_690428 - BLOCK
      ?auto_690429 - BLOCK
    )
    :vars
    (
      ?auto_690430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690429 ?auto_690430 ) ( ON-TABLE ?auto_690417 ) ( ON ?auto_690418 ?auto_690417 ) ( ON ?auto_690419 ?auto_690418 ) ( ON ?auto_690420 ?auto_690419 ) ( ON ?auto_690421 ?auto_690420 ) ( ON ?auto_690422 ?auto_690421 ) ( ON ?auto_690423 ?auto_690422 ) ( ON ?auto_690424 ?auto_690423 ) ( not ( = ?auto_690417 ?auto_690418 ) ) ( not ( = ?auto_690417 ?auto_690419 ) ) ( not ( = ?auto_690417 ?auto_690420 ) ) ( not ( = ?auto_690417 ?auto_690421 ) ) ( not ( = ?auto_690417 ?auto_690422 ) ) ( not ( = ?auto_690417 ?auto_690423 ) ) ( not ( = ?auto_690417 ?auto_690424 ) ) ( not ( = ?auto_690417 ?auto_690425 ) ) ( not ( = ?auto_690417 ?auto_690426 ) ) ( not ( = ?auto_690417 ?auto_690427 ) ) ( not ( = ?auto_690417 ?auto_690428 ) ) ( not ( = ?auto_690417 ?auto_690429 ) ) ( not ( = ?auto_690417 ?auto_690430 ) ) ( not ( = ?auto_690418 ?auto_690419 ) ) ( not ( = ?auto_690418 ?auto_690420 ) ) ( not ( = ?auto_690418 ?auto_690421 ) ) ( not ( = ?auto_690418 ?auto_690422 ) ) ( not ( = ?auto_690418 ?auto_690423 ) ) ( not ( = ?auto_690418 ?auto_690424 ) ) ( not ( = ?auto_690418 ?auto_690425 ) ) ( not ( = ?auto_690418 ?auto_690426 ) ) ( not ( = ?auto_690418 ?auto_690427 ) ) ( not ( = ?auto_690418 ?auto_690428 ) ) ( not ( = ?auto_690418 ?auto_690429 ) ) ( not ( = ?auto_690418 ?auto_690430 ) ) ( not ( = ?auto_690419 ?auto_690420 ) ) ( not ( = ?auto_690419 ?auto_690421 ) ) ( not ( = ?auto_690419 ?auto_690422 ) ) ( not ( = ?auto_690419 ?auto_690423 ) ) ( not ( = ?auto_690419 ?auto_690424 ) ) ( not ( = ?auto_690419 ?auto_690425 ) ) ( not ( = ?auto_690419 ?auto_690426 ) ) ( not ( = ?auto_690419 ?auto_690427 ) ) ( not ( = ?auto_690419 ?auto_690428 ) ) ( not ( = ?auto_690419 ?auto_690429 ) ) ( not ( = ?auto_690419 ?auto_690430 ) ) ( not ( = ?auto_690420 ?auto_690421 ) ) ( not ( = ?auto_690420 ?auto_690422 ) ) ( not ( = ?auto_690420 ?auto_690423 ) ) ( not ( = ?auto_690420 ?auto_690424 ) ) ( not ( = ?auto_690420 ?auto_690425 ) ) ( not ( = ?auto_690420 ?auto_690426 ) ) ( not ( = ?auto_690420 ?auto_690427 ) ) ( not ( = ?auto_690420 ?auto_690428 ) ) ( not ( = ?auto_690420 ?auto_690429 ) ) ( not ( = ?auto_690420 ?auto_690430 ) ) ( not ( = ?auto_690421 ?auto_690422 ) ) ( not ( = ?auto_690421 ?auto_690423 ) ) ( not ( = ?auto_690421 ?auto_690424 ) ) ( not ( = ?auto_690421 ?auto_690425 ) ) ( not ( = ?auto_690421 ?auto_690426 ) ) ( not ( = ?auto_690421 ?auto_690427 ) ) ( not ( = ?auto_690421 ?auto_690428 ) ) ( not ( = ?auto_690421 ?auto_690429 ) ) ( not ( = ?auto_690421 ?auto_690430 ) ) ( not ( = ?auto_690422 ?auto_690423 ) ) ( not ( = ?auto_690422 ?auto_690424 ) ) ( not ( = ?auto_690422 ?auto_690425 ) ) ( not ( = ?auto_690422 ?auto_690426 ) ) ( not ( = ?auto_690422 ?auto_690427 ) ) ( not ( = ?auto_690422 ?auto_690428 ) ) ( not ( = ?auto_690422 ?auto_690429 ) ) ( not ( = ?auto_690422 ?auto_690430 ) ) ( not ( = ?auto_690423 ?auto_690424 ) ) ( not ( = ?auto_690423 ?auto_690425 ) ) ( not ( = ?auto_690423 ?auto_690426 ) ) ( not ( = ?auto_690423 ?auto_690427 ) ) ( not ( = ?auto_690423 ?auto_690428 ) ) ( not ( = ?auto_690423 ?auto_690429 ) ) ( not ( = ?auto_690423 ?auto_690430 ) ) ( not ( = ?auto_690424 ?auto_690425 ) ) ( not ( = ?auto_690424 ?auto_690426 ) ) ( not ( = ?auto_690424 ?auto_690427 ) ) ( not ( = ?auto_690424 ?auto_690428 ) ) ( not ( = ?auto_690424 ?auto_690429 ) ) ( not ( = ?auto_690424 ?auto_690430 ) ) ( not ( = ?auto_690425 ?auto_690426 ) ) ( not ( = ?auto_690425 ?auto_690427 ) ) ( not ( = ?auto_690425 ?auto_690428 ) ) ( not ( = ?auto_690425 ?auto_690429 ) ) ( not ( = ?auto_690425 ?auto_690430 ) ) ( not ( = ?auto_690426 ?auto_690427 ) ) ( not ( = ?auto_690426 ?auto_690428 ) ) ( not ( = ?auto_690426 ?auto_690429 ) ) ( not ( = ?auto_690426 ?auto_690430 ) ) ( not ( = ?auto_690427 ?auto_690428 ) ) ( not ( = ?auto_690427 ?auto_690429 ) ) ( not ( = ?auto_690427 ?auto_690430 ) ) ( not ( = ?auto_690428 ?auto_690429 ) ) ( not ( = ?auto_690428 ?auto_690430 ) ) ( not ( = ?auto_690429 ?auto_690430 ) ) ( ON ?auto_690428 ?auto_690429 ) ( ON ?auto_690427 ?auto_690428 ) ( ON ?auto_690426 ?auto_690427 ) ( CLEAR ?auto_690424 ) ( ON ?auto_690425 ?auto_690426 ) ( CLEAR ?auto_690425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_690417 ?auto_690418 ?auto_690419 ?auto_690420 ?auto_690421 ?auto_690422 ?auto_690423 ?auto_690424 ?auto_690425 )
      ( MAKE-13PILE ?auto_690417 ?auto_690418 ?auto_690419 ?auto_690420 ?auto_690421 ?auto_690422 ?auto_690423 ?auto_690424 ?auto_690425 ?auto_690426 ?auto_690427 ?auto_690428 ?auto_690429 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_690471 - BLOCK
      ?auto_690472 - BLOCK
      ?auto_690473 - BLOCK
      ?auto_690474 - BLOCK
      ?auto_690475 - BLOCK
      ?auto_690476 - BLOCK
      ?auto_690477 - BLOCK
      ?auto_690478 - BLOCK
      ?auto_690479 - BLOCK
      ?auto_690480 - BLOCK
      ?auto_690481 - BLOCK
      ?auto_690482 - BLOCK
      ?auto_690483 - BLOCK
    )
    :vars
    (
      ?auto_690484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690483 ?auto_690484 ) ( ON-TABLE ?auto_690471 ) ( ON ?auto_690472 ?auto_690471 ) ( ON ?auto_690473 ?auto_690472 ) ( ON ?auto_690474 ?auto_690473 ) ( ON ?auto_690475 ?auto_690474 ) ( ON ?auto_690476 ?auto_690475 ) ( ON ?auto_690477 ?auto_690476 ) ( not ( = ?auto_690471 ?auto_690472 ) ) ( not ( = ?auto_690471 ?auto_690473 ) ) ( not ( = ?auto_690471 ?auto_690474 ) ) ( not ( = ?auto_690471 ?auto_690475 ) ) ( not ( = ?auto_690471 ?auto_690476 ) ) ( not ( = ?auto_690471 ?auto_690477 ) ) ( not ( = ?auto_690471 ?auto_690478 ) ) ( not ( = ?auto_690471 ?auto_690479 ) ) ( not ( = ?auto_690471 ?auto_690480 ) ) ( not ( = ?auto_690471 ?auto_690481 ) ) ( not ( = ?auto_690471 ?auto_690482 ) ) ( not ( = ?auto_690471 ?auto_690483 ) ) ( not ( = ?auto_690471 ?auto_690484 ) ) ( not ( = ?auto_690472 ?auto_690473 ) ) ( not ( = ?auto_690472 ?auto_690474 ) ) ( not ( = ?auto_690472 ?auto_690475 ) ) ( not ( = ?auto_690472 ?auto_690476 ) ) ( not ( = ?auto_690472 ?auto_690477 ) ) ( not ( = ?auto_690472 ?auto_690478 ) ) ( not ( = ?auto_690472 ?auto_690479 ) ) ( not ( = ?auto_690472 ?auto_690480 ) ) ( not ( = ?auto_690472 ?auto_690481 ) ) ( not ( = ?auto_690472 ?auto_690482 ) ) ( not ( = ?auto_690472 ?auto_690483 ) ) ( not ( = ?auto_690472 ?auto_690484 ) ) ( not ( = ?auto_690473 ?auto_690474 ) ) ( not ( = ?auto_690473 ?auto_690475 ) ) ( not ( = ?auto_690473 ?auto_690476 ) ) ( not ( = ?auto_690473 ?auto_690477 ) ) ( not ( = ?auto_690473 ?auto_690478 ) ) ( not ( = ?auto_690473 ?auto_690479 ) ) ( not ( = ?auto_690473 ?auto_690480 ) ) ( not ( = ?auto_690473 ?auto_690481 ) ) ( not ( = ?auto_690473 ?auto_690482 ) ) ( not ( = ?auto_690473 ?auto_690483 ) ) ( not ( = ?auto_690473 ?auto_690484 ) ) ( not ( = ?auto_690474 ?auto_690475 ) ) ( not ( = ?auto_690474 ?auto_690476 ) ) ( not ( = ?auto_690474 ?auto_690477 ) ) ( not ( = ?auto_690474 ?auto_690478 ) ) ( not ( = ?auto_690474 ?auto_690479 ) ) ( not ( = ?auto_690474 ?auto_690480 ) ) ( not ( = ?auto_690474 ?auto_690481 ) ) ( not ( = ?auto_690474 ?auto_690482 ) ) ( not ( = ?auto_690474 ?auto_690483 ) ) ( not ( = ?auto_690474 ?auto_690484 ) ) ( not ( = ?auto_690475 ?auto_690476 ) ) ( not ( = ?auto_690475 ?auto_690477 ) ) ( not ( = ?auto_690475 ?auto_690478 ) ) ( not ( = ?auto_690475 ?auto_690479 ) ) ( not ( = ?auto_690475 ?auto_690480 ) ) ( not ( = ?auto_690475 ?auto_690481 ) ) ( not ( = ?auto_690475 ?auto_690482 ) ) ( not ( = ?auto_690475 ?auto_690483 ) ) ( not ( = ?auto_690475 ?auto_690484 ) ) ( not ( = ?auto_690476 ?auto_690477 ) ) ( not ( = ?auto_690476 ?auto_690478 ) ) ( not ( = ?auto_690476 ?auto_690479 ) ) ( not ( = ?auto_690476 ?auto_690480 ) ) ( not ( = ?auto_690476 ?auto_690481 ) ) ( not ( = ?auto_690476 ?auto_690482 ) ) ( not ( = ?auto_690476 ?auto_690483 ) ) ( not ( = ?auto_690476 ?auto_690484 ) ) ( not ( = ?auto_690477 ?auto_690478 ) ) ( not ( = ?auto_690477 ?auto_690479 ) ) ( not ( = ?auto_690477 ?auto_690480 ) ) ( not ( = ?auto_690477 ?auto_690481 ) ) ( not ( = ?auto_690477 ?auto_690482 ) ) ( not ( = ?auto_690477 ?auto_690483 ) ) ( not ( = ?auto_690477 ?auto_690484 ) ) ( not ( = ?auto_690478 ?auto_690479 ) ) ( not ( = ?auto_690478 ?auto_690480 ) ) ( not ( = ?auto_690478 ?auto_690481 ) ) ( not ( = ?auto_690478 ?auto_690482 ) ) ( not ( = ?auto_690478 ?auto_690483 ) ) ( not ( = ?auto_690478 ?auto_690484 ) ) ( not ( = ?auto_690479 ?auto_690480 ) ) ( not ( = ?auto_690479 ?auto_690481 ) ) ( not ( = ?auto_690479 ?auto_690482 ) ) ( not ( = ?auto_690479 ?auto_690483 ) ) ( not ( = ?auto_690479 ?auto_690484 ) ) ( not ( = ?auto_690480 ?auto_690481 ) ) ( not ( = ?auto_690480 ?auto_690482 ) ) ( not ( = ?auto_690480 ?auto_690483 ) ) ( not ( = ?auto_690480 ?auto_690484 ) ) ( not ( = ?auto_690481 ?auto_690482 ) ) ( not ( = ?auto_690481 ?auto_690483 ) ) ( not ( = ?auto_690481 ?auto_690484 ) ) ( not ( = ?auto_690482 ?auto_690483 ) ) ( not ( = ?auto_690482 ?auto_690484 ) ) ( not ( = ?auto_690483 ?auto_690484 ) ) ( ON ?auto_690482 ?auto_690483 ) ( ON ?auto_690481 ?auto_690482 ) ( ON ?auto_690480 ?auto_690481 ) ( ON ?auto_690479 ?auto_690480 ) ( CLEAR ?auto_690477 ) ( ON ?auto_690478 ?auto_690479 ) ( CLEAR ?auto_690478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_690471 ?auto_690472 ?auto_690473 ?auto_690474 ?auto_690475 ?auto_690476 ?auto_690477 ?auto_690478 )
      ( MAKE-13PILE ?auto_690471 ?auto_690472 ?auto_690473 ?auto_690474 ?auto_690475 ?auto_690476 ?auto_690477 ?auto_690478 ?auto_690479 ?auto_690480 ?auto_690481 ?auto_690482 ?auto_690483 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_690525 - BLOCK
      ?auto_690526 - BLOCK
      ?auto_690527 - BLOCK
      ?auto_690528 - BLOCK
      ?auto_690529 - BLOCK
      ?auto_690530 - BLOCK
      ?auto_690531 - BLOCK
      ?auto_690532 - BLOCK
      ?auto_690533 - BLOCK
      ?auto_690534 - BLOCK
      ?auto_690535 - BLOCK
      ?auto_690536 - BLOCK
      ?auto_690537 - BLOCK
    )
    :vars
    (
      ?auto_690538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690537 ?auto_690538 ) ( ON-TABLE ?auto_690525 ) ( ON ?auto_690526 ?auto_690525 ) ( ON ?auto_690527 ?auto_690526 ) ( ON ?auto_690528 ?auto_690527 ) ( ON ?auto_690529 ?auto_690528 ) ( ON ?auto_690530 ?auto_690529 ) ( not ( = ?auto_690525 ?auto_690526 ) ) ( not ( = ?auto_690525 ?auto_690527 ) ) ( not ( = ?auto_690525 ?auto_690528 ) ) ( not ( = ?auto_690525 ?auto_690529 ) ) ( not ( = ?auto_690525 ?auto_690530 ) ) ( not ( = ?auto_690525 ?auto_690531 ) ) ( not ( = ?auto_690525 ?auto_690532 ) ) ( not ( = ?auto_690525 ?auto_690533 ) ) ( not ( = ?auto_690525 ?auto_690534 ) ) ( not ( = ?auto_690525 ?auto_690535 ) ) ( not ( = ?auto_690525 ?auto_690536 ) ) ( not ( = ?auto_690525 ?auto_690537 ) ) ( not ( = ?auto_690525 ?auto_690538 ) ) ( not ( = ?auto_690526 ?auto_690527 ) ) ( not ( = ?auto_690526 ?auto_690528 ) ) ( not ( = ?auto_690526 ?auto_690529 ) ) ( not ( = ?auto_690526 ?auto_690530 ) ) ( not ( = ?auto_690526 ?auto_690531 ) ) ( not ( = ?auto_690526 ?auto_690532 ) ) ( not ( = ?auto_690526 ?auto_690533 ) ) ( not ( = ?auto_690526 ?auto_690534 ) ) ( not ( = ?auto_690526 ?auto_690535 ) ) ( not ( = ?auto_690526 ?auto_690536 ) ) ( not ( = ?auto_690526 ?auto_690537 ) ) ( not ( = ?auto_690526 ?auto_690538 ) ) ( not ( = ?auto_690527 ?auto_690528 ) ) ( not ( = ?auto_690527 ?auto_690529 ) ) ( not ( = ?auto_690527 ?auto_690530 ) ) ( not ( = ?auto_690527 ?auto_690531 ) ) ( not ( = ?auto_690527 ?auto_690532 ) ) ( not ( = ?auto_690527 ?auto_690533 ) ) ( not ( = ?auto_690527 ?auto_690534 ) ) ( not ( = ?auto_690527 ?auto_690535 ) ) ( not ( = ?auto_690527 ?auto_690536 ) ) ( not ( = ?auto_690527 ?auto_690537 ) ) ( not ( = ?auto_690527 ?auto_690538 ) ) ( not ( = ?auto_690528 ?auto_690529 ) ) ( not ( = ?auto_690528 ?auto_690530 ) ) ( not ( = ?auto_690528 ?auto_690531 ) ) ( not ( = ?auto_690528 ?auto_690532 ) ) ( not ( = ?auto_690528 ?auto_690533 ) ) ( not ( = ?auto_690528 ?auto_690534 ) ) ( not ( = ?auto_690528 ?auto_690535 ) ) ( not ( = ?auto_690528 ?auto_690536 ) ) ( not ( = ?auto_690528 ?auto_690537 ) ) ( not ( = ?auto_690528 ?auto_690538 ) ) ( not ( = ?auto_690529 ?auto_690530 ) ) ( not ( = ?auto_690529 ?auto_690531 ) ) ( not ( = ?auto_690529 ?auto_690532 ) ) ( not ( = ?auto_690529 ?auto_690533 ) ) ( not ( = ?auto_690529 ?auto_690534 ) ) ( not ( = ?auto_690529 ?auto_690535 ) ) ( not ( = ?auto_690529 ?auto_690536 ) ) ( not ( = ?auto_690529 ?auto_690537 ) ) ( not ( = ?auto_690529 ?auto_690538 ) ) ( not ( = ?auto_690530 ?auto_690531 ) ) ( not ( = ?auto_690530 ?auto_690532 ) ) ( not ( = ?auto_690530 ?auto_690533 ) ) ( not ( = ?auto_690530 ?auto_690534 ) ) ( not ( = ?auto_690530 ?auto_690535 ) ) ( not ( = ?auto_690530 ?auto_690536 ) ) ( not ( = ?auto_690530 ?auto_690537 ) ) ( not ( = ?auto_690530 ?auto_690538 ) ) ( not ( = ?auto_690531 ?auto_690532 ) ) ( not ( = ?auto_690531 ?auto_690533 ) ) ( not ( = ?auto_690531 ?auto_690534 ) ) ( not ( = ?auto_690531 ?auto_690535 ) ) ( not ( = ?auto_690531 ?auto_690536 ) ) ( not ( = ?auto_690531 ?auto_690537 ) ) ( not ( = ?auto_690531 ?auto_690538 ) ) ( not ( = ?auto_690532 ?auto_690533 ) ) ( not ( = ?auto_690532 ?auto_690534 ) ) ( not ( = ?auto_690532 ?auto_690535 ) ) ( not ( = ?auto_690532 ?auto_690536 ) ) ( not ( = ?auto_690532 ?auto_690537 ) ) ( not ( = ?auto_690532 ?auto_690538 ) ) ( not ( = ?auto_690533 ?auto_690534 ) ) ( not ( = ?auto_690533 ?auto_690535 ) ) ( not ( = ?auto_690533 ?auto_690536 ) ) ( not ( = ?auto_690533 ?auto_690537 ) ) ( not ( = ?auto_690533 ?auto_690538 ) ) ( not ( = ?auto_690534 ?auto_690535 ) ) ( not ( = ?auto_690534 ?auto_690536 ) ) ( not ( = ?auto_690534 ?auto_690537 ) ) ( not ( = ?auto_690534 ?auto_690538 ) ) ( not ( = ?auto_690535 ?auto_690536 ) ) ( not ( = ?auto_690535 ?auto_690537 ) ) ( not ( = ?auto_690535 ?auto_690538 ) ) ( not ( = ?auto_690536 ?auto_690537 ) ) ( not ( = ?auto_690536 ?auto_690538 ) ) ( not ( = ?auto_690537 ?auto_690538 ) ) ( ON ?auto_690536 ?auto_690537 ) ( ON ?auto_690535 ?auto_690536 ) ( ON ?auto_690534 ?auto_690535 ) ( ON ?auto_690533 ?auto_690534 ) ( ON ?auto_690532 ?auto_690533 ) ( CLEAR ?auto_690530 ) ( ON ?auto_690531 ?auto_690532 ) ( CLEAR ?auto_690531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_690525 ?auto_690526 ?auto_690527 ?auto_690528 ?auto_690529 ?auto_690530 ?auto_690531 )
      ( MAKE-13PILE ?auto_690525 ?auto_690526 ?auto_690527 ?auto_690528 ?auto_690529 ?auto_690530 ?auto_690531 ?auto_690532 ?auto_690533 ?auto_690534 ?auto_690535 ?auto_690536 ?auto_690537 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_690579 - BLOCK
      ?auto_690580 - BLOCK
      ?auto_690581 - BLOCK
      ?auto_690582 - BLOCK
      ?auto_690583 - BLOCK
      ?auto_690584 - BLOCK
      ?auto_690585 - BLOCK
      ?auto_690586 - BLOCK
      ?auto_690587 - BLOCK
      ?auto_690588 - BLOCK
      ?auto_690589 - BLOCK
      ?auto_690590 - BLOCK
      ?auto_690591 - BLOCK
    )
    :vars
    (
      ?auto_690592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690591 ?auto_690592 ) ( ON-TABLE ?auto_690579 ) ( ON ?auto_690580 ?auto_690579 ) ( ON ?auto_690581 ?auto_690580 ) ( ON ?auto_690582 ?auto_690581 ) ( ON ?auto_690583 ?auto_690582 ) ( not ( = ?auto_690579 ?auto_690580 ) ) ( not ( = ?auto_690579 ?auto_690581 ) ) ( not ( = ?auto_690579 ?auto_690582 ) ) ( not ( = ?auto_690579 ?auto_690583 ) ) ( not ( = ?auto_690579 ?auto_690584 ) ) ( not ( = ?auto_690579 ?auto_690585 ) ) ( not ( = ?auto_690579 ?auto_690586 ) ) ( not ( = ?auto_690579 ?auto_690587 ) ) ( not ( = ?auto_690579 ?auto_690588 ) ) ( not ( = ?auto_690579 ?auto_690589 ) ) ( not ( = ?auto_690579 ?auto_690590 ) ) ( not ( = ?auto_690579 ?auto_690591 ) ) ( not ( = ?auto_690579 ?auto_690592 ) ) ( not ( = ?auto_690580 ?auto_690581 ) ) ( not ( = ?auto_690580 ?auto_690582 ) ) ( not ( = ?auto_690580 ?auto_690583 ) ) ( not ( = ?auto_690580 ?auto_690584 ) ) ( not ( = ?auto_690580 ?auto_690585 ) ) ( not ( = ?auto_690580 ?auto_690586 ) ) ( not ( = ?auto_690580 ?auto_690587 ) ) ( not ( = ?auto_690580 ?auto_690588 ) ) ( not ( = ?auto_690580 ?auto_690589 ) ) ( not ( = ?auto_690580 ?auto_690590 ) ) ( not ( = ?auto_690580 ?auto_690591 ) ) ( not ( = ?auto_690580 ?auto_690592 ) ) ( not ( = ?auto_690581 ?auto_690582 ) ) ( not ( = ?auto_690581 ?auto_690583 ) ) ( not ( = ?auto_690581 ?auto_690584 ) ) ( not ( = ?auto_690581 ?auto_690585 ) ) ( not ( = ?auto_690581 ?auto_690586 ) ) ( not ( = ?auto_690581 ?auto_690587 ) ) ( not ( = ?auto_690581 ?auto_690588 ) ) ( not ( = ?auto_690581 ?auto_690589 ) ) ( not ( = ?auto_690581 ?auto_690590 ) ) ( not ( = ?auto_690581 ?auto_690591 ) ) ( not ( = ?auto_690581 ?auto_690592 ) ) ( not ( = ?auto_690582 ?auto_690583 ) ) ( not ( = ?auto_690582 ?auto_690584 ) ) ( not ( = ?auto_690582 ?auto_690585 ) ) ( not ( = ?auto_690582 ?auto_690586 ) ) ( not ( = ?auto_690582 ?auto_690587 ) ) ( not ( = ?auto_690582 ?auto_690588 ) ) ( not ( = ?auto_690582 ?auto_690589 ) ) ( not ( = ?auto_690582 ?auto_690590 ) ) ( not ( = ?auto_690582 ?auto_690591 ) ) ( not ( = ?auto_690582 ?auto_690592 ) ) ( not ( = ?auto_690583 ?auto_690584 ) ) ( not ( = ?auto_690583 ?auto_690585 ) ) ( not ( = ?auto_690583 ?auto_690586 ) ) ( not ( = ?auto_690583 ?auto_690587 ) ) ( not ( = ?auto_690583 ?auto_690588 ) ) ( not ( = ?auto_690583 ?auto_690589 ) ) ( not ( = ?auto_690583 ?auto_690590 ) ) ( not ( = ?auto_690583 ?auto_690591 ) ) ( not ( = ?auto_690583 ?auto_690592 ) ) ( not ( = ?auto_690584 ?auto_690585 ) ) ( not ( = ?auto_690584 ?auto_690586 ) ) ( not ( = ?auto_690584 ?auto_690587 ) ) ( not ( = ?auto_690584 ?auto_690588 ) ) ( not ( = ?auto_690584 ?auto_690589 ) ) ( not ( = ?auto_690584 ?auto_690590 ) ) ( not ( = ?auto_690584 ?auto_690591 ) ) ( not ( = ?auto_690584 ?auto_690592 ) ) ( not ( = ?auto_690585 ?auto_690586 ) ) ( not ( = ?auto_690585 ?auto_690587 ) ) ( not ( = ?auto_690585 ?auto_690588 ) ) ( not ( = ?auto_690585 ?auto_690589 ) ) ( not ( = ?auto_690585 ?auto_690590 ) ) ( not ( = ?auto_690585 ?auto_690591 ) ) ( not ( = ?auto_690585 ?auto_690592 ) ) ( not ( = ?auto_690586 ?auto_690587 ) ) ( not ( = ?auto_690586 ?auto_690588 ) ) ( not ( = ?auto_690586 ?auto_690589 ) ) ( not ( = ?auto_690586 ?auto_690590 ) ) ( not ( = ?auto_690586 ?auto_690591 ) ) ( not ( = ?auto_690586 ?auto_690592 ) ) ( not ( = ?auto_690587 ?auto_690588 ) ) ( not ( = ?auto_690587 ?auto_690589 ) ) ( not ( = ?auto_690587 ?auto_690590 ) ) ( not ( = ?auto_690587 ?auto_690591 ) ) ( not ( = ?auto_690587 ?auto_690592 ) ) ( not ( = ?auto_690588 ?auto_690589 ) ) ( not ( = ?auto_690588 ?auto_690590 ) ) ( not ( = ?auto_690588 ?auto_690591 ) ) ( not ( = ?auto_690588 ?auto_690592 ) ) ( not ( = ?auto_690589 ?auto_690590 ) ) ( not ( = ?auto_690589 ?auto_690591 ) ) ( not ( = ?auto_690589 ?auto_690592 ) ) ( not ( = ?auto_690590 ?auto_690591 ) ) ( not ( = ?auto_690590 ?auto_690592 ) ) ( not ( = ?auto_690591 ?auto_690592 ) ) ( ON ?auto_690590 ?auto_690591 ) ( ON ?auto_690589 ?auto_690590 ) ( ON ?auto_690588 ?auto_690589 ) ( ON ?auto_690587 ?auto_690588 ) ( ON ?auto_690586 ?auto_690587 ) ( ON ?auto_690585 ?auto_690586 ) ( CLEAR ?auto_690583 ) ( ON ?auto_690584 ?auto_690585 ) ( CLEAR ?auto_690584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_690579 ?auto_690580 ?auto_690581 ?auto_690582 ?auto_690583 ?auto_690584 )
      ( MAKE-13PILE ?auto_690579 ?auto_690580 ?auto_690581 ?auto_690582 ?auto_690583 ?auto_690584 ?auto_690585 ?auto_690586 ?auto_690587 ?auto_690588 ?auto_690589 ?auto_690590 ?auto_690591 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_690633 - BLOCK
      ?auto_690634 - BLOCK
      ?auto_690635 - BLOCK
      ?auto_690636 - BLOCK
      ?auto_690637 - BLOCK
      ?auto_690638 - BLOCK
      ?auto_690639 - BLOCK
      ?auto_690640 - BLOCK
      ?auto_690641 - BLOCK
      ?auto_690642 - BLOCK
      ?auto_690643 - BLOCK
      ?auto_690644 - BLOCK
      ?auto_690645 - BLOCK
    )
    :vars
    (
      ?auto_690646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690645 ?auto_690646 ) ( ON-TABLE ?auto_690633 ) ( ON ?auto_690634 ?auto_690633 ) ( ON ?auto_690635 ?auto_690634 ) ( ON ?auto_690636 ?auto_690635 ) ( not ( = ?auto_690633 ?auto_690634 ) ) ( not ( = ?auto_690633 ?auto_690635 ) ) ( not ( = ?auto_690633 ?auto_690636 ) ) ( not ( = ?auto_690633 ?auto_690637 ) ) ( not ( = ?auto_690633 ?auto_690638 ) ) ( not ( = ?auto_690633 ?auto_690639 ) ) ( not ( = ?auto_690633 ?auto_690640 ) ) ( not ( = ?auto_690633 ?auto_690641 ) ) ( not ( = ?auto_690633 ?auto_690642 ) ) ( not ( = ?auto_690633 ?auto_690643 ) ) ( not ( = ?auto_690633 ?auto_690644 ) ) ( not ( = ?auto_690633 ?auto_690645 ) ) ( not ( = ?auto_690633 ?auto_690646 ) ) ( not ( = ?auto_690634 ?auto_690635 ) ) ( not ( = ?auto_690634 ?auto_690636 ) ) ( not ( = ?auto_690634 ?auto_690637 ) ) ( not ( = ?auto_690634 ?auto_690638 ) ) ( not ( = ?auto_690634 ?auto_690639 ) ) ( not ( = ?auto_690634 ?auto_690640 ) ) ( not ( = ?auto_690634 ?auto_690641 ) ) ( not ( = ?auto_690634 ?auto_690642 ) ) ( not ( = ?auto_690634 ?auto_690643 ) ) ( not ( = ?auto_690634 ?auto_690644 ) ) ( not ( = ?auto_690634 ?auto_690645 ) ) ( not ( = ?auto_690634 ?auto_690646 ) ) ( not ( = ?auto_690635 ?auto_690636 ) ) ( not ( = ?auto_690635 ?auto_690637 ) ) ( not ( = ?auto_690635 ?auto_690638 ) ) ( not ( = ?auto_690635 ?auto_690639 ) ) ( not ( = ?auto_690635 ?auto_690640 ) ) ( not ( = ?auto_690635 ?auto_690641 ) ) ( not ( = ?auto_690635 ?auto_690642 ) ) ( not ( = ?auto_690635 ?auto_690643 ) ) ( not ( = ?auto_690635 ?auto_690644 ) ) ( not ( = ?auto_690635 ?auto_690645 ) ) ( not ( = ?auto_690635 ?auto_690646 ) ) ( not ( = ?auto_690636 ?auto_690637 ) ) ( not ( = ?auto_690636 ?auto_690638 ) ) ( not ( = ?auto_690636 ?auto_690639 ) ) ( not ( = ?auto_690636 ?auto_690640 ) ) ( not ( = ?auto_690636 ?auto_690641 ) ) ( not ( = ?auto_690636 ?auto_690642 ) ) ( not ( = ?auto_690636 ?auto_690643 ) ) ( not ( = ?auto_690636 ?auto_690644 ) ) ( not ( = ?auto_690636 ?auto_690645 ) ) ( not ( = ?auto_690636 ?auto_690646 ) ) ( not ( = ?auto_690637 ?auto_690638 ) ) ( not ( = ?auto_690637 ?auto_690639 ) ) ( not ( = ?auto_690637 ?auto_690640 ) ) ( not ( = ?auto_690637 ?auto_690641 ) ) ( not ( = ?auto_690637 ?auto_690642 ) ) ( not ( = ?auto_690637 ?auto_690643 ) ) ( not ( = ?auto_690637 ?auto_690644 ) ) ( not ( = ?auto_690637 ?auto_690645 ) ) ( not ( = ?auto_690637 ?auto_690646 ) ) ( not ( = ?auto_690638 ?auto_690639 ) ) ( not ( = ?auto_690638 ?auto_690640 ) ) ( not ( = ?auto_690638 ?auto_690641 ) ) ( not ( = ?auto_690638 ?auto_690642 ) ) ( not ( = ?auto_690638 ?auto_690643 ) ) ( not ( = ?auto_690638 ?auto_690644 ) ) ( not ( = ?auto_690638 ?auto_690645 ) ) ( not ( = ?auto_690638 ?auto_690646 ) ) ( not ( = ?auto_690639 ?auto_690640 ) ) ( not ( = ?auto_690639 ?auto_690641 ) ) ( not ( = ?auto_690639 ?auto_690642 ) ) ( not ( = ?auto_690639 ?auto_690643 ) ) ( not ( = ?auto_690639 ?auto_690644 ) ) ( not ( = ?auto_690639 ?auto_690645 ) ) ( not ( = ?auto_690639 ?auto_690646 ) ) ( not ( = ?auto_690640 ?auto_690641 ) ) ( not ( = ?auto_690640 ?auto_690642 ) ) ( not ( = ?auto_690640 ?auto_690643 ) ) ( not ( = ?auto_690640 ?auto_690644 ) ) ( not ( = ?auto_690640 ?auto_690645 ) ) ( not ( = ?auto_690640 ?auto_690646 ) ) ( not ( = ?auto_690641 ?auto_690642 ) ) ( not ( = ?auto_690641 ?auto_690643 ) ) ( not ( = ?auto_690641 ?auto_690644 ) ) ( not ( = ?auto_690641 ?auto_690645 ) ) ( not ( = ?auto_690641 ?auto_690646 ) ) ( not ( = ?auto_690642 ?auto_690643 ) ) ( not ( = ?auto_690642 ?auto_690644 ) ) ( not ( = ?auto_690642 ?auto_690645 ) ) ( not ( = ?auto_690642 ?auto_690646 ) ) ( not ( = ?auto_690643 ?auto_690644 ) ) ( not ( = ?auto_690643 ?auto_690645 ) ) ( not ( = ?auto_690643 ?auto_690646 ) ) ( not ( = ?auto_690644 ?auto_690645 ) ) ( not ( = ?auto_690644 ?auto_690646 ) ) ( not ( = ?auto_690645 ?auto_690646 ) ) ( ON ?auto_690644 ?auto_690645 ) ( ON ?auto_690643 ?auto_690644 ) ( ON ?auto_690642 ?auto_690643 ) ( ON ?auto_690641 ?auto_690642 ) ( ON ?auto_690640 ?auto_690641 ) ( ON ?auto_690639 ?auto_690640 ) ( ON ?auto_690638 ?auto_690639 ) ( CLEAR ?auto_690636 ) ( ON ?auto_690637 ?auto_690638 ) ( CLEAR ?auto_690637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_690633 ?auto_690634 ?auto_690635 ?auto_690636 ?auto_690637 )
      ( MAKE-13PILE ?auto_690633 ?auto_690634 ?auto_690635 ?auto_690636 ?auto_690637 ?auto_690638 ?auto_690639 ?auto_690640 ?auto_690641 ?auto_690642 ?auto_690643 ?auto_690644 ?auto_690645 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_690687 - BLOCK
      ?auto_690688 - BLOCK
      ?auto_690689 - BLOCK
      ?auto_690690 - BLOCK
      ?auto_690691 - BLOCK
      ?auto_690692 - BLOCK
      ?auto_690693 - BLOCK
      ?auto_690694 - BLOCK
      ?auto_690695 - BLOCK
      ?auto_690696 - BLOCK
      ?auto_690697 - BLOCK
      ?auto_690698 - BLOCK
      ?auto_690699 - BLOCK
    )
    :vars
    (
      ?auto_690700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690699 ?auto_690700 ) ( ON-TABLE ?auto_690687 ) ( ON ?auto_690688 ?auto_690687 ) ( ON ?auto_690689 ?auto_690688 ) ( not ( = ?auto_690687 ?auto_690688 ) ) ( not ( = ?auto_690687 ?auto_690689 ) ) ( not ( = ?auto_690687 ?auto_690690 ) ) ( not ( = ?auto_690687 ?auto_690691 ) ) ( not ( = ?auto_690687 ?auto_690692 ) ) ( not ( = ?auto_690687 ?auto_690693 ) ) ( not ( = ?auto_690687 ?auto_690694 ) ) ( not ( = ?auto_690687 ?auto_690695 ) ) ( not ( = ?auto_690687 ?auto_690696 ) ) ( not ( = ?auto_690687 ?auto_690697 ) ) ( not ( = ?auto_690687 ?auto_690698 ) ) ( not ( = ?auto_690687 ?auto_690699 ) ) ( not ( = ?auto_690687 ?auto_690700 ) ) ( not ( = ?auto_690688 ?auto_690689 ) ) ( not ( = ?auto_690688 ?auto_690690 ) ) ( not ( = ?auto_690688 ?auto_690691 ) ) ( not ( = ?auto_690688 ?auto_690692 ) ) ( not ( = ?auto_690688 ?auto_690693 ) ) ( not ( = ?auto_690688 ?auto_690694 ) ) ( not ( = ?auto_690688 ?auto_690695 ) ) ( not ( = ?auto_690688 ?auto_690696 ) ) ( not ( = ?auto_690688 ?auto_690697 ) ) ( not ( = ?auto_690688 ?auto_690698 ) ) ( not ( = ?auto_690688 ?auto_690699 ) ) ( not ( = ?auto_690688 ?auto_690700 ) ) ( not ( = ?auto_690689 ?auto_690690 ) ) ( not ( = ?auto_690689 ?auto_690691 ) ) ( not ( = ?auto_690689 ?auto_690692 ) ) ( not ( = ?auto_690689 ?auto_690693 ) ) ( not ( = ?auto_690689 ?auto_690694 ) ) ( not ( = ?auto_690689 ?auto_690695 ) ) ( not ( = ?auto_690689 ?auto_690696 ) ) ( not ( = ?auto_690689 ?auto_690697 ) ) ( not ( = ?auto_690689 ?auto_690698 ) ) ( not ( = ?auto_690689 ?auto_690699 ) ) ( not ( = ?auto_690689 ?auto_690700 ) ) ( not ( = ?auto_690690 ?auto_690691 ) ) ( not ( = ?auto_690690 ?auto_690692 ) ) ( not ( = ?auto_690690 ?auto_690693 ) ) ( not ( = ?auto_690690 ?auto_690694 ) ) ( not ( = ?auto_690690 ?auto_690695 ) ) ( not ( = ?auto_690690 ?auto_690696 ) ) ( not ( = ?auto_690690 ?auto_690697 ) ) ( not ( = ?auto_690690 ?auto_690698 ) ) ( not ( = ?auto_690690 ?auto_690699 ) ) ( not ( = ?auto_690690 ?auto_690700 ) ) ( not ( = ?auto_690691 ?auto_690692 ) ) ( not ( = ?auto_690691 ?auto_690693 ) ) ( not ( = ?auto_690691 ?auto_690694 ) ) ( not ( = ?auto_690691 ?auto_690695 ) ) ( not ( = ?auto_690691 ?auto_690696 ) ) ( not ( = ?auto_690691 ?auto_690697 ) ) ( not ( = ?auto_690691 ?auto_690698 ) ) ( not ( = ?auto_690691 ?auto_690699 ) ) ( not ( = ?auto_690691 ?auto_690700 ) ) ( not ( = ?auto_690692 ?auto_690693 ) ) ( not ( = ?auto_690692 ?auto_690694 ) ) ( not ( = ?auto_690692 ?auto_690695 ) ) ( not ( = ?auto_690692 ?auto_690696 ) ) ( not ( = ?auto_690692 ?auto_690697 ) ) ( not ( = ?auto_690692 ?auto_690698 ) ) ( not ( = ?auto_690692 ?auto_690699 ) ) ( not ( = ?auto_690692 ?auto_690700 ) ) ( not ( = ?auto_690693 ?auto_690694 ) ) ( not ( = ?auto_690693 ?auto_690695 ) ) ( not ( = ?auto_690693 ?auto_690696 ) ) ( not ( = ?auto_690693 ?auto_690697 ) ) ( not ( = ?auto_690693 ?auto_690698 ) ) ( not ( = ?auto_690693 ?auto_690699 ) ) ( not ( = ?auto_690693 ?auto_690700 ) ) ( not ( = ?auto_690694 ?auto_690695 ) ) ( not ( = ?auto_690694 ?auto_690696 ) ) ( not ( = ?auto_690694 ?auto_690697 ) ) ( not ( = ?auto_690694 ?auto_690698 ) ) ( not ( = ?auto_690694 ?auto_690699 ) ) ( not ( = ?auto_690694 ?auto_690700 ) ) ( not ( = ?auto_690695 ?auto_690696 ) ) ( not ( = ?auto_690695 ?auto_690697 ) ) ( not ( = ?auto_690695 ?auto_690698 ) ) ( not ( = ?auto_690695 ?auto_690699 ) ) ( not ( = ?auto_690695 ?auto_690700 ) ) ( not ( = ?auto_690696 ?auto_690697 ) ) ( not ( = ?auto_690696 ?auto_690698 ) ) ( not ( = ?auto_690696 ?auto_690699 ) ) ( not ( = ?auto_690696 ?auto_690700 ) ) ( not ( = ?auto_690697 ?auto_690698 ) ) ( not ( = ?auto_690697 ?auto_690699 ) ) ( not ( = ?auto_690697 ?auto_690700 ) ) ( not ( = ?auto_690698 ?auto_690699 ) ) ( not ( = ?auto_690698 ?auto_690700 ) ) ( not ( = ?auto_690699 ?auto_690700 ) ) ( ON ?auto_690698 ?auto_690699 ) ( ON ?auto_690697 ?auto_690698 ) ( ON ?auto_690696 ?auto_690697 ) ( ON ?auto_690695 ?auto_690696 ) ( ON ?auto_690694 ?auto_690695 ) ( ON ?auto_690693 ?auto_690694 ) ( ON ?auto_690692 ?auto_690693 ) ( ON ?auto_690691 ?auto_690692 ) ( CLEAR ?auto_690689 ) ( ON ?auto_690690 ?auto_690691 ) ( CLEAR ?auto_690690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_690687 ?auto_690688 ?auto_690689 ?auto_690690 )
      ( MAKE-13PILE ?auto_690687 ?auto_690688 ?auto_690689 ?auto_690690 ?auto_690691 ?auto_690692 ?auto_690693 ?auto_690694 ?auto_690695 ?auto_690696 ?auto_690697 ?auto_690698 ?auto_690699 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_690741 - BLOCK
      ?auto_690742 - BLOCK
      ?auto_690743 - BLOCK
      ?auto_690744 - BLOCK
      ?auto_690745 - BLOCK
      ?auto_690746 - BLOCK
      ?auto_690747 - BLOCK
      ?auto_690748 - BLOCK
      ?auto_690749 - BLOCK
      ?auto_690750 - BLOCK
      ?auto_690751 - BLOCK
      ?auto_690752 - BLOCK
      ?auto_690753 - BLOCK
    )
    :vars
    (
      ?auto_690754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690753 ?auto_690754 ) ( ON-TABLE ?auto_690741 ) ( ON ?auto_690742 ?auto_690741 ) ( not ( = ?auto_690741 ?auto_690742 ) ) ( not ( = ?auto_690741 ?auto_690743 ) ) ( not ( = ?auto_690741 ?auto_690744 ) ) ( not ( = ?auto_690741 ?auto_690745 ) ) ( not ( = ?auto_690741 ?auto_690746 ) ) ( not ( = ?auto_690741 ?auto_690747 ) ) ( not ( = ?auto_690741 ?auto_690748 ) ) ( not ( = ?auto_690741 ?auto_690749 ) ) ( not ( = ?auto_690741 ?auto_690750 ) ) ( not ( = ?auto_690741 ?auto_690751 ) ) ( not ( = ?auto_690741 ?auto_690752 ) ) ( not ( = ?auto_690741 ?auto_690753 ) ) ( not ( = ?auto_690741 ?auto_690754 ) ) ( not ( = ?auto_690742 ?auto_690743 ) ) ( not ( = ?auto_690742 ?auto_690744 ) ) ( not ( = ?auto_690742 ?auto_690745 ) ) ( not ( = ?auto_690742 ?auto_690746 ) ) ( not ( = ?auto_690742 ?auto_690747 ) ) ( not ( = ?auto_690742 ?auto_690748 ) ) ( not ( = ?auto_690742 ?auto_690749 ) ) ( not ( = ?auto_690742 ?auto_690750 ) ) ( not ( = ?auto_690742 ?auto_690751 ) ) ( not ( = ?auto_690742 ?auto_690752 ) ) ( not ( = ?auto_690742 ?auto_690753 ) ) ( not ( = ?auto_690742 ?auto_690754 ) ) ( not ( = ?auto_690743 ?auto_690744 ) ) ( not ( = ?auto_690743 ?auto_690745 ) ) ( not ( = ?auto_690743 ?auto_690746 ) ) ( not ( = ?auto_690743 ?auto_690747 ) ) ( not ( = ?auto_690743 ?auto_690748 ) ) ( not ( = ?auto_690743 ?auto_690749 ) ) ( not ( = ?auto_690743 ?auto_690750 ) ) ( not ( = ?auto_690743 ?auto_690751 ) ) ( not ( = ?auto_690743 ?auto_690752 ) ) ( not ( = ?auto_690743 ?auto_690753 ) ) ( not ( = ?auto_690743 ?auto_690754 ) ) ( not ( = ?auto_690744 ?auto_690745 ) ) ( not ( = ?auto_690744 ?auto_690746 ) ) ( not ( = ?auto_690744 ?auto_690747 ) ) ( not ( = ?auto_690744 ?auto_690748 ) ) ( not ( = ?auto_690744 ?auto_690749 ) ) ( not ( = ?auto_690744 ?auto_690750 ) ) ( not ( = ?auto_690744 ?auto_690751 ) ) ( not ( = ?auto_690744 ?auto_690752 ) ) ( not ( = ?auto_690744 ?auto_690753 ) ) ( not ( = ?auto_690744 ?auto_690754 ) ) ( not ( = ?auto_690745 ?auto_690746 ) ) ( not ( = ?auto_690745 ?auto_690747 ) ) ( not ( = ?auto_690745 ?auto_690748 ) ) ( not ( = ?auto_690745 ?auto_690749 ) ) ( not ( = ?auto_690745 ?auto_690750 ) ) ( not ( = ?auto_690745 ?auto_690751 ) ) ( not ( = ?auto_690745 ?auto_690752 ) ) ( not ( = ?auto_690745 ?auto_690753 ) ) ( not ( = ?auto_690745 ?auto_690754 ) ) ( not ( = ?auto_690746 ?auto_690747 ) ) ( not ( = ?auto_690746 ?auto_690748 ) ) ( not ( = ?auto_690746 ?auto_690749 ) ) ( not ( = ?auto_690746 ?auto_690750 ) ) ( not ( = ?auto_690746 ?auto_690751 ) ) ( not ( = ?auto_690746 ?auto_690752 ) ) ( not ( = ?auto_690746 ?auto_690753 ) ) ( not ( = ?auto_690746 ?auto_690754 ) ) ( not ( = ?auto_690747 ?auto_690748 ) ) ( not ( = ?auto_690747 ?auto_690749 ) ) ( not ( = ?auto_690747 ?auto_690750 ) ) ( not ( = ?auto_690747 ?auto_690751 ) ) ( not ( = ?auto_690747 ?auto_690752 ) ) ( not ( = ?auto_690747 ?auto_690753 ) ) ( not ( = ?auto_690747 ?auto_690754 ) ) ( not ( = ?auto_690748 ?auto_690749 ) ) ( not ( = ?auto_690748 ?auto_690750 ) ) ( not ( = ?auto_690748 ?auto_690751 ) ) ( not ( = ?auto_690748 ?auto_690752 ) ) ( not ( = ?auto_690748 ?auto_690753 ) ) ( not ( = ?auto_690748 ?auto_690754 ) ) ( not ( = ?auto_690749 ?auto_690750 ) ) ( not ( = ?auto_690749 ?auto_690751 ) ) ( not ( = ?auto_690749 ?auto_690752 ) ) ( not ( = ?auto_690749 ?auto_690753 ) ) ( not ( = ?auto_690749 ?auto_690754 ) ) ( not ( = ?auto_690750 ?auto_690751 ) ) ( not ( = ?auto_690750 ?auto_690752 ) ) ( not ( = ?auto_690750 ?auto_690753 ) ) ( not ( = ?auto_690750 ?auto_690754 ) ) ( not ( = ?auto_690751 ?auto_690752 ) ) ( not ( = ?auto_690751 ?auto_690753 ) ) ( not ( = ?auto_690751 ?auto_690754 ) ) ( not ( = ?auto_690752 ?auto_690753 ) ) ( not ( = ?auto_690752 ?auto_690754 ) ) ( not ( = ?auto_690753 ?auto_690754 ) ) ( ON ?auto_690752 ?auto_690753 ) ( ON ?auto_690751 ?auto_690752 ) ( ON ?auto_690750 ?auto_690751 ) ( ON ?auto_690749 ?auto_690750 ) ( ON ?auto_690748 ?auto_690749 ) ( ON ?auto_690747 ?auto_690748 ) ( ON ?auto_690746 ?auto_690747 ) ( ON ?auto_690745 ?auto_690746 ) ( ON ?auto_690744 ?auto_690745 ) ( CLEAR ?auto_690742 ) ( ON ?auto_690743 ?auto_690744 ) ( CLEAR ?auto_690743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_690741 ?auto_690742 ?auto_690743 )
      ( MAKE-13PILE ?auto_690741 ?auto_690742 ?auto_690743 ?auto_690744 ?auto_690745 ?auto_690746 ?auto_690747 ?auto_690748 ?auto_690749 ?auto_690750 ?auto_690751 ?auto_690752 ?auto_690753 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_690795 - BLOCK
      ?auto_690796 - BLOCK
      ?auto_690797 - BLOCK
      ?auto_690798 - BLOCK
      ?auto_690799 - BLOCK
      ?auto_690800 - BLOCK
      ?auto_690801 - BLOCK
      ?auto_690802 - BLOCK
      ?auto_690803 - BLOCK
      ?auto_690804 - BLOCK
      ?auto_690805 - BLOCK
      ?auto_690806 - BLOCK
      ?auto_690807 - BLOCK
    )
    :vars
    (
      ?auto_690808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690807 ?auto_690808 ) ( ON-TABLE ?auto_690795 ) ( not ( = ?auto_690795 ?auto_690796 ) ) ( not ( = ?auto_690795 ?auto_690797 ) ) ( not ( = ?auto_690795 ?auto_690798 ) ) ( not ( = ?auto_690795 ?auto_690799 ) ) ( not ( = ?auto_690795 ?auto_690800 ) ) ( not ( = ?auto_690795 ?auto_690801 ) ) ( not ( = ?auto_690795 ?auto_690802 ) ) ( not ( = ?auto_690795 ?auto_690803 ) ) ( not ( = ?auto_690795 ?auto_690804 ) ) ( not ( = ?auto_690795 ?auto_690805 ) ) ( not ( = ?auto_690795 ?auto_690806 ) ) ( not ( = ?auto_690795 ?auto_690807 ) ) ( not ( = ?auto_690795 ?auto_690808 ) ) ( not ( = ?auto_690796 ?auto_690797 ) ) ( not ( = ?auto_690796 ?auto_690798 ) ) ( not ( = ?auto_690796 ?auto_690799 ) ) ( not ( = ?auto_690796 ?auto_690800 ) ) ( not ( = ?auto_690796 ?auto_690801 ) ) ( not ( = ?auto_690796 ?auto_690802 ) ) ( not ( = ?auto_690796 ?auto_690803 ) ) ( not ( = ?auto_690796 ?auto_690804 ) ) ( not ( = ?auto_690796 ?auto_690805 ) ) ( not ( = ?auto_690796 ?auto_690806 ) ) ( not ( = ?auto_690796 ?auto_690807 ) ) ( not ( = ?auto_690796 ?auto_690808 ) ) ( not ( = ?auto_690797 ?auto_690798 ) ) ( not ( = ?auto_690797 ?auto_690799 ) ) ( not ( = ?auto_690797 ?auto_690800 ) ) ( not ( = ?auto_690797 ?auto_690801 ) ) ( not ( = ?auto_690797 ?auto_690802 ) ) ( not ( = ?auto_690797 ?auto_690803 ) ) ( not ( = ?auto_690797 ?auto_690804 ) ) ( not ( = ?auto_690797 ?auto_690805 ) ) ( not ( = ?auto_690797 ?auto_690806 ) ) ( not ( = ?auto_690797 ?auto_690807 ) ) ( not ( = ?auto_690797 ?auto_690808 ) ) ( not ( = ?auto_690798 ?auto_690799 ) ) ( not ( = ?auto_690798 ?auto_690800 ) ) ( not ( = ?auto_690798 ?auto_690801 ) ) ( not ( = ?auto_690798 ?auto_690802 ) ) ( not ( = ?auto_690798 ?auto_690803 ) ) ( not ( = ?auto_690798 ?auto_690804 ) ) ( not ( = ?auto_690798 ?auto_690805 ) ) ( not ( = ?auto_690798 ?auto_690806 ) ) ( not ( = ?auto_690798 ?auto_690807 ) ) ( not ( = ?auto_690798 ?auto_690808 ) ) ( not ( = ?auto_690799 ?auto_690800 ) ) ( not ( = ?auto_690799 ?auto_690801 ) ) ( not ( = ?auto_690799 ?auto_690802 ) ) ( not ( = ?auto_690799 ?auto_690803 ) ) ( not ( = ?auto_690799 ?auto_690804 ) ) ( not ( = ?auto_690799 ?auto_690805 ) ) ( not ( = ?auto_690799 ?auto_690806 ) ) ( not ( = ?auto_690799 ?auto_690807 ) ) ( not ( = ?auto_690799 ?auto_690808 ) ) ( not ( = ?auto_690800 ?auto_690801 ) ) ( not ( = ?auto_690800 ?auto_690802 ) ) ( not ( = ?auto_690800 ?auto_690803 ) ) ( not ( = ?auto_690800 ?auto_690804 ) ) ( not ( = ?auto_690800 ?auto_690805 ) ) ( not ( = ?auto_690800 ?auto_690806 ) ) ( not ( = ?auto_690800 ?auto_690807 ) ) ( not ( = ?auto_690800 ?auto_690808 ) ) ( not ( = ?auto_690801 ?auto_690802 ) ) ( not ( = ?auto_690801 ?auto_690803 ) ) ( not ( = ?auto_690801 ?auto_690804 ) ) ( not ( = ?auto_690801 ?auto_690805 ) ) ( not ( = ?auto_690801 ?auto_690806 ) ) ( not ( = ?auto_690801 ?auto_690807 ) ) ( not ( = ?auto_690801 ?auto_690808 ) ) ( not ( = ?auto_690802 ?auto_690803 ) ) ( not ( = ?auto_690802 ?auto_690804 ) ) ( not ( = ?auto_690802 ?auto_690805 ) ) ( not ( = ?auto_690802 ?auto_690806 ) ) ( not ( = ?auto_690802 ?auto_690807 ) ) ( not ( = ?auto_690802 ?auto_690808 ) ) ( not ( = ?auto_690803 ?auto_690804 ) ) ( not ( = ?auto_690803 ?auto_690805 ) ) ( not ( = ?auto_690803 ?auto_690806 ) ) ( not ( = ?auto_690803 ?auto_690807 ) ) ( not ( = ?auto_690803 ?auto_690808 ) ) ( not ( = ?auto_690804 ?auto_690805 ) ) ( not ( = ?auto_690804 ?auto_690806 ) ) ( not ( = ?auto_690804 ?auto_690807 ) ) ( not ( = ?auto_690804 ?auto_690808 ) ) ( not ( = ?auto_690805 ?auto_690806 ) ) ( not ( = ?auto_690805 ?auto_690807 ) ) ( not ( = ?auto_690805 ?auto_690808 ) ) ( not ( = ?auto_690806 ?auto_690807 ) ) ( not ( = ?auto_690806 ?auto_690808 ) ) ( not ( = ?auto_690807 ?auto_690808 ) ) ( ON ?auto_690806 ?auto_690807 ) ( ON ?auto_690805 ?auto_690806 ) ( ON ?auto_690804 ?auto_690805 ) ( ON ?auto_690803 ?auto_690804 ) ( ON ?auto_690802 ?auto_690803 ) ( ON ?auto_690801 ?auto_690802 ) ( ON ?auto_690800 ?auto_690801 ) ( ON ?auto_690799 ?auto_690800 ) ( ON ?auto_690798 ?auto_690799 ) ( ON ?auto_690797 ?auto_690798 ) ( CLEAR ?auto_690795 ) ( ON ?auto_690796 ?auto_690797 ) ( CLEAR ?auto_690796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_690795 ?auto_690796 )
      ( MAKE-13PILE ?auto_690795 ?auto_690796 ?auto_690797 ?auto_690798 ?auto_690799 ?auto_690800 ?auto_690801 ?auto_690802 ?auto_690803 ?auto_690804 ?auto_690805 ?auto_690806 ?auto_690807 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_690849 - BLOCK
      ?auto_690850 - BLOCK
      ?auto_690851 - BLOCK
      ?auto_690852 - BLOCK
      ?auto_690853 - BLOCK
      ?auto_690854 - BLOCK
      ?auto_690855 - BLOCK
      ?auto_690856 - BLOCK
      ?auto_690857 - BLOCK
      ?auto_690858 - BLOCK
      ?auto_690859 - BLOCK
      ?auto_690860 - BLOCK
      ?auto_690861 - BLOCK
    )
    :vars
    (
      ?auto_690862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690861 ?auto_690862 ) ( not ( = ?auto_690849 ?auto_690850 ) ) ( not ( = ?auto_690849 ?auto_690851 ) ) ( not ( = ?auto_690849 ?auto_690852 ) ) ( not ( = ?auto_690849 ?auto_690853 ) ) ( not ( = ?auto_690849 ?auto_690854 ) ) ( not ( = ?auto_690849 ?auto_690855 ) ) ( not ( = ?auto_690849 ?auto_690856 ) ) ( not ( = ?auto_690849 ?auto_690857 ) ) ( not ( = ?auto_690849 ?auto_690858 ) ) ( not ( = ?auto_690849 ?auto_690859 ) ) ( not ( = ?auto_690849 ?auto_690860 ) ) ( not ( = ?auto_690849 ?auto_690861 ) ) ( not ( = ?auto_690849 ?auto_690862 ) ) ( not ( = ?auto_690850 ?auto_690851 ) ) ( not ( = ?auto_690850 ?auto_690852 ) ) ( not ( = ?auto_690850 ?auto_690853 ) ) ( not ( = ?auto_690850 ?auto_690854 ) ) ( not ( = ?auto_690850 ?auto_690855 ) ) ( not ( = ?auto_690850 ?auto_690856 ) ) ( not ( = ?auto_690850 ?auto_690857 ) ) ( not ( = ?auto_690850 ?auto_690858 ) ) ( not ( = ?auto_690850 ?auto_690859 ) ) ( not ( = ?auto_690850 ?auto_690860 ) ) ( not ( = ?auto_690850 ?auto_690861 ) ) ( not ( = ?auto_690850 ?auto_690862 ) ) ( not ( = ?auto_690851 ?auto_690852 ) ) ( not ( = ?auto_690851 ?auto_690853 ) ) ( not ( = ?auto_690851 ?auto_690854 ) ) ( not ( = ?auto_690851 ?auto_690855 ) ) ( not ( = ?auto_690851 ?auto_690856 ) ) ( not ( = ?auto_690851 ?auto_690857 ) ) ( not ( = ?auto_690851 ?auto_690858 ) ) ( not ( = ?auto_690851 ?auto_690859 ) ) ( not ( = ?auto_690851 ?auto_690860 ) ) ( not ( = ?auto_690851 ?auto_690861 ) ) ( not ( = ?auto_690851 ?auto_690862 ) ) ( not ( = ?auto_690852 ?auto_690853 ) ) ( not ( = ?auto_690852 ?auto_690854 ) ) ( not ( = ?auto_690852 ?auto_690855 ) ) ( not ( = ?auto_690852 ?auto_690856 ) ) ( not ( = ?auto_690852 ?auto_690857 ) ) ( not ( = ?auto_690852 ?auto_690858 ) ) ( not ( = ?auto_690852 ?auto_690859 ) ) ( not ( = ?auto_690852 ?auto_690860 ) ) ( not ( = ?auto_690852 ?auto_690861 ) ) ( not ( = ?auto_690852 ?auto_690862 ) ) ( not ( = ?auto_690853 ?auto_690854 ) ) ( not ( = ?auto_690853 ?auto_690855 ) ) ( not ( = ?auto_690853 ?auto_690856 ) ) ( not ( = ?auto_690853 ?auto_690857 ) ) ( not ( = ?auto_690853 ?auto_690858 ) ) ( not ( = ?auto_690853 ?auto_690859 ) ) ( not ( = ?auto_690853 ?auto_690860 ) ) ( not ( = ?auto_690853 ?auto_690861 ) ) ( not ( = ?auto_690853 ?auto_690862 ) ) ( not ( = ?auto_690854 ?auto_690855 ) ) ( not ( = ?auto_690854 ?auto_690856 ) ) ( not ( = ?auto_690854 ?auto_690857 ) ) ( not ( = ?auto_690854 ?auto_690858 ) ) ( not ( = ?auto_690854 ?auto_690859 ) ) ( not ( = ?auto_690854 ?auto_690860 ) ) ( not ( = ?auto_690854 ?auto_690861 ) ) ( not ( = ?auto_690854 ?auto_690862 ) ) ( not ( = ?auto_690855 ?auto_690856 ) ) ( not ( = ?auto_690855 ?auto_690857 ) ) ( not ( = ?auto_690855 ?auto_690858 ) ) ( not ( = ?auto_690855 ?auto_690859 ) ) ( not ( = ?auto_690855 ?auto_690860 ) ) ( not ( = ?auto_690855 ?auto_690861 ) ) ( not ( = ?auto_690855 ?auto_690862 ) ) ( not ( = ?auto_690856 ?auto_690857 ) ) ( not ( = ?auto_690856 ?auto_690858 ) ) ( not ( = ?auto_690856 ?auto_690859 ) ) ( not ( = ?auto_690856 ?auto_690860 ) ) ( not ( = ?auto_690856 ?auto_690861 ) ) ( not ( = ?auto_690856 ?auto_690862 ) ) ( not ( = ?auto_690857 ?auto_690858 ) ) ( not ( = ?auto_690857 ?auto_690859 ) ) ( not ( = ?auto_690857 ?auto_690860 ) ) ( not ( = ?auto_690857 ?auto_690861 ) ) ( not ( = ?auto_690857 ?auto_690862 ) ) ( not ( = ?auto_690858 ?auto_690859 ) ) ( not ( = ?auto_690858 ?auto_690860 ) ) ( not ( = ?auto_690858 ?auto_690861 ) ) ( not ( = ?auto_690858 ?auto_690862 ) ) ( not ( = ?auto_690859 ?auto_690860 ) ) ( not ( = ?auto_690859 ?auto_690861 ) ) ( not ( = ?auto_690859 ?auto_690862 ) ) ( not ( = ?auto_690860 ?auto_690861 ) ) ( not ( = ?auto_690860 ?auto_690862 ) ) ( not ( = ?auto_690861 ?auto_690862 ) ) ( ON ?auto_690860 ?auto_690861 ) ( ON ?auto_690859 ?auto_690860 ) ( ON ?auto_690858 ?auto_690859 ) ( ON ?auto_690857 ?auto_690858 ) ( ON ?auto_690856 ?auto_690857 ) ( ON ?auto_690855 ?auto_690856 ) ( ON ?auto_690854 ?auto_690855 ) ( ON ?auto_690853 ?auto_690854 ) ( ON ?auto_690852 ?auto_690853 ) ( ON ?auto_690851 ?auto_690852 ) ( ON ?auto_690850 ?auto_690851 ) ( ON ?auto_690849 ?auto_690850 ) ( CLEAR ?auto_690849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_690849 )
      ( MAKE-13PILE ?auto_690849 ?auto_690850 ?auto_690851 ?auto_690852 ?auto_690853 ?auto_690854 ?auto_690855 ?auto_690856 ?auto_690857 ?auto_690858 ?auto_690859 ?auto_690860 ?auto_690861 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_690904 - BLOCK
      ?auto_690905 - BLOCK
      ?auto_690906 - BLOCK
      ?auto_690907 - BLOCK
      ?auto_690908 - BLOCK
      ?auto_690909 - BLOCK
      ?auto_690910 - BLOCK
      ?auto_690911 - BLOCK
      ?auto_690912 - BLOCK
      ?auto_690913 - BLOCK
      ?auto_690914 - BLOCK
      ?auto_690915 - BLOCK
      ?auto_690916 - BLOCK
      ?auto_690917 - BLOCK
    )
    :vars
    (
      ?auto_690918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_690916 ) ( ON ?auto_690917 ?auto_690918 ) ( CLEAR ?auto_690917 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_690904 ) ( ON ?auto_690905 ?auto_690904 ) ( ON ?auto_690906 ?auto_690905 ) ( ON ?auto_690907 ?auto_690906 ) ( ON ?auto_690908 ?auto_690907 ) ( ON ?auto_690909 ?auto_690908 ) ( ON ?auto_690910 ?auto_690909 ) ( ON ?auto_690911 ?auto_690910 ) ( ON ?auto_690912 ?auto_690911 ) ( ON ?auto_690913 ?auto_690912 ) ( ON ?auto_690914 ?auto_690913 ) ( ON ?auto_690915 ?auto_690914 ) ( ON ?auto_690916 ?auto_690915 ) ( not ( = ?auto_690904 ?auto_690905 ) ) ( not ( = ?auto_690904 ?auto_690906 ) ) ( not ( = ?auto_690904 ?auto_690907 ) ) ( not ( = ?auto_690904 ?auto_690908 ) ) ( not ( = ?auto_690904 ?auto_690909 ) ) ( not ( = ?auto_690904 ?auto_690910 ) ) ( not ( = ?auto_690904 ?auto_690911 ) ) ( not ( = ?auto_690904 ?auto_690912 ) ) ( not ( = ?auto_690904 ?auto_690913 ) ) ( not ( = ?auto_690904 ?auto_690914 ) ) ( not ( = ?auto_690904 ?auto_690915 ) ) ( not ( = ?auto_690904 ?auto_690916 ) ) ( not ( = ?auto_690904 ?auto_690917 ) ) ( not ( = ?auto_690904 ?auto_690918 ) ) ( not ( = ?auto_690905 ?auto_690906 ) ) ( not ( = ?auto_690905 ?auto_690907 ) ) ( not ( = ?auto_690905 ?auto_690908 ) ) ( not ( = ?auto_690905 ?auto_690909 ) ) ( not ( = ?auto_690905 ?auto_690910 ) ) ( not ( = ?auto_690905 ?auto_690911 ) ) ( not ( = ?auto_690905 ?auto_690912 ) ) ( not ( = ?auto_690905 ?auto_690913 ) ) ( not ( = ?auto_690905 ?auto_690914 ) ) ( not ( = ?auto_690905 ?auto_690915 ) ) ( not ( = ?auto_690905 ?auto_690916 ) ) ( not ( = ?auto_690905 ?auto_690917 ) ) ( not ( = ?auto_690905 ?auto_690918 ) ) ( not ( = ?auto_690906 ?auto_690907 ) ) ( not ( = ?auto_690906 ?auto_690908 ) ) ( not ( = ?auto_690906 ?auto_690909 ) ) ( not ( = ?auto_690906 ?auto_690910 ) ) ( not ( = ?auto_690906 ?auto_690911 ) ) ( not ( = ?auto_690906 ?auto_690912 ) ) ( not ( = ?auto_690906 ?auto_690913 ) ) ( not ( = ?auto_690906 ?auto_690914 ) ) ( not ( = ?auto_690906 ?auto_690915 ) ) ( not ( = ?auto_690906 ?auto_690916 ) ) ( not ( = ?auto_690906 ?auto_690917 ) ) ( not ( = ?auto_690906 ?auto_690918 ) ) ( not ( = ?auto_690907 ?auto_690908 ) ) ( not ( = ?auto_690907 ?auto_690909 ) ) ( not ( = ?auto_690907 ?auto_690910 ) ) ( not ( = ?auto_690907 ?auto_690911 ) ) ( not ( = ?auto_690907 ?auto_690912 ) ) ( not ( = ?auto_690907 ?auto_690913 ) ) ( not ( = ?auto_690907 ?auto_690914 ) ) ( not ( = ?auto_690907 ?auto_690915 ) ) ( not ( = ?auto_690907 ?auto_690916 ) ) ( not ( = ?auto_690907 ?auto_690917 ) ) ( not ( = ?auto_690907 ?auto_690918 ) ) ( not ( = ?auto_690908 ?auto_690909 ) ) ( not ( = ?auto_690908 ?auto_690910 ) ) ( not ( = ?auto_690908 ?auto_690911 ) ) ( not ( = ?auto_690908 ?auto_690912 ) ) ( not ( = ?auto_690908 ?auto_690913 ) ) ( not ( = ?auto_690908 ?auto_690914 ) ) ( not ( = ?auto_690908 ?auto_690915 ) ) ( not ( = ?auto_690908 ?auto_690916 ) ) ( not ( = ?auto_690908 ?auto_690917 ) ) ( not ( = ?auto_690908 ?auto_690918 ) ) ( not ( = ?auto_690909 ?auto_690910 ) ) ( not ( = ?auto_690909 ?auto_690911 ) ) ( not ( = ?auto_690909 ?auto_690912 ) ) ( not ( = ?auto_690909 ?auto_690913 ) ) ( not ( = ?auto_690909 ?auto_690914 ) ) ( not ( = ?auto_690909 ?auto_690915 ) ) ( not ( = ?auto_690909 ?auto_690916 ) ) ( not ( = ?auto_690909 ?auto_690917 ) ) ( not ( = ?auto_690909 ?auto_690918 ) ) ( not ( = ?auto_690910 ?auto_690911 ) ) ( not ( = ?auto_690910 ?auto_690912 ) ) ( not ( = ?auto_690910 ?auto_690913 ) ) ( not ( = ?auto_690910 ?auto_690914 ) ) ( not ( = ?auto_690910 ?auto_690915 ) ) ( not ( = ?auto_690910 ?auto_690916 ) ) ( not ( = ?auto_690910 ?auto_690917 ) ) ( not ( = ?auto_690910 ?auto_690918 ) ) ( not ( = ?auto_690911 ?auto_690912 ) ) ( not ( = ?auto_690911 ?auto_690913 ) ) ( not ( = ?auto_690911 ?auto_690914 ) ) ( not ( = ?auto_690911 ?auto_690915 ) ) ( not ( = ?auto_690911 ?auto_690916 ) ) ( not ( = ?auto_690911 ?auto_690917 ) ) ( not ( = ?auto_690911 ?auto_690918 ) ) ( not ( = ?auto_690912 ?auto_690913 ) ) ( not ( = ?auto_690912 ?auto_690914 ) ) ( not ( = ?auto_690912 ?auto_690915 ) ) ( not ( = ?auto_690912 ?auto_690916 ) ) ( not ( = ?auto_690912 ?auto_690917 ) ) ( not ( = ?auto_690912 ?auto_690918 ) ) ( not ( = ?auto_690913 ?auto_690914 ) ) ( not ( = ?auto_690913 ?auto_690915 ) ) ( not ( = ?auto_690913 ?auto_690916 ) ) ( not ( = ?auto_690913 ?auto_690917 ) ) ( not ( = ?auto_690913 ?auto_690918 ) ) ( not ( = ?auto_690914 ?auto_690915 ) ) ( not ( = ?auto_690914 ?auto_690916 ) ) ( not ( = ?auto_690914 ?auto_690917 ) ) ( not ( = ?auto_690914 ?auto_690918 ) ) ( not ( = ?auto_690915 ?auto_690916 ) ) ( not ( = ?auto_690915 ?auto_690917 ) ) ( not ( = ?auto_690915 ?auto_690918 ) ) ( not ( = ?auto_690916 ?auto_690917 ) ) ( not ( = ?auto_690916 ?auto_690918 ) ) ( not ( = ?auto_690917 ?auto_690918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_690917 ?auto_690918 )
      ( !STACK ?auto_690917 ?auto_690916 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_690962 - BLOCK
      ?auto_690963 - BLOCK
      ?auto_690964 - BLOCK
      ?auto_690965 - BLOCK
      ?auto_690966 - BLOCK
      ?auto_690967 - BLOCK
      ?auto_690968 - BLOCK
      ?auto_690969 - BLOCK
      ?auto_690970 - BLOCK
      ?auto_690971 - BLOCK
      ?auto_690972 - BLOCK
      ?auto_690973 - BLOCK
      ?auto_690974 - BLOCK
      ?auto_690975 - BLOCK
    )
    :vars
    (
      ?auto_690976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_690975 ?auto_690976 ) ( ON-TABLE ?auto_690962 ) ( ON ?auto_690963 ?auto_690962 ) ( ON ?auto_690964 ?auto_690963 ) ( ON ?auto_690965 ?auto_690964 ) ( ON ?auto_690966 ?auto_690965 ) ( ON ?auto_690967 ?auto_690966 ) ( ON ?auto_690968 ?auto_690967 ) ( ON ?auto_690969 ?auto_690968 ) ( ON ?auto_690970 ?auto_690969 ) ( ON ?auto_690971 ?auto_690970 ) ( ON ?auto_690972 ?auto_690971 ) ( ON ?auto_690973 ?auto_690972 ) ( not ( = ?auto_690962 ?auto_690963 ) ) ( not ( = ?auto_690962 ?auto_690964 ) ) ( not ( = ?auto_690962 ?auto_690965 ) ) ( not ( = ?auto_690962 ?auto_690966 ) ) ( not ( = ?auto_690962 ?auto_690967 ) ) ( not ( = ?auto_690962 ?auto_690968 ) ) ( not ( = ?auto_690962 ?auto_690969 ) ) ( not ( = ?auto_690962 ?auto_690970 ) ) ( not ( = ?auto_690962 ?auto_690971 ) ) ( not ( = ?auto_690962 ?auto_690972 ) ) ( not ( = ?auto_690962 ?auto_690973 ) ) ( not ( = ?auto_690962 ?auto_690974 ) ) ( not ( = ?auto_690962 ?auto_690975 ) ) ( not ( = ?auto_690962 ?auto_690976 ) ) ( not ( = ?auto_690963 ?auto_690964 ) ) ( not ( = ?auto_690963 ?auto_690965 ) ) ( not ( = ?auto_690963 ?auto_690966 ) ) ( not ( = ?auto_690963 ?auto_690967 ) ) ( not ( = ?auto_690963 ?auto_690968 ) ) ( not ( = ?auto_690963 ?auto_690969 ) ) ( not ( = ?auto_690963 ?auto_690970 ) ) ( not ( = ?auto_690963 ?auto_690971 ) ) ( not ( = ?auto_690963 ?auto_690972 ) ) ( not ( = ?auto_690963 ?auto_690973 ) ) ( not ( = ?auto_690963 ?auto_690974 ) ) ( not ( = ?auto_690963 ?auto_690975 ) ) ( not ( = ?auto_690963 ?auto_690976 ) ) ( not ( = ?auto_690964 ?auto_690965 ) ) ( not ( = ?auto_690964 ?auto_690966 ) ) ( not ( = ?auto_690964 ?auto_690967 ) ) ( not ( = ?auto_690964 ?auto_690968 ) ) ( not ( = ?auto_690964 ?auto_690969 ) ) ( not ( = ?auto_690964 ?auto_690970 ) ) ( not ( = ?auto_690964 ?auto_690971 ) ) ( not ( = ?auto_690964 ?auto_690972 ) ) ( not ( = ?auto_690964 ?auto_690973 ) ) ( not ( = ?auto_690964 ?auto_690974 ) ) ( not ( = ?auto_690964 ?auto_690975 ) ) ( not ( = ?auto_690964 ?auto_690976 ) ) ( not ( = ?auto_690965 ?auto_690966 ) ) ( not ( = ?auto_690965 ?auto_690967 ) ) ( not ( = ?auto_690965 ?auto_690968 ) ) ( not ( = ?auto_690965 ?auto_690969 ) ) ( not ( = ?auto_690965 ?auto_690970 ) ) ( not ( = ?auto_690965 ?auto_690971 ) ) ( not ( = ?auto_690965 ?auto_690972 ) ) ( not ( = ?auto_690965 ?auto_690973 ) ) ( not ( = ?auto_690965 ?auto_690974 ) ) ( not ( = ?auto_690965 ?auto_690975 ) ) ( not ( = ?auto_690965 ?auto_690976 ) ) ( not ( = ?auto_690966 ?auto_690967 ) ) ( not ( = ?auto_690966 ?auto_690968 ) ) ( not ( = ?auto_690966 ?auto_690969 ) ) ( not ( = ?auto_690966 ?auto_690970 ) ) ( not ( = ?auto_690966 ?auto_690971 ) ) ( not ( = ?auto_690966 ?auto_690972 ) ) ( not ( = ?auto_690966 ?auto_690973 ) ) ( not ( = ?auto_690966 ?auto_690974 ) ) ( not ( = ?auto_690966 ?auto_690975 ) ) ( not ( = ?auto_690966 ?auto_690976 ) ) ( not ( = ?auto_690967 ?auto_690968 ) ) ( not ( = ?auto_690967 ?auto_690969 ) ) ( not ( = ?auto_690967 ?auto_690970 ) ) ( not ( = ?auto_690967 ?auto_690971 ) ) ( not ( = ?auto_690967 ?auto_690972 ) ) ( not ( = ?auto_690967 ?auto_690973 ) ) ( not ( = ?auto_690967 ?auto_690974 ) ) ( not ( = ?auto_690967 ?auto_690975 ) ) ( not ( = ?auto_690967 ?auto_690976 ) ) ( not ( = ?auto_690968 ?auto_690969 ) ) ( not ( = ?auto_690968 ?auto_690970 ) ) ( not ( = ?auto_690968 ?auto_690971 ) ) ( not ( = ?auto_690968 ?auto_690972 ) ) ( not ( = ?auto_690968 ?auto_690973 ) ) ( not ( = ?auto_690968 ?auto_690974 ) ) ( not ( = ?auto_690968 ?auto_690975 ) ) ( not ( = ?auto_690968 ?auto_690976 ) ) ( not ( = ?auto_690969 ?auto_690970 ) ) ( not ( = ?auto_690969 ?auto_690971 ) ) ( not ( = ?auto_690969 ?auto_690972 ) ) ( not ( = ?auto_690969 ?auto_690973 ) ) ( not ( = ?auto_690969 ?auto_690974 ) ) ( not ( = ?auto_690969 ?auto_690975 ) ) ( not ( = ?auto_690969 ?auto_690976 ) ) ( not ( = ?auto_690970 ?auto_690971 ) ) ( not ( = ?auto_690970 ?auto_690972 ) ) ( not ( = ?auto_690970 ?auto_690973 ) ) ( not ( = ?auto_690970 ?auto_690974 ) ) ( not ( = ?auto_690970 ?auto_690975 ) ) ( not ( = ?auto_690970 ?auto_690976 ) ) ( not ( = ?auto_690971 ?auto_690972 ) ) ( not ( = ?auto_690971 ?auto_690973 ) ) ( not ( = ?auto_690971 ?auto_690974 ) ) ( not ( = ?auto_690971 ?auto_690975 ) ) ( not ( = ?auto_690971 ?auto_690976 ) ) ( not ( = ?auto_690972 ?auto_690973 ) ) ( not ( = ?auto_690972 ?auto_690974 ) ) ( not ( = ?auto_690972 ?auto_690975 ) ) ( not ( = ?auto_690972 ?auto_690976 ) ) ( not ( = ?auto_690973 ?auto_690974 ) ) ( not ( = ?auto_690973 ?auto_690975 ) ) ( not ( = ?auto_690973 ?auto_690976 ) ) ( not ( = ?auto_690974 ?auto_690975 ) ) ( not ( = ?auto_690974 ?auto_690976 ) ) ( not ( = ?auto_690975 ?auto_690976 ) ) ( CLEAR ?auto_690973 ) ( ON ?auto_690974 ?auto_690975 ) ( CLEAR ?auto_690974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_690962 ?auto_690963 ?auto_690964 ?auto_690965 ?auto_690966 ?auto_690967 ?auto_690968 ?auto_690969 ?auto_690970 ?auto_690971 ?auto_690972 ?auto_690973 ?auto_690974 )
      ( MAKE-14PILE ?auto_690962 ?auto_690963 ?auto_690964 ?auto_690965 ?auto_690966 ?auto_690967 ?auto_690968 ?auto_690969 ?auto_690970 ?auto_690971 ?auto_690972 ?auto_690973 ?auto_690974 ?auto_690975 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_691020 - BLOCK
      ?auto_691021 - BLOCK
      ?auto_691022 - BLOCK
      ?auto_691023 - BLOCK
      ?auto_691024 - BLOCK
      ?auto_691025 - BLOCK
      ?auto_691026 - BLOCK
      ?auto_691027 - BLOCK
      ?auto_691028 - BLOCK
      ?auto_691029 - BLOCK
      ?auto_691030 - BLOCK
      ?auto_691031 - BLOCK
      ?auto_691032 - BLOCK
      ?auto_691033 - BLOCK
    )
    :vars
    (
      ?auto_691034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691033 ?auto_691034 ) ( ON-TABLE ?auto_691020 ) ( ON ?auto_691021 ?auto_691020 ) ( ON ?auto_691022 ?auto_691021 ) ( ON ?auto_691023 ?auto_691022 ) ( ON ?auto_691024 ?auto_691023 ) ( ON ?auto_691025 ?auto_691024 ) ( ON ?auto_691026 ?auto_691025 ) ( ON ?auto_691027 ?auto_691026 ) ( ON ?auto_691028 ?auto_691027 ) ( ON ?auto_691029 ?auto_691028 ) ( ON ?auto_691030 ?auto_691029 ) ( not ( = ?auto_691020 ?auto_691021 ) ) ( not ( = ?auto_691020 ?auto_691022 ) ) ( not ( = ?auto_691020 ?auto_691023 ) ) ( not ( = ?auto_691020 ?auto_691024 ) ) ( not ( = ?auto_691020 ?auto_691025 ) ) ( not ( = ?auto_691020 ?auto_691026 ) ) ( not ( = ?auto_691020 ?auto_691027 ) ) ( not ( = ?auto_691020 ?auto_691028 ) ) ( not ( = ?auto_691020 ?auto_691029 ) ) ( not ( = ?auto_691020 ?auto_691030 ) ) ( not ( = ?auto_691020 ?auto_691031 ) ) ( not ( = ?auto_691020 ?auto_691032 ) ) ( not ( = ?auto_691020 ?auto_691033 ) ) ( not ( = ?auto_691020 ?auto_691034 ) ) ( not ( = ?auto_691021 ?auto_691022 ) ) ( not ( = ?auto_691021 ?auto_691023 ) ) ( not ( = ?auto_691021 ?auto_691024 ) ) ( not ( = ?auto_691021 ?auto_691025 ) ) ( not ( = ?auto_691021 ?auto_691026 ) ) ( not ( = ?auto_691021 ?auto_691027 ) ) ( not ( = ?auto_691021 ?auto_691028 ) ) ( not ( = ?auto_691021 ?auto_691029 ) ) ( not ( = ?auto_691021 ?auto_691030 ) ) ( not ( = ?auto_691021 ?auto_691031 ) ) ( not ( = ?auto_691021 ?auto_691032 ) ) ( not ( = ?auto_691021 ?auto_691033 ) ) ( not ( = ?auto_691021 ?auto_691034 ) ) ( not ( = ?auto_691022 ?auto_691023 ) ) ( not ( = ?auto_691022 ?auto_691024 ) ) ( not ( = ?auto_691022 ?auto_691025 ) ) ( not ( = ?auto_691022 ?auto_691026 ) ) ( not ( = ?auto_691022 ?auto_691027 ) ) ( not ( = ?auto_691022 ?auto_691028 ) ) ( not ( = ?auto_691022 ?auto_691029 ) ) ( not ( = ?auto_691022 ?auto_691030 ) ) ( not ( = ?auto_691022 ?auto_691031 ) ) ( not ( = ?auto_691022 ?auto_691032 ) ) ( not ( = ?auto_691022 ?auto_691033 ) ) ( not ( = ?auto_691022 ?auto_691034 ) ) ( not ( = ?auto_691023 ?auto_691024 ) ) ( not ( = ?auto_691023 ?auto_691025 ) ) ( not ( = ?auto_691023 ?auto_691026 ) ) ( not ( = ?auto_691023 ?auto_691027 ) ) ( not ( = ?auto_691023 ?auto_691028 ) ) ( not ( = ?auto_691023 ?auto_691029 ) ) ( not ( = ?auto_691023 ?auto_691030 ) ) ( not ( = ?auto_691023 ?auto_691031 ) ) ( not ( = ?auto_691023 ?auto_691032 ) ) ( not ( = ?auto_691023 ?auto_691033 ) ) ( not ( = ?auto_691023 ?auto_691034 ) ) ( not ( = ?auto_691024 ?auto_691025 ) ) ( not ( = ?auto_691024 ?auto_691026 ) ) ( not ( = ?auto_691024 ?auto_691027 ) ) ( not ( = ?auto_691024 ?auto_691028 ) ) ( not ( = ?auto_691024 ?auto_691029 ) ) ( not ( = ?auto_691024 ?auto_691030 ) ) ( not ( = ?auto_691024 ?auto_691031 ) ) ( not ( = ?auto_691024 ?auto_691032 ) ) ( not ( = ?auto_691024 ?auto_691033 ) ) ( not ( = ?auto_691024 ?auto_691034 ) ) ( not ( = ?auto_691025 ?auto_691026 ) ) ( not ( = ?auto_691025 ?auto_691027 ) ) ( not ( = ?auto_691025 ?auto_691028 ) ) ( not ( = ?auto_691025 ?auto_691029 ) ) ( not ( = ?auto_691025 ?auto_691030 ) ) ( not ( = ?auto_691025 ?auto_691031 ) ) ( not ( = ?auto_691025 ?auto_691032 ) ) ( not ( = ?auto_691025 ?auto_691033 ) ) ( not ( = ?auto_691025 ?auto_691034 ) ) ( not ( = ?auto_691026 ?auto_691027 ) ) ( not ( = ?auto_691026 ?auto_691028 ) ) ( not ( = ?auto_691026 ?auto_691029 ) ) ( not ( = ?auto_691026 ?auto_691030 ) ) ( not ( = ?auto_691026 ?auto_691031 ) ) ( not ( = ?auto_691026 ?auto_691032 ) ) ( not ( = ?auto_691026 ?auto_691033 ) ) ( not ( = ?auto_691026 ?auto_691034 ) ) ( not ( = ?auto_691027 ?auto_691028 ) ) ( not ( = ?auto_691027 ?auto_691029 ) ) ( not ( = ?auto_691027 ?auto_691030 ) ) ( not ( = ?auto_691027 ?auto_691031 ) ) ( not ( = ?auto_691027 ?auto_691032 ) ) ( not ( = ?auto_691027 ?auto_691033 ) ) ( not ( = ?auto_691027 ?auto_691034 ) ) ( not ( = ?auto_691028 ?auto_691029 ) ) ( not ( = ?auto_691028 ?auto_691030 ) ) ( not ( = ?auto_691028 ?auto_691031 ) ) ( not ( = ?auto_691028 ?auto_691032 ) ) ( not ( = ?auto_691028 ?auto_691033 ) ) ( not ( = ?auto_691028 ?auto_691034 ) ) ( not ( = ?auto_691029 ?auto_691030 ) ) ( not ( = ?auto_691029 ?auto_691031 ) ) ( not ( = ?auto_691029 ?auto_691032 ) ) ( not ( = ?auto_691029 ?auto_691033 ) ) ( not ( = ?auto_691029 ?auto_691034 ) ) ( not ( = ?auto_691030 ?auto_691031 ) ) ( not ( = ?auto_691030 ?auto_691032 ) ) ( not ( = ?auto_691030 ?auto_691033 ) ) ( not ( = ?auto_691030 ?auto_691034 ) ) ( not ( = ?auto_691031 ?auto_691032 ) ) ( not ( = ?auto_691031 ?auto_691033 ) ) ( not ( = ?auto_691031 ?auto_691034 ) ) ( not ( = ?auto_691032 ?auto_691033 ) ) ( not ( = ?auto_691032 ?auto_691034 ) ) ( not ( = ?auto_691033 ?auto_691034 ) ) ( ON ?auto_691032 ?auto_691033 ) ( CLEAR ?auto_691030 ) ( ON ?auto_691031 ?auto_691032 ) ( CLEAR ?auto_691031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_691020 ?auto_691021 ?auto_691022 ?auto_691023 ?auto_691024 ?auto_691025 ?auto_691026 ?auto_691027 ?auto_691028 ?auto_691029 ?auto_691030 ?auto_691031 )
      ( MAKE-14PILE ?auto_691020 ?auto_691021 ?auto_691022 ?auto_691023 ?auto_691024 ?auto_691025 ?auto_691026 ?auto_691027 ?auto_691028 ?auto_691029 ?auto_691030 ?auto_691031 ?auto_691032 ?auto_691033 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_691078 - BLOCK
      ?auto_691079 - BLOCK
      ?auto_691080 - BLOCK
      ?auto_691081 - BLOCK
      ?auto_691082 - BLOCK
      ?auto_691083 - BLOCK
      ?auto_691084 - BLOCK
      ?auto_691085 - BLOCK
      ?auto_691086 - BLOCK
      ?auto_691087 - BLOCK
      ?auto_691088 - BLOCK
      ?auto_691089 - BLOCK
      ?auto_691090 - BLOCK
      ?auto_691091 - BLOCK
    )
    :vars
    (
      ?auto_691092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691091 ?auto_691092 ) ( ON-TABLE ?auto_691078 ) ( ON ?auto_691079 ?auto_691078 ) ( ON ?auto_691080 ?auto_691079 ) ( ON ?auto_691081 ?auto_691080 ) ( ON ?auto_691082 ?auto_691081 ) ( ON ?auto_691083 ?auto_691082 ) ( ON ?auto_691084 ?auto_691083 ) ( ON ?auto_691085 ?auto_691084 ) ( ON ?auto_691086 ?auto_691085 ) ( ON ?auto_691087 ?auto_691086 ) ( not ( = ?auto_691078 ?auto_691079 ) ) ( not ( = ?auto_691078 ?auto_691080 ) ) ( not ( = ?auto_691078 ?auto_691081 ) ) ( not ( = ?auto_691078 ?auto_691082 ) ) ( not ( = ?auto_691078 ?auto_691083 ) ) ( not ( = ?auto_691078 ?auto_691084 ) ) ( not ( = ?auto_691078 ?auto_691085 ) ) ( not ( = ?auto_691078 ?auto_691086 ) ) ( not ( = ?auto_691078 ?auto_691087 ) ) ( not ( = ?auto_691078 ?auto_691088 ) ) ( not ( = ?auto_691078 ?auto_691089 ) ) ( not ( = ?auto_691078 ?auto_691090 ) ) ( not ( = ?auto_691078 ?auto_691091 ) ) ( not ( = ?auto_691078 ?auto_691092 ) ) ( not ( = ?auto_691079 ?auto_691080 ) ) ( not ( = ?auto_691079 ?auto_691081 ) ) ( not ( = ?auto_691079 ?auto_691082 ) ) ( not ( = ?auto_691079 ?auto_691083 ) ) ( not ( = ?auto_691079 ?auto_691084 ) ) ( not ( = ?auto_691079 ?auto_691085 ) ) ( not ( = ?auto_691079 ?auto_691086 ) ) ( not ( = ?auto_691079 ?auto_691087 ) ) ( not ( = ?auto_691079 ?auto_691088 ) ) ( not ( = ?auto_691079 ?auto_691089 ) ) ( not ( = ?auto_691079 ?auto_691090 ) ) ( not ( = ?auto_691079 ?auto_691091 ) ) ( not ( = ?auto_691079 ?auto_691092 ) ) ( not ( = ?auto_691080 ?auto_691081 ) ) ( not ( = ?auto_691080 ?auto_691082 ) ) ( not ( = ?auto_691080 ?auto_691083 ) ) ( not ( = ?auto_691080 ?auto_691084 ) ) ( not ( = ?auto_691080 ?auto_691085 ) ) ( not ( = ?auto_691080 ?auto_691086 ) ) ( not ( = ?auto_691080 ?auto_691087 ) ) ( not ( = ?auto_691080 ?auto_691088 ) ) ( not ( = ?auto_691080 ?auto_691089 ) ) ( not ( = ?auto_691080 ?auto_691090 ) ) ( not ( = ?auto_691080 ?auto_691091 ) ) ( not ( = ?auto_691080 ?auto_691092 ) ) ( not ( = ?auto_691081 ?auto_691082 ) ) ( not ( = ?auto_691081 ?auto_691083 ) ) ( not ( = ?auto_691081 ?auto_691084 ) ) ( not ( = ?auto_691081 ?auto_691085 ) ) ( not ( = ?auto_691081 ?auto_691086 ) ) ( not ( = ?auto_691081 ?auto_691087 ) ) ( not ( = ?auto_691081 ?auto_691088 ) ) ( not ( = ?auto_691081 ?auto_691089 ) ) ( not ( = ?auto_691081 ?auto_691090 ) ) ( not ( = ?auto_691081 ?auto_691091 ) ) ( not ( = ?auto_691081 ?auto_691092 ) ) ( not ( = ?auto_691082 ?auto_691083 ) ) ( not ( = ?auto_691082 ?auto_691084 ) ) ( not ( = ?auto_691082 ?auto_691085 ) ) ( not ( = ?auto_691082 ?auto_691086 ) ) ( not ( = ?auto_691082 ?auto_691087 ) ) ( not ( = ?auto_691082 ?auto_691088 ) ) ( not ( = ?auto_691082 ?auto_691089 ) ) ( not ( = ?auto_691082 ?auto_691090 ) ) ( not ( = ?auto_691082 ?auto_691091 ) ) ( not ( = ?auto_691082 ?auto_691092 ) ) ( not ( = ?auto_691083 ?auto_691084 ) ) ( not ( = ?auto_691083 ?auto_691085 ) ) ( not ( = ?auto_691083 ?auto_691086 ) ) ( not ( = ?auto_691083 ?auto_691087 ) ) ( not ( = ?auto_691083 ?auto_691088 ) ) ( not ( = ?auto_691083 ?auto_691089 ) ) ( not ( = ?auto_691083 ?auto_691090 ) ) ( not ( = ?auto_691083 ?auto_691091 ) ) ( not ( = ?auto_691083 ?auto_691092 ) ) ( not ( = ?auto_691084 ?auto_691085 ) ) ( not ( = ?auto_691084 ?auto_691086 ) ) ( not ( = ?auto_691084 ?auto_691087 ) ) ( not ( = ?auto_691084 ?auto_691088 ) ) ( not ( = ?auto_691084 ?auto_691089 ) ) ( not ( = ?auto_691084 ?auto_691090 ) ) ( not ( = ?auto_691084 ?auto_691091 ) ) ( not ( = ?auto_691084 ?auto_691092 ) ) ( not ( = ?auto_691085 ?auto_691086 ) ) ( not ( = ?auto_691085 ?auto_691087 ) ) ( not ( = ?auto_691085 ?auto_691088 ) ) ( not ( = ?auto_691085 ?auto_691089 ) ) ( not ( = ?auto_691085 ?auto_691090 ) ) ( not ( = ?auto_691085 ?auto_691091 ) ) ( not ( = ?auto_691085 ?auto_691092 ) ) ( not ( = ?auto_691086 ?auto_691087 ) ) ( not ( = ?auto_691086 ?auto_691088 ) ) ( not ( = ?auto_691086 ?auto_691089 ) ) ( not ( = ?auto_691086 ?auto_691090 ) ) ( not ( = ?auto_691086 ?auto_691091 ) ) ( not ( = ?auto_691086 ?auto_691092 ) ) ( not ( = ?auto_691087 ?auto_691088 ) ) ( not ( = ?auto_691087 ?auto_691089 ) ) ( not ( = ?auto_691087 ?auto_691090 ) ) ( not ( = ?auto_691087 ?auto_691091 ) ) ( not ( = ?auto_691087 ?auto_691092 ) ) ( not ( = ?auto_691088 ?auto_691089 ) ) ( not ( = ?auto_691088 ?auto_691090 ) ) ( not ( = ?auto_691088 ?auto_691091 ) ) ( not ( = ?auto_691088 ?auto_691092 ) ) ( not ( = ?auto_691089 ?auto_691090 ) ) ( not ( = ?auto_691089 ?auto_691091 ) ) ( not ( = ?auto_691089 ?auto_691092 ) ) ( not ( = ?auto_691090 ?auto_691091 ) ) ( not ( = ?auto_691090 ?auto_691092 ) ) ( not ( = ?auto_691091 ?auto_691092 ) ) ( ON ?auto_691090 ?auto_691091 ) ( ON ?auto_691089 ?auto_691090 ) ( CLEAR ?auto_691087 ) ( ON ?auto_691088 ?auto_691089 ) ( CLEAR ?auto_691088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_691078 ?auto_691079 ?auto_691080 ?auto_691081 ?auto_691082 ?auto_691083 ?auto_691084 ?auto_691085 ?auto_691086 ?auto_691087 ?auto_691088 )
      ( MAKE-14PILE ?auto_691078 ?auto_691079 ?auto_691080 ?auto_691081 ?auto_691082 ?auto_691083 ?auto_691084 ?auto_691085 ?auto_691086 ?auto_691087 ?auto_691088 ?auto_691089 ?auto_691090 ?auto_691091 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_691136 - BLOCK
      ?auto_691137 - BLOCK
      ?auto_691138 - BLOCK
      ?auto_691139 - BLOCK
      ?auto_691140 - BLOCK
      ?auto_691141 - BLOCK
      ?auto_691142 - BLOCK
      ?auto_691143 - BLOCK
      ?auto_691144 - BLOCK
      ?auto_691145 - BLOCK
      ?auto_691146 - BLOCK
      ?auto_691147 - BLOCK
      ?auto_691148 - BLOCK
      ?auto_691149 - BLOCK
    )
    :vars
    (
      ?auto_691150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691149 ?auto_691150 ) ( ON-TABLE ?auto_691136 ) ( ON ?auto_691137 ?auto_691136 ) ( ON ?auto_691138 ?auto_691137 ) ( ON ?auto_691139 ?auto_691138 ) ( ON ?auto_691140 ?auto_691139 ) ( ON ?auto_691141 ?auto_691140 ) ( ON ?auto_691142 ?auto_691141 ) ( ON ?auto_691143 ?auto_691142 ) ( ON ?auto_691144 ?auto_691143 ) ( not ( = ?auto_691136 ?auto_691137 ) ) ( not ( = ?auto_691136 ?auto_691138 ) ) ( not ( = ?auto_691136 ?auto_691139 ) ) ( not ( = ?auto_691136 ?auto_691140 ) ) ( not ( = ?auto_691136 ?auto_691141 ) ) ( not ( = ?auto_691136 ?auto_691142 ) ) ( not ( = ?auto_691136 ?auto_691143 ) ) ( not ( = ?auto_691136 ?auto_691144 ) ) ( not ( = ?auto_691136 ?auto_691145 ) ) ( not ( = ?auto_691136 ?auto_691146 ) ) ( not ( = ?auto_691136 ?auto_691147 ) ) ( not ( = ?auto_691136 ?auto_691148 ) ) ( not ( = ?auto_691136 ?auto_691149 ) ) ( not ( = ?auto_691136 ?auto_691150 ) ) ( not ( = ?auto_691137 ?auto_691138 ) ) ( not ( = ?auto_691137 ?auto_691139 ) ) ( not ( = ?auto_691137 ?auto_691140 ) ) ( not ( = ?auto_691137 ?auto_691141 ) ) ( not ( = ?auto_691137 ?auto_691142 ) ) ( not ( = ?auto_691137 ?auto_691143 ) ) ( not ( = ?auto_691137 ?auto_691144 ) ) ( not ( = ?auto_691137 ?auto_691145 ) ) ( not ( = ?auto_691137 ?auto_691146 ) ) ( not ( = ?auto_691137 ?auto_691147 ) ) ( not ( = ?auto_691137 ?auto_691148 ) ) ( not ( = ?auto_691137 ?auto_691149 ) ) ( not ( = ?auto_691137 ?auto_691150 ) ) ( not ( = ?auto_691138 ?auto_691139 ) ) ( not ( = ?auto_691138 ?auto_691140 ) ) ( not ( = ?auto_691138 ?auto_691141 ) ) ( not ( = ?auto_691138 ?auto_691142 ) ) ( not ( = ?auto_691138 ?auto_691143 ) ) ( not ( = ?auto_691138 ?auto_691144 ) ) ( not ( = ?auto_691138 ?auto_691145 ) ) ( not ( = ?auto_691138 ?auto_691146 ) ) ( not ( = ?auto_691138 ?auto_691147 ) ) ( not ( = ?auto_691138 ?auto_691148 ) ) ( not ( = ?auto_691138 ?auto_691149 ) ) ( not ( = ?auto_691138 ?auto_691150 ) ) ( not ( = ?auto_691139 ?auto_691140 ) ) ( not ( = ?auto_691139 ?auto_691141 ) ) ( not ( = ?auto_691139 ?auto_691142 ) ) ( not ( = ?auto_691139 ?auto_691143 ) ) ( not ( = ?auto_691139 ?auto_691144 ) ) ( not ( = ?auto_691139 ?auto_691145 ) ) ( not ( = ?auto_691139 ?auto_691146 ) ) ( not ( = ?auto_691139 ?auto_691147 ) ) ( not ( = ?auto_691139 ?auto_691148 ) ) ( not ( = ?auto_691139 ?auto_691149 ) ) ( not ( = ?auto_691139 ?auto_691150 ) ) ( not ( = ?auto_691140 ?auto_691141 ) ) ( not ( = ?auto_691140 ?auto_691142 ) ) ( not ( = ?auto_691140 ?auto_691143 ) ) ( not ( = ?auto_691140 ?auto_691144 ) ) ( not ( = ?auto_691140 ?auto_691145 ) ) ( not ( = ?auto_691140 ?auto_691146 ) ) ( not ( = ?auto_691140 ?auto_691147 ) ) ( not ( = ?auto_691140 ?auto_691148 ) ) ( not ( = ?auto_691140 ?auto_691149 ) ) ( not ( = ?auto_691140 ?auto_691150 ) ) ( not ( = ?auto_691141 ?auto_691142 ) ) ( not ( = ?auto_691141 ?auto_691143 ) ) ( not ( = ?auto_691141 ?auto_691144 ) ) ( not ( = ?auto_691141 ?auto_691145 ) ) ( not ( = ?auto_691141 ?auto_691146 ) ) ( not ( = ?auto_691141 ?auto_691147 ) ) ( not ( = ?auto_691141 ?auto_691148 ) ) ( not ( = ?auto_691141 ?auto_691149 ) ) ( not ( = ?auto_691141 ?auto_691150 ) ) ( not ( = ?auto_691142 ?auto_691143 ) ) ( not ( = ?auto_691142 ?auto_691144 ) ) ( not ( = ?auto_691142 ?auto_691145 ) ) ( not ( = ?auto_691142 ?auto_691146 ) ) ( not ( = ?auto_691142 ?auto_691147 ) ) ( not ( = ?auto_691142 ?auto_691148 ) ) ( not ( = ?auto_691142 ?auto_691149 ) ) ( not ( = ?auto_691142 ?auto_691150 ) ) ( not ( = ?auto_691143 ?auto_691144 ) ) ( not ( = ?auto_691143 ?auto_691145 ) ) ( not ( = ?auto_691143 ?auto_691146 ) ) ( not ( = ?auto_691143 ?auto_691147 ) ) ( not ( = ?auto_691143 ?auto_691148 ) ) ( not ( = ?auto_691143 ?auto_691149 ) ) ( not ( = ?auto_691143 ?auto_691150 ) ) ( not ( = ?auto_691144 ?auto_691145 ) ) ( not ( = ?auto_691144 ?auto_691146 ) ) ( not ( = ?auto_691144 ?auto_691147 ) ) ( not ( = ?auto_691144 ?auto_691148 ) ) ( not ( = ?auto_691144 ?auto_691149 ) ) ( not ( = ?auto_691144 ?auto_691150 ) ) ( not ( = ?auto_691145 ?auto_691146 ) ) ( not ( = ?auto_691145 ?auto_691147 ) ) ( not ( = ?auto_691145 ?auto_691148 ) ) ( not ( = ?auto_691145 ?auto_691149 ) ) ( not ( = ?auto_691145 ?auto_691150 ) ) ( not ( = ?auto_691146 ?auto_691147 ) ) ( not ( = ?auto_691146 ?auto_691148 ) ) ( not ( = ?auto_691146 ?auto_691149 ) ) ( not ( = ?auto_691146 ?auto_691150 ) ) ( not ( = ?auto_691147 ?auto_691148 ) ) ( not ( = ?auto_691147 ?auto_691149 ) ) ( not ( = ?auto_691147 ?auto_691150 ) ) ( not ( = ?auto_691148 ?auto_691149 ) ) ( not ( = ?auto_691148 ?auto_691150 ) ) ( not ( = ?auto_691149 ?auto_691150 ) ) ( ON ?auto_691148 ?auto_691149 ) ( ON ?auto_691147 ?auto_691148 ) ( ON ?auto_691146 ?auto_691147 ) ( CLEAR ?auto_691144 ) ( ON ?auto_691145 ?auto_691146 ) ( CLEAR ?auto_691145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_691136 ?auto_691137 ?auto_691138 ?auto_691139 ?auto_691140 ?auto_691141 ?auto_691142 ?auto_691143 ?auto_691144 ?auto_691145 )
      ( MAKE-14PILE ?auto_691136 ?auto_691137 ?auto_691138 ?auto_691139 ?auto_691140 ?auto_691141 ?auto_691142 ?auto_691143 ?auto_691144 ?auto_691145 ?auto_691146 ?auto_691147 ?auto_691148 ?auto_691149 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_691194 - BLOCK
      ?auto_691195 - BLOCK
      ?auto_691196 - BLOCK
      ?auto_691197 - BLOCK
      ?auto_691198 - BLOCK
      ?auto_691199 - BLOCK
      ?auto_691200 - BLOCK
      ?auto_691201 - BLOCK
      ?auto_691202 - BLOCK
      ?auto_691203 - BLOCK
      ?auto_691204 - BLOCK
      ?auto_691205 - BLOCK
      ?auto_691206 - BLOCK
      ?auto_691207 - BLOCK
    )
    :vars
    (
      ?auto_691208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691207 ?auto_691208 ) ( ON-TABLE ?auto_691194 ) ( ON ?auto_691195 ?auto_691194 ) ( ON ?auto_691196 ?auto_691195 ) ( ON ?auto_691197 ?auto_691196 ) ( ON ?auto_691198 ?auto_691197 ) ( ON ?auto_691199 ?auto_691198 ) ( ON ?auto_691200 ?auto_691199 ) ( ON ?auto_691201 ?auto_691200 ) ( not ( = ?auto_691194 ?auto_691195 ) ) ( not ( = ?auto_691194 ?auto_691196 ) ) ( not ( = ?auto_691194 ?auto_691197 ) ) ( not ( = ?auto_691194 ?auto_691198 ) ) ( not ( = ?auto_691194 ?auto_691199 ) ) ( not ( = ?auto_691194 ?auto_691200 ) ) ( not ( = ?auto_691194 ?auto_691201 ) ) ( not ( = ?auto_691194 ?auto_691202 ) ) ( not ( = ?auto_691194 ?auto_691203 ) ) ( not ( = ?auto_691194 ?auto_691204 ) ) ( not ( = ?auto_691194 ?auto_691205 ) ) ( not ( = ?auto_691194 ?auto_691206 ) ) ( not ( = ?auto_691194 ?auto_691207 ) ) ( not ( = ?auto_691194 ?auto_691208 ) ) ( not ( = ?auto_691195 ?auto_691196 ) ) ( not ( = ?auto_691195 ?auto_691197 ) ) ( not ( = ?auto_691195 ?auto_691198 ) ) ( not ( = ?auto_691195 ?auto_691199 ) ) ( not ( = ?auto_691195 ?auto_691200 ) ) ( not ( = ?auto_691195 ?auto_691201 ) ) ( not ( = ?auto_691195 ?auto_691202 ) ) ( not ( = ?auto_691195 ?auto_691203 ) ) ( not ( = ?auto_691195 ?auto_691204 ) ) ( not ( = ?auto_691195 ?auto_691205 ) ) ( not ( = ?auto_691195 ?auto_691206 ) ) ( not ( = ?auto_691195 ?auto_691207 ) ) ( not ( = ?auto_691195 ?auto_691208 ) ) ( not ( = ?auto_691196 ?auto_691197 ) ) ( not ( = ?auto_691196 ?auto_691198 ) ) ( not ( = ?auto_691196 ?auto_691199 ) ) ( not ( = ?auto_691196 ?auto_691200 ) ) ( not ( = ?auto_691196 ?auto_691201 ) ) ( not ( = ?auto_691196 ?auto_691202 ) ) ( not ( = ?auto_691196 ?auto_691203 ) ) ( not ( = ?auto_691196 ?auto_691204 ) ) ( not ( = ?auto_691196 ?auto_691205 ) ) ( not ( = ?auto_691196 ?auto_691206 ) ) ( not ( = ?auto_691196 ?auto_691207 ) ) ( not ( = ?auto_691196 ?auto_691208 ) ) ( not ( = ?auto_691197 ?auto_691198 ) ) ( not ( = ?auto_691197 ?auto_691199 ) ) ( not ( = ?auto_691197 ?auto_691200 ) ) ( not ( = ?auto_691197 ?auto_691201 ) ) ( not ( = ?auto_691197 ?auto_691202 ) ) ( not ( = ?auto_691197 ?auto_691203 ) ) ( not ( = ?auto_691197 ?auto_691204 ) ) ( not ( = ?auto_691197 ?auto_691205 ) ) ( not ( = ?auto_691197 ?auto_691206 ) ) ( not ( = ?auto_691197 ?auto_691207 ) ) ( not ( = ?auto_691197 ?auto_691208 ) ) ( not ( = ?auto_691198 ?auto_691199 ) ) ( not ( = ?auto_691198 ?auto_691200 ) ) ( not ( = ?auto_691198 ?auto_691201 ) ) ( not ( = ?auto_691198 ?auto_691202 ) ) ( not ( = ?auto_691198 ?auto_691203 ) ) ( not ( = ?auto_691198 ?auto_691204 ) ) ( not ( = ?auto_691198 ?auto_691205 ) ) ( not ( = ?auto_691198 ?auto_691206 ) ) ( not ( = ?auto_691198 ?auto_691207 ) ) ( not ( = ?auto_691198 ?auto_691208 ) ) ( not ( = ?auto_691199 ?auto_691200 ) ) ( not ( = ?auto_691199 ?auto_691201 ) ) ( not ( = ?auto_691199 ?auto_691202 ) ) ( not ( = ?auto_691199 ?auto_691203 ) ) ( not ( = ?auto_691199 ?auto_691204 ) ) ( not ( = ?auto_691199 ?auto_691205 ) ) ( not ( = ?auto_691199 ?auto_691206 ) ) ( not ( = ?auto_691199 ?auto_691207 ) ) ( not ( = ?auto_691199 ?auto_691208 ) ) ( not ( = ?auto_691200 ?auto_691201 ) ) ( not ( = ?auto_691200 ?auto_691202 ) ) ( not ( = ?auto_691200 ?auto_691203 ) ) ( not ( = ?auto_691200 ?auto_691204 ) ) ( not ( = ?auto_691200 ?auto_691205 ) ) ( not ( = ?auto_691200 ?auto_691206 ) ) ( not ( = ?auto_691200 ?auto_691207 ) ) ( not ( = ?auto_691200 ?auto_691208 ) ) ( not ( = ?auto_691201 ?auto_691202 ) ) ( not ( = ?auto_691201 ?auto_691203 ) ) ( not ( = ?auto_691201 ?auto_691204 ) ) ( not ( = ?auto_691201 ?auto_691205 ) ) ( not ( = ?auto_691201 ?auto_691206 ) ) ( not ( = ?auto_691201 ?auto_691207 ) ) ( not ( = ?auto_691201 ?auto_691208 ) ) ( not ( = ?auto_691202 ?auto_691203 ) ) ( not ( = ?auto_691202 ?auto_691204 ) ) ( not ( = ?auto_691202 ?auto_691205 ) ) ( not ( = ?auto_691202 ?auto_691206 ) ) ( not ( = ?auto_691202 ?auto_691207 ) ) ( not ( = ?auto_691202 ?auto_691208 ) ) ( not ( = ?auto_691203 ?auto_691204 ) ) ( not ( = ?auto_691203 ?auto_691205 ) ) ( not ( = ?auto_691203 ?auto_691206 ) ) ( not ( = ?auto_691203 ?auto_691207 ) ) ( not ( = ?auto_691203 ?auto_691208 ) ) ( not ( = ?auto_691204 ?auto_691205 ) ) ( not ( = ?auto_691204 ?auto_691206 ) ) ( not ( = ?auto_691204 ?auto_691207 ) ) ( not ( = ?auto_691204 ?auto_691208 ) ) ( not ( = ?auto_691205 ?auto_691206 ) ) ( not ( = ?auto_691205 ?auto_691207 ) ) ( not ( = ?auto_691205 ?auto_691208 ) ) ( not ( = ?auto_691206 ?auto_691207 ) ) ( not ( = ?auto_691206 ?auto_691208 ) ) ( not ( = ?auto_691207 ?auto_691208 ) ) ( ON ?auto_691206 ?auto_691207 ) ( ON ?auto_691205 ?auto_691206 ) ( ON ?auto_691204 ?auto_691205 ) ( ON ?auto_691203 ?auto_691204 ) ( CLEAR ?auto_691201 ) ( ON ?auto_691202 ?auto_691203 ) ( CLEAR ?auto_691202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_691194 ?auto_691195 ?auto_691196 ?auto_691197 ?auto_691198 ?auto_691199 ?auto_691200 ?auto_691201 ?auto_691202 )
      ( MAKE-14PILE ?auto_691194 ?auto_691195 ?auto_691196 ?auto_691197 ?auto_691198 ?auto_691199 ?auto_691200 ?auto_691201 ?auto_691202 ?auto_691203 ?auto_691204 ?auto_691205 ?auto_691206 ?auto_691207 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_691252 - BLOCK
      ?auto_691253 - BLOCK
      ?auto_691254 - BLOCK
      ?auto_691255 - BLOCK
      ?auto_691256 - BLOCK
      ?auto_691257 - BLOCK
      ?auto_691258 - BLOCK
      ?auto_691259 - BLOCK
      ?auto_691260 - BLOCK
      ?auto_691261 - BLOCK
      ?auto_691262 - BLOCK
      ?auto_691263 - BLOCK
      ?auto_691264 - BLOCK
      ?auto_691265 - BLOCK
    )
    :vars
    (
      ?auto_691266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691265 ?auto_691266 ) ( ON-TABLE ?auto_691252 ) ( ON ?auto_691253 ?auto_691252 ) ( ON ?auto_691254 ?auto_691253 ) ( ON ?auto_691255 ?auto_691254 ) ( ON ?auto_691256 ?auto_691255 ) ( ON ?auto_691257 ?auto_691256 ) ( ON ?auto_691258 ?auto_691257 ) ( not ( = ?auto_691252 ?auto_691253 ) ) ( not ( = ?auto_691252 ?auto_691254 ) ) ( not ( = ?auto_691252 ?auto_691255 ) ) ( not ( = ?auto_691252 ?auto_691256 ) ) ( not ( = ?auto_691252 ?auto_691257 ) ) ( not ( = ?auto_691252 ?auto_691258 ) ) ( not ( = ?auto_691252 ?auto_691259 ) ) ( not ( = ?auto_691252 ?auto_691260 ) ) ( not ( = ?auto_691252 ?auto_691261 ) ) ( not ( = ?auto_691252 ?auto_691262 ) ) ( not ( = ?auto_691252 ?auto_691263 ) ) ( not ( = ?auto_691252 ?auto_691264 ) ) ( not ( = ?auto_691252 ?auto_691265 ) ) ( not ( = ?auto_691252 ?auto_691266 ) ) ( not ( = ?auto_691253 ?auto_691254 ) ) ( not ( = ?auto_691253 ?auto_691255 ) ) ( not ( = ?auto_691253 ?auto_691256 ) ) ( not ( = ?auto_691253 ?auto_691257 ) ) ( not ( = ?auto_691253 ?auto_691258 ) ) ( not ( = ?auto_691253 ?auto_691259 ) ) ( not ( = ?auto_691253 ?auto_691260 ) ) ( not ( = ?auto_691253 ?auto_691261 ) ) ( not ( = ?auto_691253 ?auto_691262 ) ) ( not ( = ?auto_691253 ?auto_691263 ) ) ( not ( = ?auto_691253 ?auto_691264 ) ) ( not ( = ?auto_691253 ?auto_691265 ) ) ( not ( = ?auto_691253 ?auto_691266 ) ) ( not ( = ?auto_691254 ?auto_691255 ) ) ( not ( = ?auto_691254 ?auto_691256 ) ) ( not ( = ?auto_691254 ?auto_691257 ) ) ( not ( = ?auto_691254 ?auto_691258 ) ) ( not ( = ?auto_691254 ?auto_691259 ) ) ( not ( = ?auto_691254 ?auto_691260 ) ) ( not ( = ?auto_691254 ?auto_691261 ) ) ( not ( = ?auto_691254 ?auto_691262 ) ) ( not ( = ?auto_691254 ?auto_691263 ) ) ( not ( = ?auto_691254 ?auto_691264 ) ) ( not ( = ?auto_691254 ?auto_691265 ) ) ( not ( = ?auto_691254 ?auto_691266 ) ) ( not ( = ?auto_691255 ?auto_691256 ) ) ( not ( = ?auto_691255 ?auto_691257 ) ) ( not ( = ?auto_691255 ?auto_691258 ) ) ( not ( = ?auto_691255 ?auto_691259 ) ) ( not ( = ?auto_691255 ?auto_691260 ) ) ( not ( = ?auto_691255 ?auto_691261 ) ) ( not ( = ?auto_691255 ?auto_691262 ) ) ( not ( = ?auto_691255 ?auto_691263 ) ) ( not ( = ?auto_691255 ?auto_691264 ) ) ( not ( = ?auto_691255 ?auto_691265 ) ) ( not ( = ?auto_691255 ?auto_691266 ) ) ( not ( = ?auto_691256 ?auto_691257 ) ) ( not ( = ?auto_691256 ?auto_691258 ) ) ( not ( = ?auto_691256 ?auto_691259 ) ) ( not ( = ?auto_691256 ?auto_691260 ) ) ( not ( = ?auto_691256 ?auto_691261 ) ) ( not ( = ?auto_691256 ?auto_691262 ) ) ( not ( = ?auto_691256 ?auto_691263 ) ) ( not ( = ?auto_691256 ?auto_691264 ) ) ( not ( = ?auto_691256 ?auto_691265 ) ) ( not ( = ?auto_691256 ?auto_691266 ) ) ( not ( = ?auto_691257 ?auto_691258 ) ) ( not ( = ?auto_691257 ?auto_691259 ) ) ( not ( = ?auto_691257 ?auto_691260 ) ) ( not ( = ?auto_691257 ?auto_691261 ) ) ( not ( = ?auto_691257 ?auto_691262 ) ) ( not ( = ?auto_691257 ?auto_691263 ) ) ( not ( = ?auto_691257 ?auto_691264 ) ) ( not ( = ?auto_691257 ?auto_691265 ) ) ( not ( = ?auto_691257 ?auto_691266 ) ) ( not ( = ?auto_691258 ?auto_691259 ) ) ( not ( = ?auto_691258 ?auto_691260 ) ) ( not ( = ?auto_691258 ?auto_691261 ) ) ( not ( = ?auto_691258 ?auto_691262 ) ) ( not ( = ?auto_691258 ?auto_691263 ) ) ( not ( = ?auto_691258 ?auto_691264 ) ) ( not ( = ?auto_691258 ?auto_691265 ) ) ( not ( = ?auto_691258 ?auto_691266 ) ) ( not ( = ?auto_691259 ?auto_691260 ) ) ( not ( = ?auto_691259 ?auto_691261 ) ) ( not ( = ?auto_691259 ?auto_691262 ) ) ( not ( = ?auto_691259 ?auto_691263 ) ) ( not ( = ?auto_691259 ?auto_691264 ) ) ( not ( = ?auto_691259 ?auto_691265 ) ) ( not ( = ?auto_691259 ?auto_691266 ) ) ( not ( = ?auto_691260 ?auto_691261 ) ) ( not ( = ?auto_691260 ?auto_691262 ) ) ( not ( = ?auto_691260 ?auto_691263 ) ) ( not ( = ?auto_691260 ?auto_691264 ) ) ( not ( = ?auto_691260 ?auto_691265 ) ) ( not ( = ?auto_691260 ?auto_691266 ) ) ( not ( = ?auto_691261 ?auto_691262 ) ) ( not ( = ?auto_691261 ?auto_691263 ) ) ( not ( = ?auto_691261 ?auto_691264 ) ) ( not ( = ?auto_691261 ?auto_691265 ) ) ( not ( = ?auto_691261 ?auto_691266 ) ) ( not ( = ?auto_691262 ?auto_691263 ) ) ( not ( = ?auto_691262 ?auto_691264 ) ) ( not ( = ?auto_691262 ?auto_691265 ) ) ( not ( = ?auto_691262 ?auto_691266 ) ) ( not ( = ?auto_691263 ?auto_691264 ) ) ( not ( = ?auto_691263 ?auto_691265 ) ) ( not ( = ?auto_691263 ?auto_691266 ) ) ( not ( = ?auto_691264 ?auto_691265 ) ) ( not ( = ?auto_691264 ?auto_691266 ) ) ( not ( = ?auto_691265 ?auto_691266 ) ) ( ON ?auto_691264 ?auto_691265 ) ( ON ?auto_691263 ?auto_691264 ) ( ON ?auto_691262 ?auto_691263 ) ( ON ?auto_691261 ?auto_691262 ) ( ON ?auto_691260 ?auto_691261 ) ( CLEAR ?auto_691258 ) ( ON ?auto_691259 ?auto_691260 ) ( CLEAR ?auto_691259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_691252 ?auto_691253 ?auto_691254 ?auto_691255 ?auto_691256 ?auto_691257 ?auto_691258 ?auto_691259 )
      ( MAKE-14PILE ?auto_691252 ?auto_691253 ?auto_691254 ?auto_691255 ?auto_691256 ?auto_691257 ?auto_691258 ?auto_691259 ?auto_691260 ?auto_691261 ?auto_691262 ?auto_691263 ?auto_691264 ?auto_691265 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_691310 - BLOCK
      ?auto_691311 - BLOCK
      ?auto_691312 - BLOCK
      ?auto_691313 - BLOCK
      ?auto_691314 - BLOCK
      ?auto_691315 - BLOCK
      ?auto_691316 - BLOCK
      ?auto_691317 - BLOCK
      ?auto_691318 - BLOCK
      ?auto_691319 - BLOCK
      ?auto_691320 - BLOCK
      ?auto_691321 - BLOCK
      ?auto_691322 - BLOCK
      ?auto_691323 - BLOCK
    )
    :vars
    (
      ?auto_691324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691323 ?auto_691324 ) ( ON-TABLE ?auto_691310 ) ( ON ?auto_691311 ?auto_691310 ) ( ON ?auto_691312 ?auto_691311 ) ( ON ?auto_691313 ?auto_691312 ) ( ON ?auto_691314 ?auto_691313 ) ( ON ?auto_691315 ?auto_691314 ) ( not ( = ?auto_691310 ?auto_691311 ) ) ( not ( = ?auto_691310 ?auto_691312 ) ) ( not ( = ?auto_691310 ?auto_691313 ) ) ( not ( = ?auto_691310 ?auto_691314 ) ) ( not ( = ?auto_691310 ?auto_691315 ) ) ( not ( = ?auto_691310 ?auto_691316 ) ) ( not ( = ?auto_691310 ?auto_691317 ) ) ( not ( = ?auto_691310 ?auto_691318 ) ) ( not ( = ?auto_691310 ?auto_691319 ) ) ( not ( = ?auto_691310 ?auto_691320 ) ) ( not ( = ?auto_691310 ?auto_691321 ) ) ( not ( = ?auto_691310 ?auto_691322 ) ) ( not ( = ?auto_691310 ?auto_691323 ) ) ( not ( = ?auto_691310 ?auto_691324 ) ) ( not ( = ?auto_691311 ?auto_691312 ) ) ( not ( = ?auto_691311 ?auto_691313 ) ) ( not ( = ?auto_691311 ?auto_691314 ) ) ( not ( = ?auto_691311 ?auto_691315 ) ) ( not ( = ?auto_691311 ?auto_691316 ) ) ( not ( = ?auto_691311 ?auto_691317 ) ) ( not ( = ?auto_691311 ?auto_691318 ) ) ( not ( = ?auto_691311 ?auto_691319 ) ) ( not ( = ?auto_691311 ?auto_691320 ) ) ( not ( = ?auto_691311 ?auto_691321 ) ) ( not ( = ?auto_691311 ?auto_691322 ) ) ( not ( = ?auto_691311 ?auto_691323 ) ) ( not ( = ?auto_691311 ?auto_691324 ) ) ( not ( = ?auto_691312 ?auto_691313 ) ) ( not ( = ?auto_691312 ?auto_691314 ) ) ( not ( = ?auto_691312 ?auto_691315 ) ) ( not ( = ?auto_691312 ?auto_691316 ) ) ( not ( = ?auto_691312 ?auto_691317 ) ) ( not ( = ?auto_691312 ?auto_691318 ) ) ( not ( = ?auto_691312 ?auto_691319 ) ) ( not ( = ?auto_691312 ?auto_691320 ) ) ( not ( = ?auto_691312 ?auto_691321 ) ) ( not ( = ?auto_691312 ?auto_691322 ) ) ( not ( = ?auto_691312 ?auto_691323 ) ) ( not ( = ?auto_691312 ?auto_691324 ) ) ( not ( = ?auto_691313 ?auto_691314 ) ) ( not ( = ?auto_691313 ?auto_691315 ) ) ( not ( = ?auto_691313 ?auto_691316 ) ) ( not ( = ?auto_691313 ?auto_691317 ) ) ( not ( = ?auto_691313 ?auto_691318 ) ) ( not ( = ?auto_691313 ?auto_691319 ) ) ( not ( = ?auto_691313 ?auto_691320 ) ) ( not ( = ?auto_691313 ?auto_691321 ) ) ( not ( = ?auto_691313 ?auto_691322 ) ) ( not ( = ?auto_691313 ?auto_691323 ) ) ( not ( = ?auto_691313 ?auto_691324 ) ) ( not ( = ?auto_691314 ?auto_691315 ) ) ( not ( = ?auto_691314 ?auto_691316 ) ) ( not ( = ?auto_691314 ?auto_691317 ) ) ( not ( = ?auto_691314 ?auto_691318 ) ) ( not ( = ?auto_691314 ?auto_691319 ) ) ( not ( = ?auto_691314 ?auto_691320 ) ) ( not ( = ?auto_691314 ?auto_691321 ) ) ( not ( = ?auto_691314 ?auto_691322 ) ) ( not ( = ?auto_691314 ?auto_691323 ) ) ( not ( = ?auto_691314 ?auto_691324 ) ) ( not ( = ?auto_691315 ?auto_691316 ) ) ( not ( = ?auto_691315 ?auto_691317 ) ) ( not ( = ?auto_691315 ?auto_691318 ) ) ( not ( = ?auto_691315 ?auto_691319 ) ) ( not ( = ?auto_691315 ?auto_691320 ) ) ( not ( = ?auto_691315 ?auto_691321 ) ) ( not ( = ?auto_691315 ?auto_691322 ) ) ( not ( = ?auto_691315 ?auto_691323 ) ) ( not ( = ?auto_691315 ?auto_691324 ) ) ( not ( = ?auto_691316 ?auto_691317 ) ) ( not ( = ?auto_691316 ?auto_691318 ) ) ( not ( = ?auto_691316 ?auto_691319 ) ) ( not ( = ?auto_691316 ?auto_691320 ) ) ( not ( = ?auto_691316 ?auto_691321 ) ) ( not ( = ?auto_691316 ?auto_691322 ) ) ( not ( = ?auto_691316 ?auto_691323 ) ) ( not ( = ?auto_691316 ?auto_691324 ) ) ( not ( = ?auto_691317 ?auto_691318 ) ) ( not ( = ?auto_691317 ?auto_691319 ) ) ( not ( = ?auto_691317 ?auto_691320 ) ) ( not ( = ?auto_691317 ?auto_691321 ) ) ( not ( = ?auto_691317 ?auto_691322 ) ) ( not ( = ?auto_691317 ?auto_691323 ) ) ( not ( = ?auto_691317 ?auto_691324 ) ) ( not ( = ?auto_691318 ?auto_691319 ) ) ( not ( = ?auto_691318 ?auto_691320 ) ) ( not ( = ?auto_691318 ?auto_691321 ) ) ( not ( = ?auto_691318 ?auto_691322 ) ) ( not ( = ?auto_691318 ?auto_691323 ) ) ( not ( = ?auto_691318 ?auto_691324 ) ) ( not ( = ?auto_691319 ?auto_691320 ) ) ( not ( = ?auto_691319 ?auto_691321 ) ) ( not ( = ?auto_691319 ?auto_691322 ) ) ( not ( = ?auto_691319 ?auto_691323 ) ) ( not ( = ?auto_691319 ?auto_691324 ) ) ( not ( = ?auto_691320 ?auto_691321 ) ) ( not ( = ?auto_691320 ?auto_691322 ) ) ( not ( = ?auto_691320 ?auto_691323 ) ) ( not ( = ?auto_691320 ?auto_691324 ) ) ( not ( = ?auto_691321 ?auto_691322 ) ) ( not ( = ?auto_691321 ?auto_691323 ) ) ( not ( = ?auto_691321 ?auto_691324 ) ) ( not ( = ?auto_691322 ?auto_691323 ) ) ( not ( = ?auto_691322 ?auto_691324 ) ) ( not ( = ?auto_691323 ?auto_691324 ) ) ( ON ?auto_691322 ?auto_691323 ) ( ON ?auto_691321 ?auto_691322 ) ( ON ?auto_691320 ?auto_691321 ) ( ON ?auto_691319 ?auto_691320 ) ( ON ?auto_691318 ?auto_691319 ) ( ON ?auto_691317 ?auto_691318 ) ( CLEAR ?auto_691315 ) ( ON ?auto_691316 ?auto_691317 ) ( CLEAR ?auto_691316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_691310 ?auto_691311 ?auto_691312 ?auto_691313 ?auto_691314 ?auto_691315 ?auto_691316 )
      ( MAKE-14PILE ?auto_691310 ?auto_691311 ?auto_691312 ?auto_691313 ?auto_691314 ?auto_691315 ?auto_691316 ?auto_691317 ?auto_691318 ?auto_691319 ?auto_691320 ?auto_691321 ?auto_691322 ?auto_691323 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_691368 - BLOCK
      ?auto_691369 - BLOCK
      ?auto_691370 - BLOCK
      ?auto_691371 - BLOCK
      ?auto_691372 - BLOCK
      ?auto_691373 - BLOCK
      ?auto_691374 - BLOCK
      ?auto_691375 - BLOCK
      ?auto_691376 - BLOCK
      ?auto_691377 - BLOCK
      ?auto_691378 - BLOCK
      ?auto_691379 - BLOCK
      ?auto_691380 - BLOCK
      ?auto_691381 - BLOCK
    )
    :vars
    (
      ?auto_691382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691381 ?auto_691382 ) ( ON-TABLE ?auto_691368 ) ( ON ?auto_691369 ?auto_691368 ) ( ON ?auto_691370 ?auto_691369 ) ( ON ?auto_691371 ?auto_691370 ) ( ON ?auto_691372 ?auto_691371 ) ( not ( = ?auto_691368 ?auto_691369 ) ) ( not ( = ?auto_691368 ?auto_691370 ) ) ( not ( = ?auto_691368 ?auto_691371 ) ) ( not ( = ?auto_691368 ?auto_691372 ) ) ( not ( = ?auto_691368 ?auto_691373 ) ) ( not ( = ?auto_691368 ?auto_691374 ) ) ( not ( = ?auto_691368 ?auto_691375 ) ) ( not ( = ?auto_691368 ?auto_691376 ) ) ( not ( = ?auto_691368 ?auto_691377 ) ) ( not ( = ?auto_691368 ?auto_691378 ) ) ( not ( = ?auto_691368 ?auto_691379 ) ) ( not ( = ?auto_691368 ?auto_691380 ) ) ( not ( = ?auto_691368 ?auto_691381 ) ) ( not ( = ?auto_691368 ?auto_691382 ) ) ( not ( = ?auto_691369 ?auto_691370 ) ) ( not ( = ?auto_691369 ?auto_691371 ) ) ( not ( = ?auto_691369 ?auto_691372 ) ) ( not ( = ?auto_691369 ?auto_691373 ) ) ( not ( = ?auto_691369 ?auto_691374 ) ) ( not ( = ?auto_691369 ?auto_691375 ) ) ( not ( = ?auto_691369 ?auto_691376 ) ) ( not ( = ?auto_691369 ?auto_691377 ) ) ( not ( = ?auto_691369 ?auto_691378 ) ) ( not ( = ?auto_691369 ?auto_691379 ) ) ( not ( = ?auto_691369 ?auto_691380 ) ) ( not ( = ?auto_691369 ?auto_691381 ) ) ( not ( = ?auto_691369 ?auto_691382 ) ) ( not ( = ?auto_691370 ?auto_691371 ) ) ( not ( = ?auto_691370 ?auto_691372 ) ) ( not ( = ?auto_691370 ?auto_691373 ) ) ( not ( = ?auto_691370 ?auto_691374 ) ) ( not ( = ?auto_691370 ?auto_691375 ) ) ( not ( = ?auto_691370 ?auto_691376 ) ) ( not ( = ?auto_691370 ?auto_691377 ) ) ( not ( = ?auto_691370 ?auto_691378 ) ) ( not ( = ?auto_691370 ?auto_691379 ) ) ( not ( = ?auto_691370 ?auto_691380 ) ) ( not ( = ?auto_691370 ?auto_691381 ) ) ( not ( = ?auto_691370 ?auto_691382 ) ) ( not ( = ?auto_691371 ?auto_691372 ) ) ( not ( = ?auto_691371 ?auto_691373 ) ) ( not ( = ?auto_691371 ?auto_691374 ) ) ( not ( = ?auto_691371 ?auto_691375 ) ) ( not ( = ?auto_691371 ?auto_691376 ) ) ( not ( = ?auto_691371 ?auto_691377 ) ) ( not ( = ?auto_691371 ?auto_691378 ) ) ( not ( = ?auto_691371 ?auto_691379 ) ) ( not ( = ?auto_691371 ?auto_691380 ) ) ( not ( = ?auto_691371 ?auto_691381 ) ) ( not ( = ?auto_691371 ?auto_691382 ) ) ( not ( = ?auto_691372 ?auto_691373 ) ) ( not ( = ?auto_691372 ?auto_691374 ) ) ( not ( = ?auto_691372 ?auto_691375 ) ) ( not ( = ?auto_691372 ?auto_691376 ) ) ( not ( = ?auto_691372 ?auto_691377 ) ) ( not ( = ?auto_691372 ?auto_691378 ) ) ( not ( = ?auto_691372 ?auto_691379 ) ) ( not ( = ?auto_691372 ?auto_691380 ) ) ( not ( = ?auto_691372 ?auto_691381 ) ) ( not ( = ?auto_691372 ?auto_691382 ) ) ( not ( = ?auto_691373 ?auto_691374 ) ) ( not ( = ?auto_691373 ?auto_691375 ) ) ( not ( = ?auto_691373 ?auto_691376 ) ) ( not ( = ?auto_691373 ?auto_691377 ) ) ( not ( = ?auto_691373 ?auto_691378 ) ) ( not ( = ?auto_691373 ?auto_691379 ) ) ( not ( = ?auto_691373 ?auto_691380 ) ) ( not ( = ?auto_691373 ?auto_691381 ) ) ( not ( = ?auto_691373 ?auto_691382 ) ) ( not ( = ?auto_691374 ?auto_691375 ) ) ( not ( = ?auto_691374 ?auto_691376 ) ) ( not ( = ?auto_691374 ?auto_691377 ) ) ( not ( = ?auto_691374 ?auto_691378 ) ) ( not ( = ?auto_691374 ?auto_691379 ) ) ( not ( = ?auto_691374 ?auto_691380 ) ) ( not ( = ?auto_691374 ?auto_691381 ) ) ( not ( = ?auto_691374 ?auto_691382 ) ) ( not ( = ?auto_691375 ?auto_691376 ) ) ( not ( = ?auto_691375 ?auto_691377 ) ) ( not ( = ?auto_691375 ?auto_691378 ) ) ( not ( = ?auto_691375 ?auto_691379 ) ) ( not ( = ?auto_691375 ?auto_691380 ) ) ( not ( = ?auto_691375 ?auto_691381 ) ) ( not ( = ?auto_691375 ?auto_691382 ) ) ( not ( = ?auto_691376 ?auto_691377 ) ) ( not ( = ?auto_691376 ?auto_691378 ) ) ( not ( = ?auto_691376 ?auto_691379 ) ) ( not ( = ?auto_691376 ?auto_691380 ) ) ( not ( = ?auto_691376 ?auto_691381 ) ) ( not ( = ?auto_691376 ?auto_691382 ) ) ( not ( = ?auto_691377 ?auto_691378 ) ) ( not ( = ?auto_691377 ?auto_691379 ) ) ( not ( = ?auto_691377 ?auto_691380 ) ) ( not ( = ?auto_691377 ?auto_691381 ) ) ( not ( = ?auto_691377 ?auto_691382 ) ) ( not ( = ?auto_691378 ?auto_691379 ) ) ( not ( = ?auto_691378 ?auto_691380 ) ) ( not ( = ?auto_691378 ?auto_691381 ) ) ( not ( = ?auto_691378 ?auto_691382 ) ) ( not ( = ?auto_691379 ?auto_691380 ) ) ( not ( = ?auto_691379 ?auto_691381 ) ) ( not ( = ?auto_691379 ?auto_691382 ) ) ( not ( = ?auto_691380 ?auto_691381 ) ) ( not ( = ?auto_691380 ?auto_691382 ) ) ( not ( = ?auto_691381 ?auto_691382 ) ) ( ON ?auto_691380 ?auto_691381 ) ( ON ?auto_691379 ?auto_691380 ) ( ON ?auto_691378 ?auto_691379 ) ( ON ?auto_691377 ?auto_691378 ) ( ON ?auto_691376 ?auto_691377 ) ( ON ?auto_691375 ?auto_691376 ) ( ON ?auto_691374 ?auto_691375 ) ( CLEAR ?auto_691372 ) ( ON ?auto_691373 ?auto_691374 ) ( CLEAR ?auto_691373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_691368 ?auto_691369 ?auto_691370 ?auto_691371 ?auto_691372 ?auto_691373 )
      ( MAKE-14PILE ?auto_691368 ?auto_691369 ?auto_691370 ?auto_691371 ?auto_691372 ?auto_691373 ?auto_691374 ?auto_691375 ?auto_691376 ?auto_691377 ?auto_691378 ?auto_691379 ?auto_691380 ?auto_691381 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_691426 - BLOCK
      ?auto_691427 - BLOCK
      ?auto_691428 - BLOCK
      ?auto_691429 - BLOCK
      ?auto_691430 - BLOCK
      ?auto_691431 - BLOCK
      ?auto_691432 - BLOCK
      ?auto_691433 - BLOCK
      ?auto_691434 - BLOCK
      ?auto_691435 - BLOCK
      ?auto_691436 - BLOCK
      ?auto_691437 - BLOCK
      ?auto_691438 - BLOCK
      ?auto_691439 - BLOCK
    )
    :vars
    (
      ?auto_691440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691439 ?auto_691440 ) ( ON-TABLE ?auto_691426 ) ( ON ?auto_691427 ?auto_691426 ) ( ON ?auto_691428 ?auto_691427 ) ( ON ?auto_691429 ?auto_691428 ) ( not ( = ?auto_691426 ?auto_691427 ) ) ( not ( = ?auto_691426 ?auto_691428 ) ) ( not ( = ?auto_691426 ?auto_691429 ) ) ( not ( = ?auto_691426 ?auto_691430 ) ) ( not ( = ?auto_691426 ?auto_691431 ) ) ( not ( = ?auto_691426 ?auto_691432 ) ) ( not ( = ?auto_691426 ?auto_691433 ) ) ( not ( = ?auto_691426 ?auto_691434 ) ) ( not ( = ?auto_691426 ?auto_691435 ) ) ( not ( = ?auto_691426 ?auto_691436 ) ) ( not ( = ?auto_691426 ?auto_691437 ) ) ( not ( = ?auto_691426 ?auto_691438 ) ) ( not ( = ?auto_691426 ?auto_691439 ) ) ( not ( = ?auto_691426 ?auto_691440 ) ) ( not ( = ?auto_691427 ?auto_691428 ) ) ( not ( = ?auto_691427 ?auto_691429 ) ) ( not ( = ?auto_691427 ?auto_691430 ) ) ( not ( = ?auto_691427 ?auto_691431 ) ) ( not ( = ?auto_691427 ?auto_691432 ) ) ( not ( = ?auto_691427 ?auto_691433 ) ) ( not ( = ?auto_691427 ?auto_691434 ) ) ( not ( = ?auto_691427 ?auto_691435 ) ) ( not ( = ?auto_691427 ?auto_691436 ) ) ( not ( = ?auto_691427 ?auto_691437 ) ) ( not ( = ?auto_691427 ?auto_691438 ) ) ( not ( = ?auto_691427 ?auto_691439 ) ) ( not ( = ?auto_691427 ?auto_691440 ) ) ( not ( = ?auto_691428 ?auto_691429 ) ) ( not ( = ?auto_691428 ?auto_691430 ) ) ( not ( = ?auto_691428 ?auto_691431 ) ) ( not ( = ?auto_691428 ?auto_691432 ) ) ( not ( = ?auto_691428 ?auto_691433 ) ) ( not ( = ?auto_691428 ?auto_691434 ) ) ( not ( = ?auto_691428 ?auto_691435 ) ) ( not ( = ?auto_691428 ?auto_691436 ) ) ( not ( = ?auto_691428 ?auto_691437 ) ) ( not ( = ?auto_691428 ?auto_691438 ) ) ( not ( = ?auto_691428 ?auto_691439 ) ) ( not ( = ?auto_691428 ?auto_691440 ) ) ( not ( = ?auto_691429 ?auto_691430 ) ) ( not ( = ?auto_691429 ?auto_691431 ) ) ( not ( = ?auto_691429 ?auto_691432 ) ) ( not ( = ?auto_691429 ?auto_691433 ) ) ( not ( = ?auto_691429 ?auto_691434 ) ) ( not ( = ?auto_691429 ?auto_691435 ) ) ( not ( = ?auto_691429 ?auto_691436 ) ) ( not ( = ?auto_691429 ?auto_691437 ) ) ( not ( = ?auto_691429 ?auto_691438 ) ) ( not ( = ?auto_691429 ?auto_691439 ) ) ( not ( = ?auto_691429 ?auto_691440 ) ) ( not ( = ?auto_691430 ?auto_691431 ) ) ( not ( = ?auto_691430 ?auto_691432 ) ) ( not ( = ?auto_691430 ?auto_691433 ) ) ( not ( = ?auto_691430 ?auto_691434 ) ) ( not ( = ?auto_691430 ?auto_691435 ) ) ( not ( = ?auto_691430 ?auto_691436 ) ) ( not ( = ?auto_691430 ?auto_691437 ) ) ( not ( = ?auto_691430 ?auto_691438 ) ) ( not ( = ?auto_691430 ?auto_691439 ) ) ( not ( = ?auto_691430 ?auto_691440 ) ) ( not ( = ?auto_691431 ?auto_691432 ) ) ( not ( = ?auto_691431 ?auto_691433 ) ) ( not ( = ?auto_691431 ?auto_691434 ) ) ( not ( = ?auto_691431 ?auto_691435 ) ) ( not ( = ?auto_691431 ?auto_691436 ) ) ( not ( = ?auto_691431 ?auto_691437 ) ) ( not ( = ?auto_691431 ?auto_691438 ) ) ( not ( = ?auto_691431 ?auto_691439 ) ) ( not ( = ?auto_691431 ?auto_691440 ) ) ( not ( = ?auto_691432 ?auto_691433 ) ) ( not ( = ?auto_691432 ?auto_691434 ) ) ( not ( = ?auto_691432 ?auto_691435 ) ) ( not ( = ?auto_691432 ?auto_691436 ) ) ( not ( = ?auto_691432 ?auto_691437 ) ) ( not ( = ?auto_691432 ?auto_691438 ) ) ( not ( = ?auto_691432 ?auto_691439 ) ) ( not ( = ?auto_691432 ?auto_691440 ) ) ( not ( = ?auto_691433 ?auto_691434 ) ) ( not ( = ?auto_691433 ?auto_691435 ) ) ( not ( = ?auto_691433 ?auto_691436 ) ) ( not ( = ?auto_691433 ?auto_691437 ) ) ( not ( = ?auto_691433 ?auto_691438 ) ) ( not ( = ?auto_691433 ?auto_691439 ) ) ( not ( = ?auto_691433 ?auto_691440 ) ) ( not ( = ?auto_691434 ?auto_691435 ) ) ( not ( = ?auto_691434 ?auto_691436 ) ) ( not ( = ?auto_691434 ?auto_691437 ) ) ( not ( = ?auto_691434 ?auto_691438 ) ) ( not ( = ?auto_691434 ?auto_691439 ) ) ( not ( = ?auto_691434 ?auto_691440 ) ) ( not ( = ?auto_691435 ?auto_691436 ) ) ( not ( = ?auto_691435 ?auto_691437 ) ) ( not ( = ?auto_691435 ?auto_691438 ) ) ( not ( = ?auto_691435 ?auto_691439 ) ) ( not ( = ?auto_691435 ?auto_691440 ) ) ( not ( = ?auto_691436 ?auto_691437 ) ) ( not ( = ?auto_691436 ?auto_691438 ) ) ( not ( = ?auto_691436 ?auto_691439 ) ) ( not ( = ?auto_691436 ?auto_691440 ) ) ( not ( = ?auto_691437 ?auto_691438 ) ) ( not ( = ?auto_691437 ?auto_691439 ) ) ( not ( = ?auto_691437 ?auto_691440 ) ) ( not ( = ?auto_691438 ?auto_691439 ) ) ( not ( = ?auto_691438 ?auto_691440 ) ) ( not ( = ?auto_691439 ?auto_691440 ) ) ( ON ?auto_691438 ?auto_691439 ) ( ON ?auto_691437 ?auto_691438 ) ( ON ?auto_691436 ?auto_691437 ) ( ON ?auto_691435 ?auto_691436 ) ( ON ?auto_691434 ?auto_691435 ) ( ON ?auto_691433 ?auto_691434 ) ( ON ?auto_691432 ?auto_691433 ) ( ON ?auto_691431 ?auto_691432 ) ( CLEAR ?auto_691429 ) ( ON ?auto_691430 ?auto_691431 ) ( CLEAR ?auto_691430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_691426 ?auto_691427 ?auto_691428 ?auto_691429 ?auto_691430 )
      ( MAKE-14PILE ?auto_691426 ?auto_691427 ?auto_691428 ?auto_691429 ?auto_691430 ?auto_691431 ?auto_691432 ?auto_691433 ?auto_691434 ?auto_691435 ?auto_691436 ?auto_691437 ?auto_691438 ?auto_691439 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_691484 - BLOCK
      ?auto_691485 - BLOCK
      ?auto_691486 - BLOCK
      ?auto_691487 - BLOCK
      ?auto_691488 - BLOCK
      ?auto_691489 - BLOCK
      ?auto_691490 - BLOCK
      ?auto_691491 - BLOCK
      ?auto_691492 - BLOCK
      ?auto_691493 - BLOCK
      ?auto_691494 - BLOCK
      ?auto_691495 - BLOCK
      ?auto_691496 - BLOCK
      ?auto_691497 - BLOCK
    )
    :vars
    (
      ?auto_691498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691497 ?auto_691498 ) ( ON-TABLE ?auto_691484 ) ( ON ?auto_691485 ?auto_691484 ) ( ON ?auto_691486 ?auto_691485 ) ( not ( = ?auto_691484 ?auto_691485 ) ) ( not ( = ?auto_691484 ?auto_691486 ) ) ( not ( = ?auto_691484 ?auto_691487 ) ) ( not ( = ?auto_691484 ?auto_691488 ) ) ( not ( = ?auto_691484 ?auto_691489 ) ) ( not ( = ?auto_691484 ?auto_691490 ) ) ( not ( = ?auto_691484 ?auto_691491 ) ) ( not ( = ?auto_691484 ?auto_691492 ) ) ( not ( = ?auto_691484 ?auto_691493 ) ) ( not ( = ?auto_691484 ?auto_691494 ) ) ( not ( = ?auto_691484 ?auto_691495 ) ) ( not ( = ?auto_691484 ?auto_691496 ) ) ( not ( = ?auto_691484 ?auto_691497 ) ) ( not ( = ?auto_691484 ?auto_691498 ) ) ( not ( = ?auto_691485 ?auto_691486 ) ) ( not ( = ?auto_691485 ?auto_691487 ) ) ( not ( = ?auto_691485 ?auto_691488 ) ) ( not ( = ?auto_691485 ?auto_691489 ) ) ( not ( = ?auto_691485 ?auto_691490 ) ) ( not ( = ?auto_691485 ?auto_691491 ) ) ( not ( = ?auto_691485 ?auto_691492 ) ) ( not ( = ?auto_691485 ?auto_691493 ) ) ( not ( = ?auto_691485 ?auto_691494 ) ) ( not ( = ?auto_691485 ?auto_691495 ) ) ( not ( = ?auto_691485 ?auto_691496 ) ) ( not ( = ?auto_691485 ?auto_691497 ) ) ( not ( = ?auto_691485 ?auto_691498 ) ) ( not ( = ?auto_691486 ?auto_691487 ) ) ( not ( = ?auto_691486 ?auto_691488 ) ) ( not ( = ?auto_691486 ?auto_691489 ) ) ( not ( = ?auto_691486 ?auto_691490 ) ) ( not ( = ?auto_691486 ?auto_691491 ) ) ( not ( = ?auto_691486 ?auto_691492 ) ) ( not ( = ?auto_691486 ?auto_691493 ) ) ( not ( = ?auto_691486 ?auto_691494 ) ) ( not ( = ?auto_691486 ?auto_691495 ) ) ( not ( = ?auto_691486 ?auto_691496 ) ) ( not ( = ?auto_691486 ?auto_691497 ) ) ( not ( = ?auto_691486 ?auto_691498 ) ) ( not ( = ?auto_691487 ?auto_691488 ) ) ( not ( = ?auto_691487 ?auto_691489 ) ) ( not ( = ?auto_691487 ?auto_691490 ) ) ( not ( = ?auto_691487 ?auto_691491 ) ) ( not ( = ?auto_691487 ?auto_691492 ) ) ( not ( = ?auto_691487 ?auto_691493 ) ) ( not ( = ?auto_691487 ?auto_691494 ) ) ( not ( = ?auto_691487 ?auto_691495 ) ) ( not ( = ?auto_691487 ?auto_691496 ) ) ( not ( = ?auto_691487 ?auto_691497 ) ) ( not ( = ?auto_691487 ?auto_691498 ) ) ( not ( = ?auto_691488 ?auto_691489 ) ) ( not ( = ?auto_691488 ?auto_691490 ) ) ( not ( = ?auto_691488 ?auto_691491 ) ) ( not ( = ?auto_691488 ?auto_691492 ) ) ( not ( = ?auto_691488 ?auto_691493 ) ) ( not ( = ?auto_691488 ?auto_691494 ) ) ( not ( = ?auto_691488 ?auto_691495 ) ) ( not ( = ?auto_691488 ?auto_691496 ) ) ( not ( = ?auto_691488 ?auto_691497 ) ) ( not ( = ?auto_691488 ?auto_691498 ) ) ( not ( = ?auto_691489 ?auto_691490 ) ) ( not ( = ?auto_691489 ?auto_691491 ) ) ( not ( = ?auto_691489 ?auto_691492 ) ) ( not ( = ?auto_691489 ?auto_691493 ) ) ( not ( = ?auto_691489 ?auto_691494 ) ) ( not ( = ?auto_691489 ?auto_691495 ) ) ( not ( = ?auto_691489 ?auto_691496 ) ) ( not ( = ?auto_691489 ?auto_691497 ) ) ( not ( = ?auto_691489 ?auto_691498 ) ) ( not ( = ?auto_691490 ?auto_691491 ) ) ( not ( = ?auto_691490 ?auto_691492 ) ) ( not ( = ?auto_691490 ?auto_691493 ) ) ( not ( = ?auto_691490 ?auto_691494 ) ) ( not ( = ?auto_691490 ?auto_691495 ) ) ( not ( = ?auto_691490 ?auto_691496 ) ) ( not ( = ?auto_691490 ?auto_691497 ) ) ( not ( = ?auto_691490 ?auto_691498 ) ) ( not ( = ?auto_691491 ?auto_691492 ) ) ( not ( = ?auto_691491 ?auto_691493 ) ) ( not ( = ?auto_691491 ?auto_691494 ) ) ( not ( = ?auto_691491 ?auto_691495 ) ) ( not ( = ?auto_691491 ?auto_691496 ) ) ( not ( = ?auto_691491 ?auto_691497 ) ) ( not ( = ?auto_691491 ?auto_691498 ) ) ( not ( = ?auto_691492 ?auto_691493 ) ) ( not ( = ?auto_691492 ?auto_691494 ) ) ( not ( = ?auto_691492 ?auto_691495 ) ) ( not ( = ?auto_691492 ?auto_691496 ) ) ( not ( = ?auto_691492 ?auto_691497 ) ) ( not ( = ?auto_691492 ?auto_691498 ) ) ( not ( = ?auto_691493 ?auto_691494 ) ) ( not ( = ?auto_691493 ?auto_691495 ) ) ( not ( = ?auto_691493 ?auto_691496 ) ) ( not ( = ?auto_691493 ?auto_691497 ) ) ( not ( = ?auto_691493 ?auto_691498 ) ) ( not ( = ?auto_691494 ?auto_691495 ) ) ( not ( = ?auto_691494 ?auto_691496 ) ) ( not ( = ?auto_691494 ?auto_691497 ) ) ( not ( = ?auto_691494 ?auto_691498 ) ) ( not ( = ?auto_691495 ?auto_691496 ) ) ( not ( = ?auto_691495 ?auto_691497 ) ) ( not ( = ?auto_691495 ?auto_691498 ) ) ( not ( = ?auto_691496 ?auto_691497 ) ) ( not ( = ?auto_691496 ?auto_691498 ) ) ( not ( = ?auto_691497 ?auto_691498 ) ) ( ON ?auto_691496 ?auto_691497 ) ( ON ?auto_691495 ?auto_691496 ) ( ON ?auto_691494 ?auto_691495 ) ( ON ?auto_691493 ?auto_691494 ) ( ON ?auto_691492 ?auto_691493 ) ( ON ?auto_691491 ?auto_691492 ) ( ON ?auto_691490 ?auto_691491 ) ( ON ?auto_691489 ?auto_691490 ) ( ON ?auto_691488 ?auto_691489 ) ( CLEAR ?auto_691486 ) ( ON ?auto_691487 ?auto_691488 ) ( CLEAR ?auto_691487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_691484 ?auto_691485 ?auto_691486 ?auto_691487 )
      ( MAKE-14PILE ?auto_691484 ?auto_691485 ?auto_691486 ?auto_691487 ?auto_691488 ?auto_691489 ?auto_691490 ?auto_691491 ?auto_691492 ?auto_691493 ?auto_691494 ?auto_691495 ?auto_691496 ?auto_691497 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_691542 - BLOCK
      ?auto_691543 - BLOCK
      ?auto_691544 - BLOCK
      ?auto_691545 - BLOCK
      ?auto_691546 - BLOCK
      ?auto_691547 - BLOCK
      ?auto_691548 - BLOCK
      ?auto_691549 - BLOCK
      ?auto_691550 - BLOCK
      ?auto_691551 - BLOCK
      ?auto_691552 - BLOCK
      ?auto_691553 - BLOCK
      ?auto_691554 - BLOCK
      ?auto_691555 - BLOCK
    )
    :vars
    (
      ?auto_691556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691555 ?auto_691556 ) ( ON-TABLE ?auto_691542 ) ( ON ?auto_691543 ?auto_691542 ) ( not ( = ?auto_691542 ?auto_691543 ) ) ( not ( = ?auto_691542 ?auto_691544 ) ) ( not ( = ?auto_691542 ?auto_691545 ) ) ( not ( = ?auto_691542 ?auto_691546 ) ) ( not ( = ?auto_691542 ?auto_691547 ) ) ( not ( = ?auto_691542 ?auto_691548 ) ) ( not ( = ?auto_691542 ?auto_691549 ) ) ( not ( = ?auto_691542 ?auto_691550 ) ) ( not ( = ?auto_691542 ?auto_691551 ) ) ( not ( = ?auto_691542 ?auto_691552 ) ) ( not ( = ?auto_691542 ?auto_691553 ) ) ( not ( = ?auto_691542 ?auto_691554 ) ) ( not ( = ?auto_691542 ?auto_691555 ) ) ( not ( = ?auto_691542 ?auto_691556 ) ) ( not ( = ?auto_691543 ?auto_691544 ) ) ( not ( = ?auto_691543 ?auto_691545 ) ) ( not ( = ?auto_691543 ?auto_691546 ) ) ( not ( = ?auto_691543 ?auto_691547 ) ) ( not ( = ?auto_691543 ?auto_691548 ) ) ( not ( = ?auto_691543 ?auto_691549 ) ) ( not ( = ?auto_691543 ?auto_691550 ) ) ( not ( = ?auto_691543 ?auto_691551 ) ) ( not ( = ?auto_691543 ?auto_691552 ) ) ( not ( = ?auto_691543 ?auto_691553 ) ) ( not ( = ?auto_691543 ?auto_691554 ) ) ( not ( = ?auto_691543 ?auto_691555 ) ) ( not ( = ?auto_691543 ?auto_691556 ) ) ( not ( = ?auto_691544 ?auto_691545 ) ) ( not ( = ?auto_691544 ?auto_691546 ) ) ( not ( = ?auto_691544 ?auto_691547 ) ) ( not ( = ?auto_691544 ?auto_691548 ) ) ( not ( = ?auto_691544 ?auto_691549 ) ) ( not ( = ?auto_691544 ?auto_691550 ) ) ( not ( = ?auto_691544 ?auto_691551 ) ) ( not ( = ?auto_691544 ?auto_691552 ) ) ( not ( = ?auto_691544 ?auto_691553 ) ) ( not ( = ?auto_691544 ?auto_691554 ) ) ( not ( = ?auto_691544 ?auto_691555 ) ) ( not ( = ?auto_691544 ?auto_691556 ) ) ( not ( = ?auto_691545 ?auto_691546 ) ) ( not ( = ?auto_691545 ?auto_691547 ) ) ( not ( = ?auto_691545 ?auto_691548 ) ) ( not ( = ?auto_691545 ?auto_691549 ) ) ( not ( = ?auto_691545 ?auto_691550 ) ) ( not ( = ?auto_691545 ?auto_691551 ) ) ( not ( = ?auto_691545 ?auto_691552 ) ) ( not ( = ?auto_691545 ?auto_691553 ) ) ( not ( = ?auto_691545 ?auto_691554 ) ) ( not ( = ?auto_691545 ?auto_691555 ) ) ( not ( = ?auto_691545 ?auto_691556 ) ) ( not ( = ?auto_691546 ?auto_691547 ) ) ( not ( = ?auto_691546 ?auto_691548 ) ) ( not ( = ?auto_691546 ?auto_691549 ) ) ( not ( = ?auto_691546 ?auto_691550 ) ) ( not ( = ?auto_691546 ?auto_691551 ) ) ( not ( = ?auto_691546 ?auto_691552 ) ) ( not ( = ?auto_691546 ?auto_691553 ) ) ( not ( = ?auto_691546 ?auto_691554 ) ) ( not ( = ?auto_691546 ?auto_691555 ) ) ( not ( = ?auto_691546 ?auto_691556 ) ) ( not ( = ?auto_691547 ?auto_691548 ) ) ( not ( = ?auto_691547 ?auto_691549 ) ) ( not ( = ?auto_691547 ?auto_691550 ) ) ( not ( = ?auto_691547 ?auto_691551 ) ) ( not ( = ?auto_691547 ?auto_691552 ) ) ( not ( = ?auto_691547 ?auto_691553 ) ) ( not ( = ?auto_691547 ?auto_691554 ) ) ( not ( = ?auto_691547 ?auto_691555 ) ) ( not ( = ?auto_691547 ?auto_691556 ) ) ( not ( = ?auto_691548 ?auto_691549 ) ) ( not ( = ?auto_691548 ?auto_691550 ) ) ( not ( = ?auto_691548 ?auto_691551 ) ) ( not ( = ?auto_691548 ?auto_691552 ) ) ( not ( = ?auto_691548 ?auto_691553 ) ) ( not ( = ?auto_691548 ?auto_691554 ) ) ( not ( = ?auto_691548 ?auto_691555 ) ) ( not ( = ?auto_691548 ?auto_691556 ) ) ( not ( = ?auto_691549 ?auto_691550 ) ) ( not ( = ?auto_691549 ?auto_691551 ) ) ( not ( = ?auto_691549 ?auto_691552 ) ) ( not ( = ?auto_691549 ?auto_691553 ) ) ( not ( = ?auto_691549 ?auto_691554 ) ) ( not ( = ?auto_691549 ?auto_691555 ) ) ( not ( = ?auto_691549 ?auto_691556 ) ) ( not ( = ?auto_691550 ?auto_691551 ) ) ( not ( = ?auto_691550 ?auto_691552 ) ) ( not ( = ?auto_691550 ?auto_691553 ) ) ( not ( = ?auto_691550 ?auto_691554 ) ) ( not ( = ?auto_691550 ?auto_691555 ) ) ( not ( = ?auto_691550 ?auto_691556 ) ) ( not ( = ?auto_691551 ?auto_691552 ) ) ( not ( = ?auto_691551 ?auto_691553 ) ) ( not ( = ?auto_691551 ?auto_691554 ) ) ( not ( = ?auto_691551 ?auto_691555 ) ) ( not ( = ?auto_691551 ?auto_691556 ) ) ( not ( = ?auto_691552 ?auto_691553 ) ) ( not ( = ?auto_691552 ?auto_691554 ) ) ( not ( = ?auto_691552 ?auto_691555 ) ) ( not ( = ?auto_691552 ?auto_691556 ) ) ( not ( = ?auto_691553 ?auto_691554 ) ) ( not ( = ?auto_691553 ?auto_691555 ) ) ( not ( = ?auto_691553 ?auto_691556 ) ) ( not ( = ?auto_691554 ?auto_691555 ) ) ( not ( = ?auto_691554 ?auto_691556 ) ) ( not ( = ?auto_691555 ?auto_691556 ) ) ( ON ?auto_691554 ?auto_691555 ) ( ON ?auto_691553 ?auto_691554 ) ( ON ?auto_691552 ?auto_691553 ) ( ON ?auto_691551 ?auto_691552 ) ( ON ?auto_691550 ?auto_691551 ) ( ON ?auto_691549 ?auto_691550 ) ( ON ?auto_691548 ?auto_691549 ) ( ON ?auto_691547 ?auto_691548 ) ( ON ?auto_691546 ?auto_691547 ) ( ON ?auto_691545 ?auto_691546 ) ( CLEAR ?auto_691543 ) ( ON ?auto_691544 ?auto_691545 ) ( CLEAR ?auto_691544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_691542 ?auto_691543 ?auto_691544 )
      ( MAKE-14PILE ?auto_691542 ?auto_691543 ?auto_691544 ?auto_691545 ?auto_691546 ?auto_691547 ?auto_691548 ?auto_691549 ?auto_691550 ?auto_691551 ?auto_691552 ?auto_691553 ?auto_691554 ?auto_691555 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_691600 - BLOCK
      ?auto_691601 - BLOCK
      ?auto_691602 - BLOCK
      ?auto_691603 - BLOCK
      ?auto_691604 - BLOCK
      ?auto_691605 - BLOCK
      ?auto_691606 - BLOCK
      ?auto_691607 - BLOCK
      ?auto_691608 - BLOCK
      ?auto_691609 - BLOCK
      ?auto_691610 - BLOCK
      ?auto_691611 - BLOCK
      ?auto_691612 - BLOCK
      ?auto_691613 - BLOCK
    )
    :vars
    (
      ?auto_691614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691613 ?auto_691614 ) ( ON-TABLE ?auto_691600 ) ( not ( = ?auto_691600 ?auto_691601 ) ) ( not ( = ?auto_691600 ?auto_691602 ) ) ( not ( = ?auto_691600 ?auto_691603 ) ) ( not ( = ?auto_691600 ?auto_691604 ) ) ( not ( = ?auto_691600 ?auto_691605 ) ) ( not ( = ?auto_691600 ?auto_691606 ) ) ( not ( = ?auto_691600 ?auto_691607 ) ) ( not ( = ?auto_691600 ?auto_691608 ) ) ( not ( = ?auto_691600 ?auto_691609 ) ) ( not ( = ?auto_691600 ?auto_691610 ) ) ( not ( = ?auto_691600 ?auto_691611 ) ) ( not ( = ?auto_691600 ?auto_691612 ) ) ( not ( = ?auto_691600 ?auto_691613 ) ) ( not ( = ?auto_691600 ?auto_691614 ) ) ( not ( = ?auto_691601 ?auto_691602 ) ) ( not ( = ?auto_691601 ?auto_691603 ) ) ( not ( = ?auto_691601 ?auto_691604 ) ) ( not ( = ?auto_691601 ?auto_691605 ) ) ( not ( = ?auto_691601 ?auto_691606 ) ) ( not ( = ?auto_691601 ?auto_691607 ) ) ( not ( = ?auto_691601 ?auto_691608 ) ) ( not ( = ?auto_691601 ?auto_691609 ) ) ( not ( = ?auto_691601 ?auto_691610 ) ) ( not ( = ?auto_691601 ?auto_691611 ) ) ( not ( = ?auto_691601 ?auto_691612 ) ) ( not ( = ?auto_691601 ?auto_691613 ) ) ( not ( = ?auto_691601 ?auto_691614 ) ) ( not ( = ?auto_691602 ?auto_691603 ) ) ( not ( = ?auto_691602 ?auto_691604 ) ) ( not ( = ?auto_691602 ?auto_691605 ) ) ( not ( = ?auto_691602 ?auto_691606 ) ) ( not ( = ?auto_691602 ?auto_691607 ) ) ( not ( = ?auto_691602 ?auto_691608 ) ) ( not ( = ?auto_691602 ?auto_691609 ) ) ( not ( = ?auto_691602 ?auto_691610 ) ) ( not ( = ?auto_691602 ?auto_691611 ) ) ( not ( = ?auto_691602 ?auto_691612 ) ) ( not ( = ?auto_691602 ?auto_691613 ) ) ( not ( = ?auto_691602 ?auto_691614 ) ) ( not ( = ?auto_691603 ?auto_691604 ) ) ( not ( = ?auto_691603 ?auto_691605 ) ) ( not ( = ?auto_691603 ?auto_691606 ) ) ( not ( = ?auto_691603 ?auto_691607 ) ) ( not ( = ?auto_691603 ?auto_691608 ) ) ( not ( = ?auto_691603 ?auto_691609 ) ) ( not ( = ?auto_691603 ?auto_691610 ) ) ( not ( = ?auto_691603 ?auto_691611 ) ) ( not ( = ?auto_691603 ?auto_691612 ) ) ( not ( = ?auto_691603 ?auto_691613 ) ) ( not ( = ?auto_691603 ?auto_691614 ) ) ( not ( = ?auto_691604 ?auto_691605 ) ) ( not ( = ?auto_691604 ?auto_691606 ) ) ( not ( = ?auto_691604 ?auto_691607 ) ) ( not ( = ?auto_691604 ?auto_691608 ) ) ( not ( = ?auto_691604 ?auto_691609 ) ) ( not ( = ?auto_691604 ?auto_691610 ) ) ( not ( = ?auto_691604 ?auto_691611 ) ) ( not ( = ?auto_691604 ?auto_691612 ) ) ( not ( = ?auto_691604 ?auto_691613 ) ) ( not ( = ?auto_691604 ?auto_691614 ) ) ( not ( = ?auto_691605 ?auto_691606 ) ) ( not ( = ?auto_691605 ?auto_691607 ) ) ( not ( = ?auto_691605 ?auto_691608 ) ) ( not ( = ?auto_691605 ?auto_691609 ) ) ( not ( = ?auto_691605 ?auto_691610 ) ) ( not ( = ?auto_691605 ?auto_691611 ) ) ( not ( = ?auto_691605 ?auto_691612 ) ) ( not ( = ?auto_691605 ?auto_691613 ) ) ( not ( = ?auto_691605 ?auto_691614 ) ) ( not ( = ?auto_691606 ?auto_691607 ) ) ( not ( = ?auto_691606 ?auto_691608 ) ) ( not ( = ?auto_691606 ?auto_691609 ) ) ( not ( = ?auto_691606 ?auto_691610 ) ) ( not ( = ?auto_691606 ?auto_691611 ) ) ( not ( = ?auto_691606 ?auto_691612 ) ) ( not ( = ?auto_691606 ?auto_691613 ) ) ( not ( = ?auto_691606 ?auto_691614 ) ) ( not ( = ?auto_691607 ?auto_691608 ) ) ( not ( = ?auto_691607 ?auto_691609 ) ) ( not ( = ?auto_691607 ?auto_691610 ) ) ( not ( = ?auto_691607 ?auto_691611 ) ) ( not ( = ?auto_691607 ?auto_691612 ) ) ( not ( = ?auto_691607 ?auto_691613 ) ) ( not ( = ?auto_691607 ?auto_691614 ) ) ( not ( = ?auto_691608 ?auto_691609 ) ) ( not ( = ?auto_691608 ?auto_691610 ) ) ( not ( = ?auto_691608 ?auto_691611 ) ) ( not ( = ?auto_691608 ?auto_691612 ) ) ( not ( = ?auto_691608 ?auto_691613 ) ) ( not ( = ?auto_691608 ?auto_691614 ) ) ( not ( = ?auto_691609 ?auto_691610 ) ) ( not ( = ?auto_691609 ?auto_691611 ) ) ( not ( = ?auto_691609 ?auto_691612 ) ) ( not ( = ?auto_691609 ?auto_691613 ) ) ( not ( = ?auto_691609 ?auto_691614 ) ) ( not ( = ?auto_691610 ?auto_691611 ) ) ( not ( = ?auto_691610 ?auto_691612 ) ) ( not ( = ?auto_691610 ?auto_691613 ) ) ( not ( = ?auto_691610 ?auto_691614 ) ) ( not ( = ?auto_691611 ?auto_691612 ) ) ( not ( = ?auto_691611 ?auto_691613 ) ) ( not ( = ?auto_691611 ?auto_691614 ) ) ( not ( = ?auto_691612 ?auto_691613 ) ) ( not ( = ?auto_691612 ?auto_691614 ) ) ( not ( = ?auto_691613 ?auto_691614 ) ) ( ON ?auto_691612 ?auto_691613 ) ( ON ?auto_691611 ?auto_691612 ) ( ON ?auto_691610 ?auto_691611 ) ( ON ?auto_691609 ?auto_691610 ) ( ON ?auto_691608 ?auto_691609 ) ( ON ?auto_691607 ?auto_691608 ) ( ON ?auto_691606 ?auto_691607 ) ( ON ?auto_691605 ?auto_691606 ) ( ON ?auto_691604 ?auto_691605 ) ( ON ?auto_691603 ?auto_691604 ) ( ON ?auto_691602 ?auto_691603 ) ( CLEAR ?auto_691600 ) ( ON ?auto_691601 ?auto_691602 ) ( CLEAR ?auto_691601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_691600 ?auto_691601 )
      ( MAKE-14PILE ?auto_691600 ?auto_691601 ?auto_691602 ?auto_691603 ?auto_691604 ?auto_691605 ?auto_691606 ?auto_691607 ?auto_691608 ?auto_691609 ?auto_691610 ?auto_691611 ?auto_691612 ?auto_691613 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_691658 - BLOCK
      ?auto_691659 - BLOCK
      ?auto_691660 - BLOCK
      ?auto_691661 - BLOCK
      ?auto_691662 - BLOCK
      ?auto_691663 - BLOCK
      ?auto_691664 - BLOCK
      ?auto_691665 - BLOCK
      ?auto_691666 - BLOCK
      ?auto_691667 - BLOCK
      ?auto_691668 - BLOCK
      ?auto_691669 - BLOCK
      ?auto_691670 - BLOCK
      ?auto_691671 - BLOCK
    )
    :vars
    (
      ?auto_691672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691671 ?auto_691672 ) ( not ( = ?auto_691658 ?auto_691659 ) ) ( not ( = ?auto_691658 ?auto_691660 ) ) ( not ( = ?auto_691658 ?auto_691661 ) ) ( not ( = ?auto_691658 ?auto_691662 ) ) ( not ( = ?auto_691658 ?auto_691663 ) ) ( not ( = ?auto_691658 ?auto_691664 ) ) ( not ( = ?auto_691658 ?auto_691665 ) ) ( not ( = ?auto_691658 ?auto_691666 ) ) ( not ( = ?auto_691658 ?auto_691667 ) ) ( not ( = ?auto_691658 ?auto_691668 ) ) ( not ( = ?auto_691658 ?auto_691669 ) ) ( not ( = ?auto_691658 ?auto_691670 ) ) ( not ( = ?auto_691658 ?auto_691671 ) ) ( not ( = ?auto_691658 ?auto_691672 ) ) ( not ( = ?auto_691659 ?auto_691660 ) ) ( not ( = ?auto_691659 ?auto_691661 ) ) ( not ( = ?auto_691659 ?auto_691662 ) ) ( not ( = ?auto_691659 ?auto_691663 ) ) ( not ( = ?auto_691659 ?auto_691664 ) ) ( not ( = ?auto_691659 ?auto_691665 ) ) ( not ( = ?auto_691659 ?auto_691666 ) ) ( not ( = ?auto_691659 ?auto_691667 ) ) ( not ( = ?auto_691659 ?auto_691668 ) ) ( not ( = ?auto_691659 ?auto_691669 ) ) ( not ( = ?auto_691659 ?auto_691670 ) ) ( not ( = ?auto_691659 ?auto_691671 ) ) ( not ( = ?auto_691659 ?auto_691672 ) ) ( not ( = ?auto_691660 ?auto_691661 ) ) ( not ( = ?auto_691660 ?auto_691662 ) ) ( not ( = ?auto_691660 ?auto_691663 ) ) ( not ( = ?auto_691660 ?auto_691664 ) ) ( not ( = ?auto_691660 ?auto_691665 ) ) ( not ( = ?auto_691660 ?auto_691666 ) ) ( not ( = ?auto_691660 ?auto_691667 ) ) ( not ( = ?auto_691660 ?auto_691668 ) ) ( not ( = ?auto_691660 ?auto_691669 ) ) ( not ( = ?auto_691660 ?auto_691670 ) ) ( not ( = ?auto_691660 ?auto_691671 ) ) ( not ( = ?auto_691660 ?auto_691672 ) ) ( not ( = ?auto_691661 ?auto_691662 ) ) ( not ( = ?auto_691661 ?auto_691663 ) ) ( not ( = ?auto_691661 ?auto_691664 ) ) ( not ( = ?auto_691661 ?auto_691665 ) ) ( not ( = ?auto_691661 ?auto_691666 ) ) ( not ( = ?auto_691661 ?auto_691667 ) ) ( not ( = ?auto_691661 ?auto_691668 ) ) ( not ( = ?auto_691661 ?auto_691669 ) ) ( not ( = ?auto_691661 ?auto_691670 ) ) ( not ( = ?auto_691661 ?auto_691671 ) ) ( not ( = ?auto_691661 ?auto_691672 ) ) ( not ( = ?auto_691662 ?auto_691663 ) ) ( not ( = ?auto_691662 ?auto_691664 ) ) ( not ( = ?auto_691662 ?auto_691665 ) ) ( not ( = ?auto_691662 ?auto_691666 ) ) ( not ( = ?auto_691662 ?auto_691667 ) ) ( not ( = ?auto_691662 ?auto_691668 ) ) ( not ( = ?auto_691662 ?auto_691669 ) ) ( not ( = ?auto_691662 ?auto_691670 ) ) ( not ( = ?auto_691662 ?auto_691671 ) ) ( not ( = ?auto_691662 ?auto_691672 ) ) ( not ( = ?auto_691663 ?auto_691664 ) ) ( not ( = ?auto_691663 ?auto_691665 ) ) ( not ( = ?auto_691663 ?auto_691666 ) ) ( not ( = ?auto_691663 ?auto_691667 ) ) ( not ( = ?auto_691663 ?auto_691668 ) ) ( not ( = ?auto_691663 ?auto_691669 ) ) ( not ( = ?auto_691663 ?auto_691670 ) ) ( not ( = ?auto_691663 ?auto_691671 ) ) ( not ( = ?auto_691663 ?auto_691672 ) ) ( not ( = ?auto_691664 ?auto_691665 ) ) ( not ( = ?auto_691664 ?auto_691666 ) ) ( not ( = ?auto_691664 ?auto_691667 ) ) ( not ( = ?auto_691664 ?auto_691668 ) ) ( not ( = ?auto_691664 ?auto_691669 ) ) ( not ( = ?auto_691664 ?auto_691670 ) ) ( not ( = ?auto_691664 ?auto_691671 ) ) ( not ( = ?auto_691664 ?auto_691672 ) ) ( not ( = ?auto_691665 ?auto_691666 ) ) ( not ( = ?auto_691665 ?auto_691667 ) ) ( not ( = ?auto_691665 ?auto_691668 ) ) ( not ( = ?auto_691665 ?auto_691669 ) ) ( not ( = ?auto_691665 ?auto_691670 ) ) ( not ( = ?auto_691665 ?auto_691671 ) ) ( not ( = ?auto_691665 ?auto_691672 ) ) ( not ( = ?auto_691666 ?auto_691667 ) ) ( not ( = ?auto_691666 ?auto_691668 ) ) ( not ( = ?auto_691666 ?auto_691669 ) ) ( not ( = ?auto_691666 ?auto_691670 ) ) ( not ( = ?auto_691666 ?auto_691671 ) ) ( not ( = ?auto_691666 ?auto_691672 ) ) ( not ( = ?auto_691667 ?auto_691668 ) ) ( not ( = ?auto_691667 ?auto_691669 ) ) ( not ( = ?auto_691667 ?auto_691670 ) ) ( not ( = ?auto_691667 ?auto_691671 ) ) ( not ( = ?auto_691667 ?auto_691672 ) ) ( not ( = ?auto_691668 ?auto_691669 ) ) ( not ( = ?auto_691668 ?auto_691670 ) ) ( not ( = ?auto_691668 ?auto_691671 ) ) ( not ( = ?auto_691668 ?auto_691672 ) ) ( not ( = ?auto_691669 ?auto_691670 ) ) ( not ( = ?auto_691669 ?auto_691671 ) ) ( not ( = ?auto_691669 ?auto_691672 ) ) ( not ( = ?auto_691670 ?auto_691671 ) ) ( not ( = ?auto_691670 ?auto_691672 ) ) ( not ( = ?auto_691671 ?auto_691672 ) ) ( ON ?auto_691670 ?auto_691671 ) ( ON ?auto_691669 ?auto_691670 ) ( ON ?auto_691668 ?auto_691669 ) ( ON ?auto_691667 ?auto_691668 ) ( ON ?auto_691666 ?auto_691667 ) ( ON ?auto_691665 ?auto_691666 ) ( ON ?auto_691664 ?auto_691665 ) ( ON ?auto_691663 ?auto_691664 ) ( ON ?auto_691662 ?auto_691663 ) ( ON ?auto_691661 ?auto_691662 ) ( ON ?auto_691660 ?auto_691661 ) ( ON ?auto_691659 ?auto_691660 ) ( ON ?auto_691658 ?auto_691659 ) ( CLEAR ?auto_691658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_691658 )
      ( MAKE-14PILE ?auto_691658 ?auto_691659 ?auto_691660 ?auto_691661 ?auto_691662 ?auto_691663 ?auto_691664 ?auto_691665 ?auto_691666 ?auto_691667 ?auto_691668 ?auto_691669 ?auto_691670 ?auto_691671 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_691717 - BLOCK
      ?auto_691718 - BLOCK
      ?auto_691719 - BLOCK
      ?auto_691720 - BLOCK
      ?auto_691721 - BLOCK
      ?auto_691722 - BLOCK
      ?auto_691723 - BLOCK
      ?auto_691724 - BLOCK
      ?auto_691725 - BLOCK
      ?auto_691726 - BLOCK
      ?auto_691727 - BLOCK
      ?auto_691728 - BLOCK
      ?auto_691729 - BLOCK
      ?auto_691730 - BLOCK
      ?auto_691731 - BLOCK
    )
    :vars
    (
      ?auto_691732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_691730 ) ( ON ?auto_691731 ?auto_691732 ) ( CLEAR ?auto_691731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_691717 ) ( ON ?auto_691718 ?auto_691717 ) ( ON ?auto_691719 ?auto_691718 ) ( ON ?auto_691720 ?auto_691719 ) ( ON ?auto_691721 ?auto_691720 ) ( ON ?auto_691722 ?auto_691721 ) ( ON ?auto_691723 ?auto_691722 ) ( ON ?auto_691724 ?auto_691723 ) ( ON ?auto_691725 ?auto_691724 ) ( ON ?auto_691726 ?auto_691725 ) ( ON ?auto_691727 ?auto_691726 ) ( ON ?auto_691728 ?auto_691727 ) ( ON ?auto_691729 ?auto_691728 ) ( ON ?auto_691730 ?auto_691729 ) ( not ( = ?auto_691717 ?auto_691718 ) ) ( not ( = ?auto_691717 ?auto_691719 ) ) ( not ( = ?auto_691717 ?auto_691720 ) ) ( not ( = ?auto_691717 ?auto_691721 ) ) ( not ( = ?auto_691717 ?auto_691722 ) ) ( not ( = ?auto_691717 ?auto_691723 ) ) ( not ( = ?auto_691717 ?auto_691724 ) ) ( not ( = ?auto_691717 ?auto_691725 ) ) ( not ( = ?auto_691717 ?auto_691726 ) ) ( not ( = ?auto_691717 ?auto_691727 ) ) ( not ( = ?auto_691717 ?auto_691728 ) ) ( not ( = ?auto_691717 ?auto_691729 ) ) ( not ( = ?auto_691717 ?auto_691730 ) ) ( not ( = ?auto_691717 ?auto_691731 ) ) ( not ( = ?auto_691717 ?auto_691732 ) ) ( not ( = ?auto_691718 ?auto_691719 ) ) ( not ( = ?auto_691718 ?auto_691720 ) ) ( not ( = ?auto_691718 ?auto_691721 ) ) ( not ( = ?auto_691718 ?auto_691722 ) ) ( not ( = ?auto_691718 ?auto_691723 ) ) ( not ( = ?auto_691718 ?auto_691724 ) ) ( not ( = ?auto_691718 ?auto_691725 ) ) ( not ( = ?auto_691718 ?auto_691726 ) ) ( not ( = ?auto_691718 ?auto_691727 ) ) ( not ( = ?auto_691718 ?auto_691728 ) ) ( not ( = ?auto_691718 ?auto_691729 ) ) ( not ( = ?auto_691718 ?auto_691730 ) ) ( not ( = ?auto_691718 ?auto_691731 ) ) ( not ( = ?auto_691718 ?auto_691732 ) ) ( not ( = ?auto_691719 ?auto_691720 ) ) ( not ( = ?auto_691719 ?auto_691721 ) ) ( not ( = ?auto_691719 ?auto_691722 ) ) ( not ( = ?auto_691719 ?auto_691723 ) ) ( not ( = ?auto_691719 ?auto_691724 ) ) ( not ( = ?auto_691719 ?auto_691725 ) ) ( not ( = ?auto_691719 ?auto_691726 ) ) ( not ( = ?auto_691719 ?auto_691727 ) ) ( not ( = ?auto_691719 ?auto_691728 ) ) ( not ( = ?auto_691719 ?auto_691729 ) ) ( not ( = ?auto_691719 ?auto_691730 ) ) ( not ( = ?auto_691719 ?auto_691731 ) ) ( not ( = ?auto_691719 ?auto_691732 ) ) ( not ( = ?auto_691720 ?auto_691721 ) ) ( not ( = ?auto_691720 ?auto_691722 ) ) ( not ( = ?auto_691720 ?auto_691723 ) ) ( not ( = ?auto_691720 ?auto_691724 ) ) ( not ( = ?auto_691720 ?auto_691725 ) ) ( not ( = ?auto_691720 ?auto_691726 ) ) ( not ( = ?auto_691720 ?auto_691727 ) ) ( not ( = ?auto_691720 ?auto_691728 ) ) ( not ( = ?auto_691720 ?auto_691729 ) ) ( not ( = ?auto_691720 ?auto_691730 ) ) ( not ( = ?auto_691720 ?auto_691731 ) ) ( not ( = ?auto_691720 ?auto_691732 ) ) ( not ( = ?auto_691721 ?auto_691722 ) ) ( not ( = ?auto_691721 ?auto_691723 ) ) ( not ( = ?auto_691721 ?auto_691724 ) ) ( not ( = ?auto_691721 ?auto_691725 ) ) ( not ( = ?auto_691721 ?auto_691726 ) ) ( not ( = ?auto_691721 ?auto_691727 ) ) ( not ( = ?auto_691721 ?auto_691728 ) ) ( not ( = ?auto_691721 ?auto_691729 ) ) ( not ( = ?auto_691721 ?auto_691730 ) ) ( not ( = ?auto_691721 ?auto_691731 ) ) ( not ( = ?auto_691721 ?auto_691732 ) ) ( not ( = ?auto_691722 ?auto_691723 ) ) ( not ( = ?auto_691722 ?auto_691724 ) ) ( not ( = ?auto_691722 ?auto_691725 ) ) ( not ( = ?auto_691722 ?auto_691726 ) ) ( not ( = ?auto_691722 ?auto_691727 ) ) ( not ( = ?auto_691722 ?auto_691728 ) ) ( not ( = ?auto_691722 ?auto_691729 ) ) ( not ( = ?auto_691722 ?auto_691730 ) ) ( not ( = ?auto_691722 ?auto_691731 ) ) ( not ( = ?auto_691722 ?auto_691732 ) ) ( not ( = ?auto_691723 ?auto_691724 ) ) ( not ( = ?auto_691723 ?auto_691725 ) ) ( not ( = ?auto_691723 ?auto_691726 ) ) ( not ( = ?auto_691723 ?auto_691727 ) ) ( not ( = ?auto_691723 ?auto_691728 ) ) ( not ( = ?auto_691723 ?auto_691729 ) ) ( not ( = ?auto_691723 ?auto_691730 ) ) ( not ( = ?auto_691723 ?auto_691731 ) ) ( not ( = ?auto_691723 ?auto_691732 ) ) ( not ( = ?auto_691724 ?auto_691725 ) ) ( not ( = ?auto_691724 ?auto_691726 ) ) ( not ( = ?auto_691724 ?auto_691727 ) ) ( not ( = ?auto_691724 ?auto_691728 ) ) ( not ( = ?auto_691724 ?auto_691729 ) ) ( not ( = ?auto_691724 ?auto_691730 ) ) ( not ( = ?auto_691724 ?auto_691731 ) ) ( not ( = ?auto_691724 ?auto_691732 ) ) ( not ( = ?auto_691725 ?auto_691726 ) ) ( not ( = ?auto_691725 ?auto_691727 ) ) ( not ( = ?auto_691725 ?auto_691728 ) ) ( not ( = ?auto_691725 ?auto_691729 ) ) ( not ( = ?auto_691725 ?auto_691730 ) ) ( not ( = ?auto_691725 ?auto_691731 ) ) ( not ( = ?auto_691725 ?auto_691732 ) ) ( not ( = ?auto_691726 ?auto_691727 ) ) ( not ( = ?auto_691726 ?auto_691728 ) ) ( not ( = ?auto_691726 ?auto_691729 ) ) ( not ( = ?auto_691726 ?auto_691730 ) ) ( not ( = ?auto_691726 ?auto_691731 ) ) ( not ( = ?auto_691726 ?auto_691732 ) ) ( not ( = ?auto_691727 ?auto_691728 ) ) ( not ( = ?auto_691727 ?auto_691729 ) ) ( not ( = ?auto_691727 ?auto_691730 ) ) ( not ( = ?auto_691727 ?auto_691731 ) ) ( not ( = ?auto_691727 ?auto_691732 ) ) ( not ( = ?auto_691728 ?auto_691729 ) ) ( not ( = ?auto_691728 ?auto_691730 ) ) ( not ( = ?auto_691728 ?auto_691731 ) ) ( not ( = ?auto_691728 ?auto_691732 ) ) ( not ( = ?auto_691729 ?auto_691730 ) ) ( not ( = ?auto_691729 ?auto_691731 ) ) ( not ( = ?auto_691729 ?auto_691732 ) ) ( not ( = ?auto_691730 ?auto_691731 ) ) ( not ( = ?auto_691730 ?auto_691732 ) ) ( not ( = ?auto_691731 ?auto_691732 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_691731 ?auto_691732 )
      ( !STACK ?auto_691731 ?auto_691730 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_691779 - BLOCK
      ?auto_691780 - BLOCK
      ?auto_691781 - BLOCK
      ?auto_691782 - BLOCK
      ?auto_691783 - BLOCK
      ?auto_691784 - BLOCK
      ?auto_691785 - BLOCK
      ?auto_691786 - BLOCK
      ?auto_691787 - BLOCK
      ?auto_691788 - BLOCK
      ?auto_691789 - BLOCK
      ?auto_691790 - BLOCK
      ?auto_691791 - BLOCK
      ?auto_691792 - BLOCK
      ?auto_691793 - BLOCK
    )
    :vars
    (
      ?auto_691794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691793 ?auto_691794 ) ( ON-TABLE ?auto_691779 ) ( ON ?auto_691780 ?auto_691779 ) ( ON ?auto_691781 ?auto_691780 ) ( ON ?auto_691782 ?auto_691781 ) ( ON ?auto_691783 ?auto_691782 ) ( ON ?auto_691784 ?auto_691783 ) ( ON ?auto_691785 ?auto_691784 ) ( ON ?auto_691786 ?auto_691785 ) ( ON ?auto_691787 ?auto_691786 ) ( ON ?auto_691788 ?auto_691787 ) ( ON ?auto_691789 ?auto_691788 ) ( ON ?auto_691790 ?auto_691789 ) ( ON ?auto_691791 ?auto_691790 ) ( not ( = ?auto_691779 ?auto_691780 ) ) ( not ( = ?auto_691779 ?auto_691781 ) ) ( not ( = ?auto_691779 ?auto_691782 ) ) ( not ( = ?auto_691779 ?auto_691783 ) ) ( not ( = ?auto_691779 ?auto_691784 ) ) ( not ( = ?auto_691779 ?auto_691785 ) ) ( not ( = ?auto_691779 ?auto_691786 ) ) ( not ( = ?auto_691779 ?auto_691787 ) ) ( not ( = ?auto_691779 ?auto_691788 ) ) ( not ( = ?auto_691779 ?auto_691789 ) ) ( not ( = ?auto_691779 ?auto_691790 ) ) ( not ( = ?auto_691779 ?auto_691791 ) ) ( not ( = ?auto_691779 ?auto_691792 ) ) ( not ( = ?auto_691779 ?auto_691793 ) ) ( not ( = ?auto_691779 ?auto_691794 ) ) ( not ( = ?auto_691780 ?auto_691781 ) ) ( not ( = ?auto_691780 ?auto_691782 ) ) ( not ( = ?auto_691780 ?auto_691783 ) ) ( not ( = ?auto_691780 ?auto_691784 ) ) ( not ( = ?auto_691780 ?auto_691785 ) ) ( not ( = ?auto_691780 ?auto_691786 ) ) ( not ( = ?auto_691780 ?auto_691787 ) ) ( not ( = ?auto_691780 ?auto_691788 ) ) ( not ( = ?auto_691780 ?auto_691789 ) ) ( not ( = ?auto_691780 ?auto_691790 ) ) ( not ( = ?auto_691780 ?auto_691791 ) ) ( not ( = ?auto_691780 ?auto_691792 ) ) ( not ( = ?auto_691780 ?auto_691793 ) ) ( not ( = ?auto_691780 ?auto_691794 ) ) ( not ( = ?auto_691781 ?auto_691782 ) ) ( not ( = ?auto_691781 ?auto_691783 ) ) ( not ( = ?auto_691781 ?auto_691784 ) ) ( not ( = ?auto_691781 ?auto_691785 ) ) ( not ( = ?auto_691781 ?auto_691786 ) ) ( not ( = ?auto_691781 ?auto_691787 ) ) ( not ( = ?auto_691781 ?auto_691788 ) ) ( not ( = ?auto_691781 ?auto_691789 ) ) ( not ( = ?auto_691781 ?auto_691790 ) ) ( not ( = ?auto_691781 ?auto_691791 ) ) ( not ( = ?auto_691781 ?auto_691792 ) ) ( not ( = ?auto_691781 ?auto_691793 ) ) ( not ( = ?auto_691781 ?auto_691794 ) ) ( not ( = ?auto_691782 ?auto_691783 ) ) ( not ( = ?auto_691782 ?auto_691784 ) ) ( not ( = ?auto_691782 ?auto_691785 ) ) ( not ( = ?auto_691782 ?auto_691786 ) ) ( not ( = ?auto_691782 ?auto_691787 ) ) ( not ( = ?auto_691782 ?auto_691788 ) ) ( not ( = ?auto_691782 ?auto_691789 ) ) ( not ( = ?auto_691782 ?auto_691790 ) ) ( not ( = ?auto_691782 ?auto_691791 ) ) ( not ( = ?auto_691782 ?auto_691792 ) ) ( not ( = ?auto_691782 ?auto_691793 ) ) ( not ( = ?auto_691782 ?auto_691794 ) ) ( not ( = ?auto_691783 ?auto_691784 ) ) ( not ( = ?auto_691783 ?auto_691785 ) ) ( not ( = ?auto_691783 ?auto_691786 ) ) ( not ( = ?auto_691783 ?auto_691787 ) ) ( not ( = ?auto_691783 ?auto_691788 ) ) ( not ( = ?auto_691783 ?auto_691789 ) ) ( not ( = ?auto_691783 ?auto_691790 ) ) ( not ( = ?auto_691783 ?auto_691791 ) ) ( not ( = ?auto_691783 ?auto_691792 ) ) ( not ( = ?auto_691783 ?auto_691793 ) ) ( not ( = ?auto_691783 ?auto_691794 ) ) ( not ( = ?auto_691784 ?auto_691785 ) ) ( not ( = ?auto_691784 ?auto_691786 ) ) ( not ( = ?auto_691784 ?auto_691787 ) ) ( not ( = ?auto_691784 ?auto_691788 ) ) ( not ( = ?auto_691784 ?auto_691789 ) ) ( not ( = ?auto_691784 ?auto_691790 ) ) ( not ( = ?auto_691784 ?auto_691791 ) ) ( not ( = ?auto_691784 ?auto_691792 ) ) ( not ( = ?auto_691784 ?auto_691793 ) ) ( not ( = ?auto_691784 ?auto_691794 ) ) ( not ( = ?auto_691785 ?auto_691786 ) ) ( not ( = ?auto_691785 ?auto_691787 ) ) ( not ( = ?auto_691785 ?auto_691788 ) ) ( not ( = ?auto_691785 ?auto_691789 ) ) ( not ( = ?auto_691785 ?auto_691790 ) ) ( not ( = ?auto_691785 ?auto_691791 ) ) ( not ( = ?auto_691785 ?auto_691792 ) ) ( not ( = ?auto_691785 ?auto_691793 ) ) ( not ( = ?auto_691785 ?auto_691794 ) ) ( not ( = ?auto_691786 ?auto_691787 ) ) ( not ( = ?auto_691786 ?auto_691788 ) ) ( not ( = ?auto_691786 ?auto_691789 ) ) ( not ( = ?auto_691786 ?auto_691790 ) ) ( not ( = ?auto_691786 ?auto_691791 ) ) ( not ( = ?auto_691786 ?auto_691792 ) ) ( not ( = ?auto_691786 ?auto_691793 ) ) ( not ( = ?auto_691786 ?auto_691794 ) ) ( not ( = ?auto_691787 ?auto_691788 ) ) ( not ( = ?auto_691787 ?auto_691789 ) ) ( not ( = ?auto_691787 ?auto_691790 ) ) ( not ( = ?auto_691787 ?auto_691791 ) ) ( not ( = ?auto_691787 ?auto_691792 ) ) ( not ( = ?auto_691787 ?auto_691793 ) ) ( not ( = ?auto_691787 ?auto_691794 ) ) ( not ( = ?auto_691788 ?auto_691789 ) ) ( not ( = ?auto_691788 ?auto_691790 ) ) ( not ( = ?auto_691788 ?auto_691791 ) ) ( not ( = ?auto_691788 ?auto_691792 ) ) ( not ( = ?auto_691788 ?auto_691793 ) ) ( not ( = ?auto_691788 ?auto_691794 ) ) ( not ( = ?auto_691789 ?auto_691790 ) ) ( not ( = ?auto_691789 ?auto_691791 ) ) ( not ( = ?auto_691789 ?auto_691792 ) ) ( not ( = ?auto_691789 ?auto_691793 ) ) ( not ( = ?auto_691789 ?auto_691794 ) ) ( not ( = ?auto_691790 ?auto_691791 ) ) ( not ( = ?auto_691790 ?auto_691792 ) ) ( not ( = ?auto_691790 ?auto_691793 ) ) ( not ( = ?auto_691790 ?auto_691794 ) ) ( not ( = ?auto_691791 ?auto_691792 ) ) ( not ( = ?auto_691791 ?auto_691793 ) ) ( not ( = ?auto_691791 ?auto_691794 ) ) ( not ( = ?auto_691792 ?auto_691793 ) ) ( not ( = ?auto_691792 ?auto_691794 ) ) ( not ( = ?auto_691793 ?auto_691794 ) ) ( CLEAR ?auto_691791 ) ( ON ?auto_691792 ?auto_691793 ) ( CLEAR ?auto_691792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_691779 ?auto_691780 ?auto_691781 ?auto_691782 ?auto_691783 ?auto_691784 ?auto_691785 ?auto_691786 ?auto_691787 ?auto_691788 ?auto_691789 ?auto_691790 ?auto_691791 ?auto_691792 )
      ( MAKE-15PILE ?auto_691779 ?auto_691780 ?auto_691781 ?auto_691782 ?auto_691783 ?auto_691784 ?auto_691785 ?auto_691786 ?auto_691787 ?auto_691788 ?auto_691789 ?auto_691790 ?auto_691791 ?auto_691792 ?auto_691793 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_691841 - BLOCK
      ?auto_691842 - BLOCK
      ?auto_691843 - BLOCK
      ?auto_691844 - BLOCK
      ?auto_691845 - BLOCK
      ?auto_691846 - BLOCK
      ?auto_691847 - BLOCK
      ?auto_691848 - BLOCK
      ?auto_691849 - BLOCK
      ?auto_691850 - BLOCK
      ?auto_691851 - BLOCK
      ?auto_691852 - BLOCK
      ?auto_691853 - BLOCK
      ?auto_691854 - BLOCK
      ?auto_691855 - BLOCK
    )
    :vars
    (
      ?auto_691856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691855 ?auto_691856 ) ( ON-TABLE ?auto_691841 ) ( ON ?auto_691842 ?auto_691841 ) ( ON ?auto_691843 ?auto_691842 ) ( ON ?auto_691844 ?auto_691843 ) ( ON ?auto_691845 ?auto_691844 ) ( ON ?auto_691846 ?auto_691845 ) ( ON ?auto_691847 ?auto_691846 ) ( ON ?auto_691848 ?auto_691847 ) ( ON ?auto_691849 ?auto_691848 ) ( ON ?auto_691850 ?auto_691849 ) ( ON ?auto_691851 ?auto_691850 ) ( ON ?auto_691852 ?auto_691851 ) ( not ( = ?auto_691841 ?auto_691842 ) ) ( not ( = ?auto_691841 ?auto_691843 ) ) ( not ( = ?auto_691841 ?auto_691844 ) ) ( not ( = ?auto_691841 ?auto_691845 ) ) ( not ( = ?auto_691841 ?auto_691846 ) ) ( not ( = ?auto_691841 ?auto_691847 ) ) ( not ( = ?auto_691841 ?auto_691848 ) ) ( not ( = ?auto_691841 ?auto_691849 ) ) ( not ( = ?auto_691841 ?auto_691850 ) ) ( not ( = ?auto_691841 ?auto_691851 ) ) ( not ( = ?auto_691841 ?auto_691852 ) ) ( not ( = ?auto_691841 ?auto_691853 ) ) ( not ( = ?auto_691841 ?auto_691854 ) ) ( not ( = ?auto_691841 ?auto_691855 ) ) ( not ( = ?auto_691841 ?auto_691856 ) ) ( not ( = ?auto_691842 ?auto_691843 ) ) ( not ( = ?auto_691842 ?auto_691844 ) ) ( not ( = ?auto_691842 ?auto_691845 ) ) ( not ( = ?auto_691842 ?auto_691846 ) ) ( not ( = ?auto_691842 ?auto_691847 ) ) ( not ( = ?auto_691842 ?auto_691848 ) ) ( not ( = ?auto_691842 ?auto_691849 ) ) ( not ( = ?auto_691842 ?auto_691850 ) ) ( not ( = ?auto_691842 ?auto_691851 ) ) ( not ( = ?auto_691842 ?auto_691852 ) ) ( not ( = ?auto_691842 ?auto_691853 ) ) ( not ( = ?auto_691842 ?auto_691854 ) ) ( not ( = ?auto_691842 ?auto_691855 ) ) ( not ( = ?auto_691842 ?auto_691856 ) ) ( not ( = ?auto_691843 ?auto_691844 ) ) ( not ( = ?auto_691843 ?auto_691845 ) ) ( not ( = ?auto_691843 ?auto_691846 ) ) ( not ( = ?auto_691843 ?auto_691847 ) ) ( not ( = ?auto_691843 ?auto_691848 ) ) ( not ( = ?auto_691843 ?auto_691849 ) ) ( not ( = ?auto_691843 ?auto_691850 ) ) ( not ( = ?auto_691843 ?auto_691851 ) ) ( not ( = ?auto_691843 ?auto_691852 ) ) ( not ( = ?auto_691843 ?auto_691853 ) ) ( not ( = ?auto_691843 ?auto_691854 ) ) ( not ( = ?auto_691843 ?auto_691855 ) ) ( not ( = ?auto_691843 ?auto_691856 ) ) ( not ( = ?auto_691844 ?auto_691845 ) ) ( not ( = ?auto_691844 ?auto_691846 ) ) ( not ( = ?auto_691844 ?auto_691847 ) ) ( not ( = ?auto_691844 ?auto_691848 ) ) ( not ( = ?auto_691844 ?auto_691849 ) ) ( not ( = ?auto_691844 ?auto_691850 ) ) ( not ( = ?auto_691844 ?auto_691851 ) ) ( not ( = ?auto_691844 ?auto_691852 ) ) ( not ( = ?auto_691844 ?auto_691853 ) ) ( not ( = ?auto_691844 ?auto_691854 ) ) ( not ( = ?auto_691844 ?auto_691855 ) ) ( not ( = ?auto_691844 ?auto_691856 ) ) ( not ( = ?auto_691845 ?auto_691846 ) ) ( not ( = ?auto_691845 ?auto_691847 ) ) ( not ( = ?auto_691845 ?auto_691848 ) ) ( not ( = ?auto_691845 ?auto_691849 ) ) ( not ( = ?auto_691845 ?auto_691850 ) ) ( not ( = ?auto_691845 ?auto_691851 ) ) ( not ( = ?auto_691845 ?auto_691852 ) ) ( not ( = ?auto_691845 ?auto_691853 ) ) ( not ( = ?auto_691845 ?auto_691854 ) ) ( not ( = ?auto_691845 ?auto_691855 ) ) ( not ( = ?auto_691845 ?auto_691856 ) ) ( not ( = ?auto_691846 ?auto_691847 ) ) ( not ( = ?auto_691846 ?auto_691848 ) ) ( not ( = ?auto_691846 ?auto_691849 ) ) ( not ( = ?auto_691846 ?auto_691850 ) ) ( not ( = ?auto_691846 ?auto_691851 ) ) ( not ( = ?auto_691846 ?auto_691852 ) ) ( not ( = ?auto_691846 ?auto_691853 ) ) ( not ( = ?auto_691846 ?auto_691854 ) ) ( not ( = ?auto_691846 ?auto_691855 ) ) ( not ( = ?auto_691846 ?auto_691856 ) ) ( not ( = ?auto_691847 ?auto_691848 ) ) ( not ( = ?auto_691847 ?auto_691849 ) ) ( not ( = ?auto_691847 ?auto_691850 ) ) ( not ( = ?auto_691847 ?auto_691851 ) ) ( not ( = ?auto_691847 ?auto_691852 ) ) ( not ( = ?auto_691847 ?auto_691853 ) ) ( not ( = ?auto_691847 ?auto_691854 ) ) ( not ( = ?auto_691847 ?auto_691855 ) ) ( not ( = ?auto_691847 ?auto_691856 ) ) ( not ( = ?auto_691848 ?auto_691849 ) ) ( not ( = ?auto_691848 ?auto_691850 ) ) ( not ( = ?auto_691848 ?auto_691851 ) ) ( not ( = ?auto_691848 ?auto_691852 ) ) ( not ( = ?auto_691848 ?auto_691853 ) ) ( not ( = ?auto_691848 ?auto_691854 ) ) ( not ( = ?auto_691848 ?auto_691855 ) ) ( not ( = ?auto_691848 ?auto_691856 ) ) ( not ( = ?auto_691849 ?auto_691850 ) ) ( not ( = ?auto_691849 ?auto_691851 ) ) ( not ( = ?auto_691849 ?auto_691852 ) ) ( not ( = ?auto_691849 ?auto_691853 ) ) ( not ( = ?auto_691849 ?auto_691854 ) ) ( not ( = ?auto_691849 ?auto_691855 ) ) ( not ( = ?auto_691849 ?auto_691856 ) ) ( not ( = ?auto_691850 ?auto_691851 ) ) ( not ( = ?auto_691850 ?auto_691852 ) ) ( not ( = ?auto_691850 ?auto_691853 ) ) ( not ( = ?auto_691850 ?auto_691854 ) ) ( not ( = ?auto_691850 ?auto_691855 ) ) ( not ( = ?auto_691850 ?auto_691856 ) ) ( not ( = ?auto_691851 ?auto_691852 ) ) ( not ( = ?auto_691851 ?auto_691853 ) ) ( not ( = ?auto_691851 ?auto_691854 ) ) ( not ( = ?auto_691851 ?auto_691855 ) ) ( not ( = ?auto_691851 ?auto_691856 ) ) ( not ( = ?auto_691852 ?auto_691853 ) ) ( not ( = ?auto_691852 ?auto_691854 ) ) ( not ( = ?auto_691852 ?auto_691855 ) ) ( not ( = ?auto_691852 ?auto_691856 ) ) ( not ( = ?auto_691853 ?auto_691854 ) ) ( not ( = ?auto_691853 ?auto_691855 ) ) ( not ( = ?auto_691853 ?auto_691856 ) ) ( not ( = ?auto_691854 ?auto_691855 ) ) ( not ( = ?auto_691854 ?auto_691856 ) ) ( not ( = ?auto_691855 ?auto_691856 ) ) ( ON ?auto_691854 ?auto_691855 ) ( CLEAR ?auto_691852 ) ( ON ?auto_691853 ?auto_691854 ) ( CLEAR ?auto_691853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_691841 ?auto_691842 ?auto_691843 ?auto_691844 ?auto_691845 ?auto_691846 ?auto_691847 ?auto_691848 ?auto_691849 ?auto_691850 ?auto_691851 ?auto_691852 ?auto_691853 )
      ( MAKE-15PILE ?auto_691841 ?auto_691842 ?auto_691843 ?auto_691844 ?auto_691845 ?auto_691846 ?auto_691847 ?auto_691848 ?auto_691849 ?auto_691850 ?auto_691851 ?auto_691852 ?auto_691853 ?auto_691854 ?auto_691855 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_691903 - BLOCK
      ?auto_691904 - BLOCK
      ?auto_691905 - BLOCK
      ?auto_691906 - BLOCK
      ?auto_691907 - BLOCK
      ?auto_691908 - BLOCK
      ?auto_691909 - BLOCK
      ?auto_691910 - BLOCK
      ?auto_691911 - BLOCK
      ?auto_691912 - BLOCK
      ?auto_691913 - BLOCK
      ?auto_691914 - BLOCK
      ?auto_691915 - BLOCK
      ?auto_691916 - BLOCK
      ?auto_691917 - BLOCK
    )
    :vars
    (
      ?auto_691918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691917 ?auto_691918 ) ( ON-TABLE ?auto_691903 ) ( ON ?auto_691904 ?auto_691903 ) ( ON ?auto_691905 ?auto_691904 ) ( ON ?auto_691906 ?auto_691905 ) ( ON ?auto_691907 ?auto_691906 ) ( ON ?auto_691908 ?auto_691907 ) ( ON ?auto_691909 ?auto_691908 ) ( ON ?auto_691910 ?auto_691909 ) ( ON ?auto_691911 ?auto_691910 ) ( ON ?auto_691912 ?auto_691911 ) ( ON ?auto_691913 ?auto_691912 ) ( not ( = ?auto_691903 ?auto_691904 ) ) ( not ( = ?auto_691903 ?auto_691905 ) ) ( not ( = ?auto_691903 ?auto_691906 ) ) ( not ( = ?auto_691903 ?auto_691907 ) ) ( not ( = ?auto_691903 ?auto_691908 ) ) ( not ( = ?auto_691903 ?auto_691909 ) ) ( not ( = ?auto_691903 ?auto_691910 ) ) ( not ( = ?auto_691903 ?auto_691911 ) ) ( not ( = ?auto_691903 ?auto_691912 ) ) ( not ( = ?auto_691903 ?auto_691913 ) ) ( not ( = ?auto_691903 ?auto_691914 ) ) ( not ( = ?auto_691903 ?auto_691915 ) ) ( not ( = ?auto_691903 ?auto_691916 ) ) ( not ( = ?auto_691903 ?auto_691917 ) ) ( not ( = ?auto_691903 ?auto_691918 ) ) ( not ( = ?auto_691904 ?auto_691905 ) ) ( not ( = ?auto_691904 ?auto_691906 ) ) ( not ( = ?auto_691904 ?auto_691907 ) ) ( not ( = ?auto_691904 ?auto_691908 ) ) ( not ( = ?auto_691904 ?auto_691909 ) ) ( not ( = ?auto_691904 ?auto_691910 ) ) ( not ( = ?auto_691904 ?auto_691911 ) ) ( not ( = ?auto_691904 ?auto_691912 ) ) ( not ( = ?auto_691904 ?auto_691913 ) ) ( not ( = ?auto_691904 ?auto_691914 ) ) ( not ( = ?auto_691904 ?auto_691915 ) ) ( not ( = ?auto_691904 ?auto_691916 ) ) ( not ( = ?auto_691904 ?auto_691917 ) ) ( not ( = ?auto_691904 ?auto_691918 ) ) ( not ( = ?auto_691905 ?auto_691906 ) ) ( not ( = ?auto_691905 ?auto_691907 ) ) ( not ( = ?auto_691905 ?auto_691908 ) ) ( not ( = ?auto_691905 ?auto_691909 ) ) ( not ( = ?auto_691905 ?auto_691910 ) ) ( not ( = ?auto_691905 ?auto_691911 ) ) ( not ( = ?auto_691905 ?auto_691912 ) ) ( not ( = ?auto_691905 ?auto_691913 ) ) ( not ( = ?auto_691905 ?auto_691914 ) ) ( not ( = ?auto_691905 ?auto_691915 ) ) ( not ( = ?auto_691905 ?auto_691916 ) ) ( not ( = ?auto_691905 ?auto_691917 ) ) ( not ( = ?auto_691905 ?auto_691918 ) ) ( not ( = ?auto_691906 ?auto_691907 ) ) ( not ( = ?auto_691906 ?auto_691908 ) ) ( not ( = ?auto_691906 ?auto_691909 ) ) ( not ( = ?auto_691906 ?auto_691910 ) ) ( not ( = ?auto_691906 ?auto_691911 ) ) ( not ( = ?auto_691906 ?auto_691912 ) ) ( not ( = ?auto_691906 ?auto_691913 ) ) ( not ( = ?auto_691906 ?auto_691914 ) ) ( not ( = ?auto_691906 ?auto_691915 ) ) ( not ( = ?auto_691906 ?auto_691916 ) ) ( not ( = ?auto_691906 ?auto_691917 ) ) ( not ( = ?auto_691906 ?auto_691918 ) ) ( not ( = ?auto_691907 ?auto_691908 ) ) ( not ( = ?auto_691907 ?auto_691909 ) ) ( not ( = ?auto_691907 ?auto_691910 ) ) ( not ( = ?auto_691907 ?auto_691911 ) ) ( not ( = ?auto_691907 ?auto_691912 ) ) ( not ( = ?auto_691907 ?auto_691913 ) ) ( not ( = ?auto_691907 ?auto_691914 ) ) ( not ( = ?auto_691907 ?auto_691915 ) ) ( not ( = ?auto_691907 ?auto_691916 ) ) ( not ( = ?auto_691907 ?auto_691917 ) ) ( not ( = ?auto_691907 ?auto_691918 ) ) ( not ( = ?auto_691908 ?auto_691909 ) ) ( not ( = ?auto_691908 ?auto_691910 ) ) ( not ( = ?auto_691908 ?auto_691911 ) ) ( not ( = ?auto_691908 ?auto_691912 ) ) ( not ( = ?auto_691908 ?auto_691913 ) ) ( not ( = ?auto_691908 ?auto_691914 ) ) ( not ( = ?auto_691908 ?auto_691915 ) ) ( not ( = ?auto_691908 ?auto_691916 ) ) ( not ( = ?auto_691908 ?auto_691917 ) ) ( not ( = ?auto_691908 ?auto_691918 ) ) ( not ( = ?auto_691909 ?auto_691910 ) ) ( not ( = ?auto_691909 ?auto_691911 ) ) ( not ( = ?auto_691909 ?auto_691912 ) ) ( not ( = ?auto_691909 ?auto_691913 ) ) ( not ( = ?auto_691909 ?auto_691914 ) ) ( not ( = ?auto_691909 ?auto_691915 ) ) ( not ( = ?auto_691909 ?auto_691916 ) ) ( not ( = ?auto_691909 ?auto_691917 ) ) ( not ( = ?auto_691909 ?auto_691918 ) ) ( not ( = ?auto_691910 ?auto_691911 ) ) ( not ( = ?auto_691910 ?auto_691912 ) ) ( not ( = ?auto_691910 ?auto_691913 ) ) ( not ( = ?auto_691910 ?auto_691914 ) ) ( not ( = ?auto_691910 ?auto_691915 ) ) ( not ( = ?auto_691910 ?auto_691916 ) ) ( not ( = ?auto_691910 ?auto_691917 ) ) ( not ( = ?auto_691910 ?auto_691918 ) ) ( not ( = ?auto_691911 ?auto_691912 ) ) ( not ( = ?auto_691911 ?auto_691913 ) ) ( not ( = ?auto_691911 ?auto_691914 ) ) ( not ( = ?auto_691911 ?auto_691915 ) ) ( not ( = ?auto_691911 ?auto_691916 ) ) ( not ( = ?auto_691911 ?auto_691917 ) ) ( not ( = ?auto_691911 ?auto_691918 ) ) ( not ( = ?auto_691912 ?auto_691913 ) ) ( not ( = ?auto_691912 ?auto_691914 ) ) ( not ( = ?auto_691912 ?auto_691915 ) ) ( not ( = ?auto_691912 ?auto_691916 ) ) ( not ( = ?auto_691912 ?auto_691917 ) ) ( not ( = ?auto_691912 ?auto_691918 ) ) ( not ( = ?auto_691913 ?auto_691914 ) ) ( not ( = ?auto_691913 ?auto_691915 ) ) ( not ( = ?auto_691913 ?auto_691916 ) ) ( not ( = ?auto_691913 ?auto_691917 ) ) ( not ( = ?auto_691913 ?auto_691918 ) ) ( not ( = ?auto_691914 ?auto_691915 ) ) ( not ( = ?auto_691914 ?auto_691916 ) ) ( not ( = ?auto_691914 ?auto_691917 ) ) ( not ( = ?auto_691914 ?auto_691918 ) ) ( not ( = ?auto_691915 ?auto_691916 ) ) ( not ( = ?auto_691915 ?auto_691917 ) ) ( not ( = ?auto_691915 ?auto_691918 ) ) ( not ( = ?auto_691916 ?auto_691917 ) ) ( not ( = ?auto_691916 ?auto_691918 ) ) ( not ( = ?auto_691917 ?auto_691918 ) ) ( ON ?auto_691916 ?auto_691917 ) ( ON ?auto_691915 ?auto_691916 ) ( CLEAR ?auto_691913 ) ( ON ?auto_691914 ?auto_691915 ) ( CLEAR ?auto_691914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_691903 ?auto_691904 ?auto_691905 ?auto_691906 ?auto_691907 ?auto_691908 ?auto_691909 ?auto_691910 ?auto_691911 ?auto_691912 ?auto_691913 ?auto_691914 )
      ( MAKE-15PILE ?auto_691903 ?auto_691904 ?auto_691905 ?auto_691906 ?auto_691907 ?auto_691908 ?auto_691909 ?auto_691910 ?auto_691911 ?auto_691912 ?auto_691913 ?auto_691914 ?auto_691915 ?auto_691916 ?auto_691917 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_691965 - BLOCK
      ?auto_691966 - BLOCK
      ?auto_691967 - BLOCK
      ?auto_691968 - BLOCK
      ?auto_691969 - BLOCK
      ?auto_691970 - BLOCK
      ?auto_691971 - BLOCK
      ?auto_691972 - BLOCK
      ?auto_691973 - BLOCK
      ?auto_691974 - BLOCK
      ?auto_691975 - BLOCK
      ?auto_691976 - BLOCK
      ?auto_691977 - BLOCK
      ?auto_691978 - BLOCK
      ?auto_691979 - BLOCK
    )
    :vars
    (
      ?auto_691980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_691979 ?auto_691980 ) ( ON-TABLE ?auto_691965 ) ( ON ?auto_691966 ?auto_691965 ) ( ON ?auto_691967 ?auto_691966 ) ( ON ?auto_691968 ?auto_691967 ) ( ON ?auto_691969 ?auto_691968 ) ( ON ?auto_691970 ?auto_691969 ) ( ON ?auto_691971 ?auto_691970 ) ( ON ?auto_691972 ?auto_691971 ) ( ON ?auto_691973 ?auto_691972 ) ( ON ?auto_691974 ?auto_691973 ) ( not ( = ?auto_691965 ?auto_691966 ) ) ( not ( = ?auto_691965 ?auto_691967 ) ) ( not ( = ?auto_691965 ?auto_691968 ) ) ( not ( = ?auto_691965 ?auto_691969 ) ) ( not ( = ?auto_691965 ?auto_691970 ) ) ( not ( = ?auto_691965 ?auto_691971 ) ) ( not ( = ?auto_691965 ?auto_691972 ) ) ( not ( = ?auto_691965 ?auto_691973 ) ) ( not ( = ?auto_691965 ?auto_691974 ) ) ( not ( = ?auto_691965 ?auto_691975 ) ) ( not ( = ?auto_691965 ?auto_691976 ) ) ( not ( = ?auto_691965 ?auto_691977 ) ) ( not ( = ?auto_691965 ?auto_691978 ) ) ( not ( = ?auto_691965 ?auto_691979 ) ) ( not ( = ?auto_691965 ?auto_691980 ) ) ( not ( = ?auto_691966 ?auto_691967 ) ) ( not ( = ?auto_691966 ?auto_691968 ) ) ( not ( = ?auto_691966 ?auto_691969 ) ) ( not ( = ?auto_691966 ?auto_691970 ) ) ( not ( = ?auto_691966 ?auto_691971 ) ) ( not ( = ?auto_691966 ?auto_691972 ) ) ( not ( = ?auto_691966 ?auto_691973 ) ) ( not ( = ?auto_691966 ?auto_691974 ) ) ( not ( = ?auto_691966 ?auto_691975 ) ) ( not ( = ?auto_691966 ?auto_691976 ) ) ( not ( = ?auto_691966 ?auto_691977 ) ) ( not ( = ?auto_691966 ?auto_691978 ) ) ( not ( = ?auto_691966 ?auto_691979 ) ) ( not ( = ?auto_691966 ?auto_691980 ) ) ( not ( = ?auto_691967 ?auto_691968 ) ) ( not ( = ?auto_691967 ?auto_691969 ) ) ( not ( = ?auto_691967 ?auto_691970 ) ) ( not ( = ?auto_691967 ?auto_691971 ) ) ( not ( = ?auto_691967 ?auto_691972 ) ) ( not ( = ?auto_691967 ?auto_691973 ) ) ( not ( = ?auto_691967 ?auto_691974 ) ) ( not ( = ?auto_691967 ?auto_691975 ) ) ( not ( = ?auto_691967 ?auto_691976 ) ) ( not ( = ?auto_691967 ?auto_691977 ) ) ( not ( = ?auto_691967 ?auto_691978 ) ) ( not ( = ?auto_691967 ?auto_691979 ) ) ( not ( = ?auto_691967 ?auto_691980 ) ) ( not ( = ?auto_691968 ?auto_691969 ) ) ( not ( = ?auto_691968 ?auto_691970 ) ) ( not ( = ?auto_691968 ?auto_691971 ) ) ( not ( = ?auto_691968 ?auto_691972 ) ) ( not ( = ?auto_691968 ?auto_691973 ) ) ( not ( = ?auto_691968 ?auto_691974 ) ) ( not ( = ?auto_691968 ?auto_691975 ) ) ( not ( = ?auto_691968 ?auto_691976 ) ) ( not ( = ?auto_691968 ?auto_691977 ) ) ( not ( = ?auto_691968 ?auto_691978 ) ) ( not ( = ?auto_691968 ?auto_691979 ) ) ( not ( = ?auto_691968 ?auto_691980 ) ) ( not ( = ?auto_691969 ?auto_691970 ) ) ( not ( = ?auto_691969 ?auto_691971 ) ) ( not ( = ?auto_691969 ?auto_691972 ) ) ( not ( = ?auto_691969 ?auto_691973 ) ) ( not ( = ?auto_691969 ?auto_691974 ) ) ( not ( = ?auto_691969 ?auto_691975 ) ) ( not ( = ?auto_691969 ?auto_691976 ) ) ( not ( = ?auto_691969 ?auto_691977 ) ) ( not ( = ?auto_691969 ?auto_691978 ) ) ( not ( = ?auto_691969 ?auto_691979 ) ) ( not ( = ?auto_691969 ?auto_691980 ) ) ( not ( = ?auto_691970 ?auto_691971 ) ) ( not ( = ?auto_691970 ?auto_691972 ) ) ( not ( = ?auto_691970 ?auto_691973 ) ) ( not ( = ?auto_691970 ?auto_691974 ) ) ( not ( = ?auto_691970 ?auto_691975 ) ) ( not ( = ?auto_691970 ?auto_691976 ) ) ( not ( = ?auto_691970 ?auto_691977 ) ) ( not ( = ?auto_691970 ?auto_691978 ) ) ( not ( = ?auto_691970 ?auto_691979 ) ) ( not ( = ?auto_691970 ?auto_691980 ) ) ( not ( = ?auto_691971 ?auto_691972 ) ) ( not ( = ?auto_691971 ?auto_691973 ) ) ( not ( = ?auto_691971 ?auto_691974 ) ) ( not ( = ?auto_691971 ?auto_691975 ) ) ( not ( = ?auto_691971 ?auto_691976 ) ) ( not ( = ?auto_691971 ?auto_691977 ) ) ( not ( = ?auto_691971 ?auto_691978 ) ) ( not ( = ?auto_691971 ?auto_691979 ) ) ( not ( = ?auto_691971 ?auto_691980 ) ) ( not ( = ?auto_691972 ?auto_691973 ) ) ( not ( = ?auto_691972 ?auto_691974 ) ) ( not ( = ?auto_691972 ?auto_691975 ) ) ( not ( = ?auto_691972 ?auto_691976 ) ) ( not ( = ?auto_691972 ?auto_691977 ) ) ( not ( = ?auto_691972 ?auto_691978 ) ) ( not ( = ?auto_691972 ?auto_691979 ) ) ( not ( = ?auto_691972 ?auto_691980 ) ) ( not ( = ?auto_691973 ?auto_691974 ) ) ( not ( = ?auto_691973 ?auto_691975 ) ) ( not ( = ?auto_691973 ?auto_691976 ) ) ( not ( = ?auto_691973 ?auto_691977 ) ) ( not ( = ?auto_691973 ?auto_691978 ) ) ( not ( = ?auto_691973 ?auto_691979 ) ) ( not ( = ?auto_691973 ?auto_691980 ) ) ( not ( = ?auto_691974 ?auto_691975 ) ) ( not ( = ?auto_691974 ?auto_691976 ) ) ( not ( = ?auto_691974 ?auto_691977 ) ) ( not ( = ?auto_691974 ?auto_691978 ) ) ( not ( = ?auto_691974 ?auto_691979 ) ) ( not ( = ?auto_691974 ?auto_691980 ) ) ( not ( = ?auto_691975 ?auto_691976 ) ) ( not ( = ?auto_691975 ?auto_691977 ) ) ( not ( = ?auto_691975 ?auto_691978 ) ) ( not ( = ?auto_691975 ?auto_691979 ) ) ( not ( = ?auto_691975 ?auto_691980 ) ) ( not ( = ?auto_691976 ?auto_691977 ) ) ( not ( = ?auto_691976 ?auto_691978 ) ) ( not ( = ?auto_691976 ?auto_691979 ) ) ( not ( = ?auto_691976 ?auto_691980 ) ) ( not ( = ?auto_691977 ?auto_691978 ) ) ( not ( = ?auto_691977 ?auto_691979 ) ) ( not ( = ?auto_691977 ?auto_691980 ) ) ( not ( = ?auto_691978 ?auto_691979 ) ) ( not ( = ?auto_691978 ?auto_691980 ) ) ( not ( = ?auto_691979 ?auto_691980 ) ) ( ON ?auto_691978 ?auto_691979 ) ( ON ?auto_691977 ?auto_691978 ) ( ON ?auto_691976 ?auto_691977 ) ( CLEAR ?auto_691974 ) ( ON ?auto_691975 ?auto_691976 ) ( CLEAR ?auto_691975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_691965 ?auto_691966 ?auto_691967 ?auto_691968 ?auto_691969 ?auto_691970 ?auto_691971 ?auto_691972 ?auto_691973 ?auto_691974 ?auto_691975 )
      ( MAKE-15PILE ?auto_691965 ?auto_691966 ?auto_691967 ?auto_691968 ?auto_691969 ?auto_691970 ?auto_691971 ?auto_691972 ?auto_691973 ?auto_691974 ?auto_691975 ?auto_691976 ?auto_691977 ?auto_691978 ?auto_691979 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_692027 - BLOCK
      ?auto_692028 - BLOCK
      ?auto_692029 - BLOCK
      ?auto_692030 - BLOCK
      ?auto_692031 - BLOCK
      ?auto_692032 - BLOCK
      ?auto_692033 - BLOCK
      ?auto_692034 - BLOCK
      ?auto_692035 - BLOCK
      ?auto_692036 - BLOCK
      ?auto_692037 - BLOCK
      ?auto_692038 - BLOCK
      ?auto_692039 - BLOCK
      ?auto_692040 - BLOCK
      ?auto_692041 - BLOCK
    )
    :vars
    (
      ?auto_692042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692041 ?auto_692042 ) ( ON-TABLE ?auto_692027 ) ( ON ?auto_692028 ?auto_692027 ) ( ON ?auto_692029 ?auto_692028 ) ( ON ?auto_692030 ?auto_692029 ) ( ON ?auto_692031 ?auto_692030 ) ( ON ?auto_692032 ?auto_692031 ) ( ON ?auto_692033 ?auto_692032 ) ( ON ?auto_692034 ?auto_692033 ) ( ON ?auto_692035 ?auto_692034 ) ( not ( = ?auto_692027 ?auto_692028 ) ) ( not ( = ?auto_692027 ?auto_692029 ) ) ( not ( = ?auto_692027 ?auto_692030 ) ) ( not ( = ?auto_692027 ?auto_692031 ) ) ( not ( = ?auto_692027 ?auto_692032 ) ) ( not ( = ?auto_692027 ?auto_692033 ) ) ( not ( = ?auto_692027 ?auto_692034 ) ) ( not ( = ?auto_692027 ?auto_692035 ) ) ( not ( = ?auto_692027 ?auto_692036 ) ) ( not ( = ?auto_692027 ?auto_692037 ) ) ( not ( = ?auto_692027 ?auto_692038 ) ) ( not ( = ?auto_692027 ?auto_692039 ) ) ( not ( = ?auto_692027 ?auto_692040 ) ) ( not ( = ?auto_692027 ?auto_692041 ) ) ( not ( = ?auto_692027 ?auto_692042 ) ) ( not ( = ?auto_692028 ?auto_692029 ) ) ( not ( = ?auto_692028 ?auto_692030 ) ) ( not ( = ?auto_692028 ?auto_692031 ) ) ( not ( = ?auto_692028 ?auto_692032 ) ) ( not ( = ?auto_692028 ?auto_692033 ) ) ( not ( = ?auto_692028 ?auto_692034 ) ) ( not ( = ?auto_692028 ?auto_692035 ) ) ( not ( = ?auto_692028 ?auto_692036 ) ) ( not ( = ?auto_692028 ?auto_692037 ) ) ( not ( = ?auto_692028 ?auto_692038 ) ) ( not ( = ?auto_692028 ?auto_692039 ) ) ( not ( = ?auto_692028 ?auto_692040 ) ) ( not ( = ?auto_692028 ?auto_692041 ) ) ( not ( = ?auto_692028 ?auto_692042 ) ) ( not ( = ?auto_692029 ?auto_692030 ) ) ( not ( = ?auto_692029 ?auto_692031 ) ) ( not ( = ?auto_692029 ?auto_692032 ) ) ( not ( = ?auto_692029 ?auto_692033 ) ) ( not ( = ?auto_692029 ?auto_692034 ) ) ( not ( = ?auto_692029 ?auto_692035 ) ) ( not ( = ?auto_692029 ?auto_692036 ) ) ( not ( = ?auto_692029 ?auto_692037 ) ) ( not ( = ?auto_692029 ?auto_692038 ) ) ( not ( = ?auto_692029 ?auto_692039 ) ) ( not ( = ?auto_692029 ?auto_692040 ) ) ( not ( = ?auto_692029 ?auto_692041 ) ) ( not ( = ?auto_692029 ?auto_692042 ) ) ( not ( = ?auto_692030 ?auto_692031 ) ) ( not ( = ?auto_692030 ?auto_692032 ) ) ( not ( = ?auto_692030 ?auto_692033 ) ) ( not ( = ?auto_692030 ?auto_692034 ) ) ( not ( = ?auto_692030 ?auto_692035 ) ) ( not ( = ?auto_692030 ?auto_692036 ) ) ( not ( = ?auto_692030 ?auto_692037 ) ) ( not ( = ?auto_692030 ?auto_692038 ) ) ( not ( = ?auto_692030 ?auto_692039 ) ) ( not ( = ?auto_692030 ?auto_692040 ) ) ( not ( = ?auto_692030 ?auto_692041 ) ) ( not ( = ?auto_692030 ?auto_692042 ) ) ( not ( = ?auto_692031 ?auto_692032 ) ) ( not ( = ?auto_692031 ?auto_692033 ) ) ( not ( = ?auto_692031 ?auto_692034 ) ) ( not ( = ?auto_692031 ?auto_692035 ) ) ( not ( = ?auto_692031 ?auto_692036 ) ) ( not ( = ?auto_692031 ?auto_692037 ) ) ( not ( = ?auto_692031 ?auto_692038 ) ) ( not ( = ?auto_692031 ?auto_692039 ) ) ( not ( = ?auto_692031 ?auto_692040 ) ) ( not ( = ?auto_692031 ?auto_692041 ) ) ( not ( = ?auto_692031 ?auto_692042 ) ) ( not ( = ?auto_692032 ?auto_692033 ) ) ( not ( = ?auto_692032 ?auto_692034 ) ) ( not ( = ?auto_692032 ?auto_692035 ) ) ( not ( = ?auto_692032 ?auto_692036 ) ) ( not ( = ?auto_692032 ?auto_692037 ) ) ( not ( = ?auto_692032 ?auto_692038 ) ) ( not ( = ?auto_692032 ?auto_692039 ) ) ( not ( = ?auto_692032 ?auto_692040 ) ) ( not ( = ?auto_692032 ?auto_692041 ) ) ( not ( = ?auto_692032 ?auto_692042 ) ) ( not ( = ?auto_692033 ?auto_692034 ) ) ( not ( = ?auto_692033 ?auto_692035 ) ) ( not ( = ?auto_692033 ?auto_692036 ) ) ( not ( = ?auto_692033 ?auto_692037 ) ) ( not ( = ?auto_692033 ?auto_692038 ) ) ( not ( = ?auto_692033 ?auto_692039 ) ) ( not ( = ?auto_692033 ?auto_692040 ) ) ( not ( = ?auto_692033 ?auto_692041 ) ) ( not ( = ?auto_692033 ?auto_692042 ) ) ( not ( = ?auto_692034 ?auto_692035 ) ) ( not ( = ?auto_692034 ?auto_692036 ) ) ( not ( = ?auto_692034 ?auto_692037 ) ) ( not ( = ?auto_692034 ?auto_692038 ) ) ( not ( = ?auto_692034 ?auto_692039 ) ) ( not ( = ?auto_692034 ?auto_692040 ) ) ( not ( = ?auto_692034 ?auto_692041 ) ) ( not ( = ?auto_692034 ?auto_692042 ) ) ( not ( = ?auto_692035 ?auto_692036 ) ) ( not ( = ?auto_692035 ?auto_692037 ) ) ( not ( = ?auto_692035 ?auto_692038 ) ) ( not ( = ?auto_692035 ?auto_692039 ) ) ( not ( = ?auto_692035 ?auto_692040 ) ) ( not ( = ?auto_692035 ?auto_692041 ) ) ( not ( = ?auto_692035 ?auto_692042 ) ) ( not ( = ?auto_692036 ?auto_692037 ) ) ( not ( = ?auto_692036 ?auto_692038 ) ) ( not ( = ?auto_692036 ?auto_692039 ) ) ( not ( = ?auto_692036 ?auto_692040 ) ) ( not ( = ?auto_692036 ?auto_692041 ) ) ( not ( = ?auto_692036 ?auto_692042 ) ) ( not ( = ?auto_692037 ?auto_692038 ) ) ( not ( = ?auto_692037 ?auto_692039 ) ) ( not ( = ?auto_692037 ?auto_692040 ) ) ( not ( = ?auto_692037 ?auto_692041 ) ) ( not ( = ?auto_692037 ?auto_692042 ) ) ( not ( = ?auto_692038 ?auto_692039 ) ) ( not ( = ?auto_692038 ?auto_692040 ) ) ( not ( = ?auto_692038 ?auto_692041 ) ) ( not ( = ?auto_692038 ?auto_692042 ) ) ( not ( = ?auto_692039 ?auto_692040 ) ) ( not ( = ?auto_692039 ?auto_692041 ) ) ( not ( = ?auto_692039 ?auto_692042 ) ) ( not ( = ?auto_692040 ?auto_692041 ) ) ( not ( = ?auto_692040 ?auto_692042 ) ) ( not ( = ?auto_692041 ?auto_692042 ) ) ( ON ?auto_692040 ?auto_692041 ) ( ON ?auto_692039 ?auto_692040 ) ( ON ?auto_692038 ?auto_692039 ) ( ON ?auto_692037 ?auto_692038 ) ( CLEAR ?auto_692035 ) ( ON ?auto_692036 ?auto_692037 ) ( CLEAR ?auto_692036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_692027 ?auto_692028 ?auto_692029 ?auto_692030 ?auto_692031 ?auto_692032 ?auto_692033 ?auto_692034 ?auto_692035 ?auto_692036 )
      ( MAKE-15PILE ?auto_692027 ?auto_692028 ?auto_692029 ?auto_692030 ?auto_692031 ?auto_692032 ?auto_692033 ?auto_692034 ?auto_692035 ?auto_692036 ?auto_692037 ?auto_692038 ?auto_692039 ?auto_692040 ?auto_692041 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_692089 - BLOCK
      ?auto_692090 - BLOCK
      ?auto_692091 - BLOCK
      ?auto_692092 - BLOCK
      ?auto_692093 - BLOCK
      ?auto_692094 - BLOCK
      ?auto_692095 - BLOCK
      ?auto_692096 - BLOCK
      ?auto_692097 - BLOCK
      ?auto_692098 - BLOCK
      ?auto_692099 - BLOCK
      ?auto_692100 - BLOCK
      ?auto_692101 - BLOCK
      ?auto_692102 - BLOCK
      ?auto_692103 - BLOCK
    )
    :vars
    (
      ?auto_692104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692103 ?auto_692104 ) ( ON-TABLE ?auto_692089 ) ( ON ?auto_692090 ?auto_692089 ) ( ON ?auto_692091 ?auto_692090 ) ( ON ?auto_692092 ?auto_692091 ) ( ON ?auto_692093 ?auto_692092 ) ( ON ?auto_692094 ?auto_692093 ) ( ON ?auto_692095 ?auto_692094 ) ( ON ?auto_692096 ?auto_692095 ) ( not ( = ?auto_692089 ?auto_692090 ) ) ( not ( = ?auto_692089 ?auto_692091 ) ) ( not ( = ?auto_692089 ?auto_692092 ) ) ( not ( = ?auto_692089 ?auto_692093 ) ) ( not ( = ?auto_692089 ?auto_692094 ) ) ( not ( = ?auto_692089 ?auto_692095 ) ) ( not ( = ?auto_692089 ?auto_692096 ) ) ( not ( = ?auto_692089 ?auto_692097 ) ) ( not ( = ?auto_692089 ?auto_692098 ) ) ( not ( = ?auto_692089 ?auto_692099 ) ) ( not ( = ?auto_692089 ?auto_692100 ) ) ( not ( = ?auto_692089 ?auto_692101 ) ) ( not ( = ?auto_692089 ?auto_692102 ) ) ( not ( = ?auto_692089 ?auto_692103 ) ) ( not ( = ?auto_692089 ?auto_692104 ) ) ( not ( = ?auto_692090 ?auto_692091 ) ) ( not ( = ?auto_692090 ?auto_692092 ) ) ( not ( = ?auto_692090 ?auto_692093 ) ) ( not ( = ?auto_692090 ?auto_692094 ) ) ( not ( = ?auto_692090 ?auto_692095 ) ) ( not ( = ?auto_692090 ?auto_692096 ) ) ( not ( = ?auto_692090 ?auto_692097 ) ) ( not ( = ?auto_692090 ?auto_692098 ) ) ( not ( = ?auto_692090 ?auto_692099 ) ) ( not ( = ?auto_692090 ?auto_692100 ) ) ( not ( = ?auto_692090 ?auto_692101 ) ) ( not ( = ?auto_692090 ?auto_692102 ) ) ( not ( = ?auto_692090 ?auto_692103 ) ) ( not ( = ?auto_692090 ?auto_692104 ) ) ( not ( = ?auto_692091 ?auto_692092 ) ) ( not ( = ?auto_692091 ?auto_692093 ) ) ( not ( = ?auto_692091 ?auto_692094 ) ) ( not ( = ?auto_692091 ?auto_692095 ) ) ( not ( = ?auto_692091 ?auto_692096 ) ) ( not ( = ?auto_692091 ?auto_692097 ) ) ( not ( = ?auto_692091 ?auto_692098 ) ) ( not ( = ?auto_692091 ?auto_692099 ) ) ( not ( = ?auto_692091 ?auto_692100 ) ) ( not ( = ?auto_692091 ?auto_692101 ) ) ( not ( = ?auto_692091 ?auto_692102 ) ) ( not ( = ?auto_692091 ?auto_692103 ) ) ( not ( = ?auto_692091 ?auto_692104 ) ) ( not ( = ?auto_692092 ?auto_692093 ) ) ( not ( = ?auto_692092 ?auto_692094 ) ) ( not ( = ?auto_692092 ?auto_692095 ) ) ( not ( = ?auto_692092 ?auto_692096 ) ) ( not ( = ?auto_692092 ?auto_692097 ) ) ( not ( = ?auto_692092 ?auto_692098 ) ) ( not ( = ?auto_692092 ?auto_692099 ) ) ( not ( = ?auto_692092 ?auto_692100 ) ) ( not ( = ?auto_692092 ?auto_692101 ) ) ( not ( = ?auto_692092 ?auto_692102 ) ) ( not ( = ?auto_692092 ?auto_692103 ) ) ( not ( = ?auto_692092 ?auto_692104 ) ) ( not ( = ?auto_692093 ?auto_692094 ) ) ( not ( = ?auto_692093 ?auto_692095 ) ) ( not ( = ?auto_692093 ?auto_692096 ) ) ( not ( = ?auto_692093 ?auto_692097 ) ) ( not ( = ?auto_692093 ?auto_692098 ) ) ( not ( = ?auto_692093 ?auto_692099 ) ) ( not ( = ?auto_692093 ?auto_692100 ) ) ( not ( = ?auto_692093 ?auto_692101 ) ) ( not ( = ?auto_692093 ?auto_692102 ) ) ( not ( = ?auto_692093 ?auto_692103 ) ) ( not ( = ?auto_692093 ?auto_692104 ) ) ( not ( = ?auto_692094 ?auto_692095 ) ) ( not ( = ?auto_692094 ?auto_692096 ) ) ( not ( = ?auto_692094 ?auto_692097 ) ) ( not ( = ?auto_692094 ?auto_692098 ) ) ( not ( = ?auto_692094 ?auto_692099 ) ) ( not ( = ?auto_692094 ?auto_692100 ) ) ( not ( = ?auto_692094 ?auto_692101 ) ) ( not ( = ?auto_692094 ?auto_692102 ) ) ( not ( = ?auto_692094 ?auto_692103 ) ) ( not ( = ?auto_692094 ?auto_692104 ) ) ( not ( = ?auto_692095 ?auto_692096 ) ) ( not ( = ?auto_692095 ?auto_692097 ) ) ( not ( = ?auto_692095 ?auto_692098 ) ) ( not ( = ?auto_692095 ?auto_692099 ) ) ( not ( = ?auto_692095 ?auto_692100 ) ) ( not ( = ?auto_692095 ?auto_692101 ) ) ( not ( = ?auto_692095 ?auto_692102 ) ) ( not ( = ?auto_692095 ?auto_692103 ) ) ( not ( = ?auto_692095 ?auto_692104 ) ) ( not ( = ?auto_692096 ?auto_692097 ) ) ( not ( = ?auto_692096 ?auto_692098 ) ) ( not ( = ?auto_692096 ?auto_692099 ) ) ( not ( = ?auto_692096 ?auto_692100 ) ) ( not ( = ?auto_692096 ?auto_692101 ) ) ( not ( = ?auto_692096 ?auto_692102 ) ) ( not ( = ?auto_692096 ?auto_692103 ) ) ( not ( = ?auto_692096 ?auto_692104 ) ) ( not ( = ?auto_692097 ?auto_692098 ) ) ( not ( = ?auto_692097 ?auto_692099 ) ) ( not ( = ?auto_692097 ?auto_692100 ) ) ( not ( = ?auto_692097 ?auto_692101 ) ) ( not ( = ?auto_692097 ?auto_692102 ) ) ( not ( = ?auto_692097 ?auto_692103 ) ) ( not ( = ?auto_692097 ?auto_692104 ) ) ( not ( = ?auto_692098 ?auto_692099 ) ) ( not ( = ?auto_692098 ?auto_692100 ) ) ( not ( = ?auto_692098 ?auto_692101 ) ) ( not ( = ?auto_692098 ?auto_692102 ) ) ( not ( = ?auto_692098 ?auto_692103 ) ) ( not ( = ?auto_692098 ?auto_692104 ) ) ( not ( = ?auto_692099 ?auto_692100 ) ) ( not ( = ?auto_692099 ?auto_692101 ) ) ( not ( = ?auto_692099 ?auto_692102 ) ) ( not ( = ?auto_692099 ?auto_692103 ) ) ( not ( = ?auto_692099 ?auto_692104 ) ) ( not ( = ?auto_692100 ?auto_692101 ) ) ( not ( = ?auto_692100 ?auto_692102 ) ) ( not ( = ?auto_692100 ?auto_692103 ) ) ( not ( = ?auto_692100 ?auto_692104 ) ) ( not ( = ?auto_692101 ?auto_692102 ) ) ( not ( = ?auto_692101 ?auto_692103 ) ) ( not ( = ?auto_692101 ?auto_692104 ) ) ( not ( = ?auto_692102 ?auto_692103 ) ) ( not ( = ?auto_692102 ?auto_692104 ) ) ( not ( = ?auto_692103 ?auto_692104 ) ) ( ON ?auto_692102 ?auto_692103 ) ( ON ?auto_692101 ?auto_692102 ) ( ON ?auto_692100 ?auto_692101 ) ( ON ?auto_692099 ?auto_692100 ) ( ON ?auto_692098 ?auto_692099 ) ( CLEAR ?auto_692096 ) ( ON ?auto_692097 ?auto_692098 ) ( CLEAR ?auto_692097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_692089 ?auto_692090 ?auto_692091 ?auto_692092 ?auto_692093 ?auto_692094 ?auto_692095 ?auto_692096 ?auto_692097 )
      ( MAKE-15PILE ?auto_692089 ?auto_692090 ?auto_692091 ?auto_692092 ?auto_692093 ?auto_692094 ?auto_692095 ?auto_692096 ?auto_692097 ?auto_692098 ?auto_692099 ?auto_692100 ?auto_692101 ?auto_692102 ?auto_692103 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_692151 - BLOCK
      ?auto_692152 - BLOCK
      ?auto_692153 - BLOCK
      ?auto_692154 - BLOCK
      ?auto_692155 - BLOCK
      ?auto_692156 - BLOCK
      ?auto_692157 - BLOCK
      ?auto_692158 - BLOCK
      ?auto_692159 - BLOCK
      ?auto_692160 - BLOCK
      ?auto_692161 - BLOCK
      ?auto_692162 - BLOCK
      ?auto_692163 - BLOCK
      ?auto_692164 - BLOCK
      ?auto_692165 - BLOCK
    )
    :vars
    (
      ?auto_692166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692165 ?auto_692166 ) ( ON-TABLE ?auto_692151 ) ( ON ?auto_692152 ?auto_692151 ) ( ON ?auto_692153 ?auto_692152 ) ( ON ?auto_692154 ?auto_692153 ) ( ON ?auto_692155 ?auto_692154 ) ( ON ?auto_692156 ?auto_692155 ) ( ON ?auto_692157 ?auto_692156 ) ( not ( = ?auto_692151 ?auto_692152 ) ) ( not ( = ?auto_692151 ?auto_692153 ) ) ( not ( = ?auto_692151 ?auto_692154 ) ) ( not ( = ?auto_692151 ?auto_692155 ) ) ( not ( = ?auto_692151 ?auto_692156 ) ) ( not ( = ?auto_692151 ?auto_692157 ) ) ( not ( = ?auto_692151 ?auto_692158 ) ) ( not ( = ?auto_692151 ?auto_692159 ) ) ( not ( = ?auto_692151 ?auto_692160 ) ) ( not ( = ?auto_692151 ?auto_692161 ) ) ( not ( = ?auto_692151 ?auto_692162 ) ) ( not ( = ?auto_692151 ?auto_692163 ) ) ( not ( = ?auto_692151 ?auto_692164 ) ) ( not ( = ?auto_692151 ?auto_692165 ) ) ( not ( = ?auto_692151 ?auto_692166 ) ) ( not ( = ?auto_692152 ?auto_692153 ) ) ( not ( = ?auto_692152 ?auto_692154 ) ) ( not ( = ?auto_692152 ?auto_692155 ) ) ( not ( = ?auto_692152 ?auto_692156 ) ) ( not ( = ?auto_692152 ?auto_692157 ) ) ( not ( = ?auto_692152 ?auto_692158 ) ) ( not ( = ?auto_692152 ?auto_692159 ) ) ( not ( = ?auto_692152 ?auto_692160 ) ) ( not ( = ?auto_692152 ?auto_692161 ) ) ( not ( = ?auto_692152 ?auto_692162 ) ) ( not ( = ?auto_692152 ?auto_692163 ) ) ( not ( = ?auto_692152 ?auto_692164 ) ) ( not ( = ?auto_692152 ?auto_692165 ) ) ( not ( = ?auto_692152 ?auto_692166 ) ) ( not ( = ?auto_692153 ?auto_692154 ) ) ( not ( = ?auto_692153 ?auto_692155 ) ) ( not ( = ?auto_692153 ?auto_692156 ) ) ( not ( = ?auto_692153 ?auto_692157 ) ) ( not ( = ?auto_692153 ?auto_692158 ) ) ( not ( = ?auto_692153 ?auto_692159 ) ) ( not ( = ?auto_692153 ?auto_692160 ) ) ( not ( = ?auto_692153 ?auto_692161 ) ) ( not ( = ?auto_692153 ?auto_692162 ) ) ( not ( = ?auto_692153 ?auto_692163 ) ) ( not ( = ?auto_692153 ?auto_692164 ) ) ( not ( = ?auto_692153 ?auto_692165 ) ) ( not ( = ?auto_692153 ?auto_692166 ) ) ( not ( = ?auto_692154 ?auto_692155 ) ) ( not ( = ?auto_692154 ?auto_692156 ) ) ( not ( = ?auto_692154 ?auto_692157 ) ) ( not ( = ?auto_692154 ?auto_692158 ) ) ( not ( = ?auto_692154 ?auto_692159 ) ) ( not ( = ?auto_692154 ?auto_692160 ) ) ( not ( = ?auto_692154 ?auto_692161 ) ) ( not ( = ?auto_692154 ?auto_692162 ) ) ( not ( = ?auto_692154 ?auto_692163 ) ) ( not ( = ?auto_692154 ?auto_692164 ) ) ( not ( = ?auto_692154 ?auto_692165 ) ) ( not ( = ?auto_692154 ?auto_692166 ) ) ( not ( = ?auto_692155 ?auto_692156 ) ) ( not ( = ?auto_692155 ?auto_692157 ) ) ( not ( = ?auto_692155 ?auto_692158 ) ) ( not ( = ?auto_692155 ?auto_692159 ) ) ( not ( = ?auto_692155 ?auto_692160 ) ) ( not ( = ?auto_692155 ?auto_692161 ) ) ( not ( = ?auto_692155 ?auto_692162 ) ) ( not ( = ?auto_692155 ?auto_692163 ) ) ( not ( = ?auto_692155 ?auto_692164 ) ) ( not ( = ?auto_692155 ?auto_692165 ) ) ( not ( = ?auto_692155 ?auto_692166 ) ) ( not ( = ?auto_692156 ?auto_692157 ) ) ( not ( = ?auto_692156 ?auto_692158 ) ) ( not ( = ?auto_692156 ?auto_692159 ) ) ( not ( = ?auto_692156 ?auto_692160 ) ) ( not ( = ?auto_692156 ?auto_692161 ) ) ( not ( = ?auto_692156 ?auto_692162 ) ) ( not ( = ?auto_692156 ?auto_692163 ) ) ( not ( = ?auto_692156 ?auto_692164 ) ) ( not ( = ?auto_692156 ?auto_692165 ) ) ( not ( = ?auto_692156 ?auto_692166 ) ) ( not ( = ?auto_692157 ?auto_692158 ) ) ( not ( = ?auto_692157 ?auto_692159 ) ) ( not ( = ?auto_692157 ?auto_692160 ) ) ( not ( = ?auto_692157 ?auto_692161 ) ) ( not ( = ?auto_692157 ?auto_692162 ) ) ( not ( = ?auto_692157 ?auto_692163 ) ) ( not ( = ?auto_692157 ?auto_692164 ) ) ( not ( = ?auto_692157 ?auto_692165 ) ) ( not ( = ?auto_692157 ?auto_692166 ) ) ( not ( = ?auto_692158 ?auto_692159 ) ) ( not ( = ?auto_692158 ?auto_692160 ) ) ( not ( = ?auto_692158 ?auto_692161 ) ) ( not ( = ?auto_692158 ?auto_692162 ) ) ( not ( = ?auto_692158 ?auto_692163 ) ) ( not ( = ?auto_692158 ?auto_692164 ) ) ( not ( = ?auto_692158 ?auto_692165 ) ) ( not ( = ?auto_692158 ?auto_692166 ) ) ( not ( = ?auto_692159 ?auto_692160 ) ) ( not ( = ?auto_692159 ?auto_692161 ) ) ( not ( = ?auto_692159 ?auto_692162 ) ) ( not ( = ?auto_692159 ?auto_692163 ) ) ( not ( = ?auto_692159 ?auto_692164 ) ) ( not ( = ?auto_692159 ?auto_692165 ) ) ( not ( = ?auto_692159 ?auto_692166 ) ) ( not ( = ?auto_692160 ?auto_692161 ) ) ( not ( = ?auto_692160 ?auto_692162 ) ) ( not ( = ?auto_692160 ?auto_692163 ) ) ( not ( = ?auto_692160 ?auto_692164 ) ) ( not ( = ?auto_692160 ?auto_692165 ) ) ( not ( = ?auto_692160 ?auto_692166 ) ) ( not ( = ?auto_692161 ?auto_692162 ) ) ( not ( = ?auto_692161 ?auto_692163 ) ) ( not ( = ?auto_692161 ?auto_692164 ) ) ( not ( = ?auto_692161 ?auto_692165 ) ) ( not ( = ?auto_692161 ?auto_692166 ) ) ( not ( = ?auto_692162 ?auto_692163 ) ) ( not ( = ?auto_692162 ?auto_692164 ) ) ( not ( = ?auto_692162 ?auto_692165 ) ) ( not ( = ?auto_692162 ?auto_692166 ) ) ( not ( = ?auto_692163 ?auto_692164 ) ) ( not ( = ?auto_692163 ?auto_692165 ) ) ( not ( = ?auto_692163 ?auto_692166 ) ) ( not ( = ?auto_692164 ?auto_692165 ) ) ( not ( = ?auto_692164 ?auto_692166 ) ) ( not ( = ?auto_692165 ?auto_692166 ) ) ( ON ?auto_692164 ?auto_692165 ) ( ON ?auto_692163 ?auto_692164 ) ( ON ?auto_692162 ?auto_692163 ) ( ON ?auto_692161 ?auto_692162 ) ( ON ?auto_692160 ?auto_692161 ) ( ON ?auto_692159 ?auto_692160 ) ( CLEAR ?auto_692157 ) ( ON ?auto_692158 ?auto_692159 ) ( CLEAR ?auto_692158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_692151 ?auto_692152 ?auto_692153 ?auto_692154 ?auto_692155 ?auto_692156 ?auto_692157 ?auto_692158 )
      ( MAKE-15PILE ?auto_692151 ?auto_692152 ?auto_692153 ?auto_692154 ?auto_692155 ?auto_692156 ?auto_692157 ?auto_692158 ?auto_692159 ?auto_692160 ?auto_692161 ?auto_692162 ?auto_692163 ?auto_692164 ?auto_692165 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_692213 - BLOCK
      ?auto_692214 - BLOCK
      ?auto_692215 - BLOCK
      ?auto_692216 - BLOCK
      ?auto_692217 - BLOCK
      ?auto_692218 - BLOCK
      ?auto_692219 - BLOCK
      ?auto_692220 - BLOCK
      ?auto_692221 - BLOCK
      ?auto_692222 - BLOCK
      ?auto_692223 - BLOCK
      ?auto_692224 - BLOCK
      ?auto_692225 - BLOCK
      ?auto_692226 - BLOCK
      ?auto_692227 - BLOCK
    )
    :vars
    (
      ?auto_692228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692227 ?auto_692228 ) ( ON-TABLE ?auto_692213 ) ( ON ?auto_692214 ?auto_692213 ) ( ON ?auto_692215 ?auto_692214 ) ( ON ?auto_692216 ?auto_692215 ) ( ON ?auto_692217 ?auto_692216 ) ( ON ?auto_692218 ?auto_692217 ) ( not ( = ?auto_692213 ?auto_692214 ) ) ( not ( = ?auto_692213 ?auto_692215 ) ) ( not ( = ?auto_692213 ?auto_692216 ) ) ( not ( = ?auto_692213 ?auto_692217 ) ) ( not ( = ?auto_692213 ?auto_692218 ) ) ( not ( = ?auto_692213 ?auto_692219 ) ) ( not ( = ?auto_692213 ?auto_692220 ) ) ( not ( = ?auto_692213 ?auto_692221 ) ) ( not ( = ?auto_692213 ?auto_692222 ) ) ( not ( = ?auto_692213 ?auto_692223 ) ) ( not ( = ?auto_692213 ?auto_692224 ) ) ( not ( = ?auto_692213 ?auto_692225 ) ) ( not ( = ?auto_692213 ?auto_692226 ) ) ( not ( = ?auto_692213 ?auto_692227 ) ) ( not ( = ?auto_692213 ?auto_692228 ) ) ( not ( = ?auto_692214 ?auto_692215 ) ) ( not ( = ?auto_692214 ?auto_692216 ) ) ( not ( = ?auto_692214 ?auto_692217 ) ) ( not ( = ?auto_692214 ?auto_692218 ) ) ( not ( = ?auto_692214 ?auto_692219 ) ) ( not ( = ?auto_692214 ?auto_692220 ) ) ( not ( = ?auto_692214 ?auto_692221 ) ) ( not ( = ?auto_692214 ?auto_692222 ) ) ( not ( = ?auto_692214 ?auto_692223 ) ) ( not ( = ?auto_692214 ?auto_692224 ) ) ( not ( = ?auto_692214 ?auto_692225 ) ) ( not ( = ?auto_692214 ?auto_692226 ) ) ( not ( = ?auto_692214 ?auto_692227 ) ) ( not ( = ?auto_692214 ?auto_692228 ) ) ( not ( = ?auto_692215 ?auto_692216 ) ) ( not ( = ?auto_692215 ?auto_692217 ) ) ( not ( = ?auto_692215 ?auto_692218 ) ) ( not ( = ?auto_692215 ?auto_692219 ) ) ( not ( = ?auto_692215 ?auto_692220 ) ) ( not ( = ?auto_692215 ?auto_692221 ) ) ( not ( = ?auto_692215 ?auto_692222 ) ) ( not ( = ?auto_692215 ?auto_692223 ) ) ( not ( = ?auto_692215 ?auto_692224 ) ) ( not ( = ?auto_692215 ?auto_692225 ) ) ( not ( = ?auto_692215 ?auto_692226 ) ) ( not ( = ?auto_692215 ?auto_692227 ) ) ( not ( = ?auto_692215 ?auto_692228 ) ) ( not ( = ?auto_692216 ?auto_692217 ) ) ( not ( = ?auto_692216 ?auto_692218 ) ) ( not ( = ?auto_692216 ?auto_692219 ) ) ( not ( = ?auto_692216 ?auto_692220 ) ) ( not ( = ?auto_692216 ?auto_692221 ) ) ( not ( = ?auto_692216 ?auto_692222 ) ) ( not ( = ?auto_692216 ?auto_692223 ) ) ( not ( = ?auto_692216 ?auto_692224 ) ) ( not ( = ?auto_692216 ?auto_692225 ) ) ( not ( = ?auto_692216 ?auto_692226 ) ) ( not ( = ?auto_692216 ?auto_692227 ) ) ( not ( = ?auto_692216 ?auto_692228 ) ) ( not ( = ?auto_692217 ?auto_692218 ) ) ( not ( = ?auto_692217 ?auto_692219 ) ) ( not ( = ?auto_692217 ?auto_692220 ) ) ( not ( = ?auto_692217 ?auto_692221 ) ) ( not ( = ?auto_692217 ?auto_692222 ) ) ( not ( = ?auto_692217 ?auto_692223 ) ) ( not ( = ?auto_692217 ?auto_692224 ) ) ( not ( = ?auto_692217 ?auto_692225 ) ) ( not ( = ?auto_692217 ?auto_692226 ) ) ( not ( = ?auto_692217 ?auto_692227 ) ) ( not ( = ?auto_692217 ?auto_692228 ) ) ( not ( = ?auto_692218 ?auto_692219 ) ) ( not ( = ?auto_692218 ?auto_692220 ) ) ( not ( = ?auto_692218 ?auto_692221 ) ) ( not ( = ?auto_692218 ?auto_692222 ) ) ( not ( = ?auto_692218 ?auto_692223 ) ) ( not ( = ?auto_692218 ?auto_692224 ) ) ( not ( = ?auto_692218 ?auto_692225 ) ) ( not ( = ?auto_692218 ?auto_692226 ) ) ( not ( = ?auto_692218 ?auto_692227 ) ) ( not ( = ?auto_692218 ?auto_692228 ) ) ( not ( = ?auto_692219 ?auto_692220 ) ) ( not ( = ?auto_692219 ?auto_692221 ) ) ( not ( = ?auto_692219 ?auto_692222 ) ) ( not ( = ?auto_692219 ?auto_692223 ) ) ( not ( = ?auto_692219 ?auto_692224 ) ) ( not ( = ?auto_692219 ?auto_692225 ) ) ( not ( = ?auto_692219 ?auto_692226 ) ) ( not ( = ?auto_692219 ?auto_692227 ) ) ( not ( = ?auto_692219 ?auto_692228 ) ) ( not ( = ?auto_692220 ?auto_692221 ) ) ( not ( = ?auto_692220 ?auto_692222 ) ) ( not ( = ?auto_692220 ?auto_692223 ) ) ( not ( = ?auto_692220 ?auto_692224 ) ) ( not ( = ?auto_692220 ?auto_692225 ) ) ( not ( = ?auto_692220 ?auto_692226 ) ) ( not ( = ?auto_692220 ?auto_692227 ) ) ( not ( = ?auto_692220 ?auto_692228 ) ) ( not ( = ?auto_692221 ?auto_692222 ) ) ( not ( = ?auto_692221 ?auto_692223 ) ) ( not ( = ?auto_692221 ?auto_692224 ) ) ( not ( = ?auto_692221 ?auto_692225 ) ) ( not ( = ?auto_692221 ?auto_692226 ) ) ( not ( = ?auto_692221 ?auto_692227 ) ) ( not ( = ?auto_692221 ?auto_692228 ) ) ( not ( = ?auto_692222 ?auto_692223 ) ) ( not ( = ?auto_692222 ?auto_692224 ) ) ( not ( = ?auto_692222 ?auto_692225 ) ) ( not ( = ?auto_692222 ?auto_692226 ) ) ( not ( = ?auto_692222 ?auto_692227 ) ) ( not ( = ?auto_692222 ?auto_692228 ) ) ( not ( = ?auto_692223 ?auto_692224 ) ) ( not ( = ?auto_692223 ?auto_692225 ) ) ( not ( = ?auto_692223 ?auto_692226 ) ) ( not ( = ?auto_692223 ?auto_692227 ) ) ( not ( = ?auto_692223 ?auto_692228 ) ) ( not ( = ?auto_692224 ?auto_692225 ) ) ( not ( = ?auto_692224 ?auto_692226 ) ) ( not ( = ?auto_692224 ?auto_692227 ) ) ( not ( = ?auto_692224 ?auto_692228 ) ) ( not ( = ?auto_692225 ?auto_692226 ) ) ( not ( = ?auto_692225 ?auto_692227 ) ) ( not ( = ?auto_692225 ?auto_692228 ) ) ( not ( = ?auto_692226 ?auto_692227 ) ) ( not ( = ?auto_692226 ?auto_692228 ) ) ( not ( = ?auto_692227 ?auto_692228 ) ) ( ON ?auto_692226 ?auto_692227 ) ( ON ?auto_692225 ?auto_692226 ) ( ON ?auto_692224 ?auto_692225 ) ( ON ?auto_692223 ?auto_692224 ) ( ON ?auto_692222 ?auto_692223 ) ( ON ?auto_692221 ?auto_692222 ) ( ON ?auto_692220 ?auto_692221 ) ( CLEAR ?auto_692218 ) ( ON ?auto_692219 ?auto_692220 ) ( CLEAR ?auto_692219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_692213 ?auto_692214 ?auto_692215 ?auto_692216 ?auto_692217 ?auto_692218 ?auto_692219 )
      ( MAKE-15PILE ?auto_692213 ?auto_692214 ?auto_692215 ?auto_692216 ?auto_692217 ?auto_692218 ?auto_692219 ?auto_692220 ?auto_692221 ?auto_692222 ?auto_692223 ?auto_692224 ?auto_692225 ?auto_692226 ?auto_692227 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_692275 - BLOCK
      ?auto_692276 - BLOCK
      ?auto_692277 - BLOCK
      ?auto_692278 - BLOCK
      ?auto_692279 - BLOCK
      ?auto_692280 - BLOCK
      ?auto_692281 - BLOCK
      ?auto_692282 - BLOCK
      ?auto_692283 - BLOCK
      ?auto_692284 - BLOCK
      ?auto_692285 - BLOCK
      ?auto_692286 - BLOCK
      ?auto_692287 - BLOCK
      ?auto_692288 - BLOCK
      ?auto_692289 - BLOCK
    )
    :vars
    (
      ?auto_692290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692289 ?auto_692290 ) ( ON-TABLE ?auto_692275 ) ( ON ?auto_692276 ?auto_692275 ) ( ON ?auto_692277 ?auto_692276 ) ( ON ?auto_692278 ?auto_692277 ) ( ON ?auto_692279 ?auto_692278 ) ( not ( = ?auto_692275 ?auto_692276 ) ) ( not ( = ?auto_692275 ?auto_692277 ) ) ( not ( = ?auto_692275 ?auto_692278 ) ) ( not ( = ?auto_692275 ?auto_692279 ) ) ( not ( = ?auto_692275 ?auto_692280 ) ) ( not ( = ?auto_692275 ?auto_692281 ) ) ( not ( = ?auto_692275 ?auto_692282 ) ) ( not ( = ?auto_692275 ?auto_692283 ) ) ( not ( = ?auto_692275 ?auto_692284 ) ) ( not ( = ?auto_692275 ?auto_692285 ) ) ( not ( = ?auto_692275 ?auto_692286 ) ) ( not ( = ?auto_692275 ?auto_692287 ) ) ( not ( = ?auto_692275 ?auto_692288 ) ) ( not ( = ?auto_692275 ?auto_692289 ) ) ( not ( = ?auto_692275 ?auto_692290 ) ) ( not ( = ?auto_692276 ?auto_692277 ) ) ( not ( = ?auto_692276 ?auto_692278 ) ) ( not ( = ?auto_692276 ?auto_692279 ) ) ( not ( = ?auto_692276 ?auto_692280 ) ) ( not ( = ?auto_692276 ?auto_692281 ) ) ( not ( = ?auto_692276 ?auto_692282 ) ) ( not ( = ?auto_692276 ?auto_692283 ) ) ( not ( = ?auto_692276 ?auto_692284 ) ) ( not ( = ?auto_692276 ?auto_692285 ) ) ( not ( = ?auto_692276 ?auto_692286 ) ) ( not ( = ?auto_692276 ?auto_692287 ) ) ( not ( = ?auto_692276 ?auto_692288 ) ) ( not ( = ?auto_692276 ?auto_692289 ) ) ( not ( = ?auto_692276 ?auto_692290 ) ) ( not ( = ?auto_692277 ?auto_692278 ) ) ( not ( = ?auto_692277 ?auto_692279 ) ) ( not ( = ?auto_692277 ?auto_692280 ) ) ( not ( = ?auto_692277 ?auto_692281 ) ) ( not ( = ?auto_692277 ?auto_692282 ) ) ( not ( = ?auto_692277 ?auto_692283 ) ) ( not ( = ?auto_692277 ?auto_692284 ) ) ( not ( = ?auto_692277 ?auto_692285 ) ) ( not ( = ?auto_692277 ?auto_692286 ) ) ( not ( = ?auto_692277 ?auto_692287 ) ) ( not ( = ?auto_692277 ?auto_692288 ) ) ( not ( = ?auto_692277 ?auto_692289 ) ) ( not ( = ?auto_692277 ?auto_692290 ) ) ( not ( = ?auto_692278 ?auto_692279 ) ) ( not ( = ?auto_692278 ?auto_692280 ) ) ( not ( = ?auto_692278 ?auto_692281 ) ) ( not ( = ?auto_692278 ?auto_692282 ) ) ( not ( = ?auto_692278 ?auto_692283 ) ) ( not ( = ?auto_692278 ?auto_692284 ) ) ( not ( = ?auto_692278 ?auto_692285 ) ) ( not ( = ?auto_692278 ?auto_692286 ) ) ( not ( = ?auto_692278 ?auto_692287 ) ) ( not ( = ?auto_692278 ?auto_692288 ) ) ( not ( = ?auto_692278 ?auto_692289 ) ) ( not ( = ?auto_692278 ?auto_692290 ) ) ( not ( = ?auto_692279 ?auto_692280 ) ) ( not ( = ?auto_692279 ?auto_692281 ) ) ( not ( = ?auto_692279 ?auto_692282 ) ) ( not ( = ?auto_692279 ?auto_692283 ) ) ( not ( = ?auto_692279 ?auto_692284 ) ) ( not ( = ?auto_692279 ?auto_692285 ) ) ( not ( = ?auto_692279 ?auto_692286 ) ) ( not ( = ?auto_692279 ?auto_692287 ) ) ( not ( = ?auto_692279 ?auto_692288 ) ) ( not ( = ?auto_692279 ?auto_692289 ) ) ( not ( = ?auto_692279 ?auto_692290 ) ) ( not ( = ?auto_692280 ?auto_692281 ) ) ( not ( = ?auto_692280 ?auto_692282 ) ) ( not ( = ?auto_692280 ?auto_692283 ) ) ( not ( = ?auto_692280 ?auto_692284 ) ) ( not ( = ?auto_692280 ?auto_692285 ) ) ( not ( = ?auto_692280 ?auto_692286 ) ) ( not ( = ?auto_692280 ?auto_692287 ) ) ( not ( = ?auto_692280 ?auto_692288 ) ) ( not ( = ?auto_692280 ?auto_692289 ) ) ( not ( = ?auto_692280 ?auto_692290 ) ) ( not ( = ?auto_692281 ?auto_692282 ) ) ( not ( = ?auto_692281 ?auto_692283 ) ) ( not ( = ?auto_692281 ?auto_692284 ) ) ( not ( = ?auto_692281 ?auto_692285 ) ) ( not ( = ?auto_692281 ?auto_692286 ) ) ( not ( = ?auto_692281 ?auto_692287 ) ) ( not ( = ?auto_692281 ?auto_692288 ) ) ( not ( = ?auto_692281 ?auto_692289 ) ) ( not ( = ?auto_692281 ?auto_692290 ) ) ( not ( = ?auto_692282 ?auto_692283 ) ) ( not ( = ?auto_692282 ?auto_692284 ) ) ( not ( = ?auto_692282 ?auto_692285 ) ) ( not ( = ?auto_692282 ?auto_692286 ) ) ( not ( = ?auto_692282 ?auto_692287 ) ) ( not ( = ?auto_692282 ?auto_692288 ) ) ( not ( = ?auto_692282 ?auto_692289 ) ) ( not ( = ?auto_692282 ?auto_692290 ) ) ( not ( = ?auto_692283 ?auto_692284 ) ) ( not ( = ?auto_692283 ?auto_692285 ) ) ( not ( = ?auto_692283 ?auto_692286 ) ) ( not ( = ?auto_692283 ?auto_692287 ) ) ( not ( = ?auto_692283 ?auto_692288 ) ) ( not ( = ?auto_692283 ?auto_692289 ) ) ( not ( = ?auto_692283 ?auto_692290 ) ) ( not ( = ?auto_692284 ?auto_692285 ) ) ( not ( = ?auto_692284 ?auto_692286 ) ) ( not ( = ?auto_692284 ?auto_692287 ) ) ( not ( = ?auto_692284 ?auto_692288 ) ) ( not ( = ?auto_692284 ?auto_692289 ) ) ( not ( = ?auto_692284 ?auto_692290 ) ) ( not ( = ?auto_692285 ?auto_692286 ) ) ( not ( = ?auto_692285 ?auto_692287 ) ) ( not ( = ?auto_692285 ?auto_692288 ) ) ( not ( = ?auto_692285 ?auto_692289 ) ) ( not ( = ?auto_692285 ?auto_692290 ) ) ( not ( = ?auto_692286 ?auto_692287 ) ) ( not ( = ?auto_692286 ?auto_692288 ) ) ( not ( = ?auto_692286 ?auto_692289 ) ) ( not ( = ?auto_692286 ?auto_692290 ) ) ( not ( = ?auto_692287 ?auto_692288 ) ) ( not ( = ?auto_692287 ?auto_692289 ) ) ( not ( = ?auto_692287 ?auto_692290 ) ) ( not ( = ?auto_692288 ?auto_692289 ) ) ( not ( = ?auto_692288 ?auto_692290 ) ) ( not ( = ?auto_692289 ?auto_692290 ) ) ( ON ?auto_692288 ?auto_692289 ) ( ON ?auto_692287 ?auto_692288 ) ( ON ?auto_692286 ?auto_692287 ) ( ON ?auto_692285 ?auto_692286 ) ( ON ?auto_692284 ?auto_692285 ) ( ON ?auto_692283 ?auto_692284 ) ( ON ?auto_692282 ?auto_692283 ) ( ON ?auto_692281 ?auto_692282 ) ( CLEAR ?auto_692279 ) ( ON ?auto_692280 ?auto_692281 ) ( CLEAR ?auto_692280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_692275 ?auto_692276 ?auto_692277 ?auto_692278 ?auto_692279 ?auto_692280 )
      ( MAKE-15PILE ?auto_692275 ?auto_692276 ?auto_692277 ?auto_692278 ?auto_692279 ?auto_692280 ?auto_692281 ?auto_692282 ?auto_692283 ?auto_692284 ?auto_692285 ?auto_692286 ?auto_692287 ?auto_692288 ?auto_692289 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_692337 - BLOCK
      ?auto_692338 - BLOCK
      ?auto_692339 - BLOCK
      ?auto_692340 - BLOCK
      ?auto_692341 - BLOCK
      ?auto_692342 - BLOCK
      ?auto_692343 - BLOCK
      ?auto_692344 - BLOCK
      ?auto_692345 - BLOCK
      ?auto_692346 - BLOCK
      ?auto_692347 - BLOCK
      ?auto_692348 - BLOCK
      ?auto_692349 - BLOCK
      ?auto_692350 - BLOCK
      ?auto_692351 - BLOCK
    )
    :vars
    (
      ?auto_692352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692351 ?auto_692352 ) ( ON-TABLE ?auto_692337 ) ( ON ?auto_692338 ?auto_692337 ) ( ON ?auto_692339 ?auto_692338 ) ( ON ?auto_692340 ?auto_692339 ) ( not ( = ?auto_692337 ?auto_692338 ) ) ( not ( = ?auto_692337 ?auto_692339 ) ) ( not ( = ?auto_692337 ?auto_692340 ) ) ( not ( = ?auto_692337 ?auto_692341 ) ) ( not ( = ?auto_692337 ?auto_692342 ) ) ( not ( = ?auto_692337 ?auto_692343 ) ) ( not ( = ?auto_692337 ?auto_692344 ) ) ( not ( = ?auto_692337 ?auto_692345 ) ) ( not ( = ?auto_692337 ?auto_692346 ) ) ( not ( = ?auto_692337 ?auto_692347 ) ) ( not ( = ?auto_692337 ?auto_692348 ) ) ( not ( = ?auto_692337 ?auto_692349 ) ) ( not ( = ?auto_692337 ?auto_692350 ) ) ( not ( = ?auto_692337 ?auto_692351 ) ) ( not ( = ?auto_692337 ?auto_692352 ) ) ( not ( = ?auto_692338 ?auto_692339 ) ) ( not ( = ?auto_692338 ?auto_692340 ) ) ( not ( = ?auto_692338 ?auto_692341 ) ) ( not ( = ?auto_692338 ?auto_692342 ) ) ( not ( = ?auto_692338 ?auto_692343 ) ) ( not ( = ?auto_692338 ?auto_692344 ) ) ( not ( = ?auto_692338 ?auto_692345 ) ) ( not ( = ?auto_692338 ?auto_692346 ) ) ( not ( = ?auto_692338 ?auto_692347 ) ) ( not ( = ?auto_692338 ?auto_692348 ) ) ( not ( = ?auto_692338 ?auto_692349 ) ) ( not ( = ?auto_692338 ?auto_692350 ) ) ( not ( = ?auto_692338 ?auto_692351 ) ) ( not ( = ?auto_692338 ?auto_692352 ) ) ( not ( = ?auto_692339 ?auto_692340 ) ) ( not ( = ?auto_692339 ?auto_692341 ) ) ( not ( = ?auto_692339 ?auto_692342 ) ) ( not ( = ?auto_692339 ?auto_692343 ) ) ( not ( = ?auto_692339 ?auto_692344 ) ) ( not ( = ?auto_692339 ?auto_692345 ) ) ( not ( = ?auto_692339 ?auto_692346 ) ) ( not ( = ?auto_692339 ?auto_692347 ) ) ( not ( = ?auto_692339 ?auto_692348 ) ) ( not ( = ?auto_692339 ?auto_692349 ) ) ( not ( = ?auto_692339 ?auto_692350 ) ) ( not ( = ?auto_692339 ?auto_692351 ) ) ( not ( = ?auto_692339 ?auto_692352 ) ) ( not ( = ?auto_692340 ?auto_692341 ) ) ( not ( = ?auto_692340 ?auto_692342 ) ) ( not ( = ?auto_692340 ?auto_692343 ) ) ( not ( = ?auto_692340 ?auto_692344 ) ) ( not ( = ?auto_692340 ?auto_692345 ) ) ( not ( = ?auto_692340 ?auto_692346 ) ) ( not ( = ?auto_692340 ?auto_692347 ) ) ( not ( = ?auto_692340 ?auto_692348 ) ) ( not ( = ?auto_692340 ?auto_692349 ) ) ( not ( = ?auto_692340 ?auto_692350 ) ) ( not ( = ?auto_692340 ?auto_692351 ) ) ( not ( = ?auto_692340 ?auto_692352 ) ) ( not ( = ?auto_692341 ?auto_692342 ) ) ( not ( = ?auto_692341 ?auto_692343 ) ) ( not ( = ?auto_692341 ?auto_692344 ) ) ( not ( = ?auto_692341 ?auto_692345 ) ) ( not ( = ?auto_692341 ?auto_692346 ) ) ( not ( = ?auto_692341 ?auto_692347 ) ) ( not ( = ?auto_692341 ?auto_692348 ) ) ( not ( = ?auto_692341 ?auto_692349 ) ) ( not ( = ?auto_692341 ?auto_692350 ) ) ( not ( = ?auto_692341 ?auto_692351 ) ) ( not ( = ?auto_692341 ?auto_692352 ) ) ( not ( = ?auto_692342 ?auto_692343 ) ) ( not ( = ?auto_692342 ?auto_692344 ) ) ( not ( = ?auto_692342 ?auto_692345 ) ) ( not ( = ?auto_692342 ?auto_692346 ) ) ( not ( = ?auto_692342 ?auto_692347 ) ) ( not ( = ?auto_692342 ?auto_692348 ) ) ( not ( = ?auto_692342 ?auto_692349 ) ) ( not ( = ?auto_692342 ?auto_692350 ) ) ( not ( = ?auto_692342 ?auto_692351 ) ) ( not ( = ?auto_692342 ?auto_692352 ) ) ( not ( = ?auto_692343 ?auto_692344 ) ) ( not ( = ?auto_692343 ?auto_692345 ) ) ( not ( = ?auto_692343 ?auto_692346 ) ) ( not ( = ?auto_692343 ?auto_692347 ) ) ( not ( = ?auto_692343 ?auto_692348 ) ) ( not ( = ?auto_692343 ?auto_692349 ) ) ( not ( = ?auto_692343 ?auto_692350 ) ) ( not ( = ?auto_692343 ?auto_692351 ) ) ( not ( = ?auto_692343 ?auto_692352 ) ) ( not ( = ?auto_692344 ?auto_692345 ) ) ( not ( = ?auto_692344 ?auto_692346 ) ) ( not ( = ?auto_692344 ?auto_692347 ) ) ( not ( = ?auto_692344 ?auto_692348 ) ) ( not ( = ?auto_692344 ?auto_692349 ) ) ( not ( = ?auto_692344 ?auto_692350 ) ) ( not ( = ?auto_692344 ?auto_692351 ) ) ( not ( = ?auto_692344 ?auto_692352 ) ) ( not ( = ?auto_692345 ?auto_692346 ) ) ( not ( = ?auto_692345 ?auto_692347 ) ) ( not ( = ?auto_692345 ?auto_692348 ) ) ( not ( = ?auto_692345 ?auto_692349 ) ) ( not ( = ?auto_692345 ?auto_692350 ) ) ( not ( = ?auto_692345 ?auto_692351 ) ) ( not ( = ?auto_692345 ?auto_692352 ) ) ( not ( = ?auto_692346 ?auto_692347 ) ) ( not ( = ?auto_692346 ?auto_692348 ) ) ( not ( = ?auto_692346 ?auto_692349 ) ) ( not ( = ?auto_692346 ?auto_692350 ) ) ( not ( = ?auto_692346 ?auto_692351 ) ) ( not ( = ?auto_692346 ?auto_692352 ) ) ( not ( = ?auto_692347 ?auto_692348 ) ) ( not ( = ?auto_692347 ?auto_692349 ) ) ( not ( = ?auto_692347 ?auto_692350 ) ) ( not ( = ?auto_692347 ?auto_692351 ) ) ( not ( = ?auto_692347 ?auto_692352 ) ) ( not ( = ?auto_692348 ?auto_692349 ) ) ( not ( = ?auto_692348 ?auto_692350 ) ) ( not ( = ?auto_692348 ?auto_692351 ) ) ( not ( = ?auto_692348 ?auto_692352 ) ) ( not ( = ?auto_692349 ?auto_692350 ) ) ( not ( = ?auto_692349 ?auto_692351 ) ) ( not ( = ?auto_692349 ?auto_692352 ) ) ( not ( = ?auto_692350 ?auto_692351 ) ) ( not ( = ?auto_692350 ?auto_692352 ) ) ( not ( = ?auto_692351 ?auto_692352 ) ) ( ON ?auto_692350 ?auto_692351 ) ( ON ?auto_692349 ?auto_692350 ) ( ON ?auto_692348 ?auto_692349 ) ( ON ?auto_692347 ?auto_692348 ) ( ON ?auto_692346 ?auto_692347 ) ( ON ?auto_692345 ?auto_692346 ) ( ON ?auto_692344 ?auto_692345 ) ( ON ?auto_692343 ?auto_692344 ) ( ON ?auto_692342 ?auto_692343 ) ( CLEAR ?auto_692340 ) ( ON ?auto_692341 ?auto_692342 ) ( CLEAR ?auto_692341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_692337 ?auto_692338 ?auto_692339 ?auto_692340 ?auto_692341 )
      ( MAKE-15PILE ?auto_692337 ?auto_692338 ?auto_692339 ?auto_692340 ?auto_692341 ?auto_692342 ?auto_692343 ?auto_692344 ?auto_692345 ?auto_692346 ?auto_692347 ?auto_692348 ?auto_692349 ?auto_692350 ?auto_692351 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_692399 - BLOCK
      ?auto_692400 - BLOCK
      ?auto_692401 - BLOCK
      ?auto_692402 - BLOCK
      ?auto_692403 - BLOCK
      ?auto_692404 - BLOCK
      ?auto_692405 - BLOCK
      ?auto_692406 - BLOCK
      ?auto_692407 - BLOCK
      ?auto_692408 - BLOCK
      ?auto_692409 - BLOCK
      ?auto_692410 - BLOCK
      ?auto_692411 - BLOCK
      ?auto_692412 - BLOCK
      ?auto_692413 - BLOCK
    )
    :vars
    (
      ?auto_692414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692413 ?auto_692414 ) ( ON-TABLE ?auto_692399 ) ( ON ?auto_692400 ?auto_692399 ) ( ON ?auto_692401 ?auto_692400 ) ( not ( = ?auto_692399 ?auto_692400 ) ) ( not ( = ?auto_692399 ?auto_692401 ) ) ( not ( = ?auto_692399 ?auto_692402 ) ) ( not ( = ?auto_692399 ?auto_692403 ) ) ( not ( = ?auto_692399 ?auto_692404 ) ) ( not ( = ?auto_692399 ?auto_692405 ) ) ( not ( = ?auto_692399 ?auto_692406 ) ) ( not ( = ?auto_692399 ?auto_692407 ) ) ( not ( = ?auto_692399 ?auto_692408 ) ) ( not ( = ?auto_692399 ?auto_692409 ) ) ( not ( = ?auto_692399 ?auto_692410 ) ) ( not ( = ?auto_692399 ?auto_692411 ) ) ( not ( = ?auto_692399 ?auto_692412 ) ) ( not ( = ?auto_692399 ?auto_692413 ) ) ( not ( = ?auto_692399 ?auto_692414 ) ) ( not ( = ?auto_692400 ?auto_692401 ) ) ( not ( = ?auto_692400 ?auto_692402 ) ) ( not ( = ?auto_692400 ?auto_692403 ) ) ( not ( = ?auto_692400 ?auto_692404 ) ) ( not ( = ?auto_692400 ?auto_692405 ) ) ( not ( = ?auto_692400 ?auto_692406 ) ) ( not ( = ?auto_692400 ?auto_692407 ) ) ( not ( = ?auto_692400 ?auto_692408 ) ) ( not ( = ?auto_692400 ?auto_692409 ) ) ( not ( = ?auto_692400 ?auto_692410 ) ) ( not ( = ?auto_692400 ?auto_692411 ) ) ( not ( = ?auto_692400 ?auto_692412 ) ) ( not ( = ?auto_692400 ?auto_692413 ) ) ( not ( = ?auto_692400 ?auto_692414 ) ) ( not ( = ?auto_692401 ?auto_692402 ) ) ( not ( = ?auto_692401 ?auto_692403 ) ) ( not ( = ?auto_692401 ?auto_692404 ) ) ( not ( = ?auto_692401 ?auto_692405 ) ) ( not ( = ?auto_692401 ?auto_692406 ) ) ( not ( = ?auto_692401 ?auto_692407 ) ) ( not ( = ?auto_692401 ?auto_692408 ) ) ( not ( = ?auto_692401 ?auto_692409 ) ) ( not ( = ?auto_692401 ?auto_692410 ) ) ( not ( = ?auto_692401 ?auto_692411 ) ) ( not ( = ?auto_692401 ?auto_692412 ) ) ( not ( = ?auto_692401 ?auto_692413 ) ) ( not ( = ?auto_692401 ?auto_692414 ) ) ( not ( = ?auto_692402 ?auto_692403 ) ) ( not ( = ?auto_692402 ?auto_692404 ) ) ( not ( = ?auto_692402 ?auto_692405 ) ) ( not ( = ?auto_692402 ?auto_692406 ) ) ( not ( = ?auto_692402 ?auto_692407 ) ) ( not ( = ?auto_692402 ?auto_692408 ) ) ( not ( = ?auto_692402 ?auto_692409 ) ) ( not ( = ?auto_692402 ?auto_692410 ) ) ( not ( = ?auto_692402 ?auto_692411 ) ) ( not ( = ?auto_692402 ?auto_692412 ) ) ( not ( = ?auto_692402 ?auto_692413 ) ) ( not ( = ?auto_692402 ?auto_692414 ) ) ( not ( = ?auto_692403 ?auto_692404 ) ) ( not ( = ?auto_692403 ?auto_692405 ) ) ( not ( = ?auto_692403 ?auto_692406 ) ) ( not ( = ?auto_692403 ?auto_692407 ) ) ( not ( = ?auto_692403 ?auto_692408 ) ) ( not ( = ?auto_692403 ?auto_692409 ) ) ( not ( = ?auto_692403 ?auto_692410 ) ) ( not ( = ?auto_692403 ?auto_692411 ) ) ( not ( = ?auto_692403 ?auto_692412 ) ) ( not ( = ?auto_692403 ?auto_692413 ) ) ( not ( = ?auto_692403 ?auto_692414 ) ) ( not ( = ?auto_692404 ?auto_692405 ) ) ( not ( = ?auto_692404 ?auto_692406 ) ) ( not ( = ?auto_692404 ?auto_692407 ) ) ( not ( = ?auto_692404 ?auto_692408 ) ) ( not ( = ?auto_692404 ?auto_692409 ) ) ( not ( = ?auto_692404 ?auto_692410 ) ) ( not ( = ?auto_692404 ?auto_692411 ) ) ( not ( = ?auto_692404 ?auto_692412 ) ) ( not ( = ?auto_692404 ?auto_692413 ) ) ( not ( = ?auto_692404 ?auto_692414 ) ) ( not ( = ?auto_692405 ?auto_692406 ) ) ( not ( = ?auto_692405 ?auto_692407 ) ) ( not ( = ?auto_692405 ?auto_692408 ) ) ( not ( = ?auto_692405 ?auto_692409 ) ) ( not ( = ?auto_692405 ?auto_692410 ) ) ( not ( = ?auto_692405 ?auto_692411 ) ) ( not ( = ?auto_692405 ?auto_692412 ) ) ( not ( = ?auto_692405 ?auto_692413 ) ) ( not ( = ?auto_692405 ?auto_692414 ) ) ( not ( = ?auto_692406 ?auto_692407 ) ) ( not ( = ?auto_692406 ?auto_692408 ) ) ( not ( = ?auto_692406 ?auto_692409 ) ) ( not ( = ?auto_692406 ?auto_692410 ) ) ( not ( = ?auto_692406 ?auto_692411 ) ) ( not ( = ?auto_692406 ?auto_692412 ) ) ( not ( = ?auto_692406 ?auto_692413 ) ) ( not ( = ?auto_692406 ?auto_692414 ) ) ( not ( = ?auto_692407 ?auto_692408 ) ) ( not ( = ?auto_692407 ?auto_692409 ) ) ( not ( = ?auto_692407 ?auto_692410 ) ) ( not ( = ?auto_692407 ?auto_692411 ) ) ( not ( = ?auto_692407 ?auto_692412 ) ) ( not ( = ?auto_692407 ?auto_692413 ) ) ( not ( = ?auto_692407 ?auto_692414 ) ) ( not ( = ?auto_692408 ?auto_692409 ) ) ( not ( = ?auto_692408 ?auto_692410 ) ) ( not ( = ?auto_692408 ?auto_692411 ) ) ( not ( = ?auto_692408 ?auto_692412 ) ) ( not ( = ?auto_692408 ?auto_692413 ) ) ( not ( = ?auto_692408 ?auto_692414 ) ) ( not ( = ?auto_692409 ?auto_692410 ) ) ( not ( = ?auto_692409 ?auto_692411 ) ) ( not ( = ?auto_692409 ?auto_692412 ) ) ( not ( = ?auto_692409 ?auto_692413 ) ) ( not ( = ?auto_692409 ?auto_692414 ) ) ( not ( = ?auto_692410 ?auto_692411 ) ) ( not ( = ?auto_692410 ?auto_692412 ) ) ( not ( = ?auto_692410 ?auto_692413 ) ) ( not ( = ?auto_692410 ?auto_692414 ) ) ( not ( = ?auto_692411 ?auto_692412 ) ) ( not ( = ?auto_692411 ?auto_692413 ) ) ( not ( = ?auto_692411 ?auto_692414 ) ) ( not ( = ?auto_692412 ?auto_692413 ) ) ( not ( = ?auto_692412 ?auto_692414 ) ) ( not ( = ?auto_692413 ?auto_692414 ) ) ( ON ?auto_692412 ?auto_692413 ) ( ON ?auto_692411 ?auto_692412 ) ( ON ?auto_692410 ?auto_692411 ) ( ON ?auto_692409 ?auto_692410 ) ( ON ?auto_692408 ?auto_692409 ) ( ON ?auto_692407 ?auto_692408 ) ( ON ?auto_692406 ?auto_692407 ) ( ON ?auto_692405 ?auto_692406 ) ( ON ?auto_692404 ?auto_692405 ) ( ON ?auto_692403 ?auto_692404 ) ( CLEAR ?auto_692401 ) ( ON ?auto_692402 ?auto_692403 ) ( CLEAR ?auto_692402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_692399 ?auto_692400 ?auto_692401 ?auto_692402 )
      ( MAKE-15PILE ?auto_692399 ?auto_692400 ?auto_692401 ?auto_692402 ?auto_692403 ?auto_692404 ?auto_692405 ?auto_692406 ?auto_692407 ?auto_692408 ?auto_692409 ?auto_692410 ?auto_692411 ?auto_692412 ?auto_692413 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_692461 - BLOCK
      ?auto_692462 - BLOCK
      ?auto_692463 - BLOCK
      ?auto_692464 - BLOCK
      ?auto_692465 - BLOCK
      ?auto_692466 - BLOCK
      ?auto_692467 - BLOCK
      ?auto_692468 - BLOCK
      ?auto_692469 - BLOCK
      ?auto_692470 - BLOCK
      ?auto_692471 - BLOCK
      ?auto_692472 - BLOCK
      ?auto_692473 - BLOCK
      ?auto_692474 - BLOCK
      ?auto_692475 - BLOCK
    )
    :vars
    (
      ?auto_692476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692475 ?auto_692476 ) ( ON-TABLE ?auto_692461 ) ( ON ?auto_692462 ?auto_692461 ) ( not ( = ?auto_692461 ?auto_692462 ) ) ( not ( = ?auto_692461 ?auto_692463 ) ) ( not ( = ?auto_692461 ?auto_692464 ) ) ( not ( = ?auto_692461 ?auto_692465 ) ) ( not ( = ?auto_692461 ?auto_692466 ) ) ( not ( = ?auto_692461 ?auto_692467 ) ) ( not ( = ?auto_692461 ?auto_692468 ) ) ( not ( = ?auto_692461 ?auto_692469 ) ) ( not ( = ?auto_692461 ?auto_692470 ) ) ( not ( = ?auto_692461 ?auto_692471 ) ) ( not ( = ?auto_692461 ?auto_692472 ) ) ( not ( = ?auto_692461 ?auto_692473 ) ) ( not ( = ?auto_692461 ?auto_692474 ) ) ( not ( = ?auto_692461 ?auto_692475 ) ) ( not ( = ?auto_692461 ?auto_692476 ) ) ( not ( = ?auto_692462 ?auto_692463 ) ) ( not ( = ?auto_692462 ?auto_692464 ) ) ( not ( = ?auto_692462 ?auto_692465 ) ) ( not ( = ?auto_692462 ?auto_692466 ) ) ( not ( = ?auto_692462 ?auto_692467 ) ) ( not ( = ?auto_692462 ?auto_692468 ) ) ( not ( = ?auto_692462 ?auto_692469 ) ) ( not ( = ?auto_692462 ?auto_692470 ) ) ( not ( = ?auto_692462 ?auto_692471 ) ) ( not ( = ?auto_692462 ?auto_692472 ) ) ( not ( = ?auto_692462 ?auto_692473 ) ) ( not ( = ?auto_692462 ?auto_692474 ) ) ( not ( = ?auto_692462 ?auto_692475 ) ) ( not ( = ?auto_692462 ?auto_692476 ) ) ( not ( = ?auto_692463 ?auto_692464 ) ) ( not ( = ?auto_692463 ?auto_692465 ) ) ( not ( = ?auto_692463 ?auto_692466 ) ) ( not ( = ?auto_692463 ?auto_692467 ) ) ( not ( = ?auto_692463 ?auto_692468 ) ) ( not ( = ?auto_692463 ?auto_692469 ) ) ( not ( = ?auto_692463 ?auto_692470 ) ) ( not ( = ?auto_692463 ?auto_692471 ) ) ( not ( = ?auto_692463 ?auto_692472 ) ) ( not ( = ?auto_692463 ?auto_692473 ) ) ( not ( = ?auto_692463 ?auto_692474 ) ) ( not ( = ?auto_692463 ?auto_692475 ) ) ( not ( = ?auto_692463 ?auto_692476 ) ) ( not ( = ?auto_692464 ?auto_692465 ) ) ( not ( = ?auto_692464 ?auto_692466 ) ) ( not ( = ?auto_692464 ?auto_692467 ) ) ( not ( = ?auto_692464 ?auto_692468 ) ) ( not ( = ?auto_692464 ?auto_692469 ) ) ( not ( = ?auto_692464 ?auto_692470 ) ) ( not ( = ?auto_692464 ?auto_692471 ) ) ( not ( = ?auto_692464 ?auto_692472 ) ) ( not ( = ?auto_692464 ?auto_692473 ) ) ( not ( = ?auto_692464 ?auto_692474 ) ) ( not ( = ?auto_692464 ?auto_692475 ) ) ( not ( = ?auto_692464 ?auto_692476 ) ) ( not ( = ?auto_692465 ?auto_692466 ) ) ( not ( = ?auto_692465 ?auto_692467 ) ) ( not ( = ?auto_692465 ?auto_692468 ) ) ( not ( = ?auto_692465 ?auto_692469 ) ) ( not ( = ?auto_692465 ?auto_692470 ) ) ( not ( = ?auto_692465 ?auto_692471 ) ) ( not ( = ?auto_692465 ?auto_692472 ) ) ( not ( = ?auto_692465 ?auto_692473 ) ) ( not ( = ?auto_692465 ?auto_692474 ) ) ( not ( = ?auto_692465 ?auto_692475 ) ) ( not ( = ?auto_692465 ?auto_692476 ) ) ( not ( = ?auto_692466 ?auto_692467 ) ) ( not ( = ?auto_692466 ?auto_692468 ) ) ( not ( = ?auto_692466 ?auto_692469 ) ) ( not ( = ?auto_692466 ?auto_692470 ) ) ( not ( = ?auto_692466 ?auto_692471 ) ) ( not ( = ?auto_692466 ?auto_692472 ) ) ( not ( = ?auto_692466 ?auto_692473 ) ) ( not ( = ?auto_692466 ?auto_692474 ) ) ( not ( = ?auto_692466 ?auto_692475 ) ) ( not ( = ?auto_692466 ?auto_692476 ) ) ( not ( = ?auto_692467 ?auto_692468 ) ) ( not ( = ?auto_692467 ?auto_692469 ) ) ( not ( = ?auto_692467 ?auto_692470 ) ) ( not ( = ?auto_692467 ?auto_692471 ) ) ( not ( = ?auto_692467 ?auto_692472 ) ) ( not ( = ?auto_692467 ?auto_692473 ) ) ( not ( = ?auto_692467 ?auto_692474 ) ) ( not ( = ?auto_692467 ?auto_692475 ) ) ( not ( = ?auto_692467 ?auto_692476 ) ) ( not ( = ?auto_692468 ?auto_692469 ) ) ( not ( = ?auto_692468 ?auto_692470 ) ) ( not ( = ?auto_692468 ?auto_692471 ) ) ( not ( = ?auto_692468 ?auto_692472 ) ) ( not ( = ?auto_692468 ?auto_692473 ) ) ( not ( = ?auto_692468 ?auto_692474 ) ) ( not ( = ?auto_692468 ?auto_692475 ) ) ( not ( = ?auto_692468 ?auto_692476 ) ) ( not ( = ?auto_692469 ?auto_692470 ) ) ( not ( = ?auto_692469 ?auto_692471 ) ) ( not ( = ?auto_692469 ?auto_692472 ) ) ( not ( = ?auto_692469 ?auto_692473 ) ) ( not ( = ?auto_692469 ?auto_692474 ) ) ( not ( = ?auto_692469 ?auto_692475 ) ) ( not ( = ?auto_692469 ?auto_692476 ) ) ( not ( = ?auto_692470 ?auto_692471 ) ) ( not ( = ?auto_692470 ?auto_692472 ) ) ( not ( = ?auto_692470 ?auto_692473 ) ) ( not ( = ?auto_692470 ?auto_692474 ) ) ( not ( = ?auto_692470 ?auto_692475 ) ) ( not ( = ?auto_692470 ?auto_692476 ) ) ( not ( = ?auto_692471 ?auto_692472 ) ) ( not ( = ?auto_692471 ?auto_692473 ) ) ( not ( = ?auto_692471 ?auto_692474 ) ) ( not ( = ?auto_692471 ?auto_692475 ) ) ( not ( = ?auto_692471 ?auto_692476 ) ) ( not ( = ?auto_692472 ?auto_692473 ) ) ( not ( = ?auto_692472 ?auto_692474 ) ) ( not ( = ?auto_692472 ?auto_692475 ) ) ( not ( = ?auto_692472 ?auto_692476 ) ) ( not ( = ?auto_692473 ?auto_692474 ) ) ( not ( = ?auto_692473 ?auto_692475 ) ) ( not ( = ?auto_692473 ?auto_692476 ) ) ( not ( = ?auto_692474 ?auto_692475 ) ) ( not ( = ?auto_692474 ?auto_692476 ) ) ( not ( = ?auto_692475 ?auto_692476 ) ) ( ON ?auto_692474 ?auto_692475 ) ( ON ?auto_692473 ?auto_692474 ) ( ON ?auto_692472 ?auto_692473 ) ( ON ?auto_692471 ?auto_692472 ) ( ON ?auto_692470 ?auto_692471 ) ( ON ?auto_692469 ?auto_692470 ) ( ON ?auto_692468 ?auto_692469 ) ( ON ?auto_692467 ?auto_692468 ) ( ON ?auto_692466 ?auto_692467 ) ( ON ?auto_692465 ?auto_692466 ) ( ON ?auto_692464 ?auto_692465 ) ( CLEAR ?auto_692462 ) ( ON ?auto_692463 ?auto_692464 ) ( CLEAR ?auto_692463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_692461 ?auto_692462 ?auto_692463 )
      ( MAKE-15PILE ?auto_692461 ?auto_692462 ?auto_692463 ?auto_692464 ?auto_692465 ?auto_692466 ?auto_692467 ?auto_692468 ?auto_692469 ?auto_692470 ?auto_692471 ?auto_692472 ?auto_692473 ?auto_692474 ?auto_692475 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_692523 - BLOCK
      ?auto_692524 - BLOCK
      ?auto_692525 - BLOCK
      ?auto_692526 - BLOCK
      ?auto_692527 - BLOCK
      ?auto_692528 - BLOCK
      ?auto_692529 - BLOCK
      ?auto_692530 - BLOCK
      ?auto_692531 - BLOCK
      ?auto_692532 - BLOCK
      ?auto_692533 - BLOCK
      ?auto_692534 - BLOCK
      ?auto_692535 - BLOCK
      ?auto_692536 - BLOCK
      ?auto_692537 - BLOCK
    )
    :vars
    (
      ?auto_692538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692537 ?auto_692538 ) ( ON-TABLE ?auto_692523 ) ( not ( = ?auto_692523 ?auto_692524 ) ) ( not ( = ?auto_692523 ?auto_692525 ) ) ( not ( = ?auto_692523 ?auto_692526 ) ) ( not ( = ?auto_692523 ?auto_692527 ) ) ( not ( = ?auto_692523 ?auto_692528 ) ) ( not ( = ?auto_692523 ?auto_692529 ) ) ( not ( = ?auto_692523 ?auto_692530 ) ) ( not ( = ?auto_692523 ?auto_692531 ) ) ( not ( = ?auto_692523 ?auto_692532 ) ) ( not ( = ?auto_692523 ?auto_692533 ) ) ( not ( = ?auto_692523 ?auto_692534 ) ) ( not ( = ?auto_692523 ?auto_692535 ) ) ( not ( = ?auto_692523 ?auto_692536 ) ) ( not ( = ?auto_692523 ?auto_692537 ) ) ( not ( = ?auto_692523 ?auto_692538 ) ) ( not ( = ?auto_692524 ?auto_692525 ) ) ( not ( = ?auto_692524 ?auto_692526 ) ) ( not ( = ?auto_692524 ?auto_692527 ) ) ( not ( = ?auto_692524 ?auto_692528 ) ) ( not ( = ?auto_692524 ?auto_692529 ) ) ( not ( = ?auto_692524 ?auto_692530 ) ) ( not ( = ?auto_692524 ?auto_692531 ) ) ( not ( = ?auto_692524 ?auto_692532 ) ) ( not ( = ?auto_692524 ?auto_692533 ) ) ( not ( = ?auto_692524 ?auto_692534 ) ) ( not ( = ?auto_692524 ?auto_692535 ) ) ( not ( = ?auto_692524 ?auto_692536 ) ) ( not ( = ?auto_692524 ?auto_692537 ) ) ( not ( = ?auto_692524 ?auto_692538 ) ) ( not ( = ?auto_692525 ?auto_692526 ) ) ( not ( = ?auto_692525 ?auto_692527 ) ) ( not ( = ?auto_692525 ?auto_692528 ) ) ( not ( = ?auto_692525 ?auto_692529 ) ) ( not ( = ?auto_692525 ?auto_692530 ) ) ( not ( = ?auto_692525 ?auto_692531 ) ) ( not ( = ?auto_692525 ?auto_692532 ) ) ( not ( = ?auto_692525 ?auto_692533 ) ) ( not ( = ?auto_692525 ?auto_692534 ) ) ( not ( = ?auto_692525 ?auto_692535 ) ) ( not ( = ?auto_692525 ?auto_692536 ) ) ( not ( = ?auto_692525 ?auto_692537 ) ) ( not ( = ?auto_692525 ?auto_692538 ) ) ( not ( = ?auto_692526 ?auto_692527 ) ) ( not ( = ?auto_692526 ?auto_692528 ) ) ( not ( = ?auto_692526 ?auto_692529 ) ) ( not ( = ?auto_692526 ?auto_692530 ) ) ( not ( = ?auto_692526 ?auto_692531 ) ) ( not ( = ?auto_692526 ?auto_692532 ) ) ( not ( = ?auto_692526 ?auto_692533 ) ) ( not ( = ?auto_692526 ?auto_692534 ) ) ( not ( = ?auto_692526 ?auto_692535 ) ) ( not ( = ?auto_692526 ?auto_692536 ) ) ( not ( = ?auto_692526 ?auto_692537 ) ) ( not ( = ?auto_692526 ?auto_692538 ) ) ( not ( = ?auto_692527 ?auto_692528 ) ) ( not ( = ?auto_692527 ?auto_692529 ) ) ( not ( = ?auto_692527 ?auto_692530 ) ) ( not ( = ?auto_692527 ?auto_692531 ) ) ( not ( = ?auto_692527 ?auto_692532 ) ) ( not ( = ?auto_692527 ?auto_692533 ) ) ( not ( = ?auto_692527 ?auto_692534 ) ) ( not ( = ?auto_692527 ?auto_692535 ) ) ( not ( = ?auto_692527 ?auto_692536 ) ) ( not ( = ?auto_692527 ?auto_692537 ) ) ( not ( = ?auto_692527 ?auto_692538 ) ) ( not ( = ?auto_692528 ?auto_692529 ) ) ( not ( = ?auto_692528 ?auto_692530 ) ) ( not ( = ?auto_692528 ?auto_692531 ) ) ( not ( = ?auto_692528 ?auto_692532 ) ) ( not ( = ?auto_692528 ?auto_692533 ) ) ( not ( = ?auto_692528 ?auto_692534 ) ) ( not ( = ?auto_692528 ?auto_692535 ) ) ( not ( = ?auto_692528 ?auto_692536 ) ) ( not ( = ?auto_692528 ?auto_692537 ) ) ( not ( = ?auto_692528 ?auto_692538 ) ) ( not ( = ?auto_692529 ?auto_692530 ) ) ( not ( = ?auto_692529 ?auto_692531 ) ) ( not ( = ?auto_692529 ?auto_692532 ) ) ( not ( = ?auto_692529 ?auto_692533 ) ) ( not ( = ?auto_692529 ?auto_692534 ) ) ( not ( = ?auto_692529 ?auto_692535 ) ) ( not ( = ?auto_692529 ?auto_692536 ) ) ( not ( = ?auto_692529 ?auto_692537 ) ) ( not ( = ?auto_692529 ?auto_692538 ) ) ( not ( = ?auto_692530 ?auto_692531 ) ) ( not ( = ?auto_692530 ?auto_692532 ) ) ( not ( = ?auto_692530 ?auto_692533 ) ) ( not ( = ?auto_692530 ?auto_692534 ) ) ( not ( = ?auto_692530 ?auto_692535 ) ) ( not ( = ?auto_692530 ?auto_692536 ) ) ( not ( = ?auto_692530 ?auto_692537 ) ) ( not ( = ?auto_692530 ?auto_692538 ) ) ( not ( = ?auto_692531 ?auto_692532 ) ) ( not ( = ?auto_692531 ?auto_692533 ) ) ( not ( = ?auto_692531 ?auto_692534 ) ) ( not ( = ?auto_692531 ?auto_692535 ) ) ( not ( = ?auto_692531 ?auto_692536 ) ) ( not ( = ?auto_692531 ?auto_692537 ) ) ( not ( = ?auto_692531 ?auto_692538 ) ) ( not ( = ?auto_692532 ?auto_692533 ) ) ( not ( = ?auto_692532 ?auto_692534 ) ) ( not ( = ?auto_692532 ?auto_692535 ) ) ( not ( = ?auto_692532 ?auto_692536 ) ) ( not ( = ?auto_692532 ?auto_692537 ) ) ( not ( = ?auto_692532 ?auto_692538 ) ) ( not ( = ?auto_692533 ?auto_692534 ) ) ( not ( = ?auto_692533 ?auto_692535 ) ) ( not ( = ?auto_692533 ?auto_692536 ) ) ( not ( = ?auto_692533 ?auto_692537 ) ) ( not ( = ?auto_692533 ?auto_692538 ) ) ( not ( = ?auto_692534 ?auto_692535 ) ) ( not ( = ?auto_692534 ?auto_692536 ) ) ( not ( = ?auto_692534 ?auto_692537 ) ) ( not ( = ?auto_692534 ?auto_692538 ) ) ( not ( = ?auto_692535 ?auto_692536 ) ) ( not ( = ?auto_692535 ?auto_692537 ) ) ( not ( = ?auto_692535 ?auto_692538 ) ) ( not ( = ?auto_692536 ?auto_692537 ) ) ( not ( = ?auto_692536 ?auto_692538 ) ) ( not ( = ?auto_692537 ?auto_692538 ) ) ( ON ?auto_692536 ?auto_692537 ) ( ON ?auto_692535 ?auto_692536 ) ( ON ?auto_692534 ?auto_692535 ) ( ON ?auto_692533 ?auto_692534 ) ( ON ?auto_692532 ?auto_692533 ) ( ON ?auto_692531 ?auto_692532 ) ( ON ?auto_692530 ?auto_692531 ) ( ON ?auto_692529 ?auto_692530 ) ( ON ?auto_692528 ?auto_692529 ) ( ON ?auto_692527 ?auto_692528 ) ( ON ?auto_692526 ?auto_692527 ) ( ON ?auto_692525 ?auto_692526 ) ( CLEAR ?auto_692523 ) ( ON ?auto_692524 ?auto_692525 ) ( CLEAR ?auto_692524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_692523 ?auto_692524 )
      ( MAKE-15PILE ?auto_692523 ?auto_692524 ?auto_692525 ?auto_692526 ?auto_692527 ?auto_692528 ?auto_692529 ?auto_692530 ?auto_692531 ?auto_692532 ?auto_692533 ?auto_692534 ?auto_692535 ?auto_692536 ?auto_692537 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_692585 - BLOCK
      ?auto_692586 - BLOCK
      ?auto_692587 - BLOCK
      ?auto_692588 - BLOCK
      ?auto_692589 - BLOCK
      ?auto_692590 - BLOCK
      ?auto_692591 - BLOCK
      ?auto_692592 - BLOCK
      ?auto_692593 - BLOCK
      ?auto_692594 - BLOCK
      ?auto_692595 - BLOCK
      ?auto_692596 - BLOCK
      ?auto_692597 - BLOCK
      ?auto_692598 - BLOCK
      ?auto_692599 - BLOCK
    )
    :vars
    (
      ?auto_692600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692599 ?auto_692600 ) ( not ( = ?auto_692585 ?auto_692586 ) ) ( not ( = ?auto_692585 ?auto_692587 ) ) ( not ( = ?auto_692585 ?auto_692588 ) ) ( not ( = ?auto_692585 ?auto_692589 ) ) ( not ( = ?auto_692585 ?auto_692590 ) ) ( not ( = ?auto_692585 ?auto_692591 ) ) ( not ( = ?auto_692585 ?auto_692592 ) ) ( not ( = ?auto_692585 ?auto_692593 ) ) ( not ( = ?auto_692585 ?auto_692594 ) ) ( not ( = ?auto_692585 ?auto_692595 ) ) ( not ( = ?auto_692585 ?auto_692596 ) ) ( not ( = ?auto_692585 ?auto_692597 ) ) ( not ( = ?auto_692585 ?auto_692598 ) ) ( not ( = ?auto_692585 ?auto_692599 ) ) ( not ( = ?auto_692585 ?auto_692600 ) ) ( not ( = ?auto_692586 ?auto_692587 ) ) ( not ( = ?auto_692586 ?auto_692588 ) ) ( not ( = ?auto_692586 ?auto_692589 ) ) ( not ( = ?auto_692586 ?auto_692590 ) ) ( not ( = ?auto_692586 ?auto_692591 ) ) ( not ( = ?auto_692586 ?auto_692592 ) ) ( not ( = ?auto_692586 ?auto_692593 ) ) ( not ( = ?auto_692586 ?auto_692594 ) ) ( not ( = ?auto_692586 ?auto_692595 ) ) ( not ( = ?auto_692586 ?auto_692596 ) ) ( not ( = ?auto_692586 ?auto_692597 ) ) ( not ( = ?auto_692586 ?auto_692598 ) ) ( not ( = ?auto_692586 ?auto_692599 ) ) ( not ( = ?auto_692586 ?auto_692600 ) ) ( not ( = ?auto_692587 ?auto_692588 ) ) ( not ( = ?auto_692587 ?auto_692589 ) ) ( not ( = ?auto_692587 ?auto_692590 ) ) ( not ( = ?auto_692587 ?auto_692591 ) ) ( not ( = ?auto_692587 ?auto_692592 ) ) ( not ( = ?auto_692587 ?auto_692593 ) ) ( not ( = ?auto_692587 ?auto_692594 ) ) ( not ( = ?auto_692587 ?auto_692595 ) ) ( not ( = ?auto_692587 ?auto_692596 ) ) ( not ( = ?auto_692587 ?auto_692597 ) ) ( not ( = ?auto_692587 ?auto_692598 ) ) ( not ( = ?auto_692587 ?auto_692599 ) ) ( not ( = ?auto_692587 ?auto_692600 ) ) ( not ( = ?auto_692588 ?auto_692589 ) ) ( not ( = ?auto_692588 ?auto_692590 ) ) ( not ( = ?auto_692588 ?auto_692591 ) ) ( not ( = ?auto_692588 ?auto_692592 ) ) ( not ( = ?auto_692588 ?auto_692593 ) ) ( not ( = ?auto_692588 ?auto_692594 ) ) ( not ( = ?auto_692588 ?auto_692595 ) ) ( not ( = ?auto_692588 ?auto_692596 ) ) ( not ( = ?auto_692588 ?auto_692597 ) ) ( not ( = ?auto_692588 ?auto_692598 ) ) ( not ( = ?auto_692588 ?auto_692599 ) ) ( not ( = ?auto_692588 ?auto_692600 ) ) ( not ( = ?auto_692589 ?auto_692590 ) ) ( not ( = ?auto_692589 ?auto_692591 ) ) ( not ( = ?auto_692589 ?auto_692592 ) ) ( not ( = ?auto_692589 ?auto_692593 ) ) ( not ( = ?auto_692589 ?auto_692594 ) ) ( not ( = ?auto_692589 ?auto_692595 ) ) ( not ( = ?auto_692589 ?auto_692596 ) ) ( not ( = ?auto_692589 ?auto_692597 ) ) ( not ( = ?auto_692589 ?auto_692598 ) ) ( not ( = ?auto_692589 ?auto_692599 ) ) ( not ( = ?auto_692589 ?auto_692600 ) ) ( not ( = ?auto_692590 ?auto_692591 ) ) ( not ( = ?auto_692590 ?auto_692592 ) ) ( not ( = ?auto_692590 ?auto_692593 ) ) ( not ( = ?auto_692590 ?auto_692594 ) ) ( not ( = ?auto_692590 ?auto_692595 ) ) ( not ( = ?auto_692590 ?auto_692596 ) ) ( not ( = ?auto_692590 ?auto_692597 ) ) ( not ( = ?auto_692590 ?auto_692598 ) ) ( not ( = ?auto_692590 ?auto_692599 ) ) ( not ( = ?auto_692590 ?auto_692600 ) ) ( not ( = ?auto_692591 ?auto_692592 ) ) ( not ( = ?auto_692591 ?auto_692593 ) ) ( not ( = ?auto_692591 ?auto_692594 ) ) ( not ( = ?auto_692591 ?auto_692595 ) ) ( not ( = ?auto_692591 ?auto_692596 ) ) ( not ( = ?auto_692591 ?auto_692597 ) ) ( not ( = ?auto_692591 ?auto_692598 ) ) ( not ( = ?auto_692591 ?auto_692599 ) ) ( not ( = ?auto_692591 ?auto_692600 ) ) ( not ( = ?auto_692592 ?auto_692593 ) ) ( not ( = ?auto_692592 ?auto_692594 ) ) ( not ( = ?auto_692592 ?auto_692595 ) ) ( not ( = ?auto_692592 ?auto_692596 ) ) ( not ( = ?auto_692592 ?auto_692597 ) ) ( not ( = ?auto_692592 ?auto_692598 ) ) ( not ( = ?auto_692592 ?auto_692599 ) ) ( not ( = ?auto_692592 ?auto_692600 ) ) ( not ( = ?auto_692593 ?auto_692594 ) ) ( not ( = ?auto_692593 ?auto_692595 ) ) ( not ( = ?auto_692593 ?auto_692596 ) ) ( not ( = ?auto_692593 ?auto_692597 ) ) ( not ( = ?auto_692593 ?auto_692598 ) ) ( not ( = ?auto_692593 ?auto_692599 ) ) ( not ( = ?auto_692593 ?auto_692600 ) ) ( not ( = ?auto_692594 ?auto_692595 ) ) ( not ( = ?auto_692594 ?auto_692596 ) ) ( not ( = ?auto_692594 ?auto_692597 ) ) ( not ( = ?auto_692594 ?auto_692598 ) ) ( not ( = ?auto_692594 ?auto_692599 ) ) ( not ( = ?auto_692594 ?auto_692600 ) ) ( not ( = ?auto_692595 ?auto_692596 ) ) ( not ( = ?auto_692595 ?auto_692597 ) ) ( not ( = ?auto_692595 ?auto_692598 ) ) ( not ( = ?auto_692595 ?auto_692599 ) ) ( not ( = ?auto_692595 ?auto_692600 ) ) ( not ( = ?auto_692596 ?auto_692597 ) ) ( not ( = ?auto_692596 ?auto_692598 ) ) ( not ( = ?auto_692596 ?auto_692599 ) ) ( not ( = ?auto_692596 ?auto_692600 ) ) ( not ( = ?auto_692597 ?auto_692598 ) ) ( not ( = ?auto_692597 ?auto_692599 ) ) ( not ( = ?auto_692597 ?auto_692600 ) ) ( not ( = ?auto_692598 ?auto_692599 ) ) ( not ( = ?auto_692598 ?auto_692600 ) ) ( not ( = ?auto_692599 ?auto_692600 ) ) ( ON ?auto_692598 ?auto_692599 ) ( ON ?auto_692597 ?auto_692598 ) ( ON ?auto_692596 ?auto_692597 ) ( ON ?auto_692595 ?auto_692596 ) ( ON ?auto_692594 ?auto_692595 ) ( ON ?auto_692593 ?auto_692594 ) ( ON ?auto_692592 ?auto_692593 ) ( ON ?auto_692591 ?auto_692592 ) ( ON ?auto_692590 ?auto_692591 ) ( ON ?auto_692589 ?auto_692590 ) ( ON ?auto_692588 ?auto_692589 ) ( ON ?auto_692587 ?auto_692588 ) ( ON ?auto_692586 ?auto_692587 ) ( ON ?auto_692585 ?auto_692586 ) ( CLEAR ?auto_692585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_692585 )
      ( MAKE-15PILE ?auto_692585 ?auto_692586 ?auto_692587 ?auto_692588 ?auto_692589 ?auto_692590 ?auto_692591 ?auto_692592 ?auto_692593 ?auto_692594 ?auto_692595 ?auto_692596 ?auto_692597 ?auto_692598 ?auto_692599 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_692648 - BLOCK
      ?auto_692649 - BLOCK
      ?auto_692650 - BLOCK
      ?auto_692651 - BLOCK
      ?auto_692652 - BLOCK
      ?auto_692653 - BLOCK
      ?auto_692654 - BLOCK
      ?auto_692655 - BLOCK
      ?auto_692656 - BLOCK
      ?auto_692657 - BLOCK
      ?auto_692658 - BLOCK
      ?auto_692659 - BLOCK
      ?auto_692660 - BLOCK
      ?auto_692661 - BLOCK
      ?auto_692662 - BLOCK
      ?auto_692663 - BLOCK
    )
    :vars
    (
      ?auto_692664 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_692662 ) ( ON ?auto_692663 ?auto_692664 ) ( CLEAR ?auto_692663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_692648 ) ( ON ?auto_692649 ?auto_692648 ) ( ON ?auto_692650 ?auto_692649 ) ( ON ?auto_692651 ?auto_692650 ) ( ON ?auto_692652 ?auto_692651 ) ( ON ?auto_692653 ?auto_692652 ) ( ON ?auto_692654 ?auto_692653 ) ( ON ?auto_692655 ?auto_692654 ) ( ON ?auto_692656 ?auto_692655 ) ( ON ?auto_692657 ?auto_692656 ) ( ON ?auto_692658 ?auto_692657 ) ( ON ?auto_692659 ?auto_692658 ) ( ON ?auto_692660 ?auto_692659 ) ( ON ?auto_692661 ?auto_692660 ) ( ON ?auto_692662 ?auto_692661 ) ( not ( = ?auto_692648 ?auto_692649 ) ) ( not ( = ?auto_692648 ?auto_692650 ) ) ( not ( = ?auto_692648 ?auto_692651 ) ) ( not ( = ?auto_692648 ?auto_692652 ) ) ( not ( = ?auto_692648 ?auto_692653 ) ) ( not ( = ?auto_692648 ?auto_692654 ) ) ( not ( = ?auto_692648 ?auto_692655 ) ) ( not ( = ?auto_692648 ?auto_692656 ) ) ( not ( = ?auto_692648 ?auto_692657 ) ) ( not ( = ?auto_692648 ?auto_692658 ) ) ( not ( = ?auto_692648 ?auto_692659 ) ) ( not ( = ?auto_692648 ?auto_692660 ) ) ( not ( = ?auto_692648 ?auto_692661 ) ) ( not ( = ?auto_692648 ?auto_692662 ) ) ( not ( = ?auto_692648 ?auto_692663 ) ) ( not ( = ?auto_692648 ?auto_692664 ) ) ( not ( = ?auto_692649 ?auto_692650 ) ) ( not ( = ?auto_692649 ?auto_692651 ) ) ( not ( = ?auto_692649 ?auto_692652 ) ) ( not ( = ?auto_692649 ?auto_692653 ) ) ( not ( = ?auto_692649 ?auto_692654 ) ) ( not ( = ?auto_692649 ?auto_692655 ) ) ( not ( = ?auto_692649 ?auto_692656 ) ) ( not ( = ?auto_692649 ?auto_692657 ) ) ( not ( = ?auto_692649 ?auto_692658 ) ) ( not ( = ?auto_692649 ?auto_692659 ) ) ( not ( = ?auto_692649 ?auto_692660 ) ) ( not ( = ?auto_692649 ?auto_692661 ) ) ( not ( = ?auto_692649 ?auto_692662 ) ) ( not ( = ?auto_692649 ?auto_692663 ) ) ( not ( = ?auto_692649 ?auto_692664 ) ) ( not ( = ?auto_692650 ?auto_692651 ) ) ( not ( = ?auto_692650 ?auto_692652 ) ) ( not ( = ?auto_692650 ?auto_692653 ) ) ( not ( = ?auto_692650 ?auto_692654 ) ) ( not ( = ?auto_692650 ?auto_692655 ) ) ( not ( = ?auto_692650 ?auto_692656 ) ) ( not ( = ?auto_692650 ?auto_692657 ) ) ( not ( = ?auto_692650 ?auto_692658 ) ) ( not ( = ?auto_692650 ?auto_692659 ) ) ( not ( = ?auto_692650 ?auto_692660 ) ) ( not ( = ?auto_692650 ?auto_692661 ) ) ( not ( = ?auto_692650 ?auto_692662 ) ) ( not ( = ?auto_692650 ?auto_692663 ) ) ( not ( = ?auto_692650 ?auto_692664 ) ) ( not ( = ?auto_692651 ?auto_692652 ) ) ( not ( = ?auto_692651 ?auto_692653 ) ) ( not ( = ?auto_692651 ?auto_692654 ) ) ( not ( = ?auto_692651 ?auto_692655 ) ) ( not ( = ?auto_692651 ?auto_692656 ) ) ( not ( = ?auto_692651 ?auto_692657 ) ) ( not ( = ?auto_692651 ?auto_692658 ) ) ( not ( = ?auto_692651 ?auto_692659 ) ) ( not ( = ?auto_692651 ?auto_692660 ) ) ( not ( = ?auto_692651 ?auto_692661 ) ) ( not ( = ?auto_692651 ?auto_692662 ) ) ( not ( = ?auto_692651 ?auto_692663 ) ) ( not ( = ?auto_692651 ?auto_692664 ) ) ( not ( = ?auto_692652 ?auto_692653 ) ) ( not ( = ?auto_692652 ?auto_692654 ) ) ( not ( = ?auto_692652 ?auto_692655 ) ) ( not ( = ?auto_692652 ?auto_692656 ) ) ( not ( = ?auto_692652 ?auto_692657 ) ) ( not ( = ?auto_692652 ?auto_692658 ) ) ( not ( = ?auto_692652 ?auto_692659 ) ) ( not ( = ?auto_692652 ?auto_692660 ) ) ( not ( = ?auto_692652 ?auto_692661 ) ) ( not ( = ?auto_692652 ?auto_692662 ) ) ( not ( = ?auto_692652 ?auto_692663 ) ) ( not ( = ?auto_692652 ?auto_692664 ) ) ( not ( = ?auto_692653 ?auto_692654 ) ) ( not ( = ?auto_692653 ?auto_692655 ) ) ( not ( = ?auto_692653 ?auto_692656 ) ) ( not ( = ?auto_692653 ?auto_692657 ) ) ( not ( = ?auto_692653 ?auto_692658 ) ) ( not ( = ?auto_692653 ?auto_692659 ) ) ( not ( = ?auto_692653 ?auto_692660 ) ) ( not ( = ?auto_692653 ?auto_692661 ) ) ( not ( = ?auto_692653 ?auto_692662 ) ) ( not ( = ?auto_692653 ?auto_692663 ) ) ( not ( = ?auto_692653 ?auto_692664 ) ) ( not ( = ?auto_692654 ?auto_692655 ) ) ( not ( = ?auto_692654 ?auto_692656 ) ) ( not ( = ?auto_692654 ?auto_692657 ) ) ( not ( = ?auto_692654 ?auto_692658 ) ) ( not ( = ?auto_692654 ?auto_692659 ) ) ( not ( = ?auto_692654 ?auto_692660 ) ) ( not ( = ?auto_692654 ?auto_692661 ) ) ( not ( = ?auto_692654 ?auto_692662 ) ) ( not ( = ?auto_692654 ?auto_692663 ) ) ( not ( = ?auto_692654 ?auto_692664 ) ) ( not ( = ?auto_692655 ?auto_692656 ) ) ( not ( = ?auto_692655 ?auto_692657 ) ) ( not ( = ?auto_692655 ?auto_692658 ) ) ( not ( = ?auto_692655 ?auto_692659 ) ) ( not ( = ?auto_692655 ?auto_692660 ) ) ( not ( = ?auto_692655 ?auto_692661 ) ) ( not ( = ?auto_692655 ?auto_692662 ) ) ( not ( = ?auto_692655 ?auto_692663 ) ) ( not ( = ?auto_692655 ?auto_692664 ) ) ( not ( = ?auto_692656 ?auto_692657 ) ) ( not ( = ?auto_692656 ?auto_692658 ) ) ( not ( = ?auto_692656 ?auto_692659 ) ) ( not ( = ?auto_692656 ?auto_692660 ) ) ( not ( = ?auto_692656 ?auto_692661 ) ) ( not ( = ?auto_692656 ?auto_692662 ) ) ( not ( = ?auto_692656 ?auto_692663 ) ) ( not ( = ?auto_692656 ?auto_692664 ) ) ( not ( = ?auto_692657 ?auto_692658 ) ) ( not ( = ?auto_692657 ?auto_692659 ) ) ( not ( = ?auto_692657 ?auto_692660 ) ) ( not ( = ?auto_692657 ?auto_692661 ) ) ( not ( = ?auto_692657 ?auto_692662 ) ) ( not ( = ?auto_692657 ?auto_692663 ) ) ( not ( = ?auto_692657 ?auto_692664 ) ) ( not ( = ?auto_692658 ?auto_692659 ) ) ( not ( = ?auto_692658 ?auto_692660 ) ) ( not ( = ?auto_692658 ?auto_692661 ) ) ( not ( = ?auto_692658 ?auto_692662 ) ) ( not ( = ?auto_692658 ?auto_692663 ) ) ( not ( = ?auto_692658 ?auto_692664 ) ) ( not ( = ?auto_692659 ?auto_692660 ) ) ( not ( = ?auto_692659 ?auto_692661 ) ) ( not ( = ?auto_692659 ?auto_692662 ) ) ( not ( = ?auto_692659 ?auto_692663 ) ) ( not ( = ?auto_692659 ?auto_692664 ) ) ( not ( = ?auto_692660 ?auto_692661 ) ) ( not ( = ?auto_692660 ?auto_692662 ) ) ( not ( = ?auto_692660 ?auto_692663 ) ) ( not ( = ?auto_692660 ?auto_692664 ) ) ( not ( = ?auto_692661 ?auto_692662 ) ) ( not ( = ?auto_692661 ?auto_692663 ) ) ( not ( = ?auto_692661 ?auto_692664 ) ) ( not ( = ?auto_692662 ?auto_692663 ) ) ( not ( = ?auto_692662 ?auto_692664 ) ) ( not ( = ?auto_692663 ?auto_692664 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_692663 ?auto_692664 )
      ( !STACK ?auto_692663 ?auto_692662 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_692714 - BLOCK
      ?auto_692715 - BLOCK
      ?auto_692716 - BLOCK
      ?auto_692717 - BLOCK
      ?auto_692718 - BLOCK
      ?auto_692719 - BLOCK
      ?auto_692720 - BLOCK
      ?auto_692721 - BLOCK
      ?auto_692722 - BLOCK
      ?auto_692723 - BLOCK
      ?auto_692724 - BLOCK
      ?auto_692725 - BLOCK
      ?auto_692726 - BLOCK
      ?auto_692727 - BLOCK
      ?auto_692728 - BLOCK
      ?auto_692729 - BLOCK
    )
    :vars
    (
      ?auto_692730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692729 ?auto_692730 ) ( ON-TABLE ?auto_692714 ) ( ON ?auto_692715 ?auto_692714 ) ( ON ?auto_692716 ?auto_692715 ) ( ON ?auto_692717 ?auto_692716 ) ( ON ?auto_692718 ?auto_692717 ) ( ON ?auto_692719 ?auto_692718 ) ( ON ?auto_692720 ?auto_692719 ) ( ON ?auto_692721 ?auto_692720 ) ( ON ?auto_692722 ?auto_692721 ) ( ON ?auto_692723 ?auto_692722 ) ( ON ?auto_692724 ?auto_692723 ) ( ON ?auto_692725 ?auto_692724 ) ( ON ?auto_692726 ?auto_692725 ) ( ON ?auto_692727 ?auto_692726 ) ( not ( = ?auto_692714 ?auto_692715 ) ) ( not ( = ?auto_692714 ?auto_692716 ) ) ( not ( = ?auto_692714 ?auto_692717 ) ) ( not ( = ?auto_692714 ?auto_692718 ) ) ( not ( = ?auto_692714 ?auto_692719 ) ) ( not ( = ?auto_692714 ?auto_692720 ) ) ( not ( = ?auto_692714 ?auto_692721 ) ) ( not ( = ?auto_692714 ?auto_692722 ) ) ( not ( = ?auto_692714 ?auto_692723 ) ) ( not ( = ?auto_692714 ?auto_692724 ) ) ( not ( = ?auto_692714 ?auto_692725 ) ) ( not ( = ?auto_692714 ?auto_692726 ) ) ( not ( = ?auto_692714 ?auto_692727 ) ) ( not ( = ?auto_692714 ?auto_692728 ) ) ( not ( = ?auto_692714 ?auto_692729 ) ) ( not ( = ?auto_692714 ?auto_692730 ) ) ( not ( = ?auto_692715 ?auto_692716 ) ) ( not ( = ?auto_692715 ?auto_692717 ) ) ( not ( = ?auto_692715 ?auto_692718 ) ) ( not ( = ?auto_692715 ?auto_692719 ) ) ( not ( = ?auto_692715 ?auto_692720 ) ) ( not ( = ?auto_692715 ?auto_692721 ) ) ( not ( = ?auto_692715 ?auto_692722 ) ) ( not ( = ?auto_692715 ?auto_692723 ) ) ( not ( = ?auto_692715 ?auto_692724 ) ) ( not ( = ?auto_692715 ?auto_692725 ) ) ( not ( = ?auto_692715 ?auto_692726 ) ) ( not ( = ?auto_692715 ?auto_692727 ) ) ( not ( = ?auto_692715 ?auto_692728 ) ) ( not ( = ?auto_692715 ?auto_692729 ) ) ( not ( = ?auto_692715 ?auto_692730 ) ) ( not ( = ?auto_692716 ?auto_692717 ) ) ( not ( = ?auto_692716 ?auto_692718 ) ) ( not ( = ?auto_692716 ?auto_692719 ) ) ( not ( = ?auto_692716 ?auto_692720 ) ) ( not ( = ?auto_692716 ?auto_692721 ) ) ( not ( = ?auto_692716 ?auto_692722 ) ) ( not ( = ?auto_692716 ?auto_692723 ) ) ( not ( = ?auto_692716 ?auto_692724 ) ) ( not ( = ?auto_692716 ?auto_692725 ) ) ( not ( = ?auto_692716 ?auto_692726 ) ) ( not ( = ?auto_692716 ?auto_692727 ) ) ( not ( = ?auto_692716 ?auto_692728 ) ) ( not ( = ?auto_692716 ?auto_692729 ) ) ( not ( = ?auto_692716 ?auto_692730 ) ) ( not ( = ?auto_692717 ?auto_692718 ) ) ( not ( = ?auto_692717 ?auto_692719 ) ) ( not ( = ?auto_692717 ?auto_692720 ) ) ( not ( = ?auto_692717 ?auto_692721 ) ) ( not ( = ?auto_692717 ?auto_692722 ) ) ( not ( = ?auto_692717 ?auto_692723 ) ) ( not ( = ?auto_692717 ?auto_692724 ) ) ( not ( = ?auto_692717 ?auto_692725 ) ) ( not ( = ?auto_692717 ?auto_692726 ) ) ( not ( = ?auto_692717 ?auto_692727 ) ) ( not ( = ?auto_692717 ?auto_692728 ) ) ( not ( = ?auto_692717 ?auto_692729 ) ) ( not ( = ?auto_692717 ?auto_692730 ) ) ( not ( = ?auto_692718 ?auto_692719 ) ) ( not ( = ?auto_692718 ?auto_692720 ) ) ( not ( = ?auto_692718 ?auto_692721 ) ) ( not ( = ?auto_692718 ?auto_692722 ) ) ( not ( = ?auto_692718 ?auto_692723 ) ) ( not ( = ?auto_692718 ?auto_692724 ) ) ( not ( = ?auto_692718 ?auto_692725 ) ) ( not ( = ?auto_692718 ?auto_692726 ) ) ( not ( = ?auto_692718 ?auto_692727 ) ) ( not ( = ?auto_692718 ?auto_692728 ) ) ( not ( = ?auto_692718 ?auto_692729 ) ) ( not ( = ?auto_692718 ?auto_692730 ) ) ( not ( = ?auto_692719 ?auto_692720 ) ) ( not ( = ?auto_692719 ?auto_692721 ) ) ( not ( = ?auto_692719 ?auto_692722 ) ) ( not ( = ?auto_692719 ?auto_692723 ) ) ( not ( = ?auto_692719 ?auto_692724 ) ) ( not ( = ?auto_692719 ?auto_692725 ) ) ( not ( = ?auto_692719 ?auto_692726 ) ) ( not ( = ?auto_692719 ?auto_692727 ) ) ( not ( = ?auto_692719 ?auto_692728 ) ) ( not ( = ?auto_692719 ?auto_692729 ) ) ( not ( = ?auto_692719 ?auto_692730 ) ) ( not ( = ?auto_692720 ?auto_692721 ) ) ( not ( = ?auto_692720 ?auto_692722 ) ) ( not ( = ?auto_692720 ?auto_692723 ) ) ( not ( = ?auto_692720 ?auto_692724 ) ) ( not ( = ?auto_692720 ?auto_692725 ) ) ( not ( = ?auto_692720 ?auto_692726 ) ) ( not ( = ?auto_692720 ?auto_692727 ) ) ( not ( = ?auto_692720 ?auto_692728 ) ) ( not ( = ?auto_692720 ?auto_692729 ) ) ( not ( = ?auto_692720 ?auto_692730 ) ) ( not ( = ?auto_692721 ?auto_692722 ) ) ( not ( = ?auto_692721 ?auto_692723 ) ) ( not ( = ?auto_692721 ?auto_692724 ) ) ( not ( = ?auto_692721 ?auto_692725 ) ) ( not ( = ?auto_692721 ?auto_692726 ) ) ( not ( = ?auto_692721 ?auto_692727 ) ) ( not ( = ?auto_692721 ?auto_692728 ) ) ( not ( = ?auto_692721 ?auto_692729 ) ) ( not ( = ?auto_692721 ?auto_692730 ) ) ( not ( = ?auto_692722 ?auto_692723 ) ) ( not ( = ?auto_692722 ?auto_692724 ) ) ( not ( = ?auto_692722 ?auto_692725 ) ) ( not ( = ?auto_692722 ?auto_692726 ) ) ( not ( = ?auto_692722 ?auto_692727 ) ) ( not ( = ?auto_692722 ?auto_692728 ) ) ( not ( = ?auto_692722 ?auto_692729 ) ) ( not ( = ?auto_692722 ?auto_692730 ) ) ( not ( = ?auto_692723 ?auto_692724 ) ) ( not ( = ?auto_692723 ?auto_692725 ) ) ( not ( = ?auto_692723 ?auto_692726 ) ) ( not ( = ?auto_692723 ?auto_692727 ) ) ( not ( = ?auto_692723 ?auto_692728 ) ) ( not ( = ?auto_692723 ?auto_692729 ) ) ( not ( = ?auto_692723 ?auto_692730 ) ) ( not ( = ?auto_692724 ?auto_692725 ) ) ( not ( = ?auto_692724 ?auto_692726 ) ) ( not ( = ?auto_692724 ?auto_692727 ) ) ( not ( = ?auto_692724 ?auto_692728 ) ) ( not ( = ?auto_692724 ?auto_692729 ) ) ( not ( = ?auto_692724 ?auto_692730 ) ) ( not ( = ?auto_692725 ?auto_692726 ) ) ( not ( = ?auto_692725 ?auto_692727 ) ) ( not ( = ?auto_692725 ?auto_692728 ) ) ( not ( = ?auto_692725 ?auto_692729 ) ) ( not ( = ?auto_692725 ?auto_692730 ) ) ( not ( = ?auto_692726 ?auto_692727 ) ) ( not ( = ?auto_692726 ?auto_692728 ) ) ( not ( = ?auto_692726 ?auto_692729 ) ) ( not ( = ?auto_692726 ?auto_692730 ) ) ( not ( = ?auto_692727 ?auto_692728 ) ) ( not ( = ?auto_692727 ?auto_692729 ) ) ( not ( = ?auto_692727 ?auto_692730 ) ) ( not ( = ?auto_692728 ?auto_692729 ) ) ( not ( = ?auto_692728 ?auto_692730 ) ) ( not ( = ?auto_692729 ?auto_692730 ) ) ( CLEAR ?auto_692727 ) ( ON ?auto_692728 ?auto_692729 ) ( CLEAR ?auto_692728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_692714 ?auto_692715 ?auto_692716 ?auto_692717 ?auto_692718 ?auto_692719 ?auto_692720 ?auto_692721 ?auto_692722 ?auto_692723 ?auto_692724 ?auto_692725 ?auto_692726 ?auto_692727 ?auto_692728 )
      ( MAKE-16PILE ?auto_692714 ?auto_692715 ?auto_692716 ?auto_692717 ?auto_692718 ?auto_692719 ?auto_692720 ?auto_692721 ?auto_692722 ?auto_692723 ?auto_692724 ?auto_692725 ?auto_692726 ?auto_692727 ?auto_692728 ?auto_692729 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_692780 - BLOCK
      ?auto_692781 - BLOCK
      ?auto_692782 - BLOCK
      ?auto_692783 - BLOCK
      ?auto_692784 - BLOCK
      ?auto_692785 - BLOCK
      ?auto_692786 - BLOCK
      ?auto_692787 - BLOCK
      ?auto_692788 - BLOCK
      ?auto_692789 - BLOCK
      ?auto_692790 - BLOCK
      ?auto_692791 - BLOCK
      ?auto_692792 - BLOCK
      ?auto_692793 - BLOCK
      ?auto_692794 - BLOCK
      ?auto_692795 - BLOCK
    )
    :vars
    (
      ?auto_692796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692795 ?auto_692796 ) ( ON-TABLE ?auto_692780 ) ( ON ?auto_692781 ?auto_692780 ) ( ON ?auto_692782 ?auto_692781 ) ( ON ?auto_692783 ?auto_692782 ) ( ON ?auto_692784 ?auto_692783 ) ( ON ?auto_692785 ?auto_692784 ) ( ON ?auto_692786 ?auto_692785 ) ( ON ?auto_692787 ?auto_692786 ) ( ON ?auto_692788 ?auto_692787 ) ( ON ?auto_692789 ?auto_692788 ) ( ON ?auto_692790 ?auto_692789 ) ( ON ?auto_692791 ?auto_692790 ) ( ON ?auto_692792 ?auto_692791 ) ( not ( = ?auto_692780 ?auto_692781 ) ) ( not ( = ?auto_692780 ?auto_692782 ) ) ( not ( = ?auto_692780 ?auto_692783 ) ) ( not ( = ?auto_692780 ?auto_692784 ) ) ( not ( = ?auto_692780 ?auto_692785 ) ) ( not ( = ?auto_692780 ?auto_692786 ) ) ( not ( = ?auto_692780 ?auto_692787 ) ) ( not ( = ?auto_692780 ?auto_692788 ) ) ( not ( = ?auto_692780 ?auto_692789 ) ) ( not ( = ?auto_692780 ?auto_692790 ) ) ( not ( = ?auto_692780 ?auto_692791 ) ) ( not ( = ?auto_692780 ?auto_692792 ) ) ( not ( = ?auto_692780 ?auto_692793 ) ) ( not ( = ?auto_692780 ?auto_692794 ) ) ( not ( = ?auto_692780 ?auto_692795 ) ) ( not ( = ?auto_692780 ?auto_692796 ) ) ( not ( = ?auto_692781 ?auto_692782 ) ) ( not ( = ?auto_692781 ?auto_692783 ) ) ( not ( = ?auto_692781 ?auto_692784 ) ) ( not ( = ?auto_692781 ?auto_692785 ) ) ( not ( = ?auto_692781 ?auto_692786 ) ) ( not ( = ?auto_692781 ?auto_692787 ) ) ( not ( = ?auto_692781 ?auto_692788 ) ) ( not ( = ?auto_692781 ?auto_692789 ) ) ( not ( = ?auto_692781 ?auto_692790 ) ) ( not ( = ?auto_692781 ?auto_692791 ) ) ( not ( = ?auto_692781 ?auto_692792 ) ) ( not ( = ?auto_692781 ?auto_692793 ) ) ( not ( = ?auto_692781 ?auto_692794 ) ) ( not ( = ?auto_692781 ?auto_692795 ) ) ( not ( = ?auto_692781 ?auto_692796 ) ) ( not ( = ?auto_692782 ?auto_692783 ) ) ( not ( = ?auto_692782 ?auto_692784 ) ) ( not ( = ?auto_692782 ?auto_692785 ) ) ( not ( = ?auto_692782 ?auto_692786 ) ) ( not ( = ?auto_692782 ?auto_692787 ) ) ( not ( = ?auto_692782 ?auto_692788 ) ) ( not ( = ?auto_692782 ?auto_692789 ) ) ( not ( = ?auto_692782 ?auto_692790 ) ) ( not ( = ?auto_692782 ?auto_692791 ) ) ( not ( = ?auto_692782 ?auto_692792 ) ) ( not ( = ?auto_692782 ?auto_692793 ) ) ( not ( = ?auto_692782 ?auto_692794 ) ) ( not ( = ?auto_692782 ?auto_692795 ) ) ( not ( = ?auto_692782 ?auto_692796 ) ) ( not ( = ?auto_692783 ?auto_692784 ) ) ( not ( = ?auto_692783 ?auto_692785 ) ) ( not ( = ?auto_692783 ?auto_692786 ) ) ( not ( = ?auto_692783 ?auto_692787 ) ) ( not ( = ?auto_692783 ?auto_692788 ) ) ( not ( = ?auto_692783 ?auto_692789 ) ) ( not ( = ?auto_692783 ?auto_692790 ) ) ( not ( = ?auto_692783 ?auto_692791 ) ) ( not ( = ?auto_692783 ?auto_692792 ) ) ( not ( = ?auto_692783 ?auto_692793 ) ) ( not ( = ?auto_692783 ?auto_692794 ) ) ( not ( = ?auto_692783 ?auto_692795 ) ) ( not ( = ?auto_692783 ?auto_692796 ) ) ( not ( = ?auto_692784 ?auto_692785 ) ) ( not ( = ?auto_692784 ?auto_692786 ) ) ( not ( = ?auto_692784 ?auto_692787 ) ) ( not ( = ?auto_692784 ?auto_692788 ) ) ( not ( = ?auto_692784 ?auto_692789 ) ) ( not ( = ?auto_692784 ?auto_692790 ) ) ( not ( = ?auto_692784 ?auto_692791 ) ) ( not ( = ?auto_692784 ?auto_692792 ) ) ( not ( = ?auto_692784 ?auto_692793 ) ) ( not ( = ?auto_692784 ?auto_692794 ) ) ( not ( = ?auto_692784 ?auto_692795 ) ) ( not ( = ?auto_692784 ?auto_692796 ) ) ( not ( = ?auto_692785 ?auto_692786 ) ) ( not ( = ?auto_692785 ?auto_692787 ) ) ( not ( = ?auto_692785 ?auto_692788 ) ) ( not ( = ?auto_692785 ?auto_692789 ) ) ( not ( = ?auto_692785 ?auto_692790 ) ) ( not ( = ?auto_692785 ?auto_692791 ) ) ( not ( = ?auto_692785 ?auto_692792 ) ) ( not ( = ?auto_692785 ?auto_692793 ) ) ( not ( = ?auto_692785 ?auto_692794 ) ) ( not ( = ?auto_692785 ?auto_692795 ) ) ( not ( = ?auto_692785 ?auto_692796 ) ) ( not ( = ?auto_692786 ?auto_692787 ) ) ( not ( = ?auto_692786 ?auto_692788 ) ) ( not ( = ?auto_692786 ?auto_692789 ) ) ( not ( = ?auto_692786 ?auto_692790 ) ) ( not ( = ?auto_692786 ?auto_692791 ) ) ( not ( = ?auto_692786 ?auto_692792 ) ) ( not ( = ?auto_692786 ?auto_692793 ) ) ( not ( = ?auto_692786 ?auto_692794 ) ) ( not ( = ?auto_692786 ?auto_692795 ) ) ( not ( = ?auto_692786 ?auto_692796 ) ) ( not ( = ?auto_692787 ?auto_692788 ) ) ( not ( = ?auto_692787 ?auto_692789 ) ) ( not ( = ?auto_692787 ?auto_692790 ) ) ( not ( = ?auto_692787 ?auto_692791 ) ) ( not ( = ?auto_692787 ?auto_692792 ) ) ( not ( = ?auto_692787 ?auto_692793 ) ) ( not ( = ?auto_692787 ?auto_692794 ) ) ( not ( = ?auto_692787 ?auto_692795 ) ) ( not ( = ?auto_692787 ?auto_692796 ) ) ( not ( = ?auto_692788 ?auto_692789 ) ) ( not ( = ?auto_692788 ?auto_692790 ) ) ( not ( = ?auto_692788 ?auto_692791 ) ) ( not ( = ?auto_692788 ?auto_692792 ) ) ( not ( = ?auto_692788 ?auto_692793 ) ) ( not ( = ?auto_692788 ?auto_692794 ) ) ( not ( = ?auto_692788 ?auto_692795 ) ) ( not ( = ?auto_692788 ?auto_692796 ) ) ( not ( = ?auto_692789 ?auto_692790 ) ) ( not ( = ?auto_692789 ?auto_692791 ) ) ( not ( = ?auto_692789 ?auto_692792 ) ) ( not ( = ?auto_692789 ?auto_692793 ) ) ( not ( = ?auto_692789 ?auto_692794 ) ) ( not ( = ?auto_692789 ?auto_692795 ) ) ( not ( = ?auto_692789 ?auto_692796 ) ) ( not ( = ?auto_692790 ?auto_692791 ) ) ( not ( = ?auto_692790 ?auto_692792 ) ) ( not ( = ?auto_692790 ?auto_692793 ) ) ( not ( = ?auto_692790 ?auto_692794 ) ) ( not ( = ?auto_692790 ?auto_692795 ) ) ( not ( = ?auto_692790 ?auto_692796 ) ) ( not ( = ?auto_692791 ?auto_692792 ) ) ( not ( = ?auto_692791 ?auto_692793 ) ) ( not ( = ?auto_692791 ?auto_692794 ) ) ( not ( = ?auto_692791 ?auto_692795 ) ) ( not ( = ?auto_692791 ?auto_692796 ) ) ( not ( = ?auto_692792 ?auto_692793 ) ) ( not ( = ?auto_692792 ?auto_692794 ) ) ( not ( = ?auto_692792 ?auto_692795 ) ) ( not ( = ?auto_692792 ?auto_692796 ) ) ( not ( = ?auto_692793 ?auto_692794 ) ) ( not ( = ?auto_692793 ?auto_692795 ) ) ( not ( = ?auto_692793 ?auto_692796 ) ) ( not ( = ?auto_692794 ?auto_692795 ) ) ( not ( = ?auto_692794 ?auto_692796 ) ) ( not ( = ?auto_692795 ?auto_692796 ) ) ( ON ?auto_692794 ?auto_692795 ) ( CLEAR ?auto_692792 ) ( ON ?auto_692793 ?auto_692794 ) ( CLEAR ?auto_692793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_692780 ?auto_692781 ?auto_692782 ?auto_692783 ?auto_692784 ?auto_692785 ?auto_692786 ?auto_692787 ?auto_692788 ?auto_692789 ?auto_692790 ?auto_692791 ?auto_692792 ?auto_692793 )
      ( MAKE-16PILE ?auto_692780 ?auto_692781 ?auto_692782 ?auto_692783 ?auto_692784 ?auto_692785 ?auto_692786 ?auto_692787 ?auto_692788 ?auto_692789 ?auto_692790 ?auto_692791 ?auto_692792 ?auto_692793 ?auto_692794 ?auto_692795 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_692846 - BLOCK
      ?auto_692847 - BLOCK
      ?auto_692848 - BLOCK
      ?auto_692849 - BLOCK
      ?auto_692850 - BLOCK
      ?auto_692851 - BLOCK
      ?auto_692852 - BLOCK
      ?auto_692853 - BLOCK
      ?auto_692854 - BLOCK
      ?auto_692855 - BLOCK
      ?auto_692856 - BLOCK
      ?auto_692857 - BLOCK
      ?auto_692858 - BLOCK
      ?auto_692859 - BLOCK
      ?auto_692860 - BLOCK
      ?auto_692861 - BLOCK
    )
    :vars
    (
      ?auto_692862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692861 ?auto_692862 ) ( ON-TABLE ?auto_692846 ) ( ON ?auto_692847 ?auto_692846 ) ( ON ?auto_692848 ?auto_692847 ) ( ON ?auto_692849 ?auto_692848 ) ( ON ?auto_692850 ?auto_692849 ) ( ON ?auto_692851 ?auto_692850 ) ( ON ?auto_692852 ?auto_692851 ) ( ON ?auto_692853 ?auto_692852 ) ( ON ?auto_692854 ?auto_692853 ) ( ON ?auto_692855 ?auto_692854 ) ( ON ?auto_692856 ?auto_692855 ) ( ON ?auto_692857 ?auto_692856 ) ( not ( = ?auto_692846 ?auto_692847 ) ) ( not ( = ?auto_692846 ?auto_692848 ) ) ( not ( = ?auto_692846 ?auto_692849 ) ) ( not ( = ?auto_692846 ?auto_692850 ) ) ( not ( = ?auto_692846 ?auto_692851 ) ) ( not ( = ?auto_692846 ?auto_692852 ) ) ( not ( = ?auto_692846 ?auto_692853 ) ) ( not ( = ?auto_692846 ?auto_692854 ) ) ( not ( = ?auto_692846 ?auto_692855 ) ) ( not ( = ?auto_692846 ?auto_692856 ) ) ( not ( = ?auto_692846 ?auto_692857 ) ) ( not ( = ?auto_692846 ?auto_692858 ) ) ( not ( = ?auto_692846 ?auto_692859 ) ) ( not ( = ?auto_692846 ?auto_692860 ) ) ( not ( = ?auto_692846 ?auto_692861 ) ) ( not ( = ?auto_692846 ?auto_692862 ) ) ( not ( = ?auto_692847 ?auto_692848 ) ) ( not ( = ?auto_692847 ?auto_692849 ) ) ( not ( = ?auto_692847 ?auto_692850 ) ) ( not ( = ?auto_692847 ?auto_692851 ) ) ( not ( = ?auto_692847 ?auto_692852 ) ) ( not ( = ?auto_692847 ?auto_692853 ) ) ( not ( = ?auto_692847 ?auto_692854 ) ) ( not ( = ?auto_692847 ?auto_692855 ) ) ( not ( = ?auto_692847 ?auto_692856 ) ) ( not ( = ?auto_692847 ?auto_692857 ) ) ( not ( = ?auto_692847 ?auto_692858 ) ) ( not ( = ?auto_692847 ?auto_692859 ) ) ( not ( = ?auto_692847 ?auto_692860 ) ) ( not ( = ?auto_692847 ?auto_692861 ) ) ( not ( = ?auto_692847 ?auto_692862 ) ) ( not ( = ?auto_692848 ?auto_692849 ) ) ( not ( = ?auto_692848 ?auto_692850 ) ) ( not ( = ?auto_692848 ?auto_692851 ) ) ( not ( = ?auto_692848 ?auto_692852 ) ) ( not ( = ?auto_692848 ?auto_692853 ) ) ( not ( = ?auto_692848 ?auto_692854 ) ) ( not ( = ?auto_692848 ?auto_692855 ) ) ( not ( = ?auto_692848 ?auto_692856 ) ) ( not ( = ?auto_692848 ?auto_692857 ) ) ( not ( = ?auto_692848 ?auto_692858 ) ) ( not ( = ?auto_692848 ?auto_692859 ) ) ( not ( = ?auto_692848 ?auto_692860 ) ) ( not ( = ?auto_692848 ?auto_692861 ) ) ( not ( = ?auto_692848 ?auto_692862 ) ) ( not ( = ?auto_692849 ?auto_692850 ) ) ( not ( = ?auto_692849 ?auto_692851 ) ) ( not ( = ?auto_692849 ?auto_692852 ) ) ( not ( = ?auto_692849 ?auto_692853 ) ) ( not ( = ?auto_692849 ?auto_692854 ) ) ( not ( = ?auto_692849 ?auto_692855 ) ) ( not ( = ?auto_692849 ?auto_692856 ) ) ( not ( = ?auto_692849 ?auto_692857 ) ) ( not ( = ?auto_692849 ?auto_692858 ) ) ( not ( = ?auto_692849 ?auto_692859 ) ) ( not ( = ?auto_692849 ?auto_692860 ) ) ( not ( = ?auto_692849 ?auto_692861 ) ) ( not ( = ?auto_692849 ?auto_692862 ) ) ( not ( = ?auto_692850 ?auto_692851 ) ) ( not ( = ?auto_692850 ?auto_692852 ) ) ( not ( = ?auto_692850 ?auto_692853 ) ) ( not ( = ?auto_692850 ?auto_692854 ) ) ( not ( = ?auto_692850 ?auto_692855 ) ) ( not ( = ?auto_692850 ?auto_692856 ) ) ( not ( = ?auto_692850 ?auto_692857 ) ) ( not ( = ?auto_692850 ?auto_692858 ) ) ( not ( = ?auto_692850 ?auto_692859 ) ) ( not ( = ?auto_692850 ?auto_692860 ) ) ( not ( = ?auto_692850 ?auto_692861 ) ) ( not ( = ?auto_692850 ?auto_692862 ) ) ( not ( = ?auto_692851 ?auto_692852 ) ) ( not ( = ?auto_692851 ?auto_692853 ) ) ( not ( = ?auto_692851 ?auto_692854 ) ) ( not ( = ?auto_692851 ?auto_692855 ) ) ( not ( = ?auto_692851 ?auto_692856 ) ) ( not ( = ?auto_692851 ?auto_692857 ) ) ( not ( = ?auto_692851 ?auto_692858 ) ) ( not ( = ?auto_692851 ?auto_692859 ) ) ( not ( = ?auto_692851 ?auto_692860 ) ) ( not ( = ?auto_692851 ?auto_692861 ) ) ( not ( = ?auto_692851 ?auto_692862 ) ) ( not ( = ?auto_692852 ?auto_692853 ) ) ( not ( = ?auto_692852 ?auto_692854 ) ) ( not ( = ?auto_692852 ?auto_692855 ) ) ( not ( = ?auto_692852 ?auto_692856 ) ) ( not ( = ?auto_692852 ?auto_692857 ) ) ( not ( = ?auto_692852 ?auto_692858 ) ) ( not ( = ?auto_692852 ?auto_692859 ) ) ( not ( = ?auto_692852 ?auto_692860 ) ) ( not ( = ?auto_692852 ?auto_692861 ) ) ( not ( = ?auto_692852 ?auto_692862 ) ) ( not ( = ?auto_692853 ?auto_692854 ) ) ( not ( = ?auto_692853 ?auto_692855 ) ) ( not ( = ?auto_692853 ?auto_692856 ) ) ( not ( = ?auto_692853 ?auto_692857 ) ) ( not ( = ?auto_692853 ?auto_692858 ) ) ( not ( = ?auto_692853 ?auto_692859 ) ) ( not ( = ?auto_692853 ?auto_692860 ) ) ( not ( = ?auto_692853 ?auto_692861 ) ) ( not ( = ?auto_692853 ?auto_692862 ) ) ( not ( = ?auto_692854 ?auto_692855 ) ) ( not ( = ?auto_692854 ?auto_692856 ) ) ( not ( = ?auto_692854 ?auto_692857 ) ) ( not ( = ?auto_692854 ?auto_692858 ) ) ( not ( = ?auto_692854 ?auto_692859 ) ) ( not ( = ?auto_692854 ?auto_692860 ) ) ( not ( = ?auto_692854 ?auto_692861 ) ) ( not ( = ?auto_692854 ?auto_692862 ) ) ( not ( = ?auto_692855 ?auto_692856 ) ) ( not ( = ?auto_692855 ?auto_692857 ) ) ( not ( = ?auto_692855 ?auto_692858 ) ) ( not ( = ?auto_692855 ?auto_692859 ) ) ( not ( = ?auto_692855 ?auto_692860 ) ) ( not ( = ?auto_692855 ?auto_692861 ) ) ( not ( = ?auto_692855 ?auto_692862 ) ) ( not ( = ?auto_692856 ?auto_692857 ) ) ( not ( = ?auto_692856 ?auto_692858 ) ) ( not ( = ?auto_692856 ?auto_692859 ) ) ( not ( = ?auto_692856 ?auto_692860 ) ) ( not ( = ?auto_692856 ?auto_692861 ) ) ( not ( = ?auto_692856 ?auto_692862 ) ) ( not ( = ?auto_692857 ?auto_692858 ) ) ( not ( = ?auto_692857 ?auto_692859 ) ) ( not ( = ?auto_692857 ?auto_692860 ) ) ( not ( = ?auto_692857 ?auto_692861 ) ) ( not ( = ?auto_692857 ?auto_692862 ) ) ( not ( = ?auto_692858 ?auto_692859 ) ) ( not ( = ?auto_692858 ?auto_692860 ) ) ( not ( = ?auto_692858 ?auto_692861 ) ) ( not ( = ?auto_692858 ?auto_692862 ) ) ( not ( = ?auto_692859 ?auto_692860 ) ) ( not ( = ?auto_692859 ?auto_692861 ) ) ( not ( = ?auto_692859 ?auto_692862 ) ) ( not ( = ?auto_692860 ?auto_692861 ) ) ( not ( = ?auto_692860 ?auto_692862 ) ) ( not ( = ?auto_692861 ?auto_692862 ) ) ( ON ?auto_692860 ?auto_692861 ) ( ON ?auto_692859 ?auto_692860 ) ( CLEAR ?auto_692857 ) ( ON ?auto_692858 ?auto_692859 ) ( CLEAR ?auto_692858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_692846 ?auto_692847 ?auto_692848 ?auto_692849 ?auto_692850 ?auto_692851 ?auto_692852 ?auto_692853 ?auto_692854 ?auto_692855 ?auto_692856 ?auto_692857 ?auto_692858 )
      ( MAKE-16PILE ?auto_692846 ?auto_692847 ?auto_692848 ?auto_692849 ?auto_692850 ?auto_692851 ?auto_692852 ?auto_692853 ?auto_692854 ?auto_692855 ?auto_692856 ?auto_692857 ?auto_692858 ?auto_692859 ?auto_692860 ?auto_692861 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_692912 - BLOCK
      ?auto_692913 - BLOCK
      ?auto_692914 - BLOCK
      ?auto_692915 - BLOCK
      ?auto_692916 - BLOCK
      ?auto_692917 - BLOCK
      ?auto_692918 - BLOCK
      ?auto_692919 - BLOCK
      ?auto_692920 - BLOCK
      ?auto_692921 - BLOCK
      ?auto_692922 - BLOCK
      ?auto_692923 - BLOCK
      ?auto_692924 - BLOCK
      ?auto_692925 - BLOCK
      ?auto_692926 - BLOCK
      ?auto_692927 - BLOCK
    )
    :vars
    (
      ?auto_692928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692927 ?auto_692928 ) ( ON-TABLE ?auto_692912 ) ( ON ?auto_692913 ?auto_692912 ) ( ON ?auto_692914 ?auto_692913 ) ( ON ?auto_692915 ?auto_692914 ) ( ON ?auto_692916 ?auto_692915 ) ( ON ?auto_692917 ?auto_692916 ) ( ON ?auto_692918 ?auto_692917 ) ( ON ?auto_692919 ?auto_692918 ) ( ON ?auto_692920 ?auto_692919 ) ( ON ?auto_692921 ?auto_692920 ) ( ON ?auto_692922 ?auto_692921 ) ( not ( = ?auto_692912 ?auto_692913 ) ) ( not ( = ?auto_692912 ?auto_692914 ) ) ( not ( = ?auto_692912 ?auto_692915 ) ) ( not ( = ?auto_692912 ?auto_692916 ) ) ( not ( = ?auto_692912 ?auto_692917 ) ) ( not ( = ?auto_692912 ?auto_692918 ) ) ( not ( = ?auto_692912 ?auto_692919 ) ) ( not ( = ?auto_692912 ?auto_692920 ) ) ( not ( = ?auto_692912 ?auto_692921 ) ) ( not ( = ?auto_692912 ?auto_692922 ) ) ( not ( = ?auto_692912 ?auto_692923 ) ) ( not ( = ?auto_692912 ?auto_692924 ) ) ( not ( = ?auto_692912 ?auto_692925 ) ) ( not ( = ?auto_692912 ?auto_692926 ) ) ( not ( = ?auto_692912 ?auto_692927 ) ) ( not ( = ?auto_692912 ?auto_692928 ) ) ( not ( = ?auto_692913 ?auto_692914 ) ) ( not ( = ?auto_692913 ?auto_692915 ) ) ( not ( = ?auto_692913 ?auto_692916 ) ) ( not ( = ?auto_692913 ?auto_692917 ) ) ( not ( = ?auto_692913 ?auto_692918 ) ) ( not ( = ?auto_692913 ?auto_692919 ) ) ( not ( = ?auto_692913 ?auto_692920 ) ) ( not ( = ?auto_692913 ?auto_692921 ) ) ( not ( = ?auto_692913 ?auto_692922 ) ) ( not ( = ?auto_692913 ?auto_692923 ) ) ( not ( = ?auto_692913 ?auto_692924 ) ) ( not ( = ?auto_692913 ?auto_692925 ) ) ( not ( = ?auto_692913 ?auto_692926 ) ) ( not ( = ?auto_692913 ?auto_692927 ) ) ( not ( = ?auto_692913 ?auto_692928 ) ) ( not ( = ?auto_692914 ?auto_692915 ) ) ( not ( = ?auto_692914 ?auto_692916 ) ) ( not ( = ?auto_692914 ?auto_692917 ) ) ( not ( = ?auto_692914 ?auto_692918 ) ) ( not ( = ?auto_692914 ?auto_692919 ) ) ( not ( = ?auto_692914 ?auto_692920 ) ) ( not ( = ?auto_692914 ?auto_692921 ) ) ( not ( = ?auto_692914 ?auto_692922 ) ) ( not ( = ?auto_692914 ?auto_692923 ) ) ( not ( = ?auto_692914 ?auto_692924 ) ) ( not ( = ?auto_692914 ?auto_692925 ) ) ( not ( = ?auto_692914 ?auto_692926 ) ) ( not ( = ?auto_692914 ?auto_692927 ) ) ( not ( = ?auto_692914 ?auto_692928 ) ) ( not ( = ?auto_692915 ?auto_692916 ) ) ( not ( = ?auto_692915 ?auto_692917 ) ) ( not ( = ?auto_692915 ?auto_692918 ) ) ( not ( = ?auto_692915 ?auto_692919 ) ) ( not ( = ?auto_692915 ?auto_692920 ) ) ( not ( = ?auto_692915 ?auto_692921 ) ) ( not ( = ?auto_692915 ?auto_692922 ) ) ( not ( = ?auto_692915 ?auto_692923 ) ) ( not ( = ?auto_692915 ?auto_692924 ) ) ( not ( = ?auto_692915 ?auto_692925 ) ) ( not ( = ?auto_692915 ?auto_692926 ) ) ( not ( = ?auto_692915 ?auto_692927 ) ) ( not ( = ?auto_692915 ?auto_692928 ) ) ( not ( = ?auto_692916 ?auto_692917 ) ) ( not ( = ?auto_692916 ?auto_692918 ) ) ( not ( = ?auto_692916 ?auto_692919 ) ) ( not ( = ?auto_692916 ?auto_692920 ) ) ( not ( = ?auto_692916 ?auto_692921 ) ) ( not ( = ?auto_692916 ?auto_692922 ) ) ( not ( = ?auto_692916 ?auto_692923 ) ) ( not ( = ?auto_692916 ?auto_692924 ) ) ( not ( = ?auto_692916 ?auto_692925 ) ) ( not ( = ?auto_692916 ?auto_692926 ) ) ( not ( = ?auto_692916 ?auto_692927 ) ) ( not ( = ?auto_692916 ?auto_692928 ) ) ( not ( = ?auto_692917 ?auto_692918 ) ) ( not ( = ?auto_692917 ?auto_692919 ) ) ( not ( = ?auto_692917 ?auto_692920 ) ) ( not ( = ?auto_692917 ?auto_692921 ) ) ( not ( = ?auto_692917 ?auto_692922 ) ) ( not ( = ?auto_692917 ?auto_692923 ) ) ( not ( = ?auto_692917 ?auto_692924 ) ) ( not ( = ?auto_692917 ?auto_692925 ) ) ( not ( = ?auto_692917 ?auto_692926 ) ) ( not ( = ?auto_692917 ?auto_692927 ) ) ( not ( = ?auto_692917 ?auto_692928 ) ) ( not ( = ?auto_692918 ?auto_692919 ) ) ( not ( = ?auto_692918 ?auto_692920 ) ) ( not ( = ?auto_692918 ?auto_692921 ) ) ( not ( = ?auto_692918 ?auto_692922 ) ) ( not ( = ?auto_692918 ?auto_692923 ) ) ( not ( = ?auto_692918 ?auto_692924 ) ) ( not ( = ?auto_692918 ?auto_692925 ) ) ( not ( = ?auto_692918 ?auto_692926 ) ) ( not ( = ?auto_692918 ?auto_692927 ) ) ( not ( = ?auto_692918 ?auto_692928 ) ) ( not ( = ?auto_692919 ?auto_692920 ) ) ( not ( = ?auto_692919 ?auto_692921 ) ) ( not ( = ?auto_692919 ?auto_692922 ) ) ( not ( = ?auto_692919 ?auto_692923 ) ) ( not ( = ?auto_692919 ?auto_692924 ) ) ( not ( = ?auto_692919 ?auto_692925 ) ) ( not ( = ?auto_692919 ?auto_692926 ) ) ( not ( = ?auto_692919 ?auto_692927 ) ) ( not ( = ?auto_692919 ?auto_692928 ) ) ( not ( = ?auto_692920 ?auto_692921 ) ) ( not ( = ?auto_692920 ?auto_692922 ) ) ( not ( = ?auto_692920 ?auto_692923 ) ) ( not ( = ?auto_692920 ?auto_692924 ) ) ( not ( = ?auto_692920 ?auto_692925 ) ) ( not ( = ?auto_692920 ?auto_692926 ) ) ( not ( = ?auto_692920 ?auto_692927 ) ) ( not ( = ?auto_692920 ?auto_692928 ) ) ( not ( = ?auto_692921 ?auto_692922 ) ) ( not ( = ?auto_692921 ?auto_692923 ) ) ( not ( = ?auto_692921 ?auto_692924 ) ) ( not ( = ?auto_692921 ?auto_692925 ) ) ( not ( = ?auto_692921 ?auto_692926 ) ) ( not ( = ?auto_692921 ?auto_692927 ) ) ( not ( = ?auto_692921 ?auto_692928 ) ) ( not ( = ?auto_692922 ?auto_692923 ) ) ( not ( = ?auto_692922 ?auto_692924 ) ) ( not ( = ?auto_692922 ?auto_692925 ) ) ( not ( = ?auto_692922 ?auto_692926 ) ) ( not ( = ?auto_692922 ?auto_692927 ) ) ( not ( = ?auto_692922 ?auto_692928 ) ) ( not ( = ?auto_692923 ?auto_692924 ) ) ( not ( = ?auto_692923 ?auto_692925 ) ) ( not ( = ?auto_692923 ?auto_692926 ) ) ( not ( = ?auto_692923 ?auto_692927 ) ) ( not ( = ?auto_692923 ?auto_692928 ) ) ( not ( = ?auto_692924 ?auto_692925 ) ) ( not ( = ?auto_692924 ?auto_692926 ) ) ( not ( = ?auto_692924 ?auto_692927 ) ) ( not ( = ?auto_692924 ?auto_692928 ) ) ( not ( = ?auto_692925 ?auto_692926 ) ) ( not ( = ?auto_692925 ?auto_692927 ) ) ( not ( = ?auto_692925 ?auto_692928 ) ) ( not ( = ?auto_692926 ?auto_692927 ) ) ( not ( = ?auto_692926 ?auto_692928 ) ) ( not ( = ?auto_692927 ?auto_692928 ) ) ( ON ?auto_692926 ?auto_692927 ) ( ON ?auto_692925 ?auto_692926 ) ( ON ?auto_692924 ?auto_692925 ) ( CLEAR ?auto_692922 ) ( ON ?auto_692923 ?auto_692924 ) ( CLEAR ?auto_692923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_692912 ?auto_692913 ?auto_692914 ?auto_692915 ?auto_692916 ?auto_692917 ?auto_692918 ?auto_692919 ?auto_692920 ?auto_692921 ?auto_692922 ?auto_692923 )
      ( MAKE-16PILE ?auto_692912 ?auto_692913 ?auto_692914 ?auto_692915 ?auto_692916 ?auto_692917 ?auto_692918 ?auto_692919 ?auto_692920 ?auto_692921 ?auto_692922 ?auto_692923 ?auto_692924 ?auto_692925 ?auto_692926 ?auto_692927 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_692978 - BLOCK
      ?auto_692979 - BLOCK
      ?auto_692980 - BLOCK
      ?auto_692981 - BLOCK
      ?auto_692982 - BLOCK
      ?auto_692983 - BLOCK
      ?auto_692984 - BLOCK
      ?auto_692985 - BLOCK
      ?auto_692986 - BLOCK
      ?auto_692987 - BLOCK
      ?auto_692988 - BLOCK
      ?auto_692989 - BLOCK
      ?auto_692990 - BLOCK
      ?auto_692991 - BLOCK
      ?auto_692992 - BLOCK
      ?auto_692993 - BLOCK
    )
    :vars
    (
      ?auto_692994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_692993 ?auto_692994 ) ( ON-TABLE ?auto_692978 ) ( ON ?auto_692979 ?auto_692978 ) ( ON ?auto_692980 ?auto_692979 ) ( ON ?auto_692981 ?auto_692980 ) ( ON ?auto_692982 ?auto_692981 ) ( ON ?auto_692983 ?auto_692982 ) ( ON ?auto_692984 ?auto_692983 ) ( ON ?auto_692985 ?auto_692984 ) ( ON ?auto_692986 ?auto_692985 ) ( ON ?auto_692987 ?auto_692986 ) ( not ( = ?auto_692978 ?auto_692979 ) ) ( not ( = ?auto_692978 ?auto_692980 ) ) ( not ( = ?auto_692978 ?auto_692981 ) ) ( not ( = ?auto_692978 ?auto_692982 ) ) ( not ( = ?auto_692978 ?auto_692983 ) ) ( not ( = ?auto_692978 ?auto_692984 ) ) ( not ( = ?auto_692978 ?auto_692985 ) ) ( not ( = ?auto_692978 ?auto_692986 ) ) ( not ( = ?auto_692978 ?auto_692987 ) ) ( not ( = ?auto_692978 ?auto_692988 ) ) ( not ( = ?auto_692978 ?auto_692989 ) ) ( not ( = ?auto_692978 ?auto_692990 ) ) ( not ( = ?auto_692978 ?auto_692991 ) ) ( not ( = ?auto_692978 ?auto_692992 ) ) ( not ( = ?auto_692978 ?auto_692993 ) ) ( not ( = ?auto_692978 ?auto_692994 ) ) ( not ( = ?auto_692979 ?auto_692980 ) ) ( not ( = ?auto_692979 ?auto_692981 ) ) ( not ( = ?auto_692979 ?auto_692982 ) ) ( not ( = ?auto_692979 ?auto_692983 ) ) ( not ( = ?auto_692979 ?auto_692984 ) ) ( not ( = ?auto_692979 ?auto_692985 ) ) ( not ( = ?auto_692979 ?auto_692986 ) ) ( not ( = ?auto_692979 ?auto_692987 ) ) ( not ( = ?auto_692979 ?auto_692988 ) ) ( not ( = ?auto_692979 ?auto_692989 ) ) ( not ( = ?auto_692979 ?auto_692990 ) ) ( not ( = ?auto_692979 ?auto_692991 ) ) ( not ( = ?auto_692979 ?auto_692992 ) ) ( not ( = ?auto_692979 ?auto_692993 ) ) ( not ( = ?auto_692979 ?auto_692994 ) ) ( not ( = ?auto_692980 ?auto_692981 ) ) ( not ( = ?auto_692980 ?auto_692982 ) ) ( not ( = ?auto_692980 ?auto_692983 ) ) ( not ( = ?auto_692980 ?auto_692984 ) ) ( not ( = ?auto_692980 ?auto_692985 ) ) ( not ( = ?auto_692980 ?auto_692986 ) ) ( not ( = ?auto_692980 ?auto_692987 ) ) ( not ( = ?auto_692980 ?auto_692988 ) ) ( not ( = ?auto_692980 ?auto_692989 ) ) ( not ( = ?auto_692980 ?auto_692990 ) ) ( not ( = ?auto_692980 ?auto_692991 ) ) ( not ( = ?auto_692980 ?auto_692992 ) ) ( not ( = ?auto_692980 ?auto_692993 ) ) ( not ( = ?auto_692980 ?auto_692994 ) ) ( not ( = ?auto_692981 ?auto_692982 ) ) ( not ( = ?auto_692981 ?auto_692983 ) ) ( not ( = ?auto_692981 ?auto_692984 ) ) ( not ( = ?auto_692981 ?auto_692985 ) ) ( not ( = ?auto_692981 ?auto_692986 ) ) ( not ( = ?auto_692981 ?auto_692987 ) ) ( not ( = ?auto_692981 ?auto_692988 ) ) ( not ( = ?auto_692981 ?auto_692989 ) ) ( not ( = ?auto_692981 ?auto_692990 ) ) ( not ( = ?auto_692981 ?auto_692991 ) ) ( not ( = ?auto_692981 ?auto_692992 ) ) ( not ( = ?auto_692981 ?auto_692993 ) ) ( not ( = ?auto_692981 ?auto_692994 ) ) ( not ( = ?auto_692982 ?auto_692983 ) ) ( not ( = ?auto_692982 ?auto_692984 ) ) ( not ( = ?auto_692982 ?auto_692985 ) ) ( not ( = ?auto_692982 ?auto_692986 ) ) ( not ( = ?auto_692982 ?auto_692987 ) ) ( not ( = ?auto_692982 ?auto_692988 ) ) ( not ( = ?auto_692982 ?auto_692989 ) ) ( not ( = ?auto_692982 ?auto_692990 ) ) ( not ( = ?auto_692982 ?auto_692991 ) ) ( not ( = ?auto_692982 ?auto_692992 ) ) ( not ( = ?auto_692982 ?auto_692993 ) ) ( not ( = ?auto_692982 ?auto_692994 ) ) ( not ( = ?auto_692983 ?auto_692984 ) ) ( not ( = ?auto_692983 ?auto_692985 ) ) ( not ( = ?auto_692983 ?auto_692986 ) ) ( not ( = ?auto_692983 ?auto_692987 ) ) ( not ( = ?auto_692983 ?auto_692988 ) ) ( not ( = ?auto_692983 ?auto_692989 ) ) ( not ( = ?auto_692983 ?auto_692990 ) ) ( not ( = ?auto_692983 ?auto_692991 ) ) ( not ( = ?auto_692983 ?auto_692992 ) ) ( not ( = ?auto_692983 ?auto_692993 ) ) ( not ( = ?auto_692983 ?auto_692994 ) ) ( not ( = ?auto_692984 ?auto_692985 ) ) ( not ( = ?auto_692984 ?auto_692986 ) ) ( not ( = ?auto_692984 ?auto_692987 ) ) ( not ( = ?auto_692984 ?auto_692988 ) ) ( not ( = ?auto_692984 ?auto_692989 ) ) ( not ( = ?auto_692984 ?auto_692990 ) ) ( not ( = ?auto_692984 ?auto_692991 ) ) ( not ( = ?auto_692984 ?auto_692992 ) ) ( not ( = ?auto_692984 ?auto_692993 ) ) ( not ( = ?auto_692984 ?auto_692994 ) ) ( not ( = ?auto_692985 ?auto_692986 ) ) ( not ( = ?auto_692985 ?auto_692987 ) ) ( not ( = ?auto_692985 ?auto_692988 ) ) ( not ( = ?auto_692985 ?auto_692989 ) ) ( not ( = ?auto_692985 ?auto_692990 ) ) ( not ( = ?auto_692985 ?auto_692991 ) ) ( not ( = ?auto_692985 ?auto_692992 ) ) ( not ( = ?auto_692985 ?auto_692993 ) ) ( not ( = ?auto_692985 ?auto_692994 ) ) ( not ( = ?auto_692986 ?auto_692987 ) ) ( not ( = ?auto_692986 ?auto_692988 ) ) ( not ( = ?auto_692986 ?auto_692989 ) ) ( not ( = ?auto_692986 ?auto_692990 ) ) ( not ( = ?auto_692986 ?auto_692991 ) ) ( not ( = ?auto_692986 ?auto_692992 ) ) ( not ( = ?auto_692986 ?auto_692993 ) ) ( not ( = ?auto_692986 ?auto_692994 ) ) ( not ( = ?auto_692987 ?auto_692988 ) ) ( not ( = ?auto_692987 ?auto_692989 ) ) ( not ( = ?auto_692987 ?auto_692990 ) ) ( not ( = ?auto_692987 ?auto_692991 ) ) ( not ( = ?auto_692987 ?auto_692992 ) ) ( not ( = ?auto_692987 ?auto_692993 ) ) ( not ( = ?auto_692987 ?auto_692994 ) ) ( not ( = ?auto_692988 ?auto_692989 ) ) ( not ( = ?auto_692988 ?auto_692990 ) ) ( not ( = ?auto_692988 ?auto_692991 ) ) ( not ( = ?auto_692988 ?auto_692992 ) ) ( not ( = ?auto_692988 ?auto_692993 ) ) ( not ( = ?auto_692988 ?auto_692994 ) ) ( not ( = ?auto_692989 ?auto_692990 ) ) ( not ( = ?auto_692989 ?auto_692991 ) ) ( not ( = ?auto_692989 ?auto_692992 ) ) ( not ( = ?auto_692989 ?auto_692993 ) ) ( not ( = ?auto_692989 ?auto_692994 ) ) ( not ( = ?auto_692990 ?auto_692991 ) ) ( not ( = ?auto_692990 ?auto_692992 ) ) ( not ( = ?auto_692990 ?auto_692993 ) ) ( not ( = ?auto_692990 ?auto_692994 ) ) ( not ( = ?auto_692991 ?auto_692992 ) ) ( not ( = ?auto_692991 ?auto_692993 ) ) ( not ( = ?auto_692991 ?auto_692994 ) ) ( not ( = ?auto_692992 ?auto_692993 ) ) ( not ( = ?auto_692992 ?auto_692994 ) ) ( not ( = ?auto_692993 ?auto_692994 ) ) ( ON ?auto_692992 ?auto_692993 ) ( ON ?auto_692991 ?auto_692992 ) ( ON ?auto_692990 ?auto_692991 ) ( ON ?auto_692989 ?auto_692990 ) ( CLEAR ?auto_692987 ) ( ON ?auto_692988 ?auto_692989 ) ( CLEAR ?auto_692988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_692978 ?auto_692979 ?auto_692980 ?auto_692981 ?auto_692982 ?auto_692983 ?auto_692984 ?auto_692985 ?auto_692986 ?auto_692987 ?auto_692988 )
      ( MAKE-16PILE ?auto_692978 ?auto_692979 ?auto_692980 ?auto_692981 ?auto_692982 ?auto_692983 ?auto_692984 ?auto_692985 ?auto_692986 ?auto_692987 ?auto_692988 ?auto_692989 ?auto_692990 ?auto_692991 ?auto_692992 ?auto_692993 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_693044 - BLOCK
      ?auto_693045 - BLOCK
      ?auto_693046 - BLOCK
      ?auto_693047 - BLOCK
      ?auto_693048 - BLOCK
      ?auto_693049 - BLOCK
      ?auto_693050 - BLOCK
      ?auto_693051 - BLOCK
      ?auto_693052 - BLOCK
      ?auto_693053 - BLOCK
      ?auto_693054 - BLOCK
      ?auto_693055 - BLOCK
      ?auto_693056 - BLOCK
      ?auto_693057 - BLOCK
      ?auto_693058 - BLOCK
      ?auto_693059 - BLOCK
    )
    :vars
    (
      ?auto_693060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_693059 ?auto_693060 ) ( ON-TABLE ?auto_693044 ) ( ON ?auto_693045 ?auto_693044 ) ( ON ?auto_693046 ?auto_693045 ) ( ON ?auto_693047 ?auto_693046 ) ( ON ?auto_693048 ?auto_693047 ) ( ON ?auto_693049 ?auto_693048 ) ( ON ?auto_693050 ?auto_693049 ) ( ON ?auto_693051 ?auto_693050 ) ( ON ?auto_693052 ?auto_693051 ) ( not ( = ?auto_693044 ?auto_693045 ) ) ( not ( = ?auto_693044 ?auto_693046 ) ) ( not ( = ?auto_693044 ?auto_693047 ) ) ( not ( = ?auto_693044 ?auto_693048 ) ) ( not ( = ?auto_693044 ?auto_693049 ) ) ( not ( = ?auto_693044 ?auto_693050 ) ) ( not ( = ?auto_693044 ?auto_693051 ) ) ( not ( = ?auto_693044 ?auto_693052 ) ) ( not ( = ?auto_693044 ?auto_693053 ) ) ( not ( = ?auto_693044 ?auto_693054 ) ) ( not ( = ?auto_693044 ?auto_693055 ) ) ( not ( = ?auto_693044 ?auto_693056 ) ) ( not ( = ?auto_693044 ?auto_693057 ) ) ( not ( = ?auto_693044 ?auto_693058 ) ) ( not ( = ?auto_693044 ?auto_693059 ) ) ( not ( = ?auto_693044 ?auto_693060 ) ) ( not ( = ?auto_693045 ?auto_693046 ) ) ( not ( = ?auto_693045 ?auto_693047 ) ) ( not ( = ?auto_693045 ?auto_693048 ) ) ( not ( = ?auto_693045 ?auto_693049 ) ) ( not ( = ?auto_693045 ?auto_693050 ) ) ( not ( = ?auto_693045 ?auto_693051 ) ) ( not ( = ?auto_693045 ?auto_693052 ) ) ( not ( = ?auto_693045 ?auto_693053 ) ) ( not ( = ?auto_693045 ?auto_693054 ) ) ( not ( = ?auto_693045 ?auto_693055 ) ) ( not ( = ?auto_693045 ?auto_693056 ) ) ( not ( = ?auto_693045 ?auto_693057 ) ) ( not ( = ?auto_693045 ?auto_693058 ) ) ( not ( = ?auto_693045 ?auto_693059 ) ) ( not ( = ?auto_693045 ?auto_693060 ) ) ( not ( = ?auto_693046 ?auto_693047 ) ) ( not ( = ?auto_693046 ?auto_693048 ) ) ( not ( = ?auto_693046 ?auto_693049 ) ) ( not ( = ?auto_693046 ?auto_693050 ) ) ( not ( = ?auto_693046 ?auto_693051 ) ) ( not ( = ?auto_693046 ?auto_693052 ) ) ( not ( = ?auto_693046 ?auto_693053 ) ) ( not ( = ?auto_693046 ?auto_693054 ) ) ( not ( = ?auto_693046 ?auto_693055 ) ) ( not ( = ?auto_693046 ?auto_693056 ) ) ( not ( = ?auto_693046 ?auto_693057 ) ) ( not ( = ?auto_693046 ?auto_693058 ) ) ( not ( = ?auto_693046 ?auto_693059 ) ) ( not ( = ?auto_693046 ?auto_693060 ) ) ( not ( = ?auto_693047 ?auto_693048 ) ) ( not ( = ?auto_693047 ?auto_693049 ) ) ( not ( = ?auto_693047 ?auto_693050 ) ) ( not ( = ?auto_693047 ?auto_693051 ) ) ( not ( = ?auto_693047 ?auto_693052 ) ) ( not ( = ?auto_693047 ?auto_693053 ) ) ( not ( = ?auto_693047 ?auto_693054 ) ) ( not ( = ?auto_693047 ?auto_693055 ) ) ( not ( = ?auto_693047 ?auto_693056 ) ) ( not ( = ?auto_693047 ?auto_693057 ) ) ( not ( = ?auto_693047 ?auto_693058 ) ) ( not ( = ?auto_693047 ?auto_693059 ) ) ( not ( = ?auto_693047 ?auto_693060 ) ) ( not ( = ?auto_693048 ?auto_693049 ) ) ( not ( = ?auto_693048 ?auto_693050 ) ) ( not ( = ?auto_693048 ?auto_693051 ) ) ( not ( = ?auto_693048 ?auto_693052 ) ) ( not ( = ?auto_693048 ?auto_693053 ) ) ( not ( = ?auto_693048 ?auto_693054 ) ) ( not ( = ?auto_693048 ?auto_693055 ) ) ( not ( = ?auto_693048 ?auto_693056 ) ) ( not ( = ?auto_693048 ?auto_693057 ) ) ( not ( = ?auto_693048 ?auto_693058 ) ) ( not ( = ?auto_693048 ?auto_693059 ) ) ( not ( = ?auto_693048 ?auto_693060 ) ) ( not ( = ?auto_693049 ?auto_693050 ) ) ( not ( = ?auto_693049 ?auto_693051 ) ) ( not ( = ?auto_693049 ?auto_693052 ) ) ( not ( = ?auto_693049 ?auto_693053 ) ) ( not ( = ?auto_693049 ?auto_693054 ) ) ( not ( = ?auto_693049 ?auto_693055 ) ) ( not ( = ?auto_693049 ?auto_693056 ) ) ( not ( = ?auto_693049 ?auto_693057 ) ) ( not ( = ?auto_693049 ?auto_693058 ) ) ( not ( = ?auto_693049 ?auto_693059 ) ) ( not ( = ?auto_693049 ?auto_693060 ) ) ( not ( = ?auto_693050 ?auto_693051 ) ) ( not ( = ?auto_693050 ?auto_693052 ) ) ( not ( = ?auto_693050 ?auto_693053 ) ) ( not ( = ?auto_693050 ?auto_693054 ) ) ( not ( = ?auto_693050 ?auto_693055 ) ) ( not ( = ?auto_693050 ?auto_693056 ) ) ( not ( = ?auto_693050 ?auto_693057 ) ) ( not ( = ?auto_693050 ?auto_693058 ) ) ( not ( = ?auto_693050 ?auto_693059 ) ) ( not ( = ?auto_693050 ?auto_693060 ) ) ( not ( = ?auto_693051 ?auto_693052 ) ) ( not ( = ?auto_693051 ?auto_693053 ) ) ( not ( = ?auto_693051 ?auto_693054 ) ) ( not ( = ?auto_693051 ?auto_693055 ) ) ( not ( = ?auto_693051 ?auto_693056 ) ) ( not ( = ?auto_693051 ?auto_693057 ) ) ( not ( = ?auto_693051 ?auto_693058 ) ) ( not ( = ?auto_693051 ?auto_693059 ) ) ( not ( = ?auto_693051 ?auto_693060 ) ) ( not ( = ?auto_693052 ?auto_693053 ) ) ( not ( = ?auto_693052 ?auto_693054 ) ) ( not ( = ?auto_693052 ?auto_693055 ) ) ( not ( = ?auto_693052 ?auto_693056 ) ) ( not ( = ?auto_693052 ?auto_693057 ) ) ( not ( = ?auto_693052 ?auto_693058 ) ) ( not ( = ?auto_693052 ?auto_693059 ) ) ( not ( = ?auto_693052 ?auto_693060 ) ) ( not ( = ?auto_693053 ?auto_693054 ) ) ( not ( = ?auto_693053 ?auto_693055 ) ) ( not ( = ?auto_693053 ?auto_693056 ) ) ( not ( = ?auto_693053 ?auto_693057 ) ) ( not ( = ?auto_693053 ?auto_693058 ) ) ( not ( = ?auto_693053 ?auto_693059 ) ) ( not ( = ?auto_693053 ?auto_693060 ) ) ( not ( = ?auto_693054 ?auto_693055 ) ) ( not ( = ?auto_693054 ?auto_693056 ) ) ( not ( = ?auto_693054 ?auto_693057 ) ) ( not ( = ?auto_693054 ?auto_693058 ) ) ( not ( = ?auto_693054 ?auto_693059 ) ) ( not ( = ?auto_693054 ?auto_693060 ) ) ( not ( = ?auto_693055 ?auto_693056 ) ) ( not ( = ?auto_693055 ?auto_693057 ) ) ( not ( = ?auto_693055 ?auto_693058 ) ) ( not ( = ?auto_693055 ?auto_693059 ) ) ( not ( = ?auto_693055 ?auto_693060 ) ) ( not ( = ?auto_693056 ?auto_693057 ) ) ( not ( = ?auto_693056 ?auto_693058 ) ) ( not ( = ?auto_693056 ?auto_693059 ) ) ( not ( = ?auto_693056 ?auto_693060 ) ) ( not ( = ?auto_693057 ?auto_693058 ) ) ( not ( = ?auto_693057 ?auto_693059 ) ) ( not ( = ?auto_693057 ?auto_693060 ) ) ( not ( = ?auto_693058 ?auto_693059 ) ) ( not ( = ?auto_693058 ?auto_693060 ) ) ( not ( = ?auto_693059 ?auto_693060 ) ) ( ON ?auto_693058 ?auto_693059 ) ( ON ?auto_693057 ?auto_693058 ) ( ON ?auto_693056 ?auto_693057 ) ( ON ?auto_693055 ?auto_693056 ) ( ON ?auto_693054 ?auto_693055 ) ( CLEAR ?auto_693052 ) ( ON ?auto_693053 ?auto_693054 ) ( CLEAR ?auto_693053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_693044 ?auto_693045 ?auto_693046 ?auto_693047 ?auto_693048 ?auto_693049 ?auto_693050 ?auto_693051 ?auto_693052 ?auto_693053 )
      ( MAKE-16PILE ?auto_693044 ?auto_693045 ?auto_693046 ?auto_693047 ?auto_693048 ?auto_693049 ?auto_693050 ?auto_693051 ?auto_693052 ?auto_693053 ?auto_693054 ?auto_693055 ?auto_693056 ?auto_693057 ?auto_693058 ?auto_693059 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_693110 - BLOCK
      ?auto_693111 - BLOCK
      ?auto_693112 - BLOCK
      ?auto_693113 - BLOCK
      ?auto_693114 - BLOCK
      ?auto_693115 - BLOCK
      ?auto_693116 - BLOCK
      ?auto_693117 - BLOCK
      ?auto_693118 - BLOCK
      ?auto_693119 - BLOCK
      ?auto_693120 - BLOCK
      ?auto_693121 - BLOCK
      ?auto_693122 - BLOCK
      ?auto_693123 - BLOCK
      ?auto_693124 - BLOCK
      ?auto_693125 - BLOCK
    )
    :vars
    (
      ?auto_693126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_693125 ?auto_693126 ) ( ON-TABLE ?auto_693110 ) ( ON ?auto_693111 ?auto_693110 ) ( ON ?auto_693112 ?auto_693111 ) ( ON ?auto_693113 ?auto_693112 ) ( ON ?auto_693114 ?auto_693113 ) ( ON ?auto_693115 ?auto_693114 ) ( ON ?auto_693116 ?auto_693115 ) ( ON ?auto_693117 ?auto_693116 ) ( not ( = ?auto_693110 ?auto_693111 ) ) ( not ( = ?auto_693110 ?auto_693112 ) ) ( not ( = ?auto_693110 ?auto_693113 ) ) ( not ( = ?auto_693110 ?auto_693114 ) ) ( not ( = ?auto_693110 ?auto_693115 ) ) ( not ( = ?auto_693110 ?auto_693116 ) ) ( not ( = ?auto_693110 ?auto_693117 ) ) ( not ( = ?auto_693110 ?auto_693118 ) ) ( not ( = ?auto_693110 ?auto_693119 ) ) ( not ( = ?auto_693110 ?auto_693120 ) ) ( not ( = ?auto_693110 ?auto_693121 ) ) ( not ( = ?auto_693110 ?auto_693122 ) ) ( not ( = ?auto_693110 ?auto_693123 ) ) ( not ( = ?auto_693110 ?auto_693124 ) ) ( not ( = ?auto_693110 ?auto_693125 ) ) ( not ( = ?auto_693110 ?auto_693126 ) ) ( not ( = ?auto_693111 ?auto_693112 ) ) ( not ( = ?auto_693111 ?auto_693113 ) ) ( not ( = ?auto_693111 ?auto_693114 ) ) ( not ( = ?auto_693111 ?auto_693115 ) ) ( not ( = ?auto_693111 ?auto_693116 ) ) ( not ( = ?auto_693111 ?auto_693117 ) ) ( not ( = ?auto_693111 ?auto_693118 ) ) ( not ( = ?auto_693111 ?auto_693119 ) ) ( not ( = ?auto_693111 ?auto_693120 ) ) ( not ( = ?auto_693111 ?auto_693121 ) ) ( not ( = ?auto_693111 ?auto_693122 ) ) ( not ( = ?auto_693111 ?auto_693123 ) ) ( not ( = ?auto_693111 ?auto_693124 ) ) ( not ( = ?auto_693111 ?auto_693125 ) ) ( not ( = ?auto_693111 ?auto_693126 ) ) ( not ( = ?auto_693112 ?auto_693113 ) ) ( not ( = ?auto_693112 ?auto_693114 ) ) ( not ( = ?auto_693112 ?auto_693115 ) ) ( not ( = ?auto_693112 ?auto_693116 ) ) ( not ( = ?auto_693112 ?auto_693117 ) ) ( not ( = ?auto_693112 ?auto_693118 ) ) ( not ( = ?auto_693112 ?auto_693119 ) ) ( not ( = ?auto_693112 ?auto_693120 ) ) ( not ( = ?auto_693112 ?auto_693121 ) ) ( not ( = ?auto_693112 ?auto_693122 ) ) ( not ( = ?auto_693112 ?auto_693123 ) ) ( not ( = ?auto_693112 ?auto_693124 ) ) ( not ( = ?auto_693112 ?auto_693125 ) ) ( not ( = ?auto_693112 ?auto_693126 ) ) ( not ( = ?auto_693113 ?auto_693114 ) ) ( not ( = ?auto_693113 ?auto_693115 ) ) ( not ( = ?auto_693113 ?auto_693116 ) ) ( not ( = ?auto_693113 ?auto_693117 ) ) ( not ( = ?auto_693113 ?auto_693118 ) ) ( not ( = ?auto_693113 ?auto_693119 ) ) ( not ( = ?auto_693113 ?auto_693120 ) ) ( not ( = ?auto_693113 ?auto_693121 ) ) ( not ( = ?auto_693113 ?auto_693122 ) ) ( not ( = ?auto_693113 ?auto_693123 ) ) ( not ( = ?auto_693113 ?auto_693124 ) ) ( not ( = ?auto_693113 ?auto_693125 ) ) ( not ( = ?auto_693113 ?auto_693126 ) ) ( not ( = ?auto_693114 ?auto_693115 ) ) ( not ( = ?auto_693114 ?auto_693116 ) ) ( not ( = ?auto_693114 ?auto_693117 ) ) ( not ( = ?auto_693114 ?auto_693118 ) ) ( not ( = ?auto_693114 ?auto_693119 ) ) ( not ( = ?auto_693114 ?auto_693120 ) ) ( not ( = ?auto_693114 ?auto_693121 ) ) ( not ( = ?auto_693114 ?auto_693122 ) ) ( not ( = ?auto_693114 ?auto_693123 ) ) ( not ( = ?auto_693114 ?auto_693124 ) ) ( not ( = ?auto_693114 ?auto_693125 ) ) ( not ( = ?auto_693114 ?auto_693126 ) ) ( not ( = ?auto_693115 ?auto_693116 ) ) ( not ( = ?auto_693115 ?auto_693117 ) ) ( not ( = ?auto_693115 ?auto_693118 ) ) ( not ( = ?auto_693115 ?auto_693119 ) ) ( not ( = ?auto_693115 ?auto_693120 ) ) ( not ( = ?auto_693115 ?auto_693121 ) ) ( not ( = ?auto_693115 ?auto_693122 ) ) ( not ( = ?auto_693115 ?auto_693123 ) ) ( not ( = ?auto_693115 ?auto_693124 ) ) ( not ( = ?auto_693115 ?auto_693125 ) ) ( not ( = ?auto_693115 ?auto_693126 ) ) ( not ( = ?auto_693116 ?auto_693117 ) ) ( not ( = ?auto_693116 ?auto_693118 ) ) ( not ( = ?auto_693116 ?auto_693119 ) ) ( not ( = ?auto_693116 ?auto_693120 ) ) ( not ( = ?auto_693116 ?auto_693121 ) ) ( not ( = ?auto_693116 ?auto_693122 ) ) ( not ( = ?auto_693116 ?auto_693123 ) ) ( not ( = ?auto_693116 ?auto_693124 ) ) ( not ( = ?auto_693116 ?auto_693125 ) ) ( not ( = ?auto_693116 ?auto_693126 ) ) ( not ( = ?auto_693117 ?auto_693118 ) ) ( not ( = ?auto_693117 ?auto_693119 ) ) ( not ( = ?auto_693117 ?auto_693120 ) ) ( not ( = ?auto_693117 ?auto_693121 ) ) ( not ( = ?auto_693117 ?auto_693122 ) ) ( not ( = ?auto_693117 ?auto_693123 ) ) ( not ( = ?auto_693117 ?auto_693124 ) ) ( not ( = ?auto_693117 ?auto_693125 ) ) ( not ( = ?auto_693117 ?auto_693126 ) ) ( not ( = ?auto_693118 ?auto_693119 ) ) ( not ( = ?auto_693118 ?auto_693120 ) ) ( not ( = ?auto_693118 ?auto_693121 ) ) ( not ( = ?auto_693118 ?auto_693122 ) ) ( not ( = ?auto_693118 ?auto_693123 ) ) ( not ( = ?auto_693118 ?auto_693124 ) ) ( not ( = ?auto_693118 ?auto_693125 ) ) ( not ( = ?auto_693118 ?auto_693126 ) ) ( not ( = ?auto_693119 ?auto_693120 ) ) ( not ( = ?auto_693119 ?auto_693121 ) ) ( not ( = ?auto_693119 ?auto_693122 ) ) ( not ( = ?auto_693119 ?auto_693123 ) ) ( not ( = ?auto_693119 ?auto_693124 ) ) ( not ( = ?auto_693119 ?auto_693125 ) ) ( not ( = ?auto_693119 ?auto_693126 ) ) ( not ( = ?auto_693120 ?auto_693121 ) ) ( not ( = ?auto_693120 ?auto_693122 ) ) ( not ( = ?auto_693120 ?auto_693123 ) ) ( not ( = ?auto_693120 ?auto_693124 ) ) ( not ( = ?auto_693120 ?auto_693125 ) ) ( not ( = ?auto_693120 ?auto_693126 ) ) ( not ( = ?auto_693121 ?auto_693122 ) ) ( not ( = ?auto_693121 ?auto_693123 ) ) ( not ( = ?auto_693121 ?auto_693124 ) ) ( not ( = ?auto_693121 ?auto_693125 ) ) ( not ( = ?auto_693121 ?auto_693126 ) ) ( not ( = ?auto_693122 ?auto_693123 ) ) ( not ( = ?auto_693122 ?auto_693124 ) ) ( not ( = ?auto_693122 ?auto_693125 ) ) ( not ( = ?auto_693122 ?auto_693126 ) ) ( not ( = ?auto_693123 ?auto_693124 ) ) ( not ( = ?auto_693123 ?auto_693125 ) ) ( not ( = ?auto_693123 ?auto_693126 ) ) ( not ( = ?auto_693124 ?auto_693125 ) ) ( not ( = ?auto_693124 ?auto_693126 ) ) ( not ( = ?auto_693125 ?auto_693126 ) ) ( ON ?auto_693124 ?auto_693125 ) ( ON ?auto_693123 ?auto_693124 ) ( ON ?auto_693122 ?auto_693123 ) ( ON ?auto_693121 ?auto_693122 ) ( ON ?auto_693120 ?auto_693121 ) ( ON ?auto_693119 ?auto_693120 ) ( CLEAR ?auto_693117 ) ( ON ?auto_693118 ?auto_693119 ) ( CLEAR ?auto_693118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_693110 ?auto_693111 ?auto_693112 ?auto_693113 ?auto_693114 ?auto_693115 ?auto_693116 ?auto_693117 ?auto_693118 )
      ( MAKE-16PILE ?auto_693110 ?auto_693111 ?auto_693112 ?auto_693113 ?auto_693114 ?auto_693115 ?auto_693116 ?auto_693117 ?auto_693118 ?auto_693119 ?auto_693120 ?auto_693121 ?auto_693122 ?auto_693123 ?auto_693124 ?auto_693125 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_693176 - BLOCK
      ?auto_693177 - BLOCK
      ?auto_693178 - BLOCK
      ?auto_693179 - BLOCK
      ?auto_693180 - BLOCK
      ?auto_693181 - BLOCK
      ?auto_693182 - BLOCK
      ?auto_693183 - BLOCK
      ?auto_693184 - BLOCK
      ?auto_693185 - BLOCK
      ?auto_693186 - BLOCK
      ?auto_693187 - BLOCK
      ?auto_693188 - BLOCK
      ?auto_693189 - BLOCK
      ?auto_693190 - BLOCK
      ?auto_693191 - BLOCK
    )
    :vars
    (
      ?auto_693192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_693191 ?auto_693192 ) ( ON-TABLE ?auto_693176 ) ( ON ?auto_693177 ?auto_693176 ) ( ON ?auto_693178 ?auto_693177 ) ( ON ?auto_693179 ?auto_693178 ) ( ON ?auto_693180 ?auto_693179 ) ( ON ?auto_693181 ?auto_693180 ) ( ON ?auto_693182 ?auto_693181 ) ( not ( = ?auto_693176 ?auto_693177 ) ) ( not ( = ?auto_693176 ?auto_693178 ) ) ( not ( = ?auto_693176 ?auto_693179 ) ) ( not ( = ?auto_693176 ?auto_693180 ) ) ( not ( = ?auto_693176 ?auto_693181 ) ) ( not ( = ?auto_693176 ?auto_693182 ) ) ( not ( = ?auto_693176 ?auto_693183 ) ) ( not ( = ?auto_693176 ?auto_693184 ) ) ( not ( = ?auto_693176 ?auto_693185 ) ) ( not ( = ?auto_693176 ?auto_693186 ) ) ( not ( = ?auto_693176 ?auto_693187 ) ) ( not ( = ?auto_693176 ?auto_693188 ) ) ( not ( = ?auto_693176 ?auto_693189 ) ) ( not ( = ?auto_693176 ?auto_693190 ) ) ( not ( = ?auto_693176 ?auto_693191 ) ) ( not ( = ?auto_693176 ?auto_693192 ) ) ( not ( = ?auto_693177 ?auto_693178 ) ) ( not ( = ?auto_693177 ?auto_693179 ) ) ( not ( = ?auto_693177 ?auto_693180 ) ) ( not ( = ?auto_693177 ?auto_693181 ) ) ( not ( = ?auto_693177 ?auto_693182 ) ) ( not ( = ?auto_693177 ?auto_693183 ) ) ( not ( = ?auto_693177 ?auto_693184 ) ) ( not ( = ?auto_693177 ?auto_693185 ) ) ( not ( = ?auto_693177 ?auto_693186 ) ) ( not ( = ?auto_693177 ?auto_693187 ) ) ( not ( = ?auto_693177 ?auto_693188 ) ) ( not ( = ?auto_693177 ?auto_693189 ) ) ( not ( = ?auto_693177 ?auto_693190 ) ) ( not ( = ?auto_693177 ?auto_693191 ) ) ( not ( = ?auto_693177 ?auto_693192 ) ) ( not ( = ?auto_693178 ?auto_693179 ) ) ( not ( = ?auto_693178 ?auto_693180 ) ) ( not ( = ?auto_693178 ?auto_693181 ) ) ( not ( = ?auto_693178 ?auto_693182 ) ) ( not ( = ?auto_693178 ?auto_693183 ) ) ( not ( = ?auto_693178 ?auto_693184 ) ) ( not ( = ?auto_693178 ?auto_693185 ) ) ( not ( = ?auto_693178 ?auto_693186 ) ) ( not ( = ?auto_693178 ?auto_693187 ) ) ( not ( = ?auto_693178 ?auto_693188 ) ) ( not ( = ?auto_693178 ?auto_693189 ) ) ( not ( = ?auto_693178 ?auto_693190 ) ) ( not ( = ?auto_693178 ?auto_693191 ) ) ( not ( = ?auto_693178 ?auto_693192 ) ) ( not ( = ?auto_693179 ?auto_693180 ) ) ( not ( = ?auto_693179 ?auto_693181 ) ) ( not ( = ?auto_693179 ?auto_693182 ) ) ( not ( = ?auto_693179 ?auto_693183 ) ) ( not ( = ?auto_693179 ?auto_693184 ) ) ( not ( = ?auto_693179 ?auto_693185 ) ) ( not ( = ?auto_693179 ?auto_693186 ) ) ( not ( = ?auto_693179 ?auto_693187 ) ) ( not ( = ?auto_693179 ?auto_693188 ) ) ( not ( = ?auto_693179 ?auto_693189 ) ) ( not ( = ?auto_693179 ?auto_693190 ) ) ( not ( = ?auto_693179 ?auto_693191 ) ) ( not ( = ?auto_693179 ?auto_693192 ) ) ( not ( = ?auto_693180 ?auto_693181 ) ) ( not ( = ?auto_693180 ?auto_693182 ) ) ( not ( = ?auto_693180 ?auto_693183 ) ) ( not ( = ?auto_693180 ?auto_693184 ) ) ( not ( = ?auto_693180 ?auto_693185 ) ) ( not ( = ?auto_693180 ?auto_693186 ) ) ( not ( = ?auto_693180 ?auto_693187 ) ) ( not ( = ?auto_693180 ?auto_693188 ) ) ( not ( = ?auto_693180 ?auto_693189 ) ) ( not ( = ?auto_693180 ?auto_693190 ) ) ( not ( = ?auto_693180 ?auto_693191 ) ) ( not ( = ?auto_693180 ?auto_693192 ) ) ( not ( = ?auto_693181 ?auto_693182 ) ) ( not ( = ?auto_693181 ?auto_693183 ) ) ( not ( = ?auto_693181 ?auto_693184 ) ) ( not ( = ?auto_693181 ?auto_693185 ) ) ( not ( = ?auto_693181 ?auto_693186 ) ) ( not ( = ?auto_693181 ?auto_693187 ) ) ( not ( = ?auto_693181 ?auto_693188 ) ) ( not ( = ?auto_693181 ?auto_693189 ) ) ( not ( = ?auto_693181 ?auto_693190 ) ) ( not ( = ?auto_693181 ?auto_693191 ) ) ( not ( = ?auto_693181 ?auto_693192 ) ) ( not ( = ?auto_693182 ?auto_693183 ) ) ( not ( = ?auto_693182 ?auto_693184 ) ) ( not ( = ?auto_693182 ?auto_693185 ) ) ( not ( = ?auto_693182 ?auto_693186 ) ) ( not ( = ?auto_693182 ?auto_693187 ) ) ( not ( = ?auto_693182 ?auto_693188 ) ) ( not ( = ?auto_693182 ?auto_693189 ) ) ( not ( = ?auto_693182 ?auto_693190 ) ) ( not ( = ?auto_693182 ?auto_693191 ) ) ( not ( = ?auto_693182 ?auto_693192 ) ) ( not ( = ?auto_693183 ?auto_693184 ) ) ( not ( = ?auto_693183 ?auto_693185 ) ) ( not ( = ?auto_693183 ?auto_693186 ) ) ( not ( = ?auto_693183 ?auto_693187 ) ) ( not ( = ?auto_693183 ?auto_693188 ) ) ( not ( = ?auto_693183 ?auto_693189 ) ) ( not ( = ?auto_693183 ?auto_693190 ) ) ( not ( = ?auto_693183 ?auto_693191 ) ) ( not ( = ?auto_693183 ?auto_693192 ) ) ( not ( = ?auto_693184 ?auto_693185 ) ) ( not ( = ?auto_693184 ?auto_693186 ) ) ( not ( = ?auto_693184 ?auto_693187 ) ) ( not ( = ?auto_693184 ?auto_693188 ) ) ( not ( = ?auto_693184 ?auto_693189 ) ) ( not ( = ?auto_693184 ?auto_693190 ) ) ( not ( = ?auto_693184 ?auto_693191 ) ) ( not ( = ?auto_693184 ?auto_693192 ) ) ( not ( = ?auto_693185 ?auto_693186 ) ) ( not ( = ?auto_693185 ?auto_693187 ) ) ( not ( = ?auto_693185 ?auto_693188 ) ) ( not ( = ?auto_693185 ?auto_693189 ) ) ( not ( = ?auto_693185 ?auto_693190 ) ) ( not ( = ?auto_693185 ?auto_693191 ) ) ( not ( = ?auto_693185 ?auto_693192 ) ) ( not ( = ?auto_693186 ?auto_693187 ) ) ( not ( = ?auto_693186 ?auto_693188 ) ) ( not ( = ?auto_693186 ?auto_693189 ) ) ( not ( = ?auto_693186 ?auto_693190 ) ) ( not ( = ?auto_693186 ?auto_693191 ) ) ( not ( = ?auto_693186 ?auto_693192 ) ) ( not ( = ?auto_693187 ?auto_693188 ) ) ( not ( = ?auto_693187 ?auto_693189 ) ) ( not ( = ?auto_693187 ?auto_693190 ) ) ( not ( = ?auto_693187 ?auto_693191 ) ) ( not ( = ?auto_693187 ?auto_693192 ) ) ( not ( = ?auto_693188 ?auto_693189 ) ) ( not ( = ?auto_693188 ?auto_693190 ) ) ( not ( = ?auto_693188 ?auto_693191 ) ) ( not ( = ?auto_693188 ?auto_693192 ) ) ( not ( = ?auto_693189 ?auto_693190 ) ) ( not ( = ?auto_693189 ?auto_693191 ) ) ( not ( = ?auto_693189 ?auto_693192 ) ) ( not ( = ?auto_693190 ?auto_693191 ) ) ( not ( = ?auto_693190 ?auto_693192 ) ) ( not ( = ?auto_693191 ?auto_693192 ) ) ( ON ?auto_693190 ?auto_693191 ) ( ON ?auto_693189 ?auto_693190 ) ( ON ?auto_693188 ?auto_693189 ) ( ON ?auto_693187 ?auto_693188 ) ( ON ?auto_693186 ?auto_693187 ) ( ON ?auto_693185 ?auto_693186 ) ( ON ?auto_693184 ?auto_693185 ) ( CLEAR ?auto_693182 ) ( ON ?auto_693183 ?auto_693184 ) ( CLEAR ?auto_693183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_693176 ?auto_693177 ?auto_693178 ?auto_693179 ?auto_693180 ?auto_693181 ?auto_693182 ?auto_693183 )
      ( MAKE-16PILE ?auto_693176 ?auto_693177 ?auto_693178 ?auto_693179 ?auto_693180 ?auto_693181 ?auto_693182 ?auto_693183 ?auto_693184 ?auto_693185 ?auto_693186 ?auto_693187 ?auto_693188 ?auto_693189 ?auto_693190 ?auto_693191 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_693242 - BLOCK
      ?auto_693243 - BLOCK
      ?auto_693244 - BLOCK
      ?auto_693245 - BLOCK
      ?auto_693246 - BLOCK
      ?auto_693247 - BLOCK
      ?auto_693248 - BLOCK
      ?auto_693249 - BLOCK
      ?auto_693250 - BLOCK
      ?auto_693251 - BLOCK
      ?auto_693252 - BLOCK
      ?auto_693253 - BLOCK
      ?auto_693254 - BLOCK
      ?auto_693255 - BLOCK
      ?auto_693256 - BLOCK
      ?auto_693257 - BLOCK
    )
    :vars
    (
      ?auto_693258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_693257 ?auto_693258 ) ( ON-TABLE ?auto_693242 ) ( ON ?auto_693243 ?auto_693242 ) ( ON ?auto_693244 ?auto_693243 ) ( ON ?auto_693245 ?auto_693244 ) ( ON ?auto_693246 ?auto_693245 ) ( ON ?auto_693247 ?auto_693246 ) ( not ( = ?auto_693242 ?auto_693243 ) ) ( not ( = ?auto_693242 ?auto_693244 ) ) ( not ( = ?auto_693242 ?auto_693245 ) ) ( not ( = ?auto_693242 ?auto_693246 ) ) ( not ( = ?auto_693242 ?auto_693247 ) ) ( not ( = ?auto_693242 ?auto_693248 ) ) ( not ( = ?auto_693242 ?auto_693249 ) ) ( not ( = ?auto_693242 ?auto_693250 ) ) ( not ( = ?auto_693242 ?auto_693251 ) ) ( not ( = ?auto_693242 ?auto_693252 ) ) ( not ( = ?auto_693242 ?auto_693253 ) ) ( not ( = ?auto_693242 ?auto_693254 ) ) ( not ( = ?auto_693242 ?auto_693255 ) ) ( not ( = ?auto_693242 ?auto_693256 ) ) ( not ( = ?auto_693242 ?auto_693257 ) ) ( not ( = ?auto_693242 ?auto_693258 ) ) ( not ( = ?auto_693243 ?auto_693244 ) ) ( not ( = ?auto_693243 ?auto_693245 ) ) ( not ( = ?auto_693243 ?auto_693246 ) ) ( not ( = ?auto_693243 ?auto_693247 ) ) ( not ( = ?auto_693243 ?auto_693248 ) ) ( not ( = ?auto_693243 ?auto_693249 ) ) ( not ( = ?auto_693243 ?auto_693250 ) ) ( not ( = ?auto_693243 ?auto_693251 ) ) ( not ( = ?auto_693243 ?auto_693252 ) ) ( not ( = ?auto_693243 ?auto_693253 ) ) ( not ( = ?auto_693243 ?auto_693254 ) ) ( not ( = ?auto_693243 ?auto_693255 ) ) ( not ( = ?auto_693243 ?auto_693256 ) ) ( not ( = ?auto_693243 ?auto_693257 ) ) ( not ( = ?auto_693243 ?auto_693258 ) ) ( not ( = ?auto_693244 ?auto_693245 ) ) ( not ( = ?auto_693244 ?auto_693246 ) ) ( not ( = ?auto_693244 ?auto_693247 ) ) ( not ( = ?auto_693244 ?auto_693248 ) ) ( not ( = ?auto_693244 ?auto_693249 ) ) ( not ( = ?auto_693244 ?auto_693250 ) ) ( not ( = ?auto_693244 ?auto_693251 ) ) ( not ( = ?auto_693244 ?auto_693252 ) ) ( not ( = ?auto_693244 ?auto_693253 ) ) ( not ( = ?auto_693244 ?auto_693254 ) ) ( not ( = ?auto_693244 ?auto_693255 ) ) ( not ( = ?auto_693244 ?auto_693256 ) ) ( not ( = ?auto_693244 ?auto_693257 ) ) ( not ( = ?auto_693244 ?auto_693258 ) ) ( not ( = ?auto_693245 ?auto_693246 ) ) ( not ( = ?auto_693245 ?auto_693247 ) ) ( not ( = ?auto_693245 ?auto_693248 ) ) ( not ( = ?auto_693245 ?auto_693249 ) ) ( not ( = ?auto_693245 ?auto_693250 ) ) ( not ( = ?auto_693245 ?auto_693251 ) ) ( not ( = ?auto_693245 ?auto_693252 ) ) ( not ( = ?auto_693245 ?auto_693253 ) ) ( not ( = ?auto_693245 ?auto_693254 ) ) ( not ( = ?auto_693245 ?auto_693255 ) ) ( not ( = ?auto_693245 ?auto_693256 ) ) ( not ( = ?auto_693245 ?auto_693257 ) ) ( not ( = ?auto_693245 ?auto_693258 ) ) ( not ( = ?auto_693246 ?auto_693247 ) ) ( not ( = ?auto_693246 ?auto_693248 ) ) ( not ( = ?auto_693246 ?auto_693249 ) ) ( not ( = ?auto_693246 ?auto_693250 ) ) ( not ( = ?auto_693246 ?auto_693251 ) ) ( not ( = ?auto_693246 ?auto_693252 ) ) ( not ( = ?auto_693246 ?auto_693253 ) ) ( not ( = ?auto_693246 ?auto_693254 ) ) ( not ( = ?auto_693246 ?auto_693255 ) ) ( not ( = ?auto_693246 ?auto_693256 ) ) ( not ( = ?auto_693246 ?auto_693257 ) ) ( not ( = ?auto_693246 ?auto_693258 ) ) ( not ( = ?auto_693247 ?auto_693248 ) ) ( not ( = ?auto_693247 ?auto_693249 ) ) ( not ( = ?auto_693247 ?auto_693250 ) ) ( not ( = ?auto_693247 ?auto_693251 ) ) ( not ( = ?auto_693247 ?auto_693252 ) ) ( not ( = ?auto_693247 ?auto_693253 ) ) ( not ( = ?auto_693247 ?auto_693254 ) ) ( not ( = ?auto_693247 ?auto_693255 ) ) ( not ( = ?auto_693247 ?auto_693256 ) ) ( not ( = ?auto_693247 ?auto_693257 ) ) ( not ( = ?auto_693247 ?auto_693258 ) ) ( not ( = ?auto_693248 ?auto_693249 ) ) ( not ( = ?auto_693248 ?auto_693250 ) ) ( not ( = ?auto_693248 ?auto_693251 ) ) ( not ( = ?auto_693248 ?auto_693252 ) ) ( not ( = ?auto_693248 ?auto_693253 ) ) ( not ( = ?auto_693248 ?auto_693254 ) ) ( not ( = ?auto_693248 ?auto_693255 ) ) ( not ( = ?auto_693248 ?auto_693256 ) ) ( not ( = ?auto_693248 ?auto_693257 ) ) ( not ( = ?auto_693248 ?auto_693258 ) ) ( not ( = ?auto_693249 ?auto_693250 ) ) ( not ( = ?auto_693249 ?auto_693251 ) ) ( not ( = ?auto_693249 ?auto_693252 ) ) ( not ( = ?auto_693249 ?auto_693253 ) ) ( not ( = ?auto_693249 ?auto_693254 ) ) ( not ( = ?auto_693249 ?auto_693255 ) ) ( not ( = ?auto_693249 ?auto_693256 ) ) ( not ( = ?auto_693249 ?auto_693257 ) ) ( not ( = ?auto_693249 ?auto_693258 ) ) ( not ( = ?auto_693250 ?auto_693251 ) ) ( not ( = ?auto_693250 ?auto_693252 ) ) ( not ( = ?auto_693250 ?auto_693253 ) ) ( not ( = ?auto_693250 ?auto_693254 ) ) ( not ( = ?auto_693250 ?auto_693255 ) ) ( not ( = ?auto_693250 ?auto_693256 ) ) ( not ( = ?auto_693250 ?auto_693257 ) ) ( not ( = ?auto_693250 ?auto_693258 ) ) ( not ( = ?auto_693251 ?auto_693252 ) ) ( not ( = ?auto_693251 ?auto_693253 ) ) ( not ( = ?auto_693251 ?auto_693254 ) ) ( not ( = ?auto_693251 ?auto_693255 ) ) ( not ( = ?auto_693251 ?auto_693256 ) ) ( not ( = ?auto_693251 ?auto_693257 ) ) ( not ( = ?auto_693251 ?auto_693258 ) ) ( not ( = ?auto_693252 ?auto_693253 ) ) ( not ( = ?auto_693252 ?auto_693254 ) ) ( not ( = ?auto_693252 ?auto_693255 ) ) ( not ( = ?auto_693252 ?auto_693256 ) ) ( not ( = ?auto_693252 ?auto_693257 ) ) ( not ( = ?auto_693252 ?auto_693258 ) ) ( not ( = ?auto_693253 ?auto_693254 ) ) ( not ( = ?auto_693253 ?auto_693255 ) ) ( not ( = ?auto_693253 ?auto_693256 ) ) ( not ( = ?auto_693253 ?auto_693257 ) ) ( not ( = ?auto_693253 ?auto_693258 ) ) ( not ( = ?auto_693254 ?auto_693255 ) ) ( not ( = ?auto_693254 ?auto_693256 ) ) ( not ( = ?auto_693254 ?auto_693257 ) ) ( not ( = ?auto_693254 ?auto_693258 ) ) ( not ( = ?auto_693255 ?auto_693256 ) ) ( not ( = ?auto_693255 ?auto_693257 ) ) ( not ( = ?auto_693255 ?auto_693258 ) ) ( not ( = ?auto_693256 ?auto_693257 ) ) ( not ( = ?auto_693256 ?auto_693258 ) ) ( not ( = ?auto_693257 ?auto_693258 ) ) ( ON ?auto_693256 ?auto_693257 ) ( ON ?auto_693255 ?auto_693256 ) ( ON ?auto_693254 ?auto_693255 ) ( ON ?auto_693253 ?auto_693254 ) ( ON ?auto_693252 ?auto_693253 ) ( ON ?auto_693251 ?auto_693252 ) ( ON ?auto_693250 ?auto_693251 ) ( ON ?auto_693249 ?auto_693250 ) ( CLEAR ?auto_693247 ) ( ON ?auto_693248 ?auto_693249 ) ( CLEAR ?auto_693248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_693242 ?auto_693243 ?auto_693244 ?auto_693245 ?auto_693246 ?auto_693247 ?auto_693248 )
      ( MAKE-16PILE ?auto_693242 ?auto_693243 ?auto_693244 ?auto_693245 ?auto_693246 ?auto_693247 ?auto_693248 ?auto_693249 ?auto_693250 ?auto_693251 ?auto_693252 ?auto_693253 ?auto_693254 ?auto_693255 ?auto_693256 ?auto_693257 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_693308 - BLOCK
      ?auto_693309 - BLOCK
      ?auto_693310 - BLOCK
      ?auto_693311 - BLOCK
      ?auto_693312 - BLOCK
      ?auto_693313 - BLOCK
      ?auto_693314 - BLOCK
      ?auto_693315 - BLOCK
      ?auto_693316 - BLOCK
      ?auto_693317 - BLOCK
      ?auto_693318 - BLOCK
      ?auto_693319 - BLOCK
      ?auto_693320 - BLOCK
      ?auto_693321 - BLOCK
      ?auto_693322 - BLOCK
      ?auto_693323 - BLOCK
    )
    :vars
    (
      ?auto_693324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_693323 ?auto_693324 ) ( ON-TABLE ?auto_693308 ) ( ON ?auto_693309 ?auto_693308 ) ( ON ?auto_693310 ?auto_693309 ) ( ON ?auto_693311 ?auto_693310 ) ( ON ?auto_693312 ?auto_693311 ) ( not ( = ?auto_693308 ?auto_693309 ) ) ( not ( = ?auto_693308 ?auto_693310 ) ) ( not ( = ?auto_693308 ?auto_693311 ) ) ( not ( = ?auto_693308 ?auto_693312 ) ) ( not ( = ?auto_693308 ?auto_693313 ) ) ( not ( = ?auto_693308 ?auto_693314 ) ) ( not ( = ?auto_693308 ?auto_693315 ) ) ( not ( = ?auto_693308 ?auto_693316 ) ) ( not ( = ?auto_693308 ?auto_693317 ) ) ( not ( = ?auto_693308 ?auto_693318 ) ) ( not ( = ?auto_693308 ?auto_693319 ) ) ( not ( = ?auto_693308 ?auto_693320 ) ) ( not ( = ?auto_693308 ?auto_693321 ) ) ( not ( = ?auto_693308 ?auto_693322 ) ) ( not ( = ?auto_693308 ?auto_693323 ) ) ( not ( = ?auto_693308 ?auto_693324 ) ) ( not ( = ?auto_693309 ?auto_693310 ) ) ( not ( = ?auto_693309 ?auto_693311 ) ) ( not ( = ?auto_693309 ?auto_693312 ) ) ( not ( = ?auto_693309 ?auto_693313 ) ) ( not ( = ?auto_693309 ?auto_693314 ) ) ( not ( = ?auto_693309 ?auto_693315 ) ) ( not ( = ?auto_693309 ?auto_693316 ) ) ( not ( = ?auto_693309 ?auto_693317 ) ) ( not ( = ?auto_693309 ?auto_693318 ) ) ( not ( = ?auto_693309 ?auto_693319 ) ) ( not ( = ?auto_693309 ?auto_693320 ) ) ( not ( = ?auto_693309 ?auto_693321 ) ) ( not ( = ?auto_693309 ?auto_693322 ) ) ( not ( = ?auto_693309 ?auto_693323 ) ) ( not ( = ?auto_693309 ?auto_693324 ) ) ( not ( = ?auto_693310 ?auto_693311 ) ) ( not ( = ?auto_693310 ?auto_693312 ) ) ( not ( = ?auto_693310 ?auto_693313 ) ) ( not ( = ?auto_693310 ?auto_693314 ) ) ( not ( = ?auto_693310 ?auto_693315 ) ) ( not ( = ?auto_693310 ?auto_693316 ) ) ( not ( = ?auto_693310 ?auto_693317 ) ) ( not ( = ?auto_693310 ?auto_693318 ) ) ( not ( = ?auto_693310 ?auto_693319 ) ) ( not ( = ?auto_693310 ?auto_693320 ) ) ( not ( = ?auto_693310 ?auto_693321 ) ) ( not ( = ?auto_693310 ?auto_693322 ) ) ( not ( = ?auto_693310 ?auto_693323 ) ) ( not ( = ?auto_693310 ?auto_693324 ) ) ( not ( = ?auto_693311 ?auto_693312 ) ) ( not ( = ?auto_693311 ?auto_693313 ) ) ( not ( = ?auto_693311 ?auto_693314 ) ) ( not ( = ?auto_693311 ?auto_693315 ) ) ( not ( = ?auto_693311 ?auto_693316 ) ) ( not ( = ?auto_693311 ?auto_693317 ) ) ( not ( = ?auto_693311 ?auto_693318 ) ) ( not ( = ?auto_693311 ?auto_693319 ) ) ( not ( = ?auto_693311 ?auto_693320 ) ) ( not ( = ?auto_693311 ?auto_693321 ) ) ( not ( = ?auto_693311 ?auto_693322 ) ) ( not ( = ?auto_693311 ?auto_693323 ) ) ( not ( = ?auto_693311 ?auto_693324 ) ) ( not ( = ?auto_693312 ?auto_693313 ) ) ( not ( = ?auto_693312 ?auto_693314 ) ) ( not ( = ?auto_693312 ?auto_693315 ) ) ( not ( = ?auto_693312 ?auto_693316 ) ) ( not ( = ?auto_693312 ?auto_693317 ) ) ( not ( = ?auto_693312 ?auto_693318 ) ) ( not ( = ?auto_693312 ?auto_693319 ) ) ( not ( = ?auto_693312 ?auto_693320 ) ) ( not ( = ?auto_693312 ?auto_693321 ) ) ( not ( = ?auto_693312 ?auto_693322 ) ) ( not ( = ?auto_693312 ?auto_693323 ) ) ( not ( = ?auto_693312 ?auto_693324 ) ) ( not ( = ?auto_693313 ?auto_693314 ) ) ( not ( = ?auto_693313 ?auto_693315 ) ) ( not ( = ?auto_693313 ?auto_693316 ) ) ( not ( = ?auto_693313 ?auto_693317 ) ) ( not ( = ?auto_693313 ?auto_693318 ) ) ( not ( = ?auto_693313 ?auto_693319 ) ) ( not ( = ?auto_693313 ?auto_693320 ) ) ( not ( = ?auto_693313 ?auto_693321 ) ) ( not ( = ?auto_693313 ?auto_693322 ) ) ( not ( = ?auto_693313 ?auto_693323 ) ) ( not ( = ?auto_693313 ?auto_693324 ) ) ( not ( = ?auto_693314 ?auto_693315 ) ) ( not ( = ?auto_693314 ?auto_693316 ) ) ( not ( = ?auto_693314 ?auto_693317 ) ) ( not ( = ?auto_693314 ?auto_693318 ) ) ( not ( = ?auto_693314 ?auto_693319 ) ) ( not ( = ?auto_693314 ?auto_693320 ) ) ( not ( = ?auto_693314 ?auto_693321 ) ) ( not ( = ?auto_693314 ?auto_693322 ) ) ( not ( = ?auto_693314 ?auto_693323 ) ) ( not ( = ?auto_693314 ?auto_693324 ) ) ( not ( = ?auto_693315 ?auto_693316 ) ) ( not ( = ?auto_693315 ?auto_693317 ) ) ( not ( = ?auto_693315 ?auto_693318 ) ) ( not ( = ?auto_693315 ?auto_693319 ) ) ( not ( = ?auto_693315 ?auto_693320 ) ) ( not ( = ?auto_693315 ?auto_693321 ) ) ( not ( = ?auto_693315 ?auto_693322 ) ) ( not ( = ?auto_693315 ?auto_693323 ) ) ( not ( = ?auto_693315 ?auto_693324 ) ) ( not ( = ?auto_693316 ?auto_693317 ) ) ( not ( = ?auto_693316 ?auto_693318 ) ) ( not ( = ?auto_693316 ?auto_693319 ) ) ( not ( = ?auto_693316 ?auto_693320 ) ) ( not ( = ?auto_693316 ?auto_693321 ) ) ( not ( = ?auto_693316 ?auto_693322 ) ) ( not ( = ?auto_693316 ?auto_693323 ) ) ( not ( = ?auto_693316 ?auto_693324 ) ) ( not ( = ?auto_693317 ?auto_693318 ) ) ( not ( = ?auto_693317 ?auto_693319 ) ) ( not ( = ?auto_693317 ?auto_693320 ) ) ( not ( = ?auto_693317 ?auto_693321 ) ) ( not ( = ?auto_693317 ?auto_693322 ) ) ( not ( = ?auto_693317 ?auto_693323 ) ) ( not ( = ?auto_693317 ?auto_693324 ) ) ( not ( = ?auto_693318 ?auto_693319 ) ) ( not ( = ?auto_693318 ?auto_693320 ) ) ( not ( = ?auto_693318 ?auto_693321 ) ) ( not ( = ?auto_693318 ?auto_693322 ) ) ( not ( = ?auto_693318 ?auto_693323 ) ) ( not ( = ?auto_693318 ?auto_693324 ) ) ( not ( = ?auto_693319 ?auto_693320 ) ) ( not ( = ?auto_693319 ?auto_693321 ) ) ( not ( = ?auto_693319 ?auto_693322 ) ) ( not ( = ?auto_693319 ?auto_693323 ) ) ( not ( = ?auto_693319 ?auto_693324 ) ) ( not ( = ?auto_693320 ?auto_693321 ) ) ( not ( = ?auto_693320 ?auto_693322 ) ) ( not ( = ?auto_693320 ?auto_693323 ) ) ( not ( = ?auto_693320 ?auto_693324 ) ) ( not ( = ?auto_693321 ?auto_693322 ) ) ( not ( = ?auto_693321 ?auto_693323 ) ) ( not ( = ?auto_693321 ?auto_693324 ) ) ( not ( = ?auto_693322 ?auto_693323 ) ) ( not ( = ?auto_693322 ?auto_693324 ) ) ( not ( = ?auto_693323 ?auto_693324 ) ) ( ON ?auto_693322 ?auto_693323 ) ( ON ?auto_693321 ?auto_693322 ) ( ON ?auto_693320 ?auto_693321 ) ( ON ?auto_693319 ?auto_693320 ) ( ON ?auto_693318 ?auto_693319 ) ( ON ?auto_693317 ?auto_693318 ) ( ON ?auto_693316 ?auto_693317 ) ( ON ?auto_693315 ?auto_693316 ) ( ON ?auto_693314 ?auto_693315 ) ( CLEAR ?auto_693312 ) ( ON ?auto_693313 ?auto_693314 ) ( CLEAR ?auto_693313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_693308 ?auto_693309 ?auto_693310 ?auto_693311 ?auto_693312 ?auto_693313 )
      ( MAKE-16PILE ?auto_693308 ?auto_693309 ?auto_693310 ?auto_693311 ?auto_693312 ?auto_693313 ?auto_693314 ?auto_693315 ?auto_693316 ?auto_693317 ?auto_693318 ?auto_693319 ?auto_693320 ?auto_693321 ?auto_693322 ?auto_693323 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_693374 - BLOCK
      ?auto_693375 - BLOCK
      ?auto_693376 - BLOCK
      ?auto_693377 - BLOCK
      ?auto_693378 - BLOCK
      ?auto_693379 - BLOCK
      ?auto_693380 - BLOCK
      ?auto_693381 - BLOCK
      ?auto_693382 - BLOCK
      ?auto_693383 - BLOCK
      ?auto_693384 - BLOCK
      ?auto_693385 - BLOCK
      ?auto_693386 - BLOCK
      ?auto_693387 - BLOCK
      ?auto_693388 - BLOCK
      ?auto_693389 - BLOCK
    )
    :vars
    (
      ?auto_693390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_693389 ?auto_693390 ) ( ON-TABLE ?auto_693374 ) ( ON ?auto_693375 ?auto_693374 ) ( ON ?auto_693376 ?auto_693375 ) ( ON ?auto_693377 ?auto_693376 ) ( not ( = ?auto_693374 ?auto_693375 ) ) ( not ( = ?auto_693374 ?auto_693376 ) ) ( not ( = ?auto_693374 ?auto_693377 ) ) ( not ( = ?auto_693374 ?auto_693378 ) ) ( not ( = ?auto_693374 ?auto_693379 ) ) ( not ( = ?auto_693374 ?auto_693380 ) ) ( not ( = ?auto_693374 ?auto_693381 ) ) ( not ( = ?auto_693374 ?auto_693382 ) ) ( not ( = ?auto_693374 ?auto_693383 ) ) ( not ( = ?auto_693374 ?auto_693384 ) ) ( not ( = ?auto_693374 ?auto_693385 ) ) ( not ( = ?auto_693374 ?auto_693386 ) ) ( not ( = ?auto_693374 ?auto_693387 ) ) ( not ( = ?auto_693374 ?auto_693388 ) ) ( not ( = ?auto_693374 ?auto_693389 ) ) ( not ( = ?auto_693374 ?auto_693390 ) ) ( not ( = ?auto_693375 ?auto_693376 ) ) ( not ( = ?auto_693375 ?auto_693377 ) ) ( not ( = ?auto_693375 ?auto_693378 ) ) ( not ( = ?auto_693375 ?auto_693379 ) ) ( not ( = ?auto_693375 ?auto_693380 ) ) ( not ( = ?auto_693375 ?auto_693381 ) ) ( not ( = ?auto_693375 ?auto_693382 ) ) ( not ( = ?auto_693375 ?auto_693383 ) ) ( not ( = ?auto_693375 ?auto_693384 ) ) ( not ( = ?auto_693375 ?auto_693385 ) ) ( not ( = ?auto_693375 ?auto_693386 ) ) ( not ( = ?auto_693375 ?auto_693387 ) ) ( not ( = ?auto_693375 ?auto_693388 ) ) ( not ( = ?auto_693375 ?auto_693389 ) ) ( not ( = ?auto_693375 ?auto_693390 ) ) ( not ( = ?auto_693376 ?auto_693377 ) ) ( not ( = ?auto_693376 ?auto_693378 ) ) ( not ( = ?auto_693376 ?auto_693379 ) ) ( not ( = ?auto_693376 ?auto_693380 ) ) ( not ( = ?auto_693376 ?auto_693381 ) ) ( not ( = ?auto_693376 ?auto_693382 ) ) ( not ( = ?auto_693376 ?auto_693383 ) ) ( not ( = ?auto_693376 ?auto_693384 ) ) ( not ( = ?auto_693376 ?auto_693385 ) ) ( not ( = ?auto_693376 ?auto_693386 ) ) ( not ( = ?auto_693376 ?auto_693387 ) ) ( not ( = ?auto_693376 ?auto_693388 ) ) ( not ( = ?auto_693376 ?auto_693389 ) ) ( not ( = ?auto_693376 ?auto_693390 ) ) ( not ( = ?auto_693377 ?auto_693378 ) ) ( not ( = ?auto_693377 ?auto_693379 ) ) ( not ( = ?auto_693377 ?auto_693380 ) ) ( not ( = ?auto_693377 ?auto_693381 ) ) ( not ( = ?auto_693377 ?auto_693382 ) ) ( not ( = ?auto_693377 ?auto_693383 ) ) ( not ( = ?auto_693377 ?auto_693384 ) ) ( not ( = ?auto_693377 ?auto_693385 ) ) ( not ( = ?auto_693377 ?auto_693386 ) ) ( not ( = ?auto_693377 ?auto_693387 ) ) ( not ( = ?auto_693377 ?auto_693388 ) ) ( not ( = ?auto_693377 ?auto_693389 ) ) ( not ( = ?auto_693377 ?auto_693390 ) ) ( not ( = ?auto_693378 ?auto_693379 ) ) ( not ( = ?auto_693378 ?auto_693380 ) ) ( not ( = ?auto_693378 ?auto_693381 ) ) ( not ( = ?auto_693378 ?auto_693382 ) ) ( not ( = ?auto_693378 ?auto_693383 ) ) ( not ( = ?auto_693378 ?auto_693384 ) ) ( not ( = ?auto_693378 ?auto_693385 ) ) ( not ( = ?auto_693378 ?auto_693386 ) ) ( not ( = ?auto_693378 ?auto_693387 ) ) ( not ( = ?auto_693378 ?auto_693388 ) ) ( not ( = ?auto_693378 ?auto_693389 ) ) ( not ( = ?auto_693378 ?auto_693390 ) ) ( not ( = ?auto_693379 ?auto_693380 ) ) ( not ( = ?auto_693379 ?auto_693381 ) ) ( not ( = ?auto_693379 ?auto_693382 ) ) ( not ( = ?auto_693379 ?auto_693383 ) ) ( not ( = ?auto_693379 ?auto_693384 ) ) ( not ( = ?auto_693379 ?auto_693385 ) ) ( not ( = ?auto_693379 ?auto_693386 ) ) ( not ( = ?auto_693379 ?auto_693387 ) ) ( not ( = ?auto_693379 ?auto_693388 ) ) ( not ( = ?auto_693379 ?auto_693389 ) ) ( not ( = ?auto_693379 ?auto_693390 ) ) ( not ( = ?auto_693380 ?auto_693381 ) ) ( not ( = ?auto_693380 ?auto_693382 ) ) ( not ( = ?auto_693380 ?auto_693383 ) ) ( not ( = ?auto_693380 ?auto_693384 ) ) ( not ( = ?auto_693380 ?auto_693385 ) ) ( not ( = ?auto_693380 ?auto_693386 ) ) ( not ( = ?auto_693380 ?auto_693387 ) ) ( not ( = ?auto_693380 ?auto_693388 ) ) ( not ( = ?auto_693380 ?auto_693389 ) ) ( not ( = ?auto_693380 ?auto_693390 ) ) ( not ( = ?auto_693381 ?auto_693382 ) ) ( not ( = ?auto_693381 ?auto_693383 ) ) ( not ( = ?auto_693381 ?auto_693384 ) ) ( not ( = ?auto_693381 ?auto_693385 ) ) ( not ( = ?auto_693381 ?auto_693386 ) ) ( not ( = ?auto_693381 ?auto_693387 ) ) ( not ( = ?auto_693381 ?auto_693388 ) ) ( not ( = ?auto_693381 ?auto_693389 ) ) ( not ( = ?auto_693381 ?auto_693390 ) ) ( not ( = ?auto_693382 ?auto_693383 ) ) ( not ( = ?auto_693382 ?auto_693384 ) ) ( not ( = ?auto_693382 ?auto_693385 ) ) ( not ( = ?auto_693382 ?auto_693386 ) ) ( not ( = ?auto_693382 ?auto_693387 ) ) ( not ( = ?auto_693382 ?auto_693388 ) ) ( not ( = ?auto_693382 ?auto_693389 ) ) ( not ( = ?auto_693382 ?auto_693390 ) ) ( not ( = ?auto_693383 ?auto_693384 ) ) ( not ( = ?auto_693383 ?auto_693385 ) ) ( not ( = ?auto_693383 ?auto_693386 ) ) ( not ( = ?auto_693383 ?auto_693387 ) ) ( not ( = ?auto_693383 ?auto_693388 ) ) ( not ( = ?auto_693383 ?auto_693389 ) ) ( not ( = ?auto_693383 ?auto_693390 ) ) ( not ( = ?auto_693384 ?auto_693385 ) ) ( not ( = ?auto_693384 ?auto_693386 ) ) ( not ( = ?auto_693384 ?auto_693387 ) ) ( not ( = ?auto_693384 ?auto_693388 ) ) ( not ( = ?auto_693384 ?auto_693389 ) ) ( not ( = ?auto_693384 ?auto_693390 ) ) ( not ( = ?auto_693385 ?auto_693386 ) ) ( not ( = ?auto_693385 ?auto_693387 ) ) ( not ( = ?auto_693385 ?auto_693388 ) ) ( not ( = ?auto_693385 ?auto_693389 ) ) ( not ( = ?auto_693385 ?auto_693390 ) ) ( not ( = ?auto_693386 ?auto_693387 ) ) ( not ( = ?auto_693386 ?auto_693388 ) ) ( not ( = ?auto_693386 ?auto_693389 ) ) ( not ( = ?auto_693386 ?auto_693390 ) ) ( not ( = ?auto_693387 ?auto_693388 ) ) ( not ( = ?auto_693387 ?auto_693389 ) ) ( not ( = ?auto_693387 ?auto_693390 ) ) ( not ( = ?auto_693388 ?auto_693389 ) ) ( not ( = ?auto_693388 ?auto_693390 ) ) ( not ( = ?auto_693389 ?auto_693390 ) ) ( ON ?auto_693388 ?auto_693389 ) ( ON ?auto_693387 ?auto_693388 ) ( ON ?auto_693386 ?auto_693387 ) ( ON ?auto_693385 ?auto_693386 ) ( ON ?auto_693384 ?auto_693385 ) ( ON ?auto_693383 ?auto_693384 ) ( ON ?auto_693382 ?auto_693383 ) ( ON ?auto_693381 ?auto_693382 ) ( ON ?auto_693380 ?auto_693381 ) ( ON ?auto_693379 ?auto_693380 ) ( CLEAR ?auto_693377 ) ( ON ?auto_693378 ?auto_693379 ) ( CLEAR ?auto_693378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_693374 ?auto_693375 ?auto_693376 ?auto_693377 ?auto_693378 )
      ( MAKE-16PILE ?auto_693374 ?auto_693375 ?auto_693376 ?auto_693377 ?auto_693378 ?auto_693379 ?auto_693380 ?auto_693381 ?auto_693382 ?auto_693383 ?auto_693384 ?auto_693385 ?auto_693386 ?auto_693387 ?auto_693388 ?auto_693389 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_693440 - BLOCK
      ?auto_693441 - BLOCK
      ?auto_693442 - BLOCK
      ?auto_693443 - BLOCK
      ?auto_693444 - BLOCK
      ?auto_693445 - BLOCK
      ?auto_693446 - BLOCK
      ?auto_693447 - BLOCK
      ?auto_693448 - BLOCK
      ?auto_693449 - BLOCK
      ?auto_693450 - BLOCK
      ?auto_693451 - BLOCK
      ?auto_693452 - BLOCK
      ?auto_693453 - BLOCK
      ?auto_693454 - BLOCK
      ?auto_693455 - BLOCK
    )
    :vars
    (
      ?auto_693456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_693455 ?auto_693456 ) ( ON-TABLE ?auto_693440 ) ( ON ?auto_693441 ?auto_693440 ) ( ON ?auto_693442 ?auto_693441 ) ( not ( = ?auto_693440 ?auto_693441 ) ) ( not ( = ?auto_693440 ?auto_693442 ) ) ( not ( = ?auto_693440 ?auto_693443 ) ) ( not ( = ?auto_693440 ?auto_693444 ) ) ( not ( = ?auto_693440 ?auto_693445 ) ) ( not ( = ?auto_693440 ?auto_693446 ) ) ( not ( = ?auto_693440 ?auto_693447 ) ) ( not ( = ?auto_693440 ?auto_693448 ) ) ( not ( = ?auto_693440 ?auto_693449 ) ) ( not ( = ?auto_693440 ?auto_693450 ) ) ( not ( = ?auto_693440 ?auto_693451 ) ) ( not ( = ?auto_693440 ?auto_693452 ) ) ( not ( = ?auto_693440 ?auto_693453 ) ) ( not ( = ?auto_693440 ?auto_693454 ) ) ( not ( = ?auto_693440 ?auto_693455 ) ) ( not ( = ?auto_693440 ?auto_693456 ) ) ( not ( = ?auto_693441 ?auto_693442 ) ) ( not ( = ?auto_693441 ?auto_693443 ) ) ( not ( = ?auto_693441 ?auto_693444 ) ) ( not ( = ?auto_693441 ?auto_693445 ) ) ( not ( = ?auto_693441 ?auto_693446 ) ) ( not ( = ?auto_693441 ?auto_693447 ) ) ( not ( = ?auto_693441 ?auto_693448 ) ) ( not ( = ?auto_693441 ?auto_693449 ) ) ( not ( = ?auto_693441 ?auto_693450 ) ) ( not ( = ?auto_693441 ?auto_693451 ) ) ( not ( = ?auto_693441 ?auto_693452 ) ) ( not ( = ?auto_693441 ?auto_693453 ) ) ( not ( = ?auto_693441 ?auto_693454 ) ) ( not ( = ?auto_693441 ?auto_693455 ) ) ( not ( = ?auto_693441 ?auto_693456 ) ) ( not ( = ?auto_693442 ?auto_693443 ) ) ( not ( = ?auto_693442 ?auto_693444 ) ) ( not ( = ?auto_693442 ?auto_693445 ) ) ( not ( = ?auto_693442 ?auto_693446 ) ) ( not ( = ?auto_693442 ?auto_693447 ) ) ( not ( = ?auto_693442 ?auto_693448 ) ) ( not ( = ?auto_693442 ?auto_693449 ) ) ( not ( = ?auto_693442 ?auto_693450 ) ) ( not ( = ?auto_693442 ?auto_693451 ) ) ( not ( = ?auto_693442 ?auto_693452 ) ) ( not ( = ?auto_693442 ?auto_693453 ) ) ( not ( = ?auto_693442 ?auto_693454 ) ) ( not ( = ?auto_693442 ?auto_693455 ) ) ( not ( = ?auto_693442 ?auto_693456 ) ) ( not ( = ?auto_693443 ?auto_693444 ) ) ( not ( = ?auto_693443 ?auto_693445 ) ) ( not ( = ?auto_693443 ?auto_693446 ) ) ( not ( = ?auto_693443 ?auto_693447 ) ) ( not ( = ?auto_693443 ?auto_693448 ) ) ( not ( = ?auto_693443 ?auto_693449 ) ) ( not ( = ?auto_693443 ?auto_693450 ) ) ( not ( = ?auto_693443 ?auto_693451 ) ) ( not ( = ?auto_693443 ?auto_693452 ) ) ( not ( = ?auto_693443 ?auto_693453 ) ) ( not ( = ?auto_693443 ?auto_693454 ) ) ( not ( = ?auto_693443 ?auto_693455 ) ) ( not ( = ?auto_693443 ?auto_693456 ) ) ( not ( = ?auto_693444 ?auto_693445 ) ) ( not ( = ?auto_693444 ?auto_693446 ) ) ( not ( = ?auto_693444 ?auto_693447 ) ) ( not ( = ?auto_693444 ?auto_693448 ) ) ( not ( = ?auto_693444 ?auto_693449 ) ) ( not ( = ?auto_693444 ?auto_693450 ) ) ( not ( = ?auto_693444 ?auto_693451 ) ) ( not ( = ?auto_693444 ?auto_693452 ) ) ( not ( = ?auto_693444 ?auto_693453 ) ) ( not ( = ?auto_693444 ?auto_693454 ) ) ( not ( = ?auto_693444 ?auto_693455 ) ) ( not ( = ?auto_693444 ?auto_693456 ) ) ( not ( = ?auto_693445 ?auto_693446 ) ) ( not ( = ?auto_693445 ?auto_693447 ) ) ( not ( = ?auto_693445 ?auto_693448 ) ) ( not ( = ?auto_693445 ?auto_693449 ) ) ( not ( = ?auto_693445 ?auto_693450 ) ) ( not ( = ?auto_693445 ?auto_693451 ) ) ( not ( = ?auto_693445 ?auto_693452 ) ) ( not ( = ?auto_693445 ?auto_693453 ) ) ( not ( = ?auto_693445 ?auto_693454 ) ) ( not ( = ?auto_693445 ?auto_693455 ) ) ( not ( = ?auto_693445 ?auto_693456 ) ) ( not ( = ?auto_693446 ?auto_693447 ) ) ( not ( = ?auto_693446 ?auto_693448 ) ) ( not ( = ?auto_693446 ?auto_693449 ) ) ( not ( = ?auto_693446 ?auto_693450 ) ) ( not ( = ?auto_693446 ?auto_693451 ) ) ( not ( = ?auto_693446 ?auto_693452 ) ) ( not ( = ?auto_693446 ?auto_693453 ) ) ( not ( = ?auto_693446 ?auto_693454 ) ) ( not ( = ?auto_693446 ?auto_693455 ) ) ( not ( = ?auto_693446 ?auto_693456 ) ) ( not ( = ?auto_693447 ?auto_693448 ) ) ( not ( = ?auto_693447 ?auto_693449 ) ) ( not ( = ?auto_693447 ?auto_693450 ) ) ( not ( = ?auto_693447 ?auto_693451 ) ) ( not ( = ?auto_693447 ?auto_693452 ) ) ( not ( = ?auto_693447 ?auto_693453 ) ) ( not ( = ?auto_693447 ?auto_693454 ) ) ( not ( = ?auto_693447 ?auto_693455 ) ) ( not ( = ?auto_693447 ?auto_693456 ) ) ( not ( = ?auto_693448 ?auto_693449 ) ) ( not ( = ?auto_693448 ?auto_693450 ) ) ( not ( = ?auto_693448 ?auto_693451 ) ) ( not ( = ?auto_693448 ?auto_693452 ) ) ( not ( = ?auto_693448 ?auto_693453 ) ) ( not ( = ?auto_693448 ?auto_693454 ) ) ( not ( = ?auto_693448 ?auto_693455 ) ) ( not ( = ?auto_693448 ?auto_693456 ) ) ( not ( = ?auto_693449 ?auto_693450 ) ) ( not ( = ?auto_693449 ?auto_693451 ) ) ( not ( = ?auto_693449 ?auto_693452 ) ) ( not ( = ?auto_693449 ?auto_693453 ) ) ( not ( = ?auto_693449 ?auto_693454 ) ) ( not ( = ?auto_693449 ?auto_693455 ) ) ( not ( = ?auto_693449 ?auto_693456 ) ) ( not ( = ?auto_693450 ?auto_693451 ) ) ( not ( = ?auto_693450 ?auto_693452 ) ) ( not ( = ?auto_693450 ?auto_693453 ) ) ( not ( = ?auto_693450 ?auto_693454 ) ) ( not ( = ?auto_693450 ?auto_693455 ) ) ( not ( = ?auto_693450 ?auto_693456 ) ) ( not ( = ?auto_693451 ?auto_693452 ) ) ( not ( = ?auto_693451 ?auto_693453 ) ) ( not ( = ?auto_693451 ?auto_693454 ) ) ( not ( = ?auto_693451 ?auto_693455 ) ) ( not ( = ?auto_693451 ?auto_693456 ) ) ( not ( = ?auto_693452 ?auto_693453 ) ) ( not ( = ?auto_693452 ?auto_693454 ) ) ( not ( = ?auto_693452 ?auto_693455 ) ) ( not ( = ?auto_693452 ?auto_693456 ) ) ( not ( = ?auto_693453 ?auto_693454 ) ) ( not ( = ?auto_693453 ?auto_693455 ) ) ( not ( = ?auto_693453 ?auto_693456 ) ) ( not ( = ?auto_693454 ?auto_693455 ) ) ( not ( = ?auto_693454 ?auto_693456 ) ) ( not ( = ?auto_693455 ?auto_693456 ) ) ( ON ?auto_693454 ?auto_693455 ) ( ON ?auto_693453 ?auto_693454 ) ( ON ?auto_693452 ?auto_693453 ) ( ON ?auto_693451 ?auto_693452 ) ( ON ?auto_693450 ?auto_693451 ) ( ON ?auto_693449 ?auto_693450 ) ( ON ?auto_693448 ?auto_693449 ) ( ON ?auto_693447 ?auto_693448 ) ( ON ?auto_693446 ?auto_693447 ) ( ON ?auto_693445 ?auto_693446 ) ( ON ?auto_693444 ?auto_693445 ) ( CLEAR ?auto_693442 ) ( ON ?auto_693443 ?auto_693444 ) ( CLEAR ?auto_693443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_693440 ?auto_693441 ?auto_693442 ?auto_693443 )
      ( MAKE-16PILE ?auto_693440 ?auto_693441 ?auto_693442 ?auto_693443 ?auto_693444 ?auto_693445 ?auto_693446 ?auto_693447 ?auto_693448 ?auto_693449 ?auto_693450 ?auto_693451 ?auto_693452 ?auto_693453 ?auto_693454 ?auto_693455 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_693506 - BLOCK
      ?auto_693507 - BLOCK
      ?auto_693508 - BLOCK
      ?auto_693509 - BLOCK
      ?auto_693510 - BLOCK
      ?auto_693511 - BLOCK
      ?auto_693512 - BLOCK
      ?auto_693513 - BLOCK
      ?auto_693514 - BLOCK
      ?auto_693515 - BLOCK
      ?auto_693516 - BLOCK
      ?auto_693517 - BLOCK
      ?auto_693518 - BLOCK
      ?auto_693519 - BLOCK
      ?auto_693520 - BLOCK
      ?auto_693521 - BLOCK
    )
    :vars
    (
      ?auto_693522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_693521 ?auto_693522 ) ( ON-TABLE ?auto_693506 ) ( ON ?auto_693507 ?auto_693506 ) ( not ( = ?auto_693506 ?auto_693507 ) ) ( not ( = ?auto_693506 ?auto_693508 ) ) ( not ( = ?auto_693506 ?auto_693509 ) ) ( not ( = ?auto_693506 ?auto_693510 ) ) ( not ( = ?auto_693506 ?auto_693511 ) ) ( not ( = ?auto_693506 ?auto_693512 ) ) ( not ( = ?auto_693506 ?auto_693513 ) ) ( not ( = ?auto_693506 ?auto_693514 ) ) ( not ( = ?auto_693506 ?auto_693515 ) ) ( not ( = ?auto_693506 ?auto_693516 ) ) ( not ( = ?auto_693506 ?auto_693517 ) ) ( not ( = ?auto_693506 ?auto_693518 ) ) ( not ( = ?auto_693506 ?auto_693519 ) ) ( not ( = ?auto_693506 ?auto_693520 ) ) ( not ( = ?auto_693506 ?auto_693521 ) ) ( not ( = ?auto_693506 ?auto_693522 ) ) ( not ( = ?auto_693507 ?auto_693508 ) ) ( not ( = ?auto_693507 ?auto_693509 ) ) ( not ( = ?auto_693507 ?auto_693510 ) ) ( not ( = ?auto_693507 ?auto_693511 ) ) ( not ( = ?auto_693507 ?auto_693512 ) ) ( not ( = ?auto_693507 ?auto_693513 ) ) ( not ( = ?auto_693507 ?auto_693514 ) ) ( not ( = ?auto_693507 ?auto_693515 ) ) ( not ( = ?auto_693507 ?auto_693516 ) ) ( not ( = ?auto_693507 ?auto_693517 ) ) ( not ( = ?auto_693507 ?auto_693518 ) ) ( not ( = ?auto_693507 ?auto_693519 ) ) ( not ( = ?auto_693507 ?auto_693520 ) ) ( not ( = ?auto_693507 ?auto_693521 ) ) ( not ( = ?auto_693507 ?auto_693522 ) ) ( not ( = ?auto_693508 ?auto_693509 ) ) ( not ( = ?auto_693508 ?auto_693510 ) ) ( not ( = ?auto_693508 ?auto_693511 ) ) ( not ( = ?auto_693508 ?auto_693512 ) ) ( not ( = ?auto_693508 ?auto_693513 ) ) ( not ( = ?auto_693508 ?auto_693514 ) ) ( not ( = ?auto_693508 ?auto_693515 ) ) ( not ( = ?auto_693508 ?auto_693516 ) ) ( not ( = ?auto_693508 ?auto_693517 ) ) ( not ( = ?auto_693508 ?auto_693518 ) ) ( not ( = ?auto_693508 ?auto_693519 ) ) ( not ( = ?auto_693508 ?auto_693520 ) ) ( not ( = ?auto_693508 ?auto_693521 ) ) ( not ( = ?auto_693508 ?auto_693522 ) ) ( not ( = ?auto_693509 ?auto_693510 ) ) ( not ( = ?auto_693509 ?auto_693511 ) ) ( not ( = ?auto_693509 ?auto_693512 ) ) ( not ( = ?auto_693509 ?auto_693513 ) ) ( not ( = ?auto_693509 ?auto_693514 ) ) ( not ( = ?auto_693509 ?auto_693515 ) ) ( not ( = ?auto_693509 ?auto_693516 ) ) ( not ( = ?auto_693509 ?auto_693517 ) ) ( not ( = ?auto_693509 ?auto_693518 ) ) ( not ( = ?auto_693509 ?auto_693519 ) ) ( not ( = ?auto_693509 ?auto_693520 ) ) ( not ( = ?auto_693509 ?auto_693521 ) ) ( not ( = ?auto_693509 ?auto_693522 ) ) ( not ( = ?auto_693510 ?auto_693511 ) ) ( not ( = ?auto_693510 ?auto_693512 ) ) ( not ( = ?auto_693510 ?auto_693513 ) ) ( not ( = ?auto_693510 ?auto_693514 ) ) ( not ( = ?auto_693510 ?auto_693515 ) ) ( not ( = ?auto_693510 ?auto_693516 ) ) ( not ( = ?auto_693510 ?auto_693517 ) ) ( not ( = ?auto_693510 ?auto_693518 ) ) ( not ( = ?auto_693510 ?auto_693519 ) ) ( not ( = ?auto_693510 ?auto_693520 ) ) ( not ( = ?auto_693510 ?auto_693521 ) ) ( not ( = ?auto_693510 ?auto_693522 ) ) ( not ( = ?auto_693511 ?auto_693512 ) ) ( not ( = ?auto_693511 ?auto_693513 ) ) ( not ( = ?auto_693511 ?auto_693514 ) ) ( not ( = ?auto_693511 ?auto_693515 ) ) ( not ( = ?auto_693511 ?auto_693516 ) ) ( not ( = ?auto_693511 ?auto_693517 ) ) ( not ( = ?auto_693511 ?auto_693518 ) ) ( not ( = ?auto_693511 ?auto_693519 ) ) ( not ( = ?auto_693511 ?auto_693520 ) ) ( not ( = ?auto_693511 ?auto_693521 ) ) ( not ( = ?auto_693511 ?auto_693522 ) ) ( not ( = ?auto_693512 ?auto_693513 ) ) ( not ( = ?auto_693512 ?auto_693514 ) ) ( not ( = ?auto_693512 ?auto_693515 ) ) ( not ( = ?auto_693512 ?auto_693516 ) ) ( not ( = ?auto_693512 ?auto_693517 ) ) ( not ( = ?auto_693512 ?auto_693518 ) ) ( not ( = ?auto_693512 ?auto_693519 ) ) ( not ( = ?auto_693512 ?auto_693520 ) ) ( not ( = ?auto_693512 ?auto_693521 ) ) ( not ( = ?auto_693512 ?auto_693522 ) ) ( not ( = ?auto_693513 ?auto_693514 ) ) ( not ( = ?auto_693513 ?auto_693515 ) ) ( not ( = ?auto_693513 ?auto_693516 ) ) ( not ( = ?auto_693513 ?auto_693517 ) ) ( not ( = ?auto_693513 ?auto_693518 ) ) ( not ( = ?auto_693513 ?auto_693519 ) ) ( not ( = ?auto_693513 ?auto_693520 ) ) ( not ( = ?auto_693513 ?auto_693521 ) ) ( not ( = ?auto_693513 ?auto_693522 ) ) ( not ( = ?auto_693514 ?auto_693515 ) ) ( not ( = ?auto_693514 ?auto_693516 ) ) ( not ( = ?auto_693514 ?auto_693517 ) ) ( not ( = ?auto_693514 ?auto_693518 ) ) ( not ( = ?auto_693514 ?auto_693519 ) ) ( not ( = ?auto_693514 ?auto_693520 ) ) ( not ( = ?auto_693514 ?auto_693521 ) ) ( not ( = ?auto_693514 ?auto_693522 ) ) ( not ( = ?auto_693515 ?auto_693516 ) ) ( not ( = ?auto_693515 ?auto_693517 ) ) ( not ( = ?auto_693515 ?auto_693518 ) ) ( not ( = ?auto_693515 ?auto_693519 ) ) ( not ( = ?auto_693515 ?auto_693520 ) ) ( not ( = ?auto_693515 ?auto_693521 ) ) ( not ( = ?auto_693515 ?auto_693522 ) ) ( not ( = ?auto_693516 ?auto_693517 ) ) ( not ( = ?auto_693516 ?auto_693518 ) ) ( not ( = ?auto_693516 ?auto_693519 ) ) ( not ( = ?auto_693516 ?auto_693520 ) ) ( not ( = ?auto_693516 ?auto_693521 ) ) ( not ( = ?auto_693516 ?auto_693522 ) ) ( not ( = ?auto_693517 ?auto_693518 ) ) ( not ( = ?auto_693517 ?auto_693519 ) ) ( not ( = ?auto_693517 ?auto_693520 ) ) ( not ( = ?auto_693517 ?auto_693521 ) ) ( not ( = ?auto_693517 ?auto_693522 ) ) ( not ( = ?auto_693518 ?auto_693519 ) ) ( not ( = ?auto_693518 ?auto_693520 ) ) ( not ( = ?auto_693518 ?auto_693521 ) ) ( not ( = ?auto_693518 ?auto_693522 ) ) ( not ( = ?auto_693519 ?auto_693520 ) ) ( not ( = ?auto_693519 ?auto_693521 ) ) ( not ( = ?auto_693519 ?auto_693522 ) ) ( not ( = ?auto_693520 ?auto_693521 ) ) ( not ( = ?auto_693520 ?auto_693522 ) ) ( not ( = ?auto_693521 ?auto_693522 ) ) ( ON ?auto_693520 ?auto_693521 ) ( ON ?auto_693519 ?auto_693520 ) ( ON ?auto_693518 ?auto_693519 ) ( ON ?auto_693517 ?auto_693518 ) ( ON ?auto_693516 ?auto_693517 ) ( ON ?auto_693515 ?auto_693516 ) ( ON ?auto_693514 ?auto_693515 ) ( ON ?auto_693513 ?auto_693514 ) ( ON ?auto_693512 ?auto_693513 ) ( ON ?auto_693511 ?auto_693512 ) ( ON ?auto_693510 ?auto_693511 ) ( ON ?auto_693509 ?auto_693510 ) ( CLEAR ?auto_693507 ) ( ON ?auto_693508 ?auto_693509 ) ( CLEAR ?auto_693508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_693506 ?auto_693507 ?auto_693508 )
      ( MAKE-16PILE ?auto_693506 ?auto_693507 ?auto_693508 ?auto_693509 ?auto_693510 ?auto_693511 ?auto_693512 ?auto_693513 ?auto_693514 ?auto_693515 ?auto_693516 ?auto_693517 ?auto_693518 ?auto_693519 ?auto_693520 ?auto_693521 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_693572 - BLOCK
      ?auto_693573 - BLOCK
      ?auto_693574 - BLOCK
      ?auto_693575 - BLOCK
      ?auto_693576 - BLOCK
      ?auto_693577 - BLOCK
      ?auto_693578 - BLOCK
      ?auto_693579 - BLOCK
      ?auto_693580 - BLOCK
      ?auto_693581 - BLOCK
      ?auto_693582 - BLOCK
      ?auto_693583 - BLOCK
      ?auto_693584 - BLOCK
      ?auto_693585 - BLOCK
      ?auto_693586 - BLOCK
      ?auto_693587 - BLOCK
    )
    :vars
    (
      ?auto_693588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_693587 ?auto_693588 ) ( ON-TABLE ?auto_693572 ) ( not ( = ?auto_693572 ?auto_693573 ) ) ( not ( = ?auto_693572 ?auto_693574 ) ) ( not ( = ?auto_693572 ?auto_693575 ) ) ( not ( = ?auto_693572 ?auto_693576 ) ) ( not ( = ?auto_693572 ?auto_693577 ) ) ( not ( = ?auto_693572 ?auto_693578 ) ) ( not ( = ?auto_693572 ?auto_693579 ) ) ( not ( = ?auto_693572 ?auto_693580 ) ) ( not ( = ?auto_693572 ?auto_693581 ) ) ( not ( = ?auto_693572 ?auto_693582 ) ) ( not ( = ?auto_693572 ?auto_693583 ) ) ( not ( = ?auto_693572 ?auto_693584 ) ) ( not ( = ?auto_693572 ?auto_693585 ) ) ( not ( = ?auto_693572 ?auto_693586 ) ) ( not ( = ?auto_693572 ?auto_693587 ) ) ( not ( = ?auto_693572 ?auto_693588 ) ) ( not ( = ?auto_693573 ?auto_693574 ) ) ( not ( = ?auto_693573 ?auto_693575 ) ) ( not ( = ?auto_693573 ?auto_693576 ) ) ( not ( = ?auto_693573 ?auto_693577 ) ) ( not ( = ?auto_693573 ?auto_693578 ) ) ( not ( = ?auto_693573 ?auto_693579 ) ) ( not ( = ?auto_693573 ?auto_693580 ) ) ( not ( = ?auto_693573 ?auto_693581 ) ) ( not ( = ?auto_693573 ?auto_693582 ) ) ( not ( = ?auto_693573 ?auto_693583 ) ) ( not ( = ?auto_693573 ?auto_693584 ) ) ( not ( = ?auto_693573 ?auto_693585 ) ) ( not ( = ?auto_693573 ?auto_693586 ) ) ( not ( = ?auto_693573 ?auto_693587 ) ) ( not ( = ?auto_693573 ?auto_693588 ) ) ( not ( = ?auto_693574 ?auto_693575 ) ) ( not ( = ?auto_693574 ?auto_693576 ) ) ( not ( = ?auto_693574 ?auto_693577 ) ) ( not ( = ?auto_693574 ?auto_693578 ) ) ( not ( = ?auto_693574 ?auto_693579 ) ) ( not ( = ?auto_693574 ?auto_693580 ) ) ( not ( = ?auto_693574 ?auto_693581 ) ) ( not ( = ?auto_693574 ?auto_693582 ) ) ( not ( = ?auto_693574 ?auto_693583 ) ) ( not ( = ?auto_693574 ?auto_693584 ) ) ( not ( = ?auto_693574 ?auto_693585 ) ) ( not ( = ?auto_693574 ?auto_693586 ) ) ( not ( = ?auto_693574 ?auto_693587 ) ) ( not ( = ?auto_693574 ?auto_693588 ) ) ( not ( = ?auto_693575 ?auto_693576 ) ) ( not ( = ?auto_693575 ?auto_693577 ) ) ( not ( = ?auto_693575 ?auto_693578 ) ) ( not ( = ?auto_693575 ?auto_693579 ) ) ( not ( = ?auto_693575 ?auto_693580 ) ) ( not ( = ?auto_693575 ?auto_693581 ) ) ( not ( = ?auto_693575 ?auto_693582 ) ) ( not ( = ?auto_693575 ?auto_693583 ) ) ( not ( = ?auto_693575 ?auto_693584 ) ) ( not ( = ?auto_693575 ?auto_693585 ) ) ( not ( = ?auto_693575 ?auto_693586 ) ) ( not ( = ?auto_693575 ?auto_693587 ) ) ( not ( = ?auto_693575 ?auto_693588 ) ) ( not ( = ?auto_693576 ?auto_693577 ) ) ( not ( = ?auto_693576 ?auto_693578 ) ) ( not ( = ?auto_693576 ?auto_693579 ) ) ( not ( = ?auto_693576 ?auto_693580 ) ) ( not ( = ?auto_693576 ?auto_693581 ) ) ( not ( = ?auto_693576 ?auto_693582 ) ) ( not ( = ?auto_693576 ?auto_693583 ) ) ( not ( = ?auto_693576 ?auto_693584 ) ) ( not ( = ?auto_693576 ?auto_693585 ) ) ( not ( = ?auto_693576 ?auto_693586 ) ) ( not ( = ?auto_693576 ?auto_693587 ) ) ( not ( = ?auto_693576 ?auto_693588 ) ) ( not ( = ?auto_693577 ?auto_693578 ) ) ( not ( = ?auto_693577 ?auto_693579 ) ) ( not ( = ?auto_693577 ?auto_693580 ) ) ( not ( = ?auto_693577 ?auto_693581 ) ) ( not ( = ?auto_693577 ?auto_693582 ) ) ( not ( = ?auto_693577 ?auto_693583 ) ) ( not ( = ?auto_693577 ?auto_693584 ) ) ( not ( = ?auto_693577 ?auto_693585 ) ) ( not ( = ?auto_693577 ?auto_693586 ) ) ( not ( = ?auto_693577 ?auto_693587 ) ) ( not ( = ?auto_693577 ?auto_693588 ) ) ( not ( = ?auto_693578 ?auto_693579 ) ) ( not ( = ?auto_693578 ?auto_693580 ) ) ( not ( = ?auto_693578 ?auto_693581 ) ) ( not ( = ?auto_693578 ?auto_693582 ) ) ( not ( = ?auto_693578 ?auto_693583 ) ) ( not ( = ?auto_693578 ?auto_693584 ) ) ( not ( = ?auto_693578 ?auto_693585 ) ) ( not ( = ?auto_693578 ?auto_693586 ) ) ( not ( = ?auto_693578 ?auto_693587 ) ) ( not ( = ?auto_693578 ?auto_693588 ) ) ( not ( = ?auto_693579 ?auto_693580 ) ) ( not ( = ?auto_693579 ?auto_693581 ) ) ( not ( = ?auto_693579 ?auto_693582 ) ) ( not ( = ?auto_693579 ?auto_693583 ) ) ( not ( = ?auto_693579 ?auto_693584 ) ) ( not ( = ?auto_693579 ?auto_693585 ) ) ( not ( = ?auto_693579 ?auto_693586 ) ) ( not ( = ?auto_693579 ?auto_693587 ) ) ( not ( = ?auto_693579 ?auto_693588 ) ) ( not ( = ?auto_693580 ?auto_693581 ) ) ( not ( = ?auto_693580 ?auto_693582 ) ) ( not ( = ?auto_693580 ?auto_693583 ) ) ( not ( = ?auto_693580 ?auto_693584 ) ) ( not ( = ?auto_693580 ?auto_693585 ) ) ( not ( = ?auto_693580 ?auto_693586 ) ) ( not ( = ?auto_693580 ?auto_693587 ) ) ( not ( = ?auto_693580 ?auto_693588 ) ) ( not ( = ?auto_693581 ?auto_693582 ) ) ( not ( = ?auto_693581 ?auto_693583 ) ) ( not ( = ?auto_693581 ?auto_693584 ) ) ( not ( = ?auto_693581 ?auto_693585 ) ) ( not ( = ?auto_693581 ?auto_693586 ) ) ( not ( = ?auto_693581 ?auto_693587 ) ) ( not ( = ?auto_693581 ?auto_693588 ) ) ( not ( = ?auto_693582 ?auto_693583 ) ) ( not ( = ?auto_693582 ?auto_693584 ) ) ( not ( = ?auto_693582 ?auto_693585 ) ) ( not ( = ?auto_693582 ?auto_693586 ) ) ( not ( = ?auto_693582 ?auto_693587 ) ) ( not ( = ?auto_693582 ?auto_693588 ) ) ( not ( = ?auto_693583 ?auto_693584 ) ) ( not ( = ?auto_693583 ?auto_693585 ) ) ( not ( = ?auto_693583 ?auto_693586 ) ) ( not ( = ?auto_693583 ?auto_693587 ) ) ( not ( = ?auto_693583 ?auto_693588 ) ) ( not ( = ?auto_693584 ?auto_693585 ) ) ( not ( = ?auto_693584 ?auto_693586 ) ) ( not ( = ?auto_693584 ?auto_693587 ) ) ( not ( = ?auto_693584 ?auto_693588 ) ) ( not ( = ?auto_693585 ?auto_693586 ) ) ( not ( = ?auto_693585 ?auto_693587 ) ) ( not ( = ?auto_693585 ?auto_693588 ) ) ( not ( = ?auto_693586 ?auto_693587 ) ) ( not ( = ?auto_693586 ?auto_693588 ) ) ( not ( = ?auto_693587 ?auto_693588 ) ) ( ON ?auto_693586 ?auto_693587 ) ( ON ?auto_693585 ?auto_693586 ) ( ON ?auto_693584 ?auto_693585 ) ( ON ?auto_693583 ?auto_693584 ) ( ON ?auto_693582 ?auto_693583 ) ( ON ?auto_693581 ?auto_693582 ) ( ON ?auto_693580 ?auto_693581 ) ( ON ?auto_693579 ?auto_693580 ) ( ON ?auto_693578 ?auto_693579 ) ( ON ?auto_693577 ?auto_693578 ) ( ON ?auto_693576 ?auto_693577 ) ( ON ?auto_693575 ?auto_693576 ) ( ON ?auto_693574 ?auto_693575 ) ( CLEAR ?auto_693572 ) ( ON ?auto_693573 ?auto_693574 ) ( CLEAR ?auto_693573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_693572 ?auto_693573 )
      ( MAKE-16PILE ?auto_693572 ?auto_693573 ?auto_693574 ?auto_693575 ?auto_693576 ?auto_693577 ?auto_693578 ?auto_693579 ?auto_693580 ?auto_693581 ?auto_693582 ?auto_693583 ?auto_693584 ?auto_693585 ?auto_693586 ?auto_693587 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_693638 - BLOCK
      ?auto_693639 - BLOCK
      ?auto_693640 - BLOCK
      ?auto_693641 - BLOCK
      ?auto_693642 - BLOCK
      ?auto_693643 - BLOCK
      ?auto_693644 - BLOCK
      ?auto_693645 - BLOCK
      ?auto_693646 - BLOCK
      ?auto_693647 - BLOCK
      ?auto_693648 - BLOCK
      ?auto_693649 - BLOCK
      ?auto_693650 - BLOCK
      ?auto_693651 - BLOCK
      ?auto_693652 - BLOCK
      ?auto_693653 - BLOCK
    )
    :vars
    (
      ?auto_693654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_693653 ?auto_693654 ) ( not ( = ?auto_693638 ?auto_693639 ) ) ( not ( = ?auto_693638 ?auto_693640 ) ) ( not ( = ?auto_693638 ?auto_693641 ) ) ( not ( = ?auto_693638 ?auto_693642 ) ) ( not ( = ?auto_693638 ?auto_693643 ) ) ( not ( = ?auto_693638 ?auto_693644 ) ) ( not ( = ?auto_693638 ?auto_693645 ) ) ( not ( = ?auto_693638 ?auto_693646 ) ) ( not ( = ?auto_693638 ?auto_693647 ) ) ( not ( = ?auto_693638 ?auto_693648 ) ) ( not ( = ?auto_693638 ?auto_693649 ) ) ( not ( = ?auto_693638 ?auto_693650 ) ) ( not ( = ?auto_693638 ?auto_693651 ) ) ( not ( = ?auto_693638 ?auto_693652 ) ) ( not ( = ?auto_693638 ?auto_693653 ) ) ( not ( = ?auto_693638 ?auto_693654 ) ) ( not ( = ?auto_693639 ?auto_693640 ) ) ( not ( = ?auto_693639 ?auto_693641 ) ) ( not ( = ?auto_693639 ?auto_693642 ) ) ( not ( = ?auto_693639 ?auto_693643 ) ) ( not ( = ?auto_693639 ?auto_693644 ) ) ( not ( = ?auto_693639 ?auto_693645 ) ) ( not ( = ?auto_693639 ?auto_693646 ) ) ( not ( = ?auto_693639 ?auto_693647 ) ) ( not ( = ?auto_693639 ?auto_693648 ) ) ( not ( = ?auto_693639 ?auto_693649 ) ) ( not ( = ?auto_693639 ?auto_693650 ) ) ( not ( = ?auto_693639 ?auto_693651 ) ) ( not ( = ?auto_693639 ?auto_693652 ) ) ( not ( = ?auto_693639 ?auto_693653 ) ) ( not ( = ?auto_693639 ?auto_693654 ) ) ( not ( = ?auto_693640 ?auto_693641 ) ) ( not ( = ?auto_693640 ?auto_693642 ) ) ( not ( = ?auto_693640 ?auto_693643 ) ) ( not ( = ?auto_693640 ?auto_693644 ) ) ( not ( = ?auto_693640 ?auto_693645 ) ) ( not ( = ?auto_693640 ?auto_693646 ) ) ( not ( = ?auto_693640 ?auto_693647 ) ) ( not ( = ?auto_693640 ?auto_693648 ) ) ( not ( = ?auto_693640 ?auto_693649 ) ) ( not ( = ?auto_693640 ?auto_693650 ) ) ( not ( = ?auto_693640 ?auto_693651 ) ) ( not ( = ?auto_693640 ?auto_693652 ) ) ( not ( = ?auto_693640 ?auto_693653 ) ) ( not ( = ?auto_693640 ?auto_693654 ) ) ( not ( = ?auto_693641 ?auto_693642 ) ) ( not ( = ?auto_693641 ?auto_693643 ) ) ( not ( = ?auto_693641 ?auto_693644 ) ) ( not ( = ?auto_693641 ?auto_693645 ) ) ( not ( = ?auto_693641 ?auto_693646 ) ) ( not ( = ?auto_693641 ?auto_693647 ) ) ( not ( = ?auto_693641 ?auto_693648 ) ) ( not ( = ?auto_693641 ?auto_693649 ) ) ( not ( = ?auto_693641 ?auto_693650 ) ) ( not ( = ?auto_693641 ?auto_693651 ) ) ( not ( = ?auto_693641 ?auto_693652 ) ) ( not ( = ?auto_693641 ?auto_693653 ) ) ( not ( = ?auto_693641 ?auto_693654 ) ) ( not ( = ?auto_693642 ?auto_693643 ) ) ( not ( = ?auto_693642 ?auto_693644 ) ) ( not ( = ?auto_693642 ?auto_693645 ) ) ( not ( = ?auto_693642 ?auto_693646 ) ) ( not ( = ?auto_693642 ?auto_693647 ) ) ( not ( = ?auto_693642 ?auto_693648 ) ) ( not ( = ?auto_693642 ?auto_693649 ) ) ( not ( = ?auto_693642 ?auto_693650 ) ) ( not ( = ?auto_693642 ?auto_693651 ) ) ( not ( = ?auto_693642 ?auto_693652 ) ) ( not ( = ?auto_693642 ?auto_693653 ) ) ( not ( = ?auto_693642 ?auto_693654 ) ) ( not ( = ?auto_693643 ?auto_693644 ) ) ( not ( = ?auto_693643 ?auto_693645 ) ) ( not ( = ?auto_693643 ?auto_693646 ) ) ( not ( = ?auto_693643 ?auto_693647 ) ) ( not ( = ?auto_693643 ?auto_693648 ) ) ( not ( = ?auto_693643 ?auto_693649 ) ) ( not ( = ?auto_693643 ?auto_693650 ) ) ( not ( = ?auto_693643 ?auto_693651 ) ) ( not ( = ?auto_693643 ?auto_693652 ) ) ( not ( = ?auto_693643 ?auto_693653 ) ) ( not ( = ?auto_693643 ?auto_693654 ) ) ( not ( = ?auto_693644 ?auto_693645 ) ) ( not ( = ?auto_693644 ?auto_693646 ) ) ( not ( = ?auto_693644 ?auto_693647 ) ) ( not ( = ?auto_693644 ?auto_693648 ) ) ( not ( = ?auto_693644 ?auto_693649 ) ) ( not ( = ?auto_693644 ?auto_693650 ) ) ( not ( = ?auto_693644 ?auto_693651 ) ) ( not ( = ?auto_693644 ?auto_693652 ) ) ( not ( = ?auto_693644 ?auto_693653 ) ) ( not ( = ?auto_693644 ?auto_693654 ) ) ( not ( = ?auto_693645 ?auto_693646 ) ) ( not ( = ?auto_693645 ?auto_693647 ) ) ( not ( = ?auto_693645 ?auto_693648 ) ) ( not ( = ?auto_693645 ?auto_693649 ) ) ( not ( = ?auto_693645 ?auto_693650 ) ) ( not ( = ?auto_693645 ?auto_693651 ) ) ( not ( = ?auto_693645 ?auto_693652 ) ) ( not ( = ?auto_693645 ?auto_693653 ) ) ( not ( = ?auto_693645 ?auto_693654 ) ) ( not ( = ?auto_693646 ?auto_693647 ) ) ( not ( = ?auto_693646 ?auto_693648 ) ) ( not ( = ?auto_693646 ?auto_693649 ) ) ( not ( = ?auto_693646 ?auto_693650 ) ) ( not ( = ?auto_693646 ?auto_693651 ) ) ( not ( = ?auto_693646 ?auto_693652 ) ) ( not ( = ?auto_693646 ?auto_693653 ) ) ( not ( = ?auto_693646 ?auto_693654 ) ) ( not ( = ?auto_693647 ?auto_693648 ) ) ( not ( = ?auto_693647 ?auto_693649 ) ) ( not ( = ?auto_693647 ?auto_693650 ) ) ( not ( = ?auto_693647 ?auto_693651 ) ) ( not ( = ?auto_693647 ?auto_693652 ) ) ( not ( = ?auto_693647 ?auto_693653 ) ) ( not ( = ?auto_693647 ?auto_693654 ) ) ( not ( = ?auto_693648 ?auto_693649 ) ) ( not ( = ?auto_693648 ?auto_693650 ) ) ( not ( = ?auto_693648 ?auto_693651 ) ) ( not ( = ?auto_693648 ?auto_693652 ) ) ( not ( = ?auto_693648 ?auto_693653 ) ) ( not ( = ?auto_693648 ?auto_693654 ) ) ( not ( = ?auto_693649 ?auto_693650 ) ) ( not ( = ?auto_693649 ?auto_693651 ) ) ( not ( = ?auto_693649 ?auto_693652 ) ) ( not ( = ?auto_693649 ?auto_693653 ) ) ( not ( = ?auto_693649 ?auto_693654 ) ) ( not ( = ?auto_693650 ?auto_693651 ) ) ( not ( = ?auto_693650 ?auto_693652 ) ) ( not ( = ?auto_693650 ?auto_693653 ) ) ( not ( = ?auto_693650 ?auto_693654 ) ) ( not ( = ?auto_693651 ?auto_693652 ) ) ( not ( = ?auto_693651 ?auto_693653 ) ) ( not ( = ?auto_693651 ?auto_693654 ) ) ( not ( = ?auto_693652 ?auto_693653 ) ) ( not ( = ?auto_693652 ?auto_693654 ) ) ( not ( = ?auto_693653 ?auto_693654 ) ) ( ON ?auto_693652 ?auto_693653 ) ( ON ?auto_693651 ?auto_693652 ) ( ON ?auto_693650 ?auto_693651 ) ( ON ?auto_693649 ?auto_693650 ) ( ON ?auto_693648 ?auto_693649 ) ( ON ?auto_693647 ?auto_693648 ) ( ON ?auto_693646 ?auto_693647 ) ( ON ?auto_693645 ?auto_693646 ) ( ON ?auto_693644 ?auto_693645 ) ( ON ?auto_693643 ?auto_693644 ) ( ON ?auto_693642 ?auto_693643 ) ( ON ?auto_693641 ?auto_693642 ) ( ON ?auto_693640 ?auto_693641 ) ( ON ?auto_693639 ?auto_693640 ) ( ON ?auto_693638 ?auto_693639 ) ( CLEAR ?auto_693638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_693638 )
      ( MAKE-16PILE ?auto_693638 ?auto_693639 ?auto_693640 ?auto_693641 ?auto_693642 ?auto_693643 ?auto_693644 ?auto_693645 ?auto_693646 ?auto_693647 ?auto_693648 ?auto_693649 ?auto_693650 ?auto_693651 ?auto_693652 ?auto_693653 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_693705 - BLOCK
      ?auto_693706 - BLOCK
      ?auto_693707 - BLOCK
      ?auto_693708 - BLOCK
      ?auto_693709 - BLOCK
      ?auto_693710 - BLOCK
      ?auto_693711 - BLOCK
      ?auto_693712 - BLOCK
      ?auto_693713 - BLOCK
      ?auto_693714 - BLOCK
      ?auto_693715 - BLOCK
      ?auto_693716 - BLOCK
      ?auto_693717 - BLOCK
      ?auto_693718 - BLOCK
      ?auto_693719 - BLOCK
      ?auto_693720 - BLOCK
      ?auto_693721 - BLOCK
    )
    :vars
    (
      ?auto_693722 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_693720 ) ( ON ?auto_693721 ?auto_693722 ) ( CLEAR ?auto_693721 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_693705 ) ( ON ?auto_693706 ?auto_693705 ) ( ON ?auto_693707 ?auto_693706 ) ( ON ?auto_693708 ?auto_693707 ) ( ON ?auto_693709 ?auto_693708 ) ( ON ?auto_693710 ?auto_693709 ) ( ON ?auto_693711 ?auto_693710 ) ( ON ?auto_693712 ?auto_693711 ) ( ON ?auto_693713 ?auto_693712 ) ( ON ?auto_693714 ?auto_693713 ) ( ON ?auto_693715 ?auto_693714 ) ( ON ?auto_693716 ?auto_693715 ) ( ON ?auto_693717 ?auto_693716 ) ( ON ?auto_693718 ?auto_693717 ) ( ON ?auto_693719 ?auto_693718 ) ( ON ?auto_693720 ?auto_693719 ) ( not ( = ?auto_693705 ?auto_693706 ) ) ( not ( = ?auto_693705 ?auto_693707 ) ) ( not ( = ?auto_693705 ?auto_693708 ) ) ( not ( = ?auto_693705 ?auto_693709 ) ) ( not ( = ?auto_693705 ?auto_693710 ) ) ( not ( = ?auto_693705 ?auto_693711 ) ) ( not ( = ?auto_693705 ?auto_693712 ) ) ( not ( = ?auto_693705 ?auto_693713 ) ) ( not ( = ?auto_693705 ?auto_693714 ) ) ( not ( = ?auto_693705 ?auto_693715 ) ) ( not ( = ?auto_693705 ?auto_693716 ) ) ( not ( = ?auto_693705 ?auto_693717 ) ) ( not ( = ?auto_693705 ?auto_693718 ) ) ( not ( = ?auto_693705 ?auto_693719 ) ) ( not ( = ?auto_693705 ?auto_693720 ) ) ( not ( = ?auto_693705 ?auto_693721 ) ) ( not ( = ?auto_693705 ?auto_693722 ) ) ( not ( = ?auto_693706 ?auto_693707 ) ) ( not ( = ?auto_693706 ?auto_693708 ) ) ( not ( = ?auto_693706 ?auto_693709 ) ) ( not ( = ?auto_693706 ?auto_693710 ) ) ( not ( = ?auto_693706 ?auto_693711 ) ) ( not ( = ?auto_693706 ?auto_693712 ) ) ( not ( = ?auto_693706 ?auto_693713 ) ) ( not ( = ?auto_693706 ?auto_693714 ) ) ( not ( = ?auto_693706 ?auto_693715 ) ) ( not ( = ?auto_693706 ?auto_693716 ) ) ( not ( = ?auto_693706 ?auto_693717 ) ) ( not ( = ?auto_693706 ?auto_693718 ) ) ( not ( = ?auto_693706 ?auto_693719 ) ) ( not ( = ?auto_693706 ?auto_693720 ) ) ( not ( = ?auto_693706 ?auto_693721 ) ) ( not ( = ?auto_693706 ?auto_693722 ) ) ( not ( = ?auto_693707 ?auto_693708 ) ) ( not ( = ?auto_693707 ?auto_693709 ) ) ( not ( = ?auto_693707 ?auto_693710 ) ) ( not ( = ?auto_693707 ?auto_693711 ) ) ( not ( = ?auto_693707 ?auto_693712 ) ) ( not ( = ?auto_693707 ?auto_693713 ) ) ( not ( = ?auto_693707 ?auto_693714 ) ) ( not ( = ?auto_693707 ?auto_693715 ) ) ( not ( = ?auto_693707 ?auto_693716 ) ) ( not ( = ?auto_693707 ?auto_693717 ) ) ( not ( = ?auto_693707 ?auto_693718 ) ) ( not ( = ?auto_693707 ?auto_693719 ) ) ( not ( = ?auto_693707 ?auto_693720 ) ) ( not ( = ?auto_693707 ?auto_693721 ) ) ( not ( = ?auto_693707 ?auto_693722 ) ) ( not ( = ?auto_693708 ?auto_693709 ) ) ( not ( = ?auto_693708 ?auto_693710 ) ) ( not ( = ?auto_693708 ?auto_693711 ) ) ( not ( = ?auto_693708 ?auto_693712 ) ) ( not ( = ?auto_693708 ?auto_693713 ) ) ( not ( = ?auto_693708 ?auto_693714 ) ) ( not ( = ?auto_693708 ?auto_693715 ) ) ( not ( = ?auto_693708 ?auto_693716 ) ) ( not ( = ?auto_693708 ?auto_693717 ) ) ( not ( = ?auto_693708 ?auto_693718 ) ) ( not ( = ?auto_693708 ?auto_693719 ) ) ( not ( = ?auto_693708 ?auto_693720 ) ) ( not ( = ?auto_693708 ?auto_693721 ) ) ( not ( = ?auto_693708 ?auto_693722 ) ) ( not ( = ?auto_693709 ?auto_693710 ) ) ( not ( = ?auto_693709 ?auto_693711 ) ) ( not ( = ?auto_693709 ?auto_693712 ) ) ( not ( = ?auto_693709 ?auto_693713 ) ) ( not ( = ?auto_693709 ?auto_693714 ) ) ( not ( = ?auto_693709 ?auto_693715 ) ) ( not ( = ?auto_693709 ?auto_693716 ) ) ( not ( = ?auto_693709 ?auto_693717 ) ) ( not ( = ?auto_693709 ?auto_693718 ) ) ( not ( = ?auto_693709 ?auto_693719 ) ) ( not ( = ?auto_693709 ?auto_693720 ) ) ( not ( = ?auto_693709 ?auto_693721 ) ) ( not ( = ?auto_693709 ?auto_693722 ) ) ( not ( = ?auto_693710 ?auto_693711 ) ) ( not ( = ?auto_693710 ?auto_693712 ) ) ( not ( = ?auto_693710 ?auto_693713 ) ) ( not ( = ?auto_693710 ?auto_693714 ) ) ( not ( = ?auto_693710 ?auto_693715 ) ) ( not ( = ?auto_693710 ?auto_693716 ) ) ( not ( = ?auto_693710 ?auto_693717 ) ) ( not ( = ?auto_693710 ?auto_693718 ) ) ( not ( = ?auto_693710 ?auto_693719 ) ) ( not ( = ?auto_693710 ?auto_693720 ) ) ( not ( = ?auto_693710 ?auto_693721 ) ) ( not ( = ?auto_693710 ?auto_693722 ) ) ( not ( = ?auto_693711 ?auto_693712 ) ) ( not ( = ?auto_693711 ?auto_693713 ) ) ( not ( = ?auto_693711 ?auto_693714 ) ) ( not ( = ?auto_693711 ?auto_693715 ) ) ( not ( = ?auto_693711 ?auto_693716 ) ) ( not ( = ?auto_693711 ?auto_693717 ) ) ( not ( = ?auto_693711 ?auto_693718 ) ) ( not ( = ?auto_693711 ?auto_693719 ) ) ( not ( = ?auto_693711 ?auto_693720 ) ) ( not ( = ?auto_693711 ?auto_693721 ) ) ( not ( = ?auto_693711 ?auto_693722 ) ) ( not ( = ?auto_693712 ?auto_693713 ) ) ( not ( = ?auto_693712 ?auto_693714 ) ) ( not ( = ?auto_693712 ?auto_693715 ) ) ( not ( = ?auto_693712 ?auto_693716 ) ) ( not ( = ?auto_693712 ?auto_693717 ) ) ( not ( = ?auto_693712 ?auto_693718 ) ) ( not ( = ?auto_693712 ?auto_693719 ) ) ( not ( = ?auto_693712 ?auto_693720 ) ) ( not ( = ?auto_693712 ?auto_693721 ) ) ( not ( = ?auto_693712 ?auto_693722 ) ) ( not ( = ?auto_693713 ?auto_693714 ) ) ( not ( = ?auto_693713 ?auto_693715 ) ) ( not ( = ?auto_693713 ?auto_693716 ) ) ( not ( = ?auto_693713 ?auto_693717 ) ) ( not ( = ?auto_693713 ?auto_693718 ) ) ( not ( = ?auto_693713 ?auto_693719 ) ) ( not ( = ?auto_693713 ?auto_693720 ) ) ( not ( = ?auto_693713 ?auto_693721 ) ) ( not ( = ?auto_693713 ?auto_693722 ) ) ( not ( = ?auto_693714 ?auto_693715 ) ) ( not ( = ?auto_693714 ?auto_693716 ) ) ( not ( = ?auto_693714 ?auto_693717 ) ) ( not ( = ?auto_693714 ?auto_693718 ) ) ( not ( = ?auto_693714 ?auto_693719 ) ) ( not ( = ?auto_693714 ?auto_693720 ) ) ( not ( = ?auto_693714 ?auto_693721 ) ) ( not ( = ?auto_693714 ?auto_693722 ) ) ( not ( = ?auto_693715 ?auto_693716 ) ) ( not ( = ?auto_693715 ?auto_693717 ) ) ( not ( = ?auto_693715 ?auto_693718 ) ) ( not ( = ?auto_693715 ?auto_693719 ) ) ( not ( = ?auto_693715 ?auto_693720 ) ) ( not ( = ?auto_693715 ?auto_693721 ) ) ( not ( = ?auto_693715 ?auto_693722 ) ) ( not ( = ?auto_693716 ?auto_693717 ) ) ( not ( = ?auto_693716 ?auto_693718 ) ) ( not ( = ?auto_693716 ?auto_693719 ) ) ( not ( = ?auto_693716 ?auto_693720 ) ) ( not ( = ?auto_693716 ?auto_693721 ) ) ( not ( = ?auto_693716 ?auto_693722 ) ) ( not ( = ?auto_693717 ?auto_693718 ) ) ( not ( = ?auto_693717 ?auto_693719 ) ) ( not ( = ?auto_693717 ?auto_693720 ) ) ( not ( = ?auto_693717 ?auto_693721 ) ) ( not ( = ?auto_693717 ?auto_693722 ) ) ( not ( = ?auto_693718 ?auto_693719 ) ) ( not ( = ?auto_693718 ?auto_693720 ) ) ( not ( = ?auto_693718 ?auto_693721 ) ) ( not ( = ?auto_693718 ?auto_693722 ) ) ( not ( = ?auto_693719 ?auto_693720 ) ) ( not ( = ?auto_693719 ?auto_693721 ) ) ( not ( = ?auto_693719 ?auto_693722 ) ) ( not ( = ?auto_693720 ?auto_693721 ) ) ( not ( = ?auto_693720 ?auto_693722 ) ) ( not ( = ?auto_693721 ?auto_693722 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_693721 ?auto_693722 )
      ( !STACK ?auto_693721 ?auto_693720 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_693740 - BLOCK
      ?auto_693741 - BLOCK
      ?auto_693742 - BLOCK
      ?auto_693743 - BLOCK
      ?auto_693744 - BLOCK
      ?auto_693745 - BLOCK
      ?auto_693746 - BLOCK
      ?auto_693747 - BLOCK
      ?auto_693748 - BLOCK
      ?auto_693749 - BLOCK
      ?auto_693750 - BLOCK
      ?auto_693751 - BLOCK
      ?auto_693752 - BLOCK
      ?auto_693753 - BLOCK
      ?auto_693754 - BLOCK
      ?auto_693755 - BLOCK
      ?auto_693756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_693755 ) ( ON-TABLE ?auto_693756 ) ( CLEAR ?auto_693756 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_693740 ) ( ON ?auto_693741 ?auto_693740 ) ( ON ?auto_693742 ?auto_693741 ) ( ON ?auto_693743 ?auto_693742 ) ( ON ?auto_693744 ?auto_693743 ) ( ON ?auto_693745 ?auto_693744 ) ( ON ?auto_693746 ?auto_693745 ) ( ON ?auto_693747 ?auto_693746 ) ( ON ?auto_693748 ?auto_693747 ) ( ON ?auto_693749 ?auto_693748 ) ( ON ?auto_693750 ?auto_693749 ) ( ON ?auto_693751 ?auto_693750 ) ( ON ?auto_693752 ?auto_693751 ) ( ON ?auto_693753 ?auto_693752 ) ( ON ?auto_693754 ?auto_693753 ) ( ON ?auto_693755 ?auto_693754 ) ( not ( = ?auto_693740 ?auto_693741 ) ) ( not ( = ?auto_693740 ?auto_693742 ) ) ( not ( = ?auto_693740 ?auto_693743 ) ) ( not ( = ?auto_693740 ?auto_693744 ) ) ( not ( = ?auto_693740 ?auto_693745 ) ) ( not ( = ?auto_693740 ?auto_693746 ) ) ( not ( = ?auto_693740 ?auto_693747 ) ) ( not ( = ?auto_693740 ?auto_693748 ) ) ( not ( = ?auto_693740 ?auto_693749 ) ) ( not ( = ?auto_693740 ?auto_693750 ) ) ( not ( = ?auto_693740 ?auto_693751 ) ) ( not ( = ?auto_693740 ?auto_693752 ) ) ( not ( = ?auto_693740 ?auto_693753 ) ) ( not ( = ?auto_693740 ?auto_693754 ) ) ( not ( = ?auto_693740 ?auto_693755 ) ) ( not ( = ?auto_693740 ?auto_693756 ) ) ( not ( = ?auto_693741 ?auto_693742 ) ) ( not ( = ?auto_693741 ?auto_693743 ) ) ( not ( = ?auto_693741 ?auto_693744 ) ) ( not ( = ?auto_693741 ?auto_693745 ) ) ( not ( = ?auto_693741 ?auto_693746 ) ) ( not ( = ?auto_693741 ?auto_693747 ) ) ( not ( = ?auto_693741 ?auto_693748 ) ) ( not ( = ?auto_693741 ?auto_693749 ) ) ( not ( = ?auto_693741 ?auto_693750 ) ) ( not ( = ?auto_693741 ?auto_693751 ) ) ( not ( = ?auto_693741 ?auto_693752 ) ) ( not ( = ?auto_693741 ?auto_693753 ) ) ( not ( = ?auto_693741 ?auto_693754 ) ) ( not ( = ?auto_693741 ?auto_693755 ) ) ( not ( = ?auto_693741 ?auto_693756 ) ) ( not ( = ?auto_693742 ?auto_693743 ) ) ( not ( = ?auto_693742 ?auto_693744 ) ) ( not ( = ?auto_693742 ?auto_693745 ) ) ( not ( = ?auto_693742 ?auto_693746 ) ) ( not ( = ?auto_693742 ?auto_693747 ) ) ( not ( = ?auto_693742 ?auto_693748 ) ) ( not ( = ?auto_693742 ?auto_693749 ) ) ( not ( = ?auto_693742 ?auto_693750 ) ) ( not ( = ?auto_693742 ?auto_693751 ) ) ( not ( = ?auto_693742 ?auto_693752 ) ) ( not ( = ?auto_693742 ?auto_693753 ) ) ( not ( = ?auto_693742 ?auto_693754 ) ) ( not ( = ?auto_693742 ?auto_693755 ) ) ( not ( = ?auto_693742 ?auto_693756 ) ) ( not ( = ?auto_693743 ?auto_693744 ) ) ( not ( = ?auto_693743 ?auto_693745 ) ) ( not ( = ?auto_693743 ?auto_693746 ) ) ( not ( = ?auto_693743 ?auto_693747 ) ) ( not ( = ?auto_693743 ?auto_693748 ) ) ( not ( = ?auto_693743 ?auto_693749 ) ) ( not ( = ?auto_693743 ?auto_693750 ) ) ( not ( = ?auto_693743 ?auto_693751 ) ) ( not ( = ?auto_693743 ?auto_693752 ) ) ( not ( = ?auto_693743 ?auto_693753 ) ) ( not ( = ?auto_693743 ?auto_693754 ) ) ( not ( = ?auto_693743 ?auto_693755 ) ) ( not ( = ?auto_693743 ?auto_693756 ) ) ( not ( = ?auto_693744 ?auto_693745 ) ) ( not ( = ?auto_693744 ?auto_693746 ) ) ( not ( = ?auto_693744 ?auto_693747 ) ) ( not ( = ?auto_693744 ?auto_693748 ) ) ( not ( = ?auto_693744 ?auto_693749 ) ) ( not ( = ?auto_693744 ?auto_693750 ) ) ( not ( = ?auto_693744 ?auto_693751 ) ) ( not ( = ?auto_693744 ?auto_693752 ) ) ( not ( = ?auto_693744 ?auto_693753 ) ) ( not ( = ?auto_693744 ?auto_693754 ) ) ( not ( = ?auto_693744 ?auto_693755 ) ) ( not ( = ?auto_693744 ?auto_693756 ) ) ( not ( = ?auto_693745 ?auto_693746 ) ) ( not ( = ?auto_693745 ?auto_693747 ) ) ( not ( = ?auto_693745 ?auto_693748 ) ) ( not ( = ?auto_693745 ?auto_693749 ) ) ( not ( = ?auto_693745 ?auto_693750 ) ) ( not ( = ?auto_693745 ?auto_693751 ) ) ( not ( = ?auto_693745 ?auto_693752 ) ) ( not ( = ?auto_693745 ?auto_693753 ) ) ( not ( = ?auto_693745 ?auto_693754 ) ) ( not ( = ?auto_693745 ?auto_693755 ) ) ( not ( = ?auto_693745 ?auto_693756 ) ) ( not ( = ?auto_693746 ?auto_693747 ) ) ( not ( = ?auto_693746 ?auto_693748 ) ) ( not ( = ?auto_693746 ?auto_693749 ) ) ( not ( = ?auto_693746 ?auto_693750 ) ) ( not ( = ?auto_693746 ?auto_693751 ) ) ( not ( = ?auto_693746 ?auto_693752 ) ) ( not ( = ?auto_693746 ?auto_693753 ) ) ( not ( = ?auto_693746 ?auto_693754 ) ) ( not ( = ?auto_693746 ?auto_693755 ) ) ( not ( = ?auto_693746 ?auto_693756 ) ) ( not ( = ?auto_693747 ?auto_693748 ) ) ( not ( = ?auto_693747 ?auto_693749 ) ) ( not ( = ?auto_693747 ?auto_693750 ) ) ( not ( = ?auto_693747 ?auto_693751 ) ) ( not ( = ?auto_693747 ?auto_693752 ) ) ( not ( = ?auto_693747 ?auto_693753 ) ) ( not ( = ?auto_693747 ?auto_693754 ) ) ( not ( = ?auto_693747 ?auto_693755 ) ) ( not ( = ?auto_693747 ?auto_693756 ) ) ( not ( = ?auto_693748 ?auto_693749 ) ) ( not ( = ?auto_693748 ?auto_693750 ) ) ( not ( = ?auto_693748 ?auto_693751 ) ) ( not ( = ?auto_693748 ?auto_693752 ) ) ( not ( = ?auto_693748 ?auto_693753 ) ) ( not ( = ?auto_693748 ?auto_693754 ) ) ( not ( = ?auto_693748 ?auto_693755 ) ) ( not ( = ?auto_693748 ?auto_693756 ) ) ( not ( = ?auto_693749 ?auto_693750 ) ) ( not ( = ?auto_693749 ?auto_693751 ) ) ( not ( = ?auto_693749 ?auto_693752 ) ) ( not ( = ?auto_693749 ?auto_693753 ) ) ( not ( = ?auto_693749 ?auto_693754 ) ) ( not ( = ?auto_693749 ?auto_693755 ) ) ( not ( = ?auto_693749 ?auto_693756 ) ) ( not ( = ?auto_693750 ?auto_693751 ) ) ( not ( = ?auto_693750 ?auto_693752 ) ) ( not ( = ?auto_693750 ?auto_693753 ) ) ( not ( = ?auto_693750 ?auto_693754 ) ) ( not ( = ?auto_693750 ?auto_693755 ) ) ( not ( = ?auto_693750 ?auto_693756 ) ) ( not ( = ?auto_693751 ?auto_693752 ) ) ( not ( = ?auto_693751 ?auto_693753 ) ) ( not ( = ?auto_693751 ?auto_693754 ) ) ( not ( = ?auto_693751 ?auto_693755 ) ) ( not ( = ?auto_693751 ?auto_693756 ) ) ( not ( = ?auto_693752 ?auto_693753 ) ) ( not ( = ?auto_693752 ?auto_693754 ) ) ( not ( = ?auto_693752 ?auto_693755 ) ) ( not ( = ?auto_693752 ?auto_693756 ) ) ( not ( = ?auto_693753 ?auto_693754 ) ) ( not ( = ?auto_693753 ?auto_693755 ) ) ( not ( = ?auto_693753 ?auto_693756 ) ) ( not ( = ?auto_693754 ?auto_693755 ) ) ( not ( = ?auto_693754 ?auto_693756 ) ) ( not ( = ?auto_693755 ?auto_693756 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_693756 )
      ( !STACK ?auto_693756 ?auto_693755 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_693774 - BLOCK
      ?auto_693775 - BLOCK
      ?auto_693776 - BLOCK
      ?auto_693777 - BLOCK
      ?auto_693778 - BLOCK
      ?auto_693779 - BLOCK
      ?auto_693780 - BLOCK
      ?auto_693781 - BLOCK
      ?auto_693782 - BLOCK
      ?auto_693783 - BLOCK
      ?auto_693784 - BLOCK
      ?auto_693785 - BLOCK
      ?auto_693786 - BLOCK
      ?auto_693787 - BLOCK
      ?auto_693788 - BLOCK
      ?auto_693789 - BLOCK
      ?auto_693790 - BLOCK
    )
    :vars
    (
      ?auto_693791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_693790 ?auto_693791 ) ( ON-TABLE ?auto_693774 ) ( ON ?auto_693775 ?auto_693774 ) ( ON ?auto_693776 ?auto_693775 ) ( ON ?auto_693777 ?auto_693776 ) ( ON ?auto_693778 ?auto_693777 ) ( ON ?auto_693779 ?auto_693778 ) ( ON ?auto_693780 ?auto_693779 ) ( ON ?auto_693781 ?auto_693780 ) ( ON ?auto_693782 ?auto_693781 ) ( ON ?auto_693783 ?auto_693782 ) ( ON ?auto_693784 ?auto_693783 ) ( ON ?auto_693785 ?auto_693784 ) ( ON ?auto_693786 ?auto_693785 ) ( ON ?auto_693787 ?auto_693786 ) ( ON ?auto_693788 ?auto_693787 ) ( not ( = ?auto_693774 ?auto_693775 ) ) ( not ( = ?auto_693774 ?auto_693776 ) ) ( not ( = ?auto_693774 ?auto_693777 ) ) ( not ( = ?auto_693774 ?auto_693778 ) ) ( not ( = ?auto_693774 ?auto_693779 ) ) ( not ( = ?auto_693774 ?auto_693780 ) ) ( not ( = ?auto_693774 ?auto_693781 ) ) ( not ( = ?auto_693774 ?auto_693782 ) ) ( not ( = ?auto_693774 ?auto_693783 ) ) ( not ( = ?auto_693774 ?auto_693784 ) ) ( not ( = ?auto_693774 ?auto_693785 ) ) ( not ( = ?auto_693774 ?auto_693786 ) ) ( not ( = ?auto_693774 ?auto_693787 ) ) ( not ( = ?auto_693774 ?auto_693788 ) ) ( not ( = ?auto_693774 ?auto_693789 ) ) ( not ( = ?auto_693774 ?auto_693790 ) ) ( not ( = ?auto_693774 ?auto_693791 ) ) ( not ( = ?auto_693775 ?auto_693776 ) ) ( not ( = ?auto_693775 ?auto_693777 ) ) ( not ( = ?auto_693775 ?auto_693778 ) ) ( not ( = ?auto_693775 ?auto_693779 ) ) ( not ( = ?auto_693775 ?auto_693780 ) ) ( not ( = ?auto_693775 ?auto_693781 ) ) ( not ( = ?auto_693775 ?auto_693782 ) ) ( not ( = ?auto_693775 ?auto_693783 ) ) ( not ( = ?auto_693775 ?auto_693784 ) ) ( not ( = ?auto_693775 ?auto_693785 ) ) ( not ( = ?auto_693775 ?auto_693786 ) ) ( not ( = ?auto_693775 ?auto_693787 ) ) ( not ( = ?auto_693775 ?auto_693788 ) ) ( not ( = ?auto_693775 ?auto_693789 ) ) ( not ( = ?auto_693775 ?auto_693790 ) ) ( not ( = ?auto_693775 ?auto_693791 ) ) ( not ( = ?auto_693776 ?auto_693777 ) ) ( not ( = ?auto_693776 ?auto_693778 ) ) ( not ( = ?auto_693776 ?auto_693779 ) ) ( not ( = ?auto_693776 ?auto_693780 ) ) ( not ( = ?auto_693776 ?auto_693781 ) ) ( not ( = ?auto_693776 ?auto_693782 ) ) ( not ( = ?auto_693776 ?auto_693783 ) ) ( not ( = ?auto_693776 ?auto_693784 ) ) ( not ( = ?auto_693776 ?auto_693785 ) ) ( not ( = ?auto_693776 ?auto_693786 ) ) ( not ( = ?auto_693776 ?auto_693787 ) ) ( not ( = ?auto_693776 ?auto_693788 ) ) ( not ( = ?auto_693776 ?auto_693789 ) ) ( not ( = ?auto_693776 ?auto_693790 ) ) ( not ( = ?auto_693776 ?auto_693791 ) ) ( not ( = ?auto_693777 ?auto_693778 ) ) ( not ( = ?auto_693777 ?auto_693779 ) ) ( not ( = ?auto_693777 ?auto_693780 ) ) ( not ( = ?auto_693777 ?auto_693781 ) ) ( not ( = ?auto_693777 ?auto_693782 ) ) ( not ( = ?auto_693777 ?auto_693783 ) ) ( not ( = ?auto_693777 ?auto_693784 ) ) ( not ( = ?auto_693777 ?auto_693785 ) ) ( not ( = ?auto_693777 ?auto_693786 ) ) ( not ( = ?auto_693777 ?auto_693787 ) ) ( not ( = ?auto_693777 ?auto_693788 ) ) ( not ( = ?auto_693777 ?auto_693789 ) ) ( not ( = ?auto_693777 ?auto_693790 ) ) ( not ( = ?auto_693777 ?auto_693791 ) ) ( not ( = ?auto_693778 ?auto_693779 ) ) ( not ( = ?auto_693778 ?auto_693780 ) ) ( not ( = ?auto_693778 ?auto_693781 ) ) ( not ( = ?auto_693778 ?auto_693782 ) ) ( not ( = ?auto_693778 ?auto_693783 ) ) ( not ( = ?auto_693778 ?auto_693784 ) ) ( not ( = ?auto_693778 ?auto_693785 ) ) ( not ( = ?auto_693778 ?auto_693786 ) ) ( not ( = ?auto_693778 ?auto_693787 ) ) ( not ( = ?auto_693778 ?auto_693788 ) ) ( not ( = ?auto_693778 ?auto_693789 ) ) ( not ( = ?auto_693778 ?auto_693790 ) ) ( not ( = ?auto_693778 ?auto_693791 ) ) ( not ( = ?auto_693779 ?auto_693780 ) ) ( not ( = ?auto_693779 ?auto_693781 ) ) ( not ( = ?auto_693779 ?auto_693782 ) ) ( not ( = ?auto_693779 ?auto_693783 ) ) ( not ( = ?auto_693779 ?auto_693784 ) ) ( not ( = ?auto_693779 ?auto_693785 ) ) ( not ( = ?auto_693779 ?auto_693786 ) ) ( not ( = ?auto_693779 ?auto_693787 ) ) ( not ( = ?auto_693779 ?auto_693788 ) ) ( not ( = ?auto_693779 ?auto_693789 ) ) ( not ( = ?auto_693779 ?auto_693790 ) ) ( not ( = ?auto_693779 ?auto_693791 ) ) ( not ( = ?auto_693780 ?auto_693781 ) ) ( not ( = ?auto_693780 ?auto_693782 ) ) ( not ( = ?auto_693780 ?auto_693783 ) ) ( not ( = ?auto_693780 ?auto_693784 ) ) ( not ( = ?auto_693780 ?auto_693785 ) ) ( not ( = ?auto_693780 ?auto_693786 ) ) ( not ( = ?auto_693780 ?auto_693787 ) ) ( not ( = ?auto_693780 ?auto_693788 ) ) ( not ( = ?auto_693780 ?auto_693789 ) ) ( not ( = ?auto_693780 ?auto_693790 ) ) ( not ( = ?auto_693780 ?auto_693791 ) ) ( not ( = ?auto_693781 ?auto_693782 ) ) ( not ( = ?auto_693781 ?auto_693783 ) ) ( not ( = ?auto_693781 ?auto_693784 ) ) ( not ( = ?auto_693781 ?auto_693785 ) ) ( not ( = ?auto_693781 ?auto_693786 ) ) ( not ( = ?auto_693781 ?auto_693787 ) ) ( not ( = ?auto_693781 ?auto_693788 ) ) ( not ( = ?auto_693781 ?auto_693789 ) ) ( not ( = ?auto_693781 ?auto_693790 ) ) ( not ( = ?auto_693781 ?auto_693791 ) ) ( not ( = ?auto_693782 ?auto_693783 ) ) ( not ( = ?auto_693782 ?auto_693784 ) ) ( not ( = ?auto_693782 ?auto_693785 ) ) ( not ( = ?auto_693782 ?auto_693786 ) ) ( not ( = ?auto_693782 ?auto_693787 ) ) ( not ( = ?auto_693782 ?auto_693788 ) ) ( not ( = ?auto_693782 ?auto_693789 ) ) ( not ( = ?auto_693782 ?auto_693790 ) ) ( not ( = ?auto_693782 ?auto_693791 ) ) ( not ( = ?auto_693783 ?auto_693784 ) ) ( not ( = ?auto_693783 ?auto_693785 ) ) ( not ( = ?auto_693783 ?auto_693786 ) ) ( not ( = ?auto_693783 ?auto_693787 ) ) ( not ( = ?auto_693783 ?auto_693788 ) ) ( not ( = ?auto_693783 ?auto_693789 ) ) ( not ( = ?auto_693783 ?auto_693790 ) ) ( not ( = ?auto_693783 ?auto_693791 ) ) ( not ( = ?auto_693784 ?auto_693785 ) ) ( not ( = ?auto_693784 ?auto_693786 ) ) ( not ( = ?auto_693784 ?auto_693787 ) ) ( not ( = ?auto_693784 ?auto_693788 ) ) ( not ( = ?auto_693784 ?auto_693789 ) ) ( not ( = ?auto_693784 ?auto_693790 ) ) ( not ( = ?auto_693784 ?auto_693791 ) ) ( not ( = ?auto_693785 ?auto_693786 ) ) ( not ( = ?auto_693785 ?auto_693787 ) ) ( not ( = ?auto_693785 ?auto_693788 ) ) ( not ( = ?auto_693785 ?auto_693789 ) ) ( not ( = ?auto_693785 ?auto_693790 ) ) ( not ( = ?auto_693785 ?auto_693791 ) ) ( not ( = ?auto_693786 ?auto_693787 ) ) ( not ( = ?auto_693786 ?auto_693788 ) ) ( not ( = ?auto_693786 ?auto_693789 ) ) ( not ( = ?auto_693786 ?auto_693790 ) ) ( not ( = ?auto_693786 ?auto_693791 ) ) ( not ( = ?auto_693787 ?auto_693788 ) ) ( not ( = ?auto_693787 ?auto_693789 ) ) ( not ( = ?auto_693787 ?auto_693790 ) ) ( not ( = ?auto_693787 ?auto_693791 ) ) ( not ( = ?auto_693788 ?auto_693789 ) ) ( not ( = ?auto_693788 ?auto_693790 ) ) ( not ( = ?auto_693788 ?auto_693791 ) ) ( not ( = ?auto_693789 ?auto_693790 ) ) ( not ( = ?auto_693789 ?auto_693791 ) ) ( not ( = ?auto_693790 ?auto_693791 ) ) ( CLEAR ?auto_693788 ) ( ON ?auto_693789 ?auto_693790 ) ( CLEAR ?auto_693789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_693774 ?auto_693775 ?auto_693776 ?auto_693777 ?auto_693778 ?auto_693779 ?auto_693780 ?auto_693781 ?auto_693782 ?auto_693783 ?auto_693784 ?auto_693785 ?auto_693786 ?auto_693787 ?auto_693788 ?auto_693789 )
      ( MAKE-17PILE ?auto_693774 ?auto_693775 ?auto_693776 ?auto_693777 ?auto_693778 ?auto_693779 ?auto_693780 ?auto_693781 ?auto_693782 ?auto_693783 ?auto_693784 ?auto_693785 ?auto_693786 ?auto_693787 ?auto_693788 ?auto_693789 ?auto_693790 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_693809 - BLOCK
      ?auto_693810 - BLOCK
      ?auto_693811 - BLOCK
      ?auto_693812 - BLOCK
      ?auto_693813 - BLOCK
      ?auto_693814 - BLOCK
      ?auto_693815 - BLOCK
      ?auto_693816 - BLOCK
      ?auto_693817 - BLOCK
      ?auto_693818 - BLOCK
      ?auto_693819 - BLOCK
      ?auto_693820 - BLOCK
      ?auto_693821 - BLOCK
      ?auto_693822 - BLOCK
      ?auto_693823 - BLOCK
      ?auto_693824 - BLOCK
      ?auto_693825 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_693825 ) ( ON-TABLE ?auto_693809 ) ( ON ?auto_693810 ?auto_693809 ) ( ON ?auto_693811 ?auto_693810 ) ( ON ?auto_693812 ?auto_693811 ) ( ON ?auto_693813 ?auto_693812 ) ( ON ?auto_693814 ?auto_693813 ) ( ON ?auto_693815 ?auto_693814 ) ( ON ?auto_693816 ?auto_693815 ) ( ON ?auto_693817 ?auto_693816 ) ( ON ?auto_693818 ?auto_693817 ) ( ON ?auto_693819 ?auto_693818 ) ( ON ?auto_693820 ?auto_693819 ) ( ON ?auto_693821 ?auto_693820 ) ( ON ?auto_693822 ?auto_693821 ) ( ON ?auto_693823 ?auto_693822 ) ( not ( = ?auto_693809 ?auto_693810 ) ) ( not ( = ?auto_693809 ?auto_693811 ) ) ( not ( = ?auto_693809 ?auto_693812 ) ) ( not ( = ?auto_693809 ?auto_693813 ) ) ( not ( = ?auto_693809 ?auto_693814 ) ) ( not ( = ?auto_693809 ?auto_693815 ) ) ( not ( = ?auto_693809 ?auto_693816 ) ) ( not ( = ?auto_693809 ?auto_693817 ) ) ( not ( = ?auto_693809 ?auto_693818 ) ) ( not ( = ?auto_693809 ?auto_693819 ) ) ( not ( = ?auto_693809 ?auto_693820 ) ) ( not ( = ?auto_693809 ?auto_693821 ) ) ( not ( = ?auto_693809 ?auto_693822 ) ) ( not ( = ?auto_693809 ?auto_693823 ) ) ( not ( = ?auto_693809 ?auto_693824 ) ) ( not ( = ?auto_693809 ?auto_693825 ) ) ( not ( = ?auto_693810 ?auto_693811 ) ) ( not ( = ?auto_693810 ?auto_693812 ) ) ( not ( = ?auto_693810 ?auto_693813 ) ) ( not ( = ?auto_693810 ?auto_693814 ) ) ( not ( = ?auto_693810 ?auto_693815 ) ) ( not ( = ?auto_693810 ?auto_693816 ) ) ( not ( = ?auto_693810 ?auto_693817 ) ) ( not ( = ?auto_693810 ?auto_693818 ) ) ( not ( = ?auto_693810 ?auto_693819 ) ) ( not ( = ?auto_693810 ?auto_693820 ) ) ( not ( = ?auto_693810 ?auto_693821 ) ) ( not ( = ?auto_693810 ?auto_693822 ) ) ( not ( = ?auto_693810 ?auto_693823 ) ) ( not ( = ?auto_693810 ?auto_693824 ) ) ( not ( = ?auto_693810 ?auto_693825 ) ) ( not ( = ?auto_693811 ?auto_693812 ) ) ( not ( = ?auto_693811 ?auto_693813 ) ) ( not ( = ?auto_693811 ?auto_693814 ) ) ( not ( = ?auto_693811 ?auto_693815 ) ) ( not ( = ?auto_693811 ?auto_693816 ) ) ( not ( = ?auto_693811 ?auto_693817 ) ) ( not ( = ?auto_693811 ?auto_693818 ) ) ( not ( = ?auto_693811 ?auto_693819 ) ) ( not ( = ?auto_693811 ?auto_693820 ) ) ( not ( = ?auto_693811 ?auto_693821 ) ) ( not ( = ?auto_693811 ?auto_693822 ) ) ( not ( = ?auto_693811 ?auto_693823 ) ) ( not ( = ?auto_693811 ?auto_693824 ) ) ( not ( = ?auto_693811 ?auto_693825 ) ) ( not ( = ?auto_693812 ?auto_693813 ) ) ( not ( = ?auto_693812 ?auto_693814 ) ) ( not ( = ?auto_693812 ?auto_693815 ) ) ( not ( = ?auto_693812 ?auto_693816 ) ) ( not ( = ?auto_693812 ?auto_693817 ) ) ( not ( = ?auto_693812 ?auto_693818 ) ) ( not ( = ?auto_693812 ?auto_693819 ) ) ( not ( = ?auto_693812 ?auto_693820 ) ) ( not ( = ?auto_693812 ?auto_693821 ) ) ( not ( = ?auto_693812 ?auto_693822 ) ) ( not ( = ?auto_693812 ?auto_693823 ) ) ( not ( = ?auto_693812 ?auto_693824 ) ) ( not ( = ?auto_693812 ?auto_693825 ) ) ( not ( = ?auto_693813 ?auto_693814 ) ) ( not ( = ?auto_693813 ?auto_693815 ) ) ( not ( = ?auto_693813 ?auto_693816 ) ) ( not ( = ?auto_693813 ?auto_693817 ) ) ( not ( = ?auto_693813 ?auto_693818 ) ) ( not ( = ?auto_693813 ?auto_693819 ) ) ( not ( = ?auto_693813 ?auto_693820 ) ) ( not ( = ?auto_693813 ?auto_693821 ) ) ( not ( = ?auto_693813 ?auto_693822 ) ) ( not ( = ?auto_693813 ?auto_693823 ) ) ( not ( = ?auto_693813 ?auto_693824 ) ) ( not ( = ?auto_693813 ?auto_693825 ) ) ( not ( = ?auto_693814 ?auto_693815 ) ) ( not ( = ?auto_693814 ?auto_693816 ) ) ( not ( = ?auto_693814 ?auto_693817 ) ) ( not ( = ?auto_693814 ?auto_693818 ) ) ( not ( = ?auto_693814 ?auto_693819 ) ) ( not ( = ?auto_693814 ?auto_693820 ) ) ( not ( = ?auto_693814 ?auto_693821 ) ) ( not ( = ?auto_693814 ?auto_693822 ) ) ( not ( = ?auto_693814 ?auto_693823 ) ) ( not ( = ?auto_693814 ?auto_693824 ) ) ( not ( = ?auto_693814 ?auto_693825 ) ) ( not ( = ?auto_693815 ?auto_693816 ) ) ( not ( = ?auto_693815 ?auto_693817 ) ) ( not ( = ?auto_693815 ?auto_693818 ) ) ( not ( = ?auto_693815 ?auto_693819 ) ) ( not ( = ?auto_693815 ?auto_693820 ) ) ( not ( = ?auto_693815 ?auto_693821 ) ) ( not ( = ?auto_693815 ?auto_693822 ) ) ( not ( = ?auto_693815 ?auto_693823 ) ) ( not ( = ?auto_693815 ?auto_693824 ) ) ( not ( = ?auto_693815 ?auto_693825 ) ) ( not ( = ?auto_693816 ?auto_693817 ) ) ( not ( = ?auto_693816 ?auto_693818 ) ) ( not ( = ?auto_693816 ?auto_693819 ) ) ( not ( = ?auto_693816 ?auto_693820 ) ) ( not ( = ?auto_693816 ?auto_693821 ) ) ( not ( = ?auto_693816 ?auto_693822 ) ) ( not ( = ?auto_693816 ?auto_693823 ) ) ( not ( = ?auto_693816 ?auto_693824 ) ) ( not ( = ?auto_693816 ?auto_693825 ) ) ( not ( = ?auto_693817 ?auto_693818 ) ) ( not ( = ?auto_693817 ?auto_693819 ) ) ( not ( = ?auto_693817 ?auto_693820 ) ) ( not ( = ?auto_693817 ?auto_693821 ) ) ( not ( = ?auto_693817 ?auto_693822 ) ) ( not ( = ?auto_693817 ?auto_693823 ) ) ( not ( = ?auto_693817 ?auto_693824 ) ) ( not ( = ?auto_693817 ?auto_693825 ) ) ( not ( = ?auto_693818 ?auto_693819 ) ) ( not ( = ?auto_693818 ?auto_693820 ) ) ( not ( = ?auto_693818 ?auto_693821 ) ) ( not ( = ?auto_693818 ?auto_693822 ) ) ( not ( = ?auto_693818 ?auto_693823 ) ) ( not ( = ?auto_693818 ?auto_693824 ) ) ( not ( = ?auto_693818 ?auto_693825 ) ) ( not ( = ?auto_693819 ?auto_693820 ) ) ( not ( = ?auto_693819 ?auto_693821 ) ) ( not ( = ?auto_693819 ?auto_693822 ) ) ( not ( = ?auto_693819 ?auto_693823 ) ) ( not ( = ?auto_693819 ?auto_693824 ) ) ( not ( = ?auto_693819 ?auto_693825 ) ) ( not ( = ?auto_693820 ?auto_693821 ) ) ( not ( = ?auto_693820 ?auto_693822 ) ) ( not ( = ?auto_693820 ?auto_693823 ) ) ( not ( = ?auto_693820 ?auto_693824 ) ) ( not ( = ?auto_693820 ?auto_693825 ) ) ( not ( = ?auto_693821 ?auto_693822 ) ) ( not ( = ?auto_693821 ?auto_693823 ) ) ( not ( = ?auto_693821 ?auto_693824 ) ) ( not ( = ?auto_693821 ?auto_693825 ) ) ( not ( = ?auto_693822 ?auto_693823 ) ) ( not ( = ?auto_693822 ?auto_693824 ) ) ( not ( = ?auto_693822 ?auto_693825 ) ) ( not ( = ?auto_693823 ?auto_693824 ) ) ( not ( = ?auto_693823 ?auto_693825 ) ) ( not ( = ?auto_693824 ?auto_693825 ) ) ( CLEAR ?auto_693823 ) ( ON ?auto_693824 ?auto_693825 ) ( CLEAR ?auto_693824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_693809 ?auto_693810 ?auto_693811 ?auto_693812 ?auto_693813 ?auto_693814 ?auto_693815 ?auto_693816 ?auto_693817 ?auto_693818 ?auto_693819 ?auto_693820 ?auto_693821 ?auto_693822 ?auto_693823 ?auto_693824 )
      ( MAKE-17PILE ?auto_693809 ?auto_693810 ?auto_693811 ?auto_693812 ?auto_693813 ?auto_693814 ?auto_693815 ?auto_693816 ?auto_693817 ?auto_693818 ?auto_693819 ?auto_693820 ?auto_693821 ?auto_693822 ?auto_693823 ?auto_693824 ?auto_693825 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_693843 - BLOCK
      ?auto_693844 - BLOCK
      ?auto_693845 - BLOCK
      ?auto_693846 - BLOCK
      ?auto_693847 - BLOCK
      ?auto_693848 - BLOCK
      ?auto_693849 - BLOCK
      ?auto_693850 - BLOCK
      ?auto_693851 - BLOCK
      ?auto_693852 - BLOCK
      ?auto_693853 - BLOCK
      ?auto_693854 - BLOCK
      ?auto_693855 - BLOCK
      ?auto_693856 - BLOCK
      ?auto_693857 - BLOCK
      ?auto_693858 - BLOCK
      ?auto_693859 - BLOCK
    )
    :vars
    (
      ?auto_693860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_693859 ?auto_693860 ) ( ON-TABLE ?auto_693843 ) ( ON ?auto_693844 ?auto_693843 ) ( ON ?auto_693845 ?auto_693844 ) ( ON ?auto_693846 ?auto_693845 ) ( ON ?auto_693847 ?auto_693846 ) ( ON ?auto_693848 ?auto_693847 ) ( ON ?auto_693849 ?auto_693848 ) ( ON ?auto_693850 ?auto_693849 ) ( ON ?auto_693851 ?auto_693850 ) ( ON ?auto_693852 ?auto_693851 ) ( ON ?auto_693853 ?auto_693852 ) ( ON ?auto_693854 ?auto_693853 ) ( ON ?auto_693855 ?auto_693854 ) ( ON ?auto_693856 ?auto_693855 ) ( not ( = ?auto_693843 ?auto_693844 ) ) ( not ( = ?auto_693843 ?auto_693845 ) ) ( not ( = ?auto_693843 ?auto_693846 ) ) ( not ( = ?auto_693843 ?auto_693847 ) ) ( not ( = ?auto_693843 ?auto_693848 ) ) ( not ( = ?auto_693843 ?auto_693849 ) ) ( not ( = ?auto_693843 ?auto_693850 ) ) ( not ( = ?auto_693843 ?auto_693851 ) ) ( not ( = ?auto_693843 ?auto_693852 ) ) ( not ( = ?auto_693843 ?auto_693853 ) ) ( not ( = ?auto_693843 ?auto_693854 ) ) ( not ( = ?auto_693843 ?auto_693855 ) ) ( not ( = ?auto_693843 ?auto_693856 ) ) ( not ( = ?auto_693843 ?auto_693857 ) ) ( not ( = ?auto_693843 ?auto_693858 ) ) ( not ( = ?auto_693843 ?auto_693859 ) ) ( not ( = ?auto_693843 ?auto_693860 ) ) ( not ( = ?auto_693844 ?auto_693845 ) ) ( not ( = ?auto_693844 ?auto_693846 ) ) ( not ( = ?auto_693844 ?auto_693847 ) ) ( not ( = ?auto_693844 ?auto_693848 ) ) ( not ( = ?auto_693844 ?auto_693849 ) ) ( not ( = ?auto_693844 ?auto_693850 ) ) ( not ( = ?auto_693844 ?auto_693851 ) ) ( not ( = ?auto_693844 ?auto_693852 ) ) ( not ( = ?auto_693844 ?auto_693853 ) ) ( not ( = ?auto_693844 ?auto_693854 ) ) ( not ( = ?auto_693844 ?auto_693855 ) ) ( not ( = ?auto_693844 ?auto_693856 ) ) ( not ( = ?auto_693844 ?auto_693857 ) ) ( not ( = ?auto_693844 ?auto_693858 ) ) ( not ( = ?auto_693844 ?auto_693859 ) ) ( not ( = ?auto_693844 ?auto_693860 ) ) ( not ( = ?auto_693845 ?auto_693846 ) ) ( not ( = ?auto_693845 ?auto_693847 ) ) ( not ( = ?auto_693845 ?auto_693848 ) ) ( not ( = ?auto_693845 ?auto_693849 ) ) ( not ( = ?auto_693845 ?auto_693850 ) ) ( not ( = ?auto_693845 ?auto_693851 ) ) ( not ( = ?auto_693845 ?auto_693852 ) ) ( not ( = ?auto_693845 ?auto_693853 ) ) ( not ( = ?auto_693845 ?auto_693854 ) ) ( not ( = ?auto_693845 ?auto_693855 ) ) ( not ( = ?auto_693845 ?auto_693856 ) ) ( not ( = ?auto_693845 ?auto_693857 ) ) ( not ( = ?auto_693845 ?auto_693858 ) ) ( not ( = ?auto_693845 ?auto_693859 ) ) ( not ( = ?auto_693845 ?auto_693860 ) ) ( not ( = ?auto_693846 ?auto_693847 ) ) ( not ( = ?auto_693846 ?auto_693848 ) ) ( not ( = ?auto_693846 ?auto_693849 ) ) ( not ( = ?auto_693846 ?auto_693850 ) ) ( not ( = ?auto_693846 ?auto_693851 ) ) ( not ( = ?auto_693846 ?auto_693852 ) ) ( not ( = ?auto_693846 ?auto_693853 ) ) ( not ( = ?auto_693846 ?auto_693854 ) ) ( not ( = ?auto_693846 ?auto_693855 ) ) ( not ( = ?auto_693846 ?auto_693856 ) ) ( not ( = ?auto_693846 ?auto_693857 ) ) ( not ( = ?auto_693846 ?auto_693858 ) ) ( not ( = ?auto_693846 ?auto_693859 ) ) ( not ( = ?auto_693846 ?auto_693860 ) ) ( not ( = ?auto_693847 ?auto_693848 ) ) ( not ( = ?auto_693847 ?auto_693849 ) ) ( not ( = ?auto_693847 ?auto_693850 ) ) ( not ( = ?auto_693847 ?auto_693851 ) ) ( not ( = ?auto_693847 ?auto_693852 ) ) ( not ( = ?auto_693847 ?auto_693853 ) ) ( not ( = ?auto_693847 ?auto_693854 ) ) ( not ( = ?auto_693847 ?auto_693855 ) ) ( not ( = ?auto_693847 ?auto_693856 ) ) ( not ( = ?auto_693847 ?auto_693857 ) ) ( not ( = ?auto_693847 ?auto_693858 ) ) ( not ( = ?auto_693847 ?auto_693859 ) ) ( not ( = ?auto_693847 ?auto_693860 ) ) ( not ( = ?auto_693848 ?auto_693849 ) ) ( not ( = ?auto_693848 ?auto_693850 ) ) ( not ( = ?auto_693848 ?auto_693851 ) ) ( not ( = ?auto_693848 ?auto_693852 ) ) ( not ( = ?auto_693848 ?auto_693853 ) ) ( not ( = ?auto_693848 ?auto_693854 ) ) ( not ( = ?auto_693848 ?auto_693855 ) ) ( not ( = ?auto_693848 ?auto_693856 ) ) ( not ( = ?auto_693848 ?auto_693857 ) ) ( not ( = ?auto_693848 ?auto_693858 ) ) ( not ( = ?auto_693848 ?auto_693859 ) ) ( not ( = ?auto_693848 ?auto_693860 ) ) ( not ( = ?auto_693849 ?auto_693850 ) ) ( not ( = ?auto_693849 ?auto_693851 ) ) ( not ( = ?auto_693849 ?auto_693852 ) ) ( not ( = ?auto_693849 ?auto_693853 ) ) ( not ( = ?auto_693849 ?auto_693854 ) ) ( not ( = ?auto_693849 ?auto_693855 ) ) ( not ( = ?auto_693849 ?auto_693856 ) ) ( not ( = ?auto_693849 ?auto_693857 ) ) ( not ( = ?auto_693849 ?auto_693858 ) ) ( not ( = ?auto_693849 ?auto_693859 ) ) ( not ( = ?auto_693849 ?auto_693860 ) ) ( not ( = ?auto_693850 ?auto_693851 ) ) ( not ( = ?auto_693850 ?auto_693852 ) ) ( not ( = ?auto_693850 ?auto_693853 ) ) ( not ( = ?auto_693850 ?auto_693854 ) ) ( not ( = ?auto_693850 ?auto_693855 ) ) ( not ( = ?auto_693850 ?auto_693856 ) ) ( not ( = ?auto_693850 ?auto_693857 ) ) ( not ( = ?auto_693850 ?auto_693858 ) ) ( not ( = ?auto_693850 ?auto_693859 ) ) ( not ( = ?auto_693850 ?auto_693860 ) ) ( not ( = ?auto_693851 ?auto_693852 ) ) ( not ( = ?auto_693851 ?auto_693853 ) ) ( not ( = ?auto_693851 ?auto_693854 ) ) ( not ( = ?auto_693851 ?auto_693855 ) ) ( not ( = ?auto_693851 ?auto_693856 ) ) ( not ( = ?auto_693851 ?auto_693857 ) ) ( not ( = ?auto_693851 ?auto_693858 ) ) ( not ( = ?auto_693851 ?auto_693859 ) ) ( not ( = ?auto_693851 ?auto_693860 ) ) ( not ( = ?auto_693852 ?auto_693853 ) ) ( not ( = ?auto_693852 ?auto_693854 ) ) ( not ( = ?auto_693852 ?auto_693855 ) ) ( not ( = ?auto_693852 ?auto_693856 ) ) ( not ( = ?auto_693852 ?auto_693857 ) ) ( not ( = ?auto_693852 ?auto_693858 ) ) ( not ( = ?auto_693852 ?auto_693859 ) ) ( not ( = ?auto_693852 ?auto_693860 ) ) ( not ( = ?auto_693853 ?auto_693854 ) ) ( not ( = ?auto_693853 ?auto_693855 ) ) ( not ( = ?auto_693853 ?auto_693856 ) ) ( not ( = ?auto_693853 ?auto_693857 ) ) ( not ( = ?auto_693853 ?auto_693858 ) ) ( not ( = ?auto_693853 ?auto_693859 ) ) ( not ( = ?auto_693853 ?auto_693860 ) ) ( not ( = ?auto_693854 ?auto_693855 ) ) ( not ( = ?auto_693854 ?auto_693856 ) ) ( not ( = ?auto_693854 ?auto_693857 ) ) ( not ( = ?auto_693854 ?auto_693858 ) ) ( not ( = ?auto_693854 ?auto_693859 ) ) ( not ( = ?auto_693854 ?auto_693860 ) ) ( not ( = ?auto_693855 ?auto_693856 ) ) ( not ( = ?auto_693855 ?auto_693857 ) ) ( not ( = ?auto_693855 ?auto_693858 ) ) ( not ( = ?auto_693855 ?auto_693859 ) ) ( not ( = ?auto_693855 ?auto_693860 ) ) ( not ( = ?auto_693856 ?auto_693857 ) ) ( not ( = ?auto_693856 ?auto_693858 ) ) ( not ( = ?auto_693856 ?auto_693859 ) ) ( not ( = ?auto_693856 ?auto_693860 ) ) ( not ( = ?auto_693857 ?auto_693858 ) ) ( not ( = ?auto_693857 ?auto_693859 ) ) ( not ( = ?auto_693857 ?auto_693860 ) ) ( not ( = ?auto_693858 ?auto_693859 ) ) ( not ( = ?auto_693858 ?auto_693860 ) ) ( not ( = ?auto_693859 ?auto_693860 ) ) ( ON ?auto_693858 ?auto_693859 ) ( CLEAR ?auto_693856 ) ( ON ?auto_693857 ?auto_693858 ) ( CLEAR ?auto_693857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_693843 ?auto_693844 ?auto_693845 ?auto_693846 ?auto_693847 ?auto_693848 ?auto_693849 ?auto_693850 ?auto_693851 ?auto_693852 ?auto_693853 ?auto_693854 ?auto_693855 ?auto_693856 ?auto_693857 )
      ( MAKE-17PILE ?auto_693843 ?auto_693844 ?auto_693845 ?auto_693846 ?auto_693847 ?auto_693848 ?auto_693849 ?auto_693850 ?auto_693851 ?auto_693852 ?auto_693853 ?auto_693854 ?auto_693855 ?auto_693856 ?auto_693857 ?auto_693858 ?auto_693859 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_693878 - BLOCK
      ?auto_693879 - BLOCK
      ?auto_693880 - BLOCK
      ?auto_693881 - BLOCK
      ?auto_693882 - BLOCK
      ?auto_693883 - BLOCK
      ?auto_693884 - BLOCK
      ?auto_693885 - BLOCK
      ?auto_693886 - BLOCK
      ?auto_693887 - BLOCK
      ?auto_693888 - BLOCK
      ?auto_693889 - BLOCK
      ?auto_693890 - BLOCK
      ?auto_693891 - BLOCK
      ?auto_693892 - BLOCK
      ?auto_693893 - BLOCK
      ?auto_693894 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_693894 ) ( ON-TABLE ?auto_693878 ) ( ON ?auto_693879 ?auto_693878 ) ( ON ?auto_693880 ?auto_693879 ) ( ON ?auto_693881 ?auto_693880 ) ( ON ?auto_693882 ?auto_693881 ) ( ON ?auto_693883 ?auto_693882 ) ( ON ?auto_693884 ?auto_693883 ) ( ON ?auto_693885 ?auto_693884 ) ( ON ?auto_693886 ?auto_693885 ) ( ON ?auto_693887 ?auto_693886 ) ( ON ?auto_693888 ?auto_693887 ) ( ON ?auto_693889 ?auto_693888 ) ( ON ?auto_693890 ?auto_693889 ) ( ON ?auto_693891 ?auto_693890 ) ( not ( = ?auto_693878 ?auto_693879 ) ) ( not ( = ?auto_693878 ?auto_693880 ) ) ( not ( = ?auto_693878 ?auto_693881 ) ) ( not ( = ?auto_693878 ?auto_693882 ) ) ( not ( = ?auto_693878 ?auto_693883 ) ) ( not ( = ?auto_693878 ?auto_693884 ) ) ( not ( = ?auto_693878 ?auto_693885 ) ) ( not ( = ?auto_693878 ?auto_693886 ) ) ( not ( = ?auto_693878 ?auto_693887 ) ) ( not ( = ?auto_693878 ?auto_693888 ) ) ( not ( = ?auto_693878 ?auto_693889 ) ) ( not ( = ?auto_693878 ?auto_693890 ) ) ( not ( = ?auto_693878 ?auto_693891 ) ) ( not ( = ?auto_693878 ?auto_693892 ) ) ( not ( = ?auto_693878 ?auto_693893 ) ) ( not ( = ?auto_693878 ?auto_693894 ) ) ( not ( = ?auto_693879 ?auto_693880 ) ) ( not ( = ?auto_693879 ?auto_693881 ) ) ( not ( = ?auto_693879 ?auto_693882 ) ) ( not ( = ?auto_693879 ?auto_693883 ) ) ( not ( = ?auto_693879 ?auto_693884 ) ) ( not ( = ?auto_693879 ?auto_693885 ) ) ( not ( = ?auto_693879 ?auto_693886 ) ) ( not ( = ?auto_693879 ?auto_693887 ) ) ( not ( = ?auto_693879 ?auto_693888 ) ) ( not ( = ?auto_693879 ?auto_693889 ) ) ( not ( = ?auto_693879 ?auto_693890 ) ) ( not ( = ?auto_693879 ?auto_693891 ) ) ( not ( = ?auto_693879 ?auto_693892 ) ) ( not ( = ?auto_693879 ?auto_693893 ) ) ( not ( = ?auto_693879 ?auto_693894 ) ) ( not ( = ?auto_693880 ?auto_693881 ) ) ( not ( = ?auto_693880 ?auto_693882 ) ) ( not ( = ?auto_693880 ?auto_693883 ) ) ( not ( = ?auto_693880 ?auto_693884 ) ) ( not ( = ?auto_693880 ?auto_693885 ) ) ( not ( = ?auto_693880 ?auto_693886 ) ) ( not ( = ?auto_693880 ?auto_693887 ) ) ( not ( = ?auto_693880 ?auto_693888 ) ) ( not ( = ?auto_693880 ?auto_693889 ) ) ( not ( = ?auto_693880 ?auto_693890 ) ) ( not ( = ?auto_693880 ?auto_693891 ) ) ( not ( = ?auto_693880 ?auto_693892 ) ) ( not ( = ?auto_693880 ?auto_693893 ) ) ( not ( = ?auto_693880 ?auto_693894 ) ) ( not ( = ?auto_693881 ?auto_693882 ) ) ( not ( = ?auto_693881 ?auto_693883 ) ) ( not ( = ?auto_693881 ?auto_693884 ) ) ( not ( = ?auto_693881 ?auto_693885 ) ) ( not ( = ?auto_693881 ?auto_693886 ) ) ( not ( = ?auto_693881 ?auto_693887 ) ) ( not ( = ?auto_693881 ?auto_693888 ) ) ( not ( = ?auto_693881 ?auto_693889 ) ) ( not ( = ?auto_693881 ?auto_693890 ) ) ( not ( = ?auto_693881 ?auto_693891 ) ) ( not ( = ?auto_693881 ?auto_693892 ) ) ( not ( = ?auto_693881 ?auto_693893 ) ) ( not ( = ?auto_693881 ?auto_693894 ) ) ( not ( = ?auto_693882 ?auto_693883 ) ) ( not ( = ?auto_693882 ?auto_693884 ) ) ( not ( = ?auto_693882 ?auto_693885 ) ) ( not ( = ?auto_693882 ?auto_693886 ) ) ( not ( = ?auto_693882 ?auto_693887 ) ) ( not ( = ?auto_693882 ?auto_693888 ) ) ( not ( = ?auto_693882 ?auto_693889 ) ) ( not ( = ?auto_693882 ?auto_693890 ) ) ( not ( = ?auto_693882 ?auto_693891 ) ) ( not ( = ?auto_693882 ?auto_693892 ) ) ( not ( = ?auto_693882 ?auto_693893 ) ) ( not ( = ?auto_693882 ?auto_693894 ) ) ( not ( = ?auto_693883 ?auto_693884 ) ) ( not ( = ?auto_693883 ?auto_693885 ) ) ( not ( = ?auto_693883 ?auto_693886 ) ) ( not ( = ?auto_693883 ?auto_693887 ) ) ( not ( = ?auto_693883 ?auto_693888 ) ) ( not ( = ?auto_693883 ?auto_693889 ) ) ( not ( = ?auto_693883 ?auto_693890 ) ) ( not ( = ?auto_693883 ?auto_693891 ) ) ( not ( = ?auto_693883 ?auto_693892 ) ) ( not ( = ?auto_693883 ?auto_693893 ) ) ( not ( = ?auto_693883 ?auto_693894 ) ) ( not ( = ?auto_693884 ?auto_693885 ) ) ( not ( = ?auto_693884 ?auto_693886 ) ) ( not ( = ?auto_693884 ?auto_693887 ) ) ( not ( = ?auto_693884 ?auto_693888 ) ) ( not ( = ?auto_693884 ?auto_693889 ) ) ( not ( = ?auto_693884 ?auto_693890 ) ) ( not ( = ?auto_693884 ?auto_693891 ) ) ( not ( = ?auto_693884 ?auto_693892 ) ) ( not ( = ?auto_693884 ?auto_693893 ) ) ( not ( = ?auto_693884 ?auto_693894 ) ) ( not ( = ?auto_693885 ?auto_693886 ) ) ( not ( = ?auto_693885 ?auto_693887 ) ) ( not ( = ?auto_693885 ?auto_693888 ) ) ( not ( = ?auto_693885 ?auto_693889 ) ) ( not ( = ?auto_693885 ?auto_693890 ) ) ( not ( = ?auto_693885 ?auto_693891 ) ) ( not ( = ?auto_693885 ?auto_693892 ) ) ( not ( = ?auto_693885 ?auto_693893 ) ) ( not ( = ?auto_693885 ?auto_693894 ) ) ( not ( = ?auto_693886 ?auto_693887 ) ) ( not ( = ?auto_693886 ?auto_693888 ) ) ( not ( = ?auto_693886 ?auto_693889 ) ) ( not ( = ?auto_693886 ?auto_693890 ) ) ( not ( = ?auto_693886 ?auto_693891 ) ) ( not ( = ?auto_693886 ?auto_693892 ) ) ( not ( = ?auto_693886 ?auto_693893 ) ) ( not ( = ?auto_693886 ?auto_693894 ) ) ( not ( = ?auto_693887 ?auto_693888 ) ) ( not ( = ?auto_693887 ?auto_693889 ) ) ( not ( = ?auto_693887 ?auto_693890 ) ) ( not ( = ?auto_693887 ?auto_693891 ) ) ( not ( = ?auto_693887 ?auto_693892 ) ) ( not ( = ?auto_693887 ?auto_693893 ) ) ( not ( = ?auto_693887 ?auto_693894 ) ) ( not ( = ?auto_693888 ?auto_693889 ) ) ( not ( = ?auto_693888 ?auto_693890 ) ) ( not ( = ?auto_693888 ?auto_693891 ) ) ( not ( = ?auto_693888 ?auto_693892 ) ) ( not ( = ?auto_693888 ?auto_693893 ) ) ( not ( = ?auto_693888 ?auto_693894 ) ) ( not ( = ?auto_693889 ?auto_693890 ) ) ( not ( = ?auto_693889 ?auto_693891 ) ) ( not ( = ?auto_693889 ?auto_693892 ) ) ( not ( = ?auto_693889 ?auto_693893 ) ) ( not ( = ?auto_693889 ?auto_693894 ) ) ( not ( = ?auto_693890 ?auto_693891 ) ) ( not ( = ?auto_693890 ?auto_693892 ) ) ( not ( = ?auto_693890 ?auto_693893 ) ) ( not ( = ?auto_693890 ?auto_693894 ) ) ( not ( = ?auto_693891 ?auto_693892 ) ) ( not ( = ?auto_693891 ?auto_693893 ) ) ( not ( = ?auto_693891 ?auto_693894 ) ) ( not ( = ?auto_693892 ?auto_693893 ) ) ( not ( = ?auto_693892 ?auto_693894 ) ) ( not ( = ?auto_693893 ?auto_693894 ) ) ( ON ?auto_693893 ?auto_693894 ) ( CLEAR ?auto_693891 ) ( ON ?auto_693892 ?auto_693893 ) ( CLEAR ?auto_693892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_693878 ?auto_693879 ?auto_693880 ?auto_693881 ?auto_693882 ?auto_693883 ?auto_693884 ?auto_693885 ?auto_693886 ?auto_693887 ?auto_693888 ?auto_693889 ?auto_693890 ?auto_693891 ?auto_693892 )
      ( MAKE-17PILE ?auto_693878 ?auto_693879 ?auto_693880 ?auto_693881 ?auto_693882 ?auto_693883 ?auto_693884 ?auto_693885 ?auto_693886 ?auto_693887 ?auto_693888 ?auto_693889 ?auto_693890 ?auto_693891 ?auto_693892 ?auto_693893 ?auto_693894 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_693912 - BLOCK
      ?auto_693913 - BLOCK
      ?auto_693914 - BLOCK
      ?auto_693915 - BLOCK
      ?auto_693916 - BLOCK
      ?auto_693917 - BLOCK
      ?auto_693918 - BLOCK
      ?auto_693919 - BLOCK
      ?auto_693920 - BLOCK
      ?auto_693921 - BLOCK
      ?auto_693922 - BLOCK
      ?auto_693923 - BLOCK
      ?auto_693924 - BLOCK
      ?auto_693925 - BLOCK
      ?auto_693926 - BLOCK
      ?auto_693927 - BLOCK
      ?auto_693928 - BLOCK
    )
    :vars
    (
      ?auto_693929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_693928 ?auto_693929 ) ( ON-TABLE ?auto_693912 ) ( ON ?auto_693913 ?auto_693912 ) ( ON ?auto_693914 ?auto_693913 ) ( ON ?auto_693915 ?auto_693914 ) ( ON ?auto_693916 ?auto_693915 ) ( ON ?auto_693917 ?auto_693916 ) ( ON ?auto_693918 ?auto_693917 ) ( ON ?auto_693919 ?auto_693918 ) ( ON ?auto_693920 ?auto_693919 ) ( ON ?auto_693921 ?auto_693920 ) ( ON ?auto_693922 ?auto_693921 ) ( ON ?auto_693923 ?auto_693922 ) ( ON ?auto_693924 ?auto_693923 ) ( not ( = ?auto_693912 ?auto_693913 ) ) ( not ( = ?auto_693912 ?auto_693914 ) ) ( not ( = ?auto_693912 ?auto_693915 ) ) ( not ( = ?auto_693912 ?auto_693916 ) ) ( not ( = ?auto_693912 ?auto_693917 ) ) ( not ( = ?auto_693912 ?auto_693918 ) ) ( not ( = ?auto_693912 ?auto_693919 ) ) ( not ( = ?auto_693912 ?auto_693920 ) ) ( not ( = ?auto_693912 ?auto_693921 ) ) ( not ( = ?auto_693912 ?auto_693922 ) ) ( not ( = ?auto_693912 ?auto_693923 ) ) ( not ( = ?auto_693912 ?auto_693924 ) ) ( not ( = ?auto_693912 ?auto_693925 ) ) ( not ( = ?auto_693912 ?auto_693926 ) ) ( not ( = ?auto_693912 ?auto_693927 ) ) ( not ( = ?auto_693912 ?auto_693928 ) ) ( not ( = ?auto_693912 ?auto_693929 ) ) ( not ( = ?auto_693913 ?auto_693914 ) ) ( not ( = ?auto_693913 ?auto_693915 ) ) ( not ( = ?auto_693913 ?auto_693916 ) ) ( not ( = ?auto_693913 ?auto_693917 ) ) ( not ( = ?auto_693913 ?auto_693918 ) ) ( not ( = ?auto_693913 ?auto_693919 ) ) ( not ( = ?auto_693913 ?auto_693920 ) ) ( not ( = ?auto_693913 ?auto_693921 ) ) ( not ( = ?auto_693913 ?auto_693922 ) ) ( not ( = ?auto_693913 ?auto_693923 ) ) ( not ( = ?auto_693913 ?auto_693924 ) ) ( not ( = ?auto_693913 ?auto_693925 ) ) ( not ( = ?auto_693913 ?auto_693926 ) ) ( not ( = ?auto_693913 ?auto_693927 ) ) ( not ( = ?auto_693913 ?auto_693928 ) ) ( not ( = ?auto_693913 ?auto_693929 ) ) ( not ( = ?auto_693914 ?auto_693915 ) ) ( not ( = ?auto_693914 ?auto_693916 ) ) ( not ( = ?auto_693914 ?auto_693917 ) ) ( not ( = ?auto_693914 ?auto_693918 ) ) ( not ( = ?auto_693914 ?auto_693919 ) ) ( not ( = ?auto_693914 ?auto_693920 ) ) ( not ( = ?auto_693914 ?auto_693921 ) ) ( not ( = ?auto_693914 ?auto_693922 ) ) ( not ( = ?auto_693914 ?auto_693923 ) ) ( not ( = ?auto_693914 ?auto_693924 ) ) ( not ( = ?auto_693914 ?auto_693925 ) ) ( not ( = ?auto_693914 ?auto_693926 ) ) ( not ( = ?auto_693914 ?auto_693927 ) ) ( not ( = ?auto_693914 ?auto_693928 ) ) ( not ( = ?auto_693914 ?auto_693929 ) ) ( not ( = ?auto_693915 ?auto_693916 ) ) ( not ( = ?auto_693915 ?auto_693917 ) ) ( not ( = ?auto_693915 ?auto_693918 ) ) ( not ( = ?auto_693915 ?auto_693919 ) ) ( not ( = ?auto_693915 ?auto_693920 ) ) ( not ( = ?auto_693915 ?auto_693921 ) ) ( not ( = ?auto_693915 ?auto_693922 ) ) ( not ( = ?auto_693915 ?auto_693923 ) ) ( not ( = ?auto_693915 ?auto_693924 ) ) ( not ( = ?auto_693915 ?auto_693925 ) ) ( not ( = ?auto_693915 ?auto_693926 ) ) ( not ( = ?auto_693915 ?auto_693927 ) ) ( not ( = ?auto_693915 ?auto_693928 ) ) ( not ( = ?auto_693915 ?auto_693929 ) ) ( not ( = ?auto_693916 ?auto_693917 ) ) ( not ( = ?auto_693916 ?auto_693918 ) ) ( not ( = ?auto_693916 ?auto_693919 ) ) ( not ( = ?auto_693916 ?auto_693920 ) ) ( not ( = ?auto_693916 ?auto_693921 ) ) ( not ( = ?auto_693916 ?auto_693922 ) ) ( not ( = ?auto_693916 ?auto_693923 ) ) ( not ( = ?auto_693916 ?auto_693924 ) ) ( not ( = ?auto_693916 ?auto_693925 ) ) ( not ( = ?auto_693916 ?auto_693926 ) ) ( not ( = ?auto_693916 ?auto_693927 ) ) ( not ( = ?auto_693916 ?auto_693928 ) ) ( not ( = ?auto_693916 ?auto_693929 ) ) ( not ( = ?auto_693917 ?auto_693918 ) ) ( not ( = ?auto_693917 ?auto_693919 ) ) ( not ( = ?auto_693917 ?auto_693920 ) ) ( not ( = ?auto_693917 ?auto_693921 ) ) ( not ( = ?auto_693917 ?auto_693922 ) ) ( not ( = ?auto_693917 ?auto_693923 ) ) ( not ( = ?auto_693917 ?auto_693924 ) ) ( not ( = ?auto_693917 ?auto_693925 ) ) ( not ( = ?auto_693917 ?auto_693926 ) ) ( not ( = ?auto_693917 ?auto_693927 ) ) ( not ( = ?auto_693917 ?auto_693928 ) ) ( not ( = ?auto_693917 ?auto_693929 ) ) ( not ( = ?auto_693918 ?auto_693919 ) ) ( not ( = ?auto_693918 ?auto_693920 ) ) ( not ( = ?auto_693918 ?auto_693921 ) ) ( not ( = ?auto_693918 ?auto_693922 ) ) ( not ( = ?auto_693918 ?auto_693923 ) ) ( not ( = ?auto_693918 ?auto_693924 ) ) ( not ( = ?auto_693918 ?auto_693925 ) ) ( not ( = ?auto_693918 ?auto_693926 ) ) ( not ( = ?auto_693918 ?auto_693927 ) ) ( not ( = ?auto_693918 ?auto_693928 ) ) ( not ( = ?auto_693918 ?auto_693929 ) ) ( not ( = ?auto_693919 ?auto_693920 ) ) ( not ( = ?auto_693919 ?auto_693921 ) ) ( not ( = ?auto_693919 ?auto_693922 ) ) ( not ( = ?auto_693919 ?auto_693923 ) ) ( not ( = ?auto_693919 ?auto_693924 ) ) ( not ( = ?auto_693919 ?auto_693925 ) ) ( not ( = ?auto_693919 ?auto_693926 ) ) ( not ( = ?auto_693919 ?auto_693927 ) ) ( not ( = ?auto_693919 ?auto_693928 ) ) ( not ( = ?auto_693919 ?auto_693929 ) ) ( not ( = ?auto_693920 ?auto_693921 ) ) ( not ( = ?auto_693920 ?auto_693922 ) ) ( not ( = ?auto_693920 ?auto_693923 ) ) ( not ( = ?auto_693920 ?auto_693924 ) ) ( not ( = ?auto_693920 ?auto_693925 ) ) ( not ( = ?auto_693920 ?auto_693926 ) ) ( not ( = ?auto_693920 ?auto_693927 ) ) ( not ( = ?auto_693920 ?auto_693928 ) ) ( not ( = ?auto_693920 ?auto_693929 ) ) ( not ( = ?auto_693921 ?auto_693922 ) ) ( not ( = ?auto_693921 ?auto_693923 ) ) ( not ( = ?auto_693921 ?auto_693924 ) ) ( not ( = ?auto_693921 ?auto_693925 ) ) ( not ( = ?auto_693921 ?auto_693926 ) ) ( not ( = ?auto_693921 ?auto_693927 ) ) ( not ( = ?auto_693921 ?auto_693928 ) ) ( not ( = ?auto_693921 ?auto_693929 ) ) ( not ( = ?auto_693922 ?auto_693923 ) ) ( not ( = ?auto_693922 ?auto_693924 ) ) ( not ( = ?auto_693922 ?auto_693925 ) ) ( not ( = ?auto_693922 ?auto_693926 ) ) ( not ( = ?auto_693922 ?auto_693927 ) ) ( not ( = ?auto_693922 ?auto_693928 ) ) ( not ( = ?auto_693922 ?auto_693929 ) ) ( not ( = ?auto_693923 ?auto_693924 ) ) ( not ( = ?auto_693923 ?auto_693925 ) ) ( not ( = ?auto_693923 ?auto_693926 ) ) ( not ( = ?auto_693923 ?auto_693927 ) ) ( not ( = ?auto_693923 ?auto_693928 ) ) ( not ( = ?auto_693923 ?auto_693929 ) ) ( not ( = ?auto_693924 ?auto_693925 ) ) ( not ( = ?auto_693924 ?auto_693926 ) ) ( not ( = ?auto_693924 ?auto_693927 ) ) ( not ( = ?auto_693924 ?auto_693928 ) ) ( not ( = ?auto_693924 ?auto_693929 ) ) ( not ( = ?auto_693925 ?auto_693926 ) ) ( not ( = ?auto_693925 ?auto_693927 ) ) ( not ( = ?auto_693925 ?auto_693928 ) ) ( not ( = ?auto_693925 ?auto_693929 ) ) ( not ( = ?auto_693926 ?auto_693927 ) ) ( not ( = ?auto_693926 ?auto_693928 ) ) ( not ( = ?auto_693926 ?auto_693929 ) ) ( not ( = ?auto_693927 ?auto_693928 ) ) ( not ( = ?auto_693927 ?auto_693929 ) ) ( not ( = ?auto_693928 ?auto_693929 ) ) ( ON ?auto_693927 ?auto_693928 ) ( ON ?auto_693926 ?auto_693927 ) ( CLEAR ?auto_693924 ) ( ON ?auto_693925 ?auto_693926 ) ( CLEAR ?auto_693925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_693912 ?auto_693913 ?auto_693914 ?auto_693915 ?auto_693916 ?auto_693917 ?auto_693918 ?auto_693919 ?auto_693920 ?auto_693921 ?auto_693922 ?auto_693923 ?auto_693924 ?auto_693925 )
      ( MAKE-17PILE ?auto_693912 ?auto_693913 ?auto_693914 ?auto_693915 ?auto_693916 ?auto_693917 ?auto_693918 ?auto_693919 ?auto_693920 ?auto_693921 ?auto_693922 ?auto_693923 ?auto_693924 ?auto_693925 ?auto_693926 ?auto_693927 ?auto_693928 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_693947 - BLOCK
      ?auto_693948 - BLOCK
      ?auto_693949 - BLOCK
      ?auto_693950 - BLOCK
      ?auto_693951 - BLOCK
      ?auto_693952 - BLOCK
      ?auto_693953 - BLOCK
      ?auto_693954 - BLOCK
      ?auto_693955 - BLOCK
      ?auto_693956 - BLOCK
      ?auto_693957 - BLOCK
      ?auto_693958 - BLOCK
      ?auto_693959 - BLOCK
      ?auto_693960 - BLOCK
      ?auto_693961 - BLOCK
      ?auto_693962 - BLOCK
      ?auto_693963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_693963 ) ( ON-TABLE ?auto_693947 ) ( ON ?auto_693948 ?auto_693947 ) ( ON ?auto_693949 ?auto_693948 ) ( ON ?auto_693950 ?auto_693949 ) ( ON ?auto_693951 ?auto_693950 ) ( ON ?auto_693952 ?auto_693951 ) ( ON ?auto_693953 ?auto_693952 ) ( ON ?auto_693954 ?auto_693953 ) ( ON ?auto_693955 ?auto_693954 ) ( ON ?auto_693956 ?auto_693955 ) ( ON ?auto_693957 ?auto_693956 ) ( ON ?auto_693958 ?auto_693957 ) ( ON ?auto_693959 ?auto_693958 ) ( not ( = ?auto_693947 ?auto_693948 ) ) ( not ( = ?auto_693947 ?auto_693949 ) ) ( not ( = ?auto_693947 ?auto_693950 ) ) ( not ( = ?auto_693947 ?auto_693951 ) ) ( not ( = ?auto_693947 ?auto_693952 ) ) ( not ( = ?auto_693947 ?auto_693953 ) ) ( not ( = ?auto_693947 ?auto_693954 ) ) ( not ( = ?auto_693947 ?auto_693955 ) ) ( not ( = ?auto_693947 ?auto_693956 ) ) ( not ( = ?auto_693947 ?auto_693957 ) ) ( not ( = ?auto_693947 ?auto_693958 ) ) ( not ( = ?auto_693947 ?auto_693959 ) ) ( not ( = ?auto_693947 ?auto_693960 ) ) ( not ( = ?auto_693947 ?auto_693961 ) ) ( not ( = ?auto_693947 ?auto_693962 ) ) ( not ( = ?auto_693947 ?auto_693963 ) ) ( not ( = ?auto_693948 ?auto_693949 ) ) ( not ( = ?auto_693948 ?auto_693950 ) ) ( not ( = ?auto_693948 ?auto_693951 ) ) ( not ( = ?auto_693948 ?auto_693952 ) ) ( not ( = ?auto_693948 ?auto_693953 ) ) ( not ( = ?auto_693948 ?auto_693954 ) ) ( not ( = ?auto_693948 ?auto_693955 ) ) ( not ( = ?auto_693948 ?auto_693956 ) ) ( not ( = ?auto_693948 ?auto_693957 ) ) ( not ( = ?auto_693948 ?auto_693958 ) ) ( not ( = ?auto_693948 ?auto_693959 ) ) ( not ( = ?auto_693948 ?auto_693960 ) ) ( not ( = ?auto_693948 ?auto_693961 ) ) ( not ( = ?auto_693948 ?auto_693962 ) ) ( not ( = ?auto_693948 ?auto_693963 ) ) ( not ( = ?auto_693949 ?auto_693950 ) ) ( not ( = ?auto_693949 ?auto_693951 ) ) ( not ( = ?auto_693949 ?auto_693952 ) ) ( not ( = ?auto_693949 ?auto_693953 ) ) ( not ( = ?auto_693949 ?auto_693954 ) ) ( not ( = ?auto_693949 ?auto_693955 ) ) ( not ( = ?auto_693949 ?auto_693956 ) ) ( not ( = ?auto_693949 ?auto_693957 ) ) ( not ( = ?auto_693949 ?auto_693958 ) ) ( not ( = ?auto_693949 ?auto_693959 ) ) ( not ( = ?auto_693949 ?auto_693960 ) ) ( not ( = ?auto_693949 ?auto_693961 ) ) ( not ( = ?auto_693949 ?auto_693962 ) ) ( not ( = ?auto_693949 ?auto_693963 ) ) ( not ( = ?auto_693950 ?auto_693951 ) ) ( not ( = ?auto_693950 ?auto_693952 ) ) ( not ( = ?auto_693950 ?auto_693953 ) ) ( not ( = ?auto_693950 ?auto_693954 ) ) ( not ( = ?auto_693950 ?auto_693955 ) ) ( not ( = ?auto_693950 ?auto_693956 ) ) ( not ( = ?auto_693950 ?auto_693957 ) ) ( not ( = ?auto_693950 ?auto_693958 ) ) ( not ( = ?auto_693950 ?auto_693959 ) ) ( not ( = ?auto_693950 ?auto_693960 ) ) ( not ( = ?auto_693950 ?auto_693961 ) ) ( not ( = ?auto_693950 ?auto_693962 ) ) ( not ( = ?auto_693950 ?auto_693963 ) ) ( not ( = ?auto_693951 ?auto_693952 ) ) ( not ( = ?auto_693951 ?auto_693953 ) ) ( not ( = ?auto_693951 ?auto_693954 ) ) ( not ( = ?auto_693951 ?auto_693955 ) ) ( not ( = ?auto_693951 ?auto_693956 ) ) ( not ( = ?auto_693951 ?auto_693957 ) ) ( not ( = ?auto_693951 ?auto_693958 ) ) ( not ( = ?auto_693951 ?auto_693959 ) ) ( not ( = ?auto_693951 ?auto_693960 ) ) ( not ( = ?auto_693951 ?auto_693961 ) ) ( not ( = ?auto_693951 ?auto_693962 ) ) ( not ( = ?auto_693951 ?auto_693963 ) ) ( not ( = ?auto_693952 ?auto_693953 ) ) ( not ( = ?auto_693952 ?auto_693954 ) ) ( not ( = ?auto_693952 ?auto_693955 ) ) ( not ( = ?auto_693952 ?auto_693956 ) ) ( not ( = ?auto_693952 ?auto_693957 ) ) ( not ( = ?auto_693952 ?auto_693958 ) ) ( not ( = ?auto_693952 ?auto_693959 ) ) ( not ( = ?auto_693952 ?auto_693960 ) ) ( not ( = ?auto_693952 ?auto_693961 ) ) ( not ( = ?auto_693952 ?auto_693962 ) ) ( not ( = ?auto_693952 ?auto_693963 ) ) ( not ( = ?auto_693953 ?auto_693954 ) ) ( not ( = ?auto_693953 ?auto_693955 ) ) ( not ( = ?auto_693953 ?auto_693956 ) ) ( not ( = ?auto_693953 ?auto_693957 ) ) ( not ( = ?auto_693953 ?auto_693958 ) ) ( not ( = ?auto_693953 ?auto_693959 ) ) ( not ( = ?auto_693953 ?auto_693960 ) ) ( not ( = ?auto_693953 ?auto_693961 ) ) ( not ( = ?auto_693953 ?auto_693962 ) ) ( not ( = ?auto_693953 ?auto_693963 ) ) ( not ( = ?auto_693954 ?auto_693955 ) ) ( not ( = ?auto_693954 ?auto_693956 ) ) ( not ( = ?auto_693954 ?auto_693957 ) ) ( not ( = ?auto_693954 ?auto_693958 ) ) ( not ( = ?auto_693954 ?auto_693959 ) ) ( not ( = ?auto_693954 ?auto_693960 ) ) ( not ( = ?auto_693954 ?auto_693961 ) ) ( not ( = ?auto_693954 ?auto_693962 ) ) ( not ( = ?auto_693954 ?auto_693963 ) ) ( not ( = ?auto_693955 ?auto_693956 ) ) ( not ( = ?auto_693955 ?auto_693957 ) ) ( not ( = ?auto_693955 ?auto_693958 ) ) ( not ( = ?auto_693955 ?auto_693959 ) ) ( not ( = ?auto_693955 ?auto_693960 ) ) ( not ( = ?auto_693955 ?auto_693961 ) ) ( not ( = ?auto_693955 ?auto_693962 ) ) ( not ( = ?auto_693955 ?auto_693963 ) ) ( not ( = ?auto_693956 ?auto_693957 ) ) ( not ( = ?auto_693956 ?auto_693958 ) ) ( not ( = ?auto_693956 ?auto_693959 ) ) ( not ( = ?auto_693956 ?auto_693960 ) ) ( not ( = ?auto_693956 ?auto_693961 ) ) ( not ( = ?auto_693956 ?auto_693962 ) ) ( not ( = ?auto_693956 ?auto_693963 ) ) ( not ( = ?auto_693957 ?auto_693958 ) ) ( not ( = ?auto_693957 ?auto_693959 ) ) ( not ( = ?auto_693957 ?auto_693960 ) ) ( not ( = ?auto_693957 ?auto_693961 ) ) ( not ( = ?auto_693957 ?auto_693962 ) ) ( not ( = ?auto_693957 ?auto_693963 ) ) ( not ( = ?auto_693958 ?auto_693959 ) ) ( not ( = ?auto_693958 ?auto_693960 ) ) ( not ( = ?auto_693958 ?auto_693961 ) ) ( not ( = ?auto_693958 ?auto_693962 ) ) ( not ( = ?auto_693958 ?auto_693963 ) ) ( not ( = ?auto_693959 ?auto_693960 ) ) ( not ( = ?auto_693959 ?auto_693961 ) ) ( not ( = ?auto_693959 ?auto_693962 ) ) ( not ( = ?auto_693959 ?auto_693963 ) ) ( not ( = ?auto_693960 ?auto_693961 ) ) ( not ( = ?auto_693960 ?auto_693962 ) ) ( not ( = ?auto_693960 ?auto_693963 ) ) ( not ( = ?auto_693961 ?auto_693962 ) ) ( not ( = ?auto_693961 ?auto_693963 ) ) ( not ( = ?auto_693962 ?auto_693963 ) ) ( ON ?auto_693962 ?auto_693963 ) ( ON ?auto_693961 ?auto_693962 ) ( CLEAR ?auto_693959 ) ( ON ?auto_693960 ?auto_693961 ) ( CLEAR ?auto_693960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_693947 ?auto_693948 ?auto_693949 ?auto_693950 ?auto_693951 ?auto_693952 ?auto_693953 ?auto_693954 ?auto_693955 ?auto_693956 ?auto_693957 ?auto_693958 ?auto_693959 ?auto_693960 )
      ( MAKE-17PILE ?auto_693947 ?auto_693948 ?auto_693949 ?auto_693950 ?auto_693951 ?auto_693952 ?auto_693953 ?auto_693954 ?auto_693955 ?auto_693956 ?auto_693957 ?auto_693958 ?auto_693959 ?auto_693960 ?auto_693961 ?auto_693962 ?auto_693963 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_693981 - BLOCK
      ?auto_693982 - BLOCK
      ?auto_693983 - BLOCK
      ?auto_693984 - BLOCK
      ?auto_693985 - BLOCK
      ?auto_693986 - BLOCK
      ?auto_693987 - BLOCK
      ?auto_693988 - BLOCK
      ?auto_693989 - BLOCK
      ?auto_693990 - BLOCK
      ?auto_693991 - BLOCK
      ?auto_693992 - BLOCK
      ?auto_693993 - BLOCK
      ?auto_693994 - BLOCK
      ?auto_693995 - BLOCK
      ?auto_693996 - BLOCK
      ?auto_693997 - BLOCK
    )
    :vars
    (
      ?auto_693998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_693997 ?auto_693998 ) ( ON-TABLE ?auto_693981 ) ( ON ?auto_693982 ?auto_693981 ) ( ON ?auto_693983 ?auto_693982 ) ( ON ?auto_693984 ?auto_693983 ) ( ON ?auto_693985 ?auto_693984 ) ( ON ?auto_693986 ?auto_693985 ) ( ON ?auto_693987 ?auto_693986 ) ( ON ?auto_693988 ?auto_693987 ) ( ON ?auto_693989 ?auto_693988 ) ( ON ?auto_693990 ?auto_693989 ) ( ON ?auto_693991 ?auto_693990 ) ( ON ?auto_693992 ?auto_693991 ) ( not ( = ?auto_693981 ?auto_693982 ) ) ( not ( = ?auto_693981 ?auto_693983 ) ) ( not ( = ?auto_693981 ?auto_693984 ) ) ( not ( = ?auto_693981 ?auto_693985 ) ) ( not ( = ?auto_693981 ?auto_693986 ) ) ( not ( = ?auto_693981 ?auto_693987 ) ) ( not ( = ?auto_693981 ?auto_693988 ) ) ( not ( = ?auto_693981 ?auto_693989 ) ) ( not ( = ?auto_693981 ?auto_693990 ) ) ( not ( = ?auto_693981 ?auto_693991 ) ) ( not ( = ?auto_693981 ?auto_693992 ) ) ( not ( = ?auto_693981 ?auto_693993 ) ) ( not ( = ?auto_693981 ?auto_693994 ) ) ( not ( = ?auto_693981 ?auto_693995 ) ) ( not ( = ?auto_693981 ?auto_693996 ) ) ( not ( = ?auto_693981 ?auto_693997 ) ) ( not ( = ?auto_693981 ?auto_693998 ) ) ( not ( = ?auto_693982 ?auto_693983 ) ) ( not ( = ?auto_693982 ?auto_693984 ) ) ( not ( = ?auto_693982 ?auto_693985 ) ) ( not ( = ?auto_693982 ?auto_693986 ) ) ( not ( = ?auto_693982 ?auto_693987 ) ) ( not ( = ?auto_693982 ?auto_693988 ) ) ( not ( = ?auto_693982 ?auto_693989 ) ) ( not ( = ?auto_693982 ?auto_693990 ) ) ( not ( = ?auto_693982 ?auto_693991 ) ) ( not ( = ?auto_693982 ?auto_693992 ) ) ( not ( = ?auto_693982 ?auto_693993 ) ) ( not ( = ?auto_693982 ?auto_693994 ) ) ( not ( = ?auto_693982 ?auto_693995 ) ) ( not ( = ?auto_693982 ?auto_693996 ) ) ( not ( = ?auto_693982 ?auto_693997 ) ) ( not ( = ?auto_693982 ?auto_693998 ) ) ( not ( = ?auto_693983 ?auto_693984 ) ) ( not ( = ?auto_693983 ?auto_693985 ) ) ( not ( = ?auto_693983 ?auto_693986 ) ) ( not ( = ?auto_693983 ?auto_693987 ) ) ( not ( = ?auto_693983 ?auto_693988 ) ) ( not ( = ?auto_693983 ?auto_693989 ) ) ( not ( = ?auto_693983 ?auto_693990 ) ) ( not ( = ?auto_693983 ?auto_693991 ) ) ( not ( = ?auto_693983 ?auto_693992 ) ) ( not ( = ?auto_693983 ?auto_693993 ) ) ( not ( = ?auto_693983 ?auto_693994 ) ) ( not ( = ?auto_693983 ?auto_693995 ) ) ( not ( = ?auto_693983 ?auto_693996 ) ) ( not ( = ?auto_693983 ?auto_693997 ) ) ( not ( = ?auto_693983 ?auto_693998 ) ) ( not ( = ?auto_693984 ?auto_693985 ) ) ( not ( = ?auto_693984 ?auto_693986 ) ) ( not ( = ?auto_693984 ?auto_693987 ) ) ( not ( = ?auto_693984 ?auto_693988 ) ) ( not ( = ?auto_693984 ?auto_693989 ) ) ( not ( = ?auto_693984 ?auto_693990 ) ) ( not ( = ?auto_693984 ?auto_693991 ) ) ( not ( = ?auto_693984 ?auto_693992 ) ) ( not ( = ?auto_693984 ?auto_693993 ) ) ( not ( = ?auto_693984 ?auto_693994 ) ) ( not ( = ?auto_693984 ?auto_693995 ) ) ( not ( = ?auto_693984 ?auto_693996 ) ) ( not ( = ?auto_693984 ?auto_693997 ) ) ( not ( = ?auto_693984 ?auto_693998 ) ) ( not ( = ?auto_693985 ?auto_693986 ) ) ( not ( = ?auto_693985 ?auto_693987 ) ) ( not ( = ?auto_693985 ?auto_693988 ) ) ( not ( = ?auto_693985 ?auto_693989 ) ) ( not ( = ?auto_693985 ?auto_693990 ) ) ( not ( = ?auto_693985 ?auto_693991 ) ) ( not ( = ?auto_693985 ?auto_693992 ) ) ( not ( = ?auto_693985 ?auto_693993 ) ) ( not ( = ?auto_693985 ?auto_693994 ) ) ( not ( = ?auto_693985 ?auto_693995 ) ) ( not ( = ?auto_693985 ?auto_693996 ) ) ( not ( = ?auto_693985 ?auto_693997 ) ) ( not ( = ?auto_693985 ?auto_693998 ) ) ( not ( = ?auto_693986 ?auto_693987 ) ) ( not ( = ?auto_693986 ?auto_693988 ) ) ( not ( = ?auto_693986 ?auto_693989 ) ) ( not ( = ?auto_693986 ?auto_693990 ) ) ( not ( = ?auto_693986 ?auto_693991 ) ) ( not ( = ?auto_693986 ?auto_693992 ) ) ( not ( = ?auto_693986 ?auto_693993 ) ) ( not ( = ?auto_693986 ?auto_693994 ) ) ( not ( = ?auto_693986 ?auto_693995 ) ) ( not ( = ?auto_693986 ?auto_693996 ) ) ( not ( = ?auto_693986 ?auto_693997 ) ) ( not ( = ?auto_693986 ?auto_693998 ) ) ( not ( = ?auto_693987 ?auto_693988 ) ) ( not ( = ?auto_693987 ?auto_693989 ) ) ( not ( = ?auto_693987 ?auto_693990 ) ) ( not ( = ?auto_693987 ?auto_693991 ) ) ( not ( = ?auto_693987 ?auto_693992 ) ) ( not ( = ?auto_693987 ?auto_693993 ) ) ( not ( = ?auto_693987 ?auto_693994 ) ) ( not ( = ?auto_693987 ?auto_693995 ) ) ( not ( = ?auto_693987 ?auto_693996 ) ) ( not ( = ?auto_693987 ?auto_693997 ) ) ( not ( = ?auto_693987 ?auto_693998 ) ) ( not ( = ?auto_693988 ?auto_693989 ) ) ( not ( = ?auto_693988 ?auto_693990 ) ) ( not ( = ?auto_693988 ?auto_693991 ) ) ( not ( = ?auto_693988 ?auto_693992 ) ) ( not ( = ?auto_693988 ?auto_693993 ) ) ( not ( = ?auto_693988 ?auto_693994 ) ) ( not ( = ?auto_693988 ?auto_693995 ) ) ( not ( = ?auto_693988 ?auto_693996 ) ) ( not ( = ?auto_693988 ?auto_693997 ) ) ( not ( = ?auto_693988 ?auto_693998 ) ) ( not ( = ?auto_693989 ?auto_693990 ) ) ( not ( = ?auto_693989 ?auto_693991 ) ) ( not ( = ?auto_693989 ?auto_693992 ) ) ( not ( = ?auto_693989 ?auto_693993 ) ) ( not ( = ?auto_693989 ?auto_693994 ) ) ( not ( = ?auto_693989 ?auto_693995 ) ) ( not ( = ?auto_693989 ?auto_693996 ) ) ( not ( = ?auto_693989 ?auto_693997 ) ) ( not ( = ?auto_693989 ?auto_693998 ) ) ( not ( = ?auto_693990 ?auto_693991 ) ) ( not ( = ?auto_693990 ?auto_693992 ) ) ( not ( = ?auto_693990 ?auto_693993 ) ) ( not ( = ?auto_693990 ?auto_693994 ) ) ( not ( = ?auto_693990 ?auto_693995 ) ) ( not ( = ?auto_693990 ?auto_693996 ) ) ( not ( = ?auto_693990 ?auto_693997 ) ) ( not ( = ?auto_693990 ?auto_693998 ) ) ( not ( = ?auto_693991 ?auto_693992 ) ) ( not ( = ?auto_693991 ?auto_693993 ) ) ( not ( = ?auto_693991 ?auto_693994 ) ) ( not ( = ?auto_693991 ?auto_693995 ) ) ( not ( = ?auto_693991 ?auto_693996 ) ) ( not ( = ?auto_693991 ?auto_693997 ) ) ( not ( = ?auto_693991 ?auto_693998 ) ) ( not ( = ?auto_693992 ?auto_693993 ) ) ( not ( = ?auto_693992 ?auto_693994 ) ) ( not ( = ?auto_693992 ?auto_693995 ) ) ( not ( = ?auto_693992 ?auto_693996 ) ) ( not ( = ?auto_693992 ?auto_693997 ) ) ( not ( = ?auto_693992 ?auto_693998 ) ) ( not ( = ?auto_693993 ?auto_693994 ) ) ( not ( = ?auto_693993 ?auto_693995 ) ) ( not ( = ?auto_693993 ?auto_693996 ) ) ( not ( = ?auto_693993 ?auto_693997 ) ) ( not ( = ?auto_693993 ?auto_693998 ) ) ( not ( = ?auto_693994 ?auto_693995 ) ) ( not ( = ?auto_693994 ?auto_693996 ) ) ( not ( = ?auto_693994 ?auto_693997 ) ) ( not ( = ?auto_693994 ?auto_693998 ) ) ( not ( = ?auto_693995 ?auto_693996 ) ) ( not ( = ?auto_693995 ?auto_693997 ) ) ( not ( = ?auto_693995 ?auto_693998 ) ) ( not ( = ?auto_693996 ?auto_693997 ) ) ( not ( = ?auto_693996 ?auto_693998 ) ) ( not ( = ?auto_693997 ?auto_693998 ) ) ( ON ?auto_693996 ?auto_693997 ) ( ON ?auto_693995 ?auto_693996 ) ( ON ?auto_693994 ?auto_693995 ) ( CLEAR ?auto_693992 ) ( ON ?auto_693993 ?auto_693994 ) ( CLEAR ?auto_693993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_693981 ?auto_693982 ?auto_693983 ?auto_693984 ?auto_693985 ?auto_693986 ?auto_693987 ?auto_693988 ?auto_693989 ?auto_693990 ?auto_693991 ?auto_693992 ?auto_693993 )
      ( MAKE-17PILE ?auto_693981 ?auto_693982 ?auto_693983 ?auto_693984 ?auto_693985 ?auto_693986 ?auto_693987 ?auto_693988 ?auto_693989 ?auto_693990 ?auto_693991 ?auto_693992 ?auto_693993 ?auto_693994 ?auto_693995 ?auto_693996 ?auto_693997 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694016 - BLOCK
      ?auto_694017 - BLOCK
      ?auto_694018 - BLOCK
      ?auto_694019 - BLOCK
      ?auto_694020 - BLOCK
      ?auto_694021 - BLOCK
      ?auto_694022 - BLOCK
      ?auto_694023 - BLOCK
      ?auto_694024 - BLOCK
      ?auto_694025 - BLOCK
      ?auto_694026 - BLOCK
      ?auto_694027 - BLOCK
      ?auto_694028 - BLOCK
      ?auto_694029 - BLOCK
      ?auto_694030 - BLOCK
      ?auto_694031 - BLOCK
      ?auto_694032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_694032 ) ( ON-TABLE ?auto_694016 ) ( ON ?auto_694017 ?auto_694016 ) ( ON ?auto_694018 ?auto_694017 ) ( ON ?auto_694019 ?auto_694018 ) ( ON ?auto_694020 ?auto_694019 ) ( ON ?auto_694021 ?auto_694020 ) ( ON ?auto_694022 ?auto_694021 ) ( ON ?auto_694023 ?auto_694022 ) ( ON ?auto_694024 ?auto_694023 ) ( ON ?auto_694025 ?auto_694024 ) ( ON ?auto_694026 ?auto_694025 ) ( ON ?auto_694027 ?auto_694026 ) ( not ( = ?auto_694016 ?auto_694017 ) ) ( not ( = ?auto_694016 ?auto_694018 ) ) ( not ( = ?auto_694016 ?auto_694019 ) ) ( not ( = ?auto_694016 ?auto_694020 ) ) ( not ( = ?auto_694016 ?auto_694021 ) ) ( not ( = ?auto_694016 ?auto_694022 ) ) ( not ( = ?auto_694016 ?auto_694023 ) ) ( not ( = ?auto_694016 ?auto_694024 ) ) ( not ( = ?auto_694016 ?auto_694025 ) ) ( not ( = ?auto_694016 ?auto_694026 ) ) ( not ( = ?auto_694016 ?auto_694027 ) ) ( not ( = ?auto_694016 ?auto_694028 ) ) ( not ( = ?auto_694016 ?auto_694029 ) ) ( not ( = ?auto_694016 ?auto_694030 ) ) ( not ( = ?auto_694016 ?auto_694031 ) ) ( not ( = ?auto_694016 ?auto_694032 ) ) ( not ( = ?auto_694017 ?auto_694018 ) ) ( not ( = ?auto_694017 ?auto_694019 ) ) ( not ( = ?auto_694017 ?auto_694020 ) ) ( not ( = ?auto_694017 ?auto_694021 ) ) ( not ( = ?auto_694017 ?auto_694022 ) ) ( not ( = ?auto_694017 ?auto_694023 ) ) ( not ( = ?auto_694017 ?auto_694024 ) ) ( not ( = ?auto_694017 ?auto_694025 ) ) ( not ( = ?auto_694017 ?auto_694026 ) ) ( not ( = ?auto_694017 ?auto_694027 ) ) ( not ( = ?auto_694017 ?auto_694028 ) ) ( not ( = ?auto_694017 ?auto_694029 ) ) ( not ( = ?auto_694017 ?auto_694030 ) ) ( not ( = ?auto_694017 ?auto_694031 ) ) ( not ( = ?auto_694017 ?auto_694032 ) ) ( not ( = ?auto_694018 ?auto_694019 ) ) ( not ( = ?auto_694018 ?auto_694020 ) ) ( not ( = ?auto_694018 ?auto_694021 ) ) ( not ( = ?auto_694018 ?auto_694022 ) ) ( not ( = ?auto_694018 ?auto_694023 ) ) ( not ( = ?auto_694018 ?auto_694024 ) ) ( not ( = ?auto_694018 ?auto_694025 ) ) ( not ( = ?auto_694018 ?auto_694026 ) ) ( not ( = ?auto_694018 ?auto_694027 ) ) ( not ( = ?auto_694018 ?auto_694028 ) ) ( not ( = ?auto_694018 ?auto_694029 ) ) ( not ( = ?auto_694018 ?auto_694030 ) ) ( not ( = ?auto_694018 ?auto_694031 ) ) ( not ( = ?auto_694018 ?auto_694032 ) ) ( not ( = ?auto_694019 ?auto_694020 ) ) ( not ( = ?auto_694019 ?auto_694021 ) ) ( not ( = ?auto_694019 ?auto_694022 ) ) ( not ( = ?auto_694019 ?auto_694023 ) ) ( not ( = ?auto_694019 ?auto_694024 ) ) ( not ( = ?auto_694019 ?auto_694025 ) ) ( not ( = ?auto_694019 ?auto_694026 ) ) ( not ( = ?auto_694019 ?auto_694027 ) ) ( not ( = ?auto_694019 ?auto_694028 ) ) ( not ( = ?auto_694019 ?auto_694029 ) ) ( not ( = ?auto_694019 ?auto_694030 ) ) ( not ( = ?auto_694019 ?auto_694031 ) ) ( not ( = ?auto_694019 ?auto_694032 ) ) ( not ( = ?auto_694020 ?auto_694021 ) ) ( not ( = ?auto_694020 ?auto_694022 ) ) ( not ( = ?auto_694020 ?auto_694023 ) ) ( not ( = ?auto_694020 ?auto_694024 ) ) ( not ( = ?auto_694020 ?auto_694025 ) ) ( not ( = ?auto_694020 ?auto_694026 ) ) ( not ( = ?auto_694020 ?auto_694027 ) ) ( not ( = ?auto_694020 ?auto_694028 ) ) ( not ( = ?auto_694020 ?auto_694029 ) ) ( not ( = ?auto_694020 ?auto_694030 ) ) ( not ( = ?auto_694020 ?auto_694031 ) ) ( not ( = ?auto_694020 ?auto_694032 ) ) ( not ( = ?auto_694021 ?auto_694022 ) ) ( not ( = ?auto_694021 ?auto_694023 ) ) ( not ( = ?auto_694021 ?auto_694024 ) ) ( not ( = ?auto_694021 ?auto_694025 ) ) ( not ( = ?auto_694021 ?auto_694026 ) ) ( not ( = ?auto_694021 ?auto_694027 ) ) ( not ( = ?auto_694021 ?auto_694028 ) ) ( not ( = ?auto_694021 ?auto_694029 ) ) ( not ( = ?auto_694021 ?auto_694030 ) ) ( not ( = ?auto_694021 ?auto_694031 ) ) ( not ( = ?auto_694021 ?auto_694032 ) ) ( not ( = ?auto_694022 ?auto_694023 ) ) ( not ( = ?auto_694022 ?auto_694024 ) ) ( not ( = ?auto_694022 ?auto_694025 ) ) ( not ( = ?auto_694022 ?auto_694026 ) ) ( not ( = ?auto_694022 ?auto_694027 ) ) ( not ( = ?auto_694022 ?auto_694028 ) ) ( not ( = ?auto_694022 ?auto_694029 ) ) ( not ( = ?auto_694022 ?auto_694030 ) ) ( not ( = ?auto_694022 ?auto_694031 ) ) ( not ( = ?auto_694022 ?auto_694032 ) ) ( not ( = ?auto_694023 ?auto_694024 ) ) ( not ( = ?auto_694023 ?auto_694025 ) ) ( not ( = ?auto_694023 ?auto_694026 ) ) ( not ( = ?auto_694023 ?auto_694027 ) ) ( not ( = ?auto_694023 ?auto_694028 ) ) ( not ( = ?auto_694023 ?auto_694029 ) ) ( not ( = ?auto_694023 ?auto_694030 ) ) ( not ( = ?auto_694023 ?auto_694031 ) ) ( not ( = ?auto_694023 ?auto_694032 ) ) ( not ( = ?auto_694024 ?auto_694025 ) ) ( not ( = ?auto_694024 ?auto_694026 ) ) ( not ( = ?auto_694024 ?auto_694027 ) ) ( not ( = ?auto_694024 ?auto_694028 ) ) ( not ( = ?auto_694024 ?auto_694029 ) ) ( not ( = ?auto_694024 ?auto_694030 ) ) ( not ( = ?auto_694024 ?auto_694031 ) ) ( not ( = ?auto_694024 ?auto_694032 ) ) ( not ( = ?auto_694025 ?auto_694026 ) ) ( not ( = ?auto_694025 ?auto_694027 ) ) ( not ( = ?auto_694025 ?auto_694028 ) ) ( not ( = ?auto_694025 ?auto_694029 ) ) ( not ( = ?auto_694025 ?auto_694030 ) ) ( not ( = ?auto_694025 ?auto_694031 ) ) ( not ( = ?auto_694025 ?auto_694032 ) ) ( not ( = ?auto_694026 ?auto_694027 ) ) ( not ( = ?auto_694026 ?auto_694028 ) ) ( not ( = ?auto_694026 ?auto_694029 ) ) ( not ( = ?auto_694026 ?auto_694030 ) ) ( not ( = ?auto_694026 ?auto_694031 ) ) ( not ( = ?auto_694026 ?auto_694032 ) ) ( not ( = ?auto_694027 ?auto_694028 ) ) ( not ( = ?auto_694027 ?auto_694029 ) ) ( not ( = ?auto_694027 ?auto_694030 ) ) ( not ( = ?auto_694027 ?auto_694031 ) ) ( not ( = ?auto_694027 ?auto_694032 ) ) ( not ( = ?auto_694028 ?auto_694029 ) ) ( not ( = ?auto_694028 ?auto_694030 ) ) ( not ( = ?auto_694028 ?auto_694031 ) ) ( not ( = ?auto_694028 ?auto_694032 ) ) ( not ( = ?auto_694029 ?auto_694030 ) ) ( not ( = ?auto_694029 ?auto_694031 ) ) ( not ( = ?auto_694029 ?auto_694032 ) ) ( not ( = ?auto_694030 ?auto_694031 ) ) ( not ( = ?auto_694030 ?auto_694032 ) ) ( not ( = ?auto_694031 ?auto_694032 ) ) ( ON ?auto_694031 ?auto_694032 ) ( ON ?auto_694030 ?auto_694031 ) ( ON ?auto_694029 ?auto_694030 ) ( CLEAR ?auto_694027 ) ( ON ?auto_694028 ?auto_694029 ) ( CLEAR ?auto_694028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_694016 ?auto_694017 ?auto_694018 ?auto_694019 ?auto_694020 ?auto_694021 ?auto_694022 ?auto_694023 ?auto_694024 ?auto_694025 ?auto_694026 ?auto_694027 ?auto_694028 )
      ( MAKE-17PILE ?auto_694016 ?auto_694017 ?auto_694018 ?auto_694019 ?auto_694020 ?auto_694021 ?auto_694022 ?auto_694023 ?auto_694024 ?auto_694025 ?auto_694026 ?auto_694027 ?auto_694028 ?auto_694029 ?auto_694030 ?auto_694031 ?auto_694032 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694050 - BLOCK
      ?auto_694051 - BLOCK
      ?auto_694052 - BLOCK
      ?auto_694053 - BLOCK
      ?auto_694054 - BLOCK
      ?auto_694055 - BLOCK
      ?auto_694056 - BLOCK
      ?auto_694057 - BLOCK
      ?auto_694058 - BLOCK
      ?auto_694059 - BLOCK
      ?auto_694060 - BLOCK
      ?auto_694061 - BLOCK
      ?auto_694062 - BLOCK
      ?auto_694063 - BLOCK
      ?auto_694064 - BLOCK
      ?auto_694065 - BLOCK
      ?auto_694066 - BLOCK
    )
    :vars
    (
      ?auto_694067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694066 ?auto_694067 ) ( ON-TABLE ?auto_694050 ) ( ON ?auto_694051 ?auto_694050 ) ( ON ?auto_694052 ?auto_694051 ) ( ON ?auto_694053 ?auto_694052 ) ( ON ?auto_694054 ?auto_694053 ) ( ON ?auto_694055 ?auto_694054 ) ( ON ?auto_694056 ?auto_694055 ) ( ON ?auto_694057 ?auto_694056 ) ( ON ?auto_694058 ?auto_694057 ) ( ON ?auto_694059 ?auto_694058 ) ( ON ?auto_694060 ?auto_694059 ) ( not ( = ?auto_694050 ?auto_694051 ) ) ( not ( = ?auto_694050 ?auto_694052 ) ) ( not ( = ?auto_694050 ?auto_694053 ) ) ( not ( = ?auto_694050 ?auto_694054 ) ) ( not ( = ?auto_694050 ?auto_694055 ) ) ( not ( = ?auto_694050 ?auto_694056 ) ) ( not ( = ?auto_694050 ?auto_694057 ) ) ( not ( = ?auto_694050 ?auto_694058 ) ) ( not ( = ?auto_694050 ?auto_694059 ) ) ( not ( = ?auto_694050 ?auto_694060 ) ) ( not ( = ?auto_694050 ?auto_694061 ) ) ( not ( = ?auto_694050 ?auto_694062 ) ) ( not ( = ?auto_694050 ?auto_694063 ) ) ( not ( = ?auto_694050 ?auto_694064 ) ) ( not ( = ?auto_694050 ?auto_694065 ) ) ( not ( = ?auto_694050 ?auto_694066 ) ) ( not ( = ?auto_694050 ?auto_694067 ) ) ( not ( = ?auto_694051 ?auto_694052 ) ) ( not ( = ?auto_694051 ?auto_694053 ) ) ( not ( = ?auto_694051 ?auto_694054 ) ) ( not ( = ?auto_694051 ?auto_694055 ) ) ( not ( = ?auto_694051 ?auto_694056 ) ) ( not ( = ?auto_694051 ?auto_694057 ) ) ( not ( = ?auto_694051 ?auto_694058 ) ) ( not ( = ?auto_694051 ?auto_694059 ) ) ( not ( = ?auto_694051 ?auto_694060 ) ) ( not ( = ?auto_694051 ?auto_694061 ) ) ( not ( = ?auto_694051 ?auto_694062 ) ) ( not ( = ?auto_694051 ?auto_694063 ) ) ( not ( = ?auto_694051 ?auto_694064 ) ) ( not ( = ?auto_694051 ?auto_694065 ) ) ( not ( = ?auto_694051 ?auto_694066 ) ) ( not ( = ?auto_694051 ?auto_694067 ) ) ( not ( = ?auto_694052 ?auto_694053 ) ) ( not ( = ?auto_694052 ?auto_694054 ) ) ( not ( = ?auto_694052 ?auto_694055 ) ) ( not ( = ?auto_694052 ?auto_694056 ) ) ( not ( = ?auto_694052 ?auto_694057 ) ) ( not ( = ?auto_694052 ?auto_694058 ) ) ( not ( = ?auto_694052 ?auto_694059 ) ) ( not ( = ?auto_694052 ?auto_694060 ) ) ( not ( = ?auto_694052 ?auto_694061 ) ) ( not ( = ?auto_694052 ?auto_694062 ) ) ( not ( = ?auto_694052 ?auto_694063 ) ) ( not ( = ?auto_694052 ?auto_694064 ) ) ( not ( = ?auto_694052 ?auto_694065 ) ) ( not ( = ?auto_694052 ?auto_694066 ) ) ( not ( = ?auto_694052 ?auto_694067 ) ) ( not ( = ?auto_694053 ?auto_694054 ) ) ( not ( = ?auto_694053 ?auto_694055 ) ) ( not ( = ?auto_694053 ?auto_694056 ) ) ( not ( = ?auto_694053 ?auto_694057 ) ) ( not ( = ?auto_694053 ?auto_694058 ) ) ( not ( = ?auto_694053 ?auto_694059 ) ) ( not ( = ?auto_694053 ?auto_694060 ) ) ( not ( = ?auto_694053 ?auto_694061 ) ) ( not ( = ?auto_694053 ?auto_694062 ) ) ( not ( = ?auto_694053 ?auto_694063 ) ) ( not ( = ?auto_694053 ?auto_694064 ) ) ( not ( = ?auto_694053 ?auto_694065 ) ) ( not ( = ?auto_694053 ?auto_694066 ) ) ( not ( = ?auto_694053 ?auto_694067 ) ) ( not ( = ?auto_694054 ?auto_694055 ) ) ( not ( = ?auto_694054 ?auto_694056 ) ) ( not ( = ?auto_694054 ?auto_694057 ) ) ( not ( = ?auto_694054 ?auto_694058 ) ) ( not ( = ?auto_694054 ?auto_694059 ) ) ( not ( = ?auto_694054 ?auto_694060 ) ) ( not ( = ?auto_694054 ?auto_694061 ) ) ( not ( = ?auto_694054 ?auto_694062 ) ) ( not ( = ?auto_694054 ?auto_694063 ) ) ( not ( = ?auto_694054 ?auto_694064 ) ) ( not ( = ?auto_694054 ?auto_694065 ) ) ( not ( = ?auto_694054 ?auto_694066 ) ) ( not ( = ?auto_694054 ?auto_694067 ) ) ( not ( = ?auto_694055 ?auto_694056 ) ) ( not ( = ?auto_694055 ?auto_694057 ) ) ( not ( = ?auto_694055 ?auto_694058 ) ) ( not ( = ?auto_694055 ?auto_694059 ) ) ( not ( = ?auto_694055 ?auto_694060 ) ) ( not ( = ?auto_694055 ?auto_694061 ) ) ( not ( = ?auto_694055 ?auto_694062 ) ) ( not ( = ?auto_694055 ?auto_694063 ) ) ( not ( = ?auto_694055 ?auto_694064 ) ) ( not ( = ?auto_694055 ?auto_694065 ) ) ( not ( = ?auto_694055 ?auto_694066 ) ) ( not ( = ?auto_694055 ?auto_694067 ) ) ( not ( = ?auto_694056 ?auto_694057 ) ) ( not ( = ?auto_694056 ?auto_694058 ) ) ( not ( = ?auto_694056 ?auto_694059 ) ) ( not ( = ?auto_694056 ?auto_694060 ) ) ( not ( = ?auto_694056 ?auto_694061 ) ) ( not ( = ?auto_694056 ?auto_694062 ) ) ( not ( = ?auto_694056 ?auto_694063 ) ) ( not ( = ?auto_694056 ?auto_694064 ) ) ( not ( = ?auto_694056 ?auto_694065 ) ) ( not ( = ?auto_694056 ?auto_694066 ) ) ( not ( = ?auto_694056 ?auto_694067 ) ) ( not ( = ?auto_694057 ?auto_694058 ) ) ( not ( = ?auto_694057 ?auto_694059 ) ) ( not ( = ?auto_694057 ?auto_694060 ) ) ( not ( = ?auto_694057 ?auto_694061 ) ) ( not ( = ?auto_694057 ?auto_694062 ) ) ( not ( = ?auto_694057 ?auto_694063 ) ) ( not ( = ?auto_694057 ?auto_694064 ) ) ( not ( = ?auto_694057 ?auto_694065 ) ) ( not ( = ?auto_694057 ?auto_694066 ) ) ( not ( = ?auto_694057 ?auto_694067 ) ) ( not ( = ?auto_694058 ?auto_694059 ) ) ( not ( = ?auto_694058 ?auto_694060 ) ) ( not ( = ?auto_694058 ?auto_694061 ) ) ( not ( = ?auto_694058 ?auto_694062 ) ) ( not ( = ?auto_694058 ?auto_694063 ) ) ( not ( = ?auto_694058 ?auto_694064 ) ) ( not ( = ?auto_694058 ?auto_694065 ) ) ( not ( = ?auto_694058 ?auto_694066 ) ) ( not ( = ?auto_694058 ?auto_694067 ) ) ( not ( = ?auto_694059 ?auto_694060 ) ) ( not ( = ?auto_694059 ?auto_694061 ) ) ( not ( = ?auto_694059 ?auto_694062 ) ) ( not ( = ?auto_694059 ?auto_694063 ) ) ( not ( = ?auto_694059 ?auto_694064 ) ) ( not ( = ?auto_694059 ?auto_694065 ) ) ( not ( = ?auto_694059 ?auto_694066 ) ) ( not ( = ?auto_694059 ?auto_694067 ) ) ( not ( = ?auto_694060 ?auto_694061 ) ) ( not ( = ?auto_694060 ?auto_694062 ) ) ( not ( = ?auto_694060 ?auto_694063 ) ) ( not ( = ?auto_694060 ?auto_694064 ) ) ( not ( = ?auto_694060 ?auto_694065 ) ) ( not ( = ?auto_694060 ?auto_694066 ) ) ( not ( = ?auto_694060 ?auto_694067 ) ) ( not ( = ?auto_694061 ?auto_694062 ) ) ( not ( = ?auto_694061 ?auto_694063 ) ) ( not ( = ?auto_694061 ?auto_694064 ) ) ( not ( = ?auto_694061 ?auto_694065 ) ) ( not ( = ?auto_694061 ?auto_694066 ) ) ( not ( = ?auto_694061 ?auto_694067 ) ) ( not ( = ?auto_694062 ?auto_694063 ) ) ( not ( = ?auto_694062 ?auto_694064 ) ) ( not ( = ?auto_694062 ?auto_694065 ) ) ( not ( = ?auto_694062 ?auto_694066 ) ) ( not ( = ?auto_694062 ?auto_694067 ) ) ( not ( = ?auto_694063 ?auto_694064 ) ) ( not ( = ?auto_694063 ?auto_694065 ) ) ( not ( = ?auto_694063 ?auto_694066 ) ) ( not ( = ?auto_694063 ?auto_694067 ) ) ( not ( = ?auto_694064 ?auto_694065 ) ) ( not ( = ?auto_694064 ?auto_694066 ) ) ( not ( = ?auto_694064 ?auto_694067 ) ) ( not ( = ?auto_694065 ?auto_694066 ) ) ( not ( = ?auto_694065 ?auto_694067 ) ) ( not ( = ?auto_694066 ?auto_694067 ) ) ( ON ?auto_694065 ?auto_694066 ) ( ON ?auto_694064 ?auto_694065 ) ( ON ?auto_694063 ?auto_694064 ) ( ON ?auto_694062 ?auto_694063 ) ( CLEAR ?auto_694060 ) ( ON ?auto_694061 ?auto_694062 ) ( CLEAR ?auto_694061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_694050 ?auto_694051 ?auto_694052 ?auto_694053 ?auto_694054 ?auto_694055 ?auto_694056 ?auto_694057 ?auto_694058 ?auto_694059 ?auto_694060 ?auto_694061 )
      ( MAKE-17PILE ?auto_694050 ?auto_694051 ?auto_694052 ?auto_694053 ?auto_694054 ?auto_694055 ?auto_694056 ?auto_694057 ?auto_694058 ?auto_694059 ?auto_694060 ?auto_694061 ?auto_694062 ?auto_694063 ?auto_694064 ?auto_694065 ?auto_694066 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694085 - BLOCK
      ?auto_694086 - BLOCK
      ?auto_694087 - BLOCK
      ?auto_694088 - BLOCK
      ?auto_694089 - BLOCK
      ?auto_694090 - BLOCK
      ?auto_694091 - BLOCK
      ?auto_694092 - BLOCK
      ?auto_694093 - BLOCK
      ?auto_694094 - BLOCK
      ?auto_694095 - BLOCK
      ?auto_694096 - BLOCK
      ?auto_694097 - BLOCK
      ?auto_694098 - BLOCK
      ?auto_694099 - BLOCK
      ?auto_694100 - BLOCK
      ?auto_694101 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_694101 ) ( ON-TABLE ?auto_694085 ) ( ON ?auto_694086 ?auto_694085 ) ( ON ?auto_694087 ?auto_694086 ) ( ON ?auto_694088 ?auto_694087 ) ( ON ?auto_694089 ?auto_694088 ) ( ON ?auto_694090 ?auto_694089 ) ( ON ?auto_694091 ?auto_694090 ) ( ON ?auto_694092 ?auto_694091 ) ( ON ?auto_694093 ?auto_694092 ) ( ON ?auto_694094 ?auto_694093 ) ( ON ?auto_694095 ?auto_694094 ) ( not ( = ?auto_694085 ?auto_694086 ) ) ( not ( = ?auto_694085 ?auto_694087 ) ) ( not ( = ?auto_694085 ?auto_694088 ) ) ( not ( = ?auto_694085 ?auto_694089 ) ) ( not ( = ?auto_694085 ?auto_694090 ) ) ( not ( = ?auto_694085 ?auto_694091 ) ) ( not ( = ?auto_694085 ?auto_694092 ) ) ( not ( = ?auto_694085 ?auto_694093 ) ) ( not ( = ?auto_694085 ?auto_694094 ) ) ( not ( = ?auto_694085 ?auto_694095 ) ) ( not ( = ?auto_694085 ?auto_694096 ) ) ( not ( = ?auto_694085 ?auto_694097 ) ) ( not ( = ?auto_694085 ?auto_694098 ) ) ( not ( = ?auto_694085 ?auto_694099 ) ) ( not ( = ?auto_694085 ?auto_694100 ) ) ( not ( = ?auto_694085 ?auto_694101 ) ) ( not ( = ?auto_694086 ?auto_694087 ) ) ( not ( = ?auto_694086 ?auto_694088 ) ) ( not ( = ?auto_694086 ?auto_694089 ) ) ( not ( = ?auto_694086 ?auto_694090 ) ) ( not ( = ?auto_694086 ?auto_694091 ) ) ( not ( = ?auto_694086 ?auto_694092 ) ) ( not ( = ?auto_694086 ?auto_694093 ) ) ( not ( = ?auto_694086 ?auto_694094 ) ) ( not ( = ?auto_694086 ?auto_694095 ) ) ( not ( = ?auto_694086 ?auto_694096 ) ) ( not ( = ?auto_694086 ?auto_694097 ) ) ( not ( = ?auto_694086 ?auto_694098 ) ) ( not ( = ?auto_694086 ?auto_694099 ) ) ( not ( = ?auto_694086 ?auto_694100 ) ) ( not ( = ?auto_694086 ?auto_694101 ) ) ( not ( = ?auto_694087 ?auto_694088 ) ) ( not ( = ?auto_694087 ?auto_694089 ) ) ( not ( = ?auto_694087 ?auto_694090 ) ) ( not ( = ?auto_694087 ?auto_694091 ) ) ( not ( = ?auto_694087 ?auto_694092 ) ) ( not ( = ?auto_694087 ?auto_694093 ) ) ( not ( = ?auto_694087 ?auto_694094 ) ) ( not ( = ?auto_694087 ?auto_694095 ) ) ( not ( = ?auto_694087 ?auto_694096 ) ) ( not ( = ?auto_694087 ?auto_694097 ) ) ( not ( = ?auto_694087 ?auto_694098 ) ) ( not ( = ?auto_694087 ?auto_694099 ) ) ( not ( = ?auto_694087 ?auto_694100 ) ) ( not ( = ?auto_694087 ?auto_694101 ) ) ( not ( = ?auto_694088 ?auto_694089 ) ) ( not ( = ?auto_694088 ?auto_694090 ) ) ( not ( = ?auto_694088 ?auto_694091 ) ) ( not ( = ?auto_694088 ?auto_694092 ) ) ( not ( = ?auto_694088 ?auto_694093 ) ) ( not ( = ?auto_694088 ?auto_694094 ) ) ( not ( = ?auto_694088 ?auto_694095 ) ) ( not ( = ?auto_694088 ?auto_694096 ) ) ( not ( = ?auto_694088 ?auto_694097 ) ) ( not ( = ?auto_694088 ?auto_694098 ) ) ( not ( = ?auto_694088 ?auto_694099 ) ) ( not ( = ?auto_694088 ?auto_694100 ) ) ( not ( = ?auto_694088 ?auto_694101 ) ) ( not ( = ?auto_694089 ?auto_694090 ) ) ( not ( = ?auto_694089 ?auto_694091 ) ) ( not ( = ?auto_694089 ?auto_694092 ) ) ( not ( = ?auto_694089 ?auto_694093 ) ) ( not ( = ?auto_694089 ?auto_694094 ) ) ( not ( = ?auto_694089 ?auto_694095 ) ) ( not ( = ?auto_694089 ?auto_694096 ) ) ( not ( = ?auto_694089 ?auto_694097 ) ) ( not ( = ?auto_694089 ?auto_694098 ) ) ( not ( = ?auto_694089 ?auto_694099 ) ) ( not ( = ?auto_694089 ?auto_694100 ) ) ( not ( = ?auto_694089 ?auto_694101 ) ) ( not ( = ?auto_694090 ?auto_694091 ) ) ( not ( = ?auto_694090 ?auto_694092 ) ) ( not ( = ?auto_694090 ?auto_694093 ) ) ( not ( = ?auto_694090 ?auto_694094 ) ) ( not ( = ?auto_694090 ?auto_694095 ) ) ( not ( = ?auto_694090 ?auto_694096 ) ) ( not ( = ?auto_694090 ?auto_694097 ) ) ( not ( = ?auto_694090 ?auto_694098 ) ) ( not ( = ?auto_694090 ?auto_694099 ) ) ( not ( = ?auto_694090 ?auto_694100 ) ) ( not ( = ?auto_694090 ?auto_694101 ) ) ( not ( = ?auto_694091 ?auto_694092 ) ) ( not ( = ?auto_694091 ?auto_694093 ) ) ( not ( = ?auto_694091 ?auto_694094 ) ) ( not ( = ?auto_694091 ?auto_694095 ) ) ( not ( = ?auto_694091 ?auto_694096 ) ) ( not ( = ?auto_694091 ?auto_694097 ) ) ( not ( = ?auto_694091 ?auto_694098 ) ) ( not ( = ?auto_694091 ?auto_694099 ) ) ( not ( = ?auto_694091 ?auto_694100 ) ) ( not ( = ?auto_694091 ?auto_694101 ) ) ( not ( = ?auto_694092 ?auto_694093 ) ) ( not ( = ?auto_694092 ?auto_694094 ) ) ( not ( = ?auto_694092 ?auto_694095 ) ) ( not ( = ?auto_694092 ?auto_694096 ) ) ( not ( = ?auto_694092 ?auto_694097 ) ) ( not ( = ?auto_694092 ?auto_694098 ) ) ( not ( = ?auto_694092 ?auto_694099 ) ) ( not ( = ?auto_694092 ?auto_694100 ) ) ( not ( = ?auto_694092 ?auto_694101 ) ) ( not ( = ?auto_694093 ?auto_694094 ) ) ( not ( = ?auto_694093 ?auto_694095 ) ) ( not ( = ?auto_694093 ?auto_694096 ) ) ( not ( = ?auto_694093 ?auto_694097 ) ) ( not ( = ?auto_694093 ?auto_694098 ) ) ( not ( = ?auto_694093 ?auto_694099 ) ) ( not ( = ?auto_694093 ?auto_694100 ) ) ( not ( = ?auto_694093 ?auto_694101 ) ) ( not ( = ?auto_694094 ?auto_694095 ) ) ( not ( = ?auto_694094 ?auto_694096 ) ) ( not ( = ?auto_694094 ?auto_694097 ) ) ( not ( = ?auto_694094 ?auto_694098 ) ) ( not ( = ?auto_694094 ?auto_694099 ) ) ( not ( = ?auto_694094 ?auto_694100 ) ) ( not ( = ?auto_694094 ?auto_694101 ) ) ( not ( = ?auto_694095 ?auto_694096 ) ) ( not ( = ?auto_694095 ?auto_694097 ) ) ( not ( = ?auto_694095 ?auto_694098 ) ) ( not ( = ?auto_694095 ?auto_694099 ) ) ( not ( = ?auto_694095 ?auto_694100 ) ) ( not ( = ?auto_694095 ?auto_694101 ) ) ( not ( = ?auto_694096 ?auto_694097 ) ) ( not ( = ?auto_694096 ?auto_694098 ) ) ( not ( = ?auto_694096 ?auto_694099 ) ) ( not ( = ?auto_694096 ?auto_694100 ) ) ( not ( = ?auto_694096 ?auto_694101 ) ) ( not ( = ?auto_694097 ?auto_694098 ) ) ( not ( = ?auto_694097 ?auto_694099 ) ) ( not ( = ?auto_694097 ?auto_694100 ) ) ( not ( = ?auto_694097 ?auto_694101 ) ) ( not ( = ?auto_694098 ?auto_694099 ) ) ( not ( = ?auto_694098 ?auto_694100 ) ) ( not ( = ?auto_694098 ?auto_694101 ) ) ( not ( = ?auto_694099 ?auto_694100 ) ) ( not ( = ?auto_694099 ?auto_694101 ) ) ( not ( = ?auto_694100 ?auto_694101 ) ) ( ON ?auto_694100 ?auto_694101 ) ( ON ?auto_694099 ?auto_694100 ) ( ON ?auto_694098 ?auto_694099 ) ( ON ?auto_694097 ?auto_694098 ) ( CLEAR ?auto_694095 ) ( ON ?auto_694096 ?auto_694097 ) ( CLEAR ?auto_694096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_694085 ?auto_694086 ?auto_694087 ?auto_694088 ?auto_694089 ?auto_694090 ?auto_694091 ?auto_694092 ?auto_694093 ?auto_694094 ?auto_694095 ?auto_694096 )
      ( MAKE-17PILE ?auto_694085 ?auto_694086 ?auto_694087 ?auto_694088 ?auto_694089 ?auto_694090 ?auto_694091 ?auto_694092 ?auto_694093 ?auto_694094 ?auto_694095 ?auto_694096 ?auto_694097 ?auto_694098 ?auto_694099 ?auto_694100 ?auto_694101 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694119 - BLOCK
      ?auto_694120 - BLOCK
      ?auto_694121 - BLOCK
      ?auto_694122 - BLOCK
      ?auto_694123 - BLOCK
      ?auto_694124 - BLOCK
      ?auto_694125 - BLOCK
      ?auto_694126 - BLOCK
      ?auto_694127 - BLOCK
      ?auto_694128 - BLOCK
      ?auto_694129 - BLOCK
      ?auto_694130 - BLOCK
      ?auto_694131 - BLOCK
      ?auto_694132 - BLOCK
      ?auto_694133 - BLOCK
      ?auto_694134 - BLOCK
      ?auto_694135 - BLOCK
    )
    :vars
    (
      ?auto_694136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694135 ?auto_694136 ) ( ON-TABLE ?auto_694119 ) ( ON ?auto_694120 ?auto_694119 ) ( ON ?auto_694121 ?auto_694120 ) ( ON ?auto_694122 ?auto_694121 ) ( ON ?auto_694123 ?auto_694122 ) ( ON ?auto_694124 ?auto_694123 ) ( ON ?auto_694125 ?auto_694124 ) ( ON ?auto_694126 ?auto_694125 ) ( ON ?auto_694127 ?auto_694126 ) ( ON ?auto_694128 ?auto_694127 ) ( not ( = ?auto_694119 ?auto_694120 ) ) ( not ( = ?auto_694119 ?auto_694121 ) ) ( not ( = ?auto_694119 ?auto_694122 ) ) ( not ( = ?auto_694119 ?auto_694123 ) ) ( not ( = ?auto_694119 ?auto_694124 ) ) ( not ( = ?auto_694119 ?auto_694125 ) ) ( not ( = ?auto_694119 ?auto_694126 ) ) ( not ( = ?auto_694119 ?auto_694127 ) ) ( not ( = ?auto_694119 ?auto_694128 ) ) ( not ( = ?auto_694119 ?auto_694129 ) ) ( not ( = ?auto_694119 ?auto_694130 ) ) ( not ( = ?auto_694119 ?auto_694131 ) ) ( not ( = ?auto_694119 ?auto_694132 ) ) ( not ( = ?auto_694119 ?auto_694133 ) ) ( not ( = ?auto_694119 ?auto_694134 ) ) ( not ( = ?auto_694119 ?auto_694135 ) ) ( not ( = ?auto_694119 ?auto_694136 ) ) ( not ( = ?auto_694120 ?auto_694121 ) ) ( not ( = ?auto_694120 ?auto_694122 ) ) ( not ( = ?auto_694120 ?auto_694123 ) ) ( not ( = ?auto_694120 ?auto_694124 ) ) ( not ( = ?auto_694120 ?auto_694125 ) ) ( not ( = ?auto_694120 ?auto_694126 ) ) ( not ( = ?auto_694120 ?auto_694127 ) ) ( not ( = ?auto_694120 ?auto_694128 ) ) ( not ( = ?auto_694120 ?auto_694129 ) ) ( not ( = ?auto_694120 ?auto_694130 ) ) ( not ( = ?auto_694120 ?auto_694131 ) ) ( not ( = ?auto_694120 ?auto_694132 ) ) ( not ( = ?auto_694120 ?auto_694133 ) ) ( not ( = ?auto_694120 ?auto_694134 ) ) ( not ( = ?auto_694120 ?auto_694135 ) ) ( not ( = ?auto_694120 ?auto_694136 ) ) ( not ( = ?auto_694121 ?auto_694122 ) ) ( not ( = ?auto_694121 ?auto_694123 ) ) ( not ( = ?auto_694121 ?auto_694124 ) ) ( not ( = ?auto_694121 ?auto_694125 ) ) ( not ( = ?auto_694121 ?auto_694126 ) ) ( not ( = ?auto_694121 ?auto_694127 ) ) ( not ( = ?auto_694121 ?auto_694128 ) ) ( not ( = ?auto_694121 ?auto_694129 ) ) ( not ( = ?auto_694121 ?auto_694130 ) ) ( not ( = ?auto_694121 ?auto_694131 ) ) ( not ( = ?auto_694121 ?auto_694132 ) ) ( not ( = ?auto_694121 ?auto_694133 ) ) ( not ( = ?auto_694121 ?auto_694134 ) ) ( not ( = ?auto_694121 ?auto_694135 ) ) ( not ( = ?auto_694121 ?auto_694136 ) ) ( not ( = ?auto_694122 ?auto_694123 ) ) ( not ( = ?auto_694122 ?auto_694124 ) ) ( not ( = ?auto_694122 ?auto_694125 ) ) ( not ( = ?auto_694122 ?auto_694126 ) ) ( not ( = ?auto_694122 ?auto_694127 ) ) ( not ( = ?auto_694122 ?auto_694128 ) ) ( not ( = ?auto_694122 ?auto_694129 ) ) ( not ( = ?auto_694122 ?auto_694130 ) ) ( not ( = ?auto_694122 ?auto_694131 ) ) ( not ( = ?auto_694122 ?auto_694132 ) ) ( not ( = ?auto_694122 ?auto_694133 ) ) ( not ( = ?auto_694122 ?auto_694134 ) ) ( not ( = ?auto_694122 ?auto_694135 ) ) ( not ( = ?auto_694122 ?auto_694136 ) ) ( not ( = ?auto_694123 ?auto_694124 ) ) ( not ( = ?auto_694123 ?auto_694125 ) ) ( not ( = ?auto_694123 ?auto_694126 ) ) ( not ( = ?auto_694123 ?auto_694127 ) ) ( not ( = ?auto_694123 ?auto_694128 ) ) ( not ( = ?auto_694123 ?auto_694129 ) ) ( not ( = ?auto_694123 ?auto_694130 ) ) ( not ( = ?auto_694123 ?auto_694131 ) ) ( not ( = ?auto_694123 ?auto_694132 ) ) ( not ( = ?auto_694123 ?auto_694133 ) ) ( not ( = ?auto_694123 ?auto_694134 ) ) ( not ( = ?auto_694123 ?auto_694135 ) ) ( not ( = ?auto_694123 ?auto_694136 ) ) ( not ( = ?auto_694124 ?auto_694125 ) ) ( not ( = ?auto_694124 ?auto_694126 ) ) ( not ( = ?auto_694124 ?auto_694127 ) ) ( not ( = ?auto_694124 ?auto_694128 ) ) ( not ( = ?auto_694124 ?auto_694129 ) ) ( not ( = ?auto_694124 ?auto_694130 ) ) ( not ( = ?auto_694124 ?auto_694131 ) ) ( not ( = ?auto_694124 ?auto_694132 ) ) ( not ( = ?auto_694124 ?auto_694133 ) ) ( not ( = ?auto_694124 ?auto_694134 ) ) ( not ( = ?auto_694124 ?auto_694135 ) ) ( not ( = ?auto_694124 ?auto_694136 ) ) ( not ( = ?auto_694125 ?auto_694126 ) ) ( not ( = ?auto_694125 ?auto_694127 ) ) ( not ( = ?auto_694125 ?auto_694128 ) ) ( not ( = ?auto_694125 ?auto_694129 ) ) ( not ( = ?auto_694125 ?auto_694130 ) ) ( not ( = ?auto_694125 ?auto_694131 ) ) ( not ( = ?auto_694125 ?auto_694132 ) ) ( not ( = ?auto_694125 ?auto_694133 ) ) ( not ( = ?auto_694125 ?auto_694134 ) ) ( not ( = ?auto_694125 ?auto_694135 ) ) ( not ( = ?auto_694125 ?auto_694136 ) ) ( not ( = ?auto_694126 ?auto_694127 ) ) ( not ( = ?auto_694126 ?auto_694128 ) ) ( not ( = ?auto_694126 ?auto_694129 ) ) ( not ( = ?auto_694126 ?auto_694130 ) ) ( not ( = ?auto_694126 ?auto_694131 ) ) ( not ( = ?auto_694126 ?auto_694132 ) ) ( not ( = ?auto_694126 ?auto_694133 ) ) ( not ( = ?auto_694126 ?auto_694134 ) ) ( not ( = ?auto_694126 ?auto_694135 ) ) ( not ( = ?auto_694126 ?auto_694136 ) ) ( not ( = ?auto_694127 ?auto_694128 ) ) ( not ( = ?auto_694127 ?auto_694129 ) ) ( not ( = ?auto_694127 ?auto_694130 ) ) ( not ( = ?auto_694127 ?auto_694131 ) ) ( not ( = ?auto_694127 ?auto_694132 ) ) ( not ( = ?auto_694127 ?auto_694133 ) ) ( not ( = ?auto_694127 ?auto_694134 ) ) ( not ( = ?auto_694127 ?auto_694135 ) ) ( not ( = ?auto_694127 ?auto_694136 ) ) ( not ( = ?auto_694128 ?auto_694129 ) ) ( not ( = ?auto_694128 ?auto_694130 ) ) ( not ( = ?auto_694128 ?auto_694131 ) ) ( not ( = ?auto_694128 ?auto_694132 ) ) ( not ( = ?auto_694128 ?auto_694133 ) ) ( not ( = ?auto_694128 ?auto_694134 ) ) ( not ( = ?auto_694128 ?auto_694135 ) ) ( not ( = ?auto_694128 ?auto_694136 ) ) ( not ( = ?auto_694129 ?auto_694130 ) ) ( not ( = ?auto_694129 ?auto_694131 ) ) ( not ( = ?auto_694129 ?auto_694132 ) ) ( not ( = ?auto_694129 ?auto_694133 ) ) ( not ( = ?auto_694129 ?auto_694134 ) ) ( not ( = ?auto_694129 ?auto_694135 ) ) ( not ( = ?auto_694129 ?auto_694136 ) ) ( not ( = ?auto_694130 ?auto_694131 ) ) ( not ( = ?auto_694130 ?auto_694132 ) ) ( not ( = ?auto_694130 ?auto_694133 ) ) ( not ( = ?auto_694130 ?auto_694134 ) ) ( not ( = ?auto_694130 ?auto_694135 ) ) ( not ( = ?auto_694130 ?auto_694136 ) ) ( not ( = ?auto_694131 ?auto_694132 ) ) ( not ( = ?auto_694131 ?auto_694133 ) ) ( not ( = ?auto_694131 ?auto_694134 ) ) ( not ( = ?auto_694131 ?auto_694135 ) ) ( not ( = ?auto_694131 ?auto_694136 ) ) ( not ( = ?auto_694132 ?auto_694133 ) ) ( not ( = ?auto_694132 ?auto_694134 ) ) ( not ( = ?auto_694132 ?auto_694135 ) ) ( not ( = ?auto_694132 ?auto_694136 ) ) ( not ( = ?auto_694133 ?auto_694134 ) ) ( not ( = ?auto_694133 ?auto_694135 ) ) ( not ( = ?auto_694133 ?auto_694136 ) ) ( not ( = ?auto_694134 ?auto_694135 ) ) ( not ( = ?auto_694134 ?auto_694136 ) ) ( not ( = ?auto_694135 ?auto_694136 ) ) ( ON ?auto_694134 ?auto_694135 ) ( ON ?auto_694133 ?auto_694134 ) ( ON ?auto_694132 ?auto_694133 ) ( ON ?auto_694131 ?auto_694132 ) ( ON ?auto_694130 ?auto_694131 ) ( CLEAR ?auto_694128 ) ( ON ?auto_694129 ?auto_694130 ) ( CLEAR ?auto_694129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_694119 ?auto_694120 ?auto_694121 ?auto_694122 ?auto_694123 ?auto_694124 ?auto_694125 ?auto_694126 ?auto_694127 ?auto_694128 ?auto_694129 )
      ( MAKE-17PILE ?auto_694119 ?auto_694120 ?auto_694121 ?auto_694122 ?auto_694123 ?auto_694124 ?auto_694125 ?auto_694126 ?auto_694127 ?auto_694128 ?auto_694129 ?auto_694130 ?auto_694131 ?auto_694132 ?auto_694133 ?auto_694134 ?auto_694135 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694154 - BLOCK
      ?auto_694155 - BLOCK
      ?auto_694156 - BLOCK
      ?auto_694157 - BLOCK
      ?auto_694158 - BLOCK
      ?auto_694159 - BLOCK
      ?auto_694160 - BLOCK
      ?auto_694161 - BLOCK
      ?auto_694162 - BLOCK
      ?auto_694163 - BLOCK
      ?auto_694164 - BLOCK
      ?auto_694165 - BLOCK
      ?auto_694166 - BLOCK
      ?auto_694167 - BLOCK
      ?auto_694168 - BLOCK
      ?auto_694169 - BLOCK
      ?auto_694170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_694170 ) ( ON-TABLE ?auto_694154 ) ( ON ?auto_694155 ?auto_694154 ) ( ON ?auto_694156 ?auto_694155 ) ( ON ?auto_694157 ?auto_694156 ) ( ON ?auto_694158 ?auto_694157 ) ( ON ?auto_694159 ?auto_694158 ) ( ON ?auto_694160 ?auto_694159 ) ( ON ?auto_694161 ?auto_694160 ) ( ON ?auto_694162 ?auto_694161 ) ( ON ?auto_694163 ?auto_694162 ) ( not ( = ?auto_694154 ?auto_694155 ) ) ( not ( = ?auto_694154 ?auto_694156 ) ) ( not ( = ?auto_694154 ?auto_694157 ) ) ( not ( = ?auto_694154 ?auto_694158 ) ) ( not ( = ?auto_694154 ?auto_694159 ) ) ( not ( = ?auto_694154 ?auto_694160 ) ) ( not ( = ?auto_694154 ?auto_694161 ) ) ( not ( = ?auto_694154 ?auto_694162 ) ) ( not ( = ?auto_694154 ?auto_694163 ) ) ( not ( = ?auto_694154 ?auto_694164 ) ) ( not ( = ?auto_694154 ?auto_694165 ) ) ( not ( = ?auto_694154 ?auto_694166 ) ) ( not ( = ?auto_694154 ?auto_694167 ) ) ( not ( = ?auto_694154 ?auto_694168 ) ) ( not ( = ?auto_694154 ?auto_694169 ) ) ( not ( = ?auto_694154 ?auto_694170 ) ) ( not ( = ?auto_694155 ?auto_694156 ) ) ( not ( = ?auto_694155 ?auto_694157 ) ) ( not ( = ?auto_694155 ?auto_694158 ) ) ( not ( = ?auto_694155 ?auto_694159 ) ) ( not ( = ?auto_694155 ?auto_694160 ) ) ( not ( = ?auto_694155 ?auto_694161 ) ) ( not ( = ?auto_694155 ?auto_694162 ) ) ( not ( = ?auto_694155 ?auto_694163 ) ) ( not ( = ?auto_694155 ?auto_694164 ) ) ( not ( = ?auto_694155 ?auto_694165 ) ) ( not ( = ?auto_694155 ?auto_694166 ) ) ( not ( = ?auto_694155 ?auto_694167 ) ) ( not ( = ?auto_694155 ?auto_694168 ) ) ( not ( = ?auto_694155 ?auto_694169 ) ) ( not ( = ?auto_694155 ?auto_694170 ) ) ( not ( = ?auto_694156 ?auto_694157 ) ) ( not ( = ?auto_694156 ?auto_694158 ) ) ( not ( = ?auto_694156 ?auto_694159 ) ) ( not ( = ?auto_694156 ?auto_694160 ) ) ( not ( = ?auto_694156 ?auto_694161 ) ) ( not ( = ?auto_694156 ?auto_694162 ) ) ( not ( = ?auto_694156 ?auto_694163 ) ) ( not ( = ?auto_694156 ?auto_694164 ) ) ( not ( = ?auto_694156 ?auto_694165 ) ) ( not ( = ?auto_694156 ?auto_694166 ) ) ( not ( = ?auto_694156 ?auto_694167 ) ) ( not ( = ?auto_694156 ?auto_694168 ) ) ( not ( = ?auto_694156 ?auto_694169 ) ) ( not ( = ?auto_694156 ?auto_694170 ) ) ( not ( = ?auto_694157 ?auto_694158 ) ) ( not ( = ?auto_694157 ?auto_694159 ) ) ( not ( = ?auto_694157 ?auto_694160 ) ) ( not ( = ?auto_694157 ?auto_694161 ) ) ( not ( = ?auto_694157 ?auto_694162 ) ) ( not ( = ?auto_694157 ?auto_694163 ) ) ( not ( = ?auto_694157 ?auto_694164 ) ) ( not ( = ?auto_694157 ?auto_694165 ) ) ( not ( = ?auto_694157 ?auto_694166 ) ) ( not ( = ?auto_694157 ?auto_694167 ) ) ( not ( = ?auto_694157 ?auto_694168 ) ) ( not ( = ?auto_694157 ?auto_694169 ) ) ( not ( = ?auto_694157 ?auto_694170 ) ) ( not ( = ?auto_694158 ?auto_694159 ) ) ( not ( = ?auto_694158 ?auto_694160 ) ) ( not ( = ?auto_694158 ?auto_694161 ) ) ( not ( = ?auto_694158 ?auto_694162 ) ) ( not ( = ?auto_694158 ?auto_694163 ) ) ( not ( = ?auto_694158 ?auto_694164 ) ) ( not ( = ?auto_694158 ?auto_694165 ) ) ( not ( = ?auto_694158 ?auto_694166 ) ) ( not ( = ?auto_694158 ?auto_694167 ) ) ( not ( = ?auto_694158 ?auto_694168 ) ) ( not ( = ?auto_694158 ?auto_694169 ) ) ( not ( = ?auto_694158 ?auto_694170 ) ) ( not ( = ?auto_694159 ?auto_694160 ) ) ( not ( = ?auto_694159 ?auto_694161 ) ) ( not ( = ?auto_694159 ?auto_694162 ) ) ( not ( = ?auto_694159 ?auto_694163 ) ) ( not ( = ?auto_694159 ?auto_694164 ) ) ( not ( = ?auto_694159 ?auto_694165 ) ) ( not ( = ?auto_694159 ?auto_694166 ) ) ( not ( = ?auto_694159 ?auto_694167 ) ) ( not ( = ?auto_694159 ?auto_694168 ) ) ( not ( = ?auto_694159 ?auto_694169 ) ) ( not ( = ?auto_694159 ?auto_694170 ) ) ( not ( = ?auto_694160 ?auto_694161 ) ) ( not ( = ?auto_694160 ?auto_694162 ) ) ( not ( = ?auto_694160 ?auto_694163 ) ) ( not ( = ?auto_694160 ?auto_694164 ) ) ( not ( = ?auto_694160 ?auto_694165 ) ) ( not ( = ?auto_694160 ?auto_694166 ) ) ( not ( = ?auto_694160 ?auto_694167 ) ) ( not ( = ?auto_694160 ?auto_694168 ) ) ( not ( = ?auto_694160 ?auto_694169 ) ) ( not ( = ?auto_694160 ?auto_694170 ) ) ( not ( = ?auto_694161 ?auto_694162 ) ) ( not ( = ?auto_694161 ?auto_694163 ) ) ( not ( = ?auto_694161 ?auto_694164 ) ) ( not ( = ?auto_694161 ?auto_694165 ) ) ( not ( = ?auto_694161 ?auto_694166 ) ) ( not ( = ?auto_694161 ?auto_694167 ) ) ( not ( = ?auto_694161 ?auto_694168 ) ) ( not ( = ?auto_694161 ?auto_694169 ) ) ( not ( = ?auto_694161 ?auto_694170 ) ) ( not ( = ?auto_694162 ?auto_694163 ) ) ( not ( = ?auto_694162 ?auto_694164 ) ) ( not ( = ?auto_694162 ?auto_694165 ) ) ( not ( = ?auto_694162 ?auto_694166 ) ) ( not ( = ?auto_694162 ?auto_694167 ) ) ( not ( = ?auto_694162 ?auto_694168 ) ) ( not ( = ?auto_694162 ?auto_694169 ) ) ( not ( = ?auto_694162 ?auto_694170 ) ) ( not ( = ?auto_694163 ?auto_694164 ) ) ( not ( = ?auto_694163 ?auto_694165 ) ) ( not ( = ?auto_694163 ?auto_694166 ) ) ( not ( = ?auto_694163 ?auto_694167 ) ) ( not ( = ?auto_694163 ?auto_694168 ) ) ( not ( = ?auto_694163 ?auto_694169 ) ) ( not ( = ?auto_694163 ?auto_694170 ) ) ( not ( = ?auto_694164 ?auto_694165 ) ) ( not ( = ?auto_694164 ?auto_694166 ) ) ( not ( = ?auto_694164 ?auto_694167 ) ) ( not ( = ?auto_694164 ?auto_694168 ) ) ( not ( = ?auto_694164 ?auto_694169 ) ) ( not ( = ?auto_694164 ?auto_694170 ) ) ( not ( = ?auto_694165 ?auto_694166 ) ) ( not ( = ?auto_694165 ?auto_694167 ) ) ( not ( = ?auto_694165 ?auto_694168 ) ) ( not ( = ?auto_694165 ?auto_694169 ) ) ( not ( = ?auto_694165 ?auto_694170 ) ) ( not ( = ?auto_694166 ?auto_694167 ) ) ( not ( = ?auto_694166 ?auto_694168 ) ) ( not ( = ?auto_694166 ?auto_694169 ) ) ( not ( = ?auto_694166 ?auto_694170 ) ) ( not ( = ?auto_694167 ?auto_694168 ) ) ( not ( = ?auto_694167 ?auto_694169 ) ) ( not ( = ?auto_694167 ?auto_694170 ) ) ( not ( = ?auto_694168 ?auto_694169 ) ) ( not ( = ?auto_694168 ?auto_694170 ) ) ( not ( = ?auto_694169 ?auto_694170 ) ) ( ON ?auto_694169 ?auto_694170 ) ( ON ?auto_694168 ?auto_694169 ) ( ON ?auto_694167 ?auto_694168 ) ( ON ?auto_694166 ?auto_694167 ) ( ON ?auto_694165 ?auto_694166 ) ( CLEAR ?auto_694163 ) ( ON ?auto_694164 ?auto_694165 ) ( CLEAR ?auto_694164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_694154 ?auto_694155 ?auto_694156 ?auto_694157 ?auto_694158 ?auto_694159 ?auto_694160 ?auto_694161 ?auto_694162 ?auto_694163 ?auto_694164 )
      ( MAKE-17PILE ?auto_694154 ?auto_694155 ?auto_694156 ?auto_694157 ?auto_694158 ?auto_694159 ?auto_694160 ?auto_694161 ?auto_694162 ?auto_694163 ?auto_694164 ?auto_694165 ?auto_694166 ?auto_694167 ?auto_694168 ?auto_694169 ?auto_694170 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694188 - BLOCK
      ?auto_694189 - BLOCK
      ?auto_694190 - BLOCK
      ?auto_694191 - BLOCK
      ?auto_694192 - BLOCK
      ?auto_694193 - BLOCK
      ?auto_694194 - BLOCK
      ?auto_694195 - BLOCK
      ?auto_694196 - BLOCK
      ?auto_694197 - BLOCK
      ?auto_694198 - BLOCK
      ?auto_694199 - BLOCK
      ?auto_694200 - BLOCK
      ?auto_694201 - BLOCK
      ?auto_694202 - BLOCK
      ?auto_694203 - BLOCK
      ?auto_694204 - BLOCK
    )
    :vars
    (
      ?auto_694205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694204 ?auto_694205 ) ( ON-TABLE ?auto_694188 ) ( ON ?auto_694189 ?auto_694188 ) ( ON ?auto_694190 ?auto_694189 ) ( ON ?auto_694191 ?auto_694190 ) ( ON ?auto_694192 ?auto_694191 ) ( ON ?auto_694193 ?auto_694192 ) ( ON ?auto_694194 ?auto_694193 ) ( ON ?auto_694195 ?auto_694194 ) ( ON ?auto_694196 ?auto_694195 ) ( not ( = ?auto_694188 ?auto_694189 ) ) ( not ( = ?auto_694188 ?auto_694190 ) ) ( not ( = ?auto_694188 ?auto_694191 ) ) ( not ( = ?auto_694188 ?auto_694192 ) ) ( not ( = ?auto_694188 ?auto_694193 ) ) ( not ( = ?auto_694188 ?auto_694194 ) ) ( not ( = ?auto_694188 ?auto_694195 ) ) ( not ( = ?auto_694188 ?auto_694196 ) ) ( not ( = ?auto_694188 ?auto_694197 ) ) ( not ( = ?auto_694188 ?auto_694198 ) ) ( not ( = ?auto_694188 ?auto_694199 ) ) ( not ( = ?auto_694188 ?auto_694200 ) ) ( not ( = ?auto_694188 ?auto_694201 ) ) ( not ( = ?auto_694188 ?auto_694202 ) ) ( not ( = ?auto_694188 ?auto_694203 ) ) ( not ( = ?auto_694188 ?auto_694204 ) ) ( not ( = ?auto_694188 ?auto_694205 ) ) ( not ( = ?auto_694189 ?auto_694190 ) ) ( not ( = ?auto_694189 ?auto_694191 ) ) ( not ( = ?auto_694189 ?auto_694192 ) ) ( not ( = ?auto_694189 ?auto_694193 ) ) ( not ( = ?auto_694189 ?auto_694194 ) ) ( not ( = ?auto_694189 ?auto_694195 ) ) ( not ( = ?auto_694189 ?auto_694196 ) ) ( not ( = ?auto_694189 ?auto_694197 ) ) ( not ( = ?auto_694189 ?auto_694198 ) ) ( not ( = ?auto_694189 ?auto_694199 ) ) ( not ( = ?auto_694189 ?auto_694200 ) ) ( not ( = ?auto_694189 ?auto_694201 ) ) ( not ( = ?auto_694189 ?auto_694202 ) ) ( not ( = ?auto_694189 ?auto_694203 ) ) ( not ( = ?auto_694189 ?auto_694204 ) ) ( not ( = ?auto_694189 ?auto_694205 ) ) ( not ( = ?auto_694190 ?auto_694191 ) ) ( not ( = ?auto_694190 ?auto_694192 ) ) ( not ( = ?auto_694190 ?auto_694193 ) ) ( not ( = ?auto_694190 ?auto_694194 ) ) ( not ( = ?auto_694190 ?auto_694195 ) ) ( not ( = ?auto_694190 ?auto_694196 ) ) ( not ( = ?auto_694190 ?auto_694197 ) ) ( not ( = ?auto_694190 ?auto_694198 ) ) ( not ( = ?auto_694190 ?auto_694199 ) ) ( not ( = ?auto_694190 ?auto_694200 ) ) ( not ( = ?auto_694190 ?auto_694201 ) ) ( not ( = ?auto_694190 ?auto_694202 ) ) ( not ( = ?auto_694190 ?auto_694203 ) ) ( not ( = ?auto_694190 ?auto_694204 ) ) ( not ( = ?auto_694190 ?auto_694205 ) ) ( not ( = ?auto_694191 ?auto_694192 ) ) ( not ( = ?auto_694191 ?auto_694193 ) ) ( not ( = ?auto_694191 ?auto_694194 ) ) ( not ( = ?auto_694191 ?auto_694195 ) ) ( not ( = ?auto_694191 ?auto_694196 ) ) ( not ( = ?auto_694191 ?auto_694197 ) ) ( not ( = ?auto_694191 ?auto_694198 ) ) ( not ( = ?auto_694191 ?auto_694199 ) ) ( not ( = ?auto_694191 ?auto_694200 ) ) ( not ( = ?auto_694191 ?auto_694201 ) ) ( not ( = ?auto_694191 ?auto_694202 ) ) ( not ( = ?auto_694191 ?auto_694203 ) ) ( not ( = ?auto_694191 ?auto_694204 ) ) ( not ( = ?auto_694191 ?auto_694205 ) ) ( not ( = ?auto_694192 ?auto_694193 ) ) ( not ( = ?auto_694192 ?auto_694194 ) ) ( not ( = ?auto_694192 ?auto_694195 ) ) ( not ( = ?auto_694192 ?auto_694196 ) ) ( not ( = ?auto_694192 ?auto_694197 ) ) ( not ( = ?auto_694192 ?auto_694198 ) ) ( not ( = ?auto_694192 ?auto_694199 ) ) ( not ( = ?auto_694192 ?auto_694200 ) ) ( not ( = ?auto_694192 ?auto_694201 ) ) ( not ( = ?auto_694192 ?auto_694202 ) ) ( not ( = ?auto_694192 ?auto_694203 ) ) ( not ( = ?auto_694192 ?auto_694204 ) ) ( not ( = ?auto_694192 ?auto_694205 ) ) ( not ( = ?auto_694193 ?auto_694194 ) ) ( not ( = ?auto_694193 ?auto_694195 ) ) ( not ( = ?auto_694193 ?auto_694196 ) ) ( not ( = ?auto_694193 ?auto_694197 ) ) ( not ( = ?auto_694193 ?auto_694198 ) ) ( not ( = ?auto_694193 ?auto_694199 ) ) ( not ( = ?auto_694193 ?auto_694200 ) ) ( not ( = ?auto_694193 ?auto_694201 ) ) ( not ( = ?auto_694193 ?auto_694202 ) ) ( not ( = ?auto_694193 ?auto_694203 ) ) ( not ( = ?auto_694193 ?auto_694204 ) ) ( not ( = ?auto_694193 ?auto_694205 ) ) ( not ( = ?auto_694194 ?auto_694195 ) ) ( not ( = ?auto_694194 ?auto_694196 ) ) ( not ( = ?auto_694194 ?auto_694197 ) ) ( not ( = ?auto_694194 ?auto_694198 ) ) ( not ( = ?auto_694194 ?auto_694199 ) ) ( not ( = ?auto_694194 ?auto_694200 ) ) ( not ( = ?auto_694194 ?auto_694201 ) ) ( not ( = ?auto_694194 ?auto_694202 ) ) ( not ( = ?auto_694194 ?auto_694203 ) ) ( not ( = ?auto_694194 ?auto_694204 ) ) ( not ( = ?auto_694194 ?auto_694205 ) ) ( not ( = ?auto_694195 ?auto_694196 ) ) ( not ( = ?auto_694195 ?auto_694197 ) ) ( not ( = ?auto_694195 ?auto_694198 ) ) ( not ( = ?auto_694195 ?auto_694199 ) ) ( not ( = ?auto_694195 ?auto_694200 ) ) ( not ( = ?auto_694195 ?auto_694201 ) ) ( not ( = ?auto_694195 ?auto_694202 ) ) ( not ( = ?auto_694195 ?auto_694203 ) ) ( not ( = ?auto_694195 ?auto_694204 ) ) ( not ( = ?auto_694195 ?auto_694205 ) ) ( not ( = ?auto_694196 ?auto_694197 ) ) ( not ( = ?auto_694196 ?auto_694198 ) ) ( not ( = ?auto_694196 ?auto_694199 ) ) ( not ( = ?auto_694196 ?auto_694200 ) ) ( not ( = ?auto_694196 ?auto_694201 ) ) ( not ( = ?auto_694196 ?auto_694202 ) ) ( not ( = ?auto_694196 ?auto_694203 ) ) ( not ( = ?auto_694196 ?auto_694204 ) ) ( not ( = ?auto_694196 ?auto_694205 ) ) ( not ( = ?auto_694197 ?auto_694198 ) ) ( not ( = ?auto_694197 ?auto_694199 ) ) ( not ( = ?auto_694197 ?auto_694200 ) ) ( not ( = ?auto_694197 ?auto_694201 ) ) ( not ( = ?auto_694197 ?auto_694202 ) ) ( not ( = ?auto_694197 ?auto_694203 ) ) ( not ( = ?auto_694197 ?auto_694204 ) ) ( not ( = ?auto_694197 ?auto_694205 ) ) ( not ( = ?auto_694198 ?auto_694199 ) ) ( not ( = ?auto_694198 ?auto_694200 ) ) ( not ( = ?auto_694198 ?auto_694201 ) ) ( not ( = ?auto_694198 ?auto_694202 ) ) ( not ( = ?auto_694198 ?auto_694203 ) ) ( not ( = ?auto_694198 ?auto_694204 ) ) ( not ( = ?auto_694198 ?auto_694205 ) ) ( not ( = ?auto_694199 ?auto_694200 ) ) ( not ( = ?auto_694199 ?auto_694201 ) ) ( not ( = ?auto_694199 ?auto_694202 ) ) ( not ( = ?auto_694199 ?auto_694203 ) ) ( not ( = ?auto_694199 ?auto_694204 ) ) ( not ( = ?auto_694199 ?auto_694205 ) ) ( not ( = ?auto_694200 ?auto_694201 ) ) ( not ( = ?auto_694200 ?auto_694202 ) ) ( not ( = ?auto_694200 ?auto_694203 ) ) ( not ( = ?auto_694200 ?auto_694204 ) ) ( not ( = ?auto_694200 ?auto_694205 ) ) ( not ( = ?auto_694201 ?auto_694202 ) ) ( not ( = ?auto_694201 ?auto_694203 ) ) ( not ( = ?auto_694201 ?auto_694204 ) ) ( not ( = ?auto_694201 ?auto_694205 ) ) ( not ( = ?auto_694202 ?auto_694203 ) ) ( not ( = ?auto_694202 ?auto_694204 ) ) ( not ( = ?auto_694202 ?auto_694205 ) ) ( not ( = ?auto_694203 ?auto_694204 ) ) ( not ( = ?auto_694203 ?auto_694205 ) ) ( not ( = ?auto_694204 ?auto_694205 ) ) ( ON ?auto_694203 ?auto_694204 ) ( ON ?auto_694202 ?auto_694203 ) ( ON ?auto_694201 ?auto_694202 ) ( ON ?auto_694200 ?auto_694201 ) ( ON ?auto_694199 ?auto_694200 ) ( ON ?auto_694198 ?auto_694199 ) ( CLEAR ?auto_694196 ) ( ON ?auto_694197 ?auto_694198 ) ( CLEAR ?auto_694197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_694188 ?auto_694189 ?auto_694190 ?auto_694191 ?auto_694192 ?auto_694193 ?auto_694194 ?auto_694195 ?auto_694196 ?auto_694197 )
      ( MAKE-17PILE ?auto_694188 ?auto_694189 ?auto_694190 ?auto_694191 ?auto_694192 ?auto_694193 ?auto_694194 ?auto_694195 ?auto_694196 ?auto_694197 ?auto_694198 ?auto_694199 ?auto_694200 ?auto_694201 ?auto_694202 ?auto_694203 ?auto_694204 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694223 - BLOCK
      ?auto_694224 - BLOCK
      ?auto_694225 - BLOCK
      ?auto_694226 - BLOCK
      ?auto_694227 - BLOCK
      ?auto_694228 - BLOCK
      ?auto_694229 - BLOCK
      ?auto_694230 - BLOCK
      ?auto_694231 - BLOCK
      ?auto_694232 - BLOCK
      ?auto_694233 - BLOCK
      ?auto_694234 - BLOCK
      ?auto_694235 - BLOCK
      ?auto_694236 - BLOCK
      ?auto_694237 - BLOCK
      ?auto_694238 - BLOCK
      ?auto_694239 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_694239 ) ( ON-TABLE ?auto_694223 ) ( ON ?auto_694224 ?auto_694223 ) ( ON ?auto_694225 ?auto_694224 ) ( ON ?auto_694226 ?auto_694225 ) ( ON ?auto_694227 ?auto_694226 ) ( ON ?auto_694228 ?auto_694227 ) ( ON ?auto_694229 ?auto_694228 ) ( ON ?auto_694230 ?auto_694229 ) ( ON ?auto_694231 ?auto_694230 ) ( not ( = ?auto_694223 ?auto_694224 ) ) ( not ( = ?auto_694223 ?auto_694225 ) ) ( not ( = ?auto_694223 ?auto_694226 ) ) ( not ( = ?auto_694223 ?auto_694227 ) ) ( not ( = ?auto_694223 ?auto_694228 ) ) ( not ( = ?auto_694223 ?auto_694229 ) ) ( not ( = ?auto_694223 ?auto_694230 ) ) ( not ( = ?auto_694223 ?auto_694231 ) ) ( not ( = ?auto_694223 ?auto_694232 ) ) ( not ( = ?auto_694223 ?auto_694233 ) ) ( not ( = ?auto_694223 ?auto_694234 ) ) ( not ( = ?auto_694223 ?auto_694235 ) ) ( not ( = ?auto_694223 ?auto_694236 ) ) ( not ( = ?auto_694223 ?auto_694237 ) ) ( not ( = ?auto_694223 ?auto_694238 ) ) ( not ( = ?auto_694223 ?auto_694239 ) ) ( not ( = ?auto_694224 ?auto_694225 ) ) ( not ( = ?auto_694224 ?auto_694226 ) ) ( not ( = ?auto_694224 ?auto_694227 ) ) ( not ( = ?auto_694224 ?auto_694228 ) ) ( not ( = ?auto_694224 ?auto_694229 ) ) ( not ( = ?auto_694224 ?auto_694230 ) ) ( not ( = ?auto_694224 ?auto_694231 ) ) ( not ( = ?auto_694224 ?auto_694232 ) ) ( not ( = ?auto_694224 ?auto_694233 ) ) ( not ( = ?auto_694224 ?auto_694234 ) ) ( not ( = ?auto_694224 ?auto_694235 ) ) ( not ( = ?auto_694224 ?auto_694236 ) ) ( not ( = ?auto_694224 ?auto_694237 ) ) ( not ( = ?auto_694224 ?auto_694238 ) ) ( not ( = ?auto_694224 ?auto_694239 ) ) ( not ( = ?auto_694225 ?auto_694226 ) ) ( not ( = ?auto_694225 ?auto_694227 ) ) ( not ( = ?auto_694225 ?auto_694228 ) ) ( not ( = ?auto_694225 ?auto_694229 ) ) ( not ( = ?auto_694225 ?auto_694230 ) ) ( not ( = ?auto_694225 ?auto_694231 ) ) ( not ( = ?auto_694225 ?auto_694232 ) ) ( not ( = ?auto_694225 ?auto_694233 ) ) ( not ( = ?auto_694225 ?auto_694234 ) ) ( not ( = ?auto_694225 ?auto_694235 ) ) ( not ( = ?auto_694225 ?auto_694236 ) ) ( not ( = ?auto_694225 ?auto_694237 ) ) ( not ( = ?auto_694225 ?auto_694238 ) ) ( not ( = ?auto_694225 ?auto_694239 ) ) ( not ( = ?auto_694226 ?auto_694227 ) ) ( not ( = ?auto_694226 ?auto_694228 ) ) ( not ( = ?auto_694226 ?auto_694229 ) ) ( not ( = ?auto_694226 ?auto_694230 ) ) ( not ( = ?auto_694226 ?auto_694231 ) ) ( not ( = ?auto_694226 ?auto_694232 ) ) ( not ( = ?auto_694226 ?auto_694233 ) ) ( not ( = ?auto_694226 ?auto_694234 ) ) ( not ( = ?auto_694226 ?auto_694235 ) ) ( not ( = ?auto_694226 ?auto_694236 ) ) ( not ( = ?auto_694226 ?auto_694237 ) ) ( not ( = ?auto_694226 ?auto_694238 ) ) ( not ( = ?auto_694226 ?auto_694239 ) ) ( not ( = ?auto_694227 ?auto_694228 ) ) ( not ( = ?auto_694227 ?auto_694229 ) ) ( not ( = ?auto_694227 ?auto_694230 ) ) ( not ( = ?auto_694227 ?auto_694231 ) ) ( not ( = ?auto_694227 ?auto_694232 ) ) ( not ( = ?auto_694227 ?auto_694233 ) ) ( not ( = ?auto_694227 ?auto_694234 ) ) ( not ( = ?auto_694227 ?auto_694235 ) ) ( not ( = ?auto_694227 ?auto_694236 ) ) ( not ( = ?auto_694227 ?auto_694237 ) ) ( not ( = ?auto_694227 ?auto_694238 ) ) ( not ( = ?auto_694227 ?auto_694239 ) ) ( not ( = ?auto_694228 ?auto_694229 ) ) ( not ( = ?auto_694228 ?auto_694230 ) ) ( not ( = ?auto_694228 ?auto_694231 ) ) ( not ( = ?auto_694228 ?auto_694232 ) ) ( not ( = ?auto_694228 ?auto_694233 ) ) ( not ( = ?auto_694228 ?auto_694234 ) ) ( not ( = ?auto_694228 ?auto_694235 ) ) ( not ( = ?auto_694228 ?auto_694236 ) ) ( not ( = ?auto_694228 ?auto_694237 ) ) ( not ( = ?auto_694228 ?auto_694238 ) ) ( not ( = ?auto_694228 ?auto_694239 ) ) ( not ( = ?auto_694229 ?auto_694230 ) ) ( not ( = ?auto_694229 ?auto_694231 ) ) ( not ( = ?auto_694229 ?auto_694232 ) ) ( not ( = ?auto_694229 ?auto_694233 ) ) ( not ( = ?auto_694229 ?auto_694234 ) ) ( not ( = ?auto_694229 ?auto_694235 ) ) ( not ( = ?auto_694229 ?auto_694236 ) ) ( not ( = ?auto_694229 ?auto_694237 ) ) ( not ( = ?auto_694229 ?auto_694238 ) ) ( not ( = ?auto_694229 ?auto_694239 ) ) ( not ( = ?auto_694230 ?auto_694231 ) ) ( not ( = ?auto_694230 ?auto_694232 ) ) ( not ( = ?auto_694230 ?auto_694233 ) ) ( not ( = ?auto_694230 ?auto_694234 ) ) ( not ( = ?auto_694230 ?auto_694235 ) ) ( not ( = ?auto_694230 ?auto_694236 ) ) ( not ( = ?auto_694230 ?auto_694237 ) ) ( not ( = ?auto_694230 ?auto_694238 ) ) ( not ( = ?auto_694230 ?auto_694239 ) ) ( not ( = ?auto_694231 ?auto_694232 ) ) ( not ( = ?auto_694231 ?auto_694233 ) ) ( not ( = ?auto_694231 ?auto_694234 ) ) ( not ( = ?auto_694231 ?auto_694235 ) ) ( not ( = ?auto_694231 ?auto_694236 ) ) ( not ( = ?auto_694231 ?auto_694237 ) ) ( not ( = ?auto_694231 ?auto_694238 ) ) ( not ( = ?auto_694231 ?auto_694239 ) ) ( not ( = ?auto_694232 ?auto_694233 ) ) ( not ( = ?auto_694232 ?auto_694234 ) ) ( not ( = ?auto_694232 ?auto_694235 ) ) ( not ( = ?auto_694232 ?auto_694236 ) ) ( not ( = ?auto_694232 ?auto_694237 ) ) ( not ( = ?auto_694232 ?auto_694238 ) ) ( not ( = ?auto_694232 ?auto_694239 ) ) ( not ( = ?auto_694233 ?auto_694234 ) ) ( not ( = ?auto_694233 ?auto_694235 ) ) ( not ( = ?auto_694233 ?auto_694236 ) ) ( not ( = ?auto_694233 ?auto_694237 ) ) ( not ( = ?auto_694233 ?auto_694238 ) ) ( not ( = ?auto_694233 ?auto_694239 ) ) ( not ( = ?auto_694234 ?auto_694235 ) ) ( not ( = ?auto_694234 ?auto_694236 ) ) ( not ( = ?auto_694234 ?auto_694237 ) ) ( not ( = ?auto_694234 ?auto_694238 ) ) ( not ( = ?auto_694234 ?auto_694239 ) ) ( not ( = ?auto_694235 ?auto_694236 ) ) ( not ( = ?auto_694235 ?auto_694237 ) ) ( not ( = ?auto_694235 ?auto_694238 ) ) ( not ( = ?auto_694235 ?auto_694239 ) ) ( not ( = ?auto_694236 ?auto_694237 ) ) ( not ( = ?auto_694236 ?auto_694238 ) ) ( not ( = ?auto_694236 ?auto_694239 ) ) ( not ( = ?auto_694237 ?auto_694238 ) ) ( not ( = ?auto_694237 ?auto_694239 ) ) ( not ( = ?auto_694238 ?auto_694239 ) ) ( ON ?auto_694238 ?auto_694239 ) ( ON ?auto_694237 ?auto_694238 ) ( ON ?auto_694236 ?auto_694237 ) ( ON ?auto_694235 ?auto_694236 ) ( ON ?auto_694234 ?auto_694235 ) ( ON ?auto_694233 ?auto_694234 ) ( CLEAR ?auto_694231 ) ( ON ?auto_694232 ?auto_694233 ) ( CLEAR ?auto_694232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_694223 ?auto_694224 ?auto_694225 ?auto_694226 ?auto_694227 ?auto_694228 ?auto_694229 ?auto_694230 ?auto_694231 ?auto_694232 )
      ( MAKE-17PILE ?auto_694223 ?auto_694224 ?auto_694225 ?auto_694226 ?auto_694227 ?auto_694228 ?auto_694229 ?auto_694230 ?auto_694231 ?auto_694232 ?auto_694233 ?auto_694234 ?auto_694235 ?auto_694236 ?auto_694237 ?auto_694238 ?auto_694239 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694257 - BLOCK
      ?auto_694258 - BLOCK
      ?auto_694259 - BLOCK
      ?auto_694260 - BLOCK
      ?auto_694261 - BLOCK
      ?auto_694262 - BLOCK
      ?auto_694263 - BLOCK
      ?auto_694264 - BLOCK
      ?auto_694265 - BLOCK
      ?auto_694266 - BLOCK
      ?auto_694267 - BLOCK
      ?auto_694268 - BLOCK
      ?auto_694269 - BLOCK
      ?auto_694270 - BLOCK
      ?auto_694271 - BLOCK
      ?auto_694272 - BLOCK
      ?auto_694273 - BLOCK
    )
    :vars
    (
      ?auto_694274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694273 ?auto_694274 ) ( ON-TABLE ?auto_694257 ) ( ON ?auto_694258 ?auto_694257 ) ( ON ?auto_694259 ?auto_694258 ) ( ON ?auto_694260 ?auto_694259 ) ( ON ?auto_694261 ?auto_694260 ) ( ON ?auto_694262 ?auto_694261 ) ( ON ?auto_694263 ?auto_694262 ) ( ON ?auto_694264 ?auto_694263 ) ( not ( = ?auto_694257 ?auto_694258 ) ) ( not ( = ?auto_694257 ?auto_694259 ) ) ( not ( = ?auto_694257 ?auto_694260 ) ) ( not ( = ?auto_694257 ?auto_694261 ) ) ( not ( = ?auto_694257 ?auto_694262 ) ) ( not ( = ?auto_694257 ?auto_694263 ) ) ( not ( = ?auto_694257 ?auto_694264 ) ) ( not ( = ?auto_694257 ?auto_694265 ) ) ( not ( = ?auto_694257 ?auto_694266 ) ) ( not ( = ?auto_694257 ?auto_694267 ) ) ( not ( = ?auto_694257 ?auto_694268 ) ) ( not ( = ?auto_694257 ?auto_694269 ) ) ( not ( = ?auto_694257 ?auto_694270 ) ) ( not ( = ?auto_694257 ?auto_694271 ) ) ( not ( = ?auto_694257 ?auto_694272 ) ) ( not ( = ?auto_694257 ?auto_694273 ) ) ( not ( = ?auto_694257 ?auto_694274 ) ) ( not ( = ?auto_694258 ?auto_694259 ) ) ( not ( = ?auto_694258 ?auto_694260 ) ) ( not ( = ?auto_694258 ?auto_694261 ) ) ( not ( = ?auto_694258 ?auto_694262 ) ) ( not ( = ?auto_694258 ?auto_694263 ) ) ( not ( = ?auto_694258 ?auto_694264 ) ) ( not ( = ?auto_694258 ?auto_694265 ) ) ( not ( = ?auto_694258 ?auto_694266 ) ) ( not ( = ?auto_694258 ?auto_694267 ) ) ( not ( = ?auto_694258 ?auto_694268 ) ) ( not ( = ?auto_694258 ?auto_694269 ) ) ( not ( = ?auto_694258 ?auto_694270 ) ) ( not ( = ?auto_694258 ?auto_694271 ) ) ( not ( = ?auto_694258 ?auto_694272 ) ) ( not ( = ?auto_694258 ?auto_694273 ) ) ( not ( = ?auto_694258 ?auto_694274 ) ) ( not ( = ?auto_694259 ?auto_694260 ) ) ( not ( = ?auto_694259 ?auto_694261 ) ) ( not ( = ?auto_694259 ?auto_694262 ) ) ( not ( = ?auto_694259 ?auto_694263 ) ) ( not ( = ?auto_694259 ?auto_694264 ) ) ( not ( = ?auto_694259 ?auto_694265 ) ) ( not ( = ?auto_694259 ?auto_694266 ) ) ( not ( = ?auto_694259 ?auto_694267 ) ) ( not ( = ?auto_694259 ?auto_694268 ) ) ( not ( = ?auto_694259 ?auto_694269 ) ) ( not ( = ?auto_694259 ?auto_694270 ) ) ( not ( = ?auto_694259 ?auto_694271 ) ) ( not ( = ?auto_694259 ?auto_694272 ) ) ( not ( = ?auto_694259 ?auto_694273 ) ) ( not ( = ?auto_694259 ?auto_694274 ) ) ( not ( = ?auto_694260 ?auto_694261 ) ) ( not ( = ?auto_694260 ?auto_694262 ) ) ( not ( = ?auto_694260 ?auto_694263 ) ) ( not ( = ?auto_694260 ?auto_694264 ) ) ( not ( = ?auto_694260 ?auto_694265 ) ) ( not ( = ?auto_694260 ?auto_694266 ) ) ( not ( = ?auto_694260 ?auto_694267 ) ) ( not ( = ?auto_694260 ?auto_694268 ) ) ( not ( = ?auto_694260 ?auto_694269 ) ) ( not ( = ?auto_694260 ?auto_694270 ) ) ( not ( = ?auto_694260 ?auto_694271 ) ) ( not ( = ?auto_694260 ?auto_694272 ) ) ( not ( = ?auto_694260 ?auto_694273 ) ) ( not ( = ?auto_694260 ?auto_694274 ) ) ( not ( = ?auto_694261 ?auto_694262 ) ) ( not ( = ?auto_694261 ?auto_694263 ) ) ( not ( = ?auto_694261 ?auto_694264 ) ) ( not ( = ?auto_694261 ?auto_694265 ) ) ( not ( = ?auto_694261 ?auto_694266 ) ) ( not ( = ?auto_694261 ?auto_694267 ) ) ( not ( = ?auto_694261 ?auto_694268 ) ) ( not ( = ?auto_694261 ?auto_694269 ) ) ( not ( = ?auto_694261 ?auto_694270 ) ) ( not ( = ?auto_694261 ?auto_694271 ) ) ( not ( = ?auto_694261 ?auto_694272 ) ) ( not ( = ?auto_694261 ?auto_694273 ) ) ( not ( = ?auto_694261 ?auto_694274 ) ) ( not ( = ?auto_694262 ?auto_694263 ) ) ( not ( = ?auto_694262 ?auto_694264 ) ) ( not ( = ?auto_694262 ?auto_694265 ) ) ( not ( = ?auto_694262 ?auto_694266 ) ) ( not ( = ?auto_694262 ?auto_694267 ) ) ( not ( = ?auto_694262 ?auto_694268 ) ) ( not ( = ?auto_694262 ?auto_694269 ) ) ( not ( = ?auto_694262 ?auto_694270 ) ) ( not ( = ?auto_694262 ?auto_694271 ) ) ( not ( = ?auto_694262 ?auto_694272 ) ) ( not ( = ?auto_694262 ?auto_694273 ) ) ( not ( = ?auto_694262 ?auto_694274 ) ) ( not ( = ?auto_694263 ?auto_694264 ) ) ( not ( = ?auto_694263 ?auto_694265 ) ) ( not ( = ?auto_694263 ?auto_694266 ) ) ( not ( = ?auto_694263 ?auto_694267 ) ) ( not ( = ?auto_694263 ?auto_694268 ) ) ( not ( = ?auto_694263 ?auto_694269 ) ) ( not ( = ?auto_694263 ?auto_694270 ) ) ( not ( = ?auto_694263 ?auto_694271 ) ) ( not ( = ?auto_694263 ?auto_694272 ) ) ( not ( = ?auto_694263 ?auto_694273 ) ) ( not ( = ?auto_694263 ?auto_694274 ) ) ( not ( = ?auto_694264 ?auto_694265 ) ) ( not ( = ?auto_694264 ?auto_694266 ) ) ( not ( = ?auto_694264 ?auto_694267 ) ) ( not ( = ?auto_694264 ?auto_694268 ) ) ( not ( = ?auto_694264 ?auto_694269 ) ) ( not ( = ?auto_694264 ?auto_694270 ) ) ( not ( = ?auto_694264 ?auto_694271 ) ) ( not ( = ?auto_694264 ?auto_694272 ) ) ( not ( = ?auto_694264 ?auto_694273 ) ) ( not ( = ?auto_694264 ?auto_694274 ) ) ( not ( = ?auto_694265 ?auto_694266 ) ) ( not ( = ?auto_694265 ?auto_694267 ) ) ( not ( = ?auto_694265 ?auto_694268 ) ) ( not ( = ?auto_694265 ?auto_694269 ) ) ( not ( = ?auto_694265 ?auto_694270 ) ) ( not ( = ?auto_694265 ?auto_694271 ) ) ( not ( = ?auto_694265 ?auto_694272 ) ) ( not ( = ?auto_694265 ?auto_694273 ) ) ( not ( = ?auto_694265 ?auto_694274 ) ) ( not ( = ?auto_694266 ?auto_694267 ) ) ( not ( = ?auto_694266 ?auto_694268 ) ) ( not ( = ?auto_694266 ?auto_694269 ) ) ( not ( = ?auto_694266 ?auto_694270 ) ) ( not ( = ?auto_694266 ?auto_694271 ) ) ( not ( = ?auto_694266 ?auto_694272 ) ) ( not ( = ?auto_694266 ?auto_694273 ) ) ( not ( = ?auto_694266 ?auto_694274 ) ) ( not ( = ?auto_694267 ?auto_694268 ) ) ( not ( = ?auto_694267 ?auto_694269 ) ) ( not ( = ?auto_694267 ?auto_694270 ) ) ( not ( = ?auto_694267 ?auto_694271 ) ) ( not ( = ?auto_694267 ?auto_694272 ) ) ( not ( = ?auto_694267 ?auto_694273 ) ) ( not ( = ?auto_694267 ?auto_694274 ) ) ( not ( = ?auto_694268 ?auto_694269 ) ) ( not ( = ?auto_694268 ?auto_694270 ) ) ( not ( = ?auto_694268 ?auto_694271 ) ) ( not ( = ?auto_694268 ?auto_694272 ) ) ( not ( = ?auto_694268 ?auto_694273 ) ) ( not ( = ?auto_694268 ?auto_694274 ) ) ( not ( = ?auto_694269 ?auto_694270 ) ) ( not ( = ?auto_694269 ?auto_694271 ) ) ( not ( = ?auto_694269 ?auto_694272 ) ) ( not ( = ?auto_694269 ?auto_694273 ) ) ( not ( = ?auto_694269 ?auto_694274 ) ) ( not ( = ?auto_694270 ?auto_694271 ) ) ( not ( = ?auto_694270 ?auto_694272 ) ) ( not ( = ?auto_694270 ?auto_694273 ) ) ( not ( = ?auto_694270 ?auto_694274 ) ) ( not ( = ?auto_694271 ?auto_694272 ) ) ( not ( = ?auto_694271 ?auto_694273 ) ) ( not ( = ?auto_694271 ?auto_694274 ) ) ( not ( = ?auto_694272 ?auto_694273 ) ) ( not ( = ?auto_694272 ?auto_694274 ) ) ( not ( = ?auto_694273 ?auto_694274 ) ) ( ON ?auto_694272 ?auto_694273 ) ( ON ?auto_694271 ?auto_694272 ) ( ON ?auto_694270 ?auto_694271 ) ( ON ?auto_694269 ?auto_694270 ) ( ON ?auto_694268 ?auto_694269 ) ( ON ?auto_694267 ?auto_694268 ) ( ON ?auto_694266 ?auto_694267 ) ( CLEAR ?auto_694264 ) ( ON ?auto_694265 ?auto_694266 ) ( CLEAR ?auto_694265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_694257 ?auto_694258 ?auto_694259 ?auto_694260 ?auto_694261 ?auto_694262 ?auto_694263 ?auto_694264 ?auto_694265 )
      ( MAKE-17PILE ?auto_694257 ?auto_694258 ?auto_694259 ?auto_694260 ?auto_694261 ?auto_694262 ?auto_694263 ?auto_694264 ?auto_694265 ?auto_694266 ?auto_694267 ?auto_694268 ?auto_694269 ?auto_694270 ?auto_694271 ?auto_694272 ?auto_694273 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694292 - BLOCK
      ?auto_694293 - BLOCK
      ?auto_694294 - BLOCK
      ?auto_694295 - BLOCK
      ?auto_694296 - BLOCK
      ?auto_694297 - BLOCK
      ?auto_694298 - BLOCK
      ?auto_694299 - BLOCK
      ?auto_694300 - BLOCK
      ?auto_694301 - BLOCK
      ?auto_694302 - BLOCK
      ?auto_694303 - BLOCK
      ?auto_694304 - BLOCK
      ?auto_694305 - BLOCK
      ?auto_694306 - BLOCK
      ?auto_694307 - BLOCK
      ?auto_694308 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_694308 ) ( ON-TABLE ?auto_694292 ) ( ON ?auto_694293 ?auto_694292 ) ( ON ?auto_694294 ?auto_694293 ) ( ON ?auto_694295 ?auto_694294 ) ( ON ?auto_694296 ?auto_694295 ) ( ON ?auto_694297 ?auto_694296 ) ( ON ?auto_694298 ?auto_694297 ) ( ON ?auto_694299 ?auto_694298 ) ( not ( = ?auto_694292 ?auto_694293 ) ) ( not ( = ?auto_694292 ?auto_694294 ) ) ( not ( = ?auto_694292 ?auto_694295 ) ) ( not ( = ?auto_694292 ?auto_694296 ) ) ( not ( = ?auto_694292 ?auto_694297 ) ) ( not ( = ?auto_694292 ?auto_694298 ) ) ( not ( = ?auto_694292 ?auto_694299 ) ) ( not ( = ?auto_694292 ?auto_694300 ) ) ( not ( = ?auto_694292 ?auto_694301 ) ) ( not ( = ?auto_694292 ?auto_694302 ) ) ( not ( = ?auto_694292 ?auto_694303 ) ) ( not ( = ?auto_694292 ?auto_694304 ) ) ( not ( = ?auto_694292 ?auto_694305 ) ) ( not ( = ?auto_694292 ?auto_694306 ) ) ( not ( = ?auto_694292 ?auto_694307 ) ) ( not ( = ?auto_694292 ?auto_694308 ) ) ( not ( = ?auto_694293 ?auto_694294 ) ) ( not ( = ?auto_694293 ?auto_694295 ) ) ( not ( = ?auto_694293 ?auto_694296 ) ) ( not ( = ?auto_694293 ?auto_694297 ) ) ( not ( = ?auto_694293 ?auto_694298 ) ) ( not ( = ?auto_694293 ?auto_694299 ) ) ( not ( = ?auto_694293 ?auto_694300 ) ) ( not ( = ?auto_694293 ?auto_694301 ) ) ( not ( = ?auto_694293 ?auto_694302 ) ) ( not ( = ?auto_694293 ?auto_694303 ) ) ( not ( = ?auto_694293 ?auto_694304 ) ) ( not ( = ?auto_694293 ?auto_694305 ) ) ( not ( = ?auto_694293 ?auto_694306 ) ) ( not ( = ?auto_694293 ?auto_694307 ) ) ( not ( = ?auto_694293 ?auto_694308 ) ) ( not ( = ?auto_694294 ?auto_694295 ) ) ( not ( = ?auto_694294 ?auto_694296 ) ) ( not ( = ?auto_694294 ?auto_694297 ) ) ( not ( = ?auto_694294 ?auto_694298 ) ) ( not ( = ?auto_694294 ?auto_694299 ) ) ( not ( = ?auto_694294 ?auto_694300 ) ) ( not ( = ?auto_694294 ?auto_694301 ) ) ( not ( = ?auto_694294 ?auto_694302 ) ) ( not ( = ?auto_694294 ?auto_694303 ) ) ( not ( = ?auto_694294 ?auto_694304 ) ) ( not ( = ?auto_694294 ?auto_694305 ) ) ( not ( = ?auto_694294 ?auto_694306 ) ) ( not ( = ?auto_694294 ?auto_694307 ) ) ( not ( = ?auto_694294 ?auto_694308 ) ) ( not ( = ?auto_694295 ?auto_694296 ) ) ( not ( = ?auto_694295 ?auto_694297 ) ) ( not ( = ?auto_694295 ?auto_694298 ) ) ( not ( = ?auto_694295 ?auto_694299 ) ) ( not ( = ?auto_694295 ?auto_694300 ) ) ( not ( = ?auto_694295 ?auto_694301 ) ) ( not ( = ?auto_694295 ?auto_694302 ) ) ( not ( = ?auto_694295 ?auto_694303 ) ) ( not ( = ?auto_694295 ?auto_694304 ) ) ( not ( = ?auto_694295 ?auto_694305 ) ) ( not ( = ?auto_694295 ?auto_694306 ) ) ( not ( = ?auto_694295 ?auto_694307 ) ) ( not ( = ?auto_694295 ?auto_694308 ) ) ( not ( = ?auto_694296 ?auto_694297 ) ) ( not ( = ?auto_694296 ?auto_694298 ) ) ( not ( = ?auto_694296 ?auto_694299 ) ) ( not ( = ?auto_694296 ?auto_694300 ) ) ( not ( = ?auto_694296 ?auto_694301 ) ) ( not ( = ?auto_694296 ?auto_694302 ) ) ( not ( = ?auto_694296 ?auto_694303 ) ) ( not ( = ?auto_694296 ?auto_694304 ) ) ( not ( = ?auto_694296 ?auto_694305 ) ) ( not ( = ?auto_694296 ?auto_694306 ) ) ( not ( = ?auto_694296 ?auto_694307 ) ) ( not ( = ?auto_694296 ?auto_694308 ) ) ( not ( = ?auto_694297 ?auto_694298 ) ) ( not ( = ?auto_694297 ?auto_694299 ) ) ( not ( = ?auto_694297 ?auto_694300 ) ) ( not ( = ?auto_694297 ?auto_694301 ) ) ( not ( = ?auto_694297 ?auto_694302 ) ) ( not ( = ?auto_694297 ?auto_694303 ) ) ( not ( = ?auto_694297 ?auto_694304 ) ) ( not ( = ?auto_694297 ?auto_694305 ) ) ( not ( = ?auto_694297 ?auto_694306 ) ) ( not ( = ?auto_694297 ?auto_694307 ) ) ( not ( = ?auto_694297 ?auto_694308 ) ) ( not ( = ?auto_694298 ?auto_694299 ) ) ( not ( = ?auto_694298 ?auto_694300 ) ) ( not ( = ?auto_694298 ?auto_694301 ) ) ( not ( = ?auto_694298 ?auto_694302 ) ) ( not ( = ?auto_694298 ?auto_694303 ) ) ( not ( = ?auto_694298 ?auto_694304 ) ) ( not ( = ?auto_694298 ?auto_694305 ) ) ( not ( = ?auto_694298 ?auto_694306 ) ) ( not ( = ?auto_694298 ?auto_694307 ) ) ( not ( = ?auto_694298 ?auto_694308 ) ) ( not ( = ?auto_694299 ?auto_694300 ) ) ( not ( = ?auto_694299 ?auto_694301 ) ) ( not ( = ?auto_694299 ?auto_694302 ) ) ( not ( = ?auto_694299 ?auto_694303 ) ) ( not ( = ?auto_694299 ?auto_694304 ) ) ( not ( = ?auto_694299 ?auto_694305 ) ) ( not ( = ?auto_694299 ?auto_694306 ) ) ( not ( = ?auto_694299 ?auto_694307 ) ) ( not ( = ?auto_694299 ?auto_694308 ) ) ( not ( = ?auto_694300 ?auto_694301 ) ) ( not ( = ?auto_694300 ?auto_694302 ) ) ( not ( = ?auto_694300 ?auto_694303 ) ) ( not ( = ?auto_694300 ?auto_694304 ) ) ( not ( = ?auto_694300 ?auto_694305 ) ) ( not ( = ?auto_694300 ?auto_694306 ) ) ( not ( = ?auto_694300 ?auto_694307 ) ) ( not ( = ?auto_694300 ?auto_694308 ) ) ( not ( = ?auto_694301 ?auto_694302 ) ) ( not ( = ?auto_694301 ?auto_694303 ) ) ( not ( = ?auto_694301 ?auto_694304 ) ) ( not ( = ?auto_694301 ?auto_694305 ) ) ( not ( = ?auto_694301 ?auto_694306 ) ) ( not ( = ?auto_694301 ?auto_694307 ) ) ( not ( = ?auto_694301 ?auto_694308 ) ) ( not ( = ?auto_694302 ?auto_694303 ) ) ( not ( = ?auto_694302 ?auto_694304 ) ) ( not ( = ?auto_694302 ?auto_694305 ) ) ( not ( = ?auto_694302 ?auto_694306 ) ) ( not ( = ?auto_694302 ?auto_694307 ) ) ( not ( = ?auto_694302 ?auto_694308 ) ) ( not ( = ?auto_694303 ?auto_694304 ) ) ( not ( = ?auto_694303 ?auto_694305 ) ) ( not ( = ?auto_694303 ?auto_694306 ) ) ( not ( = ?auto_694303 ?auto_694307 ) ) ( not ( = ?auto_694303 ?auto_694308 ) ) ( not ( = ?auto_694304 ?auto_694305 ) ) ( not ( = ?auto_694304 ?auto_694306 ) ) ( not ( = ?auto_694304 ?auto_694307 ) ) ( not ( = ?auto_694304 ?auto_694308 ) ) ( not ( = ?auto_694305 ?auto_694306 ) ) ( not ( = ?auto_694305 ?auto_694307 ) ) ( not ( = ?auto_694305 ?auto_694308 ) ) ( not ( = ?auto_694306 ?auto_694307 ) ) ( not ( = ?auto_694306 ?auto_694308 ) ) ( not ( = ?auto_694307 ?auto_694308 ) ) ( ON ?auto_694307 ?auto_694308 ) ( ON ?auto_694306 ?auto_694307 ) ( ON ?auto_694305 ?auto_694306 ) ( ON ?auto_694304 ?auto_694305 ) ( ON ?auto_694303 ?auto_694304 ) ( ON ?auto_694302 ?auto_694303 ) ( ON ?auto_694301 ?auto_694302 ) ( CLEAR ?auto_694299 ) ( ON ?auto_694300 ?auto_694301 ) ( CLEAR ?auto_694300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_694292 ?auto_694293 ?auto_694294 ?auto_694295 ?auto_694296 ?auto_694297 ?auto_694298 ?auto_694299 ?auto_694300 )
      ( MAKE-17PILE ?auto_694292 ?auto_694293 ?auto_694294 ?auto_694295 ?auto_694296 ?auto_694297 ?auto_694298 ?auto_694299 ?auto_694300 ?auto_694301 ?auto_694302 ?auto_694303 ?auto_694304 ?auto_694305 ?auto_694306 ?auto_694307 ?auto_694308 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694326 - BLOCK
      ?auto_694327 - BLOCK
      ?auto_694328 - BLOCK
      ?auto_694329 - BLOCK
      ?auto_694330 - BLOCK
      ?auto_694331 - BLOCK
      ?auto_694332 - BLOCK
      ?auto_694333 - BLOCK
      ?auto_694334 - BLOCK
      ?auto_694335 - BLOCK
      ?auto_694336 - BLOCK
      ?auto_694337 - BLOCK
      ?auto_694338 - BLOCK
      ?auto_694339 - BLOCK
      ?auto_694340 - BLOCK
      ?auto_694341 - BLOCK
      ?auto_694342 - BLOCK
    )
    :vars
    (
      ?auto_694343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694342 ?auto_694343 ) ( ON-TABLE ?auto_694326 ) ( ON ?auto_694327 ?auto_694326 ) ( ON ?auto_694328 ?auto_694327 ) ( ON ?auto_694329 ?auto_694328 ) ( ON ?auto_694330 ?auto_694329 ) ( ON ?auto_694331 ?auto_694330 ) ( ON ?auto_694332 ?auto_694331 ) ( not ( = ?auto_694326 ?auto_694327 ) ) ( not ( = ?auto_694326 ?auto_694328 ) ) ( not ( = ?auto_694326 ?auto_694329 ) ) ( not ( = ?auto_694326 ?auto_694330 ) ) ( not ( = ?auto_694326 ?auto_694331 ) ) ( not ( = ?auto_694326 ?auto_694332 ) ) ( not ( = ?auto_694326 ?auto_694333 ) ) ( not ( = ?auto_694326 ?auto_694334 ) ) ( not ( = ?auto_694326 ?auto_694335 ) ) ( not ( = ?auto_694326 ?auto_694336 ) ) ( not ( = ?auto_694326 ?auto_694337 ) ) ( not ( = ?auto_694326 ?auto_694338 ) ) ( not ( = ?auto_694326 ?auto_694339 ) ) ( not ( = ?auto_694326 ?auto_694340 ) ) ( not ( = ?auto_694326 ?auto_694341 ) ) ( not ( = ?auto_694326 ?auto_694342 ) ) ( not ( = ?auto_694326 ?auto_694343 ) ) ( not ( = ?auto_694327 ?auto_694328 ) ) ( not ( = ?auto_694327 ?auto_694329 ) ) ( not ( = ?auto_694327 ?auto_694330 ) ) ( not ( = ?auto_694327 ?auto_694331 ) ) ( not ( = ?auto_694327 ?auto_694332 ) ) ( not ( = ?auto_694327 ?auto_694333 ) ) ( not ( = ?auto_694327 ?auto_694334 ) ) ( not ( = ?auto_694327 ?auto_694335 ) ) ( not ( = ?auto_694327 ?auto_694336 ) ) ( not ( = ?auto_694327 ?auto_694337 ) ) ( not ( = ?auto_694327 ?auto_694338 ) ) ( not ( = ?auto_694327 ?auto_694339 ) ) ( not ( = ?auto_694327 ?auto_694340 ) ) ( not ( = ?auto_694327 ?auto_694341 ) ) ( not ( = ?auto_694327 ?auto_694342 ) ) ( not ( = ?auto_694327 ?auto_694343 ) ) ( not ( = ?auto_694328 ?auto_694329 ) ) ( not ( = ?auto_694328 ?auto_694330 ) ) ( not ( = ?auto_694328 ?auto_694331 ) ) ( not ( = ?auto_694328 ?auto_694332 ) ) ( not ( = ?auto_694328 ?auto_694333 ) ) ( not ( = ?auto_694328 ?auto_694334 ) ) ( not ( = ?auto_694328 ?auto_694335 ) ) ( not ( = ?auto_694328 ?auto_694336 ) ) ( not ( = ?auto_694328 ?auto_694337 ) ) ( not ( = ?auto_694328 ?auto_694338 ) ) ( not ( = ?auto_694328 ?auto_694339 ) ) ( not ( = ?auto_694328 ?auto_694340 ) ) ( not ( = ?auto_694328 ?auto_694341 ) ) ( not ( = ?auto_694328 ?auto_694342 ) ) ( not ( = ?auto_694328 ?auto_694343 ) ) ( not ( = ?auto_694329 ?auto_694330 ) ) ( not ( = ?auto_694329 ?auto_694331 ) ) ( not ( = ?auto_694329 ?auto_694332 ) ) ( not ( = ?auto_694329 ?auto_694333 ) ) ( not ( = ?auto_694329 ?auto_694334 ) ) ( not ( = ?auto_694329 ?auto_694335 ) ) ( not ( = ?auto_694329 ?auto_694336 ) ) ( not ( = ?auto_694329 ?auto_694337 ) ) ( not ( = ?auto_694329 ?auto_694338 ) ) ( not ( = ?auto_694329 ?auto_694339 ) ) ( not ( = ?auto_694329 ?auto_694340 ) ) ( not ( = ?auto_694329 ?auto_694341 ) ) ( not ( = ?auto_694329 ?auto_694342 ) ) ( not ( = ?auto_694329 ?auto_694343 ) ) ( not ( = ?auto_694330 ?auto_694331 ) ) ( not ( = ?auto_694330 ?auto_694332 ) ) ( not ( = ?auto_694330 ?auto_694333 ) ) ( not ( = ?auto_694330 ?auto_694334 ) ) ( not ( = ?auto_694330 ?auto_694335 ) ) ( not ( = ?auto_694330 ?auto_694336 ) ) ( not ( = ?auto_694330 ?auto_694337 ) ) ( not ( = ?auto_694330 ?auto_694338 ) ) ( not ( = ?auto_694330 ?auto_694339 ) ) ( not ( = ?auto_694330 ?auto_694340 ) ) ( not ( = ?auto_694330 ?auto_694341 ) ) ( not ( = ?auto_694330 ?auto_694342 ) ) ( not ( = ?auto_694330 ?auto_694343 ) ) ( not ( = ?auto_694331 ?auto_694332 ) ) ( not ( = ?auto_694331 ?auto_694333 ) ) ( not ( = ?auto_694331 ?auto_694334 ) ) ( not ( = ?auto_694331 ?auto_694335 ) ) ( not ( = ?auto_694331 ?auto_694336 ) ) ( not ( = ?auto_694331 ?auto_694337 ) ) ( not ( = ?auto_694331 ?auto_694338 ) ) ( not ( = ?auto_694331 ?auto_694339 ) ) ( not ( = ?auto_694331 ?auto_694340 ) ) ( not ( = ?auto_694331 ?auto_694341 ) ) ( not ( = ?auto_694331 ?auto_694342 ) ) ( not ( = ?auto_694331 ?auto_694343 ) ) ( not ( = ?auto_694332 ?auto_694333 ) ) ( not ( = ?auto_694332 ?auto_694334 ) ) ( not ( = ?auto_694332 ?auto_694335 ) ) ( not ( = ?auto_694332 ?auto_694336 ) ) ( not ( = ?auto_694332 ?auto_694337 ) ) ( not ( = ?auto_694332 ?auto_694338 ) ) ( not ( = ?auto_694332 ?auto_694339 ) ) ( not ( = ?auto_694332 ?auto_694340 ) ) ( not ( = ?auto_694332 ?auto_694341 ) ) ( not ( = ?auto_694332 ?auto_694342 ) ) ( not ( = ?auto_694332 ?auto_694343 ) ) ( not ( = ?auto_694333 ?auto_694334 ) ) ( not ( = ?auto_694333 ?auto_694335 ) ) ( not ( = ?auto_694333 ?auto_694336 ) ) ( not ( = ?auto_694333 ?auto_694337 ) ) ( not ( = ?auto_694333 ?auto_694338 ) ) ( not ( = ?auto_694333 ?auto_694339 ) ) ( not ( = ?auto_694333 ?auto_694340 ) ) ( not ( = ?auto_694333 ?auto_694341 ) ) ( not ( = ?auto_694333 ?auto_694342 ) ) ( not ( = ?auto_694333 ?auto_694343 ) ) ( not ( = ?auto_694334 ?auto_694335 ) ) ( not ( = ?auto_694334 ?auto_694336 ) ) ( not ( = ?auto_694334 ?auto_694337 ) ) ( not ( = ?auto_694334 ?auto_694338 ) ) ( not ( = ?auto_694334 ?auto_694339 ) ) ( not ( = ?auto_694334 ?auto_694340 ) ) ( not ( = ?auto_694334 ?auto_694341 ) ) ( not ( = ?auto_694334 ?auto_694342 ) ) ( not ( = ?auto_694334 ?auto_694343 ) ) ( not ( = ?auto_694335 ?auto_694336 ) ) ( not ( = ?auto_694335 ?auto_694337 ) ) ( not ( = ?auto_694335 ?auto_694338 ) ) ( not ( = ?auto_694335 ?auto_694339 ) ) ( not ( = ?auto_694335 ?auto_694340 ) ) ( not ( = ?auto_694335 ?auto_694341 ) ) ( not ( = ?auto_694335 ?auto_694342 ) ) ( not ( = ?auto_694335 ?auto_694343 ) ) ( not ( = ?auto_694336 ?auto_694337 ) ) ( not ( = ?auto_694336 ?auto_694338 ) ) ( not ( = ?auto_694336 ?auto_694339 ) ) ( not ( = ?auto_694336 ?auto_694340 ) ) ( not ( = ?auto_694336 ?auto_694341 ) ) ( not ( = ?auto_694336 ?auto_694342 ) ) ( not ( = ?auto_694336 ?auto_694343 ) ) ( not ( = ?auto_694337 ?auto_694338 ) ) ( not ( = ?auto_694337 ?auto_694339 ) ) ( not ( = ?auto_694337 ?auto_694340 ) ) ( not ( = ?auto_694337 ?auto_694341 ) ) ( not ( = ?auto_694337 ?auto_694342 ) ) ( not ( = ?auto_694337 ?auto_694343 ) ) ( not ( = ?auto_694338 ?auto_694339 ) ) ( not ( = ?auto_694338 ?auto_694340 ) ) ( not ( = ?auto_694338 ?auto_694341 ) ) ( not ( = ?auto_694338 ?auto_694342 ) ) ( not ( = ?auto_694338 ?auto_694343 ) ) ( not ( = ?auto_694339 ?auto_694340 ) ) ( not ( = ?auto_694339 ?auto_694341 ) ) ( not ( = ?auto_694339 ?auto_694342 ) ) ( not ( = ?auto_694339 ?auto_694343 ) ) ( not ( = ?auto_694340 ?auto_694341 ) ) ( not ( = ?auto_694340 ?auto_694342 ) ) ( not ( = ?auto_694340 ?auto_694343 ) ) ( not ( = ?auto_694341 ?auto_694342 ) ) ( not ( = ?auto_694341 ?auto_694343 ) ) ( not ( = ?auto_694342 ?auto_694343 ) ) ( ON ?auto_694341 ?auto_694342 ) ( ON ?auto_694340 ?auto_694341 ) ( ON ?auto_694339 ?auto_694340 ) ( ON ?auto_694338 ?auto_694339 ) ( ON ?auto_694337 ?auto_694338 ) ( ON ?auto_694336 ?auto_694337 ) ( ON ?auto_694335 ?auto_694336 ) ( ON ?auto_694334 ?auto_694335 ) ( CLEAR ?auto_694332 ) ( ON ?auto_694333 ?auto_694334 ) ( CLEAR ?auto_694333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_694326 ?auto_694327 ?auto_694328 ?auto_694329 ?auto_694330 ?auto_694331 ?auto_694332 ?auto_694333 )
      ( MAKE-17PILE ?auto_694326 ?auto_694327 ?auto_694328 ?auto_694329 ?auto_694330 ?auto_694331 ?auto_694332 ?auto_694333 ?auto_694334 ?auto_694335 ?auto_694336 ?auto_694337 ?auto_694338 ?auto_694339 ?auto_694340 ?auto_694341 ?auto_694342 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694361 - BLOCK
      ?auto_694362 - BLOCK
      ?auto_694363 - BLOCK
      ?auto_694364 - BLOCK
      ?auto_694365 - BLOCK
      ?auto_694366 - BLOCK
      ?auto_694367 - BLOCK
      ?auto_694368 - BLOCK
      ?auto_694369 - BLOCK
      ?auto_694370 - BLOCK
      ?auto_694371 - BLOCK
      ?auto_694372 - BLOCK
      ?auto_694373 - BLOCK
      ?auto_694374 - BLOCK
      ?auto_694375 - BLOCK
      ?auto_694376 - BLOCK
      ?auto_694377 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_694377 ) ( ON-TABLE ?auto_694361 ) ( ON ?auto_694362 ?auto_694361 ) ( ON ?auto_694363 ?auto_694362 ) ( ON ?auto_694364 ?auto_694363 ) ( ON ?auto_694365 ?auto_694364 ) ( ON ?auto_694366 ?auto_694365 ) ( ON ?auto_694367 ?auto_694366 ) ( not ( = ?auto_694361 ?auto_694362 ) ) ( not ( = ?auto_694361 ?auto_694363 ) ) ( not ( = ?auto_694361 ?auto_694364 ) ) ( not ( = ?auto_694361 ?auto_694365 ) ) ( not ( = ?auto_694361 ?auto_694366 ) ) ( not ( = ?auto_694361 ?auto_694367 ) ) ( not ( = ?auto_694361 ?auto_694368 ) ) ( not ( = ?auto_694361 ?auto_694369 ) ) ( not ( = ?auto_694361 ?auto_694370 ) ) ( not ( = ?auto_694361 ?auto_694371 ) ) ( not ( = ?auto_694361 ?auto_694372 ) ) ( not ( = ?auto_694361 ?auto_694373 ) ) ( not ( = ?auto_694361 ?auto_694374 ) ) ( not ( = ?auto_694361 ?auto_694375 ) ) ( not ( = ?auto_694361 ?auto_694376 ) ) ( not ( = ?auto_694361 ?auto_694377 ) ) ( not ( = ?auto_694362 ?auto_694363 ) ) ( not ( = ?auto_694362 ?auto_694364 ) ) ( not ( = ?auto_694362 ?auto_694365 ) ) ( not ( = ?auto_694362 ?auto_694366 ) ) ( not ( = ?auto_694362 ?auto_694367 ) ) ( not ( = ?auto_694362 ?auto_694368 ) ) ( not ( = ?auto_694362 ?auto_694369 ) ) ( not ( = ?auto_694362 ?auto_694370 ) ) ( not ( = ?auto_694362 ?auto_694371 ) ) ( not ( = ?auto_694362 ?auto_694372 ) ) ( not ( = ?auto_694362 ?auto_694373 ) ) ( not ( = ?auto_694362 ?auto_694374 ) ) ( not ( = ?auto_694362 ?auto_694375 ) ) ( not ( = ?auto_694362 ?auto_694376 ) ) ( not ( = ?auto_694362 ?auto_694377 ) ) ( not ( = ?auto_694363 ?auto_694364 ) ) ( not ( = ?auto_694363 ?auto_694365 ) ) ( not ( = ?auto_694363 ?auto_694366 ) ) ( not ( = ?auto_694363 ?auto_694367 ) ) ( not ( = ?auto_694363 ?auto_694368 ) ) ( not ( = ?auto_694363 ?auto_694369 ) ) ( not ( = ?auto_694363 ?auto_694370 ) ) ( not ( = ?auto_694363 ?auto_694371 ) ) ( not ( = ?auto_694363 ?auto_694372 ) ) ( not ( = ?auto_694363 ?auto_694373 ) ) ( not ( = ?auto_694363 ?auto_694374 ) ) ( not ( = ?auto_694363 ?auto_694375 ) ) ( not ( = ?auto_694363 ?auto_694376 ) ) ( not ( = ?auto_694363 ?auto_694377 ) ) ( not ( = ?auto_694364 ?auto_694365 ) ) ( not ( = ?auto_694364 ?auto_694366 ) ) ( not ( = ?auto_694364 ?auto_694367 ) ) ( not ( = ?auto_694364 ?auto_694368 ) ) ( not ( = ?auto_694364 ?auto_694369 ) ) ( not ( = ?auto_694364 ?auto_694370 ) ) ( not ( = ?auto_694364 ?auto_694371 ) ) ( not ( = ?auto_694364 ?auto_694372 ) ) ( not ( = ?auto_694364 ?auto_694373 ) ) ( not ( = ?auto_694364 ?auto_694374 ) ) ( not ( = ?auto_694364 ?auto_694375 ) ) ( not ( = ?auto_694364 ?auto_694376 ) ) ( not ( = ?auto_694364 ?auto_694377 ) ) ( not ( = ?auto_694365 ?auto_694366 ) ) ( not ( = ?auto_694365 ?auto_694367 ) ) ( not ( = ?auto_694365 ?auto_694368 ) ) ( not ( = ?auto_694365 ?auto_694369 ) ) ( not ( = ?auto_694365 ?auto_694370 ) ) ( not ( = ?auto_694365 ?auto_694371 ) ) ( not ( = ?auto_694365 ?auto_694372 ) ) ( not ( = ?auto_694365 ?auto_694373 ) ) ( not ( = ?auto_694365 ?auto_694374 ) ) ( not ( = ?auto_694365 ?auto_694375 ) ) ( not ( = ?auto_694365 ?auto_694376 ) ) ( not ( = ?auto_694365 ?auto_694377 ) ) ( not ( = ?auto_694366 ?auto_694367 ) ) ( not ( = ?auto_694366 ?auto_694368 ) ) ( not ( = ?auto_694366 ?auto_694369 ) ) ( not ( = ?auto_694366 ?auto_694370 ) ) ( not ( = ?auto_694366 ?auto_694371 ) ) ( not ( = ?auto_694366 ?auto_694372 ) ) ( not ( = ?auto_694366 ?auto_694373 ) ) ( not ( = ?auto_694366 ?auto_694374 ) ) ( not ( = ?auto_694366 ?auto_694375 ) ) ( not ( = ?auto_694366 ?auto_694376 ) ) ( not ( = ?auto_694366 ?auto_694377 ) ) ( not ( = ?auto_694367 ?auto_694368 ) ) ( not ( = ?auto_694367 ?auto_694369 ) ) ( not ( = ?auto_694367 ?auto_694370 ) ) ( not ( = ?auto_694367 ?auto_694371 ) ) ( not ( = ?auto_694367 ?auto_694372 ) ) ( not ( = ?auto_694367 ?auto_694373 ) ) ( not ( = ?auto_694367 ?auto_694374 ) ) ( not ( = ?auto_694367 ?auto_694375 ) ) ( not ( = ?auto_694367 ?auto_694376 ) ) ( not ( = ?auto_694367 ?auto_694377 ) ) ( not ( = ?auto_694368 ?auto_694369 ) ) ( not ( = ?auto_694368 ?auto_694370 ) ) ( not ( = ?auto_694368 ?auto_694371 ) ) ( not ( = ?auto_694368 ?auto_694372 ) ) ( not ( = ?auto_694368 ?auto_694373 ) ) ( not ( = ?auto_694368 ?auto_694374 ) ) ( not ( = ?auto_694368 ?auto_694375 ) ) ( not ( = ?auto_694368 ?auto_694376 ) ) ( not ( = ?auto_694368 ?auto_694377 ) ) ( not ( = ?auto_694369 ?auto_694370 ) ) ( not ( = ?auto_694369 ?auto_694371 ) ) ( not ( = ?auto_694369 ?auto_694372 ) ) ( not ( = ?auto_694369 ?auto_694373 ) ) ( not ( = ?auto_694369 ?auto_694374 ) ) ( not ( = ?auto_694369 ?auto_694375 ) ) ( not ( = ?auto_694369 ?auto_694376 ) ) ( not ( = ?auto_694369 ?auto_694377 ) ) ( not ( = ?auto_694370 ?auto_694371 ) ) ( not ( = ?auto_694370 ?auto_694372 ) ) ( not ( = ?auto_694370 ?auto_694373 ) ) ( not ( = ?auto_694370 ?auto_694374 ) ) ( not ( = ?auto_694370 ?auto_694375 ) ) ( not ( = ?auto_694370 ?auto_694376 ) ) ( not ( = ?auto_694370 ?auto_694377 ) ) ( not ( = ?auto_694371 ?auto_694372 ) ) ( not ( = ?auto_694371 ?auto_694373 ) ) ( not ( = ?auto_694371 ?auto_694374 ) ) ( not ( = ?auto_694371 ?auto_694375 ) ) ( not ( = ?auto_694371 ?auto_694376 ) ) ( not ( = ?auto_694371 ?auto_694377 ) ) ( not ( = ?auto_694372 ?auto_694373 ) ) ( not ( = ?auto_694372 ?auto_694374 ) ) ( not ( = ?auto_694372 ?auto_694375 ) ) ( not ( = ?auto_694372 ?auto_694376 ) ) ( not ( = ?auto_694372 ?auto_694377 ) ) ( not ( = ?auto_694373 ?auto_694374 ) ) ( not ( = ?auto_694373 ?auto_694375 ) ) ( not ( = ?auto_694373 ?auto_694376 ) ) ( not ( = ?auto_694373 ?auto_694377 ) ) ( not ( = ?auto_694374 ?auto_694375 ) ) ( not ( = ?auto_694374 ?auto_694376 ) ) ( not ( = ?auto_694374 ?auto_694377 ) ) ( not ( = ?auto_694375 ?auto_694376 ) ) ( not ( = ?auto_694375 ?auto_694377 ) ) ( not ( = ?auto_694376 ?auto_694377 ) ) ( ON ?auto_694376 ?auto_694377 ) ( ON ?auto_694375 ?auto_694376 ) ( ON ?auto_694374 ?auto_694375 ) ( ON ?auto_694373 ?auto_694374 ) ( ON ?auto_694372 ?auto_694373 ) ( ON ?auto_694371 ?auto_694372 ) ( ON ?auto_694370 ?auto_694371 ) ( ON ?auto_694369 ?auto_694370 ) ( CLEAR ?auto_694367 ) ( ON ?auto_694368 ?auto_694369 ) ( CLEAR ?auto_694368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_694361 ?auto_694362 ?auto_694363 ?auto_694364 ?auto_694365 ?auto_694366 ?auto_694367 ?auto_694368 )
      ( MAKE-17PILE ?auto_694361 ?auto_694362 ?auto_694363 ?auto_694364 ?auto_694365 ?auto_694366 ?auto_694367 ?auto_694368 ?auto_694369 ?auto_694370 ?auto_694371 ?auto_694372 ?auto_694373 ?auto_694374 ?auto_694375 ?auto_694376 ?auto_694377 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694395 - BLOCK
      ?auto_694396 - BLOCK
      ?auto_694397 - BLOCK
      ?auto_694398 - BLOCK
      ?auto_694399 - BLOCK
      ?auto_694400 - BLOCK
      ?auto_694401 - BLOCK
      ?auto_694402 - BLOCK
      ?auto_694403 - BLOCK
      ?auto_694404 - BLOCK
      ?auto_694405 - BLOCK
      ?auto_694406 - BLOCK
      ?auto_694407 - BLOCK
      ?auto_694408 - BLOCK
      ?auto_694409 - BLOCK
      ?auto_694410 - BLOCK
      ?auto_694411 - BLOCK
    )
    :vars
    (
      ?auto_694412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694411 ?auto_694412 ) ( ON-TABLE ?auto_694395 ) ( ON ?auto_694396 ?auto_694395 ) ( ON ?auto_694397 ?auto_694396 ) ( ON ?auto_694398 ?auto_694397 ) ( ON ?auto_694399 ?auto_694398 ) ( ON ?auto_694400 ?auto_694399 ) ( not ( = ?auto_694395 ?auto_694396 ) ) ( not ( = ?auto_694395 ?auto_694397 ) ) ( not ( = ?auto_694395 ?auto_694398 ) ) ( not ( = ?auto_694395 ?auto_694399 ) ) ( not ( = ?auto_694395 ?auto_694400 ) ) ( not ( = ?auto_694395 ?auto_694401 ) ) ( not ( = ?auto_694395 ?auto_694402 ) ) ( not ( = ?auto_694395 ?auto_694403 ) ) ( not ( = ?auto_694395 ?auto_694404 ) ) ( not ( = ?auto_694395 ?auto_694405 ) ) ( not ( = ?auto_694395 ?auto_694406 ) ) ( not ( = ?auto_694395 ?auto_694407 ) ) ( not ( = ?auto_694395 ?auto_694408 ) ) ( not ( = ?auto_694395 ?auto_694409 ) ) ( not ( = ?auto_694395 ?auto_694410 ) ) ( not ( = ?auto_694395 ?auto_694411 ) ) ( not ( = ?auto_694395 ?auto_694412 ) ) ( not ( = ?auto_694396 ?auto_694397 ) ) ( not ( = ?auto_694396 ?auto_694398 ) ) ( not ( = ?auto_694396 ?auto_694399 ) ) ( not ( = ?auto_694396 ?auto_694400 ) ) ( not ( = ?auto_694396 ?auto_694401 ) ) ( not ( = ?auto_694396 ?auto_694402 ) ) ( not ( = ?auto_694396 ?auto_694403 ) ) ( not ( = ?auto_694396 ?auto_694404 ) ) ( not ( = ?auto_694396 ?auto_694405 ) ) ( not ( = ?auto_694396 ?auto_694406 ) ) ( not ( = ?auto_694396 ?auto_694407 ) ) ( not ( = ?auto_694396 ?auto_694408 ) ) ( not ( = ?auto_694396 ?auto_694409 ) ) ( not ( = ?auto_694396 ?auto_694410 ) ) ( not ( = ?auto_694396 ?auto_694411 ) ) ( not ( = ?auto_694396 ?auto_694412 ) ) ( not ( = ?auto_694397 ?auto_694398 ) ) ( not ( = ?auto_694397 ?auto_694399 ) ) ( not ( = ?auto_694397 ?auto_694400 ) ) ( not ( = ?auto_694397 ?auto_694401 ) ) ( not ( = ?auto_694397 ?auto_694402 ) ) ( not ( = ?auto_694397 ?auto_694403 ) ) ( not ( = ?auto_694397 ?auto_694404 ) ) ( not ( = ?auto_694397 ?auto_694405 ) ) ( not ( = ?auto_694397 ?auto_694406 ) ) ( not ( = ?auto_694397 ?auto_694407 ) ) ( not ( = ?auto_694397 ?auto_694408 ) ) ( not ( = ?auto_694397 ?auto_694409 ) ) ( not ( = ?auto_694397 ?auto_694410 ) ) ( not ( = ?auto_694397 ?auto_694411 ) ) ( not ( = ?auto_694397 ?auto_694412 ) ) ( not ( = ?auto_694398 ?auto_694399 ) ) ( not ( = ?auto_694398 ?auto_694400 ) ) ( not ( = ?auto_694398 ?auto_694401 ) ) ( not ( = ?auto_694398 ?auto_694402 ) ) ( not ( = ?auto_694398 ?auto_694403 ) ) ( not ( = ?auto_694398 ?auto_694404 ) ) ( not ( = ?auto_694398 ?auto_694405 ) ) ( not ( = ?auto_694398 ?auto_694406 ) ) ( not ( = ?auto_694398 ?auto_694407 ) ) ( not ( = ?auto_694398 ?auto_694408 ) ) ( not ( = ?auto_694398 ?auto_694409 ) ) ( not ( = ?auto_694398 ?auto_694410 ) ) ( not ( = ?auto_694398 ?auto_694411 ) ) ( not ( = ?auto_694398 ?auto_694412 ) ) ( not ( = ?auto_694399 ?auto_694400 ) ) ( not ( = ?auto_694399 ?auto_694401 ) ) ( not ( = ?auto_694399 ?auto_694402 ) ) ( not ( = ?auto_694399 ?auto_694403 ) ) ( not ( = ?auto_694399 ?auto_694404 ) ) ( not ( = ?auto_694399 ?auto_694405 ) ) ( not ( = ?auto_694399 ?auto_694406 ) ) ( not ( = ?auto_694399 ?auto_694407 ) ) ( not ( = ?auto_694399 ?auto_694408 ) ) ( not ( = ?auto_694399 ?auto_694409 ) ) ( not ( = ?auto_694399 ?auto_694410 ) ) ( not ( = ?auto_694399 ?auto_694411 ) ) ( not ( = ?auto_694399 ?auto_694412 ) ) ( not ( = ?auto_694400 ?auto_694401 ) ) ( not ( = ?auto_694400 ?auto_694402 ) ) ( not ( = ?auto_694400 ?auto_694403 ) ) ( not ( = ?auto_694400 ?auto_694404 ) ) ( not ( = ?auto_694400 ?auto_694405 ) ) ( not ( = ?auto_694400 ?auto_694406 ) ) ( not ( = ?auto_694400 ?auto_694407 ) ) ( not ( = ?auto_694400 ?auto_694408 ) ) ( not ( = ?auto_694400 ?auto_694409 ) ) ( not ( = ?auto_694400 ?auto_694410 ) ) ( not ( = ?auto_694400 ?auto_694411 ) ) ( not ( = ?auto_694400 ?auto_694412 ) ) ( not ( = ?auto_694401 ?auto_694402 ) ) ( not ( = ?auto_694401 ?auto_694403 ) ) ( not ( = ?auto_694401 ?auto_694404 ) ) ( not ( = ?auto_694401 ?auto_694405 ) ) ( not ( = ?auto_694401 ?auto_694406 ) ) ( not ( = ?auto_694401 ?auto_694407 ) ) ( not ( = ?auto_694401 ?auto_694408 ) ) ( not ( = ?auto_694401 ?auto_694409 ) ) ( not ( = ?auto_694401 ?auto_694410 ) ) ( not ( = ?auto_694401 ?auto_694411 ) ) ( not ( = ?auto_694401 ?auto_694412 ) ) ( not ( = ?auto_694402 ?auto_694403 ) ) ( not ( = ?auto_694402 ?auto_694404 ) ) ( not ( = ?auto_694402 ?auto_694405 ) ) ( not ( = ?auto_694402 ?auto_694406 ) ) ( not ( = ?auto_694402 ?auto_694407 ) ) ( not ( = ?auto_694402 ?auto_694408 ) ) ( not ( = ?auto_694402 ?auto_694409 ) ) ( not ( = ?auto_694402 ?auto_694410 ) ) ( not ( = ?auto_694402 ?auto_694411 ) ) ( not ( = ?auto_694402 ?auto_694412 ) ) ( not ( = ?auto_694403 ?auto_694404 ) ) ( not ( = ?auto_694403 ?auto_694405 ) ) ( not ( = ?auto_694403 ?auto_694406 ) ) ( not ( = ?auto_694403 ?auto_694407 ) ) ( not ( = ?auto_694403 ?auto_694408 ) ) ( not ( = ?auto_694403 ?auto_694409 ) ) ( not ( = ?auto_694403 ?auto_694410 ) ) ( not ( = ?auto_694403 ?auto_694411 ) ) ( not ( = ?auto_694403 ?auto_694412 ) ) ( not ( = ?auto_694404 ?auto_694405 ) ) ( not ( = ?auto_694404 ?auto_694406 ) ) ( not ( = ?auto_694404 ?auto_694407 ) ) ( not ( = ?auto_694404 ?auto_694408 ) ) ( not ( = ?auto_694404 ?auto_694409 ) ) ( not ( = ?auto_694404 ?auto_694410 ) ) ( not ( = ?auto_694404 ?auto_694411 ) ) ( not ( = ?auto_694404 ?auto_694412 ) ) ( not ( = ?auto_694405 ?auto_694406 ) ) ( not ( = ?auto_694405 ?auto_694407 ) ) ( not ( = ?auto_694405 ?auto_694408 ) ) ( not ( = ?auto_694405 ?auto_694409 ) ) ( not ( = ?auto_694405 ?auto_694410 ) ) ( not ( = ?auto_694405 ?auto_694411 ) ) ( not ( = ?auto_694405 ?auto_694412 ) ) ( not ( = ?auto_694406 ?auto_694407 ) ) ( not ( = ?auto_694406 ?auto_694408 ) ) ( not ( = ?auto_694406 ?auto_694409 ) ) ( not ( = ?auto_694406 ?auto_694410 ) ) ( not ( = ?auto_694406 ?auto_694411 ) ) ( not ( = ?auto_694406 ?auto_694412 ) ) ( not ( = ?auto_694407 ?auto_694408 ) ) ( not ( = ?auto_694407 ?auto_694409 ) ) ( not ( = ?auto_694407 ?auto_694410 ) ) ( not ( = ?auto_694407 ?auto_694411 ) ) ( not ( = ?auto_694407 ?auto_694412 ) ) ( not ( = ?auto_694408 ?auto_694409 ) ) ( not ( = ?auto_694408 ?auto_694410 ) ) ( not ( = ?auto_694408 ?auto_694411 ) ) ( not ( = ?auto_694408 ?auto_694412 ) ) ( not ( = ?auto_694409 ?auto_694410 ) ) ( not ( = ?auto_694409 ?auto_694411 ) ) ( not ( = ?auto_694409 ?auto_694412 ) ) ( not ( = ?auto_694410 ?auto_694411 ) ) ( not ( = ?auto_694410 ?auto_694412 ) ) ( not ( = ?auto_694411 ?auto_694412 ) ) ( ON ?auto_694410 ?auto_694411 ) ( ON ?auto_694409 ?auto_694410 ) ( ON ?auto_694408 ?auto_694409 ) ( ON ?auto_694407 ?auto_694408 ) ( ON ?auto_694406 ?auto_694407 ) ( ON ?auto_694405 ?auto_694406 ) ( ON ?auto_694404 ?auto_694405 ) ( ON ?auto_694403 ?auto_694404 ) ( ON ?auto_694402 ?auto_694403 ) ( CLEAR ?auto_694400 ) ( ON ?auto_694401 ?auto_694402 ) ( CLEAR ?auto_694401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_694395 ?auto_694396 ?auto_694397 ?auto_694398 ?auto_694399 ?auto_694400 ?auto_694401 )
      ( MAKE-17PILE ?auto_694395 ?auto_694396 ?auto_694397 ?auto_694398 ?auto_694399 ?auto_694400 ?auto_694401 ?auto_694402 ?auto_694403 ?auto_694404 ?auto_694405 ?auto_694406 ?auto_694407 ?auto_694408 ?auto_694409 ?auto_694410 ?auto_694411 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694430 - BLOCK
      ?auto_694431 - BLOCK
      ?auto_694432 - BLOCK
      ?auto_694433 - BLOCK
      ?auto_694434 - BLOCK
      ?auto_694435 - BLOCK
      ?auto_694436 - BLOCK
      ?auto_694437 - BLOCK
      ?auto_694438 - BLOCK
      ?auto_694439 - BLOCK
      ?auto_694440 - BLOCK
      ?auto_694441 - BLOCK
      ?auto_694442 - BLOCK
      ?auto_694443 - BLOCK
      ?auto_694444 - BLOCK
      ?auto_694445 - BLOCK
      ?auto_694446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_694446 ) ( ON-TABLE ?auto_694430 ) ( ON ?auto_694431 ?auto_694430 ) ( ON ?auto_694432 ?auto_694431 ) ( ON ?auto_694433 ?auto_694432 ) ( ON ?auto_694434 ?auto_694433 ) ( ON ?auto_694435 ?auto_694434 ) ( not ( = ?auto_694430 ?auto_694431 ) ) ( not ( = ?auto_694430 ?auto_694432 ) ) ( not ( = ?auto_694430 ?auto_694433 ) ) ( not ( = ?auto_694430 ?auto_694434 ) ) ( not ( = ?auto_694430 ?auto_694435 ) ) ( not ( = ?auto_694430 ?auto_694436 ) ) ( not ( = ?auto_694430 ?auto_694437 ) ) ( not ( = ?auto_694430 ?auto_694438 ) ) ( not ( = ?auto_694430 ?auto_694439 ) ) ( not ( = ?auto_694430 ?auto_694440 ) ) ( not ( = ?auto_694430 ?auto_694441 ) ) ( not ( = ?auto_694430 ?auto_694442 ) ) ( not ( = ?auto_694430 ?auto_694443 ) ) ( not ( = ?auto_694430 ?auto_694444 ) ) ( not ( = ?auto_694430 ?auto_694445 ) ) ( not ( = ?auto_694430 ?auto_694446 ) ) ( not ( = ?auto_694431 ?auto_694432 ) ) ( not ( = ?auto_694431 ?auto_694433 ) ) ( not ( = ?auto_694431 ?auto_694434 ) ) ( not ( = ?auto_694431 ?auto_694435 ) ) ( not ( = ?auto_694431 ?auto_694436 ) ) ( not ( = ?auto_694431 ?auto_694437 ) ) ( not ( = ?auto_694431 ?auto_694438 ) ) ( not ( = ?auto_694431 ?auto_694439 ) ) ( not ( = ?auto_694431 ?auto_694440 ) ) ( not ( = ?auto_694431 ?auto_694441 ) ) ( not ( = ?auto_694431 ?auto_694442 ) ) ( not ( = ?auto_694431 ?auto_694443 ) ) ( not ( = ?auto_694431 ?auto_694444 ) ) ( not ( = ?auto_694431 ?auto_694445 ) ) ( not ( = ?auto_694431 ?auto_694446 ) ) ( not ( = ?auto_694432 ?auto_694433 ) ) ( not ( = ?auto_694432 ?auto_694434 ) ) ( not ( = ?auto_694432 ?auto_694435 ) ) ( not ( = ?auto_694432 ?auto_694436 ) ) ( not ( = ?auto_694432 ?auto_694437 ) ) ( not ( = ?auto_694432 ?auto_694438 ) ) ( not ( = ?auto_694432 ?auto_694439 ) ) ( not ( = ?auto_694432 ?auto_694440 ) ) ( not ( = ?auto_694432 ?auto_694441 ) ) ( not ( = ?auto_694432 ?auto_694442 ) ) ( not ( = ?auto_694432 ?auto_694443 ) ) ( not ( = ?auto_694432 ?auto_694444 ) ) ( not ( = ?auto_694432 ?auto_694445 ) ) ( not ( = ?auto_694432 ?auto_694446 ) ) ( not ( = ?auto_694433 ?auto_694434 ) ) ( not ( = ?auto_694433 ?auto_694435 ) ) ( not ( = ?auto_694433 ?auto_694436 ) ) ( not ( = ?auto_694433 ?auto_694437 ) ) ( not ( = ?auto_694433 ?auto_694438 ) ) ( not ( = ?auto_694433 ?auto_694439 ) ) ( not ( = ?auto_694433 ?auto_694440 ) ) ( not ( = ?auto_694433 ?auto_694441 ) ) ( not ( = ?auto_694433 ?auto_694442 ) ) ( not ( = ?auto_694433 ?auto_694443 ) ) ( not ( = ?auto_694433 ?auto_694444 ) ) ( not ( = ?auto_694433 ?auto_694445 ) ) ( not ( = ?auto_694433 ?auto_694446 ) ) ( not ( = ?auto_694434 ?auto_694435 ) ) ( not ( = ?auto_694434 ?auto_694436 ) ) ( not ( = ?auto_694434 ?auto_694437 ) ) ( not ( = ?auto_694434 ?auto_694438 ) ) ( not ( = ?auto_694434 ?auto_694439 ) ) ( not ( = ?auto_694434 ?auto_694440 ) ) ( not ( = ?auto_694434 ?auto_694441 ) ) ( not ( = ?auto_694434 ?auto_694442 ) ) ( not ( = ?auto_694434 ?auto_694443 ) ) ( not ( = ?auto_694434 ?auto_694444 ) ) ( not ( = ?auto_694434 ?auto_694445 ) ) ( not ( = ?auto_694434 ?auto_694446 ) ) ( not ( = ?auto_694435 ?auto_694436 ) ) ( not ( = ?auto_694435 ?auto_694437 ) ) ( not ( = ?auto_694435 ?auto_694438 ) ) ( not ( = ?auto_694435 ?auto_694439 ) ) ( not ( = ?auto_694435 ?auto_694440 ) ) ( not ( = ?auto_694435 ?auto_694441 ) ) ( not ( = ?auto_694435 ?auto_694442 ) ) ( not ( = ?auto_694435 ?auto_694443 ) ) ( not ( = ?auto_694435 ?auto_694444 ) ) ( not ( = ?auto_694435 ?auto_694445 ) ) ( not ( = ?auto_694435 ?auto_694446 ) ) ( not ( = ?auto_694436 ?auto_694437 ) ) ( not ( = ?auto_694436 ?auto_694438 ) ) ( not ( = ?auto_694436 ?auto_694439 ) ) ( not ( = ?auto_694436 ?auto_694440 ) ) ( not ( = ?auto_694436 ?auto_694441 ) ) ( not ( = ?auto_694436 ?auto_694442 ) ) ( not ( = ?auto_694436 ?auto_694443 ) ) ( not ( = ?auto_694436 ?auto_694444 ) ) ( not ( = ?auto_694436 ?auto_694445 ) ) ( not ( = ?auto_694436 ?auto_694446 ) ) ( not ( = ?auto_694437 ?auto_694438 ) ) ( not ( = ?auto_694437 ?auto_694439 ) ) ( not ( = ?auto_694437 ?auto_694440 ) ) ( not ( = ?auto_694437 ?auto_694441 ) ) ( not ( = ?auto_694437 ?auto_694442 ) ) ( not ( = ?auto_694437 ?auto_694443 ) ) ( not ( = ?auto_694437 ?auto_694444 ) ) ( not ( = ?auto_694437 ?auto_694445 ) ) ( not ( = ?auto_694437 ?auto_694446 ) ) ( not ( = ?auto_694438 ?auto_694439 ) ) ( not ( = ?auto_694438 ?auto_694440 ) ) ( not ( = ?auto_694438 ?auto_694441 ) ) ( not ( = ?auto_694438 ?auto_694442 ) ) ( not ( = ?auto_694438 ?auto_694443 ) ) ( not ( = ?auto_694438 ?auto_694444 ) ) ( not ( = ?auto_694438 ?auto_694445 ) ) ( not ( = ?auto_694438 ?auto_694446 ) ) ( not ( = ?auto_694439 ?auto_694440 ) ) ( not ( = ?auto_694439 ?auto_694441 ) ) ( not ( = ?auto_694439 ?auto_694442 ) ) ( not ( = ?auto_694439 ?auto_694443 ) ) ( not ( = ?auto_694439 ?auto_694444 ) ) ( not ( = ?auto_694439 ?auto_694445 ) ) ( not ( = ?auto_694439 ?auto_694446 ) ) ( not ( = ?auto_694440 ?auto_694441 ) ) ( not ( = ?auto_694440 ?auto_694442 ) ) ( not ( = ?auto_694440 ?auto_694443 ) ) ( not ( = ?auto_694440 ?auto_694444 ) ) ( not ( = ?auto_694440 ?auto_694445 ) ) ( not ( = ?auto_694440 ?auto_694446 ) ) ( not ( = ?auto_694441 ?auto_694442 ) ) ( not ( = ?auto_694441 ?auto_694443 ) ) ( not ( = ?auto_694441 ?auto_694444 ) ) ( not ( = ?auto_694441 ?auto_694445 ) ) ( not ( = ?auto_694441 ?auto_694446 ) ) ( not ( = ?auto_694442 ?auto_694443 ) ) ( not ( = ?auto_694442 ?auto_694444 ) ) ( not ( = ?auto_694442 ?auto_694445 ) ) ( not ( = ?auto_694442 ?auto_694446 ) ) ( not ( = ?auto_694443 ?auto_694444 ) ) ( not ( = ?auto_694443 ?auto_694445 ) ) ( not ( = ?auto_694443 ?auto_694446 ) ) ( not ( = ?auto_694444 ?auto_694445 ) ) ( not ( = ?auto_694444 ?auto_694446 ) ) ( not ( = ?auto_694445 ?auto_694446 ) ) ( ON ?auto_694445 ?auto_694446 ) ( ON ?auto_694444 ?auto_694445 ) ( ON ?auto_694443 ?auto_694444 ) ( ON ?auto_694442 ?auto_694443 ) ( ON ?auto_694441 ?auto_694442 ) ( ON ?auto_694440 ?auto_694441 ) ( ON ?auto_694439 ?auto_694440 ) ( ON ?auto_694438 ?auto_694439 ) ( ON ?auto_694437 ?auto_694438 ) ( CLEAR ?auto_694435 ) ( ON ?auto_694436 ?auto_694437 ) ( CLEAR ?auto_694436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_694430 ?auto_694431 ?auto_694432 ?auto_694433 ?auto_694434 ?auto_694435 ?auto_694436 )
      ( MAKE-17PILE ?auto_694430 ?auto_694431 ?auto_694432 ?auto_694433 ?auto_694434 ?auto_694435 ?auto_694436 ?auto_694437 ?auto_694438 ?auto_694439 ?auto_694440 ?auto_694441 ?auto_694442 ?auto_694443 ?auto_694444 ?auto_694445 ?auto_694446 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694464 - BLOCK
      ?auto_694465 - BLOCK
      ?auto_694466 - BLOCK
      ?auto_694467 - BLOCK
      ?auto_694468 - BLOCK
      ?auto_694469 - BLOCK
      ?auto_694470 - BLOCK
      ?auto_694471 - BLOCK
      ?auto_694472 - BLOCK
      ?auto_694473 - BLOCK
      ?auto_694474 - BLOCK
      ?auto_694475 - BLOCK
      ?auto_694476 - BLOCK
      ?auto_694477 - BLOCK
      ?auto_694478 - BLOCK
      ?auto_694479 - BLOCK
      ?auto_694480 - BLOCK
    )
    :vars
    (
      ?auto_694481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694480 ?auto_694481 ) ( ON-TABLE ?auto_694464 ) ( ON ?auto_694465 ?auto_694464 ) ( ON ?auto_694466 ?auto_694465 ) ( ON ?auto_694467 ?auto_694466 ) ( ON ?auto_694468 ?auto_694467 ) ( not ( = ?auto_694464 ?auto_694465 ) ) ( not ( = ?auto_694464 ?auto_694466 ) ) ( not ( = ?auto_694464 ?auto_694467 ) ) ( not ( = ?auto_694464 ?auto_694468 ) ) ( not ( = ?auto_694464 ?auto_694469 ) ) ( not ( = ?auto_694464 ?auto_694470 ) ) ( not ( = ?auto_694464 ?auto_694471 ) ) ( not ( = ?auto_694464 ?auto_694472 ) ) ( not ( = ?auto_694464 ?auto_694473 ) ) ( not ( = ?auto_694464 ?auto_694474 ) ) ( not ( = ?auto_694464 ?auto_694475 ) ) ( not ( = ?auto_694464 ?auto_694476 ) ) ( not ( = ?auto_694464 ?auto_694477 ) ) ( not ( = ?auto_694464 ?auto_694478 ) ) ( not ( = ?auto_694464 ?auto_694479 ) ) ( not ( = ?auto_694464 ?auto_694480 ) ) ( not ( = ?auto_694464 ?auto_694481 ) ) ( not ( = ?auto_694465 ?auto_694466 ) ) ( not ( = ?auto_694465 ?auto_694467 ) ) ( not ( = ?auto_694465 ?auto_694468 ) ) ( not ( = ?auto_694465 ?auto_694469 ) ) ( not ( = ?auto_694465 ?auto_694470 ) ) ( not ( = ?auto_694465 ?auto_694471 ) ) ( not ( = ?auto_694465 ?auto_694472 ) ) ( not ( = ?auto_694465 ?auto_694473 ) ) ( not ( = ?auto_694465 ?auto_694474 ) ) ( not ( = ?auto_694465 ?auto_694475 ) ) ( not ( = ?auto_694465 ?auto_694476 ) ) ( not ( = ?auto_694465 ?auto_694477 ) ) ( not ( = ?auto_694465 ?auto_694478 ) ) ( not ( = ?auto_694465 ?auto_694479 ) ) ( not ( = ?auto_694465 ?auto_694480 ) ) ( not ( = ?auto_694465 ?auto_694481 ) ) ( not ( = ?auto_694466 ?auto_694467 ) ) ( not ( = ?auto_694466 ?auto_694468 ) ) ( not ( = ?auto_694466 ?auto_694469 ) ) ( not ( = ?auto_694466 ?auto_694470 ) ) ( not ( = ?auto_694466 ?auto_694471 ) ) ( not ( = ?auto_694466 ?auto_694472 ) ) ( not ( = ?auto_694466 ?auto_694473 ) ) ( not ( = ?auto_694466 ?auto_694474 ) ) ( not ( = ?auto_694466 ?auto_694475 ) ) ( not ( = ?auto_694466 ?auto_694476 ) ) ( not ( = ?auto_694466 ?auto_694477 ) ) ( not ( = ?auto_694466 ?auto_694478 ) ) ( not ( = ?auto_694466 ?auto_694479 ) ) ( not ( = ?auto_694466 ?auto_694480 ) ) ( not ( = ?auto_694466 ?auto_694481 ) ) ( not ( = ?auto_694467 ?auto_694468 ) ) ( not ( = ?auto_694467 ?auto_694469 ) ) ( not ( = ?auto_694467 ?auto_694470 ) ) ( not ( = ?auto_694467 ?auto_694471 ) ) ( not ( = ?auto_694467 ?auto_694472 ) ) ( not ( = ?auto_694467 ?auto_694473 ) ) ( not ( = ?auto_694467 ?auto_694474 ) ) ( not ( = ?auto_694467 ?auto_694475 ) ) ( not ( = ?auto_694467 ?auto_694476 ) ) ( not ( = ?auto_694467 ?auto_694477 ) ) ( not ( = ?auto_694467 ?auto_694478 ) ) ( not ( = ?auto_694467 ?auto_694479 ) ) ( not ( = ?auto_694467 ?auto_694480 ) ) ( not ( = ?auto_694467 ?auto_694481 ) ) ( not ( = ?auto_694468 ?auto_694469 ) ) ( not ( = ?auto_694468 ?auto_694470 ) ) ( not ( = ?auto_694468 ?auto_694471 ) ) ( not ( = ?auto_694468 ?auto_694472 ) ) ( not ( = ?auto_694468 ?auto_694473 ) ) ( not ( = ?auto_694468 ?auto_694474 ) ) ( not ( = ?auto_694468 ?auto_694475 ) ) ( not ( = ?auto_694468 ?auto_694476 ) ) ( not ( = ?auto_694468 ?auto_694477 ) ) ( not ( = ?auto_694468 ?auto_694478 ) ) ( not ( = ?auto_694468 ?auto_694479 ) ) ( not ( = ?auto_694468 ?auto_694480 ) ) ( not ( = ?auto_694468 ?auto_694481 ) ) ( not ( = ?auto_694469 ?auto_694470 ) ) ( not ( = ?auto_694469 ?auto_694471 ) ) ( not ( = ?auto_694469 ?auto_694472 ) ) ( not ( = ?auto_694469 ?auto_694473 ) ) ( not ( = ?auto_694469 ?auto_694474 ) ) ( not ( = ?auto_694469 ?auto_694475 ) ) ( not ( = ?auto_694469 ?auto_694476 ) ) ( not ( = ?auto_694469 ?auto_694477 ) ) ( not ( = ?auto_694469 ?auto_694478 ) ) ( not ( = ?auto_694469 ?auto_694479 ) ) ( not ( = ?auto_694469 ?auto_694480 ) ) ( not ( = ?auto_694469 ?auto_694481 ) ) ( not ( = ?auto_694470 ?auto_694471 ) ) ( not ( = ?auto_694470 ?auto_694472 ) ) ( not ( = ?auto_694470 ?auto_694473 ) ) ( not ( = ?auto_694470 ?auto_694474 ) ) ( not ( = ?auto_694470 ?auto_694475 ) ) ( not ( = ?auto_694470 ?auto_694476 ) ) ( not ( = ?auto_694470 ?auto_694477 ) ) ( not ( = ?auto_694470 ?auto_694478 ) ) ( not ( = ?auto_694470 ?auto_694479 ) ) ( not ( = ?auto_694470 ?auto_694480 ) ) ( not ( = ?auto_694470 ?auto_694481 ) ) ( not ( = ?auto_694471 ?auto_694472 ) ) ( not ( = ?auto_694471 ?auto_694473 ) ) ( not ( = ?auto_694471 ?auto_694474 ) ) ( not ( = ?auto_694471 ?auto_694475 ) ) ( not ( = ?auto_694471 ?auto_694476 ) ) ( not ( = ?auto_694471 ?auto_694477 ) ) ( not ( = ?auto_694471 ?auto_694478 ) ) ( not ( = ?auto_694471 ?auto_694479 ) ) ( not ( = ?auto_694471 ?auto_694480 ) ) ( not ( = ?auto_694471 ?auto_694481 ) ) ( not ( = ?auto_694472 ?auto_694473 ) ) ( not ( = ?auto_694472 ?auto_694474 ) ) ( not ( = ?auto_694472 ?auto_694475 ) ) ( not ( = ?auto_694472 ?auto_694476 ) ) ( not ( = ?auto_694472 ?auto_694477 ) ) ( not ( = ?auto_694472 ?auto_694478 ) ) ( not ( = ?auto_694472 ?auto_694479 ) ) ( not ( = ?auto_694472 ?auto_694480 ) ) ( not ( = ?auto_694472 ?auto_694481 ) ) ( not ( = ?auto_694473 ?auto_694474 ) ) ( not ( = ?auto_694473 ?auto_694475 ) ) ( not ( = ?auto_694473 ?auto_694476 ) ) ( not ( = ?auto_694473 ?auto_694477 ) ) ( not ( = ?auto_694473 ?auto_694478 ) ) ( not ( = ?auto_694473 ?auto_694479 ) ) ( not ( = ?auto_694473 ?auto_694480 ) ) ( not ( = ?auto_694473 ?auto_694481 ) ) ( not ( = ?auto_694474 ?auto_694475 ) ) ( not ( = ?auto_694474 ?auto_694476 ) ) ( not ( = ?auto_694474 ?auto_694477 ) ) ( not ( = ?auto_694474 ?auto_694478 ) ) ( not ( = ?auto_694474 ?auto_694479 ) ) ( not ( = ?auto_694474 ?auto_694480 ) ) ( not ( = ?auto_694474 ?auto_694481 ) ) ( not ( = ?auto_694475 ?auto_694476 ) ) ( not ( = ?auto_694475 ?auto_694477 ) ) ( not ( = ?auto_694475 ?auto_694478 ) ) ( not ( = ?auto_694475 ?auto_694479 ) ) ( not ( = ?auto_694475 ?auto_694480 ) ) ( not ( = ?auto_694475 ?auto_694481 ) ) ( not ( = ?auto_694476 ?auto_694477 ) ) ( not ( = ?auto_694476 ?auto_694478 ) ) ( not ( = ?auto_694476 ?auto_694479 ) ) ( not ( = ?auto_694476 ?auto_694480 ) ) ( not ( = ?auto_694476 ?auto_694481 ) ) ( not ( = ?auto_694477 ?auto_694478 ) ) ( not ( = ?auto_694477 ?auto_694479 ) ) ( not ( = ?auto_694477 ?auto_694480 ) ) ( not ( = ?auto_694477 ?auto_694481 ) ) ( not ( = ?auto_694478 ?auto_694479 ) ) ( not ( = ?auto_694478 ?auto_694480 ) ) ( not ( = ?auto_694478 ?auto_694481 ) ) ( not ( = ?auto_694479 ?auto_694480 ) ) ( not ( = ?auto_694479 ?auto_694481 ) ) ( not ( = ?auto_694480 ?auto_694481 ) ) ( ON ?auto_694479 ?auto_694480 ) ( ON ?auto_694478 ?auto_694479 ) ( ON ?auto_694477 ?auto_694478 ) ( ON ?auto_694476 ?auto_694477 ) ( ON ?auto_694475 ?auto_694476 ) ( ON ?auto_694474 ?auto_694475 ) ( ON ?auto_694473 ?auto_694474 ) ( ON ?auto_694472 ?auto_694473 ) ( ON ?auto_694471 ?auto_694472 ) ( ON ?auto_694470 ?auto_694471 ) ( CLEAR ?auto_694468 ) ( ON ?auto_694469 ?auto_694470 ) ( CLEAR ?auto_694469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_694464 ?auto_694465 ?auto_694466 ?auto_694467 ?auto_694468 ?auto_694469 )
      ( MAKE-17PILE ?auto_694464 ?auto_694465 ?auto_694466 ?auto_694467 ?auto_694468 ?auto_694469 ?auto_694470 ?auto_694471 ?auto_694472 ?auto_694473 ?auto_694474 ?auto_694475 ?auto_694476 ?auto_694477 ?auto_694478 ?auto_694479 ?auto_694480 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694499 - BLOCK
      ?auto_694500 - BLOCK
      ?auto_694501 - BLOCK
      ?auto_694502 - BLOCK
      ?auto_694503 - BLOCK
      ?auto_694504 - BLOCK
      ?auto_694505 - BLOCK
      ?auto_694506 - BLOCK
      ?auto_694507 - BLOCK
      ?auto_694508 - BLOCK
      ?auto_694509 - BLOCK
      ?auto_694510 - BLOCK
      ?auto_694511 - BLOCK
      ?auto_694512 - BLOCK
      ?auto_694513 - BLOCK
      ?auto_694514 - BLOCK
      ?auto_694515 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_694515 ) ( ON-TABLE ?auto_694499 ) ( ON ?auto_694500 ?auto_694499 ) ( ON ?auto_694501 ?auto_694500 ) ( ON ?auto_694502 ?auto_694501 ) ( ON ?auto_694503 ?auto_694502 ) ( not ( = ?auto_694499 ?auto_694500 ) ) ( not ( = ?auto_694499 ?auto_694501 ) ) ( not ( = ?auto_694499 ?auto_694502 ) ) ( not ( = ?auto_694499 ?auto_694503 ) ) ( not ( = ?auto_694499 ?auto_694504 ) ) ( not ( = ?auto_694499 ?auto_694505 ) ) ( not ( = ?auto_694499 ?auto_694506 ) ) ( not ( = ?auto_694499 ?auto_694507 ) ) ( not ( = ?auto_694499 ?auto_694508 ) ) ( not ( = ?auto_694499 ?auto_694509 ) ) ( not ( = ?auto_694499 ?auto_694510 ) ) ( not ( = ?auto_694499 ?auto_694511 ) ) ( not ( = ?auto_694499 ?auto_694512 ) ) ( not ( = ?auto_694499 ?auto_694513 ) ) ( not ( = ?auto_694499 ?auto_694514 ) ) ( not ( = ?auto_694499 ?auto_694515 ) ) ( not ( = ?auto_694500 ?auto_694501 ) ) ( not ( = ?auto_694500 ?auto_694502 ) ) ( not ( = ?auto_694500 ?auto_694503 ) ) ( not ( = ?auto_694500 ?auto_694504 ) ) ( not ( = ?auto_694500 ?auto_694505 ) ) ( not ( = ?auto_694500 ?auto_694506 ) ) ( not ( = ?auto_694500 ?auto_694507 ) ) ( not ( = ?auto_694500 ?auto_694508 ) ) ( not ( = ?auto_694500 ?auto_694509 ) ) ( not ( = ?auto_694500 ?auto_694510 ) ) ( not ( = ?auto_694500 ?auto_694511 ) ) ( not ( = ?auto_694500 ?auto_694512 ) ) ( not ( = ?auto_694500 ?auto_694513 ) ) ( not ( = ?auto_694500 ?auto_694514 ) ) ( not ( = ?auto_694500 ?auto_694515 ) ) ( not ( = ?auto_694501 ?auto_694502 ) ) ( not ( = ?auto_694501 ?auto_694503 ) ) ( not ( = ?auto_694501 ?auto_694504 ) ) ( not ( = ?auto_694501 ?auto_694505 ) ) ( not ( = ?auto_694501 ?auto_694506 ) ) ( not ( = ?auto_694501 ?auto_694507 ) ) ( not ( = ?auto_694501 ?auto_694508 ) ) ( not ( = ?auto_694501 ?auto_694509 ) ) ( not ( = ?auto_694501 ?auto_694510 ) ) ( not ( = ?auto_694501 ?auto_694511 ) ) ( not ( = ?auto_694501 ?auto_694512 ) ) ( not ( = ?auto_694501 ?auto_694513 ) ) ( not ( = ?auto_694501 ?auto_694514 ) ) ( not ( = ?auto_694501 ?auto_694515 ) ) ( not ( = ?auto_694502 ?auto_694503 ) ) ( not ( = ?auto_694502 ?auto_694504 ) ) ( not ( = ?auto_694502 ?auto_694505 ) ) ( not ( = ?auto_694502 ?auto_694506 ) ) ( not ( = ?auto_694502 ?auto_694507 ) ) ( not ( = ?auto_694502 ?auto_694508 ) ) ( not ( = ?auto_694502 ?auto_694509 ) ) ( not ( = ?auto_694502 ?auto_694510 ) ) ( not ( = ?auto_694502 ?auto_694511 ) ) ( not ( = ?auto_694502 ?auto_694512 ) ) ( not ( = ?auto_694502 ?auto_694513 ) ) ( not ( = ?auto_694502 ?auto_694514 ) ) ( not ( = ?auto_694502 ?auto_694515 ) ) ( not ( = ?auto_694503 ?auto_694504 ) ) ( not ( = ?auto_694503 ?auto_694505 ) ) ( not ( = ?auto_694503 ?auto_694506 ) ) ( not ( = ?auto_694503 ?auto_694507 ) ) ( not ( = ?auto_694503 ?auto_694508 ) ) ( not ( = ?auto_694503 ?auto_694509 ) ) ( not ( = ?auto_694503 ?auto_694510 ) ) ( not ( = ?auto_694503 ?auto_694511 ) ) ( not ( = ?auto_694503 ?auto_694512 ) ) ( not ( = ?auto_694503 ?auto_694513 ) ) ( not ( = ?auto_694503 ?auto_694514 ) ) ( not ( = ?auto_694503 ?auto_694515 ) ) ( not ( = ?auto_694504 ?auto_694505 ) ) ( not ( = ?auto_694504 ?auto_694506 ) ) ( not ( = ?auto_694504 ?auto_694507 ) ) ( not ( = ?auto_694504 ?auto_694508 ) ) ( not ( = ?auto_694504 ?auto_694509 ) ) ( not ( = ?auto_694504 ?auto_694510 ) ) ( not ( = ?auto_694504 ?auto_694511 ) ) ( not ( = ?auto_694504 ?auto_694512 ) ) ( not ( = ?auto_694504 ?auto_694513 ) ) ( not ( = ?auto_694504 ?auto_694514 ) ) ( not ( = ?auto_694504 ?auto_694515 ) ) ( not ( = ?auto_694505 ?auto_694506 ) ) ( not ( = ?auto_694505 ?auto_694507 ) ) ( not ( = ?auto_694505 ?auto_694508 ) ) ( not ( = ?auto_694505 ?auto_694509 ) ) ( not ( = ?auto_694505 ?auto_694510 ) ) ( not ( = ?auto_694505 ?auto_694511 ) ) ( not ( = ?auto_694505 ?auto_694512 ) ) ( not ( = ?auto_694505 ?auto_694513 ) ) ( not ( = ?auto_694505 ?auto_694514 ) ) ( not ( = ?auto_694505 ?auto_694515 ) ) ( not ( = ?auto_694506 ?auto_694507 ) ) ( not ( = ?auto_694506 ?auto_694508 ) ) ( not ( = ?auto_694506 ?auto_694509 ) ) ( not ( = ?auto_694506 ?auto_694510 ) ) ( not ( = ?auto_694506 ?auto_694511 ) ) ( not ( = ?auto_694506 ?auto_694512 ) ) ( not ( = ?auto_694506 ?auto_694513 ) ) ( not ( = ?auto_694506 ?auto_694514 ) ) ( not ( = ?auto_694506 ?auto_694515 ) ) ( not ( = ?auto_694507 ?auto_694508 ) ) ( not ( = ?auto_694507 ?auto_694509 ) ) ( not ( = ?auto_694507 ?auto_694510 ) ) ( not ( = ?auto_694507 ?auto_694511 ) ) ( not ( = ?auto_694507 ?auto_694512 ) ) ( not ( = ?auto_694507 ?auto_694513 ) ) ( not ( = ?auto_694507 ?auto_694514 ) ) ( not ( = ?auto_694507 ?auto_694515 ) ) ( not ( = ?auto_694508 ?auto_694509 ) ) ( not ( = ?auto_694508 ?auto_694510 ) ) ( not ( = ?auto_694508 ?auto_694511 ) ) ( not ( = ?auto_694508 ?auto_694512 ) ) ( not ( = ?auto_694508 ?auto_694513 ) ) ( not ( = ?auto_694508 ?auto_694514 ) ) ( not ( = ?auto_694508 ?auto_694515 ) ) ( not ( = ?auto_694509 ?auto_694510 ) ) ( not ( = ?auto_694509 ?auto_694511 ) ) ( not ( = ?auto_694509 ?auto_694512 ) ) ( not ( = ?auto_694509 ?auto_694513 ) ) ( not ( = ?auto_694509 ?auto_694514 ) ) ( not ( = ?auto_694509 ?auto_694515 ) ) ( not ( = ?auto_694510 ?auto_694511 ) ) ( not ( = ?auto_694510 ?auto_694512 ) ) ( not ( = ?auto_694510 ?auto_694513 ) ) ( not ( = ?auto_694510 ?auto_694514 ) ) ( not ( = ?auto_694510 ?auto_694515 ) ) ( not ( = ?auto_694511 ?auto_694512 ) ) ( not ( = ?auto_694511 ?auto_694513 ) ) ( not ( = ?auto_694511 ?auto_694514 ) ) ( not ( = ?auto_694511 ?auto_694515 ) ) ( not ( = ?auto_694512 ?auto_694513 ) ) ( not ( = ?auto_694512 ?auto_694514 ) ) ( not ( = ?auto_694512 ?auto_694515 ) ) ( not ( = ?auto_694513 ?auto_694514 ) ) ( not ( = ?auto_694513 ?auto_694515 ) ) ( not ( = ?auto_694514 ?auto_694515 ) ) ( ON ?auto_694514 ?auto_694515 ) ( ON ?auto_694513 ?auto_694514 ) ( ON ?auto_694512 ?auto_694513 ) ( ON ?auto_694511 ?auto_694512 ) ( ON ?auto_694510 ?auto_694511 ) ( ON ?auto_694509 ?auto_694510 ) ( ON ?auto_694508 ?auto_694509 ) ( ON ?auto_694507 ?auto_694508 ) ( ON ?auto_694506 ?auto_694507 ) ( ON ?auto_694505 ?auto_694506 ) ( CLEAR ?auto_694503 ) ( ON ?auto_694504 ?auto_694505 ) ( CLEAR ?auto_694504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_694499 ?auto_694500 ?auto_694501 ?auto_694502 ?auto_694503 ?auto_694504 )
      ( MAKE-17PILE ?auto_694499 ?auto_694500 ?auto_694501 ?auto_694502 ?auto_694503 ?auto_694504 ?auto_694505 ?auto_694506 ?auto_694507 ?auto_694508 ?auto_694509 ?auto_694510 ?auto_694511 ?auto_694512 ?auto_694513 ?auto_694514 ?auto_694515 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694533 - BLOCK
      ?auto_694534 - BLOCK
      ?auto_694535 - BLOCK
      ?auto_694536 - BLOCK
      ?auto_694537 - BLOCK
      ?auto_694538 - BLOCK
      ?auto_694539 - BLOCK
      ?auto_694540 - BLOCK
      ?auto_694541 - BLOCK
      ?auto_694542 - BLOCK
      ?auto_694543 - BLOCK
      ?auto_694544 - BLOCK
      ?auto_694545 - BLOCK
      ?auto_694546 - BLOCK
      ?auto_694547 - BLOCK
      ?auto_694548 - BLOCK
      ?auto_694549 - BLOCK
    )
    :vars
    (
      ?auto_694550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694549 ?auto_694550 ) ( ON-TABLE ?auto_694533 ) ( ON ?auto_694534 ?auto_694533 ) ( ON ?auto_694535 ?auto_694534 ) ( ON ?auto_694536 ?auto_694535 ) ( not ( = ?auto_694533 ?auto_694534 ) ) ( not ( = ?auto_694533 ?auto_694535 ) ) ( not ( = ?auto_694533 ?auto_694536 ) ) ( not ( = ?auto_694533 ?auto_694537 ) ) ( not ( = ?auto_694533 ?auto_694538 ) ) ( not ( = ?auto_694533 ?auto_694539 ) ) ( not ( = ?auto_694533 ?auto_694540 ) ) ( not ( = ?auto_694533 ?auto_694541 ) ) ( not ( = ?auto_694533 ?auto_694542 ) ) ( not ( = ?auto_694533 ?auto_694543 ) ) ( not ( = ?auto_694533 ?auto_694544 ) ) ( not ( = ?auto_694533 ?auto_694545 ) ) ( not ( = ?auto_694533 ?auto_694546 ) ) ( not ( = ?auto_694533 ?auto_694547 ) ) ( not ( = ?auto_694533 ?auto_694548 ) ) ( not ( = ?auto_694533 ?auto_694549 ) ) ( not ( = ?auto_694533 ?auto_694550 ) ) ( not ( = ?auto_694534 ?auto_694535 ) ) ( not ( = ?auto_694534 ?auto_694536 ) ) ( not ( = ?auto_694534 ?auto_694537 ) ) ( not ( = ?auto_694534 ?auto_694538 ) ) ( not ( = ?auto_694534 ?auto_694539 ) ) ( not ( = ?auto_694534 ?auto_694540 ) ) ( not ( = ?auto_694534 ?auto_694541 ) ) ( not ( = ?auto_694534 ?auto_694542 ) ) ( not ( = ?auto_694534 ?auto_694543 ) ) ( not ( = ?auto_694534 ?auto_694544 ) ) ( not ( = ?auto_694534 ?auto_694545 ) ) ( not ( = ?auto_694534 ?auto_694546 ) ) ( not ( = ?auto_694534 ?auto_694547 ) ) ( not ( = ?auto_694534 ?auto_694548 ) ) ( not ( = ?auto_694534 ?auto_694549 ) ) ( not ( = ?auto_694534 ?auto_694550 ) ) ( not ( = ?auto_694535 ?auto_694536 ) ) ( not ( = ?auto_694535 ?auto_694537 ) ) ( not ( = ?auto_694535 ?auto_694538 ) ) ( not ( = ?auto_694535 ?auto_694539 ) ) ( not ( = ?auto_694535 ?auto_694540 ) ) ( not ( = ?auto_694535 ?auto_694541 ) ) ( not ( = ?auto_694535 ?auto_694542 ) ) ( not ( = ?auto_694535 ?auto_694543 ) ) ( not ( = ?auto_694535 ?auto_694544 ) ) ( not ( = ?auto_694535 ?auto_694545 ) ) ( not ( = ?auto_694535 ?auto_694546 ) ) ( not ( = ?auto_694535 ?auto_694547 ) ) ( not ( = ?auto_694535 ?auto_694548 ) ) ( not ( = ?auto_694535 ?auto_694549 ) ) ( not ( = ?auto_694535 ?auto_694550 ) ) ( not ( = ?auto_694536 ?auto_694537 ) ) ( not ( = ?auto_694536 ?auto_694538 ) ) ( not ( = ?auto_694536 ?auto_694539 ) ) ( not ( = ?auto_694536 ?auto_694540 ) ) ( not ( = ?auto_694536 ?auto_694541 ) ) ( not ( = ?auto_694536 ?auto_694542 ) ) ( not ( = ?auto_694536 ?auto_694543 ) ) ( not ( = ?auto_694536 ?auto_694544 ) ) ( not ( = ?auto_694536 ?auto_694545 ) ) ( not ( = ?auto_694536 ?auto_694546 ) ) ( not ( = ?auto_694536 ?auto_694547 ) ) ( not ( = ?auto_694536 ?auto_694548 ) ) ( not ( = ?auto_694536 ?auto_694549 ) ) ( not ( = ?auto_694536 ?auto_694550 ) ) ( not ( = ?auto_694537 ?auto_694538 ) ) ( not ( = ?auto_694537 ?auto_694539 ) ) ( not ( = ?auto_694537 ?auto_694540 ) ) ( not ( = ?auto_694537 ?auto_694541 ) ) ( not ( = ?auto_694537 ?auto_694542 ) ) ( not ( = ?auto_694537 ?auto_694543 ) ) ( not ( = ?auto_694537 ?auto_694544 ) ) ( not ( = ?auto_694537 ?auto_694545 ) ) ( not ( = ?auto_694537 ?auto_694546 ) ) ( not ( = ?auto_694537 ?auto_694547 ) ) ( not ( = ?auto_694537 ?auto_694548 ) ) ( not ( = ?auto_694537 ?auto_694549 ) ) ( not ( = ?auto_694537 ?auto_694550 ) ) ( not ( = ?auto_694538 ?auto_694539 ) ) ( not ( = ?auto_694538 ?auto_694540 ) ) ( not ( = ?auto_694538 ?auto_694541 ) ) ( not ( = ?auto_694538 ?auto_694542 ) ) ( not ( = ?auto_694538 ?auto_694543 ) ) ( not ( = ?auto_694538 ?auto_694544 ) ) ( not ( = ?auto_694538 ?auto_694545 ) ) ( not ( = ?auto_694538 ?auto_694546 ) ) ( not ( = ?auto_694538 ?auto_694547 ) ) ( not ( = ?auto_694538 ?auto_694548 ) ) ( not ( = ?auto_694538 ?auto_694549 ) ) ( not ( = ?auto_694538 ?auto_694550 ) ) ( not ( = ?auto_694539 ?auto_694540 ) ) ( not ( = ?auto_694539 ?auto_694541 ) ) ( not ( = ?auto_694539 ?auto_694542 ) ) ( not ( = ?auto_694539 ?auto_694543 ) ) ( not ( = ?auto_694539 ?auto_694544 ) ) ( not ( = ?auto_694539 ?auto_694545 ) ) ( not ( = ?auto_694539 ?auto_694546 ) ) ( not ( = ?auto_694539 ?auto_694547 ) ) ( not ( = ?auto_694539 ?auto_694548 ) ) ( not ( = ?auto_694539 ?auto_694549 ) ) ( not ( = ?auto_694539 ?auto_694550 ) ) ( not ( = ?auto_694540 ?auto_694541 ) ) ( not ( = ?auto_694540 ?auto_694542 ) ) ( not ( = ?auto_694540 ?auto_694543 ) ) ( not ( = ?auto_694540 ?auto_694544 ) ) ( not ( = ?auto_694540 ?auto_694545 ) ) ( not ( = ?auto_694540 ?auto_694546 ) ) ( not ( = ?auto_694540 ?auto_694547 ) ) ( not ( = ?auto_694540 ?auto_694548 ) ) ( not ( = ?auto_694540 ?auto_694549 ) ) ( not ( = ?auto_694540 ?auto_694550 ) ) ( not ( = ?auto_694541 ?auto_694542 ) ) ( not ( = ?auto_694541 ?auto_694543 ) ) ( not ( = ?auto_694541 ?auto_694544 ) ) ( not ( = ?auto_694541 ?auto_694545 ) ) ( not ( = ?auto_694541 ?auto_694546 ) ) ( not ( = ?auto_694541 ?auto_694547 ) ) ( not ( = ?auto_694541 ?auto_694548 ) ) ( not ( = ?auto_694541 ?auto_694549 ) ) ( not ( = ?auto_694541 ?auto_694550 ) ) ( not ( = ?auto_694542 ?auto_694543 ) ) ( not ( = ?auto_694542 ?auto_694544 ) ) ( not ( = ?auto_694542 ?auto_694545 ) ) ( not ( = ?auto_694542 ?auto_694546 ) ) ( not ( = ?auto_694542 ?auto_694547 ) ) ( not ( = ?auto_694542 ?auto_694548 ) ) ( not ( = ?auto_694542 ?auto_694549 ) ) ( not ( = ?auto_694542 ?auto_694550 ) ) ( not ( = ?auto_694543 ?auto_694544 ) ) ( not ( = ?auto_694543 ?auto_694545 ) ) ( not ( = ?auto_694543 ?auto_694546 ) ) ( not ( = ?auto_694543 ?auto_694547 ) ) ( not ( = ?auto_694543 ?auto_694548 ) ) ( not ( = ?auto_694543 ?auto_694549 ) ) ( not ( = ?auto_694543 ?auto_694550 ) ) ( not ( = ?auto_694544 ?auto_694545 ) ) ( not ( = ?auto_694544 ?auto_694546 ) ) ( not ( = ?auto_694544 ?auto_694547 ) ) ( not ( = ?auto_694544 ?auto_694548 ) ) ( not ( = ?auto_694544 ?auto_694549 ) ) ( not ( = ?auto_694544 ?auto_694550 ) ) ( not ( = ?auto_694545 ?auto_694546 ) ) ( not ( = ?auto_694545 ?auto_694547 ) ) ( not ( = ?auto_694545 ?auto_694548 ) ) ( not ( = ?auto_694545 ?auto_694549 ) ) ( not ( = ?auto_694545 ?auto_694550 ) ) ( not ( = ?auto_694546 ?auto_694547 ) ) ( not ( = ?auto_694546 ?auto_694548 ) ) ( not ( = ?auto_694546 ?auto_694549 ) ) ( not ( = ?auto_694546 ?auto_694550 ) ) ( not ( = ?auto_694547 ?auto_694548 ) ) ( not ( = ?auto_694547 ?auto_694549 ) ) ( not ( = ?auto_694547 ?auto_694550 ) ) ( not ( = ?auto_694548 ?auto_694549 ) ) ( not ( = ?auto_694548 ?auto_694550 ) ) ( not ( = ?auto_694549 ?auto_694550 ) ) ( ON ?auto_694548 ?auto_694549 ) ( ON ?auto_694547 ?auto_694548 ) ( ON ?auto_694546 ?auto_694547 ) ( ON ?auto_694545 ?auto_694546 ) ( ON ?auto_694544 ?auto_694545 ) ( ON ?auto_694543 ?auto_694544 ) ( ON ?auto_694542 ?auto_694543 ) ( ON ?auto_694541 ?auto_694542 ) ( ON ?auto_694540 ?auto_694541 ) ( ON ?auto_694539 ?auto_694540 ) ( ON ?auto_694538 ?auto_694539 ) ( CLEAR ?auto_694536 ) ( ON ?auto_694537 ?auto_694538 ) ( CLEAR ?auto_694537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_694533 ?auto_694534 ?auto_694535 ?auto_694536 ?auto_694537 )
      ( MAKE-17PILE ?auto_694533 ?auto_694534 ?auto_694535 ?auto_694536 ?auto_694537 ?auto_694538 ?auto_694539 ?auto_694540 ?auto_694541 ?auto_694542 ?auto_694543 ?auto_694544 ?auto_694545 ?auto_694546 ?auto_694547 ?auto_694548 ?auto_694549 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694568 - BLOCK
      ?auto_694569 - BLOCK
      ?auto_694570 - BLOCK
      ?auto_694571 - BLOCK
      ?auto_694572 - BLOCK
      ?auto_694573 - BLOCK
      ?auto_694574 - BLOCK
      ?auto_694575 - BLOCK
      ?auto_694576 - BLOCK
      ?auto_694577 - BLOCK
      ?auto_694578 - BLOCK
      ?auto_694579 - BLOCK
      ?auto_694580 - BLOCK
      ?auto_694581 - BLOCK
      ?auto_694582 - BLOCK
      ?auto_694583 - BLOCK
      ?auto_694584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_694584 ) ( ON-TABLE ?auto_694568 ) ( ON ?auto_694569 ?auto_694568 ) ( ON ?auto_694570 ?auto_694569 ) ( ON ?auto_694571 ?auto_694570 ) ( not ( = ?auto_694568 ?auto_694569 ) ) ( not ( = ?auto_694568 ?auto_694570 ) ) ( not ( = ?auto_694568 ?auto_694571 ) ) ( not ( = ?auto_694568 ?auto_694572 ) ) ( not ( = ?auto_694568 ?auto_694573 ) ) ( not ( = ?auto_694568 ?auto_694574 ) ) ( not ( = ?auto_694568 ?auto_694575 ) ) ( not ( = ?auto_694568 ?auto_694576 ) ) ( not ( = ?auto_694568 ?auto_694577 ) ) ( not ( = ?auto_694568 ?auto_694578 ) ) ( not ( = ?auto_694568 ?auto_694579 ) ) ( not ( = ?auto_694568 ?auto_694580 ) ) ( not ( = ?auto_694568 ?auto_694581 ) ) ( not ( = ?auto_694568 ?auto_694582 ) ) ( not ( = ?auto_694568 ?auto_694583 ) ) ( not ( = ?auto_694568 ?auto_694584 ) ) ( not ( = ?auto_694569 ?auto_694570 ) ) ( not ( = ?auto_694569 ?auto_694571 ) ) ( not ( = ?auto_694569 ?auto_694572 ) ) ( not ( = ?auto_694569 ?auto_694573 ) ) ( not ( = ?auto_694569 ?auto_694574 ) ) ( not ( = ?auto_694569 ?auto_694575 ) ) ( not ( = ?auto_694569 ?auto_694576 ) ) ( not ( = ?auto_694569 ?auto_694577 ) ) ( not ( = ?auto_694569 ?auto_694578 ) ) ( not ( = ?auto_694569 ?auto_694579 ) ) ( not ( = ?auto_694569 ?auto_694580 ) ) ( not ( = ?auto_694569 ?auto_694581 ) ) ( not ( = ?auto_694569 ?auto_694582 ) ) ( not ( = ?auto_694569 ?auto_694583 ) ) ( not ( = ?auto_694569 ?auto_694584 ) ) ( not ( = ?auto_694570 ?auto_694571 ) ) ( not ( = ?auto_694570 ?auto_694572 ) ) ( not ( = ?auto_694570 ?auto_694573 ) ) ( not ( = ?auto_694570 ?auto_694574 ) ) ( not ( = ?auto_694570 ?auto_694575 ) ) ( not ( = ?auto_694570 ?auto_694576 ) ) ( not ( = ?auto_694570 ?auto_694577 ) ) ( not ( = ?auto_694570 ?auto_694578 ) ) ( not ( = ?auto_694570 ?auto_694579 ) ) ( not ( = ?auto_694570 ?auto_694580 ) ) ( not ( = ?auto_694570 ?auto_694581 ) ) ( not ( = ?auto_694570 ?auto_694582 ) ) ( not ( = ?auto_694570 ?auto_694583 ) ) ( not ( = ?auto_694570 ?auto_694584 ) ) ( not ( = ?auto_694571 ?auto_694572 ) ) ( not ( = ?auto_694571 ?auto_694573 ) ) ( not ( = ?auto_694571 ?auto_694574 ) ) ( not ( = ?auto_694571 ?auto_694575 ) ) ( not ( = ?auto_694571 ?auto_694576 ) ) ( not ( = ?auto_694571 ?auto_694577 ) ) ( not ( = ?auto_694571 ?auto_694578 ) ) ( not ( = ?auto_694571 ?auto_694579 ) ) ( not ( = ?auto_694571 ?auto_694580 ) ) ( not ( = ?auto_694571 ?auto_694581 ) ) ( not ( = ?auto_694571 ?auto_694582 ) ) ( not ( = ?auto_694571 ?auto_694583 ) ) ( not ( = ?auto_694571 ?auto_694584 ) ) ( not ( = ?auto_694572 ?auto_694573 ) ) ( not ( = ?auto_694572 ?auto_694574 ) ) ( not ( = ?auto_694572 ?auto_694575 ) ) ( not ( = ?auto_694572 ?auto_694576 ) ) ( not ( = ?auto_694572 ?auto_694577 ) ) ( not ( = ?auto_694572 ?auto_694578 ) ) ( not ( = ?auto_694572 ?auto_694579 ) ) ( not ( = ?auto_694572 ?auto_694580 ) ) ( not ( = ?auto_694572 ?auto_694581 ) ) ( not ( = ?auto_694572 ?auto_694582 ) ) ( not ( = ?auto_694572 ?auto_694583 ) ) ( not ( = ?auto_694572 ?auto_694584 ) ) ( not ( = ?auto_694573 ?auto_694574 ) ) ( not ( = ?auto_694573 ?auto_694575 ) ) ( not ( = ?auto_694573 ?auto_694576 ) ) ( not ( = ?auto_694573 ?auto_694577 ) ) ( not ( = ?auto_694573 ?auto_694578 ) ) ( not ( = ?auto_694573 ?auto_694579 ) ) ( not ( = ?auto_694573 ?auto_694580 ) ) ( not ( = ?auto_694573 ?auto_694581 ) ) ( not ( = ?auto_694573 ?auto_694582 ) ) ( not ( = ?auto_694573 ?auto_694583 ) ) ( not ( = ?auto_694573 ?auto_694584 ) ) ( not ( = ?auto_694574 ?auto_694575 ) ) ( not ( = ?auto_694574 ?auto_694576 ) ) ( not ( = ?auto_694574 ?auto_694577 ) ) ( not ( = ?auto_694574 ?auto_694578 ) ) ( not ( = ?auto_694574 ?auto_694579 ) ) ( not ( = ?auto_694574 ?auto_694580 ) ) ( not ( = ?auto_694574 ?auto_694581 ) ) ( not ( = ?auto_694574 ?auto_694582 ) ) ( not ( = ?auto_694574 ?auto_694583 ) ) ( not ( = ?auto_694574 ?auto_694584 ) ) ( not ( = ?auto_694575 ?auto_694576 ) ) ( not ( = ?auto_694575 ?auto_694577 ) ) ( not ( = ?auto_694575 ?auto_694578 ) ) ( not ( = ?auto_694575 ?auto_694579 ) ) ( not ( = ?auto_694575 ?auto_694580 ) ) ( not ( = ?auto_694575 ?auto_694581 ) ) ( not ( = ?auto_694575 ?auto_694582 ) ) ( not ( = ?auto_694575 ?auto_694583 ) ) ( not ( = ?auto_694575 ?auto_694584 ) ) ( not ( = ?auto_694576 ?auto_694577 ) ) ( not ( = ?auto_694576 ?auto_694578 ) ) ( not ( = ?auto_694576 ?auto_694579 ) ) ( not ( = ?auto_694576 ?auto_694580 ) ) ( not ( = ?auto_694576 ?auto_694581 ) ) ( not ( = ?auto_694576 ?auto_694582 ) ) ( not ( = ?auto_694576 ?auto_694583 ) ) ( not ( = ?auto_694576 ?auto_694584 ) ) ( not ( = ?auto_694577 ?auto_694578 ) ) ( not ( = ?auto_694577 ?auto_694579 ) ) ( not ( = ?auto_694577 ?auto_694580 ) ) ( not ( = ?auto_694577 ?auto_694581 ) ) ( not ( = ?auto_694577 ?auto_694582 ) ) ( not ( = ?auto_694577 ?auto_694583 ) ) ( not ( = ?auto_694577 ?auto_694584 ) ) ( not ( = ?auto_694578 ?auto_694579 ) ) ( not ( = ?auto_694578 ?auto_694580 ) ) ( not ( = ?auto_694578 ?auto_694581 ) ) ( not ( = ?auto_694578 ?auto_694582 ) ) ( not ( = ?auto_694578 ?auto_694583 ) ) ( not ( = ?auto_694578 ?auto_694584 ) ) ( not ( = ?auto_694579 ?auto_694580 ) ) ( not ( = ?auto_694579 ?auto_694581 ) ) ( not ( = ?auto_694579 ?auto_694582 ) ) ( not ( = ?auto_694579 ?auto_694583 ) ) ( not ( = ?auto_694579 ?auto_694584 ) ) ( not ( = ?auto_694580 ?auto_694581 ) ) ( not ( = ?auto_694580 ?auto_694582 ) ) ( not ( = ?auto_694580 ?auto_694583 ) ) ( not ( = ?auto_694580 ?auto_694584 ) ) ( not ( = ?auto_694581 ?auto_694582 ) ) ( not ( = ?auto_694581 ?auto_694583 ) ) ( not ( = ?auto_694581 ?auto_694584 ) ) ( not ( = ?auto_694582 ?auto_694583 ) ) ( not ( = ?auto_694582 ?auto_694584 ) ) ( not ( = ?auto_694583 ?auto_694584 ) ) ( ON ?auto_694583 ?auto_694584 ) ( ON ?auto_694582 ?auto_694583 ) ( ON ?auto_694581 ?auto_694582 ) ( ON ?auto_694580 ?auto_694581 ) ( ON ?auto_694579 ?auto_694580 ) ( ON ?auto_694578 ?auto_694579 ) ( ON ?auto_694577 ?auto_694578 ) ( ON ?auto_694576 ?auto_694577 ) ( ON ?auto_694575 ?auto_694576 ) ( ON ?auto_694574 ?auto_694575 ) ( ON ?auto_694573 ?auto_694574 ) ( CLEAR ?auto_694571 ) ( ON ?auto_694572 ?auto_694573 ) ( CLEAR ?auto_694572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_694568 ?auto_694569 ?auto_694570 ?auto_694571 ?auto_694572 )
      ( MAKE-17PILE ?auto_694568 ?auto_694569 ?auto_694570 ?auto_694571 ?auto_694572 ?auto_694573 ?auto_694574 ?auto_694575 ?auto_694576 ?auto_694577 ?auto_694578 ?auto_694579 ?auto_694580 ?auto_694581 ?auto_694582 ?auto_694583 ?auto_694584 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694602 - BLOCK
      ?auto_694603 - BLOCK
      ?auto_694604 - BLOCK
      ?auto_694605 - BLOCK
      ?auto_694606 - BLOCK
      ?auto_694607 - BLOCK
      ?auto_694608 - BLOCK
      ?auto_694609 - BLOCK
      ?auto_694610 - BLOCK
      ?auto_694611 - BLOCK
      ?auto_694612 - BLOCK
      ?auto_694613 - BLOCK
      ?auto_694614 - BLOCK
      ?auto_694615 - BLOCK
      ?auto_694616 - BLOCK
      ?auto_694617 - BLOCK
      ?auto_694618 - BLOCK
    )
    :vars
    (
      ?auto_694619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694618 ?auto_694619 ) ( ON-TABLE ?auto_694602 ) ( ON ?auto_694603 ?auto_694602 ) ( ON ?auto_694604 ?auto_694603 ) ( not ( = ?auto_694602 ?auto_694603 ) ) ( not ( = ?auto_694602 ?auto_694604 ) ) ( not ( = ?auto_694602 ?auto_694605 ) ) ( not ( = ?auto_694602 ?auto_694606 ) ) ( not ( = ?auto_694602 ?auto_694607 ) ) ( not ( = ?auto_694602 ?auto_694608 ) ) ( not ( = ?auto_694602 ?auto_694609 ) ) ( not ( = ?auto_694602 ?auto_694610 ) ) ( not ( = ?auto_694602 ?auto_694611 ) ) ( not ( = ?auto_694602 ?auto_694612 ) ) ( not ( = ?auto_694602 ?auto_694613 ) ) ( not ( = ?auto_694602 ?auto_694614 ) ) ( not ( = ?auto_694602 ?auto_694615 ) ) ( not ( = ?auto_694602 ?auto_694616 ) ) ( not ( = ?auto_694602 ?auto_694617 ) ) ( not ( = ?auto_694602 ?auto_694618 ) ) ( not ( = ?auto_694602 ?auto_694619 ) ) ( not ( = ?auto_694603 ?auto_694604 ) ) ( not ( = ?auto_694603 ?auto_694605 ) ) ( not ( = ?auto_694603 ?auto_694606 ) ) ( not ( = ?auto_694603 ?auto_694607 ) ) ( not ( = ?auto_694603 ?auto_694608 ) ) ( not ( = ?auto_694603 ?auto_694609 ) ) ( not ( = ?auto_694603 ?auto_694610 ) ) ( not ( = ?auto_694603 ?auto_694611 ) ) ( not ( = ?auto_694603 ?auto_694612 ) ) ( not ( = ?auto_694603 ?auto_694613 ) ) ( not ( = ?auto_694603 ?auto_694614 ) ) ( not ( = ?auto_694603 ?auto_694615 ) ) ( not ( = ?auto_694603 ?auto_694616 ) ) ( not ( = ?auto_694603 ?auto_694617 ) ) ( not ( = ?auto_694603 ?auto_694618 ) ) ( not ( = ?auto_694603 ?auto_694619 ) ) ( not ( = ?auto_694604 ?auto_694605 ) ) ( not ( = ?auto_694604 ?auto_694606 ) ) ( not ( = ?auto_694604 ?auto_694607 ) ) ( not ( = ?auto_694604 ?auto_694608 ) ) ( not ( = ?auto_694604 ?auto_694609 ) ) ( not ( = ?auto_694604 ?auto_694610 ) ) ( not ( = ?auto_694604 ?auto_694611 ) ) ( not ( = ?auto_694604 ?auto_694612 ) ) ( not ( = ?auto_694604 ?auto_694613 ) ) ( not ( = ?auto_694604 ?auto_694614 ) ) ( not ( = ?auto_694604 ?auto_694615 ) ) ( not ( = ?auto_694604 ?auto_694616 ) ) ( not ( = ?auto_694604 ?auto_694617 ) ) ( not ( = ?auto_694604 ?auto_694618 ) ) ( not ( = ?auto_694604 ?auto_694619 ) ) ( not ( = ?auto_694605 ?auto_694606 ) ) ( not ( = ?auto_694605 ?auto_694607 ) ) ( not ( = ?auto_694605 ?auto_694608 ) ) ( not ( = ?auto_694605 ?auto_694609 ) ) ( not ( = ?auto_694605 ?auto_694610 ) ) ( not ( = ?auto_694605 ?auto_694611 ) ) ( not ( = ?auto_694605 ?auto_694612 ) ) ( not ( = ?auto_694605 ?auto_694613 ) ) ( not ( = ?auto_694605 ?auto_694614 ) ) ( not ( = ?auto_694605 ?auto_694615 ) ) ( not ( = ?auto_694605 ?auto_694616 ) ) ( not ( = ?auto_694605 ?auto_694617 ) ) ( not ( = ?auto_694605 ?auto_694618 ) ) ( not ( = ?auto_694605 ?auto_694619 ) ) ( not ( = ?auto_694606 ?auto_694607 ) ) ( not ( = ?auto_694606 ?auto_694608 ) ) ( not ( = ?auto_694606 ?auto_694609 ) ) ( not ( = ?auto_694606 ?auto_694610 ) ) ( not ( = ?auto_694606 ?auto_694611 ) ) ( not ( = ?auto_694606 ?auto_694612 ) ) ( not ( = ?auto_694606 ?auto_694613 ) ) ( not ( = ?auto_694606 ?auto_694614 ) ) ( not ( = ?auto_694606 ?auto_694615 ) ) ( not ( = ?auto_694606 ?auto_694616 ) ) ( not ( = ?auto_694606 ?auto_694617 ) ) ( not ( = ?auto_694606 ?auto_694618 ) ) ( not ( = ?auto_694606 ?auto_694619 ) ) ( not ( = ?auto_694607 ?auto_694608 ) ) ( not ( = ?auto_694607 ?auto_694609 ) ) ( not ( = ?auto_694607 ?auto_694610 ) ) ( not ( = ?auto_694607 ?auto_694611 ) ) ( not ( = ?auto_694607 ?auto_694612 ) ) ( not ( = ?auto_694607 ?auto_694613 ) ) ( not ( = ?auto_694607 ?auto_694614 ) ) ( not ( = ?auto_694607 ?auto_694615 ) ) ( not ( = ?auto_694607 ?auto_694616 ) ) ( not ( = ?auto_694607 ?auto_694617 ) ) ( not ( = ?auto_694607 ?auto_694618 ) ) ( not ( = ?auto_694607 ?auto_694619 ) ) ( not ( = ?auto_694608 ?auto_694609 ) ) ( not ( = ?auto_694608 ?auto_694610 ) ) ( not ( = ?auto_694608 ?auto_694611 ) ) ( not ( = ?auto_694608 ?auto_694612 ) ) ( not ( = ?auto_694608 ?auto_694613 ) ) ( not ( = ?auto_694608 ?auto_694614 ) ) ( not ( = ?auto_694608 ?auto_694615 ) ) ( not ( = ?auto_694608 ?auto_694616 ) ) ( not ( = ?auto_694608 ?auto_694617 ) ) ( not ( = ?auto_694608 ?auto_694618 ) ) ( not ( = ?auto_694608 ?auto_694619 ) ) ( not ( = ?auto_694609 ?auto_694610 ) ) ( not ( = ?auto_694609 ?auto_694611 ) ) ( not ( = ?auto_694609 ?auto_694612 ) ) ( not ( = ?auto_694609 ?auto_694613 ) ) ( not ( = ?auto_694609 ?auto_694614 ) ) ( not ( = ?auto_694609 ?auto_694615 ) ) ( not ( = ?auto_694609 ?auto_694616 ) ) ( not ( = ?auto_694609 ?auto_694617 ) ) ( not ( = ?auto_694609 ?auto_694618 ) ) ( not ( = ?auto_694609 ?auto_694619 ) ) ( not ( = ?auto_694610 ?auto_694611 ) ) ( not ( = ?auto_694610 ?auto_694612 ) ) ( not ( = ?auto_694610 ?auto_694613 ) ) ( not ( = ?auto_694610 ?auto_694614 ) ) ( not ( = ?auto_694610 ?auto_694615 ) ) ( not ( = ?auto_694610 ?auto_694616 ) ) ( not ( = ?auto_694610 ?auto_694617 ) ) ( not ( = ?auto_694610 ?auto_694618 ) ) ( not ( = ?auto_694610 ?auto_694619 ) ) ( not ( = ?auto_694611 ?auto_694612 ) ) ( not ( = ?auto_694611 ?auto_694613 ) ) ( not ( = ?auto_694611 ?auto_694614 ) ) ( not ( = ?auto_694611 ?auto_694615 ) ) ( not ( = ?auto_694611 ?auto_694616 ) ) ( not ( = ?auto_694611 ?auto_694617 ) ) ( not ( = ?auto_694611 ?auto_694618 ) ) ( not ( = ?auto_694611 ?auto_694619 ) ) ( not ( = ?auto_694612 ?auto_694613 ) ) ( not ( = ?auto_694612 ?auto_694614 ) ) ( not ( = ?auto_694612 ?auto_694615 ) ) ( not ( = ?auto_694612 ?auto_694616 ) ) ( not ( = ?auto_694612 ?auto_694617 ) ) ( not ( = ?auto_694612 ?auto_694618 ) ) ( not ( = ?auto_694612 ?auto_694619 ) ) ( not ( = ?auto_694613 ?auto_694614 ) ) ( not ( = ?auto_694613 ?auto_694615 ) ) ( not ( = ?auto_694613 ?auto_694616 ) ) ( not ( = ?auto_694613 ?auto_694617 ) ) ( not ( = ?auto_694613 ?auto_694618 ) ) ( not ( = ?auto_694613 ?auto_694619 ) ) ( not ( = ?auto_694614 ?auto_694615 ) ) ( not ( = ?auto_694614 ?auto_694616 ) ) ( not ( = ?auto_694614 ?auto_694617 ) ) ( not ( = ?auto_694614 ?auto_694618 ) ) ( not ( = ?auto_694614 ?auto_694619 ) ) ( not ( = ?auto_694615 ?auto_694616 ) ) ( not ( = ?auto_694615 ?auto_694617 ) ) ( not ( = ?auto_694615 ?auto_694618 ) ) ( not ( = ?auto_694615 ?auto_694619 ) ) ( not ( = ?auto_694616 ?auto_694617 ) ) ( not ( = ?auto_694616 ?auto_694618 ) ) ( not ( = ?auto_694616 ?auto_694619 ) ) ( not ( = ?auto_694617 ?auto_694618 ) ) ( not ( = ?auto_694617 ?auto_694619 ) ) ( not ( = ?auto_694618 ?auto_694619 ) ) ( ON ?auto_694617 ?auto_694618 ) ( ON ?auto_694616 ?auto_694617 ) ( ON ?auto_694615 ?auto_694616 ) ( ON ?auto_694614 ?auto_694615 ) ( ON ?auto_694613 ?auto_694614 ) ( ON ?auto_694612 ?auto_694613 ) ( ON ?auto_694611 ?auto_694612 ) ( ON ?auto_694610 ?auto_694611 ) ( ON ?auto_694609 ?auto_694610 ) ( ON ?auto_694608 ?auto_694609 ) ( ON ?auto_694607 ?auto_694608 ) ( ON ?auto_694606 ?auto_694607 ) ( CLEAR ?auto_694604 ) ( ON ?auto_694605 ?auto_694606 ) ( CLEAR ?auto_694605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_694602 ?auto_694603 ?auto_694604 ?auto_694605 )
      ( MAKE-17PILE ?auto_694602 ?auto_694603 ?auto_694604 ?auto_694605 ?auto_694606 ?auto_694607 ?auto_694608 ?auto_694609 ?auto_694610 ?auto_694611 ?auto_694612 ?auto_694613 ?auto_694614 ?auto_694615 ?auto_694616 ?auto_694617 ?auto_694618 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694637 - BLOCK
      ?auto_694638 - BLOCK
      ?auto_694639 - BLOCK
      ?auto_694640 - BLOCK
      ?auto_694641 - BLOCK
      ?auto_694642 - BLOCK
      ?auto_694643 - BLOCK
      ?auto_694644 - BLOCK
      ?auto_694645 - BLOCK
      ?auto_694646 - BLOCK
      ?auto_694647 - BLOCK
      ?auto_694648 - BLOCK
      ?auto_694649 - BLOCK
      ?auto_694650 - BLOCK
      ?auto_694651 - BLOCK
      ?auto_694652 - BLOCK
      ?auto_694653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_694653 ) ( ON-TABLE ?auto_694637 ) ( ON ?auto_694638 ?auto_694637 ) ( ON ?auto_694639 ?auto_694638 ) ( not ( = ?auto_694637 ?auto_694638 ) ) ( not ( = ?auto_694637 ?auto_694639 ) ) ( not ( = ?auto_694637 ?auto_694640 ) ) ( not ( = ?auto_694637 ?auto_694641 ) ) ( not ( = ?auto_694637 ?auto_694642 ) ) ( not ( = ?auto_694637 ?auto_694643 ) ) ( not ( = ?auto_694637 ?auto_694644 ) ) ( not ( = ?auto_694637 ?auto_694645 ) ) ( not ( = ?auto_694637 ?auto_694646 ) ) ( not ( = ?auto_694637 ?auto_694647 ) ) ( not ( = ?auto_694637 ?auto_694648 ) ) ( not ( = ?auto_694637 ?auto_694649 ) ) ( not ( = ?auto_694637 ?auto_694650 ) ) ( not ( = ?auto_694637 ?auto_694651 ) ) ( not ( = ?auto_694637 ?auto_694652 ) ) ( not ( = ?auto_694637 ?auto_694653 ) ) ( not ( = ?auto_694638 ?auto_694639 ) ) ( not ( = ?auto_694638 ?auto_694640 ) ) ( not ( = ?auto_694638 ?auto_694641 ) ) ( not ( = ?auto_694638 ?auto_694642 ) ) ( not ( = ?auto_694638 ?auto_694643 ) ) ( not ( = ?auto_694638 ?auto_694644 ) ) ( not ( = ?auto_694638 ?auto_694645 ) ) ( not ( = ?auto_694638 ?auto_694646 ) ) ( not ( = ?auto_694638 ?auto_694647 ) ) ( not ( = ?auto_694638 ?auto_694648 ) ) ( not ( = ?auto_694638 ?auto_694649 ) ) ( not ( = ?auto_694638 ?auto_694650 ) ) ( not ( = ?auto_694638 ?auto_694651 ) ) ( not ( = ?auto_694638 ?auto_694652 ) ) ( not ( = ?auto_694638 ?auto_694653 ) ) ( not ( = ?auto_694639 ?auto_694640 ) ) ( not ( = ?auto_694639 ?auto_694641 ) ) ( not ( = ?auto_694639 ?auto_694642 ) ) ( not ( = ?auto_694639 ?auto_694643 ) ) ( not ( = ?auto_694639 ?auto_694644 ) ) ( not ( = ?auto_694639 ?auto_694645 ) ) ( not ( = ?auto_694639 ?auto_694646 ) ) ( not ( = ?auto_694639 ?auto_694647 ) ) ( not ( = ?auto_694639 ?auto_694648 ) ) ( not ( = ?auto_694639 ?auto_694649 ) ) ( not ( = ?auto_694639 ?auto_694650 ) ) ( not ( = ?auto_694639 ?auto_694651 ) ) ( not ( = ?auto_694639 ?auto_694652 ) ) ( not ( = ?auto_694639 ?auto_694653 ) ) ( not ( = ?auto_694640 ?auto_694641 ) ) ( not ( = ?auto_694640 ?auto_694642 ) ) ( not ( = ?auto_694640 ?auto_694643 ) ) ( not ( = ?auto_694640 ?auto_694644 ) ) ( not ( = ?auto_694640 ?auto_694645 ) ) ( not ( = ?auto_694640 ?auto_694646 ) ) ( not ( = ?auto_694640 ?auto_694647 ) ) ( not ( = ?auto_694640 ?auto_694648 ) ) ( not ( = ?auto_694640 ?auto_694649 ) ) ( not ( = ?auto_694640 ?auto_694650 ) ) ( not ( = ?auto_694640 ?auto_694651 ) ) ( not ( = ?auto_694640 ?auto_694652 ) ) ( not ( = ?auto_694640 ?auto_694653 ) ) ( not ( = ?auto_694641 ?auto_694642 ) ) ( not ( = ?auto_694641 ?auto_694643 ) ) ( not ( = ?auto_694641 ?auto_694644 ) ) ( not ( = ?auto_694641 ?auto_694645 ) ) ( not ( = ?auto_694641 ?auto_694646 ) ) ( not ( = ?auto_694641 ?auto_694647 ) ) ( not ( = ?auto_694641 ?auto_694648 ) ) ( not ( = ?auto_694641 ?auto_694649 ) ) ( not ( = ?auto_694641 ?auto_694650 ) ) ( not ( = ?auto_694641 ?auto_694651 ) ) ( not ( = ?auto_694641 ?auto_694652 ) ) ( not ( = ?auto_694641 ?auto_694653 ) ) ( not ( = ?auto_694642 ?auto_694643 ) ) ( not ( = ?auto_694642 ?auto_694644 ) ) ( not ( = ?auto_694642 ?auto_694645 ) ) ( not ( = ?auto_694642 ?auto_694646 ) ) ( not ( = ?auto_694642 ?auto_694647 ) ) ( not ( = ?auto_694642 ?auto_694648 ) ) ( not ( = ?auto_694642 ?auto_694649 ) ) ( not ( = ?auto_694642 ?auto_694650 ) ) ( not ( = ?auto_694642 ?auto_694651 ) ) ( not ( = ?auto_694642 ?auto_694652 ) ) ( not ( = ?auto_694642 ?auto_694653 ) ) ( not ( = ?auto_694643 ?auto_694644 ) ) ( not ( = ?auto_694643 ?auto_694645 ) ) ( not ( = ?auto_694643 ?auto_694646 ) ) ( not ( = ?auto_694643 ?auto_694647 ) ) ( not ( = ?auto_694643 ?auto_694648 ) ) ( not ( = ?auto_694643 ?auto_694649 ) ) ( not ( = ?auto_694643 ?auto_694650 ) ) ( not ( = ?auto_694643 ?auto_694651 ) ) ( not ( = ?auto_694643 ?auto_694652 ) ) ( not ( = ?auto_694643 ?auto_694653 ) ) ( not ( = ?auto_694644 ?auto_694645 ) ) ( not ( = ?auto_694644 ?auto_694646 ) ) ( not ( = ?auto_694644 ?auto_694647 ) ) ( not ( = ?auto_694644 ?auto_694648 ) ) ( not ( = ?auto_694644 ?auto_694649 ) ) ( not ( = ?auto_694644 ?auto_694650 ) ) ( not ( = ?auto_694644 ?auto_694651 ) ) ( not ( = ?auto_694644 ?auto_694652 ) ) ( not ( = ?auto_694644 ?auto_694653 ) ) ( not ( = ?auto_694645 ?auto_694646 ) ) ( not ( = ?auto_694645 ?auto_694647 ) ) ( not ( = ?auto_694645 ?auto_694648 ) ) ( not ( = ?auto_694645 ?auto_694649 ) ) ( not ( = ?auto_694645 ?auto_694650 ) ) ( not ( = ?auto_694645 ?auto_694651 ) ) ( not ( = ?auto_694645 ?auto_694652 ) ) ( not ( = ?auto_694645 ?auto_694653 ) ) ( not ( = ?auto_694646 ?auto_694647 ) ) ( not ( = ?auto_694646 ?auto_694648 ) ) ( not ( = ?auto_694646 ?auto_694649 ) ) ( not ( = ?auto_694646 ?auto_694650 ) ) ( not ( = ?auto_694646 ?auto_694651 ) ) ( not ( = ?auto_694646 ?auto_694652 ) ) ( not ( = ?auto_694646 ?auto_694653 ) ) ( not ( = ?auto_694647 ?auto_694648 ) ) ( not ( = ?auto_694647 ?auto_694649 ) ) ( not ( = ?auto_694647 ?auto_694650 ) ) ( not ( = ?auto_694647 ?auto_694651 ) ) ( not ( = ?auto_694647 ?auto_694652 ) ) ( not ( = ?auto_694647 ?auto_694653 ) ) ( not ( = ?auto_694648 ?auto_694649 ) ) ( not ( = ?auto_694648 ?auto_694650 ) ) ( not ( = ?auto_694648 ?auto_694651 ) ) ( not ( = ?auto_694648 ?auto_694652 ) ) ( not ( = ?auto_694648 ?auto_694653 ) ) ( not ( = ?auto_694649 ?auto_694650 ) ) ( not ( = ?auto_694649 ?auto_694651 ) ) ( not ( = ?auto_694649 ?auto_694652 ) ) ( not ( = ?auto_694649 ?auto_694653 ) ) ( not ( = ?auto_694650 ?auto_694651 ) ) ( not ( = ?auto_694650 ?auto_694652 ) ) ( not ( = ?auto_694650 ?auto_694653 ) ) ( not ( = ?auto_694651 ?auto_694652 ) ) ( not ( = ?auto_694651 ?auto_694653 ) ) ( not ( = ?auto_694652 ?auto_694653 ) ) ( ON ?auto_694652 ?auto_694653 ) ( ON ?auto_694651 ?auto_694652 ) ( ON ?auto_694650 ?auto_694651 ) ( ON ?auto_694649 ?auto_694650 ) ( ON ?auto_694648 ?auto_694649 ) ( ON ?auto_694647 ?auto_694648 ) ( ON ?auto_694646 ?auto_694647 ) ( ON ?auto_694645 ?auto_694646 ) ( ON ?auto_694644 ?auto_694645 ) ( ON ?auto_694643 ?auto_694644 ) ( ON ?auto_694642 ?auto_694643 ) ( ON ?auto_694641 ?auto_694642 ) ( CLEAR ?auto_694639 ) ( ON ?auto_694640 ?auto_694641 ) ( CLEAR ?auto_694640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_694637 ?auto_694638 ?auto_694639 ?auto_694640 )
      ( MAKE-17PILE ?auto_694637 ?auto_694638 ?auto_694639 ?auto_694640 ?auto_694641 ?auto_694642 ?auto_694643 ?auto_694644 ?auto_694645 ?auto_694646 ?auto_694647 ?auto_694648 ?auto_694649 ?auto_694650 ?auto_694651 ?auto_694652 ?auto_694653 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694671 - BLOCK
      ?auto_694672 - BLOCK
      ?auto_694673 - BLOCK
      ?auto_694674 - BLOCK
      ?auto_694675 - BLOCK
      ?auto_694676 - BLOCK
      ?auto_694677 - BLOCK
      ?auto_694678 - BLOCK
      ?auto_694679 - BLOCK
      ?auto_694680 - BLOCK
      ?auto_694681 - BLOCK
      ?auto_694682 - BLOCK
      ?auto_694683 - BLOCK
      ?auto_694684 - BLOCK
      ?auto_694685 - BLOCK
      ?auto_694686 - BLOCK
      ?auto_694687 - BLOCK
    )
    :vars
    (
      ?auto_694688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694687 ?auto_694688 ) ( ON-TABLE ?auto_694671 ) ( ON ?auto_694672 ?auto_694671 ) ( not ( = ?auto_694671 ?auto_694672 ) ) ( not ( = ?auto_694671 ?auto_694673 ) ) ( not ( = ?auto_694671 ?auto_694674 ) ) ( not ( = ?auto_694671 ?auto_694675 ) ) ( not ( = ?auto_694671 ?auto_694676 ) ) ( not ( = ?auto_694671 ?auto_694677 ) ) ( not ( = ?auto_694671 ?auto_694678 ) ) ( not ( = ?auto_694671 ?auto_694679 ) ) ( not ( = ?auto_694671 ?auto_694680 ) ) ( not ( = ?auto_694671 ?auto_694681 ) ) ( not ( = ?auto_694671 ?auto_694682 ) ) ( not ( = ?auto_694671 ?auto_694683 ) ) ( not ( = ?auto_694671 ?auto_694684 ) ) ( not ( = ?auto_694671 ?auto_694685 ) ) ( not ( = ?auto_694671 ?auto_694686 ) ) ( not ( = ?auto_694671 ?auto_694687 ) ) ( not ( = ?auto_694671 ?auto_694688 ) ) ( not ( = ?auto_694672 ?auto_694673 ) ) ( not ( = ?auto_694672 ?auto_694674 ) ) ( not ( = ?auto_694672 ?auto_694675 ) ) ( not ( = ?auto_694672 ?auto_694676 ) ) ( not ( = ?auto_694672 ?auto_694677 ) ) ( not ( = ?auto_694672 ?auto_694678 ) ) ( not ( = ?auto_694672 ?auto_694679 ) ) ( not ( = ?auto_694672 ?auto_694680 ) ) ( not ( = ?auto_694672 ?auto_694681 ) ) ( not ( = ?auto_694672 ?auto_694682 ) ) ( not ( = ?auto_694672 ?auto_694683 ) ) ( not ( = ?auto_694672 ?auto_694684 ) ) ( not ( = ?auto_694672 ?auto_694685 ) ) ( not ( = ?auto_694672 ?auto_694686 ) ) ( not ( = ?auto_694672 ?auto_694687 ) ) ( not ( = ?auto_694672 ?auto_694688 ) ) ( not ( = ?auto_694673 ?auto_694674 ) ) ( not ( = ?auto_694673 ?auto_694675 ) ) ( not ( = ?auto_694673 ?auto_694676 ) ) ( not ( = ?auto_694673 ?auto_694677 ) ) ( not ( = ?auto_694673 ?auto_694678 ) ) ( not ( = ?auto_694673 ?auto_694679 ) ) ( not ( = ?auto_694673 ?auto_694680 ) ) ( not ( = ?auto_694673 ?auto_694681 ) ) ( not ( = ?auto_694673 ?auto_694682 ) ) ( not ( = ?auto_694673 ?auto_694683 ) ) ( not ( = ?auto_694673 ?auto_694684 ) ) ( not ( = ?auto_694673 ?auto_694685 ) ) ( not ( = ?auto_694673 ?auto_694686 ) ) ( not ( = ?auto_694673 ?auto_694687 ) ) ( not ( = ?auto_694673 ?auto_694688 ) ) ( not ( = ?auto_694674 ?auto_694675 ) ) ( not ( = ?auto_694674 ?auto_694676 ) ) ( not ( = ?auto_694674 ?auto_694677 ) ) ( not ( = ?auto_694674 ?auto_694678 ) ) ( not ( = ?auto_694674 ?auto_694679 ) ) ( not ( = ?auto_694674 ?auto_694680 ) ) ( not ( = ?auto_694674 ?auto_694681 ) ) ( not ( = ?auto_694674 ?auto_694682 ) ) ( not ( = ?auto_694674 ?auto_694683 ) ) ( not ( = ?auto_694674 ?auto_694684 ) ) ( not ( = ?auto_694674 ?auto_694685 ) ) ( not ( = ?auto_694674 ?auto_694686 ) ) ( not ( = ?auto_694674 ?auto_694687 ) ) ( not ( = ?auto_694674 ?auto_694688 ) ) ( not ( = ?auto_694675 ?auto_694676 ) ) ( not ( = ?auto_694675 ?auto_694677 ) ) ( not ( = ?auto_694675 ?auto_694678 ) ) ( not ( = ?auto_694675 ?auto_694679 ) ) ( not ( = ?auto_694675 ?auto_694680 ) ) ( not ( = ?auto_694675 ?auto_694681 ) ) ( not ( = ?auto_694675 ?auto_694682 ) ) ( not ( = ?auto_694675 ?auto_694683 ) ) ( not ( = ?auto_694675 ?auto_694684 ) ) ( not ( = ?auto_694675 ?auto_694685 ) ) ( not ( = ?auto_694675 ?auto_694686 ) ) ( not ( = ?auto_694675 ?auto_694687 ) ) ( not ( = ?auto_694675 ?auto_694688 ) ) ( not ( = ?auto_694676 ?auto_694677 ) ) ( not ( = ?auto_694676 ?auto_694678 ) ) ( not ( = ?auto_694676 ?auto_694679 ) ) ( not ( = ?auto_694676 ?auto_694680 ) ) ( not ( = ?auto_694676 ?auto_694681 ) ) ( not ( = ?auto_694676 ?auto_694682 ) ) ( not ( = ?auto_694676 ?auto_694683 ) ) ( not ( = ?auto_694676 ?auto_694684 ) ) ( not ( = ?auto_694676 ?auto_694685 ) ) ( not ( = ?auto_694676 ?auto_694686 ) ) ( not ( = ?auto_694676 ?auto_694687 ) ) ( not ( = ?auto_694676 ?auto_694688 ) ) ( not ( = ?auto_694677 ?auto_694678 ) ) ( not ( = ?auto_694677 ?auto_694679 ) ) ( not ( = ?auto_694677 ?auto_694680 ) ) ( not ( = ?auto_694677 ?auto_694681 ) ) ( not ( = ?auto_694677 ?auto_694682 ) ) ( not ( = ?auto_694677 ?auto_694683 ) ) ( not ( = ?auto_694677 ?auto_694684 ) ) ( not ( = ?auto_694677 ?auto_694685 ) ) ( not ( = ?auto_694677 ?auto_694686 ) ) ( not ( = ?auto_694677 ?auto_694687 ) ) ( not ( = ?auto_694677 ?auto_694688 ) ) ( not ( = ?auto_694678 ?auto_694679 ) ) ( not ( = ?auto_694678 ?auto_694680 ) ) ( not ( = ?auto_694678 ?auto_694681 ) ) ( not ( = ?auto_694678 ?auto_694682 ) ) ( not ( = ?auto_694678 ?auto_694683 ) ) ( not ( = ?auto_694678 ?auto_694684 ) ) ( not ( = ?auto_694678 ?auto_694685 ) ) ( not ( = ?auto_694678 ?auto_694686 ) ) ( not ( = ?auto_694678 ?auto_694687 ) ) ( not ( = ?auto_694678 ?auto_694688 ) ) ( not ( = ?auto_694679 ?auto_694680 ) ) ( not ( = ?auto_694679 ?auto_694681 ) ) ( not ( = ?auto_694679 ?auto_694682 ) ) ( not ( = ?auto_694679 ?auto_694683 ) ) ( not ( = ?auto_694679 ?auto_694684 ) ) ( not ( = ?auto_694679 ?auto_694685 ) ) ( not ( = ?auto_694679 ?auto_694686 ) ) ( not ( = ?auto_694679 ?auto_694687 ) ) ( not ( = ?auto_694679 ?auto_694688 ) ) ( not ( = ?auto_694680 ?auto_694681 ) ) ( not ( = ?auto_694680 ?auto_694682 ) ) ( not ( = ?auto_694680 ?auto_694683 ) ) ( not ( = ?auto_694680 ?auto_694684 ) ) ( not ( = ?auto_694680 ?auto_694685 ) ) ( not ( = ?auto_694680 ?auto_694686 ) ) ( not ( = ?auto_694680 ?auto_694687 ) ) ( not ( = ?auto_694680 ?auto_694688 ) ) ( not ( = ?auto_694681 ?auto_694682 ) ) ( not ( = ?auto_694681 ?auto_694683 ) ) ( not ( = ?auto_694681 ?auto_694684 ) ) ( not ( = ?auto_694681 ?auto_694685 ) ) ( not ( = ?auto_694681 ?auto_694686 ) ) ( not ( = ?auto_694681 ?auto_694687 ) ) ( not ( = ?auto_694681 ?auto_694688 ) ) ( not ( = ?auto_694682 ?auto_694683 ) ) ( not ( = ?auto_694682 ?auto_694684 ) ) ( not ( = ?auto_694682 ?auto_694685 ) ) ( not ( = ?auto_694682 ?auto_694686 ) ) ( not ( = ?auto_694682 ?auto_694687 ) ) ( not ( = ?auto_694682 ?auto_694688 ) ) ( not ( = ?auto_694683 ?auto_694684 ) ) ( not ( = ?auto_694683 ?auto_694685 ) ) ( not ( = ?auto_694683 ?auto_694686 ) ) ( not ( = ?auto_694683 ?auto_694687 ) ) ( not ( = ?auto_694683 ?auto_694688 ) ) ( not ( = ?auto_694684 ?auto_694685 ) ) ( not ( = ?auto_694684 ?auto_694686 ) ) ( not ( = ?auto_694684 ?auto_694687 ) ) ( not ( = ?auto_694684 ?auto_694688 ) ) ( not ( = ?auto_694685 ?auto_694686 ) ) ( not ( = ?auto_694685 ?auto_694687 ) ) ( not ( = ?auto_694685 ?auto_694688 ) ) ( not ( = ?auto_694686 ?auto_694687 ) ) ( not ( = ?auto_694686 ?auto_694688 ) ) ( not ( = ?auto_694687 ?auto_694688 ) ) ( ON ?auto_694686 ?auto_694687 ) ( ON ?auto_694685 ?auto_694686 ) ( ON ?auto_694684 ?auto_694685 ) ( ON ?auto_694683 ?auto_694684 ) ( ON ?auto_694682 ?auto_694683 ) ( ON ?auto_694681 ?auto_694682 ) ( ON ?auto_694680 ?auto_694681 ) ( ON ?auto_694679 ?auto_694680 ) ( ON ?auto_694678 ?auto_694679 ) ( ON ?auto_694677 ?auto_694678 ) ( ON ?auto_694676 ?auto_694677 ) ( ON ?auto_694675 ?auto_694676 ) ( ON ?auto_694674 ?auto_694675 ) ( CLEAR ?auto_694672 ) ( ON ?auto_694673 ?auto_694674 ) ( CLEAR ?auto_694673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_694671 ?auto_694672 ?auto_694673 )
      ( MAKE-17PILE ?auto_694671 ?auto_694672 ?auto_694673 ?auto_694674 ?auto_694675 ?auto_694676 ?auto_694677 ?auto_694678 ?auto_694679 ?auto_694680 ?auto_694681 ?auto_694682 ?auto_694683 ?auto_694684 ?auto_694685 ?auto_694686 ?auto_694687 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694706 - BLOCK
      ?auto_694707 - BLOCK
      ?auto_694708 - BLOCK
      ?auto_694709 - BLOCK
      ?auto_694710 - BLOCK
      ?auto_694711 - BLOCK
      ?auto_694712 - BLOCK
      ?auto_694713 - BLOCK
      ?auto_694714 - BLOCK
      ?auto_694715 - BLOCK
      ?auto_694716 - BLOCK
      ?auto_694717 - BLOCK
      ?auto_694718 - BLOCK
      ?auto_694719 - BLOCK
      ?auto_694720 - BLOCK
      ?auto_694721 - BLOCK
      ?auto_694722 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_694722 ) ( ON-TABLE ?auto_694706 ) ( ON ?auto_694707 ?auto_694706 ) ( not ( = ?auto_694706 ?auto_694707 ) ) ( not ( = ?auto_694706 ?auto_694708 ) ) ( not ( = ?auto_694706 ?auto_694709 ) ) ( not ( = ?auto_694706 ?auto_694710 ) ) ( not ( = ?auto_694706 ?auto_694711 ) ) ( not ( = ?auto_694706 ?auto_694712 ) ) ( not ( = ?auto_694706 ?auto_694713 ) ) ( not ( = ?auto_694706 ?auto_694714 ) ) ( not ( = ?auto_694706 ?auto_694715 ) ) ( not ( = ?auto_694706 ?auto_694716 ) ) ( not ( = ?auto_694706 ?auto_694717 ) ) ( not ( = ?auto_694706 ?auto_694718 ) ) ( not ( = ?auto_694706 ?auto_694719 ) ) ( not ( = ?auto_694706 ?auto_694720 ) ) ( not ( = ?auto_694706 ?auto_694721 ) ) ( not ( = ?auto_694706 ?auto_694722 ) ) ( not ( = ?auto_694707 ?auto_694708 ) ) ( not ( = ?auto_694707 ?auto_694709 ) ) ( not ( = ?auto_694707 ?auto_694710 ) ) ( not ( = ?auto_694707 ?auto_694711 ) ) ( not ( = ?auto_694707 ?auto_694712 ) ) ( not ( = ?auto_694707 ?auto_694713 ) ) ( not ( = ?auto_694707 ?auto_694714 ) ) ( not ( = ?auto_694707 ?auto_694715 ) ) ( not ( = ?auto_694707 ?auto_694716 ) ) ( not ( = ?auto_694707 ?auto_694717 ) ) ( not ( = ?auto_694707 ?auto_694718 ) ) ( not ( = ?auto_694707 ?auto_694719 ) ) ( not ( = ?auto_694707 ?auto_694720 ) ) ( not ( = ?auto_694707 ?auto_694721 ) ) ( not ( = ?auto_694707 ?auto_694722 ) ) ( not ( = ?auto_694708 ?auto_694709 ) ) ( not ( = ?auto_694708 ?auto_694710 ) ) ( not ( = ?auto_694708 ?auto_694711 ) ) ( not ( = ?auto_694708 ?auto_694712 ) ) ( not ( = ?auto_694708 ?auto_694713 ) ) ( not ( = ?auto_694708 ?auto_694714 ) ) ( not ( = ?auto_694708 ?auto_694715 ) ) ( not ( = ?auto_694708 ?auto_694716 ) ) ( not ( = ?auto_694708 ?auto_694717 ) ) ( not ( = ?auto_694708 ?auto_694718 ) ) ( not ( = ?auto_694708 ?auto_694719 ) ) ( not ( = ?auto_694708 ?auto_694720 ) ) ( not ( = ?auto_694708 ?auto_694721 ) ) ( not ( = ?auto_694708 ?auto_694722 ) ) ( not ( = ?auto_694709 ?auto_694710 ) ) ( not ( = ?auto_694709 ?auto_694711 ) ) ( not ( = ?auto_694709 ?auto_694712 ) ) ( not ( = ?auto_694709 ?auto_694713 ) ) ( not ( = ?auto_694709 ?auto_694714 ) ) ( not ( = ?auto_694709 ?auto_694715 ) ) ( not ( = ?auto_694709 ?auto_694716 ) ) ( not ( = ?auto_694709 ?auto_694717 ) ) ( not ( = ?auto_694709 ?auto_694718 ) ) ( not ( = ?auto_694709 ?auto_694719 ) ) ( not ( = ?auto_694709 ?auto_694720 ) ) ( not ( = ?auto_694709 ?auto_694721 ) ) ( not ( = ?auto_694709 ?auto_694722 ) ) ( not ( = ?auto_694710 ?auto_694711 ) ) ( not ( = ?auto_694710 ?auto_694712 ) ) ( not ( = ?auto_694710 ?auto_694713 ) ) ( not ( = ?auto_694710 ?auto_694714 ) ) ( not ( = ?auto_694710 ?auto_694715 ) ) ( not ( = ?auto_694710 ?auto_694716 ) ) ( not ( = ?auto_694710 ?auto_694717 ) ) ( not ( = ?auto_694710 ?auto_694718 ) ) ( not ( = ?auto_694710 ?auto_694719 ) ) ( not ( = ?auto_694710 ?auto_694720 ) ) ( not ( = ?auto_694710 ?auto_694721 ) ) ( not ( = ?auto_694710 ?auto_694722 ) ) ( not ( = ?auto_694711 ?auto_694712 ) ) ( not ( = ?auto_694711 ?auto_694713 ) ) ( not ( = ?auto_694711 ?auto_694714 ) ) ( not ( = ?auto_694711 ?auto_694715 ) ) ( not ( = ?auto_694711 ?auto_694716 ) ) ( not ( = ?auto_694711 ?auto_694717 ) ) ( not ( = ?auto_694711 ?auto_694718 ) ) ( not ( = ?auto_694711 ?auto_694719 ) ) ( not ( = ?auto_694711 ?auto_694720 ) ) ( not ( = ?auto_694711 ?auto_694721 ) ) ( not ( = ?auto_694711 ?auto_694722 ) ) ( not ( = ?auto_694712 ?auto_694713 ) ) ( not ( = ?auto_694712 ?auto_694714 ) ) ( not ( = ?auto_694712 ?auto_694715 ) ) ( not ( = ?auto_694712 ?auto_694716 ) ) ( not ( = ?auto_694712 ?auto_694717 ) ) ( not ( = ?auto_694712 ?auto_694718 ) ) ( not ( = ?auto_694712 ?auto_694719 ) ) ( not ( = ?auto_694712 ?auto_694720 ) ) ( not ( = ?auto_694712 ?auto_694721 ) ) ( not ( = ?auto_694712 ?auto_694722 ) ) ( not ( = ?auto_694713 ?auto_694714 ) ) ( not ( = ?auto_694713 ?auto_694715 ) ) ( not ( = ?auto_694713 ?auto_694716 ) ) ( not ( = ?auto_694713 ?auto_694717 ) ) ( not ( = ?auto_694713 ?auto_694718 ) ) ( not ( = ?auto_694713 ?auto_694719 ) ) ( not ( = ?auto_694713 ?auto_694720 ) ) ( not ( = ?auto_694713 ?auto_694721 ) ) ( not ( = ?auto_694713 ?auto_694722 ) ) ( not ( = ?auto_694714 ?auto_694715 ) ) ( not ( = ?auto_694714 ?auto_694716 ) ) ( not ( = ?auto_694714 ?auto_694717 ) ) ( not ( = ?auto_694714 ?auto_694718 ) ) ( not ( = ?auto_694714 ?auto_694719 ) ) ( not ( = ?auto_694714 ?auto_694720 ) ) ( not ( = ?auto_694714 ?auto_694721 ) ) ( not ( = ?auto_694714 ?auto_694722 ) ) ( not ( = ?auto_694715 ?auto_694716 ) ) ( not ( = ?auto_694715 ?auto_694717 ) ) ( not ( = ?auto_694715 ?auto_694718 ) ) ( not ( = ?auto_694715 ?auto_694719 ) ) ( not ( = ?auto_694715 ?auto_694720 ) ) ( not ( = ?auto_694715 ?auto_694721 ) ) ( not ( = ?auto_694715 ?auto_694722 ) ) ( not ( = ?auto_694716 ?auto_694717 ) ) ( not ( = ?auto_694716 ?auto_694718 ) ) ( not ( = ?auto_694716 ?auto_694719 ) ) ( not ( = ?auto_694716 ?auto_694720 ) ) ( not ( = ?auto_694716 ?auto_694721 ) ) ( not ( = ?auto_694716 ?auto_694722 ) ) ( not ( = ?auto_694717 ?auto_694718 ) ) ( not ( = ?auto_694717 ?auto_694719 ) ) ( not ( = ?auto_694717 ?auto_694720 ) ) ( not ( = ?auto_694717 ?auto_694721 ) ) ( not ( = ?auto_694717 ?auto_694722 ) ) ( not ( = ?auto_694718 ?auto_694719 ) ) ( not ( = ?auto_694718 ?auto_694720 ) ) ( not ( = ?auto_694718 ?auto_694721 ) ) ( not ( = ?auto_694718 ?auto_694722 ) ) ( not ( = ?auto_694719 ?auto_694720 ) ) ( not ( = ?auto_694719 ?auto_694721 ) ) ( not ( = ?auto_694719 ?auto_694722 ) ) ( not ( = ?auto_694720 ?auto_694721 ) ) ( not ( = ?auto_694720 ?auto_694722 ) ) ( not ( = ?auto_694721 ?auto_694722 ) ) ( ON ?auto_694721 ?auto_694722 ) ( ON ?auto_694720 ?auto_694721 ) ( ON ?auto_694719 ?auto_694720 ) ( ON ?auto_694718 ?auto_694719 ) ( ON ?auto_694717 ?auto_694718 ) ( ON ?auto_694716 ?auto_694717 ) ( ON ?auto_694715 ?auto_694716 ) ( ON ?auto_694714 ?auto_694715 ) ( ON ?auto_694713 ?auto_694714 ) ( ON ?auto_694712 ?auto_694713 ) ( ON ?auto_694711 ?auto_694712 ) ( ON ?auto_694710 ?auto_694711 ) ( ON ?auto_694709 ?auto_694710 ) ( CLEAR ?auto_694707 ) ( ON ?auto_694708 ?auto_694709 ) ( CLEAR ?auto_694708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_694706 ?auto_694707 ?auto_694708 )
      ( MAKE-17PILE ?auto_694706 ?auto_694707 ?auto_694708 ?auto_694709 ?auto_694710 ?auto_694711 ?auto_694712 ?auto_694713 ?auto_694714 ?auto_694715 ?auto_694716 ?auto_694717 ?auto_694718 ?auto_694719 ?auto_694720 ?auto_694721 ?auto_694722 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694740 - BLOCK
      ?auto_694741 - BLOCK
      ?auto_694742 - BLOCK
      ?auto_694743 - BLOCK
      ?auto_694744 - BLOCK
      ?auto_694745 - BLOCK
      ?auto_694746 - BLOCK
      ?auto_694747 - BLOCK
      ?auto_694748 - BLOCK
      ?auto_694749 - BLOCK
      ?auto_694750 - BLOCK
      ?auto_694751 - BLOCK
      ?auto_694752 - BLOCK
      ?auto_694753 - BLOCK
      ?auto_694754 - BLOCK
      ?auto_694755 - BLOCK
      ?auto_694756 - BLOCK
    )
    :vars
    (
      ?auto_694757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694756 ?auto_694757 ) ( ON-TABLE ?auto_694740 ) ( not ( = ?auto_694740 ?auto_694741 ) ) ( not ( = ?auto_694740 ?auto_694742 ) ) ( not ( = ?auto_694740 ?auto_694743 ) ) ( not ( = ?auto_694740 ?auto_694744 ) ) ( not ( = ?auto_694740 ?auto_694745 ) ) ( not ( = ?auto_694740 ?auto_694746 ) ) ( not ( = ?auto_694740 ?auto_694747 ) ) ( not ( = ?auto_694740 ?auto_694748 ) ) ( not ( = ?auto_694740 ?auto_694749 ) ) ( not ( = ?auto_694740 ?auto_694750 ) ) ( not ( = ?auto_694740 ?auto_694751 ) ) ( not ( = ?auto_694740 ?auto_694752 ) ) ( not ( = ?auto_694740 ?auto_694753 ) ) ( not ( = ?auto_694740 ?auto_694754 ) ) ( not ( = ?auto_694740 ?auto_694755 ) ) ( not ( = ?auto_694740 ?auto_694756 ) ) ( not ( = ?auto_694740 ?auto_694757 ) ) ( not ( = ?auto_694741 ?auto_694742 ) ) ( not ( = ?auto_694741 ?auto_694743 ) ) ( not ( = ?auto_694741 ?auto_694744 ) ) ( not ( = ?auto_694741 ?auto_694745 ) ) ( not ( = ?auto_694741 ?auto_694746 ) ) ( not ( = ?auto_694741 ?auto_694747 ) ) ( not ( = ?auto_694741 ?auto_694748 ) ) ( not ( = ?auto_694741 ?auto_694749 ) ) ( not ( = ?auto_694741 ?auto_694750 ) ) ( not ( = ?auto_694741 ?auto_694751 ) ) ( not ( = ?auto_694741 ?auto_694752 ) ) ( not ( = ?auto_694741 ?auto_694753 ) ) ( not ( = ?auto_694741 ?auto_694754 ) ) ( not ( = ?auto_694741 ?auto_694755 ) ) ( not ( = ?auto_694741 ?auto_694756 ) ) ( not ( = ?auto_694741 ?auto_694757 ) ) ( not ( = ?auto_694742 ?auto_694743 ) ) ( not ( = ?auto_694742 ?auto_694744 ) ) ( not ( = ?auto_694742 ?auto_694745 ) ) ( not ( = ?auto_694742 ?auto_694746 ) ) ( not ( = ?auto_694742 ?auto_694747 ) ) ( not ( = ?auto_694742 ?auto_694748 ) ) ( not ( = ?auto_694742 ?auto_694749 ) ) ( not ( = ?auto_694742 ?auto_694750 ) ) ( not ( = ?auto_694742 ?auto_694751 ) ) ( not ( = ?auto_694742 ?auto_694752 ) ) ( not ( = ?auto_694742 ?auto_694753 ) ) ( not ( = ?auto_694742 ?auto_694754 ) ) ( not ( = ?auto_694742 ?auto_694755 ) ) ( not ( = ?auto_694742 ?auto_694756 ) ) ( not ( = ?auto_694742 ?auto_694757 ) ) ( not ( = ?auto_694743 ?auto_694744 ) ) ( not ( = ?auto_694743 ?auto_694745 ) ) ( not ( = ?auto_694743 ?auto_694746 ) ) ( not ( = ?auto_694743 ?auto_694747 ) ) ( not ( = ?auto_694743 ?auto_694748 ) ) ( not ( = ?auto_694743 ?auto_694749 ) ) ( not ( = ?auto_694743 ?auto_694750 ) ) ( not ( = ?auto_694743 ?auto_694751 ) ) ( not ( = ?auto_694743 ?auto_694752 ) ) ( not ( = ?auto_694743 ?auto_694753 ) ) ( not ( = ?auto_694743 ?auto_694754 ) ) ( not ( = ?auto_694743 ?auto_694755 ) ) ( not ( = ?auto_694743 ?auto_694756 ) ) ( not ( = ?auto_694743 ?auto_694757 ) ) ( not ( = ?auto_694744 ?auto_694745 ) ) ( not ( = ?auto_694744 ?auto_694746 ) ) ( not ( = ?auto_694744 ?auto_694747 ) ) ( not ( = ?auto_694744 ?auto_694748 ) ) ( not ( = ?auto_694744 ?auto_694749 ) ) ( not ( = ?auto_694744 ?auto_694750 ) ) ( not ( = ?auto_694744 ?auto_694751 ) ) ( not ( = ?auto_694744 ?auto_694752 ) ) ( not ( = ?auto_694744 ?auto_694753 ) ) ( not ( = ?auto_694744 ?auto_694754 ) ) ( not ( = ?auto_694744 ?auto_694755 ) ) ( not ( = ?auto_694744 ?auto_694756 ) ) ( not ( = ?auto_694744 ?auto_694757 ) ) ( not ( = ?auto_694745 ?auto_694746 ) ) ( not ( = ?auto_694745 ?auto_694747 ) ) ( not ( = ?auto_694745 ?auto_694748 ) ) ( not ( = ?auto_694745 ?auto_694749 ) ) ( not ( = ?auto_694745 ?auto_694750 ) ) ( not ( = ?auto_694745 ?auto_694751 ) ) ( not ( = ?auto_694745 ?auto_694752 ) ) ( not ( = ?auto_694745 ?auto_694753 ) ) ( not ( = ?auto_694745 ?auto_694754 ) ) ( not ( = ?auto_694745 ?auto_694755 ) ) ( not ( = ?auto_694745 ?auto_694756 ) ) ( not ( = ?auto_694745 ?auto_694757 ) ) ( not ( = ?auto_694746 ?auto_694747 ) ) ( not ( = ?auto_694746 ?auto_694748 ) ) ( not ( = ?auto_694746 ?auto_694749 ) ) ( not ( = ?auto_694746 ?auto_694750 ) ) ( not ( = ?auto_694746 ?auto_694751 ) ) ( not ( = ?auto_694746 ?auto_694752 ) ) ( not ( = ?auto_694746 ?auto_694753 ) ) ( not ( = ?auto_694746 ?auto_694754 ) ) ( not ( = ?auto_694746 ?auto_694755 ) ) ( not ( = ?auto_694746 ?auto_694756 ) ) ( not ( = ?auto_694746 ?auto_694757 ) ) ( not ( = ?auto_694747 ?auto_694748 ) ) ( not ( = ?auto_694747 ?auto_694749 ) ) ( not ( = ?auto_694747 ?auto_694750 ) ) ( not ( = ?auto_694747 ?auto_694751 ) ) ( not ( = ?auto_694747 ?auto_694752 ) ) ( not ( = ?auto_694747 ?auto_694753 ) ) ( not ( = ?auto_694747 ?auto_694754 ) ) ( not ( = ?auto_694747 ?auto_694755 ) ) ( not ( = ?auto_694747 ?auto_694756 ) ) ( not ( = ?auto_694747 ?auto_694757 ) ) ( not ( = ?auto_694748 ?auto_694749 ) ) ( not ( = ?auto_694748 ?auto_694750 ) ) ( not ( = ?auto_694748 ?auto_694751 ) ) ( not ( = ?auto_694748 ?auto_694752 ) ) ( not ( = ?auto_694748 ?auto_694753 ) ) ( not ( = ?auto_694748 ?auto_694754 ) ) ( not ( = ?auto_694748 ?auto_694755 ) ) ( not ( = ?auto_694748 ?auto_694756 ) ) ( not ( = ?auto_694748 ?auto_694757 ) ) ( not ( = ?auto_694749 ?auto_694750 ) ) ( not ( = ?auto_694749 ?auto_694751 ) ) ( not ( = ?auto_694749 ?auto_694752 ) ) ( not ( = ?auto_694749 ?auto_694753 ) ) ( not ( = ?auto_694749 ?auto_694754 ) ) ( not ( = ?auto_694749 ?auto_694755 ) ) ( not ( = ?auto_694749 ?auto_694756 ) ) ( not ( = ?auto_694749 ?auto_694757 ) ) ( not ( = ?auto_694750 ?auto_694751 ) ) ( not ( = ?auto_694750 ?auto_694752 ) ) ( not ( = ?auto_694750 ?auto_694753 ) ) ( not ( = ?auto_694750 ?auto_694754 ) ) ( not ( = ?auto_694750 ?auto_694755 ) ) ( not ( = ?auto_694750 ?auto_694756 ) ) ( not ( = ?auto_694750 ?auto_694757 ) ) ( not ( = ?auto_694751 ?auto_694752 ) ) ( not ( = ?auto_694751 ?auto_694753 ) ) ( not ( = ?auto_694751 ?auto_694754 ) ) ( not ( = ?auto_694751 ?auto_694755 ) ) ( not ( = ?auto_694751 ?auto_694756 ) ) ( not ( = ?auto_694751 ?auto_694757 ) ) ( not ( = ?auto_694752 ?auto_694753 ) ) ( not ( = ?auto_694752 ?auto_694754 ) ) ( not ( = ?auto_694752 ?auto_694755 ) ) ( not ( = ?auto_694752 ?auto_694756 ) ) ( not ( = ?auto_694752 ?auto_694757 ) ) ( not ( = ?auto_694753 ?auto_694754 ) ) ( not ( = ?auto_694753 ?auto_694755 ) ) ( not ( = ?auto_694753 ?auto_694756 ) ) ( not ( = ?auto_694753 ?auto_694757 ) ) ( not ( = ?auto_694754 ?auto_694755 ) ) ( not ( = ?auto_694754 ?auto_694756 ) ) ( not ( = ?auto_694754 ?auto_694757 ) ) ( not ( = ?auto_694755 ?auto_694756 ) ) ( not ( = ?auto_694755 ?auto_694757 ) ) ( not ( = ?auto_694756 ?auto_694757 ) ) ( ON ?auto_694755 ?auto_694756 ) ( ON ?auto_694754 ?auto_694755 ) ( ON ?auto_694753 ?auto_694754 ) ( ON ?auto_694752 ?auto_694753 ) ( ON ?auto_694751 ?auto_694752 ) ( ON ?auto_694750 ?auto_694751 ) ( ON ?auto_694749 ?auto_694750 ) ( ON ?auto_694748 ?auto_694749 ) ( ON ?auto_694747 ?auto_694748 ) ( ON ?auto_694746 ?auto_694747 ) ( ON ?auto_694745 ?auto_694746 ) ( ON ?auto_694744 ?auto_694745 ) ( ON ?auto_694743 ?auto_694744 ) ( ON ?auto_694742 ?auto_694743 ) ( CLEAR ?auto_694740 ) ( ON ?auto_694741 ?auto_694742 ) ( CLEAR ?auto_694741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_694740 ?auto_694741 )
      ( MAKE-17PILE ?auto_694740 ?auto_694741 ?auto_694742 ?auto_694743 ?auto_694744 ?auto_694745 ?auto_694746 ?auto_694747 ?auto_694748 ?auto_694749 ?auto_694750 ?auto_694751 ?auto_694752 ?auto_694753 ?auto_694754 ?auto_694755 ?auto_694756 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694775 - BLOCK
      ?auto_694776 - BLOCK
      ?auto_694777 - BLOCK
      ?auto_694778 - BLOCK
      ?auto_694779 - BLOCK
      ?auto_694780 - BLOCK
      ?auto_694781 - BLOCK
      ?auto_694782 - BLOCK
      ?auto_694783 - BLOCK
      ?auto_694784 - BLOCK
      ?auto_694785 - BLOCK
      ?auto_694786 - BLOCK
      ?auto_694787 - BLOCK
      ?auto_694788 - BLOCK
      ?auto_694789 - BLOCK
      ?auto_694790 - BLOCK
      ?auto_694791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_694791 ) ( ON-TABLE ?auto_694775 ) ( not ( = ?auto_694775 ?auto_694776 ) ) ( not ( = ?auto_694775 ?auto_694777 ) ) ( not ( = ?auto_694775 ?auto_694778 ) ) ( not ( = ?auto_694775 ?auto_694779 ) ) ( not ( = ?auto_694775 ?auto_694780 ) ) ( not ( = ?auto_694775 ?auto_694781 ) ) ( not ( = ?auto_694775 ?auto_694782 ) ) ( not ( = ?auto_694775 ?auto_694783 ) ) ( not ( = ?auto_694775 ?auto_694784 ) ) ( not ( = ?auto_694775 ?auto_694785 ) ) ( not ( = ?auto_694775 ?auto_694786 ) ) ( not ( = ?auto_694775 ?auto_694787 ) ) ( not ( = ?auto_694775 ?auto_694788 ) ) ( not ( = ?auto_694775 ?auto_694789 ) ) ( not ( = ?auto_694775 ?auto_694790 ) ) ( not ( = ?auto_694775 ?auto_694791 ) ) ( not ( = ?auto_694776 ?auto_694777 ) ) ( not ( = ?auto_694776 ?auto_694778 ) ) ( not ( = ?auto_694776 ?auto_694779 ) ) ( not ( = ?auto_694776 ?auto_694780 ) ) ( not ( = ?auto_694776 ?auto_694781 ) ) ( not ( = ?auto_694776 ?auto_694782 ) ) ( not ( = ?auto_694776 ?auto_694783 ) ) ( not ( = ?auto_694776 ?auto_694784 ) ) ( not ( = ?auto_694776 ?auto_694785 ) ) ( not ( = ?auto_694776 ?auto_694786 ) ) ( not ( = ?auto_694776 ?auto_694787 ) ) ( not ( = ?auto_694776 ?auto_694788 ) ) ( not ( = ?auto_694776 ?auto_694789 ) ) ( not ( = ?auto_694776 ?auto_694790 ) ) ( not ( = ?auto_694776 ?auto_694791 ) ) ( not ( = ?auto_694777 ?auto_694778 ) ) ( not ( = ?auto_694777 ?auto_694779 ) ) ( not ( = ?auto_694777 ?auto_694780 ) ) ( not ( = ?auto_694777 ?auto_694781 ) ) ( not ( = ?auto_694777 ?auto_694782 ) ) ( not ( = ?auto_694777 ?auto_694783 ) ) ( not ( = ?auto_694777 ?auto_694784 ) ) ( not ( = ?auto_694777 ?auto_694785 ) ) ( not ( = ?auto_694777 ?auto_694786 ) ) ( not ( = ?auto_694777 ?auto_694787 ) ) ( not ( = ?auto_694777 ?auto_694788 ) ) ( not ( = ?auto_694777 ?auto_694789 ) ) ( not ( = ?auto_694777 ?auto_694790 ) ) ( not ( = ?auto_694777 ?auto_694791 ) ) ( not ( = ?auto_694778 ?auto_694779 ) ) ( not ( = ?auto_694778 ?auto_694780 ) ) ( not ( = ?auto_694778 ?auto_694781 ) ) ( not ( = ?auto_694778 ?auto_694782 ) ) ( not ( = ?auto_694778 ?auto_694783 ) ) ( not ( = ?auto_694778 ?auto_694784 ) ) ( not ( = ?auto_694778 ?auto_694785 ) ) ( not ( = ?auto_694778 ?auto_694786 ) ) ( not ( = ?auto_694778 ?auto_694787 ) ) ( not ( = ?auto_694778 ?auto_694788 ) ) ( not ( = ?auto_694778 ?auto_694789 ) ) ( not ( = ?auto_694778 ?auto_694790 ) ) ( not ( = ?auto_694778 ?auto_694791 ) ) ( not ( = ?auto_694779 ?auto_694780 ) ) ( not ( = ?auto_694779 ?auto_694781 ) ) ( not ( = ?auto_694779 ?auto_694782 ) ) ( not ( = ?auto_694779 ?auto_694783 ) ) ( not ( = ?auto_694779 ?auto_694784 ) ) ( not ( = ?auto_694779 ?auto_694785 ) ) ( not ( = ?auto_694779 ?auto_694786 ) ) ( not ( = ?auto_694779 ?auto_694787 ) ) ( not ( = ?auto_694779 ?auto_694788 ) ) ( not ( = ?auto_694779 ?auto_694789 ) ) ( not ( = ?auto_694779 ?auto_694790 ) ) ( not ( = ?auto_694779 ?auto_694791 ) ) ( not ( = ?auto_694780 ?auto_694781 ) ) ( not ( = ?auto_694780 ?auto_694782 ) ) ( not ( = ?auto_694780 ?auto_694783 ) ) ( not ( = ?auto_694780 ?auto_694784 ) ) ( not ( = ?auto_694780 ?auto_694785 ) ) ( not ( = ?auto_694780 ?auto_694786 ) ) ( not ( = ?auto_694780 ?auto_694787 ) ) ( not ( = ?auto_694780 ?auto_694788 ) ) ( not ( = ?auto_694780 ?auto_694789 ) ) ( not ( = ?auto_694780 ?auto_694790 ) ) ( not ( = ?auto_694780 ?auto_694791 ) ) ( not ( = ?auto_694781 ?auto_694782 ) ) ( not ( = ?auto_694781 ?auto_694783 ) ) ( not ( = ?auto_694781 ?auto_694784 ) ) ( not ( = ?auto_694781 ?auto_694785 ) ) ( not ( = ?auto_694781 ?auto_694786 ) ) ( not ( = ?auto_694781 ?auto_694787 ) ) ( not ( = ?auto_694781 ?auto_694788 ) ) ( not ( = ?auto_694781 ?auto_694789 ) ) ( not ( = ?auto_694781 ?auto_694790 ) ) ( not ( = ?auto_694781 ?auto_694791 ) ) ( not ( = ?auto_694782 ?auto_694783 ) ) ( not ( = ?auto_694782 ?auto_694784 ) ) ( not ( = ?auto_694782 ?auto_694785 ) ) ( not ( = ?auto_694782 ?auto_694786 ) ) ( not ( = ?auto_694782 ?auto_694787 ) ) ( not ( = ?auto_694782 ?auto_694788 ) ) ( not ( = ?auto_694782 ?auto_694789 ) ) ( not ( = ?auto_694782 ?auto_694790 ) ) ( not ( = ?auto_694782 ?auto_694791 ) ) ( not ( = ?auto_694783 ?auto_694784 ) ) ( not ( = ?auto_694783 ?auto_694785 ) ) ( not ( = ?auto_694783 ?auto_694786 ) ) ( not ( = ?auto_694783 ?auto_694787 ) ) ( not ( = ?auto_694783 ?auto_694788 ) ) ( not ( = ?auto_694783 ?auto_694789 ) ) ( not ( = ?auto_694783 ?auto_694790 ) ) ( not ( = ?auto_694783 ?auto_694791 ) ) ( not ( = ?auto_694784 ?auto_694785 ) ) ( not ( = ?auto_694784 ?auto_694786 ) ) ( not ( = ?auto_694784 ?auto_694787 ) ) ( not ( = ?auto_694784 ?auto_694788 ) ) ( not ( = ?auto_694784 ?auto_694789 ) ) ( not ( = ?auto_694784 ?auto_694790 ) ) ( not ( = ?auto_694784 ?auto_694791 ) ) ( not ( = ?auto_694785 ?auto_694786 ) ) ( not ( = ?auto_694785 ?auto_694787 ) ) ( not ( = ?auto_694785 ?auto_694788 ) ) ( not ( = ?auto_694785 ?auto_694789 ) ) ( not ( = ?auto_694785 ?auto_694790 ) ) ( not ( = ?auto_694785 ?auto_694791 ) ) ( not ( = ?auto_694786 ?auto_694787 ) ) ( not ( = ?auto_694786 ?auto_694788 ) ) ( not ( = ?auto_694786 ?auto_694789 ) ) ( not ( = ?auto_694786 ?auto_694790 ) ) ( not ( = ?auto_694786 ?auto_694791 ) ) ( not ( = ?auto_694787 ?auto_694788 ) ) ( not ( = ?auto_694787 ?auto_694789 ) ) ( not ( = ?auto_694787 ?auto_694790 ) ) ( not ( = ?auto_694787 ?auto_694791 ) ) ( not ( = ?auto_694788 ?auto_694789 ) ) ( not ( = ?auto_694788 ?auto_694790 ) ) ( not ( = ?auto_694788 ?auto_694791 ) ) ( not ( = ?auto_694789 ?auto_694790 ) ) ( not ( = ?auto_694789 ?auto_694791 ) ) ( not ( = ?auto_694790 ?auto_694791 ) ) ( ON ?auto_694790 ?auto_694791 ) ( ON ?auto_694789 ?auto_694790 ) ( ON ?auto_694788 ?auto_694789 ) ( ON ?auto_694787 ?auto_694788 ) ( ON ?auto_694786 ?auto_694787 ) ( ON ?auto_694785 ?auto_694786 ) ( ON ?auto_694784 ?auto_694785 ) ( ON ?auto_694783 ?auto_694784 ) ( ON ?auto_694782 ?auto_694783 ) ( ON ?auto_694781 ?auto_694782 ) ( ON ?auto_694780 ?auto_694781 ) ( ON ?auto_694779 ?auto_694780 ) ( ON ?auto_694778 ?auto_694779 ) ( ON ?auto_694777 ?auto_694778 ) ( CLEAR ?auto_694775 ) ( ON ?auto_694776 ?auto_694777 ) ( CLEAR ?auto_694776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_694775 ?auto_694776 )
      ( MAKE-17PILE ?auto_694775 ?auto_694776 ?auto_694777 ?auto_694778 ?auto_694779 ?auto_694780 ?auto_694781 ?auto_694782 ?auto_694783 ?auto_694784 ?auto_694785 ?auto_694786 ?auto_694787 ?auto_694788 ?auto_694789 ?auto_694790 ?auto_694791 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694809 - BLOCK
      ?auto_694810 - BLOCK
      ?auto_694811 - BLOCK
      ?auto_694812 - BLOCK
      ?auto_694813 - BLOCK
      ?auto_694814 - BLOCK
      ?auto_694815 - BLOCK
      ?auto_694816 - BLOCK
      ?auto_694817 - BLOCK
      ?auto_694818 - BLOCK
      ?auto_694819 - BLOCK
      ?auto_694820 - BLOCK
      ?auto_694821 - BLOCK
      ?auto_694822 - BLOCK
      ?auto_694823 - BLOCK
      ?auto_694824 - BLOCK
      ?auto_694825 - BLOCK
    )
    :vars
    (
      ?auto_694826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_694825 ?auto_694826 ) ( not ( = ?auto_694809 ?auto_694810 ) ) ( not ( = ?auto_694809 ?auto_694811 ) ) ( not ( = ?auto_694809 ?auto_694812 ) ) ( not ( = ?auto_694809 ?auto_694813 ) ) ( not ( = ?auto_694809 ?auto_694814 ) ) ( not ( = ?auto_694809 ?auto_694815 ) ) ( not ( = ?auto_694809 ?auto_694816 ) ) ( not ( = ?auto_694809 ?auto_694817 ) ) ( not ( = ?auto_694809 ?auto_694818 ) ) ( not ( = ?auto_694809 ?auto_694819 ) ) ( not ( = ?auto_694809 ?auto_694820 ) ) ( not ( = ?auto_694809 ?auto_694821 ) ) ( not ( = ?auto_694809 ?auto_694822 ) ) ( not ( = ?auto_694809 ?auto_694823 ) ) ( not ( = ?auto_694809 ?auto_694824 ) ) ( not ( = ?auto_694809 ?auto_694825 ) ) ( not ( = ?auto_694809 ?auto_694826 ) ) ( not ( = ?auto_694810 ?auto_694811 ) ) ( not ( = ?auto_694810 ?auto_694812 ) ) ( not ( = ?auto_694810 ?auto_694813 ) ) ( not ( = ?auto_694810 ?auto_694814 ) ) ( not ( = ?auto_694810 ?auto_694815 ) ) ( not ( = ?auto_694810 ?auto_694816 ) ) ( not ( = ?auto_694810 ?auto_694817 ) ) ( not ( = ?auto_694810 ?auto_694818 ) ) ( not ( = ?auto_694810 ?auto_694819 ) ) ( not ( = ?auto_694810 ?auto_694820 ) ) ( not ( = ?auto_694810 ?auto_694821 ) ) ( not ( = ?auto_694810 ?auto_694822 ) ) ( not ( = ?auto_694810 ?auto_694823 ) ) ( not ( = ?auto_694810 ?auto_694824 ) ) ( not ( = ?auto_694810 ?auto_694825 ) ) ( not ( = ?auto_694810 ?auto_694826 ) ) ( not ( = ?auto_694811 ?auto_694812 ) ) ( not ( = ?auto_694811 ?auto_694813 ) ) ( not ( = ?auto_694811 ?auto_694814 ) ) ( not ( = ?auto_694811 ?auto_694815 ) ) ( not ( = ?auto_694811 ?auto_694816 ) ) ( not ( = ?auto_694811 ?auto_694817 ) ) ( not ( = ?auto_694811 ?auto_694818 ) ) ( not ( = ?auto_694811 ?auto_694819 ) ) ( not ( = ?auto_694811 ?auto_694820 ) ) ( not ( = ?auto_694811 ?auto_694821 ) ) ( not ( = ?auto_694811 ?auto_694822 ) ) ( not ( = ?auto_694811 ?auto_694823 ) ) ( not ( = ?auto_694811 ?auto_694824 ) ) ( not ( = ?auto_694811 ?auto_694825 ) ) ( not ( = ?auto_694811 ?auto_694826 ) ) ( not ( = ?auto_694812 ?auto_694813 ) ) ( not ( = ?auto_694812 ?auto_694814 ) ) ( not ( = ?auto_694812 ?auto_694815 ) ) ( not ( = ?auto_694812 ?auto_694816 ) ) ( not ( = ?auto_694812 ?auto_694817 ) ) ( not ( = ?auto_694812 ?auto_694818 ) ) ( not ( = ?auto_694812 ?auto_694819 ) ) ( not ( = ?auto_694812 ?auto_694820 ) ) ( not ( = ?auto_694812 ?auto_694821 ) ) ( not ( = ?auto_694812 ?auto_694822 ) ) ( not ( = ?auto_694812 ?auto_694823 ) ) ( not ( = ?auto_694812 ?auto_694824 ) ) ( not ( = ?auto_694812 ?auto_694825 ) ) ( not ( = ?auto_694812 ?auto_694826 ) ) ( not ( = ?auto_694813 ?auto_694814 ) ) ( not ( = ?auto_694813 ?auto_694815 ) ) ( not ( = ?auto_694813 ?auto_694816 ) ) ( not ( = ?auto_694813 ?auto_694817 ) ) ( not ( = ?auto_694813 ?auto_694818 ) ) ( not ( = ?auto_694813 ?auto_694819 ) ) ( not ( = ?auto_694813 ?auto_694820 ) ) ( not ( = ?auto_694813 ?auto_694821 ) ) ( not ( = ?auto_694813 ?auto_694822 ) ) ( not ( = ?auto_694813 ?auto_694823 ) ) ( not ( = ?auto_694813 ?auto_694824 ) ) ( not ( = ?auto_694813 ?auto_694825 ) ) ( not ( = ?auto_694813 ?auto_694826 ) ) ( not ( = ?auto_694814 ?auto_694815 ) ) ( not ( = ?auto_694814 ?auto_694816 ) ) ( not ( = ?auto_694814 ?auto_694817 ) ) ( not ( = ?auto_694814 ?auto_694818 ) ) ( not ( = ?auto_694814 ?auto_694819 ) ) ( not ( = ?auto_694814 ?auto_694820 ) ) ( not ( = ?auto_694814 ?auto_694821 ) ) ( not ( = ?auto_694814 ?auto_694822 ) ) ( not ( = ?auto_694814 ?auto_694823 ) ) ( not ( = ?auto_694814 ?auto_694824 ) ) ( not ( = ?auto_694814 ?auto_694825 ) ) ( not ( = ?auto_694814 ?auto_694826 ) ) ( not ( = ?auto_694815 ?auto_694816 ) ) ( not ( = ?auto_694815 ?auto_694817 ) ) ( not ( = ?auto_694815 ?auto_694818 ) ) ( not ( = ?auto_694815 ?auto_694819 ) ) ( not ( = ?auto_694815 ?auto_694820 ) ) ( not ( = ?auto_694815 ?auto_694821 ) ) ( not ( = ?auto_694815 ?auto_694822 ) ) ( not ( = ?auto_694815 ?auto_694823 ) ) ( not ( = ?auto_694815 ?auto_694824 ) ) ( not ( = ?auto_694815 ?auto_694825 ) ) ( not ( = ?auto_694815 ?auto_694826 ) ) ( not ( = ?auto_694816 ?auto_694817 ) ) ( not ( = ?auto_694816 ?auto_694818 ) ) ( not ( = ?auto_694816 ?auto_694819 ) ) ( not ( = ?auto_694816 ?auto_694820 ) ) ( not ( = ?auto_694816 ?auto_694821 ) ) ( not ( = ?auto_694816 ?auto_694822 ) ) ( not ( = ?auto_694816 ?auto_694823 ) ) ( not ( = ?auto_694816 ?auto_694824 ) ) ( not ( = ?auto_694816 ?auto_694825 ) ) ( not ( = ?auto_694816 ?auto_694826 ) ) ( not ( = ?auto_694817 ?auto_694818 ) ) ( not ( = ?auto_694817 ?auto_694819 ) ) ( not ( = ?auto_694817 ?auto_694820 ) ) ( not ( = ?auto_694817 ?auto_694821 ) ) ( not ( = ?auto_694817 ?auto_694822 ) ) ( not ( = ?auto_694817 ?auto_694823 ) ) ( not ( = ?auto_694817 ?auto_694824 ) ) ( not ( = ?auto_694817 ?auto_694825 ) ) ( not ( = ?auto_694817 ?auto_694826 ) ) ( not ( = ?auto_694818 ?auto_694819 ) ) ( not ( = ?auto_694818 ?auto_694820 ) ) ( not ( = ?auto_694818 ?auto_694821 ) ) ( not ( = ?auto_694818 ?auto_694822 ) ) ( not ( = ?auto_694818 ?auto_694823 ) ) ( not ( = ?auto_694818 ?auto_694824 ) ) ( not ( = ?auto_694818 ?auto_694825 ) ) ( not ( = ?auto_694818 ?auto_694826 ) ) ( not ( = ?auto_694819 ?auto_694820 ) ) ( not ( = ?auto_694819 ?auto_694821 ) ) ( not ( = ?auto_694819 ?auto_694822 ) ) ( not ( = ?auto_694819 ?auto_694823 ) ) ( not ( = ?auto_694819 ?auto_694824 ) ) ( not ( = ?auto_694819 ?auto_694825 ) ) ( not ( = ?auto_694819 ?auto_694826 ) ) ( not ( = ?auto_694820 ?auto_694821 ) ) ( not ( = ?auto_694820 ?auto_694822 ) ) ( not ( = ?auto_694820 ?auto_694823 ) ) ( not ( = ?auto_694820 ?auto_694824 ) ) ( not ( = ?auto_694820 ?auto_694825 ) ) ( not ( = ?auto_694820 ?auto_694826 ) ) ( not ( = ?auto_694821 ?auto_694822 ) ) ( not ( = ?auto_694821 ?auto_694823 ) ) ( not ( = ?auto_694821 ?auto_694824 ) ) ( not ( = ?auto_694821 ?auto_694825 ) ) ( not ( = ?auto_694821 ?auto_694826 ) ) ( not ( = ?auto_694822 ?auto_694823 ) ) ( not ( = ?auto_694822 ?auto_694824 ) ) ( not ( = ?auto_694822 ?auto_694825 ) ) ( not ( = ?auto_694822 ?auto_694826 ) ) ( not ( = ?auto_694823 ?auto_694824 ) ) ( not ( = ?auto_694823 ?auto_694825 ) ) ( not ( = ?auto_694823 ?auto_694826 ) ) ( not ( = ?auto_694824 ?auto_694825 ) ) ( not ( = ?auto_694824 ?auto_694826 ) ) ( not ( = ?auto_694825 ?auto_694826 ) ) ( ON ?auto_694824 ?auto_694825 ) ( ON ?auto_694823 ?auto_694824 ) ( ON ?auto_694822 ?auto_694823 ) ( ON ?auto_694821 ?auto_694822 ) ( ON ?auto_694820 ?auto_694821 ) ( ON ?auto_694819 ?auto_694820 ) ( ON ?auto_694818 ?auto_694819 ) ( ON ?auto_694817 ?auto_694818 ) ( ON ?auto_694816 ?auto_694817 ) ( ON ?auto_694815 ?auto_694816 ) ( ON ?auto_694814 ?auto_694815 ) ( ON ?auto_694813 ?auto_694814 ) ( ON ?auto_694812 ?auto_694813 ) ( ON ?auto_694811 ?auto_694812 ) ( ON ?auto_694810 ?auto_694811 ) ( ON ?auto_694809 ?auto_694810 ) ( CLEAR ?auto_694809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_694809 )
      ( MAKE-17PILE ?auto_694809 ?auto_694810 ?auto_694811 ?auto_694812 ?auto_694813 ?auto_694814 ?auto_694815 ?auto_694816 ?auto_694817 ?auto_694818 ?auto_694819 ?auto_694820 ?auto_694821 ?auto_694822 ?auto_694823 ?auto_694824 ?auto_694825 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694844 - BLOCK
      ?auto_694845 - BLOCK
      ?auto_694846 - BLOCK
      ?auto_694847 - BLOCK
      ?auto_694848 - BLOCK
      ?auto_694849 - BLOCK
      ?auto_694850 - BLOCK
      ?auto_694851 - BLOCK
      ?auto_694852 - BLOCK
      ?auto_694853 - BLOCK
      ?auto_694854 - BLOCK
      ?auto_694855 - BLOCK
      ?auto_694856 - BLOCK
      ?auto_694857 - BLOCK
      ?auto_694858 - BLOCK
      ?auto_694859 - BLOCK
      ?auto_694860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_694860 ) ( not ( = ?auto_694844 ?auto_694845 ) ) ( not ( = ?auto_694844 ?auto_694846 ) ) ( not ( = ?auto_694844 ?auto_694847 ) ) ( not ( = ?auto_694844 ?auto_694848 ) ) ( not ( = ?auto_694844 ?auto_694849 ) ) ( not ( = ?auto_694844 ?auto_694850 ) ) ( not ( = ?auto_694844 ?auto_694851 ) ) ( not ( = ?auto_694844 ?auto_694852 ) ) ( not ( = ?auto_694844 ?auto_694853 ) ) ( not ( = ?auto_694844 ?auto_694854 ) ) ( not ( = ?auto_694844 ?auto_694855 ) ) ( not ( = ?auto_694844 ?auto_694856 ) ) ( not ( = ?auto_694844 ?auto_694857 ) ) ( not ( = ?auto_694844 ?auto_694858 ) ) ( not ( = ?auto_694844 ?auto_694859 ) ) ( not ( = ?auto_694844 ?auto_694860 ) ) ( not ( = ?auto_694845 ?auto_694846 ) ) ( not ( = ?auto_694845 ?auto_694847 ) ) ( not ( = ?auto_694845 ?auto_694848 ) ) ( not ( = ?auto_694845 ?auto_694849 ) ) ( not ( = ?auto_694845 ?auto_694850 ) ) ( not ( = ?auto_694845 ?auto_694851 ) ) ( not ( = ?auto_694845 ?auto_694852 ) ) ( not ( = ?auto_694845 ?auto_694853 ) ) ( not ( = ?auto_694845 ?auto_694854 ) ) ( not ( = ?auto_694845 ?auto_694855 ) ) ( not ( = ?auto_694845 ?auto_694856 ) ) ( not ( = ?auto_694845 ?auto_694857 ) ) ( not ( = ?auto_694845 ?auto_694858 ) ) ( not ( = ?auto_694845 ?auto_694859 ) ) ( not ( = ?auto_694845 ?auto_694860 ) ) ( not ( = ?auto_694846 ?auto_694847 ) ) ( not ( = ?auto_694846 ?auto_694848 ) ) ( not ( = ?auto_694846 ?auto_694849 ) ) ( not ( = ?auto_694846 ?auto_694850 ) ) ( not ( = ?auto_694846 ?auto_694851 ) ) ( not ( = ?auto_694846 ?auto_694852 ) ) ( not ( = ?auto_694846 ?auto_694853 ) ) ( not ( = ?auto_694846 ?auto_694854 ) ) ( not ( = ?auto_694846 ?auto_694855 ) ) ( not ( = ?auto_694846 ?auto_694856 ) ) ( not ( = ?auto_694846 ?auto_694857 ) ) ( not ( = ?auto_694846 ?auto_694858 ) ) ( not ( = ?auto_694846 ?auto_694859 ) ) ( not ( = ?auto_694846 ?auto_694860 ) ) ( not ( = ?auto_694847 ?auto_694848 ) ) ( not ( = ?auto_694847 ?auto_694849 ) ) ( not ( = ?auto_694847 ?auto_694850 ) ) ( not ( = ?auto_694847 ?auto_694851 ) ) ( not ( = ?auto_694847 ?auto_694852 ) ) ( not ( = ?auto_694847 ?auto_694853 ) ) ( not ( = ?auto_694847 ?auto_694854 ) ) ( not ( = ?auto_694847 ?auto_694855 ) ) ( not ( = ?auto_694847 ?auto_694856 ) ) ( not ( = ?auto_694847 ?auto_694857 ) ) ( not ( = ?auto_694847 ?auto_694858 ) ) ( not ( = ?auto_694847 ?auto_694859 ) ) ( not ( = ?auto_694847 ?auto_694860 ) ) ( not ( = ?auto_694848 ?auto_694849 ) ) ( not ( = ?auto_694848 ?auto_694850 ) ) ( not ( = ?auto_694848 ?auto_694851 ) ) ( not ( = ?auto_694848 ?auto_694852 ) ) ( not ( = ?auto_694848 ?auto_694853 ) ) ( not ( = ?auto_694848 ?auto_694854 ) ) ( not ( = ?auto_694848 ?auto_694855 ) ) ( not ( = ?auto_694848 ?auto_694856 ) ) ( not ( = ?auto_694848 ?auto_694857 ) ) ( not ( = ?auto_694848 ?auto_694858 ) ) ( not ( = ?auto_694848 ?auto_694859 ) ) ( not ( = ?auto_694848 ?auto_694860 ) ) ( not ( = ?auto_694849 ?auto_694850 ) ) ( not ( = ?auto_694849 ?auto_694851 ) ) ( not ( = ?auto_694849 ?auto_694852 ) ) ( not ( = ?auto_694849 ?auto_694853 ) ) ( not ( = ?auto_694849 ?auto_694854 ) ) ( not ( = ?auto_694849 ?auto_694855 ) ) ( not ( = ?auto_694849 ?auto_694856 ) ) ( not ( = ?auto_694849 ?auto_694857 ) ) ( not ( = ?auto_694849 ?auto_694858 ) ) ( not ( = ?auto_694849 ?auto_694859 ) ) ( not ( = ?auto_694849 ?auto_694860 ) ) ( not ( = ?auto_694850 ?auto_694851 ) ) ( not ( = ?auto_694850 ?auto_694852 ) ) ( not ( = ?auto_694850 ?auto_694853 ) ) ( not ( = ?auto_694850 ?auto_694854 ) ) ( not ( = ?auto_694850 ?auto_694855 ) ) ( not ( = ?auto_694850 ?auto_694856 ) ) ( not ( = ?auto_694850 ?auto_694857 ) ) ( not ( = ?auto_694850 ?auto_694858 ) ) ( not ( = ?auto_694850 ?auto_694859 ) ) ( not ( = ?auto_694850 ?auto_694860 ) ) ( not ( = ?auto_694851 ?auto_694852 ) ) ( not ( = ?auto_694851 ?auto_694853 ) ) ( not ( = ?auto_694851 ?auto_694854 ) ) ( not ( = ?auto_694851 ?auto_694855 ) ) ( not ( = ?auto_694851 ?auto_694856 ) ) ( not ( = ?auto_694851 ?auto_694857 ) ) ( not ( = ?auto_694851 ?auto_694858 ) ) ( not ( = ?auto_694851 ?auto_694859 ) ) ( not ( = ?auto_694851 ?auto_694860 ) ) ( not ( = ?auto_694852 ?auto_694853 ) ) ( not ( = ?auto_694852 ?auto_694854 ) ) ( not ( = ?auto_694852 ?auto_694855 ) ) ( not ( = ?auto_694852 ?auto_694856 ) ) ( not ( = ?auto_694852 ?auto_694857 ) ) ( not ( = ?auto_694852 ?auto_694858 ) ) ( not ( = ?auto_694852 ?auto_694859 ) ) ( not ( = ?auto_694852 ?auto_694860 ) ) ( not ( = ?auto_694853 ?auto_694854 ) ) ( not ( = ?auto_694853 ?auto_694855 ) ) ( not ( = ?auto_694853 ?auto_694856 ) ) ( not ( = ?auto_694853 ?auto_694857 ) ) ( not ( = ?auto_694853 ?auto_694858 ) ) ( not ( = ?auto_694853 ?auto_694859 ) ) ( not ( = ?auto_694853 ?auto_694860 ) ) ( not ( = ?auto_694854 ?auto_694855 ) ) ( not ( = ?auto_694854 ?auto_694856 ) ) ( not ( = ?auto_694854 ?auto_694857 ) ) ( not ( = ?auto_694854 ?auto_694858 ) ) ( not ( = ?auto_694854 ?auto_694859 ) ) ( not ( = ?auto_694854 ?auto_694860 ) ) ( not ( = ?auto_694855 ?auto_694856 ) ) ( not ( = ?auto_694855 ?auto_694857 ) ) ( not ( = ?auto_694855 ?auto_694858 ) ) ( not ( = ?auto_694855 ?auto_694859 ) ) ( not ( = ?auto_694855 ?auto_694860 ) ) ( not ( = ?auto_694856 ?auto_694857 ) ) ( not ( = ?auto_694856 ?auto_694858 ) ) ( not ( = ?auto_694856 ?auto_694859 ) ) ( not ( = ?auto_694856 ?auto_694860 ) ) ( not ( = ?auto_694857 ?auto_694858 ) ) ( not ( = ?auto_694857 ?auto_694859 ) ) ( not ( = ?auto_694857 ?auto_694860 ) ) ( not ( = ?auto_694858 ?auto_694859 ) ) ( not ( = ?auto_694858 ?auto_694860 ) ) ( not ( = ?auto_694859 ?auto_694860 ) ) ( ON ?auto_694859 ?auto_694860 ) ( ON ?auto_694858 ?auto_694859 ) ( ON ?auto_694857 ?auto_694858 ) ( ON ?auto_694856 ?auto_694857 ) ( ON ?auto_694855 ?auto_694856 ) ( ON ?auto_694854 ?auto_694855 ) ( ON ?auto_694853 ?auto_694854 ) ( ON ?auto_694852 ?auto_694853 ) ( ON ?auto_694851 ?auto_694852 ) ( ON ?auto_694850 ?auto_694851 ) ( ON ?auto_694849 ?auto_694850 ) ( ON ?auto_694848 ?auto_694849 ) ( ON ?auto_694847 ?auto_694848 ) ( ON ?auto_694846 ?auto_694847 ) ( ON ?auto_694845 ?auto_694846 ) ( ON ?auto_694844 ?auto_694845 ) ( CLEAR ?auto_694844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_694844 )
      ( MAKE-17PILE ?auto_694844 ?auto_694845 ?auto_694846 ?auto_694847 ?auto_694848 ?auto_694849 ?auto_694850 ?auto_694851 ?auto_694852 ?auto_694853 ?auto_694854 ?auto_694855 ?auto_694856 ?auto_694857 ?auto_694858 ?auto_694859 ?auto_694860 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_694878 - BLOCK
      ?auto_694879 - BLOCK
      ?auto_694880 - BLOCK
      ?auto_694881 - BLOCK
      ?auto_694882 - BLOCK
      ?auto_694883 - BLOCK
      ?auto_694884 - BLOCK
      ?auto_694885 - BLOCK
      ?auto_694886 - BLOCK
      ?auto_694887 - BLOCK
      ?auto_694888 - BLOCK
      ?auto_694889 - BLOCK
      ?auto_694890 - BLOCK
      ?auto_694891 - BLOCK
      ?auto_694892 - BLOCK
      ?auto_694893 - BLOCK
      ?auto_694894 - BLOCK
    )
    :vars
    (
      ?auto_694895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_694878 ?auto_694879 ) ) ( not ( = ?auto_694878 ?auto_694880 ) ) ( not ( = ?auto_694878 ?auto_694881 ) ) ( not ( = ?auto_694878 ?auto_694882 ) ) ( not ( = ?auto_694878 ?auto_694883 ) ) ( not ( = ?auto_694878 ?auto_694884 ) ) ( not ( = ?auto_694878 ?auto_694885 ) ) ( not ( = ?auto_694878 ?auto_694886 ) ) ( not ( = ?auto_694878 ?auto_694887 ) ) ( not ( = ?auto_694878 ?auto_694888 ) ) ( not ( = ?auto_694878 ?auto_694889 ) ) ( not ( = ?auto_694878 ?auto_694890 ) ) ( not ( = ?auto_694878 ?auto_694891 ) ) ( not ( = ?auto_694878 ?auto_694892 ) ) ( not ( = ?auto_694878 ?auto_694893 ) ) ( not ( = ?auto_694878 ?auto_694894 ) ) ( not ( = ?auto_694879 ?auto_694880 ) ) ( not ( = ?auto_694879 ?auto_694881 ) ) ( not ( = ?auto_694879 ?auto_694882 ) ) ( not ( = ?auto_694879 ?auto_694883 ) ) ( not ( = ?auto_694879 ?auto_694884 ) ) ( not ( = ?auto_694879 ?auto_694885 ) ) ( not ( = ?auto_694879 ?auto_694886 ) ) ( not ( = ?auto_694879 ?auto_694887 ) ) ( not ( = ?auto_694879 ?auto_694888 ) ) ( not ( = ?auto_694879 ?auto_694889 ) ) ( not ( = ?auto_694879 ?auto_694890 ) ) ( not ( = ?auto_694879 ?auto_694891 ) ) ( not ( = ?auto_694879 ?auto_694892 ) ) ( not ( = ?auto_694879 ?auto_694893 ) ) ( not ( = ?auto_694879 ?auto_694894 ) ) ( not ( = ?auto_694880 ?auto_694881 ) ) ( not ( = ?auto_694880 ?auto_694882 ) ) ( not ( = ?auto_694880 ?auto_694883 ) ) ( not ( = ?auto_694880 ?auto_694884 ) ) ( not ( = ?auto_694880 ?auto_694885 ) ) ( not ( = ?auto_694880 ?auto_694886 ) ) ( not ( = ?auto_694880 ?auto_694887 ) ) ( not ( = ?auto_694880 ?auto_694888 ) ) ( not ( = ?auto_694880 ?auto_694889 ) ) ( not ( = ?auto_694880 ?auto_694890 ) ) ( not ( = ?auto_694880 ?auto_694891 ) ) ( not ( = ?auto_694880 ?auto_694892 ) ) ( not ( = ?auto_694880 ?auto_694893 ) ) ( not ( = ?auto_694880 ?auto_694894 ) ) ( not ( = ?auto_694881 ?auto_694882 ) ) ( not ( = ?auto_694881 ?auto_694883 ) ) ( not ( = ?auto_694881 ?auto_694884 ) ) ( not ( = ?auto_694881 ?auto_694885 ) ) ( not ( = ?auto_694881 ?auto_694886 ) ) ( not ( = ?auto_694881 ?auto_694887 ) ) ( not ( = ?auto_694881 ?auto_694888 ) ) ( not ( = ?auto_694881 ?auto_694889 ) ) ( not ( = ?auto_694881 ?auto_694890 ) ) ( not ( = ?auto_694881 ?auto_694891 ) ) ( not ( = ?auto_694881 ?auto_694892 ) ) ( not ( = ?auto_694881 ?auto_694893 ) ) ( not ( = ?auto_694881 ?auto_694894 ) ) ( not ( = ?auto_694882 ?auto_694883 ) ) ( not ( = ?auto_694882 ?auto_694884 ) ) ( not ( = ?auto_694882 ?auto_694885 ) ) ( not ( = ?auto_694882 ?auto_694886 ) ) ( not ( = ?auto_694882 ?auto_694887 ) ) ( not ( = ?auto_694882 ?auto_694888 ) ) ( not ( = ?auto_694882 ?auto_694889 ) ) ( not ( = ?auto_694882 ?auto_694890 ) ) ( not ( = ?auto_694882 ?auto_694891 ) ) ( not ( = ?auto_694882 ?auto_694892 ) ) ( not ( = ?auto_694882 ?auto_694893 ) ) ( not ( = ?auto_694882 ?auto_694894 ) ) ( not ( = ?auto_694883 ?auto_694884 ) ) ( not ( = ?auto_694883 ?auto_694885 ) ) ( not ( = ?auto_694883 ?auto_694886 ) ) ( not ( = ?auto_694883 ?auto_694887 ) ) ( not ( = ?auto_694883 ?auto_694888 ) ) ( not ( = ?auto_694883 ?auto_694889 ) ) ( not ( = ?auto_694883 ?auto_694890 ) ) ( not ( = ?auto_694883 ?auto_694891 ) ) ( not ( = ?auto_694883 ?auto_694892 ) ) ( not ( = ?auto_694883 ?auto_694893 ) ) ( not ( = ?auto_694883 ?auto_694894 ) ) ( not ( = ?auto_694884 ?auto_694885 ) ) ( not ( = ?auto_694884 ?auto_694886 ) ) ( not ( = ?auto_694884 ?auto_694887 ) ) ( not ( = ?auto_694884 ?auto_694888 ) ) ( not ( = ?auto_694884 ?auto_694889 ) ) ( not ( = ?auto_694884 ?auto_694890 ) ) ( not ( = ?auto_694884 ?auto_694891 ) ) ( not ( = ?auto_694884 ?auto_694892 ) ) ( not ( = ?auto_694884 ?auto_694893 ) ) ( not ( = ?auto_694884 ?auto_694894 ) ) ( not ( = ?auto_694885 ?auto_694886 ) ) ( not ( = ?auto_694885 ?auto_694887 ) ) ( not ( = ?auto_694885 ?auto_694888 ) ) ( not ( = ?auto_694885 ?auto_694889 ) ) ( not ( = ?auto_694885 ?auto_694890 ) ) ( not ( = ?auto_694885 ?auto_694891 ) ) ( not ( = ?auto_694885 ?auto_694892 ) ) ( not ( = ?auto_694885 ?auto_694893 ) ) ( not ( = ?auto_694885 ?auto_694894 ) ) ( not ( = ?auto_694886 ?auto_694887 ) ) ( not ( = ?auto_694886 ?auto_694888 ) ) ( not ( = ?auto_694886 ?auto_694889 ) ) ( not ( = ?auto_694886 ?auto_694890 ) ) ( not ( = ?auto_694886 ?auto_694891 ) ) ( not ( = ?auto_694886 ?auto_694892 ) ) ( not ( = ?auto_694886 ?auto_694893 ) ) ( not ( = ?auto_694886 ?auto_694894 ) ) ( not ( = ?auto_694887 ?auto_694888 ) ) ( not ( = ?auto_694887 ?auto_694889 ) ) ( not ( = ?auto_694887 ?auto_694890 ) ) ( not ( = ?auto_694887 ?auto_694891 ) ) ( not ( = ?auto_694887 ?auto_694892 ) ) ( not ( = ?auto_694887 ?auto_694893 ) ) ( not ( = ?auto_694887 ?auto_694894 ) ) ( not ( = ?auto_694888 ?auto_694889 ) ) ( not ( = ?auto_694888 ?auto_694890 ) ) ( not ( = ?auto_694888 ?auto_694891 ) ) ( not ( = ?auto_694888 ?auto_694892 ) ) ( not ( = ?auto_694888 ?auto_694893 ) ) ( not ( = ?auto_694888 ?auto_694894 ) ) ( not ( = ?auto_694889 ?auto_694890 ) ) ( not ( = ?auto_694889 ?auto_694891 ) ) ( not ( = ?auto_694889 ?auto_694892 ) ) ( not ( = ?auto_694889 ?auto_694893 ) ) ( not ( = ?auto_694889 ?auto_694894 ) ) ( not ( = ?auto_694890 ?auto_694891 ) ) ( not ( = ?auto_694890 ?auto_694892 ) ) ( not ( = ?auto_694890 ?auto_694893 ) ) ( not ( = ?auto_694890 ?auto_694894 ) ) ( not ( = ?auto_694891 ?auto_694892 ) ) ( not ( = ?auto_694891 ?auto_694893 ) ) ( not ( = ?auto_694891 ?auto_694894 ) ) ( not ( = ?auto_694892 ?auto_694893 ) ) ( not ( = ?auto_694892 ?auto_694894 ) ) ( not ( = ?auto_694893 ?auto_694894 ) ) ( ON ?auto_694878 ?auto_694895 ) ( not ( = ?auto_694894 ?auto_694895 ) ) ( not ( = ?auto_694893 ?auto_694895 ) ) ( not ( = ?auto_694892 ?auto_694895 ) ) ( not ( = ?auto_694891 ?auto_694895 ) ) ( not ( = ?auto_694890 ?auto_694895 ) ) ( not ( = ?auto_694889 ?auto_694895 ) ) ( not ( = ?auto_694888 ?auto_694895 ) ) ( not ( = ?auto_694887 ?auto_694895 ) ) ( not ( = ?auto_694886 ?auto_694895 ) ) ( not ( = ?auto_694885 ?auto_694895 ) ) ( not ( = ?auto_694884 ?auto_694895 ) ) ( not ( = ?auto_694883 ?auto_694895 ) ) ( not ( = ?auto_694882 ?auto_694895 ) ) ( not ( = ?auto_694881 ?auto_694895 ) ) ( not ( = ?auto_694880 ?auto_694895 ) ) ( not ( = ?auto_694879 ?auto_694895 ) ) ( not ( = ?auto_694878 ?auto_694895 ) ) ( ON ?auto_694879 ?auto_694878 ) ( ON ?auto_694880 ?auto_694879 ) ( ON ?auto_694881 ?auto_694880 ) ( ON ?auto_694882 ?auto_694881 ) ( ON ?auto_694883 ?auto_694882 ) ( ON ?auto_694884 ?auto_694883 ) ( ON ?auto_694885 ?auto_694884 ) ( ON ?auto_694886 ?auto_694885 ) ( ON ?auto_694887 ?auto_694886 ) ( ON ?auto_694888 ?auto_694887 ) ( ON ?auto_694889 ?auto_694888 ) ( ON ?auto_694890 ?auto_694889 ) ( ON ?auto_694891 ?auto_694890 ) ( ON ?auto_694892 ?auto_694891 ) ( ON ?auto_694893 ?auto_694892 ) ( ON ?auto_694894 ?auto_694893 ) ( CLEAR ?auto_694894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_694894 ?auto_694893 ?auto_694892 ?auto_694891 ?auto_694890 ?auto_694889 ?auto_694888 ?auto_694887 ?auto_694886 ?auto_694885 ?auto_694884 ?auto_694883 ?auto_694882 ?auto_694881 ?auto_694880 ?auto_694879 ?auto_694878 )
      ( MAKE-17PILE ?auto_694878 ?auto_694879 ?auto_694880 ?auto_694881 ?auto_694882 ?auto_694883 ?auto_694884 ?auto_694885 ?auto_694886 ?auto_694887 ?auto_694888 ?auto_694889 ?auto_694890 ?auto_694891 ?auto_694892 ?auto_694893 ?auto_694894 ) )
  )

)

