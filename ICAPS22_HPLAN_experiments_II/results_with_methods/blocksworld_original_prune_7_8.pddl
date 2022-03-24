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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86623 - BLOCK
      ?auto_86624 - BLOCK
      ?auto_86625 - BLOCK
      ?auto_86626 - BLOCK
      ?auto_86627 - BLOCK
      ?auto_86628 - BLOCK
      ?auto_86629 - BLOCK
    )
    :vars
    (
      ?auto_86630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86630 ?auto_86629 ) ( CLEAR ?auto_86630 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86623 ) ( ON ?auto_86624 ?auto_86623 ) ( ON ?auto_86625 ?auto_86624 ) ( ON ?auto_86626 ?auto_86625 ) ( ON ?auto_86627 ?auto_86626 ) ( ON ?auto_86628 ?auto_86627 ) ( ON ?auto_86629 ?auto_86628 ) ( not ( = ?auto_86623 ?auto_86624 ) ) ( not ( = ?auto_86623 ?auto_86625 ) ) ( not ( = ?auto_86623 ?auto_86626 ) ) ( not ( = ?auto_86623 ?auto_86627 ) ) ( not ( = ?auto_86623 ?auto_86628 ) ) ( not ( = ?auto_86623 ?auto_86629 ) ) ( not ( = ?auto_86623 ?auto_86630 ) ) ( not ( = ?auto_86624 ?auto_86625 ) ) ( not ( = ?auto_86624 ?auto_86626 ) ) ( not ( = ?auto_86624 ?auto_86627 ) ) ( not ( = ?auto_86624 ?auto_86628 ) ) ( not ( = ?auto_86624 ?auto_86629 ) ) ( not ( = ?auto_86624 ?auto_86630 ) ) ( not ( = ?auto_86625 ?auto_86626 ) ) ( not ( = ?auto_86625 ?auto_86627 ) ) ( not ( = ?auto_86625 ?auto_86628 ) ) ( not ( = ?auto_86625 ?auto_86629 ) ) ( not ( = ?auto_86625 ?auto_86630 ) ) ( not ( = ?auto_86626 ?auto_86627 ) ) ( not ( = ?auto_86626 ?auto_86628 ) ) ( not ( = ?auto_86626 ?auto_86629 ) ) ( not ( = ?auto_86626 ?auto_86630 ) ) ( not ( = ?auto_86627 ?auto_86628 ) ) ( not ( = ?auto_86627 ?auto_86629 ) ) ( not ( = ?auto_86627 ?auto_86630 ) ) ( not ( = ?auto_86628 ?auto_86629 ) ) ( not ( = ?auto_86628 ?auto_86630 ) ) ( not ( = ?auto_86629 ?auto_86630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86630 ?auto_86629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86632 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_86632 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_86632 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86633 - BLOCK
    )
    :vars
    (
      ?auto_86634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86633 ?auto_86634 ) ( CLEAR ?auto_86633 ) ( HAND-EMPTY ) ( not ( = ?auto_86633 ?auto_86634 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86633 ?auto_86634 )
      ( MAKE-1PILE ?auto_86633 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86641 - BLOCK
      ?auto_86642 - BLOCK
      ?auto_86643 - BLOCK
      ?auto_86644 - BLOCK
      ?auto_86645 - BLOCK
      ?auto_86646 - BLOCK
    )
    :vars
    (
      ?auto_86647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86647 ?auto_86646 ) ( CLEAR ?auto_86647 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86641 ) ( ON ?auto_86642 ?auto_86641 ) ( ON ?auto_86643 ?auto_86642 ) ( ON ?auto_86644 ?auto_86643 ) ( ON ?auto_86645 ?auto_86644 ) ( ON ?auto_86646 ?auto_86645 ) ( not ( = ?auto_86641 ?auto_86642 ) ) ( not ( = ?auto_86641 ?auto_86643 ) ) ( not ( = ?auto_86641 ?auto_86644 ) ) ( not ( = ?auto_86641 ?auto_86645 ) ) ( not ( = ?auto_86641 ?auto_86646 ) ) ( not ( = ?auto_86641 ?auto_86647 ) ) ( not ( = ?auto_86642 ?auto_86643 ) ) ( not ( = ?auto_86642 ?auto_86644 ) ) ( not ( = ?auto_86642 ?auto_86645 ) ) ( not ( = ?auto_86642 ?auto_86646 ) ) ( not ( = ?auto_86642 ?auto_86647 ) ) ( not ( = ?auto_86643 ?auto_86644 ) ) ( not ( = ?auto_86643 ?auto_86645 ) ) ( not ( = ?auto_86643 ?auto_86646 ) ) ( not ( = ?auto_86643 ?auto_86647 ) ) ( not ( = ?auto_86644 ?auto_86645 ) ) ( not ( = ?auto_86644 ?auto_86646 ) ) ( not ( = ?auto_86644 ?auto_86647 ) ) ( not ( = ?auto_86645 ?auto_86646 ) ) ( not ( = ?auto_86645 ?auto_86647 ) ) ( not ( = ?auto_86646 ?auto_86647 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86647 ?auto_86646 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86648 - BLOCK
      ?auto_86649 - BLOCK
      ?auto_86650 - BLOCK
      ?auto_86651 - BLOCK
      ?auto_86652 - BLOCK
      ?auto_86653 - BLOCK
    )
    :vars
    (
      ?auto_86654 - BLOCK
      ?auto_86655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86654 ?auto_86653 ) ( CLEAR ?auto_86654 ) ( ON-TABLE ?auto_86648 ) ( ON ?auto_86649 ?auto_86648 ) ( ON ?auto_86650 ?auto_86649 ) ( ON ?auto_86651 ?auto_86650 ) ( ON ?auto_86652 ?auto_86651 ) ( ON ?auto_86653 ?auto_86652 ) ( not ( = ?auto_86648 ?auto_86649 ) ) ( not ( = ?auto_86648 ?auto_86650 ) ) ( not ( = ?auto_86648 ?auto_86651 ) ) ( not ( = ?auto_86648 ?auto_86652 ) ) ( not ( = ?auto_86648 ?auto_86653 ) ) ( not ( = ?auto_86648 ?auto_86654 ) ) ( not ( = ?auto_86649 ?auto_86650 ) ) ( not ( = ?auto_86649 ?auto_86651 ) ) ( not ( = ?auto_86649 ?auto_86652 ) ) ( not ( = ?auto_86649 ?auto_86653 ) ) ( not ( = ?auto_86649 ?auto_86654 ) ) ( not ( = ?auto_86650 ?auto_86651 ) ) ( not ( = ?auto_86650 ?auto_86652 ) ) ( not ( = ?auto_86650 ?auto_86653 ) ) ( not ( = ?auto_86650 ?auto_86654 ) ) ( not ( = ?auto_86651 ?auto_86652 ) ) ( not ( = ?auto_86651 ?auto_86653 ) ) ( not ( = ?auto_86651 ?auto_86654 ) ) ( not ( = ?auto_86652 ?auto_86653 ) ) ( not ( = ?auto_86652 ?auto_86654 ) ) ( not ( = ?auto_86653 ?auto_86654 ) ) ( HOLDING ?auto_86655 ) ( not ( = ?auto_86648 ?auto_86655 ) ) ( not ( = ?auto_86649 ?auto_86655 ) ) ( not ( = ?auto_86650 ?auto_86655 ) ) ( not ( = ?auto_86651 ?auto_86655 ) ) ( not ( = ?auto_86652 ?auto_86655 ) ) ( not ( = ?auto_86653 ?auto_86655 ) ) ( not ( = ?auto_86654 ?auto_86655 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_86655 )
      ( MAKE-6PILE ?auto_86648 ?auto_86649 ?auto_86650 ?auto_86651 ?auto_86652 ?auto_86653 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86656 - BLOCK
      ?auto_86657 - BLOCK
      ?auto_86658 - BLOCK
      ?auto_86659 - BLOCK
      ?auto_86660 - BLOCK
      ?auto_86661 - BLOCK
    )
    :vars
    (
      ?auto_86663 - BLOCK
      ?auto_86662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86663 ?auto_86661 ) ( ON-TABLE ?auto_86656 ) ( ON ?auto_86657 ?auto_86656 ) ( ON ?auto_86658 ?auto_86657 ) ( ON ?auto_86659 ?auto_86658 ) ( ON ?auto_86660 ?auto_86659 ) ( ON ?auto_86661 ?auto_86660 ) ( not ( = ?auto_86656 ?auto_86657 ) ) ( not ( = ?auto_86656 ?auto_86658 ) ) ( not ( = ?auto_86656 ?auto_86659 ) ) ( not ( = ?auto_86656 ?auto_86660 ) ) ( not ( = ?auto_86656 ?auto_86661 ) ) ( not ( = ?auto_86656 ?auto_86663 ) ) ( not ( = ?auto_86657 ?auto_86658 ) ) ( not ( = ?auto_86657 ?auto_86659 ) ) ( not ( = ?auto_86657 ?auto_86660 ) ) ( not ( = ?auto_86657 ?auto_86661 ) ) ( not ( = ?auto_86657 ?auto_86663 ) ) ( not ( = ?auto_86658 ?auto_86659 ) ) ( not ( = ?auto_86658 ?auto_86660 ) ) ( not ( = ?auto_86658 ?auto_86661 ) ) ( not ( = ?auto_86658 ?auto_86663 ) ) ( not ( = ?auto_86659 ?auto_86660 ) ) ( not ( = ?auto_86659 ?auto_86661 ) ) ( not ( = ?auto_86659 ?auto_86663 ) ) ( not ( = ?auto_86660 ?auto_86661 ) ) ( not ( = ?auto_86660 ?auto_86663 ) ) ( not ( = ?auto_86661 ?auto_86663 ) ) ( not ( = ?auto_86656 ?auto_86662 ) ) ( not ( = ?auto_86657 ?auto_86662 ) ) ( not ( = ?auto_86658 ?auto_86662 ) ) ( not ( = ?auto_86659 ?auto_86662 ) ) ( not ( = ?auto_86660 ?auto_86662 ) ) ( not ( = ?auto_86661 ?auto_86662 ) ) ( not ( = ?auto_86663 ?auto_86662 ) ) ( ON ?auto_86662 ?auto_86663 ) ( CLEAR ?auto_86662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86656 ?auto_86657 ?auto_86658 ?auto_86659 ?auto_86660 ?auto_86661 ?auto_86663 )
      ( MAKE-6PILE ?auto_86656 ?auto_86657 ?auto_86658 ?auto_86659 ?auto_86660 ?auto_86661 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86666 - BLOCK
      ?auto_86667 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_86667 ) ( CLEAR ?auto_86666 ) ( ON-TABLE ?auto_86666 ) ( not ( = ?auto_86666 ?auto_86667 ) ) )
    :subtasks
    ( ( !STACK ?auto_86667 ?auto_86666 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86668 - BLOCK
      ?auto_86669 - BLOCK
    )
    :vars
    (
      ?auto_86670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86668 ) ( ON-TABLE ?auto_86668 ) ( not ( = ?auto_86668 ?auto_86669 ) ) ( ON ?auto_86669 ?auto_86670 ) ( CLEAR ?auto_86669 ) ( HAND-EMPTY ) ( not ( = ?auto_86668 ?auto_86670 ) ) ( not ( = ?auto_86669 ?auto_86670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86669 ?auto_86670 )
      ( MAKE-2PILE ?auto_86668 ?auto_86669 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86671 - BLOCK
      ?auto_86672 - BLOCK
    )
    :vars
    (
      ?auto_86673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86671 ?auto_86672 ) ) ( ON ?auto_86672 ?auto_86673 ) ( CLEAR ?auto_86672 ) ( not ( = ?auto_86671 ?auto_86673 ) ) ( not ( = ?auto_86672 ?auto_86673 ) ) ( HOLDING ?auto_86671 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86671 )
      ( MAKE-2PILE ?auto_86671 ?auto_86672 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86674 - BLOCK
      ?auto_86675 - BLOCK
    )
    :vars
    (
      ?auto_86676 - BLOCK
      ?auto_86680 - BLOCK
      ?auto_86678 - BLOCK
      ?auto_86679 - BLOCK
      ?auto_86681 - BLOCK
      ?auto_86677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86674 ?auto_86675 ) ) ( ON ?auto_86675 ?auto_86676 ) ( not ( = ?auto_86674 ?auto_86676 ) ) ( not ( = ?auto_86675 ?auto_86676 ) ) ( ON ?auto_86674 ?auto_86675 ) ( CLEAR ?auto_86674 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86680 ) ( ON ?auto_86678 ?auto_86680 ) ( ON ?auto_86679 ?auto_86678 ) ( ON ?auto_86681 ?auto_86679 ) ( ON ?auto_86677 ?auto_86681 ) ( ON ?auto_86676 ?auto_86677 ) ( not ( = ?auto_86680 ?auto_86678 ) ) ( not ( = ?auto_86680 ?auto_86679 ) ) ( not ( = ?auto_86680 ?auto_86681 ) ) ( not ( = ?auto_86680 ?auto_86677 ) ) ( not ( = ?auto_86680 ?auto_86676 ) ) ( not ( = ?auto_86680 ?auto_86675 ) ) ( not ( = ?auto_86680 ?auto_86674 ) ) ( not ( = ?auto_86678 ?auto_86679 ) ) ( not ( = ?auto_86678 ?auto_86681 ) ) ( not ( = ?auto_86678 ?auto_86677 ) ) ( not ( = ?auto_86678 ?auto_86676 ) ) ( not ( = ?auto_86678 ?auto_86675 ) ) ( not ( = ?auto_86678 ?auto_86674 ) ) ( not ( = ?auto_86679 ?auto_86681 ) ) ( not ( = ?auto_86679 ?auto_86677 ) ) ( not ( = ?auto_86679 ?auto_86676 ) ) ( not ( = ?auto_86679 ?auto_86675 ) ) ( not ( = ?auto_86679 ?auto_86674 ) ) ( not ( = ?auto_86681 ?auto_86677 ) ) ( not ( = ?auto_86681 ?auto_86676 ) ) ( not ( = ?auto_86681 ?auto_86675 ) ) ( not ( = ?auto_86681 ?auto_86674 ) ) ( not ( = ?auto_86677 ?auto_86676 ) ) ( not ( = ?auto_86677 ?auto_86675 ) ) ( not ( = ?auto_86677 ?auto_86674 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86680 ?auto_86678 ?auto_86679 ?auto_86681 ?auto_86677 ?auto_86676 ?auto_86675 )
      ( MAKE-2PILE ?auto_86674 ?auto_86675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86687 - BLOCK
      ?auto_86688 - BLOCK
      ?auto_86689 - BLOCK
      ?auto_86690 - BLOCK
      ?auto_86691 - BLOCK
    )
    :vars
    (
      ?auto_86692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86692 ?auto_86691 ) ( CLEAR ?auto_86692 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86687 ) ( ON ?auto_86688 ?auto_86687 ) ( ON ?auto_86689 ?auto_86688 ) ( ON ?auto_86690 ?auto_86689 ) ( ON ?auto_86691 ?auto_86690 ) ( not ( = ?auto_86687 ?auto_86688 ) ) ( not ( = ?auto_86687 ?auto_86689 ) ) ( not ( = ?auto_86687 ?auto_86690 ) ) ( not ( = ?auto_86687 ?auto_86691 ) ) ( not ( = ?auto_86687 ?auto_86692 ) ) ( not ( = ?auto_86688 ?auto_86689 ) ) ( not ( = ?auto_86688 ?auto_86690 ) ) ( not ( = ?auto_86688 ?auto_86691 ) ) ( not ( = ?auto_86688 ?auto_86692 ) ) ( not ( = ?auto_86689 ?auto_86690 ) ) ( not ( = ?auto_86689 ?auto_86691 ) ) ( not ( = ?auto_86689 ?auto_86692 ) ) ( not ( = ?auto_86690 ?auto_86691 ) ) ( not ( = ?auto_86690 ?auto_86692 ) ) ( not ( = ?auto_86691 ?auto_86692 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86692 ?auto_86691 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86693 - BLOCK
      ?auto_86694 - BLOCK
      ?auto_86695 - BLOCK
      ?auto_86696 - BLOCK
      ?auto_86697 - BLOCK
    )
    :vars
    (
      ?auto_86698 - BLOCK
      ?auto_86699 - BLOCK
      ?auto_86700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86698 ?auto_86697 ) ( CLEAR ?auto_86698 ) ( ON-TABLE ?auto_86693 ) ( ON ?auto_86694 ?auto_86693 ) ( ON ?auto_86695 ?auto_86694 ) ( ON ?auto_86696 ?auto_86695 ) ( ON ?auto_86697 ?auto_86696 ) ( not ( = ?auto_86693 ?auto_86694 ) ) ( not ( = ?auto_86693 ?auto_86695 ) ) ( not ( = ?auto_86693 ?auto_86696 ) ) ( not ( = ?auto_86693 ?auto_86697 ) ) ( not ( = ?auto_86693 ?auto_86698 ) ) ( not ( = ?auto_86694 ?auto_86695 ) ) ( not ( = ?auto_86694 ?auto_86696 ) ) ( not ( = ?auto_86694 ?auto_86697 ) ) ( not ( = ?auto_86694 ?auto_86698 ) ) ( not ( = ?auto_86695 ?auto_86696 ) ) ( not ( = ?auto_86695 ?auto_86697 ) ) ( not ( = ?auto_86695 ?auto_86698 ) ) ( not ( = ?auto_86696 ?auto_86697 ) ) ( not ( = ?auto_86696 ?auto_86698 ) ) ( not ( = ?auto_86697 ?auto_86698 ) ) ( HOLDING ?auto_86699 ) ( CLEAR ?auto_86700 ) ( not ( = ?auto_86693 ?auto_86699 ) ) ( not ( = ?auto_86693 ?auto_86700 ) ) ( not ( = ?auto_86694 ?auto_86699 ) ) ( not ( = ?auto_86694 ?auto_86700 ) ) ( not ( = ?auto_86695 ?auto_86699 ) ) ( not ( = ?auto_86695 ?auto_86700 ) ) ( not ( = ?auto_86696 ?auto_86699 ) ) ( not ( = ?auto_86696 ?auto_86700 ) ) ( not ( = ?auto_86697 ?auto_86699 ) ) ( not ( = ?auto_86697 ?auto_86700 ) ) ( not ( = ?auto_86698 ?auto_86699 ) ) ( not ( = ?auto_86698 ?auto_86700 ) ) ( not ( = ?auto_86699 ?auto_86700 ) ) )
    :subtasks
    ( ( !STACK ?auto_86699 ?auto_86700 )
      ( MAKE-5PILE ?auto_86693 ?auto_86694 ?auto_86695 ?auto_86696 ?auto_86697 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87619 - BLOCK
      ?auto_87620 - BLOCK
      ?auto_87621 - BLOCK
      ?auto_87622 - BLOCK
      ?auto_87623 - BLOCK
    )
    :vars
    (
      ?auto_87625 - BLOCK
      ?auto_87624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87625 ?auto_87623 ) ( ON-TABLE ?auto_87619 ) ( ON ?auto_87620 ?auto_87619 ) ( ON ?auto_87621 ?auto_87620 ) ( ON ?auto_87622 ?auto_87621 ) ( ON ?auto_87623 ?auto_87622 ) ( not ( = ?auto_87619 ?auto_87620 ) ) ( not ( = ?auto_87619 ?auto_87621 ) ) ( not ( = ?auto_87619 ?auto_87622 ) ) ( not ( = ?auto_87619 ?auto_87623 ) ) ( not ( = ?auto_87619 ?auto_87625 ) ) ( not ( = ?auto_87620 ?auto_87621 ) ) ( not ( = ?auto_87620 ?auto_87622 ) ) ( not ( = ?auto_87620 ?auto_87623 ) ) ( not ( = ?auto_87620 ?auto_87625 ) ) ( not ( = ?auto_87621 ?auto_87622 ) ) ( not ( = ?auto_87621 ?auto_87623 ) ) ( not ( = ?auto_87621 ?auto_87625 ) ) ( not ( = ?auto_87622 ?auto_87623 ) ) ( not ( = ?auto_87622 ?auto_87625 ) ) ( not ( = ?auto_87623 ?auto_87625 ) ) ( not ( = ?auto_87619 ?auto_87624 ) ) ( not ( = ?auto_87620 ?auto_87624 ) ) ( not ( = ?auto_87621 ?auto_87624 ) ) ( not ( = ?auto_87622 ?auto_87624 ) ) ( not ( = ?auto_87623 ?auto_87624 ) ) ( not ( = ?auto_87625 ?auto_87624 ) ) ( ON ?auto_87624 ?auto_87625 ) ( CLEAR ?auto_87624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87619 ?auto_87620 ?auto_87621 ?auto_87622 ?auto_87623 ?auto_87625 )
      ( MAKE-5PILE ?auto_87619 ?auto_87620 ?auto_87621 ?auto_87622 ?auto_87623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86709 - BLOCK
      ?auto_86710 - BLOCK
      ?auto_86711 - BLOCK
      ?auto_86712 - BLOCK
      ?auto_86713 - BLOCK
    )
    :vars
    (
      ?auto_86716 - BLOCK
      ?auto_86715 - BLOCK
      ?auto_86714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86716 ?auto_86713 ) ( ON-TABLE ?auto_86709 ) ( ON ?auto_86710 ?auto_86709 ) ( ON ?auto_86711 ?auto_86710 ) ( ON ?auto_86712 ?auto_86711 ) ( ON ?auto_86713 ?auto_86712 ) ( not ( = ?auto_86709 ?auto_86710 ) ) ( not ( = ?auto_86709 ?auto_86711 ) ) ( not ( = ?auto_86709 ?auto_86712 ) ) ( not ( = ?auto_86709 ?auto_86713 ) ) ( not ( = ?auto_86709 ?auto_86716 ) ) ( not ( = ?auto_86710 ?auto_86711 ) ) ( not ( = ?auto_86710 ?auto_86712 ) ) ( not ( = ?auto_86710 ?auto_86713 ) ) ( not ( = ?auto_86710 ?auto_86716 ) ) ( not ( = ?auto_86711 ?auto_86712 ) ) ( not ( = ?auto_86711 ?auto_86713 ) ) ( not ( = ?auto_86711 ?auto_86716 ) ) ( not ( = ?auto_86712 ?auto_86713 ) ) ( not ( = ?auto_86712 ?auto_86716 ) ) ( not ( = ?auto_86713 ?auto_86716 ) ) ( not ( = ?auto_86709 ?auto_86715 ) ) ( not ( = ?auto_86709 ?auto_86714 ) ) ( not ( = ?auto_86710 ?auto_86715 ) ) ( not ( = ?auto_86710 ?auto_86714 ) ) ( not ( = ?auto_86711 ?auto_86715 ) ) ( not ( = ?auto_86711 ?auto_86714 ) ) ( not ( = ?auto_86712 ?auto_86715 ) ) ( not ( = ?auto_86712 ?auto_86714 ) ) ( not ( = ?auto_86713 ?auto_86715 ) ) ( not ( = ?auto_86713 ?auto_86714 ) ) ( not ( = ?auto_86716 ?auto_86715 ) ) ( not ( = ?auto_86716 ?auto_86714 ) ) ( not ( = ?auto_86715 ?auto_86714 ) ) ( ON ?auto_86715 ?auto_86716 ) ( CLEAR ?auto_86715 ) ( HOLDING ?auto_86714 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86714 )
      ( MAKE-5PILE ?auto_86709 ?auto_86710 ?auto_86711 ?auto_86712 ?auto_86713 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86717 - BLOCK
      ?auto_86718 - BLOCK
      ?auto_86719 - BLOCK
      ?auto_86720 - BLOCK
      ?auto_86721 - BLOCK
    )
    :vars
    (
      ?auto_86724 - BLOCK
      ?auto_86723 - BLOCK
      ?auto_86722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86724 ?auto_86721 ) ( ON-TABLE ?auto_86717 ) ( ON ?auto_86718 ?auto_86717 ) ( ON ?auto_86719 ?auto_86718 ) ( ON ?auto_86720 ?auto_86719 ) ( ON ?auto_86721 ?auto_86720 ) ( not ( = ?auto_86717 ?auto_86718 ) ) ( not ( = ?auto_86717 ?auto_86719 ) ) ( not ( = ?auto_86717 ?auto_86720 ) ) ( not ( = ?auto_86717 ?auto_86721 ) ) ( not ( = ?auto_86717 ?auto_86724 ) ) ( not ( = ?auto_86718 ?auto_86719 ) ) ( not ( = ?auto_86718 ?auto_86720 ) ) ( not ( = ?auto_86718 ?auto_86721 ) ) ( not ( = ?auto_86718 ?auto_86724 ) ) ( not ( = ?auto_86719 ?auto_86720 ) ) ( not ( = ?auto_86719 ?auto_86721 ) ) ( not ( = ?auto_86719 ?auto_86724 ) ) ( not ( = ?auto_86720 ?auto_86721 ) ) ( not ( = ?auto_86720 ?auto_86724 ) ) ( not ( = ?auto_86721 ?auto_86724 ) ) ( not ( = ?auto_86717 ?auto_86723 ) ) ( not ( = ?auto_86717 ?auto_86722 ) ) ( not ( = ?auto_86718 ?auto_86723 ) ) ( not ( = ?auto_86718 ?auto_86722 ) ) ( not ( = ?auto_86719 ?auto_86723 ) ) ( not ( = ?auto_86719 ?auto_86722 ) ) ( not ( = ?auto_86720 ?auto_86723 ) ) ( not ( = ?auto_86720 ?auto_86722 ) ) ( not ( = ?auto_86721 ?auto_86723 ) ) ( not ( = ?auto_86721 ?auto_86722 ) ) ( not ( = ?auto_86724 ?auto_86723 ) ) ( not ( = ?auto_86724 ?auto_86722 ) ) ( not ( = ?auto_86723 ?auto_86722 ) ) ( ON ?auto_86723 ?auto_86724 ) ( ON ?auto_86722 ?auto_86723 ) ( CLEAR ?auto_86722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86717 ?auto_86718 ?auto_86719 ?auto_86720 ?auto_86721 ?auto_86724 ?auto_86723 )
      ( MAKE-5PILE ?auto_86717 ?auto_86718 ?auto_86719 ?auto_86720 ?auto_86721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86728 - BLOCK
      ?auto_86729 - BLOCK
      ?auto_86730 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_86730 ) ( CLEAR ?auto_86729 ) ( ON-TABLE ?auto_86728 ) ( ON ?auto_86729 ?auto_86728 ) ( not ( = ?auto_86728 ?auto_86729 ) ) ( not ( = ?auto_86728 ?auto_86730 ) ) ( not ( = ?auto_86729 ?auto_86730 ) ) )
    :subtasks
    ( ( !STACK ?auto_86730 ?auto_86729 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86731 - BLOCK
      ?auto_86732 - BLOCK
      ?auto_86733 - BLOCK
    )
    :vars
    (
      ?auto_86734 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86732 ) ( ON-TABLE ?auto_86731 ) ( ON ?auto_86732 ?auto_86731 ) ( not ( = ?auto_86731 ?auto_86732 ) ) ( not ( = ?auto_86731 ?auto_86733 ) ) ( not ( = ?auto_86732 ?auto_86733 ) ) ( ON ?auto_86733 ?auto_86734 ) ( CLEAR ?auto_86733 ) ( HAND-EMPTY ) ( not ( = ?auto_86731 ?auto_86734 ) ) ( not ( = ?auto_86732 ?auto_86734 ) ) ( not ( = ?auto_86733 ?auto_86734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86733 ?auto_86734 )
      ( MAKE-3PILE ?auto_86731 ?auto_86732 ?auto_86733 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86735 - BLOCK
      ?auto_86736 - BLOCK
      ?auto_86737 - BLOCK
    )
    :vars
    (
      ?auto_86738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86735 ) ( not ( = ?auto_86735 ?auto_86736 ) ) ( not ( = ?auto_86735 ?auto_86737 ) ) ( not ( = ?auto_86736 ?auto_86737 ) ) ( ON ?auto_86737 ?auto_86738 ) ( CLEAR ?auto_86737 ) ( not ( = ?auto_86735 ?auto_86738 ) ) ( not ( = ?auto_86736 ?auto_86738 ) ) ( not ( = ?auto_86737 ?auto_86738 ) ) ( HOLDING ?auto_86736 ) ( CLEAR ?auto_86735 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86735 ?auto_86736 )
      ( MAKE-3PILE ?auto_86735 ?auto_86736 ?auto_86737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86739 - BLOCK
      ?auto_86740 - BLOCK
      ?auto_86741 - BLOCK
    )
    :vars
    (
      ?auto_86742 - BLOCK
      ?auto_86743 - BLOCK
      ?auto_86746 - BLOCK
      ?auto_86745 - BLOCK
      ?auto_86744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86739 ) ( not ( = ?auto_86739 ?auto_86740 ) ) ( not ( = ?auto_86739 ?auto_86741 ) ) ( not ( = ?auto_86740 ?auto_86741 ) ) ( ON ?auto_86741 ?auto_86742 ) ( not ( = ?auto_86739 ?auto_86742 ) ) ( not ( = ?auto_86740 ?auto_86742 ) ) ( not ( = ?auto_86741 ?auto_86742 ) ) ( CLEAR ?auto_86739 ) ( ON ?auto_86740 ?auto_86741 ) ( CLEAR ?auto_86740 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86743 ) ( ON ?auto_86746 ?auto_86743 ) ( ON ?auto_86745 ?auto_86746 ) ( ON ?auto_86744 ?auto_86745 ) ( ON ?auto_86742 ?auto_86744 ) ( not ( = ?auto_86743 ?auto_86746 ) ) ( not ( = ?auto_86743 ?auto_86745 ) ) ( not ( = ?auto_86743 ?auto_86744 ) ) ( not ( = ?auto_86743 ?auto_86742 ) ) ( not ( = ?auto_86743 ?auto_86741 ) ) ( not ( = ?auto_86743 ?auto_86740 ) ) ( not ( = ?auto_86746 ?auto_86745 ) ) ( not ( = ?auto_86746 ?auto_86744 ) ) ( not ( = ?auto_86746 ?auto_86742 ) ) ( not ( = ?auto_86746 ?auto_86741 ) ) ( not ( = ?auto_86746 ?auto_86740 ) ) ( not ( = ?auto_86745 ?auto_86744 ) ) ( not ( = ?auto_86745 ?auto_86742 ) ) ( not ( = ?auto_86745 ?auto_86741 ) ) ( not ( = ?auto_86745 ?auto_86740 ) ) ( not ( = ?auto_86744 ?auto_86742 ) ) ( not ( = ?auto_86744 ?auto_86741 ) ) ( not ( = ?auto_86744 ?auto_86740 ) ) ( not ( = ?auto_86739 ?auto_86743 ) ) ( not ( = ?auto_86739 ?auto_86746 ) ) ( not ( = ?auto_86739 ?auto_86745 ) ) ( not ( = ?auto_86739 ?auto_86744 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86743 ?auto_86746 ?auto_86745 ?auto_86744 ?auto_86742 ?auto_86741 )
      ( MAKE-3PILE ?auto_86739 ?auto_86740 ?auto_86741 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86747 - BLOCK
      ?auto_86748 - BLOCK
      ?auto_86749 - BLOCK
    )
    :vars
    (
      ?auto_86754 - BLOCK
      ?auto_86750 - BLOCK
      ?auto_86752 - BLOCK
      ?auto_86751 - BLOCK
      ?auto_86753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86747 ?auto_86748 ) ) ( not ( = ?auto_86747 ?auto_86749 ) ) ( not ( = ?auto_86748 ?auto_86749 ) ) ( ON ?auto_86749 ?auto_86754 ) ( not ( = ?auto_86747 ?auto_86754 ) ) ( not ( = ?auto_86748 ?auto_86754 ) ) ( not ( = ?auto_86749 ?auto_86754 ) ) ( ON ?auto_86748 ?auto_86749 ) ( CLEAR ?auto_86748 ) ( ON-TABLE ?auto_86750 ) ( ON ?auto_86752 ?auto_86750 ) ( ON ?auto_86751 ?auto_86752 ) ( ON ?auto_86753 ?auto_86751 ) ( ON ?auto_86754 ?auto_86753 ) ( not ( = ?auto_86750 ?auto_86752 ) ) ( not ( = ?auto_86750 ?auto_86751 ) ) ( not ( = ?auto_86750 ?auto_86753 ) ) ( not ( = ?auto_86750 ?auto_86754 ) ) ( not ( = ?auto_86750 ?auto_86749 ) ) ( not ( = ?auto_86750 ?auto_86748 ) ) ( not ( = ?auto_86752 ?auto_86751 ) ) ( not ( = ?auto_86752 ?auto_86753 ) ) ( not ( = ?auto_86752 ?auto_86754 ) ) ( not ( = ?auto_86752 ?auto_86749 ) ) ( not ( = ?auto_86752 ?auto_86748 ) ) ( not ( = ?auto_86751 ?auto_86753 ) ) ( not ( = ?auto_86751 ?auto_86754 ) ) ( not ( = ?auto_86751 ?auto_86749 ) ) ( not ( = ?auto_86751 ?auto_86748 ) ) ( not ( = ?auto_86753 ?auto_86754 ) ) ( not ( = ?auto_86753 ?auto_86749 ) ) ( not ( = ?auto_86753 ?auto_86748 ) ) ( not ( = ?auto_86747 ?auto_86750 ) ) ( not ( = ?auto_86747 ?auto_86752 ) ) ( not ( = ?auto_86747 ?auto_86751 ) ) ( not ( = ?auto_86747 ?auto_86753 ) ) ( HOLDING ?auto_86747 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86747 )
      ( MAKE-3PILE ?auto_86747 ?auto_86748 ?auto_86749 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86755 - BLOCK
      ?auto_86756 - BLOCK
      ?auto_86757 - BLOCK
    )
    :vars
    (
      ?auto_86759 - BLOCK
      ?auto_86760 - BLOCK
      ?auto_86758 - BLOCK
      ?auto_86762 - BLOCK
      ?auto_86761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86755 ?auto_86756 ) ) ( not ( = ?auto_86755 ?auto_86757 ) ) ( not ( = ?auto_86756 ?auto_86757 ) ) ( ON ?auto_86757 ?auto_86759 ) ( not ( = ?auto_86755 ?auto_86759 ) ) ( not ( = ?auto_86756 ?auto_86759 ) ) ( not ( = ?auto_86757 ?auto_86759 ) ) ( ON ?auto_86756 ?auto_86757 ) ( ON-TABLE ?auto_86760 ) ( ON ?auto_86758 ?auto_86760 ) ( ON ?auto_86762 ?auto_86758 ) ( ON ?auto_86761 ?auto_86762 ) ( ON ?auto_86759 ?auto_86761 ) ( not ( = ?auto_86760 ?auto_86758 ) ) ( not ( = ?auto_86760 ?auto_86762 ) ) ( not ( = ?auto_86760 ?auto_86761 ) ) ( not ( = ?auto_86760 ?auto_86759 ) ) ( not ( = ?auto_86760 ?auto_86757 ) ) ( not ( = ?auto_86760 ?auto_86756 ) ) ( not ( = ?auto_86758 ?auto_86762 ) ) ( not ( = ?auto_86758 ?auto_86761 ) ) ( not ( = ?auto_86758 ?auto_86759 ) ) ( not ( = ?auto_86758 ?auto_86757 ) ) ( not ( = ?auto_86758 ?auto_86756 ) ) ( not ( = ?auto_86762 ?auto_86761 ) ) ( not ( = ?auto_86762 ?auto_86759 ) ) ( not ( = ?auto_86762 ?auto_86757 ) ) ( not ( = ?auto_86762 ?auto_86756 ) ) ( not ( = ?auto_86761 ?auto_86759 ) ) ( not ( = ?auto_86761 ?auto_86757 ) ) ( not ( = ?auto_86761 ?auto_86756 ) ) ( not ( = ?auto_86755 ?auto_86760 ) ) ( not ( = ?auto_86755 ?auto_86758 ) ) ( not ( = ?auto_86755 ?auto_86762 ) ) ( not ( = ?auto_86755 ?auto_86761 ) ) ( ON ?auto_86755 ?auto_86756 ) ( CLEAR ?auto_86755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86760 ?auto_86758 ?auto_86762 ?auto_86761 ?auto_86759 ?auto_86757 ?auto_86756 )
      ( MAKE-3PILE ?auto_86755 ?auto_86756 ?auto_86757 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86767 - BLOCK
      ?auto_86768 - BLOCK
      ?auto_86769 - BLOCK
      ?auto_86770 - BLOCK
    )
    :vars
    (
      ?auto_86771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86771 ?auto_86770 ) ( CLEAR ?auto_86771 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86767 ) ( ON ?auto_86768 ?auto_86767 ) ( ON ?auto_86769 ?auto_86768 ) ( ON ?auto_86770 ?auto_86769 ) ( not ( = ?auto_86767 ?auto_86768 ) ) ( not ( = ?auto_86767 ?auto_86769 ) ) ( not ( = ?auto_86767 ?auto_86770 ) ) ( not ( = ?auto_86767 ?auto_86771 ) ) ( not ( = ?auto_86768 ?auto_86769 ) ) ( not ( = ?auto_86768 ?auto_86770 ) ) ( not ( = ?auto_86768 ?auto_86771 ) ) ( not ( = ?auto_86769 ?auto_86770 ) ) ( not ( = ?auto_86769 ?auto_86771 ) ) ( not ( = ?auto_86770 ?auto_86771 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86771 ?auto_86770 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86772 - BLOCK
      ?auto_86773 - BLOCK
      ?auto_86774 - BLOCK
      ?auto_86775 - BLOCK
    )
    :vars
    (
      ?auto_86776 - BLOCK
      ?auto_86777 - BLOCK
      ?auto_86778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86776 ?auto_86775 ) ( CLEAR ?auto_86776 ) ( ON-TABLE ?auto_86772 ) ( ON ?auto_86773 ?auto_86772 ) ( ON ?auto_86774 ?auto_86773 ) ( ON ?auto_86775 ?auto_86774 ) ( not ( = ?auto_86772 ?auto_86773 ) ) ( not ( = ?auto_86772 ?auto_86774 ) ) ( not ( = ?auto_86772 ?auto_86775 ) ) ( not ( = ?auto_86772 ?auto_86776 ) ) ( not ( = ?auto_86773 ?auto_86774 ) ) ( not ( = ?auto_86773 ?auto_86775 ) ) ( not ( = ?auto_86773 ?auto_86776 ) ) ( not ( = ?auto_86774 ?auto_86775 ) ) ( not ( = ?auto_86774 ?auto_86776 ) ) ( not ( = ?auto_86775 ?auto_86776 ) ) ( HOLDING ?auto_86777 ) ( CLEAR ?auto_86778 ) ( not ( = ?auto_86772 ?auto_86777 ) ) ( not ( = ?auto_86772 ?auto_86778 ) ) ( not ( = ?auto_86773 ?auto_86777 ) ) ( not ( = ?auto_86773 ?auto_86778 ) ) ( not ( = ?auto_86774 ?auto_86777 ) ) ( not ( = ?auto_86774 ?auto_86778 ) ) ( not ( = ?auto_86775 ?auto_86777 ) ) ( not ( = ?auto_86775 ?auto_86778 ) ) ( not ( = ?auto_86776 ?auto_86777 ) ) ( not ( = ?auto_86776 ?auto_86778 ) ) ( not ( = ?auto_86777 ?auto_86778 ) ) )
    :subtasks
    ( ( !STACK ?auto_86777 ?auto_86778 )
      ( MAKE-4PILE ?auto_86772 ?auto_86773 ?auto_86774 ?auto_86775 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86779 - BLOCK
      ?auto_86780 - BLOCK
      ?auto_86781 - BLOCK
      ?auto_86782 - BLOCK
    )
    :vars
    (
      ?auto_86783 - BLOCK
      ?auto_86785 - BLOCK
      ?auto_86784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86783 ?auto_86782 ) ( ON-TABLE ?auto_86779 ) ( ON ?auto_86780 ?auto_86779 ) ( ON ?auto_86781 ?auto_86780 ) ( ON ?auto_86782 ?auto_86781 ) ( not ( = ?auto_86779 ?auto_86780 ) ) ( not ( = ?auto_86779 ?auto_86781 ) ) ( not ( = ?auto_86779 ?auto_86782 ) ) ( not ( = ?auto_86779 ?auto_86783 ) ) ( not ( = ?auto_86780 ?auto_86781 ) ) ( not ( = ?auto_86780 ?auto_86782 ) ) ( not ( = ?auto_86780 ?auto_86783 ) ) ( not ( = ?auto_86781 ?auto_86782 ) ) ( not ( = ?auto_86781 ?auto_86783 ) ) ( not ( = ?auto_86782 ?auto_86783 ) ) ( CLEAR ?auto_86785 ) ( not ( = ?auto_86779 ?auto_86784 ) ) ( not ( = ?auto_86779 ?auto_86785 ) ) ( not ( = ?auto_86780 ?auto_86784 ) ) ( not ( = ?auto_86780 ?auto_86785 ) ) ( not ( = ?auto_86781 ?auto_86784 ) ) ( not ( = ?auto_86781 ?auto_86785 ) ) ( not ( = ?auto_86782 ?auto_86784 ) ) ( not ( = ?auto_86782 ?auto_86785 ) ) ( not ( = ?auto_86783 ?auto_86784 ) ) ( not ( = ?auto_86783 ?auto_86785 ) ) ( not ( = ?auto_86784 ?auto_86785 ) ) ( ON ?auto_86784 ?auto_86783 ) ( CLEAR ?auto_86784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86779 ?auto_86780 ?auto_86781 ?auto_86782 ?auto_86783 )
      ( MAKE-4PILE ?auto_86779 ?auto_86780 ?auto_86781 ?auto_86782 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86786 - BLOCK
      ?auto_86787 - BLOCK
      ?auto_86788 - BLOCK
      ?auto_86789 - BLOCK
    )
    :vars
    (
      ?auto_86790 - BLOCK
      ?auto_86792 - BLOCK
      ?auto_86791 - BLOCK
      ?auto_86793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86790 ?auto_86789 ) ( ON-TABLE ?auto_86786 ) ( ON ?auto_86787 ?auto_86786 ) ( ON ?auto_86788 ?auto_86787 ) ( ON ?auto_86789 ?auto_86788 ) ( not ( = ?auto_86786 ?auto_86787 ) ) ( not ( = ?auto_86786 ?auto_86788 ) ) ( not ( = ?auto_86786 ?auto_86789 ) ) ( not ( = ?auto_86786 ?auto_86790 ) ) ( not ( = ?auto_86787 ?auto_86788 ) ) ( not ( = ?auto_86787 ?auto_86789 ) ) ( not ( = ?auto_86787 ?auto_86790 ) ) ( not ( = ?auto_86788 ?auto_86789 ) ) ( not ( = ?auto_86788 ?auto_86790 ) ) ( not ( = ?auto_86789 ?auto_86790 ) ) ( not ( = ?auto_86786 ?auto_86792 ) ) ( not ( = ?auto_86786 ?auto_86791 ) ) ( not ( = ?auto_86787 ?auto_86792 ) ) ( not ( = ?auto_86787 ?auto_86791 ) ) ( not ( = ?auto_86788 ?auto_86792 ) ) ( not ( = ?auto_86788 ?auto_86791 ) ) ( not ( = ?auto_86789 ?auto_86792 ) ) ( not ( = ?auto_86789 ?auto_86791 ) ) ( not ( = ?auto_86790 ?auto_86792 ) ) ( not ( = ?auto_86790 ?auto_86791 ) ) ( not ( = ?auto_86792 ?auto_86791 ) ) ( ON ?auto_86792 ?auto_86790 ) ( CLEAR ?auto_86792 ) ( HOLDING ?auto_86791 ) ( CLEAR ?auto_86793 ) ( ON-TABLE ?auto_86793 ) ( not ( = ?auto_86793 ?auto_86791 ) ) ( not ( = ?auto_86786 ?auto_86793 ) ) ( not ( = ?auto_86787 ?auto_86793 ) ) ( not ( = ?auto_86788 ?auto_86793 ) ) ( not ( = ?auto_86789 ?auto_86793 ) ) ( not ( = ?auto_86790 ?auto_86793 ) ) ( not ( = ?auto_86792 ?auto_86793 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86793 ?auto_86791 )
      ( MAKE-4PILE ?auto_86786 ?auto_86787 ?auto_86788 ?auto_86789 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87848 - BLOCK
      ?auto_87849 - BLOCK
      ?auto_87850 - BLOCK
      ?auto_87851 - BLOCK
    )
    :vars
    (
      ?auto_87852 - BLOCK
      ?auto_87853 - BLOCK
      ?auto_87854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87852 ?auto_87851 ) ( ON-TABLE ?auto_87848 ) ( ON ?auto_87849 ?auto_87848 ) ( ON ?auto_87850 ?auto_87849 ) ( ON ?auto_87851 ?auto_87850 ) ( not ( = ?auto_87848 ?auto_87849 ) ) ( not ( = ?auto_87848 ?auto_87850 ) ) ( not ( = ?auto_87848 ?auto_87851 ) ) ( not ( = ?auto_87848 ?auto_87852 ) ) ( not ( = ?auto_87849 ?auto_87850 ) ) ( not ( = ?auto_87849 ?auto_87851 ) ) ( not ( = ?auto_87849 ?auto_87852 ) ) ( not ( = ?auto_87850 ?auto_87851 ) ) ( not ( = ?auto_87850 ?auto_87852 ) ) ( not ( = ?auto_87851 ?auto_87852 ) ) ( not ( = ?auto_87848 ?auto_87853 ) ) ( not ( = ?auto_87848 ?auto_87854 ) ) ( not ( = ?auto_87849 ?auto_87853 ) ) ( not ( = ?auto_87849 ?auto_87854 ) ) ( not ( = ?auto_87850 ?auto_87853 ) ) ( not ( = ?auto_87850 ?auto_87854 ) ) ( not ( = ?auto_87851 ?auto_87853 ) ) ( not ( = ?auto_87851 ?auto_87854 ) ) ( not ( = ?auto_87852 ?auto_87853 ) ) ( not ( = ?auto_87852 ?auto_87854 ) ) ( not ( = ?auto_87853 ?auto_87854 ) ) ( ON ?auto_87853 ?auto_87852 ) ( ON ?auto_87854 ?auto_87853 ) ( CLEAR ?auto_87854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87848 ?auto_87849 ?auto_87850 ?auto_87851 ?auto_87852 ?auto_87853 )
      ( MAKE-4PILE ?auto_87848 ?auto_87849 ?auto_87850 ?auto_87851 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86802 - BLOCK
      ?auto_86803 - BLOCK
      ?auto_86804 - BLOCK
      ?auto_86805 - BLOCK
    )
    :vars
    (
      ?auto_86807 - BLOCK
      ?auto_86808 - BLOCK
      ?auto_86806 - BLOCK
      ?auto_86809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86807 ?auto_86805 ) ( ON-TABLE ?auto_86802 ) ( ON ?auto_86803 ?auto_86802 ) ( ON ?auto_86804 ?auto_86803 ) ( ON ?auto_86805 ?auto_86804 ) ( not ( = ?auto_86802 ?auto_86803 ) ) ( not ( = ?auto_86802 ?auto_86804 ) ) ( not ( = ?auto_86802 ?auto_86805 ) ) ( not ( = ?auto_86802 ?auto_86807 ) ) ( not ( = ?auto_86803 ?auto_86804 ) ) ( not ( = ?auto_86803 ?auto_86805 ) ) ( not ( = ?auto_86803 ?auto_86807 ) ) ( not ( = ?auto_86804 ?auto_86805 ) ) ( not ( = ?auto_86804 ?auto_86807 ) ) ( not ( = ?auto_86805 ?auto_86807 ) ) ( not ( = ?auto_86802 ?auto_86808 ) ) ( not ( = ?auto_86802 ?auto_86806 ) ) ( not ( = ?auto_86803 ?auto_86808 ) ) ( not ( = ?auto_86803 ?auto_86806 ) ) ( not ( = ?auto_86804 ?auto_86808 ) ) ( not ( = ?auto_86804 ?auto_86806 ) ) ( not ( = ?auto_86805 ?auto_86808 ) ) ( not ( = ?auto_86805 ?auto_86806 ) ) ( not ( = ?auto_86807 ?auto_86808 ) ) ( not ( = ?auto_86807 ?auto_86806 ) ) ( not ( = ?auto_86808 ?auto_86806 ) ) ( ON ?auto_86808 ?auto_86807 ) ( not ( = ?auto_86809 ?auto_86806 ) ) ( not ( = ?auto_86802 ?auto_86809 ) ) ( not ( = ?auto_86803 ?auto_86809 ) ) ( not ( = ?auto_86804 ?auto_86809 ) ) ( not ( = ?auto_86805 ?auto_86809 ) ) ( not ( = ?auto_86807 ?auto_86809 ) ) ( not ( = ?auto_86808 ?auto_86809 ) ) ( ON ?auto_86806 ?auto_86808 ) ( CLEAR ?auto_86806 ) ( HOLDING ?auto_86809 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86809 )
      ( MAKE-4PILE ?auto_86802 ?auto_86803 ?auto_86804 ?auto_86805 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86810 - BLOCK
      ?auto_86811 - BLOCK
      ?auto_86812 - BLOCK
      ?auto_86813 - BLOCK
    )
    :vars
    (
      ?auto_86817 - BLOCK
      ?auto_86815 - BLOCK
      ?auto_86816 - BLOCK
      ?auto_86814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86817 ?auto_86813 ) ( ON-TABLE ?auto_86810 ) ( ON ?auto_86811 ?auto_86810 ) ( ON ?auto_86812 ?auto_86811 ) ( ON ?auto_86813 ?auto_86812 ) ( not ( = ?auto_86810 ?auto_86811 ) ) ( not ( = ?auto_86810 ?auto_86812 ) ) ( not ( = ?auto_86810 ?auto_86813 ) ) ( not ( = ?auto_86810 ?auto_86817 ) ) ( not ( = ?auto_86811 ?auto_86812 ) ) ( not ( = ?auto_86811 ?auto_86813 ) ) ( not ( = ?auto_86811 ?auto_86817 ) ) ( not ( = ?auto_86812 ?auto_86813 ) ) ( not ( = ?auto_86812 ?auto_86817 ) ) ( not ( = ?auto_86813 ?auto_86817 ) ) ( not ( = ?auto_86810 ?auto_86815 ) ) ( not ( = ?auto_86810 ?auto_86816 ) ) ( not ( = ?auto_86811 ?auto_86815 ) ) ( not ( = ?auto_86811 ?auto_86816 ) ) ( not ( = ?auto_86812 ?auto_86815 ) ) ( not ( = ?auto_86812 ?auto_86816 ) ) ( not ( = ?auto_86813 ?auto_86815 ) ) ( not ( = ?auto_86813 ?auto_86816 ) ) ( not ( = ?auto_86817 ?auto_86815 ) ) ( not ( = ?auto_86817 ?auto_86816 ) ) ( not ( = ?auto_86815 ?auto_86816 ) ) ( ON ?auto_86815 ?auto_86817 ) ( not ( = ?auto_86814 ?auto_86816 ) ) ( not ( = ?auto_86810 ?auto_86814 ) ) ( not ( = ?auto_86811 ?auto_86814 ) ) ( not ( = ?auto_86812 ?auto_86814 ) ) ( not ( = ?auto_86813 ?auto_86814 ) ) ( not ( = ?auto_86817 ?auto_86814 ) ) ( not ( = ?auto_86815 ?auto_86814 ) ) ( ON ?auto_86816 ?auto_86815 ) ( ON ?auto_86814 ?auto_86816 ) ( CLEAR ?auto_86814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86810 ?auto_86811 ?auto_86812 ?auto_86813 ?auto_86817 ?auto_86815 ?auto_86816 )
      ( MAKE-4PILE ?auto_86810 ?auto_86811 ?auto_86812 ?auto_86813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86822 - BLOCK
      ?auto_86823 - BLOCK
      ?auto_86824 - BLOCK
      ?auto_86825 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_86825 ) ( CLEAR ?auto_86824 ) ( ON-TABLE ?auto_86822 ) ( ON ?auto_86823 ?auto_86822 ) ( ON ?auto_86824 ?auto_86823 ) ( not ( = ?auto_86822 ?auto_86823 ) ) ( not ( = ?auto_86822 ?auto_86824 ) ) ( not ( = ?auto_86822 ?auto_86825 ) ) ( not ( = ?auto_86823 ?auto_86824 ) ) ( not ( = ?auto_86823 ?auto_86825 ) ) ( not ( = ?auto_86824 ?auto_86825 ) ) )
    :subtasks
    ( ( !STACK ?auto_86825 ?auto_86824 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86826 - BLOCK
      ?auto_86827 - BLOCK
      ?auto_86828 - BLOCK
      ?auto_86829 - BLOCK
    )
    :vars
    (
      ?auto_86830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86828 ) ( ON-TABLE ?auto_86826 ) ( ON ?auto_86827 ?auto_86826 ) ( ON ?auto_86828 ?auto_86827 ) ( not ( = ?auto_86826 ?auto_86827 ) ) ( not ( = ?auto_86826 ?auto_86828 ) ) ( not ( = ?auto_86826 ?auto_86829 ) ) ( not ( = ?auto_86827 ?auto_86828 ) ) ( not ( = ?auto_86827 ?auto_86829 ) ) ( not ( = ?auto_86828 ?auto_86829 ) ) ( ON ?auto_86829 ?auto_86830 ) ( CLEAR ?auto_86829 ) ( HAND-EMPTY ) ( not ( = ?auto_86826 ?auto_86830 ) ) ( not ( = ?auto_86827 ?auto_86830 ) ) ( not ( = ?auto_86828 ?auto_86830 ) ) ( not ( = ?auto_86829 ?auto_86830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86829 ?auto_86830 )
      ( MAKE-4PILE ?auto_86826 ?auto_86827 ?auto_86828 ?auto_86829 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86831 - BLOCK
      ?auto_86832 - BLOCK
      ?auto_86833 - BLOCK
      ?auto_86834 - BLOCK
    )
    :vars
    (
      ?auto_86835 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86831 ) ( ON ?auto_86832 ?auto_86831 ) ( not ( = ?auto_86831 ?auto_86832 ) ) ( not ( = ?auto_86831 ?auto_86833 ) ) ( not ( = ?auto_86831 ?auto_86834 ) ) ( not ( = ?auto_86832 ?auto_86833 ) ) ( not ( = ?auto_86832 ?auto_86834 ) ) ( not ( = ?auto_86833 ?auto_86834 ) ) ( ON ?auto_86834 ?auto_86835 ) ( CLEAR ?auto_86834 ) ( not ( = ?auto_86831 ?auto_86835 ) ) ( not ( = ?auto_86832 ?auto_86835 ) ) ( not ( = ?auto_86833 ?auto_86835 ) ) ( not ( = ?auto_86834 ?auto_86835 ) ) ( HOLDING ?auto_86833 ) ( CLEAR ?auto_86832 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86831 ?auto_86832 ?auto_86833 )
      ( MAKE-4PILE ?auto_86831 ?auto_86832 ?auto_86833 ?auto_86834 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86836 - BLOCK
      ?auto_86837 - BLOCK
      ?auto_86838 - BLOCK
      ?auto_86839 - BLOCK
    )
    :vars
    (
      ?auto_86840 - BLOCK
      ?auto_86843 - BLOCK
      ?auto_86842 - BLOCK
      ?auto_86841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86836 ) ( ON ?auto_86837 ?auto_86836 ) ( not ( = ?auto_86836 ?auto_86837 ) ) ( not ( = ?auto_86836 ?auto_86838 ) ) ( not ( = ?auto_86836 ?auto_86839 ) ) ( not ( = ?auto_86837 ?auto_86838 ) ) ( not ( = ?auto_86837 ?auto_86839 ) ) ( not ( = ?auto_86838 ?auto_86839 ) ) ( ON ?auto_86839 ?auto_86840 ) ( not ( = ?auto_86836 ?auto_86840 ) ) ( not ( = ?auto_86837 ?auto_86840 ) ) ( not ( = ?auto_86838 ?auto_86840 ) ) ( not ( = ?auto_86839 ?auto_86840 ) ) ( CLEAR ?auto_86837 ) ( ON ?auto_86838 ?auto_86839 ) ( CLEAR ?auto_86838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86843 ) ( ON ?auto_86842 ?auto_86843 ) ( ON ?auto_86841 ?auto_86842 ) ( ON ?auto_86840 ?auto_86841 ) ( not ( = ?auto_86843 ?auto_86842 ) ) ( not ( = ?auto_86843 ?auto_86841 ) ) ( not ( = ?auto_86843 ?auto_86840 ) ) ( not ( = ?auto_86843 ?auto_86839 ) ) ( not ( = ?auto_86843 ?auto_86838 ) ) ( not ( = ?auto_86842 ?auto_86841 ) ) ( not ( = ?auto_86842 ?auto_86840 ) ) ( not ( = ?auto_86842 ?auto_86839 ) ) ( not ( = ?auto_86842 ?auto_86838 ) ) ( not ( = ?auto_86841 ?auto_86840 ) ) ( not ( = ?auto_86841 ?auto_86839 ) ) ( not ( = ?auto_86841 ?auto_86838 ) ) ( not ( = ?auto_86836 ?auto_86843 ) ) ( not ( = ?auto_86836 ?auto_86842 ) ) ( not ( = ?auto_86836 ?auto_86841 ) ) ( not ( = ?auto_86837 ?auto_86843 ) ) ( not ( = ?auto_86837 ?auto_86842 ) ) ( not ( = ?auto_86837 ?auto_86841 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86843 ?auto_86842 ?auto_86841 ?auto_86840 ?auto_86839 )
      ( MAKE-4PILE ?auto_86836 ?auto_86837 ?auto_86838 ?auto_86839 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86844 - BLOCK
      ?auto_86845 - BLOCK
      ?auto_86846 - BLOCK
      ?auto_86847 - BLOCK
    )
    :vars
    (
      ?auto_86850 - BLOCK
      ?auto_86849 - BLOCK
      ?auto_86848 - BLOCK
      ?auto_86851 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86844 ) ( not ( = ?auto_86844 ?auto_86845 ) ) ( not ( = ?auto_86844 ?auto_86846 ) ) ( not ( = ?auto_86844 ?auto_86847 ) ) ( not ( = ?auto_86845 ?auto_86846 ) ) ( not ( = ?auto_86845 ?auto_86847 ) ) ( not ( = ?auto_86846 ?auto_86847 ) ) ( ON ?auto_86847 ?auto_86850 ) ( not ( = ?auto_86844 ?auto_86850 ) ) ( not ( = ?auto_86845 ?auto_86850 ) ) ( not ( = ?auto_86846 ?auto_86850 ) ) ( not ( = ?auto_86847 ?auto_86850 ) ) ( ON ?auto_86846 ?auto_86847 ) ( CLEAR ?auto_86846 ) ( ON-TABLE ?auto_86849 ) ( ON ?auto_86848 ?auto_86849 ) ( ON ?auto_86851 ?auto_86848 ) ( ON ?auto_86850 ?auto_86851 ) ( not ( = ?auto_86849 ?auto_86848 ) ) ( not ( = ?auto_86849 ?auto_86851 ) ) ( not ( = ?auto_86849 ?auto_86850 ) ) ( not ( = ?auto_86849 ?auto_86847 ) ) ( not ( = ?auto_86849 ?auto_86846 ) ) ( not ( = ?auto_86848 ?auto_86851 ) ) ( not ( = ?auto_86848 ?auto_86850 ) ) ( not ( = ?auto_86848 ?auto_86847 ) ) ( not ( = ?auto_86848 ?auto_86846 ) ) ( not ( = ?auto_86851 ?auto_86850 ) ) ( not ( = ?auto_86851 ?auto_86847 ) ) ( not ( = ?auto_86851 ?auto_86846 ) ) ( not ( = ?auto_86844 ?auto_86849 ) ) ( not ( = ?auto_86844 ?auto_86848 ) ) ( not ( = ?auto_86844 ?auto_86851 ) ) ( not ( = ?auto_86845 ?auto_86849 ) ) ( not ( = ?auto_86845 ?auto_86848 ) ) ( not ( = ?auto_86845 ?auto_86851 ) ) ( HOLDING ?auto_86845 ) ( CLEAR ?auto_86844 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86844 ?auto_86845 )
      ( MAKE-4PILE ?auto_86844 ?auto_86845 ?auto_86846 ?auto_86847 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86852 - BLOCK
      ?auto_86853 - BLOCK
      ?auto_86854 - BLOCK
      ?auto_86855 - BLOCK
    )
    :vars
    (
      ?auto_86856 - BLOCK
      ?auto_86858 - BLOCK
      ?auto_86859 - BLOCK
      ?auto_86857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86852 ) ( not ( = ?auto_86852 ?auto_86853 ) ) ( not ( = ?auto_86852 ?auto_86854 ) ) ( not ( = ?auto_86852 ?auto_86855 ) ) ( not ( = ?auto_86853 ?auto_86854 ) ) ( not ( = ?auto_86853 ?auto_86855 ) ) ( not ( = ?auto_86854 ?auto_86855 ) ) ( ON ?auto_86855 ?auto_86856 ) ( not ( = ?auto_86852 ?auto_86856 ) ) ( not ( = ?auto_86853 ?auto_86856 ) ) ( not ( = ?auto_86854 ?auto_86856 ) ) ( not ( = ?auto_86855 ?auto_86856 ) ) ( ON ?auto_86854 ?auto_86855 ) ( ON-TABLE ?auto_86858 ) ( ON ?auto_86859 ?auto_86858 ) ( ON ?auto_86857 ?auto_86859 ) ( ON ?auto_86856 ?auto_86857 ) ( not ( = ?auto_86858 ?auto_86859 ) ) ( not ( = ?auto_86858 ?auto_86857 ) ) ( not ( = ?auto_86858 ?auto_86856 ) ) ( not ( = ?auto_86858 ?auto_86855 ) ) ( not ( = ?auto_86858 ?auto_86854 ) ) ( not ( = ?auto_86859 ?auto_86857 ) ) ( not ( = ?auto_86859 ?auto_86856 ) ) ( not ( = ?auto_86859 ?auto_86855 ) ) ( not ( = ?auto_86859 ?auto_86854 ) ) ( not ( = ?auto_86857 ?auto_86856 ) ) ( not ( = ?auto_86857 ?auto_86855 ) ) ( not ( = ?auto_86857 ?auto_86854 ) ) ( not ( = ?auto_86852 ?auto_86858 ) ) ( not ( = ?auto_86852 ?auto_86859 ) ) ( not ( = ?auto_86852 ?auto_86857 ) ) ( not ( = ?auto_86853 ?auto_86858 ) ) ( not ( = ?auto_86853 ?auto_86859 ) ) ( not ( = ?auto_86853 ?auto_86857 ) ) ( CLEAR ?auto_86852 ) ( ON ?auto_86853 ?auto_86854 ) ( CLEAR ?auto_86853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86858 ?auto_86859 ?auto_86857 ?auto_86856 ?auto_86855 ?auto_86854 )
      ( MAKE-4PILE ?auto_86852 ?auto_86853 ?auto_86854 ?auto_86855 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86860 - BLOCK
      ?auto_86861 - BLOCK
      ?auto_86862 - BLOCK
      ?auto_86863 - BLOCK
    )
    :vars
    (
      ?auto_86864 - BLOCK
      ?auto_86867 - BLOCK
      ?auto_86865 - BLOCK
      ?auto_86866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86860 ?auto_86861 ) ) ( not ( = ?auto_86860 ?auto_86862 ) ) ( not ( = ?auto_86860 ?auto_86863 ) ) ( not ( = ?auto_86861 ?auto_86862 ) ) ( not ( = ?auto_86861 ?auto_86863 ) ) ( not ( = ?auto_86862 ?auto_86863 ) ) ( ON ?auto_86863 ?auto_86864 ) ( not ( = ?auto_86860 ?auto_86864 ) ) ( not ( = ?auto_86861 ?auto_86864 ) ) ( not ( = ?auto_86862 ?auto_86864 ) ) ( not ( = ?auto_86863 ?auto_86864 ) ) ( ON ?auto_86862 ?auto_86863 ) ( ON-TABLE ?auto_86867 ) ( ON ?auto_86865 ?auto_86867 ) ( ON ?auto_86866 ?auto_86865 ) ( ON ?auto_86864 ?auto_86866 ) ( not ( = ?auto_86867 ?auto_86865 ) ) ( not ( = ?auto_86867 ?auto_86866 ) ) ( not ( = ?auto_86867 ?auto_86864 ) ) ( not ( = ?auto_86867 ?auto_86863 ) ) ( not ( = ?auto_86867 ?auto_86862 ) ) ( not ( = ?auto_86865 ?auto_86866 ) ) ( not ( = ?auto_86865 ?auto_86864 ) ) ( not ( = ?auto_86865 ?auto_86863 ) ) ( not ( = ?auto_86865 ?auto_86862 ) ) ( not ( = ?auto_86866 ?auto_86864 ) ) ( not ( = ?auto_86866 ?auto_86863 ) ) ( not ( = ?auto_86866 ?auto_86862 ) ) ( not ( = ?auto_86860 ?auto_86867 ) ) ( not ( = ?auto_86860 ?auto_86865 ) ) ( not ( = ?auto_86860 ?auto_86866 ) ) ( not ( = ?auto_86861 ?auto_86867 ) ) ( not ( = ?auto_86861 ?auto_86865 ) ) ( not ( = ?auto_86861 ?auto_86866 ) ) ( ON ?auto_86861 ?auto_86862 ) ( CLEAR ?auto_86861 ) ( HOLDING ?auto_86860 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86860 )
      ( MAKE-4PILE ?auto_86860 ?auto_86861 ?auto_86862 ?auto_86863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86868 - BLOCK
      ?auto_86869 - BLOCK
      ?auto_86870 - BLOCK
      ?auto_86871 - BLOCK
    )
    :vars
    (
      ?auto_86875 - BLOCK
      ?auto_86874 - BLOCK
      ?auto_86873 - BLOCK
      ?auto_86872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86868 ?auto_86869 ) ) ( not ( = ?auto_86868 ?auto_86870 ) ) ( not ( = ?auto_86868 ?auto_86871 ) ) ( not ( = ?auto_86869 ?auto_86870 ) ) ( not ( = ?auto_86869 ?auto_86871 ) ) ( not ( = ?auto_86870 ?auto_86871 ) ) ( ON ?auto_86871 ?auto_86875 ) ( not ( = ?auto_86868 ?auto_86875 ) ) ( not ( = ?auto_86869 ?auto_86875 ) ) ( not ( = ?auto_86870 ?auto_86875 ) ) ( not ( = ?auto_86871 ?auto_86875 ) ) ( ON ?auto_86870 ?auto_86871 ) ( ON-TABLE ?auto_86874 ) ( ON ?auto_86873 ?auto_86874 ) ( ON ?auto_86872 ?auto_86873 ) ( ON ?auto_86875 ?auto_86872 ) ( not ( = ?auto_86874 ?auto_86873 ) ) ( not ( = ?auto_86874 ?auto_86872 ) ) ( not ( = ?auto_86874 ?auto_86875 ) ) ( not ( = ?auto_86874 ?auto_86871 ) ) ( not ( = ?auto_86874 ?auto_86870 ) ) ( not ( = ?auto_86873 ?auto_86872 ) ) ( not ( = ?auto_86873 ?auto_86875 ) ) ( not ( = ?auto_86873 ?auto_86871 ) ) ( not ( = ?auto_86873 ?auto_86870 ) ) ( not ( = ?auto_86872 ?auto_86875 ) ) ( not ( = ?auto_86872 ?auto_86871 ) ) ( not ( = ?auto_86872 ?auto_86870 ) ) ( not ( = ?auto_86868 ?auto_86874 ) ) ( not ( = ?auto_86868 ?auto_86873 ) ) ( not ( = ?auto_86868 ?auto_86872 ) ) ( not ( = ?auto_86869 ?auto_86874 ) ) ( not ( = ?auto_86869 ?auto_86873 ) ) ( not ( = ?auto_86869 ?auto_86872 ) ) ( ON ?auto_86869 ?auto_86870 ) ( ON ?auto_86868 ?auto_86869 ) ( CLEAR ?auto_86868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86874 ?auto_86873 ?auto_86872 ?auto_86875 ?auto_86871 ?auto_86870 ?auto_86869 )
      ( MAKE-4PILE ?auto_86868 ?auto_86869 ?auto_86870 ?auto_86871 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86879 - BLOCK
      ?auto_86880 - BLOCK
      ?auto_86881 - BLOCK
    )
    :vars
    (
      ?auto_86882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86882 ?auto_86881 ) ( CLEAR ?auto_86882 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86879 ) ( ON ?auto_86880 ?auto_86879 ) ( ON ?auto_86881 ?auto_86880 ) ( not ( = ?auto_86879 ?auto_86880 ) ) ( not ( = ?auto_86879 ?auto_86881 ) ) ( not ( = ?auto_86879 ?auto_86882 ) ) ( not ( = ?auto_86880 ?auto_86881 ) ) ( not ( = ?auto_86880 ?auto_86882 ) ) ( not ( = ?auto_86881 ?auto_86882 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86882 ?auto_86881 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86883 - BLOCK
      ?auto_86884 - BLOCK
      ?auto_86885 - BLOCK
    )
    :vars
    (
      ?auto_86886 - BLOCK
      ?auto_86887 - BLOCK
      ?auto_86888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86886 ?auto_86885 ) ( CLEAR ?auto_86886 ) ( ON-TABLE ?auto_86883 ) ( ON ?auto_86884 ?auto_86883 ) ( ON ?auto_86885 ?auto_86884 ) ( not ( = ?auto_86883 ?auto_86884 ) ) ( not ( = ?auto_86883 ?auto_86885 ) ) ( not ( = ?auto_86883 ?auto_86886 ) ) ( not ( = ?auto_86884 ?auto_86885 ) ) ( not ( = ?auto_86884 ?auto_86886 ) ) ( not ( = ?auto_86885 ?auto_86886 ) ) ( HOLDING ?auto_86887 ) ( CLEAR ?auto_86888 ) ( not ( = ?auto_86883 ?auto_86887 ) ) ( not ( = ?auto_86883 ?auto_86888 ) ) ( not ( = ?auto_86884 ?auto_86887 ) ) ( not ( = ?auto_86884 ?auto_86888 ) ) ( not ( = ?auto_86885 ?auto_86887 ) ) ( not ( = ?auto_86885 ?auto_86888 ) ) ( not ( = ?auto_86886 ?auto_86887 ) ) ( not ( = ?auto_86886 ?auto_86888 ) ) ( not ( = ?auto_86887 ?auto_86888 ) ) )
    :subtasks
    ( ( !STACK ?auto_86887 ?auto_86888 )
      ( MAKE-3PILE ?auto_86883 ?auto_86884 ?auto_86885 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86889 - BLOCK
      ?auto_86890 - BLOCK
      ?auto_86891 - BLOCK
    )
    :vars
    (
      ?auto_86892 - BLOCK
      ?auto_86894 - BLOCK
      ?auto_86893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86892 ?auto_86891 ) ( ON-TABLE ?auto_86889 ) ( ON ?auto_86890 ?auto_86889 ) ( ON ?auto_86891 ?auto_86890 ) ( not ( = ?auto_86889 ?auto_86890 ) ) ( not ( = ?auto_86889 ?auto_86891 ) ) ( not ( = ?auto_86889 ?auto_86892 ) ) ( not ( = ?auto_86890 ?auto_86891 ) ) ( not ( = ?auto_86890 ?auto_86892 ) ) ( not ( = ?auto_86891 ?auto_86892 ) ) ( CLEAR ?auto_86894 ) ( not ( = ?auto_86889 ?auto_86893 ) ) ( not ( = ?auto_86889 ?auto_86894 ) ) ( not ( = ?auto_86890 ?auto_86893 ) ) ( not ( = ?auto_86890 ?auto_86894 ) ) ( not ( = ?auto_86891 ?auto_86893 ) ) ( not ( = ?auto_86891 ?auto_86894 ) ) ( not ( = ?auto_86892 ?auto_86893 ) ) ( not ( = ?auto_86892 ?auto_86894 ) ) ( not ( = ?auto_86893 ?auto_86894 ) ) ( ON ?auto_86893 ?auto_86892 ) ( CLEAR ?auto_86893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86889 ?auto_86890 ?auto_86891 ?auto_86892 )
      ( MAKE-3PILE ?auto_86889 ?auto_86890 ?auto_86891 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86895 - BLOCK
      ?auto_86896 - BLOCK
      ?auto_86897 - BLOCK
    )
    :vars
    (
      ?auto_86900 - BLOCK
      ?auto_86898 - BLOCK
      ?auto_86899 - BLOCK
      ?auto_86902 - BLOCK
      ?auto_86901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86900 ?auto_86897 ) ( ON-TABLE ?auto_86895 ) ( ON ?auto_86896 ?auto_86895 ) ( ON ?auto_86897 ?auto_86896 ) ( not ( = ?auto_86895 ?auto_86896 ) ) ( not ( = ?auto_86895 ?auto_86897 ) ) ( not ( = ?auto_86895 ?auto_86900 ) ) ( not ( = ?auto_86896 ?auto_86897 ) ) ( not ( = ?auto_86896 ?auto_86900 ) ) ( not ( = ?auto_86897 ?auto_86900 ) ) ( not ( = ?auto_86895 ?auto_86898 ) ) ( not ( = ?auto_86895 ?auto_86899 ) ) ( not ( = ?auto_86896 ?auto_86898 ) ) ( not ( = ?auto_86896 ?auto_86899 ) ) ( not ( = ?auto_86897 ?auto_86898 ) ) ( not ( = ?auto_86897 ?auto_86899 ) ) ( not ( = ?auto_86900 ?auto_86898 ) ) ( not ( = ?auto_86900 ?auto_86899 ) ) ( not ( = ?auto_86898 ?auto_86899 ) ) ( ON ?auto_86898 ?auto_86900 ) ( CLEAR ?auto_86898 ) ( HOLDING ?auto_86899 ) ( CLEAR ?auto_86902 ) ( ON-TABLE ?auto_86901 ) ( ON ?auto_86902 ?auto_86901 ) ( not ( = ?auto_86901 ?auto_86902 ) ) ( not ( = ?auto_86901 ?auto_86899 ) ) ( not ( = ?auto_86902 ?auto_86899 ) ) ( not ( = ?auto_86895 ?auto_86902 ) ) ( not ( = ?auto_86895 ?auto_86901 ) ) ( not ( = ?auto_86896 ?auto_86902 ) ) ( not ( = ?auto_86896 ?auto_86901 ) ) ( not ( = ?auto_86897 ?auto_86902 ) ) ( not ( = ?auto_86897 ?auto_86901 ) ) ( not ( = ?auto_86900 ?auto_86902 ) ) ( not ( = ?auto_86900 ?auto_86901 ) ) ( not ( = ?auto_86898 ?auto_86902 ) ) ( not ( = ?auto_86898 ?auto_86901 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86901 ?auto_86902 ?auto_86899 )
      ( MAKE-3PILE ?auto_86895 ?auto_86896 ?auto_86897 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86903 - BLOCK
      ?auto_86904 - BLOCK
      ?auto_86905 - BLOCK
    )
    :vars
    (
      ?auto_86909 - BLOCK
      ?auto_86906 - BLOCK
      ?auto_86907 - BLOCK
      ?auto_86908 - BLOCK
      ?auto_86910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86909 ?auto_86905 ) ( ON-TABLE ?auto_86903 ) ( ON ?auto_86904 ?auto_86903 ) ( ON ?auto_86905 ?auto_86904 ) ( not ( = ?auto_86903 ?auto_86904 ) ) ( not ( = ?auto_86903 ?auto_86905 ) ) ( not ( = ?auto_86903 ?auto_86909 ) ) ( not ( = ?auto_86904 ?auto_86905 ) ) ( not ( = ?auto_86904 ?auto_86909 ) ) ( not ( = ?auto_86905 ?auto_86909 ) ) ( not ( = ?auto_86903 ?auto_86906 ) ) ( not ( = ?auto_86903 ?auto_86907 ) ) ( not ( = ?auto_86904 ?auto_86906 ) ) ( not ( = ?auto_86904 ?auto_86907 ) ) ( not ( = ?auto_86905 ?auto_86906 ) ) ( not ( = ?auto_86905 ?auto_86907 ) ) ( not ( = ?auto_86909 ?auto_86906 ) ) ( not ( = ?auto_86909 ?auto_86907 ) ) ( not ( = ?auto_86906 ?auto_86907 ) ) ( ON ?auto_86906 ?auto_86909 ) ( CLEAR ?auto_86908 ) ( ON-TABLE ?auto_86910 ) ( ON ?auto_86908 ?auto_86910 ) ( not ( = ?auto_86910 ?auto_86908 ) ) ( not ( = ?auto_86910 ?auto_86907 ) ) ( not ( = ?auto_86908 ?auto_86907 ) ) ( not ( = ?auto_86903 ?auto_86908 ) ) ( not ( = ?auto_86903 ?auto_86910 ) ) ( not ( = ?auto_86904 ?auto_86908 ) ) ( not ( = ?auto_86904 ?auto_86910 ) ) ( not ( = ?auto_86905 ?auto_86908 ) ) ( not ( = ?auto_86905 ?auto_86910 ) ) ( not ( = ?auto_86909 ?auto_86908 ) ) ( not ( = ?auto_86909 ?auto_86910 ) ) ( not ( = ?auto_86906 ?auto_86908 ) ) ( not ( = ?auto_86906 ?auto_86910 ) ) ( ON ?auto_86907 ?auto_86906 ) ( CLEAR ?auto_86907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86903 ?auto_86904 ?auto_86905 ?auto_86909 ?auto_86906 )
      ( MAKE-3PILE ?auto_86903 ?auto_86904 ?auto_86905 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86911 - BLOCK
      ?auto_86912 - BLOCK
      ?auto_86913 - BLOCK
    )
    :vars
    (
      ?auto_86914 - BLOCK
      ?auto_86917 - BLOCK
      ?auto_86915 - BLOCK
      ?auto_86918 - BLOCK
      ?auto_86916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86914 ?auto_86913 ) ( ON-TABLE ?auto_86911 ) ( ON ?auto_86912 ?auto_86911 ) ( ON ?auto_86913 ?auto_86912 ) ( not ( = ?auto_86911 ?auto_86912 ) ) ( not ( = ?auto_86911 ?auto_86913 ) ) ( not ( = ?auto_86911 ?auto_86914 ) ) ( not ( = ?auto_86912 ?auto_86913 ) ) ( not ( = ?auto_86912 ?auto_86914 ) ) ( not ( = ?auto_86913 ?auto_86914 ) ) ( not ( = ?auto_86911 ?auto_86917 ) ) ( not ( = ?auto_86911 ?auto_86915 ) ) ( not ( = ?auto_86912 ?auto_86917 ) ) ( not ( = ?auto_86912 ?auto_86915 ) ) ( not ( = ?auto_86913 ?auto_86917 ) ) ( not ( = ?auto_86913 ?auto_86915 ) ) ( not ( = ?auto_86914 ?auto_86917 ) ) ( not ( = ?auto_86914 ?auto_86915 ) ) ( not ( = ?auto_86917 ?auto_86915 ) ) ( ON ?auto_86917 ?auto_86914 ) ( ON-TABLE ?auto_86918 ) ( not ( = ?auto_86918 ?auto_86916 ) ) ( not ( = ?auto_86918 ?auto_86915 ) ) ( not ( = ?auto_86916 ?auto_86915 ) ) ( not ( = ?auto_86911 ?auto_86916 ) ) ( not ( = ?auto_86911 ?auto_86918 ) ) ( not ( = ?auto_86912 ?auto_86916 ) ) ( not ( = ?auto_86912 ?auto_86918 ) ) ( not ( = ?auto_86913 ?auto_86916 ) ) ( not ( = ?auto_86913 ?auto_86918 ) ) ( not ( = ?auto_86914 ?auto_86916 ) ) ( not ( = ?auto_86914 ?auto_86918 ) ) ( not ( = ?auto_86917 ?auto_86916 ) ) ( not ( = ?auto_86917 ?auto_86918 ) ) ( ON ?auto_86915 ?auto_86917 ) ( CLEAR ?auto_86915 ) ( HOLDING ?auto_86916 ) ( CLEAR ?auto_86918 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86918 ?auto_86916 )
      ( MAKE-3PILE ?auto_86911 ?auto_86912 ?auto_86913 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88096 - BLOCK
      ?auto_88097 - BLOCK
      ?auto_88098 - BLOCK
    )
    :vars
    (
      ?auto_88099 - BLOCK
      ?auto_88101 - BLOCK
      ?auto_88100 - BLOCK
      ?auto_88102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88099 ?auto_88098 ) ( ON-TABLE ?auto_88096 ) ( ON ?auto_88097 ?auto_88096 ) ( ON ?auto_88098 ?auto_88097 ) ( not ( = ?auto_88096 ?auto_88097 ) ) ( not ( = ?auto_88096 ?auto_88098 ) ) ( not ( = ?auto_88096 ?auto_88099 ) ) ( not ( = ?auto_88097 ?auto_88098 ) ) ( not ( = ?auto_88097 ?auto_88099 ) ) ( not ( = ?auto_88098 ?auto_88099 ) ) ( not ( = ?auto_88096 ?auto_88101 ) ) ( not ( = ?auto_88096 ?auto_88100 ) ) ( not ( = ?auto_88097 ?auto_88101 ) ) ( not ( = ?auto_88097 ?auto_88100 ) ) ( not ( = ?auto_88098 ?auto_88101 ) ) ( not ( = ?auto_88098 ?auto_88100 ) ) ( not ( = ?auto_88099 ?auto_88101 ) ) ( not ( = ?auto_88099 ?auto_88100 ) ) ( not ( = ?auto_88101 ?auto_88100 ) ) ( ON ?auto_88101 ?auto_88099 ) ( not ( = ?auto_88102 ?auto_88100 ) ) ( not ( = ?auto_88096 ?auto_88102 ) ) ( not ( = ?auto_88097 ?auto_88102 ) ) ( not ( = ?auto_88098 ?auto_88102 ) ) ( not ( = ?auto_88099 ?auto_88102 ) ) ( not ( = ?auto_88101 ?auto_88102 ) ) ( ON ?auto_88100 ?auto_88101 ) ( ON ?auto_88102 ?auto_88100 ) ( CLEAR ?auto_88102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88096 ?auto_88097 ?auto_88098 ?auto_88099 ?auto_88101 ?auto_88100 )
      ( MAKE-3PILE ?auto_88096 ?auto_88097 ?auto_88098 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86927 - BLOCK
      ?auto_86928 - BLOCK
      ?auto_86929 - BLOCK
    )
    :vars
    (
      ?auto_86932 - BLOCK
      ?auto_86930 - BLOCK
      ?auto_86933 - BLOCK
      ?auto_86934 - BLOCK
      ?auto_86931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86932 ?auto_86929 ) ( ON-TABLE ?auto_86927 ) ( ON ?auto_86928 ?auto_86927 ) ( ON ?auto_86929 ?auto_86928 ) ( not ( = ?auto_86927 ?auto_86928 ) ) ( not ( = ?auto_86927 ?auto_86929 ) ) ( not ( = ?auto_86927 ?auto_86932 ) ) ( not ( = ?auto_86928 ?auto_86929 ) ) ( not ( = ?auto_86928 ?auto_86932 ) ) ( not ( = ?auto_86929 ?auto_86932 ) ) ( not ( = ?auto_86927 ?auto_86930 ) ) ( not ( = ?auto_86927 ?auto_86933 ) ) ( not ( = ?auto_86928 ?auto_86930 ) ) ( not ( = ?auto_86928 ?auto_86933 ) ) ( not ( = ?auto_86929 ?auto_86930 ) ) ( not ( = ?auto_86929 ?auto_86933 ) ) ( not ( = ?auto_86932 ?auto_86930 ) ) ( not ( = ?auto_86932 ?auto_86933 ) ) ( not ( = ?auto_86930 ?auto_86933 ) ) ( ON ?auto_86930 ?auto_86932 ) ( not ( = ?auto_86934 ?auto_86931 ) ) ( not ( = ?auto_86934 ?auto_86933 ) ) ( not ( = ?auto_86931 ?auto_86933 ) ) ( not ( = ?auto_86927 ?auto_86931 ) ) ( not ( = ?auto_86927 ?auto_86934 ) ) ( not ( = ?auto_86928 ?auto_86931 ) ) ( not ( = ?auto_86928 ?auto_86934 ) ) ( not ( = ?auto_86929 ?auto_86931 ) ) ( not ( = ?auto_86929 ?auto_86934 ) ) ( not ( = ?auto_86932 ?auto_86931 ) ) ( not ( = ?auto_86932 ?auto_86934 ) ) ( not ( = ?auto_86930 ?auto_86931 ) ) ( not ( = ?auto_86930 ?auto_86934 ) ) ( ON ?auto_86933 ?auto_86930 ) ( ON ?auto_86931 ?auto_86933 ) ( CLEAR ?auto_86931 ) ( HOLDING ?auto_86934 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86934 )
      ( MAKE-3PILE ?auto_86927 ?auto_86928 ?auto_86929 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86935 - BLOCK
      ?auto_86936 - BLOCK
      ?auto_86937 - BLOCK
    )
    :vars
    (
      ?auto_86941 - BLOCK
      ?auto_86940 - BLOCK
      ?auto_86938 - BLOCK
      ?auto_86942 - BLOCK
      ?auto_86939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86941 ?auto_86937 ) ( ON-TABLE ?auto_86935 ) ( ON ?auto_86936 ?auto_86935 ) ( ON ?auto_86937 ?auto_86936 ) ( not ( = ?auto_86935 ?auto_86936 ) ) ( not ( = ?auto_86935 ?auto_86937 ) ) ( not ( = ?auto_86935 ?auto_86941 ) ) ( not ( = ?auto_86936 ?auto_86937 ) ) ( not ( = ?auto_86936 ?auto_86941 ) ) ( not ( = ?auto_86937 ?auto_86941 ) ) ( not ( = ?auto_86935 ?auto_86940 ) ) ( not ( = ?auto_86935 ?auto_86938 ) ) ( not ( = ?auto_86936 ?auto_86940 ) ) ( not ( = ?auto_86936 ?auto_86938 ) ) ( not ( = ?auto_86937 ?auto_86940 ) ) ( not ( = ?auto_86937 ?auto_86938 ) ) ( not ( = ?auto_86941 ?auto_86940 ) ) ( not ( = ?auto_86941 ?auto_86938 ) ) ( not ( = ?auto_86940 ?auto_86938 ) ) ( ON ?auto_86940 ?auto_86941 ) ( not ( = ?auto_86942 ?auto_86939 ) ) ( not ( = ?auto_86942 ?auto_86938 ) ) ( not ( = ?auto_86939 ?auto_86938 ) ) ( not ( = ?auto_86935 ?auto_86939 ) ) ( not ( = ?auto_86935 ?auto_86942 ) ) ( not ( = ?auto_86936 ?auto_86939 ) ) ( not ( = ?auto_86936 ?auto_86942 ) ) ( not ( = ?auto_86937 ?auto_86939 ) ) ( not ( = ?auto_86937 ?auto_86942 ) ) ( not ( = ?auto_86941 ?auto_86939 ) ) ( not ( = ?auto_86941 ?auto_86942 ) ) ( not ( = ?auto_86940 ?auto_86939 ) ) ( not ( = ?auto_86940 ?auto_86942 ) ) ( ON ?auto_86938 ?auto_86940 ) ( ON ?auto_86939 ?auto_86938 ) ( ON ?auto_86942 ?auto_86939 ) ( CLEAR ?auto_86942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86935 ?auto_86936 ?auto_86937 ?auto_86941 ?auto_86940 ?auto_86938 ?auto_86939 )
      ( MAKE-3PILE ?auto_86935 ?auto_86936 ?auto_86937 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86948 - BLOCK
      ?auto_86949 - BLOCK
      ?auto_86950 - BLOCK
      ?auto_86951 - BLOCK
      ?auto_86952 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_86952 ) ( CLEAR ?auto_86951 ) ( ON-TABLE ?auto_86948 ) ( ON ?auto_86949 ?auto_86948 ) ( ON ?auto_86950 ?auto_86949 ) ( ON ?auto_86951 ?auto_86950 ) ( not ( = ?auto_86948 ?auto_86949 ) ) ( not ( = ?auto_86948 ?auto_86950 ) ) ( not ( = ?auto_86948 ?auto_86951 ) ) ( not ( = ?auto_86948 ?auto_86952 ) ) ( not ( = ?auto_86949 ?auto_86950 ) ) ( not ( = ?auto_86949 ?auto_86951 ) ) ( not ( = ?auto_86949 ?auto_86952 ) ) ( not ( = ?auto_86950 ?auto_86951 ) ) ( not ( = ?auto_86950 ?auto_86952 ) ) ( not ( = ?auto_86951 ?auto_86952 ) ) )
    :subtasks
    ( ( !STACK ?auto_86952 ?auto_86951 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86953 - BLOCK
      ?auto_86954 - BLOCK
      ?auto_86955 - BLOCK
      ?auto_86956 - BLOCK
      ?auto_86957 - BLOCK
    )
    :vars
    (
      ?auto_86958 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86956 ) ( ON-TABLE ?auto_86953 ) ( ON ?auto_86954 ?auto_86953 ) ( ON ?auto_86955 ?auto_86954 ) ( ON ?auto_86956 ?auto_86955 ) ( not ( = ?auto_86953 ?auto_86954 ) ) ( not ( = ?auto_86953 ?auto_86955 ) ) ( not ( = ?auto_86953 ?auto_86956 ) ) ( not ( = ?auto_86953 ?auto_86957 ) ) ( not ( = ?auto_86954 ?auto_86955 ) ) ( not ( = ?auto_86954 ?auto_86956 ) ) ( not ( = ?auto_86954 ?auto_86957 ) ) ( not ( = ?auto_86955 ?auto_86956 ) ) ( not ( = ?auto_86955 ?auto_86957 ) ) ( not ( = ?auto_86956 ?auto_86957 ) ) ( ON ?auto_86957 ?auto_86958 ) ( CLEAR ?auto_86957 ) ( HAND-EMPTY ) ( not ( = ?auto_86953 ?auto_86958 ) ) ( not ( = ?auto_86954 ?auto_86958 ) ) ( not ( = ?auto_86955 ?auto_86958 ) ) ( not ( = ?auto_86956 ?auto_86958 ) ) ( not ( = ?auto_86957 ?auto_86958 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86957 ?auto_86958 )
      ( MAKE-5PILE ?auto_86953 ?auto_86954 ?auto_86955 ?auto_86956 ?auto_86957 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86959 - BLOCK
      ?auto_86960 - BLOCK
      ?auto_86961 - BLOCK
      ?auto_86962 - BLOCK
      ?auto_86963 - BLOCK
    )
    :vars
    (
      ?auto_86964 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86959 ) ( ON ?auto_86960 ?auto_86959 ) ( ON ?auto_86961 ?auto_86960 ) ( not ( = ?auto_86959 ?auto_86960 ) ) ( not ( = ?auto_86959 ?auto_86961 ) ) ( not ( = ?auto_86959 ?auto_86962 ) ) ( not ( = ?auto_86959 ?auto_86963 ) ) ( not ( = ?auto_86960 ?auto_86961 ) ) ( not ( = ?auto_86960 ?auto_86962 ) ) ( not ( = ?auto_86960 ?auto_86963 ) ) ( not ( = ?auto_86961 ?auto_86962 ) ) ( not ( = ?auto_86961 ?auto_86963 ) ) ( not ( = ?auto_86962 ?auto_86963 ) ) ( ON ?auto_86963 ?auto_86964 ) ( CLEAR ?auto_86963 ) ( not ( = ?auto_86959 ?auto_86964 ) ) ( not ( = ?auto_86960 ?auto_86964 ) ) ( not ( = ?auto_86961 ?auto_86964 ) ) ( not ( = ?auto_86962 ?auto_86964 ) ) ( not ( = ?auto_86963 ?auto_86964 ) ) ( HOLDING ?auto_86962 ) ( CLEAR ?auto_86961 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86959 ?auto_86960 ?auto_86961 ?auto_86962 )
      ( MAKE-5PILE ?auto_86959 ?auto_86960 ?auto_86961 ?auto_86962 ?auto_86963 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86965 - BLOCK
      ?auto_86966 - BLOCK
      ?auto_86967 - BLOCK
      ?auto_86968 - BLOCK
      ?auto_86969 - BLOCK
    )
    :vars
    (
      ?auto_86970 - BLOCK
      ?auto_86972 - BLOCK
      ?auto_86971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86965 ) ( ON ?auto_86966 ?auto_86965 ) ( ON ?auto_86967 ?auto_86966 ) ( not ( = ?auto_86965 ?auto_86966 ) ) ( not ( = ?auto_86965 ?auto_86967 ) ) ( not ( = ?auto_86965 ?auto_86968 ) ) ( not ( = ?auto_86965 ?auto_86969 ) ) ( not ( = ?auto_86966 ?auto_86967 ) ) ( not ( = ?auto_86966 ?auto_86968 ) ) ( not ( = ?auto_86966 ?auto_86969 ) ) ( not ( = ?auto_86967 ?auto_86968 ) ) ( not ( = ?auto_86967 ?auto_86969 ) ) ( not ( = ?auto_86968 ?auto_86969 ) ) ( ON ?auto_86969 ?auto_86970 ) ( not ( = ?auto_86965 ?auto_86970 ) ) ( not ( = ?auto_86966 ?auto_86970 ) ) ( not ( = ?auto_86967 ?auto_86970 ) ) ( not ( = ?auto_86968 ?auto_86970 ) ) ( not ( = ?auto_86969 ?auto_86970 ) ) ( CLEAR ?auto_86967 ) ( ON ?auto_86968 ?auto_86969 ) ( CLEAR ?auto_86968 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86972 ) ( ON ?auto_86971 ?auto_86972 ) ( ON ?auto_86970 ?auto_86971 ) ( not ( = ?auto_86972 ?auto_86971 ) ) ( not ( = ?auto_86972 ?auto_86970 ) ) ( not ( = ?auto_86972 ?auto_86969 ) ) ( not ( = ?auto_86972 ?auto_86968 ) ) ( not ( = ?auto_86971 ?auto_86970 ) ) ( not ( = ?auto_86971 ?auto_86969 ) ) ( not ( = ?auto_86971 ?auto_86968 ) ) ( not ( = ?auto_86965 ?auto_86972 ) ) ( not ( = ?auto_86965 ?auto_86971 ) ) ( not ( = ?auto_86966 ?auto_86972 ) ) ( not ( = ?auto_86966 ?auto_86971 ) ) ( not ( = ?auto_86967 ?auto_86972 ) ) ( not ( = ?auto_86967 ?auto_86971 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86972 ?auto_86971 ?auto_86970 ?auto_86969 )
      ( MAKE-5PILE ?auto_86965 ?auto_86966 ?auto_86967 ?auto_86968 ?auto_86969 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86973 - BLOCK
      ?auto_86974 - BLOCK
      ?auto_86975 - BLOCK
      ?auto_86976 - BLOCK
      ?auto_86977 - BLOCK
    )
    :vars
    (
      ?auto_86979 - BLOCK
      ?auto_86980 - BLOCK
      ?auto_86978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86973 ) ( ON ?auto_86974 ?auto_86973 ) ( not ( = ?auto_86973 ?auto_86974 ) ) ( not ( = ?auto_86973 ?auto_86975 ) ) ( not ( = ?auto_86973 ?auto_86976 ) ) ( not ( = ?auto_86973 ?auto_86977 ) ) ( not ( = ?auto_86974 ?auto_86975 ) ) ( not ( = ?auto_86974 ?auto_86976 ) ) ( not ( = ?auto_86974 ?auto_86977 ) ) ( not ( = ?auto_86975 ?auto_86976 ) ) ( not ( = ?auto_86975 ?auto_86977 ) ) ( not ( = ?auto_86976 ?auto_86977 ) ) ( ON ?auto_86977 ?auto_86979 ) ( not ( = ?auto_86973 ?auto_86979 ) ) ( not ( = ?auto_86974 ?auto_86979 ) ) ( not ( = ?auto_86975 ?auto_86979 ) ) ( not ( = ?auto_86976 ?auto_86979 ) ) ( not ( = ?auto_86977 ?auto_86979 ) ) ( ON ?auto_86976 ?auto_86977 ) ( CLEAR ?auto_86976 ) ( ON-TABLE ?auto_86980 ) ( ON ?auto_86978 ?auto_86980 ) ( ON ?auto_86979 ?auto_86978 ) ( not ( = ?auto_86980 ?auto_86978 ) ) ( not ( = ?auto_86980 ?auto_86979 ) ) ( not ( = ?auto_86980 ?auto_86977 ) ) ( not ( = ?auto_86980 ?auto_86976 ) ) ( not ( = ?auto_86978 ?auto_86979 ) ) ( not ( = ?auto_86978 ?auto_86977 ) ) ( not ( = ?auto_86978 ?auto_86976 ) ) ( not ( = ?auto_86973 ?auto_86980 ) ) ( not ( = ?auto_86973 ?auto_86978 ) ) ( not ( = ?auto_86974 ?auto_86980 ) ) ( not ( = ?auto_86974 ?auto_86978 ) ) ( not ( = ?auto_86975 ?auto_86980 ) ) ( not ( = ?auto_86975 ?auto_86978 ) ) ( HOLDING ?auto_86975 ) ( CLEAR ?auto_86974 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86973 ?auto_86974 ?auto_86975 )
      ( MAKE-5PILE ?auto_86973 ?auto_86974 ?auto_86975 ?auto_86976 ?auto_86977 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86981 - BLOCK
      ?auto_86982 - BLOCK
      ?auto_86983 - BLOCK
      ?auto_86984 - BLOCK
      ?auto_86985 - BLOCK
    )
    :vars
    (
      ?auto_86987 - BLOCK
      ?auto_86986 - BLOCK
      ?auto_86988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86981 ) ( ON ?auto_86982 ?auto_86981 ) ( not ( = ?auto_86981 ?auto_86982 ) ) ( not ( = ?auto_86981 ?auto_86983 ) ) ( not ( = ?auto_86981 ?auto_86984 ) ) ( not ( = ?auto_86981 ?auto_86985 ) ) ( not ( = ?auto_86982 ?auto_86983 ) ) ( not ( = ?auto_86982 ?auto_86984 ) ) ( not ( = ?auto_86982 ?auto_86985 ) ) ( not ( = ?auto_86983 ?auto_86984 ) ) ( not ( = ?auto_86983 ?auto_86985 ) ) ( not ( = ?auto_86984 ?auto_86985 ) ) ( ON ?auto_86985 ?auto_86987 ) ( not ( = ?auto_86981 ?auto_86987 ) ) ( not ( = ?auto_86982 ?auto_86987 ) ) ( not ( = ?auto_86983 ?auto_86987 ) ) ( not ( = ?auto_86984 ?auto_86987 ) ) ( not ( = ?auto_86985 ?auto_86987 ) ) ( ON ?auto_86984 ?auto_86985 ) ( ON-TABLE ?auto_86986 ) ( ON ?auto_86988 ?auto_86986 ) ( ON ?auto_86987 ?auto_86988 ) ( not ( = ?auto_86986 ?auto_86988 ) ) ( not ( = ?auto_86986 ?auto_86987 ) ) ( not ( = ?auto_86986 ?auto_86985 ) ) ( not ( = ?auto_86986 ?auto_86984 ) ) ( not ( = ?auto_86988 ?auto_86987 ) ) ( not ( = ?auto_86988 ?auto_86985 ) ) ( not ( = ?auto_86988 ?auto_86984 ) ) ( not ( = ?auto_86981 ?auto_86986 ) ) ( not ( = ?auto_86981 ?auto_86988 ) ) ( not ( = ?auto_86982 ?auto_86986 ) ) ( not ( = ?auto_86982 ?auto_86988 ) ) ( not ( = ?auto_86983 ?auto_86986 ) ) ( not ( = ?auto_86983 ?auto_86988 ) ) ( CLEAR ?auto_86982 ) ( ON ?auto_86983 ?auto_86984 ) ( CLEAR ?auto_86983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86986 ?auto_86988 ?auto_86987 ?auto_86985 ?auto_86984 )
      ( MAKE-5PILE ?auto_86981 ?auto_86982 ?auto_86983 ?auto_86984 ?auto_86985 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86989 - BLOCK
      ?auto_86990 - BLOCK
      ?auto_86991 - BLOCK
      ?auto_86992 - BLOCK
      ?auto_86993 - BLOCK
    )
    :vars
    (
      ?auto_86996 - BLOCK
      ?auto_86995 - BLOCK
      ?auto_86994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86989 ) ( not ( = ?auto_86989 ?auto_86990 ) ) ( not ( = ?auto_86989 ?auto_86991 ) ) ( not ( = ?auto_86989 ?auto_86992 ) ) ( not ( = ?auto_86989 ?auto_86993 ) ) ( not ( = ?auto_86990 ?auto_86991 ) ) ( not ( = ?auto_86990 ?auto_86992 ) ) ( not ( = ?auto_86990 ?auto_86993 ) ) ( not ( = ?auto_86991 ?auto_86992 ) ) ( not ( = ?auto_86991 ?auto_86993 ) ) ( not ( = ?auto_86992 ?auto_86993 ) ) ( ON ?auto_86993 ?auto_86996 ) ( not ( = ?auto_86989 ?auto_86996 ) ) ( not ( = ?auto_86990 ?auto_86996 ) ) ( not ( = ?auto_86991 ?auto_86996 ) ) ( not ( = ?auto_86992 ?auto_86996 ) ) ( not ( = ?auto_86993 ?auto_86996 ) ) ( ON ?auto_86992 ?auto_86993 ) ( ON-TABLE ?auto_86995 ) ( ON ?auto_86994 ?auto_86995 ) ( ON ?auto_86996 ?auto_86994 ) ( not ( = ?auto_86995 ?auto_86994 ) ) ( not ( = ?auto_86995 ?auto_86996 ) ) ( not ( = ?auto_86995 ?auto_86993 ) ) ( not ( = ?auto_86995 ?auto_86992 ) ) ( not ( = ?auto_86994 ?auto_86996 ) ) ( not ( = ?auto_86994 ?auto_86993 ) ) ( not ( = ?auto_86994 ?auto_86992 ) ) ( not ( = ?auto_86989 ?auto_86995 ) ) ( not ( = ?auto_86989 ?auto_86994 ) ) ( not ( = ?auto_86990 ?auto_86995 ) ) ( not ( = ?auto_86990 ?auto_86994 ) ) ( not ( = ?auto_86991 ?auto_86995 ) ) ( not ( = ?auto_86991 ?auto_86994 ) ) ( ON ?auto_86991 ?auto_86992 ) ( CLEAR ?auto_86991 ) ( HOLDING ?auto_86990 ) ( CLEAR ?auto_86989 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86989 ?auto_86990 )
      ( MAKE-5PILE ?auto_86989 ?auto_86990 ?auto_86991 ?auto_86992 ?auto_86993 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86997 - BLOCK
      ?auto_86998 - BLOCK
      ?auto_86999 - BLOCK
      ?auto_87000 - BLOCK
      ?auto_87001 - BLOCK
    )
    :vars
    (
      ?auto_87003 - BLOCK
      ?auto_87004 - BLOCK
      ?auto_87002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86997 ) ( not ( = ?auto_86997 ?auto_86998 ) ) ( not ( = ?auto_86997 ?auto_86999 ) ) ( not ( = ?auto_86997 ?auto_87000 ) ) ( not ( = ?auto_86997 ?auto_87001 ) ) ( not ( = ?auto_86998 ?auto_86999 ) ) ( not ( = ?auto_86998 ?auto_87000 ) ) ( not ( = ?auto_86998 ?auto_87001 ) ) ( not ( = ?auto_86999 ?auto_87000 ) ) ( not ( = ?auto_86999 ?auto_87001 ) ) ( not ( = ?auto_87000 ?auto_87001 ) ) ( ON ?auto_87001 ?auto_87003 ) ( not ( = ?auto_86997 ?auto_87003 ) ) ( not ( = ?auto_86998 ?auto_87003 ) ) ( not ( = ?auto_86999 ?auto_87003 ) ) ( not ( = ?auto_87000 ?auto_87003 ) ) ( not ( = ?auto_87001 ?auto_87003 ) ) ( ON ?auto_87000 ?auto_87001 ) ( ON-TABLE ?auto_87004 ) ( ON ?auto_87002 ?auto_87004 ) ( ON ?auto_87003 ?auto_87002 ) ( not ( = ?auto_87004 ?auto_87002 ) ) ( not ( = ?auto_87004 ?auto_87003 ) ) ( not ( = ?auto_87004 ?auto_87001 ) ) ( not ( = ?auto_87004 ?auto_87000 ) ) ( not ( = ?auto_87002 ?auto_87003 ) ) ( not ( = ?auto_87002 ?auto_87001 ) ) ( not ( = ?auto_87002 ?auto_87000 ) ) ( not ( = ?auto_86997 ?auto_87004 ) ) ( not ( = ?auto_86997 ?auto_87002 ) ) ( not ( = ?auto_86998 ?auto_87004 ) ) ( not ( = ?auto_86998 ?auto_87002 ) ) ( not ( = ?auto_86999 ?auto_87004 ) ) ( not ( = ?auto_86999 ?auto_87002 ) ) ( ON ?auto_86999 ?auto_87000 ) ( CLEAR ?auto_86997 ) ( ON ?auto_86998 ?auto_86999 ) ( CLEAR ?auto_86998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87004 ?auto_87002 ?auto_87003 ?auto_87001 ?auto_87000 ?auto_86999 )
      ( MAKE-5PILE ?auto_86997 ?auto_86998 ?auto_86999 ?auto_87000 ?auto_87001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87005 - BLOCK
      ?auto_87006 - BLOCK
      ?auto_87007 - BLOCK
      ?auto_87008 - BLOCK
      ?auto_87009 - BLOCK
    )
    :vars
    (
      ?auto_87011 - BLOCK
      ?auto_87012 - BLOCK
      ?auto_87010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87005 ?auto_87006 ) ) ( not ( = ?auto_87005 ?auto_87007 ) ) ( not ( = ?auto_87005 ?auto_87008 ) ) ( not ( = ?auto_87005 ?auto_87009 ) ) ( not ( = ?auto_87006 ?auto_87007 ) ) ( not ( = ?auto_87006 ?auto_87008 ) ) ( not ( = ?auto_87006 ?auto_87009 ) ) ( not ( = ?auto_87007 ?auto_87008 ) ) ( not ( = ?auto_87007 ?auto_87009 ) ) ( not ( = ?auto_87008 ?auto_87009 ) ) ( ON ?auto_87009 ?auto_87011 ) ( not ( = ?auto_87005 ?auto_87011 ) ) ( not ( = ?auto_87006 ?auto_87011 ) ) ( not ( = ?auto_87007 ?auto_87011 ) ) ( not ( = ?auto_87008 ?auto_87011 ) ) ( not ( = ?auto_87009 ?auto_87011 ) ) ( ON ?auto_87008 ?auto_87009 ) ( ON-TABLE ?auto_87012 ) ( ON ?auto_87010 ?auto_87012 ) ( ON ?auto_87011 ?auto_87010 ) ( not ( = ?auto_87012 ?auto_87010 ) ) ( not ( = ?auto_87012 ?auto_87011 ) ) ( not ( = ?auto_87012 ?auto_87009 ) ) ( not ( = ?auto_87012 ?auto_87008 ) ) ( not ( = ?auto_87010 ?auto_87011 ) ) ( not ( = ?auto_87010 ?auto_87009 ) ) ( not ( = ?auto_87010 ?auto_87008 ) ) ( not ( = ?auto_87005 ?auto_87012 ) ) ( not ( = ?auto_87005 ?auto_87010 ) ) ( not ( = ?auto_87006 ?auto_87012 ) ) ( not ( = ?auto_87006 ?auto_87010 ) ) ( not ( = ?auto_87007 ?auto_87012 ) ) ( not ( = ?auto_87007 ?auto_87010 ) ) ( ON ?auto_87007 ?auto_87008 ) ( ON ?auto_87006 ?auto_87007 ) ( CLEAR ?auto_87006 ) ( HOLDING ?auto_87005 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87005 )
      ( MAKE-5PILE ?auto_87005 ?auto_87006 ?auto_87007 ?auto_87008 ?auto_87009 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87013 - BLOCK
      ?auto_87014 - BLOCK
      ?auto_87015 - BLOCK
      ?auto_87016 - BLOCK
      ?auto_87017 - BLOCK
    )
    :vars
    (
      ?auto_87020 - BLOCK
      ?auto_87019 - BLOCK
      ?auto_87018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87013 ?auto_87014 ) ) ( not ( = ?auto_87013 ?auto_87015 ) ) ( not ( = ?auto_87013 ?auto_87016 ) ) ( not ( = ?auto_87013 ?auto_87017 ) ) ( not ( = ?auto_87014 ?auto_87015 ) ) ( not ( = ?auto_87014 ?auto_87016 ) ) ( not ( = ?auto_87014 ?auto_87017 ) ) ( not ( = ?auto_87015 ?auto_87016 ) ) ( not ( = ?auto_87015 ?auto_87017 ) ) ( not ( = ?auto_87016 ?auto_87017 ) ) ( ON ?auto_87017 ?auto_87020 ) ( not ( = ?auto_87013 ?auto_87020 ) ) ( not ( = ?auto_87014 ?auto_87020 ) ) ( not ( = ?auto_87015 ?auto_87020 ) ) ( not ( = ?auto_87016 ?auto_87020 ) ) ( not ( = ?auto_87017 ?auto_87020 ) ) ( ON ?auto_87016 ?auto_87017 ) ( ON-TABLE ?auto_87019 ) ( ON ?auto_87018 ?auto_87019 ) ( ON ?auto_87020 ?auto_87018 ) ( not ( = ?auto_87019 ?auto_87018 ) ) ( not ( = ?auto_87019 ?auto_87020 ) ) ( not ( = ?auto_87019 ?auto_87017 ) ) ( not ( = ?auto_87019 ?auto_87016 ) ) ( not ( = ?auto_87018 ?auto_87020 ) ) ( not ( = ?auto_87018 ?auto_87017 ) ) ( not ( = ?auto_87018 ?auto_87016 ) ) ( not ( = ?auto_87013 ?auto_87019 ) ) ( not ( = ?auto_87013 ?auto_87018 ) ) ( not ( = ?auto_87014 ?auto_87019 ) ) ( not ( = ?auto_87014 ?auto_87018 ) ) ( not ( = ?auto_87015 ?auto_87019 ) ) ( not ( = ?auto_87015 ?auto_87018 ) ) ( ON ?auto_87015 ?auto_87016 ) ( ON ?auto_87014 ?auto_87015 ) ( ON ?auto_87013 ?auto_87014 ) ( CLEAR ?auto_87013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87019 ?auto_87018 ?auto_87020 ?auto_87017 ?auto_87016 ?auto_87015 ?auto_87014 )
      ( MAKE-5PILE ?auto_87013 ?auto_87014 ?auto_87015 ?auto_87016 ?auto_87017 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87023 - BLOCK
      ?auto_87024 - BLOCK
    )
    :vars
    (
      ?auto_87025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87025 ?auto_87024 ) ( CLEAR ?auto_87025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87023 ) ( ON ?auto_87024 ?auto_87023 ) ( not ( = ?auto_87023 ?auto_87024 ) ) ( not ( = ?auto_87023 ?auto_87025 ) ) ( not ( = ?auto_87024 ?auto_87025 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87025 ?auto_87024 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87026 - BLOCK
      ?auto_87027 - BLOCK
    )
    :vars
    (
      ?auto_87028 - BLOCK
      ?auto_87029 - BLOCK
      ?auto_87030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87028 ?auto_87027 ) ( CLEAR ?auto_87028 ) ( ON-TABLE ?auto_87026 ) ( ON ?auto_87027 ?auto_87026 ) ( not ( = ?auto_87026 ?auto_87027 ) ) ( not ( = ?auto_87026 ?auto_87028 ) ) ( not ( = ?auto_87027 ?auto_87028 ) ) ( HOLDING ?auto_87029 ) ( CLEAR ?auto_87030 ) ( not ( = ?auto_87026 ?auto_87029 ) ) ( not ( = ?auto_87026 ?auto_87030 ) ) ( not ( = ?auto_87027 ?auto_87029 ) ) ( not ( = ?auto_87027 ?auto_87030 ) ) ( not ( = ?auto_87028 ?auto_87029 ) ) ( not ( = ?auto_87028 ?auto_87030 ) ) ( not ( = ?auto_87029 ?auto_87030 ) ) )
    :subtasks
    ( ( !STACK ?auto_87029 ?auto_87030 )
      ( MAKE-2PILE ?auto_87026 ?auto_87027 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87031 - BLOCK
      ?auto_87032 - BLOCK
    )
    :vars
    (
      ?auto_87034 - BLOCK
      ?auto_87033 - BLOCK
      ?auto_87035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87034 ?auto_87032 ) ( ON-TABLE ?auto_87031 ) ( ON ?auto_87032 ?auto_87031 ) ( not ( = ?auto_87031 ?auto_87032 ) ) ( not ( = ?auto_87031 ?auto_87034 ) ) ( not ( = ?auto_87032 ?auto_87034 ) ) ( CLEAR ?auto_87033 ) ( not ( = ?auto_87031 ?auto_87035 ) ) ( not ( = ?auto_87031 ?auto_87033 ) ) ( not ( = ?auto_87032 ?auto_87035 ) ) ( not ( = ?auto_87032 ?auto_87033 ) ) ( not ( = ?auto_87034 ?auto_87035 ) ) ( not ( = ?auto_87034 ?auto_87033 ) ) ( not ( = ?auto_87035 ?auto_87033 ) ) ( ON ?auto_87035 ?auto_87034 ) ( CLEAR ?auto_87035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87031 ?auto_87032 ?auto_87034 )
      ( MAKE-2PILE ?auto_87031 ?auto_87032 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87036 - BLOCK
      ?auto_87037 - BLOCK
    )
    :vars
    (
      ?auto_87038 - BLOCK
      ?auto_87040 - BLOCK
      ?auto_87039 - BLOCK
      ?auto_87042 - BLOCK
      ?auto_87043 - BLOCK
      ?auto_87041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87038 ?auto_87037 ) ( ON-TABLE ?auto_87036 ) ( ON ?auto_87037 ?auto_87036 ) ( not ( = ?auto_87036 ?auto_87037 ) ) ( not ( = ?auto_87036 ?auto_87038 ) ) ( not ( = ?auto_87037 ?auto_87038 ) ) ( not ( = ?auto_87036 ?auto_87040 ) ) ( not ( = ?auto_87036 ?auto_87039 ) ) ( not ( = ?auto_87037 ?auto_87040 ) ) ( not ( = ?auto_87037 ?auto_87039 ) ) ( not ( = ?auto_87038 ?auto_87040 ) ) ( not ( = ?auto_87038 ?auto_87039 ) ) ( not ( = ?auto_87040 ?auto_87039 ) ) ( ON ?auto_87040 ?auto_87038 ) ( CLEAR ?auto_87040 ) ( HOLDING ?auto_87039 ) ( CLEAR ?auto_87042 ) ( ON-TABLE ?auto_87043 ) ( ON ?auto_87041 ?auto_87043 ) ( ON ?auto_87042 ?auto_87041 ) ( not ( = ?auto_87043 ?auto_87041 ) ) ( not ( = ?auto_87043 ?auto_87042 ) ) ( not ( = ?auto_87043 ?auto_87039 ) ) ( not ( = ?auto_87041 ?auto_87042 ) ) ( not ( = ?auto_87041 ?auto_87039 ) ) ( not ( = ?auto_87042 ?auto_87039 ) ) ( not ( = ?auto_87036 ?auto_87042 ) ) ( not ( = ?auto_87036 ?auto_87043 ) ) ( not ( = ?auto_87036 ?auto_87041 ) ) ( not ( = ?auto_87037 ?auto_87042 ) ) ( not ( = ?auto_87037 ?auto_87043 ) ) ( not ( = ?auto_87037 ?auto_87041 ) ) ( not ( = ?auto_87038 ?auto_87042 ) ) ( not ( = ?auto_87038 ?auto_87043 ) ) ( not ( = ?auto_87038 ?auto_87041 ) ) ( not ( = ?auto_87040 ?auto_87042 ) ) ( not ( = ?auto_87040 ?auto_87043 ) ) ( not ( = ?auto_87040 ?auto_87041 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87043 ?auto_87041 ?auto_87042 ?auto_87039 )
      ( MAKE-2PILE ?auto_87036 ?auto_87037 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87044 - BLOCK
      ?auto_87045 - BLOCK
    )
    :vars
    (
      ?auto_87046 - BLOCK
      ?auto_87050 - BLOCK
      ?auto_87048 - BLOCK
      ?auto_87047 - BLOCK
      ?auto_87049 - BLOCK
      ?auto_87051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87046 ?auto_87045 ) ( ON-TABLE ?auto_87044 ) ( ON ?auto_87045 ?auto_87044 ) ( not ( = ?auto_87044 ?auto_87045 ) ) ( not ( = ?auto_87044 ?auto_87046 ) ) ( not ( = ?auto_87045 ?auto_87046 ) ) ( not ( = ?auto_87044 ?auto_87050 ) ) ( not ( = ?auto_87044 ?auto_87048 ) ) ( not ( = ?auto_87045 ?auto_87050 ) ) ( not ( = ?auto_87045 ?auto_87048 ) ) ( not ( = ?auto_87046 ?auto_87050 ) ) ( not ( = ?auto_87046 ?auto_87048 ) ) ( not ( = ?auto_87050 ?auto_87048 ) ) ( ON ?auto_87050 ?auto_87046 ) ( CLEAR ?auto_87047 ) ( ON-TABLE ?auto_87049 ) ( ON ?auto_87051 ?auto_87049 ) ( ON ?auto_87047 ?auto_87051 ) ( not ( = ?auto_87049 ?auto_87051 ) ) ( not ( = ?auto_87049 ?auto_87047 ) ) ( not ( = ?auto_87049 ?auto_87048 ) ) ( not ( = ?auto_87051 ?auto_87047 ) ) ( not ( = ?auto_87051 ?auto_87048 ) ) ( not ( = ?auto_87047 ?auto_87048 ) ) ( not ( = ?auto_87044 ?auto_87047 ) ) ( not ( = ?auto_87044 ?auto_87049 ) ) ( not ( = ?auto_87044 ?auto_87051 ) ) ( not ( = ?auto_87045 ?auto_87047 ) ) ( not ( = ?auto_87045 ?auto_87049 ) ) ( not ( = ?auto_87045 ?auto_87051 ) ) ( not ( = ?auto_87046 ?auto_87047 ) ) ( not ( = ?auto_87046 ?auto_87049 ) ) ( not ( = ?auto_87046 ?auto_87051 ) ) ( not ( = ?auto_87050 ?auto_87047 ) ) ( not ( = ?auto_87050 ?auto_87049 ) ) ( not ( = ?auto_87050 ?auto_87051 ) ) ( ON ?auto_87048 ?auto_87050 ) ( CLEAR ?auto_87048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87044 ?auto_87045 ?auto_87046 ?auto_87050 )
      ( MAKE-2PILE ?auto_87044 ?auto_87045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87052 - BLOCK
      ?auto_87053 - BLOCK
    )
    :vars
    (
      ?auto_87055 - BLOCK
      ?auto_87056 - BLOCK
      ?auto_87054 - BLOCK
      ?auto_87059 - BLOCK
      ?auto_87057 - BLOCK
      ?auto_87058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87055 ?auto_87053 ) ( ON-TABLE ?auto_87052 ) ( ON ?auto_87053 ?auto_87052 ) ( not ( = ?auto_87052 ?auto_87053 ) ) ( not ( = ?auto_87052 ?auto_87055 ) ) ( not ( = ?auto_87053 ?auto_87055 ) ) ( not ( = ?auto_87052 ?auto_87056 ) ) ( not ( = ?auto_87052 ?auto_87054 ) ) ( not ( = ?auto_87053 ?auto_87056 ) ) ( not ( = ?auto_87053 ?auto_87054 ) ) ( not ( = ?auto_87055 ?auto_87056 ) ) ( not ( = ?auto_87055 ?auto_87054 ) ) ( not ( = ?auto_87056 ?auto_87054 ) ) ( ON ?auto_87056 ?auto_87055 ) ( ON-TABLE ?auto_87059 ) ( ON ?auto_87057 ?auto_87059 ) ( not ( = ?auto_87059 ?auto_87057 ) ) ( not ( = ?auto_87059 ?auto_87058 ) ) ( not ( = ?auto_87059 ?auto_87054 ) ) ( not ( = ?auto_87057 ?auto_87058 ) ) ( not ( = ?auto_87057 ?auto_87054 ) ) ( not ( = ?auto_87058 ?auto_87054 ) ) ( not ( = ?auto_87052 ?auto_87058 ) ) ( not ( = ?auto_87052 ?auto_87059 ) ) ( not ( = ?auto_87052 ?auto_87057 ) ) ( not ( = ?auto_87053 ?auto_87058 ) ) ( not ( = ?auto_87053 ?auto_87059 ) ) ( not ( = ?auto_87053 ?auto_87057 ) ) ( not ( = ?auto_87055 ?auto_87058 ) ) ( not ( = ?auto_87055 ?auto_87059 ) ) ( not ( = ?auto_87055 ?auto_87057 ) ) ( not ( = ?auto_87056 ?auto_87058 ) ) ( not ( = ?auto_87056 ?auto_87059 ) ) ( not ( = ?auto_87056 ?auto_87057 ) ) ( ON ?auto_87054 ?auto_87056 ) ( CLEAR ?auto_87054 ) ( HOLDING ?auto_87058 ) ( CLEAR ?auto_87057 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87059 ?auto_87057 ?auto_87058 )
      ( MAKE-2PILE ?auto_87052 ?auto_87053 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87060 - BLOCK
      ?auto_87061 - BLOCK
    )
    :vars
    (
      ?auto_87066 - BLOCK
      ?auto_87062 - BLOCK
      ?auto_87065 - BLOCK
      ?auto_87064 - BLOCK
      ?auto_87063 - BLOCK
      ?auto_87067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87066 ?auto_87061 ) ( ON-TABLE ?auto_87060 ) ( ON ?auto_87061 ?auto_87060 ) ( not ( = ?auto_87060 ?auto_87061 ) ) ( not ( = ?auto_87060 ?auto_87066 ) ) ( not ( = ?auto_87061 ?auto_87066 ) ) ( not ( = ?auto_87060 ?auto_87062 ) ) ( not ( = ?auto_87060 ?auto_87065 ) ) ( not ( = ?auto_87061 ?auto_87062 ) ) ( not ( = ?auto_87061 ?auto_87065 ) ) ( not ( = ?auto_87066 ?auto_87062 ) ) ( not ( = ?auto_87066 ?auto_87065 ) ) ( not ( = ?auto_87062 ?auto_87065 ) ) ( ON ?auto_87062 ?auto_87066 ) ( ON-TABLE ?auto_87064 ) ( ON ?auto_87063 ?auto_87064 ) ( not ( = ?auto_87064 ?auto_87063 ) ) ( not ( = ?auto_87064 ?auto_87067 ) ) ( not ( = ?auto_87064 ?auto_87065 ) ) ( not ( = ?auto_87063 ?auto_87067 ) ) ( not ( = ?auto_87063 ?auto_87065 ) ) ( not ( = ?auto_87067 ?auto_87065 ) ) ( not ( = ?auto_87060 ?auto_87067 ) ) ( not ( = ?auto_87060 ?auto_87064 ) ) ( not ( = ?auto_87060 ?auto_87063 ) ) ( not ( = ?auto_87061 ?auto_87067 ) ) ( not ( = ?auto_87061 ?auto_87064 ) ) ( not ( = ?auto_87061 ?auto_87063 ) ) ( not ( = ?auto_87066 ?auto_87067 ) ) ( not ( = ?auto_87066 ?auto_87064 ) ) ( not ( = ?auto_87066 ?auto_87063 ) ) ( not ( = ?auto_87062 ?auto_87067 ) ) ( not ( = ?auto_87062 ?auto_87064 ) ) ( not ( = ?auto_87062 ?auto_87063 ) ) ( ON ?auto_87065 ?auto_87062 ) ( CLEAR ?auto_87063 ) ( ON ?auto_87067 ?auto_87065 ) ( CLEAR ?auto_87067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87060 ?auto_87061 ?auto_87066 ?auto_87062 ?auto_87065 )
      ( MAKE-2PILE ?auto_87060 ?auto_87061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87068 - BLOCK
      ?auto_87069 - BLOCK
    )
    :vars
    (
      ?auto_87071 - BLOCK
      ?auto_87070 - BLOCK
      ?auto_87072 - BLOCK
      ?auto_87074 - BLOCK
      ?auto_87075 - BLOCK
      ?auto_87073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87071 ?auto_87069 ) ( ON-TABLE ?auto_87068 ) ( ON ?auto_87069 ?auto_87068 ) ( not ( = ?auto_87068 ?auto_87069 ) ) ( not ( = ?auto_87068 ?auto_87071 ) ) ( not ( = ?auto_87069 ?auto_87071 ) ) ( not ( = ?auto_87068 ?auto_87070 ) ) ( not ( = ?auto_87068 ?auto_87072 ) ) ( not ( = ?auto_87069 ?auto_87070 ) ) ( not ( = ?auto_87069 ?auto_87072 ) ) ( not ( = ?auto_87071 ?auto_87070 ) ) ( not ( = ?auto_87071 ?auto_87072 ) ) ( not ( = ?auto_87070 ?auto_87072 ) ) ( ON ?auto_87070 ?auto_87071 ) ( ON-TABLE ?auto_87074 ) ( not ( = ?auto_87074 ?auto_87075 ) ) ( not ( = ?auto_87074 ?auto_87073 ) ) ( not ( = ?auto_87074 ?auto_87072 ) ) ( not ( = ?auto_87075 ?auto_87073 ) ) ( not ( = ?auto_87075 ?auto_87072 ) ) ( not ( = ?auto_87073 ?auto_87072 ) ) ( not ( = ?auto_87068 ?auto_87073 ) ) ( not ( = ?auto_87068 ?auto_87074 ) ) ( not ( = ?auto_87068 ?auto_87075 ) ) ( not ( = ?auto_87069 ?auto_87073 ) ) ( not ( = ?auto_87069 ?auto_87074 ) ) ( not ( = ?auto_87069 ?auto_87075 ) ) ( not ( = ?auto_87071 ?auto_87073 ) ) ( not ( = ?auto_87071 ?auto_87074 ) ) ( not ( = ?auto_87071 ?auto_87075 ) ) ( not ( = ?auto_87070 ?auto_87073 ) ) ( not ( = ?auto_87070 ?auto_87074 ) ) ( not ( = ?auto_87070 ?auto_87075 ) ) ( ON ?auto_87072 ?auto_87070 ) ( ON ?auto_87073 ?auto_87072 ) ( CLEAR ?auto_87073 ) ( HOLDING ?auto_87075 ) ( CLEAR ?auto_87074 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87074 ?auto_87075 )
      ( MAKE-2PILE ?auto_87068 ?auto_87069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88369 - BLOCK
      ?auto_88370 - BLOCK
    )
    :vars
    (
      ?auto_88372 - BLOCK
      ?auto_88375 - BLOCK
      ?auto_88373 - BLOCK
      ?auto_88371 - BLOCK
      ?auto_88374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88372 ?auto_88370 ) ( ON-TABLE ?auto_88369 ) ( ON ?auto_88370 ?auto_88369 ) ( not ( = ?auto_88369 ?auto_88370 ) ) ( not ( = ?auto_88369 ?auto_88372 ) ) ( not ( = ?auto_88370 ?auto_88372 ) ) ( not ( = ?auto_88369 ?auto_88375 ) ) ( not ( = ?auto_88369 ?auto_88373 ) ) ( not ( = ?auto_88370 ?auto_88375 ) ) ( not ( = ?auto_88370 ?auto_88373 ) ) ( not ( = ?auto_88372 ?auto_88375 ) ) ( not ( = ?auto_88372 ?auto_88373 ) ) ( not ( = ?auto_88375 ?auto_88373 ) ) ( ON ?auto_88375 ?auto_88372 ) ( not ( = ?auto_88371 ?auto_88374 ) ) ( not ( = ?auto_88371 ?auto_88373 ) ) ( not ( = ?auto_88374 ?auto_88373 ) ) ( not ( = ?auto_88369 ?auto_88374 ) ) ( not ( = ?auto_88369 ?auto_88371 ) ) ( not ( = ?auto_88370 ?auto_88374 ) ) ( not ( = ?auto_88370 ?auto_88371 ) ) ( not ( = ?auto_88372 ?auto_88374 ) ) ( not ( = ?auto_88372 ?auto_88371 ) ) ( not ( = ?auto_88375 ?auto_88374 ) ) ( not ( = ?auto_88375 ?auto_88371 ) ) ( ON ?auto_88373 ?auto_88375 ) ( ON ?auto_88374 ?auto_88373 ) ( ON ?auto_88371 ?auto_88374 ) ( CLEAR ?auto_88371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88369 ?auto_88370 ?auto_88372 ?auto_88375 ?auto_88373 ?auto_88374 )
      ( MAKE-2PILE ?auto_88369 ?auto_88370 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87084 - BLOCK
      ?auto_87085 - BLOCK
    )
    :vars
    (
      ?auto_87088 - BLOCK
      ?auto_87089 - BLOCK
      ?auto_87087 - BLOCK
      ?auto_87086 - BLOCK
      ?auto_87091 - BLOCK
      ?auto_87090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87088 ?auto_87085 ) ( ON-TABLE ?auto_87084 ) ( ON ?auto_87085 ?auto_87084 ) ( not ( = ?auto_87084 ?auto_87085 ) ) ( not ( = ?auto_87084 ?auto_87088 ) ) ( not ( = ?auto_87085 ?auto_87088 ) ) ( not ( = ?auto_87084 ?auto_87089 ) ) ( not ( = ?auto_87084 ?auto_87087 ) ) ( not ( = ?auto_87085 ?auto_87089 ) ) ( not ( = ?auto_87085 ?auto_87087 ) ) ( not ( = ?auto_87088 ?auto_87089 ) ) ( not ( = ?auto_87088 ?auto_87087 ) ) ( not ( = ?auto_87089 ?auto_87087 ) ) ( ON ?auto_87089 ?auto_87088 ) ( not ( = ?auto_87086 ?auto_87091 ) ) ( not ( = ?auto_87086 ?auto_87090 ) ) ( not ( = ?auto_87086 ?auto_87087 ) ) ( not ( = ?auto_87091 ?auto_87090 ) ) ( not ( = ?auto_87091 ?auto_87087 ) ) ( not ( = ?auto_87090 ?auto_87087 ) ) ( not ( = ?auto_87084 ?auto_87090 ) ) ( not ( = ?auto_87084 ?auto_87086 ) ) ( not ( = ?auto_87084 ?auto_87091 ) ) ( not ( = ?auto_87085 ?auto_87090 ) ) ( not ( = ?auto_87085 ?auto_87086 ) ) ( not ( = ?auto_87085 ?auto_87091 ) ) ( not ( = ?auto_87088 ?auto_87090 ) ) ( not ( = ?auto_87088 ?auto_87086 ) ) ( not ( = ?auto_87088 ?auto_87091 ) ) ( not ( = ?auto_87089 ?auto_87090 ) ) ( not ( = ?auto_87089 ?auto_87086 ) ) ( not ( = ?auto_87089 ?auto_87091 ) ) ( ON ?auto_87087 ?auto_87089 ) ( ON ?auto_87090 ?auto_87087 ) ( ON ?auto_87091 ?auto_87090 ) ( CLEAR ?auto_87091 ) ( HOLDING ?auto_87086 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87086 )
      ( MAKE-2PILE ?auto_87084 ?auto_87085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87092 - BLOCK
      ?auto_87093 - BLOCK
    )
    :vars
    (
      ?auto_87095 - BLOCK
      ?auto_87097 - BLOCK
      ?auto_87098 - BLOCK
      ?auto_87096 - BLOCK
      ?auto_87099 - BLOCK
      ?auto_87094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87095 ?auto_87093 ) ( ON-TABLE ?auto_87092 ) ( ON ?auto_87093 ?auto_87092 ) ( not ( = ?auto_87092 ?auto_87093 ) ) ( not ( = ?auto_87092 ?auto_87095 ) ) ( not ( = ?auto_87093 ?auto_87095 ) ) ( not ( = ?auto_87092 ?auto_87097 ) ) ( not ( = ?auto_87092 ?auto_87098 ) ) ( not ( = ?auto_87093 ?auto_87097 ) ) ( not ( = ?auto_87093 ?auto_87098 ) ) ( not ( = ?auto_87095 ?auto_87097 ) ) ( not ( = ?auto_87095 ?auto_87098 ) ) ( not ( = ?auto_87097 ?auto_87098 ) ) ( ON ?auto_87097 ?auto_87095 ) ( not ( = ?auto_87096 ?auto_87099 ) ) ( not ( = ?auto_87096 ?auto_87094 ) ) ( not ( = ?auto_87096 ?auto_87098 ) ) ( not ( = ?auto_87099 ?auto_87094 ) ) ( not ( = ?auto_87099 ?auto_87098 ) ) ( not ( = ?auto_87094 ?auto_87098 ) ) ( not ( = ?auto_87092 ?auto_87094 ) ) ( not ( = ?auto_87092 ?auto_87096 ) ) ( not ( = ?auto_87092 ?auto_87099 ) ) ( not ( = ?auto_87093 ?auto_87094 ) ) ( not ( = ?auto_87093 ?auto_87096 ) ) ( not ( = ?auto_87093 ?auto_87099 ) ) ( not ( = ?auto_87095 ?auto_87094 ) ) ( not ( = ?auto_87095 ?auto_87096 ) ) ( not ( = ?auto_87095 ?auto_87099 ) ) ( not ( = ?auto_87097 ?auto_87094 ) ) ( not ( = ?auto_87097 ?auto_87096 ) ) ( not ( = ?auto_87097 ?auto_87099 ) ) ( ON ?auto_87098 ?auto_87097 ) ( ON ?auto_87094 ?auto_87098 ) ( ON ?auto_87099 ?auto_87094 ) ( ON ?auto_87096 ?auto_87099 ) ( CLEAR ?auto_87096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87092 ?auto_87093 ?auto_87095 ?auto_87097 ?auto_87098 ?auto_87094 ?auto_87099 )
      ( MAKE-2PILE ?auto_87092 ?auto_87093 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87106 - BLOCK
      ?auto_87107 - BLOCK
      ?auto_87108 - BLOCK
      ?auto_87109 - BLOCK
      ?auto_87110 - BLOCK
      ?auto_87111 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_87111 ) ( CLEAR ?auto_87110 ) ( ON-TABLE ?auto_87106 ) ( ON ?auto_87107 ?auto_87106 ) ( ON ?auto_87108 ?auto_87107 ) ( ON ?auto_87109 ?auto_87108 ) ( ON ?auto_87110 ?auto_87109 ) ( not ( = ?auto_87106 ?auto_87107 ) ) ( not ( = ?auto_87106 ?auto_87108 ) ) ( not ( = ?auto_87106 ?auto_87109 ) ) ( not ( = ?auto_87106 ?auto_87110 ) ) ( not ( = ?auto_87106 ?auto_87111 ) ) ( not ( = ?auto_87107 ?auto_87108 ) ) ( not ( = ?auto_87107 ?auto_87109 ) ) ( not ( = ?auto_87107 ?auto_87110 ) ) ( not ( = ?auto_87107 ?auto_87111 ) ) ( not ( = ?auto_87108 ?auto_87109 ) ) ( not ( = ?auto_87108 ?auto_87110 ) ) ( not ( = ?auto_87108 ?auto_87111 ) ) ( not ( = ?auto_87109 ?auto_87110 ) ) ( not ( = ?auto_87109 ?auto_87111 ) ) ( not ( = ?auto_87110 ?auto_87111 ) ) )
    :subtasks
    ( ( !STACK ?auto_87111 ?auto_87110 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87112 - BLOCK
      ?auto_87113 - BLOCK
      ?auto_87114 - BLOCK
      ?auto_87115 - BLOCK
      ?auto_87116 - BLOCK
      ?auto_87117 - BLOCK
    )
    :vars
    (
      ?auto_87118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_87116 ) ( ON-TABLE ?auto_87112 ) ( ON ?auto_87113 ?auto_87112 ) ( ON ?auto_87114 ?auto_87113 ) ( ON ?auto_87115 ?auto_87114 ) ( ON ?auto_87116 ?auto_87115 ) ( not ( = ?auto_87112 ?auto_87113 ) ) ( not ( = ?auto_87112 ?auto_87114 ) ) ( not ( = ?auto_87112 ?auto_87115 ) ) ( not ( = ?auto_87112 ?auto_87116 ) ) ( not ( = ?auto_87112 ?auto_87117 ) ) ( not ( = ?auto_87113 ?auto_87114 ) ) ( not ( = ?auto_87113 ?auto_87115 ) ) ( not ( = ?auto_87113 ?auto_87116 ) ) ( not ( = ?auto_87113 ?auto_87117 ) ) ( not ( = ?auto_87114 ?auto_87115 ) ) ( not ( = ?auto_87114 ?auto_87116 ) ) ( not ( = ?auto_87114 ?auto_87117 ) ) ( not ( = ?auto_87115 ?auto_87116 ) ) ( not ( = ?auto_87115 ?auto_87117 ) ) ( not ( = ?auto_87116 ?auto_87117 ) ) ( ON ?auto_87117 ?auto_87118 ) ( CLEAR ?auto_87117 ) ( HAND-EMPTY ) ( not ( = ?auto_87112 ?auto_87118 ) ) ( not ( = ?auto_87113 ?auto_87118 ) ) ( not ( = ?auto_87114 ?auto_87118 ) ) ( not ( = ?auto_87115 ?auto_87118 ) ) ( not ( = ?auto_87116 ?auto_87118 ) ) ( not ( = ?auto_87117 ?auto_87118 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87117 ?auto_87118 )
      ( MAKE-6PILE ?auto_87112 ?auto_87113 ?auto_87114 ?auto_87115 ?auto_87116 ?auto_87117 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87119 - BLOCK
      ?auto_87120 - BLOCK
      ?auto_87121 - BLOCK
      ?auto_87122 - BLOCK
      ?auto_87123 - BLOCK
      ?auto_87124 - BLOCK
    )
    :vars
    (
      ?auto_87125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87119 ) ( ON ?auto_87120 ?auto_87119 ) ( ON ?auto_87121 ?auto_87120 ) ( ON ?auto_87122 ?auto_87121 ) ( not ( = ?auto_87119 ?auto_87120 ) ) ( not ( = ?auto_87119 ?auto_87121 ) ) ( not ( = ?auto_87119 ?auto_87122 ) ) ( not ( = ?auto_87119 ?auto_87123 ) ) ( not ( = ?auto_87119 ?auto_87124 ) ) ( not ( = ?auto_87120 ?auto_87121 ) ) ( not ( = ?auto_87120 ?auto_87122 ) ) ( not ( = ?auto_87120 ?auto_87123 ) ) ( not ( = ?auto_87120 ?auto_87124 ) ) ( not ( = ?auto_87121 ?auto_87122 ) ) ( not ( = ?auto_87121 ?auto_87123 ) ) ( not ( = ?auto_87121 ?auto_87124 ) ) ( not ( = ?auto_87122 ?auto_87123 ) ) ( not ( = ?auto_87122 ?auto_87124 ) ) ( not ( = ?auto_87123 ?auto_87124 ) ) ( ON ?auto_87124 ?auto_87125 ) ( CLEAR ?auto_87124 ) ( not ( = ?auto_87119 ?auto_87125 ) ) ( not ( = ?auto_87120 ?auto_87125 ) ) ( not ( = ?auto_87121 ?auto_87125 ) ) ( not ( = ?auto_87122 ?auto_87125 ) ) ( not ( = ?auto_87123 ?auto_87125 ) ) ( not ( = ?auto_87124 ?auto_87125 ) ) ( HOLDING ?auto_87123 ) ( CLEAR ?auto_87122 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87119 ?auto_87120 ?auto_87121 ?auto_87122 ?auto_87123 )
      ( MAKE-6PILE ?auto_87119 ?auto_87120 ?auto_87121 ?auto_87122 ?auto_87123 ?auto_87124 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87126 - BLOCK
      ?auto_87127 - BLOCK
      ?auto_87128 - BLOCK
      ?auto_87129 - BLOCK
      ?auto_87130 - BLOCK
      ?auto_87131 - BLOCK
    )
    :vars
    (
      ?auto_87132 - BLOCK
      ?auto_87133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87126 ) ( ON ?auto_87127 ?auto_87126 ) ( ON ?auto_87128 ?auto_87127 ) ( ON ?auto_87129 ?auto_87128 ) ( not ( = ?auto_87126 ?auto_87127 ) ) ( not ( = ?auto_87126 ?auto_87128 ) ) ( not ( = ?auto_87126 ?auto_87129 ) ) ( not ( = ?auto_87126 ?auto_87130 ) ) ( not ( = ?auto_87126 ?auto_87131 ) ) ( not ( = ?auto_87127 ?auto_87128 ) ) ( not ( = ?auto_87127 ?auto_87129 ) ) ( not ( = ?auto_87127 ?auto_87130 ) ) ( not ( = ?auto_87127 ?auto_87131 ) ) ( not ( = ?auto_87128 ?auto_87129 ) ) ( not ( = ?auto_87128 ?auto_87130 ) ) ( not ( = ?auto_87128 ?auto_87131 ) ) ( not ( = ?auto_87129 ?auto_87130 ) ) ( not ( = ?auto_87129 ?auto_87131 ) ) ( not ( = ?auto_87130 ?auto_87131 ) ) ( ON ?auto_87131 ?auto_87132 ) ( not ( = ?auto_87126 ?auto_87132 ) ) ( not ( = ?auto_87127 ?auto_87132 ) ) ( not ( = ?auto_87128 ?auto_87132 ) ) ( not ( = ?auto_87129 ?auto_87132 ) ) ( not ( = ?auto_87130 ?auto_87132 ) ) ( not ( = ?auto_87131 ?auto_87132 ) ) ( CLEAR ?auto_87129 ) ( ON ?auto_87130 ?auto_87131 ) ( CLEAR ?auto_87130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87133 ) ( ON ?auto_87132 ?auto_87133 ) ( not ( = ?auto_87133 ?auto_87132 ) ) ( not ( = ?auto_87133 ?auto_87131 ) ) ( not ( = ?auto_87133 ?auto_87130 ) ) ( not ( = ?auto_87126 ?auto_87133 ) ) ( not ( = ?auto_87127 ?auto_87133 ) ) ( not ( = ?auto_87128 ?auto_87133 ) ) ( not ( = ?auto_87129 ?auto_87133 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87133 ?auto_87132 ?auto_87131 )
      ( MAKE-6PILE ?auto_87126 ?auto_87127 ?auto_87128 ?auto_87129 ?auto_87130 ?auto_87131 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87134 - BLOCK
      ?auto_87135 - BLOCK
      ?auto_87136 - BLOCK
      ?auto_87137 - BLOCK
      ?auto_87138 - BLOCK
      ?auto_87139 - BLOCK
    )
    :vars
    (
      ?auto_87140 - BLOCK
      ?auto_87141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87134 ) ( ON ?auto_87135 ?auto_87134 ) ( ON ?auto_87136 ?auto_87135 ) ( not ( = ?auto_87134 ?auto_87135 ) ) ( not ( = ?auto_87134 ?auto_87136 ) ) ( not ( = ?auto_87134 ?auto_87137 ) ) ( not ( = ?auto_87134 ?auto_87138 ) ) ( not ( = ?auto_87134 ?auto_87139 ) ) ( not ( = ?auto_87135 ?auto_87136 ) ) ( not ( = ?auto_87135 ?auto_87137 ) ) ( not ( = ?auto_87135 ?auto_87138 ) ) ( not ( = ?auto_87135 ?auto_87139 ) ) ( not ( = ?auto_87136 ?auto_87137 ) ) ( not ( = ?auto_87136 ?auto_87138 ) ) ( not ( = ?auto_87136 ?auto_87139 ) ) ( not ( = ?auto_87137 ?auto_87138 ) ) ( not ( = ?auto_87137 ?auto_87139 ) ) ( not ( = ?auto_87138 ?auto_87139 ) ) ( ON ?auto_87139 ?auto_87140 ) ( not ( = ?auto_87134 ?auto_87140 ) ) ( not ( = ?auto_87135 ?auto_87140 ) ) ( not ( = ?auto_87136 ?auto_87140 ) ) ( not ( = ?auto_87137 ?auto_87140 ) ) ( not ( = ?auto_87138 ?auto_87140 ) ) ( not ( = ?auto_87139 ?auto_87140 ) ) ( ON ?auto_87138 ?auto_87139 ) ( CLEAR ?auto_87138 ) ( ON-TABLE ?auto_87141 ) ( ON ?auto_87140 ?auto_87141 ) ( not ( = ?auto_87141 ?auto_87140 ) ) ( not ( = ?auto_87141 ?auto_87139 ) ) ( not ( = ?auto_87141 ?auto_87138 ) ) ( not ( = ?auto_87134 ?auto_87141 ) ) ( not ( = ?auto_87135 ?auto_87141 ) ) ( not ( = ?auto_87136 ?auto_87141 ) ) ( not ( = ?auto_87137 ?auto_87141 ) ) ( HOLDING ?auto_87137 ) ( CLEAR ?auto_87136 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87134 ?auto_87135 ?auto_87136 ?auto_87137 )
      ( MAKE-6PILE ?auto_87134 ?auto_87135 ?auto_87136 ?auto_87137 ?auto_87138 ?auto_87139 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87142 - BLOCK
      ?auto_87143 - BLOCK
      ?auto_87144 - BLOCK
      ?auto_87145 - BLOCK
      ?auto_87146 - BLOCK
      ?auto_87147 - BLOCK
    )
    :vars
    (
      ?auto_87149 - BLOCK
      ?auto_87148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87142 ) ( ON ?auto_87143 ?auto_87142 ) ( ON ?auto_87144 ?auto_87143 ) ( not ( = ?auto_87142 ?auto_87143 ) ) ( not ( = ?auto_87142 ?auto_87144 ) ) ( not ( = ?auto_87142 ?auto_87145 ) ) ( not ( = ?auto_87142 ?auto_87146 ) ) ( not ( = ?auto_87142 ?auto_87147 ) ) ( not ( = ?auto_87143 ?auto_87144 ) ) ( not ( = ?auto_87143 ?auto_87145 ) ) ( not ( = ?auto_87143 ?auto_87146 ) ) ( not ( = ?auto_87143 ?auto_87147 ) ) ( not ( = ?auto_87144 ?auto_87145 ) ) ( not ( = ?auto_87144 ?auto_87146 ) ) ( not ( = ?auto_87144 ?auto_87147 ) ) ( not ( = ?auto_87145 ?auto_87146 ) ) ( not ( = ?auto_87145 ?auto_87147 ) ) ( not ( = ?auto_87146 ?auto_87147 ) ) ( ON ?auto_87147 ?auto_87149 ) ( not ( = ?auto_87142 ?auto_87149 ) ) ( not ( = ?auto_87143 ?auto_87149 ) ) ( not ( = ?auto_87144 ?auto_87149 ) ) ( not ( = ?auto_87145 ?auto_87149 ) ) ( not ( = ?auto_87146 ?auto_87149 ) ) ( not ( = ?auto_87147 ?auto_87149 ) ) ( ON ?auto_87146 ?auto_87147 ) ( ON-TABLE ?auto_87148 ) ( ON ?auto_87149 ?auto_87148 ) ( not ( = ?auto_87148 ?auto_87149 ) ) ( not ( = ?auto_87148 ?auto_87147 ) ) ( not ( = ?auto_87148 ?auto_87146 ) ) ( not ( = ?auto_87142 ?auto_87148 ) ) ( not ( = ?auto_87143 ?auto_87148 ) ) ( not ( = ?auto_87144 ?auto_87148 ) ) ( not ( = ?auto_87145 ?auto_87148 ) ) ( CLEAR ?auto_87144 ) ( ON ?auto_87145 ?auto_87146 ) ( CLEAR ?auto_87145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87148 ?auto_87149 ?auto_87147 ?auto_87146 )
      ( MAKE-6PILE ?auto_87142 ?auto_87143 ?auto_87144 ?auto_87145 ?auto_87146 ?auto_87147 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87150 - BLOCK
      ?auto_87151 - BLOCK
      ?auto_87152 - BLOCK
      ?auto_87153 - BLOCK
      ?auto_87154 - BLOCK
      ?auto_87155 - BLOCK
    )
    :vars
    (
      ?auto_87156 - BLOCK
      ?auto_87157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87150 ) ( ON ?auto_87151 ?auto_87150 ) ( not ( = ?auto_87150 ?auto_87151 ) ) ( not ( = ?auto_87150 ?auto_87152 ) ) ( not ( = ?auto_87150 ?auto_87153 ) ) ( not ( = ?auto_87150 ?auto_87154 ) ) ( not ( = ?auto_87150 ?auto_87155 ) ) ( not ( = ?auto_87151 ?auto_87152 ) ) ( not ( = ?auto_87151 ?auto_87153 ) ) ( not ( = ?auto_87151 ?auto_87154 ) ) ( not ( = ?auto_87151 ?auto_87155 ) ) ( not ( = ?auto_87152 ?auto_87153 ) ) ( not ( = ?auto_87152 ?auto_87154 ) ) ( not ( = ?auto_87152 ?auto_87155 ) ) ( not ( = ?auto_87153 ?auto_87154 ) ) ( not ( = ?auto_87153 ?auto_87155 ) ) ( not ( = ?auto_87154 ?auto_87155 ) ) ( ON ?auto_87155 ?auto_87156 ) ( not ( = ?auto_87150 ?auto_87156 ) ) ( not ( = ?auto_87151 ?auto_87156 ) ) ( not ( = ?auto_87152 ?auto_87156 ) ) ( not ( = ?auto_87153 ?auto_87156 ) ) ( not ( = ?auto_87154 ?auto_87156 ) ) ( not ( = ?auto_87155 ?auto_87156 ) ) ( ON ?auto_87154 ?auto_87155 ) ( ON-TABLE ?auto_87157 ) ( ON ?auto_87156 ?auto_87157 ) ( not ( = ?auto_87157 ?auto_87156 ) ) ( not ( = ?auto_87157 ?auto_87155 ) ) ( not ( = ?auto_87157 ?auto_87154 ) ) ( not ( = ?auto_87150 ?auto_87157 ) ) ( not ( = ?auto_87151 ?auto_87157 ) ) ( not ( = ?auto_87152 ?auto_87157 ) ) ( not ( = ?auto_87153 ?auto_87157 ) ) ( ON ?auto_87153 ?auto_87154 ) ( CLEAR ?auto_87153 ) ( HOLDING ?auto_87152 ) ( CLEAR ?auto_87151 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87150 ?auto_87151 ?auto_87152 )
      ( MAKE-6PILE ?auto_87150 ?auto_87151 ?auto_87152 ?auto_87153 ?auto_87154 ?auto_87155 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87158 - BLOCK
      ?auto_87159 - BLOCK
      ?auto_87160 - BLOCK
      ?auto_87161 - BLOCK
      ?auto_87162 - BLOCK
      ?auto_87163 - BLOCK
    )
    :vars
    (
      ?auto_87164 - BLOCK
      ?auto_87165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87158 ) ( ON ?auto_87159 ?auto_87158 ) ( not ( = ?auto_87158 ?auto_87159 ) ) ( not ( = ?auto_87158 ?auto_87160 ) ) ( not ( = ?auto_87158 ?auto_87161 ) ) ( not ( = ?auto_87158 ?auto_87162 ) ) ( not ( = ?auto_87158 ?auto_87163 ) ) ( not ( = ?auto_87159 ?auto_87160 ) ) ( not ( = ?auto_87159 ?auto_87161 ) ) ( not ( = ?auto_87159 ?auto_87162 ) ) ( not ( = ?auto_87159 ?auto_87163 ) ) ( not ( = ?auto_87160 ?auto_87161 ) ) ( not ( = ?auto_87160 ?auto_87162 ) ) ( not ( = ?auto_87160 ?auto_87163 ) ) ( not ( = ?auto_87161 ?auto_87162 ) ) ( not ( = ?auto_87161 ?auto_87163 ) ) ( not ( = ?auto_87162 ?auto_87163 ) ) ( ON ?auto_87163 ?auto_87164 ) ( not ( = ?auto_87158 ?auto_87164 ) ) ( not ( = ?auto_87159 ?auto_87164 ) ) ( not ( = ?auto_87160 ?auto_87164 ) ) ( not ( = ?auto_87161 ?auto_87164 ) ) ( not ( = ?auto_87162 ?auto_87164 ) ) ( not ( = ?auto_87163 ?auto_87164 ) ) ( ON ?auto_87162 ?auto_87163 ) ( ON-TABLE ?auto_87165 ) ( ON ?auto_87164 ?auto_87165 ) ( not ( = ?auto_87165 ?auto_87164 ) ) ( not ( = ?auto_87165 ?auto_87163 ) ) ( not ( = ?auto_87165 ?auto_87162 ) ) ( not ( = ?auto_87158 ?auto_87165 ) ) ( not ( = ?auto_87159 ?auto_87165 ) ) ( not ( = ?auto_87160 ?auto_87165 ) ) ( not ( = ?auto_87161 ?auto_87165 ) ) ( ON ?auto_87161 ?auto_87162 ) ( CLEAR ?auto_87159 ) ( ON ?auto_87160 ?auto_87161 ) ( CLEAR ?auto_87160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87165 ?auto_87164 ?auto_87163 ?auto_87162 ?auto_87161 )
      ( MAKE-6PILE ?auto_87158 ?auto_87159 ?auto_87160 ?auto_87161 ?auto_87162 ?auto_87163 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87166 - BLOCK
      ?auto_87167 - BLOCK
      ?auto_87168 - BLOCK
      ?auto_87169 - BLOCK
      ?auto_87170 - BLOCK
      ?auto_87171 - BLOCK
    )
    :vars
    (
      ?auto_87173 - BLOCK
      ?auto_87172 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87166 ) ( not ( = ?auto_87166 ?auto_87167 ) ) ( not ( = ?auto_87166 ?auto_87168 ) ) ( not ( = ?auto_87166 ?auto_87169 ) ) ( not ( = ?auto_87166 ?auto_87170 ) ) ( not ( = ?auto_87166 ?auto_87171 ) ) ( not ( = ?auto_87167 ?auto_87168 ) ) ( not ( = ?auto_87167 ?auto_87169 ) ) ( not ( = ?auto_87167 ?auto_87170 ) ) ( not ( = ?auto_87167 ?auto_87171 ) ) ( not ( = ?auto_87168 ?auto_87169 ) ) ( not ( = ?auto_87168 ?auto_87170 ) ) ( not ( = ?auto_87168 ?auto_87171 ) ) ( not ( = ?auto_87169 ?auto_87170 ) ) ( not ( = ?auto_87169 ?auto_87171 ) ) ( not ( = ?auto_87170 ?auto_87171 ) ) ( ON ?auto_87171 ?auto_87173 ) ( not ( = ?auto_87166 ?auto_87173 ) ) ( not ( = ?auto_87167 ?auto_87173 ) ) ( not ( = ?auto_87168 ?auto_87173 ) ) ( not ( = ?auto_87169 ?auto_87173 ) ) ( not ( = ?auto_87170 ?auto_87173 ) ) ( not ( = ?auto_87171 ?auto_87173 ) ) ( ON ?auto_87170 ?auto_87171 ) ( ON-TABLE ?auto_87172 ) ( ON ?auto_87173 ?auto_87172 ) ( not ( = ?auto_87172 ?auto_87173 ) ) ( not ( = ?auto_87172 ?auto_87171 ) ) ( not ( = ?auto_87172 ?auto_87170 ) ) ( not ( = ?auto_87166 ?auto_87172 ) ) ( not ( = ?auto_87167 ?auto_87172 ) ) ( not ( = ?auto_87168 ?auto_87172 ) ) ( not ( = ?auto_87169 ?auto_87172 ) ) ( ON ?auto_87169 ?auto_87170 ) ( ON ?auto_87168 ?auto_87169 ) ( CLEAR ?auto_87168 ) ( HOLDING ?auto_87167 ) ( CLEAR ?auto_87166 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87166 ?auto_87167 )
      ( MAKE-6PILE ?auto_87166 ?auto_87167 ?auto_87168 ?auto_87169 ?auto_87170 ?auto_87171 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87174 - BLOCK
      ?auto_87175 - BLOCK
      ?auto_87176 - BLOCK
      ?auto_87177 - BLOCK
      ?auto_87178 - BLOCK
      ?auto_87179 - BLOCK
    )
    :vars
    (
      ?auto_87181 - BLOCK
      ?auto_87180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87174 ) ( not ( = ?auto_87174 ?auto_87175 ) ) ( not ( = ?auto_87174 ?auto_87176 ) ) ( not ( = ?auto_87174 ?auto_87177 ) ) ( not ( = ?auto_87174 ?auto_87178 ) ) ( not ( = ?auto_87174 ?auto_87179 ) ) ( not ( = ?auto_87175 ?auto_87176 ) ) ( not ( = ?auto_87175 ?auto_87177 ) ) ( not ( = ?auto_87175 ?auto_87178 ) ) ( not ( = ?auto_87175 ?auto_87179 ) ) ( not ( = ?auto_87176 ?auto_87177 ) ) ( not ( = ?auto_87176 ?auto_87178 ) ) ( not ( = ?auto_87176 ?auto_87179 ) ) ( not ( = ?auto_87177 ?auto_87178 ) ) ( not ( = ?auto_87177 ?auto_87179 ) ) ( not ( = ?auto_87178 ?auto_87179 ) ) ( ON ?auto_87179 ?auto_87181 ) ( not ( = ?auto_87174 ?auto_87181 ) ) ( not ( = ?auto_87175 ?auto_87181 ) ) ( not ( = ?auto_87176 ?auto_87181 ) ) ( not ( = ?auto_87177 ?auto_87181 ) ) ( not ( = ?auto_87178 ?auto_87181 ) ) ( not ( = ?auto_87179 ?auto_87181 ) ) ( ON ?auto_87178 ?auto_87179 ) ( ON-TABLE ?auto_87180 ) ( ON ?auto_87181 ?auto_87180 ) ( not ( = ?auto_87180 ?auto_87181 ) ) ( not ( = ?auto_87180 ?auto_87179 ) ) ( not ( = ?auto_87180 ?auto_87178 ) ) ( not ( = ?auto_87174 ?auto_87180 ) ) ( not ( = ?auto_87175 ?auto_87180 ) ) ( not ( = ?auto_87176 ?auto_87180 ) ) ( not ( = ?auto_87177 ?auto_87180 ) ) ( ON ?auto_87177 ?auto_87178 ) ( ON ?auto_87176 ?auto_87177 ) ( CLEAR ?auto_87174 ) ( ON ?auto_87175 ?auto_87176 ) ( CLEAR ?auto_87175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87180 ?auto_87181 ?auto_87179 ?auto_87178 ?auto_87177 ?auto_87176 )
      ( MAKE-6PILE ?auto_87174 ?auto_87175 ?auto_87176 ?auto_87177 ?auto_87178 ?auto_87179 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87182 - BLOCK
      ?auto_87183 - BLOCK
      ?auto_87184 - BLOCK
      ?auto_87185 - BLOCK
      ?auto_87186 - BLOCK
      ?auto_87187 - BLOCK
    )
    :vars
    (
      ?auto_87188 - BLOCK
      ?auto_87189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87182 ?auto_87183 ) ) ( not ( = ?auto_87182 ?auto_87184 ) ) ( not ( = ?auto_87182 ?auto_87185 ) ) ( not ( = ?auto_87182 ?auto_87186 ) ) ( not ( = ?auto_87182 ?auto_87187 ) ) ( not ( = ?auto_87183 ?auto_87184 ) ) ( not ( = ?auto_87183 ?auto_87185 ) ) ( not ( = ?auto_87183 ?auto_87186 ) ) ( not ( = ?auto_87183 ?auto_87187 ) ) ( not ( = ?auto_87184 ?auto_87185 ) ) ( not ( = ?auto_87184 ?auto_87186 ) ) ( not ( = ?auto_87184 ?auto_87187 ) ) ( not ( = ?auto_87185 ?auto_87186 ) ) ( not ( = ?auto_87185 ?auto_87187 ) ) ( not ( = ?auto_87186 ?auto_87187 ) ) ( ON ?auto_87187 ?auto_87188 ) ( not ( = ?auto_87182 ?auto_87188 ) ) ( not ( = ?auto_87183 ?auto_87188 ) ) ( not ( = ?auto_87184 ?auto_87188 ) ) ( not ( = ?auto_87185 ?auto_87188 ) ) ( not ( = ?auto_87186 ?auto_87188 ) ) ( not ( = ?auto_87187 ?auto_87188 ) ) ( ON ?auto_87186 ?auto_87187 ) ( ON-TABLE ?auto_87189 ) ( ON ?auto_87188 ?auto_87189 ) ( not ( = ?auto_87189 ?auto_87188 ) ) ( not ( = ?auto_87189 ?auto_87187 ) ) ( not ( = ?auto_87189 ?auto_87186 ) ) ( not ( = ?auto_87182 ?auto_87189 ) ) ( not ( = ?auto_87183 ?auto_87189 ) ) ( not ( = ?auto_87184 ?auto_87189 ) ) ( not ( = ?auto_87185 ?auto_87189 ) ) ( ON ?auto_87185 ?auto_87186 ) ( ON ?auto_87184 ?auto_87185 ) ( ON ?auto_87183 ?auto_87184 ) ( CLEAR ?auto_87183 ) ( HOLDING ?auto_87182 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87182 )
      ( MAKE-6PILE ?auto_87182 ?auto_87183 ?auto_87184 ?auto_87185 ?auto_87186 ?auto_87187 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87190 - BLOCK
      ?auto_87191 - BLOCK
      ?auto_87192 - BLOCK
      ?auto_87193 - BLOCK
      ?auto_87194 - BLOCK
      ?auto_87195 - BLOCK
    )
    :vars
    (
      ?auto_87197 - BLOCK
      ?auto_87196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87190 ?auto_87191 ) ) ( not ( = ?auto_87190 ?auto_87192 ) ) ( not ( = ?auto_87190 ?auto_87193 ) ) ( not ( = ?auto_87190 ?auto_87194 ) ) ( not ( = ?auto_87190 ?auto_87195 ) ) ( not ( = ?auto_87191 ?auto_87192 ) ) ( not ( = ?auto_87191 ?auto_87193 ) ) ( not ( = ?auto_87191 ?auto_87194 ) ) ( not ( = ?auto_87191 ?auto_87195 ) ) ( not ( = ?auto_87192 ?auto_87193 ) ) ( not ( = ?auto_87192 ?auto_87194 ) ) ( not ( = ?auto_87192 ?auto_87195 ) ) ( not ( = ?auto_87193 ?auto_87194 ) ) ( not ( = ?auto_87193 ?auto_87195 ) ) ( not ( = ?auto_87194 ?auto_87195 ) ) ( ON ?auto_87195 ?auto_87197 ) ( not ( = ?auto_87190 ?auto_87197 ) ) ( not ( = ?auto_87191 ?auto_87197 ) ) ( not ( = ?auto_87192 ?auto_87197 ) ) ( not ( = ?auto_87193 ?auto_87197 ) ) ( not ( = ?auto_87194 ?auto_87197 ) ) ( not ( = ?auto_87195 ?auto_87197 ) ) ( ON ?auto_87194 ?auto_87195 ) ( ON-TABLE ?auto_87196 ) ( ON ?auto_87197 ?auto_87196 ) ( not ( = ?auto_87196 ?auto_87197 ) ) ( not ( = ?auto_87196 ?auto_87195 ) ) ( not ( = ?auto_87196 ?auto_87194 ) ) ( not ( = ?auto_87190 ?auto_87196 ) ) ( not ( = ?auto_87191 ?auto_87196 ) ) ( not ( = ?auto_87192 ?auto_87196 ) ) ( not ( = ?auto_87193 ?auto_87196 ) ) ( ON ?auto_87193 ?auto_87194 ) ( ON ?auto_87192 ?auto_87193 ) ( ON ?auto_87191 ?auto_87192 ) ( ON ?auto_87190 ?auto_87191 ) ( CLEAR ?auto_87190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87196 ?auto_87197 ?auto_87195 ?auto_87194 ?auto_87193 ?auto_87192 ?auto_87191 )
      ( MAKE-6PILE ?auto_87190 ?auto_87191 ?auto_87192 ?auto_87193 ?auto_87194 ?auto_87195 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87199 - BLOCK
    )
    :vars
    (
      ?auto_87200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87200 ?auto_87199 ) ( CLEAR ?auto_87200 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87199 ) ( not ( = ?auto_87199 ?auto_87200 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87200 ?auto_87199 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87201 - BLOCK
    )
    :vars
    (
      ?auto_87202 - BLOCK
      ?auto_87203 - BLOCK
      ?auto_87204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87202 ?auto_87201 ) ( CLEAR ?auto_87202 ) ( ON-TABLE ?auto_87201 ) ( not ( = ?auto_87201 ?auto_87202 ) ) ( HOLDING ?auto_87203 ) ( CLEAR ?auto_87204 ) ( not ( = ?auto_87201 ?auto_87203 ) ) ( not ( = ?auto_87201 ?auto_87204 ) ) ( not ( = ?auto_87202 ?auto_87203 ) ) ( not ( = ?auto_87202 ?auto_87204 ) ) ( not ( = ?auto_87203 ?auto_87204 ) ) )
    :subtasks
    ( ( !STACK ?auto_87203 ?auto_87204 )
      ( MAKE-1PILE ?auto_87201 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87205 - BLOCK
    )
    :vars
    (
      ?auto_87206 - BLOCK
      ?auto_87208 - BLOCK
      ?auto_87207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87206 ?auto_87205 ) ( ON-TABLE ?auto_87205 ) ( not ( = ?auto_87205 ?auto_87206 ) ) ( CLEAR ?auto_87208 ) ( not ( = ?auto_87205 ?auto_87207 ) ) ( not ( = ?auto_87205 ?auto_87208 ) ) ( not ( = ?auto_87206 ?auto_87207 ) ) ( not ( = ?auto_87206 ?auto_87208 ) ) ( not ( = ?auto_87207 ?auto_87208 ) ) ( ON ?auto_87207 ?auto_87206 ) ( CLEAR ?auto_87207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87205 ?auto_87206 )
      ( MAKE-1PILE ?auto_87205 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87209 - BLOCK
    )
    :vars
    (
      ?auto_87210 - BLOCK
      ?auto_87211 - BLOCK
      ?auto_87212 - BLOCK
      ?auto_87215 - BLOCK
      ?auto_87213 - BLOCK
      ?auto_87216 - BLOCK
      ?auto_87214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87210 ?auto_87209 ) ( ON-TABLE ?auto_87209 ) ( not ( = ?auto_87209 ?auto_87210 ) ) ( not ( = ?auto_87209 ?auto_87211 ) ) ( not ( = ?auto_87209 ?auto_87212 ) ) ( not ( = ?auto_87210 ?auto_87211 ) ) ( not ( = ?auto_87210 ?auto_87212 ) ) ( not ( = ?auto_87211 ?auto_87212 ) ) ( ON ?auto_87211 ?auto_87210 ) ( CLEAR ?auto_87211 ) ( HOLDING ?auto_87212 ) ( CLEAR ?auto_87215 ) ( ON-TABLE ?auto_87213 ) ( ON ?auto_87216 ?auto_87213 ) ( ON ?auto_87214 ?auto_87216 ) ( ON ?auto_87215 ?auto_87214 ) ( not ( = ?auto_87213 ?auto_87216 ) ) ( not ( = ?auto_87213 ?auto_87214 ) ) ( not ( = ?auto_87213 ?auto_87215 ) ) ( not ( = ?auto_87213 ?auto_87212 ) ) ( not ( = ?auto_87216 ?auto_87214 ) ) ( not ( = ?auto_87216 ?auto_87215 ) ) ( not ( = ?auto_87216 ?auto_87212 ) ) ( not ( = ?auto_87214 ?auto_87215 ) ) ( not ( = ?auto_87214 ?auto_87212 ) ) ( not ( = ?auto_87215 ?auto_87212 ) ) ( not ( = ?auto_87209 ?auto_87215 ) ) ( not ( = ?auto_87209 ?auto_87213 ) ) ( not ( = ?auto_87209 ?auto_87216 ) ) ( not ( = ?auto_87209 ?auto_87214 ) ) ( not ( = ?auto_87210 ?auto_87215 ) ) ( not ( = ?auto_87210 ?auto_87213 ) ) ( not ( = ?auto_87210 ?auto_87216 ) ) ( not ( = ?auto_87210 ?auto_87214 ) ) ( not ( = ?auto_87211 ?auto_87215 ) ) ( not ( = ?auto_87211 ?auto_87213 ) ) ( not ( = ?auto_87211 ?auto_87216 ) ) ( not ( = ?auto_87211 ?auto_87214 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87213 ?auto_87216 ?auto_87214 ?auto_87215 ?auto_87212 )
      ( MAKE-1PILE ?auto_87209 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87217 - BLOCK
    )
    :vars
    (
      ?auto_87222 - BLOCK
      ?auto_87221 - BLOCK
      ?auto_87223 - BLOCK
      ?auto_87224 - BLOCK
      ?auto_87220 - BLOCK
      ?auto_87219 - BLOCK
      ?auto_87218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87222 ?auto_87217 ) ( ON-TABLE ?auto_87217 ) ( not ( = ?auto_87217 ?auto_87222 ) ) ( not ( = ?auto_87217 ?auto_87221 ) ) ( not ( = ?auto_87217 ?auto_87223 ) ) ( not ( = ?auto_87222 ?auto_87221 ) ) ( not ( = ?auto_87222 ?auto_87223 ) ) ( not ( = ?auto_87221 ?auto_87223 ) ) ( ON ?auto_87221 ?auto_87222 ) ( CLEAR ?auto_87224 ) ( ON-TABLE ?auto_87220 ) ( ON ?auto_87219 ?auto_87220 ) ( ON ?auto_87218 ?auto_87219 ) ( ON ?auto_87224 ?auto_87218 ) ( not ( = ?auto_87220 ?auto_87219 ) ) ( not ( = ?auto_87220 ?auto_87218 ) ) ( not ( = ?auto_87220 ?auto_87224 ) ) ( not ( = ?auto_87220 ?auto_87223 ) ) ( not ( = ?auto_87219 ?auto_87218 ) ) ( not ( = ?auto_87219 ?auto_87224 ) ) ( not ( = ?auto_87219 ?auto_87223 ) ) ( not ( = ?auto_87218 ?auto_87224 ) ) ( not ( = ?auto_87218 ?auto_87223 ) ) ( not ( = ?auto_87224 ?auto_87223 ) ) ( not ( = ?auto_87217 ?auto_87224 ) ) ( not ( = ?auto_87217 ?auto_87220 ) ) ( not ( = ?auto_87217 ?auto_87219 ) ) ( not ( = ?auto_87217 ?auto_87218 ) ) ( not ( = ?auto_87222 ?auto_87224 ) ) ( not ( = ?auto_87222 ?auto_87220 ) ) ( not ( = ?auto_87222 ?auto_87219 ) ) ( not ( = ?auto_87222 ?auto_87218 ) ) ( not ( = ?auto_87221 ?auto_87224 ) ) ( not ( = ?auto_87221 ?auto_87220 ) ) ( not ( = ?auto_87221 ?auto_87219 ) ) ( not ( = ?auto_87221 ?auto_87218 ) ) ( ON ?auto_87223 ?auto_87221 ) ( CLEAR ?auto_87223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87217 ?auto_87222 ?auto_87221 )
      ( MAKE-1PILE ?auto_87217 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87225 - BLOCK
    )
    :vars
    (
      ?auto_87228 - BLOCK
      ?auto_87226 - BLOCK
      ?auto_87230 - BLOCK
      ?auto_87232 - BLOCK
      ?auto_87227 - BLOCK
      ?auto_87231 - BLOCK
      ?auto_87229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87228 ?auto_87225 ) ( ON-TABLE ?auto_87225 ) ( not ( = ?auto_87225 ?auto_87228 ) ) ( not ( = ?auto_87225 ?auto_87226 ) ) ( not ( = ?auto_87225 ?auto_87230 ) ) ( not ( = ?auto_87228 ?auto_87226 ) ) ( not ( = ?auto_87228 ?auto_87230 ) ) ( not ( = ?auto_87226 ?auto_87230 ) ) ( ON ?auto_87226 ?auto_87228 ) ( ON-TABLE ?auto_87232 ) ( ON ?auto_87227 ?auto_87232 ) ( ON ?auto_87231 ?auto_87227 ) ( not ( = ?auto_87232 ?auto_87227 ) ) ( not ( = ?auto_87232 ?auto_87231 ) ) ( not ( = ?auto_87232 ?auto_87229 ) ) ( not ( = ?auto_87232 ?auto_87230 ) ) ( not ( = ?auto_87227 ?auto_87231 ) ) ( not ( = ?auto_87227 ?auto_87229 ) ) ( not ( = ?auto_87227 ?auto_87230 ) ) ( not ( = ?auto_87231 ?auto_87229 ) ) ( not ( = ?auto_87231 ?auto_87230 ) ) ( not ( = ?auto_87229 ?auto_87230 ) ) ( not ( = ?auto_87225 ?auto_87229 ) ) ( not ( = ?auto_87225 ?auto_87232 ) ) ( not ( = ?auto_87225 ?auto_87227 ) ) ( not ( = ?auto_87225 ?auto_87231 ) ) ( not ( = ?auto_87228 ?auto_87229 ) ) ( not ( = ?auto_87228 ?auto_87232 ) ) ( not ( = ?auto_87228 ?auto_87227 ) ) ( not ( = ?auto_87228 ?auto_87231 ) ) ( not ( = ?auto_87226 ?auto_87229 ) ) ( not ( = ?auto_87226 ?auto_87232 ) ) ( not ( = ?auto_87226 ?auto_87227 ) ) ( not ( = ?auto_87226 ?auto_87231 ) ) ( ON ?auto_87230 ?auto_87226 ) ( CLEAR ?auto_87230 ) ( HOLDING ?auto_87229 ) ( CLEAR ?auto_87231 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87232 ?auto_87227 ?auto_87231 ?auto_87229 )
      ( MAKE-1PILE ?auto_87225 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87233 - BLOCK
    )
    :vars
    (
      ?auto_87235 - BLOCK
      ?auto_87238 - BLOCK
      ?auto_87240 - BLOCK
      ?auto_87237 - BLOCK
      ?auto_87234 - BLOCK
      ?auto_87236 - BLOCK
      ?auto_87239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87235 ?auto_87233 ) ( ON-TABLE ?auto_87233 ) ( not ( = ?auto_87233 ?auto_87235 ) ) ( not ( = ?auto_87233 ?auto_87238 ) ) ( not ( = ?auto_87233 ?auto_87240 ) ) ( not ( = ?auto_87235 ?auto_87238 ) ) ( not ( = ?auto_87235 ?auto_87240 ) ) ( not ( = ?auto_87238 ?auto_87240 ) ) ( ON ?auto_87238 ?auto_87235 ) ( ON-TABLE ?auto_87237 ) ( ON ?auto_87234 ?auto_87237 ) ( ON ?auto_87236 ?auto_87234 ) ( not ( = ?auto_87237 ?auto_87234 ) ) ( not ( = ?auto_87237 ?auto_87236 ) ) ( not ( = ?auto_87237 ?auto_87239 ) ) ( not ( = ?auto_87237 ?auto_87240 ) ) ( not ( = ?auto_87234 ?auto_87236 ) ) ( not ( = ?auto_87234 ?auto_87239 ) ) ( not ( = ?auto_87234 ?auto_87240 ) ) ( not ( = ?auto_87236 ?auto_87239 ) ) ( not ( = ?auto_87236 ?auto_87240 ) ) ( not ( = ?auto_87239 ?auto_87240 ) ) ( not ( = ?auto_87233 ?auto_87239 ) ) ( not ( = ?auto_87233 ?auto_87237 ) ) ( not ( = ?auto_87233 ?auto_87234 ) ) ( not ( = ?auto_87233 ?auto_87236 ) ) ( not ( = ?auto_87235 ?auto_87239 ) ) ( not ( = ?auto_87235 ?auto_87237 ) ) ( not ( = ?auto_87235 ?auto_87234 ) ) ( not ( = ?auto_87235 ?auto_87236 ) ) ( not ( = ?auto_87238 ?auto_87239 ) ) ( not ( = ?auto_87238 ?auto_87237 ) ) ( not ( = ?auto_87238 ?auto_87234 ) ) ( not ( = ?auto_87238 ?auto_87236 ) ) ( ON ?auto_87240 ?auto_87238 ) ( CLEAR ?auto_87236 ) ( ON ?auto_87239 ?auto_87240 ) ( CLEAR ?auto_87239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87233 ?auto_87235 ?auto_87238 ?auto_87240 )
      ( MAKE-1PILE ?auto_87233 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87241 - BLOCK
    )
    :vars
    (
      ?auto_87244 - BLOCK
      ?auto_87246 - BLOCK
      ?auto_87247 - BLOCK
      ?auto_87248 - BLOCK
      ?auto_87243 - BLOCK
      ?auto_87242 - BLOCK
      ?auto_87245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87244 ?auto_87241 ) ( ON-TABLE ?auto_87241 ) ( not ( = ?auto_87241 ?auto_87244 ) ) ( not ( = ?auto_87241 ?auto_87246 ) ) ( not ( = ?auto_87241 ?auto_87247 ) ) ( not ( = ?auto_87244 ?auto_87246 ) ) ( not ( = ?auto_87244 ?auto_87247 ) ) ( not ( = ?auto_87246 ?auto_87247 ) ) ( ON ?auto_87246 ?auto_87244 ) ( ON-TABLE ?auto_87248 ) ( ON ?auto_87243 ?auto_87248 ) ( not ( = ?auto_87248 ?auto_87243 ) ) ( not ( = ?auto_87248 ?auto_87242 ) ) ( not ( = ?auto_87248 ?auto_87245 ) ) ( not ( = ?auto_87248 ?auto_87247 ) ) ( not ( = ?auto_87243 ?auto_87242 ) ) ( not ( = ?auto_87243 ?auto_87245 ) ) ( not ( = ?auto_87243 ?auto_87247 ) ) ( not ( = ?auto_87242 ?auto_87245 ) ) ( not ( = ?auto_87242 ?auto_87247 ) ) ( not ( = ?auto_87245 ?auto_87247 ) ) ( not ( = ?auto_87241 ?auto_87245 ) ) ( not ( = ?auto_87241 ?auto_87248 ) ) ( not ( = ?auto_87241 ?auto_87243 ) ) ( not ( = ?auto_87241 ?auto_87242 ) ) ( not ( = ?auto_87244 ?auto_87245 ) ) ( not ( = ?auto_87244 ?auto_87248 ) ) ( not ( = ?auto_87244 ?auto_87243 ) ) ( not ( = ?auto_87244 ?auto_87242 ) ) ( not ( = ?auto_87246 ?auto_87245 ) ) ( not ( = ?auto_87246 ?auto_87248 ) ) ( not ( = ?auto_87246 ?auto_87243 ) ) ( not ( = ?auto_87246 ?auto_87242 ) ) ( ON ?auto_87247 ?auto_87246 ) ( ON ?auto_87245 ?auto_87247 ) ( CLEAR ?auto_87245 ) ( HOLDING ?auto_87242 ) ( CLEAR ?auto_87243 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87248 ?auto_87243 ?auto_87242 )
      ( MAKE-1PILE ?auto_87241 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87249 - BLOCK
    )
    :vars
    (
      ?auto_87251 - BLOCK
      ?auto_87253 - BLOCK
      ?auto_87250 - BLOCK
      ?auto_87255 - BLOCK
      ?auto_87254 - BLOCK
      ?auto_87252 - BLOCK
      ?auto_87256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87251 ?auto_87249 ) ( ON-TABLE ?auto_87249 ) ( not ( = ?auto_87249 ?auto_87251 ) ) ( not ( = ?auto_87249 ?auto_87253 ) ) ( not ( = ?auto_87249 ?auto_87250 ) ) ( not ( = ?auto_87251 ?auto_87253 ) ) ( not ( = ?auto_87251 ?auto_87250 ) ) ( not ( = ?auto_87253 ?auto_87250 ) ) ( ON ?auto_87253 ?auto_87251 ) ( ON-TABLE ?auto_87255 ) ( ON ?auto_87254 ?auto_87255 ) ( not ( = ?auto_87255 ?auto_87254 ) ) ( not ( = ?auto_87255 ?auto_87252 ) ) ( not ( = ?auto_87255 ?auto_87256 ) ) ( not ( = ?auto_87255 ?auto_87250 ) ) ( not ( = ?auto_87254 ?auto_87252 ) ) ( not ( = ?auto_87254 ?auto_87256 ) ) ( not ( = ?auto_87254 ?auto_87250 ) ) ( not ( = ?auto_87252 ?auto_87256 ) ) ( not ( = ?auto_87252 ?auto_87250 ) ) ( not ( = ?auto_87256 ?auto_87250 ) ) ( not ( = ?auto_87249 ?auto_87256 ) ) ( not ( = ?auto_87249 ?auto_87255 ) ) ( not ( = ?auto_87249 ?auto_87254 ) ) ( not ( = ?auto_87249 ?auto_87252 ) ) ( not ( = ?auto_87251 ?auto_87256 ) ) ( not ( = ?auto_87251 ?auto_87255 ) ) ( not ( = ?auto_87251 ?auto_87254 ) ) ( not ( = ?auto_87251 ?auto_87252 ) ) ( not ( = ?auto_87253 ?auto_87256 ) ) ( not ( = ?auto_87253 ?auto_87255 ) ) ( not ( = ?auto_87253 ?auto_87254 ) ) ( not ( = ?auto_87253 ?auto_87252 ) ) ( ON ?auto_87250 ?auto_87253 ) ( ON ?auto_87256 ?auto_87250 ) ( CLEAR ?auto_87254 ) ( ON ?auto_87252 ?auto_87256 ) ( CLEAR ?auto_87252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87249 ?auto_87251 ?auto_87253 ?auto_87250 ?auto_87256 )
      ( MAKE-1PILE ?auto_87249 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87257 - BLOCK
    )
    :vars
    (
      ?auto_87261 - BLOCK
      ?auto_87263 - BLOCK
      ?auto_87258 - BLOCK
      ?auto_87264 - BLOCK
      ?auto_87260 - BLOCK
      ?auto_87262 - BLOCK
      ?auto_87259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87261 ?auto_87257 ) ( ON-TABLE ?auto_87257 ) ( not ( = ?auto_87257 ?auto_87261 ) ) ( not ( = ?auto_87257 ?auto_87263 ) ) ( not ( = ?auto_87257 ?auto_87258 ) ) ( not ( = ?auto_87261 ?auto_87263 ) ) ( not ( = ?auto_87261 ?auto_87258 ) ) ( not ( = ?auto_87263 ?auto_87258 ) ) ( ON ?auto_87263 ?auto_87261 ) ( ON-TABLE ?auto_87264 ) ( not ( = ?auto_87264 ?auto_87260 ) ) ( not ( = ?auto_87264 ?auto_87262 ) ) ( not ( = ?auto_87264 ?auto_87259 ) ) ( not ( = ?auto_87264 ?auto_87258 ) ) ( not ( = ?auto_87260 ?auto_87262 ) ) ( not ( = ?auto_87260 ?auto_87259 ) ) ( not ( = ?auto_87260 ?auto_87258 ) ) ( not ( = ?auto_87262 ?auto_87259 ) ) ( not ( = ?auto_87262 ?auto_87258 ) ) ( not ( = ?auto_87259 ?auto_87258 ) ) ( not ( = ?auto_87257 ?auto_87259 ) ) ( not ( = ?auto_87257 ?auto_87264 ) ) ( not ( = ?auto_87257 ?auto_87260 ) ) ( not ( = ?auto_87257 ?auto_87262 ) ) ( not ( = ?auto_87261 ?auto_87259 ) ) ( not ( = ?auto_87261 ?auto_87264 ) ) ( not ( = ?auto_87261 ?auto_87260 ) ) ( not ( = ?auto_87261 ?auto_87262 ) ) ( not ( = ?auto_87263 ?auto_87259 ) ) ( not ( = ?auto_87263 ?auto_87264 ) ) ( not ( = ?auto_87263 ?auto_87260 ) ) ( not ( = ?auto_87263 ?auto_87262 ) ) ( ON ?auto_87258 ?auto_87263 ) ( ON ?auto_87259 ?auto_87258 ) ( ON ?auto_87262 ?auto_87259 ) ( CLEAR ?auto_87262 ) ( HOLDING ?auto_87260 ) ( CLEAR ?auto_87264 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87264 ?auto_87260 )
      ( MAKE-1PILE ?auto_87257 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88671 - BLOCK
    )
    :vars
    (
      ?auto_88674 - BLOCK
      ?auto_88677 - BLOCK
      ?auto_88676 - BLOCK
      ?auto_88672 - BLOCK
      ?auto_88675 - BLOCK
      ?auto_88673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88674 ?auto_88671 ) ( ON-TABLE ?auto_88671 ) ( not ( = ?auto_88671 ?auto_88674 ) ) ( not ( = ?auto_88671 ?auto_88677 ) ) ( not ( = ?auto_88671 ?auto_88676 ) ) ( not ( = ?auto_88674 ?auto_88677 ) ) ( not ( = ?auto_88674 ?auto_88676 ) ) ( not ( = ?auto_88677 ?auto_88676 ) ) ( ON ?auto_88677 ?auto_88674 ) ( not ( = ?auto_88672 ?auto_88675 ) ) ( not ( = ?auto_88672 ?auto_88673 ) ) ( not ( = ?auto_88672 ?auto_88676 ) ) ( not ( = ?auto_88675 ?auto_88673 ) ) ( not ( = ?auto_88675 ?auto_88676 ) ) ( not ( = ?auto_88673 ?auto_88676 ) ) ( not ( = ?auto_88671 ?auto_88673 ) ) ( not ( = ?auto_88671 ?auto_88672 ) ) ( not ( = ?auto_88671 ?auto_88675 ) ) ( not ( = ?auto_88674 ?auto_88673 ) ) ( not ( = ?auto_88674 ?auto_88672 ) ) ( not ( = ?auto_88674 ?auto_88675 ) ) ( not ( = ?auto_88677 ?auto_88673 ) ) ( not ( = ?auto_88677 ?auto_88672 ) ) ( not ( = ?auto_88677 ?auto_88675 ) ) ( ON ?auto_88676 ?auto_88677 ) ( ON ?auto_88673 ?auto_88676 ) ( ON ?auto_88675 ?auto_88673 ) ( ON ?auto_88672 ?auto_88675 ) ( CLEAR ?auto_88672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88671 ?auto_88674 ?auto_88677 ?auto_88676 ?auto_88673 ?auto_88675 )
      ( MAKE-1PILE ?auto_88671 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87273 - BLOCK
    )
    :vars
    (
      ?auto_87278 - BLOCK
      ?auto_87275 - BLOCK
      ?auto_87277 - BLOCK
      ?auto_87276 - BLOCK
      ?auto_87274 - BLOCK
      ?auto_87280 - BLOCK
      ?auto_87279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87278 ?auto_87273 ) ( ON-TABLE ?auto_87273 ) ( not ( = ?auto_87273 ?auto_87278 ) ) ( not ( = ?auto_87273 ?auto_87275 ) ) ( not ( = ?auto_87273 ?auto_87277 ) ) ( not ( = ?auto_87278 ?auto_87275 ) ) ( not ( = ?auto_87278 ?auto_87277 ) ) ( not ( = ?auto_87275 ?auto_87277 ) ) ( ON ?auto_87275 ?auto_87278 ) ( not ( = ?auto_87276 ?auto_87274 ) ) ( not ( = ?auto_87276 ?auto_87280 ) ) ( not ( = ?auto_87276 ?auto_87279 ) ) ( not ( = ?auto_87276 ?auto_87277 ) ) ( not ( = ?auto_87274 ?auto_87280 ) ) ( not ( = ?auto_87274 ?auto_87279 ) ) ( not ( = ?auto_87274 ?auto_87277 ) ) ( not ( = ?auto_87280 ?auto_87279 ) ) ( not ( = ?auto_87280 ?auto_87277 ) ) ( not ( = ?auto_87279 ?auto_87277 ) ) ( not ( = ?auto_87273 ?auto_87279 ) ) ( not ( = ?auto_87273 ?auto_87276 ) ) ( not ( = ?auto_87273 ?auto_87274 ) ) ( not ( = ?auto_87273 ?auto_87280 ) ) ( not ( = ?auto_87278 ?auto_87279 ) ) ( not ( = ?auto_87278 ?auto_87276 ) ) ( not ( = ?auto_87278 ?auto_87274 ) ) ( not ( = ?auto_87278 ?auto_87280 ) ) ( not ( = ?auto_87275 ?auto_87279 ) ) ( not ( = ?auto_87275 ?auto_87276 ) ) ( not ( = ?auto_87275 ?auto_87274 ) ) ( not ( = ?auto_87275 ?auto_87280 ) ) ( ON ?auto_87277 ?auto_87275 ) ( ON ?auto_87279 ?auto_87277 ) ( ON ?auto_87280 ?auto_87279 ) ( ON ?auto_87274 ?auto_87280 ) ( CLEAR ?auto_87274 ) ( HOLDING ?auto_87276 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87276 )
      ( MAKE-1PILE ?auto_87273 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87281 - BLOCK
    )
    :vars
    (
      ?auto_87282 - BLOCK
      ?auto_87285 - BLOCK
      ?auto_87283 - BLOCK
      ?auto_87288 - BLOCK
      ?auto_87287 - BLOCK
      ?auto_87286 - BLOCK
      ?auto_87284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87282 ?auto_87281 ) ( ON-TABLE ?auto_87281 ) ( not ( = ?auto_87281 ?auto_87282 ) ) ( not ( = ?auto_87281 ?auto_87285 ) ) ( not ( = ?auto_87281 ?auto_87283 ) ) ( not ( = ?auto_87282 ?auto_87285 ) ) ( not ( = ?auto_87282 ?auto_87283 ) ) ( not ( = ?auto_87285 ?auto_87283 ) ) ( ON ?auto_87285 ?auto_87282 ) ( not ( = ?auto_87288 ?auto_87287 ) ) ( not ( = ?auto_87288 ?auto_87286 ) ) ( not ( = ?auto_87288 ?auto_87284 ) ) ( not ( = ?auto_87288 ?auto_87283 ) ) ( not ( = ?auto_87287 ?auto_87286 ) ) ( not ( = ?auto_87287 ?auto_87284 ) ) ( not ( = ?auto_87287 ?auto_87283 ) ) ( not ( = ?auto_87286 ?auto_87284 ) ) ( not ( = ?auto_87286 ?auto_87283 ) ) ( not ( = ?auto_87284 ?auto_87283 ) ) ( not ( = ?auto_87281 ?auto_87284 ) ) ( not ( = ?auto_87281 ?auto_87288 ) ) ( not ( = ?auto_87281 ?auto_87287 ) ) ( not ( = ?auto_87281 ?auto_87286 ) ) ( not ( = ?auto_87282 ?auto_87284 ) ) ( not ( = ?auto_87282 ?auto_87288 ) ) ( not ( = ?auto_87282 ?auto_87287 ) ) ( not ( = ?auto_87282 ?auto_87286 ) ) ( not ( = ?auto_87285 ?auto_87284 ) ) ( not ( = ?auto_87285 ?auto_87288 ) ) ( not ( = ?auto_87285 ?auto_87287 ) ) ( not ( = ?auto_87285 ?auto_87286 ) ) ( ON ?auto_87283 ?auto_87285 ) ( ON ?auto_87284 ?auto_87283 ) ( ON ?auto_87286 ?auto_87284 ) ( ON ?auto_87287 ?auto_87286 ) ( ON ?auto_87288 ?auto_87287 ) ( CLEAR ?auto_87288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87281 ?auto_87282 ?auto_87285 ?auto_87283 ?auto_87284 ?auto_87286 ?auto_87287 )
      ( MAKE-1PILE ?auto_87281 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87296 - BLOCK
      ?auto_87297 - BLOCK
      ?auto_87298 - BLOCK
      ?auto_87299 - BLOCK
      ?auto_87300 - BLOCK
      ?auto_87301 - BLOCK
      ?auto_87302 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_87302 ) ( CLEAR ?auto_87301 ) ( ON-TABLE ?auto_87296 ) ( ON ?auto_87297 ?auto_87296 ) ( ON ?auto_87298 ?auto_87297 ) ( ON ?auto_87299 ?auto_87298 ) ( ON ?auto_87300 ?auto_87299 ) ( ON ?auto_87301 ?auto_87300 ) ( not ( = ?auto_87296 ?auto_87297 ) ) ( not ( = ?auto_87296 ?auto_87298 ) ) ( not ( = ?auto_87296 ?auto_87299 ) ) ( not ( = ?auto_87296 ?auto_87300 ) ) ( not ( = ?auto_87296 ?auto_87301 ) ) ( not ( = ?auto_87296 ?auto_87302 ) ) ( not ( = ?auto_87297 ?auto_87298 ) ) ( not ( = ?auto_87297 ?auto_87299 ) ) ( not ( = ?auto_87297 ?auto_87300 ) ) ( not ( = ?auto_87297 ?auto_87301 ) ) ( not ( = ?auto_87297 ?auto_87302 ) ) ( not ( = ?auto_87298 ?auto_87299 ) ) ( not ( = ?auto_87298 ?auto_87300 ) ) ( not ( = ?auto_87298 ?auto_87301 ) ) ( not ( = ?auto_87298 ?auto_87302 ) ) ( not ( = ?auto_87299 ?auto_87300 ) ) ( not ( = ?auto_87299 ?auto_87301 ) ) ( not ( = ?auto_87299 ?auto_87302 ) ) ( not ( = ?auto_87300 ?auto_87301 ) ) ( not ( = ?auto_87300 ?auto_87302 ) ) ( not ( = ?auto_87301 ?auto_87302 ) ) )
    :subtasks
    ( ( !STACK ?auto_87302 ?auto_87301 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87303 - BLOCK
      ?auto_87304 - BLOCK
      ?auto_87305 - BLOCK
      ?auto_87306 - BLOCK
      ?auto_87307 - BLOCK
      ?auto_87308 - BLOCK
      ?auto_87309 - BLOCK
    )
    :vars
    (
      ?auto_87310 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_87308 ) ( ON-TABLE ?auto_87303 ) ( ON ?auto_87304 ?auto_87303 ) ( ON ?auto_87305 ?auto_87304 ) ( ON ?auto_87306 ?auto_87305 ) ( ON ?auto_87307 ?auto_87306 ) ( ON ?auto_87308 ?auto_87307 ) ( not ( = ?auto_87303 ?auto_87304 ) ) ( not ( = ?auto_87303 ?auto_87305 ) ) ( not ( = ?auto_87303 ?auto_87306 ) ) ( not ( = ?auto_87303 ?auto_87307 ) ) ( not ( = ?auto_87303 ?auto_87308 ) ) ( not ( = ?auto_87303 ?auto_87309 ) ) ( not ( = ?auto_87304 ?auto_87305 ) ) ( not ( = ?auto_87304 ?auto_87306 ) ) ( not ( = ?auto_87304 ?auto_87307 ) ) ( not ( = ?auto_87304 ?auto_87308 ) ) ( not ( = ?auto_87304 ?auto_87309 ) ) ( not ( = ?auto_87305 ?auto_87306 ) ) ( not ( = ?auto_87305 ?auto_87307 ) ) ( not ( = ?auto_87305 ?auto_87308 ) ) ( not ( = ?auto_87305 ?auto_87309 ) ) ( not ( = ?auto_87306 ?auto_87307 ) ) ( not ( = ?auto_87306 ?auto_87308 ) ) ( not ( = ?auto_87306 ?auto_87309 ) ) ( not ( = ?auto_87307 ?auto_87308 ) ) ( not ( = ?auto_87307 ?auto_87309 ) ) ( not ( = ?auto_87308 ?auto_87309 ) ) ( ON ?auto_87309 ?auto_87310 ) ( CLEAR ?auto_87309 ) ( HAND-EMPTY ) ( not ( = ?auto_87303 ?auto_87310 ) ) ( not ( = ?auto_87304 ?auto_87310 ) ) ( not ( = ?auto_87305 ?auto_87310 ) ) ( not ( = ?auto_87306 ?auto_87310 ) ) ( not ( = ?auto_87307 ?auto_87310 ) ) ( not ( = ?auto_87308 ?auto_87310 ) ) ( not ( = ?auto_87309 ?auto_87310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87309 ?auto_87310 )
      ( MAKE-7PILE ?auto_87303 ?auto_87304 ?auto_87305 ?auto_87306 ?auto_87307 ?auto_87308 ?auto_87309 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87311 - BLOCK
      ?auto_87312 - BLOCK
      ?auto_87313 - BLOCK
      ?auto_87314 - BLOCK
      ?auto_87315 - BLOCK
      ?auto_87316 - BLOCK
      ?auto_87317 - BLOCK
    )
    :vars
    (
      ?auto_87318 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87311 ) ( ON ?auto_87312 ?auto_87311 ) ( ON ?auto_87313 ?auto_87312 ) ( ON ?auto_87314 ?auto_87313 ) ( ON ?auto_87315 ?auto_87314 ) ( not ( = ?auto_87311 ?auto_87312 ) ) ( not ( = ?auto_87311 ?auto_87313 ) ) ( not ( = ?auto_87311 ?auto_87314 ) ) ( not ( = ?auto_87311 ?auto_87315 ) ) ( not ( = ?auto_87311 ?auto_87316 ) ) ( not ( = ?auto_87311 ?auto_87317 ) ) ( not ( = ?auto_87312 ?auto_87313 ) ) ( not ( = ?auto_87312 ?auto_87314 ) ) ( not ( = ?auto_87312 ?auto_87315 ) ) ( not ( = ?auto_87312 ?auto_87316 ) ) ( not ( = ?auto_87312 ?auto_87317 ) ) ( not ( = ?auto_87313 ?auto_87314 ) ) ( not ( = ?auto_87313 ?auto_87315 ) ) ( not ( = ?auto_87313 ?auto_87316 ) ) ( not ( = ?auto_87313 ?auto_87317 ) ) ( not ( = ?auto_87314 ?auto_87315 ) ) ( not ( = ?auto_87314 ?auto_87316 ) ) ( not ( = ?auto_87314 ?auto_87317 ) ) ( not ( = ?auto_87315 ?auto_87316 ) ) ( not ( = ?auto_87315 ?auto_87317 ) ) ( not ( = ?auto_87316 ?auto_87317 ) ) ( ON ?auto_87317 ?auto_87318 ) ( CLEAR ?auto_87317 ) ( not ( = ?auto_87311 ?auto_87318 ) ) ( not ( = ?auto_87312 ?auto_87318 ) ) ( not ( = ?auto_87313 ?auto_87318 ) ) ( not ( = ?auto_87314 ?auto_87318 ) ) ( not ( = ?auto_87315 ?auto_87318 ) ) ( not ( = ?auto_87316 ?auto_87318 ) ) ( not ( = ?auto_87317 ?auto_87318 ) ) ( HOLDING ?auto_87316 ) ( CLEAR ?auto_87315 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87311 ?auto_87312 ?auto_87313 ?auto_87314 ?auto_87315 ?auto_87316 )
      ( MAKE-7PILE ?auto_87311 ?auto_87312 ?auto_87313 ?auto_87314 ?auto_87315 ?auto_87316 ?auto_87317 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87319 - BLOCK
      ?auto_87320 - BLOCK
      ?auto_87321 - BLOCK
      ?auto_87322 - BLOCK
      ?auto_87323 - BLOCK
      ?auto_87324 - BLOCK
      ?auto_87325 - BLOCK
    )
    :vars
    (
      ?auto_87326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87319 ) ( ON ?auto_87320 ?auto_87319 ) ( ON ?auto_87321 ?auto_87320 ) ( ON ?auto_87322 ?auto_87321 ) ( ON ?auto_87323 ?auto_87322 ) ( not ( = ?auto_87319 ?auto_87320 ) ) ( not ( = ?auto_87319 ?auto_87321 ) ) ( not ( = ?auto_87319 ?auto_87322 ) ) ( not ( = ?auto_87319 ?auto_87323 ) ) ( not ( = ?auto_87319 ?auto_87324 ) ) ( not ( = ?auto_87319 ?auto_87325 ) ) ( not ( = ?auto_87320 ?auto_87321 ) ) ( not ( = ?auto_87320 ?auto_87322 ) ) ( not ( = ?auto_87320 ?auto_87323 ) ) ( not ( = ?auto_87320 ?auto_87324 ) ) ( not ( = ?auto_87320 ?auto_87325 ) ) ( not ( = ?auto_87321 ?auto_87322 ) ) ( not ( = ?auto_87321 ?auto_87323 ) ) ( not ( = ?auto_87321 ?auto_87324 ) ) ( not ( = ?auto_87321 ?auto_87325 ) ) ( not ( = ?auto_87322 ?auto_87323 ) ) ( not ( = ?auto_87322 ?auto_87324 ) ) ( not ( = ?auto_87322 ?auto_87325 ) ) ( not ( = ?auto_87323 ?auto_87324 ) ) ( not ( = ?auto_87323 ?auto_87325 ) ) ( not ( = ?auto_87324 ?auto_87325 ) ) ( ON ?auto_87325 ?auto_87326 ) ( not ( = ?auto_87319 ?auto_87326 ) ) ( not ( = ?auto_87320 ?auto_87326 ) ) ( not ( = ?auto_87321 ?auto_87326 ) ) ( not ( = ?auto_87322 ?auto_87326 ) ) ( not ( = ?auto_87323 ?auto_87326 ) ) ( not ( = ?auto_87324 ?auto_87326 ) ) ( not ( = ?auto_87325 ?auto_87326 ) ) ( CLEAR ?auto_87323 ) ( ON ?auto_87324 ?auto_87325 ) ( CLEAR ?auto_87324 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87326 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87326 ?auto_87325 )
      ( MAKE-7PILE ?auto_87319 ?auto_87320 ?auto_87321 ?auto_87322 ?auto_87323 ?auto_87324 ?auto_87325 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87327 - BLOCK
      ?auto_87328 - BLOCK
      ?auto_87329 - BLOCK
      ?auto_87330 - BLOCK
      ?auto_87331 - BLOCK
      ?auto_87332 - BLOCK
      ?auto_87333 - BLOCK
    )
    :vars
    (
      ?auto_87334 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87327 ) ( ON ?auto_87328 ?auto_87327 ) ( ON ?auto_87329 ?auto_87328 ) ( ON ?auto_87330 ?auto_87329 ) ( not ( = ?auto_87327 ?auto_87328 ) ) ( not ( = ?auto_87327 ?auto_87329 ) ) ( not ( = ?auto_87327 ?auto_87330 ) ) ( not ( = ?auto_87327 ?auto_87331 ) ) ( not ( = ?auto_87327 ?auto_87332 ) ) ( not ( = ?auto_87327 ?auto_87333 ) ) ( not ( = ?auto_87328 ?auto_87329 ) ) ( not ( = ?auto_87328 ?auto_87330 ) ) ( not ( = ?auto_87328 ?auto_87331 ) ) ( not ( = ?auto_87328 ?auto_87332 ) ) ( not ( = ?auto_87328 ?auto_87333 ) ) ( not ( = ?auto_87329 ?auto_87330 ) ) ( not ( = ?auto_87329 ?auto_87331 ) ) ( not ( = ?auto_87329 ?auto_87332 ) ) ( not ( = ?auto_87329 ?auto_87333 ) ) ( not ( = ?auto_87330 ?auto_87331 ) ) ( not ( = ?auto_87330 ?auto_87332 ) ) ( not ( = ?auto_87330 ?auto_87333 ) ) ( not ( = ?auto_87331 ?auto_87332 ) ) ( not ( = ?auto_87331 ?auto_87333 ) ) ( not ( = ?auto_87332 ?auto_87333 ) ) ( ON ?auto_87333 ?auto_87334 ) ( not ( = ?auto_87327 ?auto_87334 ) ) ( not ( = ?auto_87328 ?auto_87334 ) ) ( not ( = ?auto_87329 ?auto_87334 ) ) ( not ( = ?auto_87330 ?auto_87334 ) ) ( not ( = ?auto_87331 ?auto_87334 ) ) ( not ( = ?auto_87332 ?auto_87334 ) ) ( not ( = ?auto_87333 ?auto_87334 ) ) ( ON ?auto_87332 ?auto_87333 ) ( CLEAR ?auto_87332 ) ( ON-TABLE ?auto_87334 ) ( HOLDING ?auto_87331 ) ( CLEAR ?auto_87330 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87327 ?auto_87328 ?auto_87329 ?auto_87330 ?auto_87331 )
      ( MAKE-7PILE ?auto_87327 ?auto_87328 ?auto_87329 ?auto_87330 ?auto_87331 ?auto_87332 ?auto_87333 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87335 - BLOCK
      ?auto_87336 - BLOCK
      ?auto_87337 - BLOCK
      ?auto_87338 - BLOCK
      ?auto_87339 - BLOCK
      ?auto_87340 - BLOCK
      ?auto_87341 - BLOCK
    )
    :vars
    (
      ?auto_87342 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87335 ) ( ON ?auto_87336 ?auto_87335 ) ( ON ?auto_87337 ?auto_87336 ) ( ON ?auto_87338 ?auto_87337 ) ( not ( = ?auto_87335 ?auto_87336 ) ) ( not ( = ?auto_87335 ?auto_87337 ) ) ( not ( = ?auto_87335 ?auto_87338 ) ) ( not ( = ?auto_87335 ?auto_87339 ) ) ( not ( = ?auto_87335 ?auto_87340 ) ) ( not ( = ?auto_87335 ?auto_87341 ) ) ( not ( = ?auto_87336 ?auto_87337 ) ) ( not ( = ?auto_87336 ?auto_87338 ) ) ( not ( = ?auto_87336 ?auto_87339 ) ) ( not ( = ?auto_87336 ?auto_87340 ) ) ( not ( = ?auto_87336 ?auto_87341 ) ) ( not ( = ?auto_87337 ?auto_87338 ) ) ( not ( = ?auto_87337 ?auto_87339 ) ) ( not ( = ?auto_87337 ?auto_87340 ) ) ( not ( = ?auto_87337 ?auto_87341 ) ) ( not ( = ?auto_87338 ?auto_87339 ) ) ( not ( = ?auto_87338 ?auto_87340 ) ) ( not ( = ?auto_87338 ?auto_87341 ) ) ( not ( = ?auto_87339 ?auto_87340 ) ) ( not ( = ?auto_87339 ?auto_87341 ) ) ( not ( = ?auto_87340 ?auto_87341 ) ) ( ON ?auto_87341 ?auto_87342 ) ( not ( = ?auto_87335 ?auto_87342 ) ) ( not ( = ?auto_87336 ?auto_87342 ) ) ( not ( = ?auto_87337 ?auto_87342 ) ) ( not ( = ?auto_87338 ?auto_87342 ) ) ( not ( = ?auto_87339 ?auto_87342 ) ) ( not ( = ?auto_87340 ?auto_87342 ) ) ( not ( = ?auto_87341 ?auto_87342 ) ) ( ON ?auto_87340 ?auto_87341 ) ( ON-TABLE ?auto_87342 ) ( CLEAR ?auto_87338 ) ( ON ?auto_87339 ?auto_87340 ) ( CLEAR ?auto_87339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87342 ?auto_87341 ?auto_87340 )
      ( MAKE-7PILE ?auto_87335 ?auto_87336 ?auto_87337 ?auto_87338 ?auto_87339 ?auto_87340 ?auto_87341 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87343 - BLOCK
      ?auto_87344 - BLOCK
      ?auto_87345 - BLOCK
      ?auto_87346 - BLOCK
      ?auto_87347 - BLOCK
      ?auto_87348 - BLOCK
      ?auto_87349 - BLOCK
    )
    :vars
    (
      ?auto_87350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87343 ) ( ON ?auto_87344 ?auto_87343 ) ( ON ?auto_87345 ?auto_87344 ) ( not ( = ?auto_87343 ?auto_87344 ) ) ( not ( = ?auto_87343 ?auto_87345 ) ) ( not ( = ?auto_87343 ?auto_87346 ) ) ( not ( = ?auto_87343 ?auto_87347 ) ) ( not ( = ?auto_87343 ?auto_87348 ) ) ( not ( = ?auto_87343 ?auto_87349 ) ) ( not ( = ?auto_87344 ?auto_87345 ) ) ( not ( = ?auto_87344 ?auto_87346 ) ) ( not ( = ?auto_87344 ?auto_87347 ) ) ( not ( = ?auto_87344 ?auto_87348 ) ) ( not ( = ?auto_87344 ?auto_87349 ) ) ( not ( = ?auto_87345 ?auto_87346 ) ) ( not ( = ?auto_87345 ?auto_87347 ) ) ( not ( = ?auto_87345 ?auto_87348 ) ) ( not ( = ?auto_87345 ?auto_87349 ) ) ( not ( = ?auto_87346 ?auto_87347 ) ) ( not ( = ?auto_87346 ?auto_87348 ) ) ( not ( = ?auto_87346 ?auto_87349 ) ) ( not ( = ?auto_87347 ?auto_87348 ) ) ( not ( = ?auto_87347 ?auto_87349 ) ) ( not ( = ?auto_87348 ?auto_87349 ) ) ( ON ?auto_87349 ?auto_87350 ) ( not ( = ?auto_87343 ?auto_87350 ) ) ( not ( = ?auto_87344 ?auto_87350 ) ) ( not ( = ?auto_87345 ?auto_87350 ) ) ( not ( = ?auto_87346 ?auto_87350 ) ) ( not ( = ?auto_87347 ?auto_87350 ) ) ( not ( = ?auto_87348 ?auto_87350 ) ) ( not ( = ?auto_87349 ?auto_87350 ) ) ( ON ?auto_87348 ?auto_87349 ) ( ON-TABLE ?auto_87350 ) ( ON ?auto_87347 ?auto_87348 ) ( CLEAR ?auto_87347 ) ( HOLDING ?auto_87346 ) ( CLEAR ?auto_87345 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87343 ?auto_87344 ?auto_87345 ?auto_87346 )
      ( MAKE-7PILE ?auto_87343 ?auto_87344 ?auto_87345 ?auto_87346 ?auto_87347 ?auto_87348 ?auto_87349 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87351 - BLOCK
      ?auto_87352 - BLOCK
      ?auto_87353 - BLOCK
      ?auto_87354 - BLOCK
      ?auto_87355 - BLOCK
      ?auto_87356 - BLOCK
      ?auto_87357 - BLOCK
    )
    :vars
    (
      ?auto_87358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87351 ) ( ON ?auto_87352 ?auto_87351 ) ( ON ?auto_87353 ?auto_87352 ) ( not ( = ?auto_87351 ?auto_87352 ) ) ( not ( = ?auto_87351 ?auto_87353 ) ) ( not ( = ?auto_87351 ?auto_87354 ) ) ( not ( = ?auto_87351 ?auto_87355 ) ) ( not ( = ?auto_87351 ?auto_87356 ) ) ( not ( = ?auto_87351 ?auto_87357 ) ) ( not ( = ?auto_87352 ?auto_87353 ) ) ( not ( = ?auto_87352 ?auto_87354 ) ) ( not ( = ?auto_87352 ?auto_87355 ) ) ( not ( = ?auto_87352 ?auto_87356 ) ) ( not ( = ?auto_87352 ?auto_87357 ) ) ( not ( = ?auto_87353 ?auto_87354 ) ) ( not ( = ?auto_87353 ?auto_87355 ) ) ( not ( = ?auto_87353 ?auto_87356 ) ) ( not ( = ?auto_87353 ?auto_87357 ) ) ( not ( = ?auto_87354 ?auto_87355 ) ) ( not ( = ?auto_87354 ?auto_87356 ) ) ( not ( = ?auto_87354 ?auto_87357 ) ) ( not ( = ?auto_87355 ?auto_87356 ) ) ( not ( = ?auto_87355 ?auto_87357 ) ) ( not ( = ?auto_87356 ?auto_87357 ) ) ( ON ?auto_87357 ?auto_87358 ) ( not ( = ?auto_87351 ?auto_87358 ) ) ( not ( = ?auto_87352 ?auto_87358 ) ) ( not ( = ?auto_87353 ?auto_87358 ) ) ( not ( = ?auto_87354 ?auto_87358 ) ) ( not ( = ?auto_87355 ?auto_87358 ) ) ( not ( = ?auto_87356 ?auto_87358 ) ) ( not ( = ?auto_87357 ?auto_87358 ) ) ( ON ?auto_87356 ?auto_87357 ) ( ON-TABLE ?auto_87358 ) ( ON ?auto_87355 ?auto_87356 ) ( CLEAR ?auto_87353 ) ( ON ?auto_87354 ?auto_87355 ) ( CLEAR ?auto_87354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87358 ?auto_87357 ?auto_87356 ?auto_87355 )
      ( MAKE-7PILE ?auto_87351 ?auto_87352 ?auto_87353 ?auto_87354 ?auto_87355 ?auto_87356 ?auto_87357 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87359 - BLOCK
      ?auto_87360 - BLOCK
      ?auto_87361 - BLOCK
      ?auto_87362 - BLOCK
      ?auto_87363 - BLOCK
      ?auto_87364 - BLOCK
      ?auto_87365 - BLOCK
    )
    :vars
    (
      ?auto_87366 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87359 ) ( ON ?auto_87360 ?auto_87359 ) ( not ( = ?auto_87359 ?auto_87360 ) ) ( not ( = ?auto_87359 ?auto_87361 ) ) ( not ( = ?auto_87359 ?auto_87362 ) ) ( not ( = ?auto_87359 ?auto_87363 ) ) ( not ( = ?auto_87359 ?auto_87364 ) ) ( not ( = ?auto_87359 ?auto_87365 ) ) ( not ( = ?auto_87360 ?auto_87361 ) ) ( not ( = ?auto_87360 ?auto_87362 ) ) ( not ( = ?auto_87360 ?auto_87363 ) ) ( not ( = ?auto_87360 ?auto_87364 ) ) ( not ( = ?auto_87360 ?auto_87365 ) ) ( not ( = ?auto_87361 ?auto_87362 ) ) ( not ( = ?auto_87361 ?auto_87363 ) ) ( not ( = ?auto_87361 ?auto_87364 ) ) ( not ( = ?auto_87361 ?auto_87365 ) ) ( not ( = ?auto_87362 ?auto_87363 ) ) ( not ( = ?auto_87362 ?auto_87364 ) ) ( not ( = ?auto_87362 ?auto_87365 ) ) ( not ( = ?auto_87363 ?auto_87364 ) ) ( not ( = ?auto_87363 ?auto_87365 ) ) ( not ( = ?auto_87364 ?auto_87365 ) ) ( ON ?auto_87365 ?auto_87366 ) ( not ( = ?auto_87359 ?auto_87366 ) ) ( not ( = ?auto_87360 ?auto_87366 ) ) ( not ( = ?auto_87361 ?auto_87366 ) ) ( not ( = ?auto_87362 ?auto_87366 ) ) ( not ( = ?auto_87363 ?auto_87366 ) ) ( not ( = ?auto_87364 ?auto_87366 ) ) ( not ( = ?auto_87365 ?auto_87366 ) ) ( ON ?auto_87364 ?auto_87365 ) ( ON-TABLE ?auto_87366 ) ( ON ?auto_87363 ?auto_87364 ) ( ON ?auto_87362 ?auto_87363 ) ( CLEAR ?auto_87362 ) ( HOLDING ?auto_87361 ) ( CLEAR ?auto_87360 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87359 ?auto_87360 ?auto_87361 )
      ( MAKE-7PILE ?auto_87359 ?auto_87360 ?auto_87361 ?auto_87362 ?auto_87363 ?auto_87364 ?auto_87365 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87367 - BLOCK
      ?auto_87368 - BLOCK
      ?auto_87369 - BLOCK
      ?auto_87370 - BLOCK
      ?auto_87371 - BLOCK
      ?auto_87372 - BLOCK
      ?auto_87373 - BLOCK
    )
    :vars
    (
      ?auto_87374 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87367 ) ( ON ?auto_87368 ?auto_87367 ) ( not ( = ?auto_87367 ?auto_87368 ) ) ( not ( = ?auto_87367 ?auto_87369 ) ) ( not ( = ?auto_87367 ?auto_87370 ) ) ( not ( = ?auto_87367 ?auto_87371 ) ) ( not ( = ?auto_87367 ?auto_87372 ) ) ( not ( = ?auto_87367 ?auto_87373 ) ) ( not ( = ?auto_87368 ?auto_87369 ) ) ( not ( = ?auto_87368 ?auto_87370 ) ) ( not ( = ?auto_87368 ?auto_87371 ) ) ( not ( = ?auto_87368 ?auto_87372 ) ) ( not ( = ?auto_87368 ?auto_87373 ) ) ( not ( = ?auto_87369 ?auto_87370 ) ) ( not ( = ?auto_87369 ?auto_87371 ) ) ( not ( = ?auto_87369 ?auto_87372 ) ) ( not ( = ?auto_87369 ?auto_87373 ) ) ( not ( = ?auto_87370 ?auto_87371 ) ) ( not ( = ?auto_87370 ?auto_87372 ) ) ( not ( = ?auto_87370 ?auto_87373 ) ) ( not ( = ?auto_87371 ?auto_87372 ) ) ( not ( = ?auto_87371 ?auto_87373 ) ) ( not ( = ?auto_87372 ?auto_87373 ) ) ( ON ?auto_87373 ?auto_87374 ) ( not ( = ?auto_87367 ?auto_87374 ) ) ( not ( = ?auto_87368 ?auto_87374 ) ) ( not ( = ?auto_87369 ?auto_87374 ) ) ( not ( = ?auto_87370 ?auto_87374 ) ) ( not ( = ?auto_87371 ?auto_87374 ) ) ( not ( = ?auto_87372 ?auto_87374 ) ) ( not ( = ?auto_87373 ?auto_87374 ) ) ( ON ?auto_87372 ?auto_87373 ) ( ON-TABLE ?auto_87374 ) ( ON ?auto_87371 ?auto_87372 ) ( ON ?auto_87370 ?auto_87371 ) ( CLEAR ?auto_87368 ) ( ON ?auto_87369 ?auto_87370 ) ( CLEAR ?auto_87369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87374 ?auto_87373 ?auto_87372 ?auto_87371 ?auto_87370 )
      ( MAKE-7PILE ?auto_87367 ?auto_87368 ?auto_87369 ?auto_87370 ?auto_87371 ?auto_87372 ?auto_87373 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87375 - BLOCK
      ?auto_87376 - BLOCK
      ?auto_87377 - BLOCK
      ?auto_87378 - BLOCK
      ?auto_87379 - BLOCK
      ?auto_87380 - BLOCK
      ?auto_87381 - BLOCK
    )
    :vars
    (
      ?auto_87382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87375 ) ( not ( = ?auto_87375 ?auto_87376 ) ) ( not ( = ?auto_87375 ?auto_87377 ) ) ( not ( = ?auto_87375 ?auto_87378 ) ) ( not ( = ?auto_87375 ?auto_87379 ) ) ( not ( = ?auto_87375 ?auto_87380 ) ) ( not ( = ?auto_87375 ?auto_87381 ) ) ( not ( = ?auto_87376 ?auto_87377 ) ) ( not ( = ?auto_87376 ?auto_87378 ) ) ( not ( = ?auto_87376 ?auto_87379 ) ) ( not ( = ?auto_87376 ?auto_87380 ) ) ( not ( = ?auto_87376 ?auto_87381 ) ) ( not ( = ?auto_87377 ?auto_87378 ) ) ( not ( = ?auto_87377 ?auto_87379 ) ) ( not ( = ?auto_87377 ?auto_87380 ) ) ( not ( = ?auto_87377 ?auto_87381 ) ) ( not ( = ?auto_87378 ?auto_87379 ) ) ( not ( = ?auto_87378 ?auto_87380 ) ) ( not ( = ?auto_87378 ?auto_87381 ) ) ( not ( = ?auto_87379 ?auto_87380 ) ) ( not ( = ?auto_87379 ?auto_87381 ) ) ( not ( = ?auto_87380 ?auto_87381 ) ) ( ON ?auto_87381 ?auto_87382 ) ( not ( = ?auto_87375 ?auto_87382 ) ) ( not ( = ?auto_87376 ?auto_87382 ) ) ( not ( = ?auto_87377 ?auto_87382 ) ) ( not ( = ?auto_87378 ?auto_87382 ) ) ( not ( = ?auto_87379 ?auto_87382 ) ) ( not ( = ?auto_87380 ?auto_87382 ) ) ( not ( = ?auto_87381 ?auto_87382 ) ) ( ON ?auto_87380 ?auto_87381 ) ( ON-TABLE ?auto_87382 ) ( ON ?auto_87379 ?auto_87380 ) ( ON ?auto_87378 ?auto_87379 ) ( ON ?auto_87377 ?auto_87378 ) ( CLEAR ?auto_87377 ) ( HOLDING ?auto_87376 ) ( CLEAR ?auto_87375 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87375 ?auto_87376 )
      ( MAKE-7PILE ?auto_87375 ?auto_87376 ?auto_87377 ?auto_87378 ?auto_87379 ?auto_87380 ?auto_87381 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87383 - BLOCK
      ?auto_87384 - BLOCK
      ?auto_87385 - BLOCK
      ?auto_87386 - BLOCK
      ?auto_87387 - BLOCK
      ?auto_87388 - BLOCK
      ?auto_87389 - BLOCK
    )
    :vars
    (
      ?auto_87390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87383 ) ( not ( = ?auto_87383 ?auto_87384 ) ) ( not ( = ?auto_87383 ?auto_87385 ) ) ( not ( = ?auto_87383 ?auto_87386 ) ) ( not ( = ?auto_87383 ?auto_87387 ) ) ( not ( = ?auto_87383 ?auto_87388 ) ) ( not ( = ?auto_87383 ?auto_87389 ) ) ( not ( = ?auto_87384 ?auto_87385 ) ) ( not ( = ?auto_87384 ?auto_87386 ) ) ( not ( = ?auto_87384 ?auto_87387 ) ) ( not ( = ?auto_87384 ?auto_87388 ) ) ( not ( = ?auto_87384 ?auto_87389 ) ) ( not ( = ?auto_87385 ?auto_87386 ) ) ( not ( = ?auto_87385 ?auto_87387 ) ) ( not ( = ?auto_87385 ?auto_87388 ) ) ( not ( = ?auto_87385 ?auto_87389 ) ) ( not ( = ?auto_87386 ?auto_87387 ) ) ( not ( = ?auto_87386 ?auto_87388 ) ) ( not ( = ?auto_87386 ?auto_87389 ) ) ( not ( = ?auto_87387 ?auto_87388 ) ) ( not ( = ?auto_87387 ?auto_87389 ) ) ( not ( = ?auto_87388 ?auto_87389 ) ) ( ON ?auto_87389 ?auto_87390 ) ( not ( = ?auto_87383 ?auto_87390 ) ) ( not ( = ?auto_87384 ?auto_87390 ) ) ( not ( = ?auto_87385 ?auto_87390 ) ) ( not ( = ?auto_87386 ?auto_87390 ) ) ( not ( = ?auto_87387 ?auto_87390 ) ) ( not ( = ?auto_87388 ?auto_87390 ) ) ( not ( = ?auto_87389 ?auto_87390 ) ) ( ON ?auto_87388 ?auto_87389 ) ( ON-TABLE ?auto_87390 ) ( ON ?auto_87387 ?auto_87388 ) ( ON ?auto_87386 ?auto_87387 ) ( ON ?auto_87385 ?auto_87386 ) ( CLEAR ?auto_87383 ) ( ON ?auto_87384 ?auto_87385 ) ( CLEAR ?auto_87384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87390 ?auto_87389 ?auto_87388 ?auto_87387 ?auto_87386 ?auto_87385 )
      ( MAKE-7PILE ?auto_87383 ?auto_87384 ?auto_87385 ?auto_87386 ?auto_87387 ?auto_87388 ?auto_87389 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87391 - BLOCK
      ?auto_87392 - BLOCK
      ?auto_87393 - BLOCK
      ?auto_87394 - BLOCK
      ?auto_87395 - BLOCK
      ?auto_87396 - BLOCK
      ?auto_87397 - BLOCK
    )
    :vars
    (
      ?auto_87398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87391 ?auto_87392 ) ) ( not ( = ?auto_87391 ?auto_87393 ) ) ( not ( = ?auto_87391 ?auto_87394 ) ) ( not ( = ?auto_87391 ?auto_87395 ) ) ( not ( = ?auto_87391 ?auto_87396 ) ) ( not ( = ?auto_87391 ?auto_87397 ) ) ( not ( = ?auto_87392 ?auto_87393 ) ) ( not ( = ?auto_87392 ?auto_87394 ) ) ( not ( = ?auto_87392 ?auto_87395 ) ) ( not ( = ?auto_87392 ?auto_87396 ) ) ( not ( = ?auto_87392 ?auto_87397 ) ) ( not ( = ?auto_87393 ?auto_87394 ) ) ( not ( = ?auto_87393 ?auto_87395 ) ) ( not ( = ?auto_87393 ?auto_87396 ) ) ( not ( = ?auto_87393 ?auto_87397 ) ) ( not ( = ?auto_87394 ?auto_87395 ) ) ( not ( = ?auto_87394 ?auto_87396 ) ) ( not ( = ?auto_87394 ?auto_87397 ) ) ( not ( = ?auto_87395 ?auto_87396 ) ) ( not ( = ?auto_87395 ?auto_87397 ) ) ( not ( = ?auto_87396 ?auto_87397 ) ) ( ON ?auto_87397 ?auto_87398 ) ( not ( = ?auto_87391 ?auto_87398 ) ) ( not ( = ?auto_87392 ?auto_87398 ) ) ( not ( = ?auto_87393 ?auto_87398 ) ) ( not ( = ?auto_87394 ?auto_87398 ) ) ( not ( = ?auto_87395 ?auto_87398 ) ) ( not ( = ?auto_87396 ?auto_87398 ) ) ( not ( = ?auto_87397 ?auto_87398 ) ) ( ON ?auto_87396 ?auto_87397 ) ( ON-TABLE ?auto_87398 ) ( ON ?auto_87395 ?auto_87396 ) ( ON ?auto_87394 ?auto_87395 ) ( ON ?auto_87393 ?auto_87394 ) ( ON ?auto_87392 ?auto_87393 ) ( CLEAR ?auto_87392 ) ( HOLDING ?auto_87391 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87391 )
      ( MAKE-7PILE ?auto_87391 ?auto_87392 ?auto_87393 ?auto_87394 ?auto_87395 ?auto_87396 ?auto_87397 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87399 - BLOCK
      ?auto_87400 - BLOCK
      ?auto_87401 - BLOCK
      ?auto_87402 - BLOCK
      ?auto_87403 - BLOCK
      ?auto_87404 - BLOCK
      ?auto_87405 - BLOCK
    )
    :vars
    (
      ?auto_87406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87399 ?auto_87400 ) ) ( not ( = ?auto_87399 ?auto_87401 ) ) ( not ( = ?auto_87399 ?auto_87402 ) ) ( not ( = ?auto_87399 ?auto_87403 ) ) ( not ( = ?auto_87399 ?auto_87404 ) ) ( not ( = ?auto_87399 ?auto_87405 ) ) ( not ( = ?auto_87400 ?auto_87401 ) ) ( not ( = ?auto_87400 ?auto_87402 ) ) ( not ( = ?auto_87400 ?auto_87403 ) ) ( not ( = ?auto_87400 ?auto_87404 ) ) ( not ( = ?auto_87400 ?auto_87405 ) ) ( not ( = ?auto_87401 ?auto_87402 ) ) ( not ( = ?auto_87401 ?auto_87403 ) ) ( not ( = ?auto_87401 ?auto_87404 ) ) ( not ( = ?auto_87401 ?auto_87405 ) ) ( not ( = ?auto_87402 ?auto_87403 ) ) ( not ( = ?auto_87402 ?auto_87404 ) ) ( not ( = ?auto_87402 ?auto_87405 ) ) ( not ( = ?auto_87403 ?auto_87404 ) ) ( not ( = ?auto_87403 ?auto_87405 ) ) ( not ( = ?auto_87404 ?auto_87405 ) ) ( ON ?auto_87405 ?auto_87406 ) ( not ( = ?auto_87399 ?auto_87406 ) ) ( not ( = ?auto_87400 ?auto_87406 ) ) ( not ( = ?auto_87401 ?auto_87406 ) ) ( not ( = ?auto_87402 ?auto_87406 ) ) ( not ( = ?auto_87403 ?auto_87406 ) ) ( not ( = ?auto_87404 ?auto_87406 ) ) ( not ( = ?auto_87405 ?auto_87406 ) ) ( ON ?auto_87404 ?auto_87405 ) ( ON-TABLE ?auto_87406 ) ( ON ?auto_87403 ?auto_87404 ) ( ON ?auto_87402 ?auto_87403 ) ( ON ?auto_87401 ?auto_87402 ) ( ON ?auto_87400 ?auto_87401 ) ( ON ?auto_87399 ?auto_87400 ) ( CLEAR ?auto_87399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87406 ?auto_87405 ?auto_87404 ?auto_87403 ?auto_87402 ?auto_87401 ?auto_87400 )
      ( MAKE-7PILE ?auto_87399 ?auto_87400 ?auto_87401 ?auto_87402 ?auto_87403 ?auto_87404 ?auto_87405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87513 - BLOCK
    )
    :vars
    (
      ?auto_87514 - BLOCK
      ?auto_87515 - BLOCK
      ?auto_87516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87513 ?auto_87514 ) ( CLEAR ?auto_87513 ) ( not ( = ?auto_87513 ?auto_87514 ) ) ( HOLDING ?auto_87515 ) ( CLEAR ?auto_87516 ) ( not ( = ?auto_87513 ?auto_87515 ) ) ( not ( = ?auto_87513 ?auto_87516 ) ) ( not ( = ?auto_87514 ?auto_87515 ) ) ( not ( = ?auto_87514 ?auto_87516 ) ) ( not ( = ?auto_87515 ?auto_87516 ) ) )
    :subtasks
    ( ( !STACK ?auto_87515 ?auto_87516 )
      ( MAKE-1PILE ?auto_87513 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87517 - BLOCK
    )
    :vars
    (
      ?auto_87518 - BLOCK
      ?auto_87519 - BLOCK
      ?auto_87520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87517 ?auto_87518 ) ( not ( = ?auto_87517 ?auto_87518 ) ) ( CLEAR ?auto_87519 ) ( not ( = ?auto_87517 ?auto_87520 ) ) ( not ( = ?auto_87517 ?auto_87519 ) ) ( not ( = ?auto_87518 ?auto_87520 ) ) ( not ( = ?auto_87518 ?auto_87519 ) ) ( not ( = ?auto_87520 ?auto_87519 ) ) ( ON ?auto_87520 ?auto_87517 ) ( CLEAR ?auto_87520 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87518 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87518 ?auto_87517 )
      ( MAKE-1PILE ?auto_87517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87521 - BLOCK
    )
    :vars
    (
      ?auto_87523 - BLOCK
      ?auto_87524 - BLOCK
      ?auto_87522 - BLOCK
      ?auto_87527 - BLOCK
      ?auto_87525 - BLOCK
      ?auto_87528 - BLOCK
      ?auto_87526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87521 ?auto_87523 ) ( not ( = ?auto_87521 ?auto_87523 ) ) ( not ( = ?auto_87521 ?auto_87524 ) ) ( not ( = ?auto_87521 ?auto_87522 ) ) ( not ( = ?auto_87523 ?auto_87524 ) ) ( not ( = ?auto_87523 ?auto_87522 ) ) ( not ( = ?auto_87524 ?auto_87522 ) ) ( ON ?auto_87524 ?auto_87521 ) ( CLEAR ?auto_87524 ) ( ON-TABLE ?auto_87523 ) ( HOLDING ?auto_87522 ) ( CLEAR ?auto_87527 ) ( ON-TABLE ?auto_87525 ) ( ON ?auto_87528 ?auto_87525 ) ( ON ?auto_87526 ?auto_87528 ) ( ON ?auto_87527 ?auto_87526 ) ( not ( = ?auto_87525 ?auto_87528 ) ) ( not ( = ?auto_87525 ?auto_87526 ) ) ( not ( = ?auto_87525 ?auto_87527 ) ) ( not ( = ?auto_87525 ?auto_87522 ) ) ( not ( = ?auto_87528 ?auto_87526 ) ) ( not ( = ?auto_87528 ?auto_87527 ) ) ( not ( = ?auto_87528 ?auto_87522 ) ) ( not ( = ?auto_87526 ?auto_87527 ) ) ( not ( = ?auto_87526 ?auto_87522 ) ) ( not ( = ?auto_87527 ?auto_87522 ) ) ( not ( = ?auto_87521 ?auto_87527 ) ) ( not ( = ?auto_87521 ?auto_87525 ) ) ( not ( = ?auto_87521 ?auto_87528 ) ) ( not ( = ?auto_87521 ?auto_87526 ) ) ( not ( = ?auto_87523 ?auto_87527 ) ) ( not ( = ?auto_87523 ?auto_87525 ) ) ( not ( = ?auto_87523 ?auto_87528 ) ) ( not ( = ?auto_87523 ?auto_87526 ) ) ( not ( = ?auto_87524 ?auto_87527 ) ) ( not ( = ?auto_87524 ?auto_87525 ) ) ( not ( = ?auto_87524 ?auto_87528 ) ) ( not ( = ?auto_87524 ?auto_87526 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87525 ?auto_87528 ?auto_87526 ?auto_87527 ?auto_87522 )
      ( MAKE-1PILE ?auto_87521 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87529 - BLOCK
    )
    :vars
    (
      ?auto_87534 - BLOCK
      ?auto_87530 - BLOCK
      ?auto_87535 - BLOCK
      ?auto_87532 - BLOCK
      ?auto_87536 - BLOCK
      ?auto_87533 - BLOCK
      ?auto_87531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87529 ?auto_87534 ) ( not ( = ?auto_87529 ?auto_87534 ) ) ( not ( = ?auto_87529 ?auto_87530 ) ) ( not ( = ?auto_87529 ?auto_87535 ) ) ( not ( = ?auto_87534 ?auto_87530 ) ) ( not ( = ?auto_87534 ?auto_87535 ) ) ( not ( = ?auto_87530 ?auto_87535 ) ) ( ON ?auto_87530 ?auto_87529 ) ( ON-TABLE ?auto_87534 ) ( CLEAR ?auto_87532 ) ( ON-TABLE ?auto_87536 ) ( ON ?auto_87533 ?auto_87536 ) ( ON ?auto_87531 ?auto_87533 ) ( ON ?auto_87532 ?auto_87531 ) ( not ( = ?auto_87536 ?auto_87533 ) ) ( not ( = ?auto_87536 ?auto_87531 ) ) ( not ( = ?auto_87536 ?auto_87532 ) ) ( not ( = ?auto_87536 ?auto_87535 ) ) ( not ( = ?auto_87533 ?auto_87531 ) ) ( not ( = ?auto_87533 ?auto_87532 ) ) ( not ( = ?auto_87533 ?auto_87535 ) ) ( not ( = ?auto_87531 ?auto_87532 ) ) ( not ( = ?auto_87531 ?auto_87535 ) ) ( not ( = ?auto_87532 ?auto_87535 ) ) ( not ( = ?auto_87529 ?auto_87532 ) ) ( not ( = ?auto_87529 ?auto_87536 ) ) ( not ( = ?auto_87529 ?auto_87533 ) ) ( not ( = ?auto_87529 ?auto_87531 ) ) ( not ( = ?auto_87534 ?auto_87532 ) ) ( not ( = ?auto_87534 ?auto_87536 ) ) ( not ( = ?auto_87534 ?auto_87533 ) ) ( not ( = ?auto_87534 ?auto_87531 ) ) ( not ( = ?auto_87530 ?auto_87532 ) ) ( not ( = ?auto_87530 ?auto_87536 ) ) ( not ( = ?auto_87530 ?auto_87533 ) ) ( not ( = ?auto_87530 ?auto_87531 ) ) ( ON ?auto_87535 ?auto_87530 ) ( CLEAR ?auto_87535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87534 ?auto_87529 ?auto_87530 )
      ( MAKE-1PILE ?auto_87529 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87537 - BLOCK
    )
    :vars
    (
      ?auto_87541 - BLOCK
      ?auto_87538 - BLOCK
      ?auto_87539 - BLOCK
      ?auto_87542 - BLOCK
      ?auto_87540 - BLOCK
      ?auto_87544 - BLOCK
      ?auto_87543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87537 ?auto_87541 ) ( not ( = ?auto_87537 ?auto_87541 ) ) ( not ( = ?auto_87537 ?auto_87538 ) ) ( not ( = ?auto_87537 ?auto_87539 ) ) ( not ( = ?auto_87541 ?auto_87538 ) ) ( not ( = ?auto_87541 ?auto_87539 ) ) ( not ( = ?auto_87538 ?auto_87539 ) ) ( ON ?auto_87538 ?auto_87537 ) ( ON-TABLE ?auto_87541 ) ( ON-TABLE ?auto_87542 ) ( ON ?auto_87540 ?auto_87542 ) ( ON ?auto_87544 ?auto_87540 ) ( not ( = ?auto_87542 ?auto_87540 ) ) ( not ( = ?auto_87542 ?auto_87544 ) ) ( not ( = ?auto_87542 ?auto_87543 ) ) ( not ( = ?auto_87542 ?auto_87539 ) ) ( not ( = ?auto_87540 ?auto_87544 ) ) ( not ( = ?auto_87540 ?auto_87543 ) ) ( not ( = ?auto_87540 ?auto_87539 ) ) ( not ( = ?auto_87544 ?auto_87543 ) ) ( not ( = ?auto_87544 ?auto_87539 ) ) ( not ( = ?auto_87543 ?auto_87539 ) ) ( not ( = ?auto_87537 ?auto_87543 ) ) ( not ( = ?auto_87537 ?auto_87542 ) ) ( not ( = ?auto_87537 ?auto_87540 ) ) ( not ( = ?auto_87537 ?auto_87544 ) ) ( not ( = ?auto_87541 ?auto_87543 ) ) ( not ( = ?auto_87541 ?auto_87542 ) ) ( not ( = ?auto_87541 ?auto_87540 ) ) ( not ( = ?auto_87541 ?auto_87544 ) ) ( not ( = ?auto_87538 ?auto_87543 ) ) ( not ( = ?auto_87538 ?auto_87542 ) ) ( not ( = ?auto_87538 ?auto_87540 ) ) ( not ( = ?auto_87538 ?auto_87544 ) ) ( ON ?auto_87539 ?auto_87538 ) ( CLEAR ?auto_87539 ) ( HOLDING ?auto_87543 ) ( CLEAR ?auto_87544 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87542 ?auto_87540 ?auto_87544 ?auto_87543 )
      ( MAKE-1PILE ?auto_87537 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87545 - BLOCK
    )
    :vars
    (
      ?auto_87548 - BLOCK
      ?auto_87549 - BLOCK
      ?auto_87550 - BLOCK
      ?auto_87552 - BLOCK
      ?auto_87546 - BLOCK
      ?auto_87547 - BLOCK
      ?auto_87551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87545 ?auto_87548 ) ( not ( = ?auto_87545 ?auto_87548 ) ) ( not ( = ?auto_87545 ?auto_87549 ) ) ( not ( = ?auto_87545 ?auto_87550 ) ) ( not ( = ?auto_87548 ?auto_87549 ) ) ( not ( = ?auto_87548 ?auto_87550 ) ) ( not ( = ?auto_87549 ?auto_87550 ) ) ( ON ?auto_87549 ?auto_87545 ) ( ON-TABLE ?auto_87548 ) ( ON-TABLE ?auto_87552 ) ( ON ?auto_87546 ?auto_87552 ) ( ON ?auto_87547 ?auto_87546 ) ( not ( = ?auto_87552 ?auto_87546 ) ) ( not ( = ?auto_87552 ?auto_87547 ) ) ( not ( = ?auto_87552 ?auto_87551 ) ) ( not ( = ?auto_87552 ?auto_87550 ) ) ( not ( = ?auto_87546 ?auto_87547 ) ) ( not ( = ?auto_87546 ?auto_87551 ) ) ( not ( = ?auto_87546 ?auto_87550 ) ) ( not ( = ?auto_87547 ?auto_87551 ) ) ( not ( = ?auto_87547 ?auto_87550 ) ) ( not ( = ?auto_87551 ?auto_87550 ) ) ( not ( = ?auto_87545 ?auto_87551 ) ) ( not ( = ?auto_87545 ?auto_87552 ) ) ( not ( = ?auto_87545 ?auto_87546 ) ) ( not ( = ?auto_87545 ?auto_87547 ) ) ( not ( = ?auto_87548 ?auto_87551 ) ) ( not ( = ?auto_87548 ?auto_87552 ) ) ( not ( = ?auto_87548 ?auto_87546 ) ) ( not ( = ?auto_87548 ?auto_87547 ) ) ( not ( = ?auto_87549 ?auto_87551 ) ) ( not ( = ?auto_87549 ?auto_87552 ) ) ( not ( = ?auto_87549 ?auto_87546 ) ) ( not ( = ?auto_87549 ?auto_87547 ) ) ( ON ?auto_87550 ?auto_87549 ) ( CLEAR ?auto_87547 ) ( ON ?auto_87551 ?auto_87550 ) ( CLEAR ?auto_87551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87548 ?auto_87545 ?auto_87549 ?auto_87550 )
      ( MAKE-1PILE ?auto_87545 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87553 - BLOCK
    )
    :vars
    (
      ?auto_87555 - BLOCK
      ?auto_87560 - BLOCK
      ?auto_87558 - BLOCK
      ?auto_87557 - BLOCK
      ?auto_87559 - BLOCK
      ?auto_87556 - BLOCK
      ?auto_87554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87553 ?auto_87555 ) ( not ( = ?auto_87553 ?auto_87555 ) ) ( not ( = ?auto_87553 ?auto_87560 ) ) ( not ( = ?auto_87553 ?auto_87558 ) ) ( not ( = ?auto_87555 ?auto_87560 ) ) ( not ( = ?auto_87555 ?auto_87558 ) ) ( not ( = ?auto_87560 ?auto_87558 ) ) ( ON ?auto_87560 ?auto_87553 ) ( ON-TABLE ?auto_87555 ) ( ON-TABLE ?auto_87557 ) ( ON ?auto_87559 ?auto_87557 ) ( not ( = ?auto_87557 ?auto_87559 ) ) ( not ( = ?auto_87557 ?auto_87556 ) ) ( not ( = ?auto_87557 ?auto_87554 ) ) ( not ( = ?auto_87557 ?auto_87558 ) ) ( not ( = ?auto_87559 ?auto_87556 ) ) ( not ( = ?auto_87559 ?auto_87554 ) ) ( not ( = ?auto_87559 ?auto_87558 ) ) ( not ( = ?auto_87556 ?auto_87554 ) ) ( not ( = ?auto_87556 ?auto_87558 ) ) ( not ( = ?auto_87554 ?auto_87558 ) ) ( not ( = ?auto_87553 ?auto_87554 ) ) ( not ( = ?auto_87553 ?auto_87557 ) ) ( not ( = ?auto_87553 ?auto_87559 ) ) ( not ( = ?auto_87553 ?auto_87556 ) ) ( not ( = ?auto_87555 ?auto_87554 ) ) ( not ( = ?auto_87555 ?auto_87557 ) ) ( not ( = ?auto_87555 ?auto_87559 ) ) ( not ( = ?auto_87555 ?auto_87556 ) ) ( not ( = ?auto_87560 ?auto_87554 ) ) ( not ( = ?auto_87560 ?auto_87557 ) ) ( not ( = ?auto_87560 ?auto_87559 ) ) ( not ( = ?auto_87560 ?auto_87556 ) ) ( ON ?auto_87558 ?auto_87560 ) ( ON ?auto_87554 ?auto_87558 ) ( CLEAR ?auto_87554 ) ( HOLDING ?auto_87556 ) ( CLEAR ?auto_87559 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87557 ?auto_87559 ?auto_87556 )
      ( MAKE-1PILE ?auto_87553 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87561 - BLOCK
    )
    :vars
    (
      ?auto_87567 - BLOCK
      ?auto_87566 - BLOCK
      ?auto_87565 - BLOCK
      ?auto_87564 - BLOCK
      ?auto_87568 - BLOCK
      ?auto_87562 - BLOCK
      ?auto_87563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87561 ?auto_87567 ) ( not ( = ?auto_87561 ?auto_87567 ) ) ( not ( = ?auto_87561 ?auto_87566 ) ) ( not ( = ?auto_87561 ?auto_87565 ) ) ( not ( = ?auto_87567 ?auto_87566 ) ) ( not ( = ?auto_87567 ?auto_87565 ) ) ( not ( = ?auto_87566 ?auto_87565 ) ) ( ON ?auto_87566 ?auto_87561 ) ( ON-TABLE ?auto_87567 ) ( ON-TABLE ?auto_87564 ) ( ON ?auto_87568 ?auto_87564 ) ( not ( = ?auto_87564 ?auto_87568 ) ) ( not ( = ?auto_87564 ?auto_87562 ) ) ( not ( = ?auto_87564 ?auto_87563 ) ) ( not ( = ?auto_87564 ?auto_87565 ) ) ( not ( = ?auto_87568 ?auto_87562 ) ) ( not ( = ?auto_87568 ?auto_87563 ) ) ( not ( = ?auto_87568 ?auto_87565 ) ) ( not ( = ?auto_87562 ?auto_87563 ) ) ( not ( = ?auto_87562 ?auto_87565 ) ) ( not ( = ?auto_87563 ?auto_87565 ) ) ( not ( = ?auto_87561 ?auto_87563 ) ) ( not ( = ?auto_87561 ?auto_87564 ) ) ( not ( = ?auto_87561 ?auto_87568 ) ) ( not ( = ?auto_87561 ?auto_87562 ) ) ( not ( = ?auto_87567 ?auto_87563 ) ) ( not ( = ?auto_87567 ?auto_87564 ) ) ( not ( = ?auto_87567 ?auto_87568 ) ) ( not ( = ?auto_87567 ?auto_87562 ) ) ( not ( = ?auto_87566 ?auto_87563 ) ) ( not ( = ?auto_87566 ?auto_87564 ) ) ( not ( = ?auto_87566 ?auto_87568 ) ) ( not ( = ?auto_87566 ?auto_87562 ) ) ( ON ?auto_87565 ?auto_87566 ) ( ON ?auto_87563 ?auto_87565 ) ( CLEAR ?auto_87568 ) ( ON ?auto_87562 ?auto_87563 ) ( CLEAR ?auto_87562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87567 ?auto_87561 ?auto_87566 ?auto_87565 ?auto_87563 )
      ( MAKE-1PILE ?auto_87561 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87569 - BLOCK
    )
    :vars
    (
      ?auto_87574 - BLOCK
      ?auto_87573 - BLOCK
      ?auto_87572 - BLOCK
      ?auto_87570 - BLOCK
      ?auto_87571 - BLOCK
      ?auto_87575 - BLOCK
      ?auto_87576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87569 ?auto_87574 ) ( not ( = ?auto_87569 ?auto_87574 ) ) ( not ( = ?auto_87569 ?auto_87573 ) ) ( not ( = ?auto_87569 ?auto_87572 ) ) ( not ( = ?auto_87574 ?auto_87573 ) ) ( not ( = ?auto_87574 ?auto_87572 ) ) ( not ( = ?auto_87573 ?auto_87572 ) ) ( ON ?auto_87573 ?auto_87569 ) ( ON-TABLE ?auto_87574 ) ( ON-TABLE ?auto_87570 ) ( not ( = ?auto_87570 ?auto_87571 ) ) ( not ( = ?auto_87570 ?auto_87575 ) ) ( not ( = ?auto_87570 ?auto_87576 ) ) ( not ( = ?auto_87570 ?auto_87572 ) ) ( not ( = ?auto_87571 ?auto_87575 ) ) ( not ( = ?auto_87571 ?auto_87576 ) ) ( not ( = ?auto_87571 ?auto_87572 ) ) ( not ( = ?auto_87575 ?auto_87576 ) ) ( not ( = ?auto_87575 ?auto_87572 ) ) ( not ( = ?auto_87576 ?auto_87572 ) ) ( not ( = ?auto_87569 ?auto_87576 ) ) ( not ( = ?auto_87569 ?auto_87570 ) ) ( not ( = ?auto_87569 ?auto_87571 ) ) ( not ( = ?auto_87569 ?auto_87575 ) ) ( not ( = ?auto_87574 ?auto_87576 ) ) ( not ( = ?auto_87574 ?auto_87570 ) ) ( not ( = ?auto_87574 ?auto_87571 ) ) ( not ( = ?auto_87574 ?auto_87575 ) ) ( not ( = ?auto_87573 ?auto_87576 ) ) ( not ( = ?auto_87573 ?auto_87570 ) ) ( not ( = ?auto_87573 ?auto_87571 ) ) ( not ( = ?auto_87573 ?auto_87575 ) ) ( ON ?auto_87572 ?auto_87573 ) ( ON ?auto_87576 ?auto_87572 ) ( ON ?auto_87575 ?auto_87576 ) ( CLEAR ?auto_87575 ) ( HOLDING ?auto_87571 ) ( CLEAR ?auto_87570 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87570 ?auto_87571 )
      ( MAKE-1PILE ?auto_87569 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87577 - BLOCK
    )
    :vars
    (
      ?auto_87578 - BLOCK
      ?auto_87579 - BLOCK
      ?auto_87581 - BLOCK
      ?auto_87584 - BLOCK
      ?auto_87580 - BLOCK
      ?auto_87583 - BLOCK
      ?auto_87582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87577 ?auto_87578 ) ( not ( = ?auto_87577 ?auto_87578 ) ) ( not ( = ?auto_87577 ?auto_87579 ) ) ( not ( = ?auto_87577 ?auto_87581 ) ) ( not ( = ?auto_87578 ?auto_87579 ) ) ( not ( = ?auto_87578 ?auto_87581 ) ) ( not ( = ?auto_87579 ?auto_87581 ) ) ( ON ?auto_87579 ?auto_87577 ) ( ON-TABLE ?auto_87578 ) ( ON-TABLE ?auto_87584 ) ( not ( = ?auto_87584 ?auto_87580 ) ) ( not ( = ?auto_87584 ?auto_87583 ) ) ( not ( = ?auto_87584 ?auto_87582 ) ) ( not ( = ?auto_87584 ?auto_87581 ) ) ( not ( = ?auto_87580 ?auto_87583 ) ) ( not ( = ?auto_87580 ?auto_87582 ) ) ( not ( = ?auto_87580 ?auto_87581 ) ) ( not ( = ?auto_87583 ?auto_87582 ) ) ( not ( = ?auto_87583 ?auto_87581 ) ) ( not ( = ?auto_87582 ?auto_87581 ) ) ( not ( = ?auto_87577 ?auto_87582 ) ) ( not ( = ?auto_87577 ?auto_87584 ) ) ( not ( = ?auto_87577 ?auto_87580 ) ) ( not ( = ?auto_87577 ?auto_87583 ) ) ( not ( = ?auto_87578 ?auto_87582 ) ) ( not ( = ?auto_87578 ?auto_87584 ) ) ( not ( = ?auto_87578 ?auto_87580 ) ) ( not ( = ?auto_87578 ?auto_87583 ) ) ( not ( = ?auto_87579 ?auto_87582 ) ) ( not ( = ?auto_87579 ?auto_87584 ) ) ( not ( = ?auto_87579 ?auto_87580 ) ) ( not ( = ?auto_87579 ?auto_87583 ) ) ( ON ?auto_87581 ?auto_87579 ) ( ON ?auto_87582 ?auto_87581 ) ( ON ?auto_87583 ?auto_87582 ) ( CLEAR ?auto_87584 ) ( ON ?auto_87580 ?auto_87583 ) ( CLEAR ?auto_87580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87578 ?auto_87577 ?auto_87579 ?auto_87581 ?auto_87582 ?auto_87583 )
      ( MAKE-1PILE ?auto_87577 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87585 - BLOCK
    )
    :vars
    (
      ?auto_87590 - BLOCK
      ?auto_87592 - BLOCK
      ?auto_87589 - BLOCK
      ?auto_87591 - BLOCK
      ?auto_87587 - BLOCK
      ?auto_87586 - BLOCK
      ?auto_87588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87585 ?auto_87590 ) ( not ( = ?auto_87585 ?auto_87590 ) ) ( not ( = ?auto_87585 ?auto_87592 ) ) ( not ( = ?auto_87585 ?auto_87589 ) ) ( not ( = ?auto_87590 ?auto_87592 ) ) ( not ( = ?auto_87590 ?auto_87589 ) ) ( not ( = ?auto_87592 ?auto_87589 ) ) ( ON ?auto_87592 ?auto_87585 ) ( ON-TABLE ?auto_87590 ) ( not ( = ?auto_87591 ?auto_87587 ) ) ( not ( = ?auto_87591 ?auto_87586 ) ) ( not ( = ?auto_87591 ?auto_87588 ) ) ( not ( = ?auto_87591 ?auto_87589 ) ) ( not ( = ?auto_87587 ?auto_87586 ) ) ( not ( = ?auto_87587 ?auto_87588 ) ) ( not ( = ?auto_87587 ?auto_87589 ) ) ( not ( = ?auto_87586 ?auto_87588 ) ) ( not ( = ?auto_87586 ?auto_87589 ) ) ( not ( = ?auto_87588 ?auto_87589 ) ) ( not ( = ?auto_87585 ?auto_87588 ) ) ( not ( = ?auto_87585 ?auto_87591 ) ) ( not ( = ?auto_87585 ?auto_87587 ) ) ( not ( = ?auto_87585 ?auto_87586 ) ) ( not ( = ?auto_87590 ?auto_87588 ) ) ( not ( = ?auto_87590 ?auto_87591 ) ) ( not ( = ?auto_87590 ?auto_87587 ) ) ( not ( = ?auto_87590 ?auto_87586 ) ) ( not ( = ?auto_87592 ?auto_87588 ) ) ( not ( = ?auto_87592 ?auto_87591 ) ) ( not ( = ?auto_87592 ?auto_87587 ) ) ( not ( = ?auto_87592 ?auto_87586 ) ) ( ON ?auto_87589 ?auto_87592 ) ( ON ?auto_87588 ?auto_87589 ) ( ON ?auto_87586 ?auto_87588 ) ( ON ?auto_87587 ?auto_87586 ) ( CLEAR ?auto_87587 ) ( HOLDING ?auto_87591 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87591 )
      ( MAKE-1PILE ?auto_87585 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_87593 - BLOCK
    )
    :vars
    (
      ?auto_87600 - BLOCK
      ?auto_87598 - BLOCK
      ?auto_87599 - BLOCK
      ?auto_87594 - BLOCK
      ?auto_87596 - BLOCK
      ?auto_87597 - BLOCK
      ?auto_87595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87593 ?auto_87600 ) ( not ( = ?auto_87593 ?auto_87600 ) ) ( not ( = ?auto_87593 ?auto_87598 ) ) ( not ( = ?auto_87593 ?auto_87599 ) ) ( not ( = ?auto_87600 ?auto_87598 ) ) ( not ( = ?auto_87600 ?auto_87599 ) ) ( not ( = ?auto_87598 ?auto_87599 ) ) ( ON ?auto_87598 ?auto_87593 ) ( ON-TABLE ?auto_87600 ) ( not ( = ?auto_87594 ?auto_87596 ) ) ( not ( = ?auto_87594 ?auto_87597 ) ) ( not ( = ?auto_87594 ?auto_87595 ) ) ( not ( = ?auto_87594 ?auto_87599 ) ) ( not ( = ?auto_87596 ?auto_87597 ) ) ( not ( = ?auto_87596 ?auto_87595 ) ) ( not ( = ?auto_87596 ?auto_87599 ) ) ( not ( = ?auto_87597 ?auto_87595 ) ) ( not ( = ?auto_87597 ?auto_87599 ) ) ( not ( = ?auto_87595 ?auto_87599 ) ) ( not ( = ?auto_87593 ?auto_87595 ) ) ( not ( = ?auto_87593 ?auto_87594 ) ) ( not ( = ?auto_87593 ?auto_87596 ) ) ( not ( = ?auto_87593 ?auto_87597 ) ) ( not ( = ?auto_87600 ?auto_87595 ) ) ( not ( = ?auto_87600 ?auto_87594 ) ) ( not ( = ?auto_87600 ?auto_87596 ) ) ( not ( = ?auto_87600 ?auto_87597 ) ) ( not ( = ?auto_87598 ?auto_87595 ) ) ( not ( = ?auto_87598 ?auto_87594 ) ) ( not ( = ?auto_87598 ?auto_87596 ) ) ( not ( = ?auto_87598 ?auto_87597 ) ) ( ON ?auto_87599 ?auto_87598 ) ( ON ?auto_87595 ?auto_87599 ) ( ON ?auto_87597 ?auto_87595 ) ( ON ?auto_87596 ?auto_87597 ) ( ON ?auto_87594 ?auto_87596 ) ( CLEAR ?auto_87594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87600 ?auto_87593 ?auto_87598 ?auto_87599 ?auto_87595 ?auto_87597 ?auto_87596 )
      ( MAKE-1PILE ?auto_87593 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87612 - BLOCK
      ?auto_87613 - BLOCK
      ?auto_87614 - BLOCK
      ?auto_87615 - BLOCK
      ?auto_87616 - BLOCK
    )
    :vars
    (
      ?auto_87617 - BLOCK
      ?auto_87618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87617 ?auto_87616 ) ( CLEAR ?auto_87617 ) ( ON-TABLE ?auto_87612 ) ( ON ?auto_87613 ?auto_87612 ) ( ON ?auto_87614 ?auto_87613 ) ( ON ?auto_87615 ?auto_87614 ) ( ON ?auto_87616 ?auto_87615 ) ( not ( = ?auto_87612 ?auto_87613 ) ) ( not ( = ?auto_87612 ?auto_87614 ) ) ( not ( = ?auto_87612 ?auto_87615 ) ) ( not ( = ?auto_87612 ?auto_87616 ) ) ( not ( = ?auto_87612 ?auto_87617 ) ) ( not ( = ?auto_87613 ?auto_87614 ) ) ( not ( = ?auto_87613 ?auto_87615 ) ) ( not ( = ?auto_87613 ?auto_87616 ) ) ( not ( = ?auto_87613 ?auto_87617 ) ) ( not ( = ?auto_87614 ?auto_87615 ) ) ( not ( = ?auto_87614 ?auto_87616 ) ) ( not ( = ?auto_87614 ?auto_87617 ) ) ( not ( = ?auto_87615 ?auto_87616 ) ) ( not ( = ?auto_87615 ?auto_87617 ) ) ( not ( = ?auto_87616 ?auto_87617 ) ) ( HOLDING ?auto_87618 ) ( not ( = ?auto_87612 ?auto_87618 ) ) ( not ( = ?auto_87613 ?auto_87618 ) ) ( not ( = ?auto_87614 ?auto_87618 ) ) ( not ( = ?auto_87615 ?auto_87618 ) ) ( not ( = ?auto_87616 ?auto_87618 ) ) ( not ( = ?auto_87617 ?auto_87618 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_87618 )
      ( MAKE-5PILE ?auto_87612 ?auto_87613 ?auto_87614 ?auto_87615 ?auto_87616 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87709 - BLOCK
      ?auto_87710 - BLOCK
    )
    :vars
    (
      ?auto_87711 - BLOCK
      ?auto_87714 - BLOCK
      ?auto_87712 - BLOCK
      ?auto_87715 - BLOCK
      ?auto_87713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87709 ?auto_87710 ) ) ( ON ?auto_87710 ?auto_87711 ) ( not ( = ?auto_87709 ?auto_87711 ) ) ( not ( = ?auto_87710 ?auto_87711 ) ) ( ON ?auto_87709 ?auto_87710 ) ( CLEAR ?auto_87709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87714 ) ( ON ?auto_87712 ?auto_87714 ) ( ON ?auto_87715 ?auto_87712 ) ( ON ?auto_87713 ?auto_87715 ) ( ON ?auto_87711 ?auto_87713 ) ( not ( = ?auto_87714 ?auto_87712 ) ) ( not ( = ?auto_87714 ?auto_87715 ) ) ( not ( = ?auto_87714 ?auto_87713 ) ) ( not ( = ?auto_87714 ?auto_87711 ) ) ( not ( = ?auto_87714 ?auto_87710 ) ) ( not ( = ?auto_87714 ?auto_87709 ) ) ( not ( = ?auto_87712 ?auto_87715 ) ) ( not ( = ?auto_87712 ?auto_87713 ) ) ( not ( = ?auto_87712 ?auto_87711 ) ) ( not ( = ?auto_87712 ?auto_87710 ) ) ( not ( = ?auto_87712 ?auto_87709 ) ) ( not ( = ?auto_87715 ?auto_87713 ) ) ( not ( = ?auto_87715 ?auto_87711 ) ) ( not ( = ?auto_87715 ?auto_87710 ) ) ( not ( = ?auto_87715 ?auto_87709 ) ) ( not ( = ?auto_87713 ?auto_87711 ) ) ( not ( = ?auto_87713 ?auto_87710 ) ) ( not ( = ?auto_87713 ?auto_87709 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87714 ?auto_87712 ?auto_87715 ?auto_87713 ?auto_87711 ?auto_87710 )
      ( MAKE-2PILE ?auto_87709 ?auto_87710 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87718 - BLOCK
      ?auto_87719 - BLOCK
    )
    :vars
    (
      ?auto_87720 - BLOCK
      ?auto_87721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87718 ?auto_87719 ) ) ( ON ?auto_87719 ?auto_87720 ) ( CLEAR ?auto_87719 ) ( not ( = ?auto_87718 ?auto_87720 ) ) ( not ( = ?auto_87719 ?auto_87720 ) ) ( ON ?auto_87718 ?auto_87721 ) ( CLEAR ?auto_87718 ) ( HAND-EMPTY ) ( not ( = ?auto_87718 ?auto_87721 ) ) ( not ( = ?auto_87719 ?auto_87721 ) ) ( not ( = ?auto_87720 ?auto_87721 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87718 ?auto_87721 )
      ( MAKE-2PILE ?auto_87718 ?auto_87719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87722 - BLOCK
      ?auto_87723 - BLOCK
    )
    :vars
    (
      ?auto_87725 - BLOCK
      ?auto_87724 - BLOCK
      ?auto_87729 - BLOCK
      ?auto_87727 - BLOCK
      ?auto_87728 - BLOCK
      ?auto_87726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87722 ?auto_87723 ) ) ( not ( = ?auto_87722 ?auto_87725 ) ) ( not ( = ?auto_87723 ?auto_87725 ) ) ( ON ?auto_87722 ?auto_87724 ) ( CLEAR ?auto_87722 ) ( not ( = ?auto_87722 ?auto_87724 ) ) ( not ( = ?auto_87723 ?auto_87724 ) ) ( not ( = ?auto_87725 ?auto_87724 ) ) ( HOLDING ?auto_87723 ) ( CLEAR ?auto_87725 ) ( ON-TABLE ?auto_87729 ) ( ON ?auto_87727 ?auto_87729 ) ( ON ?auto_87728 ?auto_87727 ) ( ON ?auto_87726 ?auto_87728 ) ( ON ?auto_87725 ?auto_87726 ) ( not ( = ?auto_87729 ?auto_87727 ) ) ( not ( = ?auto_87729 ?auto_87728 ) ) ( not ( = ?auto_87729 ?auto_87726 ) ) ( not ( = ?auto_87729 ?auto_87725 ) ) ( not ( = ?auto_87729 ?auto_87723 ) ) ( not ( = ?auto_87727 ?auto_87728 ) ) ( not ( = ?auto_87727 ?auto_87726 ) ) ( not ( = ?auto_87727 ?auto_87725 ) ) ( not ( = ?auto_87727 ?auto_87723 ) ) ( not ( = ?auto_87728 ?auto_87726 ) ) ( not ( = ?auto_87728 ?auto_87725 ) ) ( not ( = ?auto_87728 ?auto_87723 ) ) ( not ( = ?auto_87726 ?auto_87725 ) ) ( not ( = ?auto_87726 ?auto_87723 ) ) ( not ( = ?auto_87722 ?auto_87729 ) ) ( not ( = ?auto_87722 ?auto_87727 ) ) ( not ( = ?auto_87722 ?auto_87728 ) ) ( not ( = ?auto_87722 ?auto_87726 ) ) ( not ( = ?auto_87724 ?auto_87729 ) ) ( not ( = ?auto_87724 ?auto_87727 ) ) ( not ( = ?auto_87724 ?auto_87728 ) ) ( not ( = ?auto_87724 ?auto_87726 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87729 ?auto_87727 ?auto_87728 ?auto_87726 ?auto_87725 ?auto_87723 )
      ( MAKE-2PILE ?auto_87722 ?auto_87723 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87730 - BLOCK
      ?auto_87731 - BLOCK
    )
    :vars
    (
      ?auto_87733 - BLOCK
      ?auto_87732 - BLOCK
      ?auto_87734 - BLOCK
      ?auto_87737 - BLOCK
      ?auto_87735 - BLOCK
      ?auto_87736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87730 ?auto_87731 ) ) ( not ( = ?auto_87730 ?auto_87733 ) ) ( not ( = ?auto_87731 ?auto_87733 ) ) ( ON ?auto_87730 ?auto_87732 ) ( not ( = ?auto_87730 ?auto_87732 ) ) ( not ( = ?auto_87731 ?auto_87732 ) ) ( not ( = ?auto_87733 ?auto_87732 ) ) ( CLEAR ?auto_87733 ) ( ON-TABLE ?auto_87734 ) ( ON ?auto_87737 ?auto_87734 ) ( ON ?auto_87735 ?auto_87737 ) ( ON ?auto_87736 ?auto_87735 ) ( ON ?auto_87733 ?auto_87736 ) ( not ( = ?auto_87734 ?auto_87737 ) ) ( not ( = ?auto_87734 ?auto_87735 ) ) ( not ( = ?auto_87734 ?auto_87736 ) ) ( not ( = ?auto_87734 ?auto_87733 ) ) ( not ( = ?auto_87734 ?auto_87731 ) ) ( not ( = ?auto_87737 ?auto_87735 ) ) ( not ( = ?auto_87737 ?auto_87736 ) ) ( not ( = ?auto_87737 ?auto_87733 ) ) ( not ( = ?auto_87737 ?auto_87731 ) ) ( not ( = ?auto_87735 ?auto_87736 ) ) ( not ( = ?auto_87735 ?auto_87733 ) ) ( not ( = ?auto_87735 ?auto_87731 ) ) ( not ( = ?auto_87736 ?auto_87733 ) ) ( not ( = ?auto_87736 ?auto_87731 ) ) ( not ( = ?auto_87730 ?auto_87734 ) ) ( not ( = ?auto_87730 ?auto_87737 ) ) ( not ( = ?auto_87730 ?auto_87735 ) ) ( not ( = ?auto_87730 ?auto_87736 ) ) ( not ( = ?auto_87732 ?auto_87734 ) ) ( not ( = ?auto_87732 ?auto_87737 ) ) ( not ( = ?auto_87732 ?auto_87735 ) ) ( not ( = ?auto_87732 ?auto_87736 ) ) ( ON ?auto_87731 ?auto_87730 ) ( CLEAR ?auto_87731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87732 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87732 ?auto_87730 )
      ( MAKE-2PILE ?auto_87730 ?auto_87731 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87738 - BLOCK
      ?auto_87739 - BLOCK
    )
    :vars
    (
      ?auto_87743 - BLOCK
      ?auto_87742 - BLOCK
      ?auto_87741 - BLOCK
      ?auto_87745 - BLOCK
      ?auto_87744 - BLOCK
      ?auto_87740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87738 ?auto_87739 ) ) ( not ( = ?auto_87738 ?auto_87743 ) ) ( not ( = ?auto_87739 ?auto_87743 ) ) ( ON ?auto_87738 ?auto_87742 ) ( not ( = ?auto_87738 ?auto_87742 ) ) ( not ( = ?auto_87739 ?auto_87742 ) ) ( not ( = ?auto_87743 ?auto_87742 ) ) ( ON-TABLE ?auto_87741 ) ( ON ?auto_87745 ?auto_87741 ) ( ON ?auto_87744 ?auto_87745 ) ( ON ?auto_87740 ?auto_87744 ) ( not ( = ?auto_87741 ?auto_87745 ) ) ( not ( = ?auto_87741 ?auto_87744 ) ) ( not ( = ?auto_87741 ?auto_87740 ) ) ( not ( = ?auto_87741 ?auto_87743 ) ) ( not ( = ?auto_87741 ?auto_87739 ) ) ( not ( = ?auto_87745 ?auto_87744 ) ) ( not ( = ?auto_87745 ?auto_87740 ) ) ( not ( = ?auto_87745 ?auto_87743 ) ) ( not ( = ?auto_87745 ?auto_87739 ) ) ( not ( = ?auto_87744 ?auto_87740 ) ) ( not ( = ?auto_87744 ?auto_87743 ) ) ( not ( = ?auto_87744 ?auto_87739 ) ) ( not ( = ?auto_87740 ?auto_87743 ) ) ( not ( = ?auto_87740 ?auto_87739 ) ) ( not ( = ?auto_87738 ?auto_87741 ) ) ( not ( = ?auto_87738 ?auto_87745 ) ) ( not ( = ?auto_87738 ?auto_87744 ) ) ( not ( = ?auto_87738 ?auto_87740 ) ) ( not ( = ?auto_87742 ?auto_87741 ) ) ( not ( = ?auto_87742 ?auto_87745 ) ) ( not ( = ?auto_87742 ?auto_87744 ) ) ( not ( = ?auto_87742 ?auto_87740 ) ) ( ON ?auto_87739 ?auto_87738 ) ( CLEAR ?auto_87739 ) ( ON-TABLE ?auto_87742 ) ( HOLDING ?auto_87743 ) ( CLEAR ?auto_87740 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87741 ?auto_87745 ?auto_87744 ?auto_87740 ?auto_87743 )
      ( MAKE-2PILE ?auto_87738 ?auto_87739 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87746 - BLOCK
      ?auto_87747 - BLOCK
    )
    :vars
    (
      ?auto_87751 - BLOCK
      ?auto_87749 - BLOCK
      ?auto_87748 - BLOCK
      ?auto_87752 - BLOCK
      ?auto_87753 - BLOCK
      ?auto_87750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87746 ?auto_87747 ) ) ( not ( = ?auto_87746 ?auto_87751 ) ) ( not ( = ?auto_87747 ?auto_87751 ) ) ( ON ?auto_87746 ?auto_87749 ) ( not ( = ?auto_87746 ?auto_87749 ) ) ( not ( = ?auto_87747 ?auto_87749 ) ) ( not ( = ?auto_87751 ?auto_87749 ) ) ( ON-TABLE ?auto_87748 ) ( ON ?auto_87752 ?auto_87748 ) ( ON ?auto_87753 ?auto_87752 ) ( ON ?auto_87750 ?auto_87753 ) ( not ( = ?auto_87748 ?auto_87752 ) ) ( not ( = ?auto_87748 ?auto_87753 ) ) ( not ( = ?auto_87748 ?auto_87750 ) ) ( not ( = ?auto_87748 ?auto_87751 ) ) ( not ( = ?auto_87748 ?auto_87747 ) ) ( not ( = ?auto_87752 ?auto_87753 ) ) ( not ( = ?auto_87752 ?auto_87750 ) ) ( not ( = ?auto_87752 ?auto_87751 ) ) ( not ( = ?auto_87752 ?auto_87747 ) ) ( not ( = ?auto_87753 ?auto_87750 ) ) ( not ( = ?auto_87753 ?auto_87751 ) ) ( not ( = ?auto_87753 ?auto_87747 ) ) ( not ( = ?auto_87750 ?auto_87751 ) ) ( not ( = ?auto_87750 ?auto_87747 ) ) ( not ( = ?auto_87746 ?auto_87748 ) ) ( not ( = ?auto_87746 ?auto_87752 ) ) ( not ( = ?auto_87746 ?auto_87753 ) ) ( not ( = ?auto_87746 ?auto_87750 ) ) ( not ( = ?auto_87749 ?auto_87748 ) ) ( not ( = ?auto_87749 ?auto_87752 ) ) ( not ( = ?auto_87749 ?auto_87753 ) ) ( not ( = ?auto_87749 ?auto_87750 ) ) ( ON ?auto_87747 ?auto_87746 ) ( ON-TABLE ?auto_87749 ) ( CLEAR ?auto_87750 ) ( ON ?auto_87751 ?auto_87747 ) ( CLEAR ?auto_87751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87749 ?auto_87746 ?auto_87747 )
      ( MAKE-2PILE ?auto_87746 ?auto_87747 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87754 - BLOCK
      ?auto_87755 - BLOCK
    )
    :vars
    (
      ?auto_87759 - BLOCK
      ?auto_87761 - BLOCK
      ?auto_87758 - BLOCK
      ?auto_87760 - BLOCK
      ?auto_87757 - BLOCK
      ?auto_87756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87754 ?auto_87755 ) ) ( not ( = ?auto_87754 ?auto_87759 ) ) ( not ( = ?auto_87755 ?auto_87759 ) ) ( ON ?auto_87754 ?auto_87761 ) ( not ( = ?auto_87754 ?auto_87761 ) ) ( not ( = ?auto_87755 ?auto_87761 ) ) ( not ( = ?auto_87759 ?auto_87761 ) ) ( ON-TABLE ?auto_87758 ) ( ON ?auto_87760 ?auto_87758 ) ( ON ?auto_87757 ?auto_87760 ) ( not ( = ?auto_87758 ?auto_87760 ) ) ( not ( = ?auto_87758 ?auto_87757 ) ) ( not ( = ?auto_87758 ?auto_87756 ) ) ( not ( = ?auto_87758 ?auto_87759 ) ) ( not ( = ?auto_87758 ?auto_87755 ) ) ( not ( = ?auto_87760 ?auto_87757 ) ) ( not ( = ?auto_87760 ?auto_87756 ) ) ( not ( = ?auto_87760 ?auto_87759 ) ) ( not ( = ?auto_87760 ?auto_87755 ) ) ( not ( = ?auto_87757 ?auto_87756 ) ) ( not ( = ?auto_87757 ?auto_87759 ) ) ( not ( = ?auto_87757 ?auto_87755 ) ) ( not ( = ?auto_87756 ?auto_87759 ) ) ( not ( = ?auto_87756 ?auto_87755 ) ) ( not ( = ?auto_87754 ?auto_87758 ) ) ( not ( = ?auto_87754 ?auto_87760 ) ) ( not ( = ?auto_87754 ?auto_87757 ) ) ( not ( = ?auto_87754 ?auto_87756 ) ) ( not ( = ?auto_87761 ?auto_87758 ) ) ( not ( = ?auto_87761 ?auto_87760 ) ) ( not ( = ?auto_87761 ?auto_87757 ) ) ( not ( = ?auto_87761 ?auto_87756 ) ) ( ON ?auto_87755 ?auto_87754 ) ( ON-TABLE ?auto_87761 ) ( ON ?auto_87759 ?auto_87755 ) ( CLEAR ?auto_87759 ) ( HOLDING ?auto_87756 ) ( CLEAR ?auto_87757 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87758 ?auto_87760 ?auto_87757 ?auto_87756 )
      ( MAKE-2PILE ?auto_87754 ?auto_87755 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87762 - BLOCK
      ?auto_87763 - BLOCK
    )
    :vars
    (
      ?auto_87767 - BLOCK
      ?auto_87765 - BLOCK
      ?auto_87768 - BLOCK
      ?auto_87766 - BLOCK
      ?auto_87764 - BLOCK
      ?auto_87769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87762 ?auto_87763 ) ) ( not ( = ?auto_87762 ?auto_87767 ) ) ( not ( = ?auto_87763 ?auto_87767 ) ) ( ON ?auto_87762 ?auto_87765 ) ( not ( = ?auto_87762 ?auto_87765 ) ) ( not ( = ?auto_87763 ?auto_87765 ) ) ( not ( = ?auto_87767 ?auto_87765 ) ) ( ON-TABLE ?auto_87768 ) ( ON ?auto_87766 ?auto_87768 ) ( ON ?auto_87764 ?auto_87766 ) ( not ( = ?auto_87768 ?auto_87766 ) ) ( not ( = ?auto_87768 ?auto_87764 ) ) ( not ( = ?auto_87768 ?auto_87769 ) ) ( not ( = ?auto_87768 ?auto_87767 ) ) ( not ( = ?auto_87768 ?auto_87763 ) ) ( not ( = ?auto_87766 ?auto_87764 ) ) ( not ( = ?auto_87766 ?auto_87769 ) ) ( not ( = ?auto_87766 ?auto_87767 ) ) ( not ( = ?auto_87766 ?auto_87763 ) ) ( not ( = ?auto_87764 ?auto_87769 ) ) ( not ( = ?auto_87764 ?auto_87767 ) ) ( not ( = ?auto_87764 ?auto_87763 ) ) ( not ( = ?auto_87769 ?auto_87767 ) ) ( not ( = ?auto_87769 ?auto_87763 ) ) ( not ( = ?auto_87762 ?auto_87768 ) ) ( not ( = ?auto_87762 ?auto_87766 ) ) ( not ( = ?auto_87762 ?auto_87764 ) ) ( not ( = ?auto_87762 ?auto_87769 ) ) ( not ( = ?auto_87765 ?auto_87768 ) ) ( not ( = ?auto_87765 ?auto_87766 ) ) ( not ( = ?auto_87765 ?auto_87764 ) ) ( not ( = ?auto_87765 ?auto_87769 ) ) ( ON ?auto_87763 ?auto_87762 ) ( ON-TABLE ?auto_87765 ) ( ON ?auto_87767 ?auto_87763 ) ( CLEAR ?auto_87764 ) ( ON ?auto_87769 ?auto_87767 ) ( CLEAR ?auto_87769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87765 ?auto_87762 ?auto_87763 ?auto_87767 )
      ( MAKE-2PILE ?auto_87762 ?auto_87763 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87770 - BLOCK
      ?auto_87771 - BLOCK
    )
    :vars
    (
      ?auto_87773 - BLOCK
      ?auto_87774 - BLOCK
      ?auto_87775 - BLOCK
      ?auto_87776 - BLOCK
      ?auto_87772 - BLOCK
      ?auto_87777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87770 ?auto_87771 ) ) ( not ( = ?auto_87770 ?auto_87773 ) ) ( not ( = ?auto_87771 ?auto_87773 ) ) ( ON ?auto_87770 ?auto_87774 ) ( not ( = ?auto_87770 ?auto_87774 ) ) ( not ( = ?auto_87771 ?auto_87774 ) ) ( not ( = ?auto_87773 ?auto_87774 ) ) ( ON-TABLE ?auto_87775 ) ( ON ?auto_87776 ?auto_87775 ) ( not ( = ?auto_87775 ?auto_87776 ) ) ( not ( = ?auto_87775 ?auto_87772 ) ) ( not ( = ?auto_87775 ?auto_87777 ) ) ( not ( = ?auto_87775 ?auto_87773 ) ) ( not ( = ?auto_87775 ?auto_87771 ) ) ( not ( = ?auto_87776 ?auto_87772 ) ) ( not ( = ?auto_87776 ?auto_87777 ) ) ( not ( = ?auto_87776 ?auto_87773 ) ) ( not ( = ?auto_87776 ?auto_87771 ) ) ( not ( = ?auto_87772 ?auto_87777 ) ) ( not ( = ?auto_87772 ?auto_87773 ) ) ( not ( = ?auto_87772 ?auto_87771 ) ) ( not ( = ?auto_87777 ?auto_87773 ) ) ( not ( = ?auto_87777 ?auto_87771 ) ) ( not ( = ?auto_87770 ?auto_87775 ) ) ( not ( = ?auto_87770 ?auto_87776 ) ) ( not ( = ?auto_87770 ?auto_87772 ) ) ( not ( = ?auto_87770 ?auto_87777 ) ) ( not ( = ?auto_87774 ?auto_87775 ) ) ( not ( = ?auto_87774 ?auto_87776 ) ) ( not ( = ?auto_87774 ?auto_87772 ) ) ( not ( = ?auto_87774 ?auto_87777 ) ) ( ON ?auto_87771 ?auto_87770 ) ( ON-TABLE ?auto_87774 ) ( ON ?auto_87773 ?auto_87771 ) ( ON ?auto_87777 ?auto_87773 ) ( CLEAR ?auto_87777 ) ( HOLDING ?auto_87772 ) ( CLEAR ?auto_87776 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87775 ?auto_87776 ?auto_87772 )
      ( MAKE-2PILE ?auto_87770 ?auto_87771 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87778 - BLOCK
      ?auto_87779 - BLOCK
    )
    :vars
    (
      ?auto_87780 - BLOCK
      ?auto_87784 - BLOCK
      ?auto_87783 - BLOCK
      ?auto_87782 - BLOCK
      ?auto_87781 - BLOCK
      ?auto_87785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87778 ?auto_87779 ) ) ( not ( = ?auto_87778 ?auto_87780 ) ) ( not ( = ?auto_87779 ?auto_87780 ) ) ( ON ?auto_87778 ?auto_87784 ) ( not ( = ?auto_87778 ?auto_87784 ) ) ( not ( = ?auto_87779 ?auto_87784 ) ) ( not ( = ?auto_87780 ?auto_87784 ) ) ( ON-TABLE ?auto_87783 ) ( ON ?auto_87782 ?auto_87783 ) ( not ( = ?auto_87783 ?auto_87782 ) ) ( not ( = ?auto_87783 ?auto_87781 ) ) ( not ( = ?auto_87783 ?auto_87785 ) ) ( not ( = ?auto_87783 ?auto_87780 ) ) ( not ( = ?auto_87783 ?auto_87779 ) ) ( not ( = ?auto_87782 ?auto_87781 ) ) ( not ( = ?auto_87782 ?auto_87785 ) ) ( not ( = ?auto_87782 ?auto_87780 ) ) ( not ( = ?auto_87782 ?auto_87779 ) ) ( not ( = ?auto_87781 ?auto_87785 ) ) ( not ( = ?auto_87781 ?auto_87780 ) ) ( not ( = ?auto_87781 ?auto_87779 ) ) ( not ( = ?auto_87785 ?auto_87780 ) ) ( not ( = ?auto_87785 ?auto_87779 ) ) ( not ( = ?auto_87778 ?auto_87783 ) ) ( not ( = ?auto_87778 ?auto_87782 ) ) ( not ( = ?auto_87778 ?auto_87781 ) ) ( not ( = ?auto_87778 ?auto_87785 ) ) ( not ( = ?auto_87784 ?auto_87783 ) ) ( not ( = ?auto_87784 ?auto_87782 ) ) ( not ( = ?auto_87784 ?auto_87781 ) ) ( not ( = ?auto_87784 ?auto_87785 ) ) ( ON ?auto_87779 ?auto_87778 ) ( ON-TABLE ?auto_87784 ) ( ON ?auto_87780 ?auto_87779 ) ( ON ?auto_87785 ?auto_87780 ) ( CLEAR ?auto_87782 ) ( ON ?auto_87781 ?auto_87785 ) ( CLEAR ?auto_87781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87784 ?auto_87778 ?auto_87779 ?auto_87780 ?auto_87785 )
      ( MAKE-2PILE ?auto_87778 ?auto_87779 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87786 - BLOCK
      ?auto_87787 - BLOCK
    )
    :vars
    (
      ?auto_87790 - BLOCK
      ?auto_87793 - BLOCK
      ?auto_87792 - BLOCK
      ?auto_87789 - BLOCK
      ?auto_87791 - BLOCK
      ?auto_87788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87786 ?auto_87787 ) ) ( not ( = ?auto_87786 ?auto_87790 ) ) ( not ( = ?auto_87787 ?auto_87790 ) ) ( ON ?auto_87786 ?auto_87793 ) ( not ( = ?auto_87786 ?auto_87793 ) ) ( not ( = ?auto_87787 ?auto_87793 ) ) ( not ( = ?auto_87790 ?auto_87793 ) ) ( ON-TABLE ?auto_87792 ) ( not ( = ?auto_87792 ?auto_87789 ) ) ( not ( = ?auto_87792 ?auto_87791 ) ) ( not ( = ?auto_87792 ?auto_87788 ) ) ( not ( = ?auto_87792 ?auto_87790 ) ) ( not ( = ?auto_87792 ?auto_87787 ) ) ( not ( = ?auto_87789 ?auto_87791 ) ) ( not ( = ?auto_87789 ?auto_87788 ) ) ( not ( = ?auto_87789 ?auto_87790 ) ) ( not ( = ?auto_87789 ?auto_87787 ) ) ( not ( = ?auto_87791 ?auto_87788 ) ) ( not ( = ?auto_87791 ?auto_87790 ) ) ( not ( = ?auto_87791 ?auto_87787 ) ) ( not ( = ?auto_87788 ?auto_87790 ) ) ( not ( = ?auto_87788 ?auto_87787 ) ) ( not ( = ?auto_87786 ?auto_87792 ) ) ( not ( = ?auto_87786 ?auto_87789 ) ) ( not ( = ?auto_87786 ?auto_87791 ) ) ( not ( = ?auto_87786 ?auto_87788 ) ) ( not ( = ?auto_87793 ?auto_87792 ) ) ( not ( = ?auto_87793 ?auto_87789 ) ) ( not ( = ?auto_87793 ?auto_87791 ) ) ( not ( = ?auto_87793 ?auto_87788 ) ) ( ON ?auto_87787 ?auto_87786 ) ( ON-TABLE ?auto_87793 ) ( ON ?auto_87790 ?auto_87787 ) ( ON ?auto_87788 ?auto_87790 ) ( ON ?auto_87791 ?auto_87788 ) ( CLEAR ?auto_87791 ) ( HOLDING ?auto_87789 ) ( CLEAR ?auto_87792 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87792 ?auto_87789 )
      ( MAKE-2PILE ?auto_87786 ?auto_87787 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87794 - BLOCK
      ?auto_87795 - BLOCK
    )
    :vars
    (
      ?auto_87801 - BLOCK
      ?auto_87798 - BLOCK
      ?auto_87797 - BLOCK
      ?auto_87800 - BLOCK
      ?auto_87799 - BLOCK
      ?auto_87796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87794 ?auto_87795 ) ) ( not ( = ?auto_87794 ?auto_87801 ) ) ( not ( = ?auto_87795 ?auto_87801 ) ) ( ON ?auto_87794 ?auto_87798 ) ( not ( = ?auto_87794 ?auto_87798 ) ) ( not ( = ?auto_87795 ?auto_87798 ) ) ( not ( = ?auto_87801 ?auto_87798 ) ) ( ON-TABLE ?auto_87797 ) ( not ( = ?auto_87797 ?auto_87800 ) ) ( not ( = ?auto_87797 ?auto_87799 ) ) ( not ( = ?auto_87797 ?auto_87796 ) ) ( not ( = ?auto_87797 ?auto_87801 ) ) ( not ( = ?auto_87797 ?auto_87795 ) ) ( not ( = ?auto_87800 ?auto_87799 ) ) ( not ( = ?auto_87800 ?auto_87796 ) ) ( not ( = ?auto_87800 ?auto_87801 ) ) ( not ( = ?auto_87800 ?auto_87795 ) ) ( not ( = ?auto_87799 ?auto_87796 ) ) ( not ( = ?auto_87799 ?auto_87801 ) ) ( not ( = ?auto_87799 ?auto_87795 ) ) ( not ( = ?auto_87796 ?auto_87801 ) ) ( not ( = ?auto_87796 ?auto_87795 ) ) ( not ( = ?auto_87794 ?auto_87797 ) ) ( not ( = ?auto_87794 ?auto_87800 ) ) ( not ( = ?auto_87794 ?auto_87799 ) ) ( not ( = ?auto_87794 ?auto_87796 ) ) ( not ( = ?auto_87798 ?auto_87797 ) ) ( not ( = ?auto_87798 ?auto_87800 ) ) ( not ( = ?auto_87798 ?auto_87799 ) ) ( not ( = ?auto_87798 ?auto_87796 ) ) ( ON ?auto_87795 ?auto_87794 ) ( ON-TABLE ?auto_87798 ) ( ON ?auto_87801 ?auto_87795 ) ( ON ?auto_87796 ?auto_87801 ) ( ON ?auto_87799 ?auto_87796 ) ( CLEAR ?auto_87797 ) ( ON ?auto_87800 ?auto_87799 ) ( CLEAR ?auto_87800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87798 ?auto_87794 ?auto_87795 ?auto_87801 ?auto_87796 ?auto_87799 )
      ( MAKE-2PILE ?auto_87794 ?auto_87795 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87802 - BLOCK
      ?auto_87803 - BLOCK
    )
    :vars
    (
      ?auto_87808 - BLOCK
      ?auto_87805 - BLOCK
      ?auto_87804 - BLOCK
      ?auto_87806 - BLOCK
      ?auto_87809 - BLOCK
      ?auto_87807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87802 ?auto_87803 ) ) ( not ( = ?auto_87802 ?auto_87808 ) ) ( not ( = ?auto_87803 ?auto_87808 ) ) ( ON ?auto_87802 ?auto_87805 ) ( not ( = ?auto_87802 ?auto_87805 ) ) ( not ( = ?auto_87803 ?auto_87805 ) ) ( not ( = ?auto_87808 ?auto_87805 ) ) ( not ( = ?auto_87804 ?auto_87806 ) ) ( not ( = ?auto_87804 ?auto_87809 ) ) ( not ( = ?auto_87804 ?auto_87807 ) ) ( not ( = ?auto_87804 ?auto_87808 ) ) ( not ( = ?auto_87804 ?auto_87803 ) ) ( not ( = ?auto_87806 ?auto_87809 ) ) ( not ( = ?auto_87806 ?auto_87807 ) ) ( not ( = ?auto_87806 ?auto_87808 ) ) ( not ( = ?auto_87806 ?auto_87803 ) ) ( not ( = ?auto_87809 ?auto_87807 ) ) ( not ( = ?auto_87809 ?auto_87808 ) ) ( not ( = ?auto_87809 ?auto_87803 ) ) ( not ( = ?auto_87807 ?auto_87808 ) ) ( not ( = ?auto_87807 ?auto_87803 ) ) ( not ( = ?auto_87802 ?auto_87804 ) ) ( not ( = ?auto_87802 ?auto_87806 ) ) ( not ( = ?auto_87802 ?auto_87809 ) ) ( not ( = ?auto_87802 ?auto_87807 ) ) ( not ( = ?auto_87805 ?auto_87804 ) ) ( not ( = ?auto_87805 ?auto_87806 ) ) ( not ( = ?auto_87805 ?auto_87809 ) ) ( not ( = ?auto_87805 ?auto_87807 ) ) ( ON ?auto_87803 ?auto_87802 ) ( ON-TABLE ?auto_87805 ) ( ON ?auto_87808 ?auto_87803 ) ( ON ?auto_87807 ?auto_87808 ) ( ON ?auto_87809 ?auto_87807 ) ( ON ?auto_87806 ?auto_87809 ) ( CLEAR ?auto_87806 ) ( HOLDING ?auto_87804 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87804 )
      ( MAKE-2PILE ?auto_87802 ?auto_87803 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_87810 - BLOCK
      ?auto_87811 - BLOCK
    )
    :vars
    (
      ?auto_87814 - BLOCK
      ?auto_87817 - BLOCK
      ?auto_87816 - BLOCK
      ?auto_87812 - BLOCK
      ?auto_87813 - BLOCK
      ?auto_87815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87810 ?auto_87811 ) ) ( not ( = ?auto_87810 ?auto_87814 ) ) ( not ( = ?auto_87811 ?auto_87814 ) ) ( ON ?auto_87810 ?auto_87817 ) ( not ( = ?auto_87810 ?auto_87817 ) ) ( not ( = ?auto_87811 ?auto_87817 ) ) ( not ( = ?auto_87814 ?auto_87817 ) ) ( not ( = ?auto_87816 ?auto_87812 ) ) ( not ( = ?auto_87816 ?auto_87813 ) ) ( not ( = ?auto_87816 ?auto_87815 ) ) ( not ( = ?auto_87816 ?auto_87814 ) ) ( not ( = ?auto_87816 ?auto_87811 ) ) ( not ( = ?auto_87812 ?auto_87813 ) ) ( not ( = ?auto_87812 ?auto_87815 ) ) ( not ( = ?auto_87812 ?auto_87814 ) ) ( not ( = ?auto_87812 ?auto_87811 ) ) ( not ( = ?auto_87813 ?auto_87815 ) ) ( not ( = ?auto_87813 ?auto_87814 ) ) ( not ( = ?auto_87813 ?auto_87811 ) ) ( not ( = ?auto_87815 ?auto_87814 ) ) ( not ( = ?auto_87815 ?auto_87811 ) ) ( not ( = ?auto_87810 ?auto_87816 ) ) ( not ( = ?auto_87810 ?auto_87812 ) ) ( not ( = ?auto_87810 ?auto_87813 ) ) ( not ( = ?auto_87810 ?auto_87815 ) ) ( not ( = ?auto_87817 ?auto_87816 ) ) ( not ( = ?auto_87817 ?auto_87812 ) ) ( not ( = ?auto_87817 ?auto_87813 ) ) ( not ( = ?auto_87817 ?auto_87815 ) ) ( ON ?auto_87811 ?auto_87810 ) ( ON-TABLE ?auto_87817 ) ( ON ?auto_87814 ?auto_87811 ) ( ON ?auto_87815 ?auto_87814 ) ( ON ?auto_87813 ?auto_87815 ) ( ON ?auto_87812 ?auto_87813 ) ( ON ?auto_87816 ?auto_87812 ) ( CLEAR ?auto_87816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87817 ?auto_87810 ?auto_87811 ?auto_87814 ?auto_87815 ?auto_87813 ?auto_87812 )
      ( MAKE-2PILE ?auto_87810 ?auto_87811 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_87841 - BLOCK
      ?auto_87842 - BLOCK
      ?auto_87843 - BLOCK
      ?auto_87844 - BLOCK
    )
    :vars
    (
      ?auto_87847 - BLOCK
      ?auto_87845 - BLOCK
      ?auto_87846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87847 ?auto_87844 ) ( ON-TABLE ?auto_87841 ) ( ON ?auto_87842 ?auto_87841 ) ( ON ?auto_87843 ?auto_87842 ) ( ON ?auto_87844 ?auto_87843 ) ( not ( = ?auto_87841 ?auto_87842 ) ) ( not ( = ?auto_87841 ?auto_87843 ) ) ( not ( = ?auto_87841 ?auto_87844 ) ) ( not ( = ?auto_87841 ?auto_87847 ) ) ( not ( = ?auto_87842 ?auto_87843 ) ) ( not ( = ?auto_87842 ?auto_87844 ) ) ( not ( = ?auto_87842 ?auto_87847 ) ) ( not ( = ?auto_87843 ?auto_87844 ) ) ( not ( = ?auto_87843 ?auto_87847 ) ) ( not ( = ?auto_87844 ?auto_87847 ) ) ( not ( = ?auto_87841 ?auto_87845 ) ) ( not ( = ?auto_87841 ?auto_87846 ) ) ( not ( = ?auto_87842 ?auto_87845 ) ) ( not ( = ?auto_87842 ?auto_87846 ) ) ( not ( = ?auto_87843 ?auto_87845 ) ) ( not ( = ?auto_87843 ?auto_87846 ) ) ( not ( = ?auto_87844 ?auto_87845 ) ) ( not ( = ?auto_87844 ?auto_87846 ) ) ( not ( = ?auto_87847 ?auto_87845 ) ) ( not ( = ?auto_87847 ?auto_87846 ) ) ( not ( = ?auto_87845 ?auto_87846 ) ) ( ON ?auto_87845 ?auto_87847 ) ( CLEAR ?auto_87845 ) ( HOLDING ?auto_87846 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87846 )
      ( MAKE-4PILE ?auto_87841 ?auto_87842 ?auto_87843 ?auto_87844 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87928 - BLOCK
      ?auto_87929 - BLOCK
      ?auto_87930 - BLOCK
    )
    :vars
    (
      ?auto_87931 - BLOCK
      ?auto_87932 - BLOCK
      ?auto_87933 - BLOCK
      ?auto_87934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_87928 ) ( not ( = ?auto_87928 ?auto_87929 ) ) ( not ( = ?auto_87928 ?auto_87930 ) ) ( not ( = ?auto_87929 ?auto_87930 ) ) ( ON ?auto_87930 ?auto_87931 ) ( not ( = ?auto_87928 ?auto_87931 ) ) ( not ( = ?auto_87929 ?auto_87931 ) ) ( not ( = ?auto_87930 ?auto_87931 ) ) ( CLEAR ?auto_87928 ) ( ON ?auto_87929 ?auto_87930 ) ( CLEAR ?auto_87929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87932 ) ( ON ?auto_87933 ?auto_87932 ) ( ON ?auto_87934 ?auto_87933 ) ( ON ?auto_87931 ?auto_87934 ) ( not ( = ?auto_87932 ?auto_87933 ) ) ( not ( = ?auto_87932 ?auto_87934 ) ) ( not ( = ?auto_87932 ?auto_87931 ) ) ( not ( = ?auto_87932 ?auto_87930 ) ) ( not ( = ?auto_87932 ?auto_87929 ) ) ( not ( = ?auto_87933 ?auto_87934 ) ) ( not ( = ?auto_87933 ?auto_87931 ) ) ( not ( = ?auto_87933 ?auto_87930 ) ) ( not ( = ?auto_87933 ?auto_87929 ) ) ( not ( = ?auto_87934 ?auto_87931 ) ) ( not ( = ?auto_87934 ?auto_87930 ) ) ( not ( = ?auto_87934 ?auto_87929 ) ) ( not ( = ?auto_87928 ?auto_87932 ) ) ( not ( = ?auto_87928 ?auto_87933 ) ) ( not ( = ?auto_87928 ?auto_87934 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87932 ?auto_87933 ?auto_87934 ?auto_87931 ?auto_87930 )
      ( MAKE-3PILE ?auto_87928 ?auto_87929 ?auto_87930 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87935 - BLOCK
      ?auto_87936 - BLOCK
      ?auto_87937 - BLOCK
    )
    :vars
    (
      ?auto_87939 - BLOCK
      ?auto_87940 - BLOCK
      ?auto_87938 - BLOCK
      ?auto_87941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87935 ?auto_87936 ) ) ( not ( = ?auto_87935 ?auto_87937 ) ) ( not ( = ?auto_87936 ?auto_87937 ) ) ( ON ?auto_87937 ?auto_87939 ) ( not ( = ?auto_87935 ?auto_87939 ) ) ( not ( = ?auto_87936 ?auto_87939 ) ) ( not ( = ?auto_87937 ?auto_87939 ) ) ( ON ?auto_87936 ?auto_87937 ) ( CLEAR ?auto_87936 ) ( ON-TABLE ?auto_87940 ) ( ON ?auto_87938 ?auto_87940 ) ( ON ?auto_87941 ?auto_87938 ) ( ON ?auto_87939 ?auto_87941 ) ( not ( = ?auto_87940 ?auto_87938 ) ) ( not ( = ?auto_87940 ?auto_87941 ) ) ( not ( = ?auto_87940 ?auto_87939 ) ) ( not ( = ?auto_87940 ?auto_87937 ) ) ( not ( = ?auto_87940 ?auto_87936 ) ) ( not ( = ?auto_87938 ?auto_87941 ) ) ( not ( = ?auto_87938 ?auto_87939 ) ) ( not ( = ?auto_87938 ?auto_87937 ) ) ( not ( = ?auto_87938 ?auto_87936 ) ) ( not ( = ?auto_87941 ?auto_87939 ) ) ( not ( = ?auto_87941 ?auto_87937 ) ) ( not ( = ?auto_87941 ?auto_87936 ) ) ( not ( = ?auto_87935 ?auto_87940 ) ) ( not ( = ?auto_87935 ?auto_87938 ) ) ( not ( = ?auto_87935 ?auto_87941 ) ) ( HOLDING ?auto_87935 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87935 )
      ( MAKE-3PILE ?auto_87935 ?auto_87936 ?auto_87937 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87942 - BLOCK
      ?auto_87943 - BLOCK
      ?auto_87944 - BLOCK
    )
    :vars
    (
      ?auto_87945 - BLOCK
      ?auto_87947 - BLOCK
      ?auto_87948 - BLOCK
      ?auto_87946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87942 ?auto_87943 ) ) ( not ( = ?auto_87942 ?auto_87944 ) ) ( not ( = ?auto_87943 ?auto_87944 ) ) ( ON ?auto_87944 ?auto_87945 ) ( not ( = ?auto_87942 ?auto_87945 ) ) ( not ( = ?auto_87943 ?auto_87945 ) ) ( not ( = ?auto_87944 ?auto_87945 ) ) ( ON ?auto_87943 ?auto_87944 ) ( ON-TABLE ?auto_87947 ) ( ON ?auto_87948 ?auto_87947 ) ( ON ?auto_87946 ?auto_87948 ) ( ON ?auto_87945 ?auto_87946 ) ( not ( = ?auto_87947 ?auto_87948 ) ) ( not ( = ?auto_87947 ?auto_87946 ) ) ( not ( = ?auto_87947 ?auto_87945 ) ) ( not ( = ?auto_87947 ?auto_87944 ) ) ( not ( = ?auto_87947 ?auto_87943 ) ) ( not ( = ?auto_87948 ?auto_87946 ) ) ( not ( = ?auto_87948 ?auto_87945 ) ) ( not ( = ?auto_87948 ?auto_87944 ) ) ( not ( = ?auto_87948 ?auto_87943 ) ) ( not ( = ?auto_87946 ?auto_87945 ) ) ( not ( = ?auto_87946 ?auto_87944 ) ) ( not ( = ?auto_87946 ?auto_87943 ) ) ( not ( = ?auto_87942 ?auto_87947 ) ) ( not ( = ?auto_87942 ?auto_87948 ) ) ( not ( = ?auto_87942 ?auto_87946 ) ) ( ON ?auto_87942 ?auto_87943 ) ( CLEAR ?auto_87942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87947 ?auto_87948 ?auto_87946 ?auto_87945 ?auto_87944 ?auto_87943 )
      ( MAKE-3PILE ?auto_87942 ?auto_87943 ?auto_87944 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87952 - BLOCK
      ?auto_87953 - BLOCK
      ?auto_87954 - BLOCK
    )
    :vars
    (
      ?auto_87956 - BLOCK
      ?auto_87957 - BLOCK
      ?auto_87958 - BLOCK
      ?auto_87955 - BLOCK
      ?auto_87959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87952 ?auto_87953 ) ) ( not ( = ?auto_87952 ?auto_87954 ) ) ( not ( = ?auto_87953 ?auto_87954 ) ) ( ON ?auto_87954 ?auto_87956 ) ( not ( = ?auto_87952 ?auto_87956 ) ) ( not ( = ?auto_87953 ?auto_87956 ) ) ( not ( = ?auto_87954 ?auto_87956 ) ) ( ON ?auto_87953 ?auto_87954 ) ( CLEAR ?auto_87953 ) ( ON-TABLE ?auto_87957 ) ( ON ?auto_87958 ?auto_87957 ) ( ON ?auto_87955 ?auto_87958 ) ( ON ?auto_87956 ?auto_87955 ) ( not ( = ?auto_87957 ?auto_87958 ) ) ( not ( = ?auto_87957 ?auto_87955 ) ) ( not ( = ?auto_87957 ?auto_87956 ) ) ( not ( = ?auto_87957 ?auto_87954 ) ) ( not ( = ?auto_87957 ?auto_87953 ) ) ( not ( = ?auto_87958 ?auto_87955 ) ) ( not ( = ?auto_87958 ?auto_87956 ) ) ( not ( = ?auto_87958 ?auto_87954 ) ) ( not ( = ?auto_87958 ?auto_87953 ) ) ( not ( = ?auto_87955 ?auto_87956 ) ) ( not ( = ?auto_87955 ?auto_87954 ) ) ( not ( = ?auto_87955 ?auto_87953 ) ) ( not ( = ?auto_87952 ?auto_87957 ) ) ( not ( = ?auto_87952 ?auto_87958 ) ) ( not ( = ?auto_87952 ?auto_87955 ) ) ( ON ?auto_87952 ?auto_87959 ) ( CLEAR ?auto_87952 ) ( HAND-EMPTY ) ( not ( = ?auto_87952 ?auto_87959 ) ) ( not ( = ?auto_87953 ?auto_87959 ) ) ( not ( = ?auto_87954 ?auto_87959 ) ) ( not ( = ?auto_87956 ?auto_87959 ) ) ( not ( = ?auto_87957 ?auto_87959 ) ) ( not ( = ?auto_87958 ?auto_87959 ) ) ( not ( = ?auto_87955 ?auto_87959 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87952 ?auto_87959 )
      ( MAKE-3PILE ?auto_87952 ?auto_87953 ?auto_87954 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87960 - BLOCK
      ?auto_87961 - BLOCK
      ?auto_87962 - BLOCK
    )
    :vars
    (
      ?auto_87967 - BLOCK
      ?auto_87963 - BLOCK
      ?auto_87966 - BLOCK
      ?auto_87964 - BLOCK
      ?auto_87965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87960 ?auto_87961 ) ) ( not ( = ?auto_87960 ?auto_87962 ) ) ( not ( = ?auto_87961 ?auto_87962 ) ) ( ON ?auto_87962 ?auto_87967 ) ( not ( = ?auto_87960 ?auto_87967 ) ) ( not ( = ?auto_87961 ?auto_87967 ) ) ( not ( = ?auto_87962 ?auto_87967 ) ) ( ON-TABLE ?auto_87963 ) ( ON ?auto_87966 ?auto_87963 ) ( ON ?auto_87964 ?auto_87966 ) ( ON ?auto_87967 ?auto_87964 ) ( not ( = ?auto_87963 ?auto_87966 ) ) ( not ( = ?auto_87963 ?auto_87964 ) ) ( not ( = ?auto_87963 ?auto_87967 ) ) ( not ( = ?auto_87963 ?auto_87962 ) ) ( not ( = ?auto_87963 ?auto_87961 ) ) ( not ( = ?auto_87966 ?auto_87964 ) ) ( not ( = ?auto_87966 ?auto_87967 ) ) ( not ( = ?auto_87966 ?auto_87962 ) ) ( not ( = ?auto_87966 ?auto_87961 ) ) ( not ( = ?auto_87964 ?auto_87967 ) ) ( not ( = ?auto_87964 ?auto_87962 ) ) ( not ( = ?auto_87964 ?auto_87961 ) ) ( not ( = ?auto_87960 ?auto_87963 ) ) ( not ( = ?auto_87960 ?auto_87966 ) ) ( not ( = ?auto_87960 ?auto_87964 ) ) ( ON ?auto_87960 ?auto_87965 ) ( CLEAR ?auto_87960 ) ( not ( = ?auto_87960 ?auto_87965 ) ) ( not ( = ?auto_87961 ?auto_87965 ) ) ( not ( = ?auto_87962 ?auto_87965 ) ) ( not ( = ?auto_87967 ?auto_87965 ) ) ( not ( = ?auto_87963 ?auto_87965 ) ) ( not ( = ?auto_87966 ?auto_87965 ) ) ( not ( = ?auto_87964 ?auto_87965 ) ) ( HOLDING ?auto_87961 ) ( CLEAR ?auto_87962 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87963 ?auto_87966 ?auto_87964 ?auto_87967 ?auto_87962 ?auto_87961 )
      ( MAKE-3PILE ?auto_87960 ?auto_87961 ?auto_87962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87968 - BLOCK
      ?auto_87969 - BLOCK
      ?auto_87970 - BLOCK
    )
    :vars
    (
      ?auto_87973 - BLOCK
      ?auto_87971 - BLOCK
      ?auto_87975 - BLOCK
      ?auto_87972 - BLOCK
      ?auto_87974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87968 ?auto_87969 ) ) ( not ( = ?auto_87968 ?auto_87970 ) ) ( not ( = ?auto_87969 ?auto_87970 ) ) ( ON ?auto_87970 ?auto_87973 ) ( not ( = ?auto_87968 ?auto_87973 ) ) ( not ( = ?auto_87969 ?auto_87973 ) ) ( not ( = ?auto_87970 ?auto_87973 ) ) ( ON-TABLE ?auto_87971 ) ( ON ?auto_87975 ?auto_87971 ) ( ON ?auto_87972 ?auto_87975 ) ( ON ?auto_87973 ?auto_87972 ) ( not ( = ?auto_87971 ?auto_87975 ) ) ( not ( = ?auto_87971 ?auto_87972 ) ) ( not ( = ?auto_87971 ?auto_87973 ) ) ( not ( = ?auto_87971 ?auto_87970 ) ) ( not ( = ?auto_87971 ?auto_87969 ) ) ( not ( = ?auto_87975 ?auto_87972 ) ) ( not ( = ?auto_87975 ?auto_87973 ) ) ( not ( = ?auto_87975 ?auto_87970 ) ) ( not ( = ?auto_87975 ?auto_87969 ) ) ( not ( = ?auto_87972 ?auto_87973 ) ) ( not ( = ?auto_87972 ?auto_87970 ) ) ( not ( = ?auto_87972 ?auto_87969 ) ) ( not ( = ?auto_87968 ?auto_87971 ) ) ( not ( = ?auto_87968 ?auto_87975 ) ) ( not ( = ?auto_87968 ?auto_87972 ) ) ( ON ?auto_87968 ?auto_87974 ) ( not ( = ?auto_87968 ?auto_87974 ) ) ( not ( = ?auto_87969 ?auto_87974 ) ) ( not ( = ?auto_87970 ?auto_87974 ) ) ( not ( = ?auto_87973 ?auto_87974 ) ) ( not ( = ?auto_87971 ?auto_87974 ) ) ( not ( = ?auto_87975 ?auto_87974 ) ) ( not ( = ?auto_87972 ?auto_87974 ) ) ( CLEAR ?auto_87970 ) ( ON ?auto_87969 ?auto_87968 ) ( CLEAR ?auto_87969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87974 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87974 ?auto_87968 )
      ( MAKE-3PILE ?auto_87968 ?auto_87969 ?auto_87970 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87976 - BLOCK
      ?auto_87977 - BLOCK
      ?auto_87978 - BLOCK
    )
    :vars
    (
      ?auto_87982 - BLOCK
      ?auto_87979 - BLOCK
      ?auto_87983 - BLOCK
      ?auto_87980 - BLOCK
      ?auto_87981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87976 ?auto_87977 ) ) ( not ( = ?auto_87976 ?auto_87978 ) ) ( not ( = ?auto_87977 ?auto_87978 ) ) ( not ( = ?auto_87976 ?auto_87982 ) ) ( not ( = ?auto_87977 ?auto_87982 ) ) ( not ( = ?auto_87978 ?auto_87982 ) ) ( ON-TABLE ?auto_87979 ) ( ON ?auto_87983 ?auto_87979 ) ( ON ?auto_87980 ?auto_87983 ) ( ON ?auto_87982 ?auto_87980 ) ( not ( = ?auto_87979 ?auto_87983 ) ) ( not ( = ?auto_87979 ?auto_87980 ) ) ( not ( = ?auto_87979 ?auto_87982 ) ) ( not ( = ?auto_87979 ?auto_87978 ) ) ( not ( = ?auto_87979 ?auto_87977 ) ) ( not ( = ?auto_87983 ?auto_87980 ) ) ( not ( = ?auto_87983 ?auto_87982 ) ) ( not ( = ?auto_87983 ?auto_87978 ) ) ( not ( = ?auto_87983 ?auto_87977 ) ) ( not ( = ?auto_87980 ?auto_87982 ) ) ( not ( = ?auto_87980 ?auto_87978 ) ) ( not ( = ?auto_87980 ?auto_87977 ) ) ( not ( = ?auto_87976 ?auto_87979 ) ) ( not ( = ?auto_87976 ?auto_87983 ) ) ( not ( = ?auto_87976 ?auto_87980 ) ) ( ON ?auto_87976 ?auto_87981 ) ( not ( = ?auto_87976 ?auto_87981 ) ) ( not ( = ?auto_87977 ?auto_87981 ) ) ( not ( = ?auto_87978 ?auto_87981 ) ) ( not ( = ?auto_87982 ?auto_87981 ) ) ( not ( = ?auto_87979 ?auto_87981 ) ) ( not ( = ?auto_87983 ?auto_87981 ) ) ( not ( = ?auto_87980 ?auto_87981 ) ) ( ON ?auto_87977 ?auto_87976 ) ( CLEAR ?auto_87977 ) ( ON-TABLE ?auto_87981 ) ( HOLDING ?auto_87978 ) ( CLEAR ?auto_87982 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87979 ?auto_87983 ?auto_87980 ?auto_87982 ?auto_87978 )
      ( MAKE-3PILE ?auto_87976 ?auto_87977 ?auto_87978 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87984 - BLOCK
      ?auto_87985 - BLOCK
      ?auto_87986 - BLOCK
    )
    :vars
    (
      ?auto_87991 - BLOCK
      ?auto_87990 - BLOCK
      ?auto_87988 - BLOCK
      ?auto_87987 - BLOCK
      ?auto_87989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87984 ?auto_87985 ) ) ( not ( = ?auto_87984 ?auto_87986 ) ) ( not ( = ?auto_87985 ?auto_87986 ) ) ( not ( = ?auto_87984 ?auto_87991 ) ) ( not ( = ?auto_87985 ?auto_87991 ) ) ( not ( = ?auto_87986 ?auto_87991 ) ) ( ON-TABLE ?auto_87990 ) ( ON ?auto_87988 ?auto_87990 ) ( ON ?auto_87987 ?auto_87988 ) ( ON ?auto_87991 ?auto_87987 ) ( not ( = ?auto_87990 ?auto_87988 ) ) ( not ( = ?auto_87990 ?auto_87987 ) ) ( not ( = ?auto_87990 ?auto_87991 ) ) ( not ( = ?auto_87990 ?auto_87986 ) ) ( not ( = ?auto_87990 ?auto_87985 ) ) ( not ( = ?auto_87988 ?auto_87987 ) ) ( not ( = ?auto_87988 ?auto_87991 ) ) ( not ( = ?auto_87988 ?auto_87986 ) ) ( not ( = ?auto_87988 ?auto_87985 ) ) ( not ( = ?auto_87987 ?auto_87991 ) ) ( not ( = ?auto_87987 ?auto_87986 ) ) ( not ( = ?auto_87987 ?auto_87985 ) ) ( not ( = ?auto_87984 ?auto_87990 ) ) ( not ( = ?auto_87984 ?auto_87988 ) ) ( not ( = ?auto_87984 ?auto_87987 ) ) ( ON ?auto_87984 ?auto_87989 ) ( not ( = ?auto_87984 ?auto_87989 ) ) ( not ( = ?auto_87985 ?auto_87989 ) ) ( not ( = ?auto_87986 ?auto_87989 ) ) ( not ( = ?auto_87991 ?auto_87989 ) ) ( not ( = ?auto_87990 ?auto_87989 ) ) ( not ( = ?auto_87988 ?auto_87989 ) ) ( not ( = ?auto_87987 ?auto_87989 ) ) ( ON ?auto_87985 ?auto_87984 ) ( ON-TABLE ?auto_87989 ) ( CLEAR ?auto_87991 ) ( ON ?auto_87986 ?auto_87985 ) ( CLEAR ?auto_87986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87989 ?auto_87984 ?auto_87985 )
      ( MAKE-3PILE ?auto_87984 ?auto_87985 ?auto_87986 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_87992 - BLOCK
      ?auto_87993 - BLOCK
      ?auto_87994 - BLOCK
    )
    :vars
    (
      ?auto_87998 - BLOCK
      ?auto_87996 - BLOCK
      ?auto_87999 - BLOCK
      ?auto_87997 - BLOCK
      ?auto_87995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_87992 ?auto_87993 ) ) ( not ( = ?auto_87992 ?auto_87994 ) ) ( not ( = ?auto_87993 ?auto_87994 ) ) ( not ( = ?auto_87992 ?auto_87998 ) ) ( not ( = ?auto_87993 ?auto_87998 ) ) ( not ( = ?auto_87994 ?auto_87998 ) ) ( ON-TABLE ?auto_87996 ) ( ON ?auto_87999 ?auto_87996 ) ( ON ?auto_87997 ?auto_87999 ) ( not ( = ?auto_87996 ?auto_87999 ) ) ( not ( = ?auto_87996 ?auto_87997 ) ) ( not ( = ?auto_87996 ?auto_87998 ) ) ( not ( = ?auto_87996 ?auto_87994 ) ) ( not ( = ?auto_87996 ?auto_87993 ) ) ( not ( = ?auto_87999 ?auto_87997 ) ) ( not ( = ?auto_87999 ?auto_87998 ) ) ( not ( = ?auto_87999 ?auto_87994 ) ) ( not ( = ?auto_87999 ?auto_87993 ) ) ( not ( = ?auto_87997 ?auto_87998 ) ) ( not ( = ?auto_87997 ?auto_87994 ) ) ( not ( = ?auto_87997 ?auto_87993 ) ) ( not ( = ?auto_87992 ?auto_87996 ) ) ( not ( = ?auto_87992 ?auto_87999 ) ) ( not ( = ?auto_87992 ?auto_87997 ) ) ( ON ?auto_87992 ?auto_87995 ) ( not ( = ?auto_87992 ?auto_87995 ) ) ( not ( = ?auto_87993 ?auto_87995 ) ) ( not ( = ?auto_87994 ?auto_87995 ) ) ( not ( = ?auto_87998 ?auto_87995 ) ) ( not ( = ?auto_87996 ?auto_87995 ) ) ( not ( = ?auto_87999 ?auto_87995 ) ) ( not ( = ?auto_87997 ?auto_87995 ) ) ( ON ?auto_87993 ?auto_87992 ) ( ON-TABLE ?auto_87995 ) ( ON ?auto_87994 ?auto_87993 ) ( CLEAR ?auto_87994 ) ( HOLDING ?auto_87998 ) ( CLEAR ?auto_87997 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87996 ?auto_87999 ?auto_87997 ?auto_87998 )
      ( MAKE-3PILE ?auto_87992 ?auto_87993 ?auto_87994 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88000 - BLOCK
      ?auto_88001 - BLOCK
      ?auto_88002 - BLOCK
    )
    :vars
    (
      ?auto_88006 - BLOCK
      ?auto_88005 - BLOCK
      ?auto_88003 - BLOCK
      ?auto_88007 - BLOCK
      ?auto_88004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88000 ?auto_88001 ) ) ( not ( = ?auto_88000 ?auto_88002 ) ) ( not ( = ?auto_88001 ?auto_88002 ) ) ( not ( = ?auto_88000 ?auto_88006 ) ) ( not ( = ?auto_88001 ?auto_88006 ) ) ( not ( = ?auto_88002 ?auto_88006 ) ) ( ON-TABLE ?auto_88005 ) ( ON ?auto_88003 ?auto_88005 ) ( ON ?auto_88007 ?auto_88003 ) ( not ( = ?auto_88005 ?auto_88003 ) ) ( not ( = ?auto_88005 ?auto_88007 ) ) ( not ( = ?auto_88005 ?auto_88006 ) ) ( not ( = ?auto_88005 ?auto_88002 ) ) ( not ( = ?auto_88005 ?auto_88001 ) ) ( not ( = ?auto_88003 ?auto_88007 ) ) ( not ( = ?auto_88003 ?auto_88006 ) ) ( not ( = ?auto_88003 ?auto_88002 ) ) ( not ( = ?auto_88003 ?auto_88001 ) ) ( not ( = ?auto_88007 ?auto_88006 ) ) ( not ( = ?auto_88007 ?auto_88002 ) ) ( not ( = ?auto_88007 ?auto_88001 ) ) ( not ( = ?auto_88000 ?auto_88005 ) ) ( not ( = ?auto_88000 ?auto_88003 ) ) ( not ( = ?auto_88000 ?auto_88007 ) ) ( ON ?auto_88000 ?auto_88004 ) ( not ( = ?auto_88000 ?auto_88004 ) ) ( not ( = ?auto_88001 ?auto_88004 ) ) ( not ( = ?auto_88002 ?auto_88004 ) ) ( not ( = ?auto_88006 ?auto_88004 ) ) ( not ( = ?auto_88005 ?auto_88004 ) ) ( not ( = ?auto_88003 ?auto_88004 ) ) ( not ( = ?auto_88007 ?auto_88004 ) ) ( ON ?auto_88001 ?auto_88000 ) ( ON-TABLE ?auto_88004 ) ( ON ?auto_88002 ?auto_88001 ) ( CLEAR ?auto_88007 ) ( ON ?auto_88006 ?auto_88002 ) ( CLEAR ?auto_88006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88004 ?auto_88000 ?auto_88001 ?auto_88002 )
      ( MAKE-3PILE ?auto_88000 ?auto_88001 ?auto_88002 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88008 - BLOCK
      ?auto_88009 - BLOCK
      ?auto_88010 - BLOCK
    )
    :vars
    (
      ?auto_88015 - BLOCK
      ?auto_88011 - BLOCK
      ?auto_88013 - BLOCK
      ?auto_88012 - BLOCK
      ?auto_88014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88008 ?auto_88009 ) ) ( not ( = ?auto_88008 ?auto_88010 ) ) ( not ( = ?auto_88009 ?auto_88010 ) ) ( not ( = ?auto_88008 ?auto_88015 ) ) ( not ( = ?auto_88009 ?auto_88015 ) ) ( not ( = ?auto_88010 ?auto_88015 ) ) ( ON-TABLE ?auto_88011 ) ( ON ?auto_88013 ?auto_88011 ) ( not ( = ?auto_88011 ?auto_88013 ) ) ( not ( = ?auto_88011 ?auto_88012 ) ) ( not ( = ?auto_88011 ?auto_88015 ) ) ( not ( = ?auto_88011 ?auto_88010 ) ) ( not ( = ?auto_88011 ?auto_88009 ) ) ( not ( = ?auto_88013 ?auto_88012 ) ) ( not ( = ?auto_88013 ?auto_88015 ) ) ( not ( = ?auto_88013 ?auto_88010 ) ) ( not ( = ?auto_88013 ?auto_88009 ) ) ( not ( = ?auto_88012 ?auto_88015 ) ) ( not ( = ?auto_88012 ?auto_88010 ) ) ( not ( = ?auto_88012 ?auto_88009 ) ) ( not ( = ?auto_88008 ?auto_88011 ) ) ( not ( = ?auto_88008 ?auto_88013 ) ) ( not ( = ?auto_88008 ?auto_88012 ) ) ( ON ?auto_88008 ?auto_88014 ) ( not ( = ?auto_88008 ?auto_88014 ) ) ( not ( = ?auto_88009 ?auto_88014 ) ) ( not ( = ?auto_88010 ?auto_88014 ) ) ( not ( = ?auto_88015 ?auto_88014 ) ) ( not ( = ?auto_88011 ?auto_88014 ) ) ( not ( = ?auto_88013 ?auto_88014 ) ) ( not ( = ?auto_88012 ?auto_88014 ) ) ( ON ?auto_88009 ?auto_88008 ) ( ON-TABLE ?auto_88014 ) ( ON ?auto_88010 ?auto_88009 ) ( ON ?auto_88015 ?auto_88010 ) ( CLEAR ?auto_88015 ) ( HOLDING ?auto_88012 ) ( CLEAR ?auto_88013 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88011 ?auto_88013 ?auto_88012 )
      ( MAKE-3PILE ?auto_88008 ?auto_88009 ?auto_88010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88016 - BLOCK
      ?auto_88017 - BLOCK
      ?auto_88018 - BLOCK
    )
    :vars
    (
      ?auto_88019 - BLOCK
      ?auto_88021 - BLOCK
      ?auto_88020 - BLOCK
      ?auto_88022 - BLOCK
      ?auto_88023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88016 ?auto_88017 ) ) ( not ( = ?auto_88016 ?auto_88018 ) ) ( not ( = ?auto_88017 ?auto_88018 ) ) ( not ( = ?auto_88016 ?auto_88019 ) ) ( not ( = ?auto_88017 ?auto_88019 ) ) ( not ( = ?auto_88018 ?auto_88019 ) ) ( ON-TABLE ?auto_88021 ) ( ON ?auto_88020 ?auto_88021 ) ( not ( = ?auto_88021 ?auto_88020 ) ) ( not ( = ?auto_88021 ?auto_88022 ) ) ( not ( = ?auto_88021 ?auto_88019 ) ) ( not ( = ?auto_88021 ?auto_88018 ) ) ( not ( = ?auto_88021 ?auto_88017 ) ) ( not ( = ?auto_88020 ?auto_88022 ) ) ( not ( = ?auto_88020 ?auto_88019 ) ) ( not ( = ?auto_88020 ?auto_88018 ) ) ( not ( = ?auto_88020 ?auto_88017 ) ) ( not ( = ?auto_88022 ?auto_88019 ) ) ( not ( = ?auto_88022 ?auto_88018 ) ) ( not ( = ?auto_88022 ?auto_88017 ) ) ( not ( = ?auto_88016 ?auto_88021 ) ) ( not ( = ?auto_88016 ?auto_88020 ) ) ( not ( = ?auto_88016 ?auto_88022 ) ) ( ON ?auto_88016 ?auto_88023 ) ( not ( = ?auto_88016 ?auto_88023 ) ) ( not ( = ?auto_88017 ?auto_88023 ) ) ( not ( = ?auto_88018 ?auto_88023 ) ) ( not ( = ?auto_88019 ?auto_88023 ) ) ( not ( = ?auto_88021 ?auto_88023 ) ) ( not ( = ?auto_88020 ?auto_88023 ) ) ( not ( = ?auto_88022 ?auto_88023 ) ) ( ON ?auto_88017 ?auto_88016 ) ( ON-TABLE ?auto_88023 ) ( ON ?auto_88018 ?auto_88017 ) ( ON ?auto_88019 ?auto_88018 ) ( CLEAR ?auto_88020 ) ( ON ?auto_88022 ?auto_88019 ) ( CLEAR ?auto_88022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88023 ?auto_88016 ?auto_88017 ?auto_88018 ?auto_88019 )
      ( MAKE-3PILE ?auto_88016 ?auto_88017 ?auto_88018 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88024 - BLOCK
      ?auto_88025 - BLOCK
      ?auto_88026 - BLOCK
    )
    :vars
    (
      ?auto_88031 - BLOCK
      ?auto_88027 - BLOCK
      ?auto_88030 - BLOCK
      ?auto_88029 - BLOCK
      ?auto_88028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88024 ?auto_88025 ) ) ( not ( = ?auto_88024 ?auto_88026 ) ) ( not ( = ?auto_88025 ?auto_88026 ) ) ( not ( = ?auto_88024 ?auto_88031 ) ) ( not ( = ?auto_88025 ?auto_88031 ) ) ( not ( = ?auto_88026 ?auto_88031 ) ) ( ON-TABLE ?auto_88027 ) ( not ( = ?auto_88027 ?auto_88030 ) ) ( not ( = ?auto_88027 ?auto_88029 ) ) ( not ( = ?auto_88027 ?auto_88031 ) ) ( not ( = ?auto_88027 ?auto_88026 ) ) ( not ( = ?auto_88027 ?auto_88025 ) ) ( not ( = ?auto_88030 ?auto_88029 ) ) ( not ( = ?auto_88030 ?auto_88031 ) ) ( not ( = ?auto_88030 ?auto_88026 ) ) ( not ( = ?auto_88030 ?auto_88025 ) ) ( not ( = ?auto_88029 ?auto_88031 ) ) ( not ( = ?auto_88029 ?auto_88026 ) ) ( not ( = ?auto_88029 ?auto_88025 ) ) ( not ( = ?auto_88024 ?auto_88027 ) ) ( not ( = ?auto_88024 ?auto_88030 ) ) ( not ( = ?auto_88024 ?auto_88029 ) ) ( ON ?auto_88024 ?auto_88028 ) ( not ( = ?auto_88024 ?auto_88028 ) ) ( not ( = ?auto_88025 ?auto_88028 ) ) ( not ( = ?auto_88026 ?auto_88028 ) ) ( not ( = ?auto_88031 ?auto_88028 ) ) ( not ( = ?auto_88027 ?auto_88028 ) ) ( not ( = ?auto_88030 ?auto_88028 ) ) ( not ( = ?auto_88029 ?auto_88028 ) ) ( ON ?auto_88025 ?auto_88024 ) ( ON-TABLE ?auto_88028 ) ( ON ?auto_88026 ?auto_88025 ) ( ON ?auto_88031 ?auto_88026 ) ( ON ?auto_88029 ?auto_88031 ) ( CLEAR ?auto_88029 ) ( HOLDING ?auto_88030 ) ( CLEAR ?auto_88027 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88027 ?auto_88030 )
      ( MAKE-3PILE ?auto_88024 ?auto_88025 ?auto_88026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88032 - BLOCK
      ?auto_88033 - BLOCK
      ?auto_88034 - BLOCK
    )
    :vars
    (
      ?auto_88036 - BLOCK
      ?auto_88039 - BLOCK
      ?auto_88035 - BLOCK
      ?auto_88038 - BLOCK
      ?auto_88037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88032 ?auto_88033 ) ) ( not ( = ?auto_88032 ?auto_88034 ) ) ( not ( = ?auto_88033 ?auto_88034 ) ) ( not ( = ?auto_88032 ?auto_88036 ) ) ( not ( = ?auto_88033 ?auto_88036 ) ) ( not ( = ?auto_88034 ?auto_88036 ) ) ( ON-TABLE ?auto_88039 ) ( not ( = ?auto_88039 ?auto_88035 ) ) ( not ( = ?auto_88039 ?auto_88038 ) ) ( not ( = ?auto_88039 ?auto_88036 ) ) ( not ( = ?auto_88039 ?auto_88034 ) ) ( not ( = ?auto_88039 ?auto_88033 ) ) ( not ( = ?auto_88035 ?auto_88038 ) ) ( not ( = ?auto_88035 ?auto_88036 ) ) ( not ( = ?auto_88035 ?auto_88034 ) ) ( not ( = ?auto_88035 ?auto_88033 ) ) ( not ( = ?auto_88038 ?auto_88036 ) ) ( not ( = ?auto_88038 ?auto_88034 ) ) ( not ( = ?auto_88038 ?auto_88033 ) ) ( not ( = ?auto_88032 ?auto_88039 ) ) ( not ( = ?auto_88032 ?auto_88035 ) ) ( not ( = ?auto_88032 ?auto_88038 ) ) ( ON ?auto_88032 ?auto_88037 ) ( not ( = ?auto_88032 ?auto_88037 ) ) ( not ( = ?auto_88033 ?auto_88037 ) ) ( not ( = ?auto_88034 ?auto_88037 ) ) ( not ( = ?auto_88036 ?auto_88037 ) ) ( not ( = ?auto_88039 ?auto_88037 ) ) ( not ( = ?auto_88035 ?auto_88037 ) ) ( not ( = ?auto_88038 ?auto_88037 ) ) ( ON ?auto_88033 ?auto_88032 ) ( ON-TABLE ?auto_88037 ) ( ON ?auto_88034 ?auto_88033 ) ( ON ?auto_88036 ?auto_88034 ) ( ON ?auto_88038 ?auto_88036 ) ( CLEAR ?auto_88039 ) ( ON ?auto_88035 ?auto_88038 ) ( CLEAR ?auto_88035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88037 ?auto_88032 ?auto_88033 ?auto_88034 ?auto_88036 ?auto_88038 )
      ( MAKE-3PILE ?auto_88032 ?auto_88033 ?auto_88034 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88040 - BLOCK
      ?auto_88041 - BLOCK
      ?auto_88042 - BLOCK
    )
    :vars
    (
      ?auto_88044 - BLOCK
      ?auto_88046 - BLOCK
      ?auto_88043 - BLOCK
      ?auto_88047 - BLOCK
      ?auto_88045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88040 ?auto_88041 ) ) ( not ( = ?auto_88040 ?auto_88042 ) ) ( not ( = ?auto_88041 ?auto_88042 ) ) ( not ( = ?auto_88040 ?auto_88044 ) ) ( not ( = ?auto_88041 ?auto_88044 ) ) ( not ( = ?auto_88042 ?auto_88044 ) ) ( not ( = ?auto_88046 ?auto_88043 ) ) ( not ( = ?auto_88046 ?auto_88047 ) ) ( not ( = ?auto_88046 ?auto_88044 ) ) ( not ( = ?auto_88046 ?auto_88042 ) ) ( not ( = ?auto_88046 ?auto_88041 ) ) ( not ( = ?auto_88043 ?auto_88047 ) ) ( not ( = ?auto_88043 ?auto_88044 ) ) ( not ( = ?auto_88043 ?auto_88042 ) ) ( not ( = ?auto_88043 ?auto_88041 ) ) ( not ( = ?auto_88047 ?auto_88044 ) ) ( not ( = ?auto_88047 ?auto_88042 ) ) ( not ( = ?auto_88047 ?auto_88041 ) ) ( not ( = ?auto_88040 ?auto_88046 ) ) ( not ( = ?auto_88040 ?auto_88043 ) ) ( not ( = ?auto_88040 ?auto_88047 ) ) ( ON ?auto_88040 ?auto_88045 ) ( not ( = ?auto_88040 ?auto_88045 ) ) ( not ( = ?auto_88041 ?auto_88045 ) ) ( not ( = ?auto_88042 ?auto_88045 ) ) ( not ( = ?auto_88044 ?auto_88045 ) ) ( not ( = ?auto_88046 ?auto_88045 ) ) ( not ( = ?auto_88043 ?auto_88045 ) ) ( not ( = ?auto_88047 ?auto_88045 ) ) ( ON ?auto_88041 ?auto_88040 ) ( ON-TABLE ?auto_88045 ) ( ON ?auto_88042 ?auto_88041 ) ( ON ?auto_88044 ?auto_88042 ) ( ON ?auto_88047 ?auto_88044 ) ( ON ?auto_88043 ?auto_88047 ) ( CLEAR ?auto_88043 ) ( HOLDING ?auto_88046 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88046 )
      ( MAKE-3PILE ?auto_88040 ?auto_88041 ?auto_88042 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88048 - BLOCK
      ?auto_88049 - BLOCK
      ?auto_88050 - BLOCK
    )
    :vars
    (
      ?auto_88053 - BLOCK
      ?auto_88052 - BLOCK
      ?auto_88055 - BLOCK
      ?auto_88054 - BLOCK
      ?auto_88051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88048 ?auto_88049 ) ) ( not ( = ?auto_88048 ?auto_88050 ) ) ( not ( = ?auto_88049 ?auto_88050 ) ) ( not ( = ?auto_88048 ?auto_88053 ) ) ( not ( = ?auto_88049 ?auto_88053 ) ) ( not ( = ?auto_88050 ?auto_88053 ) ) ( not ( = ?auto_88052 ?auto_88055 ) ) ( not ( = ?auto_88052 ?auto_88054 ) ) ( not ( = ?auto_88052 ?auto_88053 ) ) ( not ( = ?auto_88052 ?auto_88050 ) ) ( not ( = ?auto_88052 ?auto_88049 ) ) ( not ( = ?auto_88055 ?auto_88054 ) ) ( not ( = ?auto_88055 ?auto_88053 ) ) ( not ( = ?auto_88055 ?auto_88050 ) ) ( not ( = ?auto_88055 ?auto_88049 ) ) ( not ( = ?auto_88054 ?auto_88053 ) ) ( not ( = ?auto_88054 ?auto_88050 ) ) ( not ( = ?auto_88054 ?auto_88049 ) ) ( not ( = ?auto_88048 ?auto_88052 ) ) ( not ( = ?auto_88048 ?auto_88055 ) ) ( not ( = ?auto_88048 ?auto_88054 ) ) ( ON ?auto_88048 ?auto_88051 ) ( not ( = ?auto_88048 ?auto_88051 ) ) ( not ( = ?auto_88049 ?auto_88051 ) ) ( not ( = ?auto_88050 ?auto_88051 ) ) ( not ( = ?auto_88053 ?auto_88051 ) ) ( not ( = ?auto_88052 ?auto_88051 ) ) ( not ( = ?auto_88055 ?auto_88051 ) ) ( not ( = ?auto_88054 ?auto_88051 ) ) ( ON ?auto_88049 ?auto_88048 ) ( ON-TABLE ?auto_88051 ) ( ON ?auto_88050 ?auto_88049 ) ( ON ?auto_88053 ?auto_88050 ) ( ON ?auto_88054 ?auto_88053 ) ( ON ?auto_88055 ?auto_88054 ) ( ON ?auto_88052 ?auto_88055 ) ( CLEAR ?auto_88052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88051 ?auto_88048 ?auto_88049 ?auto_88050 ?auto_88053 ?auto_88054 ?auto_88055 )
      ( MAKE-3PILE ?auto_88048 ?auto_88049 ?auto_88050 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88075 - BLOCK
      ?auto_88076 - BLOCK
      ?auto_88077 - BLOCK
    )
    :vars
    (
      ?auto_88078 - BLOCK
      ?auto_88080 - BLOCK
      ?auto_88079 - BLOCK
      ?auto_88081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88078 ?auto_88077 ) ( ON-TABLE ?auto_88075 ) ( ON ?auto_88076 ?auto_88075 ) ( ON ?auto_88077 ?auto_88076 ) ( not ( = ?auto_88075 ?auto_88076 ) ) ( not ( = ?auto_88075 ?auto_88077 ) ) ( not ( = ?auto_88075 ?auto_88078 ) ) ( not ( = ?auto_88076 ?auto_88077 ) ) ( not ( = ?auto_88076 ?auto_88078 ) ) ( not ( = ?auto_88077 ?auto_88078 ) ) ( not ( = ?auto_88075 ?auto_88080 ) ) ( not ( = ?auto_88075 ?auto_88079 ) ) ( not ( = ?auto_88076 ?auto_88080 ) ) ( not ( = ?auto_88076 ?auto_88079 ) ) ( not ( = ?auto_88077 ?auto_88080 ) ) ( not ( = ?auto_88077 ?auto_88079 ) ) ( not ( = ?auto_88078 ?auto_88080 ) ) ( not ( = ?auto_88078 ?auto_88079 ) ) ( not ( = ?auto_88080 ?auto_88079 ) ) ( ON ?auto_88080 ?auto_88078 ) ( CLEAR ?auto_88080 ) ( HOLDING ?auto_88079 ) ( CLEAR ?auto_88081 ) ( ON-TABLE ?auto_88081 ) ( not ( = ?auto_88081 ?auto_88079 ) ) ( not ( = ?auto_88075 ?auto_88081 ) ) ( not ( = ?auto_88076 ?auto_88081 ) ) ( not ( = ?auto_88077 ?auto_88081 ) ) ( not ( = ?auto_88078 ?auto_88081 ) ) ( not ( = ?auto_88080 ?auto_88081 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88081 ?auto_88079 )
      ( MAKE-3PILE ?auto_88075 ?auto_88076 ?auto_88077 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88082 - BLOCK
      ?auto_88083 - BLOCK
      ?auto_88084 - BLOCK
    )
    :vars
    (
      ?auto_88086 - BLOCK
      ?auto_88087 - BLOCK
      ?auto_88088 - BLOCK
      ?auto_88085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88086 ?auto_88084 ) ( ON-TABLE ?auto_88082 ) ( ON ?auto_88083 ?auto_88082 ) ( ON ?auto_88084 ?auto_88083 ) ( not ( = ?auto_88082 ?auto_88083 ) ) ( not ( = ?auto_88082 ?auto_88084 ) ) ( not ( = ?auto_88082 ?auto_88086 ) ) ( not ( = ?auto_88083 ?auto_88084 ) ) ( not ( = ?auto_88083 ?auto_88086 ) ) ( not ( = ?auto_88084 ?auto_88086 ) ) ( not ( = ?auto_88082 ?auto_88087 ) ) ( not ( = ?auto_88082 ?auto_88088 ) ) ( not ( = ?auto_88083 ?auto_88087 ) ) ( not ( = ?auto_88083 ?auto_88088 ) ) ( not ( = ?auto_88084 ?auto_88087 ) ) ( not ( = ?auto_88084 ?auto_88088 ) ) ( not ( = ?auto_88086 ?auto_88087 ) ) ( not ( = ?auto_88086 ?auto_88088 ) ) ( not ( = ?auto_88087 ?auto_88088 ) ) ( ON ?auto_88087 ?auto_88086 ) ( CLEAR ?auto_88085 ) ( ON-TABLE ?auto_88085 ) ( not ( = ?auto_88085 ?auto_88088 ) ) ( not ( = ?auto_88082 ?auto_88085 ) ) ( not ( = ?auto_88083 ?auto_88085 ) ) ( not ( = ?auto_88084 ?auto_88085 ) ) ( not ( = ?auto_88086 ?auto_88085 ) ) ( not ( = ?auto_88087 ?auto_88085 ) ) ( ON ?auto_88088 ?auto_88087 ) ( CLEAR ?auto_88088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88082 ?auto_88083 ?auto_88084 ?auto_88086 ?auto_88087 )
      ( MAKE-3PILE ?auto_88082 ?auto_88083 ?auto_88084 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88089 - BLOCK
      ?auto_88090 - BLOCK
      ?auto_88091 - BLOCK
    )
    :vars
    (
      ?auto_88092 - BLOCK
      ?auto_88094 - BLOCK
      ?auto_88093 - BLOCK
      ?auto_88095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88092 ?auto_88091 ) ( ON-TABLE ?auto_88089 ) ( ON ?auto_88090 ?auto_88089 ) ( ON ?auto_88091 ?auto_88090 ) ( not ( = ?auto_88089 ?auto_88090 ) ) ( not ( = ?auto_88089 ?auto_88091 ) ) ( not ( = ?auto_88089 ?auto_88092 ) ) ( not ( = ?auto_88090 ?auto_88091 ) ) ( not ( = ?auto_88090 ?auto_88092 ) ) ( not ( = ?auto_88091 ?auto_88092 ) ) ( not ( = ?auto_88089 ?auto_88094 ) ) ( not ( = ?auto_88089 ?auto_88093 ) ) ( not ( = ?auto_88090 ?auto_88094 ) ) ( not ( = ?auto_88090 ?auto_88093 ) ) ( not ( = ?auto_88091 ?auto_88094 ) ) ( not ( = ?auto_88091 ?auto_88093 ) ) ( not ( = ?auto_88092 ?auto_88094 ) ) ( not ( = ?auto_88092 ?auto_88093 ) ) ( not ( = ?auto_88094 ?auto_88093 ) ) ( ON ?auto_88094 ?auto_88092 ) ( not ( = ?auto_88095 ?auto_88093 ) ) ( not ( = ?auto_88089 ?auto_88095 ) ) ( not ( = ?auto_88090 ?auto_88095 ) ) ( not ( = ?auto_88091 ?auto_88095 ) ) ( not ( = ?auto_88092 ?auto_88095 ) ) ( not ( = ?auto_88094 ?auto_88095 ) ) ( ON ?auto_88093 ?auto_88094 ) ( CLEAR ?auto_88093 ) ( HOLDING ?auto_88095 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88095 )
      ( MAKE-3PILE ?auto_88089 ?auto_88090 ?auto_88091 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88106 - BLOCK
      ?auto_88107 - BLOCK
      ?auto_88108 - BLOCK
    )
    :vars
    (
      ?auto_88110 - BLOCK
      ?auto_88111 - BLOCK
      ?auto_88109 - BLOCK
      ?auto_88112 - BLOCK
      ?auto_88113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88110 ?auto_88108 ) ( ON-TABLE ?auto_88106 ) ( ON ?auto_88107 ?auto_88106 ) ( ON ?auto_88108 ?auto_88107 ) ( not ( = ?auto_88106 ?auto_88107 ) ) ( not ( = ?auto_88106 ?auto_88108 ) ) ( not ( = ?auto_88106 ?auto_88110 ) ) ( not ( = ?auto_88107 ?auto_88108 ) ) ( not ( = ?auto_88107 ?auto_88110 ) ) ( not ( = ?auto_88108 ?auto_88110 ) ) ( not ( = ?auto_88106 ?auto_88111 ) ) ( not ( = ?auto_88106 ?auto_88109 ) ) ( not ( = ?auto_88107 ?auto_88111 ) ) ( not ( = ?auto_88107 ?auto_88109 ) ) ( not ( = ?auto_88108 ?auto_88111 ) ) ( not ( = ?auto_88108 ?auto_88109 ) ) ( not ( = ?auto_88110 ?auto_88111 ) ) ( not ( = ?auto_88110 ?auto_88109 ) ) ( not ( = ?auto_88111 ?auto_88109 ) ) ( ON ?auto_88111 ?auto_88110 ) ( not ( = ?auto_88112 ?auto_88109 ) ) ( not ( = ?auto_88106 ?auto_88112 ) ) ( not ( = ?auto_88107 ?auto_88112 ) ) ( not ( = ?auto_88108 ?auto_88112 ) ) ( not ( = ?auto_88110 ?auto_88112 ) ) ( not ( = ?auto_88111 ?auto_88112 ) ) ( ON ?auto_88109 ?auto_88111 ) ( CLEAR ?auto_88109 ) ( ON ?auto_88112 ?auto_88113 ) ( CLEAR ?auto_88112 ) ( HAND-EMPTY ) ( not ( = ?auto_88106 ?auto_88113 ) ) ( not ( = ?auto_88107 ?auto_88113 ) ) ( not ( = ?auto_88108 ?auto_88113 ) ) ( not ( = ?auto_88110 ?auto_88113 ) ) ( not ( = ?auto_88111 ?auto_88113 ) ) ( not ( = ?auto_88109 ?auto_88113 ) ) ( not ( = ?auto_88112 ?auto_88113 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88112 ?auto_88113 )
      ( MAKE-3PILE ?auto_88106 ?auto_88107 ?auto_88108 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_88114 - BLOCK
      ?auto_88115 - BLOCK
      ?auto_88116 - BLOCK
    )
    :vars
    (
      ?auto_88117 - BLOCK
      ?auto_88121 - BLOCK
      ?auto_88120 - BLOCK
      ?auto_88118 - BLOCK
      ?auto_88119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88117 ?auto_88116 ) ( ON-TABLE ?auto_88114 ) ( ON ?auto_88115 ?auto_88114 ) ( ON ?auto_88116 ?auto_88115 ) ( not ( = ?auto_88114 ?auto_88115 ) ) ( not ( = ?auto_88114 ?auto_88116 ) ) ( not ( = ?auto_88114 ?auto_88117 ) ) ( not ( = ?auto_88115 ?auto_88116 ) ) ( not ( = ?auto_88115 ?auto_88117 ) ) ( not ( = ?auto_88116 ?auto_88117 ) ) ( not ( = ?auto_88114 ?auto_88121 ) ) ( not ( = ?auto_88114 ?auto_88120 ) ) ( not ( = ?auto_88115 ?auto_88121 ) ) ( not ( = ?auto_88115 ?auto_88120 ) ) ( not ( = ?auto_88116 ?auto_88121 ) ) ( not ( = ?auto_88116 ?auto_88120 ) ) ( not ( = ?auto_88117 ?auto_88121 ) ) ( not ( = ?auto_88117 ?auto_88120 ) ) ( not ( = ?auto_88121 ?auto_88120 ) ) ( ON ?auto_88121 ?auto_88117 ) ( not ( = ?auto_88118 ?auto_88120 ) ) ( not ( = ?auto_88114 ?auto_88118 ) ) ( not ( = ?auto_88115 ?auto_88118 ) ) ( not ( = ?auto_88116 ?auto_88118 ) ) ( not ( = ?auto_88117 ?auto_88118 ) ) ( not ( = ?auto_88121 ?auto_88118 ) ) ( ON ?auto_88118 ?auto_88119 ) ( CLEAR ?auto_88118 ) ( not ( = ?auto_88114 ?auto_88119 ) ) ( not ( = ?auto_88115 ?auto_88119 ) ) ( not ( = ?auto_88116 ?auto_88119 ) ) ( not ( = ?auto_88117 ?auto_88119 ) ) ( not ( = ?auto_88121 ?auto_88119 ) ) ( not ( = ?auto_88120 ?auto_88119 ) ) ( not ( = ?auto_88118 ?auto_88119 ) ) ( HOLDING ?auto_88120 ) ( CLEAR ?auto_88121 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88114 ?auto_88115 ?auto_88116 ?auto_88117 ?auto_88121 ?auto_88120 )
      ( MAKE-3PILE ?auto_88114 ?auto_88115 ?auto_88116 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88176 - BLOCK
      ?auto_88177 - BLOCK
      ?auto_88178 - BLOCK
      ?auto_88179 - BLOCK
    )
    :vars
    (
      ?auto_88180 - BLOCK
      ?auto_88181 - BLOCK
      ?auto_88182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88176 ) ( ON ?auto_88177 ?auto_88176 ) ( not ( = ?auto_88176 ?auto_88177 ) ) ( not ( = ?auto_88176 ?auto_88178 ) ) ( not ( = ?auto_88176 ?auto_88179 ) ) ( not ( = ?auto_88177 ?auto_88178 ) ) ( not ( = ?auto_88177 ?auto_88179 ) ) ( not ( = ?auto_88178 ?auto_88179 ) ) ( ON ?auto_88179 ?auto_88180 ) ( not ( = ?auto_88176 ?auto_88180 ) ) ( not ( = ?auto_88177 ?auto_88180 ) ) ( not ( = ?auto_88178 ?auto_88180 ) ) ( not ( = ?auto_88179 ?auto_88180 ) ) ( CLEAR ?auto_88177 ) ( ON ?auto_88178 ?auto_88179 ) ( CLEAR ?auto_88178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88181 ) ( ON ?auto_88182 ?auto_88181 ) ( ON ?auto_88180 ?auto_88182 ) ( not ( = ?auto_88181 ?auto_88182 ) ) ( not ( = ?auto_88181 ?auto_88180 ) ) ( not ( = ?auto_88181 ?auto_88179 ) ) ( not ( = ?auto_88181 ?auto_88178 ) ) ( not ( = ?auto_88182 ?auto_88180 ) ) ( not ( = ?auto_88182 ?auto_88179 ) ) ( not ( = ?auto_88182 ?auto_88178 ) ) ( not ( = ?auto_88176 ?auto_88181 ) ) ( not ( = ?auto_88176 ?auto_88182 ) ) ( not ( = ?auto_88177 ?auto_88181 ) ) ( not ( = ?auto_88177 ?auto_88182 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88181 ?auto_88182 ?auto_88180 ?auto_88179 )
      ( MAKE-4PILE ?auto_88176 ?auto_88177 ?auto_88178 ?auto_88179 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88183 - BLOCK
      ?auto_88184 - BLOCK
      ?auto_88185 - BLOCK
      ?auto_88186 - BLOCK
    )
    :vars
    (
      ?auto_88188 - BLOCK
      ?auto_88189 - BLOCK
      ?auto_88187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88183 ) ( not ( = ?auto_88183 ?auto_88184 ) ) ( not ( = ?auto_88183 ?auto_88185 ) ) ( not ( = ?auto_88183 ?auto_88186 ) ) ( not ( = ?auto_88184 ?auto_88185 ) ) ( not ( = ?auto_88184 ?auto_88186 ) ) ( not ( = ?auto_88185 ?auto_88186 ) ) ( ON ?auto_88186 ?auto_88188 ) ( not ( = ?auto_88183 ?auto_88188 ) ) ( not ( = ?auto_88184 ?auto_88188 ) ) ( not ( = ?auto_88185 ?auto_88188 ) ) ( not ( = ?auto_88186 ?auto_88188 ) ) ( ON ?auto_88185 ?auto_88186 ) ( CLEAR ?auto_88185 ) ( ON-TABLE ?auto_88189 ) ( ON ?auto_88187 ?auto_88189 ) ( ON ?auto_88188 ?auto_88187 ) ( not ( = ?auto_88189 ?auto_88187 ) ) ( not ( = ?auto_88189 ?auto_88188 ) ) ( not ( = ?auto_88189 ?auto_88186 ) ) ( not ( = ?auto_88189 ?auto_88185 ) ) ( not ( = ?auto_88187 ?auto_88188 ) ) ( not ( = ?auto_88187 ?auto_88186 ) ) ( not ( = ?auto_88187 ?auto_88185 ) ) ( not ( = ?auto_88183 ?auto_88189 ) ) ( not ( = ?auto_88183 ?auto_88187 ) ) ( not ( = ?auto_88184 ?auto_88189 ) ) ( not ( = ?auto_88184 ?auto_88187 ) ) ( HOLDING ?auto_88184 ) ( CLEAR ?auto_88183 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88183 ?auto_88184 )
      ( MAKE-4PILE ?auto_88183 ?auto_88184 ?auto_88185 ?auto_88186 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88190 - BLOCK
      ?auto_88191 - BLOCK
      ?auto_88192 - BLOCK
      ?auto_88193 - BLOCK
    )
    :vars
    (
      ?auto_88195 - BLOCK
      ?auto_88196 - BLOCK
      ?auto_88194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88190 ) ( not ( = ?auto_88190 ?auto_88191 ) ) ( not ( = ?auto_88190 ?auto_88192 ) ) ( not ( = ?auto_88190 ?auto_88193 ) ) ( not ( = ?auto_88191 ?auto_88192 ) ) ( not ( = ?auto_88191 ?auto_88193 ) ) ( not ( = ?auto_88192 ?auto_88193 ) ) ( ON ?auto_88193 ?auto_88195 ) ( not ( = ?auto_88190 ?auto_88195 ) ) ( not ( = ?auto_88191 ?auto_88195 ) ) ( not ( = ?auto_88192 ?auto_88195 ) ) ( not ( = ?auto_88193 ?auto_88195 ) ) ( ON ?auto_88192 ?auto_88193 ) ( ON-TABLE ?auto_88196 ) ( ON ?auto_88194 ?auto_88196 ) ( ON ?auto_88195 ?auto_88194 ) ( not ( = ?auto_88196 ?auto_88194 ) ) ( not ( = ?auto_88196 ?auto_88195 ) ) ( not ( = ?auto_88196 ?auto_88193 ) ) ( not ( = ?auto_88196 ?auto_88192 ) ) ( not ( = ?auto_88194 ?auto_88195 ) ) ( not ( = ?auto_88194 ?auto_88193 ) ) ( not ( = ?auto_88194 ?auto_88192 ) ) ( not ( = ?auto_88190 ?auto_88196 ) ) ( not ( = ?auto_88190 ?auto_88194 ) ) ( not ( = ?auto_88191 ?auto_88196 ) ) ( not ( = ?auto_88191 ?auto_88194 ) ) ( CLEAR ?auto_88190 ) ( ON ?auto_88191 ?auto_88192 ) ( CLEAR ?auto_88191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88196 ?auto_88194 ?auto_88195 ?auto_88193 ?auto_88192 )
      ( MAKE-4PILE ?auto_88190 ?auto_88191 ?auto_88192 ?auto_88193 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88197 - BLOCK
      ?auto_88198 - BLOCK
      ?auto_88199 - BLOCK
      ?auto_88200 - BLOCK
    )
    :vars
    (
      ?auto_88203 - BLOCK
      ?auto_88201 - BLOCK
      ?auto_88202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88197 ?auto_88198 ) ) ( not ( = ?auto_88197 ?auto_88199 ) ) ( not ( = ?auto_88197 ?auto_88200 ) ) ( not ( = ?auto_88198 ?auto_88199 ) ) ( not ( = ?auto_88198 ?auto_88200 ) ) ( not ( = ?auto_88199 ?auto_88200 ) ) ( ON ?auto_88200 ?auto_88203 ) ( not ( = ?auto_88197 ?auto_88203 ) ) ( not ( = ?auto_88198 ?auto_88203 ) ) ( not ( = ?auto_88199 ?auto_88203 ) ) ( not ( = ?auto_88200 ?auto_88203 ) ) ( ON ?auto_88199 ?auto_88200 ) ( ON-TABLE ?auto_88201 ) ( ON ?auto_88202 ?auto_88201 ) ( ON ?auto_88203 ?auto_88202 ) ( not ( = ?auto_88201 ?auto_88202 ) ) ( not ( = ?auto_88201 ?auto_88203 ) ) ( not ( = ?auto_88201 ?auto_88200 ) ) ( not ( = ?auto_88201 ?auto_88199 ) ) ( not ( = ?auto_88202 ?auto_88203 ) ) ( not ( = ?auto_88202 ?auto_88200 ) ) ( not ( = ?auto_88202 ?auto_88199 ) ) ( not ( = ?auto_88197 ?auto_88201 ) ) ( not ( = ?auto_88197 ?auto_88202 ) ) ( not ( = ?auto_88198 ?auto_88201 ) ) ( not ( = ?auto_88198 ?auto_88202 ) ) ( ON ?auto_88198 ?auto_88199 ) ( CLEAR ?auto_88198 ) ( HOLDING ?auto_88197 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88197 )
      ( MAKE-4PILE ?auto_88197 ?auto_88198 ?auto_88199 ?auto_88200 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88204 - BLOCK
      ?auto_88205 - BLOCK
      ?auto_88206 - BLOCK
      ?auto_88207 - BLOCK
    )
    :vars
    (
      ?auto_88210 - BLOCK
      ?auto_88208 - BLOCK
      ?auto_88209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88204 ?auto_88205 ) ) ( not ( = ?auto_88204 ?auto_88206 ) ) ( not ( = ?auto_88204 ?auto_88207 ) ) ( not ( = ?auto_88205 ?auto_88206 ) ) ( not ( = ?auto_88205 ?auto_88207 ) ) ( not ( = ?auto_88206 ?auto_88207 ) ) ( ON ?auto_88207 ?auto_88210 ) ( not ( = ?auto_88204 ?auto_88210 ) ) ( not ( = ?auto_88205 ?auto_88210 ) ) ( not ( = ?auto_88206 ?auto_88210 ) ) ( not ( = ?auto_88207 ?auto_88210 ) ) ( ON ?auto_88206 ?auto_88207 ) ( ON-TABLE ?auto_88208 ) ( ON ?auto_88209 ?auto_88208 ) ( ON ?auto_88210 ?auto_88209 ) ( not ( = ?auto_88208 ?auto_88209 ) ) ( not ( = ?auto_88208 ?auto_88210 ) ) ( not ( = ?auto_88208 ?auto_88207 ) ) ( not ( = ?auto_88208 ?auto_88206 ) ) ( not ( = ?auto_88209 ?auto_88210 ) ) ( not ( = ?auto_88209 ?auto_88207 ) ) ( not ( = ?auto_88209 ?auto_88206 ) ) ( not ( = ?auto_88204 ?auto_88208 ) ) ( not ( = ?auto_88204 ?auto_88209 ) ) ( not ( = ?auto_88205 ?auto_88208 ) ) ( not ( = ?auto_88205 ?auto_88209 ) ) ( ON ?auto_88205 ?auto_88206 ) ( ON ?auto_88204 ?auto_88205 ) ( CLEAR ?auto_88204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88208 ?auto_88209 ?auto_88210 ?auto_88207 ?auto_88206 ?auto_88205 )
      ( MAKE-4PILE ?auto_88204 ?auto_88205 ?auto_88206 ?auto_88207 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88215 - BLOCK
      ?auto_88216 - BLOCK
      ?auto_88217 - BLOCK
      ?auto_88218 - BLOCK
    )
    :vars
    (
      ?auto_88221 - BLOCK
      ?auto_88220 - BLOCK
      ?auto_88219 - BLOCK
      ?auto_88222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88215 ?auto_88216 ) ) ( not ( = ?auto_88215 ?auto_88217 ) ) ( not ( = ?auto_88215 ?auto_88218 ) ) ( not ( = ?auto_88216 ?auto_88217 ) ) ( not ( = ?auto_88216 ?auto_88218 ) ) ( not ( = ?auto_88217 ?auto_88218 ) ) ( ON ?auto_88218 ?auto_88221 ) ( not ( = ?auto_88215 ?auto_88221 ) ) ( not ( = ?auto_88216 ?auto_88221 ) ) ( not ( = ?auto_88217 ?auto_88221 ) ) ( not ( = ?auto_88218 ?auto_88221 ) ) ( ON ?auto_88217 ?auto_88218 ) ( ON-TABLE ?auto_88220 ) ( ON ?auto_88219 ?auto_88220 ) ( ON ?auto_88221 ?auto_88219 ) ( not ( = ?auto_88220 ?auto_88219 ) ) ( not ( = ?auto_88220 ?auto_88221 ) ) ( not ( = ?auto_88220 ?auto_88218 ) ) ( not ( = ?auto_88220 ?auto_88217 ) ) ( not ( = ?auto_88219 ?auto_88221 ) ) ( not ( = ?auto_88219 ?auto_88218 ) ) ( not ( = ?auto_88219 ?auto_88217 ) ) ( not ( = ?auto_88215 ?auto_88220 ) ) ( not ( = ?auto_88215 ?auto_88219 ) ) ( not ( = ?auto_88216 ?auto_88220 ) ) ( not ( = ?auto_88216 ?auto_88219 ) ) ( ON ?auto_88216 ?auto_88217 ) ( CLEAR ?auto_88216 ) ( ON ?auto_88215 ?auto_88222 ) ( CLEAR ?auto_88215 ) ( HAND-EMPTY ) ( not ( = ?auto_88215 ?auto_88222 ) ) ( not ( = ?auto_88216 ?auto_88222 ) ) ( not ( = ?auto_88217 ?auto_88222 ) ) ( not ( = ?auto_88218 ?auto_88222 ) ) ( not ( = ?auto_88221 ?auto_88222 ) ) ( not ( = ?auto_88220 ?auto_88222 ) ) ( not ( = ?auto_88219 ?auto_88222 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88215 ?auto_88222 )
      ( MAKE-4PILE ?auto_88215 ?auto_88216 ?auto_88217 ?auto_88218 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88223 - BLOCK
      ?auto_88224 - BLOCK
      ?auto_88225 - BLOCK
      ?auto_88226 - BLOCK
    )
    :vars
    (
      ?auto_88228 - BLOCK
      ?auto_88229 - BLOCK
      ?auto_88227 - BLOCK
      ?auto_88230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88223 ?auto_88224 ) ) ( not ( = ?auto_88223 ?auto_88225 ) ) ( not ( = ?auto_88223 ?auto_88226 ) ) ( not ( = ?auto_88224 ?auto_88225 ) ) ( not ( = ?auto_88224 ?auto_88226 ) ) ( not ( = ?auto_88225 ?auto_88226 ) ) ( ON ?auto_88226 ?auto_88228 ) ( not ( = ?auto_88223 ?auto_88228 ) ) ( not ( = ?auto_88224 ?auto_88228 ) ) ( not ( = ?auto_88225 ?auto_88228 ) ) ( not ( = ?auto_88226 ?auto_88228 ) ) ( ON ?auto_88225 ?auto_88226 ) ( ON-TABLE ?auto_88229 ) ( ON ?auto_88227 ?auto_88229 ) ( ON ?auto_88228 ?auto_88227 ) ( not ( = ?auto_88229 ?auto_88227 ) ) ( not ( = ?auto_88229 ?auto_88228 ) ) ( not ( = ?auto_88229 ?auto_88226 ) ) ( not ( = ?auto_88229 ?auto_88225 ) ) ( not ( = ?auto_88227 ?auto_88228 ) ) ( not ( = ?auto_88227 ?auto_88226 ) ) ( not ( = ?auto_88227 ?auto_88225 ) ) ( not ( = ?auto_88223 ?auto_88229 ) ) ( not ( = ?auto_88223 ?auto_88227 ) ) ( not ( = ?auto_88224 ?auto_88229 ) ) ( not ( = ?auto_88224 ?auto_88227 ) ) ( ON ?auto_88223 ?auto_88230 ) ( CLEAR ?auto_88223 ) ( not ( = ?auto_88223 ?auto_88230 ) ) ( not ( = ?auto_88224 ?auto_88230 ) ) ( not ( = ?auto_88225 ?auto_88230 ) ) ( not ( = ?auto_88226 ?auto_88230 ) ) ( not ( = ?auto_88228 ?auto_88230 ) ) ( not ( = ?auto_88229 ?auto_88230 ) ) ( not ( = ?auto_88227 ?auto_88230 ) ) ( HOLDING ?auto_88224 ) ( CLEAR ?auto_88225 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88229 ?auto_88227 ?auto_88228 ?auto_88226 ?auto_88225 ?auto_88224 )
      ( MAKE-4PILE ?auto_88223 ?auto_88224 ?auto_88225 ?auto_88226 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88231 - BLOCK
      ?auto_88232 - BLOCK
      ?auto_88233 - BLOCK
      ?auto_88234 - BLOCK
    )
    :vars
    (
      ?auto_88237 - BLOCK
      ?auto_88238 - BLOCK
      ?auto_88235 - BLOCK
      ?auto_88236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88231 ?auto_88232 ) ) ( not ( = ?auto_88231 ?auto_88233 ) ) ( not ( = ?auto_88231 ?auto_88234 ) ) ( not ( = ?auto_88232 ?auto_88233 ) ) ( not ( = ?auto_88232 ?auto_88234 ) ) ( not ( = ?auto_88233 ?auto_88234 ) ) ( ON ?auto_88234 ?auto_88237 ) ( not ( = ?auto_88231 ?auto_88237 ) ) ( not ( = ?auto_88232 ?auto_88237 ) ) ( not ( = ?auto_88233 ?auto_88237 ) ) ( not ( = ?auto_88234 ?auto_88237 ) ) ( ON ?auto_88233 ?auto_88234 ) ( ON-TABLE ?auto_88238 ) ( ON ?auto_88235 ?auto_88238 ) ( ON ?auto_88237 ?auto_88235 ) ( not ( = ?auto_88238 ?auto_88235 ) ) ( not ( = ?auto_88238 ?auto_88237 ) ) ( not ( = ?auto_88238 ?auto_88234 ) ) ( not ( = ?auto_88238 ?auto_88233 ) ) ( not ( = ?auto_88235 ?auto_88237 ) ) ( not ( = ?auto_88235 ?auto_88234 ) ) ( not ( = ?auto_88235 ?auto_88233 ) ) ( not ( = ?auto_88231 ?auto_88238 ) ) ( not ( = ?auto_88231 ?auto_88235 ) ) ( not ( = ?auto_88232 ?auto_88238 ) ) ( not ( = ?auto_88232 ?auto_88235 ) ) ( ON ?auto_88231 ?auto_88236 ) ( not ( = ?auto_88231 ?auto_88236 ) ) ( not ( = ?auto_88232 ?auto_88236 ) ) ( not ( = ?auto_88233 ?auto_88236 ) ) ( not ( = ?auto_88234 ?auto_88236 ) ) ( not ( = ?auto_88237 ?auto_88236 ) ) ( not ( = ?auto_88238 ?auto_88236 ) ) ( not ( = ?auto_88235 ?auto_88236 ) ) ( CLEAR ?auto_88233 ) ( ON ?auto_88232 ?auto_88231 ) ( CLEAR ?auto_88232 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88236 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88236 ?auto_88231 )
      ( MAKE-4PILE ?auto_88231 ?auto_88232 ?auto_88233 ?auto_88234 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88239 - BLOCK
      ?auto_88240 - BLOCK
      ?auto_88241 - BLOCK
      ?auto_88242 - BLOCK
    )
    :vars
    (
      ?auto_88246 - BLOCK
      ?auto_88243 - BLOCK
      ?auto_88245 - BLOCK
      ?auto_88244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88239 ?auto_88240 ) ) ( not ( = ?auto_88239 ?auto_88241 ) ) ( not ( = ?auto_88239 ?auto_88242 ) ) ( not ( = ?auto_88240 ?auto_88241 ) ) ( not ( = ?auto_88240 ?auto_88242 ) ) ( not ( = ?auto_88241 ?auto_88242 ) ) ( ON ?auto_88242 ?auto_88246 ) ( not ( = ?auto_88239 ?auto_88246 ) ) ( not ( = ?auto_88240 ?auto_88246 ) ) ( not ( = ?auto_88241 ?auto_88246 ) ) ( not ( = ?auto_88242 ?auto_88246 ) ) ( ON-TABLE ?auto_88243 ) ( ON ?auto_88245 ?auto_88243 ) ( ON ?auto_88246 ?auto_88245 ) ( not ( = ?auto_88243 ?auto_88245 ) ) ( not ( = ?auto_88243 ?auto_88246 ) ) ( not ( = ?auto_88243 ?auto_88242 ) ) ( not ( = ?auto_88243 ?auto_88241 ) ) ( not ( = ?auto_88245 ?auto_88246 ) ) ( not ( = ?auto_88245 ?auto_88242 ) ) ( not ( = ?auto_88245 ?auto_88241 ) ) ( not ( = ?auto_88239 ?auto_88243 ) ) ( not ( = ?auto_88239 ?auto_88245 ) ) ( not ( = ?auto_88240 ?auto_88243 ) ) ( not ( = ?auto_88240 ?auto_88245 ) ) ( ON ?auto_88239 ?auto_88244 ) ( not ( = ?auto_88239 ?auto_88244 ) ) ( not ( = ?auto_88240 ?auto_88244 ) ) ( not ( = ?auto_88241 ?auto_88244 ) ) ( not ( = ?auto_88242 ?auto_88244 ) ) ( not ( = ?auto_88246 ?auto_88244 ) ) ( not ( = ?auto_88243 ?auto_88244 ) ) ( not ( = ?auto_88245 ?auto_88244 ) ) ( ON ?auto_88240 ?auto_88239 ) ( CLEAR ?auto_88240 ) ( ON-TABLE ?auto_88244 ) ( HOLDING ?auto_88241 ) ( CLEAR ?auto_88242 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88243 ?auto_88245 ?auto_88246 ?auto_88242 ?auto_88241 )
      ( MAKE-4PILE ?auto_88239 ?auto_88240 ?auto_88241 ?auto_88242 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88247 - BLOCK
      ?auto_88248 - BLOCK
      ?auto_88249 - BLOCK
      ?auto_88250 - BLOCK
    )
    :vars
    (
      ?auto_88252 - BLOCK
      ?auto_88251 - BLOCK
      ?auto_88254 - BLOCK
      ?auto_88253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88247 ?auto_88248 ) ) ( not ( = ?auto_88247 ?auto_88249 ) ) ( not ( = ?auto_88247 ?auto_88250 ) ) ( not ( = ?auto_88248 ?auto_88249 ) ) ( not ( = ?auto_88248 ?auto_88250 ) ) ( not ( = ?auto_88249 ?auto_88250 ) ) ( ON ?auto_88250 ?auto_88252 ) ( not ( = ?auto_88247 ?auto_88252 ) ) ( not ( = ?auto_88248 ?auto_88252 ) ) ( not ( = ?auto_88249 ?auto_88252 ) ) ( not ( = ?auto_88250 ?auto_88252 ) ) ( ON-TABLE ?auto_88251 ) ( ON ?auto_88254 ?auto_88251 ) ( ON ?auto_88252 ?auto_88254 ) ( not ( = ?auto_88251 ?auto_88254 ) ) ( not ( = ?auto_88251 ?auto_88252 ) ) ( not ( = ?auto_88251 ?auto_88250 ) ) ( not ( = ?auto_88251 ?auto_88249 ) ) ( not ( = ?auto_88254 ?auto_88252 ) ) ( not ( = ?auto_88254 ?auto_88250 ) ) ( not ( = ?auto_88254 ?auto_88249 ) ) ( not ( = ?auto_88247 ?auto_88251 ) ) ( not ( = ?auto_88247 ?auto_88254 ) ) ( not ( = ?auto_88248 ?auto_88251 ) ) ( not ( = ?auto_88248 ?auto_88254 ) ) ( ON ?auto_88247 ?auto_88253 ) ( not ( = ?auto_88247 ?auto_88253 ) ) ( not ( = ?auto_88248 ?auto_88253 ) ) ( not ( = ?auto_88249 ?auto_88253 ) ) ( not ( = ?auto_88250 ?auto_88253 ) ) ( not ( = ?auto_88252 ?auto_88253 ) ) ( not ( = ?auto_88251 ?auto_88253 ) ) ( not ( = ?auto_88254 ?auto_88253 ) ) ( ON ?auto_88248 ?auto_88247 ) ( ON-TABLE ?auto_88253 ) ( CLEAR ?auto_88250 ) ( ON ?auto_88249 ?auto_88248 ) ( CLEAR ?auto_88249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88253 ?auto_88247 ?auto_88248 )
      ( MAKE-4PILE ?auto_88247 ?auto_88248 ?auto_88249 ?auto_88250 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88255 - BLOCK
      ?auto_88256 - BLOCK
      ?auto_88257 - BLOCK
      ?auto_88258 - BLOCK
    )
    :vars
    (
      ?auto_88260 - BLOCK
      ?auto_88262 - BLOCK
      ?auto_88261 - BLOCK
      ?auto_88259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88255 ?auto_88256 ) ) ( not ( = ?auto_88255 ?auto_88257 ) ) ( not ( = ?auto_88255 ?auto_88258 ) ) ( not ( = ?auto_88256 ?auto_88257 ) ) ( not ( = ?auto_88256 ?auto_88258 ) ) ( not ( = ?auto_88257 ?auto_88258 ) ) ( not ( = ?auto_88255 ?auto_88260 ) ) ( not ( = ?auto_88256 ?auto_88260 ) ) ( not ( = ?auto_88257 ?auto_88260 ) ) ( not ( = ?auto_88258 ?auto_88260 ) ) ( ON-TABLE ?auto_88262 ) ( ON ?auto_88261 ?auto_88262 ) ( ON ?auto_88260 ?auto_88261 ) ( not ( = ?auto_88262 ?auto_88261 ) ) ( not ( = ?auto_88262 ?auto_88260 ) ) ( not ( = ?auto_88262 ?auto_88258 ) ) ( not ( = ?auto_88262 ?auto_88257 ) ) ( not ( = ?auto_88261 ?auto_88260 ) ) ( not ( = ?auto_88261 ?auto_88258 ) ) ( not ( = ?auto_88261 ?auto_88257 ) ) ( not ( = ?auto_88255 ?auto_88262 ) ) ( not ( = ?auto_88255 ?auto_88261 ) ) ( not ( = ?auto_88256 ?auto_88262 ) ) ( not ( = ?auto_88256 ?auto_88261 ) ) ( ON ?auto_88255 ?auto_88259 ) ( not ( = ?auto_88255 ?auto_88259 ) ) ( not ( = ?auto_88256 ?auto_88259 ) ) ( not ( = ?auto_88257 ?auto_88259 ) ) ( not ( = ?auto_88258 ?auto_88259 ) ) ( not ( = ?auto_88260 ?auto_88259 ) ) ( not ( = ?auto_88262 ?auto_88259 ) ) ( not ( = ?auto_88261 ?auto_88259 ) ) ( ON ?auto_88256 ?auto_88255 ) ( ON-TABLE ?auto_88259 ) ( ON ?auto_88257 ?auto_88256 ) ( CLEAR ?auto_88257 ) ( HOLDING ?auto_88258 ) ( CLEAR ?auto_88260 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88262 ?auto_88261 ?auto_88260 ?auto_88258 )
      ( MAKE-4PILE ?auto_88255 ?auto_88256 ?auto_88257 ?auto_88258 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88263 - BLOCK
      ?auto_88264 - BLOCK
      ?auto_88265 - BLOCK
      ?auto_88266 - BLOCK
    )
    :vars
    (
      ?auto_88269 - BLOCK
      ?auto_88267 - BLOCK
      ?auto_88268 - BLOCK
      ?auto_88270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88263 ?auto_88264 ) ) ( not ( = ?auto_88263 ?auto_88265 ) ) ( not ( = ?auto_88263 ?auto_88266 ) ) ( not ( = ?auto_88264 ?auto_88265 ) ) ( not ( = ?auto_88264 ?auto_88266 ) ) ( not ( = ?auto_88265 ?auto_88266 ) ) ( not ( = ?auto_88263 ?auto_88269 ) ) ( not ( = ?auto_88264 ?auto_88269 ) ) ( not ( = ?auto_88265 ?auto_88269 ) ) ( not ( = ?auto_88266 ?auto_88269 ) ) ( ON-TABLE ?auto_88267 ) ( ON ?auto_88268 ?auto_88267 ) ( ON ?auto_88269 ?auto_88268 ) ( not ( = ?auto_88267 ?auto_88268 ) ) ( not ( = ?auto_88267 ?auto_88269 ) ) ( not ( = ?auto_88267 ?auto_88266 ) ) ( not ( = ?auto_88267 ?auto_88265 ) ) ( not ( = ?auto_88268 ?auto_88269 ) ) ( not ( = ?auto_88268 ?auto_88266 ) ) ( not ( = ?auto_88268 ?auto_88265 ) ) ( not ( = ?auto_88263 ?auto_88267 ) ) ( not ( = ?auto_88263 ?auto_88268 ) ) ( not ( = ?auto_88264 ?auto_88267 ) ) ( not ( = ?auto_88264 ?auto_88268 ) ) ( ON ?auto_88263 ?auto_88270 ) ( not ( = ?auto_88263 ?auto_88270 ) ) ( not ( = ?auto_88264 ?auto_88270 ) ) ( not ( = ?auto_88265 ?auto_88270 ) ) ( not ( = ?auto_88266 ?auto_88270 ) ) ( not ( = ?auto_88269 ?auto_88270 ) ) ( not ( = ?auto_88267 ?auto_88270 ) ) ( not ( = ?auto_88268 ?auto_88270 ) ) ( ON ?auto_88264 ?auto_88263 ) ( ON-TABLE ?auto_88270 ) ( ON ?auto_88265 ?auto_88264 ) ( CLEAR ?auto_88269 ) ( ON ?auto_88266 ?auto_88265 ) ( CLEAR ?auto_88266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88270 ?auto_88263 ?auto_88264 ?auto_88265 )
      ( MAKE-4PILE ?auto_88263 ?auto_88264 ?auto_88265 ?auto_88266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88271 - BLOCK
      ?auto_88272 - BLOCK
      ?auto_88273 - BLOCK
      ?auto_88274 - BLOCK
    )
    :vars
    (
      ?auto_88275 - BLOCK
      ?auto_88276 - BLOCK
      ?auto_88277 - BLOCK
      ?auto_88278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88271 ?auto_88272 ) ) ( not ( = ?auto_88271 ?auto_88273 ) ) ( not ( = ?auto_88271 ?auto_88274 ) ) ( not ( = ?auto_88272 ?auto_88273 ) ) ( not ( = ?auto_88272 ?auto_88274 ) ) ( not ( = ?auto_88273 ?auto_88274 ) ) ( not ( = ?auto_88271 ?auto_88275 ) ) ( not ( = ?auto_88272 ?auto_88275 ) ) ( not ( = ?auto_88273 ?auto_88275 ) ) ( not ( = ?auto_88274 ?auto_88275 ) ) ( ON-TABLE ?auto_88276 ) ( ON ?auto_88277 ?auto_88276 ) ( not ( = ?auto_88276 ?auto_88277 ) ) ( not ( = ?auto_88276 ?auto_88275 ) ) ( not ( = ?auto_88276 ?auto_88274 ) ) ( not ( = ?auto_88276 ?auto_88273 ) ) ( not ( = ?auto_88277 ?auto_88275 ) ) ( not ( = ?auto_88277 ?auto_88274 ) ) ( not ( = ?auto_88277 ?auto_88273 ) ) ( not ( = ?auto_88271 ?auto_88276 ) ) ( not ( = ?auto_88271 ?auto_88277 ) ) ( not ( = ?auto_88272 ?auto_88276 ) ) ( not ( = ?auto_88272 ?auto_88277 ) ) ( ON ?auto_88271 ?auto_88278 ) ( not ( = ?auto_88271 ?auto_88278 ) ) ( not ( = ?auto_88272 ?auto_88278 ) ) ( not ( = ?auto_88273 ?auto_88278 ) ) ( not ( = ?auto_88274 ?auto_88278 ) ) ( not ( = ?auto_88275 ?auto_88278 ) ) ( not ( = ?auto_88276 ?auto_88278 ) ) ( not ( = ?auto_88277 ?auto_88278 ) ) ( ON ?auto_88272 ?auto_88271 ) ( ON-TABLE ?auto_88278 ) ( ON ?auto_88273 ?auto_88272 ) ( ON ?auto_88274 ?auto_88273 ) ( CLEAR ?auto_88274 ) ( HOLDING ?auto_88275 ) ( CLEAR ?auto_88277 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88276 ?auto_88277 ?auto_88275 )
      ( MAKE-4PILE ?auto_88271 ?auto_88272 ?auto_88273 ?auto_88274 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88279 - BLOCK
      ?auto_88280 - BLOCK
      ?auto_88281 - BLOCK
      ?auto_88282 - BLOCK
    )
    :vars
    (
      ?auto_88283 - BLOCK
      ?auto_88284 - BLOCK
      ?auto_88286 - BLOCK
      ?auto_88285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88279 ?auto_88280 ) ) ( not ( = ?auto_88279 ?auto_88281 ) ) ( not ( = ?auto_88279 ?auto_88282 ) ) ( not ( = ?auto_88280 ?auto_88281 ) ) ( not ( = ?auto_88280 ?auto_88282 ) ) ( not ( = ?auto_88281 ?auto_88282 ) ) ( not ( = ?auto_88279 ?auto_88283 ) ) ( not ( = ?auto_88280 ?auto_88283 ) ) ( not ( = ?auto_88281 ?auto_88283 ) ) ( not ( = ?auto_88282 ?auto_88283 ) ) ( ON-TABLE ?auto_88284 ) ( ON ?auto_88286 ?auto_88284 ) ( not ( = ?auto_88284 ?auto_88286 ) ) ( not ( = ?auto_88284 ?auto_88283 ) ) ( not ( = ?auto_88284 ?auto_88282 ) ) ( not ( = ?auto_88284 ?auto_88281 ) ) ( not ( = ?auto_88286 ?auto_88283 ) ) ( not ( = ?auto_88286 ?auto_88282 ) ) ( not ( = ?auto_88286 ?auto_88281 ) ) ( not ( = ?auto_88279 ?auto_88284 ) ) ( not ( = ?auto_88279 ?auto_88286 ) ) ( not ( = ?auto_88280 ?auto_88284 ) ) ( not ( = ?auto_88280 ?auto_88286 ) ) ( ON ?auto_88279 ?auto_88285 ) ( not ( = ?auto_88279 ?auto_88285 ) ) ( not ( = ?auto_88280 ?auto_88285 ) ) ( not ( = ?auto_88281 ?auto_88285 ) ) ( not ( = ?auto_88282 ?auto_88285 ) ) ( not ( = ?auto_88283 ?auto_88285 ) ) ( not ( = ?auto_88284 ?auto_88285 ) ) ( not ( = ?auto_88286 ?auto_88285 ) ) ( ON ?auto_88280 ?auto_88279 ) ( ON-TABLE ?auto_88285 ) ( ON ?auto_88281 ?auto_88280 ) ( ON ?auto_88282 ?auto_88281 ) ( CLEAR ?auto_88286 ) ( ON ?auto_88283 ?auto_88282 ) ( CLEAR ?auto_88283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88285 ?auto_88279 ?auto_88280 ?auto_88281 ?auto_88282 )
      ( MAKE-4PILE ?auto_88279 ?auto_88280 ?auto_88281 ?auto_88282 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88287 - BLOCK
      ?auto_88288 - BLOCK
      ?auto_88289 - BLOCK
      ?auto_88290 - BLOCK
    )
    :vars
    (
      ?auto_88292 - BLOCK
      ?auto_88293 - BLOCK
      ?auto_88294 - BLOCK
      ?auto_88291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88287 ?auto_88288 ) ) ( not ( = ?auto_88287 ?auto_88289 ) ) ( not ( = ?auto_88287 ?auto_88290 ) ) ( not ( = ?auto_88288 ?auto_88289 ) ) ( not ( = ?auto_88288 ?auto_88290 ) ) ( not ( = ?auto_88289 ?auto_88290 ) ) ( not ( = ?auto_88287 ?auto_88292 ) ) ( not ( = ?auto_88288 ?auto_88292 ) ) ( not ( = ?auto_88289 ?auto_88292 ) ) ( not ( = ?auto_88290 ?auto_88292 ) ) ( ON-TABLE ?auto_88293 ) ( not ( = ?auto_88293 ?auto_88294 ) ) ( not ( = ?auto_88293 ?auto_88292 ) ) ( not ( = ?auto_88293 ?auto_88290 ) ) ( not ( = ?auto_88293 ?auto_88289 ) ) ( not ( = ?auto_88294 ?auto_88292 ) ) ( not ( = ?auto_88294 ?auto_88290 ) ) ( not ( = ?auto_88294 ?auto_88289 ) ) ( not ( = ?auto_88287 ?auto_88293 ) ) ( not ( = ?auto_88287 ?auto_88294 ) ) ( not ( = ?auto_88288 ?auto_88293 ) ) ( not ( = ?auto_88288 ?auto_88294 ) ) ( ON ?auto_88287 ?auto_88291 ) ( not ( = ?auto_88287 ?auto_88291 ) ) ( not ( = ?auto_88288 ?auto_88291 ) ) ( not ( = ?auto_88289 ?auto_88291 ) ) ( not ( = ?auto_88290 ?auto_88291 ) ) ( not ( = ?auto_88292 ?auto_88291 ) ) ( not ( = ?auto_88293 ?auto_88291 ) ) ( not ( = ?auto_88294 ?auto_88291 ) ) ( ON ?auto_88288 ?auto_88287 ) ( ON-TABLE ?auto_88291 ) ( ON ?auto_88289 ?auto_88288 ) ( ON ?auto_88290 ?auto_88289 ) ( ON ?auto_88292 ?auto_88290 ) ( CLEAR ?auto_88292 ) ( HOLDING ?auto_88294 ) ( CLEAR ?auto_88293 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88293 ?auto_88294 )
      ( MAKE-4PILE ?auto_88287 ?auto_88288 ?auto_88289 ?auto_88290 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88295 - BLOCK
      ?auto_88296 - BLOCK
      ?auto_88297 - BLOCK
      ?auto_88298 - BLOCK
    )
    :vars
    (
      ?auto_88300 - BLOCK
      ?auto_88299 - BLOCK
      ?auto_88301 - BLOCK
      ?auto_88302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88295 ?auto_88296 ) ) ( not ( = ?auto_88295 ?auto_88297 ) ) ( not ( = ?auto_88295 ?auto_88298 ) ) ( not ( = ?auto_88296 ?auto_88297 ) ) ( not ( = ?auto_88296 ?auto_88298 ) ) ( not ( = ?auto_88297 ?auto_88298 ) ) ( not ( = ?auto_88295 ?auto_88300 ) ) ( not ( = ?auto_88296 ?auto_88300 ) ) ( not ( = ?auto_88297 ?auto_88300 ) ) ( not ( = ?auto_88298 ?auto_88300 ) ) ( ON-TABLE ?auto_88299 ) ( not ( = ?auto_88299 ?auto_88301 ) ) ( not ( = ?auto_88299 ?auto_88300 ) ) ( not ( = ?auto_88299 ?auto_88298 ) ) ( not ( = ?auto_88299 ?auto_88297 ) ) ( not ( = ?auto_88301 ?auto_88300 ) ) ( not ( = ?auto_88301 ?auto_88298 ) ) ( not ( = ?auto_88301 ?auto_88297 ) ) ( not ( = ?auto_88295 ?auto_88299 ) ) ( not ( = ?auto_88295 ?auto_88301 ) ) ( not ( = ?auto_88296 ?auto_88299 ) ) ( not ( = ?auto_88296 ?auto_88301 ) ) ( ON ?auto_88295 ?auto_88302 ) ( not ( = ?auto_88295 ?auto_88302 ) ) ( not ( = ?auto_88296 ?auto_88302 ) ) ( not ( = ?auto_88297 ?auto_88302 ) ) ( not ( = ?auto_88298 ?auto_88302 ) ) ( not ( = ?auto_88300 ?auto_88302 ) ) ( not ( = ?auto_88299 ?auto_88302 ) ) ( not ( = ?auto_88301 ?auto_88302 ) ) ( ON ?auto_88296 ?auto_88295 ) ( ON-TABLE ?auto_88302 ) ( ON ?auto_88297 ?auto_88296 ) ( ON ?auto_88298 ?auto_88297 ) ( ON ?auto_88300 ?auto_88298 ) ( CLEAR ?auto_88299 ) ( ON ?auto_88301 ?auto_88300 ) ( CLEAR ?auto_88301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88302 ?auto_88295 ?auto_88296 ?auto_88297 ?auto_88298 ?auto_88300 )
      ( MAKE-4PILE ?auto_88295 ?auto_88296 ?auto_88297 ?auto_88298 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88303 - BLOCK
      ?auto_88304 - BLOCK
      ?auto_88305 - BLOCK
      ?auto_88306 - BLOCK
    )
    :vars
    (
      ?auto_88310 - BLOCK
      ?auto_88307 - BLOCK
      ?auto_88309 - BLOCK
      ?auto_88308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88303 ?auto_88304 ) ) ( not ( = ?auto_88303 ?auto_88305 ) ) ( not ( = ?auto_88303 ?auto_88306 ) ) ( not ( = ?auto_88304 ?auto_88305 ) ) ( not ( = ?auto_88304 ?auto_88306 ) ) ( not ( = ?auto_88305 ?auto_88306 ) ) ( not ( = ?auto_88303 ?auto_88310 ) ) ( not ( = ?auto_88304 ?auto_88310 ) ) ( not ( = ?auto_88305 ?auto_88310 ) ) ( not ( = ?auto_88306 ?auto_88310 ) ) ( not ( = ?auto_88307 ?auto_88309 ) ) ( not ( = ?auto_88307 ?auto_88310 ) ) ( not ( = ?auto_88307 ?auto_88306 ) ) ( not ( = ?auto_88307 ?auto_88305 ) ) ( not ( = ?auto_88309 ?auto_88310 ) ) ( not ( = ?auto_88309 ?auto_88306 ) ) ( not ( = ?auto_88309 ?auto_88305 ) ) ( not ( = ?auto_88303 ?auto_88307 ) ) ( not ( = ?auto_88303 ?auto_88309 ) ) ( not ( = ?auto_88304 ?auto_88307 ) ) ( not ( = ?auto_88304 ?auto_88309 ) ) ( ON ?auto_88303 ?auto_88308 ) ( not ( = ?auto_88303 ?auto_88308 ) ) ( not ( = ?auto_88304 ?auto_88308 ) ) ( not ( = ?auto_88305 ?auto_88308 ) ) ( not ( = ?auto_88306 ?auto_88308 ) ) ( not ( = ?auto_88310 ?auto_88308 ) ) ( not ( = ?auto_88307 ?auto_88308 ) ) ( not ( = ?auto_88309 ?auto_88308 ) ) ( ON ?auto_88304 ?auto_88303 ) ( ON-TABLE ?auto_88308 ) ( ON ?auto_88305 ?auto_88304 ) ( ON ?auto_88306 ?auto_88305 ) ( ON ?auto_88310 ?auto_88306 ) ( ON ?auto_88309 ?auto_88310 ) ( CLEAR ?auto_88309 ) ( HOLDING ?auto_88307 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88307 )
      ( MAKE-4PILE ?auto_88303 ?auto_88304 ?auto_88305 ?auto_88306 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_88311 - BLOCK
      ?auto_88312 - BLOCK
      ?auto_88313 - BLOCK
      ?auto_88314 - BLOCK
    )
    :vars
    (
      ?auto_88315 - BLOCK
      ?auto_88318 - BLOCK
      ?auto_88317 - BLOCK
      ?auto_88316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88311 ?auto_88312 ) ) ( not ( = ?auto_88311 ?auto_88313 ) ) ( not ( = ?auto_88311 ?auto_88314 ) ) ( not ( = ?auto_88312 ?auto_88313 ) ) ( not ( = ?auto_88312 ?auto_88314 ) ) ( not ( = ?auto_88313 ?auto_88314 ) ) ( not ( = ?auto_88311 ?auto_88315 ) ) ( not ( = ?auto_88312 ?auto_88315 ) ) ( not ( = ?auto_88313 ?auto_88315 ) ) ( not ( = ?auto_88314 ?auto_88315 ) ) ( not ( = ?auto_88318 ?auto_88317 ) ) ( not ( = ?auto_88318 ?auto_88315 ) ) ( not ( = ?auto_88318 ?auto_88314 ) ) ( not ( = ?auto_88318 ?auto_88313 ) ) ( not ( = ?auto_88317 ?auto_88315 ) ) ( not ( = ?auto_88317 ?auto_88314 ) ) ( not ( = ?auto_88317 ?auto_88313 ) ) ( not ( = ?auto_88311 ?auto_88318 ) ) ( not ( = ?auto_88311 ?auto_88317 ) ) ( not ( = ?auto_88312 ?auto_88318 ) ) ( not ( = ?auto_88312 ?auto_88317 ) ) ( ON ?auto_88311 ?auto_88316 ) ( not ( = ?auto_88311 ?auto_88316 ) ) ( not ( = ?auto_88312 ?auto_88316 ) ) ( not ( = ?auto_88313 ?auto_88316 ) ) ( not ( = ?auto_88314 ?auto_88316 ) ) ( not ( = ?auto_88315 ?auto_88316 ) ) ( not ( = ?auto_88318 ?auto_88316 ) ) ( not ( = ?auto_88317 ?auto_88316 ) ) ( ON ?auto_88312 ?auto_88311 ) ( ON-TABLE ?auto_88316 ) ( ON ?auto_88313 ?auto_88312 ) ( ON ?auto_88314 ?auto_88313 ) ( ON ?auto_88315 ?auto_88314 ) ( ON ?auto_88317 ?auto_88315 ) ( ON ?auto_88318 ?auto_88317 ) ( CLEAR ?auto_88318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88316 ?auto_88311 ?auto_88312 ?auto_88313 ?auto_88314 ?auto_88315 ?auto_88317 )
      ( MAKE-4PILE ?auto_88311 ?auto_88312 ?auto_88313 ?auto_88314 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88334 - BLOCK
      ?auto_88335 - BLOCK
    )
    :vars
    (
      ?auto_88338 - BLOCK
      ?auto_88336 - BLOCK
      ?auto_88337 - BLOCK
      ?auto_88339 - BLOCK
      ?auto_88340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88338 ?auto_88335 ) ( ON-TABLE ?auto_88334 ) ( ON ?auto_88335 ?auto_88334 ) ( not ( = ?auto_88334 ?auto_88335 ) ) ( not ( = ?auto_88334 ?auto_88338 ) ) ( not ( = ?auto_88335 ?auto_88338 ) ) ( not ( = ?auto_88334 ?auto_88336 ) ) ( not ( = ?auto_88334 ?auto_88337 ) ) ( not ( = ?auto_88335 ?auto_88336 ) ) ( not ( = ?auto_88335 ?auto_88337 ) ) ( not ( = ?auto_88338 ?auto_88336 ) ) ( not ( = ?auto_88338 ?auto_88337 ) ) ( not ( = ?auto_88336 ?auto_88337 ) ) ( ON ?auto_88336 ?auto_88338 ) ( CLEAR ?auto_88336 ) ( HOLDING ?auto_88337 ) ( CLEAR ?auto_88339 ) ( ON-TABLE ?auto_88340 ) ( ON ?auto_88339 ?auto_88340 ) ( not ( = ?auto_88340 ?auto_88339 ) ) ( not ( = ?auto_88340 ?auto_88337 ) ) ( not ( = ?auto_88339 ?auto_88337 ) ) ( not ( = ?auto_88334 ?auto_88339 ) ) ( not ( = ?auto_88334 ?auto_88340 ) ) ( not ( = ?auto_88335 ?auto_88339 ) ) ( not ( = ?auto_88335 ?auto_88340 ) ) ( not ( = ?auto_88338 ?auto_88339 ) ) ( not ( = ?auto_88338 ?auto_88340 ) ) ( not ( = ?auto_88336 ?auto_88339 ) ) ( not ( = ?auto_88336 ?auto_88340 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88340 ?auto_88339 ?auto_88337 )
      ( MAKE-2PILE ?auto_88334 ?auto_88335 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88341 - BLOCK
      ?auto_88342 - BLOCK
    )
    :vars
    (
      ?auto_88346 - BLOCK
      ?auto_88345 - BLOCK
      ?auto_88343 - BLOCK
      ?auto_88347 - BLOCK
      ?auto_88344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88346 ?auto_88342 ) ( ON-TABLE ?auto_88341 ) ( ON ?auto_88342 ?auto_88341 ) ( not ( = ?auto_88341 ?auto_88342 ) ) ( not ( = ?auto_88341 ?auto_88346 ) ) ( not ( = ?auto_88342 ?auto_88346 ) ) ( not ( = ?auto_88341 ?auto_88345 ) ) ( not ( = ?auto_88341 ?auto_88343 ) ) ( not ( = ?auto_88342 ?auto_88345 ) ) ( not ( = ?auto_88342 ?auto_88343 ) ) ( not ( = ?auto_88346 ?auto_88345 ) ) ( not ( = ?auto_88346 ?auto_88343 ) ) ( not ( = ?auto_88345 ?auto_88343 ) ) ( ON ?auto_88345 ?auto_88346 ) ( CLEAR ?auto_88347 ) ( ON-TABLE ?auto_88344 ) ( ON ?auto_88347 ?auto_88344 ) ( not ( = ?auto_88344 ?auto_88347 ) ) ( not ( = ?auto_88344 ?auto_88343 ) ) ( not ( = ?auto_88347 ?auto_88343 ) ) ( not ( = ?auto_88341 ?auto_88347 ) ) ( not ( = ?auto_88341 ?auto_88344 ) ) ( not ( = ?auto_88342 ?auto_88347 ) ) ( not ( = ?auto_88342 ?auto_88344 ) ) ( not ( = ?auto_88346 ?auto_88347 ) ) ( not ( = ?auto_88346 ?auto_88344 ) ) ( not ( = ?auto_88345 ?auto_88347 ) ) ( not ( = ?auto_88345 ?auto_88344 ) ) ( ON ?auto_88343 ?auto_88345 ) ( CLEAR ?auto_88343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88341 ?auto_88342 ?auto_88346 ?auto_88345 )
      ( MAKE-2PILE ?auto_88341 ?auto_88342 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88348 - BLOCK
      ?auto_88349 - BLOCK
    )
    :vars
    (
      ?auto_88354 - BLOCK
      ?auto_88351 - BLOCK
      ?auto_88353 - BLOCK
      ?auto_88352 - BLOCK
      ?auto_88350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88354 ?auto_88349 ) ( ON-TABLE ?auto_88348 ) ( ON ?auto_88349 ?auto_88348 ) ( not ( = ?auto_88348 ?auto_88349 ) ) ( not ( = ?auto_88348 ?auto_88354 ) ) ( not ( = ?auto_88349 ?auto_88354 ) ) ( not ( = ?auto_88348 ?auto_88351 ) ) ( not ( = ?auto_88348 ?auto_88353 ) ) ( not ( = ?auto_88349 ?auto_88351 ) ) ( not ( = ?auto_88349 ?auto_88353 ) ) ( not ( = ?auto_88354 ?auto_88351 ) ) ( not ( = ?auto_88354 ?auto_88353 ) ) ( not ( = ?auto_88351 ?auto_88353 ) ) ( ON ?auto_88351 ?auto_88354 ) ( ON-TABLE ?auto_88352 ) ( not ( = ?auto_88352 ?auto_88350 ) ) ( not ( = ?auto_88352 ?auto_88353 ) ) ( not ( = ?auto_88350 ?auto_88353 ) ) ( not ( = ?auto_88348 ?auto_88350 ) ) ( not ( = ?auto_88348 ?auto_88352 ) ) ( not ( = ?auto_88349 ?auto_88350 ) ) ( not ( = ?auto_88349 ?auto_88352 ) ) ( not ( = ?auto_88354 ?auto_88350 ) ) ( not ( = ?auto_88354 ?auto_88352 ) ) ( not ( = ?auto_88351 ?auto_88350 ) ) ( not ( = ?auto_88351 ?auto_88352 ) ) ( ON ?auto_88353 ?auto_88351 ) ( CLEAR ?auto_88353 ) ( HOLDING ?auto_88350 ) ( CLEAR ?auto_88352 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88352 ?auto_88350 )
      ( MAKE-2PILE ?auto_88348 ?auto_88349 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88355 - BLOCK
      ?auto_88356 - BLOCK
    )
    :vars
    (
      ?auto_88359 - BLOCK
      ?auto_88358 - BLOCK
      ?auto_88361 - BLOCK
      ?auto_88357 - BLOCK
      ?auto_88360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88359 ?auto_88356 ) ( ON-TABLE ?auto_88355 ) ( ON ?auto_88356 ?auto_88355 ) ( not ( = ?auto_88355 ?auto_88356 ) ) ( not ( = ?auto_88355 ?auto_88359 ) ) ( not ( = ?auto_88356 ?auto_88359 ) ) ( not ( = ?auto_88355 ?auto_88358 ) ) ( not ( = ?auto_88355 ?auto_88361 ) ) ( not ( = ?auto_88356 ?auto_88358 ) ) ( not ( = ?auto_88356 ?auto_88361 ) ) ( not ( = ?auto_88359 ?auto_88358 ) ) ( not ( = ?auto_88359 ?auto_88361 ) ) ( not ( = ?auto_88358 ?auto_88361 ) ) ( ON ?auto_88358 ?auto_88359 ) ( ON-TABLE ?auto_88357 ) ( not ( = ?auto_88357 ?auto_88360 ) ) ( not ( = ?auto_88357 ?auto_88361 ) ) ( not ( = ?auto_88360 ?auto_88361 ) ) ( not ( = ?auto_88355 ?auto_88360 ) ) ( not ( = ?auto_88355 ?auto_88357 ) ) ( not ( = ?auto_88356 ?auto_88360 ) ) ( not ( = ?auto_88356 ?auto_88357 ) ) ( not ( = ?auto_88359 ?auto_88360 ) ) ( not ( = ?auto_88359 ?auto_88357 ) ) ( not ( = ?auto_88358 ?auto_88360 ) ) ( not ( = ?auto_88358 ?auto_88357 ) ) ( ON ?auto_88361 ?auto_88358 ) ( CLEAR ?auto_88357 ) ( ON ?auto_88360 ?auto_88361 ) ( CLEAR ?auto_88360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88355 ?auto_88356 ?auto_88359 ?auto_88358 ?auto_88361 )
      ( MAKE-2PILE ?auto_88355 ?auto_88356 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88362 - BLOCK
      ?auto_88363 - BLOCK
    )
    :vars
    (
      ?auto_88366 - BLOCK
      ?auto_88365 - BLOCK
      ?auto_88367 - BLOCK
      ?auto_88364 - BLOCK
      ?auto_88368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88366 ?auto_88363 ) ( ON-TABLE ?auto_88362 ) ( ON ?auto_88363 ?auto_88362 ) ( not ( = ?auto_88362 ?auto_88363 ) ) ( not ( = ?auto_88362 ?auto_88366 ) ) ( not ( = ?auto_88363 ?auto_88366 ) ) ( not ( = ?auto_88362 ?auto_88365 ) ) ( not ( = ?auto_88362 ?auto_88367 ) ) ( not ( = ?auto_88363 ?auto_88365 ) ) ( not ( = ?auto_88363 ?auto_88367 ) ) ( not ( = ?auto_88366 ?auto_88365 ) ) ( not ( = ?auto_88366 ?auto_88367 ) ) ( not ( = ?auto_88365 ?auto_88367 ) ) ( ON ?auto_88365 ?auto_88366 ) ( not ( = ?auto_88364 ?auto_88368 ) ) ( not ( = ?auto_88364 ?auto_88367 ) ) ( not ( = ?auto_88368 ?auto_88367 ) ) ( not ( = ?auto_88362 ?auto_88368 ) ) ( not ( = ?auto_88362 ?auto_88364 ) ) ( not ( = ?auto_88363 ?auto_88368 ) ) ( not ( = ?auto_88363 ?auto_88364 ) ) ( not ( = ?auto_88366 ?auto_88368 ) ) ( not ( = ?auto_88366 ?auto_88364 ) ) ( not ( = ?auto_88365 ?auto_88368 ) ) ( not ( = ?auto_88365 ?auto_88364 ) ) ( ON ?auto_88367 ?auto_88365 ) ( ON ?auto_88368 ?auto_88367 ) ( CLEAR ?auto_88368 ) ( HOLDING ?auto_88364 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88364 )
      ( MAKE-2PILE ?auto_88362 ?auto_88363 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88378 - BLOCK
      ?auto_88379 - BLOCK
    )
    :vars
    (
      ?auto_88384 - BLOCK
      ?auto_88380 - BLOCK
      ?auto_88382 - BLOCK
      ?auto_88383 - BLOCK
      ?auto_88381 - BLOCK
      ?auto_88385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88384 ?auto_88379 ) ( ON-TABLE ?auto_88378 ) ( ON ?auto_88379 ?auto_88378 ) ( not ( = ?auto_88378 ?auto_88379 ) ) ( not ( = ?auto_88378 ?auto_88384 ) ) ( not ( = ?auto_88379 ?auto_88384 ) ) ( not ( = ?auto_88378 ?auto_88380 ) ) ( not ( = ?auto_88378 ?auto_88382 ) ) ( not ( = ?auto_88379 ?auto_88380 ) ) ( not ( = ?auto_88379 ?auto_88382 ) ) ( not ( = ?auto_88384 ?auto_88380 ) ) ( not ( = ?auto_88384 ?auto_88382 ) ) ( not ( = ?auto_88380 ?auto_88382 ) ) ( ON ?auto_88380 ?auto_88384 ) ( not ( = ?auto_88383 ?auto_88381 ) ) ( not ( = ?auto_88383 ?auto_88382 ) ) ( not ( = ?auto_88381 ?auto_88382 ) ) ( not ( = ?auto_88378 ?auto_88381 ) ) ( not ( = ?auto_88378 ?auto_88383 ) ) ( not ( = ?auto_88379 ?auto_88381 ) ) ( not ( = ?auto_88379 ?auto_88383 ) ) ( not ( = ?auto_88384 ?auto_88381 ) ) ( not ( = ?auto_88384 ?auto_88383 ) ) ( not ( = ?auto_88380 ?auto_88381 ) ) ( not ( = ?auto_88380 ?auto_88383 ) ) ( ON ?auto_88382 ?auto_88380 ) ( ON ?auto_88381 ?auto_88382 ) ( CLEAR ?auto_88381 ) ( ON ?auto_88383 ?auto_88385 ) ( CLEAR ?auto_88383 ) ( HAND-EMPTY ) ( not ( = ?auto_88378 ?auto_88385 ) ) ( not ( = ?auto_88379 ?auto_88385 ) ) ( not ( = ?auto_88384 ?auto_88385 ) ) ( not ( = ?auto_88380 ?auto_88385 ) ) ( not ( = ?auto_88382 ?auto_88385 ) ) ( not ( = ?auto_88383 ?auto_88385 ) ) ( not ( = ?auto_88381 ?auto_88385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88383 ?auto_88385 )
      ( MAKE-2PILE ?auto_88378 ?auto_88379 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88386 - BLOCK
      ?auto_88387 - BLOCK
    )
    :vars
    (
      ?auto_88388 - BLOCK
      ?auto_88391 - BLOCK
      ?auto_88390 - BLOCK
      ?auto_88389 - BLOCK
      ?auto_88392 - BLOCK
      ?auto_88393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88388 ?auto_88387 ) ( ON-TABLE ?auto_88386 ) ( ON ?auto_88387 ?auto_88386 ) ( not ( = ?auto_88386 ?auto_88387 ) ) ( not ( = ?auto_88386 ?auto_88388 ) ) ( not ( = ?auto_88387 ?auto_88388 ) ) ( not ( = ?auto_88386 ?auto_88391 ) ) ( not ( = ?auto_88386 ?auto_88390 ) ) ( not ( = ?auto_88387 ?auto_88391 ) ) ( not ( = ?auto_88387 ?auto_88390 ) ) ( not ( = ?auto_88388 ?auto_88391 ) ) ( not ( = ?auto_88388 ?auto_88390 ) ) ( not ( = ?auto_88391 ?auto_88390 ) ) ( ON ?auto_88391 ?auto_88388 ) ( not ( = ?auto_88389 ?auto_88392 ) ) ( not ( = ?auto_88389 ?auto_88390 ) ) ( not ( = ?auto_88392 ?auto_88390 ) ) ( not ( = ?auto_88386 ?auto_88392 ) ) ( not ( = ?auto_88386 ?auto_88389 ) ) ( not ( = ?auto_88387 ?auto_88392 ) ) ( not ( = ?auto_88387 ?auto_88389 ) ) ( not ( = ?auto_88388 ?auto_88392 ) ) ( not ( = ?auto_88388 ?auto_88389 ) ) ( not ( = ?auto_88391 ?auto_88392 ) ) ( not ( = ?auto_88391 ?auto_88389 ) ) ( ON ?auto_88390 ?auto_88391 ) ( ON ?auto_88389 ?auto_88393 ) ( CLEAR ?auto_88389 ) ( not ( = ?auto_88386 ?auto_88393 ) ) ( not ( = ?auto_88387 ?auto_88393 ) ) ( not ( = ?auto_88388 ?auto_88393 ) ) ( not ( = ?auto_88391 ?auto_88393 ) ) ( not ( = ?auto_88390 ?auto_88393 ) ) ( not ( = ?auto_88389 ?auto_88393 ) ) ( not ( = ?auto_88392 ?auto_88393 ) ) ( HOLDING ?auto_88392 ) ( CLEAR ?auto_88390 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88386 ?auto_88387 ?auto_88388 ?auto_88391 ?auto_88390 ?auto_88392 )
      ( MAKE-2PILE ?auto_88386 ?auto_88387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88394 - BLOCK
      ?auto_88395 - BLOCK
    )
    :vars
    (
      ?auto_88399 - BLOCK
      ?auto_88401 - BLOCK
      ?auto_88396 - BLOCK
      ?auto_88400 - BLOCK
      ?auto_88397 - BLOCK
      ?auto_88398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88399 ?auto_88395 ) ( ON-TABLE ?auto_88394 ) ( ON ?auto_88395 ?auto_88394 ) ( not ( = ?auto_88394 ?auto_88395 ) ) ( not ( = ?auto_88394 ?auto_88399 ) ) ( not ( = ?auto_88395 ?auto_88399 ) ) ( not ( = ?auto_88394 ?auto_88401 ) ) ( not ( = ?auto_88394 ?auto_88396 ) ) ( not ( = ?auto_88395 ?auto_88401 ) ) ( not ( = ?auto_88395 ?auto_88396 ) ) ( not ( = ?auto_88399 ?auto_88401 ) ) ( not ( = ?auto_88399 ?auto_88396 ) ) ( not ( = ?auto_88401 ?auto_88396 ) ) ( ON ?auto_88401 ?auto_88399 ) ( not ( = ?auto_88400 ?auto_88397 ) ) ( not ( = ?auto_88400 ?auto_88396 ) ) ( not ( = ?auto_88397 ?auto_88396 ) ) ( not ( = ?auto_88394 ?auto_88397 ) ) ( not ( = ?auto_88394 ?auto_88400 ) ) ( not ( = ?auto_88395 ?auto_88397 ) ) ( not ( = ?auto_88395 ?auto_88400 ) ) ( not ( = ?auto_88399 ?auto_88397 ) ) ( not ( = ?auto_88399 ?auto_88400 ) ) ( not ( = ?auto_88401 ?auto_88397 ) ) ( not ( = ?auto_88401 ?auto_88400 ) ) ( ON ?auto_88396 ?auto_88401 ) ( ON ?auto_88400 ?auto_88398 ) ( not ( = ?auto_88394 ?auto_88398 ) ) ( not ( = ?auto_88395 ?auto_88398 ) ) ( not ( = ?auto_88399 ?auto_88398 ) ) ( not ( = ?auto_88401 ?auto_88398 ) ) ( not ( = ?auto_88396 ?auto_88398 ) ) ( not ( = ?auto_88400 ?auto_88398 ) ) ( not ( = ?auto_88397 ?auto_88398 ) ) ( CLEAR ?auto_88396 ) ( ON ?auto_88397 ?auto_88400 ) ( CLEAR ?auto_88397 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88398 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88398 ?auto_88400 )
      ( MAKE-2PILE ?auto_88394 ?auto_88395 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_88402 - BLOCK
      ?auto_88403 - BLOCK
    )
    :vars
    (
      ?auto_88407 - BLOCK
      ?auto_88405 - BLOCK
      ?auto_88408 - BLOCK
      ?auto_88406 - BLOCK
      ?auto_88409 - BLOCK
      ?auto_88404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88407 ?auto_88403 ) ( ON-TABLE ?auto_88402 ) ( ON ?auto_88403 ?auto_88402 ) ( not ( = ?auto_88402 ?auto_88403 ) ) ( not ( = ?auto_88402 ?auto_88407 ) ) ( not ( = ?auto_88403 ?auto_88407 ) ) ( not ( = ?auto_88402 ?auto_88405 ) ) ( not ( = ?auto_88402 ?auto_88408 ) ) ( not ( = ?auto_88403 ?auto_88405 ) ) ( not ( = ?auto_88403 ?auto_88408 ) ) ( not ( = ?auto_88407 ?auto_88405 ) ) ( not ( = ?auto_88407 ?auto_88408 ) ) ( not ( = ?auto_88405 ?auto_88408 ) ) ( ON ?auto_88405 ?auto_88407 ) ( not ( = ?auto_88406 ?auto_88409 ) ) ( not ( = ?auto_88406 ?auto_88408 ) ) ( not ( = ?auto_88409 ?auto_88408 ) ) ( not ( = ?auto_88402 ?auto_88409 ) ) ( not ( = ?auto_88402 ?auto_88406 ) ) ( not ( = ?auto_88403 ?auto_88409 ) ) ( not ( = ?auto_88403 ?auto_88406 ) ) ( not ( = ?auto_88407 ?auto_88409 ) ) ( not ( = ?auto_88407 ?auto_88406 ) ) ( not ( = ?auto_88405 ?auto_88409 ) ) ( not ( = ?auto_88405 ?auto_88406 ) ) ( ON ?auto_88406 ?auto_88404 ) ( not ( = ?auto_88402 ?auto_88404 ) ) ( not ( = ?auto_88403 ?auto_88404 ) ) ( not ( = ?auto_88407 ?auto_88404 ) ) ( not ( = ?auto_88405 ?auto_88404 ) ) ( not ( = ?auto_88408 ?auto_88404 ) ) ( not ( = ?auto_88406 ?auto_88404 ) ) ( not ( = ?auto_88409 ?auto_88404 ) ) ( ON ?auto_88409 ?auto_88406 ) ( CLEAR ?auto_88409 ) ( ON-TABLE ?auto_88404 ) ( HOLDING ?auto_88408 ) ( CLEAR ?auto_88405 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88402 ?auto_88403 ?auto_88407 ?auto_88405 ?auto_88408 )
      ( MAKE-2PILE ?auto_88402 ?auto_88403 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88453 - BLOCK
      ?auto_88454 - BLOCK
      ?auto_88455 - BLOCK
      ?auto_88456 - BLOCK
      ?auto_88457 - BLOCK
    )
    :vars
    (
      ?auto_88458 - BLOCK
      ?auto_88459 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88453 ) ( ON ?auto_88454 ?auto_88453 ) ( ON ?auto_88455 ?auto_88454 ) ( not ( = ?auto_88453 ?auto_88454 ) ) ( not ( = ?auto_88453 ?auto_88455 ) ) ( not ( = ?auto_88453 ?auto_88456 ) ) ( not ( = ?auto_88453 ?auto_88457 ) ) ( not ( = ?auto_88454 ?auto_88455 ) ) ( not ( = ?auto_88454 ?auto_88456 ) ) ( not ( = ?auto_88454 ?auto_88457 ) ) ( not ( = ?auto_88455 ?auto_88456 ) ) ( not ( = ?auto_88455 ?auto_88457 ) ) ( not ( = ?auto_88456 ?auto_88457 ) ) ( ON ?auto_88457 ?auto_88458 ) ( not ( = ?auto_88453 ?auto_88458 ) ) ( not ( = ?auto_88454 ?auto_88458 ) ) ( not ( = ?auto_88455 ?auto_88458 ) ) ( not ( = ?auto_88456 ?auto_88458 ) ) ( not ( = ?auto_88457 ?auto_88458 ) ) ( CLEAR ?auto_88455 ) ( ON ?auto_88456 ?auto_88457 ) ( CLEAR ?auto_88456 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88459 ) ( ON ?auto_88458 ?auto_88459 ) ( not ( = ?auto_88459 ?auto_88458 ) ) ( not ( = ?auto_88459 ?auto_88457 ) ) ( not ( = ?auto_88459 ?auto_88456 ) ) ( not ( = ?auto_88453 ?auto_88459 ) ) ( not ( = ?auto_88454 ?auto_88459 ) ) ( not ( = ?auto_88455 ?auto_88459 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88459 ?auto_88458 ?auto_88457 )
      ( MAKE-5PILE ?auto_88453 ?auto_88454 ?auto_88455 ?auto_88456 ?auto_88457 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88460 - BLOCK
      ?auto_88461 - BLOCK
      ?auto_88462 - BLOCK
      ?auto_88463 - BLOCK
      ?auto_88464 - BLOCK
    )
    :vars
    (
      ?auto_88466 - BLOCK
      ?auto_88465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88460 ) ( ON ?auto_88461 ?auto_88460 ) ( not ( = ?auto_88460 ?auto_88461 ) ) ( not ( = ?auto_88460 ?auto_88462 ) ) ( not ( = ?auto_88460 ?auto_88463 ) ) ( not ( = ?auto_88460 ?auto_88464 ) ) ( not ( = ?auto_88461 ?auto_88462 ) ) ( not ( = ?auto_88461 ?auto_88463 ) ) ( not ( = ?auto_88461 ?auto_88464 ) ) ( not ( = ?auto_88462 ?auto_88463 ) ) ( not ( = ?auto_88462 ?auto_88464 ) ) ( not ( = ?auto_88463 ?auto_88464 ) ) ( ON ?auto_88464 ?auto_88466 ) ( not ( = ?auto_88460 ?auto_88466 ) ) ( not ( = ?auto_88461 ?auto_88466 ) ) ( not ( = ?auto_88462 ?auto_88466 ) ) ( not ( = ?auto_88463 ?auto_88466 ) ) ( not ( = ?auto_88464 ?auto_88466 ) ) ( ON ?auto_88463 ?auto_88464 ) ( CLEAR ?auto_88463 ) ( ON-TABLE ?auto_88465 ) ( ON ?auto_88466 ?auto_88465 ) ( not ( = ?auto_88465 ?auto_88466 ) ) ( not ( = ?auto_88465 ?auto_88464 ) ) ( not ( = ?auto_88465 ?auto_88463 ) ) ( not ( = ?auto_88460 ?auto_88465 ) ) ( not ( = ?auto_88461 ?auto_88465 ) ) ( not ( = ?auto_88462 ?auto_88465 ) ) ( HOLDING ?auto_88462 ) ( CLEAR ?auto_88461 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88460 ?auto_88461 ?auto_88462 )
      ( MAKE-5PILE ?auto_88460 ?auto_88461 ?auto_88462 ?auto_88463 ?auto_88464 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88467 - BLOCK
      ?auto_88468 - BLOCK
      ?auto_88469 - BLOCK
      ?auto_88470 - BLOCK
      ?auto_88471 - BLOCK
    )
    :vars
    (
      ?auto_88472 - BLOCK
      ?auto_88473 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88467 ) ( ON ?auto_88468 ?auto_88467 ) ( not ( = ?auto_88467 ?auto_88468 ) ) ( not ( = ?auto_88467 ?auto_88469 ) ) ( not ( = ?auto_88467 ?auto_88470 ) ) ( not ( = ?auto_88467 ?auto_88471 ) ) ( not ( = ?auto_88468 ?auto_88469 ) ) ( not ( = ?auto_88468 ?auto_88470 ) ) ( not ( = ?auto_88468 ?auto_88471 ) ) ( not ( = ?auto_88469 ?auto_88470 ) ) ( not ( = ?auto_88469 ?auto_88471 ) ) ( not ( = ?auto_88470 ?auto_88471 ) ) ( ON ?auto_88471 ?auto_88472 ) ( not ( = ?auto_88467 ?auto_88472 ) ) ( not ( = ?auto_88468 ?auto_88472 ) ) ( not ( = ?auto_88469 ?auto_88472 ) ) ( not ( = ?auto_88470 ?auto_88472 ) ) ( not ( = ?auto_88471 ?auto_88472 ) ) ( ON ?auto_88470 ?auto_88471 ) ( ON-TABLE ?auto_88473 ) ( ON ?auto_88472 ?auto_88473 ) ( not ( = ?auto_88473 ?auto_88472 ) ) ( not ( = ?auto_88473 ?auto_88471 ) ) ( not ( = ?auto_88473 ?auto_88470 ) ) ( not ( = ?auto_88467 ?auto_88473 ) ) ( not ( = ?auto_88468 ?auto_88473 ) ) ( not ( = ?auto_88469 ?auto_88473 ) ) ( CLEAR ?auto_88468 ) ( ON ?auto_88469 ?auto_88470 ) ( CLEAR ?auto_88469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88473 ?auto_88472 ?auto_88471 ?auto_88470 )
      ( MAKE-5PILE ?auto_88467 ?auto_88468 ?auto_88469 ?auto_88470 ?auto_88471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88474 - BLOCK
      ?auto_88475 - BLOCK
      ?auto_88476 - BLOCK
      ?auto_88477 - BLOCK
      ?auto_88478 - BLOCK
    )
    :vars
    (
      ?auto_88480 - BLOCK
      ?auto_88479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88474 ) ( not ( = ?auto_88474 ?auto_88475 ) ) ( not ( = ?auto_88474 ?auto_88476 ) ) ( not ( = ?auto_88474 ?auto_88477 ) ) ( not ( = ?auto_88474 ?auto_88478 ) ) ( not ( = ?auto_88475 ?auto_88476 ) ) ( not ( = ?auto_88475 ?auto_88477 ) ) ( not ( = ?auto_88475 ?auto_88478 ) ) ( not ( = ?auto_88476 ?auto_88477 ) ) ( not ( = ?auto_88476 ?auto_88478 ) ) ( not ( = ?auto_88477 ?auto_88478 ) ) ( ON ?auto_88478 ?auto_88480 ) ( not ( = ?auto_88474 ?auto_88480 ) ) ( not ( = ?auto_88475 ?auto_88480 ) ) ( not ( = ?auto_88476 ?auto_88480 ) ) ( not ( = ?auto_88477 ?auto_88480 ) ) ( not ( = ?auto_88478 ?auto_88480 ) ) ( ON ?auto_88477 ?auto_88478 ) ( ON-TABLE ?auto_88479 ) ( ON ?auto_88480 ?auto_88479 ) ( not ( = ?auto_88479 ?auto_88480 ) ) ( not ( = ?auto_88479 ?auto_88478 ) ) ( not ( = ?auto_88479 ?auto_88477 ) ) ( not ( = ?auto_88474 ?auto_88479 ) ) ( not ( = ?auto_88475 ?auto_88479 ) ) ( not ( = ?auto_88476 ?auto_88479 ) ) ( ON ?auto_88476 ?auto_88477 ) ( CLEAR ?auto_88476 ) ( HOLDING ?auto_88475 ) ( CLEAR ?auto_88474 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88474 ?auto_88475 )
      ( MAKE-5PILE ?auto_88474 ?auto_88475 ?auto_88476 ?auto_88477 ?auto_88478 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88481 - BLOCK
      ?auto_88482 - BLOCK
      ?auto_88483 - BLOCK
      ?auto_88484 - BLOCK
      ?auto_88485 - BLOCK
    )
    :vars
    (
      ?auto_88487 - BLOCK
      ?auto_88486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88481 ) ( not ( = ?auto_88481 ?auto_88482 ) ) ( not ( = ?auto_88481 ?auto_88483 ) ) ( not ( = ?auto_88481 ?auto_88484 ) ) ( not ( = ?auto_88481 ?auto_88485 ) ) ( not ( = ?auto_88482 ?auto_88483 ) ) ( not ( = ?auto_88482 ?auto_88484 ) ) ( not ( = ?auto_88482 ?auto_88485 ) ) ( not ( = ?auto_88483 ?auto_88484 ) ) ( not ( = ?auto_88483 ?auto_88485 ) ) ( not ( = ?auto_88484 ?auto_88485 ) ) ( ON ?auto_88485 ?auto_88487 ) ( not ( = ?auto_88481 ?auto_88487 ) ) ( not ( = ?auto_88482 ?auto_88487 ) ) ( not ( = ?auto_88483 ?auto_88487 ) ) ( not ( = ?auto_88484 ?auto_88487 ) ) ( not ( = ?auto_88485 ?auto_88487 ) ) ( ON ?auto_88484 ?auto_88485 ) ( ON-TABLE ?auto_88486 ) ( ON ?auto_88487 ?auto_88486 ) ( not ( = ?auto_88486 ?auto_88487 ) ) ( not ( = ?auto_88486 ?auto_88485 ) ) ( not ( = ?auto_88486 ?auto_88484 ) ) ( not ( = ?auto_88481 ?auto_88486 ) ) ( not ( = ?auto_88482 ?auto_88486 ) ) ( not ( = ?auto_88483 ?auto_88486 ) ) ( ON ?auto_88483 ?auto_88484 ) ( CLEAR ?auto_88481 ) ( ON ?auto_88482 ?auto_88483 ) ( CLEAR ?auto_88482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88486 ?auto_88487 ?auto_88485 ?auto_88484 ?auto_88483 )
      ( MAKE-5PILE ?auto_88481 ?auto_88482 ?auto_88483 ?auto_88484 ?auto_88485 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88488 - BLOCK
      ?auto_88489 - BLOCK
      ?auto_88490 - BLOCK
      ?auto_88491 - BLOCK
      ?auto_88492 - BLOCK
    )
    :vars
    (
      ?auto_88493 - BLOCK
      ?auto_88494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88488 ?auto_88489 ) ) ( not ( = ?auto_88488 ?auto_88490 ) ) ( not ( = ?auto_88488 ?auto_88491 ) ) ( not ( = ?auto_88488 ?auto_88492 ) ) ( not ( = ?auto_88489 ?auto_88490 ) ) ( not ( = ?auto_88489 ?auto_88491 ) ) ( not ( = ?auto_88489 ?auto_88492 ) ) ( not ( = ?auto_88490 ?auto_88491 ) ) ( not ( = ?auto_88490 ?auto_88492 ) ) ( not ( = ?auto_88491 ?auto_88492 ) ) ( ON ?auto_88492 ?auto_88493 ) ( not ( = ?auto_88488 ?auto_88493 ) ) ( not ( = ?auto_88489 ?auto_88493 ) ) ( not ( = ?auto_88490 ?auto_88493 ) ) ( not ( = ?auto_88491 ?auto_88493 ) ) ( not ( = ?auto_88492 ?auto_88493 ) ) ( ON ?auto_88491 ?auto_88492 ) ( ON-TABLE ?auto_88494 ) ( ON ?auto_88493 ?auto_88494 ) ( not ( = ?auto_88494 ?auto_88493 ) ) ( not ( = ?auto_88494 ?auto_88492 ) ) ( not ( = ?auto_88494 ?auto_88491 ) ) ( not ( = ?auto_88488 ?auto_88494 ) ) ( not ( = ?auto_88489 ?auto_88494 ) ) ( not ( = ?auto_88490 ?auto_88494 ) ) ( ON ?auto_88490 ?auto_88491 ) ( ON ?auto_88489 ?auto_88490 ) ( CLEAR ?auto_88489 ) ( HOLDING ?auto_88488 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88488 )
      ( MAKE-5PILE ?auto_88488 ?auto_88489 ?auto_88490 ?auto_88491 ?auto_88492 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88495 - BLOCK
      ?auto_88496 - BLOCK
      ?auto_88497 - BLOCK
      ?auto_88498 - BLOCK
      ?auto_88499 - BLOCK
    )
    :vars
    (
      ?auto_88501 - BLOCK
      ?auto_88500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88495 ?auto_88496 ) ) ( not ( = ?auto_88495 ?auto_88497 ) ) ( not ( = ?auto_88495 ?auto_88498 ) ) ( not ( = ?auto_88495 ?auto_88499 ) ) ( not ( = ?auto_88496 ?auto_88497 ) ) ( not ( = ?auto_88496 ?auto_88498 ) ) ( not ( = ?auto_88496 ?auto_88499 ) ) ( not ( = ?auto_88497 ?auto_88498 ) ) ( not ( = ?auto_88497 ?auto_88499 ) ) ( not ( = ?auto_88498 ?auto_88499 ) ) ( ON ?auto_88499 ?auto_88501 ) ( not ( = ?auto_88495 ?auto_88501 ) ) ( not ( = ?auto_88496 ?auto_88501 ) ) ( not ( = ?auto_88497 ?auto_88501 ) ) ( not ( = ?auto_88498 ?auto_88501 ) ) ( not ( = ?auto_88499 ?auto_88501 ) ) ( ON ?auto_88498 ?auto_88499 ) ( ON-TABLE ?auto_88500 ) ( ON ?auto_88501 ?auto_88500 ) ( not ( = ?auto_88500 ?auto_88501 ) ) ( not ( = ?auto_88500 ?auto_88499 ) ) ( not ( = ?auto_88500 ?auto_88498 ) ) ( not ( = ?auto_88495 ?auto_88500 ) ) ( not ( = ?auto_88496 ?auto_88500 ) ) ( not ( = ?auto_88497 ?auto_88500 ) ) ( ON ?auto_88497 ?auto_88498 ) ( ON ?auto_88496 ?auto_88497 ) ( ON ?auto_88495 ?auto_88496 ) ( CLEAR ?auto_88495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88500 ?auto_88501 ?auto_88499 ?auto_88498 ?auto_88497 ?auto_88496 )
      ( MAKE-5PILE ?auto_88495 ?auto_88496 ?auto_88497 ?auto_88498 ?auto_88499 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88507 - BLOCK
      ?auto_88508 - BLOCK
      ?auto_88509 - BLOCK
      ?auto_88510 - BLOCK
      ?auto_88511 - BLOCK
    )
    :vars
    (
      ?auto_88513 - BLOCK
      ?auto_88512 - BLOCK
      ?auto_88514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88507 ?auto_88508 ) ) ( not ( = ?auto_88507 ?auto_88509 ) ) ( not ( = ?auto_88507 ?auto_88510 ) ) ( not ( = ?auto_88507 ?auto_88511 ) ) ( not ( = ?auto_88508 ?auto_88509 ) ) ( not ( = ?auto_88508 ?auto_88510 ) ) ( not ( = ?auto_88508 ?auto_88511 ) ) ( not ( = ?auto_88509 ?auto_88510 ) ) ( not ( = ?auto_88509 ?auto_88511 ) ) ( not ( = ?auto_88510 ?auto_88511 ) ) ( ON ?auto_88511 ?auto_88513 ) ( not ( = ?auto_88507 ?auto_88513 ) ) ( not ( = ?auto_88508 ?auto_88513 ) ) ( not ( = ?auto_88509 ?auto_88513 ) ) ( not ( = ?auto_88510 ?auto_88513 ) ) ( not ( = ?auto_88511 ?auto_88513 ) ) ( ON ?auto_88510 ?auto_88511 ) ( ON-TABLE ?auto_88512 ) ( ON ?auto_88513 ?auto_88512 ) ( not ( = ?auto_88512 ?auto_88513 ) ) ( not ( = ?auto_88512 ?auto_88511 ) ) ( not ( = ?auto_88512 ?auto_88510 ) ) ( not ( = ?auto_88507 ?auto_88512 ) ) ( not ( = ?auto_88508 ?auto_88512 ) ) ( not ( = ?auto_88509 ?auto_88512 ) ) ( ON ?auto_88509 ?auto_88510 ) ( ON ?auto_88508 ?auto_88509 ) ( CLEAR ?auto_88508 ) ( ON ?auto_88507 ?auto_88514 ) ( CLEAR ?auto_88507 ) ( HAND-EMPTY ) ( not ( = ?auto_88507 ?auto_88514 ) ) ( not ( = ?auto_88508 ?auto_88514 ) ) ( not ( = ?auto_88509 ?auto_88514 ) ) ( not ( = ?auto_88510 ?auto_88514 ) ) ( not ( = ?auto_88511 ?auto_88514 ) ) ( not ( = ?auto_88513 ?auto_88514 ) ) ( not ( = ?auto_88512 ?auto_88514 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88507 ?auto_88514 )
      ( MAKE-5PILE ?auto_88507 ?auto_88508 ?auto_88509 ?auto_88510 ?auto_88511 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88515 - BLOCK
      ?auto_88516 - BLOCK
      ?auto_88517 - BLOCK
      ?auto_88518 - BLOCK
      ?auto_88519 - BLOCK
    )
    :vars
    (
      ?auto_88521 - BLOCK
      ?auto_88522 - BLOCK
      ?auto_88520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88515 ?auto_88516 ) ) ( not ( = ?auto_88515 ?auto_88517 ) ) ( not ( = ?auto_88515 ?auto_88518 ) ) ( not ( = ?auto_88515 ?auto_88519 ) ) ( not ( = ?auto_88516 ?auto_88517 ) ) ( not ( = ?auto_88516 ?auto_88518 ) ) ( not ( = ?auto_88516 ?auto_88519 ) ) ( not ( = ?auto_88517 ?auto_88518 ) ) ( not ( = ?auto_88517 ?auto_88519 ) ) ( not ( = ?auto_88518 ?auto_88519 ) ) ( ON ?auto_88519 ?auto_88521 ) ( not ( = ?auto_88515 ?auto_88521 ) ) ( not ( = ?auto_88516 ?auto_88521 ) ) ( not ( = ?auto_88517 ?auto_88521 ) ) ( not ( = ?auto_88518 ?auto_88521 ) ) ( not ( = ?auto_88519 ?auto_88521 ) ) ( ON ?auto_88518 ?auto_88519 ) ( ON-TABLE ?auto_88522 ) ( ON ?auto_88521 ?auto_88522 ) ( not ( = ?auto_88522 ?auto_88521 ) ) ( not ( = ?auto_88522 ?auto_88519 ) ) ( not ( = ?auto_88522 ?auto_88518 ) ) ( not ( = ?auto_88515 ?auto_88522 ) ) ( not ( = ?auto_88516 ?auto_88522 ) ) ( not ( = ?auto_88517 ?auto_88522 ) ) ( ON ?auto_88517 ?auto_88518 ) ( ON ?auto_88515 ?auto_88520 ) ( CLEAR ?auto_88515 ) ( not ( = ?auto_88515 ?auto_88520 ) ) ( not ( = ?auto_88516 ?auto_88520 ) ) ( not ( = ?auto_88517 ?auto_88520 ) ) ( not ( = ?auto_88518 ?auto_88520 ) ) ( not ( = ?auto_88519 ?auto_88520 ) ) ( not ( = ?auto_88521 ?auto_88520 ) ) ( not ( = ?auto_88522 ?auto_88520 ) ) ( HOLDING ?auto_88516 ) ( CLEAR ?auto_88517 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88522 ?auto_88521 ?auto_88519 ?auto_88518 ?auto_88517 ?auto_88516 )
      ( MAKE-5PILE ?auto_88515 ?auto_88516 ?auto_88517 ?auto_88518 ?auto_88519 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88523 - BLOCK
      ?auto_88524 - BLOCK
      ?auto_88525 - BLOCK
      ?auto_88526 - BLOCK
      ?auto_88527 - BLOCK
    )
    :vars
    (
      ?auto_88528 - BLOCK
      ?auto_88530 - BLOCK
      ?auto_88529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88523 ?auto_88524 ) ) ( not ( = ?auto_88523 ?auto_88525 ) ) ( not ( = ?auto_88523 ?auto_88526 ) ) ( not ( = ?auto_88523 ?auto_88527 ) ) ( not ( = ?auto_88524 ?auto_88525 ) ) ( not ( = ?auto_88524 ?auto_88526 ) ) ( not ( = ?auto_88524 ?auto_88527 ) ) ( not ( = ?auto_88525 ?auto_88526 ) ) ( not ( = ?auto_88525 ?auto_88527 ) ) ( not ( = ?auto_88526 ?auto_88527 ) ) ( ON ?auto_88527 ?auto_88528 ) ( not ( = ?auto_88523 ?auto_88528 ) ) ( not ( = ?auto_88524 ?auto_88528 ) ) ( not ( = ?auto_88525 ?auto_88528 ) ) ( not ( = ?auto_88526 ?auto_88528 ) ) ( not ( = ?auto_88527 ?auto_88528 ) ) ( ON ?auto_88526 ?auto_88527 ) ( ON-TABLE ?auto_88530 ) ( ON ?auto_88528 ?auto_88530 ) ( not ( = ?auto_88530 ?auto_88528 ) ) ( not ( = ?auto_88530 ?auto_88527 ) ) ( not ( = ?auto_88530 ?auto_88526 ) ) ( not ( = ?auto_88523 ?auto_88530 ) ) ( not ( = ?auto_88524 ?auto_88530 ) ) ( not ( = ?auto_88525 ?auto_88530 ) ) ( ON ?auto_88525 ?auto_88526 ) ( ON ?auto_88523 ?auto_88529 ) ( not ( = ?auto_88523 ?auto_88529 ) ) ( not ( = ?auto_88524 ?auto_88529 ) ) ( not ( = ?auto_88525 ?auto_88529 ) ) ( not ( = ?auto_88526 ?auto_88529 ) ) ( not ( = ?auto_88527 ?auto_88529 ) ) ( not ( = ?auto_88528 ?auto_88529 ) ) ( not ( = ?auto_88530 ?auto_88529 ) ) ( CLEAR ?auto_88525 ) ( ON ?auto_88524 ?auto_88523 ) ( CLEAR ?auto_88524 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88529 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88529 ?auto_88523 )
      ( MAKE-5PILE ?auto_88523 ?auto_88524 ?auto_88525 ?auto_88526 ?auto_88527 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88531 - BLOCK
      ?auto_88532 - BLOCK
      ?auto_88533 - BLOCK
      ?auto_88534 - BLOCK
      ?auto_88535 - BLOCK
    )
    :vars
    (
      ?auto_88537 - BLOCK
      ?auto_88536 - BLOCK
      ?auto_88538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88531 ?auto_88532 ) ) ( not ( = ?auto_88531 ?auto_88533 ) ) ( not ( = ?auto_88531 ?auto_88534 ) ) ( not ( = ?auto_88531 ?auto_88535 ) ) ( not ( = ?auto_88532 ?auto_88533 ) ) ( not ( = ?auto_88532 ?auto_88534 ) ) ( not ( = ?auto_88532 ?auto_88535 ) ) ( not ( = ?auto_88533 ?auto_88534 ) ) ( not ( = ?auto_88533 ?auto_88535 ) ) ( not ( = ?auto_88534 ?auto_88535 ) ) ( ON ?auto_88535 ?auto_88537 ) ( not ( = ?auto_88531 ?auto_88537 ) ) ( not ( = ?auto_88532 ?auto_88537 ) ) ( not ( = ?auto_88533 ?auto_88537 ) ) ( not ( = ?auto_88534 ?auto_88537 ) ) ( not ( = ?auto_88535 ?auto_88537 ) ) ( ON ?auto_88534 ?auto_88535 ) ( ON-TABLE ?auto_88536 ) ( ON ?auto_88537 ?auto_88536 ) ( not ( = ?auto_88536 ?auto_88537 ) ) ( not ( = ?auto_88536 ?auto_88535 ) ) ( not ( = ?auto_88536 ?auto_88534 ) ) ( not ( = ?auto_88531 ?auto_88536 ) ) ( not ( = ?auto_88532 ?auto_88536 ) ) ( not ( = ?auto_88533 ?auto_88536 ) ) ( ON ?auto_88531 ?auto_88538 ) ( not ( = ?auto_88531 ?auto_88538 ) ) ( not ( = ?auto_88532 ?auto_88538 ) ) ( not ( = ?auto_88533 ?auto_88538 ) ) ( not ( = ?auto_88534 ?auto_88538 ) ) ( not ( = ?auto_88535 ?auto_88538 ) ) ( not ( = ?auto_88537 ?auto_88538 ) ) ( not ( = ?auto_88536 ?auto_88538 ) ) ( ON ?auto_88532 ?auto_88531 ) ( CLEAR ?auto_88532 ) ( ON-TABLE ?auto_88538 ) ( HOLDING ?auto_88533 ) ( CLEAR ?auto_88534 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88536 ?auto_88537 ?auto_88535 ?auto_88534 ?auto_88533 )
      ( MAKE-5PILE ?auto_88531 ?auto_88532 ?auto_88533 ?auto_88534 ?auto_88535 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88539 - BLOCK
      ?auto_88540 - BLOCK
      ?auto_88541 - BLOCK
      ?auto_88542 - BLOCK
      ?auto_88543 - BLOCK
    )
    :vars
    (
      ?auto_88546 - BLOCK
      ?auto_88544 - BLOCK
      ?auto_88545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88539 ?auto_88540 ) ) ( not ( = ?auto_88539 ?auto_88541 ) ) ( not ( = ?auto_88539 ?auto_88542 ) ) ( not ( = ?auto_88539 ?auto_88543 ) ) ( not ( = ?auto_88540 ?auto_88541 ) ) ( not ( = ?auto_88540 ?auto_88542 ) ) ( not ( = ?auto_88540 ?auto_88543 ) ) ( not ( = ?auto_88541 ?auto_88542 ) ) ( not ( = ?auto_88541 ?auto_88543 ) ) ( not ( = ?auto_88542 ?auto_88543 ) ) ( ON ?auto_88543 ?auto_88546 ) ( not ( = ?auto_88539 ?auto_88546 ) ) ( not ( = ?auto_88540 ?auto_88546 ) ) ( not ( = ?auto_88541 ?auto_88546 ) ) ( not ( = ?auto_88542 ?auto_88546 ) ) ( not ( = ?auto_88543 ?auto_88546 ) ) ( ON ?auto_88542 ?auto_88543 ) ( ON-TABLE ?auto_88544 ) ( ON ?auto_88546 ?auto_88544 ) ( not ( = ?auto_88544 ?auto_88546 ) ) ( not ( = ?auto_88544 ?auto_88543 ) ) ( not ( = ?auto_88544 ?auto_88542 ) ) ( not ( = ?auto_88539 ?auto_88544 ) ) ( not ( = ?auto_88540 ?auto_88544 ) ) ( not ( = ?auto_88541 ?auto_88544 ) ) ( ON ?auto_88539 ?auto_88545 ) ( not ( = ?auto_88539 ?auto_88545 ) ) ( not ( = ?auto_88540 ?auto_88545 ) ) ( not ( = ?auto_88541 ?auto_88545 ) ) ( not ( = ?auto_88542 ?auto_88545 ) ) ( not ( = ?auto_88543 ?auto_88545 ) ) ( not ( = ?auto_88546 ?auto_88545 ) ) ( not ( = ?auto_88544 ?auto_88545 ) ) ( ON ?auto_88540 ?auto_88539 ) ( ON-TABLE ?auto_88545 ) ( CLEAR ?auto_88542 ) ( ON ?auto_88541 ?auto_88540 ) ( CLEAR ?auto_88541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88545 ?auto_88539 ?auto_88540 )
      ( MAKE-5PILE ?auto_88539 ?auto_88540 ?auto_88541 ?auto_88542 ?auto_88543 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88547 - BLOCK
      ?auto_88548 - BLOCK
      ?auto_88549 - BLOCK
      ?auto_88550 - BLOCK
      ?auto_88551 - BLOCK
    )
    :vars
    (
      ?auto_88552 - BLOCK
      ?auto_88553 - BLOCK
      ?auto_88554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88547 ?auto_88548 ) ) ( not ( = ?auto_88547 ?auto_88549 ) ) ( not ( = ?auto_88547 ?auto_88550 ) ) ( not ( = ?auto_88547 ?auto_88551 ) ) ( not ( = ?auto_88548 ?auto_88549 ) ) ( not ( = ?auto_88548 ?auto_88550 ) ) ( not ( = ?auto_88548 ?auto_88551 ) ) ( not ( = ?auto_88549 ?auto_88550 ) ) ( not ( = ?auto_88549 ?auto_88551 ) ) ( not ( = ?auto_88550 ?auto_88551 ) ) ( ON ?auto_88551 ?auto_88552 ) ( not ( = ?auto_88547 ?auto_88552 ) ) ( not ( = ?auto_88548 ?auto_88552 ) ) ( not ( = ?auto_88549 ?auto_88552 ) ) ( not ( = ?auto_88550 ?auto_88552 ) ) ( not ( = ?auto_88551 ?auto_88552 ) ) ( ON-TABLE ?auto_88553 ) ( ON ?auto_88552 ?auto_88553 ) ( not ( = ?auto_88553 ?auto_88552 ) ) ( not ( = ?auto_88553 ?auto_88551 ) ) ( not ( = ?auto_88553 ?auto_88550 ) ) ( not ( = ?auto_88547 ?auto_88553 ) ) ( not ( = ?auto_88548 ?auto_88553 ) ) ( not ( = ?auto_88549 ?auto_88553 ) ) ( ON ?auto_88547 ?auto_88554 ) ( not ( = ?auto_88547 ?auto_88554 ) ) ( not ( = ?auto_88548 ?auto_88554 ) ) ( not ( = ?auto_88549 ?auto_88554 ) ) ( not ( = ?auto_88550 ?auto_88554 ) ) ( not ( = ?auto_88551 ?auto_88554 ) ) ( not ( = ?auto_88552 ?auto_88554 ) ) ( not ( = ?auto_88553 ?auto_88554 ) ) ( ON ?auto_88548 ?auto_88547 ) ( ON-TABLE ?auto_88554 ) ( ON ?auto_88549 ?auto_88548 ) ( CLEAR ?auto_88549 ) ( HOLDING ?auto_88550 ) ( CLEAR ?auto_88551 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88553 ?auto_88552 ?auto_88551 ?auto_88550 )
      ( MAKE-5PILE ?auto_88547 ?auto_88548 ?auto_88549 ?auto_88550 ?auto_88551 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88555 - BLOCK
      ?auto_88556 - BLOCK
      ?auto_88557 - BLOCK
      ?auto_88558 - BLOCK
      ?auto_88559 - BLOCK
    )
    :vars
    (
      ?auto_88561 - BLOCK
      ?auto_88562 - BLOCK
      ?auto_88560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88555 ?auto_88556 ) ) ( not ( = ?auto_88555 ?auto_88557 ) ) ( not ( = ?auto_88555 ?auto_88558 ) ) ( not ( = ?auto_88555 ?auto_88559 ) ) ( not ( = ?auto_88556 ?auto_88557 ) ) ( not ( = ?auto_88556 ?auto_88558 ) ) ( not ( = ?auto_88556 ?auto_88559 ) ) ( not ( = ?auto_88557 ?auto_88558 ) ) ( not ( = ?auto_88557 ?auto_88559 ) ) ( not ( = ?auto_88558 ?auto_88559 ) ) ( ON ?auto_88559 ?auto_88561 ) ( not ( = ?auto_88555 ?auto_88561 ) ) ( not ( = ?auto_88556 ?auto_88561 ) ) ( not ( = ?auto_88557 ?auto_88561 ) ) ( not ( = ?auto_88558 ?auto_88561 ) ) ( not ( = ?auto_88559 ?auto_88561 ) ) ( ON-TABLE ?auto_88562 ) ( ON ?auto_88561 ?auto_88562 ) ( not ( = ?auto_88562 ?auto_88561 ) ) ( not ( = ?auto_88562 ?auto_88559 ) ) ( not ( = ?auto_88562 ?auto_88558 ) ) ( not ( = ?auto_88555 ?auto_88562 ) ) ( not ( = ?auto_88556 ?auto_88562 ) ) ( not ( = ?auto_88557 ?auto_88562 ) ) ( ON ?auto_88555 ?auto_88560 ) ( not ( = ?auto_88555 ?auto_88560 ) ) ( not ( = ?auto_88556 ?auto_88560 ) ) ( not ( = ?auto_88557 ?auto_88560 ) ) ( not ( = ?auto_88558 ?auto_88560 ) ) ( not ( = ?auto_88559 ?auto_88560 ) ) ( not ( = ?auto_88561 ?auto_88560 ) ) ( not ( = ?auto_88562 ?auto_88560 ) ) ( ON ?auto_88556 ?auto_88555 ) ( ON-TABLE ?auto_88560 ) ( ON ?auto_88557 ?auto_88556 ) ( CLEAR ?auto_88559 ) ( ON ?auto_88558 ?auto_88557 ) ( CLEAR ?auto_88558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88560 ?auto_88555 ?auto_88556 ?auto_88557 )
      ( MAKE-5PILE ?auto_88555 ?auto_88556 ?auto_88557 ?auto_88558 ?auto_88559 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88563 - BLOCK
      ?auto_88564 - BLOCK
      ?auto_88565 - BLOCK
      ?auto_88566 - BLOCK
      ?auto_88567 - BLOCK
    )
    :vars
    (
      ?auto_88569 - BLOCK
      ?auto_88570 - BLOCK
      ?auto_88568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88563 ?auto_88564 ) ) ( not ( = ?auto_88563 ?auto_88565 ) ) ( not ( = ?auto_88563 ?auto_88566 ) ) ( not ( = ?auto_88563 ?auto_88567 ) ) ( not ( = ?auto_88564 ?auto_88565 ) ) ( not ( = ?auto_88564 ?auto_88566 ) ) ( not ( = ?auto_88564 ?auto_88567 ) ) ( not ( = ?auto_88565 ?auto_88566 ) ) ( not ( = ?auto_88565 ?auto_88567 ) ) ( not ( = ?auto_88566 ?auto_88567 ) ) ( not ( = ?auto_88563 ?auto_88569 ) ) ( not ( = ?auto_88564 ?auto_88569 ) ) ( not ( = ?auto_88565 ?auto_88569 ) ) ( not ( = ?auto_88566 ?auto_88569 ) ) ( not ( = ?auto_88567 ?auto_88569 ) ) ( ON-TABLE ?auto_88570 ) ( ON ?auto_88569 ?auto_88570 ) ( not ( = ?auto_88570 ?auto_88569 ) ) ( not ( = ?auto_88570 ?auto_88567 ) ) ( not ( = ?auto_88570 ?auto_88566 ) ) ( not ( = ?auto_88563 ?auto_88570 ) ) ( not ( = ?auto_88564 ?auto_88570 ) ) ( not ( = ?auto_88565 ?auto_88570 ) ) ( ON ?auto_88563 ?auto_88568 ) ( not ( = ?auto_88563 ?auto_88568 ) ) ( not ( = ?auto_88564 ?auto_88568 ) ) ( not ( = ?auto_88565 ?auto_88568 ) ) ( not ( = ?auto_88566 ?auto_88568 ) ) ( not ( = ?auto_88567 ?auto_88568 ) ) ( not ( = ?auto_88569 ?auto_88568 ) ) ( not ( = ?auto_88570 ?auto_88568 ) ) ( ON ?auto_88564 ?auto_88563 ) ( ON-TABLE ?auto_88568 ) ( ON ?auto_88565 ?auto_88564 ) ( ON ?auto_88566 ?auto_88565 ) ( CLEAR ?auto_88566 ) ( HOLDING ?auto_88567 ) ( CLEAR ?auto_88569 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88570 ?auto_88569 ?auto_88567 )
      ( MAKE-5PILE ?auto_88563 ?auto_88564 ?auto_88565 ?auto_88566 ?auto_88567 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88571 - BLOCK
      ?auto_88572 - BLOCK
      ?auto_88573 - BLOCK
      ?auto_88574 - BLOCK
      ?auto_88575 - BLOCK
    )
    :vars
    (
      ?auto_88576 - BLOCK
      ?auto_88578 - BLOCK
      ?auto_88577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88571 ?auto_88572 ) ) ( not ( = ?auto_88571 ?auto_88573 ) ) ( not ( = ?auto_88571 ?auto_88574 ) ) ( not ( = ?auto_88571 ?auto_88575 ) ) ( not ( = ?auto_88572 ?auto_88573 ) ) ( not ( = ?auto_88572 ?auto_88574 ) ) ( not ( = ?auto_88572 ?auto_88575 ) ) ( not ( = ?auto_88573 ?auto_88574 ) ) ( not ( = ?auto_88573 ?auto_88575 ) ) ( not ( = ?auto_88574 ?auto_88575 ) ) ( not ( = ?auto_88571 ?auto_88576 ) ) ( not ( = ?auto_88572 ?auto_88576 ) ) ( not ( = ?auto_88573 ?auto_88576 ) ) ( not ( = ?auto_88574 ?auto_88576 ) ) ( not ( = ?auto_88575 ?auto_88576 ) ) ( ON-TABLE ?auto_88578 ) ( ON ?auto_88576 ?auto_88578 ) ( not ( = ?auto_88578 ?auto_88576 ) ) ( not ( = ?auto_88578 ?auto_88575 ) ) ( not ( = ?auto_88578 ?auto_88574 ) ) ( not ( = ?auto_88571 ?auto_88578 ) ) ( not ( = ?auto_88572 ?auto_88578 ) ) ( not ( = ?auto_88573 ?auto_88578 ) ) ( ON ?auto_88571 ?auto_88577 ) ( not ( = ?auto_88571 ?auto_88577 ) ) ( not ( = ?auto_88572 ?auto_88577 ) ) ( not ( = ?auto_88573 ?auto_88577 ) ) ( not ( = ?auto_88574 ?auto_88577 ) ) ( not ( = ?auto_88575 ?auto_88577 ) ) ( not ( = ?auto_88576 ?auto_88577 ) ) ( not ( = ?auto_88578 ?auto_88577 ) ) ( ON ?auto_88572 ?auto_88571 ) ( ON-TABLE ?auto_88577 ) ( ON ?auto_88573 ?auto_88572 ) ( ON ?auto_88574 ?auto_88573 ) ( CLEAR ?auto_88576 ) ( ON ?auto_88575 ?auto_88574 ) ( CLEAR ?auto_88575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88577 ?auto_88571 ?auto_88572 ?auto_88573 ?auto_88574 )
      ( MAKE-5PILE ?auto_88571 ?auto_88572 ?auto_88573 ?auto_88574 ?auto_88575 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88579 - BLOCK
      ?auto_88580 - BLOCK
      ?auto_88581 - BLOCK
      ?auto_88582 - BLOCK
      ?auto_88583 - BLOCK
    )
    :vars
    (
      ?auto_88584 - BLOCK
      ?auto_88585 - BLOCK
      ?auto_88586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88579 ?auto_88580 ) ) ( not ( = ?auto_88579 ?auto_88581 ) ) ( not ( = ?auto_88579 ?auto_88582 ) ) ( not ( = ?auto_88579 ?auto_88583 ) ) ( not ( = ?auto_88580 ?auto_88581 ) ) ( not ( = ?auto_88580 ?auto_88582 ) ) ( not ( = ?auto_88580 ?auto_88583 ) ) ( not ( = ?auto_88581 ?auto_88582 ) ) ( not ( = ?auto_88581 ?auto_88583 ) ) ( not ( = ?auto_88582 ?auto_88583 ) ) ( not ( = ?auto_88579 ?auto_88584 ) ) ( not ( = ?auto_88580 ?auto_88584 ) ) ( not ( = ?auto_88581 ?auto_88584 ) ) ( not ( = ?auto_88582 ?auto_88584 ) ) ( not ( = ?auto_88583 ?auto_88584 ) ) ( ON-TABLE ?auto_88585 ) ( not ( = ?auto_88585 ?auto_88584 ) ) ( not ( = ?auto_88585 ?auto_88583 ) ) ( not ( = ?auto_88585 ?auto_88582 ) ) ( not ( = ?auto_88579 ?auto_88585 ) ) ( not ( = ?auto_88580 ?auto_88585 ) ) ( not ( = ?auto_88581 ?auto_88585 ) ) ( ON ?auto_88579 ?auto_88586 ) ( not ( = ?auto_88579 ?auto_88586 ) ) ( not ( = ?auto_88580 ?auto_88586 ) ) ( not ( = ?auto_88581 ?auto_88586 ) ) ( not ( = ?auto_88582 ?auto_88586 ) ) ( not ( = ?auto_88583 ?auto_88586 ) ) ( not ( = ?auto_88584 ?auto_88586 ) ) ( not ( = ?auto_88585 ?auto_88586 ) ) ( ON ?auto_88580 ?auto_88579 ) ( ON-TABLE ?auto_88586 ) ( ON ?auto_88581 ?auto_88580 ) ( ON ?auto_88582 ?auto_88581 ) ( ON ?auto_88583 ?auto_88582 ) ( CLEAR ?auto_88583 ) ( HOLDING ?auto_88584 ) ( CLEAR ?auto_88585 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88585 ?auto_88584 )
      ( MAKE-5PILE ?auto_88579 ?auto_88580 ?auto_88581 ?auto_88582 ?auto_88583 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88587 - BLOCK
      ?auto_88588 - BLOCK
      ?auto_88589 - BLOCK
      ?auto_88590 - BLOCK
      ?auto_88591 - BLOCK
    )
    :vars
    (
      ?auto_88592 - BLOCK
      ?auto_88594 - BLOCK
      ?auto_88593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88587 ?auto_88588 ) ) ( not ( = ?auto_88587 ?auto_88589 ) ) ( not ( = ?auto_88587 ?auto_88590 ) ) ( not ( = ?auto_88587 ?auto_88591 ) ) ( not ( = ?auto_88588 ?auto_88589 ) ) ( not ( = ?auto_88588 ?auto_88590 ) ) ( not ( = ?auto_88588 ?auto_88591 ) ) ( not ( = ?auto_88589 ?auto_88590 ) ) ( not ( = ?auto_88589 ?auto_88591 ) ) ( not ( = ?auto_88590 ?auto_88591 ) ) ( not ( = ?auto_88587 ?auto_88592 ) ) ( not ( = ?auto_88588 ?auto_88592 ) ) ( not ( = ?auto_88589 ?auto_88592 ) ) ( not ( = ?auto_88590 ?auto_88592 ) ) ( not ( = ?auto_88591 ?auto_88592 ) ) ( ON-TABLE ?auto_88594 ) ( not ( = ?auto_88594 ?auto_88592 ) ) ( not ( = ?auto_88594 ?auto_88591 ) ) ( not ( = ?auto_88594 ?auto_88590 ) ) ( not ( = ?auto_88587 ?auto_88594 ) ) ( not ( = ?auto_88588 ?auto_88594 ) ) ( not ( = ?auto_88589 ?auto_88594 ) ) ( ON ?auto_88587 ?auto_88593 ) ( not ( = ?auto_88587 ?auto_88593 ) ) ( not ( = ?auto_88588 ?auto_88593 ) ) ( not ( = ?auto_88589 ?auto_88593 ) ) ( not ( = ?auto_88590 ?auto_88593 ) ) ( not ( = ?auto_88591 ?auto_88593 ) ) ( not ( = ?auto_88592 ?auto_88593 ) ) ( not ( = ?auto_88594 ?auto_88593 ) ) ( ON ?auto_88588 ?auto_88587 ) ( ON-TABLE ?auto_88593 ) ( ON ?auto_88589 ?auto_88588 ) ( ON ?auto_88590 ?auto_88589 ) ( ON ?auto_88591 ?auto_88590 ) ( CLEAR ?auto_88594 ) ( ON ?auto_88592 ?auto_88591 ) ( CLEAR ?auto_88592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88593 ?auto_88587 ?auto_88588 ?auto_88589 ?auto_88590 ?auto_88591 )
      ( MAKE-5PILE ?auto_88587 ?auto_88588 ?auto_88589 ?auto_88590 ?auto_88591 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88595 - BLOCK
      ?auto_88596 - BLOCK
      ?auto_88597 - BLOCK
      ?auto_88598 - BLOCK
      ?auto_88599 - BLOCK
    )
    :vars
    (
      ?auto_88602 - BLOCK
      ?auto_88601 - BLOCK
      ?auto_88600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88595 ?auto_88596 ) ) ( not ( = ?auto_88595 ?auto_88597 ) ) ( not ( = ?auto_88595 ?auto_88598 ) ) ( not ( = ?auto_88595 ?auto_88599 ) ) ( not ( = ?auto_88596 ?auto_88597 ) ) ( not ( = ?auto_88596 ?auto_88598 ) ) ( not ( = ?auto_88596 ?auto_88599 ) ) ( not ( = ?auto_88597 ?auto_88598 ) ) ( not ( = ?auto_88597 ?auto_88599 ) ) ( not ( = ?auto_88598 ?auto_88599 ) ) ( not ( = ?auto_88595 ?auto_88602 ) ) ( not ( = ?auto_88596 ?auto_88602 ) ) ( not ( = ?auto_88597 ?auto_88602 ) ) ( not ( = ?auto_88598 ?auto_88602 ) ) ( not ( = ?auto_88599 ?auto_88602 ) ) ( not ( = ?auto_88601 ?auto_88602 ) ) ( not ( = ?auto_88601 ?auto_88599 ) ) ( not ( = ?auto_88601 ?auto_88598 ) ) ( not ( = ?auto_88595 ?auto_88601 ) ) ( not ( = ?auto_88596 ?auto_88601 ) ) ( not ( = ?auto_88597 ?auto_88601 ) ) ( ON ?auto_88595 ?auto_88600 ) ( not ( = ?auto_88595 ?auto_88600 ) ) ( not ( = ?auto_88596 ?auto_88600 ) ) ( not ( = ?auto_88597 ?auto_88600 ) ) ( not ( = ?auto_88598 ?auto_88600 ) ) ( not ( = ?auto_88599 ?auto_88600 ) ) ( not ( = ?auto_88602 ?auto_88600 ) ) ( not ( = ?auto_88601 ?auto_88600 ) ) ( ON ?auto_88596 ?auto_88595 ) ( ON-TABLE ?auto_88600 ) ( ON ?auto_88597 ?auto_88596 ) ( ON ?auto_88598 ?auto_88597 ) ( ON ?auto_88599 ?auto_88598 ) ( ON ?auto_88602 ?auto_88599 ) ( CLEAR ?auto_88602 ) ( HOLDING ?auto_88601 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88601 )
      ( MAKE-5PILE ?auto_88595 ?auto_88596 ?auto_88597 ?auto_88598 ?auto_88599 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_88603 - BLOCK
      ?auto_88604 - BLOCK
      ?auto_88605 - BLOCK
      ?auto_88606 - BLOCK
      ?auto_88607 - BLOCK
    )
    :vars
    (
      ?auto_88610 - BLOCK
      ?auto_88609 - BLOCK
      ?auto_88608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88603 ?auto_88604 ) ) ( not ( = ?auto_88603 ?auto_88605 ) ) ( not ( = ?auto_88603 ?auto_88606 ) ) ( not ( = ?auto_88603 ?auto_88607 ) ) ( not ( = ?auto_88604 ?auto_88605 ) ) ( not ( = ?auto_88604 ?auto_88606 ) ) ( not ( = ?auto_88604 ?auto_88607 ) ) ( not ( = ?auto_88605 ?auto_88606 ) ) ( not ( = ?auto_88605 ?auto_88607 ) ) ( not ( = ?auto_88606 ?auto_88607 ) ) ( not ( = ?auto_88603 ?auto_88610 ) ) ( not ( = ?auto_88604 ?auto_88610 ) ) ( not ( = ?auto_88605 ?auto_88610 ) ) ( not ( = ?auto_88606 ?auto_88610 ) ) ( not ( = ?auto_88607 ?auto_88610 ) ) ( not ( = ?auto_88609 ?auto_88610 ) ) ( not ( = ?auto_88609 ?auto_88607 ) ) ( not ( = ?auto_88609 ?auto_88606 ) ) ( not ( = ?auto_88603 ?auto_88609 ) ) ( not ( = ?auto_88604 ?auto_88609 ) ) ( not ( = ?auto_88605 ?auto_88609 ) ) ( ON ?auto_88603 ?auto_88608 ) ( not ( = ?auto_88603 ?auto_88608 ) ) ( not ( = ?auto_88604 ?auto_88608 ) ) ( not ( = ?auto_88605 ?auto_88608 ) ) ( not ( = ?auto_88606 ?auto_88608 ) ) ( not ( = ?auto_88607 ?auto_88608 ) ) ( not ( = ?auto_88610 ?auto_88608 ) ) ( not ( = ?auto_88609 ?auto_88608 ) ) ( ON ?auto_88604 ?auto_88603 ) ( ON-TABLE ?auto_88608 ) ( ON ?auto_88605 ?auto_88604 ) ( ON ?auto_88606 ?auto_88605 ) ( ON ?auto_88607 ?auto_88606 ) ( ON ?auto_88610 ?auto_88607 ) ( ON ?auto_88609 ?auto_88610 ) ( CLEAR ?auto_88609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88608 ?auto_88603 ?auto_88604 ?auto_88605 ?auto_88606 ?auto_88607 ?auto_88610 )
      ( MAKE-5PILE ?auto_88603 ?auto_88604 ?auto_88605 ?auto_88606 ?auto_88607 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88622 - BLOCK
    )
    :vars
    (
      ?auto_88623 - BLOCK
      ?auto_88625 - BLOCK
      ?auto_88624 - BLOCK
      ?auto_88628 - BLOCK
      ?auto_88627 - BLOCK
      ?auto_88626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88623 ?auto_88622 ) ( ON-TABLE ?auto_88622 ) ( not ( = ?auto_88622 ?auto_88623 ) ) ( not ( = ?auto_88622 ?auto_88625 ) ) ( not ( = ?auto_88622 ?auto_88624 ) ) ( not ( = ?auto_88623 ?auto_88625 ) ) ( not ( = ?auto_88623 ?auto_88624 ) ) ( not ( = ?auto_88625 ?auto_88624 ) ) ( ON ?auto_88625 ?auto_88623 ) ( CLEAR ?auto_88625 ) ( HOLDING ?auto_88624 ) ( CLEAR ?auto_88628 ) ( ON-TABLE ?auto_88627 ) ( ON ?auto_88626 ?auto_88627 ) ( ON ?auto_88628 ?auto_88626 ) ( not ( = ?auto_88627 ?auto_88626 ) ) ( not ( = ?auto_88627 ?auto_88628 ) ) ( not ( = ?auto_88627 ?auto_88624 ) ) ( not ( = ?auto_88626 ?auto_88628 ) ) ( not ( = ?auto_88626 ?auto_88624 ) ) ( not ( = ?auto_88628 ?auto_88624 ) ) ( not ( = ?auto_88622 ?auto_88628 ) ) ( not ( = ?auto_88622 ?auto_88627 ) ) ( not ( = ?auto_88622 ?auto_88626 ) ) ( not ( = ?auto_88623 ?auto_88628 ) ) ( not ( = ?auto_88623 ?auto_88627 ) ) ( not ( = ?auto_88623 ?auto_88626 ) ) ( not ( = ?auto_88625 ?auto_88628 ) ) ( not ( = ?auto_88625 ?auto_88627 ) ) ( not ( = ?auto_88625 ?auto_88626 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88627 ?auto_88626 ?auto_88628 ?auto_88624 )
      ( MAKE-1PILE ?auto_88622 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88629 - BLOCK
    )
    :vars
    (
      ?auto_88633 - BLOCK
      ?auto_88635 - BLOCK
      ?auto_88634 - BLOCK
      ?auto_88630 - BLOCK
      ?auto_88632 - BLOCK
      ?auto_88631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88633 ?auto_88629 ) ( ON-TABLE ?auto_88629 ) ( not ( = ?auto_88629 ?auto_88633 ) ) ( not ( = ?auto_88629 ?auto_88635 ) ) ( not ( = ?auto_88629 ?auto_88634 ) ) ( not ( = ?auto_88633 ?auto_88635 ) ) ( not ( = ?auto_88633 ?auto_88634 ) ) ( not ( = ?auto_88635 ?auto_88634 ) ) ( ON ?auto_88635 ?auto_88633 ) ( CLEAR ?auto_88630 ) ( ON-TABLE ?auto_88632 ) ( ON ?auto_88631 ?auto_88632 ) ( ON ?auto_88630 ?auto_88631 ) ( not ( = ?auto_88632 ?auto_88631 ) ) ( not ( = ?auto_88632 ?auto_88630 ) ) ( not ( = ?auto_88632 ?auto_88634 ) ) ( not ( = ?auto_88631 ?auto_88630 ) ) ( not ( = ?auto_88631 ?auto_88634 ) ) ( not ( = ?auto_88630 ?auto_88634 ) ) ( not ( = ?auto_88629 ?auto_88630 ) ) ( not ( = ?auto_88629 ?auto_88632 ) ) ( not ( = ?auto_88629 ?auto_88631 ) ) ( not ( = ?auto_88633 ?auto_88630 ) ) ( not ( = ?auto_88633 ?auto_88632 ) ) ( not ( = ?auto_88633 ?auto_88631 ) ) ( not ( = ?auto_88635 ?auto_88630 ) ) ( not ( = ?auto_88635 ?auto_88632 ) ) ( not ( = ?auto_88635 ?auto_88631 ) ) ( ON ?auto_88634 ?auto_88635 ) ( CLEAR ?auto_88634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88629 ?auto_88633 ?auto_88635 )
      ( MAKE-1PILE ?auto_88629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88636 - BLOCK
    )
    :vars
    (
      ?auto_88637 - BLOCK
      ?auto_88642 - BLOCK
      ?auto_88640 - BLOCK
      ?auto_88639 - BLOCK
      ?auto_88638 - BLOCK
      ?auto_88641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88637 ?auto_88636 ) ( ON-TABLE ?auto_88636 ) ( not ( = ?auto_88636 ?auto_88637 ) ) ( not ( = ?auto_88636 ?auto_88642 ) ) ( not ( = ?auto_88636 ?auto_88640 ) ) ( not ( = ?auto_88637 ?auto_88642 ) ) ( not ( = ?auto_88637 ?auto_88640 ) ) ( not ( = ?auto_88642 ?auto_88640 ) ) ( ON ?auto_88642 ?auto_88637 ) ( ON-TABLE ?auto_88639 ) ( ON ?auto_88638 ?auto_88639 ) ( not ( = ?auto_88639 ?auto_88638 ) ) ( not ( = ?auto_88639 ?auto_88641 ) ) ( not ( = ?auto_88639 ?auto_88640 ) ) ( not ( = ?auto_88638 ?auto_88641 ) ) ( not ( = ?auto_88638 ?auto_88640 ) ) ( not ( = ?auto_88641 ?auto_88640 ) ) ( not ( = ?auto_88636 ?auto_88641 ) ) ( not ( = ?auto_88636 ?auto_88639 ) ) ( not ( = ?auto_88636 ?auto_88638 ) ) ( not ( = ?auto_88637 ?auto_88641 ) ) ( not ( = ?auto_88637 ?auto_88639 ) ) ( not ( = ?auto_88637 ?auto_88638 ) ) ( not ( = ?auto_88642 ?auto_88641 ) ) ( not ( = ?auto_88642 ?auto_88639 ) ) ( not ( = ?auto_88642 ?auto_88638 ) ) ( ON ?auto_88640 ?auto_88642 ) ( CLEAR ?auto_88640 ) ( HOLDING ?auto_88641 ) ( CLEAR ?auto_88638 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88639 ?auto_88638 ?auto_88641 )
      ( MAKE-1PILE ?auto_88636 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88643 - BLOCK
    )
    :vars
    (
      ?auto_88646 - BLOCK
      ?auto_88648 - BLOCK
      ?auto_88649 - BLOCK
      ?auto_88644 - BLOCK
      ?auto_88647 - BLOCK
      ?auto_88645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88646 ?auto_88643 ) ( ON-TABLE ?auto_88643 ) ( not ( = ?auto_88643 ?auto_88646 ) ) ( not ( = ?auto_88643 ?auto_88648 ) ) ( not ( = ?auto_88643 ?auto_88649 ) ) ( not ( = ?auto_88646 ?auto_88648 ) ) ( not ( = ?auto_88646 ?auto_88649 ) ) ( not ( = ?auto_88648 ?auto_88649 ) ) ( ON ?auto_88648 ?auto_88646 ) ( ON-TABLE ?auto_88644 ) ( ON ?auto_88647 ?auto_88644 ) ( not ( = ?auto_88644 ?auto_88647 ) ) ( not ( = ?auto_88644 ?auto_88645 ) ) ( not ( = ?auto_88644 ?auto_88649 ) ) ( not ( = ?auto_88647 ?auto_88645 ) ) ( not ( = ?auto_88647 ?auto_88649 ) ) ( not ( = ?auto_88645 ?auto_88649 ) ) ( not ( = ?auto_88643 ?auto_88645 ) ) ( not ( = ?auto_88643 ?auto_88644 ) ) ( not ( = ?auto_88643 ?auto_88647 ) ) ( not ( = ?auto_88646 ?auto_88645 ) ) ( not ( = ?auto_88646 ?auto_88644 ) ) ( not ( = ?auto_88646 ?auto_88647 ) ) ( not ( = ?auto_88648 ?auto_88645 ) ) ( not ( = ?auto_88648 ?auto_88644 ) ) ( not ( = ?auto_88648 ?auto_88647 ) ) ( ON ?auto_88649 ?auto_88648 ) ( CLEAR ?auto_88647 ) ( ON ?auto_88645 ?auto_88649 ) ( CLEAR ?auto_88645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88643 ?auto_88646 ?auto_88648 ?auto_88649 )
      ( MAKE-1PILE ?auto_88643 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88650 - BLOCK
    )
    :vars
    (
      ?auto_88651 - BLOCK
      ?auto_88656 - BLOCK
      ?auto_88653 - BLOCK
      ?auto_88655 - BLOCK
      ?auto_88654 - BLOCK
      ?auto_88652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88651 ?auto_88650 ) ( ON-TABLE ?auto_88650 ) ( not ( = ?auto_88650 ?auto_88651 ) ) ( not ( = ?auto_88650 ?auto_88656 ) ) ( not ( = ?auto_88650 ?auto_88653 ) ) ( not ( = ?auto_88651 ?auto_88656 ) ) ( not ( = ?auto_88651 ?auto_88653 ) ) ( not ( = ?auto_88656 ?auto_88653 ) ) ( ON ?auto_88656 ?auto_88651 ) ( ON-TABLE ?auto_88655 ) ( not ( = ?auto_88655 ?auto_88654 ) ) ( not ( = ?auto_88655 ?auto_88652 ) ) ( not ( = ?auto_88655 ?auto_88653 ) ) ( not ( = ?auto_88654 ?auto_88652 ) ) ( not ( = ?auto_88654 ?auto_88653 ) ) ( not ( = ?auto_88652 ?auto_88653 ) ) ( not ( = ?auto_88650 ?auto_88652 ) ) ( not ( = ?auto_88650 ?auto_88655 ) ) ( not ( = ?auto_88650 ?auto_88654 ) ) ( not ( = ?auto_88651 ?auto_88652 ) ) ( not ( = ?auto_88651 ?auto_88655 ) ) ( not ( = ?auto_88651 ?auto_88654 ) ) ( not ( = ?auto_88656 ?auto_88652 ) ) ( not ( = ?auto_88656 ?auto_88655 ) ) ( not ( = ?auto_88656 ?auto_88654 ) ) ( ON ?auto_88653 ?auto_88656 ) ( ON ?auto_88652 ?auto_88653 ) ( CLEAR ?auto_88652 ) ( HOLDING ?auto_88654 ) ( CLEAR ?auto_88655 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88655 ?auto_88654 )
      ( MAKE-1PILE ?auto_88650 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88657 - BLOCK
    )
    :vars
    (
      ?auto_88662 - BLOCK
      ?auto_88663 - BLOCK
      ?auto_88660 - BLOCK
      ?auto_88659 - BLOCK
      ?auto_88661 - BLOCK
      ?auto_88658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88662 ?auto_88657 ) ( ON-TABLE ?auto_88657 ) ( not ( = ?auto_88657 ?auto_88662 ) ) ( not ( = ?auto_88657 ?auto_88663 ) ) ( not ( = ?auto_88657 ?auto_88660 ) ) ( not ( = ?auto_88662 ?auto_88663 ) ) ( not ( = ?auto_88662 ?auto_88660 ) ) ( not ( = ?auto_88663 ?auto_88660 ) ) ( ON ?auto_88663 ?auto_88662 ) ( ON-TABLE ?auto_88659 ) ( not ( = ?auto_88659 ?auto_88661 ) ) ( not ( = ?auto_88659 ?auto_88658 ) ) ( not ( = ?auto_88659 ?auto_88660 ) ) ( not ( = ?auto_88661 ?auto_88658 ) ) ( not ( = ?auto_88661 ?auto_88660 ) ) ( not ( = ?auto_88658 ?auto_88660 ) ) ( not ( = ?auto_88657 ?auto_88658 ) ) ( not ( = ?auto_88657 ?auto_88659 ) ) ( not ( = ?auto_88657 ?auto_88661 ) ) ( not ( = ?auto_88662 ?auto_88658 ) ) ( not ( = ?auto_88662 ?auto_88659 ) ) ( not ( = ?auto_88662 ?auto_88661 ) ) ( not ( = ?auto_88663 ?auto_88658 ) ) ( not ( = ?auto_88663 ?auto_88659 ) ) ( not ( = ?auto_88663 ?auto_88661 ) ) ( ON ?auto_88660 ?auto_88663 ) ( ON ?auto_88658 ?auto_88660 ) ( CLEAR ?auto_88659 ) ( ON ?auto_88661 ?auto_88658 ) ( CLEAR ?auto_88661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88657 ?auto_88662 ?auto_88663 ?auto_88660 ?auto_88658 )
      ( MAKE-1PILE ?auto_88657 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88664 - BLOCK
    )
    :vars
    (
      ?auto_88667 - BLOCK
      ?auto_88670 - BLOCK
      ?auto_88666 - BLOCK
      ?auto_88668 - BLOCK
      ?auto_88669 - BLOCK
      ?auto_88665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88667 ?auto_88664 ) ( ON-TABLE ?auto_88664 ) ( not ( = ?auto_88664 ?auto_88667 ) ) ( not ( = ?auto_88664 ?auto_88670 ) ) ( not ( = ?auto_88664 ?auto_88666 ) ) ( not ( = ?auto_88667 ?auto_88670 ) ) ( not ( = ?auto_88667 ?auto_88666 ) ) ( not ( = ?auto_88670 ?auto_88666 ) ) ( ON ?auto_88670 ?auto_88667 ) ( not ( = ?auto_88668 ?auto_88669 ) ) ( not ( = ?auto_88668 ?auto_88665 ) ) ( not ( = ?auto_88668 ?auto_88666 ) ) ( not ( = ?auto_88669 ?auto_88665 ) ) ( not ( = ?auto_88669 ?auto_88666 ) ) ( not ( = ?auto_88665 ?auto_88666 ) ) ( not ( = ?auto_88664 ?auto_88665 ) ) ( not ( = ?auto_88664 ?auto_88668 ) ) ( not ( = ?auto_88664 ?auto_88669 ) ) ( not ( = ?auto_88667 ?auto_88665 ) ) ( not ( = ?auto_88667 ?auto_88668 ) ) ( not ( = ?auto_88667 ?auto_88669 ) ) ( not ( = ?auto_88670 ?auto_88665 ) ) ( not ( = ?auto_88670 ?auto_88668 ) ) ( not ( = ?auto_88670 ?auto_88669 ) ) ( ON ?auto_88666 ?auto_88670 ) ( ON ?auto_88665 ?auto_88666 ) ( ON ?auto_88669 ?auto_88665 ) ( CLEAR ?auto_88669 ) ( HOLDING ?auto_88668 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88668 )
      ( MAKE-1PILE ?auto_88664 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88679 - BLOCK
    )
    :vars
    (
      ?auto_88680 - BLOCK
      ?auto_88685 - BLOCK
      ?auto_88683 - BLOCK
      ?auto_88681 - BLOCK
      ?auto_88684 - BLOCK
      ?auto_88682 - BLOCK
      ?auto_88686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88680 ?auto_88679 ) ( ON-TABLE ?auto_88679 ) ( not ( = ?auto_88679 ?auto_88680 ) ) ( not ( = ?auto_88679 ?auto_88685 ) ) ( not ( = ?auto_88679 ?auto_88683 ) ) ( not ( = ?auto_88680 ?auto_88685 ) ) ( not ( = ?auto_88680 ?auto_88683 ) ) ( not ( = ?auto_88685 ?auto_88683 ) ) ( ON ?auto_88685 ?auto_88680 ) ( not ( = ?auto_88681 ?auto_88684 ) ) ( not ( = ?auto_88681 ?auto_88682 ) ) ( not ( = ?auto_88681 ?auto_88683 ) ) ( not ( = ?auto_88684 ?auto_88682 ) ) ( not ( = ?auto_88684 ?auto_88683 ) ) ( not ( = ?auto_88682 ?auto_88683 ) ) ( not ( = ?auto_88679 ?auto_88682 ) ) ( not ( = ?auto_88679 ?auto_88681 ) ) ( not ( = ?auto_88679 ?auto_88684 ) ) ( not ( = ?auto_88680 ?auto_88682 ) ) ( not ( = ?auto_88680 ?auto_88681 ) ) ( not ( = ?auto_88680 ?auto_88684 ) ) ( not ( = ?auto_88685 ?auto_88682 ) ) ( not ( = ?auto_88685 ?auto_88681 ) ) ( not ( = ?auto_88685 ?auto_88684 ) ) ( ON ?auto_88683 ?auto_88685 ) ( ON ?auto_88682 ?auto_88683 ) ( ON ?auto_88684 ?auto_88682 ) ( CLEAR ?auto_88684 ) ( ON ?auto_88681 ?auto_88686 ) ( CLEAR ?auto_88681 ) ( HAND-EMPTY ) ( not ( = ?auto_88679 ?auto_88686 ) ) ( not ( = ?auto_88680 ?auto_88686 ) ) ( not ( = ?auto_88685 ?auto_88686 ) ) ( not ( = ?auto_88683 ?auto_88686 ) ) ( not ( = ?auto_88681 ?auto_88686 ) ) ( not ( = ?auto_88684 ?auto_88686 ) ) ( not ( = ?auto_88682 ?auto_88686 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88681 ?auto_88686 )
      ( MAKE-1PILE ?auto_88679 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88687 - BLOCK
    )
    :vars
    (
      ?auto_88688 - BLOCK
      ?auto_88689 - BLOCK
      ?auto_88690 - BLOCK
      ?auto_88693 - BLOCK
      ?auto_88694 - BLOCK
      ?auto_88692 - BLOCK
      ?auto_88691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88688 ?auto_88687 ) ( ON-TABLE ?auto_88687 ) ( not ( = ?auto_88687 ?auto_88688 ) ) ( not ( = ?auto_88687 ?auto_88689 ) ) ( not ( = ?auto_88687 ?auto_88690 ) ) ( not ( = ?auto_88688 ?auto_88689 ) ) ( not ( = ?auto_88688 ?auto_88690 ) ) ( not ( = ?auto_88689 ?auto_88690 ) ) ( ON ?auto_88689 ?auto_88688 ) ( not ( = ?auto_88693 ?auto_88694 ) ) ( not ( = ?auto_88693 ?auto_88692 ) ) ( not ( = ?auto_88693 ?auto_88690 ) ) ( not ( = ?auto_88694 ?auto_88692 ) ) ( not ( = ?auto_88694 ?auto_88690 ) ) ( not ( = ?auto_88692 ?auto_88690 ) ) ( not ( = ?auto_88687 ?auto_88692 ) ) ( not ( = ?auto_88687 ?auto_88693 ) ) ( not ( = ?auto_88687 ?auto_88694 ) ) ( not ( = ?auto_88688 ?auto_88692 ) ) ( not ( = ?auto_88688 ?auto_88693 ) ) ( not ( = ?auto_88688 ?auto_88694 ) ) ( not ( = ?auto_88689 ?auto_88692 ) ) ( not ( = ?auto_88689 ?auto_88693 ) ) ( not ( = ?auto_88689 ?auto_88694 ) ) ( ON ?auto_88690 ?auto_88689 ) ( ON ?auto_88692 ?auto_88690 ) ( ON ?auto_88693 ?auto_88691 ) ( CLEAR ?auto_88693 ) ( not ( = ?auto_88687 ?auto_88691 ) ) ( not ( = ?auto_88688 ?auto_88691 ) ) ( not ( = ?auto_88689 ?auto_88691 ) ) ( not ( = ?auto_88690 ?auto_88691 ) ) ( not ( = ?auto_88693 ?auto_88691 ) ) ( not ( = ?auto_88694 ?auto_88691 ) ) ( not ( = ?auto_88692 ?auto_88691 ) ) ( HOLDING ?auto_88694 ) ( CLEAR ?auto_88692 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88687 ?auto_88688 ?auto_88689 ?auto_88690 ?auto_88692 ?auto_88694 )
      ( MAKE-1PILE ?auto_88687 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88695 - BLOCK
    )
    :vars
    (
      ?auto_88697 - BLOCK
      ?auto_88698 - BLOCK
      ?auto_88699 - BLOCK
      ?auto_88696 - BLOCK
      ?auto_88702 - BLOCK
      ?auto_88700 - BLOCK
      ?auto_88701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88697 ?auto_88695 ) ( ON-TABLE ?auto_88695 ) ( not ( = ?auto_88695 ?auto_88697 ) ) ( not ( = ?auto_88695 ?auto_88698 ) ) ( not ( = ?auto_88695 ?auto_88699 ) ) ( not ( = ?auto_88697 ?auto_88698 ) ) ( not ( = ?auto_88697 ?auto_88699 ) ) ( not ( = ?auto_88698 ?auto_88699 ) ) ( ON ?auto_88698 ?auto_88697 ) ( not ( = ?auto_88696 ?auto_88702 ) ) ( not ( = ?auto_88696 ?auto_88700 ) ) ( not ( = ?auto_88696 ?auto_88699 ) ) ( not ( = ?auto_88702 ?auto_88700 ) ) ( not ( = ?auto_88702 ?auto_88699 ) ) ( not ( = ?auto_88700 ?auto_88699 ) ) ( not ( = ?auto_88695 ?auto_88700 ) ) ( not ( = ?auto_88695 ?auto_88696 ) ) ( not ( = ?auto_88695 ?auto_88702 ) ) ( not ( = ?auto_88697 ?auto_88700 ) ) ( not ( = ?auto_88697 ?auto_88696 ) ) ( not ( = ?auto_88697 ?auto_88702 ) ) ( not ( = ?auto_88698 ?auto_88700 ) ) ( not ( = ?auto_88698 ?auto_88696 ) ) ( not ( = ?auto_88698 ?auto_88702 ) ) ( ON ?auto_88699 ?auto_88698 ) ( ON ?auto_88700 ?auto_88699 ) ( ON ?auto_88696 ?auto_88701 ) ( not ( = ?auto_88695 ?auto_88701 ) ) ( not ( = ?auto_88697 ?auto_88701 ) ) ( not ( = ?auto_88698 ?auto_88701 ) ) ( not ( = ?auto_88699 ?auto_88701 ) ) ( not ( = ?auto_88696 ?auto_88701 ) ) ( not ( = ?auto_88702 ?auto_88701 ) ) ( not ( = ?auto_88700 ?auto_88701 ) ) ( CLEAR ?auto_88700 ) ( ON ?auto_88702 ?auto_88696 ) ( CLEAR ?auto_88702 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88701 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88701 ?auto_88696 )
      ( MAKE-1PILE ?auto_88695 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_88703 - BLOCK
    )
    :vars
    (
      ?auto_88704 - BLOCK
      ?auto_88709 - BLOCK
      ?auto_88705 - BLOCK
      ?auto_88708 - BLOCK
      ?auto_88706 - BLOCK
      ?auto_88710 - BLOCK
      ?auto_88707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88704 ?auto_88703 ) ( ON-TABLE ?auto_88703 ) ( not ( = ?auto_88703 ?auto_88704 ) ) ( not ( = ?auto_88703 ?auto_88709 ) ) ( not ( = ?auto_88703 ?auto_88705 ) ) ( not ( = ?auto_88704 ?auto_88709 ) ) ( not ( = ?auto_88704 ?auto_88705 ) ) ( not ( = ?auto_88709 ?auto_88705 ) ) ( ON ?auto_88709 ?auto_88704 ) ( not ( = ?auto_88708 ?auto_88706 ) ) ( not ( = ?auto_88708 ?auto_88710 ) ) ( not ( = ?auto_88708 ?auto_88705 ) ) ( not ( = ?auto_88706 ?auto_88710 ) ) ( not ( = ?auto_88706 ?auto_88705 ) ) ( not ( = ?auto_88710 ?auto_88705 ) ) ( not ( = ?auto_88703 ?auto_88710 ) ) ( not ( = ?auto_88703 ?auto_88708 ) ) ( not ( = ?auto_88703 ?auto_88706 ) ) ( not ( = ?auto_88704 ?auto_88710 ) ) ( not ( = ?auto_88704 ?auto_88708 ) ) ( not ( = ?auto_88704 ?auto_88706 ) ) ( not ( = ?auto_88709 ?auto_88710 ) ) ( not ( = ?auto_88709 ?auto_88708 ) ) ( not ( = ?auto_88709 ?auto_88706 ) ) ( ON ?auto_88705 ?auto_88709 ) ( ON ?auto_88708 ?auto_88707 ) ( not ( = ?auto_88703 ?auto_88707 ) ) ( not ( = ?auto_88704 ?auto_88707 ) ) ( not ( = ?auto_88709 ?auto_88707 ) ) ( not ( = ?auto_88705 ?auto_88707 ) ) ( not ( = ?auto_88708 ?auto_88707 ) ) ( not ( = ?auto_88706 ?auto_88707 ) ) ( not ( = ?auto_88710 ?auto_88707 ) ) ( ON ?auto_88706 ?auto_88708 ) ( CLEAR ?auto_88706 ) ( ON-TABLE ?auto_88707 ) ( HOLDING ?auto_88710 ) ( CLEAR ?auto_88705 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88703 ?auto_88704 ?auto_88709 ?auto_88705 ?auto_88710 )
      ( MAKE-1PILE ?auto_88703 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88749 - BLOCK
      ?auto_88750 - BLOCK
      ?auto_88751 - BLOCK
      ?auto_88752 - BLOCK
      ?auto_88753 - BLOCK
      ?auto_88754 - BLOCK
    )
    :vars
    (
      ?auto_88755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88749 ) ( ON ?auto_88750 ?auto_88749 ) ( ON ?auto_88751 ?auto_88750 ) ( ON ?auto_88752 ?auto_88751 ) ( not ( = ?auto_88749 ?auto_88750 ) ) ( not ( = ?auto_88749 ?auto_88751 ) ) ( not ( = ?auto_88749 ?auto_88752 ) ) ( not ( = ?auto_88749 ?auto_88753 ) ) ( not ( = ?auto_88749 ?auto_88754 ) ) ( not ( = ?auto_88750 ?auto_88751 ) ) ( not ( = ?auto_88750 ?auto_88752 ) ) ( not ( = ?auto_88750 ?auto_88753 ) ) ( not ( = ?auto_88750 ?auto_88754 ) ) ( not ( = ?auto_88751 ?auto_88752 ) ) ( not ( = ?auto_88751 ?auto_88753 ) ) ( not ( = ?auto_88751 ?auto_88754 ) ) ( not ( = ?auto_88752 ?auto_88753 ) ) ( not ( = ?auto_88752 ?auto_88754 ) ) ( not ( = ?auto_88753 ?auto_88754 ) ) ( ON ?auto_88754 ?auto_88755 ) ( not ( = ?auto_88749 ?auto_88755 ) ) ( not ( = ?auto_88750 ?auto_88755 ) ) ( not ( = ?auto_88751 ?auto_88755 ) ) ( not ( = ?auto_88752 ?auto_88755 ) ) ( not ( = ?auto_88753 ?auto_88755 ) ) ( not ( = ?auto_88754 ?auto_88755 ) ) ( CLEAR ?auto_88752 ) ( ON ?auto_88753 ?auto_88754 ) ( CLEAR ?auto_88753 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88755 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88755 ?auto_88754 )
      ( MAKE-6PILE ?auto_88749 ?auto_88750 ?auto_88751 ?auto_88752 ?auto_88753 ?auto_88754 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88756 - BLOCK
      ?auto_88757 - BLOCK
      ?auto_88758 - BLOCK
      ?auto_88759 - BLOCK
      ?auto_88760 - BLOCK
      ?auto_88761 - BLOCK
    )
    :vars
    (
      ?auto_88762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88756 ) ( ON ?auto_88757 ?auto_88756 ) ( ON ?auto_88758 ?auto_88757 ) ( not ( = ?auto_88756 ?auto_88757 ) ) ( not ( = ?auto_88756 ?auto_88758 ) ) ( not ( = ?auto_88756 ?auto_88759 ) ) ( not ( = ?auto_88756 ?auto_88760 ) ) ( not ( = ?auto_88756 ?auto_88761 ) ) ( not ( = ?auto_88757 ?auto_88758 ) ) ( not ( = ?auto_88757 ?auto_88759 ) ) ( not ( = ?auto_88757 ?auto_88760 ) ) ( not ( = ?auto_88757 ?auto_88761 ) ) ( not ( = ?auto_88758 ?auto_88759 ) ) ( not ( = ?auto_88758 ?auto_88760 ) ) ( not ( = ?auto_88758 ?auto_88761 ) ) ( not ( = ?auto_88759 ?auto_88760 ) ) ( not ( = ?auto_88759 ?auto_88761 ) ) ( not ( = ?auto_88760 ?auto_88761 ) ) ( ON ?auto_88761 ?auto_88762 ) ( not ( = ?auto_88756 ?auto_88762 ) ) ( not ( = ?auto_88757 ?auto_88762 ) ) ( not ( = ?auto_88758 ?auto_88762 ) ) ( not ( = ?auto_88759 ?auto_88762 ) ) ( not ( = ?auto_88760 ?auto_88762 ) ) ( not ( = ?auto_88761 ?auto_88762 ) ) ( ON ?auto_88760 ?auto_88761 ) ( CLEAR ?auto_88760 ) ( ON-TABLE ?auto_88762 ) ( HOLDING ?auto_88759 ) ( CLEAR ?auto_88758 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88756 ?auto_88757 ?auto_88758 ?auto_88759 )
      ( MAKE-6PILE ?auto_88756 ?auto_88757 ?auto_88758 ?auto_88759 ?auto_88760 ?auto_88761 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88763 - BLOCK
      ?auto_88764 - BLOCK
      ?auto_88765 - BLOCK
      ?auto_88766 - BLOCK
      ?auto_88767 - BLOCK
      ?auto_88768 - BLOCK
    )
    :vars
    (
      ?auto_88769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88763 ) ( ON ?auto_88764 ?auto_88763 ) ( ON ?auto_88765 ?auto_88764 ) ( not ( = ?auto_88763 ?auto_88764 ) ) ( not ( = ?auto_88763 ?auto_88765 ) ) ( not ( = ?auto_88763 ?auto_88766 ) ) ( not ( = ?auto_88763 ?auto_88767 ) ) ( not ( = ?auto_88763 ?auto_88768 ) ) ( not ( = ?auto_88764 ?auto_88765 ) ) ( not ( = ?auto_88764 ?auto_88766 ) ) ( not ( = ?auto_88764 ?auto_88767 ) ) ( not ( = ?auto_88764 ?auto_88768 ) ) ( not ( = ?auto_88765 ?auto_88766 ) ) ( not ( = ?auto_88765 ?auto_88767 ) ) ( not ( = ?auto_88765 ?auto_88768 ) ) ( not ( = ?auto_88766 ?auto_88767 ) ) ( not ( = ?auto_88766 ?auto_88768 ) ) ( not ( = ?auto_88767 ?auto_88768 ) ) ( ON ?auto_88768 ?auto_88769 ) ( not ( = ?auto_88763 ?auto_88769 ) ) ( not ( = ?auto_88764 ?auto_88769 ) ) ( not ( = ?auto_88765 ?auto_88769 ) ) ( not ( = ?auto_88766 ?auto_88769 ) ) ( not ( = ?auto_88767 ?auto_88769 ) ) ( not ( = ?auto_88768 ?auto_88769 ) ) ( ON ?auto_88767 ?auto_88768 ) ( ON-TABLE ?auto_88769 ) ( CLEAR ?auto_88765 ) ( ON ?auto_88766 ?auto_88767 ) ( CLEAR ?auto_88766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88769 ?auto_88768 ?auto_88767 )
      ( MAKE-6PILE ?auto_88763 ?auto_88764 ?auto_88765 ?auto_88766 ?auto_88767 ?auto_88768 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88770 - BLOCK
      ?auto_88771 - BLOCK
      ?auto_88772 - BLOCK
      ?auto_88773 - BLOCK
      ?auto_88774 - BLOCK
      ?auto_88775 - BLOCK
    )
    :vars
    (
      ?auto_88776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88770 ) ( ON ?auto_88771 ?auto_88770 ) ( not ( = ?auto_88770 ?auto_88771 ) ) ( not ( = ?auto_88770 ?auto_88772 ) ) ( not ( = ?auto_88770 ?auto_88773 ) ) ( not ( = ?auto_88770 ?auto_88774 ) ) ( not ( = ?auto_88770 ?auto_88775 ) ) ( not ( = ?auto_88771 ?auto_88772 ) ) ( not ( = ?auto_88771 ?auto_88773 ) ) ( not ( = ?auto_88771 ?auto_88774 ) ) ( not ( = ?auto_88771 ?auto_88775 ) ) ( not ( = ?auto_88772 ?auto_88773 ) ) ( not ( = ?auto_88772 ?auto_88774 ) ) ( not ( = ?auto_88772 ?auto_88775 ) ) ( not ( = ?auto_88773 ?auto_88774 ) ) ( not ( = ?auto_88773 ?auto_88775 ) ) ( not ( = ?auto_88774 ?auto_88775 ) ) ( ON ?auto_88775 ?auto_88776 ) ( not ( = ?auto_88770 ?auto_88776 ) ) ( not ( = ?auto_88771 ?auto_88776 ) ) ( not ( = ?auto_88772 ?auto_88776 ) ) ( not ( = ?auto_88773 ?auto_88776 ) ) ( not ( = ?auto_88774 ?auto_88776 ) ) ( not ( = ?auto_88775 ?auto_88776 ) ) ( ON ?auto_88774 ?auto_88775 ) ( ON-TABLE ?auto_88776 ) ( ON ?auto_88773 ?auto_88774 ) ( CLEAR ?auto_88773 ) ( HOLDING ?auto_88772 ) ( CLEAR ?auto_88771 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88770 ?auto_88771 ?auto_88772 )
      ( MAKE-6PILE ?auto_88770 ?auto_88771 ?auto_88772 ?auto_88773 ?auto_88774 ?auto_88775 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88777 - BLOCK
      ?auto_88778 - BLOCK
      ?auto_88779 - BLOCK
      ?auto_88780 - BLOCK
      ?auto_88781 - BLOCK
      ?auto_88782 - BLOCK
    )
    :vars
    (
      ?auto_88783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88777 ) ( ON ?auto_88778 ?auto_88777 ) ( not ( = ?auto_88777 ?auto_88778 ) ) ( not ( = ?auto_88777 ?auto_88779 ) ) ( not ( = ?auto_88777 ?auto_88780 ) ) ( not ( = ?auto_88777 ?auto_88781 ) ) ( not ( = ?auto_88777 ?auto_88782 ) ) ( not ( = ?auto_88778 ?auto_88779 ) ) ( not ( = ?auto_88778 ?auto_88780 ) ) ( not ( = ?auto_88778 ?auto_88781 ) ) ( not ( = ?auto_88778 ?auto_88782 ) ) ( not ( = ?auto_88779 ?auto_88780 ) ) ( not ( = ?auto_88779 ?auto_88781 ) ) ( not ( = ?auto_88779 ?auto_88782 ) ) ( not ( = ?auto_88780 ?auto_88781 ) ) ( not ( = ?auto_88780 ?auto_88782 ) ) ( not ( = ?auto_88781 ?auto_88782 ) ) ( ON ?auto_88782 ?auto_88783 ) ( not ( = ?auto_88777 ?auto_88783 ) ) ( not ( = ?auto_88778 ?auto_88783 ) ) ( not ( = ?auto_88779 ?auto_88783 ) ) ( not ( = ?auto_88780 ?auto_88783 ) ) ( not ( = ?auto_88781 ?auto_88783 ) ) ( not ( = ?auto_88782 ?auto_88783 ) ) ( ON ?auto_88781 ?auto_88782 ) ( ON-TABLE ?auto_88783 ) ( ON ?auto_88780 ?auto_88781 ) ( CLEAR ?auto_88778 ) ( ON ?auto_88779 ?auto_88780 ) ( CLEAR ?auto_88779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88783 ?auto_88782 ?auto_88781 ?auto_88780 )
      ( MAKE-6PILE ?auto_88777 ?auto_88778 ?auto_88779 ?auto_88780 ?auto_88781 ?auto_88782 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88784 - BLOCK
      ?auto_88785 - BLOCK
      ?auto_88786 - BLOCK
      ?auto_88787 - BLOCK
      ?auto_88788 - BLOCK
      ?auto_88789 - BLOCK
    )
    :vars
    (
      ?auto_88790 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88784 ) ( not ( = ?auto_88784 ?auto_88785 ) ) ( not ( = ?auto_88784 ?auto_88786 ) ) ( not ( = ?auto_88784 ?auto_88787 ) ) ( not ( = ?auto_88784 ?auto_88788 ) ) ( not ( = ?auto_88784 ?auto_88789 ) ) ( not ( = ?auto_88785 ?auto_88786 ) ) ( not ( = ?auto_88785 ?auto_88787 ) ) ( not ( = ?auto_88785 ?auto_88788 ) ) ( not ( = ?auto_88785 ?auto_88789 ) ) ( not ( = ?auto_88786 ?auto_88787 ) ) ( not ( = ?auto_88786 ?auto_88788 ) ) ( not ( = ?auto_88786 ?auto_88789 ) ) ( not ( = ?auto_88787 ?auto_88788 ) ) ( not ( = ?auto_88787 ?auto_88789 ) ) ( not ( = ?auto_88788 ?auto_88789 ) ) ( ON ?auto_88789 ?auto_88790 ) ( not ( = ?auto_88784 ?auto_88790 ) ) ( not ( = ?auto_88785 ?auto_88790 ) ) ( not ( = ?auto_88786 ?auto_88790 ) ) ( not ( = ?auto_88787 ?auto_88790 ) ) ( not ( = ?auto_88788 ?auto_88790 ) ) ( not ( = ?auto_88789 ?auto_88790 ) ) ( ON ?auto_88788 ?auto_88789 ) ( ON-TABLE ?auto_88790 ) ( ON ?auto_88787 ?auto_88788 ) ( ON ?auto_88786 ?auto_88787 ) ( CLEAR ?auto_88786 ) ( HOLDING ?auto_88785 ) ( CLEAR ?auto_88784 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88784 ?auto_88785 )
      ( MAKE-6PILE ?auto_88784 ?auto_88785 ?auto_88786 ?auto_88787 ?auto_88788 ?auto_88789 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88791 - BLOCK
      ?auto_88792 - BLOCK
      ?auto_88793 - BLOCK
      ?auto_88794 - BLOCK
      ?auto_88795 - BLOCK
      ?auto_88796 - BLOCK
    )
    :vars
    (
      ?auto_88797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88791 ) ( not ( = ?auto_88791 ?auto_88792 ) ) ( not ( = ?auto_88791 ?auto_88793 ) ) ( not ( = ?auto_88791 ?auto_88794 ) ) ( not ( = ?auto_88791 ?auto_88795 ) ) ( not ( = ?auto_88791 ?auto_88796 ) ) ( not ( = ?auto_88792 ?auto_88793 ) ) ( not ( = ?auto_88792 ?auto_88794 ) ) ( not ( = ?auto_88792 ?auto_88795 ) ) ( not ( = ?auto_88792 ?auto_88796 ) ) ( not ( = ?auto_88793 ?auto_88794 ) ) ( not ( = ?auto_88793 ?auto_88795 ) ) ( not ( = ?auto_88793 ?auto_88796 ) ) ( not ( = ?auto_88794 ?auto_88795 ) ) ( not ( = ?auto_88794 ?auto_88796 ) ) ( not ( = ?auto_88795 ?auto_88796 ) ) ( ON ?auto_88796 ?auto_88797 ) ( not ( = ?auto_88791 ?auto_88797 ) ) ( not ( = ?auto_88792 ?auto_88797 ) ) ( not ( = ?auto_88793 ?auto_88797 ) ) ( not ( = ?auto_88794 ?auto_88797 ) ) ( not ( = ?auto_88795 ?auto_88797 ) ) ( not ( = ?auto_88796 ?auto_88797 ) ) ( ON ?auto_88795 ?auto_88796 ) ( ON-TABLE ?auto_88797 ) ( ON ?auto_88794 ?auto_88795 ) ( ON ?auto_88793 ?auto_88794 ) ( CLEAR ?auto_88791 ) ( ON ?auto_88792 ?auto_88793 ) ( CLEAR ?auto_88792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88797 ?auto_88796 ?auto_88795 ?auto_88794 ?auto_88793 )
      ( MAKE-6PILE ?auto_88791 ?auto_88792 ?auto_88793 ?auto_88794 ?auto_88795 ?auto_88796 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88798 - BLOCK
      ?auto_88799 - BLOCK
      ?auto_88800 - BLOCK
      ?auto_88801 - BLOCK
      ?auto_88802 - BLOCK
      ?auto_88803 - BLOCK
    )
    :vars
    (
      ?auto_88804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88798 ?auto_88799 ) ) ( not ( = ?auto_88798 ?auto_88800 ) ) ( not ( = ?auto_88798 ?auto_88801 ) ) ( not ( = ?auto_88798 ?auto_88802 ) ) ( not ( = ?auto_88798 ?auto_88803 ) ) ( not ( = ?auto_88799 ?auto_88800 ) ) ( not ( = ?auto_88799 ?auto_88801 ) ) ( not ( = ?auto_88799 ?auto_88802 ) ) ( not ( = ?auto_88799 ?auto_88803 ) ) ( not ( = ?auto_88800 ?auto_88801 ) ) ( not ( = ?auto_88800 ?auto_88802 ) ) ( not ( = ?auto_88800 ?auto_88803 ) ) ( not ( = ?auto_88801 ?auto_88802 ) ) ( not ( = ?auto_88801 ?auto_88803 ) ) ( not ( = ?auto_88802 ?auto_88803 ) ) ( ON ?auto_88803 ?auto_88804 ) ( not ( = ?auto_88798 ?auto_88804 ) ) ( not ( = ?auto_88799 ?auto_88804 ) ) ( not ( = ?auto_88800 ?auto_88804 ) ) ( not ( = ?auto_88801 ?auto_88804 ) ) ( not ( = ?auto_88802 ?auto_88804 ) ) ( not ( = ?auto_88803 ?auto_88804 ) ) ( ON ?auto_88802 ?auto_88803 ) ( ON-TABLE ?auto_88804 ) ( ON ?auto_88801 ?auto_88802 ) ( ON ?auto_88800 ?auto_88801 ) ( ON ?auto_88799 ?auto_88800 ) ( CLEAR ?auto_88799 ) ( HOLDING ?auto_88798 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88798 )
      ( MAKE-6PILE ?auto_88798 ?auto_88799 ?auto_88800 ?auto_88801 ?auto_88802 ?auto_88803 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88805 - BLOCK
      ?auto_88806 - BLOCK
      ?auto_88807 - BLOCK
      ?auto_88808 - BLOCK
      ?auto_88809 - BLOCK
      ?auto_88810 - BLOCK
    )
    :vars
    (
      ?auto_88811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88805 ?auto_88806 ) ) ( not ( = ?auto_88805 ?auto_88807 ) ) ( not ( = ?auto_88805 ?auto_88808 ) ) ( not ( = ?auto_88805 ?auto_88809 ) ) ( not ( = ?auto_88805 ?auto_88810 ) ) ( not ( = ?auto_88806 ?auto_88807 ) ) ( not ( = ?auto_88806 ?auto_88808 ) ) ( not ( = ?auto_88806 ?auto_88809 ) ) ( not ( = ?auto_88806 ?auto_88810 ) ) ( not ( = ?auto_88807 ?auto_88808 ) ) ( not ( = ?auto_88807 ?auto_88809 ) ) ( not ( = ?auto_88807 ?auto_88810 ) ) ( not ( = ?auto_88808 ?auto_88809 ) ) ( not ( = ?auto_88808 ?auto_88810 ) ) ( not ( = ?auto_88809 ?auto_88810 ) ) ( ON ?auto_88810 ?auto_88811 ) ( not ( = ?auto_88805 ?auto_88811 ) ) ( not ( = ?auto_88806 ?auto_88811 ) ) ( not ( = ?auto_88807 ?auto_88811 ) ) ( not ( = ?auto_88808 ?auto_88811 ) ) ( not ( = ?auto_88809 ?auto_88811 ) ) ( not ( = ?auto_88810 ?auto_88811 ) ) ( ON ?auto_88809 ?auto_88810 ) ( ON-TABLE ?auto_88811 ) ( ON ?auto_88808 ?auto_88809 ) ( ON ?auto_88807 ?auto_88808 ) ( ON ?auto_88806 ?auto_88807 ) ( ON ?auto_88805 ?auto_88806 ) ( CLEAR ?auto_88805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88811 ?auto_88810 ?auto_88809 ?auto_88808 ?auto_88807 ?auto_88806 )
      ( MAKE-6PILE ?auto_88805 ?auto_88806 ?auto_88807 ?auto_88808 ?auto_88809 ?auto_88810 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88818 - BLOCK
      ?auto_88819 - BLOCK
      ?auto_88820 - BLOCK
      ?auto_88821 - BLOCK
      ?auto_88822 - BLOCK
      ?auto_88823 - BLOCK
    )
    :vars
    (
      ?auto_88824 - BLOCK
      ?auto_88825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88818 ?auto_88819 ) ) ( not ( = ?auto_88818 ?auto_88820 ) ) ( not ( = ?auto_88818 ?auto_88821 ) ) ( not ( = ?auto_88818 ?auto_88822 ) ) ( not ( = ?auto_88818 ?auto_88823 ) ) ( not ( = ?auto_88819 ?auto_88820 ) ) ( not ( = ?auto_88819 ?auto_88821 ) ) ( not ( = ?auto_88819 ?auto_88822 ) ) ( not ( = ?auto_88819 ?auto_88823 ) ) ( not ( = ?auto_88820 ?auto_88821 ) ) ( not ( = ?auto_88820 ?auto_88822 ) ) ( not ( = ?auto_88820 ?auto_88823 ) ) ( not ( = ?auto_88821 ?auto_88822 ) ) ( not ( = ?auto_88821 ?auto_88823 ) ) ( not ( = ?auto_88822 ?auto_88823 ) ) ( ON ?auto_88823 ?auto_88824 ) ( not ( = ?auto_88818 ?auto_88824 ) ) ( not ( = ?auto_88819 ?auto_88824 ) ) ( not ( = ?auto_88820 ?auto_88824 ) ) ( not ( = ?auto_88821 ?auto_88824 ) ) ( not ( = ?auto_88822 ?auto_88824 ) ) ( not ( = ?auto_88823 ?auto_88824 ) ) ( ON ?auto_88822 ?auto_88823 ) ( ON-TABLE ?auto_88824 ) ( ON ?auto_88821 ?auto_88822 ) ( ON ?auto_88820 ?auto_88821 ) ( ON ?auto_88819 ?auto_88820 ) ( CLEAR ?auto_88819 ) ( ON ?auto_88818 ?auto_88825 ) ( CLEAR ?auto_88818 ) ( HAND-EMPTY ) ( not ( = ?auto_88818 ?auto_88825 ) ) ( not ( = ?auto_88819 ?auto_88825 ) ) ( not ( = ?auto_88820 ?auto_88825 ) ) ( not ( = ?auto_88821 ?auto_88825 ) ) ( not ( = ?auto_88822 ?auto_88825 ) ) ( not ( = ?auto_88823 ?auto_88825 ) ) ( not ( = ?auto_88824 ?auto_88825 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88818 ?auto_88825 )
      ( MAKE-6PILE ?auto_88818 ?auto_88819 ?auto_88820 ?auto_88821 ?auto_88822 ?auto_88823 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88826 - BLOCK
      ?auto_88827 - BLOCK
      ?auto_88828 - BLOCK
      ?auto_88829 - BLOCK
      ?auto_88830 - BLOCK
      ?auto_88831 - BLOCK
    )
    :vars
    (
      ?auto_88833 - BLOCK
      ?auto_88832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88826 ?auto_88827 ) ) ( not ( = ?auto_88826 ?auto_88828 ) ) ( not ( = ?auto_88826 ?auto_88829 ) ) ( not ( = ?auto_88826 ?auto_88830 ) ) ( not ( = ?auto_88826 ?auto_88831 ) ) ( not ( = ?auto_88827 ?auto_88828 ) ) ( not ( = ?auto_88827 ?auto_88829 ) ) ( not ( = ?auto_88827 ?auto_88830 ) ) ( not ( = ?auto_88827 ?auto_88831 ) ) ( not ( = ?auto_88828 ?auto_88829 ) ) ( not ( = ?auto_88828 ?auto_88830 ) ) ( not ( = ?auto_88828 ?auto_88831 ) ) ( not ( = ?auto_88829 ?auto_88830 ) ) ( not ( = ?auto_88829 ?auto_88831 ) ) ( not ( = ?auto_88830 ?auto_88831 ) ) ( ON ?auto_88831 ?auto_88833 ) ( not ( = ?auto_88826 ?auto_88833 ) ) ( not ( = ?auto_88827 ?auto_88833 ) ) ( not ( = ?auto_88828 ?auto_88833 ) ) ( not ( = ?auto_88829 ?auto_88833 ) ) ( not ( = ?auto_88830 ?auto_88833 ) ) ( not ( = ?auto_88831 ?auto_88833 ) ) ( ON ?auto_88830 ?auto_88831 ) ( ON-TABLE ?auto_88833 ) ( ON ?auto_88829 ?auto_88830 ) ( ON ?auto_88828 ?auto_88829 ) ( ON ?auto_88826 ?auto_88832 ) ( CLEAR ?auto_88826 ) ( not ( = ?auto_88826 ?auto_88832 ) ) ( not ( = ?auto_88827 ?auto_88832 ) ) ( not ( = ?auto_88828 ?auto_88832 ) ) ( not ( = ?auto_88829 ?auto_88832 ) ) ( not ( = ?auto_88830 ?auto_88832 ) ) ( not ( = ?auto_88831 ?auto_88832 ) ) ( not ( = ?auto_88833 ?auto_88832 ) ) ( HOLDING ?auto_88827 ) ( CLEAR ?auto_88828 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88833 ?auto_88831 ?auto_88830 ?auto_88829 ?auto_88828 ?auto_88827 )
      ( MAKE-6PILE ?auto_88826 ?auto_88827 ?auto_88828 ?auto_88829 ?auto_88830 ?auto_88831 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88834 - BLOCK
      ?auto_88835 - BLOCK
      ?auto_88836 - BLOCK
      ?auto_88837 - BLOCK
      ?auto_88838 - BLOCK
      ?auto_88839 - BLOCK
    )
    :vars
    (
      ?auto_88841 - BLOCK
      ?auto_88840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88834 ?auto_88835 ) ) ( not ( = ?auto_88834 ?auto_88836 ) ) ( not ( = ?auto_88834 ?auto_88837 ) ) ( not ( = ?auto_88834 ?auto_88838 ) ) ( not ( = ?auto_88834 ?auto_88839 ) ) ( not ( = ?auto_88835 ?auto_88836 ) ) ( not ( = ?auto_88835 ?auto_88837 ) ) ( not ( = ?auto_88835 ?auto_88838 ) ) ( not ( = ?auto_88835 ?auto_88839 ) ) ( not ( = ?auto_88836 ?auto_88837 ) ) ( not ( = ?auto_88836 ?auto_88838 ) ) ( not ( = ?auto_88836 ?auto_88839 ) ) ( not ( = ?auto_88837 ?auto_88838 ) ) ( not ( = ?auto_88837 ?auto_88839 ) ) ( not ( = ?auto_88838 ?auto_88839 ) ) ( ON ?auto_88839 ?auto_88841 ) ( not ( = ?auto_88834 ?auto_88841 ) ) ( not ( = ?auto_88835 ?auto_88841 ) ) ( not ( = ?auto_88836 ?auto_88841 ) ) ( not ( = ?auto_88837 ?auto_88841 ) ) ( not ( = ?auto_88838 ?auto_88841 ) ) ( not ( = ?auto_88839 ?auto_88841 ) ) ( ON ?auto_88838 ?auto_88839 ) ( ON-TABLE ?auto_88841 ) ( ON ?auto_88837 ?auto_88838 ) ( ON ?auto_88836 ?auto_88837 ) ( ON ?auto_88834 ?auto_88840 ) ( not ( = ?auto_88834 ?auto_88840 ) ) ( not ( = ?auto_88835 ?auto_88840 ) ) ( not ( = ?auto_88836 ?auto_88840 ) ) ( not ( = ?auto_88837 ?auto_88840 ) ) ( not ( = ?auto_88838 ?auto_88840 ) ) ( not ( = ?auto_88839 ?auto_88840 ) ) ( not ( = ?auto_88841 ?auto_88840 ) ) ( CLEAR ?auto_88836 ) ( ON ?auto_88835 ?auto_88834 ) ( CLEAR ?auto_88835 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88840 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88840 ?auto_88834 )
      ( MAKE-6PILE ?auto_88834 ?auto_88835 ?auto_88836 ?auto_88837 ?auto_88838 ?auto_88839 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88842 - BLOCK
      ?auto_88843 - BLOCK
      ?auto_88844 - BLOCK
      ?auto_88845 - BLOCK
      ?auto_88846 - BLOCK
      ?auto_88847 - BLOCK
    )
    :vars
    (
      ?auto_88848 - BLOCK
      ?auto_88849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88842 ?auto_88843 ) ) ( not ( = ?auto_88842 ?auto_88844 ) ) ( not ( = ?auto_88842 ?auto_88845 ) ) ( not ( = ?auto_88842 ?auto_88846 ) ) ( not ( = ?auto_88842 ?auto_88847 ) ) ( not ( = ?auto_88843 ?auto_88844 ) ) ( not ( = ?auto_88843 ?auto_88845 ) ) ( not ( = ?auto_88843 ?auto_88846 ) ) ( not ( = ?auto_88843 ?auto_88847 ) ) ( not ( = ?auto_88844 ?auto_88845 ) ) ( not ( = ?auto_88844 ?auto_88846 ) ) ( not ( = ?auto_88844 ?auto_88847 ) ) ( not ( = ?auto_88845 ?auto_88846 ) ) ( not ( = ?auto_88845 ?auto_88847 ) ) ( not ( = ?auto_88846 ?auto_88847 ) ) ( ON ?auto_88847 ?auto_88848 ) ( not ( = ?auto_88842 ?auto_88848 ) ) ( not ( = ?auto_88843 ?auto_88848 ) ) ( not ( = ?auto_88844 ?auto_88848 ) ) ( not ( = ?auto_88845 ?auto_88848 ) ) ( not ( = ?auto_88846 ?auto_88848 ) ) ( not ( = ?auto_88847 ?auto_88848 ) ) ( ON ?auto_88846 ?auto_88847 ) ( ON-TABLE ?auto_88848 ) ( ON ?auto_88845 ?auto_88846 ) ( ON ?auto_88842 ?auto_88849 ) ( not ( = ?auto_88842 ?auto_88849 ) ) ( not ( = ?auto_88843 ?auto_88849 ) ) ( not ( = ?auto_88844 ?auto_88849 ) ) ( not ( = ?auto_88845 ?auto_88849 ) ) ( not ( = ?auto_88846 ?auto_88849 ) ) ( not ( = ?auto_88847 ?auto_88849 ) ) ( not ( = ?auto_88848 ?auto_88849 ) ) ( ON ?auto_88843 ?auto_88842 ) ( CLEAR ?auto_88843 ) ( ON-TABLE ?auto_88849 ) ( HOLDING ?auto_88844 ) ( CLEAR ?auto_88845 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88848 ?auto_88847 ?auto_88846 ?auto_88845 ?auto_88844 )
      ( MAKE-6PILE ?auto_88842 ?auto_88843 ?auto_88844 ?auto_88845 ?auto_88846 ?auto_88847 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88850 - BLOCK
      ?auto_88851 - BLOCK
      ?auto_88852 - BLOCK
      ?auto_88853 - BLOCK
      ?auto_88854 - BLOCK
      ?auto_88855 - BLOCK
    )
    :vars
    (
      ?auto_88857 - BLOCK
      ?auto_88856 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88850 ?auto_88851 ) ) ( not ( = ?auto_88850 ?auto_88852 ) ) ( not ( = ?auto_88850 ?auto_88853 ) ) ( not ( = ?auto_88850 ?auto_88854 ) ) ( not ( = ?auto_88850 ?auto_88855 ) ) ( not ( = ?auto_88851 ?auto_88852 ) ) ( not ( = ?auto_88851 ?auto_88853 ) ) ( not ( = ?auto_88851 ?auto_88854 ) ) ( not ( = ?auto_88851 ?auto_88855 ) ) ( not ( = ?auto_88852 ?auto_88853 ) ) ( not ( = ?auto_88852 ?auto_88854 ) ) ( not ( = ?auto_88852 ?auto_88855 ) ) ( not ( = ?auto_88853 ?auto_88854 ) ) ( not ( = ?auto_88853 ?auto_88855 ) ) ( not ( = ?auto_88854 ?auto_88855 ) ) ( ON ?auto_88855 ?auto_88857 ) ( not ( = ?auto_88850 ?auto_88857 ) ) ( not ( = ?auto_88851 ?auto_88857 ) ) ( not ( = ?auto_88852 ?auto_88857 ) ) ( not ( = ?auto_88853 ?auto_88857 ) ) ( not ( = ?auto_88854 ?auto_88857 ) ) ( not ( = ?auto_88855 ?auto_88857 ) ) ( ON ?auto_88854 ?auto_88855 ) ( ON-TABLE ?auto_88857 ) ( ON ?auto_88853 ?auto_88854 ) ( ON ?auto_88850 ?auto_88856 ) ( not ( = ?auto_88850 ?auto_88856 ) ) ( not ( = ?auto_88851 ?auto_88856 ) ) ( not ( = ?auto_88852 ?auto_88856 ) ) ( not ( = ?auto_88853 ?auto_88856 ) ) ( not ( = ?auto_88854 ?auto_88856 ) ) ( not ( = ?auto_88855 ?auto_88856 ) ) ( not ( = ?auto_88857 ?auto_88856 ) ) ( ON ?auto_88851 ?auto_88850 ) ( ON-TABLE ?auto_88856 ) ( CLEAR ?auto_88853 ) ( ON ?auto_88852 ?auto_88851 ) ( CLEAR ?auto_88852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88856 ?auto_88850 ?auto_88851 )
      ( MAKE-6PILE ?auto_88850 ?auto_88851 ?auto_88852 ?auto_88853 ?auto_88854 ?auto_88855 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88858 - BLOCK
      ?auto_88859 - BLOCK
      ?auto_88860 - BLOCK
      ?auto_88861 - BLOCK
      ?auto_88862 - BLOCK
      ?auto_88863 - BLOCK
    )
    :vars
    (
      ?auto_88865 - BLOCK
      ?auto_88864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88858 ?auto_88859 ) ) ( not ( = ?auto_88858 ?auto_88860 ) ) ( not ( = ?auto_88858 ?auto_88861 ) ) ( not ( = ?auto_88858 ?auto_88862 ) ) ( not ( = ?auto_88858 ?auto_88863 ) ) ( not ( = ?auto_88859 ?auto_88860 ) ) ( not ( = ?auto_88859 ?auto_88861 ) ) ( not ( = ?auto_88859 ?auto_88862 ) ) ( not ( = ?auto_88859 ?auto_88863 ) ) ( not ( = ?auto_88860 ?auto_88861 ) ) ( not ( = ?auto_88860 ?auto_88862 ) ) ( not ( = ?auto_88860 ?auto_88863 ) ) ( not ( = ?auto_88861 ?auto_88862 ) ) ( not ( = ?auto_88861 ?auto_88863 ) ) ( not ( = ?auto_88862 ?auto_88863 ) ) ( ON ?auto_88863 ?auto_88865 ) ( not ( = ?auto_88858 ?auto_88865 ) ) ( not ( = ?auto_88859 ?auto_88865 ) ) ( not ( = ?auto_88860 ?auto_88865 ) ) ( not ( = ?auto_88861 ?auto_88865 ) ) ( not ( = ?auto_88862 ?auto_88865 ) ) ( not ( = ?auto_88863 ?auto_88865 ) ) ( ON ?auto_88862 ?auto_88863 ) ( ON-TABLE ?auto_88865 ) ( ON ?auto_88858 ?auto_88864 ) ( not ( = ?auto_88858 ?auto_88864 ) ) ( not ( = ?auto_88859 ?auto_88864 ) ) ( not ( = ?auto_88860 ?auto_88864 ) ) ( not ( = ?auto_88861 ?auto_88864 ) ) ( not ( = ?auto_88862 ?auto_88864 ) ) ( not ( = ?auto_88863 ?auto_88864 ) ) ( not ( = ?auto_88865 ?auto_88864 ) ) ( ON ?auto_88859 ?auto_88858 ) ( ON-TABLE ?auto_88864 ) ( ON ?auto_88860 ?auto_88859 ) ( CLEAR ?auto_88860 ) ( HOLDING ?auto_88861 ) ( CLEAR ?auto_88862 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88865 ?auto_88863 ?auto_88862 ?auto_88861 )
      ( MAKE-6PILE ?auto_88858 ?auto_88859 ?auto_88860 ?auto_88861 ?auto_88862 ?auto_88863 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88866 - BLOCK
      ?auto_88867 - BLOCK
      ?auto_88868 - BLOCK
      ?auto_88869 - BLOCK
      ?auto_88870 - BLOCK
      ?auto_88871 - BLOCK
    )
    :vars
    (
      ?auto_88873 - BLOCK
      ?auto_88872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88866 ?auto_88867 ) ) ( not ( = ?auto_88866 ?auto_88868 ) ) ( not ( = ?auto_88866 ?auto_88869 ) ) ( not ( = ?auto_88866 ?auto_88870 ) ) ( not ( = ?auto_88866 ?auto_88871 ) ) ( not ( = ?auto_88867 ?auto_88868 ) ) ( not ( = ?auto_88867 ?auto_88869 ) ) ( not ( = ?auto_88867 ?auto_88870 ) ) ( not ( = ?auto_88867 ?auto_88871 ) ) ( not ( = ?auto_88868 ?auto_88869 ) ) ( not ( = ?auto_88868 ?auto_88870 ) ) ( not ( = ?auto_88868 ?auto_88871 ) ) ( not ( = ?auto_88869 ?auto_88870 ) ) ( not ( = ?auto_88869 ?auto_88871 ) ) ( not ( = ?auto_88870 ?auto_88871 ) ) ( ON ?auto_88871 ?auto_88873 ) ( not ( = ?auto_88866 ?auto_88873 ) ) ( not ( = ?auto_88867 ?auto_88873 ) ) ( not ( = ?auto_88868 ?auto_88873 ) ) ( not ( = ?auto_88869 ?auto_88873 ) ) ( not ( = ?auto_88870 ?auto_88873 ) ) ( not ( = ?auto_88871 ?auto_88873 ) ) ( ON ?auto_88870 ?auto_88871 ) ( ON-TABLE ?auto_88873 ) ( ON ?auto_88866 ?auto_88872 ) ( not ( = ?auto_88866 ?auto_88872 ) ) ( not ( = ?auto_88867 ?auto_88872 ) ) ( not ( = ?auto_88868 ?auto_88872 ) ) ( not ( = ?auto_88869 ?auto_88872 ) ) ( not ( = ?auto_88870 ?auto_88872 ) ) ( not ( = ?auto_88871 ?auto_88872 ) ) ( not ( = ?auto_88873 ?auto_88872 ) ) ( ON ?auto_88867 ?auto_88866 ) ( ON-TABLE ?auto_88872 ) ( ON ?auto_88868 ?auto_88867 ) ( CLEAR ?auto_88870 ) ( ON ?auto_88869 ?auto_88868 ) ( CLEAR ?auto_88869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88872 ?auto_88866 ?auto_88867 ?auto_88868 )
      ( MAKE-6PILE ?auto_88866 ?auto_88867 ?auto_88868 ?auto_88869 ?auto_88870 ?auto_88871 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88874 - BLOCK
      ?auto_88875 - BLOCK
      ?auto_88876 - BLOCK
      ?auto_88877 - BLOCK
      ?auto_88878 - BLOCK
      ?auto_88879 - BLOCK
    )
    :vars
    (
      ?auto_88881 - BLOCK
      ?auto_88880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88874 ?auto_88875 ) ) ( not ( = ?auto_88874 ?auto_88876 ) ) ( not ( = ?auto_88874 ?auto_88877 ) ) ( not ( = ?auto_88874 ?auto_88878 ) ) ( not ( = ?auto_88874 ?auto_88879 ) ) ( not ( = ?auto_88875 ?auto_88876 ) ) ( not ( = ?auto_88875 ?auto_88877 ) ) ( not ( = ?auto_88875 ?auto_88878 ) ) ( not ( = ?auto_88875 ?auto_88879 ) ) ( not ( = ?auto_88876 ?auto_88877 ) ) ( not ( = ?auto_88876 ?auto_88878 ) ) ( not ( = ?auto_88876 ?auto_88879 ) ) ( not ( = ?auto_88877 ?auto_88878 ) ) ( not ( = ?auto_88877 ?auto_88879 ) ) ( not ( = ?auto_88878 ?auto_88879 ) ) ( ON ?auto_88879 ?auto_88881 ) ( not ( = ?auto_88874 ?auto_88881 ) ) ( not ( = ?auto_88875 ?auto_88881 ) ) ( not ( = ?auto_88876 ?auto_88881 ) ) ( not ( = ?auto_88877 ?auto_88881 ) ) ( not ( = ?auto_88878 ?auto_88881 ) ) ( not ( = ?auto_88879 ?auto_88881 ) ) ( ON-TABLE ?auto_88881 ) ( ON ?auto_88874 ?auto_88880 ) ( not ( = ?auto_88874 ?auto_88880 ) ) ( not ( = ?auto_88875 ?auto_88880 ) ) ( not ( = ?auto_88876 ?auto_88880 ) ) ( not ( = ?auto_88877 ?auto_88880 ) ) ( not ( = ?auto_88878 ?auto_88880 ) ) ( not ( = ?auto_88879 ?auto_88880 ) ) ( not ( = ?auto_88881 ?auto_88880 ) ) ( ON ?auto_88875 ?auto_88874 ) ( ON-TABLE ?auto_88880 ) ( ON ?auto_88876 ?auto_88875 ) ( ON ?auto_88877 ?auto_88876 ) ( CLEAR ?auto_88877 ) ( HOLDING ?auto_88878 ) ( CLEAR ?auto_88879 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88881 ?auto_88879 ?auto_88878 )
      ( MAKE-6PILE ?auto_88874 ?auto_88875 ?auto_88876 ?auto_88877 ?auto_88878 ?auto_88879 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88882 - BLOCK
      ?auto_88883 - BLOCK
      ?auto_88884 - BLOCK
      ?auto_88885 - BLOCK
      ?auto_88886 - BLOCK
      ?auto_88887 - BLOCK
    )
    :vars
    (
      ?auto_88888 - BLOCK
      ?auto_88889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88882 ?auto_88883 ) ) ( not ( = ?auto_88882 ?auto_88884 ) ) ( not ( = ?auto_88882 ?auto_88885 ) ) ( not ( = ?auto_88882 ?auto_88886 ) ) ( not ( = ?auto_88882 ?auto_88887 ) ) ( not ( = ?auto_88883 ?auto_88884 ) ) ( not ( = ?auto_88883 ?auto_88885 ) ) ( not ( = ?auto_88883 ?auto_88886 ) ) ( not ( = ?auto_88883 ?auto_88887 ) ) ( not ( = ?auto_88884 ?auto_88885 ) ) ( not ( = ?auto_88884 ?auto_88886 ) ) ( not ( = ?auto_88884 ?auto_88887 ) ) ( not ( = ?auto_88885 ?auto_88886 ) ) ( not ( = ?auto_88885 ?auto_88887 ) ) ( not ( = ?auto_88886 ?auto_88887 ) ) ( ON ?auto_88887 ?auto_88888 ) ( not ( = ?auto_88882 ?auto_88888 ) ) ( not ( = ?auto_88883 ?auto_88888 ) ) ( not ( = ?auto_88884 ?auto_88888 ) ) ( not ( = ?auto_88885 ?auto_88888 ) ) ( not ( = ?auto_88886 ?auto_88888 ) ) ( not ( = ?auto_88887 ?auto_88888 ) ) ( ON-TABLE ?auto_88888 ) ( ON ?auto_88882 ?auto_88889 ) ( not ( = ?auto_88882 ?auto_88889 ) ) ( not ( = ?auto_88883 ?auto_88889 ) ) ( not ( = ?auto_88884 ?auto_88889 ) ) ( not ( = ?auto_88885 ?auto_88889 ) ) ( not ( = ?auto_88886 ?auto_88889 ) ) ( not ( = ?auto_88887 ?auto_88889 ) ) ( not ( = ?auto_88888 ?auto_88889 ) ) ( ON ?auto_88883 ?auto_88882 ) ( ON-TABLE ?auto_88889 ) ( ON ?auto_88884 ?auto_88883 ) ( ON ?auto_88885 ?auto_88884 ) ( CLEAR ?auto_88887 ) ( ON ?auto_88886 ?auto_88885 ) ( CLEAR ?auto_88886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88889 ?auto_88882 ?auto_88883 ?auto_88884 ?auto_88885 )
      ( MAKE-6PILE ?auto_88882 ?auto_88883 ?auto_88884 ?auto_88885 ?auto_88886 ?auto_88887 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88890 - BLOCK
      ?auto_88891 - BLOCK
      ?auto_88892 - BLOCK
      ?auto_88893 - BLOCK
      ?auto_88894 - BLOCK
      ?auto_88895 - BLOCK
    )
    :vars
    (
      ?auto_88896 - BLOCK
      ?auto_88897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88890 ?auto_88891 ) ) ( not ( = ?auto_88890 ?auto_88892 ) ) ( not ( = ?auto_88890 ?auto_88893 ) ) ( not ( = ?auto_88890 ?auto_88894 ) ) ( not ( = ?auto_88890 ?auto_88895 ) ) ( not ( = ?auto_88891 ?auto_88892 ) ) ( not ( = ?auto_88891 ?auto_88893 ) ) ( not ( = ?auto_88891 ?auto_88894 ) ) ( not ( = ?auto_88891 ?auto_88895 ) ) ( not ( = ?auto_88892 ?auto_88893 ) ) ( not ( = ?auto_88892 ?auto_88894 ) ) ( not ( = ?auto_88892 ?auto_88895 ) ) ( not ( = ?auto_88893 ?auto_88894 ) ) ( not ( = ?auto_88893 ?auto_88895 ) ) ( not ( = ?auto_88894 ?auto_88895 ) ) ( not ( = ?auto_88890 ?auto_88896 ) ) ( not ( = ?auto_88891 ?auto_88896 ) ) ( not ( = ?auto_88892 ?auto_88896 ) ) ( not ( = ?auto_88893 ?auto_88896 ) ) ( not ( = ?auto_88894 ?auto_88896 ) ) ( not ( = ?auto_88895 ?auto_88896 ) ) ( ON-TABLE ?auto_88896 ) ( ON ?auto_88890 ?auto_88897 ) ( not ( = ?auto_88890 ?auto_88897 ) ) ( not ( = ?auto_88891 ?auto_88897 ) ) ( not ( = ?auto_88892 ?auto_88897 ) ) ( not ( = ?auto_88893 ?auto_88897 ) ) ( not ( = ?auto_88894 ?auto_88897 ) ) ( not ( = ?auto_88895 ?auto_88897 ) ) ( not ( = ?auto_88896 ?auto_88897 ) ) ( ON ?auto_88891 ?auto_88890 ) ( ON-TABLE ?auto_88897 ) ( ON ?auto_88892 ?auto_88891 ) ( ON ?auto_88893 ?auto_88892 ) ( ON ?auto_88894 ?auto_88893 ) ( CLEAR ?auto_88894 ) ( HOLDING ?auto_88895 ) ( CLEAR ?auto_88896 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88896 ?auto_88895 )
      ( MAKE-6PILE ?auto_88890 ?auto_88891 ?auto_88892 ?auto_88893 ?auto_88894 ?auto_88895 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88898 - BLOCK
      ?auto_88899 - BLOCK
      ?auto_88900 - BLOCK
      ?auto_88901 - BLOCK
      ?auto_88902 - BLOCK
      ?auto_88903 - BLOCK
    )
    :vars
    (
      ?auto_88905 - BLOCK
      ?auto_88904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88898 ?auto_88899 ) ) ( not ( = ?auto_88898 ?auto_88900 ) ) ( not ( = ?auto_88898 ?auto_88901 ) ) ( not ( = ?auto_88898 ?auto_88902 ) ) ( not ( = ?auto_88898 ?auto_88903 ) ) ( not ( = ?auto_88899 ?auto_88900 ) ) ( not ( = ?auto_88899 ?auto_88901 ) ) ( not ( = ?auto_88899 ?auto_88902 ) ) ( not ( = ?auto_88899 ?auto_88903 ) ) ( not ( = ?auto_88900 ?auto_88901 ) ) ( not ( = ?auto_88900 ?auto_88902 ) ) ( not ( = ?auto_88900 ?auto_88903 ) ) ( not ( = ?auto_88901 ?auto_88902 ) ) ( not ( = ?auto_88901 ?auto_88903 ) ) ( not ( = ?auto_88902 ?auto_88903 ) ) ( not ( = ?auto_88898 ?auto_88905 ) ) ( not ( = ?auto_88899 ?auto_88905 ) ) ( not ( = ?auto_88900 ?auto_88905 ) ) ( not ( = ?auto_88901 ?auto_88905 ) ) ( not ( = ?auto_88902 ?auto_88905 ) ) ( not ( = ?auto_88903 ?auto_88905 ) ) ( ON-TABLE ?auto_88905 ) ( ON ?auto_88898 ?auto_88904 ) ( not ( = ?auto_88898 ?auto_88904 ) ) ( not ( = ?auto_88899 ?auto_88904 ) ) ( not ( = ?auto_88900 ?auto_88904 ) ) ( not ( = ?auto_88901 ?auto_88904 ) ) ( not ( = ?auto_88902 ?auto_88904 ) ) ( not ( = ?auto_88903 ?auto_88904 ) ) ( not ( = ?auto_88905 ?auto_88904 ) ) ( ON ?auto_88899 ?auto_88898 ) ( ON-TABLE ?auto_88904 ) ( ON ?auto_88900 ?auto_88899 ) ( ON ?auto_88901 ?auto_88900 ) ( ON ?auto_88902 ?auto_88901 ) ( CLEAR ?auto_88905 ) ( ON ?auto_88903 ?auto_88902 ) ( CLEAR ?auto_88903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88904 ?auto_88898 ?auto_88899 ?auto_88900 ?auto_88901 ?auto_88902 )
      ( MAKE-6PILE ?auto_88898 ?auto_88899 ?auto_88900 ?auto_88901 ?auto_88902 ?auto_88903 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88906 - BLOCK
      ?auto_88907 - BLOCK
      ?auto_88908 - BLOCK
      ?auto_88909 - BLOCK
      ?auto_88910 - BLOCK
      ?auto_88911 - BLOCK
    )
    :vars
    (
      ?auto_88912 - BLOCK
      ?auto_88913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88906 ?auto_88907 ) ) ( not ( = ?auto_88906 ?auto_88908 ) ) ( not ( = ?auto_88906 ?auto_88909 ) ) ( not ( = ?auto_88906 ?auto_88910 ) ) ( not ( = ?auto_88906 ?auto_88911 ) ) ( not ( = ?auto_88907 ?auto_88908 ) ) ( not ( = ?auto_88907 ?auto_88909 ) ) ( not ( = ?auto_88907 ?auto_88910 ) ) ( not ( = ?auto_88907 ?auto_88911 ) ) ( not ( = ?auto_88908 ?auto_88909 ) ) ( not ( = ?auto_88908 ?auto_88910 ) ) ( not ( = ?auto_88908 ?auto_88911 ) ) ( not ( = ?auto_88909 ?auto_88910 ) ) ( not ( = ?auto_88909 ?auto_88911 ) ) ( not ( = ?auto_88910 ?auto_88911 ) ) ( not ( = ?auto_88906 ?auto_88912 ) ) ( not ( = ?auto_88907 ?auto_88912 ) ) ( not ( = ?auto_88908 ?auto_88912 ) ) ( not ( = ?auto_88909 ?auto_88912 ) ) ( not ( = ?auto_88910 ?auto_88912 ) ) ( not ( = ?auto_88911 ?auto_88912 ) ) ( ON ?auto_88906 ?auto_88913 ) ( not ( = ?auto_88906 ?auto_88913 ) ) ( not ( = ?auto_88907 ?auto_88913 ) ) ( not ( = ?auto_88908 ?auto_88913 ) ) ( not ( = ?auto_88909 ?auto_88913 ) ) ( not ( = ?auto_88910 ?auto_88913 ) ) ( not ( = ?auto_88911 ?auto_88913 ) ) ( not ( = ?auto_88912 ?auto_88913 ) ) ( ON ?auto_88907 ?auto_88906 ) ( ON-TABLE ?auto_88913 ) ( ON ?auto_88908 ?auto_88907 ) ( ON ?auto_88909 ?auto_88908 ) ( ON ?auto_88910 ?auto_88909 ) ( ON ?auto_88911 ?auto_88910 ) ( CLEAR ?auto_88911 ) ( HOLDING ?auto_88912 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88912 )
      ( MAKE-6PILE ?auto_88906 ?auto_88907 ?auto_88908 ?auto_88909 ?auto_88910 ?auto_88911 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_88914 - BLOCK
      ?auto_88915 - BLOCK
      ?auto_88916 - BLOCK
      ?auto_88917 - BLOCK
      ?auto_88918 - BLOCK
      ?auto_88919 - BLOCK
    )
    :vars
    (
      ?auto_88921 - BLOCK
      ?auto_88920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88914 ?auto_88915 ) ) ( not ( = ?auto_88914 ?auto_88916 ) ) ( not ( = ?auto_88914 ?auto_88917 ) ) ( not ( = ?auto_88914 ?auto_88918 ) ) ( not ( = ?auto_88914 ?auto_88919 ) ) ( not ( = ?auto_88915 ?auto_88916 ) ) ( not ( = ?auto_88915 ?auto_88917 ) ) ( not ( = ?auto_88915 ?auto_88918 ) ) ( not ( = ?auto_88915 ?auto_88919 ) ) ( not ( = ?auto_88916 ?auto_88917 ) ) ( not ( = ?auto_88916 ?auto_88918 ) ) ( not ( = ?auto_88916 ?auto_88919 ) ) ( not ( = ?auto_88917 ?auto_88918 ) ) ( not ( = ?auto_88917 ?auto_88919 ) ) ( not ( = ?auto_88918 ?auto_88919 ) ) ( not ( = ?auto_88914 ?auto_88921 ) ) ( not ( = ?auto_88915 ?auto_88921 ) ) ( not ( = ?auto_88916 ?auto_88921 ) ) ( not ( = ?auto_88917 ?auto_88921 ) ) ( not ( = ?auto_88918 ?auto_88921 ) ) ( not ( = ?auto_88919 ?auto_88921 ) ) ( ON ?auto_88914 ?auto_88920 ) ( not ( = ?auto_88914 ?auto_88920 ) ) ( not ( = ?auto_88915 ?auto_88920 ) ) ( not ( = ?auto_88916 ?auto_88920 ) ) ( not ( = ?auto_88917 ?auto_88920 ) ) ( not ( = ?auto_88918 ?auto_88920 ) ) ( not ( = ?auto_88919 ?auto_88920 ) ) ( not ( = ?auto_88921 ?auto_88920 ) ) ( ON ?auto_88915 ?auto_88914 ) ( ON-TABLE ?auto_88920 ) ( ON ?auto_88916 ?auto_88915 ) ( ON ?auto_88917 ?auto_88916 ) ( ON ?auto_88918 ?auto_88917 ) ( ON ?auto_88919 ?auto_88918 ) ( ON ?auto_88921 ?auto_88919 ) ( CLEAR ?auto_88921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88920 ?auto_88914 ?auto_88915 ?auto_88916 ?auto_88917 ?auto_88918 ?auto_88919 )
      ( MAKE-6PILE ?auto_88914 ?auto_88915 ?auto_88916 ?auto_88917 ?auto_88918 ?auto_88919 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_88936 - BLOCK
      ?auto_88937 - BLOCK
      ?auto_88938 - BLOCK
      ?auto_88939 - BLOCK
      ?auto_88940 - BLOCK
      ?auto_88941 - BLOCK
      ?auto_88942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_88941 ) ( ON-TABLE ?auto_88936 ) ( ON ?auto_88937 ?auto_88936 ) ( ON ?auto_88938 ?auto_88937 ) ( ON ?auto_88939 ?auto_88938 ) ( ON ?auto_88940 ?auto_88939 ) ( ON ?auto_88941 ?auto_88940 ) ( not ( = ?auto_88936 ?auto_88937 ) ) ( not ( = ?auto_88936 ?auto_88938 ) ) ( not ( = ?auto_88936 ?auto_88939 ) ) ( not ( = ?auto_88936 ?auto_88940 ) ) ( not ( = ?auto_88936 ?auto_88941 ) ) ( not ( = ?auto_88936 ?auto_88942 ) ) ( not ( = ?auto_88937 ?auto_88938 ) ) ( not ( = ?auto_88937 ?auto_88939 ) ) ( not ( = ?auto_88937 ?auto_88940 ) ) ( not ( = ?auto_88937 ?auto_88941 ) ) ( not ( = ?auto_88937 ?auto_88942 ) ) ( not ( = ?auto_88938 ?auto_88939 ) ) ( not ( = ?auto_88938 ?auto_88940 ) ) ( not ( = ?auto_88938 ?auto_88941 ) ) ( not ( = ?auto_88938 ?auto_88942 ) ) ( not ( = ?auto_88939 ?auto_88940 ) ) ( not ( = ?auto_88939 ?auto_88941 ) ) ( not ( = ?auto_88939 ?auto_88942 ) ) ( not ( = ?auto_88940 ?auto_88941 ) ) ( not ( = ?auto_88940 ?auto_88942 ) ) ( not ( = ?auto_88941 ?auto_88942 ) ) ( ON-TABLE ?auto_88942 ) ( CLEAR ?auto_88942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_88942 )
      ( MAKE-7PILE ?auto_88936 ?auto_88937 ?auto_88938 ?auto_88939 ?auto_88940 ?auto_88941 ?auto_88942 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_88943 - BLOCK
      ?auto_88944 - BLOCK
      ?auto_88945 - BLOCK
      ?auto_88946 - BLOCK
      ?auto_88947 - BLOCK
      ?auto_88948 - BLOCK
      ?auto_88949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88943 ) ( ON ?auto_88944 ?auto_88943 ) ( ON ?auto_88945 ?auto_88944 ) ( ON ?auto_88946 ?auto_88945 ) ( ON ?auto_88947 ?auto_88946 ) ( not ( = ?auto_88943 ?auto_88944 ) ) ( not ( = ?auto_88943 ?auto_88945 ) ) ( not ( = ?auto_88943 ?auto_88946 ) ) ( not ( = ?auto_88943 ?auto_88947 ) ) ( not ( = ?auto_88943 ?auto_88948 ) ) ( not ( = ?auto_88943 ?auto_88949 ) ) ( not ( = ?auto_88944 ?auto_88945 ) ) ( not ( = ?auto_88944 ?auto_88946 ) ) ( not ( = ?auto_88944 ?auto_88947 ) ) ( not ( = ?auto_88944 ?auto_88948 ) ) ( not ( = ?auto_88944 ?auto_88949 ) ) ( not ( = ?auto_88945 ?auto_88946 ) ) ( not ( = ?auto_88945 ?auto_88947 ) ) ( not ( = ?auto_88945 ?auto_88948 ) ) ( not ( = ?auto_88945 ?auto_88949 ) ) ( not ( = ?auto_88946 ?auto_88947 ) ) ( not ( = ?auto_88946 ?auto_88948 ) ) ( not ( = ?auto_88946 ?auto_88949 ) ) ( not ( = ?auto_88947 ?auto_88948 ) ) ( not ( = ?auto_88947 ?auto_88949 ) ) ( not ( = ?auto_88948 ?auto_88949 ) ) ( ON-TABLE ?auto_88949 ) ( CLEAR ?auto_88949 ) ( HOLDING ?auto_88948 ) ( CLEAR ?auto_88947 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88943 ?auto_88944 ?auto_88945 ?auto_88946 ?auto_88947 ?auto_88948 )
      ( MAKE-7PILE ?auto_88943 ?auto_88944 ?auto_88945 ?auto_88946 ?auto_88947 ?auto_88948 ?auto_88949 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_88950 - BLOCK
      ?auto_88951 - BLOCK
      ?auto_88952 - BLOCK
      ?auto_88953 - BLOCK
      ?auto_88954 - BLOCK
      ?auto_88955 - BLOCK
      ?auto_88956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88950 ) ( ON ?auto_88951 ?auto_88950 ) ( ON ?auto_88952 ?auto_88951 ) ( ON ?auto_88953 ?auto_88952 ) ( ON ?auto_88954 ?auto_88953 ) ( not ( = ?auto_88950 ?auto_88951 ) ) ( not ( = ?auto_88950 ?auto_88952 ) ) ( not ( = ?auto_88950 ?auto_88953 ) ) ( not ( = ?auto_88950 ?auto_88954 ) ) ( not ( = ?auto_88950 ?auto_88955 ) ) ( not ( = ?auto_88950 ?auto_88956 ) ) ( not ( = ?auto_88951 ?auto_88952 ) ) ( not ( = ?auto_88951 ?auto_88953 ) ) ( not ( = ?auto_88951 ?auto_88954 ) ) ( not ( = ?auto_88951 ?auto_88955 ) ) ( not ( = ?auto_88951 ?auto_88956 ) ) ( not ( = ?auto_88952 ?auto_88953 ) ) ( not ( = ?auto_88952 ?auto_88954 ) ) ( not ( = ?auto_88952 ?auto_88955 ) ) ( not ( = ?auto_88952 ?auto_88956 ) ) ( not ( = ?auto_88953 ?auto_88954 ) ) ( not ( = ?auto_88953 ?auto_88955 ) ) ( not ( = ?auto_88953 ?auto_88956 ) ) ( not ( = ?auto_88954 ?auto_88955 ) ) ( not ( = ?auto_88954 ?auto_88956 ) ) ( not ( = ?auto_88955 ?auto_88956 ) ) ( ON-TABLE ?auto_88956 ) ( CLEAR ?auto_88954 ) ( ON ?auto_88955 ?auto_88956 ) ( CLEAR ?auto_88955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88956 )
      ( MAKE-7PILE ?auto_88950 ?auto_88951 ?auto_88952 ?auto_88953 ?auto_88954 ?auto_88955 ?auto_88956 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_88957 - BLOCK
      ?auto_88958 - BLOCK
      ?auto_88959 - BLOCK
      ?auto_88960 - BLOCK
      ?auto_88961 - BLOCK
      ?auto_88962 - BLOCK
      ?auto_88963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88957 ) ( ON ?auto_88958 ?auto_88957 ) ( ON ?auto_88959 ?auto_88958 ) ( ON ?auto_88960 ?auto_88959 ) ( not ( = ?auto_88957 ?auto_88958 ) ) ( not ( = ?auto_88957 ?auto_88959 ) ) ( not ( = ?auto_88957 ?auto_88960 ) ) ( not ( = ?auto_88957 ?auto_88961 ) ) ( not ( = ?auto_88957 ?auto_88962 ) ) ( not ( = ?auto_88957 ?auto_88963 ) ) ( not ( = ?auto_88958 ?auto_88959 ) ) ( not ( = ?auto_88958 ?auto_88960 ) ) ( not ( = ?auto_88958 ?auto_88961 ) ) ( not ( = ?auto_88958 ?auto_88962 ) ) ( not ( = ?auto_88958 ?auto_88963 ) ) ( not ( = ?auto_88959 ?auto_88960 ) ) ( not ( = ?auto_88959 ?auto_88961 ) ) ( not ( = ?auto_88959 ?auto_88962 ) ) ( not ( = ?auto_88959 ?auto_88963 ) ) ( not ( = ?auto_88960 ?auto_88961 ) ) ( not ( = ?auto_88960 ?auto_88962 ) ) ( not ( = ?auto_88960 ?auto_88963 ) ) ( not ( = ?auto_88961 ?auto_88962 ) ) ( not ( = ?auto_88961 ?auto_88963 ) ) ( not ( = ?auto_88962 ?auto_88963 ) ) ( ON-TABLE ?auto_88963 ) ( ON ?auto_88962 ?auto_88963 ) ( CLEAR ?auto_88962 ) ( HOLDING ?auto_88961 ) ( CLEAR ?auto_88960 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88957 ?auto_88958 ?auto_88959 ?auto_88960 ?auto_88961 )
      ( MAKE-7PILE ?auto_88957 ?auto_88958 ?auto_88959 ?auto_88960 ?auto_88961 ?auto_88962 ?auto_88963 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_88964 - BLOCK
      ?auto_88965 - BLOCK
      ?auto_88966 - BLOCK
      ?auto_88967 - BLOCK
      ?auto_88968 - BLOCK
      ?auto_88969 - BLOCK
      ?auto_88970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88964 ) ( ON ?auto_88965 ?auto_88964 ) ( ON ?auto_88966 ?auto_88965 ) ( ON ?auto_88967 ?auto_88966 ) ( not ( = ?auto_88964 ?auto_88965 ) ) ( not ( = ?auto_88964 ?auto_88966 ) ) ( not ( = ?auto_88964 ?auto_88967 ) ) ( not ( = ?auto_88964 ?auto_88968 ) ) ( not ( = ?auto_88964 ?auto_88969 ) ) ( not ( = ?auto_88964 ?auto_88970 ) ) ( not ( = ?auto_88965 ?auto_88966 ) ) ( not ( = ?auto_88965 ?auto_88967 ) ) ( not ( = ?auto_88965 ?auto_88968 ) ) ( not ( = ?auto_88965 ?auto_88969 ) ) ( not ( = ?auto_88965 ?auto_88970 ) ) ( not ( = ?auto_88966 ?auto_88967 ) ) ( not ( = ?auto_88966 ?auto_88968 ) ) ( not ( = ?auto_88966 ?auto_88969 ) ) ( not ( = ?auto_88966 ?auto_88970 ) ) ( not ( = ?auto_88967 ?auto_88968 ) ) ( not ( = ?auto_88967 ?auto_88969 ) ) ( not ( = ?auto_88967 ?auto_88970 ) ) ( not ( = ?auto_88968 ?auto_88969 ) ) ( not ( = ?auto_88968 ?auto_88970 ) ) ( not ( = ?auto_88969 ?auto_88970 ) ) ( ON-TABLE ?auto_88970 ) ( ON ?auto_88969 ?auto_88970 ) ( CLEAR ?auto_88967 ) ( ON ?auto_88968 ?auto_88969 ) ( CLEAR ?auto_88968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88970 ?auto_88969 )
      ( MAKE-7PILE ?auto_88964 ?auto_88965 ?auto_88966 ?auto_88967 ?auto_88968 ?auto_88969 ?auto_88970 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_88971 - BLOCK
      ?auto_88972 - BLOCK
      ?auto_88973 - BLOCK
      ?auto_88974 - BLOCK
      ?auto_88975 - BLOCK
      ?auto_88976 - BLOCK
      ?auto_88977 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88971 ) ( ON ?auto_88972 ?auto_88971 ) ( ON ?auto_88973 ?auto_88972 ) ( not ( = ?auto_88971 ?auto_88972 ) ) ( not ( = ?auto_88971 ?auto_88973 ) ) ( not ( = ?auto_88971 ?auto_88974 ) ) ( not ( = ?auto_88971 ?auto_88975 ) ) ( not ( = ?auto_88971 ?auto_88976 ) ) ( not ( = ?auto_88971 ?auto_88977 ) ) ( not ( = ?auto_88972 ?auto_88973 ) ) ( not ( = ?auto_88972 ?auto_88974 ) ) ( not ( = ?auto_88972 ?auto_88975 ) ) ( not ( = ?auto_88972 ?auto_88976 ) ) ( not ( = ?auto_88972 ?auto_88977 ) ) ( not ( = ?auto_88973 ?auto_88974 ) ) ( not ( = ?auto_88973 ?auto_88975 ) ) ( not ( = ?auto_88973 ?auto_88976 ) ) ( not ( = ?auto_88973 ?auto_88977 ) ) ( not ( = ?auto_88974 ?auto_88975 ) ) ( not ( = ?auto_88974 ?auto_88976 ) ) ( not ( = ?auto_88974 ?auto_88977 ) ) ( not ( = ?auto_88975 ?auto_88976 ) ) ( not ( = ?auto_88975 ?auto_88977 ) ) ( not ( = ?auto_88976 ?auto_88977 ) ) ( ON-TABLE ?auto_88977 ) ( ON ?auto_88976 ?auto_88977 ) ( ON ?auto_88975 ?auto_88976 ) ( CLEAR ?auto_88975 ) ( HOLDING ?auto_88974 ) ( CLEAR ?auto_88973 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88971 ?auto_88972 ?auto_88973 ?auto_88974 )
      ( MAKE-7PILE ?auto_88971 ?auto_88972 ?auto_88973 ?auto_88974 ?auto_88975 ?auto_88976 ?auto_88977 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_88978 - BLOCK
      ?auto_88979 - BLOCK
      ?auto_88980 - BLOCK
      ?auto_88981 - BLOCK
      ?auto_88982 - BLOCK
      ?auto_88983 - BLOCK
      ?auto_88984 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88978 ) ( ON ?auto_88979 ?auto_88978 ) ( ON ?auto_88980 ?auto_88979 ) ( not ( = ?auto_88978 ?auto_88979 ) ) ( not ( = ?auto_88978 ?auto_88980 ) ) ( not ( = ?auto_88978 ?auto_88981 ) ) ( not ( = ?auto_88978 ?auto_88982 ) ) ( not ( = ?auto_88978 ?auto_88983 ) ) ( not ( = ?auto_88978 ?auto_88984 ) ) ( not ( = ?auto_88979 ?auto_88980 ) ) ( not ( = ?auto_88979 ?auto_88981 ) ) ( not ( = ?auto_88979 ?auto_88982 ) ) ( not ( = ?auto_88979 ?auto_88983 ) ) ( not ( = ?auto_88979 ?auto_88984 ) ) ( not ( = ?auto_88980 ?auto_88981 ) ) ( not ( = ?auto_88980 ?auto_88982 ) ) ( not ( = ?auto_88980 ?auto_88983 ) ) ( not ( = ?auto_88980 ?auto_88984 ) ) ( not ( = ?auto_88981 ?auto_88982 ) ) ( not ( = ?auto_88981 ?auto_88983 ) ) ( not ( = ?auto_88981 ?auto_88984 ) ) ( not ( = ?auto_88982 ?auto_88983 ) ) ( not ( = ?auto_88982 ?auto_88984 ) ) ( not ( = ?auto_88983 ?auto_88984 ) ) ( ON-TABLE ?auto_88984 ) ( ON ?auto_88983 ?auto_88984 ) ( ON ?auto_88982 ?auto_88983 ) ( CLEAR ?auto_88980 ) ( ON ?auto_88981 ?auto_88982 ) ( CLEAR ?auto_88981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88984 ?auto_88983 ?auto_88982 )
      ( MAKE-7PILE ?auto_88978 ?auto_88979 ?auto_88980 ?auto_88981 ?auto_88982 ?auto_88983 ?auto_88984 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_88985 - BLOCK
      ?auto_88986 - BLOCK
      ?auto_88987 - BLOCK
      ?auto_88988 - BLOCK
      ?auto_88989 - BLOCK
      ?auto_88990 - BLOCK
      ?auto_88991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88985 ) ( ON ?auto_88986 ?auto_88985 ) ( not ( = ?auto_88985 ?auto_88986 ) ) ( not ( = ?auto_88985 ?auto_88987 ) ) ( not ( = ?auto_88985 ?auto_88988 ) ) ( not ( = ?auto_88985 ?auto_88989 ) ) ( not ( = ?auto_88985 ?auto_88990 ) ) ( not ( = ?auto_88985 ?auto_88991 ) ) ( not ( = ?auto_88986 ?auto_88987 ) ) ( not ( = ?auto_88986 ?auto_88988 ) ) ( not ( = ?auto_88986 ?auto_88989 ) ) ( not ( = ?auto_88986 ?auto_88990 ) ) ( not ( = ?auto_88986 ?auto_88991 ) ) ( not ( = ?auto_88987 ?auto_88988 ) ) ( not ( = ?auto_88987 ?auto_88989 ) ) ( not ( = ?auto_88987 ?auto_88990 ) ) ( not ( = ?auto_88987 ?auto_88991 ) ) ( not ( = ?auto_88988 ?auto_88989 ) ) ( not ( = ?auto_88988 ?auto_88990 ) ) ( not ( = ?auto_88988 ?auto_88991 ) ) ( not ( = ?auto_88989 ?auto_88990 ) ) ( not ( = ?auto_88989 ?auto_88991 ) ) ( not ( = ?auto_88990 ?auto_88991 ) ) ( ON-TABLE ?auto_88991 ) ( ON ?auto_88990 ?auto_88991 ) ( ON ?auto_88989 ?auto_88990 ) ( ON ?auto_88988 ?auto_88989 ) ( CLEAR ?auto_88988 ) ( HOLDING ?auto_88987 ) ( CLEAR ?auto_88986 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88985 ?auto_88986 ?auto_88987 )
      ( MAKE-7PILE ?auto_88985 ?auto_88986 ?auto_88987 ?auto_88988 ?auto_88989 ?auto_88990 ?auto_88991 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_88992 - BLOCK
      ?auto_88993 - BLOCK
      ?auto_88994 - BLOCK
      ?auto_88995 - BLOCK
      ?auto_88996 - BLOCK
      ?auto_88997 - BLOCK
      ?auto_88998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88992 ) ( ON ?auto_88993 ?auto_88992 ) ( not ( = ?auto_88992 ?auto_88993 ) ) ( not ( = ?auto_88992 ?auto_88994 ) ) ( not ( = ?auto_88992 ?auto_88995 ) ) ( not ( = ?auto_88992 ?auto_88996 ) ) ( not ( = ?auto_88992 ?auto_88997 ) ) ( not ( = ?auto_88992 ?auto_88998 ) ) ( not ( = ?auto_88993 ?auto_88994 ) ) ( not ( = ?auto_88993 ?auto_88995 ) ) ( not ( = ?auto_88993 ?auto_88996 ) ) ( not ( = ?auto_88993 ?auto_88997 ) ) ( not ( = ?auto_88993 ?auto_88998 ) ) ( not ( = ?auto_88994 ?auto_88995 ) ) ( not ( = ?auto_88994 ?auto_88996 ) ) ( not ( = ?auto_88994 ?auto_88997 ) ) ( not ( = ?auto_88994 ?auto_88998 ) ) ( not ( = ?auto_88995 ?auto_88996 ) ) ( not ( = ?auto_88995 ?auto_88997 ) ) ( not ( = ?auto_88995 ?auto_88998 ) ) ( not ( = ?auto_88996 ?auto_88997 ) ) ( not ( = ?auto_88996 ?auto_88998 ) ) ( not ( = ?auto_88997 ?auto_88998 ) ) ( ON-TABLE ?auto_88998 ) ( ON ?auto_88997 ?auto_88998 ) ( ON ?auto_88996 ?auto_88997 ) ( ON ?auto_88995 ?auto_88996 ) ( CLEAR ?auto_88993 ) ( ON ?auto_88994 ?auto_88995 ) ( CLEAR ?auto_88994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88998 ?auto_88997 ?auto_88996 ?auto_88995 )
      ( MAKE-7PILE ?auto_88992 ?auto_88993 ?auto_88994 ?auto_88995 ?auto_88996 ?auto_88997 ?auto_88998 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_88999 - BLOCK
      ?auto_89000 - BLOCK
      ?auto_89001 - BLOCK
      ?auto_89002 - BLOCK
      ?auto_89003 - BLOCK
      ?auto_89004 - BLOCK
      ?auto_89005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88999 ) ( not ( = ?auto_88999 ?auto_89000 ) ) ( not ( = ?auto_88999 ?auto_89001 ) ) ( not ( = ?auto_88999 ?auto_89002 ) ) ( not ( = ?auto_88999 ?auto_89003 ) ) ( not ( = ?auto_88999 ?auto_89004 ) ) ( not ( = ?auto_88999 ?auto_89005 ) ) ( not ( = ?auto_89000 ?auto_89001 ) ) ( not ( = ?auto_89000 ?auto_89002 ) ) ( not ( = ?auto_89000 ?auto_89003 ) ) ( not ( = ?auto_89000 ?auto_89004 ) ) ( not ( = ?auto_89000 ?auto_89005 ) ) ( not ( = ?auto_89001 ?auto_89002 ) ) ( not ( = ?auto_89001 ?auto_89003 ) ) ( not ( = ?auto_89001 ?auto_89004 ) ) ( not ( = ?auto_89001 ?auto_89005 ) ) ( not ( = ?auto_89002 ?auto_89003 ) ) ( not ( = ?auto_89002 ?auto_89004 ) ) ( not ( = ?auto_89002 ?auto_89005 ) ) ( not ( = ?auto_89003 ?auto_89004 ) ) ( not ( = ?auto_89003 ?auto_89005 ) ) ( not ( = ?auto_89004 ?auto_89005 ) ) ( ON-TABLE ?auto_89005 ) ( ON ?auto_89004 ?auto_89005 ) ( ON ?auto_89003 ?auto_89004 ) ( ON ?auto_89002 ?auto_89003 ) ( ON ?auto_89001 ?auto_89002 ) ( CLEAR ?auto_89001 ) ( HOLDING ?auto_89000 ) ( CLEAR ?auto_88999 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88999 ?auto_89000 )
      ( MAKE-7PILE ?auto_88999 ?auto_89000 ?auto_89001 ?auto_89002 ?auto_89003 ?auto_89004 ?auto_89005 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89006 - BLOCK
      ?auto_89007 - BLOCK
      ?auto_89008 - BLOCK
      ?auto_89009 - BLOCK
      ?auto_89010 - BLOCK
      ?auto_89011 - BLOCK
      ?auto_89012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_89006 ) ( not ( = ?auto_89006 ?auto_89007 ) ) ( not ( = ?auto_89006 ?auto_89008 ) ) ( not ( = ?auto_89006 ?auto_89009 ) ) ( not ( = ?auto_89006 ?auto_89010 ) ) ( not ( = ?auto_89006 ?auto_89011 ) ) ( not ( = ?auto_89006 ?auto_89012 ) ) ( not ( = ?auto_89007 ?auto_89008 ) ) ( not ( = ?auto_89007 ?auto_89009 ) ) ( not ( = ?auto_89007 ?auto_89010 ) ) ( not ( = ?auto_89007 ?auto_89011 ) ) ( not ( = ?auto_89007 ?auto_89012 ) ) ( not ( = ?auto_89008 ?auto_89009 ) ) ( not ( = ?auto_89008 ?auto_89010 ) ) ( not ( = ?auto_89008 ?auto_89011 ) ) ( not ( = ?auto_89008 ?auto_89012 ) ) ( not ( = ?auto_89009 ?auto_89010 ) ) ( not ( = ?auto_89009 ?auto_89011 ) ) ( not ( = ?auto_89009 ?auto_89012 ) ) ( not ( = ?auto_89010 ?auto_89011 ) ) ( not ( = ?auto_89010 ?auto_89012 ) ) ( not ( = ?auto_89011 ?auto_89012 ) ) ( ON-TABLE ?auto_89012 ) ( ON ?auto_89011 ?auto_89012 ) ( ON ?auto_89010 ?auto_89011 ) ( ON ?auto_89009 ?auto_89010 ) ( ON ?auto_89008 ?auto_89009 ) ( CLEAR ?auto_89006 ) ( ON ?auto_89007 ?auto_89008 ) ( CLEAR ?auto_89007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89012 ?auto_89011 ?auto_89010 ?auto_89009 ?auto_89008 )
      ( MAKE-7PILE ?auto_89006 ?auto_89007 ?auto_89008 ?auto_89009 ?auto_89010 ?auto_89011 ?auto_89012 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89013 - BLOCK
      ?auto_89014 - BLOCK
      ?auto_89015 - BLOCK
      ?auto_89016 - BLOCK
      ?auto_89017 - BLOCK
      ?auto_89018 - BLOCK
      ?auto_89019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89013 ?auto_89014 ) ) ( not ( = ?auto_89013 ?auto_89015 ) ) ( not ( = ?auto_89013 ?auto_89016 ) ) ( not ( = ?auto_89013 ?auto_89017 ) ) ( not ( = ?auto_89013 ?auto_89018 ) ) ( not ( = ?auto_89013 ?auto_89019 ) ) ( not ( = ?auto_89014 ?auto_89015 ) ) ( not ( = ?auto_89014 ?auto_89016 ) ) ( not ( = ?auto_89014 ?auto_89017 ) ) ( not ( = ?auto_89014 ?auto_89018 ) ) ( not ( = ?auto_89014 ?auto_89019 ) ) ( not ( = ?auto_89015 ?auto_89016 ) ) ( not ( = ?auto_89015 ?auto_89017 ) ) ( not ( = ?auto_89015 ?auto_89018 ) ) ( not ( = ?auto_89015 ?auto_89019 ) ) ( not ( = ?auto_89016 ?auto_89017 ) ) ( not ( = ?auto_89016 ?auto_89018 ) ) ( not ( = ?auto_89016 ?auto_89019 ) ) ( not ( = ?auto_89017 ?auto_89018 ) ) ( not ( = ?auto_89017 ?auto_89019 ) ) ( not ( = ?auto_89018 ?auto_89019 ) ) ( ON-TABLE ?auto_89019 ) ( ON ?auto_89018 ?auto_89019 ) ( ON ?auto_89017 ?auto_89018 ) ( ON ?auto_89016 ?auto_89017 ) ( ON ?auto_89015 ?auto_89016 ) ( ON ?auto_89014 ?auto_89015 ) ( CLEAR ?auto_89014 ) ( HOLDING ?auto_89013 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89013 )
      ( MAKE-7PILE ?auto_89013 ?auto_89014 ?auto_89015 ?auto_89016 ?auto_89017 ?auto_89018 ?auto_89019 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89020 - BLOCK
      ?auto_89021 - BLOCK
      ?auto_89022 - BLOCK
      ?auto_89023 - BLOCK
      ?auto_89024 - BLOCK
      ?auto_89025 - BLOCK
      ?auto_89026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89020 ?auto_89021 ) ) ( not ( = ?auto_89020 ?auto_89022 ) ) ( not ( = ?auto_89020 ?auto_89023 ) ) ( not ( = ?auto_89020 ?auto_89024 ) ) ( not ( = ?auto_89020 ?auto_89025 ) ) ( not ( = ?auto_89020 ?auto_89026 ) ) ( not ( = ?auto_89021 ?auto_89022 ) ) ( not ( = ?auto_89021 ?auto_89023 ) ) ( not ( = ?auto_89021 ?auto_89024 ) ) ( not ( = ?auto_89021 ?auto_89025 ) ) ( not ( = ?auto_89021 ?auto_89026 ) ) ( not ( = ?auto_89022 ?auto_89023 ) ) ( not ( = ?auto_89022 ?auto_89024 ) ) ( not ( = ?auto_89022 ?auto_89025 ) ) ( not ( = ?auto_89022 ?auto_89026 ) ) ( not ( = ?auto_89023 ?auto_89024 ) ) ( not ( = ?auto_89023 ?auto_89025 ) ) ( not ( = ?auto_89023 ?auto_89026 ) ) ( not ( = ?auto_89024 ?auto_89025 ) ) ( not ( = ?auto_89024 ?auto_89026 ) ) ( not ( = ?auto_89025 ?auto_89026 ) ) ( ON-TABLE ?auto_89026 ) ( ON ?auto_89025 ?auto_89026 ) ( ON ?auto_89024 ?auto_89025 ) ( ON ?auto_89023 ?auto_89024 ) ( ON ?auto_89022 ?auto_89023 ) ( ON ?auto_89021 ?auto_89022 ) ( ON ?auto_89020 ?auto_89021 ) ( CLEAR ?auto_89020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89026 ?auto_89025 ?auto_89024 ?auto_89023 ?auto_89022 ?auto_89021 )
      ( MAKE-7PILE ?auto_89020 ?auto_89021 ?auto_89022 ?auto_89023 ?auto_89024 ?auto_89025 ?auto_89026 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89034 - BLOCK
      ?auto_89035 - BLOCK
      ?auto_89036 - BLOCK
      ?auto_89037 - BLOCK
      ?auto_89038 - BLOCK
      ?auto_89039 - BLOCK
      ?auto_89040 - BLOCK
    )
    :vars
    (
      ?auto_89041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89034 ?auto_89035 ) ) ( not ( = ?auto_89034 ?auto_89036 ) ) ( not ( = ?auto_89034 ?auto_89037 ) ) ( not ( = ?auto_89034 ?auto_89038 ) ) ( not ( = ?auto_89034 ?auto_89039 ) ) ( not ( = ?auto_89034 ?auto_89040 ) ) ( not ( = ?auto_89035 ?auto_89036 ) ) ( not ( = ?auto_89035 ?auto_89037 ) ) ( not ( = ?auto_89035 ?auto_89038 ) ) ( not ( = ?auto_89035 ?auto_89039 ) ) ( not ( = ?auto_89035 ?auto_89040 ) ) ( not ( = ?auto_89036 ?auto_89037 ) ) ( not ( = ?auto_89036 ?auto_89038 ) ) ( not ( = ?auto_89036 ?auto_89039 ) ) ( not ( = ?auto_89036 ?auto_89040 ) ) ( not ( = ?auto_89037 ?auto_89038 ) ) ( not ( = ?auto_89037 ?auto_89039 ) ) ( not ( = ?auto_89037 ?auto_89040 ) ) ( not ( = ?auto_89038 ?auto_89039 ) ) ( not ( = ?auto_89038 ?auto_89040 ) ) ( not ( = ?auto_89039 ?auto_89040 ) ) ( ON-TABLE ?auto_89040 ) ( ON ?auto_89039 ?auto_89040 ) ( ON ?auto_89038 ?auto_89039 ) ( ON ?auto_89037 ?auto_89038 ) ( ON ?auto_89036 ?auto_89037 ) ( ON ?auto_89035 ?auto_89036 ) ( CLEAR ?auto_89035 ) ( ON ?auto_89034 ?auto_89041 ) ( CLEAR ?auto_89034 ) ( HAND-EMPTY ) ( not ( = ?auto_89034 ?auto_89041 ) ) ( not ( = ?auto_89035 ?auto_89041 ) ) ( not ( = ?auto_89036 ?auto_89041 ) ) ( not ( = ?auto_89037 ?auto_89041 ) ) ( not ( = ?auto_89038 ?auto_89041 ) ) ( not ( = ?auto_89039 ?auto_89041 ) ) ( not ( = ?auto_89040 ?auto_89041 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_89034 ?auto_89041 )
      ( MAKE-7PILE ?auto_89034 ?auto_89035 ?auto_89036 ?auto_89037 ?auto_89038 ?auto_89039 ?auto_89040 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89042 - BLOCK
      ?auto_89043 - BLOCK
      ?auto_89044 - BLOCK
      ?auto_89045 - BLOCK
      ?auto_89046 - BLOCK
      ?auto_89047 - BLOCK
      ?auto_89048 - BLOCK
    )
    :vars
    (
      ?auto_89049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89042 ?auto_89043 ) ) ( not ( = ?auto_89042 ?auto_89044 ) ) ( not ( = ?auto_89042 ?auto_89045 ) ) ( not ( = ?auto_89042 ?auto_89046 ) ) ( not ( = ?auto_89042 ?auto_89047 ) ) ( not ( = ?auto_89042 ?auto_89048 ) ) ( not ( = ?auto_89043 ?auto_89044 ) ) ( not ( = ?auto_89043 ?auto_89045 ) ) ( not ( = ?auto_89043 ?auto_89046 ) ) ( not ( = ?auto_89043 ?auto_89047 ) ) ( not ( = ?auto_89043 ?auto_89048 ) ) ( not ( = ?auto_89044 ?auto_89045 ) ) ( not ( = ?auto_89044 ?auto_89046 ) ) ( not ( = ?auto_89044 ?auto_89047 ) ) ( not ( = ?auto_89044 ?auto_89048 ) ) ( not ( = ?auto_89045 ?auto_89046 ) ) ( not ( = ?auto_89045 ?auto_89047 ) ) ( not ( = ?auto_89045 ?auto_89048 ) ) ( not ( = ?auto_89046 ?auto_89047 ) ) ( not ( = ?auto_89046 ?auto_89048 ) ) ( not ( = ?auto_89047 ?auto_89048 ) ) ( ON-TABLE ?auto_89048 ) ( ON ?auto_89047 ?auto_89048 ) ( ON ?auto_89046 ?auto_89047 ) ( ON ?auto_89045 ?auto_89046 ) ( ON ?auto_89044 ?auto_89045 ) ( ON ?auto_89042 ?auto_89049 ) ( CLEAR ?auto_89042 ) ( not ( = ?auto_89042 ?auto_89049 ) ) ( not ( = ?auto_89043 ?auto_89049 ) ) ( not ( = ?auto_89044 ?auto_89049 ) ) ( not ( = ?auto_89045 ?auto_89049 ) ) ( not ( = ?auto_89046 ?auto_89049 ) ) ( not ( = ?auto_89047 ?auto_89049 ) ) ( not ( = ?auto_89048 ?auto_89049 ) ) ( HOLDING ?auto_89043 ) ( CLEAR ?auto_89044 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89048 ?auto_89047 ?auto_89046 ?auto_89045 ?auto_89044 ?auto_89043 )
      ( MAKE-7PILE ?auto_89042 ?auto_89043 ?auto_89044 ?auto_89045 ?auto_89046 ?auto_89047 ?auto_89048 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89050 - BLOCK
      ?auto_89051 - BLOCK
      ?auto_89052 - BLOCK
      ?auto_89053 - BLOCK
      ?auto_89054 - BLOCK
      ?auto_89055 - BLOCK
      ?auto_89056 - BLOCK
    )
    :vars
    (
      ?auto_89057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89050 ?auto_89051 ) ) ( not ( = ?auto_89050 ?auto_89052 ) ) ( not ( = ?auto_89050 ?auto_89053 ) ) ( not ( = ?auto_89050 ?auto_89054 ) ) ( not ( = ?auto_89050 ?auto_89055 ) ) ( not ( = ?auto_89050 ?auto_89056 ) ) ( not ( = ?auto_89051 ?auto_89052 ) ) ( not ( = ?auto_89051 ?auto_89053 ) ) ( not ( = ?auto_89051 ?auto_89054 ) ) ( not ( = ?auto_89051 ?auto_89055 ) ) ( not ( = ?auto_89051 ?auto_89056 ) ) ( not ( = ?auto_89052 ?auto_89053 ) ) ( not ( = ?auto_89052 ?auto_89054 ) ) ( not ( = ?auto_89052 ?auto_89055 ) ) ( not ( = ?auto_89052 ?auto_89056 ) ) ( not ( = ?auto_89053 ?auto_89054 ) ) ( not ( = ?auto_89053 ?auto_89055 ) ) ( not ( = ?auto_89053 ?auto_89056 ) ) ( not ( = ?auto_89054 ?auto_89055 ) ) ( not ( = ?auto_89054 ?auto_89056 ) ) ( not ( = ?auto_89055 ?auto_89056 ) ) ( ON-TABLE ?auto_89056 ) ( ON ?auto_89055 ?auto_89056 ) ( ON ?auto_89054 ?auto_89055 ) ( ON ?auto_89053 ?auto_89054 ) ( ON ?auto_89052 ?auto_89053 ) ( ON ?auto_89050 ?auto_89057 ) ( not ( = ?auto_89050 ?auto_89057 ) ) ( not ( = ?auto_89051 ?auto_89057 ) ) ( not ( = ?auto_89052 ?auto_89057 ) ) ( not ( = ?auto_89053 ?auto_89057 ) ) ( not ( = ?auto_89054 ?auto_89057 ) ) ( not ( = ?auto_89055 ?auto_89057 ) ) ( not ( = ?auto_89056 ?auto_89057 ) ) ( CLEAR ?auto_89052 ) ( ON ?auto_89051 ?auto_89050 ) ( CLEAR ?auto_89051 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_89057 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89057 ?auto_89050 )
      ( MAKE-7PILE ?auto_89050 ?auto_89051 ?auto_89052 ?auto_89053 ?auto_89054 ?auto_89055 ?auto_89056 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89058 - BLOCK
      ?auto_89059 - BLOCK
      ?auto_89060 - BLOCK
      ?auto_89061 - BLOCK
      ?auto_89062 - BLOCK
      ?auto_89063 - BLOCK
      ?auto_89064 - BLOCK
    )
    :vars
    (
      ?auto_89065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89058 ?auto_89059 ) ) ( not ( = ?auto_89058 ?auto_89060 ) ) ( not ( = ?auto_89058 ?auto_89061 ) ) ( not ( = ?auto_89058 ?auto_89062 ) ) ( not ( = ?auto_89058 ?auto_89063 ) ) ( not ( = ?auto_89058 ?auto_89064 ) ) ( not ( = ?auto_89059 ?auto_89060 ) ) ( not ( = ?auto_89059 ?auto_89061 ) ) ( not ( = ?auto_89059 ?auto_89062 ) ) ( not ( = ?auto_89059 ?auto_89063 ) ) ( not ( = ?auto_89059 ?auto_89064 ) ) ( not ( = ?auto_89060 ?auto_89061 ) ) ( not ( = ?auto_89060 ?auto_89062 ) ) ( not ( = ?auto_89060 ?auto_89063 ) ) ( not ( = ?auto_89060 ?auto_89064 ) ) ( not ( = ?auto_89061 ?auto_89062 ) ) ( not ( = ?auto_89061 ?auto_89063 ) ) ( not ( = ?auto_89061 ?auto_89064 ) ) ( not ( = ?auto_89062 ?auto_89063 ) ) ( not ( = ?auto_89062 ?auto_89064 ) ) ( not ( = ?auto_89063 ?auto_89064 ) ) ( ON-TABLE ?auto_89064 ) ( ON ?auto_89063 ?auto_89064 ) ( ON ?auto_89062 ?auto_89063 ) ( ON ?auto_89061 ?auto_89062 ) ( ON ?auto_89058 ?auto_89065 ) ( not ( = ?auto_89058 ?auto_89065 ) ) ( not ( = ?auto_89059 ?auto_89065 ) ) ( not ( = ?auto_89060 ?auto_89065 ) ) ( not ( = ?auto_89061 ?auto_89065 ) ) ( not ( = ?auto_89062 ?auto_89065 ) ) ( not ( = ?auto_89063 ?auto_89065 ) ) ( not ( = ?auto_89064 ?auto_89065 ) ) ( ON ?auto_89059 ?auto_89058 ) ( CLEAR ?auto_89059 ) ( ON-TABLE ?auto_89065 ) ( HOLDING ?auto_89060 ) ( CLEAR ?auto_89061 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89064 ?auto_89063 ?auto_89062 ?auto_89061 ?auto_89060 )
      ( MAKE-7PILE ?auto_89058 ?auto_89059 ?auto_89060 ?auto_89061 ?auto_89062 ?auto_89063 ?auto_89064 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89066 - BLOCK
      ?auto_89067 - BLOCK
      ?auto_89068 - BLOCK
      ?auto_89069 - BLOCK
      ?auto_89070 - BLOCK
      ?auto_89071 - BLOCK
      ?auto_89072 - BLOCK
    )
    :vars
    (
      ?auto_89073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89066 ?auto_89067 ) ) ( not ( = ?auto_89066 ?auto_89068 ) ) ( not ( = ?auto_89066 ?auto_89069 ) ) ( not ( = ?auto_89066 ?auto_89070 ) ) ( not ( = ?auto_89066 ?auto_89071 ) ) ( not ( = ?auto_89066 ?auto_89072 ) ) ( not ( = ?auto_89067 ?auto_89068 ) ) ( not ( = ?auto_89067 ?auto_89069 ) ) ( not ( = ?auto_89067 ?auto_89070 ) ) ( not ( = ?auto_89067 ?auto_89071 ) ) ( not ( = ?auto_89067 ?auto_89072 ) ) ( not ( = ?auto_89068 ?auto_89069 ) ) ( not ( = ?auto_89068 ?auto_89070 ) ) ( not ( = ?auto_89068 ?auto_89071 ) ) ( not ( = ?auto_89068 ?auto_89072 ) ) ( not ( = ?auto_89069 ?auto_89070 ) ) ( not ( = ?auto_89069 ?auto_89071 ) ) ( not ( = ?auto_89069 ?auto_89072 ) ) ( not ( = ?auto_89070 ?auto_89071 ) ) ( not ( = ?auto_89070 ?auto_89072 ) ) ( not ( = ?auto_89071 ?auto_89072 ) ) ( ON-TABLE ?auto_89072 ) ( ON ?auto_89071 ?auto_89072 ) ( ON ?auto_89070 ?auto_89071 ) ( ON ?auto_89069 ?auto_89070 ) ( ON ?auto_89066 ?auto_89073 ) ( not ( = ?auto_89066 ?auto_89073 ) ) ( not ( = ?auto_89067 ?auto_89073 ) ) ( not ( = ?auto_89068 ?auto_89073 ) ) ( not ( = ?auto_89069 ?auto_89073 ) ) ( not ( = ?auto_89070 ?auto_89073 ) ) ( not ( = ?auto_89071 ?auto_89073 ) ) ( not ( = ?auto_89072 ?auto_89073 ) ) ( ON ?auto_89067 ?auto_89066 ) ( ON-TABLE ?auto_89073 ) ( CLEAR ?auto_89069 ) ( ON ?auto_89068 ?auto_89067 ) ( CLEAR ?auto_89068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89073 ?auto_89066 ?auto_89067 )
      ( MAKE-7PILE ?auto_89066 ?auto_89067 ?auto_89068 ?auto_89069 ?auto_89070 ?auto_89071 ?auto_89072 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89074 - BLOCK
      ?auto_89075 - BLOCK
      ?auto_89076 - BLOCK
      ?auto_89077 - BLOCK
      ?auto_89078 - BLOCK
      ?auto_89079 - BLOCK
      ?auto_89080 - BLOCK
    )
    :vars
    (
      ?auto_89081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89074 ?auto_89075 ) ) ( not ( = ?auto_89074 ?auto_89076 ) ) ( not ( = ?auto_89074 ?auto_89077 ) ) ( not ( = ?auto_89074 ?auto_89078 ) ) ( not ( = ?auto_89074 ?auto_89079 ) ) ( not ( = ?auto_89074 ?auto_89080 ) ) ( not ( = ?auto_89075 ?auto_89076 ) ) ( not ( = ?auto_89075 ?auto_89077 ) ) ( not ( = ?auto_89075 ?auto_89078 ) ) ( not ( = ?auto_89075 ?auto_89079 ) ) ( not ( = ?auto_89075 ?auto_89080 ) ) ( not ( = ?auto_89076 ?auto_89077 ) ) ( not ( = ?auto_89076 ?auto_89078 ) ) ( not ( = ?auto_89076 ?auto_89079 ) ) ( not ( = ?auto_89076 ?auto_89080 ) ) ( not ( = ?auto_89077 ?auto_89078 ) ) ( not ( = ?auto_89077 ?auto_89079 ) ) ( not ( = ?auto_89077 ?auto_89080 ) ) ( not ( = ?auto_89078 ?auto_89079 ) ) ( not ( = ?auto_89078 ?auto_89080 ) ) ( not ( = ?auto_89079 ?auto_89080 ) ) ( ON-TABLE ?auto_89080 ) ( ON ?auto_89079 ?auto_89080 ) ( ON ?auto_89078 ?auto_89079 ) ( ON ?auto_89074 ?auto_89081 ) ( not ( = ?auto_89074 ?auto_89081 ) ) ( not ( = ?auto_89075 ?auto_89081 ) ) ( not ( = ?auto_89076 ?auto_89081 ) ) ( not ( = ?auto_89077 ?auto_89081 ) ) ( not ( = ?auto_89078 ?auto_89081 ) ) ( not ( = ?auto_89079 ?auto_89081 ) ) ( not ( = ?auto_89080 ?auto_89081 ) ) ( ON ?auto_89075 ?auto_89074 ) ( ON-TABLE ?auto_89081 ) ( ON ?auto_89076 ?auto_89075 ) ( CLEAR ?auto_89076 ) ( HOLDING ?auto_89077 ) ( CLEAR ?auto_89078 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89080 ?auto_89079 ?auto_89078 ?auto_89077 )
      ( MAKE-7PILE ?auto_89074 ?auto_89075 ?auto_89076 ?auto_89077 ?auto_89078 ?auto_89079 ?auto_89080 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89082 - BLOCK
      ?auto_89083 - BLOCK
      ?auto_89084 - BLOCK
      ?auto_89085 - BLOCK
      ?auto_89086 - BLOCK
      ?auto_89087 - BLOCK
      ?auto_89088 - BLOCK
    )
    :vars
    (
      ?auto_89089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89082 ?auto_89083 ) ) ( not ( = ?auto_89082 ?auto_89084 ) ) ( not ( = ?auto_89082 ?auto_89085 ) ) ( not ( = ?auto_89082 ?auto_89086 ) ) ( not ( = ?auto_89082 ?auto_89087 ) ) ( not ( = ?auto_89082 ?auto_89088 ) ) ( not ( = ?auto_89083 ?auto_89084 ) ) ( not ( = ?auto_89083 ?auto_89085 ) ) ( not ( = ?auto_89083 ?auto_89086 ) ) ( not ( = ?auto_89083 ?auto_89087 ) ) ( not ( = ?auto_89083 ?auto_89088 ) ) ( not ( = ?auto_89084 ?auto_89085 ) ) ( not ( = ?auto_89084 ?auto_89086 ) ) ( not ( = ?auto_89084 ?auto_89087 ) ) ( not ( = ?auto_89084 ?auto_89088 ) ) ( not ( = ?auto_89085 ?auto_89086 ) ) ( not ( = ?auto_89085 ?auto_89087 ) ) ( not ( = ?auto_89085 ?auto_89088 ) ) ( not ( = ?auto_89086 ?auto_89087 ) ) ( not ( = ?auto_89086 ?auto_89088 ) ) ( not ( = ?auto_89087 ?auto_89088 ) ) ( ON-TABLE ?auto_89088 ) ( ON ?auto_89087 ?auto_89088 ) ( ON ?auto_89086 ?auto_89087 ) ( ON ?auto_89082 ?auto_89089 ) ( not ( = ?auto_89082 ?auto_89089 ) ) ( not ( = ?auto_89083 ?auto_89089 ) ) ( not ( = ?auto_89084 ?auto_89089 ) ) ( not ( = ?auto_89085 ?auto_89089 ) ) ( not ( = ?auto_89086 ?auto_89089 ) ) ( not ( = ?auto_89087 ?auto_89089 ) ) ( not ( = ?auto_89088 ?auto_89089 ) ) ( ON ?auto_89083 ?auto_89082 ) ( ON-TABLE ?auto_89089 ) ( ON ?auto_89084 ?auto_89083 ) ( CLEAR ?auto_89086 ) ( ON ?auto_89085 ?auto_89084 ) ( CLEAR ?auto_89085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_89089 ?auto_89082 ?auto_89083 ?auto_89084 )
      ( MAKE-7PILE ?auto_89082 ?auto_89083 ?auto_89084 ?auto_89085 ?auto_89086 ?auto_89087 ?auto_89088 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89090 - BLOCK
      ?auto_89091 - BLOCK
      ?auto_89092 - BLOCK
      ?auto_89093 - BLOCK
      ?auto_89094 - BLOCK
      ?auto_89095 - BLOCK
      ?auto_89096 - BLOCK
    )
    :vars
    (
      ?auto_89097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89090 ?auto_89091 ) ) ( not ( = ?auto_89090 ?auto_89092 ) ) ( not ( = ?auto_89090 ?auto_89093 ) ) ( not ( = ?auto_89090 ?auto_89094 ) ) ( not ( = ?auto_89090 ?auto_89095 ) ) ( not ( = ?auto_89090 ?auto_89096 ) ) ( not ( = ?auto_89091 ?auto_89092 ) ) ( not ( = ?auto_89091 ?auto_89093 ) ) ( not ( = ?auto_89091 ?auto_89094 ) ) ( not ( = ?auto_89091 ?auto_89095 ) ) ( not ( = ?auto_89091 ?auto_89096 ) ) ( not ( = ?auto_89092 ?auto_89093 ) ) ( not ( = ?auto_89092 ?auto_89094 ) ) ( not ( = ?auto_89092 ?auto_89095 ) ) ( not ( = ?auto_89092 ?auto_89096 ) ) ( not ( = ?auto_89093 ?auto_89094 ) ) ( not ( = ?auto_89093 ?auto_89095 ) ) ( not ( = ?auto_89093 ?auto_89096 ) ) ( not ( = ?auto_89094 ?auto_89095 ) ) ( not ( = ?auto_89094 ?auto_89096 ) ) ( not ( = ?auto_89095 ?auto_89096 ) ) ( ON-TABLE ?auto_89096 ) ( ON ?auto_89095 ?auto_89096 ) ( ON ?auto_89090 ?auto_89097 ) ( not ( = ?auto_89090 ?auto_89097 ) ) ( not ( = ?auto_89091 ?auto_89097 ) ) ( not ( = ?auto_89092 ?auto_89097 ) ) ( not ( = ?auto_89093 ?auto_89097 ) ) ( not ( = ?auto_89094 ?auto_89097 ) ) ( not ( = ?auto_89095 ?auto_89097 ) ) ( not ( = ?auto_89096 ?auto_89097 ) ) ( ON ?auto_89091 ?auto_89090 ) ( ON-TABLE ?auto_89097 ) ( ON ?auto_89092 ?auto_89091 ) ( ON ?auto_89093 ?auto_89092 ) ( CLEAR ?auto_89093 ) ( HOLDING ?auto_89094 ) ( CLEAR ?auto_89095 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_89096 ?auto_89095 ?auto_89094 )
      ( MAKE-7PILE ?auto_89090 ?auto_89091 ?auto_89092 ?auto_89093 ?auto_89094 ?auto_89095 ?auto_89096 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89098 - BLOCK
      ?auto_89099 - BLOCK
      ?auto_89100 - BLOCK
      ?auto_89101 - BLOCK
      ?auto_89102 - BLOCK
      ?auto_89103 - BLOCK
      ?auto_89104 - BLOCK
    )
    :vars
    (
      ?auto_89105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89098 ?auto_89099 ) ) ( not ( = ?auto_89098 ?auto_89100 ) ) ( not ( = ?auto_89098 ?auto_89101 ) ) ( not ( = ?auto_89098 ?auto_89102 ) ) ( not ( = ?auto_89098 ?auto_89103 ) ) ( not ( = ?auto_89098 ?auto_89104 ) ) ( not ( = ?auto_89099 ?auto_89100 ) ) ( not ( = ?auto_89099 ?auto_89101 ) ) ( not ( = ?auto_89099 ?auto_89102 ) ) ( not ( = ?auto_89099 ?auto_89103 ) ) ( not ( = ?auto_89099 ?auto_89104 ) ) ( not ( = ?auto_89100 ?auto_89101 ) ) ( not ( = ?auto_89100 ?auto_89102 ) ) ( not ( = ?auto_89100 ?auto_89103 ) ) ( not ( = ?auto_89100 ?auto_89104 ) ) ( not ( = ?auto_89101 ?auto_89102 ) ) ( not ( = ?auto_89101 ?auto_89103 ) ) ( not ( = ?auto_89101 ?auto_89104 ) ) ( not ( = ?auto_89102 ?auto_89103 ) ) ( not ( = ?auto_89102 ?auto_89104 ) ) ( not ( = ?auto_89103 ?auto_89104 ) ) ( ON-TABLE ?auto_89104 ) ( ON ?auto_89103 ?auto_89104 ) ( ON ?auto_89098 ?auto_89105 ) ( not ( = ?auto_89098 ?auto_89105 ) ) ( not ( = ?auto_89099 ?auto_89105 ) ) ( not ( = ?auto_89100 ?auto_89105 ) ) ( not ( = ?auto_89101 ?auto_89105 ) ) ( not ( = ?auto_89102 ?auto_89105 ) ) ( not ( = ?auto_89103 ?auto_89105 ) ) ( not ( = ?auto_89104 ?auto_89105 ) ) ( ON ?auto_89099 ?auto_89098 ) ( ON-TABLE ?auto_89105 ) ( ON ?auto_89100 ?auto_89099 ) ( ON ?auto_89101 ?auto_89100 ) ( CLEAR ?auto_89103 ) ( ON ?auto_89102 ?auto_89101 ) ( CLEAR ?auto_89102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_89105 ?auto_89098 ?auto_89099 ?auto_89100 ?auto_89101 )
      ( MAKE-7PILE ?auto_89098 ?auto_89099 ?auto_89100 ?auto_89101 ?auto_89102 ?auto_89103 ?auto_89104 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89106 - BLOCK
      ?auto_89107 - BLOCK
      ?auto_89108 - BLOCK
      ?auto_89109 - BLOCK
      ?auto_89110 - BLOCK
      ?auto_89111 - BLOCK
      ?auto_89112 - BLOCK
    )
    :vars
    (
      ?auto_89113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89106 ?auto_89107 ) ) ( not ( = ?auto_89106 ?auto_89108 ) ) ( not ( = ?auto_89106 ?auto_89109 ) ) ( not ( = ?auto_89106 ?auto_89110 ) ) ( not ( = ?auto_89106 ?auto_89111 ) ) ( not ( = ?auto_89106 ?auto_89112 ) ) ( not ( = ?auto_89107 ?auto_89108 ) ) ( not ( = ?auto_89107 ?auto_89109 ) ) ( not ( = ?auto_89107 ?auto_89110 ) ) ( not ( = ?auto_89107 ?auto_89111 ) ) ( not ( = ?auto_89107 ?auto_89112 ) ) ( not ( = ?auto_89108 ?auto_89109 ) ) ( not ( = ?auto_89108 ?auto_89110 ) ) ( not ( = ?auto_89108 ?auto_89111 ) ) ( not ( = ?auto_89108 ?auto_89112 ) ) ( not ( = ?auto_89109 ?auto_89110 ) ) ( not ( = ?auto_89109 ?auto_89111 ) ) ( not ( = ?auto_89109 ?auto_89112 ) ) ( not ( = ?auto_89110 ?auto_89111 ) ) ( not ( = ?auto_89110 ?auto_89112 ) ) ( not ( = ?auto_89111 ?auto_89112 ) ) ( ON-TABLE ?auto_89112 ) ( ON ?auto_89106 ?auto_89113 ) ( not ( = ?auto_89106 ?auto_89113 ) ) ( not ( = ?auto_89107 ?auto_89113 ) ) ( not ( = ?auto_89108 ?auto_89113 ) ) ( not ( = ?auto_89109 ?auto_89113 ) ) ( not ( = ?auto_89110 ?auto_89113 ) ) ( not ( = ?auto_89111 ?auto_89113 ) ) ( not ( = ?auto_89112 ?auto_89113 ) ) ( ON ?auto_89107 ?auto_89106 ) ( ON-TABLE ?auto_89113 ) ( ON ?auto_89108 ?auto_89107 ) ( ON ?auto_89109 ?auto_89108 ) ( ON ?auto_89110 ?auto_89109 ) ( CLEAR ?auto_89110 ) ( HOLDING ?auto_89111 ) ( CLEAR ?auto_89112 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_89112 ?auto_89111 )
      ( MAKE-7PILE ?auto_89106 ?auto_89107 ?auto_89108 ?auto_89109 ?auto_89110 ?auto_89111 ?auto_89112 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89114 - BLOCK
      ?auto_89115 - BLOCK
      ?auto_89116 - BLOCK
      ?auto_89117 - BLOCK
      ?auto_89118 - BLOCK
      ?auto_89119 - BLOCK
      ?auto_89120 - BLOCK
    )
    :vars
    (
      ?auto_89121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89114 ?auto_89115 ) ) ( not ( = ?auto_89114 ?auto_89116 ) ) ( not ( = ?auto_89114 ?auto_89117 ) ) ( not ( = ?auto_89114 ?auto_89118 ) ) ( not ( = ?auto_89114 ?auto_89119 ) ) ( not ( = ?auto_89114 ?auto_89120 ) ) ( not ( = ?auto_89115 ?auto_89116 ) ) ( not ( = ?auto_89115 ?auto_89117 ) ) ( not ( = ?auto_89115 ?auto_89118 ) ) ( not ( = ?auto_89115 ?auto_89119 ) ) ( not ( = ?auto_89115 ?auto_89120 ) ) ( not ( = ?auto_89116 ?auto_89117 ) ) ( not ( = ?auto_89116 ?auto_89118 ) ) ( not ( = ?auto_89116 ?auto_89119 ) ) ( not ( = ?auto_89116 ?auto_89120 ) ) ( not ( = ?auto_89117 ?auto_89118 ) ) ( not ( = ?auto_89117 ?auto_89119 ) ) ( not ( = ?auto_89117 ?auto_89120 ) ) ( not ( = ?auto_89118 ?auto_89119 ) ) ( not ( = ?auto_89118 ?auto_89120 ) ) ( not ( = ?auto_89119 ?auto_89120 ) ) ( ON-TABLE ?auto_89120 ) ( ON ?auto_89114 ?auto_89121 ) ( not ( = ?auto_89114 ?auto_89121 ) ) ( not ( = ?auto_89115 ?auto_89121 ) ) ( not ( = ?auto_89116 ?auto_89121 ) ) ( not ( = ?auto_89117 ?auto_89121 ) ) ( not ( = ?auto_89118 ?auto_89121 ) ) ( not ( = ?auto_89119 ?auto_89121 ) ) ( not ( = ?auto_89120 ?auto_89121 ) ) ( ON ?auto_89115 ?auto_89114 ) ( ON-TABLE ?auto_89121 ) ( ON ?auto_89116 ?auto_89115 ) ( ON ?auto_89117 ?auto_89116 ) ( ON ?auto_89118 ?auto_89117 ) ( CLEAR ?auto_89120 ) ( ON ?auto_89119 ?auto_89118 ) ( CLEAR ?auto_89119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_89121 ?auto_89114 ?auto_89115 ?auto_89116 ?auto_89117 ?auto_89118 )
      ( MAKE-7PILE ?auto_89114 ?auto_89115 ?auto_89116 ?auto_89117 ?auto_89118 ?auto_89119 ?auto_89120 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89122 - BLOCK
      ?auto_89123 - BLOCK
      ?auto_89124 - BLOCK
      ?auto_89125 - BLOCK
      ?auto_89126 - BLOCK
      ?auto_89127 - BLOCK
      ?auto_89128 - BLOCK
    )
    :vars
    (
      ?auto_89129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89122 ?auto_89123 ) ) ( not ( = ?auto_89122 ?auto_89124 ) ) ( not ( = ?auto_89122 ?auto_89125 ) ) ( not ( = ?auto_89122 ?auto_89126 ) ) ( not ( = ?auto_89122 ?auto_89127 ) ) ( not ( = ?auto_89122 ?auto_89128 ) ) ( not ( = ?auto_89123 ?auto_89124 ) ) ( not ( = ?auto_89123 ?auto_89125 ) ) ( not ( = ?auto_89123 ?auto_89126 ) ) ( not ( = ?auto_89123 ?auto_89127 ) ) ( not ( = ?auto_89123 ?auto_89128 ) ) ( not ( = ?auto_89124 ?auto_89125 ) ) ( not ( = ?auto_89124 ?auto_89126 ) ) ( not ( = ?auto_89124 ?auto_89127 ) ) ( not ( = ?auto_89124 ?auto_89128 ) ) ( not ( = ?auto_89125 ?auto_89126 ) ) ( not ( = ?auto_89125 ?auto_89127 ) ) ( not ( = ?auto_89125 ?auto_89128 ) ) ( not ( = ?auto_89126 ?auto_89127 ) ) ( not ( = ?auto_89126 ?auto_89128 ) ) ( not ( = ?auto_89127 ?auto_89128 ) ) ( ON ?auto_89122 ?auto_89129 ) ( not ( = ?auto_89122 ?auto_89129 ) ) ( not ( = ?auto_89123 ?auto_89129 ) ) ( not ( = ?auto_89124 ?auto_89129 ) ) ( not ( = ?auto_89125 ?auto_89129 ) ) ( not ( = ?auto_89126 ?auto_89129 ) ) ( not ( = ?auto_89127 ?auto_89129 ) ) ( not ( = ?auto_89128 ?auto_89129 ) ) ( ON ?auto_89123 ?auto_89122 ) ( ON-TABLE ?auto_89129 ) ( ON ?auto_89124 ?auto_89123 ) ( ON ?auto_89125 ?auto_89124 ) ( ON ?auto_89126 ?auto_89125 ) ( ON ?auto_89127 ?auto_89126 ) ( CLEAR ?auto_89127 ) ( HOLDING ?auto_89128 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_89128 )
      ( MAKE-7PILE ?auto_89122 ?auto_89123 ?auto_89124 ?auto_89125 ?auto_89126 ?auto_89127 ?auto_89128 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_89130 - BLOCK
      ?auto_89131 - BLOCK
      ?auto_89132 - BLOCK
      ?auto_89133 - BLOCK
      ?auto_89134 - BLOCK
      ?auto_89135 - BLOCK
      ?auto_89136 - BLOCK
    )
    :vars
    (
      ?auto_89137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_89130 ?auto_89131 ) ) ( not ( = ?auto_89130 ?auto_89132 ) ) ( not ( = ?auto_89130 ?auto_89133 ) ) ( not ( = ?auto_89130 ?auto_89134 ) ) ( not ( = ?auto_89130 ?auto_89135 ) ) ( not ( = ?auto_89130 ?auto_89136 ) ) ( not ( = ?auto_89131 ?auto_89132 ) ) ( not ( = ?auto_89131 ?auto_89133 ) ) ( not ( = ?auto_89131 ?auto_89134 ) ) ( not ( = ?auto_89131 ?auto_89135 ) ) ( not ( = ?auto_89131 ?auto_89136 ) ) ( not ( = ?auto_89132 ?auto_89133 ) ) ( not ( = ?auto_89132 ?auto_89134 ) ) ( not ( = ?auto_89132 ?auto_89135 ) ) ( not ( = ?auto_89132 ?auto_89136 ) ) ( not ( = ?auto_89133 ?auto_89134 ) ) ( not ( = ?auto_89133 ?auto_89135 ) ) ( not ( = ?auto_89133 ?auto_89136 ) ) ( not ( = ?auto_89134 ?auto_89135 ) ) ( not ( = ?auto_89134 ?auto_89136 ) ) ( not ( = ?auto_89135 ?auto_89136 ) ) ( ON ?auto_89130 ?auto_89137 ) ( not ( = ?auto_89130 ?auto_89137 ) ) ( not ( = ?auto_89131 ?auto_89137 ) ) ( not ( = ?auto_89132 ?auto_89137 ) ) ( not ( = ?auto_89133 ?auto_89137 ) ) ( not ( = ?auto_89134 ?auto_89137 ) ) ( not ( = ?auto_89135 ?auto_89137 ) ) ( not ( = ?auto_89136 ?auto_89137 ) ) ( ON ?auto_89131 ?auto_89130 ) ( ON-TABLE ?auto_89137 ) ( ON ?auto_89132 ?auto_89131 ) ( ON ?auto_89133 ?auto_89132 ) ( ON ?auto_89134 ?auto_89133 ) ( ON ?auto_89135 ?auto_89134 ) ( ON ?auto_89136 ?auto_89135 ) ( CLEAR ?auto_89136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_89137 ?auto_89130 ?auto_89131 ?auto_89132 ?auto_89133 ?auto_89134 ?auto_89135 )
      ( MAKE-7PILE ?auto_89130 ?auto_89131 ?auto_89132 ?auto_89133 ?auto_89134 ?auto_89135 ?auto_89136 ) )
  )

)

