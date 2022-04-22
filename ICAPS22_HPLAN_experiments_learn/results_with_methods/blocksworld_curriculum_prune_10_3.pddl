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
      ?auto_78504 - BLOCK
    )
    :vars
    (
      ?auto_78505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78504 ?auto_78505 ) ( CLEAR ?auto_78504 ) ( HAND-EMPTY ) ( not ( = ?auto_78504 ?auto_78505 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78504 ?auto_78505 )
      ( !PUTDOWN ?auto_78504 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78511 - BLOCK
      ?auto_78512 - BLOCK
    )
    :vars
    (
      ?auto_78513 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78511 ) ( ON ?auto_78512 ?auto_78513 ) ( CLEAR ?auto_78512 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78511 ) ( not ( = ?auto_78511 ?auto_78512 ) ) ( not ( = ?auto_78511 ?auto_78513 ) ) ( not ( = ?auto_78512 ?auto_78513 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78512 ?auto_78513 )
      ( !STACK ?auto_78512 ?auto_78511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78521 - BLOCK
      ?auto_78522 - BLOCK
    )
    :vars
    (
      ?auto_78523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78522 ?auto_78523 ) ( not ( = ?auto_78521 ?auto_78522 ) ) ( not ( = ?auto_78521 ?auto_78523 ) ) ( not ( = ?auto_78522 ?auto_78523 ) ) ( ON ?auto_78521 ?auto_78522 ) ( CLEAR ?auto_78521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78521 )
      ( MAKE-2PILE ?auto_78521 ?auto_78522 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78532 - BLOCK
      ?auto_78533 - BLOCK
      ?auto_78534 - BLOCK
    )
    :vars
    (
      ?auto_78535 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78533 ) ( ON ?auto_78534 ?auto_78535 ) ( CLEAR ?auto_78534 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78532 ) ( ON ?auto_78533 ?auto_78532 ) ( not ( = ?auto_78532 ?auto_78533 ) ) ( not ( = ?auto_78532 ?auto_78534 ) ) ( not ( = ?auto_78532 ?auto_78535 ) ) ( not ( = ?auto_78533 ?auto_78534 ) ) ( not ( = ?auto_78533 ?auto_78535 ) ) ( not ( = ?auto_78534 ?auto_78535 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78534 ?auto_78535 )
      ( !STACK ?auto_78534 ?auto_78533 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78546 - BLOCK
      ?auto_78547 - BLOCK
      ?auto_78548 - BLOCK
    )
    :vars
    (
      ?auto_78549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78548 ?auto_78549 ) ( ON-TABLE ?auto_78546 ) ( not ( = ?auto_78546 ?auto_78547 ) ) ( not ( = ?auto_78546 ?auto_78548 ) ) ( not ( = ?auto_78546 ?auto_78549 ) ) ( not ( = ?auto_78547 ?auto_78548 ) ) ( not ( = ?auto_78547 ?auto_78549 ) ) ( not ( = ?auto_78548 ?auto_78549 ) ) ( CLEAR ?auto_78546 ) ( ON ?auto_78547 ?auto_78548 ) ( CLEAR ?auto_78547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78546 ?auto_78547 )
      ( MAKE-3PILE ?auto_78546 ?auto_78547 ?auto_78548 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78560 - BLOCK
      ?auto_78561 - BLOCK
      ?auto_78562 - BLOCK
    )
    :vars
    (
      ?auto_78563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78562 ?auto_78563 ) ( not ( = ?auto_78560 ?auto_78561 ) ) ( not ( = ?auto_78560 ?auto_78562 ) ) ( not ( = ?auto_78560 ?auto_78563 ) ) ( not ( = ?auto_78561 ?auto_78562 ) ) ( not ( = ?auto_78561 ?auto_78563 ) ) ( not ( = ?auto_78562 ?auto_78563 ) ) ( ON ?auto_78561 ?auto_78562 ) ( ON ?auto_78560 ?auto_78561 ) ( CLEAR ?auto_78560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78560 )
      ( MAKE-3PILE ?auto_78560 ?auto_78561 ?auto_78562 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78575 - BLOCK
      ?auto_78576 - BLOCK
      ?auto_78577 - BLOCK
      ?auto_78578 - BLOCK
    )
    :vars
    (
      ?auto_78579 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78577 ) ( ON ?auto_78578 ?auto_78579 ) ( CLEAR ?auto_78578 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78575 ) ( ON ?auto_78576 ?auto_78575 ) ( ON ?auto_78577 ?auto_78576 ) ( not ( = ?auto_78575 ?auto_78576 ) ) ( not ( = ?auto_78575 ?auto_78577 ) ) ( not ( = ?auto_78575 ?auto_78578 ) ) ( not ( = ?auto_78575 ?auto_78579 ) ) ( not ( = ?auto_78576 ?auto_78577 ) ) ( not ( = ?auto_78576 ?auto_78578 ) ) ( not ( = ?auto_78576 ?auto_78579 ) ) ( not ( = ?auto_78577 ?auto_78578 ) ) ( not ( = ?auto_78577 ?auto_78579 ) ) ( not ( = ?auto_78578 ?auto_78579 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78578 ?auto_78579 )
      ( !STACK ?auto_78578 ?auto_78577 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78593 - BLOCK
      ?auto_78594 - BLOCK
      ?auto_78595 - BLOCK
      ?auto_78596 - BLOCK
    )
    :vars
    (
      ?auto_78597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78596 ?auto_78597 ) ( ON-TABLE ?auto_78593 ) ( ON ?auto_78594 ?auto_78593 ) ( not ( = ?auto_78593 ?auto_78594 ) ) ( not ( = ?auto_78593 ?auto_78595 ) ) ( not ( = ?auto_78593 ?auto_78596 ) ) ( not ( = ?auto_78593 ?auto_78597 ) ) ( not ( = ?auto_78594 ?auto_78595 ) ) ( not ( = ?auto_78594 ?auto_78596 ) ) ( not ( = ?auto_78594 ?auto_78597 ) ) ( not ( = ?auto_78595 ?auto_78596 ) ) ( not ( = ?auto_78595 ?auto_78597 ) ) ( not ( = ?auto_78596 ?auto_78597 ) ) ( CLEAR ?auto_78594 ) ( ON ?auto_78595 ?auto_78596 ) ( CLEAR ?auto_78595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78593 ?auto_78594 ?auto_78595 )
      ( MAKE-4PILE ?auto_78593 ?auto_78594 ?auto_78595 ?auto_78596 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78611 - BLOCK
      ?auto_78612 - BLOCK
      ?auto_78613 - BLOCK
      ?auto_78614 - BLOCK
    )
    :vars
    (
      ?auto_78615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78614 ?auto_78615 ) ( ON-TABLE ?auto_78611 ) ( not ( = ?auto_78611 ?auto_78612 ) ) ( not ( = ?auto_78611 ?auto_78613 ) ) ( not ( = ?auto_78611 ?auto_78614 ) ) ( not ( = ?auto_78611 ?auto_78615 ) ) ( not ( = ?auto_78612 ?auto_78613 ) ) ( not ( = ?auto_78612 ?auto_78614 ) ) ( not ( = ?auto_78612 ?auto_78615 ) ) ( not ( = ?auto_78613 ?auto_78614 ) ) ( not ( = ?auto_78613 ?auto_78615 ) ) ( not ( = ?auto_78614 ?auto_78615 ) ) ( ON ?auto_78613 ?auto_78614 ) ( CLEAR ?auto_78611 ) ( ON ?auto_78612 ?auto_78613 ) ( CLEAR ?auto_78612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78611 ?auto_78612 )
      ( MAKE-4PILE ?auto_78611 ?auto_78612 ?auto_78613 ?auto_78614 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78629 - BLOCK
      ?auto_78630 - BLOCK
      ?auto_78631 - BLOCK
      ?auto_78632 - BLOCK
    )
    :vars
    (
      ?auto_78633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78632 ?auto_78633 ) ( not ( = ?auto_78629 ?auto_78630 ) ) ( not ( = ?auto_78629 ?auto_78631 ) ) ( not ( = ?auto_78629 ?auto_78632 ) ) ( not ( = ?auto_78629 ?auto_78633 ) ) ( not ( = ?auto_78630 ?auto_78631 ) ) ( not ( = ?auto_78630 ?auto_78632 ) ) ( not ( = ?auto_78630 ?auto_78633 ) ) ( not ( = ?auto_78631 ?auto_78632 ) ) ( not ( = ?auto_78631 ?auto_78633 ) ) ( not ( = ?auto_78632 ?auto_78633 ) ) ( ON ?auto_78631 ?auto_78632 ) ( ON ?auto_78630 ?auto_78631 ) ( ON ?auto_78629 ?auto_78630 ) ( CLEAR ?auto_78629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78629 )
      ( MAKE-4PILE ?auto_78629 ?auto_78630 ?auto_78631 ?auto_78632 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78648 - BLOCK
      ?auto_78649 - BLOCK
      ?auto_78650 - BLOCK
      ?auto_78651 - BLOCK
      ?auto_78652 - BLOCK
    )
    :vars
    (
      ?auto_78653 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78651 ) ( ON ?auto_78652 ?auto_78653 ) ( CLEAR ?auto_78652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78648 ) ( ON ?auto_78649 ?auto_78648 ) ( ON ?auto_78650 ?auto_78649 ) ( ON ?auto_78651 ?auto_78650 ) ( not ( = ?auto_78648 ?auto_78649 ) ) ( not ( = ?auto_78648 ?auto_78650 ) ) ( not ( = ?auto_78648 ?auto_78651 ) ) ( not ( = ?auto_78648 ?auto_78652 ) ) ( not ( = ?auto_78648 ?auto_78653 ) ) ( not ( = ?auto_78649 ?auto_78650 ) ) ( not ( = ?auto_78649 ?auto_78651 ) ) ( not ( = ?auto_78649 ?auto_78652 ) ) ( not ( = ?auto_78649 ?auto_78653 ) ) ( not ( = ?auto_78650 ?auto_78651 ) ) ( not ( = ?auto_78650 ?auto_78652 ) ) ( not ( = ?auto_78650 ?auto_78653 ) ) ( not ( = ?auto_78651 ?auto_78652 ) ) ( not ( = ?auto_78651 ?auto_78653 ) ) ( not ( = ?auto_78652 ?auto_78653 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78652 ?auto_78653 )
      ( !STACK ?auto_78652 ?auto_78651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78670 - BLOCK
      ?auto_78671 - BLOCK
      ?auto_78672 - BLOCK
      ?auto_78673 - BLOCK
      ?auto_78674 - BLOCK
    )
    :vars
    (
      ?auto_78675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78674 ?auto_78675 ) ( ON-TABLE ?auto_78670 ) ( ON ?auto_78671 ?auto_78670 ) ( ON ?auto_78672 ?auto_78671 ) ( not ( = ?auto_78670 ?auto_78671 ) ) ( not ( = ?auto_78670 ?auto_78672 ) ) ( not ( = ?auto_78670 ?auto_78673 ) ) ( not ( = ?auto_78670 ?auto_78674 ) ) ( not ( = ?auto_78670 ?auto_78675 ) ) ( not ( = ?auto_78671 ?auto_78672 ) ) ( not ( = ?auto_78671 ?auto_78673 ) ) ( not ( = ?auto_78671 ?auto_78674 ) ) ( not ( = ?auto_78671 ?auto_78675 ) ) ( not ( = ?auto_78672 ?auto_78673 ) ) ( not ( = ?auto_78672 ?auto_78674 ) ) ( not ( = ?auto_78672 ?auto_78675 ) ) ( not ( = ?auto_78673 ?auto_78674 ) ) ( not ( = ?auto_78673 ?auto_78675 ) ) ( not ( = ?auto_78674 ?auto_78675 ) ) ( CLEAR ?auto_78672 ) ( ON ?auto_78673 ?auto_78674 ) ( CLEAR ?auto_78673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78670 ?auto_78671 ?auto_78672 ?auto_78673 )
      ( MAKE-5PILE ?auto_78670 ?auto_78671 ?auto_78672 ?auto_78673 ?auto_78674 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78692 - BLOCK
      ?auto_78693 - BLOCK
      ?auto_78694 - BLOCK
      ?auto_78695 - BLOCK
      ?auto_78696 - BLOCK
    )
    :vars
    (
      ?auto_78697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78696 ?auto_78697 ) ( ON-TABLE ?auto_78692 ) ( ON ?auto_78693 ?auto_78692 ) ( not ( = ?auto_78692 ?auto_78693 ) ) ( not ( = ?auto_78692 ?auto_78694 ) ) ( not ( = ?auto_78692 ?auto_78695 ) ) ( not ( = ?auto_78692 ?auto_78696 ) ) ( not ( = ?auto_78692 ?auto_78697 ) ) ( not ( = ?auto_78693 ?auto_78694 ) ) ( not ( = ?auto_78693 ?auto_78695 ) ) ( not ( = ?auto_78693 ?auto_78696 ) ) ( not ( = ?auto_78693 ?auto_78697 ) ) ( not ( = ?auto_78694 ?auto_78695 ) ) ( not ( = ?auto_78694 ?auto_78696 ) ) ( not ( = ?auto_78694 ?auto_78697 ) ) ( not ( = ?auto_78695 ?auto_78696 ) ) ( not ( = ?auto_78695 ?auto_78697 ) ) ( not ( = ?auto_78696 ?auto_78697 ) ) ( ON ?auto_78695 ?auto_78696 ) ( CLEAR ?auto_78693 ) ( ON ?auto_78694 ?auto_78695 ) ( CLEAR ?auto_78694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78692 ?auto_78693 ?auto_78694 )
      ( MAKE-5PILE ?auto_78692 ?auto_78693 ?auto_78694 ?auto_78695 ?auto_78696 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78714 - BLOCK
      ?auto_78715 - BLOCK
      ?auto_78716 - BLOCK
      ?auto_78717 - BLOCK
      ?auto_78718 - BLOCK
    )
    :vars
    (
      ?auto_78719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78718 ?auto_78719 ) ( ON-TABLE ?auto_78714 ) ( not ( = ?auto_78714 ?auto_78715 ) ) ( not ( = ?auto_78714 ?auto_78716 ) ) ( not ( = ?auto_78714 ?auto_78717 ) ) ( not ( = ?auto_78714 ?auto_78718 ) ) ( not ( = ?auto_78714 ?auto_78719 ) ) ( not ( = ?auto_78715 ?auto_78716 ) ) ( not ( = ?auto_78715 ?auto_78717 ) ) ( not ( = ?auto_78715 ?auto_78718 ) ) ( not ( = ?auto_78715 ?auto_78719 ) ) ( not ( = ?auto_78716 ?auto_78717 ) ) ( not ( = ?auto_78716 ?auto_78718 ) ) ( not ( = ?auto_78716 ?auto_78719 ) ) ( not ( = ?auto_78717 ?auto_78718 ) ) ( not ( = ?auto_78717 ?auto_78719 ) ) ( not ( = ?auto_78718 ?auto_78719 ) ) ( ON ?auto_78717 ?auto_78718 ) ( ON ?auto_78716 ?auto_78717 ) ( CLEAR ?auto_78714 ) ( ON ?auto_78715 ?auto_78716 ) ( CLEAR ?auto_78715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78714 ?auto_78715 )
      ( MAKE-5PILE ?auto_78714 ?auto_78715 ?auto_78716 ?auto_78717 ?auto_78718 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78736 - BLOCK
      ?auto_78737 - BLOCK
      ?auto_78738 - BLOCK
      ?auto_78739 - BLOCK
      ?auto_78740 - BLOCK
    )
    :vars
    (
      ?auto_78741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78740 ?auto_78741 ) ( not ( = ?auto_78736 ?auto_78737 ) ) ( not ( = ?auto_78736 ?auto_78738 ) ) ( not ( = ?auto_78736 ?auto_78739 ) ) ( not ( = ?auto_78736 ?auto_78740 ) ) ( not ( = ?auto_78736 ?auto_78741 ) ) ( not ( = ?auto_78737 ?auto_78738 ) ) ( not ( = ?auto_78737 ?auto_78739 ) ) ( not ( = ?auto_78737 ?auto_78740 ) ) ( not ( = ?auto_78737 ?auto_78741 ) ) ( not ( = ?auto_78738 ?auto_78739 ) ) ( not ( = ?auto_78738 ?auto_78740 ) ) ( not ( = ?auto_78738 ?auto_78741 ) ) ( not ( = ?auto_78739 ?auto_78740 ) ) ( not ( = ?auto_78739 ?auto_78741 ) ) ( not ( = ?auto_78740 ?auto_78741 ) ) ( ON ?auto_78739 ?auto_78740 ) ( ON ?auto_78738 ?auto_78739 ) ( ON ?auto_78737 ?auto_78738 ) ( ON ?auto_78736 ?auto_78737 ) ( CLEAR ?auto_78736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78736 )
      ( MAKE-5PILE ?auto_78736 ?auto_78737 ?auto_78738 ?auto_78739 ?auto_78740 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78759 - BLOCK
      ?auto_78760 - BLOCK
      ?auto_78761 - BLOCK
      ?auto_78762 - BLOCK
      ?auto_78763 - BLOCK
      ?auto_78764 - BLOCK
    )
    :vars
    (
      ?auto_78765 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78763 ) ( ON ?auto_78764 ?auto_78765 ) ( CLEAR ?auto_78764 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78759 ) ( ON ?auto_78760 ?auto_78759 ) ( ON ?auto_78761 ?auto_78760 ) ( ON ?auto_78762 ?auto_78761 ) ( ON ?auto_78763 ?auto_78762 ) ( not ( = ?auto_78759 ?auto_78760 ) ) ( not ( = ?auto_78759 ?auto_78761 ) ) ( not ( = ?auto_78759 ?auto_78762 ) ) ( not ( = ?auto_78759 ?auto_78763 ) ) ( not ( = ?auto_78759 ?auto_78764 ) ) ( not ( = ?auto_78759 ?auto_78765 ) ) ( not ( = ?auto_78760 ?auto_78761 ) ) ( not ( = ?auto_78760 ?auto_78762 ) ) ( not ( = ?auto_78760 ?auto_78763 ) ) ( not ( = ?auto_78760 ?auto_78764 ) ) ( not ( = ?auto_78760 ?auto_78765 ) ) ( not ( = ?auto_78761 ?auto_78762 ) ) ( not ( = ?auto_78761 ?auto_78763 ) ) ( not ( = ?auto_78761 ?auto_78764 ) ) ( not ( = ?auto_78761 ?auto_78765 ) ) ( not ( = ?auto_78762 ?auto_78763 ) ) ( not ( = ?auto_78762 ?auto_78764 ) ) ( not ( = ?auto_78762 ?auto_78765 ) ) ( not ( = ?auto_78763 ?auto_78764 ) ) ( not ( = ?auto_78763 ?auto_78765 ) ) ( not ( = ?auto_78764 ?auto_78765 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78764 ?auto_78765 )
      ( !STACK ?auto_78764 ?auto_78763 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78785 - BLOCK
      ?auto_78786 - BLOCK
      ?auto_78787 - BLOCK
      ?auto_78788 - BLOCK
      ?auto_78789 - BLOCK
      ?auto_78790 - BLOCK
    )
    :vars
    (
      ?auto_78791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78790 ?auto_78791 ) ( ON-TABLE ?auto_78785 ) ( ON ?auto_78786 ?auto_78785 ) ( ON ?auto_78787 ?auto_78786 ) ( ON ?auto_78788 ?auto_78787 ) ( not ( = ?auto_78785 ?auto_78786 ) ) ( not ( = ?auto_78785 ?auto_78787 ) ) ( not ( = ?auto_78785 ?auto_78788 ) ) ( not ( = ?auto_78785 ?auto_78789 ) ) ( not ( = ?auto_78785 ?auto_78790 ) ) ( not ( = ?auto_78785 ?auto_78791 ) ) ( not ( = ?auto_78786 ?auto_78787 ) ) ( not ( = ?auto_78786 ?auto_78788 ) ) ( not ( = ?auto_78786 ?auto_78789 ) ) ( not ( = ?auto_78786 ?auto_78790 ) ) ( not ( = ?auto_78786 ?auto_78791 ) ) ( not ( = ?auto_78787 ?auto_78788 ) ) ( not ( = ?auto_78787 ?auto_78789 ) ) ( not ( = ?auto_78787 ?auto_78790 ) ) ( not ( = ?auto_78787 ?auto_78791 ) ) ( not ( = ?auto_78788 ?auto_78789 ) ) ( not ( = ?auto_78788 ?auto_78790 ) ) ( not ( = ?auto_78788 ?auto_78791 ) ) ( not ( = ?auto_78789 ?auto_78790 ) ) ( not ( = ?auto_78789 ?auto_78791 ) ) ( not ( = ?auto_78790 ?auto_78791 ) ) ( CLEAR ?auto_78788 ) ( ON ?auto_78789 ?auto_78790 ) ( CLEAR ?auto_78789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78785 ?auto_78786 ?auto_78787 ?auto_78788 ?auto_78789 )
      ( MAKE-6PILE ?auto_78785 ?auto_78786 ?auto_78787 ?auto_78788 ?auto_78789 ?auto_78790 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78811 - BLOCK
      ?auto_78812 - BLOCK
      ?auto_78813 - BLOCK
      ?auto_78814 - BLOCK
      ?auto_78815 - BLOCK
      ?auto_78816 - BLOCK
    )
    :vars
    (
      ?auto_78817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78816 ?auto_78817 ) ( ON-TABLE ?auto_78811 ) ( ON ?auto_78812 ?auto_78811 ) ( ON ?auto_78813 ?auto_78812 ) ( not ( = ?auto_78811 ?auto_78812 ) ) ( not ( = ?auto_78811 ?auto_78813 ) ) ( not ( = ?auto_78811 ?auto_78814 ) ) ( not ( = ?auto_78811 ?auto_78815 ) ) ( not ( = ?auto_78811 ?auto_78816 ) ) ( not ( = ?auto_78811 ?auto_78817 ) ) ( not ( = ?auto_78812 ?auto_78813 ) ) ( not ( = ?auto_78812 ?auto_78814 ) ) ( not ( = ?auto_78812 ?auto_78815 ) ) ( not ( = ?auto_78812 ?auto_78816 ) ) ( not ( = ?auto_78812 ?auto_78817 ) ) ( not ( = ?auto_78813 ?auto_78814 ) ) ( not ( = ?auto_78813 ?auto_78815 ) ) ( not ( = ?auto_78813 ?auto_78816 ) ) ( not ( = ?auto_78813 ?auto_78817 ) ) ( not ( = ?auto_78814 ?auto_78815 ) ) ( not ( = ?auto_78814 ?auto_78816 ) ) ( not ( = ?auto_78814 ?auto_78817 ) ) ( not ( = ?auto_78815 ?auto_78816 ) ) ( not ( = ?auto_78815 ?auto_78817 ) ) ( not ( = ?auto_78816 ?auto_78817 ) ) ( ON ?auto_78815 ?auto_78816 ) ( CLEAR ?auto_78813 ) ( ON ?auto_78814 ?auto_78815 ) ( CLEAR ?auto_78814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78811 ?auto_78812 ?auto_78813 ?auto_78814 )
      ( MAKE-6PILE ?auto_78811 ?auto_78812 ?auto_78813 ?auto_78814 ?auto_78815 ?auto_78816 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78837 - BLOCK
      ?auto_78838 - BLOCK
      ?auto_78839 - BLOCK
      ?auto_78840 - BLOCK
      ?auto_78841 - BLOCK
      ?auto_78842 - BLOCK
    )
    :vars
    (
      ?auto_78843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78842 ?auto_78843 ) ( ON-TABLE ?auto_78837 ) ( ON ?auto_78838 ?auto_78837 ) ( not ( = ?auto_78837 ?auto_78838 ) ) ( not ( = ?auto_78837 ?auto_78839 ) ) ( not ( = ?auto_78837 ?auto_78840 ) ) ( not ( = ?auto_78837 ?auto_78841 ) ) ( not ( = ?auto_78837 ?auto_78842 ) ) ( not ( = ?auto_78837 ?auto_78843 ) ) ( not ( = ?auto_78838 ?auto_78839 ) ) ( not ( = ?auto_78838 ?auto_78840 ) ) ( not ( = ?auto_78838 ?auto_78841 ) ) ( not ( = ?auto_78838 ?auto_78842 ) ) ( not ( = ?auto_78838 ?auto_78843 ) ) ( not ( = ?auto_78839 ?auto_78840 ) ) ( not ( = ?auto_78839 ?auto_78841 ) ) ( not ( = ?auto_78839 ?auto_78842 ) ) ( not ( = ?auto_78839 ?auto_78843 ) ) ( not ( = ?auto_78840 ?auto_78841 ) ) ( not ( = ?auto_78840 ?auto_78842 ) ) ( not ( = ?auto_78840 ?auto_78843 ) ) ( not ( = ?auto_78841 ?auto_78842 ) ) ( not ( = ?auto_78841 ?auto_78843 ) ) ( not ( = ?auto_78842 ?auto_78843 ) ) ( ON ?auto_78841 ?auto_78842 ) ( ON ?auto_78840 ?auto_78841 ) ( CLEAR ?auto_78838 ) ( ON ?auto_78839 ?auto_78840 ) ( CLEAR ?auto_78839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78837 ?auto_78838 ?auto_78839 )
      ( MAKE-6PILE ?auto_78837 ?auto_78838 ?auto_78839 ?auto_78840 ?auto_78841 ?auto_78842 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78863 - BLOCK
      ?auto_78864 - BLOCK
      ?auto_78865 - BLOCK
      ?auto_78866 - BLOCK
      ?auto_78867 - BLOCK
      ?auto_78868 - BLOCK
    )
    :vars
    (
      ?auto_78869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78868 ?auto_78869 ) ( ON-TABLE ?auto_78863 ) ( not ( = ?auto_78863 ?auto_78864 ) ) ( not ( = ?auto_78863 ?auto_78865 ) ) ( not ( = ?auto_78863 ?auto_78866 ) ) ( not ( = ?auto_78863 ?auto_78867 ) ) ( not ( = ?auto_78863 ?auto_78868 ) ) ( not ( = ?auto_78863 ?auto_78869 ) ) ( not ( = ?auto_78864 ?auto_78865 ) ) ( not ( = ?auto_78864 ?auto_78866 ) ) ( not ( = ?auto_78864 ?auto_78867 ) ) ( not ( = ?auto_78864 ?auto_78868 ) ) ( not ( = ?auto_78864 ?auto_78869 ) ) ( not ( = ?auto_78865 ?auto_78866 ) ) ( not ( = ?auto_78865 ?auto_78867 ) ) ( not ( = ?auto_78865 ?auto_78868 ) ) ( not ( = ?auto_78865 ?auto_78869 ) ) ( not ( = ?auto_78866 ?auto_78867 ) ) ( not ( = ?auto_78866 ?auto_78868 ) ) ( not ( = ?auto_78866 ?auto_78869 ) ) ( not ( = ?auto_78867 ?auto_78868 ) ) ( not ( = ?auto_78867 ?auto_78869 ) ) ( not ( = ?auto_78868 ?auto_78869 ) ) ( ON ?auto_78867 ?auto_78868 ) ( ON ?auto_78866 ?auto_78867 ) ( ON ?auto_78865 ?auto_78866 ) ( CLEAR ?auto_78863 ) ( ON ?auto_78864 ?auto_78865 ) ( CLEAR ?auto_78864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78863 ?auto_78864 )
      ( MAKE-6PILE ?auto_78863 ?auto_78864 ?auto_78865 ?auto_78866 ?auto_78867 ?auto_78868 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78889 - BLOCK
      ?auto_78890 - BLOCK
      ?auto_78891 - BLOCK
      ?auto_78892 - BLOCK
      ?auto_78893 - BLOCK
      ?auto_78894 - BLOCK
    )
    :vars
    (
      ?auto_78895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78894 ?auto_78895 ) ( not ( = ?auto_78889 ?auto_78890 ) ) ( not ( = ?auto_78889 ?auto_78891 ) ) ( not ( = ?auto_78889 ?auto_78892 ) ) ( not ( = ?auto_78889 ?auto_78893 ) ) ( not ( = ?auto_78889 ?auto_78894 ) ) ( not ( = ?auto_78889 ?auto_78895 ) ) ( not ( = ?auto_78890 ?auto_78891 ) ) ( not ( = ?auto_78890 ?auto_78892 ) ) ( not ( = ?auto_78890 ?auto_78893 ) ) ( not ( = ?auto_78890 ?auto_78894 ) ) ( not ( = ?auto_78890 ?auto_78895 ) ) ( not ( = ?auto_78891 ?auto_78892 ) ) ( not ( = ?auto_78891 ?auto_78893 ) ) ( not ( = ?auto_78891 ?auto_78894 ) ) ( not ( = ?auto_78891 ?auto_78895 ) ) ( not ( = ?auto_78892 ?auto_78893 ) ) ( not ( = ?auto_78892 ?auto_78894 ) ) ( not ( = ?auto_78892 ?auto_78895 ) ) ( not ( = ?auto_78893 ?auto_78894 ) ) ( not ( = ?auto_78893 ?auto_78895 ) ) ( not ( = ?auto_78894 ?auto_78895 ) ) ( ON ?auto_78893 ?auto_78894 ) ( ON ?auto_78892 ?auto_78893 ) ( ON ?auto_78891 ?auto_78892 ) ( ON ?auto_78890 ?auto_78891 ) ( ON ?auto_78889 ?auto_78890 ) ( CLEAR ?auto_78889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78889 )
      ( MAKE-6PILE ?auto_78889 ?auto_78890 ?auto_78891 ?auto_78892 ?auto_78893 ?auto_78894 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78916 - BLOCK
      ?auto_78917 - BLOCK
      ?auto_78918 - BLOCK
      ?auto_78919 - BLOCK
      ?auto_78920 - BLOCK
      ?auto_78921 - BLOCK
      ?auto_78922 - BLOCK
    )
    :vars
    (
      ?auto_78923 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78921 ) ( ON ?auto_78922 ?auto_78923 ) ( CLEAR ?auto_78922 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78916 ) ( ON ?auto_78917 ?auto_78916 ) ( ON ?auto_78918 ?auto_78917 ) ( ON ?auto_78919 ?auto_78918 ) ( ON ?auto_78920 ?auto_78919 ) ( ON ?auto_78921 ?auto_78920 ) ( not ( = ?auto_78916 ?auto_78917 ) ) ( not ( = ?auto_78916 ?auto_78918 ) ) ( not ( = ?auto_78916 ?auto_78919 ) ) ( not ( = ?auto_78916 ?auto_78920 ) ) ( not ( = ?auto_78916 ?auto_78921 ) ) ( not ( = ?auto_78916 ?auto_78922 ) ) ( not ( = ?auto_78916 ?auto_78923 ) ) ( not ( = ?auto_78917 ?auto_78918 ) ) ( not ( = ?auto_78917 ?auto_78919 ) ) ( not ( = ?auto_78917 ?auto_78920 ) ) ( not ( = ?auto_78917 ?auto_78921 ) ) ( not ( = ?auto_78917 ?auto_78922 ) ) ( not ( = ?auto_78917 ?auto_78923 ) ) ( not ( = ?auto_78918 ?auto_78919 ) ) ( not ( = ?auto_78918 ?auto_78920 ) ) ( not ( = ?auto_78918 ?auto_78921 ) ) ( not ( = ?auto_78918 ?auto_78922 ) ) ( not ( = ?auto_78918 ?auto_78923 ) ) ( not ( = ?auto_78919 ?auto_78920 ) ) ( not ( = ?auto_78919 ?auto_78921 ) ) ( not ( = ?auto_78919 ?auto_78922 ) ) ( not ( = ?auto_78919 ?auto_78923 ) ) ( not ( = ?auto_78920 ?auto_78921 ) ) ( not ( = ?auto_78920 ?auto_78922 ) ) ( not ( = ?auto_78920 ?auto_78923 ) ) ( not ( = ?auto_78921 ?auto_78922 ) ) ( not ( = ?auto_78921 ?auto_78923 ) ) ( not ( = ?auto_78922 ?auto_78923 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78922 ?auto_78923 )
      ( !STACK ?auto_78922 ?auto_78921 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78946 - BLOCK
      ?auto_78947 - BLOCK
      ?auto_78948 - BLOCK
      ?auto_78949 - BLOCK
      ?auto_78950 - BLOCK
      ?auto_78951 - BLOCK
      ?auto_78952 - BLOCK
    )
    :vars
    (
      ?auto_78953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78952 ?auto_78953 ) ( ON-TABLE ?auto_78946 ) ( ON ?auto_78947 ?auto_78946 ) ( ON ?auto_78948 ?auto_78947 ) ( ON ?auto_78949 ?auto_78948 ) ( ON ?auto_78950 ?auto_78949 ) ( not ( = ?auto_78946 ?auto_78947 ) ) ( not ( = ?auto_78946 ?auto_78948 ) ) ( not ( = ?auto_78946 ?auto_78949 ) ) ( not ( = ?auto_78946 ?auto_78950 ) ) ( not ( = ?auto_78946 ?auto_78951 ) ) ( not ( = ?auto_78946 ?auto_78952 ) ) ( not ( = ?auto_78946 ?auto_78953 ) ) ( not ( = ?auto_78947 ?auto_78948 ) ) ( not ( = ?auto_78947 ?auto_78949 ) ) ( not ( = ?auto_78947 ?auto_78950 ) ) ( not ( = ?auto_78947 ?auto_78951 ) ) ( not ( = ?auto_78947 ?auto_78952 ) ) ( not ( = ?auto_78947 ?auto_78953 ) ) ( not ( = ?auto_78948 ?auto_78949 ) ) ( not ( = ?auto_78948 ?auto_78950 ) ) ( not ( = ?auto_78948 ?auto_78951 ) ) ( not ( = ?auto_78948 ?auto_78952 ) ) ( not ( = ?auto_78948 ?auto_78953 ) ) ( not ( = ?auto_78949 ?auto_78950 ) ) ( not ( = ?auto_78949 ?auto_78951 ) ) ( not ( = ?auto_78949 ?auto_78952 ) ) ( not ( = ?auto_78949 ?auto_78953 ) ) ( not ( = ?auto_78950 ?auto_78951 ) ) ( not ( = ?auto_78950 ?auto_78952 ) ) ( not ( = ?auto_78950 ?auto_78953 ) ) ( not ( = ?auto_78951 ?auto_78952 ) ) ( not ( = ?auto_78951 ?auto_78953 ) ) ( not ( = ?auto_78952 ?auto_78953 ) ) ( CLEAR ?auto_78950 ) ( ON ?auto_78951 ?auto_78952 ) ( CLEAR ?auto_78951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78946 ?auto_78947 ?auto_78948 ?auto_78949 ?auto_78950 ?auto_78951 )
      ( MAKE-7PILE ?auto_78946 ?auto_78947 ?auto_78948 ?auto_78949 ?auto_78950 ?auto_78951 ?auto_78952 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78976 - BLOCK
      ?auto_78977 - BLOCK
      ?auto_78978 - BLOCK
      ?auto_78979 - BLOCK
      ?auto_78980 - BLOCK
      ?auto_78981 - BLOCK
      ?auto_78982 - BLOCK
    )
    :vars
    (
      ?auto_78983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78982 ?auto_78983 ) ( ON-TABLE ?auto_78976 ) ( ON ?auto_78977 ?auto_78976 ) ( ON ?auto_78978 ?auto_78977 ) ( ON ?auto_78979 ?auto_78978 ) ( not ( = ?auto_78976 ?auto_78977 ) ) ( not ( = ?auto_78976 ?auto_78978 ) ) ( not ( = ?auto_78976 ?auto_78979 ) ) ( not ( = ?auto_78976 ?auto_78980 ) ) ( not ( = ?auto_78976 ?auto_78981 ) ) ( not ( = ?auto_78976 ?auto_78982 ) ) ( not ( = ?auto_78976 ?auto_78983 ) ) ( not ( = ?auto_78977 ?auto_78978 ) ) ( not ( = ?auto_78977 ?auto_78979 ) ) ( not ( = ?auto_78977 ?auto_78980 ) ) ( not ( = ?auto_78977 ?auto_78981 ) ) ( not ( = ?auto_78977 ?auto_78982 ) ) ( not ( = ?auto_78977 ?auto_78983 ) ) ( not ( = ?auto_78978 ?auto_78979 ) ) ( not ( = ?auto_78978 ?auto_78980 ) ) ( not ( = ?auto_78978 ?auto_78981 ) ) ( not ( = ?auto_78978 ?auto_78982 ) ) ( not ( = ?auto_78978 ?auto_78983 ) ) ( not ( = ?auto_78979 ?auto_78980 ) ) ( not ( = ?auto_78979 ?auto_78981 ) ) ( not ( = ?auto_78979 ?auto_78982 ) ) ( not ( = ?auto_78979 ?auto_78983 ) ) ( not ( = ?auto_78980 ?auto_78981 ) ) ( not ( = ?auto_78980 ?auto_78982 ) ) ( not ( = ?auto_78980 ?auto_78983 ) ) ( not ( = ?auto_78981 ?auto_78982 ) ) ( not ( = ?auto_78981 ?auto_78983 ) ) ( not ( = ?auto_78982 ?auto_78983 ) ) ( ON ?auto_78981 ?auto_78982 ) ( CLEAR ?auto_78979 ) ( ON ?auto_78980 ?auto_78981 ) ( CLEAR ?auto_78980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78976 ?auto_78977 ?auto_78978 ?auto_78979 ?auto_78980 )
      ( MAKE-7PILE ?auto_78976 ?auto_78977 ?auto_78978 ?auto_78979 ?auto_78980 ?auto_78981 ?auto_78982 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79006 - BLOCK
      ?auto_79007 - BLOCK
      ?auto_79008 - BLOCK
      ?auto_79009 - BLOCK
      ?auto_79010 - BLOCK
      ?auto_79011 - BLOCK
      ?auto_79012 - BLOCK
    )
    :vars
    (
      ?auto_79013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79012 ?auto_79013 ) ( ON-TABLE ?auto_79006 ) ( ON ?auto_79007 ?auto_79006 ) ( ON ?auto_79008 ?auto_79007 ) ( not ( = ?auto_79006 ?auto_79007 ) ) ( not ( = ?auto_79006 ?auto_79008 ) ) ( not ( = ?auto_79006 ?auto_79009 ) ) ( not ( = ?auto_79006 ?auto_79010 ) ) ( not ( = ?auto_79006 ?auto_79011 ) ) ( not ( = ?auto_79006 ?auto_79012 ) ) ( not ( = ?auto_79006 ?auto_79013 ) ) ( not ( = ?auto_79007 ?auto_79008 ) ) ( not ( = ?auto_79007 ?auto_79009 ) ) ( not ( = ?auto_79007 ?auto_79010 ) ) ( not ( = ?auto_79007 ?auto_79011 ) ) ( not ( = ?auto_79007 ?auto_79012 ) ) ( not ( = ?auto_79007 ?auto_79013 ) ) ( not ( = ?auto_79008 ?auto_79009 ) ) ( not ( = ?auto_79008 ?auto_79010 ) ) ( not ( = ?auto_79008 ?auto_79011 ) ) ( not ( = ?auto_79008 ?auto_79012 ) ) ( not ( = ?auto_79008 ?auto_79013 ) ) ( not ( = ?auto_79009 ?auto_79010 ) ) ( not ( = ?auto_79009 ?auto_79011 ) ) ( not ( = ?auto_79009 ?auto_79012 ) ) ( not ( = ?auto_79009 ?auto_79013 ) ) ( not ( = ?auto_79010 ?auto_79011 ) ) ( not ( = ?auto_79010 ?auto_79012 ) ) ( not ( = ?auto_79010 ?auto_79013 ) ) ( not ( = ?auto_79011 ?auto_79012 ) ) ( not ( = ?auto_79011 ?auto_79013 ) ) ( not ( = ?auto_79012 ?auto_79013 ) ) ( ON ?auto_79011 ?auto_79012 ) ( ON ?auto_79010 ?auto_79011 ) ( CLEAR ?auto_79008 ) ( ON ?auto_79009 ?auto_79010 ) ( CLEAR ?auto_79009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79006 ?auto_79007 ?auto_79008 ?auto_79009 )
      ( MAKE-7PILE ?auto_79006 ?auto_79007 ?auto_79008 ?auto_79009 ?auto_79010 ?auto_79011 ?auto_79012 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79036 - BLOCK
      ?auto_79037 - BLOCK
      ?auto_79038 - BLOCK
      ?auto_79039 - BLOCK
      ?auto_79040 - BLOCK
      ?auto_79041 - BLOCK
      ?auto_79042 - BLOCK
    )
    :vars
    (
      ?auto_79043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79042 ?auto_79043 ) ( ON-TABLE ?auto_79036 ) ( ON ?auto_79037 ?auto_79036 ) ( not ( = ?auto_79036 ?auto_79037 ) ) ( not ( = ?auto_79036 ?auto_79038 ) ) ( not ( = ?auto_79036 ?auto_79039 ) ) ( not ( = ?auto_79036 ?auto_79040 ) ) ( not ( = ?auto_79036 ?auto_79041 ) ) ( not ( = ?auto_79036 ?auto_79042 ) ) ( not ( = ?auto_79036 ?auto_79043 ) ) ( not ( = ?auto_79037 ?auto_79038 ) ) ( not ( = ?auto_79037 ?auto_79039 ) ) ( not ( = ?auto_79037 ?auto_79040 ) ) ( not ( = ?auto_79037 ?auto_79041 ) ) ( not ( = ?auto_79037 ?auto_79042 ) ) ( not ( = ?auto_79037 ?auto_79043 ) ) ( not ( = ?auto_79038 ?auto_79039 ) ) ( not ( = ?auto_79038 ?auto_79040 ) ) ( not ( = ?auto_79038 ?auto_79041 ) ) ( not ( = ?auto_79038 ?auto_79042 ) ) ( not ( = ?auto_79038 ?auto_79043 ) ) ( not ( = ?auto_79039 ?auto_79040 ) ) ( not ( = ?auto_79039 ?auto_79041 ) ) ( not ( = ?auto_79039 ?auto_79042 ) ) ( not ( = ?auto_79039 ?auto_79043 ) ) ( not ( = ?auto_79040 ?auto_79041 ) ) ( not ( = ?auto_79040 ?auto_79042 ) ) ( not ( = ?auto_79040 ?auto_79043 ) ) ( not ( = ?auto_79041 ?auto_79042 ) ) ( not ( = ?auto_79041 ?auto_79043 ) ) ( not ( = ?auto_79042 ?auto_79043 ) ) ( ON ?auto_79041 ?auto_79042 ) ( ON ?auto_79040 ?auto_79041 ) ( ON ?auto_79039 ?auto_79040 ) ( CLEAR ?auto_79037 ) ( ON ?auto_79038 ?auto_79039 ) ( CLEAR ?auto_79038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79036 ?auto_79037 ?auto_79038 )
      ( MAKE-7PILE ?auto_79036 ?auto_79037 ?auto_79038 ?auto_79039 ?auto_79040 ?auto_79041 ?auto_79042 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79066 - BLOCK
      ?auto_79067 - BLOCK
      ?auto_79068 - BLOCK
      ?auto_79069 - BLOCK
      ?auto_79070 - BLOCK
      ?auto_79071 - BLOCK
      ?auto_79072 - BLOCK
    )
    :vars
    (
      ?auto_79073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79072 ?auto_79073 ) ( ON-TABLE ?auto_79066 ) ( not ( = ?auto_79066 ?auto_79067 ) ) ( not ( = ?auto_79066 ?auto_79068 ) ) ( not ( = ?auto_79066 ?auto_79069 ) ) ( not ( = ?auto_79066 ?auto_79070 ) ) ( not ( = ?auto_79066 ?auto_79071 ) ) ( not ( = ?auto_79066 ?auto_79072 ) ) ( not ( = ?auto_79066 ?auto_79073 ) ) ( not ( = ?auto_79067 ?auto_79068 ) ) ( not ( = ?auto_79067 ?auto_79069 ) ) ( not ( = ?auto_79067 ?auto_79070 ) ) ( not ( = ?auto_79067 ?auto_79071 ) ) ( not ( = ?auto_79067 ?auto_79072 ) ) ( not ( = ?auto_79067 ?auto_79073 ) ) ( not ( = ?auto_79068 ?auto_79069 ) ) ( not ( = ?auto_79068 ?auto_79070 ) ) ( not ( = ?auto_79068 ?auto_79071 ) ) ( not ( = ?auto_79068 ?auto_79072 ) ) ( not ( = ?auto_79068 ?auto_79073 ) ) ( not ( = ?auto_79069 ?auto_79070 ) ) ( not ( = ?auto_79069 ?auto_79071 ) ) ( not ( = ?auto_79069 ?auto_79072 ) ) ( not ( = ?auto_79069 ?auto_79073 ) ) ( not ( = ?auto_79070 ?auto_79071 ) ) ( not ( = ?auto_79070 ?auto_79072 ) ) ( not ( = ?auto_79070 ?auto_79073 ) ) ( not ( = ?auto_79071 ?auto_79072 ) ) ( not ( = ?auto_79071 ?auto_79073 ) ) ( not ( = ?auto_79072 ?auto_79073 ) ) ( ON ?auto_79071 ?auto_79072 ) ( ON ?auto_79070 ?auto_79071 ) ( ON ?auto_79069 ?auto_79070 ) ( ON ?auto_79068 ?auto_79069 ) ( CLEAR ?auto_79066 ) ( ON ?auto_79067 ?auto_79068 ) ( CLEAR ?auto_79067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79066 ?auto_79067 )
      ( MAKE-7PILE ?auto_79066 ?auto_79067 ?auto_79068 ?auto_79069 ?auto_79070 ?auto_79071 ?auto_79072 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79096 - BLOCK
      ?auto_79097 - BLOCK
      ?auto_79098 - BLOCK
      ?auto_79099 - BLOCK
      ?auto_79100 - BLOCK
      ?auto_79101 - BLOCK
      ?auto_79102 - BLOCK
    )
    :vars
    (
      ?auto_79103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79102 ?auto_79103 ) ( not ( = ?auto_79096 ?auto_79097 ) ) ( not ( = ?auto_79096 ?auto_79098 ) ) ( not ( = ?auto_79096 ?auto_79099 ) ) ( not ( = ?auto_79096 ?auto_79100 ) ) ( not ( = ?auto_79096 ?auto_79101 ) ) ( not ( = ?auto_79096 ?auto_79102 ) ) ( not ( = ?auto_79096 ?auto_79103 ) ) ( not ( = ?auto_79097 ?auto_79098 ) ) ( not ( = ?auto_79097 ?auto_79099 ) ) ( not ( = ?auto_79097 ?auto_79100 ) ) ( not ( = ?auto_79097 ?auto_79101 ) ) ( not ( = ?auto_79097 ?auto_79102 ) ) ( not ( = ?auto_79097 ?auto_79103 ) ) ( not ( = ?auto_79098 ?auto_79099 ) ) ( not ( = ?auto_79098 ?auto_79100 ) ) ( not ( = ?auto_79098 ?auto_79101 ) ) ( not ( = ?auto_79098 ?auto_79102 ) ) ( not ( = ?auto_79098 ?auto_79103 ) ) ( not ( = ?auto_79099 ?auto_79100 ) ) ( not ( = ?auto_79099 ?auto_79101 ) ) ( not ( = ?auto_79099 ?auto_79102 ) ) ( not ( = ?auto_79099 ?auto_79103 ) ) ( not ( = ?auto_79100 ?auto_79101 ) ) ( not ( = ?auto_79100 ?auto_79102 ) ) ( not ( = ?auto_79100 ?auto_79103 ) ) ( not ( = ?auto_79101 ?auto_79102 ) ) ( not ( = ?auto_79101 ?auto_79103 ) ) ( not ( = ?auto_79102 ?auto_79103 ) ) ( ON ?auto_79101 ?auto_79102 ) ( ON ?auto_79100 ?auto_79101 ) ( ON ?auto_79099 ?auto_79100 ) ( ON ?auto_79098 ?auto_79099 ) ( ON ?auto_79097 ?auto_79098 ) ( ON ?auto_79096 ?auto_79097 ) ( CLEAR ?auto_79096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79096 )
      ( MAKE-7PILE ?auto_79096 ?auto_79097 ?auto_79098 ?auto_79099 ?auto_79100 ?auto_79101 ?auto_79102 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_79127 - BLOCK
      ?auto_79128 - BLOCK
      ?auto_79129 - BLOCK
      ?auto_79130 - BLOCK
      ?auto_79131 - BLOCK
      ?auto_79132 - BLOCK
      ?auto_79133 - BLOCK
      ?auto_79134 - BLOCK
    )
    :vars
    (
      ?auto_79135 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_79133 ) ( ON ?auto_79134 ?auto_79135 ) ( CLEAR ?auto_79134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79127 ) ( ON ?auto_79128 ?auto_79127 ) ( ON ?auto_79129 ?auto_79128 ) ( ON ?auto_79130 ?auto_79129 ) ( ON ?auto_79131 ?auto_79130 ) ( ON ?auto_79132 ?auto_79131 ) ( ON ?auto_79133 ?auto_79132 ) ( not ( = ?auto_79127 ?auto_79128 ) ) ( not ( = ?auto_79127 ?auto_79129 ) ) ( not ( = ?auto_79127 ?auto_79130 ) ) ( not ( = ?auto_79127 ?auto_79131 ) ) ( not ( = ?auto_79127 ?auto_79132 ) ) ( not ( = ?auto_79127 ?auto_79133 ) ) ( not ( = ?auto_79127 ?auto_79134 ) ) ( not ( = ?auto_79127 ?auto_79135 ) ) ( not ( = ?auto_79128 ?auto_79129 ) ) ( not ( = ?auto_79128 ?auto_79130 ) ) ( not ( = ?auto_79128 ?auto_79131 ) ) ( not ( = ?auto_79128 ?auto_79132 ) ) ( not ( = ?auto_79128 ?auto_79133 ) ) ( not ( = ?auto_79128 ?auto_79134 ) ) ( not ( = ?auto_79128 ?auto_79135 ) ) ( not ( = ?auto_79129 ?auto_79130 ) ) ( not ( = ?auto_79129 ?auto_79131 ) ) ( not ( = ?auto_79129 ?auto_79132 ) ) ( not ( = ?auto_79129 ?auto_79133 ) ) ( not ( = ?auto_79129 ?auto_79134 ) ) ( not ( = ?auto_79129 ?auto_79135 ) ) ( not ( = ?auto_79130 ?auto_79131 ) ) ( not ( = ?auto_79130 ?auto_79132 ) ) ( not ( = ?auto_79130 ?auto_79133 ) ) ( not ( = ?auto_79130 ?auto_79134 ) ) ( not ( = ?auto_79130 ?auto_79135 ) ) ( not ( = ?auto_79131 ?auto_79132 ) ) ( not ( = ?auto_79131 ?auto_79133 ) ) ( not ( = ?auto_79131 ?auto_79134 ) ) ( not ( = ?auto_79131 ?auto_79135 ) ) ( not ( = ?auto_79132 ?auto_79133 ) ) ( not ( = ?auto_79132 ?auto_79134 ) ) ( not ( = ?auto_79132 ?auto_79135 ) ) ( not ( = ?auto_79133 ?auto_79134 ) ) ( not ( = ?auto_79133 ?auto_79135 ) ) ( not ( = ?auto_79134 ?auto_79135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79134 ?auto_79135 )
      ( !STACK ?auto_79134 ?auto_79133 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_79161 - BLOCK
      ?auto_79162 - BLOCK
      ?auto_79163 - BLOCK
      ?auto_79164 - BLOCK
      ?auto_79165 - BLOCK
      ?auto_79166 - BLOCK
      ?auto_79167 - BLOCK
      ?auto_79168 - BLOCK
    )
    :vars
    (
      ?auto_79169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79168 ?auto_79169 ) ( ON-TABLE ?auto_79161 ) ( ON ?auto_79162 ?auto_79161 ) ( ON ?auto_79163 ?auto_79162 ) ( ON ?auto_79164 ?auto_79163 ) ( ON ?auto_79165 ?auto_79164 ) ( ON ?auto_79166 ?auto_79165 ) ( not ( = ?auto_79161 ?auto_79162 ) ) ( not ( = ?auto_79161 ?auto_79163 ) ) ( not ( = ?auto_79161 ?auto_79164 ) ) ( not ( = ?auto_79161 ?auto_79165 ) ) ( not ( = ?auto_79161 ?auto_79166 ) ) ( not ( = ?auto_79161 ?auto_79167 ) ) ( not ( = ?auto_79161 ?auto_79168 ) ) ( not ( = ?auto_79161 ?auto_79169 ) ) ( not ( = ?auto_79162 ?auto_79163 ) ) ( not ( = ?auto_79162 ?auto_79164 ) ) ( not ( = ?auto_79162 ?auto_79165 ) ) ( not ( = ?auto_79162 ?auto_79166 ) ) ( not ( = ?auto_79162 ?auto_79167 ) ) ( not ( = ?auto_79162 ?auto_79168 ) ) ( not ( = ?auto_79162 ?auto_79169 ) ) ( not ( = ?auto_79163 ?auto_79164 ) ) ( not ( = ?auto_79163 ?auto_79165 ) ) ( not ( = ?auto_79163 ?auto_79166 ) ) ( not ( = ?auto_79163 ?auto_79167 ) ) ( not ( = ?auto_79163 ?auto_79168 ) ) ( not ( = ?auto_79163 ?auto_79169 ) ) ( not ( = ?auto_79164 ?auto_79165 ) ) ( not ( = ?auto_79164 ?auto_79166 ) ) ( not ( = ?auto_79164 ?auto_79167 ) ) ( not ( = ?auto_79164 ?auto_79168 ) ) ( not ( = ?auto_79164 ?auto_79169 ) ) ( not ( = ?auto_79165 ?auto_79166 ) ) ( not ( = ?auto_79165 ?auto_79167 ) ) ( not ( = ?auto_79165 ?auto_79168 ) ) ( not ( = ?auto_79165 ?auto_79169 ) ) ( not ( = ?auto_79166 ?auto_79167 ) ) ( not ( = ?auto_79166 ?auto_79168 ) ) ( not ( = ?auto_79166 ?auto_79169 ) ) ( not ( = ?auto_79167 ?auto_79168 ) ) ( not ( = ?auto_79167 ?auto_79169 ) ) ( not ( = ?auto_79168 ?auto_79169 ) ) ( CLEAR ?auto_79166 ) ( ON ?auto_79167 ?auto_79168 ) ( CLEAR ?auto_79167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79161 ?auto_79162 ?auto_79163 ?auto_79164 ?auto_79165 ?auto_79166 ?auto_79167 )
      ( MAKE-8PILE ?auto_79161 ?auto_79162 ?auto_79163 ?auto_79164 ?auto_79165 ?auto_79166 ?auto_79167 ?auto_79168 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_79195 - BLOCK
      ?auto_79196 - BLOCK
      ?auto_79197 - BLOCK
      ?auto_79198 - BLOCK
      ?auto_79199 - BLOCK
      ?auto_79200 - BLOCK
      ?auto_79201 - BLOCK
      ?auto_79202 - BLOCK
    )
    :vars
    (
      ?auto_79203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79202 ?auto_79203 ) ( ON-TABLE ?auto_79195 ) ( ON ?auto_79196 ?auto_79195 ) ( ON ?auto_79197 ?auto_79196 ) ( ON ?auto_79198 ?auto_79197 ) ( ON ?auto_79199 ?auto_79198 ) ( not ( = ?auto_79195 ?auto_79196 ) ) ( not ( = ?auto_79195 ?auto_79197 ) ) ( not ( = ?auto_79195 ?auto_79198 ) ) ( not ( = ?auto_79195 ?auto_79199 ) ) ( not ( = ?auto_79195 ?auto_79200 ) ) ( not ( = ?auto_79195 ?auto_79201 ) ) ( not ( = ?auto_79195 ?auto_79202 ) ) ( not ( = ?auto_79195 ?auto_79203 ) ) ( not ( = ?auto_79196 ?auto_79197 ) ) ( not ( = ?auto_79196 ?auto_79198 ) ) ( not ( = ?auto_79196 ?auto_79199 ) ) ( not ( = ?auto_79196 ?auto_79200 ) ) ( not ( = ?auto_79196 ?auto_79201 ) ) ( not ( = ?auto_79196 ?auto_79202 ) ) ( not ( = ?auto_79196 ?auto_79203 ) ) ( not ( = ?auto_79197 ?auto_79198 ) ) ( not ( = ?auto_79197 ?auto_79199 ) ) ( not ( = ?auto_79197 ?auto_79200 ) ) ( not ( = ?auto_79197 ?auto_79201 ) ) ( not ( = ?auto_79197 ?auto_79202 ) ) ( not ( = ?auto_79197 ?auto_79203 ) ) ( not ( = ?auto_79198 ?auto_79199 ) ) ( not ( = ?auto_79198 ?auto_79200 ) ) ( not ( = ?auto_79198 ?auto_79201 ) ) ( not ( = ?auto_79198 ?auto_79202 ) ) ( not ( = ?auto_79198 ?auto_79203 ) ) ( not ( = ?auto_79199 ?auto_79200 ) ) ( not ( = ?auto_79199 ?auto_79201 ) ) ( not ( = ?auto_79199 ?auto_79202 ) ) ( not ( = ?auto_79199 ?auto_79203 ) ) ( not ( = ?auto_79200 ?auto_79201 ) ) ( not ( = ?auto_79200 ?auto_79202 ) ) ( not ( = ?auto_79200 ?auto_79203 ) ) ( not ( = ?auto_79201 ?auto_79202 ) ) ( not ( = ?auto_79201 ?auto_79203 ) ) ( not ( = ?auto_79202 ?auto_79203 ) ) ( ON ?auto_79201 ?auto_79202 ) ( CLEAR ?auto_79199 ) ( ON ?auto_79200 ?auto_79201 ) ( CLEAR ?auto_79200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79195 ?auto_79196 ?auto_79197 ?auto_79198 ?auto_79199 ?auto_79200 )
      ( MAKE-8PILE ?auto_79195 ?auto_79196 ?auto_79197 ?auto_79198 ?auto_79199 ?auto_79200 ?auto_79201 ?auto_79202 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_79229 - BLOCK
      ?auto_79230 - BLOCK
      ?auto_79231 - BLOCK
      ?auto_79232 - BLOCK
      ?auto_79233 - BLOCK
      ?auto_79234 - BLOCK
      ?auto_79235 - BLOCK
      ?auto_79236 - BLOCK
    )
    :vars
    (
      ?auto_79237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79236 ?auto_79237 ) ( ON-TABLE ?auto_79229 ) ( ON ?auto_79230 ?auto_79229 ) ( ON ?auto_79231 ?auto_79230 ) ( ON ?auto_79232 ?auto_79231 ) ( not ( = ?auto_79229 ?auto_79230 ) ) ( not ( = ?auto_79229 ?auto_79231 ) ) ( not ( = ?auto_79229 ?auto_79232 ) ) ( not ( = ?auto_79229 ?auto_79233 ) ) ( not ( = ?auto_79229 ?auto_79234 ) ) ( not ( = ?auto_79229 ?auto_79235 ) ) ( not ( = ?auto_79229 ?auto_79236 ) ) ( not ( = ?auto_79229 ?auto_79237 ) ) ( not ( = ?auto_79230 ?auto_79231 ) ) ( not ( = ?auto_79230 ?auto_79232 ) ) ( not ( = ?auto_79230 ?auto_79233 ) ) ( not ( = ?auto_79230 ?auto_79234 ) ) ( not ( = ?auto_79230 ?auto_79235 ) ) ( not ( = ?auto_79230 ?auto_79236 ) ) ( not ( = ?auto_79230 ?auto_79237 ) ) ( not ( = ?auto_79231 ?auto_79232 ) ) ( not ( = ?auto_79231 ?auto_79233 ) ) ( not ( = ?auto_79231 ?auto_79234 ) ) ( not ( = ?auto_79231 ?auto_79235 ) ) ( not ( = ?auto_79231 ?auto_79236 ) ) ( not ( = ?auto_79231 ?auto_79237 ) ) ( not ( = ?auto_79232 ?auto_79233 ) ) ( not ( = ?auto_79232 ?auto_79234 ) ) ( not ( = ?auto_79232 ?auto_79235 ) ) ( not ( = ?auto_79232 ?auto_79236 ) ) ( not ( = ?auto_79232 ?auto_79237 ) ) ( not ( = ?auto_79233 ?auto_79234 ) ) ( not ( = ?auto_79233 ?auto_79235 ) ) ( not ( = ?auto_79233 ?auto_79236 ) ) ( not ( = ?auto_79233 ?auto_79237 ) ) ( not ( = ?auto_79234 ?auto_79235 ) ) ( not ( = ?auto_79234 ?auto_79236 ) ) ( not ( = ?auto_79234 ?auto_79237 ) ) ( not ( = ?auto_79235 ?auto_79236 ) ) ( not ( = ?auto_79235 ?auto_79237 ) ) ( not ( = ?auto_79236 ?auto_79237 ) ) ( ON ?auto_79235 ?auto_79236 ) ( ON ?auto_79234 ?auto_79235 ) ( CLEAR ?auto_79232 ) ( ON ?auto_79233 ?auto_79234 ) ( CLEAR ?auto_79233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79229 ?auto_79230 ?auto_79231 ?auto_79232 ?auto_79233 )
      ( MAKE-8PILE ?auto_79229 ?auto_79230 ?auto_79231 ?auto_79232 ?auto_79233 ?auto_79234 ?auto_79235 ?auto_79236 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_79263 - BLOCK
      ?auto_79264 - BLOCK
      ?auto_79265 - BLOCK
      ?auto_79266 - BLOCK
      ?auto_79267 - BLOCK
      ?auto_79268 - BLOCK
      ?auto_79269 - BLOCK
      ?auto_79270 - BLOCK
    )
    :vars
    (
      ?auto_79271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79270 ?auto_79271 ) ( ON-TABLE ?auto_79263 ) ( ON ?auto_79264 ?auto_79263 ) ( ON ?auto_79265 ?auto_79264 ) ( not ( = ?auto_79263 ?auto_79264 ) ) ( not ( = ?auto_79263 ?auto_79265 ) ) ( not ( = ?auto_79263 ?auto_79266 ) ) ( not ( = ?auto_79263 ?auto_79267 ) ) ( not ( = ?auto_79263 ?auto_79268 ) ) ( not ( = ?auto_79263 ?auto_79269 ) ) ( not ( = ?auto_79263 ?auto_79270 ) ) ( not ( = ?auto_79263 ?auto_79271 ) ) ( not ( = ?auto_79264 ?auto_79265 ) ) ( not ( = ?auto_79264 ?auto_79266 ) ) ( not ( = ?auto_79264 ?auto_79267 ) ) ( not ( = ?auto_79264 ?auto_79268 ) ) ( not ( = ?auto_79264 ?auto_79269 ) ) ( not ( = ?auto_79264 ?auto_79270 ) ) ( not ( = ?auto_79264 ?auto_79271 ) ) ( not ( = ?auto_79265 ?auto_79266 ) ) ( not ( = ?auto_79265 ?auto_79267 ) ) ( not ( = ?auto_79265 ?auto_79268 ) ) ( not ( = ?auto_79265 ?auto_79269 ) ) ( not ( = ?auto_79265 ?auto_79270 ) ) ( not ( = ?auto_79265 ?auto_79271 ) ) ( not ( = ?auto_79266 ?auto_79267 ) ) ( not ( = ?auto_79266 ?auto_79268 ) ) ( not ( = ?auto_79266 ?auto_79269 ) ) ( not ( = ?auto_79266 ?auto_79270 ) ) ( not ( = ?auto_79266 ?auto_79271 ) ) ( not ( = ?auto_79267 ?auto_79268 ) ) ( not ( = ?auto_79267 ?auto_79269 ) ) ( not ( = ?auto_79267 ?auto_79270 ) ) ( not ( = ?auto_79267 ?auto_79271 ) ) ( not ( = ?auto_79268 ?auto_79269 ) ) ( not ( = ?auto_79268 ?auto_79270 ) ) ( not ( = ?auto_79268 ?auto_79271 ) ) ( not ( = ?auto_79269 ?auto_79270 ) ) ( not ( = ?auto_79269 ?auto_79271 ) ) ( not ( = ?auto_79270 ?auto_79271 ) ) ( ON ?auto_79269 ?auto_79270 ) ( ON ?auto_79268 ?auto_79269 ) ( ON ?auto_79267 ?auto_79268 ) ( CLEAR ?auto_79265 ) ( ON ?auto_79266 ?auto_79267 ) ( CLEAR ?auto_79266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79263 ?auto_79264 ?auto_79265 ?auto_79266 )
      ( MAKE-8PILE ?auto_79263 ?auto_79264 ?auto_79265 ?auto_79266 ?auto_79267 ?auto_79268 ?auto_79269 ?auto_79270 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_79297 - BLOCK
      ?auto_79298 - BLOCK
      ?auto_79299 - BLOCK
      ?auto_79300 - BLOCK
      ?auto_79301 - BLOCK
      ?auto_79302 - BLOCK
      ?auto_79303 - BLOCK
      ?auto_79304 - BLOCK
    )
    :vars
    (
      ?auto_79305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79304 ?auto_79305 ) ( ON-TABLE ?auto_79297 ) ( ON ?auto_79298 ?auto_79297 ) ( not ( = ?auto_79297 ?auto_79298 ) ) ( not ( = ?auto_79297 ?auto_79299 ) ) ( not ( = ?auto_79297 ?auto_79300 ) ) ( not ( = ?auto_79297 ?auto_79301 ) ) ( not ( = ?auto_79297 ?auto_79302 ) ) ( not ( = ?auto_79297 ?auto_79303 ) ) ( not ( = ?auto_79297 ?auto_79304 ) ) ( not ( = ?auto_79297 ?auto_79305 ) ) ( not ( = ?auto_79298 ?auto_79299 ) ) ( not ( = ?auto_79298 ?auto_79300 ) ) ( not ( = ?auto_79298 ?auto_79301 ) ) ( not ( = ?auto_79298 ?auto_79302 ) ) ( not ( = ?auto_79298 ?auto_79303 ) ) ( not ( = ?auto_79298 ?auto_79304 ) ) ( not ( = ?auto_79298 ?auto_79305 ) ) ( not ( = ?auto_79299 ?auto_79300 ) ) ( not ( = ?auto_79299 ?auto_79301 ) ) ( not ( = ?auto_79299 ?auto_79302 ) ) ( not ( = ?auto_79299 ?auto_79303 ) ) ( not ( = ?auto_79299 ?auto_79304 ) ) ( not ( = ?auto_79299 ?auto_79305 ) ) ( not ( = ?auto_79300 ?auto_79301 ) ) ( not ( = ?auto_79300 ?auto_79302 ) ) ( not ( = ?auto_79300 ?auto_79303 ) ) ( not ( = ?auto_79300 ?auto_79304 ) ) ( not ( = ?auto_79300 ?auto_79305 ) ) ( not ( = ?auto_79301 ?auto_79302 ) ) ( not ( = ?auto_79301 ?auto_79303 ) ) ( not ( = ?auto_79301 ?auto_79304 ) ) ( not ( = ?auto_79301 ?auto_79305 ) ) ( not ( = ?auto_79302 ?auto_79303 ) ) ( not ( = ?auto_79302 ?auto_79304 ) ) ( not ( = ?auto_79302 ?auto_79305 ) ) ( not ( = ?auto_79303 ?auto_79304 ) ) ( not ( = ?auto_79303 ?auto_79305 ) ) ( not ( = ?auto_79304 ?auto_79305 ) ) ( ON ?auto_79303 ?auto_79304 ) ( ON ?auto_79302 ?auto_79303 ) ( ON ?auto_79301 ?auto_79302 ) ( ON ?auto_79300 ?auto_79301 ) ( CLEAR ?auto_79298 ) ( ON ?auto_79299 ?auto_79300 ) ( CLEAR ?auto_79299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79297 ?auto_79298 ?auto_79299 )
      ( MAKE-8PILE ?auto_79297 ?auto_79298 ?auto_79299 ?auto_79300 ?auto_79301 ?auto_79302 ?auto_79303 ?auto_79304 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_79331 - BLOCK
      ?auto_79332 - BLOCK
      ?auto_79333 - BLOCK
      ?auto_79334 - BLOCK
      ?auto_79335 - BLOCK
      ?auto_79336 - BLOCK
      ?auto_79337 - BLOCK
      ?auto_79338 - BLOCK
    )
    :vars
    (
      ?auto_79339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79338 ?auto_79339 ) ( ON-TABLE ?auto_79331 ) ( not ( = ?auto_79331 ?auto_79332 ) ) ( not ( = ?auto_79331 ?auto_79333 ) ) ( not ( = ?auto_79331 ?auto_79334 ) ) ( not ( = ?auto_79331 ?auto_79335 ) ) ( not ( = ?auto_79331 ?auto_79336 ) ) ( not ( = ?auto_79331 ?auto_79337 ) ) ( not ( = ?auto_79331 ?auto_79338 ) ) ( not ( = ?auto_79331 ?auto_79339 ) ) ( not ( = ?auto_79332 ?auto_79333 ) ) ( not ( = ?auto_79332 ?auto_79334 ) ) ( not ( = ?auto_79332 ?auto_79335 ) ) ( not ( = ?auto_79332 ?auto_79336 ) ) ( not ( = ?auto_79332 ?auto_79337 ) ) ( not ( = ?auto_79332 ?auto_79338 ) ) ( not ( = ?auto_79332 ?auto_79339 ) ) ( not ( = ?auto_79333 ?auto_79334 ) ) ( not ( = ?auto_79333 ?auto_79335 ) ) ( not ( = ?auto_79333 ?auto_79336 ) ) ( not ( = ?auto_79333 ?auto_79337 ) ) ( not ( = ?auto_79333 ?auto_79338 ) ) ( not ( = ?auto_79333 ?auto_79339 ) ) ( not ( = ?auto_79334 ?auto_79335 ) ) ( not ( = ?auto_79334 ?auto_79336 ) ) ( not ( = ?auto_79334 ?auto_79337 ) ) ( not ( = ?auto_79334 ?auto_79338 ) ) ( not ( = ?auto_79334 ?auto_79339 ) ) ( not ( = ?auto_79335 ?auto_79336 ) ) ( not ( = ?auto_79335 ?auto_79337 ) ) ( not ( = ?auto_79335 ?auto_79338 ) ) ( not ( = ?auto_79335 ?auto_79339 ) ) ( not ( = ?auto_79336 ?auto_79337 ) ) ( not ( = ?auto_79336 ?auto_79338 ) ) ( not ( = ?auto_79336 ?auto_79339 ) ) ( not ( = ?auto_79337 ?auto_79338 ) ) ( not ( = ?auto_79337 ?auto_79339 ) ) ( not ( = ?auto_79338 ?auto_79339 ) ) ( ON ?auto_79337 ?auto_79338 ) ( ON ?auto_79336 ?auto_79337 ) ( ON ?auto_79335 ?auto_79336 ) ( ON ?auto_79334 ?auto_79335 ) ( ON ?auto_79333 ?auto_79334 ) ( CLEAR ?auto_79331 ) ( ON ?auto_79332 ?auto_79333 ) ( CLEAR ?auto_79332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79331 ?auto_79332 )
      ( MAKE-8PILE ?auto_79331 ?auto_79332 ?auto_79333 ?auto_79334 ?auto_79335 ?auto_79336 ?auto_79337 ?auto_79338 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_79365 - BLOCK
      ?auto_79366 - BLOCK
      ?auto_79367 - BLOCK
      ?auto_79368 - BLOCK
      ?auto_79369 - BLOCK
      ?auto_79370 - BLOCK
      ?auto_79371 - BLOCK
      ?auto_79372 - BLOCK
    )
    :vars
    (
      ?auto_79373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79372 ?auto_79373 ) ( not ( = ?auto_79365 ?auto_79366 ) ) ( not ( = ?auto_79365 ?auto_79367 ) ) ( not ( = ?auto_79365 ?auto_79368 ) ) ( not ( = ?auto_79365 ?auto_79369 ) ) ( not ( = ?auto_79365 ?auto_79370 ) ) ( not ( = ?auto_79365 ?auto_79371 ) ) ( not ( = ?auto_79365 ?auto_79372 ) ) ( not ( = ?auto_79365 ?auto_79373 ) ) ( not ( = ?auto_79366 ?auto_79367 ) ) ( not ( = ?auto_79366 ?auto_79368 ) ) ( not ( = ?auto_79366 ?auto_79369 ) ) ( not ( = ?auto_79366 ?auto_79370 ) ) ( not ( = ?auto_79366 ?auto_79371 ) ) ( not ( = ?auto_79366 ?auto_79372 ) ) ( not ( = ?auto_79366 ?auto_79373 ) ) ( not ( = ?auto_79367 ?auto_79368 ) ) ( not ( = ?auto_79367 ?auto_79369 ) ) ( not ( = ?auto_79367 ?auto_79370 ) ) ( not ( = ?auto_79367 ?auto_79371 ) ) ( not ( = ?auto_79367 ?auto_79372 ) ) ( not ( = ?auto_79367 ?auto_79373 ) ) ( not ( = ?auto_79368 ?auto_79369 ) ) ( not ( = ?auto_79368 ?auto_79370 ) ) ( not ( = ?auto_79368 ?auto_79371 ) ) ( not ( = ?auto_79368 ?auto_79372 ) ) ( not ( = ?auto_79368 ?auto_79373 ) ) ( not ( = ?auto_79369 ?auto_79370 ) ) ( not ( = ?auto_79369 ?auto_79371 ) ) ( not ( = ?auto_79369 ?auto_79372 ) ) ( not ( = ?auto_79369 ?auto_79373 ) ) ( not ( = ?auto_79370 ?auto_79371 ) ) ( not ( = ?auto_79370 ?auto_79372 ) ) ( not ( = ?auto_79370 ?auto_79373 ) ) ( not ( = ?auto_79371 ?auto_79372 ) ) ( not ( = ?auto_79371 ?auto_79373 ) ) ( not ( = ?auto_79372 ?auto_79373 ) ) ( ON ?auto_79371 ?auto_79372 ) ( ON ?auto_79370 ?auto_79371 ) ( ON ?auto_79369 ?auto_79370 ) ( ON ?auto_79368 ?auto_79369 ) ( ON ?auto_79367 ?auto_79368 ) ( ON ?auto_79366 ?auto_79367 ) ( ON ?auto_79365 ?auto_79366 ) ( CLEAR ?auto_79365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79365 )
      ( MAKE-8PILE ?auto_79365 ?auto_79366 ?auto_79367 ?auto_79368 ?auto_79369 ?auto_79370 ?auto_79371 ?auto_79372 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_79400 - BLOCK
      ?auto_79401 - BLOCK
      ?auto_79402 - BLOCK
      ?auto_79403 - BLOCK
      ?auto_79404 - BLOCK
      ?auto_79405 - BLOCK
      ?auto_79406 - BLOCK
      ?auto_79407 - BLOCK
      ?auto_79408 - BLOCK
    )
    :vars
    (
      ?auto_79409 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_79407 ) ( ON ?auto_79408 ?auto_79409 ) ( CLEAR ?auto_79408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79400 ) ( ON ?auto_79401 ?auto_79400 ) ( ON ?auto_79402 ?auto_79401 ) ( ON ?auto_79403 ?auto_79402 ) ( ON ?auto_79404 ?auto_79403 ) ( ON ?auto_79405 ?auto_79404 ) ( ON ?auto_79406 ?auto_79405 ) ( ON ?auto_79407 ?auto_79406 ) ( not ( = ?auto_79400 ?auto_79401 ) ) ( not ( = ?auto_79400 ?auto_79402 ) ) ( not ( = ?auto_79400 ?auto_79403 ) ) ( not ( = ?auto_79400 ?auto_79404 ) ) ( not ( = ?auto_79400 ?auto_79405 ) ) ( not ( = ?auto_79400 ?auto_79406 ) ) ( not ( = ?auto_79400 ?auto_79407 ) ) ( not ( = ?auto_79400 ?auto_79408 ) ) ( not ( = ?auto_79400 ?auto_79409 ) ) ( not ( = ?auto_79401 ?auto_79402 ) ) ( not ( = ?auto_79401 ?auto_79403 ) ) ( not ( = ?auto_79401 ?auto_79404 ) ) ( not ( = ?auto_79401 ?auto_79405 ) ) ( not ( = ?auto_79401 ?auto_79406 ) ) ( not ( = ?auto_79401 ?auto_79407 ) ) ( not ( = ?auto_79401 ?auto_79408 ) ) ( not ( = ?auto_79401 ?auto_79409 ) ) ( not ( = ?auto_79402 ?auto_79403 ) ) ( not ( = ?auto_79402 ?auto_79404 ) ) ( not ( = ?auto_79402 ?auto_79405 ) ) ( not ( = ?auto_79402 ?auto_79406 ) ) ( not ( = ?auto_79402 ?auto_79407 ) ) ( not ( = ?auto_79402 ?auto_79408 ) ) ( not ( = ?auto_79402 ?auto_79409 ) ) ( not ( = ?auto_79403 ?auto_79404 ) ) ( not ( = ?auto_79403 ?auto_79405 ) ) ( not ( = ?auto_79403 ?auto_79406 ) ) ( not ( = ?auto_79403 ?auto_79407 ) ) ( not ( = ?auto_79403 ?auto_79408 ) ) ( not ( = ?auto_79403 ?auto_79409 ) ) ( not ( = ?auto_79404 ?auto_79405 ) ) ( not ( = ?auto_79404 ?auto_79406 ) ) ( not ( = ?auto_79404 ?auto_79407 ) ) ( not ( = ?auto_79404 ?auto_79408 ) ) ( not ( = ?auto_79404 ?auto_79409 ) ) ( not ( = ?auto_79405 ?auto_79406 ) ) ( not ( = ?auto_79405 ?auto_79407 ) ) ( not ( = ?auto_79405 ?auto_79408 ) ) ( not ( = ?auto_79405 ?auto_79409 ) ) ( not ( = ?auto_79406 ?auto_79407 ) ) ( not ( = ?auto_79406 ?auto_79408 ) ) ( not ( = ?auto_79406 ?auto_79409 ) ) ( not ( = ?auto_79407 ?auto_79408 ) ) ( not ( = ?auto_79407 ?auto_79409 ) ) ( not ( = ?auto_79408 ?auto_79409 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79408 ?auto_79409 )
      ( !STACK ?auto_79408 ?auto_79407 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_79438 - BLOCK
      ?auto_79439 - BLOCK
      ?auto_79440 - BLOCK
      ?auto_79441 - BLOCK
      ?auto_79442 - BLOCK
      ?auto_79443 - BLOCK
      ?auto_79444 - BLOCK
      ?auto_79445 - BLOCK
      ?auto_79446 - BLOCK
    )
    :vars
    (
      ?auto_79447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79446 ?auto_79447 ) ( ON-TABLE ?auto_79438 ) ( ON ?auto_79439 ?auto_79438 ) ( ON ?auto_79440 ?auto_79439 ) ( ON ?auto_79441 ?auto_79440 ) ( ON ?auto_79442 ?auto_79441 ) ( ON ?auto_79443 ?auto_79442 ) ( ON ?auto_79444 ?auto_79443 ) ( not ( = ?auto_79438 ?auto_79439 ) ) ( not ( = ?auto_79438 ?auto_79440 ) ) ( not ( = ?auto_79438 ?auto_79441 ) ) ( not ( = ?auto_79438 ?auto_79442 ) ) ( not ( = ?auto_79438 ?auto_79443 ) ) ( not ( = ?auto_79438 ?auto_79444 ) ) ( not ( = ?auto_79438 ?auto_79445 ) ) ( not ( = ?auto_79438 ?auto_79446 ) ) ( not ( = ?auto_79438 ?auto_79447 ) ) ( not ( = ?auto_79439 ?auto_79440 ) ) ( not ( = ?auto_79439 ?auto_79441 ) ) ( not ( = ?auto_79439 ?auto_79442 ) ) ( not ( = ?auto_79439 ?auto_79443 ) ) ( not ( = ?auto_79439 ?auto_79444 ) ) ( not ( = ?auto_79439 ?auto_79445 ) ) ( not ( = ?auto_79439 ?auto_79446 ) ) ( not ( = ?auto_79439 ?auto_79447 ) ) ( not ( = ?auto_79440 ?auto_79441 ) ) ( not ( = ?auto_79440 ?auto_79442 ) ) ( not ( = ?auto_79440 ?auto_79443 ) ) ( not ( = ?auto_79440 ?auto_79444 ) ) ( not ( = ?auto_79440 ?auto_79445 ) ) ( not ( = ?auto_79440 ?auto_79446 ) ) ( not ( = ?auto_79440 ?auto_79447 ) ) ( not ( = ?auto_79441 ?auto_79442 ) ) ( not ( = ?auto_79441 ?auto_79443 ) ) ( not ( = ?auto_79441 ?auto_79444 ) ) ( not ( = ?auto_79441 ?auto_79445 ) ) ( not ( = ?auto_79441 ?auto_79446 ) ) ( not ( = ?auto_79441 ?auto_79447 ) ) ( not ( = ?auto_79442 ?auto_79443 ) ) ( not ( = ?auto_79442 ?auto_79444 ) ) ( not ( = ?auto_79442 ?auto_79445 ) ) ( not ( = ?auto_79442 ?auto_79446 ) ) ( not ( = ?auto_79442 ?auto_79447 ) ) ( not ( = ?auto_79443 ?auto_79444 ) ) ( not ( = ?auto_79443 ?auto_79445 ) ) ( not ( = ?auto_79443 ?auto_79446 ) ) ( not ( = ?auto_79443 ?auto_79447 ) ) ( not ( = ?auto_79444 ?auto_79445 ) ) ( not ( = ?auto_79444 ?auto_79446 ) ) ( not ( = ?auto_79444 ?auto_79447 ) ) ( not ( = ?auto_79445 ?auto_79446 ) ) ( not ( = ?auto_79445 ?auto_79447 ) ) ( not ( = ?auto_79446 ?auto_79447 ) ) ( CLEAR ?auto_79444 ) ( ON ?auto_79445 ?auto_79446 ) ( CLEAR ?auto_79445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_79438 ?auto_79439 ?auto_79440 ?auto_79441 ?auto_79442 ?auto_79443 ?auto_79444 ?auto_79445 )
      ( MAKE-9PILE ?auto_79438 ?auto_79439 ?auto_79440 ?auto_79441 ?auto_79442 ?auto_79443 ?auto_79444 ?auto_79445 ?auto_79446 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_79476 - BLOCK
      ?auto_79477 - BLOCK
      ?auto_79478 - BLOCK
      ?auto_79479 - BLOCK
      ?auto_79480 - BLOCK
      ?auto_79481 - BLOCK
      ?auto_79482 - BLOCK
      ?auto_79483 - BLOCK
      ?auto_79484 - BLOCK
    )
    :vars
    (
      ?auto_79485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79484 ?auto_79485 ) ( ON-TABLE ?auto_79476 ) ( ON ?auto_79477 ?auto_79476 ) ( ON ?auto_79478 ?auto_79477 ) ( ON ?auto_79479 ?auto_79478 ) ( ON ?auto_79480 ?auto_79479 ) ( ON ?auto_79481 ?auto_79480 ) ( not ( = ?auto_79476 ?auto_79477 ) ) ( not ( = ?auto_79476 ?auto_79478 ) ) ( not ( = ?auto_79476 ?auto_79479 ) ) ( not ( = ?auto_79476 ?auto_79480 ) ) ( not ( = ?auto_79476 ?auto_79481 ) ) ( not ( = ?auto_79476 ?auto_79482 ) ) ( not ( = ?auto_79476 ?auto_79483 ) ) ( not ( = ?auto_79476 ?auto_79484 ) ) ( not ( = ?auto_79476 ?auto_79485 ) ) ( not ( = ?auto_79477 ?auto_79478 ) ) ( not ( = ?auto_79477 ?auto_79479 ) ) ( not ( = ?auto_79477 ?auto_79480 ) ) ( not ( = ?auto_79477 ?auto_79481 ) ) ( not ( = ?auto_79477 ?auto_79482 ) ) ( not ( = ?auto_79477 ?auto_79483 ) ) ( not ( = ?auto_79477 ?auto_79484 ) ) ( not ( = ?auto_79477 ?auto_79485 ) ) ( not ( = ?auto_79478 ?auto_79479 ) ) ( not ( = ?auto_79478 ?auto_79480 ) ) ( not ( = ?auto_79478 ?auto_79481 ) ) ( not ( = ?auto_79478 ?auto_79482 ) ) ( not ( = ?auto_79478 ?auto_79483 ) ) ( not ( = ?auto_79478 ?auto_79484 ) ) ( not ( = ?auto_79478 ?auto_79485 ) ) ( not ( = ?auto_79479 ?auto_79480 ) ) ( not ( = ?auto_79479 ?auto_79481 ) ) ( not ( = ?auto_79479 ?auto_79482 ) ) ( not ( = ?auto_79479 ?auto_79483 ) ) ( not ( = ?auto_79479 ?auto_79484 ) ) ( not ( = ?auto_79479 ?auto_79485 ) ) ( not ( = ?auto_79480 ?auto_79481 ) ) ( not ( = ?auto_79480 ?auto_79482 ) ) ( not ( = ?auto_79480 ?auto_79483 ) ) ( not ( = ?auto_79480 ?auto_79484 ) ) ( not ( = ?auto_79480 ?auto_79485 ) ) ( not ( = ?auto_79481 ?auto_79482 ) ) ( not ( = ?auto_79481 ?auto_79483 ) ) ( not ( = ?auto_79481 ?auto_79484 ) ) ( not ( = ?auto_79481 ?auto_79485 ) ) ( not ( = ?auto_79482 ?auto_79483 ) ) ( not ( = ?auto_79482 ?auto_79484 ) ) ( not ( = ?auto_79482 ?auto_79485 ) ) ( not ( = ?auto_79483 ?auto_79484 ) ) ( not ( = ?auto_79483 ?auto_79485 ) ) ( not ( = ?auto_79484 ?auto_79485 ) ) ( ON ?auto_79483 ?auto_79484 ) ( CLEAR ?auto_79481 ) ( ON ?auto_79482 ?auto_79483 ) ( CLEAR ?auto_79482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79476 ?auto_79477 ?auto_79478 ?auto_79479 ?auto_79480 ?auto_79481 ?auto_79482 )
      ( MAKE-9PILE ?auto_79476 ?auto_79477 ?auto_79478 ?auto_79479 ?auto_79480 ?auto_79481 ?auto_79482 ?auto_79483 ?auto_79484 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_79514 - BLOCK
      ?auto_79515 - BLOCK
      ?auto_79516 - BLOCK
      ?auto_79517 - BLOCK
      ?auto_79518 - BLOCK
      ?auto_79519 - BLOCK
      ?auto_79520 - BLOCK
      ?auto_79521 - BLOCK
      ?auto_79522 - BLOCK
    )
    :vars
    (
      ?auto_79523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79522 ?auto_79523 ) ( ON-TABLE ?auto_79514 ) ( ON ?auto_79515 ?auto_79514 ) ( ON ?auto_79516 ?auto_79515 ) ( ON ?auto_79517 ?auto_79516 ) ( ON ?auto_79518 ?auto_79517 ) ( not ( = ?auto_79514 ?auto_79515 ) ) ( not ( = ?auto_79514 ?auto_79516 ) ) ( not ( = ?auto_79514 ?auto_79517 ) ) ( not ( = ?auto_79514 ?auto_79518 ) ) ( not ( = ?auto_79514 ?auto_79519 ) ) ( not ( = ?auto_79514 ?auto_79520 ) ) ( not ( = ?auto_79514 ?auto_79521 ) ) ( not ( = ?auto_79514 ?auto_79522 ) ) ( not ( = ?auto_79514 ?auto_79523 ) ) ( not ( = ?auto_79515 ?auto_79516 ) ) ( not ( = ?auto_79515 ?auto_79517 ) ) ( not ( = ?auto_79515 ?auto_79518 ) ) ( not ( = ?auto_79515 ?auto_79519 ) ) ( not ( = ?auto_79515 ?auto_79520 ) ) ( not ( = ?auto_79515 ?auto_79521 ) ) ( not ( = ?auto_79515 ?auto_79522 ) ) ( not ( = ?auto_79515 ?auto_79523 ) ) ( not ( = ?auto_79516 ?auto_79517 ) ) ( not ( = ?auto_79516 ?auto_79518 ) ) ( not ( = ?auto_79516 ?auto_79519 ) ) ( not ( = ?auto_79516 ?auto_79520 ) ) ( not ( = ?auto_79516 ?auto_79521 ) ) ( not ( = ?auto_79516 ?auto_79522 ) ) ( not ( = ?auto_79516 ?auto_79523 ) ) ( not ( = ?auto_79517 ?auto_79518 ) ) ( not ( = ?auto_79517 ?auto_79519 ) ) ( not ( = ?auto_79517 ?auto_79520 ) ) ( not ( = ?auto_79517 ?auto_79521 ) ) ( not ( = ?auto_79517 ?auto_79522 ) ) ( not ( = ?auto_79517 ?auto_79523 ) ) ( not ( = ?auto_79518 ?auto_79519 ) ) ( not ( = ?auto_79518 ?auto_79520 ) ) ( not ( = ?auto_79518 ?auto_79521 ) ) ( not ( = ?auto_79518 ?auto_79522 ) ) ( not ( = ?auto_79518 ?auto_79523 ) ) ( not ( = ?auto_79519 ?auto_79520 ) ) ( not ( = ?auto_79519 ?auto_79521 ) ) ( not ( = ?auto_79519 ?auto_79522 ) ) ( not ( = ?auto_79519 ?auto_79523 ) ) ( not ( = ?auto_79520 ?auto_79521 ) ) ( not ( = ?auto_79520 ?auto_79522 ) ) ( not ( = ?auto_79520 ?auto_79523 ) ) ( not ( = ?auto_79521 ?auto_79522 ) ) ( not ( = ?auto_79521 ?auto_79523 ) ) ( not ( = ?auto_79522 ?auto_79523 ) ) ( ON ?auto_79521 ?auto_79522 ) ( ON ?auto_79520 ?auto_79521 ) ( CLEAR ?auto_79518 ) ( ON ?auto_79519 ?auto_79520 ) ( CLEAR ?auto_79519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79514 ?auto_79515 ?auto_79516 ?auto_79517 ?auto_79518 ?auto_79519 )
      ( MAKE-9PILE ?auto_79514 ?auto_79515 ?auto_79516 ?auto_79517 ?auto_79518 ?auto_79519 ?auto_79520 ?auto_79521 ?auto_79522 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_79552 - BLOCK
      ?auto_79553 - BLOCK
      ?auto_79554 - BLOCK
      ?auto_79555 - BLOCK
      ?auto_79556 - BLOCK
      ?auto_79557 - BLOCK
      ?auto_79558 - BLOCK
      ?auto_79559 - BLOCK
      ?auto_79560 - BLOCK
    )
    :vars
    (
      ?auto_79561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79560 ?auto_79561 ) ( ON-TABLE ?auto_79552 ) ( ON ?auto_79553 ?auto_79552 ) ( ON ?auto_79554 ?auto_79553 ) ( ON ?auto_79555 ?auto_79554 ) ( not ( = ?auto_79552 ?auto_79553 ) ) ( not ( = ?auto_79552 ?auto_79554 ) ) ( not ( = ?auto_79552 ?auto_79555 ) ) ( not ( = ?auto_79552 ?auto_79556 ) ) ( not ( = ?auto_79552 ?auto_79557 ) ) ( not ( = ?auto_79552 ?auto_79558 ) ) ( not ( = ?auto_79552 ?auto_79559 ) ) ( not ( = ?auto_79552 ?auto_79560 ) ) ( not ( = ?auto_79552 ?auto_79561 ) ) ( not ( = ?auto_79553 ?auto_79554 ) ) ( not ( = ?auto_79553 ?auto_79555 ) ) ( not ( = ?auto_79553 ?auto_79556 ) ) ( not ( = ?auto_79553 ?auto_79557 ) ) ( not ( = ?auto_79553 ?auto_79558 ) ) ( not ( = ?auto_79553 ?auto_79559 ) ) ( not ( = ?auto_79553 ?auto_79560 ) ) ( not ( = ?auto_79553 ?auto_79561 ) ) ( not ( = ?auto_79554 ?auto_79555 ) ) ( not ( = ?auto_79554 ?auto_79556 ) ) ( not ( = ?auto_79554 ?auto_79557 ) ) ( not ( = ?auto_79554 ?auto_79558 ) ) ( not ( = ?auto_79554 ?auto_79559 ) ) ( not ( = ?auto_79554 ?auto_79560 ) ) ( not ( = ?auto_79554 ?auto_79561 ) ) ( not ( = ?auto_79555 ?auto_79556 ) ) ( not ( = ?auto_79555 ?auto_79557 ) ) ( not ( = ?auto_79555 ?auto_79558 ) ) ( not ( = ?auto_79555 ?auto_79559 ) ) ( not ( = ?auto_79555 ?auto_79560 ) ) ( not ( = ?auto_79555 ?auto_79561 ) ) ( not ( = ?auto_79556 ?auto_79557 ) ) ( not ( = ?auto_79556 ?auto_79558 ) ) ( not ( = ?auto_79556 ?auto_79559 ) ) ( not ( = ?auto_79556 ?auto_79560 ) ) ( not ( = ?auto_79556 ?auto_79561 ) ) ( not ( = ?auto_79557 ?auto_79558 ) ) ( not ( = ?auto_79557 ?auto_79559 ) ) ( not ( = ?auto_79557 ?auto_79560 ) ) ( not ( = ?auto_79557 ?auto_79561 ) ) ( not ( = ?auto_79558 ?auto_79559 ) ) ( not ( = ?auto_79558 ?auto_79560 ) ) ( not ( = ?auto_79558 ?auto_79561 ) ) ( not ( = ?auto_79559 ?auto_79560 ) ) ( not ( = ?auto_79559 ?auto_79561 ) ) ( not ( = ?auto_79560 ?auto_79561 ) ) ( ON ?auto_79559 ?auto_79560 ) ( ON ?auto_79558 ?auto_79559 ) ( ON ?auto_79557 ?auto_79558 ) ( CLEAR ?auto_79555 ) ( ON ?auto_79556 ?auto_79557 ) ( CLEAR ?auto_79556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79552 ?auto_79553 ?auto_79554 ?auto_79555 ?auto_79556 )
      ( MAKE-9PILE ?auto_79552 ?auto_79553 ?auto_79554 ?auto_79555 ?auto_79556 ?auto_79557 ?auto_79558 ?auto_79559 ?auto_79560 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_79590 - BLOCK
      ?auto_79591 - BLOCK
      ?auto_79592 - BLOCK
      ?auto_79593 - BLOCK
      ?auto_79594 - BLOCK
      ?auto_79595 - BLOCK
      ?auto_79596 - BLOCK
      ?auto_79597 - BLOCK
      ?auto_79598 - BLOCK
    )
    :vars
    (
      ?auto_79599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79598 ?auto_79599 ) ( ON-TABLE ?auto_79590 ) ( ON ?auto_79591 ?auto_79590 ) ( ON ?auto_79592 ?auto_79591 ) ( not ( = ?auto_79590 ?auto_79591 ) ) ( not ( = ?auto_79590 ?auto_79592 ) ) ( not ( = ?auto_79590 ?auto_79593 ) ) ( not ( = ?auto_79590 ?auto_79594 ) ) ( not ( = ?auto_79590 ?auto_79595 ) ) ( not ( = ?auto_79590 ?auto_79596 ) ) ( not ( = ?auto_79590 ?auto_79597 ) ) ( not ( = ?auto_79590 ?auto_79598 ) ) ( not ( = ?auto_79590 ?auto_79599 ) ) ( not ( = ?auto_79591 ?auto_79592 ) ) ( not ( = ?auto_79591 ?auto_79593 ) ) ( not ( = ?auto_79591 ?auto_79594 ) ) ( not ( = ?auto_79591 ?auto_79595 ) ) ( not ( = ?auto_79591 ?auto_79596 ) ) ( not ( = ?auto_79591 ?auto_79597 ) ) ( not ( = ?auto_79591 ?auto_79598 ) ) ( not ( = ?auto_79591 ?auto_79599 ) ) ( not ( = ?auto_79592 ?auto_79593 ) ) ( not ( = ?auto_79592 ?auto_79594 ) ) ( not ( = ?auto_79592 ?auto_79595 ) ) ( not ( = ?auto_79592 ?auto_79596 ) ) ( not ( = ?auto_79592 ?auto_79597 ) ) ( not ( = ?auto_79592 ?auto_79598 ) ) ( not ( = ?auto_79592 ?auto_79599 ) ) ( not ( = ?auto_79593 ?auto_79594 ) ) ( not ( = ?auto_79593 ?auto_79595 ) ) ( not ( = ?auto_79593 ?auto_79596 ) ) ( not ( = ?auto_79593 ?auto_79597 ) ) ( not ( = ?auto_79593 ?auto_79598 ) ) ( not ( = ?auto_79593 ?auto_79599 ) ) ( not ( = ?auto_79594 ?auto_79595 ) ) ( not ( = ?auto_79594 ?auto_79596 ) ) ( not ( = ?auto_79594 ?auto_79597 ) ) ( not ( = ?auto_79594 ?auto_79598 ) ) ( not ( = ?auto_79594 ?auto_79599 ) ) ( not ( = ?auto_79595 ?auto_79596 ) ) ( not ( = ?auto_79595 ?auto_79597 ) ) ( not ( = ?auto_79595 ?auto_79598 ) ) ( not ( = ?auto_79595 ?auto_79599 ) ) ( not ( = ?auto_79596 ?auto_79597 ) ) ( not ( = ?auto_79596 ?auto_79598 ) ) ( not ( = ?auto_79596 ?auto_79599 ) ) ( not ( = ?auto_79597 ?auto_79598 ) ) ( not ( = ?auto_79597 ?auto_79599 ) ) ( not ( = ?auto_79598 ?auto_79599 ) ) ( ON ?auto_79597 ?auto_79598 ) ( ON ?auto_79596 ?auto_79597 ) ( ON ?auto_79595 ?auto_79596 ) ( ON ?auto_79594 ?auto_79595 ) ( CLEAR ?auto_79592 ) ( ON ?auto_79593 ?auto_79594 ) ( CLEAR ?auto_79593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79590 ?auto_79591 ?auto_79592 ?auto_79593 )
      ( MAKE-9PILE ?auto_79590 ?auto_79591 ?auto_79592 ?auto_79593 ?auto_79594 ?auto_79595 ?auto_79596 ?auto_79597 ?auto_79598 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_79628 - BLOCK
      ?auto_79629 - BLOCK
      ?auto_79630 - BLOCK
      ?auto_79631 - BLOCK
      ?auto_79632 - BLOCK
      ?auto_79633 - BLOCK
      ?auto_79634 - BLOCK
      ?auto_79635 - BLOCK
      ?auto_79636 - BLOCK
    )
    :vars
    (
      ?auto_79637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79636 ?auto_79637 ) ( ON-TABLE ?auto_79628 ) ( ON ?auto_79629 ?auto_79628 ) ( not ( = ?auto_79628 ?auto_79629 ) ) ( not ( = ?auto_79628 ?auto_79630 ) ) ( not ( = ?auto_79628 ?auto_79631 ) ) ( not ( = ?auto_79628 ?auto_79632 ) ) ( not ( = ?auto_79628 ?auto_79633 ) ) ( not ( = ?auto_79628 ?auto_79634 ) ) ( not ( = ?auto_79628 ?auto_79635 ) ) ( not ( = ?auto_79628 ?auto_79636 ) ) ( not ( = ?auto_79628 ?auto_79637 ) ) ( not ( = ?auto_79629 ?auto_79630 ) ) ( not ( = ?auto_79629 ?auto_79631 ) ) ( not ( = ?auto_79629 ?auto_79632 ) ) ( not ( = ?auto_79629 ?auto_79633 ) ) ( not ( = ?auto_79629 ?auto_79634 ) ) ( not ( = ?auto_79629 ?auto_79635 ) ) ( not ( = ?auto_79629 ?auto_79636 ) ) ( not ( = ?auto_79629 ?auto_79637 ) ) ( not ( = ?auto_79630 ?auto_79631 ) ) ( not ( = ?auto_79630 ?auto_79632 ) ) ( not ( = ?auto_79630 ?auto_79633 ) ) ( not ( = ?auto_79630 ?auto_79634 ) ) ( not ( = ?auto_79630 ?auto_79635 ) ) ( not ( = ?auto_79630 ?auto_79636 ) ) ( not ( = ?auto_79630 ?auto_79637 ) ) ( not ( = ?auto_79631 ?auto_79632 ) ) ( not ( = ?auto_79631 ?auto_79633 ) ) ( not ( = ?auto_79631 ?auto_79634 ) ) ( not ( = ?auto_79631 ?auto_79635 ) ) ( not ( = ?auto_79631 ?auto_79636 ) ) ( not ( = ?auto_79631 ?auto_79637 ) ) ( not ( = ?auto_79632 ?auto_79633 ) ) ( not ( = ?auto_79632 ?auto_79634 ) ) ( not ( = ?auto_79632 ?auto_79635 ) ) ( not ( = ?auto_79632 ?auto_79636 ) ) ( not ( = ?auto_79632 ?auto_79637 ) ) ( not ( = ?auto_79633 ?auto_79634 ) ) ( not ( = ?auto_79633 ?auto_79635 ) ) ( not ( = ?auto_79633 ?auto_79636 ) ) ( not ( = ?auto_79633 ?auto_79637 ) ) ( not ( = ?auto_79634 ?auto_79635 ) ) ( not ( = ?auto_79634 ?auto_79636 ) ) ( not ( = ?auto_79634 ?auto_79637 ) ) ( not ( = ?auto_79635 ?auto_79636 ) ) ( not ( = ?auto_79635 ?auto_79637 ) ) ( not ( = ?auto_79636 ?auto_79637 ) ) ( ON ?auto_79635 ?auto_79636 ) ( ON ?auto_79634 ?auto_79635 ) ( ON ?auto_79633 ?auto_79634 ) ( ON ?auto_79632 ?auto_79633 ) ( ON ?auto_79631 ?auto_79632 ) ( CLEAR ?auto_79629 ) ( ON ?auto_79630 ?auto_79631 ) ( CLEAR ?auto_79630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79628 ?auto_79629 ?auto_79630 )
      ( MAKE-9PILE ?auto_79628 ?auto_79629 ?auto_79630 ?auto_79631 ?auto_79632 ?auto_79633 ?auto_79634 ?auto_79635 ?auto_79636 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_79666 - BLOCK
      ?auto_79667 - BLOCK
      ?auto_79668 - BLOCK
      ?auto_79669 - BLOCK
      ?auto_79670 - BLOCK
      ?auto_79671 - BLOCK
      ?auto_79672 - BLOCK
      ?auto_79673 - BLOCK
      ?auto_79674 - BLOCK
    )
    :vars
    (
      ?auto_79675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79674 ?auto_79675 ) ( ON-TABLE ?auto_79666 ) ( not ( = ?auto_79666 ?auto_79667 ) ) ( not ( = ?auto_79666 ?auto_79668 ) ) ( not ( = ?auto_79666 ?auto_79669 ) ) ( not ( = ?auto_79666 ?auto_79670 ) ) ( not ( = ?auto_79666 ?auto_79671 ) ) ( not ( = ?auto_79666 ?auto_79672 ) ) ( not ( = ?auto_79666 ?auto_79673 ) ) ( not ( = ?auto_79666 ?auto_79674 ) ) ( not ( = ?auto_79666 ?auto_79675 ) ) ( not ( = ?auto_79667 ?auto_79668 ) ) ( not ( = ?auto_79667 ?auto_79669 ) ) ( not ( = ?auto_79667 ?auto_79670 ) ) ( not ( = ?auto_79667 ?auto_79671 ) ) ( not ( = ?auto_79667 ?auto_79672 ) ) ( not ( = ?auto_79667 ?auto_79673 ) ) ( not ( = ?auto_79667 ?auto_79674 ) ) ( not ( = ?auto_79667 ?auto_79675 ) ) ( not ( = ?auto_79668 ?auto_79669 ) ) ( not ( = ?auto_79668 ?auto_79670 ) ) ( not ( = ?auto_79668 ?auto_79671 ) ) ( not ( = ?auto_79668 ?auto_79672 ) ) ( not ( = ?auto_79668 ?auto_79673 ) ) ( not ( = ?auto_79668 ?auto_79674 ) ) ( not ( = ?auto_79668 ?auto_79675 ) ) ( not ( = ?auto_79669 ?auto_79670 ) ) ( not ( = ?auto_79669 ?auto_79671 ) ) ( not ( = ?auto_79669 ?auto_79672 ) ) ( not ( = ?auto_79669 ?auto_79673 ) ) ( not ( = ?auto_79669 ?auto_79674 ) ) ( not ( = ?auto_79669 ?auto_79675 ) ) ( not ( = ?auto_79670 ?auto_79671 ) ) ( not ( = ?auto_79670 ?auto_79672 ) ) ( not ( = ?auto_79670 ?auto_79673 ) ) ( not ( = ?auto_79670 ?auto_79674 ) ) ( not ( = ?auto_79670 ?auto_79675 ) ) ( not ( = ?auto_79671 ?auto_79672 ) ) ( not ( = ?auto_79671 ?auto_79673 ) ) ( not ( = ?auto_79671 ?auto_79674 ) ) ( not ( = ?auto_79671 ?auto_79675 ) ) ( not ( = ?auto_79672 ?auto_79673 ) ) ( not ( = ?auto_79672 ?auto_79674 ) ) ( not ( = ?auto_79672 ?auto_79675 ) ) ( not ( = ?auto_79673 ?auto_79674 ) ) ( not ( = ?auto_79673 ?auto_79675 ) ) ( not ( = ?auto_79674 ?auto_79675 ) ) ( ON ?auto_79673 ?auto_79674 ) ( ON ?auto_79672 ?auto_79673 ) ( ON ?auto_79671 ?auto_79672 ) ( ON ?auto_79670 ?auto_79671 ) ( ON ?auto_79669 ?auto_79670 ) ( ON ?auto_79668 ?auto_79669 ) ( CLEAR ?auto_79666 ) ( ON ?auto_79667 ?auto_79668 ) ( CLEAR ?auto_79667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79666 ?auto_79667 )
      ( MAKE-9PILE ?auto_79666 ?auto_79667 ?auto_79668 ?auto_79669 ?auto_79670 ?auto_79671 ?auto_79672 ?auto_79673 ?auto_79674 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_79704 - BLOCK
      ?auto_79705 - BLOCK
      ?auto_79706 - BLOCK
      ?auto_79707 - BLOCK
      ?auto_79708 - BLOCK
      ?auto_79709 - BLOCK
      ?auto_79710 - BLOCK
      ?auto_79711 - BLOCK
      ?auto_79712 - BLOCK
    )
    :vars
    (
      ?auto_79713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79712 ?auto_79713 ) ( not ( = ?auto_79704 ?auto_79705 ) ) ( not ( = ?auto_79704 ?auto_79706 ) ) ( not ( = ?auto_79704 ?auto_79707 ) ) ( not ( = ?auto_79704 ?auto_79708 ) ) ( not ( = ?auto_79704 ?auto_79709 ) ) ( not ( = ?auto_79704 ?auto_79710 ) ) ( not ( = ?auto_79704 ?auto_79711 ) ) ( not ( = ?auto_79704 ?auto_79712 ) ) ( not ( = ?auto_79704 ?auto_79713 ) ) ( not ( = ?auto_79705 ?auto_79706 ) ) ( not ( = ?auto_79705 ?auto_79707 ) ) ( not ( = ?auto_79705 ?auto_79708 ) ) ( not ( = ?auto_79705 ?auto_79709 ) ) ( not ( = ?auto_79705 ?auto_79710 ) ) ( not ( = ?auto_79705 ?auto_79711 ) ) ( not ( = ?auto_79705 ?auto_79712 ) ) ( not ( = ?auto_79705 ?auto_79713 ) ) ( not ( = ?auto_79706 ?auto_79707 ) ) ( not ( = ?auto_79706 ?auto_79708 ) ) ( not ( = ?auto_79706 ?auto_79709 ) ) ( not ( = ?auto_79706 ?auto_79710 ) ) ( not ( = ?auto_79706 ?auto_79711 ) ) ( not ( = ?auto_79706 ?auto_79712 ) ) ( not ( = ?auto_79706 ?auto_79713 ) ) ( not ( = ?auto_79707 ?auto_79708 ) ) ( not ( = ?auto_79707 ?auto_79709 ) ) ( not ( = ?auto_79707 ?auto_79710 ) ) ( not ( = ?auto_79707 ?auto_79711 ) ) ( not ( = ?auto_79707 ?auto_79712 ) ) ( not ( = ?auto_79707 ?auto_79713 ) ) ( not ( = ?auto_79708 ?auto_79709 ) ) ( not ( = ?auto_79708 ?auto_79710 ) ) ( not ( = ?auto_79708 ?auto_79711 ) ) ( not ( = ?auto_79708 ?auto_79712 ) ) ( not ( = ?auto_79708 ?auto_79713 ) ) ( not ( = ?auto_79709 ?auto_79710 ) ) ( not ( = ?auto_79709 ?auto_79711 ) ) ( not ( = ?auto_79709 ?auto_79712 ) ) ( not ( = ?auto_79709 ?auto_79713 ) ) ( not ( = ?auto_79710 ?auto_79711 ) ) ( not ( = ?auto_79710 ?auto_79712 ) ) ( not ( = ?auto_79710 ?auto_79713 ) ) ( not ( = ?auto_79711 ?auto_79712 ) ) ( not ( = ?auto_79711 ?auto_79713 ) ) ( not ( = ?auto_79712 ?auto_79713 ) ) ( ON ?auto_79711 ?auto_79712 ) ( ON ?auto_79710 ?auto_79711 ) ( ON ?auto_79709 ?auto_79710 ) ( ON ?auto_79708 ?auto_79709 ) ( ON ?auto_79707 ?auto_79708 ) ( ON ?auto_79706 ?auto_79707 ) ( ON ?auto_79705 ?auto_79706 ) ( ON ?auto_79704 ?auto_79705 ) ( CLEAR ?auto_79704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79704 )
      ( MAKE-9PILE ?auto_79704 ?auto_79705 ?auto_79706 ?auto_79707 ?auto_79708 ?auto_79709 ?auto_79710 ?auto_79711 ?auto_79712 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_79743 - BLOCK
      ?auto_79744 - BLOCK
      ?auto_79745 - BLOCK
      ?auto_79746 - BLOCK
      ?auto_79747 - BLOCK
      ?auto_79748 - BLOCK
      ?auto_79749 - BLOCK
      ?auto_79750 - BLOCK
      ?auto_79751 - BLOCK
      ?auto_79752 - BLOCK
    )
    :vars
    (
      ?auto_79753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_79751 ) ( ON ?auto_79752 ?auto_79753 ) ( CLEAR ?auto_79752 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79743 ) ( ON ?auto_79744 ?auto_79743 ) ( ON ?auto_79745 ?auto_79744 ) ( ON ?auto_79746 ?auto_79745 ) ( ON ?auto_79747 ?auto_79746 ) ( ON ?auto_79748 ?auto_79747 ) ( ON ?auto_79749 ?auto_79748 ) ( ON ?auto_79750 ?auto_79749 ) ( ON ?auto_79751 ?auto_79750 ) ( not ( = ?auto_79743 ?auto_79744 ) ) ( not ( = ?auto_79743 ?auto_79745 ) ) ( not ( = ?auto_79743 ?auto_79746 ) ) ( not ( = ?auto_79743 ?auto_79747 ) ) ( not ( = ?auto_79743 ?auto_79748 ) ) ( not ( = ?auto_79743 ?auto_79749 ) ) ( not ( = ?auto_79743 ?auto_79750 ) ) ( not ( = ?auto_79743 ?auto_79751 ) ) ( not ( = ?auto_79743 ?auto_79752 ) ) ( not ( = ?auto_79743 ?auto_79753 ) ) ( not ( = ?auto_79744 ?auto_79745 ) ) ( not ( = ?auto_79744 ?auto_79746 ) ) ( not ( = ?auto_79744 ?auto_79747 ) ) ( not ( = ?auto_79744 ?auto_79748 ) ) ( not ( = ?auto_79744 ?auto_79749 ) ) ( not ( = ?auto_79744 ?auto_79750 ) ) ( not ( = ?auto_79744 ?auto_79751 ) ) ( not ( = ?auto_79744 ?auto_79752 ) ) ( not ( = ?auto_79744 ?auto_79753 ) ) ( not ( = ?auto_79745 ?auto_79746 ) ) ( not ( = ?auto_79745 ?auto_79747 ) ) ( not ( = ?auto_79745 ?auto_79748 ) ) ( not ( = ?auto_79745 ?auto_79749 ) ) ( not ( = ?auto_79745 ?auto_79750 ) ) ( not ( = ?auto_79745 ?auto_79751 ) ) ( not ( = ?auto_79745 ?auto_79752 ) ) ( not ( = ?auto_79745 ?auto_79753 ) ) ( not ( = ?auto_79746 ?auto_79747 ) ) ( not ( = ?auto_79746 ?auto_79748 ) ) ( not ( = ?auto_79746 ?auto_79749 ) ) ( not ( = ?auto_79746 ?auto_79750 ) ) ( not ( = ?auto_79746 ?auto_79751 ) ) ( not ( = ?auto_79746 ?auto_79752 ) ) ( not ( = ?auto_79746 ?auto_79753 ) ) ( not ( = ?auto_79747 ?auto_79748 ) ) ( not ( = ?auto_79747 ?auto_79749 ) ) ( not ( = ?auto_79747 ?auto_79750 ) ) ( not ( = ?auto_79747 ?auto_79751 ) ) ( not ( = ?auto_79747 ?auto_79752 ) ) ( not ( = ?auto_79747 ?auto_79753 ) ) ( not ( = ?auto_79748 ?auto_79749 ) ) ( not ( = ?auto_79748 ?auto_79750 ) ) ( not ( = ?auto_79748 ?auto_79751 ) ) ( not ( = ?auto_79748 ?auto_79752 ) ) ( not ( = ?auto_79748 ?auto_79753 ) ) ( not ( = ?auto_79749 ?auto_79750 ) ) ( not ( = ?auto_79749 ?auto_79751 ) ) ( not ( = ?auto_79749 ?auto_79752 ) ) ( not ( = ?auto_79749 ?auto_79753 ) ) ( not ( = ?auto_79750 ?auto_79751 ) ) ( not ( = ?auto_79750 ?auto_79752 ) ) ( not ( = ?auto_79750 ?auto_79753 ) ) ( not ( = ?auto_79751 ?auto_79752 ) ) ( not ( = ?auto_79751 ?auto_79753 ) ) ( not ( = ?auto_79752 ?auto_79753 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79752 ?auto_79753 )
      ( !STACK ?auto_79752 ?auto_79751 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_79764 - BLOCK
      ?auto_79765 - BLOCK
      ?auto_79766 - BLOCK
      ?auto_79767 - BLOCK
      ?auto_79768 - BLOCK
      ?auto_79769 - BLOCK
      ?auto_79770 - BLOCK
      ?auto_79771 - BLOCK
      ?auto_79772 - BLOCK
      ?auto_79773 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_79772 ) ( ON-TABLE ?auto_79773 ) ( CLEAR ?auto_79773 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79764 ) ( ON ?auto_79765 ?auto_79764 ) ( ON ?auto_79766 ?auto_79765 ) ( ON ?auto_79767 ?auto_79766 ) ( ON ?auto_79768 ?auto_79767 ) ( ON ?auto_79769 ?auto_79768 ) ( ON ?auto_79770 ?auto_79769 ) ( ON ?auto_79771 ?auto_79770 ) ( ON ?auto_79772 ?auto_79771 ) ( not ( = ?auto_79764 ?auto_79765 ) ) ( not ( = ?auto_79764 ?auto_79766 ) ) ( not ( = ?auto_79764 ?auto_79767 ) ) ( not ( = ?auto_79764 ?auto_79768 ) ) ( not ( = ?auto_79764 ?auto_79769 ) ) ( not ( = ?auto_79764 ?auto_79770 ) ) ( not ( = ?auto_79764 ?auto_79771 ) ) ( not ( = ?auto_79764 ?auto_79772 ) ) ( not ( = ?auto_79764 ?auto_79773 ) ) ( not ( = ?auto_79765 ?auto_79766 ) ) ( not ( = ?auto_79765 ?auto_79767 ) ) ( not ( = ?auto_79765 ?auto_79768 ) ) ( not ( = ?auto_79765 ?auto_79769 ) ) ( not ( = ?auto_79765 ?auto_79770 ) ) ( not ( = ?auto_79765 ?auto_79771 ) ) ( not ( = ?auto_79765 ?auto_79772 ) ) ( not ( = ?auto_79765 ?auto_79773 ) ) ( not ( = ?auto_79766 ?auto_79767 ) ) ( not ( = ?auto_79766 ?auto_79768 ) ) ( not ( = ?auto_79766 ?auto_79769 ) ) ( not ( = ?auto_79766 ?auto_79770 ) ) ( not ( = ?auto_79766 ?auto_79771 ) ) ( not ( = ?auto_79766 ?auto_79772 ) ) ( not ( = ?auto_79766 ?auto_79773 ) ) ( not ( = ?auto_79767 ?auto_79768 ) ) ( not ( = ?auto_79767 ?auto_79769 ) ) ( not ( = ?auto_79767 ?auto_79770 ) ) ( not ( = ?auto_79767 ?auto_79771 ) ) ( not ( = ?auto_79767 ?auto_79772 ) ) ( not ( = ?auto_79767 ?auto_79773 ) ) ( not ( = ?auto_79768 ?auto_79769 ) ) ( not ( = ?auto_79768 ?auto_79770 ) ) ( not ( = ?auto_79768 ?auto_79771 ) ) ( not ( = ?auto_79768 ?auto_79772 ) ) ( not ( = ?auto_79768 ?auto_79773 ) ) ( not ( = ?auto_79769 ?auto_79770 ) ) ( not ( = ?auto_79769 ?auto_79771 ) ) ( not ( = ?auto_79769 ?auto_79772 ) ) ( not ( = ?auto_79769 ?auto_79773 ) ) ( not ( = ?auto_79770 ?auto_79771 ) ) ( not ( = ?auto_79770 ?auto_79772 ) ) ( not ( = ?auto_79770 ?auto_79773 ) ) ( not ( = ?auto_79771 ?auto_79772 ) ) ( not ( = ?auto_79771 ?auto_79773 ) ) ( not ( = ?auto_79772 ?auto_79773 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_79773 )
      ( !STACK ?auto_79773 ?auto_79772 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_79784 - BLOCK
      ?auto_79785 - BLOCK
      ?auto_79786 - BLOCK
      ?auto_79787 - BLOCK
      ?auto_79788 - BLOCK
      ?auto_79789 - BLOCK
      ?auto_79790 - BLOCK
      ?auto_79791 - BLOCK
      ?auto_79792 - BLOCK
      ?auto_79793 - BLOCK
    )
    :vars
    (
      ?auto_79794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79793 ?auto_79794 ) ( ON-TABLE ?auto_79784 ) ( ON ?auto_79785 ?auto_79784 ) ( ON ?auto_79786 ?auto_79785 ) ( ON ?auto_79787 ?auto_79786 ) ( ON ?auto_79788 ?auto_79787 ) ( ON ?auto_79789 ?auto_79788 ) ( ON ?auto_79790 ?auto_79789 ) ( ON ?auto_79791 ?auto_79790 ) ( not ( = ?auto_79784 ?auto_79785 ) ) ( not ( = ?auto_79784 ?auto_79786 ) ) ( not ( = ?auto_79784 ?auto_79787 ) ) ( not ( = ?auto_79784 ?auto_79788 ) ) ( not ( = ?auto_79784 ?auto_79789 ) ) ( not ( = ?auto_79784 ?auto_79790 ) ) ( not ( = ?auto_79784 ?auto_79791 ) ) ( not ( = ?auto_79784 ?auto_79792 ) ) ( not ( = ?auto_79784 ?auto_79793 ) ) ( not ( = ?auto_79784 ?auto_79794 ) ) ( not ( = ?auto_79785 ?auto_79786 ) ) ( not ( = ?auto_79785 ?auto_79787 ) ) ( not ( = ?auto_79785 ?auto_79788 ) ) ( not ( = ?auto_79785 ?auto_79789 ) ) ( not ( = ?auto_79785 ?auto_79790 ) ) ( not ( = ?auto_79785 ?auto_79791 ) ) ( not ( = ?auto_79785 ?auto_79792 ) ) ( not ( = ?auto_79785 ?auto_79793 ) ) ( not ( = ?auto_79785 ?auto_79794 ) ) ( not ( = ?auto_79786 ?auto_79787 ) ) ( not ( = ?auto_79786 ?auto_79788 ) ) ( not ( = ?auto_79786 ?auto_79789 ) ) ( not ( = ?auto_79786 ?auto_79790 ) ) ( not ( = ?auto_79786 ?auto_79791 ) ) ( not ( = ?auto_79786 ?auto_79792 ) ) ( not ( = ?auto_79786 ?auto_79793 ) ) ( not ( = ?auto_79786 ?auto_79794 ) ) ( not ( = ?auto_79787 ?auto_79788 ) ) ( not ( = ?auto_79787 ?auto_79789 ) ) ( not ( = ?auto_79787 ?auto_79790 ) ) ( not ( = ?auto_79787 ?auto_79791 ) ) ( not ( = ?auto_79787 ?auto_79792 ) ) ( not ( = ?auto_79787 ?auto_79793 ) ) ( not ( = ?auto_79787 ?auto_79794 ) ) ( not ( = ?auto_79788 ?auto_79789 ) ) ( not ( = ?auto_79788 ?auto_79790 ) ) ( not ( = ?auto_79788 ?auto_79791 ) ) ( not ( = ?auto_79788 ?auto_79792 ) ) ( not ( = ?auto_79788 ?auto_79793 ) ) ( not ( = ?auto_79788 ?auto_79794 ) ) ( not ( = ?auto_79789 ?auto_79790 ) ) ( not ( = ?auto_79789 ?auto_79791 ) ) ( not ( = ?auto_79789 ?auto_79792 ) ) ( not ( = ?auto_79789 ?auto_79793 ) ) ( not ( = ?auto_79789 ?auto_79794 ) ) ( not ( = ?auto_79790 ?auto_79791 ) ) ( not ( = ?auto_79790 ?auto_79792 ) ) ( not ( = ?auto_79790 ?auto_79793 ) ) ( not ( = ?auto_79790 ?auto_79794 ) ) ( not ( = ?auto_79791 ?auto_79792 ) ) ( not ( = ?auto_79791 ?auto_79793 ) ) ( not ( = ?auto_79791 ?auto_79794 ) ) ( not ( = ?auto_79792 ?auto_79793 ) ) ( not ( = ?auto_79792 ?auto_79794 ) ) ( not ( = ?auto_79793 ?auto_79794 ) ) ( CLEAR ?auto_79791 ) ( ON ?auto_79792 ?auto_79793 ) ( CLEAR ?auto_79792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_79784 ?auto_79785 ?auto_79786 ?auto_79787 ?auto_79788 ?auto_79789 ?auto_79790 ?auto_79791 ?auto_79792 )
      ( MAKE-10PILE ?auto_79784 ?auto_79785 ?auto_79786 ?auto_79787 ?auto_79788 ?auto_79789 ?auto_79790 ?auto_79791 ?auto_79792 ?auto_79793 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_79805 - BLOCK
      ?auto_79806 - BLOCK
      ?auto_79807 - BLOCK
      ?auto_79808 - BLOCK
      ?auto_79809 - BLOCK
      ?auto_79810 - BLOCK
      ?auto_79811 - BLOCK
      ?auto_79812 - BLOCK
      ?auto_79813 - BLOCK
      ?auto_79814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79814 ) ( ON-TABLE ?auto_79805 ) ( ON ?auto_79806 ?auto_79805 ) ( ON ?auto_79807 ?auto_79806 ) ( ON ?auto_79808 ?auto_79807 ) ( ON ?auto_79809 ?auto_79808 ) ( ON ?auto_79810 ?auto_79809 ) ( ON ?auto_79811 ?auto_79810 ) ( ON ?auto_79812 ?auto_79811 ) ( not ( = ?auto_79805 ?auto_79806 ) ) ( not ( = ?auto_79805 ?auto_79807 ) ) ( not ( = ?auto_79805 ?auto_79808 ) ) ( not ( = ?auto_79805 ?auto_79809 ) ) ( not ( = ?auto_79805 ?auto_79810 ) ) ( not ( = ?auto_79805 ?auto_79811 ) ) ( not ( = ?auto_79805 ?auto_79812 ) ) ( not ( = ?auto_79805 ?auto_79813 ) ) ( not ( = ?auto_79805 ?auto_79814 ) ) ( not ( = ?auto_79806 ?auto_79807 ) ) ( not ( = ?auto_79806 ?auto_79808 ) ) ( not ( = ?auto_79806 ?auto_79809 ) ) ( not ( = ?auto_79806 ?auto_79810 ) ) ( not ( = ?auto_79806 ?auto_79811 ) ) ( not ( = ?auto_79806 ?auto_79812 ) ) ( not ( = ?auto_79806 ?auto_79813 ) ) ( not ( = ?auto_79806 ?auto_79814 ) ) ( not ( = ?auto_79807 ?auto_79808 ) ) ( not ( = ?auto_79807 ?auto_79809 ) ) ( not ( = ?auto_79807 ?auto_79810 ) ) ( not ( = ?auto_79807 ?auto_79811 ) ) ( not ( = ?auto_79807 ?auto_79812 ) ) ( not ( = ?auto_79807 ?auto_79813 ) ) ( not ( = ?auto_79807 ?auto_79814 ) ) ( not ( = ?auto_79808 ?auto_79809 ) ) ( not ( = ?auto_79808 ?auto_79810 ) ) ( not ( = ?auto_79808 ?auto_79811 ) ) ( not ( = ?auto_79808 ?auto_79812 ) ) ( not ( = ?auto_79808 ?auto_79813 ) ) ( not ( = ?auto_79808 ?auto_79814 ) ) ( not ( = ?auto_79809 ?auto_79810 ) ) ( not ( = ?auto_79809 ?auto_79811 ) ) ( not ( = ?auto_79809 ?auto_79812 ) ) ( not ( = ?auto_79809 ?auto_79813 ) ) ( not ( = ?auto_79809 ?auto_79814 ) ) ( not ( = ?auto_79810 ?auto_79811 ) ) ( not ( = ?auto_79810 ?auto_79812 ) ) ( not ( = ?auto_79810 ?auto_79813 ) ) ( not ( = ?auto_79810 ?auto_79814 ) ) ( not ( = ?auto_79811 ?auto_79812 ) ) ( not ( = ?auto_79811 ?auto_79813 ) ) ( not ( = ?auto_79811 ?auto_79814 ) ) ( not ( = ?auto_79812 ?auto_79813 ) ) ( not ( = ?auto_79812 ?auto_79814 ) ) ( not ( = ?auto_79813 ?auto_79814 ) ) ( CLEAR ?auto_79812 ) ( ON ?auto_79813 ?auto_79814 ) ( CLEAR ?auto_79813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_79805 ?auto_79806 ?auto_79807 ?auto_79808 ?auto_79809 ?auto_79810 ?auto_79811 ?auto_79812 ?auto_79813 )
      ( MAKE-10PILE ?auto_79805 ?auto_79806 ?auto_79807 ?auto_79808 ?auto_79809 ?auto_79810 ?auto_79811 ?auto_79812 ?auto_79813 ?auto_79814 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_79825 - BLOCK
      ?auto_79826 - BLOCK
      ?auto_79827 - BLOCK
      ?auto_79828 - BLOCK
      ?auto_79829 - BLOCK
      ?auto_79830 - BLOCK
      ?auto_79831 - BLOCK
      ?auto_79832 - BLOCK
      ?auto_79833 - BLOCK
      ?auto_79834 - BLOCK
    )
    :vars
    (
      ?auto_79835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79834 ?auto_79835 ) ( ON-TABLE ?auto_79825 ) ( ON ?auto_79826 ?auto_79825 ) ( ON ?auto_79827 ?auto_79826 ) ( ON ?auto_79828 ?auto_79827 ) ( ON ?auto_79829 ?auto_79828 ) ( ON ?auto_79830 ?auto_79829 ) ( ON ?auto_79831 ?auto_79830 ) ( not ( = ?auto_79825 ?auto_79826 ) ) ( not ( = ?auto_79825 ?auto_79827 ) ) ( not ( = ?auto_79825 ?auto_79828 ) ) ( not ( = ?auto_79825 ?auto_79829 ) ) ( not ( = ?auto_79825 ?auto_79830 ) ) ( not ( = ?auto_79825 ?auto_79831 ) ) ( not ( = ?auto_79825 ?auto_79832 ) ) ( not ( = ?auto_79825 ?auto_79833 ) ) ( not ( = ?auto_79825 ?auto_79834 ) ) ( not ( = ?auto_79825 ?auto_79835 ) ) ( not ( = ?auto_79826 ?auto_79827 ) ) ( not ( = ?auto_79826 ?auto_79828 ) ) ( not ( = ?auto_79826 ?auto_79829 ) ) ( not ( = ?auto_79826 ?auto_79830 ) ) ( not ( = ?auto_79826 ?auto_79831 ) ) ( not ( = ?auto_79826 ?auto_79832 ) ) ( not ( = ?auto_79826 ?auto_79833 ) ) ( not ( = ?auto_79826 ?auto_79834 ) ) ( not ( = ?auto_79826 ?auto_79835 ) ) ( not ( = ?auto_79827 ?auto_79828 ) ) ( not ( = ?auto_79827 ?auto_79829 ) ) ( not ( = ?auto_79827 ?auto_79830 ) ) ( not ( = ?auto_79827 ?auto_79831 ) ) ( not ( = ?auto_79827 ?auto_79832 ) ) ( not ( = ?auto_79827 ?auto_79833 ) ) ( not ( = ?auto_79827 ?auto_79834 ) ) ( not ( = ?auto_79827 ?auto_79835 ) ) ( not ( = ?auto_79828 ?auto_79829 ) ) ( not ( = ?auto_79828 ?auto_79830 ) ) ( not ( = ?auto_79828 ?auto_79831 ) ) ( not ( = ?auto_79828 ?auto_79832 ) ) ( not ( = ?auto_79828 ?auto_79833 ) ) ( not ( = ?auto_79828 ?auto_79834 ) ) ( not ( = ?auto_79828 ?auto_79835 ) ) ( not ( = ?auto_79829 ?auto_79830 ) ) ( not ( = ?auto_79829 ?auto_79831 ) ) ( not ( = ?auto_79829 ?auto_79832 ) ) ( not ( = ?auto_79829 ?auto_79833 ) ) ( not ( = ?auto_79829 ?auto_79834 ) ) ( not ( = ?auto_79829 ?auto_79835 ) ) ( not ( = ?auto_79830 ?auto_79831 ) ) ( not ( = ?auto_79830 ?auto_79832 ) ) ( not ( = ?auto_79830 ?auto_79833 ) ) ( not ( = ?auto_79830 ?auto_79834 ) ) ( not ( = ?auto_79830 ?auto_79835 ) ) ( not ( = ?auto_79831 ?auto_79832 ) ) ( not ( = ?auto_79831 ?auto_79833 ) ) ( not ( = ?auto_79831 ?auto_79834 ) ) ( not ( = ?auto_79831 ?auto_79835 ) ) ( not ( = ?auto_79832 ?auto_79833 ) ) ( not ( = ?auto_79832 ?auto_79834 ) ) ( not ( = ?auto_79832 ?auto_79835 ) ) ( not ( = ?auto_79833 ?auto_79834 ) ) ( not ( = ?auto_79833 ?auto_79835 ) ) ( not ( = ?auto_79834 ?auto_79835 ) ) ( ON ?auto_79833 ?auto_79834 ) ( CLEAR ?auto_79831 ) ( ON ?auto_79832 ?auto_79833 ) ( CLEAR ?auto_79832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_79825 ?auto_79826 ?auto_79827 ?auto_79828 ?auto_79829 ?auto_79830 ?auto_79831 ?auto_79832 )
      ( MAKE-10PILE ?auto_79825 ?auto_79826 ?auto_79827 ?auto_79828 ?auto_79829 ?auto_79830 ?auto_79831 ?auto_79832 ?auto_79833 ?auto_79834 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_79846 - BLOCK
      ?auto_79847 - BLOCK
      ?auto_79848 - BLOCK
      ?auto_79849 - BLOCK
      ?auto_79850 - BLOCK
      ?auto_79851 - BLOCK
      ?auto_79852 - BLOCK
      ?auto_79853 - BLOCK
      ?auto_79854 - BLOCK
      ?auto_79855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79855 ) ( ON-TABLE ?auto_79846 ) ( ON ?auto_79847 ?auto_79846 ) ( ON ?auto_79848 ?auto_79847 ) ( ON ?auto_79849 ?auto_79848 ) ( ON ?auto_79850 ?auto_79849 ) ( ON ?auto_79851 ?auto_79850 ) ( ON ?auto_79852 ?auto_79851 ) ( not ( = ?auto_79846 ?auto_79847 ) ) ( not ( = ?auto_79846 ?auto_79848 ) ) ( not ( = ?auto_79846 ?auto_79849 ) ) ( not ( = ?auto_79846 ?auto_79850 ) ) ( not ( = ?auto_79846 ?auto_79851 ) ) ( not ( = ?auto_79846 ?auto_79852 ) ) ( not ( = ?auto_79846 ?auto_79853 ) ) ( not ( = ?auto_79846 ?auto_79854 ) ) ( not ( = ?auto_79846 ?auto_79855 ) ) ( not ( = ?auto_79847 ?auto_79848 ) ) ( not ( = ?auto_79847 ?auto_79849 ) ) ( not ( = ?auto_79847 ?auto_79850 ) ) ( not ( = ?auto_79847 ?auto_79851 ) ) ( not ( = ?auto_79847 ?auto_79852 ) ) ( not ( = ?auto_79847 ?auto_79853 ) ) ( not ( = ?auto_79847 ?auto_79854 ) ) ( not ( = ?auto_79847 ?auto_79855 ) ) ( not ( = ?auto_79848 ?auto_79849 ) ) ( not ( = ?auto_79848 ?auto_79850 ) ) ( not ( = ?auto_79848 ?auto_79851 ) ) ( not ( = ?auto_79848 ?auto_79852 ) ) ( not ( = ?auto_79848 ?auto_79853 ) ) ( not ( = ?auto_79848 ?auto_79854 ) ) ( not ( = ?auto_79848 ?auto_79855 ) ) ( not ( = ?auto_79849 ?auto_79850 ) ) ( not ( = ?auto_79849 ?auto_79851 ) ) ( not ( = ?auto_79849 ?auto_79852 ) ) ( not ( = ?auto_79849 ?auto_79853 ) ) ( not ( = ?auto_79849 ?auto_79854 ) ) ( not ( = ?auto_79849 ?auto_79855 ) ) ( not ( = ?auto_79850 ?auto_79851 ) ) ( not ( = ?auto_79850 ?auto_79852 ) ) ( not ( = ?auto_79850 ?auto_79853 ) ) ( not ( = ?auto_79850 ?auto_79854 ) ) ( not ( = ?auto_79850 ?auto_79855 ) ) ( not ( = ?auto_79851 ?auto_79852 ) ) ( not ( = ?auto_79851 ?auto_79853 ) ) ( not ( = ?auto_79851 ?auto_79854 ) ) ( not ( = ?auto_79851 ?auto_79855 ) ) ( not ( = ?auto_79852 ?auto_79853 ) ) ( not ( = ?auto_79852 ?auto_79854 ) ) ( not ( = ?auto_79852 ?auto_79855 ) ) ( not ( = ?auto_79853 ?auto_79854 ) ) ( not ( = ?auto_79853 ?auto_79855 ) ) ( not ( = ?auto_79854 ?auto_79855 ) ) ( ON ?auto_79854 ?auto_79855 ) ( CLEAR ?auto_79852 ) ( ON ?auto_79853 ?auto_79854 ) ( CLEAR ?auto_79853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_79846 ?auto_79847 ?auto_79848 ?auto_79849 ?auto_79850 ?auto_79851 ?auto_79852 ?auto_79853 )
      ( MAKE-10PILE ?auto_79846 ?auto_79847 ?auto_79848 ?auto_79849 ?auto_79850 ?auto_79851 ?auto_79852 ?auto_79853 ?auto_79854 ?auto_79855 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_79866 - BLOCK
      ?auto_79867 - BLOCK
      ?auto_79868 - BLOCK
      ?auto_79869 - BLOCK
      ?auto_79870 - BLOCK
      ?auto_79871 - BLOCK
      ?auto_79872 - BLOCK
      ?auto_79873 - BLOCK
      ?auto_79874 - BLOCK
      ?auto_79875 - BLOCK
    )
    :vars
    (
      ?auto_79876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79875 ?auto_79876 ) ( ON-TABLE ?auto_79866 ) ( ON ?auto_79867 ?auto_79866 ) ( ON ?auto_79868 ?auto_79867 ) ( ON ?auto_79869 ?auto_79868 ) ( ON ?auto_79870 ?auto_79869 ) ( ON ?auto_79871 ?auto_79870 ) ( not ( = ?auto_79866 ?auto_79867 ) ) ( not ( = ?auto_79866 ?auto_79868 ) ) ( not ( = ?auto_79866 ?auto_79869 ) ) ( not ( = ?auto_79866 ?auto_79870 ) ) ( not ( = ?auto_79866 ?auto_79871 ) ) ( not ( = ?auto_79866 ?auto_79872 ) ) ( not ( = ?auto_79866 ?auto_79873 ) ) ( not ( = ?auto_79866 ?auto_79874 ) ) ( not ( = ?auto_79866 ?auto_79875 ) ) ( not ( = ?auto_79866 ?auto_79876 ) ) ( not ( = ?auto_79867 ?auto_79868 ) ) ( not ( = ?auto_79867 ?auto_79869 ) ) ( not ( = ?auto_79867 ?auto_79870 ) ) ( not ( = ?auto_79867 ?auto_79871 ) ) ( not ( = ?auto_79867 ?auto_79872 ) ) ( not ( = ?auto_79867 ?auto_79873 ) ) ( not ( = ?auto_79867 ?auto_79874 ) ) ( not ( = ?auto_79867 ?auto_79875 ) ) ( not ( = ?auto_79867 ?auto_79876 ) ) ( not ( = ?auto_79868 ?auto_79869 ) ) ( not ( = ?auto_79868 ?auto_79870 ) ) ( not ( = ?auto_79868 ?auto_79871 ) ) ( not ( = ?auto_79868 ?auto_79872 ) ) ( not ( = ?auto_79868 ?auto_79873 ) ) ( not ( = ?auto_79868 ?auto_79874 ) ) ( not ( = ?auto_79868 ?auto_79875 ) ) ( not ( = ?auto_79868 ?auto_79876 ) ) ( not ( = ?auto_79869 ?auto_79870 ) ) ( not ( = ?auto_79869 ?auto_79871 ) ) ( not ( = ?auto_79869 ?auto_79872 ) ) ( not ( = ?auto_79869 ?auto_79873 ) ) ( not ( = ?auto_79869 ?auto_79874 ) ) ( not ( = ?auto_79869 ?auto_79875 ) ) ( not ( = ?auto_79869 ?auto_79876 ) ) ( not ( = ?auto_79870 ?auto_79871 ) ) ( not ( = ?auto_79870 ?auto_79872 ) ) ( not ( = ?auto_79870 ?auto_79873 ) ) ( not ( = ?auto_79870 ?auto_79874 ) ) ( not ( = ?auto_79870 ?auto_79875 ) ) ( not ( = ?auto_79870 ?auto_79876 ) ) ( not ( = ?auto_79871 ?auto_79872 ) ) ( not ( = ?auto_79871 ?auto_79873 ) ) ( not ( = ?auto_79871 ?auto_79874 ) ) ( not ( = ?auto_79871 ?auto_79875 ) ) ( not ( = ?auto_79871 ?auto_79876 ) ) ( not ( = ?auto_79872 ?auto_79873 ) ) ( not ( = ?auto_79872 ?auto_79874 ) ) ( not ( = ?auto_79872 ?auto_79875 ) ) ( not ( = ?auto_79872 ?auto_79876 ) ) ( not ( = ?auto_79873 ?auto_79874 ) ) ( not ( = ?auto_79873 ?auto_79875 ) ) ( not ( = ?auto_79873 ?auto_79876 ) ) ( not ( = ?auto_79874 ?auto_79875 ) ) ( not ( = ?auto_79874 ?auto_79876 ) ) ( not ( = ?auto_79875 ?auto_79876 ) ) ( ON ?auto_79874 ?auto_79875 ) ( ON ?auto_79873 ?auto_79874 ) ( CLEAR ?auto_79871 ) ( ON ?auto_79872 ?auto_79873 ) ( CLEAR ?auto_79872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79866 ?auto_79867 ?auto_79868 ?auto_79869 ?auto_79870 ?auto_79871 ?auto_79872 )
      ( MAKE-10PILE ?auto_79866 ?auto_79867 ?auto_79868 ?auto_79869 ?auto_79870 ?auto_79871 ?auto_79872 ?auto_79873 ?auto_79874 ?auto_79875 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_79887 - BLOCK
      ?auto_79888 - BLOCK
      ?auto_79889 - BLOCK
      ?auto_79890 - BLOCK
      ?auto_79891 - BLOCK
      ?auto_79892 - BLOCK
      ?auto_79893 - BLOCK
      ?auto_79894 - BLOCK
      ?auto_79895 - BLOCK
      ?auto_79896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79896 ) ( ON-TABLE ?auto_79887 ) ( ON ?auto_79888 ?auto_79887 ) ( ON ?auto_79889 ?auto_79888 ) ( ON ?auto_79890 ?auto_79889 ) ( ON ?auto_79891 ?auto_79890 ) ( ON ?auto_79892 ?auto_79891 ) ( not ( = ?auto_79887 ?auto_79888 ) ) ( not ( = ?auto_79887 ?auto_79889 ) ) ( not ( = ?auto_79887 ?auto_79890 ) ) ( not ( = ?auto_79887 ?auto_79891 ) ) ( not ( = ?auto_79887 ?auto_79892 ) ) ( not ( = ?auto_79887 ?auto_79893 ) ) ( not ( = ?auto_79887 ?auto_79894 ) ) ( not ( = ?auto_79887 ?auto_79895 ) ) ( not ( = ?auto_79887 ?auto_79896 ) ) ( not ( = ?auto_79888 ?auto_79889 ) ) ( not ( = ?auto_79888 ?auto_79890 ) ) ( not ( = ?auto_79888 ?auto_79891 ) ) ( not ( = ?auto_79888 ?auto_79892 ) ) ( not ( = ?auto_79888 ?auto_79893 ) ) ( not ( = ?auto_79888 ?auto_79894 ) ) ( not ( = ?auto_79888 ?auto_79895 ) ) ( not ( = ?auto_79888 ?auto_79896 ) ) ( not ( = ?auto_79889 ?auto_79890 ) ) ( not ( = ?auto_79889 ?auto_79891 ) ) ( not ( = ?auto_79889 ?auto_79892 ) ) ( not ( = ?auto_79889 ?auto_79893 ) ) ( not ( = ?auto_79889 ?auto_79894 ) ) ( not ( = ?auto_79889 ?auto_79895 ) ) ( not ( = ?auto_79889 ?auto_79896 ) ) ( not ( = ?auto_79890 ?auto_79891 ) ) ( not ( = ?auto_79890 ?auto_79892 ) ) ( not ( = ?auto_79890 ?auto_79893 ) ) ( not ( = ?auto_79890 ?auto_79894 ) ) ( not ( = ?auto_79890 ?auto_79895 ) ) ( not ( = ?auto_79890 ?auto_79896 ) ) ( not ( = ?auto_79891 ?auto_79892 ) ) ( not ( = ?auto_79891 ?auto_79893 ) ) ( not ( = ?auto_79891 ?auto_79894 ) ) ( not ( = ?auto_79891 ?auto_79895 ) ) ( not ( = ?auto_79891 ?auto_79896 ) ) ( not ( = ?auto_79892 ?auto_79893 ) ) ( not ( = ?auto_79892 ?auto_79894 ) ) ( not ( = ?auto_79892 ?auto_79895 ) ) ( not ( = ?auto_79892 ?auto_79896 ) ) ( not ( = ?auto_79893 ?auto_79894 ) ) ( not ( = ?auto_79893 ?auto_79895 ) ) ( not ( = ?auto_79893 ?auto_79896 ) ) ( not ( = ?auto_79894 ?auto_79895 ) ) ( not ( = ?auto_79894 ?auto_79896 ) ) ( not ( = ?auto_79895 ?auto_79896 ) ) ( ON ?auto_79895 ?auto_79896 ) ( ON ?auto_79894 ?auto_79895 ) ( CLEAR ?auto_79892 ) ( ON ?auto_79893 ?auto_79894 ) ( CLEAR ?auto_79893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79887 ?auto_79888 ?auto_79889 ?auto_79890 ?auto_79891 ?auto_79892 ?auto_79893 )
      ( MAKE-10PILE ?auto_79887 ?auto_79888 ?auto_79889 ?auto_79890 ?auto_79891 ?auto_79892 ?auto_79893 ?auto_79894 ?auto_79895 ?auto_79896 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_79907 - BLOCK
      ?auto_79908 - BLOCK
      ?auto_79909 - BLOCK
      ?auto_79910 - BLOCK
      ?auto_79911 - BLOCK
      ?auto_79912 - BLOCK
      ?auto_79913 - BLOCK
      ?auto_79914 - BLOCK
      ?auto_79915 - BLOCK
      ?auto_79916 - BLOCK
    )
    :vars
    (
      ?auto_79917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79916 ?auto_79917 ) ( ON-TABLE ?auto_79907 ) ( ON ?auto_79908 ?auto_79907 ) ( ON ?auto_79909 ?auto_79908 ) ( ON ?auto_79910 ?auto_79909 ) ( ON ?auto_79911 ?auto_79910 ) ( not ( = ?auto_79907 ?auto_79908 ) ) ( not ( = ?auto_79907 ?auto_79909 ) ) ( not ( = ?auto_79907 ?auto_79910 ) ) ( not ( = ?auto_79907 ?auto_79911 ) ) ( not ( = ?auto_79907 ?auto_79912 ) ) ( not ( = ?auto_79907 ?auto_79913 ) ) ( not ( = ?auto_79907 ?auto_79914 ) ) ( not ( = ?auto_79907 ?auto_79915 ) ) ( not ( = ?auto_79907 ?auto_79916 ) ) ( not ( = ?auto_79907 ?auto_79917 ) ) ( not ( = ?auto_79908 ?auto_79909 ) ) ( not ( = ?auto_79908 ?auto_79910 ) ) ( not ( = ?auto_79908 ?auto_79911 ) ) ( not ( = ?auto_79908 ?auto_79912 ) ) ( not ( = ?auto_79908 ?auto_79913 ) ) ( not ( = ?auto_79908 ?auto_79914 ) ) ( not ( = ?auto_79908 ?auto_79915 ) ) ( not ( = ?auto_79908 ?auto_79916 ) ) ( not ( = ?auto_79908 ?auto_79917 ) ) ( not ( = ?auto_79909 ?auto_79910 ) ) ( not ( = ?auto_79909 ?auto_79911 ) ) ( not ( = ?auto_79909 ?auto_79912 ) ) ( not ( = ?auto_79909 ?auto_79913 ) ) ( not ( = ?auto_79909 ?auto_79914 ) ) ( not ( = ?auto_79909 ?auto_79915 ) ) ( not ( = ?auto_79909 ?auto_79916 ) ) ( not ( = ?auto_79909 ?auto_79917 ) ) ( not ( = ?auto_79910 ?auto_79911 ) ) ( not ( = ?auto_79910 ?auto_79912 ) ) ( not ( = ?auto_79910 ?auto_79913 ) ) ( not ( = ?auto_79910 ?auto_79914 ) ) ( not ( = ?auto_79910 ?auto_79915 ) ) ( not ( = ?auto_79910 ?auto_79916 ) ) ( not ( = ?auto_79910 ?auto_79917 ) ) ( not ( = ?auto_79911 ?auto_79912 ) ) ( not ( = ?auto_79911 ?auto_79913 ) ) ( not ( = ?auto_79911 ?auto_79914 ) ) ( not ( = ?auto_79911 ?auto_79915 ) ) ( not ( = ?auto_79911 ?auto_79916 ) ) ( not ( = ?auto_79911 ?auto_79917 ) ) ( not ( = ?auto_79912 ?auto_79913 ) ) ( not ( = ?auto_79912 ?auto_79914 ) ) ( not ( = ?auto_79912 ?auto_79915 ) ) ( not ( = ?auto_79912 ?auto_79916 ) ) ( not ( = ?auto_79912 ?auto_79917 ) ) ( not ( = ?auto_79913 ?auto_79914 ) ) ( not ( = ?auto_79913 ?auto_79915 ) ) ( not ( = ?auto_79913 ?auto_79916 ) ) ( not ( = ?auto_79913 ?auto_79917 ) ) ( not ( = ?auto_79914 ?auto_79915 ) ) ( not ( = ?auto_79914 ?auto_79916 ) ) ( not ( = ?auto_79914 ?auto_79917 ) ) ( not ( = ?auto_79915 ?auto_79916 ) ) ( not ( = ?auto_79915 ?auto_79917 ) ) ( not ( = ?auto_79916 ?auto_79917 ) ) ( ON ?auto_79915 ?auto_79916 ) ( ON ?auto_79914 ?auto_79915 ) ( ON ?auto_79913 ?auto_79914 ) ( CLEAR ?auto_79911 ) ( ON ?auto_79912 ?auto_79913 ) ( CLEAR ?auto_79912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79907 ?auto_79908 ?auto_79909 ?auto_79910 ?auto_79911 ?auto_79912 )
      ( MAKE-10PILE ?auto_79907 ?auto_79908 ?auto_79909 ?auto_79910 ?auto_79911 ?auto_79912 ?auto_79913 ?auto_79914 ?auto_79915 ?auto_79916 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_79928 - BLOCK
      ?auto_79929 - BLOCK
      ?auto_79930 - BLOCK
      ?auto_79931 - BLOCK
      ?auto_79932 - BLOCK
      ?auto_79933 - BLOCK
      ?auto_79934 - BLOCK
      ?auto_79935 - BLOCK
      ?auto_79936 - BLOCK
      ?auto_79937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79937 ) ( ON-TABLE ?auto_79928 ) ( ON ?auto_79929 ?auto_79928 ) ( ON ?auto_79930 ?auto_79929 ) ( ON ?auto_79931 ?auto_79930 ) ( ON ?auto_79932 ?auto_79931 ) ( not ( = ?auto_79928 ?auto_79929 ) ) ( not ( = ?auto_79928 ?auto_79930 ) ) ( not ( = ?auto_79928 ?auto_79931 ) ) ( not ( = ?auto_79928 ?auto_79932 ) ) ( not ( = ?auto_79928 ?auto_79933 ) ) ( not ( = ?auto_79928 ?auto_79934 ) ) ( not ( = ?auto_79928 ?auto_79935 ) ) ( not ( = ?auto_79928 ?auto_79936 ) ) ( not ( = ?auto_79928 ?auto_79937 ) ) ( not ( = ?auto_79929 ?auto_79930 ) ) ( not ( = ?auto_79929 ?auto_79931 ) ) ( not ( = ?auto_79929 ?auto_79932 ) ) ( not ( = ?auto_79929 ?auto_79933 ) ) ( not ( = ?auto_79929 ?auto_79934 ) ) ( not ( = ?auto_79929 ?auto_79935 ) ) ( not ( = ?auto_79929 ?auto_79936 ) ) ( not ( = ?auto_79929 ?auto_79937 ) ) ( not ( = ?auto_79930 ?auto_79931 ) ) ( not ( = ?auto_79930 ?auto_79932 ) ) ( not ( = ?auto_79930 ?auto_79933 ) ) ( not ( = ?auto_79930 ?auto_79934 ) ) ( not ( = ?auto_79930 ?auto_79935 ) ) ( not ( = ?auto_79930 ?auto_79936 ) ) ( not ( = ?auto_79930 ?auto_79937 ) ) ( not ( = ?auto_79931 ?auto_79932 ) ) ( not ( = ?auto_79931 ?auto_79933 ) ) ( not ( = ?auto_79931 ?auto_79934 ) ) ( not ( = ?auto_79931 ?auto_79935 ) ) ( not ( = ?auto_79931 ?auto_79936 ) ) ( not ( = ?auto_79931 ?auto_79937 ) ) ( not ( = ?auto_79932 ?auto_79933 ) ) ( not ( = ?auto_79932 ?auto_79934 ) ) ( not ( = ?auto_79932 ?auto_79935 ) ) ( not ( = ?auto_79932 ?auto_79936 ) ) ( not ( = ?auto_79932 ?auto_79937 ) ) ( not ( = ?auto_79933 ?auto_79934 ) ) ( not ( = ?auto_79933 ?auto_79935 ) ) ( not ( = ?auto_79933 ?auto_79936 ) ) ( not ( = ?auto_79933 ?auto_79937 ) ) ( not ( = ?auto_79934 ?auto_79935 ) ) ( not ( = ?auto_79934 ?auto_79936 ) ) ( not ( = ?auto_79934 ?auto_79937 ) ) ( not ( = ?auto_79935 ?auto_79936 ) ) ( not ( = ?auto_79935 ?auto_79937 ) ) ( not ( = ?auto_79936 ?auto_79937 ) ) ( ON ?auto_79936 ?auto_79937 ) ( ON ?auto_79935 ?auto_79936 ) ( ON ?auto_79934 ?auto_79935 ) ( CLEAR ?auto_79932 ) ( ON ?auto_79933 ?auto_79934 ) ( CLEAR ?auto_79933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79928 ?auto_79929 ?auto_79930 ?auto_79931 ?auto_79932 ?auto_79933 )
      ( MAKE-10PILE ?auto_79928 ?auto_79929 ?auto_79930 ?auto_79931 ?auto_79932 ?auto_79933 ?auto_79934 ?auto_79935 ?auto_79936 ?auto_79937 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_79948 - BLOCK
      ?auto_79949 - BLOCK
      ?auto_79950 - BLOCK
      ?auto_79951 - BLOCK
      ?auto_79952 - BLOCK
      ?auto_79953 - BLOCK
      ?auto_79954 - BLOCK
      ?auto_79955 - BLOCK
      ?auto_79956 - BLOCK
      ?auto_79957 - BLOCK
    )
    :vars
    (
      ?auto_79958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79957 ?auto_79958 ) ( ON-TABLE ?auto_79948 ) ( ON ?auto_79949 ?auto_79948 ) ( ON ?auto_79950 ?auto_79949 ) ( ON ?auto_79951 ?auto_79950 ) ( not ( = ?auto_79948 ?auto_79949 ) ) ( not ( = ?auto_79948 ?auto_79950 ) ) ( not ( = ?auto_79948 ?auto_79951 ) ) ( not ( = ?auto_79948 ?auto_79952 ) ) ( not ( = ?auto_79948 ?auto_79953 ) ) ( not ( = ?auto_79948 ?auto_79954 ) ) ( not ( = ?auto_79948 ?auto_79955 ) ) ( not ( = ?auto_79948 ?auto_79956 ) ) ( not ( = ?auto_79948 ?auto_79957 ) ) ( not ( = ?auto_79948 ?auto_79958 ) ) ( not ( = ?auto_79949 ?auto_79950 ) ) ( not ( = ?auto_79949 ?auto_79951 ) ) ( not ( = ?auto_79949 ?auto_79952 ) ) ( not ( = ?auto_79949 ?auto_79953 ) ) ( not ( = ?auto_79949 ?auto_79954 ) ) ( not ( = ?auto_79949 ?auto_79955 ) ) ( not ( = ?auto_79949 ?auto_79956 ) ) ( not ( = ?auto_79949 ?auto_79957 ) ) ( not ( = ?auto_79949 ?auto_79958 ) ) ( not ( = ?auto_79950 ?auto_79951 ) ) ( not ( = ?auto_79950 ?auto_79952 ) ) ( not ( = ?auto_79950 ?auto_79953 ) ) ( not ( = ?auto_79950 ?auto_79954 ) ) ( not ( = ?auto_79950 ?auto_79955 ) ) ( not ( = ?auto_79950 ?auto_79956 ) ) ( not ( = ?auto_79950 ?auto_79957 ) ) ( not ( = ?auto_79950 ?auto_79958 ) ) ( not ( = ?auto_79951 ?auto_79952 ) ) ( not ( = ?auto_79951 ?auto_79953 ) ) ( not ( = ?auto_79951 ?auto_79954 ) ) ( not ( = ?auto_79951 ?auto_79955 ) ) ( not ( = ?auto_79951 ?auto_79956 ) ) ( not ( = ?auto_79951 ?auto_79957 ) ) ( not ( = ?auto_79951 ?auto_79958 ) ) ( not ( = ?auto_79952 ?auto_79953 ) ) ( not ( = ?auto_79952 ?auto_79954 ) ) ( not ( = ?auto_79952 ?auto_79955 ) ) ( not ( = ?auto_79952 ?auto_79956 ) ) ( not ( = ?auto_79952 ?auto_79957 ) ) ( not ( = ?auto_79952 ?auto_79958 ) ) ( not ( = ?auto_79953 ?auto_79954 ) ) ( not ( = ?auto_79953 ?auto_79955 ) ) ( not ( = ?auto_79953 ?auto_79956 ) ) ( not ( = ?auto_79953 ?auto_79957 ) ) ( not ( = ?auto_79953 ?auto_79958 ) ) ( not ( = ?auto_79954 ?auto_79955 ) ) ( not ( = ?auto_79954 ?auto_79956 ) ) ( not ( = ?auto_79954 ?auto_79957 ) ) ( not ( = ?auto_79954 ?auto_79958 ) ) ( not ( = ?auto_79955 ?auto_79956 ) ) ( not ( = ?auto_79955 ?auto_79957 ) ) ( not ( = ?auto_79955 ?auto_79958 ) ) ( not ( = ?auto_79956 ?auto_79957 ) ) ( not ( = ?auto_79956 ?auto_79958 ) ) ( not ( = ?auto_79957 ?auto_79958 ) ) ( ON ?auto_79956 ?auto_79957 ) ( ON ?auto_79955 ?auto_79956 ) ( ON ?auto_79954 ?auto_79955 ) ( ON ?auto_79953 ?auto_79954 ) ( CLEAR ?auto_79951 ) ( ON ?auto_79952 ?auto_79953 ) ( CLEAR ?auto_79952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79948 ?auto_79949 ?auto_79950 ?auto_79951 ?auto_79952 )
      ( MAKE-10PILE ?auto_79948 ?auto_79949 ?auto_79950 ?auto_79951 ?auto_79952 ?auto_79953 ?auto_79954 ?auto_79955 ?auto_79956 ?auto_79957 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_79969 - BLOCK
      ?auto_79970 - BLOCK
      ?auto_79971 - BLOCK
      ?auto_79972 - BLOCK
      ?auto_79973 - BLOCK
      ?auto_79974 - BLOCK
      ?auto_79975 - BLOCK
      ?auto_79976 - BLOCK
      ?auto_79977 - BLOCK
      ?auto_79978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79978 ) ( ON-TABLE ?auto_79969 ) ( ON ?auto_79970 ?auto_79969 ) ( ON ?auto_79971 ?auto_79970 ) ( ON ?auto_79972 ?auto_79971 ) ( not ( = ?auto_79969 ?auto_79970 ) ) ( not ( = ?auto_79969 ?auto_79971 ) ) ( not ( = ?auto_79969 ?auto_79972 ) ) ( not ( = ?auto_79969 ?auto_79973 ) ) ( not ( = ?auto_79969 ?auto_79974 ) ) ( not ( = ?auto_79969 ?auto_79975 ) ) ( not ( = ?auto_79969 ?auto_79976 ) ) ( not ( = ?auto_79969 ?auto_79977 ) ) ( not ( = ?auto_79969 ?auto_79978 ) ) ( not ( = ?auto_79970 ?auto_79971 ) ) ( not ( = ?auto_79970 ?auto_79972 ) ) ( not ( = ?auto_79970 ?auto_79973 ) ) ( not ( = ?auto_79970 ?auto_79974 ) ) ( not ( = ?auto_79970 ?auto_79975 ) ) ( not ( = ?auto_79970 ?auto_79976 ) ) ( not ( = ?auto_79970 ?auto_79977 ) ) ( not ( = ?auto_79970 ?auto_79978 ) ) ( not ( = ?auto_79971 ?auto_79972 ) ) ( not ( = ?auto_79971 ?auto_79973 ) ) ( not ( = ?auto_79971 ?auto_79974 ) ) ( not ( = ?auto_79971 ?auto_79975 ) ) ( not ( = ?auto_79971 ?auto_79976 ) ) ( not ( = ?auto_79971 ?auto_79977 ) ) ( not ( = ?auto_79971 ?auto_79978 ) ) ( not ( = ?auto_79972 ?auto_79973 ) ) ( not ( = ?auto_79972 ?auto_79974 ) ) ( not ( = ?auto_79972 ?auto_79975 ) ) ( not ( = ?auto_79972 ?auto_79976 ) ) ( not ( = ?auto_79972 ?auto_79977 ) ) ( not ( = ?auto_79972 ?auto_79978 ) ) ( not ( = ?auto_79973 ?auto_79974 ) ) ( not ( = ?auto_79973 ?auto_79975 ) ) ( not ( = ?auto_79973 ?auto_79976 ) ) ( not ( = ?auto_79973 ?auto_79977 ) ) ( not ( = ?auto_79973 ?auto_79978 ) ) ( not ( = ?auto_79974 ?auto_79975 ) ) ( not ( = ?auto_79974 ?auto_79976 ) ) ( not ( = ?auto_79974 ?auto_79977 ) ) ( not ( = ?auto_79974 ?auto_79978 ) ) ( not ( = ?auto_79975 ?auto_79976 ) ) ( not ( = ?auto_79975 ?auto_79977 ) ) ( not ( = ?auto_79975 ?auto_79978 ) ) ( not ( = ?auto_79976 ?auto_79977 ) ) ( not ( = ?auto_79976 ?auto_79978 ) ) ( not ( = ?auto_79977 ?auto_79978 ) ) ( ON ?auto_79977 ?auto_79978 ) ( ON ?auto_79976 ?auto_79977 ) ( ON ?auto_79975 ?auto_79976 ) ( ON ?auto_79974 ?auto_79975 ) ( CLEAR ?auto_79972 ) ( ON ?auto_79973 ?auto_79974 ) ( CLEAR ?auto_79973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79969 ?auto_79970 ?auto_79971 ?auto_79972 ?auto_79973 )
      ( MAKE-10PILE ?auto_79969 ?auto_79970 ?auto_79971 ?auto_79972 ?auto_79973 ?auto_79974 ?auto_79975 ?auto_79976 ?auto_79977 ?auto_79978 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_79989 - BLOCK
      ?auto_79990 - BLOCK
      ?auto_79991 - BLOCK
      ?auto_79992 - BLOCK
      ?auto_79993 - BLOCK
      ?auto_79994 - BLOCK
      ?auto_79995 - BLOCK
      ?auto_79996 - BLOCK
      ?auto_79997 - BLOCK
      ?auto_79998 - BLOCK
    )
    :vars
    (
      ?auto_79999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79998 ?auto_79999 ) ( ON-TABLE ?auto_79989 ) ( ON ?auto_79990 ?auto_79989 ) ( ON ?auto_79991 ?auto_79990 ) ( not ( = ?auto_79989 ?auto_79990 ) ) ( not ( = ?auto_79989 ?auto_79991 ) ) ( not ( = ?auto_79989 ?auto_79992 ) ) ( not ( = ?auto_79989 ?auto_79993 ) ) ( not ( = ?auto_79989 ?auto_79994 ) ) ( not ( = ?auto_79989 ?auto_79995 ) ) ( not ( = ?auto_79989 ?auto_79996 ) ) ( not ( = ?auto_79989 ?auto_79997 ) ) ( not ( = ?auto_79989 ?auto_79998 ) ) ( not ( = ?auto_79989 ?auto_79999 ) ) ( not ( = ?auto_79990 ?auto_79991 ) ) ( not ( = ?auto_79990 ?auto_79992 ) ) ( not ( = ?auto_79990 ?auto_79993 ) ) ( not ( = ?auto_79990 ?auto_79994 ) ) ( not ( = ?auto_79990 ?auto_79995 ) ) ( not ( = ?auto_79990 ?auto_79996 ) ) ( not ( = ?auto_79990 ?auto_79997 ) ) ( not ( = ?auto_79990 ?auto_79998 ) ) ( not ( = ?auto_79990 ?auto_79999 ) ) ( not ( = ?auto_79991 ?auto_79992 ) ) ( not ( = ?auto_79991 ?auto_79993 ) ) ( not ( = ?auto_79991 ?auto_79994 ) ) ( not ( = ?auto_79991 ?auto_79995 ) ) ( not ( = ?auto_79991 ?auto_79996 ) ) ( not ( = ?auto_79991 ?auto_79997 ) ) ( not ( = ?auto_79991 ?auto_79998 ) ) ( not ( = ?auto_79991 ?auto_79999 ) ) ( not ( = ?auto_79992 ?auto_79993 ) ) ( not ( = ?auto_79992 ?auto_79994 ) ) ( not ( = ?auto_79992 ?auto_79995 ) ) ( not ( = ?auto_79992 ?auto_79996 ) ) ( not ( = ?auto_79992 ?auto_79997 ) ) ( not ( = ?auto_79992 ?auto_79998 ) ) ( not ( = ?auto_79992 ?auto_79999 ) ) ( not ( = ?auto_79993 ?auto_79994 ) ) ( not ( = ?auto_79993 ?auto_79995 ) ) ( not ( = ?auto_79993 ?auto_79996 ) ) ( not ( = ?auto_79993 ?auto_79997 ) ) ( not ( = ?auto_79993 ?auto_79998 ) ) ( not ( = ?auto_79993 ?auto_79999 ) ) ( not ( = ?auto_79994 ?auto_79995 ) ) ( not ( = ?auto_79994 ?auto_79996 ) ) ( not ( = ?auto_79994 ?auto_79997 ) ) ( not ( = ?auto_79994 ?auto_79998 ) ) ( not ( = ?auto_79994 ?auto_79999 ) ) ( not ( = ?auto_79995 ?auto_79996 ) ) ( not ( = ?auto_79995 ?auto_79997 ) ) ( not ( = ?auto_79995 ?auto_79998 ) ) ( not ( = ?auto_79995 ?auto_79999 ) ) ( not ( = ?auto_79996 ?auto_79997 ) ) ( not ( = ?auto_79996 ?auto_79998 ) ) ( not ( = ?auto_79996 ?auto_79999 ) ) ( not ( = ?auto_79997 ?auto_79998 ) ) ( not ( = ?auto_79997 ?auto_79999 ) ) ( not ( = ?auto_79998 ?auto_79999 ) ) ( ON ?auto_79997 ?auto_79998 ) ( ON ?auto_79996 ?auto_79997 ) ( ON ?auto_79995 ?auto_79996 ) ( ON ?auto_79994 ?auto_79995 ) ( ON ?auto_79993 ?auto_79994 ) ( CLEAR ?auto_79991 ) ( ON ?auto_79992 ?auto_79993 ) ( CLEAR ?auto_79992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79989 ?auto_79990 ?auto_79991 ?auto_79992 )
      ( MAKE-10PILE ?auto_79989 ?auto_79990 ?auto_79991 ?auto_79992 ?auto_79993 ?auto_79994 ?auto_79995 ?auto_79996 ?auto_79997 ?auto_79998 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_80010 - BLOCK
      ?auto_80011 - BLOCK
      ?auto_80012 - BLOCK
      ?auto_80013 - BLOCK
      ?auto_80014 - BLOCK
      ?auto_80015 - BLOCK
      ?auto_80016 - BLOCK
      ?auto_80017 - BLOCK
      ?auto_80018 - BLOCK
      ?auto_80019 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80019 ) ( ON-TABLE ?auto_80010 ) ( ON ?auto_80011 ?auto_80010 ) ( ON ?auto_80012 ?auto_80011 ) ( not ( = ?auto_80010 ?auto_80011 ) ) ( not ( = ?auto_80010 ?auto_80012 ) ) ( not ( = ?auto_80010 ?auto_80013 ) ) ( not ( = ?auto_80010 ?auto_80014 ) ) ( not ( = ?auto_80010 ?auto_80015 ) ) ( not ( = ?auto_80010 ?auto_80016 ) ) ( not ( = ?auto_80010 ?auto_80017 ) ) ( not ( = ?auto_80010 ?auto_80018 ) ) ( not ( = ?auto_80010 ?auto_80019 ) ) ( not ( = ?auto_80011 ?auto_80012 ) ) ( not ( = ?auto_80011 ?auto_80013 ) ) ( not ( = ?auto_80011 ?auto_80014 ) ) ( not ( = ?auto_80011 ?auto_80015 ) ) ( not ( = ?auto_80011 ?auto_80016 ) ) ( not ( = ?auto_80011 ?auto_80017 ) ) ( not ( = ?auto_80011 ?auto_80018 ) ) ( not ( = ?auto_80011 ?auto_80019 ) ) ( not ( = ?auto_80012 ?auto_80013 ) ) ( not ( = ?auto_80012 ?auto_80014 ) ) ( not ( = ?auto_80012 ?auto_80015 ) ) ( not ( = ?auto_80012 ?auto_80016 ) ) ( not ( = ?auto_80012 ?auto_80017 ) ) ( not ( = ?auto_80012 ?auto_80018 ) ) ( not ( = ?auto_80012 ?auto_80019 ) ) ( not ( = ?auto_80013 ?auto_80014 ) ) ( not ( = ?auto_80013 ?auto_80015 ) ) ( not ( = ?auto_80013 ?auto_80016 ) ) ( not ( = ?auto_80013 ?auto_80017 ) ) ( not ( = ?auto_80013 ?auto_80018 ) ) ( not ( = ?auto_80013 ?auto_80019 ) ) ( not ( = ?auto_80014 ?auto_80015 ) ) ( not ( = ?auto_80014 ?auto_80016 ) ) ( not ( = ?auto_80014 ?auto_80017 ) ) ( not ( = ?auto_80014 ?auto_80018 ) ) ( not ( = ?auto_80014 ?auto_80019 ) ) ( not ( = ?auto_80015 ?auto_80016 ) ) ( not ( = ?auto_80015 ?auto_80017 ) ) ( not ( = ?auto_80015 ?auto_80018 ) ) ( not ( = ?auto_80015 ?auto_80019 ) ) ( not ( = ?auto_80016 ?auto_80017 ) ) ( not ( = ?auto_80016 ?auto_80018 ) ) ( not ( = ?auto_80016 ?auto_80019 ) ) ( not ( = ?auto_80017 ?auto_80018 ) ) ( not ( = ?auto_80017 ?auto_80019 ) ) ( not ( = ?auto_80018 ?auto_80019 ) ) ( ON ?auto_80018 ?auto_80019 ) ( ON ?auto_80017 ?auto_80018 ) ( ON ?auto_80016 ?auto_80017 ) ( ON ?auto_80015 ?auto_80016 ) ( ON ?auto_80014 ?auto_80015 ) ( CLEAR ?auto_80012 ) ( ON ?auto_80013 ?auto_80014 ) ( CLEAR ?auto_80013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80010 ?auto_80011 ?auto_80012 ?auto_80013 )
      ( MAKE-10PILE ?auto_80010 ?auto_80011 ?auto_80012 ?auto_80013 ?auto_80014 ?auto_80015 ?auto_80016 ?auto_80017 ?auto_80018 ?auto_80019 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_80030 - BLOCK
      ?auto_80031 - BLOCK
      ?auto_80032 - BLOCK
      ?auto_80033 - BLOCK
      ?auto_80034 - BLOCK
      ?auto_80035 - BLOCK
      ?auto_80036 - BLOCK
      ?auto_80037 - BLOCK
      ?auto_80038 - BLOCK
      ?auto_80039 - BLOCK
    )
    :vars
    (
      ?auto_80040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80039 ?auto_80040 ) ( ON-TABLE ?auto_80030 ) ( ON ?auto_80031 ?auto_80030 ) ( not ( = ?auto_80030 ?auto_80031 ) ) ( not ( = ?auto_80030 ?auto_80032 ) ) ( not ( = ?auto_80030 ?auto_80033 ) ) ( not ( = ?auto_80030 ?auto_80034 ) ) ( not ( = ?auto_80030 ?auto_80035 ) ) ( not ( = ?auto_80030 ?auto_80036 ) ) ( not ( = ?auto_80030 ?auto_80037 ) ) ( not ( = ?auto_80030 ?auto_80038 ) ) ( not ( = ?auto_80030 ?auto_80039 ) ) ( not ( = ?auto_80030 ?auto_80040 ) ) ( not ( = ?auto_80031 ?auto_80032 ) ) ( not ( = ?auto_80031 ?auto_80033 ) ) ( not ( = ?auto_80031 ?auto_80034 ) ) ( not ( = ?auto_80031 ?auto_80035 ) ) ( not ( = ?auto_80031 ?auto_80036 ) ) ( not ( = ?auto_80031 ?auto_80037 ) ) ( not ( = ?auto_80031 ?auto_80038 ) ) ( not ( = ?auto_80031 ?auto_80039 ) ) ( not ( = ?auto_80031 ?auto_80040 ) ) ( not ( = ?auto_80032 ?auto_80033 ) ) ( not ( = ?auto_80032 ?auto_80034 ) ) ( not ( = ?auto_80032 ?auto_80035 ) ) ( not ( = ?auto_80032 ?auto_80036 ) ) ( not ( = ?auto_80032 ?auto_80037 ) ) ( not ( = ?auto_80032 ?auto_80038 ) ) ( not ( = ?auto_80032 ?auto_80039 ) ) ( not ( = ?auto_80032 ?auto_80040 ) ) ( not ( = ?auto_80033 ?auto_80034 ) ) ( not ( = ?auto_80033 ?auto_80035 ) ) ( not ( = ?auto_80033 ?auto_80036 ) ) ( not ( = ?auto_80033 ?auto_80037 ) ) ( not ( = ?auto_80033 ?auto_80038 ) ) ( not ( = ?auto_80033 ?auto_80039 ) ) ( not ( = ?auto_80033 ?auto_80040 ) ) ( not ( = ?auto_80034 ?auto_80035 ) ) ( not ( = ?auto_80034 ?auto_80036 ) ) ( not ( = ?auto_80034 ?auto_80037 ) ) ( not ( = ?auto_80034 ?auto_80038 ) ) ( not ( = ?auto_80034 ?auto_80039 ) ) ( not ( = ?auto_80034 ?auto_80040 ) ) ( not ( = ?auto_80035 ?auto_80036 ) ) ( not ( = ?auto_80035 ?auto_80037 ) ) ( not ( = ?auto_80035 ?auto_80038 ) ) ( not ( = ?auto_80035 ?auto_80039 ) ) ( not ( = ?auto_80035 ?auto_80040 ) ) ( not ( = ?auto_80036 ?auto_80037 ) ) ( not ( = ?auto_80036 ?auto_80038 ) ) ( not ( = ?auto_80036 ?auto_80039 ) ) ( not ( = ?auto_80036 ?auto_80040 ) ) ( not ( = ?auto_80037 ?auto_80038 ) ) ( not ( = ?auto_80037 ?auto_80039 ) ) ( not ( = ?auto_80037 ?auto_80040 ) ) ( not ( = ?auto_80038 ?auto_80039 ) ) ( not ( = ?auto_80038 ?auto_80040 ) ) ( not ( = ?auto_80039 ?auto_80040 ) ) ( ON ?auto_80038 ?auto_80039 ) ( ON ?auto_80037 ?auto_80038 ) ( ON ?auto_80036 ?auto_80037 ) ( ON ?auto_80035 ?auto_80036 ) ( ON ?auto_80034 ?auto_80035 ) ( ON ?auto_80033 ?auto_80034 ) ( CLEAR ?auto_80031 ) ( ON ?auto_80032 ?auto_80033 ) ( CLEAR ?auto_80032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80030 ?auto_80031 ?auto_80032 )
      ( MAKE-10PILE ?auto_80030 ?auto_80031 ?auto_80032 ?auto_80033 ?auto_80034 ?auto_80035 ?auto_80036 ?auto_80037 ?auto_80038 ?auto_80039 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_80051 - BLOCK
      ?auto_80052 - BLOCK
      ?auto_80053 - BLOCK
      ?auto_80054 - BLOCK
      ?auto_80055 - BLOCK
      ?auto_80056 - BLOCK
      ?auto_80057 - BLOCK
      ?auto_80058 - BLOCK
      ?auto_80059 - BLOCK
      ?auto_80060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80060 ) ( ON-TABLE ?auto_80051 ) ( ON ?auto_80052 ?auto_80051 ) ( not ( = ?auto_80051 ?auto_80052 ) ) ( not ( = ?auto_80051 ?auto_80053 ) ) ( not ( = ?auto_80051 ?auto_80054 ) ) ( not ( = ?auto_80051 ?auto_80055 ) ) ( not ( = ?auto_80051 ?auto_80056 ) ) ( not ( = ?auto_80051 ?auto_80057 ) ) ( not ( = ?auto_80051 ?auto_80058 ) ) ( not ( = ?auto_80051 ?auto_80059 ) ) ( not ( = ?auto_80051 ?auto_80060 ) ) ( not ( = ?auto_80052 ?auto_80053 ) ) ( not ( = ?auto_80052 ?auto_80054 ) ) ( not ( = ?auto_80052 ?auto_80055 ) ) ( not ( = ?auto_80052 ?auto_80056 ) ) ( not ( = ?auto_80052 ?auto_80057 ) ) ( not ( = ?auto_80052 ?auto_80058 ) ) ( not ( = ?auto_80052 ?auto_80059 ) ) ( not ( = ?auto_80052 ?auto_80060 ) ) ( not ( = ?auto_80053 ?auto_80054 ) ) ( not ( = ?auto_80053 ?auto_80055 ) ) ( not ( = ?auto_80053 ?auto_80056 ) ) ( not ( = ?auto_80053 ?auto_80057 ) ) ( not ( = ?auto_80053 ?auto_80058 ) ) ( not ( = ?auto_80053 ?auto_80059 ) ) ( not ( = ?auto_80053 ?auto_80060 ) ) ( not ( = ?auto_80054 ?auto_80055 ) ) ( not ( = ?auto_80054 ?auto_80056 ) ) ( not ( = ?auto_80054 ?auto_80057 ) ) ( not ( = ?auto_80054 ?auto_80058 ) ) ( not ( = ?auto_80054 ?auto_80059 ) ) ( not ( = ?auto_80054 ?auto_80060 ) ) ( not ( = ?auto_80055 ?auto_80056 ) ) ( not ( = ?auto_80055 ?auto_80057 ) ) ( not ( = ?auto_80055 ?auto_80058 ) ) ( not ( = ?auto_80055 ?auto_80059 ) ) ( not ( = ?auto_80055 ?auto_80060 ) ) ( not ( = ?auto_80056 ?auto_80057 ) ) ( not ( = ?auto_80056 ?auto_80058 ) ) ( not ( = ?auto_80056 ?auto_80059 ) ) ( not ( = ?auto_80056 ?auto_80060 ) ) ( not ( = ?auto_80057 ?auto_80058 ) ) ( not ( = ?auto_80057 ?auto_80059 ) ) ( not ( = ?auto_80057 ?auto_80060 ) ) ( not ( = ?auto_80058 ?auto_80059 ) ) ( not ( = ?auto_80058 ?auto_80060 ) ) ( not ( = ?auto_80059 ?auto_80060 ) ) ( ON ?auto_80059 ?auto_80060 ) ( ON ?auto_80058 ?auto_80059 ) ( ON ?auto_80057 ?auto_80058 ) ( ON ?auto_80056 ?auto_80057 ) ( ON ?auto_80055 ?auto_80056 ) ( ON ?auto_80054 ?auto_80055 ) ( CLEAR ?auto_80052 ) ( ON ?auto_80053 ?auto_80054 ) ( CLEAR ?auto_80053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80051 ?auto_80052 ?auto_80053 )
      ( MAKE-10PILE ?auto_80051 ?auto_80052 ?auto_80053 ?auto_80054 ?auto_80055 ?auto_80056 ?auto_80057 ?auto_80058 ?auto_80059 ?auto_80060 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_80071 - BLOCK
      ?auto_80072 - BLOCK
      ?auto_80073 - BLOCK
      ?auto_80074 - BLOCK
      ?auto_80075 - BLOCK
      ?auto_80076 - BLOCK
      ?auto_80077 - BLOCK
      ?auto_80078 - BLOCK
      ?auto_80079 - BLOCK
      ?auto_80080 - BLOCK
    )
    :vars
    (
      ?auto_80081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80080 ?auto_80081 ) ( ON-TABLE ?auto_80071 ) ( not ( = ?auto_80071 ?auto_80072 ) ) ( not ( = ?auto_80071 ?auto_80073 ) ) ( not ( = ?auto_80071 ?auto_80074 ) ) ( not ( = ?auto_80071 ?auto_80075 ) ) ( not ( = ?auto_80071 ?auto_80076 ) ) ( not ( = ?auto_80071 ?auto_80077 ) ) ( not ( = ?auto_80071 ?auto_80078 ) ) ( not ( = ?auto_80071 ?auto_80079 ) ) ( not ( = ?auto_80071 ?auto_80080 ) ) ( not ( = ?auto_80071 ?auto_80081 ) ) ( not ( = ?auto_80072 ?auto_80073 ) ) ( not ( = ?auto_80072 ?auto_80074 ) ) ( not ( = ?auto_80072 ?auto_80075 ) ) ( not ( = ?auto_80072 ?auto_80076 ) ) ( not ( = ?auto_80072 ?auto_80077 ) ) ( not ( = ?auto_80072 ?auto_80078 ) ) ( not ( = ?auto_80072 ?auto_80079 ) ) ( not ( = ?auto_80072 ?auto_80080 ) ) ( not ( = ?auto_80072 ?auto_80081 ) ) ( not ( = ?auto_80073 ?auto_80074 ) ) ( not ( = ?auto_80073 ?auto_80075 ) ) ( not ( = ?auto_80073 ?auto_80076 ) ) ( not ( = ?auto_80073 ?auto_80077 ) ) ( not ( = ?auto_80073 ?auto_80078 ) ) ( not ( = ?auto_80073 ?auto_80079 ) ) ( not ( = ?auto_80073 ?auto_80080 ) ) ( not ( = ?auto_80073 ?auto_80081 ) ) ( not ( = ?auto_80074 ?auto_80075 ) ) ( not ( = ?auto_80074 ?auto_80076 ) ) ( not ( = ?auto_80074 ?auto_80077 ) ) ( not ( = ?auto_80074 ?auto_80078 ) ) ( not ( = ?auto_80074 ?auto_80079 ) ) ( not ( = ?auto_80074 ?auto_80080 ) ) ( not ( = ?auto_80074 ?auto_80081 ) ) ( not ( = ?auto_80075 ?auto_80076 ) ) ( not ( = ?auto_80075 ?auto_80077 ) ) ( not ( = ?auto_80075 ?auto_80078 ) ) ( not ( = ?auto_80075 ?auto_80079 ) ) ( not ( = ?auto_80075 ?auto_80080 ) ) ( not ( = ?auto_80075 ?auto_80081 ) ) ( not ( = ?auto_80076 ?auto_80077 ) ) ( not ( = ?auto_80076 ?auto_80078 ) ) ( not ( = ?auto_80076 ?auto_80079 ) ) ( not ( = ?auto_80076 ?auto_80080 ) ) ( not ( = ?auto_80076 ?auto_80081 ) ) ( not ( = ?auto_80077 ?auto_80078 ) ) ( not ( = ?auto_80077 ?auto_80079 ) ) ( not ( = ?auto_80077 ?auto_80080 ) ) ( not ( = ?auto_80077 ?auto_80081 ) ) ( not ( = ?auto_80078 ?auto_80079 ) ) ( not ( = ?auto_80078 ?auto_80080 ) ) ( not ( = ?auto_80078 ?auto_80081 ) ) ( not ( = ?auto_80079 ?auto_80080 ) ) ( not ( = ?auto_80079 ?auto_80081 ) ) ( not ( = ?auto_80080 ?auto_80081 ) ) ( ON ?auto_80079 ?auto_80080 ) ( ON ?auto_80078 ?auto_80079 ) ( ON ?auto_80077 ?auto_80078 ) ( ON ?auto_80076 ?auto_80077 ) ( ON ?auto_80075 ?auto_80076 ) ( ON ?auto_80074 ?auto_80075 ) ( ON ?auto_80073 ?auto_80074 ) ( CLEAR ?auto_80071 ) ( ON ?auto_80072 ?auto_80073 ) ( CLEAR ?auto_80072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80071 ?auto_80072 )
      ( MAKE-10PILE ?auto_80071 ?auto_80072 ?auto_80073 ?auto_80074 ?auto_80075 ?auto_80076 ?auto_80077 ?auto_80078 ?auto_80079 ?auto_80080 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_80092 - BLOCK
      ?auto_80093 - BLOCK
      ?auto_80094 - BLOCK
      ?auto_80095 - BLOCK
      ?auto_80096 - BLOCK
      ?auto_80097 - BLOCK
      ?auto_80098 - BLOCK
      ?auto_80099 - BLOCK
      ?auto_80100 - BLOCK
      ?auto_80101 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80101 ) ( ON-TABLE ?auto_80092 ) ( not ( = ?auto_80092 ?auto_80093 ) ) ( not ( = ?auto_80092 ?auto_80094 ) ) ( not ( = ?auto_80092 ?auto_80095 ) ) ( not ( = ?auto_80092 ?auto_80096 ) ) ( not ( = ?auto_80092 ?auto_80097 ) ) ( not ( = ?auto_80092 ?auto_80098 ) ) ( not ( = ?auto_80092 ?auto_80099 ) ) ( not ( = ?auto_80092 ?auto_80100 ) ) ( not ( = ?auto_80092 ?auto_80101 ) ) ( not ( = ?auto_80093 ?auto_80094 ) ) ( not ( = ?auto_80093 ?auto_80095 ) ) ( not ( = ?auto_80093 ?auto_80096 ) ) ( not ( = ?auto_80093 ?auto_80097 ) ) ( not ( = ?auto_80093 ?auto_80098 ) ) ( not ( = ?auto_80093 ?auto_80099 ) ) ( not ( = ?auto_80093 ?auto_80100 ) ) ( not ( = ?auto_80093 ?auto_80101 ) ) ( not ( = ?auto_80094 ?auto_80095 ) ) ( not ( = ?auto_80094 ?auto_80096 ) ) ( not ( = ?auto_80094 ?auto_80097 ) ) ( not ( = ?auto_80094 ?auto_80098 ) ) ( not ( = ?auto_80094 ?auto_80099 ) ) ( not ( = ?auto_80094 ?auto_80100 ) ) ( not ( = ?auto_80094 ?auto_80101 ) ) ( not ( = ?auto_80095 ?auto_80096 ) ) ( not ( = ?auto_80095 ?auto_80097 ) ) ( not ( = ?auto_80095 ?auto_80098 ) ) ( not ( = ?auto_80095 ?auto_80099 ) ) ( not ( = ?auto_80095 ?auto_80100 ) ) ( not ( = ?auto_80095 ?auto_80101 ) ) ( not ( = ?auto_80096 ?auto_80097 ) ) ( not ( = ?auto_80096 ?auto_80098 ) ) ( not ( = ?auto_80096 ?auto_80099 ) ) ( not ( = ?auto_80096 ?auto_80100 ) ) ( not ( = ?auto_80096 ?auto_80101 ) ) ( not ( = ?auto_80097 ?auto_80098 ) ) ( not ( = ?auto_80097 ?auto_80099 ) ) ( not ( = ?auto_80097 ?auto_80100 ) ) ( not ( = ?auto_80097 ?auto_80101 ) ) ( not ( = ?auto_80098 ?auto_80099 ) ) ( not ( = ?auto_80098 ?auto_80100 ) ) ( not ( = ?auto_80098 ?auto_80101 ) ) ( not ( = ?auto_80099 ?auto_80100 ) ) ( not ( = ?auto_80099 ?auto_80101 ) ) ( not ( = ?auto_80100 ?auto_80101 ) ) ( ON ?auto_80100 ?auto_80101 ) ( ON ?auto_80099 ?auto_80100 ) ( ON ?auto_80098 ?auto_80099 ) ( ON ?auto_80097 ?auto_80098 ) ( ON ?auto_80096 ?auto_80097 ) ( ON ?auto_80095 ?auto_80096 ) ( ON ?auto_80094 ?auto_80095 ) ( CLEAR ?auto_80092 ) ( ON ?auto_80093 ?auto_80094 ) ( CLEAR ?auto_80093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80092 ?auto_80093 )
      ( MAKE-10PILE ?auto_80092 ?auto_80093 ?auto_80094 ?auto_80095 ?auto_80096 ?auto_80097 ?auto_80098 ?auto_80099 ?auto_80100 ?auto_80101 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_80112 - BLOCK
      ?auto_80113 - BLOCK
      ?auto_80114 - BLOCK
      ?auto_80115 - BLOCK
      ?auto_80116 - BLOCK
      ?auto_80117 - BLOCK
      ?auto_80118 - BLOCK
      ?auto_80119 - BLOCK
      ?auto_80120 - BLOCK
      ?auto_80121 - BLOCK
    )
    :vars
    (
      ?auto_80122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80121 ?auto_80122 ) ( not ( = ?auto_80112 ?auto_80113 ) ) ( not ( = ?auto_80112 ?auto_80114 ) ) ( not ( = ?auto_80112 ?auto_80115 ) ) ( not ( = ?auto_80112 ?auto_80116 ) ) ( not ( = ?auto_80112 ?auto_80117 ) ) ( not ( = ?auto_80112 ?auto_80118 ) ) ( not ( = ?auto_80112 ?auto_80119 ) ) ( not ( = ?auto_80112 ?auto_80120 ) ) ( not ( = ?auto_80112 ?auto_80121 ) ) ( not ( = ?auto_80112 ?auto_80122 ) ) ( not ( = ?auto_80113 ?auto_80114 ) ) ( not ( = ?auto_80113 ?auto_80115 ) ) ( not ( = ?auto_80113 ?auto_80116 ) ) ( not ( = ?auto_80113 ?auto_80117 ) ) ( not ( = ?auto_80113 ?auto_80118 ) ) ( not ( = ?auto_80113 ?auto_80119 ) ) ( not ( = ?auto_80113 ?auto_80120 ) ) ( not ( = ?auto_80113 ?auto_80121 ) ) ( not ( = ?auto_80113 ?auto_80122 ) ) ( not ( = ?auto_80114 ?auto_80115 ) ) ( not ( = ?auto_80114 ?auto_80116 ) ) ( not ( = ?auto_80114 ?auto_80117 ) ) ( not ( = ?auto_80114 ?auto_80118 ) ) ( not ( = ?auto_80114 ?auto_80119 ) ) ( not ( = ?auto_80114 ?auto_80120 ) ) ( not ( = ?auto_80114 ?auto_80121 ) ) ( not ( = ?auto_80114 ?auto_80122 ) ) ( not ( = ?auto_80115 ?auto_80116 ) ) ( not ( = ?auto_80115 ?auto_80117 ) ) ( not ( = ?auto_80115 ?auto_80118 ) ) ( not ( = ?auto_80115 ?auto_80119 ) ) ( not ( = ?auto_80115 ?auto_80120 ) ) ( not ( = ?auto_80115 ?auto_80121 ) ) ( not ( = ?auto_80115 ?auto_80122 ) ) ( not ( = ?auto_80116 ?auto_80117 ) ) ( not ( = ?auto_80116 ?auto_80118 ) ) ( not ( = ?auto_80116 ?auto_80119 ) ) ( not ( = ?auto_80116 ?auto_80120 ) ) ( not ( = ?auto_80116 ?auto_80121 ) ) ( not ( = ?auto_80116 ?auto_80122 ) ) ( not ( = ?auto_80117 ?auto_80118 ) ) ( not ( = ?auto_80117 ?auto_80119 ) ) ( not ( = ?auto_80117 ?auto_80120 ) ) ( not ( = ?auto_80117 ?auto_80121 ) ) ( not ( = ?auto_80117 ?auto_80122 ) ) ( not ( = ?auto_80118 ?auto_80119 ) ) ( not ( = ?auto_80118 ?auto_80120 ) ) ( not ( = ?auto_80118 ?auto_80121 ) ) ( not ( = ?auto_80118 ?auto_80122 ) ) ( not ( = ?auto_80119 ?auto_80120 ) ) ( not ( = ?auto_80119 ?auto_80121 ) ) ( not ( = ?auto_80119 ?auto_80122 ) ) ( not ( = ?auto_80120 ?auto_80121 ) ) ( not ( = ?auto_80120 ?auto_80122 ) ) ( not ( = ?auto_80121 ?auto_80122 ) ) ( ON ?auto_80120 ?auto_80121 ) ( ON ?auto_80119 ?auto_80120 ) ( ON ?auto_80118 ?auto_80119 ) ( ON ?auto_80117 ?auto_80118 ) ( ON ?auto_80116 ?auto_80117 ) ( ON ?auto_80115 ?auto_80116 ) ( ON ?auto_80114 ?auto_80115 ) ( ON ?auto_80113 ?auto_80114 ) ( ON ?auto_80112 ?auto_80113 ) ( CLEAR ?auto_80112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80112 )
      ( MAKE-10PILE ?auto_80112 ?auto_80113 ?auto_80114 ?auto_80115 ?auto_80116 ?auto_80117 ?auto_80118 ?auto_80119 ?auto_80120 ?auto_80121 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_80133 - BLOCK
      ?auto_80134 - BLOCK
      ?auto_80135 - BLOCK
      ?auto_80136 - BLOCK
      ?auto_80137 - BLOCK
      ?auto_80138 - BLOCK
      ?auto_80139 - BLOCK
      ?auto_80140 - BLOCK
      ?auto_80141 - BLOCK
      ?auto_80142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80142 ) ( not ( = ?auto_80133 ?auto_80134 ) ) ( not ( = ?auto_80133 ?auto_80135 ) ) ( not ( = ?auto_80133 ?auto_80136 ) ) ( not ( = ?auto_80133 ?auto_80137 ) ) ( not ( = ?auto_80133 ?auto_80138 ) ) ( not ( = ?auto_80133 ?auto_80139 ) ) ( not ( = ?auto_80133 ?auto_80140 ) ) ( not ( = ?auto_80133 ?auto_80141 ) ) ( not ( = ?auto_80133 ?auto_80142 ) ) ( not ( = ?auto_80134 ?auto_80135 ) ) ( not ( = ?auto_80134 ?auto_80136 ) ) ( not ( = ?auto_80134 ?auto_80137 ) ) ( not ( = ?auto_80134 ?auto_80138 ) ) ( not ( = ?auto_80134 ?auto_80139 ) ) ( not ( = ?auto_80134 ?auto_80140 ) ) ( not ( = ?auto_80134 ?auto_80141 ) ) ( not ( = ?auto_80134 ?auto_80142 ) ) ( not ( = ?auto_80135 ?auto_80136 ) ) ( not ( = ?auto_80135 ?auto_80137 ) ) ( not ( = ?auto_80135 ?auto_80138 ) ) ( not ( = ?auto_80135 ?auto_80139 ) ) ( not ( = ?auto_80135 ?auto_80140 ) ) ( not ( = ?auto_80135 ?auto_80141 ) ) ( not ( = ?auto_80135 ?auto_80142 ) ) ( not ( = ?auto_80136 ?auto_80137 ) ) ( not ( = ?auto_80136 ?auto_80138 ) ) ( not ( = ?auto_80136 ?auto_80139 ) ) ( not ( = ?auto_80136 ?auto_80140 ) ) ( not ( = ?auto_80136 ?auto_80141 ) ) ( not ( = ?auto_80136 ?auto_80142 ) ) ( not ( = ?auto_80137 ?auto_80138 ) ) ( not ( = ?auto_80137 ?auto_80139 ) ) ( not ( = ?auto_80137 ?auto_80140 ) ) ( not ( = ?auto_80137 ?auto_80141 ) ) ( not ( = ?auto_80137 ?auto_80142 ) ) ( not ( = ?auto_80138 ?auto_80139 ) ) ( not ( = ?auto_80138 ?auto_80140 ) ) ( not ( = ?auto_80138 ?auto_80141 ) ) ( not ( = ?auto_80138 ?auto_80142 ) ) ( not ( = ?auto_80139 ?auto_80140 ) ) ( not ( = ?auto_80139 ?auto_80141 ) ) ( not ( = ?auto_80139 ?auto_80142 ) ) ( not ( = ?auto_80140 ?auto_80141 ) ) ( not ( = ?auto_80140 ?auto_80142 ) ) ( not ( = ?auto_80141 ?auto_80142 ) ) ( ON ?auto_80141 ?auto_80142 ) ( ON ?auto_80140 ?auto_80141 ) ( ON ?auto_80139 ?auto_80140 ) ( ON ?auto_80138 ?auto_80139 ) ( ON ?auto_80137 ?auto_80138 ) ( ON ?auto_80136 ?auto_80137 ) ( ON ?auto_80135 ?auto_80136 ) ( ON ?auto_80134 ?auto_80135 ) ( ON ?auto_80133 ?auto_80134 ) ( CLEAR ?auto_80133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80133 )
      ( MAKE-10PILE ?auto_80133 ?auto_80134 ?auto_80135 ?auto_80136 ?auto_80137 ?auto_80138 ?auto_80139 ?auto_80140 ?auto_80141 ?auto_80142 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_80153 - BLOCK
      ?auto_80154 - BLOCK
      ?auto_80155 - BLOCK
      ?auto_80156 - BLOCK
      ?auto_80157 - BLOCK
      ?auto_80158 - BLOCK
      ?auto_80159 - BLOCK
      ?auto_80160 - BLOCK
      ?auto_80161 - BLOCK
      ?auto_80162 - BLOCK
    )
    :vars
    (
      ?auto_80163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80153 ?auto_80154 ) ) ( not ( = ?auto_80153 ?auto_80155 ) ) ( not ( = ?auto_80153 ?auto_80156 ) ) ( not ( = ?auto_80153 ?auto_80157 ) ) ( not ( = ?auto_80153 ?auto_80158 ) ) ( not ( = ?auto_80153 ?auto_80159 ) ) ( not ( = ?auto_80153 ?auto_80160 ) ) ( not ( = ?auto_80153 ?auto_80161 ) ) ( not ( = ?auto_80153 ?auto_80162 ) ) ( not ( = ?auto_80154 ?auto_80155 ) ) ( not ( = ?auto_80154 ?auto_80156 ) ) ( not ( = ?auto_80154 ?auto_80157 ) ) ( not ( = ?auto_80154 ?auto_80158 ) ) ( not ( = ?auto_80154 ?auto_80159 ) ) ( not ( = ?auto_80154 ?auto_80160 ) ) ( not ( = ?auto_80154 ?auto_80161 ) ) ( not ( = ?auto_80154 ?auto_80162 ) ) ( not ( = ?auto_80155 ?auto_80156 ) ) ( not ( = ?auto_80155 ?auto_80157 ) ) ( not ( = ?auto_80155 ?auto_80158 ) ) ( not ( = ?auto_80155 ?auto_80159 ) ) ( not ( = ?auto_80155 ?auto_80160 ) ) ( not ( = ?auto_80155 ?auto_80161 ) ) ( not ( = ?auto_80155 ?auto_80162 ) ) ( not ( = ?auto_80156 ?auto_80157 ) ) ( not ( = ?auto_80156 ?auto_80158 ) ) ( not ( = ?auto_80156 ?auto_80159 ) ) ( not ( = ?auto_80156 ?auto_80160 ) ) ( not ( = ?auto_80156 ?auto_80161 ) ) ( not ( = ?auto_80156 ?auto_80162 ) ) ( not ( = ?auto_80157 ?auto_80158 ) ) ( not ( = ?auto_80157 ?auto_80159 ) ) ( not ( = ?auto_80157 ?auto_80160 ) ) ( not ( = ?auto_80157 ?auto_80161 ) ) ( not ( = ?auto_80157 ?auto_80162 ) ) ( not ( = ?auto_80158 ?auto_80159 ) ) ( not ( = ?auto_80158 ?auto_80160 ) ) ( not ( = ?auto_80158 ?auto_80161 ) ) ( not ( = ?auto_80158 ?auto_80162 ) ) ( not ( = ?auto_80159 ?auto_80160 ) ) ( not ( = ?auto_80159 ?auto_80161 ) ) ( not ( = ?auto_80159 ?auto_80162 ) ) ( not ( = ?auto_80160 ?auto_80161 ) ) ( not ( = ?auto_80160 ?auto_80162 ) ) ( not ( = ?auto_80161 ?auto_80162 ) ) ( ON ?auto_80153 ?auto_80163 ) ( not ( = ?auto_80162 ?auto_80163 ) ) ( not ( = ?auto_80161 ?auto_80163 ) ) ( not ( = ?auto_80160 ?auto_80163 ) ) ( not ( = ?auto_80159 ?auto_80163 ) ) ( not ( = ?auto_80158 ?auto_80163 ) ) ( not ( = ?auto_80157 ?auto_80163 ) ) ( not ( = ?auto_80156 ?auto_80163 ) ) ( not ( = ?auto_80155 ?auto_80163 ) ) ( not ( = ?auto_80154 ?auto_80163 ) ) ( not ( = ?auto_80153 ?auto_80163 ) ) ( ON ?auto_80154 ?auto_80153 ) ( ON ?auto_80155 ?auto_80154 ) ( ON ?auto_80156 ?auto_80155 ) ( ON ?auto_80157 ?auto_80156 ) ( ON ?auto_80158 ?auto_80157 ) ( ON ?auto_80159 ?auto_80158 ) ( ON ?auto_80160 ?auto_80159 ) ( ON ?auto_80161 ?auto_80160 ) ( ON ?auto_80162 ?auto_80161 ) ( CLEAR ?auto_80162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_80162 ?auto_80161 ?auto_80160 ?auto_80159 ?auto_80158 ?auto_80157 ?auto_80156 ?auto_80155 ?auto_80154 ?auto_80153 )
      ( MAKE-10PILE ?auto_80153 ?auto_80154 ?auto_80155 ?auto_80156 ?auto_80157 ?auto_80158 ?auto_80159 ?auto_80160 ?auto_80161 ?auto_80162 ) )
  )

)
