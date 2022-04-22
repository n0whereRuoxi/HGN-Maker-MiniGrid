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
      ?auto_428429 - BLOCK
    )
    :vars
    (
      ?auto_428430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428429 ?auto_428430 ) ( CLEAR ?auto_428429 ) ( HAND-EMPTY ) ( not ( = ?auto_428429 ?auto_428430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428429 ?auto_428430 )
      ( !PUTDOWN ?auto_428429 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_428436 - BLOCK
      ?auto_428437 - BLOCK
    )
    :vars
    (
      ?auto_428438 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428436 ) ( ON ?auto_428437 ?auto_428438 ) ( CLEAR ?auto_428437 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428436 ) ( not ( = ?auto_428436 ?auto_428437 ) ) ( not ( = ?auto_428436 ?auto_428438 ) ) ( not ( = ?auto_428437 ?auto_428438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428437 ?auto_428438 )
      ( !STACK ?auto_428437 ?auto_428436 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_428446 - BLOCK
      ?auto_428447 - BLOCK
    )
    :vars
    (
      ?auto_428448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428447 ?auto_428448 ) ( not ( = ?auto_428446 ?auto_428447 ) ) ( not ( = ?auto_428446 ?auto_428448 ) ) ( not ( = ?auto_428447 ?auto_428448 ) ) ( ON ?auto_428446 ?auto_428447 ) ( CLEAR ?auto_428446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428446 )
      ( MAKE-2PILE ?auto_428446 ?auto_428447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_428457 - BLOCK
      ?auto_428458 - BLOCK
      ?auto_428459 - BLOCK
    )
    :vars
    (
      ?auto_428460 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428458 ) ( ON ?auto_428459 ?auto_428460 ) ( CLEAR ?auto_428459 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428457 ) ( ON ?auto_428458 ?auto_428457 ) ( not ( = ?auto_428457 ?auto_428458 ) ) ( not ( = ?auto_428457 ?auto_428459 ) ) ( not ( = ?auto_428457 ?auto_428460 ) ) ( not ( = ?auto_428458 ?auto_428459 ) ) ( not ( = ?auto_428458 ?auto_428460 ) ) ( not ( = ?auto_428459 ?auto_428460 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428459 ?auto_428460 )
      ( !STACK ?auto_428459 ?auto_428458 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_428471 - BLOCK
      ?auto_428472 - BLOCK
      ?auto_428473 - BLOCK
    )
    :vars
    (
      ?auto_428474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428473 ?auto_428474 ) ( ON-TABLE ?auto_428471 ) ( not ( = ?auto_428471 ?auto_428472 ) ) ( not ( = ?auto_428471 ?auto_428473 ) ) ( not ( = ?auto_428471 ?auto_428474 ) ) ( not ( = ?auto_428472 ?auto_428473 ) ) ( not ( = ?auto_428472 ?auto_428474 ) ) ( not ( = ?auto_428473 ?auto_428474 ) ) ( CLEAR ?auto_428471 ) ( ON ?auto_428472 ?auto_428473 ) ( CLEAR ?auto_428472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428471 ?auto_428472 )
      ( MAKE-3PILE ?auto_428471 ?auto_428472 ?auto_428473 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_428485 - BLOCK
      ?auto_428486 - BLOCK
      ?auto_428487 - BLOCK
    )
    :vars
    (
      ?auto_428488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428487 ?auto_428488 ) ( not ( = ?auto_428485 ?auto_428486 ) ) ( not ( = ?auto_428485 ?auto_428487 ) ) ( not ( = ?auto_428485 ?auto_428488 ) ) ( not ( = ?auto_428486 ?auto_428487 ) ) ( not ( = ?auto_428486 ?auto_428488 ) ) ( not ( = ?auto_428487 ?auto_428488 ) ) ( ON ?auto_428486 ?auto_428487 ) ( ON ?auto_428485 ?auto_428486 ) ( CLEAR ?auto_428485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428485 )
      ( MAKE-3PILE ?auto_428485 ?auto_428486 ?auto_428487 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_428500 - BLOCK
      ?auto_428501 - BLOCK
      ?auto_428502 - BLOCK
      ?auto_428503 - BLOCK
    )
    :vars
    (
      ?auto_428504 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428502 ) ( ON ?auto_428503 ?auto_428504 ) ( CLEAR ?auto_428503 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428500 ) ( ON ?auto_428501 ?auto_428500 ) ( ON ?auto_428502 ?auto_428501 ) ( not ( = ?auto_428500 ?auto_428501 ) ) ( not ( = ?auto_428500 ?auto_428502 ) ) ( not ( = ?auto_428500 ?auto_428503 ) ) ( not ( = ?auto_428500 ?auto_428504 ) ) ( not ( = ?auto_428501 ?auto_428502 ) ) ( not ( = ?auto_428501 ?auto_428503 ) ) ( not ( = ?auto_428501 ?auto_428504 ) ) ( not ( = ?auto_428502 ?auto_428503 ) ) ( not ( = ?auto_428502 ?auto_428504 ) ) ( not ( = ?auto_428503 ?auto_428504 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428503 ?auto_428504 )
      ( !STACK ?auto_428503 ?auto_428502 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_428518 - BLOCK
      ?auto_428519 - BLOCK
      ?auto_428520 - BLOCK
      ?auto_428521 - BLOCK
    )
    :vars
    (
      ?auto_428522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428521 ?auto_428522 ) ( ON-TABLE ?auto_428518 ) ( ON ?auto_428519 ?auto_428518 ) ( not ( = ?auto_428518 ?auto_428519 ) ) ( not ( = ?auto_428518 ?auto_428520 ) ) ( not ( = ?auto_428518 ?auto_428521 ) ) ( not ( = ?auto_428518 ?auto_428522 ) ) ( not ( = ?auto_428519 ?auto_428520 ) ) ( not ( = ?auto_428519 ?auto_428521 ) ) ( not ( = ?auto_428519 ?auto_428522 ) ) ( not ( = ?auto_428520 ?auto_428521 ) ) ( not ( = ?auto_428520 ?auto_428522 ) ) ( not ( = ?auto_428521 ?auto_428522 ) ) ( CLEAR ?auto_428519 ) ( ON ?auto_428520 ?auto_428521 ) ( CLEAR ?auto_428520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_428518 ?auto_428519 ?auto_428520 )
      ( MAKE-4PILE ?auto_428518 ?auto_428519 ?auto_428520 ?auto_428521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_428536 - BLOCK
      ?auto_428537 - BLOCK
      ?auto_428538 - BLOCK
      ?auto_428539 - BLOCK
    )
    :vars
    (
      ?auto_428540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428539 ?auto_428540 ) ( ON-TABLE ?auto_428536 ) ( not ( = ?auto_428536 ?auto_428537 ) ) ( not ( = ?auto_428536 ?auto_428538 ) ) ( not ( = ?auto_428536 ?auto_428539 ) ) ( not ( = ?auto_428536 ?auto_428540 ) ) ( not ( = ?auto_428537 ?auto_428538 ) ) ( not ( = ?auto_428537 ?auto_428539 ) ) ( not ( = ?auto_428537 ?auto_428540 ) ) ( not ( = ?auto_428538 ?auto_428539 ) ) ( not ( = ?auto_428538 ?auto_428540 ) ) ( not ( = ?auto_428539 ?auto_428540 ) ) ( ON ?auto_428538 ?auto_428539 ) ( CLEAR ?auto_428536 ) ( ON ?auto_428537 ?auto_428538 ) ( CLEAR ?auto_428537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428536 ?auto_428537 )
      ( MAKE-4PILE ?auto_428536 ?auto_428537 ?auto_428538 ?auto_428539 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_428554 - BLOCK
      ?auto_428555 - BLOCK
      ?auto_428556 - BLOCK
      ?auto_428557 - BLOCK
    )
    :vars
    (
      ?auto_428558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428557 ?auto_428558 ) ( not ( = ?auto_428554 ?auto_428555 ) ) ( not ( = ?auto_428554 ?auto_428556 ) ) ( not ( = ?auto_428554 ?auto_428557 ) ) ( not ( = ?auto_428554 ?auto_428558 ) ) ( not ( = ?auto_428555 ?auto_428556 ) ) ( not ( = ?auto_428555 ?auto_428557 ) ) ( not ( = ?auto_428555 ?auto_428558 ) ) ( not ( = ?auto_428556 ?auto_428557 ) ) ( not ( = ?auto_428556 ?auto_428558 ) ) ( not ( = ?auto_428557 ?auto_428558 ) ) ( ON ?auto_428556 ?auto_428557 ) ( ON ?auto_428555 ?auto_428556 ) ( ON ?auto_428554 ?auto_428555 ) ( CLEAR ?auto_428554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428554 )
      ( MAKE-4PILE ?auto_428554 ?auto_428555 ?auto_428556 ?auto_428557 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428573 - BLOCK
      ?auto_428574 - BLOCK
      ?auto_428575 - BLOCK
      ?auto_428576 - BLOCK
      ?auto_428577 - BLOCK
    )
    :vars
    (
      ?auto_428578 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428576 ) ( ON ?auto_428577 ?auto_428578 ) ( CLEAR ?auto_428577 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428573 ) ( ON ?auto_428574 ?auto_428573 ) ( ON ?auto_428575 ?auto_428574 ) ( ON ?auto_428576 ?auto_428575 ) ( not ( = ?auto_428573 ?auto_428574 ) ) ( not ( = ?auto_428573 ?auto_428575 ) ) ( not ( = ?auto_428573 ?auto_428576 ) ) ( not ( = ?auto_428573 ?auto_428577 ) ) ( not ( = ?auto_428573 ?auto_428578 ) ) ( not ( = ?auto_428574 ?auto_428575 ) ) ( not ( = ?auto_428574 ?auto_428576 ) ) ( not ( = ?auto_428574 ?auto_428577 ) ) ( not ( = ?auto_428574 ?auto_428578 ) ) ( not ( = ?auto_428575 ?auto_428576 ) ) ( not ( = ?auto_428575 ?auto_428577 ) ) ( not ( = ?auto_428575 ?auto_428578 ) ) ( not ( = ?auto_428576 ?auto_428577 ) ) ( not ( = ?auto_428576 ?auto_428578 ) ) ( not ( = ?auto_428577 ?auto_428578 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428577 ?auto_428578 )
      ( !STACK ?auto_428577 ?auto_428576 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428595 - BLOCK
      ?auto_428596 - BLOCK
      ?auto_428597 - BLOCK
      ?auto_428598 - BLOCK
      ?auto_428599 - BLOCK
    )
    :vars
    (
      ?auto_428600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428599 ?auto_428600 ) ( ON-TABLE ?auto_428595 ) ( ON ?auto_428596 ?auto_428595 ) ( ON ?auto_428597 ?auto_428596 ) ( not ( = ?auto_428595 ?auto_428596 ) ) ( not ( = ?auto_428595 ?auto_428597 ) ) ( not ( = ?auto_428595 ?auto_428598 ) ) ( not ( = ?auto_428595 ?auto_428599 ) ) ( not ( = ?auto_428595 ?auto_428600 ) ) ( not ( = ?auto_428596 ?auto_428597 ) ) ( not ( = ?auto_428596 ?auto_428598 ) ) ( not ( = ?auto_428596 ?auto_428599 ) ) ( not ( = ?auto_428596 ?auto_428600 ) ) ( not ( = ?auto_428597 ?auto_428598 ) ) ( not ( = ?auto_428597 ?auto_428599 ) ) ( not ( = ?auto_428597 ?auto_428600 ) ) ( not ( = ?auto_428598 ?auto_428599 ) ) ( not ( = ?auto_428598 ?auto_428600 ) ) ( not ( = ?auto_428599 ?auto_428600 ) ) ( CLEAR ?auto_428597 ) ( ON ?auto_428598 ?auto_428599 ) ( CLEAR ?auto_428598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_428595 ?auto_428596 ?auto_428597 ?auto_428598 )
      ( MAKE-5PILE ?auto_428595 ?auto_428596 ?auto_428597 ?auto_428598 ?auto_428599 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428617 - BLOCK
      ?auto_428618 - BLOCK
      ?auto_428619 - BLOCK
      ?auto_428620 - BLOCK
      ?auto_428621 - BLOCK
    )
    :vars
    (
      ?auto_428622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428621 ?auto_428622 ) ( ON-TABLE ?auto_428617 ) ( ON ?auto_428618 ?auto_428617 ) ( not ( = ?auto_428617 ?auto_428618 ) ) ( not ( = ?auto_428617 ?auto_428619 ) ) ( not ( = ?auto_428617 ?auto_428620 ) ) ( not ( = ?auto_428617 ?auto_428621 ) ) ( not ( = ?auto_428617 ?auto_428622 ) ) ( not ( = ?auto_428618 ?auto_428619 ) ) ( not ( = ?auto_428618 ?auto_428620 ) ) ( not ( = ?auto_428618 ?auto_428621 ) ) ( not ( = ?auto_428618 ?auto_428622 ) ) ( not ( = ?auto_428619 ?auto_428620 ) ) ( not ( = ?auto_428619 ?auto_428621 ) ) ( not ( = ?auto_428619 ?auto_428622 ) ) ( not ( = ?auto_428620 ?auto_428621 ) ) ( not ( = ?auto_428620 ?auto_428622 ) ) ( not ( = ?auto_428621 ?auto_428622 ) ) ( ON ?auto_428620 ?auto_428621 ) ( CLEAR ?auto_428618 ) ( ON ?auto_428619 ?auto_428620 ) ( CLEAR ?auto_428619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_428617 ?auto_428618 ?auto_428619 )
      ( MAKE-5PILE ?auto_428617 ?auto_428618 ?auto_428619 ?auto_428620 ?auto_428621 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428639 - BLOCK
      ?auto_428640 - BLOCK
      ?auto_428641 - BLOCK
      ?auto_428642 - BLOCK
      ?auto_428643 - BLOCK
    )
    :vars
    (
      ?auto_428644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428643 ?auto_428644 ) ( ON-TABLE ?auto_428639 ) ( not ( = ?auto_428639 ?auto_428640 ) ) ( not ( = ?auto_428639 ?auto_428641 ) ) ( not ( = ?auto_428639 ?auto_428642 ) ) ( not ( = ?auto_428639 ?auto_428643 ) ) ( not ( = ?auto_428639 ?auto_428644 ) ) ( not ( = ?auto_428640 ?auto_428641 ) ) ( not ( = ?auto_428640 ?auto_428642 ) ) ( not ( = ?auto_428640 ?auto_428643 ) ) ( not ( = ?auto_428640 ?auto_428644 ) ) ( not ( = ?auto_428641 ?auto_428642 ) ) ( not ( = ?auto_428641 ?auto_428643 ) ) ( not ( = ?auto_428641 ?auto_428644 ) ) ( not ( = ?auto_428642 ?auto_428643 ) ) ( not ( = ?auto_428642 ?auto_428644 ) ) ( not ( = ?auto_428643 ?auto_428644 ) ) ( ON ?auto_428642 ?auto_428643 ) ( ON ?auto_428641 ?auto_428642 ) ( CLEAR ?auto_428639 ) ( ON ?auto_428640 ?auto_428641 ) ( CLEAR ?auto_428640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428639 ?auto_428640 )
      ( MAKE-5PILE ?auto_428639 ?auto_428640 ?auto_428641 ?auto_428642 ?auto_428643 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_428661 - BLOCK
      ?auto_428662 - BLOCK
      ?auto_428663 - BLOCK
      ?auto_428664 - BLOCK
      ?auto_428665 - BLOCK
    )
    :vars
    (
      ?auto_428666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428665 ?auto_428666 ) ( not ( = ?auto_428661 ?auto_428662 ) ) ( not ( = ?auto_428661 ?auto_428663 ) ) ( not ( = ?auto_428661 ?auto_428664 ) ) ( not ( = ?auto_428661 ?auto_428665 ) ) ( not ( = ?auto_428661 ?auto_428666 ) ) ( not ( = ?auto_428662 ?auto_428663 ) ) ( not ( = ?auto_428662 ?auto_428664 ) ) ( not ( = ?auto_428662 ?auto_428665 ) ) ( not ( = ?auto_428662 ?auto_428666 ) ) ( not ( = ?auto_428663 ?auto_428664 ) ) ( not ( = ?auto_428663 ?auto_428665 ) ) ( not ( = ?auto_428663 ?auto_428666 ) ) ( not ( = ?auto_428664 ?auto_428665 ) ) ( not ( = ?auto_428664 ?auto_428666 ) ) ( not ( = ?auto_428665 ?auto_428666 ) ) ( ON ?auto_428664 ?auto_428665 ) ( ON ?auto_428663 ?auto_428664 ) ( ON ?auto_428662 ?auto_428663 ) ( ON ?auto_428661 ?auto_428662 ) ( CLEAR ?auto_428661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428661 )
      ( MAKE-5PILE ?auto_428661 ?auto_428662 ?auto_428663 ?auto_428664 ?auto_428665 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428684 - BLOCK
      ?auto_428685 - BLOCK
      ?auto_428686 - BLOCK
      ?auto_428687 - BLOCK
      ?auto_428688 - BLOCK
      ?auto_428689 - BLOCK
    )
    :vars
    (
      ?auto_428690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428688 ) ( ON ?auto_428689 ?auto_428690 ) ( CLEAR ?auto_428689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428684 ) ( ON ?auto_428685 ?auto_428684 ) ( ON ?auto_428686 ?auto_428685 ) ( ON ?auto_428687 ?auto_428686 ) ( ON ?auto_428688 ?auto_428687 ) ( not ( = ?auto_428684 ?auto_428685 ) ) ( not ( = ?auto_428684 ?auto_428686 ) ) ( not ( = ?auto_428684 ?auto_428687 ) ) ( not ( = ?auto_428684 ?auto_428688 ) ) ( not ( = ?auto_428684 ?auto_428689 ) ) ( not ( = ?auto_428684 ?auto_428690 ) ) ( not ( = ?auto_428685 ?auto_428686 ) ) ( not ( = ?auto_428685 ?auto_428687 ) ) ( not ( = ?auto_428685 ?auto_428688 ) ) ( not ( = ?auto_428685 ?auto_428689 ) ) ( not ( = ?auto_428685 ?auto_428690 ) ) ( not ( = ?auto_428686 ?auto_428687 ) ) ( not ( = ?auto_428686 ?auto_428688 ) ) ( not ( = ?auto_428686 ?auto_428689 ) ) ( not ( = ?auto_428686 ?auto_428690 ) ) ( not ( = ?auto_428687 ?auto_428688 ) ) ( not ( = ?auto_428687 ?auto_428689 ) ) ( not ( = ?auto_428687 ?auto_428690 ) ) ( not ( = ?auto_428688 ?auto_428689 ) ) ( not ( = ?auto_428688 ?auto_428690 ) ) ( not ( = ?auto_428689 ?auto_428690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428689 ?auto_428690 )
      ( !STACK ?auto_428689 ?auto_428688 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428710 - BLOCK
      ?auto_428711 - BLOCK
      ?auto_428712 - BLOCK
      ?auto_428713 - BLOCK
      ?auto_428714 - BLOCK
      ?auto_428715 - BLOCK
    )
    :vars
    (
      ?auto_428716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428715 ?auto_428716 ) ( ON-TABLE ?auto_428710 ) ( ON ?auto_428711 ?auto_428710 ) ( ON ?auto_428712 ?auto_428711 ) ( ON ?auto_428713 ?auto_428712 ) ( not ( = ?auto_428710 ?auto_428711 ) ) ( not ( = ?auto_428710 ?auto_428712 ) ) ( not ( = ?auto_428710 ?auto_428713 ) ) ( not ( = ?auto_428710 ?auto_428714 ) ) ( not ( = ?auto_428710 ?auto_428715 ) ) ( not ( = ?auto_428710 ?auto_428716 ) ) ( not ( = ?auto_428711 ?auto_428712 ) ) ( not ( = ?auto_428711 ?auto_428713 ) ) ( not ( = ?auto_428711 ?auto_428714 ) ) ( not ( = ?auto_428711 ?auto_428715 ) ) ( not ( = ?auto_428711 ?auto_428716 ) ) ( not ( = ?auto_428712 ?auto_428713 ) ) ( not ( = ?auto_428712 ?auto_428714 ) ) ( not ( = ?auto_428712 ?auto_428715 ) ) ( not ( = ?auto_428712 ?auto_428716 ) ) ( not ( = ?auto_428713 ?auto_428714 ) ) ( not ( = ?auto_428713 ?auto_428715 ) ) ( not ( = ?auto_428713 ?auto_428716 ) ) ( not ( = ?auto_428714 ?auto_428715 ) ) ( not ( = ?auto_428714 ?auto_428716 ) ) ( not ( = ?auto_428715 ?auto_428716 ) ) ( CLEAR ?auto_428713 ) ( ON ?auto_428714 ?auto_428715 ) ( CLEAR ?auto_428714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_428710 ?auto_428711 ?auto_428712 ?auto_428713 ?auto_428714 )
      ( MAKE-6PILE ?auto_428710 ?auto_428711 ?auto_428712 ?auto_428713 ?auto_428714 ?auto_428715 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428736 - BLOCK
      ?auto_428737 - BLOCK
      ?auto_428738 - BLOCK
      ?auto_428739 - BLOCK
      ?auto_428740 - BLOCK
      ?auto_428741 - BLOCK
    )
    :vars
    (
      ?auto_428742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428741 ?auto_428742 ) ( ON-TABLE ?auto_428736 ) ( ON ?auto_428737 ?auto_428736 ) ( ON ?auto_428738 ?auto_428737 ) ( not ( = ?auto_428736 ?auto_428737 ) ) ( not ( = ?auto_428736 ?auto_428738 ) ) ( not ( = ?auto_428736 ?auto_428739 ) ) ( not ( = ?auto_428736 ?auto_428740 ) ) ( not ( = ?auto_428736 ?auto_428741 ) ) ( not ( = ?auto_428736 ?auto_428742 ) ) ( not ( = ?auto_428737 ?auto_428738 ) ) ( not ( = ?auto_428737 ?auto_428739 ) ) ( not ( = ?auto_428737 ?auto_428740 ) ) ( not ( = ?auto_428737 ?auto_428741 ) ) ( not ( = ?auto_428737 ?auto_428742 ) ) ( not ( = ?auto_428738 ?auto_428739 ) ) ( not ( = ?auto_428738 ?auto_428740 ) ) ( not ( = ?auto_428738 ?auto_428741 ) ) ( not ( = ?auto_428738 ?auto_428742 ) ) ( not ( = ?auto_428739 ?auto_428740 ) ) ( not ( = ?auto_428739 ?auto_428741 ) ) ( not ( = ?auto_428739 ?auto_428742 ) ) ( not ( = ?auto_428740 ?auto_428741 ) ) ( not ( = ?auto_428740 ?auto_428742 ) ) ( not ( = ?auto_428741 ?auto_428742 ) ) ( ON ?auto_428740 ?auto_428741 ) ( CLEAR ?auto_428738 ) ( ON ?auto_428739 ?auto_428740 ) ( CLEAR ?auto_428739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_428736 ?auto_428737 ?auto_428738 ?auto_428739 )
      ( MAKE-6PILE ?auto_428736 ?auto_428737 ?auto_428738 ?auto_428739 ?auto_428740 ?auto_428741 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428762 - BLOCK
      ?auto_428763 - BLOCK
      ?auto_428764 - BLOCK
      ?auto_428765 - BLOCK
      ?auto_428766 - BLOCK
      ?auto_428767 - BLOCK
    )
    :vars
    (
      ?auto_428768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428767 ?auto_428768 ) ( ON-TABLE ?auto_428762 ) ( ON ?auto_428763 ?auto_428762 ) ( not ( = ?auto_428762 ?auto_428763 ) ) ( not ( = ?auto_428762 ?auto_428764 ) ) ( not ( = ?auto_428762 ?auto_428765 ) ) ( not ( = ?auto_428762 ?auto_428766 ) ) ( not ( = ?auto_428762 ?auto_428767 ) ) ( not ( = ?auto_428762 ?auto_428768 ) ) ( not ( = ?auto_428763 ?auto_428764 ) ) ( not ( = ?auto_428763 ?auto_428765 ) ) ( not ( = ?auto_428763 ?auto_428766 ) ) ( not ( = ?auto_428763 ?auto_428767 ) ) ( not ( = ?auto_428763 ?auto_428768 ) ) ( not ( = ?auto_428764 ?auto_428765 ) ) ( not ( = ?auto_428764 ?auto_428766 ) ) ( not ( = ?auto_428764 ?auto_428767 ) ) ( not ( = ?auto_428764 ?auto_428768 ) ) ( not ( = ?auto_428765 ?auto_428766 ) ) ( not ( = ?auto_428765 ?auto_428767 ) ) ( not ( = ?auto_428765 ?auto_428768 ) ) ( not ( = ?auto_428766 ?auto_428767 ) ) ( not ( = ?auto_428766 ?auto_428768 ) ) ( not ( = ?auto_428767 ?auto_428768 ) ) ( ON ?auto_428766 ?auto_428767 ) ( ON ?auto_428765 ?auto_428766 ) ( CLEAR ?auto_428763 ) ( ON ?auto_428764 ?auto_428765 ) ( CLEAR ?auto_428764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_428762 ?auto_428763 ?auto_428764 )
      ( MAKE-6PILE ?auto_428762 ?auto_428763 ?auto_428764 ?auto_428765 ?auto_428766 ?auto_428767 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428788 - BLOCK
      ?auto_428789 - BLOCK
      ?auto_428790 - BLOCK
      ?auto_428791 - BLOCK
      ?auto_428792 - BLOCK
      ?auto_428793 - BLOCK
    )
    :vars
    (
      ?auto_428794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428793 ?auto_428794 ) ( ON-TABLE ?auto_428788 ) ( not ( = ?auto_428788 ?auto_428789 ) ) ( not ( = ?auto_428788 ?auto_428790 ) ) ( not ( = ?auto_428788 ?auto_428791 ) ) ( not ( = ?auto_428788 ?auto_428792 ) ) ( not ( = ?auto_428788 ?auto_428793 ) ) ( not ( = ?auto_428788 ?auto_428794 ) ) ( not ( = ?auto_428789 ?auto_428790 ) ) ( not ( = ?auto_428789 ?auto_428791 ) ) ( not ( = ?auto_428789 ?auto_428792 ) ) ( not ( = ?auto_428789 ?auto_428793 ) ) ( not ( = ?auto_428789 ?auto_428794 ) ) ( not ( = ?auto_428790 ?auto_428791 ) ) ( not ( = ?auto_428790 ?auto_428792 ) ) ( not ( = ?auto_428790 ?auto_428793 ) ) ( not ( = ?auto_428790 ?auto_428794 ) ) ( not ( = ?auto_428791 ?auto_428792 ) ) ( not ( = ?auto_428791 ?auto_428793 ) ) ( not ( = ?auto_428791 ?auto_428794 ) ) ( not ( = ?auto_428792 ?auto_428793 ) ) ( not ( = ?auto_428792 ?auto_428794 ) ) ( not ( = ?auto_428793 ?auto_428794 ) ) ( ON ?auto_428792 ?auto_428793 ) ( ON ?auto_428791 ?auto_428792 ) ( ON ?auto_428790 ?auto_428791 ) ( CLEAR ?auto_428788 ) ( ON ?auto_428789 ?auto_428790 ) ( CLEAR ?auto_428789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428788 ?auto_428789 )
      ( MAKE-6PILE ?auto_428788 ?auto_428789 ?auto_428790 ?auto_428791 ?auto_428792 ?auto_428793 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_428814 - BLOCK
      ?auto_428815 - BLOCK
      ?auto_428816 - BLOCK
      ?auto_428817 - BLOCK
      ?auto_428818 - BLOCK
      ?auto_428819 - BLOCK
    )
    :vars
    (
      ?auto_428820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428819 ?auto_428820 ) ( not ( = ?auto_428814 ?auto_428815 ) ) ( not ( = ?auto_428814 ?auto_428816 ) ) ( not ( = ?auto_428814 ?auto_428817 ) ) ( not ( = ?auto_428814 ?auto_428818 ) ) ( not ( = ?auto_428814 ?auto_428819 ) ) ( not ( = ?auto_428814 ?auto_428820 ) ) ( not ( = ?auto_428815 ?auto_428816 ) ) ( not ( = ?auto_428815 ?auto_428817 ) ) ( not ( = ?auto_428815 ?auto_428818 ) ) ( not ( = ?auto_428815 ?auto_428819 ) ) ( not ( = ?auto_428815 ?auto_428820 ) ) ( not ( = ?auto_428816 ?auto_428817 ) ) ( not ( = ?auto_428816 ?auto_428818 ) ) ( not ( = ?auto_428816 ?auto_428819 ) ) ( not ( = ?auto_428816 ?auto_428820 ) ) ( not ( = ?auto_428817 ?auto_428818 ) ) ( not ( = ?auto_428817 ?auto_428819 ) ) ( not ( = ?auto_428817 ?auto_428820 ) ) ( not ( = ?auto_428818 ?auto_428819 ) ) ( not ( = ?auto_428818 ?auto_428820 ) ) ( not ( = ?auto_428819 ?auto_428820 ) ) ( ON ?auto_428818 ?auto_428819 ) ( ON ?auto_428817 ?auto_428818 ) ( ON ?auto_428816 ?auto_428817 ) ( ON ?auto_428815 ?auto_428816 ) ( ON ?auto_428814 ?auto_428815 ) ( CLEAR ?auto_428814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_428814 )
      ( MAKE-6PILE ?auto_428814 ?auto_428815 ?auto_428816 ?auto_428817 ?auto_428818 ?auto_428819 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428841 - BLOCK
      ?auto_428842 - BLOCK
      ?auto_428843 - BLOCK
      ?auto_428844 - BLOCK
      ?auto_428845 - BLOCK
      ?auto_428846 - BLOCK
      ?auto_428847 - BLOCK
    )
    :vars
    (
      ?auto_428848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_428846 ) ( ON ?auto_428847 ?auto_428848 ) ( CLEAR ?auto_428847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_428841 ) ( ON ?auto_428842 ?auto_428841 ) ( ON ?auto_428843 ?auto_428842 ) ( ON ?auto_428844 ?auto_428843 ) ( ON ?auto_428845 ?auto_428844 ) ( ON ?auto_428846 ?auto_428845 ) ( not ( = ?auto_428841 ?auto_428842 ) ) ( not ( = ?auto_428841 ?auto_428843 ) ) ( not ( = ?auto_428841 ?auto_428844 ) ) ( not ( = ?auto_428841 ?auto_428845 ) ) ( not ( = ?auto_428841 ?auto_428846 ) ) ( not ( = ?auto_428841 ?auto_428847 ) ) ( not ( = ?auto_428841 ?auto_428848 ) ) ( not ( = ?auto_428842 ?auto_428843 ) ) ( not ( = ?auto_428842 ?auto_428844 ) ) ( not ( = ?auto_428842 ?auto_428845 ) ) ( not ( = ?auto_428842 ?auto_428846 ) ) ( not ( = ?auto_428842 ?auto_428847 ) ) ( not ( = ?auto_428842 ?auto_428848 ) ) ( not ( = ?auto_428843 ?auto_428844 ) ) ( not ( = ?auto_428843 ?auto_428845 ) ) ( not ( = ?auto_428843 ?auto_428846 ) ) ( not ( = ?auto_428843 ?auto_428847 ) ) ( not ( = ?auto_428843 ?auto_428848 ) ) ( not ( = ?auto_428844 ?auto_428845 ) ) ( not ( = ?auto_428844 ?auto_428846 ) ) ( not ( = ?auto_428844 ?auto_428847 ) ) ( not ( = ?auto_428844 ?auto_428848 ) ) ( not ( = ?auto_428845 ?auto_428846 ) ) ( not ( = ?auto_428845 ?auto_428847 ) ) ( not ( = ?auto_428845 ?auto_428848 ) ) ( not ( = ?auto_428846 ?auto_428847 ) ) ( not ( = ?auto_428846 ?auto_428848 ) ) ( not ( = ?auto_428847 ?auto_428848 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_428847 ?auto_428848 )
      ( !STACK ?auto_428847 ?auto_428846 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428871 - BLOCK
      ?auto_428872 - BLOCK
      ?auto_428873 - BLOCK
      ?auto_428874 - BLOCK
      ?auto_428875 - BLOCK
      ?auto_428876 - BLOCK
      ?auto_428877 - BLOCK
    )
    :vars
    (
      ?auto_428878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428877 ?auto_428878 ) ( ON-TABLE ?auto_428871 ) ( ON ?auto_428872 ?auto_428871 ) ( ON ?auto_428873 ?auto_428872 ) ( ON ?auto_428874 ?auto_428873 ) ( ON ?auto_428875 ?auto_428874 ) ( not ( = ?auto_428871 ?auto_428872 ) ) ( not ( = ?auto_428871 ?auto_428873 ) ) ( not ( = ?auto_428871 ?auto_428874 ) ) ( not ( = ?auto_428871 ?auto_428875 ) ) ( not ( = ?auto_428871 ?auto_428876 ) ) ( not ( = ?auto_428871 ?auto_428877 ) ) ( not ( = ?auto_428871 ?auto_428878 ) ) ( not ( = ?auto_428872 ?auto_428873 ) ) ( not ( = ?auto_428872 ?auto_428874 ) ) ( not ( = ?auto_428872 ?auto_428875 ) ) ( not ( = ?auto_428872 ?auto_428876 ) ) ( not ( = ?auto_428872 ?auto_428877 ) ) ( not ( = ?auto_428872 ?auto_428878 ) ) ( not ( = ?auto_428873 ?auto_428874 ) ) ( not ( = ?auto_428873 ?auto_428875 ) ) ( not ( = ?auto_428873 ?auto_428876 ) ) ( not ( = ?auto_428873 ?auto_428877 ) ) ( not ( = ?auto_428873 ?auto_428878 ) ) ( not ( = ?auto_428874 ?auto_428875 ) ) ( not ( = ?auto_428874 ?auto_428876 ) ) ( not ( = ?auto_428874 ?auto_428877 ) ) ( not ( = ?auto_428874 ?auto_428878 ) ) ( not ( = ?auto_428875 ?auto_428876 ) ) ( not ( = ?auto_428875 ?auto_428877 ) ) ( not ( = ?auto_428875 ?auto_428878 ) ) ( not ( = ?auto_428876 ?auto_428877 ) ) ( not ( = ?auto_428876 ?auto_428878 ) ) ( not ( = ?auto_428877 ?auto_428878 ) ) ( CLEAR ?auto_428875 ) ( ON ?auto_428876 ?auto_428877 ) ( CLEAR ?auto_428876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_428871 ?auto_428872 ?auto_428873 ?auto_428874 ?auto_428875 ?auto_428876 )
      ( MAKE-7PILE ?auto_428871 ?auto_428872 ?auto_428873 ?auto_428874 ?auto_428875 ?auto_428876 ?auto_428877 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428901 - BLOCK
      ?auto_428902 - BLOCK
      ?auto_428903 - BLOCK
      ?auto_428904 - BLOCK
      ?auto_428905 - BLOCK
      ?auto_428906 - BLOCK
      ?auto_428907 - BLOCK
    )
    :vars
    (
      ?auto_428908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428907 ?auto_428908 ) ( ON-TABLE ?auto_428901 ) ( ON ?auto_428902 ?auto_428901 ) ( ON ?auto_428903 ?auto_428902 ) ( ON ?auto_428904 ?auto_428903 ) ( not ( = ?auto_428901 ?auto_428902 ) ) ( not ( = ?auto_428901 ?auto_428903 ) ) ( not ( = ?auto_428901 ?auto_428904 ) ) ( not ( = ?auto_428901 ?auto_428905 ) ) ( not ( = ?auto_428901 ?auto_428906 ) ) ( not ( = ?auto_428901 ?auto_428907 ) ) ( not ( = ?auto_428901 ?auto_428908 ) ) ( not ( = ?auto_428902 ?auto_428903 ) ) ( not ( = ?auto_428902 ?auto_428904 ) ) ( not ( = ?auto_428902 ?auto_428905 ) ) ( not ( = ?auto_428902 ?auto_428906 ) ) ( not ( = ?auto_428902 ?auto_428907 ) ) ( not ( = ?auto_428902 ?auto_428908 ) ) ( not ( = ?auto_428903 ?auto_428904 ) ) ( not ( = ?auto_428903 ?auto_428905 ) ) ( not ( = ?auto_428903 ?auto_428906 ) ) ( not ( = ?auto_428903 ?auto_428907 ) ) ( not ( = ?auto_428903 ?auto_428908 ) ) ( not ( = ?auto_428904 ?auto_428905 ) ) ( not ( = ?auto_428904 ?auto_428906 ) ) ( not ( = ?auto_428904 ?auto_428907 ) ) ( not ( = ?auto_428904 ?auto_428908 ) ) ( not ( = ?auto_428905 ?auto_428906 ) ) ( not ( = ?auto_428905 ?auto_428907 ) ) ( not ( = ?auto_428905 ?auto_428908 ) ) ( not ( = ?auto_428906 ?auto_428907 ) ) ( not ( = ?auto_428906 ?auto_428908 ) ) ( not ( = ?auto_428907 ?auto_428908 ) ) ( ON ?auto_428906 ?auto_428907 ) ( CLEAR ?auto_428904 ) ( ON ?auto_428905 ?auto_428906 ) ( CLEAR ?auto_428905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_428901 ?auto_428902 ?auto_428903 ?auto_428904 ?auto_428905 )
      ( MAKE-7PILE ?auto_428901 ?auto_428902 ?auto_428903 ?auto_428904 ?auto_428905 ?auto_428906 ?auto_428907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428931 - BLOCK
      ?auto_428932 - BLOCK
      ?auto_428933 - BLOCK
      ?auto_428934 - BLOCK
      ?auto_428935 - BLOCK
      ?auto_428936 - BLOCK
      ?auto_428937 - BLOCK
    )
    :vars
    (
      ?auto_428938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428937 ?auto_428938 ) ( ON-TABLE ?auto_428931 ) ( ON ?auto_428932 ?auto_428931 ) ( ON ?auto_428933 ?auto_428932 ) ( not ( = ?auto_428931 ?auto_428932 ) ) ( not ( = ?auto_428931 ?auto_428933 ) ) ( not ( = ?auto_428931 ?auto_428934 ) ) ( not ( = ?auto_428931 ?auto_428935 ) ) ( not ( = ?auto_428931 ?auto_428936 ) ) ( not ( = ?auto_428931 ?auto_428937 ) ) ( not ( = ?auto_428931 ?auto_428938 ) ) ( not ( = ?auto_428932 ?auto_428933 ) ) ( not ( = ?auto_428932 ?auto_428934 ) ) ( not ( = ?auto_428932 ?auto_428935 ) ) ( not ( = ?auto_428932 ?auto_428936 ) ) ( not ( = ?auto_428932 ?auto_428937 ) ) ( not ( = ?auto_428932 ?auto_428938 ) ) ( not ( = ?auto_428933 ?auto_428934 ) ) ( not ( = ?auto_428933 ?auto_428935 ) ) ( not ( = ?auto_428933 ?auto_428936 ) ) ( not ( = ?auto_428933 ?auto_428937 ) ) ( not ( = ?auto_428933 ?auto_428938 ) ) ( not ( = ?auto_428934 ?auto_428935 ) ) ( not ( = ?auto_428934 ?auto_428936 ) ) ( not ( = ?auto_428934 ?auto_428937 ) ) ( not ( = ?auto_428934 ?auto_428938 ) ) ( not ( = ?auto_428935 ?auto_428936 ) ) ( not ( = ?auto_428935 ?auto_428937 ) ) ( not ( = ?auto_428935 ?auto_428938 ) ) ( not ( = ?auto_428936 ?auto_428937 ) ) ( not ( = ?auto_428936 ?auto_428938 ) ) ( not ( = ?auto_428937 ?auto_428938 ) ) ( ON ?auto_428936 ?auto_428937 ) ( ON ?auto_428935 ?auto_428936 ) ( CLEAR ?auto_428933 ) ( ON ?auto_428934 ?auto_428935 ) ( CLEAR ?auto_428934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_428931 ?auto_428932 ?auto_428933 ?auto_428934 )
      ( MAKE-7PILE ?auto_428931 ?auto_428932 ?auto_428933 ?auto_428934 ?auto_428935 ?auto_428936 ?auto_428937 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428961 - BLOCK
      ?auto_428962 - BLOCK
      ?auto_428963 - BLOCK
      ?auto_428964 - BLOCK
      ?auto_428965 - BLOCK
      ?auto_428966 - BLOCK
      ?auto_428967 - BLOCK
    )
    :vars
    (
      ?auto_428968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428967 ?auto_428968 ) ( ON-TABLE ?auto_428961 ) ( ON ?auto_428962 ?auto_428961 ) ( not ( = ?auto_428961 ?auto_428962 ) ) ( not ( = ?auto_428961 ?auto_428963 ) ) ( not ( = ?auto_428961 ?auto_428964 ) ) ( not ( = ?auto_428961 ?auto_428965 ) ) ( not ( = ?auto_428961 ?auto_428966 ) ) ( not ( = ?auto_428961 ?auto_428967 ) ) ( not ( = ?auto_428961 ?auto_428968 ) ) ( not ( = ?auto_428962 ?auto_428963 ) ) ( not ( = ?auto_428962 ?auto_428964 ) ) ( not ( = ?auto_428962 ?auto_428965 ) ) ( not ( = ?auto_428962 ?auto_428966 ) ) ( not ( = ?auto_428962 ?auto_428967 ) ) ( not ( = ?auto_428962 ?auto_428968 ) ) ( not ( = ?auto_428963 ?auto_428964 ) ) ( not ( = ?auto_428963 ?auto_428965 ) ) ( not ( = ?auto_428963 ?auto_428966 ) ) ( not ( = ?auto_428963 ?auto_428967 ) ) ( not ( = ?auto_428963 ?auto_428968 ) ) ( not ( = ?auto_428964 ?auto_428965 ) ) ( not ( = ?auto_428964 ?auto_428966 ) ) ( not ( = ?auto_428964 ?auto_428967 ) ) ( not ( = ?auto_428964 ?auto_428968 ) ) ( not ( = ?auto_428965 ?auto_428966 ) ) ( not ( = ?auto_428965 ?auto_428967 ) ) ( not ( = ?auto_428965 ?auto_428968 ) ) ( not ( = ?auto_428966 ?auto_428967 ) ) ( not ( = ?auto_428966 ?auto_428968 ) ) ( not ( = ?auto_428967 ?auto_428968 ) ) ( ON ?auto_428966 ?auto_428967 ) ( ON ?auto_428965 ?auto_428966 ) ( ON ?auto_428964 ?auto_428965 ) ( CLEAR ?auto_428962 ) ( ON ?auto_428963 ?auto_428964 ) ( CLEAR ?auto_428963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_428961 ?auto_428962 ?auto_428963 )
      ( MAKE-7PILE ?auto_428961 ?auto_428962 ?auto_428963 ?auto_428964 ?auto_428965 ?auto_428966 ?auto_428967 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_428991 - BLOCK
      ?auto_428992 - BLOCK
      ?auto_428993 - BLOCK
      ?auto_428994 - BLOCK
      ?auto_428995 - BLOCK
      ?auto_428996 - BLOCK
      ?auto_428997 - BLOCK
    )
    :vars
    (
      ?auto_428998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_428997 ?auto_428998 ) ( ON-TABLE ?auto_428991 ) ( not ( = ?auto_428991 ?auto_428992 ) ) ( not ( = ?auto_428991 ?auto_428993 ) ) ( not ( = ?auto_428991 ?auto_428994 ) ) ( not ( = ?auto_428991 ?auto_428995 ) ) ( not ( = ?auto_428991 ?auto_428996 ) ) ( not ( = ?auto_428991 ?auto_428997 ) ) ( not ( = ?auto_428991 ?auto_428998 ) ) ( not ( = ?auto_428992 ?auto_428993 ) ) ( not ( = ?auto_428992 ?auto_428994 ) ) ( not ( = ?auto_428992 ?auto_428995 ) ) ( not ( = ?auto_428992 ?auto_428996 ) ) ( not ( = ?auto_428992 ?auto_428997 ) ) ( not ( = ?auto_428992 ?auto_428998 ) ) ( not ( = ?auto_428993 ?auto_428994 ) ) ( not ( = ?auto_428993 ?auto_428995 ) ) ( not ( = ?auto_428993 ?auto_428996 ) ) ( not ( = ?auto_428993 ?auto_428997 ) ) ( not ( = ?auto_428993 ?auto_428998 ) ) ( not ( = ?auto_428994 ?auto_428995 ) ) ( not ( = ?auto_428994 ?auto_428996 ) ) ( not ( = ?auto_428994 ?auto_428997 ) ) ( not ( = ?auto_428994 ?auto_428998 ) ) ( not ( = ?auto_428995 ?auto_428996 ) ) ( not ( = ?auto_428995 ?auto_428997 ) ) ( not ( = ?auto_428995 ?auto_428998 ) ) ( not ( = ?auto_428996 ?auto_428997 ) ) ( not ( = ?auto_428996 ?auto_428998 ) ) ( not ( = ?auto_428997 ?auto_428998 ) ) ( ON ?auto_428996 ?auto_428997 ) ( ON ?auto_428995 ?auto_428996 ) ( ON ?auto_428994 ?auto_428995 ) ( ON ?auto_428993 ?auto_428994 ) ( CLEAR ?auto_428991 ) ( ON ?auto_428992 ?auto_428993 ) ( CLEAR ?auto_428992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_428991 ?auto_428992 )
      ( MAKE-7PILE ?auto_428991 ?auto_428992 ?auto_428993 ?auto_428994 ?auto_428995 ?auto_428996 ?auto_428997 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_429021 - BLOCK
      ?auto_429022 - BLOCK
      ?auto_429023 - BLOCK
      ?auto_429024 - BLOCK
      ?auto_429025 - BLOCK
      ?auto_429026 - BLOCK
      ?auto_429027 - BLOCK
    )
    :vars
    (
      ?auto_429028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429027 ?auto_429028 ) ( not ( = ?auto_429021 ?auto_429022 ) ) ( not ( = ?auto_429021 ?auto_429023 ) ) ( not ( = ?auto_429021 ?auto_429024 ) ) ( not ( = ?auto_429021 ?auto_429025 ) ) ( not ( = ?auto_429021 ?auto_429026 ) ) ( not ( = ?auto_429021 ?auto_429027 ) ) ( not ( = ?auto_429021 ?auto_429028 ) ) ( not ( = ?auto_429022 ?auto_429023 ) ) ( not ( = ?auto_429022 ?auto_429024 ) ) ( not ( = ?auto_429022 ?auto_429025 ) ) ( not ( = ?auto_429022 ?auto_429026 ) ) ( not ( = ?auto_429022 ?auto_429027 ) ) ( not ( = ?auto_429022 ?auto_429028 ) ) ( not ( = ?auto_429023 ?auto_429024 ) ) ( not ( = ?auto_429023 ?auto_429025 ) ) ( not ( = ?auto_429023 ?auto_429026 ) ) ( not ( = ?auto_429023 ?auto_429027 ) ) ( not ( = ?auto_429023 ?auto_429028 ) ) ( not ( = ?auto_429024 ?auto_429025 ) ) ( not ( = ?auto_429024 ?auto_429026 ) ) ( not ( = ?auto_429024 ?auto_429027 ) ) ( not ( = ?auto_429024 ?auto_429028 ) ) ( not ( = ?auto_429025 ?auto_429026 ) ) ( not ( = ?auto_429025 ?auto_429027 ) ) ( not ( = ?auto_429025 ?auto_429028 ) ) ( not ( = ?auto_429026 ?auto_429027 ) ) ( not ( = ?auto_429026 ?auto_429028 ) ) ( not ( = ?auto_429027 ?auto_429028 ) ) ( ON ?auto_429026 ?auto_429027 ) ( ON ?auto_429025 ?auto_429026 ) ( ON ?auto_429024 ?auto_429025 ) ( ON ?auto_429023 ?auto_429024 ) ( ON ?auto_429022 ?auto_429023 ) ( ON ?auto_429021 ?auto_429022 ) ( CLEAR ?auto_429021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_429021 )
      ( MAKE-7PILE ?auto_429021 ?auto_429022 ?auto_429023 ?auto_429024 ?auto_429025 ?auto_429026 ?auto_429027 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429052 - BLOCK
      ?auto_429053 - BLOCK
      ?auto_429054 - BLOCK
      ?auto_429055 - BLOCK
      ?auto_429056 - BLOCK
      ?auto_429057 - BLOCK
      ?auto_429058 - BLOCK
      ?auto_429059 - BLOCK
    )
    :vars
    (
      ?auto_429060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_429058 ) ( ON ?auto_429059 ?auto_429060 ) ( CLEAR ?auto_429059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_429052 ) ( ON ?auto_429053 ?auto_429052 ) ( ON ?auto_429054 ?auto_429053 ) ( ON ?auto_429055 ?auto_429054 ) ( ON ?auto_429056 ?auto_429055 ) ( ON ?auto_429057 ?auto_429056 ) ( ON ?auto_429058 ?auto_429057 ) ( not ( = ?auto_429052 ?auto_429053 ) ) ( not ( = ?auto_429052 ?auto_429054 ) ) ( not ( = ?auto_429052 ?auto_429055 ) ) ( not ( = ?auto_429052 ?auto_429056 ) ) ( not ( = ?auto_429052 ?auto_429057 ) ) ( not ( = ?auto_429052 ?auto_429058 ) ) ( not ( = ?auto_429052 ?auto_429059 ) ) ( not ( = ?auto_429052 ?auto_429060 ) ) ( not ( = ?auto_429053 ?auto_429054 ) ) ( not ( = ?auto_429053 ?auto_429055 ) ) ( not ( = ?auto_429053 ?auto_429056 ) ) ( not ( = ?auto_429053 ?auto_429057 ) ) ( not ( = ?auto_429053 ?auto_429058 ) ) ( not ( = ?auto_429053 ?auto_429059 ) ) ( not ( = ?auto_429053 ?auto_429060 ) ) ( not ( = ?auto_429054 ?auto_429055 ) ) ( not ( = ?auto_429054 ?auto_429056 ) ) ( not ( = ?auto_429054 ?auto_429057 ) ) ( not ( = ?auto_429054 ?auto_429058 ) ) ( not ( = ?auto_429054 ?auto_429059 ) ) ( not ( = ?auto_429054 ?auto_429060 ) ) ( not ( = ?auto_429055 ?auto_429056 ) ) ( not ( = ?auto_429055 ?auto_429057 ) ) ( not ( = ?auto_429055 ?auto_429058 ) ) ( not ( = ?auto_429055 ?auto_429059 ) ) ( not ( = ?auto_429055 ?auto_429060 ) ) ( not ( = ?auto_429056 ?auto_429057 ) ) ( not ( = ?auto_429056 ?auto_429058 ) ) ( not ( = ?auto_429056 ?auto_429059 ) ) ( not ( = ?auto_429056 ?auto_429060 ) ) ( not ( = ?auto_429057 ?auto_429058 ) ) ( not ( = ?auto_429057 ?auto_429059 ) ) ( not ( = ?auto_429057 ?auto_429060 ) ) ( not ( = ?auto_429058 ?auto_429059 ) ) ( not ( = ?auto_429058 ?auto_429060 ) ) ( not ( = ?auto_429059 ?auto_429060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_429059 ?auto_429060 )
      ( !STACK ?auto_429059 ?auto_429058 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429086 - BLOCK
      ?auto_429087 - BLOCK
      ?auto_429088 - BLOCK
      ?auto_429089 - BLOCK
      ?auto_429090 - BLOCK
      ?auto_429091 - BLOCK
      ?auto_429092 - BLOCK
      ?auto_429093 - BLOCK
    )
    :vars
    (
      ?auto_429094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429093 ?auto_429094 ) ( ON-TABLE ?auto_429086 ) ( ON ?auto_429087 ?auto_429086 ) ( ON ?auto_429088 ?auto_429087 ) ( ON ?auto_429089 ?auto_429088 ) ( ON ?auto_429090 ?auto_429089 ) ( ON ?auto_429091 ?auto_429090 ) ( not ( = ?auto_429086 ?auto_429087 ) ) ( not ( = ?auto_429086 ?auto_429088 ) ) ( not ( = ?auto_429086 ?auto_429089 ) ) ( not ( = ?auto_429086 ?auto_429090 ) ) ( not ( = ?auto_429086 ?auto_429091 ) ) ( not ( = ?auto_429086 ?auto_429092 ) ) ( not ( = ?auto_429086 ?auto_429093 ) ) ( not ( = ?auto_429086 ?auto_429094 ) ) ( not ( = ?auto_429087 ?auto_429088 ) ) ( not ( = ?auto_429087 ?auto_429089 ) ) ( not ( = ?auto_429087 ?auto_429090 ) ) ( not ( = ?auto_429087 ?auto_429091 ) ) ( not ( = ?auto_429087 ?auto_429092 ) ) ( not ( = ?auto_429087 ?auto_429093 ) ) ( not ( = ?auto_429087 ?auto_429094 ) ) ( not ( = ?auto_429088 ?auto_429089 ) ) ( not ( = ?auto_429088 ?auto_429090 ) ) ( not ( = ?auto_429088 ?auto_429091 ) ) ( not ( = ?auto_429088 ?auto_429092 ) ) ( not ( = ?auto_429088 ?auto_429093 ) ) ( not ( = ?auto_429088 ?auto_429094 ) ) ( not ( = ?auto_429089 ?auto_429090 ) ) ( not ( = ?auto_429089 ?auto_429091 ) ) ( not ( = ?auto_429089 ?auto_429092 ) ) ( not ( = ?auto_429089 ?auto_429093 ) ) ( not ( = ?auto_429089 ?auto_429094 ) ) ( not ( = ?auto_429090 ?auto_429091 ) ) ( not ( = ?auto_429090 ?auto_429092 ) ) ( not ( = ?auto_429090 ?auto_429093 ) ) ( not ( = ?auto_429090 ?auto_429094 ) ) ( not ( = ?auto_429091 ?auto_429092 ) ) ( not ( = ?auto_429091 ?auto_429093 ) ) ( not ( = ?auto_429091 ?auto_429094 ) ) ( not ( = ?auto_429092 ?auto_429093 ) ) ( not ( = ?auto_429092 ?auto_429094 ) ) ( not ( = ?auto_429093 ?auto_429094 ) ) ( CLEAR ?auto_429091 ) ( ON ?auto_429092 ?auto_429093 ) ( CLEAR ?auto_429092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_429086 ?auto_429087 ?auto_429088 ?auto_429089 ?auto_429090 ?auto_429091 ?auto_429092 )
      ( MAKE-8PILE ?auto_429086 ?auto_429087 ?auto_429088 ?auto_429089 ?auto_429090 ?auto_429091 ?auto_429092 ?auto_429093 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429120 - BLOCK
      ?auto_429121 - BLOCK
      ?auto_429122 - BLOCK
      ?auto_429123 - BLOCK
      ?auto_429124 - BLOCK
      ?auto_429125 - BLOCK
      ?auto_429126 - BLOCK
      ?auto_429127 - BLOCK
    )
    :vars
    (
      ?auto_429128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429127 ?auto_429128 ) ( ON-TABLE ?auto_429120 ) ( ON ?auto_429121 ?auto_429120 ) ( ON ?auto_429122 ?auto_429121 ) ( ON ?auto_429123 ?auto_429122 ) ( ON ?auto_429124 ?auto_429123 ) ( not ( = ?auto_429120 ?auto_429121 ) ) ( not ( = ?auto_429120 ?auto_429122 ) ) ( not ( = ?auto_429120 ?auto_429123 ) ) ( not ( = ?auto_429120 ?auto_429124 ) ) ( not ( = ?auto_429120 ?auto_429125 ) ) ( not ( = ?auto_429120 ?auto_429126 ) ) ( not ( = ?auto_429120 ?auto_429127 ) ) ( not ( = ?auto_429120 ?auto_429128 ) ) ( not ( = ?auto_429121 ?auto_429122 ) ) ( not ( = ?auto_429121 ?auto_429123 ) ) ( not ( = ?auto_429121 ?auto_429124 ) ) ( not ( = ?auto_429121 ?auto_429125 ) ) ( not ( = ?auto_429121 ?auto_429126 ) ) ( not ( = ?auto_429121 ?auto_429127 ) ) ( not ( = ?auto_429121 ?auto_429128 ) ) ( not ( = ?auto_429122 ?auto_429123 ) ) ( not ( = ?auto_429122 ?auto_429124 ) ) ( not ( = ?auto_429122 ?auto_429125 ) ) ( not ( = ?auto_429122 ?auto_429126 ) ) ( not ( = ?auto_429122 ?auto_429127 ) ) ( not ( = ?auto_429122 ?auto_429128 ) ) ( not ( = ?auto_429123 ?auto_429124 ) ) ( not ( = ?auto_429123 ?auto_429125 ) ) ( not ( = ?auto_429123 ?auto_429126 ) ) ( not ( = ?auto_429123 ?auto_429127 ) ) ( not ( = ?auto_429123 ?auto_429128 ) ) ( not ( = ?auto_429124 ?auto_429125 ) ) ( not ( = ?auto_429124 ?auto_429126 ) ) ( not ( = ?auto_429124 ?auto_429127 ) ) ( not ( = ?auto_429124 ?auto_429128 ) ) ( not ( = ?auto_429125 ?auto_429126 ) ) ( not ( = ?auto_429125 ?auto_429127 ) ) ( not ( = ?auto_429125 ?auto_429128 ) ) ( not ( = ?auto_429126 ?auto_429127 ) ) ( not ( = ?auto_429126 ?auto_429128 ) ) ( not ( = ?auto_429127 ?auto_429128 ) ) ( ON ?auto_429126 ?auto_429127 ) ( CLEAR ?auto_429124 ) ( ON ?auto_429125 ?auto_429126 ) ( CLEAR ?auto_429125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_429120 ?auto_429121 ?auto_429122 ?auto_429123 ?auto_429124 ?auto_429125 )
      ( MAKE-8PILE ?auto_429120 ?auto_429121 ?auto_429122 ?auto_429123 ?auto_429124 ?auto_429125 ?auto_429126 ?auto_429127 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429154 - BLOCK
      ?auto_429155 - BLOCK
      ?auto_429156 - BLOCK
      ?auto_429157 - BLOCK
      ?auto_429158 - BLOCK
      ?auto_429159 - BLOCK
      ?auto_429160 - BLOCK
      ?auto_429161 - BLOCK
    )
    :vars
    (
      ?auto_429162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429161 ?auto_429162 ) ( ON-TABLE ?auto_429154 ) ( ON ?auto_429155 ?auto_429154 ) ( ON ?auto_429156 ?auto_429155 ) ( ON ?auto_429157 ?auto_429156 ) ( not ( = ?auto_429154 ?auto_429155 ) ) ( not ( = ?auto_429154 ?auto_429156 ) ) ( not ( = ?auto_429154 ?auto_429157 ) ) ( not ( = ?auto_429154 ?auto_429158 ) ) ( not ( = ?auto_429154 ?auto_429159 ) ) ( not ( = ?auto_429154 ?auto_429160 ) ) ( not ( = ?auto_429154 ?auto_429161 ) ) ( not ( = ?auto_429154 ?auto_429162 ) ) ( not ( = ?auto_429155 ?auto_429156 ) ) ( not ( = ?auto_429155 ?auto_429157 ) ) ( not ( = ?auto_429155 ?auto_429158 ) ) ( not ( = ?auto_429155 ?auto_429159 ) ) ( not ( = ?auto_429155 ?auto_429160 ) ) ( not ( = ?auto_429155 ?auto_429161 ) ) ( not ( = ?auto_429155 ?auto_429162 ) ) ( not ( = ?auto_429156 ?auto_429157 ) ) ( not ( = ?auto_429156 ?auto_429158 ) ) ( not ( = ?auto_429156 ?auto_429159 ) ) ( not ( = ?auto_429156 ?auto_429160 ) ) ( not ( = ?auto_429156 ?auto_429161 ) ) ( not ( = ?auto_429156 ?auto_429162 ) ) ( not ( = ?auto_429157 ?auto_429158 ) ) ( not ( = ?auto_429157 ?auto_429159 ) ) ( not ( = ?auto_429157 ?auto_429160 ) ) ( not ( = ?auto_429157 ?auto_429161 ) ) ( not ( = ?auto_429157 ?auto_429162 ) ) ( not ( = ?auto_429158 ?auto_429159 ) ) ( not ( = ?auto_429158 ?auto_429160 ) ) ( not ( = ?auto_429158 ?auto_429161 ) ) ( not ( = ?auto_429158 ?auto_429162 ) ) ( not ( = ?auto_429159 ?auto_429160 ) ) ( not ( = ?auto_429159 ?auto_429161 ) ) ( not ( = ?auto_429159 ?auto_429162 ) ) ( not ( = ?auto_429160 ?auto_429161 ) ) ( not ( = ?auto_429160 ?auto_429162 ) ) ( not ( = ?auto_429161 ?auto_429162 ) ) ( ON ?auto_429160 ?auto_429161 ) ( ON ?auto_429159 ?auto_429160 ) ( CLEAR ?auto_429157 ) ( ON ?auto_429158 ?auto_429159 ) ( CLEAR ?auto_429158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_429154 ?auto_429155 ?auto_429156 ?auto_429157 ?auto_429158 )
      ( MAKE-8PILE ?auto_429154 ?auto_429155 ?auto_429156 ?auto_429157 ?auto_429158 ?auto_429159 ?auto_429160 ?auto_429161 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429188 - BLOCK
      ?auto_429189 - BLOCK
      ?auto_429190 - BLOCK
      ?auto_429191 - BLOCK
      ?auto_429192 - BLOCK
      ?auto_429193 - BLOCK
      ?auto_429194 - BLOCK
      ?auto_429195 - BLOCK
    )
    :vars
    (
      ?auto_429196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429195 ?auto_429196 ) ( ON-TABLE ?auto_429188 ) ( ON ?auto_429189 ?auto_429188 ) ( ON ?auto_429190 ?auto_429189 ) ( not ( = ?auto_429188 ?auto_429189 ) ) ( not ( = ?auto_429188 ?auto_429190 ) ) ( not ( = ?auto_429188 ?auto_429191 ) ) ( not ( = ?auto_429188 ?auto_429192 ) ) ( not ( = ?auto_429188 ?auto_429193 ) ) ( not ( = ?auto_429188 ?auto_429194 ) ) ( not ( = ?auto_429188 ?auto_429195 ) ) ( not ( = ?auto_429188 ?auto_429196 ) ) ( not ( = ?auto_429189 ?auto_429190 ) ) ( not ( = ?auto_429189 ?auto_429191 ) ) ( not ( = ?auto_429189 ?auto_429192 ) ) ( not ( = ?auto_429189 ?auto_429193 ) ) ( not ( = ?auto_429189 ?auto_429194 ) ) ( not ( = ?auto_429189 ?auto_429195 ) ) ( not ( = ?auto_429189 ?auto_429196 ) ) ( not ( = ?auto_429190 ?auto_429191 ) ) ( not ( = ?auto_429190 ?auto_429192 ) ) ( not ( = ?auto_429190 ?auto_429193 ) ) ( not ( = ?auto_429190 ?auto_429194 ) ) ( not ( = ?auto_429190 ?auto_429195 ) ) ( not ( = ?auto_429190 ?auto_429196 ) ) ( not ( = ?auto_429191 ?auto_429192 ) ) ( not ( = ?auto_429191 ?auto_429193 ) ) ( not ( = ?auto_429191 ?auto_429194 ) ) ( not ( = ?auto_429191 ?auto_429195 ) ) ( not ( = ?auto_429191 ?auto_429196 ) ) ( not ( = ?auto_429192 ?auto_429193 ) ) ( not ( = ?auto_429192 ?auto_429194 ) ) ( not ( = ?auto_429192 ?auto_429195 ) ) ( not ( = ?auto_429192 ?auto_429196 ) ) ( not ( = ?auto_429193 ?auto_429194 ) ) ( not ( = ?auto_429193 ?auto_429195 ) ) ( not ( = ?auto_429193 ?auto_429196 ) ) ( not ( = ?auto_429194 ?auto_429195 ) ) ( not ( = ?auto_429194 ?auto_429196 ) ) ( not ( = ?auto_429195 ?auto_429196 ) ) ( ON ?auto_429194 ?auto_429195 ) ( ON ?auto_429193 ?auto_429194 ) ( ON ?auto_429192 ?auto_429193 ) ( CLEAR ?auto_429190 ) ( ON ?auto_429191 ?auto_429192 ) ( CLEAR ?auto_429191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_429188 ?auto_429189 ?auto_429190 ?auto_429191 )
      ( MAKE-8PILE ?auto_429188 ?auto_429189 ?auto_429190 ?auto_429191 ?auto_429192 ?auto_429193 ?auto_429194 ?auto_429195 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429222 - BLOCK
      ?auto_429223 - BLOCK
      ?auto_429224 - BLOCK
      ?auto_429225 - BLOCK
      ?auto_429226 - BLOCK
      ?auto_429227 - BLOCK
      ?auto_429228 - BLOCK
      ?auto_429229 - BLOCK
    )
    :vars
    (
      ?auto_429230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429229 ?auto_429230 ) ( ON-TABLE ?auto_429222 ) ( ON ?auto_429223 ?auto_429222 ) ( not ( = ?auto_429222 ?auto_429223 ) ) ( not ( = ?auto_429222 ?auto_429224 ) ) ( not ( = ?auto_429222 ?auto_429225 ) ) ( not ( = ?auto_429222 ?auto_429226 ) ) ( not ( = ?auto_429222 ?auto_429227 ) ) ( not ( = ?auto_429222 ?auto_429228 ) ) ( not ( = ?auto_429222 ?auto_429229 ) ) ( not ( = ?auto_429222 ?auto_429230 ) ) ( not ( = ?auto_429223 ?auto_429224 ) ) ( not ( = ?auto_429223 ?auto_429225 ) ) ( not ( = ?auto_429223 ?auto_429226 ) ) ( not ( = ?auto_429223 ?auto_429227 ) ) ( not ( = ?auto_429223 ?auto_429228 ) ) ( not ( = ?auto_429223 ?auto_429229 ) ) ( not ( = ?auto_429223 ?auto_429230 ) ) ( not ( = ?auto_429224 ?auto_429225 ) ) ( not ( = ?auto_429224 ?auto_429226 ) ) ( not ( = ?auto_429224 ?auto_429227 ) ) ( not ( = ?auto_429224 ?auto_429228 ) ) ( not ( = ?auto_429224 ?auto_429229 ) ) ( not ( = ?auto_429224 ?auto_429230 ) ) ( not ( = ?auto_429225 ?auto_429226 ) ) ( not ( = ?auto_429225 ?auto_429227 ) ) ( not ( = ?auto_429225 ?auto_429228 ) ) ( not ( = ?auto_429225 ?auto_429229 ) ) ( not ( = ?auto_429225 ?auto_429230 ) ) ( not ( = ?auto_429226 ?auto_429227 ) ) ( not ( = ?auto_429226 ?auto_429228 ) ) ( not ( = ?auto_429226 ?auto_429229 ) ) ( not ( = ?auto_429226 ?auto_429230 ) ) ( not ( = ?auto_429227 ?auto_429228 ) ) ( not ( = ?auto_429227 ?auto_429229 ) ) ( not ( = ?auto_429227 ?auto_429230 ) ) ( not ( = ?auto_429228 ?auto_429229 ) ) ( not ( = ?auto_429228 ?auto_429230 ) ) ( not ( = ?auto_429229 ?auto_429230 ) ) ( ON ?auto_429228 ?auto_429229 ) ( ON ?auto_429227 ?auto_429228 ) ( ON ?auto_429226 ?auto_429227 ) ( ON ?auto_429225 ?auto_429226 ) ( CLEAR ?auto_429223 ) ( ON ?auto_429224 ?auto_429225 ) ( CLEAR ?auto_429224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_429222 ?auto_429223 ?auto_429224 )
      ( MAKE-8PILE ?auto_429222 ?auto_429223 ?auto_429224 ?auto_429225 ?auto_429226 ?auto_429227 ?auto_429228 ?auto_429229 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429256 - BLOCK
      ?auto_429257 - BLOCK
      ?auto_429258 - BLOCK
      ?auto_429259 - BLOCK
      ?auto_429260 - BLOCK
      ?auto_429261 - BLOCK
      ?auto_429262 - BLOCK
      ?auto_429263 - BLOCK
    )
    :vars
    (
      ?auto_429264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429263 ?auto_429264 ) ( ON-TABLE ?auto_429256 ) ( not ( = ?auto_429256 ?auto_429257 ) ) ( not ( = ?auto_429256 ?auto_429258 ) ) ( not ( = ?auto_429256 ?auto_429259 ) ) ( not ( = ?auto_429256 ?auto_429260 ) ) ( not ( = ?auto_429256 ?auto_429261 ) ) ( not ( = ?auto_429256 ?auto_429262 ) ) ( not ( = ?auto_429256 ?auto_429263 ) ) ( not ( = ?auto_429256 ?auto_429264 ) ) ( not ( = ?auto_429257 ?auto_429258 ) ) ( not ( = ?auto_429257 ?auto_429259 ) ) ( not ( = ?auto_429257 ?auto_429260 ) ) ( not ( = ?auto_429257 ?auto_429261 ) ) ( not ( = ?auto_429257 ?auto_429262 ) ) ( not ( = ?auto_429257 ?auto_429263 ) ) ( not ( = ?auto_429257 ?auto_429264 ) ) ( not ( = ?auto_429258 ?auto_429259 ) ) ( not ( = ?auto_429258 ?auto_429260 ) ) ( not ( = ?auto_429258 ?auto_429261 ) ) ( not ( = ?auto_429258 ?auto_429262 ) ) ( not ( = ?auto_429258 ?auto_429263 ) ) ( not ( = ?auto_429258 ?auto_429264 ) ) ( not ( = ?auto_429259 ?auto_429260 ) ) ( not ( = ?auto_429259 ?auto_429261 ) ) ( not ( = ?auto_429259 ?auto_429262 ) ) ( not ( = ?auto_429259 ?auto_429263 ) ) ( not ( = ?auto_429259 ?auto_429264 ) ) ( not ( = ?auto_429260 ?auto_429261 ) ) ( not ( = ?auto_429260 ?auto_429262 ) ) ( not ( = ?auto_429260 ?auto_429263 ) ) ( not ( = ?auto_429260 ?auto_429264 ) ) ( not ( = ?auto_429261 ?auto_429262 ) ) ( not ( = ?auto_429261 ?auto_429263 ) ) ( not ( = ?auto_429261 ?auto_429264 ) ) ( not ( = ?auto_429262 ?auto_429263 ) ) ( not ( = ?auto_429262 ?auto_429264 ) ) ( not ( = ?auto_429263 ?auto_429264 ) ) ( ON ?auto_429262 ?auto_429263 ) ( ON ?auto_429261 ?auto_429262 ) ( ON ?auto_429260 ?auto_429261 ) ( ON ?auto_429259 ?auto_429260 ) ( ON ?auto_429258 ?auto_429259 ) ( CLEAR ?auto_429256 ) ( ON ?auto_429257 ?auto_429258 ) ( CLEAR ?auto_429257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_429256 ?auto_429257 )
      ( MAKE-8PILE ?auto_429256 ?auto_429257 ?auto_429258 ?auto_429259 ?auto_429260 ?auto_429261 ?auto_429262 ?auto_429263 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_429290 - BLOCK
      ?auto_429291 - BLOCK
      ?auto_429292 - BLOCK
      ?auto_429293 - BLOCK
      ?auto_429294 - BLOCK
      ?auto_429295 - BLOCK
      ?auto_429296 - BLOCK
      ?auto_429297 - BLOCK
    )
    :vars
    (
      ?auto_429298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429297 ?auto_429298 ) ( not ( = ?auto_429290 ?auto_429291 ) ) ( not ( = ?auto_429290 ?auto_429292 ) ) ( not ( = ?auto_429290 ?auto_429293 ) ) ( not ( = ?auto_429290 ?auto_429294 ) ) ( not ( = ?auto_429290 ?auto_429295 ) ) ( not ( = ?auto_429290 ?auto_429296 ) ) ( not ( = ?auto_429290 ?auto_429297 ) ) ( not ( = ?auto_429290 ?auto_429298 ) ) ( not ( = ?auto_429291 ?auto_429292 ) ) ( not ( = ?auto_429291 ?auto_429293 ) ) ( not ( = ?auto_429291 ?auto_429294 ) ) ( not ( = ?auto_429291 ?auto_429295 ) ) ( not ( = ?auto_429291 ?auto_429296 ) ) ( not ( = ?auto_429291 ?auto_429297 ) ) ( not ( = ?auto_429291 ?auto_429298 ) ) ( not ( = ?auto_429292 ?auto_429293 ) ) ( not ( = ?auto_429292 ?auto_429294 ) ) ( not ( = ?auto_429292 ?auto_429295 ) ) ( not ( = ?auto_429292 ?auto_429296 ) ) ( not ( = ?auto_429292 ?auto_429297 ) ) ( not ( = ?auto_429292 ?auto_429298 ) ) ( not ( = ?auto_429293 ?auto_429294 ) ) ( not ( = ?auto_429293 ?auto_429295 ) ) ( not ( = ?auto_429293 ?auto_429296 ) ) ( not ( = ?auto_429293 ?auto_429297 ) ) ( not ( = ?auto_429293 ?auto_429298 ) ) ( not ( = ?auto_429294 ?auto_429295 ) ) ( not ( = ?auto_429294 ?auto_429296 ) ) ( not ( = ?auto_429294 ?auto_429297 ) ) ( not ( = ?auto_429294 ?auto_429298 ) ) ( not ( = ?auto_429295 ?auto_429296 ) ) ( not ( = ?auto_429295 ?auto_429297 ) ) ( not ( = ?auto_429295 ?auto_429298 ) ) ( not ( = ?auto_429296 ?auto_429297 ) ) ( not ( = ?auto_429296 ?auto_429298 ) ) ( not ( = ?auto_429297 ?auto_429298 ) ) ( ON ?auto_429296 ?auto_429297 ) ( ON ?auto_429295 ?auto_429296 ) ( ON ?auto_429294 ?auto_429295 ) ( ON ?auto_429293 ?auto_429294 ) ( ON ?auto_429292 ?auto_429293 ) ( ON ?auto_429291 ?auto_429292 ) ( ON ?auto_429290 ?auto_429291 ) ( CLEAR ?auto_429290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_429290 )
      ( MAKE-8PILE ?auto_429290 ?auto_429291 ?auto_429292 ?auto_429293 ?auto_429294 ?auto_429295 ?auto_429296 ?auto_429297 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429325 - BLOCK
      ?auto_429326 - BLOCK
      ?auto_429327 - BLOCK
      ?auto_429328 - BLOCK
      ?auto_429329 - BLOCK
      ?auto_429330 - BLOCK
      ?auto_429331 - BLOCK
      ?auto_429332 - BLOCK
      ?auto_429333 - BLOCK
    )
    :vars
    (
      ?auto_429334 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_429332 ) ( ON ?auto_429333 ?auto_429334 ) ( CLEAR ?auto_429333 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_429325 ) ( ON ?auto_429326 ?auto_429325 ) ( ON ?auto_429327 ?auto_429326 ) ( ON ?auto_429328 ?auto_429327 ) ( ON ?auto_429329 ?auto_429328 ) ( ON ?auto_429330 ?auto_429329 ) ( ON ?auto_429331 ?auto_429330 ) ( ON ?auto_429332 ?auto_429331 ) ( not ( = ?auto_429325 ?auto_429326 ) ) ( not ( = ?auto_429325 ?auto_429327 ) ) ( not ( = ?auto_429325 ?auto_429328 ) ) ( not ( = ?auto_429325 ?auto_429329 ) ) ( not ( = ?auto_429325 ?auto_429330 ) ) ( not ( = ?auto_429325 ?auto_429331 ) ) ( not ( = ?auto_429325 ?auto_429332 ) ) ( not ( = ?auto_429325 ?auto_429333 ) ) ( not ( = ?auto_429325 ?auto_429334 ) ) ( not ( = ?auto_429326 ?auto_429327 ) ) ( not ( = ?auto_429326 ?auto_429328 ) ) ( not ( = ?auto_429326 ?auto_429329 ) ) ( not ( = ?auto_429326 ?auto_429330 ) ) ( not ( = ?auto_429326 ?auto_429331 ) ) ( not ( = ?auto_429326 ?auto_429332 ) ) ( not ( = ?auto_429326 ?auto_429333 ) ) ( not ( = ?auto_429326 ?auto_429334 ) ) ( not ( = ?auto_429327 ?auto_429328 ) ) ( not ( = ?auto_429327 ?auto_429329 ) ) ( not ( = ?auto_429327 ?auto_429330 ) ) ( not ( = ?auto_429327 ?auto_429331 ) ) ( not ( = ?auto_429327 ?auto_429332 ) ) ( not ( = ?auto_429327 ?auto_429333 ) ) ( not ( = ?auto_429327 ?auto_429334 ) ) ( not ( = ?auto_429328 ?auto_429329 ) ) ( not ( = ?auto_429328 ?auto_429330 ) ) ( not ( = ?auto_429328 ?auto_429331 ) ) ( not ( = ?auto_429328 ?auto_429332 ) ) ( not ( = ?auto_429328 ?auto_429333 ) ) ( not ( = ?auto_429328 ?auto_429334 ) ) ( not ( = ?auto_429329 ?auto_429330 ) ) ( not ( = ?auto_429329 ?auto_429331 ) ) ( not ( = ?auto_429329 ?auto_429332 ) ) ( not ( = ?auto_429329 ?auto_429333 ) ) ( not ( = ?auto_429329 ?auto_429334 ) ) ( not ( = ?auto_429330 ?auto_429331 ) ) ( not ( = ?auto_429330 ?auto_429332 ) ) ( not ( = ?auto_429330 ?auto_429333 ) ) ( not ( = ?auto_429330 ?auto_429334 ) ) ( not ( = ?auto_429331 ?auto_429332 ) ) ( not ( = ?auto_429331 ?auto_429333 ) ) ( not ( = ?auto_429331 ?auto_429334 ) ) ( not ( = ?auto_429332 ?auto_429333 ) ) ( not ( = ?auto_429332 ?auto_429334 ) ) ( not ( = ?auto_429333 ?auto_429334 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_429333 ?auto_429334 )
      ( !STACK ?auto_429333 ?auto_429332 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429363 - BLOCK
      ?auto_429364 - BLOCK
      ?auto_429365 - BLOCK
      ?auto_429366 - BLOCK
      ?auto_429367 - BLOCK
      ?auto_429368 - BLOCK
      ?auto_429369 - BLOCK
      ?auto_429370 - BLOCK
      ?auto_429371 - BLOCK
    )
    :vars
    (
      ?auto_429372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429371 ?auto_429372 ) ( ON-TABLE ?auto_429363 ) ( ON ?auto_429364 ?auto_429363 ) ( ON ?auto_429365 ?auto_429364 ) ( ON ?auto_429366 ?auto_429365 ) ( ON ?auto_429367 ?auto_429366 ) ( ON ?auto_429368 ?auto_429367 ) ( ON ?auto_429369 ?auto_429368 ) ( not ( = ?auto_429363 ?auto_429364 ) ) ( not ( = ?auto_429363 ?auto_429365 ) ) ( not ( = ?auto_429363 ?auto_429366 ) ) ( not ( = ?auto_429363 ?auto_429367 ) ) ( not ( = ?auto_429363 ?auto_429368 ) ) ( not ( = ?auto_429363 ?auto_429369 ) ) ( not ( = ?auto_429363 ?auto_429370 ) ) ( not ( = ?auto_429363 ?auto_429371 ) ) ( not ( = ?auto_429363 ?auto_429372 ) ) ( not ( = ?auto_429364 ?auto_429365 ) ) ( not ( = ?auto_429364 ?auto_429366 ) ) ( not ( = ?auto_429364 ?auto_429367 ) ) ( not ( = ?auto_429364 ?auto_429368 ) ) ( not ( = ?auto_429364 ?auto_429369 ) ) ( not ( = ?auto_429364 ?auto_429370 ) ) ( not ( = ?auto_429364 ?auto_429371 ) ) ( not ( = ?auto_429364 ?auto_429372 ) ) ( not ( = ?auto_429365 ?auto_429366 ) ) ( not ( = ?auto_429365 ?auto_429367 ) ) ( not ( = ?auto_429365 ?auto_429368 ) ) ( not ( = ?auto_429365 ?auto_429369 ) ) ( not ( = ?auto_429365 ?auto_429370 ) ) ( not ( = ?auto_429365 ?auto_429371 ) ) ( not ( = ?auto_429365 ?auto_429372 ) ) ( not ( = ?auto_429366 ?auto_429367 ) ) ( not ( = ?auto_429366 ?auto_429368 ) ) ( not ( = ?auto_429366 ?auto_429369 ) ) ( not ( = ?auto_429366 ?auto_429370 ) ) ( not ( = ?auto_429366 ?auto_429371 ) ) ( not ( = ?auto_429366 ?auto_429372 ) ) ( not ( = ?auto_429367 ?auto_429368 ) ) ( not ( = ?auto_429367 ?auto_429369 ) ) ( not ( = ?auto_429367 ?auto_429370 ) ) ( not ( = ?auto_429367 ?auto_429371 ) ) ( not ( = ?auto_429367 ?auto_429372 ) ) ( not ( = ?auto_429368 ?auto_429369 ) ) ( not ( = ?auto_429368 ?auto_429370 ) ) ( not ( = ?auto_429368 ?auto_429371 ) ) ( not ( = ?auto_429368 ?auto_429372 ) ) ( not ( = ?auto_429369 ?auto_429370 ) ) ( not ( = ?auto_429369 ?auto_429371 ) ) ( not ( = ?auto_429369 ?auto_429372 ) ) ( not ( = ?auto_429370 ?auto_429371 ) ) ( not ( = ?auto_429370 ?auto_429372 ) ) ( not ( = ?auto_429371 ?auto_429372 ) ) ( CLEAR ?auto_429369 ) ( ON ?auto_429370 ?auto_429371 ) ( CLEAR ?auto_429370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_429363 ?auto_429364 ?auto_429365 ?auto_429366 ?auto_429367 ?auto_429368 ?auto_429369 ?auto_429370 )
      ( MAKE-9PILE ?auto_429363 ?auto_429364 ?auto_429365 ?auto_429366 ?auto_429367 ?auto_429368 ?auto_429369 ?auto_429370 ?auto_429371 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429401 - BLOCK
      ?auto_429402 - BLOCK
      ?auto_429403 - BLOCK
      ?auto_429404 - BLOCK
      ?auto_429405 - BLOCK
      ?auto_429406 - BLOCK
      ?auto_429407 - BLOCK
      ?auto_429408 - BLOCK
      ?auto_429409 - BLOCK
    )
    :vars
    (
      ?auto_429410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429409 ?auto_429410 ) ( ON-TABLE ?auto_429401 ) ( ON ?auto_429402 ?auto_429401 ) ( ON ?auto_429403 ?auto_429402 ) ( ON ?auto_429404 ?auto_429403 ) ( ON ?auto_429405 ?auto_429404 ) ( ON ?auto_429406 ?auto_429405 ) ( not ( = ?auto_429401 ?auto_429402 ) ) ( not ( = ?auto_429401 ?auto_429403 ) ) ( not ( = ?auto_429401 ?auto_429404 ) ) ( not ( = ?auto_429401 ?auto_429405 ) ) ( not ( = ?auto_429401 ?auto_429406 ) ) ( not ( = ?auto_429401 ?auto_429407 ) ) ( not ( = ?auto_429401 ?auto_429408 ) ) ( not ( = ?auto_429401 ?auto_429409 ) ) ( not ( = ?auto_429401 ?auto_429410 ) ) ( not ( = ?auto_429402 ?auto_429403 ) ) ( not ( = ?auto_429402 ?auto_429404 ) ) ( not ( = ?auto_429402 ?auto_429405 ) ) ( not ( = ?auto_429402 ?auto_429406 ) ) ( not ( = ?auto_429402 ?auto_429407 ) ) ( not ( = ?auto_429402 ?auto_429408 ) ) ( not ( = ?auto_429402 ?auto_429409 ) ) ( not ( = ?auto_429402 ?auto_429410 ) ) ( not ( = ?auto_429403 ?auto_429404 ) ) ( not ( = ?auto_429403 ?auto_429405 ) ) ( not ( = ?auto_429403 ?auto_429406 ) ) ( not ( = ?auto_429403 ?auto_429407 ) ) ( not ( = ?auto_429403 ?auto_429408 ) ) ( not ( = ?auto_429403 ?auto_429409 ) ) ( not ( = ?auto_429403 ?auto_429410 ) ) ( not ( = ?auto_429404 ?auto_429405 ) ) ( not ( = ?auto_429404 ?auto_429406 ) ) ( not ( = ?auto_429404 ?auto_429407 ) ) ( not ( = ?auto_429404 ?auto_429408 ) ) ( not ( = ?auto_429404 ?auto_429409 ) ) ( not ( = ?auto_429404 ?auto_429410 ) ) ( not ( = ?auto_429405 ?auto_429406 ) ) ( not ( = ?auto_429405 ?auto_429407 ) ) ( not ( = ?auto_429405 ?auto_429408 ) ) ( not ( = ?auto_429405 ?auto_429409 ) ) ( not ( = ?auto_429405 ?auto_429410 ) ) ( not ( = ?auto_429406 ?auto_429407 ) ) ( not ( = ?auto_429406 ?auto_429408 ) ) ( not ( = ?auto_429406 ?auto_429409 ) ) ( not ( = ?auto_429406 ?auto_429410 ) ) ( not ( = ?auto_429407 ?auto_429408 ) ) ( not ( = ?auto_429407 ?auto_429409 ) ) ( not ( = ?auto_429407 ?auto_429410 ) ) ( not ( = ?auto_429408 ?auto_429409 ) ) ( not ( = ?auto_429408 ?auto_429410 ) ) ( not ( = ?auto_429409 ?auto_429410 ) ) ( ON ?auto_429408 ?auto_429409 ) ( CLEAR ?auto_429406 ) ( ON ?auto_429407 ?auto_429408 ) ( CLEAR ?auto_429407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_429401 ?auto_429402 ?auto_429403 ?auto_429404 ?auto_429405 ?auto_429406 ?auto_429407 )
      ( MAKE-9PILE ?auto_429401 ?auto_429402 ?auto_429403 ?auto_429404 ?auto_429405 ?auto_429406 ?auto_429407 ?auto_429408 ?auto_429409 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429439 - BLOCK
      ?auto_429440 - BLOCK
      ?auto_429441 - BLOCK
      ?auto_429442 - BLOCK
      ?auto_429443 - BLOCK
      ?auto_429444 - BLOCK
      ?auto_429445 - BLOCK
      ?auto_429446 - BLOCK
      ?auto_429447 - BLOCK
    )
    :vars
    (
      ?auto_429448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429447 ?auto_429448 ) ( ON-TABLE ?auto_429439 ) ( ON ?auto_429440 ?auto_429439 ) ( ON ?auto_429441 ?auto_429440 ) ( ON ?auto_429442 ?auto_429441 ) ( ON ?auto_429443 ?auto_429442 ) ( not ( = ?auto_429439 ?auto_429440 ) ) ( not ( = ?auto_429439 ?auto_429441 ) ) ( not ( = ?auto_429439 ?auto_429442 ) ) ( not ( = ?auto_429439 ?auto_429443 ) ) ( not ( = ?auto_429439 ?auto_429444 ) ) ( not ( = ?auto_429439 ?auto_429445 ) ) ( not ( = ?auto_429439 ?auto_429446 ) ) ( not ( = ?auto_429439 ?auto_429447 ) ) ( not ( = ?auto_429439 ?auto_429448 ) ) ( not ( = ?auto_429440 ?auto_429441 ) ) ( not ( = ?auto_429440 ?auto_429442 ) ) ( not ( = ?auto_429440 ?auto_429443 ) ) ( not ( = ?auto_429440 ?auto_429444 ) ) ( not ( = ?auto_429440 ?auto_429445 ) ) ( not ( = ?auto_429440 ?auto_429446 ) ) ( not ( = ?auto_429440 ?auto_429447 ) ) ( not ( = ?auto_429440 ?auto_429448 ) ) ( not ( = ?auto_429441 ?auto_429442 ) ) ( not ( = ?auto_429441 ?auto_429443 ) ) ( not ( = ?auto_429441 ?auto_429444 ) ) ( not ( = ?auto_429441 ?auto_429445 ) ) ( not ( = ?auto_429441 ?auto_429446 ) ) ( not ( = ?auto_429441 ?auto_429447 ) ) ( not ( = ?auto_429441 ?auto_429448 ) ) ( not ( = ?auto_429442 ?auto_429443 ) ) ( not ( = ?auto_429442 ?auto_429444 ) ) ( not ( = ?auto_429442 ?auto_429445 ) ) ( not ( = ?auto_429442 ?auto_429446 ) ) ( not ( = ?auto_429442 ?auto_429447 ) ) ( not ( = ?auto_429442 ?auto_429448 ) ) ( not ( = ?auto_429443 ?auto_429444 ) ) ( not ( = ?auto_429443 ?auto_429445 ) ) ( not ( = ?auto_429443 ?auto_429446 ) ) ( not ( = ?auto_429443 ?auto_429447 ) ) ( not ( = ?auto_429443 ?auto_429448 ) ) ( not ( = ?auto_429444 ?auto_429445 ) ) ( not ( = ?auto_429444 ?auto_429446 ) ) ( not ( = ?auto_429444 ?auto_429447 ) ) ( not ( = ?auto_429444 ?auto_429448 ) ) ( not ( = ?auto_429445 ?auto_429446 ) ) ( not ( = ?auto_429445 ?auto_429447 ) ) ( not ( = ?auto_429445 ?auto_429448 ) ) ( not ( = ?auto_429446 ?auto_429447 ) ) ( not ( = ?auto_429446 ?auto_429448 ) ) ( not ( = ?auto_429447 ?auto_429448 ) ) ( ON ?auto_429446 ?auto_429447 ) ( ON ?auto_429445 ?auto_429446 ) ( CLEAR ?auto_429443 ) ( ON ?auto_429444 ?auto_429445 ) ( CLEAR ?auto_429444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_429439 ?auto_429440 ?auto_429441 ?auto_429442 ?auto_429443 ?auto_429444 )
      ( MAKE-9PILE ?auto_429439 ?auto_429440 ?auto_429441 ?auto_429442 ?auto_429443 ?auto_429444 ?auto_429445 ?auto_429446 ?auto_429447 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429477 - BLOCK
      ?auto_429478 - BLOCK
      ?auto_429479 - BLOCK
      ?auto_429480 - BLOCK
      ?auto_429481 - BLOCK
      ?auto_429482 - BLOCK
      ?auto_429483 - BLOCK
      ?auto_429484 - BLOCK
      ?auto_429485 - BLOCK
    )
    :vars
    (
      ?auto_429486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429485 ?auto_429486 ) ( ON-TABLE ?auto_429477 ) ( ON ?auto_429478 ?auto_429477 ) ( ON ?auto_429479 ?auto_429478 ) ( ON ?auto_429480 ?auto_429479 ) ( not ( = ?auto_429477 ?auto_429478 ) ) ( not ( = ?auto_429477 ?auto_429479 ) ) ( not ( = ?auto_429477 ?auto_429480 ) ) ( not ( = ?auto_429477 ?auto_429481 ) ) ( not ( = ?auto_429477 ?auto_429482 ) ) ( not ( = ?auto_429477 ?auto_429483 ) ) ( not ( = ?auto_429477 ?auto_429484 ) ) ( not ( = ?auto_429477 ?auto_429485 ) ) ( not ( = ?auto_429477 ?auto_429486 ) ) ( not ( = ?auto_429478 ?auto_429479 ) ) ( not ( = ?auto_429478 ?auto_429480 ) ) ( not ( = ?auto_429478 ?auto_429481 ) ) ( not ( = ?auto_429478 ?auto_429482 ) ) ( not ( = ?auto_429478 ?auto_429483 ) ) ( not ( = ?auto_429478 ?auto_429484 ) ) ( not ( = ?auto_429478 ?auto_429485 ) ) ( not ( = ?auto_429478 ?auto_429486 ) ) ( not ( = ?auto_429479 ?auto_429480 ) ) ( not ( = ?auto_429479 ?auto_429481 ) ) ( not ( = ?auto_429479 ?auto_429482 ) ) ( not ( = ?auto_429479 ?auto_429483 ) ) ( not ( = ?auto_429479 ?auto_429484 ) ) ( not ( = ?auto_429479 ?auto_429485 ) ) ( not ( = ?auto_429479 ?auto_429486 ) ) ( not ( = ?auto_429480 ?auto_429481 ) ) ( not ( = ?auto_429480 ?auto_429482 ) ) ( not ( = ?auto_429480 ?auto_429483 ) ) ( not ( = ?auto_429480 ?auto_429484 ) ) ( not ( = ?auto_429480 ?auto_429485 ) ) ( not ( = ?auto_429480 ?auto_429486 ) ) ( not ( = ?auto_429481 ?auto_429482 ) ) ( not ( = ?auto_429481 ?auto_429483 ) ) ( not ( = ?auto_429481 ?auto_429484 ) ) ( not ( = ?auto_429481 ?auto_429485 ) ) ( not ( = ?auto_429481 ?auto_429486 ) ) ( not ( = ?auto_429482 ?auto_429483 ) ) ( not ( = ?auto_429482 ?auto_429484 ) ) ( not ( = ?auto_429482 ?auto_429485 ) ) ( not ( = ?auto_429482 ?auto_429486 ) ) ( not ( = ?auto_429483 ?auto_429484 ) ) ( not ( = ?auto_429483 ?auto_429485 ) ) ( not ( = ?auto_429483 ?auto_429486 ) ) ( not ( = ?auto_429484 ?auto_429485 ) ) ( not ( = ?auto_429484 ?auto_429486 ) ) ( not ( = ?auto_429485 ?auto_429486 ) ) ( ON ?auto_429484 ?auto_429485 ) ( ON ?auto_429483 ?auto_429484 ) ( ON ?auto_429482 ?auto_429483 ) ( CLEAR ?auto_429480 ) ( ON ?auto_429481 ?auto_429482 ) ( CLEAR ?auto_429481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_429477 ?auto_429478 ?auto_429479 ?auto_429480 ?auto_429481 )
      ( MAKE-9PILE ?auto_429477 ?auto_429478 ?auto_429479 ?auto_429480 ?auto_429481 ?auto_429482 ?auto_429483 ?auto_429484 ?auto_429485 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429515 - BLOCK
      ?auto_429516 - BLOCK
      ?auto_429517 - BLOCK
      ?auto_429518 - BLOCK
      ?auto_429519 - BLOCK
      ?auto_429520 - BLOCK
      ?auto_429521 - BLOCK
      ?auto_429522 - BLOCK
      ?auto_429523 - BLOCK
    )
    :vars
    (
      ?auto_429524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429523 ?auto_429524 ) ( ON-TABLE ?auto_429515 ) ( ON ?auto_429516 ?auto_429515 ) ( ON ?auto_429517 ?auto_429516 ) ( not ( = ?auto_429515 ?auto_429516 ) ) ( not ( = ?auto_429515 ?auto_429517 ) ) ( not ( = ?auto_429515 ?auto_429518 ) ) ( not ( = ?auto_429515 ?auto_429519 ) ) ( not ( = ?auto_429515 ?auto_429520 ) ) ( not ( = ?auto_429515 ?auto_429521 ) ) ( not ( = ?auto_429515 ?auto_429522 ) ) ( not ( = ?auto_429515 ?auto_429523 ) ) ( not ( = ?auto_429515 ?auto_429524 ) ) ( not ( = ?auto_429516 ?auto_429517 ) ) ( not ( = ?auto_429516 ?auto_429518 ) ) ( not ( = ?auto_429516 ?auto_429519 ) ) ( not ( = ?auto_429516 ?auto_429520 ) ) ( not ( = ?auto_429516 ?auto_429521 ) ) ( not ( = ?auto_429516 ?auto_429522 ) ) ( not ( = ?auto_429516 ?auto_429523 ) ) ( not ( = ?auto_429516 ?auto_429524 ) ) ( not ( = ?auto_429517 ?auto_429518 ) ) ( not ( = ?auto_429517 ?auto_429519 ) ) ( not ( = ?auto_429517 ?auto_429520 ) ) ( not ( = ?auto_429517 ?auto_429521 ) ) ( not ( = ?auto_429517 ?auto_429522 ) ) ( not ( = ?auto_429517 ?auto_429523 ) ) ( not ( = ?auto_429517 ?auto_429524 ) ) ( not ( = ?auto_429518 ?auto_429519 ) ) ( not ( = ?auto_429518 ?auto_429520 ) ) ( not ( = ?auto_429518 ?auto_429521 ) ) ( not ( = ?auto_429518 ?auto_429522 ) ) ( not ( = ?auto_429518 ?auto_429523 ) ) ( not ( = ?auto_429518 ?auto_429524 ) ) ( not ( = ?auto_429519 ?auto_429520 ) ) ( not ( = ?auto_429519 ?auto_429521 ) ) ( not ( = ?auto_429519 ?auto_429522 ) ) ( not ( = ?auto_429519 ?auto_429523 ) ) ( not ( = ?auto_429519 ?auto_429524 ) ) ( not ( = ?auto_429520 ?auto_429521 ) ) ( not ( = ?auto_429520 ?auto_429522 ) ) ( not ( = ?auto_429520 ?auto_429523 ) ) ( not ( = ?auto_429520 ?auto_429524 ) ) ( not ( = ?auto_429521 ?auto_429522 ) ) ( not ( = ?auto_429521 ?auto_429523 ) ) ( not ( = ?auto_429521 ?auto_429524 ) ) ( not ( = ?auto_429522 ?auto_429523 ) ) ( not ( = ?auto_429522 ?auto_429524 ) ) ( not ( = ?auto_429523 ?auto_429524 ) ) ( ON ?auto_429522 ?auto_429523 ) ( ON ?auto_429521 ?auto_429522 ) ( ON ?auto_429520 ?auto_429521 ) ( ON ?auto_429519 ?auto_429520 ) ( CLEAR ?auto_429517 ) ( ON ?auto_429518 ?auto_429519 ) ( CLEAR ?auto_429518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_429515 ?auto_429516 ?auto_429517 ?auto_429518 )
      ( MAKE-9PILE ?auto_429515 ?auto_429516 ?auto_429517 ?auto_429518 ?auto_429519 ?auto_429520 ?auto_429521 ?auto_429522 ?auto_429523 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429553 - BLOCK
      ?auto_429554 - BLOCK
      ?auto_429555 - BLOCK
      ?auto_429556 - BLOCK
      ?auto_429557 - BLOCK
      ?auto_429558 - BLOCK
      ?auto_429559 - BLOCK
      ?auto_429560 - BLOCK
      ?auto_429561 - BLOCK
    )
    :vars
    (
      ?auto_429562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429561 ?auto_429562 ) ( ON-TABLE ?auto_429553 ) ( ON ?auto_429554 ?auto_429553 ) ( not ( = ?auto_429553 ?auto_429554 ) ) ( not ( = ?auto_429553 ?auto_429555 ) ) ( not ( = ?auto_429553 ?auto_429556 ) ) ( not ( = ?auto_429553 ?auto_429557 ) ) ( not ( = ?auto_429553 ?auto_429558 ) ) ( not ( = ?auto_429553 ?auto_429559 ) ) ( not ( = ?auto_429553 ?auto_429560 ) ) ( not ( = ?auto_429553 ?auto_429561 ) ) ( not ( = ?auto_429553 ?auto_429562 ) ) ( not ( = ?auto_429554 ?auto_429555 ) ) ( not ( = ?auto_429554 ?auto_429556 ) ) ( not ( = ?auto_429554 ?auto_429557 ) ) ( not ( = ?auto_429554 ?auto_429558 ) ) ( not ( = ?auto_429554 ?auto_429559 ) ) ( not ( = ?auto_429554 ?auto_429560 ) ) ( not ( = ?auto_429554 ?auto_429561 ) ) ( not ( = ?auto_429554 ?auto_429562 ) ) ( not ( = ?auto_429555 ?auto_429556 ) ) ( not ( = ?auto_429555 ?auto_429557 ) ) ( not ( = ?auto_429555 ?auto_429558 ) ) ( not ( = ?auto_429555 ?auto_429559 ) ) ( not ( = ?auto_429555 ?auto_429560 ) ) ( not ( = ?auto_429555 ?auto_429561 ) ) ( not ( = ?auto_429555 ?auto_429562 ) ) ( not ( = ?auto_429556 ?auto_429557 ) ) ( not ( = ?auto_429556 ?auto_429558 ) ) ( not ( = ?auto_429556 ?auto_429559 ) ) ( not ( = ?auto_429556 ?auto_429560 ) ) ( not ( = ?auto_429556 ?auto_429561 ) ) ( not ( = ?auto_429556 ?auto_429562 ) ) ( not ( = ?auto_429557 ?auto_429558 ) ) ( not ( = ?auto_429557 ?auto_429559 ) ) ( not ( = ?auto_429557 ?auto_429560 ) ) ( not ( = ?auto_429557 ?auto_429561 ) ) ( not ( = ?auto_429557 ?auto_429562 ) ) ( not ( = ?auto_429558 ?auto_429559 ) ) ( not ( = ?auto_429558 ?auto_429560 ) ) ( not ( = ?auto_429558 ?auto_429561 ) ) ( not ( = ?auto_429558 ?auto_429562 ) ) ( not ( = ?auto_429559 ?auto_429560 ) ) ( not ( = ?auto_429559 ?auto_429561 ) ) ( not ( = ?auto_429559 ?auto_429562 ) ) ( not ( = ?auto_429560 ?auto_429561 ) ) ( not ( = ?auto_429560 ?auto_429562 ) ) ( not ( = ?auto_429561 ?auto_429562 ) ) ( ON ?auto_429560 ?auto_429561 ) ( ON ?auto_429559 ?auto_429560 ) ( ON ?auto_429558 ?auto_429559 ) ( ON ?auto_429557 ?auto_429558 ) ( ON ?auto_429556 ?auto_429557 ) ( CLEAR ?auto_429554 ) ( ON ?auto_429555 ?auto_429556 ) ( CLEAR ?auto_429555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_429553 ?auto_429554 ?auto_429555 )
      ( MAKE-9PILE ?auto_429553 ?auto_429554 ?auto_429555 ?auto_429556 ?auto_429557 ?auto_429558 ?auto_429559 ?auto_429560 ?auto_429561 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429591 - BLOCK
      ?auto_429592 - BLOCK
      ?auto_429593 - BLOCK
      ?auto_429594 - BLOCK
      ?auto_429595 - BLOCK
      ?auto_429596 - BLOCK
      ?auto_429597 - BLOCK
      ?auto_429598 - BLOCK
      ?auto_429599 - BLOCK
    )
    :vars
    (
      ?auto_429600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429599 ?auto_429600 ) ( ON-TABLE ?auto_429591 ) ( not ( = ?auto_429591 ?auto_429592 ) ) ( not ( = ?auto_429591 ?auto_429593 ) ) ( not ( = ?auto_429591 ?auto_429594 ) ) ( not ( = ?auto_429591 ?auto_429595 ) ) ( not ( = ?auto_429591 ?auto_429596 ) ) ( not ( = ?auto_429591 ?auto_429597 ) ) ( not ( = ?auto_429591 ?auto_429598 ) ) ( not ( = ?auto_429591 ?auto_429599 ) ) ( not ( = ?auto_429591 ?auto_429600 ) ) ( not ( = ?auto_429592 ?auto_429593 ) ) ( not ( = ?auto_429592 ?auto_429594 ) ) ( not ( = ?auto_429592 ?auto_429595 ) ) ( not ( = ?auto_429592 ?auto_429596 ) ) ( not ( = ?auto_429592 ?auto_429597 ) ) ( not ( = ?auto_429592 ?auto_429598 ) ) ( not ( = ?auto_429592 ?auto_429599 ) ) ( not ( = ?auto_429592 ?auto_429600 ) ) ( not ( = ?auto_429593 ?auto_429594 ) ) ( not ( = ?auto_429593 ?auto_429595 ) ) ( not ( = ?auto_429593 ?auto_429596 ) ) ( not ( = ?auto_429593 ?auto_429597 ) ) ( not ( = ?auto_429593 ?auto_429598 ) ) ( not ( = ?auto_429593 ?auto_429599 ) ) ( not ( = ?auto_429593 ?auto_429600 ) ) ( not ( = ?auto_429594 ?auto_429595 ) ) ( not ( = ?auto_429594 ?auto_429596 ) ) ( not ( = ?auto_429594 ?auto_429597 ) ) ( not ( = ?auto_429594 ?auto_429598 ) ) ( not ( = ?auto_429594 ?auto_429599 ) ) ( not ( = ?auto_429594 ?auto_429600 ) ) ( not ( = ?auto_429595 ?auto_429596 ) ) ( not ( = ?auto_429595 ?auto_429597 ) ) ( not ( = ?auto_429595 ?auto_429598 ) ) ( not ( = ?auto_429595 ?auto_429599 ) ) ( not ( = ?auto_429595 ?auto_429600 ) ) ( not ( = ?auto_429596 ?auto_429597 ) ) ( not ( = ?auto_429596 ?auto_429598 ) ) ( not ( = ?auto_429596 ?auto_429599 ) ) ( not ( = ?auto_429596 ?auto_429600 ) ) ( not ( = ?auto_429597 ?auto_429598 ) ) ( not ( = ?auto_429597 ?auto_429599 ) ) ( not ( = ?auto_429597 ?auto_429600 ) ) ( not ( = ?auto_429598 ?auto_429599 ) ) ( not ( = ?auto_429598 ?auto_429600 ) ) ( not ( = ?auto_429599 ?auto_429600 ) ) ( ON ?auto_429598 ?auto_429599 ) ( ON ?auto_429597 ?auto_429598 ) ( ON ?auto_429596 ?auto_429597 ) ( ON ?auto_429595 ?auto_429596 ) ( ON ?auto_429594 ?auto_429595 ) ( ON ?auto_429593 ?auto_429594 ) ( CLEAR ?auto_429591 ) ( ON ?auto_429592 ?auto_429593 ) ( CLEAR ?auto_429592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_429591 ?auto_429592 )
      ( MAKE-9PILE ?auto_429591 ?auto_429592 ?auto_429593 ?auto_429594 ?auto_429595 ?auto_429596 ?auto_429597 ?auto_429598 ?auto_429599 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_429629 - BLOCK
      ?auto_429630 - BLOCK
      ?auto_429631 - BLOCK
      ?auto_429632 - BLOCK
      ?auto_429633 - BLOCK
      ?auto_429634 - BLOCK
      ?auto_429635 - BLOCK
      ?auto_429636 - BLOCK
      ?auto_429637 - BLOCK
    )
    :vars
    (
      ?auto_429638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429637 ?auto_429638 ) ( not ( = ?auto_429629 ?auto_429630 ) ) ( not ( = ?auto_429629 ?auto_429631 ) ) ( not ( = ?auto_429629 ?auto_429632 ) ) ( not ( = ?auto_429629 ?auto_429633 ) ) ( not ( = ?auto_429629 ?auto_429634 ) ) ( not ( = ?auto_429629 ?auto_429635 ) ) ( not ( = ?auto_429629 ?auto_429636 ) ) ( not ( = ?auto_429629 ?auto_429637 ) ) ( not ( = ?auto_429629 ?auto_429638 ) ) ( not ( = ?auto_429630 ?auto_429631 ) ) ( not ( = ?auto_429630 ?auto_429632 ) ) ( not ( = ?auto_429630 ?auto_429633 ) ) ( not ( = ?auto_429630 ?auto_429634 ) ) ( not ( = ?auto_429630 ?auto_429635 ) ) ( not ( = ?auto_429630 ?auto_429636 ) ) ( not ( = ?auto_429630 ?auto_429637 ) ) ( not ( = ?auto_429630 ?auto_429638 ) ) ( not ( = ?auto_429631 ?auto_429632 ) ) ( not ( = ?auto_429631 ?auto_429633 ) ) ( not ( = ?auto_429631 ?auto_429634 ) ) ( not ( = ?auto_429631 ?auto_429635 ) ) ( not ( = ?auto_429631 ?auto_429636 ) ) ( not ( = ?auto_429631 ?auto_429637 ) ) ( not ( = ?auto_429631 ?auto_429638 ) ) ( not ( = ?auto_429632 ?auto_429633 ) ) ( not ( = ?auto_429632 ?auto_429634 ) ) ( not ( = ?auto_429632 ?auto_429635 ) ) ( not ( = ?auto_429632 ?auto_429636 ) ) ( not ( = ?auto_429632 ?auto_429637 ) ) ( not ( = ?auto_429632 ?auto_429638 ) ) ( not ( = ?auto_429633 ?auto_429634 ) ) ( not ( = ?auto_429633 ?auto_429635 ) ) ( not ( = ?auto_429633 ?auto_429636 ) ) ( not ( = ?auto_429633 ?auto_429637 ) ) ( not ( = ?auto_429633 ?auto_429638 ) ) ( not ( = ?auto_429634 ?auto_429635 ) ) ( not ( = ?auto_429634 ?auto_429636 ) ) ( not ( = ?auto_429634 ?auto_429637 ) ) ( not ( = ?auto_429634 ?auto_429638 ) ) ( not ( = ?auto_429635 ?auto_429636 ) ) ( not ( = ?auto_429635 ?auto_429637 ) ) ( not ( = ?auto_429635 ?auto_429638 ) ) ( not ( = ?auto_429636 ?auto_429637 ) ) ( not ( = ?auto_429636 ?auto_429638 ) ) ( not ( = ?auto_429637 ?auto_429638 ) ) ( ON ?auto_429636 ?auto_429637 ) ( ON ?auto_429635 ?auto_429636 ) ( ON ?auto_429634 ?auto_429635 ) ( ON ?auto_429633 ?auto_429634 ) ( ON ?auto_429632 ?auto_429633 ) ( ON ?auto_429631 ?auto_429632 ) ( ON ?auto_429630 ?auto_429631 ) ( ON ?auto_429629 ?auto_429630 ) ( CLEAR ?auto_429629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_429629 )
      ( MAKE-9PILE ?auto_429629 ?auto_429630 ?auto_429631 ?auto_429632 ?auto_429633 ?auto_429634 ?auto_429635 ?auto_429636 ?auto_429637 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429668 - BLOCK
      ?auto_429669 - BLOCK
      ?auto_429670 - BLOCK
      ?auto_429671 - BLOCK
      ?auto_429672 - BLOCK
      ?auto_429673 - BLOCK
      ?auto_429674 - BLOCK
      ?auto_429675 - BLOCK
      ?auto_429676 - BLOCK
      ?auto_429677 - BLOCK
    )
    :vars
    (
      ?auto_429678 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_429676 ) ( ON ?auto_429677 ?auto_429678 ) ( CLEAR ?auto_429677 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_429668 ) ( ON ?auto_429669 ?auto_429668 ) ( ON ?auto_429670 ?auto_429669 ) ( ON ?auto_429671 ?auto_429670 ) ( ON ?auto_429672 ?auto_429671 ) ( ON ?auto_429673 ?auto_429672 ) ( ON ?auto_429674 ?auto_429673 ) ( ON ?auto_429675 ?auto_429674 ) ( ON ?auto_429676 ?auto_429675 ) ( not ( = ?auto_429668 ?auto_429669 ) ) ( not ( = ?auto_429668 ?auto_429670 ) ) ( not ( = ?auto_429668 ?auto_429671 ) ) ( not ( = ?auto_429668 ?auto_429672 ) ) ( not ( = ?auto_429668 ?auto_429673 ) ) ( not ( = ?auto_429668 ?auto_429674 ) ) ( not ( = ?auto_429668 ?auto_429675 ) ) ( not ( = ?auto_429668 ?auto_429676 ) ) ( not ( = ?auto_429668 ?auto_429677 ) ) ( not ( = ?auto_429668 ?auto_429678 ) ) ( not ( = ?auto_429669 ?auto_429670 ) ) ( not ( = ?auto_429669 ?auto_429671 ) ) ( not ( = ?auto_429669 ?auto_429672 ) ) ( not ( = ?auto_429669 ?auto_429673 ) ) ( not ( = ?auto_429669 ?auto_429674 ) ) ( not ( = ?auto_429669 ?auto_429675 ) ) ( not ( = ?auto_429669 ?auto_429676 ) ) ( not ( = ?auto_429669 ?auto_429677 ) ) ( not ( = ?auto_429669 ?auto_429678 ) ) ( not ( = ?auto_429670 ?auto_429671 ) ) ( not ( = ?auto_429670 ?auto_429672 ) ) ( not ( = ?auto_429670 ?auto_429673 ) ) ( not ( = ?auto_429670 ?auto_429674 ) ) ( not ( = ?auto_429670 ?auto_429675 ) ) ( not ( = ?auto_429670 ?auto_429676 ) ) ( not ( = ?auto_429670 ?auto_429677 ) ) ( not ( = ?auto_429670 ?auto_429678 ) ) ( not ( = ?auto_429671 ?auto_429672 ) ) ( not ( = ?auto_429671 ?auto_429673 ) ) ( not ( = ?auto_429671 ?auto_429674 ) ) ( not ( = ?auto_429671 ?auto_429675 ) ) ( not ( = ?auto_429671 ?auto_429676 ) ) ( not ( = ?auto_429671 ?auto_429677 ) ) ( not ( = ?auto_429671 ?auto_429678 ) ) ( not ( = ?auto_429672 ?auto_429673 ) ) ( not ( = ?auto_429672 ?auto_429674 ) ) ( not ( = ?auto_429672 ?auto_429675 ) ) ( not ( = ?auto_429672 ?auto_429676 ) ) ( not ( = ?auto_429672 ?auto_429677 ) ) ( not ( = ?auto_429672 ?auto_429678 ) ) ( not ( = ?auto_429673 ?auto_429674 ) ) ( not ( = ?auto_429673 ?auto_429675 ) ) ( not ( = ?auto_429673 ?auto_429676 ) ) ( not ( = ?auto_429673 ?auto_429677 ) ) ( not ( = ?auto_429673 ?auto_429678 ) ) ( not ( = ?auto_429674 ?auto_429675 ) ) ( not ( = ?auto_429674 ?auto_429676 ) ) ( not ( = ?auto_429674 ?auto_429677 ) ) ( not ( = ?auto_429674 ?auto_429678 ) ) ( not ( = ?auto_429675 ?auto_429676 ) ) ( not ( = ?auto_429675 ?auto_429677 ) ) ( not ( = ?auto_429675 ?auto_429678 ) ) ( not ( = ?auto_429676 ?auto_429677 ) ) ( not ( = ?auto_429676 ?auto_429678 ) ) ( not ( = ?auto_429677 ?auto_429678 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_429677 ?auto_429678 )
      ( !STACK ?auto_429677 ?auto_429676 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429710 - BLOCK
      ?auto_429711 - BLOCK
      ?auto_429712 - BLOCK
      ?auto_429713 - BLOCK
      ?auto_429714 - BLOCK
      ?auto_429715 - BLOCK
      ?auto_429716 - BLOCK
      ?auto_429717 - BLOCK
      ?auto_429718 - BLOCK
      ?auto_429719 - BLOCK
    )
    :vars
    (
      ?auto_429720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429719 ?auto_429720 ) ( ON-TABLE ?auto_429710 ) ( ON ?auto_429711 ?auto_429710 ) ( ON ?auto_429712 ?auto_429711 ) ( ON ?auto_429713 ?auto_429712 ) ( ON ?auto_429714 ?auto_429713 ) ( ON ?auto_429715 ?auto_429714 ) ( ON ?auto_429716 ?auto_429715 ) ( ON ?auto_429717 ?auto_429716 ) ( not ( = ?auto_429710 ?auto_429711 ) ) ( not ( = ?auto_429710 ?auto_429712 ) ) ( not ( = ?auto_429710 ?auto_429713 ) ) ( not ( = ?auto_429710 ?auto_429714 ) ) ( not ( = ?auto_429710 ?auto_429715 ) ) ( not ( = ?auto_429710 ?auto_429716 ) ) ( not ( = ?auto_429710 ?auto_429717 ) ) ( not ( = ?auto_429710 ?auto_429718 ) ) ( not ( = ?auto_429710 ?auto_429719 ) ) ( not ( = ?auto_429710 ?auto_429720 ) ) ( not ( = ?auto_429711 ?auto_429712 ) ) ( not ( = ?auto_429711 ?auto_429713 ) ) ( not ( = ?auto_429711 ?auto_429714 ) ) ( not ( = ?auto_429711 ?auto_429715 ) ) ( not ( = ?auto_429711 ?auto_429716 ) ) ( not ( = ?auto_429711 ?auto_429717 ) ) ( not ( = ?auto_429711 ?auto_429718 ) ) ( not ( = ?auto_429711 ?auto_429719 ) ) ( not ( = ?auto_429711 ?auto_429720 ) ) ( not ( = ?auto_429712 ?auto_429713 ) ) ( not ( = ?auto_429712 ?auto_429714 ) ) ( not ( = ?auto_429712 ?auto_429715 ) ) ( not ( = ?auto_429712 ?auto_429716 ) ) ( not ( = ?auto_429712 ?auto_429717 ) ) ( not ( = ?auto_429712 ?auto_429718 ) ) ( not ( = ?auto_429712 ?auto_429719 ) ) ( not ( = ?auto_429712 ?auto_429720 ) ) ( not ( = ?auto_429713 ?auto_429714 ) ) ( not ( = ?auto_429713 ?auto_429715 ) ) ( not ( = ?auto_429713 ?auto_429716 ) ) ( not ( = ?auto_429713 ?auto_429717 ) ) ( not ( = ?auto_429713 ?auto_429718 ) ) ( not ( = ?auto_429713 ?auto_429719 ) ) ( not ( = ?auto_429713 ?auto_429720 ) ) ( not ( = ?auto_429714 ?auto_429715 ) ) ( not ( = ?auto_429714 ?auto_429716 ) ) ( not ( = ?auto_429714 ?auto_429717 ) ) ( not ( = ?auto_429714 ?auto_429718 ) ) ( not ( = ?auto_429714 ?auto_429719 ) ) ( not ( = ?auto_429714 ?auto_429720 ) ) ( not ( = ?auto_429715 ?auto_429716 ) ) ( not ( = ?auto_429715 ?auto_429717 ) ) ( not ( = ?auto_429715 ?auto_429718 ) ) ( not ( = ?auto_429715 ?auto_429719 ) ) ( not ( = ?auto_429715 ?auto_429720 ) ) ( not ( = ?auto_429716 ?auto_429717 ) ) ( not ( = ?auto_429716 ?auto_429718 ) ) ( not ( = ?auto_429716 ?auto_429719 ) ) ( not ( = ?auto_429716 ?auto_429720 ) ) ( not ( = ?auto_429717 ?auto_429718 ) ) ( not ( = ?auto_429717 ?auto_429719 ) ) ( not ( = ?auto_429717 ?auto_429720 ) ) ( not ( = ?auto_429718 ?auto_429719 ) ) ( not ( = ?auto_429718 ?auto_429720 ) ) ( not ( = ?auto_429719 ?auto_429720 ) ) ( CLEAR ?auto_429717 ) ( ON ?auto_429718 ?auto_429719 ) ( CLEAR ?auto_429718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_429710 ?auto_429711 ?auto_429712 ?auto_429713 ?auto_429714 ?auto_429715 ?auto_429716 ?auto_429717 ?auto_429718 )
      ( MAKE-10PILE ?auto_429710 ?auto_429711 ?auto_429712 ?auto_429713 ?auto_429714 ?auto_429715 ?auto_429716 ?auto_429717 ?auto_429718 ?auto_429719 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429752 - BLOCK
      ?auto_429753 - BLOCK
      ?auto_429754 - BLOCK
      ?auto_429755 - BLOCK
      ?auto_429756 - BLOCK
      ?auto_429757 - BLOCK
      ?auto_429758 - BLOCK
      ?auto_429759 - BLOCK
      ?auto_429760 - BLOCK
      ?auto_429761 - BLOCK
    )
    :vars
    (
      ?auto_429762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429761 ?auto_429762 ) ( ON-TABLE ?auto_429752 ) ( ON ?auto_429753 ?auto_429752 ) ( ON ?auto_429754 ?auto_429753 ) ( ON ?auto_429755 ?auto_429754 ) ( ON ?auto_429756 ?auto_429755 ) ( ON ?auto_429757 ?auto_429756 ) ( ON ?auto_429758 ?auto_429757 ) ( not ( = ?auto_429752 ?auto_429753 ) ) ( not ( = ?auto_429752 ?auto_429754 ) ) ( not ( = ?auto_429752 ?auto_429755 ) ) ( not ( = ?auto_429752 ?auto_429756 ) ) ( not ( = ?auto_429752 ?auto_429757 ) ) ( not ( = ?auto_429752 ?auto_429758 ) ) ( not ( = ?auto_429752 ?auto_429759 ) ) ( not ( = ?auto_429752 ?auto_429760 ) ) ( not ( = ?auto_429752 ?auto_429761 ) ) ( not ( = ?auto_429752 ?auto_429762 ) ) ( not ( = ?auto_429753 ?auto_429754 ) ) ( not ( = ?auto_429753 ?auto_429755 ) ) ( not ( = ?auto_429753 ?auto_429756 ) ) ( not ( = ?auto_429753 ?auto_429757 ) ) ( not ( = ?auto_429753 ?auto_429758 ) ) ( not ( = ?auto_429753 ?auto_429759 ) ) ( not ( = ?auto_429753 ?auto_429760 ) ) ( not ( = ?auto_429753 ?auto_429761 ) ) ( not ( = ?auto_429753 ?auto_429762 ) ) ( not ( = ?auto_429754 ?auto_429755 ) ) ( not ( = ?auto_429754 ?auto_429756 ) ) ( not ( = ?auto_429754 ?auto_429757 ) ) ( not ( = ?auto_429754 ?auto_429758 ) ) ( not ( = ?auto_429754 ?auto_429759 ) ) ( not ( = ?auto_429754 ?auto_429760 ) ) ( not ( = ?auto_429754 ?auto_429761 ) ) ( not ( = ?auto_429754 ?auto_429762 ) ) ( not ( = ?auto_429755 ?auto_429756 ) ) ( not ( = ?auto_429755 ?auto_429757 ) ) ( not ( = ?auto_429755 ?auto_429758 ) ) ( not ( = ?auto_429755 ?auto_429759 ) ) ( not ( = ?auto_429755 ?auto_429760 ) ) ( not ( = ?auto_429755 ?auto_429761 ) ) ( not ( = ?auto_429755 ?auto_429762 ) ) ( not ( = ?auto_429756 ?auto_429757 ) ) ( not ( = ?auto_429756 ?auto_429758 ) ) ( not ( = ?auto_429756 ?auto_429759 ) ) ( not ( = ?auto_429756 ?auto_429760 ) ) ( not ( = ?auto_429756 ?auto_429761 ) ) ( not ( = ?auto_429756 ?auto_429762 ) ) ( not ( = ?auto_429757 ?auto_429758 ) ) ( not ( = ?auto_429757 ?auto_429759 ) ) ( not ( = ?auto_429757 ?auto_429760 ) ) ( not ( = ?auto_429757 ?auto_429761 ) ) ( not ( = ?auto_429757 ?auto_429762 ) ) ( not ( = ?auto_429758 ?auto_429759 ) ) ( not ( = ?auto_429758 ?auto_429760 ) ) ( not ( = ?auto_429758 ?auto_429761 ) ) ( not ( = ?auto_429758 ?auto_429762 ) ) ( not ( = ?auto_429759 ?auto_429760 ) ) ( not ( = ?auto_429759 ?auto_429761 ) ) ( not ( = ?auto_429759 ?auto_429762 ) ) ( not ( = ?auto_429760 ?auto_429761 ) ) ( not ( = ?auto_429760 ?auto_429762 ) ) ( not ( = ?auto_429761 ?auto_429762 ) ) ( ON ?auto_429760 ?auto_429761 ) ( CLEAR ?auto_429758 ) ( ON ?auto_429759 ?auto_429760 ) ( CLEAR ?auto_429759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_429752 ?auto_429753 ?auto_429754 ?auto_429755 ?auto_429756 ?auto_429757 ?auto_429758 ?auto_429759 )
      ( MAKE-10PILE ?auto_429752 ?auto_429753 ?auto_429754 ?auto_429755 ?auto_429756 ?auto_429757 ?auto_429758 ?auto_429759 ?auto_429760 ?auto_429761 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429794 - BLOCK
      ?auto_429795 - BLOCK
      ?auto_429796 - BLOCK
      ?auto_429797 - BLOCK
      ?auto_429798 - BLOCK
      ?auto_429799 - BLOCK
      ?auto_429800 - BLOCK
      ?auto_429801 - BLOCK
      ?auto_429802 - BLOCK
      ?auto_429803 - BLOCK
    )
    :vars
    (
      ?auto_429804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429803 ?auto_429804 ) ( ON-TABLE ?auto_429794 ) ( ON ?auto_429795 ?auto_429794 ) ( ON ?auto_429796 ?auto_429795 ) ( ON ?auto_429797 ?auto_429796 ) ( ON ?auto_429798 ?auto_429797 ) ( ON ?auto_429799 ?auto_429798 ) ( not ( = ?auto_429794 ?auto_429795 ) ) ( not ( = ?auto_429794 ?auto_429796 ) ) ( not ( = ?auto_429794 ?auto_429797 ) ) ( not ( = ?auto_429794 ?auto_429798 ) ) ( not ( = ?auto_429794 ?auto_429799 ) ) ( not ( = ?auto_429794 ?auto_429800 ) ) ( not ( = ?auto_429794 ?auto_429801 ) ) ( not ( = ?auto_429794 ?auto_429802 ) ) ( not ( = ?auto_429794 ?auto_429803 ) ) ( not ( = ?auto_429794 ?auto_429804 ) ) ( not ( = ?auto_429795 ?auto_429796 ) ) ( not ( = ?auto_429795 ?auto_429797 ) ) ( not ( = ?auto_429795 ?auto_429798 ) ) ( not ( = ?auto_429795 ?auto_429799 ) ) ( not ( = ?auto_429795 ?auto_429800 ) ) ( not ( = ?auto_429795 ?auto_429801 ) ) ( not ( = ?auto_429795 ?auto_429802 ) ) ( not ( = ?auto_429795 ?auto_429803 ) ) ( not ( = ?auto_429795 ?auto_429804 ) ) ( not ( = ?auto_429796 ?auto_429797 ) ) ( not ( = ?auto_429796 ?auto_429798 ) ) ( not ( = ?auto_429796 ?auto_429799 ) ) ( not ( = ?auto_429796 ?auto_429800 ) ) ( not ( = ?auto_429796 ?auto_429801 ) ) ( not ( = ?auto_429796 ?auto_429802 ) ) ( not ( = ?auto_429796 ?auto_429803 ) ) ( not ( = ?auto_429796 ?auto_429804 ) ) ( not ( = ?auto_429797 ?auto_429798 ) ) ( not ( = ?auto_429797 ?auto_429799 ) ) ( not ( = ?auto_429797 ?auto_429800 ) ) ( not ( = ?auto_429797 ?auto_429801 ) ) ( not ( = ?auto_429797 ?auto_429802 ) ) ( not ( = ?auto_429797 ?auto_429803 ) ) ( not ( = ?auto_429797 ?auto_429804 ) ) ( not ( = ?auto_429798 ?auto_429799 ) ) ( not ( = ?auto_429798 ?auto_429800 ) ) ( not ( = ?auto_429798 ?auto_429801 ) ) ( not ( = ?auto_429798 ?auto_429802 ) ) ( not ( = ?auto_429798 ?auto_429803 ) ) ( not ( = ?auto_429798 ?auto_429804 ) ) ( not ( = ?auto_429799 ?auto_429800 ) ) ( not ( = ?auto_429799 ?auto_429801 ) ) ( not ( = ?auto_429799 ?auto_429802 ) ) ( not ( = ?auto_429799 ?auto_429803 ) ) ( not ( = ?auto_429799 ?auto_429804 ) ) ( not ( = ?auto_429800 ?auto_429801 ) ) ( not ( = ?auto_429800 ?auto_429802 ) ) ( not ( = ?auto_429800 ?auto_429803 ) ) ( not ( = ?auto_429800 ?auto_429804 ) ) ( not ( = ?auto_429801 ?auto_429802 ) ) ( not ( = ?auto_429801 ?auto_429803 ) ) ( not ( = ?auto_429801 ?auto_429804 ) ) ( not ( = ?auto_429802 ?auto_429803 ) ) ( not ( = ?auto_429802 ?auto_429804 ) ) ( not ( = ?auto_429803 ?auto_429804 ) ) ( ON ?auto_429802 ?auto_429803 ) ( ON ?auto_429801 ?auto_429802 ) ( CLEAR ?auto_429799 ) ( ON ?auto_429800 ?auto_429801 ) ( CLEAR ?auto_429800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_429794 ?auto_429795 ?auto_429796 ?auto_429797 ?auto_429798 ?auto_429799 ?auto_429800 )
      ( MAKE-10PILE ?auto_429794 ?auto_429795 ?auto_429796 ?auto_429797 ?auto_429798 ?auto_429799 ?auto_429800 ?auto_429801 ?auto_429802 ?auto_429803 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429836 - BLOCK
      ?auto_429837 - BLOCK
      ?auto_429838 - BLOCK
      ?auto_429839 - BLOCK
      ?auto_429840 - BLOCK
      ?auto_429841 - BLOCK
      ?auto_429842 - BLOCK
      ?auto_429843 - BLOCK
      ?auto_429844 - BLOCK
      ?auto_429845 - BLOCK
    )
    :vars
    (
      ?auto_429846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429845 ?auto_429846 ) ( ON-TABLE ?auto_429836 ) ( ON ?auto_429837 ?auto_429836 ) ( ON ?auto_429838 ?auto_429837 ) ( ON ?auto_429839 ?auto_429838 ) ( ON ?auto_429840 ?auto_429839 ) ( not ( = ?auto_429836 ?auto_429837 ) ) ( not ( = ?auto_429836 ?auto_429838 ) ) ( not ( = ?auto_429836 ?auto_429839 ) ) ( not ( = ?auto_429836 ?auto_429840 ) ) ( not ( = ?auto_429836 ?auto_429841 ) ) ( not ( = ?auto_429836 ?auto_429842 ) ) ( not ( = ?auto_429836 ?auto_429843 ) ) ( not ( = ?auto_429836 ?auto_429844 ) ) ( not ( = ?auto_429836 ?auto_429845 ) ) ( not ( = ?auto_429836 ?auto_429846 ) ) ( not ( = ?auto_429837 ?auto_429838 ) ) ( not ( = ?auto_429837 ?auto_429839 ) ) ( not ( = ?auto_429837 ?auto_429840 ) ) ( not ( = ?auto_429837 ?auto_429841 ) ) ( not ( = ?auto_429837 ?auto_429842 ) ) ( not ( = ?auto_429837 ?auto_429843 ) ) ( not ( = ?auto_429837 ?auto_429844 ) ) ( not ( = ?auto_429837 ?auto_429845 ) ) ( not ( = ?auto_429837 ?auto_429846 ) ) ( not ( = ?auto_429838 ?auto_429839 ) ) ( not ( = ?auto_429838 ?auto_429840 ) ) ( not ( = ?auto_429838 ?auto_429841 ) ) ( not ( = ?auto_429838 ?auto_429842 ) ) ( not ( = ?auto_429838 ?auto_429843 ) ) ( not ( = ?auto_429838 ?auto_429844 ) ) ( not ( = ?auto_429838 ?auto_429845 ) ) ( not ( = ?auto_429838 ?auto_429846 ) ) ( not ( = ?auto_429839 ?auto_429840 ) ) ( not ( = ?auto_429839 ?auto_429841 ) ) ( not ( = ?auto_429839 ?auto_429842 ) ) ( not ( = ?auto_429839 ?auto_429843 ) ) ( not ( = ?auto_429839 ?auto_429844 ) ) ( not ( = ?auto_429839 ?auto_429845 ) ) ( not ( = ?auto_429839 ?auto_429846 ) ) ( not ( = ?auto_429840 ?auto_429841 ) ) ( not ( = ?auto_429840 ?auto_429842 ) ) ( not ( = ?auto_429840 ?auto_429843 ) ) ( not ( = ?auto_429840 ?auto_429844 ) ) ( not ( = ?auto_429840 ?auto_429845 ) ) ( not ( = ?auto_429840 ?auto_429846 ) ) ( not ( = ?auto_429841 ?auto_429842 ) ) ( not ( = ?auto_429841 ?auto_429843 ) ) ( not ( = ?auto_429841 ?auto_429844 ) ) ( not ( = ?auto_429841 ?auto_429845 ) ) ( not ( = ?auto_429841 ?auto_429846 ) ) ( not ( = ?auto_429842 ?auto_429843 ) ) ( not ( = ?auto_429842 ?auto_429844 ) ) ( not ( = ?auto_429842 ?auto_429845 ) ) ( not ( = ?auto_429842 ?auto_429846 ) ) ( not ( = ?auto_429843 ?auto_429844 ) ) ( not ( = ?auto_429843 ?auto_429845 ) ) ( not ( = ?auto_429843 ?auto_429846 ) ) ( not ( = ?auto_429844 ?auto_429845 ) ) ( not ( = ?auto_429844 ?auto_429846 ) ) ( not ( = ?auto_429845 ?auto_429846 ) ) ( ON ?auto_429844 ?auto_429845 ) ( ON ?auto_429843 ?auto_429844 ) ( ON ?auto_429842 ?auto_429843 ) ( CLEAR ?auto_429840 ) ( ON ?auto_429841 ?auto_429842 ) ( CLEAR ?auto_429841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_429836 ?auto_429837 ?auto_429838 ?auto_429839 ?auto_429840 ?auto_429841 )
      ( MAKE-10PILE ?auto_429836 ?auto_429837 ?auto_429838 ?auto_429839 ?auto_429840 ?auto_429841 ?auto_429842 ?auto_429843 ?auto_429844 ?auto_429845 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429878 - BLOCK
      ?auto_429879 - BLOCK
      ?auto_429880 - BLOCK
      ?auto_429881 - BLOCK
      ?auto_429882 - BLOCK
      ?auto_429883 - BLOCK
      ?auto_429884 - BLOCK
      ?auto_429885 - BLOCK
      ?auto_429886 - BLOCK
      ?auto_429887 - BLOCK
    )
    :vars
    (
      ?auto_429888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429887 ?auto_429888 ) ( ON-TABLE ?auto_429878 ) ( ON ?auto_429879 ?auto_429878 ) ( ON ?auto_429880 ?auto_429879 ) ( ON ?auto_429881 ?auto_429880 ) ( not ( = ?auto_429878 ?auto_429879 ) ) ( not ( = ?auto_429878 ?auto_429880 ) ) ( not ( = ?auto_429878 ?auto_429881 ) ) ( not ( = ?auto_429878 ?auto_429882 ) ) ( not ( = ?auto_429878 ?auto_429883 ) ) ( not ( = ?auto_429878 ?auto_429884 ) ) ( not ( = ?auto_429878 ?auto_429885 ) ) ( not ( = ?auto_429878 ?auto_429886 ) ) ( not ( = ?auto_429878 ?auto_429887 ) ) ( not ( = ?auto_429878 ?auto_429888 ) ) ( not ( = ?auto_429879 ?auto_429880 ) ) ( not ( = ?auto_429879 ?auto_429881 ) ) ( not ( = ?auto_429879 ?auto_429882 ) ) ( not ( = ?auto_429879 ?auto_429883 ) ) ( not ( = ?auto_429879 ?auto_429884 ) ) ( not ( = ?auto_429879 ?auto_429885 ) ) ( not ( = ?auto_429879 ?auto_429886 ) ) ( not ( = ?auto_429879 ?auto_429887 ) ) ( not ( = ?auto_429879 ?auto_429888 ) ) ( not ( = ?auto_429880 ?auto_429881 ) ) ( not ( = ?auto_429880 ?auto_429882 ) ) ( not ( = ?auto_429880 ?auto_429883 ) ) ( not ( = ?auto_429880 ?auto_429884 ) ) ( not ( = ?auto_429880 ?auto_429885 ) ) ( not ( = ?auto_429880 ?auto_429886 ) ) ( not ( = ?auto_429880 ?auto_429887 ) ) ( not ( = ?auto_429880 ?auto_429888 ) ) ( not ( = ?auto_429881 ?auto_429882 ) ) ( not ( = ?auto_429881 ?auto_429883 ) ) ( not ( = ?auto_429881 ?auto_429884 ) ) ( not ( = ?auto_429881 ?auto_429885 ) ) ( not ( = ?auto_429881 ?auto_429886 ) ) ( not ( = ?auto_429881 ?auto_429887 ) ) ( not ( = ?auto_429881 ?auto_429888 ) ) ( not ( = ?auto_429882 ?auto_429883 ) ) ( not ( = ?auto_429882 ?auto_429884 ) ) ( not ( = ?auto_429882 ?auto_429885 ) ) ( not ( = ?auto_429882 ?auto_429886 ) ) ( not ( = ?auto_429882 ?auto_429887 ) ) ( not ( = ?auto_429882 ?auto_429888 ) ) ( not ( = ?auto_429883 ?auto_429884 ) ) ( not ( = ?auto_429883 ?auto_429885 ) ) ( not ( = ?auto_429883 ?auto_429886 ) ) ( not ( = ?auto_429883 ?auto_429887 ) ) ( not ( = ?auto_429883 ?auto_429888 ) ) ( not ( = ?auto_429884 ?auto_429885 ) ) ( not ( = ?auto_429884 ?auto_429886 ) ) ( not ( = ?auto_429884 ?auto_429887 ) ) ( not ( = ?auto_429884 ?auto_429888 ) ) ( not ( = ?auto_429885 ?auto_429886 ) ) ( not ( = ?auto_429885 ?auto_429887 ) ) ( not ( = ?auto_429885 ?auto_429888 ) ) ( not ( = ?auto_429886 ?auto_429887 ) ) ( not ( = ?auto_429886 ?auto_429888 ) ) ( not ( = ?auto_429887 ?auto_429888 ) ) ( ON ?auto_429886 ?auto_429887 ) ( ON ?auto_429885 ?auto_429886 ) ( ON ?auto_429884 ?auto_429885 ) ( ON ?auto_429883 ?auto_429884 ) ( CLEAR ?auto_429881 ) ( ON ?auto_429882 ?auto_429883 ) ( CLEAR ?auto_429882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_429878 ?auto_429879 ?auto_429880 ?auto_429881 ?auto_429882 )
      ( MAKE-10PILE ?auto_429878 ?auto_429879 ?auto_429880 ?auto_429881 ?auto_429882 ?auto_429883 ?auto_429884 ?auto_429885 ?auto_429886 ?auto_429887 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429920 - BLOCK
      ?auto_429921 - BLOCK
      ?auto_429922 - BLOCK
      ?auto_429923 - BLOCK
      ?auto_429924 - BLOCK
      ?auto_429925 - BLOCK
      ?auto_429926 - BLOCK
      ?auto_429927 - BLOCK
      ?auto_429928 - BLOCK
      ?auto_429929 - BLOCK
    )
    :vars
    (
      ?auto_429930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429929 ?auto_429930 ) ( ON-TABLE ?auto_429920 ) ( ON ?auto_429921 ?auto_429920 ) ( ON ?auto_429922 ?auto_429921 ) ( not ( = ?auto_429920 ?auto_429921 ) ) ( not ( = ?auto_429920 ?auto_429922 ) ) ( not ( = ?auto_429920 ?auto_429923 ) ) ( not ( = ?auto_429920 ?auto_429924 ) ) ( not ( = ?auto_429920 ?auto_429925 ) ) ( not ( = ?auto_429920 ?auto_429926 ) ) ( not ( = ?auto_429920 ?auto_429927 ) ) ( not ( = ?auto_429920 ?auto_429928 ) ) ( not ( = ?auto_429920 ?auto_429929 ) ) ( not ( = ?auto_429920 ?auto_429930 ) ) ( not ( = ?auto_429921 ?auto_429922 ) ) ( not ( = ?auto_429921 ?auto_429923 ) ) ( not ( = ?auto_429921 ?auto_429924 ) ) ( not ( = ?auto_429921 ?auto_429925 ) ) ( not ( = ?auto_429921 ?auto_429926 ) ) ( not ( = ?auto_429921 ?auto_429927 ) ) ( not ( = ?auto_429921 ?auto_429928 ) ) ( not ( = ?auto_429921 ?auto_429929 ) ) ( not ( = ?auto_429921 ?auto_429930 ) ) ( not ( = ?auto_429922 ?auto_429923 ) ) ( not ( = ?auto_429922 ?auto_429924 ) ) ( not ( = ?auto_429922 ?auto_429925 ) ) ( not ( = ?auto_429922 ?auto_429926 ) ) ( not ( = ?auto_429922 ?auto_429927 ) ) ( not ( = ?auto_429922 ?auto_429928 ) ) ( not ( = ?auto_429922 ?auto_429929 ) ) ( not ( = ?auto_429922 ?auto_429930 ) ) ( not ( = ?auto_429923 ?auto_429924 ) ) ( not ( = ?auto_429923 ?auto_429925 ) ) ( not ( = ?auto_429923 ?auto_429926 ) ) ( not ( = ?auto_429923 ?auto_429927 ) ) ( not ( = ?auto_429923 ?auto_429928 ) ) ( not ( = ?auto_429923 ?auto_429929 ) ) ( not ( = ?auto_429923 ?auto_429930 ) ) ( not ( = ?auto_429924 ?auto_429925 ) ) ( not ( = ?auto_429924 ?auto_429926 ) ) ( not ( = ?auto_429924 ?auto_429927 ) ) ( not ( = ?auto_429924 ?auto_429928 ) ) ( not ( = ?auto_429924 ?auto_429929 ) ) ( not ( = ?auto_429924 ?auto_429930 ) ) ( not ( = ?auto_429925 ?auto_429926 ) ) ( not ( = ?auto_429925 ?auto_429927 ) ) ( not ( = ?auto_429925 ?auto_429928 ) ) ( not ( = ?auto_429925 ?auto_429929 ) ) ( not ( = ?auto_429925 ?auto_429930 ) ) ( not ( = ?auto_429926 ?auto_429927 ) ) ( not ( = ?auto_429926 ?auto_429928 ) ) ( not ( = ?auto_429926 ?auto_429929 ) ) ( not ( = ?auto_429926 ?auto_429930 ) ) ( not ( = ?auto_429927 ?auto_429928 ) ) ( not ( = ?auto_429927 ?auto_429929 ) ) ( not ( = ?auto_429927 ?auto_429930 ) ) ( not ( = ?auto_429928 ?auto_429929 ) ) ( not ( = ?auto_429928 ?auto_429930 ) ) ( not ( = ?auto_429929 ?auto_429930 ) ) ( ON ?auto_429928 ?auto_429929 ) ( ON ?auto_429927 ?auto_429928 ) ( ON ?auto_429926 ?auto_429927 ) ( ON ?auto_429925 ?auto_429926 ) ( ON ?auto_429924 ?auto_429925 ) ( CLEAR ?auto_429922 ) ( ON ?auto_429923 ?auto_429924 ) ( CLEAR ?auto_429923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_429920 ?auto_429921 ?auto_429922 ?auto_429923 )
      ( MAKE-10PILE ?auto_429920 ?auto_429921 ?auto_429922 ?auto_429923 ?auto_429924 ?auto_429925 ?auto_429926 ?auto_429927 ?auto_429928 ?auto_429929 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_429962 - BLOCK
      ?auto_429963 - BLOCK
      ?auto_429964 - BLOCK
      ?auto_429965 - BLOCK
      ?auto_429966 - BLOCK
      ?auto_429967 - BLOCK
      ?auto_429968 - BLOCK
      ?auto_429969 - BLOCK
      ?auto_429970 - BLOCK
      ?auto_429971 - BLOCK
    )
    :vars
    (
      ?auto_429972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_429971 ?auto_429972 ) ( ON-TABLE ?auto_429962 ) ( ON ?auto_429963 ?auto_429962 ) ( not ( = ?auto_429962 ?auto_429963 ) ) ( not ( = ?auto_429962 ?auto_429964 ) ) ( not ( = ?auto_429962 ?auto_429965 ) ) ( not ( = ?auto_429962 ?auto_429966 ) ) ( not ( = ?auto_429962 ?auto_429967 ) ) ( not ( = ?auto_429962 ?auto_429968 ) ) ( not ( = ?auto_429962 ?auto_429969 ) ) ( not ( = ?auto_429962 ?auto_429970 ) ) ( not ( = ?auto_429962 ?auto_429971 ) ) ( not ( = ?auto_429962 ?auto_429972 ) ) ( not ( = ?auto_429963 ?auto_429964 ) ) ( not ( = ?auto_429963 ?auto_429965 ) ) ( not ( = ?auto_429963 ?auto_429966 ) ) ( not ( = ?auto_429963 ?auto_429967 ) ) ( not ( = ?auto_429963 ?auto_429968 ) ) ( not ( = ?auto_429963 ?auto_429969 ) ) ( not ( = ?auto_429963 ?auto_429970 ) ) ( not ( = ?auto_429963 ?auto_429971 ) ) ( not ( = ?auto_429963 ?auto_429972 ) ) ( not ( = ?auto_429964 ?auto_429965 ) ) ( not ( = ?auto_429964 ?auto_429966 ) ) ( not ( = ?auto_429964 ?auto_429967 ) ) ( not ( = ?auto_429964 ?auto_429968 ) ) ( not ( = ?auto_429964 ?auto_429969 ) ) ( not ( = ?auto_429964 ?auto_429970 ) ) ( not ( = ?auto_429964 ?auto_429971 ) ) ( not ( = ?auto_429964 ?auto_429972 ) ) ( not ( = ?auto_429965 ?auto_429966 ) ) ( not ( = ?auto_429965 ?auto_429967 ) ) ( not ( = ?auto_429965 ?auto_429968 ) ) ( not ( = ?auto_429965 ?auto_429969 ) ) ( not ( = ?auto_429965 ?auto_429970 ) ) ( not ( = ?auto_429965 ?auto_429971 ) ) ( not ( = ?auto_429965 ?auto_429972 ) ) ( not ( = ?auto_429966 ?auto_429967 ) ) ( not ( = ?auto_429966 ?auto_429968 ) ) ( not ( = ?auto_429966 ?auto_429969 ) ) ( not ( = ?auto_429966 ?auto_429970 ) ) ( not ( = ?auto_429966 ?auto_429971 ) ) ( not ( = ?auto_429966 ?auto_429972 ) ) ( not ( = ?auto_429967 ?auto_429968 ) ) ( not ( = ?auto_429967 ?auto_429969 ) ) ( not ( = ?auto_429967 ?auto_429970 ) ) ( not ( = ?auto_429967 ?auto_429971 ) ) ( not ( = ?auto_429967 ?auto_429972 ) ) ( not ( = ?auto_429968 ?auto_429969 ) ) ( not ( = ?auto_429968 ?auto_429970 ) ) ( not ( = ?auto_429968 ?auto_429971 ) ) ( not ( = ?auto_429968 ?auto_429972 ) ) ( not ( = ?auto_429969 ?auto_429970 ) ) ( not ( = ?auto_429969 ?auto_429971 ) ) ( not ( = ?auto_429969 ?auto_429972 ) ) ( not ( = ?auto_429970 ?auto_429971 ) ) ( not ( = ?auto_429970 ?auto_429972 ) ) ( not ( = ?auto_429971 ?auto_429972 ) ) ( ON ?auto_429970 ?auto_429971 ) ( ON ?auto_429969 ?auto_429970 ) ( ON ?auto_429968 ?auto_429969 ) ( ON ?auto_429967 ?auto_429968 ) ( ON ?auto_429966 ?auto_429967 ) ( ON ?auto_429965 ?auto_429966 ) ( CLEAR ?auto_429963 ) ( ON ?auto_429964 ?auto_429965 ) ( CLEAR ?auto_429964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_429962 ?auto_429963 ?auto_429964 )
      ( MAKE-10PILE ?auto_429962 ?auto_429963 ?auto_429964 ?auto_429965 ?auto_429966 ?auto_429967 ?auto_429968 ?auto_429969 ?auto_429970 ?auto_429971 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_430004 - BLOCK
      ?auto_430005 - BLOCK
      ?auto_430006 - BLOCK
      ?auto_430007 - BLOCK
      ?auto_430008 - BLOCK
      ?auto_430009 - BLOCK
      ?auto_430010 - BLOCK
      ?auto_430011 - BLOCK
      ?auto_430012 - BLOCK
      ?auto_430013 - BLOCK
    )
    :vars
    (
      ?auto_430014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430013 ?auto_430014 ) ( ON-TABLE ?auto_430004 ) ( not ( = ?auto_430004 ?auto_430005 ) ) ( not ( = ?auto_430004 ?auto_430006 ) ) ( not ( = ?auto_430004 ?auto_430007 ) ) ( not ( = ?auto_430004 ?auto_430008 ) ) ( not ( = ?auto_430004 ?auto_430009 ) ) ( not ( = ?auto_430004 ?auto_430010 ) ) ( not ( = ?auto_430004 ?auto_430011 ) ) ( not ( = ?auto_430004 ?auto_430012 ) ) ( not ( = ?auto_430004 ?auto_430013 ) ) ( not ( = ?auto_430004 ?auto_430014 ) ) ( not ( = ?auto_430005 ?auto_430006 ) ) ( not ( = ?auto_430005 ?auto_430007 ) ) ( not ( = ?auto_430005 ?auto_430008 ) ) ( not ( = ?auto_430005 ?auto_430009 ) ) ( not ( = ?auto_430005 ?auto_430010 ) ) ( not ( = ?auto_430005 ?auto_430011 ) ) ( not ( = ?auto_430005 ?auto_430012 ) ) ( not ( = ?auto_430005 ?auto_430013 ) ) ( not ( = ?auto_430005 ?auto_430014 ) ) ( not ( = ?auto_430006 ?auto_430007 ) ) ( not ( = ?auto_430006 ?auto_430008 ) ) ( not ( = ?auto_430006 ?auto_430009 ) ) ( not ( = ?auto_430006 ?auto_430010 ) ) ( not ( = ?auto_430006 ?auto_430011 ) ) ( not ( = ?auto_430006 ?auto_430012 ) ) ( not ( = ?auto_430006 ?auto_430013 ) ) ( not ( = ?auto_430006 ?auto_430014 ) ) ( not ( = ?auto_430007 ?auto_430008 ) ) ( not ( = ?auto_430007 ?auto_430009 ) ) ( not ( = ?auto_430007 ?auto_430010 ) ) ( not ( = ?auto_430007 ?auto_430011 ) ) ( not ( = ?auto_430007 ?auto_430012 ) ) ( not ( = ?auto_430007 ?auto_430013 ) ) ( not ( = ?auto_430007 ?auto_430014 ) ) ( not ( = ?auto_430008 ?auto_430009 ) ) ( not ( = ?auto_430008 ?auto_430010 ) ) ( not ( = ?auto_430008 ?auto_430011 ) ) ( not ( = ?auto_430008 ?auto_430012 ) ) ( not ( = ?auto_430008 ?auto_430013 ) ) ( not ( = ?auto_430008 ?auto_430014 ) ) ( not ( = ?auto_430009 ?auto_430010 ) ) ( not ( = ?auto_430009 ?auto_430011 ) ) ( not ( = ?auto_430009 ?auto_430012 ) ) ( not ( = ?auto_430009 ?auto_430013 ) ) ( not ( = ?auto_430009 ?auto_430014 ) ) ( not ( = ?auto_430010 ?auto_430011 ) ) ( not ( = ?auto_430010 ?auto_430012 ) ) ( not ( = ?auto_430010 ?auto_430013 ) ) ( not ( = ?auto_430010 ?auto_430014 ) ) ( not ( = ?auto_430011 ?auto_430012 ) ) ( not ( = ?auto_430011 ?auto_430013 ) ) ( not ( = ?auto_430011 ?auto_430014 ) ) ( not ( = ?auto_430012 ?auto_430013 ) ) ( not ( = ?auto_430012 ?auto_430014 ) ) ( not ( = ?auto_430013 ?auto_430014 ) ) ( ON ?auto_430012 ?auto_430013 ) ( ON ?auto_430011 ?auto_430012 ) ( ON ?auto_430010 ?auto_430011 ) ( ON ?auto_430009 ?auto_430010 ) ( ON ?auto_430008 ?auto_430009 ) ( ON ?auto_430007 ?auto_430008 ) ( ON ?auto_430006 ?auto_430007 ) ( CLEAR ?auto_430004 ) ( ON ?auto_430005 ?auto_430006 ) ( CLEAR ?auto_430005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_430004 ?auto_430005 )
      ( MAKE-10PILE ?auto_430004 ?auto_430005 ?auto_430006 ?auto_430007 ?auto_430008 ?auto_430009 ?auto_430010 ?auto_430011 ?auto_430012 ?auto_430013 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_430046 - BLOCK
      ?auto_430047 - BLOCK
      ?auto_430048 - BLOCK
      ?auto_430049 - BLOCK
      ?auto_430050 - BLOCK
      ?auto_430051 - BLOCK
      ?auto_430052 - BLOCK
      ?auto_430053 - BLOCK
      ?auto_430054 - BLOCK
      ?auto_430055 - BLOCK
    )
    :vars
    (
      ?auto_430056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430055 ?auto_430056 ) ( not ( = ?auto_430046 ?auto_430047 ) ) ( not ( = ?auto_430046 ?auto_430048 ) ) ( not ( = ?auto_430046 ?auto_430049 ) ) ( not ( = ?auto_430046 ?auto_430050 ) ) ( not ( = ?auto_430046 ?auto_430051 ) ) ( not ( = ?auto_430046 ?auto_430052 ) ) ( not ( = ?auto_430046 ?auto_430053 ) ) ( not ( = ?auto_430046 ?auto_430054 ) ) ( not ( = ?auto_430046 ?auto_430055 ) ) ( not ( = ?auto_430046 ?auto_430056 ) ) ( not ( = ?auto_430047 ?auto_430048 ) ) ( not ( = ?auto_430047 ?auto_430049 ) ) ( not ( = ?auto_430047 ?auto_430050 ) ) ( not ( = ?auto_430047 ?auto_430051 ) ) ( not ( = ?auto_430047 ?auto_430052 ) ) ( not ( = ?auto_430047 ?auto_430053 ) ) ( not ( = ?auto_430047 ?auto_430054 ) ) ( not ( = ?auto_430047 ?auto_430055 ) ) ( not ( = ?auto_430047 ?auto_430056 ) ) ( not ( = ?auto_430048 ?auto_430049 ) ) ( not ( = ?auto_430048 ?auto_430050 ) ) ( not ( = ?auto_430048 ?auto_430051 ) ) ( not ( = ?auto_430048 ?auto_430052 ) ) ( not ( = ?auto_430048 ?auto_430053 ) ) ( not ( = ?auto_430048 ?auto_430054 ) ) ( not ( = ?auto_430048 ?auto_430055 ) ) ( not ( = ?auto_430048 ?auto_430056 ) ) ( not ( = ?auto_430049 ?auto_430050 ) ) ( not ( = ?auto_430049 ?auto_430051 ) ) ( not ( = ?auto_430049 ?auto_430052 ) ) ( not ( = ?auto_430049 ?auto_430053 ) ) ( not ( = ?auto_430049 ?auto_430054 ) ) ( not ( = ?auto_430049 ?auto_430055 ) ) ( not ( = ?auto_430049 ?auto_430056 ) ) ( not ( = ?auto_430050 ?auto_430051 ) ) ( not ( = ?auto_430050 ?auto_430052 ) ) ( not ( = ?auto_430050 ?auto_430053 ) ) ( not ( = ?auto_430050 ?auto_430054 ) ) ( not ( = ?auto_430050 ?auto_430055 ) ) ( not ( = ?auto_430050 ?auto_430056 ) ) ( not ( = ?auto_430051 ?auto_430052 ) ) ( not ( = ?auto_430051 ?auto_430053 ) ) ( not ( = ?auto_430051 ?auto_430054 ) ) ( not ( = ?auto_430051 ?auto_430055 ) ) ( not ( = ?auto_430051 ?auto_430056 ) ) ( not ( = ?auto_430052 ?auto_430053 ) ) ( not ( = ?auto_430052 ?auto_430054 ) ) ( not ( = ?auto_430052 ?auto_430055 ) ) ( not ( = ?auto_430052 ?auto_430056 ) ) ( not ( = ?auto_430053 ?auto_430054 ) ) ( not ( = ?auto_430053 ?auto_430055 ) ) ( not ( = ?auto_430053 ?auto_430056 ) ) ( not ( = ?auto_430054 ?auto_430055 ) ) ( not ( = ?auto_430054 ?auto_430056 ) ) ( not ( = ?auto_430055 ?auto_430056 ) ) ( ON ?auto_430054 ?auto_430055 ) ( ON ?auto_430053 ?auto_430054 ) ( ON ?auto_430052 ?auto_430053 ) ( ON ?auto_430051 ?auto_430052 ) ( ON ?auto_430050 ?auto_430051 ) ( ON ?auto_430049 ?auto_430050 ) ( ON ?auto_430048 ?auto_430049 ) ( ON ?auto_430047 ?auto_430048 ) ( ON ?auto_430046 ?auto_430047 ) ( CLEAR ?auto_430046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_430046 )
      ( MAKE-10PILE ?auto_430046 ?auto_430047 ?auto_430048 ?auto_430049 ?auto_430050 ?auto_430051 ?auto_430052 ?auto_430053 ?auto_430054 ?auto_430055 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430089 - BLOCK
      ?auto_430090 - BLOCK
      ?auto_430091 - BLOCK
      ?auto_430092 - BLOCK
      ?auto_430093 - BLOCK
      ?auto_430094 - BLOCK
      ?auto_430095 - BLOCK
      ?auto_430096 - BLOCK
      ?auto_430097 - BLOCK
      ?auto_430098 - BLOCK
      ?auto_430099 - BLOCK
    )
    :vars
    (
      ?auto_430100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_430098 ) ( ON ?auto_430099 ?auto_430100 ) ( CLEAR ?auto_430099 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_430089 ) ( ON ?auto_430090 ?auto_430089 ) ( ON ?auto_430091 ?auto_430090 ) ( ON ?auto_430092 ?auto_430091 ) ( ON ?auto_430093 ?auto_430092 ) ( ON ?auto_430094 ?auto_430093 ) ( ON ?auto_430095 ?auto_430094 ) ( ON ?auto_430096 ?auto_430095 ) ( ON ?auto_430097 ?auto_430096 ) ( ON ?auto_430098 ?auto_430097 ) ( not ( = ?auto_430089 ?auto_430090 ) ) ( not ( = ?auto_430089 ?auto_430091 ) ) ( not ( = ?auto_430089 ?auto_430092 ) ) ( not ( = ?auto_430089 ?auto_430093 ) ) ( not ( = ?auto_430089 ?auto_430094 ) ) ( not ( = ?auto_430089 ?auto_430095 ) ) ( not ( = ?auto_430089 ?auto_430096 ) ) ( not ( = ?auto_430089 ?auto_430097 ) ) ( not ( = ?auto_430089 ?auto_430098 ) ) ( not ( = ?auto_430089 ?auto_430099 ) ) ( not ( = ?auto_430089 ?auto_430100 ) ) ( not ( = ?auto_430090 ?auto_430091 ) ) ( not ( = ?auto_430090 ?auto_430092 ) ) ( not ( = ?auto_430090 ?auto_430093 ) ) ( not ( = ?auto_430090 ?auto_430094 ) ) ( not ( = ?auto_430090 ?auto_430095 ) ) ( not ( = ?auto_430090 ?auto_430096 ) ) ( not ( = ?auto_430090 ?auto_430097 ) ) ( not ( = ?auto_430090 ?auto_430098 ) ) ( not ( = ?auto_430090 ?auto_430099 ) ) ( not ( = ?auto_430090 ?auto_430100 ) ) ( not ( = ?auto_430091 ?auto_430092 ) ) ( not ( = ?auto_430091 ?auto_430093 ) ) ( not ( = ?auto_430091 ?auto_430094 ) ) ( not ( = ?auto_430091 ?auto_430095 ) ) ( not ( = ?auto_430091 ?auto_430096 ) ) ( not ( = ?auto_430091 ?auto_430097 ) ) ( not ( = ?auto_430091 ?auto_430098 ) ) ( not ( = ?auto_430091 ?auto_430099 ) ) ( not ( = ?auto_430091 ?auto_430100 ) ) ( not ( = ?auto_430092 ?auto_430093 ) ) ( not ( = ?auto_430092 ?auto_430094 ) ) ( not ( = ?auto_430092 ?auto_430095 ) ) ( not ( = ?auto_430092 ?auto_430096 ) ) ( not ( = ?auto_430092 ?auto_430097 ) ) ( not ( = ?auto_430092 ?auto_430098 ) ) ( not ( = ?auto_430092 ?auto_430099 ) ) ( not ( = ?auto_430092 ?auto_430100 ) ) ( not ( = ?auto_430093 ?auto_430094 ) ) ( not ( = ?auto_430093 ?auto_430095 ) ) ( not ( = ?auto_430093 ?auto_430096 ) ) ( not ( = ?auto_430093 ?auto_430097 ) ) ( not ( = ?auto_430093 ?auto_430098 ) ) ( not ( = ?auto_430093 ?auto_430099 ) ) ( not ( = ?auto_430093 ?auto_430100 ) ) ( not ( = ?auto_430094 ?auto_430095 ) ) ( not ( = ?auto_430094 ?auto_430096 ) ) ( not ( = ?auto_430094 ?auto_430097 ) ) ( not ( = ?auto_430094 ?auto_430098 ) ) ( not ( = ?auto_430094 ?auto_430099 ) ) ( not ( = ?auto_430094 ?auto_430100 ) ) ( not ( = ?auto_430095 ?auto_430096 ) ) ( not ( = ?auto_430095 ?auto_430097 ) ) ( not ( = ?auto_430095 ?auto_430098 ) ) ( not ( = ?auto_430095 ?auto_430099 ) ) ( not ( = ?auto_430095 ?auto_430100 ) ) ( not ( = ?auto_430096 ?auto_430097 ) ) ( not ( = ?auto_430096 ?auto_430098 ) ) ( not ( = ?auto_430096 ?auto_430099 ) ) ( not ( = ?auto_430096 ?auto_430100 ) ) ( not ( = ?auto_430097 ?auto_430098 ) ) ( not ( = ?auto_430097 ?auto_430099 ) ) ( not ( = ?auto_430097 ?auto_430100 ) ) ( not ( = ?auto_430098 ?auto_430099 ) ) ( not ( = ?auto_430098 ?auto_430100 ) ) ( not ( = ?auto_430099 ?auto_430100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_430099 ?auto_430100 )
      ( !STACK ?auto_430099 ?auto_430098 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430135 - BLOCK
      ?auto_430136 - BLOCK
      ?auto_430137 - BLOCK
      ?auto_430138 - BLOCK
      ?auto_430139 - BLOCK
      ?auto_430140 - BLOCK
      ?auto_430141 - BLOCK
      ?auto_430142 - BLOCK
      ?auto_430143 - BLOCK
      ?auto_430144 - BLOCK
      ?auto_430145 - BLOCK
    )
    :vars
    (
      ?auto_430146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430145 ?auto_430146 ) ( ON-TABLE ?auto_430135 ) ( ON ?auto_430136 ?auto_430135 ) ( ON ?auto_430137 ?auto_430136 ) ( ON ?auto_430138 ?auto_430137 ) ( ON ?auto_430139 ?auto_430138 ) ( ON ?auto_430140 ?auto_430139 ) ( ON ?auto_430141 ?auto_430140 ) ( ON ?auto_430142 ?auto_430141 ) ( ON ?auto_430143 ?auto_430142 ) ( not ( = ?auto_430135 ?auto_430136 ) ) ( not ( = ?auto_430135 ?auto_430137 ) ) ( not ( = ?auto_430135 ?auto_430138 ) ) ( not ( = ?auto_430135 ?auto_430139 ) ) ( not ( = ?auto_430135 ?auto_430140 ) ) ( not ( = ?auto_430135 ?auto_430141 ) ) ( not ( = ?auto_430135 ?auto_430142 ) ) ( not ( = ?auto_430135 ?auto_430143 ) ) ( not ( = ?auto_430135 ?auto_430144 ) ) ( not ( = ?auto_430135 ?auto_430145 ) ) ( not ( = ?auto_430135 ?auto_430146 ) ) ( not ( = ?auto_430136 ?auto_430137 ) ) ( not ( = ?auto_430136 ?auto_430138 ) ) ( not ( = ?auto_430136 ?auto_430139 ) ) ( not ( = ?auto_430136 ?auto_430140 ) ) ( not ( = ?auto_430136 ?auto_430141 ) ) ( not ( = ?auto_430136 ?auto_430142 ) ) ( not ( = ?auto_430136 ?auto_430143 ) ) ( not ( = ?auto_430136 ?auto_430144 ) ) ( not ( = ?auto_430136 ?auto_430145 ) ) ( not ( = ?auto_430136 ?auto_430146 ) ) ( not ( = ?auto_430137 ?auto_430138 ) ) ( not ( = ?auto_430137 ?auto_430139 ) ) ( not ( = ?auto_430137 ?auto_430140 ) ) ( not ( = ?auto_430137 ?auto_430141 ) ) ( not ( = ?auto_430137 ?auto_430142 ) ) ( not ( = ?auto_430137 ?auto_430143 ) ) ( not ( = ?auto_430137 ?auto_430144 ) ) ( not ( = ?auto_430137 ?auto_430145 ) ) ( not ( = ?auto_430137 ?auto_430146 ) ) ( not ( = ?auto_430138 ?auto_430139 ) ) ( not ( = ?auto_430138 ?auto_430140 ) ) ( not ( = ?auto_430138 ?auto_430141 ) ) ( not ( = ?auto_430138 ?auto_430142 ) ) ( not ( = ?auto_430138 ?auto_430143 ) ) ( not ( = ?auto_430138 ?auto_430144 ) ) ( not ( = ?auto_430138 ?auto_430145 ) ) ( not ( = ?auto_430138 ?auto_430146 ) ) ( not ( = ?auto_430139 ?auto_430140 ) ) ( not ( = ?auto_430139 ?auto_430141 ) ) ( not ( = ?auto_430139 ?auto_430142 ) ) ( not ( = ?auto_430139 ?auto_430143 ) ) ( not ( = ?auto_430139 ?auto_430144 ) ) ( not ( = ?auto_430139 ?auto_430145 ) ) ( not ( = ?auto_430139 ?auto_430146 ) ) ( not ( = ?auto_430140 ?auto_430141 ) ) ( not ( = ?auto_430140 ?auto_430142 ) ) ( not ( = ?auto_430140 ?auto_430143 ) ) ( not ( = ?auto_430140 ?auto_430144 ) ) ( not ( = ?auto_430140 ?auto_430145 ) ) ( not ( = ?auto_430140 ?auto_430146 ) ) ( not ( = ?auto_430141 ?auto_430142 ) ) ( not ( = ?auto_430141 ?auto_430143 ) ) ( not ( = ?auto_430141 ?auto_430144 ) ) ( not ( = ?auto_430141 ?auto_430145 ) ) ( not ( = ?auto_430141 ?auto_430146 ) ) ( not ( = ?auto_430142 ?auto_430143 ) ) ( not ( = ?auto_430142 ?auto_430144 ) ) ( not ( = ?auto_430142 ?auto_430145 ) ) ( not ( = ?auto_430142 ?auto_430146 ) ) ( not ( = ?auto_430143 ?auto_430144 ) ) ( not ( = ?auto_430143 ?auto_430145 ) ) ( not ( = ?auto_430143 ?auto_430146 ) ) ( not ( = ?auto_430144 ?auto_430145 ) ) ( not ( = ?auto_430144 ?auto_430146 ) ) ( not ( = ?auto_430145 ?auto_430146 ) ) ( CLEAR ?auto_430143 ) ( ON ?auto_430144 ?auto_430145 ) ( CLEAR ?auto_430144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_430135 ?auto_430136 ?auto_430137 ?auto_430138 ?auto_430139 ?auto_430140 ?auto_430141 ?auto_430142 ?auto_430143 ?auto_430144 )
      ( MAKE-11PILE ?auto_430135 ?auto_430136 ?auto_430137 ?auto_430138 ?auto_430139 ?auto_430140 ?auto_430141 ?auto_430142 ?auto_430143 ?auto_430144 ?auto_430145 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430181 - BLOCK
      ?auto_430182 - BLOCK
      ?auto_430183 - BLOCK
      ?auto_430184 - BLOCK
      ?auto_430185 - BLOCK
      ?auto_430186 - BLOCK
      ?auto_430187 - BLOCK
      ?auto_430188 - BLOCK
      ?auto_430189 - BLOCK
      ?auto_430190 - BLOCK
      ?auto_430191 - BLOCK
    )
    :vars
    (
      ?auto_430192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430191 ?auto_430192 ) ( ON-TABLE ?auto_430181 ) ( ON ?auto_430182 ?auto_430181 ) ( ON ?auto_430183 ?auto_430182 ) ( ON ?auto_430184 ?auto_430183 ) ( ON ?auto_430185 ?auto_430184 ) ( ON ?auto_430186 ?auto_430185 ) ( ON ?auto_430187 ?auto_430186 ) ( ON ?auto_430188 ?auto_430187 ) ( not ( = ?auto_430181 ?auto_430182 ) ) ( not ( = ?auto_430181 ?auto_430183 ) ) ( not ( = ?auto_430181 ?auto_430184 ) ) ( not ( = ?auto_430181 ?auto_430185 ) ) ( not ( = ?auto_430181 ?auto_430186 ) ) ( not ( = ?auto_430181 ?auto_430187 ) ) ( not ( = ?auto_430181 ?auto_430188 ) ) ( not ( = ?auto_430181 ?auto_430189 ) ) ( not ( = ?auto_430181 ?auto_430190 ) ) ( not ( = ?auto_430181 ?auto_430191 ) ) ( not ( = ?auto_430181 ?auto_430192 ) ) ( not ( = ?auto_430182 ?auto_430183 ) ) ( not ( = ?auto_430182 ?auto_430184 ) ) ( not ( = ?auto_430182 ?auto_430185 ) ) ( not ( = ?auto_430182 ?auto_430186 ) ) ( not ( = ?auto_430182 ?auto_430187 ) ) ( not ( = ?auto_430182 ?auto_430188 ) ) ( not ( = ?auto_430182 ?auto_430189 ) ) ( not ( = ?auto_430182 ?auto_430190 ) ) ( not ( = ?auto_430182 ?auto_430191 ) ) ( not ( = ?auto_430182 ?auto_430192 ) ) ( not ( = ?auto_430183 ?auto_430184 ) ) ( not ( = ?auto_430183 ?auto_430185 ) ) ( not ( = ?auto_430183 ?auto_430186 ) ) ( not ( = ?auto_430183 ?auto_430187 ) ) ( not ( = ?auto_430183 ?auto_430188 ) ) ( not ( = ?auto_430183 ?auto_430189 ) ) ( not ( = ?auto_430183 ?auto_430190 ) ) ( not ( = ?auto_430183 ?auto_430191 ) ) ( not ( = ?auto_430183 ?auto_430192 ) ) ( not ( = ?auto_430184 ?auto_430185 ) ) ( not ( = ?auto_430184 ?auto_430186 ) ) ( not ( = ?auto_430184 ?auto_430187 ) ) ( not ( = ?auto_430184 ?auto_430188 ) ) ( not ( = ?auto_430184 ?auto_430189 ) ) ( not ( = ?auto_430184 ?auto_430190 ) ) ( not ( = ?auto_430184 ?auto_430191 ) ) ( not ( = ?auto_430184 ?auto_430192 ) ) ( not ( = ?auto_430185 ?auto_430186 ) ) ( not ( = ?auto_430185 ?auto_430187 ) ) ( not ( = ?auto_430185 ?auto_430188 ) ) ( not ( = ?auto_430185 ?auto_430189 ) ) ( not ( = ?auto_430185 ?auto_430190 ) ) ( not ( = ?auto_430185 ?auto_430191 ) ) ( not ( = ?auto_430185 ?auto_430192 ) ) ( not ( = ?auto_430186 ?auto_430187 ) ) ( not ( = ?auto_430186 ?auto_430188 ) ) ( not ( = ?auto_430186 ?auto_430189 ) ) ( not ( = ?auto_430186 ?auto_430190 ) ) ( not ( = ?auto_430186 ?auto_430191 ) ) ( not ( = ?auto_430186 ?auto_430192 ) ) ( not ( = ?auto_430187 ?auto_430188 ) ) ( not ( = ?auto_430187 ?auto_430189 ) ) ( not ( = ?auto_430187 ?auto_430190 ) ) ( not ( = ?auto_430187 ?auto_430191 ) ) ( not ( = ?auto_430187 ?auto_430192 ) ) ( not ( = ?auto_430188 ?auto_430189 ) ) ( not ( = ?auto_430188 ?auto_430190 ) ) ( not ( = ?auto_430188 ?auto_430191 ) ) ( not ( = ?auto_430188 ?auto_430192 ) ) ( not ( = ?auto_430189 ?auto_430190 ) ) ( not ( = ?auto_430189 ?auto_430191 ) ) ( not ( = ?auto_430189 ?auto_430192 ) ) ( not ( = ?auto_430190 ?auto_430191 ) ) ( not ( = ?auto_430190 ?auto_430192 ) ) ( not ( = ?auto_430191 ?auto_430192 ) ) ( ON ?auto_430190 ?auto_430191 ) ( CLEAR ?auto_430188 ) ( ON ?auto_430189 ?auto_430190 ) ( CLEAR ?auto_430189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_430181 ?auto_430182 ?auto_430183 ?auto_430184 ?auto_430185 ?auto_430186 ?auto_430187 ?auto_430188 ?auto_430189 )
      ( MAKE-11PILE ?auto_430181 ?auto_430182 ?auto_430183 ?auto_430184 ?auto_430185 ?auto_430186 ?auto_430187 ?auto_430188 ?auto_430189 ?auto_430190 ?auto_430191 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430227 - BLOCK
      ?auto_430228 - BLOCK
      ?auto_430229 - BLOCK
      ?auto_430230 - BLOCK
      ?auto_430231 - BLOCK
      ?auto_430232 - BLOCK
      ?auto_430233 - BLOCK
      ?auto_430234 - BLOCK
      ?auto_430235 - BLOCK
      ?auto_430236 - BLOCK
      ?auto_430237 - BLOCK
    )
    :vars
    (
      ?auto_430238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430237 ?auto_430238 ) ( ON-TABLE ?auto_430227 ) ( ON ?auto_430228 ?auto_430227 ) ( ON ?auto_430229 ?auto_430228 ) ( ON ?auto_430230 ?auto_430229 ) ( ON ?auto_430231 ?auto_430230 ) ( ON ?auto_430232 ?auto_430231 ) ( ON ?auto_430233 ?auto_430232 ) ( not ( = ?auto_430227 ?auto_430228 ) ) ( not ( = ?auto_430227 ?auto_430229 ) ) ( not ( = ?auto_430227 ?auto_430230 ) ) ( not ( = ?auto_430227 ?auto_430231 ) ) ( not ( = ?auto_430227 ?auto_430232 ) ) ( not ( = ?auto_430227 ?auto_430233 ) ) ( not ( = ?auto_430227 ?auto_430234 ) ) ( not ( = ?auto_430227 ?auto_430235 ) ) ( not ( = ?auto_430227 ?auto_430236 ) ) ( not ( = ?auto_430227 ?auto_430237 ) ) ( not ( = ?auto_430227 ?auto_430238 ) ) ( not ( = ?auto_430228 ?auto_430229 ) ) ( not ( = ?auto_430228 ?auto_430230 ) ) ( not ( = ?auto_430228 ?auto_430231 ) ) ( not ( = ?auto_430228 ?auto_430232 ) ) ( not ( = ?auto_430228 ?auto_430233 ) ) ( not ( = ?auto_430228 ?auto_430234 ) ) ( not ( = ?auto_430228 ?auto_430235 ) ) ( not ( = ?auto_430228 ?auto_430236 ) ) ( not ( = ?auto_430228 ?auto_430237 ) ) ( not ( = ?auto_430228 ?auto_430238 ) ) ( not ( = ?auto_430229 ?auto_430230 ) ) ( not ( = ?auto_430229 ?auto_430231 ) ) ( not ( = ?auto_430229 ?auto_430232 ) ) ( not ( = ?auto_430229 ?auto_430233 ) ) ( not ( = ?auto_430229 ?auto_430234 ) ) ( not ( = ?auto_430229 ?auto_430235 ) ) ( not ( = ?auto_430229 ?auto_430236 ) ) ( not ( = ?auto_430229 ?auto_430237 ) ) ( not ( = ?auto_430229 ?auto_430238 ) ) ( not ( = ?auto_430230 ?auto_430231 ) ) ( not ( = ?auto_430230 ?auto_430232 ) ) ( not ( = ?auto_430230 ?auto_430233 ) ) ( not ( = ?auto_430230 ?auto_430234 ) ) ( not ( = ?auto_430230 ?auto_430235 ) ) ( not ( = ?auto_430230 ?auto_430236 ) ) ( not ( = ?auto_430230 ?auto_430237 ) ) ( not ( = ?auto_430230 ?auto_430238 ) ) ( not ( = ?auto_430231 ?auto_430232 ) ) ( not ( = ?auto_430231 ?auto_430233 ) ) ( not ( = ?auto_430231 ?auto_430234 ) ) ( not ( = ?auto_430231 ?auto_430235 ) ) ( not ( = ?auto_430231 ?auto_430236 ) ) ( not ( = ?auto_430231 ?auto_430237 ) ) ( not ( = ?auto_430231 ?auto_430238 ) ) ( not ( = ?auto_430232 ?auto_430233 ) ) ( not ( = ?auto_430232 ?auto_430234 ) ) ( not ( = ?auto_430232 ?auto_430235 ) ) ( not ( = ?auto_430232 ?auto_430236 ) ) ( not ( = ?auto_430232 ?auto_430237 ) ) ( not ( = ?auto_430232 ?auto_430238 ) ) ( not ( = ?auto_430233 ?auto_430234 ) ) ( not ( = ?auto_430233 ?auto_430235 ) ) ( not ( = ?auto_430233 ?auto_430236 ) ) ( not ( = ?auto_430233 ?auto_430237 ) ) ( not ( = ?auto_430233 ?auto_430238 ) ) ( not ( = ?auto_430234 ?auto_430235 ) ) ( not ( = ?auto_430234 ?auto_430236 ) ) ( not ( = ?auto_430234 ?auto_430237 ) ) ( not ( = ?auto_430234 ?auto_430238 ) ) ( not ( = ?auto_430235 ?auto_430236 ) ) ( not ( = ?auto_430235 ?auto_430237 ) ) ( not ( = ?auto_430235 ?auto_430238 ) ) ( not ( = ?auto_430236 ?auto_430237 ) ) ( not ( = ?auto_430236 ?auto_430238 ) ) ( not ( = ?auto_430237 ?auto_430238 ) ) ( ON ?auto_430236 ?auto_430237 ) ( ON ?auto_430235 ?auto_430236 ) ( CLEAR ?auto_430233 ) ( ON ?auto_430234 ?auto_430235 ) ( CLEAR ?auto_430234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_430227 ?auto_430228 ?auto_430229 ?auto_430230 ?auto_430231 ?auto_430232 ?auto_430233 ?auto_430234 )
      ( MAKE-11PILE ?auto_430227 ?auto_430228 ?auto_430229 ?auto_430230 ?auto_430231 ?auto_430232 ?auto_430233 ?auto_430234 ?auto_430235 ?auto_430236 ?auto_430237 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430273 - BLOCK
      ?auto_430274 - BLOCK
      ?auto_430275 - BLOCK
      ?auto_430276 - BLOCK
      ?auto_430277 - BLOCK
      ?auto_430278 - BLOCK
      ?auto_430279 - BLOCK
      ?auto_430280 - BLOCK
      ?auto_430281 - BLOCK
      ?auto_430282 - BLOCK
      ?auto_430283 - BLOCK
    )
    :vars
    (
      ?auto_430284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430283 ?auto_430284 ) ( ON-TABLE ?auto_430273 ) ( ON ?auto_430274 ?auto_430273 ) ( ON ?auto_430275 ?auto_430274 ) ( ON ?auto_430276 ?auto_430275 ) ( ON ?auto_430277 ?auto_430276 ) ( ON ?auto_430278 ?auto_430277 ) ( not ( = ?auto_430273 ?auto_430274 ) ) ( not ( = ?auto_430273 ?auto_430275 ) ) ( not ( = ?auto_430273 ?auto_430276 ) ) ( not ( = ?auto_430273 ?auto_430277 ) ) ( not ( = ?auto_430273 ?auto_430278 ) ) ( not ( = ?auto_430273 ?auto_430279 ) ) ( not ( = ?auto_430273 ?auto_430280 ) ) ( not ( = ?auto_430273 ?auto_430281 ) ) ( not ( = ?auto_430273 ?auto_430282 ) ) ( not ( = ?auto_430273 ?auto_430283 ) ) ( not ( = ?auto_430273 ?auto_430284 ) ) ( not ( = ?auto_430274 ?auto_430275 ) ) ( not ( = ?auto_430274 ?auto_430276 ) ) ( not ( = ?auto_430274 ?auto_430277 ) ) ( not ( = ?auto_430274 ?auto_430278 ) ) ( not ( = ?auto_430274 ?auto_430279 ) ) ( not ( = ?auto_430274 ?auto_430280 ) ) ( not ( = ?auto_430274 ?auto_430281 ) ) ( not ( = ?auto_430274 ?auto_430282 ) ) ( not ( = ?auto_430274 ?auto_430283 ) ) ( not ( = ?auto_430274 ?auto_430284 ) ) ( not ( = ?auto_430275 ?auto_430276 ) ) ( not ( = ?auto_430275 ?auto_430277 ) ) ( not ( = ?auto_430275 ?auto_430278 ) ) ( not ( = ?auto_430275 ?auto_430279 ) ) ( not ( = ?auto_430275 ?auto_430280 ) ) ( not ( = ?auto_430275 ?auto_430281 ) ) ( not ( = ?auto_430275 ?auto_430282 ) ) ( not ( = ?auto_430275 ?auto_430283 ) ) ( not ( = ?auto_430275 ?auto_430284 ) ) ( not ( = ?auto_430276 ?auto_430277 ) ) ( not ( = ?auto_430276 ?auto_430278 ) ) ( not ( = ?auto_430276 ?auto_430279 ) ) ( not ( = ?auto_430276 ?auto_430280 ) ) ( not ( = ?auto_430276 ?auto_430281 ) ) ( not ( = ?auto_430276 ?auto_430282 ) ) ( not ( = ?auto_430276 ?auto_430283 ) ) ( not ( = ?auto_430276 ?auto_430284 ) ) ( not ( = ?auto_430277 ?auto_430278 ) ) ( not ( = ?auto_430277 ?auto_430279 ) ) ( not ( = ?auto_430277 ?auto_430280 ) ) ( not ( = ?auto_430277 ?auto_430281 ) ) ( not ( = ?auto_430277 ?auto_430282 ) ) ( not ( = ?auto_430277 ?auto_430283 ) ) ( not ( = ?auto_430277 ?auto_430284 ) ) ( not ( = ?auto_430278 ?auto_430279 ) ) ( not ( = ?auto_430278 ?auto_430280 ) ) ( not ( = ?auto_430278 ?auto_430281 ) ) ( not ( = ?auto_430278 ?auto_430282 ) ) ( not ( = ?auto_430278 ?auto_430283 ) ) ( not ( = ?auto_430278 ?auto_430284 ) ) ( not ( = ?auto_430279 ?auto_430280 ) ) ( not ( = ?auto_430279 ?auto_430281 ) ) ( not ( = ?auto_430279 ?auto_430282 ) ) ( not ( = ?auto_430279 ?auto_430283 ) ) ( not ( = ?auto_430279 ?auto_430284 ) ) ( not ( = ?auto_430280 ?auto_430281 ) ) ( not ( = ?auto_430280 ?auto_430282 ) ) ( not ( = ?auto_430280 ?auto_430283 ) ) ( not ( = ?auto_430280 ?auto_430284 ) ) ( not ( = ?auto_430281 ?auto_430282 ) ) ( not ( = ?auto_430281 ?auto_430283 ) ) ( not ( = ?auto_430281 ?auto_430284 ) ) ( not ( = ?auto_430282 ?auto_430283 ) ) ( not ( = ?auto_430282 ?auto_430284 ) ) ( not ( = ?auto_430283 ?auto_430284 ) ) ( ON ?auto_430282 ?auto_430283 ) ( ON ?auto_430281 ?auto_430282 ) ( ON ?auto_430280 ?auto_430281 ) ( CLEAR ?auto_430278 ) ( ON ?auto_430279 ?auto_430280 ) ( CLEAR ?auto_430279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_430273 ?auto_430274 ?auto_430275 ?auto_430276 ?auto_430277 ?auto_430278 ?auto_430279 )
      ( MAKE-11PILE ?auto_430273 ?auto_430274 ?auto_430275 ?auto_430276 ?auto_430277 ?auto_430278 ?auto_430279 ?auto_430280 ?auto_430281 ?auto_430282 ?auto_430283 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430319 - BLOCK
      ?auto_430320 - BLOCK
      ?auto_430321 - BLOCK
      ?auto_430322 - BLOCK
      ?auto_430323 - BLOCK
      ?auto_430324 - BLOCK
      ?auto_430325 - BLOCK
      ?auto_430326 - BLOCK
      ?auto_430327 - BLOCK
      ?auto_430328 - BLOCK
      ?auto_430329 - BLOCK
    )
    :vars
    (
      ?auto_430330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430329 ?auto_430330 ) ( ON-TABLE ?auto_430319 ) ( ON ?auto_430320 ?auto_430319 ) ( ON ?auto_430321 ?auto_430320 ) ( ON ?auto_430322 ?auto_430321 ) ( ON ?auto_430323 ?auto_430322 ) ( not ( = ?auto_430319 ?auto_430320 ) ) ( not ( = ?auto_430319 ?auto_430321 ) ) ( not ( = ?auto_430319 ?auto_430322 ) ) ( not ( = ?auto_430319 ?auto_430323 ) ) ( not ( = ?auto_430319 ?auto_430324 ) ) ( not ( = ?auto_430319 ?auto_430325 ) ) ( not ( = ?auto_430319 ?auto_430326 ) ) ( not ( = ?auto_430319 ?auto_430327 ) ) ( not ( = ?auto_430319 ?auto_430328 ) ) ( not ( = ?auto_430319 ?auto_430329 ) ) ( not ( = ?auto_430319 ?auto_430330 ) ) ( not ( = ?auto_430320 ?auto_430321 ) ) ( not ( = ?auto_430320 ?auto_430322 ) ) ( not ( = ?auto_430320 ?auto_430323 ) ) ( not ( = ?auto_430320 ?auto_430324 ) ) ( not ( = ?auto_430320 ?auto_430325 ) ) ( not ( = ?auto_430320 ?auto_430326 ) ) ( not ( = ?auto_430320 ?auto_430327 ) ) ( not ( = ?auto_430320 ?auto_430328 ) ) ( not ( = ?auto_430320 ?auto_430329 ) ) ( not ( = ?auto_430320 ?auto_430330 ) ) ( not ( = ?auto_430321 ?auto_430322 ) ) ( not ( = ?auto_430321 ?auto_430323 ) ) ( not ( = ?auto_430321 ?auto_430324 ) ) ( not ( = ?auto_430321 ?auto_430325 ) ) ( not ( = ?auto_430321 ?auto_430326 ) ) ( not ( = ?auto_430321 ?auto_430327 ) ) ( not ( = ?auto_430321 ?auto_430328 ) ) ( not ( = ?auto_430321 ?auto_430329 ) ) ( not ( = ?auto_430321 ?auto_430330 ) ) ( not ( = ?auto_430322 ?auto_430323 ) ) ( not ( = ?auto_430322 ?auto_430324 ) ) ( not ( = ?auto_430322 ?auto_430325 ) ) ( not ( = ?auto_430322 ?auto_430326 ) ) ( not ( = ?auto_430322 ?auto_430327 ) ) ( not ( = ?auto_430322 ?auto_430328 ) ) ( not ( = ?auto_430322 ?auto_430329 ) ) ( not ( = ?auto_430322 ?auto_430330 ) ) ( not ( = ?auto_430323 ?auto_430324 ) ) ( not ( = ?auto_430323 ?auto_430325 ) ) ( not ( = ?auto_430323 ?auto_430326 ) ) ( not ( = ?auto_430323 ?auto_430327 ) ) ( not ( = ?auto_430323 ?auto_430328 ) ) ( not ( = ?auto_430323 ?auto_430329 ) ) ( not ( = ?auto_430323 ?auto_430330 ) ) ( not ( = ?auto_430324 ?auto_430325 ) ) ( not ( = ?auto_430324 ?auto_430326 ) ) ( not ( = ?auto_430324 ?auto_430327 ) ) ( not ( = ?auto_430324 ?auto_430328 ) ) ( not ( = ?auto_430324 ?auto_430329 ) ) ( not ( = ?auto_430324 ?auto_430330 ) ) ( not ( = ?auto_430325 ?auto_430326 ) ) ( not ( = ?auto_430325 ?auto_430327 ) ) ( not ( = ?auto_430325 ?auto_430328 ) ) ( not ( = ?auto_430325 ?auto_430329 ) ) ( not ( = ?auto_430325 ?auto_430330 ) ) ( not ( = ?auto_430326 ?auto_430327 ) ) ( not ( = ?auto_430326 ?auto_430328 ) ) ( not ( = ?auto_430326 ?auto_430329 ) ) ( not ( = ?auto_430326 ?auto_430330 ) ) ( not ( = ?auto_430327 ?auto_430328 ) ) ( not ( = ?auto_430327 ?auto_430329 ) ) ( not ( = ?auto_430327 ?auto_430330 ) ) ( not ( = ?auto_430328 ?auto_430329 ) ) ( not ( = ?auto_430328 ?auto_430330 ) ) ( not ( = ?auto_430329 ?auto_430330 ) ) ( ON ?auto_430328 ?auto_430329 ) ( ON ?auto_430327 ?auto_430328 ) ( ON ?auto_430326 ?auto_430327 ) ( ON ?auto_430325 ?auto_430326 ) ( CLEAR ?auto_430323 ) ( ON ?auto_430324 ?auto_430325 ) ( CLEAR ?auto_430324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_430319 ?auto_430320 ?auto_430321 ?auto_430322 ?auto_430323 ?auto_430324 )
      ( MAKE-11PILE ?auto_430319 ?auto_430320 ?auto_430321 ?auto_430322 ?auto_430323 ?auto_430324 ?auto_430325 ?auto_430326 ?auto_430327 ?auto_430328 ?auto_430329 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430365 - BLOCK
      ?auto_430366 - BLOCK
      ?auto_430367 - BLOCK
      ?auto_430368 - BLOCK
      ?auto_430369 - BLOCK
      ?auto_430370 - BLOCK
      ?auto_430371 - BLOCK
      ?auto_430372 - BLOCK
      ?auto_430373 - BLOCK
      ?auto_430374 - BLOCK
      ?auto_430375 - BLOCK
    )
    :vars
    (
      ?auto_430376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430375 ?auto_430376 ) ( ON-TABLE ?auto_430365 ) ( ON ?auto_430366 ?auto_430365 ) ( ON ?auto_430367 ?auto_430366 ) ( ON ?auto_430368 ?auto_430367 ) ( not ( = ?auto_430365 ?auto_430366 ) ) ( not ( = ?auto_430365 ?auto_430367 ) ) ( not ( = ?auto_430365 ?auto_430368 ) ) ( not ( = ?auto_430365 ?auto_430369 ) ) ( not ( = ?auto_430365 ?auto_430370 ) ) ( not ( = ?auto_430365 ?auto_430371 ) ) ( not ( = ?auto_430365 ?auto_430372 ) ) ( not ( = ?auto_430365 ?auto_430373 ) ) ( not ( = ?auto_430365 ?auto_430374 ) ) ( not ( = ?auto_430365 ?auto_430375 ) ) ( not ( = ?auto_430365 ?auto_430376 ) ) ( not ( = ?auto_430366 ?auto_430367 ) ) ( not ( = ?auto_430366 ?auto_430368 ) ) ( not ( = ?auto_430366 ?auto_430369 ) ) ( not ( = ?auto_430366 ?auto_430370 ) ) ( not ( = ?auto_430366 ?auto_430371 ) ) ( not ( = ?auto_430366 ?auto_430372 ) ) ( not ( = ?auto_430366 ?auto_430373 ) ) ( not ( = ?auto_430366 ?auto_430374 ) ) ( not ( = ?auto_430366 ?auto_430375 ) ) ( not ( = ?auto_430366 ?auto_430376 ) ) ( not ( = ?auto_430367 ?auto_430368 ) ) ( not ( = ?auto_430367 ?auto_430369 ) ) ( not ( = ?auto_430367 ?auto_430370 ) ) ( not ( = ?auto_430367 ?auto_430371 ) ) ( not ( = ?auto_430367 ?auto_430372 ) ) ( not ( = ?auto_430367 ?auto_430373 ) ) ( not ( = ?auto_430367 ?auto_430374 ) ) ( not ( = ?auto_430367 ?auto_430375 ) ) ( not ( = ?auto_430367 ?auto_430376 ) ) ( not ( = ?auto_430368 ?auto_430369 ) ) ( not ( = ?auto_430368 ?auto_430370 ) ) ( not ( = ?auto_430368 ?auto_430371 ) ) ( not ( = ?auto_430368 ?auto_430372 ) ) ( not ( = ?auto_430368 ?auto_430373 ) ) ( not ( = ?auto_430368 ?auto_430374 ) ) ( not ( = ?auto_430368 ?auto_430375 ) ) ( not ( = ?auto_430368 ?auto_430376 ) ) ( not ( = ?auto_430369 ?auto_430370 ) ) ( not ( = ?auto_430369 ?auto_430371 ) ) ( not ( = ?auto_430369 ?auto_430372 ) ) ( not ( = ?auto_430369 ?auto_430373 ) ) ( not ( = ?auto_430369 ?auto_430374 ) ) ( not ( = ?auto_430369 ?auto_430375 ) ) ( not ( = ?auto_430369 ?auto_430376 ) ) ( not ( = ?auto_430370 ?auto_430371 ) ) ( not ( = ?auto_430370 ?auto_430372 ) ) ( not ( = ?auto_430370 ?auto_430373 ) ) ( not ( = ?auto_430370 ?auto_430374 ) ) ( not ( = ?auto_430370 ?auto_430375 ) ) ( not ( = ?auto_430370 ?auto_430376 ) ) ( not ( = ?auto_430371 ?auto_430372 ) ) ( not ( = ?auto_430371 ?auto_430373 ) ) ( not ( = ?auto_430371 ?auto_430374 ) ) ( not ( = ?auto_430371 ?auto_430375 ) ) ( not ( = ?auto_430371 ?auto_430376 ) ) ( not ( = ?auto_430372 ?auto_430373 ) ) ( not ( = ?auto_430372 ?auto_430374 ) ) ( not ( = ?auto_430372 ?auto_430375 ) ) ( not ( = ?auto_430372 ?auto_430376 ) ) ( not ( = ?auto_430373 ?auto_430374 ) ) ( not ( = ?auto_430373 ?auto_430375 ) ) ( not ( = ?auto_430373 ?auto_430376 ) ) ( not ( = ?auto_430374 ?auto_430375 ) ) ( not ( = ?auto_430374 ?auto_430376 ) ) ( not ( = ?auto_430375 ?auto_430376 ) ) ( ON ?auto_430374 ?auto_430375 ) ( ON ?auto_430373 ?auto_430374 ) ( ON ?auto_430372 ?auto_430373 ) ( ON ?auto_430371 ?auto_430372 ) ( ON ?auto_430370 ?auto_430371 ) ( CLEAR ?auto_430368 ) ( ON ?auto_430369 ?auto_430370 ) ( CLEAR ?auto_430369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_430365 ?auto_430366 ?auto_430367 ?auto_430368 ?auto_430369 )
      ( MAKE-11PILE ?auto_430365 ?auto_430366 ?auto_430367 ?auto_430368 ?auto_430369 ?auto_430370 ?auto_430371 ?auto_430372 ?auto_430373 ?auto_430374 ?auto_430375 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430411 - BLOCK
      ?auto_430412 - BLOCK
      ?auto_430413 - BLOCK
      ?auto_430414 - BLOCK
      ?auto_430415 - BLOCK
      ?auto_430416 - BLOCK
      ?auto_430417 - BLOCK
      ?auto_430418 - BLOCK
      ?auto_430419 - BLOCK
      ?auto_430420 - BLOCK
      ?auto_430421 - BLOCK
    )
    :vars
    (
      ?auto_430422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430421 ?auto_430422 ) ( ON-TABLE ?auto_430411 ) ( ON ?auto_430412 ?auto_430411 ) ( ON ?auto_430413 ?auto_430412 ) ( not ( = ?auto_430411 ?auto_430412 ) ) ( not ( = ?auto_430411 ?auto_430413 ) ) ( not ( = ?auto_430411 ?auto_430414 ) ) ( not ( = ?auto_430411 ?auto_430415 ) ) ( not ( = ?auto_430411 ?auto_430416 ) ) ( not ( = ?auto_430411 ?auto_430417 ) ) ( not ( = ?auto_430411 ?auto_430418 ) ) ( not ( = ?auto_430411 ?auto_430419 ) ) ( not ( = ?auto_430411 ?auto_430420 ) ) ( not ( = ?auto_430411 ?auto_430421 ) ) ( not ( = ?auto_430411 ?auto_430422 ) ) ( not ( = ?auto_430412 ?auto_430413 ) ) ( not ( = ?auto_430412 ?auto_430414 ) ) ( not ( = ?auto_430412 ?auto_430415 ) ) ( not ( = ?auto_430412 ?auto_430416 ) ) ( not ( = ?auto_430412 ?auto_430417 ) ) ( not ( = ?auto_430412 ?auto_430418 ) ) ( not ( = ?auto_430412 ?auto_430419 ) ) ( not ( = ?auto_430412 ?auto_430420 ) ) ( not ( = ?auto_430412 ?auto_430421 ) ) ( not ( = ?auto_430412 ?auto_430422 ) ) ( not ( = ?auto_430413 ?auto_430414 ) ) ( not ( = ?auto_430413 ?auto_430415 ) ) ( not ( = ?auto_430413 ?auto_430416 ) ) ( not ( = ?auto_430413 ?auto_430417 ) ) ( not ( = ?auto_430413 ?auto_430418 ) ) ( not ( = ?auto_430413 ?auto_430419 ) ) ( not ( = ?auto_430413 ?auto_430420 ) ) ( not ( = ?auto_430413 ?auto_430421 ) ) ( not ( = ?auto_430413 ?auto_430422 ) ) ( not ( = ?auto_430414 ?auto_430415 ) ) ( not ( = ?auto_430414 ?auto_430416 ) ) ( not ( = ?auto_430414 ?auto_430417 ) ) ( not ( = ?auto_430414 ?auto_430418 ) ) ( not ( = ?auto_430414 ?auto_430419 ) ) ( not ( = ?auto_430414 ?auto_430420 ) ) ( not ( = ?auto_430414 ?auto_430421 ) ) ( not ( = ?auto_430414 ?auto_430422 ) ) ( not ( = ?auto_430415 ?auto_430416 ) ) ( not ( = ?auto_430415 ?auto_430417 ) ) ( not ( = ?auto_430415 ?auto_430418 ) ) ( not ( = ?auto_430415 ?auto_430419 ) ) ( not ( = ?auto_430415 ?auto_430420 ) ) ( not ( = ?auto_430415 ?auto_430421 ) ) ( not ( = ?auto_430415 ?auto_430422 ) ) ( not ( = ?auto_430416 ?auto_430417 ) ) ( not ( = ?auto_430416 ?auto_430418 ) ) ( not ( = ?auto_430416 ?auto_430419 ) ) ( not ( = ?auto_430416 ?auto_430420 ) ) ( not ( = ?auto_430416 ?auto_430421 ) ) ( not ( = ?auto_430416 ?auto_430422 ) ) ( not ( = ?auto_430417 ?auto_430418 ) ) ( not ( = ?auto_430417 ?auto_430419 ) ) ( not ( = ?auto_430417 ?auto_430420 ) ) ( not ( = ?auto_430417 ?auto_430421 ) ) ( not ( = ?auto_430417 ?auto_430422 ) ) ( not ( = ?auto_430418 ?auto_430419 ) ) ( not ( = ?auto_430418 ?auto_430420 ) ) ( not ( = ?auto_430418 ?auto_430421 ) ) ( not ( = ?auto_430418 ?auto_430422 ) ) ( not ( = ?auto_430419 ?auto_430420 ) ) ( not ( = ?auto_430419 ?auto_430421 ) ) ( not ( = ?auto_430419 ?auto_430422 ) ) ( not ( = ?auto_430420 ?auto_430421 ) ) ( not ( = ?auto_430420 ?auto_430422 ) ) ( not ( = ?auto_430421 ?auto_430422 ) ) ( ON ?auto_430420 ?auto_430421 ) ( ON ?auto_430419 ?auto_430420 ) ( ON ?auto_430418 ?auto_430419 ) ( ON ?auto_430417 ?auto_430418 ) ( ON ?auto_430416 ?auto_430417 ) ( ON ?auto_430415 ?auto_430416 ) ( CLEAR ?auto_430413 ) ( ON ?auto_430414 ?auto_430415 ) ( CLEAR ?auto_430414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_430411 ?auto_430412 ?auto_430413 ?auto_430414 )
      ( MAKE-11PILE ?auto_430411 ?auto_430412 ?auto_430413 ?auto_430414 ?auto_430415 ?auto_430416 ?auto_430417 ?auto_430418 ?auto_430419 ?auto_430420 ?auto_430421 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430457 - BLOCK
      ?auto_430458 - BLOCK
      ?auto_430459 - BLOCK
      ?auto_430460 - BLOCK
      ?auto_430461 - BLOCK
      ?auto_430462 - BLOCK
      ?auto_430463 - BLOCK
      ?auto_430464 - BLOCK
      ?auto_430465 - BLOCK
      ?auto_430466 - BLOCK
      ?auto_430467 - BLOCK
    )
    :vars
    (
      ?auto_430468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430467 ?auto_430468 ) ( ON-TABLE ?auto_430457 ) ( ON ?auto_430458 ?auto_430457 ) ( not ( = ?auto_430457 ?auto_430458 ) ) ( not ( = ?auto_430457 ?auto_430459 ) ) ( not ( = ?auto_430457 ?auto_430460 ) ) ( not ( = ?auto_430457 ?auto_430461 ) ) ( not ( = ?auto_430457 ?auto_430462 ) ) ( not ( = ?auto_430457 ?auto_430463 ) ) ( not ( = ?auto_430457 ?auto_430464 ) ) ( not ( = ?auto_430457 ?auto_430465 ) ) ( not ( = ?auto_430457 ?auto_430466 ) ) ( not ( = ?auto_430457 ?auto_430467 ) ) ( not ( = ?auto_430457 ?auto_430468 ) ) ( not ( = ?auto_430458 ?auto_430459 ) ) ( not ( = ?auto_430458 ?auto_430460 ) ) ( not ( = ?auto_430458 ?auto_430461 ) ) ( not ( = ?auto_430458 ?auto_430462 ) ) ( not ( = ?auto_430458 ?auto_430463 ) ) ( not ( = ?auto_430458 ?auto_430464 ) ) ( not ( = ?auto_430458 ?auto_430465 ) ) ( not ( = ?auto_430458 ?auto_430466 ) ) ( not ( = ?auto_430458 ?auto_430467 ) ) ( not ( = ?auto_430458 ?auto_430468 ) ) ( not ( = ?auto_430459 ?auto_430460 ) ) ( not ( = ?auto_430459 ?auto_430461 ) ) ( not ( = ?auto_430459 ?auto_430462 ) ) ( not ( = ?auto_430459 ?auto_430463 ) ) ( not ( = ?auto_430459 ?auto_430464 ) ) ( not ( = ?auto_430459 ?auto_430465 ) ) ( not ( = ?auto_430459 ?auto_430466 ) ) ( not ( = ?auto_430459 ?auto_430467 ) ) ( not ( = ?auto_430459 ?auto_430468 ) ) ( not ( = ?auto_430460 ?auto_430461 ) ) ( not ( = ?auto_430460 ?auto_430462 ) ) ( not ( = ?auto_430460 ?auto_430463 ) ) ( not ( = ?auto_430460 ?auto_430464 ) ) ( not ( = ?auto_430460 ?auto_430465 ) ) ( not ( = ?auto_430460 ?auto_430466 ) ) ( not ( = ?auto_430460 ?auto_430467 ) ) ( not ( = ?auto_430460 ?auto_430468 ) ) ( not ( = ?auto_430461 ?auto_430462 ) ) ( not ( = ?auto_430461 ?auto_430463 ) ) ( not ( = ?auto_430461 ?auto_430464 ) ) ( not ( = ?auto_430461 ?auto_430465 ) ) ( not ( = ?auto_430461 ?auto_430466 ) ) ( not ( = ?auto_430461 ?auto_430467 ) ) ( not ( = ?auto_430461 ?auto_430468 ) ) ( not ( = ?auto_430462 ?auto_430463 ) ) ( not ( = ?auto_430462 ?auto_430464 ) ) ( not ( = ?auto_430462 ?auto_430465 ) ) ( not ( = ?auto_430462 ?auto_430466 ) ) ( not ( = ?auto_430462 ?auto_430467 ) ) ( not ( = ?auto_430462 ?auto_430468 ) ) ( not ( = ?auto_430463 ?auto_430464 ) ) ( not ( = ?auto_430463 ?auto_430465 ) ) ( not ( = ?auto_430463 ?auto_430466 ) ) ( not ( = ?auto_430463 ?auto_430467 ) ) ( not ( = ?auto_430463 ?auto_430468 ) ) ( not ( = ?auto_430464 ?auto_430465 ) ) ( not ( = ?auto_430464 ?auto_430466 ) ) ( not ( = ?auto_430464 ?auto_430467 ) ) ( not ( = ?auto_430464 ?auto_430468 ) ) ( not ( = ?auto_430465 ?auto_430466 ) ) ( not ( = ?auto_430465 ?auto_430467 ) ) ( not ( = ?auto_430465 ?auto_430468 ) ) ( not ( = ?auto_430466 ?auto_430467 ) ) ( not ( = ?auto_430466 ?auto_430468 ) ) ( not ( = ?auto_430467 ?auto_430468 ) ) ( ON ?auto_430466 ?auto_430467 ) ( ON ?auto_430465 ?auto_430466 ) ( ON ?auto_430464 ?auto_430465 ) ( ON ?auto_430463 ?auto_430464 ) ( ON ?auto_430462 ?auto_430463 ) ( ON ?auto_430461 ?auto_430462 ) ( ON ?auto_430460 ?auto_430461 ) ( CLEAR ?auto_430458 ) ( ON ?auto_430459 ?auto_430460 ) ( CLEAR ?auto_430459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_430457 ?auto_430458 ?auto_430459 )
      ( MAKE-11PILE ?auto_430457 ?auto_430458 ?auto_430459 ?auto_430460 ?auto_430461 ?auto_430462 ?auto_430463 ?auto_430464 ?auto_430465 ?auto_430466 ?auto_430467 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430503 - BLOCK
      ?auto_430504 - BLOCK
      ?auto_430505 - BLOCK
      ?auto_430506 - BLOCK
      ?auto_430507 - BLOCK
      ?auto_430508 - BLOCK
      ?auto_430509 - BLOCK
      ?auto_430510 - BLOCK
      ?auto_430511 - BLOCK
      ?auto_430512 - BLOCK
      ?auto_430513 - BLOCK
    )
    :vars
    (
      ?auto_430514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430513 ?auto_430514 ) ( ON-TABLE ?auto_430503 ) ( not ( = ?auto_430503 ?auto_430504 ) ) ( not ( = ?auto_430503 ?auto_430505 ) ) ( not ( = ?auto_430503 ?auto_430506 ) ) ( not ( = ?auto_430503 ?auto_430507 ) ) ( not ( = ?auto_430503 ?auto_430508 ) ) ( not ( = ?auto_430503 ?auto_430509 ) ) ( not ( = ?auto_430503 ?auto_430510 ) ) ( not ( = ?auto_430503 ?auto_430511 ) ) ( not ( = ?auto_430503 ?auto_430512 ) ) ( not ( = ?auto_430503 ?auto_430513 ) ) ( not ( = ?auto_430503 ?auto_430514 ) ) ( not ( = ?auto_430504 ?auto_430505 ) ) ( not ( = ?auto_430504 ?auto_430506 ) ) ( not ( = ?auto_430504 ?auto_430507 ) ) ( not ( = ?auto_430504 ?auto_430508 ) ) ( not ( = ?auto_430504 ?auto_430509 ) ) ( not ( = ?auto_430504 ?auto_430510 ) ) ( not ( = ?auto_430504 ?auto_430511 ) ) ( not ( = ?auto_430504 ?auto_430512 ) ) ( not ( = ?auto_430504 ?auto_430513 ) ) ( not ( = ?auto_430504 ?auto_430514 ) ) ( not ( = ?auto_430505 ?auto_430506 ) ) ( not ( = ?auto_430505 ?auto_430507 ) ) ( not ( = ?auto_430505 ?auto_430508 ) ) ( not ( = ?auto_430505 ?auto_430509 ) ) ( not ( = ?auto_430505 ?auto_430510 ) ) ( not ( = ?auto_430505 ?auto_430511 ) ) ( not ( = ?auto_430505 ?auto_430512 ) ) ( not ( = ?auto_430505 ?auto_430513 ) ) ( not ( = ?auto_430505 ?auto_430514 ) ) ( not ( = ?auto_430506 ?auto_430507 ) ) ( not ( = ?auto_430506 ?auto_430508 ) ) ( not ( = ?auto_430506 ?auto_430509 ) ) ( not ( = ?auto_430506 ?auto_430510 ) ) ( not ( = ?auto_430506 ?auto_430511 ) ) ( not ( = ?auto_430506 ?auto_430512 ) ) ( not ( = ?auto_430506 ?auto_430513 ) ) ( not ( = ?auto_430506 ?auto_430514 ) ) ( not ( = ?auto_430507 ?auto_430508 ) ) ( not ( = ?auto_430507 ?auto_430509 ) ) ( not ( = ?auto_430507 ?auto_430510 ) ) ( not ( = ?auto_430507 ?auto_430511 ) ) ( not ( = ?auto_430507 ?auto_430512 ) ) ( not ( = ?auto_430507 ?auto_430513 ) ) ( not ( = ?auto_430507 ?auto_430514 ) ) ( not ( = ?auto_430508 ?auto_430509 ) ) ( not ( = ?auto_430508 ?auto_430510 ) ) ( not ( = ?auto_430508 ?auto_430511 ) ) ( not ( = ?auto_430508 ?auto_430512 ) ) ( not ( = ?auto_430508 ?auto_430513 ) ) ( not ( = ?auto_430508 ?auto_430514 ) ) ( not ( = ?auto_430509 ?auto_430510 ) ) ( not ( = ?auto_430509 ?auto_430511 ) ) ( not ( = ?auto_430509 ?auto_430512 ) ) ( not ( = ?auto_430509 ?auto_430513 ) ) ( not ( = ?auto_430509 ?auto_430514 ) ) ( not ( = ?auto_430510 ?auto_430511 ) ) ( not ( = ?auto_430510 ?auto_430512 ) ) ( not ( = ?auto_430510 ?auto_430513 ) ) ( not ( = ?auto_430510 ?auto_430514 ) ) ( not ( = ?auto_430511 ?auto_430512 ) ) ( not ( = ?auto_430511 ?auto_430513 ) ) ( not ( = ?auto_430511 ?auto_430514 ) ) ( not ( = ?auto_430512 ?auto_430513 ) ) ( not ( = ?auto_430512 ?auto_430514 ) ) ( not ( = ?auto_430513 ?auto_430514 ) ) ( ON ?auto_430512 ?auto_430513 ) ( ON ?auto_430511 ?auto_430512 ) ( ON ?auto_430510 ?auto_430511 ) ( ON ?auto_430509 ?auto_430510 ) ( ON ?auto_430508 ?auto_430509 ) ( ON ?auto_430507 ?auto_430508 ) ( ON ?auto_430506 ?auto_430507 ) ( ON ?auto_430505 ?auto_430506 ) ( CLEAR ?auto_430503 ) ( ON ?auto_430504 ?auto_430505 ) ( CLEAR ?auto_430504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_430503 ?auto_430504 )
      ( MAKE-11PILE ?auto_430503 ?auto_430504 ?auto_430505 ?auto_430506 ?auto_430507 ?auto_430508 ?auto_430509 ?auto_430510 ?auto_430511 ?auto_430512 ?auto_430513 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_430549 - BLOCK
      ?auto_430550 - BLOCK
      ?auto_430551 - BLOCK
      ?auto_430552 - BLOCK
      ?auto_430553 - BLOCK
      ?auto_430554 - BLOCK
      ?auto_430555 - BLOCK
      ?auto_430556 - BLOCK
      ?auto_430557 - BLOCK
      ?auto_430558 - BLOCK
      ?auto_430559 - BLOCK
    )
    :vars
    (
      ?auto_430560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430559 ?auto_430560 ) ( not ( = ?auto_430549 ?auto_430550 ) ) ( not ( = ?auto_430549 ?auto_430551 ) ) ( not ( = ?auto_430549 ?auto_430552 ) ) ( not ( = ?auto_430549 ?auto_430553 ) ) ( not ( = ?auto_430549 ?auto_430554 ) ) ( not ( = ?auto_430549 ?auto_430555 ) ) ( not ( = ?auto_430549 ?auto_430556 ) ) ( not ( = ?auto_430549 ?auto_430557 ) ) ( not ( = ?auto_430549 ?auto_430558 ) ) ( not ( = ?auto_430549 ?auto_430559 ) ) ( not ( = ?auto_430549 ?auto_430560 ) ) ( not ( = ?auto_430550 ?auto_430551 ) ) ( not ( = ?auto_430550 ?auto_430552 ) ) ( not ( = ?auto_430550 ?auto_430553 ) ) ( not ( = ?auto_430550 ?auto_430554 ) ) ( not ( = ?auto_430550 ?auto_430555 ) ) ( not ( = ?auto_430550 ?auto_430556 ) ) ( not ( = ?auto_430550 ?auto_430557 ) ) ( not ( = ?auto_430550 ?auto_430558 ) ) ( not ( = ?auto_430550 ?auto_430559 ) ) ( not ( = ?auto_430550 ?auto_430560 ) ) ( not ( = ?auto_430551 ?auto_430552 ) ) ( not ( = ?auto_430551 ?auto_430553 ) ) ( not ( = ?auto_430551 ?auto_430554 ) ) ( not ( = ?auto_430551 ?auto_430555 ) ) ( not ( = ?auto_430551 ?auto_430556 ) ) ( not ( = ?auto_430551 ?auto_430557 ) ) ( not ( = ?auto_430551 ?auto_430558 ) ) ( not ( = ?auto_430551 ?auto_430559 ) ) ( not ( = ?auto_430551 ?auto_430560 ) ) ( not ( = ?auto_430552 ?auto_430553 ) ) ( not ( = ?auto_430552 ?auto_430554 ) ) ( not ( = ?auto_430552 ?auto_430555 ) ) ( not ( = ?auto_430552 ?auto_430556 ) ) ( not ( = ?auto_430552 ?auto_430557 ) ) ( not ( = ?auto_430552 ?auto_430558 ) ) ( not ( = ?auto_430552 ?auto_430559 ) ) ( not ( = ?auto_430552 ?auto_430560 ) ) ( not ( = ?auto_430553 ?auto_430554 ) ) ( not ( = ?auto_430553 ?auto_430555 ) ) ( not ( = ?auto_430553 ?auto_430556 ) ) ( not ( = ?auto_430553 ?auto_430557 ) ) ( not ( = ?auto_430553 ?auto_430558 ) ) ( not ( = ?auto_430553 ?auto_430559 ) ) ( not ( = ?auto_430553 ?auto_430560 ) ) ( not ( = ?auto_430554 ?auto_430555 ) ) ( not ( = ?auto_430554 ?auto_430556 ) ) ( not ( = ?auto_430554 ?auto_430557 ) ) ( not ( = ?auto_430554 ?auto_430558 ) ) ( not ( = ?auto_430554 ?auto_430559 ) ) ( not ( = ?auto_430554 ?auto_430560 ) ) ( not ( = ?auto_430555 ?auto_430556 ) ) ( not ( = ?auto_430555 ?auto_430557 ) ) ( not ( = ?auto_430555 ?auto_430558 ) ) ( not ( = ?auto_430555 ?auto_430559 ) ) ( not ( = ?auto_430555 ?auto_430560 ) ) ( not ( = ?auto_430556 ?auto_430557 ) ) ( not ( = ?auto_430556 ?auto_430558 ) ) ( not ( = ?auto_430556 ?auto_430559 ) ) ( not ( = ?auto_430556 ?auto_430560 ) ) ( not ( = ?auto_430557 ?auto_430558 ) ) ( not ( = ?auto_430557 ?auto_430559 ) ) ( not ( = ?auto_430557 ?auto_430560 ) ) ( not ( = ?auto_430558 ?auto_430559 ) ) ( not ( = ?auto_430558 ?auto_430560 ) ) ( not ( = ?auto_430559 ?auto_430560 ) ) ( ON ?auto_430558 ?auto_430559 ) ( ON ?auto_430557 ?auto_430558 ) ( ON ?auto_430556 ?auto_430557 ) ( ON ?auto_430555 ?auto_430556 ) ( ON ?auto_430554 ?auto_430555 ) ( ON ?auto_430553 ?auto_430554 ) ( ON ?auto_430552 ?auto_430553 ) ( ON ?auto_430551 ?auto_430552 ) ( ON ?auto_430550 ?auto_430551 ) ( ON ?auto_430549 ?auto_430550 ) ( CLEAR ?auto_430549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_430549 )
      ( MAKE-11PILE ?auto_430549 ?auto_430550 ?auto_430551 ?auto_430552 ?auto_430553 ?auto_430554 ?auto_430555 ?auto_430556 ?auto_430557 ?auto_430558 ?auto_430559 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430596 - BLOCK
      ?auto_430597 - BLOCK
      ?auto_430598 - BLOCK
      ?auto_430599 - BLOCK
      ?auto_430600 - BLOCK
      ?auto_430601 - BLOCK
      ?auto_430602 - BLOCK
      ?auto_430603 - BLOCK
      ?auto_430604 - BLOCK
      ?auto_430605 - BLOCK
      ?auto_430606 - BLOCK
      ?auto_430607 - BLOCK
    )
    :vars
    (
      ?auto_430608 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_430606 ) ( ON ?auto_430607 ?auto_430608 ) ( CLEAR ?auto_430607 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_430596 ) ( ON ?auto_430597 ?auto_430596 ) ( ON ?auto_430598 ?auto_430597 ) ( ON ?auto_430599 ?auto_430598 ) ( ON ?auto_430600 ?auto_430599 ) ( ON ?auto_430601 ?auto_430600 ) ( ON ?auto_430602 ?auto_430601 ) ( ON ?auto_430603 ?auto_430602 ) ( ON ?auto_430604 ?auto_430603 ) ( ON ?auto_430605 ?auto_430604 ) ( ON ?auto_430606 ?auto_430605 ) ( not ( = ?auto_430596 ?auto_430597 ) ) ( not ( = ?auto_430596 ?auto_430598 ) ) ( not ( = ?auto_430596 ?auto_430599 ) ) ( not ( = ?auto_430596 ?auto_430600 ) ) ( not ( = ?auto_430596 ?auto_430601 ) ) ( not ( = ?auto_430596 ?auto_430602 ) ) ( not ( = ?auto_430596 ?auto_430603 ) ) ( not ( = ?auto_430596 ?auto_430604 ) ) ( not ( = ?auto_430596 ?auto_430605 ) ) ( not ( = ?auto_430596 ?auto_430606 ) ) ( not ( = ?auto_430596 ?auto_430607 ) ) ( not ( = ?auto_430596 ?auto_430608 ) ) ( not ( = ?auto_430597 ?auto_430598 ) ) ( not ( = ?auto_430597 ?auto_430599 ) ) ( not ( = ?auto_430597 ?auto_430600 ) ) ( not ( = ?auto_430597 ?auto_430601 ) ) ( not ( = ?auto_430597 ?auto_430602 ) ) ( not ( = ?auto_430597 ?auto_430603 ) ) ( not ( = ?auto_430597 ?auto_430604 ) ) ( not ( = ?auto_430597 ?auto_430605 ) ) ( not ( = ?auto_430597 ?auto_430606 ) ) ( not ( = ?auto_430597 ?auto_430607 ) ) ( not ( = ?auto_430597 ?auto_430608 ) ) ( not ( = ?auto_430598 ?auto_430599 ) ) ( not ( = ?auto_430598 ?auto_430600 ) ) ( not ( = ?auto_430598 ?auto_430601 ) ) ( not ( = ?auto_430598 ?auto_430602 ) ) ( not ( = ?auto_430598 ?auto_430603 ) ) ( not ( = ?auto_430598 ?auto_430604 ) ) ( not ( = ?auto_430598 ?auto_430605 ) ) ( not ( = ?auto_430598 ?auto_430606 ) ) ( not ( = ?auto_430598 ?auto_430607 ) ) ( not ( = ?auto_430598 ?auto_430608 ) ) ( not ( = ?auto_430599 ?auto_430600 ) ) ( not ( = ?auto_430599 ?auto_430601 ) ) ( not ( = ?auto_430599 ?auto_430602 ) ) ( not ( = ?auto_430599 ?auto_430603 ) ) ( not ( = ?auto_430599 ?auto_430604 ) ) ( not ( = ?auto_430599 ?auto_430605 ) ) ( not ( = ?auto_430599 ?auto_430606 ) ) ( not ( = ?auto_430599 ?auto_430607 ) ) ( not ( = ?auto_430599 ?auto_430608 ) ) ( not ( = ?auto_430600 ?auto_430601 ) ) ( not ( = ?auto_430600 ?auto_430602 ) ) ( not ( = ?auto_430600 ?auto_430603 ) ) ( not ( = ?auto_430600 ?auto_430604 ) ) ( not ( = ?auto_430600 ?auto_430605 ) ) ( not ( = ?auto_430600 ?auto_430606 ) ) ( not ( = ?auto_430600 ?auto_430607 ) ) ( not ( = ?auto_430600 ?auto_430608 ) ) ( not ( = ?auto_430601 ?auto_430602 ) ) ( not ( = ?auto_430601 ?auto_430603 ) ) ( not ( = ?auto_430601 ?auto_430604 ) ) ( not ( = ?auto_430601 ?auto_430605 ) ) ( not ( = ?auto_430601 ?auto_430606 ) ) ( not ( = ?auto_430601 ?auto_430607 ) ) ( not ( = ?auto_430601 ?auto_430608 ) ) ( not ( = ?auto_430602 ?auto_430603 ) ) ( not ( = ?auto_430602 ?auto_430604 ) ) ( not ( = ?auto_430602 ?auto_430605 ) ) ( not ( = ?auto_430602 ?auto_430606 ) ) ( not ( = ?auto_430602 ?auto_430607 ) ) ( not ( = ?auto_430602 ?auto_430608 ) ) ( not ( = ?auto_430603 ?auto_430604 ) ) ( not ( = ?auto_430603 ?auto_430605 ) ) ( not ( = ?auto_430603 ?auto_430606 ) ) ( not ( = ?auto_430603 ?auto_430607 ) ) ( not ( = ?auto_430603 ?auto_430608 ) ) ( not ( = ?auto_430604 ?auto_430605 ) ) ( not ( = ?auto_430604 ?auto_430606 ) ) ( not ( = ?auto_430604 ?auto_430607 ) ) ( not ( = ?auto_430604 ?auto_430608 ) ) ( not ( = ?auto_430605 ?auto_430606 ) ) ( not ( = ?auto_430605 ?auto_430607 ) ) ( not ( = ?auto_430605 ?auto_430608 ) ) ( not ( = ?auto_430606 ?auto_430607 ) ) ( not ( = ?auto_430606 ?auto_430608 ) ) ( not ( = ?auto_430607 ?auto_430608 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_430607 ?auto_430608 )
      ( !STACK ?auto_430607 ?auto_430606 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430646 - BLOCK
      ?auto_430647 - BLOCK
      ?auto_430648 - BLOCK
      ?auto_430649 - BLOCK
      ?auto_430650 - BLOCK
      ?auto_430651 - BLOCK
      ?auto_430652 - BLOCK
      ?auto_430653 - BLOCK
      ?auto_430654 - BLOCK
      ?auto_430655 - BLOCK
      ?auto_430656 - BLOCK
      ?auto_430657 - BLOCK
    )
    :vars
    (
      ?auto_430658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430657 ?auto_430658 ) ( ON-TABLE ?auto_430646 ) ( ON ?auto_430647 ?auto_430646 ) ( ON ?auto_430648 ?auto_430647 ) ( ON ?auto_430649 ?auto_430648 ) ( ON ?auto_430650 ?auto_430649 ) ( ON ?auto_430651 ?auto_430650 ) ( ON ?auto_430652 ?auto_430651 ) ( ON ?auto_430653 ?auto_430652 ) ( ON ?auto_430654 ?auto_430653 ) ( ON ?auto_430655 ?auto_430654 ) ( not ( = ?auto_430646 ?auto_430647 ) ) ( not ( = ?auto_430646 ?auto_430648 ) ) ( not ( = ?auto_430646 ?auto_430649 ) ) ( not ( = ?auto_430646 ?auto_430650 ) ) ( not ( = ?auto_430646 ?auto_430651 ) ) ( not ( = ?auto_430646 ?auto_430652 ) ) ( not ( = ?auto_430646 ?auto_430653 ) ) ( not ( = ?auto_430646 ?auto_430654 ) ) ( not ( = ?auto_430646 ?auto_430655 ) ) ( not ( = ?auto_430646 ?auto_430656 ) ) ( not ( = ?auto_430646 ?auto_430657 ) ) ( not ( = ?auto_430646 ?auto_430658 ) ) ( not ( = ?auto_430647 ?auto_430648 ) ) ( not ( = ?auto_430647 ?auto_430649 ) ) ( not ( = ?auto_430647 ?auto_430650 ) ) ( not ( = ?auto_430647 ?auto_430651 ) ) ( not ( = ?auto_430647 ?auto_430652 ) ) ( not ( = ?auto_430647 ?auto_430653 ) ) ( not ( = ?auto_430647 ?auto_430654 ) ) ( not ( = ?auto_430647 ?auto_430655 ) ) ( not ( = ?auto_430647 ?auto_430656 ) ) ( not ( = ?auto_430647 ?auto_430657 ) ) ( not ( = ?auto_430647 ?auto_430658 ) ) ( not ( = ?auto_430648 ?auto_430649 ) ) ( not ( = ?auto_430648 ?auto_430650 ) ) ( not ( = ?auto_430648 ?auto_430651 ) ) ( not ( = ?auto_430648 ?auto_430652 ) ) ( not ( = ?auto_430648 ?auto_430653 ) ) ( not ( = ?auto_430648 ?auto_430654 ) ) ( not ( = ?auto_430648 ?auto_430655 ) ) ( not ( = ?auto_430648 ?auto_430656 ) ) ( not ( = ?auto_430648 ?auto_430657 ) ) ( not ( = ?auto_430648 ?auto_430658 ) ) ( not ( = ?auto_430649 ?auto_430650 ) ) ( not ( = ?auto_430649 ?auto_430651 ) ) ( not ( = ?auto_430649 ?auto_430652 ) ) ( not ( = ?auto_430649 ?auto_430653 ) ) ( not ( = ?auto_430649 ?auto_430654 ) ) ( not ( = ?auto_430649 ?auto_430655 ) ) ( not ( = ?auto_430649 ?auto_430656 ) ) ( not ( = ?auto_430649 ?auto_430657 ) ) ( not ( = ?auto_430649 ?auto_430658 ) ) ( not ( = ?auto_430650 ?auto_430651 ) ) ( not ( = ?auto_430650 ?auto_430652 ) ) ( not ( = ?auto_430650 ?auto_430653 ) ) ( not ( = ?auto_430650 ?auto_430654 ) ) ( not ( = ?auto_430650 ?auto_430655 ) ) ( not ( = ?auto_430650 ?auto_430656 ) ) ( not ( = ?auto_430650 ?auto_430657 ) ) ( not ( = ?auto_430650 ?auto_430658 ) ) ( not ( = ?auto_430651 ?auto_430652 ) ) ( not ( = ?auto_430651 ?auto_430653 ) ) ( not ( = ?auto_430651 ?auto_430654 ) ) ( not ( = ?auto_430651 ?auto_430655 ) ) ( not ( = ?auto_430651 ?auto_430656 ) ) ( not ( = ?auto_430651 ?auto_430657 ) ) ( not ( = ?auto_430651 ?auto_430658 ) ) ( not ( = ?auto_430652 ?auto_430653 ) ) ( not ( = ?auto_430652 ?auto_430654 ) ) ( not ( = ?auto_430652 ?auto_430655 ) ) ( not ( = ?auto_430652 ?auto_430656 ) ) ( not ( = ?auto_430652 ?auto_430657 ) ) ( not ( = ?auto_430652 ?auto_430658 ) ) ( not ( = ?auto_430653 ?auto_430654 ) ) ( not ( = ?auto_430653 ?auto_430655 ) ) ( not ( = ?auto_430653 ?auto_430656 ) ) ( not ( = ?auto_430653 ?auto_430657 ) ) ( not ( = ?auto_430653 ?auto_430658 ) ) ( not ( = ?auto_430654 ?auto_430655 ) ) ( not ( = ?auto_430654 ?auto_430656 ) ) ( not ( = ?auto_430654 ?auto_430657 ) ) ( not ( = ?auto_430654 ?auto_430658 ) ) ( not ( = ?auto_430655 ?auto_430656 ) ) ( not ( = ?auto_430655 ?auto_430657 ) ) ( not ( = ?auto_430655 ?auto_430658 ) ) ( not ( = ?auto_430656 ?auto_430657 ) ) ( not ( = ?auto_430656 ?auto_430658 ) ) ( not ( = ?auto_430657 ?auto_430658 ) ) ( CLEAR ?auto_430655 ) ( ON ?auto_430656 ?auto_430657 ) ( CLEAR ?auto_430656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_430646 ?auto_430647 ?auto_430648 ?auto_430649 ?auto_430650 ?auto_430651 ?auto_430652 ?auto_430653 ?auto_430654 ?auto_430655 ?auto_430656 )
      ( MAKE-12PILE ?auto_430646 ?auto_430647 ?auto_430648 ?auto_430649 ?auto_430650 ?auto_430651 ?auto_430652 ?auto_430653 ?auto_430654 ?auto_430655 ?auto_430656 ?auto_430657 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430696 - BLOCK
      ?auto_430697 - BLOCK
      ?auto_430698 - BLOCK
      ?auto_430699 - BLOCK
      ?auto_430700 - BLOCK
      ?auto_430701 - BLOCK
      ?auto_430702 - BLOCK
      ?auto_430703 - BLOCK
      ?auto_430704 - BLOCK
      ?auto_430705 - BLOCK
      ?auto_430706 - BLOCK
      ?auto_430707 - BLOCK
    )
    :vars
    (
      ?auto_430708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430707 ?auto_430708 ) ( ON-TABLE ?auto_430696 ) ( ON ?auto_430697 ?auto_430696 ) ( ON ?auto_430698 ?auto_430697 ) ( ON ?auto_430699 ?auto_430698 ) ( ON ?auto_430700 ?auto_430699 ) ( ON ?auto_430701 ?auto_430700 ) ( ON ?auto_430702 ?auto_430701 ) ( ON ?auto_430703 ?auto_430702 ) ( ON ?auto_430704 ?auto_430703 ) ( not ( = ?auto_430696 ?auto_430697 ) ) ( not ( = ?auto_430696 ?auto_430698 ) ) ( not ( = ?auto_430696 ?auto_430699 ) ) ( not ( = ?auto_430696 ?auto_430700 ) ) ( not ( = ?auto_430696 ?auto_430701 ) ) ( not ( = ?auto_430696 ?auto_430702 ) ) ( not ( = ?auto_430696 ?auto_430703 ) ) ( not ( = ?auto_430696 ?auto_430704 ) ) ( not ( = ?auto_430696 ?auto_430705 ) ) ( not ( = ?auto_430696 ?auto_430706 ) ) ( not ( = ?auto_430696 ?auto_430707 ) ) ( not ( = ?auto_430696 ?auto_430708 ) ) ( not ( = ?auto_430697 ?auto_430698 ) ) ( not ( = ?auto_430697 ?auto_430699 ) ) ( not ( = ?auto_430697 ?auto_430700 ) ) ( not ( = ?auto_430697 ?auto_430701 ) ) ( not ( = ?auto_430697 ?auto_430702 ) ) ( not ( = ?auto_430697 ?auto_430703 ) ) ( not ( = ?auto_430697 ?auto_430704 ) ) ( not ( = ?auto_430697 ?auto_430705 ) ) ( not ( = ?auto_430697 ?auto_430706 ) ) ( not ( = ?auto_430697 ?auto_430707 ) ) ( not ( = ?auto_430697 ?auto_430708 ) ) ( not ( = ?auto_430698 ?auto_430699 ) ) ( not ( = ?auto_430698 ?auto_430700 ) ) ( not ( = ?auto_430698 ?auto_430701 ) ) ( not ( = ?auto_430698 ?auto_430702 ) ) ( not ( = ?auto_430698 ?auto_430703 ) ) ( not ( = ?auto_430698 ?auto_430704 ) ) ( not ( = ?auto_430698 ?auto_430705 ) ) ( not ( = ?auto_430698 ?auto_430706 ) ) ( not ( = ?auto_430698 ?auto_430707 ) ) ( not ( = ?auto_430698 ?auto_430708 ) ) ( not ( = ?auto_430699 ?auto_430700 ) ) ( not ( = ?auto_430699 ?auto_430701 ) ) ( not ( = ?auto_430699 ?auto_430702 ) ) ( not ( = ?auto_430699 ?auto_430703 ) ) ( not ( = ?auto_430699 ?auto_430704 ) ) ( not ( = ?auto_430699 ?auto_430705 ) ) ( not ( = ?auto_430699 ?auto_430706 ) ) ( not ( = ?auto_430699 ?auto_430707 ) ) ( not ( = ?auto_430699 ?auto_430708 ) ) ( not ( = ?auto_430700 ?auto_430701 ) ) ( not ( = ?auto_430700 ?auto_430702 ) ) ( not ( = ?auto_430700 ?auto_430703 ) ) ( not ( = ?auto_430700 ?auto_430704 ) ) ( not ( = ?auto_430700 ?auto_430705 ) ) ( not ( = ?auto_430700 ?auto_430706 ) ) ( not ( = ?auto_430700 ?auto_430707 ) ) ( not ( = ?auto_430700 ?auto_430708 ) ) ( not ( = ?auto_430701 ?auto_430702 ) ) ( not ( = ?auto_430701 ?auto_430703 ) ) ( not ( = ?auto_430701 ?auto_430704 ) ) ( not ( = ?auto_430701 ?auto_430705 ) ) ( not ( = ?auto_430701 ?auto_430706 ) ) ( not ( = ?auto_430701 ?auto_430707 ) ) ( not ( = ?auto_430701 ?auto_430708 ) ) ( not ( = ?auto_430702 ?auto_430703 ) ) ( not ( = ?auto_430702 ?auto_430704 ) ) ( not ( = ?auto_430702 ?auto_430705 ) ) ( not ( = ?auto_430702 ?auto_430706 ) ) ( not ( = ?auto_430702 ?auto_430707 ) ) ( not ( = ?auto_430702 ?auto_430708 ) ) ( not ( = ?auto_430703 ?auto_430704 ) ) ( not ( = ?auto_430703 ?auto_430705 ) ) ( not ( = ?auto_430703 ?auto_430706 ) ) ( not ( = ?auto_430703 ?auto_430707 ) ) ( not ( = ?auto_430703 ?auto_430708 ) ) ( not ( = ?auto_430704 ?auto_430705 ) ) ( not ( = ?auto_430704 ?auto_430706 ) ) ( not ( = ?auto_430704 ?auto_430707 ) ) ( not ( = ?auto_430704 ?auto_430708 ) ) ( not ( = ?auto_430705 ?auto_430706 ) ) ( not ( = ?auto_430705 ?auto_430707 ) ) ( not ( = ?auto_430705 ?auto_430708 ) ) ( not ( = ?auto_430706 ?auto_430707 ) ) ( not ( = ?auto_430706 ?auto_430708 ) ) ( not ( = ?auto_430707 ?auto_430708 ) ) ( ON ?auto_430706 ?auto_430707 ) ( CLEAR ?auto_430704 ) ( ON ?auto_430705 ?auto_430706 ) ( CLEAR ?auto_430705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_430696 ?auto_430697 ?auto_430698 ?auto_430699 ?auto_430700 ?auto_430701 ?auto_430702 ?auto_430703 ?auto_430704 ?auto_430705 )
      ( MAKE-12PILE ?auto_430696 ?auto_430697 ?auto_430698 ?auto_430699 ?auto_430700 ?auto_430701 ?auto_430702 ?auto_430703 ?auto_430704 ?auto_430705 ?auto_430706 ?auto_430707 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430746 - BLOCK
      ?auto_430747 - BLOCK
      ?auto_430748 - BLOCK
      ?auto_430749 - BLOCK
      ?auto_430750 - BLOCK
      ?auto_430751 - BLOCK
      ?auto_430752 - BLOCK
      ?auto_430753 - BLOCK
      ?auto_430754 - BLOCK
      ?auto_430755 - BLOCK
      ?auto_430756 - BLOCK
      ?auto_430757 - BLOCK
    )
    :vars
    (
      ?auto_430758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430757 ?auto_430758 ) ( ON-TABLE ?auto_430746 ) ( ON ?auto_430747 ?auto_430746 ) ( ON ?auto_430748 ?auto_430747 ) ( ON ?auto_430749 ?auto_430748 ) ( ON ?auto_430750 ?auto_430749 ) ( ON ?auto_430751 ?auto_430750 ) ( ON ?auto_430752 ?auto_430751 ) ( ON ?auto_430753 ?auto_430752 ) ( not ( = ?auto_430746 ?auto_430747 ) ) ( not ( = ?auto_430746 ?auto_430748 ) ) ( not ( = ?auto_430746 ?auto_430749 ) ) ( not ( = ?auto_430746 ?auto_430750 ) ) ( not ( = ?auto_430746 ?auto_430751 ) ) ( not ( = ?auto_430746 ?auto_430752 ) ) ( not ( = ?auto_430746 ?auto_430753 ) ) ( not ( = ?auto_430746 ?auto_430754 ) ) ( not ( = ?auto_430746 ?auto_430755 ) ) ( not ( = ?auto_430746 ?auto_430756 ) ) ( not ( = ?auto_430746 ?auto_430757 ) ) ( not ( = ?auto_430746 ?auto_430758 ) ) ( not ( = ?auto_430747 ?auto_430748 ) ) ( not ( = ?auto_430747 ?auto_430749 ) ) ( not ( = ?auto_430747 ?auto_430750 ) ) ( not ( = ?auto_430747 ?auto_430751 ) ) ( not ( = ?auto_430747 ?auto_430752 ) ) ( not ( = ?auto_430747 ?auto_430753 ) ) ( not ( = ?auto_430747 ?auto_430754 ) ) ( not ( = ?auto_430747 ?auto_430755 ) ) ( not ( = ?auto_430747 ?auto_430756 ) ) ( not ( = ?auto_430747 ?auto_430757 ) ) ( not ( = ?auto_430747 ?auto_430758 ) ) ( not ( = ?auto_430748 ?auto_430749 ) ) ( not ( = ?auto_430748 ?auto_430750 ) ) ( not ( = ?auto_430748 ?auto_430751 ) ) ( not ( = ?auto_430748 ?auto_430752 ) ) ( not ( = ?auto_430748 ?auto_430753 ) ) ( not ( = ?auto_430748 ?auto_430754 ) ) ( not ( = ?auto_430748 ?auto_430755 ) ) ( not ( = ?auto_430748 ?auto_430756 ) ) ( not ( = ?auto_430748 ?auto_430757 ) ) ( not ( = ?auto_430748 ?auto_430758 ) ) ( not ( = ?auto_430749 ?auto_430750 ) ) ( not ( = ?auto_430749 ?auto_430751 ) ) ( not ( = ?auto_430749 ?auto_430752 ) ) ( not ( = ?auto_430749 ?auto_430753 ) ) ( not ( = ?auto_430749 ?auto_430754 ) ) ( not ( = ?auto_430749 ?auto_430755 ) ) ( not ( = ?auto_430749 ?auto_430756 ) ) ( not ( = ?auto_430749 ?auto_430757 ) ) ( not ( = ?auto_430749 ?auto_430758 ) ) ( not ( = ?auto_430750 ?auto_430751 ) ) ( not ( = ?auto_430750 ?auto_430752 ) ) ( not ( = ?auto_430750 ?auto_430753 ) ) ( not ( = ?auto_430750 ?auto_430754 ) ) ( not ( = ?auto_430750 ?auto_430755 ) ) ( not ( = ?auto_430750 ?auto_430756 ) ) ( not ( = ?auto_430750 ?auto_430757 ) ) ( not ( = ?auto_430750 ?auto_430758 ) ) ( not ( = ?auto_430751 ?auto_430752 ) ) ( not ( = ?auto_430751 ?auto_430753 ) ) ( not ( = ?auto_430751 ?auto_430754 ) ) ( not ( = ?auto_430751 ?auto_430755 ) ) ( not ( = ?auto_430751 ?auto_430756 ) ) ( not ( = ?auto_430751 ?auto_430757 ) ) ( not ( = ?auto_430751 ?auto_430758 ) ) ( not ( = ?auto_430752 ?auto_430753 ) ) ( not ( = ?auto_430752 ?auto_430754 ) ) ( not ( = ?auto_430752 ?auto_430755 ) ) ( not ( = ?auto_430752 ?auto_430756 ) ) ( not ( = ?auto_430752 ?auto_430757 ) ) ( not ( = ?auto_430752 ?auto_430758 ) ) ( not ( = ?auto_430753 ?auto_430754 ) ) ( not ( = ?auto_430753 ?auto_430755 ) ) ( not ( = ?auto_430753 ?auto_430756 ) ) ( not ( = ?auto_430753 ?auto_430757 ) ) ( not ( = ?auto_430753 ?auto_430758 ) ) ( not ( = ?auto_430754 ?auto_430755 ) ) ( not ( = ?auto_430754 ?auto_430756 ) ) ( not ( = ?auto_430754 ?auto_430757 ) ) ( not ( = ?auto_430754 ?auto_430758 ) ) ( not ( = ?auto_430755 ?auto_430756 ) ) ( not ( = ?auto_430755 ?auto_430757 ) ) ( not ( = ?auto_430755 ?auto_430758 ) ) ( not ( = ?auto_430756 ?auto_430757 ) ) ( not ( = ?auto_430756 ?auto_430758 ) ) ( not ( = ?auto_430757 ?auto_430758 ) ) ( ON ?auto_430756 ?auto_430757 ) ( ON ?auto_430755 ?auto_430756 ) ( CLEAR ?auto_430753 ) ( ON ?auto_430754 ?auto_430755 ) ( CLEAR ?auto_430754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_430746 ?auto_430747 ?auto_430748 ?auto_430749 ?auto_430750 ?auto_430751 ?auto_430752 ?auto_430753 ?auto_430754 )
      ( MAKE-12PILE ?auto_430746 ?auto_430747 ?auto_430748 ?auto_430749 ?auto_430750 ?auto_430751 ?auto_430752 ?auto_430753 ?auto_430754 ?auto_430755 ?auto_430756 ?auto_430757 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430796 - BLOCK
      ?auto_430797 - BLOCK
      ?auto_430798 - BLOCK
      ?auto_430799 - BLOCK
      ?auto_430800 - BLOCK
      ?auto_430801 - BLOCK
      ?auto_430802 - BLOCK
      ?auto_430803 - BLOCK
      ?auto_430804 - BLOCK
      ?auto_430805 - BLOCK
      ?auto_430806 - BLOCK
      ?auto_430807 - BLOCK
    )
    :vars
    (
      ?auto_430808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430807 ?auto_430808 ) ( ON-TABLE ?auto_430796 ) ( ON ?auto_430797 ?auto_430796 ) ( ON ?auto_430798 ?auto_430797 ) ( ON ?auto_430799 ?auto_430798 ) ( ON ?auto_430800 ?auto_430799 ) ( ON ?auto_430801 ?auto_430800 ) ( ON ?auto_430802 ?auto_430801 ) ( not ( = ?auto_430796 ?auto_430797 ) ) ( not ( = ?auto_430796 ?auto_430798 ) ) ( not ( = ?auto_430796 ?auto_430799 ) ) ( not ( = ?auto_430796 ?auto_430800 ) ) ( not ( = ?auto_430796 ?auto_430801 ) ) ( not ( = ?auto_430796 ?auto_430802 ) ) ( not ( = ?auto_430796 ?auto_430803 ) ) ( not ( = ?auto_430796 ?auto_430804 ) ) ( not ( = ?auto_430796 ?auto_430805 ) ) ( not ( = ?auto_430796 ?auto_430806 ) ) ( not ( = ?auto_430796 ?auto_430807 ) ) ( not ( = ?auto_430796 ?auto_430808 ) ) ( not ( = ?auto_430797 ?auto_430798 ) ) ( not ( = ?auto_430797 ?auto_430799 ) ) ( not ( = ?auto_430797 ?auto_430800 ) ) ( not ( = ?auto_430797 ?auto_430801 ) ) ( not ( = ?auto_430797 ?auto_430802 ) ) ( not ( = ?auto_430797 ?auto_430803 ) ) ( not ( = ?auto_430797 ?auto_430804 ) ) ( not ( = ?auto_430797 ?auto_430805 ) ) ( not ( = ?auto_430797 ?auto_430806 ) ) ( not ( = ?auto_430797 ?auto_430807 ) ) ( not ( = ?auto_430797 ?auto_430808 ) ) ( not ( = ?auto_430798 ?auto_430799 ) ) ( not ( = ?auto_430798 ?auto_430800 ) ) ( not ( = ?auto_430798 ?auto_430801 ) ) ( not ( = ?auto_430798 ?auto_430802 ) ) ( not ( = ?auto_430798 ?auto_430803 ) ) ( not ( = ?auto_430798 ?auto_430804 ) ) ( not ( = ?auto_430798 ?auto_430805 ) ) ( not ( = ?auto_430798 ?auto_430806 ) ) ( not ( = ?auto_430798 ?auto_430807 ) ) ( not ( = ?auto_430798 ?auto_430808 ) ) ( not ( = ?auto_430799 ?auto_430800 ) ) ( not ( = ?auto_430799 ?auto_430801 ) ) ( not ( = ?auto_430799 ?auto_430802 ) ) ( not ( = ?auto_430799 ?auto_430803 ) ) ( not ( = ?auto_430799 ?auto_430804 ) ) ( not ( = ?auto_430799 ?auto_430805 ) ) ( not ( = ?auto_430799 ?auto_430806 ) ) ( not ( = ?auto_430799 ?auto_430807 ) ) ( not ( = ?auto_430799 ?auto_430808 ) ) ( not ( = ?auto_430800 ?auto_430801 ) ) ( not ( = ?auto_430800 ?auto_430802 ) ) ( not ( = ?auto_430800 ?auto_430803 ) ) ( not ( = ?auto_430800 ?auto_430804 ) ) ( not ( = ?auto_430800 ?auto_430805 ) ) ( not ( = ?auto_430800 ?auto_430806 ) ) ( not ( = ?auto_430800 ?auto_430807 ) ) ( not ( = ?auto_430800 ?auto_430808 ) ) ( not ( = ?auto_430801 ?auto_430802 ) ) ( not ( = ?auto_430801 ?auto_430803 ) ) ( not ( = ?auto_430801 ?auto_430804 ) ) ( not ( = ?auto_430801 ?auto_430805 ) ) ( not ( = ?auto_430801 ?auto_430806 ) ) ( not ( = ?auto_430801 ?auto_430807 ) ) ( not ( = ?auto_430801 ?auto_430808 ) ) ( not ( = ?auto_430802 ?auto_430803 ) ) ( not ( = ?auto_430802 ?auto_430804 ) ) ( not ( = ?auto_430802 ?auto_430805 ) ) ( not ( = ?auto_430802 ?auto_430806 ) ) ( not ( = ?auto_430802 ?auto_430807 ) ) ( not ( = ?auto_430802 ?auto_430808 ) ) ( not ( = ?auto_430803 ?auto_430804 ) ) ( not ( = ?auto_430803 ?auto_430805 ) ) ( not ( = ?auto_430803 ?auto_430806 ) ) ( not ( = ?auto_430803 ?auto_430807 ) ) ( not ( = ?auto_430803 ?auto_430808 ) ) ( not ( = ?auto_430804 ?auto_430805 ) ) ( not ( = ?auto_430804 ?auto_430806 ) ) ( not ( = ?auto_430804 ?auto_430807 ) ) ( not ( = ?auto_430804 ?auto_430808 ) ) ( not ( = ?auto_430805 ?auto_430806 ) ) ( not ( = ?auto_430805 ?auto_430807 ) ) ( not ( = ?auto_430805 ?auto_430808 ) ) ( not ( = ?auto_430806 ?auto_430807 ) ) ( not ( = ?auto_430806 ?auto_430808 ) ) ( not ( = ?auto_430807 ?auto_430808 ) ) ( ON ?auto_430806 ?auto_430807 ) ( ON ?auto_430805 ?auto_430806 ) ( ON ?auto_430804 ?auto_430805 ) ( CLEAR ?auto_430802 ) ( ON ?auto_430803 ?auto_430804 ) ( CLEAR ?auto_430803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_430796 ?auto_430797 ?auto_430798 ?auto_430799 ?auto_430800 ?auto_430801 ?auto_430802 ?auto_430803 )
      ( MAKE-12PILE ?auto_430796 ?auto_430797 ?auto_430798 ?auto_430799 ?auto_430800 ?auto_430801 ?auto_430802 ?auto_430803 ?auto_430804 ?auto_430805 ?auto_430806 ?auto_430807 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430846 - BLOCK
      ?auto_430847 - BLOCK
      ?auto_430848 - BLOCK
      ?auto_430849 - BLOCK
      ?auto_430850 - BLOCK
      ?auto_430851 - BLOCK
      ?auto_430852 - BLOCK
      ?auto_430853 - BLOCK
      ?auto_430854 - BLOCK
      ?auto_430855 - BLOCK
      ?auto_430856 - BLOCK
      ?auto_430857 - BLOCK
    )
    :vars
    (
      ?auto_430858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430857 ?auto_430858 ) ( ON-TABLE ?auto_430846 ) ( ON ?auto_430847 ?auto_430846 ) ( ON ?auto_430848 ?auto_430847 ) ( ON ?auto_430849 ?auto_430848 ) ( ON ?auto_430850 ?auto_430849 ) ( ON ?auto_430851 ?auto_430850 ) ( not ( = ?auto_430846 ?auto_430847 ) ) ( not ( = ?auto_430846 ?auto_430848 ) ) ( not ( = ?auto_430846 ?auto_430849 ) ) ( not ( = ?auto_430846 ?auto_430850 ) ) ( not ( = ?auto_430846 ?auto_430851 ) ) ( not ( = ?auto_430846 ?auto_430852 ) ) ( not ( = ?auto_430846 ?auto_430853 ) ) ( not ( = ?auto_430846 ?auto_430854 ) ) ( not ( = ?auto_430846 ?auto_430855 ) ) ( not ( = ?auto_430846 ?auto_430856 ) ) ( not ( = ?auto_430846 ?auto_430857 ) ) ( not ( = ?auto_430846 ?auto_430858 ) ) ( not ( = ?auto_430847 ?auto_430848 ) ) ( not ( = ?auto_430847 ?auto_430849 ) ) ( not ( = ?auto_430847 ?auto_430850 ) ) ( not ( = ?auto_430847 ?auto_430851 ) ) ( not ( = ?auto_430847 ?auto_430852 ) ) ( not ( = ?auto_430847 ?auto_430853 ) ) ( not ( = ?auto_430847 ?auto_430854 ) ) ( not ( = ?auto_430847 ?auto_430855 ) ) ( not ( = ?auto_430847 ?auto_430856 ) ) ( not ( = ?auto_430847 ?auto_430857 ) ) ( not ( = ?auto_430847 ?auto_430858 ) ) ( not ( = ?auto_430848 ?auto_430849 ) ) ( not ( = ?auto_430848 ?auto_430850 ) ) ( not ( = ?auto_430848 ?auto_430851 ) ) ( not ( = ?auto_430848 ?auto_430852 ) ) ( not ( = ?auto_430848 ?auto_430853 ) ) ( not ( = ?auto_430848 ?auto_430854 ) ) ( not ( = ?auto_430848 ?auto_430855 ) ) ( not ( = ?auto_430848 ?auto_430856 ) ) ( not ( = ?auto_430848 ?auto_430857 ) ) ( not ( = ?auto_430848 ?auto_430858 ) ) ( not ( = ?auto_430849 ?auto_430850 ) ) ( not ( = ?auto_430849 ?auto_430851 ) ) ( not ( = ?auto_430849 ?auto_430852 ) ) ( not ( = ?auto_430849 ?auto_430853 ) ) ( not ( = ?auto_430849 ?auto_430854 ) ) ( not ( = ?auto_430849 ?auto_430855 ) ) ( not ( = ?auto_430849 ?auto_430856 ) ) ( not ( = ?auto_430849 ?auto_430857 ) ) ( not ( = ?auto_430849 ?auto_430858 ) ) ( not ( = ?auto_430850 ?auto_430851 ) ) ( not ( = ?auto_430850 ?auto_430852 ) ) ( not ( = ?auto_430850 ?auto_430853 ) ) ( not ( = ?auto_430850 ?auto_430854 ) ) ( not ( = ?auto_430850 ?auto_430855 ) ) ( not ( = ?auto_430850 ?auto_430856 ) ) ( not ( = ?auto_430850 ?auto_430857 ) ) ( not ( = ?auto_430850 ?auto_430858 ) ) ( not ( = ?auto_430851 ?auto_430852 ) ) ( not ( = ?auto_430851 ?auto_430853 ) ) ( not ( = ?auto_430851 ?auto_430854 ) ) ( not ( = ?auto_430851 ?auto_430855 ) ) ( not ( = ?auto_430851 ?auto_430856 ) ) ( not ( = ?auto_430851 ?auto_430857 ) ) ( not ( = ?auto_430851 ?auto_430858 ) ) ( not ( = ?auto_430852 ?auto_430853 ) ) ( not ( = ?auto_430852 ?auto_430854 ) ) ( not ( = ?auto_430852 ?auto_430855 ) ) ( not ( = ?auto_430852 ?auto_430856 ) ) ( not ( = ?auto_430852 ?auto_430857 ) ) ( not ( = ?auto_430852 ?auto_430858 ) ) ( not ( = ?auto_430853 ?auto_430854 ) ) ( not ( = ?auto_430853 ?auto_430855 ) ) ( not ( = ?auto_430853 ?auto_430856 ) ) ( not ( = ?auto_430853 ?auto_430857 ) ) ( not ( = ?auto_430853 ?auto_430858 ) ) ( not ( = ?auto_430854 ?auto_430855 ) ) ( not ( = ?auto_430854 ?auto_430856 ) ) ( not ( = ?auto_430854 ?auto_430857 ) ) ( not ( = ?auto_430854 ?auto_430858 ) ) ( not ( = ?auto_430855 ?auto_430856 ) ) ( not ( = ?auto_430855 ?auto_430857 ) ) ( not ( = ?auto_430855 ?auto_430858 ) ) ( not ( = ?auto_430856 ?auto_430857 ) ) ( not ( = ?auto_430856 ?auto_430858 ) ) ( not ( = ?auto_430857 ?auto_430858 ) ) ( ON ?auto_430856 ?auto_430857 ) ( ON ?auto_430855 ?auto_430856 ) ( ON ?auto_430854 ?auto_430855 ) ( ON ?auto_430853 ?auto_430854 ) ( CLEAR ?auto_430851 ) ( ON ?auto_430852 ?auto_430853 ) ( CLEAR ?auto_430852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_430846 ?auto_430847 ?auto_430848 ?auto_430849 ?auto_430850 ?auto_430851 ?auto_430852 )
      ( MAKE-12PILE ?auto_430846 ?auto_430847 ?auto_430848 ?auto_430849 ?auto_430850 ?auto_430851 ?auto_430852 ?auto_430853 ?auto_430854 ?auto_430855 ?auto_430856 ?auto_430857 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430896 - BLOCK
      ?auto_430897 - BLOCK
      ?auto_430898 - BLOCK
      ?auto_430899 - BLOCK
      ?auto_430900 - BLOCK
      ?auto_430901 - BLOCK
      ?auto_430902 - BLOCK
      ?auto_430903 - BLOCK
      ?auto_430904 - BLOCK
      ?auto_430905 - BLOCK
      ?auto_430906 - BLOCK
      ?auto_430907 - BLOCK
    )
    :vars
    (
      ?auto_430908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430907 ?auto_430908 ) ( ON-TABLE ?auto_430896 ) ( ON ?auto_430897 ?auto_430896 ) ( ON ?auto_430898 ?auto_430897 ) ( ON ?auto_430899 ?auto_430898 ) ( ON ?auto_430900 ?auto_430899 ) ( not ( = ?auto_430896 ?auto_430897 ) ) ( not ( = ?auto_430896 ?auto_430898 ) ) ( not ( = ?auto_430896 ?auto_430899 ) ) ( not ( = ?auto_430896 ?auto_430900 ) ) ( not ( = ?auto_430896 ?auto_430901 ) ) ( not ( = ?auto_430896 ?auto_430902 ) ) ( not ( = ?auto_430896 ?auto_430903 ) ) ( not ( = ?auto_430896 ?auto_430904 ) ) ( not ( = ?auto_430896 ?auto_430905 ) ) ( not ( = ?auto_430896 ?auto_430906 ) ) ( not ( = ?auto_430896 ?auto_430907 ) ) ( not ( = ?auto_430896 ?auto_430908 ) ) ( not ( = ?auto_430897 ?auto_430898 ) ) ( not ( = ?auto_430897 ?auto_430899 ) ) ( not ( = ?auto_430897 ?auto_430900 ) ) ( not ( = ?auto_430897 ?auto_430901 ) ) ( not ( = ?auto_430897 ?auto_430902 ) ) ( not ( = ?auto_430897 ?auto_430903 ) ) ( not ( = ?auto_430897 ?auto_430904 ) ) ( not ( = ?auto_430897 ?auto_430905 ) ) ( not ( = ?auto_430897 ?auto_430906 ) ) ( not ( = ?auto_430897 ?auto_430907 ) ) ( not ( = ?auto_430897 ?auto_430908 ) ) ( not ( = ?auto_430898 ?auto_430899 ) ) ( not ( = ?auto_430898 ?auto_430900 ) ) ( not ( = ?auto_430898 ?auto_430901 ) ) ( not ( = ?auto_430898 ?auto_430902 ) ) ( not ( = ?auto_430898 ?auto_430903 ) ) ( not ( = ?auto_430898 ?auto_430904 ) ) ( not ( = ?auto_430898 ?auto_430905 ) ) ( not ( = ?auto_430898 ?auto_430906 ) ) ( not ( = ?auto_430898 ?auto_430907 ) ) ( not ( = ?auto_430898 ?auto_430908 ) ) ( not ( = ?auto_430899 ?auto_430900 ) ) ( not ( = ?auto_430899 ?auto_430901 ) ) ( not ( = ?auto_430899 ?auto_430902 ) ) ( not ( = ?auto_430899 ?auto_430903 ) ) ( not ( = ?auto_430899 ?auto_430904 ) ) ( not ( = ?auto_430899 ?auto_430905 ) ) ( not ( = ?auto_430899 ?auto_430906 ) ) ( not ( = ?auto_430899 ?auto_430907 ) ) ( not ( = ?auto_430899 ?auto_430908 ) ) ( not ( = ?auto_430900 ?auto_430901 ) ) ( not ( = ?auto_430900 ?auto_430902 ) ) ( not ( = ?auto_430900 ?auto_430903 ) ) ( not ( = ?auto_430900 ?auto_430904 ) ) ( not ( = ?auto_430900 ?auto_430905 ) ) ( not ( = ?auto_430900 ?auto_430906 ) ) ( not ( = ?auto_430900 ?auto_430907 ) ) ( not ( = ?auto_430900 ?auto_430908 ) ) ( not ( = ?auto_430901 ?auto_430902 ) ) ( not ( = ?auto_430901 ?auto_430903 ) ) ( not ( = ?auto_430901 ?auto_430904 ) ) ( not ( = ?auto_430901 ?auto_430905 ) ) ( not ( = ?auto_430901 ?auto_430906 ) ) ( not ( = ?auto_430901 ?auto_430907 ) ) ( not ( = ?auto_430901 ?auto_430908 ) ) ( not ( = ?auto_430902 ?auto_430903 ) ) ( not ( = ?auto_430902 ?auto_430904 ) ) ( not ( = ?auto_430902 ?auto_430905 ) ) ( not ( = ?auto_430902 ?auto_430906 ) ) ( not ( = ?auto_430902 ?auto_430907 ) ) ( not ( = ?auto_430902 ?auto_430908 ) ) ( not ( = ?auto_430903 ?auto_430904 ) ) ( not ( = ?auto_430903 ?auto_430905 ) ) ( not ( = ?auto_430903 ?auto_430906 ) ) ( not ( = ?auto_430903 ?auto_430907 ) ) ( not ( = ?auto_430903 ?auto_430908 ) ) ( not ( = ?auto_430904 ?auto_430905 ) ) ( not ( = ?auto_430904 ?auto_430906 ) ) ( not ( = ?auto_430904 ?auto_430907 ) ) ( not ( = ?auto_430904 ?auto_430908 ) ) ( not ( = ?auto_430905 ?auto_430906 ) ) ( not ( = ?auto_430905 ?auto_430907 ) ) ( not ( = ?auto_430905 ?auto_430908 ) ) ( not ( = ?auto_430906 ?auto_430907 ) ) ( not ( = ?auto_430906 ?auto_430908 ) ) ( not ( = ?auto_430907 ?auto_430908 ) ) ( ON ?auto_430906 ?auto_430907 ) ( ON ?auto_430905 ?auto_430906 ) ( ON ?auto_430904 ?auto_430905 ) ( ON ?auto_430903 ?auto_430904 ) ( ON ?auto_430902 ?auto_430903 ) ( CLEAR ?auto_430900 ) ( ON ?auto_430901 ?auto_430902 ) ( CLEAR ?auto_430901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_430896 ?auto_430897 ?auto_430898 ?auto_430899 ?auto_430900 ?auto_430901 )
      ( MAKE-12PILE ?auto_430896 ?auto_430897 ?auto_430898 ?auto_430899 ?auto_430900 ?auto_430901 ?auto_430902 ?auto_430903 ?auto_430904 ?auto_430905 ?auto_430906 ?auto_430907 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430946 - BLOCK
      ?auto_430947 - BLOCK
      ?auto_430948 - BLOCK
      ?auto_430949 - BLOCK
      ?auto_430950 - BLOCK
      ?auto_430951 - BLOCK
      ?auto_430952 - BLOCK
      ?auto_430953 - BLOCK
      ?auto_430954 - BLOCK
      ?auto_430955 - BLOCK
      ?auto_430956 - BLOCK
      ?auto_430957 - BLOCK
    )
    :vars
    (
      ?auto_430958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_430957 ?auto_430958 ) ( ON-TABLE ?auto_430946 ) ( ON ?auto_430947 ?auto_430946 ) ( ON ?auto_430948 ?auto_430947 ) ( ON ?auto_430949 ?auto_430948 ) ( not ( = ?auto_430946 ?auto_430947 ) ) ( not ( = ?auto_430946 ?auto_430948 ) ) ( not ( = ?auto_430946 ?auto_430949 ) ) ( not ( = ?auto_430946 ?auto_430950 ) ) ( not ( = ?auto_430946 ?auto_430951 ) ) ( not ( = ?auto_430946 ?auto_430952 ) ) ( not ( = ?auto_430946 ?auto_430953 ) ) ( not ( = ?auto_430946 ?auto_430954 ) ) ( not ( = ?auto_430946 ?auto_430955 ) ) ( not ( = ?auto_430946 ?auto_430956 ) ) ( not ( = ?auto_430946 ?auto_430957 ) ) ( not ( = ?auto_430946 ?auto_430958 ) ) ( not ( = ?auto_430947 ?auto_430948 ) ) ( not ( = ?auto_430947 ?auto_430949 ) ) ( not ( = ?auto_430947 ?auto_430950 ) ) ( not ( = ?auto_430947 ?auto_430951 ) ) ( not ( = ?auto_430947 ?auto_430952 ) ) ( not ( = ?auto_430947 ?auto_430953 ) ) ( not ( = ?auto_430947 ?auto_430954 ) ) ( not ( = ?auto_430947 ?auto_430955 ) ) ( not ( = ?auto_430947 ?auto_430956 ) ) ( not ( = ?auto_430947 ?auto_430957 ) ) ( not ( = ?auto_430947 ?auto_430958 ) ) ( not ( = ?auto_430948 ?auto_430949 ) ) ( not ( = ?auto_430948 ?auto_430950 ) ) ( not ( = ?auto_430948 ?auto_430951 ) ) ( not ( = ?auto_430948 ?auto_430952 ) ) ( not ( = ?auto_430948 ?auto_430953 ) ) ( not ( = ?auto_430948 ?auto_430954 ) ) ( not ( = ?auto_430948 ?auto_430955 ) ) ( not ( = ?auto_430948 ?auto_430956 ) ) ( not ( = ?auto_430948 ?auto_430957 ) ) ( not ( = ?auto_430948 ?auto_430958 ) ) ( not ( = ?auto_430949 ?auto_430950 ) ) ( not ( = ?auto_430949 ?auto_430951 ) ) ( not ( = ?auto_430949 ?auto_430952 ) ) ( not ( = ?auto_430949 ?auto_430953 ) ) ( not ( = ?auto_430949 ?auto_430954 ) ) ( not ( = ?auto_430949 ?auto_430955 ) ) ( not ( = ?auto_430949 ?auto_430956 ) ) ( not ( = ?auto_430949 ?auto_430957 ) ) ( not ( = ?auto_430949 ?auto_430958 ) ) ( not ( = ?auto_430950 ?auto_430951 ) ) ( not ( = ?auto_430950 ?auto_430952 ) ) ( not ( = ?auto_430950 ?auto_430953 ) ) ( not ( = ?auto_430950 ?auto_430954 ) ) ( not ( = ?auto_430950 ?auto_430955 ) ) ( not ( = ?auto_430950 ?auto_430956 ) ) ( not ( = ?auto_430950 ?auto_430957 ) ) ( not ( = ?auto_430950 ?auto_430958 ) ) ( not ( = ?auto_430951 ?auto_430952 ) ) ( not ( = ?auto_430951 ?auto_430953 ) ) ( not ( = ?auto_430951 ?auto_430954 ) ) ( not ( = ?auto_430951 ?auto_430955 ) ) ( not ( = ?auto_430951 ?auto_430956 ) ) ( not ( = ?auto_430951 ?auto_430957 ) ) ( not ( = ?auto_430951 ?auto_430958 ) ) ( not ( = ?auto_430952 ?auto_430953 ) ) ( not ( = ?auto_430952 ?auto_430954 ) ) ( not ( = ?auto_430952 ?auto_430955 ) ) ( not ( = ?auto_430952 ?auto_430956 ) ) ( not ( = ?auto_430952 ?auto_430957 ) ) ( not ( = ?auto_430952 ?auto_430958 ) ) ( not ( = ?auto_430953 ?auto_430954 ) ) ( not ( = ?auto_430953 ?auto_430955 ) ) ( not ( = ?auto_430953 ?auto_430956 ) ) ( not ( = ?auto_430953 ?auto_430957 ) ) ( not ( = ?auto_430953 ?auto_430958 ) ) ( not ( = ?auto_430954 ?auto_430955 ) ) ( not ( = ?auto_430954 ?auto_430956 ) ) ( not ( = ?auto_430954 ?auto_430957 ) ) ( not ( = ?auto_430954 ?auto_430958 ) ) ( not ( = ?auto_430955 ?auto_430956 ) ) ( not ( = ?auto_430955 ?auto_430957 ) ) ( not ( = ?auto_430955 ?auto_430958 ) ) ( not ( = ?auto_430956 ?auto_430957 ) ) ( not ( = ?auto_430956 ?auto_430958 ) ) ( not ( = ?auto_430957 ?auto_430958 ) ) ( ON ?auto_430956 ?auto_430957 ) ( ON ?auto_430955 ?auto_430956 ) ( ON ?auto_430954 ?auto_430955 ) ( ON ?auto_430953 ?auto_430954 ) ( ON ?auto_430952 ?auto_430953 ) ( ON ?auto_430951 ?auto_430952 ) ( CLEAR ?auto_430949 ) ( ON ?auto_430950 ?auto_430951 ) ( CLEAR ?auto_430950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_430946 ?auto_430947 ?auto_430948 ?auto_430949 ?auto_430950 )
      ( MAKE-12PILE ?auto_430946 ?auto_430947 ?auto_430948 ?auto_430949 ?auto_430950 ?auto_430951 ?auto_430952 ?auto_430953 ?auto_430954 ?auto_430955 ?auto_430956 ?auto_430957 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_430996 - BLOCK
      ?auto_430997 - BLOCK
      ?auto_430998 - BLOCK
      ?auto_430999 - BLOCK
      ?auto_431000 - BLOCK
      ?auto_431001 - BLOCK
      ?auto_431002 - BLOCK
      ?auto_431003 - BLOCK
      ?auto_431004 - BLOCK
      ?auto_431005 - BLOCK
      ?auto_431006 - BLOCK
      ?auto_431007 - BLOCK
    )
    :vars
    (
      ?auto_431008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431007 ?auto_431008 ) ( ON-TABLE ?auto_430996 ) ( ON ?auto_430997 ?auto_430996 ) ( ON ?auto_430998 ?auto_430997 ) ( not ( = ?auto_430996 ?auto_430997 ) ) ( not ( = ?auto_430996 ?auto_430998 ) ) ( not ( = ?auto_430996 ?auto_430999 ) ) ( not ( = ?auto_430996 ?auto_431000 ) ) ( not ( = ?auto_430996 ?auto_431001 ) ) ( not ( = ?auto_430996 ?auto_431002 ) ) ( not ( = ?auto_430996 ?auto_431003 ) ) ( not ( = ?auto_430996 ?auto_431004 ) ) ( not ( = ?auto_430996 ?auto_431005 ) ) ( not ( = ?auto_430996 ?auto_431006 ) ) ( not ( = ?auto_430996 ?auto_431007 ) ) ( not ( = ?auto_430996 ?auto_431008 ) ) ( not ( = ?auto_430997 ?auto_430998 ) ) ( not ( = ?auto_430997 ?auto_430999 ) ) ( not ( = ?auto_430997 ?auto_431000 ) ) ( not ( = ?auto_430997 ?auto_431001 ) ) ( not ( = ?auto_430997 ?auto_431002 ) ) ( not ( = ?auto_430997 ?auto_431003 ) ) ( not ( = ?auto_430997 ?auto_431004 ) ) ( not ( = ?auto_430997 ?auto_431005 ) ) ( not ( = ?auto_430997 ?auto_431006 ) ) ( not ( = ?auto_430997 ?auto_431007 ) ) ( not ( = ?auto_430997 ?auto_431008 ) ) ( not ( = ?auto_430998 ?auto_430999 ) ) ( not ( = ?auto_430998 ?auto_431000 ) ) ( not ( = ?auto_430998 ?auto_431001 ) ) ( not ( = ?auto_430998 ?auto_431002 ) ) ( not ( = ?auto_430998 ?auto_431003 ) ) ( not ( = ?auto_430998 ?auto_431004 ) ) ( not ( = ?auto_430998 ?auto_431005 ) ) ( not ( = ?auto_430998 ?auto_431006 ) ) ( not ( = ?auto_430998 ?auto_431007 ) ) ( not ( = ?auto_430998 ?auto_431008 ) ) ( not ( = ?auto_430999 ?auto_431000 ) ) ( not ( = ?auto_430999 ?auto_431001 ) ) ( not ( = ?auto_430999 ?auto_431002 ) ) ( not ( = ?auto_430999 ?auto_431003 ) ) ( not ( = ?auto_430999 ?auto_431004 ) ) ( not ( = ?auto_430999 ?auto_431005 ) ) ( not ( = ?auto_430999 ?auto_431006 ) ) ( not ( = ?auto_430999 ?auto_431007 ) ) ( not ( = ?auto_430999 ?auto_431008 ) ) ( not ( = ?auto_431000 ?auto_431001 ) ) ( not ( = ?auto_431000 ?auto_431002 ) ) ( not ( = ?auto_431000 ?auto_431003 ) ) ( not ( = ?auto_431000 ?auto_431004 ) ) ( not ( = ?auto_431000 ?auto_431005 ) ) ( not ( = ?auto_431000 ?auto_431006 ) ) ( not ( = ?auto_431000 ?auto_431007 ) ) ( not ( = ?auto_431000 ?auto_431008 ) ) ( not ( = ?auto_431001 ?auto_431002 ) ) ( not ( = ?auto_431001 ?auto_431003 ) ) ( not ( = ?auto_431001 ?auto_431004 ) ) ( not ( = ?auto_431001 ?auto_431005 ) ) ( not ( = ?auto_431001 ?auto_431006 ) ) ( not ( = ?auto_431001 ?auto_431007 ) ) ( not ( = ?auto_431001 ?auto_431008 ) ) ( not ( = ?auto_431002 ?auto_431003 ) ) ( not ( = ?auto_431002 ?auto_431004 ) ) ( not ( = ?auto_431002 ?auto_431005 ) ) ( not ( = ?auto_431002 ?auto_431006 ) ) ( not ( = ?auto_431002 ?auto_431007 ) ) ( not ( = ?auto_431002 ?auto_431008 ) ) ( not ( = ?auto_431003 ?auto_431004 ) ) ( not ( = ?auto_431003 ?auto_431005 ) ) ( not ( = ?auto_431003 ?auto_431006 ) ) ( not ( = ?auto_431003 ?auto_431007 ) ) ( not ( = ?auto_431003 ?auto_431008 ) ) ( not ( = ?auto_431004 ?auto_431005 ) ) ( not ( = ?auto_431004 ?auto_431006 ) ) ( not ( = ?auto_431004 ?auto_431007 ) ) ( not ( = ?auto_431004 ?auto_431008 ) ) ( not ( = ?auto_431005 ?auto_431006 ) ) ( not ( = ?auto_431005 ?auto_431007 ) ) ( not ( = ?auto_431005 ?auto_431008 ) ) ( not ( = ?auto_431006 ?auto_431007 ) ) ( not ( = ?auto_431006 ?auto_431008 ) ) ( not ( = ?auto_431007 ?auto_431008 ) ) ( ON ?auto_431006 ?auto_431007 ) ( ON ?auto_431005 ?auto_431006 ) ( ON ?auto_431004 ?auto_431005 ) ( ON ?auto_431003 ?auto_431004 ) ( ON ?auto_431002 ?auto_431003 ) ( ON ?auto_431001 ?auto_431002 ) ( ON ?auto_431000 ?auto_431001 ) ( CLEAR ?auto_430998 ) ( ON ?auto_430999 ?auto_431000 ) ( CLEAR ?auto_430999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_430996 ?auto_430997 ?auto_430998 ?auto_430999 )
      ( MAKE-12PILE ?auto_430996 ?auto_430997 ?auto_430998 ?auto_430999 ?auto_431000 ?auto_431001 ?auto_431002 ?auto_431003 ?auto_431004 ?auto_431005 ?auto_431006 ?auto_431007 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_431046 - BLOCK
      ?auto_431047 - BLOCK
      ?auto_431048 - BLOCK
      ?auto_431049 - BLOCK
      ?auto_431050 - BLOCK
      ?auto_431051 - BLOCK
      ?auto_431052 - BLOCK
      ?auto_431053 - BLOCK
      ?auto_431054 - BLOCK
      ?auto_431055 - BLOCK
      ?auto_431056 - BLOCK
      ?auto_431057 - BLOCK
    )
    :vars
    (
      ?auto_431058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431057 ?auto_431058 ) ( ON-TABLE ?auto_431046 ) ( ON ?auto_431047 ?auto_431046 ) ( not ( = ?auto_431046 ?auto_431047 ) ) ( not ( = ?auto_431046 ?auto_431048 ) ) ( not ( = ?auto_431046 ?auto_431049 ) ) ( not ( = ?auto_431046 ?auto_431050 ) ) ( not ( = ?auto_431046 ?auto_431051 ) ) ( not ( = ?auto_431046 ?auto_431052 ) ) ( not ( = ?auto_431046 ?auto_431053 ) ) ( not ( = ?auto_431046 ?auto_431054 ) ) ( not ( = ?auto_431046 ?auto_431055 ) ) ( not ( = ?auto_431046 ?auto_431056 ) ) ( not ( = ?auto_431046 ?auto_431057 ) ) ( not ( = ?auto_431046 ?auto_431058 ) ) ( not ( = ?auto_431047 ?auto_431048 ) ) ( not ( = ?auto_431047 ?auto_431049 ) ) ( not ( = ?auto_431047 ?auto_431050 ) ) ( not ( = ?auto_431047 ?auto_431051 ) ) ( not ( = ?auto_431047 ?auto_431052 ) ) ( not ( = ?auto_431047 ?auto_431053 ) ) ( not ( = ?auto_431047 ?auto_431054 ) ) ( not ( = ?auto_431047 ?auto_431055 ) ) ( not ( = ?auto_431047 ?auto_431056 ) ) ( not ( = ?auto_431047 ?auto_431057 ) ) ( not ( = ?auto_431047 ?auto_431058 ) ) ( not ( = ?auto_431048 ?auto_431049 ) ) ( not ( = ?auto_431048 ?auto_431050 ) ) ( not ( = ?auto_431048 ?auto_431051 ) ) ( not ( = ?auto_431048 ?auto_431052 ) ) ( not ( = ?auto_431048 ?auto_431053 ) ) ( not ( = ?auto_431048 ?auto_431054 ) ) ( not ( = ?auto_431048 ?auto_431055 ) ) ( not ( = ?auto_431048 ?auto_431056 ) ) ( not ( = ?auto_431048 ?auto_431057 ) ) ( not ( = ?auto_431048 ?auto_431058 ) ) ( not ( = ?auto_431049 ?auto_431050 ) ) ( not ( = ?auto_431049 ?auto_431051 ) ) ( not ( = ?auto_431049 ?auto_431052 ) ) ( not ( = ?auto_431049 ?auto_431053 ) ) ( not ( = ?auto_431049 ?auto_431054 ) ) ( not ( = ?auto_431049 ?auto_431055 ) ) ( not ( = ?auto_431049 ?auto_431056 ) ) ( not ( = ?auto_431049 ?auto_431057 ) ) ( not ( = ?auto_431049 ?auto_431058 ) ) ( not ( = ?auto_431050 ?auto_431051 ) ) ( not ( = ?auto_431050 ?auto_431052 ) ) ( not ( = ?auto_431050 ?auto_431053 ) ) ( not ( = ?auto_431050 ?auto_431054 ) ) ( not ( = ?auto_431050 ?auto_431055 ) ) ( not ( = ?auto_431050 ?auto_431056 ) ) ( not ( = ?auto_431050 ?auto_431057 ) ) ( not ( = ?auto_431050 ?auto_431058 ) ) ( not ( = ?auto_431051 ?auto_431052 ) ) ( not ( = ?auto_431051 ?auto_431053 ) ) ( not ( = ?auto_431051 ?auto_431054 ) ) ( not ( = ?auto_431051 ?auto_431055 ) ) ( not ( = ?auto_431051 ?auto_431056 ) ) ( not ( = ?auto_431051 ?auto_431057 ) ) ( not ( = ?auto_431051 ?auto_431058 ) ) ( not ( = ?auto_431052 ?auto_431053 ) ) ( not ( = ?auto_431052 ?auto_431054 ) ) ( not ( = ?auto_431052 ?auto_431055 ) ) ( not ( = ?auto_431052 ?auto_431056 ) ) ( not ( = ?auto_431052 ?auto_431057 ) ) ( not ( = ?auto_431052 ?auto_431058 ) ) ( not ( = ?auto_431053 ?auto_431054 ) ) ( not ( = ?auto_431053 ?auto_431055 ) ) ( not ( = ?auto_431053 ?auto_431056 ) ) ( not ( = ?auto_431053 ?auto_431057 ) ) ( not ( = ?auto_431053 ?auto_431058 ) ) ( not ( = ?auto_431054 ?auto_431055 ) ) ( not ( = ?auto_431054 ?auto_431056 ) ) ( not ( = ?auto_431054 ?auto_431057 ) ) ( not ( = ?auto_431054 ?auto_431058 ) ) ( not ( = ?auto_431055 ?auto_431056 ) ) ( not ( = ?auto_431055 ?auto_431057 ) ) ( not ( = ?auto_431055 ?auto_431058 ) ) ( not ( = ?auto_431056 ?auto_431057 ) ) ( not ( = ?auto_431056 ?auto_431058 ) ) ( not ( = ?auto_431057 ?auto_431058 ) ) ( ON ?auto_431056 ?auto_431057 ) ( ON ?auto_431055 ?auto_431056 ) ( ON ?auto_431054 ?auto_431055 ) ( ON ?auto_431053 ?auto_431054 ) ( ON ?auto_431052 ?auto_431053 ) ( ON ?auto_431051 ?auto_431052 ) ( ON ?auto_431050 ?auto_431051 ) ( ON ?auto_431049 ?auto_431050 ) ( CLEAR ?auto_431047 ) ( ON ?auto_431048 ?auto_431049 ) ( CLEAR ?auto_431048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_431046 ?auto_431047 ?auto_431048 )
      ( MAKE-12PILE ?auto_431046 ?auto_431047 ?auto_431048 ?auto_431049 ?auto_431050 ?auto_431051 ?auto_431052 ?auto_431053 ?auto_431054 ?auto_431055 ?auto_431056 ?auto_431057 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_431096 - BLOCK
      ?auto_431097 - BLOCK
      ?auto_431098 - BLOCK
      ?auto_431099 - BLOCK
      ?auto_431100 - BLOCK
      ?auto_431101 - BLOCK
      ?auto_431102 - BLOCK
      ?auto_431103 - BLOCK
      ?auto_431104 - BLOCK
      ?auto_431105 - BLOCK
      ?auto_431106 - BLOCK
      ?auto_431107 - BLOCK
    )
    :vars
    (
      ?auto_431108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431107 ?auto_431108 ) ( ON-TABLE ?auto_431096 ) ( not ( = ?auto_431096 ?auto_431097 ) ) ( not ( = ?auto_431096 ?auto_431098 ) ) ( not ( = ?auto_431096 ?auto_431099 ) ) ( not ( = ?auto_431096 ?auto_431100 ) ) ( not ( = ?auto_431096 ?auto_431101 ) ) ( not ( = ?auto_431096 ?auto_431102 ) ) ( not ( = ?auto_431096 ?auto_431103 ) ) ( not ( = ?auto_431096 ?auto_431104 ) ) ( not ( = ?auto_431096 ?auto_431105 ) ) ( not ( = ?auto_431096 ?auto_431106 ) ) ( not ( = ?auto_431096 ?auto_431107 ) ) ( not ( = ?auto_431096 ?auto_431108 ) ) ( not ( = ?auto_431097 ?auto_431098 ) ) ( not ( = ?auto_431097 ?auto_431099 ) ) ( not ( = ?auto_431097 ?auto_431100 ) ) ( not ( = ?auto_431097 ?auto_431101 ) ) ( not ( = ?auto_431097 ?auto_431102 ) ) ( not ( = ?auto_431097 ?auto_431103 ) ) ( not ( = ?auto_431097 ?auto_431104 ) ) ( not ( = ?auto_431097 ?auto_431105 ) ) ( not ( = ?auto_431097 ?auto_431106 ) ) ( not ( = ?auto_431097 ?auto_431107 ) ) ( not ( = ?auto_431097 ?auto_431108 ) ) ( not ( = ?auto_431098 ?auto_431099 ) ) ( not ( = ?auto_431098 ?auto_431100 ) ) ( not ( = ?auto_431098 ?auto_431101 ) ) ( not ( = ?auto_431098 ?auto_431102 ) ) ( not ( = ?auto_431098 ?auto_431103 ) ) ( not ( = ?auto_431098 ?auto_431104 ) ) ( not ( = ?auto_431098 ?auto_431105 ) ) ( not ( = ?auto_431098 ?auto_431106 ) ) ( not ( = ?auto_431098 ?auto_431107 ) ) ( not ( = ?auto_431098 ?auto_431108 ) ) ( not ( = ?auto_431099 ?auto_431100 ) ) ( not ( = ?auto_431099 ?auto_431101 ) ) ( not ( = ?auto_431099 ?auto_431102 ) ) ( not ( = ?auto_431099 ?auto_431103 ) ) ( not ( = ?auto_431099 ?auto_431104 ) ) ( not ( = ?auto_431099 ?auto_431105 ) ) ( not ( = ?auto_431099 ?auto_431106 ) ) ( not ( = ?auto_431099 ?auto_431107 ) ) ( not ( = ?auto_431099 ?auto_431108 ) ) ( not ( = ?auto_431100 ?auto_431101 ) ) ( not ( = ?auto_431100 ?auto_431102 ) ) ( not ( = ?auto_431100 ?auto_431103 ) ) ( not ( = ?auto_431100 ?auto_431104 ) ) ( not ( = ?auto_431100 ?auto_431105 ) ) ( not ( = ?auto_431100 ?auto_431106 ) ) ( not ( = ?auto_431100 ?auto_431107 ) ) ( not ( = ?auto_431100 ?auto_431108 ) ) ( not ( = ?auto_431101 ?auto_431102 ) ) ( not ( = ?auto_431101 ?auto_431103 ) ) ( not ( = ?auto_431101 ?auto_431104 ) ) ( not ( = ?auto_431101 ?auto_431105 ) ) ( not ( = ?auto_431101 ?auto_431106 ) ) ( not ( = ?auto_431101 ?auto_431107 ) ) ( not ( = ?auto_431101 ?auto_431108 ) ) ( not ( = ?auto_431102 ?auto_431103 ) ) ( not ( = ?auto_431102 ?auto_431104 ) ) ( not ( = ?auto_431102 ?auto_431105 ) ) ( not ( = ?auto_431102 ?auto_431106 ) ) ( not ( = ?auto_431102 ?auto_431107 ) ) ( not ( = ?auto_431102 ?auto_431108 ) ) ( not ( = ?auto_431103 ?auto_431104 ) ) ( not ( = ?auto_431103 ?auto_431105 ) ) ( not ( = ?auto_431103 ?auto_431106 ) ) ( not ( = ?auto_431103 ?auto_431107 ) ) ( not ( = ?auto_431103 ?auto_431108 ) ) ( not ( = ?auto_431104 ?auto_431105 ) ) ( not ( = ?auto_431104 ?auto_431106 ) ) ( not ( = ?auto_431104 ?auto_431107 ) ) ( not ( = ?auto_431104 ?auto_431108 ) ) ( not ( = ?auto_431105 ?auto_431106 ) ) ( not ( = ?auto_431105 ?auto_431107 ) ) ( not ( = ?auto_431105 ?auto_431108 ) ) ( not ( = ?auto_431106 ?auto_431107 ) ) ( not ( = ?auto_431106 ?auto_431108 ) ) ( not ( = ?auto_431107 ?auto_431108 ) ) ( ON ?auto_431106 ?auto_431107 ) ( ON ?auto_431105 ?auto_431106 ) ( ON ?auto_431104 ?auto_431105 ) ( ON ?auto_431103 ?auto_431104 ) ( ON ?auto_431102 ?auto_431103 ) ( ON ?auto_431101 ?auto_431102 ) ( ON ?auto_431100 ?auto_431101 ) ( ON ?auto_431099 ?auto_431100 ) ( ON ?auto_431098 ?auto_431099 ) ( CLEAR ?auto_431096 ) ( ON ?auto_431097 ?auto_431098 ) ( CLEAR ?auto_431097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_431096 ?auto_431097 )
      ( MAKE-12PILE ?auto_431096 ?auto_431097 ?auto_431098 ?auto_431099 ?auto_431100 ?auto_431101 ?auto_431102 ?auto_431103 ?auto_431104 ?auto_431105 ?auto_431106 ?auto_431107 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_431146 - BLOCK
      ?auto_431147 - BLOCK
      ?auto_431148 - BLOCK
      ?auto_431149 - BLOCK
      ?auto_431150 - BLOCK
      ?auto_431151 - BLOCK
      ?auto_431152 - BLOCK
      ?auto_431153 - BLOCK
      ?auto_431154 - BLOCK
      ?auto_431155 - BLOCK
      ?auto_431156 - BLOCK
      ?auto_431157 - BLOCK
    )
    :vars
    (
      ?auto_431158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431157 ?auto_431158 ) ( not ( = ?auto_431146 ?auto_431147 ) ) ( not ( = ?auto_431146 ?auto_431148 ) ) ( not ( = ?auto_431146 ?auto_431149 ) ) ( not ( = ?auto_431146 ?auto_431150 ) ) ( not ( = ?auto_431146 ?auto_431151 ) ) ( not ( = ?auto_431146 ?auto_431152 ) ) ( not ( = ?auto_431146 ?auto_431153 ) ) ( not ( = ?auto_431146 ?auto_431154 ) ) ( not ( = ?auto_431146 ?auto_431155 ) ) ( not ( = ?auto_431146 ?auto_431156 ) ) ( not ( = ?auto_431146 ?auto_431157 ) ) ( not ( = ?auto_431146 ?auto_431158 ) ) ( not ( = ?auto_431147 ?auto_431148 ) ) ( not ( = ?auto_431147 ?auto_431149 ) ) ( not ( = ?auto_431147 ?auto_431150 ) ) ( not ( = ?auto_431147 ?auto_431151 ) ) ( not ( = ?auto_431147 ?auto_431152 ) ) ( not ( = ?auto_431147 ?auto_431153 ) ) ( not ( = ?auto_431147 ?auto_431154 ) ) ( not ( = ?auto_431147 ?auto_431155 ) ) ( not ( = ?auto_431147 ?auto_431156 ) ) ( not ( = ?auto_431147 ?auto_431157 ) ) ( not ( = ?auto_431147 ?auto_431158 ) ) ( not ( = ?auto_431148 ?auto_431149 ) ) ( not ( = ?auto_431148 ?auto_431150 ) ) ( not ( = ?auto_431148 ?auto_431151 ) ) ( not ( = ?auto_431148 ?auto_431152 ) ) ( not ( = ?auto_431148 ?auto_431153 ) ) ( not ( = ?auto_431148 ?auto_431154 ) ) ( not ( = ?auto_431148 ?auto_431155 ) ) ( not ( = ?auto_431148 ?auto_431156 ) ) ( not ( = ?auto_431148 ?auto_431157 ) ) ( not ( = ?auto_431148 ?auto_431158 ) ) ( not ( = ?auto_431149 ?auto_431150 ) ) ( not ( = ?auto_431149 ?auto_431151 ) ) ( not ( = ?auto_431149 ?auto_431152 ) ) ( not ( = ?auto_431149 ?auto_431153 ) ) ( not ( = ?auto_431149 ?auto_431154 ) ) ( not ( = ?auto_431149 ?auto_431155 ) ) ( not ( = ?auto_431149 ?auto_431156 ) ) ( not ( = ?auto_431149 ?auto_431157 ) ) ( not ( = ?auto_431149 ?auto_431158 ) ) ( not ( = ?auto_431150 ?auto_431151 ) ) ( not ( = ?auto_431150 ?auto_431152 ) ) ( not ( = ?auto_431150 ?auto_431153 ) ) ( not ( = ?auto_431150 ?auto_431154 ) ) ( not ( = ?auto_431150 ?auto_431155 ) ) ( not ( = ?auto_431150 ?auto_431156 ) ) ( not ( = ?auto_431150 ?auto_431157 ) ) ( not ( = ?auto_431150 ?auto_431158 ) ) ( not ( = ?auto_431151 ?auto_431152 ) ) ( not ( = ?auto_431151 ?auto_431153 ) ) ( not ( = ?auto_431151 ?auto_431154 ) ) ( not ( = ?auto_431151 ?auto_431155 ) ) ( not ( = ?auto_431151 ?auto_431156 ) ) ( not ( = ?auto_431151 ?auto_431157 ) ) ( not ( = ?auto_431151 ?auto_431158 ) ) ( not ( = ?auto_431152 ?auto_431153 ) ) ( not ( = ?auto_431152 ?auto_431154 ) ) ( not ( = ?auto_431152 ?auto_431155 ) ) ( not ( = ?auto_431152 ?auto_431156 ) ) ( not ( = ?auto_431152 ?auto_431157 ) ) ( not ( = ?auto_431152 ?auto_431158 ) ) ( not ( = ?auto_431153 ?auto_431154 ) ) ( not ( = ?auto_431153 ?auto_431155 ) ) ( not ( = ?auto_431153 ?auto_431156 ) ) ( not ( = ?auto_431153 ?auto_431157 ) ) ( not ( = ?auto_431153 ?auto_431158 ) ) ( not ( = ?auto_431154 ?auto_431155 ) ) ( not ( = ?auto_431154 ?auto_431156 ) ) ( not ( = ?auto_431154 ?auto_431157 ) ) ( not ( = ?auto_431154 ?auto_431158 ) ) ( not ( = ?auto_431155 ?auto_431156 ) ) ( not ( = ?auto_431155 ?auto_431157 ) ) ( not ( = ?auto_431155 ?auto_431158 ) ) ( not ( = ?auto_431156 ?auto_431157 ) ) ( not ( = ?auto_431156 ?auto_431158 ) ) ( not ( = ?auto_431157 ?auto_431158 ) ) ( ON ?auto_431156 ?auto_431157 ) ( ON ?auto_431155 ?auto_431156 ) ( ON ?auto_431154 ?auto_431155 ) ( ON ?auto_431153 ?auto_431154 ) ( ON ?auto_431152 ?auto_431153 ) ( ON ?auto_431151 ?auto_431152 ) ( ON ?auto_431150 ?auto_431151 ) ( ON ?auto_431149 ?auto_431150 ) ( ON ?auto_431148 ?auto_431149 ) ( ON ?auto_431147 ?auto_431148 ) ( ON ?auto_431146 ?auto_431147 ) ( CLEAR ?auto_431146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_431146 )
      ( MAKE-12PILE ?auto_431146 ?auto_431147 ?auto_431148 ?auto_431149 ?auto_431150 ?auto_431151 ?auto_431152 ?auto_431153 ?auto_431154 ?auto_431155 ?auto_431156 ?auto_431157 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431197 - BLOCK
      ?auto_431198 - BLOCK
      ?auto_431199 - BLOCK
      ?auto_431200 - BLOCK
      ?auto_431201 - BLOCK
      ?auto_431202 - BLOCK
      ?auto_431203 - BLOCK
      ?auto_431204 - BLOCK
      ?auto_431205 - BLOCK
      ?auto_431206 - BLOCK
      ?auto_431207 - BLOCK
      ?auto_431208 - BLOCK
      ?auto_431209 - BLOCK
    )
    :vars
    (
      ?auto_431210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_431208 ) ( ON ?auto_431209 ?auto_431210 ) ( CLEAR ?auto_431209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_431197 ) ( ON ?auto_431198 ?auto_431197 ) ( ON ?auto_431199 ?auto_431198 ) ( ON ?auto_431200 ?auto_431199 ) ( ON ?auto_431201 ?auto_431200 ) ( ON ?auto_431202 ?auto_431201 ) ( ON ?auto_431203 ?auto_431202 ) ( ON ?auto_431204 ?auto_431203 ) ( ON ?auto_431205 ?auto_431204 ) ( ON ?auto_431206 ?auto_431205 ) ( ON ?auto_431207 ?auto_431206 ) ( ON ?auto_431208 ?auto_431207 ) ( not ( = ?auto_431197 ?auto_431198 ) ) ( not ( = ?auto_431197 ?auto_431199 ) ) ( not ( = ?auto_431197 ?auto_431200 ) ) ( not ( = ?auto_431197 ?auto_431201 ) ) ( not ( = ?auto_431197 ?auto_431202 ) ) ( not ( = ?auto_431197 ?auto_431203 ) ) ( not ( = ?auto_431197 ?auto_431204 ) ) ( not ( = ?auto_431197 ?auto_431205 ) ) ( not ( = ?auto_431197 ?auto_431206 ) ) ( not ( = ?auto_431197 ?auto_431207 ) ) ( not ( = ?auto_431197 ?auto_431208 ) ) ( not ( = ?auto_431197 ?auto_431209 ) ) ( not ( = ?auto_431197 ?auto_431210 ) ) ( not ( = ?auto_431198 ?auto_431199 ) ) ( not ( = ?auto_431198 ?auto_431200 ) ) ( not ( = ?auto_431198 ?auto_431201 ) ) ( not ( = ?auto_431198 ?auto_431202 ) ) ( not ( = ?auto_431198 ?auto_431203 ) ) ( not ( = ?auto_431198 ?auto_431204 ) ) ( not ( = ?auto_431198 ?auto_431205 ) ) ( not ( = ?auto_431198 ?auto_431206 ) ) ( not ( = ?auto_431198 ?auto_431207 ) ) ( not ( = ?auto_431198 ?auto_431208 ) ) ( not ( = ?auto_431198 ?auto_431209 ) ) ( not ( = ?auto_431198 ?auto_431210 ) ) ( not ( = ?auto_431199 ?auto_431200 ) ) ( not ( = ?auto_431199 ?auto_431201 ) ) ( not ( = ?auto_431199 ?auto_431202 ) ) ( not ( = ?auto_431199 ?auto_431203 ) ) ( not ( = ?auto_431199 ?auto_431204 ) ) ( not ( = ?auto_431199 ?auto_431205 ) ) ( not ( = ?auto_431199 ?auto_431206 ) ) ( not ( = ?auto_431199 ?auto_431207 ) ) ( not ( = ?auto_431199 ?auto_431208 ) ) ( not ( = ?auto_431199 ?auto_431209 ) ) ( not ( = ?auto_431199 ?auto_431210 ) ) ( not ( = ?auto_431200 ?auto_431201 ) ) ( not ( = ?auto_431200 ?auto_431202 ) ) ( not ( = ?auto_431200 ?auto_431203 ) ) ( not ( = ?auto_431200 ?auto_431204 ) ) ( not ( = ?auto_431200 ?auto_431205 ) ) ( not ( = ?auto_431200 ?auto_431206 ) ) ( not ( = ?auto_431200 ?auto_431207 ) ) ( not ( = ?auto_431200 ?auto_431208 ) ) ( not ( = ?auto_431200 ?auto_431209 ) ) ( not ( = ?auto_431200 ?auto_431210 ) ) ( not ( = ?auto_431201 ?auto_431202 ) ) ( not ( = ?auto_431201 ?auto_431203 ) ) ( not ( = ?auto_431201 ?auto_431204 ) ) ( not ( = ?auto_431201 ?auto_431205 ) ) ( not ( = ?auto_431201 ?auto_431206 ) ) ( not ( = ?auto_431201 ?auto_431207 ) ) ( not ( = ?auto_431201 ?auto_431208 ) ) ( not ( = ?auto_431201 ?auto_431209 ) ) ( not ( = ?auto_431201 ?auto_431210 ) ) ( not ( = ?auto_431202 ?auto_431203 ) ) ( not ( = ?auto_431202 ?auto_431204 ) ) ( not ( = ?auto_431202 ?auto_431205 ) ) ( not ( = ?auto_431202 ?auto_431206 ) ) ( not ( = ?auto_431202 ?auto_431207 ) ) ( not ( = ?auto_431202 ?auto_431208 ) ) ( not ( = ?auto_431202 ?auto_431209 ) ) ( not ( = ?auto_431202 ?auto_431210 ) ) ( not ( = ?auto_431203 ?auto_431204 ) ) ( not ( = ?auto_431203 ?auto_431205 ) ) ( not ( = ?auto_431203 ?auto_431206 ) ) ( not ( = ?auto_431203 ?auto_431207 ) ) ( not ( = ?auto_431203 ?auto_431208 ) ) ( not ( = ?auto_431203 ?auto_431209 ) ) ( not ( = ?auto_431203 ?auto_431210 ) ) ( not ( = ?auto_431204 ?auto_431205 ) ) ( not ( = ?auto_431204 ?auto_431206 ) ) ( not ( = ?auto_431204 ?auto_431207 ) ) ( not ( = ?auto_431204 ?auto_431208 ) ) ( not ( = ?auto_431204 ?auto_431209 ) ) ( not ( = ?auto_431204 ?auto_431210 ) ) ( not ( = ?auto_431205 ?auto_431206 ) ) ( not ( = ?auto_431205 ?auto_431207 ) ) ( not ( = ?auto_431205 ?auto_431208 ) ) ( not ( = ?auto_431205 ?auto_431209 ) ) ( not ( = ?auto_431205 ?auto_431210 ) ) ( not ( = ?auto_431206 ?auto_431207 ) ) ( not ( = ?auto_431206 ?auto_431208 ) ) ( not ( = ?auto_431206 ?auto_431209 ) ) ( not ( = ?auto_431206 ?auto_431210 ) ) ( not ( = ?auto_431207 ?auto_431208 ) ) ( not ( = ?auto_431207 ?auto_431209 ) ) ( not ( = ?auto_431207 ?auto_431210 ) ) ( not ( = ?auto_431208 ?auto_431209 ) ) ( not ( = ?auto_431208 ?auto_431210 ) ) ( not ( = ?auto_431209 ?auto_431210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_431209 ?auto_431210 )
      ( !STACK ?auto_431209 ?auto_431208 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431251 - BLOCK
      ?auto_431252 - BLOCK
      ?auto_431253 - BLOCK
      ?auto_431254 - BLOCK
      ?auto_431255 - BLOCK
      ?auto_431256 - BLOCK
      ?auto_431257 - BLOCK
      ?auto_431258 - BLOCK
      ?auto_431259 - BLOCK
      ?auto_431260 - BLOCK
      ?auto_431261 - BLOCK
      ?auto_431262 - BLOCK
      ?auto_431263 - BLOCK
    )
    :vars
    (
      ?auto_431264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431263 ?auto_431264 ) ( ON-TABLE ?auto_431251 ) ( ON ?auto_431252 ?auto_431251 ) ( ON ?auto_431253 ?auto_431252 ) ( ON ?auto_431254 ?auto_431253 ) ( ON ?auto_431255 ?auto_431254 ) ( ON ?auto_431256 ?auto_431255 ) ( ON ?auto_431257 ?auto_431256 ) ( ON ?auto_431258 ?auto_431257 ) ( ON ?auto_431259 ?auto_431258 ) ( ON ?auto_431260 ?auto_431259 ) ( ON ?auto_431261 ?auto_431260 ) ( not ( = ?auto_431251 ?auto_431252 ) ) ( not ( = ?auto_431251 ?auto_431253 ) ) ( not ( = ?auto_431251 ?auto_431254 ) ) ( not ( = ?auto_431251 ?auto_431255 ) ) ( not ( = ?auto_431251 ?auto_431256 ) ) ( not ( = ?auto_431251 ?auto_431257 ) ) ( not ( = ?auto_431251 ?auto_431258 ) ) ( not ( = ?auto_431251 ?auto_431259 ) ) ( not ( = ?auto_431251 ?auto_431260 ) ) ( not ( = ?auto_431251 ?auto_431261 ) ) ( not ( = ?auto_431251 ?auto_431262 ) ) ( not ( = ?auto_431251 ?auto_431263 ) ) ( not ( = ?auto_431251 ?auto_431264 ) ) ( not ( = ?auto_431252 ?auto_431253 ) ) ( not ( = ?auto_431252 ?auto_431254 ) ) ( not ( = ?auto_431252 ?auto_431255 ) ) ( not ( = ?auto_431252 ?auto_431256 ) ) ( not ( = ?auto_431252 ?auto_431257 ) ) ( not ( = ?auto_431252 ?auto_431258 ) ) ( not ( = ?auto_431252 ?auto_431259 ) ) ( not ( = ?auto_431252 ?auto_431260 ) ) ( not ( = ?auto_431252 ?auto_431261 ) ) ( not ( = ?auto_431252 ?auto_431262 ) ) ( not ( = ?auto_431252 ?auto_431263 ) ) ( not ( = ?auto_431252 ?auto_431264 ) ) ( not ( = ?auto_431253 ?auto_431254 ) ) ( not ( = ?auto_431253 ?auto_431255 ) ) ( not ( = ?auto_431253 ?auto_431256 ) ) ( not ( = ?auto_431253 ?auto_431257 ) ) ( not ( = ?auto_431253 ?auto_431258 ) ) ( not ( = ?auto_431253 ?auto_431259 ) ) ( not ( = ?auto_431253 ?auto_431260 ) ) ( not ( = ?auto_431253 ?auto_431261 ) ) ( not ( = ?auto_431253 ?auto_431262 ) ) ( not ( = ?auto_431253 ?auto_431263 ) ) ( not ( = ?auto_431253 ?auto_431264 ) ) ( not ( = ?auto_431254 ?auto_431255 ) ) ( not ( = ?auto_431254 ?auto_431256 ) ) ( not ( = ?auto_431254 ?auto_431257 ) ) ( not ( = ?auto_431254 ?auto_431258 ) ) ( not ( = ?auto_431254 ?auto_431259 ) ) ( not ( = ?auto_431254 ?auto_431260 ) ) ( not ( = ?auto_431254 ?auto_431261 ) ) ( not ( = ?auto_431254 ?auto_431262 ) ) ( not ( = ?auto_431254 ?auto_431263 ) ) ( not ( = ?auto_431254 ?auto_431264 ) ) ( not ( = ?auto_431255 ?auto_431256 ) ) ( not ( = ?auto_431255 ?auto_431257 ) ) ( not ( = ?auto_431255 ?auto_431258 ) ) ( not ( = ?auto_431255 ?auto_431259 ) ) ( not ( = ?auto_431255 ?auto_431260 ) ) ( not ( = ?auto_431255 ?auto_431261 ) ) ( not ( = ?auto_431255 ?auto_431262 ) ) ( not ( = ?auto_431255 ?auto_431263 ) ) ( not ( = ?auto_431255 ?auto_431264 ) ) ( not ( = ?auto_431256 ?auto_431257 ) ) ( not ( = ?auto_431256 ?auto_431258 ) ) ( not ( = ?auto_431256 ?auto_431259 ) ) ( not ( = ?auto_431256 ?auto_431260 ) ) ( not ( = ?auto_431256 ?auto_431261 ) ) ( not ( = ?auto_431256 ?auto_431262 ) ) ( not ( = ?auto_431256 ?auto_431263 ) ) ( not ( = ?auto_431256 ?auto_431264 ) ) ( not ( = ?auto_431257 ?auto_431258 ) ) ( not ( = ?auto_431257 ?auto_431259 ) ) ( not ( = ?auto_431257 ?auto_431260 ) ) ( not ( = ?auto_431257 ?auto_431261 ) ) ( not ( = ?auto_431257 ?auto_431262 ) ) ( not ( = ?auto_431257 ?auto_431263 ) ) ( not ( = ?auto_431257 ?auto_431264 ) ) ( not ( = ?auto_431258 ?auto_431259 ) ) ( not ( = ?auto_431258 ?auto_431260 ) ) ( not ( = ?auto_431258 ?auto_431261 ) ) ( not ( = ?auto_431258 ?auto_431262 ) ) ( not ( = ?auto_431258 ?auto_431263 ) ) ( not ( = ?auto_431258 ?auto_431264 ) ) ( not ( = ?auto_431259 ?auto_431260 ) ) ( not ( = ?auto_431259 ?auto_431261 ) ) ( not ( = ?auto_431259 ?auto_431262 ) ) ( not ( = ?auto_431259 ?auto_431263 ) ) ( not ( = ?auto_431259 ?auto_431264 ) ) ( not ( = ?auto_431260 ?auto_431261 ) ) ( not ( = ?auto_431260 ?auto_431262 ) ) ( not ( = ?auto_431260 ?auto_431263 ) ) ( not ( = ?auto_431260 ?auto_431264 ) ) ( not ( = ?auto_431261 ?auto_431262 ) ) ( not ( = ?auto_431261 ?auto_431263 ) ) ( not ( = ?auto_431261 ?auto_431264 ) ) ( not ( = ?auto_431262 ?auto_431263 ) ) ( not ( = ?auto_431262 ?auto_431264 ) ) ( not ( = ?auto_431263 ?auto_431264 ) ) ( CLEAR ?auto_431261 ) ( ON ?auto_431262 ?auto_431263 ) ( CLEAR ?auto_431262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_431251 ?auto_431252 ?auto_431253 ?auto_431254 ?auto_431255 ?auto_431256 ?auto_431257 ?auto_431258 ?auto_431259 ?auto_431260 ?auto_431261 ?auto_431262 )
      ( MAKE-13PILE ?auto_431251 ?auto_431252 ?auto_431253 ?auto_431254 ?auto_431255 ?auto_431256 ?auto_431257 ?auto_431258 ?auto_431259 ?auto_431260 ?auto_431261 ?auto_431262 ?auto_431263 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431305 - BLOCK
      ?auto_431306 - BLOCK
      ?auto_431307 - BLOCK
      ?auto_431308 - BLOCK
      ?auto_431309 - BLOCK
      ?auto_431310 - BLOCK
      ?auto_431311 - BLOCK
      ?auto_431312 - BLOCK
      ?auto_431313 - BLOCK
      ?auto_431314 - BLOCK
      ?auto_431315 - BLOCK
      ?auto_431316 - BLOCK
      ?auto_431317 - BLOCK
    )
    :vars
    (
      ?auto_431318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431317 ?auto_431318 ) ( ON-TABLE ?auto_431305 ) ( ON ?auto_431306 ?auto_431305 ) ( ON ?auto_431307 ?auto_431306 ) ( ON ?auto_431308 ?auto_431307 ) ( ON ?auto_431309 ?auto_431308 ) ( ON ?auto_431310 ?auto_431309 ) ( ON ?auto_431311 ?auto_431310 ) ( ON ?auto_431312 ?auto_431311 ) ( ON ?auto_431313 ?auto_431312 ) ( ON ?auto_431314 ?auto_431313 ) ( not ( = ?auto_431305 ?auto_431306 ) ) ( not ( = ?auto_431305 ?auto_431307 ) ) ( not ( = ?auto_431305 ?auto_431308 ) ) ( not ( = ?auto_431305 ?auto_431309 ) ) ( not ( = ?auto_431305 ?auto_431310 ) ) ( not ( = ?auto_431305 ?auto_431311 ) ) ( not ( = ?auto_431305 ?auto_431312 ) ) ( not ( = ?auto_431305 ?auto_431313 ) ) ( not ( = ?auto_431305 ?auto_431314 ) ) ( not ( = ?auto_431305 ?auto_431315 ) ) ( not ( = ?auto_431305 ?auto_431316 ) ) ( not ( = ?auto_431305 ?auto_431317 ) ) ( not ( = ?auto_431305 ?auto_431318 ) ) ( not ( = ?auto_431306 ?auto_431307 ) ) ( not ( = ?auto_431306 ?auto_431308 ) ) ( not ( = ?auto_431306 ?auto_431309 ) ) ( not ( = ?auto_431306 ?auto_431310 ) ) ( not ( = ?auto_431306 ?auto_431311 ) ) ( not ( = ?auto_431306 ?auto_431312 ) ) ( not ( = ?auto_431306 ?auto_431313 ) ) ( not ( = ?auto_431306 ?auto_431314 ) ) ( not ( = ?auto_431306 ?auto_431315 ) ) ( not ( = ?auto_431306 ?auto_431316 ) ) ( not ( = ?auto_431306 ?auto_431317 ) ) ( not ( = ?auto_431306 ?auto_431318 ) ) ( not ( = ?auto_431307 ?auto_431308 ) ) ( not ( = ?auto_431307 ?auto_431309 ) ) ( not ( = ?auto_431307 ?auto_431310 ) ) ( not ( = ?auto_431307 ?auto_431311 ) ) ( not ( = ?auto_431307 ?auto_431312 ) ) ( not ( = ?auto_431307 ?auto_431313 ) ) ( not ( = ?auto_431307 ?auto_431314 ) ) ( not ( = ?auto_431307 ?auto_431315 ) ) ( not ( = ?auto_431307 ?auto_431316 ) ) ( not ( = ?auto_431307 ?auto_431317 ) ) ( not ( = ?auto_431307 ?auto_431318 ) ) ( not ( = ?auto_431308 ?auto_431309 ) ) ( not ( = ?auto_431308 ?auto_431310 ) ) ( not ( = ?auto_431308 ?auto_431311 ) ) ( not ( = ?auto_431308 ?auto_431312 ) ) ( not ( = ?auto_431308 ?auto_431313 ) ) ( not ( = ?auto_431308 ?auto_431314 ) ) ( not ( = ?auto_431308 ?auto_431315 ) ) ( not ( = ?auto_431308 ?auto_431316 ) ) ( not ( = ?auto_431308 ?auto_431317 ) ) ( not ( = ?auto_431308 ?auto_431318 ) ) ( not ( = ?auto_431309 ?auto_431310 ) ) ( not ( = ?auto_431309 ?auto_431311 ) ) ( not ( = ?auto_431309 ?auto_431312 ) ) ( not ( = ?auto_431309 ?auto_431313 ) ) ( not ( = ?auto_431309 ?auto_431314 ) ) ( not ( = ?auto_431309 ?auto_431315 ) ) ( not ( = ?auto_431309 ?auto_431316 ) ) ( not ( = ?auto_431309 ?auto_431317 ) ) ( not ( = ?auto_431309 ?auto_431318 ) ) ( not ( = ?auto_431310 ?auto_431311 ) ) ( not ( = ?auto_431310 ?auto_431312 ) ) ( not ( = ?auto_431310 ?auto_431313 ) ) ( not ( = ?auto_431310 ?auto_431314 ) ) ( not ( = ?auto_431310 ?auto_431315 ) ) ( not ( = ?auto_431310 ?auto_431316 ) ) ( not ( = ?auto_431310 ?auto_431317 ) ) ( not ( = ?auto_431310 ?auto_431318 ) ) ( not ( = ?auto_431311 ?auto_431312 ) ) ( not ( = ?auto_431311 ?auto_431313 ) ) ( not ( = ?auto_431311 ?auto_431314 ) ) ( not ( = ?auto_431311 ?auto_431315 ) ) ( not ( = ?auto_431311 ?auto_431316 ) ) ( not ( = ?auto_431311 ?auto_431317 ) ) ( not ( = ?auto_431311 ?auto_431318 ) ) ( not ( = ?auto_431312 ?auto_431313 ) ) ( not ( = ?auto_431312 ?auto_431314 ) ) ( not ( = ?auto_431312 ?auto_431315 ) ) ( not ( = ?auto_431312 ?auto_431316 ) ) ( not ( = ?auto_431312 ?auto_431317 ) ) ( not ( = ?auto_431312 ?auto_431318 ) ) ( not ( = ?auto_431313 ?auto_431314 ) ) ( not ( = ?auto_431313 ?auto_431315 ) ) ( not ( = ?auto_431313 ?auto_431316 ) ) ( not ( = ?auto_431313 ?auto_431317 ) ) ( not ( = ?auto_431313 ?auto_431318 ) ) ( not ( = ?auto_431314 ?auto_431315 ) ) ( not ( = ?auto_431314 ?auto_431316 ) ) ( not ( = ?auto_431314 ?auto_431317 ) ) ( not ( = ?auto_431314 ?auto_431318 ) ) ( not ( = ?auto_431315 ?auto_431316 ) ) ( not ( = ?auto_431315 ?auto_431317 ) ) ( not ( = ?auto_431315 ?auto_431318 ) ) ( not ( = ?auto_431316 ?auto_431317 ) ) ( not ( = ?auto_431316 ?auto_431318 ) ) ( not ( = ?auto_431317 ?auto_431318 ) ) ( ON ?auto_431316 ?auto_431317 ) ( CLEAR ?auto_431314 ) ( ON ?auto_431315 ?auto_431316 ) ( CLEAR ?auto_431315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_431305 ?auto_431306 ?auto_431307 ?auto_431308 ?auto_431309 ?auto_431310 ?auto_431311 ?auto_431312 ?auto_431313 ?auto_431314 ?auto_431315 )
      ( MAKE-13PILE ?auto_431305 ?auto_431306 ?auto_431307 ?auto_431308 ?auto_431309 ?auto_431310 ?auto_431311 ?auto_431312 ?auto_431313 ?auto_431314 ?auto_431315 ?auto_431316 ?auto_431317 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431359 - BLOCK
      ?auto_431360 - BLOCK
      ?auto_431361 - BLOCK
      ?auto_431362 - BLOCK
      ?auto_431363 - BLOCK
      ?auto_431364 - BLOCK
      ?auto_431365 - BLOCK
      ?auto_431366 - BLOCK
      ?auto_431367 - BLOCK
      ?auto_431368 - BLOCK
      ?auto_431369 - BLOCK
      ?auto_431370 - BLOCK
      ?auto_431371 - BLOCK
    )
    :vars
    (
      ?auto_431372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431371 ?auto_431372 ) ( ON-TABLE ?auto_431359 ) ( ON ?auto_431360 ?auto_431359 ) ( ON ?auto_431361 ?auto_431360 ) ( ON ?auto_431362 ?auto_431361 ) ( ON ?auto_431363 ?auto_431362 ) ( ON ?auto_431364 ?auto_431363 ) ( ON ?auto_431365 ?auto_431364 ) ( ON ?auto_431366 ?auto_431365 ) ( ON ?auto_431367 ?auto_431366 ) ( not ( = ?auto_431359 ?auto_431360 ) ) ( not ( = ?auto_431359 ?auto_431361 ) ) ( not ( = ?auto_431359 ?auto_431362 ) ) ( not ( = ?auto_431359 ?auto_431363 ) ) ( not ( = ?auto_431359 ?auto_431364 ) ) ( not ( = ?auto_431359 ?auto_431365 ) ) ( not ( = ?auto_431359 ?auto_431366 ) ) ( not ( = ?auto_431359 ?auto_431367 ) ) ( not ( = ?auto_431359 ?auto_431368 ) ) ( not ( = ?auto_431359 ?auto_431369 ) ) ( not ( = ?auto_431359 ?auto_431370 ) ) ( not ( = ?auto_431359 ?auto_431371 ) ) ( not ( = ?auto_431359 ?auto_431372 ) ) ( not ( = ?auto_431360 ?auto_431361 ) ) ( not ( = ?auto_431360 ?auto_431362 ) ) ( not ( = ?auto_431360 ?auto_431363 ) ) ( not ( = ?auto_431360 ?auto_431364 ) ) ( not ( = ?auto_431360 ?auto_431365 ) ) ( not ( = ?auto_431360 ?auto_431366 ) ) ( not ( = ?auto_431360 ?auto_431367 ) ) ( not ( = ?auto_431360 ?auto_431368 ) ) ( not ( = ?auto_431360 ?auto_431369 ) ) ( not ( = ?auto_431360 ?auto_431370 ) ) ( not ( = ?auto_431360 ?auto_431371 ) ) ( not ( = ?auto_431360 ?auto_431372 ) ) ( not ( = ?auto_431361 ?auto_431362 ) ) ( not ( = ?auto_431361 ?auto_431363 ) ) ( not ( = ?auto_431361 ?auto_431364 ) ) ( not ( = ?auto_431361 ?auto_431365 ) ) ( not ( = ?auto_431361 ?auto_431366 ) ) ( not ( = ?auto_431361 ?auto_431367 ) ) ( not ( = ?auto_431361 ?auto_431368 ) ) ( not ( = ?auto_431361 ?auto_431369 ) ) ( not ( = ?auto_431361 ?auto_431370 ) ) ( not ( = ?auto_431361 ?auto_431371 ) ) ( not ( = ?auto_431361 ?auto_431372 ) ) ( not ( = ?auto_431362 ?auto_431363 ) ) ( not ( = ?auto_431362 ?auto_431364 ) ) ( not ( = ?auto_431362 ?auto_431365 ) ) ( not ( = ?auto_431362 ?auto_431366 ) ) ( not ( = ?auto_431362 ?auto_431367 ) ) ( not ( = ?auto_431362 ?auto_431368 ) ) ( not ( = ?auto_431362 ?auto_431369 ) ) ( not ( = ?auto_431362 ?auto_431370 ) ) ( not ( = ?auto_431362 ?auto_431371 ) ) ( not ( = ?auto_431362 ?auto_431372 ) ) ( not ( = ?auto_431363 ?auto_431364 ) ) ( not ( = ?auto_431363 ?auto_431365 ) ) ( not ( = ?auto_431363 ?auto_431366 ) ) ( not ( = ?auto_431363 ?auto_431367 ) ) ( not ( = ?auto_431363 ?auto_431368 ) ) ( not ( = ?auto_431363 ?auto_431369 ) ) ( not ( = ?auto_431363 ?auto_431370 ) ) ( not ( = ?auto_431363 ?auto_431371 ) ) ( not ( = ?auto_431363 ?auto_431372 ) ) ( not ( = ?auto_431364 ?auto_431365 ) ) ( not ( = ?auto_431364 ?auto_431366 ) ) ( not ( = ?auto_431364 ?auto_431367 ) ) ( not ( = ?auto_431364 ?auto_431368 ) ) ( not ( = ?auto_431364 ?auto_431369 ) ) ( not ( = ?auto_431364 ?auto_431370 ) ) ( not ( = ?auto_431364 ?auto_431371 ) ) ( not ( = ?auto_431364 ?auto_431372 ) ) ( not ( = ?auto_431365 ?auto_431366 ) ) ( not ( = ?auto_431365 ?auto_431367 ) ) ( not ( = ?auto_431365 ?auto_431368 ) ) ( not ( = ?auto_431365 ?auto_431369 ) ) ( not ( = ?auto_431365 ?auto_431370 ) ) ( not ( = ?auto_431365 ?auto_431371 ) ) ( not ( = ?auto_431365 ?auto_431372 ) ) ( not ( = ?auto_431366 ?auto_431367 ) ) ( not ( = ?auto_431366 ?auto_431368 ) ) ( not ( = ?auto_431366 ?auto_431369 ) ) ( not ( = ?auto_431366 ?auto_431370 ) ) ( not ( = ?auto_431366 ?auto_431371 ) ) ( not ( = ?auto_431366 ?auto_431372 ) ) ( not ( = ?auto_431367 ?auto_431368 ) ) ( not ( = ?auto_431367 ?auto_431369 ) ) ( not ( = ?auto_431367 ?auto_431370 ) ) ( not ( = ?auto_431367 ?auto_431371 ) ) ( not ( = ?auto_431367 ?auto_431372 ) ) ( not ( = ?auto_431368 ?auto_431369 ) ) ( not ( = ?auto_431368 ?auto_431370 ) ) ( not ( = ?auto_431368 ?auto_431371 ) ) ( not ( = ?auto_431368 ?auto_431372 ) ) ( not ( = ?auto_431369 ?auto_431370 ) ) ( not ( = ?auto_431369 ?auto_431371 ) ) ( not ( = ?auto_431369 ?auto_431372 ) ) ( not ( = ?auto_431370 ?auto_431371 ) ) ( not ( = ?auto_431370 ?auto_431372 ) ) ( not ( = ?auto_431371 ?auto_431372 ) ) ( ON ?auto_431370 ?auto_431371 ) ( ON ?auto_431369 ?auto_431370 ) ( CLEAR ?auto_431367 ) ( ON ?auto_431368 ?auto_431369 ) ( CLEAR ?auto_431368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_431359 ?auto_431360 ?auto_431361 ?auto_431362 ?auto_431363 ?auto_431364 ?auto_431365 ?auto_431366 ?auto_431367 ?auto_431368 )
      ( MAKE-13PILE ?auto_431359 ?auto_431360 ?auto_431361 ?auto_431362 ?auto_431363 ?auto_431364 ?auto_431365 ?auto_431366 ?auto_431367 ?auto_431368 ?auto_431369 ?auto_431370 ?auto_431371 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431413 - BLOCK
      ?auto_431414 - BLOCK
      ?auto_431415 - BLOCK
      ?auto_431416 - BLOCK
      ?auto_431417 - BLOCK
      ?auto_431418 - BLOCK
      ?auto_431419 - BLOCK
      ?auto_431420 - BLOCK
      ?auto_431421 - BLOCK
      ?auto_431422 - BLOCK
      ?auto_431423 - BLOCK
      ?auto_431424 - BLOCK
      ?auto_431425 - BLOCK
    )
    :vars
    (
      ?auto_431426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431425 ?auto_431426 ) ( ON-TABLE ?auto_431413 ) ( ON ?auto_431414 ?auto_431413 ) ( ON ?auto_431415 ?auto_431414 ) ( ON ?auto_431416 ?auto_431415 ) ( ON ?auto_431417 ?auto_431416 ) ( ON ?auto_431418 ?auto_431417 ) ( ON ?auto_431419 ?auto_431418 ) ( ON ?auto_431420 ?auto_431419 ) ( not ( = ?auto_431413 ?auto_431414 ) ) ( not ( = ?auto_431413 ?auto_431415 ) ) ( not ( = ?auto_431413 ?auto_431416 ) ) ( not ( = ?auto_431413 ?auto_431417 ) ) ( not ( = ?auto_431413 ?auto_431418 ) ) ( not ( = ?auto_431413 ?auto_431419 ) ) ( not ( = ?auto_431413 ?auto_431420 ) ) ( not ( = ?auto_431413 ?auto_431421 ) ) ( not ( = ?auto_431413 ?auto_431422 ) ) ( not ( = ?auto_431413 ?auto_431423 ) ) ( not ( = ?auto_431413 ?auto_431424 ) ) ( not ( = ?auto_431413 ?auto_431425 ) ) ( not ( = ?auto_431413 ?auto_431426 ) ) ( not ( = ?auto_431414 ?auto_431415 ) ) ( not ( = ?auto_431414 ?auto_431416 ) ) ( not ( = ?auto_431414 ?auto_431417 ) ) ( not ( = ?auto_431414 ?auto_431418 ) ) ( not ( = ?auto_431414 ?auto_431419 ) ) ( not ( = ?auto_431414 ?auto_431420 ) ) ( not ( = ?auto_431414 ?auto_431421 ) ) ( not ( = ?auto_431414 ?auto_431422 ) ) ( not ( = ?auto_431414 ?auto_431423 ) ) ( not ( = ?auto_431414 ?auto_431424 ) ) ( not ( = ?auto_431414 ?auto_431425 ) ) ( not ( = ?auto_431414 ?auto_431426 ) ) ( not ( = ?auto_431415 ?auto_431416 ) ) ( not ( = ?auto_431415 ?auto_431417 ) ) ( not ( = ?auto_431415 ?auto_431418 ) ) ( not ( = ?auto_431415 ?auto_431419 ) ) ( not ( = ?auto_431415 ?auto_431420 ) ) ( not ( = ?auto_431415 ?auto_431421 ) ) ( not ( = ?auto_431415 ?auto_431422 ) ) ( not ( = ?auto_431415 ?auto_431423 ) ) ( not ( = ?auto_431415 ?auto_431424 ) ) ( not ( = ?auto_431415 ?auto_431425 ) ) ( not ( = ?auto_431415 ?auto_431426 ) ) ( not ( = ?auto_431416 ?auto_431417 ) ) ( not ( = ?auto_431416 ?auto_431418 ) ) ( not ( = ?auto_431416 ?auto_431419 ) ) ( not ( = ?auto_431416 ?auto_431420 ) ) ( not ( = ?auto_431416 ?auto_431421 ) ) ( not ( = ?auto_431416 ?auto_431422 ) ) ( not ( = ?auto_431416 ?auto_431423 ) ) ( not ( = ?auto_431416 ?auto_431424 ) ) ( not ( = ?auto_431416 ?auto_431425 ) ) ( not ( = ?auto_431416 ?auto_431426 ) ) ( not ( = ?auto_431417 ?auto_431418 ) ) ( not ( = ?auto_431417 ?auto_431419 ) ) ( not ( = ?auto_431417 ?auto_431420 ) ) ( not ( = ?auto_431417 ?auto_431421 ) ) ( not ( = ?auto_431417 ?auto_431422 ) ) ( not ( = ?auto_431417 ?auto_431423 ) ) ( not ( = ?auto_431417 ?auto_431424 ) ) ( not ( = ?auto_431417 ?auto_431425 ) ) ( not ( = ?auto_431417 ?auto_431426 ) ) ( not ( = ?auto_431418 ?auto_431419 ) ) ( not ( = ?auto_431418 ?auto_431420 ) ) ( not ( = ?auto_431418 ?auto_431421 ) ) ( not ( = ?auto_431418 ?auto_431422 ) ) ( not ( = ?auto_431418 ?auto_431423 ) ) ( not ( = ?auto_431418 ?auto_431424 ) ) ( not ( = ?auto_431418 ?auto_431425 ) ) ( not ( = ?auto_431418 ?auto_431426 ) ) ( not ( = ?auto_431419 ?auto_431420 ) ) ( not ( = ?auto_431419 ?auto_431421 ) ) ( not ( = ?auto_431419 ?auto_431422 ) ) ( not ( = ?auto_431419 ?auto_431423 ) ) ( not ( = ?auto_431419 ?auto_431424 ) ) ( not ( = ?auto_431419 ?auto_431425 ) ) ( not ( = ?auto_431419 ?auto_431426 ) ) ( not ( = ?auto_431420 ?auto_431421 ) ) ( not ( = ?auto_431420 ?auto_431422 ) ) ( not ( = ?auto_431420 ?auto_431423 ) ) ( not ( = ?auto_431420 ?auto_431424 ) ) ( not ( = ?auto_431420 ?auto_431425 ) ) ( not ( = ?auto_431420 ?auto_431426 ) ) ( not ( = ?auto_431421 ?auto_431422 ) ) ( not ( = ?auto_431421 ?auto_431423 ) ) ( not ( = ?auto_431421 ?auto_431424 ) ) ( not ( = ?auto_431421 ?auto_431425 ) ) ( not ( = ?auto_431421 ?auto_431426 ) ) ( not ( = ?auto_431422 ?auto_431423 ) ) ( not ( = ?auto_431422 ?auto_431424 ) ) ( not ( = ?auto_431422 ?auto_431425 ) ) ( not ( = ?auto_431422 ?auto_431426 ) ) ( not ( = ?auto_431423 ?auto_431424 ) ) ( not ( = ?auto_431423 ?auto_431425 ) ) ( not ( = ?auto_431423 ?auto_431426 ) ) ( not ( = ?auto_431424 ?auto_431425 ) ) ( not ( = ?auto_431424 ?auto_431426 ) ) ( not ( = ?auto_431425 ?auto_431426 ) ) ( ON ?auto_431424 ?auto_431425 ) ( ON ?auto_431423 ?auto_431424 ) ( ON ?auto_431422 ?auto_431423 ) ( CLEAR ?auto_431420 ) ( ON ?auto_431421 ?auto_431422 ) ( CLEAR ?auto_431421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_431413 ?auto_431414 ?auto_431415 ?auto_431416 ?auto_431417 ?auto_431418 ?auto_431419 ?auto_431420 ?auto_431421 )
      ( MAKE-13PILE ?auto_431413 ?auto_431414 ?auto_431415 ?auto_431416 ?auto_431417 ?auto_431418 ?auto_431419 ?auto_431420 ?auto_431421 ?auto_431422 ?auto_431423 ?auto_431424 ?auto_431425 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431467 - BLOCK
      ?auto_431468 - BLOCK
      ?auto_431469 - BLOCK
      ?auto_431470 - BLOCK
      ?auto_431471 - BLOCK
      ?auto_431472 - BLOCK
      ?auto_431473 - BLOCK
      ?auto_431474 - BLOCK
      ?auto_431475 - BLOCK
      ?auto_431476 - BLOCK
      ?auto_431477 - BLOCK
      ?auto_431478 - BLOCK
      ?auto_431479 - BLOCK
    )
    :vars
    (
      ?auto_431480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431479 ?auto_431480 ) ( ON-TABLE ?auto_431467 ) ( ON ?auto_431468 ?auto_431467 ) ( ON ?auto_431469 ?auto_431468 ) ( ON ?auto_431470 ?auto_431469 ) ( ON ?auto_431471 ?auto_431470 ) ( ON ?auto_431472 ?auto_431471 ) ( ON ?auto_431473 ?auto_431472 ) ( not ( = ?auto_431467 ?auto_431468 ) ) ( not ( = ?auto_431467 ?auto_431469 ) ) ( not ( = ?auto_431467 ?auto_431470 ) ) ( not ( = ?auto_431467 ?auto_431471 ) ) ( not ( = ?auto_431467 ?auto_431472 ) ) ( not ( = ?auto_431467 ?auto_431473 ) ) ( not ( = ?auto_431467 ?auto_431474 ) ) ( not ( = ?auto_431467 ?auto_431475 ) ) ( not ( = ?auto_431467 ?auto_431476 ) ) ( not ( = ?auto_431467 ?auto_431477 ) ) ( not ( = ?auto_431467 ?auto_431478 ) ) ( not ( = ?auto_431467 ?auto_431479 ) ) ( not ( = ?auto_431467 ?auto_431480 ) ) ( not ( = ?auto_431468 ?auto_431469 ) ) ( not ( = ?auto_431468 ?auto_431470 ) ) ( not ( = ?auto_431468 ?auto_431471 ) ) ( not ( = ?auto_431468 ?auto_431472 ) ) ( not ( = ?auto_431468 ?auto_431473 ) ) ( not ( = ?auto_431468 ?auto_431474 ) ) ( not ( = ?auto_431468 ?auto_431475 ) ) ( not ( = ?auto_431468 ?auto_431476 ) ) ( not ( = ?auto_431468 ?auto_431477 ) ) ( not ( = ?auto_431468 ?auto_431478 ) ) ( not ( = ?auto_431468 ?auto_431479 ) ) ( not ( = ?auto_431468 ?auto_431480 ) ) ( not ( = ?auto_431469 ?auto_431470 ) ) ( not ( = ?auto_431469 ?auto_431471 ) ) ( not ( = ?auto_431469 ?auto_431472 ) ) ( not ( = ?auto_431469 ?auto_431473 ) ) ( not ( = ?auto_431469 ?auto_431474 ) ) ( not ( = ?auto_431469 ?auto_431475 ) ) ( not ( = ?auto_431469 ?auto_431476 ) ) ( not ( = ?auto_431469 ?auto_431477 ) ) ( not ( = ?auto_431469 ?auto_431478 ) ) ( not ( = ?auto_431469 ?auto_431479 ) ) ( not ( = ?auto_431469 ?auto_431480 ) ) ( not ( = ?auto_431470 ?auto_431471 ) ) ( not ( = ?auto_431470 ?auto_431472 ) ) ( not ( = ?auto_431470 ?auto_431473 ) ) ( not ( = ?auto_431470 ?auto_431474 ) ) ( not ( = ?auto_431470 ?auto_431475 ) ) ( not ( = ?auto_431470 ?auto_431476 ) ) ( not ( = ?auto_431470 ?auto_431477 ) ) ( not ( = ?auto_431470 ?auto_431478 ) ) ( not ( = ?auto_431470 ?auto_431479 ) ) ( not ( = ?auto_431470 ?auto_431480 ) ) ( not ( = ?auto_431471 ?auto_431472 ) ) ( not ( = ?auto_431471 ?auto_431473 ) ) ( not ( = ?auto_431471 ?auto_431474 ) ) ( not ( = ?auto_431471 ?auto_431475 ) ) ( not ( = ?auto_431471 ?auto_431476 ) ) ( not ( = ?auto_431471 ?auto_431477 ) ) ( not ( = ?auto_431471 ?auto_431478 ) ) ( not ( = ?auto_431471 ?auto_431479 ) ) ( not ( = ?auto_431471 ?auto_431480 ) ) ( not ( = ?auto_431472 ?auto_431473 ) ) ( not ( = ?auto_431472 ?auto_431474 ) ) ( not ( = ?auto_431472 ?auto_431475 ) ) ( not ( = ?auto_431472 ?auto_431476 ) ) ( not ( = ?auto_431472 ?auto_431477 ) ) ( not ( = ?auto_431472 ?auto_431478 ) ) ( not ( = ?auto_431472 ?auto_431479 ) ) ( not ( = ?auto_431472 ?auto_431480 ) ) ( not ( = ?auto_431473 ?auto_431474 ) ) ( not ( = ?auto_431473 ?auto_431475 ) ) ( not ( = ?auto_431473 ?auto_431476 ) ) ( not ( = ?auto_431473 ?auto_431477 ) ) ( not ( = ?auto_431473 ?auto_431478 ) ) ( not ( = ?auto_431473 ?auto_431479 ) ) ( not ( = ?auto_431473 ?auto_431480 ) ) ( not ( = ?auto_431474 ?auto_431475 ) ) ( not ( = ?auto_431474 ?auto_431476 ) ) ( not ( = ?auto_431474 ?auto_431477 ) ) ( not ( = ?auto_431474 ?auto_431478 ) ) ( not ( = ?auto_431474 ?auto_431479 ) ) ( not ( = ?auto_431474 ?auto_431480 ) ) ( not ( = ?auto_431475 ?auto_431476 ) ) ( not ( = ?auto_431475 ?auto_431477 ) ) ( not ( = ?auto_431475 ?auto_431478 ) ) ( not ( = ?auto_431475 ?auto_431479 ) ) ( not ( = ?auto_431475 ?auto_431480 ) ) ( not ( = ?auto_431476 ?auto_431477 ) ) ( not ( = ?auto_431476 ?auto_431478 ) ) ( not ( = ?auto_431476 ?auto_431479 ) ) ( not ( = ?auto_431476 ?auto_431480 ) ) ( not ( = ?auto_431477 ?auto_431478 ) ) ( not ( = ?auto_431477 ?auto_431479 ) ) ( not ( = ?auto_431477 ?auto_431480 ) ) ( not ( = ?auto_431478 ?auto_431479 ) ) ( not ( = ?auto_431478 ?auto_431480 ) ) ( not ( = ?auto_431479 ?auto_431480 ) ) ( ON ?auto_431478 ?auto_431479 ) ( ON ?auto_431477 ?auto_431478 ) ( ON ?auto_431476 ?auto_431477 ) ( ON ?auto_431475 ?auto_431476 ) ( CLEAR ?auto_431473 ) ( ON ?auto_431474 ?auto_431475 ) ( CLEAR ?auto_431474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_431467 ?auto_431468 ?auto_431469 ?auto_431470 ?auto_431471 ?auto_431472 ?auto_431473 ?auto_431474 )
      ( MAKE-13PILE ?auto_431467 ?auto_431468 ?auto_431469 ?auto_431470 ?auto_431471 ?auto_431472 ?auto_431473 ?auto_431474 ?auto_431475 ?auto_431476 ?auto_431477 ?auto_431478 ?auto_431479 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431521 - BLOCK
      ?auto_431522 - BLOCK
      ?auto_431523 - BLOCK
      ?auto_431524 - BLOCK
      ?auto_431525 - BLOCK
      ?auto_431526 - BLOCK
      ?auto_431527 - BLOCK
      ?auto_431528 - BLOCK
      ?auto_431529 - BLOCK
      ?auto_431530 - BLOCK
      ?auto_431531 - BLOCK
      ?auto_431532 - BLOCK
      ?auto_431533 - BLOCK
    )
    :vars
    (
      ?auto_431534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431533 ?auto_431534 ) ( ON-TABLE ?auto_431521 ) ( ON ?auto_431522 ?auto_431521 ) ( ON ?auto_431523 ?auto_431522 ) ( ON ?auto_431524 ?auto_431523 ) ( ON ?auto_431525 ?auto_431524 ) ( ON ?auto_431526 ?auto_431525 ) ( not ( = ?auto_431521 ?auto_431522 ) ) ( not ( = ?auto_431521 ?auto_431523 ) ) ( not ( = ?auto_431521 ?auto_431524 ) ) ( not ( = ?auto_431521 ?auto_431525 ) ) ( not ( = ?auto_431521 ?auto_431526 ) ) ( not ( = ?auto_431521 ?auto_431527 ) ) ( not ( = ?auto_431521 ?auto_431528 ) ) ( not ( = ?auto_431521 ?auto_431529 ) ) ( not ( = ?auto_431521 ?auto_431530 ) ) ( not ( = ?auto_431521 ?auto_431531 ) ) ( not ( = ?auto_431521 ?auto_431532 ) ) ( not ( = ?auto_431521 ?auto_431533 ) ) ( not ( = ?auto_431521 ?auto_431534 ) ) ( not ( = ?auto_431522 ?auto_431523 ) ) ( not ( = ?auto_431522 ?auto_431524 ) ) ( not ( = ?auto_431522 ?auto_431525 ) ) ( not ( = ?auto_431522 ?auto_431526 ) ) ( not ( = ?auto_431522 ?auto_431527 ) ) ( not ( = ?auto_431522 ?auto_431528 ) ) ( not ( = ?auto_431522 ?auto_431529 ) ) ( not ( = ?auto_431522 ?auto_431530 ) ) ( not ( = ?auto_431522 ?auto_431531 ) ) ( not ( = ?auto_431522 ?auto_431532 ) ) ( not ( = ?auto_431522 ?auto_431533 ) ) ( not ( = ?auto_431522 ?auto_431534 ) ) ( not ( = ?auto_431523 ?auto_431524 ) ) ( not ( = ?auto_431523 ?auto_431525 ) ) ( not ( = ?auto_431523 ?auto_431526 ) ) ( not ( = ?auto_431523 ?auto_431527 ) ) ( not ( = ?auto_431523 ?auto_431528 ) ) ( not ( = ?auto_431523 ?auto_431529 ) ) ( not ( = ?auto_431523 ?auto_431530 ) ) ( not ( = ?auto_431523 ?auto_431531 ) ) ( not ( = ?auto_431523 ?auto_431532 ) ) ( not ( = ?auto_431523 ?auto_431533 ) ) ( not ( = ?auto_431523 ?auto_431534 ) ) ( not ( = ?auto_431524 ?auto_431525 ) ) ( not ( = ?auto_431524 ?auto_431526 ) ) ( not ( = ?auto_431524 ?auto_431527 ) ) ( not ( = ?auto_431524 ?auto_431528 ) ) ( not ( = ?auto_431524 ?auto_431529 ) ) ( not ( = ?auto_431524 ?auto_431530 ) ) ( not ( = ?auto_431524 ?auto_431531 ) ) ( not ( = ?auto_431524 ?auto_431532 ) ) ( not ( = ?auto_431524 ?auto_431533 ) ) ( not ( = ?auto_431524 ?auto_431534 ) ) ( not ( = ?auto_431525 ?auto_431526 ) ) ( not ( = ?auto_431525 ?auto_431527 ) ) ( not ( = ?auto_431525 ?auto_431528 ) ) ( not ( = ?auto_431525 ?auto_431529 ) ) ( not ( = ?auto_431525 ?auto_431530 ) ) ( not ( = ?auto_431525 ?auto_431531 ) ) ( not ( = ?auto_431525 ?auto_431532 ) ) ( not ( = ?auto_431525 ?auto_431533 ) ) ( not ( = ?auto_431525 ?auto_431534 ) ) ( not ( = ?auto_431526 ?auto_431527 ) ) ( not ( = ?auto_431526 ?auto_431528 ) ) ( not ( = ?auto_431526 ?auto_431529 ) ) ( not ( = ?auto_431526 ?auto_431530 ) ) ( not ( = ?auto_431526 ?auto_431531 ) ) ( not ( = ?auto_431526 ?auto_431532 ) ) ( not ( = ?auto_431526 ?auto_431533 ) ) ( not ( = ?auto_431526 ?auto_431534 ) ) ( not ( = ?auto_431527 ?auto_431528 ) ) ( not ( = ?auto_431527 ?auto_431529 ) ) ( not ( = ?auto_431527 ?auto_431530 ) ) ( not ( = ?auto_431527 ?auto_431531 ) ) ( not ( = ?auto_431527 ?auto_431532 ) ) ( not ( = ?auto_431527 ?auto_431533 ) ) ( not ( = ?auto_431527 ?auto_431534 ) ) ( not ( = ?auto_431528 ?auto_431529 ) ) ( not ( = ?auto_431528 ?auto_431530 ) ) ( not ( = ?auto_431528 ?auto_431531 ) ) ( not ( = ?auto_431528 ?auto_431532 ) ) ( not ( = ?auto_431528 ?auto_431533 ) ) ( not ( = ?auto_431528 ?auto_431534 ) ) ( not ( = ?auto_431529 ?auto_431530 ) ) ( not ( = ?auto_431529 ?auto_431531 ) ) ( not ( = ?auto_431529 ?auto_431532 ) ) ( not ( = ?auto_431529 ?auto_431533 ) ) ( not ( = ?auto_431529 ?auto_431534 ) ) ( not ( = ?auto_431530 ?auto_431531 ) ) ( not ( = ?auto_431530 ?auto_431532 ) ) ( not ( = ?auto_431530 ?auto_431533 ) ) ( not ( = ?auto_431530 ?auto_431534 ) ) ( not ( = ?auto_431531 ?auto_431532 ) ) ( not ( = ?auto_431531 ?auto_431533 ) ) ( not ( = ?auto_431531 ?auto_431534 ) ) ( not ( = ?auto_431532 ?auto_431533 ) ) ( not ( = ?auto_431532 ?auto_431534 ) ) ( not ( = ?auto_431533 ?auto_431534 ) ) ( ON ?auto_431532 ?auto_431533 ) ( ON ?auto_431531 ?auto_431532 ) ( ON ?auto_431530 ?auto_431531 ) ( ON ?auto_431529 ?auto_431530 ) ( ON ?auto_431528 ?auto_431529 ) ( CLEAR ?auto_431526 ) ( ON ?auto_431527 ?auto_431528 ) ( CLEAR ?auto_431527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_431521 ?auto_431522 ?auto_431523 ?auto_431524 ?auto_431525 ?auto_431526 ?auto_431527 )
      ( MAKE-13PILE ?auto_431521 ?auto_431522 ?auto_431523 ?auto_431524 ?auto_431525 ?auto_431526 ?auto_431527 ?auto_431528 ?auto_431529 ?auto_431530 ?auto_431531 ?auto_431532 ?auto_431533 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431575 - BLOCK
      ?auto_431576 - BLOCK
      ?auto_431577 - BLOCK
      ?auto_431578 - BLOCK
      ?auto_431579 - BLOCK
      ?auto_431580 - BLOCK
      ?auto_431581 - BLOCK
      ?auto_431582 - BLOCK
      ?auto_431583 - BLOCK
      ?auto_431584 - BLOCK
      ?auto_431585 - BLOCK
      ?auto_431586 - BLOCK
      ?auto_431587 - BLOCK
    )
    :vars
    (
      ?auto_431588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431587 ?auto_431588 ) ( ON-TABLE ?auto_431575 ) ( ON ?auto_431576 ?auto_431575 ) ( ON ?auto_431577 ?auto_431576 ) ( ON ?auto_431578 ?auto_431577 ) ( ON ?auto_431579 ?auto_431578 ) ( not ( = ?auto_431575 ?auto_431576 ) ) ( not ( = ?auto_431575 ?auto_431577 ) ) ( not ( = ?auto_431575 ?auto_431578 ) ) ( not ( = ?auto_431575 ?auto_431579 ) ) ( not ( = ?auto_431575 ?auto_431580 ) ) ( not ( = ?auto_431575 ?auto_431581 ) ) ( not ( = ?auto_431575 ?auto_431582 ) ) ( not ( = ?auto_431575 ?auto_431583 ) ) ( not ( = ?auto_431575 ?auto_431584 ) ) ( not ( = ?auto_431575 ?auto_431585 ) ) ( not ( = ?auto_431575 ?auto_431586 ) ) ( not ( = ?auto_431575 ?auto_431587 ) ) ( not ( = ?auto_431575 ?auto_431588 ) ) ( not ( = ?auto_431576 ?auto_431577 ) ) ( not ( = ?auto_431576 ?auto_431578 ) ) ( not ( = ?auto_431576 ?auto_431579 ) ) ( not ( = ?auto_431576 ?auto_431580 ) ) ( not ( = ?auto_431576 ?auto_431581 ) ) ( not ( = ?auto_431576 ?auto_431582 ) ) ( not ( = ?auto_431576 ?auto_431583 ) ) ( not ( = ?auto_431576 ?auto_431584 ) ) ( not ( = ?auto_431576 ?auto_431585 ) ) ( not ( = ?auto_431576 ?auto_431586 ) ) ( not ( = ?auto_431576 ?auto_431587 ) ) ( not ( = ?auto_431576 ?auto_431588 ) ) ( not ( = ?auto_431577 ?auto_431578 ) ) ( not ( = ?auto_431577 ?auto_431579 ) ) ( not ( = ?auto_431577 ?auto_431580 ) ) ( not ( = ?auto_431577 ?auto_431581 ) ) ( not ( = ?auto_431577 ?auto_431582 ) ) ( not ( = ?auto_431577 ?auto_431583 ) ) ( not ( = ?auto_431577 ?auto_431584 ) ) ( not ( = ?auto_431577 ?auto_431585 ) ) ( not ( = ?auto_431577 ?auto_431586 ) ) ( not ( = ?auto_431577 ?auto_431587 ) ) ( not ( = ?auto_431577 ?auto_431588 ) ) ( not ( = ?auto_431578 ?auto_431579 ) ) ( not ( = ?auto_431578 ?auto_431580 ) ) ( not ( = ?auto_431578 ?auto_431581 ) ) ( not ( = ?auto_431578 ?auto_431582 ) ) ( not ( = ?auto_431578 ?auto_431583 ) ) ( not ( = ?auto_431578 ?auto_431584 ) ) ( not ( = ?auto_431578 ?auto_431585 ) ) ( not ( = ?auto_431578 ?auto_431586 ) ) ( not ( = ?auto_431578 ?auto_431587 ) ) ( not ( = ?auto_431578 ?auto_431588 ) ) ( not ( = ?auto_431579 ?auto_431580 ) ) ( not ( = ?auto_431579 ?auto_431581 ) ) ( not ( = ?auto_431579 ?auto_431582 ) ) ( not ( = ?auto_431579 ?auto_431583 ) ) ( not ( = ?auto_431579 ?auto_431584 ) ) ( not ( = ?auto_431579 ?auto_431585 ) ) ( not ( = ?auto_431579 ?auto_431586 ) ) ( not ( = ?auto_431579 ?auto_431587 ) ) ( not ( = ?auto_431579 ?auto_431588 ) ) ( not ( = ?auto_431580 ?auto_431581 ) ) ( not ( = ?auto_431580 ?auto_431582 ) ) ( not ( = ?auto_431580 ?auto_431583 ) ) ( not ( = ?auto_431580 ?auto_431584 ) ) ( not ( = ?auto_431580 ?auto_431585 ) ) ( not ( = ?auto_431580 ?auto_431586 ) ) ( not ( = ?auto_431580 ?auto_431587 ) ) ( not ( = ?auto_431580 ?auto_431588 ) ) ( not ( = ?auto_431581 ?auto_431582 ) ) ( not ( = ?auto_431581 ?auto_431583 ) ) ( not ( = ?auto_431581 ?auto_431584 ) ) ( not ( = ?auto_431581 ?auto_431585 ) ) ( not ( = ?auto_431581 ?auto_431586 ) ) ( not ( = ?auto_431581 ?auto_431587 ) ) ( not ( = ?auto_431581 ?auto_431588 ) ) ( not ( = ?auto_431582 ?auto_431583 ) ) ( not ( = ?auto_431582 ?auto_431584 ) ) ( not ( = ?auto_431582 ?auto_431585 ) ) ( not ( = ?auto_431582 ?auto_431586 ) ) ( not ( = ?auto_431582 ?auto_431587 ) ) ( not ( = ?auto_431582 ?auto_431588 ) ) ( not ( = ?auto_431583 ?auto_431584 ) ) ( not ( = ?auto_431583 ?auto_431585 ) ) ( not ( = ?auto_431583 ?auto_431586 ) ) ( not ( = ?auto_431583 ?auto_431587 ) ) ( not ( = ?auto_431583 ?auto_431588 ) ) ( not ( = ?auto_431584 ?auto_431585 ) ) ( not ( = ?auto_431584 ?auto_431586 ) ) ( not ( = ?auto_431584 ?auto_431587 ) ) ( not ( = ?auto_431584 ?auto_431588 ) ) ( not ( = ?auto_431585 ?auto_431586 ) ) ( not ( = ?auto_431585 ?auto_431587 ) ) ( not ( = ?auto_431585 ?auto_431588 ) ) ( not ( = ?auto_431586 ?auto_431587 ) ) ( not ( = ?auto_431586 ?auto_431588 ) ) ( not ( = ?auto_431587 ?auto_431588 ) ) ( ON ?auto_431586 ?auto_431587 ) ( ON ?auto_431585 ?auto_431586 ) ( ON ?auto_431584 ?auto_431585 ) ( ON ?auto_431583 ?auto_431584 ) ( ON ?auto_431582 ?auto_431583 ) ( ON ?auto_431581 ?auto_431582 ) ( CLEAR ?auto_431579 ) ( ON ?auto_431580 ?auto_431581 ) ( CLEAR ?auto_431580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_431575 ?auto_431576 ?auto_431577 ?auto_431578 ?auto_431579 ?auto_431580 )
      ( MAKE-13PILE ?auto_431575 ?auto_431576 ?auto_431577 ?auto_431578 ?auto_431579 ?auto_431580 ?auto_431581 ?auto_431582 ?auto_431583 ?auto_431584 ?auto_431585 ?auto_431586 ?auto_431587 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431629 - BLOCK
      ?auto_431630 - BLOCK
      ?auto_431631 - BLOCK
      ?auto_431632 - BLOCK
      ?auto_431633 - BLOCK
      ?auto_431634 - BLOCK
      ?auto_431635 - BLOCK
      ?auto_431636 - BLOCK
      ?auto_431637 - BLOCK
      ?auto_431638 - BLOCK
      ?auto_431639 - BLOCK
      ?auto_431640 - BLOCK
      ?auto_431641 - BLOCK
    )
    :vars
    (
      ?auto_431642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431641 ?auto_431642 ) ( ON-TABLE ?auto_431629 ) ( ON ?auto_431630 ?auto_431629 ) ( ON ?auto_431631 ?auto_431630 ) ( ON ?auto_431632 ?auto_431631 ) ( not ( = ?auto_431629 ?auto_431630 ) ) ( not ( = ?auto_431629 ?auto_431631 ) ) ( not ( = ?auto_431629 ?auto_431632 ) ) ( not ( = ?auto_431629 ?auto_431633 ) ) ( not ( = ?auto_431629 ?auto_431634 ) ) ( not ( = ?auto_431629 ?auto_431635 ) ) ( not ( = ?auto_431629 ?auto_431636 ) ) ( not ( = ?auto_431629 ?auto_431637 ) ) ( not ( = ?auto_431629 ?auto_431638 ) ) ( not ( = ?auto_431629 ?auto_431639 ) ) ( not ( = ?auto_431629 ?auto_431640 ) ) ( not ( = ?auto_431629 ?auto_431641 ) ) ( not ( = ?auto_431629 ?auto_431642 ) ) ( not ( = ?auto_431630 ?auto_431631 ) ) ( not ( = ?auto_431630 ?auto_431632 ) ) ( not ( = ?auto_431630 ?auto_431633 ) ) ( not ( = ?auto_431630 ?auto_431634 ) ) ( not ( = ?auto_431630 ?auto_431635 ) ) ( not ( = ?auto_431630 ?auto_431636 ) ) ( not ( = ?auto_431630 ?auto_431637 ) ) ( not ( = ?auto_431630 ?auto_431638 ) ) ( not ( = ?auto_431630 ?auto_431639 ) ) ( not ( = ?auto_431630 ?auto_431640 ) ) ( not ( = ?auto_431630 ?auto_431641 ) ) ( not ( = ?auto_431630 ?auto_431642 ) ) ( not ( = ?auto_431631 ?auto_431632 ) ) ( not ( = ?auto_431631 ?auto_431633 ) ) ( not ( = ?auto_431631 ?auto_431634 ) ) ( not ( = ?auto_431631 ?auto_431635 ) ) ( not ( = ?auto_431631 ?auto_431636 ) ) ( not ( = ?auto_431631 ?auto_431637 ) ) ( not ( = ?auto_431631 ?auto_431638 ) ) ( not ( = ?auto_431631 ?auto_431639 ) ) ( not ( = ?auto_431631 ?auto_431640 ) ) ( not ( = ?auto_431631 ?auto_431641 ) ) ( not ( = ?auto_431631 ?auto_431642 ) ) ( not ( = ?auto_431632 ?auto_431633 ) ) ( not ( = ?auto_431632 ?auto_431634 ) ) ( not ( = ?auto_431632 ?auto_431635 ) ) ( not ( = ?auto_431632 ?auto_431636 ) ) ( not ( = ?auto_431632 ?auto_431637 ) ) ( not ( = ?auto_431632 ?auto_431638 ) ) ( not ( = ?auto_431632 ?auto_431639 ) ) ( not ( = ?auto_431632 ?auto_431640 ) ) ( not ( = ?auto_431632 ?auto_431641 ) ) ( not ( = ?auto_431632 ?auto_431642 ) ) ( not ( = ?auto_431633 ?auto_431634 ) ) ( not ( = ?auto_431633 ?auto_431635 ) ) ( not ( = ?auto_431633 ?auto_431636 ) ) ( not ( = ?auto_431633 ?auto_431637 ) ) ( not ( = ?auto_431633 ?auto_431638 ) ) ( not ( = ?auto_431633 ?auto_431639 ) ) ( not ( = ?auto_431633 ?auto_431640 ) ) ( not ( = ?auto_431633 ?auto_431641 ) ) ( not ( = ?auto_431633 ?auto_431642 ) ) ( not ( = ?auto_431634 ?auto_431635 ) ) ( not ( = ?auto_431634 ?auto_431636 ) ) ( not ( = ?auto_431634 ?auto_431637 ) ) ( not ( = ?auto_431634 ?auto_431638 ) ) ( not ( = ?auto_431634 ?auto_431639 ) ) ( not ( = ?auto_431634 ?auto_431640 ) ) ( not ( = ?auto_431634 ?auto_431641 ) ) ( not ( = ?auto_431634 ?auto_431642 ) ) ( not ( = ?auto_431635 ?auto_431636 ) ) ( not ( = ?auto_431635 ?auto_431637 ) ) ( not ( = ?auto_431635 ?auto_431638 ) ) ( not ( = ?auto_431635 ?auto_431639 ) ) ( not ( = ?auto_431635 ?auto_431640 ) ) ( not ( = ?auto_431635 ?auto_431641 ) ) ( not ( = ?auto_431635 ?auto_431642 ) ) ( not ( = ?auto_431636 ?auto_431637 ) ) ( not ( = ?auto_431636 ?auto_431638 ) ) ( not ( = ?auto_431636 ?auto_431639 ) ) ( not ( = ?auto_431636 ?auto_431640 ) ) ( not ( = ?auto_431636 ?auto_431641 ) ) ( not ( = ?auto_431636 ?auto_431642 ) ) ( not ( = ?auto_431637 ?auto_431638 ) ) ( not ( = ?auto_431637 ?auto_431639 ) ) ( not ( = ?auto_431637 ?auto_431640 ) ) ( not ( = ?auto_431637 ?auto_431641 ) ) ( not ( = ?auto_431637 ?auto_431642 ) ) ( not ( = ?auto_431638 ?auto_431639 ) ) ( not ( = ?auto_431638 ?auto_431640 ) ) ( not ( = ?auto_431638 ?auto_431641 ) ) ( not ( = ?auto_431638 ?auto_431642 ) ) ( not ( = ?auto_431639 ?auto_431640 ) ) ( not ( = ?auto_431639 ?auto_431641 ) ) ( not ( = ?auto_431639 ?auto_431642 ) ) ( not ( = ?auto_431640 ?auto_431641 ) ) ( not ( = ?auto_431640 ?auto_431642 ) ) ( not ( = ?auto_431641 ?auto_431642 ) ) ( ON ?auto_431640 ?auto_431641 ) ( ON ?auto_431639 ?auto_431640 ) ( ON ?auto_431638 ?auto_431639 ) ( ON ?auto_431637 ?auto_431638 ) ( ON ?auto_431636 ?auto_431637 ) ( ON ?auto_431635 ?auto_431636 ) ( ON ?auto_431634 ?auto_431635 ) ( CLEAR ?auto_431632 ) ( ON ?auto_431633 ?auto_431634 ) ( CLEAR ?auto_431633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_431629 ?auto_431630 ?auto_431631 ?auto_431632 ?auto_431633 )
      ( MAKE-13PILE ?auto_431629 ?auto_431630 ?auto_431631 ?auto_431632 ?auto_431633 ?auto_431634 ?auto_431635 ?auto_431636 ?auto_431637 ?auto_431638 ?auto_431639 ?auto_431640 ?auto_431641 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431683 - BLOCK
      ?auto_431684 - BLOCK
      ?auto_431685 - BLOCK
      ?auto_431686 - BLOCK
      ?auto_431687 - BLOCK
      ?auto_431688 - BLOCK
      ?auto_431689 - BLOCK
      ?auto_431690 - BLOCK
      ?auto_431691 - BLOCK
      ?auto_431692 - BLOCK
      ?auto_431693 - BLOCK
      ?auto_431694 - BLOCK
      ?auto_431695 - BLOCK
    )
    :vars
    (
      ?auto_431696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431695 ?auto_431696 ) ( ON-TABLE ?auto_431683 ) ( ON ?auto_431684 ?auto_431683 ) ( ON ?auto_431685 ?auto_431684 ) ( not ( = ?auto_431683 ?auto_431684 ) ) ( not ( = ?auto_431683 ?auto_431685 ) ) ( not ( = ?auto_431683 ?auto_431686 ) ) ( not ( = ?auto_431683 ?auto_431687 ) ) ( not ( = ?auto_431683 ?auto_431688 ) ) ( not ( = ?auto_431683 ?auto_431689 ) ) ( not ( = ?auto_431683 ?auto_431690 ) ) ( not ( = ?auto_431683 ?auto_431691 ) ) ( not ( = ?auto_431683 ?auto_431692 ) ) ( not ( = ?auto_431683 ?auto_431693 ) ) ( not ( = ?auto_431683 ?auto_431694 ) ) ( not ( = ?auto_431683 ?auto_431695 ) ) ( not ( = ?auto_431683 ?auto_431696 ) ) ( not ( = ?auto_431684 ?auto_431685 ) ) ( not ( = ?auto_431684 ?auto_431686 ) ) ( not ( = ?auto_431684 ?auto_431687 ) ) ( not ( = ?auto_431684 ?auto_431688 ) ) ( not ( = ?auto_431684 ?auto_431689 ) ) ( not ( = ?auto_431684 ?auto_431690 ) ) ( not ( = ?auto_431684 ?auto_431691 ) ) ( not ( = ?auto_431684 ?auto_431692 ) ) ( not ( = ?auto_431684 ?auto_431693 ) ) ( not ( = ?auto_431684 ?auto_431694 ) ) ( not ( = ?auto_431684 ?auto_431695 ) ) ( not ( = ?auto_431684 ?auto_431696 ) ) ( not ( = ?auto_431685 ?auto_431686 ) ) ( not ( = ?auto_431685 ?auto_431687 ) ) ( not ( = ?auto_431685 ?auto_431688 ) ) ( not ( = ?auto_431685 ?auto_431689 ) ) ( not ( = ?auto_431685 ?auto_431690 ) ) ( not ( = ?auto_431685 ?auto_431691 ) ) ( not ( = ?auto_431685 ?auto_431692 ) ) ( not ( = ?auto_431685 ?auto_431693 ) ) ( not ( = ?auto_431685 ?auto_431694 ) ) ( not ( = ?auto_431685 ?auto_431695 ) ) ( not ( = ?auto_431685 ?auto_431696 ) ) ( not ( = ?auto_431686 ?auto_431687 ) ) ( not ( = ?auto_431686 ?auto_431688 ) ) ( not ( = ?auto_431686 ?auto_431689 ) ) ( not ( = ?auto_431686 ?auto_431690 ) ) ( not ( = ?auto_431686 ?auto_431691 ) ) ( not ( = ?auto_431686 ?auto_431692 ) ) ( not ( = ?auto_431686 ?auto_431693 ) ) ( not ( = ?auto_431686 ?auto_431694 ) ) ( not ( = ?auto_431686 ?auto_431695 ) ) ( not ( = ?auto_431686 ?auto_431696 ) ) ( not ( = ?auto_431687 ?auto_431688 ) ) ( not ( = ?auto_431687 ?auto_431689 ) ) ( not ( = ?auto_431687 ?auto_431690 ) ) ( not ( = ?auto_431687 ?auto_431691 ) ) ( not ( = ?auto_431687 ?auto_431692 ) ) ( not ( = ?auto_431687 ?auto_431693 ) ) ( not ( = ?auto_431687 ?auto_431694 ) ) ( not ( = ?auto_431687 ?auto_431695 ) ) ( not ( = ?auto_431687 ?auto_431696 ) ) ( not ( = ?auto_431688 ?auto_431689 ) ) ( not ( = ?auto_431688 ?auto_431690 ) ) ( not ( = ?auto_431688 ?auto_431691 ) ) ( not ( = ?auto_431688 ?auto_431692 ) ) ( not ( = ?auto_431688 ?auto_431693 ) ) ( not ( = ?auto_431688 ?auto_431694 ) ) ( not ( = ?auto_431688 ?auto_431695 ) ) ( not ( = ?auto_431688 ?auto_431696 ) ) ( not ( = ?auto_431689 ?auto_431690 ) ) ( not ( = ?auto_431689 ?auto_431691 ) ) ( not ( = ?auto_431689 ?auto_431692 ) ) ( not ( = ?auto_431689 ?auto_431693 ) ) ( not ( = ?auto_431689 ?auto_431694 ) ) ( not ( = ?auto_431689 ?auto_431695 ) ) ( not ( = ?auto_431689 ?auto_431696 ) ) ( not ( = ?auto_431690 ?auto_431691 ) ) ( not ( = ?auto_431690 ?auto_431692 ) ) ( not ( = ?auto_431690 ?auto_431693 ) ) ( not ( = ?auto_431690 ?auto_431694 ) ) ( not ( = ?auto_431690 ?auto_431695 ) ) ( not ( = ?auto_431690 ?auto_431696 ) ) ( not ( = ?auto_431691 ?auto_431692 ) ) ( not ( = ?auto_431691 ?auto_431693 ) ) ( not ( = ?auto_431691 ?auto_431694 ) ) ( not ( = ?auto_431691 ?auto_431695 ) ) ( not ( = ?auto_431691 ?auto_431696 ) ) ( not ( = ?auto_431692 ?auto_431693 ) ) ( not ( = ?auto_431692 ?auto_431694 ) ) ( not ( = ?auto_431692 ?auto_431695 ) ) ( not ( = ?auto_431692 ?auto_431696 ) ) ( not ( = ?auto_431693 ?auto_431694 ) ) ( not ( = ?auto_431693 ?auto_431695 ) ) ( not ( = ?auto_431693 ?auto_431696 ) ) ( not ( = ?auto_431694 ?auto_431695 ) ) ( not ( = ?auto_431694 ?auto_431696 ) ) ( not ( = ?auto_431695 ?auto_431696 ) ) ( ON ?auto_431694 ?auto_431695 ) ( ON ?auto_431693 ?auto_431694 ) ( ON ?auto_431692 ?auto_431693 ) ( ON ?auto_431691 ?auto_431692 ) ( ON ?auto_431690 ?auto_431691 ) ( ON ?auto_431689 ?auto_431690 ) ( ON ?auto_431688 ?auto_431689 ) ( ON ?auto_431687 ?auto_431688 ) ( CLEAR ?auto_431685 ) ( ON ?auto_431686 ?auto_431687 ) ( CLEAR ?auto_431686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_431683 ?auto_431684 ?auto_431685 ?auto_431686 )
      ( MAKE-13PILE ?auto_431683 ?auto_431684 ?auto_431685 ?auto_431686 ?auto_431687 ?auto_431688 ?auto_431689 ?auto_431690 ?auto_431691 ?auto_431692 ?auto_431693 ?auto_431694 ?auto_431695 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431737 - BLOCK
      ?auto_431738 - BLOCK
      ?auto_431739 - BLOCK
      ?auto_431740 - BLOCK
      ?auto_431741 - BLOCK
      ?auto_431742 - BLOCK
      ?auto_431743 - BLOCK
      ?auto_431744 - BLOCK
      ?auto_431745 - BLOCK
      ?auto_431746 - BLOCK
      ?auto_431747 - BLOCK
      ?auto_431748 - BLOCK
      ?auto_431749 - BLOCK
    )
    :vars
    (
      ?auto_431750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431749 ?auto_431750 ) ( ON-TABLE ?auto_431737 ) ( ON ?auto_431738 ?auto_431737 ) ( not ( = ?auto_431737 ?auto_431738 ) ) ( not ( = ?auto_431737 ?auto_431739 ) ) ( not ( = ?auto_431737 ?auto_431740 ) ) ( not ( = ?auto_431737 ?auto_431741 ) ) ( not ( = ?auto_431737 ?auto_431742 ) ) ( not ( = ?auto_431737 ?auto_431743 ) ) ( not ( = ?auto_431737 ?auto_431744 ) ) ( not ( = ?auto_431737 ?auto_431745 ) ) ( not ( = ?auto_431737 ?auto_431746 ) ) ( not ( = ?auto_431737 ?auto_431747 ) ) ( not ( = ?auto_431737 ?auto_431748 ) ) ( not ( = ?auto_431737 ?auto_431749 ) ) ( not ( = ?auto_431737 ?auto_431750 ) ) ( not ( = ?auto_431738 ?auto_431739 ) ) ( not ( = ?auto_431738 ?auto_431740 ) ) ( not ( = ?auto_431738 ?auto_431741 ) ) ( not ( = ?auto_431738 ?auto_431742 ) ) ( not ( = ?auto_431738 ?auto_431743 ) ) ( not ( = ?auto_431738 ?auto_431744 ) ) ( not ( = ?auto_431738 ?auto_431745 ) ) ( not ( = ?auto_431738 ?auto_431746 ) ) ( not ( = ?auto_431738 ?auto_431747 ) ) ( not ( = ?auto_431738 ?auto_431748 ) ) ( not ( = ?auto_431738 ?auto_431749 ) ) ( not ( = ?auto_431738 ?auto_431750 ) ) ( not ( = ?auto_431739 ?auto_431740 ) ) ( not ( = ?auto_431739 ?auto_431741 ) ) ( not ( = ?auto_431739 ?auto_431742 ) ) ( not ( = ?auto_431739 ?auto_431743 ) ) ( not ( = ?auto_431739 ?auto_431744 ) ) ( not ( = ?auto_431739 ?auto_431745 ) ) ( not ( = ?auto_431739 ?auto_431746 ) ) ( not ( = ?auto_431739 ?auto_431747 ) ) ( not ( = ?auto_431739 ?auto_431748 ) ) ( not ( = ?auto_431739 ?auto_431749 ) ) ( not ( = ?auto_431739 ?auto_431750 ) ) ( not ( = ?auto_431740 ?auto_431741 ) ) ( not ( = ?auto_431740 ?auto_431742 ) ) ( not ( = ?auto_431740 ?auto_431743 ) ) ( not ( = ?auto_431740 ?auto_431744 ) ) ( not ( = ?auto_431740 ?auto_431745 ) ) ( not ( = ?auto_431740 ?auto_431746 ) ) ( not ( = ?auto_431740 ?auto_431747 ) ) ( not ( = ?auto_431740 ?auto_431748 ) ) ( not ( = ?auto_431740 ?auto_431749 ) ) ( not ( = ?auto_431740 ?auto_431750 ) ) ( not ( = ?auto_431741 ?auto_431742 ) ) ( not ( = ?auto_431741 ?auto_431743 ) ) ( not ( = ?auto_431741 ?auto_431744 ) ) ( not ( = ?auto_431741 ?auto_431745 ) ) ( not ( = ?auto_431741 ?auto_431746 ) ) ( not ( = ?auto_431741 ?auto_431747 ) ) ( not ( = ?auto_431741 ?auto_431748 ) ) ( not ( = ?auto_431741 ?auto_431749 ) ) ( not ( = ?auto_431741 ?auto_431750 ) ) ( not ( = ?auto_431742 ?auto_431743 ) ) ( not ( = ?auto_431742 ?auto_431744 ) ) ( not ( = ?auto_431742 ?auto_431745 ) ) ( not ( = ?auto_431742 ?auto_431746 ) ) ( not ( = ?auto_431742 ?auto_431747 ) ) ( not ( = ?auto_431742 ?auto_431748 ) ) ( not ( = ?auto_431742 ?auto_431749 ) ) ( not ( = ?auto_431742 ?auto_431750 ) ) ( not ( = ?auto_431743 ?auto_431744 ) ) ( not ( = ?auto_431743 ?auto_431745 ) ) ( not ( = ?auto_431743 ?auto_431746 ) ) ( not ( = ?auto_431743 ?auto_431747 ) ) ( not ( = ?auto_431743 ?auto_431748 ) ) ( not ( = ?auto_431743 ?auto_431749 ) ) ( not ( = ?auto_431743 ?auto_431750 ) ) ( not ( = ?auto_431744 ?auto_431745 ) ) ( not ( = ?auto_431744 ?auto_431746 ) ) ( not ( = ?auto_431744 ?auto_431747 ) ) ( not ( = ?auto_431744 ?auto_431748 ) ) ( not ( = ?auto_431744 ?auto_431749 ) ) ( not ( = ?auto_431744 ?auto_431750 ) ) ( not ( = ?auto_431745 ?auto_431746 ) ) ( not ( = ?auto_431745 ?auto_431747 ) ) ( not ( = ?auto_431745 ?auto_431748 ) ) ( not ( = ?auto_431745 ?auto_431749 ) ) ( not ( = ?auto_431745 ?auto_431750 ) ) ( not ( = ?auto_431746 ?auto_431747 ) ) ( not ( = ?auto_431746 ?auto_431748 ) ) ( not ( = ?auto_431746 ?auto_431749 ) ) ( not ( = ?auto_431746 ?auto_431750 ) ) ( not ( = ?auto_431747 ?auto_431748 ) ) ( not ( = ?auto_431747 ?auto_431749 ) ) ( not ( = ?auto_431747 ?auto_431750 ) ) ( not ( = ?auto_431748 ?auto_431749 ) ) ( not ( = ?auto_431748 ?auto_431750 ) ) ( not ( = ?auto_431749 ?auto_431750 ) ) ( ON ?auto_431748 ?auto_431749 ) ( ON ?auto_431747 ?auto_431748 ) ( ON ?auto_431746 ?auto_431747 ) ( ON ?auto_431745 ?auto_431746 ) ( ON ?auto_431744 ?auto_431745 ) ( ON ?auto_431743 ?auto_431744 ) ( ON ?auto_431742 ?auto_431743 ) ( ON ?auto_431741 ?auto_431742 ) ( ON ?auto_431740 ?auto_431741 ) ( CLEAR ?auto_431738 ) ( ON ?auto_431739 ?auto_431740 ) ( CLEAR ?auto_431739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_431737 ?auto_431738 ?auto_431739 )
      ( MAKE-13PILE ?auto_431737 ?auto_431738 ?auto_431739 ?auto_431740 ?auto_431741 ?auto_431742 ?auto_431743 ?auto_431744 ?auto_431745 ?auto_431746 ?auto_431747 ?auto_431748 ?auto_431749 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431791 - BLOCK
      ?auto_431792 - BLOCK
      ?auto_431793 - BLOCK
      ?auto_431794 - BLOCK
      ?auto_431795 - BLOCK
      ?auto_431796 - BLOCK
      ?auto_431797 - BLOCK
      ?auto_431798 - BLOCK
      ?auto_431799 - BLOCK
      ?auto_431800 - BLOCK
      ?auto_431801 - BLOCK
      ?auto_431802 - BLOCK
      ?auto_431803 - BLOCK
    )
    :vars
    (
      ?auto_431804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431803 ?auto_431804 ) ( ON-TABLE ?auto_431791 ) ( not ( = ?auto_431791 ?auto_431792 ) ) ( not ( = ?auto_431791 ?auto_431793 ) ) ( not ( = ?auto_431791 ?auto_431794 ) ) ( not ( = ?auto_431791 ?auto_431795 ) ) ( not ( = ?auto_431791 ?auto_431796 ) ) ( not ( = ?auto_431791 ?auto_431797 ) ) ( not ( = ?auto_431791 ?auto_431798 ) ) ( not ( = ?auto_431791 ?auto_431799 ) ) ( not ( = ?auto_431791 ?auto_431800 ) ) ( not ( = ?auto_431791 ?auto_431801 ) ) ( not ( = ?auto_431791 ?auto_431802 ) ) ( not ( = ?auto_431791 ?auto_431803 ) ) ( not ( = ?auto_431791 ?auto_431804 ) ) ( not ( = ?auto_431792 ?auto_431793 ) ) ( not ( = ?auto_431792 ?auto_431794 ) ) ( not ( = ?auto_431792 ?auto_431795 ) ) ( not ( = ?auto_431792 ?auto_431796 ) ) ( not ( = ?auto_431792 ?auto_431797 ) ) ( not ( = ?auto_431792 ?auto_431798 ) ) ( not ( = ?auto_431792 ?auto_431799 ) ) ( not ( = ?auto_431792 ?auto_431800 ) ) ( not ( = ?auto_431792 ?auto_431801 ) ) ( not ( = ?auto_431792 ?auto_431802 ) ) ( not ( = ?auto_431792 ?auto_431803 ) ) ( not ( = ?auto_431792 ?auto_431804 ) ) ( not ( = ?auto_431793 ?auto_431794 ) ) ( not ( = ?auto_431793 ?auto_431795 ) ) ( not ( = ?auto_431793 ?auto_431796 ) ) ( not ( = ?auto_431793 ?auto_431797 ) ) ( not ( = ?auto_431793 ?auto_431798 ) ) ( not ( = ?auto_431793 ?auto_431799 ) ) ( not ( = ?auto_431793 ?auto_431800 ) ) ( not ( = ?auto_431793 ?auto_431801 ) ) ( not ( = ?auto_431793 ?auto_431802 ) ) ( not ( = ?auto_431793 ?auto_431803 ) ) ( not ( = ?auto_431793 ?auto_431804 ) ) ( not ( = ?auto_431794 ?auto_431795 ) ) ( not ( = ?auto_431794 ?auto_431796 ) ) ( not ( = ?auto_431794 ?auto_431797 ) ) ( not ( = ?auto_431794 ?auto_431798 ) ) ( not ( = ?auto_431794 ?auto_431799 ) ) ( not ( = ?auto_431794 ?auto_431800 ) ) ( not ( = ?auto_431794 ?auto_431801 ) ) ( not ( = ?auto_431794 ?auto_431802 ) ) ( not ( = ?auto_431794 ?auto_431803 ) ) ( not ( = ?auto_431794 ?auto_431804 ) ) ( not ( = ?auto_431795 ?auto_431796 ) ) ( not ( = ?auto_431795 ?auto_431797 ) ) ( not ( = ?auto_431795 ?auto_431798 ) ) ( not ( = ?auto_431795 ?auto_431799 ) ) ( not ( = ?auto_431795 ?auto_431800 ) ) ( not ( = ?auto_431795 ?auto_431801 ) ) ( not ( = ?auto_431795 ?auto_431802 ) ) ( not ( = ?auto_431795 ?auto_431803 ) ) ( not ( = ?auto_431795 ?auto_431804 ) ) ( not ( = ?auto_431796 ?auto_431797 ) ) ( not ( = ?auto_431796 ?auto_431798 ) ) ( not ( = ?auto_431796 ?auto_431799 ) ) ( not ( = ?auto_431796 ?auto_431800 ) ) ( not ( = ?auto_431796 ?auto_431801 ) ) ( not ( = ?auto_431796 ?auto_431802 ) ) ( not ( = ?auto_431796 ?auto_431803 ) ) ( not ( = ?auto_431796 ?auto_431804 ) ) ( not ( = ?auto_431797 ?auto_431798 ) ) ( not ( = ?auto_431797 ?auto_431799 ) ) ( not ( = ?auto_431797 ?auto_431800 ) ) ( not ( = ?auto_431797 ?auto_431801 ) ) ( not ( = ?auto_431797 ?auto_431802 ) ) ( not ( = ?auto_431797 ?auto_431803 ) ) ( not ( = ?auto_431797 ?auto_431804 ) ) ( not ( = ?auto_431798 ?auto_431799 ) ) ( not ( = ?auto_431798 ?auto_431800 ) ) ( not ( = ?auto_431798 ?auto_431801 ) ) ( not ( = ?auto_431798 ?auto_431802 ) ) ( not ( = ?auto_431798 ?auto_431803 ) ) ( not ( = ?auto_431798 ?auto_431804 ) ) ( not ( = ?auto_431799 ?auto_431800 ) ) ( not ( = ?auto_431799 ?auto_431801 ) ) ( not ( = ?auto_431799 ?auto_431802 ) ) ( not ( = ?auto_431799 ?auto_431803 ) ) ( not ( = ?auto_431799 ?auto_431804 ) ) ( not ( = ?auto_431800 ?auto_431801 ) ) ( not ( = ?auto_431800 ?auto_431802 ) ) ( not ( = ?auto_431800 ?auto_431803 ) ) ( not ( = ?auto_431800 ?auto_431804 ) ) ( not ( = ?auto_431801 ?auto_431802 ) ) ( not ( = ?auto_431801 ?auto_431803 ) ) ( not ( = ?auto_431801 ?auto_431804 ) ) ( not ( = ?auto_431802 ?auto_431803 ) ) ( not ( = ?auto_431802 ?auto_431804 ) ) ( not ( = ?auto_431803 ?auto_431804 ) ) ( ON ?auto_431802 ?auto_431803 ) ( ON ?auto_431801 ?auto_431802 ) ( ON ?auto_431800 ?auto_431801 ) ( ON ?auto_431799 ?auto_431800 ) ( ON ?auto_431798 ?auto_431799 ) ( ON ?auto_431797 ?auto_431798 ) ( ON ?auto_431796 ?auto_431797 ) ( ON ?auto_431795 ?auto_431796 ) ( ON ?auto_431794 ?auto_431795 ) ( ON ?auto_431793 ?auto_431794 ) ( CLEAR ?auto_431791 ) ( ON ?auto_431792 ?auto_431793 ) ( CLEAR ?auto_431792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_431791 ?auto_431792 )
      ( MAKE-13PILE ?auto_431791 ?auto_431792 ?auto_431793 ?auto_431794 ?auto_431795 ?auto_431796 ?auto_431797 ?auto_431798 ?auto_431799 ?auto_431800 ?auto_431801 ?auto_431802 ?auto_431803 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_431845 - BLOCK
      ?auto_431846 - BLOCK
      ?auto_431847 - BLOCK
      ?auto_431848 - BLOCK
      ?auto_431849 - BLOCK
      ?auto_431850 - BLOCK
      ?auto_431851 - BLOCK
      ?auto_431852 - BLOCK
      ?auto_431853 - BLOCK
      ?auto_431854 - BLOCK
      ?auto_431855 - BLOCK
      ?auto_431856 - BLOCK
      ?auto_431857 - BLOCK
    )
    :vars
    (
      ?auto_431858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431857 ?auto_431858 ) ( not ( = ?auto_431845 ?auto_431846 ) ) ( not ( = ?auto_431845 ?auto_431847 ) ) ( not ( = ?auto_431845 ?auto_431848 ) ) ( not ( = ?auto_431845 ?auto_431849 ) ) ( not ( = ?auto_431845 ?auto_431850 ) ) ( not ( = ?auto_431845 ?auto_431851 ) ) ( not ( = ?auto_431845 ?auto_431852 ) ) ( not ( = ?auto_431845 ?auto_431853 ) ) ( not ( = ?auto_431845 ?auto_431854 ) ) ( not ( = ?auto_431845 ?auto_431855 ) ) ( not ( = ?auto_431845 ?auto_431856 ) ) ( not ( = ?auto_431845 ?auto_431857 ) ) ( not ( = ?auto_431845 ?auto_431858 ) ) ( not ( = ?auto_431846 ?auto_431847 ) ) ( not ( = ?auto_431846 ?auto_431848 ) ) ( not ( = ?auto_431846 ?auto_431849 ) ) ( not ( = ?auto_431846 ?auto_431850 ) ) ( not ( = ?auto_431846 ?auto_431851 ) ) ( not ( = ?auto_431846 ?auto_431852 ) ) ( not ( = ?auto_431846 ?auto_431853 ) ) ( not ( = ?auto_431846 ?auto_431854 ) ) ( not ( = ?auto_431846 ?auto_431855 ) ) ( not ( = ?auto_431846 ?auto_431856 ) ) ( not ( = ?auto_431846 ?auto_431857 ) ) ( not ( = ?auto_431846 ?auto_431858 ) ) ( not ( = ?auto_431847 ?auto_431848 ) ) ( not ( = ?auto_431847 ?auto_431849 ) ) ( not ( = ?auto_431847 ?auto_431850 ) ) ( not ( = ?auto_431847 ?auto_431851 ) ) ( not ( = ?auto_431847 ?auto_431852 ) ) ( not ( = ?auto_431847 ?auto_431853 ) ) ( not ( = ?auto_431847 ?auto_431854 ) ) ( not ( = ?auto_431847 ?auto_431855 ) ) ( not ( = ?auto_431847 ?auto_431856 ) ) ( not ( = ?auto_431847 ?auto_431857 ) ) ( not ( = ?auto_431847 ?auto_431858 ) ) ( not ( = ?auto_431848 ?auto_431849 ) ) ( not ( = ?auto_431848 ?auto_431850 ) ) ( not ( = ?auto_431848 ?auto_431851 ) ) ( not ( = ?auto_431848 ?auto_431852 ) ) ( not ( = ?auto_431848 ?auto_431853 ) ) ( not ( = ?auto_431848 ?auto_431854 ) ) ( not ( = ?auto_431848 ?auto_431855 ) ) ( not ( = ?auto_431848 ?auto_431856 ) ) ( not ( = ?auto_431848 ?auto_431857 ) ) ( not ( = ?auto_431848 ?auto_431858 ) ) ( not ( = ?auto_431849 ?auto_431850 ) ) ( not ( = ?auto_431849 ?auto_431851 ) ) ( not ( = ?auto_431849 ?auto_431852 ) ) ( not ( = ?auto_431849 ?auto_431853 ) ) ( not ( = ?auto_431849 ?auto_431854 ) ) ( not ( = ?auto_431849 ?auto_431855 ) ) ( not ( = ?auto_431849 ?auto_431856 ) ) ( not ( = ?auto_431849 ?auto_431857 ) ) ( not ( = ?auto_431849 ?auto_431858 ) ) ( not ( = ?auto_431850 ?auto_431851 ) ) ( not ( = ?auto_431850 ?auto_431852 ) ) ( not ( = ?auto_431850 ?auto_431853 ) ) ( not ( = ?auto_431850 ?auto_431854 ) ) ( not ( = ?auto_431850 ?auto_431855 ) ) ( not ( = ?auto_431850 ?auto_431856 ) ) ( not ( = ?auto_431850 ?auto_431857 ) ) ( not ( = ?auto_431850 ?auto_431858 ) ) ( not ( = ?auto_431851 ?auto_431852 ) ) ( not ( = ?auto_431851 ?auto_431853 ) ) ( not ( = ?auto_431851 ?auto_431854 ) ) ( not ( = ?auto_431851 ?auto_431855 ) ) ( not ( = ?auto_431851 ?auto_431856 ) ) ( not ( = ?auto_431851 ?auto_431857 ) ) ( not ( = ?auto_431851 ?auto_431858 ) ) ( not ( = ?auto_431852 ?auto_431853 ) ) ( not ( = ?auto_431852 ?auto_431854 ) ) ( not ( = ?auto_431852 ?auto_431855 ) ) ( not ( = ?auto_431852 ?auto_431856 ) ) ( not ( = ?auto_431852 ?auto_431857 ) ) ( not ( = ?auto_431852 ?auto_431858 ) ) ( not ( = ?auto_431853 ?auto_431854 ) ) ( not ( = ?auto_431853 ?auto_431855 ) ) ( not ( = ?auto_431853 ?auto_431856 ) ) ( not ( = ?auto_431853 ?auto_431857 ) ) ( not ( = ?auto_431853 ?auto_431858 ) ) ( not ( = ?auto_431854 ?auto_431855 ) ) ( not ( = ?auto_431854 ?auto_431856 ) ) ( not ( = ?auto_431854 ?auto_431857 ) ) ( not ( = ?auto_431854 ?auto_431858 ) ) ( not ( = ?auto_431855 ?auto_431856 ) ) ( not ( = ?auto_431855 ?auto_431857 ) ) ( not ( = ?auto_431855 ?auto_431858 ) ) ( not ( = ?auto_431856 ?auto_431857 ) ) ( not ( = ?auto_431856 ?auto_431858 ) ) ( not ( = ?auto_431857 ?auto_431858 ) ) ( ON ?auto_431856 ?auto_431857 ) ( ON ?auto_431855 ?auto_431856 ) ( ON ?auto_431854 ?auto_431855 ) ( ON ?auto_431853 ?auto_431854 ) ( ON ?auto_431852 ?auto_431853 ) ( ON ?auto_431851 ?auto_431852 ) ( ON ?auto_431850 ?auto_431851 ) ( ON ?auto_431849 ?auto_431850 ) ( ON ?auto_431848 ?auto_431849 ) ( ON ?auto_431847 ?auto_431848 ) ( ON ?auto_431846 ?auto_431847 ) ( ON ?auto_431845 ?auto_431846 ) ( CLEAR ?auto_431845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_431845 )
      ( MAKE-13PILE ?auto_431845 ?auto_431846 ?auto_431847 ?auto_431848 ?auto_431849 ?auto_431850 ?auto_431851 ?auto_431852 ?auto_431853 ?auto_431854 ?auto_431855 ?auto_431856 ?auto_431857 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_431900 - BLOCK
      ?auto_431901 - BLOCK
      ?auto_431902 - BLOCK
      ?auto_431903 - BLOCK
      ?auto_431904 - BLOCK
      ?auto_431905 - BLOCK
      ?auto_431906 - BLOCK
      ?auto_431907 - BLOCK
      ?auto_431908 - BLOCK
      ?auto_431909 - BLOCK
      ?auto_431910 - BLOCK
      ?auto_431911 - BLOCK
      ?auto_431912 - BLOCK
      ?auto_431913 - BLOCK
    )
    :vars
    (
      ?auto_431914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_431912 ) ( ON ?auto_431913 ?auto_431914 ) ( CLEAR ?auto_431913 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_431900 ) ( ON ?auto_431901 ?auto_431900 ) ( ON ?auto_431902 ?auto_431901 ) ( ON ?auto_431903 ?auto_431902 ) ( ON ?auto_431904 ?auto_431903 ) ( ON ?auto_431905 ?auto_431904 ) ( ON ?auto_431906 ?auto_431905 ) ( ON ?auto_431907 ?auto_431906 ) ( ON ?auto_431908 ?auto_431907 ) ( ON ?auto_431909 ?auto_431908 ) ( ON ?auto_431910 ?auto_431909 ) ( ON ?auto_431911 ?auto_431910 ) ( ON ?auto_431912 ?auto_431911 ) ( not ( = ?auto_431900 ?auto_431901 ) ) ( not ( = ?auto_431900 ?auto_431902 ) ) ( not ( = ?auto_431900 ?auto_431903 ) ) ( not ( = ?auto_431900 ?auto_431904 ) ) ( not ( = ?auto_431900 ?auto_431905 ) ) ( not ( = ?auto_431900 ?auto_431906 ) ) ( not ( = ?auto_431900 ?auto_431907 ) ) ( not ( = ?auto_431900 ?auto_431908 ) ) ( not ( = ?auto_431900 ?auto_431909 ) ) ( not ( = ?auto_431900 ?auto_431910 ) ) ( not ( = ?auto_431900 ?auto_431911 ) ) ( not ( = ?auto_431900 ?auto_431912 ) ) ( not ( = ?auto_431900 ?auto_431913 ) ) ( not ( = ?auto_431900 ?auto_431914 ) ) ( not ( = ?auto_431901 ?auto_431902 ) ) ( not ( = ?auto_431901 ?auto_431903 ) ) ( not ( = ?auto_431901 ?auto_431904 ) ) ( not ( = ?auto_431901 ?auto_431905 ) ) ( not ( = ?auto_431901 ?auto_431906 ) ) ( not ( = ?auto_431901 ?auto_431907 ) ) ( not ( = ?auto_431901 ?auto_431908 ) ) ( not ( = ?auto_431901 ?auto_431909 ) ) ( not ( = ?auto_431901 ?auto_431910 ) ) ( not ( = ?auto_431901 ?auto_431911 ) ) ( not ( = ?auto_431901 ?auto_431912 ) ) ( not ( = ?auto_431901 ?auto_431913 ) ) ( not ( = ?auto_431901 ?auto_431914 ) ) ( not ( = ?auto_431902 ?auto_431903 ) ) ( not ( = ?auto_431902 ?auto_431904 ) ) ( not ( = ?auto_431902 ?auto_431905 ) ) ( not ( = ?auto_431902 ?auto_431906 ) ) ( not ( = ?auto_431902 ?auto_431907 ) ) ( not ( = ?auto_431902 ?auto_431908 ) ) ( not ( = ?auto_431902 ?auto_431909 ) ) ( not ( = ?auto_431902 ?auto_431910 ) ) ( not ( = ?auto_431902 ?auto_431911 ) ) ( not ( = ?auto_431902 ?auto_431912 ) ) ( not ( = ?auto_431902 ?auto_431913 ) ) ( not ( = ?auto_431902 ?auto_431914 ) ) ( not ( = ?auto_431903 ?auto_431904 ) ) ( not ( = ?auto_431903 ?auto_431905 ) ) ( not ( = ?auto_431903 ?auto_431906 ) ) ( not ( = ?auto_431903 ?auto_431907 ) ) ( not ( = ?auto_431903 ?auto_431908 ) ) ( not ( = ?auto_431903 ?auto_431909 ) ) ( not ( = ?auto_431903 ?auto_431910 ) ) ( not ( = ?auto_431903 ?auto_431911 ) ) ( not ( = ?auto_431903 ?auto_431912 ) ) ( not ( = ?auto_431903 ?auto_431913 ) ) ( not ( = ?auto_431903 ?auto_431914 ) ) ( not ( = ?auto_431904 ?auto_431905 ) ) ( not ( = ?auto_431904 ?auto_431906 ) ) ( not ( = ?auto_431904 ?auto_431907 ) ) ( not ( = ?auto_431904 ?auto_431908 ) ) ( not ( = ?auto_431904 ?auto_431909 ) ) ( not ( = ?auto_431904 ?auto_431910 ) ) ( not ( = ?auto_431904 ?auto_431911 ) ) ( not ( = ?auto_431904 ?auto_431912 ) ) ( not ( = ?auto_431904 ?auto_431913 ) ) ( not ( = ?auto_431904 ?auto_431914 ) ) ( not ( = ?auto_431905 ?auto_431906 ) ) ( not ( = ?auto_431905 ?auto_431907 ) ) ( not ( = ?auto_431905 ?auto_431908 ) ) ( not ( = ?auto_431905 ?auto_431909 ) ) ( not ( = ?auto_431905 ?auto_431910 ) ) ( not ( = ?auto_431905 ?auto_431911 ) ) ( not ( = ?auto_431905 ?auto_431912 ) ) ( not ( = ?auto_431905 ?auto_431913 ) ) ( not ( = ?auto_431905 ?auto_431914 ) ) ( not ( = ?auto_431906 ?auto_431907 ) ) ( not ( = ?auto_431906 ?auto_431908 ) ) ( not ( = ?auto_431906 ?auto_431909 ) ) ( not ( = ?auto_431906 ?auto_431910 ) ) ( not ( = ?auto_431906 ?auto_431911 ) ) ( not ( = ?auto_431906 ?auto_431912 ) ) ( not ( = ?auto_431906 ?auto_431913 ) ) ( not ( = ?auto_431906 ?auto_431914 ) ) ( not ( = ?auto_431907 ?auto_431908 ) ) ( not ( = ?auto_431907 ?auto_431909 ) ) ( not ( = ?auto_431907 ?auto_431910 ) ) ( not ( = ?auto_431907 ?auto_431911 ) ) ( not ( = ?auto_431907 ?auto_431912 ) ) ( not ( = ?auto_431907 ?auto_431913 ) ) ( not ( = ?auto_431907 ?auto_431914 ) ) ( not ( = ?auto_431908 ?auto_431909 ) ) ( not ( = ?auto_431908 ?auto_431910 ) ) ( not ( = ?auto_431908 ?auto_431911 ) ) ( not ( = ?auto_431908 ?auto_431912 ) ) ( not ( = ?auto_431908 ?auto_431913 ) ) ( not ( = ?auto_431908 ?auto_431914 ) ) ( not ( = ?auto_431909 ?auto_431910 ) ) ( not ( = ?auto_431909 ?auto_431911 ) ) ( not ( = ?auto_431909 ?auto_431912 ) ) ( not ( = ?auto_431909 ?auto_431913 ) ) ( not ( = ?auto_431909 ?auto_431914 ) ) ( not ( = ?auto_431910 ?auto_431911 ) ) ( not ( = ?auto_431910 ?auto_431912 ) ) ( not ( = ?auto_431910 ?auto_431913 ) ) ( not ( = ?auto_431910 ?auto_431914 ) ) ( not ( = ?auto_431911 ?auto_431912 ) ) ( not ( = ?auto_431911 ?auto_431913 ) ) ( not ( = ?auto_431911 ?auto_431914 ) ) ( not ( = ?auto_431912 ?auto_431913 ) ) ( not ( = ?auto_431912 ?auto_431914 ) ) ( not ( = ?auto_431913 ?auto_431914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_431913 ?auto_431914 )
      ( !STACK ?auto_431913 ?auto_431912 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_431958 - BLOCK
      ?auto_431959 - BLOCK
      ?auto_431960 - BLOCK
      ?auto_431961 - BLOCK
      ?auto_431962 - BLOCK
      ?auto_431963 - BLOCK
      ?auto_431964 - BLOCK
      ?auto_431965 - BLOCK
      ?auto_431966 - BLOCK
      ?auto_431967 - BLOCK
      ?auto_431968 - BLOCK
      ?auto_431969 - BLOCK
      ?auto_431970 - BLOCK
      ?auto_431971 - BLOCK
    )
    :vars
    (
      ?auto_431972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_431971 ?auto_431972 ) ( ON-TABLE ?auto_431958 ) ( ON ?auto_431959 ?auto_431958 ) ( ON ?auto_431960 ?auto_431959 ) ( ON ?auto_431961 ?auto_431960 ) ( ON ?auto_431962 ?auto_431961 ) ( ON ?auto_431963 ?auto_431962 ) ( ON ?auto_431964 ?auto_431963 ) ( ON ?auto_431965 ?auto_431964 ) ( ON ?auto_431966 ?auto_431965 ) ( ON ?auto_431967 ?auto_431966 ) ( ON ?auto_431968 ?auto_431967 ) ( ON ?auto_431969 ?auto_431968 ) ( not ( = ?auto_431958 ?auto_431959 ) ) ( not ( = ?auto_431958 ?auto_431960 ) ) ( not ( = ?auto_431958 ?auto_431961 ) ) ( not ( = ?auto_431958 ?auto_431962 ) ) ( not ( = ?auto_431958 ?auto_431963 ) ) ( not ( = ?auto_431958 ?auto_431964 ) ) ( not ( = ?auto_431958 ?auto_431965 ) ) ( not ( = ?auto_431958 ?auto_431966 ) ) ( not ( = ?auto_431958 ?auto_431967 ) ) ( not ( = ?auto_431958 ?auto_431968 ) ) ( not ( = ?auto_431958 ?auto_431969 ) ) ( not ( = ?auto_431958 ?auto_431970 ) ) ( not ( = ?auto_431958 ?auto_431971 ) ) ( not ( = ?auto_431958 ?auto_431972 ) ) ( not ( = ?auto_431959 ?auto_431960 ) ) ( not ( = ?auto_431959 ?auto_431961 ) ) ( not ( = ?auto_431959 ?auto_431962 ) ) ( not ( = ?auto_431959 ?auto_431963 ) ) ( not ( = ?auto_431959 ?auto_431964 ) ) ( not ( = ?auto_431959 ?auto_431965 ) ) ( not ( = ?auto_431959 ?auto_431966 ) ) ( not ( = ?auto_431959 ?auto_431967 ) ) ( not ( = ?auto_431959 ?auto_431968 ) ) ( not ( = ?auto_431959 ?auto_431969 ) ) ( not ( = ?auto_431959 ?auto_431970 ) ) ( not ( = ?auto_431959 ?auto_431971 ) ) ( not ( = ?auto_431959 ?auto_431972 ) ) ( not ( = ?auto_431960 ?auto_431961 ) ) ( not ( = ?auto_431960 ?auto_431962 ) ) ( not ( = ?auto_431960 ?auto_431963 ) ) ( not ( = ?auto_431960 ?auto_431964 ) ) ( not ( = ?auto_431960 ?auto_431965 ) ) ( not ( = ?auto_431960 ?auto_431966 ) ) ( not ( = ?auto_431960 ?auto_431967 ) ) ( not ( = ?auto_431960 ?auto_431968 ) ) ( not ( = ?auto_431960 ?auto_431969 ) ) ( not ( = ?auto_431960 ?auto_431970 ) ) ( not ( = ?auto_431960 ?auto_431971 ) ) ( not ( = ?auto_431960 ?auto_431972 ) ) ( not ( = ?auto_431961 ?auto_431962 ) ) ( not ( = ?auto_431961 ?auto_431963 ) ) ( not ( = ?auto_431961 ?auto_431964 ) ) ( not ( = ?auto_431961 ?auto_431965 ) ) ( not ( = ?auto_431961 ?auto_431966 ) ) ( not ( = ?auto_431961 ?auto_431967 ) ) ( not ( = ?auto_431961 ?auto_431968 ) ) ( not ( = ?auto_431961 ?auto_431969 ) ) ( not ( = ?auto_431961 ?auto_431970 ) ) ( not ( = ?auto_431961 ?auto_431971 ) ) ( not ( = ?auto_431961 ?auto_431972 ) ) ( not ( = ?auto_431962 ?auto_431963 ) ) ( not ( = ?auto_431962 ?auto_431964 ) ) ( not ( = ?auto_431962 ?auto_431965 ) ) ( not ( = ?auto_431962 ?auto_431966 ) ) ( not ( = ?auto_431962 ?auto_431967 ) ) ( not ( = ?auto_431962 ?auto_431968 ) ) ( not ( = ?auto_431962 ?auto_431969 ) ) ( not ( = ?auto_431962 ?auto_431970 ) ) ( not ( = ?auto_431962 ?auto_431971 ) ) ( not ( = ?auto_431962 ?auto_431972 ) ) ( not ( = ?auto_431963 ?auto_431964 ) ) ( not ( = ?auto_431963 ?auto_431965 ) ) ( not ( = ?auto_431963 ?auto_431966 ) ) ( not ( = ?auto_431963 ?auto_431967 ) ) ( not ( = ?auto_431963 ?auto_431968 ) ) ( not ( = ?auto_431963 ?auto_431969 ) ) ( not ( = ?auto_431963 ?auto_431970 ) ) ( not ( = ?auto_431963 ?auto_431971 ) ) ( not ( = ?auto_431963 ?auto_431972 ) ) ( not ( = ?auto_431964 ?auto_431965 ) ) ( not ( = ?auto_431964 ?auto_431966 ) ) ( not ( = ?auto_431964 ?auto_431967 ) ) ( not ( = ?auto_431964 ?auto_431968 ) ) ( not ( = ?auto_431964 ?auto_431969 ) ) ( not ( = ?auto_431964 ?auto_431970 ) ) ( not ( = ?auto_431964 ?auto_431971 ) ) ( not ( = ?auto_431964 ?auto_431972 ) ) ( not ( = ?auto_431965 ?auto_431966 ) ) ( not ( = ?auto_431965 ?auto_431967 ) ) ( not ( = ?auto_431965 ?auto_431968 ) ) ( not ( = ?auto_431965 ?auto_431969 ) ) ( not ( = ?auto_431965 ?auto_431970 ) ) ( not ( = ?auto_431965 ?auto_431971 ) ) ( not ( = ?auto_431965 ?auto_431972 ) ) ( not ( = ?auto_431966 ?auto_431967 ) ) ( not ( = ?auto_431966 ?auto_431968 ) ) ( not ( = ?auto_431966 ?auto_431969 ) ) ( not ( = ?auto_431966 ?auto_431970 ) ) ( not ( = ?auto_431966 ?auto_431971 ) ) ( not ( = ?auto_431966 ?auto_431972 ) ) ( not ( = ?auto_431967 ?auto_431968 ) ) ( not ( = ?auto_431967 ?auto_431969 ) ) ( not ( = ?auto_431967 ?auto_431970 ) ) ( not ( = ?auto_431967 ?auto_431971 ) ) ( not ( = ?auto_431967 ?auto_431972 ) ) ( not ( = ?auto_431968 ?auto_431969 ) ) ( not ( = ?auto_431968 ?auto_431970 ) ) ( not ( = ?auto_431968 ?auto_431971 ) ) ( not ( = ?auto_431968 ?auto_431972 ) ) ( not ( = ?auto_431969 ?auto_431970 ) ) ( not ( = ?auto_431969 ?auto_431971 ) ) ( not ( = ?auto_431969 ?auto_431972 ) ) ( not ( = ?auto_431970 ?auto_431971 ) ) ( not ( = ?auto_431970 ?auto_431972 ) ) ( not ( = ?auto_431971 ?auto_431972 ) ) ( CLEAR ?auto_431969 ) ( ON ?auto_431970 ?auto_431971 ) ( CLEAR ?auto_431970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_431958 ?auto_431959 ?auto_431960 ?auto_431961 ?auto_431962 ?auto_431963 ?auto_431964 ?auto_431965 ?auto_431966 ?auto_431967 ?auto_431968 ?auto_431969 ?auto_431970 )
      ( MAKE-14PILE ?auto_431958 ?auto_431959 ?auto_431960 ?auto_431961 ?auto_431962 ?auto_431963 ?auto_431964 ?auto_431965 ?auto_431966 ?auto_431967 ?auto_431968 ?auto_431969 ?auto_431970 ?auto_431971 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432016 - BLOCK
      ?auto_432017 - BLOCK
      ?auto_432018 - BLOCK
      ?auto_432019 - BLOCK
      ?auto_432020 - BLOCK
      ?auto_432021 - BLOCK
      ?auto_432022 - BLOCK
      ?auto_432023 - BLOCK
      ?auto_432024 - BLOCK
      ?auto_432025 - BLOCK
      ?auto_432026 - BLOCK
      ?auto_432027 - BLOCK
      ?auto_432028 - BLOCK
      ?auto_432029 - BLOCK
    )
    :vars
    (
      ?auto_432030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432029 ?auto_432030 ) ( ON-TABLE ?auto_432016 ) ( ON ?auto_432017 ?auto_432016 ) ( ON ?auto_432018 ?auto_432017 ) ( ON ?auto_432019 ?auto_432018 ) ( ON ?auto_432020 ?auto_432019 ) ( ON ?auto_432021 ?auto_432020 ) ( ON ?auto_432022 ?auto_432021 ) ( ON ?auto_432023 ?auto_432022 ) ( ON ?auto_432024 ?auto_432023 ) ( ON ?auto_432025 ?auto_432024 ) ( ON ?auto_432026 ?auto_432025 ) ( not ( = ?auto_432016 ?auto_432017 ) ) ( not ( = ?auto_432016 ?auto_432018 ) ) ( not ( = ?auto_432016 ?auto_432019 ) ) ( not ( = ?auto_432016 ?auto_432020 ) ) ( not ( = ?auto_432016 ?auto_432021 ) ) ( not ( = ?auto_432016 ?auto_432022 ) ) ( not ( = ?auto_432016 ?auto_432023 ) ) ( not ( = ?auto_432016 ?auto_432024 ) ) ( not ( = ?auto_432016 ?auto_432025 ) ) ( not ( = ?auto_432016 ?auto_432026 ) ) ( not ( = ?auto_432016 ?auto_432027 ) ) ( not ( = ?auto_432016 ?auto_432028 ) ) ( not ( = ?auto_432016 ?auto_432029 ) ) ( not ( = ?auto_432016 ?auto_432030 ) ) ( not ( = ?auto_432017 ?auto_432018 ) ) ( not ( = ?auto_432017 ?auto_432019 ) ) ( not ( = ?auto_432017 ?auto_432020 ) ) ( not ( = ?auto_432017 ?auto_432021 ) ) ( not ( = ?auto_432017 ?auto_432022 ) ) ( not ( = ?auto_432017 ?auto_432023 ) ) ( not ( = ?auto_432017 ?auto_432024 ) ) ( not ( = ?auto_432017 ?auto_432025 ) ) ( not ( = ?auto_432017 ?auto_432026 ) ) ( not ( = ?auto_432017 ?auto_432027 ) ) ( not ( = ?auto_432017 ?auto_432028 ) ) ( not ( = ?auto_432017 ?auto_432029 ) ) ( not ( = ?auto_432017 ?auto_432030 ) ) ( not ( = ?auto_432018 ?auto_432019 ) ) ( not ( = ?auto_432018 ?auto_432020 ) ) ( not ( = ?auto_432018 ?auto_432021 ) ) ( not ( = ?auto_432018 ?auto_432022 ) ) ( not ( = ?auto_432018 ?auto_432023 ) ) ( not ( = ?auto_432018 ?auto_432024 ) ) ( not ( = ?auto_432018 ?auto_432025 ) ) ( not ( = ?auto_432018 ?auto_432026 ) ) ( not ( = ?auto_432018 ?auto_432027 ) ) ( not ( = ?auto_432018 ?auto_432028 ) ) ( not ( = ?auto_432018 ?auto_432029 ) ) ( not ( = ?auto_432018 ?auto_432030 ) ) ( not ( = ?auto_432019 ?auto_432020 ) ) ( not ( = ?auto_432019 ?auto_432021 ) ) ( not ( = ?auto_432019 ?auto_432022 ) ) ( not ( = ?auto_432019 ?auto_432023 ) ) ( not ( = ?auto_432019 ?auto_432024 ) ) ( not ( = ?auto_432019 ?auto_432025 ) ) ( not ( = ?auto_432019 ?auto_432026 ) ) ( not ( = ?auto_432019 ?auto_432027 ) ) ( not ( = ?auto_432019 ?auto_432028 ) ) ( not ( = ?auto_432019 ?auto_432029 ) ) ( not ( = ?auto_432019 ?auto_432030 ) ) ( not ( = ?auto_432020 ?auto_432021 ) ) ( not ( = ?auto_432020 ?auto_432022 ) ) ( not ( = ?auto_432020 ?auto_432023 ) ) ( not ( = ?auto_432020 ?auto_432024 ) ) ( not ( = ?auto_432020 ?auto_432025 ) ) ( not ( = ?auto_432020 ?auto_432026 ) ) ( not ( = ?auto_432020 ?auto_432027 ) ) ( not ( = ?auto_432020 ?auto_432028 ) ) ( not ( = ?auto_432020 ?auto_432029 ) ) ( not ( = ?auto_432020 ?auto_432030 ) ) ( not ( = ?auto_432021 ?auto_432022 ) ) ( not ( = ?auto_432021 ?auto_432023 ) ) ( not ( = ?auto_432021 ?auto_432024 ) ) ( not ( = ?auto_432021 ?auto_432025 ) ) ( not ( = ?auto_432021 ?auto_432026 ) ) ( not ( = ?auto_432021 ?auto_432027 ) ) ( not ( = ?auto_432021 ?auto_432028 ) ) ( not ( = ?auto_432021 ?auto_432029 ) ) ( not ( = ?auto_432021 ?auto_432030 ) ) ( not ( = ?auto_432022 ?auto_432023 ) ) ( not ( = ?auto_432022 ?auto_432024 ) ) ( not ( = ?auto_432022 ?auto_432025 ) ) ( not ( = ?auto_432022 ?auto_432026 ) ) ( not ( = ?auto_432022 ?auto_432027 ) ) ( not ( = ?auto_432022 ?auto_432028 ) ) ( not ( = ?auto_432022 ?auto_432029 ) ) ( not ( = ?auto_432022 ?auto_432030 ) ) ( not ( = ?auto_432023 ?auto_432024 ) ) ( not ( = ?auto_432023 ?auto_432025 ) ) ( not ( = ?auto_432023 ?auto_432026 ) ) ( not ( = ?auto_432023 ?auto_432027 ) ) ( not ( = ?auto_432023 ?auto_432028 ) ) ( not ( = ?auto_432023 ?auto_432029 ) ) ( not ( = ?auto_432023 ?auto_432030 ) ) ( not ( = ?auto_432024 ?auto_432025 ) ) ( not ( = ?auto_432024 ?auto_432026 ) ) ( not ( = ?auto_432024 ?auto_432027 ) ) ( not ( = ?auto_432024 ?auto_432028 ) ) ( not ( = ?auto_432024 ?auto_432029 ) ) ( not ( = ?auto_432024 ?auto_432030 ) ) ( not ( = ?auto_432025 ?auto_432026 ) ) ( not ( = ?auto_432025 ?auto_432027 ) ) ( not ( = ?auto_432025 ?auto_432028 ) ) ( not ( = ?auto_432025 ?auto_432029 ) ) ( not ( = ?auto_432025 ?auto_432030 ) ) ( not ( = ?auto_432026 ?auto_432027 ) ) ( not ( = ?auto_432026 ?auto_432028 ) ) ( not ( = ?auto_432026 ?auto_432029 ) ) ( not ( = ?auto_432026 ?auto_432030 ) ) ( not ( = ?auto_432027 ?auto_432028 ) ) ( not ( = ?auto_432027 ?auto_432029 ) ) ( not ( = ?auto_432027 ?auto_432030 ) ) ( not ( = ?auto_432028 ?auto_432029 ) ) ( not ( = ?auto_432028 ?auto_432030 ) ) ( not ( = ?auto_432029 ?auto_432030 ) ) ( ON ?auto_432028 ?auto_432029 ) ( CLEAR ?auto_432026 ) ( ON ?auto_432027 ?auto_432028 ) ( CLEAR ?auto_432027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_432016 ?auto_432017 ?auto_432018 ?auto_432019 ?auto_432020 ?auto_432021 ?auto_432022 ?auto_432023 ?auto_432024 ?auto_432025 ?auto_432026 ?auto_432027 )
      ( MAKE-14PILE ?auto_432016 ?auto_432017 ?auto_432018 ?auto_432019 ?auto_432020 ?auto_432021 ?auto_432022 ?auto_432023 ?auto_432024 ?auto_432025 ?auto_432026 ?auto_432027 ?auto_432028 ?auto_432029 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432074 - BLOCK
      ?auto_432075 - BLOCK
      ?auto_432076 - BLOCK
      ?auto_432077 - BLOCK
      ?auto_432078 - BLOCK
      ?auto_432079 - BLOCK
      ?auto_432080 - BLOCK
      ?auto_432081 - BLOCK
      ?auto_432082 - BLOCK
      ?auto_432083 - BLOCK
      ?auto_432084 - BLOCK
      ?auto_432085 - BLOCK
      ?auto_432086 - BLOCK
      ?auto_432087 - BLOCK
    )
    :vars
    (
      ?auto_432088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432087 ?auto_432088 ) ( ON-TABLE ?auto_432074 ) ( ON ?auto_432075 ?auto_432074 ) ( ON ?auto_432076 ?auto_432075 ) ( ON ?auto_432077 ?auto_432076 ) ( ON ?auto_432078 ?auto_432077 ) ( ON ?auto_432079 ?auto_432078 ) ( ON ?auto_432080 ?auto_432079 ) ( ON ?auto_432081 ?auto_432080 ) ( ON ?auto_432082 ?auto_432081 ) ( ON ?auto_432083 ?auto_432082 ) ( not ( = ?auto_432074 ?auto_432075 ) ) ( not ( = ?auto_432074 ?auto_432076 ) ) ( not ( = ?auto_432074 ?auto_432077 ) ) ( not ( = ?auto_432074 ?auto_432078 ) ) ( not ( = ?auto_432074 ?auto_432079 ) ) ( not ( = ?auto_432074 ?auto_432080 ) ) ( not ( = ?auto_432074 ?auto_432081 ) ) ( not ( = ?auto_432074 ?auto_432082 ) ) ( not ( = ?auto_432074 ?auto_432083 ) ) ( not ( = ?auto_432074 ?auto_432084 ) ) ( not ( = ?auto_432074 ?auto_432085 ) ) ( not ( = ?auto_432074 ?auto_432086 ) ) ( not ( = ?auto_432074 ?auto_432087 ) ) ( not ( = ?auto_432074 ?auto_432088 ) ) ( not ( = ?auto_432075 ?auto_432076 ) ) ( not ( = ?auto_432075 ?auto_432077 ) ) ( not ( = ?auto_432075 ?auto_432078 ) ) ( not ( = ?auto_432075 ?auto_432079 ) ) ( not ( = ?auto_432075 ?auto_432080 ) ) ( not ( = ?auto_432075 ?auto_432081 ) ) ( not ( = ?auto_432075 ?auto_432082 ) ) ( not ( = ?auto_432075 ?auto_432083 ) ) ( not ( = ?auto_432075 ?auto_432084 ) ) ( not ( = ?auto_432075 ?auto_432085 ) ) ( not ( = ?auto_432075 ?auto_432086 ) ) ( not ( = ?auto_432075 ?auto_432087 ) ) ( not ( = ?auto_432075 ?auto_432088 ) ) ( not ( = ?auto_432076 ?auto_432077 ) ) ( not ( = ?auto_432076 ?auto_432078 ) ) ( not ( = ?auto_432076 ?auto_432079 ) ) ( not ( = ?auto_432076 ?auto_432080 ) ) ( not ( = ?auto_432076 ?auto_432081 ) ) ( not ( = ?auto_432076 ?auto_432082 ) ) ( not ( = ?auto_432076 ?auto_432083 ) ) ( not ( = ?auto_432076 ?auto_432084 ) ) ( not ( = ?auto_432076 ?auto_432085 ) ) ( not ( = ?auto_432076 ?auto_432086 ) ) ( not ( = ?auto_432076 ?auto_432087 ) ) ( not ( = ?auto_432076 ?auto_432088 ) ) ( not ( = ?auto_432077 ?auto_432078 ) ) ( not ( = ?auto_432077 ?auto_432079 ) ) ( not ( = ?auto_432077 ?auto_432080 ) ) ( not ( = ?auto_432077 ?auto_432081 ) ) ( not ( = ?auto_432077 ?auto_432082 ) ) ( not ( = ?auto_432077 ?auto_432083 ) ) ( not ( = ?auto_432077 ?auto_432084 ) ) ( not ( = ?auto_432077 ?auto_432085 ) ) ( not ( = ?auto_432077 ?auto_432086 ) ) ( not ( = ?auto_432077 ?auto_432087 ) ) ( not ( = ?auto_432077 ?auto_432088 ) ) ( not ( = ?auto_432078 ?auto_432079 ) ) ( not ( = ?auto_432078 ?auto_432080 ) ) ( not ( = ?auto_432078 ?auto_432081 ) ) ( not ( = ?auto_432078 ?auto_432082 ) ) ( not ( = ?auto_432078 ?auto_432083 ) ) ( not ( = ?auto_432078 ?auto_432084 ) ) ( not ( = ?auto_432078 ?auto_432085 ) ) ( not ( = ?auto_432078 ?auto_432086 ) ) ( not ( = ?auto_432078 ?auto_432087 ) ) ( not ( = ?auto_432078 ?auto_432088 ) ) ( not ( = ?auto_432079 ?auto_432080 ) ) ( not ( = ?auto_432079 ?auto_432081 ) ) ( not ( = ?auto_432079 ?auto_432082 ) ) ( not ( = ?auto_432079 ?auto_432083 ) ) ( not ( = ?auto_432079 ?auto_432084 ) ) ( not ( = ?auto_432079 ?auto_432085 ) ) ( not ( = ?auto_432079 ?auto_432086 ) ) ( not ( = ?auto_432079 ?auto_432087 ) ) ( not ( = ?auto_432079 ?auto_432088 ) ) ( not ( = ?auto_432080 ?auto_432081 ) ) ( not ( = ?auto_432080 ?auto_432082 ) ) ( not ( = ?auto_432080 ?auto_432083 ) ) ( not ( = ?auto_432080 ?auto_432084 ) ) ( not ( = ?auto_432080 ?auto_432085 ) ) ( not ( = ?auto_432080 ?auto_432086 ) ) ( not ( = ?auto_432080 ?auto_432087 ) ) ( not ( = ?auto_432080 ?auto_432088 ) ) ( not ( = ?auto_432081 ?auto_432082 ) ) ( not ( = ?auto_432081 ?auto_432083 ) ) ( not ( = ?auto_432081 ?auto_432084 ) ) ( not ( = ?auto_432081 ?auto_432085 ) ) ( not ( = ?auto_432081 ?auto_432086 ) ) ( not ( = ?auto_432081 ?auto_432087 ) ) ( not ( = ?auto_432081 ?auto_432088 ) ) ( not ( = ?auto_432082 ?auto_432083 ) ) ( not ( = ?auto_432082 ?auto_432084 ) ) ( not ( = ?auto_432082 ?auto_432085 ) ) ( not ( = ?auto_432082 ?auto_432086 ) ) ( not ( = ?auto_432082 ?auto_432087 ) ) ( not ( = ?auto_432082 ?auto_432088 ) ) ( not ( = ?auto_432083 ?auto_432084 ) ) ( not ( = ?auto_432083 ?auto_432085 ) ) ( not ( = ?auto_432083 ?auto_432086 ) ) ( not ( = ?auto_432083 ?auto_432087 ) ) ( not ( = ?auto_432083 ?auto_432088 ) ) ( not ( = ?auto_432084 ?auto_432085 ) ) ( not ( = ?auto_432084 ?auto_432086 ) ) ( not ( = ?auto_432084 ?auto_432087 ) ) ( not ( = ?auto_432084 ?auto_432088 ) ) ( not ( = ?auto_432085 ?auto_432086 ) ) ( not ( = ?auto_432085 ?auto_432087 ) ) ( not ( = ?auto_432085 ?auto_432088 ) ) ( not ( = ?auto_432086 ?auto_432087 ) ) ( not ( = ?auto_432086 ?auto_432088 ) ) ( not ( = ?auto_432087 ?auto_432088 ) ) ( ON ?auto_432086 ?auto_432087 ) ( ON ?auto_432085 ?auto_432086 ) ( CLEAR ?auto_432083 ) ( ON ?auto_432084 ?auto_432085 ) ( CLEAR ?auto_432084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_432074 ?auto_432075 ?auto_432076 ?auto_432077 ?auto_432078 ?auto_432079 ?auto_432080 ?auto_432081 ?auto_432082 ?auto_432083 ?auto_432084 )
      ( MAKE-14PILE ?auto_432074 ?auto_432075 ?auto_432076 ?auto_432077 ?auto_432078 ?auto_432079 ?auto_432080 ?auto_432081 ?auto_432082 ?auto_432083 ?auto_432084 ?auto_432085 ?auto_432086 ?auto_432087 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432132 - BLOCK
      ?auto_432133 - BLOCK
      ?auto_432134 - BLOCK
      ?auto_432135 - BLOCK
      ?auto_432136 - BLOCK
      ?auto_432137 - BLOCK
      ?auto_432138 - BLOCK
      ?auto_432139 - BLOCK
      ?auto_432140 - BLOCK
      ?auto_432141 - BLOCK
      ?auto_432142 - BLOCK
      ?auto_432143 - BLOCK
      ?auto_432144 - BLOCK
      ?auto_432145 - BLOCK
    )
    :vars
    (
      ?auto_432146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432145 ?auto_432146 ) ( ON-TABLE ?auto_432132 ) ( ON ?auto_432133 ?auto_432132 ) ( ON ?auto_432134 ?auto_432133 ) ( ON ?auto_432135 ?auto_432134 ) ( ON ?auto_432136 ?auto_432135 ) ( ON ?auto_432137 ?auto_432136 ) ( ON ?auto_432138 ?auto_432137 ) ( ON ?auto_432139 ?auto_432138 ) ( ON ?auto_432140 ?auto_432139 ) ( not ( = ?auto_432132 ?auto_432133 ) ) ( not ( = ?auto_432132 ?auto_432134 ) ) ( not ( = ?auto_432132 ?auto_432135 ) ) ( not ( = ?auto_432132 ?auto_432136 ) ) ( not ( = ?auto_432132 ?auto_432137 ) ) ( not ( = ?auto_432132 ?auto_432138 ) ) ( not ( = ?auto_432132 ?auto_432139 ) ) ( not ( = ?auto_432132 ?auto_432140 ) ) ( not ( = ?auto_432132 ?auto_432141 ) ) ( not ( = ?auto_432132 ?auto_432142 ) ) ( not ( = ?auto_432132 ?auto_432143 ) ) ( not ( = ?auto_432132 ?auto_432144 ) ) ( not ( = ?auto_432132 ?auto_432145 ) ) ( not ( = ?auto_432132 ?auto_432146 ) ) ( not ( = ?auto_432133 ?auto_432134 ) ) ( not ( = ?auto_432133 ?auto_432135 ) ) ( not ( = ?auto_432133 ?auto_432136 ) ) ( not ( = ?auto_432133 ?auto_432137 ) ) ( not ( = ?auto_432133 ?auto_432138 ) ) ( not ( = ?auto_432133 ?auto_432139 ) ) ( not ( = ?auto_432133 ?auto_432140 ) ) ( not ( = ?auto_432133 ?auto_432141 ) ) ( not ( = ?auto_432133 ?auto_432142 ) ) ( not ( = ?auto_432133 ?auto_432143 ) ) ( not ( = ?auto_432133 ?auto_432144 ) ) ( not ( = ?auto_432133 ?auto_432145 ) ) ( not ( = ?auto_432133 ?auto_432146 ) ) ( not ( = ?auto_432134 ?auto_432135 ) ) ( not ( = ?auto_432134 ?auto_432136 ) ) ( not ( = ?auto_432134 ?auto_432137 ) ) ( not ( = ?auto_432134 ?auto_432138 ) ) ( not ( = ?auto_432134 ?auto_432139 ) ) ( not ( = ?auto_432134 ?auto_432140 ) ) ( not ( = ?auto_432134 ?auto_432141 ) ) ( not ( = ?auto_432134 ?auto_432142 ) ) ( not ( = ?auto_432134 ?auto_432143 ) ) ( not ( = ?auto_432134 ?auto_432144 ) ) ( not ( = ?auto_432134 ?auto_432145 ) ) ( not ( = ?auto_432134 ?auto_432146 ) ) ( not ( = ?auto_432135 ?auto_432136 ) ) ( not ( = ?auto_432135 ?auto_432137 ) ) ( not ( = ?auto_432135 ?auto_432138 ) ) ( not ( = ?auto_432135 ?auto_432139 ) ) ( not ( = ?auto_432135 ?auto_432140 ) ) ( not ( = ?auto_432135 ?auto_432141 ) ) ( not ( = ?auto_432135 ?auto_432142 ) ) ( not ( = ?auto_432135 ?auto_432143 ) ) ( not ( = ?auto_432135 ?auto_432144 ) ) ( not ( = ?auto_432135 ?auto_432145 ) ) ( not ( = ?auto_432135 ?auto_432146 ) ) ( not ( = ?auto_432136 ?auto_432137 ) ) ( not ( = ?auto_432136 ?auto_432138 ) ) ( not ( = ?auto_432136 ?auto_432139 ) ) ( not ( = ?auto_432136 ?auto_432140 ) ) ( not ( = ?auto_432136 ?auto_432141 ) ) ( not ( = ?auto_432136 ?auto_432142 ) ) ( not ( = ?auto_432136 ?auto_432143 ) ) ( not ( = ?auto_432136 ?auto_432144 ) ) ( not ( = ?auto_432136 ?auto_432145 ) ) ( not ( = ?auto_432136 ?auto_432146 ) ) ( not ( = ?auto_432137 ?auto_432138 ) ) ( not ( = ?auto_432137 ?auto_432139 ) ) ( not ( = ?auto_432137 ?auto_432140 ) ) ( not ( = ?auto_432137 ?auto_432141 ) ) ( not ( = ?auto_432137 ?auto_432142 ) ) ( not ( = ?auto_432137 ?auto_432143 ) ) ( not ( = ?auto_432137 ?auto_432144 ) ) ( not ( = ?auto_432137 ?auto_432145 ) ) ( not ( = ?auto_432137 ?auto_432146 ) ) ( not ( = ?auto_432138 ?auto_432139 ) ) ( not ( = ?auto_432138 ?auto_432140 ) ) ( not ( = ?auto_432138 ?auto_432141 ) ) ( not ( = ?auto_432138 ?auto_432142 ) ) ( not ( = ?auto_432138 ?auto_432143 ) ) ( not ( = ?auto_432138 ?auto_432144 ) ) ( not ( = ?auto_432138 ?auto_432145 ) ) ( not ( = ?auto_432138 ?auto_432146 ) ) ( not ( = ?auto_432139 ?auto_432140 ) ) ( not ( = ?auto_432139 ?auto_432141 ) ) ( not ( = ?auto_432139 ?auto_432142 ) ) ( not ( = ?auto_432139 ?auto_432143 ) ) ( not ( = ?auto_432139 ?auto_432144 ) ) ( not ( = ?auto_432139 ?auto_432145 ) ) ( not ( = ?auto_432139 ?auto_432146 ) ) ( not ( = ?auto_432140 ?auto_432141 ) ) ( not ( = ?auto_432140 ?auto_432142 ) ) ( not ( = ?auto_432140 ?auto_432143 ) ) ( not ( = ?auto_432140 ?auto_432144 ) ) ( not ( = ?auto_432140 ?auto_432145 ) ) ( not ( = ?auto_432140 ?auto_432146 ) ) ( not ( = ?auto_432141 ?auto_432142 ) ) ( not ( = ?auto_432141 ?auto_432143 ) ) ( not ( = ?auto_432141 ?auto_432144 ) ) ( not ( = ?auto_432141 ?auto_432145 ) ) ( not ( = ?auto_432141 ?auto_432146 ) ) ( not ( = ?auto_432142 ?auto_432143 ) ) ( not ( = ?auto_432142 ?auto_432144 ) ) ( not ( = ?auto_432142 ?auto_432145 ) ) ( not ( = ?auto_432142 ?auto_432146 ) ) ( not ( = ?auto_432143 ?auto_432144 ) ) ( not ( = ?auto_432143 ?auto_432145 ) ) ( not ( = ?auto_432143 ?auto_432146 ) ) ( not ( = ?auto_432144 ?auto_432145 ) ) ( not ( = ?auto_432144 ?auto_432146 ) ) ( not ( = ?auto_432145 ?auto_432146 ) ) ( ON ?auto_432144 ?auto_432145 ) ( ON ?auto_432143 ?auto_432144 ) ( ON ?auto_432142 ?auto_432143 ) ( CLEAR ?auto_432140 ) ( ON ?auto_432141 ?auto_432142 ) ( CLEAR ?auto_432141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_432132 ?auto_432133 ?auto_432134 ?auto_432135 ?auto_432136 ?auto_432137 ?auto_432138 ?auto_432139 ?auto_432140 ?auto_432141 )
      ( MAKE-14PILE ?auto_432132 ?auto_432133 ?auto_432134 ?auto_432135 ?auto_432136 ?auto_432137 ?auto_432138 ?auto_432139 ?auto_432140 ?auto_432141 ?auto_432142 ?auto_432143 ?auto_432144 ?auto_432145 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432190 - BLOCK
      ?auto_432191 - BLOCK
      ?auto_432192 - BLOCK
      ?auto_432193 - BLOCK
      ?auto_432194 - BLOCK
      ?auto_432195 - BLOCK
      ?auto_432196 - BLOCK
      ?auto_432197 - BLOCK
      ?auto_432198 - BLOCK
      ?auto_432199 - BLOCK
      ?auto_432200 - BLOCK
      ?auto_432201 - BLOCK
      ?auto_432202 - BLOCK
      ?auto_432203 - BLOCK
    )
    :vars
    (
      ?auto_432204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432203 ?auto_432204 ) ( ON-TABLE ?auto_432190 ) ( ON ?auto_432191 ?auto_432190 ) ( ON ?auto_432192 ?auto_432191 ) ( ON ?auto_432193 ?auto_432192 ) ( ON ?auto_432194 ?auto_432193 ) ( ON ?auto_432195 ?auto_432194 ) ( ON ?auto_432196 ?auto_432195 ) ( ON ?auto_432197 ?auto_432196 ) ( not ( = ?auto_432190 ?auto_432191 ) ) ( not ( = ?auto_432190 ?auto_432192 ) ) ( not ( = ?auto_432190 ?auto_432193 ) ) ( not ( = ?auto_432190 ?auto_432194 ) ) ( not ( = ?auto_432190 ?auto_432195 ) ) ( not ( = ?auto_432190 ?auto_432196 ) ) ( not ( = ?auto_432190 ?auto_432197 ) ) ( not ( = ?auto_432190 ?auto_432198 ) ) ( not ( = ?auto_432190 ?auto_432199 ) ) ( not ( = ?auto_432190 ?auto_432200 ) ) ( not ( = ?auto_432190 ?auto_432201 ) ) ( not ( = ?auto_432190 ?auto_432202 ) ) ( not ( = ?auto_432190 ?auto_432203 ) ) ( not ( = ?auto_432190 ?auto_432204 ) ) ( not ( = ?auto_432191 ?auto_432192 ) ) ( not ( = ?auto_432191 ?auto_432193 ) ) ( not ( = ?auto_432191 ?auto_432194 ) ) ( not ( = ?auto_432191 ?auto_432195 ) ) ( not ( = ?auto_432191 ?auto_432196 ) ) ( not ( = ?auto_432191 ?auto_432197 ) ) ( not ( = ?auto_432191 ?auto_432198 ) ) ( not ( = ?auto_432191 ?auto_432199 ) ) ( not ( = ?auto_432191 ?auto_432200 ) ) ( not ( = ?auto_432191 ?auto_432201 ) ) ( not ( = ?auto_432191 ?auto_432202 ) ) ( not ( = ?auto_432191 ?auto_432203 ) ) ( not ( = ?auto_432191 ?auto_432204 ) ) ( not ( = ?auto_432192 ?auto_432193 ) ) ( not ( = ?auto_432192 ?auto_432194 ) ) ( not ( = ?auto_432192 ?auto_432195 ) ) ( not ( = ?auto_432192 ?auto_432196 ) ) ( not ( = ?auto_432192 ?auto_432197 ) ) ( not ( = ?auto_432192 ?auto_432198 ) ) ( not ( = ?auto_432192 ?auto_432199 ) ) ( not ( = ?auto_432192 ?auto_432200 ) ) ( not ( = ?auto_432192 ?auto_432201 ) ) ( not ( = ?auto_432192 ?auto_432202 ) ) ( not ( = ?auto_432192 ?auto_432203 ) ) ( not ( = ?auto_432192 ?auto_432204 ) ) ( not ( = ?auto_432193 ?auto_432194 ) ) ( not ( = ?auto_432193 ?auto_432195 ) ) ( not ( = ?auto_432193 ?auto_432196 ) ) ( not ( = ?auto_432193 ?auto_432197 ) ) ( not ( = ?auto_432193 ?auto_432198 ) ) ( not ( = ?auto_432193 ?auto_432199 ) ) ( not ( = ?auto_432193 ?auto_432200 ) ) ( not ( = ?auto_432193 ?auto_432201 ) ) ( not ( = ?auto_432193 ?auto_432202 ) ) ( not ( = ?auto_432193 ?auto_432203 ) ) ( not ( = ?auto_432193 ?auto_432204 ) ) ( not ( = ?auto_432194 ?auto_432195 ) ) ( not ( = ?auto_432194 ?auto_432196 ) ) ( not ( = ?auto_432194 ?auto_432197 ) ) ( not ( = ?auto_432194 ?auto_432198 ) ) ( not ( = ?auto_432194 ?auto_432199 ) ) ( not ( = ?auto_432194 ?auto_432200 ) ) ( not ( = ?auto_432194 ?auto_432201 ) ) ( not ( = ?auto_432194 ?auto_432202 ) ) ( not ( = ?auto_432194 ?auto_432203 ) ) ( not ( = ?auto_432194 ?auto_432204 ) ) ( not ( = ?auto_432195 ?auto_432196 ) ) ( not ( = ?auto_432195 ?auto_432197 ) ) ( not ( = ?auto_432195 ?auto_432198 ) ) ( not ( = ?auto_432195 ?auto_432199 ) ) ( not ( = ?auto_432195 ?auto_432200 ) ) ( not ( = ?auto_432195 ?auto_432201 ) ) ( not ( = ?auto_432195 ?auto_432202 ) ) ( not ( = ?auto_432195 ?auto_432203 ) ) ( not ( = ?auto_432195 ?auto_432204 ) ) ( not ( = ?auto_432196 ?auto_432197 ) ) ( not ( = ?auto_432196 ?auto_432198 ) ) ( not ( = ?auto_432196 ?auto_432199 ) ) ( not ( = ?auto_432196 ?auto_432200 ) ) ( not ( = ?auto_432196 ?auto_432201 ) ) ( not ( = ?auto_432196 ?auto_432202 ) ) ( not ( = ?auto_432196 ?auto_432203 ) ) ( not ( = ?auto_432196 ?auto_432204 ) ) ( not ( = ?auto_432197 ?auto_432198 ) ) ( not ( = ?auto_432197 ?auto_432199 ) ) ( not ( = ?auto_432197 ?auto_432200 ) ) ( not ( = ?auto_432197 ?auto_432201 ) ) ( not ( = ?auto_432197 ?auto_432202 ) ) ( not ( = ?auto_432197 ?auto_432203 ) ) ( not ( = ?auto_432197 ?auto_432204 ) ) ( not ( = ?auto_432198 ?auto_432199 ) ) ( not ( = ?auto_432198 ?auto_432200 ) ) ( not ( = ?auto_432198 ?auto_432201 ) ) ( not ( = ?auto_432198 ?auto_432202 ) ) ( not ( = ?auto_432198 ?auto_432203 ) ) ( not ( = ?auto_432198 ?auto_432204 ) ) ( not ( = ?auto_432199 ?auto_432200 ) ) ( not ( = ?auto_432199 ?auto_432201 ) ) ( not ( = ?auto_432199 ?auto_432202 ) ) ( not ( = ?auto_432199 ?auto_432203 ) ) ( not ( = ?auto_432199 ?auto_432204 ) ) ( not ( = ?auto_432200 ?auto_432201 ) ) ( not ( = ?auto_432200 ?auto_432202 ) ) ( not ( = ?auto_432200 ?auto_432203 ) ) ( not ( = ?auto_432200 ?auto_432204 ) ) ( not ( = ?auto_432201 ?auto_432202 ) ) ( not ( = ?auto_432201 ?auto_432203 ) ) ( not ( = ?auto_432201 ?auto_432204 ) ) ( not ( = ?auto_432202 ?auto_432203 ) ) ( not ( = ?auto_432202 ?auto_432204 ) ) ( not ( = ?auto_432203 ?auto_432204 ) ) ( ON ?auto_432202 ?auto_432203 ) ( ON ?auto_432201 ?auto_432202 ) ( ON ?auto_432200 ?auto_432201 ) ( ON ?auto_432199 ?auto_432200 ) ( CLEAR ?auto_432197 ) ( ON ?auto_432198 ?auto_432199 ) ( CLEAR ?auto_432198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_432190 ?auto_432191 ?auto_432192 ?auto_432193 ?auto_432194 ?auto_432195 ?auto_432196 ?auto_432197 ?auto_432198 )
      ( MAKE-14PILE ?auto_432190 ?auto_432191 ?auto_432192 ?auto_432193 ?auto_432194 ?auto_432195 ?auto_432196 ?auto_432197 ?auto_432198 ?auto_432199 ?auto_432200 ?auto_432201 ?auto_432202 ?auto_432203 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432248 - BLOCK
      ?auto_432249 - BLOCK
      ?auto_432250 - BLOCK
      ?auto_432251 - BLOCK
      ?auto_432252 - BLOCK
      ?auto_432253 - BLOCK
      ?auto_432254 - BLOCK
      ?auto_432255 - BLOCK
      ?auto_432256 - BLOCK
      ?auto_432257 - BLOCK
      ?auto_432258 - BLOCK
      ?auto_432259 - BLOCK
      ?auto_432260 - BLOCK
      ?auto_432261 - BLOCK
    )
    :vars
    (
      ?auto_432262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432261 ?auto_432262 ) ( ON-TABLE ?auto_432248 ) ( ON ?auto_432249 ?auto_432248 ) ( ON ?auto_432250 ?auto_432249 ) ( ON ?auto_432251 ?auto_432250 ) ( ON ?auto_432252 ?auto_432251 ) ( ON ?auto_432253 ?auto_432252 ) ( ON ?auto_432254 ?auto_432253 ) ( not ( = ?auto_432248 ?auto_432249 ) ) ( not ( = ?auto_432248 ?auto_432250 ) ) ( not ( = ?auto_432248 ?auto_432251 ) ) ( not ( = ?auto_432248 ?auto_432252 ) ) ( not ( = ?auto_432248 ?auto_432253 ) ) ( not ( = ?auto_432248 ?auto_432254 ) ) ( not ( = ?auto_432248 ?auto_432255 ) ) ( not ( = ?auto_432248 ?auto_432256 ) ) ( not ( = ?auto_432248 ?auto_432257 ) ) ( not ( = ?auto_432248 ?auto_432258 ) ) ( not ( = ?auto_432248 ?auto_432259 ) ) ( not ( = ?auto_432248 ?auto_432260 ) ) ( not ( = ?auto_432248 ?auto_432261 ) ) ( not ( = ?auto_432248 ?auto_432262 ) ) ( not ( = ?auto_432249 ?auto_432250 ) ) ( not ( = ?auto_432249 ?auto_432251 ) ) ( not ( = ?auto_432249 ?auto_432252 ) ) ( not ( = ?auto_432249 ?auto_432253 ) ) ( not ( = ?auto_432249 ?auto_432254 ) ) ( not ( = ?auto_432249 ?auto_432255 ) ) ( not ( = ?auto_432249 ?auto_432256 ) ) ( not ( = ?auto_432249 ?auto_432257 ) ) ( not ( = ?auto_432249 ?auto_432258 ) ) ( not ( = ?auto_432249 ?auto_432259 ) ) ( not ( = ?auto_432249 ?auto_432260 ) ) ( not ( = ?auto_432249 ?auto_432261 ) ) ( not ( = ?auto_432249 ?auto_432262 ) ) ( not ( = ?auto_432250 ?auto_432251 ) ) ( not ( = ?auto_432250 ?auto_432252 ) ) ( not ( = ?auto_432250 ?auto_432253 ) ) ( not ( = ?auto_432250 ?auto_432254 ) ) ( not ( = ?auto_432250 ?auto_432255 ) ) ( not ( = ?auto_432250 ?auto_432256 ) ) ( not ( = ?auto_432250 ?auto_432257 ) ) ( not ( = ?auto_432250 ?auto_432258 ) ) ( not ( = ?auto_432250 ?auto_432259 ) ) ( not ( = ?auto_432250 ?auto_432260 ) ) ( not ( = ?auto_432250 ?auto_432261 ) ) ( not ( = ?auto_432250 ?auto_432262 ) ) ( not ( = ?auto_432251 ?auto_432252 ) ) ( not ( = ?auto_432251 ?auto_432253 ) ) ( not ( = ?auto_432251 ?auto_432254 ) ) ( not ( = ?auto_432251 ?auto_432255 ) ) ( not ( = ?auto_432251 ?auto_432256 ) ) ( not ( = ?auto_432251 ?auto_432257 ) ) ( not ( = ?auto_432251 ?auto_432258 ) ) ( not ( = ?auto_432251 ?auto_432259 ) ) ( not ( = ?auto_432251 ?auto_432260 ) ) ( not ( = ?auto_432251 ?auto_432261 ) ) ( not ( = ?auto_432251 ?auto_432262 ) ) ( not ( = ?auto_432252 ?auto_432253 ) ) ( not ( = ?auto_432252 ?auto_432254 ) ) ( not ( = ?auto_432252 ?auto_432255 ) ) ( not ( = ?auto_432252 ?auto_432256 ) ) ( not ( = ?auto_432252 ?auto_432257 ) ) ( not ( = ?auto_432252 ?auto_432258 ) ) ( not ( = ?auto_432252 ?auto_432259 ) ) ( not ( = ?auto_432252 ?auto_432260 ) ) ( not ( = ?auto_432252 ?auto_432261 ) ) ( not ( = ?auto_432252 ?auto_432262 ) ) ( not ( = ?auto_432253 ?auto_432254 ) ) ( not ( = ?auto_432253 ?auto_432255 ) ) ( not ( = ?auto_432253 ?auto_432256 ) ) ( not ( = ?auto_432253 ?auto_432257 ) ) ( not ( = ?auto_432253 ?auto_432258 ) ) ( not ( = ?auto_432253 ?auto_432259 ) ) ( not ( = ?auto_432253 ?auto_432260 ) ) ( not ( = ?auto_432253 ?auto_432261 ) ) ( not ( = ?auto_432253 ?auto_432262 ) ) ( not ( = ?auto_432254 ?auto_432255 ) ) ( not ( = ?auto_432254 ?auto_432256 ) ) ( not ( = ?auto_432254 ?auto_432257 ) ) ( not ( = ?auto_432254 ?auto_432258 ) ) ( not ( = ?auto_432254 ?auto_432259 ) ) ( not ( = ?auto_432254 ?auto_432260 ) ) ( not ( = ?auto_432254 ?auto_432261 ) ) ( not ( = ?auto_432254 ?auto_432262 ) ) ( not ( = ?auto_432255 ?auto_432256 ) ) ( not ( = ?auto_432255 ?auto_432257 ) ) ( not ( = ?auto_432255 ?auto_432258 ) ) ( not ( = ?auto_432255 ?auto_432259 ) ) ( not ( = ?auto_432255 ?auto_432260 ) ) ( not ( = ?auto_432255 ?auto_432261 ) ) ( not ( = ?auto_432255 ?auto_432262 ) ) ( not ( = ?auto_432256 ?auto_432257 ) ) ( not ( = ?auto_432256 ?auto_432258 ) ) ( not ( = ?auto_432256 ?auto_432259 ) ) ( not ( = ?auto_432256 ?auto_432260 ) ) ( not ( = ?auto_432256 ?auto_432261 ) ) ( not ( = ?auto_432256 ?auto_432262 ) ) ( not ( = ?auto_432257 ?auto_432258 ) ) ( not ( = ?auto_432257 ?auto_432259 ) ) ( not ( = ?auto_432257 ?auto_432260 ) ) ( not ( = ?auto_432257 ?auto_432261 ) ) ( not ( = ?auto_432257 ?auto_432262 ) ) ( not ( = ?auto_432258 ?auto_432259 ) ) ( not ( = ?auto_432258 ?auto_432260 ) ) ( not ( = ?auto_432258 ?auto_432261 ) ) ( not ( = ?auto_432258 ?auto_432262 ) ) ( not ( = ?auto_432259 ?auto_432260 ) ) ( not ( = ?auto_432259 ?auto_432261 ) ) ( not ( = ?auto_432259 ?auto_432262 ) ) ( not ( = ?auto_432260 ?auto_432261 ) ) ( not ( = ?auto_432260 ?auto_432262 ) ) ( not ( = ?auto_432261 ?auto_432262 ) ) ( ON ?auto_432260 ?auto_432261 ) ( ON ?auto_432259 ?auto_432260 ) ( ON ?auto_432258 ?auto_432259 ) ( ON ?auto_432257 ?auto_432258 ) ( ON ?auto_432256 ?auto_432257 ) ( CLEAR ?auto_432254 ) ( ON ?auto_432255 ?auto_432256 ) ( CLEAR ?auto_432255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_432248 ?auto_432249 ?auto_432250 ?auto_432251 ?auto_432252 ?auto_432253 ?auto_432254 ?auto_432255 )
      ( MAKE-14PILE ?auto_432248 ?auto_432249 ?auto_432250 ?auto_432251 ?auto_432252 ?auto_432253 ?auto_432254 ?auto_432255 ?auto_432256 ?auto_432257 ?auto_432258 ?auto_432259 ?auto_432260 ?auto_432261 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432306 - BLOCK
      ?auto_432307 - BLOCK
      ?auto_432308 - BLOCK
      ?auto_432309 - BLOCK
      ?auto_432310 - BLOCK
      ?auto_432311 - BLOCK
      ?auto_432312 - BLOCK
      ?auto_432313 - BLOCK
      ?auto_432314 - BLOCK
      ?auto_432315 - BLOCK
      ?auto_432316 - BLOCK
      ?auto_432317 - BLOCK
      ?auto_432318 - BLOCK
      ?auto_432319 - BLOCK
    )
    :vars
    (
      ?auto_432320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432319 ?auto_432320 ) ( ON-TABLE ?auto_432306 ) ( ON ?auto_432307 ?auto_432306 ) ( ON ?auto_432308 ?auto_432307 ) ( ON ?auto_432309 ?auto_432308 ) ( ON ?auto_432310 ?auto_432309 ) ( ON ?auto_432311 ?auto_432310 ) ( not ( = ?auto_432306 ?auto_432307 ) ) ( not ( = ?auto_432306 ?auto_432308 ) ) ( not ( = ?auto_432306 ?auto_432309 ) ) ( not ( = ?auto_432306 ?auto_432310 ) ) ( not ( = ?auto_432306 ?auto_432311 ) ) ( not ( = ?auto_432306 ?auto_432312 ) ) ( not ( = ?auto_432306 ?auto_432313 ) ) ( not ( = ?auto_432306 ?auto_432314 ) ) ( not ( = ?auto_432306 ?auto_432315 ) ) ( not ( = ?auto_432306 ?auto_432316 ) ) ( not ( = ?auto_432306 ?auto_432317 ) ) ( not ( = ?auto_432306 ?auto_432318 ) ) ( not ( = ?auto_432306 ?auto_432319 ) ) ( not ( = ?auto_432306 ?auto_432320 ) ) ( not ( = ?auto_432307 ?auto_432308 ) ) ( not ( = ?auto_432307 ?auto_432309 ) ) ( not ( = ?auto_432307 ?auto_432310 ) ) ( not ( = ?auto_432307 ?auto_432311 ) ) ( not ( = ?auto_432307 ?auto_432312 ) ) ( not ( = ?auto_432307 ?auto_432313 ) ) ( not ( = ?auto_432307 ?auto_432314 ) ) ( not ( = ?auto_432307 ?auto_432315 ) ) ( not ( = ?auto_432307 ?auto_432316 ) ) ( not ( = ?auto_432307 ?auto_432317 ) ) ( not ( = ?auto_432307 ?auto_432318 ) ) ( not ( = ?auto_432307 ?auto_432319 ) ) ( not ( = ?auto_432307 ?auto_432320 ) ) ( not ( = ?auto_432308 ?auto_432309 ) ) ( not ( = ?auto_432308 ?auto_432310 ) ) ( not ( = ?auto_432308 ?auto_432311 ) ) ( not ( = ?auto_432308 ?auto_432312 ) ) ( not ( = ?auto_432308 ?auto_432313 ) ) ( not ( = ?auto_432308 ?auto_432314 ) ) ( not ( = ?auto_432308 ?auto_432315 ) ) ( not ( = ?auto_432308 ?auto_432316 ) ) ( not ( = ?auto_432308 ?auto_432317 ) ) ( not ( = ?auto_432308 ?auto_432318 ) ) ( not ( = ?auto_432308 ?auto_432319 ) ) ( not ( = ?auto_432308 ?auto_432320 ) ) ( not ( = ?auto_432309 ?auto_432310 ) ) ( not ( = ?auto_432309 ?auto_432311 ) ) ( not ( = ?auto_432309 ?auto_432312 ) ) ( not ( = ?auto_432309 ?auto_432313 ) ) ( not ( = ?auto_432309 ?auto_432314 ) ) ( not ( = ?auto_432309 ?auto_432315 ) ) ( not ( = ?auto_432309 ?auto_432316 ) ) ( not ( = ?auto_432309 ?auto_432317 ) ) ( not ( = ?auto_432309 ?auto_432318 ) ) ( not ( = ?auto_432309 ?auto_432319 ) ) ( not ( = ?auto_432309 ?auto_432320 ) ) ( not ( = ?auto_432310 ?auto_432311 ) ) ( not ( = ?auto_432310 ?auto_432312 ) ) ( not ( = ?auto_432310 ?auto_432313 ) ) ( not ( = ?auto_432310 ?auto_432314 ) ) ( not ( = ?auto_432310 ?auto_432315 ) ) ( not ( = ?auto_432310 ?auto_432316 ) ) ( not ( = ?auto_432310 ?auto_432317 ) ) ( not ( = ?auto_432310 ?auto_432318 ) ) ( not ( = ?auto_432310 ?auto_432319 ) ) ( not ( = ?auto_432310 ?auto_432320 ) ) ( not ( = ?auto_432311 ?auto_432312 ) ) ( not ( = ?auto_432311 ?auto_432313 ) ) ( not ( = ?auto_432311 ?auto_432314 ) ) ( not ( = ?auto_432311 ?auto_432315 ) ) ( not ( = ?auto_432311 ?auto_432316 ) ) ( not ( = ?auto_432311 ?auto_432317 ) ) ( not ( = ?auto_432311 ?auto_432318 ) ) ( not ( = ?auto_432311 ?auto_432319 ) ) ( not ( = ?auto_432311 ?auto_432320 ) ) ( not ( = ?auto_432312 ?auto_432313 ) ) ( not ( = ?auto_432312 ?auto_432314 ) ) ( not ( = ?auto_432312 ?auto_432315 ) ) ( not ( = ?auto_432312 ?auto_432316 ) ) ( not ( = ?auto_432312 ?auto_432317 ) ) ( not ( = ?auto_432312 ?auto_432318 ) ) ( not ( = ?auto_432312 ?auto_432319 ) ) ( not ( = ?auto_432312 ?auto_432320 ) ) ( not ( = ?auto_432313 ?auto_432314 ) ) ( not ( = ?auto_432313 ?auto_432315 ) ) ( not ( = ?auto_432313 ?auto_432316 ) ) ( not ( = ?auto_432313 ?auto_432317 ) ) ( not ( = ?auto_432313 ?auto_432318 ) ) ( not ( = ?auto_432313 ?auto_432319 ) ) ( not ( = ?auto_432313 ?auto_432320 ) ) ( not ( = ?auto_432314 ?auto_432315 ) ) ( not ( = ?auto_432314 ?auto_432316 ) ) ( not ( = ?auto_432314 ?auto_432317 ) ) ( not ( = ?auto_432314 ?auto_432318 ) ) ( not ( = ?auto_432314 ?auto_432319 ) ) ( not ( = ?auto_432314 ?auto_432320 ) ) ( not ( = ?auto_432315 ?auto_432316 ) ) ( not ( = ?auto_432315 ?auto_432317 ) ) ( not ( = ?auto_432315 ?auto_432318 ) ) ( not ( = ?auto_432315 ?auto_432319 ) ) ( not ( = ?auto_432315 ?auto_432320 ) ) ( not ( = ?auto_432316 ?auto_432317 ) ) ( not ( = ?auto_432316 ?auto_432318 ) ) ( not ( = ?auto_432316 ?auto_432319 ) ) ( not ( = ?auto_432316 ?auto_432320 ) ) ( not ( = ?auto_432317 ?auto_432318 ) ) ( not ( = ?auto_432317 ?auto_432319 ) ) ( not ( = ?auto_432317 ?auto_432320 ) ) ( not ( = ?auto_432318 ?auto_432319 ) ) ( not ( = ?auto_432318 ?auto_432320 ) ) ( not ( = ?auto_432319 ?auto_432320 ) ) ( ON ?auto_432318 ?auto_432319 ) ( ON ?auto_432317 ?auto_432318 ) ( ON ?auto_432316 ?auto_432317 ) ( ON ?auto_432315 ?auto_432316 ) ( ON ?auto_432314 ?auto_432315 ) ( ON ?auto_432313 ?auto_432314 ) ( CLEAR ?auto_432311 ) ( ON ?auto_432312 ?auto_432313 ) ( CLEAR ?auto_432312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_432306 ?auto_432307 ?auto_432308 ?auto_432309 ?auto_432310 ?auto_432311 ?auto_432312 )
      ( MAKE-14PILE ?auto_432306 ?auto_432307 ?auto_432308 ?auto_432309 ?auto_432310 ?auto_432311 ?auto_432312 ?auto_432313 ?auto_432314 ?auto_432315 ?auto_432316 ?auto_432317 ?auto_432318 ?auto_432319 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432364 - BLOCK
      ?auto_432365 - BLOCK
      ?auto_432366 - BLOCK
      ?auto_432367 - BLOCK
      ?auto_432368 - BLOCK
      ?auto_432369 - BLOCK
      ?auto_432370 - BLOCK
      ?auto_432371 - BLOCK
      ?auto_432372 - BLOCK
      ?auto_432373 - BLOCK
      ?auto_432374 - BLOCK
      ?auto_432375 - BLOCK
      ?auto_432376 - BLOCK
      ?auto_432377 - BLOCK
    )
    :vars
    (
      ?auto_432378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432377 ?auto_432378 ) ( ON-TABLE ?auto_432364 ) ( ON ?auto_432365 ?auto_432364 ) ( ON ?auto_432366 ?auto_432365 ) ( ON ?auto_432367 ?auto_432366 ) ( ON ?auto_432368 ?auto_432367 ) ( not ( = ?auto_432364 ?auto_432365 ) ) ( not ( = ?auto_432364 ?auto_432366 ) ) ( not ( = ?auto_432364 ?auto_432367 ) ) ( not ( = ?auto_432364 ?auto_432368 ) ) ( not ( = ?auto_432364 ?auto_432369 ) ) ( not ( = ?auto_432364 ?auto_432370 ) ) ( not ( = ?auto_432364 ?auto_432371 ) ) ( not ( = ?auto_432364 ?auto_432372 ) ) ( not ( = ?auto_432364 ?auto_432373 ) ) ( not ( = ?auto_432364 ?auto_432374 ) ) ( not ( = ?auto_432364 ?auto_432375 ) ) ( not ( = ?auto_432364 ?auto_432376 ) ) ( not ( = ?auto_432364 ?auto_432377 ) ) ( not ( = ?auto_432364 ?auto_432378 ) ) ( not ( = ?auto_432365 ?auto_432366 ) ) ( not ( = ?auto_432365 ?auto_432367 ) ) ( not ( = ?auto_432365 ?auto_432368 ) ) ( not ( = ?auto_432365 ?auto_432369 ) ) ( not ( = ?auto_432365 ?auto_432370 ) ) ( not ( = ?auto_432365 ?auto_432371 ) ) ( not ( = ?auto_432365 ?auto_432372 ) ) ( not ( = ?auto_432365 ?auto_432373 ) ) ( not ( = ?auto_432365 ?auto_432374 ) ) ( not ( = ?auto_432365 ?auto_432375 ) ) ( not ( = ?auto_432365 ?auto_432376 ) ) ( not ( = ?auto_432365 ?auto_432377 ) ) ( not ( = ?auto_432365 ?auto_432378 ) ) ( not ( = ?auto_432366 ?auto_432367 ) ) ( not ( = ?auto_432366 ?auto_432368 ) ) ( not ( = ?auto_432366 ?auto_432369 ) ) ( not ( = ?auto_432366 ?auto_432370 ) ) ( not ( = ?auto_432366 ?auto_432371 ) ) ( not ( = ?auto_432366 ?auto_432372 ) ) ( not ( = ?auto_432366 ?auto_432373 ) ) ( not ( = ?auto_432366 ?auto_432374 ) ) ( not ( = ?auto_432366 ?auto_432375 ) ) ( not ( = ?auto_432366 ?auto_432376 ) ) ( not ( = ?auto_432366 ?auto_432377 ) ) ( not ( = ?auto_432366 ?auto_432378 ) ) ( not ( = ?auto_432367 ?auto_432368 ) ) ( not ( = ?auto_432367 ?auto_432369 ) ) ( not ( = ?auto_432367 ?auto_432370 ) ) ( not ( = ?auto_432367 ?auto_432371 ) ) ( not ( = ?auto_432367 ?auto_432372 ) ) ( not ( = ?auto_432367 ?auto_432373 ) ) ( not ( = ?auto_432367 ?auto_432374 ) ) ( not ( = ?auto_432367 ?auto_432375 ) ) ( not ( = ?auto_432367 ?auto_432376 ) ) ( not ( = ?auto_432367 ?auto_432377 ) ) ( not ( = ?auto_432367 ?auto_432378 ) ) ( not ( = ?auto_432368 ?auto_432369 ) ) ( not ( = ?auto_432368 ?auto_432370 ) ) ( not ( = ?auto_432368 ?auto_432371 ) ) ( not ( = ?auto_432368 ?auto_432372 ) ) ( not ( = ?auto_432368 ?auto_432373 ) ) ( not ( = ?auto_432368 ?auto_432374 ) ) ( not ( = ?auto_432368 ?auto_432375 ) ) ( not ( = ?auto_432368 ?auto_432376 ) ) ( not ( = ?auto_432368 ?auto_432377 ) ) ( not ( = ?auto_432368 ?auto_432378 ) ) ( not ( = ?auto_432369 ?auto_432370 ) ) ( not ( = ?auto_432369 ?auto_432371 ) ) ( not ( = ?auto_432369 ?auto_432372 ) ) ( not ( = ?auto_432369 ?auto_432373 ) ) ( not ( = ?auto_432369 ?auto_432374 ) ) ( not ( = ?auto_432369 ?auto_432375 ) ) ( not ( = ?auto_432369 ?auto_432376 ) ) ( not ( = ?auto_432369 ?auto_432377 ) ) ( not ( = ?auto_432369 ?auto_432378 ) ) ( not ( = ?auto_432370 ?auto_432371 ) ) ( not ( = ?auto_432370 ?auto_432372 ) ) ( not ( = ?auto_432370 ?auto_432373 ) ) ( not ( = ?auto_432370 ?auto_432374 ) ) ( not ( = ?auto_432370 ?auto_432375 ) ) ( not ( = ?auto_432370 ?auto_432376 ) ) ( not ( = ?auto_432370 ?auto_432377 ) ) ( not ( = ?auto_432370 ?auto_432378 ) ) ( not ( = ?auto_432371 ?auto_432372 ) ) ( not ( = ?auto_432371 ?auto_432373 ) ) ( not ( = ?auto_432371 ?auto_432374 ) ) ( not ( = ?auto_432371 ?auto_432375 ) ) ( not ( = ?auto_432371 ?auto_432376 ) ) ( not ( = ?auto_432371 ?auto_432377 ) ) ( not ( = ?auto_432371 ?auto_432378 ) ) ( not ( = ?auto_432372 ?auto_432373 ) ) ( not ( = ?auto_432372 ?auto_432374 ) ) ( not ( = ?auto_432372 ?auto_432375 ) ) ( not ( = ?auto_432372 ?auto_432376 ) ) ( not ( = ?auto_432372 ?auto_432377 ) ) ( not ( = ?auto_432372 ?auto_432378 ) ) ( not ( = ?auto_432373 ?auto_432374 ) ) ( not ( = ?auto_432373 ?auto_432375 ) ) ( not ( = ?auto_432373 ?auto_432376 ) ) ( not ( = ?auto_432373 ?auto_432377 ) ) ( not ( = ?auto_432373 ?auto_432378 ) ) ( not ( = ?auto_432374 ?auto_432375 ) ) ( not ( = ?auto_432374 ?auto_432376 ) ) ( not ( = ?auto_432374 ?auto_432377 ) ) ( not ( = ?auto_432374 ?auto_432378 ) ) ( not ( = ?auto_432375 ?auto_432376 ) ) ( not ( = ?auto_432375 ?auto_432377 ) ) ( not ( = ?auto_432375 ?auto_432378 ) ) ( not ( = ?auto_432376 ?auto_432377 ) ) ( not ( = ?auto_432376 ?auto_432378 ) ) ( not ( = ?auto_432377 ?auto_432378 ) ) ( ON ?auto_432376 ?auto_432377 ) ( ON ?auto_432375 ?auto_432376 ) ( ON ?auto_432374 ?auto_432375 ) ( ON ?auto_432373 ?auto_432374 ) ( ON ?auto_432372 ?auto_432373 ) ( ON ?auto_432371 ?auto_432372 ) ( ON ?auto_432370 ?auto_432371 ) ( CLEAR ?auto_432368 ) ( ON ?auto_432369 ?auto_432370 ) ( CLEAR ?auto_432369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_432364 ?auto_432365 ?auto_432366 ?auto_432367 ?auto_432368 ?auto_432369 )
      ( MAKE-14PILE ?auto_432364 ?auto_432365 ?auto_432366 ?auto_432367 ?auto_432368 ?auto_432369 ?auto_432370 ?auto_432371 ?auto_432372 ?auto_432373 ?auto_432374 ?auto_432375 ?auto_432376 ?auto_432377 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432422 - BLOCK
      ?auto_432423 - BLOCK
      ?auto_432424 - BLOCK
      ?auto_432425 - BLOCK
      ?auto_432426 - BLOCK
      ?auto_432427 - BLOCK
      ?auto_432428 - BLOCK
      ?auto_432429 - BLOCK
      ?auto_432430 - BLOCK
      ?auto_432431 - BLOCK
      ?auto_432432 - BLOCK
      ?auto_432433 - BLOCK
      ?auto_432434 - BLOCK
      ?auto_432435 - BLOCK
    )
    :vars
    (
      ?auto_432436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432435 ?auto_432436 ) ( ON-TABLE ?auto_432422 ) ( ON ?auto_432423 ?auto_432422 ) ( ON ?auto_432424 ?auto_432423 ) ( ON ?auto_432425 ?auto_432424 ) ( not ( = ?auto_432422 ?auto_432423 ) ) ( not ( = ?auto_432422 ?auto_432424 ) ) ( not ( = ?auto_432422 ?auto_432425 ) ) ( not ( = ?auto_432422 ?auto_432426 ) ) ( not ( = ?auto_432422 ?auto_432427 ) ) ( not ( = ?auto_432422 ?auto_432428 ) ) ( not ( = ?auto_432422 ?auto_432429 ) ) ( not ( = ?auto_432422 ?auto_432430 ) ) ( not ( = ?auto_432422 ?auto_432431 ) ) ( not ( = ?auto_432422 ?auto_432432 ) ) ( not ( = ?auto_432422 ?auto_432433 ) ) ( not ( = ?auto_432422 ?auto_432434 ) ) ( not ( = ?auto_432422 ?auto_432435 ) ) ( not ( = ?auto_432422 ?auto_432436 ) ) ( not ( = ?auto_432423 ?auto_432424 ) ) ( not ( = ?auto_432423 ?auto_432425 ) ) ( not ( = ?auto_432423 ?auto_432426 ) ) ( not ( = ?auto_432423 ?auto_432427 ) ) ( not ( = ?auto_432423 ?auto_432428 ) ) ( not ( = ?auto_432423 ?auto_432429 ) ) ( not ( = ?auto_432423 ?auto_432430 ) ) ( not ( = ?auto_432423 ?auto_432431 ) ) ( not ( = ?auto_432423 ?auto_432432 ) ) ( not ( = ?auto_432423 ?auto_432433 ) ) ( not ( = ?auto_432423 ?auto_432434 ) ) ( not ( = ?auto_432423 ?auto_432435 ) ) ( not ( = ?auto_432423 ?auto_432436 ) ) ( not ( = ?auto_432424 ?auto_432425 ) ) ( not ( = ?auto_432424 ?auto_432426 ) ) ( not ( = ?auto_432424 ?auto_432427 ) ) ( not ( = ?auto_432424 ?auto_432428 ) ) ( not ( = ?auto_432424 ?auto_432429 ) ) ( not ( = ?auto_432424 ?auto_432430 ) ) ( not ( = ?auto_432424 ?auto_432431 ) ) ( not ( = ?auto_432424 ?auto_432432 ) ) ( not ( = ?auto_432424 ?auto_432433 ) ) ( not ( = ?auto_432424 ?auto_432434 ) ) ( not ( = ?auto_432424 ?auto_432435 ) ) ( not ( = ?auto_432424 ?auto_432436 ) ) ( not ( = ?auto_432425 ?auto_432426 ) ) ( not ( = ?auto_432425 ?auto_432427 ) ) ( not ( = ?auto_432425 ?auto_432428 ) ) ( not ( = ?auto_432425 ?auto_432429 ) ) ( not ( = ?auto_432425 ?auto_432430 ) ) ( not ( = ?auto_432425 ?auto_432431 ) ) ( not ( = ?auto_432425 ?auto_432432 ) ) ( not ( = ?auto_432425 ?auto_432433 ) ) ( not ( = ?auto_432425 ?auto_432434 ) ) ( not ( = ?auto_432425 ?auto_432435 ) ) ( not ( = ?auto_432425 ?auto_432436 ) ) ( not ( = ?auto_432426 ?auto_432427 ) ) ( not ( = ?auto_432426 ?auto_432428 ) ) ( not ( = ?auto_432426 ?auto_432429 ) ) ( not ( = ?auto_432426 ?auto_432430 ) ) ( not ( = ?auto_432426 ?auto_432431 ) ) ( not ( = ?auto_432426 ?auto_432432 ) ) ( not ( = ?auto_432426 ?auto_432433 ) ) ( not ( = ?auto_432426 ?auto_432434 ) ) ( not ( = ?auto_432426 ?auto_432435 ) ) ( not ( = ?auto_432426 ?auto_432436 ) ) ( not ( = ?auto_432427 ?auto_432428 ) ) ( not ( = ?auto_432427 ?auto_432429 ) ) ( not ( = ?auto_432427 ?auto_432430 ) ) ( not ( = ?auto_432427 ?auto_432431 ) ) ( not ( = ?auto_432427 ?auto_432432 ) ) ( not ( = ?auto_432427 ?auto_432433 ) ) ( not ( = ?auto_432427 ?auto_432434 ) ) ( not ( = ?auto_432427 ?auto_432435 ) ) ( not ( = ?auto_432427 ?auto_432436 ) ) ( not ( = ?auto_432428 ?auto_432429 ) ) ( not ( = ?auto_432428 ?auto_432430 ) ) ( not ( = ?auto_432428 ?auto_432431 ) ) ( not ( = ?auto_432428 ?auto_432432 ) ) ( not ( = ?auto_432428 ?auto_432433 ) ) ( not ( = ?auto_432428 ?auto_432434 ) ) ( not ( = ?auto_432428 ?auto_432435 ) ) ( not ( = ?auto_432428 ?auto_432436 ) ) ( not ( = ?auto_432429 ?auto_432430 ) ) ( not ( = ?auto_432429 ?auto_432431 ) ) ( not ( = ?auto_432429 ?auto_432432 ) ) ( not ( = ?auto_432429 ?auto_432433 ) ) ( not ( = ?auto_432429 ?auto_432434 ) ) ( not ( = ?auto_432429 ?auto_432435 ) ) ( not ( = ?auto_432429 ?auto_432436 ) ) ( not ( = ?auto_432430 ?auto_432431 ) ) ( not ( = ?auto_432430 ?auto_432432 ) ) ( not ( = ?auto_432430 ?auto_432433 ) ) ( not ( = ?auto_432430 ?auto_432434 ) ) ( not ( = ?auto_432430 ?auto_432435 ) ) ( not ( = ?auto_432430 ?auto_432436 ) ) ( not ( = ?auto_432431 ?auto_432432 ) ) ( not ( = ?auto_432431 ?auto_432433 ) ) ( not ( = ?auto_432431 ?auto_432434 ) ) ( not ( = ?auto_432431 ?auto_432435 ) ) ( not ( = ?auto_432431 ?auto_432436 ) ) ( not ( = ?auto_432432 ?auto_432433 ) ) ( not ( = ?auto_432432 ?auto_432434 ) ) ( not ( = ?auto_432432 ?auto_432435 ) ) ( not ( = ?auto_432432 ?auto_432436 ) ) ( not ( = ?auto_432433 ?auto_432434 ) ) ( not ( = ?auto_432433 ?auto_432435 ) ) ( not ( = ?auto_432433 ?auto_432436 ) ) ( not ( = ?auto_432434 ?auto_432435 ) ) ( not ( = ?auto_432434 ?auto_432436 ) ) ( not ( = ?auto_432435 ?auto_432436 ) ) ( ON ?auto_432434 ?auto_432435 ) ( ON ?auto_432433 ?auto_432434 ) ( ON ?auto_432432 ?auto_432433 ) ( ON ?auto_432431 ?auto_432432 ) ( ON ?auto_432430 ?auto_432431 ) ( ON ?auto_432429 ?auto_432430 ) ( ON ?auto_432428 ?auto_432429 ) ( ON ?auto_432427 ?auto_432428 ) ( CLEAR ?auto_432425 ) ( ON ?auto_432426 ?auto_432427 ) ( CLEAR ?auto_432426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_432422 ?auto_432423 ?auto_432424 ?auto_432425 ?auto_432426 )
      ( MAKE-14PILE ?auto_432422 ?auto_432423 ?auto_432424 ?auto_432425 ?auto_432426 ?auto_432427 ?auto_432428 ?auto_432429 ?auto_432430 ?auto_432431 ?auto_432432 ?auto_432433 ?auto_432434 ?auto_432435 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432480 - BLOCK
      ?auto_432481 - BLOCK
      ?auto_432482 - BLOCK
      ?auto_432483 - BLOCK
      ?auto_432484 - BLOCK
      ?auto_432485 - BLOCK
      ?auto_432486 - BLOCK
      ?auto_432487 - BLOCK
      ?auto_432488 - BLOCK
      ?auto_432489 - BLOCK
      ?auto_432490 - BLOCK
      ?auto_432491 - BLOCK
      ?auto_432492 - BLOCK
      ?auto_432493 - BLOCK
    )
    :vars
    (
      ?auto_432494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432493 ?auto_432494 ) ( ON-TABLE ?auto_432480 ) ( ON ?auto_432481 ?auto_432480 ) ( ON ?auto_432482 ?auto_432481 ) ( not ( = ?auto_432480 ?auto_432481 ) ) ( not ( = ?auto_432480 ?auto_432482 ) ) ( not ( = ?auto_432480 ?auto_432483 ) ) ( not ( = ?auto_432480 ?auto_432484 ) ) ( not ( = ?auto_432480 ?auto_432485 ) ) ( not ( = ?auto_432480 ?auto_432486 ) ) ( not ( = ?auto_432480 ?auto_432487 ) ) ( not ( = ?auto_432480 ?auto_432488 ) ) ( not ( = ?auto_432480 ?auto_432489 ) ) ( not ( = ?auto_432480 ?auto_432490 ) ) ( not ( = ?auto_432480 ?auto_432491 ) ) ( not ( = ?auto_432480 ?auto_432492 ) ) ( not ( = ?auto_432480 ?auto_432493 ) ) ( not ( = ?auto_432480 ?auto_432494 ) ) ( not ( = ?auto_432481 ?auto_432482 ) ) ( not ( = ?auto_432481 ?auto_432483 ) ) ( not ( = ?auto_432481 ?auto_432484 ) ) ( not ( = ?auto_432481 ?auto_432485 ) ) ( not ( = ?auto_432481 ?auto_432486 ) ) ( not ( = ?auto_432481 ?auto_432487 ) ) ( not ( = ?auto_432481 ?auto_432488 ) ) ( not ( = ?auto_432481 ?auto_432489 ) ) ( not ( = ?auto_432481 ?auto_432490 ) ) ( not ( = ?auto_432481 ?auto_432491 ) ) ( not ( = ?auto_432481 ?auto_432492 ) ) ( not ( = ?auto_432481 ?auto_432493 ) ) ( not ( = ?auto_432481 ?auto_432494 ) ) ( not ( = ?auto_432482 ?auto_432483 ) ) ( not ( = ?auto_432482 ?auto_432484 ) ) ( not ( = ?auto_432482 ?auto_432485 ) ) ( not ( = ?auto_432482 ?auto_432486 ) ) ( not ( = ?auto_432482 ?auto_432487 ) ) ( not ( = ?auto_432482 ?auto_432488 ) ) ( not ( = ?auto_432482 ?auto_432489 ) ) ( not ( = ?auto_432482 ?auto_432490 ) ) ( not ( = ?auto_432482 ?auto_432491 ) ) ( not ( = ?auto_432482 ?auto_432492 ) ) ( not ( = ?auto_432482 ?auto_432493 ) ) ( not ( = ?auto_432482 ?auto_432494 ) ) ( not ( = ?auto_432483 ?auto_432484 ) ) ( not ( = ?auto_432483 ?auto_432485 ) ) ( not ( = ?auto_432483 ?auto_432486 ) ) ( not ( = ?auto_432483 ?auto_432487 ) ) ( not ( = ?auto_432483 ?auto_432488 ) ) ( not ( = ?auto_432483 ?auto_432489 ) ) ( not ( = ?auto_432483 ?auto_432490 ) ) ( not ( = ?auto_432483 ?auto_432491 ) ) ( not ( = ?auto_432483 ?auto_432492 ) ) ( not ( = ?auto_432483 ?auto_432493 ) ) ( not ( = ?auto_432483 ?auto_432494 ) ) ( not ( = ?auto_432484 ?auto_432485 ) ) ( not ( = ?auto_432484 ?auto_432486 ) ) ( not ( = ?auto_432484 ?auto_432487 ) ) ( not ( = ?auto_432484 ?auto_432488 ) ) ( not ( = ?auto_432484 ?auto_432489 ) ) ( not ( = ?auto_432484 ?auto_432490 ) ) ( not ( = ?auto_432484 ?auto_432491 ) ) ( not ( = ?auto_432484 ?auto_432492 ) ) ( not ( = ?auto_432484 ?auto_432493 ) ) ( not ( = ?auto_432484 ?auto_432494 ) ) ( not ( = ?auto_432485 ?auto_432486 ) ) ( not ( = ?auto_432485 ?auto_432487 ) ) ( not ( = ?auto_432485 ?auto_432488 ) ) ( not ( = ?auto_432485 ?auto_432489 ) ) ( not ( = ?auto_432485 ?auto_432490 ) ) ( not ( = ?auto_432485 ?auto_432491 ) ) ( not ( = ?auto_432485 ?auto_432492 ) ) ( not ( = ?auto_432485 ?auto_432493 ) ) ( not ( = ?auto_432485 ?auto_432494 ) ) ( not ( = ?auto_432486 ?auto_432487 ) ) ( not ( = ?auto_432486 ?auto_432488 ) ) ( not ( = ?auto_432486 ?auto_432489 ) ) ( not ( = ?auto_432486 ?auto_432490 ) ) ( not ( = ?auto_432486 ?auto_432491 ) ) ( not ( = ?auto_432486 ?auto_432492 ) ) ( not ( = ?auto_432486 ?auto_432493 ) ) ( not ( = ?auto_432486 ?auto_432494 ) ) ( not ( = ?auto_432487 ?auto_432488 ) ) ( not ( = ?auto_432487 ?auto_432489 ) ) ( not ( = ?auto_432487 ?auto_432490 ) ) ( not ( = ?auto_432487 ?auto_432491 ) ) ( not ( = ?auto_432487 ?auto_432492 ) ) ( not ( = ?auto_432487 ?auto_432493 ) ) ( not ( = ?auto_432487 ?auto_432494 ) ) ( not ( = ?auto_432488 ?auto_432489 ) ) ( not ( = ?auto_432488 ?auto_432490 ) ) ( not ( = ?auto_432488 ?auto_432491 ) ) ( not ( = ?auto_432488 ?auto_432492 ) ) ( not ( = ?auto_432488 ?auto_432493 ) ) ( not ( = ?auto_432488 ?auto_432494 ) ) ( not ( = ?auto_432489 ?auto_432490 ) ) ( not ( = ?auto_432489 ?auto_432491 ) ) ( not ( = ?auto_432489 ?auto_432492 ) ) ( not ( = ?auto_432489 ?auto_432493 ) ) ( not ( = ?auto_432489 ?auto_432494 ) ) ( not ( = ?auto_432490 ?auto_432491 ) ) ( not ( = ?auto_432490 ?auto_432492 ) ) ( not ( = ?auto_432490 ?auto_432493 ) ) ( not ( = ?auto_432490 ?auto_432494 ) ) ( not ( = ?auto_432491 ?auto_432492 ) ) ( not ( = ?auto_432491 ?auto_432493 ) ) ( not ( = ?auto_432491 ?auto_432494 ) ) ( not ( = ?auto_432492 ?auto_432493 ) ) ( not ( = ?auto_432492 ?auto_432494 ) ) ( not ( = ?auto_432493 ?auto_432494 ) ) ( ON ?auto_432492 ?auto_432493 ) ( ON ?auto_432491 ?auto_432492 ) ( ON ?auto_432490 ?auto_432491 ) ( ON ?auto_432489 ?auto_432490 ) ( ON ?auto_432488 ?auto_432489 ) ( ON ?auto_432487 ?auto_432488 ) ( ON ?auto_432486 ?auto_432487 ) ( ON ?auto_432485 ?auto_432486 ) ( ON ?auto_432484 ?auto_432485 ) ( CLEAR ?auto_432482 ) ( ON ?auto_432483 ?auto_432484 ) ( CLEAR ?auto_432483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_432480 ?auto_432481 ?auto_432482 ?auto_432483 )
      ( MAKE-14PILE ?auto_432480 ?auto_432481 ?auto_432482 ?auto_432483 ?auto_432484 ?auto_432485 ?auto_432486 ?auto_432487 ?auto_432488 ?auto_432489 ?auto_432490 ?auto_432491 ?auto_432492 ?auto_432493 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432538 - BLOCK
      ?auto_432539 - BLOCK
      ?auto_432540 - BLOCK
      ?auto_432541 - BLOCK
      ?auto_432542 - BLOCK
      ?auto_432543 - BLOCK
      ?auto_432544 - BLOCK
      ?auto_432545 - BLOCK
      ?auto_432546 - BLOCK
      ?auto_432547 - BLOCK
      ?auto_432548 - BLOCK
      ?auto_432549 - BLOCK
      ?auto_432550 - BLOCK
      ?auto_432551 - BLOCK
    )
    :vars
    (
      ?auto_432552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432551 ?auto_432552 ) ( ON-TABLE ?auto_432538 ) ( ON ?auto_432539 ?auto_432538 ) ( not ( = ?auto_432538 ?auto_432539 ) ) ( not ( = ?auto_432538 ?auto_432540 ) ) ( not ( = ?auto_432538 ?auto_432541 ) ) ( not ( = ?auto_432538 ?auto_432542 ) ) ( not ( = ?auto_432538 ?auto_432543 ) ) ( not ( = ?auto_432538 ?auto_432544 ) ) ( not ( = ?auto_432538 ?auto_432545 ) ) ( not ( = ?auto_432538 ?auto_432546 ) ) ( not ( = ?auto_432538 ?auto_432547 ) ) ( not ( = ?auto_432538 ?auto_432548 ) ) ( not ( = ?auto_432538 ?auto_432549 ) ) ( not ( = ?auto_432538 ?auto_432550 ) ) ( not ( = ?auto_432538 ?auto_432551 ) ) ( not ( = ?auto_432538 ?auto_432552 ) ) ( not ( = ?auto_432539 ?auto_432540 ) ) ( not ( = ?auto_432539 ?auto_432541 ) ) ( not ( = ?auto_432539 ?auto_432542 ) ) ( not ( = ?auto_432539 ?auto_432543 ) ) ( not ( = ?auto_432539 ?auto_432544 ) ) ( not ( = ?auto_432539 ?auto_432545 ) ) ( not ( = ?auto_432539 ?auto_432546 ) ) ( not ( = ?auto_432539 ?auto_432547 ) ) ( not ( = ?auto_432539 ?auto_432548 ) ) ( not ( = ?auto_432539 ?auto_432549 ) ) ( not ( = ?auto_432539 ?auto_432550 ) ) ( not ( = ?auto_432539 ?auto_432551 ) ) ( not ( = ?auto_432539 ?auto_432552 ) ) ( not ( = ?auto_432540 ?auto_432541 ) ) ( not ( = ?auto_432540 ?auto_432542 ) ) ( not ( = ?auto_432540 ?auto_432543 ) ) ( not ( = ?auto_432540 ?auto_432544 ) ) ( not ( = ?auto_432540 ?auto_432545 ) ) ( not ( = ?auto_432540 ?auto_432546 ) ) ( not ( = ?auto_432540 ?auto_432547 ) ) ( not ( = ?auto_432540 ?auto_432548 ) ) ( not ( = ?auto_432540 ?auto_432549 ) ) ( not ( = ?auto_432540 ?auto_432550 ) ) ( not ( = ?auto_432540 ?auto_432551 ) ) ( not ( = ?auto_432540 ?auto_432552 ) ) ( not ( = ?auto_432541 ?auto_432542 ) ) ( not ( = ?auto_432541 ?auto_432543 ) ) ( not ( = ?auto_432541 ?auto_432544 ) ) ( not ( = ?auto_432541 ?auto_432545 ) ) ( not ( = ?auto_432541 ?auto_432546 ) ) ( not ( = ?auto_432541 ?auto_432547 ) ) ( not ( = ?auto_432541 ?auto_432548 ) ) ( not ( = ?auto_432541 ?auto_432549 ) ) ( not ( = ?auto_432541 ?auto_432550 ) ) ( not ( = ?auto_432541 ?auto_432551 ) ) ( not ( = ?auto_432541 ?auto_432552 ) ) ( not ( = ?auto_432542 ?auto_432543 ) ) ( not ( = ?auto_432542 ?auto_432544 ) ) ( not ( = ?auto_432542 ?auto_432545 ) ) ( not ( = ?auto_432542 ?auto_432546 ) ) ( not ( = ?auto_432542 ?auto_432547 ) ) ( not ( = ?auto_432542 ?auto_432548 ) ) ( not ( = ?auto_432542 ?auto_432549 ) ) ( not ( = ?auto_432542 ?auto_432550 ) ) ( not ( = ?auto_432542 ?auto_432551 ) ) ( not ( = ?auto_432542 ?auto_432552 ) ) ( not ( = ?auto_432543 ?auto_432544 ) ) ( not ( = ?auto_432543 ?auto_432545 ) ) ( not ( = ?auto_432543 ?auto_432546 ) ) ( not ( = ?auto_432543 ?auto_432547 ) ) ( not ( = ?auto_432543 ?auto_432548 ) ) ( not ( = ?auto_432543 ?auto_432549 ) ) ( not ( = ?auto_432543 ?auto_432550 ) ) ( not ( = ?auto_432543 ?auto_432551 ) ) ( not ( = ?auto_432543 ?auto_432552 ) ) ( not ( = ?auto_432544 ?auto_432545 ) ) ( not ( = ?auto_432544 ?auto_432546 ) ) ( not ( = ?auto_432544 ?auto_432547 ) ) ( not ( = ?auto_432544 ?auto_432548 ) ) ( not ( = ?auto_432544 ?auto_432549 ) ) ( not ( = ?auto_432544 ?auto_432550 ) ) ( not ( = ?auto_432544 ?auto_432551 ) ) ( not ( = ?auto_432544 ?auto_432552 ) ) ( not ( = ?auto_432545 ?auto_432546 ) ) ( not ( = ?auto_432545 ?auto_432547 ) ) ( not ( = ?auto_432545 ?auto_432548 ) ) ( not ( = ?auto_432545 ?auto_432549 ) ) ( not ( = ?auto_432545 ?auto_432550 ) ) ( not ( = ?auto_432545 ?auto_432551 ) ) ( not ( = ?auto_432545 ?auto_432552 ) ) ( not ( = ?auto_432546 ?auto_432547 ) ) ( not ( = ?auto_432546 ?auto_432548 ) ) ( not ( = ?auto_432546 ?auto_432549 ) ) ( not ( = ?auto_432546 ?auto_432550 ) ) ( not ( = ?auto_432546 ?auto_432551 ) ) ( not ( = ?auto_432546 ?auto_432552 ) ) ( not ( = ?auto_432547 ?auto_432548 ) ) ( not ( = ?auto_432547 ?auto_432549 ) ) ( not ( = ?auto_432547 ?auto_432550 ) ) ( not ( = ?auto_432547 ?auto_432551 ) ) ( not ( = ?auto_432547 ?auto_432552 ) ) ( not ( = ?auto_432548 ?auto_432549 ) ) ( not ( = ?auto_432548 ?auto_432550 ) ) ( not ( = ?auto_432548 ?auto_432551 ) ) ( not ( = ?auto_432548 ?auto_432552 ) ) ( not ( = ?auto_432549 ?auto_432550 ) ) ( not ( = ?auto_432549 ?auto_432551 ) ) ( not ( = ?auto_432549 ?auto_432552 ) ) ( not ( = ?auto_432550 ?auto_432551 ) ) ( not ( = ?auto_432550 ?auto_432552 ) ) ( not ( = ?auto_432551 ?auto_432552 ) ) ( ON ?auto_432550 ?auto_432551 ) ( ON ?auto_432549 ?auto_432550 ) ( ON ?auto_432548 ?auto_432549 ) ( ON ?auto_432547 ?auto_432548 ) ( ON ?auto_432546 ?auto_432547 ) ( ON ?auto_432545 ?auto_432546 ) ( ON ?auto_432544 ?auto_432545 ) ( ON ?auto_432543 ?auto_432544 ) ( ON ?auto_432542 ?auto_432543 ) ( ON ?auto_432541 ?auto_432542 ) ( CLEAR ?auto_432539 ) ( ON ?auto_432540 ?auto_432541 ) ( CLEAR ?auto_432540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_432538 ?auto_432539 ?auto_432540 )
      ( MAKE-14PILE ?auto_432538 ?auto_432539 ?auto_432540 ?auto_432541 ?auto_432542 ?auto_432543 ?auto_432544 ?auto_432545 ?auto_432546 ?auto_432547 ?auto_432548 ?auto_432549 ?auto_432550 ?auto_432551 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432596 - BLOCK
      ?auto_432597 - BLOCK
      ?auto_432598 - BLOCK
      ?auto_432599 - BLOCK
      ?auto_432600 - BLOCK
      ?auto_432601 - BLOCK
      ?auto_432602 - BLOCK
      ?auto_432603 - BLOCK
      ?auto_432604 - BLOCK
      ?auto_432605 - BLOCK
      ?auto_432606 - BLOCK
      ?auto_432607 - BLOCK
      ?auto_432608 - BLOCK
      ?auto_432609 - BLOCK
    )
    :vars
    (
      ?auto_432610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432609 ?auto_432610 ) ( ON-TABLE ?auto_432596 ) ( not ( = ?auto_432596 ?auto_432597 ) ) ( not ( = ?auto_432596 ?auto_432598 ) ) ( not ( = ?auto_432596 ?auto_432599 ) ) ( not ( = ?auto_432596 ?auto_432600 ) ) ( not ( = ?auto_432596 ?auto_432601 ) ) ( not ( = ?auto_432596 ?auto_432602 ) ) ( not ( = ?auto_432596 ?auto_432603 ) ) ( not ( = ?auto_432596 ?auto_432604 ) ) ( not ( = ?auto_432596 ?auto_432605 ) ) ( not ( = ?auto_432596 ?auto_432606 ) ) ( not ( = ?auto_432596 ?auto_432607 ) ) ( not ( = ?auto_432596 ?auto_432608 ) ) ( not ( = ?auto_432596 ?auto_432609 ) ) ( not ( = ?auto_432596 ?auto_432610 ) ) ( not ( = ?auto_432597 ?auto_432598 ) ) ( not ( = ?auto_432597 ?auto_432599 ) ) ( not ( = ?auto_432597 ?auto_432600 ) ) ( not ( = ?auto_432597 ?auto_432601 ) ) ( not ( = ?auto_432597 ?auto_432602 ) ) ( not ( = ?auto_432597 ?auto_432603 ) ) ( not ( = ?auto_432597 ?auto_432604 ) ) ( not ( = ?auto_432597 ?auto_432605 ) ) ( not ( = ?auto_432597 ?auto_432606 ) ) ( not ( = ?auto_432597 ?auto_432607 ) ) ( not ( = ?auto_432597 ?auto_432608 ) ) ( not ( = ?auto_432597 ?auto_432609 ) ) ( not ( = ?auto_432597 ?auto_432610 ) ) ( not ( = ?auto_432598 ?auto_432599 ) ) ( not ( = ?auto_432598 ?auto_432600 ) ) ( not ( = ?auto_432598 ?auto_432601 ) ) ( not ( = ?auto_432598 ?auto_432602 ) ) ( not ( = ?auto_432598 ?auto_432603 ) ) ( not ( = ?auto_432598 ?auto_432604 ) ) ( not ( = ?auto_432598 ?auto_432605 ) ) ( not ( = ?auto_432598 ?auto_432606 ) ) ( not ( = ?auto_432598 ?auto_432607 ) ) ( not ( = ?auto_432598 ?auto_432608 ) ) ( not ( = ?auto_432598 ?auto_432609 ) ) ( not ( = ?auto_432598 ?auto_432610 ) ) ( not ( = ?auto_432599 ?auto_432600 ) ) ( not ( = ?auto_432599 ?auto_432601 ) ) ( not ( = ?auto_432599 ?auto_432602 ) ) ( not ( = ?auto_432599 ?auto_432603 ) ) ( not ( = ?auto_432599 ?auto_432604 ) ) ( not ( = ?auto_432599 ?auto_432605 ) ) ( not ( = ?auto_432599 ?auto_432606 ) ) ( not ( = ?auto_432599 ?auto_432607 ) ) ( not ( = ?auto_432599 ?auto_432608 ) ) ( not ( = ?auto_432599 ?auto_432609 ) ) ( not ( = ?auto_432599 ?auto_432610 ) ) ( not ( = ?auto_432600 ?auto_432601 ) ) ( not ( = ?auto_432600 ?auto_432602 ) ) ( not ( = ?auto_432600 ?auto_432603 ) ) ( not ( = ?auto_432600 ?auto_432604 ) ) ( not ( = ?auto_432600 ?auto_432605 ) ) ( not ( = ?auto_432600 ?auto_432606 ) ) ( not ( = ?auto_432600 ?auto_432607 ) ) ( not ( = ?auto_432600 ?auto_432608 ) ) ( not ( = ?auto_432600 ?auto_432609 ) ) ( not ( = ?auto_432600 ?auto_432610 ) ) ( not ( = ?auto_432601 ?auto_432602 ) ) ( not ( = ?auto_432601 ?auto_432603 ) ) ( not ( = ?auto_432601 ?auto_432604 ) ) ( not ( = ?auto_432601 ?auto_432605 ) ) ( not ( = ?auto_432601 ?auto_432606 ) ) ( not ( = ?auto_432601 ?auto_432607 ) ) ( not ( = ?auto_432601 ?auto_432608 ) ) ( not ( = ?auto_432601 ?auto_432609 ) ) ( not ( = ?auto_432601 ?auto_432610 ) ) ( not ( = ?auto_432602 ?auto_432603 ) ) ( not ( = ?auto_432602 ?auto_432604 ) ) ( not ( = ?auto_432602 ?auto_432605 ) ) ( not ( = ?auto_432602 ?auto_432606 ) ) ( not ( = ?auto_432602 ?auto_432607 ) ) ( not ( = ?auto_432602 ?auto_432608 ) ) ( not ( = ?auto_432602 ?auto_432609 ) ) ( not ( = ?auto_432602 ?auto_432610 ) ) ( not ( = ?auto_432603 ?auto_432604 ) ) ( not ( = ?auto_432603 ?auto_432605 ) ) ( not ( = ?auto_432603 ?auto_432606 ) ) ( not ( = ?auto_432603 ?auto_432607 ) ) ( not ( = ?auto_432603 ?auto_432608 ) ) ( not ( = ?auto_432603 ?auto_432609 ) ) ( not ( = ?auto_432603 ?auto_432610 ) ) ( not ( = ?auto_432604 ?auto_432605 ) ) ( not ( = ?auto_432604 ?auto_432606 ) ) ( not ( = ?auto_432604 ?auto_432607 ) ) ( not ( = ?auto_432604 ?auto_432608 ) ) ( not ( = ?auto_432604 ?auto_432609 ) ) ( not ( = ?auto_432604 ?auto_432610 ) ) ( not ( = ?auto_432605 ?auto_432606 ) ) ( not ( = ?auto_432605 ?auto_432607 ) ) ( not ( = ?auto_432605 ?auto_432608 ) ) ( not ( = ?auto_432605 ?auto_432609 ) ) ( not ( = ?auto_432605 ?auto_432610 ) ) ( not ( = ?auto_432606 ?auto_432607 ) ) ( not ( = ?auto_432606 ?auto_432608 ) ) ( not ( = ?auto_432606 ?auto_432609 ) ) ( not ( = ?auto_432606 ?auto_432610 ) ) ( not ( = ?auto_432607 ?auto_432608 ) ) ( not ( = ?auto_432607 ?auto_432609 ) ) ( not ( = ?auto_432607 ?auto_432610 ) ) ( not ( = ?auto_432608 ?auto_432609 ) ) ( not ( = ?auto_432608 ?auto_432610 ) ) ( not ( = ?auto_432609 ?auto_432610 ) ) ( ON ?auto_432608 ?auto_432609 ) ( ON ?auto_432607 ?auto_432608 ) ( ON ?auto_432606 ?auto_432607 ) ( ON ?auto_432605 ?auto_432606 ) ( ON ?auto_432604 ?auto_432605 ) ( ON ?auto_432603 ?auto_432604 ) ( ON ?auto_432602 ?auto_432603 ) ( ON ?auto_432601 ?auto_432602 ) ( ON ?auto_432600 ?auto_432601 ) ( ON ?auto_432599 ?auto_432600 ) ( ON ?auto_432598 ?auto_432599 ) ( CLEAR ?auto_432596 ) ( ON ?auto_432597 ?auto_432598 ) ( CLEAR ?auto_432597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_432596 ?auto_432597 )
      ( MAKE-14PILE ?auto_432596 ?auto_432597 ?auto_432598 ?auto_432599 ?auto_432600 ?auto_432601 ?auto_432602 ?auto_432603 ?auto_432604 ?auto_432605 ?auto_432606 ?auto_432607 ?auto_432608 ?auto_432609 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_432654 - BLOCK
      ?auto_432655 - BLOCK
      ?auto_432656 - BLOCK
      ?auto_432657 - BLOCK
      ?auto_432658 - BLOCK
      ?auto_432659 - BLOCK
      ?auto_432660 - BLOCK
      ?auto_432661 - BLOCK
      ?auto_432662 - BLOCK
      ?auto_432663 - BLOCK
      ?auto_432664 - BLOCK
      ?auto_432665 - BLOCK
      ?auto_432666 - BLOCK
      ?auto_432667 - BLOCK
    )
    :vars
    (
      ?auto_432668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432667 ?auto_432668 ) ( not ( = ?auto_432654 ?auto_432655 ) ) ( not ( = ?auto_432654 ?auto_432656 ) ) ( not ( = ?auto_432654 ?auto_432657 ) ) ( not ( = ?auto_432654 ?auto_432658 ) ) ( not ( = ?auto_432654 ?auto_432659 ) ) ( not ( = ?auto_432654 ?auto_432660 ) ) ( not ( = ?auto_432654 ?auto_432661 ) ) ( not ( = ?auto_432654 ?auto_432662 ) ) ( not ( = ?auto_432654 ?auto_432663 ) ) ( not ( = ?auto_432654 ?auto_432664 ) ) ( not ( = ?auto_432654 ?auto_432665 ) ) ( not ( = ?auto_432654 ?auto_432666 ) ) ( not ( = ?auto_432654 ?auto_432667 ) ) ( not ( = ?auto_432654 ?auto_432668 ) ) ( not ( = ?auto_432655 ?auto_432656 ) ) ( not ( = ?auto_432655 ?auto_432657 ) ) ( not ( = ?auto_432655 ?auto_432658 ) ) ( not ( = ?auto_432655 ?auto_432659 ) ) ( not ( = ?auto_432655 ?auto_432660 ) ) ( not ( = ?auto_432655 ?auto_432661 ) ) ( not ( = ?auto_432655 ?auto_432662 ) ) ( not ( = ?auto_432655 ?auto_432663 ) ) ( not ( = ?auto_432655 ?auto_432664 ) ) ( not ( = ?auto_432655 ?auto_432665 ) ) ( not ( = ?auto_432655 ?auto_432666 ) ) ( not ( = ?auto_432655 ?auto_432667 ) ) ( not ( = ?auto_432655 ?auto_432668 ) ) ( not ( = ?auto_432656 ?auto_432657 ) ) ( not ( = ?auto_432656 ?auto_432658 ) ) ( not ( = ?auto_432656 ?auto_432659 ) ) ( not ( = ?auto_432656 ?auto_432660 ) ) ( not ( = ?auto_432656 ?auto_432661 ) ) ( not ( = ?auto_432656 ?auto_432662 ) ) ( not ( = ?auto_432656 ?auto_432663 ) ) ( not ( = ?auto_432656 ?auto_432664 ) ) ( not ( = ?auto_432656 ?auto_432665 ) ) ( not ( = ?auto_432656 ?auto_432666 ) ) ( not ( = ?auto_432656 ?auto_432667 ) ) ( not ( = ?auto_432656 ?auto_432668 ) ) ( not ( = ?auto_432657 ?auto_432658 ) ) ( not ( = ?auto_432657 ?auto_432659 ) ) ( not ( = ?auto_432657 ?auto_432660 ) ) ( not ( = ?auto_432657 ?auto_432661 ) ) ( not ( = ?auto_432657 ?auto_432662 ) ) ( not ( = ?auto_432657 ?auto_432663 ) ) ( not ( = ?auto_432657 ?auto_432664 ) ) ( not ( = ?auto_432657 ?auto_432665 ) ) ( not ( = ?auto_432657 ?auto_432666 ) ) ( not ( = ?auto_432657 ?auto_432667 ) ) ( not ( = ?auto_432657 ?auto_432668 ) ) ( not ( = ?auto_432658 ?auto_432659 ) ) ( not ( = ?auto_432658 ?auto_432660 ) ) ( not ( = ?auto_432658 ?auto_432661 ) ) ( not ( = ?auto_432658 ?auto_432662 ) ) ( not ( = ?auto_432658 ?auto_432663 ) ) ( not ( = ?auto_432658 ?auto_432664 ) ) ( not ( = ?auto_432658 ?auto_432665 ) ) ( not ( = ?auto_432658 ?auto_432666 ) ) ( not ( = ?auto_432658 ?auto_432667 ) ) ( not ( = ?auto_432658 ?auto_432668 ) ) ( not ( = ?auto_432659 ?auto_432660 ) ) ( not ( = ?auto_432659 ?auto_432661 ) ) ( not ( = ?auto_432659 ?auto_432662 ) ) ( not ( = ?auto_432659 ?auto_432663 ) ) ( not ( = ?auto_432659 ?auto_432664 ) ) ( not ( = ?auto_432659 ?auto_432665 ) ) ( not ( = ?auto_432659 ?auto_432666 ) ) ( not ( = ?auto_432659 ?auto_432667 ) ) ( not ( = ?auto_432659 ?auto_432668 ) ) ( not ( = ?auto_432660 ?auto_432661 ) ) ( not ( = ?auto_432660 ?auto_432662 ) ) ( not ( = ?auto_432660 ?auto_432663 ) ) ( not ( = ?auto_432660 ?auto_432664 ) ) ( not ( = ?auto_432660 ?auto_432665 ) ) ( not ( = ?auto_432660 ?auto_432666 ) ) ( not ( = ?auto_432660 ?auto_432667 ) ) ( not ( = ?auto_432660 ?auto_432668 ) ) ( not ( = ?auto_432661 ?auto_432662 ) ) ( not ( = ?auto_432661 ?auto_432663 ) ) ( not ( = ?auto_432661 ?auto_432664 ) ) ( not ( = ?auto_432661 ?auto_432665 ) ) ( not ( = ?auto_432661 ?auto_432666 ) ) ( not ( = ?auto_432661 ?auto_432667 ) ) ( not ( = ?auto_432661 ?auto_432668 ) ) ( not ( = ?auto_432662 ?auto_432663 ) ) ( not ( = ?auto_432662 ?auto_432664 ) ) ( not ( = ?auto_432662 ?auto_432665 ) ) ( not ( = ?auto_432662 ?auto_432666 ) ) ( not ( = ?auto_432662 ?auto_432667 ) ) ( not ( = ?auto_432662 ?auto_432668 ) ) ( not ( = ?auto_432663 ?auto_432664 ) ) ( not ( = ?auto_432663 ?auto_432665 ) ) ( not ( = ?auto_432663 ?auto_432666 ) ) ( not ( = ?auto_432663 ?auto_432667 ) ) ( not ( = ?auto_432663 ?auto_432668 ) ) ( not ( = ?auto_432664 ?auto_432665 ) ) ( not ( = ?auto_432664 ?auto_432666 ) ) ( not ( = ?auto_432664 ?auto_432667 ) ) ( not ( = ?auto_432664 ?auto_432668 ) ) ( not ( = ?auto_432665 ?auto_432666 ) ) ( not ( = ?auto_432665 ?auto_432667 ) ) ( not ( = ?auto_432665 ?auto_432668 ) ) ( not ( = ?auto_432666 ?auto_432667 ) ) ( not ( = ?auto_432666 ?auto_432668 ) ) ( not ( = ?auto_432667 ?auto_432668 ) ) ( ON ?auto_432666 ?auto_432667 ) ( ON ?auto_432665 ?auto_432666 ) ( ON ?auto_432664 ?auto_432665 ) ( ON ?auto_432663 ?auto_432664 ) ( ON ?auto_432662 ?auto_432663 ) ( ON ?auto_432661 ?auto_432662 ) ( ON ?auto_432660 ?auto_432661 ) ( ON ?auto_432659 ?auto_432660 ) ( ON ?auto_432658 ?auto_432659 ) ( ON ?auto_432657 ?auto_432658 ) ( ON ?auto_432656 ?auto_432657 ) ( ON ?auto_432655 ?auto_432656 ) ( ON ?auto_432654 ?auto_432655 ) ( CLEAR ?auto_432654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_432654 )
      ( MAKE-14PILE ?auto_432654 ?auto_432655 ?auto_432656 ?auto_432657 ?auto_432658 ?auto_432659 ?auto_432660 ?auto_432661 ?auto_432662 ?auto_432663 ?auto_432664 ?auto_432665 ?auto_432666 ?auto_432667 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432713 - BLOCK
      ?auto_432714 - BLOCK
      ?auto_432715 - BLOCK
      ?auto_432716 - BLOCK
      ?auto_432717 - BLOCK
      ?auto_432718 - BLOCK
      ?auto_432719 - BLOCK
      ?auto_432720 - BLOCK
      ?auto_432721 - BLOCK
      ?auto_432722 - BLOCK
      ?auto_432723 - BLOCK
      ?auto_432724 - BLOCK
      ?auto_432725 - BLOCK
      ?auto_432726 - BLOCK
      ?auto_432727 - BLOCK
    )
    :vars
    (
      ?auto_432728 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_432726 ) ( ON ?auto_432727 ?auto_432728 ) ( CLEAR ?auto_432727 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_432713 ) ( ON ?auto_432714 ?auto_432713 ) ( ON ?auto_432715 ?auto_432714 ) ( ON ?auto_432716 ?auto_432715 ) ( ON ?auto_432717 ?auto_432716 ) ( ON ?auto_432718 ?auto_432717 ) ( ON ?auto_432719 ?auto_432718 ) ( ON ?auto_432720 ?auto_432719 ) ( ON ?auto_432721 ?auto_432720 ) ( ON ?auto_432722 ?auto_432721 ) ( ON ?auto_432723 ?auto_432722 ) ( ON ?auto_432724 ?auto_432723 ) ( ON ?auto_432725 ?auto_432724 ) ( ON ?auto_432726 ?auto_432725 ) ( not ( = ?auto_432713 ?auto_432714 ) ) ( not ( = ?auto_432713 ?auto_432715 ) ) ( not ( = ?auto_432713 ?auto_432716 ) ) ( not ( = ?auto_432713 ?auto_432717 ) ) ( not ( = ?auto_432713 ?auto_432718 ) ) ( not ( = ?auto_432713 ?auto_432719 ) ) ( not ( = ?auto_432713 ?auto_432720 ) ) ( not ( = ?auto_432713 ?auto_432721 ) ) ( not ( = ?auto_432713 ?auto_432722 ) ) ( not ( = ?auto_432713 ?auto_432723 ) ) ( not ( = ?auto_432713 ?auto_432724 ) ) ( not ( = ?auto_432713 ?auto_432725 ) ) ( not ( = ?auto_432713 ?auto_432726 ) ) ( not ( = ?auto_432713 ?auto_432727 ) ) ( not ( = ?auto_432713 ?auto_432728 ) ) ( not ( = ?auto_432714 ?auto_432715 ) ) ( not ( = ?auto_432714 ?auto_432716 ) ) ( not ( = ?auto_432714 ?auto_432717 ) ) ( not ( = ?auto_432714 ?auto_432718 ) ) ( not ( = ?auto_432714 ?auto_432719 ) ) ( not ( = ?auto_432714 ?auto_432720 ) ) ( not ( = ?auto_432714 ?auto_432721 ) ) ( not ( = ?auto_432714 ?auto_432722 ) ) ( not ( = ?auto_432714 ?auto_432723 ) ) ( not ( = ?auto_432714 ?auto_432724 ) ) ( not ( = ?auto_432714 ?auto_432725 ) ) ( not ( = ?auto_432714 ?auto_432726 ) ) ( not ( = ?auto_432714 ?auto_432727 ) ) ( not ( = ?auto_432714 ?auto_432728 ) ) ( not ( = ?auto_432715 ?auto_432716 ) ) ( not ( = ?auto_432715 ?auto_432717 ) ) ( not ( = ?auto_432715 ?auto_432718 ) ) ( not ( = ?auto_432715 ?auto_432719 ) ) ( not ( = ?auto_432715 ?auto_432720 ) ) ( not ( = ?auto_432715 ?auto_432721 ) ) ( not ( = ?auto_432715 ?auto_432722 ) ) ( not ( = ?auto_432715 ?auto_432723 ) ) ( not ( = ?auto_432715 ?auto_432724 ) ) ( not ( = ?auto_432715 ?auto_432725 ) ) ( not ( = ?auto_432715 ?auto_432726 ) ) ( not ( = ?auto_432715 ?auto_432727 ) ) ( not ( = ?auto_432715 ?auto_432728 ) ) ( not ( = ?auto_432716 ?auto_432717 ) ) ( not ( = ?auto_432716 ?auto_432718 ) ) ( not ( = ?auto_432716 ?auto_432719 ) ) ( not ( = ?auto_432716 ?auto_432720 ) ) ( not ( = ?auto_432716 ?auto_432721 ) ) ( not ( = ?auto_432716 ?auto_432722 ) ) ( not ( = ?auto_432716 ?auto_432723 ) ) ( not ( = ?auto_432716 ?auto_432724 ) ) ( not ( = ?auto_432716 ?auto_432725 ) ) ( not ( = ?auto_432716 ?auto_432726 ) ) ( not ( = ?auto_432716 ?auto_432727 ) ) ( not ( = ?auto_432716 ?auto_432728 ) ) ( not ( = ?auto_432717 ?auto_432718 ) ) ( not ( = ?auto_432717 ?auto_432719 ) ) ( not ( = ?auto_432717 ?auto_432720 ) ) ( not ( = ?auto_432717 ?auto_432721 ) ) ( not ( = ?auto_432717 ?auto_432722 ) ) ( not ( = ?auto_432717 ?auto_432723 ) ) ( not ( = ?auto_432717 ?auto_432724 ) ) ( not ( = ?auto_432717 ?auto_432725 ) ) ( not ( = ?auto_432717 ?auto_432726 ) ) ( not ( = ?auto_432717 ?auto_432727 ) ) ( not ( = ?auto_432717 ?auto_432728 ) ) ( not ( = ?auto_432718 ?auto_432719 ) ) ( not ( = ?auto_432718 ?auto_432720 ) ) ( not ( = ?auto_432718 ?auto_432721 ) ) ( not ( = ?auto_432718 ?auto_432722 ) ) ( not ( = ?auto_432718 ?auto_432723 ) ) ( not ( = ?auto_432718 ?auto_432724 ) ) ( not ( = ?auto_432718 ?auto_432725 ) ) ( not ( = ?auto_432718 ?auto_432726 ) ) ( not ( = ?auto_432718 ?auto_432727 ) ) ( not ( = ?auto_432718 ?auto_432728 ) ) ( not ( = ?auto_432719 ?auto_432720 ) ) ( not ( = ?auto_432719 ?auto_432721 ) ) ( not ( = ?auto_432719 ?auto_432722 ) ) ( not ( = ?auto_432719 ?auto_432723 ) ) ( not ( = ?auto_432719 ?auto_432724 ) ) ( not ( = ?auto_432719 ?auto_432725 ) ) ( not ( = ?auto_432719 ?auto_432726 ) ) ( not ( = ?auto_432719 ?auto_432727 ) ) ( not ( = ?auto_432719 ?auto_432728 ) ) ( not ( = ?auto_432720 ?auto_432721 ) ) ( not ( = ?auto_432720 ?auto_432722 ) ) ( not ( = ?auto_432720 ?auto_432723 ) ) ( not ( = ?auto_432720 ?auto_432724 ) ) ( not ( = ?auto_432720 ?auto_432725 ) ) ( not ( = ?auto_432720 ?auto_432726 ) ) ( not ( = ?auto_432720 ?auto_432727 ) ) ( not ( = ?auto_432720 ?auto_432728 ) ) ( not ( = ?auto_432721 ?auto_432722 ) ) ( not ( = ?auto_432721 ?auto_432723 ) ) ( not ( = ?auto_432721 ?auto_432724 ) ) ( not ( = ?auto_432721 ?auto_432725 ) ) ( not ( = ?auto_432721 ?auto_432726 ) ) ( not ( = ?auto_432721 ?auto_432727 ) ) ( not ( = ?auto_432721 ?auto_432728 ) ) ( not ( = ?auto_432722 ?auto_432723 ) ) ( not ( = ?auto_432722 ?auto_432724 ) ) ( not ( = ?auto_432722 ?auto_432725 ) ) ( not ( = ?auto_432722 ?auto_432726 ) ) ( not ( = ?auto_432722 ?auto_432727 ) ) ( not ( = ?auto_432722 ?auto_432728 ) ) ( not ( = ?auto_432723 ?auto_432724 ) ) ( not ( = ?auto_432723 ?auto_432725 ) ) ( not ( = ?auto_432723 ?auto_432726 ) ) ( not ( = ?auto_432723 ?auto_432727 ) ) ( not ( = ?auto_432723 ?auto_432728 ) ) ( not ( = ?auto_432724 ?auto_432725 ) ) ( not ( = ?auto_432724 ?auto_432726 ) ) ( not ( = ?auto_432724 ?auto_432727 ) ) ( not ( = ?auto_432724 ?auto_432728 ) ) ( not ( = ?auto_432725 ?auto_432726 ) ) ( not ( = ?auto_432725 ?auto_432727 ) ) ( not ( = ?auto_432725 ?auto_432728 ) ) ( not ( = ?auto_432726 ?auto_432727 ) ) ( not ( = ?auto_432726 ?auto_432728 ) ) ( not ( = ?auto_432727 ?auto_432728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_432727 ?auto_432728 )
      ( !STACK ?auto_432727 ?auto_432726 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432744 - BLOCK
      ?auto_432745 - BLOCK
      ?auto_432746 - BLOCK
      ?auto_432747 - BLOCK
      ?auto_432748 - BLOCK
      ?auto_432749 - BLOCK
      ?auto_432750 - BLOCK
      ?auto_432751 - BLOCK
      ?auto_432752 - BLOCK
      ?auto_432753 - BLOCK
      ?auto_432754 - BLOCK
      ?auto_432755 - BLOCK
      ?auto_432756 - BLOCK
      ?auto_432757 - BLOCK
      ?auto_432758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_432757 ) ( ON-TABLE ?auto_432758 ) ( CLEAR ?auto_432758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_432744 ) ( ON ?auto_432745 ?auto_432744 ) ( ON ?auto_432746 ?auto_432745 ) ( ON ?auto_432747 ?auto_432746 ) ( ON ?auto_432748 ?auto_432747 ) ( ON ?auto_432749 ?auto_432748 ) ( ON ?auto_432750 ?auto_432749 ) ( ON ?auto_432751 ?auto_432750 ) ( ON ?auto_432752 ?auto_432751 ) ( ON ?auto_432753 ?auto_432752 ) ( ON ?auto_432754 ?auto_432753 ) ( ON ?auto_432755 ?auto_432754 ) ( ON ?auto_432756 ?auto_432755 ) ( ON ?auto_432757 ?auto_432756 ) ( not ( = ?auto_432744 ?auto_432745 ) ) ( not ( = ?auto_432744 ?auto_432746 ) ) ( not ( = ?auto_432744 ?auto_432747 ) ) ( not ( = ?auto_432744 ?auto_432748 ) ) ( not ( = ?auto_432744 ?auto_432749 ) ) ( not ( = ?auto_432744 ?auto_432750 ) ) ( not ( = ?auto_432744 ?auto_432751 ) ) ( not ( = ?auto_432744 ?auto_432752 ) ) ( not ( = ?auto_432744 ?auto_432753 ) ) ( not ( = ?auto_432744 ?auto_432754 ) ) ( not ( = ?auto_432744 ?auto_432755 ) ) ( not ( = ?auto_432744 ?auto_432756 ) ) ( not ( = ?auto_432744 ?auto_432757 ) ) ( not ( = ?auto_432744 ?auto_432758 ) ) ( not ( = ?auto_432745 ?auto_432746 ) ) ( not ( = ?auto_432745 ?auto_432747 ) ) ( not ( = ?auto_432745 ?auto_432748 ) ) ( not ( = ?auto_432745 ?auto_432749 ) ) ( not ( = ?auto_432745 ?auto_432750 ) ) ( not ( = ?auto_432745 ?auto_432751 ) ) ( not ( = ?auto_432745 ?auto_432752 ) ) ( not ( = ?auto_432745 ?auto_432753 ) ) ( not ( = ?auto_432745 ?auto_432754 ) ) ( not ( = ?auto_432745 ?auto_432755 ) ) ( not ( = ?auto_432745 ?auto_432756 ) ) ( not ( = ?auto_432745 ?auto_432757 ) ) ( not ( = ?auto_432745 ?auto_432758 ) ) ( not ( = ?auto_432746 ?auto_432747 ) ) ( not ( = ?auto_432746 ?auto_432748 ) ) ( not ( = ?auto_432746 ?auto_432749 ) ) ( not ( = ?auto_432746 ?auto_432750 ) ) ( not ( = ?auto_432746 ?auto_432751 ) ) ( not ( = ?auto_432746 ?auto_432752 ) ) ( not ( = ?auto_432746 ?auto_432753 ) ) ( not ( = ?auto_432746 ?auto_432754 ) ) ( not ( = ?auto_432746 ?auto_432755 ) ) ( not ( = ?auto_432746 ?auto_432756 ) ) ( not ( = ?auto_432746 ?auto_432757 ) ) ( not ( = ?auto_432746 ?auto_432758 ) ) ( not ( = ?auto_432747 ?auto_432748 ) ) ( not ( = ?auto_432747 ?auto_432749 ) ) ( not ( = ?auto_432747 ?auto_432750 ) ) ( not ( = ?auto_432747 ?auto_432751 ) ) ( not ( = ?auto_432747 ?auto_432752 ) ) ( not ( = ?auto_432747 ?auto_432753 ) ) ( not ( = ?auto_432747 ?auto_432754 ) ) ( not ( = ?auto_432747 ?auto_432755 ) ) ( not ( = ?auto_432747 ?auto_432756 ) ) ( not ( = ?auto_432747 ?auto_432757 ) ) ( not ( = ?auto_432747 ?auto_432758 ) ) ( not ( = ?auto_432748 ?auto_432749 ) ) ( not ( = ?auto_432748 ?auto_432750 ) ) ( not ( = ?auto_432748 ?auto_432751 ) ) ( not ( = ?auto_432748 ?auto_432752 ) ) ( not ( = ?auto_432748 ?auto_432753 ) ) ( not ( = ?auto_432748 ?auto_432754 ) ) ( not ( = ?auto_432748 ?auto_432755 ) ) ( not ( = ?auto_432748 ?auto_432756 ) ) ( not ( = ?auto_432748 ?auto_432757 ) ) ( not ( = ?auto_432748 ?auto_432758 ) ) ( not ( = ?auto_432749 ?auto_432750 ) ) ( not ( = ?auto_432749 ?auto_432751 ) ) ( not ( = ?auto_432749 ?auto_432752 ) ) ( not ( = ?auto_432749 ?auto_432753 ) ) ( not ( = ?auto_432749 ?auto_432754 ) ) ( not ( = ?auto_432749 ?auto_432755 ) ) ( not ( = ?auto_432749 ?auto_432756 ) ) ( not ( = ?auto_432749 ?auto_432757 ) ) ( not ( = ?auto_432749 ?auto_432758 ) ) ( not ( = ?auto_432750 ?auto_432751 ) ) ( not ( = ?auto_432750 ?auto_432752 ) ) ( not ( = ?auto_432750 ?auto_432753 ) ) ( not ( = ?auto_432750 ?auto_432754 ) ) ( not ( = ?auto_432750 ?auto_432755 ) ) ( not ( = ?auto_432750 ?auto_432756 ) ) ( not ( = ?auto_432750 ?auto_432757 ) ) ( not ( = ?auto_432750 ?auto_432758 ) ) ( not ( = ?auto_432751 ?auto_432752 ) ) ( not ( = ?auto_432751 ?auto_432753 ) ) ( not ( = ?auto_432751 ?auto_432754 ) ) ( not ( = ?auto_432751 ?auto_432755 ) ) ( not ( = ?auto_432751 ?auto_432756 ) ) ( not ( = ?auto_432751 ?auto_432757 ) ) ( not ( = ?auto_432751 ?auto_432758 ) ) ( not ( = ?auto_432752 ?auto_432753 ) ) ( not ( = ?auto_432752 ?auto_432754 ) ) ( not ( = ?auto_432752 ?auto_432755 ) ) ( not ( = ?auto_432752 ?auto_432756 ) ) ( not ( = ?auto_432752 ?auto_432757 ) ) ( not ( = ?auto_432752 ?auto_432758 ) ) ( not ( = ?auto_432753 ?auto_432754 ) ) ( not ( = ?auto_432753 ?auto_432755 ) ) ( not ( = ?auto_432753 ?auto_432756 ) ) ( not ( = ?auto_432753 ?auto_432757 ) ) ( not ( = ?auto_432753 ?auto_432758 ) ) ( not ( = ?auto_432754 ?auto_432755 ) ) ( not ( = ?auto_432754 ?auto_432756 ) ) ( not ( = ?auto_432754 ?auto_432757 ) ) ( not ( = ?auto_432754 ?auto_432758 ) ) ( not ( = ?auto_432755 ?auto_432756 ) ) ( not ( = ?auto_432755 ?auto_432757 ) ) ( not ( = ?auto_432755 ?auto_432758 ) ) ( not ( = ?auto_432756 ?auto_432757 ) ) ( not ( = ?auto_432756 ?auto_432758 ) ) ( not ( = ?auto_432757 ?auto_432758 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_432758 )
      ( !STACK ?auto_432758 ?auto_432757 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432774 - BLOCK
      ?auto_432775 - BLOCK
      ?auto_432776 - BLOCK
      ?auto_432777 - BLOCK
      ?auto_432778 - BLOCK
      ?auto_432779 - BLOCK
      ?auto_432780 - BLOCK
      ?auto_432781 - BLOCK
      ?auto_432782 - BLOCK
      ?auto_432783 - BLOCK
      ?auto_432784 - BLOCK
      ?auto_432785 - BLOCK
      ?auto_432786 - BLOCK
      ?auto_432787 - BLOCK
      ?auto_432788 - BLOCK
    )
    :vars
    (
      ?auto_432789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432788 ?auto_432789 ) ( ON-TABLE ?auto_432774 ) ( ON ?auto_432775 ?auto_432774 ) ( ON ?auto_432776 ?auto_432775 ) ( ON ?auto_432777 ?auto_432776 ) ( ON ?auto_432778 ?auto_432777 ) ( ON ?auto_432779 ?auto_432778 ) ( ON ?auto_432780 ?auto_432779 ) ( ON ?auto_432781 ?auto_432780 ) ( ON ?auto_432782 ?auto_432781 ) ( ON ?auto_432783 ?auto_432782 ) ( ON ?auto_432784 ?auto_432783 ) ( ON ?auto_432785 ?auto_432784 ) ( ON ?auto_432786 ?auto_432785 ) ( not ( = ?auto_432774 ?auto_432775 ) ) ( not ( = ?auto_432774 ?auto_432776 ) ) ( not ( = ?auto_432774 ?auto_432777 ) ) ( not ( = ?auto_432774 ?auto_432778 ) ) ( not ( = ?auto_432774 ?auto_432779 ) ) ( not ( = ?auto_432774 ?auto_432780 ) ) ( not ( = ?auto_432774 ?auto_432781 ) ) ( not ( = ?auto_432774 ?auto_432782 ) ) ( not ( = ?auto_432774 ?auto_432783 ) ) ( not ( = ?auto_432774 ?auto_432784 ) ) ( not ( = ?auto_432774 ?auto_432785 ) ) ( not ( = ?auto_432774 ?auto_432786 ) ) ( not ( = ?auto_432774 ?auto_432787 ) ) ( not ( = ?auto_432774 ?auto_432788 ) ) ( not ( = ?auto_432774 ?auto_432789 ) ) ( not ( = ?auto_432775 ?auto_432776 ) ) ( not ( = ?auto_432775 ?auto_432777 ) ) ( not ( = ?auto_432775 ?auto_432778 ) ) ( not ( = ?auto_432775 ?auto_432779 ) ) ( not ( = ?auto_432775 ?auto_432780 ) ) ( not ( = ?auto_432775 ?auto_432781 ) ) ( not ( = ?auto_432775 ?auto_432782 ) ) ( not ( = ?auto_432775 ?auto_432783 ) ) ( not ( = ?auto_432775 ?auto_432784 ) ) ( not ( = ?auto_432775 ?auto_432785 ) ) ( not ( = ?auto_432775 ?auto_432786 ) ) ( not ( = ?auto_432775 ?auto_432787 ) ) ( not ( = ?auto_432775 ?auto_432788 ) ) ( not ( = ?auto_432775 ?auto_432789 ) ) ( not ( = ?auto_432776 ?auto_432777 ) ) ( not ( = ?auto_432776 ?auto_432778 ) ) ( not ( = ?auto_432776 ?auto_432779 ) ) ( not ( = ?auto_432776 ?auto_432780 ) ) ( not ( = ?auto_432776 ?auto_432781 ) ) ( not ( = ?auto_432776 ?auto_432782 ) ) ( not ( = ?auto_432776 ?auto_432783 ) ) ( not ( = ?auto_432776 ?auto_432784 ) ) ( not ( = ?auto_432776 ?auto_432785 ) ) ( not ( = ?auto_432776 ?auto_432786 ) ) ( not ( = ?auto_432776 ?auto_432787 ) ) ( not ( = ?auto_432776 ?auto_432788 ) ) ( not ( = ?auto_432776 ?auto_432789 ) ) ( not ( = ?auto_432777 ?auto_432778 ) ) ( not ( = ?auto_432777 ?auto_432779 ) ) ( not ( = ?auto_432777 ?auto_432780 ) ) ( not ( = ?auto_432777 ?auto_432781 ) ) ( not ( = ?auto_432777 ?auto_432782 ) ) ( not ( = ?auto_432777 ?auto_432783 ) ) ( not ( = ?auto_432777 ?auto_432784 ) ) ( not ( = ?auto_432777 ?auto_432785 ) ) ( not ( = ?auto_432777 ?auto_432786 ) ) ( not ( = ?auto_432777 ?auto_432787 ) ) ( not ( = ?auto_432777 ?auto_432788 ) ) ( not ( = ?auto_432777 ?auto_432789 ) ) ( not ( = ?auto_432778 ?auto_432779 ) ) ( not ( = ?auto_432778 ?auto_432780 ) ) ( not ( = ?auto_432778 ?auto_432781 ) ) ( not ( = ?auto_432778 ?auto_432782 ) ) ( not ( = ?auto_432778 ?auto_432783 ) ) ( not ( = ?auto_432778 ?auto_432784 ) ) ( not ( = ?auto_432778 ?auto_432785 ) ) ( not ( = ?auto_432778 ?auto_432786 ) ) ( not ( = ?auto_432778 ?auto_432787 ) ) ( not ( = ?auto_432778 ?auto_432788 ) ) ( not ( = ?auto_432778 ?auto_432789 ) ) ( not ( = ?auto_432779 ?auto_432780 ) ) ( not ( = ?auto_432779 ?auto_432781 ) ) ( not ( = ?auto_432779 ?auto_432782 ) ) ( not ( = ?auto_432779 ?auto_432783 ) ) ( not ( = ?auto_432779 ?auto_432784 ) ) ( not ( = ?auto_432779 ?auto_432785 ) ) ( not ( = ?auto_432779 ?auto_432786 ) ) ( not ( = ?auto_432779 ?auto_432787 ) ) ( not ( = ?auto_432779 ?auto_432788 ) ) ( not ( = ?auto_432779 ?auto_432789 ) ) ( not ( = ?auto_432780 ?auto_432781 ) ) ( not ( = ?auto_432780 ?auto_432782 ) ) ( not ( = ?auto_432780 ?auto_432783 ) ) ( not ( = ?auto_432780 ?auto_432784 ) ) ( not ( = ?auto_432780 ?auto_432785 ) ) ( not ( = ?auto_432780 ?auto_432786 ) ) ( not ( = ?auto_432780 ?auto_432787 ) ) ( not ( = ?auto_432780 ?auto_432788 ) ) ( not ( = ?auto_432780 ?auto_432789 ) ) ( not ( = ?auto_432781 ?auto_432782 ) ) ( not ( = ?auto_432781 ?auto_432783 ) ) ( not ( = ?auto_432781 ?auto_432784 ) ) ( not ( = ?auto_432781 ?auto_432785 ) ) ( not ( = ?auto_432781 ?auto_432786 ) ) ( not ( = ?auto_432781 ?auto_432787 ) ) ( not ( = ?auto_432781 ?auto_432788 ) ) ( not ( = ?auto_432781 ?auto_432789 ) ) ( not ( = ?auto_432782 ?auto_432783 ) ) ( not ( = ?auto_432782 ?auto_432784 ) ) ( not ( = ?auto_432782 ?auto_432785 ) ) ( not ( = ?auto_432782 ?auto_432786 ) ) ( not ( = ?auto_432782 ?auto_432787 ) ) ( not ( = ?auto_432782 ?auto_432788 ) ) ( not ( = ?auto_432782 ?auto_432789 ) ) ( not ( = ?auto_432783 ?auto_432784 ) ) ( not ( = ?auto_432783 ?auto_432785 ) ) ( not ( = ?auto_432783 ?auto_432786 ) ) ( not ( = ?auto_432783 ?auto_432787 ) ) ( not ( = ?auto_432783 ?auto_432788 ) ) ( not ( = ?auto_432783 ?auto_432789 ) ) ( not ( = ?auto_432784 ?auto_432785 ) ) ( not ( = ?auto_432784 ?auto_432786 ) ) ( not ( = ?auto_432784 ?auto_432787 ) ) ( not ( = ?auto_432784 ?auto_432788 ) ) ( not ( = ?auto_432784 ?auto_432789 ) ) ( not ( = ?auto_432785 ?auto_432786 ) ) ( not ( = ?auto_432785 ?auto_432787 ) ) ( not ( = ?auto_432785 ?auto_432788 ) ) ( not ( = ?auto_432785 ?auto_432789 ) ) ( not ( = ?auto_432786 ?auto_432787 ) ) ( not ( = ?auto_432786 ?auto_432788 ) ) ( not ( = ?auto_432786 ?auto_432789 ) ) ( not ( = ?auto_432787 ?auto_432788 ) ) ( not ( = ?auto_432787 ?auto_432789 ) ) ( not ( = ?auto_432788 ?auto_432789 ) ) ( CLEAR ?auto_432786 ) ( ON ?auto_432787 ?auto_432788 ) ( CLEAR ?auto_432787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_432774 ?auto_432775 ?auto_432776 ?auto_432777 ?auto_432778 ?auto_432779 ?auto_432780 ?auto_432781 ?auto_432782 ?auto_432783 ?auto_432784 ?auto_432785 ?auto_432786 ?auto_432787 )
      ( MAKE-15PILE ?auto_432774 ?auto_432775 ?auto_432776 ?auto_432777 ?auto_432778 ?auto_432779 ?auto_432780 ?auto_432781 ?auto_432782 ?auto_432783 ?auto_432784 ?auto_432785 ?auto_432786 ?auto_432787 ?auto_432788 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432805 - BLOCK
      ?auto_432806 - BLOCK
      ?auto_432807 - BLOCK
      ?auto_432808 - BLOCK
      ?auto_432809 - BLOCK
      ?auto_432810 - BLOCK
      ?auto_432811 - BLOCK
      ?auto_432812 - BLOCK
      ?auto_432813 - BLOCK
      ?auto_432814 - BLOCK
      ?auto_432815 - BLOCK
      ?auto_432816 - BLOCK
      ?auto_432817 - BLOCK
      ?auto_432818 - BLOCK
      ?auto_432819 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_432819 ) ( ON-TABLE ?auto_432805 ) ( ON ?auto_432806 ?auto_432805 ) ( ON ?auto_432807 ?auto_432806 ) ( ON ?auto_432808 ?auto_432807 ) ( ON ?auto_432809 ?auto_432808 ) ( ON ?auto_432810 ?auto_432809 ) ( ON ?auto_432811 ?auto_432810 ) ( ON ?auto_432812 ?auto_432811 ) ( ON ?auto_432813 ?auto_432812 ) ( ON ?auto_432814 ?auto_432813 ) ( ON ?auto_432815 ?auto_432814 ) ( ON ?auto_432816 ?auto_432815 ) ( ON ?auto_432817 ?auto_432816 ) ( not ( = ?auto_432805 ?auto_432806 ) ) ( not ( = ?auto_432805 ?auto_432807 ) ) ( not ( = ?auto_432805 ?auto_432808 ) ) ( not ( = ?auto_432805 ?auto_432809 ) ) ( not ( = ?auto_432805 ?auto_432810 ) ) ( not ( = ?auto_432805 ?auto_432811 ) ) ( not ( = ?auto_432805 ?auto_432812 ) ) ( not ( = ?auto_432805 ?auto_432813 ) ) ( not ( = ?auto_432805 ?auto_432814 ) ) ( not ( = ?auto_432805 ?auto_432815 ) ) ( not ( = ?auto_432805 ?auto_432816 ) ) ( not ( = ?auto_432805 ?auto_432817 ) ) ( not ( = ?auto_432805 ?auto_432818 ) ) ( not ( = ?auto_432805 ?auto_432819 ) ) ( not ( = ?auto_432806 ?auto_432807 ) ) ( not ( = ?auto_432806 ?auto_432808 ) ) ( not ( = ?auto_432806 ?auto_432809 ) ) ( not ( = ?auto_432806 ?auto_432810 ) ) ( not ( = ?auto_432806 ?auto_432811 ) ) ( not ( = ?auto_432806 ?auto_432812 ) ) ( not ( = ?auto_432806 ?auto_432813 ) ) ( not ( = ?auto_432806 ?auto_432814 ) ) ( not ( = ?auto_432806 ?auto_432815 ) ) ( not ( = ?auto_432806 ?auto_432816 ) ) ( not ( = ?auto_432806 ?auto_432817 ) ) ( not ( = ?auto_432806 ?auto_432818 ) ) ( not ( = ?auto_432806 ?auto_432819 ) ) ( not ( = ?auto_432807 ?auto_432808 ) ) ( not ( = ?auto_432807 ?auto_432809 ) ) ( not ( = ?auto_432807 ?auto_432810 ) ) ( not ( = ?auto_432807 ?auto_432811 ) ) ( not ( = ?auto_432807 ?auto_432812 ) ) ( not ( = ?auto_432807 ?auto_432813 ) ) ( not ( = ?auto_432807 ?auto_432814 ) ) ( not ( = ?auto_432807 ?auto_432815 ) ) ( not ( = ?auto_432807 ?auto_432816 ) ) ( not ( = ?auto_432807 ?auto_432817 ) ) ( not ( = ?auto_432807 ?auto_432818 ) ) ( not ( = ?auto_432807 ?auto_432819 ) ) ( not ( = ?auto_432808 ?auto_432809 ) ) ( not ( = ?auto_432808 ?auto_432810 ) ) ( not ( = ?auto_432808 ?auto_432811 ) ) ( not ( = ?auto_432808 ?auto_432812 ) ) ( not ( = ?auto_432808 ?auto_432813 ) ) ( not ( = ?auto_432808 ?auto_432814 ) ) ( not ( = ?auto_432808 ?auto_432815 ) ) ( not ( = ?auto_432808 ?auto_432816 ) ) ( not ( = ?auto_432808 ?auto_432817 ) ) ( not ( = ?auto_432808 ?auto_432818 ) ) ( not ( = ?auto_432808 ?auto_432819 ) ) ( not ( = ?auto_432809 ?auto_432810 ) ) ( not ( = ?auto_432809 ?auto_432811 ) ) ( not ( = ?auto_432809 ?auto_432812 ) ) ( not ( = ?auto_432809 ?auto_432813 ) ) ( not ( = ?auto_432809 ?auto_432814 ) ) ( not ( = ?auto_432809 ?auto_432815 ) ) ( not ( = ?auto_432809 ?auto_432816 ) ) ( not ( = ?auto_432809 ?auto_432817 ) ) ( not ( = ?auto_432809 ?auto_432818 ) ) ( not ( = ?auto_432809 ?auto_432819 ) ) ( not ( = ?auto_432810 ?auto_432811 ) ) ( not ( = ?auto_432810 ?auto_432812 ) ) ( not ( = ?auto_432810 ?auto_432813 ) ) ( not ( = ?auto_432810 ?auto_432814 ) ) ( not ( = ?auto_432810 ?auto_432815 ) ) ( not ( = ?auto_432810 ?auto_432816 ) ) ( not ( = ?auto_432810 ?auto_432817 ) ) ( not ( = ?auto_432810 ?auto_432818 ) ) ( not ( = ?auto_432810 ?auto_432819 ) ) ( not ( = ?auto_432811 ?auto_432812 ) ) ( not ( = ?auto_432811 ?auto_432813 ) ) ( not ( = ?auto_432811 ?auto_432814 ) ) ( not ( = ?auto_432811 ?auto_432815 ) ) ( not ( = ?auto_432811 ?auto_432816 ) ) ( not ( = ?auto_432811 ?auto_432817 ) ) ( not ( = ?auto_432811 ?auto_432818 ) ) ( not ( = ?auto_432811 ?auto_432819 ) ) ( not ( = ?auto_432812 ?auto_432813 ) ) ( not ( = ?auto_432812 ?auto_432814 ) ) ( not ( = ?auto_432812 ?auto_432815 ) ) ( not ( = ?auto_432812 ?auto_432816 ) ) ( not ( = ?auto_432812 ?auto_432817 ) ) ( not ( = ?auto_432812 ?auto_432818 ) ) ( not ( = ?auto_432812 ?auto_432819 ) ) ( not ( = ?auto_432813 ?auto_432814 ) ) ( not ( = ?auto_432813 ?auto_432815 ) ) ( not ( = ?auto_432813 ?auto_432816 ) ) ( not ( = ?auto_432813 ?auto_432817 ) ) ( not ( = ?auto_432813 ?auto_432818 ) ) ( not ( = ?auto_432813 ?auto_432819 ) ) ( not ( = ?auto_432814 ?auto_432815 ) ) ( not ( = ?auto_432814 ?auto_432816 ) ) ( not ( = ?auto_432814 ?auto_432817 ) ) ( not ( = ?auto_432814 ?auto_432818 ) ) ( not ( = ?auto_432814 ?auto_432819 ) ) ( not ( = ?auto_432815 ?auto_432816 ) ) ( not ( = ?auto_432815 ?auto_432817 ) ) ( not ( = ?auto_432815 ?auto_432818 ) ) ( not ( = ?auto_432815 ?auto_432819 ) ) ( not ( = ?auto_432816 ?auto_432817 ) ) ( not ( = ?auto_432816 ?auto_432818 ) ) ( not ( = ?auto_432816 ?auto_432819 ) ) ( not ( = ?auto_432817 ?auto_432818 ) ) ( not ( = ?auto_432817 ?auto_432819 ) ) ( not ( = ?auto_432818 ?auto_432819 ) ) ( CLEAR ?auto_432817 ) ( ON ?auto_432818 ?auto_432819 ) ( CLEAR ?auto_432818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_432805 ?auto_432806 ?auto_432807 ?auto_432808 ?auto_432809 ?auto_432810 ?auto_432811 ?auto_432812 ?auto_432813 ?auto_432814 ?auto_432815 ?auto_432816 ?auto_432817 ?auto_432818 )
      ( MAKE-15PILE ?auto_432805 ?auto_432806 ?auto_432807 ?auto_432808 ?auto_432809 ?auto_432810 ?auto_432811 ?auto_432812 ?auto_432813 ?auto_432814 ?auto_432815 ?auto_432816 ?auto_432817 ?auto_432818 ?auto_432819 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432835 - BLOCK
      ?auto_432836 - BLOCK
      ?auto_432837 - BLOCK
      ?auto_432838 - BLOCK
      ?auto_432839 - BLOCK
      ?auto_432840 - BLOCK
      ?auto_432841 - BLOCK
      ?auto_432842 - BLOCK
      ?auto_432843 - BLOCK
      ?auto_432844 - BLOCK
      ?auto_432845 - BLOCK
      ?auto_432846 - BLOCK
      ?auto_432847 - BLOCK
      ?auto_432848 - BLOCK
      ?auto_432849 - BLOCK
    )
    :vars
    (
      ?auto_432850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432849 ?auto_432850 ) ( ON-TABLE ?auto_432835 ) ( ON ?auto_432836 ?auto_432835 ) ( ON ?auto_432837 ?auto_432836 ) ( ON ?auto_432838 ?auto_432837 ) ( ON ?auto_432839 ?auto_432838 ) ( ON ?auto_432840 ?auto_432839 ) ( ON ?auto_432841 ?auto_432840 ) ( ON ?auto_432842 ?auto_432841 ) ( ON ?auto_432843 ?auto_432842 ) ( ON ?auto_432844 ?auto_432843 ) ( ON ?auto_432845 ?auto_432844 ) ( ON ?auto_432846 ?auto_432845 ) ( not ( = ?auto_432835 ?auto_432836 ) ) ( not ( = ?auto_432835 ?auto_432837 ) ) ( not ( = ?auto_432835 ?auto_432838 ) ) ( not ( = ?auto_432835 ?auto_432839 ) ) ( not ( = ?auto_432835 ?auto_432840 ) ) ( not ( = ?auto_432835 ?auto_432841 ) ) ( not ( = ?auto_432835 ?auto_432842 ) ) ( not ( = ?auto_432835 ?auto_432843 ) ) ( not ( = ?auto_432835 ?auto_432844 ) ) ( not ( = ?auto_432835 ?auto_432845 ) ) ( not ( = ?auto_432835 ?auto_432846 ) ) ( not ( = ?auto_432835 ?auto_432847 ) ) ( not ( = ?auto_432835 ?auto_432848 ) ) ( not ( = ?auto_432835 ?auto_432849 ) ) ( not ( = ?auto_432835 ?auto_432850 ) ) ( not ( = ?auto_432836 ?auto_432837 ) ) ( not ( = ?auto_432836 ?auto_432838 ) ) ( not ( = ?auto_432836 ?auto_432839 ) ) ( not ( = ?auto_432836 ?auto_432840 ) ) ( not ( = ?auto_432836 ?auto_432841 ) ) ( not ( = ?auto_432836 ?auto_432842 ) ) ( not ( = ?auto_432836 ?auto_432843 ) ) ( not ( = ?auto_432836 ?auto_432844 ) ) ( not ( = ?auto_432836 ?auto_432845 ) ) ( not ( = ?auto_432836 ?auto_432846 ) ) ( not ( = ?auto_432836 ?auto_432847 ) ) ( not ( = ?auto_432836 ?auto_432848 ) ) ( not ( = ?auto_432836 ?auto_432849 ) ) ( not ( = ?auto_432836 ?auto_432850 ) ) ( not ( = ?auto_432837 ?auto_432838 ) ) ( not ( = ?auto_432837 ?auto_432839 ) ) ( not ( = ?auto_432837 ?auto_432840 ) ) ( not ( = ?auto_432837 ?auto_432841 ) ) ( not ( = ?auto_432837 ?auto_432842 ) ) ( not ( = ?auto_432837 ?auto_432843 ) ) ( not ( = ?auto_432837 ?auto_432844 ) ) ( not ( = ?auto_432837 ?auto_432845 ) ) ( not ( = ?auto_432837 ?auto_432846 ) ) ( not ( = ?auto_432837 ?auto_432847 ) ) ( not ( = ?auto_432837 ?auto_432848 ) ) ( not ( = ?auto_432837 ?auto_432849 ) ) ( not ( = ?auto_432837 ?auto_432850 ) ) ( not ( = ?auto_432838 ?auto_432839 ) ) ( not ( = ?auto_432838 ?auto_432840 ) ) ( not ( = ?auto_432838 ?auto_432841 ) ) ( not ( = ?auto_432838 ?auto_432842 ) ) ( not ( = ?auto_432838 ?auto_432843 ) ) ( not ( = ?auto_432838 ?auto_432844 ) ) ( not ( = ?auto_432838 ?auto_432845 ) ) ( not ( = ?auto_432838 ?auto_432846 ) ) ( not ( = ?auto_432838 ?auto_432847 ) ) ( not ( = ?auto_432838 ?auto_432848 ) ) ( not ( = ?auto_432838 ?auto_432849 ) ) ( not ( = ?auto_432838 ?auto_432850 ) ) ( not ( = ?auto_432839 ?auto_432840 ) ) ( not ( = ?auto_432839 ?auto_432841 ) ) ( not ( = ?auto_432839 ?auto_432842 ) ) ( not ( = ?auto_432839 ?auto_432843 ) ) ( not ( = ?auto_432839 ?auto_432844 ) ) ( not ( = ?auto_432839 ?auto_432845 ) ) ( not ( = ?auto_432839 ?auto_432846 ) ) ( not ( = ?auto_432839 ?auto_432847 ) ) ( not ( = ?auto_432839 ?auto_432848 ) ) ( not ( = ?auto_432839 ?auto_432849 ) ) ( not ( = ?auto_432839 ?auto_432850 ) ) ( not ( = ?auto_432840 ?auto_432841 ) ) ( not ( = ?auto_432840 ?auto_432842 ) ) ( not ( = ?auto_432840 ?auto_432843 ) ) ( not ( = ?auto_432840 ?auto_432844 ) ) ( not ( = ?auto_432840 ?auto_432845 ) ) ( not ( = ?auto_432840 ?auto_432846 ) ) ( not ( = ?auto_432840 ?auto_432847 ) ) ( not ( = ?auto_432840 ?auto_432848 ) ) ( not ( = ?auto_432840 ?auto_432849 ) ) ( not ( = ?auto_432840 ?auto_432850 ) ) ( not ( = ?auto_432841 ?auto_432842 ) ) ( not ( = ?auto_432841 ?auto_432843 ) ) ( not ( = ?auto_432841 ?auto_432844 ) ) ( not ( = ?auto_432841 ?auto_432845 ) ) ( not ( = ?auto_432841 ?auto_432846 ) ) ( not ( = ?auto_432841 ?auto_432847 ) ) ( not ( = ?auto_432841 ?auto_432848 ) ) ( not ( = ?auto_432841 ?auto_432849 ) ) ( not ( = ?auto_432841 ?auto_432850 ) ) ( not ( = ?auto_432842 ?auto_432843 ) ) ( not ( = ?auto_432842 ?auto_432844 ) ) ( not ( = ?auto_432842 ?auto_432845 ) ) ( not ( = ?auto_432842 ?auto_432846 ) ) ( not ( = ?auto_432842 ?auto_432847 ) ) ( not ( = ?auto_432842 ?auto_432848 ) ) ( not ( = ?auto_432842 ?auto_432849 ) ) ( not ( = ?auto_432842 ?auto_432850 ) ) ( not ( = ?auto_432843 ?auto_432844 ) ) ( not ( = ?auto_432843 ?auto_432845 ) ) ( not ( = ?auto_432843 ?auto_432846 ) ) ( not ( = ?auto_432843 ?auto_432847 ) ) ( not ( = ?auto_432843 ?auto_432848 ) ) ( not ( = ?auto_432843 ?auto_432849 ) ) ( not ( = ?auto_432843 ?auto_432850 ) ) ( not ( = ?auto_432844 ?auto_432845 ) ) ( not ( = ?auto_432844 ?auto_432846 ) ) ( not ( = ?auto_432844 ?auto_432847 ) ) ( not ( = ?auto_432844 ?auto_432848 ) ) ( not ( = ?auto_432844 ?auto_432849 ) ) ( not ( = ?auto_432844 ?auto_432850 ) ) ( not ( = ?auto_432845 ?auto_432846 ) ) ( not ( = ?auto_432845 ?auto_432847 ) ) ( not ( = ?auto_432845 ?auto_432848 ) ) ( not ( = ?auto_432845 ?auto_432849 ) ) ( not ( = ?auto_432845 ?auto_432850 ) ) ( not ( = ?auto_432846 ?auto_432847 ) ) ( not ( = ?auto_432846 ?auto_432848 ) ) ( not ( = ?auto_432846 ?auto_432849 ) ) ( not ( = ?auto_432846 ?auto_432850 ) ) ( not ( = ?auto_432847 ?auto_432848 ) ) ( not ( = ?auto_432847 ?auto_432849 ) ) ( not ( = ?auto_432847 ?auto_432850 ) ) ( not ( = ?auto_432848 ?auto_432849 ) ) ( not ( = ?auto_432848 ?auto_432850 ) ) ( not ( = ?auto_432849 ?auto_432850 ) ) ( ON ?auto_432848 ?auto_432849 ) ( CLEAR ?auto_432846 ) ( ON ?auto_432847 ?auto_432848 ) ( CLEAR ?auto_432847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_432835 ?auto_432836 ?auto_432837 ?auto_432838 ?auto_432839 ?auto_432840 ?auto_432841 ?auto_432842 ?auto_432843 ?auto_432844 ?auto_432845 ?auto_432846 ?auto_432847 )
      ( MAKE-15PILE ?auto_432835 ?auto_432836 ?auto_432837 ?auto_432838 ?auto_432839 ?auto_432840 ?auto_432841 ?auto_432842 ?auto_432843 ?auto_432844 ?auto_432845 ?auto_432846 ?auto_432847 ?auto_432848 ?auto_432849 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432866 - BLOCK
      ?auto_432867 - BLOCK
      ?auto_432868 - BLOCK
      ?auto_432869 - BLOCK
      ?auto_432870 - BLOCK
      ?auto_432871 - BLOCK
      ?auto_432872 - BLOCK
      ?auto_432873 - BLOCK
      ?auto_432874 - BLOCK
      ?auto_432875 - BLOCK
      ?auto_432876 - BLOCK
      ?auto_432877 - BLOCK
      ?auto_432878 - BLOCK
      ?auto_432879 - BLOCK
      ?auto_432880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_432880 ) ( ON-TABLE ?auto_432866 ) ( ON ?auto_432867 ?auto_432866 ) ( ON ?auto_432868 ?auto_432867 ) ( ON ?auto_432869 ?auto_432868 ) ( ON ?auto_432870 ?auto_432869 ) ( ON ?auto_432871 ?auto_432870 ) ( ON ?auto_432872 ?auto_432871 ) ( ON ?auto_432873 ?auto_432872 ) ( ON ?auto_432874 ?auto_432873 ) ( ON ?auto_432875 ?auto_432874 ) ( ON ?auto_432876 ?auto_432875 ) ( ON ?auto_432877 ?auto_432876 ) ( not ( = ?auto_432866 ?auto_432867 ) ) ( not ( = ?auto_432866 ?auto_432868 ) ) ( not ( = ?auto_432866 ?auto_432869 ) ) ( not ( = ?auto_432866 ?auto_432870 ) ) ( not ( = ?auto_432866 ?auto_432871 ) ) ( not ( = ?auto_432866 ?auto_432872 ) ) ( not ( = ?auto_432866 ?auto_432873 ) ) ( not ( = ?auto_432866 ?auto_432874 ) ) ( not ( = ?auto_432866 ?auto_432875 ) ) ( not ( = ?auto_432866 ?auto_432876 ) ) ( not ( = ?auto_432866 ?auto_432877 ) ) ( not ( = ?auto_432866 ?auto_432878 ) ) ( not ( = ?auto_432866 ?auto_432879 ) ) ( not ( = ?auto_432866 ?auto_432880 ) ) ( not ( = ?auto_432867 ?auto_432868 ) ) ( not ( = ?auto_432867 ?auto_432869 ) ) ( not ( = ?auto_432867 ?auto_432870 ) ) ( not ( = ?auto_432867 ?auto_432871 ) ) ( not ( = ?auto_432867 ?auto_432872 ) ) ( not ( = ?auto_432867 ?auto_432873 ) ) ( not ( = ?auto_432867 ?auto_432874 ) ) ( not ( = ?auto_432867 ?auto_432875 ) ) ( not ( = ?auto_432867 ?auto_432876 ) ) ( not ( = ?auto_432867 ?auto_432877 ) ) ( not ( = ?auto_432867 ?auto_432878 ) ) ( not ( = ?auto_432867 ?auto_432879 ) ) ( not ( = ?auto_432867 ?auto_432880 ) ) ( not ( = ?auto_432868 ?auto_432869 ) ) ( not ( = ?auto_432868 ?auto_432870 ) ) ( not ( = ?auto_432868 ?auto_432871 ) ) ( not ( = ?auto_432868 ?auto_432872 ) ) ( not ( = ?auto_432868 ?auto_432873 ) ) ( not ( = ?auto_432868 ?auto_432874 ) ) ( not ( = ?auto_432868 ?auto_432875 ) ) ( not ( = ?auto_432868 ?auto_432876 ) ) ( not ( = ?auto_432868 ?auto_432877 ) ) ( not ( = ?auto_432868 ?auto_432878 ) ) ( not ( = ?auto_432868 ?auto_432879 ) ) ( not ( = ?auto_432868 ?auto_432880 ) ) ( not ( = ?auto_432869 ?auto_432870 ) ) ( not ( = ?auto_432869 ?auto_432871 ) ) ( not ( = ?auto_432869 ?auto_432872 ) ) ( not ( = ?auto_432869 ?auto_432873 ) ) ( not ( = ?auto_432869 ?auto_432874 ) ) ( not ( = ?auto_432869 ?auto_432875 ) ) ( not ( = ?auto_432869 ?auto_432876 ) ) ( not ( = ?auto_432869 ?auto_432877 ) ) ( not ( = ?auto_432869 ?auto_432878 ) ) ( not ( = ?auto_432869 ?auto_432879 ) ) ( not ( = ?auto_432869 ?auto_432880 ) ) ( not ( = ?auto_432870 ?auto_432871 ) ) ( not ( = ?auto_432870 ?auto_432872 ) ) ( not ( = ?auto_432870 ?auto_432873 ) ) ( not ( = ?auto_432870 ?auto_432874 ) ) ( not ( = ?auto_432870 ?auto_432875 ) ) ( not ( = ?auto_432870 ?auto_432876 ) ) ( not ( = ?auto_432870 ?auto_432877 ) ) ( not ( = ?auto_432870 ?auto_432878 ) ) ( not ( = ?auto_432870 ?auto_432879 ) ) ( not ( = ?auto_432870 ?auto_432880 ) ) ( not ( = ?auto_432871 ?auto_432872 ) ) ( not ( = ?auto_432871 ?auto_432873 ) ) ( not ( = ?auto_432871 ?auto_432874 ) ) ( not ( = ?auto_432871 ?auto_432875 ) ) ( not ( = ?auto_432871 ?auto_432876 ) ) ( not ( = ?auto_432871 ?auto_432877 ) ) ( not ( = ?auto_432871 ?auto_432878 ) ) ( not ( = ?auto_432871 ?auto_432879 ) ) ( not ( = ?auto_432871 ?auto_432880 ) ) ( not ( = ?auto_432872 ?auto_432873 ) ) ( not ( = ?auto_432872 ?auto_432874 ) ) ( not ( = ?auto_432872 ?auto_432875 ) ) ( not ( = ?auto_432872 ?auto_432876 ) ) ( not ( = ?auto_432872 ?auto_432877 ) ) ( not ( = ?auto_432872 ?auto_432878 ) ) ( not ( = ?auto_432872 ?auto_432879 ) ) ( not ( = ?auto_432872 ?auto_432880 ) ) ( not ( = ?auto_432873 ?auto_432874 ) ) ( not ( = ?auto_432873 ?auto_432875 ) ) ( not ( = ?auto_432873 ?auto_432876 ) ) ( not ( = ?auto_432873 ?auto_432877 ) ) ( not ( = ?auto_432873 ?auto_432878 ) ) ( not ( = ?auto_432873 ?auto_432879 ) ) ( not ( = ?auto_432873 ?auto_432880 ) ) ( not ( = ?auto_432874 ?auto_432875 ) ) ( not ( = ?auto_432874 ?auto_432876 ) ) ( not ( = ?auto_432874 ?auto_432877 ) ) ( not ( = ?auto_432874 ?auto_432878 ) ) ( not ( = ?auto_432874 ?auto_432879 ) ) ( not ( = ?auto_432874 ?auto_432880 ) ) ( not ( = ?auto_432875 ?auto_432876 ) ) ( not ( = ?auto_432875 ?auto_432877 ) ) ( not ( = ?auto_432875 ?auto_432878 ) ) ( not ( = ?auto_432875 ?auto_432879 ) ) ( not ( = ?auto_432875 ?auto_432880 ) ) ( not ( = ?auto_432876 ?auto_432877 ) ) ( not ( = ?auto_432876 ?auto_432878 ) ) ( not ( = ?auto_432876 ?auto_432879 ) ) ( not ( = ?auto_432876 ?auto_432880 ) ) ( not ( = ?auto_432877 ?auto_432878 ) ) ( not ( = ?auto_432877 ?auto_432879 ) ) ( not ( = ?auto_432877 ?auto_432880 ) ) ( not ( = ?auto_432878 ?auto_432879 ) ) ( not ( = ?auto_432878 ?auto_432880 ) ) ( not ( = ?auto_432879 ?auto_432880 ) ) ( ON ?auto_432879 ?auto_432880 ) ( CLEAR ?auto_432877 ) ( ON ?auto_432878 ?auto_432879 ) ( CLEAR ?auto_432878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_432866 ?auto_432867 ?auto_432868 ?auto_432869 ?auto_432870 ?auto_432871 ?auto_432872 ?auto_432873 ?auto_432874 ?auto_432875 ?auto_432876 ?auto_432877 ?auto_432878 )
      ( MAKE-15PILE ?auto_432866 ?auto_432867 ?auto_432868 ?auto_432869 ?auto_432870 ?auto_432871 ?auto_432872 ?auto_432873 ?auto_432874 ?auto_432875 ?auto_432876 ?auto_432877 ?auto_432878 ?auto_432879 ?auto_432880 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432896 - BLOCK
      ?auto_432897 - BLOCK
      ?auto_432898 - BLOCK
      ?auto_432899 - BLOCK
      ?auto_432900 - BLOCK
      ?auto_432901 - BLOCK
      ?auto_432902 - BLOCK
      ?auto_432903 - BLOCK
      ?auto_432904 - BLOCK
      ?auto_432905 - BLOCK
      ?auto_432906 - BLOCK
      ?auto_432907 - BLOCK
      ?auto_432908 - BLOCK
      ?auto_432909 - BLOCK
      ?auto_432910 - BLOCK
    )
    :vars
    (
      ?auto_432911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432910 ?auto_432911 ) ( ON-TABLE ?auto_432896 ) ( ON ?auto_432897 ?auto_432896 ) ( ON ?auto_432898 ?auto_432897 ) ( ON ?auto_432899 ?auto_432898 ) ( ON ?auto_432900 ?auto_432899 ) ( ON ?auto_432901 ?auto_432900 ) ( ON ?auto_432902 ?auto_432901 ) ( ON ?auto_432903 ?auto_432902 ) ( ON ?auto_432904 ?auto_432903 ) ( ON ?auto_432905 ?auto_432904 ) ( ON ?auto_432906 ?auto_432905 ) ( not ( = ?auto_432896 ?auto_432897 ) ) ( not ( = ?auto_432896 ?auto_432898 ) ) ( not ( = ?auto_432896 ?auto_432899 ) ) ( not ( = ?auto_432896 ?auto_432900 ) ) ( not ( = ?auto_432896 ?auto_432901 ) ) ( not ( = ?auto_432896 ?auto_432902 ) ) ( not ( = ?auto_432896 ?auto_432903 ) ) ( not ( = ?auto_432896 ?auto_432904 ) ) ( not ( = ?auto_432896 ?auto_432905 ) ) ( not ( = ?auto_432896 ?auto_432906 ) ) ( not ( = ?auto_432896 ?auto_432907 ) ) ( not ( = ?auto_432896 ?auto_432908 ) ) ( not ( = ?auto_432896 ?auto_432909 ) ) ( not ( = ?auto_432896 ?auto_432910 ) ) ( not ( = ?auto_432896 ?auto_432911 ) ) ( not ( = ?auto_432897 ?auto_432898 ) ) ( not ( = ?auto_432897 ?auto_432899 ) ) ( not ( = ?auto_432897 ?auto_432900 ) ) ( not ( = ?auto_432897 ?auto_432901 ) ) ( not ( = ?auto_432897 ?auto_432902 ) ) ( not ( = ?auto_432897 ?auto_432903 ) ) ( not ( = ?auto_432897 ?auto_432904 ) ) ( not ( = ?auto_432897 ?auto_432905 ) ) ( not ( = ?auto_432897 ?auto_432906 ) ) ( not ( = ?auto_432897 ?auto_432907 ) ) ( not ( = ?auto_432897 ?auto_432908 ) ) ( not ( = ?auto_432897 ?auto_432909 ) ) ( not ( = ?auto_432897 ?auto_432910 ) ) ( not ( = ?auto_432897 ?auto_432911 ) ) ( not ( = ?auto_432898 ?auto_432899 ) ) ( not ( = ?auto_432898 ?auto_432900 ) ) ( not ( = ?auto_432898 ?auto_432901 ) ) ( not ( = ?auto_432898 ?auto_432902 ) ) ( not ( = ?auto_432898 ?auto_432903 ) ) ( not ( = ?auto_432898 ?auto_432904 ) ) ( not ( = ?auto_432898 ?auto_432905 ) ) ( not ( = ?auto_432898 ?auto_432906 ) ) ( not ( = ?auto_432898 ?auto_432907 ) ) ( not ( = ?auto_432898 ?auto_432908 ) ) ( not ( = ?auto_432898 ?auto_432909 ) ) ( not ( = ?auto_432898 ?auto_432910 ) ) ( not ( = ?auto_432898 ?auto_432911 ) ) ( not ( = ?auto_432899 ?auto_432900 ) ) ( not ( = ?auto_432899 ?auto_432901 ) ) ( not ( = ?auto_432899 ?auto_432902 ) ) ( not ( = ?auto_432899 ?auto_432903 ) ) ( not ( = ?auto_432899 ?auto_432904 ) ) ( not ( = ?auto_432899 ?auto_432905 ) ) ( not ( = ?auto_432899 ?auto_432906 ) ) ( not ( = ?auto_432899 ?auto_432907 ) ) ( not ( = ?auto_432899 ?auto_432908 ) ) ( not ( = ?auto_432899 ?auto_432909 ) ) ( not ( = ?auto_432899 ?auto_432910 ) ) ( not ( = ?auto_432899 ?auto_432911 ) ) ( not ( = ?auto_432900 ?auto_432901 ) ) ( not ( = ?auto_432900 ?auto_432902 ) ) ( not ( = ?auto_432900 ?auto_432903 ) ) ( not ( = ?auto_432900 ?auto_432904 ) ) ( not ( = ?auto_432900 ?auto_432905 ) ) ( not ( = ?auto_432900 ?auto_432906 ) ) ( not ( = ?auto_432900 ?auto_432907 ) ) ( not ( = ?auto_432900 ?auto_432908 ) ) ( not ( = ?auto_432900 ?auto_432909 ) ) ( not ( = ?auto_432900 ?auto_432910 ) ) ( not ( = ?auto_432900 ?auto_432911 ) ) ( not ( = ?auto_432901 ?auto_432902 ) ) ( not ( = ?auto_432901 ?auto_432903 ) ) ( not ( = ?auto_432901 ?auto_432904 ) ) ( not ( = ?auto_432901 ?auto_432905 ) ) ( not ( = ?auto_432901 ?auto_432906 ) ) ( not ( = ?auto_432901 ?auto_432907 ) ) ( not ( = ?auto_432901 ?auto_432908 ) ) ( not ( = ?auto_432901 ?auto_432909 ) ) ( not ( = ?auto_432901 ?auto_432910 ) ) ( not ( = ?auto_432901 ?auto_432911 ) ) ( not ( = ?auto_432902 ?auto_432903 ) ) ( not ( = ?auto_432902 ?auto_432904 ) ) ( not ( = ?auto_432902 ?auto_432905 ) ) ( not ( = ?auto_432902 ?auto_432906 ) ) ( not ( = ?auto_432902 ?auto_432907 ) ) ( not ( = ?auto_432902 ?auto_432908 ) ) ( not ( = ?auto_432902 ?auto_432909 ) ) ( not ( = ?auto_432902 ?auto_432910 ) ) ( not ( = ?auto_432902 ?auto_432911 ) ) ( not ( = ?auto_432903 ?auto_432904 ) ) ( not ( = ?auto_432903 ?auto_432905 ) ) ( not ( = ?auto_432903 ?auto_432906 ) ) ( not ( = ?auto_432903 ?auto_432907 ) ) ( not ( = ?auto_432903 ?auto_432908 ) ) ( not ( = ?auto_432903 ?auto_432909 ) ) ( not ( = ?auto_432903 ?auto_432910 ) ) ( not ( = ?auto_432903 ?auto_432911 ) ) ( not ( = ?auto_432904 ?auto_432905 ) ) ( not ( = ?auto_432904 ?auto_432906 ) ) ( not ( = ?auto_432904 ?auto_432907 ) ) ( not ( = ?auto_432904 ?auto_432908 ) ) ( not ( = ?auto_432904 ?auto_432909 ) ) ( not ( = ?auto_432904 ?auto_432910 ) ) ( not ( = ?auto_432904 ?auto_432911 ) ) ( not ( = ?auto_432905 ?auto_432906 ) ) ( not ( = ?auto_432905 ?auto_432907 ) ) ( not ( = ?auto_432905 ?auto_432908 ) ) ( not ( = ?auto_432905 ?auto_432909 ) ) ( not ( = ?auto_432905 ?auto_432910 ) ) ( not ( = ?auto_432905 ?auto_432911 ) ) ( not ( = ?auto_432906 ?auto_432907 ) ) ( not ( = ?auto_432906 ?auto_432908 ) ) ( not ( = ?auto_432906 ?auto_432909 ) ) ( not ( = ?auto_432906 ?auto_432910 ) ) ( not ( = ?auto_432906 ?auto_432911 ) ) ( not ( = ?auto_432907 ?auto_432908 ) ) ( not ( = ?auto_432907 ?auto_432909 ) ) ( not ( = ?auto_432907 ?auto_432910 ) ) ( not ( = ?auto_432907 ?auto_432911 ) ) ( not ( = ?auto_432908 ?auto_432909 ) ) ( not ( = ?auto_432908 ?auto_432910 ) ) ( not ( = ?auto_432908 ?auto_432911 ) ) ( not ( = ?auto_432909 ?auto_432910 ) ) ( not ( = ?auto_432909 ?auto_432911 ) ) ( not ( = ?auto_432910 ?auto_432911 ) ) ( ON ?auto_432909 ?auto_432910 ) ( ON ?auto_432908 ?auto_432909 ) ( CLEAR ?auto_432906 ) ( ON ?auto_432907 ?auto_432908 ) ( CLEAR ?auto_432907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_432896 ?auto_432897 ?auto_432898 ?auto_432899 ?auto_432900 ?auto_432901 ?auto_432902 ?auto_432903 ?auto_432904 ?auto_432905 ?auto_432906 ?auto_432907 )
      ( MAKE-15PILE ?auto_432896 ?auto_432897 ?auto_432898 ?auto_432899 ?auto_432900 ?auto_432901 ?auto_432902 ?auto_432903 ?auto_432904 ?auto_432905 ?auto_432906 ?auto_432907 ?auto_432908 ?auto_432909 ?auto_432910 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432927 - BLOCK
      ?auto_432928 - BLOCK
      ?auto_432929 - BLOCK
      ?auto_432930 - BLOCK
      ?auto_432931 - BLOCK
      ?auto_432932 - BLOCK
      ?auto_432933 - BLOCK
      ?auto_432934 - BLOCK
      ?auto_432935 - BLOCK
      ?auto_432936 - BLOCK
      ?auto_432937 - BLOCK
      ?auto_432938 - BLOCK
      ?auto_432939 - BLOCK
      ?auto_432940 - BLOCK
      ?auto_432941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_432941 ) ( ON-TABLE ?auto_432927 ) ( ON ?auto_432928 ?auto_432927 ) ( ON ?auto_432929 ?auto_432928 ) ( ON ?auto_432930 ?auto_432929 ) ( ON ?auto_432931 ?auto_432930 ) ( ON ?auto_432932 ?auto_432931 ) ( ON ?auto_432933 ?auto_432932 ) ( ON ?auto_432934 ?auto_432933 ) ( ON ?auto_432935 ?auto_432934 ) ( ON ?auto_432936 ?auto_432935 ) ( ON ?auto_432937 ?auto_432936 ) ( not ( = ?auto_432927 ?auto_432928 ) ) ( not ( = ?auto_432927 ?auto_432929 ) ) ( not ( = ?auto_432927 ?auto_432930 ) ) ( not ( = ?auto_432927 ?auto_432931 ) ) ( not ( = ?auto_432927 ?auto_432932 ) ) ( not ( = ?auto_432927 ?auto_432933 ) ) ( not ( = ?auto_432927 ?auto_432934 ) ) ( not ( = ?auto_432927 ?auto_432935 ) ) ( not ( = ?auto_432927 ?auto_432936 ) ) ( not ( = ?auto_432927 ?auto_432937 ) ) ( not ( = ?auto_432927 ?auto_432938 ) ) ( not ( = ?auto_432927 ?auto_432939 ) ) ( not ( = ?auto_432927 ?auto_432940 ) ) ( not ( = ?auto_432927 ?auto_432941 ) ) ( not ( = ?auto_432928 ?auto_432929 ) ) ( not ( = ?auto_432928 ?auto_432930 ) ) ( not ( = ?auto_432928 ?auto_432931 ) ) ( not ( = ?auto_432928 ?auto_432932 ) ) ( not ( = ?auto_432928 ?auto_432933 ) ) ( not ( = ?auto_432928 ?auto_432934 ) ) ( not ( = ?auto_432928 ?auto_432935 ) ) ( not ( = ?auto_432928 ?auto_432936 ) ) ( not ( = ?auto_432928 ?auto_432937 ) ) ( not ( = ?auto_432928 ?auto_432938 ) ) ( not ( = ?auto_432928 ?auto_432939 ) ) ( not ( = ?auto_432928 ?auto_432940 ) ) ( not ( = ?auto_432928 ?auto_432941 ) ) ( not ( = ?auto_432929 ?auto_432930 ) ) ( not ( = ?auto_432929 ?auto_432931 ) ) ( not ( = ?auto_432929 ?auto_432932 ) ) ( not ( = ?auto_432929 ?auto_432933 ) ) ( not ( = ?auto_432929 ?auto_432934 ) ) ( not ( = ?auto_432929 ?auto_432935 ) ) ( not ( = ?auto_432929 ?auto_432936 ) ) ( not ( = ?auto_432929 ?auto_432937 ) ) ( not ( = ?auto_432929 ?auto_432938 ) ) ( not ( = ?auto_432929 ?auto_432939 ) ) ( not ( = ?auto_432929 ?auto_432940 ) ) ( not ( = ?auto_432929 ?auto_432941 ) ) ( not ( = ?auto_432930 ?auto_432931 ) ) ( not ( = ?auto_432930 ?auto_432932 ) ) ( not ( = ?auto_432930 ?auto_432933 ) ) ( not ( = ?auto_432930 ?auto_432934 ) ) ( not ( = ?auto_432930 ?auto_432935 ) ) ( not ( = ?auto_432930 ?auto_432936 ) ) ( not ( = ?auto_432930 ?auto_432937 ) ) ( not ( = ?auto_432930 ?auto_432938 ) ) ( not ( = ?auto_432930 ?auto_432939 ) ) ( not ( = ?auto_432930 ?auto_432940 ) ) ( not ( = ?auto_432930 ?auto_432941 ) ) ( not ( = ?auto_432931 ?auto_432932 ) ) ( not ( = ?auto_432931 ?auto_432933 ) ) ( not ( = ?auto_432931 ?auto_432934 ) ) ( not ( = ?auto_432931 ?auto_432935 ) ) ( not ( = ?auto_432931 ?auto_432936 ) ) ( not ( = ?auto_432931 ?auto_432937 ) ) ( not ( = ?auto_432931 ?auto_432938 ) ) ( not ( = ?auto_432931 ?auto_432939 ) ) ( not ( = ?auto_432931 ?auto_432940 ) ) ( not ( = ?auto_432931 ?auto_432941 ) ) ( not ( = ?auto_432932 ?auto_432933 ) ) ( not ( = ?auto_432932 ?auto_432934 ) ) ( not ( = ?auto_432932 ?auto_432935 ) ) ( not ( = ?auto_432932 ?auto_432936 ) ) ( not ( = ?auto_432932 ?auto_432937 ) ) ( not ( = ?auto_432932 ?auto_432938 ) ) ( not ( = ?auto_432932 ?auto_432939 ) ) ( not ( = ?auto_432932 ?auto_432940 ) ) ( not ( = ?auto_432932 ?auto_432941 ) ) ( not ( = ?auto_432933 ?auto_432934 ) ) ( not ( = ?auto_432933 ?auto_432935 ) ) ( not ( = ?auto_432933 ?auto_432936 ) ) ( not ( = ?auto_432933 ?auto_432937 ) ) ( not ( = ?auto_432933 ?auto_432938 ) ) ( not ( = ?auto_432933 ?auto_432939 ) ) ( not ( = ?auto_432933 ?auto_432940 ) ) ( not ( = ?auto_432933 ?auto_432941 ) ) ( not ( = ?auto_432934 ?auto_432935 ) ) ( not ( = ?auto_432934 ?auto_432936 ) ) ( not ( = ?auto_432934 ?auto_432937 ) ) ( not ( = ?auto_432934 ?auto_432938 ) ) ( not ( = ?auto_432934 ?auto_432939 ) ) ( not ( = ?auto_432934 ?auto_432940 ) ) ( not ( = ?auto_432934 ?auto_432941 ) ) ( not ( = ?auto_432935 ?auto_432936 ) ) ( not ( = ?auto_432935 ?auto_432937 ) ) ( not ( = ?auto_432935 ?auto_432938 ) ) ( not ( = ?auto_432935 ?auto_432939 ) ) ( not ( = ?auto_432935 ?auto_432940 ) ) ( not ( = ?auto_432935 ?auto_432941 ) ) ( not ( = ?auto_432936 ?auto_432937 ) ) ( not ( = ?auto_432936 ?auto_432938 ) ) ( not ( = ?auto_432936 ?auto_432939 ) ) ( not ( = ?auto_432936 ?auto_432940 ) ) ( not ( = ?auto_432936 ?auto_432941 ) ) ( not ( = ?auto_432937 ?auto_432938 ) ) ( not ( = ?auto_432937 ?auto_432939 ) ) ( not ( = ?auto_432937 ?auto_432940 ) ) ( not ( = ?auto_432937 ?auto_432941 ) ) ( not ( = ?auto_432938 ?auto_432939 ) ) ( not ( = ?auto_432938 ?auto_432940 ) ) ( not ( = ?auto_432938 ?auto_432941 ) ) ( not ( = ?auto_432939 ?auto_432940 ) ) ( not ( = ?auto_432939 ?auto_432941 ) ) ( not ( = ?auto_432940 ?auto_432941 ) ) ( ON ?auto_432940 ?auto_432941 ) ( ON ?auto_432939 ?auto_432940 ) ( CLEAR ?auto_432937 ) ( ON ?auto_432938 ?auto_432939 ) ( CLEAR ?auto_432938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_432927 ?auto_432928 ?auto_432929 ?auto_432930 ?auto_432931 ?auto_432932 ?auto_432933 ?auto_432934 ?auto_432935 ?auto_432936 ?auto_432937 ?auto_432938 )
      ( MAKE-15PILE ?auto_432927 ?auto_432928 ?auto_432929 ?auto_432930 ?auto_432931 ?auto_432932 ?auto_432933 ?auto_432934 ?auto_432935 ?auto_432936 ?auto_432937 ?auto_432938 ?auto_432939 ?auto_432940 ?auto_432941 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432957 - BLOCK
      ?auto_432958 - BLOCK
      ?auto_432959 - BLOCK
      ?auto_432960 - BLOCK
      ?auto_432961 - BLOCK
      ?auto_432962 - BLOCK
      ?auto_432963 - BLOCK
      ?auto_432964 - BLOCK
      ?auto_432965 - BLOCK
      ?auto_432966 - BLOCK
      ?auto_432967 - BLOCK
      ?auto_432968 - BLOCK
      ?auto_432969 - BLOCK
      ?auto_432970 - BLOCK
      ?auto_432971 - BLOCK
    )
    :vars
    (
      ?auto_432972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_432971 ?auto_432972 ) ( ON-TABLE ?auto_432957 ) ( ON ?auto_432958 ?auto_432957 ) ( ON ?auto_432959 ?auto_432958 ) ( ON ?auto_432960 ?auto_432959 ) ( ON ?auto_432961 ?auto_432960 ) ( ON ?auto_432962 ?auto_432961 ) ( ON ?auto_432963 ?auto_432962 ) ( ON ?auto_432964 ?auto_432963 ) ( ON ?auto_432965 ?auto_432964 ) ( ON ?auto_432966 ?auto_432965 ) ( not ( = ?auto_432957 ?auto_432958 ) ) ( not ( = ?auto_432957 ?auto_432959 ) ) ( not ( = ?auto_432957 ?auto_432960 ) ) ( not ( = ?auto_432957 ?auto_432961 ) ) ( not ( = ?auto_432957 ?auto_432962 ) ) ( not ( = ?auto_432957 ?auto_432963 ) ) ( not ( = ?auto_432957 ?auto_432964 ) ) ( not ( = ?auto_432957 ?auto_432965 ) ) ( not ( = ?auto_432957 ?auto_432966 ) ) ( not ( = ?auto_432957 ?auto_432967 ) ) ( not ( = ?auto_432957 ?auto_432968 ) ) ( not ( = ?auto_432957 ?auto_432969 ) ) ( not ( = ?auto_432957 ?auto_432970 ) ) ( not ( = ?auto_432957 ?auto_432971 ) ) ( not ( = ?auto_432957 ?auto_432972 ) ) ( not ( = ?auto_432958 ?auto_432959 ) ) ( not ( = ?auto_432958 ?auto_432960 ) ) ( not ( = ?auto_432958 ?auto_432961 ) ) ( not ( = ?auto_432958 ?auto_432962 ) ) ( not ( = ?auto_432958 ?auto_432963 ) ) ( not ( = ?auto_432958 ?auto_432964 ) ) ( not ( = ?auto_432958 ?auto_432965 ) ) ( not ( = ?auto_432958 ?auto_432966 ) ) ( not ( = ?auto_432958 ?auto_432967 ) ) ( not ( = ?auto_432958 ?auto_432968 ) ) ( not ( = ?auto_432958 ?auto_432969 ) ) ( not ( = ?auto_432958 ?auto_432970 ) ) ( not ( = ?auto_432958 ?auto_432971 ) ) ( not ( = ?auto_432958 ?auto_432972 ) ) ( not ( = ?auto_432959 ?auto_432960 ) ) ( not ( = ?auto_432959 ?auto_432961 ) ) ( not ( = ?auto_432959 ?auto_432962 ) ) ( not ( = ?auto_432959 ?auto_432963 ) ) ( not ( = ?auto_432959 ?auto_432964 ) ) ( not ( = ?auto_432959 ?auto_432965 ) ) ( not ( = ?auto_432959 ?auto_432966 ) ) ( not ( = ?auto_432959 ?auto_432967 ) ) ( not ( = ?auto_432959 ?auto_432968 ) ) ( not ( = ?auto_432959 ?auto_432969 ) ) ( not ( = ?auto_432959 ?auto_432970 ) ) ( not ( = ?auto_432959 ?auto_432971 ) ) ( not ( = ?auto_432959 ?auto_432972 ) ) ( not ( = ?auto_432960 ?auto_432961 ) ) ( not ( = ?auto_432960 ?auto_432962 ) ) ( not ( = ?auto_432960 ?auto_432963 ) ) ( not ( = ?auto_432960 ?auto_432964 ) ) ( not ( = ?auto_432960 ?auto_432965 ) ) ( not ( = ?auto_432960 ?auto_432966 ) ) ( not ( = ?auto_432960 ?auto_432967 ) ) ( not ( = ?auto_432960 ?auto_432968 ) ) ( not ( = ?auto_432960 ?auto_432969 ) ) ( not ( = ?auto_432960 ?auto_432970 ) ) ( not ( = ?auto_432960 ?auto_432971 ) ) ( not ( = ?auto_432960 ?auto_432972 ) ) ( not ( = ?auto_432961 ?auto_432962 ) ) ( not ( = ?auto_432961 ?auto_432963 ) ) ( not ( = ?auto_432961 ?auto_432964 ) ) ( not ( = ?auto_432961 ?auto_432965 ) ) ( not ( = ?auto_432961 ?auto_432966 ) ) ( not ( = ?auto_432961 ?auto_432967 ) ) ( not ( = ?auto_432961 ?auto_432968 ) ) ( not ( = ?auto_432961 ?auto_432969 ) ) ( not ( = ?auto_432961 ?auto_432970 ) ) ( not ( = ?auto_432961 ?auto_432971 ) ) ( not ( = ?auto_432961 ?auto_432972 ) ) ( not ( = ?auto_432962 ?auto_432963 ) ) ( not ( = ?auto_432962 ?auto_432964 ) ) ( not ( = ?auto_432962 ?auto_432965 ) ) ( not ( = ?auto_432962 ?auto_432966 ) ) ( not ( = ?auto_432962 ?auto_432967 ) ) ( not ( = ?auto_432962 ?auto_432968 ) ) ( not ( = ?auto_432962 ?auto_432969 ) ) ( not ( = ?auto_432962 ?auto_432970 ) ) ( not ( = ?auto_432962 ?auto_432971 ) ) ( not ( = ?auto_432962 ?auto_432972 ) ) ( not ( = ?auto_432963 ?auto_432964 ) ) ( not ( = ?auto_432963 ?auto_432965 ) ) ( not ( = ?auto_432963 ?auto_432966 ) ) ( not ( = ?auto_432963 ?auto_432967 ) ) ( not ( = ?auto_432963 ?auto_432968 ) ) ( not ( = ?auto_432963 ?auto_432969 ) ) ( not ( = ?auto_432963 ?auto_432970 ) ) ( not ( = ?auto_432963 ?auto_432971 ) ) ( not ( = ?auto_432963 ?auto_432972 ) ) ( not ( = ?auto_432964 ?auto_432965 ) ) ( not ( = ?auto_432964 ?auto_432966 ) ) ( not ( = ?auto_432964 ?auto_432967 ) ) ( not ( = ?auto_432964 ?auto_432968 ) ) ( not ( = ?auto_432964 ?auto_432969 ) ) ( not ( = ?auto_432964 ?auto_432970 ) ) ( not ( = ?auto_432964 ?auto_432971 ) ) ( not ( = ?auto_432964 ?auto_432972 ) ) ( not ( = ?auto_432965 ?auto_432966 ) ) ( not ( = ?auto_432965 ?auto_432967 ) ) ( not ( = ?auto_432965 ?auto_432968 ) ) ( not ( = ?auto_432965 ?auto_432969 ) ) ( not ( = ?auto_432965 ?auto_432970 ) ) ( not ( = ?auto_432965 ?auto_432971 ) ) ( not ( = ?auto_432965 ?auto_432972 ) ) ( not ( = ?auto_432966 ?auto_432967 ) ) ( not ( = ?auto_432966 ?auto_432968 ) ) ( not ( = ?auto_432966 ?auto_432969 ) ) ( not ( = ?auto_432966 ?auto_432970 ) ) ( not ( = ?auto_432966 ?auto_432971 ) ) ( not ( = ?auto_432966 ?auto_432972 ) ) ( not ( = ?auto_432967 ?auto_432968 ) ) ( not ( = ?auto_432967 ?auto_432969 ) ) ( not ( = ?auto_432967 ?auto_432970 ) ) ( not ( = ?auto_432967 ?auto_432971 ) ) ( not ( = ?auto_432967 ?auto_432972 ) ) ( not ( = ?auto_432968 ?auto_432969 ) ) ( not ( = ?auto_432968 ?auto_432970 ) ) ( not ( = ?auto_432968 ?auto_432971 ) ) ( not ( = ?auto_432968 ?auto_432972 ) ) ( not ( = ?auto_432969 ?auto_432970 ) ) ( not ( = ?auto_432969 ?auto_432971 ) ) ( not ( = ?auto_432969 ?auto_432972 ) ) ( not ( = ?auto_432970 ?auto_432971 ) ) ( not ( = ?auto_432970 ?auto_432972 ) ) ( not ( = ?auto_432971 ?auto_432972 ) ) ( ON ?auto_432970 ?auto_432971 ) ( ON ?auto_432969 ?auto_432970 ) ( ON ?auto_432968 ?auto_432969 ) ( CLEAR ?auto_432966 ) ( ON ?auto_432967 ?auto_432968 ) ( CLEAR ?auto_432967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_432957 ?auto_432958 ?auto_432959 ?auto_432960 ?auto_432961 ?auto_432962 ?auto_432963 ?auto_432964 ?auto_432965 ?auto_432966 ?auto_432967 )
      ( MAKE-15PILE ?auto_432957 ?auto_432958 ?auto_432959 ?auto_432960 ?auto_432961 ?auto_432962 ?auto_432963 ?auto_432964 ?auto_432965 ?auto_432966 ?auto_432967 ?auto_432968 ?auto_432969 ?auto_432970 ?auto_432971 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_432988 - BLOCK
      ?auto_432989 - BLOCK
      ?auto_432990 - BLOCK
      ?auto_432991 - BLOCK
      ?auto_432992 - BLOCK
      ?auto_432993 - BLOCK
      ?auto_432994 - BLOCK
      ?auto_432995 - BLOCK
      ?auto_432996 - BLOCK
      ?auto_432997 - BLOCK
      ?auto_432998 - BLOCK
      ?auto_432999 - BLOCK
      ?auto_433000 - BLOCK
      ?auto_433001 - BLOCK
      ?auto_433002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433002 ) ( ON-TABLE ?auto_432988 ) ( ON ?auto_432989 ?auto_432988 ) ( ON ?auto_432990 ?auto_432989 ) ( ON ?auto_432991 ?auto_432990 ) ( ON ?auto_432992 ?auto_432991 ) ( ON ?auto_432993 ?auto_432992 ) ( ON ?auto_432994 ?auto_432993 ) ( ON ?auto_432995 ?auto_432994 ) ( ON ?auto_432996 ?auto_432995 ) ( ON ?auto_432997 ?auto_432996 ) ( not ( = ?auto_432988 ?auto_432989 ) ) ( not ( = ?auto_432988 ?auto_432990 ) ) ( not ( = ?auto_432988 ?auto_432991 ) ) ( not ( = ?auto_432988 ?auto_432992 ) ) ( not ( = ?auto_432988 ?auto_432993 ) ) ( not ( = ?auto_432988 ?auto_432994 ) ) ( not ( = ?auto_432988 ?auto_432995 ) ) ( not ( = ?auto_432988 ?auto_432996 ) ) ( not ( = ?auto_432988 ?auto_432997 ) ) ( not ( = ?auto_432988 ?auto_432998 ) ) ( not ( = ?auto_432988 ?auto_432999 ) ) ( not ( = ?auto_432988 ?auto_433000 ) ) ( not ( = ?auto_432988 ?auto_433001 ) ) ( not ( = ?auto_432988 ?auto_433002 ) ) ( not ( = ?auto_432989 ?auto_432990 ) ) ( not ( = ?auto_432989 ?auto_432991 ) ) ( not ( = ?auto_432989 ?auto_432992 ) ) ( not ( = ?auto_432989 ?auto_432993 ) ) ( not ( = ?auto_432989 ?auto_432994 ) ) ( not ( = ?auto_432989 ?auto_432995 ) ) ( not ( = ?auto_432989 ?auto_432996 ) ) ( not ( = ?auto_432989 ?auto_432997 ) ) ( not ( = ?auto_432989 ?auto_432998 ) ) ( not ( = ?auto_432989 ?auto_432999 ) ) ( not ( = ?auto_432989 ?auto_433000 ) ) ( not ( = ?auto_432989 ?auto_433001 ) ) ( not ( = ?auto_432989 ?auto_433002 ) ) ( not ( = ?auto_432990 ?auto_432991 ) ) ( not ( = ?auto_432990 ?auto_432992 ) ) ( not ( = ?auto_432990 ?auto_432993 ) ) ( not ( = ?auto_432990 ?auto_432994 ) ) ( not ( = ?auto_432990 ?auto_432995 ) ) ( not ( = ?auto_432990 ?auto_432996 ) ) ( not ( = ?auto_432990 ?auto_432997 ) ) ( not ( = ?auto_432990 ?auto_432998 ) ) ( not ( = ?auto_432990 ?auto_432999 ) ) ( not ( = ?auto_432990 ?auto_433000 ) ) ( not ( = ?auto_432990 ?auto_433001 ) ) ( not ( = ?auto_432990 ?auto_433002 ) ) ( not ( = ?auto_432991 ?auto_432992 ) ) ( not ( = ?auto_432991 ?auto_432993 ) ) ( not ( = ?auto_432991 ?auto_432994 ) ) ( not ( = ?auto_432991 ?auto_432995 ) ) ( not ( = ?auto_432991 ?auto_432996 ) ) ( not ( = ?auto_432991 ?auto_432997 ) ) ( not ( = ?auto_432991 ?auto_432998 ) ) ( not ( = ?auto_432991 ?auto_432999 ) ) ( not ( = ?auto_432991 ?auto_433000 ) ) ( not ( = ?auto_432991 ?auto_433001 ) ) ( not ( = ?auto_432991 ?auto_433002 ) ) ( not ( = ?auto_432992 ?auto_432993 ) ) ( not ( = ?auto_432992 ?auto_432994 ) ) ( not ( = ?auto_432992 ?auto_432995 ) ) ( not ( = ?auto_432992 ?auto_432996 ) ) ( not ( = ?auto_432992 ?auto_432997 ) ) ( not ( = ?auto_432992 ?auto_432998 ) ) ( not ( = ?auto_432992 ?auto_432999 ) ) ( not ( = ?auto_432992 ?auto_433000 ) ) ( not ( = ?auto_432992 ?auto_433001 ) ) ( not ( = ?auto_432992 ?auto_433002 ) ) ( not ( = ?auto_432993 ?auto_432994 ) ) ( not ( = ?auto_432993 ?auto_432995 ) ) ( not ( = ?auto_432993 ?auto_432996 ) ) ( not ( = ?auto_432993 ?auto_432997 ) ) ( not ( = ?auto_432993 ?auto_432998 ) ) ( not ( = ?auto_432993 ?auto_432999 ) ) ( not ( = ?auto_432993 ?auto_433000 ) ) ( not ( = ?auto_432993 ?auto_433001 ) ) ( not ( = ?auto_432993 ?auto_433002 ) ) ( not ( = ?auto_432994 ?auto_432995 ) ) ( not ( = ?auto_432994 ?auto_432996 ) ) ( not ( = ?auto_432994 ?auto_432997 ) ) ( not ( = ?auto_432994 ?auto_432998 ) ) ( not ( = ?auto_432994 ?auto_432999 ) ) ( not ( = ?auto_432994 ?auto_433000 ) ) ( not ( = ?auto_432994 ?auto_433001 ) ) ( not ( = ?auto_432994 ?auto_433002 ) ) ( not ( = ?auto_432995 ?auto_432996 ) ) ( not ( = ?auto_432995 ?auto_432997 ) ) ( not ( = ?auto_432995 ?auto_432998 ) ) ( not ( = ?auto_432995 ?auto_432999 ) ) ( not ( = ?auto_432995 ?auto_433000 ) ) ( not ( = ?auto_432995 ?auto_433001 ) ) ( not ( = ?auto_432995 ?auto_433002 ) ) ( not ( = ?auto_432996 ?auto_432997 ) ) ( not ( = ?auto_432996 ?auto_432998 ) ) ( not ( = ?auto_432996 ?auto_432999 ) ) ( not ( = ?auto_432996 ?auto_433000 ) ) ( not ( = ?auto_432996 ?auto_433001 ) ) ( not ( = ?auto_432996 ?auto_433002 ) ) ( not ( = ?auto_432997 ?auto_432998 ) ) ( not ( = ?auto_432997 ?auto_432999 ) ) ( not ( = ?auto_432997 ?auto_433000 ) ) ( not ( = ?auto_432997 ?auto_433001 ) ) ( not ( = ?auto_432997 ?auto_433002 ) ) ( not ( = ?auto_432998 ?auto_432999 ) ) ( not ( = ?auto_432998 ?auto_433000 ) ) ( not ( = ?auto_432998 ?auto_433001 ) ) ( not ( = ?auto_432998 ?auto_433002 ) ) ( not ( = ?auto_432999 ?auto_433000 ) ) ( not ( = ?auto_432999 ?auto_433001 ) ) ( not ( = ?auto_432999 ?auto_433002 ) ) ( not ( = ?auto_433000 ?auto_433001 ) ) ( not ( = ?auto_433000 ?auto_433002 ) ) ( not ( = ?auto_433001 ?auto_433002 ) ) ( ON ?auto_433001 ?auto_433002 ) ( ON ?auto_433000 ?auto_433001 ) ( ON ?auto_432999 ?auto_433000 ) ( CLEAR ?auto_432997 ) ( ON ?auto_432998 ?auto_432999 ) ( CLEAR ?auto_432998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_432988 ?auto_432989 ?auto_432990 ?auto_432991 ?auto_432992 ?auto_432993 ?auto_432994 ?auto_432995 ?auto_432996 ?auto_432997 ?auto_432998 )
      ( MAKE-15PILE ?auto_432988 ?auto_432989 ?auto_432990 ?auto_432991 ?auto_432992 ?auto_432993 ?auto_432994 ?auto_432995 ?auto_432996 ?auto_432997 ?auto_432998 ?auto_432999 ?auto_433000 ?auto_433001 ?auto_433002 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433018 - BLOCK
      ?auto_433019 - BLOCK
      ?auto_433020 - BLOCK
      ?auto_433021 - BLOCK
      ?auto_433022 - BLOCK
      ?auto_433023 - BLOCK
      ?auto_433024 - BLOCK
      ?auto_433025 - BLOCK
      ?auto_433026 - BLOCK
      ?auto_433027 - BLOCK
      ?auto_433028 - BLOCK
      ?auto_433029 - BLOCK
      ?auto_433030 - BLOCK
      ?auto_433031 - BLOCK
      ?auto_433032 - BLOCK
    )
    :vars
    (
      ?auto_433033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433032 ?auto_433033 ) ( ON-TABLE ?auto_433018 ) ( ON ?auto_433019 ?auto_433018 ) ( ON ?auto_433020 ?auto_433019 ) ( ON ?auto_433021 ?auto_433020 ) ( ON ?auto_433022 ?auto_433021 ) ( ON ?auto_433023 ?auto_433022 ) ( ON ?auto_433024 ?auto_433023 ) ( ON ?auto_433025 ?auto_433024 ) ( ON ?auto_433026 ?auto_433025 ) ( not ( = ?auto_433018 ?auto_433019 ) ) ( not ( = ?auto_433018 ?auto_433020 ) ) ( not ( = ?auto_433018 ?auto_433021 ) ) ( not ( = ?auto_433018 ?auto_433022 ) ) ( not ( = ?auto_433018 ?auto_433023 ) ) ( not ( = ?auto_433018 ?auto_433024 ) ) ( not ( = ?auto_433018 ?auto_433025 ) ) ( not ( = ?auto_433018 ?auto_433026 ) ) ( not ( = ?auto_433018 ?auto_433027 ) ) ( not ( = ?auto_433018 ?auto_433028 ) ) ( not ( = ?auto_433018 ?auto_433029 ) ) ( not ( = ?auto_433018 ?auto_433030 ) ) ( not ( = ?auto_433018 ?auto_433031 ) ) ( not ( = ?auto_433018 ?auto_433032 ) ) ( not ( = ?auto_433018 ?auto_433033 ) ) ( not ( = ?auto_433019 ?auto_433020 ) ) ( not ( = ?auto_433019 ?auto_433021 ) ) ( not ( = ?auto_433019 ?auto_433022 ) ) ( not ( = ?auto_433019 ?auto_433023 ) ) ( not ( = ?auto_433019 ?auto_433024 ) ) ( not ( = ?auto_433019 ?auto_433025 ) ) ( not ( = ?auto_433019 ?auto_433026 ) ) ( not ( = ?auto_433019 ?auto_433027 ) ) ( not ( = ?auto_433019 ?auto_433028 ) ) ( not ( = ?auto_433019 ?auto_433029 ) ) ( not ( = ?auto_433019 ?auto_433030 ) ) ( not ( = ?auto_433019 ?auto_433031 ) ) ( not ( = ?auto_433019 ?auto_433032 ) ) ( not ( = ?auto_433019 ?auto_433033 ) ) ( not ( = ?auto_433020 ?auto_433021 ) ) ( not ( = ?auto_433020 ?auto_433022 ) ) ( not ( = ?auto_433020 ?auto_433023 ) ) ( not ( = ?auto_433020 ?auto_433024 ) ) ( not ( = ?auto_433020 ?auto_433025 ) ) ( not ( = ?auto_433020 ?auto_433026 ) ) ( not ( = ?auto_433020 ?auto_433027 ) ) ( not ( = ?auto_433020 ?auto_433028 ) ) ( not ( = ?auto_433020 ?auto_433029 ) ) ( not ( = ?auto_433020 ?auto_433030 ) ) ( not ( = ?auto_433020 ?auto_433031 ) ) ( not ( = ?auto_433020 ?auto_433032 ) ) ( not ( = ?auto_433020 ?auto_433033 ) ) ( not ( = ?auto_433021 ?auto_433022 ) ) ( not ( = ?auto_433021 ?auto_433023 ) ) ( not ( = ?auto_433021 ?auto_433024 ) ) ( not ( = ?auto_433021 ?auto_433025 ) ) ( not ( = ?auto_433021 ?auto_433026 ) ) ( not ( = ?auto_433021 ?auto_433027 ) ) ( not ( = ?auto_433021 ?auto_433028 ) ) ( not ( = ?auto_433021 ?auto_433029 ) ) ( not ( = ?auto_433021 ?auto_433030 ) ) ( not ( = ?auto_433021 ?auto_433031 ) ) ( not ( = ?auto_433021 ?auto_433032 ) ) ( not ( = ?auto_433021 ?auto_433033 ) ) ( not ( = ?auto_433022 ?auto_433023 ) ) ( not ( = ?auto_433022 ?auto_433024 ) ) ( not ( = ?auto_433022 ?auto_433025 ) ) ( not ( = ?auto_433022 ?auto_433026 ) ) ( not ( = ?auto_433022 ?auto_433027 ) ) ( not ( = ?auto_433022 ?auto_433028 ) ) ( not ( = ?auto_433022 ?auto_433029 ) ) ( not ( = ?auto_433022 ?auto_433030 ) ) ( not ( = ?auto_433022 ?auto_433031 ) ) ( not ( = ?auto_433022 ?auto_433032 ) ) ( not ( = ?auto_433022 ?auto_433033 ) ) ( not ( = ?auto_433023 ?auto_433024 ) ) ( not ( = ?auto_433023 ?auto_433025 ) ) ( not ( = ?auto_433023 ?auto_433026 ) ) ( not ( = ?auto_433023 ?auto_433027 ) ) ( not ( = ?auto_433023 ?auto_433028 ) ) ( not ( = ?auto_433023 ?auto_433029 ) ) ( not ( = ?auto_433023 ?auto_433030 ) ) ( not ( = ?auto_433023 ?auto_433031 ) ) ( not ( = ?auto_433023 ?auto_433032 ) ) ( not ( = ?auto_433023 ?auto_433033 ) ) ( not ( = ?auto_433024 ?auto_433025 ) ) ( not ( = ?auto_433024 ?auto_433026 ) ) ( not ( = ?auto_433024 ?auto_433027 ) ) ( not ( = ?auto_433024 ?auto_433028 ) ) ( not ( = ?auto_433024 ?auto_433029 ) ) ( not ( = ?auto_433024 ?auto_433030 ) ) ( not ( = ?auto_433024 ?auto_433031 ) ) ( not ( = ?auto_433024 ?auto_433032 ) ) ( not ( = ?auto_433024 ?auto_433033 ) ) ( not ( = ?auto_433025 ?auto_433026 ) ) ( not ( = ?auto_433025 ?auto_433027 ) ) ( not ( = ?auto_433025 ?auto_433028 ) ) ( not ( = ?auto_433025 ?auto_433029 ) ) ( not ( = ?auto_433025 ?auto_433030 ) ) ( not ( = ?auto_433025 ?auto_433031 ) ) ( not ( = ?auto_433025 ?auto_433032 ) ) ( not ( = ?auto_433025 ?auto_433033 ) ) ( not ( = ?auto_433026 ?auto_433027 ) ) ( not ( = ?auto_433026 ?auto_433028 ) ) ( not ( = ?auto_433026 ?auto_433029 ) ) ( not ( = ?auto_433026 ?auto_433030 ) ) ( not ( = ?auto_433026 ?auto_433031 ) ) ( not ( = ?auto_433026 ?auto_433032 ) ) ( not ( = ?auto_433026 ?auto_433033 ) ) ( not ( = ?auto_433027 ?auto_433028 ) ) ( not ( = ?auto_433027 ?auto_433029 ) ) ( not ( = ?auto_433027 ?auto_433030 ) ) ( not ( = ?auto_433027 ?auto_433031 ) ) ( not ( = ?auto_433027 ?auto_433032 ) ) ( not ( = ?auto_433027 ?auto_433033 ) ) ( not ( = ?auto_433028 ?auto_433029 ) ) ( not ( = ?auto_433028 ?auto_433030 ) ) ( not ( = ?auto_433028 ?auto_433031 ) ) ( not ( = ?auto_433028 ?auto_433032 ) ) ( not ( = ?auto_433028 ?auto_433033 ) ) ( not ( = ?auto_433029 ?auto_433030 ) ) ( not ( = ?auto_433029 ?auto_433031 ) ) ( not ( = ?auto_433029 ?auto_433032 ) ) ( not ( = ?auto_433029 ?auto_433033 ) ) ( not ( = ?auto_433030 ?auto_433031 ) ) ( not ( = ?auto_433030 ?auto_433032 ) ) ( not ( = ?auto_433030 ?auto_433033 ) ) ( not ( = ?auto_433031 ?auto_433032 ) ) ( not ( = ?auto_433031 ?auto_433033 ) ) ( not ( = ?auto_433032 ?auto_433033 ) ) ( ON ?auto_433031 ?auto_433032 ) ( ON ?auto_433030 ?auto_433031 ) ( ON ?auto_433029 ?auto_433030 ) ( ON ?auto_433028 ?auto_433029 ) ( CLEAR ?auto_433026 ) ( ON ?auto_433027 ?auto_433028 ) ( CLEAR ?auto_433027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_433018 ?auto_433019 ?auto_433020 ?auto_433021 ?auto_433022 ?auto_433023 ?auto_433024 ?auto_433025 ?auto_433026 ?auto_433027 )
      ( MAKE-15PILE ?auto_433018 ?auto_433019 ?auto_433020 ?auto_433021 ?auto_433022 ?auto_433023 ?auto_433024 ?auto_433025 ?auto_433026 ?auto_433027 ?auto_433028 ?auto_433029 ?auto_433030 ?auto_433031 ?auto_433032 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433049 - BLOCK
      ?auto_433050 - BLOCK
      ?auto_433051 - BLOCK
      ?auto_433052 - BLOCK
      ?auto_433053 - BLOCK
      ?auto_433054 - BLOCK
      ?auto_433055 - BLOCK
      ?auto_433056 - BLOCK
      ?auto_433057 - BLOCK
      ?auto_433058 - BLOCK
      ?auto_433059 - BLOCK
      ?auto_433060 - BLOCK
      ?auto_433061 - BLOCK
      ?auto_433062 - BLOCK
      ?auto_433063 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433063 ) ( ON-TABLE ?auto_433049 ) ( ON ?auto_433050 ?auto_433049 ) ( ON ?auto_433051 ?auto_433050 ) ( ON ?auto_433052 ?auto_433051 ) ( ON ?auto_433053 ?auto_433052 ) ( ON ?auto_433054 ?auto_433053 ) ( ON ?auto_433055 ?auto_433054 ) ( ON ?auto_433056 ?auto_433055 ) ( ON ?auto_433057 ?auto_433056 ) ( not ( = ?auto_433049 ?auto_433050 ) ) ( not ( = ?auto_433049 ?auto_433051 ) ) ( not ( = ?auto_433049 ?auto_433052 ) ) ( not ( = ?auto_433049 ?auto_433053 ) ) ( not ( = ?auto_433049 ?auto_433054 ) ) ( not ( = ?auto_433049 ?auto_433055 ) ) ( not ( = ?auto_433049 ?auto_433056 ) ) ( not ( = ?auto_433049 ?auto_433057 ) ) ( not ( = ?auto_433049 ?auto_433058 ) ) ( not ( = ?auto_433049 ?auto_433059 ) ) ( not ( = ?auto_433049 ?auto_433060 ) ) ( not ( = ?auto_433049 ?auto_433061 ) ) ( not ( = ?auto_433049 ?auto_433062 ) ) ( not ( = ?auto_433049 ?auto_433063 ) ) ( not ( = ?auto_433050 ?auto_433051 ) ) ( not ( = ?auto_433050 ?auto_433052 ) ) ( not ( = ?auto_433050 ?auto_433053 ) ) ( not ( = ?auto_433050 ?auto_433054 ) ) ( not ( = ?auto_433050 ?auto_433055 ) ) ( not ( = ?auto_433050 ?auto_433056 ) ) ( not ( = ?auto_433050 ?auto_433057 ) ) ( not ( = ?auto_433050 ?auto_433058 ) ) ( not ( = ?auto_433050 ?auto_433059 ) ) ( not ( = ?auto_433050 ?auto_433060 ) ) ( not ( = ?auto_433050 ?auto_433061 ) ) ( not ( = ?auto_433050 ?auto_433062 ) ) ( not ( = ?auto_433050 ?auto_433063 ) ) ( not ( = ?auto_433051 ?auto_433052 ) ) ( not ( = ?auto_433051 ?auto_433053 ) ) ( not ( = ?auto_433051 ?auto_433054 ) ) ( not ( = ?auto_433051 ?auto_433055 ) ) ( not ( = ?auto_433051 ?auto_433056 ) ) ( not ( = ?auto_433051 ?auto_433057 ) ) ( not ( = ?auto_433051 ?auto_433058 ) ) ( not ( = ?auto_433051 ?auto_433059 ) ) ( not ( = ?auto_433051 ?auto_433060 ) ) ( not ( = ?auto_433051 ?auto_433061 ) ) ( not ( = ?auto_433051 ?auto_433062 ) ) ( not ( = ?auto_433051 ?auto_433063 ) ) ( not ( = ?auto_433052 ?auto_433053 ) ) ( not ( = ?auto_433052 ?auto_433054 ) ) ( not ( = ?auto_433052 ?auto_433055 ) ) ( not ( = ?auto_433052 ?auto_433056 ) ) ( not ( = ?auto_433052 ?auto_433057 ) ) ( not ( = ?auto_433052 ?auto_433058 ) ) ( not ( = ?auto_433052 ?auto_433059 ) ) ( not ( = ?auto_433052 ?auto_433060 ) ) ( not ( = ?auto_433052 ?auto_433061 ) ) ( not ( = ?auto_433052 ?auto_433062 ) ) ( not ( = ?auto_433052 ?auto_433063 ) ) ( not ( = ?auto_433053 ?auto_433054 ) ) ( not ( = ?auto_433053 ?auto_433055 ) ) ( not ( = ?auto_433053 ?auto_433056 ) ) ( not ( = ?auto_433053 ?auto_433057 ) ) ( not ( = ?auto_433053 ?auto_433058 ) ) ( not ( = ?auto_433053 ?auto_433059 ) ) ( not ( = ?auto_433053 ?auto_433060 ) ) ( not ( = ?auto_433053 ?auto_433061 ) ) ( not ( = ?auto_433053 ?auto_433062 ) ) ( not ( = ?auto_433053 ?auto_433063 ) ) ( not ( = ?auto_433054 ?auto_433055 ) ) ( not ( = ?auto_433054 ?auto_433056 ) ) ( not ( = ?auto_433054 ?auto_433057 ) ) ( not ( = ?auto_433054 ?auto_433058 ) ) ( not ( = ?auto_433054 ?auto_433059 ) ) ( not ( = ?auto_433054 ?auto_433060 ) ) ( not ( = ?auto_433054 ?auto_433061 ) ) ( not ( = ?auto_433054 ?auto_433062 ) ) ( not ( = ?auto_433054 ?auto_433063 ) ) ( not ( = ?auto_433055 ?auto_433056 ) ) ( not ( = ?auto_433055 ?auto_433057 ) ) ( not ( = ?auto_433055 ?auto_433058 ) ) ( not ( = ?auto_433055 ?auto_433059 ) ) ( not ( = ?auto_433055 ?auto_433060 ) ) ( not ( = ?auto_433055 ?auto_433061 ) ) ( not ( = ?auto_433055 ?auto_433062 ) ) ( not ( = ?auto_433055 ?auto_433063 ) ) ( not ( = ?auto_433056 ?auto_433057 ) ) ( not ( = ?auto_433056 ?auto_433058 ) ) ( not ( = ?auto_433056 ?auto_433059 ) ) ( not ( = ?auto_433056 ?auto_433060 ) ) ( not ( = ?auto_433056 ?auto_433061 ) ) ( not ( = ?auto_433056 ?auto_433062 ) ) ( not ( = ?auto_433056 ?auto_433063 ) ) ( not ( = ?auto_433057 ?auto_433058 ) ) ( not ( = ?auto_433057 ?auto_433059 ) ) ( not ( = ?auto_433057 ?auto_433060 ) ) ( not ( = ?auto_433057 ?auto_433061 ) ) ( not ( = ?auto_433057 ?auto_433062 ) ) ( not ( = ?auto_433057 ?auto_433063 ) ) ( not ( = ?auto_433058 ?auto_433059 ) ) ( not ( = ?auto_433058 ?auto_433060 ) ) ( not ( = ?auto_433058 ?auto_433061 ) ) ( not ( = ?auto_433058 ?auto_433062 ) ) ( not ( = ?auto_433058 ?auto_433063 ) ) ( not ( = ?auto_433059 ?auto_433060 ) ) ( not ( = ?auto_433059 ?auto_433061 ) ) ( not ( = ?auto_433059 ?auto_433062 ) ) ( not ( = ?auto_433059 ?auto_433063 ) ) ( not ( = ?auto_433060 ?auto_433061 ) ) ( not ( = ?auto_433060 ?auto_433062 ) ) ( not ( = ?auto_433060 ?auto_433063 ) ) ( not ( = ?auto_433061 ?auto_433062 ) ) ( not ( = ?auto_433061 ?auto_433063 ) ) ( not ( = ?auto_433062 ?auto_433063 ) ) ( ON ?auto_433062 ?auto_433063 ) ( ON ?auto_433061 ?auto_433062 ) ( ON ?auto_433060 ?auto_433061 ) ( ON ?auto_433059 ?auto_433060 ) ( CLEAR ?auto_433057 ) ( ON ?auto_433058 ?auto_433059 ) ( CLEAR ?auto_433058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_433049 ?auto_433050 ?auto_433051 ?auto_433052 ?auto_433053 ?auto_433054 ?auto_433055 ?auto_433056 ?auto_433057 ?auto_433058 )
      ( MAKE-15PILE ?auto_433049 ?auto_433050 ?auto_433051 ?auto_433052 ?auto_433053 ?auto_433054 ?auto_433055 ?auto_433056 ?auto_433057 ?auto_433058 ?auto_433059 ?auto_433060 ?auto_433061 ?auto_433062 ?auto_433063 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433079 - BLOCK
      ?auto_433080 - BLOCK
      ?auto_433081 - BLOCK
      ?auto_433082 - BLOCK
      ?auto_433083 - BLOCK
      ?auto_433084 - BLOCK
      ?auto_433085 - BLOCK
      ?auto_433086 - BLOCK
      ?auto_433087 - BLOCK
      ?auto_433088 - BLOCK
      ?auto_433089 - BLOCK
      ?auto_433090 - BLOCK
      ?auto_433091 - BLOCK
      ?auto_433092 - BLOCK
      ?auto_433093 - BLOCK
    )
    :vars
    (
      ?auto_433094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433093 ?auto_433094 ) ( ON-TABLE ?auto_433079 ) ( ON ?auto_433080 ?auto_433079 ) ( ON ?auto_433081 ?auto_433080 ) ( ON ?auto_433082 ?auto_433081 ) ( ON ?auto_433083 ?auto_433082 ) ( ON ?auto_433084 ?auto_433083 ) ( ON ?auto_433085 ?auto_433084 ) ( ON ?auto_433086 ?auto_433085 ) ( not ( = ?auto_433079 ?auto_433080 ) ) ( not ( = ?auto_433079 ?auto_433081 ) ) ( not ( = ?auto_433079 ?auto_433082 ) ) ( not ( = ?auto_433079 ?auto_433083 ) ) ( not ( = ?auto_433079 ?auto_433084 ) ) ( not ( = ?auto_433079 ?auto_433085 ) ) ( not ( = ?auto_433079 ?auto_433086 ) ) ( not ( = ?auto_433079 ?auto_433087 ) ) ( not ( = ?auto_433079 ?auto_433088 ) ) ( not ( = ?auto_433079 ?auto_433089 ) ) ( not ( = ?auto_433079 ?auto_433090 ) ) ( not ( = ?auto_433079 ?auto_433091 ) ) ( not ( = ?auto_433079 ?auto_433092 ) ) ( not ( = ?auto_433079 ?auto_433093 ) ) ( not ( = ?auto_433079 ?auto_433094 ) ) ( not ( = ?auto_433080 ?auto_433081 ) ) ( not ( = ?auto_433080 ?auto_433082 ) ) ( not ( = ?auto_433080 ?auto_433083 ) ) ( not ( = ?auto_433080 ?auto_433084 ) ) ( not ( = ?auto_433080 ?auto_433085 ) ) ( not ( = ?auto_433080 ?auto_433086 ) ) ( not ( = ?auto_433080 ?auto_433087 ) ) ( not ( = ?auto_433080 ?auto_433088 ) ) ( not ( = ?auto_433080 ?auto_433089 ) ) ( not ( = ?auto_433080 ?auto_433090 ) ) ( not ( = ?auto_433080 ?auto_433091 ) ) ( not ( = ?auto_433080 ?auto_433092 ) ) ( not ( = ?auto_433080 ?auto_433093 ) ) ( not ( = ?auto_433080 ?auto_433094 ) ) ( not ( = ?auto_433081 ?auto_433082 ) ) ( not ( = ?auto_433081 ?auto_433083 ) ) ( not ( = ?auto_433081 ?auto_433084 ) ) ( not ( = ?auto_433081 ?auto_433085 ) ) ( not ( = ?auto_433081 ?auto_433086 ) ) ( not ( = ?auto_433081 ?auto_433087 ) ) ( not ( = ?auto_433081 ?auto_433088 ) ) ( not ( = ?auto_433081 ?auto_433089 ) ) ( not ( = ?auto_433081 ?auto_433090 ) ) ( not ( = ?auto_433081 ?auto_433091 ) ) ( not ( = ?auto_433081 ?auto_433092 ) ) ( not ( = ?auto_433081 ?auto_433093 ) ) ( not ( = ?auto_433081 ?auto_433094 ) ) ( not ( = ?auto_433082 ?auto_433083 ) ) ( not ( = ?auto_433082 ?auto_433084 ) ) ( not ( = ?auto_433082 ?auto_433085 ) ) ( not ( = ?auto_433082 ?auto_433086 ) ) ( not ( = ?auto_433082 ?auto_433087 ) ) ( not ( = ?auto_433082 ?auto_433088 ) ) ( not ( = ?auto_433082 ?auto_433089 ) ) ( not ( = ?auto_433082 ?auto_433090 ) ) ( not ( = ?auto_433082 ?auto_433091 ) ) ( not ( = ?auto_433082 ?auto_433092 ) ) ( not ( = ?auto_433082 ?auto_433093 ) ) ( not ( = ?auto_433082 ?auto_433094 ) ) ( not ( = ?auto_433083 ?auto_433084 ) ) ( not ( = ?auto_433083 ?auto_433085 ) ) ( not ( = ?auto_433083 ?auto_433086 ) ) ( not ( = ?auto_433083 ?auto_433087 ) ) ( not ( = ?auto_433083 ?auto_433088 ) ) ( not ( = ?auto_433083 ?auto_433089 ) ) ( not ( = ?auto_433083 ?auto_433090 ) ) ( not ( = ?auto_433083 ?auto_433091 ) ) ( not ( = ?auto_433083 ?auto_433092 ) ) ( not ( = ?auto_433083 ?auto_433093 ) ) ( not ( = ?auto_433083 ?auto_433094 ) ) ( not ( = ?auto_433084 ?auto_433085 ) ) ( not ( = ?auto_433084 ?auto_433086 ) ) ( not ( = ?auto_433084 ?auto_433087 ) ) ( not ( = ?auto_433084 ?auto_433088 ) ) ( not ( = ?auto_433084 ?auto_433089 ) ) ( not ( = ?auto_433084 ?auto_433090 ) ) ( not ( = ?auto_433084 ?auto_433091 ) ) ( not ( = ?auto_433084 ?auto_433092 ) ) ( not ( = ?auto_433084 ?auto_433093 ) ) ( not ( = ?auto_433084 ?auto_433094 ) ) ( not ( = ?auto_433085 ?auto_433086 ) ) ( not ( = ?auto_433085 ?auto_433087 ) ) ( not ( = ?auto_433085 ?auto_433088 ) ) ( not ( = ?auto_433085 ?auto_433089 ) ) ( not ( = ?auto_433085 ?auto_433090 ) ) ( not ( = ?auto_433085 ?auto_433091 ) ) ( not ( = ?auto_433085 ?auto_433092 ) ) ( not ( = ?auto_433085 ?auto_433093 ) ) ( not ( = ?auto_433085 ?auto_433094 ) ) ( not ( = ?auto_433086 ?auto_433087 ) ) ( not ( = ?auto_433086 ?auto_433088 ) ) ( not ( = ?auto_433086 ?auto_433089 ) ) ( not ( = ?auto_433086 ?auto_433090 ) ) ( not ( = ?auto_433086 ?auto_433091 ) ) ( not ( = ?auto_433086 ?auto_433092 ) ) ( not ( = ?auto_433086 ?auto_433093 ) ) ( not ( = ?auto_433086 ?auto_433094 ) ) ( not ( = ?auto_433087 ?auto_433088 ) ) ( not ( = ?auto_433087 ?auto_433089 ) ) ( not ( = ?auto_433087 ?auto_433090 ) ) ( not ( = ?auto_433087 ?auto_433091 ) ) ( not ( = ?auto_433087 ?auto_433092 ) ) ( not ( = ?auto_433087 ?auto_433093 ) ) ( not ( = ?auto_433087 ?auto_433094 ) ) ( not ( = ?auto_433088 ?auto_433089 ) ) ( not ( = ?auto_433088 ?auto_433090 ) ) ( not ( = ?auto_433088 ?auto_433091 ) ) ( not ( = ?auto_433088 ?auto_433092 ) ) ( not ( = ?auto_433088 ?auto_433093 ) ) ( not ( = ?auto_433088 ?auto_433094 ) ) ( not ( = ?auto_433089 ?auto_433090 ) ) ( not ( = ?auto_433089 ?auto_433091 ) ) ( not ( = ?auto_433089 ?auto_433092 ) ) ( not ( = ?auto_433089 ?auto_433093 ) ) ( not ( = ?auto_433089 ?auto_433094 ) ) ( not ( = ?auto_433090 ?auto_433091 ) ) ( not ( = ?auto_433090 ?auto_433092 ) ) ( not ( = ?auto_433090 ?auto_433093 ) ) ( not ( = ?auto_433090 ?auto_433094 ) ) ( not ( = ?auto_433091 ?auto_433092 ) ) ( not ( = ?auto_433091 ?auto_433093 ) ) ( not ( = ?auto_433091 ?auto_433094 ) ) ( not ( = ?auto_433092 ?auto_433093 ) ) ( not ( = ?auto_433092 ?auto_433094 ) ) ( not ( = ?auto_433093 ?auto_433094 ) ) ( ON ?auto_433092 ?auto_433093 ) ( ON ?auto_433091 ?auto_433092 ) ( ON ?auto_433090 ?auto_433091 ) ( ON ?auto_433089 ?auto_433090 ) ( ON ?auto_433088 ?auto_433089 ) ( CLEAR ?auto_433086 ) ( ON ?auto_433087 ?auto_433088 ) ( CLEAR ?auto_433087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_433079 ?auto_433080 ?auto_433081 ?auto_433082 ?auto_433083 ?auto_433084 ?auto_433085 ?auto_433086 ?auto_433087 )
      ( MAKE-15PILE ?auto_433079 ?auto_433080 ?auto_433081 ?auto_433082 ?auto_433083 ?auto_433084 ?auto_433085 ?auto_433086 ?auto_433087 ?auto_433088 ?auto_433089 ?auto_433090 ?auto_433091 ?auto_433092 ?auto_433093 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433110 - BLOCK
      ?auto_433111 - BLOCK
      ?auto_433112 - BLOCK
      ?auto_433113 - BLOCK
      ?auto_433114 - BLOCK
      ?auto_433115 - BLOCK
      ?auto_433116 - BLOCK
      ?auto_433117 - BLOCK
      ?auto_433118 - BLOCK
      ?auto_433119 - BLOCK
      ?auto_433120 - BLOCK
      ?auto_433121 - BLOCK
      ?auto_433122 - BLOCK
      ?auto_433123 - BLOCK
      ?auto_433124 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433124 ) ( ON-TABLE ?auto_433110 ) ( ON ?auto_433111 ?auto_433110 ) ( ON ?auto_433112 ?auto_433111 ) ( ON ?auto_433113 ?auto_433112 ) ( ON ?auto_433114 ?auto_433113 ) ( ON ?auto_433115 ?auto_433114 ) ( ON ?auto_433116 ?auto_433115 ) ( ON ?auto_433117 ?auto_433116 ) ( not ( = ?auto_433110 ?auto_433111 ) ) ( not ( = ?auto_433110 ?auto_433112 ) ) ( not ( = ?auto_433110 ?auto_433113 ) ) ( not ( = ?auto_433110 ?auto_433114 ) ) ( not ( = ?auto_433110 ?auto_433115 ) ) ( not ( = ?auto_433110 ?auto_433116 ) ) ( not ( = ?auto_433110 ?auto_433117 ) ) ( not ( = ?auto_433110 ?auto_433118 ) ) ( not ( = ?auto_433110 ?auto_433119 ) ) ( not ( = ?auto_433110 ?auto_433120 ) ) ( not ( = ?auto_433110 ?auto_433121 ) ) ( not ( = ?auto_433110 ?auto_433122 ) ) ( not ( = ?auto_433110 ?auto_433123 ) ) ( not ( = ?auto_433110 ?auto_433124 ) ) ( not ( = ?auto_433111 ?auto_433112 ) ) ( not ( = ?auto_433111 ?auto_433113 ) ) ( not ( = ?auto_433111 ?auto_433114 ) ) ( not ( = ?auto_433111 ?auto_433115 ) ) ( not ( = ?auto_433111 ?auto_433116 ) ) ( not ( = ?auto_433111 ?auto_433117 ) ) ( not ( = ?auto_433111 ?auto_433118 ) ) ( not ( = ?auto_433111 ?auto_433119 ) ) ( not ( = ?auto_433111 ?auto_433120 ) ) ( not ( = ?auto_433111 ?auto_433121 ) ) ( not ( = ?auto_433111 ?auto_433122 ) ) ( not ( = ?auto_433111 ?auto_433123 ) ) ( not ( = ?auto_433111 ?auto_433124 ) ) ( not ( = ?auto_433112 ?auto_433113 ) ) ( not ( = ?auto_433112 ?auto_433114 ) ) ( not ( = ?auto_433112 ?auto_433115 ) ) ( not ( = ?auto_433112 ?auto_433116 ) ) ( not ( = ?auto_433112 ?auto_433117 ) ) ( not ( = ?auto_433112 ?auto_433118 ) ) ( not ( = ?auto_433112 ?auto_433119 ) ) ( not ( = ?auto_433112 ?auto_433120 ) ) ( not ( = ?auto_433112 ?auto_433121 ) ) ( not ( = ?auto_433112 ?auto_433122 ) ) ( not ( = ?auto_433112 ?auto_433123 ) ) ( not ( = ?auto_433112 ?auto_433124 ) ) ( not ( = ?auto_433113 ?auto_433114 ) ) ( not ( = ?auto_433113 ?auto_433115 ) ) ( not ( = ?auto_433113 ?auto_433116 ) ) ( not ( = ?auto_433113 ?auto_433117 ) ) ( not ( = ?auto_433113 ?auto_433118 ) ) ( not ( = ?auto_433113 ?auto_433119 ) ) ( not ( = ?auto_433113 ?auto_433120 ) ) ( not ( = ?auto_433113 ?auto_433121 ) ) ( not ( = ?auto_433113 ?auto_433122 ) ) ( not ( = ?auto_433113 ?auto_433123 ) ) ( not ( = ?auto_433113 ?auto_433124 ) ) ( not ( = ?auto_433114 ?auto_433115 ) ) ( not ( = ?auto_433114 ?auto_433116 ) ) ( not ( = ?auto_433114 ?auto_433117 ) ) ( not ( = ?auto_433114 ?auto_433118 ) ) ( not ( = ?auto_433114 ?auto_433119 ) ) ( not ( = ?auto_433114 ?auto_433120 ) ) ( not ( = ?auto_433114 ?auto_433121 ) ) ( not ( = ?auto_433114 ?auto_433122 ) ) ( not ( = ?auto_433114 ?auto_433123 ) ) ( not ( = ?auto_433114 ?auto_433124 ) ) ( not ( = ?auto_433115 ?auto_433116 ) ) ( not ( = ?auto_433115 ?auto_433117 ) ) ( not ( = ?auto_433115 ?auto_433118 ) ) ( not ( = ?auto_433115 ?auto_433119 ) ) ( not ( = ?auto_433115 ?auto_433120 ) ) ( not ( = ?auto_433115 ?auto_433121 ) ) ( not ( = ?auto_433115 ?auto_433122 ) ) ( not ( = ?auto_433115 ?auto_433123 ) ) ( not ( = ?auto_433115 ?auto_433124 ) ) ( not ( = ?auto_433116 ?auto_433117 ) ) ( not ( = ?auto_433116 ?auto_433118 ) ) ( not ( = ?auto_433116 ?auto_433119 ) ) ( not ( = ?auto_433116 ?auto_433120 ) ) ( not ( = ?auto_433116 ?auto_433121 ) ) ( not ( = ?auto_433116 ?auto_433122 ) ) ( not ( = ?auto_433116 ?auto_433123 ) ) ( not ( = ?auto_433116 ?auto_433124 ) ) ( not ( = ?auto_433117 ?auto_433118 ) ) ( not ( = ?auto_433117 ?auto_433119 ) ) ( not ( = ?auto_433117 ?auto_433120 ) ) ( not ( = ?auto_433117 ?auto_433121 ) ) ( not ( = ?auto_433117 ?auto_433122 ) ) ( not ( = ?auto_433117 ?auto_433123 ) ) ( not ( = ?auto_433117 ?auto_433124 ) ) ( not ( = ?auto_433118 ?auto_433119 ) ) ( not ( = ?auto_433118 ?auto_433120 ) ) ( not ( = ?auto_433118 ?auto_433121 ) ) ( not ( = ?auto_433118 ?auto_433122 ) ) ( not ( = ?auto_433118 ?auto_433123 ) ) ( not ( = ?auto_433118 ?auto_433124 ) ) ( not ( = ?auto_433119 ?auto_433120 ) ) ( not ( = ?auto_433119 ?auto_433121 ) ) ( not ( = ?auto_433119 ?auto_433122 ) ) ( not ( = ?auto_433119 ?auto_433123 ) ) ( not ( = ?auto_433119 ?auto_433124 ) ) ( not ( = ?auto_433120 ?auto_433121 ) ) ( not ( = ?auto_433120 ?auto_433122 ) ) ( not ( = ?auto_433120 ?auto_433123 ) ) ( not ( = ?auto_433120 ?auto_433124 ) ) ( not ( = ?auto_433121 ?auto_433122 ) ) ( not ( = ?auto_433121 ?auto_433123 ) ) ( not ( = ?auto_433121 ?auto_433124 ) ) ( not ( = ?auto_433122 ?auto_433123 ) ) ( not ( = ?auto_433122 ?auto_433124 ) ) ( not ( = ?auto_433123 ?auto_433124 ) ) ( ON ?auto_433123 ?auto_433124 ) ( ON ?auto_433122 ?auto_433123 ) ( ON ?auto_433121 ?auto_433122 ) ( ON ?auto_433120 ?auto_433121 ) ( ON ?auto_433119 ?auto_433120 ) ( CLEAR ?auto_433117 ) ( ON ?auto_433118 ?auto_433119 ) ( CLEAR ?auto_433118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_433110 ?auto_433111 ?auto_433112 ?auto_433113 ?auto_433114 ?auto_433115 ?auto_433116 ?auto_433117 ?auto_433118 )
      ( MAKE-15PILE ?auto_433110 ?auto_433111 ?auto_433112 ?auto_433113 ?auto_433114 ?auto_433115 ?auto_433116 ?auto_433117 ?auto_433118 ?auto_433119 ?auto_433120 ?auto_433121 ?auto_433122 ?auto_433123 ?auto_433124 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433140 - BLOCK
      ?auto_433141 - BLOCK
      ?auto_433142 - BLOCK
      ?auto_433143 - BLOCK
      ?auto_433144 - BLOCK
      ?auto_433145 - BLOCK
      ?auto_433146 - BLOCK
      ?auto_433147 - BLOCK
      ?auto_433148 - BLOCK
      ?auto_433149 - BLOCK
      ?auto_433150 - BLOCK
      ?auto_433151 - BLOCK
      ?auto_433152 - BLOCK
      ?auto_433153 - BLOCK
      ?auto_433154 - BLOCK
    )
    :vars
    (
      ?auto_433155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433154 ?auto_433155 ) ( ON-TABLE ?auto_433140 ) ( ON ?auto_433141 ?auto_433140 ) ( ON ?auto_433142 ?auto_433141 ) ( ON ?auto_433143 ?auto_433142 ) ( ON ?auto_433144 ?auto_433143 ) ( ON ?auto_433145 ?auto_433144 ) ( ON ?auto_433146 ?auto_433145 ) ( not ( = ?auto_433140 ?auto_433141 ) ) ( not ( = ?auto_433140 ?auto_433142 ) ) ( not ( = ?auto_433140 ?auto_433143 ) ) ( not ( = ?auto_433140 ?auto_433144 ) ) ( not ( = ?auto_433140 ?auto_433145 ) ) ( not ( = ?auto_433140 ?auto_433146 ) ) ( not ( = ?auto_433140 ?auto_433147 ) ) ( not ( = ?auto_433140 ?auto_433148 ) ) ( not ( = ?auto_433140 ?auto_433149 ) ) ( not ( = ?auto_433140 ?auto_433150 ) ) ( not ( = ?auto_433140 ?auto_433151 ) ) ( not ( = ?auto_433140 ?auto_433152 ) ) ( not ( = ?auto_433140 ?auto_433153 ) ) ( not ( = ?auto_433140 ?auto_433154 ) ) ( not ( = ?auto_433140 ?auto_433155 ) ) ( not ( = ?auto_433141 ?auto_433142 ) ) ( not ( = ?auto_433141 ?auto_433143 ) ) ( not ( = ?auto_433141 ?auto_433144 ) ) ( not ( = ?auto_433141 ?auto_433145 ) ) ( not ( = ?auto_433141 ?auto_433146 ) ) ( not ( = ?auto_433141 ?auto_433147 ) ) ( not ( = ?auto_433141 ?auto_433148 ) ) ( not ( = ?auto_433141 ?auto_433149 ) ) ( not ( = ?auto_433141 ?auto_433150 ) ) ( not ( = ?auto_433141 ?auto_433151 ) ) ( not ( = ?auto_433141 ?auto_433152 ) ) ( not ( = ?auto_433141 ?auto_433153 ) ) ( not ( = ?auto_433141 ?auto_433154 ) ) ( not ( = ?auto_433141 ?auto_433155 ) ) ( not ( = ?auto_433142 ?auto_433143 ) ) ( not ( = ?auto_433142 ?auto_433144 ) ) ( not ( = ?auto_433142 ?auto_433145 ) ) ( not ( = ?auto_433142 ?auto_433146 ) ) ( not ( = ?auto_433142 ?auto_433147 ) ) ( not ( = ?auto_433142 ?auto_433148 ) ) ( not ( = ?auto_433142 ?auto_433149 ) ) ( not ( = ?auto_433142 ?auto_433150 ) ) ( not ( = ?auto_433142 ?auto_433151 ) ) ( not ( = ?auto_433142 ?auto_433152 ) ) ( not ( = ?auto_433142 ?auto_433153 ) ) ( not ( = ?auto_433142 ?auto_433154 ) ) ( not ( = ?auto_433142 ?auto_433155 ) ) ( not ( = ?auto_433143 ?auto_433144 ) ) ( not ( = ?auto_433143 ?auto_433145 ) ) ( not ( = ?auto_433143 ?auto_433146 ) ) ( not ( = ?auto_433143 ?auto_433147 ) ) ( not ( = ?auto_433143 ?auto_433148 ) ) ( not ( = ?auto_433143 ?auto_433149 ) ) ( not ( = ?auto_433143 ?auto_433150 ) ) ( not ( = ?auto_433143 ?auto_433151 ) ) ( not ( = ?auto_433143 ?auto_433152 ) ) ( not ( = ?auto_433143 ?auto_433153 ) ) ( not ( = ?auto_433143 ?auto_433154 ) ) ( not ( = ?auto_433143 ?auto_433155 ) ) ( not ( = ?auto_433144 ?auto_433145 ) ) ( not ( = ?auto_433144 ?auto_433146 ) ) ( not ( = ?auto_433144 ?auto_433147 ) ) ( not ( = ?auto_433144 ?auto_433148 ) ) ( not ( = ?auto_433144 ?auto_433149 ) ) ( not ( = ?auto_433144 ?auto_433150 ) ) ( not ( = ?auto_433144 ?auto_433151 ) ) ( not ( = ?auto_433144 ?auto_433152 ) ) ( not ( = ?auto_433144 ?auto_433153 ) ) ( not ( = ?auto_433144 ?auto_433154 ) ) ( not ( = ?auto_433144 ?auto_433155 ) ) ( not ( = ?auto_433145 ?auto_433146 ) ) ( not ( = ?auto_433145 ?auto_433147 ) ) ( not ( = ?auto_433145 ?auto_433148 ) ) ( not ( = ?auto_433145 ?auto_433149 ) ) ( not ( = ?auto_433145 ?auto_433150 ) ) ( not ( = ?auto_433145 ?auto_433151 ) ) ( not ( = ?auto_433145 ?auto_433152 ) ) ( not ( = ?auto_433145 ?auto_433153 ) ) ( not ( = ?auto_433145 ?auto_433154 ) ) ( not ( = ?auto_433145 ?auto_433155 ) ) ( not ( = ?auto_433146 ?auto_433147 ) ) ( not ( = ?auto_433146 ?auto_433148 ) ) ( not ( = ?auto_433146 ?auto_433149 ) ) ( not ( = ?auto_433146 ?auto_433150 ) ) ( not ( = ?auto_433146 ?auto_433151 ) ) ( not ( = ?auto_433146 ?auto_433152 ) ) ( not ( = ?auto_433146 ?auto_433153 ) ) ( not ( = ?auto_433146 ?auto_433154 ) ) ( not ( = ?auto_433146 ?auto_433155 ) ) ( not ( = ?auto_433147 ?auto_433148 ) ) ( not ( = ?auto_433147 ?auto_433149 ) ) ( not ( = ?auto_433147 ?auto_433150 ) ) ( not ( = ?auto_433147 ?auto_433151 ) ) ( not ( = ?auto_433147 ?auto_433152 ) ) ( not ( = ?auto_433147 ?auto_433153 ) ) ( not ( = ?auto_433147 ?auto_433154 ) ) ( not ( = ?auto_433147 ?auto_433155 ) ) ( not ( = ?auto_433148 ?auto_433149 ) ) ( not ( = ?auto_433148 ?auto_433150 ) ) ( not ( = ?auto_433148 ?auto_433151 ) ) ( not ( = ?auto_433148 ?auto_433152 ) ) ( not ( = ?auto_433148 ?auto_433153 ) ) ( not ( = ?auto_433148 ?auto_433154 ) ) ( not ( = ?auto_433148 ?auto_433155 ) ) ( not ( = ?auto_433149 ?auto_433150 ) ) ( not ( = ?auto_433149 ?auto_433151 ) ) ( not ( = ?auto_433149 ?auto_433152 ) ) ( not ( = ?auto_433149 ?auto_433153 ) ) ( not ( = ?auto_433149 ?auto_433154 ) ) ( not ( = ?auto_433149 ?auto_433155 ) ) ( not ( = ?auto_433150 ?auto_433151 ) ) ( not ( = ?auto_433150 ?auto_433152 ) ) ( not ( = ?auto_433150 ?auto_433153 ) ) ( not ( = ?auto_433150 ?auto_433154 ) ) ( not ( = ?auto_433150 ?auto_433155 ) ) ( not ( = ?auto_433151 ?auto_433152 ) ) ( not ( = ?auto_433151 ?auto_433153 ) ) ( not ( = ?auto_433151 ?auto_433154 ) ) ( not ( = ?auto_433151 ?auto_433155 ) ) ( not ( = ?auto_433152 ?auto_433153 ) ) ( not ( = ?auto_433152 ?auto_433154 ) ) ( not ( = ?auto_433152 ?auto_433155 ) ) ( not ( = ?auto_433153 ?auto_433154 ) ) ( not ( = ?auto_433153 ?auto_433155 ) ) ( not ( = ?auto_433154 ?auto_433155 ) ) ( ON ?auto_433153 ?auto_433154 ) ( ON ?auto_433152 ?auto_433153 ) ( ON ?auto_433151 ?auto_433152 ) ( ON ?auto_433150 ?auto_433151 ) ( ON ?auto_433149 ?auto_433150 ) ( ON ?auto_433148 ?auto_433149 ) ( CLEAR ?auto_433146 ) ( ON ?auto_433147 ?auto_433148 ) ( CLEAR ?auto_433147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_433140 ?auto_433141 ?auto_433142 ?auto_433143 ?auto_433144 ?auto_433145 ?auto_433146 ?auto_433147 )
      ( MAKE-15PILE ?auto_433140 ?auto_433141 ?auto_433142 ?auto_433143 ?auto_433144 ?auto_433145 ?auto_433146 ?auto_433147 ?auto_433148 ?auto_433149 ?auto_433150 ?auto_433151 ?auto_433152 ?auto_433153 ?auto_433154 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433171 - BLOCK
      ?auto_433172 - BLOCK
      ?auto_433173 - BLOCK
      ?auto_433174 - BLOCK
      ?auto_433175 - BLOCK
      ?auto_433176 - BLOCK
      ?auto_433177 - BLOCK
      ?auto_433178 - BLOCK
      ?auto_433179 - BLOCK
      ?auto_433180 - BLOCK
      ?auto_433181 - BLOCK
      ?auto_433182 - BLOCK
      ?auto_433183 - BLOCK
      ?auto_433184 - BLOCK
      ?auto_433185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433185 ) ( ON-TABLE ?auto_433171 ) ( ON ?auto_433172 ?auto_433171 ) ( ON ?auto_433173 ?auto_433172 ) ( ON ?auto_433174 ?auto_433173 ) ( ON ?auto_433175 ?auto_433174 ) ( ON ?auto_433176 ?auto_433175 ) ( ON ?auto_433177 ?auto_433176 ) ( not ( = ?auto_433171 ?auto_433172 ) ) ( not ( = ?auto_433171 ?auto_433173 ) ) ( not ( = ?auto_433171 ?auto_433174 ) ) ( not ( = ?auto_433171 ?auto_433175 ) ) ( not ( = ?auto_433171 ?auto_433176 ) ) ( not ( = ?auto_433171 ?auto_433177 ) ) ( not ( = ?auto_433171 ?auto_433178 ) ) ( not ( = ?auto_433171 ?auto_433179 ) ) ( not ( = ?auto_433171 ?auto_433180 ) ) ( not ( = ?auto_433171 ?auto_433181 ) ) ( not ( = ?auto_433171 ?auto_433182 ) ) ( not ( = ?auto_433171 ?auto_433183 ) ) ( not ( = ?auto_433171 ?auto_433184 ) ) ( not ( = ?auto_433171 ?auto_433185 ) ) ( not ( = ?auto_433172 ?auto_433173 ) ) ( not ( = ?auto_433172 ?auto_433174 ) ) ( not ( = ?auto_433172 ?auto_433175 ) ) ( not ( = ?auto_433172 ?auto_433176 ) ) ( not ( = ?auto_433172 ?auto_433177 ) ) ( not ( = ?auto_433172 ?auto_433178 ) ) ( not ( = ?auto_433172 ?auto_433179 ) ) ( not ( = ?auto_433172 ?auto_433180 ) ) ( not ( = ?auto_433172 ?auto_433181 ) ) ( not ( = ?auto_433172 ?auto_433182 ) ) ( not ( = ?auto_433172 ?auto_433183 ) ) ( not ( = ?auto_433172 ?auto_433184 ) ) ( not ( = ?auto_433172 ?auto_433185 ) ) ( not ( = ?auto_433173 ?auto_433174 ) ) ( not ( = ?auto_433173 ?auto_433175 ) ) ( not ( = ?auto_433173 ?auto_433176 ) ) ( not ( = ?auto_433173 ?auto_433177 ) ) ( not ( = ?auto_433173 ?auto_433178 ) ) ( not ( = ?auto_433173 ?auto_433179 ) ) ( not ( = ?auto_433173 ?auto_433180 ) ) ( not ( = ?auto_433173 ?auto_433181 ) ) ( not ( = ?auto_433173 ?auto_433182 ) ) ( not ( = ?auto_433173 ?auto_433183 ) ) ( not ( = ?auto_433173 ?auto_433184 ) ) ( not ( = ?auto_433173 ?auto_433185 ) ) ( not ( = ?auto_433174 ?auto_433175 ) ) ( not ( = ?auto_433174 ?auto_433176 ) ) ( not ( = ?auto_433174 ?auto_433177 ) ) ( not ( = ?auto_433174 ?auto_433178 ) ) ( not ( = ?auto_433174 ?auto_433179 ) ) ( not ( = ?auto_433174 ?auto_433180 ) ) ( not ( = ?auto_433174 ?auto_433181 ) ) ( not ( = ?auto_433174 ?auto_433182 ) ) ( not ( = ?auto_433174 ?auto_433183 ) ) ( not ( = ?auto_433174 ?auto_433184 ) ) ( not ( = ?auto_433174 ?auto_433185 ) ) ( not ( = ?auto_433175 ?auto_433176 ) ) ( not ( = ?auto_433175 ?auto_433177 ) ) ( not ( = ?auto_433175 ?auto_433178 ) ) ( not ( = ?auto_433175 ?auto_433179 ) ) ( not ( = ?auto_433175 ?auto_433180 ) ) ( not ( = ?auto_433175 ?auto_433181 ) ) ( not ( = ?auto_433175 ?auto_433182 ) ) ( not ( = ?auto_433175 ?auto_433183 ) ) ( not ( = ?auto_433175 ?auto_433184 ) ) ( not ( = ?auto_433175 ?auto_433185 ) ) ( not ( = ?auto_433176 ?auto_433177 ) ) ( not ( = ?auto_433176 ?auto_433178 ) ) ( not ( = ?auto_433176 ?auto_433179 ) ) ( not ( = ?auto_433176 ?auto_433180 ) ) ( not ( = ?auto_433176 ?auto_433181 ) ) ( not ( = ?auto_433176 ?auto_433182 ) ) ( not ( = ?auto_433176 ?auto_433183 ) ) ( not ( = ?auto_433176 ?auto_433184 ) ) ( not ( = ?auto_433176 ?auto_433185 ) ) ( not ( = ?auto_433177 ?auto_433178 ) ) ( not ( = ?auto_433177 ?auto_433179 ) ) ( not ( = ?auto_433177 ?auto_433180 ) ) ( not ( = ?auto_433177 ?auto_433181 ) ) ( not ( = ?auto_433177 ?auto_433182 ) ) ( not ( = ?auto_433177 ?auto_433183 ) ) ( not ( = ?auto_433177 ?auto_433184 ) ) ( not ( = ?auto_433177 ?auto_433185 ) ) ( not ( = ?auto_433178 ?auto_433179 ) ) ( not ( = ?auto_433178 ?auto_433180 ) ) ( not ( = ?auto_433178 ?auto_433181 ) ) ( not ( = ?auto_433178 ?auto_433182 ) ) ( not ( = ?auto_433178 ?auto_433183 ) ) ( not ( = ?auto_433178 ?auto_433184 ) ) ( not ( = ?auto_433178 ?auto_433185 ) ) ( not ( = ?auto_433179 ?auto_433180 ) ) ( not ( = ?auto_433179 ?auto_433181 ) ) ( not ( = ?auto_433179 ?auto_433182 ) ) ( not ( = ?auto_433179 ?auto_433183 ) ) ( not ( = ?auto_433179 ?auto_433184 ) ) ( not ( = ?auto_433179 ?auto_433185 ) ) ( not ( = ?auto_433180 ?auto_433181 ) ) ( not ( = ?auto_433180 ?auto_433182 ) ) ( not ( = ?auto_433180 ?auto_433183 ) ) ( not ( = ?auto_433180 ?auto_433184 ) ) ( not ( = ?auto_433180 ?auto_433185 ) ) ( not ( = ?auto_433181 ?auto_433182 ) ) ( not ( = ?auto_433181 ?auto_433183 ) ) ( not ( = ?auto_433181 ?auto_433184 ) ) ( not ( = ?auto_433181 ?auto_433185 ) ) ( not ( = ?auto_433182 ?auto_433183 ) ) ( not ( = ?auto_433182 ?auto_433184 ) ) ( not ( = ?auto_433182 ?auto_433185 ) ) ( not ( = ?auto_433183 ?auto_433184 ) ) ( not ( = ?auto_433183 ?auto_433185 ) ) ( not ( = ?auto_433184 ?auto_433185 ) ) ( ON ?auto_433184 ?auto_433185 ) ( ON ?auto_433183 ?auto_433184 ) ( ON ?auto_433182 ?auto_433183 ) ( ON ?auto_433181 ?auto_433182 ) ( ON ?auto_433180 ?auto_433181 ) ( ON ?auto_433179 ?auto_433180 ) ( CLEAR ?auto_433177 ) ( ON ?auto_433178 ?auto_433179 ) ( CLEAR ?auto_433178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_433171 ?auto_433172 ?auto_433173 ?auto_433174 ?auto_433175 ?auto_433176 ?auto_433177 ?auto_433178 )
      ( MAKE-15PILE ?auto_433171 ?auto_433172 ?auto_433173 ?auto_433174 ?auto_433175 ?auto_433176 ?auto_433177 ?auto_433178 ?auto_433179 ?auto_433180 ?auto_433181 ?auto_433182 ?auto_433183 ?auto_433184 ?auto_433185 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433201 - BLOCK
      ?auto_433202 - BLOCK
      ?auto_433203 - BLOCK
      ?auto_433204 - BLOCK
      ?auto_433205 - BLOCK
      ?auto_433206 - BLOCK
      ?auto_433207 - BLOCK
      ?auto_433208 - BLOCK
      ?auto_433209 - BLOCK
      ?auto_433210 - BLOCK
      ?auto_433211 - BLOCK
      ?auto_433212 - BLOCK
      ?auto_433213 - BLOCK
      ?auto_433214 - BLOCK
      ?auto_433215 - BLOCK
    )
    :vars
    (
      ?auto_433216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433215 ?auto_433216 ) ( ON-TABLE ?auto_433201 ) ( ON ?auto_433202 ?auto_433201 ) ( ON ?auto_433203 ?auto_433202 ) ( ON ?auto_433204 ?auto_433203 ) ( ON ?auto_433205 ?auto_433204 ) ( ON ?auto_433206 ?auto_433205 ) ( not ( = ?auto_433201 ?auto_433202 ) ) ( not ( = ?auto_433201 ?auto_433203 ) ) ( not ( = ?auto_433201 ?auto_433204 ) ) ( not ( = ?auto_433201 ?auto_433205 ) ) ( not ( = ?auto_433201 ?auto_433206 ) ) ( not ( = ?auto_433201 ?auto_433207 ) ) ( not ( = ?auto_433201 ?auto_433208 ) ) ( not ( = ?auto_433201 ?auto_433209 ) ) ( not ( = ?auto_433201 ?auto_433210 ) ) ( not ( = ?auto_433201 ?auto_433211 ) ) ( not ( = ?auto_433201 ?auto_433212 ) ) ( not ( = ?auto_433201 ?auto_433213 ) ) ( not ( = ?auto_433201 ?auto_433214 ) ) ( not ( = ?auto_433201 ?auto_433215 ) ) ( not ( = ?auto_433201 ?auto_433216 ) ) ( not ( = ?auto_433202 ?auto_433203 ) ) ( not ( = ?auto_433202 ?auto_433204 ) ) ( not ( = ?auto_433202 ?auto_433205 ) ) ( not ( = ?auto_433202 ?auto_433206 ) ) ( not ( = ?auto_433202 ?auto_433207 ) ) ( not ( = ?auto_433202 ?auto_433208 ) ) ( not ( = ?auto_433202 ?auto_433209 ) ) ( not ( = ?auto_433202 ?auto_433210 ) ) ( not ( = ?auto_433202 ?auto_433211 ) ) ( not ( = ?auto_433202 ?auto_433212 ) ) ( not ( = ?auto_433202 ?auto_433213 ) ) ( not ( = ?auto_433202 ?auto_433214 ) ) ( not ( = ?auto_433202 ?auto_433215 ) ) ( not ( = ?auto_433202 ?auto_433216 ) ) ( not ( = ?auto_433203 ?auto_433204 ) ) ( not ( = ?auto_433203 ?auto_433205 ) ) ( not ( = ?auto_433203 ?auto_433206 ) ) ( not ( = ?auto_433203 ?auto_433207 ) ) ( not ( = ?auto_433203 ?auto_433208 ) ) ( not ( = ?auto_433203 ?auto_433209 ) ) ( not ( = ?auto_433203 ?auto_433210 ) ) ( not ( = ?auto_433203 ?auto_433211 ) ) ( not ( = ?auto_433203 ?auto_433212 ) ) ( not ( = ?auto_433203 ?auto_433213 ) ) ( not ( = ?auto_433203 ?auto_433214 ) ) ( not ( = ?auto_433203 ?auto_433215 ) ) ( not ( = ?auto_433203 ?auto_433216 ) ) ( not ( = ?auto_433204 ?auto_433205 ) ) ( not ( = ?auto_433204 ?auto_433206 ) ) ( not ( = ?auto_433204 ?auto_433207 ) ) ( not ( = ?auto_433204 ?auto_433208 ) ) ( not ( = ?auto_433204 ?auto_433209 ) ) ( not ( = ?auto_433204 ?auto_433210 ) ) ( not ( = ?auto_433204 ?auto_433211 ) ) ( not ( = ?auto_433204 ?auto_433212 ) ) ( not ( = ?auto_433204 ?auto_433213 ) ) ( not ( = ?auto_433204 ?auto_433214 ) ) ( not ( = ?auto_433204 ?auto_433215 ) ) ( not ( = ?auto_433204 ?auto_433216 ) ) ( not ( = ?auto_433205 ?auto_433206 ) ) ( not ( = ?auto_433205 ?auto_433207 ) ) ( not ( = ?auto_433205 ?auto_433208 ) ) ( not ( = ?auto_433205 ?auto_433209 ) ) ( not ( = ?auto_433205 ?auto_433210 ) ) ( not ( = ?auto_433205 ?auto_433211 ) ) ( not ( = ?auto_433205 ?auto_433212 ) ) ( not ( = ?auto_433205 ?auto_433213 ) ) ( not ( = ?auto_433205 ?auto_433214 ) ) ( not ( = ?auto_433205 ?auto_433215 ) ) ( not ( = ?auto_433205 ?auto_433216 ) ) ( not ( = ?auto_433206 ?auto_433207 ) ) ( not ( = ?auto_433206 ?auto_433208 ) ) ( not ( = ?auto_433206 ?auto_433209 ) ) ( not ( = ?auto_433206 ?auto_433210 ) ) ( not ( = ?auto_433206 ?auto_433211 ) ) ( not ( = ?auto_433206 ?auto_433212 ) ) ( not ( = ?auto_433206 ?auto_433213 ) ) ( not ( = ?auto_433206 ?auto_433214 ) ) ( not ( = ?auto_433206 ?auto_433215 ) ) ( not ( = ?auto_433206 ?auto_433216 ) ) ( not ( = ?auto_433207 ?auto_433208 ) ) ( not ( = ?auto_433207 ?auto_433209 ) ) ( not ( = ?auto_433207 ?auto_433210 ) ) ( not ( = ?auto_433207 ?auto_433211 ) ) ( not ( = ?auto_433207 ?auto_433212 ) ) ( not ( = ?auto_433207 ?auto_433213 ) ) ( not ( = ?auto_433207 ?auto_433214 ) ) ( not ( = ?auto_433207 ?auto_433215 ) ) ( not ( = ?auto_433207 ?auto_433216 ) ) ( not ( = ?auto_433208 ?auto_433209 ) ) ( not ( = ?auto_433208 ?auto_433210 ) ) ( not ( = ?auto_433208 ?auto_433211 ) ) ( not ( = ?auto_433208 ?auto_433212 ) ) ( not ( = ?auto_433208 ?auto_433213 ) ) ( not ( = ?auto_433208 ?auto_433214 ) ) ( not ( = ?auto_433208 ?auto_433215 ) ) ( not ( = ?auto_433208 ?auto_433216 ) ) ( not ( = ?auto_433209 ?auto_433210 ) ) ( not ( = ?auto_433209 ?auto_433211 ) ) ( not ( = ?auto_433209 ?auto_433212 ) ) ( not ( = ?auto_433209 ?auto_433213 ) ) ( not ( = ?auto_433209 ?auto_433214 ) ) ( not ( = ?auto_433209 ?auto_433215 ) ) ( not ( = ?auto_433209 ?auto_433216 ) ) ( not ( = ?auto_433210 ?auto_433211 ) ) ( not ( = ?auto_433210 ?auto_433212 ) ) ( not ( = ?auto_433210 ?auto_433213 ) ) ( not ( = ?auto_433210 ?auto_433214 ) ) ( not ( = ?auto_433210 ?auto_433215 ) ) ( not ( = ?auto_433210 ?auto_433216 ) ) ( not ( = ?auto_433211 ?auto_433212 ) ) ( not ( = ?auto_433211 ?auto_433213 ) ) ( not ( = ?auto_433211 ?auto_433214 ) ) ( not ( = ?auto_433211 ?auto_433215 ) ) ( not ( = ?auto_433211 ?auto_433216 ) ) ( not ( = ?auto_433212 ?auto_433213 ) ) ( not ( = ?auto_433212 ?auto_433214 ) ) ( not ( = ?auto_433212 ?auto_433215 ) ) ( not ( = ?auto_433212 ?auto_433216 ) ) ( not ( = ?auto_433213 ?auto_433214 ) ) ( not ( = ?auto_433213 ?auto_433215 ) ) ( not ( = ?auto_433213 ?auto_433216 ) ) ( not ( = ?auto_433214 ?auto_433215 ) ) ( not ( = ?auto_433214 ?auto_433216 ) ) ( not ( = ?auto_433215 ?auto_433216 ) ) ( ON ?auto_433214 ?auto_433215 ) ( ON ?auto_433213 ?auto_433214 ) ( ON ?auto_433212 ?auto_433213 ) ( ON ?auto_433211 ?auto_433212 ) ( ON ?auto_433210 ?auto_433211 ) ( ON ?auto_433209 ?auto_433210 ) ( ON ?auto_433208 ?auto_433209 ) ( CLEAR ?auto_433206 ) ( ON ?auto_433207 ?auto_433208 ) ( CLEAR ?auto_433207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_433201 ?auto_433202 ?auto_433203 ?auto_433204 ?auto_433205 ?auto_433206 ?auto_433207 )
      ( MAKE-15PILE ?auto_433201 ?auto_433202 ?auto_433203 ?auto_433204 ?auto_433205 ?auto_433206 ?auto_433207 ?auto_433208 ?auto_433209 ?auto_433210 ?auto_433211 ?auto_433212 ?auto_433213 ?auto_433214 ?auto_433215 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433232 - BLOCK
      ?auto_433233 - BLOCK
      ?auto_433234 - BLOCK
      ?auto_433235 - BLOCK
      ?auto_433236 - BLOCK
      ?auto_433237 - BLOCK
      ?auto_433238 - BLOCK
      ?auto_433239 - BLOCK
      ?auto_433240 - BLOCK
      ?auto_433241 - BLOCK
      ?auto_433242 - BLOCK
      ?auto_433243 - BLOCK
      ?auto_433244 - BLOCK
      ?auto_433245 - BLOCK
      ?auto_433246 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433246 ) ( ON-TABLE ?auto_433232 ) ( ON ?auto_433233 ?auto_433232 ) ( ON ?auto_433234 ?auto_433233 ) ( ON ?auto_433235 ?auto_433234 ) ( ON ?auto_433236 ?auto_433235 ) ( ON ?auto_433237 ?auto_433236 ) ( not ( = ?auto_433232 ?auto_433233 ) ) ( not ( = ?auto_433232 ?auto_433234 ) ) ( not ( = ?auto_433232 ?auto_433235 ) ) ( not ( = ?auto_433232 ?auto_433236 ) ) ( not ( = ?auto_433232 ?auto_433237 ) ) ( not ( = ?auto_433232 ?auto_433238 ) ) ( not ( = ?auto_433232 ?auto_433239 ) ) ( not ( = ?auto_433232 ?auto_433240 ) ) ( not ( = ?auto_433232 ?auto_433241 ) ) ( not ( = ?auto_433232 ?auto_433242 ) ) ( not ( = ?auto_433232 ?auto_433243 ) ) ( not ( = ?auto_433232 ?auto_433244 ) ) ( not ( = ?auto_433232 ?auto_433245 ) ) ( not ( = ?auto_433232 ?auto_433246 ) ) ( not ( = ?auto_433233 ?auto_433234 ) ) ( not ( = ?auto_433233 ?auto_433235 ) ) ( not ( = ?auto_433233 ?auto_433236 ) ) ( not ( = ?auto_433233 ?auto_433237 ) ) ( not ( = ?auto_433233 ?auto_433238 ) ) ( not ( = ?auto_433233 ?auto_433239 ) ) ( not ( = ?auto_433233 ?auto_433240 ) ) ( not ( = ?auto_433233 ?auto_433241 ) ) ( not ( = ?auto_433233 ?auto_433242 ) ) ( not ( = ?auto_433233 ?auto_433243 ) ) ( not ( = ?auto_433233 ?auto_433244 ) ) ( not ( = ?auto_433233 ?auto_433245 ) ) ( not ( = ?auto_433233 ?auto_433246 ) ) ( not ( = ?auto_433234 ?auto_433235 ) ) ( not ( = ?auto_433234 ?auto_433236 ) ) ( not ( = ?auto_433234 ?auto_433237 ) ) ( not ( = ?auto_433234 ?auto_433238 ) ) ( not ( = ?auto_433234 ?auto_433239 ) ) ( not ( = ?auto_433234 ?auto_433240 ) ) ( not ( = ?auto_433234 ?auto_433241 ) ) ( not ( = ?auto_433234 ?auto_433242 ) ) ( not ( = ?auto_433234 ?auto_433243 ) ) ( not ( = ?auto_433234 ?auto_433244 ) ) ( not ( = ?auto_433234 ?auto_433245 ) ) ( not ( = ?auto_433234 ?auto_433246 ) ) ( not ( = ?auto_433235 ?auto_433236 ) ) ( not ( = ?auto_433235 ?auto_433237 ) ) ( not ( = ?auto_433235 ?auto_433238 ) ) ( not ( = ?auto_433235 ?auto_433239 ) ) ( not ( = ?auto_433235 ?auto_433240 ) ) ( not ( = ?auto_433235 ?auto_433241 ) ) ( not ( = ?auto_433235 ?auto_433242 ) ) ( not ( = ?auto_433235 ?auto_433243 ) ) ( not ( = ?auto_433235 ?auto_433244 ) ) ( not ( = ?auto_433235 ?auto_433245 ) ) ( not ( = ?auto_433235 ?auto_433246 ) ) ( not ( = ?auto_433236 ?auto_433237 ) ) ( not ( = ?auto_433236 ?auto_433238 ) ) ( not ( = ?auto_433236 ?auto_433239 ) ) ( not ( = ?auto_433236 ?auto_433240 ) ) ( not ( = ?auto_433236 ?auto_433241 ) ) ( not ( = ?auto_433236 ?auto_433242 ) ) ( not ( = ?auto_433236 ?auto_433243 ) ) ( not ( = ?auto_433236 ?auto_433244 ) ) ( not ( = ?auto_433236 ?auto_433245 ) ) ( not ( = ?auto_433236 ?auto_433246 ) ) ( not ( = ?auto_433237 ?auto_433238 ) ) ( not ( = ?auto_433237 ?auto_433239 ) ) ( not ( = ?auto_433237 ?auto_433240 ) ) ( not ( = ?auto_433237 ?auto_433241 ) ) ( not ( = ?auto_433237 ?auto_433242 ) ) ( not ( = ?auto_433237 ?auto_433243 ) ) ( not ( = ?auto_433237 ?auto_433244 ) ) ( not ( = ?auto_433237 ?auto_433245 ) ) ( not ( = ?auto_433237 ?auto_433246 ) ) ( not ( = ?auto_433238 ?auto_433239 ) ) ( not ( = ?auto_433238 ?auto_433240 ) ) ( not ( = ?auto_433238 ?auto_433241 ) ) ( not ( = ?auto_433238 ?auto_433242 ) ) ( not ( = ?auto_433238 ?auto_433243 ) ) ( not ( = ?auto_433238 ?auto_433244 ) ) ( not ( = ?auto_433238 ?auto_433245 ) ) ( not ( = ?auto_433238 ?auto_433246 ) ) ( not ( = ?auto_433239 ?auto_433240 ) ) ( not ( = ?auto_433239 ?auto_433241 ) ) ( not ( = ?auto_433239 ?auto_433242 ) ) ( not ( = ?auto_433239 ?auto_433243 ) ) ( not ( = ?auto_433239 ?auto_433244 ) ) ( not ( = ?auto_433239 ?auto_433245 ) ) ( not ( = ?auto_433239 ?auto_433246 ) ) ( not ( = ?auto_433240 ?auto_433241 ) ) ( not ( = ?auto_433240 ?auto_433242 ) ) ( not ( = ?auto_433240 ?auto_433243 ) ) ( not ( = ?auto_433240 ?auto_433244 ) ) ( not ( = ?auto_433240 ?auto_433245 ) ) ( not ( = ?auto_433240 ?auto_433246 ) ) ( not ( = ?auto_433241 ?auto_433242 ) ) ( not ( = ?auto_433241 ?auto_433243 ) ) ( not ( = ?auto_433241 ?auto_433244 ) ) ( not ( = ?auto_433241 ?auto_433245 ) ) ( not ( = ?auto_433241 ?auto_433246 ) ) ( not ( = ?auto_433242 ?auto_433243 ) ) ( not ( = ?auto_433242 ?auto_433244 ) ) ( not ( = ?auto_433242 ?auto_433245 ) ) ( not ( = ?auto_433242 ?auto_433246 ) ) ( not ( = ?auto_433243 ?auto_433244 ) ) ( not ( = ?auto_433243 ?auto_433245 ) ) ( not ( = ?auto_433243 ?auto_433246 ) ) ( not ( = ?auto_433244 ?auto_433245 ) ) ( not ( = ?auto_433244 ?auto_433246 ) ) ( not ( = ?auto_433245 ?auto_433246 ) ) ( ON ?auto_433245 ?auto_433246 ) ( ON ?auto_433244 ?auto_433245 ) ( ON ?auto_433243 ?auto_433244 ) ( ON ?auto_433242 ?auto_433243 ) ( ON ?auto_433241 ?auto_433242 ) ( ON ?auto_433240 ?auto_433241 ) ( ON ?auto_433239 ?auto_433240 ) ( CLEAR ?auto_433237 ) ( ON ?auto_433238 ?auto_433239 ) ( CLEAR ?auto_433238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_433232 ?auto_433233 ?auto_433234 ?auto_433235 ?auto_433236 ?auto_433237 ?auto_433238 )
      ( MAKE-15PILE ?auto_433232 ?auto_433233 ?auto_433234 ?auto_433235 ?auto_433236 ?auto_433237 ?auto_433238 ?auto_433239 ?auto_433240 ?auto_433241 ?auto_433242 ?auto_433243 ?auto_433244 ?auto_433245 ?auto_433246 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433262 - BLOCK
      ?auto_433263 - BLOCK
      ?auto_433264 - BLOCK
      ?auto_433265 - BLOCK
      ?auto_433266 - BLOCK
      ?auto_433267 - BLOCK
      ?auto_433268 - BLOCK
      ?auto_433269 - BLOCK
      ?auto_433270 - BLOCK
      ?auto_433271 - BLOCK
      ?auto_433272 - BLOCK
      ?auto_433273 - BLOCK
      ?auto_433274 - BLOCK
      ?auto_433275 - BLOCK
      ?auto_433276 - BLOCK
    )
    :vars
    (
      ?auto_433277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433276 ?auto_433277 ) ( ON-TABLE ?auto_433262 ) ( ON ?auto_433263 ?auto_433262 ) ( ON ?auto_433264 ?auto_433263 ) ( ON ?auto_433265 ?auto_433264 ) ( ON ?auto_433266 ?auto_433265 ) ( not ( = ?auto_433262 ?auto_433263 ) ) ( not ( = ?auto_433262 ?auto_433264 ) ) ( not ( = ?auto_433262 ?auto_433265 ) ) ( not ( = ?auto_433262 ?auto_433266 ) ) ( not ( = ?auto_433262 ?auto_433267 ) ) ( not ( = ?auto_433262 ?auto_433268 ) ) ( not ( = ?auto_433262 ?auto_433269 ) ) ( not ( = ?auto_433262 ?auto_433270 ) ) ( not ( = ?auto_433262 ?auto_433271 ) ) ( not ( = ?auto_433262 ?auto_433272 ) ) ( not ( = ?auto_433262 ?auto_433273 ) ) ( not ( = ?auto_433262 ?auto_433274 ) ) ( not ( = ?auto_433262 ?auto_433275 ) ) ( not ( = ?auto_433262 ?auto_433276 ) ) ( not ( = ?auto_433262 ?auto_433277 ) ) ( not ( = ?auto_433263 ?auto_433264 ) ) ( not ( = ?auto_433263 ?auto_433265 ) ) ( not ( = ?auto_433263 ?auto_433266 ) ) ( not ( = ?auto_433263 ?auto_433267 ) ) ( not ( = ?auto_433263 ?auto_433268 ) ) ( not ( = ?auto_433263 ?auto_433269 ) ) ( not ( = ?auto_433263 ?auto_433270 ) ) ( not ( = ?auto_433263 ?auto_433271 ) ) ( not ( = ?auto_433263 ?auto_433272 ) ) ( not ( = ?auto_433263 ?auto_433273 ) ) ( not ( = ?auto_433263 ?auto_433274 ) ) ( not ( = ?auto_433263 ?auto_433275 ) ) ( not ( = ?auto_433263 ?auto_433276 ) ) ( not ( = ?auto_433263 ?auto_433277 ) ) ( not ( = ?auto_433264 ?auto_433265 ) ) ( not ( = ?auto_433264 ?auto_433266 ) ) ( not ( = ?auto_433264 ?auto_433267 ) ) ( not ( = ?auto_433264 ?auto_433268 ) ) ( not ( = ?auto_433264 ?auto_433269 ) ) ( not ( = ?auto_433264 ?auto_433270 ) ) ( not ( = ?auto_433264 ?auto_433271 ) ) ( not ( = ?auto_433264 ?auto_433272 ) ) ( not ( = ?auto_433264 ?auto_433273 ) ) ( not ( = ?auto_433264 ?auto_433274 ) ) ( not ( = ?auto_433264 ?auto_433275 ) ) ( not ( = ?auto_433264 ?auto_433276 ) ) ( not ( = ?auto_433264 ?auto_433277 ) ) ( not ( = ?auto_433265 ?auto_433266 ) ) ( not ( = ?auto_433265 ?auto_433267 ) ) ( not ( = ?auto_433265 ?auto_433268 ) ) ( not ( = ?auto_433265 ?auto_433269 ) ) ( not ( = ?auto_433265 ?auto_433270 ) ) ( not ( = ?auto_433265 ?auto_433271 ) ) ( not ( = ?auto_433265 ?auto_433272 ) ) ( not ( = ?auto_433265 ?auto_433273 ) ) ( not ( = ?auto_433265 ?auto_433274 ) ) ( not ( = ?auto_433265 ?auto_433275 ) ) ( not ( = ?auto_433265 ?auto_433276 ) ) ( not ( = ?auto_433265 ?auto_433277 ) ) ( not ( = ?auto_433266 ?auto_433267 ) ) ( not ( = ?auto_433266 ?auto_433268 ) ) ( not ( = ?auto_433266 ?auto_433269 ) ) ( not ( = ?auto_433266 ?auto_433270 ) ) ( not ( = ?auto_433266 ?auto_433271 ) ) ( not ( = ?auto_433266 ?auto_433272 ) ) ( not ( = ?auto_433266 ?auto_433273 ) ) ( not ( = ?auto_433266 ?auto_433274 ) ) ( not ( = ?auto_433266 ?auto_433275 ) ) ( not ( = ?auto_433266 ?auto_433276 ) ) ( not ( = ?auto_433266 ?auto_433277 ) ) ( not ( = ?auto_433267 ?auto_433268 ) ) ( not ( = ?auto_433267 ?auto_433269 ) ) ( not ( = ?auto_433267 ?auto_433270 ) ) ( not ( = ?auto_433267 ?auto_433271 ) ) ( not ( = ?auto_433267 ?auto_433272 ) ) ( not ( = ?auto_433267 ?auto_433273 ) ) ( not ( = ?auto_433267 ?auto_433274 ) ) ( not ( = ?auto_433267 ?auto_433275 ) ) ( not ( = ?auto_433267 ?auto_433276 ) ) ( not ( = ?auto_433267 ?auto_433277 ) ) ( not ( = ?auto_433268 ?auto_433269 ) ) ( not ( = ?auto_433268 ?auto_433270 ) ) ( not ( = ?auto_433268 ?auto_433271 ) ) ( not ( = ?auto_433268 ?auto_433272 ) ) ( not ( = ?auto_433268 ?auto_433273 ) ) ( not ( = ?auto_433268 ?auto_433274 ) ) ( not ( = ?auto_433268 ?auto_433275 ) ) ( not ( = ?auto_433268 ?auto_433276 ) ) ( not ( = ?auto_433268 ?auto_433277 ) ) ( not ( = ?auto_433269 ?auto_433270 ) ) ( not ( = ?auto_433269 ?auto_433271 ) ) ( not ( = ?auto_433269 ?auto_433272 ) ) ( not ( = ?auto_433269 ?auto_433273 ) ) ( not ( = ?auto_433269 ?auto_433274 ) ) ( not ( = ?auto_433269 ?auto_433275 ) ) ( not ( = ?auto_433269 ?auto_433276 ) ) ( not ( = ?auto_433269 ?auto_433277 ) ) ( not ( = ?auto_433270 ?auto_433271 ) ) ( not ( = ?auto_433270 ?auto_433272 ) ) ( not ( = ?auto_433270 ?auto_433273 ) ) ( not ( = ?auto_433270 ?auto_433274 ) ) ( not ( = ?auto_433270 ?auto_433275 ) ) ( not ( = ?auto_433270 ?auto_433276 ) ) ( not ( = ?auto_433270 ?auto_433277 ) ) ( not ( = ?auto_433271 ?auto_433272 ) ) ( not ( = ?auto_433271 ?auto_433273 ) ) ( not ( = ?auto_433271 ?auto_433274 ) ) ( not ( = ?auto_433271 ?auto_433275 ) ) ( not ( = ?auto_433271 ?auto_433276 ) ) ( not ( = ?auto_433271 ?auto_433277 ) ) ( not ( = ?auto_433272 ?auto_433273 ) ) ( not ( = ?auto_433272 ?auto_433274 ) ) ( not ( = ?auto_433272 ?auto_433275 ) ) ( not ( = ?auto_433272 ?auto_433276 ) ) ( not ( = ?auto_433272 ?auto_433277 ) ) ( not ( = ?auto_433273 ?auto_433274 ) ) ( not ( = ?auto_433273 ?auto_433275 ) ) ( not ( = ?auto_433273 ?auto_433276 ) ) ( not ( = ?auto_433273 ?auto_433277 ) ) ( not ( = ?auto_433274 ?auto_433275 ) ) ( not ( = ?auto_433274 ?auto_433276 ) ) ( not ( = ?auto_433274 ?auto_433277 ) ) ( not ( = ?auto_433275 ?auto_433276 ) ) ( not ( = ?auto_433275 ?auto_433277 ) ) ( not ( = ?auto_433276 ?auto_433277 ) ) ( ON ?auto_433275 ?auto_433276 ) ( ON ?auto_433274 ?auto_433275 ) ( ON ?auto_433273 ?auto_433274 ) ( ON ?auto_433272 ?auto_433273 ) ( ON ?auto_433271 ?auto_433272 ) ( ON ?auto_433270 ?auto_433271 ) ( ON ?auto_433269 ?auto_433270 ) ( ON ?auto_433268 ?auto_433269 ) ( CLEAR ?auto_433266 ) ( ON ?auto_433267 ?auto_433268 ) ( CLEAR ?auto_433267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_433262 ?auto_433263 ?auto_433264 ?auto_433265 ?auto_433266 ?auto_433267 )
      ( MAKE-15PILE ?auto_433262 ?auto_433263 ?auto_433264 ?auto_433265 ?auto_433266 ?auto_433267 ?auto_433268 ?auto_433269 ?auto_433270 ?auto_433271 ?auto_433272 ?auto_433273 ?auto_433274 ?auto_433275 ?auto_433276 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433293 - BLOCK
      ?auto_433294 - BLOCK
      ?auto_433295 - BLOCK
      ?auto_433296 - BLOCK
      ?auto_433297 - BLOCK
      ?auto_433298 - BLOCK
      ?auto_433299 - BLOCK
      ?auto_433300 - BLOCK
      ?auto_433301 - BLOCK
      ?auto_433302 - BLOCK
      ?auto_433303 - BLOCK
      ?auto_433304 - BLOCK
      ?auto_433305 - BLOCK
      ?auto_433306 - BLOCK
      ?auto_433307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433307 ) ( ON-TABLE ?auto_433293 ) ( ON ?auto_433294 ?auto_433293 ) ( ON ?auto_433295 ?auto_433294 ) ( ON ?auto_433296 ?auto_433295 ) ( ON ?auto_433297 ?auto_433296 ) ( not ( = ?auto_433293 ?auto_433294 ) ) ( not ( = ?auto_433293 ?auto_433295 ) ) ( not ( = ?auto_433293 ?auto_433296 ) ) ( not ( = ?auto_433293 ?auto_433297 ) ) ( not ( = ?auto_433293 ?auto_433298 ) ) ( not ( = ?auto_433293 ?auto_433299 ) ) ( not ( = ?auto_433293 ?auto_433300 ) ) ( not ( = ?auto_433293 ?auto_433301 ) ) ( not ( = ?auto_433293 ?auto_433302 ) ) ( not ( = ?auto_433293 ?auto_433303 ) ) ( not ( = ?auto_433293 ?auto_433304 ) ) ( not ( = ?auto_433293 ?auto_433305 ) ) ( not ( = ?auto_433293 ?auto_433306 ) ) ( not ( = ?auto_433293 ?auto_433307 ) ) ( not ( = ?auto_433294 ?auto_433295 ) ) ( not ( = ?auto_433294 ?auto_433296 ) ) ( not ( = ?auto_433294 ?auto_433297 ) ) ( not ( = ?auto_433294 ?auto_433298 ) ) ( not ( = ?auto_433294 ?auto_433299 ) ) ( not ( = ?auto_433294 ?auto_433300 ) ) ( not ( = ?auto_433294 ?auto_433301 ) ) ( not ( = ?auto_433294 ?auto_433302 ) ) ( not ( = ?auto_433294 ?auto_433303 ) ) ( not ( = ?auto_433294 ?auto_433304 ) ) ( not ( = ?auto_433294 ?auto_433305 ) ) ( not ( = ?auto_433294 ?auto_433306 ) ) ( not ( = ?auto_433294 ?auto_433307 ) ) ( not ( = ?auto_433295 ?auto_433296 ) ) ( not ( = ?auto_433295 ?auto_433297 ) ) ( not ( = ?auto_433295 ?auto_433298 ) ) ( not ( = ?auto_433295 ?auto_433299 ) ) ( not ( = ?auto_433295 ?auto_433300 ) ) ( not ( = ?auto_433295 ?auto_433301 ) ) ( not ( = ?auto_433295 ?auto_433302 ) ) ( not ( = ?auto_433295 ?auto_433303 ) ) ( not ( = ?auto_433295 ?auto_433304 ) ) ( not ( = ?auto_433295 ?auto_433305 ) ) ( not ( = ?auto_433295 ?auto_433306 ) ) ( not ( = ?auto_433295 ?auto_433307 ) ) ( not ( = ?auto_433296 ?auto_433297 ) ) ( not ( = ?auto_433296 ?auto_433298 ) ) ( not ( = ?auto_433296 ?auto_433299 ) ) ( not ( = ?auto_433296 ?auto_433300 ) ) ( not ( = ?auto_433296 ?auto_433301 ) ) ( not ( = ?auto_433296 ?auto_433302 ) ) ( not ( = ?auto_433296 ?auto_433303 ) ) ( not ( = ?auto_433296 ?auto_433304 ) ) ( not ( = ?auto_433296 ?auto_433305 ) ) ( not ( = ?auto_433296 ?auto_433306 ) ) ( not ( = ?auto_433296 ?auto_433307 ) ) ( not ( = ?auto_433297 ?auto_433298 ) ) ( not ( = ?auto_433297 ?auto_433299 ) ) ( not ( = ?auto_433297 ?auto_433300 ) ) ( not ( = ?auto_433297 ?auto_433301 ) ) ( not ( = ?auto_433297 ?auto_433302 ) ) ( not ( = ?auto_433297 ?auto_433303 ) ) ( not ( = ?auto_433297 ?auto_433304 ) ) ( not ( = ?auto_433297 ?auto_433305 ) ) ( not ( = ?auto_433297 ?auto_433306 ) ) ( not ( = ?auto_433297 ?auto_433307 ) ) ( not ( = ?auto_433298 ?auto_433299 ) ) ( not ( = ?auto_433298 ?auto_433300 ) ) ( not ( = ?auto_433298 ?auto_433301 ) ) ( not ( = ?auto_433298 ?auto_433302 ) ) ( not ( = ?auto_433298 ?auto_433303 ) ) ( not ( = ?auto_433298 ?auto_433304 ) ) ( not ( = ?auto_433298 ?auto_433305 ) ) ( not ( = ?auto_433298 ?auto_433306 ) ) ( not ( = ?auto_433298 ?auto_433307 ) ) ( not ( = ?auto_433299 ?auto_433300 ) ) ( not ( = ?auto_433299 ?auto_433301 ) ) ( not ( = ?auto_433299 ?auto_433302 ) ) ( not ( = ?auto_433299 ?auto_433303 ) ) ( not ( = ?auto_433299 ?auto_433304 ) ) ( not ( = ?auto_433299 ?auto_433305 ) ) ( not ( = ?auto_433299 ?auto_433306 ) ) ( not ( = ?auto_433299 ?auto_433307 ) ) ( not ( = ?auto_433300 ?auto_433301 ) ) ( not ( = ?auto_433300 ?auto_433302 ) ) ( not ( = ?auto_433300 ?auto_433303 ) ) ( not ( = ?auto_433300 ?auto_433304 ) ) ( not ( = ?auto_433300 ?auto_433305 ) ) ( not ( = ?auto_433300 ?auto_433306 ) ) ( not ( = ?auto_433300 ?auto_433307 ) ) ( not ( = ?auto_433301 ?auto_433302 ) ) ( not ( = ?auto_433301 ?auto_433303 ) ) ( not ( = ?auto_433301 ?auto_433304 ) ) ( not ( = ?auto_433301 ?auto_433305 ) ) ( not ( = ?auto_433301 ?auto_433306 ) ) ( not ( = ?auto_433301 ?auto_433307 ) ) ( not ( = ?auto_433302 ?auto_433303 ) ) ( not ( = ?auto_433302 ?auto_433304 ) ) ( not ( = ?auto_433302 ?auto_433305 ) ) ( not ( = ?auto_433302 ?auto_433306 ) ) ( not ( = ?auto_433302 ?auto_433307 ) ) ( not ( = ?auto_433303 ?auto_433304 ) ) ( not ( = ?auto_433303 ?auto_433305 ) ) ( not ( = ?auto_433303 ?auto_433306 ) ) ( not ( = ?auto_433303 ?auto_433307 ) ) ( not ( = ?auto_433304 ?auto_433305 ) ) ( not ( = ?auto_433304 ?auto_433306 ) ) ( not ( = ?auto_433304 ?auto_433307 ) ) ( not ( = ?auto_433305 ?auto_433306 ) ) ( not ( = ?auto_433305 ?auto_433307 ) ) ( not ( = ?auto_433306 ?auto_433307 ) ) ( ON ?auto_433306 ?auto_433307 ) ( ON ?auto_433305 ?auto_433306 ) ( ON ?auto_433304 ?auto_433305 ) ( ON ?auto_433303 ?auto_433304 ) ( ON ?auto_433302 ?auto_433303 ) ( ON ?auto_433301 ?auto_433302 ) ( ON ?auto_433300 ?auto_433301 ) ( ON ?auto_433299 ?auto_433300 ) ( CLEAR ?auto_433297 ) ( ON ?auto_433298 ?auto_433299 ) ( CLEAR ?auto_433298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_433293 ?auto_433294 ?auto_433295 ?auto_433296 ?auto_433297 ?auto_433298 )
      ( MAKE-15PILE ?auto_433293 ?auto_433294 ?auto_433295 ?auto_433296 ?auto_433297 ?auto_433298 ?auto_433299 ?auto_433300 ?auto_433301 ?auto_433302 ?auto_433303 ?auto_433304 ?auto_433305 ?auto_433306 ?auto_433307 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433323 - BLOCK
      ?auto_433324 - BLOCK
      ?auto_433325 - BLOCK
      ?auto_433326 - BLOCK
      ?auto_433327 - BLOCK
      ?auto_433328 - BLOCK
      ?auto_433329 - BLOCK
      ?auto_433330 - BLOCK
      ?auto_433331 - BLOCK
      ?auto_433332 - BLOCK
      ?auto_433333 - BLOCK
      ?auto_433334 - BLOCK
      ?auto_433335 - BLOCK
      ?auto_433336 - BLOCK
      ?auto_433337 - BLOCK
    )
    :vars
    (
      ?auto_433338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433337 ?auto_433338 ) ( ON-TABLE ?auto_433323 ) ( ON ?auto_433324 ?auto_433323 ) ( ON ?auto_433325 ?auto_433324 ) ( ON ?auto_433326 ?auto_433325 ) ( not ( = ?auto_433323 ?auto_433324 ) ) ( not ( = ?auto_433323 ?auto_433325 ) ) ( not ( = ?auto_433323 ?auto_433326 ) ) ( not ( = ?auto_433323 ?auto_433327 ) ) ( not ( = ?auto_433323 ?auto_433328 ) ) ( not ( = ?auto_433323 ?auto_433329 ) ) ( not ( = ?auto_433323 ?auto_433330 ) ) ( not ( = ?auto_433323 ?auto_433331 ) ) ( not ( = ?auto_433323 ?auto_433332 ) ) ( not ( = ?auto_433323 ?auto_433333 ) ) ( not ( = ?auto_433323 ?auto_433334 ) ) ( not ( = ?auto_433323 ?auto_433335 ) ) ( not ( = ?auto_433323 ?auto_433336 ) ) ( not ( = ?auto_433323 ?auto_433337 ) ) ( not ( = ?auto_433323 ?auto_433338 ) ) ( not ( = ?auto_433324 ?auto_433325 ) ) ( not ( = ?auto_433324 ?auto_433326 ) ) ( not ( = ?auto_433324 ?auto_433327 ) ) ( not ( = ?auto_433324 ?auto_433328 ) ) ( not ( = ?auto_433324 ?auto_433329 ) ) ( not ( = ?auto_433324 ?auto_433330 ) ) ( not ( = ?auto_433324 ?auto_433331 ) ) ( not ( = ?auto_433324 ?auto_433332 ) ) ( not ( = ?auto_433324 ?auto_433333 ) ) ( not ( = ?auto_433324 ?auto_433334 ) ) ( not ( = ?auto_433324 ?auto_433335 ) ) ( not ( = ?auto_433324 ?auto_433336 ) ) ( not ( = ?auto_433324 ?auto_433337 ) ) ( not ( = ?auto_433324 ?auto_433338 ) ) ( not ( = ?auto_433325 ?auto_433326 ) ) ( not ( = ?auto_433325 ?auto_433327 ) ) ( not ( = ?auto_433325 ?auto_433328 ) ) ( not ( = ?auto_433325 ?auto_433329 ) ) ( not ( = ?auto_433325 ?auto_433330 ) ) ( not ( = ?auto_433325 ?auto_433331 ) ) ( not ( = ?auto_433325 ?auto_433332 ) ) ( not ( = ?auto_433325 ?auto_433333 ) ) ( not ( = ?auto_433325 ?auto_433334 ) ) ( not ( = ?auto_433325 ?auto_433335 ) ) ( not ( = ?auto_433325 ?auto_433336 ) ) ( not ( = ?auto_433325 ?auto_433337 ) ) ( not ( = ?auto_433325 ?auto_433338 ) ) ( not ( = ?auto_433326 ?auto_433327 ) ) ( not ( = ?auto_433326 ?auto_433328 ) ) ( not ( = ?auto_433326 ?auto_433329 ) ) ( not ( = ?auto_433326 ?auto_433330 ) ) ( not ( = ?auto_433326 ?auto_433331 ) ) ( not ( = ?auto_433326 ?auto_433332 ) ) ( not ( = ?auto_433326 ?auto_433333 ) ) ( not ( = ?auto_433326 ?auto_433334 ) ) ( not ( = ?auto_433326 ?auto_433335 ) ) ( not ( = ?auto_433326 ?auto_433336 ) ) ( not ( = ?auto_433326 ?auto_433337 ) ) ( not ( = ?auto_433326 ?auto_433338 ) ) ( not ( = ?auto_433327 ?auto_433328 ) ) ( not ( = ?auto_433327 ?auto_433329 ) ) ( not ( = ?auto_433327 ?auto_433330 ) ) ( not ( = ?auto_433327 ?auto_433331 ) ) ( not ( = ?auto_433327 ?auto_433332 ) ) ( not ( = ?auto_433327 ?auto_433333 ) ) ( not ( = ?auto_433327 ?auto_433334 ) ) ( not ( = ?auto_433327 ?auto_433335 ) ) ( not ( = ?auto_433327 ?auto_433336 ) ) ( not ( = ?auto_433327 ?auto_433337 ) ) ( not ( = ?auto_433327 ?auto_433338 ) ) ( not ( = ?auto_433328 ?auto_433329 ) ) ( not ( = ?auto_433328 ?auto_433330 ) ) ( not ( = ?auto_433328 ?auto_433331 ) ) ( not ( = ?auto_433328 ?auto_433332 ) ) ( not ( = ?auto_433328 ?auto_433333 ) ) ( not ( = ?auto_433328 ?auto_433334 ) ) ( not ( = ?auto_433328 ?auto_433335 ) ) ( not ( = ?auto_433328 ?auto_433336 ) ) ( not ( = ?auto_433328 ?auto_433337 ) ) ( not ( = ?auto_433328 ?auto_433338 ) ) ( not ( = ?auto_433329 ?auto_433330 ) ) ( not ( = ?auto_433329 ?auto_433331 ) ) ( not ( = ?auto_433329 ?auto_433332 ) ) ( not ( = ?auto_433329 ?auto_433333 ) ) ( not ( = ?auto_433329 ?auto_433334 ) ) ( not ( = ?auto_433329 ?auto_433335 ) ) ( not ( = ?auto_433329 ?auto_433336 ) ) ( not ( = ?auto_433329 ?auto_433337 ) ) ( not ( = ?auto_433329 ?auto_433338 ) ) ( not ( = ?auto_433330 ?auto_433331 ) ) ( not ( = ?auto_433330 ?auto_433332 ) ) ( not ( = ?auto_433330 ?auto_433333 ) ) ( not ( = ?auto_433330 ?auto_433334 ) ) ( not ( = ?auto_433330 ?auto_433335 ) ) ( not ( = ?auto_433330 ?auto_433336 ) ) ( not ( = ?auto_433330 ?auto_433337 ) ) ( not ( = ?auto_433330 ?auto_433338 ) ) ( not ( = ?auto_433331 ?auto_433332 ) ) ( not ( = ?auto_433331 ?auto_433333 ) ) ( not ( = ?auto_433331 ?auto_433334 ) ) ( not ( = ?auto_433331 ?auto_433335 ) ) ( not ( = ?auto_433331 ?auto_433336 ) ) ( not ( = ?auto_433331 ?auto_433337 ) ) ( not ( = ?auto_433331 ?auto_433338 ) ) ( not ( = ?auto_433332 ?auto_433333 ) ) ( not ( = ?auto_433332 ?auto_433334 ) ) ( not ( = ?auto_433332 ?auto_433335 ) ) ( not ( = ?auto_433332 ?auto_433336 ) ) ( not ( = ?auto_433332 ?auto_433337 ) ) ( not ( = ?auto_433332 ?auto_433338 ) ) ( not ( = ?auto_433333 ?auto_433334 ) ) ( not ( = ?auto_433333 ?auto_433335 ) ) ( not ( = ?auto_433333 ?auto_433336 ) ) ( not ( = ?auto_433333 ?auto_433337 ) ) ( not ( = ?auto_433333 ?auto_433338 ) ) ( not ( = ?auto_433334 ?auto_433335 ) ) ( not ( = ?auto_433334 ?auto_433336 ) ) ( not ( = ?auto_433334 ?auto_433337 ) ) ( not ( = ?auto_433334 ?auto_433338 ) ) ( not ( = ?auto_433335 ?auto_433336 ) ) ( not ( = ?auto_433335 ?auto_433337 ) ) ( not ( = ?auto_433335 ?auto_433338 ) ) ( not ( = ?auto_433336 ?auto_433337 ) ) ( not ( = ?auto_433336 ?auto_433338 ) ) ( not ( = ?auto_433337 ?auto_433338 ) ) ( ON ?auto_433336 ?auto_433337 ) ( ON ?auto_433335 ?auto_433336 ) ( ON ?auto_433334 ?auto_433335 ) ( ON ?auto_433333 ?auto_433334 ) ( ON ?auto_433332 ?auto_433333 ) ( ON ?auto_433331 ?auto_433332 ) ( ON ?auto_433330 ?auto_433331 ) ( ON ?auto_433329 ?auto_433330 ) ( ON ?auto_433328 ?auto_433329 ) ( CLEAR ?auto_433326 ) ( ON ?auto_433327 ?auto_433328 ) ( CLEAR ?auto_433327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_433323 ?auto_433324 ?auto_433325 ?auto_433326 ?auto_433327 )
      ( MAKE-15PILE ?auto_433323 ?auto_433324 ?auto_433325 ?auto_433326 ?auto_433327 ?auto_433328 ?auto_433329 ?auto_433330 ?auto_433331 ?auto_433332 ?auto_433333 ?auto_433334 ?auto_433335 ?auto_433336 ?auto_433337 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433354 - BLOCK
      ?auto_433355 - BLOCK
      ?auto_433356 - BLOCK
      ?auto_433357 - BLOCK
      ?auto_433358 - BLOCK
      ?auto_433359 - BLOCK
      ?auto_433360 - BLOCK
      ?auto_433361 - BLOCK
      ?auto_433362 - BLOCK
      ?auto_433363 - BLOCK
      ?auto_433364 - BLOCK
      ?auto_433365 - BLOCK
      ?auto_433366 - BLOCK
      ?auto_433367 - BLOCK
      ?auto_433368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433368 ) ( ON-TABLE ?auto_433354 ) ( ON ?auto_433355 ?auto_433354 ) ( ON ?auto_433356 ?auto_433355 ) ( ON ?auto_433357 ?auto_433356 ) ( not ( = ?auto_433354 ?auto_433355 ) ) ( not ( = ?auto_433354 ?auto_433356 ) ) ( not ( = ?auto_433354 ?auto_433357 ) ) ( not ( = ?auto_433354 ?auto_433358 ) ) ( not ( = ?auto_433354 ?auto_433359 ) ) ( not ( = ?auto_433354 ?auto_433360 ) ) ( not ( = ?auto_433354 ?auto_433361 ) ) ( not ( = ?auto_433354 ?auto_433362 ) ) ( not ( = ?auto_433354 ?auto_433363 ) ) ( not ( = ?auto_433354 ?auto_433364 ) ) ( not ( = ?auto_433354 ?auto_433365 ) ) ( not ( = ?auto_433354 ?auto_433366 ) ) ( not ( = ?auto_433354 ?auto_433367 ) ) ( not ( = ?auto_433354 ?auto_433368 ) ) ( not ( = ?auto_433355 ?auto_433356 ) ) ( not ( = ?auto_433355 ?auto_433357 ) ) ( not ( = ?auto_433355 ?auto_433358 ) ) ( not ( = ?auto_433355 ?auto_433359 ) ) ( not ( = ?auto_433355 ?auto_433360 ) ) ( not ( = ?auto_433355 ?auto_433361 ) ) ( not ( = ?auto_433355 ?auto_433362 ) ) ( not ( = ?auto_433355 ?auto_433363 ) ) ( not ( = ?auto_433355 ?auto_433364 ) ) ( not ( = ?auto_433355 ?auto_433365 ) ) ( not ( = ?auto_433355 ?auto_433366 ) ) ( not ( = ?auto_433355 ?auto_433367 ) ) ( not ( = ?auto_433355 ?auto_433368 ) ) ( not ( = ?auto_433356 ?auto_433357 ) ) ( not ( = ?auto_433356 ?auto_433358 ) ) ( not ( = ?auto_433356 ?auto_433359 ) ) ( not ( = ?auto_433356 ?auto_433360 ) ) ( not ( = ?auto_433356 ?auto_433361 ) ) ( not ( = ?auto_433356 ?auto_433362 ) ) ( not ( = ?auto_433356 ?auto_433363 ) ) ( not ( = ?auto_433356 ?auto_433364 ) ) ( not ( = ?auto_433356 ?auto_433365 ) ) ( not ( = ?auto_433356 ?auto_433366 ) ) ( not ( = ?auto_433356 ?auto_433367 ) ) ( not ( = ?auto_433356 ?auto_433368 ) ) ( not ( = ?auto_433357 ?auto_433358 ) ) ( not ( = ?auto_433357 ?auto_433359 ) ) ( not ( = ?auto_433357 ?auto_433360 ) ) ( not ( = ?auto_433357 ?auto_433361 ) ) ( not ( = ?auto_433357 ?auto_433362 ) ) ( not ( = ?auto_433357 ?auto_433363 ) ) ( not ( = ?auto_433357 ?auto_433364 ) ) ( not ( = ?auto_433357 ?auto_433365 ) ) ( not ( = ?auto_433357 ?auto_433366 ) ) ( not ( = ?auto_433357 ?auto_433367 ) ) ( not ( = ?auto_433357 ?auto_433368 ) ) ( not ( = ?auto_433358 ?auto_433359 ) ) ( not ( = ?auto_433358 ?auto_433360 ) ) ( not ( = ?auto_433358 ?auto_433361 ) ) ( not ( = ?auto_433358 ?auto_433362 ) ) ( not ( = ?auto_433358 ?auto_433363 ) ) ( not ( = ?auto_433358 ?auto_433364 ) ) ( not ( = ?auto_433358 ?auto_433365 ) ) ( not ( = ?auto_433358 ?auto_433366 ) ) ( not ( = ?auto_433358 ?auto_433367 ) ) ( not ( = ?auto_433358 ?auto_433368 ) ) ( not ( = ?auto_433359 ?auto_433360 ) ) ( not ( = ?auto_433359 ?auto_433361 ) ) ( not ( = ?auto_433359 ?auto_433362 ) ) ( not ( = ?auto_433359 ?auto_433363 ) ) ( not ( = ?auto_433359 ?auto_433364 ) ) ( not ( = ?auto_433359 ?auto_433365 ) ) ( not ( = ?auto_433359 ?auto_433366 ) ) ( not ( = ?auto_433359 ?auto_433367 ) ) ( not ( = ?auto_433359 ?auto_433368 ) ) ( not ( = ?auto_433360 ?auto_433361 ) ) ( not ( = ?auto_433360 ?auto_433362 ) ) ( not ( = ?auto_433360 ?auto_433363 ) ) ( not ( = ?auto_433360 ?auto_433364 ) ) ( not ( = ?auto_433360 ?auto_433365 ) ) ( not ( = ?auto_433360 ?auto_433366 ) ) ( not ( = ?auto_433360 ?auto_433367 ) ) ( not ( = ?auto_433360 ?auto_433368 ) ) ( not ( = ?auto_433361 ?auto_433362 ) ) ( not ( = ?auto_433361 ?auto_433363 ) ) ( not ( = ?auto_433361 ?auto_433364 ) ) ( not ( = ?auto_433361 ?auto_433365 ) ) ( not ( = ?auto_433361 ?auto_433366 ) ) ( not ( = ?auto_433361 ?auto_433367 ) ) ( not ( = ?auto_433361 ?auto_433368 ) ) ( not ( = ?auto_433362 ?auto_433363 ) ) ( not ( = ?auto_433362 ?auto_433364 ) ) ( not ( = ?auto_433362 ?auto_433365 ) ) ( not ( = ?auto_433362 ?auto_433366 ) ) ( not ( = ?auto_433362 ?auto_433367 ) ) ( not ( = ?auto_433362 ?auto_433368 ) ) ( not ( = ?auto_433363 ?auto_433364 ) ) ( not ( = ?auto_433363 ?auto_433365 ) ) ( not ( = ?auto_433363 ?auto_433366 ) ) ( not ( = ?auto_433363 ?auto_433367 ) ) ( not ( = ?auto_433363 ?auto_433368 ) ) ( not ( = ?auto_433364 ?auto_433365 ) ) ( not ( = ?auto_433364 ?auto_433366 ) ) ( not ( = ?auto_433364 ?auto_433367 ) ) ( not ( = ?auto_433364 ?auto_433368 ) ) ( not ( = ?auto_433365 ?auto_433366 ) ) ( not ( = ?auto_433365 ?auto_433367 ) ) ( not ( = ?auto_433365 ?auto_433368 ) ) ( not ( = ?auto_433366 ?auto_433367 ) ) ( not ( = ?auto_433366 ?auto_433368 ) ) ( not ( = ?auto_433367 ?auto_433368 ) ) ( ON ?auto_433367 ?auto_433368 ) ( ON ?auto_433366 ?auto_433367 ) ( ON ?auto_433365 ?auto_433366 ) ( ON ?auto_433364 ?auto_433365 ) ( ON ?auto_433363 ?auto_433364 ) ( ON ?auto_433362 ?auto_433363 ) ( ON ?auto_433361 ?auto_433362 ) ( ON ?auto_433360 ?auto_433361 ) ( ON ?auto_433359 ?auto_433360 ) ( CLEAR ?auto_433357 ) ( ON ?auto_433358 ?auto_433359 ) ( CLEAR ?auto_433358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_433354 ?auto_433355 ?auto_433356 ?auto_433357 ?auto_433358 )
      ( MAKE-15PILE ?auto_433354 ?auto_433355 ?auto_433356 ?auto_433357 ?auto_433358 ?auto_433359 ?auto_433360 ?auto_433361 ?auto_433362 ?auto_433363 ?auto_433364 ?auto_433365 ?auto_433366 ?auto_433367 ?auto_433368 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433384 - BLOCK
      ?auto_433385 - BLOCK
      ?auto_433386 - BLOCK
      ?auto_433387 - BLOCK
      ?auto_433388 - BLOCK
      ?auto_433389 - BLOCK
      ?auto_433390 - BLOCK
      ?auto_433391 - BLOCK
      ?auto_433392 - BLOCK
      ?auto_433393 - BLOCK
      ?auto_433394 - BLOCK
      ?auto_433395 - BLOCK
      ?auto_433396 - BLOCK
      ?auto_433397 - BLOCK
      ?auto_433398 - BLOCK
    )
    :vars
    (
      ?auto_433399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433398 ?auto_433399 ) ( ON-TABLE ?auto_433384 ) ( ON ?auto_433385 ?auto_433384 ) ( ON ?auto_433386 ?auto_433385 ) ( not ( = ?auto_433384 ?auto_433385 ) ) ( not ( = ?auto_433384 ?auto_433386 ) ) ( not ( = ?auto_433384 ?auto_433387 ) ) ( not ( = ?auto_433384 ?auto_433388 ) ) ( not ( = ?auto_433384 ?auto_433389 ) ) ( not ( = ?auto_433384 ?auto_433390 ) ) ( not ( = ?auto_433384 ?auto_433391 ) ) ( not ( = ?auto_433384 ?auto_433392 ) ) ( not ( = ?auto_433384 ?auto_433393 ) ) ( not ( = ?auto_433384 ?auto_433394 ) ) ( not ( = ?auto_433384 ?auto_433395 ) ) ( not ( = ?auto_433384 ?auto_433396 ) ) ( not ( = ?auto_433384 ?auto_433397 ) ) ( not ( = ?auto_433384 ?auto_433398 ) ) ( not ( = ?auto_433384 ?auto_433399 ) ) ( not ( = ?auto_433385 ?auto_433386 ) ) ( not ( = ?auto_433385 ?auto_433387 ) ) ( not ( = ?auto_433385 ?auto_433388 ) ) ( not ( = ?auto_433385 ?auto_433389 ) ) ( not ( = ?auto_433385 ?auto_433390 ) ) ( not ( = ?auto_433385 ?auto_433391 ) ) ( not ( = ?auto_433385 ?auto_433392 ) ) ( not ( = ?auto_433385 ?auto_433393 ) ) ( not ( = ?auto_433385 ?auto_433394 ) ) ( not ( = ?auto_433385 ?auto_433395 ) ) ( not ( = ?auto_433385 ?auto_433396 ) ) ( not ( = ?auto_433385 ?auto_433397 ) ) ( not ( = ?auto_433385 ?auto_433398 ) ) ( not ( = ?auto_433385 ?auto_433399 ) ) ( not ( = ?auto_433386 ?auto_433387 ) ) ( not ( = ?auto_433386 ?auto_433388 ) ) ( not ( = ?auto_433386 ?auto_433389 ) ) ( not ( = ?auto_433386 ?auto_433390 ) ) ( not ( = ?auto_433386 ?auto_433391 ) ) ( not ( = ?auto_433386 ?auto_433392 ) ) ( not ( = ?auto_433386 ?auto_433393 ) ) ( not ( = ?auto_433386 ?auto_433394 ) ) ( not ( = ?auto_433386 ?auto_433395 ) ) ( not ( = ?auto_433386 ?auto_433396 ) ) ( not ( = ?auto_433386 ?auto_433397 ) ) ( not ( = ?auto_433386 ?auto_433398 ) ) ( not ( = ?auto_433386 ?auto_433399 ) ) ( not ( = ?auto_433387 ?auto_433388 ) ) ( not ( = ?auto_433387 ?auto_433389 ) ) ( not ( = ?auto_433387 ?auto_433390 ) ) ( not ( = ?auto_433387 ?auto_433391 ) ) ( not ( = ?auto_433387 ?auto_433392 ) ) ( not ( = ?auto_433387 ?auto_433393 ) ) ( not ( = ?auto_433387 ?auto_433394 ) ) ( not ( = ?auto_433387 ?auto_433395 ) ) ( not ( = ?auto_433387 ?auto_433396 ) ) ( not ( = ?auto_433387 ?auto_433397 ) ) ( not ( = ?auto_433387 ?auto_433398 ) ) ( not ( = ?auto_433387 ?auto_433399 ) ) ( not ( = ?auto_433388 ?auto_433389 ) ) ( not ( = ?auto_433388 ?auto_433390 ) ) ( not ( = ?auto_433388 ?auto_433391 ) ) ( not ( = ?auto_433388 ?auto_433392 ) ) ( not ( = ?auto_433388 ?auto_433393 ) ) ( not ( = ?auto_433388 ?auto_433394 ) ) ( not ( = ?auto_433388 ?auto_433395 ) ) ( not ( = ?auto_433388 ?auto_433396 ) ) ( not ( = ?auto_433388 ?auto_433397 ) ) ( not ( = ?auto_433388 ?auto_433398 ) ) ( not ( = ?auto_433388 ?auto_433399 ) ) ( not ( = ?auto_433389 ?auto_433390 ) ) ( not ( = ?auto_433389 ?auto_433391 ) ) ( not ( = ?auto_433389 ?auto_433392 ) ) ( not ( = ?auto_433389 ?auto_433393 ) ) ( not ( = ?auto_433389 ?auto_433394 ) ) ( not ( = ?auto_433389 ?auto_433395 ) ) ( not ( = ?auto_433389 ?auto_433396 ) ) ( not ( = ?auto_433389 ?auto_433397 ) ) ( not ( = ?auto_433389 ?auto_433398 ) ) ( not ( = ?auto_433389 ?auto_433399 ) ) ( not ( = ?auto_433390 ?auto_433391 ) ) ( not ( = ?auto_433390 ?auto_433392 ) ) ( not ( = ?auto_433390 ?auto_433393 ) ) ( not ( = ?auto_433390 ?auto_433394 ) ) ( not ( = ?auto_433390 ?auto_433395 ) ) ( not ( = ?auto_433390 ?auto_433396 ) ) ( not ( = ?auto_433390 ?auto_433397 ) ) ( not ( = ?auto_433390 ?auto_433398 ) ) ( not ( = ?auto_433390 ?auto_433399 ) ) ( not ( = ?auto_433391 ?auto_433392 ) ) ( not ( = ?auto_433391 ?auto_433393 ) ) ( not ( = ?auto_433391 ?auto_433394 ) ) ( not ( = ?auto_433391 ?auto_433395 ) ) ( not ( = ?auto_433391 ?auto_433396 ) ) ( not ( = ?auto_433391 ?auto_433397 ) ) ( not ( = ?auto_433391 ?auto_433398 ) ) ( not ( = ?auto_433391 ?auto_433399 ) ) ( not ( = ?auto_433392 ?auto_433393 ) ) ( not ( = ?auto_433392 ?auto_433394 ) ) ( not ( = ?auto_433392 ?auto_433395 ) ) ( not ( = ?auto_433392 ?auto_433396 ) ) ( not ( = ?auto_433392 ?auto_433397 ) ) ( not ( = ?auto_433392 ?auto_433398 ) ) ( not ( = ?auto_433392 ?auto_433399 ) ) ( not ( = ?auto_433393 ?auto_433394 ) ) ( not ( = ?auto_433393 ?auto_433395 ) ) ( not ( = ?auto_433393 ?auto_433396 ) ) ( not ( = ?auto_433393 ?auto_433397 ) ) ( not ( = ?auto_433393 ?auto_433398 ) ) ( not ( = ?auto_433393 ?auto_433399 ) ) ( not ( = ?auto_433394 ?auto_433395 ) ) ( not ( = ?auto_433394 ?auto_433396 ) ) ( not ( = ?auto_433394 ?auto_433397 ) ) ( not ( = ?auto_433394 ?auto_433398 ) ) ( not ( = ?auto_433394 ?auto_433399 ) ) ( not ( = ?auto_433395 ?auto_433396 ) ) ( not ( = ?auto_433395 ?auto_433397 ) ) ( not ( = ?auto_433395 ?auto_433398 ) ) ( not ( = ?auto_433395 ?auto_433399 ) ) ( not ( = ?auto_433396 ?auto_433397 ) ) ( not ( = ?auto_433396 ?auto_433398 ) ) ( not ( = ?auto_433396 ?auto_433399 ) ) ( not ( = ?auto_433397 ?auto_433398 ) ) ( not ( = ?auto_433397 ?auto_433399 ) ) ( not ( = ?auto_433398 ?auto_433399 ) ) ( ON ?auto_433397 ?auto_433398 ) ( ON ?auto_433396 ?auto_433397 ) ( ON ?auto_433395 ?auto_433396 ) ( ON ?auto_433394 ?auto_433395 ) ( ON ?auto_433393 ?auto_433394 ) ( ON ?auto_433392 ?auto_433393 ) ( ON ?auto_433391 ?auto_433392 ) ( ON ?auto_433390 ?auto_433391 ) ( ON ?auto_433389 ?auto_433390 ) ( ON ?auto_433388 ?auto_433389 ) ( CLEAR ?auto_433386 ) ( ON ?auto_433387 ?auto_433388 ) ( CLEAR ?auto_433387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_433384 ?auto_433385 ?auto_433386 ?auto_433387 )
      ( MAKE-15PILE ?auto_433384 ?auto_433385 ?auto_433386 ?auto_433387 ?auto_433388 ?auto_433389 ?auto_433390 ?auto_433391 ?auto_433392 ?auto_433393 ?auto_433394 ?auto_433395 ?auto_433396 ?auto_433397 ?auto_433398 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433415 - BLOCK
      ?auto_433416 - BLOCK
      ?auto_433417 - BLOCK
      ?auto_433418 - BLOCK
      ?auto_433419 - BLOCK
      ?auto_433420 - BLOCK
      ?auto_433421 - BLOCK
      ?auto_433422 - BLOCK
      ?auto_433423 - BLOCK
      ?auto_433424 - BLOCK
      ?auto_433425 - BLOCK
      ?auto_433426 - BLOCK
      ?auto_433427 - BLOCK
      ?auto_433428 - BLOCK
      ?auto_433429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433429 ) ( ON-TABLE ?auto_433415 ) ( ON ?auto_433416 ?auto_433415 ) ( ON ?auto_433417 ?auto_433416 ) ( not ( = ?auto_433415 ?auto_433416 ) ) ( not ( = ?auto_433415 ?auto_433417 ) ) ( not ( = ?auto_433415 ?auto_433418 ) ) ( not ( = ?auto_433415 ?auto_433419 ) ) ( not ( = ?auto_433415 ?auto_433420 ) ) ( not ( = ?auto_433415 ?auto_433421 ) ) ( not ( = ?auto_433415 ?auto_433422 ) ) ( not ( = ?auto_433415 ?auto_433423 ) ) ( not ( = ?auto_433415 ?auto_433424 ) ) ( not ( = ?auto_433415 ?auto_433425 ) ) ( not ( = ?auto_433415 ?auto_433426 ) ) ( not ( = ?auto_433415 ?auto_433427 ) ) ( not ( = ?auto_433415 ?auto_433428 ) ) ( not ( = ?auto_433415 ?auto_433429 ) ) ( not ( = ?auto_433416 ?auto_433417 ) ) ( not ( = ?auto_433416 ?auto_433418 ) ) ( not ( = ?auto_433416 ?auto_433419 ) ) ( not ( = ?auto_433416 ?auto_433420 ) ) ( not ( = ?auto_433416 ?auto_433421 ) ) ( not ( = ?auto_433416 ?auto_433422 ) ) ( not ( = ?auto_433416 ?auto_433423 ) ) ( not ( = ?auto_433416 ?auto_433424 ) ) ( not ( = ?auto_433416 ?auto_433425 ) ) ( not ( = ?auto_433416 ?auto_433426 ) ) ( not ( = ?auto_433416 ?auto_433427 ) ) ( not ( = ?auto_433416 ?auto_433428 ) ) ( not ( = ?auto_433416 ?auto_433429 ) ) ( not ( = ?auto_433417 ?auto_433418 ) ) ( not ( = ?auto_433417 ?auto_433419 ) ) ( not ( = ?auto_433417 ?auto_433420 ) ) ( not ( = ?auto_433417 ?auto_433421 ) ) ( not ( = ?auto_433417 ?auto_433422 ) ) ( not ( = ?auto_433417 ?auto_433423 ) ) ( not ( = ?auto_433417 ?auto_433424 ) ) ( not ( = ?auto_433417 ?auto_433425 ) ) ( not ( = ?auto_433417 ?auto_433426 ) ) ( not ( = ?auto_433417 ?auto_433427 ) ) ( not ( = ?auto_433417 ?auto_433428 ) ) ( not ( = ?auto_433417 ?auto_433429 ) ) ( not ( = ?auto_433418 ?auto_433419 ) ) ( not ( = ?auto_433418 ?auto_433420 ) ) ( not ( = ?auto_433418 ?auto_433421 ) ) ( not ( = ?auto_433418 ?auto_433422 ) ) ( not ( = ?auto_433418 ?auto_433423 ) ) ( not ( = ?auto_433418 ?auto_433424 ) ) ( not ( = ?auto_433418 ?auto_433425 ) ) ( not ( = ?auto_433418 ?auto_433426 ) ) ( not ( = ?auto_433418 ?auto_433427 ) ) ( not ( = ?auto_433418 ?auto_433428 ) ) ( not ( = ?auto_433418 ?auto_433429 ) ) ( not ( = ?auto_433419 ?auto_433420 ) ) ( not ( = ?auto_433419 ?auto_433421 ) ) ( not ( = ?auto_433419 ?auto_433422 ) ) ( not ( = ?auto_433419 ?auto_433423 ) ) ( not ( = ?auto_433419 ?auto_433424 ) ) ( not ( = ?auto_433419 ?auto_433425 ) ) ( not ( = ?auto_433419 ?auto_433426 ) ) ( not ( = ?auto_433419 ?auto_433427 ) ) ( not ( = ?auto_433419 ?auto_433428 ) ) ( not ( = ?auto_433419 ?auto_433429 ) ) ( not ( = ?auto_433420 ?auto_433421 ) ) ( not ( = ?auto_433420 ?auto_433422 ) ) ( not ( = ?auto_433420 ?auto_433423 ) ) ( not ( = ?auto_433420 ?auto_433424 ) ) ( not ( = ?auto_433420 ?auto_433425 ) ) ( not ( = ?auto_433420 ?auto_433426 ) ) ( not ( = ?auto_433420 ?auto_433427 ) ) ( not ( = ?auto_433420 ?auto_433428 ) ) ( not ( = ?auto_433420 ?auto_433429 ) ) ( not ( = ?auto_433421 ?auto_433422 ) ) ( not ( = ?auto_433421 ?auto_433423 ) ) ( not ( = ?auto_433421 ?auto_433424 ) ) ( not ( = ?auto_433421 ?auto_433425 ) ) ( not ( = ?auto_433421 ?auto_433426 ) ) ( not ( = ?auto_433421 ?auto_433427 ) ) ( not ( = ?auto_433421 ?auto_433428 ) ) ( not ( = ?auto_433421 ?auto_433429 ) ) ( not ( = ?auto_433422 ?auto_433423 ) ) ( not ( = ?auto_433422 ?auto_433424 ) ) ( not ( = ?auto_433422 ?auto_433425 ) ) ( not ( = ?auto_433422 ?auto_433426 ) ) ( not ( = ?auto_433422 ?auto_433427 ) ) ( not ( = ?auto_433422 ?auto_433428 ) ) ( not ( = ?auto_433422 ?auto_433429 ) ) ( not ( = ?auto_433423 ?auto_433424 ) ) ( not ( = ?auto_433423 ?auto_433425 ) ) ( not ( = ?auto_433423 ?auto_433426 ) ) ( not ( = ?auto_433423 ?auto_433427 ) ) ( not ( = ?auto_433423 ?auto_433428 ) ) ( not ( = ?auto_433423 ?auto_433429 ) ) ( not ( = ?auto_433424 ?auto_433425 ) ) ( not ( = ?auto_433424 ?auto_433426 ) ) ( not ( = ?auto_433424 ?auto_433427 ) ) ( not ( = ?auto_433424 ?auto_433428 ) ) ( not ( = ?auto_433424 ?auto_433429 ) ) ( not ( = ?auto_433425 ?auto_433426 ) ) ( not ( = ?auto_433425 ?auto_433427 ) ) ( not ( = ?auto_433425 ?auto_433428 ) ) ( not ( = ?auto_433425 ?auto_433429 ) ) ( not ( = ?auto_433426 ?auto_433427 ) ) ( not ( = ?auto_433426 ?auto_433428 ) ) ( not ( = ?auto_433426 ?auto_433429 ) ) ( not ( = ?auto_433427 ?auto_433428 ) ) ( not ( = ?auto_433427 ?auto_433429 ) ) ( not ( = ?auto_433428 ?auto_433429 ) ) ( ON ?auto_433428 ?auto_433429 ) ( ON ?auto_433427 ?auto_433428 ) ( ON ?auto_433426 ?auto_433427 ) ( ON ?auto_433425 ?auto_433426 ) ( ON ?auto_433424 ?auto_433425 ) ( ON ?auto_433423 ?auto_433424 ) ( ON ?auto_433422 ?auto_433423 ) ( ON ?auto_433421 ?auto_433422 ) ( ON ?auto_433420 ?auto_433421 ) ( ON ?auto_433419 ?auto_433420 ) ( CLEAR ?auto_433417 ) ( ON ?auto_433418 ?auto_433419 ) ( CLEAR ?auto_433418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_433415 ?auto_433416 ?auto_433417 ?auto_433418 )
      ( MAKE-15PILE ?auto_433415 ?auto_433416 ?auto_433417 ?auto_433418 ?auto_433419 ?auto_433420 ?auto_433421 ?auto_433422 ?auto_433423 ?auto_433424 ?auto_433425 ?auto_433426 ?auto_433427 ?auto_433428 ?auto_433429 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433445 - BLOCK
      ?auto_433446 - BLOCK
      ?auto_433447 - BLOCK
      ?auto_433448 - BLOCK
      ?auto_433449 - BLOCK
      ?auto_433450 - BLOCK
      ?auto_433451 - BLOCK
      ?auto_433452 - BLOCK
      ?auto_433453 - BLOCK
      ?auto_433454 - BLOCK
      ?auto_433455 - BLOCK
      ?auto_433456 - BLOCK
      ?auto_433457 - BLOCK
      ?auto_433458 - BLOCK
      ?auto_433459 - BLOCK
    )
    :vars
    (
      ?auto_433460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433459 ?auto_433460 ) ( ON-TABLE ?auto_433445 ) ( ON ?auto_433446 ?auto_433445 ) ( not ( = ?auto_433445 ?auto_433446 ) ) ( not ( = ?auto_433445 ?auto_433447 ) ) ( not ( = ?auto_433445 ?auto_433448 ) ) ( not ( = ?auto_433445 ?auto_433449 ) ) ( not ( = ?auto_433445 ?auto_433450 ) ) ( not ( = ?auto_433445 ?auto_433451 ) ) ( not ( = ?auto_433445 ?auto_433452 ) ) ( not ( = ?auto_433445 ?auto_433453 ) ) ( not ( = ?auto_433445 ?auto_433454 ) ) ( not ( = ?auto_433445 ?auto_433455 ) ) ( not ( = ?auto_433445 ?auto_433456 ) ) ( not ( = ?auto_433445 ?auto_433457 ) ) ( not ( = ?auto_433445 ?auto_433458 ) ) ( not ( = ?auto_433445 ?auto_433459 ) ) ( not ( = ?auto_433445 ?auto_433460 ) ) ( not ( = ?auto_433446 ?auto_433447 ) ) ( not ( = ?auto_433446 ?auto_433448 ) ) ( not ( = ?auto_433446 ?auto_433449 ) ) ( not ( = ?auto_433446 ?auto_433450 ) ) ( not ( = ?auto_433446 ?auto_433451 ) ) ( not ( = ?auto_433446 ?auto_433452 ) ) ( not ( = ?auto_433446 ?auto_433453 ) ) ( not ( = ?auto_433446 ?auto_433454 ) ) ( not ( = ?auto_433446 ?auto_433455 ) ) ( not ( = ?auto_433446 ?auto_433456 ) ) ( not ( = ?auto_433446 ?auto_433457 ) ) ( not ( = ?auto_433446 ?auto_433458 ) ) ( not ( = ?auto_433446 ?auto_433459 ) ) ( not ( = ?auto_433446 ?auto_433460 ) ) ( not ( = ?auto_433447 ?auto_433448 ) ) ( not ( = ?auto_433447 ?auto_433449 ) ) ( not ( = ?auto_433447 ?auto_433450 ) ) ( not ( = ?auto_433447 ?auto_433451 ) ) ( not ( = ?auto_433447 ?auto_433452 ) ) ( not ( = ?auto_433447 ?auto_433453 ) ) ( not ( = ?auto_433447 ?auto_433454 ) ) ( not ( = ?auto_433447 ?auto_433455 ) ) ( not ( = ?auto_433447 ?auto_433456 ) ) ( not ( = ?auto_433447 ?auto_433457 ) ) ( not ( = ?auto_433447 ?auto_433458 ) ) ( not ( = ?auto_433447 ?auto_433459 ) ) ( not ( = ?auto_433447 ?auto_433460 ) ) ( not ( = ?auto_433448 ?auto_433449 ) ) ( not ( = ?auto_433448 ?auto_433450 ) ) ( not ( = ?auto_433448 ?auto_433451 ) ) ( not ( = ?auto_433448 ?auto_433452 ) ) ( not ( = ?auto_433448 ?auto_433453 ) ) ( not ( = ?auto_433448 ?auto_433454 ) ) ( not ( = ?auto_433448 ?auto_433455 ) ) ( not ( = ?auto_433448 ?auto_433456 ) ) ( not ( = ?auto_433448 ?auto_433457 ) ) ( not ( = ?auto_433448 ?auto_433458 ) ) ( not ( = ?auto_433448 ?auto_433459 ) ) ( not ( = ?auto_433448 ?auto_433460 ) ) ( not ( = ?auto_433449 ?auto_433450 ) ) ( not ( = ?auto_433449 ?auto_433451 ) ) ( not ( = ?auto_433449 ?auto_433452 ) ) ( not ( = ?auto_433449 ?auto_433453 ) ) ( not ( = ?auto_433449 ?auto_433454 ) ) ( not ( = ?auto_433449 ?auto_433455 ) ) ( not ( = ?auto_433449 ?auto_433456 ) ) ( not ( = ?auto_433449 ?auto_433457 ) ) ( not ( = ?auto_433449 ?auto_433458 ) ) ( not ( = ?auto_433449 ?auto_433459 ) ) ( not ( = ?auto_433449 ?auto_433460 ) ) ( not ( = ?auto_433450 ?auto_433451 ) ) ( not ( = ?auto_433450 ?auto_433452 ) ) ( not ( = ?auto_433450 ?auto_433453 ) ) ( not ( = ?auto_433450 ?auto_433454 ) ) ( not ( = ?auto_433450 ?auto_433455 ) ) ( not ( = ?auto_433450 ?auto_433456 ) ) ( not ( = ?auto_433450 ?auto_433457 ) ) ( not ( = ?auto_433450 ?auto_433458 ) ) ( not ( = ?auto_433450 ?auto_433459 ) ) ( not ( = ?auto_433450 ?auto_433460 ) ) ( not ( = ?auto_433451 ?auto_433452 ) ) ( not ( = ?auto_433451 ?auto_433453 ) ) ( not ( = ?auto_433451 ?auto_433454 ) ) ( not ( = ?auto_433451 ?auto_433455 ) ) ( not ( = ?auto_433451 ?auto_433456 ) ) ( not ( = ?auto_433451 ?auto_433457 ) ) ( not ( = ?auto_433451 ?auto_433458 ) ) ( not ( = ?auto_433451 ?auto_433459 ) ) ( not ( = ?auto_433451 ?auto_433460 ) ) ( not ( = ?auto_433452 ?auto_433453 ) ) ( not ( = ?auto_433452 ?auto_433454 ) ) ( not ( = ?auto_433452 ?auto_433455 ) ) ( not ( = ?auto_433452 ?auto_433456 ) ) ( not ( = ?auto_433452 ?auto_433457 ) ) ( not ( = ?auto_433452 ?auto_433458 ) ) ( not ( = ?auto_433452 ?auto_433459 ) ) ( not ( = ?auto_433452 ?auto_433460 ) ) ( not ( = ?auto_433453 ?auto_433454 ) ) ( not ( = ?auto_433453 ?auto_433455 ) ) ( not ( = ?auto_433453 ?auto_433456 ) ) ( not ( = ?auto_433453 ?auto_433457 ) ) ( not ( = ?auto_433453 ?auto_433458 ) ) ( not ( = ?auto_433453 ?auto_433459 ) ) ( not ( = ?auto_433453 ?auto_433460 ) ) ( not ( = ?auto_433454 ?auto_433455 ) ) ( not ( = ?auto_433454 ?auto_433456 ) ) ( not ( = ?auto_433454 ?auto_433457 ) ) ( not ( = ?auto_433454 ?auto_433458 ) ) ( not ( = ?auto_433454 ?auto_433459 ) ) ( not ( = ?auto_433454 ?auto_433460 ) ) ( not ( = ?auto_433455 ?auto_433456 ) ) ( not ( = ?auto_433455 ?auto_433457 ) ) ( not ( = ?auto_433455 ?auto_433458 ) ) ( not ( = ?auto_433455 ?auto_433459 ) ) ( not ( = ?auto_433455 ?auto_433460 ) ) ( not ( = ?auto_433456 ?auto_433457 ) ) ( not ( = ?auto_433456 ?auto_433458 ) ) ( not ( = ?auto_433456 ?auto_433459 ) ) ( not ( = ?auto_433456 ?auto_433460 ) ) ( not ( = ?auto_433457 ?auto_433458 ) ) ( not ( = ?auto_433457 ?auto_433459 ) ) ( not ( = ?auto_433457 ?auto_433460 ) ) ( not ( = ?auto_433458 ?auto_433459 ) ) ( not ( = ?auto_433458 ?auto_433460 ) ) ( not ( = ?auto_433459 ?auto_433460 ) ) ( ON ?auto_433458 ?auto_433459 ) ( ON ?auto_433457 ?auto_433458 ) ( ON ?auto_433456 ?auto_433457 ) ( ON ?auto_433455 ?auto_433456 ) ( ON ?auto_433454 ?auto_433455 ) ( ON ?auto_433453 ?auto_433454 ) ( ON ?auto_433452 ?auto_433453 ) ( ON ?auto_433451 ?auto_433452 ) ( ON ?auto_433450 ?auto_433451 ) ( ON ?auto_433449 ?auto_433450 ) ( ON ?auto_433448 ?auto_433449 ) ( CLEAR ?auto_433446 ) ( ON ?auto_433447 ?auto_433448 ) ( CLEAR ?auto_433447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_433445 ?auto_433446 ?auto_433447 )
      ( MAKE-15PILE ?auto_433445 ?auto_433446 ?auto_433447 ?auto_433448 ?auto_433449 ?auto_433450 ?auto_433451 ?auto_433452 ?auto_433453 ?auto_433454 ?auto_433455 ?auto_433456 ?auto_433457 ?auto_433458 ?auto_433459 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433476 - BLOCK
      ?auto_433477 - BLOCK
      ?auto_433478 - BLOCK
      ?auto_433479 - BLOCK
      ?auto_433480 - BLOCK
      ?auto_433481 - BLOCK
      ?auto_433482 - BLOCK
      ?auto_433483 - BLOCK
      ?auto_433484 - BLOCK
      ?auto_433485 - BLOCK
      ?auto_433486 - BLOCK
      ?auto_433487 - BLOCK
      ?auto_433488 - BLOCK
      ?auto_433489 - BLOCK
      ?auto_433490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433490 ) ( ON-TABLE ?auto_433476 ) ( ON ?auto_433477 ?auto_433476 ) ( not ( = ?auto_433476 ?auto_433477 ) ) ( not ( = ?auto_433476 ?auto_433478 ) ) ( not ( = ?auto_433476 ?auto_433479 ) ) ( not ( = ?auto_433476 ?auto_433480 ) ) ( not ( = ?auto_433476 ?auto_433481 ) ) ( not ( = ?auto_433476 ?auto_433482 ) ) ( not ( = ?auto_433476 ?auto_433483 ) ) ( not ( = ?auto_433476 ?auto_433484 ) ) ( not ( = ?auto_433476 ?auto_433485 ) ) ( not ( = ?auto_433476 ?auto_433486 ) ) ( not ( = ?auto_433476 ?auto_433487 ) ) ( not ( = ?auto_433476 ?auto_433488 ) ) ( not ( = ?auto_433476 ?auto_433489 ) ) ( not ( = ?auto_433476 ?auto_433490 ) ) ( not ( = ?auto_433477 ?auto_433478 ) ) ( not ( = ?auto_433477 ?auto_433479 ) ) ( not ( = ?auto_433477 ?auto_433480 ) ) ( not ( = ?auto_433477 ?auto_433481 ) ) ( not ( = ?auto_433477 ?auto_433482 ) ) ( not ( = ?auto_433477 ?auto_433483 ) ) ( not ( = ?auto_433477 ?auto_433484 ) ) ( not ( = ?auto_433477 ?auto_433485 ) ) ( not ( = ?auto_433477 ?auto_433486 ) ) ( not ( = ?auto_433477 ?auto_433487 ) ) ( not ( = ?auto_433477 ?auto_433488 ) ) ( not ( = ?auto_433477 ?auto_433489 ) ) ( not ( = ?auto_433477 ?auto_433490 ) ) ( not ( = ?auto_433478 ?auto_433479 ) ) ( not ( = ?auto_433478 ?auto_433480 ) ) ( not ( = ?auto_433478 ?auto_433481 ) ) ( not ( = ?auto_433478 ?auto_433482 ) ) ( not ( = ?auto_433478 ?auto_433483 ) ) ( not ( = ?auto_433478 ?auto_433484 ) ) ( not ( = ?auto_433478 ?auto_433485 ) ) ( not ( = ?auto_433478 ?auto_433486 ) ) ( not ( = ?auto_433478 ?auto_433487 ) ) ( not ( = ?auto_433478 ?auto_433488 ) ) ( not ( = ?auto_433478 ?auto_433489 ) ) ( not ( = ?auto_433478 ?auto_433490 ) ) ( not ( = ?auto_433479 ?auto_433480 ) ) ( not ( = ?auto_433479 ?auto_433481 ) ) ( not ( = ?auto_433479 ?auto_433482 ) ) ( not ( = ?auto_433479 ?auto_433483 ) ) ( not ( = ?auto_433479 ?auto_433484 ) ) ( not ( = ?auto_433479 ?auto_433485 ) ) ( not ( = ?auto_433479 ?auto_433486 ) ) ( not ( = ?auto_433479 ?auto_433487 ) ) ( not ( = ?auto_433479 ?auto_433488 ) ) ( not ( = ?auto_433479 ?auto_433489 ) ) ( not ( = ?auto_433479 ?auto_433490 ) ) ( not ( = ?auto_433480 ?auto_433481 ) ) ( not ( = ?auto_433480 ?auto_433482 ) ) ( not ( = ?auto_433480 ?auto_433483 ) ) ( not ( = ?auto_433480 ?auto_433484 ) ) ( not ( = ?auto_433480 ?auto_433485 ) ) ( not ( = ?auto_433480 ?auto_433486 ) ) ( not ( = ?auto_433480 ?auto_433487 ) ) ( not ( = ?auto_433480 ?auto_433488 ) ) ( not ( = ?auto_433480 ?auto_433489 ) ) ( not ( = ?auto_433480 ?auto_433490 ) ) ( not ( = ?auto_433481 ?auto_433482 ) ) ( not ( = ?auto_433481 ?auto_433483 ) ) ( not ( = ?auto_433481 ?auto_433484 ) ) ( not ( = ?auto_433481 ?auto_433485 ) ) ( not ( = ?auto_433481 ?auto_433486 ) ) ( not ( = ?auto_433481 ?auto_433487 ) ) ( not ( = ?auto_433481 ?auto_433488 ) ) ( not ( = ?auto_433481 ?auto_433489 ) ) ( not ( = ?auto_433481 ?auto_433490 ) ) ( not ( = ?auto_433482 ?auto_433483 ) ) ( not ( = ?auto_433482 ?auto_433484 ) ) ( not ( = ?auto_433482 ?auto_433485 ) ) ( not ( = ?auto_433482 ?auto_433486 ) ) ( not ( = ?auto_433482 ?auto_433487 ) ) ( not ( = ?auto_433482 ?auto_433488 ) ) ( not ( = ?auto_433482 ?auto_433489 ) ) ( not ( = ?auto_433482 ?auto_433490 ) ) ( not ( = ?auto_433483 ?auto_433484 ) ) ( not ( = ?auto_433483 ?auto_433485 ) ) ( not ( = ?auto_433483 ?auto_433486 ) ) ( not ( = ?auto_433483 ?auto_433487 ) ) ( not ( = ?auto_433483 ?auto_433488 ) ) ( not ( = ?auto_433483 ?auto_433489 ) ) ( not ( = ?auto_433483 ?auto_433490 ) ) ( not ( = ?auto_433484 ?auto_433485 ) ) ( not ( = ?auto_433484 ?auto_433486 ) ) ( not ( = ?auto_433484 ?auto_433487 ) ) ( not ( = ?auto_433484 ?auto_433488 ) ) ( not ( = ?auto_433484 ?auto_433489 ) ) ( not ( = ?auto_433484 ?auto_433490 ) ) ( not ( = ?auto_433485 ?auto_433486 ) ) ( not ( = ?auto_433485 ?auto_433487 ) ) ( not ( = ?auto_433485 ?auto_433488 ) ) ( not ( = ?auto_433485 ?auto_433489 ) ) ( not ( = ?auto_433485 ?auto_433490 ) ) ( not ( = ?auto_433486 ?auto_433487 ) ) ( not ( = ?auto_433486 ?auto_433488 ) ) ( not ( = ?auto_433486 ?auto_433489 ) ) ( not ( = ?auto_433486 ?auto_433490 ) ) ( not ( = ?auto_433487 ?auto_433488 ) ) ( not ( = ?auto_433487 ?auto_433489 ) ) ( not ( = ?auto_433487 ?auto_433490 ) ) ( not ( = ?auto_433488 ?auto_433489 ) ) ( not ( = ?auto_433488 ?auto_433490 ) ) ( not ( = ?auto_433489 ?auto_433490 ) ) ( ON ?auto_433489 ?auto_433490 ) ( ON ?auto_433488 ?auto_433489 ) ( ON ?auto_433487 ?auto_433488 ) ( ON ?auto_433486 ?auto_433487 ) ( ON ?auto_433485 ?auto_433486 ) ( ON ?auto_433484 ?auto_433485 ) ( ON ?auto_433483 ?auto_433484 ) ( ON ?auto_433482 ?auto_433483 ) ( ON ?auto_433481 ?auto_433482 ) ( ON ?auto_433480 ?auto_433481 ) ( ON ?auto_433479 ?auto_433480 ) ( CLEAR ?auto_433477 ) ( ON ?auto_433478 ?auto_433479 ) ( CLEAR ?auto_433478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_433476 ?auto_433477 ?auto_433478 )
      ( MAKE-15PILE ?auto_433476 ?auto_433477 ?auto_433478 ?auto_433479 ?auto_433480 ?auto_433481 ?auto_433482 ?auto_433483 ?auto_433484 ?auto_433485 ?auto_433486 ?auto_433487 ?auto_433488 ?auto_433489 ?auto_433490 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433506 - BLOCK
      ?auto_433507 - BLOCK
      ?auto_433508 - BLOCK
      ?auto_433509 - BLOCK
      ?auto_433510 - BLOCK
      ?auto_433511 - BLOCK
      ?auto_433512 - BLOCK
      ?auto_433513 - BLOCK
      ?auto_433514 - BLOCK
      ?auto_433515 - BLOCK
      ?auto_433516 - BLOCK
      ?auto_433517 - BLOCK
      ?auto_433518 - BLOCK
      ?auto_433519 - BLOCK
      ?auto_433520 - BLOCK
    )
    :vars
    (
      ?auto_433521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433520 ?auto_433521 ) ( ON-TABLE ?auto_433506 ) ( not ( = ?auto_433506 ?auto_433507 ) ) ( not ( = ?auto_433506 ?auto_433508 ) ) ( not ( = ?auto_433506 ?auto_433509 ) ) ( not ( = ?auto_433506 ?auto_433510 ) ) ( not ( = ?auto_433506 ?auto_433511 ) ) ( not ( = ?auto_433506 ?auto_433512 ) ) ( not ( = ?auto_433506 ?auto_433513 ) ) ( not ( = ?auto_433506 ?auto_433514 ) ) ( not ( = ?auto_433506 ?auto_433515 ) ) ( not ( = ?auto_433506 ?auto_433516 ) ) ( not ( = ?auto_433506 ?auto_433517 ) ) ( not ( = ?auto_433506 ?auto_433518 ) ) ( not ( = ?auto_433506 ?auto_433519 ) ) ( not ( = ?auto_433506 ?auto_433520 ) ) ( not ( = ?auto_433506 ?auto_433521 ) ) ( not ( = ?auto_433507 ?auto_433508 ) ) ( not ( = ?auto_433507 ?auto_433509 ) ) ( not ( = ?auto_433507 ?auto_433510 ) ) ( not ( = ?auto_433507 ?auto_433511 ) ) ( not ( = ?auto_433507 ?auto_433512 ) ) ( not ( = ?auto_433507 ?auto_433513 ) ) ( not ( = ?auto_433507 ?auto_433514 ) ) ( not ( = ?auto_433507 ?auto_433515 ) ) ( not ( = ?auto_433507 ?auto_433516 ) ) ( not ( = ?auto_433507 ?auto_433517 ) ) ( not ( = ?auto_433507 ?auto_433518 ) ) ( not ( = ?auto_433507 ?auto_433519 ) ) ( not ( = ?auto_433507 ?auto_433520 ) ) ( not ( = ?auto_433507 ?auto_433521 ) ) ( not ( = ?auto_433508 ?auto_433509 ) ) ( not ( = ?auto_433508 ?auto_433510 ) ) ( not ( = ?auto_433508 ?auto_433511 ) ) ( not ( = ?auto_433508 ?auto_433512 ) ) ( not ( = ?auto_433508 ?auto_433513 ) ) ( not ( = ?auto_433508 ?auto_433514 ) ) ( not ( = ?auto_433508 ?auto_433515 ) ) ( not ( = ?auto_433508 ?auto_433516 ) ) ( not ( = ?auto_433508 ?auto_433517 ) ) ( not ( = ?auto_433508 ?auto_433518 ) ) ( not ( = ?auto_433508 ?auto_433519 ) ) ( not ( = ?auto_433508 ?auto_433520 ) ) ( not ( = ?auto_433508 ?auto_433521 ) ) ( not ( = ?auto_433509 ?auto_433510 ) ) ( not ( = ?auto_433509 ?auto_433511 ) ) ( not ( = ?auto_433509 ?auto_433512 ) ) ( not ( = ?auto_433509 ?auto_433513 ) ) ( not ( = ?auto_433509 ?auto_433514 ) ) ( not ( = ?auto_433509 ?auto_433515 ) ) ( not ( = ?auto_433509 ?auto_433516 ) ) ( not ( = ?auto_433509 ?auto_433517 ) ) ( not ( = ?auto_433509 ?auto_433518 ) ) ( not ( = ?auto_433509 ?auto_433519 ) ) ( not ( = ?auto_433509 ?auto_433520 ) ) ( not ( = ?auto_433509 ?auto_433521 ) ) ( not ( = ?auto_433510 ?auto_433511 ) ) ( not ( = ?auto_433510 ?auto_433512 ) ) ( not ( = ?auto_433510 ?auto_433513 ) ) ( not ( = ?auto_433510 ?auto_433514 ) ) ( not ( = ?auto_433510 ?auto_433515 ) ) ( not ( = ?auto_433510 ?auto_433516 ) ) ( not ( = ?auto_433510 ?auto_433517 ) ) ( not ( = ?auto_433510 ?auto_433518 ) ) ( not ( = ?auto_433510 ?auto_433519 ) ) ( not ( = ?auto_433510 ?auto_433520 ) ) ( not ( = ?auto_433510 ?auto_433521 ) ) ( not ( = ?auto_433511 ?auto_433512 ) ) ( not ( = ?auto_433511 ?auto_433513 ) ) ( not ( = ?auto_433511 ?auto_433514 ) ) ( not ( = ?auto_433511 ?auto_433515 ) ) ( not ( = ?auto_433511 ?auto_433516 ) ) ( not ( = ?auto_433511 ?auto_433517 ) ) ( not ( = ?auto_433511 ?auto_433518 ) ) ( not ( = ?auto_433511 ?auto_433519 ) ) ( not ( = ?auto_433511 ?auto_433520 ) ) ( not ( = ?auto_433511 ?auto_433521 ) ) ( not ( = ?auto_433512 ?auto_433513 ) ) ( not ( = ?auto_433512 ?auto_433514 ) ) ( not ( = ?auto_433512 ?auto_433515 ) ) ( not ( = ?auto_433512 ?auto_433516 ) ) ( not ( = ?auto_433512 ?auto_433517 ) ) ( not ( = ?auto_433512 ?auto_433518 ) ) ( not ( = ?auto_433512 ?auto_433519 ) ) ( not ( = ?auto_433512 ?auto_433520 ) ) ( not ( = ?auto_433512 ?auto_433521 ) ) ( not ( = ?auto_433513 ?auto_433514 ) ) ( not ( = ?auto_433513 ?auto_433515 ) ) ( not ( = ?auto_433513 ?auto_433516 ) ) ( not ( = ?auto_433513 ?auto_433517 ) ) ( not ( = ?auto_433513 ?auto_433518 ) ) ( not ( = ?auto_433513 ?auto_433519 ) ) ( not ( = ?auto_433513 ?auto_433520 ) ) ( not ( = ?auto_433513 ?auto_433521 ) ) ( not ( = ?auto_433514 ?auto_433515 ) ) ( not ( = ?auto_433514 ?auto_433516 ) ) ( not ( = ?auto_433514 ?auto_433517 ) ) ( not ( = ?auto_433514 ?auto_433518 ) ) ( not ( = ?auto_433514 ?auto_433519 ) ) ( not ( = ?auto_433514 ?auto_433520 ) ) ( not ( = ?auto_433514 ?auto_433521 ) ) ( not ( = ?auto_433515 ?auto_433516 ) ) ( not ( = ?auto_433515 ?auto_433517 ) ) ( not ( = ?auto_433515 ?auto_433518 ) ) ( not ( = ?auto_433515 ?auto_433519 ) ) ( not ( = ?auto_433515 ?auto_433520 ) ) ( not ( = ?auto_433515 ?auto_433521 ) ) ( not ( = ?auto_433516 ?auto_433517 ) ) ( not ( = ?auto_433516 ?auto_433518 ) ) ( not ( = ?auto_433516 ?auto_433519 ) ) ( not ( = ?auto_433516 ?auto_433520 ) ) ( not ( = ?auto_433516 ?auto_433521 ) ) ( not ( = ?auto_433517 ?auto_433518 ) ) ( not ( = ?auto_433517 ?auto_433519 ) ) ( not ( = ?auto_433517 ?auto_433520 ) ) ( not ( = ?auto_433517 ?auto_433521 ) ) ( not ( = ?auto_433518 ?auto_433519 ) ) ( not ( = ?auto_433518 ?auto_433520 ) ) ( not ( = ?auto_433518 ?auto_433521 ) ) ( not ( = ?auto_433519 ?auto_433520 ) ) ( not ( = ?auto_433519 ?auto_433521 ) ) ( not ( = ?auto_433520 ?auto_433521 ) ) ( ON ?auto_433519 ?auto_433520 ) ( ON ?auto_433518 ?auto_433519 ) ( ON ?auto_433517 ?auto_433518 ) ( ON ?auto_433516 ?auto_433517 ) ( ON ?auto_433515 ?auto_433516 ) ( ON ?auto_433514 ?auto_433515 ) ( ON ?auto_433513 ?auto_433514 ) ( ON ?auto_433512 ?auto_433513 ) ( ON ?auto_433511 ?auto_433512 ) ( ON ?auto_433510 ?auto_433511 ) ( ON ?auto_433509 ?auto_433510 ) ( ON ?auto_433508 ?auto_433509 ) ( CLEAR ?auto_433506 ) ( ON ?auto_433507 ?auto_433508 ) ( CLEAR ?auto_433507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_433506 ?auto_433507 )
      ( MAKE-15PILE ?auto_433506 ?auto_433507 ?auto_433508 ?auto_433509 ?auto_433510 ?auto_433511 ?auto_433512 ?auto_433513 ?auto_433514 ?auto_433515 ?auto_433516 ?auto_433517 ?auto_433518 ?auto_433519 ?auto_433520 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433537 - BLOCK
      ?auto_433538 - BLOCK
      ?auto_433539 - BLOCK
      ?auto_433540 - BLOCK
      ?auto_433541 - BLOCK
      ?auto_433542 - BLOCK
      ?auto_433543 - BLOCK
      ?auto_433544 - BLOCK
      ?auto_433545 - BLOCK
      ?auto_433546 - BLOCK
      ?auto_433547 - BLOCK
      ?auto_433548 - BLOCK
      ?auto_433549 - BLOCK
      ?auto_433550 - BLOCK
      ?auto_433551 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433551 ) ( ON-TABLE ?auto_433537 ) ( not ( = ?auto_433537 ?auto_433538 ) ) ( not ( = ?auto_433537 ?auto_433539 ) ) ( not ( = ?auto_433537 ?auto_433540 ) ) ( not ( = ?auto_433537 ?auto_433541 ) ) ( not ( = ?auto_433537 ?auto_433542 ) ) ( not ( = ?auto_433537 ?auto_433543 ) ) ( not ( = ?auto_433537 ?auto_433544 ) ) ( not ( = ?auto_433537 ?auto_433545 ) ) ( not ( = ?auto_433537 ?auto_433546 ) ) ( not ( = ?auto_433537 ?auto_433547 ) ) ( not ( = ?auto_433537 ?auto_433548 ) ) ( not ( = ?auto_433537 ?auto_433549 ) ) ( not ( = ?auto_433537 ?auto_433550 ) ) ( not ( = ?auto_433537 ?auto_433551 ) ) ( not ( = ?auto_433538 ?auto_433539 ) ) ( not ( = ?auto_433538 ?auto_433540 ) ) ( not ( = ?auto_433538 ?auto_433541 ) ) ( not ( = ?auto_433538 ?auto_433542 ) ) ( not ( = ?auto_433538 ?auto_433543 ) ) ( not ( = ?auto_433538 ?auto_433544 ) ) ( not ( = ?auto_433538 ?auto_433545 ) ) ( not ( = ?auto_433538 ?auto_433546 ) ) ( not ( = ?auto_433538 ?auto_433547 ) ) ( not ( = ?auto_433538 ?auto_433548 ) ) ( not ( = ?auto_433538 ?auto_433549 ) ) ( not ( = ?auto_433538 ?auto_433550 ) ) ( not ( = ?auto_433538 ?auto_433551 ) ) ( not ( = ?auto_433539 ?auto_433540 ) ) ( not ( = ?auto_433539 ?auto_433541 ) ) ( not ( = ?auto_433539 ?auto_433542 ) ) ( not ( = ?auto_433539 ?auto_433543 ) ) ( not ( = ?auto_433539 ?auto_433544 ) ) ( not ( = ?auto_433539 ?auto_433545 ) ) ( not ( = ?auto_433539 ?auto_433546 ) ) ( not ( = ?auto_433539 ?auto_433547 ) ) ( not ( = ?auto_433539 ?auto_433548 ) ) ( not ( = ?auto_433539 ?auto_433549 ) ) ( not ( = ?auto_433539 ?auto_433550 ) ) ( not ( = ?auto_433539 ?auto_433551 ) ) ( not ( = ?auto_433540 ?auto_433541 ) ) ( not ( = ?auto_433540 ?auto_433542 ) ) ( not ( = ?auto_433540 ?auto_433543 ) ) ( not ( = ?auto_433540 ?auto_433544 ) ) ( not ( = ?auto_433540 ?auto_433545 ) ) ( not ( = ?auto_433540 ?auto_433546 ) ) ( not ( = ?auto_433540 ?auto_433547 ) ) ( not ( = ?auto_433540 ?auto_433548 ) ) ( not ( = ?auto_433540 ?auto_433549 ) ) ( not ( = ?auto_433540 ?auto_433550 ) ) ( not ( = ?auto_433540 ?auto_433551 ) ) ( not ( = ?auto_433541 ?auto_433542 ) ) ( not ( = ?auto_433541 ?auto_433543 ) ) ( not ( = ?auto_433541 ?auto_433544 ) ) ( not ( = ?auto_433541 ?auto_433545 ) ) ( not ( = ?auto_433541 ?auto_433546 ) ) ( not ( = ?auto_433541 ?auto_433547 ) ) ( not ( = ?auto_433541 ?auto_433548 ) ) ( not ( = ?auto_433541 ?auto_433549 ) ) ( not ( = ?auto_433541 ?auto_433550 ) ) ( not ( = ?auto_433541 ?auto_433551 ) ) ( not ( = ?auto_433542 ?auto_433543 ) ) ( not ( = ?auto_433542 ?auto_433544 ) ) ( not ( = ?auto_433542 ?auto_433545 ) ) ( not ( = ?auto_433542 ?auto_433546 ) ) ( not ( = ?auto_433542 ?auto_433547 ) ) ( not ( = ?auto_433542 ?auto_433548 ) ) ( not ( = ?auto_433542 ?auto_433549 ) ) ( not ( = ?auto_433542 ?auto_433550 ) ) ( not ( = ?auto_433542 ?auto_433551 ) ) ( not ( = ?auto_433543 ?auto_433544 ) ) ( not ( = ?auto_433543 ?auto_433545 ) ) ( not ( = ?auto_433543 ?auto_433546 ) ) ( not ( = ?auto_433543 ?auto_433547 ) ) ( not ( = ?auto_433543 ?auto_433548 ) ) ( not ( = ?auto_433543 ?auto_433549 ) ) ( not ( = ?auto_433543 ?auto_433550 ) ) ( not ( = ?auto_433543 ?auto_433551 ) ) ( not ( = ?auto_433544 ?auto_433545 ) ) ( not ( = ?auto_433544 ?auto_433546 ) ) ( not ( = ?auto_433544 ?auto_433547 ) ) ( not ( = ?auto_433544 ?auto_433548 ) ) ( not ( = ?auto_433544 ?auto_433549 ) ) ( not ( = ?auto_433544 ?auto_433550 ) ) ( not ( = ?auto_433544 ?auto_433551 ) ) ( not ( = ?auto_433545 ?auto_433546 ) ) ( not ( = ?auto_433545 ?auto_433547 ) ) ( not ( = ?auto_433545 ?auto_433548 ) ) ( not ( = ?auto_433545 ?auto_433549 ) ) ( not ( = ?auto_433545 ?auto_433550 ) ) ( not ( = ?auto_433545 ?auto_433551 ) ) ( not ( = ?auto_433546 ?auto_433547 ) ) ( not ( = ?auto_433546 ?auto_433548 ) ) ( not ( = ?auto_433546 ?auto_433549 ) ) ( not ( = ?auto_433546 ?auto_433550 ) ) ( not ( = ?auto_433546 ?auto_433551 ) ) ( not ( = ?auto_433547 ?auto_433548 ) ) ( not ( = ?auto_433547 ?auto_433549 ) ) ( not ( = ?auto_433547 ?auto_433550 ) ) ( not ( = ?auto_433547 ?auto_433551 ) ) ( not ( = ?auto_433548 ?auto_433549 ) ) ( not ( = ?auto_433548 ?auto_433550 ) ) ( not ( = ?auto_433548 ?auto_433551 ) ) ( not ( = ?auto_433549 ?auto_433550 ) ) ( not ( = ?auto_433549 ?auto_433551 ) ) ( not ( = ?auto_433550 ?auto_433551 ) ) ( ON ?auto_433550 ?auto_433551 ) ( ON ?auto_433549 ?auto_433550 ) ( ON ?auto_433548 ?auto_433549 ) ( ON ?auto_433547 ?auto_433548 ) ( ON ?auto_433546 ?auto_433547 ) ( ON ?auto_433545 ?auto_433546 ) ( ON ?auto_433544 ?auto_433545 ) ( ON ?auto_433543 ?auto_433544 ) ( ON ?auto_433542 ?auto_433543 ) ( ON ?auto_433541 ?auto_433542 ) ( ON ?auto_433540 ?auto_433541 ) ( ON ?auto_433539 ?auto_433540 ) ( CLEAR ?auto_433537 ) ( ON ?auto_433538 ?auto_433539 ) ( CLEAR ?auto_433538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_433537 ?auto_433538 )
      ( MAKE-15PILE ?auto_433537 ?auto_433538 ?auto_433539 ?auto_433540 ?auto_433541 ?auto_433542 ?auto_433543 ?auto_433544 ?auto_433545 ?auto_433546 ?auto_433547 ?auto_433548 ?auto_433549 ?auto_433550 ?auto_433551 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433567 - BLOCK
      ?auto_433568 - BLOCK
      ?auto_433569 - BLOCK
      ?auto_433570 - BLOCK
      ?auto_433571 - BLOCK
      ?auto_433572 - BLOCK
      ?auto_433573 - BLOCK
      ?auto_433574 - BLOCK
      ?auto_433575 - BLOCK
      ?auto_433576 - BLOCK
      ?auto_433577 - BLOCK
      ?auto_433578 - BLOCK
      ?auto_433579 - BLOCK
      ?auto_433580 - BLOCK
      ?auto_433581 - BLOCK
    )
    :vars
    (
      ?auto_433582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433581 ?auto_433582 ) ( not ( = ?auto_433567 ?auto_433568 ) ) ( not ( = ?auto_433567 ?auto_433569 ) ) ( not ( = ?auto_433567 ?auto_433570 ) ) ( not ( = ?auto_433567 ?auto_433571 ) ) ( not ( = ?auto_433567 ?auto_433572 ) ) ( not ( = ?auto_433567 ?auto_433573 ) ) ( not ( = ?auto_433567 ?auto_433574 ) ) ( not ( = ?auto_433567 ?auto_433575 ) ) ( not ( = ?auto_433567 ?auto_433576 ) ) ( not ( = ?auto_433567 ?auto_433577 ) ) ( not ( = ?auto_433567 ?auto_433578 ) ) ( not ( = ?auto_433567 ?auto_433579 ) ) ( not ( = ?auto_433567 ?auto_433580 ) ) ( not ( = ?auto_433567 ?auto_433581 ) ) ( not ( = ?auto_433567 ?auto_433582 ) ) ( not ( = ?auto_433568 ?auto_433569 ) ) ( not ( = ?auto_433568 ?auto_433570 ) ) ( not ( = ?auto_433568 ?auto_433571 ) ) ( not ( = ?auto_433568 ?auto_433572 ) ) ( not ( = ?auto_433568 ?auto_433573 ) ) ( not ( = ?auto_433568 ?auto_433574 ) ) ( not ( = ?auto_433568 ?auto_433575 ) ) ( not ( = ?auto_433568 ?auto_433576 ) ) ( not ( = ?auto_433568 ?auto_433577 ) ) ( not ( = ?auto_433568 ?auto_433578 ) ) ( not ( = ?auto_433568 ?auto_433579 ) ) ( not ( = ?auto_433568 ?auto_433580 ) ) ( not ( = ?auto_433568 ?auto_433581 ) ) ( not ( = ?auto_433568 ?auto_433582 ) ) ( not ( = ?auto_433569 ?auto_433570 ) ) ( not ( = ?auto_433569 ?auto_433571 ) ) ( not ( = ?auto_433569 ?auto_433572 ) ) ( not ( = ?auto_433569 ?auto_433573 ) ) ( not ( = ?auto_433569 ?auto_433574 ) ) ( not ( = ?auto_433569 ?auto_433575 ) ) ( not ( = ?auto_433569 ?auto_433576 ) ) ( not ( = ?auto_433569 ?auto_433577 ) ) ( not ( = ?auto_433569 ?auto_433578 ) ) ( not ( = ?auto_433569 ?auto_433579 ) ) ( not ( = ?auto_433569 ?auto_433580 ) ) ( not ( = ?auto_433569 ?auto_433581 ) ) ( not ( = ?auto_433569 ?auto_433582 ) ) ( not ( = ?auto_433570 ?auto_433571 ) ) ( not ( = ?auto_433570 ?auto_433572 ) ) ( not ( = ?auto_433570 ?auto_433573 ) ) ( not ( = ?auto_433570 ?auto_433574 ) ) ( not ( = ?auto_433570 ?auto_433575 ) ) ( not ( = ?auto_433570 ?auto_433576 ) ) ( not ( = ?auto_433570 ?auto_433577 ) ) ( not ( = ?auto_433570 ?auto_433578 ) ) ( not ( = ?auto_433570 ?auto_433579 ) ) ( not ( = ?auto_433570 ?auto_433580 ) ) ( not ( = ?auto_433570 ?auto_433581 ) ) ( not ( = ?auto_433570 ?auto_433582 ) ) ( not ( = ?auto_433571 ?auto_433572 ) ) ( not ( = ?auto_433571 ?auto_433573 ) ) ( not ( = ?auto_433571 ?auto_433574 ) ) ( not ( = ?auto_433571 ?auto_433575 ) ) ( not ( = ?auto_433571 ?auto_433576 ) ) ( not ( = ?auto_433571 ?auto_433577 ) ) ( not ( = ?auto_433571 ?auto_433578 ) ) ( not ( = ?auto_433571 ?auto_433579 ) ) ( not ( = ?auto_433571 ?auto_433580 ) ) ( not ( = ?auto_433571 ?auto_433581 ) ) ( not ( = ?auto_433571 ?auto_433582 ) ) ( not ( = ?auto_433572 ?auto_433573 ) ) ( not ( = ?auto_433572 ?auto_433574 ) ) ( not ( = ?auto_433572 ?auto_433575 ) ) ( not ( = ?auto_433572 ?auto_433576 ) ) ( not ( = ?auto_433572 ?auto_433577 ) ) ( not ( = ?auto_433572 ?auto_433578 ) ) ( not ( = ?auto_433572 ?auto_433579 ) ) ( not ( = ?auto_433572 ?auto_433580 ) ) ( not ( = ?auto_433572 ?auto_433581 ) ) ( not ( = ?auto_433572 ?auto_433582 ) ) ( not ( = ?auto_433573 ?auto_433574 ) ) ( not ( = ?auto_433573 ?auto_433575 ) ) ( not ( = ?auto_433573 ?auto_433576 ) ) ( not ( = ?auto_433573 ?auto_433577 ) ) ( not ( = ?auto_433573 ?auto_433578 ) ) ( not ( = ?auto_433573 ?auto_433579 ) ) ( not ( = ?auto_433573 ?auto_433580 ) ) ( not ( = ?auto_433573 ?auto_433581 ) ) ( not ( = ?auto_433573 ?auto_433582 ) ) ( not ( = ?auto_433574 ?auto_433575 ) ) ( not ( = ?auto_433574 ?auto_433576 ) ) ( not ( = ?auto_433574 ?auto_433577 ) ) ( not ( = ?auto_433574 ?auto_433578 ) ) ( not ( = ?auto_433574 ?auto_433579 ) ) ( not ( = ?auto_433574 ?auto_433580 ) ) ( not ( = ?auto_433574 ?auto_433581 ) ) ( not ( = ?auto_433574 ?auto_433582 ) ) ( not ( = ?auto_433575 ?auto_433576 ) ) ( not ( = ?auto_433575 ?auto_433577 ) ) ( not ( = ?auto_433575 ?auto_433578 ) ) ( not ( = ?auto_433575 ?auto_433579 ) ) ( not ( = ?auto_433575 ?auto_433580 ) ) ( not ( = ?auto_433575 ?auto_433581 ) ) ( not ( = ?auto_433575 ?auto_433582 ) ) ( not ( = ?auto_433576 ?auto_433577 ) ) ( not ( = ?auto_433576 ?auto_433578 ) ) ( not ( = ?auto_433576 ?auto_433579 ) ) ( not ( = ?auto_433576 ?auto_433580 ) ) ( not ( = ?auto_433576 ?auto_433581 ) ) ( not ( = ?auto_433576 ?auto_433582 ) ) ( not ( = ?auto_433577 ?auto_433578 ) ) ( not ( = ?auto_433577 ?auto_433579 ) ) ( not ( = ?auto_433577 ?auto_433580 ) ) ( not ( = ?auto_433577 ?auto_433581 ) ) ( not ( = ?auto_433577 ?auto_433582 ) ) ( not ( = ?auto_433578 ?auto_433579 ) ) ( not ( = ?auto_433578 ?auto_433580 ) ) ( not ( = ?auto_433578 ?auto_433581 ) ) ( not ( = ?auto_433578 ?auto_433582 ) ) ( not ( = ?auto_433579 ?auto_433580 ) ) ( not ( = ?auto_433579 ?auto_433581 ) ) ( not ( = ?auto_433579 ?auto_433582 ) ) ( not ( = ?auto_433580 ?auto_433581 ) ) ( not ( = ?auto_433580 ?auto_433582 ) ) ( not ( = ?auto_433581 ?auto_433582 ) ) ( ON ?auto_433580 ?auto_433581 ) ( ON ?auto_433579 ?auto_433580 ) ( ON ?auto_433578 ?auto_433579 ) ( ON ?auto_433577 ?auto_433578 ) ( ON ?auto_433576 ?auto_433577 ) ( ON ?auto_433575 ?auto_433576 ) ( ON ?auto_433574 ?auto_433575 ) ( ON ?auto_433573 ?auto_433574 ) ( ON ?auto_433572 ?auto_433573 ) ( ON ?auto_433571 ?auto_433572 ) ( ON ?auto_433570 ?auto_433571 ) ( ON ?auto_433569 ?auto_433570 ) ( ON ?auto_433568 ?auto_433569 ) ( ON ?auto_433567 ?auto_433568 ) ( CLEAR ?auto_433567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_433567 )
      ( MAKE-15PILE ?auto_433567 ?auto_433568 ?auto_433569 ?auto_433570 ?auto_433571 ?auto_433572 ?auto_433573 ?auto_433574 ?auto_433575 ?auto_433576 ?auto_433577 ?auto_433578 ?auto_433579 ?auto_433580 ?auto_433581 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433598 - BLOCK
      ?auto_433599 - BLOCK
      ?auto_433600 - BLOCK
      ?auto_433601 - BLOCK
      ?auto_433602 - BLOCK
      ?auto_433603 - BLOCK
      ?auto_433604 - BLOCK
      ?auto_433605 - BLOCK
      ?auto_433606 - BLOCK
      ?auto_433607 - BLOCK
      ?auto_433608 - BLOCK
      ?auto_433609 - BLOCK
      ?auto_433610 - BLOCK
      ?auto_433611 - BLOCK
      ?auto_433612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_433612 ) ( not ( = ?auto_433598 ?auto_433599 ) ) ( not ( = ?auto_433598 ?auto_433600 ) ) ( not ( = ?auto_433598 ?auto_433601 ) ) ( not ( = ?auto_433598 ?auto_433602 ) ) ( not ( = ?auto_433598 ?auto_433603 ) ) ( not ( = ?auto_433598 ?auto_433604 ) ) ( not ( = ?auto_433598 ?auto_433605 ) ) ( not ( = ?auto_433598 ?auto_433606 ) ) ( not ( = ?auto_433598 ?auto_433607 ) ) ( not ( = ?auto_433598 ?auto_433608 ) ) ( not ( = ?auto_433598 ?auto_433609 ) ) ( not ( = ?auto_433598 ?auto_433610 ) ) ( not ( = ?auto_433598 ?auto_433611 ) ) ( not ( = ?auto_433598 ?auto_433612 ) ) ( not ( = ?auto_433599 ?auto_433600 ) ) ( not ( = ?auto_433599 ?auto_433601 ) ) ( not ( = ?auto_433599 ?auto_433602 ) ) ( not ( = ?auto_433599 ?auto_433603 ) ) ( not ( = ?auto_433599 ?auto_433604 ) ) ( not ( = ?auto_433599 ?auto_433605 ) ) ( not ( = ?auto_433599 ?auto_433606 ) ) ( not ( = ?auto_433599 ?auto_433607 ) ) ( not ( = ?auto_433599 ?auto_433608 ) ) ( not ( = ?auto_433599 ?auto_433609 ) ) ( not ( = ?auto_433599 ?auto_433610 ) ) ( not ( = ?auto_433599 ?auto_433611 ) ) ( not ( = ?auto_433599 ?auto_433612 ) ) ( not ( = ?auto_433600 ?auto_433601 ) ) ( not ( = ?auto_433600 ?auto_433602 ) ) ( not ( = ?auto_433600 ?auto_433603 ) ) ( not ( = ?auto_433600 ?auto_433604 ) ) ( not ( = ?auto_433600 ?auto_433605 ) ) ( not ( = ?auto_433600 ?auto_433606 ) ) ( not ( = ?auto_433600 ?auto_433607 ) ) ( not ( = ?auto_433600 ?auto_433608 ) ) ( not ( = ?auto_433600 ?auto_433609 ) ) ( not ( = ?auto_433600 ?auto_433610 ) ) ( not ( = ?auto_433600 ?auto_433611 ) ) ( not ( = ?auto_433600 ?auto_433612 ) ) ( not ( = ?auto_433601 ?auto_433602 ) ) ( not ( = ?auto_433601 ?auto_433603 ) ) ( not ( = ?auto_433601 ?auto_433604 ) ) ( not ( = ?auto_433601 ?auto_433605 ) ) ( not ( = ?auto_433601 ?auto_433606 ) ) ( not ( = ?auto_433601 ?auto_433607 ) ) ( not ( = ?auto_433601 ?auto_433608 ) ) ( not ( = ?auto_433601 ?auto_433609 ) ) ( not ( = ?auto_433601 ?auto_433610 ) ) ( not ( = ?auto_433601 ?auto_433611 ) ) ( not ( = ?auto_433601 ?auto_433612 ) ) ( not ( = ?auto_433602 ?auto_433603 ) ) ( not ( = ?auto_433602 ?auto_433604 ) ) ( not ( = ?auto_433602 ?auto_433605 ) ) ( not ( = ?auto_433602 ?auto_433606 ) ) ( not ( = ?auto_433602 ?auto_433607 ) ) ( not ( = ?auto_433602 ?auto_433608 ) ) ( not ( = ?auto_433602 ?auto_433609 ) ) ( not ( = ?auto_433602 ?auto_433610 ) ) ( not ( = ?auto_433602 ?auto_433611 ) ) ( not ( = ?auto_433602 ?auto_433612 ) ) ( not ( = ?auto_433603 ?auto_433604 ) ) ( not ( = ?auto_433603 ?auto_433605 ) ) ( not ( = ?auto_433603 ?auto_433606 ) ) ( not ( = ?auto_433603 ?auto_433607 ) ) ( not ( = ?auto_433603 ?auto_433608 ) ) ( not ( = ?auto_433603 ?auto_433609 ) ) ( not ( = ?auto_433603 ?auto_433610 ) ) ( not ( = ?auto_433603 ?auto_433611 ) ) ( not ( = ?auto_433603 ?auto_433612 ) ) ( not ( = ?auto_433604 ?auto_433605 ) ) ( not ( = ?auto_433604 ?auto_433606 ) ) ( not ( = ?auto_433604 ?auto_433607 ) ) ( not ( = ?auto_433604 ?auto_433608 ) ) ( not ( = ?auto_433604 ?auto_433609 ) ) ( not ( = ?auto_433604 ?auto_433610 ) ) ( not ( = ?auto_433604 ?auto_433611 ) ) ( not ( = ?auto_433604 ?auto_433612 ) ) ( not ( = ?auto_433605 ?auto_433606 ) ) ( not ( = ?auto_433605 ?auto_433607 ) ) ( not ( = ?auto_433605 ?auto_433608 ) ) ( not ( = ?auto_433605 ?auto_433609 ) ) ( not ( = ?auto_433605 ?auto_433610 ) ) ( not ( = ?auto_433605 ?auto_433611 ) ) ( not ( = ?auto_433605 ?auto_433612 ) ) ( not ( = ?auto_433606 ?auto_433607 ) ) ( not ( = ?auto_433606 ?auto_433608 ) ) ( not ( = ?auto_433606 ?auto_433609 ) ) ( not ( = ?auto_433606 ?auto_433610 ) ) ( not ( = ?auto_433606 ?auto_433611 ) ) ( not ( = ?auto_433606 ?auto_433612 ) ) ( not ( = ?auto_433607 ?auto_433608 ) ) ( not ( = ?auto_433607 ?auto_433609 ) ) ( not ( = ?auto_433607 ?auto_433610 ) ) ( not ( = ?auto_433607 ?auto_433611 ) ) ( not ( = ?auto_433607 ?auto_433612 ) ) ( not ( = ?auto_433608 ?auto_433609 ) ) ( not ( = ?auto_433608 ?auto_433610 ) ) ( not ( = ?auto_433608 ?auto_433611 ) ) ( not ( = ?auto_433608 ?auto_433612 ) ) ( not ( = ?auto_433609 ?auto_433610 ) ) ( not ( = ?auto_433609 ?auto_433611 ) ) ( not ( = ?auto_433609 ?auto_433612 ) ) ( not ( = ?auto_433610 ?auto_433611 ) ) ( not ( = ?auto_433610 ?auto_433612 ) ) ( not ( = ?auto_433611 ?auto_433612 ) ) ( ON ?auto_433611 ?auto_433612 ) ( ON ?auto_433610 ?auto_433611 ) ( ON ?auto_433609 ?auto_433610 ) ( ON ?auto_433608 ?auto_433609 ) ( ON ?auto_433607 ?auto_433608 ) ( ON ?auto_433606 ?auto_433607 ) ( ON ?auto_433605 ?auto_433606 ) ( ON ?auto_433604 ?auto_433605 ) ( ON ?auto_433603 ?auto_433604 ) ( ON ?auto_433602 ?auto_433603 ) ( ON ?auto_433601 ?auto_433602 ) ( ON ?auto_433600 ?auto_433601 ) ( ON ?auto_433599 ?auto_433600 ) ( ON ?auto_433598 ?auto_433599 ) ( CLEAR ?auto_433598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_433598 )
      ( MAKE-15PILE ?auto_433598 ?auto_433599 ?auto_433600 ?auto_433601 ?auto_433602 ?auto_433603 ?auto_433604 ?auto_433605 ?auto_433606 ?auto_433607 ?auto_433608 ?auto_433609 ?auto_433610 ?auto_433611 ?auto_433612 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_433628 - BLOCK
      ?auto_433629 - BLOCK
      ?auto_433630 - BLOCK
      ?auto_433631 - BLOCK
      ?auto_433632 - BLOCK
      ?auto_433633 - BLOCK
      ?auto_433634 - BLOCK
      ?auto_433635 - BLOCK
      ?auto_433636 - BLOCK
      ?auto_433637 - BLOCK
      ?auto_433638 - BLOCK
      ?auto_433639 - BLOCK
      ?auto_433640 - BLOCK
      ?auto_433641 - BLOCK
      ?auto_433642 - BLOCK
    )
    :vars
    (
      ?auto_433643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_433628 ?auto_433629 ) ) ( not ( = ?auto_433628 ?auto_433630 ) ) ( not ( = ?auto_433628 ?auto_433631 ) ) ( not ( = ?auto_433628 ?auto_433632 ) ) ( not ( = ?auto_433628 ?auto_433633 ) ) ( not ( = ?auto_433628 ?auto_433634 ) ) ( not ( = ?auto_433628 ?auto_433635 ) ) ( not ( = ?auto_433628 ?auto_433636 ) ) ( not ( = ?auto_433628 ?auto_433637 ) ) ( not ( = ?auto_433628 ?auto_433638 ) ) ( not ( = ?auto_433628 ?auto_433639 ) ) ( not ( = ?auto_433628 ?auto_433640 ) ) ( not ( = ?auto_433628 ?auto_433641 ) ) ( not ( = ?auto_433628 ?auto_433642 ) ) ( not ( = ?auto_433629 ?auto_433630 ) ) ( not ( = ?auto_433629 ?auto_433631 ) ) ( not ( = ?auto_433629 ?auto_433632 ) ) ( not ( = ?auto_433629 ?auto_433633 ) ) ( not ( = ?auto_433629 ?auto_433634 ) ) ( not ( = ?auto_433629 ?auto_433635 ) ) ( not ( = ?auto_433629 ?auto_433636 ) ) ( not ( = ?auto_433629 ?auto_433637 ) ) ( not ( = ?auto_433629 ?auto_433638 ) ) ( not ( = ?auto_433629 ?auto_433639 ) ) ( not ( = ?auto_433629 ?auto_433640 ) ) ( not ( = ?auto_433629 ?auto_433641 ) ) ( not ( = ?auto_433629 ?auto_433642 ) ) ( not ( = ?auto_433630 ?auto_433631 ) ) ( not ( = ?auto_433630 ?auto_433632 ) ) ( not ( = ?auto_433630 ?auto_433633 ) ) ( not ( = ?auto_433630 ?auto_433634 ) ) ( not ( = ?auto_433630 ?auto_433635 ) ) ( not ( = ?auto_433630 ?auto_433636 ) ) ( not ( = ?auto_433630 ?auto_433637 ) ) ( not ( = ?auto_433630 ?auto_433638 ) ) ( not ( = ?auto_433630 ?auto_433639 ) ) ( not ( = ?auto_433630 ?auto_433640 ) ) ( not ( = ?auto_433630 ?auto_433641 ) ) ( not ( = ?auto_433630 ?auto_433642 ) ) ( not ( = ?auto_433631 ?auto_433632 ) ) ( not ( = ?auto_433631 ?auto_433633 ) ) ( not ( = ?auto_433631 ?auto_433634 ) ) ( not ( = ?auto_433631 ?auto_433635 ) ) ( not ( = ?auto_433631 ?auto_433636 ) ) ( not ( = ?auto_433631 ?auto_433637 ) ) ( not ( = ?auto_433631 ?auto_433638 ) ) ( not ( = ?auto_433631 ?auto_433639 ) ) ( not ( = ?auto_433631 ?auto_433640 ) ) ( not ( = ?auto_433631 ?auto_433641 ) ) ( not ( = ?auto_433631 ?auto_433642 ) ) ( not ( = ?auto_433632 ?auto_433633 ) ) ( not ( = ?auto_433632 ?auto_433634 ) ) ( not ( = ?auto_433632 ?auto_433635 ) ) ( not ( = ?auto_433632 ?auto_433636 ) ) ( not ( = ?auto_433632 ?auto_433637 ) ) ( not ( = ?auto_433632 ?auto_433638 ) ) ( not ( = ?auto_433632 ?auto_433639 ) ) ( not ( = ?auto_433632 ?auto_433640 ) ) ( not ( = ?auto_433632 ?auto_433641 ) ) ( not ( = ?auto_433632 ?auto_433642 ) ) ( not ( = ?auto_433633 ?auto_433634 ) ) ( not ( = ?auto_433633 ?auto_433635 ) ) ( not ( = ?auto_433633 ?auto_433636 ) ) ( not ( = ?auto_433633 ?auto_433637 ) ) ( not ( = ?auto_433633 ?auto_433638 ) ) ( not ( = ?auto_433633 ?auto_433639 ) ) ( not ( = ?auto_433633 ?auto_433640 ) ) ( not ( = ?auto_433633 ?auto_433641 ) ) ( not ( = ?auto_433633 ?auto_433642 ) ) ( not ( = ?auto_433634 ?auto_433635 ) ) ( not ( = ?auto_433634 ?auto_433636 ) ) ( not ( = ?auto_433634 ?auto_433637 ) ) ( not ( = ?auto_433634 ?auto_433638 ) ) ( not ( = ?auto_433634 ?auto_433639 ) ) ( not ( = ?auto_433634 ?auto_433640 ) ) ( not ( = ?auto_433634 ?auto_433641 ) ) ( not ( = ?auto_433634 ?auto_433642 ) ) ( not ( = ?auto_433635 ?auto_433636 ) ) ( not ( = ?auto_433635 ?auto_433637 ) ) ( not ( = ?auto_433635 ?auto_433638 ) ) ( not ( = ?auto_433635 ?auto_433639 ) ) ( not ( = ?auto_433635 ?auto_433640 ) ) ( not ( = ?auto_433635 ?auto_433641 ) ) ( not ( = ?auto_433635 ?auto_433642 ) ) ( not ( = ?auto_433636 ?auto_433637 ) ) ( not ( = ?auto_433636 ?auto_433638 ) ) ( not ( = ?auto_433636 ?auto_433639 ) ) ( not ( = ?auto_433636 ?auto_433640 ) ) ( not ( = ?auto_433636 ?auto_433641 ) ) ( not ( = ?auto_433636 ?auto_433642 ) ) ( not ( = ?auto_433637 ?auto_433638 ) ) ( not ( = ?auto_433637 ?auto_433639 ) ) ( not ( = ?auto_433637 ?auto_433640 ) ) ( not ( = ?auto_433637 ?auto_433641 ) ) ( not ( = ?auto_433637 ?auto_433642 ) ) ( not ( = ?auto_433638 ?auto_433639 ) ) ( not ( = ?auto_433638 ?auto_433640 ) ) ( not ( = ?auto_433638 ?auto_433641 ) ) ( not ( = ?auto_433638 ?auto_433642 ) ) ( not ( = ?auto_433639 ?auto_433640 ) ) ( not ( = ?auto_433639 ?auto_433641 ) ) ( not ( = ?auto_433639 ?auto_433642 ) ) ( not ( = ?auto_433640 ?auto_433641 ) ) ( not ( = ?auto_433640 ?auto_433642 ) ) ( not ( = ?auto_433641 ?auto_433642 ) ) ( ON ?auto_433628 ?auto_433643 ) ( not ( = ?auto_433642 ?auto_433643 ) ) ( not ( = ?auto_433641 ?auto_433643 ) ) ( not ( = ?auto_433640 ?auto_433643 ) ) ( not ( = ?auto_433639 ?auto_433643 ) ) ( not ( = ?auto_433638 ?auto_433643 ) ) ( not ( = ?auto_433637 ?auto_433643 ) ) ( not ( = ?auto_433636 ?auto_433643 ) ) ( not ( = ?auto_433635 ?auto_433643 ) ) ( not ( = ?auto_433634 ?auto_433643 ) ) ( not ( = ?auto_433633 ?auto_433643 ) ) ( not ( = ?auto_433632 ?auto_433643 ) ) ( not ( = ?auto_433631 ?auto_433643 ) ) ( not ( = ?auto_433630 ?auto_433643 ) ) ( not ( = ?auto_433629 ?auto_433643 ) ) ( not ( = ?auto_433628 ?auto_433643 ) ) ( ON ?auto_433629 ?auto_433628 ) ( ON ?auto_433630 ?auto_433629 ) ( ON ?auto_433631 ?auto_433630 ) ( ON ?auto_433632 ?auto_433631 ) ( ON ?auto_433633 ?auto_433632 ) ( ON ?auto_433634 ?auto_433633 ) ( ON ?auto_433635 ?auto_433634 ) ( ON ?auto_433636 ?auto_433635 ) ( ON ?auto_433637 ?auto_433636 ) ( ON ?auto_433638 ?auto_433637 ) ( ON ?auto_433639 ?auto_433638 ) ( ON ?auto_433640 ?auto_433639 ) ( ON ?auto_433641 ?auto_433640 ) ( ON ?auto_433642 ?auto_433641 ) ( CLEAR ?auto_433642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_433642 ?auto_433641 ?auto_433640 ?auto_433639 ?auto_433638 ?auto_433637 ?auto_433636 ?auto_433635 ?auto_433634 ?auto_433633 ?auto_433632 ?auto_433631 ?auto_433630 ?auto_433629 ?auto_433628 )
      ( MAKE-15PILE ?auto_433628 ?auto_433629 ?auto_433630 ?auto_433631 ?auto_433632 ?auto_433633 ?auto_433634 ?auto_433635 ?auto_433636 ?auto_433637 ?auto_433638 ?auto_433639 ?auto_433640 ?auto_433641 ?auto_433642 ) )
  )

)

