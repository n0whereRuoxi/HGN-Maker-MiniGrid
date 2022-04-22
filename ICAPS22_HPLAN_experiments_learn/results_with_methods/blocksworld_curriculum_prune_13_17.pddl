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
      ?auto_264505 - BLOCK
    )
    :vars
    (
      ?auto_264506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264505 ?auto_264506 ) ( CLEAR ?auto_264505 ) ( HAND-EMPTY ) ( not ( = ?auto_264505 ?auto_264506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264505 ?auto_264506 )
      ( !PUTDOWN ?auto_264505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_264512 - BLOCK
      ?auto_264513 - BLOCK
    )
    :vars
    (
      ?auto_264514 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264512 ) ( ON ?auto_264513 ?auto_264514 ) ( CLEAR ?auto_264513 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264512 ) ( not ( = ?auto_264512 ?auto_264513 ) ) ( not ( = ?auto_264512 ?auto_264514 ) ) ( not ( = ?auto_264513 ?auto_264514 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264513 ?auto_264514 )
      ( !STACK ?auto_264513 ?auto_264512 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_264522 - BLOCK
      ?auto_264523 - BLOCK
    )
    :vars
    (
      ?auto_264524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264523 ?auto_264524 ) ( not ( = ?auto_264522 ?auto_264523 ) ) ( not ( = ?auto_264522 ?auto_264524 ) ) ( not ( = ?auto_264523 ?auto_264524 ) ) ( ON ?auto_264522 ?auto_264523 ) ( CLEAR ?auto_264522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264522 )
      ( MAKE-2PILE ?auto_264522 ?auto_264523 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_264533 - BLOCK
      ?auto_264534 - BLOCK
      ?auto_264535 - BLOCK
    )
    :vars
    (
      ?auto_264536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264534 ) ( ON ?auto_264535 ?auto_264536 ) ( CLEAR ?auto_264535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264533 ) ( ON ?auto_264534 ?auto_264533 ) ( not ( = ?auto_264533 ?auto_264534 ) ) ( not ( = ?auto_264533 ?auto_264535 ) ) ( not ( = ?auto_264533 ?auto_264536 ) ) ( not ( = ?auto_264534 ?auto_264535 ) ) ( not ( = ?auto_264534 ?auto_264536 ) ) ( not ( = ?auto_264535 ?auto_264536 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264535 ?auto_264536 )
      ( !STACK ?auto_264535 ?auto_264534 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_264547 - BLOCK
      ?auto_264548 - BLOCK
      ?auto_264549 - BLOCK
    )
    :vars
    (
      ?auto_264550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264549 ?auto_264550 ) ( ON-TABLE ?auto_264547 ) ( not ( = ?auto_264547 ?auto_264548 ) ) ( not ( = ?auto_264547 ?auto_264549 ) ) ( not ( = ?auto_264547 ?auto_264550 ) ) ( not ( = ?auto_264548 ?auto_264549 ) ) ( not ( = ?auto_264548 ?auto_264550 ) ) ( not ( = ?auto_264549 ?auto_264550 ) ) ( CLEAR ?auto_264547 ) ( ON ?auto_264548 ?auto_264549 ) ( CLEAR ?auto_264548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_264547 ?auto_264548 )
      ( MAKE-3PILE ?auto_264547 ?auto_264548 ?auto_264549 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_264561 - BLOCK
      ?auto_264562 - BLOCK
      ?auto_264563 - BLOCK
    )
    :vars
    (
      ?auto_264564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264563 ?auto_264564 ) ( not ( = ?auto_264561 ?auto_264562 ) ) ( not ( = ?auto_264561 ?auto_264563 ) ) ( not ( = ?auto_264561 ?auto_264564 ) ) ( not ( = ?auto_264562 ?auto_264563 ) ) ( not ( = ?auto_264562 ?auto_264564 ) ) ( not ( = ?auto_264563 ?auto_264564 ) ) ( ON ?auto_264562 ?auto_264563 ) ( ON ?auto_264561 ?auto_264562 ) ( CLEAR ?auto_264561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264561 )
      ( MAKE-3PILE ?auto_264561 ?auto_264562 ?auto_264563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_264576 - BLOCK
      ?auto_264577 - BLOCK
      ?auto_264578 - BLOCK
      ?auto_264579 - BLOCK
    )
    :vars
    (
      ?auto_264580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264578 ) ( ON ?auto_264579 ?auto_264580 ) ( CLEAR ?auto_264579 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264576 ) ( ON ?auto_264577 ?auto_264576 ) ( ON ?auto_264578 ?auto_264577 ) ( not ( = ?auto_264576 ?auto_264577 ) ) ( not ( = ?auto_264576 ?auto_264578 ) ) ( not ( = ?auto_264576 ?auto_264579 ) ) ( not ( = ?auto_264576 ?auto_264580 ) ) ( not ( = ?auto_264577 ?auto_264578 ) ) ( not ( = ?auto_264577 ?auto_264579 ) ) ( not ( = ?auto_264577 ?auto_264580 ) ) ( not ( = ?auto_264578 ?auto_264579 ) ) ( not ( = ?auto_264578 ?auto_264580 ) ) ( not ( = ?auto_264579 ?auto_264580 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264579 ?auto_264580 )
      ( !STACK ?auto_264579 ?auto_264578 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_264594 - BLOCK
      ?auto_264595 - BLOCK
      ?auto_264596 - BLOCK
      ?auto_264597 - BLOCK
    )
    :vars
    (
      ?auto_264598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264597 ?auto_264598 ) ( ON-TABLE ?auto_264594 ) ( ON ?auto_264595 ?auto_264594 ) ( not ( = ?auto_264594 ?auto_264595 ) ) ( not ( = ?auto_264594 ?auto_264596 ) ) ( not ( = ?auto_264594 ?auto_264597 ) ) ( not ( = ?auto_264594 ?auto_264598 ) ) ( not ( = ?auto_264595 ?auto_264596 ) ) ( not ( = ?auto_264595 ?auto_264597 ) ) ( not ( = ?auto_264595 ?auto_264598 ) ) ( not ( = ?auto_264596 ?auto_264597 ) ) ( not ( = ?auto_264596 ?auto_264598 ) ) ( not ( = ?auto_264597 ?auto_264598 ) ) ( CLEAR ?auto_264595 ) ( ON ?auto_264596 ?auto_264597 ) ( CLEAR ?auto_264596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_264594 ?auto_264595 ?auto_264596 )
      ( MAKE-4PILE ?auto_264594 ?auto_264595 ?auto_264596 ?auto_264597 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_264612 - BLOCK
      ?auto_264613 - BLOCK
      ?auto_264614 - BLOCK
      ?auto_264615 - BLOCK
    )
    :vars
    (
      ?auto_264616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264615 ?auto_264616 ) ( ON-TABLE ?auto_264612 ) ( not ( = ?auto_264612 ?auto_264613 ) ) ( not ( = ?auto_264612 ?auto_264614 ) ) ( not ( = ?auto_264612 ?auto_264615 ) ) ( not ( = ?auto_264612 ?auto_264616 ) ) ( not ( = ?auto_264613 ?auto_264614 ) ) ( not ( = ?auto_264613 ?auto_264615 ) ) ( not ( = ?auto_264613 ?auto_264616 ) ) ( not ( = ?auto_264614 ?auto_264615 ) ) ( not ( = ?auto_264614 ?auto_264616 ) ) ( not ( = ?auto_264615 ?auto_264616 ) ) ( ON ?auto_264614 ?auto_264615 ) ( CLEAR ?auto_264612 ) ( ON ?auto_264613 ?auto_264614 ) ( CLEAR ?auto_264613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_264612 ?auto_264613 )
      ( MAKE-4PILE ?auto_264612 ?auto_264613 ?auto_264614 ?auto_264615 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_264630 - BLOCK
      ?auto_264631 - BLOCK
      ?auto_264632 - BLOCK
      ?auto_264633 - BLOCK
    )
    :vars
    (
      ?auto_264634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264633 ?auto_264634 ) ( not ( = ?auto_264630 ?auto_264631 ) ) ( not ( = ?auto_264630 ?auto_264632 ) ) ( not ( = ?auto_264630 ?auto_264633 ) ) ( not ( = ?auto_264630 ?auto_264634 ) ) ( not ( = ?auto_264631 ?auto_264632 ) ) ( not ( = ?auto_264631 ?auto_264633 ) ) ( not ( = ?auto_264631 ?auto_264634 ) ) ( not ( = ?auto_264632 ?auto_264633 ) ) ( not ( = ?auto_264632 ?auto_264634 ) ) ( not ( = ?auto_264633 ?auto_264634 ) ) ( ON ?auto_264632 ?auto_264633 ) ( ON ?auto_264631 ?auto_264632 ) ( ON ?auto_264630 ?auto_264631 ) ( CLEAR ?auto_264630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264630 )
      ( MAKE-4PILE ?auto_264630 ?auto_264631 ?auto_264632 ?auto_264633 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264649 - BLOCK
      ?auto_264650 - BLOCK
      ?auto_264651 - BLOCK
      ?auto_264652 - BLOCK
      ?auto_264653 - BLOCK
    )
    :vars
    (
      ?auto_264654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264652 ) ( ON ?auto_264653 ?auto_264654 ) ( CLEAR ?auto_264653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264649 ) ( ON ?auto_264650 ?auto_264649 ) ( ON ?auto_264651 ?auto_264650 ) ( ON ?auto_264652 ?auto_264651 ) ( not ( = ?auto_264649 ?auto_264650 ) ) ( not ( = ?auto_264649 ?auto_264651 ) ) ( not ( = ?auto_264649 ?auto_264652 ) ) ( not ( = ?auto_264649 ?auto_264653 ) ) ( not ( = ?auto_264649 ?auto_264654 ) ) ( not ( = ?auto_264650 ?auto_264651 ) ) ( not ( = ?auto_264650 ?auto_264652 ) ) ( not ( = ?auto_264650 ?auto_264653 ) ) ( not ( = ?auto_264650 ?auto_264654 ) ) ( not ( = ?auto_264651 ?auto_264652 ) ) ( not ( = ?auto_264651 ?auto_264653 ) ) ( not ( = ?auto_264651 ?auto_264654 ) ) ( not ( = ?auto_264652 ?auto_264653 ) ) ( not ( = ?auto_264652 ?auto_264654 ) ) ( not ( = ?auto_264653 ?auto_264654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264653 ?auto_264654 )
      ( !STACK ?auto_264653 ?auto_264652 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264671 - BLOCK
      ?auto_264672 - BLOCK
      ?auto_264673 - BLOCK
      ?auto_264674 - BLOCK
      ?auto_264675 - BLOCK
    )
    :vars
    (
      ?auto_264676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264675 ?auto_264676 ) ( ON-TABLE ?auto_264671 ) ( ON ?auto_264672 ?auto_264671 ) ( ON ?auto_264673 ?auto_264672 ) ( not ( = ?auto_264671 ?auto_264672 ) ) ( not ( = ?auto_264671 ?auto_264673 ) ) ( not ( = ?auto_264671 ?auto_264674 ) ) ( not ( = ?auto_264671 ?auto_264675 ) ) ( not ( = ?auto_264671 ?auto_264676 ) ) ( not ( = ?auto_264672 ?auto_264673 ) ) ( not ( = ?auto_264672 ?auto_264674 ) ) ( not ( = ?auto_264672 ?auto_264675 ) ) ( not ( = ?auto_264672 ?auto_264676 ) ) ( not ( = ?auto_264673 ?auto_264674 ) ) ( not ( = ?auto_264673 ?auto_264675 ) ) ( not ( = ?auto_264673 ?auto_264676 ) ) ( not ( = ?auto_264674 ?auto_264675 ) ) ( not ( = ?auto_264674 ?auto_264676 ) ) ( not ( = ?auto_264675 ?auto_264676 ) ) ( CLEAR ?auto_264673 ) ( ON ?auto_264674 ?auto_264675 ) ( CLEAR ?auto_264674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_264671 ?auto_264672 ?auto_264673 ?auto_264674 )
      ( MAKE-5PILE ?auto_264671 ?auto_264672 ?auto_264673 ?auto_264674 ?auto_264675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264693 - BLOCK
      ?auto_264694 - BLOCK
      ?auto_264695 - BLOCK
      ?auto_264696 - BLOCK
      ?auto_264697 - BLOCK
    )
    :vars
    (
      ?auto_264698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264697 ?auto_264698 ) ( ON-TABLE ?auto_264693 ) ( ON ?auto_264694 ?auto_264693 ) ( not ( = ?auto_264693 ?auto_264694 ) ) ( not ( = ?auto_264693 ?auto_264695 ) ) ( not ( = ?auto_264693 ?auto_264696 ) ) ( not ( = ?auto_264693 ?auto_264697 ) ) ( not ( = ?auto_264693 ?auto_264698 ) ) ( not ( = ?auto_264694 ?auto_264695 ) ) ( not ( = ?auto_264694 ?auto_264696 ) ) ( not ( = ?auto_264694 ?auto_264697 ) ) ( not ( = ?auto_264694 ?auto_264698 ) ) ( not ( = ?auto_264695 ?auto_264696 ) ) ( not ( = ?auto_264695 ?auto_264697 ) ) ( not ( = ?auto_264695 ?auto_264698 ) ) ( not ( = ?auto_264696 ?auto_264697 ) ) ( not ( = ?auto_264696 ?auto_264698 ) ) ( not ( = ?auto_264697 ?auto_264698 ) ) ( ON ?auto_264696 ?auto_264697 ) ( CLEAR ?auto_264694 ) ( ON ?auto_264695 ?auto_264696 ) ( CLEAR ?auto_264695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_264693 ?auto_264694 ?auto_264695 )
      ( MAKE-5PILE ?auto_264693 ?auto_264694 ?auto_264695 ?auto_264696 ?auto_264697 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264715 - BLOCK
      ?auto_264716 - BLOCK
      ?auto_264717 - BLOCK
      ?auto_264718 - BLOCK
      ?auto_264719 - BLOCK
    )
    :vars
    (
      ?auto_264720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264719 ?auto_264720 ) ( ON-TABLE ?auto_264715 ) ( not ( = ?auto_264715 ?auto_264716 ) ) ( not ( = ?auto_264715 ?auto_264717 ) ) ( not ( = ?auto_264715 ?auto_264718 ) ) ( not ( = ?auto_264715 ?auto_264719 ) ) ( not ( = ?auto_264715 ?auto_264720 ) ) ( not ( = ?auto_264716 ?auto_264717 ) ) ( not ( = ?auto_264716 ?auto_264718 ) ) ( not ( = ?auto_264716 ?auto_264719 ) ) ( not ( = ?auto_264716 ?auto_264720 ) ) ( not ( = ?auto_264717 ?auto_264718 ) ) ( not ( = ?auto_264717 ?auto_264719 ) ) ( not ( = ?auto_264717 ?auto_264720 ) ) ( not ( = ?auto_264718 ?auto_264719 ) ) ( not ( = ?auto_264718 ?auto_264720 ) ) ( not ( = ?auto_264719 ?auto_264720 ) ) ( ON ?auto_264718 ?auto_264719 ) ( ON ?auto_264717 ?auto_264718 ) ( CLEAR ?auto_264715 ) ( ON ?auto_264716 ?auto_264717 ) ( CLEAR ?auto_264716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_264715 ?auto_264716 )
      ( MAKE-5PILE ?auto_264715 ?auto_264716 ?auto_264717 ?auto_264718 ?auto_264719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264737 - BLOCK
      ?auto_264738 - BLOCK
      ?auto_264739 - BLOCK
      ?auto_264740 - BLOCK
      ?auto_264741 - BLOCK
    )
    :vars
    (
      ?auto_264742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264741 ?auto_264742 ) ( not ( = ?auto_264737 ?auto_264738 ) ) ( not ( = ?auto_264737 ?auto_264739 ) ) ( not ( = ?auto_264737 ?auto_264740 ) ) ( not ( = ?auto_264737 ?auto_264741 ) ) ( not ( = ?auto_264737 ?auto_264742 ) ) ( not ( = ?auto_264738 ?auto_264739 ) ) ( not ( = ?auto_264738 ?auto_264740 ) ) ( not ( = ?auto_264738 ?auto_264741 ) ) ( not ( = ?auto_264738 ?auto_264742 ) ) ( not ( = ?auto_264739 ?auto_264740 ) ) ( not ( = ?auto_264739 ?auto_264741 ) ) ( not ( = ?auto_264739 ?auto_264742 ) ) ( not ( = ?auto_264740 ?auto_264741 ) ) ( not ( = ?auto_264740 ?auto_264742 ) ) ( not ( = ?auto_264741 ?auto_264742 ) ) ( ON ?auto_264740 ?auto_264741 ) ( ON ?auto_264739 ?auto_264740 ) ( ON ?auto_264738 ?auto_264739 ) ( ON ?auto_264737 ?auto_264738 ) ( CLEAR ?auto_264737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264737 )
      ( MAKE-5PILE ?auto_264737 ?auto_264738 ?auto_264739 ?auto_264740 ?auto_264741 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264760 - BLOCK
      ?auto_264761 - BLOCK
      ?auto_264762 - BLOCK
      ?auto_264763 - BLOCK
      ?auto_264764 - BLOCK
      ?auto_264765 - BLOCK
    )
    :vars
    (
      ?auto_264766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264764 ) ( ON ?auto_264765 ?auto_264766 ) ( CLEAR ?auto_264765 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264760 ) ( ON ?auto_264761 ?auto_264760 ) ( ON ?auto_264762 ?auto_264761 ) ( ON ?auto_264763 ?auto_264762 ) ( ON ?auto_264764 ?auto_264763 ) ( not ( = ?auto_264760 ?auto_264761 ) ) ( not ( = ?auto_264760 ?auto_264762 ) ) ( not ( = ?auto_264760 ?auto_264763 ) ) ( not ( = ?auto_264760 ?auto_264764 ) ) ( not ( = ?auto_264760 ?auto_264765 ) ) ( not ( = ?auto_264760 ?auto_264766 ) ) ( not ( = ?auto_264761 ?auto_264762 ) ) ( not ( = ?auto_264761 ?auto_264763 ) ) ( not ( = ?auto_264761 ?auto_264764 ) ) ( not ( = ?auto_264761 ?auto_264765 ) ) ( not ( = ?auto_264761 ?auto_264766 ) ) ( not ( = ?auto_264762 ?auto_264763 ) ) ( not ( = ?auto_264762 ?auto_264764 ) ) ( not ( = ?auto_264762 ?auto_264765 ) ) ( not ( = ?auto_264762 ?auto_264766 ) ) ( not ( = ?auto_264763 ?auto_264764 ) ) ( not ( = ?auto_264763 ?auto_264765 ) ) ( not ( = ?auto_264763 ?auto_264766 ) ) ( not ( = ?auto_264764 ?auto_264765 ) ) ( not ( = ?auto_264764 ?auto_264766 ) ) ( not ( = ?auto_264765 ?auto_264766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264765 ?auto_264766 )
      ( !STACK ?auto_264765 ?auto_264764 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264786 - BLOCK
      ?auto_264787 - BLOCK
      ?auto_264788 - BLOCK
      ?auto_264789 - BLOCK
      ?auto_264790 - BLOCK
      ?auto_264791 - BLOCK
    )
    :vars
    (
      ?auto_264792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264791 ?auto_264792 ) ( ON-TABLE ?auto_264786 ) ( ON ?auto_264787 ?auto_264786 ) ( ON ?auto_264788 ?auto_264787 ) ( ON ?auto_264789 ?auto_264788 ) ( not ( = ?auto_264786 ?auto_264787 ) ) ( not ( = ?auto_264786 ?auto_264788 ) ) ( not ( = ?auto_264786 ?auto_264789 ) ) ( not ( = ?auto_264786 ?auto_264790 ) ) ( not ( = ?auto_264786 ?auto_264791 ) ) ( not ( = ?auto_264786 ?auto_264792 ) ) ( not ( = ?auto_264787 ?auto_264788 ) ) ( not ( = ?auto_264787 ?auto_264789 ) ) ( not ( = ?auto_264787 ?auto_264790 ) ) ( not ( = ?auto_264787 ?auto_264791 ) ) ( not ( = ?auto_264787 ?auto_264792 ) ) ( not ( = ?auto_264788 ?auto_264789 ) ) ( not ( = ?auto_264788 ?auto_264790 ) ) ( not ( = ?auto_264788 ?auto_264791 ) ) ( not ( = ?auto_264788 ?auto_264792 ) ) ( not ( = ?auto_264789 ?auto_264790 ) ) ( not ( = ?auto_264789 ?auto_264791 ) ) ( not ( = ?auto_264789 ?auto_264792 ) ) ( not ( = ?auto_264790 ?auto_264791 ) ) ( not ( = ?auto_264790 ?auto_264792 ) ) ( not ( = ?auto_264791 ?auto_264792 ) ) ( CLEAR ?auto_264789 ) ( ON ?auto_264790 ?auto_264791 ) ( CLEAR ?auto_264790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_264786 ?auto_264787 ?auto_264788 ?auto_264789 ?auto_264790 )
      ( MAKE-6PILE ?auto_264786 ?auto_264787 ?auto_264788 ?auto_264789 ?auto_264790 ?auto_264791 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264812 - BLOCK
      ?auto_264813 - BLOCK
      ?auto_264814 - BLOCK
      ?auto_264815 - BLOCK
      ?auto_264816 - BLOCK
      ?auto_264817 - BLOCK
    )
    :vars
    (
      ?auto_264818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264817 ?auto_264818 ) ( ON-TABLE ?auto_264812 ) ( ON ?auto_264813 ?auto_264812 ) ( ON ?auto_264814 ?auto_264813 ) ( not ( = ?auto_264812 ?auto_264813 ) ) ( not ( = ?auto_264812 ?auto_264814 ) ) ( not ( = ?auto_264812 ?auto_264815 ) ) ( not ( = ?auto_264812 ?auto_264816 ) ) ( not ( = ?auto_264812 ?auto_264817 ) ) ( not ( = ?auto_264812 ?auto_264818 ) ) ( not ( = ?auto_264813 ?auto_264814 ) ) ( not ( = ?auto_264813 ?auto_264815 ) ) ( not ( = ?auto_264813 ?auto_264816 ) ) ( not ( = ?auto_264813 ?auto_264817 ) ) ( not ( = ?auto_264813 ?auto_264818 ) ) ( not ( = ?auto_264814 ?auto_264815 ) ) ( not ( = ?auto_264814 ?auto_264816 ) ) ( not ( = ?auto_264814 ?auto_264817 ) ) ( not ( = ?auto_264814 ?auto_264818 ) ) ( not ( = ?auto_264815 ?auto_264816 ) ) ( not ( = ?auto_264815 ?auto_264817 ) ) ( not ( = ?auto_264815 ?auto_264818 ) ) ( not ( = ?auto_264816 ?auto_264817 ) ) ( not ( = ?auto_264816 ?auto_264818 ) ) ( not ( = ?auto_264817 ?auto_264818 ) ) ( ON ?auto_264816 ?auto_264817 ) ( CLEAR ?auto_264814 ) ( ON ?auto_264815 ?auto_264816 ) ( CLEAR ?auto_264815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_264812 ?auto_264813 ?auto_264814 ?auto_264815 )
      ( MAKE-6PILE ?auto_264812 ?auto_264813 ?auto_264814 ?auto_264815 ?auto_264816 ?auto_264817 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264838 - BLOCK
      ?auto_264839 - BLOCK
      ?auto_264840 - BLOCK
      ?auto_264841 - BLOCK
      ?auto_264842 - BLOCK
      ?auto_264843 - BLOCK
    )
    :vars
    (
      ?auto_264844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264843 ?auto_264844 ) ( ON-TABLE ?auto_264838 ) ( ON ?auto_264839 ?auto_264838 ) ( not ( = ?auto_264838 ?auto_264839 ) ) ( not ( = ?auto_264838 ?auto_264840 ) ) ( not ( = ?auto_264838 ?auto_264841 ) ) ( not ( = ?auto_264838 ?auto_264842 ) ) ( not ( = ?auto_264838 ?auto_264843 ) ) ( not ( = ?auto_264838 ?auto_264844 ) ) ( not ( = ?auto_264839 ?auto_264840 ) ) ( not ( = ?auto_264839 ?auto_264841 ) ) ( not ( = ?auto_264839 ?auto_264842 ) ) ( not ( = ?auto_264839 ?auto_264843 ) ) ( not ( = ?auto_264839 ?auto_264844 ) ) ( not ( = ?auto_264840 ?auto_264841 ) ) ( not ( = ?auto_264840 ?auto_264842 ) ) ( not ( = ?auto_264840 ?auto_264843 ) ) ( not ( = ?auto_264840 ?auto_264844 ) ) ( not ( = ?auto_264841 ?auto_264842 ) ) ( not ( = ?auto_264841 ?auto_264843 ) ) ( not ( = ?auto_264841 ?auto_264844 ) ) ( not ( = ?auto_264842 ?auto_264843 ) ) ( not ( = ?auto_264842 ?auto_264844 ) ) ( not ( = ?auto_264843 ?auto_264844 ) ) ( ON ?auto_264842 ?auto_264843 ) ( ON ?auto_264841 ?auto_264842 ) ( CLEAR ?auto_264839 ) ( ON ?auto_264840 ?auto_264841 ) ( CLEAR ?auto_264840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_264838 ?auto_264839 ?auto_264840 )
      ( MAKE-6PILE ?auto_264838 ?auto_264839 ?auto_264840 ?auto_264841 ?auto_264842 ?auto_264843 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264864 - BLOCK
      ?auto_264865 - BLOCK
      ?auto_264866 - BLOCK
      ?auto_264867 - BLOCK
      ?auto_264868 - BLOCK
      ?auto_264869 - BLOCK
    )
    :vars
    (
      ?auto_264870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264869 ?auto_264870 ) ( ON-TABLE ?auto_264864 ) ( not ( = ?auto_264864 ?auto_264865 ) ) ( not ( = ?auto_264864 ?auto_264866 ) ) ( not ( = ?auto_264864 ?auto_264867 ) ) ( not ( = ?auto_264864 ?auto_264868 ) ) ( not ( = ?auto_264864 ?auto_264869 ) ) ( not ( = ?auto_264864 ?auto_264870 ) ) ( not ( = ?auto_264865 ?auto_264866 ) ) ( not ( = ?auto_264865 ?auto_264867 ) ) ( not ( = ?auto_264865 ?auto_264868 ) ) ( not ( = ?auto_264865 ?auto_264869 ) ) ( not ( = ?auto_264865 ?auto_264870 ) ) ( not ( = ?auto_264866 ?auto_264867 ) ) ( not ( = ?auto_264866 ?auto_264868 ) ) ( not ( = ?auto_264866 ?auto_264869 ) ) ( not ( = ?auto_264866 ?auto_264870 ) ) ( not ( = ?auto_264867 ?auto_264868 ) ) ( not ( = ?auto_264867 ?auto_264869 ) ) ( not ( = ?auto_264867 ?auto_264870 ) ) ( not ( = ?auto_264868 ?auto_264869 ) ) ( not ( = ?auto_264868 ?auto_264870 ) ) ( not ( = ?auto_264869 ?auto_264870 ) ) ( ON ?auto_264868 ?auto_264869 ) ( ON ?auto_264867 ?auto_264868 ) ( ON ?auto_264866 ?auto_264867 ) ( CLEAR ?auto_264864 ) ( ON ?auto_264865 ?auto_264866 ) ( CLEAR ?auto_264865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_264864 ?auto_264865 )
      ( MAKE-6PILE ?auto_264864 ?auto_264865 ?auto_264866 ?auto_264867 ?auto_264868 ?auto_264869 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264890 - BLOCK
      ?auto_264891 - BLOCK
      ?auto_264892 - BLOCK
      ?auto_264893 - BLOCK
      ?auto_264894 - BLOCK
      ?auto_264895 - BLOCK
    )
    :vars
    (
      ?auto_264896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264895 ?auto_264896 ) ( not ( = ?auto_264890 ?auto_264891 ) ) ( not ( = ?auto_264890 ?auto_264892 ) ) ( not ( = ?auto_264890 ?auto_264893 ) ) ( not ( = ?auto_264890 ?auto_264894 ) ) ( not ( = ?auto_264890 ?auto_264895 ) ) ( not ( = ?auto_264890 ?auto_264896 ) ) ( not ( = ?auto_264891 ?auto_264892 ) ) ( not ( = ?auto_264891 ?auto_264893 ) ) ( not ( = ?auto_264891 ?auto_264894 ) ) ( not ( = ?auto_264891 ?auto_264895 ) ) ( not ( = ?auto_264891 ?auto_264896 ) ) ( not ( = ?auto_264892 ?auto_264893 ) ) ( not ( = ?auto_264892 ?auto_264894 ) ) ( not ( = ?auto_264892 ?auto_264895 ) ) ( not ( = ?auto_264892 ?auto_264896 ) ) ( not ( = ?auto_264893 ?auto_264894 ) ) ( not ( = ?auto_264893 ?auto_264895 ) ) ( not ( = ?auto_264893 ?auto_264896 ) ) ( not ( = ?auto_264894 ?auto_264895 ) ) ( not ( = ?auto_264894 ?auto_264896 ) ) ( not ( = ?auto_264895 ?auto_264896 ) ) ( ON ?auto_264894 ?auto_264895 ) ( ON ?auto_264893 ?auto_264894 ) ( ON ?auto_264892 ?auto_264893 ) ( ON ?auto_264891 ?auto_264892 ) ( ON ?auto_264890 ?auto_264891 ) ( CLEAR ?auto_264890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264890 )
      ( MAKE-6PILE ?auto_264890 ?auto_264891 ?auto_264892 ?auto_264893 ?auto_264894 ?auto_264895 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_264917 - BLOCK
      ?auto_264918 - BLOCK
      ?auto_264919 - BLOCK
      ?auto_264920 - BLOCK
      ?auto_264921 - BLOCK
      ?auto_264922 - BLOCK
      ?auto_264923 - BLOCK
    )
    :vars
    (
      ?auto_264924 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264922 ) ( ON ?auto_264923 ?auto_264924 ) ( CLEAR ?auto_264923 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264917 ) ( ON ?auto_264918 ?auto_264917 ) ( ON ?auto_264919 ?auto_264918 ) ( ON ?auto_264920 ?auto_264919 ) ( ON ?auto_264921 ?auto_264920 ) ( ON ?auto_264922 ?auto_264921 ) ( not ( = ?auto_264917 ?auto_264918 ) ) ( not ( = ?auto_264917 ?auto_264919 ) ) ( not ( = ?auto_264917 ?auto_264920 ) ) ( not ( = ?auto_264917 ?auto_264921 ) ) ( not ( = ?auto_264917 ?auto_264922 ) ) ( not ( = ?auto_264917 ?auto_264923 ) ) ( not ( = ?auto_264917 ?auto_264924 ) ) ( not ( = ?auto_264918 ?auto_264919 ) ) ( not ( = ?auto_264918 ?auto_264920 ) ) ( not ( = ?auto_264918 ?auto_264921 ) ) ( not ( = ?auto_264918 ?auto_264922 ) ) ( not ( = ?auto_264918 ?auto_264923 ) ) ( not ( = ?auto_264918 ?auto_264924 ) ) ( not ( = ?auto_264919 ?auto_264920 ) ) ( not ( = ?auto_264919 ?auto_264921 ) ) ( not ( = ?auto_264919 ?auto_264922 ) ) ( not ( = ?auto_264919 ?auto_264923 ) ) ( not ( = ?auto_264919 ?auto_264924 ) ) ( not ( = ?auto_264920 ?auto_264921 ) ) ( not ( = ?auto_264920 ?auto_264922 ) ) ( not ( = ?auto_264920 ?auto_264923 ) ) ( not ( = ?auto_264920 ?auto_264924 ) ) ( not ( = ?auto_264921 ?auto_264922 ) ) ( not ( = ?auto_264921 ?auto_264923 ) ) ( not ( = ?auto_264921 ?auto_264924 ) ) ( not ( = ?auto_264922 ?auto_264923 ) ) ( not ( = ?auto_264922 ?auto_264924 ) ) ( not ( = ?auto_264923 ?auto_264924 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264923 ?auto_264924 )
      ( !STACK ?auto_264923 ?auto_264922 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_264947 - BLOCK
      ?auto_264948 - BLOCK
      ?auto_264949 - BLOCK
      ?auto_264950 - BLOCK
      ?auto_264951 - BLOCK
      ?auto_264952 - BLOCK
      ?auto_264953 - BLOCK
    )
    :vars
    (
      ?auto_264954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264953 ?auto_264954 ) ( ON-TABLE ?auto_264947 ) ( ON ?auto_264948 ?auto_264947 ) ( ON ?auto_264949 ?auto_264948 ) ( ON ?auto_264950 ?auto_264949 ) ( ON ?auto_264951 ?auto_264950 ) ( not ( = ?auto_264947 ?auto_264948 ) ) ( not ( = ?auto_264947 ?auto_264949 ) ) ( not ( = ?auto_264947 ?auto_264950 ) ) ( not ( = ?auto_264947 ?auto_264951 ) ) ( not ( = ?auto_264947 ?auto_264952 ) ) ( not ( = ?auto_264947 ?auto_264953 ) ) ( not ( = ?auto_264947 ?auto_264954 ) ) ( not ( = ?auto_264948 ?auto_264949 ) ) ( not ( = ?auto_264948 ?auto_264950 ) ) ( not ( = ?auto_264948 ?auto_264951 ) ) ( not ( = ?auto_264948 ?auto_264952 ) ) ( not ( = ?auto_264948 ?auto_264953 ) ) ( not ( = ?auto_264948 ?auto_264954 ) ) ( not ( = ?auto_264949 ?auto_264950 ) ) ( not ( = ?auto_264949 ?auto_264951 ) ) ( not ( = ?auto_264949 ?auto_264952 ) ) ( not ( = ?auto_264949 ?auto_264953 ) ) ( not ( = ?auto_264949 ?auto_264954 ) ) ( not ( = ?auto_264950 ?auto_264951 ) ) ( not ( = ?auto_264950 ?auto_264952 ) ) ( not ( = ?auto_264950 ?auto_264953 ) ) ( not ( = ?auto_264950 ?auto_264954 ) ) ( not ( = ?auto_264951 ?auto_264952 ) ) ( not ( = ?auto_264951 ?auto_264953 ) ) ( not ( = ?auto_264951 ?auto_264954 ) ) ( not ( = ?auto_264952 ?auto_264953 ) ) ( not ( = ?auto_264952 ?auto_264954 ) ) ( not ( = ?auto_264953 ?auto_264954 ) ) ( CLEAR ?auto_264951 ) ( ON ?auto_264952 ?auto_264953 ) ( CLEAR ?auto_264952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_264947 ?auto_264948 ?auto_264949 ?auto_264950 ?auto_264951 ?auto_264952 )
      ( MAKE-7PILE ?auto_264947 ?auto_264948 ?auto_264949 ?auto_264950 ?auto_264951 ?auto_264952 ?auto_264953 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_264977 - BLOCK
      ?auto_264978 - BLOCK
      ?auto_264979 - BLOCK
      ?auto_264980 - BLOCK
      ?auto_264981 - BLOCK
      ?auto_264982 - BLOCK
      ?auto_264983 - BLOCK
    )
    :vars
    (
      ?auto_264984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264983 ?auto_264984 ) ( ON-TABLE ?auto_264977 ) ( ON ?auto_264978 ?auto_264977 ) ( ON ?auto_264979 ?auto_264978 ) ( ON ?auto_264980 ?auto_264979 ) ( not ( = ?auto_264977 ?auto_264978 ) ) ( not ( = ?auto_264977 ?auto_264979 ) ) ( not ( = ?auto_264977 ?auto_264980 ) ) ( not ( = ?auto_264977 ?auto_264981 ) ) ( not ( = ?auto_264977 ?auto_264982 ) ) ( not ( = ?auto_264977 ?auto_264983 ) ) ( not ( = ?auto_264977 ?auto_264984 ) ) ( not ( = ?auto_264978 ?auto_264979 ) ) ( not ( = ?auto_264978 ?auto_264980 ) ) ( not ( = ?auto_264978 ?auto_264981 ) ) ( not ( = ?auto_264978 ?auto_264982 ) ) ( not ( = ?auto_264978 ?auto_264983 ) ) ( not ( = ?auto_264978 ?auto_264984 ) ) ( not ( = ?auto_264979 ?auto_264980 ) ) ( not ( = ?auto_264979 ?auto_264981 ) ) ( not ( = ?auto_264979 ?auto_264982 ) ) ( not ( = ?auto_264979 ?auto_264983 ) ) ( not ( = ?auto_264979 ?auto_264984 ) ) ( not ( = ?auto_264980 ?auto_264981 ) ) ( not ( = ?auto_264980 ?auto_264982 ) ) ( not ( = ?auto_264980 ?auto_264983 ) ) ( not ( = ?auto_264980 ?auto_264984 ) ) ( not ( = ?auto_264981 ?auto_264982 ) ) ( not ( = ?auto_264981 ?auto_264983 ) ) ( not ( = ?auto_264981 ?auto_264984 ) ) ( not ( = ?auto_264982 ?auto_264983 ) ) ( not ( = ?auto_264982 ?auto_264984 ) ) ( not ( = ?auto_264983 ?auto_264984 ) ) ( ON ?auto_264982 ?auto_264983 ) ( CLEAR ?auto_264980 ) ( ON ?auto_264981 ?auto_264982 ) ( CLEAR ?auto_264981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_264977 ?auto_264978 ?auto_264979 ?auto_264980 ?auto_264981 )
      ( MAKE-7PILE ?auto_264977 ?auto_264978 ?auto_264979 ?auto_264980 ?auto_264981 ?auto_264982 ?auto_264983 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_265007 - BLOCK
      ?auto_265008 - BLOCK
      ?auto_265009 - BLOCK
      ?auto_265010 - BLOCK
      ?auto_265011 - BLOCK
      ?auto_265012 - BLOCK
      ?auto_265013 - BLOCK
    )
    :vars
    (
      ?auto_265014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265013 ?auto_265014 ) ( ON-TABLE ?auto_265007 ) ( ON ?auto_265008 ?auto_265007 ) ( ON ?auto_265009 ?auto_265008 ) ( not ( = ?auto_265007 ?auto_265008 ) ) ( not ( = ?auto_265007 ?auto_265009 ) ) ( not ( = ?auto_265007 ?auto_265010 ) ) ( not ( = ?auto_265007 ?auto_265011 ) ) ( not ( = ?auto_265007 ?auto_265012 ) ) ( not ( = ?auto_265007 ?auto_265013 ) ) ( not ( = ?auto_265007 ?auto_265014 ) ) ( not ( = ?auto_265008 ?auto_265009 ) ) ( not ( = ?auto_265008 ?auto_265010 ) ) ( not ( = ?auto_265008 ?auto_265011 ) ) ( not ( = ?auto_265008 ?auto_265012 ) ) ( not ( = ?auto_265008 ?auto_265013 ) ) ( not ( = ?auto_265008 ?auto_265014 ) ) ( not ( = ?auto_265009 ?auto_265010 ) ) ( not ( = ?auto_265009 ?auto_265011 ) ) ( not ( = ?auto_265009 ?auto_265012 ) ) ( not ( = ?auto_265009 ?auto_265013 ) ) ( not ( = ?auto_265009 ?auto_265014 ) ) ( not ( = ?auto_265010 ?auto_265011 ) ) ( not ( = ?auto_265010 ?auto_265012 ) ) ( not ( = ?auto_265010 ?auto_265013 ) ) ( not ( = ?auto_265010 ?auto_265014 ) ) ( not ( = ?auto_265011 ?auto_265012 ) ) ( not ( = ?auto_265011 ?auto_265013 ) ) ( not ( = ?auto_265011 ?auto_265014 ) ) ( not ( = ?auto_265012 ?auto_265013 ) ) ( not ( = ?auto_265012 ?auto_265014 ) ) ( not ( = ?auto_265013 ?auto_265014 ) ) ( ON ?auto_265012 ?auto_265013 ) ( ON ?auto_265011 ?auto_265012 ) ( CLEAR ?auto_265009 ) ( ON ?auto_265010 ?auto_265011 ) ( CLEAR ?auto_265010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_265007 ?auto_265008 ?auto_265009 ?auto_265010 )
      ( MAKE-7PILE ?auto_265007 ?auto_265008 ?auto_265009 ?auto_265010 ?auto_265011 ?auto_265012 ?auto_265013 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_265037 - BLOCK
      ?auto_265038 - BLOCK
      ?auto_265039 - BLOCK
      ?auto_265040 - BLOCK
      ?auto_265041 - BLOCK
      ?auto_265042 - BLOCK
      ?auto_265043 - BLOCK
    )
    :vars
    (
      ?auto_265044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265043 ?auto_265044 ) ( ON-TABLE ?auto_265037 ) ( ON ?auto_265038 ?auto_265037 ) ( not ( = ?auto_265037 ?auto_265038 ) ) ( not ( = ?auto_265037 ?auto_265039 ) ) ( not ( = ?auto_265037 ?auto_265040 ) ) ( not ( = ?auto_265037 ?auto_265041 ) ) ( not ( = ?auto_265037 ?auto_265042 ) ) ( not ( = ?auto_265037 ?auto_265043 ) ) ( not ( = ?auto_265037 ?auto_265044 ) ) ( not ( = ?auto_265038 ?auto_265039 ) ) ( not ( = ?auto_265038 ?auto_265040 ) ) ( not ( = ?auto_265038 ?auto_265041 ) ) ( not ( = ?auto_265038 ?auto_265042 ) ) ( not ( = ?auto_265038 ?auto_265043 ) ) ( not ( = ?auto_265038 ?auto_265044 ) ) ( not ( = ?auto_265039 ?auto_265040 ) ) ( not ( = ?auto_265039 ?auto_265041 ) ) ( not ( = ?auto_265039 ?auto_265042 ) ) ( not ( = ?auto_265039 ?auto_265043 ) ) ( not ( = ?auto_265039 ?auto_265044 ) ) ( not ( = ?auto_265040 ?auto_265041 ) ) ( not ( = ?auto_265040 ?auto_265042 ) ) ( not ( = ?auto_265040 ?auto_265043 ) ) ( not ( = ?auto_265040 ?auto_265044 ) ) ( not ( = ?auto_265041 ?auto_265042 ) ) ( not ( = ?auto_265041 ?auto_265043 ) ) ( not ( = ?auto_265041 ?auto_265044 ) ) ( not ( = ?auto_265042 ?auto_265043 ) ) ( not ( = ?auto_265042 ?auto_265044 ) ) ( not ( = ?auto_265043 ?auto_265044 ) ) ( ON ?auto_265042 ?auto_265043 ) ( ON ?auto_265041 ?auto_265042 ) ( ON ?auto_265040 ?auto_265041 ) ( CLEAR ?auto_265038 ) ( ON ?auto_265039 ?auto_265040 ) ( CLEAR ?auto_265039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_265037 ?auto_265038 ?auto_265039 )
      ( MAKE-7PILE ?auto_265037 ?auto_265038 ?auto_265039 ?auto_265040 ?auto_265041 ?auto_265042 ?auto_265043 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_265067 - BLOCK
      ?auto_265068 - BLOCK
      ?auto_265069 - BLOCK
      ?auto_265070 - BLOCK
      ?auto_265071 - BLOCK
      ?auto_265072 - BLOCK
      ?auto_265073 - BLOCK
    )
    :vars
    (
      ?auto_265074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265073 ?auto_265074 ) ( ON-TABLE ?auto_265067 ) ( not ( = ?auto_265067 ?auto_265068 ) ) ( not ( = ?auto_265067 ?auto_265069 ) ) ( not ( = ?auto_265067 ?auto_265070 ) ) ( not ( = ?auto_265067 ?auto_265071 ) ) ( not ( = ?auto_265067 ?auto_265072 ) ) ( not ( = ?auto_265067 ?auto_265073 ) ) ( not ( = ?auto_265067 ?auto_265074 ) ) ( not ( = ?auto_265068 ?auto_265069 ) ) ( not ( = ?auto_265068 ?auto_265070 ) ) ( not ( = ?auto_265068 ?auto_265071 ) ) ( not ( = ?auto_265068 ?auto_265072 ) ) ( not ( = ?auto_265068 ?auto_265073 ) ) ( not ( = ?auto_265068 ?auto_265074 ) ) ( not ( = ?auto_265069 ?auto_265070 ) ) ( not ( = ?auto_265069 ?auto_265071 ) ) ( not ( = ?auto_265069 ?auto_265072 ) ) ( not ( = ?auto_265069 ?auto_265073 ) ) ( not ( = ?auto_265069 ?auto_265074 ) ) ( not ( = ?auto_265070 ?auto_265071 ) ) ( not ( = ?auto_265070 ?auto_265072 ) ) ( not ( = ?auto_265070 ?auto_265073 ) ) ( not ( = ?auto_265070 ?auto_265074 ) ) ( not ( = ?auto_265071 ?auto_265072 ) ) ( not ( = ?auto_265071 ?auto_265073 ) ) ( not ( = ?auto_265071 ?auto_265074 ) ) ( not ( = ?auto_265072 ?auto_265073 ) ) ( not ( = ?auto_265072 ?auto_265074 ) ) ( not ( = ?auto_265073 ?auto_265074 ) ) ( ON ?auto_265072 ?auto_265073 ) ( ON ?auto_265071 ?auto_265072 ) ( ON ?auto_265070 ?auto_265071 ) ( ON ?auto_265069 ?auto_265070 ) ( CLEAR ?auto_265067 ) ( ON ?auto_265068 ?auto_265069 ) ( CLEAR ?auto_265068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_265067 ?auto_265068 )
      ( MAKE-7PILE ?auto_265067 ?auto_265068 ?auto_265069 ?auto_265070 ?auto_265071 ?auto_265072 ?auto_265073 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_265097 - BLOCK
      ?auto_265098 - BLOCK
      ?auto_265099 - BLOCK
      ?auto_265100 - BLOCK
      ?auto_265101 - BLOCK
      ?auto_265102 - BLOCK
      ?auto_265103 - BLOCK
    )
    :vars
    (
      ?auto_265104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265103 ?auto_265104 ) ( not ( = ?auto_265097 ?auto_265098 ) ) ( not ( = ?auto_265097 ?auto_265099 ) ) ( not ( = ?auto_265097 ?auto_265100 ) ) ( not ( = ?auto_265097 ?auto_265101 ) ) ( not ( = ?auto_265097 ?auto_265102 ) ) ( not ( = ?auto_265097 ?auto_265103 ) ) ( not ( = ?auto_265097 ?auto_265104 ) ) ( not ( = ?auto_265098 ?auto_265099 ) ) ( not ( = ?auto_265098 ?auto_265100 ) ) ( not ( = ?auto_265098 ?auto_265101 ) ) ( not ( = ?auto_265098 ?auto_265102 ) ) ( not ( = ?auto_265098 ?auto_265103 ) ) ( not ( = ?auto_265098 ?auto_265104 ) ) ( not ( = ?auto_265099 ?auto_265100 ) ) ( not ( = ?auto_265099 ?auto_265101 ) ) ( not ( = ?auto_265099 ?auto_265102 ) ) ( not ( = ?auto_265099 ?auto_265103 ) ) ( not ( = ?auto_265099 ?auto_265104 ) ) ( not ( = ?auto_265100 ?auto_265101 ) ) ( not ( = ?auto_265100 ?auto_265102 ) ) ( not ( = ?auto_265100 ?auto_265103 ) ) ( not ( = ?auto_265100 ?auto_265104 ) ) ( not ( = ?auto_265101 ?auto_265102 ) ) ( not ( = ?auto_265101 ?auto_265103 ) ) ( not ( = ?auto_265101 ?auto_265104 ) ) ( not ( = ?auto_265102 ?auto_265103 ) ) ( not ( = ?auto_265102 ?auto_265104 ) ) ( not ( = ?auto_265103 ?auto_265104 ) ) ( ON ?auto_265102 ?auto_265103 ) ( ON ?auto_265101 ?auto_265102 ) ( ON ?auto_265100 ?auto_265101 ) ( ON ?auto_265099 ?auto_265100 ) ( ON ?auto_265098 ?auto_265099 ) ( ON ?auto_265097 ?auto_265098 ) ( CLEAR ?auto_265097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_265097 )
      ( MAKE-7PILE ?auto_265097 ?auto_265098 ?auto_265099 ?auto_265100 ?auto_265101 ?auto_265102 ?auto_265103 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265128 - BLOCK
      ?auto_265129 - BLOCK
      ?auto_265130 - BLOCK
      ?auto_265131 - BLOCK
      ?auto_265132 - BLOCK
      ?auto_265133 - BLOCK
      ?auto_265134 - BLOCK
      ?auto_265135 - BLOCK
    )
    :vars
    (
      ?auto_265136 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_265134 ) ( ON ?auto_265135 ?auto_265136 ) ( CLEAR ?auto_265135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_265128 ) ( ON ?auto_265129 ?auto_265128 ) ( ON ?auto_265130 ?auto_265129 ) ( ON ?auto_265131 ?auto_265130 ) ( ON ?auto_265132 ?auto_265131 ) ( ON ?auto_265133 ?auto_265132 ) ( ON ?auto_265134 ?auto_265133 ) ( not ( = ?auto_265128 ?auto_265129 ) ) ( not ( = ?auto_265128 ?auto_265130 ) ) ( not ( = ?auto_265128 ?auto_265131 ) ) ( not ( = ?auto_265128 ?auto_265132 ) ) ( not ( = ?auto_265128 ?auto_265133 ) ) ( not ( = ?auto_265128 ?auto_265134 ) ) ( not ( = ?auto_265128 ?auto_265135 ) ) ( not ( = ?auto_265128 ?auto_265136 ) ) ( not ( = ?auto_265129 ?auto_265130 ) ) ( not ( = ?auto_265129 ?auto_265131 ) ) ( not ( = ?auto_265129 ?auto_265132 ) ) ( not ( = ?auto_265129 ?auto_265133 ) ) ( not ( = ?auto_265129 ?auto_265134 ) ) ( not ( = ?auto_265129 ?auto_265135 ) ) ( not ( = ?auto_265129 ?auto_265136 ) ) ( not ( = ?auto_265130 ?auto_265131 ) ) ( not ( = ?auto_265130 ?auto_265132 ) ) ( not ( = ?auto_265130 ?auto_265133 ) ) ( not ( = ?auto_265130 ?auto_265134 ) ) ( not ( = ?auto_265130 ?auto_265135 ) ) ( not ( = ?auto_265130 ?auto_265136 ) ) ( not ( = ?auto_265131 ?auto_265132 ) ) ( not ( = ?auto_265131 ?auto_265133 ) ) ( not ( = ?auto_265131 ?auto_265134 ) ) ( not ( = ?auto_265131 ?auto_265135 ) ) ( not ( = ?auto_265131 ?auto_265136 ) ) ( not ( = ?auto_265132 ?auto_265133 ) ) ( not ( = ?auto_265132 ?auto_265134 ) ) ( not ( = ?auto_265132 ?auto_265135 ) ) ( not ( = ?auto_265132 ?auto_265136 ) ) ( not ( = ?auto_265133 ?auto_265134 ) ) ( not ( = ?auto_265133 ?auto_265135 ) ) ( not ( = ?auto_265133 ?auto_265136 ) ) ( not ( = ?auto_265134 ?auto_265135 ) ) ( not ( = ?auto_265134 ?auto_265136 ) ) ( not ( = ?auto_265135 ?auto_265136 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_265135 ?auto_265136 )
      ( !STACK ?auto_265135 ?auto_265134 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265162 - BLOCK
      ?auto_265163 - BLOCK
      ?auto_265164 - BLOCK
      ?auto_265165 - BLOCK
      ?auto_265166 - BLOCK
      ?auto_265167 - BLOCK
      ?auto_265168 - BLOCK
      ?auto_265169 - BLOCK
    )
    :vars
    (
      ?auto_265170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265169 ?auto_265170 ) ( ON-TABLE ?auto_265162 ) ( ON ?auto_265163 ?auto_265162 ) ( ON ?auto_265164 ?auto_265163 ) ( ON ?auto_265165 ?auto_265164 ) ( ON ?auto_265166 ?auto_265165 ) ( ON ?auto_265167 ?auto_265166 ) ( not ( = ?auto_265162 ?auto_265163 ) ) ( not ( = ?auto_265162 ?auto_265164 ) ) ( not ( = ?auto_265162 ?auto_265165 ) ) ( not ( = ?auto_265162 ?auto_265166 ) ) ( not ( = ?auto_265162 ?auto_265167 ) ) ( not ( = ?auto_265162 ?auto_265168 ) ) ( not ( = ?auto_265162 ?auto_265169 ) ) ( not ( = ?auto_265162 ?auto_265170 ) ) ( not ( = ?auto_265163 ?auto_265164 ) ) ( not ( = ?auto_265163 ?auto_265165 ) ) ( not ( = ?auto_265163 ?auto_265166 ) ) ( not ( = ?auto_265163 ?auto_265167 ) ) ( not ( = ?auto_265163 ?auto_265168 ) ) ( not ( = ?auto_265163 ?auto_265169 ) ) ( not ( = ?auto_265163 ?auto_265170 ) ) ( not ( = ?auto_265164 ?auto_265165 ) ) ( not ( = ?auto_265164 ?auto_265166 ) ) ( not ( = ?auto_265164 ?auto_265167 ) ) ( not ( = ?auto_265164 ?auto_265168 ) ) ( not ( = ?auto_265164 ?auto_265169 ) ) ( not ( = ?auto_265164 ?auto_265170 ) ) ( not ( = ?auto_265165 ?auto_265166 ) ) ( not ( = ?auto_265165 ?auto_265167 ) ) ( not ( = ?auto_265165 ?auto_265168 ) ) ( not ( = ?auto_265165 ?auto_265169 ) ) ( not ( = ?auto_265165 ?auto_265170 ) ) ( not ( = ?auto_265166 ?auto_265167 ) ) ( not ( = ?auto_265166 ?auto_265168 ) ) ( not ( = ?auto_265166 ?auto_265169 ) ) ( not ( = ?auto_265166 ?auto_265170 ) ) ( not ( = ?auto_265167 ?auto_265168 ) ) ( not ( = ?auto_265167 ?auto_265169 ) ) ( not ( = ?auto_265167 ?auto_265170 ) ) ( not ( = ?auto_265168 ?auto_265169 ) ) ( not ( = ?auto_265168 ?auto_265170 ) ) ( not ( = ?auto_265169 ?auto_265170 ) ) ( CLEAR ?auto_265167 ) ( ON ?auto_265168 ?auto_265169 ) ( CLEAR ?auto_265168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_265162 ?auto_265163 ?auto_265164 ?auto_265165 ?auto_265166 ?auto_265167 ?auto_265168 )
      ( MAKE-8PILE ?auto_265162 ?auto_265163 ?auto_265164 ?auto_265165 ?auto_265166 ?auto_265167 ?auto_265168 ?auto_265169 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265196 - BLOCK
      ?auto_265197 - BLOCK
      ?auto_265198 - BLOCK
      ?auto_265199 - BLOCK
      ?auto_265200 - BLOCK
      ?auto_265201 - BLOCK
      ?auto_265202 - BLOCK
      ?auto_265203 - BLOCK
    )
    :vars
    (
      ?auto_265204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265203 ?auto_265204 ) ( ON-TABLE ?auto_265196 ) ( ON ?auto_265197 ?auto_265196 ) ( ON ?auto_265198 ?auto_265197 ) ( ON ?auto_265199 ?auto_265198 ) ( ON ?auto_265200 ?auto_265199 ) ( not ( = ?auto_265196 ?auto_265197 ) ) ( not ( = ?auto_265196 ?auto_265198 ) ) ( not ( = ?auto_265196 ?auto_265199 ) ) ( not ( = ?auto_265196 ?auto_265200 ) ) ( not ( = ?auto_265196 ?auto_265201 ) ) ( not ( = ?auto_265196 ?auto_265202 ) ) ( not ( = ?auto_265196 ?auto_265203 ) ) ( not ( = ?auto_265196 ?auto_265204 ) ) ( not ( = ?auto_265197 ?auto_265198 ) ) ( not ( = ?auto_265197 ?auto_265199 ) ) ( not ( = ?auto_265197 ?auto_265200 ) ) ( not ( = ?auto_265197 ?auto_265201 ) ) ( not ( = ?auto_265197 ?auto_265202 ) ) ( not ( = ?auto_265197 ?auto_265203 ) ) ( not ( = ?auto_265197 ?auto_265204 ) ) ( not ( = ?auto_265198 ?auto_265199 ) ) ( not ( = ?auto_265198 ?auto_265200 ) ) ( not ( = ?auto_265198 ?auto_265201 ) ) ( not ( = ?auto_265198 ?auto_265202 ) ) ( not ( = ?auto_265198 ?auto_265203 ) ) ( not ( = ?auto_265198 ?auto_265204 ) ) ( not ( = ?auto_265199 ?auto_265200 ) ) ( not ( = ?auto_265199 ?auto_265201 ) ) ( not ( = ?auto_265199 ?auto_265202 ) ) ( not ( = ?auto_265199 ?auto_265203 ) ) ( not ( = ?auto_265199 ?auto_265204 ) ) ( not ( = ?auto_265200 ?auto_265201 ) ) ( not ( = ?auto_265200 ?auto_265202 ) ) ( not ( = ?auto_265200 ?auto_265203 ) ) ( not ( = ?auto_265200 ?auto_265204 ) ) ( not ( = ?auto_265201 ?auto_265202 ) ) ( not ( = ?auto_265201 ?auto_265203 ) ) ( not ( = ?auto_265201 ?auto_265204 ) ) ( not ( = ?auto_265202 ?auto_265203 ) ) ( not ( = ?auto_265202 ?auto_265204 ) ) ( not ( = ?auto_265203 ?auto_265204 ) ) ( ON ?auto_265202 ?auto_265203 ) ( CLEAR ?auto_265200 ) ( ON ?auto_265201 ?auto_265202 ) ( CLEAR ?auto_265201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_265196 ?auto_265197 ?auto_265198 ?auto_265199 ?auto_265200 ?auto_265201 )
      ( MAKE-8PILE ?auto_265196 ?auto_265197 ?auto_265198 ?auto_265199 ?auto_265200 ?auto_265201 ?auto_265202 ?auto_265203 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265230 - BLOCK
      ?auto_265231 - BLOCK
      ?auto_265232 - BLOCK
      ?auto_265233 - BLOCK
      ?auto_265234 - BLOCK
      ?auto_265235 - BLOCK
      ?auto_265236 - BLOCK
      ?auto_265237 - BLOCK
    )
    :vars
    (
      ?auto_265238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265237 ?auto_265238 ) ( ON-TABLE ?auto_265230 ) ( ON ?auto_265231 ?auto_265230 ) ( ON ?auto_265232 ?auto_265231 ) ( ON ?auto_265233 ?auto_265232 ) ( not ( = ?auto_265230 ?auto_265231 ) ) ( not ( = ?auto_265230 ?auto_265232 ) ) ( not ( = ?auto_265230 ?auto_265233 ) ) ( not ( = ?auto_265230 ?auto_265234 ) ) ( not ( = ?auto_265230 ?auto_265235 ) ) ( not ( = ?auto_265230 ?auto_265236 ) ) ( not ( = ?auto_265230 ?auto_265237 ) ) ( not ( = ?auto_265230 ?auto_265238 ) ) ( not ( = ?auto_265231 ?auto_265232 ) ) ( not ( = ?auto_265231 ?auto_265233 ) ) ( not ( = ?auto_265231 ?auto_265234 ) ) ( not ( = ?auto_265231 ?auto_265235 ) ) ( not ( = ?auto_265231 ?auto_265236 ) ) ( not ( = ?auto_265231 ?auto_265237 ) ) ( not ( = ?auto_265231 ?auto_265238 ) ) ( not ( = ?auto_265232 ?auto_265233 ) ) ( not ( = ?auto_265232 ?auto_265234 ) ) ( not ( = ?auto_265232 ?auto_265235 ) ) ( not ( = ?auto_265232 ?auto_265236 ) ) ( not ( = ?auto_265232 ?auto_265237 ) ) ( not ( = ?auto_265232 ?auto_265238 ) ) ( not ( = ?auto_265233 ?auto_265234 ) ) ( not ( = ?auto_265233 ?auto_265235 ) ) ( not ( = ?auto_265233 ?auto_265236 ) ) ( not ( = ?auto_265233 ?auto_265237 ) ) ( not ( = ?auto_265233 ?auto_265238 ) ) ( not ( = ?auto_265234 ?auto_265235 ) ) ( not ( = ?auto_265234 ?auto_265236 ) ) ( not ( = ?auto_265234 ?auto_265237 ) ) ( not ( = ?auto_265234 ?auto_265238 ) ) ( not ( = ?auto_265235 ?auto_265236 ) ) ( not ( = ?auto_265235 ?auto_265237 ) ) ( not ( = ?auto_265235 ?auto_265238 ) ) ( not ( = ?auto_265236 ?auto_265237 ) ) ( not ( = ?auto_265236 ?auto_265238 ) ) ( not ( = ?auto_265237 ?auto_265238 ) ) ( ON ?auto_265236 ?auto_265237 ) ( ON ?auto_265235 ?auto_265236 ) ( CLEAR ?auto_265233 ) ( ON ?auto_265234 ?auto_265235 ) ( CLEAR ?auto_265234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_265230 ?auto_265231 ?auto_265232 ?auto_265233 ?auto_265234 )
      ( MAKE-8PILE ?auto_265230 ?auto_265231 ?auto_265232 ?auto_265233 ?auto_265234 ?auto_265235 ?auto_265236 ?auto_265237 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265264 - BLOCK
      ?auto_265265 - BLOCK
      ?auto_265266 - BLOCK
      ?auto_265267 - BLOCK
      ?auto_265268 - BLOCK
      ?auto_265269 - BLOCK
      ?auto_265270 - BLOCK
      ?auto_265271 - BLOCK
    )
    :vars
    (
      ?auto_265272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265271 ?auto_265272 ) ( ON-TABLE ?auto_265264 ) ( ON ?auto_265265 ?auto_265264 ) ( ON ?auto_265266 ?auto_265265 ) ( not ( = ?auto_265264 ?auto_265265 ) ) ( not ( = ?auto_265264 ?auto_265266 ) ) ( not ( = ?auto_265264 ?auto_265267 ) ) ( not ( = ?auto_265264 ?auto_265268 ) ) ( not ( = ?auto_265264 ?auto_265269 ) ) ( not ( = ?auto_265264 ?auto_265270 ) ) ( not ( = ?auto_265264 ?auto_265271 ) ) ( not ( = ?auto_265264 ?auto_265272 ) ) ( not ( = ?auto_265265 ?auto_265266 ) ) ( not ( = ?auto_265265 ?auto_265267 ) ) ( not ( = ?auto_265265 ?auto_265268 ) ) ( not ( = ?auto_265265 ?auto_265269 ) ) ( not ( = ?auto_265265 ?auto_265270 ) ) ( not ( = ?auto_265265 ?auto_265271 ) ) ( not ( = ?auto_265265 ?auto_265272 ) ) ( not ( = ?auto_265266 ?auto_265267 ) ) ( not ( = ?auto_265266 ?auto_265268 ) ) ( not ( = ?auto_265266 ?auto_265269 ) ) ( not ( = ?auto_265266 ?auto_265270 ) ) ( not ( = ?auto_265266 ?auto_265271 ) ) ( not ( = ?auto_265266 ?auto_265272 ) ) ( not ( = ?auto_265267 ?auto_265268 ) ) ( not ( = ?auto_265267 ?auto_265269 ) ) ( not ( = ?auto_265267 ?auto_265270 ) ) ( not ( = ?auto_265267 ?auto_265271 ) ) ( not ( = ?auto_265267 ?auto_265272 ) ) ( not ( = ?auto_265268 ?auto_265269 ) ) ( not ( = ?auto_265268 ?auto_265270 ) ) ( not ( = ?auto_265268 ?auto_265271 ) ) ( not ( = ?auto_265268 ?auto_265272 ) ) ( not ( = ?auto_265269 ?auto_265270 ) ) ( not ( = ?auto_265269 ?auto_265271 ) ) ( not ( = ?auto_265269 ?auto_265272 ) ) ( not ( = ?auto_265270 ?auto_265271 ) ) ( not ( = ?auto_265270 ?auto_265272 ) ) ( not ( = ?auto_265271 ?auto_265272 ) ) ( ON ?auto_265270 ?auto_265271 ) ( ON ?auto_265269 ?auto_265270 ) ( ON ?auto_265268 ?auto_265269 ) ( CLEAR ?auto_265266 ) ( ON ?auto_265267 ?auto_265268 ) ( CLEAR ?auto_265267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_265264 ?auto_265265 ?auto_265266 ?auto_265267 )
      ( MAKE-8PILE ?auto_265264 ?auto_265265 ?auto_265266 ?auto_265267 ?auto_265268 ?auto_265269 ?auto_265270 ?auto_265271 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265298 - BLOCK
      ?auto_265299 - BLOCK
      ?auto_265300 - BLOCK
      ?auto_265301 - BLOCK
      ?auto_265302 - BLOCK
      ?auto_265303 - BLOCK
      ?auto_265304 - BLOCK
      ?auto_265305 - BLOCK
    )
    :vars
    (
      ?auto_265306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265305 ?auto_265306 ) ( ON-TABLE ?auto_265298 ) ( ON ?auto_265299 ?auto_265298 ) ( not ( = ?auto_265298 ?auto_265299 ) ) ( not ( = ?auto_265298 ?auto_265300 ) ) ( not ( = ?auto_265298 ?auto_265301 ) ) ( not ( = ?auto_265298 ?auto_265302 ) ) ( not ( = ?auto_265298 ?auto_265303 ) ) ( not ( = ?auto_265298 ?auto_265304 ) ) ( not ( = ?auto_265298 ?auto_265305 ) ) ( not ( = ?auto_265298 ?auto_265306 ) ) ( not ( = ?auto_265299 ?auto_265300 ) ) ( not ( = ?auto_265299 ?auto_265301 ) ) ( not ( = ?auto_265299 ?auto_265302 ) ) ( not ( = ?auto_265299 ?auto_265303 ) ) ( not ( = ?auto_265299 ?auto_265304 ) ) ( not ( = ?auto_265299 ?auto_265305 ) ) ( not ( = ?auto_265299 ?auto_265306 ) ) ( not ( = ?auto_265300 ?auto_265301 ) ) ( not ( = ?auto_265300 ?auto_265302 ) ) ( not ( = ?auto_265300 ?auto_265303 ) ) ( not ( = ?auto_265300 ?auto_265304 ) ) ( not ( = ?auto_265300 ?auto_265305 ) ) ( not ( = ?auto_265300 ?auto_265306 ) ) ( not ( = ?auto_265301 ?auto_265302 ) ) ( not ( = ?auto_265301 ?auto_265303 ) ) ( not ( = ?auto_265301 ?auto_265304 ) ) ( not ( = ?auto_265301 ?auto_265305 ) ) ( not ( = ?auto_265301 ?auto_265306 ) ) ( not ( = ?auto_265302 ?auto_265303 ) ) ( not ( = ?auto_265302 ?auto_265304 ) ) ( not ( = ?auto_265302 ?auto_265305 ) ) ( not ( = ?auto_265302 ?auto_265306 ) ) ( not ( = ?auto_265303 ?auto_265304 ) ) ( not ( = ?auto_265303 ?auto_265305 ) ) ( not ( = ?auto_265303 ?auto_265306 ) ) ( not ( = ?auto_265304 ?auto_265305 ) ) ( not ( = ?auto_265304 ?auto_265306 ) ) ( not ( = ?auto_265305 ?auto_265306 ) ) ( ON ?auto_265304 ?auto_265305 ) ( ON ?auto_265303 ?auto_265304 ) ( ON ?auto_265302 ?auto_265303 ) ( ON ?auto_265301 ?auto_265302 ) ( CLEAR ?auto_265299 ) ( ON ?auto_265300 ?auto_265301 ) ( CLEAR ?auto_265300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_265298 ?auto_265299 ?auto_265300 )
      ( MAKE-8PILE ?auto_265298 ?auto_265299 ?auto_265300 ?auto_265301 ?auto_265302 ?auto_265303 ?auto_265304 ?auto_265305 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265332 - BLOCK
      ?auto_265333 - BLOCK
      ?auto_265334 - BLOCK
      ?auto_265335 - BLOCK
      ?auto_265336 - BLOCK
      ?auto_265337 - BLOCK
      ?auto_265338 - BLOCK
      ?auto_265339 - BLOCK
    )
    :vars
    (
      ?auto_265340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265339 ?auto_265340 ) ( ON-TABLE ?auto_265332 ) ( not ( = ?auto_265332 ?auto_265333 ) ) ( not ( = ?auto_265332 ?auto_265334 ) ) ( not ( = ?auto_265332 ?auto_265335 ) ) ( not ( = ?auto_265332 ?auto_265336 ) ) ( not ( = ?auto_265332 ?auto_265337 ) ) ( not ( = ?auto_265332 ?auto_265338 ) ) ( not ( = ?auto_265332 ?auto_265339 ) ) ( not ( = ?auto_265332 ?auto_265340 ) ) ( not ( = ?auto_265333 ?auto_265334 ) ) ( not ( = ?auto_265333 ?auto_265335 ) ) ( not ( = ?auto_265333 ?auto_265336 ) ) ( not ( = ?auto_265333 ?auto_265337 ) ) ( not ( = ?auto_265333 ?auto_265338 ) ) ( not ( = ?auto_265333 ?auto_265339 ) ) ( not ( = ?auto_265333 ?auto_265340 ) ) ( not ( = ?auto_265334 ?auto_265335 ) ) ( not ( = ?auto_265334 ?auto_265336 ) ) ( not ( = ?auto_265334 ?auto_265337 ) ) ( not ( = ?auto_265334 ?auto_265338 ) ) ( not ( = ?auto_265334 ?auto_265339 ) ) ( not ( = ?auto_265334 ?auto_265340 ) ) ( not ( = ?auto_265335 ?auto_265336 ) ) ( not ( = ?auto_265335 ?auto_265337 ) ) ( not ( = ?auto_265335 ?auto_265338 ) ) ( not ( = ?auto_265335 ?auto_265339 ) ) ( not ( = ?auto_265335 ?auto_265340 ) ) ( not ( = ?auto_265336 ?auto_265337 ) ) ( not ( = ?auto_265336 ?auto_265338 ) ) ( not ( = ?auto_265336 ?auto_265339 ) ) ( not ( = ?auto_265336 ?auto_265340 ) ) ( not ( = ?auto_265337 ?auto_265338 ) ) ( not ( = ?auto_265337 ?auto_265339 ) ) ( not ( = ?auto_265337 ?auto_265340 ) ) ( not ( = ?auto_265338 ?auto_265339 ) ) ( not ( = ?auto_265338 ?auto_265340 ) ) ( not ( = ?auto_265339 ?auto_265340 ) ) ( ON ?auto_265338 ?auto_265339 ) ( ON ?auto_265337 ?auto_265338 ) ( ON ?auto_265336 ?auto_265337 ) ( ON ?auto_265335 ?auto_265336 ) ( ON ?auto_265334 ?auto_265335 ) ( CLEAR ?auto_265332 ) ( ON ?auto_265333 ?auto_265334 ) ( CLEAR ?auto_265333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_265332 ?auto_265333 )
      ( MAKE-8PILE ?auto_265332 ?auto_265333 ?auto_265334 ?auto_265335 ?auto_265336 ?auto_265337 ?auto_265338 ?auto_265339 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265366 - BLOCK
      ?auto_265367 - BLOCK
      ?auto_265368 - BLOCK
      ?auto_265369 - BLOCK
      ?auto_265370 - BLOCK
      ?auto_265371 - BLOCK
      ?auto_265372 - BLOCK
      ?auto_265373 - BLOCK
    )
    :vars
    (
      ?auto_265374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265373 ?auto_265374 ) ( not ( = ?auto_265366 ?auto_265367 ) ) ( not ( = ?auto_265366 ?auto_265368 ) ) ( not ( = ?auto_265366 ?auto_265369 ) ) ( not ( = ?auto_265366 ?auto_265370 ) ) ( not ( = ?auto_265366 ?auto_265371 ) ) ( not ( = ?auto_265366 ?auto_265372 ) ) ( not ( = ?auto_265366 ?auto_265373 ) ) ( not ( = ?auto_265366 ?auto_265374 ) ) ( not ( = ?auto_265367 ?auto_265368 ) ) ( not ( = ?auto_265367 ?auto_265369 ) ) ( not ( = ?auto_265367 ?auto_265370 ) ) ( not ( = ?auto_265367 ?auto_265371 ) ) ( not ( = ?auto_265367 ?auto_265372 ) ) ( not ( = ?auto_265367 ?auto_265373 ) ) ( not ( = ?auto_265367 ?auto_265374 ) ) ( not ( = ?auto_265368 ?auto_265369 ) ) ( not ( = ?auto_265368 ?auto_265370 ) ) ( not ( = ?auto_265368 ?auto_265371 ) ) ( not ( = ?auto_265368 ?auto_265372 ) ) ( not ( = ?auto_265368 ?auto_265373 ) ) ( not ( = ?auto_265368 ?auto_265374 ) ) ( not ( = ?auto_265369 ?auto_265370 ) ) ( not ( = ?auto_265369 ?auto_265371 ) ) ( not ( = ?auto_265369 ?auto_265372 ) ) ( not ( = ?auto_265369 ?auto_265373 ) ) ( not ( = ?auto_265369 ?auto_265374 ) ) ( not ( = ?auto_265370 ?auto_265371 ) ) ( not ( = ?auto_265370 ?auto_265372 ) ) ( not ( = ?auto_265370 ?auto_265373 ) ) ( not ( = ?auto_265370 ?auto_265374 ) ) ( not ( = ?auto_265371 ?auto_265372 ) ) ( not ( = ?auto_265371 ?auto_265373 ) ) ( not ( = ?auto_265371 ?auto_265374 ) ) ( not ( = ?auto_265372 ?auto_265373 ) ) ( not ( = ?auto_265372 ?auto_265374 ) ) ( not ( = ?auto_265373 ?auto_265374 ) ) ( ON ?auto_265372 ?auto_265373 ) ( ON ?auto_265371 ?auto_265372 ) ( ON ?auto_265370 ?auto_265371 ) ( ON ?auto_265369 ?auto_265370 ) ( ON ?auto_265368 ?auto_265369 ) ( ON ?auto_265367 ?auto_265368 ) ( ON ?auto_265366 ?auto_265367 ) ( CLEAR ?auto_265366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_265366 )
      ( MAKE-8PILE ?auto_265366 ?auto_265367 ?auto_265368 ?auto_265369 ?auto_265370 ?auto_265371 ?auto_265372 ?auto_265373 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265401 - BLOCK
      ?auto_265402 - BLOCK
      ?auto_265403 - BLOCK
      ?auto_265404 - BLOCK
      ?auto_265405 - BLOCK
      ?auto_265406 - BLOCK
      ?auto_265407 - BLOCK
      ?auto_265408 - BLOCK
      ?auto_265409 - BLOCK
    )
    :vars
    (
      ?auto_265410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_265408 ) ( ON ?auto_265409 ?auto_265410 ) ( CLEAR ?auto_265409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_265401 ) ( ON ?auto_265402 ?auto_265401 ) ( ON ?auto_265403 ?auto_265402 ) ( ON ?auto_265404 ?auto_265403 ) ( ON ?auto_265405 ?auto_265404 ) ( ON ?auto_265406 ?auto_265405 ) ( ON ?auto_265407 ?auto_265406 ) ( ON ?auto_265408 ?auto_265407 ) ( not ( = ?auto_265401 ?auto_265402 ) ) ( not ( = ?auto_265401 ?auto_265403 ) ) ( not ( = ?auto_265401 ?auto_265404 ) ) ( not ( = ?auto_265401 ?auto_265405 ) ) ( not ( = ?auto_265401 ?auto_265406 ) ) ( not ( = ?auto_265401 ?auto_265407 ) ) ( not ( = ?auto_265401 ?auto_265408 ) ) ( not ( = ?auto_265401 ?auto_265409 ) ) ( not ( = ?auto_265401 ?auto_265410 ) ) ( not ( = ?auto_265402 ?auto_265403 ) ) ( not ( = ?auto_265402 ?auto_265404 ) ) ( not ( = ?auto_265402 ?auto_265405 ) ) ( not ( = ?auto_265402 ?auto_265406 ) ) ( not ( = ?auto_265402 ?auto_265407 ) ) ( not ( = ?auto_265402 ?auto_265408 ) ) ( not ( = ?auto_265402 ?auto_265409 ) ) ( not ( = ?auto_265402 ?auto_265410 ) ) ( not ( = ?auto_265403 ?auto_265404 ) ) ( not ( = ?auto_265403 ?auto_265405 ) ) ( not ( = ?auto_265403 ?auto_265406 ) ) ( not ( = ?auto_265403 ?auto_265407 ) ) ( not ( = ?auto_265403 ?auto_265408 ) ) ( not ( = ?auto_265403 ?auto_265409 ) ) ( not ( = ?auto_265403 ?auto_265410 ) ) ( not ( = ?auto_265404 ?auto_265405 ) ) ( not ( = ?auto_265404 ?auto_265406 ) ) ( not ( = ?auto_265404 ?auto_265407 ) ) ( not ( = ?auto_265404 ?auto_265408 ) ) ( not ( = ?auto_265404 ?auto_265409 ) ) ( not ( = ?auto_265404 ?auto_265410 ) ) ( not ( = ?auto_265405 ?auto_265406 ) ) ( not ( = ?auto_265405 ?auto_265407 ) ) ( not ( = ?auto_265405 ?auto_265408 ) ) ( not ( = ?auto_265405 ?auto_265409 ) ) ( not ( = ?auto_265405 ?auto_265410 ) ) ( not ( = ?auto_265406 ?auto_265407 ) ) ( not ( = ?auto_265406 ?auto_265408 ) ) ( not ( = ?auto_265406 ?auto_265409 ) ) ( not ( = ?auto_265406 ?auto_265410 ) ) ( not ( = ?auto_265407 ?auto_265408 ) ) ( not ( = ?auto_265407 ?auto_265409 ) ) ( not ( = ?auto_265407 ?auto_265410 ) ) ( not ( = ?auto_265408 ?auto_265409 ) ) ( not ( = ?auto_265408 ?auto_265410 ) ) ( not ( = ?auto_265409 ?auto_265410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_265409 ?auto_265410 )
      ( !STACK ?auto_265409 ?auto_265408 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265439 - BLOCK
      ?auto_265440 - BLOCK
      ?auto_265441 - BLOCK
      ?auto_265442 - BLOCK
      ?auto_265443 - BLOCK
      ?auto_265444 - BLOCK
      ?auto_265445 - BLOCK
      ?auto_265446 - BLOCK
      ?auto_265447 - BLOCK
    )
    :vars
    (
      ?auto_265448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265447 ?auto_265448 ) ( ON-TABLE ?auto_265439 ) ( ON ?auto_265440 ?auto_265439 ) ( ON ?auto_265441 ?auto_265440 ) ( ON ?auto_265442 ?auto_265441 ) ( ON ?auto_265443 ?auto_265442 ) ( ON ?auto_265444 ?auto_265443 ) ( ON ?auto_265445 ?auto_265444 ) ( not ( = ?auto_265439 ?auto_265440 ) ) ( not ( = ?auto_265439 ?auto_265441 ) ) ( not ( = ?auto_265439 ?auto_265442 ) ) ( not ( = ?auto_265439 ?auto_265443 ) ) ( not ( = ?auto_265439 ?auto_265444 ) ) ( not ( = ?auto_265439 ?auto_265445 ) ) ( not ( = ?auto_265439 ?auto_265446 ) ) ( not ( = ?auto_265439 ?auto_265447 ) ) ( not ( = ?auto_265439 ?auto_265448 ) ) ( not ( = ?auto_265440 ?auto_265441 ) ) ( not ( = ?auto_265440 ?auto_265442 ) ) ( not ( = ?auto_265440 ?auto_265443 ) ) ( not ( = ?auto_265440 ?auto_265444 ) ) ( not ( = ?auto_265440 ?auto_265445 ) ) ( not ( = ?auto_265440 ?auto_265446 ) ) ( not ( = ?auto_265440 ?auto_265447 ) ) ( not ( = ?auto_265440 ?auto_265448 ) ) ( not ( = ?auto_265441 ?auto_265442 ) ) ( not ( = ?auto_265441 ?auto_265443 ) ) ( not ( = ?auto_265441 ?auto_265444 ) ) ( not ( = ?auto_265441 ?auto_265445 ) ) ( not ( = ?auto_265441 ?auto_265446 ) ) ( not ( = ?auto_265441 ?auto_265447 ) ) ( not ( = ?auto_265441 ?auto_265448 ) ) ( not ( = ?auto_265442 ?auto_265443 ) ) ( not ( = ?auto_265442 ?auto_265444 ) ) ( not ( = ?auto_265442 ?auto_265445 ) ) ( not ( = ?auto_265442 ?auto_265446 ) ) ( not ( = ?auto_265442 ?auto_265447 ) ) ( not ( = ?auto_265442 ?auto_265448 ) ) ( not ( = ?auto_265443 ?auto_265444 ) ) ( not ( = ?auto_265443 ?auto_265445 ) ) ( not ( = ?auto_265443 ?auto_265446 ) ) ( not ( = ?auto_265443 ?auto_265447 ) ) ( not ( = ?auto_265443 ?auto_265448 ) ) ( not ( = ?auto_265444 ?auto_265445 ) ) ( not ( = ?auto_265444 ?auto_265446 ) ) ( not ( = ?auto_265444 ?auto_265447 ) ) ( not ( = ?auto_265444 ?auto_265448 ) ) ( not ( = ?auto_265445 ?auto_265446 ) ) ( not ( = ?auto_265445 ?auto_265447 ) ) ( not ( = ?auto_265445 ?auto_265448 ) ) ( not ( = ?auto_265446 ?auto_265447 ) ) ( not ( = ?auto_265446 ?auto_265448 ) ) ( not ( = ?auto_265447 ?auto_265448 ) ) ( CLEAR ?auto_265445 ) ( ON ?auto_265446 ?auto_265447 ) ( CLEAR ?auto_265446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_265439 ?auto_265440 ?auto_265441 ?auto_265442 ?auto_265443 ?auto_265444 ?auto_265445 ?auto_265446 )
      ( MAKE-9PILE ?auto_265439 ?auto_265440 ?auto_265441 ?auto_265442 ?auto_265443 ?auto_265444 ?auto_265445 ?auto_265446 ?auto_265447 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265477 - BLOCK
      ?auto_265478 - BLOCK
      ?auto_265479 - BLOCK
      ?auto_265480 - BLOCK
      ?auto_265481 - BLOCK
      ?auto_265482 - BLOCK
      ?auto_265483 - BLOCK
      ?auto_265484 - BLOCK
      ?auto_265485 - BLOCK
    )
    :vars
    (
      ?auto_265486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265485 ?auto_265486 ) ( ON-TABLE ?auto_265477 ) ( ON ?auto_265478 ?auto_265477 ) ( ON ?auto_265479 ?auto_265478 ) ( ON ?auto_265480 ?auto_265479 ) ( ON ?auto_265481 ?auto_265480 ) ( ON ?auto_265482 ?auto_265481 ) ( not ( = ?auto_265477 ?auto_265478 ) ) ( not ( = ?auto_265477 ?auto_265479 ) ) ( not ( = ?auto_265477 ?auto_265480 ) ) ( not ( = ?auto_265477 ?auto_265481 ) ) ( not ( = ?auto_265477 ?auto_265482 ) ) ( not ( = ?auto_265477 ?auto_265483 ) ) ( not ( = ?auto_265477 ?auto_265484 ) ) ( not ( = ?auto_265477 ?auto_265485 ) ) ( not ( = ?auto_265477 ?auto_265486 ) ) ( not ( = ?auto_265478 ?auto_265479 ) ) ( not ( = ?auto_265478 ?auto_265480 ) ) ( not ( = ?auto_265478 ?auto_265481 ) ) ( not ( = ?auto_265478 ?auto_265482 ) ) ( not ( = ?auto_265478 ?auto_265483 ) ) ( not ( = ?auto_265478 ?auto_265484 ) ) ( not ( = ?auto_265478 ?auto_265485 ) ) ( not ( = ?auto_265478 ?auto_265486 ) ) ( not ( = ?auto_265479 ?auto_265480 ) ) ( not ( = ?auto_265479 ?auto_265481 ) ) ( not ( = ?auto_265479 ?auto_265482 ) ) ( not ( = ?auto_265479 ?auto_265483 ) ) ( not ( = ?auto_265479 ?auto_265484 ) ) ( not ( = ?auto_265479 ?auto_265485 ) ) ( not ( = ?auto_265479 ?auto_265486 ) ) ( not ( = ?auto_265480 ?auto_265481 ) ) ( not ( = ?auto_265480 ?auto_265482 ) ) ( not ( = ?auto_265480 ?auto_265483 ) ) ( not ( = ?auto_265480 ?auto_265484 ) ) ( not ( = ?auto_265480 ?auto_265485 ) ) ( not ( = ?auto_265480 ?auto_265486 ) ) ( not ( = ?auto_265481 ?auto_265482 ) ) ( not ( = ?auto_265481 ?auto_265483 ) ) ( not ( = ?auto_265481 ?auto_265484 ) ) ( not ( = ?auto_265481 ?auto_265485 ) ) ( not ( = ?auto_265481 ?auto_265486 ) ) ( not ( = ?auto_265482 ?auto_265483 ) ) ( not ( = ?auto_265482 ?auto_265484 ) ) ( not ( = ?auto_265482 ?auto_265485 ) ) ( not ( = ?auto_265482 ?auto_265486 ) ) ( not ( = ?auto_265483 ?auto_265484 ) ) ( not ( = ?auto_265483 ?auto_265485 ) ) ( not ( = ?auto_265483 ?auto_265486 ) ) ( not ( = ?auto_265484 ?auto_265485 ) ) ( not ( = ?auto_265484 ?auto_265486 ) ) ( not ( = ?auto_265485 ?auto_265486 ) ) ( ON ?auto_265484 ?auto_265485 ) ( CLEAR ?auto_265482 ) ( ON ?auto_265483 ?auto_265484 ) ( CLEAR ?auto_265483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_265477 ?auto_265478 ?auto_265479 ?auto_265480 ?auto_265481 ?auto_265482 ?auto_265483 )
      ( MAKE-9PILE ?auto_265477 ?auto_265478 ?auto_265479 ?auto_265480 ?auto_265481 ?auto_265482 ?auto_265483 ?auto_265484 ?auto_265485 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265515 - BLOCK
      ?auto_265516 - BLOCK
      ?auto_265517 - BLOCK
      ?auto_265518 - BLOCK
      ?auto_265519 - BLOCK
      ?auto_265520 - BLOCK
      ?auto_265521 - BLOCK
      ?auto_265522 - BLOCK
      ?auto_265523 - BLOCK
    )
    :vars
    (
      ?auto_265524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265523 ?auto_265524 ) ( ON-TABLE ?auto_265515 ) ( ON ?auto_265516 ?auto_265515 ) ( ON ?auto_265517 ?auto_265516 ) ( ON ?auto_265518 ?auto_265517 ) ( ON ?auto_265519 ?auto_265518 ) ( not ( = ?auto_265515 ?auto_265516 ) ) ( not ( = ?auto_265515 ?auto_265517 ) ) ( not ( = ?auto_265515 ?auto_265518 ) ) ( not ( = ?auto_265515 ?auto_265519 ) ) ( not ( = ?auto_265515 ?auto_265520 ) ) ( not ( = ?auto_265515 ?auto_265521 ) ) ( not ( = ?auto_265515 ?auto_265522 ) ) ( not ( = ?auto_265515 ?auto_265523 ) ) ( not ( = ?auto_265515 ?auto_265524 ) ) ( not ( = ?auto_265516 ?auto_265517 ) ) ( not ( = ?auto_265516 ?auto_265518 ) ) ( not ( = ?auto_265516 ?auto_265519 ) ) ( not ( = ?auto_265516 ?auto_265520 ) ) ( not ( = ?auto_265516 ?auto_265521 ) ) ( not ( = ?auto_265516 ?auto_265522 ) ) ( not ( = ?auto_265516 ?auto_265523 ) ) ( not ( = ?auto_265516 ?auto_265524 ) ) ( not ( = ?auto_265517 ?auto_265518 ) ) ( not ( = ?auto_265517 ?auto_265519 ) ) ( not ( = ?auto_265517 ?auto_265520 ) ) ( not ( = ?auto_265517 ?auto_265521 ) ) ( not ( = ?auto_265517 ?auto_265522 ) ) ( not ( = ?auto_265517 ?auto_265523 ) ) ( not ( = ?auto_265517 ?auto_265524 ) ) ( not ( = ?auto_265518 ?auto_265519 ) ) ( not ( = ?auto_265518 ?auto_265520 ) ) ( not ( = ?auto_265518 ?auto_265521 ) ) ( not ( = ?auto_265518 ?auto_265522 ) ) ( not ( = ?auto_265518 ?auto_265523 ) ) ( not ( = ?auto_265518 ?auto_265524 ) ) ( not ( = ?auto_265519 ?auto_265520 ) ) ( not ( = ?auto_265519 ?auto_265521 ) ) ( not ( = ?auto_265519 ?auto_265522 ) ) ( not ( = ?auto_265519 ?auto_265523 ) ) ( not ( = ?auto_265519 ?auto_265524 ) ) ( not ( = ?auto_265520 ?auto_265521 ) ) ( not ( = ?auto_265520 ?auto_265522 ) ) ( not ( = ?auto_265520 ?auto_265523 ) ) ( not ( = ?auto_265520 ?auto_265524 ) ) ( not ( = ?auto_265521 ?auto_265522 ) ) ( not ( = ?auto_265521 ?auto_265523 ) ) ( not ( = ?auto_265521 ?auto_265524 ) ) ( not ( = ?auto_265522 ?auto_265523 ) ) ( not ( = ?auto_265522 ?auto_265524 ) ) ( not ( = ?auto_265523 ?auto_265524 ) ) ( ON ?auto_265522 ?auto_265523 ) ( ON ?auto_265521 ?auto_265522 ) ( CLEAR ?auto_265519 ) ( ON ?auto_265520 ?auto_265521 ) ( CLEAR ?auto_265520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_265515 ?auto_265516 ?auto_265517 ?auto_265518 ?auto_265519 ?auto_265520 )
      ( MAKE-9PILE ?auto_265515 ?auto_265516 ?auto_265517 ?auto_265518 ?auto_265519 ?auto_265520 ?auto_265521 ?auto_265522 ?auto_265523 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265553 - BLOCK
      ?auto_265554 - BLOCK
      ?auto_265555 - BLOCK
      ?auto_265556 - BLOCK
      ?auto_265557 - BLOCK
      ?auto_265558 - BLOCK
      ?auto_265559 - BLOCK
      ?auto_265560 - BLOCK
      ?auto_265561 - BLOCK
    )
    :vars
    (
      ?auto_265562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265561 ?auto_265562 ) ( ON-TABLE ?auto_265553 ) ( ON ?auto_265554 ?auto_265553 ) ( ON ?auto_265555 ?auto_265554 ) ( ON ?auto_265556 ?auto_265555 ) ( not ( = ?auto_265553 ?auto_265554 ) ) ( not ( = ?auto_265553 ?auto_265555 ) ) ( not ( = ?auto_265553 ?auto_265556 ) ) ( not ( = ?auto_265553 ?auto_265557 ) ) ( not ( = ?auto_265553 ?auto_265558 ) ) ( not ( = ?auto_265553 ?auto_265559 ) ) ( not ( = ?auto_265553 ?auto_265560 ) ) ( not ( = ?auto_265553 ?auto_265561 ) ) ( not ( = ?auto_265553 ?auto_265562 ) ) ( not ( = ?auto_265554 ?auto_265555 ) ) ( not ( = ?auto_265554 ?auto_265556 ) ) ( not ( = ?auto_265554 ?auto_265557 ) ) ( not ( = ?auto_265554 ?auto_265558 ) ) ( not ( = ?auto_265554 ?auto_265559 ) ) ( not ( = ?auto_265554 ?auto_265560 ) ) ( not ( = ?auto_265554 ?auto_265561 ) ) ( not ( = ?auto_265554 ?auto_265562 ) ) ( not ( = ?auto_265555 ?auto_265556 ) ) ( not ( = ?auto_265555 ?auto_265557 ) ) ( not ( = ?auto_265555 ?auto_265558 ) ) ( not ( = ?auto_265555 ?auto_265559 ) ) ( not ( = ?auto_265555 ?auto_265560 ) ) ( not ( = ?auto_265555 ?auto_265561 ) ) ( not ( = ?auto_265555 ?auto_265562 ) ) ( not ( = ?auto_265556 ?auto_265557 ) ) ( not ( = ?auto_265556 ?auto_265558 ) ) ( not ( = ?auto_265556 ?auto_265559 ) ) ( not ( = ?auto_265556 ?auto_265560 ) ) ( not ( = ?auto_265556 ?auto_265561 ) ) ( not ( = ?auto_265556 ?auto_265562 ) ) ( not ( = ?auto_265557 ?auto_265558 ) ) ( not ( = ?auto_265557 ?auto_265559 ) ) ( not ( = ?auto_265557 ?auto_265560 ) ) ( not ( = ?auto_265557 ?auto_265561 ) ) ( not ( = ?auto_265557 ?auto_265562 ) ) ( not ( = ?auto_265558 ?auto_265559 ) ) ( not ( = ?auto_265558 ?auto_265560 ) ) ( not ( = ?auto_265558 ?auto_265561 ) ) ( not ( = ?auto_265558 ?auto_265562 ) ) ( not ( = ?auto_265559 ?auto_265560 ) ) ( not ( = ?auto_265559 ?auto_265561 ) ) ( not ( = ?auto_265559 ?auto_265562 ) ) ( not ( = ?auto_265560 ?auto_265561 ) ) ( not ( = ?auto_265560 ?auto_265562 ) ) ( not ( = ?auto_265561 ?auto_265562 ) ) ( ON ?auto_265560 ?auto_265561 ) ( ON ?auto_265559 ?auto_265560 ) ( ON ?auto_265558 ?auto_265559 ) ( CLEAR ?auto_265556 ) ( ON ?auto_265557 ?auto_265558 ) ( CLEAR ?auto_265557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_265553 ?auto_265554 ?auto_265555 ?auto_265556 ?auto_265557 )
      ( MAKE-9PILE ?auto_265553 ?auto_265554 ?auto_265555 ?auto_265556 ?auto_265557 ?auto_265558 ?auto_265559 ?auto_265560 ?auto_265561 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265591 - BLOCK
      ?auto_265592 - BLOCK
      ?auto_265593 - BLOCK
      ?auto_265594 - BLOCK
      ?auto_265595 - BLOCK
      ?auto_265596 - BLOCK
      ?auto_265597 - BLOCK
      ?auto_265598 - BLOCK
      ?auto_265599 - BLOCK
    )
    :vars
    (
      ?auto_265600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265599 ?auto_265600 ) ( ON-TABLE ?auto_265591 ) ( ON ?auto_265592 ?auto_265591 ) ( ON ?auto_265593 ?auto_265592 ) ( not ( = ?auto_265591 ?auto_265592 ) ) ( not ( = ?auto_265591 ?auto_265593 ) ) ( not ( = ?auto_265591 ?auto_265594 ) ) ( not ( = ?auto_265591 ?auto_265595 ) ) ( not ( = ?auto_265591 ?auto_265596 ) ) ( not ( = ?auto_265591 ?auto_265597 ) ) ( not ( = ?auto_265591 ?auto_265598 ) ) ( not ( = ?auto_265591 ?auto_265599 ) ) ( not ( = ?auto_265591 ?auto_265600 ) ) ( not ( = ?auto_265592 ?auto_265593 ) ) ( not ( = ?auto_265592 ?auto_265594 ) ) ( not ( = ?auto_265592 ?auto_265595 ) ) ( not ( = ?auto_265592 ?auto_265596 ) ) ( not ( = ?auto_265592 ?auto_265597 ) ) ( not ( = ?auto_265592 ?auto_265598 ) ) ( not ( = ?auto_265592 ?auto_265599 ) ) ( not ( = ?auto_265592 ?auto_265600 ) ) ( not ( = ?auto_265593 ?auto_265594 ) ) ( not ( = ?auto_265593 ?auto_265595 ) ) ( not ( = ?auto_265593 ?auto_265596 ) ) ( not ( = ?auto_265593 ?auto_265597 ) ) ( not ( = ?auto_265593 ?auto_265598 ) ) ( not ( = ?auto_265593 ?auto_265599 ) ) ( not ( = ?auto_265593 ?auto_265600 ) ) ( not ( = ?auto_265594 ?auto_265595 ) ) ( not ( = ?auto_265594 ?auto_265596 ) ) ( not ( = ?auto_265594 ?auto_265597 ) ) ( not ( = ?auto_265594 ?auto_265598 ) ) ( not ( = ?auto_265594 ?auto_265599 ) ) ( not ( = ?auto_265594 ?auto_265600 ) ) ( not ( = ?auto_265595 ?auto_265596 ) ) ( not ( = ?auto_265595 ?auto_265597 ) ) ( not ( = ?auto_265595 ?auto_265598 ) ) ( not ( = ?auto_265595 ?auto_265599 ) ) ( not ( = ?auto_265595 ?auto_265600 ) ) ( not ( = ?auto_265596 ?auto_265597 ) ) ( not ( = ?auto_265596 ?auto_265598 ) ) ( not ( = ?auto_265596 ?auto_265599 ) ) ( not ( = ?auto_265596 ?auto_265600 ) ) ( not ( = ?auto_265597 ?auto_265598 ) ) ( not ( = ?auto_265597 ?auto_265599 ) ) ( not ( = ?auto_265597 ?auto_265600 ) ) ( not ( = ?auto_265598 ?auto_265599 ) ) ( not ( = ?auto_265598 ?auto_265600 ) ) ( not ( = ?auto_265599 ?auto_265600 ) ) ( ON ?auto_265598 ?auto_265599 ) ( ON ?auto_265597 ?auto_265598 ) ( ON ?auto_265596 ?auto_265597 ) ( ON ?auto_265595 ?auto_265596 ) ( CLEAR ?auto_265593 ) ( ON ?auto_265594 ?auto_265595 ) ( CLEAR ?auto_265594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_265591 ?auto_265592 ?auto_265593 ?auto_265594 )
      ( MAKE-9PILE ?auto_265591 ?auto_265592 ?auto_265593 ?auto_265594 ?auto_265595 ?auto_265596 ?auto_265597 ?auto_265598 ?auto_265599 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265629 - BLOCK
      ?auto_265630 - BLOCK
      ?auto_265631 - BLOCK
      ?auto_265632 - BLOCK
      ?auto_265633 - BLOCK
      ?auto_265634 - BLOCK
      ?auto_265635 - BLOCK
      ?auto_265636 - BLOCK
      ?auto_265637 - BLOCK
    )
    :vars
    (
      ?auto_265638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265637 ?auto_265638 ) ( ON-TABLE ?auto_265629 ) ( ON ?auto_265630 ?auto_265629 ) ( not ( = ?auto_265629 ?auto_265630 ) ) ( not ( = ?auto_265629 ?auto_265631 ) ) ( not ( = ?auto_265629 ?auto_265632 ) ) ( not ( = ?auto_265629 ?auto_265633 ) ) ( not ( = ?auto_265629 ?auto_265634 ) ) ( not ( = ?auto_265629 ?auto_265635 ) ) ( not ( = ?auto_265629 ?auto_265636 ) ) ( not ( = ?auto_265629 ?auto_265637 ) ) ( not ( = ?auto_265629 ?auto_265638 ) ) ( not ( = ?auto_265630 ?auto_265631 ) ) ( not ( = ?auto_265630 ?auto_265632 ) ) ( not ( = ?auto_265630 ?auto_265633 ) ) ( not ( = ?auto_265630 ?auto_265634 ) ) ( not ( = ?auto_265630 ?auto_265635 ) ) ( not ( = ?auto_265630 ?auto_265636 ) ) ( not ( = ?auto_265630 ?auto_265637 ) ) ( not ( = ?auto_265630 ?auto_265638 ) ) ( not ( = ?auto_265631 ?auto_265632 ) ) ( not ( = ?auto_265631 ?auto_265633 ) ) ( not ( = ?auto_265631 ?auto_265634 ) ) ( not ( = ?auto_265631 ?auto_265635 ) ) ( not ( = ?auto_265631 ?auto_265636 ) ) ( not ( = ?auto_265631 ?auto_265637 ) ) ( not ( = ?auto_265631 ?auto_265638 ) ) ( not ( = ?auto_265632 ?auto_265633 ) ) ( not ( = ?auto_265632 ?auto_265634 ) ) ( not ( = ?auto_265632 ?auto_265635 ) ) ( not ( = ?auto_265632 ?auto_265636 ) ) ( not ( = ?auto_265632 ?auto_265637 ) ) ( not ( = ?auto_265632 ?auto_265638 ) ) ( not ( = ?auto_265633 ?auto_265634 ) ) ( not ( = ?auto_265633 ?auto_265635 ) ) ( not ( = ?auto_265633 ?auto_265636 ) ) ( not ( = ?auto_265633 ?auto_265637 ) ) ( not ( = ?auto_265633 ?auto_265638 ) ) ( not ( = ?auto_265634 ?auto_265635 ) ) ( not ( = ?auto_265634 ?auto_265636 ) ) ( not ( = ?auto_265634 ?auto_265637 ) ) ( not ( = ?auto_265634 ?auto_265638 ) ) ( not ( = ?auto_265635 ?auto_265636 ) ) ( not ( = ?auto_265635 ?auto_265637 ) ) ( not ( = ?auto_265635 ?auto_265638 ) ) ( not ( = ?auto_265636 ?auto_265637 ) ) ( not ( = ?auto_265636 ?auto_265638 ) ) ( not ( = ?auto_265637 ?auto_265638 ) ) ( ON ?auto_265636 ?auto_265637 ) ( ON ?auto_265635 ?auto_265636 ) ( ON ?auto_265634 ?auto_265635 ) ( ON ?auto_265633 ?auto_265634 ) ( ON ?auto_265632 ?auto_265633 ) ( CLEAR ?auto_265630 ) ( ON ?auto_265631 ?auto_265632 ) ( CLEAR ?auto_265631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_265629 ?auto_265630 ?auto_265631 )
      ( MAKE-9PILE ?auto_265629 ?auto_265630 ?auto_265631 ?auto_265632 ?auto_265633 ?auto_265634 ?auto_265635 ?auto_265636 ?auto_265637 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265667 - BLOCK
      ?auto_265668 - BLOCK
      ?auto_265669 - BLOCK
      ?auto_265670 - BLOCK
      ?auto_265671 - BLOCK
      ?auto_265672 - BLOCK
      ?auto_265673 - BLOCK
      ?auto_265674 - BLOCK
      ?auto_265675 - BLOCK
    )
    :vars
    (
      ?auto_265676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265675 ?auto_265676 ) ( ON-TABLE ?auto_265667 ) ( not ( = ?auto_265667 ?auto_265668 ) ) ( not ( = ?auto_265667 ?auto_265669 ) ) ( not ( = ?auto_265667 ?auto_265670 ) ) ( not ( = ?auto_265667 ?auto_265671 ) ) ( not ( = ?auto_265667 ?auto_265672 ) ) ( not ( = ?auto_265667 ?auto_265673 ) ) ( not ( = ?auto_265667 ?auto_265674 ) ) ( not ( = ?auto_265667 ?auto_265675 ) ) ( not ( = ?auto_265667 ?auto_265676 ) ) ( not ( = ?auto_265668 ?auto_265669 ) ) ( not ( = ?auto_265668 ?auto_265670 ) ) ( not ( = ?auto_265668 ?auto_265671 ) ) ( not ( = ?auto_265668 ?auto_265672 ) ) ( not ( = ?auto_265668 ?auto_265673 ) ) ( not ( = ?auto_265668 ?auto_265674 ) ) ( not ( = ?auto_265668 ?auto_265675 ) ) ( not ( = ?auto_265668 ?auto_265676 ) ) ( not ( = ?auto_265669 ?auto_265670 ) ) ( not ( = ?auto_265669 ?auto_265671 ) ) ( not ( = ?auto_265669 ?auto_265672 ) ) ( not ( = ?auto_265669 ?auto_265673 ) ) ( not ( = ?auto_265669 ?auto_265674 ) ) ( not ( = ?auto_265669 ?auto_265675 ) ) ( not ( = ?auto_265669 ?auto_265676 ) ) ( not ( = ?auto_265670 ?auto_265671 ) ) ( not ( = ?auto_265670 ?auto_265672 ) ) ( not ( = ?auto_265670 ?auto_265673 ) ) ( not ( = ?auto_265670 ?auto_265674 ) ) ( not ( = ?auto_265670 ?auto_265675 ) ) ( not ( = ?auto_265670 ?auto_265676 ) ) ( not ( = ?auto_265671 ?auto_265672 ) ) ( not ( = ?auto_265671 ?auto_265673 ) ) ( not ( = ?auto_265671 ?auto_265674 ) ) ( not ( = ?auto_265671 ?auto_265675 ) ) ( not ( = ?auto_265671 ?auto_265676 ) ) ( not ( = ?auto_265672 ?auto_265673 ) ) ( not ( = ?auto_265672 ?auto_265674 ) ) ( not ( = ?auto_265672 ?auto_265675 ) ) ( not ( = ?auto_265672 ?auto_265676 ) ) ( not ( = ?auto_265673 ?auto_265674 ) ) ( not ( = ?auto_265673 ?auto_265675 ) ) ( not ( = ?auto_265673 ?auto_265676 ) ) ( not ( = ?auto_265674 ?auto_265675 ) ) ( not ( = ?auto_265674 ?auto_265676 ) ) ( not ( = ?auto_265675 ?auto_265676 ) ) ( ON ?auto_265674 ?auto_265675 ) ( ON ?auto_265673 ?auto_265674 ) ( ON ?auto_265672 ?auto_265673 ) ( ON ?auto_265671 ?auto_265672 ) ( ON ?auto_265670 ?auto_265671 ) ( ON ?auto_265669 ?auto_265670 ) ( CLEAR ?auto_265667 ) ( ON ?auto_265668 ?auto_265669 ) ( CLEAR ?auto_265668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_265667 ?auto_265668 )
      ( MAKE-9PILE ?auto_265667 ?auto_265668 ?auto_265669 ?auto_265670 ?auto_265671 ?auto_265672 ?auto_265673 ?auto_265674 ?auto_265675 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265705 - BLOCK
      ?auto_265706 - BLOCK
      ?auto_265707 - BLOCK
      ?auto_265708 - BLOCK
      ?auto_265709 - BLOCK
      ?auto_265710 - BLOCK
      ?auto_265711 - BLOCK
      ?auto_265712 - BLOCK
      ?auto_265713 - BLOCK
    )
    :vars
    (
      ?auto_265714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265713 ?auto_265714 ) ( not ( = ?auto_265705 ?auto_265706 ) ) ( not ( = ?auto_265705 ?auto_265707 ) ) ( not ( = ?auto_265705 ?auto_265708 ) ) ( not ( = ?auto_265705 ?auto_265709 ) ) ( not ( = ?auto_265705 ?auto_265710 ) ) ( not ( = ?auto_265705 ?auto_265711 ) ) ( not ( = ?auto_265705 ?auto_265712 ) ) ( not ( = ?auto_265705 ?auto_265713 ) ) ( not ( = ?auto_265705 ?auto_265714 ) ) ( not ( = ?auto_265706 ?auto_265707 ) ) ( not ( = ?auto_265706 ?auto_265708 ) ) ( not ( = ?auto_265706 ?auto_265709 ) ) ( not ( = ?auto_265706 ?auto_265710 ) ) ( not ( = ?auto_265706 ?auto_265711 ) ) ( not ( = ?auto_265706 ?auto_265712 ) ) ( not ( = ?auto_265706 ?auto_265713 ) ) ( not ( = ?auto_265706 ?auto_265714 ) ) ( not ( = ?auto_265707 ?auto_265708 ) ) ( not ( = ?auto_265707 ?auto_265709 ) ) ( not ( = ?auto_265707 ?auto_265710 ) ) ( not ( = ?auto_265707 ?auto_265711 ) ) ( not ( = ?auto_265707 ?auto_265712 ) ) ( not ( = ?auto_265707 ?auto_265713 ) ) ( not ( = ?auto_265707 ?auto_265714 ) ) ( not ( = ?auto_265708 ?auto_265709 ) ) ( not ( = ?auto_265708 ?auto_265710 ) ) ( not ( = ?auto_265708 ?auto_265711 ) ) ( not ( = ?auto_265708 ?auto_265712 ) ) ( not ( = ?auto_265708 ?auto_265713 ) ) ( not ( = ?auto_265708 ?auto_265714 ) ) ( not ( = ?auto_265709 ?auto_265710 ) ) ( not ( = ?auto_265709 ?auto_265711 ) ) ( not ( = ?auto_265709 ?auto_265712 ) ) ( not ( = ?auto_265709 ?auto_265713 ) ) ( not ( = ?auto_265709 ?auto_265714 ) ) ( not ( = ?auto_265710 ?auto_265711 ) ) ( not ( = ?auto_265710 ?auto_265712 ) ) ( not ( = ?auto_265710 ?auto_265713 ) ) ( not ( = ?auto_265710 ?auto_265714 ) ) ( not ( = ?auto_265711 ?auto_265712 ) ) ( not ( = ?auto_265711 ?auto_265713 ) ) ( not ( = ?auto_265711 ?auto_265714 ) ) ( not ( = ?auto_265712 ?auto_265713 ) ) ( not ( = ?auto_265712 ?auto_265714 ) ) ( not ( = ?auto_265713 ?auto_265714 ) ) ( ON ?auto_265712 ?auto_265713 ) ( ON ?auto_265711 ?auto_265712 ) ( ON ?auto_265710 ?auto_265711 ) ( ON ?auto_265709 ?auto_265710 ) ( ON ?auto_265708 ?auto_265709 ) ( ON ?auto_265707 ?auto_265708 ) ( ON ?auto_265706 ?auto_265707 ) ( ON ?auto_265705 ?auto_265706 ) ( CLEAR ?auto_265705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_265705 )
      ( MAKE-9PILE ?auto_265705 ?auto_265706 ?auto_265707 ?auto_265708 ?auto_265709 ?auto_265710 ?auto_265711 ?auto_265712 ?auto_265713 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265744 - BLOCK
      ?auto_265745 - BLOCK
      ?auto_265746 - BLOCK
      ?auto_265747 - BLOCK
      ?auto_265748 - BLOCK
      ?auto_265749 - BLOCK
      ?auto_265750 - BLOCK
      ?auto_265751 - BLOCK
      ?auto_265752 - BLOCK
      ?auto_265753 - BLOCK
    )
    :vars
    (
      ?auto_265754 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_265752 ) ( ON ?auto_265753 ?auto_265754 ) ( CLEAR ?auto_265753 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_265744 ) ( ON ?auto_265745 ?auto_265744 ) ( ON ?auto_265746 ?auto_265745 ) ( ON ?auto_265747 ?auto_265746 ) ( ON ?auto_265748 ?auto_265747 ) ( ON ?auto_265749 ?auto_265748 ) ( ON ?auto_265750 ?auto_265749 ) ( ON ?auto_265751 ?auto_265750 ) ( ON ?auto_265752 ?auto_265751 ) ( not ( = ?auto_265744 ?auto_265745 ) ) ( not ( = ?auto_265744 ?auto_265746 ) ) ( not ( = ?auto_265744 ?auto_265747 ) ) ( not ( = ?auto_265744 ?auto_265748 ) ) ( not ( = ?auto_265744 ?auto_265749 ) ) ( not ( = ?auto_265744 ?auto_265750 ) ) ( not ( = ?auto_265744 ?auto_265751 ) ) ( not ( = ?auto_265744 ?auto_265752 ) ) ( not ( = ?auto_265744 ?auto_265753 ) ) ( not ( = ?auto_265744 ?auto_265754 ) ) ( not ( = ?auto_265745 ?auto_265746 ) ) ( not ( = ?auto_265745 ?auto_265747 ) ) ( not ( = ?auto_265745 ?auto_265748 ) ) ( not ( = ?auto_265745 ?auto_265749 ) ) ( not ( = ?auto_265745 ?auto_265750 ) ) ( not ( = ?auto_265745 ?auto_265751 ) ) ( not ( = ?auto_265745 ?auto_265752 ) ) ( not ( = ?auto_265745 ?auto_265753 ) ) ( not ( = ?auto_265745 ?auto_265754 ) ) ( not ( = ?auto_265746 ?auto_265747 ) ) ( not ( = ?auto_265746 ?auto_265748 ) ) ( not ( = ?auto_265746 ?auto_265749 ) ) ( not ( = ?auto_265746 ?auto_265750 ) ) ( not ( = ?auto_265746 ?auto_265751 ) ) ( not ( = ?auto_265746 ?auto_265752 ) ) ( not ( = ?auto_265746 ?auto_265753 ) ) ( not ( = ?auto_265746 ?auto_265754 ) ) ( not ( = ?auto_265747 ?auto_265748 ) ) ( not ( = ?auto_265747 ?auto_265749 ) ) ( not ( = ?auto_265747 ?auto_265750 ) ) ( not ( = ?auto_265747 ?auto_265751 ) ) ( not ( = ?auto_265747 ?auto_265752 ) ) ( not ( = ?auto_265747 ?auto_265753 ) ) ( not ( = ?auto_265747 ?auto_265754 ) ) ( not ( = ?auto_265748 ?auto_265749 ) ) ( not ( = ?auto_265748 ?auto_265750 ) ) ( not ( = ?auto_265748 ?auto_265751 ) ) ( not ( = ?auto_265748 ?auto_265752 ) ) ( not ( = ?auto_265748 ?auto_265753 ) ) ( not ( = ?auto_265748 ?auto_265754 ) ) ( not ( = ?auto_265749 ?auto_265750 ) ) ( not ( = ?auto_265749 ?auto_265751 ) ) ( not ( = ?auto_265749 ?auto_265752 ) ) ( not ( = ?auto_265749 ?auto_265753 ) ) ( not ( = ?auto_265749 ?auto_265754 ) ) ( not ( = ?auto_265750 ?auto_265751 ) ) ( not ( = ?auto_265750 ?auto_265752 ) ) ( not ( = ?auto_265750 ?auto_265753 ) ) ( not ( = ?auto_265750 ?auto_265754 ) ) ( not ( = ?auto_265751 ?auto_265752 ) ) ( not ( = ?auto_265751 ?auto_265753 ) ) ( not ( = ?auto_265751 ?auto_265754 ) ) ( not ( = ?auto_265752 ?auto_265753 ) ) ( not ( = ?auto_265752 ?auto_265754 ) ) ( not ( = ?auto_265753 ?auto_265754 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_265753 ?auto_265754 )
      ( !STACK ?auto_265753 ?auto_265752 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265786 - BLOCK
      ?auto_265787 - BLOCK
      ?auto_265788 - BLOCK
      ?auto_265789 - BLOCK
      ?auto_265790 - BLOCK
      ?auto_265791 - BLOCK
      ?auto_265792 - BLOCK
      ?auto_265793 - BLOCK
      ?auto_265794 - BLOCK
      ?auto_265795 - BLOCK
    )
    :vars
    (
      ?auto_265796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265795 ?auto_265796 ) ( ON-TABLE ?auto_265786 ) ( ON ?auto_265787 ?auto_265786 ) ( ON ?auto_265788 ?auto_265787 ) ( ON ?auto_265789 ?auto_265788 ) ( ON ?auto_265790 ?auto_265789 ) ( ON ?auto_265791 ?auto_265790 ) ( ON ?auto_265792 ?auto_265791 ) ( ON ?auto_265793 ?auto_265792 ) ( not ( = ?auto_265786 ?auto_265787 ) ) ( not ( = ?auto_265786 ?auto_265788 ) ) ( not ( = ?auto_265786 ?auto_265789 ) ) ( not ( = ?auto_265786 ?auto_265790 ) ) ( not ( = ?auto_265786 ?auto_265791 ) ) ( not ( = ?auto_265786 ?auto_265792 ) ) ( not ( = ?auto_265786 ?auto_265793 ) ) ( not ( = ?auto_265786 ?auto_265794 ) ) ( not ( = ?auto_265786 ?auto_265795 ) ) ( not ( = ?auto_265786 ?auto_265796 ) ) ( not ( = ?auto_265787 ?auto_265788 ) ) ( not ( = ?auto_265787 ?auto_265789 ) ) ( not ( = ?auto_265787 ?auto_265790 ) ) ( not ( = ?auto_265787 ?auto_265791 ) ) ( not ( = ?auto_265787 ?auto_265792 ) ) ( not ( = ?auto_265787 ?auto_265793 ) ) ( not ( = ?auto_265787 ?auto_265794 ) ) ( not ( = ?auto_265787 ?auto_265795 ) ) ( not ( = ?auto_265787 ?auto_265796 ) ) ( not ( = ?auto_265788 ?auto_265789 ) ) ( not ( = ?auto_265788 ?auto_265790 ) ) ( not ( = ?auto_265788 ?auto_265791 ) ) ( not ( = ?auto_265788 ?auto_265792 ) ) ( not ( = ?auto_265788 ?auto_265793 ) ) ( not ( = ?auto_265788 ?auto_265794 ) ) ( not ( = ?auto_265788 ?auto_265795 ) ) ( not ( = ?auto_265788 ?auto_265796 ) ) ( not ( = ?auto_265789 ?auto_265790 ) ) ( not ( = ?auto_265789 ?auto_265791 ) ) ( not ( = ?auto_265789 ?auto_265792 ) ) ( not ( = ?auto_265789 ?auto_265793 ) ) ( not ( = ?auto_265789 ?auto_265794 ) ) ( not ( = ?auto_265789 ?auto_265795 ) ) ( not ( = ?auto_265789 ?auto_265796 ) ) ( not ( = ?auto_265790 ?auto_265791 ) ) ( not ( = ?auto_265790 ?auto_265792 ) ) ( not ( = ?auto_265790 ?auto_265793 ) ) ( not ( = ?auto_265790 ?auto_265794 ) ) ( not ( = ?auto_265790 ?auto_265795 ) ) ( not ( = ?auto_265790 ?auto_265796 ) ) ( not ( = ?auto_265791 ?auto_265792 ) ) ( not ( = ?auto_265791 ?auto_265793 ) ) ( not ( = ?auto_265791 ?auto_265794 ) ) ( not ( = ?auto_265791 ?auto_265795 ) ) ( not ( = ?auto_265791 ?auto_265796 ) ) ( not ( = ?auto_265792 ?auto_265793 ) ) ( not ( = ?auto_265792 ?auto_265794 ) ) ( not ( = ?auto_265792 ?auto_265795 ) ) ( not ( = ?auto_265792 ?auto_265796 ) ) ( not ( = ?auto_265793 ?auto_265794 ) ) ( not ( = ?auto_265793 ?auto_265795 ) ) ( not ( = ?auto_265793 ?auto_265796 ) ) ( not ( = ?auto_265794 ?auto_265795 ) ) ( not ( = ?auto_265794 ?auto_265796 ) ) ( not ( = ?auto_265795 ?auto_265796 ) ) ( CLEAR ?auto_265793 ) ( ON ?auto_265794 ?auto_265795 ) ( CLEAR ?auto_265794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_265786 ?auto_265787 ?auto_265788 ?auto_265789 ?auto_265790 ?auto_265791 ?auto_265792 ?auto_265793 ?auto_265794 )
      ( MAKE-10PILE ?auto_265786 ?auto_265787 ?auto_265788 ?auto_265789 ?auto_265790 ?auto_265791 ?auto_265792 ?auto_265793 ?auto_265794 ?auto_265795 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265828 - BLOCK
      ?auto_265829 - BLOCK
      ?auto_265830 - BLOCK
      ?auto_265831 - BLOCK
      ?auto_265832 - BLOCK
      ?auto_265833 - BLOCK
      ?auto_265834 - BLOCK
      ?auto_265835 - BLOCK
      ?auto_265836 - BLOCK
      ?auto_265837 - BLOCK
    )
    :vars
    (
      ?auto_265838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265837 ?auto_265838 ) ( ON-TABLE ?auto_265828 ) ( ON ?auto_265829 ?auto_265828 ) ( ON ?auto_265830 ?auto_265829 ) ( ON ?auto_265831 ?auto_265830 ) ( ON ?auto_265832 ?auto_265831 ) ( ON ?auto_265833 ?auto_265832 ) ( ON ?auto_265834 ?auto_265833 ) ( not ( = ?auto_265828 ?auto_265829 ) ) ( not ( = ?auto_265828 ?auto_265830 ) ) ( not ( = ?auto_265828 ?auto_265831 ) ) ( not ( = ?auto_265828 ?auto_265832 ) ) ( not ( = ?auto_265828 ?auto_265833 ) ) ( not ( = ?auto_265828 ?auto_265834 ) ) ( not ( = ?auto_265828 ?auto_265835 ) ) ( not ( = ?auto_265828 ?auto_265836 ) ) ( not ( = ?auto_265828 ?auto_265837 ) ) ( not ( = ?auto_265828 ?auto_265838 ) ) ( not ( = ?auto_265829 ?auto_265830 ) ) ( not ( = ?auto_265829 ?auto_265831 ) ) ( not ( = ?auto_265829 ?auto_265832 ) ) ( not ( = ?auto_265829 ?auto_265833 ) ) ( not ( = ?auto_265829 ?auto_265834 ) ) ( not ( = ?auto_265829 ?auto_265835 ) ) ( not ( = ?auto_265829 ?auto_265836 ) ) ( not ( = ?auto_265829 ?auto_265837 ) ) ( not ( = ?auto_265829 ?auto_265838 ) ) ( not ( = ?auto_265830 ?auto_265831 ) ) ( not ( = ?auto_265830 ?auto_265832 ) ) ( not ( = ?auto_265830 ?auto_265833 ) ) ( not ( = ?auto_265830 ?auto_265834 ) ) ( not ( = ?auto_265830 ?auto_265835 ) ) ( not ( = ?auto_265830 ?auto_265836 ) ) ( not ( = ?auto_265830 ?auto_265837 ) ) ( not ( = ?auto_265830 ?auto_265838 ) ) ( not ( = ?auto_265831 ?auto_265832 ) ) ( not ( = ?auto_265831 ?auto_265833 ) ) ( not ( = ?auto_265831 ?auto_265834 ) ) ( not ( = ?auto_265831 ?auto_265835 ) ) ( not ( = ?auto_265831 ?auto_265836 ) ) ( not ( = ?auto_265831 ?auto_265837 ) ) ( not ( = ?auto_265831 ?auto_265838 ) ) ( not ( = ?auto_265832 ?auto_265833 ) ) ( not ( = ?auto_265832 ?auto_265834 ) ) ( not ( = ?auto_265832 ?auto_265835 ) ) ( not ( = ?auto_265832 ?auto_265836 ) ) ( not ( = ?auto_265832 ?auto_265837 ) ) ( not ( = ?auto_265832 ?auto_265838 ) ) ( not ( = ?auto_265833 ?auto_265834 ) ) ( not ( = ?auto_265833 ?auto_265835 ) ) ( not ( = ?auto_265833 ?auto_265836 ) ) ( not ( = ?auto_265833 ?auto_265837 ) ) ( not ( = ?auto_265833 ?auto_265838 ) ) ( not ( = ?auto_265834 ?auto_265835 ) ) ( not ( = ?auto_265834 ?auto_265836 ) ) ( not ( = ?auto_265834 ?auto_265837 ) ) ( not ( = ?auto_265834 ?auto_265838 ) ) ( not ( = ?auto_265835 ?auto_265836 ) ) ( not ( = ?auto_265835 ?auto_265837 ) ) ( not ( = ?auto_265835 ?auto_265838 ) ) ( not ( = ?auto_265836 ?auto_265837 ) ) ( not ( = ?auto_265836 ?auto_265838 ) ) ( not ( = ?auto_265837 ?auto_265838 ) ) ( ON ?auto_265836 ?auto_265837 ) ( CLEAR ?auto_265834 ) ( ON ?auto_265835 ?auto_265836 ) ( CLEAR ?auto_265835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_265828 ?auto_265829 ?auto_265830 ?auto_265831 ?auto_265832 ?auto_265833 ?auto_265834 ?auto_265835 )
      ( MAKE-10PILE ?auto_265828 ?auto_265829 ?auto_265830 ?auto_265831 ?auto_265832 ?auto_265833 ?auto_265834 ?auto_265835 ?auto_265836 ?auto_265837 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265870 - BLOCK
      ?auto_265871 - BLOCK
      ?auto_265872 - BLOCK
      ?auto_265873 - BLOCK
      ?auto_265874 - BLOCK
      ?auto_265875 - BLOCK
      ?auto_265876 - BLOCK
      ?auto_265877 - BLOCK
      ?auto_265878 - BLOCK
      ?auto_265879 - BLOCK
    )
    :vars
    (
      ?auto_265880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265879 ?auto_265880 ) ( ON-TABLE ?auto_265870 ) ( ON ?auto_265871 ?auto_265870 ) ( ON ?auto_265872 ?auto_265871 ) ( ON ?auto_265873 ?auto_265872 ) ( ON ?auto_265874 ?auto_265873 ) ( ON ?auto_265875 ?auto_265874 ) ( not ( = ?auto_265870 ?auto_265871 ) ) ( not ( = ?auto_265870 ?auto_265872 ) ) ( not ( = ?auto_265870 ?auto_265873 ) ) ( not ( = ?auto_265870 ?auto_265874 ) ) ( not ( = ?auto_265870 ?auto_265875 ) ) ( not ( = ?auto_265870 ?auto_265876 ) ) ( not ( = ?auto_265870 ?auto_265877 ) ) ( not ( = ?auto_265870 ?auto_265878 ) ) ( not ( = ?auto_265870 ?auto_265879 ) ) ( not ( = ?auto_265870 ?auto_265880 ) ) ( not ( = ?auto_265871 ?auto_265872 ) ) ( not ( = ?auto_265871 ?auto_265873 ) ) ( not ( = ?auto_265871 ?auto_265874 ) ) ( not ( = ?auto_265871 ?auto_265875 ) ) ( not ( = ?auto_265871 ?auto_265876 ) ) ( not ( = ?auto_265871 ?auto_265877 ) ) ( not ( = ?auto_265871 ?auto_265878 ) ) ( not ( = ?auto_265871 ?auto_265879 ) ) ( not ( = ?auto_265871 ?auto_265880 ) ) ( not ( = ?auto_265872 ?auto_265873 ) ) ( not ( = ?auto_265872 ?auto_265874 ) ) ( not ( = ?auto_265872 ?auto_265875 ) ) ( not ( = ?auto_265872 ?auto_265876 ) ) ( not ( = ?auto_265872 ?auto_265877 ) ) ( not ( = ?auto_265872 ?auto_265878 ) ) ( not ( = ?auto_265872 ?auto_265879 ) ) ( not ( = ?auto_265872 ?auto_265880 ) ) ( not ( = ?auto_265873 ?auto_265874 ) ) ( not ( = ?auto_265873 ?auto_265875 ) ) ( not ( = ?auto_265873 ?auto_265876 ) ) ( not ( = ?auto_265873 ?auto_265877 ) ) ( not ( = ?auto_265873 ?auto_265878 ) ) ( not ( = ?auto_265873 ?auto_265879 ) ) ( not ( = ?auto_265873 ?auto_265880 ) ) ( not ( = ?auto_265874 ?auto_265875 ) ) ( not ( = ?auto_265874 ?auto_265876 ) ) ( not ( = ?auto_265874 ?auto_265877 ) ) ( not ( = ?auto_265874 ?auto_265878 ) ) ( not ( = ?auto_265874 ?auto_265879 ) ) ( not ( = ?auto_265874 ?auto_265880 ) ) ( not ( = ?auto_265875 ?auto_265876 ) ) ( not ( = ?auto_265875 ?auto_265877 ) ) ( not ( = ?auto_265875 ?auto_265878 ) ) ( not ( = ?auto_265875 ?auto_265879 ) ) ( not ( = ?auto_265875 ?auto_265880 ) ) ( not ( = ?auto_265876 ?auto_265877 ) ) ( not ( = ?auto_265876 ?auto_265878 ) ) ( not ( = ?auto_265876 ?auto_265879 ) ) ( not ( = ?auto_265876 ?auto_265880 ) ) ( not ( = ?auto_265877 ?auto_265878 ) ) ( not ( = ?auto_265877 ?auto_265879 ) ) ( not ( = ?auto_265877 ?auto_265880 ) ) ( not ( = ?auto_265878 ?auto_265879 ) ) ( not ( = ?auto_265878 ?auto_265880 ) ) ( not ( = ?auto_265879 ?auto_265880 ) ) ( ON ?auto_265878 ?auto_265879 ) ( ON ?auto_265877 ?auto_265878 ) ( CLEAR ?auto_265875 ) ( ON ?auto_265876 ?auto_265877 ) ( CLEAR ?auto_265876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_265870 ?auto_265871 ?auto_265872 ?auto_265873 ?auto_265874 ?auto_265875 ?auto_265876 )
      ( MAKE-10PILE ?auto_265870 ?auto_265871 ?auto_265872 ?auto_265873 ?auto_265874 ?auto_265875 ?auto_265876 ?auto_265877 ?auto_265878 ?auto_265879 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265912 - BLOCK
      ?auto_265913 - BLOCK
      ?auto_265914 - BLOCK
      ?auto_265915 - BLOCK
      ?auto_265916 - BLOCK
      ?auto_265917 - BLOCK
      ?auto_265918 - BLOCK
      ?auto_265919 - BLOCK
      ?auto_265920 - BLOCK
      ?auto_265921 - BLOCK
    )
    :vars
    (
      ?auto_265922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265921 ?auto_265922 ) ( ON-TABLE ?auto_265912 ) ( ON ?auto_265913 ?auto_265912 ) ( ON ?auto_265914 ?auto_265913 ) ( ON ?auto_265915 ?auto_265914 ) ( ON ?auto_265916 ?auto_265915 ) ( not ( = ?auto_265912 ?auto_265913 ) ) ( not ( = ?auto_265912 ?auto_265914 ) ) ( not ( = ?auto_265912 ?auto_265915 ) ) ( not ( = ?auto_265912 ?auto_265916 ) ) ( not ( = ?auto_265912 ?auto_265917 ) ) ( not ( = ?auto_265912 ?auto_265918 ) ) ( not ( = ?auto_265912 ?auto_265919 ) ) ( not ( = ?auto_265912 ?auto_265920 ) ) ( not ( = ?auto_265912 ?auto_265921 ) ) ( not ( = ?auto_265912 ?auto_265922 ) ) ( not ( = ?auto_265913 ?auto_265914 ) ) ( not ( = ?auto_265913 ?auto_265915 ) ) ( not ( = ?auto_265913 ?auto_265916 ) ) ( not ( = ?auto_265913 ?auto_265917 ) ) ( not ( = ?auto_265913 ?auto_265918 ) ) ( not ( = ?auto_265913 ?auto_265919 ) ) ( not ( = ?auto_265913 ?auto_265920 ) ) ( not ( = ?auto_265913 ?auto_265921 ) ) ( not ( = ?auto_265913 ?auto_265922 ) ) ( not ( = ?auto_265914 ?auto_265915 ) ) ( not ( = ?auto_265914 ?auto_265916 ) ) ( not ( = ?auto_265914 ?auto_265917 ) ) ( not ( = ?auto_265914 ?auto_265918 ) ) ( not ( = ?auto_265914 ?auto_265919 ) ) ( not ( = ?auto_265914 ?auto_265920 ) ) ( not ( = ?auto_265914 ?auto_265921 ) ) ( not ( = ?auto_265914 ?auto_265922 ) ) ( not ( = ?auto_265915 ?auto_265916 ) ) ( not ( = ?auto_265915 ?auto_265917 ) ) ( not ( = ?auto_265915 ?auto_265918 ) ) ( not ( = ?auto_265915 ?auto_265919 ) ) ( not ( = ?auto_265915 ?auto_265920 ) ) ( not ( = ?auto_265915 ?auto_265921 ) ) ( not ( = ?auto_265915 ?auto_265922 ) ) ( not ( = ?auto_265916 ?auto_265917 ) ) ( not ( = ?auto_265916 ?auto_265918 ) ) ( not ( = ?auto_265916 ?auto_265919 ) ) ( not ( = ?auto_265916 ?auto_265920 ) ) ( not ( = ?auto_265916 ?auto_265921 ) ) ( not ( = ?auto_265916 ?auto_265922 ) ) ( not ( = ?auto_265917 ?auto_265918 ) ) ( not ( = ?auto_265917 ?auto_265919 ) ) ( not ( = ?auto_265917 ?auto_265920 ) ) ( not ( = ?auto_265917 ?auto_265921 ) ) ( not ( = ?auto_265917 ?auto_265922 ) ) ( not ( = ?auto_265918 ?auto_265919 ) ) ( not ( = ?auto_265918 ?auto_265920 ) ) ( not ( = ?auto_265918 ?auto_265921 ) ) ( not ( = ?auto_265918 ?auto_265922 ) ) ( not ( = ?auto_265919 ?auto_265920 ) ) ( not ( = ?auto_265919 ?auto_265921 ) ) ( not ( = ?auto_265919 ?auto_265922 ) ) ( not ( = ?auto_265920 ?auto_265921 ) ) ( not ( = ?auto_265920 ?auto_265922 ) ) ( not ( = ?auto_265921 ?auto_265922 ) ) ( ON ?auto_265920 ?auto_265921 ) ( ON ?auto_265919 ?auto_265920 ) ( ON ?auto_265918 ?auto_265919 ) ( CLEAR ?auto_265916 ) ( ON ?auto_265917 ?auto_265918 ) ( CLEAR ?auto_265917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_265912 ?auto_265913 ?auto_265914 ?auto_265915 ?auto_265916 ?auto_265917 )
      ( MAKE-10PILE ?auto_265912 ?auto_265913 ?auto_265914 ?auto_265915 ?auto_265916 ?auto_265917 ?auto_265918 ?auto_265919 ?auto_265920 ?auto_265921 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265954 - BLOCK
      ?auto_265955 - BLOCK
      ?auto_265956 - BLOCK
      ?auto_265957 - BLOCK
      ?auto_265958 - BLOCK
      ?auto_265959 - BLOCK
      ?auto_265960 - BLOCK
      ?auto_265961 - BLOCK
      ?auto_265962 - BLOCK
      ?auto_265963 - BLOCK
    )
    :vars
    (
      ?auto_265964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265963 ?auto_265964 ) ( ON-TABLE ?auto_265954 ) ( ON ?auto_265955 ?auto_265954 ) ( ON ?auto_265956 ?auto_265955 ) ( ON ?auto_265957 ?auto_265956 ) ( not ( = ?auto_265954 ?auto_265955 ) ) ( not ( = ?auto_265954 ?auto_265956 ) ) ( not ( = ?auto_265954 ?auto_265957 ) ) ( not ( = ?auto_265954 ?auto_265958 ) ) ( not ( = ?auto_265954 ?auto_265959 ) ) ( not ( = ?auto_265954 ?auto_265960 ) ) ( not ( = ?auto_265954 ?auto_265961 ) ) ( not ( = ?auto_265954 ?auto_265962 ) ) ( not ( = ?auto_265954 ?auto_265963 ) ) ( not ( = ?auto_265954 ?auto_265964 ) ) ( not ( = ?auto_265955 ?auto_265956 ) ) ( not ( = ?auto_265955 ?auto_265957 ) ) ( not ( = ?auto_265955 ?auto_265958 ) ) ( not ( = ?auto_265955 ?auto_265959 ) ) ( not ( = ?auto_265955 ?auto_265960 ) ) ( not ( = ?auto_265955 ?auto_265961 ) ) ( not ( = ?auto_265955 ?auto_265962 ) ) ( not ( = ?auto_265955 ?auto_265963 ) ) ( not ( = ?auto_265955 ?auto_265964 ) ) ( not ( = ?auto_265956 ?auto_265957 ) ) ( not ( = ?auto_265956 ?auto_265958 ) ) ( not ( = ?auto_265956 ?auto_265959 ) ) ( not ( = ?auto_265956 ?auto_265960 ) ) ( not ( = ?auto_265956 ?auto_265961 ) ) ( not ( = ?auto_265956 ?auto_265962 ) ) ( not ( = ?auto_265956 ?auto_265963 ) ) ( not ( = ?auto_265956 ?auto_265964 ) ) ( not ( = ?auto_265957 ?auto_265958 ) ) ( not ( = ?auto_265957 ?auto_265959 ) ) ( not ( = ?auto_265957 ?auto_265960 ) ) ( not ( = ?auto_265957 ?auto_265961 ) ) ( not ( = ?auto_265957 ?auto_265962 ) ) ( not ( = ?auto_265957 ?auto_265963 ) ) ( not ( = ?auto_265957 ?auto_265964 ) ) ( not ( = ?auto_265958 ?auto_265959 ) ) ( not ( = ?auto_265958 ?auto_265960 ) ) ( not ( = ?auto_265958 ?auto_265961 ) ) ( not ( = ?auto_265958 ?auto_265962 ) ) ( not ( = ?auto_265958 ?auto_265963 ) ) ( not ( = ?auto_265958 ?auto_265964 ) ) ( not ( = ?auto_265959 ?auto_265960 ) ) ( not ( = ?auto_265959 ?auto_265961 ) ) ( not ( = ?auto_265959 ?auto_265962 ) ) ( not ( = ?auto_265959 ?auto_265963 ) ) ( not ( = ?auto_265959 ?auto_265964 ) ) ( not ( = ?auto_265960 ?auto_265961 ) ) ( not ( = ?auto_265960 ?auto_265962 ) ) ( not ( = ?auto_265960 ?auto_265963 ) ) ( not ( = ?auto_265960 ?auto_265964 ) ) ( not ( = ?auto_265961 ?auto_265962 ) ) ( not ( = ?auto_265961 ?auto_265963 ) ) ( not ( = ?auto_265961 ?auto_265964 ) ) ( not ( = ?auto_265962 ?auto_265963 ) ) ( not ( = ?auto_265962 ?auto_265964 ) ) ( not ( = ?auto_265963 ?auto_265964 ) ) ( ON ?auto_265962 ?auto_265963 ) ( ON ?auto_265961 ?auto_265962 ) ( ON ?auto_265960 ?auto_265961 ) ( ON ?auto_265959 ?auto_265960 ) ( CLEAR ?auto_265957 ) ( ON ?auto_265958 ?auto_265959 ) ( CLEAR ?auto_265958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_265954 ?auto_265955 ?auto_265956 ?auto_265957 ?auto_265958 )
      ( MAKE-10PILE ?auto_265954 ?auto_265955 ?auto_265956 ?auto_265957 ?auto_265958 ?auto_265959 ?auto_265960 ?auto_265961 ?auto_265962 ?auto_265963 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265996 - BLOCK
      ?auto_265997 - BLOCK
      ?auto_265998 - BLOCK
      ?auto_265999 - BLOCK
      ?auto_266000 - BLOCK
      ?auto_266001 - BLOCK
      ?auto_266002 - BLOCK
      ?auto_266003 - BLOCK
      ?auto_266004 - BLOCK
      ?auto_266005 - BLOCK
    )
    :vars
    (
      ?auto_266006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266005 ?auto_266006 ) ( ON-TABLE ?auto_265996 ) ( ON ?auto_265997 ?auto_265996 ) ( ON ?auto_265998 ?auto_265997 ) ( not ( = ?auto_265996 ?auto_265997 ) ) ( not ( = ?auto_265996 ?auto_265998 ) ) ( not ( = ?auto_265996 ?auto_265999 ) ) ( not ( = ?auto_265996 ?auto_266000 ) ) ( not ( = ?auto_265996 ?auto_266001 ) ) ( not ( = ?auto_265996 ?auto_266002 ) ) ( not ( = ?auto_265996 ?auto_266003 ) ) ( not ( = ?auto_265996 ?auto_266004 ) ) ( not ( = ?auto_265996 ?auto_266005 ) ) ( not ( = ?auto_265996 ?auto_266006 ) ) ( not ( = ?auto_265997 ?auto_265998 ) ) ( not ( = ?auto_265997 ?auto_265999 ) ) ( not ( = ?auto_265997 ?auto_266000 ) ) ( not ( = ?auto_265997 ?auto_266001 ) ) ( not ( = ?auto_265997 ?auto_266002 ) ) ( not ( = ?auto_265997 ?auto_266003 ) ) ( not ( = ?auto_265997 ?auto_266004 ) ) ( not ( = ?auto_265997 ?auto_266005 ) ) ( not ( = ?auto_265997 ?auto_266006 ) ) ( not ( = ?auto_265998 ?auto_265999 ) ) ( not ( = ?auto_265998 ?auto_266000 ) ) ( not ( = ?auto_265998 ?auto_266001 ) ) ( not ( = ?auto_265998 ?auto_266002 ) ) ( not ( = ?auto_265998 ?auto_266003 ) ) ( not ( = ?auto_265998 ?auto_266004 ) ) ( not ( = ?auto_265998 ?auto_266005 ) ) ( not ( = ?auto_265998 ?auto_266006 ) ) ( not ( = ?auto_265999 ?auto_266000 ) ) ( not ( = ?auto_265999 ?auto_266001 ) ) ( not ( = ?auto_265999 ?auto_266002 ) ) ( not ( = ?auto_265999 ?auto_266003 ) ) ( not ( = ?auto_265999 ?auto_266004 ) ) ( not ( = ?auto_265999 ?auto_266005 ) ) ( not ( = ?auto_265999 ?auto_266006 ) ) ( not ( = ?auto_266000 ?auto_266001 ) ) ( not ( = ?auto_266000 ?auto_266002 ) ) ( not ( = ?auto_266000 ?auto_266003 ) ) ( not ( = ?auto_266000 ?auto_266004 ) ) ( not ( = ?auto_266000 ?auto_266005 ) ) ( not ( = ?auto_266000 ?auto_266006 ) ) ( not ( = ?auto_266001 ?auto_266002 ) ) ( not ( = ?auto_266001 ?auto_266003 ) ) ( not ( = ?auto_266001 ?auto_266004 ) ) ( not ( = ?auto_266001 ?auto_266005 ) ) ( not ( = ?auto_266001 ?auto_266006 ) ) ( not ( = ?auto_266002 ?auto_266003 ) ) ( not ( = ?auto_266002 ?auto_266004 ) ) ( not ( = ?auto_266002 ?auto_266005 ) ) ( not ( = ?auto_266002 ?auto_266006 ) ) ( not ( = ?auto_266003 ?auto_266004 ) ) ( not ( = ?auto_266003 ?auto_266005 ) ) ( not ( = ?auto_266003 ?auto_266006 ) ) ( not ( = ?auto_266004 ?auto_266005 ) ) ( not ( = ?auto_266004 ?auto_266006 ) ) ( not ( = ?auto_266005 ?auto_266006 ) ) ( ON ?auto_266004 ?auto_266005 ) ( ON ?auto_266003 ?auto_266004 ) ( ON ?auto_266002 ?auto_266003 ) ( ON ?auto_266001 ?auto_266002 ) ( ON ?auto_266000 ?auto_266001 ) ( CLEAR ?auto_265998 ) ( ON ?auto_265999 ?auto_266000 ) ( CLEAR ?auto_265999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_265996 ?auto_265997 ?auto_265998 ?auto_265999 )
      ( MAKE-10PILE ?auto_265996 ?auto_265997 ?auto_265998 ?auto_265999 ?auto_266000 ?auto_266001 ?auto_266002 ?auto_266003 ?auto_266004 ?auto_266005 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_266038 - BLOCK
      ?auto_266039 - BLOCK
      ?auto_266040 - BLOCK
      ?auto_266041 - BLOCK
      ?auto_266042 - BLOCK
      ?auto_266043 - BLOCK
      ?auto_266044 - BLOCK
      ?auto_266045 - BLOCK
      ?auto_266046 - BLOCK
      ?auto_266047 - BLOCK
    )
    :vars
    (
      ?auto_266048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266047 ?auto_266048 ) ( ON-TABLE ?auto_266038 ) ( ON ?auto_266039 ?auto_266038 ) ( not ( = ?auto_266038 ?auto_266039 ) ) ( not ( = ?auto_266038 ?auto_266040 ) ) ( not ( = ?auto_266038 ?auto_266041 ) ) ( not ( = ?auto_266038 ?auto_266042 ) ) ( not ( = ?auto_266038 ?auto_266043 ) ) ( not ( = ?auto_266038 ?auto_266044 ) ) ( not ( = ?auto_266038 ?auto_266045 ) ) ( not ( = ?auto_266038 ?auto_266046 ) ) ( not ( = ?auto_266038 ?auto_266047 ) ) ( not ( = ?auto_266038 ?auto_266048 ) ) ( not ( = ?auto_266039 ?auto_266040 ) ) ( not ( = ?auto_266039 ?auto_266041 ) ) ( not ( = ?auto_266039 ?auto_266042 ) ) ( not ( = ?auto_266039 ?auto_266043 ) ) ( not ( = ?auto_266039 ?auto_266044 ) ) ( not ( = ?auto_266039 ?auto_266045 ) ) ( not ( = ?auto_266039 ?auto_266046 ) ) ( not ( = ?auto_266039 ?auto_266047 ) ) ( not ( = ?auto_266039 ?auto_266048 ) ) ( not ( = ?auto_266040 ?auto_266041 ) ) ( not ( = ?auto_266040 ?auto_266042 ) ) ( not ( = ?auto_266040 ?auto_266043 ) ) ( not ( = ?auto_266040 ?auto_266044 ) ) ( not ( = ?auto_266040 ?auto_266045 ) ) ( not ( = ?auto_266040 ?auto_266046 ) ) ( not ( = ?auto_266040 ?auto_266047 ) ) ( not ( = ?auto_266040 ?auto_266048 ) ) ( not ( = ?auto_266041 ?auto_266042 ) ) ( not ( = ?auto_266041 ?auto_266043 ) ) ( not ( = ?auto_266041 ?auto_266044 ) ) ( not ( = ?auto_266041 ?auto_266045 ) ) ( not ( = ?auto_266041 ?auto_266046 ) ) ( not ( = ?auto_266041 ?auto_266047 ) ) ( not ( = ?auto_266041 ?auto_266048 ) ) ( not ( = ?auto_266042 ?auto_266043 ) ) ( not ( = ?auto_266042 ?auto_266044 ) ) ( not ( = ?auto_266042 ?auto_266045 ) ) ( not ( = ?auto_266042 ?auto_266046 ) ) ( not ( = ?auto_266042 ?auto_266047 ) ) ( not ( = ?auto_266042 ?auto_266048 ) ) ( not ( = ?auto_266043 ?auto_266044 ) ) ( not ( = ?auto_266043 ?auto_266045 ) ) ( not ( = ?auto_266043 ?auto_266046 ) ) ( not ( = ?auto_266043 ?auto_266047 ) ) ( not ( = ?auto_266043 ?auto_266048 ) ) ( not ( = ?auto_266044 ?auto_266045 ) ) ( not ( = ?auto_266044 ?auto_266046 ) ) ( not ( = ?auto_266044 ?auto_266047 ) ) ( not ( = ?auto_266044 ?auto_266048 ) ) ( not ( = ?auto_266045 ?auto_266046 ) ) ( not ( = ?auto_266045 ?auto_266047 ) ) ( not ( = ?auto_266045 ?auto_266048 ) ) ( not ( = ?auto_266046 ?auto_266047 ) ) ( not ( = ?auto_266046 ?auto_266048 ) ) ( not ( = ?auto_266047 ?auto_266048 ) ) ( ON ?auto_266046 ?auto_266047 ) ( ON ?auto_266045 ?auto_266046 ) ( ON ?auto_266044 ?auto_266045 ) ( ON ?auto_266043 ?auto_266044 ) ( ON ?auto_266042 ?auto_266043 ) ( ON ?auto_266041 ?auto_266042 ) ( CLEAR ?auto_266039 ) ( ON ?auto_266040 ?auto_266041 ) ( CLEAR ?auto_266040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_266038 ?auto_266039 ?auto_266040 )
      ( MAKE-10PILE ?auto_266038 ?auto_266039 ?auto_266040 ?auto_266041 ?auto_266042 ?auto_266043 ?auto_266044 ?auto_266045 ?auto_266046 ?auto_266047 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_266080 - BLOCK
      ?auto_266081 - BLOCK
      ?auto_266082 - BLOCK
      ?auto_266083 - BLOCK
      ?auto_266084 - BLOCK
      ?auto_266085 - BLOCK
      ?auto_266086 - BLOCK
      ?auto_266087 - BLOCK
      ?auto_266088 - BLOCK
      ?auto_266089 - BLOCK
    )
    :vars
    (
      ?auto_266090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266089 ?auto_266090 ) ( ON-TABLE ?auto_266080 ) ( not ( = ?auto_266080 ?auto_266081 ) ) ( not ( = ?auto_266080 ?auto_266082 ) ) ( not ( = ?auto_266080 ?auto_266083 ) ) ( not ( = ?auto_266080 ?auto_266084 ) ) ( not ( = ?auto_266080 ?auto_266085 ) ) ( not ( = ?auto_266080 ?auto_266086 ) ) ( not ( = ?auto_266080 ?auto_266087 ) ) ( not ( = ?auto_266080 ?auto_266088 ) ) ( not ( = ?auto_266080 ?auto_266089 ) ) ( not ( = ?auto_266080 ?auto_266090 ) ) ( not ( = ?auto_266081 ?auto_266082 ) ) ( not ( = ?auto_266081 ?auto_266083 ) ) ( not ( = ?auto_266081 ?auto_266084 ) ) ( not ( = ?auto_266081 ?auto_266085 ) ) ( not ( = ?auto_266081 ?auto_266086 ) ) ( not ( = ?auto_266081 ?auto_266087 ) ) ( not ( = ?auto_266081 ?auto_266088 ) ) ( not ( = ?auto_266081 ?auto_266089 ) ) ( not ( = ?auto_266081 ?auto_266090 ) ) ( not ( = ?auto_266082 ?auto_266083 ) ) ( not ( = ?auto_266082 ?auto_266084 ) ) ( not ( = ?auto_266082 ?auto_266085 ) ) ( not ( = ?auto_266082 ?auto_266086 ) ) ( not ( = ?auto_266082 ?auto_266087 ) ) ( not ( = ?auto_266082 ?auto_266088 ) ) ( not ( = ?auto_266082 ?auto_266089 ) ) ( not ( = ?auto_266082 ?auto_266090 ) ) ( not ( = ?auto_266083 ?auto_266084 ) ) ( not ( = ?auto_266083 ?auto_266085 ) ) ( not ( = ?auto_266083 ?auto_266086 ) ) ( not ( = ?auto_266083 ?auto_266087 ) ) ( not ( = ?auto_266083 ?auto_266088 ) ) ( not ( = ?auto_266083 ?auto_266089 ) ) ( not ( = ?auto_266083 ?auto_266090 ) ) ( not ( = ?auto_266084 ?auto_266085 ) ) ( not ( = ?auto_266084 ?auto_266086 ) ) ( not ( = ?auto_266084 ?auto_266087 ) ) ( not ( = ?auto_266084 ?auto_266088 ) ) ( not ( = ?auto_266084 ?auto_266089 ) ) ( not ( = ?auto_266084 ?auto_266090 ) ) ( not ( = ?auto_266085 ?auto_266086 ) ) ( not ( = ?auto_266085 ?auto_266087 ) ) ( not ( = ?auto_266085 ?auto_266088 ) ) ( not ( = ?auto_266085 ?auto_266089 ) ) ( not ( = ?auto_266085 ?auto_266090 ) ) ( not ( = ?auto_266086 ?auto_266087 ) ) ( not ( = ?auto_266086 ?auto_266088 ) ) ( not ( = ?auto_266086 ?auto_266089 ) ) ( not ( = ?auto_266086 ?auto_266090 ) ) ( not ( = ?auto_266087 ?auto_266088 ) ) ( not ( = ?auto_266087 ?auto_266089 ) ) ( not ( = ?auto_266087 ?auto_266090 ) ) ( not ( = ?auto_266088 ?auto_266089 ) ) ( not ( = ?auto_266088 ?auto_266090 ) ) ( not ( = ?auto_266089 ?auto_266090 ) ) ( ON ?auto_266088 ?auto_266089 ) ( ON ?auto_266087 ?auto_266088 ) ( ON ?auto_266086 ?auto_266087 ) ( ON ?auto_266085 ?auto_266086 ) ( ON ?auto_266084 ?auto_266085 ) ( ON ?auto_266083 ?auto_266084 ) ( ON ?auto_266082 ?auto_266083 ) ( CLEAR ?auto_266080 ) ( ON ?auto_266081 ?auto_266082 ) ( CLEAR ?auto_266081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_266080 ?auto_266081 )
      ( MAKE-10PILE ?auto_266080 ?auto_266081 ?auto_266082 ?auto_266083 ?auto_266084 ?auto_266085 ?auto_266086 ?auto_266087 ?auto_266088 ?auto_266089 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_266122 - BLOCK
      ?auto_266123 - BLOCK
      ?auto_266124 - BLOCK
      ?auto_266125 - BLOCK
      ?auto_266126 - BLOCK
      ?auto_266127 - BLOCK
      ?auto_266128 - BLOCK
      ?auto_266129 - BLOCK
      ?auto_266130 - BLOCK
      ?auto_266131 - BLOCK
    )
    :vars
    (
      ?auto_266132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266131 ?auto_266132 ) ( not ( = ?auto_266122 ?auto_266123 ) ) ( not ( = ?auto_266122 ?auto_266124 ) ) ( not ( = ?auto_266122 ?auto_266125 ) ) ( not ( = ?auto_266122 ?auto_266126 ) ) ( not ( = ?auto_266122 ?auto_266127 ) ) ( not ( = ?auto_266122 ?auto_266128 ) ) ( not ( = ?auto_266122 ?auto_266129 ) ) ( not ( = ?auto_266122 ?auto_266130 ) ) ( not ( = ?auto_266122 ?auto_266131 ) ) ( not ( = ?auto_266122 ?auto_266132 ) ) ( not ( = ?auto_266123 ?auto_266124 ) ) ( not ( = ?auto_266123 ?auto_266125 ) ) ( not ( = ?auto_266123 ?auto_266126 ) ) ( not ( = ?auto_266123 ?auto_266127 ) ) ( not ( = ?auto_266123 ?auto_266128 ) ) ( not ( = ?auto_266123 ?auto_266129 ) ) ( not ( = ?auto_266123 ?auto_266130 ) ) ( not ( = ?auto_266123 ?auto_266131 ) ) ( not ( = ?auto_266123 ?auto_266132 ) ) ( not ( = ?auto_266124 ?auto_266125 ) ) ( not ( = ?auto_266124 ?auto_266126 ) ) ( not ( = ?auto_266124 ?auto_266127 ) ) ( not ( = ?auto_266124 ?auto_266128 ) ) ( not ( = ?auto_266124 ?auto_266129 ) ) ( not ( = ?auto_266124 ?auto_266130 ) ) ( not ( = ?auto_266124 ?auto_266131 ) ) ( not ( = ?auto_266124 ?auto_266132 ) ) ( not ( = ?auto_266125 ?auto_266126 ) ) ( not ( = ?auto_266125 ?auto_266127 ) ) ( not ( = ?auto_266125 ?auto_266128 ) ) ( not ( = ?auto_266125 ?auto_266129 ) ) ( not ( = ?auto_266125 ?auto_266130 ) ) ( not ( = ?auto_266125 ?auto_266131 ) ) ( not ( = ?auto_266125 ?auto_266132 ) ) ( not ( = ?auto_266126 ?auto_266127 ) ) ( not ( = ?auto_266126 ?auto_266128 ) ) ( not ( = ?auto_266126 ?auto_266129 ) ) ( not ( = ?auto_266126 ?auto_266130 ) ) ( not ( = ?auto_266126 ?auto_266131 ) ) ( not ( = ?auto_266126 ?auto_266132 ) ) ( not ( = ?auto_266127 ?auto_266128 ) ) ( not ( = ?auto_266127 ?auto_266129 ) ) ( not ( = ?auto_266127 ?auto_266130 ) ) ( not ( = ?auto_266127 ?auto_266131 ) ) ( not ( = ?auto_266127 ?auto_266132 ) ) ( not ( = ?auto_266128 ?auto_266129 ) ) ( not ( = ?auto_266128 ?auto_266130 ) ) ( not ( = ?auto_266128 ?auto_266131 ) ) ( not ( = ?auto_266128 ?auto_266132 ) ) ( not ( = ?auto_266129 ?auto_266130 ) ) ( not ( = ?auto_266129 ?auto_266131 ) ) ( not ( = ?auto_266129 ?auto_266132 ) ) ( not ( = ?auto_266130 ?auto_266131 ) ) ( not ( = ?auto_266130 ?auto_266132 ) ) ( not ( = ?auto_266131 ?auto_266132 ) ) ( ON ?auto_266130 ?auto_266131 ) ( ON ?auto_266129 ?auto_266130 ) ( ON ?auto_266128 ?auto_266129 ) ( ON ?auto_266127 ?auto_266128 ) ( ON ?auto_266126 ?auto_266127 ) ( ON ?auto_266125 ?auto_266126 ) ( ON ?auto_266124 ?auto_266125 ) ( ON ?auto_266123 ?auto_266124 ) ( ON ?auto_266122 ?auto_266123 ) ( CLEAR ?auto_266122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_266122 )
      ( MAKE-10PILE ?auto_266122 ?auto_266123 ?auto_266124 ?auto_266125 ?auto_266126 ?auto_266127 ?auto_266128 ?auto_266129 ?auto_266130 ?auto_266131 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266165 - BLOCK
      ?auto_266166 - BLOCK
      ?auto_266167 - BLOCK
      ?auto_266168 - BLOCK
      ?auto_266169 - BLOCK
      ?auto_266170 - BLOCK
      ?auto_266171 - BLOCK
      ?auto_266172 - BLOCK
      ?auto_266173 - BLOCK
      ?auto_266174 - BLOCK
      ?auto_266175 - BLOCK
    )
    :vars
    (
      ?auto_266176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_266174 ) ( ON ?auto_266175 ?auto_266176 ) ( CLEAR ?auto_266175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_266165 ) ( ON ?auto_266166 ?auto_266165 ) ( ON ?auto_266167 ?auto_266166 ) ( ON ?auto_266168 ?auto_266167 ) ( ON ?auto_266169 ?auto_266168 ) ( ON ?auto_266170 ?auto_266169 ) ( ON ?auto_266171 ?auto_266170 ) ( ON ?auto_266172 ?auto_266171 ) ( ON ?auto_266173 ?auto_266172 ) ( ON ?auto_266174 ?auto_266173 ) ( not ( = ?auto_266165 ?auto_266166 ) ) ( not ( = ?auto_266165 ?auto_266167 ) ) ( not ( = ?auto_266165 ?auto_266168 ) ) ( not ( = ?auto_266165 ?auto_266169 ) ) ( not ( = ?auto_266165 ?auto_266170 ) ) ( not ( = ?auto_266165 ?auto_266171 ) ) ( not ( = ?auto_266165 ?auto_266172 ) ) ( not ( = ?auto_266165 ?auto_266173 ) ) ( not ( = ?auto_266165 ?auto_266174 ) ) ( not ( = ?auto_266165 ?auto_266175 ) ) ( not ( = ?auto_266165 ?auto_266176 ) ) ( not ( = ?auto_266166 ?auto_266167 ) ) ( not ( = ?auto_266166 ?auto_266168 ) ) ( not ( = ?auto_266166 ?auto_266169 ) ) ( not ( = ?auto_266166 ?auto_266170 ) ) ( not ( = ?auto_266166 ?auto_266171 ) ) ( not ( = ?auto_266166 ?auto_266172 ) ) ( not ( = ?auto_266166 ?auto_266173 ) ) ( not ( = ?auto_266166 ?auto_266174 ) ) ( not ( = ?auto_266166 ?auto_266175 ) ) ( not ( = ?auto_266166 ?auto_266176 ) ) ( not ( = ?auto_266167 ?auto_266168 ) ) ( not ( = ?auto_266167 ?auto_266169 ) ) ( not ( = ?auto_266167 ?auto_266170 ) ) ( not ( = ?auto_266167 ?auto_266171 ) ) ( not ( = ?auto_266167 ?auto_266172 ) ) ( not ( = ?auto_266167 ?auto_266173 ) ) ( not ( = ?auto_266167 ?auto_266174 ) ) ( not ( = ?auto_266167 ?auto_266175 ) ) ( not ( = ?auto_266167 ?auto_266176 ) ) ( not ( = ?auto_266168 ?auto_266169 ) ) ( not ( = ?auto_266168 ?auto_266170 ) ) ( not ( = ?auto_266168 ?auto_266171 ) ) ( not ( = ?auto_266168 ?auto_266172 ) ) ( not ( = ?auto_266168 ?auto_266173 ) ) ( not ( = ?auto_266168 ?auto_266174 ) ) ( not ( = ?auto_266168 ?auto_266175 ) ) ( not ( = ?auto_266168 ?auto_266176 ) ) ( not ( = ?auto_266169 ?auto_266170 ) ) ( not ( = ?auto_266169 ?auto_266171 ) ) ( not ( = ?auto_266169 ?auto_266172 ) ) ( not ( = ?auto_266169 ?auto_266173 ) ) ( not ( = ?auto_266169 ?auto_266174 ) ) ( not ( = ?auto_266169 ?auto_266175 ) ) ( not ( = ?auto_266169 ?auto_266176 ) ) ( not ( = ?auto_266170 ?auto_266171 ) ) ( not ( = ?auto_266170 ?auto_266172 ) ) ( not ( = ?auto_266170 ?auto_266173 ) ) ( not ( = ?auto_266170 ?auto_266174 ) ) ( not ( = ?auto_266170 ?auto_266175 ) ) ( not ( = ?auto_266170 ?auto_266176 ) ) ( not ( = ?auto_266171 ?auto_266172 ) ) ( not ( = ?auto_266171 ?auto_266173 ) ) ( not ( = ?auto_266171 ?auto_266174 ) ) ( not ( = ?auto_266171 ?auto_266175 ) ) ( not ( = ?auto_266171 ?auto_266176 ) ) ( not ( = ?auto_266172 ?auto_266173 ) ) ( not ( = ?auto_266172 ?auto_266174 ) ) ( not ( = ?auto_266172 ?auto_266175 ) ) ( not ( = ?auto_266172 ?auto_266176 ) ) ( not ( = ?auto_266173 ?auto_266174 ) ) ( not ( = ?auto_266173 ?auto_266175 ) ) ( not ( = ?auto_266173 ?auto_266176 ) ) ( not ( = ?auto_266174 ?auto_266175 ) ) ( not ( = ?auto_266174 ?auto_266176 ) ) ( not ( = ?auto_266175 ?auto_266176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_266175 ?auto_266176 )
      ( !STACK ?auto_266175 ?auto_266174 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266211 - BLOCK
      ?auto_266212 - BLOCK
      ?auto_266213 - BLOCK
      ?auto_266214 - BLOCK
      ?auto_266215 - BLOCK
      ?auto_266216 - BLOCK
      ?auto_266217 - BLOCK
      ?auto_266218 - BLOCK
      ?auto_266219 - BLOCK
      ?auto_266220 - BLOCK
      ?auto_266221 - BLOCK
    )
    :vars
    (
      ?auto_266222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266221 ?auto_266222 ) ( ON-TABLE ?auto_266211 ) ( ON ?auto_266212 ?auto_266211 ) ( ON ?auto_266213 ?auto_266212 ) ( ON ?auto_266214 ?auto_266213 ) ( ON ?auto_266215 ?auto_266214 ) ( ON ?auto_266216 ?auto_266215 ) ( ON ?auto_266217 ?auto_266216 ) ( ON ?auto_266218 ?auto_266217 ) ( ON ?auto_266219 ?auto_266218 ) ( not ( = ?auto_266211 ?auto_266212 ) ) ( not ( = ?auto_266211 ?auto_266213 ) ) ( not ( = ?auto_266211 ?auto_266214 ) ) ( not ( = ?auto_266211 ?auto_266215 ) ) ( not ( = ?auto_266211 ?auto_266216 ) ) ( not ( = ?auto_266211 ?auto_266217 ) ) ( not ( = ?auto_266211 ?auto_266218 ) ) ( not ( = ?auto_266211 ?auto_266219 ) ) ( not ( = ?auto_266211 ?auto_266220 ) ) ( not ( = ?auto_266211 ?auto_266221 ) ) ( not ( = ?auto_266211 ?auto_266222 ) ) ( not ( = ?auto_266212 ?auto_266213 ) ) ( not ( = ?auto_266212 ?auto_266214 ) ) ( not ( = ?auto_266212 ?auto_266215 ) ) ( not ( = ?auto_266212 ?auto_266216 ) ) ( not ( = ?auto_266212 ?auto_266217 ) ) ( not ( = ?auto_266212 ?auto_266218 ) ) ( not ( = ?auto_266212 ?auto_266219 ) ) ( not ( = ?auto_266212 ?auto_266220 ) ) ( not ( = ?auto_266212 ?auto_266221 ) ) ( not ( = ?auto_266212 ?auto_266222 ) ) ( not ( = ?auto_266213 ?auto_266214 ) ) ( not ( = ?auto_266213 ?auto_266215 ) ) ( not ( = ?auto_266213 ?auto_266216 ) ) ( not ( = ?auto_266213 ?auto_266217 ) ) ( not ( = ?auto_266213 ?auto_266218 ) ) ( not ( = ?auto_266213 ?auto_266219 ) ) ( not ( = ?auto_266213 ?auto_266220 ) ) ( not ( = ?auto_266213 ?auto_266221 ) ) ( not ( = ?auto_266213 ?auto_266222 ) ) ( not ( = ?auto_266214 ?auto_266215 ) ) ( not ( = ?auto_266214 ?auto_266216 ) ) ( not ( = ?auto_266214 ?auto_266217 ) ) ( not ( = ?auto_266214 ?auto_266218 ) ) ( not ( = ?auto_266214 ?auto_266219 ) ) ( not ( = ?auto_266214 ?auto_266220 ) ) ( not ( = ?auto_266214 ?auto_266221 ) ) ( not ( = ?auto_266214 ?auto_266222 ) ) ( not ( = ?auto_266215 ?auto_266216 ) ) ( not ( = ?auto_266215 ?auto_266217 ) ) ( not ( = ?auto_266215 ?auto_266218 ) ) ( not ( = ?auto_266215 ?auto_266219 ) ) ( not ( = ?auto_266215 ?auto_266220 ) ) ( not ( = ?auto_266215 ?auto_266221 ) ) ( not ( = ?auto_266215 ?auto_266222 ) ) ( not ( = ?auto_266216 ?auto_266217 ) ) ( not ( = ?auto_266216 ?auto_266218 ) ) ( not ( = ?auto_266216 ?auto_266219 ) ) ( not ( = ?auto_266216 ?auto_266220 ) ) ( not ( = ?auto_266216 ?auto_266221 ) ) ( not ( = ?auto_266216 ?auto_266222 ) ) ( not ( = ?auto_266217 ?auto_266218 ) ) ( not ( = ?auto_266217 ?auto_266219 ) ) ( not ( = ?auto_266217 ?auto_266220 ) ) ( not ( = ?auto_266217 ?auto_266221 ) ) ( not ( = ?auto_266217 ?auto_266222 ) ) ( not ( = ?auto_266218 ?auto_266219 ) ) ( not ( = ?auto_266218 ?auto_266220 ) ) ( not ( = ?auto_266218 ?auto_266221 ) ) ( not ( = ?auto_266218 ?auto_266222 ) ) ( not ( = ?auto_266219 ?auto_266220 ) ) ( not ( = ?auto_266219 ?auto_266221 ) ) ( not ( = ?auto_266219 ?auto_266222 ) ) ( not ( = ?auto_266220 ?auto_266221 ) ) ( not ( = ?auto_266220 ?auto_266222 ) ) ( not ( = ?auto_266221 ?auto_266222 ) ) ( CLEAR ?auto_266219 ) ( ON ?auto_266220 ?auto_266221 ) ( CLEAR ?auto_266220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_266211 ?auto_266212 ?auto_266213 ?auto_266214 ?auto_266215 ?auto_266216 ?auto_266217 ?auto_266218 ?auto_266219 ?auto_266220 )
      ( MAKE-11PILE ?auto_266211 ?auto_266212 ?auto_266213 ?auto_266214 ?auto_266215 ?auto_266216 ?auto_266217 ?auto_266218 ?auto_266219 ?auto_266220 ?auto_266221 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266257 - BLOCK
      ?auto_266258 - BLOCK
      ?auto_266259 - BLOCK
      ?auto_266260 - BLOCK
      ?auto_266261 - BLOCK
      ?auto_266262 - BLOCK
      ?auto_266263 - BLOCK
      ?auto_266264 - BLOCK
      ?auto_266265 - BLOCK
      ?auto_266266 - BLOCK
      ?auto_266267 - BLOCK
    )
    :vars
    (
      ?auto_266268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266267 ?auto_266268 ) ( ON-TABLE ?auto_266257 ) ( ON ?auto_266258 ?auto_266257 ) ( ON ?auto_266259 ?auto_266258 ) ( ON ?auto_266260 ?auto_266259 ) ( ON ?auto_266261 ?auto_266260 ) ( ON ?auto_266262 ?auto_266261 ) ( ON ?auto_266263 ?auto_266262 ) ( ON ?auto_266264 ?auto_266263 ) ( not ( = ?auto_266257 ?auto_266258 ) ) ( not ( = ?auto_266257 ?auto_266259 ) ) ( not ( = ?auto_266257 ?auto_266260 ) ) ( not ( = ?auto_266257 ?auto_266261 ) ) ( not ( = ?auto_266257 ?auto_266262 ) ) ( not ( = ?auto_266257 ?auto_266263 ) ) ( not ( = ?auto_266257 ?auto_266264 ) ) ( not ( = ?auto_266257 ?auto_266265 ) ) ( not ( = ?auto_266257 ?auto_266266 ) ) ( not ( = ?auto_266257 ?auto_266267 ) ) ( not ( = ?auto_266257 ?auto_266268 ) ) ( not ( = ?auto_266258 ?auto_266259 ) ) ( not ( = ?auto_266258 ?auto_266260 ) ) ( not ( = ?auto_266258 ?auto_266261 ) ) ( not ( = ?auto_266258 ?auto_266262 ) ) ( not ( = ?auto_266258 ?auto_266263 ) ) ( not ( = ?auto_266258 ?auto_266264 ) ) ( not ( = ?auto_266258 ?auto_266265 ) ) ( not ( = ?auto_266258 ?auto_266266 ) ) ( not ( = ?auto_266258 ?auto_266267 ) ) ( not ( = ?auto_266258 ?auto_266268 ) ) ( not ( = ?auto_266259 ?auto_266260 ) ) ( not ( = ?auto_266259 ?auto_266261 ) ) ( not ( = ?auto_266259 ?auto_266262 ) ) ( not ( = ?auto_266259 ?auto_266263 ) ) ( not ( = ?auto_266259 ?auto_266264 ) ) ( not ( = ?auto_266259 ?auto_266265 ) ) ( not ( = ?auto_266259 ?auto_266266 ) ) ( not ( = ?auto_266259 ?auto_266267 ) ) ( not ( = ?auto_266259 ?auto_266268 ) ) ( not ( = ?auto_266260 ?auto_266261 ) ) ( not ( = ?auto_266260 ?auto_266262 ) ) ( not ( = ?auto_266260 ?auto_266263 ) ) ( not ( = ?auto_266260 ?auto_266264 ) ) ( not ( = ?auto_266260 ?auto_266265 ) ) ( not ( = ?auto_266260 ?auto_266266 ) ) ( not ( = ?auto_266260 ?auto_266267 ) ) ( not ( = ?auto_266260 ?auto_266268 ) ) ( not ( = ?auto_266261 ?auto_266262 ) ) ( not ( = ?auto_266261 ?auto_266263 ) ) ( not ( = ?auto_266261 ?auto_266264 ) ) ( not ( = ?auto_266261 ?auto_266265 ) ) ( not ( = ?auto_266261 ?auto_266266 ) ) ( not ( = ?auto_266261 ?auto_266267 ) ) ( not ( = ?auto_266261 ?auto_266268 ) ) ( not ( = ?auto_266262 ?auto_266263 ) ) ( not ( = ?auto_266262 ?auto_266264 ) ) ( not ( = ?auto_266262 ?auto_266265 ) ) ( not ( = ?auto_266262 ?auto_266266 ) ) ( not ( = ?auto_266262 ?auto_266267 ) ) ( not ( = ?auto_266262 ?auto_266268 ) ) ( not ( = ?auto_266263 ?auto_266264 ) ) ( not ( = ?auto_266263 ?auto_266265 ) ) ( not ( = ?auto_266263 ?auto_266266 ) ) ( not ( = ?auto_266263 ?auto_266267 ) ) ( not ( = ?auto_266263 ?auto_266268 ) ) ( not ( = ?auto_266264 ?auto_266265 ) ) ( not ( = ?auto_266264 ?auto_266266 ) ) ( not ( = ?auto_266264 ?auto_266267 ) ) ( not ( = ?auto_266264 ?auto_266268 ) ) ( not ( = ?auto_266265 ?auto_266266 ) ) ( not ( = ?auto_266265 ?auto_266267 ) ) ( not ( = ?auto_266265 ?auto_266268 ) ) ( not ( = ?auto_266266 ?auto_266267 ) ) ( not ( = ?auto_266266 ?auto_266268 ) ) ( not ( = ?auto_266267 ?auto_266268 ) ) ( ON ?auto_266266 ?auto_266267 ) ( CLEAR ?auto_266264 ) ( ON ?auto_266265 ?auto_266266 ) ( CLEAR ?auto_266265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_266257 ?auto_266258 ?auto_266259 ?auto_266260 ?auto_266261 ?auto_266262 ?auto_266263 ?auto_266264 ?auto_266265 )
      ( MAKE-11PILE ?auto_266257 ?auto_266258 ?auto_266259 ?auto_266260 ?auto_266261 ?auto_266262 ?auto_266263 ?auto_266264 ?auto_266265 ?auto_266266 ?auto_266267 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266303 - BLOCK
      ?auto_266304 - BLOCK
      ?auto_266305 - BLOCK
      ?auto_266306 - BLOCK
      ?auto_266307 - BLOCK
      ?auto_266308 - BLOCK
      ?auto_266309 - BLOCK
      ?auto_266310 - BLOCK
      ?auto_266311 - BLOCK
      ?auto_266312 - BLOCK
      ?auto_266313 - BLOCK
    )
    :vars
    (
      ?auto_266314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266313 ?auto_266314 ) ( ON-TABLE ?auto_266303 ) ( ON ?auto_266304 ?auto_266303 ) ( ON ?auto_266305 ?auto_266304 ) ( ON ?auto_266306 ?auto_266305 ) ( ON ?auto_266307 ?auto_266306 ) ( ON ?auto_266308 ?auto_266307 ) ( ON ?auto_266309 ?auto_266308 ) ( not ( = ?auto_266303 ?auto_266304 ) ) ( not ( = ?auto_266303 ?auto_266305 ) ) ( not ( = ?auto_266303 ?auto_266306 ) ) ( not ( = ?auto_266303 ?auto_266307 ) ) ( not ( = ?auto_266303 ?auto_266308 ) ) ( not ( = ?auto_266303 ?auto_266309 ) ) ( not ( = ?auto_266303 ?auto_266310 ) ) ( not ( = ?auto_266303 ?auto_266311 ) ) ( not ( = ?auto_266303 ?auto_266312 ) ) ( not ( = ?auto_266303 ?auto_266313 ) ) ( not ( = ?auto_266303 ?auto_266314 ) ) ( not ( = ?auto_266304 ?auto_266305 ) ) ( not ( = ?auto_266304 ?auto_266306 ) ) ( not ( = ?auto_266304 ?auto_266307 ) ) ( not ( = ?auto_266304 ?auto_266308 ) ) ( not ( = ?auto_266304 ?auto_266309 ) ) ( not ( = ?auto_266304 ?auto_266310 ) ) ( not ( = ?auto_266304 ?auto_266311 ) ) ( not ( = ?auto_266304 ?auto_266312 ) ) ( not ( = ?auto_266304 ?auto_266313 ) ) ( not ( = ?auto_266304 ?auto_266314 ) ) ( not ( = ?auto_266305 ?auto_266306 ) ) ( not ( = ?auto_266305 ?auto_266307 ) ) ( not ( = ?auto_266305 ?auto_266308 ) ) ( not ( = ?auto_266305 ?auto_266309 ) ) ( not ( = ?auto_266305 ?auto_266310 ) ) ( not ( = ?auto_266305 ?auto_266311 ) ) ( not ( = ?auto_266305 ?auto_266312 ) ) ( not ( = ?auto_266305 ?auto_266313 ) ) ( not ( = ?auto_266305 ?auto_266314 ) ) ( not ( = ?auto_266306 ?auto_266307 ) ) ( not ( = ?auto_266306 ?auto_266308 ) ) ( not ( = ?auto_266306 ?auto_266309 ) ) ( not ( = ?auto_266306 ?auto_266310 ) ) ( not ( = ?auto_266306 ?auto_266311 ) ) ( not ( = ?auto_266306 ?auto_266312 ) ) ( not ( = ?auto_266306 ?auto_266313 ) ) ( not ( = ?auto_266306 ?auto_266314 ) ) ( not ( = ?auto_266307 ?auto_266308 ) ) ( not ( = ?auto_266307 ?auto_266309 ) ) ( not ( = ?auto_266307 ?auto_266310 ) ) ( not ( = ?auto_266307 ?auto_266311 ) ) ( not ( = ?auto_266307 ?auto_266312 ) ) ( not ( = ?auto_266307 ?auto_266313 ) ) ( not ( = ?auto_266307 ?auto_266314 ) ) ( not ( = ?auto_266308 ?auto_266309 ) ) ( not ( = ?auto_266308 ?auto_266310 ) ) ( not ( = ?auto_266308 ?auto_266311 ) ) ( not ( = ?auto_266308 ?auto_266312 ) ) ( not ( = ?auto_266308 ?auto_266313 ) ) ( not ( = ?auto_266308 ?auto_266314 ) ) ( not ( = ?auto_266309 ?auto_266310 ) ) ( not ( = ?auto_266309 ?auto_266311 ) ) ( not ( = ?auto_266309 ?auto_266312 ) ) ( not ( = ?auto_266309 ?auto_266313 ) ) ( not ( = ?auto_266309 ?auto_266314 ) ) ( not ( = ?auto_266310 ?auto_266311 ) ) ( not ( = ?auto_266310 ?auto_266312 ) ) ( not ( = ?auto_266310 ?auto_266313 ) ) ( not ( = ?auto_266310 ?auto_266314 ) ) ( not ( = ?auto_266311 ?auto_266312 ) ) ( not ( = ?auto_266311 ?auto_266313 ) ) ( not ( = ?auto_266311 ?auto_266314 ) ) ( not ( = ?auto_266312 ?auto_266313 ) ) ( not ( = ?auto_266312 ?auto_266314 ) ) ( not ( = ?auto_266313 ?auto_266314 ) ) ( ON ?auto_266312 ?auto_266313 ) ( ON ?auto_266311 ?auto_266312 ) ( CLEAR ?auto_266309 ) ( ON ?auto_266310 ?auto_266311 ) ( CLEAR ?auto_266310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_266303 ?auto_266304 ?auto_266305 ?auto_266306 ?auto_266307 ?auto_266308 ?auto_266309 ?auto_266310 )
      ( MAKE-11PILE ?auto_266303 ?auto_266304 ?auto_266305 ?auto_266306 ?auto_266307 ?auto_266308 ?auto_266309 ?auto_266310 ?auto_266311 ?auto_266312 ?auto_266313 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266349 - BLOCK
      ?auto_266350 - BLOCK
      ?auto_266351 - BLOCK
      ?auto_266352 - BLOCK
      ?auto_266353 - BLOCK
      ?auto_266354 - BLOCK
      ?auto_266355 - BLOCK
      ?auto_266356 - BLOCK
      ?auto_266357 - BLOCK
      ?auto_266358 - BLOCK
      ?auto_266359 - BLOCK
    )
    :vars
    (
      ?auto_266360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266359 ?auto_266360 ) ( ON-TABLE ?auto_266349 ) ( ON ?auto_266350 ?auto_266349 ) ( ON ?auto_266351 ?auto_266350 ) ( ON ?auto_266352 ?auto_266351 ) ( ON ?auto_266353 ?auto_266352 ) ( ON ?auto_266354 ?auto_266353 ) ( not ( = ?auto_266349 ?auto_266350 ) ) ( not ( = ?auto_266349 ?auto_266351 ) ) ( not ( = ?auto_266349 ?auto_266352 ) ) ( not ( = ?auto_266349 ?auto_266353 ) ) ( not ( = ?auto_266349 ?auto_266354 ) ) ( not ( = ?auto_266349 ?auto_266355 ) ) ( not ( = ?auto_266349 ?auto_266356 ) ) ( not ( = ?auto_266349 ?auto_266357 ) ) ( not ( = ?auto_266349 ?auto_266358 ) ) ( not ( = ?auto_266349 ?auto_266359 ) ) ( not ( = ?auto_266349 ?auto_266360 ) ) ( not ( = ?auto_266350 ?auto_266351 ) ) ( not ( = ?auto_266350 ?auto_266352 ) ) ( not ( = ?auto_266350 ?auto_266353 ) ) ( not ( = ?auto_266350 ?auto_266354 ) ) ( not ( = ?auto_266350 ?auto_266355 ) ) ( not ( = ?auto_266350 ?auto_266356 ) ) ( not ( = ?auto_266350 ?auto_266357 ) ) ( not ( = ?auto_266350 ?auto_266358 ) ) ( not ( = ?auto_266350 ?auto_266359 ) ) ( not ( = ?auto_266350 ?auto_266360 ) ) ( not ( = ?auto_266351 ?auto_266352 ) ) ( not ( = ?auto_266351 ?auto_266353 ) ) ( not ( = ?auto_266351 ?auto_266354 ) ) ( not ( = ?auto_266351 ?auto_266355 ) ) ( not ( = ?auto_266351 ?auto_266356 ) ) ( not ( = ?auto_266351 ?auto_266357 ) ) ( not ( = ?auto_266351 ?auto_266358 ) ) ( not ( = ?auto_266351 ?auto_266359 ) ) ( not ( = ?auto_266351 ?auto_266360 ) ) ( not ( = ?auto_266352 ?auto_266353 ) ) ( not ( = ?auto_266352 ?auto_266354 ) ) ( not ( = ?auto_266352 ?auto_266355 ) ) ( not ( = ?auto_266352 ?auto_266356 ) ) ( not ( = ?auto_266352 ?auto_266357 ) ) ( not ( = ?auto_266352 ?auto_266358 ) ) ( not ( = ?auto_266352 ?auto_266359 ) ) ( not ( = ?auto_266352 ?auto_266360 ) ) ( not ( = ?auto_266353 ?auto_266354 ) ) ( not ( = ?auto_266353 ?auto_266355 ) ) ( not ( = ?auto_266353 ?auto_266356 ) ) ( not ( = ?auto_266353 ?auto_266357 ) ) ( not ( = ?auto_266353 ?auto_266358 ) ) ( not ( = ?auto_266353 ?auto_266359 ) ) ( not ( = ?auto_266353 ?auto_266360 ) ) ( not ( = ?auto_266354 ?auto_266355 ) ) ( not ( = ?auto_266354 ?auto_266356 ) ) ( not ( = ?auto_266354 ?auto_266357 ) ) ( not ( = ?auto_266354 ?auto_266358 ) ) ( not ( = ?auto_266354 ?auto_266359 ) ) ( not ( = ?auto_266354 ?auto_266360 ) ) ( not ( = ?auto_266355 ?auto_266356 ) ) ( not ( = ?auto_266355 ?auto_266357 ) ) ( not ( = ?auto_266355 ?auto_266358 ) ) ( not ( = ?auto_266355 ?auto_266359 ) ) ( not ( = ?auto_266355 ?auto_266360 ) ) ( not ( = ?auto_266356 ?auto_266357 ) ) ( not ( = ?auto_266356 ?auto_266358 ) ) ( not ( = ?auto_266356 ?auto_266359 ) ) ( not ( = ?auto_266356 ?auto_266360 ) ) ( not ( = ?auto_266357 ?auto_266358 ) ) ( not ( = ?auto_266357 ?auto_266359 ) ) ( not ( = ?auto_266357 ?auto_266360 ) ) ( not ( = ?auto_266358 ?auto_266359 ) ) ( not ( = ?auto_266358 ?auto_266360 ) ) ( not ( = ?auto_266359 ?auto_266360 ) ) ( ON ?auto_266358 ?auto_266359 ) ( ON ?auto_266357 ?auto_266358 ) ( ON ?auto_266356 ?auto_266357 ) ( CLEAR ?auto_266354 ) ( ON ?auto_266355 ?auto_266356 ) ( CLEAR ?auto_266355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_266349 ?auto_266350 ?auto_266351 ?auto_266352 ?auto_266353 ?auto_266354 ?auto_266355 )
      ( MAKE-11PILE ?auto_266349 ?auto_266350 ?auto_266351 ?auto_266352 ?auto_266353 ?auto_266354 ?auto_266355 ?auto_266356 ?auto_266357 ?auto_266358 ?auto_266359 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266395 - BLOCK
      ?auto_266396 - BLOCK
      ?auto_266397 - BLOCK
      ?auto_266398 - BLOCK
      ?auto_266399 - BLOCK
      ?auto_266400 - BLOCK
      ?auto_266401 - BLOCK
      ?auto_266402 - BLOCK
      ?auto_266403 - BLOCK
      ?auto_266404 - BLOCK
      ?auto_266405 - BLOCK
    )
    :vars
    (
      ?auto_266406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266405 ?auto_266406 ) ( ON-TABLE ?auto_266395 ) ( ON ?auto_266396 ?auto_266395 ) ( ON ?auto_266397 ?auto_266396 ) ( ON ?auto_266398 ?auto_266397 ) ( ON ?auto_266399 ?auto_266398 ) ( not ( = ?auto_266395 ?auto_266396 ) ) ( not ( = ?auto_266395 ?auto_266397 ) ) ( not ( = ?auto_266395 ?auto_266398 ) ) ( not ( = ?auto_266395 ?auto_266399 ) ) ( not ( = ?auto_266395 ?auto_266400 ) ) ( not ( = ?auto_266395 ?auto_266401 ) ) ( not ( = ?auto_266395 ?auto_266402 ) ) ( not ( = ?auto_266395 ?auto_266403 ) ) ( not ( = ?auto_266395 ?auto_266404 ) ) ( not ( = ?auto_266395 ?auto_266405 ) ) ( not ( = ?auto_266395 ?auto_266406 ) ) ( not ( = ?auto_266396 ?auto_266397 ) ) ( not ( = ?auto_266396 ?auto_266398 ) ) ( not ( = ?auto_266396 ?auto_266399 ) ) ( not ( = ?auto_266396 ?auto_266400 ) ) ( not ( = ?auto_266396 ?auto_266401 ) ) ( not ( = ?auto_266396 ?auto_266402 ) ) ( not ( = ?auto_266396 ?auto_266403 ) ) ( not ( = ?auto_266396 ?auto_266404 ) ) ( not ( = ?auto_266396 ?auto_266405 ) ) ( not ( = ?auto_266396 ?auto_266406 ) ) ( not ( = ?auto_266397 ?auto_266398 ) ) ( not ( = ?auto_266397 ?auto_266399 ) ) ( not ( = ?auto_266397 ?auto_266400 ) ) ( not ( = ?auto_266397 ?auto_266401 ) ) ( not ( = ?auto_266397 ?auto_266402 ) ) ( not ( = ?auto_266397 ?auto_266403 ) ) ( not ( = ?auto_266397 ?auto_266404 ) ) ( not ( = ?auto_266397 ?auto_266405 ) ) ( not ( = ?auto_266397 ?auto_266406 ) ) ( not ( = ?auto_266398 ?auto_266399 ) ) ( not ( = ?auto_266398 ?auto_266400 ) ) ( not ( = ?auto_266398 ?auto_266401 ) ) ( not ( = ?auto_266398 ?auto_266402 ) ) ( not ( = ?auto_266398 ?auto_266403 ) ) ( not ( = ?auto_266398 ?auto_266404 ) ) ( not ( = ?auto_266398 ?auto_266405 ) ) ( not ( = ?auto_266398 ?auto_266406 ) ) ( not ( = ?auto_266399 ?auto_266400 ) ) ( not ( = ?auto_266399 ?auto_266401 ) ) ( not ( = ?auto_266399 ?auto_266402 ) ) ( not ( = ?auto_266399 ?auto_266403 ) ) ( not ( = ?auto_266399 ?auto_266404 ) ) ( not ( = ?auto_266399 ?auto_266405 ) ) ( not ( = ?auto_266399 ?auto_266406 ) ) ( not ( = ?auto_266400 ?auto_266401 ) ) ( not ( = ?auto_266400 ?auto_266402 ) ) ( not ( = ?auto_266400 ?auto_266403 ) ) ( not ( = ?auto_266400 ?auto_266404 ) ) ( not ( = ?auto_266400 ?auto_266405 ) ) ( not ( = ?auto_266400 ?auto_266406 ) ) ( not ( = ?auto_266401 ?auto_266402 ) ) ( not ( = ?auto_266401 ?auto_266403 ) ) ( not ( = ?auto_266401 ?auto_266404 ) ) ( not ( = ?auto_266401 ?auto_266405 ) ) ( not ( = ?auto_266401 ?auto_266406 ) ) ( not ( = ?auto_266402 ?auto_266403 ) ) ( not ( = ?auto_266402 ?auto_266404 ) ) ( not ( = ?auto_266402 ?auto_266405 ) ) ( not ( = ?auto_266402 ?auto_266406 ) ) ( not ( = ?auto_266403 ?auto_266404 ) ) ( not ( = ?auto_266403 ?auto_266405 ) ) ( not ( = ?auto_266403 ?auto_266406 ) ) ( not ( = ?auto_266404 ?auto_266405 ) ) ( not ( = ?auto_266404 ?auto_266406 ) ) ( not ( = ?auto_266405 ?auto_266406 ) ) ( ON ?auto_266404 ?auto_266405 ) ( ON ?auto_266403 ?auto_266404 ) ( ON ?auto_266402 ?auto_266403 ) ( ON ?auto_266401 ?auto_266402 ) ( CLEAR ?auto_266399 ) ( ON ?auto_266400 ?auto_266401 ) ( CLEAR ?auto_266400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_266395 ?auto_266396 ?auto_266397 ?auto_266398 ?auto_266399 ?auto_266400 )
      ( MAKE-11PILE ?auto_266395 ?auto_266396 ?auto_266397 ?auto_266398 ?auto_266399 ?auto_266400 ?auto_266401 ?auto_266402 ?auto_266403 ?auto_266404 ?auto_266405 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266441 - BLOCK
      ?auto_266442 - BLOCK
      ?auto_266443 - BLOCK
      ?auto_266444 - BLOCK
      ?auto_266445 - BLOCK
      ?auto_266446 - BLOCK
      ?auto_266447 - BLOCK
      ?auto_266448 - BLOCK
      ?auto_266449 - BLOCK
      ?auto_266450 - BLOCK
      ?auto_266451 - BLOCK
    )
    :vars
    (
      ?auto_266452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266451 ?auto_266452 ) ( ON-TABLE ?auto_266441 ) ( ON ?auto_266442 ?auto_266441 ) ( ON ?auto_266443 ?auto_266442 ) ( ON ?auto_266444 ?auto_266443 ) ( not ( = ?auto_266441 ?auto_266442 ) ) ( not ( = ?auto_266441 ?auto_266443 ) ) ( not ( = ?auto_266441 ?auto_266444 ) ) ( not ( = ?auto_266441 ?auto_266445 ) ) ( not ( = ?auto_266441 ?auto_266446 ) ) ( not ( = ?auto_266441 ?auto_266447 ) ) ( not ( = ?auto_266441 ?auto_266448 ) ) ( not ( = ?auto_266441 ?auto_266449 ) ) ( not ( = ?auto_266441 ?auto_266450 ) ) ( not ( = ?auto_266441 ?auto_266451 ) ) ( not ( = ?auto_266441 ?auto_266452 ) ) ( not ( = ?auto_266442 ?auto_266443 ) ) ( not ( = ?auto_266442 ?auto_266444 ) ) ( not ( = ?auto_266442 ?auto_266445 ) ) ( not ( = ?auto_266442 ?auto_266446 ) ) ( not ( = ?auto_266442 ?auto_266447 ) ) ( not ( = ?auto_266442 ?auto_266448 ) ) ( not ( = ?auto_266442 ?auto_266449 ) ) ( not ( = ?auto_266442 ?auto_266450 ) ) ( not ( = ?auto_266442 ?auto_266451 ) ) ( not ( = ?auto_266442 ?auto_266452 ) ) ( not ( = ?auto_266443 ?auto_266444 ) ) ( not ( = ?auto_266443 ?auto_266445 ) ) ( not ( = ?auto_266443 ?auto_266446 ) ) ( not ( = ?auto_266443 ?auto_266447 ) ) ( not ( = ?auto_266443 ?auto_266448 ) ) ( not ( = ?auto_266443 ?auto_266449 ) ) ( not ( = ?auto_266443 ?auto_266450 ) ) ( not ( = ?auto_266443 ?auto_266451 ) ) ( not ( = ?auto_266443 ?auto_266452 ) ) ( not ( = ?auto_266444 ?auto_266445 ) ) ( not ( = ?auto_266444 ?auto_266446 ) ) ( not ( = ?auto_266444 ?auto_266447 ) ) ( not ( = ?auto_266444 ?auto_266448 ) ) ( not ( = ?auto_266444 ?auto_266449 ) ) ( not ( = ?auto_266444 ?auto_266450 ) ) ( not ( = ?auto_266444 ?auto_266451 ) ) ( not ( = ?auto_266444 ?auto_266452 ) ) ( not ( = ?auto_266445 ?auto_266446 ) ) ( not ( = ?auto_266445 ?auto_266447 ) ) ( not ( = ?auto_266445 ?auto_266448 ) ) ( not ( = ?auto_266445 ?auto_266449 ) ) ( not ( = ?auto_266445 ?auto_266450 ) ) ( not ( = ?auto_266445 ?auto_266451 ) ) ( not ( = ?auto_266445 ?auto_266452 ) ) ( not ( = ?auto_266446 ?auto_266447 ) ) ( not ( = ?auto_266446 ?auto_266448 ) ) ( not ( = ?auto_266446 ?auto_266449 ) ) ( not ( = ?auto_266446 ?auto_266450 ) ) ( not ( = ?auto_266446 ?auto_266451 ) ) ( not ( = ?auto_266446 ?auto_266452 ) ) ( not ( = ?auto_266447 ?auto_266448 ) ) ( not ( = ?auto_266447 ?auto_266449 ) ) ( not ( = ?auto_266447 ?auto_266450 ) ) ( not ( = ?auto_266447 ?auto_266451 ) ) ( not ( = ?auto_266447 ?auto_266452 ) ) ( not ( = ?auto_266448 ?auto_266449 ) ) ( not ( = ?auto_266448 ?auto_266450 ) ) ( not ( = ?auto_266448 ?auto_266451 ) ) ( not ( = ?auto_266448 ?auto_266452 ) ) ( not ( = ?auto_266449 ?auto_266450 ) ) ( not ( = ?auto_266449 ?auto_266451 ) ) ( not ( = ?auto_266449 ?auto_266452 ) ) ( not ( = ?auto_266450 ?auto_266451 ) ) ( not ( = ?auto_266450 ?auto_266452 ) ) ( not ( = ?auto_266451 ?auto_266452 ) ) ( ON ?auto_266450 ?auto_266451 ) ( ON ?auto_266449 ?auto_266450 ) ( ON ?auto_266448 ?auto_266449 ) ( ON ?auto_266447 ?auto_266448 ) ( ON ?auto_266446 ?auto_266447 ) ( CLEAR ?auto_266444 ) ( ON ?auto_266445 ?auto_266446 ) ( CLEAR ?auto_266445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_266441 ?auto_266442 ?auto_266443 ?auto_266444 ?auto_266445 )
      ( MAKE-11PILE ?auto_266441 ?auto_266442 ?auto_266443 ?auto_266444 ?auto_266445 ?auto_266446 ?auto_266447 ?auto_266448 ?auto_266449 ?auto_266450 ?auto_266451 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266487 - BLOCK
      ?auto_266488 - BLOCK
      ?auto_266489 - BLOCK
      ?auto_266490 - BLOCK
      ?auto_266491 - BLOCK
      ?auto_266492 - BLOCK
      ?auto_266493 - BLOCK
      ?auto_266494 - BLOCK
      ?auto_266495 - BLOCK
      ?auto_266496 - BLOCK
      ?auto_266497 - BLOCK
    )
    :vars
    (
      ?auto_266498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266497 ?auto_266498 ) ( ON-TABLE ?auto_266487 ) ( ON ?auto_266488 ?auto_266487 ) ( ON ?auto_266489 ?auto_266488 ) ( not ( = ?auto_266487 ?auto_266488 ) ) ( not ( = ?auto_266487 ?auto_266489 ) ) ( not ( = ?auto_266487 ?auto_266490 ) ) ( not ( = ?auto_266487 ?auto_266491 ) ) ( not ( = ?auto_266487 ?auto_266492 ) ) ( not ( = ?auto_266487 ?auto_266493 ) ) ( not ( = ?auto_266487 ?auto_266494 ) ) ( not ( = ?auto_266487 ?auto_266495 ) ) ( not ( = ?auto_266487 ?auto_266496 ) ) ( not ( = ?auto_266487 ?auto_266497 ) ) ( not ( = ?auto_266487 ?auto_266498 ) ) ( not ( = ?auto_266488 ?auto_266489 ) ) ( not ( = ?auto_266488 ?auto_266490 ) ) ( not ( = ?auto_266488 ?auto_266491 ) ) ( not ( = ?auto_266488 ?auto_266492 ) ) ( not ( = ?auto_266488 ?auto_266493 ) ) ( not ( = ?auto_266488 ?auto_266494 ) ) ( not ( = ?auto_266488 ?auto_266495 ) ) ( not ( = ?auto_266488 ?auto_266496 ) ) ( not ( = ?auto_266488 ?auto_266497 ) ) ( not ( = ?auto_266488 ?auto_266498 ) ) ( not ( = ?auto_266489 ?auto_266490 ) ) ( not ( = ?auto_266489 ?auto_266491 ) ) ( not ( = ?auto_266489 ?auto_266492 ) ) ( not ( = ?auto_266489 ?auto_266493 ) ) ( not ( = ?auto_266489 ?auto_266494 ) ) ( not ( = ?auto_266489 ?auto_266495 ) ) ( not ( = ?auto_266489 ?auto_266496 ) ) ( not ( = ?auto_266489 ?auto_266497 ) ) ( not ( = ?auto_266489 ?auto_266498 ) ) ( not ( = ?auto_266490 ?auto_266491 ) ) ( not ( = ?auto_266490 ?auto_266492 ) ) ( not ( = ?auto_266490 ?auto_266493 ) ) ( not ( = ?auto_266490 ?auto_266494 ) ) ( not ( = ?auto_266490 ?auto_266495 ) ) ( not ( = ?auto_266490 ?auto_266496 ) ) ( not ( = ?auto_266490 ?auto_266497 ) ) ( not ( = ?auto_266490 ?auto_266498 ) ) ( not ( = ?auto_266491 ?auto_266492 ) ) ( not ( = ?auto_266491 ?auto_266493 ) ) ( not ( = ?auto_266491 ?auto_266494 ) ) ( not ( = ?auto_266491 ?auto_266495 ) ) ( not ( = ?auto_266491 ?auto_266496 ) ) ( not ( = ?auto_266491 ?auto_266497 ) ) ( not ( = ?auto_266491 ?auto_266498 ) ) ( not ( = ?auto_266492 ?auto_266493 ) ) ( not ( = ?auto_266492 ?auto_266494 ) ) ( not ( = ?auto_266492 ?auto_266495 ) ) ( not ( = ?auto_266492 ?auto_266496 ) ) ( not ( = ?auto_266492 ?auto_266497 ) ) ( not ( = ?auto_266492 ?auto_266498 ) ) ( not ( = ?auto_266493 ?auto_266494 ) ) ( not ( = ?auto_266493 ?auto_266495 ) ) ( not ( = ?auto_266493 ?auto_266496 ) ) ( not ( = ?auto_266493 ?auto_266497 ) ) ( not ( = ?auto_266493 ?auto_266498 ) ) ( not ( = ?auto_266494 ?auto_266495 ) ) ( not ( = ?auto_266494 ?auto_266496 ) ) ( not ( = ?auto_266494 ?auto_266497 ) ) ( not ( = ?auto_266494 ?auto_266498 ) ) ( not ( = ?auto_266495 ?auto_266496 ) ) ( not ( = ?auto_266495 ?auto_266497 ) ) ( not ( = ?auto_266495 ?auto_266498 ) ) ( not ( = ?auto_266496 ?auto_266497 ) ) ( not ( = ?auto_266496 ?auto_266498 ) ) ( not ( = ?auto_266497 ?auto_266498 ) ) ( ON ?auto_266496 ?auto_266497 ) ( ON ?auto_266495 ?auto_266496 ) ( ON ?auto_266494 ?auto_266495 ) ( ON ?auto_266493 ?auto_266494 ) ( ON ?auto_266492 ?auto_266493 ) ( ON ?auto_266491 ?auto_266492 ) ( CLEAR ?auto_266489 ) ( ON ?auto_266490 ?auto_266491 ) ( CLEAR ?auto_266490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_266487 ?auto_266488 ?auto_266489 ?auto_266490 )
      ( MAKE-11PILE ?auto_266487 ?auto_266488 ?auto_266489 ?auto_266490 ?auto_266491 ?auto_266492 ?auto_266493 ?auto_266494 ?auto_266495 ?auto_266496 ?auto_266497 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266533 - BLOCK
      ?auto_266534 - BLOCK
      ?auto_266535 - BLOCK
      ?auto_266536 - BLOCK
      ?auto_266537 - BLOCK
      ?auto_266538 - BLOCK
      ?auto_266539 - BLOCK
      ?auto_266540 - BLOCK
      ?auto_266541 - BLOCK
      ?auto_266542 - BLOCK
      ?auto_266543 - BLOCK
    )
    :vars
    (
      ?auto_266544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266543 ?auto_266544 ) ( ON-TABLE ?auto_266533 ) ( ON ?auto_266534 ?auto_266533 ) ( not ( = ?auto_266533 ?auto_266534 ) ) ( not ( = ?auto_266533 ?auto_266535 ) ) ( not ( = ?auto_266533 ?auto_266536 ) ) ( not ( = ?auto_266533 ?auto_266537 ) ) ( not ( = ?auto_266533 ?auto_266538 ) ) ( not ( = ?auto_266533 ?auto_266539 ) ) ( not ( = ?auto_266533 ?auto_266540 ) ) ( not ( = ?auto_266533 ?auto_266541 ) ) ( not ( = ?auto_266533 ?auto_266542 ) ) ( not ( = ?auto_266533 ?auto_266543 ) ) ( not ( = ?auto_266533 ?auto_266544 ) ) ( not ( = ?auto_266534 ?auto_266535 ) ) ( not ( = ?auto_266534 ?auto_266536 ) ) ( not ( = ?auto_266534 ?auto_266537 ) ) ( not ( = ?auto_266534 ?auto_266538 ) ) ( not ( = ?auto_266534 ?auto_266539 ) ) ( not ( = ?auto_266534 ?auto_266540 ) ) ( not ( = ?auto_266534 ?auto_266541 ) ) ( not ( = ?auto_266534 ?auto_266542 ) ) ( not ( = ?auto_266534 ?auto_266543 ) ) ( not ( = ?auto_266534 ?auto_266544 ) ) ( not ( = ?auto_266535 ?auto_266536 ) ) ( not ( = ?auto_266535 ?auto_266537 ) ) ( not ( = ?auto_266535 ?auto_266538 ) ) ( not ( = ?auto_266535 ?auto_266539 ) ) ( not ( = ?auto_266535 ?auto_266540 ) ) ( not ( = ?auto_266535 ?auto_266541 ) ) ( not ( = ?auto_266535 ?auto_266542 ) ) ( not ( = ?auto_266535 ?auto_266543 ) ) ( not ( = ?auto_266535 ?auto_266544 ) ) ( not ( = ?auto_266536 ?auto_266537 ) ) ( not ( = ?auto_266536 ?auto_266538 ) ) ( not ( = ?auto_266536 ?auto_266539 ) ) ( not ( = ?auto_266536 ?auto_266540 ) ) ( not ( = ?auto_266536 ?auto_266541 ) ) ( not ( = ?auto_266536 ?auto_266542 ) ) ( not ( = ?auto_266536 ?auto_266543 ) ) ( not ( = ?auto_266536 ?auto_266544 ) ) ( not ( = ?auto_266537 ?auto_266538 ) ) ( not ( = ?auto_266537 ?auto_266539 ) ) ( not ( = ?auto_266537 ?auto_266540 ) ) ( not ( = ?auto_266537 ?auto_266541 ) ) ( not ( = ?auto_266537 ?auto_266542 ) ) ( not ( = ?auto_266537 ?auto_266543 ) ) ( not ( = ?auto_266537 ?auto_266544 ) ) ( not ( = ?auto_266538 ?auto_266539 ) ) ( not ( = ?auto_266538 ?auto_266540 ) ) ( not ( = ?auto_266538 ?auto_266541 ) ) ( not ( = ?auto_266538 ?auto_266542 ) ) ( not ( = ?auto_266538 ?auto_266543 ) ) ( not ( = ?auto_266538 ?auto_266544 ) ) ( not ( = ?auto_266539 ?auto_266540 ) ) ( not ( = ?auto_266539 ?auto_266541 ) ) ( not ( = ?auto_266539 ?auto_266542 ) ) ( not ( = ?auto_266539 ?auto_266543 ) ) ( not ( = ?auto_266539 ?auto_266544 ) ) ( not ( = ?auto_266540 ?auto_266541 ) ) ( not ( = ?auto_266540 ?auto_266542 ) ) ( not ( = ?auto_266540 ?auto_266543 ) ) ( not ( = ?auto_266540 ?auto_266544 ) ) ( not ( = ?auto_266541 ?auto_266542 ) ) ( not ( = ?auto_266541 ?auto_266543 ) ) ( not ( = ?auto_266541 ?auto_266544 ) ) ( not ( = ?auto_266542 ?auto_266543 ) ) ( not ( = ?auto_266542 ?auto_266544 ) ) ( not ( = ?auto_266543 ?auto_266544 ) ) ( ON ?auto_266542 ?auto_266543 ) ( ON ?auto_266541 ?auto_266542 ) ( ON ?auto_266540 ?auto_266541 ) ( ON ?auto_266539 ?auto_266540 ) ( ON ?auto_266538 ?auto_266539 ) ( ON ?auto_266537 ?auto_266538 ) ( ON ?auto_266536 ?auto_266537 ) ( CLEAR ?auto_266534 ) ( ON ?auto_266535 ?auto_266536 ) ( CLEAR ?auto_266535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_266533 ?auto_266534 ?auto_266535 )
      ( MAKE-11PILE ?auto_266533 ?auto_266534 ?auto_266535 ?auto_266536 ?auto_266537 ?auto_266538 ?auto_266539 ?auto_266540 ?auto_266541 ?auto_266542 ?auto_266543 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266579 - BLOCK
      ?auto_266580 - BLOCK
      ?auto_266581 - BLOCK
      ?auto_266582 - BLOCK
      ?auto_266583 - BLOCK
      ?auto_266584 - BLOCK
      ?auto_266585 - BLOCK
      ?auto_266586 - BLOCK
      ?auto_266587 - BLOCK
      ?auto_266588 - BLOCK
      ?auto_266589 - BLOCK
    )
    :vars
    (
      ?auto_266590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266589 ?auto_266590 ) ( ON-TABLE ?auto_266579 ) ( not ( = ?auto_266579 ?auto_266580 ) ) ( not ( = ?auto_266579 ?auto_266581 ) ) ( not ( = ?auto_266579 ?auto_266582 ) ) ( not ( = ?auto_266579 ?auto_266583 ) ) ( not ( = ?auto_266579 ?auto_266584 ) ) ( not ( = ?auto_266579 ?auto_266585 ) ) ( not ( = ?auto_266579 ?auto_266586 ) ) ( not ( = ?auto_266579 ?auto_266587 ) ) ( not ( = ?auto_266579 ?auto_266588 ) ) ( not ( = ?auto_266579 ?auto_266589 ) ) ( not ( = ?auto_266579 ?auto_266590 ) ) ( not ( = ?auto_266580 ?auto_266581 ) ) ( not ( = ?auto_266580 ?auto_266582 ) ) ( not ( = ?auto_266580 ?auto_266583 ) ) ( not ( = ?auto_266580 ?auto_266584 ) ) ( not ( = ?auto_266580 ?auto_266585 ) ) ( not ( = ?auto_266580 ?auto_266586 ) ) ( not ( = ?auto_266580 ?auto_266587 ) ) ( not ( = ?auto_266580 ?auto_266588 ) ) ( not ( = ?auto_266580 ?auto_266589 ) ) ( not ( = ?auto_266580 ?auto_266590 ) ) ( not ( = ?auto_266581 ?auto_266582 ) ) ( not ( = ?auto_266581 ?auto_266583 ) ) ( not ( = ?auto_266581 ?auto_266584 ) ) ( not ( = ?auto_266581 ?auto_266585 ) ) ( not ( = ?auto_266581 ?auto_266586 ) ) ( not ( = ?auto_266581 ?auto_266587 ) ) ( not ( = ?auto_266581 ?auto_266588 ) ) ( not ( = ?auto_266581 ?auto_266589 ) ) ( not ( = ?auto_266581 ?auto_266590 ) ) ( not ( = ?auto_266582 ?auto_266583 ) ) ( not ( = ?auto_266582 ?auto_266584 ) ) ( not ( = ?auto_266582 ?auto_266585 ) ) ( not ( = ?auto_266582 ?auto_266586 ) ) ( not ( = ?auto_266582 ?auto_266587 ) ) ( not ( = ?auto_266582 ?auto_266588 ) ) ( not ( = ?auto_266582 ?auto_266589 ) ) ( not ( = ?auto_266582 ?auto_266590 ) ) ( not ( = ?auto_266583 ?auto_266584 ) ) ( not ( = ?auto_266583 ?auto_266585 ) ) ( not ( = ?auto_266583 ?auto_266586 ) ) ( not ( = ?auto_266583 ?auto_266587 ) ) ( not ( = ?auto_266583 ?auto_266588 ) ) ( not ( = ?auto_266583 ?auto_266589 ) ) ( not ( = ?auto_266583 ?auto_266590 ) ) ( not ( = ?auto_266584 ?auto_266585 ) ) ( not ( = ?auto_266584 ?auto_266586 ) ) ( not ( = ?auto_266584 ?auto_266587 ) ) ( not ( = ?auto_266584 ?auto_266588 ) ) ( not ( = ?auto_266584 ?auto_266589 ) ) ( not ( = ?auto_266584 ?auto_266590 ) ) ( not ( = ?auto_266585 ?auto_266586 ) ) ( not ( = ?auto_266585 ?auto_266587 ) ) ( not ( = ?auto_266585 ?auto_266588 ) ) ( not ( = ?auto_266585 ?auto_266589 ) ) ( not ( = ?auto_266585 ?auto_266590 ) ) ( not ( = ?auto_266586 ?auto_266587 ) ) ( not ( = ?auto_266586 ?auto_266588 ) ) ( not ( = ?auto_266586 ?auto_266589 ) ) ( not ( = ?auto_266586 ?auto_266590 ) ) ( not ( = ?auto_266587 ?auto_266588 ) ) ( not ( = ?auto_266587 ?auto_266589 ) ) ( not ( = ?auto_266587 ?auto_266590 ) ) ( not ( = ?auto_266588 ?auto_266589 ) ) ( not ( = ?auto_266588 ?auto_266590 ) ) ( not ( = ?auto_266589 ?auto_266590 ) ) ( ON ?auto_266588 ?auto_266589 ) ( ON ?auto_266587 ?auto_266588 ) ( ON ?auto_266586 ?auto_266587 ) ( ON ?auto_266585 ?auto_266586 ) ( ON ?auto_266584 ?auto_266585 ) ( ON ?auto_266583 ?auto_266584 ) ( ON ?auto_266582 ?auto_266583 ) ( ON ?auto_266581 ?auto_266582 ) ( CLEAR ?auto_266579 ) ( ON ?auto_266580 ?auto_266581 ) ( CLEAR ?auto_266580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_266579 ?auto_266580 )
      ( MAKE-11PILE ?auto_266579 ?auto_266580 ?auto_266581 ?auto_266582 ?auto_266583 ?auto_266584 ?auto_266585 ?auto_266586 ?auto_266587 ?auto_266588 ?auto_266589 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266625 - BLOCK
      ?auto_266626 - BLOCK
      ?auto_266627 - BLOCK
      ?auto_266628 - BLOCK
      ?auto_266629 - BLOCK
      ?auto_266630 - BLOCK
      ?auto_266631 - BLOCK
      ?auto_266632 - BLOCK
      ?auto_266633 - BLOCK
      ?auto_266634 - BLOCK
      ?auto_266635 - BLOCK
    )
    :vars
    (
      ?auto_266636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266635 ?auto_266636 ) ( not ( = ?auto_266625 ?auto_266626 ) ) ( not ( = ?auto_266625 ?auto_266627 ) ) ( not ( = ?auto_266625 ?auto_266628 ) ) ( not ( = ?auto_266625 ?auto_266629 ) ) ( not ( = ?auto_266625 ?auto_266630 ) ) ( not ( = ?auto_266625 ?auto_266631 ) ) ( not ( = ?auto_266625 ?auto_266632 ) ) ( not ( = ?auto_266625 ?auto_266633 ) ) ( not ( = ?auto_266625 ?auto_266634 ) ) ( not ( = ?auto_266625 ?auto_266635 ) ) ( not ( = ?auto_266625 ?auto_266636 ) ) ( not ( = ?auto_266626 ?auto_266627 ) ) ( not ( = ?auto_266626 ?auto_266628 ) ) ( not ( = ?auto_266626 ?auto_266629 ) ) ( not ( = ?auto_266626 ?auto_266630 ) ) ( not ( = ?auto_266626 ?auto_266631 ) ) ( not ( = ?auto_266626 ?auto_266632 ) ) ( not ( = ?auto_266626 ?auto_266633 ) ) ( not ( = ?auto_266626 ?auto_266634 ) ) ( not ( = ?auto_266626 ?auto_266635 ) ) ( not ( = ?auto_266626 ?auto_266636 ) ) ( not ( = ?auto_266627 ?auto_266628 ) ) ( not ( = ?auto_266627 ?auto_266629 ) ) ( not ( = ?auto_266627 ?auto_266630 ) ) ( not ( = ?auto_266627 ?auto_266631 ) ) ( not ( = ?auto_266627 ?auto_266632 ) ) ( not ( = ?auto_266627 ?auto_266633 ) ) ( not ( = ?auto_266627 ?auto_266634 ) ) ( not ( = ?auto_266627 ?auto_266635 ) ) ( not ( = ?auto_266627 ?auto_266636 ) ) ( not ( = ?auto_266628 ?auto_266629 ) ) ( not ( = ?auto_266628 ?auto_266630 ) ) ( not ( = ?auto_266628 ?auto_266631 ) ) ( not ( = ?auto_266628 ?auto_266632 ) ) ( not ( = ?auto_266628 ?auto_266633 ) ) ( not ( = ?auto_266628 ?auto_266634 ) ) ( not ( = ?auto_266628 ?auto_266635 ) ) ( not ( = ?auto_266628 ?auto_266636 ) ) ( not ( = ?auto_266629 ?auto_266630 ) ) ( not ( = ?auto_266629 ?auto_266631 ) ) ( not ( = ?auto_266629 ?auto_266632 ) ) ( not ( = ?auto_266629 ?auto_266633 ) ) ( not ( = ?auto_266629 ?auto_266634 ) ) ( not ( = ?auto_266629 ?auto_266635 ) ) ( not ( = ?auto_266629 ?auto_266636 ) ) ( not ( = ?auto_266630 ?auto_266631 ) ) ( not ( = ?auto_266630 ?auto_266632 ) ) ( not ( = ?auto_266630 ?auto_266633 ) ) ( not ( = ?auto_266630 ?auto_266634 ) ) ( not ( = ?auto_266630 ?auto_266635 ) ) ( not ( = ?auto_266630 ?auto_266636 ) ) ( not ( = ?auto_266631 ?auto_266632 ) ) ( not ( = ?auto_266631 ?auto_266633 ) ) ( not ( = ?auto_266631 ?auto_266634 ) ) ( not ( = ?auto_266631 ?auto_266635 ) ) ( not ( = ?auto_266631 ?auto_266636 ) ) ( not ( = ?auto_266632 ?auto_266633 ) ) ( not ( = ?auto_266632 ?auto_266634 ) ) ( not ( = ?auto_266632 ?auto_266635 ) ) ( not ( = ?auto_266632 ?auto_266636 ) ) ( not ( = ?auto_266633 ?auto_266634 ) ) ( not ( = ?auto_266633 ?auto_266635 ) ) ( not ( = ?auto_266633 ?auto_266636 ) ) ( not ( = ?auto_266634 ?auto_266635 ) ) ( not ( = ?auto_266634 ?auto_266636 ) ) ( not ( = ?auto_266635 ?auto_266636 ) ) ( ON ?auto_266634 ?auto_266635 ) ( ON ?auto_266633 ?auto_266634 ) ( ON ?auto_266632 ?auto_266633 ) ( ON ?auto_266631 ?auto_266632 ) ( ON ?auto_266630 ?auto_266631 ) ( ON ?auto_266629 ?auto_266630 ) ( ON ?auto_266628 ?auto_266629 ) ( ON ?auto_266627 ?auto_266628 ) ( ON ?auto_266626 ?auto_266627 ) ( ON ?auto_266625 ?auto_266626 ) ( CLEAR ?auto_266625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_266625 )
      ( MAKE-11PILE ?auto_266625 ?auto_266626 ?auto_266627 ?auto_266628 ?auto_266629 ?auto_266630 ?auto_266631 ?auto_266632 ?auto_266633 ?auto_266634 ?auto_266635 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266672 - BLOCK
      ?auto_266673 - BLOCK
      ?auto_266674 - BLOCK
      ?auto_266675 - BLOCK
      ?auto_266676 - BLOCK
      ?auto_266677 - BLOCK
      ?auto_266678 - BLOCK
      ?auto_266679 - BLOCK
      ?auto_266680 - BLOCK
      ?auto_266681 - BLOCK
      ?auto_266682 - BLOCK
      ?auto_266683 - BLOCK
    )
    :vars
    (
      ?auto_266684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_266682 ) ( ON ?auto_266683 ?auto_266684 ) ( CLEAR ?auto_266683 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_266672 ) ( ON ?auto_266673 ?auto_266672 ) ( ON ?auto_266674 ?auto_266673 ) ( ON ?auto_266675 ?auto_266674 ) ( ON ?auto_266676 ?auto_266675 ) ( ON ?auto_266677 ?auto_266676 ) ( ON ?auto_266678 ?auto_266677 ) ( ON ?auto_266679 ?auto_266678 ) ( ON ?auto_266680 ?auto_266679 ) ( ON ?auto_266681 ?auto_266680 ) ( ON ?auto_266682 ?auto_266681 ) ( not ( = ?auto_266672 ?auto_266673 ) ) ( not ( = ?auto_266672 ?auto_266674 ) ) ( not ( = ?auto_266672 ?auto_266675 ) ) ( not ( = ?auto_266672 ?auto_266676 ) ) ( not ( = ?auto_266672 ?auto_266677 ) ) ( not ( = ?auto_266672 ?auto_266678 ) ) ( not ( = ?auto_266672 ?auto_266679 ) ) ( not ( = ?auto_266672 ?auto_266680 ) ) ( not ( = ?auto_266672 ?auto_266681 ) ) ( not ( = ?auto_266672 ?auto_266682 ) ) ( not ( = ?auto_266672 ?auto_266683 ) ) ( not ( = ?auto_266672 ?auto_266684 ) ) ( not ( = ?auto_266673 ?auto_266674 ) ) ( not ( = ?auto_266673 ?auto_266675 ) ) ( not ( = ?auto_266673 ?auto_266676 ) ) ( not ( = ?auto_266673 ?auto_266677 ) ) ( not ( = ?auto_266673 ?auto_266678 ) ) ( not ( = ?auto_266673 ?auto_266679 ) ) ( not ( = ?auto_266673 ?auto_266680 ) ) ( not ( = ?auto_266673 ?auto_266681 ) ) ( not ( = ?auto_266673 ?auto_266682 ) ) ( not ( = ?auto_266673 ?auto_266683 ) ) ( not ( = ?auto_266673 ?auto_266684 ) ) ( not ( = ?auto_266674 ?auto_266675 ) ) ( not ( = ?auto_266674 ?auto_266676 ) ) ( not ( = ?auto_266674 ?auto_266677 ) ) ( not ( = ?auto_266674 ?auto_266678 ) ) ( not ( = ?auto_266674 ?auto_266679 ) ) ( not ( = ?auto_266674 ?auto_266680 ) ) ( not ( = ?auto_266674 ?auto_266681 ) ) ( not ( = ?auto_266674 ?auto_266682 ) ) ( not ( = ?auto_266674 ?auto_266683 ) ) ( not ( = ?auto_266674 ?auto_266684 ) ) ( not ( = ?auto_266675 ?auto_266676 ) ) ( not ( = ?auto_266675 ?auto_266677 ) ) ( not ( = ?auto_266675 ?auto_266678 ) ) ( not ( = ?auto_266675 ?auto_266679 ) ) ( not ( = ?auto_266675 ?auto_266680 ) ) ( not ( = ?auto_266675 ?auto_266681 ) ) ( not ( = ?auto_266675 ?auto_266682 ) ) ( not ( = ?auto_266675 ?auto_266683 ) ) ( not ( = ?auto_266675 ?auto_266684 ) ) ( not ( = ?auto_266676 ?auto_266677 ) ) ( not ( = ?auto_266676 ?auto_266678 ) ) ( not ( = ?auto_266676 ?auto_266679 ) ) ( not ( = ?auto_266676 ?auto_266680 ) ) ( not ( = ?auto_266676 ?auto_266681 ) ) ( not ( = ?auto_266676 ?auto_266682 ) ) ( not ( = ?auto_266676 ?auto_266683 ) ) ( not ( = ?auto_266676 ?auto_266684 ) ) ( not ( = ?auto_266677 ?auto_266678 ) ) ( not ( = ?auto_266677 ?auto_266679 ) ) ( not ( = ?auto_266677 ?auto_266680 ) ) ( not ( = ?auto_266677 ?auto_266681 ) ) ( not ( = ?auto_266677 ?auto_266682 ) ) ( not ( = ?auto_266677 ?auto_266683 ) ) ( not ( = ?auto_266677 ?auto_266684 ) ) ( not ( = ?auto_266678 ?auto_266679 ) ) ( not ( = ?auto_266678 ?auto_266680 ) ) ( not ( = ?auto_266678 ?auto_266681 ) ) ( not ( = ?auto_266678 ?auto_266682 ) ) ( not ( = ?auto_266678 ?auto_266683 ) ) ( not ( = ?auto_266678 ?auto_266684 ) ) ( not ( = ?auto_266679 ?auto_266680 ) ) ( not ( = ?auto_266679 ?auto_266681 ) ) ( not ( = ?auto_266679 ?auto_266682 ) ) ( not ( = ?auto_266679 ?auto_266683 ) ) ( not ( = ?auto_266679 ?auto_266684 ) ) ( not ( = ?auto_266680 ?auto_266681 ) ) ( not ( = ?auto_266680 ?auto_266682 ) ) ( not ( = ?auto_266680 ?auto_266683 ) ) ( not ( = ?auto_266680 ?auto_266684 ) ) ( not ( = ?auto_266681 ?auto_266682 ) ) ( not ( = ?auto_266681 ?auto_266683 ) ) ( not ( = ?auto_266681 ?auto_266684 ) ) ( not ( = ?auto_266682 ?auto_266683 ) ) ( not ( = ?auto_266682 ?auto_266684 ) ) ( not ( = ?auto_266683 ?auto_266684 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_266683 ?auto_266684 )
      ( !STACK ?auto_266683 ?auto_266682 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266722 - BLOCK
      ?auto_266723 - BLOCK
      ?auto_266724 - BLOCK
      ?auto_266725 - BLOCK
      ?auto_266726 - BLOCK
      ?auto_266727 - BLOCK
      ?auto_266728 - BLOCK
      ?auto_266729 - BLOCK
      ?auto_266730 - BLOCK
      ?auto_266731 - BLOCK
      ?auto_266732 - BLOCK
      ?auto_266733 - BLOCK
    )
    :vars
    (
      ?auto_266734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266733 ?auto_266734 ) ( ON-TABLE ?auto_266722 ) ( ON ?auto_266723 ?auto_266722 ) ( ON ?auto_266724 ?auto_266723 ) ( ON ?auto_266725 ?auto_266724 ) ( ON ?auto_266726 ?auto_266725 ) ( ON ?auto_266727 ?auto_266726 ) ( ON ?auto_266728 ?auto_266727 ) ( ON ?auto_266729 ?auto_266728 ) ( ON ?auto_266730 ?auto_266729 ) ( ON ?auto_266731 ?auto_266730 ) ( not ( = ?auto_266722 ?auto_266723 ) ) ( not ( = ?auto_266722 ?auto_266724 ) ) ( not ( = ?auto_266722 ?auto_266725 ) ) ( not ( = ?auto_266722 ?auto_266726 ) ) ( not ( = ?auto_266722 ?auto_266727 ) ) ( not ( = ?auto_266722 ?auto_266728 ) ) ( not ( = ?auto_266722 ?auto_266729 ) ) ( not ( = ?auto_266722 ?auto_266730 ) ) ( not ( = ?auto_266722 ?auto_266731 ) ) ( not ( = ?auto_266722 ?auto_266732 ) ) ( not ( = ?auto_266722 ?auto_266733 ) ) ( not ( = ?auto_266722 ?auto_266734 ) ) ( not ( = ?auto_266723 ?auto_266724 ) ) ( not ( = ?auto_266723 ?auto_266725 ) ) ( not ( = ?auto_266723 ?auto_266726 ) ) ( not ( = ?auto_266723 ?auto_266727 ) ) ( not ( = ?auto_266723 ?auto_266728 ) ) ( not ( = ?auto_266723 ?auto_266729 ) ) ( not ( = ?auto_266723 ?auto_266730 ) ) ( not ( = ?auto_266723 ?auto_266731 ) ) ( not ( = ?auto_266723 ?auto_266732 ) ) ( not ( = ?auto_266723 ?auto_266733 ) ) ( not ( = ?auto_266723 ?auto_266734 ) ) ( not ( = ?auto_266724 ?auto_266725 ) ) ( not ( = ?auto_266724 ?auto_266726 ) ) ( not ( = ?auto_266724 ?auto_266727 ) ) ( not ( = ?auto_266724 ?auto_266728 ) ) ( not ( = ?auto_266724 ?auto_266729 ) ) ( not ( = ?auto_266724 ?auto_266730 ) ) ( not ( = ?auto_266724 ?auto_266731 ) ) ( not ( = ?auto_266724 ?auto_266732 ) ) ( not ( = ?auto_266724 ?auto_266733 ) ) ( not ( = ?auto_266724 ?auto_266734 ) ) ( not ( = ?auto_266725 ?auto_266726 ) ) ( not ( = ?auto_266725 ?auto_266727 ) ) ( not ( = ?auto_266725 ?auto_266728 ) ) ( not ( = ?auto_266725 ?auto_266729 ) ) ( not ( = ?auto_266725 ?auto_266730 ) ) ( not ( = ?auto_266725 ?auto_266731 ) ) ( not ( = ?auto_266725 ?auto_266732 ) ) ( not ( = ?auto_266725 ?auto_266733 ) ) ( not ( = ?auto_266725 ?auto_266734 ) ) ( not ( = ?auto_266726 ?auto_266727 ) ) ( not ( = ?auto_266726 ?auto_266728 ) ) ( not ( = ?auto_266726 ?auto_266729 ) ) ( not ( = ?auto_266726 ?auto_266730 ) ) ( not ( = ?auto_266726 ?auto_266731 ) ) ( not ( = ?auto_266726 ?auto_266732 ) ) ( not ( = ?auto_266726 ?auto_266733 ) ) ( not ( = ?auto_266726 ?auto_266734 ) ) ( not ( = ?auto_266727 ?auto_266728 ) ) ( not ( = ?auto_266727 ?auto_266729 ) ) ( not ( = ?auto_266727 ?auto_266730 ) ) ( not ( = ?auto_266727 ?auto_266731 ) ) ( not ( = ?auto_266727 ?auto_266732 ) ) ( not ( = ?auto_266727 ?auto_266733 ) ) ( not ( = ?auto_266727 ?auto_266734 ) ) ( not ( = ?auto_266728 ?auto_266729 ) ) ( not ( = ?auto_266728 ?auto_266730 ) ) ( not ( = ?auto_266728 ?auto_266731 ) ) ( not ( = ?auto_266728 ?auto_266732 ) ) ( not ( = ?auto_266728 ?auto_266733 ) ) ( not ( = ?auto_266728 ?auto_266734 ) ) ( not ( = ?auto_266729 ?auto_266730 ) ) ( not ( = ?auto_266729 ?auto_266731 ) ) ( not ( = ?auto_266729 ?auto_266732 ) ) ( not ( = ?auto_266729 ?auto_266733 ) ) ( not ( = ?auto_266729 ?auto_266734 ) ) ( not ( = ?auto_266730 ?auto_266731 ) ) ( not ( = ?auto_266730 ?auto_266732 ) ) ( not ( = ?auto_266730 ?auto_266733 ) ) ( not ( = ?auto_266730 ?auto_266734 ) ) ( not ( = ?auto_266731 ?auto_266732 ) ) ( not ( = ?auto_266731 ?auto_266733 ) ) ( not ( = ?auto_266731 ?auto_266734 ) ) ( not ( = ?auto_266732 ?auto_266733 ) ) ( not ( = ?auto_266732 ?auto_266734 ) ) ( not ( = ?auto_266733 ?auto_266734 ) ) ( CLEAR ?auto_266731 ) ( ON ?auto_266732 ?auto_266733 ) ( CLEAR ?auto_266732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_266722 ?auto_266723 ?auto_266724 ?auto_266725 ?auto_266726 ?auto_266727 ?auto_266728 ?auto_266729 ?auto_266730 ?auto_266731 ?auto_266732 )
      ( MAKE-12PILE ?auto_266722 ?auto_266723 ?auto_266724 ?auto_266725 ?auto_266726 ?auto_266727 ?auto_266728 ?auto_266729 ?auto_266730 ?auto_266731 ?auto_266732 ?auto_266733 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266772 - BLOCK
      ?auto_266773 - BLOCK
      ?auto_266774 - BLOCK
      ?auto_266775 - BLOCK
      ?auto_266776 - BLOCK
      ?auto_266777 - BLOCK
      ?auto_266778 - BLOCK
      ?auto_266779 - BLOCK
      ?auto_266780 - BLOCK
      ?auto_266781 - BLOCK
      ?auto_266782 - BLOCK
      ?auto_266783 - BLOCK
    )
    :vars
    (
      ?auto_266784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266783 ?auto_266784 ) ( ON-TABLE ?auto_266772 ) ( ON ?auto_266773 ?auto_266772 ) ( ON ?auto_266774 ?auto_266773 ) ( ON ?auto_266775 ?auto_266774 ) ( ON ?auto_266776 ?auto_266775 ) ( ON ?auto_266777 ?auto_266776 ) ( ON ?auto_266778 ?auto_266777 ) ( ON ?auto_266779 ?auto_266778 ) ( ON ?auto_266780 ?auto_266779 ) ( not ( = ?auto_266772 ?auto_266773 ) ) ( not ( = ?auto_266772 ?auto_266774 ) ) ( not ( = ?auto_266772 ?auto_266775 ) ) ( not ( = ?auto_266772 ?auto_266776 ) ) ( not ( = ?auto_266772 ?auto_266777 ) ) ( not ( = ?auto_266772 ?auto_266778 ) ) ( not ( = ?auto_266772 ?auto_266779 ) ) ( not ( = ?auto_266772 ?auto_266780 ) ) ( not ( = ?auto_266772 ?auto_266781 ) ) ( not ( = ?auto_266772 ?auto_266782 ) ) ( not ( = ?auto_266772 ?auto_266783 ) ) ( not ( = ?auto_266772 ?auto_266784 ) ) ( not ( = ?auto_266773 ?auto_266774 ) ) ( not ( = ?auto_266773 ?auto_266775 ) ) ( not ( = ?auto_266773 ?auto_266776 ) ) ( not ( = ?auto_266773 ?auto_266777 ) ) ( not ( = ?auto_266773 ?auto_266778 ) ) ( not ( = ?auto_266773 ?auto_266779 ) ) ( not ( = ?auto_266773 ?auto_266780 ) ) ( not ( = ?auto_266773 ?auto_266781 ) ) ( not ( = ?auto_266773 ?auto_266782 ) ) ( not ( = ?auto_266773 ?auto_266783 ) ) ( not ( = ?auto_266773 ?auto_266784 ) ) ( not ( = ?auto_266774 ?auto_266775 ) ) ( not ( = ?auto_266774 ?auto_266776 ) ) ( not ( = ?auto_266774 ?auto_266777 ) ) ( not ( = ?auto_266774 ?auto_266778 ) ) ( not ( = ?auto_266774 ?auto_266779 ) ) ( not ( = ?auto_266774 ?auto_266780 ) ) ( not ( = ?auto_266774 ?auto_266781 ) ) ( not ( = ?auto_266774 ?auto_266782 ) ) ( not ( = ?auto_266774 ?auto_266783 ) ) ( not ( = ?auto_266774 ?auto_266784 ) ) ( not ( = ?auto_266775 ?auto_266776 ) ) ( not ( = ?auto_266775 ?auto_266777 ) ) ( not ( = ?auto_266775 ?auto_266778 ) ) ( not ( = ?auto_266775 ?auto_266779 ) ) ( not ( = ?auto_266775 ?auto_266780 ) ) ( not ( = ?auto_266775 ?auto_266781 ) ) ( not ( = ?auto_266775 ?auto_266782 ) ) ( not ( = ?auto_266775 ?auto_266783 ) ) ( not ( = ?auto_266775 ?auto_266784 ) ) ( not ( = ?auto_266776 ?auto_266777 ) ) ( not ( = ?auto_266776 ?auto_266778 ) ) ( not ( = ?auto_266776 ?auto_266779 ) ) ( not ( = ?auto_266776 ?auto_266780 ) ) ( not ( = ?auto_266776 ?auto_266781 ) ) ( not ( = ?auto_266776 ?auto_266782 ) ) ( not ( = ?auto_266776 ?auto_266783 ) ) ( not ( = ?auto_266776 ?auto_266784 ) ) ( not ( = ?auto_266777 ?auto_266778 ) ) ( not ( = ?auto_266777 ?auto_266779 ) ) ( not ( = ?auto_266777 ?auto_266780 ) ) ( not ( = ?auto_266777 ?auto_266781 ) ) ( not ( = ?auto_266777 ?auto_266782 ) ) ( not ( = ?auto_266777 ?auto_266783 ) ) ( not ( = ?auto_266777 ?auto_266784 ) ) ( not ( = ?auto_266778 ?auto_266779 ) ) ( not ( = ?auto_266778 ?auto_266780 ) ) ( not ( = ?auto_266778 ?auto_266781 ) ) ( not ( = ?auto_266778 ?auto_266782 ) ) ( not ( = ?auto_266778 ?auto_266783 ) ) ( not ( = ?auto_266778 ?auto_266784 ) ) ( not ( = ?auto_266779 ?auto_266780 ) ) ( not ( = ?auto_266779 ?auto_266781 ) ) ( not ( = ?auto_266779 ?auto_266782 ) ) ( not ( = ?auto_266779 ?auto_266783 ) ) ( not ( = ?auto_266779 ?auto_266784 ) ) ( not ( = ?auto_266780 ?auto_266781 ) ) ( not ( = ?auto_266780 ?auto_266782 ) ) ( not ( = ?auto_266780 ?auto_266783 ) ) ( not ( = ?auto_266780 ?auto_266784 ) ) ( not ( = ?auto_266781 ?auto_266782 ) ) ( not ( = ?auto_266781 ?auto_266783 ) ) ( not ( = ?auto_266781 ?auto_266784 ) ) ( not ( = ?auto_266782 ?auto_266783 ) ) ( not ( = ?auto_266782 ?auto_266784 ) ) ( not ( = ?auto_266783 ?auto_266784 ) ) ( ON ?auto_266782 ?auto_266783 ) ( CLEAR ?auto_266780 ) ( ON ?auto_266781 ?auto_266782 ) ( CLEAR ?auto_266781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_266772 ?auto_266773 ?auto_266774 ?auto_266775 ?auto_266776 ?auto_266777 ?auto_266778 ?auto_266779 ?auto_266780 ?auto_266781 )
      ( MAKE-12PILE ?auto_266772 ?auto_266773 ?auto_266774 ?auto_266775 ?auto_266776 ?auto_266777 ?auto_266778 ?auto_266779 ?auto_266780 ?auto_266781 ?auto_266782 ?auto_266783 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266822 - BLOCK
      ?auto_266823 - BLOCK
      ?auto_266824 - BLOCK
      ?auto_266825 - BLOCK
      ?auto_266826 - BLOCK
      ?auto_266827 - BLOCK
      ?auto_266828 - BLOCK
      ?auto_266829 - BLOCK
      ?auto_266830 - BLOCK
      ?auto_266831 - BLOCK
      ?auto_266832 - BLOCK
      ?auto_266833 - BLOCK
    )
    :vars
    (
      ?auto_266834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266833 ?auto_266834 ) ( ON-TABLE ?auto_266822 ) ( ON ?auto_266823 ?auto_266822 ) ( ON ?auto_266824 ?auto_266823 ) ( ON ?auto_266825 ?auto_266824 ) ( ON ?auto_266826 ?auto_266825 ) ( ON ?auto_266827 ?auto_266826 ) ( ON ?auto_266828 ?auto_266827 ) ( ON ?auto_266829 ?auto_266828 ) ( not ( = ?auto_266822 ?auto_266823 ) ) ( not ( = ?auto_266822 ?auto_266824 ) ) ( not ( = ?auto_266822 ?auto_266825 ) ) ( not ( = ?auto_266822 ?auto_266826 ) ) ( not ( = ?auto_266822 ?auto_266827 ) ) ( not ( = ?auto_266822 ?auto_266828 ) ) ( not ( = ?auto_266822 ?auto_266829 ) ) ( not ( = ?auto_266822 ?auto_266830 ) ) ( not ( = ?auto_266822 ?auto_266831 ) ) ( not ( = ?auto_266822 ?auto_266832 ) ) ( not ( = ?auto_266822 ?auto_266833 ) ) ( not ( = ?auto_266822 ?auto_266834 ) ) ( not ( = ?auto_266823 ?auto_266824 ) ) ( not ( = ?auto_266823 ?auto_266825 ) ) ( not ( = ?auto_266823 ?auto_266826 ) ) ( not ( = ?auto_266823 ?auto_266827 ) ) ( not ( = ?auto_266823 ?auto_266828 ) ) ( not ( = ?auto_266823 ?auto_266829 ) ) ( not ( = ?auto_266823 ?auto_266830 ) ) ( not ( = ?auto_266823 ?auto_266831 ) ) ( not ( = ?auto_266823 ?auto_266832 ) ) ( not ( = ?auto_266823 ?auto_266833 ) ) ( not ( = ?auto_266823 ?auto_266834 ) ) ( not ( = ?auto_266824 ?auto_266825 ) ) ( not ( = ?auto_266824 ?auto_266826 ) ) ( not ( = ?auto_266824 ?auto_266827 ) ) ( not ( = ?auto_266824 ?auto_266828 ) ) ( not ( = ?auto_266824 ?auto_266829 ) ) ( not ( = ?auto_266824 ?auto_266830 ) ) ( not ( = ?auto_266824 ?auto_266831 ) ) ( not ( = ?auto_266824 ?auto_266832 ) ) ( not ( = ?auto_266824 ?auto_266833 ) ) ( not ( = ?auto_266824 ?auto_266834 ) ) ( not ( = ?auto_266825 ?auto_266826 ) ) ( not ( = ?auto_266825 ?auto_266827 ) ) ( not ( = ?auto_266825 ?auto_266828 ) ) ( not ( = ?auto_266825 ?auto_266829 ) ) ( not ( = ?auto_266825 ?auto_266830 ) ) ( not ( = ?auto_266825 ?auto_266831 ) ) ( not ( = ?auto_266825 ?auto_266832 ) ) ( not ( = ?auto_266825 ?auto_266833 ) ) ( not ( = ?auto_266825 ?auto_266834 ) ) ( not ( = ?auto_266826 ?auto_266827 ) ) ( not ( = ?auto_266826 ?auto_266828 ) ) ( not ( = ?auto_266826 ?auto_266829 ) ) ( not ( = ?auto_266826 ?auto_266830 ) ) ( not ( = ?auto_266826 ?auto_266831 ) ) ( not ( = ?auto_266826 ?auto_266832 ) ) ( not ( = ?auto_266826 ?auto_266833 ) ) ( not ( = ?auto_266826 ?auto_266834 ) ) ( not ( = ?auto_266827 ?auto_266828 ) ) ( not ( = ?auto_266827 ?auto_266829 ) ) ( not ( = ?auto_266827 ?auto_266830 ) ) ( not ( = ?auto_266827 ?auto_266831 ) ) ( not ( = ?auto_266827 ?auto_266832 ) ) ( not ( = ?auto_266827 ?auto_266833 ) ) ( not ( = ?auto_266827 ?auto_266834 ) ) ( not ( = ?auto_266828 ?auto_266829 ) ) ( not ( = ?auto_266828 ?auto_266830 ) ) ( not ( = ?auto_266828 ?auto_266831 ) ) ( not ( = ?auto_266828 ?auto_266832 ) ) ( not ( = ?auto_266828 ?auto_266833 ) ) ( not ( = ?auto_266828 ?auto_266834 ) ) ( not ( = ?auto_266829 ?auto_266830 ) ) ( not ( = ?auto_266829 ?auto_266831 ) ) ( not ( = ?auto_266829 ?auto_266832 ) ) ( not ( = ?auto_266829 ?auto_266833 ) ) ( not ( = ?auto_266829 ?auto_266834 ) ) ( not ( = ?auto_266830 ?auto_266831 ) ) ( not ( = ?auto_266830 ?auto_266832 ) ) ( not ( = ?auto_266830 ?auto_266833 ) ) ( not ( = ?auto_266830 ?auto_266834 ) ) ( not ( = ?auto_266831 ?auto_266832 ) ) ( not ( = ?auto_266831 ?auto_266833 ) ) ( not ( = ?auto_266831 ?auto_266834 ) ) ( not ( = ?auto_266832 ?auto_266833 ) ) ( not ( = ?auto_266832 ?auto_266834 ) ) ( not ( = ?auto_266833 ?auto_266834 ) ) ( ON ?auto_266832 ?auto_266833 ) ( ON ?auto_266831 ?auto_266832 ) ( CLEAR ?auto_266829 ) ( ON ?auto_266830 ?auto_266831 ) ( CLEAR ?auto_266830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_266822 ?auto_266823 ?auto_266824 ?auto_266825 ?auto_266826 ?auto_266827 ?auto_266828 ?auto_266829 ?auto_266830 )
      ( MAKE-12PILE ?auto_266822 ?auto_266823 ?auto_266824 ?auto_266825 ?auto_266826 ?auto_266827 ?auto_266828 ?auto_266829 ?auto_266830 ?auto_266831 ?auto_266832 ?auto_266833 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266872 - BLOCK
      ?auto_266873 - BLOCK
      ?auto_266874 - BLOCK
      ?auto_266875 - BLOCK
      ?auto_266876 - BLOCK
      ?auto_266877 - BLOCK
      ?auto_266878 - BLOCK
      ?auto_266879 - BLOCK
      ?auto_266880 - BLOCK
      ?auto_266881 - BLOCK
      ?auto_266882 - BLOCK
      ?auto_266883 - BLOCK
    )
    :vars
    (
      ?auto_266884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266883 ?auto_266884 ) ( ON-TABLE ?auto_266872 ) ( ON ?auto_266873 ?auto_266872 ) ( ON ?auto_266874 ?auto_266873 ) ( ON ?auto_266875 ?auto_266874 ) ( ON ?auto_266876 ?auto_266875 ) ( ON ?auto_266877 ?auto_266876 ) ( ON ?auto_266878 ?auto_266877 ) ( not ( = ?auto_266872 ?auto_266873 ) ) ( not ( = ?auto_266872 ?auto_266874 ) ) ( not ( = ?auto_266872 ?auto_266875 ) ) ( not ( = ?auto_266872 ?auto_266876 ) ) ( not ( = ?auto_266872 ?auto_266877 ) ) ( not ( = ?auto_266872 ?auto_266878 ) ) ( not ( = ?auto_266872 ?auto_266879 ) ) ( not ( = ?auto_266872 ?auto_266880 ) ) ( not ( = ?auto_266872 ?auto_266881 ) ) ( not ( = ?auto_266872 ?auto_266882 ) ) ( not ( = ?auto_266872 ?auto_266883 ) ) ( not ( = ?auto_266872 ?auto_266884 ) ) ( not ( = ?auto_266873 ?auto_266874 ) ) ( not ( = ?auto_266873 ?auto_266875 ) ) ( not ( = ?auto_266873 ?auto_266876 ) ) ( not ( = ?auto_266873 ?auto_266877 ) ) ( not ( = ?auto_266873 ?auto_266878 ) ) ( not ( = ?auto_266873 ?auto_266879 ) ) ( not ( = ?auto_266873 ?auto_266880 ) ) ( not ( = ?auto_266873 ?auto_266881 ) ) ( not ( = ?auto_266873 ?auto_266882 ) ) ( not ( = ?auto_266873 ?auto_266883 ) ) ( not ( = ?auto_266873 ?auto_266884 ) ) ( not ( = ?auto_266874 ?auto_266875 ) ) ( not ( = ?auto_266874 ?auto_266876 ) ) ( not ( = ?auto_266874 ?auto_266877 ) ) ( not ( = ?auto_266874 ?auto_266878 ) ) ( not ( = ?auto_266874 ?auto_266879 ) ) ( not ( = ?auto_266874 ?auto_266880 ) ) ( not ( = ?auto_266874 ?auto_266881 ) ) ( not ( = ?auto_266874 ?auto_266882 ) ) ( not ( = ?auto_266874 ?auto_266883 ) ) ( not ( = ?auto_266874 ?auto_266884 ) ) ( not ( = ?auto_266875 ?auto_266876 ) ) ( not ( = ?auto_266875 ?auto_266877 ) ) ( not ( = ?auto_266875 ?auto_266878 ) ) ( not ( = ?auto_266875 ?auto_266879 ) ) ( not ( = ?auto_266875 ?auto_266880 ) ) ( not ( = ?auto_266875 ?auto_266881 ) ) ( not ( = ?auto_266875 ?auto_266882 ) ) ( not ( = ?auto_266875 ?auto_266883 ) ) ( not ( = ?auto_266875 ?auto_266884 ) ) ( not ( = ?auto_266876 ?auto_266877 ) ) ( not ( = ?auto_266876 ?auto_266878 ) ) ( not ( = ?auto_266876 ?auto_266879 ) ) ( not ( = ?auto_266876 ?auto_266880 ) ) ( not ( = ?auto_266876 ?auto_266881 ) ) ( not ( = ?auto_266876 ?auto_266882 ) ) ( not ( = ?auto_266876 ?auto_266883 ) ) ( not ( = ?auto_266876 ?auto_266884 ) ) ( not ( = ?auto_266877 ?auto_266878 ) ) ( not ( = ?auto_266877 ?auto_266879 ) ) ( not ( = ?auto_266877 ?auto_266880 ) ) ( not ( = ?auto_266877 ?auto_266881 ) ) ( not ( = ?auto_266877 ?auto_266882 ) ) ( not ( = ?auto_266877 ?auto_266883 ) ) ( not ( = ?auto_266877 ?auto_266884 ) ) ( not ( = ?auto_266878 ?auto_266879 ) ) ( not ( = ?auto_266878 ?auto_266880 ) ) ( not ( = ?auto_266878 ?auto_266881 ) ) ( not ( = ?auto_266878 ?auto_266882 ) ) ( not ( = ?auto_266878 ?auto_266883 ) ) ( not ( = ?auto_266878 ?auto_266884 ) ) ( not ( = ?auto_266879 ?auto_266880 ) ) ( not ( = ?auto_266879 ?auto_266881 ) ) ( not ( = ?auto_266879 ?auto_266882 ) ) ( not ( = ?auto_266879 ?auto_266883 ) ) ( not ( = ?auto_266879 ?auto_266884 ) ) ( not ( = ?auto_266880 ?auto_266881 ) ) ( not ( = ?auto_266880 ?auto_266882 ) ) ( not ( = ?auto_266880 ?auto_266883 ) ) ( not ( = ?auto_266880 ?auto_266884 ) ) ( not ( = ?auto_266881 ?auto_266882 ) ) ( not ( = ?auto_266881 ?auto_266883 ) ) ( not ( = ?auto_266881 ?auto_266884 ) ) ( not ( = ?auto_266882 ?auto_266883 ) ) ( not ( = ?auto_266882 ?auto_266884 ) ) ( not ( = ?auto_266883 ?auto_266884 ) ) ( ON ?auto_266882 ?auto_266883 ) ( ON ?auto_266881 ?auto_266882 ) ( ON ?auto_266880 ?auto_266881 ) ( CLEAR ?auto_266878 ) ( ON ?auto_266879 ?auto_266880 ) ( CLEAR ?auto_266879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_266872 ?auto_266873 ?auto_266874 ?auto_266875 ?auto_266876 ?auto_266877 ?auto_266878 ?auto_266879 )
      ( MAKE-12PILE ?auto_266872 ?auto_266873 ?auto_266874 ?auto_266875 ?auto_266876 ?auto_266877 ?auto_266878 ?auto_266879 ?auto_266880 ?auto_266881 ?auto_266882 ?auto_266883 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266922 - BLOCK
      ?auto_266923 - BLOCK
      ?auto_266924 - BLOCK
      ?auto_266925 - BLOCK
      ?auto_266926 - BLOCK
      ?auto_266927 - BLOCK
      ?auto_266928 - BLOCK
      ?auto_266929 - BLOCK
      ?auto_266930 - BLOCK
      ?auto_266931 - BLOCK
      ?auto_266932 - BLOCK
      ?auto_266933 - BLOCK
    )
    :vars
    (
      ?auto_266934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266933 ?auto_266934 ) ( ON-TABLE ?auto_266922 ) ( ON ?auto_266923 ?auto_266922 ) ( ON ?auto_266924 ?auto_266923 ) ( ON ?auto_266925 ?auto_266924 ) ( ON ?auto_266926 ?auto_266925 ) ( ON ?auto_266927 ?auto_266926 ) ( not ( = ?auto_266922 ?auto_266923 ) ) ( not ( = ?auto_266922 ?auto_266924 ) ) ( not ( = ?auto_266922 ?auto_266925 ) ) ( not ( = ?auto_266922 ?auto_266926 ) ) ( not ( = ?auto_266922 ?auto_266927 ) ) ( not ( = ?auto_266922 ?auto_266928 ) ) ( not ( = ?auto_266922 ?auto_266929 ) ) ( not ( = ?auto_266922 ?auto_266930 ) ) ( not ( = ?auto_266922 ?auto_266931 ) ) ( not ( = ?auto_266922 ?auto_266932 ) ) ( not ( = ?auto_266922 ?auto_266933 ) ) ( not ( = ?auto_266922 ?auto_266934 ) ) ( not ( = ?auto_266923 ?auto_266924 ) ) ( not ( = ?auto_266923 ?auto_266925 ) ) ( not ( = ?auto_266923 ?auto_266926 ) ) ( not ( = ?auto_266923 ?auto_266927 ) ) ( not ( = ?auto_266923 ?auto_266928 ) ) ( not ( = ?auto_266923 ?auto_266929 ) ) ( not ( = ?auto_266923 ?auto_266930 ) ) ( not ( = ?auto_266923 ?auto_266931 ) ) ( not ( = ?auto_266923 ?auto_266932 ) ) ( not ( = ?auto_266923 ?auto_266933 ) ) ( not ( = ?auto_266923 ?auto_266934 ) ) ( not ( = ?auto_266924 ?auto_266925 ) ) ( not ( = ?auto_266924 ?auto_266926 ) ) ( not ( = ?auto_266924 ?auto_266927 ) ) ( not ( = ?auto_266924 ?auto_266928 ) ) ( not ( = ?auto_266924 ?auto_266929 ) ) ( not ( = ?auto_266924 ?auto_266930 ) ) ( not ( = ?auto_266924 ?auto_266931 ) ) ( not ( = ?auto_266924 ?auto_266932 ) ) ( not ( = ?auto_266924 ?auto_266933 ) ) ( not ( = ?auto_266924 ?auto_266934 ) ) ( not ( = ?auto_266925 ?auto_266926 ) ) ( not ( = ?auto_266925 ?auto_266927 ) ) ( not ( = ?auto_266925 ?auto_266928 ) ) ( not ( = ?auto_266925 ?auto_266929 ) ) ( not ( = ?auto_266925 ?auto_266930 ) ) ( not ( = ?auto_266925 ?auto_266931 ) ) ( not ( = ?auto_266925 ?auto_266932 ) ) ( not ( = ?auto_266925 ?auto_266933 ) ) ( not ( = ?auto_266925 ?auto_266934 ) ) ( not ( = ?auto_266926 ?auto_266927 ) ) ( not ( = ?auto_266926 ?auto_266928 ) ) ( not ( = ?auto_266926 ?auto_266929 ) ) ( not ( = ?auto_266926 ?auto_266930 ) ) ( not ( = ?auto_266926 ?auto_266931 ) ) ( not ( = ?auto_266926 ?auto_266932 ) ) ( not ( = ?auto_266926 ?auto_266933 ) ) ( not ( = ?auto_266926 ?auto_266934 ) ) ( not ( = ?auto_266927 ?auto_266928 ) ) ( not ( = ?auto_266927 ?auto_266929 ) ) ( not ( = ?auto_266927 ?auto_266930 ) ) ( not ( = ?auto_266927 ?auto_266931 ) ) ( not ( = ?auto_266927 ?auto_266932 ) ) ( not ( = ?auto_266927 ?auto_266933 ) ) ( not ( = ?auto_266927 ?auto_266934 ) ) ( not ( = ?auto_266928 ?auto_266929 ) ) ( not ( = ?auto_266928 ?auto_266930 ) ) ( not ( = ?auto_266928 ?auto_266931 ) ) ( not ( = ?auto_266928 ?auto_266932 ) ) ( not ( = ?auto_266928 ?auto_266933 ) ) ( not ( = ?auto_266928 ?auto_266934 ) ) ( not ( = ?auto_266929 ?auto_266930 ) ) ( not ( = ?auto_266929 ?auto_266931 ) ) ( not ( = ?auto_266929 ?auto_266932 ) ) ( not ( = ?auto_266929 ?auto_266933 ) ) ( not ( = ?auto_266929 ?auto_266934 ) ) ( not ( = ?auto_266930 ?auto_266931 ) ) ( not ( = ?auto_266930 ?auto_266932 ) ) ( not ( = ?auto_266930 ?auto_266933 ) ) ( not ( = ?auto_266930 ?auto_266934 ) ) ( not ( = ?auto_266931 ?auto_266932 ) ) ( not ( = ?auto_266931 ?auto_266933 ) ) ( not ( = ?auto_266931 ?auto_266934 ) ) ( not ( = ?auto_266932 ?auto_266933 ) ) ( not ( = ?auto_266932 ?auto_266934 ) ) ( not ( = ?auto_266933 ?auto_266934 ) ) ( ON ?auto_266932 ?auto_266933 ) ( ON ?auto_266931 ?auto_266932 ) ( ON ?auto_266930 ?auto_266931 ) ( ON ?auto_266929 ?auto_266930 ) ( CLEAR ?auto_266927 ) ( ON ?auto_266928 ?auto_266929 ) ( CLEAR ?auto_266928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_266922 ?auto_266923 ?auto_266924 ?auto_266925 ?auto_266926 ?auto_266927 ?auto_266928 )
      ( MAKE-12PILE ?auto_266922 ?auto_266923 ?auto_266924 ?auto_266925 ?auto_266926 ?auto_266927 ?auto_266928 ?auto_266929 ?auto_266930 ?auto_266931 ?auto_266932 ?auto_266933 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266972 - BLOCK
      ?auto_266973 - BLOCK
      ?auto_266974 - BLOCK
      ?auto_266975 - BLOCK
      ?auto_266976 - BLOCK
      ?auto_266977 - BLOCK
      ?auto_266978 - BLOCK
      ?auto_266979 - BLOCK
      ?auto_266980 - BLOCK
      ?auto_266981 - BLOCK
      ?auto_266982 - BLOCK
      ?auto_266983 - BLOCK
    )
    :vars
    (
      ?auto_266984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266983 ?auto_266984 ) ( ON-TABLE ?auto_266972 ) ( ON ?auto_266973 ?auto_266972 ) ( ON ?auto_266974 ?auto_266973 ) ( ON ?auto_266975 ?auto_266974 ) ( ON ?auto_266976 ?auto_266975 ) ( not ( = ?auto_266972 ?auto_266973 ) ) ( not ( = ?auto_266972 ?auto_266974 ) ) ( not ( = ?auto_266972 ?auto_266975 ) ) ( not ( = ?auto_266972 ?auto_266976 ) ) ( not ( = ?auto_266972 ?auto_266977 ) ) ( not ( = ?auto_266972 ?auto_266978 ) ) ( not ( = ?auto_266972 ?auto_266979 ) ) ( not ( = ?auto_266972 ?auto_266980 ) ) ( not ( = ?auto_266972 ?auto_266981 ) ) ( not ( = ?auto_266972 ?auto_266982 ) ) ( not ( = ?auto_266972 ?auto_266983 ) ) ( not ( = ?auto_266972 ?auto_266984 ) ) ( not ( = ?auto_266973 ?auto_266974 ) ) ( not ( = ?auto_266973 ?auto_266975 ) ) ( not ( = ?auto_266973 ?auto_266976 ) ) ( not ( = ?auto_266973 ?auto_266977 ) ) ( not ( = ?auto_266973 ?auto_266978 ) ) ( not ( = ?auto_266973 ?auto_266979 ) ) ( not ( = ?auto_266973 ?auto_266980 ) ) ( not ( = ?auto_266973 ?auto_266981 ) ) ( not ( = ?auto_266973 ?auto_266982 ) ) ( not ( = ?auto_266973 ?auto_266983 ) ) ( not ( = ?auto_266973 ?auto_266984 ) ) ( not ( = ?auto_266974 ?auto_266975 ) ) ( not ( = ?auto_266974 ?auto_266976 ) ) ( not ( = ?auto_266974 ?auto_266977 ) ) ( not ( = ?auto_266974 ?auto_266978 ) ) ( not ( = ?auto_266974 ?auto_266979 ) ) ( not ( = ?auto_266974 ?auto_266980 ) ) ( not ( = ?auto_266974 ?auto_266981 ) ) ( not ( = ?auto_266974 ?auto_266982 ) ) ( not ( = ?auto_266974 ?auto_266983 ) ) ( not ( = ?auto_266974 ?auto_266984 ) ) ( not ( = ?auto_266975 ?auto_266976 ) ) ( not ( = ?auto_266975 ?auto_266977 ) ) ( not ( = ?auto_266975 ?auto_266978 ) ) ( not ( = ?auto_266975 ?auto_266979 ) ) ( not ( = ?auto_266975 ?auto_266980 ) ) ( not ( = ?auto_266975 ?auto_266981 ) ) ( not ( = ?auto_266975 ?auto_266982 ) ) ( not ( = ?auto_266975 ?auto_266983 ) ) ( not ( = ?auto_266975 ?auto_266984 ) ) ( not ( = ?auto_266976 ?auto_266977 ) ) ( not ( = ?auto_266976 ?auto_266978 ) ) ( not ( = ?auto_266976 ?auto_266979 ) ) ( not ( = ?auto_266976 ?auto_266980 ) ) ( not ( = ?auto_266976 ?auto_266981 ) ) ( not ( = ?auto_266976 ?auto_266982 ) ) ( not ( = ?auto_266976 ?auto_266983 ) ) ( not ( = ?auto_266976 ?auto_266984 ) ) ( not ( = ?auto_266977 ?auto_266978 ) ) ( not ( = ?auto_266977 ?auto_266979 ) ) ( not ( = ?auto_266977 ?auto_266980 ) ) ( not ( = ?auto_266977 ?auto_266981 ) ) ( not ( = ?auto_266977 ?auto_266982 ) ) ( not ( = ?auto_266977 ?auto_266983 ) ) ( not ( = ?auto_266977 ?auto_266984 ) ) ( not ( = ?auto_266978 ?auto_266979 ) ) ( not ( = ?auto_266978 ?auto_266980 ) ) ( not ( = ?auto_266978 ?auto_266981 ) ) ( not ( = ?auto_266978 ?auto_266982 ) ) ( not ( = ?auto_266978 ?auto_266983 ) ) ( not ( = ?auto_266978 ?auto_266984 ) ) ( not ( = ?auto_266979 ?auto_266980 ) ) ( not ( = ?auto_266979 ?auto_266981 ) ) ( not ( = ?auto_266979 ?auto_266982 ) ) ( not ( = ?auto_266979 ?auto_266983 ) ) ( not ( = ?auto_266979 ?auto_266984 ) ) ( not ( = ?auto_266980 ?auto_266981 ) ) ( not ( = ?auto_266980 ?auto_266982 ) ) ( not ( = ?auto_266980 ?auto_266983 ) ) ( not ( = ?auto_266980 ?auto_266984 ) ) ( not ( = ?auto_266981 ?auto_266982 ) ) ( not ( = ?auto_266981 ?auto_266983 ) ) ( not ( = ?auto_266981 ?auto_266984 ) ) ( not ( = ?auto_266982 ?auto_266983 ) ) ( not ( = ?auto_266982 ?auto_266984 ) ) ( not ( = ?auto_266983 ?auto_266984 ) ) ( ON ?auto_266982 ?auto_266983 ) ( ON ?auto_266981 ?auto_266982 ) ( ON ?auto_266980 ?auto_266981 ) ( ON ?auto_266979 ?auto_266980 ) ( ON ?auto_266978 ?auto_266979 ) ( CLEAR ?auto_266976 ) ( ON ?auto_266977 ?auto_266978 ) ( CLEAR ?auto_266977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_266972 ?auto_266973 ?auto_266974 ?auto_266975 ?auto_266976 ?auto_266977 )
      ( MAKE-12PILE ?auto_266972 ?auto_266973 ?auto_266974 ?auto_266975 ?auto_266976 ?auto_266977 ?auto_266978 ?auto_266979 ?auto_266980 ?auto_266981 ?auto_266982 ?auto_266983 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267022 - BLOCK
      ?auto_267023 - BLOCK
      ?auto_267024 - BLOCK
      ?auto_267025 - BLOCK
      ?auto_267026 - BLOCK
      ?auto_267027 - BLOCK
      ?auto_267028 - BLOCK
      ?auto_267029 - BLOCK
      ?auto_267030 - BLOCK
      ?auto_267031 - BLOCK
      ?auto_267032 - BLOCK
      ?auto_267033 - BLOCK
    )
    :vars
    (
      ?auto_267034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267033 ?auto_267034 ) ( ON-TABLE ?auto_267022 ) ( ON ?auto_267023 ?auto_267022 ) ( ON ?auto_267024 ?auto_267023 ) ( ON ?auto_267025 ?auto_267024 ) ( not ( = ?auto_267022 ?auto_267023 ) ) ( not ( = ?auto_267022 ?auto_267024 ) ) ( not ( = ?auto_267022 ?auto_267025 ) ) ( not ( = ?auto_267022 ?auto_267026 ) ) ( not ( = ?auto_267022 ?auto_267027 ) ) ( not ( = ?auto_267022 ?auto_267028 ) ) ( not ( = ?auto_267022 ?auto_267029 ) ) ( not ( = ?auto_267022 ?auto_267030 ) ) ( not ( = ?auto_267022 ?auto_267031 ) ) ( not ( = ?auto_267022 ?auto_267032 ) ) ( not ( = ?auto_267022 ?auto_267033 ) ) ( not ( = ?auto_267022 ?auto_267034 ) ) ( not ( = ?auto_267023 ?auto_267024 ) ) ( not ( = ?auto_267023 ?auto_267025 ) ) ( not ( = ?auto_267023 ?auto_267026 ) ) ( not ( = ?auto_267023 ?auto_267027 ) ) ( not ( = ?auto_267023 ?auto_267028 ) ) ( not ( = ?auto_267023 ?auto_267029 ) ) ( not ( = ?auto_267023 ?auto_267030 ) ) ( not ( = ?auto_267023 ?auto_267031 ) ) ( not ( = ?auto_267023 ?auto_267032 ) ) ( not ( = ?auto_267023 ?auto_267033 ) ) ( not ( = ?auto_267023 ?auto_267034 ) ) ( not ( = ?auto_267024 ?auto_267025 ) ) ( not ( = ?auto_267024 ?auto_267026 ) ) ( not ( = ?auto_267024 ?auto_267027 ) ) ( not ( = ?auto_267024 ?auto_267028 ) ) ( not ( = ?auto_267024 ?auto_267029 ) ) ( not ( = ?auto_267024 ?auto_267030 ) ) ( not ( = ?auto_267024 ?auto_267031 ) ) ( not ( = ?auto_267024 ?auto_267032 ) ) ( not ( = ?auto_267024 ?auto_267033 ) ) ( not ( = ?auto_267024 ?auto_267034 ) ) ( not ( = ?auto_267025 ?auto_267026 ) ) ( not ( = ?auto_267025 ?auto_267027 ) ) ( not ( = ?auto_267025 ?auto_267028 ) ) ( not ( = ?auto_267025 ?auto_267029 ) ) ( not ( = ?auto_267025 ?auto_267030 ) ) ( not ( = ?auto_267025 ?auto_267031 ) ) ( not ( = ?auto_267025 ?auto_267032 ) ) ( not ( = ?auto_267025 ?auto_267033 ) ) ( not ( = ?auto_267025 ?auto_267034 ) ) ( not ( = ?auto_267026 ?auto_267027 ) ) ( not ( = ?auto_267026 ?auto_267028 ) ) ( not ( = ?auto_267026 ?auto_267029 ) ) ( not ( = ?auto_267026 ?auto_267030 ) ) ( not ( = ?auto_267026 ?auto_267031 ) ) ( not ( = ?auto_267026 ?auto_267032 ) ) ( not ( = ?auto_267026 ?auto_267033 ) ) ( not ( = ?auto_267026 ?auto_267034 ) ) ( not ( = ?auto_267027 ?auto_267028 ) ) ( not ( = ?auto_267027 ?auto_267029 ) ) ( not ( = ?auto_267027 ?auto_267030 ) ) ( not ( = ?auto_267027 ?auto_267031 ) ) ( not ( = ?auto_267027 ?auto_267032 ) ) ( not ( = ?auto_267027 ?auto_267033 ) ) ( not ( = ?auto_267027 ?auto_267034 ) ) ( not ( = ?auto_267028 ?auto_267029 ) ) ( not ( = ?auto_267028 ?auto_267030 ) ) ( not ( = ?auto_267028 ?auto_267031 ) ) ( not ( = ?auto_267028 ?auto_267032 ) ) ( not ( = ?auto_267028 ?auto_267033 ) ) ( not ( = ?auto_267028 ?auto_267034 ) ) ( not ( = ?auto_267029 ?auto_267030 ) ) ( not ( = ?auto_267029 ?auto_267031 ) ) ( not ( = ?auto_267029 ?auto_267032 ) ) ( not ( = ?auto_267029 ?auto_267033 ) ) ( not ( = ?auto_267029 ?auto_267034 ) ) ( not ( = ?auto_267030 ?auto_267031 ) ) ( not ( = ?auto_267030 ?auto_267032 ) ) ( not ( = ?auto_267030 ?auto_267033 ) ) ( not ( = ?auto_267030 ?auto_267034 ) ) ( not ( = ?auto_267031 ?auto_267032 ) ) ( not ( = ?auto_267031 ?auto_267033 ) ) ( not ( = ?auto_267031 ?auto_267034 ) ) ( not ( = ?auto_267032 ?auto_267033 ) ) ( not ( = ?auto_267032 ?auto_267034 ) ) ( not ( = ?auto_267033 ?auto_267034 ) ) ( ON ?auto_267032 ?auto_267033 ) ( ON ?auto_267031 ?auto_267032 ) ( ON ?auto_267030 ?auto_267031 ) ( ON ?auto_267029 ?auto_267030 ) ( ON ?auto_267028 ?auto_267029 ) ( ON ?auto_267027 ?auto_267028 ) ( CLEAR ?auto_267025 ) ( ON ?auto_267026 ?auto_267027 ) ( CLEAR ?auto_267026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_267022 ?auto_267023 ?auto_267024 ?auto_267025 ?auto_267026 )
      ( MAKE-12PILE ?auto_267022 ?auto_267023 ?auto_267024 ?auto_267025 ?auto_267026 ?auto_267027 ?auto_267028 ?auto_267029 ?auto_267030 ?auto_267031 ?auto_267032 ?auto_267033 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267072 - BLOCK
      ?auto_267073 - BLOCK
      ?auto_267074 - BLOCK
      ?auto_267075 - BLOCK
      ?auto_267076 - BLOCK
      ?auto_267077 - BLOCK
      ?auto_267078 - BLOCK
      ?auto_267079 - BLOCK
      ?auto_267080 - BLOCK
      ?auto_267081 - BLOCK
      ?auto_267082 - BLOCK
      ?auto_267083 - BLOCK
    )
    :vars
    (
      ?auto_267084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267083 ?auto_267084 ) ( ON-TABLE ?auto_267072 ) ( ON ?auto_267073 ?auto_267072 ) ( ON ?auto_267074 ?auto_267073 ) ( not ( = ?auto_267072 ?auto_267073 ) ) ( not ( = ?auto_267072 ?auto_267074 ) ) ( not ( = ?auto_267072 ?auto_267075 ) ) ( not ( = ?auto_267072 ?auto_267076 ) ) ( not ( = ?auto_267072 ?auto_267077 ) ) ( not ( = ?auto_267072 ?auto_267078 ) ) ( not ( = ?auto_267072 ?auto_267079 ) ) ( not ( = ?auto_267072 ?auto_267080 ) ) ( not ( = ?auto_267072 ?auto_267081 ) ) ( not ( = ?auto_267072 ?auto_267082 ) ) ( not ( = ?auto_267072 ?auto_267083 ) ) ( not ( = ?auto_267072 ?auto_267084 ) ) ( not ( = ?auto_267073 ?auto_267074 ) ) ( not ( = ?auto_267073 ?auto_267075 ) ) ( not ( = ?auto_267073 ?auto_267076 ) ) ( not ( = ?auto_267073 ?auto_267077 ) ) ( not ( = ?auto_267073 ?auto_267078 ) ) ( not ( = ?auto_267073 ?auto_267079 ) ) ( not ( = ?auto_267073 ?auto_267080 ) ) ( not ( = ?auto_267073 ?auto_267081 ) ) ( not ( = ?auto_267073 ?auto_267082 ) ) ( not ( = ?auto_267073 ?auto_267083 ) ) ( not ( = ?auto_267073 ?auto_267084 ) ) ( not ( = ?auto_267074 ?auto_267075 ) ) ( not ( = ?auto_267074 ?auto_267076 ) ) ( not ( = ?auto_267074 ?auto_267077 ) ) ( not ( = ?auto_267074 ?auto_267078 ) ) ( not ( = ?auto_267074 ?auto_267079 ) ) ( not ( = ?auto_267074 ?auto_267080 ) ) ( not ( = ?auto_267074 ?auto_267081 ) ) ( not ( = ?auto_267074 ?auto_267082 ) ) ( not ( = ?auto_267074 ?auto_267083 ) ) ( not ( = ?auto_267074 ?auto_267084 ) ) ( not ( = ?auto_267075 ?auto_267076 ) ) ( not ( = ?auto_267075 ?auto_267077 ) ) ( not ( = ?auto_267075 ?auto_267078 ) ) ( not ( = ?auto_267075 ?auto_267079 ) ) ( not ( = ?auto_267075 ?auto_267080 ) ) ( not ( = ?auto_267075 ?auto_267081 ) ) ( not ( = ?auto_267075 ?auto_267082 ) ) ( not ( = ?auto_267075 ?auto_267083 ) ) ( not ( = ?auto_267075 ?auto_267084 ) ) ( not ( = ?auto_267076 ?auto_267077 ) ) ( not ( = ?auto_267076 ?auto_267078 ) ) ( not ( = ?auto_267076 ?auto_267079 ) ) ( not ( = ?auto_267076 ?auto_267080 ) ) ( not ( = ?auto_267076 ?auto_267081 ) ) ( not ( = ?auto_267076 ?auto_267082 ) ) ( not ( = ?auto_267076 ?auto_267083 ) ) ( not ( = ?auto_267076 ?auto_267084 ) ) ( not ( = ?auto_267077 ?auto_267078 ) ) ( not ( = ?auto_267077 ?auto_267079 ) ) ( not ( = ?auto_267077 ?auto_267080 ) ) ( not ( = ?auto_267077 ?auto_267081 ) ) ( not ( = ?auto_267077 ?auto_267082 ) ) ( not ( = ?auto_267077 ?auto_267083 ) ) ( not ( = ?auto_267077 ?auto_267084 ) ) ( not ( = ?auto_267078 ?auto_267079 ) ) ( not ( = ?auto_267078 ?auto_267080 ) ) ( not ( = ?auto_267078 ?auto_267081 ) ) ( not ( = ?auto_267078 ?auto_267082 ) ) ( not ( = ?auto_267078 ?auto_267083 ) ) ( not ( = ?auto_267078 ?auto_267084 ) ) ( not ( = ?auto_267079 ?auto_267080 ) ) ( not ( = ?auto_267079 ?auto_267081 ) ) ( not ( = ?auto_267079 ?auto_267082 ) ) ( not ( = ?auto_267079 ?auto_267083 ) ) ( not ( = ?auto_267079 ?auto_267084 ) ) ( not ( = ?auto_267080 ?auto_267081 ) ) ( not ( = ?auto_267080 ?auto_267082 ) ) ( not ( = ?auto_267080 ?auto_267083 ) ) ( not ( = ?auto_267080 ?auto_267084 ) ) ( not ( = ?auto_267081 ?auto_267082 ) ) ( not ( = ?auto_267081 ?auto_267083 ) ) ( not ( = ?auto_267081 ?auto_267084 ) ) ( not ( = ?auto_267082 ?auto_267083 ) ) ( not ( = ?auto_267082 ?auto_267084 ) ) ( not ( = ?auto_267083 ?auto_267084 ) ) ( ON ?auto_267082 ?auto_267083 ) ( ON ?auto_267081 ?auto_267082 ) ( ON ?auto_267080 ?auto_267081 ) ( ON ?auto_267079 ?auto_267080 ) ( ON ?auto_267078 ?auto_267079 ) ( ON ?auto_267077 ?auto_267078 ) ( ON ?auto_267076 ?auto_267077 ) ( CLEAR ?auto_267074 ) ( ON ?auto_267075 ?auto_267076 ) ( CLEAR ?auto_267075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_267072 ?auto_267073 ?auto_267074 ?auto_267075 )
      ( MAKE-12PILE ?auto_267072 ?auto_267073 ?auto_267074 ?auto_267075 ?auto_267076 ?auto_267077 ?auto_267078 ?auto_267079 ?auto_267080 ?auto_267081 ?auto_267082 ?auto_267083 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267122 - BLOCK
      ?auto_267123 - BLOCK
      ?auto_267124 - BLOCK
      ?auto_267125 - BLOCK
      ?auto_267126 - BLOCK
      ?auto_267127 - BLOCK
      ?auto_267128 - BLOCK
      ?auto_267129 - BLOCK
      ?auto_267130 - BLOCK
      ?auto_267131 - BLOCK
      ?auto_267132 - BLOCK
      ?auto_267133 - BLOCK
    )
    :vars
    (
      ?auto_267134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267133 ?auto_267134 ) ( ON-TABLE ?auto_267122 ) ( ON ?auto_267123 ?auto_267122 ) ( not ( = ?auto_267122 ?auto_267123 ) ) ( not ( = ?auto_267122 ?auto_267124 ) ) ( not ( = ?auto_267122 ?auto_267125 ) ) ( not ( = ?auto_267122 ?auto_267126 ) ) ( not ( = ?auto_267122 ?auto_267127 ) ) ( not ( = ?auto_267122 ?auto_267128 ) ) ( not ( = ?auto_267122 ?auto_267129 ) ) ( not ( = ?auto_267122 ?auto_267130 ) ) ( not ( = ?auto_267122 ?auto_267131 ) ) ( not ( = ?auto_267122 ?auto_267132 ) ) ( not ( = ?auto_267122 ?auto_267133 ) ) ( not ( = ?auto_267122 ?auto_267134 ) ) ( not ( = ?auto_267123 ?auto_267124 ) ) ( not ( = ?auto_267123 ?auto_267125 ) ) ( not ( = ?auto_267123 ?auto_267126 ) ) ( not ( = ?auto_267123 ?auto_267127 ) ) ( not ( = ?auto_267123 ?auto_267128 ) ) ( not ( = ?auto_267123 ?auto_267129 ) ) ( not ( = ?auto_267123 ?auto_267130 ) ) ( not ( = ?auto_267123 ?auto_267131 ) ) ( not ( = ?auto_267123 ?auto_267132 ) ) ( not ( = ?auto_267123 ?auto_267133 ) ) ( not ( = ?auto_267123 ?auto_267134 ) ) ( not ( = ?auto_267124 ?auto_267125 ) ) ( not ( = ?auto_267124 ?auto_267126 ) ) ( not ( = ?auto_267124 ?auto_267127 ) ) ( not ( = ?auto_267124 ?auto_267128 ) ) ( not ( = ?auto_267124 ?auto_267129 ) ) ( not ( = ?auto_267124 ?auto_267130 ) ) ( not ( = ?auto_267124 ?auto_267131 ) ) ( not ( = ?auto_267124 ?auto_267132 ) ) ( not ( = ?auto_267124 ?auto_267133 ) ) ( not ( = ?auto_267124 ?auto_267134 ) ) ( not ( = ?auto_267125 ?auto_267126 ) ) ( not ( = ?auto_267125 ?auto_267127 ) ) ( not ( = ?auto_267125 ?auto_267128 ) ) ( not ( = ?auto_267125 ?auto_267129 ) ) ( not ( = ?auto_267125 ?auto_267130 ) ) ( not ( = ?auto_267125 ?auto_267131 ) ) ( not ( = ?auto_267125 ?auto_267132 ) ) ( not ( = ?auto_267125 ?auto_267133 ) ) ( not ( = ?auto_267125 ?auto_267134 ) ) ( not ( = ?auto_267126 ?auto_267127 ) ) ( not ( = ?auto_267126 ?auto_267128 ) ) ( not ( = ?auto_267126 ?auto_267129 ) ) ( not ( = ?auto_267126 ?auto_267130 ) ) ( not ( = ?auto_267126 ?auto_267131 ) ) ( not ( = ?auto_267126 ?auto_267132 ) ) ( not ( = ?auto_267126 ?auto_267133 ) ) ( not ( = ?auto_267126 ?auto_267134 ) ) ( not ( = ?auto_267127 ?auto_267128 ) ) ( not ( = ?auto_267127 ?auto_267129 ) ) ( not ( = ?auto_267127 ?auto_267130 ) ) ( not ( = ?auto_267127 ?auto_267131 ) ) ( not ( = ?auto_267127 ?auto_267132 ) ) ( not ( = ?auto_267127 ?auto_267133 ) ) ( not ( = ?auto_267127 ?auto_267134 ) ) ( not ( = ?auto_267128 ?auto_267129 ) ) ( not ( = ?auto_267128 ?auto_267130 ) ) ( not ( = ?auto_267128 ?auto_267131 ) ) ( not ( = ?auto_267128 ?auto_267132 ) ) ( not ( = ?auto_267128 ?auto_267133 ) ) ( not ( = ?auto_267128 ?auto_267134 ) ) ( not ( = ?auto_267129 ?auto_267130 ) ) ( not ( = ?auto_267129 ?auto_267131 ) ) ( not ( = ?auto_267129 ?auto_267132 ) ) ( not ( = ?auto_267129 ?auto_267133 ) ) ( not ( = ?auto_267129 ?auto_267134 ) ) ( not ( = ?auto_267130 ?auto_267131 ) ) ( not ( = ?auto_267130 ?auto_267132 ) ) ( not ( = ?auto_267130 ?auto_267133 ) ) ( not ( = ?auto_267130 ?auto_267134 ) ) ( not ( = ?auto_267131 ?auto_267132 ) ) ( not ( = ?auto_267131 ?auto_267133 ) ) ( not ( = ?auto_267131 ?auto_267134 ) ) ( not ( = ?auto_267132 ?auto_267133 ) ) ( not ( = ?auto_267132 ?auto_267134 ) ) ( not ( = ?auto_267133 ?auto_267134 ) ) ( ON ?auto_267132 ?auto_267133 ) ( ON ?auto_267131 ?auto_267132 ) ( ON ?auto_267130 ?auto_267131 ) ( ON ?auto_267129 ?auto_267130 ) ( ON ?auto_267128 ?auto_267129 ) ( ON ?auto_267127 ?auto_267128 ) ( ON ?auto_267126 ?auto_267127 ) ( ON ?auto_267125 ?auto_267126 ) ( CLEAR ?auto_267123 ) ( ON ?auto_267124 ?auto_267125 ) ( CLEAR ?auto_267124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_267122 ?auto_267123 ?auto_267124 )
      ( MAKE-12PILE ?auto_267122 ?auto_267123 ?auto_267124 ?auto_267125 ?auto_267126 ?auto_267127 ?auto_267128 ?auto_267129 ?auto_267130 ?auto_267131 ?auto_267132 ?auto_267133 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267172 - BLOCK
      ?auto_267173 - BLOCK
      ?auto_267174 - BLOCK
      ?auto_267175 - BLOCK
      ?auto_267176 - BLOCK
      ?auto_267177 - BLOCK
      ?auto_267178 - BLOCK
      ?auto_267179 - BLOCK
      ?auto_267180 - BLOCK
      ?auto_267181 - BLOCK
      ?auto_267182 - BLOCK
      ?auto_267183 - BLOCK
    )
    :vars
    (
      ?auto_267184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267183 ?auto_267184 ) ( ON-TABLE ?auto_267172 ) ( not ( = ?auto_267172 ?auto_267173 ) ) ( not ( = ?auto_267172 ?auto_267174 ) ) ( not ( = ?auto_267172 ?auto_267175 ) ) ( not ( = ?auto_267172 ?auto_267176 ) ) ( not ( = ?auto_267172 ?auto_267177 ) ) ( not ( = ?auto_267172 ?auto_267178 ) ) ( not ( = ?auto_267172 ?auto_267179 ) ) ( not ( = ?auto_267172 ?auto_267180 ) ) ( not ( = ?auto_267172 ?auto_267181 ) ) ( not ( = ?auto_267172 ?auto_267182 ) ) ( not ( = ?auto_267172 ?auto_267183 ) ) ( not ( = ?auto_267172 ?auto_267184 ) ) ( not ( = ?auto_267173 ?auto_267174 ) ) ( not ( = ?auto_267173 ?auto_267175 ) ) ( not ( = ?auto_267173 ?auto_267176 ) ) ( not ( = ?auto_267173 ?auto_267177 ) ) ( not ( = ?auto_267173 ?auto_267178 ) ) ( not ( = ?auto_267173 ?auto_267179 ) ) ( not ( = ?auto_267173 ?auto_267180 ) ) ( not ( = ?auto_267173 ?auto_267181 ) ) ( not ( = ?auto_267173 ?auto_267182 ) ) ( not ( = ?auto_267173 ?auto_267183 ) ) ( not ( = ?auto_267173 ?auto_267184 ) ) ( not ( = ?auto_267174 ?auto_267175 ) ) ( not ( = ?auto_267174 ?auto_267176 ) ) ( not ( = ?auto_267174 ?auto_267177 ) ) ( not ( = ?auto_267174 ?auto_267178 ) ) ( not ( = ?auto_267174 ?auto_267179 ) ) ( not ( = ?auto_267174 ?auto_267180 ) ) ( not ( = ?auto_267174 ?auto_267181 ) ) ( not ( = ?auto_267174 ?auto_267182 ) ) ( not ( = ?auto_267174 ?auto_267183 ) ) ( not ( = ?auto_267174 ?auto_267184 ) ) ( not ( = ?auto_267175 ?auto_267176 ) ) ( not ( = ?auto_267175 ?auto_267177 ) ) ( not ( = ?auto_267175 ?auto_267178 ) ) ( not ( = ?auto_267175 ?auto_267179 ) ) ( not ( = ?auto_267175 ?auto_267180 ) ) ( not ( = ?auto_267175 ?auto_267181 ) ) ( not ( = ?auto_267175 ?auto_267182 ) ) ( not ( = ?auto_267175 ?auto_267183 ) ) ( not ( = ?auto_267175 ?auto_267184 ) ) ( not ( = ?auto_267176 ?auto_267177 ) ) ( not ( = ?auto_267176 ?auto_267178 ) ) ( not ( = ?auto_267176 ?auto_267179 ) ) ( not ( = ?auto_267176 ?auto_267180 ) ) ( not ( = ?auto_267176 ?auto_267181 ) ) ( not ( = ?auto_267176 ?auto_267182 ) ) ( not ( = ?auto_267176 ?auto_267183 ) ) ( not ( = ?auto_267176 ?auto_267184 ) ) ( not ( = ?auto_267177 ?auto_267178 ) ) ( not ( = ?auto_267177 ?auto_267179 ) ) ( not ( = ?auto_267177 ?auto_267180 ) ) ( not ( = ?auto_267177 ?auto_267181 ) ) ( not ( = ?auto_267177 ?auto_267182 ) ) ( not ( = ?auto_267177 ?auto_267183 ) ) ( not ( = ?auto_267177 ?auto_267184 ) ) ( not ( = ?auto_267178 ?auto_267179 ) ) ( not ( = ?auto_267178 ?auto_267180 ) ) ( not ( = ?auto_267178 ?auto_267181 ) ) ( not ( = ?auto_267178 ?auto_267182 ) ) ( not ( = ?auto_267178 ?auto_267183 ) ) ( not ( = ?auto_267178 ?auto_267184 ) ) ( not ( = ?auto_267179 ?auto_267180 ) ) ( not ( = ?auto_267179 ?auto_267181 ) ) ( not ( = ?auto_267179 ?auto_267182 ) ) ( not ( = ?auto_267179 ?auto_267183 ) ) ( not ( = ?auto_267179 ?auto_267184 ) ) ( not ( = ?auto_267180 ?auto_267181 ) ) ( not ( = ?auto_267180 ?auto_267182 ) ) ( not ( = ?auto_267180 ?auto_267183 ) ) ( not ( = ?auto_267180 ?auto_267184 ) ) ( not ( = ?auto_267181 ?auto_267182 ) ) ( not ( = ?auto_267181 ?auto_267183 ) ) ( not ( = ?auto_267181 ?auto_267184 ) ) ( not ( = ?auto_267182 ?auto_267183 ) ) ( not ( = ?auto_267182 ?auto_267184 ) ) ( not ( = ?auto_267183 ?auto_267184 ) ) ( ON ?auto_267182 ?auto_267183 ) ( ON ?auto_267181 ?auto_267182 ) ( ON ?auto_267180 ?auto_267181 ) ( ON ?auto_267179 ?auto_267180 ) ( ON ?auto_267178 ?auto_267179 ) ( ON ?auto_267177 ?auto_267178 ) ( ON ?auto_267176 ?auto_267177 ) ( ON ?auto_267175 ?auto_267176 ) ( ON ?auto_267174 ?auto_267175 ) ( CLEAR ?auto_267172 ) ( ON ?auto_267173 ?auto_267174 ) ( CLEAR ?auto_267173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_267172 ?auto_267173 )
      ( MAKE-12PILE ?auto_267172 ?auto_267173 ?auto_267174 ?auto_267175 ?auto_267176 ?auto_267177 ?auto_267178 ?auto_267179 ?auto_267180 ?auto_267181 ?auto_267182 ?auto_267183 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267222 - BLOCK
      ?auto_267223 - BLOCK
      ?auto_267224 - BLOCK
      ?auto_267225 - BLOCK
      ?auto_267226 - BLOCK
      ?auto_267227 - BLOCK
      ?auto_267228 - BLOCK
      ?auto_267229 - BLOCK
      ?auto_267230 - BLOCK
      ?auto_267231 - BLOCK
      ?auto_267232 - BLOCK
      ?auto_267233 - BLOCK
    )
    :vars
    (
      ?auto_267234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267233 ?auto_267234 ) ( not ( = ?auto_267222 ?auto_267223 ) ) ( not ( = ?auto_267222 ?auto_267224 ) ) ( not ( = ?auto_267222 ?auto_267225 ) ) ( not ( = ?auto_267222 ?auto_267226 ) ) ( not ( = ?auto_267222 ?auto_267227 ) ) ( not ( = ?auto_267222 ?auto_267228 ) ) ( not ( = ?auto_267222 ?auto_267229 ) ) ( not ( = ?auto_267222 ?auto_267230 ) ) ( not ( = ?auto_267222 ?auto_267231 ) ) ( not ( = ?auto_267222 ?auto_267232 ) ) ( not ( = ?auto_267222 ?auto_267233 ) ) ( not ( = ?auto_267222 ?auto_267234 ) ) ( not ( = ?auto_267223 ?auto_267224 ) ) ( not ( = ?auto_267223 ?auto_267225 ) ) ( not ( = ?auto_267223 ?auto_267226 ) ) ( not ( = ?auto_267223 ?auto_267227 ) ) ( not ( = ?auto_267223 ?auto_267228 ) ) ( not ( = ?auto_267223 ?auto_267229 ) ) ( not ( = ?auto_267223 ?auto_267230 ) ) ( not ( = ?auto_267223 ?auto_267231 ) ) ( not ( = ?auto_267223 ?auto_267232 ) ) ( not ( = ?auto_267223 ?auto_267233 ) ) ( not ( = ?auto_267223 ?auto_267234 ) ) ( not ( = ?auto_267224 ?auto_267225 ) ) ( not ( = ?auto_267224 ?auto_267226 ) ) ( not ( = ?auto_267224 ?auto_267227 ) ) ( not ( = ?auto_267224 ?auto_267228 ) ) ( not ( = ?auto_267224 ?auto_267229 ) ) ( not ( = ?auto_267224 ?auto_267230 ) ) ( not ( = ?auto_267224 ?auto_267231 ) ) ( not ( = ?auto_267224 ?auto_267232 ) ) ( not ( = ?auto_267224 ?auto_267233 ) ) ( not ( = ?auto_267224 ?auto_267234 ) ) ( not ( = ?auto_267225 ?auto_267226 ) ) ( not ( = ?auto_267225 ?auto_267227 ) ) ( not ( = ?auto_267225 ?auto_267228 ) ) ( not ( = ?auto_267225 ?auto_267229 ) ) ( not ( = ?auto_267225 ?auto_267230 ) ) ( not ( = ?auto_267225 ?auto_267231 ) ) ( not ( = ?auto_267225 ?auto_267232 ) ) ( not ( = ?auto_267225 ?auto_267233 ) ) ( not ( = ?auto_267225 ?auto_267234 ) ) ( not ( = ?auto_267226 ?auto_267227 ) ) ( not ( = ?auto_267226 ?auto_267228 ) ) ( not ( = ?auto_267226 ?auto_267229 ) ) ( not ( = ?auto_267226 ?auto_267230 ) ) ( not ( = ?auto_267226 ?auto_267231 ) ) ( not ( = ?auto_267226 ?auto_267232 ) ) ( not ( = ?auto_267226 ?auto_267233 ) ) ( not ( = ?auto_267226 ?auto_267234 ) ) ( not ( = ?auto_267227 ?auto_267228 ) ) ( not ( = ?auto_267227 ?auto_267229 ) ) ( not ( = ?auto_267227 ?auto_267230 ) ) ( not ( = ?auto_267227 ?auto_267231 ) ) ( not ( = ?auto_267227 ?auto_267232 ) ) ( not ( = ?auto_267227 ?auto_267233 ) ) ( not ( = ?auto_267227 ?auto_267234 ) ) ( not ( = ?auto_267228 ?auto_267229 ) ) ( not ( = ?auto_267228 ?auto_267230 ) ) ( not ( = ?auto_267228 ?auto_267231 ) ) ( not ( = ?auto_267228 ?auto_267232 ) ) ( not ( = ?auto_267228 ?auto_267233 ) ) ( not ( = ?auto_267228 ?auto_267234 ) ) ( not ( = ?auto_267229 ?auto_267230 ) ) ( not ( = ?auto_267229 ?auto_267231 ) ) ( not ( = ?auto_267229 ?auto_267232 ) ) ( not ( = ?auto_267229 ?auto_267233 ) ) ( not ( = ?auto_267229 ?auto_267234 ) ) ( not ( = ?auto_267230 ?auto_267231 ) ) ( not ( = ?auto_267230 ?auto_267232 ) ) ( not ( = ?auto_267230 ?auto_267233 ) ) ( not ( = ?auto_267230 ?auto_267234 ) ) ( not ( = ?auto_267231 ?auto_267232 ) ) ( not ( = ?auto_267231 ?auto_267233 ) ) ( not ( = ?auto_267231 ?auto_267234 ) ) ( not ( = ?auto_267232 ?auto_267233 ) ) ( not ( = ?auto_267232 ?auto_267234 ) ) ( not ( = ?auto_267233 ?auto_267234 ) ) ( ON ?auto_267232 ?auto_267233 ) ( ON ?auto_267231 ?auto_267232 ) ( ON ?auto_267230 ?auto_267231 ) ( ON ?auto_267229 ?auto_267230 ) ( ON ?auto_267228 ?auto_267229 ) ( ON ?auto_267227 ?auto_267228 ) ( ON ?auto_267226 ?auto_267227 ) ( ON ?auto_267225 ?auto_267226 ) ( ON ?auto_267224 ?auto_267225 ) ( ON ?auto_267223 ?auto_267224 ) ( ON ?auto_267222 ?auto_267223 ) ( CLEAR ?auto_267222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_267222 )
      ( MAKE-12PILE ?auto_267222 ?auto_267223 ?auto_267224 ?auto_267225 ?auto_267226 ?auto_267227 ?auto_267228 ?auto_267229 ?auto_267230 ?auto_267231 ?auto_267232 ?auto_267233 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267273 - BLOCK
      ?auto_267274 - BLOCK
      ?auto_267275 - BLOCK
      ?auto_267276 - BLOCK
      ?auto_267277 - BLOCK
      ?auto_267278 - BLOCK
      ?auto_267279 - BLOCK
      ?auto_267280 - BLOCK
      ?auto_267281 - BLOCK
      ?auto_267282 - BLOCK
      ?auto_267283 - BLOCK
      ?auto_267284 - BLOCK
      ?auto_267285 - BLOCK
    )
    :vars
    (
      ?auto_267286 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_267284 ) ( ON ?auto_267285 ?auto_267286 ) ( CLEAR ?auto_267285 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_267273 ) ( ON ?auto_267274 ?auto_267273 ) ( ON ?auto_267275 ?auto_267274 ) ( ON ?auto_267276 ?auto_267275 ) ( ON ?auto_267277 ?auto_267276 ) ( ON ?auto_267278 ?auto_267277 ) ( ON ?auto_267279 ?auto_267278 ) ( ON ?auto_267280 ?auto_267279 ) ( ON ?auto_267281 ?auto_267280 ) ( ON ?auto_267282 ?auto_267281 ) ( ON ?auto_267283 ?auto_267282 ) ( ON ?auto_267284 ?auto_267283 ) ( not ( = ?auto_267273 ?auto_267274 ) ) ( not ( = ?auto_267273 ?auto_267275 ) ) ( not ( = ?auto_267273 ?auto_267276 ) ) ( not ( = ?auto_267273 ?auto_267277 ) ) ( not ( = ?auto_267273 ?auto_267278 ) ) ( not ( = ?auto_267273 ?auto_267279 ) ) ( not ( = ?auto_267273 ?auto_267280 ) ) ( not ( = ?auto_267273 ?auto_267281 ) ) ( not ( = ?auto_267273 ?auto_267282 ) ) ( not ( = ?auto_267273 ?auto_267283 ) ) ( not ( = ?auto_267273 ?auto_267284 ) ) ( not ( = ?auto_267273 ?auto_267285 ) ) ( not ( = ?auto_267273 ?auto_267286 ) ) ( not ( = ?auto_267274 ?auto_267275 ) ) ( not ( = ?auto_267274 ?auto_267276 ) ) ( not ( = ?auto_267274 ?auto_267277 ) ) ( not ( = ?auto_267274 ?auto_267278 ) ) ( not ( = ?auto_267274 ?auto_267279 ) ) ( not ( = ?auto_267274 ?auto_267280 ) ) ( not ( = ?auto_267274 ?auto_267281 ) ) ( not ( = ?auto_267274 ?auto_267282 ) ) ( not ( = ?auto_267274 ?auto_267283 ) ) ( not ( = ?auto_267274 ?auto_267284 ) ) ( not ( = ?auto_267274 ?auto_267285 ) ) ( not ( = ?auto_267274 ?auto_267286 ) ) ( not ( = ?auto_267275 ?auto_267276 ) ) ( not ( = ?auto_267275 ?auto_267277 ) ) ( not ( = ?auto_267275 ?auto_267278 ) ) ( not ( = ?auto_267275 ?auto_267279 ) ) ( not ( = ?auto_267275 ?auto_267280 ) ) ( not ( = ?auto_267275 ?auto_267281 ) ) ( not ( = ?auto_267275 ?auto_267282 ) ) ( not ( = ?auto_267275 ?auto_267283 ) ) ( not ( = ?auto_267275 ?auto_267284 ) ) ( not ( = ?auto_267275 ?auto_267285 ) ) ( not ( = ?auto_267275 ?auto_267286 ) ) ( not ( = ?auto_267276 ?auto_267277 ) ) ( not ( = ?auto_267276 ?auto_267278 ) ) ( not ( = ?auto_267276 ?auto_267279 ) ) ( not ( = ?auto_267276 ?auto_267280 ) ) ( not ( = ?auto_267276 ?auto_267281 ) ) ( not ( = ?auto_267276 ?auto_267282 ) ) ( not ( = ?auto_267276 ?auto_267283 ) ) ( not ( = ?auto_267276 ?auto_267284 ) ) ( not ( = ?auto_267276 ?auto_267285 ) ) ( not ( = ?auto_267276 ?auto_267286 ) ) ( not ( = ?auto_267277 ?auto_267278 ) ) ( not ( = ?auto_267277 ?auto_267279 ) ) ( not ( = ?auto_267277 ?auto_267280 ) ) ( not ( = ?auto_267277 ?auto_267281 ) ) ( not ( = ?auto_267277 ?auto_267282 ) ) ( not ( = ?auto_267277 ?auto_267283 ) ) ( not ( = ?auto_267277 ?auto_267284 ) ) ( not ( = ?auto_267277 ?auto_267285 ) ) ( not ( = ?auto_267277 ?auto_267286 ) ) ( not ( = ?auto_267278 ?auto_267279 ) ) ( not ( = ?auto_267278 ?auto_267280 ) ) ( not ( = ?auto_267278 ?auto_267281 ) ) ( not ( = ?auto_267278 ?auto_267282 ) ) ( not ( = ?auto_267278 ?auto_267283 ) ) ( not ( = ?auto_267278 ?auto_267284 ) ) ( not ( = ?auto_267278 ?auto_267285 ) ) ( not ( = ?auto_267278 ?auto_267286 ) ) ( not ( = ?auto_267279 ?auto_267280 ) ) ( not ( = ?auto_267279 ?auto_267281 ) ) ( not ( = ?auto_267279 ?auto_267282 ) ) ( not ( = ?auto_267279 ?auto_267283 ) ) ( not ( = ?auto_267279 ?auto_267284 ) ) ( not ( = ?auto_267279 ?auto_267285 ) ) ( not ( = ?auto_267279 ?auto_267286 ) ) ( not ( = ?auto_267280 ?auto_267281 ) ) ( not ( = ?auto_267280 ?auto_267282 ) ) ( not ( = ?auto_267280 ?auto_267283 ) ) ( not ( = ?auto_267280 ?auto_267284 ) ) ( not ( = ?auto_267280 ?auto_267285 ) ) ( not ( = ?auto_267280 ?auto_267286 ) ) ( not ( = ?auto_267281 ?auto_267282 ) ) ( not ( = ?auto_267281 ?auto_267283 ) ) ( not ( = ?auto_267281 ?auto_267284 ) ) ( not ( = ?auto_267281 ?auto_267285 ) ) ( not ( = ?auto_267281 ?auto_267286 ) ) ( not ( = ?auto_267282 ?auto_267283 ) ) ( not ( = ?auto_267282 ?auto_267284 ) ) ( not ( = ?auto_267282 ?auto_267285 ) ) ( not ( = ?auto_267282 ?auto_267286 ) ) ( not ( = ?auto_267283 ?auto_267284 ) ) ( not ( = ?auto_267283 ?auto_267285 ) ) ( not ( = ?auto_267283 ?auto_267286 ) ) ( not ( = ?auto_267284 ?auto_267285 ) ) ( not ( = ?auto_267284 ?auto_267286 ) ) ( not ( = ?auto_267285 ?auto_267286 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_267285 ?auto_267286 )
      ( !STACK ?auto_267285 ?auto_267284 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267300 - BLOCK
      ?auto_267301 - BLOCK
      ?auto_267302 - BLOCK
      ?auto_267303 - BLOCK
      ?auto_267304 - BLOCK
      ?auto_267305 - BLOCK
      ?auto_267306 - BLOCK
      ?auto_267307 - BLOCK
      ?auto_267308 - BLOCK
      ?auto_267309 - BLOCK
      ?auto_267310 - BLOCK
      ?auto_267311 - BLOCK
      ?auto_267312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_267311 ) ( ON-TABLE ?auto_267312 ) ( CLEAR ?auto_267312 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_267300 ) ( ON ?auto_267301 ?auto_267300 ) ( ON ?auto_267302 ?auto_267301 ) ( ON ?auto_267303 ?auto_267302 ) ( ON ?auto_267304 ?auto_267303 ) ( ON ?auto_267305 ?auto_267304 ) ( ON ?auto_267306 ?auto_267305 ) ( ON ?auto_267307 ?auto_267306 ) ( ON ?auto_267308 ?auto_267307 ) ( ON ?auto_267309 ?auto_267308 ) ( ON ?auto_267310 ?auto_267309 ) ( ON ?auto_267311 ?auto_267310 ) ( not ( = ?auto_267300 ?auto_267301 ) ) ( not ( = ?auto_267300 ?auto_267302 ) ) ( not ( = ?auto_267300 ?auto_267303 ) ) ( not ( = ?auto_267300 ?auto_267304 ) ) ( not ( = ?auto_267300 ?auto_267305 ) ) ( not ( = ?auto_267300 ?auto_267306 ) ) ( not ( = ?auto_267300 ?auto_267307 ) ) ( not ( = ?auto_267300 ?auto_267308 ) ) ( not ( = ?auto_267300 ?auto_267309 ) ) ( not ( = ?auto_267300 ?auto_267310 ) ) ( not ( = ?auto_267300 ?auto_267311 ) ) ( not ( = ?auto_267300 ?auto_267312 ) ) ( not ( = ?auto_267301 ?auto_267302 ) ) ( not ( = ?auto_267301 ?auto_267303 ) ) ( not ( = ?auto_267301 ?auto_267304 ) ) ( not ( = ?auto_267301 ?auto_267305 ) ) ( not ( = ?auto_267301 ?auto_267306 ) ) ( not ( = ?auto_267301 ?auto_267307 ) ) ( not ( = ?auto_267301 ?auto_267308 ) ) ( not ( = ?auto_267301 ?auto_267309 ) ) ( not ( = ?auto_267301 ?auto_267310 ) ) ( not ( = ?auto_267301 ?auto_267311 ) ) ( not ( = ?auto_267301 ?auto_267312 ) ) ( not ( = ?auto_267302 ?auto_267303 ) ) ( not ( = ?auto_267302 ?auto_267304 ) ) ( not ( = ?auto_267302 ?auto_267305 ) ) ( not ( = ?auto_267302 ?auto_267306 ) ) ( not ( = ?auto_267302 ?auto_267307 ) ) ( not ( = ?auto_267302 ?auto_267308 ) ) ( not ( = ?auto_267302 ?auto_267309 ) ) ( not ( = ?auto_267302 ?auto_267310 ) ) ( not ( = ?auto_267302 ?auto_267311 ) ) ( not ( = ?auto_267302 ?auto_267312 ) ) ( not ( = ?auto_267303 ?auto_267304 ) ) ( not ( = ?auto_267303 ?auto_267305 ) ) ( not ( = ?auto_267303 ?auto_267306 ) ) ( not ( = ?auto_267303 ?auto_267307 ) ) ( not ( = ?auto_267303 ?auto_267308 ) ) ( not ( = ?auto_267303 ?auto_267309 ) ) ( not ( = ?auto_267303 ?auto_267310 ) ) ( not ( = ?auto_267303 ?auto_267311 ) ) ( not ( = ?auto_267303 ?auto_267312 ) ) ( not ( = ?auto_267304 ?auto_267305 ) ) ( not ( = ?auto_267304 ?auto_267306 ) ) ( not ( = ?auto_267304 ?auto_267307 ) ) ( not ( = ?auto_267304 ?auto_267308 ) ) ( not ( = ?auto_267304 ?auto_267309 ) ) ( not ( = ?auto_267304 ?auto_267310 ) ) ( not ( = ?auto_267304 ?auto_267311 ) ) ( not ( = ?auto_267304 ?auto_267312 ) ) ( not ( = ?auto_267305 ?auto_267306 ) ) ( not ( = ?auto_267305 ?auto_267307 ) ) ( not ( = ?auto_267305 ?auto_267308 ) ) ( not ( = ?auto_267305 ?auto_267309 ) ) ( not ( = ?auto_267305 ?auto_267310 ) ) ( not ( = ?auto_267305 ?auto_267311 ) ) ( not ( = ?auto_267305 ?auto_267312 ) ) ( not ( = ?auto_267306 ?auto_267307 ) ) ( not ( = ?auto_267306 ?auto_267308 ) ) ( not ( = ?auto_267306 ?auto_267309 ) ) ( not ( = ?auto_267306 ?auto_267310 ) ) ( not ( = ?auto_267306 ?auto_267311 ) ) ( not ( = ?auto_267306 ?auto_267312 ) ) ( not ( = ?auto_267307 ?auto_267308 ) ) ( not ( = ?auto_267307 ?auto_267309 ) ) ( not ( = ?auto_267307 ?auto_267310 ) ) ( not ( = ?auto_267307 ?auto_267311 ) ) ( not ( = ?auto_267307 ?auto_267312 ) ) ( not ( = ?auto_267308 ?auto_267309 ) ) ( not ( = ?auto_267308 ?auto_267310 ) ) ( not ( = ?auto_267308 ?auto_267311 ) ) ( not ( = ?auto_267308 ?auto_267312 ) ) ( not ( = ?auto_267309 ?auto_267310 ) ) ( not ( = ?auto_267309 ?auto_267311 ) ) ( not ( = ?auto_267309 ?auto_267312 ) ) ( not ( = ?auto_267310 ?auto_267311 ) ) ( not ( = ?auto_267310 ?auto_267312 ) ) ( not ( = ?auto_267311 ?auto_267312 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_267312 )
      ( !STACK ?auto_267312 ?auto_267311 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267326 - BLOCK
      ?auto_267327 - BLOCK
      ?auto_267328 - BLOCK
      ?auto_267329 - BLOCK
      ?auto_267330 - BLOCK
      ?auto_267331 - BLOCK
      ?auto_267332 - BLOCK
      ?auto_267333 - BLOCK
      ?auto_267334 - BLOCK
      ?auto_267335 - BLOCK
      ?auto_267336 - BLOCK
      ?auto_267337 - BLOCK
      ?auto_267338 - BLOCK
    )
    :vars
    (
      ?auto_267339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267338 ?auto_267339 ) ( ON-TABLE ?auto_267326 ) ( ON ?auto_267327 ?auto_267326 ) ( ON ?auto_267328 ?auto_267327 ) ( ON ?auto_267329 ?auto_267328 ) ( ON ?auto_267330 ?auto_267329 ) ( ON ?auto_267331 ?auto_267330 ) ( ON ?auto_267332 ?auto_267331 ) ( ON ?auto_267333 ?auto_267332 ) ( ON ?auto_267334 ?auto_267333 ) ( ON ?auto_267335 ?auto_267334 ) ( ON ?auto_267336 ?auto_267335 ) ( not ( = ?auto_267326 ?auto_267327 ) ) ( not ( = ?auto_267326 ?auto_267328 ) ) ( not ( = ?auto_267326 ?auto_267329 ) ) ( not ( = ?auto_267326 ?auto_267330 ) ) ( not ( = ?auto_267326 ?auto_267331 ) ) ( not ( = ?auto_267326 ?auto_267332 ) ) ( not ( = ?auto_267326 ?auto_267333 ) ) ( not ( = ?auto_267326 ?auto_267334 ) ) ( not ( = ?auto_267326 ?auto_267335 ) ) ( not ( = ?auto_267326 ?auto_267336 ) ) ( not ( = ?auto_267326 ?auto_267337 ) ) ( not ( = ?auto_267326 ?auto_267338 ) ) ( not ( = ?auto_267326 ?auto_267339 ) ) ( not ( = ?auto_267327 ?auto_267328 ) ) ( not ( = ?auto_267327 ?auto_267329 ) ) ( not ( = ?auto_267327 ?auto_267330 ) ) ( not ( = ?auto_267327 ?auto_267331 ) ) ( not ( = ?auto_267327 ?auto_267332 ) ) ( not ( = ?auto_267327 ?auto_267333 ) ) ( not ( = ?auto_267327 ?auto_267334 ) ) ( not ( = ?auto_267327 ?auto_267335 ) ) ( not ( = ?auto_267327 ?auto_267336 ) ) ( not ( = ?auto_267327 ?auto_267337 ) ) ( not ( = ?auto_267327 ?auto_267338 ) ) ( not ( = ?auto_267327 ?auto_267339 ) ) ( not ( = ?auto_267328 ?auto_267329 ) ) ( not ( = ?auto_267328 ?auto_267330 ) ) ( not ( = ?auto_267328 ?auto_267331 ) ) ( not ( = ?auto_267328 ?auto_267332 ) ) ( not ( = ?auto_267328 ?auto_267333 ) ) ( not ( = ?auto_267328 ?auto_267334 ) ) ( not ( = ?auto_267328 ?auto_267335 ) ) ( not ( = ?auto_267328 ?auto_267336 ) ) ( not ( = ?auto_267328 ?auto_267337 ) ) ( not ( = ?auto_267328 ?auto_267338 ) ) ( not ( = ?auto_267328 ?auto_267339 ) ) ( not ( = ?auto_267329 ?auto_267330 ) ) ( not ( = ?auto_267329 ?auto_267331 ) ) ( not ( = ?auto_267329 ?auto_267332 ) ) ( not ( = ?auto_267329 ?auto_267333 ) ) ( not ( = ?auto_267329 ?auto_267334 ) ) ( not ( = ?auto_267329 ?auto_267335 ) ) ( not ( = ?auto_267329 ?auto_267336 ) ) ( not ( = ?auto_267329 ?auto_267337 ) ) ( not ( = ?auto_267329 ?auto_267338 ) ) ( not ( = ?auto_267329 ?auto_267339 ) ) ( not ( = ?auto_267330 ?auto_267331 ) ) ( not ( = ?auto_267330 ?auto_267332 ) ) ( not ( = ?auto_267330 ?auto_267333 ) ) ( not ( = ?auto_267330 ?auto_267334 ) ) ( not ( = ?auto_267330 ?auto_267335 ) ) ( not ( = ?auto_267330 ?auto_267336 ) ) ( not ( = ?auto_267330 ?auto_267337 ) ) ( not ( = ?auto_267330 ?auto_267338 ) ) ( not ( = ?auto_267330 ?auto_267339 ) ) ( not ( = ?auto_267331 ?auto_267332 ) ) ( not ( = ?auto_267331 ?auto_267333 ) ) ( not ( = ?auto_267331 ?auto_267334 ) ) ( not ( = ?auto_267331 ?auto_267335 ) ) ( not ( = ?auto_267331 ?auto_267336 ) ) ( not ( = ?auto_267331 ?auto_267337 ) ) ( not ( = ?auto_267331 ?auto_267338 ) ) ( not ( = ?auto_267331 ?auto_267339 ) ) ( not ( = ?auto_267332 ?auto_267333 ) ) ( not ( = ?auto_267332 ?auto_267334 ) ) ( not ( = ?auto_267332 ?auto_267335 ) ) ( not ( = ?auto_267332 ?auto_267336 ) ) ( not ( = ?auto_267332 ?auto_267337 ) ) ( not ( = ?auto_267332 ?auto_267338 ) ) ( not ( = ?auto_267332 ?auto_267339 ) ) ( not ( = ?auto_267333 ?auto_267334 ) ) ( not ( = ?auto_267333 ?auto_267335 ) ) ( not ( = ?auto_267333 ?auto_267336 ) ) ( not ( = ?auto_267333 ?auto_267337 ) ) ( not ( = ?auto_267333 ?auto_267338 ) ) ( not ( = ?auto_267333 ?auto_267339 ) ) ( not ( = ?auto_267334 ?auto_267335 ) ) ( not ( = ?auto_267334 ?auto_267336 ) ) ( not ( = ?auto_267334 ?auto_267337 ) ) ( not ( = ?auto_267334 ?auto_267338 ) ) ( not ( = ?auto_267334 ?auto_267339 ) ) ( not ( = ?auto_267335 ?auto_267336 ) ) ( not ( = ?auto_267335 ?auto_267337 ) ) ( not ( = ?auto_267335 ?auto_267338 ) ) ( not ( = ?auto_267335 ?auto_267339 ) ) ( not ( = ?auto_267336 ?auto_267337 ) ) ( not ( = ?auto_267336 ?auto_267338 ) ) ( not ( = ?auto_267336 ?auto_267339 ) ) ( not ( = ?auto_267337 ?auto_267338 ) ) ( not ( = ?auto_267337 ?auto_267339 ) ) ( not ( = ?auto_267338 ?auto_267339 ) ) ( CLEAR ?auto_267336 ) ( ON ?auto_267337 ?auto_267338 ) ( CLEAR ?auto_267337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_267326 ?auto_267327 ?auto_267328 ?auto_267329 ?auto_267330 ?auto_267331 ?auto_267332 ?auto_267333 ?auto_267334 ?auto_267335 ?auto_267336 ?auto_267337 )
      ( MAKE-13PILE ?auto_267326 ?auto_267327 ?auto_267328 ?auto_267329 ?auto_267330 ?auto_267331 ?auto_267332 ?auto_267333 ?auto_267334 ?auto_267335 ?auto_267336 ?auto_267337 ?auto_267338 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267353 - BLOCK
      ?auto_267354 - BLOCK
      ?auto_267355 - BLOCK
      ?auto_267356 - BLOCK
      ?auto_267357 - BLOCK
      ?auto_267358 - BLOCK
      ?auto_267359 - BLOCK
      ?auto_267360 - BLOCK
      ?auto_267361 - BLOCK
      ?auto_267362 - BLOCK
      ?auto_267363 - BLOCK
      ?auto_267364 - BLOCK
      ?auto_267365 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267365 ) ( ON-TABLE ?auto_267353 ) ( ON ?auto_267354 ?auto_267353 ) ( ON ?auto_267355 ?auto_267354 ) ( ON ?auto_267356 ?auto_267355 ) ( ON ?auto_267357 ?auto_267356 ) ( ON ?auto_267358 ?auto_267357 ) ( ON ?auto_267359 ?auto_267358 ) ( ON ?auto_267360 ?auto_267359 ) ( ON ?auto_267361 ?auto_267360 ) ( ON ?auto_267362 ?auto_267361 ) ( ON ?auto_267363 ?auto_267362 ) ( not ( = ?auto_267353 ?auto_267354 ) ) ( not ( = ?auto_267353 ?auto_267355 ) ) ( not ( = ?auto_267353 ?auto_267356 ) ) ( not ( = ?auto_267353 ?auto_267357 ) ) ( not ( = ?auto_267353 ?auto_267358 ) ) ( not ( = ?auto_267353 ?auto_267359 ) ) ( not ( = ?auto_267353 ?auto_267360 ) ) ( not ( = ?auto_267353 ?auto_267361 ) ) ( not ( = ?auto_267353 ?auto_267362 ) ) ( not ( = ?auto_267353 ?auto_267363 ) ) ( not ( = ?auto_267353 ?auto_267364 ) ) ( not ( = ?auto_267353 ?auto_267365 ) ) ( not ( = ?auto_267354 ?auto_267355 ) ) ( not ( = ?auto_267354 ?auto_267356 ) ) ( not ( = ?auto_267354 ?auto_267357 ) ) ( not ( = ?auto_267354 ?auto_267358 ) ) ( not ( = ?auto_267354 ?auto_267359 ) ) ( not ( = ?auto_267354 ?auto_267360 ) ) ( not ( = ?auto_267354 ?auto_267361 ) ) ( not ( = ?auto_267354 ?auto_267362 ) ) ( not ( = ?auto_267354 ?auto_267363 ) ) ( not ( = ?auto_267354 ?auto_267364 ) ) ( not ( = ?auto_267354 ?auto_267365 ) ) ( not ( = ?auto_267355 ?auto_267356 ) ) ( not ( = ?auto_267355 ?auto_267357 ) ) ( not ( = ?auto_267355 ?auto_267358 ) ) ( not ( = ?auto_267355 ?auto_267359 ) ) ( not ( = ?auto_267355 ?auto_267360 ) ) ( not ( = ?auto_267355 ?auto_267361 ) ) ( not ( = ?auto_267355 ?auto_267362 ) ) ( not ( = ?auto_267355 ?auto_267363 ) ) ( not ( = ?auto_267355 ?auto_267364 ) ) ( not ( = ?auto_267355 ?auto_267365 ) ) ( not ( = ?auto_267356 ?auto_267357 ) ) ( not ( = ?auto_267356 ?auto_267358 ) ) ( not ( = ?auto_267356 ?auto_267359 ) ) ( not ( = ?auto_267356 ?auto_267360 ) ) ( not ( = ?auto_267356 ?auto_267361 ) ) ( not ( = ?auto_267356 ?auto_267362 ) ) ( not ( = ?auto_267356 ?auto_267363 ) ) ( not ( = ?auto_267356 ?auto_267364 ) ) ( not ( = ?auto_267356 ?auto_267365 ) ) ( not ( = ?auto_267357 ?auto_267358 ) ) ( not ( = ?auto_267357 ?auto_267359 ) ) ( not ( = ?auto_267357 ?auto_267360 ) ) ( not ( = ?auto_267357 ?auto_267361 ) ) ( not ( = ?auto_267357 ?auto_267362 ) ) ( not ( = ?auto_267357 ?auto_267363 ) ) ( not ( = ?auto_267357 ?auto_267364 ) ) ( not ( = ?auto_267357 ?auto_267365 ) ) ( not ( = ?auto_267358 ?auto_267359 ) ) ( not ( = ?auto_267358 ?auto_267360 ) ) ( not ( = ?auto_267358 ?auto_267361 ) ) ( not ( = ?auto_267358 ?auto_267362 ) ) ( not ( = ?auto_267358 ?auto_267363 ) ) ( not ( = ?auto_267358 ?auto_267364 ) ) ( not ( = ?auto_267358 ?auto_267365 ) ) ( not ( = ?auto_267359 ?auto_267360 ) ) ( not ( = ?auto_267359 ?auto_267361 ) ) ( not ( = ?auto_267359 ?auto_267362 ) ) ( not ( = ?auto_267359 ?auto_267363 ) ) ( not ( = ?auto_267359 ?auto_267364 ) ) ( not ( = ?auto_267359 ?auto_267365 ) ) ( not ( = ?auto_267360 ?auto_267361 ) ) ( not ( = ?auto_267360 ?auto_267362 ) ) ( not ( = ?auto_267360 ?auto_267363 ) ) ( not ( = ?auto_267360 ?auto_267364 ) ) ( not ( = ?auto_267360 ?auto_267365 ) ) ( not ( = ?auto_267361 ?auto_267362 ) ) ( not ( = ?auto_267361 ?auto_267363 ) ) ( not ( = ?auto_267361 ?auto_267364 ) ) ( not ( = ?auto_267361 ?auto_267365 ) ) ( not ( = ?auto_267362 ?auto_267363 ) ) ( not ( = ?auto_267362 ?auto_267364 ) ) ( not ( = ?auto_267362 ?auto_267365 ) ) ( not ( = ?auto_267363 ?auto_267364 ) ) ( not ( = ?auto_267363 ?auto_267365 ) ) ( not ( = ?auto_267364 ?auto_267365 ) ) ( CLEAR ?auto_267363 ) ( ON ?auto_267364 ?auto_267365 ) ( CLEAR ?auto_267364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_267353 ?auto_267354 ?auto_267355 ?auto_267356 ?auto_267357 ?auto_267358 ?auto_267359 ?auto_267360 ?auto_267361 ?auto_267362 ?auto_267363 ?auto_267364 )
      ( MAKE-13PILE ?auto_267353 ?auto_267354 ?auto_267355 ?auto_267356 ?auto_267357 ?auto_267358 ?auto_267359 ?auto_267360 ?auto_267361 ?auto_267362 ?auto_267363 ?auto_267364 ?auto_267365 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267379 - BLOCK
      ?auto_267380 - BLOCK
      ?auto_267381 - BLOCK
      ?auto_267382 - BLOCK
      ?auto_267383 - BLOCK
      ?auto_267384 - BLOCK
      ?auto_267385 - BLOCK
      ?auto_267386 - BLOCK
      ?auto_267387 - BLOCK
      ?auto_267388 - BLOCK
      ?auto_267389 - BLOCK
      ?auto_267390 - BLOCK
      ?auto_267391 - BLOCK
    )
    :vars
    (
      ?auto_267392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267391 ?auto_267392 ) ( ON-TABLE ?auto_267379 ) ( ON ?auto_267380 ?auto_267379 ) ( ON ?auto_267381 ?auto_267380 ) ( ON ?auto_267382 ?auto_267381 ) ( ON ?auto_267383 ?auto_267382 ) ( ON ?auto_267384 ?auto_267383 ) ( ON ?auto_267385 ?auto_267384 ) ( ON ?auto_267386 ?auto_267385 ) ( ON ?auto_267387 ?auto_267386 ) ( ON ?auto_267388 ?auto_267387 ) ( not ( = ?auto_267379 ?auto_267380 ) ) ( not ( = ?auto_267379 ?auto_267381 ) ) ( not ( = ?auto_267379 ?auto_267382 ) ) ( not ( = ?auto_267379 ?auto_267383 ) ) ( not ( = ?auto_267379 ?auto_267384 ) ) ( not ( = ?auto_267379 ?auto_267385 ) ) ( not ( = ?auto_267379 ?auto_267386 ) ) ( not ( = ?auto_267379 ?auto_267387 ) ) ( not ( = ?auto_267379 ?auto_267388 ) ) ( not ( = ?auto_267379 ?auto_267389 ) ) ( not ( = ?auto_267379 ?auto_267390 ) ) ( not ( = ?auto_267379 ?auto_267391 ) ) ( not ( = ?auto_267379 ?auto_267392 ) ) ( not ( = ?auto_267380 ?auto_267381 ) ) ( not ( = ?auto_267380 ?auto_267382 ) ) ( not ( = ?auto_267380 ?auto_267383 ) ) ( not ( = ?auto_267380 ?auto_267384 ) ) ( not ( = ?auto_267380 ?auto_267385 ) ) ( not ( = ?auto_267380 ?auto_267386 ) ) ( not ( = ?auto_267380 ?auto_267387 ) ) ( not ( = ?auto_267380 ?auto_267388 ) ) ( not ( = ?auto_267380 ?auto_267389 ) ) ( not ( = ?auto_267380 ?auto_267390 ) ) ( not ( = ?auto_267380 ?auto_267391 ) ) ( not ( = ?auto_267380 ?auto_267392 ) ) ( not ( = ?auto_267381 ?auto_267382 ) ) ( not ( = ?auto_267381 ?auto_267383 ) ) ( not ( = ?auto_267381 ?auto_267384 ) ) ( not ( = ?auto_267381 ?auto_267385 ) ) ( not ( = ?auto_267381 ?auto_267386 ) ) ( not ( = ?auto_267381 ?auto_267387 ) ) ( not ( = ?auto_267381 ?auto_267388 ) ) ( not ( = ?auto_267381 ?auto_267389 ) ) ( not ( = ?auto_267381 ?auto_267390 ) ) ( not ( = ?auto_267381 ?auto_267391 ) ) ( not ( = ?auto_267381 ?auto_267392 ) ) ( not ( = ?auto_267382 ?auto_267383 ) ) ( not ( = ?auto_267382 ?auto_267384 ) ) ( not ( = ?auto_267382 ?auto_267385 ) ) ( not ( = ?auto_267382 ?auto_267386 ) ) ( not ( = ?auto_267382 ?auto_267387 ) ) ( not ( = ?auto_267382 ?auto_267388 ) ) ( not ( = ?auto_267382 ?auto_267389 ) ) ( not ( = ?auto_267382 ?auto_267390 ) ) ( not ( = ?auto_267382 ?auto_267391 ) ) ( not ( = ?auto_267382 ?auto_267392 ) ) ( not ( = ?auto_267383 ?auto_267384 ) ) ( not ( = ?auto_267383 ?auto_267385 ) ) ( not ( = ?auto_267383 ?auto_267386 ) ) ( not ( = ?auto_267383 ?auto_267387 ) ) ( not ( = ?auto_267383 ?auto_267388 ) ) ( not ( = ?auto_267383 ?auto_267389 ) ) ( not ( = ?auto_267383 ?auto_267390 ) ) ( not ( = ?auto_267383 ?auto_267391 ) ) ( not ( = ?auto_267383 ?auto_267392 ) ) ( not ( = ?auto_267384 ?auto_267385 ) ) ( not ( = ?auto_267384 ?auto_267386 ) ) ( not ( = ?auto_267384 ?auto_267387 ) ) ( not ( = ?auto_267384 ?auto_267388 ) ) ( not ( = ?auto_267384 ?auto_267389 ) ) ( not ( = ?auto_267384 ?auto_267390 ) ) ( not ( = ?auto_267384 ?auto_267391 ) ) ( not ( = ?auto_267384 ?auto_267392 ) ) ( not ( = ?auto_267385 ?auto_267386 ) ) ( not ( = ?auto_267385 ?auto_267387 ) ) ( not ( = ?auto_267385 ?auto_267388 ) ) ( not ( = ?auto_267385 ?auto_267389 ) ) ( not ( = ?auto_267385 ?auto_267390 ) ) ( not ( = ?auto_267385 ?auto_267391 ) ) ( not ( = ?auto_267385 ?auto_267392 ) ) ( not ( = ?auto_267386 ?auto_267387 ) ) ( not ( = ?auto_267386 ?auto_267388 ) ) ( not ( = ?auto_267386 ?auto_267389 ) ) ( not ( = ?auto_267386 ?auto_267390 ) ) ( not ( = ?auto_267386 ?auto_267391 ) ) ( not ( = ?auto_267386 ?auto_267392 ) ) ( not ( = ?auto_267387 ?auto_267388 ) ) ( not ( = ?auto_267387 ?auto_267389 ) ) ( not ( = ?auto_267387 ?auto_267390 ) ) ( not ( = ?auto_267387 ?auto_267391 ) ) ( not ( = ?auto_267387 ?auto_267392 ) ) ( not ( = ?auto_267388 ?auto_267389 ) ) ( not ( = ?auto_267388 ?auto_267390 ) ) ( not ( = ?auto_267388 ?auto_267391 ) ) ( not ( = ?auto_267388 ?auto_267392 ) ) ( not ( = ?auto_267389 ?auto_267390 ) ) ( not ( = ?auto_267389 ?auto_267391 ) ) ( not ( = ?auto_267389 ?auto_267392 ) ) ( not ( = ?auto_267390 ?auto_267391 ) ) ( not ( = ?auto_267390 ?auto_267392 ) ) ( not ( = ?auto_267391 ?auto_267392 ) ) ( ON ?auto_267390 ?auto_267391 ) ( CLEAR ?auto_267388 ) ( ON ?auto_267389 ?auto_267390 ) ( CLEAR ?auto_267389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_267379 ?auto_267380 ?auto_267381 ?auto_267382 ?auto_267383 ?auto_267384 ?auto_267385 ?auto_267386 ?auto_267387 ?auto_267388 ?auto_267389 )
      ( MAKE-13PILE ?auto_267379 ?auto_267380 ?auto_267381 ?auto_267382 ?auto_267383 ?auto_267384 ?auto_267385 ?auto_267386 ?auto_267387 ?auto_267388 ?auto_267389 ?auto_267390 ?auto_267391 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267406 - BLOCK
      ?auto_267407 - BLOCK
      ?auto_267408 - BLOCK
      ?auto_267409 - BLOCK
      ?auto_267410 - BLOCK
      ?auto_267411 - BLOCK
      ?auto_267412 - BLOCK
      ?auto_267413 - BLOCK
      ?auto_267414 - BLOCK
      ?auto_267415 - BLOCK
      ?auto_267416 - BLOCK
      ?auto_267417 - BLOCK
      ?auto_267418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267418 ) ( ON-TABLE ?auto_267406 ) ( ON ?auto_267407 ?auto_267406 ) ( ON ?auto_267408 ?auto_267407 ) ( ON ?auto_267409 ?auto_267408 ) ( ON ?auto_267410 ?auto_267409 ) ( ON ?auto_267411 ?auto_267410 ) ( ON ?auto_267412 ?auto_267411 ) ( ON ?auto_267413 ?auto_267412 ) ( ON ?auto_267414 ?auto_267413 ) ( ON ?auto_267415 ?auto_267414 ) ( not ( = ?auto_267406 ?auto_267407 ) ) ( not ( = ?auto_267406 ?auto_267408 ) ) ( not ( = ?auto_267406 ?auto_267409 ) ) ( not ( = ?auto_267406 ?auto_267410 ) ) ( not ( = ?auto_267406 ?auto_267411 ) ) ( not ( = ?auto_267406 ?auto_267412 ) ) ( not ( = ?auto_267406 ?auto_267413 ) ) ( not ( = ?auto_267406 ?auto_267414 ) ) ( not ( = ?auto_267406 ?auto_267415 ) ) ( not ( = ?auto_267406 ?auto_267416 ) ) ( not ( = ?auto_267406 ?auto_267417 ) ) ( not ( = ?auto_267406 ?auto_267418 ) ) ( not ( = ?auto_267407 ?auto_267408 ) ) ( not ( = ?auto_267407 ?auto_267409 ) ) ( not ( = ?auto_267407 ?auto_267410 ) ) ( not ( = ?auto_267407 ?auto_267411 ) ) ( not ( = ?auto_267407 ?auto_267412 ) ) ( not ( = ?auto_267407 ?auto_267413 ) ) ( not ( = ?auto_267407 ?auto_267414 ) ) ( not ( = ?auto_267407 ?auto_267415 ) ) ( not ( = ?auto_267407 ?auto_267416 ) ) ( not ( = ?auto_267407 ?auto_267417 ) ) ( not ( = ?auto_267407 ?auto_267418 ) ) ( not ( = ?auto_267408 ?auto_267409 ) ) ( not ( = ?auto_267408 ?auto_267410 ) ) ( not ( = ?auto_267408 ?auto_267411 ) ) ( not ( = ?auto_267408 ?auto_267412 ) ) ( not ( = ?auto_267408 ?auto_267413 ) ) ( not ( = ?auto_267408 ?auto_267414 ) ) ( not ( = ?auto_267408 ?auto_267415 ) ) ( not ( = ?auto_267408 ?auto_267416 ) ) ( not ( = ?auto_267408 ?auto_267417 ) ) ( not ( = ?auto_267408 ?auto_267418 ) ) ( not ( = ?auto_267409 ?auto_267410 ) ) ( not ( = ?auto_267409 ?auto_267411 ) ) ( not ( = ?auto_267409 ?auto_267412 ) ) ( not ( = ?auto_267409 ?auto_267413 ) ) ( not ( = ?auto_267409 ?auto_267414 ) ) ( not ( = ?auto_267409 ?auto_267415 ) ) ( not ( = ?auto_267409 ?auto_267416 ) ) ( not ( = ?auto_267409 ?auto_267417 ) ) ( not ( = ?auto_267409 ?auto_267418 ) ) ( not ( = ?auto_267410 ?auto_267411 ) ) ( not ( = ?auto_267410 ?auto_267412 ) ) ( not ( = ?auto_267410 ?auto_267413 ) ) ( not ( = ?auto_267410 ?auto_267414 ) ) ( not ( = ?auto_267410 ?auto_267415 ) ) ( not ( = ?auto_267410 ?auto_267416 ) ) ( not ( = ?auto_267410 ?auto_267417 ) ) ( not ( = ?auto_267410 ?auto_267418 ) ) ( not ( = ?auto_267411 ?auto_267412 ) ) ( not ( = ?auto_267411 ?auto_267413 ) ) ( not ( = ?auto_267411 ?auto_267414 ) ) ( not ( = ?auto_267411 ?auto_267415 ) ) ( not ( = ?auto_267411 ?auto_267416 ) ) ( not ( = ?auto_267411 ?auto_267417 ) ) ( not ( = ?auto_267411 ?auto_267418 ) ) ( not ( = ?auto_267412 ?auto_267413 ) ) ( not ( = ?auto_267412 ?auto_267414 ) ) ( not ( = ?auto_267412 ?auto_267415 ) ) ( not ( = ?auto_267412 ?auto_267416 ) ) ( not ( = ?auto_267412 ?auto_267417 ) ) ( not ( = ?auto_267412 ?auto_267418 ) ) ( not ( = ?auto_267413 ?auto_267414 ) ) ( not ( = ?auto_267413 ?auto_267415 ) ) ( not ( = ?auto_267413 ?auto_267416 ) ) ( not ( = ?auto_267413 ?auto_267417 ) ) ( not ( = ?auto_267413 ?auto_267418 ) ) ( not ( = ?auto_267414 ?auto_267415 ) ) ( not ( = ?auto_267414 ?auto_267416 ) ) ( not ( = ?auto_267414 ?auto_267417 ) ) ( not ( = ?auto_267414 ?auto_267418 ) ) ( not ( = ?auto_267415 ?auto_267416 ) ) ( not ( = ?auto_267415 ?auto_267417 ) ) ( not ( = ?auto_267415 ?auto_267418 ) ) ( not ( = ?auto_267416 ?auto_267417 ) ) ( not ( = ?auto_267416 ?auto_267418 ) ) ( not ( = ?auto_267417 ?auto_267418 ) ) ( ON ?auto_267417 ?auto_267418 ) ( CLEAR ?auto_267415 ) ( ON ?auto_267416 ?auto_267417 ) ( CLEAR ?auto_267416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_267406 ?auto_267407 ?auto_267408 ?auto_267409 ?auto_267410 ?auto_267411 ?auto_267412 ?auto_267413 ?auto_267414 ?auto_267415 ?auto_267416 )
      ( MAKE-13PILE ?auto_267406 ?auto_267407 ?auto_267408 ?auto_267409 ?auto_267410 ?auto_267411 ?auto_267412 ?auto_267413 ?auto_267414 ?auto_267415 ?auto_267416 ?auto_267417 ?auto_267418 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267432 - BLOCK
      ?auto_267433 - BLOCK
      ?auto_267434 - BLOCK
      ?auto_267435 - BLOCK
      ?auto_267436 - BLOCK
      ?auto_267437 - BLOCK
      ?auto_267438 - BLOCK
      ?auto_267439 - BLOCK
      ?auto_267440 - BLOCK
      ?auto_267441 - BLOCK
      ?auto_267442 - BLOCK
      ?auto_267443 - BLOCK
      ?auto_267444 - BLOCK
    )
    :vars
    (
      ?auto_267445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267444 ?auto_267445 ) ( ON-TABLE ?auto_267432 ) ( ON ?auto_267433 ?auto_267432 ) ( ON ?auto_267434 ?auto_267433 ) ( ON ?auto_267435 ?auto_267434 ) ( ON ?auto_267436 ?auto_267435 ) ( ON ?auto_267437 ?auto_267436 ) ( ON ?auto_267438 ?auto_267437 ) ( ON ?auto_267439 ?auto_267438 ) ( ON ?auto_267440 ?auto_267439 ) ( not ( = ?auto_267432 ?auto_267433 ) ) ( not ( = ?auto_267432 ?auto_267434 ) ) ( not ( = ?auto_267432 ?auto_267435 ) ) ( not ( = ?auto_267432 ?auto_267436 ) ) ( not ( = ?auto_267432 ?auto_267437 ) ) ( not ( = ?auto_267432 ?auto_267438 ) ) ( not ( = ?auto_267432 ?auto_267439 ) ) ( not ( = ?auto_267432 ?auto_267440 ) ) ( not ( = ?auto_267432 ?auto_267441 ) ) ( not ( = ?auto_267432 ?auto_267442 ) ) ( not ( = ?auto_267432 ?auto_267443 ) ) ( not ( = ?auto_267432 ?auto_267444 ) ) ( not ( = ?auto_267432 ?auto_267445 ) ) ( not ( = ?auto_267433 ?auto_267434 ) ) ( not ( = ?auto_267433 ?auto_267435 ) ) ( not ( = ?auto_267433 ?auto_267436 ) ) ( not ( = ?auto_267433 ?auto_267437 ) ) ( not ( = ?auto_267433 ?auto_267438 ) ) ( not ( = ?auto_267433 ?auto_267439 ) ) ( not ( = ?auto_267433 ?auto_267440 ) ) ( not ( = ?auto_267433 ?auto_267441 ) ) ( not ( = ?auto_267433 ?auto_267442 ) ) ( not ( = ?auto_267433 ?auto_267443 ) ) ( not ( = ?auto_267433 ?auto_267444 ) ) ( not ( = ?auto_267433 ?auto_267445 ) ) ( not ( = ?auto_267434 ?auto_267435 ) ) ( not ( = ?auto_267434 ?auto_267436 ) ) ( not ( = ?auto_267434 ?auto_267437 ) ) ( not ( = ?auto_267434 ?auto_267438 ) ) ( not ( = ?auto_267434 ?auto_267439 ) ) ( not ( = ?auto_267434 ?auto_267440 ) ) ( not ( = ?auto_267434 ?auto_267441 ) ) ( not ( = ?auto_267434 ?auto_267442 ) ) ( not ( = ?auto_267434 ?auto_267443 ) ) ( not ( = ?auto_267434 ?auto_267444 ) ) ( not ( = ?auto_267434 ?auto_267445 ) ) ( not ( = ?auto_267435 ?auto_267436 ) ) ( not ( = ?auto_267435 ?auto_267437 ) ) ( not ( = ?auto_267435 ?auto_267438 ) ) ( not ( = ?auto_267435 ?auto_267439 ) ) ( not ( = ?auto_267435 ?auto_267440 ) ) ( not ( = ?auto_267435 ?auto_267441 ) ) ( not ( = ?auto_267435 ?auto_267442 ) ) ( not ( = ?auto_267435 ?auto_267443 ) ) ( not ( = ?auto_267435 ?auto_267444 ) ) ( not ( = ?auto_267435 ?auto_267445 ) ) ( not ( = ?auto_267436 ?auto_267437 ) ) ( not ( = ?auto_267436 ?auto_267438 ) ) ( not ( = ?auto_267436 ?auto_267439 ) ) ( not ( = ?auto_267436 ?auto_267440 ) ) ( not ( = ?auto_267436 ?auto_267441 ) ) ( not ( = ?auto_267436 ?auto_267442 ) ) ( not ( = ?auto_267436 ?auto_267443 ) ) ( not ( = ?auto_267436 ?auto_267444 ) ) ( not ( = ?auto_267436 ?auto_267445 ) ) ( not ( = ?auto_267437 ?auto_267438 ) ) ( not ( = ?auto_267437 ?auto_267439 ) ) ( not ( = ?auto_267437 ?auto_267440 ) ) ( not ( = ?auto_267437 ?auto_267441 ) ) ( not ( = ?auto_267437 ?auto_267442 ) ) ( not ( = ?auto_267437 ?auto_267443 ) ) ( not ( = ?auto_267437 ?auto_267444 ) ) ( not ( = ?auto_267437 ?auto_267445 ) ) ( not ( = ?auto_267438 ?auto_267439 ) ) ( not ( = ?auto_267438 ?auto_267440 ) ) ( not ( = ?auto_267438 ?auto_267441 ) ) ( not ( = ?auto_267438 ?auto_267442 ) ) ( not ( = ?auto_267438 ?auto_267443 ) ) ( not ( = ?auto_267438 ?auto_267444 ) ) ( not ( = ?auto_267438 ?auto_267445 ) ) ( not ( = ?auto_267439 ?auto_267440 ) ) ( not ( = ?auto_267439 ?auto_267441 ) ) ( not ( = ?auto_267439 ?auto_267442 ) ) ( not ( = ?auto_267439 ?auto_267443 ) ) ( not ( = ?auto_267439 ?auto_267444 ) ) ( not ( = ?auto_267439 ?auto_267445 ) ) ( not ( = ?auto_267440 ?auto_267441 ) ) ( not ( = ?auto_267440 ?auto_267442 ) ) ( not ( = ?auto_267440 ?auto_267443 ) ) ( not ( = ?auto_267440 ?auto_267444 ) ) ( not ( = ?auto_267440 ?auto_267445 ) ) ( not ( = ?auto_267441 ?auto_267442 ) ) ( not ( = ?auto_267441 ?auto_267443 ) ) ( not ( = ?auto_267441 ?auto_267444 ) ) ( not ( = ?auto_267441 ?auto_267445 ) ) ( not ( = ?auto_267442 ?auto_267443 ) ) ( not ( = ?auto_267442 ?auto_267444 ) ) ( not ( = ?auto_267442 ?auto_267445 ) ) ( not ( = ?auto_267443 ?auto_267444 ) ) ( not ( = ?auto_267443 ?auto_267445 ) ) ( not ( = ?auto_267444 ?auto_267445 ) ) ( ON ?auto_267443 ?auto_267444 ) ( ON ?auto_267442 ?auto_267443 ) ( CLEAR ?auto_267440 ) ( ON ?auto_267441 ?auto_267442 ) ( CLEAR ?auto_267441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_267432 ?auto_267433 ?auto_267434 ?auto_267435 ?auto_267436 ?auto_267437 ?auto_267438 ?auto_267439 ?auto_267440 ?auto_267441 )
      ( MAKE-13PILE ?auto_267432 ?auto_267433 ?auto_267434 ?auto_267435 ?auto_267436 ?auto_267437 ?auto_267438 ?auto_267439 ?auto_267440 ?auto_267441 ?auto_267442 ?auto_267443 ?auto_267444 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267459 - BLOCK
      ?auto_267460 - BLOCK
      ?auto_267461 - BLOCK
      ?auto_267462 - BLOCK
      ?auto_267463 - BLOCK
      ?auto_267464 - BLOCK
      ?auto_267465 - BLOCK
      ?auto_267466 - BLOCK
      ?auto_267467 - BLOCK
      ?auto_267468 - BLOCK
      ?auto_267469 - BLOCK
      ?auto_267470 - BLOCK
      ?auto_267471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267471 ) ( ON-TABLE ?auto_267459 ) ( ON ?auto_267460 ?auto_267459 ) ( ON ?auto_267461 ?auto_267460 ) ( ON ?auto_267462 ?auto_267461 ) ( ON ?auto_267463 ?auto_267462 ) ( ON ?auto_267464 ?auto_267463 ) ( ON ?auto_267465 ?auto_267464 ) ( ON ?auto_267466 ?auto_267465 ) ( ON ?auto_267467 ?auto_267466 ) ( not ( = ?auto_267459 ?auto_267460 ) ) ( not ( = ?auto_267459 ?auto_267461 ) ) ( not ( = ?auto_267459 ?auto_267462 ) ) ( not ( = ?auto_267459 ?auto_267463 ) ) ( not ( = ?auto_267459 ?auto_267464 ) ) ( not ( = ?auto_267459 ?auto_267465 ) ) ( not ( = ?auto_267459 ?auto_267466 ) ) ( not ( = ?auto_267459 ?auto_267467 ) ) ( not ( = ?auto_267459 ?auto_267468 ) ) ( not ( = ?auto_267459 ?auto_267469 ) ) ( not ( = ?auto_267459 ?auto_267470 ) ) ( not ( = ?auto_267459 ?auto_267471 ) ) ( not ( = ?auto_267460 ?auto_267461 ) ) ( not ( = ?auto_267460 ?auto_267462 ) ) ( not ( = ?auto_267460 ?auto_267463 ) ) ( not ( = ?auto_267460 ?auto_267464 ) ) ( not ( = ?auto_267460 ?auto_267465 ) ) ( not ( = ?auto_267460 ?auto_267466 ) ) ( not ( = ?auto_267460 ?auto_267467 ) ) ( not ( = ?auto_267460 ?auto_267468 ) ) ( not ( = ?auto_267460 ?auto_267469 ) ) ( not ( = ?auto_267460 ?auto_267470 ) ) ( not ( = ?auto_267460 ?auto_267471 ) ) ( not ( = ?auto_267461 ?auto_267462 ) ) ( not ( = ?auto_267461 ?auto_267463 ) ) ( not ( = ?auto_267461 ?auto_267464 ) ) ( not ( = ?auto_267461 ?auto_267465 ) ) ( not ( = ?auto_267461 ?auto_267466 ) ) ( not ( = ?auto_267461 ?auto_267467 ) ) ( not ( = ?auto_267461 ?auto_267468 ) ) ( not ( = ?auto_267461 ?auto_267469 ) ) ( not ( = ?auto_267461 ?auto_267470 ) ) ( not ( = ?auto_267461 ?auto_267471 ) ) ( not ( = ?auto_267462 ?auto_267463 ) ) ( not ( = ?auto_267462 ?auto_267464 ) ) ( not ( = ?auto_267462 ?auto_267465 ) ) ( not ( = ?auto_267462 ?auto_267466 ) ) ( not ( = ?auto_267462 ?auto_267467 ) ) ( not ( = ?auto_267462 ?auto_267468 ) ) ( not ( = ?auto_267462 ?auto_267469 ) ) ( not ( = ?auto_267462 ?auto_267470 ) ) ( not ( = ?auto_267462 ?auto_267471 ) ) ( not ( = ?auto_267463 ?auto_267464 ) ) ( not ( = ?auto_267463 ?auto_267465 ) ) ( not ( = ?auto_267463 ?auto_267466 ) ) ( not ( = ?auto_267463 ?auto_267467 ) ) ( not ( = ?auto_267463 ?auto_267468 ) ) ( not ( = ?auto_267463 ?auto_267469 ) ) ( not ( = ?auto_267463 ?auto_267470 ) ) ( not ( = ?auto_267463 ?auto_267471 ) ) ( not ( = ?auto_267464 ?auto_267465 ) ) ( not ( = ?auto_267464 ?auto_267466 ) ) ( not ( = ?auto_267464 ?auto_267467 ) ) ( not ( = ?auto_267464 ?auto_267468 ) ) ( not ( = ?auto_267464 ?auto_267469 ) ) ( not ( = ?auto_267464 ?auto_267470 ) ) ( not ( = ?auto_267464 ?auto_267471 ) ) ( not ( = ?auto_267465 ?auto_267466 ) ) ( not ( = ?auto_267465 ?auto_267467 ) ) ( not ( = ?auto_267465 ?auto_267468 ) ) ( not ( = ?auto_267465 ?auto_267469 ) ) ( not ( = ?auto_267465 ?auto_267470 ) ) ( not ( = ?auto_267465 ?auto_267471 ) ) ( not ( = ?auto_267466 ?auto_267467 ) ) ( not ( = ?auto_267466 ?auto_267468 ) ) ( not ( = ?auto_267466 ?auto_267469 ) ) ( not ( = ?auto_267466 ?auto_267470 ) ) ( not ( = ?auto_267466 ?auto_267471 ) ) ( not ( = ?auto_267467 ?auto_267468 ) ) ( not ( = ?auto_267467 ?auto_267469 ) ) ( not ( = ?auto_267467 ?auto_267470 ) ) ( not ( = ?auto_267467 ?auto_267471 ) ) ( not ( = ?auto_267468 ?auto_267469 ) ) ( not ( = ?auto_267468 ?auto_267470 ) ) ( not ( = ?auto_267468 ?auto_267471 ) ) ( not ( = ?auto_267469 ?auto_267470 ) ) ( not ( = ?auto_267469 ?auto_267471 ) ) ( not ( = ?auto_267470 ?auto_267471 ) ) ( ON ?auto_267470 ?auto_267471 ) ( ON ?auto_267469 ?auto_267470 ) ( CLEAR ?auto_267467 ) ( ON ?auto_267468 ?auto_267469 ) ( CLEAR ?auto_267468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_267459 ?auto_267460 ?auto_267461 ?auto_267462 ?auto_267463 ?auto_267464 ?auto_267465 ?auto_267466 ?auto_267467 ?auto_267468 )
      ( MAKE-13PILE ?auto_267459 ?auto_267460 ?auto_267461 ?auto_267462 ?auto_267463 ?auto_267464 ?auto_267465 ?auto_267466 ?auto_267467 ?auto_267468 ?auto_267469 ?auto_267470 ?auto_267471 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267485 - BLOCK
      ?auto_267486 - BLOCK
      ?auto_267487 - BLOCK
      ?auto_267488 - BLOCK
      ?auto_267489 - BLOCK
      ?auto_267490 - BLOCK
      ?auto_267491 - BLOCK
      ?auto_267492 - BLOCK
      ?auto_267493 - BLOCK
      ?auto_267494 - BLOCK
      ?auto_267495 - BLOCK
      ?auto_267496 - BLOCK
      ?auto_267497 - BLOCK
    )
    :vars
    (
      ?auto_267498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267497 ?auto_267498 ) ( ON-TABLE ?auto_267485 ) ( ON ?auto_267486 ?auto_267485 ) ( ON ?auto_267487 ?auto_267486 ) ( ON ?auto_267488 ?auto_267487 ) ( ON ?auto_267489 ?auto_267488 ) ( ON ?auto_267490 ?auto_267489 ) ( ON ?auto_267491 ?auto_267490 ) ( ON ?auto_267492 ?auto_267491 ) ( not ( = ?auto_267485 ?auto_267486 ) ) ( not ( = ?auto_267485 ?auto_267487 ) ) ( not ( = ?auto_267485 ?auto_267488 ) ) ( not ( = ?auto_267485 ?auto_267489 ) ) ( not ( = ?auto_267485 ?auto_267490 ) ) ( not ( = ?auto_267485 ?auto_267491 ) ) ( not ( = ?auto_267485 ?auto_267492 ) ) ( not ( = ?auto_267485 ?auto_267493 ) ) ( not ( = ?auto_267485 ?auto_267494 ) ) ( not ( = ?auto_267485 ?auto_267495 ) ) ( not ( = ?auto_267485 ?auto_267496 ) ) ( not ( = ?auto_267485 ?auto_267497 ) ) ( not ( = ?auto_267485 ?auto_267498 ) ) ( not ( = ?auto_267486 ?auto_267487 ) ) ( not ( = ?auto_267486 ?auto_267488 ) ) ( not ( = ?auto_267486 ?auto_267489 ) ) ( not ( = ?auto_267486 ?auto_267490 ) ) ( not ( = ?auto_267486 ?auto_267491 ) ) ( not ( = ?auto_267486 ?auto_267492 ) ) ( not ( = ?auto_267486 ?auto_267493 ) ) ( not ( = ?auto_267486 ?auto_267494 ) ) ( not ( = ?auto_267486 ?auto_267495 ) ) ( not ( = ?auto_267486 ?auto_267496 ) ) ( not ( = ?auto_267486 ?auto_267497 ) ) ( not ( = ?auto_267486 ?auto_267498 ) ) ( not ( = ?auto_267487 ?auto_267488 ) ) ( not ( = ?auto_267487 ?auto_267489 ) ) ( not ( = ?auto_267487 ?auto_267490 ) ) ( not ( = ?auto_267487 ?auto_267491 ) ) ( not ( = ?auto_267487 ?auto_267492 ) ) ( not ( = ?auto_267487 ?auto_267493 ) ) ( not ( = ?auto_267487 ?auto_267494 ) ) ( not ( = ?auto_267487 ?auto_267495 ) ) ( not ( = ?auto_267487 ?auto_267496 ) ) ( not ( = ?auto_267487 ?auto_267497 ) ) ( not ( = ?auto_267487 ?auto_267498 ) ) ( not ( = ?auto_267488 ?auto_267489 ) ) ( not ( = ?auto_267488 ?auto_267490 ) ) ( not ( = ?auto_267488 ?auto_267491 ) ) ( not ( = ?auto_267488 ?auto_267492 ) ) ( not ( = ?auto_267488 ?auto_267493 ) ) ( not ( = ?auto_267488 ?auto_267494 ) ) ( not ( = ?auto_267488 ?auto_267495 ) ) ( not ( = ?auto_267488 ?auto_267496 ) ) ( not ( = ?auto_267488 ?auto_267497 ) ) ( not ( = ?auto_267488 ?auto_267498 ) ) ( not ( = ?auto_267489 ?auto_267490 ) ) ( not ( = ?auto_267489 ?auto_267491 ) ) ( not ( = ?auto_267489 ?auto_267492 ) ) ( not ( = ?auto_267489 ?auto_267493 ) ) ( not ( = ?auto_267489 ?auto_267494 ) ) ( not ( = ?auto_267489 ?auto_267495 ) ) ( not ( = ?auto_267489 ?auto_267496 ) ) ( not ( = ?auto_267489 ?auto_267497 ) ) ( not ( = ?auto_267489 ?auto_267498 ) ) ( not ( = ?auto_267490 ?auto_267491 ) ) ( not ( = ?auto_267490 ?auto_267492 ) ) ( not ( = ?auto_267490 ?auto_267493 ) ) ( not ( = ?auto_267490 ?auto_267494 ) ) ( not ( = ?auto_267490 ?auto_267495 ) ) ( not ( = ?auto_267490 ?auto_267496 ) ) ( not ( = ?auto_267490 ?auto_267497 ) ) ( not ( = ?auto_267490 ?auto_267498 ) ) ( not ( = ?auto_267491 ?auto_267492 ) ) ( not ( = ?auto_267491 ?auto_267493 ) ) ( not ( = ?auto_267491 ?auto_267494 ) ) ( not ( = ?auto_267491 ?auto_267495 ) ) ( not ( = ?auto_267491 ?auto_267496 ) ) ( not ( = ?auto_267491 ?auto_267497 ) ) ( not ( = ?auto_267491 ?auto_267498 ) ) ( not ( = ?auto_267492 ?auto_267493 ) ) ( not ( = ?auto_267492 ?auto_267494 ) ) ( not ( = ?auto_267492 ?auto_267495 ) ) ( not ( = ?auto_267492 ?auto_267496 ) ) ( not ( = ?auto_267492 ?auto_267497 ) ) ( not ( = ?auto_267492 ?auto_267498 ) ) ( not ( = ?auto_267493 ?auto_267494 ) ) ( not ( = ?auto_267493 ?auto_267495 ) ) ( not ( = ?auto_267493 ?auto_267496 ) ) ( not ( = ?auto_267493 ?auto_267497 ) ) ( not ( = ?auto_267493 ?auto_267498 ) ) ( not ( = ?auto_267494 ?auto_267495 ) ) ( not ( = ?auto_267494 ?auto_267496 ) ) ( not ( = ?auto_267494 ?auto_267497 ) ) ( not ( = ?auto_267494 ?auto_267498 ) ) ( not ( = ?auto_267495 ?auto_267496 ) ) ( not ( = ?auto_267495 ?auto_267497 ) ) ( not ( = ?auto_267495 ?auto_267498 ) ) ( not ( = ?auto_267496 ?auto_267497 ) ) ( not ( = ?auto_267496 ?auto_267498 ) ) ( not ( = ?auto_267497 ?auto_267498 ) ) ( ON ?auto_267496 ?auto_267497 ) ( ON ?auto_267495 ?auto_267496 ) ( ON ?auto_267494 ?auto_267495 ) ( CLEAR ?auto_267492 ) ( ON ?auto_267493 ?auto_267494 ) ( CLEAR ?auto_267493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_267485 ?auto_267486 ?auto_267487 ?auto_267488 ?auto_267489 ?auto_267490 ?auto_267491 ?auto_267492 ?auto_267493 )
      ( MAKE-13PILE ?auto_267485 ?auto_267486 ?auto_267487 ?auto_267488 ?auto_267489 ?auto_267490 ?auto_267491 ?auto_267492 ?auto_267493 ?auto_267494 ?auto_267495 ?auto_267496 ?auto_267497 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267512 - BLOCK
      ?auto_267513 - BLOCK
      ?auto_267514 - BLOCK
      ?auto_267515 - BLOCK
      ?auto_267516 - BLOCK
      ?auto_267517 - BLOCK
      ?auto_267518 - BLOCK
      ?auto_267519 - BLOCK
      ?auto_267520 - BLOCK
      ?auto_267521 - BLOCK
      ?auto_267522 - BLOCK
      ?auto_267523 - BLOCK
      ?auto_267524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267524 ) ( ON-TABLE ?auto_267512 ) ( ON ?auto_267513 ?auto_267512 ) ( ON ?auto_267514 ?auto_267513 ) ( ON ?auto_267515 ?auto_267514 ) ( ON ?auto_267516 ?auto_267515 ) ( ON ?auto_267517 ?auto_267516 ) ( ON ?auto_267518 ?auto_267517 ) ( ON ?auto_267519 ?auto_267518 ) ( not ( = ?auto_267512 ?auto_267513 ) ) ( not ( = ?auto_267512 ?auto_267514 ) ) ( not ( = ?auto_267512 ?auto_267515 ) ) ( not ( = ?auto_267512 ?auto_267516 ) ) ( not ( = ?auto_267512 ?auto_267517 ) ) ( not ( = ?auto_267512 ?auto_267518 ) ) ( not ( = ?auto_267512 ?auto_267519 ) ) ( not ( = ?auto_267512 ?auto_267520 ) ) ( not ( = ?auto_267512 ?auto_267521 ) ) ( not ( = ?auto_267512 ?auto_267522 ) ) ( not ( = ?auto_267512 ?auto_267523 ) ) ( not ( = ?auto_267512 ?auto_267524 ) ) ( not ( = ?auto_267513 ?auto_267514 ) ) ( not ( = ?auto_267513 ?auto_267515 ) ) ( not ( = ?auto_267513 ?auto_267516 ) ) ( not ( = ?auto_267513 ?auto_267517 ) ) ( not ( = ?auto_267513 ?auto_267518 ) ) ( not ( = ?auto_267513 ?auto_267519 ) ) ( not ( = ?auto_267513 ?auto_267520 ) ) ( not ( = ?auto_267513 ?auto_267521 ) ) ( not ( = ?auto_267513 ?auto_267522 ) ) ( not ( = ?auto_267513 ?auto_267523 ) ) ( not ( = ?auto_267513 ?auto_267524 ) ) ( not ( = ?auto_267514 ?auto_267515 ) ) ( not ( = ?auto_267514 ?auto_267516 ) ) ( not ( = ?auto_267514 ?auto_267517 ) ) ( not ( = ?auto_267514 ?auto_267518 ) ) ( not ( = ?auto_267514 ?auto_267519 ) ) ( not ( = ?auto_267514 ?auto_267520 ) ) ( not ( = ?auto_267514 ?auto_267521 ) ) ( not ( = ?auto_267514 ?auto_267522 ) ) ( not ( = ?auto_267514 ?auto_267523 ) ) ( not ( = ?auto_267514 ?auto_267524 ) ) ( not ( = ?auto_267515 ?auto_267516 ) ) ( not ( = ?auto_267515 ?auto_267517 ) ) ( not ( = ?auto_267515 ?auto_267518 ) ) ( not ( = ?auto_267515 ?auto_267519 ) ) ( not ( = ?auto_267515 ?auto_267520 ) ) ( not ( = ?auto_267515 ?auto_267521 ) ) ( not ( = ?auto_267515 ?auto_267522 ) ) ( not ( = ?auto_267515 ?auto_267523 ) ) ( not ( = ?auto_267515 ?auto_267524 ) ) ( not ( = ?auto_267516 ?auto_267517 ) ) ( not ( = ?auto_267516 ?auto_267518 ) ) ( not ( = ?auto_267516 ?auto_267519 ) ) ( not ( = ?auto_267516 ?auto_267520 ) ) ( not ( = ?auto_267516 ?auto_267521 ) ) ( not ( = ?auto_267516 ?auto_267522 ) ) ( not ( = ?auto_267516 ?auto_267523 ) ) ( not ( = ?auto_267516 ?auto_267524 ) ) ( not ( = ?auto_267517 ?auto_267518 ) ) ( not ( = ?auto_267517 ?auto_267519 ) ) ( not ( = ?auto_267517 ?auto_267520 ) ) ( not ( = ?auto_267517 ?auto_267521 ) ) ( not ( = ?auto_267517 ?auto_267522 ) ) ( not ( = ?auto_267517 ?auto_267523 ) ) ( not ( = ?auto_267517 ?auto_267524 ) ) ( not ( = ?auto_267518 ?auto_267519 ) ) ( not ( = ?auto_267518 ?auto_267520 ) ) ( not ( = ?auto_267518 ?auto_267521 ) ) ( not ( = ?auto_267518 ?auto_267522 ) ) ( not ( = ?auto_267518 ?auto_267523 ) ) ( not ( = ?auto_267518 ?auto_267524 ) ) ( not ( = ?auto_267519 ?auto_267520 ) ) ( not ( = ?auto_267519 ?auto_267521 ) ) ( not ( = ?auto_267519 ?auto_267522 ) ) ( not ( = ?auto_267519 ?auto_267523 ) ) ( not ( = ?auto_267519 ?auto_267524 ) ) ( not ( = ?auto_267520 ?auto_267521 ) ) ( not ( = ?auto_267520 ?auto_267522 ) ) ( not ( = ?auto_267520 ?auto_267523 ) ) ( not ( = ?auto_267520 ?auto_267524 ) ) ( not ( = ?auto_267521 ?auto_267522 ) ) ( not ( = ?auto_267521 ?auto_267523 ) ) ( not ( = ?auto_267521 ?auto_267524 ) ) ( not ( = ?auto_267522 ?auto_267523 ) ) ( not ( = ?auto_267522 ?auto_267524 ) ) ( not ( = ?auto_267523 ?auto_267524 ) ) ( ON ?auto_267523 ?auto_267524 ) ( ON ?auto_267522 ?auto_267523 ) ( ON ?auto_267521 ?auto_267522 ) ( CLEAR ?auto_267519 ) ( ON ?auto_267520 ?auto_267521 ) ( CLEAR ?auto_267520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_267512 ?auto_267513 ?auto_267514 ?auto_267515 ?auto_267516 ?auto_267517 ?auto_267518 ?auto_267519 ?auto_267520 )
      ( MAKE-13PILE ?auto_267512 ?auto_267513 ?auto_267514 ?auto_267515 ?auto_267516 ?auto_267517 ?auto_267518 ?auto_267519 ?auto_267520 ?auto_267521 ?auto_267522 ?auto_267523 ?auto_267524 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267538 - BLOCK
      ?auto_267539 - BLOCK
      ?auto_267540 - BLOCK
      ?auto_267541 - BLOCK
      ?auto_267542 - BLOCK
      ?auto_267543 - BLOCK
      ?auto_267544 - BLOCK
      ?auto_267545 - BLOCK
      ?auto_267546 - BLOCK
      ?auto_267547 - BLOCK
      ?auto_267548 - BLOCK
      ?auto_267549 - BLOCK
      ?auto_267550 - BLOCK
    )
    :vars
    (
      ?auto_267551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267550 ?auto_267551 ) ( ON-TABLE ?auto_267538 ) ( ON ?auto_267539 ?auto_267538 ) ( ON ?auto_267540 ?auto_267539 ) ( ON ?auto_267541 ?auto_267540 ) ( ON ?auto_267542 ?auto_267541 ) ( ON ?auto_267543 ?auto_267542 ) ( ON ?auto_267544 ?auto_267543 ) ( not ( = ?auto_267538 ?auto_267539 ) ) ( not ( = ?auto_267538 ?auto_267540 ) ) ( not ( = ?auto_267538 ?auto_267541 ) ) ( not ( = ?auto_267538 ?auto_267542 ) ) ( not ( = ?auto_267538 ?auto_267543 ) ) ( not ( = ?auto_267538 ?auto_267544 ) ) ( not ( = ?auto_267538 ?auto_267545 ) ) ( not ( = ?auto_267538 ?auto_267546 ) ) ( not ( = ?auto_267538 ?auto_267547 ) ) ( not ( = ?auto_267538 ?auto_267548 ) ) ( not ( = ?auto_267538 ?auto_267549 ) ) ( not ( = ?auto_267538 ?auto_267550 ) ) ( not ( = ?auto_267538 ?auto_267551 ) ) ( not ( = ?auto_267539 ?auto_267540 ) ) ( not ( = ?auto_267539 ?auto_267541 ) ) ( not ( = ?auto_267539 ?auto_267542 ) ) ( not ( = ?auto_267539 ?auto_267543 ) ) ( not ( = ?auto_267539 ?auto_267544 ) ) ( not ( = ?auto_267539 ?auto_267545 ) ) ( not ( = ?auto_267539 ?auto_267546 ) ) ( not ( = ?auto_267539 ?auto_267547 ) ) ( not ( = ?auto_267539 ?auto_267548 ) ) ( not ( = ?auto_267539 ?auto_267549 ) ) ( not ( = ?auto_267539 ?auto_267550 ) ) ( not ( = ?auto_267539 ?auto_267551 ) ) ( not ( = ?auto_267540 ?auto_267541 ) ) ( not ( = ?auto_267540 ?auto_267542 ) ) ( not ( = ?auto_267540 ?auto_267543 ) ) ( not ( = ?auto_267540 ?auto_267544 ) ) ( not ( = ?auto_267540 ?auto_267545 ) ) ( not ( = ?auto_267540 ?auto_267546 ) ) ( not ( = ?auto_267540 ?auto_267547 ) ) ( not ( = ?auto_267540 ?auto_267548 ) ) ( not ( = ?auto_267540 ?auto_267549 ) ) ( not ( = ?auto_267540 ?auto_267550 ) ) ( not ( = ?auto_267540 ?auto_267551 ) ) ( not ( = ?auto_267541 ?auto_267542 ) ) ( not ( = ?auto_267541 ?auto_267543 ) ) ( not ( = ?auto_267541 ?auto_267544 ) ) ( not ( = ?auto_267541 ?auto_267545 ) ) ( not ( = ?auto_267541 ?auto_267546 ) ) ( not ( = ?auto_267541 ?auto_267547 ) ) ( not ( = ?auto_267541 ?auto_267548 ) ) ( not ( = ?auto_267541 ?auto_267549 ) ) ( not ( = ?auto_267541 ?auto_267550 ) ) ( not ( = ?auto_267541 ?auto_267551 ) ) ( not ( = ?auto_267542 ?auto_267543 ) ) ( not ( = ?auto_267542 ?auto_267544 ) ) ( not ( = ?auto_267542 ?auto_267545 ) ) ( not ( = ?auto_267542 ?auto_267546 ) ) ( not ( = ?auto_267542 ?auto_267547 ) ) ( not ( = ?auto_267542 ?auto_267548 ) ) ( not ( = ?auto_267542 ?auto_267549 ) ) ( not ( = ?auto_267542 ?auto_267550 ) ) ( not ( = ?auto_267542 ?auto_267551 ) ) ( not ( = ?auto_267543 ?auto_267544 ) ) ( not ( = ?auto_267543 ?auto_267545 ) ) ( not ( = ?auto_267543 ?auto_267546 ) ) ( not ( = ?auto_267543 ?auto_267547 ) ) ( not ( = ?auto_267543 ?auto_267548 ) ) ( not ( = ?auto_267543 ?auto_267549 ) ) ( not ( = ?auto_267543 ?auto_267550 ) ) ( not ( = ?auto_267543 ?auto_267551 ) ) ( not ( = ?auto_267544 ?auto_267545 ) ) ( not ( = ?auto_267544 ?auto_267546 ) ) ( not ( = ?auto_267544 ?auto_267547 ) ) ( not ( = ?auto_267544 ?auto_267548 ) ) ( not ( = ?auto_267544 ?auto_267549 ) ) ( not ( = ?auto_267544 ?auto_267550 ) ) ( not ( = ?auto_267544 ?auto_267551 ) ) ( not ( = ?auto_267545 ?auto_267546 ) ) ( not ( = ?auto_267545 ?auto_267547 ) ) ( not ( = ?auto_267545 ?auto_267548 ) ) ( not ( = ?auto_267545 ?auto_267549 ) ) ( not ( = ?auto_267545 ?auto_267550 ) ) ( not ( = ?auto_267545 ?auto_267551 ) ) ( not ( = ?auto_267546 ?auto_267547 ) ) ( not ( = ?auto_267546 ?auto_267548 ) ) ( not ( = ?auto_267546 ?auto_267549 ) ) ( not ( = ?auto_267546 ?auto_267550 ) ) ( not ( = ?auto_267546 ?auto_267551 ) ) ( not ( = ?auto_267547 ?auto_267548 ) ) ( not ( = ?auto_267547 ?auto_267549 ) ) ( not ( = ?auto_267547 ?auto_267550 ) ) ( not ( = ?auto_267547 ?auto_267551 ) ) ( not ( = ?auto_267548 ?auto_267549 ) ) ( not ( = ?auto_267548 ?auto_267550 ) ) ( not ( = ?auto_267548 ?auto_267551 ) ) ( not ( = ?auto_267549 ?auto_267550 ) ) ( not ( = ?auto_267549 ?auto_267551 ) ) ( not ( = ?auto_267550 ?auto_267551 ) ) ( ON ?auto_267549 ?auto_267550 ) ( ON ?auto_267548 ?auto_267549 ) ( ON ?auto_267547 ?auto_267548 ) ( ON ?auto_267546 ?auto_267547 ) ( CLEAR ?auto_267544 ) ( ON ?auto_267545 ?auto_267546 ) ( CLEAR ?auto_267545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_267538 ?auto_267539 ?auto_267540 ?auto_267541 ?auto_267542 ?auto_267543 ?auto_267544 ?auto_267545 )
      ( MAKE-13PILE ?auto_267538 ?auto_267539 ?auto_267540 ?auto_267541 ?auto_267542 ?auto_267543 ?auto_267544 ?auto_267545 ?auto_267546 ?auto_267547 ?auto_267548 ?auto_267549 ?auto_267550 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267565 - BLOCK
      ?auto_267566 - BLOCK
      ?auto_267567 - BLOCK
      ?auto_267568 - BLOCK
      ?auto_267569 - BLOCK
      ?auto_267570 - BLOCK
      ?auto_267571 - BLOCK
      ?auto_267572 - BLOCK
      ?auto_267573 - BLOCK
      ?auto_267574 - BLOCK
      ?auto_267575 - BLOCK
      ?auto_267576 - BLOCK
      ?auto_267577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267577 ) ( ON-TABLE ?auto_267565 ) ( ON ?auto_267566 ?auto_267565 ) ( ON ?auto_267567 ?auto_267566 ) ( ON ?auto_267568 ?auto_267567 ) ( ON ?auto_267569 ?auto_267568 ) ( ON ?auto_267570 ?auto_267569 ) ( ON ?auto_267571 ?auto_267570 ) ( not ( = ?auto_267565 ?auto_267566 ) ) ( not ( = ?auto_267565 ?auto_267567 ) ) ( not ( = ?auto_267565 ?auto_267568 ) ) ( not ( = ?auto_267565 ?auto_267569 ) ) ( not ( = ?auto_267565 ?auto_267570 ) ) ( not ( = ?auto_267565 ?auto_267571 ) ) ( not ( = ?auto_267565 ?auto_267572 ) ) ( not ( = ?auto_267565 ?auto_267573 ) ) ( not ( = ?auto_267565 ?auto_267574 ) ) ( not ( = ?auto_267565 ?auto_267575 ) ) ( not ( = ?auto_267565 ?auto_267576 ) ) ( not ( = ?auto_267565 ?auto_267577 ) ) ( not ( = ?auto_267566 ?auto_267567 ) ) ( not ( = ?auto_267566 ?auto_267568 ) ) ( not ( = ?auto_267566 ?auto_267569 ) ) ( not ( = ?auto_267566 ?auto_267570 ) ) ( not ( = ?auto_267566 ?auto_267571 ) ) ( not ( = ?auto_267566 ?auto_267572 ) ) ( not ( = ?auto_267566 ?auto_267573 ) ) ( not ( = ?auto_267566 ?auto_267574 ) ) ( not ( = ?auto_267566 ?auto_267575 ) ) ( not ( = ?auto_267566 ?auto_267576 ) ) ( not ( = ?auto_267566 ?auto_267577 ) ) ( not ( = ?auto_267567 ?auto_267568 ) ) ( not ( = ?auto_267567 ?auto_267569 ) ) ( not ( = ?auto_267567 ?auto_267570 ) ) ( not ( = ?auto_267567 ?auto_267571 ) ) ( not ( = ?auto_267567 ?auto_267572 ) ) ( not ( = ?auto_267567 ?auto_267573 ) ) ( not ( = ?auto_267567 ?auto_267574 ) ) ( not ( = ?auto_267567 ?auto_267575 ) ) ( not ( = ?auto_267567 ?auto_267576 ) ) ( not ( = ?auto_267567 ?auto_267577 ) ) ( not ( = ?auto_267568 ?auto_267569 ) ) ( not ( = ?auto_267568 ?auto_267570 ) ) ( not ( = ?auto_267568 ?auto_267571 ) ) ( not ( = ?auto_267568 ?auto_267572 ) ) ( not ( = ?auto_267568 ?auto_267573 ) ) ( not ( = ?auto_267568 ?auto_267574 ) ) ( not ( = ?auto_267568 ?auto_267575 ) ) ( not ( = ?auto_267568 ?auto_267576 ) ) ( not ( = ?auto_267568 ?auto_267577 ) ) ( not ( = ?auto_267569 ?auto_267570 ) ) ( not ( = ?auto_267569 ?auto_267571 ) ) ( not ( = ?auto_267569 ?auto_267572 ) ) ( not ( = ?auto_267569 ?auto_267573 ) ) ( not ( = ?auto_267569 ?auto_267574 ) ) ( not ( = ?auto_267569 ?auto_267575 ) ) ( not ( = ?auto_267569 ?auto_267576 ) ) ( not ( = ?auto_267569 ?auto_267577 ) ) ( not ( = ?auto_267570 ?auto_267571 ) ) ( not ( = ?auto_267570 ?auto_267572 ) ) ( not ( = ?auto_267570 ?auto_267573 ) ) ( not ( = ?auto_267570 ?auto_267574 ) ) ( not ( = ?auto_267570 ?auto_267575 ) ) ( not ( = ?auto_267570 ?auto_267576 ) ) ( not ( = ?auto_267570 ?auto_267577 ) ) ( not ( = ?auto_267571 ?auto_267572 ) ) ( not ( = ?auto_267571 ?auto_267573 ) ) ( not ( = ?auto_267571 ?auto_267574 ) ) ( not ( = ?auto_267571 ?auto_267575 ) ) ( not ( = ?auto_267571 ?auto_267576 ) ) ( not ( = ?auto_267571 ?auto_267577 ) ) ( not ( = ?auto_267572 ?auto_267573 ) ) ( not ( = ?auto_267572 ?auto_267574 ) ) ( not ( = ?auto_267572 ?auto_267575 ) ) ( not ( = ?auto_267572 ?auto_267576 ) ) ( not ( = ?auto_267572 ?auto_267577 ) ) ( not ( = ?auto_267573 ?auto_267574 ) ) ( not ( = ?auto_267573 ?auto_267575 ) ) ( not ( = ?auto_267573 ?auto_267576 ) ) ( not ( = ?auto_267573 ?auto_267577 ) ) ( not ( = ?auto_267574 ?auto_267575 ) ) ( not ( = ?auto_267574 ?auto_267576 ) ) ( not ( = ?auto_267574 ?auto_267577 ) ) ( not ( = ?auto_267575 ?auto_267576 ) ) ( not ( = ?auto_267575 ?auto_267577 ) ) ( not ( = ?auto_267576 ?auto_267577 ) ) ( ON ?auto_267576 ?auto_267577 ) ( ON ?auto_267575 ?auto_267576 ) ( ON ?auto_267574 ?auto_267575 ) ( ON ?auto_267573 ?auto_267574 ) ( CLEAR ?auto_267571 ) ( ON ?auto_267572 ?auto_267573 ) ( CLEAR ?auto_267572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_267565 ?auto_267566 ?auto_267567 ?auto_267568 ?auto_267569 ?auto_267570 ?auto_267571 ?auto_267572 )
      ( MAKE-13PILE ?auto_267565 ?auto_267566 ?auto_267567 ?auto_267568 ?auto_267569 ?auto_267570 ?auto_267571 ?auto_267572 ?auto_267573 ?auto_267574 ?auto_267575 ?auto_267576 ?auto_267577 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267591 - BLOCK
      ?auto_267592 - BLOCK
      ?auto_267593 - BLOCK
      ?auto_267594 - BLOCK
      ?auto_267595 - BLOCK
      ?auto_267596 - BLOCK
      ?auto_267597 - BLOCK
      ?auto_267598 - BLOCK
      ?auto_267599 - BLOCK
      ?auto_267600 - BLOCK
      ?auto_267601 - BLOCK
      ?auto_267602 - BLOCK
      ?auto_267603 - BLOCK
    )
    :vars
    (
      ?auto_267604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267603 ?auto_267604 ) ( ON-TABLE ?auto_267591 ) ( ON ?auto_267592 ?auto_267591 ) ( ON ?auto_267593 ?auto_267592 ) ( ON ?auto_267594 ?auto_267593 ) ( ON ?auto_267595 ?auto_267594 ) ( ON ?auto_267596 ?auto_267595 ) ( not ( = ?auto_267591 ?auto_267592 ) ) ( not ( = ?auto_267591 ?auto_267593 ) ) ( not ( = ?auto_267591 ?auto_267594 ) ) ( not ( = ?auto_267591 ?auto_267595 ) ) ( not ( = ?auto_267591 ?auto_267596 ) ) ( not ( = ?auto_267591 ?auto_267597 ) ) ( not ( = ?auto_267591 ?auto_267598 ) ) ( not ( = ?auto_267591 ?auto_267599 ) ) ( not ( = ?auto_267591 ?auto_267600 ) ) ( not ( = ?auto_267591 ?auto_267601 ) ) ( not ( = ?auto_267591 ?auto_267602 ) ) ( not ( = ?auto_267591 ?auto_267603 ) ) ( not ( = ?auto_267591 ?auto_267604 ) ) ( not ( = ?auto_267592 ?auto_267593 ) ) ( not ( = ?auto_267592 ?auto_267594 ) ) ( not ( = ?auto_267592 ?auto_267595 ) ) ( not ( = ?auto_267592 ?auto_267596 ) ) ( not ( = ?auto_267592 ?auto_267597 ) ) ( not ( = ?auto_267592 ?auto_267598 ) ) ( not ( = ?auto_267592 ?auto_267599 ) ) ( not ( = ?auto_267592 ?auto_267600 ) ) ( not ( = ?auto_267592 ?auto_267601 ) ) ( not ( = ?auto_267592 ?auto_267602 ) ) ( not ( = ?auto_267592 ?auto_267603 ) ) ( not ( = ?auto_267592 ?auto_267604 ) ) ( not ( = ?auto_267593 ?auto_267594 ) ) ( not ( = ?auto_267593 ?auto_267595 ) ) ( not ( = ?auto_267593 ?auto_267596 ) ) ( not ( = ?auto_267593 ?auto_267597 ) ) ( not ( = ?auto_267593 ?auto_267598 ) ) ( not ( = ?auto_267593 ?auto_267599 ) ) ( not ( = ?auto_267593 ?auto_267600 ) ) ( not ( = ?auto_267593 ?auto_267601 ) ) ( not ( = ?auto_267593 ?auto_267602 ) ) ( not ( = ?auto_267593 ?auto_267603 ) ) ( not ( = ?auto_267593 ?auto_267604 ) ) ( not ( = ?auto_267594 ?auto_267595 ) ) ( not ( = ?auto_267594 ?auto_267596 ) ) ( not ( = ?auto_267594 ?auto_267597 ) ) ( not ( = ?auto_267594 ?auto_267598 ) ) ( not ( = ?auto_267594 ?auto_267599 ) ) ( not ( = ?auto_267594 ?auto_267600 ) ) ( not ( = ?auto_267594 ?auto_267601 ) ) ( not ( = ?auto_267594 ?auto_267602 ) ) ( not ( = ?auto_267594 ?auto_267603 ) ) ( not ( = ?auto_267594 ?auto_267604 ) ) ( not ( = ?auto_267595 ?auto_267596 ) ) ( not ( = ?auto_267595 ?auto_267597 ) ) ( not ( = ?auto_267595 ?auto_267598 ) ) ( not ( = ?auto_267595 ?auto_267599 ) ) ( not ( = ?auto_267595 ?auto_267600 ) ) ( not ( = ?auto_267595 ?auto_267601 ) ) ( not ( = ?auto_267595 ?auto_267602 ) ) ( not ( = ?auto_267595 ?auto_267603 ) ) ( not ( = ?auto_267595 ?auto_267604 ) ) ( not ( = ?auto_267596 ?auto_267597 ) ) ( not ( = ?auto_267596 ?auto_267598 ) ) ( not ( = ?auto_267596 ?auto_267599 ) ) ( not ( = ?auto_267596 ?auto_267600 ) ) ( not ( = ?auto_267596 ?auto_267601 ) ) ( not ( = ?auto_267596 ?auto_267602 ) ) ( not ( = ?auto_267596 ?auto_267603 ) ) ( not ( = ?auto_267596 ?auto_267604 ) ) ( not ( = ?auto_267597 ?auto_267598 ) ) ( not ( = ?auto_267597 ?auto_267599 ) ) ( not ( = ?auto_267597 ?auto_267600 ) ) ( not ( = ?auto_267597 ?auto_267601 ) ) ( not ( = ?auto_267597 ?auto_267602 ) ) ( not ( = ?auto_267597 ?auto_267603 ) ) ( not ( = ?auto_267597 ?auto_267604 ) ) ( not ( = ?auto_267598 ?auto_267599 ) ) ( not ( = ?auto_267598 ?auto_267600 ) ) ( not ( = ?auto_267598 ?auto_267601 ) ) ( not ( = ?auto_267598 ?auto_267602 ) ) ( not ( = ?auto_267598 ?auto_267603 ) ) ( not ( = ?auto_267598 ?auto_267604 ) ) ( not ( = ?auto_267599 ?auto_267600 ) ) ( not ( = ?auto_267599 ?auto_267601 ) ) ( not ( = ?auto_267599 ?auto_267602 ) ) ( not ( = ?auto_267599 ?auto_267603 ) ) ( not ( = ?auto_267599 ?auto_267604 ) ) ( not ( = ?auto_267600 ?auto_267601 ) ) ( not ( = ?auto_267600 ?auto_267602 ) ) ( not ( = ?auto_267600 ?auto_267603 ) ) ( not ( = ?auto_267600 ?auto_267604 ) ) ( not ( = ?auto_267601 ?auto_267602 ) ) ( not ( = ?auto_267601 ?auto_267603 ) ) ( not ( = ?auto_267601 ?auto_267604 ) ) ( not ( = ?auto_267602 ?auto_267603 ) ) ( not ( = ?auto_267602 ?auto_267604 ) ) ( not ( = ?auto_267603 ?auto_267604 ) ) ( ON ?auto_267602 ?auto_267603 ) ( ON ?auto_267601 ?auto_267602 ) ( ON ?auto_267600 ?auto_267601 ) ( ON ?auto_267599 ?auto_267600 ) ( ON ?auto_267598 ?auto_267599 ) ( CLEAR ?auto_267596 ) ( ON ?auto_267597 ?auto_267598 ) ( CLEAR ?auto_267597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_267591 ?auto_267592 ?auto_267593 ?auto_267594 ?auto_267595 ?auto_267596 ?auto_267597 )
      ( MAKE-13PILE ?auto_267591 ?auto_267592 ?auto_267593 ?auto_267594 ?auto_267595 ?auto_267596 ?auto_267597 ?auto_267598 ?auto_267599 ?auto_267600 ?auto_267601 ?auto_267602 ?auto_267603 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267618 - BLOCK
      ?auto_267619 - BLOCK
      ?auto_267620 - BLOCK
      ?auto_267621 - BLOCK
      ?auto_267622 - BLOCK
      ?auto_267623 - BLOCK
      ?auto_267624 - BLOCK
      ?auto_267625 - BLOCK
      ?auto_267626 - BLOCK
      ?auto_267627 - BLOCK
      ?auto_267628 - BLOCK
      ?auto_267629 - BLOCK
      ?auto_267630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267630 ) ( ON-TABLE ?auto_267618 ) ( ON ?auto_267619 ?auto_267618 ) ( ON ?auto_267620 ?auto_267619 ) ( ON ?auto_267621 ?auto_267620 ) ( ON ?auto_267622 ?auto_267621 ) ( ON ?auto_267623 ?auto_267622 ) ( not ( = ?auto_267618 ?auto_267619 ) ) ( not ( = ?auto_267618 ?auto_267620 ) ) ( not ( = ?auto_267618 ?auto_267621 ) ) ( not ( = ?auto_267618 ?auto_267622 ) ) ( not ( = ?auto_267618 ?auto_267623 ) ) ( not ( = ?auto_267618 ?auto_267624 ) ) ( not ( = ?auto_267618 ?auto_267625 ) ) ( not ( = ?auto_267618 ?auto_267626 ) ) ( not ( = ?auto_267618 ?auto_267627 ) ) ( not ( = ?auto_267618 ?auto_267628 ) ) ( not ( = ?auto_267618 ?auto_267629 ) ) ( not ( = ?auto_267618 ?auto_267630 ) ) ( not ( = ?auto_267619 ?auto_267620 ) ) ( not ( = ?auto_267619 ?auto_267621 ) ) ( not ( = ?auto_267619 ?auto_267622 ) ) ( not ( = ?auto_267619 ?auto_267623 ) ) ( not ( = ?auto_267619 ?auto_267624 ) ) ( not ( = ?auto_267619 ?auto_267625 ) ) ( not ( = ?auto_267619 ?auto_267626 ) ) ( not ( = ?auto_267619 ?auto_267627 ) ) ( not ( = ?auto_267619 ?auto_267628 ) ) ( not ( = ?auto_267619 ?auto_267629 ) ) ( not ( = ?auto_267619 ?auto_267630 ) ) ( not ( = ?auto_267620 ?auto_267621 ) ) ( not ( = ?auto_267620 ?auto_267622 ) ) ( not ( = ?auto_267620 ?auto_267623 ) ) ( not ( = ?auto_267620 ?auto_267624 ) ) ( not ( = ?auto_267620 ?auto_267625 ) ) ( not ( = ?auto_267620 ?auto_267626 ) ) ( not ( = ?auto_267620 ?auto_267627 ) ) ( not ( = ?auto_267620 ?auto_267628 ) ) ( not ( = ?auto_267620 ?auto_267629 ) ) ( not ( = ?auto_267620 ?auto_267630 ) ) ( not ( = ?auto_267621 ?auto_267622 ) ) ( not ( = ?auto_267621 ?auto_267623 ) ) ( not ( = ?auto_267621 ?auto_267624 ) ) ( not ( = ?auto_267621 ?auto_267625 ) ) ( not ( = ?auto_267621 ?auto_267626 ) ) ( not ( = ?auto_267621 ?auto_267627 ) ) ( not ( = ?auto_267621 ?auto_267628 ) ) ( not ( = ?auto_267621 ?auto_267629 ) ) ( not ( = ?auto_267621 ?auto_267630 ) ) ( not ( = ?auto_267622 ?auto_267623 ) ) ( not ( = ?auto_267622 ?auto_267624 ) ) ( not ( = ?auto_267622 ?auto_267625 ) ) ( not ( = ?auto_267622 ?auto_267626 ) ) ( not ( = ?auto_267622 ?auto_267627 ) ) ( not ( = ?auto_267622 ?auto_267628 ) ) ( not ( = ?auto_267622 ?auto_267629 ) ) ( not ( = ?auto_267622 ?auto_267630 ) ) ( not ( = ?auto_267623 ?auto_267624 ) ) ( not ( = ?auto_267623 ?auto_267625 ) ) ( not ( = ?auto_267623 ?auto_267626 ) ) ( not ( = ?auto_267623 ?auto_267627 ) ) ( not ( = ?auto_267623 ?auto_267628 ) ) ( not ( = ?auto_267623 ?auto_267629 ) ) ( not ( = ?auto_267623 ?auto_267630 ) ) ( not ( = ?auto_267624 ?auto_267625 ) ) ( not ( = ?auto_267624 ?auto_267626 ) ) ( not ( = ?auto_267624 ?auto_267627 ) ) ( not ( = ?auto_267624 ?auto_267628 ) ) ( not ( = ?auto_267624 ?auto_267629 ) ) ( not ( = ?auto_267624 ?auto_267630 ) ) ( not ( = ?auto_267625 ?auto_267626 ) ) ( not ( = ?auto_267625 ?auto_267627 ) ) ( not ( = ?auto_267625 ?auto_267628 ) ) ( not ( = ?auto_267625 ?auto_267629 ) ) ( not ( = ?auto_267625 ?auto_267630 ) ) ( not ( = ?auto_267626 ?auto_267627 ) ) ( not ( = ?auto_267626 ?auto_267628 ) ) ( not ( = ?auto_267626 ?auto_267629 ) ) ( not ( = ?auto_267626 ?auto_267630 ) ) ( not ( = ?auto_267627 ?auto_267628 ) ) ( not ( = ?auto_267627 ?auto_267629 ) ) ( not ( = ?auto_267627 ?auto_267630 ) ) ( not ( = ?auto_267628 ?auto_267629 ) ) ( not ( = ?auto_267628 ?auto_267630 ) ) ( not ( = ?auto_267629 ?auto_267630 ) ) ( ON ?auto_267629 ?auto_267630 ) ( ON ?auto_267628 ?auto_267629 ) ( ON ?auto_267627 ?auto_267628 ) ( ON ?auto_267626 ?auto_267627 ) ( ON ?auto_267625 ?auto_267626 ) ( CLEAR ?auto_267623 ) ( ON ?auto_267624 ?auto_267625 ) ( CLEAR ?auto_267624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_267618 ?auto_267619 ?auto_267620 ?auto_267621 ?auto_267622 ?auto_267623 ?auto_267624 )
      ( MAKE-13PILE ?auto_267618 ?auto_267619 ?auto_267620 ?auto_267621 ?auto_267622 ?auto_267623 ?auto_267624 ?auto_267625 ?auto_267626 ?auto_267627 ?auto_267628 ?auto_267629 ?auto_267630 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267644 - BLOCK
      ?auto_267645 - BLOCK
      ?auto_267646 - BLOCK
      ?auto_267647 - BLOCK
      ?auto_267648 - BLOCK
      ?auto_267649 - BLOCK
      ?auto_267650 - BLOCK
      ?auto_267651 - BLOCK
      ?auto_267652 - BLOCK
      ?auto_267653 - BLOCK
      ?auto_267654 - BLOCK
      ?auto_267655 - BLOCK
      ?auto_267656 - BLOCK
    )
    :vars
    (
      ?auto_267657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267656 ?auto_267657 ) ( ON-TABLE ?auto_267644 ) ( ON ?auto_267645 ?auto_267644 ) ( ON ?auto_267646 ?auto_267645 ) ( ON ?auto_267647 ?auto_267646 ) ( ON ?auto_267648 ?auto_267647 ) ( not ( = ?auto_267644 ?auto_267645 ) ) ( not ( = ?auto_267644 ?auto_267646 ) ) ( not ( = ?auto_267644 ?auto_267647 ) ) ( not ( = ?auto_267644 ?auto_267648 ) ) ( not ( = ?auto_267644 ?auto_267649 ) ) ( not ( = ?auto_267644 ?auto_267650 ) ) ( not ( = ?auto_267644 ?auto_267651 ) ) ( not ( = ?auto_267644 ?auto_267652 ) ) ( not ( = ?auto_267644 ?auto_267653 ) ) ( not ( = ?auto_267644 ?auto_267654 ) ) ( not ( = ?auto_267644 ?auto_267655 ) ) ( not ( = ?auto_267644 ?auto_267656 ) ) ( not ( = ?auto_267644 ?auto_267657 ) ) ( not ( = ?auto_267645 ?auto_267646 ) ) ( not ( = ?auto_267645 ?auto_267647 ) ) ( not ( = ?auto_267645 ?auto_267648 ) ) ( not ( = ?auto_267645 ?auto_267649 ) ) ( not ( = ?auto_267645 ?auto_267650 ) ) ( not ( = ?auto_267645 ?auto_267651 ) ) ( not ( = ?auto_267645 ?auto_267652 ) ) ( not ( = ?auto_267645 ?auto_267653 ) ) ( not ( = ?auto_267645 ?auto_267654 ) ) ( not ( = ?auto_267645 ?auto_267655 ) ) ( not ( = ?auto_267645 ?auto_267656 ) ) ( not ( = ?auto_267645 ?auto_267657 ) ) ( not ( = ?auto_267646 ?auto_267647 ) ) ( not ( = ?auto_267646 ?auto_267648 ) ) ( not ( = ?auto_267646 ?auto_267649 ) ) ( not ( = ?auto_267646 ?auto_267650 ) ) ( not ( = ?auto_267646 ?auto_267651 ) ) ( not ( = ?auto_267646 ?auto_267652 ) ) ( not ( = ?auto_267646 ?auto_267653 ) ) ( not ( = ?auto_267646 ?auto_267654 ) ) ( not ( = ?auto_267646 ?auto_267655 ) ) ( not ( = ?auto_267646 ?auto_267656 ) ) ( not ( = ?auto_267646 ?auto_267657 ) ) ( not ( = ?auto_267647 ?auto_267648 ) ) ( not ( = ?auto_267647 ?auto_267649 ) ) ( not ( = ?auto_267647 ?auto_267650 ) ) ( not ( = ?auto_267647 ?auto_267651 ) ) ( not ( = ?auto_267647 ?auto_267652 ) ) ( not ( = ?auto_267647 ?auto_267653 ) ) ( not ( = ?auto_267647 ?auto_267654 ) ) ( not ( = ?auto_267647 ?auto_267655 ) ) ( not ( = ?auto_267647 ?auto_267656 ) ) ( not ( = ?auto_267647 ?auto_267657 ) ) ( not ( = ?auto_267648 ?auto_267649 ) ) ( not ( = ?auto_267648 ?auto_267650 ) ) ( not ( = ?auto_267648 ?auto_267651 ) ) ( not ( = ?auto_267648 ?auto_267652 ) ) ( not ( = ?auto_267648 ?auto_267653 ) ) ( not ( = ?auto_267648 ?auto_267654 ) ) ( not ( = ?auto_267648 ?auto_267655 ) ) ( not ( = ?auto_267648 ?auto_267656 ) ) ( not ( = ?auto_267648 ?auto_267657 ) ) ( not ( = ?auto_267649 ?auto_267650 ) ) ( not ( = ?auto_267649 ?auto_267651 ) ) ( not ( = ?auto_267649 ?auto_267652 ) ) ( not ( = ?auto_267649 ?auto_267653 ) ) ( not ( = ?auto_267649 ?auto_267654 ) ) ( not ( = ?auto_267649 ?auto_267655 ) ) ( not ( = ?auto_267649 ?auto_267656 ) ) ( not ( = ?auto_267649 ?auto_267657 ) ) ( not ( = ?auto_267650 ?auto_267651 ) ) ( not ( = ?auto_267650 ?auto_267652 ) ) ( not ( = ?auto_267650 ?auto_267653 ) ) ( not ( = ?auto_267650 ?auto_267654 ) ) ( not ( = ?auto_267650 ?auto_267655 ) ) ( not ( = ?auto_267650 ?auto_267656 ) ) ( not ( = ?auto_267650 ?auto_267657 ) ) ( not ( = ?auto_267651 ?auto_267652 ) ) ( not ( = ?auto_267651 ?auto_267653 ) ) ( not ( = ?auto_267651 ?auto_267654 ) ) ( not ( = ?auto_267651 ?auto_267655 ) ) ( not ( = ?auto_267651 ?auto_267656 ) ) ( not ( = ?auto_267651 ?auto_267657 ) ) ( not ( = ?auto_267652 ?auto_267653 ) ) ( not ( = ?auto_267652 ?auto_267654 ) ) ( not ( = ?auto_267652 ?auto_267655 ) ) ( not ( = ?auto_267652 ?auto_267656 ) ) ( not ( = ?auto_267652 ?auto_267657 ) ) ( not ( = ?auto_267653 ?auto_267654 ) ) ( not ( = ?auto_267653 ?auto_267655 ) ) ( not ( = ?auto_267653 ?auto_267656 ) ) ( not ( = ?auto_267653 ?auto_267657 ) ) ( not ( = ?auto_267654 ?auto_267655 ) ) ( not ( = ?auto_267654 ?auto_267656 ) ) ( not ( = ?auto_267654 ?auto_267657 ) ) ( not ( = ?auto_267655 ?auto_267656 ) ) ( not ( = ?auto_267655 ?auto_267657 ) ) ( not ( = ?auto_267656 ?auto_267657 ) ) ( ON ?auto_267655 ?auto_267656 ) ( ON ?auto_267654 ?auto_267655 ) ( ON ?auto_267653 ?auto_267654 ) ( ON ?auto_267652 ?auto_267653 ) ( ON ?auto_267651 ?auto_267652 ) ( ON ?auto_267650 ?auto_267651 ) ( CLEAR ?auto_267648 ) ( ON ?auto_267649 ?auto_267650 ) ( CLEAR ?auto_267649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_267644 ?auto_267645 ?auto_267646 ?auto_267647 ?auto_267648 ?auto_267649 )
      ( MAKE-13PILE ?auto_267644 ?auto_267645 ?auto_267646 ?auto_267647 ?auto_267648 ?auto_267649 ?auto_267650 ?auto_267651 ?auto_267652 ?auto_267653 ?auto_267654 ?auto_267655 ?auto_267656 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267671 - BLOCK
      ?auto_267672 - BLOCK
      ?auto_267673 - BLOCK
      ?auto_267674 - BLOCK
      ?auto_267675 - BLOCK
      ?auto_267676 - BLOCK
      ?auto_267677 - BLOCK
      ?auto_267678 - BLOCK
      ?auto_267679 - BLOCK
      ?auto_267680 - BLOCK
      ?auto_267681 - BLOCK
      ?auto_267682 - BLOCK
      ?auto_267683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267683 ) ( ON-TABLE ?auto_267671 ) ( ON ?auto_267672 ?auto_267671 ) ( ON ?auto_267673 ?auto_267672 ) ( ON ?auto_267674 ?auto_267673 ) ( ON ?auto_267675 ?auto_267674 ) ( not ( = ?auto_267671 ?auto_267672 ) ) ( not ( = ?auto_267671 ?auto_267673 ) ) ( not ( = ?auto_267671 ?auto_267674 ) ) ( not ( = ?auto_267671 ?auto_267675 ) ) ( not ( = ?auto_267671 ?auto_267676 ) ) ( not ( = ?auto_267671 ?auto_267677 ) ) ( not ( = ?auto_267671 ?auto_267678 ) ) ( not ( = ?auto_267671 ?auto_267679 ) ) ( not ( = ?auto_267671 ?auto_267680 ) ) ( not ( = ?auto_267671 ?auto_267681 ) ) ( not ( = ?auto_267671 ?auto_267682 ) ) ( not ( = ?auto_267671 ?auto_267683 ) ) ( not ( = ?auto_267672 ?auto_267673 ) ) ( not ( = ?auto_267672 ?auto_267674 ) ) ( not ( = ?auto_267672 ?auto_267675 ) ) ( not ( = ?auto_267672 ?auto_267676 ) ) ( not ( = ?auto_267672 ?auto_267677 ) ) ( not ( = ?auto_267672 ?auto_267678 ) ) ( not ( = ?auto_267672 ?auto_267679 ) ) ( not ( = ?auto_267672 ?auto_267680 ) ) ( not ( = ?auto_267672 ?auto_267681 ) ) ( not ( = ?auto_267672 ?auto_267682 ) ) ( not ( = ?auto_267672 ?auto_267683 ) ) ( not ( = ?auto_267673 ?auto_267674 ) ) ( not ( = ?auto_267673 ?auto_267675 ) ) ( not ( = ?auto_267673 ?auto_267676 ) ) ( not ( = ?auto_267673 ?auto_267677 ) ) ( not ( = ?auto_267673 ?auto_267678 ) ) ( not ( = ?auto_267673 ?auto_267679 ) ) ( not ( = ?auto_267673 ?auto_267680 ) ) ( not ( = ?auto_267673 ?auto_267681 ) ) ( not ( = ?auto_267673 ?auto_267682 ) ) ( not ( = ?auto_267673 ?auto_267683 ) ) ( not ( = ?auto_267674 ?auto_267675 ) ) ( not ( = ?auto_267674 ?auto_267676 ) ) ( not ( = ?auto_267674 ?auto_267677 ) ) ( not ( = ?auto_267674 ?auto_267678 ) ) ( not ( = ?auto_267674 ?auto_267679 ) ) ( not ( = ?auto_267674 ?auto_267680 ) ) ( not ( = ?auto_267674 ?auto_267681 ) ) ( not ( = ?auto_267674 ?auto_267682 ) ) ( not ( = ?auto_267674 ?auto_267683 ) ) ( not ( = ?auto_267675 ?auto_267676 ) ) ( not ( = ?auto_267675 ?auto_267677 ) ) ( not ( = ?auto_267675 ?auto_267678 ) ) ( not ( = ?auto_267675 ?auto_267679 ) ) ( not ( = ?auto_267675 ?auto_267680 ) ) ( not ( = ?auto_267675 ?auto_267681 ) ) ( not ( = ?auto_267675 ?auto_267682 ) ) ( not ( = ?auto_267675 ?auto_267683 ) ) ( not ( = ?auto_267676 ?auto_267677 ) ) ( not ( = ?auto_267676 ?auto_267678 ) ) ( not ( = ?auto_267676 ?auto_267679 ) ) ( not ( = ?auto_267676 ?auto_267680 ) ) ( not ( = ?auto_267676 ?auto_267681 ) ) ( not ( = ?auto_267676 ?auto_267682 ) ) ( not ( = ?auto_267676 ?auto_267683 ) ) ( not ( = ?auto_267677 ?auto_267678 ) ) ( not ( = ?auto_267677 ?auto_267679 ) ) ( not ( = ?auto_267677 ?auto_267680 ) ) ( not ( = ?auto_267677 ?auto_267681 ) ) ( not ( = ?auto_267677 ?auto_267682 ) ) ( not ( = ?auto_267677 ?auto_267683 ) ) ( not ( = ?auto_267678 ?auto_267679 ) ) ( not ( = ?auto_267678 ?auto_267680 ) ) ( not ( = ?auto_267678 ?auto_267681 ) ) ( not ( = ?auto_267678 ?auto_267682 ) ) ( not ( = ?auto_267678 ?auto_267683 ) ) ( not ( = ?auto_267679 ?auto_267680 ) ) ( not ( = ?auto_267679 ?auto_267681 ) ) ( not ( = ?auto_267679 ?auto_267682 ) ) ( not ( = ?auto_267679 ?auto_267683 ) ) ( not ( = ?auto_267680 ?auto_267681 ) ) ( not ( = ?auto_267680 ?auto_267682 ) ) ( not ( = ?auto_267680 ?auto_267683 ) ) ( not ( = ?auto_267681 ?auto_267682 ) ) ( not ( = ?auto_267681 ?auto_267683 ) ) ( not ( = ?auto_267682 ?auto_267683 ) ) ( ON ?auto_267682 ?auto_267683 ) ( ON ?auto_267681 ?auto_267682 ) ( ON ?auto_267680 ?auto_267681 ) ( ON ?auto_267679 ?auto_267680 ) ( ON ?auto_267678 ?auto_267679 ) ( ON ?auto_267677 ?auto_267678 ) ( CLEAR ?auto_267675 ) ( ON ?auto_267676 ?auto_267677 ) ( CLEAR ?auto_267676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_267671 ?auto_267672 ?auto_267673 ?auto_267674 ?auto_267675 ?auto_267676 )
      ( MAKE-13PILE ?auto_267671 ?auto_267672 ?auto_267673 ?auto_267674 ?auto_267675 ?auto_267676 ?auto_267677 ?auto_267678 ?auto_267679 ?auto_267680 ?auto_267681 ?auto_267682 ?auto_267683 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267697 - BLOCK
      ?auto_267698 - BLOCK
      ?auto_267699 - BLOCK
      ?auto_267700 - BLOCK
      ?auto_267701 - BLOCK
      ?auto_267702 - BLOCK
      ?auto_267703 - BLOCK
      ?auto_267704 - BLOCK
      ?auto_267705 - BLOCK
      ?auto_267706 - BLOCK
      ?auto_267707 - BLOCK
      ?auto_267708 - BLOCK
      ?auto_267709 - BLOCK
    )
    :vars
    (
      ?auto_267710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267709 ?auto_267710 ) ( ON-TABLE ?auto_267697 ) ( ON ?auto_267698 ?auto_267697 ) ( ON ?auto_267699 ?auto_267698 ) ( ON ?auto_267700 ?auto_267699 ) ( not ( = ?auto_267697 ?auto_267698 ) ) ( not ( = ?auto_267697 ?auto_267699 ) ) ( not ( = ?auto_267697 ?auto_267700 ) ) ( not ( = ?auto_267697 ?auto_267701 ) ) ( not ( = ?auto_267697 ?auto_267702 ) ) ( not ( = ?auto_267697 ?auto_267703 ) ) ( not ( = ?auto_267697 ?auto_267704 ) ) ( not ( = ?auto_267697 ?auto_267705 ) ) ( not ( = ?auto_267697 ?auto_267706 ) ) ( not ( = ?auto_267697 ?auto_267707 ) ) ( not ( = ?auto_267697 ?auto_267708 ) ) ( not ( = ?auto_267697 ?auto_267709 ) ) ( not ( = ?auto_267697 ?auto_267710 ) ) ( not ( = ?auto_267698 ?auto_267699 ) ) ( not ( = ?auto_267698 ?auto_267700 ) ) ( not ( = ?auto_267698 ?auto_267701 ) ) ( not ( = ?auto_267698 ?auto_267702 ) ) ( not ( = ?auto_267698 ?auto_267703 ) ) ( not ( = ?auto_267698 ?auto_267704 ) ) ( not ( = ?auto_267698 ?auto_267705 ) ) ( not ( = ?auto_267698 ?auto_267706 ) ) ( not ( = ?auto_267698 ?auto_267707 ) ) ( not ( = ?auto_267698 ?auto_267708 ) ) ( not ( = ?auto_267698 ?auto_267709 ) ) ( not ( = ?auto_267698 ?auto_267710 ) ) ( not ( = ?auto_267699 ?auto_267700 ) ) ( not ( = ?auto_267699 ?auto_267701 ) ) ( not ( = ?auto_267699 ?auto_267702 ) ) ( not ( = ?auto_267699 ?auto_267703 ) ) ( not ( = ?auto_267699 ?auto_267704 ) ) ( not ( = ?auto_267699 ?auto_267705 ) ) ( not ( = ?auto_267699 ?auto_267706 ) ) ( not ( = ?auto_267699 ?auto_267707 ) ) ( not ( = ?auto_267699 ?auto_267708 ) ) ( not ( = ?auto_267699 ?auto_267709 ) ) ( not ( = ?auto_267699 ?auto_267710 ) ) ( not ( = ?auto_267700 ?auto_267701 ) ) ( not ( = ?auto_267700 ?auto_267702 ) ) ( not ( = ?auto_267700 ?auto_267703 ) ) ( not ( = ?auto_267700 ?auto_267704 ) ) ( not ( = ?auto_267700 ?auto_267705 ) ) ( not ( = ?auto_267700 ?auto_267706 ) ) ( not ( = ?auto_267700 ?auto_267707 ) ) ( not ( = ?auto_267700 ?auto_267708 ) ) ( not ( = ?auto_267700 ?auto_267709 ) ) ( not ( = ?auto_267700 ?auto_267710 ) ) ( not ( = ?auto_267701 ?auto_267702 ) ) ( not ( = ?auto_267701 ?auto_267703 ) ) ( not ( = ?auto_267701 ?auto_267704 ) ) ( not ( = ?auto_267701 ?auto_267705 ) ) ( not ( = ?auto_267701 ?auto_267706 ) ) ( not ( = ?auto_267701 ?auto_267707 ) ) ( not ( = ?auto_267701 ?auto_267708 ) ) ( not ( = ?auto_267701 ?auto_267709 ) ) ( not ( = ?auto_267701 ?auto_267710 ) ) ( not ( = ?auto_267702 ?auto_267703 ) ) ( not ( = ?auto_267702 ?auto_267704 ) ) ( not ( = ?auto_267702 ?auto_267705 ) ) ( not ( = ?auto_267702 ?auto_267706 ) ) ( not ( = ?auto_267702 ?auto_267707 ) ) ( not ( = ?auto_267702 ?auto_267708 ) ) ( not ( = ?auto_267702 ?auto_267709 ) ) ( not ( = ?auto_267702 ?auto_267710 ) ) ( not ( = ?auto_267703 ?auto_267704 ) ) ( not ( = ?auto_267703 ?auto_267705 ) ) ( not ( = ?auto_267703 ?auto_267706 ) ) ( not ( = ?auto_267703 ?auto_267707 ) ) ( not ( = ?auto_267703 ?auto_267708 ) ) ( not ( = ?auto_267703 ?auto_267709 ) ) ( not ( = ?auto_267703 ?auto_267710 ) ) ( not ( = ?auto_267704 ?auto_267705 ) ) ( not ( = ?auto_267704 ?auto_267706 ) ) ( not ( = ?auto_267704 ?auto_267707 ) ) ( not ( = ?auto_267704 ?auto_267708 ) ) ( not ( = ?auto_267704 ?auto_267709 ) ) ( not ( = ?auto_267704 ?auto_267710 ) ) ( not ( = ?auto_267705 ?auto_267706 ) ) ( not ( = ?auto_267705 ?auto_267707 ) ) ( not ( = ?auto_267705 ?auto_267708 ) ) ( not ( = ?auto_267705 ?auto_267709 ) ) ( not ( = ?auto_267705 ?auto_267710 ) ) ( not ( = ?auto_267706 ?auto_267707 ) ) ( not ( = ?auto_267706 ?auto_267708 ) ) ( not ( = ?auto_267706 ?auto_267709 ) ) ( not ( = ?auto_267706 ?auto_267710 ) ) ( not ( = ?auto_267707 ?auto_267708 ) ) ( not ( = ?auto_267707 ?auto_267709 ) ) ( not ( = ?auto_267707 ?auto_267710 ) ) ( not ( = ?auto_267708 ?auto_267709 ) ) ( not ( = ?auto_267708 ?auto_267710 ) ) ( not ( = ?auto_267709 ?auto_267710 ) ) ( ON ?auto_267708 ?auto_267709 ) ( ON ?auto_267707 ?auto_267708 ) ( ON ?auto_267706 ?auto_267707 ) ( ON ?auto_267705 ?auto_267706 ) ( ON ?auto_267704 ?auto_267705 ) ( ON ?auto_267703 ?auto_267704 ) ( ON ?auto_267702 ?auto_267703 ) ( CLEAR ?auto_267700 ) ( ON ?auto_267701 ?auto_267702 ) ( CLEAR ?auto_267701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_267697 ?auto_267698 ?auto_267699 ?auto_267700 ?auto_267701 )
      ( MAKE-13PILE ?auto_267697 ?auto_267698 ?auto_267699 ?auto_267700 ?auto_267701 ?auto_267702 ?auto_267703 ?auto_267704 ?auto_267705 ?auto_267706 ?auto_267707 ?auto_267708 ?auto_267709 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267724 - BLOCK
      ?auto_267725 - BLOCK
      ?auto_267726 - BLOCK
      ?auto_267727 - BLOCK
      ?auto_267728 - BLOCK
      ?auto_267729 - BLOCK
      ?auto_267730 - BLOCK
      ?auto_267731 - BLOCK
      ?auto_267732 - BLOCK
      ?auto_267733 - BLOCK
      ?auto_267734 - BLOCK
      ?auto_267735 - BLOCK
      ?auto_267736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267736 ) ( ON-TABLE ?auto_267724 ) ( ON ?auto_267725 ?auto_267724 ) ( ON ?auto_267726 ?auto_267725 ) ( ON ?auto_267727 ?auto_267726 ) ( not ( = ?auto_267724 ?auto_267725 ) ) ( not ( = ?auto_267724 ?auto_267726 ) ) ( not ( = ?auto_267724 ?auto_267727 ) ) ( not ( = ?auto_267724 ?auto_267728 ) ) ( not ( = ?auto_267724 ?auto_267729 ) ) ( not ( = ?auto_267724 ?auto_267730 ) ) ( not ( = ?auto_267724 ?auto_267731 ) ) ( not ( = ?auto_267724 ?auto_267732 ) ) ( not ( = ?auto_267724 ?auto_267733 ) ) ( not ( = ?auto_267724 ?auto_267734 ) ) ( not ( = ?auto_267724 ?auto_267735 ) ) ( not ( = ?auto_267724 ?auto_267736 ) ) ( not ( = ?auto_267725 ?auto_267726 ) ) ( not ( = ?auto_267725 ?auto_267727 ) ) ( not ( = ?auto_267725 ?auto_267728 ) ) ( not ( = ?auto_267725 ?auto_267729 ) ) ( not ( = ?auto_267725 ?auto_267730 ) ) ( not ( = ?auto_267725 ?auto_267731 ) ) ( not ( = ?auto_267725 ?auto_267732 ) ) ( not ( = ?auto_267725 ?auto_267733 ) ) ( not ( = ?auto_267725 ?auto_267734 ) ) ( not ( = ?auto_267725 ?auto_267735 ) ) ( not ( = ?auto_267725 ?auto_267736 ) ) ( not ( = ?auto_267726 ?auto_267727 ) ) ( not ( = ?auto_267726 ?auto_267728 ) ) ( not ( = ?auto_267726 ?auto_267729 ) ) ( not ( = ?auto_267726 ?auto_267730 ) ) ( not ( = ?auto_267726 ?auto_267731 ) ) ( not ( = ?auto_267726 ?auto_267732 ) ) ( not ( = ?auto_267726 ?auto_267733 ) ) ( not ( = ?auto_267726 ?auto_267734 ) ) ( not ( = ?auto_267726 ?auto_267735 ) ) ( not ( = ?auto_267726 ?auto_267736 ) ) ( not ( = ?auto_267727 ?auto_267728 ) ) ( not ( = ?auto_267727 ?auto_267729 ) ) ( not ( = ?auto_267727 ?auto_267730 ) ) ( not ( = ?auto_267727 ?auto_267731 ) ) ( not ( = ?auto_267727 ?auto_267732 ) ) ( not ( = ?auto_267727 ?auto_267733 ) ) ( not ( = ?auto_267727 ?auto_267734 ) ) ( not ( = ?auto_267727 ?auto_267735 ) ) ( not ( = ?auto_267727 ?auto_267736 ) ) ( not ( = ?auto_267728 ?auto_267729 ) ) ( not ( = ?auto_267728 ?auto_267730 ) ) ( not ( = ?auto_267728 ?auto_267731 ) ) ( not ( = ?auto_267728 ?auto_267732 ) ) ( not ( = ?auto_267728 ?auto_267733 ) ) ( not ( = ?auto_267728 ?auto_267734 ) ) ( not ( = ?auto_267728 ?auto_267735 ) ) ( not ( = ?auto_267728 ?auto_267736 ) ) ( not ( = ?auto_267729 ?auto_267730 ) ) ( not ( = ?auto_267729 ?auto_267731 ) ) ( not ( = ?auto_267729 ?auto_267732 ) ) ( not ( = ?auto_267729 ?auto_267733 ) ) ( not ( = ?auto_267729 ?auto_267734 ) ) ( not ( = ?auto_267729 ?auto_267735 ) ) ( not ( = ?auto_267729 ?auto_267736 ) ) ( not ( = ?auto_267730 ?auto_267731 ) ) ( not ( = ?auto_267730 ?auto_267732 ) ) ( not ( = ?auto_267730 ?auto_267733 ) ) ( not ( = ?auto_267730 ?auto_267734 ) ) ( not ( = ?auto_267730 ?auto_267735 ) ) ( not ( = ?auto_267730 ?auto_267736 ) ) ( not ( = ?auto_267731 ?auto_267732 ) ) ( not ( = ?auto_267731 ?auto_267733 ) ) ( not ( = ?auto_267731 ?auto_267734 ) ) ( not ( = ?auto_267731 ?auto_267735 ) ) ( not ( = ?auto_267731 ?auto_267736 ) ) ( not ( = ?auto_267732 ?auto_267733 ) ) ( not ( = ?auto_267732 ?auto_267734 ) ) ( not ( = ?auto_267732 ?auto_267735 ) ) ( not ( = ?auto_267732 ?auto_267736 ) ) ( not ( = ?auto_267733 ?auto_267734 ) ) ( not ( = ?auto_267733 ?auto_267735 ) ) ( not ( = ?auto_267733 ?auto_267736 ) ) ( not ( = ?auto_267734 ?auto_267735 ) ) ( not ( = ?auto_267734 ?auto_267736 ) ) ( not ( = ?auto_267735 ?auto_267736 ) ) ( ON ?auto_267735 ?auto_267736 ) ( ON ?auto_267734 ?auto_267735 ) ( ON ?auto_267733 ?auto_267734 ) ( ON ?auto_267732 ?auto_267733 ) ( ON ?auto_267731 ?auto_267732 ) ( ON ?auto_267730 ?auto_267731 ) ( ON ?auto_267729 ?auto_267730 ) ( CLEAR ?auto_267727 ) ( ON ?auto_267728 ?auto_267729 ) ( CLEAR ?auto_267728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_267724 ?auto_267725 ?auto_267726 ?auto_267727 ?auto_267728 )
      ( MAKE-13PILE ?auto_267724 ?auto_267725 ?auto_267726 ?auto_267727 ?auto_267728 ?auto_267729 ?auto_267730 ?auto_267731 ?auto_267732 ?auto_267733 ?auto_267734 ?auto_267735 ?auto_267736 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267750 - BLOCK
      ?auto_267751 - BLOCK
      ?auto_267752 - BLOCK
      ?auto_267753 - BLOCK
      ?auto_267754 - BLOCK
      ?auto_267755 - BLOCK
      ?auto_267756 - BLOCK
      ?auto_267757 - BLOCK
      ?auto_267758 - BLOCK
      ?auto_267759 - BLOCK
      ?auto_267760 - BLOCK
      ?auto_267761 - BLOCK
      ?auto_267762 - BLOCK
    )
    :vars
    (
      ?auto_267763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267762 ?auto_267763 ) ( ON-TABLE ?auto_267750 ) ( ON ?auto_267751 ?auto_267750 ) ( ON ?auto_267752 ?auto_267751 ) ( not ( = ?auto_267750 ?auto_267751 ) ) ( not ( = ?auto_267750 ?auto_267752 ) ) ( not ( = ?auto_267750 ?auto_267753 ) ) ( not ( = ?auto_267750 ?auto_267754 ) ) ( not ( = ?auto_267750 ?auto_267755 ) ) ( not ( = ?auto_267750 ?auto_267756 ) ) ( not ( = ?auto_267750 ?auto_267757 ) ) ( not ( = ?auto_267750 ?auto_267758 ) ) ( not ( = ?auto_267750 ?auto_267759 ) ) ( not ( = ?auto_267750 ?auto_267760 ) ) ( not ( = ?auto_267750 ?auto_267761 ) ) ( not ( = ?auto_267750 ?auto_267762 ) ) ( not ( = ?auto_267750 ?auto_267763 ) ) ( not ( = ?auto_267751 ?auto_267752 ) ) ( not ( = ?auto_267751 ?auto_267753 ) ) ( not ( = ?auto_267751 ?auto_267754 ) ) ( not ( = ?auto_267751 ?auto_267755 ) ) ( not ( = ?auto_267751 ?auto_267756 ) ) ( not ( = ?auto_267751 ?auto_267757 ) ) ( not ( = ?auto_267751 ?auto_267758 ) ) ( not ( = ?auto_267751 ?auto_267759 ) ) ( not ( = ?auto_267751 ?auto_267760 ) ) ( not ( = ?auto_267751 ?auto_267761 ) ) ( not ( = ?auto_267751 ?auto_267762 ) ) ( not ( = ?auto_267751 ?auto_267763 ) ) ( not ( = ?auto_267752 ?auto_267753 ) ) ( not ( = ?auto_267752 ?auto_267754 ) ) ( not ( = ?auto_267752 ?auto_267755 ) ) ( not ( = ?auto_267752 ?auto_267756 ) ) ( not ( = ?auto_267752 ?auto_267757 ) ) ( not ( = ?auto_267752 ?auto_267758 ) ) ( not ( = ?auto_267752 ?auto_267759 ) ) ( not ( = ?auto_267752 ?auto_267760 ) ) ( not ( = ?auto_267752 ?auto_267761 ) ) ( not ( = ?auto_267752 ?auto_267762 ) ) ( not ( = ?auto_267752 ?auto_267763 ) ) ( not ( = ?auto_267753 ?auto_267754 ) ) ( not ( = ?auto_267753 ?auto_267755 ) ) ( not ( = ?auto_267753 ?auto_267756 ) ) ( not ( = ?auto_267753 ?auto_267757 ) ) ( not ( = ?auto_267753 ?auto_267758 ) ) ( not ( = ?auto_267753 ?auto_267759 ) ) ( not ( = ?auto_267753 ?auto_267760 ) ) ( not ( = ?auto_267753 ?auto_267761 ) ) ( not ( = ?auto_267753 ?auto_267762 ) ) ( not ( = ?auto_267753 ?auto_267763 ) ) ( not ( = ?auto_267754 ?auto_267755 ) ) ( not ( = ?auto_267754 ?auto_267756 ) ) ( not ( = ?auto_267754 ?auto_267757 ) ) ( not ( = ?auto_267754 ?auto_267758 ) ) ( not ( = ?auto_267754 ?auto_267759 ) ) ( not ( = ?auto_267754 ?auto_267760 ) ) ( not ( = ?auto_267754 ?auto_267761 ) ) ( not ( = ?auto_267754 ?auto_267762 ) ) ( not ( = ?auto_267754 ?auto_267763 ) ) ( not ( = ?auto_267755 ?auto_267756 ) ) ( not ( = ?auto_267755 ?auto_267757 ) ) ( not ( = ?auto_267755 ?auto_267758 ) ) ( not ( = ?auto_267755 ?auto_267759 ) ) ( not ( = ?auto_267755 ?auto_267760 ) ) ( not ( = ?auto_267755 ?auto_267761 ) ) ( not ( = ?auto_267755 ?auto_267762 ) ) ( not ( = ?auto_267755 ?auto_267763 ) ) ( not ( = ?auto_267756 ?auto_267757 ) ) ( not ( = ?auto_267756 ?auto_267758 ) ) ( not ( = ?auto_267756 ?auto_267759 ) ) ( not ( = ?auto_267756 ?auto_267760 ) ) ( not ( = ?auto_267756 ?auto_267761 ) ) ( not ( = ?auto_267756 ?auto_267762 ) ) ( not ( = ?auto_267756 ?auto_267763 ) ) ( not ( = ?auto_267757 ?auto_267758 ) ) ( not ( = ?auto_267757 ?auto_267759 ) ) ( not ( = ?auto_267757 ?auto_267760 ) ) ( not ( = ?auto_267757 ?auto_267761 ) ) ( not ( = ?auto_267757 ?auto_267762 ) ) ( not ( = ?auto_267757 ?auto_267763 ) ) ( not ( = ?auto_267758 ?auto_267759 ) ) ( not ( = ?auto_267758 ?auto_267760 ) ) ( not ( = ?auto_267758 ?auto_267761 ) ) ( not ( = ?auto_267758 ?auto_267762 ) ) ( not ( = ?auto_267758 ?auto_267763 ) ) ( not ( = ?auto_267759 ?auto_267760 ) ) ( not ( = ?auto_267759 ?auto_267761 ) ) ( not ( = ?auto_267759 ?auto_267762 ) ) ( not ( = ?auto_267759 ?auto_267763 ) ) ( not ( = ?auto_267760 ?auto_267761 ) ) ( not ( = ?auto_267760 ?auto_267762 ) ) ( not ( = ?auto_267760 ?auto_267763 ) ) ( not ( = ?auto_267761 ?auto_267762 ) ) ( not ( = ?auto_267761 ?auto_267763 ) ) ( not ( = ?auto_267762 ?auto_267763 ) ) ( ON ?auto_267761 ?auto_267762 ) ( ON ?auto_267760 ?auto_267761 ) ( ON ?auto_267759 ?auto_267760 ) ( ON ?auto_267758 ?auto_267759 ) ( ON ?auto_267757 ?auto_267758 ) ( ON ?auto_267756 ?auto_267757 ) ( ON ?auto_267755 ?auto_267756 ) ( ON ?auto_267754 ?auto_267755 ) ( CLEAR ?auto_267752 ) ( ON ?auto_267753 ?auto_267754 ) ( CLEAR ?auto_267753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_267750 ?auto_267751 ?auto_267752 ?auto_267753 )
      ( MAKE-13PILE ?auto_267750 ?auto_267751 ?auto_267752 ?auto_267753 ?auto_267754 ?auto_267755 ?auto_267756 ?auto_267757 ?auto_267758 ?auto_267759 ?auto_267760 ?auto_267761 ?auto_267762 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267777 - BLOCK
      ?auto_267778 - BLOCK
      ?auto_267779 - BLOCK
      ?auto_267780 - BLOCK
      ?auto_267781 - BLOCK
      ?auto_267782 - BLOCK
      ?auto_267783 - BLOCK
      ?auto_267784 - BLOCK
      ?auto_267785 - BLOCK
      ?auto_267786 - BLOCK
      ?auto_267787 - BLOCK
      ?auto_267788 - BLOCK
      ?auto_267789 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267789 ) ( ON-TABLE ?auto_267777 ) ( ON ?auto_267778 ?auto_267777 ) ( ON ?auto_267779 ?auto_267778 ) ( not ( = ?auto_267777 ?auto_267778 ) ) ( not ( = ?auto_267777 ?auto_267779 ) ) ( not ( = ?auto_267777 ?auto_267780 ) ) ( not ( = ?auto_267777 ?auto_267781 ) ) ( not ( = ?auto_267777 ?auto_267782 ) ) ( not ( = ?auto_267777 ?auto_267783 ) ) ( not ( = ?auto_267777 ?auto_267784 ) ) ( not ( = ?auto_267777 ?auto_267785 ) ) ( not ( = ?auto_267777 ?auto_267786 ) ) ( not ( = ?auto_267777 ?auto_267787 ) ) ( not ( = ?auto_267777 ?auto_267788 ) ) ( not ( = ?auto_267777 ?auto_267789 ) ) ( not ( = ?auto_267778 ?auto_267779 ) ) ( not ( = ?auto_267778 ?auto_267780 ) ) ( not ( = ?auto_267778 ?auto_267781 ) ) ( not ( = ?auto_267778 ?auto_267782 ) ) ( not ( = ?auto_267778 ?auto_267783 ) ) ( not ( = ?auto_267778 ?auto_267784 ) ) ( not ( = ?auto_267778 ?auto_267785 ) ) ( not ( = ?auto_267778 ?auto_267786 ) ) ( not ( = ?auto_267778 ?auto_267787 ) ) ( not ( = ?auto_267778 ?auto_267788 ) ) ( not ( = ?auto_267778 ?auto_267789 ) ) ( not ( = ?auto_267779 ?auto_267780 ) ) ( not ( = ?auto_267779 ?auto_267781 ) ) ( not ( = ?auto_267779 ?auto_267782 ) ) ( not ( = ?auto_267779 ?auto_267783 ) ) ( not ( = ?auto_267779 ?auto_267784 ) ) ( not ( = ?auto_267779 ?auto_267785 ) ) ( not ( = ?auto_267779 ?auto_267786 ) ) ( not ( = ?auto_267779 ?auto_267787 ) ) ( not ( = ?auto_267779 ?auto_267788 ) ) ( not ( = ?auto_267779 ?auto_267789 ) ) ( not ( = ?auto_267780 ?auto_267781 ) ) ( not ( = ?auto_267780 ?auto_267782 ) ) ( not ( = ?auto_267780 ?auto_267783 ) ) ( not ( = ?auto_267780 ?auto_267784 ) ) ( not ( = ?auto_267780 ?auto_267785 ) ) ( not ( = ?auto_267780 ?auto_267786 ) ) ( not ( = ?auto_267780 ?auto_267787 ) ) ( not ( = ?auto_267780 ?auto_267788 ) ) ( not ( = ?auto_267780 ?auto_267789 ) ) ( not ( = ?auto_267781 ?auto_267782 ) ) ( not ( = ?auto_267781 ?auto_267783 ) ) ( not ( = ?auto_267781 ?auto_267784 ) ) ( not ( = ?auto_267781 ?auto_267785 ) ) ( not ( = ?auto_267781 ?auto_267786 ) ) ( not ( = ?auto_267781 ?auto_267787 ) ) ( not ( = ?auto_267781 ?auto_267788 ) ) ( not ( = ?auto_267781 ?auto_267789 ) ) ( not ( = ?auto_267782 ?auto_267783 ) ) ( not ( = ?auto_267782 ?auto_267784 ) ) ( not ( = ?auto_267782 ?auto_267785 ) ) ( not ( = ?auto_267782 ?auto_267786 ) ) ( not ( = ?auto_267782 ?auto_267787 ) ) ( not ( = ?auto_267782 ?auto_267788 ) ) ( not ( = ?auto_267782 ?auto_267789 ) ) ( not ( = ?auto_267783 ?auto_267784 ) ) ( not ( = ?auto_267783 ?auto_267785 ) ) ( not ( = ?auto_267783 ?auto_267786 ) ) ( not ( = ?auto_267783 ?auto_267787 ) ) ( not ( = ?auto_267783 ?auto_267788 ) ) ( not ( = ?auto_267783 ?auto_267789 ) ) ( not ( = ?auto_267784 ?auto_267785 ) ) ( not ( = ?auto_267784 ?auto_267786 ) ) ( not ( = ?auto_267784 ?auto_267787 ) ) ( not ( = ?auto_267784 ?auto_267788 ) ) ( not ( = ?auto_267784 ?auto_267789 ) ) ( not ( = ?auto_267785 ?auto_267786 ) ) ( not ( = ?auto_267785 ?auto_267787 ) ) ( not ( = ?auto_267785 ?auto_267788 ) ) ( not ( = ?auto_267785 ?auto_267789 ) ) ( not ( = ?auto_267786 ?auto_267787 ) ) ( not ( = ?auto_267786 ?auto_267788 ) ) ( not ( = ?auto_267786 ?auto_267789 ) ) ( not ( = ?auto_267787 ?auto_267788 ) ) ( not ( = ?auto_267787 ?auto_267789 ) ) ( not ( = ?auto_267788 ?auto_267789 ) ) ( ON ?auto_267788 ?auto_267789 ) ( ON ?auto_267787 ?auto_267788 ) ( ON ?auto_267786 ?auto_267787 ) ( ON ?auto_267785 ?auto_267786 ) ( ON ?auto_267784 ?auto_267785 ) ( ON ?auto_267783 ?auto_267784 ) ( ON ?auto_267782 ?auto_267783 ) ( ON ?auto_267781 ?auto_267782 ) ( CLEAR ?auto_267779 ) ( ON ?auto_267780 ?auto_267781 ) ( CLEAR ?auto_267780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_267777 ?auto_267778 ?auto_267779 ?auto_267780 )
      ( MAKE-13PILE ?auto_267777 ?auto_267778 ?auto_267779 ?auto_267780 ?auto_267781 ?auto_267782 ?auto_267783 ?auto_267784 ?auto_267785 ?auto_267786 ?auto_267787 ?auto_267788 ?auto_267789 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267803 - BLOCK
      ?auto_267804 - BLOCK
      ?auto_267805 - BLOCK
      ?auto_267806 - BLOCK
      ?auto_267807 - BLOCK
      ?auto_267808 - BLOCK
      ?auto_267809 - BLOCK
      ?auto_267810 - BLOCK
      ?auto_267811 - BLOCK
      ?auto_267812 - BLOCK
      ?auto_267813 - BLOCK
      ?auto_267814 - BLOCK
      ?auto_267815 - BLOCK
    )
    :vars
    (
      ?auto_267816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267815 ?auto_267816 ) ( ON-TABLE ?auto_267803 ) ( ON ?auto_267804 ?auto_267803 ) ( not ( = ?auto_267803 ?auto_267804 ) ) ( not ( = ?auto_267803 ?auto_267805 ) ) ( not ( = ?auto_267803 ?auto_267806 ) ) ( not ( = ?auto_267803 ?auto_267807 ) ) ( not ( = ?auto_267803 ?auto_267808 ) ) ( not ( = ?auto_267803 ?auto_267809 ) ) ( not ( = ?auto_267803 ?auto_267810 ) ) ( not ( = ?auto_267803 ?auto_267811 ) ) ( not ( = ?auto_267803 ?auto_267812 ) ) ( not ( = ?auto_267803 ?auto_267813 ) ) ( not ( = ?auto_267803 ?auto_267814 ) ) ( not ( = ?auto_267803 ?auto_267815 ) ) ( not ( = ?auto_267803 ?auto_267816 ) ) ( not ( = ?auto_267804 ?auto_267805 ) ) ( not ( = ?auto_267804 ?auto_267806 ) ) ( not ( = ?auto_267804 ?auto_267807 ) ) ( not ( = ?auto_267804 ?auto_267808 ) ) ( not ( = ?auto_267804 ?auto_267809 ) ) ( not ( = ?auto_267804 ?auto_267810 ) ) ( not ( = ?auto_267804 ?auto_267811 ) ) ( not ( = ?auto_267804 ?auto_267812 ) ) ( not ( = ?auto_267804 ?auto_267813 ) ) ( not ( = ?auto_267804 ?auto_267814 ) ) ( not ( = ?auto_267804 ?auto_267815 ) ) ( not ( = ?auto_267804 ?auto_267816 ) ) ( not ( = ?auto_267805 ?auto_267806 ) ) ( not ( = ?auto_267805 ?auto_267807 ) ) ( not ( = ?auto_267805 ?auto_267808 ) ) ( not ( = ?auto_267805 ?auto_267809 ) ) ( not ( = ?auto_267805 ?auto_267810 ) ) ( not ( = ?auto_267805 ?auto_267811 ) ) ( not ( = ?auto_267805 ?auto_267812 ) ) ( not ( = ?auto_267805 ?auto_267813 ) ) ( not ( = ?auto_267805 ?auto_267814 ) ) ( not ( = ?auto_267805 ?auto_267815 ) ) ( not ( = ?auto_267805 ?auto_267816 ) ) ( not ( = ?auto_267806 ?auto_267807 ) ) ( not ( = ?auto_267806 ?auto_267808 ) ) ( not ( = ?auto_267806 ?auto_267809 ) ) ( not ( = ?auto_267806 ?auto_267810 ) ) ( not ( = ?auto_267806 ?auto_267811 ) ) ( not ( = ?auto_267806 ?auto_267812 ) ) ( not ( = ?auto_267806 ?auto_267813 ) ) ( not ( = ?auto_267806 ?auto_267814 ) ) ( not ( = ?auto_267806 ?auto_267815 ) ) ( not ( = ?auto_267806 ?auto_267816 ) ) ( not ( = ?auto_267807 ?auto_267808 ) ) ( not ( = ?auto_267807 ?auto_267809 ) ) ( not ( = ?auto_267807 ?auto_267810 ) ) ( not ( = ?auto_267807 ?auto_267811 ) ) ( not ( = ?auto_267807 ?auto_267812 ) ) ( not ( = ?auto_267807 ?auto_267813 ) ) ( not ( = ?auto_267807 ?auto_267814 ) ) ( not ( = ?auto_267807 ?auto_267815 ) ) ( not ( = ?auto_267807 ?auto_267816 ) ) ( not ( = ?auto_267808 ?auto_267809 ) ) ( not ( = ?auto_267808 ?auto_267810 ) ) ( not ( = ?auto_267808 ?auto_267811 ) ) ( not ( = ?auto_267808 ?auto_267812 ) ) ( not ( = ?auto_267808 ?auto_267813 ) ) ( not ( = ?auto_267808 ?auto_267814 ) ) ( not ( = ?auto_267808 ?auto_267815 ) ) ( not ( = ?auto_267808 ?auto_267816 ) ) ( not ( = ?auto_267809 ?auto_267810 ) ) ( not ( = ?auto_267809 ?auto_267811 ) ) ( not ( = ?auto_267809 ?auto_267812 ) ) ( not ( = ?auto_267809 ?auto_267813 ) ) ( not ( = ?auto_267809 ?auto_267814 ) ) ( not ( = ?auto_267809 ?auto_267815 ) ) ( not ( = ?auto_267809 ?auto_267816 ) ) ( not ( = ?auto_267810 ?auto_267811 ) ) ( not ( = ?auto_267810 ?auto_267812 ) ) ( not ( = ?auto_267810 ?auto_267813 ) ) ( not ( = ?auto_267810 ?auto_267814 ) ) ( not ( = ?auto_267810 ?auto_267815 ) ) ( not ( = ?auto_267810 ?auto_267816 ) ) ( not ( = ?auto_267811 ?auto_267812 ) ) ( not ( = ?auto_267811 ?auto_267813 ) ) ( not ( = ?auto_267811 ?auto_267814 ) ) ( not ( = ?auto_267811 ?auto_267815 ) ) ( not ( = ?auto_267811 ?auto_267816 ) ) ( not ( = ?auto_267812 ?auto_267813 ) ) ( not ( = ?auto_267812 ?auto_267814 ) ) ( not ( = ?auto_267812 ?auto_267815 ) ) ( not ( = ?auto_267812 ?auto_267816 ) ) ( not ( = ?auto_267813 ?auto_267814 ) ) ( not ( = ?auto_267813 ?auto_267815 ) ) ( not ( = ?auto_267813 ?auto_267816 ) ) ( not ( = ?auto_267814 ?auto_267815 ) ) ( not ( = ?auto_267814 ?auto_267816 ) ) ( not ( = ?auto_267815 ?auto_267816 ) ) ( ON ?auto_267814 ?auto_267815 ) ( ON ?auto_267813 ?auto_267814 ) ( ON ?auto_267812 ?auto_267813 ) ( ON ?auto_267811 ?auto_267812 ) ( ON ?auto_267810 ?auto_267811 ) ( ON ?auto_267809 ?auto_267810 ) ( ON ?auto_267808 ?auto_267809 ) ( ON ?auto_267807 ?auto_267808 ) ( ON ?auto_267806 ?auto_267807 ) ( CLEAR ?auto_267804 ) ( ON ?auto_267805 ?auto_267806 ) ( CLEAR ?auto_267805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_267803 ?auto_267804 ?auto_267805 )
      ( MAKE-13PILE ?auto_267803 ?auto_267804 ?auto_267805 ?auto_267806 ?auto_267807 ?auto_267808 ?auto_267809 ?auto_267810 ?auto_267811 ?auto_267812 ?auto_267813 ?auto_267814 ?auto_267815 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267830 - BLOCK
      ?auto_267831 - BLOCK
      ?auto_267832 - BLOCK
      ?auto_267833 - BLOCK
      ?auto_267834 - BLOCK
      ?auto_267835 - BLOCK
      ?auto_267836 - BLOCK
      ?auto_267837 - BLOCK
      ?auto_267838 - BLOCK
      ?auto_267839 - BLOCK
      ?auto_267840 - BLOCK
      ?auto_267841 - BLOCK
      ?auto_267842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267842 ) ( ON-TABLE ?auto_267830 ) ( ON ?auto_267831 ?auto_267830 ) ( not ( = ?auto_267830 ?auto_267831 ) ) ( not ( = ?auto_267830 ?auto_267832 ) ) ( not ( = ?auto_267830 ?auto_267833 ) ) ( not ( = ?auto_267830 ?auto_267834 ) ) ( not ( = ?auto_267830 ?auto_267835 ) ) ( not ( = ?auto_267830 ?auto_267836 ) ) ( not ( = ?auto_267830 ?auto_267837 ) ) ( not ( = ?auto_267830 ?auto_267838 ) ) ( not ( = ?auto_267830 ?auto_267839 ) ) ( not ( = ?auto_267830 ?auto_267840 ) ) ( not ( = ?auto_267830 ?auto_267841 ) ) ( not ( = ?auto_267830 ?auto_267842 ) ) ( not ( = ?auto_267831 ?auto_267832 ) ) ( not ( = ?auto_267831 ?auto_267833 ) ) ( not ( = ?auto_267831 ?auto_267834 ) ) ( not ( = ?auto_267831 ?auto_267835 ) ) ( not ( = ?auto_267831 ?auto_267836 ) ) ( not ( = ?auto_267831 ?auto_267837 ) ) ( not ( = ?auto_267831 ?auto_267838 ) ) ( not ( = ?auto_267831 ?auto_267839 ) ) ( not ( = ?auto_267831 ?auto_267840 ) ) ( not ( = ?auto_267831 ?auto_267841 ) ) ( not ( = ?auto_267831 ?auto_267842 ) ) ( not ( = ?auto_267832 ?auto_267833 ) ) ( not ( = ?auto_267832 ?auto_267834 ) ) ( not ( = ?auto_267832 ?auto_267835 ) ) ( not ( = ?auto_267832 ?auto_267836 ) ) ( not ( = ?auto_267832 ?auto_267837 ) ) ( not ( = ?auto_267832 ?auto_267838 ) ) ( not ( = ?auto_267832 ?auto_267839 ) ) ( not ( = ?auto_267832 ?auto_267840 ) ) ( not ( = ?auto_267832 ?auto_267841 ) ) ( not ( = ?auto_267832 ?auto_267842 ) ) ( not ( = ?auto_267833 ?auto_267834 ) ) ( not ( = ?auto_267833 ?auto_267835 ) ) ( not ( = ?auto_267833 ?auto_267836 ) ) ( not ( = ?auto_267833 ?auto_267837 ) ) ( not ( = ?auto_267833 ?auto_267838 ) ) ( not ( = ?auto_267833 ?auto_267839 ) ) ( not ( = ?auto_267833 ?auto_267840 ) ) ( not ( = ?auto_267833 ?auto_267841 ) ) ( not ( = ?auto_267833 ?auto_267842 ) ) ( not ( = ?auto_267834 ?auto_267835 ) ) ( not ( = ?auto_267834 ?auto_267836 ) ) ( not ( = ?auto_267834 ?auto_267837 ) ) ( not ( = ?auto_267834 ?auto_267838 ) ) ( not ( = ?auto_267834 ?auto_267839 ) ) ( not ( = ?auto_267834 ?auto_267840 ) ) ( not ( = ?auto_267834 ?auto_267841 ) ) ( not ( = ?auto_267834 ?auto_267842 ) ) ( not ( = ?auto_267835 ?auto_267836 ) ) ( not ( = ?auto_267835 ?auto_267837 ) ) ( not ( = ?auto_267835 ?auto_267838 ) ) ( not ( = ?auto_267835 ?auto_267839 ) ) ( not ( = ?auto_267835 ?auto_267840 ) ) ( not ( = ?auto_267835 ?auto_267841 ) ) ( not ( = ?auto_267835 ?auto_267842 ) ) ( not ( = ?auto_267836 ?auto_267837 ) ) ( not ( = ?auto_267836 ?auto_267838 ) ) ( not ( = ?auto_267836 ?auto_267839 ) ) ( not ( = ?auto_267836 ?auto_267840 ) ) ( not ( = ?auto_267836 ?auto_267841 ) ) ( not ( = ?auto_267836 ?auto_267842 ) ) ( not ( = ?auto_267837 ?auto_267838 ) ) ( not ( = ?auto_267837 ?auto_267839 ) ) ( not ( = ?auto_267837 ?auto_267840 ) ) ( not ( = ?auto_267837 ?auto_267841 ) ) ( not ( = ?auto_267837 ?auto_267842 ) ) ( not ( = ?auto_267838 ?auto_267839 ) ) ( not ( = ?auto_267838 ?auto_267840 ) ) ( not ( = ?auto_267838 ?auto_267841 ) ) ( not ( = ?auto_267838 ?auto_267842 ) ) ( not ( = ?auto_267839 ?auto_267840 ) ) ( not ( = ?auto_267839 ?auto_267841 ) ) ( not ( = ?auto_267839 ?auto_267842 ) ) ( not ( = ?auto_267840 ?auto_267841 ) ) ( not ( = ?auto_267840 ?auto_267842 ) ) ( not ( = ?auto_267841 ?auto_267842 ) ) ( ON ?auto_267841 ?auto_267842 ) ( ON ?auto_267840 ?auto_267841 ) ( ON ?auto_267839 ?auto_267840 ) ( ON ?auto_267838 ?auto_267839 ) ( ON ?auto_267837 ?auto_267838 ) ( ON ?auto_267836 ?auto_267837 ) ( ON ?auto_267835 ?auto_267836 ) ( ON ?auto_267834 ?auto_267835 ) ( ON ?auto_267833 ?auto_267834 ) ( CLEAR ?auto_267831 ) ( ON ?auto_267832 ?auto_267833 ) ( CLEAR ?auto_267832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_267830 ?auto_267831 ?auto_267832 )
      ( MAKE-13PILE ?auto_267830 ?auto_267831 ?auto_267832 ?auto_267833 ?auto_267834 ?auto_267835 ?auto_267836 ?auto_267837 ?auto_267838 ?auto_267839 ?auto_267840 ?auto_267841 ?auto_267842 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267856 - BLOCK
      ?auto_267857 - BLOCK
      ?auto_267858 - BLOCK
      ?auto_267859 - BLOCK
      ?auto_267860 - BLOCK
      ?auto_267861 - BLOCK
      ?auto_267862 - BLOCK
      ?auto_267863 - BLOCK
      ?auto_267864 - BLOCK
      ?auto_267865 - BLOCK
      ?auto_267866 - BLOCK
      ?auto_267867 - BLOCK
      ?auto_267868 - BLOCK
    )
    :vars
    (
      ?auto_267869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267868 ?auto_267869 ) ( ON-TABLE ?auto_267856 ) ( not ( = ?auto_267856 ?auto_267857 ) ) ( not ( = ?auto_267856 ?auto_267858 ) ) ( not ( = ?auto_267856 ?auto_267859 ) ) ( not ( = ?auto_267856 ?auto_267860 ) ) ( not ( = ?auto_267856 ?auto_267861 ) ) ( not ( = ?auto_267856 ?auto_267862 ) ) ( not ( = ?auto_267856 ?auto_267863 ) ) ( not ( = ?auto_267856 ?auto_267864 ) ) ( not ( = ?auto_267856 ?auto_267865 ) ) ( not ( = ?auto_267856 ?auto_267866 ) ) ( not ( = ?auto_267856 ?auto_267867 ) ) ( not ( = ?auto_267856 ?auto_267868 ) ) ( not ( = ?auto_267856 ?auto_267869 ) ) ( not ( = ?auto_267857 ?auto_267858 ) ) ( not ( = ?auto_267857 ?auto_267859 ) ) ( not ( = ?auto_267857 ?auto_267860 ) ) ( not ( = ?auto_267857 ?auto_267861 ) ) ( not ( = ?auto_267857 ?auto_267862 ) ) ( not ( = ?auto_267857 ?auto_267863 ) ) ( not ( = ?auto_267857 ?auto_267864 ) ) ( not ( = ?auto_267857 ?auto_267865 ) ) ( not ( = ?auto_267857 ?auto_267866 ) ) ( not ( = ?auto_267857 ?auto_267867 ) ) ( not ( = ?auto_267857 ?auto_267868 ) ) ( not ( = ?auto_267857 ?auto_267869 ) ) ( not ( = ?auto_267858 ?auto_267859 ) ) ( not ( = ?auto_267858 ?auto_267860 ) ) ( not ( = ?auto_267858 ?auto_267861 ) ) ( not ( = ?auto_267858 ?auto_267862 ) ) ( not ( = ?auto_267858 ?auto_267863 ) ) ( not ( = ?auto_267858 ?auto_267864 ) ) ( not ( = ?auto_267858 ?auto_267865 ) ) ( not ( = ?auto_267858 ?auto_267866 ) ) ( not ( = ?auto_267858 ?auto_267867 ) ) ( not ( = ?auto_267858 ?auto_267868 ) ) ( not ( = ?auto_267858 ?auto_267869 ) ) ( not ( = ?auto_267859 ?auto_267860 ) ) ( not ( = ?auto_267859 ?auto_267861 ) ) ( not ( = ?auto_267859 ?auto_267862 ) ) ( not ( = ?auto_267859 ?auto_267863 ) ) ( not ( = ?auto_267859 ?auto_267864 ) ) ( not ( = ?auto_267859 ?auto_267865 ) ) ( not ( = ?auto_267859 ?auto_267866 ) ) ( not ( = ?auto_267859 ?auto_267867 ) ) ( not ( = ?auto_267859 ?auto_267868 ) ) ( not ( = ?auto_267859 ?auto_267869 ) ) ( not ( = ?auto_267860 ?auto_267861 ) ) ( not ( = ?auto_267860 ?auto_267862 ) ) ( not ( = ?auto_267860 ?auto_267863 ) ) ( not ( = ?auto_267860 ?auto_267864 ) ) ( not ( = ?auto_267860 ?auto_267865 ) ) ( not ( = ?auto_267860 ?auto_267866 ) ) ( not ( = ?auto_267860 ?auto_267867 ) ) ( not ( = ?auto_267860 ?auto_267868 ) ) ( not ( = ?auto_267860 ?auto_267869 ) ) ( not ( = ?auto_267861 ?auto_267862 ) ) ( not ( = ?auto_267861 ?auto_267863 ) ) ( not ( = ?auto_267861 ?auto_267864 ) ) ( not ( = ?auto_267861 ?auto_267865 ) ) ( not ( = ?auto_267861 ?auto_267866 ) ) ( not ( = ?auto_267861 ?auto_267867 ) ) ( not ( = ?auto_267861 ?auto_267868 ) ) ( not ( = ?auto_267861 ?auto_267869 ) ) ( not ( = ?auto_267862 ?auto_267863 ) ) ( not ( = ?auto_267862 ?auto_267864 ) ) ( not ( = ?auto_267862 ?auto_267865 ) ) ( not ( = ?auto_267862 ?auto_267866 ) ) ( not ( = ?auto_267862 ?auto_267867 ) ) ( not ( = ?auto_267862 ?auto_267868 ) ) ( not ( = ?auto_267862 ?auto_267869 ) ) ( not ( = ?auto_267863 ?auto_267864 ) ) ( not ( = ?auto_267863 ?auto_267865 ) ) ( not ( = ?auto_267863 ?auto_267866 ) ) ( not ( = ?auto_267863 ?auto_267867 ) ) ( not ( = ?auto_267863 ?auto_267868 ) ) ( not ( = ?auto_267863 ?auto_267869 ) ) ( not ( = ?auto_267864 ?auto_267865 ) ) ( not ( = ?auto_267864 ?auto_267866 ) ) ( not ( = ?auto_267864 ?auto_267867 ) ) ( not ( = ?auto_267864 ?auto_267868 ) ) ( not ( = ?auto_267864 ?auto_267869 ) ) ( not ( = ?auto_267865 ?auto_267866 ) ) ( not ( = ?auto_267865 ?auto_267867 ) ) ( not ( = ?auto_267865 ?auto_267868 ) ) ( not ( = ?auto_267865 ?auto_267869 ) ) ( not ( = ?auto_267866 ?auto_267867 ) ) ( not ( = ?auto_267866 ?auto_267868 ) ) ( not ( = ?auto_267866 ?auto_267869 ) ) ( not ( = ?auto_267867 ?auto_267868 ) ) ( not ( = ?auto_267867 ?auto_267869 ) ) ( not ( = ?auto_267868 ?auto_267869 ) ) ( ON ?auto_267867 ?auto_267868 ) ( ON ?auto_267866 ?auto_267867 ) ( ON ?auto_267865 ?auto_267866 ) ( ON ?auto_267864 ?auto_267865 ) ( ON ?auto_267863 ?auto_267864 ) ( ON ?auto_267862 ?auto_267863 ) ( ON ?auto_267861 ?auto_267862 ) ( ON ?auto_267860 ?auto_267861 ) ( ON ?auto_267859 ?auto_267860 ) ( ON ?auto_267858 ?auto_267859 ) ( CLEAR ?auto_267856 ) ( ON ?auto_267857 ?auto_267858 ) ( CLEAR ?auto_267857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_267856 ?auto_267857 )
      ( MAKE-13PILE ?auto_267856 ?auto_267857 ?auto_267858 ?auto_267859 ?auto_267860 ?auto_267861 ?auto_267862 ?auto_267863 ?auto_267864 ?auto_267865 ?auto_267866 ?auto_267867 ?auto_267868 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267883 - BLOCK
      ?auto_267884 - BLOCK
      ?auto_267885 - BLOCK
      ?auto_267886 - BLOCK
      ?auto_267887 - BLOCK
      ?auto_267888 - BLOCK
      ?auto_267889 - BLOCK
      ?auto_267890 - BLOCK
      ?auto_267891 - BLOCK
      ?auto_267892 - BLOCK
      ?auto_267893 - BLOCK
      ?auto_267894 - BLOCK
      ?auto_267895 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267895 ) ( ON-TABLE ?auto_267883 ) ( not ( = ?auto_267883 ?auto_267884 ) ) ( not ( = ?auto_267883 ?auto_267885 ) ) ( not ( = ?auto_267883 ?auto_267886 ) ) ( not ( = ?auto_267883 ?auto_267887 ) ) ( not ( = ?auto_267883 ?auto_267888 ) ) ( not ( = ?auto_267883 ?auto_267889 ) ) ( not ( = ?auto_267883 ?auto_267890 ) ) ( not ( = ?auto_267883 ?auto_267891 ) ) ( not ( = ?auto_267883 ?auto_267892 ) ) ( not ( = ?auto_267883 ?auto_267893 ) ) ( not ( = ?auto_267883 ?auto_267894 ) ) ( not ( = ?auto_267883 ?auto_267895 ) ) ( not ( = ?auto_267884 ?auto_267885 ) ) ( not ( = ?auto_267884 ?auto_267886 ) ) ( not ( = ?auto_267884 ?auto_267887 ) ) ( not ( = ?auto_267884 ?auto_267888 ) ) ( not ( = ?auto_267884 ?auto_267889 ) ) ( not ( = ?auto_267884 ?auto_267890 ) ) ( not ( = ?auto_267884 ?auto_267891 ) ) ( not ( = ?auto_267884 ?auto_267892 ) ) ( not ( = ?auto_267884 ?auto_267893 ) ) ( not ( = ?auto_267884 ?auto_267894 ) ) ( not ( = ?auto_267884 ?auto_267895 ) ) ( not ( = ?auto_267885 ?auto_267886 ) ) ( not ( = ?auto_267885 ?auto_267887 ) ) ( not ( = ?auto_267885 ?auto_267888 ) ) ( not ( = ?auto_267885 ?auto_267889 ) ) ( not ( = ?auto_267885 ?auto_267890 ) ) ( not ( = ?auto_267885 ?auto_267891 ) ) ( not ( = ?auto_267885 ?auto_267892 ) ) ( not ( = ?auto_267885 ?auto_267893 ) ) ( not ( = ?auto_267885 ?auto_267894 ) ) ( not ( = ?auto_267885 ?auto_267895 ) ) ( not ( = ?auto_267886 ?auto_267887 ) ) ( not ( = ?auto_267886 ?auto_267888 ) ) ( not ( = ?auto_267886 ?auto_267889 ) ) ( not ( = ?auto_267886 ?auto_267890 ) ) ( not ( = ?auto_267886 ?auto_267891 ) ) ( not ( = ?auto_267886 ?auto_267892 ) ) ( not ( = ?auto_267886 ?auto_267893 ) ) ( not ( = ?auto_267886 ?auto_267894 ) ) ( not ( = ?auto_267886 ?auto_267895 ) ) ( not ( = ?auto_267887 ?auto_267888 ) ) ( not ( = ?auto_267887 ?auto_267889 ) ) ( not ( = ?auto_267887 ?auto_267890 ) ) ( not ( = ?auto_267887 ?auto_267891 ) ) ( not ( = ?auto_267887 ?auto_267892 ) ) ( not ( = ?auto_267887 ?auto_267893 ) ) ( not ( = ?auto_267887 ?auto_267894 ) ) ( not ( = ?auto_267887 ?auto_267895 ) ) ( not ( = ?auto_267888 ?auto_267889 ) ) ( not ( = ?auto_267888 ?auto_267890 ) ) ( not ( = ?auto_267888 ?auto_267891 ) ) ( not ( = ?auto_267888 ?auto_267892 ) ) ( not ( = ?auto_267888 ?auto_267893 ) ) ( not ( = ?auto_267888 ?auto_267894 ) ) ( not ( = ?auto_267888 ?auto_267895 ) ) ( not ( = ?auto_267889 ?auto_267890 ) ) ( not ( = ?auto_267889 ?auto_267891 ) ) ( not ( = ?auto_267889 ?auto_267892 ) ) ( not ( = ?auto_267889 ?auto_267893 ) ) ( not ( = ?auto_267889 ?auto_267894 ) ) ( not ( = ?auto_267889 ?auto_267895 ) ) ( not ( = ?auto_267890 ?auto_267891 ) ) ( not ( = ?auto_267890 ?auto_267892 ) ) ( not ( = ?auto_267890 ?auto_267893 ) ) ( not ( = ?auto_267890 ?auto_267894 ) ) ( not ( = ?auto_267890 ?auto_267895 ) ) ( not ( = ?auto_267891 ?auto_267892 ) ) ( not ( = ?auto_267891 ?auto_267893 ) ) ( not ( = ?auto_267891 ?auto_267894 ) ) ( not ( = ?auto_267891 ?auto_267895 ) ) ( not ( = ?auto_267892 ?auto_267893 ) ) ( not ( = ?auto_267892 ?auto_267894 ) ) ( not ( = ?auto_267892 ?auto_267895 ) ) ( not ( = ?auto_267893 ?auto_267894 ) ) ( not ( = ?auto_267893 ?auto_267895 ) ) ( not ( = ?auto_267894 ?auto_267895 ) ) ( ON ?auto_267894 ?auto_267895 ) ( ON ?auto_267893 ?auto_267894 ) ( ON ?auto_267892 ?auto_267893 ) ( ON ?auto_267891 ?auto_267892 ) ( ON ?auto_267890 ?auto_267891 ) ( ON ?auto_267889 ?auto_267890 ) ( ON ?auto_267888 ?auto_267889 ) ( ON ?auto_267887 ?auto_267888 ) ( ON ?auto_267886 ?auto_267887 ) ( ON ?auto_267885 ?auto_267886 ) ( CLEAR ?auto_267883 ) ( ON ?auto_267884 ?auto_267885 ) ( CLEAR ?auto_267884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_267883 ?auto_267884 )
      ( MAKE-13PILE ?auto_267883 ?auto_267884 ?auto_267885 ?auto_267886 ?auto_267887 ?auto_267888 ?auto_267889 ?auto_267890 ?auto_267891 ?auto_267892 ?auto_267893 ?auto_267894 ?auto_267895 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267909 - BLOCK
      ?auto_267910 - BLOCK
      ?auto_267911 - BLOCK
      ?auto_267912 - BLOCK
      ?auto_267913 - BLOCK
      ?auto_267914 - BLOCK
      ?auto_267915 - BLOCK
      ?auto_267916 - BLOCK
      ?auto_267917 - BLOCK
      ?auto_267918 - BLOCK
      ?auto_267919 - BLOCK
      ?auto_267920 - BLOCK
      ?auto_267921 - BLOCK
    )
    :vars
    (
      ?auto_267922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267921 ?auto_267922 ) ( not ( = ?auto_267909 ?auto_267910 ) ) ( not ( = ?auto_267909 ?auto_267911 ) ) ( not ( = ?auto_267909 ?auto_267912 ) ) ( not ( = ?auto_267909 ?auto_267913 ) ) ( not ( = ?auto_267909 ?auto_267914 ) ) ( not ( = ?auto_267909 ?auto_267915 ) ) ( not ( = ?auto_267909 ?auto_267916 ) ) ( not ( = ?auto_267909 ?auto_267917 ) ) ( not ( = ?auto_267909 ?auto_267918 ) ) ( not ( = ?auto_267909 ?auto_267919 ) ) ( not ( = ?auto_267909 ?auto_267920 ) ) ( not ( = ?auto_267909 ?auto_267921 ) ) ( not ( = ?auto_267909 ?auto_267922 ) ) ( not ( = ?auto_267910 ?auto_267911 ) ) ( not ( = ?auto_267910 ?auto_267912 ) ) ( not ( = ?auto_267910 ?auto_267913 ) ) ( not ( = ?auto_267910 ?auto_267914 ) ) ( not ( = ?auto_267910 ?auto_267915 ) ) ( not ( = ?auto_267910 ?auto_267916 ) ) ( not ( = ?auto_267910 ?auto_267917 ) ) ( not ( = ?auto_267910 ?auto_267918 ) ) ( not ( = ?auto_267910 ?auto_267919 ) ) ( not ( = ?auto_267910 ?auto_267920 ) ) ( not ( = ?auto_267910 ?auto_267921 ) ) ( not ( = ?auto_267910 ?auto_267922 ) ) ( not ( = ?auto_267911 ?auto_267912 ) ) ( not ( = ?auto_267911 ?auto_267913 ) ) ( not ( = ?auto_267911 ?auto_267914 ) ) ( not ( = ?auto_267911 ?auto_267915 ) ) ( not ( = ?auto_267911 ?auto_267916 ) ) ( not ( = ?auto_267911 ?auto_267917 ) ) ( not ( = ?auto_267911 ?auto_267918 ) ) ( not ( = ?auto_267911 ?auto_267919 ) ) ( not ( = ?auto_267911 ?auto_267920 ) ) ( not ( = ?auto_267911 ?auto_267921 ) ) ( not ( = ?auto_267911 ?auto_267922 ) ) ( not ( = ?auto_267912 ?auto_267913 ) ) ( not ( = ?auto_267912 ?auto_267914 ) ) ( not ( = ?auto_267912 ?auto_267915 ) ) ( not ( = ?auto_267912 ?auto_267916 ) ) ( not ( = ?auto_267912 ?auto_267917 ) ) ( not ( = ?auto_267912 ?auto_267918 ) ) ( not ( = ?auto_267912 ?auto_267919 ) ) ( not ( = ?auto_267912 ?auto_267920 ) ) ( not ( = ?auto_267912 ?auto_267921 ) ) ( not ( = ?auto_267912 ?auto_267922 ) ) ( not ( = ?auto_267913 ?auto_267914 ) ) ( not ( = ?auto_267913 ?auto_267915 ) ) ( not ( = ?auto_267913 ?auto_267916 ) ) ( not ( = ?auto_267913 ?auto_267917 ) ) ( not ( = ?auto_267913 ?auto_267918 ) ) ( not ( = ?auto_267913 ?auto_267919 ) ) ( not ( = ?auto_267913 ?auto_267920 ) ) ( not ( = ?auto_267913 ?auto_267921 ) ) ( not ( = ?auto_267913 ?auto_267922 ) ) ( not ( = ?auto_267914 ?auto_267915 ) ) ( not ( = ?auto_267914 ?auto_267916 ) ) ( not ( = ?auto_267914 ?auto_267917 ) ) ( not ( = ?auto_267914 ?auto_267918 ) ) ( not ( = ?auto_267914 ?auto_267919 ) ) ( not ( = ?auto_267914 ?auto_267920 ) ) ( not ( = ?auto_267914 ?auto_267921 ) ) ( not ( = ?auto_267914 ?auto_267922 ) ) ( not ( = ?auto_267915 ?auto_267916 ) ) ( not ( = ?auto_267915 ?auto_267917 ) ) ( not ( = ?auto_267915 ?auto_267918 ) ) ( not ( = ?auto_267915 ?auto_267919 ) ) ( not ( = ?auto_267915 ?auto_267920 ) ) ( not ( = ?auto_267915 ?auto_267921 ) ) ( not ( = ?auto_267915 ?auto_267922 ) ) ( not ( = ?auto_267916 ?auto_267917 ) ) ( not ( = ?auto_267916 ?auto_267918 ) ) ( not ( = ?auto_267916 ?auto_267919 ) ) ( not ( = ?auto_267916 ?auto_267920 ) ) ( not ( = ?auto_267916 ?auto_267921 ) ) ( not ( = ?auto_267916 ?auto_267922 ) ) ( not ( = ?auto_267917 ?auto_267918 ) ) ( not ( = ?auto_267917 ?auto_267919 ) ) ( not ( = ?auto_267917 ?auto_267920 ) ) ( not ( = ?auto_267917 ?auto_267921 ) ) ( not ( = ?auto_267917 ?auto_267922 ) ) ( not ( = ?auto_267918 ?auto_267919 ) ) ( not ( = ?auto_267918 ?auto_267920 ) ) ( not ( = ?auto_267918 ?auto_267921 ) ) ( not ( = ?auto_267918 ?auto_267922 ) ) ( not ( = ?auto_267919 ?auto_267920 ) ) ( not ( = ?auto_267919 ?auto_267921 ) ) ( not ( = ?auto_267919 ?auto_267922 ) ) ( not ( = ?auto_267920 ?auto_267921 ) ) ( not ( = ?auto_267920 ?auto_267922 ) ) ( not ( = ?auto_267921 ?auto_267922 ) ) ( ON ?auto_267920 ?auto_267921 ) ( ON ?auto_267919 ?auto_267920 ) ( ON ?auto_267918 ?auto_267919 ) ( ON ?auto_267917 ?auto_267918 ) ( ON ?auto_267916 ?auto_267917 ) ( ON ?auto_267915 ?auto_267916 ) ( ON ?auto_267914 ?auto_267915 ) ( ON ?auto_267913 ?auto_267914 ) ( ON ?auto_267912 ?auto_267913 ) ( ON ?auto_267911 ?auto_267912 ) ( ON ?auto_267910 ?auto_267911 ) ( ON ?auto_267909 ?auto_267910 ) ( CLEAR ?auto_267909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_267909 )
      ( MAKE-13PILE ?auto_267909 ?auto_267910 ?auto_267911 ?auto_267912 ?auto_267913 ?auto_267914 ?auto_267915 ?auto_267916 ?auto_267917 ?auto_267918 ?auto_267919 ?auto_267920 ?auto_267921 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267936 - BLOCK
      ?auto_267937 - BLOCK
      ?auto_267938 - BLOCK
      ?auto_267939 - BLOCK
      ?auto_267940 - BLOCK
      ?auto_267941 - BLOCK
      ?auto_267942 - BLOCK
      ?auto_267943 - BLOCK
      ?auto_267944 - BLOCK
      ?auto_267945 - BLOCK
      ?auto_267946 - BLOCK
      ?auto_267947 - BLOCK
      ?auto_267948 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267948 ) ( not ( = ?auto_267936 ?auto_267937 ) ) ( not ( = ?auto_267936 ?auto_267938 ) ) ( not ( = ?auto_267936 ?auto_267939 ) ) ( not ( = ?auto_267936 ?auto_267940 ) ) ( not ( = ?auto_267936 ?auto_267941 ) ) ( not ( = ?auto_267936 ?auto_267942 ) ) ( not ( = ?auto_267936 ?auto_267943 ) ) ( not ( = ?auto_267936 ?auto_267944 ) ) ( not ( = ?auto_267936 ?auto_267945 ) ) ( not ( = ?auto_267936 ?auto_267946 ) ) ( not ( = ?auto_267936 ?auto_267947 ) ) ( not ( = ?auto_267936 ?auto_267948 ) ) ( not ( = ?auto_267937 ?auto_267938 ) ) ( not ( = ?auto_267937 ?auto_267939 ) ) ( not ( = ?auto_267937 ?auto_267940 ) ) ( not ( = ?auto_267937 ?auto_267941 ) ) ( not ( = ?auto_267937 ?auto_267942 ) ) ( not ( = ?auto_267937 ?auto_267943 ) ) ( not ( = ?auto_267937 ?auto_267944 ) ) ( not ( = ?auto_267937 ?auto_267945 ) ) ( not ( = ?auto_267937 ?auto_267946 ) ) ( not ( = ?auto_267937 ?auto_267947 ) ) ( not ( = ?auto_267937 ?auto_267948 ) ) ( not ( = ?auto_267938 ?auto_267939 ) ) ( not ( = ?auto_267938 ?auto_267940 ) ) ( not ( = ?auto_267938 ?auto_267941 ) ) ( not ( = ?auto_267938 ?auto_267942 ) ) ( not ( = ?auto_267938 ?auto_267943 ) ) ( not ( = ?auto_267938 ?auto_267944 ) ) ( not ( = ?auto_267938 ?auto_267945 ) ) ( not ( = ?auto_267938 ?auto_267946 ) ) ( not ( = ?auto_267938 ?auto_267947 ) ) ( not ( = ?auto_267938 ?auto_267948 ) ) ( not ( = ?auto_267939 ?auto_267940 ) ) ( not ( = ?auto_267939 ?auto_267941 ) ) ( not ( = ?auto_267939 ?auto_267942 ) ) ( not ( = ?auto_267939 ?auto_267943 ) ) ( not ( = ?auto_267939 ?auto_267944 ) ) ( not ( = ?auto_267939 ?auto_267945 ) ) ( not ( = ?auto_267939 ?auto_267946 ) ) ( not ( = ?auto_267939 ?auto_267947 ) ) ( not ( = ?auto_267939 ?auto_267948 ) ) ( not ( = ?auto_267940 ?auto_267941 ) ) ( not ( = ?auto_267940 ?auto_267942 ) ) ( not ( = ?auto_267940 ?auto_267943 ) ) ( not ( = ?auto_267940 ?auto_267944 ) ) ( not ( = ?auto_267940 ?auto_267945 ) ) ( not ( = ?auto_267940 ?auto_267946 ) ) ( not ( = ?auto_267940 ?auto_267947 ) ) ( not ( = ?auto_267940 ?auto_267948 ) ) ( not ( = ?auto_267941 ?auto_267942 ) ) ( not ( = ?auto_267941 ?auto_267943 ) ) ( not ( = ?auto_267941 ?auto_267944 ) ) ( not ( = ?auto_267941 ?auto_267945 ) ) ( not ( = ?auto_267941 ?auto_267946 ) ) ( not ( = ?auto_267941 ?auto_267947 ) ) ( not ( = ?auto_267941 ?auto_267948 ) ) ( not ( = ?auto_267942 ?auto_267943 ) ) ( not ( = ?auto_267942 ?auto_267944 ) ) ( not ( = ?auto_267942 ?auto_267945 ) ) ( not ( = ?auto_267942 ?auto_267946 ) ) ( not ( = ?auto_267942 ?auto_267947 ) ) ( not ( = ?auto_267942 ?auto_267948 ) ) ( not ( = ?auto_267943 ?auto_267944 ) ) ( not ( = ?auto_267943 ?auto_267945 ) ) ( not ( = ?auto_267943 ?auto_267946 ) ) ( not ( = ?auto_267943 ?auto_267947 ) ) ( not ( = ?auto_267943 ?auto_267948 ) ) ( not ( = ?auto_267944 ?auto_267945 ) ) ( not ( = ?auto_267944 ?auto_267946 ) ) ( not ( = ?auto_267944 ?auto_267947 ) ) ( not ( = ?auto_267944 ?auto_267948 ) ) ( not ( = ?auto_267945 ?auto_267946 ) ) ( not ( = ?auto_267945 ?auto_267947 ) ) ( not ( = ?auto_267945 ?auto_267948 ) ) ( not ( = ?auto_267946 ?auto_267947 ) ) ( not ( = ?auto_267946 ?auto_267948 ) ) ( not ( = ?auto_267947 ?auto_267948 ) ) ( ON ?auto_267947 ?auto_267948 ) ( ON ?auto_267946 ?auto_267947 ) ( ON ?auto_267945 ?auto_267946 ) ( ON ?auto_267944 ?auto_267945 ) ( ON ?auto_267943 ?auto_267944 ) ( ON ?auto_267942 ?auto_267943 ) ( ON ?auto_267941 ?auto_267942 ) ( ON ?auto_267940 ?auto_267941 ) ( ON ?auto_267939 ?auto_267940 ) ( ON ?auto_267938 ?auto_267939 ) ( ON ?auto_267937 ?auto_267938 ) ( ON ?auto_267936 ?auto_267937 ) ( CLEAR ?auto_267936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_267936 )
      ( MAKE-13PILE ?auto_267936 ?auto_267937 ?auto_267938 ?auto_267939 ?auto_267940 ?auto_267941 ?auto_267942 ?auto_267943 ?auto_267944 ?auto_267945 ?auto_267946 ?auto_267947 ?auto_267948 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267962 - BLOCK
      ?auto_267963 - BLOCK
      ?auto_267964 - BLOCK
      ?auto_267965 - BLOCK
      ?auto_267966 - BLOCK
      ?auto_267967 - BLOCK
      ?auto_267968 - BLOCK
      ?auto_267969 - BLOCK
      ?auto_267970 - BLOCK
      ?auto_267971 - BLOCK
      ?auto_267972 - BLOCK
      ?auto_267973 - BLOCK
      ?auto_267974 - BLOCK
    )
    :vars
    (
      ?auto_267975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_267962 ?auto_267963 ) ) ( not ( = ?auto_267962 ?auto_267964 ) ) ( not ( = ?auto_267962 ?auto_267965 ) ) ( not ( = ?auto_267962 ?auto_267966 ) ) ( not ( = ?auto_267962 ?auto_267967 ) ) ( not ( = ?auto_267962 ?auto_267968 ) ) ( not ( = ?auto_267962 ?auto_267969 ) ) ( not ( = ?auto_267962 ?auto_267970 ) ) ( not ( = ?auto_267962 ?auto_267971 ) ) ( not ( = ?auto_267962 ?auto_267972 ) ) ( not ( = ?auto_267962 ?auto_267973 ) ) ( not ( = ?auto_267962 ?auto_267974 ) ) ( not ( = ?auto_267963 ?auto_267964 ) ) ( not ( = ?auto_267963 ?auto_267965 ) ) ( not ( = ?auto_267963 ?auto_267966 ) ) ( not ( = ?auto_267963 ?auto_267967 ) ) ( not ( = ?auto_267963 ?auto_267968 ) ) ( not ( = ?auto_267963 ?auto_267969 ) ) ( not ( = ?auto_267963 ?auto_267970 ) ) ( not ( = ?auto_267963 ?auto_267971 ) ) ( not ( = ?auto_267963 ?auto_267972 ) ) ( not ( = ?auto_267963 ?auto_267973 ) ) ( not ( = ?auto_267963 ?auto_267974 ) ) ( not ( = ?auto_267964 ?auto_267965 ) ) ( not ( = ?auto_267964 ?auto_267966 ) ) ( not ( = ?auto_267964 ?auto_267967 ) ) ( not ( = ?auto_267964 ?auto_267968 ) ) ( not ( = ?auto_267964 ?auto_267969 ) ) ( not ( = ?auto_267964 ?auto_267970 ) ) ( not ( = ?auto_267964 ?auto_267971 ) ) ( not ( = ?auto_267964 ?auto_267972 ) ) ( not ( = ?auto_267964 ?auto_267973 ) ) ( not ( = ?auto_267964 ?auto_267974 ) ) ( not ( = ?auto_267965 ?auto_267966 ) ) ( not ( = ?auto_267965 ?auto_267967 ) ) ( not ( = ?auto_267965 ?auto_267968 ) ) ( not ( = ?auto_267965 ?auto_267969 ) ) ( not ( = ?auto_267965 ?auto_267970 ) ) ( not ( = ?auto_267965 ?auto_267971 ) ) ( not ( = ?auto_267965 ?auto_267972 ) ) ( not ( = ?auto_267965 ?auto_267973 ) ) ( not ( = ?auto_267965 ?auto_267974 ) ) ( not ( = ?auto_267966 ?auto_267967 ) ) ( not ( = ?auto_267966 ?auto_267968 ) ) ( not ( = ?auto_267966 ?auto_267969 ) ) ( not ( = ?auto_267966 ?auto_267970 ) ) ( not ( = ?auto_267966 ?auto_267971 ) ) ( not ( = ?auto_267966 ?auto_267972 ) ) ( not ( = ?auto_267966 ?auto_267973 ) ) ( not ( = ?auto_267966 ?auto_267974 ) ) ( not ( = ?auto_267967 ?auto_267968 ) ) ( not ( = ?auto_267967 ?auto_267969 ) ) ( not ( = ?auto_267967 ?auto_267970 ) ) ( not ( = ?auto_267967 ?auto_267971 ) ) ( not ( = ?auto_267967 ?auto_267972 ) ) ( not ( = ?auto_267967 ?auto_267973 ) ) ( not ( = ?auto_267967 ?auto_267974 ) ) ( not ( = ?auto_267968 ?auto_267969 ) ) ( not ( = ?auto_267968 ?auto_267970 ) ) ( not ( = ?auto_267968 ?auto_267971 ) ) ( not ( = ?auto_267968 ?auto_267972 ) ) ( not ( = ?auto_267968 ?auto_267973 ) ) ( not ( = ?auto_267968 ?auto_267974 ) ) ( not ( = ?auto_267969 ?auto_267970 ) ) ( not ( = ?auto_267969 ?auto_267971 ) ) ( not ( = ?auto_267969 ?auto_267972 ) ) ( not ( = ?auto_267969 ?auto_267973 ) ) ( not ( = ?auto_267969 ?auto_267974 ) ) ( not ( = ?auto_267970 ?auto_267971 ) ) ( not ( = ?auto_267970 ?auto_267972 ) ) ( not ( = ?auto_267970 ?auto_267973 ) ) ( not ( = ?auto_267970 ?auto_267974 ) ) ( not ( = ?auto_267971 ?auto_267972 ) ) ( not ( = ?auto_267971 ?auto_267973 ) ) ( not ( = ?auto_267971 ?auto_267974 ) ) ( not ( = ?auto_267972 ?auto_267973 ) ) ( not ( = ?auto_267972 ?auto_267974 ) ) ( not ( = ?auto_267973 ?auto_267974 ) ) ( ON ?auto_267962 ?auto_267975 ) ( not ( = ?auto_267974 ?auto_267975 ) ) ( not ( = ?auto_267973 ?auto_267975 ) ) ( not ( = ?auto_267972 ?auto_267975 ) ) ( not ( = ?auto_267971 ?auto_267975 ) ) ( not ( = ?auto_267970 ?auto_267975 ) ) ( not ( = ?auto_267969 ?auto_267975 ) ) ( not ( = ?auto_267968 ?auto_267975 ) ) ( not ( = ?auto_267967 ?auto_267975 ) ) ( not ( = ?auto_267966 ?auto_267975 ) ) ( not ( = ?auto_267965 ?auto_267975 ) ) ( not ( = ?auto_267964 ?auto_267975 ) ) ( not ( = ?auto_267963 ?auto_267975 ) ) ( not ( = ?auto_267962 ?auto_267975 ) ) ( ON ?auto_267963 ?auto_267962 ) ( ON ?auto_267964 ?auto_267963 ) ( ON ?auto_267965 ?auto_267964 ) ( ON ?auto_267966 ?auto_267965 ) ( ON ?auto_267967 ?auto_267966 ) ( ON ?auto_267968 ?auto_267967 ) ( ON ?auto_267969 ?auto_267968 ) ( ON ?auto_267970 ?auto_267969 ) ( ON ?auto_267971 ?auto_267970 ) ( ON ?auto_267972 ?auto_267971 ) ( ON ?auto_267973 ?auto_267972 ) ( ON ?auto_267974 ?auto_267973 ) ( CLEAR ?auto_267974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_267974 ?auto_267973 ?auto_267972 ?auto_267971 ?auto_267970 ?auto_267969 ?auto_267968 ?auto_267967 ?auto_267966 ?auto_267965 ?auto_267964 ?auto_267963 ?auto_267962 )
      ( MAKE-13PILE ?auto_267962 ?auto_267963 ?auto_267964 ?auto_267965 ?auto_267966 ?auto_267967 ?auto_267968 ?auto_267969 ?auto_267970 ?auto_267971 ?auto_267972 ?auto_267973 ?auto_267974 ) )
  )

)

