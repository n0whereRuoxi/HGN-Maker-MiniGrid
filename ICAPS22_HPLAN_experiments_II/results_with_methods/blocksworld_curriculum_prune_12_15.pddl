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
      ?auto_191636 - BLOCK
    )
    :vars
    (
      ?auto_191637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191636 ?auto_191637 ) ( CLEAR ?auto_191636 ) ( HAND-EMPTY ) ( not ( = ?auto_191636 ?auto_191637 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191636 ?auto_191637 )
      ( !PUTDOWN ?auto_191636 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_191643 - BLOCK
      ?auto_191644 - BLOCK
    )
    :vars
    (
      ?auto_191645 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_191643 ) ( ON ?auto_191644 ?auto_191645 ) ( CLEAR ?auto_191644 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191643 ) ( not ( = ?auto_191643 ?auto_191644 ) ) ( not ( = ?auto_191643 ?auto_191645 ) ) ( not ( = ?auto_191644 ?auto_191645 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191644 ?auto_191645 )
      ( !STACK ?auto_191644 ?auto_191643 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_191653 - BLOCK
      ?auto_191654 - BLOCK
    )
    :vars
    (
      ?auto_191655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191654 ?auto_191655 ) ( not ( = ?auto_191653 ?auto_191654 ) ) ( not ( = ?auto_191653 ?auto_191655 ) ) ( not ( = ?auto_191654 ?auto_191655 ) ) ( ON ?auto_191653 ?auto_191654 ) ( CLEAR ?auto_191653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191653 )
      ( MAKE-2PILE ?auto_191653 ?auto_191654 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_191664 - BLOCK
      ?auto_191665 - BLOCK
      ?auto_191666 - BLOCK
    )
    :vars
    (
      ?auto_191667 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_191665 ) ( ON ?auto_191666 ?auto_191667 ) ( CLEAR ?auto_191666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191664 ) ( ON ?auto_191665 ?auto_191664 ) ( not ( = ?auto_191664 ?auto_191665 ) ) ( not ( = ?auto_191664 ?auto_191666 ) ) ( not ( = ?auto_191664 ?auto_191667 ) ) ( not ( = ?auto_191665 ?auto_191666 ) ) ( not ( = ?auto_191665 ?auto_191667 ) ) ( not ( = ?auto_191666 ?auto_191667 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191666 ?auto_191667 )
      ( !STACK ?auto_191666 ?auto_191665 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_191678 - BLOCK
      ?auto_191679 - BLOCK
      ?auto_191680 - BLOCK
    )
    :vars
    (
      ?auto_191681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191680 ?auto_191681 ) ( ON-TABLE ?auto_191678 ) ( not ( = ?auto_191678 ?auto_191679 ) ) ( not ( = ?auto_191678 ?auto_191680 ) ) ( not ( = ?auto_191678 ?auto_191681 ) ) ( not ( = ?auto_191679 ?auto_191680 ) ) ( not ( = ?auto_191679 ?auto_191681 ) ) ( not ( = ?auto_191680 ?auto_191681 ) ) ( CLEAR ?auto_191678 ) ( ON ?auto_191679 ?auto_191680 ) ( CLEAR ?auto_191679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191678 ?auto_191679 )
      ( MAKE-3PILE ?auto_191678 ?auto_191679 ?auto_191680 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_191692 - BLOCK
      ?auto_191693 - BLOCK
      ?auto_191694 - BLOCK
    )
    :vars
    (
      ?auto_191695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191694 ?auto_191695 ) ( not ( = ?auto_191692 ?auto_191693 ) ) ( not ( = ?auto_191692 ?auto_191694 ) ) ( not ( = ?auto_191692 ?auto_191695 ) ) ( not ( = ?auto_191693 ?auto_191694 ) ) ( not ( = ?auto_191693 ?auto_191695 ) ) ( not ( = ?auto_191694 ?auto_191695 ) ) ( ON ?auto_191693 ?auto_191694 ) ( ON ?auto_191692 ?auto_191693 ) ( CLEAR ?auto_191692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191692 )
      ( MAKE-3PILE ?auto_191692 ?auto_191693 ?auto_191694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_191707 - BLOCK
      ?auto_191708 - BLOCK
      ?auto_191709 - BLOCK
      ?auto_191710 - BLOCK
    )
    :vars
    (
      ?auto_191711 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_191709 ) ( ON ?auto_191710 ?auto_191711 ) ( CLEAR ?auto_191710 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191707 ) ( ON ?auto_191708 ?auto_191707 ) ( ON ?auto_191709 ?auto_191708 ) ( not ( = ?auto_191707 ?auto_191708 ) ) ( not ( = ?auto_191707 ?auto_191709 ) ) ( not ( = ?auto_191707 ?auto_191710 ) ) ( not ( = ?auto_191707 ?auto_191711 ) ) ( not ( = ?auto_191708 ?auto_191709 ) ) ( not ( = ?auto_191708 ?auto_191710 ) ) ( not ( = ?auto_191708 ?auto_191711 ) ) ( not ( = ?auto_191709 ?auto_191710 ) ) ( not ( = ?auto_191709 ?auto_191711 ) ) ( not ( = ?auto_191710 ?auto_191711 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191710 ?auto_191711 )
      ( !STACK ?auto_191710 ?auto_191709 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_191725 - BLOCK
      ?auto_191726 - BLOCK
      ?auto_191727 - BLOCK
      ?auto_191728 - BLOCK
    )
    :vars
    (
      ?auto_191729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191728 ?auto_191729 ) ( ON-TABLE ?auto_191725 ) ( ON ?auto_191726 ?auto_191725 ) ( not ( = ?auto_191725 ?auto_191726 ) ) ( not ( = ?auto_191725 ?auto_191727 ) ) ( not ( = ?auto_191725 ?auto_191728 ) ) ( not ( = ?auto_191725 ?auto_191729 ) ) ( not ( = ?auto_191726 ?auto_191727 ) ) ( not ( = ?auto_191726 ?auto_191728 ) ) ( not ( = ?auto_191726 ?auto_191729 ) ) ( not ( = ?auto_191727 ?auto_191728 ) ) ( not ( = ?auto_191727 ?auto_191729 ) ) ( not ( = ?auto_191728 ?auto_191729 ) ) ( CLEAR ?auto_191726 ) ( ON ?auto_191727 ?auto_191728 ) ( CLEAR ?auto_191727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191725 ?auto_191726 ?auto_191727 )
      ( MAKE-4PILE ?auto_191725 ?auto_191726 ?auto_191727 ?auto_191728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_191743 - BLOCK
      ?auto_191744 - BLOCK
      ?auto_191745 - BLOCK
      ?auto_191746 - BLOCK
    )
    :vars
    (
      ?auto_191747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191746 ?auto_191747 ) ( ON-TABLE ?auto_191743 ) ( not ( = ?auto_191743 ?auto_191744 ) ) ( not ( = ?auto_191743 ?auto_191745 ) ) ( not ( = ?auto_191743 ?auto_191746 ) ) ( not ( = ?auto_191743 ?auto_191747 ) ) ( not ( = ?auto_191744 ?auto_191745 ) ) ( not ( = ?auto_191744 ?auto_191746 ) ) ( not ( = ?auto_191744 ?auto_191747 ) ) ( not ( = ?auto_191745 ?auto_191746 ) ) ( not ( = ?auto_191745 ?auto_191747 ) ) ( not ( = ?auto_191746 ?auto_191747 ) ) ( ON ?auto_191745 ?auto_191746 ) ( CLEAR ?auto_191743 ) ( ON ?auto_191744 ?auto_191745 ) ( CLEAR ?auto_191744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191743 ?auto_191744 )
      ( MAKE-4PILE ?auto_191743 ?auto_191744 ?auto_191745 ?auto_191746 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_191761 - BLOCK
      ?auto_191762 - BLOCK
      ?auto_191763 - BLOCK
      ?auto_191764 - BLOCK
    )
    :vars
    (
      ?auto_191765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191764 ?auto_191765 ) ( not ( = ?auto_191761 ?auto_191762 ) ) ( not ( = ?auto_191761 ?auto_191763 ) ) ( not ( = ?auto_191761 ?auto_191764 ) ) ( not ( = ?auto_191761 ?auto_191765 ) ) ( not ( = ?auto_191762 ?auto_191763 ) ) ( not ( = ?auto_191762 ?auto_191764 ) ) ( not ( = ?auto_191762 ?auto_191765 ) ) ( not ( = ?auto_191763 ?auto_191764 ) ) ( not ( = ?auto_191763 ?auto_191765 ) ) ( not ( = ?auto_191764 ?auto_191765 ) ) ( ON ?auto_191763 ?auto_191764 ) ( ON ?auto_191762 ?auto_191763 ) ( ON ?auto_191761 ?auto_191762 ) ( CLEAR ?auto_191761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191761 )
      ( MAKE-4PILE ?auto_191761 ?auto_191762 ?auto_191763 ?auto_191764 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_191780 - BLOCK
      ?auto_191781 - BLOCK
      ?auto_191782 - BLOCK
      ?auto_191783 - BLOCK
      ?auto_191784 - BLOCK
    )
    :vars
    (
      ?auto_191785 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_191783 ) ( ON ?auto_191784 ?auto_191785 ) ( CLEAR ?auto_191784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191780 ) ( ON ?auto_191781 ?auto_191780 ) ( ON ?auto_191782 ?auto_191781 ) ( ON ?auto_191783 ?auto_191782 ) ( not ( = ?auto_191780 ?auto_191781 ) ) ( not ( = ?auto_191780 ?auto_191782 ) ) ( not ( = ?auto_191780 ?auto_191783 ) ) ( not ( = ?auto_191780 ?auto_191784 ) ) ( not ( = ?auto_191780 ?auto_191785 ) ) ( not ( = ?auto_191781 ?auto_191782 ) ) ( not ( = ?auto_191781 ?auto_191783 ) ) ( not ( = ?auto_191781 ?auto_191784 ) ) ( not ( = ?auto_191781 ?auto_191785 ) ) ( not ( = ?auto_191782 ?auto_191783 ) ) ( not ( = ?auto_191782 ?auto_191784 ) ) ( not ( = ?auto_191782 ?auto_191785 ) ) ( not ( = ?auto_191783 ?auto_191784 ) ) ( not ( = ?auto_191783 ?auto_191785 ) ) ( not ( = ?auto_191784 ?auto_191785 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191784 ?auto_191785 )
      ( !STACK ?auto_191784 ?auto_191783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_191802 - BLOCK
      ?auto_191803 - BLOCK
      ?auto_191804 - BLOCK
      ?auto_191805 - BLOCK
      ?auto_191806 - BLOCK
    )
    :vars
    (
      ?auto_191807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191806 ?auto_191807 ) ( ON-TABLE ?auto_191802 ) ( ON ?auto_191803 ?auto_191802 ) ( ON ?auto_191804 ?auto_191803 ) ( not ( = ?auto_191802 ?auto_191803 ) ) ( not ( = ?auto_191802 ?auto_191804 ) ) ( not ( = ?auto_191802 ?auto_191805 ) ) ( not ( = ?auto_191802 ?auto_191806 ) ) ( not ( = ?auto_191802 ?auto_191807 ) ) ( not ( = ?auto_191803 ?auto_191804 ) ) ( not ( = ?auto_191803 ?auto_191805 ) ) ( not ( = ?auto_191803 ?auto_191806 ) ) ( not ( = ?auto_191803 ?auto_191807 ) ) ( not ( = ?auto_191804 ?auto_191805 ) ) ( not ( = ?auto_191804 ?auto_191806 ) ) ( not ( = ?auto_191804 ?auto_191807 ) ) ( not ( = ?auto_191805 ?auto_191806 ) ) ( not ( = ?auto_191805 ?auto_191807 ) ) ( not ( = ?auto_191806 ?auto_191807 ) ) ( CLEAR ?auto_191804 ) ( ON ?auto_191805 ?auto_191806 ) ( CLEAR ?auto_191805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191802 ?auto_191803 ?auto_191804 ?auto_191805 )
      ( MAKE-5PILE ?auto_191802 ?auto_191803 ?auto_191804 ?auto_191805 ?auto_191806 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_191824 - BLOCK
      ?auto_191825 - BLOCK
      ?auto_191826 - BLOCK
      ?auto_191827 - BLOCK
      ?auto_191828 - BLOCK
    )
    :vars
    (
      ?auto_191829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191828 ?auto_191829 ) ( ON-TABLE ?auto_191824 ) ( ON ?auto_191825 ?auto_191824 ) ( not ( = ?auto_191824 ?auto_191825 ) ) ( not ( = ?auto_191824 ?auto_191826 ) ) ( not ( = ?auto_191824 ?auto_191827 ) ) ( not ( = ?auto_191824 ?auto_191828 ) ) ( not ( = ?auto_191824 ?auto_191829 ) ) ( not ( = ?auto_191825 ?auto_191826 ) ) ( not ( = ?auto_191825 ?auto_191827 ) ) ( not ( = ?auto_191825 ?auto_191828 ) ) ( not ( = ?auto_191825 ?auto_191829 ) ) ( not ( = ?auto_191826 ?auto_191827 ) ) ( not ( = ?auto_191826 ?auto_191828 ) ) ( not ( = ?auto_191826 ?auto_191829 ) ) ( not ( = ?auto_191827 ?auto_191828 ) ) ( not ( = ?auto_191827 ?auto_191829 ) ) ( not ( = ?auto_191828 ?auto_191829 ) ) ( ON ?auto_191827 ?auto_191828 ) ( CLEAR ?auto_191825 ) ( ON ?auto_191826 ?auto_191827 ) ( CLEAR ?auto_191826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191824 ?auto_191825 ?auto_191826 )
      ( MAKE-5PILE ?auto_191824 ?auto_191825 ?auto_191826 ?auto_191827 ?auto_191828 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_191846 - BLOCK
      ?auto_191847 - BLOCK
      ?auto_191848 - BLOCK
      ?auto_191849 - BLOCK
      ?auto_191850 - BLOCK
    )
    :vars
    (
      ?auto_191851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191850 ?auto_191851 ) ( ON-TABLE ?auto_191846 ) ( not ( = ?auto_191846 ?auto_191847 ) ) ( not ( = ?auto_191846 ?auto_191848 ) ) ( not ( = ?auto_191846 ?auto_191849 ) ) ( not ( = ?auto_191846 ?auto_191850 ) ) ( not ( = ?auto_191846 ?auto_191851 ) ) ( not ( = ?auto_191847 ?auto_191848 ) ) ( not ( = ?auto_191847 ?auto_191849 ) ) ( not ( = ?auto_191847 ?auto_191850 ) ) ( not ( = ?auto_191847 ?auto_191851 ) ) ( not ( = ?auto_191848 ?auto_191849 ) ) ( not ( = ?auto_191848 ?auto_191850 ) ) ( not ( = ?auto_191848 ?auto_191851 ) ) ( not ( = ?auto_191849 ?auto_191850 ) ) ( not ( = ?auto_191849 ?auto_191851 ) ) ( not ( = ?auto_191850 ?auto_191851 ) ) ( ON ?auto_191849 ?auto_191850 ) ( ON ?auto_191848 ?auto_191849 ) ( CLEAR ?auto_191846 ) ( ON ?auto_191847 ?auto_191848 ) ( CLEAR ?auto_191847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191846 ?auto_191847 )
      ( MAKE-5PILE ?auto_191846 ?auto_191847 ?auto_191848 ?auto_191849 ?auto_191850 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_191868 - BLOCK
      ?auto_191869 - BLOCK
      ?auto_191870 - BLOCK
      ?auto_191871 - BLOCK
      ?auto_191872 - BLOCK
    )
    :vars
    (
      ?auto_191873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191872 ?auto_191873 ) ( not ( = ?auto_191868 ?auto_191869 ) ) ( not ( = ?auto_191868 ?auto_191870 ) ) ( not ( = ?auto_191868 ?auto_191871 ) ) ( not ( = ?auto_191868 ?auto_191872 ) ) ( not ( = ?auto_191868 ?auto_191873 ) ) ( not ( = ?auto_191869 ?auto_191870 ) ) ( not ( = ?auto_191869 ?auto_191871 ) ) ( not ( = ?auto_191869 ?auto_191872 ) ) ( not ( = ?auto_191869 ?auto_191873 ) ) ( not ( = ?auto_191870 ?auto_191871 ) ) ( not ( = ?auto_191870 ?auto_191872 ) ) ( not ( = ?auto_191870 ?auto_191873 ) ) ( not ( = ?auto_191871 ?auto_191872 ) ) ( not ( = ?auto_191871 ?auto_191873 ) ) ( not ( = ?auto_191872 ?auto_191873 ) ) ( ON ?auto_191871 ?auto_191872 ) ( ON ?auto_191870 ?auto_191871 ) ( ON ?auto_191869 ?auto_191870 ) ( ON ?auto_191868 ?auto_191869 ) ( CLEAR ?auto_191868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191868 )
      ( MAKE-5PILE ?auto_191868 ?auto_191869 ?auto_191870 ?auto_191871 ?auto_191872 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191891 - BLOCK
      ?auto_191892 - BLOCK
      ?auto_191893 - BLOCK
      ?auto_191894 - BLOCK
      ?auto_191895 - BLOCK
      ?auto_191896 - BLOCK
    )
    :vars
    (
      ?auto_191897 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_191895 ) ( ON ?auto_191896 ?auto_191897 ) ( CLEAR ?auto_191896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191891 ) ( ON ?auto_191892 ?auto_191891 ) ( ON ?auto_191893 ?auto_191892 ) ( ON ?auto_191894 ?auto_191893 ) ( ON ?auto_191895 ?auto_191894 ) ( not ( = ?auto_191891 ?auto_191892 ) ) ( not ( = ?auto_191891 ?auto_191893 ) ) ( not ( = ?auto_191891 ?auto_191894 ) ) ( not ( = ?auto_191891 ?auto_191895 ) ) ( not ( = ?auto_191891 ?auto_191896 ) ) ( not ( = ?auto_191891 ?auto_191897 ) ) ( not ( = ?auto_191892 ?auto_191893 ) ) ( not ( = ?auto_191892 ?auto_191894 ) ) ( not ( = ?auto_191892 ?auto_191895 ) ) ( not ( = ?auto_191892 ?auto_191896 ) ) ( not ( = ?auto_191892 ?auto_191897 ) ) ( not ( = ?auto_191893 ?auto_191894 ) ) ( not ( = ?auto_191893 ?auto_191895 ) ) ( not ( = ?auto_191893 ?auto_191896 ) ) ( not ( = ?auto_191893 ?auto_191897 ) ) ( not ( = ?auto_191894 ?auto_191895 ) ) ( not ( = ?auto_191894 ?auto_191896 ) ) ( not ( = ?auto_191894 ?auto_191897 ) ) ( not ( = ?auto_191895 ?auto_191896 ) ) ( not ( = ?auto_191895 ?auto_191897 ) ) ( not ( = ?auto_191896 ?auto_191897 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191896 ?auto_191897 )
      ( !STACK ?auto_191896 ?auto_191895 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191917 - BLOCK
      ?auto_191918 - BLOCK
      ?auto_191919 - BLOCK
      ?auto_191920 - BLOCK
      ?auto_191921 - BLOCK
      ?auto_191922 - BLOCK
    )
    :vars
    (
      ?auto_191923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191922 ?auto_191923 ) ( ON-TABLE ?auto_191917 ) ( ON ?auto_191918 ?auto_191917 ) ( ON ?auto_191919 ?auto_191918 ) ( ON ?auto_191920 ?auto_191919 ) ( not ( = ?auto_191917 ?auto_191918 ) ) ( not ( = ?auto_191917 ?auto_191919 ) ) ( not ( = ?auto_191917 ?auto_191920 ) ) ( not ( = ?auto_191917 ?auto_191921 ) ) ( not ( = ?auto_191917 ?auto_191922 ) ) ( not ( = ?auto_191917 ?auto_191923 ) ) ( not ( = ?auto_191918 ?auto_191919 ) ) ( not ( = ?auto_191918 ?auto_191920 ) ) ( not ( = ?auto_191918 ?auto_191921 ) ) ( not ( = ?auto_191918 ?auto_191922 ) ) ( not ( = ?auto_191918 ?auto_191923 ) ) ( not ( = ?auto_191919 ?auto_191920 ) ) ( not ( = ?auto_191919 ?auto_191921 ) ) ( not ( = ?auto_191919 ?auto_191922 ) ) ( not ( = ?auto_191919 ?auto_191923 ) ) ( not ( = ?auto_191920 ?auto_191921 ) ) ( not ( = ?auto_191920 ?auto_191922 ) ) ( not ( = ?auto_191920 ?auto_191923 ) ) ( not ( = ?auto_191921 ?auto_191922 ) ) ( not ( = ?auto_191921 ?auto_191923 ) ) ( not ( = ?auto_191922 ?auto_191923 ) ) ( CLEAR ?auto_191920 ) ( ON ?auto_191921 ?auto_191922 ) ( CLEAR ?auto_191921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191917 ?auto_191918 ?auto_191919 ?auto_191920 ?auto_191921 )
      ( MAKE-6PILE ?auto_191917 ?auto_191918 ?auto_191919 ?auto_191920 ?auto_191921 ?auto_191922 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191943 - BLOCK
      ?auto_191944 - BLOCK
      ?auto_191945 - BLOCK
      ?auto_191946 - BLOCK
      ?auto_191947 - BLOCK
      ?auto_191948 - BLOCK
    )
    :vars
    (
      ?auto_191949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191948 ?auto_191949 ) ( ON-TABLE ?auto_191943 ) ( ON ?auto_191944 ?auto_191943 ) ( ON ?auto_191945 ?auto_191944 ) ( not ( = ?auto_191943 ?auto_191944 ) ) ( not ( = ?auto_191943 ?auto_191945 ) ) ( not ( = ?auto_191943 ?auto_191946 ) ) ( not ( = ?auto_191943 ?auto_191947 ) ) ( not ( = ?auto_191943 ?auto_191948 ) ) ( not ( = ?auto_191943 ?auto_191949 ) ) ( not ( = ?auto_191944 ?auto_191945 ) ) ( not ( = ?auto_191944 ?auto_191946 ) ) ( not ( = ?auto_191944 ?auto_191947 ) ) ( not ( = ?auto_191944 ?auto_191948 ) ) ( not ( = ?auto_191944 ?auto_191949 ) ) ( not ( = ?auto_191945 ?auto_191946 ) ) ( not ( = ?auto_191945 ?auto_191947 ) ) ( not ( = ?auto_191945 ?auto_191948 ) ) ( not ( = ?auto_191945 ?auto_191949 ) ) ( not ( = ?auto_191946 ?auto_191947 ) ) ( not ( = ?auto_191946 ?auto_191948 ) ) ( not ( = ?auto_191946 ?auto_191949 ) ) ( not ( = ?auto_191947 ?auto_191948 ) ) ( not ( = ?auto_191947 ?auto_191949 ) ) ( not ( = ?auto_191948 ?auto_191949 ) ) ( ON ?auto_191947 ?auto_191948 ) ( CLEAR ?auto_191945 ) ( ON ?auto_191946 ?auto_191947 ) ( CLEAR ?auto_191946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191943 ?auto_191944 ?auto_191945 ?auto_191946 )
      ( MAKE-6PILE ?auto_191943 ?auto_191944 ?auto_191945 ?auto_191946 ?auto_191947 ?auto_191948 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191969 - BLOCK
      ?auto_191970 - BLOCK
      ?auto_191971 - BLOCK
      ?auto_191972 - BLOCK
      ?auto_191973 - BLOCK
      ?auto_191974 - BLOCK
    )
    :vars
    (
      ?auto_191975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191974 ?auto_191975 ) ( ON-TABLE ?auto_191969 ) ( ON ?auto_191970 ?auto_191969 ) ( not ( = ?auto_191969 ?auto_191970 ) ) ( not ( = ?auto_191969 ?auto_191971 ) ) ( not ( = ?auto_191969 ?auto_191972 ) ) ( not ( = ?auto_191969 ?auto_191973 ) ) ( not ( = ?auto_191969 ?auto_191974 ) ) ( not ( = ?auto_191969 ?auto_191975 ) ) ( not ( = ?auto_191970 ?auto_191971 ) ) ( not ( = ?auto_191970 ?auto_191972 ) ) ( not ( = ?auto_191970 ?auto_191973 ) ) ( not ( = ?auto_191970 ?auto_191974 ) ) ( not ( = ?auto_191970 ?auto_191975 ) ) ( not ( = ?auto_191971 ?auto_191972 ) ) ( not ( = ?auto_191971 ?auto_191973 ) ) ( not ( = ?auto_191971 ?auto_191974 ) ) ( not ( = ?auto_191971 ?auto_191975 ) ) ( not ( = ?auto_191972 ?auto_191973 ) ) ( not ( = ?auto_191972 ?auto_191974 ) ) ( not ( = ?auto_191972 ?auto_191975 ) ) ( not ( = ?auto_191973 ?auto_191974 ) ) ( not ( = ?auto_191973 ?auto_191975 ) ) ( not ( = ?auto_191974 ?auto_191975 ) ) ( ON ?auto_191973 ?auto_191974 ) ( ON ?auto_191972 ?auto_191973 ) ( CLEAR ?auto_191970 ) ( ON ?auto_191971 ?auto_191972 ) ( CLEAR ?auto_191971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191969 ?auto_191970 ?auto_191971 )
      ( MAKE-6PILE ?auto_191969 ?auto_191970 ?auto_191971 ?auto_191972 ?auto_191973 ?auto_191974 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191995 - BLOCK
      ?auto_191996 - BLOCK
      ?auto_191997 - BLOCK
      ?auto_191998 - BLOCK
      ?auto_191999 - BLOCK
      ?auto_192000 - BLOCK
    )
    :vars
    (
      ?auto_192001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192000 ?auto_192001 ) ( ON-TABLE ?auto_191995 ) ( not ( = ?auto_191995 ?auto_191996 ) ) ( not ( = ?auto_191995 ?auto_191997 ) ) ( not ( = ?auto_191995 ?auto_191998 ) ) ( not ( = ?auto_191995 ?auto_191999 ) ) ( not ( = ?auto_191995 ?auto_192000 ) ) ( not ( = ?auto_191995 ?auto_192001 ) ) ( not ( = ?auto_191996 ?auto_191997 ) ) ( not ( = ?auto_191996 ?auto_191998 ) ) ( not ( = ?auto_191996 ?auto_191999 ) ) ( not ( = ?auto_191996 ?auto_192000 ) ) ( not ( = ?auto_191996 ?auto_192001 ) ) ( not ( = ?auto_191997 ?auto_191998 ) ) ( not ( = ?auto_191997 ?auto_191999 ) ) ( not ( = ?auto_191997 ?auto_192000 ) ) ( not ( = ?auto_191997 ?auto_192001 ) ) ( not ( = ?auto_191998 ?auto_191999 ) ) ( not ( = ?auto_191998 ?auto_192000 ) ) ( not ( = ?auto_191998 ?auto_192001 ) ) ( not ( = ?auto_191999 ?auto_192000 ) ) ( not ( = ?auto_191999 ?auto_192001 ) ) ( not ( = ?auto_192000 ?auto_192001 ) ) ( ON ?auto_191999 ?auto_192000 ) ( ON ?auto_191998 ?auto_191999 ) ( ON ?auto_191997 ?auto_191998 ) ( CLEAR ?auto_191995 ) ( ON ?auto_191996 ?auto_191997 ) ( CLEAR ?auto_191996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191995 ?auto_191996 )
      ( MAKE-6PILE ?auto_191995 ?auto_191996 ?auto_191997 ?auto_191998 ?auto_191999 ?auto_192000 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192021 - BLOCK
      ?auto_192022 - BLOCK
      ?auto_192023 - BLOCK
      ?auto_192024 - BLOCK
      ?auto_192025 - BLOCK
      ?auto_192026 - BLOCK
    )
    :vars
    (
      ?auto_192027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192026 ?auto_192027 ) ( not ( = ?auto_192021 ?auto_192022 ) ) ( not ( = ?auto_192021 ?auto_192023 ) ) ( not ( = ?auto_192021 ?auto_192024 ) ) ( not ( = ?auto_192021 ?auto_192025 ) ) ( not ( = ?auto_192021 ?auto_192026 ) ) ( not ( = ?auto_192021 ?auto_192027 ) ) ( not ( = ?auto_192022 ?auto_192023 ) ) ( not ( = ?auto_192022 ?auto_192024 ) ) ( not ( = ?auto_192022 ?auto_192025 ) ) ( not ( = ?auto_192022 ?auto_192026 ) ) ( not ( = ?auto_192022 ?auto_192027 ) ) ( not ( = ?auto_192023 ?auto_192024 ) ) ( not ( = ?auto_192023 ?auto_192025 ) ) ( not ( = ?auto_192023 ?auto_192026 ) ) ( not ( = ?auto_192023 ?auto_192027 ) ) ( not ( = ?auto_192024 ?auto_192025 ) ) ( not ( = ?auto_192024 ?auto_192026 ) ) ( not ( = ?auto_192024 ?auto_192027 ) ) ( not ( = ?auto_192025 ?auto_192026 ) ) ( not ( = ?auto_192025 ?auto_192027 ) ) ( not ( = ?auto_192026 ?auto_192027 ) ) ( ON ?auto_192025 ?auto_192026 ) ( ON ?auto_192024 ?auto_192025 ) ( ON ?auto_192023 ?auto_192024 ) ( ON ?auto_192022 ?auto_192023 ) ( ON ?auto_192021 ?auto_192022 ) ( CLEAR ?auto_192021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192021 )
      ( MAKE-6PILE ?auto_192021 ?auto_192022 ?auto_192023 ?auto_192024 ?auto_192025 ?auto_192026 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192048 - BLOCK
      ?auto_192049 - BLOCK
      ?auto_192050 - BLOCK
      ?auto_192051 - BLOCK
      ?auto_192052 - BLOCK
      ?auto_192053 - BLOCK
      ?auto_192054 - BLOCK
    )
    :vars
    (
      ?auto_192055 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_192053 ) ( ON ?auto_192054 ?auto_192055 ) ( CLEAR ?auto_192054 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192048 ) ( ON ?auto_192049 ?auto_192048 ) ( ON ?auto_192050 ?auto_192049 ) ( ON ?auto_192051 ?auto_192050 ) ( ON ?auto_192052 ?auto_192051 ) ( ON ?auto_192053 ?auto_192052 ) ( not ( = ?auto_192048 ?auto_192049 ) ) ( not ( = ?auto_192048 ?auto_192050 ) ) ( not ( = ?auto_192048 ?auto_192051 ) ) ( not ( = ?auto_192048 ?auto_192052 ) ) ( not ( = ?auto_192048 ?auto_192053 ) ) ( not ( = ?auto_192048 ?auto_192054 ) ) ( not ( = ?auto_192048 ?auto_192055 ) ) ( not ( = ?auto_192049 ?auto_192050 ) ) ( not ( = ?auto_192049 ?auto_192051 ) ) ( not ( = ?auto_192049 ?auto_192052 ) ) ( not ( = ?auto_192049 ?auto_192053 ) ) ( not ( = ?auto_192049 ?auto_192054 ) ) ( not ( = ?auto_192049 ?auto_192055 ) ) ( not ( = ?auto_192050 ?auto_192051 ) ) ( not ( = ?auto_192050 ?auto_192052 ) ) ( not ( = ?auto_192050 ?auto_192053 ) ) ( not ( = ?auto_192050 ?auto_192054 ) ) ( not ( = ?auto_192050 ?auto_192055 ) ) ( not ( = ?auto_192051 ?auto_192052 ) ) ( not ( = ?auto_192051 ?auto_192053 ) ) ( not ( = ?auto_192051 ?auto_192054 ) ) ( not ( = ?auto_192051 ?auto_192055 ) ) ( not ( = ?auto_192052 ?auto_192053 ) ) ( not ( = ?auto_192052 ?auto_192054 ) ) ( not ( = ?auto_192052 ?auto_192055 ) ) ( not ( = ?auto_192053 ?auto_192054 ) ) ( not ( = ?auto_192053 ?auto_192055 ) ) ( not ( = ?auto_192054 ?auto_192055 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192054 ?auto_192055 )
      ( !STACK ?auto_192054 ?auto_192053 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192078 - BLOCK
      ?auto_192079 - BLOCK
      ?auto_192080 - BLOCK
      ?auto_192081 - BLOCK
      ?auto_192082 - BLOCK
      ?auto_192083 - BLOCK
      ?auto_192084 - BLOCK
    )
    :vars
    (
      ?auto_192085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192084 ?auto_192085 ) ( ON-TABLE ?auto_192078 ) ( ON ?auto_192079 ?auto_192078 ) ( ON ?auto_192080 ?auto_192079 ) ( ON ?auto_192081 ?auto_192080 ) ( ON ?auto_192082 ?auto_192081 ) ( not ( = ?auto_192078 ?auto_192079 ) ) ( not ( = ?auto_192078 ?auto_192080 ) ) ( not ( = ?auto_192078 ?auto_192081 ) ) ( not ( = ?auto_192078 ?auto_192082 ) ) ( not ( = ?auto_192078 ?auto_192083 ) ) ( not ( = ?auto_192078 ?auto_192084 ) ) ( not ( = ?auto_192078 ?auto_192085 ) ) ( not ( = ?auto_192079 ?auto_192080 ) ) ( not ( = ?auto_192079 ?auto_192081 ) ) ( not ( = ?auto_192079 ?auto_192082 ) ) ( not ( = ?auto_192079 ?auto_192083 ) ) ( not ( = ?auto_192079 ?auto_192084 ) ) ( not ( = ?auto_192079 ?auto_192085 ) ) ( not ( = ?auto_192080 ?auto_192081 ) ) ( not ( = ?auto_192080 ?auto_192082 ) ) ( not ( = ?auto_192080 ?auto_192083 ) ) ( not ( = ?auto_192080 ?auto_192084 ) ) ( not ( = ?auto_192080 ?auto_192085 ) ) ( not ( = ?auto_192081 ?auto_192082 ) ) ( not ( = ?auto_192081 ?auto_192083 ) ) ( not ( = ?auto_192081 ?auto_192084 ) ) ( not ( = ?auto_192081 ?auto_192085 ) ) ( not ( = ?auto_192082 ?auto_192083 ) ) ( not ( = ?auto_192082 ?auto_192084 ) ) ( not ( = ?auto_192082 ?auto_192085 ) ) ( not ( = ?auto_192083 ?auto_192084 ) ) ( not ( = ?auto_192083 ?auto_192085 ) ) ( not ( = ?auto_192084 ?auto_192085 ) ) ( CLEAR ?auto_192082 ) ( ON ?auto_192083 ?auto_192084 ) ( CLEAR ?auto_192083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_192078 ?auto_192079 ?auto_192080 ?auto_192081 ?auto_192082 ?auto_192083 )
      ( MAKE-7PILE ?auto_192078 ?auto_192079 ?auto_192080 ?auto_192081 ?auto_192082 ?auto_192083 ?auto_192084 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192108 - BLOCK
      ?auto_192109 - BLOCK
      ?auto_192110 - BLOCK
      ?auto_192111 - BLOCK
      ?auto_192112 - BLOCK
      ?auto_192113 - BLOCK
      ?auto_192114 - BLOCK
    )
    :vars
    (
      ?auto_192115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192114 ?auto_192115 ) ( ON-TABLE ?auto_192108 ) ( ON ?auto_192109 ?auto_192108 ) ( ON ?auto_192110 ?auto_192109 ) ( ON ?auto_192111 ?auto_192110 ) ( not ( = ?auto_192108 ?auto_192109 ) ) ( not ( = ?auto_192108 ?auto_192110 ) ) ( not ( = ?auto_192108 ?auto_192111 ) ) ( not ( = ?auto_192108 ?auto_192112 ) ) ( not ( = ?auto_192108 ?auto_192113 ) ) ( not ( = ?auto_192108 ?auto_192114 ) ) ( not ( = ?auto_192108 ?auto_192115 ) ) ( not ( = ?auto_192109 ?auto_192110 ) ) ( not ( = ?auto_192109 ?auto_192111 ) ) ( not ( = ?auto_192109 ?auto_192112 ) ) ( not ( = ?auto_192109 ?auto_192113 ) ) ( not ( = ?auto_192109 ?auto_192114 ) ) ( not ( = ?auto_192109 ?auto_192115 ) ) ( not ( = ?auto_192110 ?auto_192111 ) ) ( not ( = ?auto_192110 ?auto_192112 ) ) ( not ( = ?auto_192110 ?auto_192113 ) ) ( not ( = ?auto_192110 ?auto_192114 ) ) ( not ( = ?auto_192110 ?auto_192115 ) ) ( not ( = ?auto_192111 ?auto_192112 ) ) ( not ( = ?auto_192111 ?auto_192113 ) ) ( not ( = ?auto_192111 ?auto_192114 ) ) ( not ( = ?auto_192111 ?auto_192115 ) ) ( not ( = ?auto_192112 ?auto_192113 ) ) ( not ( = ?auto_192112 ?auto_192114 ) ) ( not ( = ?auto_192112 ?auto_192115 ) ) ( not ( = ?auto_192113 ?auto_192114 ) ) ( not ( = ?auto_192113 ?auto_192115 ) ) ( not ( = ?auto_192114 ?auto_192115 ) ) ( ON ?auto_192113 ?auto_192114 ) ( CLEAR ?auto_192111 ) ( ON ?auto_192112 ?auto_192113 ) ( CLEAR ?auto_192112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_192108 ?auto_192109 ?auto_192110 ?auto_192111 ?auto_192112 )
      ( MAKE-7PILE ?auto_192108 ?auto_192109 ?auto_192110 ?auto_192111 ?auto_192112 ?auto_192113 ?auto_192114 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192138 - BLOCK
      ?auto_192139 - BLOCK
      ?auto_192140 - BLOCK
      ?auto_192141 - BLOCK
      ?auto_192142 - BLOCK
      ?auto_192143 - BLOCK
      ?auto_192144 - BLOCK
    )
    :vars
    (
      ?auto_192145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192144 ?auto_192145 ) ( ON-TABLE ?auto_192138 ) ( ON ?auto_192139 ?auto_192138 ) ( ON ?auto_192140 ?auto_192139 ) ( not ( = ?auto_192138 ?auto_192139 ) ) ( not ( = ?auto_192138 ?auto_192140 ) ) ( not ( = ?auto_192138 ?auto_192141 ) ) ( not ( = ?auto_192138 ?auto_192142 ) ) ( not ( = ?auto_192138 ?auto_192143 ) ) ( not ( = ?auto_192138 ?auto_192144 ) ) ( not ( = ?auto_192138 ?auto_192145 ) ) ( not ( = ?auto_192139 ?auto_192140 ) ) ( not ( = ?auto_192139 ?auto_192141 ) ) ( not ( = ?auto_192139 ?auto_192142 ) ) ( not ( = ?auto_192139 ?auto_192143 ) ) ( not ( = ?auto_192139 ?auto_192144 ) ) ( not ( = ?auto_192139 ?auto_192145 ) ) ( not ( = ?auto_192140 ?auto_192141 ) ) ( not ( = ?auto_192140 ?auto_192142 ) ) ( not ( = ?auto_192140 ?auto_192143 ) ) ( not ( = ?auto_192140 ?auto_192144 ) ) ( not ( = ?auto_192140 ?auto_192145 ) ) ( not ( = ?auto_192141 ?auto_192142 ) ) ( not ( = ?auto_192141 ?auto_192143 ) ) ( not ( = ?auto_192141 ?auto_192144 ) ) ( not ( = ?auto_192141 ?auto_192145 ) ) ( not ( = ?auto_192142 ?auto_192143 ) ) ( not ( = ?auto_192142 ?auto_192144 ) ) ( not ( = ?auto_192142 ?auto_192145 ) ) ( not ( = ?auto_192143 ?auto_192144 ) ) ( not ( = ?auto_192143 ?auto_192145 ) ) ( not ( = ?auto_192144 ?auto_192145 ) ) ( ON ?auto_192143 ?auto_192144 ) ( ON ?auto_192142 ?auto_192143 ) ( CLEAR ?auto_192140 ) ( ON ?auto_192141 ?auto_192142 ) ( CLEAR ?auto_192141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_192138 ?auto_192139 ?auto_192140 ?auto_192141 )
      ( MAKE-7PILE ?auto_192138 ?auto_192139 ?auto_192140 ?auto_192141 ?auto_192142 ?auto_192143 ?auto_192144 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192168 - BLOCK
      ?auto_192169 - BLOCK
      ?auto_192170 - BLOCK
      ?auto_192171 - BLOCK
      ?auto_192172 - BLOCK
      ?auto_192173 - BLOCK
      ?auto_192174 - BLOCK
    )
    :vars
    (
      ?auto_192175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192174 ?auto_192175 ) ( ON-TABLE ?auto_192168 ) ( ON ?auto_192169 ?auto_192168 ) ( not ( = ?auto_192168 ?auto_192169 ) ) ( not ( = ?auto_192168 ?auto_192170 ) ) ( not ( = ?auto_192168 ?auto_192171 ) ) ( not ( = ?auto_192168 ?auto_192172 ) ) ( not ( = ?auto_192168 ?auto_192173 ) ) ( not ( = ?auto_192168 ?auto_192174 ) ) ( not ( = ?auto_192168 ?auto_192175 ) ) ( not ( = ?auto_192169 ?auto_192170 ) ) ( not ( = ?auto_192169 ?auto_192171 ) ) ( not ( = ?auto_192169 ?auto_192172 ) ) ( not ( = ?auto_192169 ?auto_192173 ) ) ( not ( = ?auto_192169 ?auto_192174 ) ) ( not ( = ?auto_192169 ?auto_192175 ) ) ( not ( = ?auto_192170 ?auto_192171 ) ) ( not ( = ?auto_192170 ?auto_192172 ) ) ( not ( = ?auto_192170 ?auto_192173 ) ) ( not ( = ?auto_192170 ?auto_192174 ) ) ( not ( = ?auto_192170 ?auto_192175 ) ) ( not ( = ?auto_192171 ?auto_192172 ) ) ( not ( = ?auto_192171 ?auto_192173 ) ) ( not ( = ?auto_192171 ?auto_192174 ) ) ( not ( = ?auto_192171 ?auto_192175 ) ) ( not ( = ?auto_192172 ?auto_192173 ) ) ( not ( = ?auto_192172 ?auto_192174 ) ) ( not ( = ?auto_192172 ?auto_192175 ) ) ( not ( = ?auto_192173 ?auto_192174 ) ) ( not ( = ?auto_192173 ?auto_192175 ) ) ( not ( = ?auto_192174 ?auto_192175 ) ) ( ON ?auto_192173 ?auto_192174 ) ( ON ?auto_192172 ?auto_192173 ) ( ON ?auto_192171 ?auto_192172 ) ( CLEAR ?auto_192169 ) ( ON ?auto_192170 ?auto_192171 ) ( CLEAR ?auto_192170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_192168 ?auto_192169 ?auto_192170 )
      ( MAKE-7PILE ?auto_192168 ?auto_192169 ?auto_192170 ?auto_192171 ?auto_192172 ?auto_192173 ?auto_192174 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192198 - BLOCK
      ?auto_192199 - BLOCK
      ?auto_192200 - BLOCK
      ?auto_192201 - BLOCK
      ?auto_192202 - BLOCK
      ?auto_192203 - BLOCK
      ?auto_192204 - BLOCK
    )
    :vars
    (
      ?auto_192205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192204 ?auto_192205 ) ( ON-TABLE ?auto_192198 ) ( not ( = ?auto_192198 ?auto_192199 ) ) ( not ( = ?auto_192198 ?auto_192200 ) ) ( not ( = ?auto_192198 ?auto_192201 ) ) ( not ( = ?auto_192198 ?auto_192202 ) ) ( not ( = ?auto_192198 ?auto_192203 ) ) ( not ( = ?auto_192198 ?auto_192204 ) ) ( not ( = ?auto_192198 ?auto_192205 ) ) ( not ( = ?auto_192199 ?auto_192200 ) ) ( not ( = ?auto_192199 ?auto_192201 ) ) ( not ( = ?auto_192199 ?auto_192202 ) ) ( not ( = ?auto_192199 ?auto_192203 ) ) ( not ( = ?auto_192199 ?auto_192204 ) ) ( not ( = ?auto_192199 ?auto_192205 ) ) ( not ( = ?auto_192200 ?auto_192201 ) ) ( not ( = ?auto_192200 ?auto_192202 ) ) ( not ( = ?auto_192200 ?auto_192203 ) ) ( not ( = ?auto_192200 ?auto_192204 ) ) ( not ( = ?auto_192200 ?auto_192205 ) ) ( not ( = ?auto_192201 ?auto_192202 ) ) ( not ( = ?auto_192201 ?auto_192203 ) ) ( not ( = ?auto_192201 ?auto_192204 ) ) ( not ( = ?auto_192201 ?auto_192205 ) ) ( not ( = ?auto_192202 ?auto_192203 ) ) ( not ( = ?auto_192202 ?auto_192204 ) ) ( not ( = ?auto_192202 ?auto_192205 ) ) ( not ( = ?auto_192203 ?auto_192204 ) ) ( not ( = ?auto_192203 ?auto_192205 ) ) ( not ( = ?auto_192204 ?auto_192205 ) ) ( ON ?auto_192203 ?auto_192204 ) ( ON ?auto_192202 ?auto_192203 ) ( ON ?auto_192201 ?auto_192202 ) ( ON ?auto_192200 ?auto_192201 ) ( CLEAR ?auto_192198 ) ( ON ?auto_192199 ?auto_192200 ) ( CLEAR ?auto_192199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192198 ?auto_192199 )
      ( MAKE-7PILE ?auto_192198 ?auto_192199 ?auto_192200 ?auto_192201 ?auto_192202 ?auto_192203 ?auto_192204 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192228 - BLOCK
      ?auto_192229 - BLOCK
      ?auto_192230 - BLOCK
      ?auto_192231 - BLOCK
      ?auto_192232 - BLOCK
      ?auto_192233 - BLOCK
      ?auto_192234 - BLOCK
    )
    :vars
    (
      ?auto_192235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192234 ?auto_192235 ) ( not ( = ?auto_192228 ?auto_192229 ) ) ( not ( = ?auto_192228 ?auto_192230 ) ) ( not ( = ?auto_192228 ?auto_192231 ) ) ( not ( = ?auto_192228 ?auto_192232 ) ) ( not ( = ?auto_192228 ?auto_192233 ) ) ( not ( = ?auto_192228 ?auto_192234 ) ) ( not ( = ?auto_192228 ?auto_192235 ) ) ( not ( = ?auto_192229 ?auto_192230 ) ) ( not ( = ?auto_192229 ?auto_192231 ) ) ( not ( = ?auto_192229 ?auto_192232 ) ) ( not ( = ?auto_192229 ?auto_192233 ) ) ( not ( = ?auto_192229 ?auto_192234 ) ) ( not ( = ?auto_192229 ?auto_192235 ) ) ( not ( = ?auto_192230 ?auto_192231 ) ) ( not ( = ?auto_192230 ?auto_192232 ) ) ( not ( = ?auto_192230 ?auto_192233 ) ) ( not ( = ?auto_192230 ?auto_192234 ) ) ( not ( = ?auto_192230 ?auto_192235 ) ) ( not ( = ?auto_192231 ?auto_192232 ) ) ( not ( = ?auto_192231 ?auto_192233 ) ) ( not ( = ?auto_192231 ?auto_192234 ) ) ( not ( = ?auto_192231 ?auto_192235 ) ) ( not ( = ?auto_192232 ?auto_192233 ) ) ( not ( = ?auto_192232 ?auto_192234 ) ) ( not ( = ?auto_192232 ?auto_192235 ) ) ( not ( = ?auto_192233 ?auto_192234 ) ) ( not ( = ?auto_192233 ?auto_192235 ) ) ( not ( = ?auto_192234 ?auto_192235 ) ) ( ON ?auto_192233 ?auto_192234 ) ( ON ?auto_192232 ?auto_192233 ) ( ON ?auto_192231 ?auto_192232 ) ( ON ?auto_192230 ?auto_192231 ) ( ON ?auto_192229 ?auto_192230 ) ( ON ?auto_192228 ?auto_192229 ) ( CLEAR ?auto_192228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192228 )
      ( MAKE-7PILE ?auto_192228 ?auto_192229 ?auto_192230 ?auto_192231 ?auto_192232 ?auto_192233 ?auto_192234 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_192259 - BLOCK
      ?auto_192260 - BLOCK
      ?auto_192261 - BLOCK
      ?auto_192262 - BLOCK
      ?auto_192263 - BLOCK
      ?auto_192264 - BLOCK
      ?auto_192265 - BLOCK
      ?auto_192266 - BLOCK
    )
    :vars
    (
      ?auto_192267 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_192265 ) ( ON ?auto_192266 ?auto_192267 ) ( CLEAR ?auto_192266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192259 ) ( ON ?auto_192260 ?auto_192259 ) ( ON ?auto_192261 ?auto_192260 ) ( ON ?auto_192262 ?auto_192261 ) ( ON ?auto_192263 ?auto_192262 ) ( ON ?auto_192264 ?auto_192263 ) ( ON ?auto_192265 ?auto_192264 ) ( not ( = ?auto_192259 ?auto_192260 ) ) ( not ( = ?auto_192259 ?auto_192261 ) ) ( not ( = ?auto_192259 ?auto_192262 ) ) ( not ( = ?auto_192259 ?auto_192263 ) ) ( not ( = ?auto_192259 ?auto_192264 ) ) ( not ( = ?auto_192259 ?auto_192265 ) ) ( not ( = ?auto_192259 ?auto_192266 ) ) ( not ( = ?auto_192259 ?auto_192267 ) ) ( not ( = ?auto_192260 ?auto_192261 ) ) ( not ( = ?auto_192260 ?auto_192262 ) ) ( not ( = ?auto_192260 ?auto_192263 ) ) ( not ( = ?auto_192260 ?auto_192264 ) ) ( not ( = ?auto_192260 ?auto_192265 ) ) ( not ( = ?auto_192260 ?auto_192266 ) ) ( not ( = ?auto_192260 ?auto_192267 ) ) ( not ( = ?auto_192261 ?auto_192262 ) ) ( not ( = ?auto_192261 ?auto_192263 ) ) ( not ( = ?auto_192261 ?auto_192264 ) ) ( not ( = ?auto_192261 ?auto_192265 ) ) ( not ( = ?auto_192261 ?auto_192266 ) ) ( not ( = ?auto_192261 ?auto_192267 ) ) ( not ( = ?auto_192262 ?auto_192263 ) ) ( not ( = ?auto_192262 ?auto_192264 ) ) ( not ( = ?auto_192262 ?auto_192265 ) ) ( not ( = ?auto_192262 ?auto_192266 ) ) ( not ( = ?auto_192262 ?auto_192267 ) ) ( not ( = ?auto_192263 ?auto_192264 ) ) ( not ( = ?auto_192263 ?auto_192265 ) ) ( not ( = ?auto_192263 ?auto_192266 ) ) ( not ( = ?auto_192263 ?auto_192267 ) ) ( not ( = ?auto_192264 ?auto_192265 ) ) ( not ( = ?auto_192264 ?auto_192266 ) ) ( not ( = ?auto_192264 ?auto_192267 ) ) ( not ( = ?auto_192265 ?auto_192266 ) ) ( not ( = ?auto_192265 ?auto_192267 ) ) ( not ( = ?auto_192266 ?auto_192267 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192266 ?auto_192267 )
      ( !STACK ?auto_192266 ?auto_192265 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_192293 - BLOCK
      ?auto_192294 - BLOCK
      ?auto_192295 - BLOCK
      ?auto_192296 - BLOCK
      ?auto_192297 - BLOCK
      ?auto_192298 - BLOCK
      ?auto_192299 - BLOCK
      ?auto_192300 - BLOCK
    )
    :vars
    (
      ?auto_192301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192300 ?auto_192301 ) ( ON-TABLE ?auto_192293 ) ( ON ?auto_192294 ?auto_192293 ) ( ON ?auto_192295 ?auto_192294 ) ( ON ?auto_192296 ?auto_192295 ) ( ON ?auto_192297 ?auto_192296 ) ( ON ?auto_192298 ?auto_192297 ) ( not ( = ?auto_192293 ?auto_192294 ) ) ( not ( = ?auto_192293 ?auto_192295 ) ) ( not ( = ?auto_192293 ?auto_192296 ) ) ( not ( = ?auto_192293 ?auto_192297 ) ) ( not ( = ?auto_192293 ?auto_192298 ) ) ( not ( = ?auto_192293 ?auto_192299 ) ) ( not ( = ?auto_192293 ?auto_192300 ) ) ( not ( = ?auto_192293 ?auto_192301 ) ) ( not ( = ?auto_192294 ?auto_192295 ) ) ( not ( = ?auto_192294 ?auto_192296 ) ) ( not ( = ?auto_192294 ?auto_192297 ) ) ( not ( = ?auto_192294 ?auto_192298 ) ) ( not ( = ?auto_192294 ?auto_192299 ) ) ( not ( = ?auto_192294 ?auto_192300 ) ) ( not ( = ?auto_192294 ?auto_192301 ) ) ( not ( = ?auto_192295 ?auto_192296 ) ) ( not ( = ?auto_192295 ?auto_192297 ) ) ( not ( = ?auto_192295 ?auto_192298 ) ) ( not ( = ?auto_192295 ?auto_192299 ) ) ( not ( = ?auto_192295 ?auto_192300 ) ) ( not ( = ?auto_192295 ?auto_192301 ) ) ( not ( = ?auto_192296 ?auto_192297 ) ) ( not ( = ?auto_192296 ?auto_192298 ) ) ( not ( = ?auto_192296 ?auto_192299 ) ) ( not ( = ?auto_192296 ?auto_192300 ) ) ( not ( = ?auto_192296 ?auto_192301 ) ) ( not ( = ?auto_192297 ?auto_192298 ) ) ( not ( = ?auto_192297 ?auto_192299 ) ) ( not ( = ?auto_192297 ?auto_192300 ) ) ( not ( = ?auto_192297 ?auto_192301 ) ) ( not ( = ?auto_192298 ?auto_192299 ) ) ( not ( = ?auto_192298 ?auto_192300 ) ) ( not ( = ?auto_192298 ?auto_192301 ) ) ( not ( = ?auto_192299 ?auto_192300 ) ) ( not ( = ?auto_192299 ?auto_192301 ) ) ( not ( = ?auto_192300 ?auto_192301 ) ) ( CLEAR ?auto_192298 ) ( ON ?auto_192299 ?auto_192300 ) ( CLEAR ?auto_192299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_192293 ?auto_192294 ?auto_192295 ?auto_192296 ?auto_192297 ?auto_192298 ?auto_192299 )
      ( MAKE-8PILE ?auto_192293 ?auto_192294 ?auto_192295 ?auto_192296 ?auto_192297 ?auto_192298 ?auto_192299 ?auto_192300 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_192327 - BLOCK
      ?auto_192328 - BLOCK
      ?auto_192329 - BLOCK
      ?auto_192330 - BLOCK
      ?auto_192331 - BLOCK
      ?auto_192332 - BLOCK
      ?auto_192333 - BLOCK
      ?auto_192334 - BLOCK
    )
    :vars
    (
      ?auto_192335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192334 ?auto_192335 ) ( ON-TABLE ?auto_192327 ) ( ON ?auto_192328 ?auto_192327 ) ( ON ?auto_192329 ?auto_192328 ) ( ON ?auto_192330 ?auto_192329 ) ( ON ?auto_192331 ?auto_192330 ) ( not ( = ?auto_192327 ?auto_192328 ) ) ( not ( = ?auto_192327 ?auto_192329 ) ) ( not ( = ?auto_192327 ?auto_192330 ) ) ( not ( = ?auto_192327 ?auto_192331 ) ) ( not ( = ?auto_192327 ?auto_192332 ) ) ( not ( = ?auto_192327 ?auto_192333 ) ) ( not ( = ?auto_192327 ?auto_192334 ) ) ( not ( = ?auto_192327 ?auto_192335 ) ) ( not ( = ?auto_192328 ?auto_192329 ) ) ( not ( = ?auto_192328 ?auto_192330 ) ) ( not ( = ?auto_192328 ?auto_192331 ) ) ( not ( = ?auto_192328 ?auto_192332 ) ) ( not ( = ?auto_192328 ?auto_192333 ) ) ( not ( = ?auto_192328 ?auto_192334 ) ) ( not ( = ?auto_192328 ?auto_192335 ) ) ( not ( = ?auto_192329 ?auto_192330 ) ) ( not ( = ?auto_192329 ?auto_192331 ) ) ( not ( = ?auto_192329 ?auto_192332 ) ) ( not ( = ?auto_192329 ?auto_192333 ) ) ( not ( = ?auto_192329 ?auto_192334 ) ) ( not ( = ?auto_192329 ?auto_192335 ) ) ( not ( = ?auto_192330 ?auto_192331 ) ) ( not ( = ?auto_192330 ?auto_192332 ) ) ( not ( = ?auto_192330 ?auto_192333 ) ) ( not ( = ?auto_192330 ?auto_192334 ) ) ( not ( = ?auto_192330 ?auto_192335 ) ) ( not ( = ?auto_192331 ?auto_192332 ) ) ( not ( = ?auto_192331 ?auto_192333 ) ) ( not ( = ?auto_192331 ?auto_192334 ) ) ( not ( = ?auto_192331 ?auto_192335 ) ) ( not ( = ?auto_192332 ?auto_192333 ) ) ( not ( = ?auto_192332 ?auto_192334 ) ) ( not ( = ?auto_192332 ?auto_192335 ) ) ( not ( = ?auto_192333 ?auto_192334 ) ) ( not ( = ?auto_192333 ?auto_192335 ) ) ( not ( = ?auto_192334 ?auto_192335 ) ) ( ON ?auto_192333 ?auto_192334 ) ( CLEAR ?auto_192331 ) ( ON ?auto_192332 ?auto_192333 ) ( CLEAR ?auto_192332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_192327 ?auto_192328 ?auto_192329 ?auto_192330 ?auto_192331 ?auto_192332 )
      ( MAKE-8PILE ?auto_192327 ?auto_192328 ?auto_192329 ?auto_192330 ?auto_192331 ?auto_192332 ?auto_192333 ?auto_192334 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_192361 - BLOCK
      ?auto_192362 - BLOCK
      ?auto_192363 - BLOCK
      ?auto_192364 - BLOCK
      ?auto_192365 - BLOCK
      ?auto_192366 - BLOCK
      ?auto_192367 - BLOCK
      ?auto_192368 - BLOCK
    )
    :vars
    (
      ?auto_192369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192368 ?auto_192369 ) ( ON-TABLE ?auto_192361 ) ( ON ?auto_192362 ?auto_192361 ) ( ON ?auto_192363 ?auto_192362 ) ( ON ?auto_192364 ?auto_192363 ) ( not ( = ?auto_192361 ?auto_192362 ) ) ( not ( = ?auto_192361 ?auto_192363 ) ) ( not ( = ?auto_192361 ?auto_192364 ) ) ( not ( = ?auto_192361 ?auto_192365 ) ) ( not ( = ?auto_192361 ?auto_192366 ) ) ( not ( = ?auto_192361 ?auto_192367 ) ) ( not ( = ?auto_192361 ?auto_192368 ) ) ( not ( = ?auto_192361 ?auto_192369 ) ) ( not ( = ?auto_192362 ?auto_192363 ) ) ( not ( = ?auto_192362 ?auto_192364 ) ) ( not ( = ?auto_192362 ?auto_192365 ) ) ( not ( = ?auto_192362 ?auto_192366 ) ) ( not ( = ?auto_192362 ?auto_192367 ) ) ( not ( = ?auto_192362 ?auto_192368 ) ) ( not ( = ?auto_192362 ?auto_192369 ) ) ( not ( = ?auto_192363 ?auto_192364 ) ) ( not ( = ?auto_192363 ?auto_192365 ) ) ( not ( = ?auto_192363 ?auto_192366 ) ) ( not ( = ?auto_192363 ?auto_192367 ) ) ( not ( = ?auto_192363 ?auto_192368 ) ) ( not ( = ?auto_192363 ?auto_192369 ) ) ( not ( = ?auto_192364 ?auto_192365 ) ) ( not ( = ?auto_192364 ?auto_192366 ) ) ( not ( = ?auto_192364 ?auto_192367 ) ) ( not ( = ?auto_192364 ?auto_192368 ) ) ( not ( = ?auto_192364 ?auto_192369 ) ) ( not ( = ?auto_192365 ?auto_192366 ) ) ( not ( = ?auto_192365 ?auto_192367 ) ) ( not ( = ?auto_192365 ?auto_192368 ) ) ( not ( = ?auto_192365 ?auto_192369 ) ) ( not ( = ?auto_192366 ?auto_192367 ) ) ( not ( = ?auto_192366 ?auto_192368 ) ) ( not ( = ?auto_192366 ?auto_192369 ) ) ( not ( = ?auto_192367 ?auto_192368 ) ) ( not ( = ?auto_192367 ?auto_192369 ) ) ( not ( = ?auto_192368 ?auto_192369 ) ) ( ON ?auto_192367 ?auto_192368 ) ( ON ?auto_192366 ?auto_192367 ) ( CLEAR ?auto_192364 ) ( ON ?auto_192365 ?auto_192366 ) ( CLEAR ?auto_192365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_192361 ?auto_192362 ?auto_192363 ?auto_192364 ?auto_192365 )
      ( MAKE-8PILE ?auto_192361 ?auto_192362 ?auto_192363 ?auto_192364 ?auto_192365 ?auto_192366 ?auto_192367 ?auto_192368 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_192395 - BLOCK
      ?auto_192396 - BLOCK
      ?auto_192397 - BLOCK
      ?auto_192398 - BLOCK
      ?auto_192399 - BLOCK
      ?auto_192400 - BLOCK
      ?auto_192401 - BLOCK
      ?auto_192402 - BLOCK
    )
    :vars
    (
      ?auto_192403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192402 ?auto_192403 ) ( ON-TABLE ?auto_192395 ) ( ON ?auto_192396 ?auto_192395 ) ( ON ?auto_192397 ?auto_192396 ) ( not ( = ?auto_192395 ?auto_192396 ) ) ( not ( = ?auto_192395 ?auto_192397 ) ) ( not ( = ?auto_192395 ?auto_192398 ) ) ( not ( = ?auto_192395 ?auto_192399 ) ) ( not ( = ?auto_192395 ?auto_192400 ) ) ( not ( = ?auto_192395 ?auto_192401 ) ) ( not ( = ?auto_192395 ?auto_192402 ) ) ( not ( = ?auto_192395 ?auto_192403 ) ) ( not ( = ?auto_192396 ?auto_192397 ) ) ( not ( = ?auto_192396 ?auto_192398 ) ) ( not ( = ?auto_192396 ?auto_192399 ) ) ( not ( = ?auto_192396 ?auto_192400 ) ) ( not ( = ?auto_192396 ?auto_192401 ) ) ( not ( = ?auto_192396 ?auto_192402 ) ) ( not ( = ?auto_192396 ?auto_192403 ) ) ( not ( = ?auto_192397 ?auto_192398 ) ) ( not ( = ?auto_192397 ?auto_192399 ) ) ( not ( = ?auto_192397 ?auto_192400 ) ) ( not ( = ?auto_192397 ?auto_192401 ) ) ( not ( = ?auto_192397 ?auto_192402 ) ) ( not ( = ?auto_192397 ?auto_192403 ) ) ( not ( = ?auto_192398 ?auto_192399 ) ) ( not ( = ?auto_192398 ?auto_192400 ) ) ( not ( = ?auto_192398 ?auto_192401 ) ) ( not ( = ?auto_192398 ?auto_192402 ) ) ( not ( = ?auto_192398 ?auto_192403 ) ) ( not ( = ?auto_192399 ?auto_192400 ) ) ( not ( = ?auto_192399 ?auto_192401 ) ) ( not ( = ?auto_192399 ?auto_192402 ) ) ( not ( = ?auto_192399 ?auto_192403 ) ) ( not ( = ?auto_192400 ?auto_192401 ) ) ( not ( = ?auto_192400 ?auto_192402 ) ) ( not ( = ?auto_192400 ?auto_192403 ) ) ( not ( = ?auto_192401 ?auto_192402 ) ) ( not ( = ?auto_192401 ?auto_192403 ) ) ( not ( = ?auto_192402 ?auto_192403 ) ) ( ON ?auto_192401 ?auto_192402 ) ( ON ?auto_192400 ?auto_192401 ) ( ON ?auto_192399 ?auto_192400 ) ( CLEAR ?auto_192397 ) ( ON ?auto_192398 ?auto_192399 ) ( CLEAR ?auto_192398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_192395 ?auto_192396 ?auto_192397 ?auto_192398 )
      ( MAKE-8PILE ?auto_192395 ?auto_192396 ?auto_192397 ?auto_192398 ?auto_192399 ?auto_192400 ?auto_192401 ?auto_192402 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_192429 - BLOCK
      ?auto_192430 - BLOCK
      ?auto_192431 - BLOCK
      ?auto_192432 - BLOCK
      ?auto_192433 - BLOCK
      ?auto_192434 - BLOCK
      ?auto_192435 - BLOCK
      ?auto_192436 - BLOCK
    )
    :vars
    (
      ?auto_192437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192436 ?auto_192437 ) ( ON-TABLE ?auto_192429 ) ( ON ?auto_192430 ?auto_192429 ) ( not ( = ?auto_192429 ?auto_192430 ) ) ( not ( = ?auto_192429 ?auto_192431 ) ) ( not ( = ?auto_192429 ?auto_192432 ) ) ( not ( = ?auto_192429 ?auto_192433 ) ) ( not ( = ?auto_192429 ?auto_192434 ) ) ( not ( = ?auto_192429 ?auto_192435 ) ) ( not ( = ?auto_192429 ?auto_192436 ) ) ( not ( = ?auto_192429 ?auto_192437 ) ) ( not ( = ?auto_192430 ?auto_192431 ) ) ( not ( = ?auto_192430 ?auto_192432 ) ) ( not ( = ?auto_192430 ?auto_192433 ) ) ( not ( = ?auto_192430 ?auto_192434 ) ) ( not ( = ?auto_192430 ?auto_192435 ) ) ( not ( = ?auto_192430 ?auto_192436 ) ) ( not ( = ?auto_192430 ?auto_192437 ) ) ( not ( = ?auto_192431 ?auto_192432 ) ) ( not ( = ?auto_192431 ?auto_192433 ) ) ( not ( = ?auto_192431 ?auto_192434 ) ) ( not ( = ?auto_192431 ?auto_192435 ) ) ( not ( = ?auto_192431 ?auto_192436 ) ) ( not ( = ?auto_192431 ?auto_192437 ) ) ( not ( = ?auto_192432 ?auto_192433 ) ) ( not ( = ?auto_192432 ?auto_192434 ) ) ( not ( = ?auto_192432 ?auto_192435 ) ) ( not ( = ?auto_192432 ?auto_192436 ) ) ( not ( = ?auto_192432 ?auto_192437 ) ) ( not ( = ?auto_192433 ?auto_192434 ) ) ( not ( = ?auto_192433 ?auto_192435 ) ) ( not ( = ?auto_192433 ?auto_192436 ) ) ( not ( = ?auto_192433 ?auto_192437 ) ) ( not ( = ?auto_192434 ?auto_192435 ) ) ( not ( = ?auto_192434 ?auto_192436 ) ) ( not ( = ?auto_192434 ?auto_192437 ) ) ( not ( = ?auto_192435 ?auto_192436 ) ) ( not ( = ?auto_192435 ?auto_192437 ) ) ( not ( = ?auto_192436 ?auto_192437 ) ) ( ON ?auto_192435 ?auto_192436 ) ( ON ?auto_192434 ?auto_192435 ) ( ON ?auto_192433 ?auto_192434 ) ( ON ?auto_192432 ?auto_192433 ) ( CLEAR ?auto_192430 ) ( ON ?auto_192431 ?auto_192432 ) ( CLEAR ?auto_192431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_192429 ?auto_192430 ?auto_192431 )
      ( MAKE-8PILE ?auto_192429 ?auto_192430 ?auto_192431 ?auto_192432 ?auto_192433 ?auto_192434 ?auto_192435 ?auto_192436 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_192463 - BLOCK
      ?auto_192464 - BLOCK
      ?auto_192465 - BLOCK
      ?auto_192466 - BLOCK
      ?auto_192467 - BLOCK
      ?auto_192468 - BLOCK
      ?auto_192469 - BLOCK
      ?auto_192470 - BLOCK
    )
    :vars
    (
      ?auto_192471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192470 ?auto_192471 ) ( ON-TABLE ?auto_192463 ) ( not ( = ?auto_192463 ?auto_192464 ) ) ( not ( = ?auto_192463 ?auto_192465 ) ) ( not ( = ?auto_192463 ?auto_192466 ) ) ( not ( = ?auto_192463 ?auto_192467 ) ) ( not ( = ?auto_192463 ?auto_192468 ) ) ( not ( = ?auto_192463 ?auto_192469 ) ) ( not ( = ?auto_192463 ?auto_192470 ) ) ( not ( = ?auto_192463 ?auto_192471 ) ) ( not ( = ?auto_192464 ?auto_192465 ) ) ( not ( = ?auto_192464 ?auto_192466 ) ) ( not ( = ?auto_192464 ?auto_192467 ) ) ( not ( = ?auto_192464 ?auto_192468 ) ) ( not ( = ?auto_192464 ?auto_192469 ) ) ( not ( = ?auto_192464 ?auto_192470 ) ) ( not ( = ?auto_192464 ?auto_192471 ) ) ( not ( = ?auto_192465 ?auto_192466 ) ) ( not ( = ?auto_192465 ?auto_192467 ) ) ( not ( = ?auto_192465 ?auto_192468 ) ) ( not ( = ?auto_192465 ?auto_192469 ) ) ( not ( = ?auto_192465 ?auto_192470 ) ) ( not ( = ?auto_192465 ?auto_192471 ) ) ( not ( = ?auto_192466 ?auto_192467 ) ) ( not ( = ?auto_192466 ?auto_192468 ) ) ( not ( = ?auto_192466 ?auto_192469 ) ) ( not ( = ?auto_192466 ?auto_192470 ) ) ( not ( = ?auto_192466 ?auto_192471 ) ) ( not ( = ?auto_192467 ?auto_192468 ) ) ( not ( = ?auto_192467 ?auto_192469 ) ) ( not ( = ?auto_192467 ?auto_192470 ) ) ( not ( = ?auto_192467 ?auto_192471 ) ) ( not ( = ?auto_192468 ?auto_192469 ) ) ( not ( = ?auto_192468 ?auto_192470 ) ) ( not ( = ?auto_192468 ?auto_192471 ) ) ( not ( = ?auto_192469 ?auto_192470 ) ) ( not ( = ?auto_192469 ?auto_192471 ) ) ( not ( = ?auto_192470 ?auto_192471 ) ) ( ON ?auto_192469 ?auto_192470 ) ( ON ?auto_192468 ?auto_192469 ) ( ON ?auto_192467 ?auto_192468 ) ( ON ?auto_192466 ?auto_192467 ) ( ON ?auto_192465 ?auto_192466 ) ( CLEAR ?auto_192463 ) ( ON ?auto_192464 ?auto_192465 ) ( CLEAR ?auto_192464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192463 ?auto_192464 )
      ( MAKE-8PILE ?auto_192463 ?auto_192464 ?auto_192465 ?auto_192466 ?auto_192467 ?auto_192468 ?auto_192469 ?auto_192470 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_192497 - BLOCK
      ?auto_192498 - BLOCK
      ?auto_192499 - BLOCK
      ?auto_192500 - BLOCK
      ?auto_192501 - BLOCK
      ?auto_192502 - BLOCK
      ?auto_192503 - BLOCK
      ?auto_192504 - BLOCK
    )
    :vars
    (
      ?auto_192505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192504 ?auto_192505 ) ( not ( = ?auto_192497 ?auto_192498 ) ) ( not ( = ?auto_192497 ?auto_192499 ) ) ( not ( = ?auto_192497 ?auto_192500 ) ) ( not ( = ?auto_192497 ?auto_192501 ) ) ( not ( = ?auto_192497 ?auto_192502 ) ) ( not ( = ?auto_192497 ?auto_192503 ) ) ( not ( = ?auto_192497 ?auto_192504 ) ) ( not ( = ?auto_192497 ?auto_192505 ) ) ( not ( = ?auto_192498 ?auto_192499 ) ) ( not ( = ?auto_192498 ?auto_192500 ) ) ( not ( = ?auto_192498 ?auto_192501 ) ) ( not ( = ?auto_192498 ?auto_192502 ) ) ( not ( = ?auto_192498 ?auto_192503 ) ) ( not ( = ?auto_192498 ?auto_192504 ) ) ( not ( = ?auto_192498 ?auto_192505 ) ) ( not ( = ?auto_192499 ?auto_192500 ) ) ( not ( = ?auto_192499 ?auto_192501 ) ) ( not ( = ?auto_192499 ?auto_192502 ) ) ( not ( = ?auto_192499 ?auto_192503 ) ) ( not ( = ?auto_192499 ?auto_192504 ) ) ( not ( = ?auto_192499 ?auto_192505 ) ) ( not ( = ?auto_192500 ?auto_192501 ) ) ( not ( = ?auto_192500 ?auto_192502 ) ) ( not ( = ?auto_192500 ?auto_192503 ) ) ( not ( = ?auto_192500 ?auto_192504 ) ) ( not ( = ?auto_192500 ?auto_192505 ) ) ( not ( = ?auto_192501 ?auto_192502 ) ) ( not ( = ?auto_192501 ?auto_192503 ) ) ( not ( = ?auto_192501 ?auto_192504 ) ) ( not ( = ?auto_192501 ?auto_192505 ) ) ( not ( = ?auto_192502 ?auto_192503 ) ) ( not ( = ?auto_192502 ?auto_192504 ) ) ( not ( = ?auto_192502 ?auto_192505 ) ) ( not ( = ?auto_192503 ?auto_192504 ) ) ( not ( = ?auto_192503 ?auto_192505 ) ) ( not ( = ?auto_192504 ?auto_192505 ) ) ( ON ?auto_192503 ?auto_192504 ) ( ON ?auto_192502 ?auto_192503 ) ( ON ?auto_192501 ?auto_192502 ) ( ON ?auto_192500 ?auto_192501 ) ( ON ?auto_192499 ?auto_192500 ) ( ON ?auto_192498 ?auto_192499 ) ( ON ?auto_192497 ?auto_192498 ) ( CLEAR ?auto_192497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192497 )
      ( MAKE-8PILE ?auto_192497 ?auto_192498 ?auto_192499 ?auto_192500 ?auto_192501 ?auto_192502 ?auto_192503 ?auto_192504 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_192532 - BLOCK
      ?auto_192533 - BLOCK
      ?auto_192534 - BLOCK
      ?auto_192535 - BLOCK
      ?auto_192536 - BLOCK
      ?auto_192537 - BLOCK
      ?auto_192538 - BLOCK
      ?auto_192539 - BLOCK
      ?auto_192540 - BLOCK
    )
    :vars
    (
      ?auto_192541 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_192539 ) ( ON ?auto_192540 ?auto_192541 ) ( CLEAR ?auto_192540 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192532 ) ( ON ?auto_192533 ?auto_192532 ) ( ON ?auto_192534 ?auto_192533 ) ( ON ?auto_192535 ?auto_192534 ) ( ON ?auto_192536 ?auto_192535 ) ( ON ?auto_192537 ?auto_192536 ) ( ON ?auto_192538 ?auto_192537 ) ( ON ?auto_192539 ?auto_192538 ) ( not ( = ?auto_192532 ?auto_192533 ) ) ( not ( = ?auto_192532 ?auto_192534 ) ) ( not ( = ?auto_192532 ?auto_192535 ) ) ( not ( = ?auto_192532 ?auto_192536 ) ) ( not ( = ?auto_192532 ?auto_192537 ) ) ( not ( = ?auto_192532 ?auto_192538 ) ) ( not ( = ?auto_192532 ?auto_192539 ) ) ( not ( = ?auto_192532 ?auto_192540 ) ) ( not ( = ?auto_192532 ?auto_192541 ) ) ( not ( = ?auto_192533 ?auto_192534 ) ) ( not ( = ?auto_192533 ?auto_192535 ) ) ( not ( = ?auto_192533 ?auto_192536 ) ) ( not ( = ?auto_192533 ?auto_192537 ) ) ( not ( = ?auto_192533 ?auto_192538 ) ) ( not ( = ?auto_192533 ?auto_192539 ) ) ( not ( = ?auto_192533 ?auto_192540 ) ) ( not ( = ?auto_192533 ?auto_192541 ) ) ( not ( = ?auto_192534 ?auto_192535 ) ) ( not ( = ?auto_192534 ?auto_192536 ) ) ( not ( = ?auto_192534 ?auto_192537 ) ) ( not ( = ?auto_192534 ?auto_192538 ) ) ( not ( = ?auto_192534 ?auto_192539 ) ) ( not ( = ?auto_192534 ?auto_192540 ) ) ( not ( = ?auto_192534 ?auto_192541 ) ) ( not ( = ?auto_192535 ?auto_192536 ) ) ( not ( = ?auto_192535 ?auto_192537 ) ) ( not ( = ?auto_192535 ?auto_192538 ) ) ( not ( = ?auto_192535 ?auto_192539 ) ) ( not ( = ?auto_192535 ?auto_192540 ) ) ( not ( = ?auto_192535 ?auto_192541 ) ) ( not ( = ?auto_192536 ?auto_192537 ) ) ( not ( = ?auto_192536 ?auto_192538 ) ) ( not ( = ?auto_192536 ?auto_192539 ) ) ( not ( = ?auto_192536 ?auto_192540 ) ) ( not ( = ?auto_192536 ?auto_192541 ) ) ( not ( = ?auto_192537 ?auto_192538 ) ) ( not ( = ?auto_192537 ?auto_192539 ) ) ( not ( = ?auto_192537 ?auto_192540 ) ) ( not ( = ?auto_192537 ?auto_192541 ) ) ( not ( = ?auto_192538 ?auto_192539 ) ) ( not ( = ?auto_192538 ?auto_192540 ) ) ( not ( = ?auto_192538 ?auto_192541 ) ) ( not ( = ?auto_192539 ?auto_192540 ) ) ( not ( = ?auto_192539 ?auto_192541 ) ) ( not ( = ?auto_192540 ?auto_192541 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192540 ?auto_192541 )
      ( !STACK ?auto_192540 ?auto_192539 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_192570 - BLOCK
      ?auto_192571 - BLOCK
      ?auto_192572 - BLOCK
      ?auto_192573 - BLOCK
      ?auto_192574 - BLOCK
      ?auto_192575 - BLOCK
      ?auto_192576 - BLOCK
      ?auto_192577 - BLOCK
      ?auto_192578 - BLOCK
    )
    :vars
    (
      ?auto_192579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192578 ?auto_192579 ) ( ON-TABLE ?auto_192570 ) ( ON ?auto_192571 ?auto_192570 ) ( ON ?auto_192572 ?auto_192571 ) ( ON ?auto_192573 ?auto_192572 ) ( ON ?auto_192574 ?auto_192573 ) ( ON ?auto_192575 ?auto_192574 ) ( ON ?auto_192576 ?auto_192575 ) ( not ( = ?auto_192570 ?auto_192571 ) ) ( not ( = ?auto_192570 ?auto_192572 ) ) ( not ( = ?auto_192570 ?auto_192573 ) ) ( not ( = ?auto_192570 ?auto_192574 ) ) ( not ( = ?auto_192570 ?auto_192575 ) ) ( not ( = ?auto_192570 ?auto_192576 ) ) ( not ( = ?auto_192570 ?auto_192577 ) ) ( not ( = ?auto_192570 ?auto_192578 ) ) ( not ( = ?auto_192570 ?auto_192579 ) ) ( not ( = ?auto_192571 ?auto_192572 ) ) ( not ( = ?auto_192571 ?auto_192573 ) ) ( not ( = ?auto_192571 ?auto_192574 ) ) ( not ( = ?auto_192571 ?auto_192575 ) ) ( not ( = ?auto_192571 ?auto_192576 ) ) ( not ( = ?auto_192571 ?auto_192577 ) ) ( not ( = ?auto_192571 ?auto_192578 ) ) ( not ( = ?auto_192571 ?auto_192579 ) ) ( not ( = ?auto_192572 ?auto_192573 ) ) ( not ( = ?auto_192572 ?auto_192574 ) ) ( not ( = ?auto_192572 ?auto_192575 ) ) ( not ( = ?auto_192572 ?auto_192576 ) ) ( not ( = ?auto_192572 ?auto_192577 ) ) ( not ( = ?auto_192572 ?auto_192578 ) ) ( not ( = ?auto_192572 ?auto_192579 ) ) ( not ( = ?auto_192573 ?auto_192574 ) ) ( not ( = ?auto_192573 ?auto_192575 ) ) ( not ( = ?auto_192573 ?auto_192576 ) ) ( not ( = ?auto_192573 ?auto_192577 ) ) ( not ( = ?auto_192573 ?auto_192578 ) ) ( not ( = ?auto_192573 ?auto_192579 ) ) ( not ( = ?auto_192574 ?auto_192575 ) ) ( not ( = ?auto_192574 ?auto_192576 ) ) ( not ( = ?auto_192574 ?auto_192577 ) ) ( not ( = ?auto_192574 ?auto_192578 ) ) ( not ( = ?auto_192574 ?auto_192579 ) ) ( not ( = ?auto_192575 ?auto_192576 ) ) ( not ( = ?auto_192575 ?auto_192577 ) ) ( not ( = ?auto_192575 ?auto_192578 ) ) ( not ( = ?auto_192575 ?auto_192579 ) ) ( not ( = ?auto_192576 ?auto_192577 ) ) ( not ( = ?auto_192576 ?auto_192578 ) ) ( not ( = ?auto_192576 ?auto_192579 ) ) ( not ( = ?auto_192577 ?auto_192578 ) ) ( not ( = ?auto_192577 ?auto_192579 ) ) ( not ( = ?auto_192578 ?auto_192579 ) ) ( CLEAR ?auto_192576 ) ( ON ?auto_192577 ?auto_192578 ) ( CLEAR ?auto_192577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192570 ?auto_192571 ?auto_192572 ?auto_192573 ?auto_192574 ?auto_192575 ?auto_192576 ?auto_192577 )
      ( MAKE-9PILE ?auto_192570 ?auto_192571 ?auto_192572 ?auto_192573 ?auto_192574 ?auto_192575 ?auto_192576 ?auto_192577 ?auto_192578 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_192608 - BLOCK
      ?auto_192609 - BLOCK
      ?auto_192610 - BLOCK
      ?auto_192611 - BLOCK
      ?auto_192612 - BLOCK
      ?auto_192613 - BLOCK
      ?auto_192614 - BLOCK
      ?auto_192615 - BLOCK
      ?auto_192616 - BLOCK
    )
    :vars
    (
      ?auto_192617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192616 ?auto_192617 ) ( ON-TABLE ?auto_192608 ) ( ON ?auto_192609 ?auto_192608 ) ( ON ?auto_192610 ?auto_192609 ) ( ON ?auto_192611 ?auto_192610 ) ( ON ?auto_192612 ?auto_192611 ) ( ON ?auto_192613 ?auto_192612 ) ( not ( = ?auto_192608 ?auto_192609 ) ) ( not ( = ?auto_192608 ?auto_192610 ) ) ( not ( = ?auto_192608 ?auto_192611 ) ) ( not ( = ?auto_192608 ?auto_192612 ) ) ( not ( = ?auto_192608 ?auto_192613 ) ) ( not ( = ?auto_192608 ?auto_192614 ) ) ( not ( = ?auto_192608 ?auto_192615 ) ) ( not ( = ?auto_192608 ?auto_192616 ) ) ( not ( = ?auto_192608 ?auto_192617 ) ) ( not ( = ?auto_192609 ?auto_192610 ) ) ( not ( = ?auto_192609 ?auto_192611 ) ) ( not ( = ?auto_192609 ?auto_192612 ) ) ( not ( = ?auto_192609 ?auto_192613 ) ) ( not ( = ?auto_192609 ?auto_192614 ) ) ( not ( = ?auto_192609 ?auto_192615 ) ) ( not ( = ?auto_192609 ?auto_192616 ) ) ( not ( = ?auto_192609 ?auto_192617 ) ) ( not ( = ?auto_192610 ?auto_192611 ) ) ( not ( = ?auto_192610 ?auto_192612 ) ) ( not ( = ?auto_192610 ?auto_192613 ) ) ( not ( = ?auto_192610 ?auto_192614 ) ) ( not ( = ?auto_192610 ?auto_192615 ) ) ( not ( = ?auto_192610 ?auto_192616 ) ) ( not ( = ?auto_192610 ?auto_192617 ) ) ( not ( = ?auto_192611 ?auto_192612 ) ) ( not ( = ?auto_192611 ?auto_192613 ) ) ( not ( = ?auto_192611 ?auto_192614 ) ) ( not ( = ?auto_192611 ?auto_192615 ) ) ( not ( = ?auto_192611 ?auto_192616 ) ) ( not ( = ?auto_192611 ?auto_192617 ) ) ( not ( = ?auto_192612 ?auto_192613 ) ) ( not ( = ?auto_192612 ?auto_192614 ) ) ( not ( = ?auto_192612 ?auto_192615 ) ) ( not ( = ?auto_192612 ?auto_192616 ) ) ( not ( = ?auto_192612 ?auto_192617 ) ) ( not ( = ?auto_192613 ?auto_192614 ) ) ( not ( = ?auto_192613 ?auto_192615 ) ) ( not ( = ?auto_192613 ?auto_192616 ) ) ( not ( = ?auto_192613 ?auto_192617 ) ) ( not ( = ?auto_192614 ?auto_192615 ) ) ( not ( = ?auto_192614 ?auto_192616 ) ) ( not ( = ?auto_192614 ?auto_192617 ) ) ( not ( = ?auto_192615 ?auto_192616 ) ) ( not ( = ?auto_192615 ?auto_192617 ) ) ( not ( = ?auto_192616 ?auto_192617 ) ) ( ON ?auto_192615 ?auto_192616 ) ( CLEAR ?auto_192613 ) ( ON ?auto_192614 ?auto_192615 ) ( CLEAR ?auto_192614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_192608 ?auto_192609 ?auto_192610 ?auto_192611 ?auto_192612 ?auto_192613 ?auto_192614 )
      ( MAKE-9PILE ?auto_192608 ?auto_192609 ?auto_192610 ?auto_192611 ?auto_192612 ?auto_192613 ?auto_192614 ?auto_192615 ?auto_192616 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_192646 - BLOCK
      ?auto_192647 - BLOCK
      ?auto_192648 - BLOCK
      ?auto_192649 - BLOCK
      ?auto_192650 - BLOCK
      ?auto_192651 - BLOCK
      ?auto_192652 - BLOCK
      ?auto_192653 - BLOCK
      ?auto_192654 - BLOCK
    )
    :vars
    (
      ?auto_192655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192654 ?auto_192655 ) ( ON-TABLE ?auto_192646 ) ( ON ?auto_192647 ?auto_192646 ) ( ON ?auto_192648 ?auto_192647 ) ( ON ?auto_192649 ?auto_192648 ) ( ON ?auto_192650 ?auto_192649 ) ( not ( = ?auto_192646 ?auto_192647 ) ) ( not ( = ?auto_192646 ?auto_192648 ) ) ( not ( = ?auto_192646 ?auto_192649 ) ) ( not ( = ?auto_192646 ?auto_192650 ) ) ( not ( = ?auto_192646 ?auto_192651 ) ) ( not ( = ?auto_192646 ?auto_192652 ) ) ( not ( = ?auto_192646 ?auto_192653 ) ) ( not ( = ?auto_192646 ?auto_192654 ) ) ( not ( = ?auto_192646 ?auto_192655 ) ) ( not ( = ?auto_192647 ?auto_192648 ) ) ( not ( = ?auto_192647 ?auto_192649 ) ) ( not ( = ?auto_192647 ?auto_192650 ) ) ( not ( = ?auto_192647 ?auto_192651 ) ) ( not ( = ?auto_192647 ?auto_192652 ) ) ( not ( = ?auto_192647 ?auto_192653 ) ) ( not ( = ?auto_192647 ?auto_192654 ) ) ( not ( = ?auto_192647 ?auto_192655 ) ) ( not ( = ?auto_192648 ?auto_192649 ) ) ( not ( = ?auto_192648 ?auto_192650 ) ) ( not ( = ?auto_192648 ?auto_192651 ) ) ( not ( = ?auto_192648 ?auto_192652 ) ) ( not ( = ?auto_192648 ?auto_192653 ) ) ( not ( = ?auto_192648 ?auto_192654 ) ) ( not ( = ?auto_192648 ?auto_192655 ) ) ( not ( = ?auto_192649 ?auto_192650 ) ) ( not ( = ?auto_192649 ?auto_192651 ) ) ( not ( = ?auto_192649 ?auto_192652 ) ) ( not ( = ?auto_192649 ?auto_192653 ) ) ( not ( = ?auto_192649 ?auto_192654 ) ) ( not ( = ?auto_192649 ?auto_192655 ) ) ( not ( = ?auto_192650 ?auto_192651 ) ) ( not ( = ?auto_192650 ?auto_192652 ) ) ( not ( = ?auto_192650 ?auto_192653 ) ) ( not ( = ?auto_192650 ?auto_192654 ) ) ( not ( = ?auto_192650 ?auto_192655 ) ) ( not ( = ?auto_192651 ?auto_192652 ) ) ( not ( = ?auto_192651 ?auto_192653 ) ) ( not ( = ?auto_192651 ?auto_192654 ) ) ( not ( = ?auto_192651 ?auto_192655 ) ) ( not ( = ?auto_192652 ?auto_192653 ) ) ( not ( = ?auto_192652 ?auto_192654 ) ) ( not ( = ?auto_192652 ?auto_192655 ) ) ( not ( = ?auto_192653 ?auto_192654 ) ) ( not ( = ?auto_192653 ?auto_192655 ) ) ( not ( = ?auto_192654 ?auto_192655 ) ) ( ON ?auto_192653 ?auto_192654 ) ( ON ?auto_192652 ?auto_192653 ) ( CLEAR ?auto_192650 ) ( ON ?auto_192651 ?auto_192652 ) ( CLEAR ?auto_192651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_192646 ?auto_192647 ?auto_192648 ?auto_192649 ?auto_192650 ?auto_192651 )
      ( MAKE-9PILE ?auto_192646 ?auto_192647 ?auto_192648 ?auto_192649 ?auto_192650 ?auto_192651 ?auto_192652 ?auto_192653 ?auto_192654 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_192684 - BLOCK
      ?auto_192685 - BLOCK
      ?auto_192686 - BLOCK
      ?auto_192687 - BLOCK
      ?auto_192688 - BLOCK
      ?auto_192689 - BLOCK
      ?auto_192690 - BLOCK
      ?auto_192691 - BLOCK
      ?auto_192692 - BLOCK
    )
    :vars
    (
      ?auto_192693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192692 ?auto_192693 ) ( ON-TABLE ?auto_192684 ) ( ON ?auto_192685 ?auto_192684 ) ( ON ?auto_192686 ?auto_192685 ) ( ON ?auto_192687 ?auto_192686 ) ( not ( = ?auto_192684 ?auto_192685 ) ) ( not ( = ?auto_192684 ?auto_192686 ) ) ( not ( = ?auto_192684 ?auto_192687 ) ) ( not ( = ?auto_192684 ?auto_192688 ) ) ( not ( = ?auto_192684 ?auto_192689 ) ) ( not ( = ?auto_192684 ?auto_192690 ) ) ( not ( = ?auto_192684 ?auto_192691 ) ) ( not ( = ?auto_192684 ?auto_192692 ) ) ( not ( = ?auto_192684 ?auto_192693 ) ) ( not ( = ?auto_192685 ?auto_192686 ) ) ( not ( = ?auto_192685 ?auto_192687 ) ) ( not ( = ?auto_192685 ?auto_192688 ) ) ( not ( = ?auto_192685 ?auto_192689 ) ) ( not ( = ?auto_192685 ?auto_192690 ) ) ( not ( = ?auto_192685 ?auto_192691 ) ) ( not ( = ?auto_192685 ?auto_192692 ) ) ( not ( = ?auto_192685 ?auto_192693 ) ) ( not ( = ?auto_192686 ?auto_192687 ) ) ( not ( = ?auto_192686 ?auto_192688 ) ) ( not ( = ?auto_192686 ?auto_192689 ) ) ( not ( = ?auto_192686 ?auto_192690 ) ) ( not ( = ?auto_192686 ?auto_192691 ) ) ( not ( = ?auto_192686 ?auto_192692 ) ) ( not ( = ?auto_192686 ?auto_192693 ) ) ( not ( = ?auto_192687 ?auto_192688 ) ) ( not ( = ?auto_192687 ?auto_192689 ) ) ( not ( = ?auto_192687 ?auto_192690 ) ) ( not ( = ?auto_192687 ?auto_192691 ) ) ( not ( = ?auto_192687 ?auto_192692 ) ) ( not ( = ?auto_192687 ?auto_192693 ) ) ( not ( = ?auto_192688 ?auto_192689 ) ) ( not ( = ?auto_192688 ?auto_192690 ) ) ( not ( = ?auto_192688 ?auto_192691 ) ) ( not ( = ?auto_192688 ?auto_192692 ) ) ( not ( = ?auto_192688 ?auto_192693 ) ) ( not ( = ?auto_192689 ?auto_192690 ) ) ( not ( = ?auto_192689 ?auto_192691 ) ) ( not ( = ?auto_192689 ?auto_192692 ) ) ( not ( = ?auto_192689 ?auto_192693 ) ) ( not ( = ?auto_192690 ?auto_192691 ) ) ( not ( = ?auto_192690 ?auto_192692 ) ) ( not ( = ?auto_192690 ?auto_192693 ) ) ( not ( = ?auto_192691 ?auto_192692 ) ) ( not ( = ?auto_192691 ?auto_192693 ) ) ( not ( = ?auto_192692 ?auto_192693 ) ) ( ON ?auto_192691 ?auto_192692 ) ( ON ?auto_192690 ?auto_192691 ) ( ON ?auto_192689 ?auto_192690 ) ( CLEAR ?auto_192687 ) ( ON ?auto_192688 ?auto_192689 ) ( CLEAR ?auto_192688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_192684 ?auto_192685 ?auto_192686 ?auto_192687 ?auto_192688 )
      ( MAKE-9PILE ?auto_192684 ?auto_192685 ?auto_192686 ?auto_192687 ?auto_192688 ?auto_192689 ?auto_192690 ?auto_192691 ?auto_192692 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_192722 - BLOCK
      ?auto_192723 - BLOCK
      ?auto_192724 - BLOCK
      ?auto_192725 - BLOCK
      ?auto_192726 - BLOCK
      ?auto_192727 - BLOCK
      ?auto_192728 - BLOCK
      ?auto_192729 - BLOCK
      ?auto_192730 - BLOCK
    )
    :vars
    (
      ?auto_192731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192730 ?auto_192731 ) ( ON-TABLE ?auto_192722 ) ( ON ?auto_192723 ?auto_192722 ) ( ON ?auto_192724 ?auto_192723 ) ( not ( = ?auto_192722 ?auto_192723 ) ) ( not ( = ?auto_192722 ?auto_192724 ) ) ( not ( = ?auto_192722 ?auto_192725 ) ) ( not ( = ?auto_192722 ?auto_192726 ) ) ( not ( = ?auto_192722 ?auto_192727 ) ) ( not ( = ?auto_192722 ?auto_192728 ) ) ( not ( = ?auto_192722 ?auto_192729 ) ) ( not ( = ?auto_192722 ?auto_192730 ) ) ( not ( = ?auto_192722 ?auto_192731 ) ) ( not ( = ?auto_192723 ?auto_192724 ) ) ( not ( = ?auto_192723 ?auto_192725 ) ) ( not ( = ?auto_192723 ?auto_192726 ) ) ( not ( = ?auto_192723 ?auto_192727 ) ) ( not ( = ?auto_192723 ?auto_192728 ) ) ( not ( = ?auto_192723 ?auto_192729 ) ) ( not ( = ?auto_192723 ?auto_192730 ) ) ( not ( = ?auto_192723 ?auto_192731 ) ) ( not ( = ?auto_192724 ?auto_192725 ) ) ( not ( = ?auto_192724 ?auto_192726 ) ) ( not ( = ?auto_192724 ?auto_192727 ) ) ( not ( = ?auto_192724 ?auto_192728 ) ) ( not ( = ?auto_192724 ?auto_192729 ) ) ( not ( = ?auto_192724 ?auto_192730 ) ) ( not ( = ?auto_192724 ?auto_192731 ) ) ( not ( = ?auto_192725 ?auto_192726 ) ) ( not ( = ?auto_192725 ?auto_192727 ) ) ( not ( = ?auto_192725 ?auto_192728 ) ) ( not ( = ?auto_192725 ?auto_192729 ) ) ( not ( = ?auto_192725 ?auto_192730 ) ) ( not ( = ?auto_192725 ?auto_192731 ) ) ( not ( = ?auto_192726 ?auto_192727 ) ) ( not ( = ?auto_192726 ?auto_192728 ) ) ( not ( = ?auto_192726 ?auto_192729 ) ) ( not ( = ?auto_192726 ?auto_192730 ) ) ( not ( = ?auto_192726 ?auto_192731 ) ) ( not ( = ?auto_192727 ?auto_192728 ) ) ( not ( = ?auto_192727 ?auto_192729 ) ) ( not ( = ?auto_192727 ?auto_192730 ) ) ( not ( = ?auto_192727 ?auto_192731 ) ) ( not ( = ?auto_192728 ?auto_192729 ) ) ( not ( = ?auto_192728 ?auto_192730 ) ) ( not ( = ?auto_192728 ?auto_192731 ) ) ( not ( = ?auto_192729 ?auto_192730 ) ) ( not ( = ?auto_192729 ?auto_192731 ) ) ( not ( = ?auto_192730 ?auto_192731 ) ) ( ON ?auto_192729 ?auto_192730 ) ( ON ?auto_192728 ?auto_192729 ) ( ON ?auto_192727 ?auto_192728 ) ( ON ?auto_192726 ?auto_192727 ) ( CLEAR ?auto_192724 ) ( ON ?auto_192725 ?auto_192726 ) ( CLEAR ?auto_192725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_192722 ?auto_192723 ?auto_192724 ?auto_192725 )
      ( MAKE-9PILE ?auto_192722 ?auto_192723 ?auto_192724 ?auto_192725 ?auto_192726 ?auto_192727 ?auto_192728 ?auto_192729 ?auto_192730 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_192760 - BLOCK
      ?auto_192761 - BLOCK
      ?auto_192762 - BLOCK
      ?auto_192763 - BLOCK
      ?auto_192764 - BLOCK
      ?auto_192765 - BLOCK
      ?auto_192766 - BLOCK
      ?auto_192767 - BLOCK
      ?auto_192768 - BLOCK
    )
    :vars
    (
      ?auto_192769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192768 ?auto_192769 ) ( ON-TABLE ?auto_192760 ) ( ON ?auto_192761 ?auto_192760 ) ( not ( = ?auto_192760 ?auto_192761 ) ) ( not ( = ?auto_192760 ?auto_192762 ) ) ( not ( = ?auto_192760 ?auto_192763 ) ) ( not ( = ?auto_192760 ?auto_192764 ) ) ( not ( = ?auto_192760 ?auto_192765 ) ) ( not ( = ?auto_192760 ?auto_192766 ) ) ( not ( = ?auto_192760 ?auto_192767 ) ) ( not ( = ?auto_192760 ?auto_192768 ) ) ( not ( = ?auto_192760 ?auto_192769 ) ) ( not ( = ?auto_192761 ?auto_192762 ) ) ( not ( = ?auto_192761 ?auto_192763 ) ) ( not ( = ?auto_192761 ?auto_192764 ) ) ( not ( = ?auto_192761 ?auto_192765 ) ) ( not ( = ?auto_192761 ?auto_192766 ) ) ( not ( = ?auto_192761 ?auto_192767 ) ) ( not ( = ?auto_192761 ?auto_192768 ) ) ( not ( = ?auto_192761 ?auto_192769 ) ) ( not ( = ?auto_192762 ?auto_192763 ) ) ( not ( = ?auto_192762 ?auto_192764 ) ) ( not ( = ?auto_192762 ?auto_192765 ) ) ( not ( = ?auto_192762 ?auto_192766 ) ) ( not ( = ?auto_192762 ?auto_192767 ) ) ( not ( = ?auto_192762 ?auto_192768 ) ) ( not ( = ?auto_192762 ?auto_192769 ) ) ( not ( = ?auto_192763 ?auto_192764 ) ) ( not ( = ?auto_192763 ?auto_192765 ) ) ( not ( = ?auto_192763 ?auto_192766 ) ) ( not ( = ?auto_192763 ?auto_192767 ) ) ( not ( = ?auto_192763 ?auto_192768 ) ) ( not ( = ?auto_192763 ?auto_192769 ) ) ( not ( = ?auto_192764 ?auto_192765 ) ) ( not ( = ?auto_192764 ?auto_192766 ) ) ( not ( = ?auto_192764 ?auto_192767 ) ) ( not ( = ?auto_192764 ?auto_192768 ) ) ( not ( = ?auto_192764 ?auto_192769 ) ) ( not ( = ?auto_192765 ?auto_192766 ) ) ( not ( = ?auto_192765 ?auto_192767 ) ) ( not ( = ?auto_192765 ?auto_192768 ) ) ( not ( = ?auto_192765 ?auto_192769 ) ) ( not ( = ?auto_192766 ?auto_192767 ) ) ( not ( = ?auto_192766 ?auto_192768 ) ) ( not ( = ?auto_192766 ?auto_192769 ) ) ( not ( = ?auto_192767 ?auto_192768 ) ) ( not ( = ?auto_192767 ?auto_192769 ) ) ( not ( = ?auto_192768 ?auto_192769 ) ) ( ON ?auto_192767 ?auto_192768 ) ( ON ?auto_192766 ?auto_192767 ) ( ON ?auto_192765 ?auto_192766 ) ( ON ?auto_192764 ?auto_192765 ) ( ON ?auto_192763 ?auto_192764 ) ( CLEAR ?auto_192761 ) ( ON ?auto_192762 ?auto_192763 ) ( CLEAR ?auto_192762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_192760 ?auto_192761 ?auto_192762 )
      ( MAKE-9PILE ?auto_192760 ?auto_192761 ?auto_192762 ?auto_192763 ?auto_192764 ?auto_192765 ?auto_192766 ?auto_192767 ?auto_192768 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_192798 - BLOCK
      ?auto_192799 - BLOCK
      ?auto_192800 - BLOCK
      ?auto_192801 - BLOCK
      ?auto_192802 - BLOCK
      ?auto_192803 - BLOCK
      ?auto_192804 - BLOCK
      ?auto_192805 - BLOCK
      ?auto_192806 - BLOCK
    )
    :vars
    (
      ?auto_192807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192806 ?auto_192807 ) ( ON-TABLE ?auto_192798 ) ( not ( = ?auto_192798 ?auto_192799 ) ) ( not ( = ?auto_192798 ?auto_192800 ) ) ( not ( = ?auto_192798 ?auto_192801 ) ) ( not ( = ?auto_192798 ?auto_192802 ) ) ( not ( = ?auto_192798 ?auto_192803 ) ) ( not ( = ?auto_192798 ?auto_192804 ) ) ( not ( = ?auto_192798 ?auto_192805 ) ) ( not ( = ?auto_192798 ?auto_192806 ) ) ( not ( = ?auto_192798 ?auto_192807 ) ) ( not ( = ?auto_192799 ?auto_192800 ) ) ( not ( = ?auto_192799 ?auto_192801 ) ) ( not ( = ?auto_192799 ?auto_192802 ) ) ( not ( = ?auto_192799 ?auto_192803 ) ) ( not ( = ?auto_192799 ?auto_192804 ) ) ( not ( = ?auto_192799 ?auto_192805 ) ) ( not ( = ?auto_192799 ?auto_192806 ) ) ( not ( = ?auto_192799 ?auto_192807 ) ) ( not ( = ?auto_192800 ?auto_192801 ) ) ( not ( = ?auto_192800 ?auto_192802 ) ) ( not ( = ?auto_192800 ?auto_192803 ) ) ( not ( = ?auto_192800 ?auto_192804 ) ) ( not ( = ?auto_192800 ?auto_192805 ) ) ( not ( = ?auto_192800 ?auto_192806 ) ) ( not ( = ?auto_192800 ?auto_192807 ) ) ( not ( = ?auto_192801 ?auto_192802 ) ) ( not ( = ?auto_192801 ?auto_192803 ) ) ( not ( = ?auto_192801 ?auto_192804 ) ) ( not ( = ?auto_192801 ?auto_192805 ) ) ( not ( = ?auto_192801 ?auto_192806 ) ) ( not ( = ?auto_192801 ?auto_192807 ) ) ( not ( = ?auto_192802 ?auto_192803 ) ) ( not ( = ?auto_192802 ?auto_192804 ) ) ( not ( = ?auto_192802 ?auto_192805 ) ) ( not ( = ?auto_192802 ?auto_192806 ) ) ( not ( = ?auto_192802 ?auto_192807 ) ) ( not ( = ?auto_192803 ?auto_192804 ) ) ( not ( = ?auto_192803 ?auto_192805 ) ) ( not ( = ?auto_192803 ?auto_192806 ) ) ( not ( = ?auto_192803 ?auto_192807 ) ) ( not ( = ?auto_192804 ?auto_192805 ) ) ( not ( = ?auto_192804 ?auto_192806 ) ) ( not ( = ?auto_192804 ?auto_192807 ) ) ( not ( = ?auto_192805 ?auto_192806 ) ) ( not ( = ?auto_192805 ?auto_192807 ) ) ( not ( = ?auto_192806 ?auto_192807 ) ) ( ON ?auto_192805 ?auto_192806 ) ( ON ?auto_192804 ?auto_192805 ) ( ON ?auto_192803 ?auto_192804 ) ( ON ?auto_192802 ?auto_192803 ) ( ON ?auto_192801 ?auto_192802 ) ( ON ?auto_192800 ?auto_192801 ) ( CLEAR ?auto_192798 ) ( ON ?auto_192799 ?auto_192800 ) ( CLEAR ?auto_192799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192798 ?auto_192799 )
      ( MAKE-9PILE ?auto_192798 ?auto_192799 ?auto_192800 ?auto_192801 ?auto_192802 ?auto_192803 ?auto_192804 ?auto_192805 ?auto_192806 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_192836 - BLOCK
      ?auto_192837 - BLOCK
      ?auto_192838 - BLOCK
      ?auto_192839 - BLOCK
      ?auto_192840 - BLOCK
      ?auto_192841 - BLOCK
      ?auto_192842 - BLOCK
      ?auto_192843 - BLOCK
      ?auto_192844 - BLOCK
    )
    :vars
    (
      ?auto_192845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192844 ?auto_192845 ) ( not ( = ?auto_192836 ?auto_192837 ) ) ( not ( = ?auto_192836 ?auto_192838 ) ) ( not ( = ?auto_192836 ?auto_192839 ) ) ( not ( = ?auto_192836 ?auto_192840 ) ) ( not ( = ?auto_192836 ?auto_192841 ) ) ( not ( = ?auto_192836 ?auto_192842 ) ) ( not ( = ?auto_192836 ?auto_192843 ) ) ( not ( = ?auto_192836 ?auto_192844 ) ) ( not ( = ?auto_192836 ?auto_192845 ) ) ( not ( = ?auto_192837 ?auto_192838 ) ) ( not ( = ?auto_192837 ?auto_192839 ) ) ( not ( = ?auto_192837 ?auto_192840 ) ) ( not ( = ?auto_192837 ?auto_192841 ) ) ( not ( = ?auto_192837 ?auto_192842 ) ) ( not ( = ?auto_192837 ?auto_192843 ) ) ( not ( = ?auto_192837 ?auto_192844 ) ) ( not ( = ?auto_192837 ?auto_192845 ) ) ( not ( = ?auto_192838 ?auto_192839 ) ) ( not ( = ?auto_192838 ?auto_192840 ) ) ( not ( = ?auto_192838 ?auto_192841 ) ) ( not ( = ?auto_192838 ?auto_192842 ) ) ( not ( = ?auto_192838 ?auto_192843 ) ) ( not ( = ?auto_192838 ?auto_192844 ) ) ( not ( = ?auto_192838 ?auto_192845 ) ) ( not ( = ?auto_192839 ?auto_192840 ) ) ( not ( = ?auto_192839 ?auto_192841 ) ) ( not ( = ?auto_192839 ?auto_192842 ) ) ( not ( = ?auto_192839 ?auto_192843 ) ) ( not ( = ?auto_192839 ?auto_192844 ) ) ( not ( = ?auto_192839 ?auto_192845 ) ) ( not ( = ?auto_192840 ?auto_192841 ) ) ( not ( = ?auto_192840 ?auto_192842 ) ) ( not ( = ?auto_192840 ?auto_192843 ) ) ( not ( = ?auto_192840 ?auto_192844 ) ) ( not ( = ?auto_192840 ?auto_192845 ) ) ( not ( = ?auto_192841 ?auto_192842 ) ) ( not ( = ?auto_192841 ?auto_192843 ) ) ( not ( = ?auto_192841 ?auto_192844 ) ) ( not ( = ?auto_192841 ?auto_192845 ) ) ( not ( = ?auto_192842 ?auto_192843 ) ) ( not ( = ?auto_192842 ?auto_192844 ) ) ( not ( = ?auto_192842 ?auto_192845 ) ) ( not ( = ?auto_192843 ?auto_192844 ) ) ( not ( = ?auto_192843 ?auto_192845 ) ) ( not ( = ?auto_192844 ?auto_192845 ) ) ( ON ?auto_192843 ?auto_192844 ) ( ON ?auto_192842 ?auto_192843 ) ( ON ?auto_192841 ?auto_192842 ) ( ON ?auto_192840 ?auto_192841 ) ( ON ?auto_192839 ?auto_192840 ) ( ON ?auto_192838 ?auto_192839 ) ( ON ?auto_192837 ?auto_192838 ) ( ON ?auto_192836 ?auto_192837 ) ( CLEAR ?auto_192836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192836 )
      ( MAKE-9PILE ?auto_192836 ?auto_192837 ?auto_192838 ?auto_192839 ?auto_192840 ?auto_192841 ?auto_192842 ?auto_192843 ?auto_192844 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_192875 - BLOCK
      ?auto_192876 - BLOCK
      ?auto_192877 - BLOCK
      ?auto_192878 - BLOCK
      ?auto_192879 - BLOCK
      ?auto_192880 - BLOCK
      ?auto_192881 - BLOCK
      ?auto_192882 - BLOCK
      ?auto_192883 - BLOCK
      ?auto_192884 - BLOCK
    )
    :vars
    (
      ?auto_192885 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_192883 ) ( ON ?auto_192884 ?auto_192885 ) ( CLEAR ?auto_192884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192875 ) ( ON ?auto_192876 ?auto_192875 ) ( ON ?auto_192877 ?auto_192876 ) ( ON ?auto_192878 ?auto_192877 ) ( ON ?auto_192879 ?auto_192878 ) ( ON ?auto_192880 ?auto_192879 ) ( ON ?auto_192881 ?auto_192880 ) ( ON ?auto_192882 ?auto_192881 ) ( ON ?auto_192883 ?auto_192882 ) ( not ( = ?auto_192875 ?auto_192876 ) ) ( not ( = ?auto_192875 ?auto_192877 ) ) ( not ( = ?auto_192875 ?auto_192878 ) ) ( not ( = ?auto_192875 ?auto_192879 ) ) ( not ( = ?auto_192875 ?auto_192880 ) ) ( not ( = ?auto_192875 ?auto_192881 ) ) ( not ( = ?auto_192875 ?auto_192882 ) ) ( not ( = ?auto_192875 ?auto_192883 ) ) ( not ( = ?auto_192875 ?auto_192884 ) ) ( not ( = ?auto_192875 ?auto_192885 ) ) ( not ( = ?auto_192876 ?auto_192877 ) ) ( not ( = ?auto_192876 ?auto_192878 ) ) ( not ( = ?auto_192876 ?auto_192879 ) ) ( not ( = ?auto_192876 ?auto_192880 ) ) ( not ( = ?auto_192876 ?auto_192881 ) ) ( not ( = ?auto_192876 ?auto_192882 ) ) ( not ( = ?auto_192876 ?auto_192883 ) ) ( not ( = ?auto_192876 ?auto_192884 ) ) ( not ( = ?auto_192876 ?auto_192885 ) ) ( not ( = ?auto_192877 ?auto_192878 ) ) ( not ( = ?auto_192877 ?auto_192879 ) ) ( not ( = ?auto_192877 ?auto_192880 ) ) ( not ( = ?auto_192877 ?auto_192881 ) ) ( not ( = ?auto_192877 ?auto_192882 ) ) ( not ( = ?auto_192877 ?auto_192883 ) ) ( not ( = ?auto_192877 ?auto_192884 ) ) ( not ( = ?auto_192877 ?auto_192885 ) ) ( not ( = ?auto_192878 ?auto_192879 ) ) ( not ( = ?auto_192878 ?auto_192880 ) ) ( not ( = ?auto_192878 ?auto_192881 ) ) ( not ( = ?auto_192878 ?auto_192882 ) ) ( not ( = ?auto_192878 ?auto_192883 ) ) ( not ( = ?auto_192878 ?auto_192884 ) ) ( not ( = ?auto_192878 ?auto_192885 ) ) ( not ( = ?auto_192879 ?auto_192880 ) ) ( not ( = ?auto_192879 ?auto_192881 ) ) ( not ( = ?auto_192879 ?auto_192882 ) ) ( not ( = ?auto_192879 ?auto_192883 ) ) ( not ( = ?auto_192879 ?auto_192884 ) ) ( not ( = ?auto_192879 ?auto_192885 ) ) ( not ( = ?auto_192880 ?auto_192881 ) ) ( not ( = ?auto_192880 ?auto_192882 ) ) ( not ( = ?auto_192880 ?auto_192883 ) ) ( not ( = ?auto_192880 ?auto_192884 ) ) ( not ( = ?auto_192880 ?auto_192885 ) ) ( not ( = ?auto_192881 ?auto_192882 ) ) ( not ( = ?auto_192881 ?auto_192883 ) ) ( not ( = ?auto_192881 ?auto_192884 ) ) ( not ( = ?auto_192881 ?auto_192885 ) ) ( not ( = ?auto_192882 ?auto_192883 ) ) ( not ( = ?auto_192882 ?auto_192884 ) ) ( not ( = ?auto_192882 ?auto_192885 ) ) ( not ( = ?auto_192883 ?auto_192884 ) ) ( not ( = ?auto_192883 ?auto_192885 ) ) ( not ( = ?auto_192884 ?auto_192885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192884 ?auto_192885 )
      ( !STACK ?auto_192884 ?auto_192883 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_192917 - BLOCK
      ?auto_192918 - BLOCK
      ?auto_192919 - BLOCK
      ?auto_192920 - BLOCK
      ?auto_192921 - BLOCK
      ?auto_192922 - BLOCK
      ?auto_192923 - BLOCK
      ?auto_192924 - BLOCK
      ?auto_192925 - BLOCK
      ?auto_192926 - BLOCK
    )
    :vars
    (
      ?auto_192927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192926 ?auto_192927 ) ( ON-TABLE ?auto_192917 ) ( ON ?auto_192918 ?auto_192917 ) ( ON ?auto_192919 ?auto_192918 ) ( ON ?auto_192920 ?auto_192919 ) ( ON ?auto_192921 ?auto_192920 ) ( ON ?auto_192922 ?auto_192921 ) ( ON ?auto_192923 ?auto_192922 ) ( ON ?auto_192924 ?auto_192923 ) ( not ( = ?auto_192917 ?auto_192918 ) ) ( not ( = ?auto_192917 ?auto_192919 ) ) ( not ( = ?auto_192917 ?auto_192920 ) ) ( not ( = ?auto_192917 ?auto_192921 ) ) ( not ( = ?auto_192917 ?auto_192922 ) ) ( not ( = ?auto_192917 ?auto_192923 ) ) ( not ( = ?auto_192917 ?auto_192924 ) ) ( not ( = ?auto_192917 ?auto_192925 ) ) ( not ( = ?auto_192917 ?auto_192926 ) ) ( not ( = ?auto_192917 ?auto_192927 ) ) ( not ( = ?auto_192918 ?auto_192919 ) ) ( not ( = ?auto_192918 ?auto_192920 ) ) ( not ( = ?auto_192918 ?auto_192921 ) ) ( not ( = ?auto_192918 ?auto_192922 ) ) ( not ( = ?auto_192918 ?auto_192923 ) ) ( not ( = ?auto_192918 ?auto_192924 ) ) ( not ( = ?auto_192918 ?auto_192925 ) ) ( not ( = ?auto_192918 ?auto_192926 ) ) ( not ( = ?auto_192918 ?auto_192927 ) ) ( not ( = ?auto_192919 ?auto_192920 ) ) ( not ( = ?auto_192919 ?auto_192921 ) ) ( not ( = ?auto_192919 ?auto_192922 ) ) ( not ( = ?auto_192919 ?auto_192923 ) ) ( not ( = ?auto_192919 ?auto_192924 ) ) ( not ( = ?auto_192919 ?auto_192925 ) ) ( not ( = ?auto_192919 ?auto_192926 ) ) ( not ( = ?auto_192919 ?auto_192927 ) ) ( not ( = ?auto_192920 ?auto_192921 ) ) ( not ( = ?auto_192920 ?auto_192922 ) ) ( not ( = ?auto_192920 ?auto_192923 ) ) ( not ( = ?auto_192920 ?auto_192924 ) ) ( not ( = ?auto_192920 ?auto_192925 ) ) ( not ( = ?auto_192920 ?auto_192926 ) ) ( not ( = ?auto_192920 ?auto_192927 ) ) ( not ( = ?auto_192921 ?auto_192922 ) ) ( not ( = ?auto_192921 ?auto_192923 ) ) ( not ( = ?auto_192921 ?auto_192924 ) ) ( not ( = ?auto_192921 ?auto_192925 ) ) ( not ( = ?auto_192921 ?auto_192926 ) ) ( not ( = ?auto_192921 ?auto_192927 ) ) ( not ( = ?auto_192922 ?auto_192923 ) ) ( not ( = ?auto_192922 ?auto_192924 ) ) ( not ( = ?auto_192922 ?auto_192925 ) ) ( not ( = ?auto_192922 ?auto_192926 ) ) ( not ( = ?auto_192922 ?auto_192927 ) ) ( not ( = ?auto_192923 ?auto_192924 ) ) ( not ( = ?auto_192923 ?auto_192925 ) ) ( not ( = ?auto_192923 ?auto_192926 ) ) ( not ( = ?auto_192923 ?auto_192927 ) ) ( not ( = ?auto_192924 ?auto_192925 ) ) ( not ( = ?auto_192924 ?auto_192926 ) ) ( not ( = ?auto_192924 ?auto_192927 ) ) ( not ( = ?auto_192925 ?auto_192926 ) ) ( not ( = ?auto_192925 ?auto_192927 ) ) ( not ( = ?auto_192926 ?auto_192927 ) ) ( CLEAR ?auto_192924 ) ( ON ?auto_192925 ?auto_192926 ) ( CLEAR ?auto_192925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_192917 ?auto_192918 ?auto_192919 ?auto_192920 ?auto_192921 ?auto_192922 ?auto_192923 ?auto_192924 ?auto_192925 )
      ( MAKE-10PILE ?auto_192917 ?auto_192918 ?auto_192919 ?auto_192920 ?auto_192921 ?auto_192922 ?auto_192923 ?auto_192924 ?auto_192925 ?auto_192926 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_192959 - BLOCK
      ?auto_192960 - BLOCK
      ?auto_192961 - BLOCK
      ?auto_192962 - BLOCK
      ?auto_192963 - BLOCK
      ?auto_192964 - BLOCK
      ?auto_192965 - BLOCK
      ?auto_192966 - BLOCK
      ?auto_192967 - BLOCK
      ?auto_192968 - BLOCK
    )
    :vars
    (
      ?auto_192969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192968 ?auto_192969 ) ( ON-TABLE ?auto_192959 ) ( ON ?auto_192960 ?auto_192959 ) ( ON ?auto_192961 ?auto_192960 ) ( ON ?auto_192962 ?auto_192961 ) ( ON ?auto_192963 ?auto_192962 ) ( ON ?auto_192964 ?auto_192963 ) ( ON ?auto_192965 ?auto_192964 ) ( not ( = ?auto_192959 ?auto_192960 ) ) ( not ( = ?auto_192959 ?auto_192961 ) ) ( not ( = ?auto_192959 ?auto_192962 ) ) ( not ( = ?auto_192959 ?auto_192963 ) ) ( not ( = ?auto_192959 ?auto_192964 ) ) ( not ( = ?auto_192959 ?auto_192965 ) ) ( not ( = ?auto_192959 ?auto_192966 ) ) ( not ( = ?auto_192959 ?auto_192967 ) ) ( not ( = ?auto_192959 ?auto_192968 ) ) ( not ( = ?auto_192959 ?auto_192969 ) ) ( not ( = ?auto_192960 ?auto_192961 ) ) ( not ( = ?auto_192960 ?auto_192962 ) ) ( not ( = ?auto_192960 ?auto_192963 ) ) ( not ( = ?auto_192960 ?auto_192964 ) ) ( not ( = ?auto_192960 ?auto_192965 ) ) ( not ( = ?auto_192960 ?auto_192966 ) ) ( not ( = ?auto_192960 ?auto_192967 ) ) ( not ( = ?auto_192960 ?auto_192968 ) ) ( not ( = ?auto_192960 ?auto_192969 ) ) ( not ( = ?auto_192961 ?auto_192962 ) ) ( not ( = ?auto_192961 ?auto_192963 ) ) ( not ( = ?auto_192961 ?auto_192964 ) ) ( not ( = ?auto_192961 ?auto_192965 ) ) ( not ( = ?auto_192961 ?auto_192966 ) ) ( not ( = ?auto_192961 ?auto_192967 ) ) ( not ( = ?auto_192961 ?auto_192968 ) ) ( not ( = ?auto_192961 ?auto_192969 ) ) ( not ( = ?auto_192962 ?auto_192963 ) ) ( not ( = ?auto_192962 ?auto_192964 ) ) ( not ( = ?auto_192962 ?auto_192965 ) ) ( not ( = ?auto_192962 ?auto_192966 ) ) ( not ( = ?auto_192962 ?auto_192967 ) ) ( not ( = ?auto_192962 ?auto_192968 ) ) ( not ( = ?auto_192962 ?auto_192969 ) ) ( not ( = ?auto_192963 ?auto_192964 ) ) ( not ( = ?auto_192963 ?auto_192965 ) ) ( not ( = ?auto_192963 ?auto_192966 ) ) ( not ( = ?auto_192963 ?auto_192967 ) ) ( not ( = ?auto_192963 ?auto_192968 ) ) ( not ( = ?auto_192963 ?auto_192969 ) ) ( not ( = ?auto_192964 ?auto_192965 ) ) ( not ( = ?auto_192964 ?auto_192966 ) ) ( not ( = ?auto_192964 ?auto_192967 ) ) ( not ( = ?auto_192964 ?auto_192968 ) ) ( not ( = ?auto_192964 ?auto_192969 ) ) ( not ( = ?auto_192965 ?auto_192966 ) ) ( not ( = ?auto_192965 ?auto_192967 ) ) ( not ( = ?auto_192965 ?auto_192968 ) ) ( not ( = ?auto_192965 ?auto_192969 ) ) ( not ( = ?auto_192966 ?auto_192967 ) ) ( not ( = ?auto_192966 ?auto_192968 ) ) ( not ( = ?auto_192966 ?auto_192969 ) ) ( not ( = ?auto_192967 ?auto_192968 ) ) ( not ( = ?auto_192967 ?auto_192969 ) ) ( not ( = ?auto_192968 ?auto_192969 ) ) ( ON ?auto_192967 ?auto_192968 ) ( CLEAR ?auto_192965 ) ( ON ?auto_192966 ?auto_192967 ) ( CLEAR ?auto_192966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192959 ?auto_192960 ?auto_192961 ?auto_192962 ?auto_192963 ?auto_192964 ?auto_192965 ?auto_192966 )
      ( MAKE-10PILE ?auto_192959 ?auto_192960 ?auto_192961 ?auto_192962 ?auto_192963 ?auto_192964 ?auto_192965 ?auto_192966 ?auto_192967 ?auto_192968 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_193001 - BLOCK
      ?auto_193002 - BLOCK
      ?auto_193003 - BLOCK
      ?auto_193004 - BLOCK
      ?auto_193005 - BLOCK
      ?auto_193006 - BLOCK
      ?auto_193007 - BLOCK
      ?auto_193008 - BLOCK
      ?auto_193009 - BLOCK
      ?auto_193010 - BLOCK
    )
    :vars
    (
      ?auto_193011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193010 ?auto_193011 ) ( ON-TABLE ?auto_193001 ) ( ON ?auto_193002 ?auto_193001 ) ( ON ?auto_193003 ?auto_193002 ) ( ON ?auto_193004 ?auto_193003 ) ( ON ?auto_193005 ?auto_193004 ) ( ON ?auto_193006 ?auto_193005 ) ( not ( = ?auto_193001 ?auto_193002 ) ) ( not ( = ?auto_193001 ?auto_193003 ) ) ( not ( = ?auto_193001 ?auto_193004 ) ) ( not ( = ?auto_193001 ?auto_193005 ) ) ( not ( = ?auto_193001 ?auto_193006 ) ) ( not ( = ?auto_193001 ?auto_193007 ) ) ( not ( = ?auto_193001 ?auto_193008 ) ) ( not ( = ?auto_193001 ?auto_193009 ) ) ( not ( = ?auto_193001 ?auto_193010 ) ) ( not ( = ?auto_193001 ?auto_193011 ) ) ( not ( = ?auto_193002 ?auto_193003 ) ) ( not ( = ?auto_193002 ?auto_193004 ) ) ( not ( = ?auto_193002 ?auto_193005 ) ) ( not ( = ?auto_193002 ?auto_193006 ) ) ( not ( = ?auto_193002 ?auto_193007 ) ) ( not ( = ?auto_193002 ?auto_193008 ) ) ( not ( = ?auto_193002 ?auto_193009 ) ) ( not ( = ?auto_193002 ?auto_193010 ) ) ( not ( = ?auto_193002 ?auto_193011 ) ) ( not ( = ?auto_193003 ?auto_193004 ) ) ( not ( = ?auto_193003 ?auto_193005 ) ) ( not ( = ?auto_193003 ?auto_193006 ) ) ( not ( = ?auto_193003 ?auto_193007 ) ) ( not ( = ?auto_193003 ?auto_193008 ) ) ( not ( = ?auto_193003 ?auto_193009 ) ) ( not ( = ?auto_193003 ?auto_193010 ) ) ( not ( = ?auto_193003 ?auto_193011 ) ) ( not ( = ?auto_193004 ?auto_193005 ) ) ( not ( = ?auto_193004 ?auto_193006 ) ) ( not ( = ?auto_193004 ?auto_193007 ) ) ( not ( = ?auto_193004 ?auto_193008 ) ) ( not ( = ?auto_193004 ?auto_193009 ) ) ( not ( = ?auto_193004 ?auto_193010 ) ) ( not ( = ?auto_193004 ?auto_193011 ) ) ( not ( = ?auto_193005 ?auto_193006 ) ) ( not ( = ?auto_193005 ?auto_193007 ) ) ( not ( = ?auto_193005 ?auto_193008 ) ) ( not ( = ?auto_193005 ?auto_193009 ) ) ( not ( = ?auto_193005 ?auto_193010 ) ) ( not ( = ?auto_193005 ?auto_193011 ) ) ( not ( = ?auto_193006 ?auto_193007 ) ) ( not ( = ?auto_193006 ?auto_193008 ) ) ( not ( = ?auto_193006 ?auto_193009 ) ) ( not ( = ?auto_193006 ?auto_193010 ) ) ( not ( = ?auto_193006 ?auto_193011 ) ) ( not ( = ?auto_193007 ?auto_193008 ) ) ( not ( = ?auto_193007 ?auto_193009 ) ) ( not ( = ?auto_193007 ?auto_193010 ) ) ( not ( = ?auto_193007 ?auto_193011 ) ) ( not ( = ?auto_193008 ?auto_193009 ) ) ( not ( = ?auto_193008 ?auto_193010 ) ) ( not ( = ?auto_193008 ?auto_193011 ) ) ( not ( = ?auto_193009 ?auto_193010 ) ) ( not ( = ?auto_193009 ?auto_193011 ) ) ( not ( = ?auto_193010 ?auto_193011 ) ) ( ON ?auto_193009 ?auto_193010 ) ( ON ?auto_193008 ?auto_193009 ) ( CLEAR ?auto_193006 ) ( ON ?auto_193007 ?auto_193008 ) ( CLEAR ?auto_193007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193001 ?auto_193002 ?auto_193003 ?auto_193004 ?auto_193005 ?auto_193006 ?auto_193007 )
      ( MAKE-10PILE ?auto_193001 ?auto_193002 ?auto_193003 ?auto_193004 ?auto_193005 ?auto_193006 ?auto_193007 ?auto_193008 ?auto_193009 ?auto_193010 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_193043 - BLOCK
      ?auto_193044 - BLOCK
      ?auto_193045 - BLOCK
      ?auto_193046 - BLOCK
      ?auto_193047 - BLOCK
      ?auto_193048 - BLOCK
      ?auto_193049 - BLOCK
      ?auto_193050 - BLOCK
      ?auto_193051 - BLOCK
      ?auto_193052 - BLOCK
    )
    :vars
    (
      ?auto_193053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193052 ?auto_193053 ) ( ON-TABLE ?auto_193043 ) ( ON ?auto_193044 ?auto_193043 ) ( ON ?auto_193045 ?auto_193044 ) ( ON ?auto_193046 ?auto_193045 ) ( ON ?auto_193047 ?auto_193046 ) ( not ( = ?auto_193043 ?auto_193044 ) ) ( not ( = ?auto_193043 ?auto_193045 ) ) ( not ( = ?auto_193043 ?auto_193046 ) ) ( not ( = ?auto_193043 ?auto_193047 ) ) ( not ( = ?auto_193043 ?auto_193048 ) ) ( not ( = ?auto_193043 ?auto_193049 ) ) ( not ( = ?auto_193043 ?auto_193050 ) ) ( not ( = ?auto_193043 ?auto_193051 ) ) ( not ( = ?auto_193043 ?auto_193052 ) ) ( not ( = ?auto_193043 ?auto_193053 ) ) ( not ( = ?auto_193044 ?auto_193045 ) ) ( not ( = ?auto_193044 ?auto_193046 ) ) ( not ( = ?auto_193044 ?auto_193047 ) ) ( not ( = ?auto_193044 ?auto_193048 ) ) ( not ( = ?auto_193044 ?auto_193049 ) ) ( not ( = ?auto_193044 ?auto_193050 ) ) ( not ( = ?auto_193044 ?auto_193051 ) ) ( not ( = ?auto_193044 ?auto_193052 ) ) ( not ( = ?auto_193044 ?auto_193053 ) ) ( not ( = ?auto_193045 ?auto_193046 ) ) ( not ( = ?auto_193045 ?auto_193047 ) ) ( not ( = ?auto_193045 ?auto_193048 ) ) ( not ( = ?auto_193045 ?auto_193049 ) ) ( not ( = ?auto_193045 ?auto_193050 ) ) ( not ( = ?auto_193045 ?auto_193051 ) ) ( not ( = ?auto_193045 ?auto_193052 ) ) ( not ( = ?auto_193045 ?auto_193053 ) ) ( not ( = ?auto_193046 ?auto_193047 ) ) ( not ( = ?auto_193046 ?auto_193048 ) ) ( not ( = ?auto_193046 ?auto_193049 ) ) ( not ( = ?auto_193046 ?auto_193050 ) ) ( not ( = ?auto_193046 ?auto_193051 ) ) ( not ( = ?auto_193046 ?auto_193052 ) ) ( not ( = ?auto_193046 ?auto_193053 ) ) ( not ( = ?auto_193047 ?auto_193048 ) ) ( not ( = ?auto_193047 ?auto_193049 ) ) ( not ( = ?auto_193047 ?auto_193050 ) ) ( not ( = ?auto_193047 ?auto_193051 ) ) ( not ( = ?auto_193047 ?auto_193052 ) ) ( not ( = ?auto_193047 ?auto_193053 ) ) ( not ( = ?auto_193048 ?auto_193049 ) ) ( not ( = ?auto_193048 ?auto_193050 ) ) ( not ( = ?auto_193048 ?auto_193051 ) ) ( not ( = ?auto_193048 ?auto_193052 ) ) ( not ( = ?auto_193048 ?auto_193053 ) ) ( not ( = ?auto_193049 ?auto_193050 ) ) ( not ( = ?auto_193049 ?auto_193051 ) ) ( not ( = ?auto_193049 ?auto_193052 ) ) ( not ( = ?auto_193049 ?auto_193053 ) ) ( not ( = ?auto_193050 ?auto_193051 ) ) ( not ( = ?auto_193050 ?auto_193052 ) ) ( not ( = ?auto_193050 ?auto_193053 ) ) ( not ( = ?auto_193051 ?auto_193052 ) ) ( not ( = ?auto_193051 ?auto_193053 ) ) ( not ( = ?auto_193052 ?auto_193053 ) ) ( ON ?auto_193051 ?auto_193052 ) ( ON ?auto_193050 ?auto_193051 ) ( ON ?auto_193049 ?auto_193050 ) ( CLEAR ?auto_193047 ) ( ON ?auto_193048 ?auto_193049 ) ( CLEAR ?auto_193048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193043 ?auto_193044 ?auto_193045 ?auto_193046 ?auto_193047 ?auto_193048 )
      ( MAKE-10PILE ?auto_193043 ?auto_193044 ?auto_193045 ?auto_193046 ?auto_193047 ?auto_193048 ?auto_193049 ?auto_193050 ?auto_193051 ?auto_193052 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_193085 - BLOCK
      ?auto_193086 - BLOCK
      ?auto_193087 - BLOCK
      ?auto_193088 - BLOCK
      ?auto_193089 - BLOCK
      ?auto_193090 - BLOCK
      ?auto_193091 - BLOCK
      ?auto_193092 - BLOCK
      ?auto_193093 - BLOCK
      ?auto_193094 - BLOCK
    )
    :vars
    (
      ?auto_193095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193094 ?auto_193095 ) ( ON-TABLE ?auto_193085 ) ( ON ?auto_193086 ?auto_193085 ) ( ON ?auto_193087 ?auto_193086 ) ( ON ?auto_193088 ?auto_193087 ) ( not ( = ?auto_193085 ?auto_193086 ) ) ( not ( = ?auto_193085 ?auto_193087 ) ) ( not ( = ?auto_193085 ?auto_193088 ) ) ( not ( = ?auto_193085 ?auto_193089 ) ) ( not ( = ?auto_193085 ?auto_193090 ) ) ( not ( = ?auto_193085 ?auto_193091 ) ) ( not ( = ?auto_193085 ?auto_193092 ) ) ( not ( = ?auto_193085 ?auto_193093 ) ) ( not ( = ?auto_193085 ?auto_193094 ) ) ( not ( = ?auto_193085 ?auto_193095 ) ) ( not ( = ?auto_193086 ?auto_193087 ) ) ( not ( = ?auto_193086 ?auto_193088 ) ) ( not ( = ?auto_193086 ?auto_193089 ) ) ( not ( = ?auto_193086 ?auto_193090 ) ) ( not ( = ?auto_193086 ?auto_193091 ) ) ( not ( = ?auto_193086 ?auto_193092 ) ) ( not ( = ?auto_193086 ?auto_193093 ) ) ( not ( = ?auto_193086 ?auto_193094 ) ) ( not ( = ?auto_193086 ?auto_193095 ) ) ( not ( = ?auto_193087 ?auto_193088 ) ) ( not ( = ?auto_193087 ?auto_193089 ) ) ( not ( = ?auto_193087 ?auto_193090 ) ) ( not ( = ?auto_193087 ?auto_193091 ) ) ( not ( = ?auto_193087 ?auto_193092 ) ) ( not ( = ?auto_193087 ?auto_193093 ) ) ( not ( = ?auto_193087 ?auto_193094 ) ) ( not ( = ?auto_193087 ?auto_193095 ) ) ( not ( = ?auto_193088 ?auto_193089 ) ) ( not ( = ?auto_193088 ?auto_193090 ) ) ( not ( = ?auto_193088 ?auto_193091 ) ) ( not ( = ?auto_193088 ?auto_193092 ) ) ( not ( = ?auto_193088 ?auto_193093 ) ) ( not ( = ?auto_193088 ?auto_193094 ) ) ( not ( = ?auto_193088 ?auto_193095 ) ) ( not ( = ?auto_193089 ?auto_193090 ) ) ( not ( = ?auto_193089 ?auto_193091 ) ) ( not ( = ?auto_193089 ?auto_193092 ) ) ( not ( = ?auto_193089 ?auto_193093 ) ) ( not ( = ?auto_193089 ?auto_193094 ) ) ( not ( = ?auto_193089 ?auto_193095 ) ) ( not ( = ?auto_193090 ?auto_193091 ) ) ( not ( = ?auto_193090 ?auto_193092 ) ) ( not ( = ?auto_193090 ?auto_193093 ) ) ( not ( = ?auto_193090 ?auto_193094 ) ) ( not ( = ?auto_193090 ?auto_193095 ) ) ( not ( = ?auto_193091 ?auto_193092 ) ) ( not ( = ?auto_193091 ?auto_193093 ) ) ( not ( = ?auto_193091 ?auto_193094 ) ) ( not ( = ?auto_193091 ?auto_193095 ) ) ( not ( = ?auto_193092 ?auto_193093 ) ) ( not ( = ?auto_193092 ?auto_193094 ) ) ( not ( = ?auto_193092 ?auto_193095 ) ) ( not ( = ?auto_193093 ?auto_193094 ) ) ( not ( = ?auto_193093 ?auto_193095 ) ) ( not ( = ?auto_193094 ?auto_193095 ) ) ( ON ?auto_193093 ?auto_193094 ) ( ON ?auto_193092 ?auto_193093 ) ( ON ?auto_193091 ?auto_193092 ) ( ON ?auto_193090 ?auto_193091 ) ( CLEAR ?auto_193088 ) ( ON ?auto_193089 ?auto_193090 ) ( CLEAR ?auto_193089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_193085 ?auto_193086 ?auto_193087 ?auto_193088 ?auto_193089 )
      ( MAKE-10PILE ?auto_193085 ?auto_193086 ?auto_193087 ?auto_193088 ?auto_193089 ?auto_193090 ?auto_193091 ?auto_193092 ?auto_193093 ?auto_193094 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_193127 - BLOCK
      ?auto_193128 - BLOCK
      ?auto_193129 - BLOCK
      ?auto_193130 - BLOCK
      ?auto_193131 - BLOCK
      ?auto_193132 - BLOCK
      ?auto_193133 - BLOCK
      ?auto_193134 - BLOCK
      ?auto_193135 - BLOCK
      ?auto_193136 - BLOCK
    )
    :vars
    (
      ?auto_193137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193136 ?auto_193137 ) ( ON-TABLE ?auto_193127 ) ( ON ?auto_193128 ?auto_193127 ) ( ON ?auto_193129 ?auto_193128 ) ( not ( = ?auto_193127 ?auto_193128 ) ) ( not ( = ?auto_193127 ?auto_193129 ) ) ( not ( = ?auto_193127 ?auto_193130 ) ) ( not ( = ?auto_193127 ?auto_193131 ) ) ( not ( = ?auto_193127 ?auto_193132 ) ) ( not ( = ?auto_193127 ?auto_193133 ) ) ( not ( = ?auto_193127 ?auto_193134 ) ) ( not ( = ?auto_193127 ?auto_193135 ) ) ( not ( = ?auto_193127 ?auto_193136 ) ) ( not ( = ?auto_193127 ?auto_193137 ) ) ( not ( = ?auto_193128 ?auto_193129 ) ) ( not ( = ?auto_193128 ?auto_193130 ) ) ( not ( = ?auto_193128 ?auto_193131 ) ) ( not ( = ?auto_193128 ?auto_193132 ) ) ( not ( = ?auto_193128 ?auto_193133 ) ) ( not ( = ?auto_193128 ?auto_193134 ) ) ( not ( = ?auto_193128 ?auto_193135 ) ) ( not ( = ?auto_193128 ?auto_193136 ) ) ( not ( = ?auto_193128 ?auto_193137 ) ) ( not ( = ?auto_193129 ?auto_193130 ) ) ( not ( = ?auto_193129 ?auto_193131 ) ) ( not ( = ?auto_193129 ?auto_193132 ) ) ( not ( = ?auto_193129 ?auto_193133 ) ) ( not ( = ?auto_193129 ?auto_193134 ) ) ( not ( = ?auto_193129 ?auto_193135 ) ) ( not ( = ?auto_193129 ?auto_193136 ) ) ( not ( = ?auto_193129 ?auto_193137 ) ) ( not ( = ?auto_193130 ?auto_193131 ) ) ( not ( = ?auto_193130 ?auto_193132 ) ) ( not ( = ?auto_193130 ?auto_193133 ) ) ( not ( = ?auto_193130 ?auto_193134 ) ) ( not ( = ?auto_193130 ?auto_193135 ) ) ( not ( = ?auto_193130 ?auto_193136 ) ) ( not ( = ?auto_193130 ?auto_193137 ) ) ( not ( = ?auto_193131 ?auto_193132 ) ) ( not ( = ?auto_193131 ?auto_193133 ) ) ( not ( = ?auto_193131 ?auto_193134 ) ) ( not ( = ?auto_193131 ?auto_193135 ) ) ( not ( = ?auto_193131 ?auto_193136 ) ) ( not ( = ?auto_193131 ?auto_193137 ) ) ( not ( = ?auto_193132 ?auto_193133 ) ) ( not ( = ?auto_193132 ?auto_193134 ) ) ( not ( = ?auto_193132 ?auto_193135 ) ) ( not ( = ?auto_193132 ?auto_193136 ) ) ( not ( = ?auto_193132 ?auto_193137 ) ) ( not ( = ?auto_193133 ?auto_193134 ) ) ( not ( = ?auto_193133 ?auto_193135 ) ) ( not ( = ?auto_193133 ?auto_193136 ) ) ( not ( = ?auto_193133 ?auto_193137 ) ) ( not ( = ?auto_193134 ?auto_193135 ) ) ( not ( = ?auto_193134 ?auto_193136 ) ) ( not ( = ?auto_193134 ?auto_193137 ) ) ( not ( = ?auto_193135 ?auto_193136 ) ) ( not ( = ?auto_193135 ?auto_193137 ) ) ( not ( = ?auto_193136 ?auto_193137 ) ) ( ON ?auto_193135 ?auto_193136 ) ( ON ?auto_193134 ?auto_193135 ) ( ON ?auto_193133 ?auto_193134 ) ( ON ?auto_193132 ?auto_193133 ) ( ON ?auto_193131 ?auto_193132 ) ( CLEAR ?auto_193129 ) ( ON ?auto_193130 ?auto_193131 ) ( CLEAR ?auto_193130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_193127 ?auto_193128 ?auto_193129 ?auto_193130 )
      ( MAKE-10PILE ?auto_193127 ?auto_193128 ?auto_193129 ?auto_193130 ?auto_193131 ?auto_193132 ?auto_193133 ?auto_193134 ?auto_193135 ?auto_193136 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_193169 - BLOCK
      ?auto_193170 - BLOCK
      ?auto_193171 - BLOCK
      ?auto_193172 - BLOCK
      ?auto_193173 - BLOCK
      ?auto_193174 - BLOCK
      ?auto_193175 - BLOCK
      ?auto_193176 - BLOCK
      ?auto_193177 - BLOCK
      ?auto_193178 - BLOCK
    )
    :vars
    (
      ?auto_193179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193178 ?auto_193179 ) ( ON-TABLE ?auto_193169 ) ( ON ?auto_193170 ?auto_193169 ) ( not ( = ?auto_193169 ?auto_193170 ) ) ( not ( = ?auto_193169 ?auto_193171 ) ) ( not ( = ?auto_193169 ?auto_193172 ) ) ( not ( = ?auto_193169 ?auto_193173 ) ) ( not ( = ?auto_193169 ?auto_193174 ) ) ( not ( = ?auto_193169 ?auto_193175 ) ) ( not ( = ?auto_193169 ?auto_193176 ) ) ( not ( = ?auto_193169 ?auto_193177 ) ) ( not ( = ?auto_193169 ?auto_193178 ) ) ( not ( = ?auto_193169 ?auto_193179 ) ) ( not ( = ?auto_193170 ?auto_193171 ) ) ( not ( = ?auto_193170 ?auto_193172 ) ) ( not ( = ?auto_193170 ?auto_193173 ) ) ( not ( = ?auto_193170 ?auto_193174 ) ) ( not ( = ?auto_193170 ?auto_193175 ) ) ( not ( = ?auto_193170 ?auto_193176 ) ) ( not ( = ?auto_193170 ?auto_193177 ) ) ( not ( = ?auto_193170 ?auto_193178 ) ) ( not ( = ?auto_193170 ?auto_193179 ) ) ( not ( = ?auto_193171 ?auto_193172 ) ) ( not ( = ?auto_193171 ?auto_193173 ) ) ( not ( = ?auto_193171 ?auto_193174 ) ) ( not ( = ?auto_193171 ?auto_193175 ) ) ( not ( = ?auto_193171 ?auto_193176 ) ) ( not ( = ?auto_193171 ?auto_193177 ) ) ( not ( = ?auto_193171 ?auto_193178 ) ) ( not ( = ?auto_193171 ?auto_193179 ) ) ( not ( = ?auto_193172 ?auto_193173 ) ) ( not ( = ?auto_193172 ?auto_193174 ) ) ( not ( = ?auto_193172 ?auto_193175 ) ) ( not ( = ?auto_193172 ?auto_193176 ) ) ( not ( = ?auto_193172 ?auto_193177 ) ) ( not ( = ?auto_193172 ?auto_193178 ) ) ( not ( = ?auto_193172 ?auto_193179 ) ) ( not ( = ?auto_193173 ?auto_193174 ) ) ( not ( = ?auto_193173 ?auto_193175 ) ) ( not ( = ?auto_193173 ?auto_193176 ) ) ( not ( = ?auto_193173 ?auto_193177 ) ) ( not ( = ?auto_193173 ?auto_193178 ) ) ( not ( = ?auto_193173 ?auto_193179 ) ) ( not ( = ?auto_193174 ?auto_193175 ) ) ( not ( = ?auto_193174 ?auto_193176 ) ) ( not ( = ?auto_193174 ?auto_193177 ) ) ( not ( = ?auto_193174 ?auto_193178 ) ) ( not ( = ?auto_193174 ?auto_193179 ) ) ( not ( = ?auto_193175 ?auto_193176 ) ) ( not ( = ?auto_193175 ?auto_193177 ) ) ( not ( = ?auto_193175 ?auto_193178 ) ) ( not ( = ?auto_193175 ?auto_193179 ) ) ( not ( = ?auto_193176 ?auto_193177 ) ) ( not ( = ?auto_193176 ?auto_193178 ) ) ( not ( = ?auto_193176 ?auto_193179 ) ) ( not ( = ?auto_193177 ?auto_193178 ) ) ( not ( = ?auto_193177 ?auto_193179 ) ) ( not ( = ?auto_193178 ?auto_193179 ) ) ( ON ?auto_193177 ?auto_193178 ) ( ON ?auto_193176 ?auto_193177 ) ( ON ?auto_193175 ?auto_193176 ) ( ON ?auto_193174 ?auto_193175 ) ( ON ?auto_193173 ?auto_193174 ) ( ON ?auto_193172 ?auto_193173 ) ( CLEAR ?auto_193170 ) ( ON ?auto_193171 ?auto_193172 ) ( CLEAR ?auto_193171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_193169 ?auto_193170 ?auto_193171 )
      ( MAKE-10PILE ?auto_193169 ?auto_193170 ?auto_193171 ?auto_193172 ?auto_193173 ?auto_193174 ?auto_193175 ?auto_193176 ?auto_193177 ?auto_193178 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_193211 - BLOCK
      ?auto_193212 - BLOCK
      ?auto_193213 - BLOCK
      ?auto_193214 - BLOCK
      ?auto_193215 - BLOCK
      ?auto_193216 - BLOCK
      ?auto_193217 - BLOCK
      ?auto_193218 - BLOCK
      ?auto_193219 - BLOCK
      ?auto_193220 - BLOCK
    )
    :vars
    (
      ?auto_193221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193220 ?auto_193221 ) ( ON-TABLE ?auto_193211 ) ( not ( = ?auto_193211 ?auto_193212 ) ) ( not ( = ?auto_193211 ?auto_193213 ) ) ( not ( = ?auto_193211 ?auto_193214 ) ) ( not ( = ?auto_193211 ?auto_193215 ) ) ( not ( = ?auto_193211 ?auto_193216 ) ) ( not ( = ?auto_193211 ?auto_193217 ) ) ( not ( = ?auto_193211 ?auto_193218 ) ) ( not ( = ?auto_193211 ?auto_193219 ) ) ( not ( = ?auto_193211 ?auto_193220 ) ) ( not ( = ?auto_193211 ?auto_193221 ) ) ( not ( = ?auto_193212 ?auto_193213 ) ) ( not ( = ?auto_193212 ?auto_193214 ) ) ( not ( = ?auto_193212 ?auto_193215 ) ) ( not ( = ?auto_193212 ?auto_193216 ) ) ( not ( = ?auto_193212 ?auto_193217 ) ) ( not ( = ?auto_193212 ?auto_193218 ) ) ( not ( = ?auto_193212 ?auto_193219 ) ) ( not ( = ?auto_193212 ?auto_193220 ) ) ( not ( = ?auto_193212 ?auto_193221 ) ) ( not ( = ?auto_193213 ?auto_193214 ) ) ( not ( = ?auto_193213 ?auto_193215 ) ) ( not ( = ?auto_193213 ?auto_193216 ) ) ( not ( = ?auto_193213 ?auto_193217 ) ) ( not ( = ?auto_193213 ?auto_193218 ) ) ( not ( = ?auto_193213 ?auto_193219 ) ) ( not ( = ?auto_193213 ?auto_193220 ) ) ( not ( = ?auto_193213 ?auto_193221 ) ) ( not ( = ?auto_193214 ?auto_193215 ) ) ( not ( = ?auto_193214 ?auto_193216 ) ) ( not ( = ?auto_193214 ?auto_193217 ) ) ( not ( = ?auto_193214 ?auto_193218 ) ) ( not ( = ?auto_193214 ?auto_193219 ) ) ( not ( = ?auto_193214 ?auto_193220 ) ) ( not ( = ?auto_193214 ?auto_193221 ) ) ( not ( = ?auto_193215 ?auto_193216 ) ) ( not ( = ?auto_193215 ?auto_193217 ) ) ( not ( = ?auto_193215 ?auto_193218 ) ) ( not ( = ?auto_193215 ?auto_193219 ) ) ( not ( = ?auto_193215 ?auto_193220 ) ) ( not ( = ?auto_193215 ?auto_193221 ) ) ( not ( = ?auto_193216 ?auto_193217 ) ) ( not ( = ?auto_193216 ?auto_193218 ) ) ( not ( = ?auto_193216 ?auto_193219 ) ) ( not ( = ?auto_193216 ?auto_193220 ) ) ( not ( = ?auto_193216 ?auto_193221 ) ) ( not ( = ?auto_193217 ?auto_193218 ) ) ( not ( = ?auto_193217 ?auto_193219 ) ) ( not ( = ?auto_193217 ?auto_193220 ) ) ( not ( = ?auto_193217 ?auto_193221 ) ) ( not ( = ?auto_193218 ?auto_193219 ) ) ( not ( = ?auto_193218 ?auto_193220 ) ) ( not ( = ?auto_193218 ?auto_193221 ) ) ( not ( = ?auto_193219 ?auto_193220 ) ) ( not ( = ?auto_193219 ?auto_193221 ) ) ( not ( = ?auto_193220 ?auto_193221 ) ) ( ON ?auto_193219 ?auto_193220 ) ( ON ?auto_193218 ?auto_193219 ) ( ON ?auto_193217 ?auto_193218 ) ( ON ?auto_193216 ?auto_193217 ) ( ON ?auto_193215 ?auto_193216 ) ( ON ?auto_193214 ?auto_193215 ) ( ON ?auto_193213 ?auto_193214 ) ( CLEAR ?auto_193211 ) ( ON ?auto_193212 ?auto_193213 ) ( CLEAR ?auto_193212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_193211 ?auto_193212 )
      ( MAKE-10PILE ?auto_193211 ?auto_193212 ?auto_193213 ?auto_193214 ?auto_193215 ?auto_193216 ?auto_193217 ?auto_193218 ?auto_193219 ?auto_193220 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_193253 - BLOCK
      ?auto_193254 - BLOCK
      ?auto_193255 - BLOCK
      ?auto_193256 - BLOCK
      ?auto_193257 - BLOCK
      ?auto_193258 - BLOCK
      ?auto_193259 - BLOCK
      ?auto_193260 - BLOCK
      ?auto_193261 - BLOCK
      ?auto_193262 - BLOCK
    )
    :vars
    (
      ?auto_193263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193262 ?auto_193263 ) ( not ( = ?auto_193253 ?auto_193254 ) ) ( not ( = ?auto_193253 ?auto_193255 ) ) ( not ( = ?auto_193253 ?auto_193256 ) ) ( not ( = ?auto_193253 ?auto_193257 ) ) ( not ( = ?auto_193253 ?auto_193258 ) ) ( not ( = ?auto_193253 ?auto_193259 ) ) ( not ( = ?auto_193253 ?auto_193260 ) ) ( not ( = ?auto_193253 ?auto_193261 ) ) ( not ( = ?auto_193253 ?auto_193262 ) ) ( not ( = ?auto_193253 ?auto_193263 ) ) ( not ( = ?auto_193254 ?auto_193255 ) ) ( not ( = ?auto_193254 ?auto_193256 ) ) ( not ( = ?auto_193254 ?auto_193257 ) ) ( not ( = ?auto_193254 ?auto_193258 ) ) ( not ( = ?auto_193254 ?auto_193259 ) ) ( not ( = ?auto_193254 ?auto_193260 ) ) ( not ( = ?auto_193254 ?auto_193261 ) ) ( not ( = ?auto_193254 ?auto_193262 ) ) ( not ( = ?auto_193254 ?auto_193263 ) ) ( not ( = ?auto_193255 ?auto_193256 ) ) ( not ( = ?auto_193255 ?auto_193257 ) ) ( not ( = ?auto_193255 ?auto_193258 ) ) ( not ( = ?auto_193255 ?auto_193259 ) ) ( not ( = ?auto_193255 ?auto_193260 ) ) ( not ( = ?auto_193255 ?auto_193261 ) ) ( not ( = ?auto_193255 ?auto_193262 ) ) ( not ( = ?auto_193255 ?auto_193263 ) ) ( not ( = ?auto_193256 ?auto_193257 ) ) ( not ( = ?auto_193256 ?auto_193258 ) ) ( not ( = ?auto_193256 ?auto_193259 ) ) ( not ( = ?auto_193256 ?auto_193260 ) ) ( not ( = ?auto_193256 ?auto_193261 ) ) ( not ( = ?auto_193256 ?auto_193262 ) ) ( not ( = ?auto_193256 ?auto_193263 ) ) ( not ( = ?auto_193257 ?auto_193258 ) ) ( not ( = ?auto_193257 ?auto_193259 ) ) ( not ( = ?auto_193257 ?auto_193260 ) ) ( not ( = ?auto_193257 ?auto_193261 ) ) ( not ( = ?auto_193257 ?auto_193262 ) ) ( not ( = ?auto_193257 ?auto_193263 ) ) ( not ( = ?auto_193258 ?auto_193259 ) ) ( not ( = ?auto_193258 ?auto_193260 ) ) ( not ( = ?auto_193258 ?auto_193261 ) ) ( not ( = ?auto_193258 ?auto_193262 ) ) ( not ( = ?auto_193258 ?auto_193263 ) ) ( not ( = ?auto_193259 ?auto_193260 ) ) ( not ( = ?auto_193259 ?auto_193261 ) ) ( not ( = ?auto_193259 ?auto_193262 ) ) ( not ( = ?auto_193259 ?auto_193263 ) ) ( not ( = ?auto_193260 ?auto_193261 ) ) ( not ( = ?auto_193260 ?auto_193262 ) ) ( not ( = ?auto_193260 ?auto_193263 ) ) ( not ( = ?auto_193261 ?auto_193262 ) ) ( not ( = ?auto_193261 ?auto_193263 ) ) ( not ( = ?auto_193262 ?auto_193263 ) ) ( ON ?auto_193261 ?auto_193262 ) ( ON ?auto_193260 ?auto_193261 ) ( ON ?auto_193259 ?auto_193260 ) ( ON ?auto_193258 ?auto_193259 ) ( ON ?auto_193257 ?auto_193258 ) ( ON ?auto_193256 ?auto_193257 ) ( ON ?auto_193255 ?auto_193256 ) ( ON ?auto_193254 ?auto_193255 ) ( ON ?auto_193253 ?auto_193254 ) ( CLEAR ?auto_193253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_193253 )
      ( MAKE-10PILE ?auto_193253 ?auto_193254 ?auto_193255 ?auto_193256 ?auto_193257 ?auto_193258 ?auto_193259 ?auto_193260 ?auto_193261 ?auto_193262 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_193296 - BLOCK
      ?auto_193297 - BLOCK
      ?auto_193298 - BLOCK
      ?auto_193299 - BLOCK
      ?auto_193300 - BLOCK
      ?auto_193301 - BLOCK
      ?auto_193302 - BLOCK
      ?auto_193303 - BLOCK
      ?auto_193304 - BLOCK
      ?auto_193305 - BLOCK
      ?auto_193306 - BLOCK
    )
    :vars
    (
      ?auto_193307 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_193305 ) ( ON ?auto_193306 ?auto_193307 ) ( CLEAR ?auto_193306 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_193296 ) ( ON ?auto_193297 ?auto_193296 ) ( ON ?auto_193298 ?auto_193297 ) ( ON ?auto_193299 ?auto_193298 ) ( ON ?auto_193300 ?auto_193299 ) ( ON ?auto_193301 ?auto_193300 ) ( ON ?auto_193302 ?auto_193301 ) ( ON ?auto_193303 ?auto_193302 ) ( ON ?auto_193304 ?auto_193303 ) ( ON ?auto_193305 ?auto_193304 ) ( not ( = ?auto_193296 ?auto_193297 ) ) ( not ( = ?auto_193296 ?auto_193298 ) ) ( not ( = ?auto_193296 ?auto_193299 ) ) ( not ( = ?auto_193296 ?auto_193300 ) ) ( not ( = ?auto_193296 ?auto_193301 ) ) ( not ( = ?auto_193296 ?auto_193302 ) ) ( not ( = ?auto_193296 ?auto_193303 ) ) ( not ( = ?auto_193296 ?auto_193304 ) ) ( not ( = ?auto_193296 ?auto_193305 ) ) ( not ( = ?auto_193296 ?auto_193306 ) ) ( not ( = ?auto_193296 ?auto_193307 ) ) ( not ( = ?auto_193297 ?auto_193298 ) ) ( not ( = ?auto_193297 ?auto_193299 ) ) ( not ( = ?auto_193297 ?auto_193300 ) ) ( not ( = ?auto_193297 ?auto_193301 ) ) ( not ( = ?auto_193297 ?auto_193302 ) ) ( not ( = ?auto_193297 ?auto_193303 ) ) ( not ( = ?auto_193297 ?auto_193304 ) ) ( not ( = ?auto_193297 ?auto_193305 ) ) ( not ( = ?auto_193297 ?auto_193306 ) ) ( not ( = ?auto_193297 ?auto_193307 ) ) ( not ( = ?auto_193298 ?auto_193299 ) ) ( not ( = ?auto_193298 ?auto_193300 ) ) ( not ( = ?auto_193298 ?auto_193301 ) ) ( not ( = ?auto_193298 ?auto_193302 ) ) ( not ( = ?auto_193298 ?auto_193303 ) ) ( not ( = ?auto_193298 ?auto_193304 ) ) ( not ( = ?auto_193298 ?auto_193305 ) ) ( not ( = ?auto_193298 ?auto_193306 ) ) ( not ( = ?auto_193298 ?auto_193307 ) ) ( not ( = ?auto_193299 ?auto_193300 ) ) ( not ( = ?auto_193299 ?auto_193301 ) ) ( not ( = ?auto_193299 ?auto_193302 ) ) ( not ( = ?auto_193299 ?auto_193303 ) ) ( not ( = ?auto_193299 ?auto_193304 ) ) ( not ( = ?auto_193299 ?auto_193305 ) ) ( not ( = ?auto_193299 ?auto_193306 ) ) ( not ( = ?auto_193299 ?auto_193307 ) ) ( not ( = ?auto_193300 ?auto_193301 ) ) ( not ( = ?auto_193300 ?auto_193302 ) ) ( not ( = ?auto_193300 ?auto_193303 ) ) ( not ( = ?auto_193300 ?auto_193304 ) ) ( not ( = ?auto_193300 ?auto_193305 ) ) ( not ( = ?auto_193300 ?auto_193306 ) ) ( not ( = ?auto_193300 ?auto_193307 ) ) ( not ( = ?auto_193301 ?auto_193302 ) ) ( not ( = ?auto_193301 ?auto_193303 ) ) ( not ( = ?auto_193301 ?auto_193304 ) ) ( not ( = ?auto_193301 ?auto_193305 ) ) ( not ( = ?auto_193301 ?auto_193306 ) ) ( not ( = ?auto_193301 ?auto_193307 ) ) ( not ( = ?auto_193302 ?auto_193303 ) ) ( not ( = ?auto_193302 ?auto_193304 ) ) ( not ( = ?auto_193302 ?auto_193305 ) ) ( not ( = ?auto_193302 ?auto_193306 ) ) ( not ( = ?auto_193302 ?auto_193307 ) ) ( not ( = ?auto_193303 ?auto_193304 ) ) ( not ( = ?auto_193303 ?auto_193305 ) ) ( not ( = ?auto_193303 ?auto_193306 ) ) ( not ( = ?auto_193303 ?auto_193307 ) ) ( not ( = ?auto_193304 ?auto_193305 ) ) ( not ( = ?auto_193304 ?auto_193306 ) ) ( not ( = ?auto_193304 ?auto_193307 ) ) ( not ( = ?auto_193305 ?auto_193306 ) ) ( not ( = ?auto_193305 ?auto_193307 ) ) ( not ( = ?auto_193306 ?auto_193307 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_193306 ?auto_193307 )
      ( !STACK ?auto_193306 ?auto_193305 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_193342 - BLOCK
      ?auto_193343 - BLOCK
      ?auto_193344 - BLOCK
      ?auto_193345 - BLOCK
      ?auto_193346 - BLOCK
      ?auto_193347 - BLOCK
      ?auto_193348 - BLOCK
      ?auto_193349 - BLOCK
      ?auto_193350 - BLOCK
      ?auto_193351 - BLOCK
      ?auto_193352 - BLOCK
    )
    :vars
    (
      ?auto_193353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193352 ?auto_193353 ) ( ON-TABLE ?auto_193342 ) ( ON ?auto_193343 ?auto_193342 ) ( ON ?auto_193344 ?auto_193343 ) ( ON ?auto_193345 ?auto_193344 ) ( ON ?auto_193346 ?auto_193345 ) ( ON ?auto_193347 ?auto_193346 ) ( ON ?auto_193348 ?auto_193347 ) ( ON ?auto_193349 ?auto_193348 ) ( ON ?auto_193350 ?auto_193349 ) ( not ( = ?auto_193342 ?auto_193343 ) ) ( not ( = ?auto_193342 ?auto_193344 ) ) ( not ( = ?auto_193342 ?auto_193345 ) ) ( not ( = ?auto_193342 ?auto_193346 ) ) ( not ( = ?auto_193342 ?auto_193347 ) ) ( not ( = ?auto_193342 ?auto_193348 ) ) ( not ( = ?auto_193342 ?auto_193349 ) ) ( not ( = ?auto_193342 ?auto_193350 ) ) ( not ( = ?auto_193342 ?auto_193351 ) ) ( not ( = ?auto_193342 ?auto_193352 ) ) ( not ( = ?auto_193342 ?auto_193353 ) ) ( not ( = ?auto_193343 ?auto_193344 ) ) ( not ( = ?auto_193343 ?auto_193345 ) ) ( not ( = ?auto_193343 ?auto_193346 ) ) ( not ( = ?auto_193343 ?auto_193347 ) ) ( not ( = ?auto_193343 ?auto_193348 ) ) ( not ( = ?auto_193343 ?auto_193349 ) ) ( not ( = ?auto_193343 ?auto_193350 ) ) ( not ( = ?auto_193343 ?auto_193351 ) ) ( not ( = ?auto_193343 ?auto_193352 ) ) ( not ( = ?auto_193343 ?auto_193353 ) ) ( not ( = ?auto_193344 ?auto_193345 ) ) ( not ( = ?auto_193344 ?auto_193346 ) ) ( not ( = ?auto_193344 ?auto_193347 ) ) ( not ( = ?auto_193344 ?auto_193348 ) ) ( not ( = ?auto_193344 ?auto_193349 ) ) ( not ( = ?auto_193344 ?auto_193350 ) ) ( not ( = ?auto_193344 ?auto_193351 ) ) ( not ( = ?auto_193344 ?auto_193352 ) ) ( not ( = ?auto_193344 ?auto_193353 ) ) ( not ( = ?auto_193345 ?auto_193346 ) ) ( not ( = ?auto_193345 ?auto_193347 ) ) ( not ( = ?auto_193345 ?auto_193348 ) ) ( not ( = ?auto_193345 ?auto_193349 ) ) ( not ( = ?auto_193345 ?auto_193350 ) ) ( not ( = ?auto_193345 ?auto_193351 ) ) ( not ( = ?auto_193345 ?auto_193352 ) ) ( not ( = ?auto_193345 ?auto_193353 ) ) ( not ( = ?auto_193346 ?auto_193347 ) ) ( not ( = ?auto_193346 ?auto_193348 ) ) ( not ( = ?auto_193346 ?auto_193349 ) ) ( not ( = ?auto_193346 ?auto_193350 ) ) ( not ( = ?auto_193346 ?auto_193351 ) ) ( not ( = ?auto_193346 ?auto_193352 ) ) ( not ( = ?auto_193346 ?auto_193353 ) ) ( not ( = ?auto_193347 ?auto_193348 ) ) ( not ( = ?auto_193347 ?auto_193349 ) ) ( not ( = ?auto_193347 ?auto_193350 ) ) ( not ( = ?auto_193347 ?auto_193351 ) ) ( not ( = ?auto_193347 ?auto_193352 ) ) ( not ( = ?auto_193347 ?auto_193353 ) ) ( not ( = ?auto_193348 ?auto_193349 ) ) ( not ( = ?auto_193348 ?auto_193350 ) ) ( not ( = ?auto_193348 ?auto_193351 ) ) ( not ( = ?auto_193348 ?auto_193352 ) ) ( not ( = ?auto_193348 ?auto_193353 ) ) ( not ( = ?auto_193349 ?auto_193350 ) ) ( not ( = ?auto_193349 ?auto_193351 ) ) ( not ( = ?auto_193349 ?auto_193352 ) ) ( not ( = ?auto_193349 ?auto_193353 ) ) ( not ( = ?auto_193350 ?auto_193351 ) ) ( not ( = ?auto_193350 ?auto_193352 ) ) ( not ( = ?auto_193350 ?auto_193353 ) ) ( not ( = ?auto_193351 ?auto_193352 ) ) ( not ( = ?auto_193351 ?auto_193353 ) ) ( not ( = ?auto_193352 ?auto_193353 ) ) ( CLEAR ?auto_193350 ) ( ON ?auto_193351 ?auto_193352 ) ( CLEAR ?auto_193351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_193342 ?auto_193343 ?auto_193344 ?auto_193345 ?auto_193346 ?auto_193347 ?auto_193348 ?auto_193349 ?auto_193350 ?auto_193351 )
      ( MAKE-11PILE ?auto_193342 ?auto_193343 ?auto_193344 ?auto_193345 ?auto_193346 ?auto_193347 ?auto_193348 ?auto_193349 ?auto_193350 ?auto_193351 ?auto_193352 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_193388 - BLOCK
      ?auto_193389 - BLOCK
      ?auto_193390 - BLOCK
      ?auto_193391 - BLOCK
      ?auto_193392 - BLOCK
      ?auto_193393 - BLOCK
      ?auto_193394 - BLOCK
      ?auto_193395 - BLOCK
      ?auto_193396 - BLOCK
      ?auto_193397 - BLOCK
      ?auto_193398 - BLOCK
    )
    :vars
    (
      ?auto_193399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193398 ?auto_193399 ) ( ON-TABLE ?auto_193388 ) ( ON ?auto_193389 ?auto_193388 ) ( ON ?auto_193390 ?auto_193389 ) ( ON ?auto_193391 ?auto_193390 ) ( ON ?auto_193392 ?auto_193391 ) ( ON ?auto_193393 ?auto_193392 ) ( ON ?auto_193394 ?auto_193393 ) ( ON ?auto_193395 ?auto_193394 ) ( not ( = ?auto_193388 ?auto_193389 ) ) ( not ( = ?auto_193388 ?auto_193390 ) ) ( not ( = ?auto_193388 ?auto_193391 ) ) ( not ( = ?auto_193388 ?auto_193392 ) ) ( not ( = ?auto_193388 ?auto_193393 ) ) ( not ( = ?auto_193388 ?auto_193394 ) ) ( not ( = ?auto_193388 ?auto_193395 ) ) ( not ( = ?auto_193388 ?auto_193396 ) ) ( not ( = ?auto_193388 ?auto_193397 ) ) ( not ( = ?auto_193388 ?auto_193398 ) ) ( not ( = ?auto_193388 ?auto_193399 ) ) ( not ( = ?auto_193389 ?auto_193390 ) ) ( not ( = ?auto_193389 ?auto_193391 ) ) ( not ( = ?auto_193389 ?auto_193392 ) ) ( not ( = ?auto_193389 ?auto_193393 ) ) ( not ( = ?auto_193389 ?auto_193394 ) ) ( not ( = ?auto_193389 ?auto_193395 ) ) ( not ( = ?auto_193389 ?auto_193396 ) ) ( not ( = ?auto_193389 ?auto_193397 ) ) ( not ( = ?auto_193389 ?auto_193398 ) ) ( not ( = ?auto_193389 ?auto_193399 ) ) ( not ( = ?auto_193390 ?auto_193391 ) ) ( not ( = ?auto_193390 ?auto_193392 ) ) ( not ( = ?auto_193390 ?auto_193393 ) ) ( not ( = ?auto_193390 ?auto_193394 ) ) ( not ( = ?auto_193390 ?auto_193395 ) ) ( not ( = ?auto_193390 ?auto_193396 ) ) ( not ( = ?auto_193390 ?auto_193397 ) ) ( not ( = ?auto_193390 ?auto_193398 ) ) ( not ( = ?auto_193390 ?auto_193399 ) ) ( not ( = ?auto_193391 ?auto_193392 ) ) ( not ( = ?auto_193391 ?auto_193393 ) ) ( not ( = ?auto_193391 ?auto_193394 ) ) ( not ( = ?auto_193391 ?auto_193395 ) ) ( not ( = ?auto_193391 ?auto_193396 ) ) ( not ( = ?auto_193391 ?auto_193397 ) ) ( not ( = ?auto_193391 ?auto_193398 ) ) ( not ( = ?auto_193391 ?auto_193399 ) ) ( not ( = ?auto_193392 ?auto_193393 ) ) ( not ( = ?auto_193392 ?auto_193394 ) ) ( not ( = ?auto_193392 ?auto_193395 ) ) ( not ( = ?auto_193392 ?auto_193396 ) ) ( not ( = ?auto_193392 ?auto_193397 ) ) ( not ( = ?auto_193392 ?auto_193398 ) ) ( not ( = ?auto_193392 ?auto_193399 ) ) ( not ( = ?auto_193393 ?auto_193394 ) ) ( not ( = ?auto_193393 ?auto_193395 ) ) ( not ( = ?auto_193393 ?auto_193396 ) ) ( not ( = ?auto_193393 ?auto_193397 ) ) ( not ( = ?auto_193393 ?auto_193398 ) ) ( not ( = ?auto_193393 ?auto_193399 ) ) ( not ( = ?auto_193394 ?auto_193395 ) ) ( not ( = ?auto_193394 ?auto_193396 ) ) ( not ( = ?auto_193394 ?auto_193397 ) ) ( not ( = ?auto_193394 ?auto_193398 ) ) ( not ( = ?auto_193394 ?auto_193399 ) ) ( not ( = ?auto_193395 ?auto_193396 ) ) ( not ( = ?auto_193395 ?auto_193397 ) ) ( not ( = ?auto_193395 ?auto_193398 ) ) ( not ( = ?auto_193395 ?auto_193399 ) ) ( not ( = ?auto_193396 ?auto_193397 ) ) ( not ( = ?auto_193396 ?auto_193398 ) ) ( not ( = ?auto_193396 ?auto_193399 ) ) ( not ( = ?auto_193397 ?auto_193398 ) ) ( not ( = ?auto_193397 ?auto_193399 ) ) ( not ( = ?auto_193398 ?auto_193399 ) ) ( ON ?auto_193397 ?auto_193398 ) ( CLEAR ?auto_193395 ) ( ON ?auto_193396 ?auto_193397 ) ( CLEAR ?auto_193396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_193388 ?auto_193389 ?auto_193390 ?auto_193391 ?auto_193392 ?auto_193393 ?auto_193394 ?auto_193395 ?auto_193396 )
      ( MAKE-11PILE ?auto_193388 ?auto_193389 ?auto_193390 ?auto_193391 ?auto_193392 ?auto_193393 ?auto_193394 ?auto_193395 ?auto_193396 ?auto_193397 ?auto_193398 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_193434 - BLOCK
      ?auto_193435 - BLOCK
      ?auto_193436 - BLOCK
      ?auto_193437 - BLOCK
      ?auto_193438 - BLOCK
      ?auto_193439 - BLOCK
      ?auto_193440 - BLOCK
      ?auto_193441 - BLOCK
      ?auto_193442 - BLOCK
      ?auto_193443 - BLOCK
      ?auto_193444 - BLOCK
    )
    :vars
    (
      ?auto_193445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193444 ?auto_193445 ) ( ON-TABLE ?auto_193434 ) ( ON ?auto_193435 ?auto_193434 ) ( ON ?auto_193436 ?auto_193435 ) ( ON ?auto_193437 ?auto_193436 ) ( ON ?auto_193438 ?auto_193437 ) ( ON ?auto_193439 ?auto_193438 ) ( ON ?auto_193440 ?auto_193439 ) ( not ( = ?auto_193434 ?auto_193435 ) ) ( not ( = ?auto_193434 ?auto_193436 ) ) ( not ( = ?auto_193434 ?auto_193437 ) ) ( not ( = ?auto_193434 ?auto_193438 ) ) ( not ( = ?auto_193434 ?auto_193439 ) ) ( not ( = ?auto_193434 ?auto_193440 ) ) ( not ( = ?auto_193434 ?auto_193441 ) ) ( not ( = ?auto_193434 ?auto_193442 ) ) ( not ( = ?auto_193434 ?auto_193443 ) ) ( not ( = ?auto_193434 ?auto_193444 ) ) ( not ( = ?auto_193434 ?auto_193445 ) ) ( not ( = ?auto_193435 ?auto_193436 ) ) ( not ( = ?auto_193435 ?auto_193437 ) ) ( not ( = ?auto_193435 ?auto_193438 ) ) ( not ( = ?auto_193435 ?auto_193439 ) ) ( not ( = ?auto_193435 ?auto_193440 ) ) ( not ( = ?auto_193435 ?auto_193441 ) ) ( not ( = ?auto_193435 ?auto_193442 ) ) ( not ( = ?auto_193435 ?auto_193443 ) ) ( not ( = ?auto_193435 ?auto_193444 ) ) ( not ( = ?auto_193435 ?auto_193445 ) ) ( not ( = ?auto_193436 ?auto_193437 ) ) ( not ( = ?auto_193436 ?auto_193438 ) ) ( not ( = ?auto_193436 ?auto_193439 ) ) ( not ( = ?auto_193436 ?auto_193440 ) ) ( not ( = ?auto_193436 ?auto_193441 ) ) ( not ( = ?auto_193436 ?auto_193442 ) ) ( not ( = ?auto_193436 ?auto_193443 ) ) ( not ( = ?auto_193436 ?auto_193444 ) ) ( not ( = ?auto_193436 ?auto_193445 ) ) ( not ( = ?auto_193437 ?auto_193438 ) ) ( not ( = ?auto_193437 ?auto_193439 ) ) ( not ( = ?auto_193437 ?auto_193440 ) ) ( not ( = ?auto_193437 ?auto_193441 ) ) ( not ( = ?auto_193437 ?auto_193442 ) ) ( not ( = ?auto_193437 ?auto_193443 ) ) ( not ( = ?auto_193437 ?auto_193444 ) ) ( not ( = ?auto_193437 ?auto_193445 ) ) ( not ( = ?auto_193438 ?auto_193439 ) ) ( not ( = ?auto_193438 ?auto_193440 ) ) ( not ( = ?auto_193438 ?auto_193441 ) ) ( not ( = ?auto_193438 ?auto_193442 ) ) ( not ( = ?auto_193438 ?auto_193443 ) ) ( not ( = ?auto_193438 ?auto_193444 ) ) ( not ( = ?auto_193438 ?auto_193445 ) ) ( not ( = ?auto_193439 ?auto_193440 ) ) ( not ( = ?auto_193439 ?auto_193441 ) ) ( not ( = ?auto_193439 ?auto_193442 ) ) ( not ( = ?auto_193439 ?auto_193443 ) ) ( not ( = ?auto_193439 ?auto_193444 ) ) ( not ( = ?auto_193439 ?auto_193445 ) ) ( not ( = ?auto_193440 ?auto_193441 ) ) ( not ( = ?auto_193440 ?auto_193442 ) ) ( not ( = ?auto_193440 ?auto_193443 ) ) ( not ( = ?auto_193440 ?auto_193444 ) ) ( not ( = ?auto_193440 ?auto_193445 ) ) ( not ( = ?auto_193441 ?auto_193442 ) ) ( not ( = ?auto_193441 ?auto_193443 ) ) ( not ( = ?auto_193441 ?auto_193444 ) ) ( not ( = ?auto_193441 ?auto_193445 ) ) ( not ( = ?auto_193442 ?auto_193443 ) ) ( not ( = ?auto_193442 ?auto_193444 ) ) ( not ( = ?auto_193442 ?auto_193445 ) ) ( not ( = ?auto_193443 ?auto_193444 ) ) ( not ( = ?auto_193443 ?auto_193445 ) ) ( not ( = ?auto_193444 ?auto_193445 ) ) ( ON ?auto_193443 ?auto_193444 ) ( ON ?auto_193442 ?auto_193443 ) ( CLEAR ?auto_193440 ) ( ON ?auto_193441 ?auto_193442 ) ( CLEAR ?auto_193441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_193434 ?auto_193435 ?auto_193436 ?auto_193437 ?auto_193438 ?auto_193439 ?auto_193440 ?auto_193441 )
      ( MAKE-11PILE ?auto_193434 ?auto_193435 ?auto_193436 ?auto_193437 ?auto_193438 ?auto_193439 ?auto_193440 ?auto_193441 ?auto_193442 ?auto_193443 ?auto_193444 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_193480 - BLOCK
      ?auto_193481 - BLOCK
      ?auto_193482 - BLOCK
      ?auto_193483 - BLOCK
      ?auto_193484 - BLOCK
      ?auto_193485 - BLOCK
      ?auto_193486 - BLOCK
      ?auto_193487 - BLOCK
      ?auto_193488 - BLOCK
      ?auto_193489 - BLOCK
      ?auto_193490 - BLOCK
    )
    :vars
    (
      ?auto_193491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193490 ?auto_193491 ) ( ON-TABLE ?auto_193480 ) ( ON ?auto_193481 ?auto_193480 ) ( ON ?auto_193482 ?auto_193481 ) ( ON ?auto_193483 ?auto_193482 ) ( ON ?auto_193484 ?auto_193483 ) ( ON ?auto_193485 ?auto_193484 ) ( not ( = ?auto_193480 ?auto_193481 ) ) ( not ( = ?auto_193480 ?auto_193482 ) ) ( not ( = ?auto_193480 ?auto_193483 ) ) ( not ( = ?auto_193480 ?auto_193484 ) ) ( not ( = ?auto_193480 ?auto_193485 ) ) ( not ( = ?auto_193480 ?auto_193486 ) ) ( not ( = ?auto_193480 ?auto_193487 ) ) ( not ( = ?auto_193480 ?auto_193488 ) ) ( not ( = ?auto_193480 ?auto_193489 ) ) ( not ( = ?auto_193480 ?auto_193490 ) ) ( not ( = ?auto_193480 ?auto_193491 ) ) ( not ( = ?auto_193481 ?auto_193482 ) ) ( not ( = ?auto_193481 ?auto_193483 ) ) ( not ( = ?auto_193481 ?auto_193484 ) ) ( not ( = ?auto_193481 ?auto_193485 ) ) ( not ( = ?auto_193481 ?auto_193486 ) ) ( not ( = ?auto_193481 ?auto_193487 ) ) ( not ( = ?auto_193481 ?auto_193488 ) ) ( not ( = ?auto_193481 ?auto_193489 ) ) ( not ( = ?auto_193481 ?auto_193490 ) ) ( not ( = ?auto_193481 ?auto_193491 ) ) ( not ( = ?auto_193482 ?auto_193483 ) ) ( not ( = ?auto_193482 ?auto_193484 ) ) ( not ( = ?auto_193482 ?auto_193485 ) ) ( not ( = ?auto_193482 ?auto_193486 ) ) ( not ( = ?auto_193482 ?auto_193487 ) ) ( not ( = ?auto_193482 ?auto_193488 ) ) ( not ( = ?auto_193482 ?auto_193489 ) ) ( not ( = ?auto_193482 ?auto_193490 ) ) ( not ( = ?auto_193482 ?auto_193491 ) ) ( not ( = ?auto_193483 ?auto_193484 ) ) ( not ( = ?auto_193483 ?auto_193485 ) ) ( not ( = ?auto_193483 ?auto_193486 ) ) ( not ( = ?auto_193483 ?auto_193487 ) ) ( not ( = ?auto_193483 ?auto_193488 ) ) ( not ( = ?auto_193483 ?auto_193489 ) ) ( not ( = ?auto_193483 ?auto_193490 ) ) ( not ( = ?auto_193483 ?auto_193491 ) ) ( not ( = ?auto_193484 ?auto_193485 ) ) ( not ( = ?auto_193484 ?auto_193486 ) ) ( not ( = ?auto_193484 ?auto_193487 ) ) ( not ( = ?auto_193484 ?auto_193488 ) ) ( not ( = ?auto_193484 ?auto_193489 ) ) ( not ( = ?auto_193484 ?auto_193490 ) ) ( not ( = ?auto_193484 ?auto_193491 ) ) ( not ( = ?auto_193485 ?auto_193486 ) ) ( not ( = ?auto_193485 ?auto_193487 ) ) ( not ( = ?auto_193485 ?auto_193488 ) ) ( not ( = ?auto_193485 ?auto_193489 ) ) ( not ( = ?auto_193485 ?auto_193490 ) ) ( not ( = ?auto_193485 ?auto_193491 ) ) ( not ( = ?auto_193486 ?auto_193487 ) ) ( not ( = ?auto_193486 ?auto_193488 ) ) ( not ( = ?auto_193486 ?auto_193489 ) ) ( not ( = ?auto_193486 ?auto_193490 ) ) ( not ( = ?auto_193486 ?auto_193491 ) ) ( not ( = ?auto_193487 ?auto_193488 ) ) ( not ( = ?auto_193487 ?auto_193489 ) ) ( not ( = ?auto_193487 ?auto_193490 ) ) ( not ( = ?auto_193487 ?auto_193491 ) ) ( not ( = ?auto_193488 ?auto_193489 ) ) ( not ( = ?auto_193488 ?auto_193490 ) ) ( not ( = ?auto_193488 ?auto_193491 ) ) ( not ( = ?auto_193489 ?auto_193490 ) ) ( not ( = ?auto_193489 ?auto_193491 ) ) ( not ( = ?auto_193490 ?auto_193491 ) ) ( ON ?auto_193489 ?auto_193490 ) ( ON ?auto_193488 ?auto_193489 ) ( ON ?auto_193487 ?auto_193488 ) ( CLEAR ?auto_193485 ) ( ON ?auto_193486 ?auto_193487 ) ( CLEAR ?auto_193486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193480 ?auto_193481 ?auto_193482 ?auto_193483 ?auto_193484 ?auto_193485 ?auto_193486 )
      ( MAKE-11PILE ?auto_193480 ?auto_193481 ?auto_193482 ?auto_193483 ?auto_193484 ?auto_193485 ?auto_193486 ?auto_193487 ?auto_193488 ?auto_193489 ?auto_193490 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_193526 - BLOCK
      ?auto_193527 - BLOCK
      ?auto_193528 - BLOCK
      ?auto_193529 - BLOCK
      ?auto_193530 - BLOCK
      ?auto_193531 - BLOCK
      ?auto_193532 - BLOCK
      ?auto_193533 - BLOCK
      ?auto_193534 - BLOCK
      ?auto_193535 - BLOCK
      ?auto_193536 - BLOCK
    )
    :vars
    (
      ?auto_193537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193536 ?auto_193537 ) ( ON-TABLE ?auto_193526 ) ( ON ?auto_193527 ?auto_193526 ) ( ON ?auto_193528 ?auto_193527 ) ( ON ?auto_193529 ?auto_193528 ) ( ON ?auto_193530 ?auto_193529 ) ( not ( = ?auto_193526 ?auto_193527 ) ) ( not ( = ?auto_193526 ?auto_193528 ) ) ( not ( = ?auto_193526 ?auto_193529 ) ) ( not ( = ?auto_193526 ?auto_193530 ) ) ( not ( = ?auto_193526 ?auto_193531 ) ) ( not ( = ?auto_193526 ?auto_193532 ) ) ( not ( = ?auto_193526 ?auto_193533 ) ) ( not ( = ?auto_193526 ?auto_193534 ) ) ( not ( = ?auto_193526 ?auto_193535 ) ) ( not ( = ?auto_193526 ?auto_193536 ) ) ( not ( = ?auto_193526 ?auto_193537 ) ) ( not ( = ?auto_193527 ?auto_193528 ) ) ( not ( = ?auto_193527 ?auto_193529 ) ) ( not ( = ?auto_193527 ?auto_193530 ) ) ( not ( = ?auto_193527 ?auto_193531 ) ) ( not ( = ?auto_193527 ?auto_193532 ) ) ( not ( = ?auto_193527 ?auto_193533 ) ) ( not ( = ?auto_193527 ?auto_193534 ) ) ( not ( = ?auto_193527 ?auto_193535 ) ) ( not ( = ?auto_193527 ?auto_193536 ) ) ( not ( = ?auto_193527 ?auto_193537 ) ) ( not ( = ?auto_193528 ?auto_193529 ) ) ( not ( = ?auto_193528 ?auto_193530 ) ) ( not ( = ?auto_193528 ?auto_193531 ) ) ( not ( = ?auto_193528 ?auto_193532 ) ) ( not ( = ?auto_193528 ?auto_193533 ) ) ( not ( = ?auto_193528 ?auto_193534 ) ) ( not ( = ?auto_193528 ?auto_193535 ) ) ( not ( = ?auto_193528 ?auto_193536 ) ) ( not ( = ?auto_193528 ?auto_193537 ) ) ( not ( = ?auto_193529 ?auto_193530 ) ) ( not ( = ?auto_193529 ?auto_193531 ) ) ( not ( = ?auto_193529 ?auto_193532 ) ) ( not ( = ?auto_193529 ?auto_193533 ) ) ( not ( = ?auto_193529 ?auto_193534 ) ) ( not ( = ?auto_193529 ?auto_193535 ) ) ( not ( = ?auto_193529 ?auto_193536 ) ) ( not ( = ?auto_193529 ?auto_193537 ) ) ( not ( = ?auto_193530 ?auto_193531 ) ) ( not ( = ?auto_193530 ?auto_193532 ) ) ( not ( = ?auto_193530 ?auto_193533 ) ) ( not ( = ?auto_193530 ?auto_193534 ) ) ( not ( = ?auto_193530 ?auto_193535 ) ) ( not ( = ?auto_193530 ?auto_193536 ) ) ( not ( = ?auto_193530 ?auto_193537 ) ) ( not ( = ?auto_193531 ?auto_193532 ) ) ( not ( = ?auto_193531 ?auto_193533 ) ) ( not ( = ?auto_193531 ?auto_193534 ) ) ( not ( = ?auto_193531 ?auto_193535 ) ) ( not ( = ?auto_193531 ?auto_193536 ) ) ( not ( = ?auto_193531 ?auto_193537 ) ) ( not ( = ?auto_193532 ?auto_193533 ) ) ( not ( = ?auto_193532 ?auto_193534 ) ) ( not ( = ?auto_193532 ?auto_193535 ) ) ( not ( = ?auto_193532 ?auto_193536 ) ) ( not ( = ?auto_193532 ?auto_193537 ) ) ( not ( = ?auto_193533 ?auto_193534 ) ) ( not ( = ?auto_193533 ?auto_193535 ) ) ( not ( = ?auto_193533 ?auto_193536 ) ) ( not ( = ?auto_193533 ?auto_193537 ) ) ( not ( = ?auto_193534 ?auto_193535 ) ) ( not ( = ?auto_193534 ?auto_193536 ) ) ( not ( = ?auto_193534 ?auto_193537 ) ) ( not ( = ?auto_193535 ?auto_193536 ) ) ( not ( = ?auto_193535 ?auto_193537 ) ) ( not ( = ?auto_193536 ?auto_193537 ) ) ( ON ?auto_193535 ?auto_193536 ) ( ON ?auto_193534 ?auto_193535 ) ( ON ?auto_193533 ?auto_193534 ) ( ON ?auto_193532 ?auto_193533 ) ( CLEAR ?auto_193530 ) ( ON ?auto_193531 ?auto_193532 ) ( CLEAR ?auto_193531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193526 ?auto_193527 ?auto_193528 ?auto_193529 ?auto_193530 ?auto_193531 )
      ( MAKE-11PILE ?auto_193526 ?auto_193527 ?auto_193528 ?auto_193529 ?auto_193530 ?auto_193531 ?auto_193532 ?auto_193533 ?auto_193534 ?auto_193535 ?auto_193536 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_193572 - BLOCK
      ?auto_193573 - BLOCK
      ?auto_193574 - BLOCK
      ?auto_193575 - BLOCK
      ?auto_193576 - BLOCK
      ?auto_193577 - BLOCK
      ?auto_193578 - BLOCK
      ?auto_193579 - BLOCK
      ?auto_193580 - BLOCK
      ?auto_193581 - BLOCK
      ?auto_193582 - BLOCK
    )
    :vars
    (
      ?auto_193583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193582 ?auto_193583 ) ( ON-TABLE ?auto_193572 ) ( ON ?auto_193573 ?auto_193572 ) ( ON ?auto_193574 ?auto_193573 ) ( ON ?auto_193575 ?auto_193574 ) ( not ( = ?auto_193572 ?auto_193573 ) ) ( not ( = ?auto_193572 ?auto_193574 ) ) ( not ( = ?auto_193572 ?auto_193575 ) ) ( not ( = ?auto_193572 ?auto_193576 ) ) ( not ( = ?auto_193572 ?auto_193577 ) ) ( not ( = ?auto_193572 ?auto_193578 ) ) ( not ( = ?auto_193572 ?auto_193579 ) ) ( not ( = ?auto_193572 ?auto_193580 ) ) ( not ( = ?auto_193572 ?auto_193581 ) ) ( not ( = ?auto_193572 ?auto_193582 ) ) ( not ( = ?auto_193572 ?auto_193583 ) ) ( not ( = ?auto_193573 ?auto_193574 ) ) ( not ( = ?auto_193573 ?auto_193575 ) ) ( not ( = ?auto_193573 ?auto_193576 ) ) ( not ( = ?auto_193573 ?auto_193577 ) ) ( not ( = ?auto_193573 ?auto_193578 ) ) ( not ( = ?auto_193573 ?auto_193579 ) ) ( not ( = ?auto_193573 ?auto_193580 ) ) ( not ( = ?auto_193573 ?auto_193581 ) ) ( not ( = ?auto_193573 ?auto_193582 ) ) ( not ( = ?auto_193573 ?auto_193583 ) ) ( not ( = ?auto_193574 ?auto_193575 ) ) ( not ( = ?auto_193574 ?auto_193576 ) ) ( not ( = ?auto_193574 ?auto_193577 ) ) ( not ( = ?auto_193574 ?auto_193578 ) ) ( not ( = ?auto_193574 ?auto_193579 ) ) ( not ( = ?auto_193574 ?auto_193580 ) ) ( not ( = ?auto_193574 ?auto_193581 ) ) ( not ( = ?auto_193574 ?auto_193582 ) ) ( not ( = ?auto_193574 ?auto_193583 ) ) ( not ( = ?auto_193575 ?auto_193576 ) ) ( not ( = ?auto_193575 ?auto_193577 ) ) ( not ( = ?auto_193575 ?auto_193578 ) ) ( not ( = ?auto_193575 ?auto_193579 ) ) ( not ( = ?auto_193575 ?auto_193580 ) ) ( not ( = ?auto_193575 ?auto_193581 ) ) ( not ( = ?auto_193575 ?auto_193582 ) ) ( not ( = ?auto_193575 ?auto_193583 ) ) ( not ( = ?auto_193576 ?auto_193577 ) ) ( not ( = ?auto_193576 ?auto_193578 ) ) ( not ( = ?auto_193576 ?auto_193579 ) ) ( not ( = ?auto_193576 ?auto_193580 ) ) ( not ( = ?auto_193576 ?auto_193581 ) ) ( not ( = ?auto_193576 ?auto_193582 ) ) ( not ( = ?auto_193576 ?auto_193583 ) ) ( not ( = ?auto_193577 ?auto_193578 ) ) ( not ( = ?auto_193577 ?auto_193579 ) ) ( not ( = ?auto_193577 ?auto_193580 ) ) ( not ( = ?auto_193577 ?auto_193581 ) ) ( not ( = ?auto_193577 ?auto_193582 ) ) ( not ( = ?auto_193577 ?auto_193583 ) ) ( not ( = ?auto_193578 ?auto_193579 ) ) ( not ( = ?auto_193578 ?auto_193580 ) ) ( not ( = ?auto_193578 ?auto_193581 ) ) ( not ( = ?auto_193578 ?auto_193582 ) ) ( not ( = ?auto_193578 ?auto_193583 ) ) ( not ( = ?auto_193579 ?auto_193580 ) ) ( not ( = ?auto_193579 ?auto_193581 ) ) ( not ( = ?auto_193579 ?auto_193582 ) ) ( not ( = ?auto_193579 ?auto_193583 ) ) ( not ( = ?auto_193580 ?auto_193581 ) ) ( not ( = ?auto_193580 ?auto_193582 ) ) ( not ( = ?auto_193580 ?auto_193583 ) ) ( not ( = ?auto_193581 ?auto_193582 ) ) ( not ( = ?auto_193581 ?auto_193583 ) ) ( not ( = ?auto_193582 ?auto_193583 ) ) ( ON ?auto_193581 ?auto_193582 ) ( ON ?auto_193580 ?auto_193581 ) ( ON ?auto_193579 ?auto_193580 ) ( ON ?auto_193578 ?auto_193579 ) ( ON ?auto_193577 ?auto_193578 ) ( CLEAR ?auto_193575 ) ( ON ?auto_193576 ?auto_193577 ) ( CLEAR ?auto_193576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_193572 ?auto_193573 ?auto_193574 ?auto_193575 ?auto_193576 )
      ( MAKE-11PILE ?auto_193572 ?auto_193573 ?auto_193574 ?auto_193575 ?auto_193576 ?auto_193577 ?auto_193578 ?auto_193579 ?auto_193580 ?auto_193581 ?auto_193582 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_193618 - BLOCK
      ?auto_193619 - BLOCK
      ?auto_193620 - BLOCK
      ?auto_193621 - BLOCK
      ?auto_193622 - BLOCK
      ?auto_193623 - BLOCK
      ?auto_193624 - BLOCK
      ?auto_193625 - BLOCK
      ?auto_193626 - BLOCK
      ?auto_193627 - BLOCK
      ?auto_193628 - BLOCK
    )
    :vars
    (
      ?auto_193629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193628 ?auto_193629 ) ( ON-TABLE ?auto_193618 ) ( ON ?auto_193619 ?auto_193618 ) ( ON ?auto_193620 ?auto_193619 ) ( not ( = ?auto_193618 ?auto_193619 ) ) ( not ( = ?auto_193618 ?auto_193620 ) ) ( not ( = ?auto_193618 ?auto_193621 ) ) ( not ( = ?auto_193618 ?auto_193622 ) ) ( not ( = ?auto_193618 ?auto_193623 ) ) ( not ( = ?auto_193618 ?auto_193624 ) ) ( not ( = ?auto_193618 ?auto_193625 ) ) ( not ( = ?auto_193618 ?auto_193626 ) ) ( not ( = ?auto_193618 ?auto_193627 ) ) ( not ( = ?auto_193618 ?auto_193628 ) ) ( not ( = ?auto_193618 ?auto_193629 ) ) ( not ( = ?auto_193619 ?auto_193620 ) ) ( not ( = ?auto_193619 ?auto_193621 ) ) ( not ( = ?auto_193619 ?auto_193622 ) ) ( not ( = ?auto_193619 ?auto_193623 ) ) ( not ( = ?auto_193619 ?auto_193624 ) ) ( not ( = ?auto_193619 ?auto_193625 ) ) ( not ( = ?auto_193619 ?auto_193626 ) ) ( not ( = ?auto_193619 ?auto_193627 ) ) ( not ( = ?auto_193619 ?auto_193628 ) ) ( not ( = ?auto_193619 ?auto_193629 ) ) ( not ( = ?auto_193620 ?auto_193621 ) ) ( not ( = ?auto_193620 ?auto_193622 ) ) ( not ( = ?auto_193620 ?auto_193623 ) ) ( not ( = ?auto_193620 ?auto_193624 ) ) ( not ( = ?auto_193620 ?auto_193625 ) ) ( not ( = ?auto_193620 ?auto_193626 ) ) ( not ( = ?auto_193620 ?auto_193627 ) ) ( not ( = ?auto_193620 ?auto_193628 ) ) ( not ( = ?auto_193620 ?auto_193629 ) ) ( not ( = ?auto_193621 ?auto_193622 ) ) ( not ( = ?auto_193621 ?auto_193623 ) ) ( not ( = ?auto_193621 ?auto_193624 ) ) ( not ( = ?auto_193621 ?auto_193625 ) ) ( not ( = ?auto_193621 ?auto_193626 ) ) ( not ( = ?auto_193621 ?auto_193627 ) ) ( not ( = ?auto_193621 ?auto_193628 ) ) ( not ( = ?auto_193621 ?auto_193629 ) ) ( not ( = ?auto_193622 ?auto_193623 ) ) ( not ( = ?auto_193622 ?auto_193624 ) ) ( not ( = ?auto_193622 ?auto_193625 ) ) ( not ( = ?auto_193622 ?auto_193626 ) ) ( not ( = ?auto_193622 ?auto_193627 ) ) ( not ( = ?auto_193622 ?auto_193628 ) ) ( not ( = ?auto_193622 ?auto_193629 ) ) ( not ( = ?auto_193623 ?auto_193624 ) ) ( not ( = ?auto_193623 ?auto_193625 ) ) ( not ( = ?auto_193623 ?auto_193626 ) ) ( not ( = ?auto_193623 ?auto_193627 ) ) ( not ( = ?auto_193623 ?auto_193628 ) ) ( not ( = ?auto_193623 ?auto_193629 ) ) ( not ( = ?auto_193624 ?auto_193625 ) ) ( not ( = ?auto_193624 ?auto_193626 ) ) ( not ( = ?auto_193624 ?auto_193627 ) ) ( not ( = ?auto_193624 ?auto_193628 ) ) ( not ( = ?auto_193624 ?auto_193629 ) ) ( not ( = ?auto_193625 ?auto_193626 ) ) ( not ( = ?auto_193625 ?auto_193627 ) ) ( not ( = ?auto_193625 ?auto_193628 ) ) ( not ( = ?auto_193625 ?auto_193629 ) ) ( not ( = ?auto_193626 ?auto_193627 ) ) ( not ( = ?auto_193626 ?auto_193628 ) ) ( not ( = ?auto_193626 ?auto_193629 ) ) ( not ( = ?auto_193627 ?auto_193628 ) ) ( not ( = ?auto_193627 ?auto_193629 ) ) ( not ( = ?auto_193628 ?auto_193629 ) ) ( ON ?auto_193627 ?auto_193628 ) ( ON ?auto_193626 ?auto_193627 ) ( ON ?auto_193625 ?auto_193626 ) ( ON ?auto_193624 ?auto_193625 ) ( ON ?auto_193623 ?auto_193624 ) ( ON ?auto_193622 ?auto_193623 ) ( CLEAR ?auto_193620 ) ( ON ?auto_193621 ?auto_193622 ) ( CLEAR ?auto_193621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_193618 ?auto_193619 ?auto_193620 ?auto_193621 )
      ( MAKE-11PILE ?auto_193618 ?auto_193619 ?auto_193620 ?auto_193621 ?auto_193622 ?auto_193623 ?auto_193624 ?auto_193625 ?auto_193626 ?auto_193627 ?auto_193628 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_193664 - BLOCK
      ?auto_193665 - BLOCK
      ?auto_193666 - BLOCK
      ?auto_193667 - BLOCK
      ?auto_193668 - BLOCK
      ?auto_193669 - BLOCK
      ?auto_193670 - BLOCK
      ?auto_193671 - BLOCK
      ?auto_193672 - BLOCK
      ?auto_193673 - BLOCK
      ?auto_193674 - BLOCK
    )
    :vars
    (
      ?auto_193675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193674 ?auto_193675 ) ( ON-TABLE ?auto_193664 ) ( ON ?auto_193665 ?auto_193664 ) ( not ( = ?auto_193664 ?auto_193665 ) ) ( not ( = ?auto_193664 ?auto_193666 ) ) ( not ( = ?auto_193664 ?auto_193667 ) ) ( not ( = ?auto_193664 ?auto_193668 ) ) ( not ( = ?auto_193664 ?auto_193669 ) ) ( not ( = ?auto_193664 ?auto_193670 ) ) ( not ( = ?auto_193664 ?auto_193671 ) ) ( not ( = ?auto_193664 ?auto_193672 ) ) ( not ( = ?auto_193664 ?auto_193673 ) ) ( not ( = ?auto_193664 ?auto_193674 ) ) ( not ( = ?auto_193664 ?auto_193675 ) ) ( not ( = ?auto_193665 ?auto_193666 ) ) ( not ( = ?auto_193665 ?auto_193667 ) ) ( not ( = ?auto_193665 ?auto_193668 ) ) ( not ( = ?auto_193665 ?auto_193669 ) ) ( not ( = ?auto_193665 ?auto_193670 ) ) ( not ( = ?auto_193665 ?auto_193671 ) ) ( not ( = ?auto_193665 ?auto_193672 ) ) ( not ( = ?auto_193665 ?auto_193673 ) ) ( not ( = ?auto_193665 ?auto_193674 ) ) ( not ( = ?auto_193665 ?auto_193675 ) ) ( not ( = ?auto_193666 ?auto_193667 ) ) ( not ( = ?auto_193666 ?auto_193668 ) ) ( not ( = ?auto_193666 ?auto_193669 ) ) ( not ( = ?auto_193666 ?auto_193670 ) ) ( not ( = ?auto_193666 ?auto_193671 ) ) ( not ( = ?auto_193666 ?auto_193672 ) ) ( not ( = ?auto_193666 ?auto_193673 ) ) ( not ( = ?auto_193666 ?auto_193674 ) ) ( not ( = ?auto_193666 ?auto_193675 ) ) ( not ( = ?auto_193667 ?auto_193668 ) ) ( not ( = ?auto_193667 ?auto_193669 ) ) ( not ( = ?auto_193667 ?auto_193670 ) ) ( not ( = ?auto_193667 ?auto_193671 ) ) ( not ( = ?auto_193667 ?auto_193672 ) ) ( not ( = ?auto_193667 ?auto_193673 ) ) ( not ( = ?auto_193667 ?auto_193674 ) ) ( not ( = ?auto_193667 ?auto_193675 ) ) ( not ( = ?auto_193668 ?auto_193669 ) ) ( not ( = ?auto_193668 ?auto_193670 ) ) ( not ( = ?auto_193668 ?auto_193671 ) ) ( not ( = ?auto_193668 ?auto_193672 ) ) ( not ( = ?auto_193668 ?auto_193673 ) ) ( not ( = ?auto_193668 ?auto_193674 ) ) ( not ( = ?auto_193668 ?auto_193675 ) ) ( not ( = ?auto_193669 ?auto_193670 ) ) ( not ( = ?auto_193669 ?auto_193671 ) ) ( not ( = ?auto_193669 ?auto_193672 ) ) ( not ( = ?auto_193669 ?auto_193673 ) ) ( not ( = ?auto_193669 ?auto_193674 ) ) ( not ( = ?auto_193669 ?auto_193675 ) ) ( not ( = ?auto_193670 ?auto_193671 ) ) ( not ( = ?auto_193670 ?auto_193672 ) ) ( not ( = ?auto_193670 ?auto_193673 ) ) ( not ( = ?auto_193670 ?auto_193674 ) ) ( not ( = ?auto_193670 ?auto_193675 ) ) ( not ( = ?auto_193671 ?auto_193672 ) ) ( not ( = ?auto_193671 ?auto_193673 ) ) ( not ( = ?auto_193671 ?auto_193674 ) ) ( not ( = ?auto_193671 ?auto_193675 ) ) ( not ( = ?auto_193672 ?auto_193673 ) ) ( not ( = ?auto_193672 ?auto_193674 ) ) ( not ( = ?auto_193672 ?auto_193675 ) ) ( not ( = ?auto_193673 ?auto_193674 ) ) ( not ( = ?auto_193673 ?auto_193675 ) ) ( not ( = ?auto_193674 ?auto_193675 ) ) ( ON ?auto_193673 ?auto_193674 ) ( ON ?auto_193672 ?auto_193673 ) ( ON ?auto_193671 ?auto_193672 ) ( ON ?auto_193670 ?auto_193671 ) ( ON ?auto_193669 ?auto_193670 ) ( ON ?auto_193668 ?auto_193669 ) ( ON ?auto_193667 ?auto_193668 ) ( CLEAR ?auto_193665 ) ( ON ?auto_193666 ?auto_193667 ) ( CLEAR ?auto_193666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_193664 ?auto_193665 ?auto_193666 )
      ( MAKE-11PILE ?auto_193664 ?auto_193665 ?auto_193666 ?auto_193667 ?auto_193668 ?auto_193669 ?auto_193670 ?auto_193671 ?auto_193672 ?auto_193673 ?auto_193674 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_193710 - BLOCK
      ?auto_193711 - BLOCK
      ?auto_193712 - BLOCK
      ?auto_193713 - BLOCK
      ?auto_193714 - BLOCK
      ?auto_193715 - BLOCK
      ?auto_193716 - BLOCK
      ?auto_193717 - BLOCK
      ?auto_193718 - BLOCK
      ?auto_193719 - BLOCK
      ?auto_193720 - BLOCK
    )
    :vars
    (
      ?auto_193721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193720 ?auto_193721 ) ( ON-TABLE ?auto_193710 ) ( not ( = ?auto_193710 ?auto_193711 ) ) ( not ( = ?auto_193710 ?auto_193712 ) ) ( not ( = ?auto_193710 ?auto_193713 ) ) ( not ( = ?auto_193710 ?auto_193714 ) ) ( not ( = ?auto_193710 ?auto_193715 ) ) ( not ( = ?auto_193710 ?auto_193716 ) ) ( not ( = ?auto_193710 ?auto_193717 ) ) ( not ( = ?auto_193710 ?auto_193718 ) ) ( not ( = ?auto_193710 ?auto_193719 ) ) ( not ( = ?auto_193710 ?auto_193720 ) ) ( not ( = ?auto_193710 ?auto_193721 ) ) ( not ( = ?auto_193711 ?auto_193712 ) ) ( not ( = ?auto_193711 ?auto_193713 ) ) ( not ( = ?auto_193711 ?auto_193714 ) ) ( not ( = ?auto_193711 ?auto_193715 ) ) ( not ( = ?auto_193711 ?auto_193716 ) ) ( not ( = ?auto_193711 ?auto_193717 ) ) ( not ( = ?auto_193711 ?auto_193718 ) ) ( not ( = ?auto_193711 ?auto_193719 ) ) ( not ( = ?auto_193711 ?auto_193720 ) ) ( not ( = ?auto_193711 ?auto_193721 ) ) ( not ( = ?auto_193712 ?auto_193713 ) ) ( not ( = ?auto_193712 ?auto_193714 ) ) ( not ( = ?auto_193712 ?auto_193715 ) ) ( not ( = ?auto_193712 ?auto_193716 ) ) ( not ( = ?auto_193712 ?auto_193717 ) ) ( not ( = ?auto_193712 ?auto_193718 ) ) ( not ( = ?auto_193712 ?auto_193719 ) ) ( not ( = ?auto_193712 ?auto_193720 ) ) ( not ( = ?auto_193712 ?auto_193721 ) ) ( not ( = ?auto_193713 ?auto_193714 ) ) ( not ( = ?auto_193713 ?auto_193715 ) ) ( not ( = ?auto_193713 ?auto_193716 ) ) ( not ( = ?auto_193713 ?auto_193717 ) ) ( not ( = ?auto_193713 ?auto_193718 ) ) ( not ( = ?auto_193713 ?auto_193719 ) ) ( not ( = ?auto_193713 ?auto_193720 ) ) ( not ( = ?auto_193713 ?auto_193721 ) ) ( not ( = ?auto_193714 ?auto_193715 ) ) ( not ( = ?auto_193714 ?auto_193716 ) ) ( not ( = ?auto_193714 ?auto_193717 ) ) ( not ( = ?auto_193714 ?auto_193718 ) ) ( not ( = ?auto_193714 ?auto_193719 ) ) ( not ( = ?auto_193714 ?auto_193720 ) ) ( not ( = ?auto_193714 ?auto_193721 ) ) ( not ( = ?auto_193715 ?auto_193716 ) ) ( not ( = ?auto_193715 ?auto_193717 ) ) ( not ( = ?auto_193715 ?auto_193718 ) ) ( not ( = ?auto_193715 ?auto_193719 ) ) ( not ( = ?auto_193715 ?auto_193720 ) ) ( not ( = ?auto_193715 ?auto_193721 ) ) ( not ( = ?auto_193716 ?auto_193717 ) ) ( not ( = ?auto_193716 ?auto_193718 ) ) ( not ( = ?auto_193716 ?auto_193719 ) ) ( not ( = ?auto_193716 ?auto_193720 ) ) ( not ( = ?auto_193716 ?auto_193721 ) ) ( not ( = ?auto_193717 ?auto_193718 ) ) ( not ( = ?auto_193717 ?auto_193719 ) ) ( not ( = ?auto_193717 ?auto_193720 ) ) ( not ( = ?auto_193717 ?auto_193721 ) ) ( not ( = ?auto_193718 ?auto_193719 ) ) ( not ( = ?auto_193718 ?auto_193720 ) ) ( not ( = ?auto_193718 ?auto_193721 ) ) ( not ( = ?auto_193719 ?auto_193720 ) ) ( not ( = ?auto_193719 ?auto_193721 ) ) ( not ( = ?auto_193720 ?auto_193721 ) ) ( ON ?auto_193719 ?auto_193720 ) ( ON ?auto_193718 ?auto_193719 ) ( ON ?auto_193717 ?auto_193718 ) ( ON ?auto_193716 ?auto_193717 ) ( ON ?auto_193715 ?auto_193716 ) ( ON ?auto_193714 ?auto_193715 ) ( ON ?auto_193713 ?auto_193714 ) ( ON ?auto_193712 ?auto_193713 ) ( CLEAR ?auto_193710 ) ( ON ?auto_193711 ?auto_193712 ) ( CLEAR ?auto_193711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_193710 ?auto_193711 )
      ( MAKE-11PILE ?auto_193710 ?auto_193711 ?auto_193712 ?auto_193713 ?auto_193714 ?auto_193715 ?auto_193716 ?auto_193717 ?auto_193718 ?auto_193719 ?auto_193720 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_193756 - BLOCK
      ?auto_193757 - BLOCK
      ?auto_193758 - BLOCK
      ?auto_193759 - BLOCK
      ?auto_193760 - BLOCK
      ?auto_193761 - BLOCK
      ?auto_193762 - BLOCK
      ?auto_193763 - BLOCK
      ?auto_193764 - BLOCK
      ?auto_193765 - BLOCK
      ?auto_193766 - BLOCK
    )
    :vars
    (
      ?auto_193767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193766 ?auto_193767 ) ( not ( = ?auto_193756 ?auto_193757 ) ) ( not ( = ?auto_193756 ?auto_193758 ) ) ( not ( = ?auto_193756 ?auto_193759 ) ) ( not ( = ?auto_193756 ?auto_193760 ) ) ( not ( = ?auto_193756 ?auto_193761 ) ) ( not ( = ?auto_193756 ?auto_193762 ) ) ( not ( = ?auto_193756 ?auto_193763 ) ) ( not ( = ?auto_193756 ?auto_193764 ) ) ( not ( = ?auto_193756 ?auto_193765 ) ) ( not ( = ?auto_193756 ?auto_193766 ) ) ( not ( = ?auto_193756 ?auto_193767 ) ) ( not ( = ?auto_193757 ?auto_193758 ) ) ( not ( = ?auto_193757 ?auto_193759 ) ) ( not ( = ?auto_193757 ?auto_193760 ) ) ( not ( = ?auto_193757 ?auto_193761 ) ) ( not ( = ?auto_193757 ?auto_193762 ) ) ( not ( = ?auto_193757 ?auto_193763 ) ) ( not ( = ?auto_193757 ?auto_193764 ) ) ( not ( = ?auto_193757 ?auto_193765 ) ) ( not ( = ?auto_193757 ?auto_193766 ) ) ( not ( = ?auto_193757 ?auto_193767 ) ) ( not ( = ?auto_193758 ?auto_193759 ) ) ( not ( = ?auto_193758 ?auto_193760 ) ) ( not ( = ?auto_193758 ?auto_193761 ) ) ( not ( = ?auto_193758 ?auto_193762 ) ) ( not ( = ?auto_193758 ?auto_193763 ) ) ( not ( = ?auto_193758 ?auto_193764 ) ) ( not ( = ?auto_193758 ?auto_193765 ) ) ( not ( = ?auto_193758 ?auto_193766 ) ) ( not ( = ?auto_193758 ?auto_193767 ) ) ( not ( = ?auto_193759 ?auto_193760 ) ) ( not ( = ?auto_193759 ?auto_193761 ) ) ( not ( = ?auto_193759 ?auto_193762 ) ) ( not ( = ?auto_193759 ?auto_193763 ) ) ( not ( = ?auto_193759 ?auto_193764 ) ) ( not ( = ?auto_193759 ?auto_193765 ) ) ( not ( = ?auto_193759 ?auto_193766 ) ) ( not ( = ?auto_193759 ?auto_193767 ) ) ( not ( = ?auto_193760 ?auto_193761 ) ) ( not ( = ?auto_193760 ?auto_193762 ) ) ( not ( = ?auto_193760 ?auto_193763 ) ) ( not ( = ?auto_193760 ?auto_193764 ) ) ( not ( = ?auto_193760 ?auto_193765 ) ) ( not ( = ?auto_193760 ?auto_193766 ) ) ( not ( = ?auto_193760 ?auto_193767 ) ) ( not ( = ?auto_193761 ?auto_193762 ) ) ( not ( = ?auto_193761 ?auto_193763 ) ) ( not ( = ?auto_193761 ?auto_193764 ) ) ( not ( = ?auto_193761 ?auto_193765 ) ) ( not ( = ?auto_193761 ?auto_193766 ) ) ( not ( = ?auto_193761 ?auto_193767 ) ) ( not ( = ?auto_193762 ?auto_193763 ) ) ( not ( = ?auto_193762 ?auto_193764 ) ) ( not ( = ?auto_193762 ?auto_193765 ) ) ( not ( = ?auto_193762 ?auto_193766 ) ) ( not ( = ?auto_193762 ?auto_193767 ) ) ( not ( = ?auto_193763 ?auto_193764 ) ) ( not ( = ?auto_193763 ?auto_193765 ) ) ( not ( = ?auto_193763 ?auto_193766 ) ) ( not ( = ?auto_193763 ?auto_193767 ) ) ( not ( = ?auto_193764 ?auto_193765 ) ) ( not ( = ?auto_193764 ?auto_193766 ) ) ( not ( = ?auto_193764 ?auto_193767 ) ) ( not ( = ?auto_193765 ?auto_193766 ) ) ( not ( = ?auto_193765 ?auto_193767 ) ) ( not ( = ?auto_193766 ?auto_193767 ) ) ( ON ?auto_193765 ?auto_193766 ) ( ON ?auto_193764 ?auto_193765 ) ( ON ?auto_193763 ?auto_193764 ) ( ON ?auto_193762 ?auto_193763 ) ( ON ?auto_193761 ?auto_193762 ) ( ON ?auto_193760 ?auto_193761 ) ( ON ?auto_193759 ?auto_193760 ) ( ON ?auto_193758 ?auto_193759 ) ( ON ?auto_193757 ?auto_193758 ) ( ON ?auto_193756 ?auto_193757 ) ( CLEAR ?auto_193756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_193756 )
      ( MAKE-11PILE ?auto_193756 ?auto_193757 ?auto_193758 ?auto_193759 ?auto_193760 ?auto_193761 ?auto_193762 ?auto_193763 ?auto_193764 ?auto_193765 ?auto_193766 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_193803 - BLOCK
      ?auto_193804 - BLOCK
      ?auto_193805 - BLOCK
      ?auto_193806 - BLOCK
      ?auto_193807 - BLOCK
      ?auto_193808 - BLOCK
      ?auto_193809 - BLOCK
      ?auto_193810 - BLOCK
      ?auto_193811 - BLOCK
      ?auto_193812 - BLOCK
      ?auto_193813 - BLOCK
      ?auto_193814 - BLOCK
    )
    :vars
    (
      ?auto_193815 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_193813 ) ( ON ?auto_193814 ?auto_193815 ) ( CLEAR ?auto_193814 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_193803 ) ( ON ?auto_193804 ?auto_193803 ) ( ON ?auto_193805 ?auto_193804 ) ( ON ?auto_193806 ?auto_193805 ) ( ON ?auto_193807 ?auto_193806 ) ( ON ?auto_193808 ?auto_193807 ) ( ON ?auto_193809 ?auto_193808 ) ( ON ?auto_193810 ?auto_193809 ) ( ON ?auto_193811 ?auto_193810 ) ( ON ?auto_193812 ?auto_193811 ) ( ON ?auto_193813 ?auto_193812 ) ( not ( = ?auto_193803 ?auto_193804 ) ) ( not ( = ?auto_193803 ?auto_193805 ) ) ( not ( = ?auto_193803 ?auto_193806 ) ) ( not ( = ?auto_193803 ?auto_193807 ) ) ( not ( = ?auto_193803 ?auto_193808 ) ) ( not ( = ?auto_193803 ?auto_193809 ) ) ( not ( = ?auto_193803 ?auto_193810 ) ) ( not ( = ?auto_193803 ?auto_193811 ) ) ( not ( = ?auto_193803 ?auto_193812 ) ) ( not ( = ?auto_193803 ?auto_193813 ) ) ( not ( = ?auto_193803 ?auto_193814 ) ) ( not ( = ?auto_193803 ?auto_193815 ) ) ( not ( = ?auto_193804 ?auto_193805 ) ) ( not ( = ?auto_193804 ?auto_193806 ) ) ( not ( = ?auto_193804 ?auto_193807 ) ) ( not ( = ?auto_193804 ?auto_193808 ) ) ( not ( = ?auto_193804 ?auto_193809 ) ) ( not ( = ?auto_193804 ?auto_193810 ) ) ( not ( = ?auto_193804 ?auto_193811 ) ) ( not ( = ?auto_193804 ?auto_193812 ) ) ( not ( = ?auto_193804 ?auto_193813 ) ) ( not ( = ?auto_193804 ?auto_193814 ) ) ( not ( = ?auto_193804 ?auto_193815 ) ) ( not ( = ?auto_193805 ?auto_193806 ) ) ( not ( = ?auto_193805 ?auto_193807 ) ) ( not ( = ?auto_193805 ?auto_193808 ) ) ( not ( = ?auto_193805 ?auto_193809 ) ) ( not ( = ?auto_193805 ?auto_193810 ) ) ( not ( = ?auto_193805 ?auto_193811 ) ) ( not ( = ?auto_193805 ?auto_193812 ) ) ( not ( = ?auto_193805 ?auto_193813 ) ) ( not ( = ?auto_193805 ?auto_193814 ) ) ( not ( = ?auto_193805 ?auto_193815 ) ) ( not ( = ?auto_193806 ?auto_193807 ) ) ( not ( = ?auto_193806 ?auto_193808 ) ) ( not ( = ?auto_193806 ?auto_193809 ) ) ( not ( = ?auto_193806 ?auto_193810 ) ) ( not ( = ?auto_193806 ?auto_193811 ) ) ( not ( = ?auto_193806 ?auto_193812 ) ) ( not ( = ?auto_193806 ?auto_193813 ) ) ( not ( = ?auto_193806 ?auto_193814 ) ) ( not ( = ?auto_193806 ?auto_193815 ) ) ( not ( = ?auto_193807 ?auto_193808 ) ) ( not ( = ?auto_193807 ?auto_193809 ) ) ( not ( = ?auto_193807 ?auto_193810 ) ) ( not ( = ?auto_193807 ?auto_193811 ) ) ( not ( = ?auto_193807 ?auto_193812 ) ) ( not ( = ?auto_193807 ?auto_193813 ) ) ( not ( = ?auto_193807 ?auto_193814 ) ) ( not ( = ?auto_193807 ?auto_193815 ) ) ( not ( = ?auto_193808 ?auto_193809 ) ) ( not ( = ?auto_193808 ?auto_193810 ) ) ( not ( = ?auto_193808 ?auto_193811 ) ) ( not ( = ?auto_193808 ?auto_193812 ) ) ( not ( = ?auto_193808 ?auto_193813 ) ) ( not ( = ?auto_193808 ?auto_193814 ) ) ( not ( = ?auto_193808 ?auto_193815 ) ) ( not ( = ?auto_193809 ?auto_193810 ) ) ( not ( = ?auto_193809 ?auto_193811 ) ) ( not ( = ?auto_193809 ?auto_193812 ) ) ( not ( = ?auto_193809 ?auto_193813 ) ) ( not ( = ?auto_193809 ?auto_193814 ) ) ( not ( = ?auto_193809 ?auto_193815 ) ) ( not ( = ?auto_193810 ?auto_193811 ) ) ( not ( = ?auto_193810 ?auto_193812 ) ) ( not ( = ?auto_193810 ?auto_193813 ) ) ( not ( = ?auto_193810 ?auto_193814 ) ) ( not ( = ?auto_193810 ?auto_193815 ) ) ( not ( = ?auto_193811 ?auto_193812 ) ) ( not ( = ?auto_193811 ?auto_193813 ) ) ( not ( = ?auto_193811 ?auto_193814 ) ) ( not ( = ?auto_193811 ?auto_193815 ) ) ( not ( = ?auto_193812 ?auto_193813 ) ) ( not ( = ?auto_193812 ?auto_193814 ) ) ( not ( = ?auto_193812 ?auto_193815 ) ) ( not ( = ?auto_193813 ?auto_193814 ) ) ( not ( = ?auto_193813 ?auto_193815 ) ) ( not ( = ?auto_193814 ?auto_193815 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_193814 ?auto_193815 )
      ( !STACK ?auto_193814 ?auto_193813 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_193828 - BLOCK
      ?auto_193829 - BLOCK
      ?auto_193830 - BLOCK
      ?auto_193831 - BLOCK
      ?auto_193832 - BLOCK
      ?auto_193833 - BLOCK
      ?auto_193834 - BLOCK
      ?auto_193835 - BLOCK
      ?auto_193836 - BLOCK
      ?auto_193837 - BLOCK
      ?auto_193838 - BLOCK
      ?auto_193839 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_193838 ) ( ON-TABLE ?auto_193839 ) ( CLEAR ?auto_193839 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_193828 ) ( ON ?auto_193829 ?auto_193828 ) ( ON ?auto_193830 ?auto_193829 ) ( ON ?auto_193831 ?auto_193830 ) ( ON ?auto_193832 ?auto_193831 ) ( ON ?auto_193833 ?auto_193832 ) ( ON ?auto_193834 ?auto_193833 ) ( ON ?auto_193835 ?auto_193834 ) ( ON ?auto_193836 ?auto_193835 ) ( ON ?auto_193837 ?auto_193836 ) ( ON ?auto_193838 ?auto_193837 ) ( not ( = ?auto_193828 ?auto_193829 ) ) ( not ( = ?auto_193828 ?auto_193830 ) ) ( not ( = ?auto_193828 ?auto_193831 ) ) ( not ( = ?auto_193828 ?auto_193832 ) ) ( not ( = ?auto_193828 ?auto_193833 ) ) ( not ( = ?auto_193828 ?auto_193834 ) ) ( not ( = ?auto_193828 ?auto_193835 ) ) ( not ( = ?auto_193828 ?auto_193836 ) ) ( not ( = ?auto_193828 ?auto_193837 ) ) ( not ( = ?auto_193828 ?auto_193838 ) ) ( not ( = ?auto_193828 ?auto_193839 ) ) ( not ( = ?auto_193829 ?auto_193830 ) ) ( not ( = ?auto_193829 ?auto_193831 ) ) ( not ( = ?auto_193829 ?auto_193832 ) ) ( not ( = ?auto_193829 ?auto_193833 ) ) ( not ( = ?auto_193829 ?auto_193834 ) ) ( not ( = ?auto_193829 ?auto_193835 ) ) ( not ( = ?auto_193829 ?auto_193836 ) ) ( not ( = ?auto_193829 ?auto_193837 ) ) ( not ( = ?auto_193829 ?auto_193838 ) ) ( not ( = ?auto_193829 ?auto_193839 ) ) ( not ( = ?auto_193830 ?auto_193831 ) ) ( not ( = ?auto_193830 ?auto_193832 ) ) ( not ( = ?auto_193830 ?auto_193833 ) ) ( not ( = ?auto_193830 ?auto_193834 ) ) ( not ( = ?auto_193830 ?auto_193835 ) ) ( not ( = ?auto_193830 ?auto_193836 ) ) ( not ( = ?auto_193830 ?auto_193837 ) ) ( not ( = ?auto_193830 ?auto_193838 ) ) ( not ( = ?auto_193830 ?auto_193839 ) ) ( not ( = ?auto_193831 ?auto_193832 ) ) ( not ( = ?auto_193831 ?auto_193833 ) ) ( not ( = ?auto_193831 ?auto_193834 ) ) ( not ( = ?auto_193831 ?auto_193835 ) ) ( not ( = ?auto_193831 ?auto_193836 ) ) ( not ( = ?auto_193831 ?auto_193837 ) ) ( not ( = ?auto_193831 ?auto_193838 ) ) ( not ( = ?auto_193831 ?auto_193839 ) ) ( not ( = ?auto_193832 ?auto_193833 ) ) ( not ( = ?auto_193832 ?auto_193834 ) ) ( not ( = ?auto_193832 ?auto_193835 ) ) ( not ( = ?auto_193832 ?auto_193836 ) ) ( not ( = ?auto_193832 ?auto_193837 ) ) ( not ( = ?auto_193832 ?auto_193838 ) ) ( not ( = ?auto_193832 ?auto_193839 ) ) ( not ( = ?auto_193833 ?auto_193834 ) ) ( not ( = ?auto_193833 ?auto_193835 ) ) ( not ( = ?auto_193833 ?auto_193836 ) ) ( not ( = ?auto_193833 ?auto_193837 ) ) ( not ( = ?auto_193833 ?auto_193838 ) ) ( not ( = ?auto_193833 ?auto_193839 ) ) ( not ( = ?auto_193834 ?auto_193835 ) ) ( not ( = ?auto_193834 ?auto_193836 ) ) ( not ( = ?auto_193834 ?auto_193837 ) ) ( not ( = ?auto_193834 ?auto_193838 ) ) ( not ( = ?auto_193834 ?auto_193839 ) ) ( not ( = ?auto_193835 ?auto_193836 ) ) ( not ( = ?auto_193835 ?auto_193837 ) ) ( not ( = ?auto_193835 ?auto_193838 ) ) ( not ( = ?auto_193835 ?auto_193839 ) ) ( not ( = ?auto_193836 ?auto_193837 ) ) ( not ( = ?auto_193836 ?auto_193838 ) ) ( not ( = ?auto_193836 ?auto_193839 ) ) ( not ( = ?auto_193837 ?auto_193838 ) ) ( not ( = ?auto_193837 ?auto_193839 ) ) ( not ( = ?auto_193838 ?auto_193839 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_193839 )
      ( !STACK ?auto_193839 ?auto_193838 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_193852 - BLOCK
      ?auto_193853 - BLOCK
      ?auto_193854 - BLOCK
      ?auto_193855 - BLOCK
      ?auto_193856 - BLOCK
      ?auto_193857 - BLOCK
      ?auto_193858 - BLOCK
      ?auto_193859 - BLOCK
      ?auto_193860 - BLOCK
      ?auto_193861 - BLOCK
      ?auto_193862 - BLOCK
      ?auto_193863 - BLOCK
    )
    :vars
    (
      ?auto_193864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193863 ?auto_193864 ) ( ON-TABLE ?auto_193852 ) ( ON ?auto_193853 ?auto_193852 ) ( ON ?auto_193854 ?auto_193853 ) ( ON ?auto_193855 ?auto_193854 ) ( ON ?auto_193856 ?auto_193855 ) ( ON ?auto_193857 ?auto_193856 ) ( ON ?auto_193858 ?auto_193857 ) ( ON ?auto_193859 ?auto_193858 ) ( ON ?auto_193860 ?auto_193859 ) ( ON ?auto_193861 ?auto_193860 ) ( not ( = ?auto_193852 ?auto_193853 ) ) ( not ( = ?auto_193852 ?auto_193854 ) ) ( not ( = ?auto_193852 ?auto_193855 ) ) ( not ( = ?auto_193852 ?auto_193856 ) ) ( not ( = ?auto_193852 ?auto_193857 ) ) ( not ( = ?auto_193852 ?auto_193858 ) ) ( not ( = ?auto_193852 ?auto_193859 ) ) ( not ( = ?auto_193852 ?auto_193860 ) ) ( not ( = ?auto_193852 ?auto_193861 ) ) ( not ( = ?auto_193852 ?auto_193862 ) ) ( not ( = ?auto_193852 ?auto_193863 ) ) ( not ( = ?auto_193852 ?auto_193864 ) ) ( not ( = ?auto_193853 ?auto_193854 ) ) ( not ( = ?auto_193853 ?auto_193855 ) ) ( not ( = ?auto_193853 ?auto_193856 ) ) ( not ( = ?auto_193853 ?auto_193857 ) ) ( not ( = ?auto_193853 ?auto_193858 ) ) ( not ( = ?auto_193853 ?auto_193859 ) ) ( not ( = ?auto_193853 ?auto_193860 ) ) ( not ( = ?auto_193853 ?auto_193861 ) ) ( not ( = ?auto_193853 ?auto_193862 ) ) ( not ( = ?auto_193853 ?auto_193863 ) ) ( not ( = ?auto_193853 ?auto_193864 ) ) ( not ( = ?auto_193854 ?auto_193855 ) ) ( not ( = ?auto_193854 ?auto_193856 ) ) ( not ( = ?auto_193854 ?auto_193857 ) ) ( not ( = ?auto_193854 ?auto_193858 ) ) ( not ( = ?auto_193854 ?auto_193859 ) ) ( not ( = ?auto_193854 ?auto_193860 ) ) ( not ( = ?auto_193854 ?auto_193861 ) ) ( not ( = ?auto_193854 ?auto_193862 ) ) ( not ( = ?auto_193854 ?auto_193863 ) ) ( not ( = ?auto_193854 ?auto_193864 ) ) ( not ( = ?auto_193855 ?auto_193856 ) ) ( not ( = ?auto_193855 ?auto_193857 ) ) ( not ( = ?auto_193855 ?auto_193858 ) ) ( not ( = ?auto_193855 ?auto_193859 ) ) ( not ( = ?auto_193855 ?auto_193860 ) ) ( not ( = ?auto_193855 ?auto_193861 ) ) ( not ( = ?auto_193855 ?auto_193862 ) ) ( not ( = ?auto_193855 ?auto_193863 ) ) ( not ( = ?auto_193855 ?auto_193864 ) ) ( not ( = ?auto_193856 ?auto_193857 ) ) ( not ( = ?auto_193856 ?auto_193858 ) ) ( not ( = ?auto_193856 ?auto_193859 ) ) ( not ( = ?auto_193856 ?auto_193860 ) ) ( not ( = ?auto_193856 ?auto_193861 ) ) ( not ( = ?auto_193856 ?auto_193862 ) ) ( not ( = ?auto_193856 ?auto_193863 ) ) ( not ( = ?auto_193856 ?auto_193864 ) ) ( not ( = ?auto_193857 ?auto_193858 ) ) ( not ( = ?auto_193857 ?auto_193859 ) ) ( not ( = ?auto_193857 ?auto_193860 ) ) ( not ( = ?auto_193857 ?auto_193861 ) ) ( not ( = ?auto_193857 ?auto_193862 ) ) ( not ( = ?auto_193857 ?auto_193863 ) ) ( not ( = ?auto_193857 ?auto_193864 ) ) ( not ( = ?auto_193858 ?auto_193859 ) ) ( not ( = ?auto_193858 ?auto_193860 ) ) ( not ( = ?auto_193858 ?auto_193861 ) ) ( not ( = ?auto_193858 ?auto_193862 ) ) ( not ( = ?auto_193858 ?auto_193863 ) ) ( not ( = ?auto_193858 ?auto_193864 ) ) ( not ( = ?auto_193859 ?auto_193860 ) ) ( not ( = ?auto_193859 ?auto_193861 ) ) ( not ( = ?auto_193859 ?auto_193862 ) ) ( not ( = ?auto_193859 ?auto_193863 ) ) ( not ( = ?auto_193859 ?auto_193864 ) ) ( not ( = ?auto_193860 ?auto_193861 ) ) ( not ( = ?auto_193860 ?auto_193862 ) ) ( not ( = ?auto_193860 ?auto_193863 ) ) ( not ( = ?auto_193860 ?auto_193864 ) ) ( not ( = ?auto_193861 ?auto_193862 ) ) ( not ( = ?auto_193861 ?auto_193863 ) ) ( not ( = ?auto_193861 ?auto_193864 ) ) ( not ( = ?auto_193862 ?auto_193863 ) ) ( not ( = ?auto_193862 ?auto_193864 ) ) ( not ( = ?auto_193863 ?auto_193864 ) ) ( CLEAR ?auto_193861 ) ( ON ?auto_193862 ?auto_193863 ) ( CLEAR ?auto_193862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_193852 ?auto_193853 ?auto_193854 ?auto_193855 ?auto_193856 ?auto_193857 ?auto_193858 ?auto_193859 ?auto_193860 ?auto_193861 ?auto_193862 )
      ( MAKE-12PILE ?auto_193852 ?auto_193853 ?auto_193854 ?auto_193855 ?auto_193856 ?auto_193857 ?auto_193858 ?auto_193859 ?auto_193860 ?auto_193861 ?auto_193862 ?auto_193863 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_193877 - BLOCK
      ?auto_193878 - BLOCK
      ?auto_193879 - BLOCK
      ?auto_193880 - BLOCK
      ?auto_193881 - BLOCK
      ?auto_193882 - BLOCK
      ?auto_193883 - BLOCK
      ?auto_193884 - BLOCK
      ?auto_193885 - BLOCK
      ?auto_193886 - BLOCK
      ?auto_193887 - BLOCK
      ?auto_193888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193888 ) ( ON-TABLE ?auto_193877 ) ( ON ?auto_193878 ?auto_193877 ) ( ON ?auto_193879 ?auto_193878 ) ( ON ?auto_193880 ?auto_193879 ) ( ON ?auto_193881 ?auto_193880 ) ( ON ?auto_193882 ?auto_193881 ) ( ON ?auto_193883 ?auto_193882 ) ( ON ?auto_193884 ?auto_193883 ) ( ON ?auto_193885 ?auto_193884 ) ( ON ?auto_193886 ?auto_193885 ) ( not ( = ?auto_193877 ?auto_193878 ) ) ( not ( = ?auto_193877 ?auto_193879 ) ) ( not ( = ?auto_193877 ?auto_193880 ) ) ( not ( = ?auto_193877 ?auto_193881 ) ) ( not ( = ?auto_193877 ?auto_193882 ) ) ( not ( = ?auto_193877 ?auto_193883 ) ) ( not ( = ?auto_193877 ?auto_193884 ) ) ( not ( = ?auto_193877 ?auto_193885 ) ) ( not ( = ?auto_193877 ?auto_193886 ) ) ( not ( = ?auto_193877 ?auto_193887 ) ) ( not ( = ?auto_193877 ?auto_193888 ) ) ( not ( = ?auto_193878 ?auto_193879 ) ) ( not ( = ?auto_193878 ?auto_193880 ) ) ( not ( = ?auto_193878 ?auto_193881 ) ) ( not ( = ?auto_193878 ?auto_193882 ) ) ( not ( = ?auto_193878 ?auto_193883 ) ) ( not ( = ?auto_193878 ?auto_193884 ) ) ( not ( = ?auto_193878 ?auto_193885 ) ) ( not ( = ?auto_193878 ?auto_193886 ) ) ( not ( = ?auto_193878 ?auto_193887 ) ) ( not ( = ?auto_193878 ?auto_193888 ) ) ( not ( = ?auto_193879 ?auto_193880 ) ) ( not ( = ?auto_193879 ?auto_193881 ) ) ( not ( = ?auto_193879 ?auto_193882 ) ) ( not ( = ?auto_193879 ?auto_193883 ) ) ( not ( = ?auto_193879 ?auto_193884 ) ) ( not ( = ?auto_193879 ?auto_193885 ) ) ( not ( = ?auto_193879 ?auto_193886 ) ) ( not ( = ?auto_193879 ?auto_193887 ) ) ( not ( = ?auto_193879 ?auto_193888 ) ) ( not ( = ?auto_193880 ?auto_193881 ) ) ( not ( = ?auto_193880 ?auto_193882 ) ) ( not ( = ?auto_193880 ?auto_193883 ) ) ( not ( = ?auto_193880 ?auto_193884 ) ) ( not ( = ?auto_193880 ?auto_193885 ) ) ( not ( = ?auto_193880 ?auto_193886 ) ) ( not ( = ?auto_193880 ?auto_193887 ) ) ( not ( = ?auto_193880 ?auto_193888 ) ) ( not ( = ?auto_193881 ?auto_193882 ) ) ( not ( = ?auto_193881 ?auto_193883 ) ) ( not ( = ?auto_193881 ?auto_193884 ) ) ( not ( = ?auto_193881 ?auto_193885 ) ) ( not ( = ?auto_193881 ?auto_193886 ) ) ( not ( = ?auto_193881 ?auto_193887 ) ) ( not ( = ?auto_193881 ?auto_193888 ) ) ( not ( = ?auto_193882 ?auto_193883 ) ) ( not ( = ?auto_193882 ?auto_193884 ) ) ( not ( = ?auto_193882 ?auto_193885 ) ) ( not ( = ?auto_193882 ?auto_193886 ) ) ( not ( = ?auto_193882 ?auto_193887 ) ) ( not ( = ?auto_193882 ?auto_193888 ) ) ( not ( = ?auto_193883 ?auto_193884 ) ) ( not ( = ?auto_193883 ?auto_193885 ) ) ( not ( = ?auto_193883 ?auto_193886 ) ) ( not ( = ?auto_193883 ?auto_193887 ) ) ( not ( = ?auto_193883 ?auto_193888 ) ) ( not ( = ?auto_193884 ?auto_193885 ) ) ( not ( = ?auto_193884 ?auto_193886 ) ) ( not ( = ?auto_193884 ?auto_193887 ) ) ( not ( = ?auto_193884 ?auto_193888 ) ) ( not ( = ?auto_193885 ?auto_193886 ) ) ( not ( = ?auto_193885 ?auto_193887 ) ) ( not ( = ?auto_193885 ?auto_193888 ) ) ( not ( = ?auto_193886 ?auto_193887 ) ) ( not ( = ?auto_193886 ?auto_193888 ) ) ( not ( = ?auto_193887 ?auto_193888 ) ) ( CLEAR ?auto_193886 ) ( ON ?auto_193887 ?auto_193888 ) ( CLEAR ?auto_193887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_193877 ?auto_193878 ?auto_193879 ?auto_193880 ?auto_193881 ?auto_193882 ?auto_193883 ?auto_193884 ?auto_193885 ?auto_193886 ?auto_193887 )
      ( MAKE-12PILE ?auto_193877 ?auto_193878 ?auto_193879 ?auto_193880 ?auto_193881 ?auto_193882 ?auto_193883 ?auto_193884 ?auto_193885 ?auto_193886 ?auto_193887 ?auto_193888 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_193901 - BLOCK
      ?auto_193902 - BLOCK
      ?auto_193903 - BLOCK
      ?auto_193904 - BLOCK
      ?auto_193905 - BLOCK
      ?auto_193906 - BLOCK
      ?auto_193907 - BLOCK
      ?auto_193908 - BLOCK
      ?auto_193909 - BLOCK
      ?auto_193910 - BLOCK
      ?auto_193911 - BLOCK
      ?auto_193912 - BLOCK
    )
    :vars
    (
      ?auto_193913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193912 ?auto_193913 ) ( ON-TABLE ?auto_193901 ) ( ON ?auto_193902 ?auto_193901 ) ( ON ?auto_193903 ?auto_193902 ) ( ON ?auto_193904 ?auto_193903 ) ( ON ?auto_193905 ?auto_193904 ) ( ON ?auto_193906 ?auto_193905 ) ( ON ?auto_193907 ?auto_193906 ) ( ON ?auto_193908 ?auto_193907 ) ( ON ?auto_193909 ?auto_193908 ) ( not ( = ?auto_193901 ?auto_193902 ) ) ( not ( = ?auto_193901 ?auto_193903 ) ) ( not ( = ?auto_193901 ?auto_193904 ) ) ( not ( = ?auto_193901 ?auto_193905 ) ) ( not ( = ?auto_193901 ?auto_193906 ) ) ( not ( = ?auto_193901 ?auto_193907 ) ) ( not ( = ?auto_193901 ?auto_193908 ) ) ( not ( = ?auto_193901 ?auto_193909 ) ) ( not ( = ?auto_193901 ?auto_193910 ) ) ( not ( = ?auto_193901 ?auto_193911 ) ) ( not ( = ?auto_193901 ?auto_193912 ) ) ( not ( = ?auto_193901 ?auto_193913 ) ) ( not ( = ?auto_193902 ?auto_193903 ) ) ( not ( = ?auto_193902 ?auto_193904 ) ) ( not ( = ?auto_193902 ?auto_193905 ) ) ( not ( = ?auto_193902 ?auto_193906 ) ) ( not ( = ?auto_193902 ?auto_193907 ) ) ( not ( = ?auto_193902 ?auto_193908 ) ) ( not ( = ?auto_193902 ?auto_193909 ) ) ( not ( = ?auto_193902 ?auto_193910 ) ) ( not ( = ?auto_193902 ?auto_193911 ) ) ( not ( = ?auto_193902 ?auto_193912 ) ) ( not ( = ?auto_193902 ?auto_193913 ) ) ( not ( = ?auto_193903 ?auto_193904 ) ) ( not ( = ?auto_193903 ?auto_193905 ) ) ( not ( = ?auto_193903 ?auto_193906 ) ) ( not ( = ?auto_193903 ?auto_193907 ) ) ( not ( = ?auto_193903 ?auto_193908 ) ) ( not ( = ?auto_193903 ?auto_193909 ) ) ( not ( = ?auto_193903 ?auto_193910 ) ) ( not ( = ?auto_193903 ?auto_193911 ) ) ( not ( = ?auto_193903 ?auto_193912 ) ) ( not ( = ?auto_193903 ?auto_193913 ) ) ( not ( = ?auto_193904 ?auto_193905 ) ) ( not ( = ?auto_193904 ?auto_193906 ) ) ( not ( = ?auto_193904 ?auto_193907 ) ) ( not ( = ?auto_193904 ?auto_193908 ) ) ( not ( = ?auto_193904 ?auto_193909 ) ) ( not ( = ?auto_193904 ?auto_193910 ) ) ( not ( = ?auto_193904 ?auto_193911 ) ) ( not ( = ?auto_193904 ?auto_193912 ) ) ( not ( = ?auto_193904 ?auto_193913 ) ) ( not ( = ?auto_193905 ?auto_193906 ) ) ( not ( = ?auto_193905 ?auto_193907 ) ) ( not ( = ?auto_193905 ?auto_193908 ) ) ( not ( = ?auto_193905 ?auto_193909 ) ) ( not ( = ?auto_193905 ?auto_193910 ) ) ( not ( = ?auto_193905 ?auto_193911 ) ) ( not ( = ?auto_193905 ?auto_193912 ) ) ( not ( = ?auto_193905 ?auto_193913 ) ) ( not ( = ?auto_193906 ?auto_193907 ) ) ( not ( = ?auto_193906 ?auto_193908 ) ) ( not ( = ?auto_193906 ?auto_193909 ) ) ( not ( = ?auto_193906 ?auto_193910 ) ) ( not ( = ?auto_193906 ?auto_193911 ) ) ( not ( = ?auto_193906 ?auto_193912 ) ) ( not ( = ?auto_193906 ?auto_193913 ) ) ( not ( = ?auto_193907 ?auto_193908 ) ) ( not ( = ?auto_193907 ?auto_193909 ) ) ( not ( = ?auto_193907 ?auto_193910 ) ) ( not ( = ?auto_193907 ?auto_193911 ) ) ( not ( = ?auto_193907 ?auto_193912 ) ) ( not ( = ?auto_193907 ?auto_193913 ) ) ( not ( = ?auto_193908 ?auto_193909 ) ) ( not ( = ?auto_193908 ?auto_193910 ) ) ( not ( = ?auto_193908 ?auto_193911 ) ) ( not ( = ?auto_193908 ?auto_193912 ) ) ( not ( = ?auto_193908 ?auto_193913 ) ) ( not ( = ?auto_193909 ?auto_193910 ) ) ( not ( = ?auto_193909 ?auto_193911 ) ) ( not ( = ?auto_193909 ?auto_193912 ) ) ( not ( = ?auto_193909 ?auto_193913 ) ) ( not ( = ?auto_193910 ?auto_193911 ) ) ( not ( = ?auto_193910 ?auto_193912 ) ) ( not ( = ?auto_193910 ?auto_193913 ) ) ( not ( = ?auto_193911 ?auto_193912 ) ) ( not ( = ?auto_193911 ?auto_193913 ) ) ( not ( = ?auto_193912 ?auto_193913 ) ) ( ON ?auto_193911 ?auto_193912 ) ( CLEAR ?auto_193909 ) ( ON ?auto_193910 ?auto_193911 ) ( CLEAR ?auto_193910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_193901 ?auto_193902 ?auto_193903 ?auto_193904 ?auto_193905 ?auto_193906 ?auto_193907 ?auto_193908 ?auto_193909 ?auto_193910 )
      ( MAKE-12PILE ?auto_193901 ?auto_193902 ?auto_193903 ?auto_193904 ?auto_193905 ?auto_193906 ?auto_193907 ?auto_193908 ?auto_193909 ?auto_193910 ?auto_193911 ?auto_193912 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_193926 - BLOCK
      ?auto_193927 - BLOCK
      ?auto_193928 - BLOCK
      ?auto_193929 - BLOCK
      ?auto_193930 - BLOCK
      ?auto_193931 - BLOCK
      ?auto_193932 - BLOCK
      ?auto_193933 - BLOCK
      ?auto_193934 - BLOCK
      ?auto_193935 - BLOCK
      ?auto_193936 - BLOCK
      ?auto_193937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193937 ) ( ON-TABLE ?auto_193926 ) ( ON ?auto_193927 ?auto_193926 ) ( ON ?auto_193928 ?auto_193927 ) ( ON ?auto_193929 ?auto_193928 ) ( ON ?auto_193930 ?auto_193929 ) ( ON ?auto_193931 ?auto_193930 ) ( ON ?auto_193932 ?auto_193931 ) ( ON ?auto_193933 ?auto_193932 ) ( ON ?auto_193934 ?auto_193933 ) ( not ( = ?auto_193926 ?auto_193927 ) ) ( not ( = ?auto_193926 ?auto_193928 ) ) ( not ( = ?auto_193926 ?auto_193929 ) ) ( not ( = ?auto_193926 ?auto_193930 ) ) ( not ( = ?auto_193926 ?auto_193931 ) ) ( not ( = ?auto_193926 ?auto_193932 ) ) ( not ( = ?auto_193926 ?auto_193933 ) ) ( not ( = ?auto_193926 ?auto_193934 ) ) ( not ( = ?auto_193926 ?auto_193935 ) ) ( not ( = ?auto_193926 ?auto_193936 ) ) ( not ( = ?auto_193926 ?auto_193937 ) ) ( not ( = ?auto_193927 ?auto_193928 ) ) ( not ( = ?auto_193927 ?auto_193929 ) ) ( not ( = ?auto_193927 ?auto_193930 ) ) ( not ( = ?auto_193927 ?auto_193931 ) ) ( not ( = ?auto_193927 ?auto_193932 ) ) ( not ( = ?auto_193927 ?auto_193933 ) ) ( not ( = ?auto_193927 ?auto_193934 ) ) ( not ( = ?auto_193927 ?auto_193935 ) ) ( not ( = ?auto_193927 ?auto_193936 ) ) ( not ( = ?auto_193927 ?auto_193937 ) ) ( not ( = ?auto_193928 ?auto_193929 ) ) ( not ( = ?auto_193928 ?auto_193930 ) ) ( not ( = ?auto_193928 ?auto_193931 ) ) ( not ( = ?auto_193928 ?auto_193932 ) ) ( not ( = ?auto_193928 ?auto_193933 ) ) ( not ( = ?auto_193928 ?auto_193934 ) ) ( not ( = ?auto_193928 ?auto_193935 ) ) ( not ( = ?auto_193928 ?auto_193936 ) ) ( not ( = ?auto_193928 ?auto_193937 ) ) ( not ( = ?auto_193929 ?auto_193930 ) ) ( not ( = ?auto_193929 ?auto_193931 ) ) ( not ( = ?auto_193929 ?auto_193932 ) ) ( not ( = ?auto_193929 ?auto_193933 ) ) ( not ( = ?auto_193929 ?auto_193934 ) ) ( not ( = ?auto_193929 ?auto_193935 ) ) ( not ( = ?auto_193929 ?auto_193936 ) ) ( not ( = ?auto_193929 ?auto_193937 ) ) ( not ( = ?auto_193930 ?auto_193931 ) ) ( not ( = ?auto_193930 ?auto_193932 ) ) ( not ( = ?auto_193930 ?auto_193933 ) ) ( not ( = ?auto_193930 ?auto_193934 ) ) ( not ( = ?auto_193930 ?auto_193935 ) ) ( not ( = ?auto_193930 ?auto_193936 ) ) ( not ( = ?auto_193930 ?auto_193937 ) ) ( not ( = ?auto_193931 ?auto_193932 ) ) ( not ( = ?auto_193931 ?auto_193933 ) ) ( not ( = ?auto_193931 ?auto_193934 ) ) ( not ( = ?auto_193931 ?auto_193935 ) ) ( not ( = ?auto_193931 ?auto_193936 ) ) ( not ( = ?auto_193931 ?auto_193937 ) ) ( not ( = ?auto_193932 ?auto_193933 ) ) ( not ( = ?auto_193932 ?auto_193934 ) ) ( not ( = ?auto_193932 ?auto_193935 ) ) ( not ( = ?auto_193932 ?auto_193936 ) ) ( not ( = ?auto_193932 ?auto_193937 ) ) ( not ( = ?auto_193933 ?auto_193934 ) ) ( not ( = ?auto_193933 ?auto_193935 ) ) ( not ( = ?auto_193933 ?auto_193936 ) ) ( not ( = ?auto_193933 ?auto_193937 ) ) ( not ( = ?auto_193934 ?auto_193935 ) ) ( not ( = ?auto_193934 ?auto_193936 ) ) ( not ( = ?auto_193934 ?auto_193937 ) ) ( not ( = ?auto_193935 ?auto_193936 ) ) ( not ( = ?auto_193935 ?auto_193937 ) ) ( not ( = ?auto_193936 ?auto_193937 ) ) ( ON ?auto_193936 ?auto_193937 ) ( CLEAR ?auto_193934 ) ( ON ?auto_193935 ?auto_193936 ) ( CLEAR ?auto_193935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_193926 ?auto_193927 ?auto_193928 ?auto_193929 ?auto_193930 ?auto_193931 ?auto_193932 ?auto_193933 ?auto_193934 ?auto_193935 )
      ( MAKE-12PILE ?auto_193926 ?auto_193927 ?auto_193928 ?auto_193929 ?auto_193930 ?auto_193931 ?auto_193932 ?auto_193933 ?auto_193934 ?auto_193935 ?auto_193936 ?auto_193937 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_193950 - BLOCK
      ?auto_193951 - BLOCK
      ?auto_193952 - BLOCK
      ?auto_193953 - BLOCK
      ?auto_193954 - BLOCK
      ?auto_193955 - BLOCK
      ?auto_193956 - BLOCK
      ?auto_193957 - BLOCK
      ?auto_193958 - BLOCK
      ?auto_193959 - BLOCK
      ?auto_193960 - BLOCK
      ?auto_193961 - BLOCK
    )
    :vars
    (
      ?auto_193962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193961 ?auto_193962 ) ( ON-TABLE ?auto_193950 ) ( ON ?auto_193951 ?auto_193950 ) ( ON ?auto_193952 ?auto_193951 ) ( ON ?auto_193953 ?auto_193952 ) ( ON ?auto_193954 ?auto_193953 ) ( ON ?auto_193955 ?auto_193954 ) ( ON ?auto_193956 ?auto_193955 ) ( ON ?auto_193957 ?auto_193956 ) ( not ( = ?auto_193950 ?auto_193951 ) ) ( not ( = ?auto_193950 ?auto_193952 ) ) ( not ( = ?auto_193950 ?auto_193953 ) ) ( not ( = ?auto_193950 ?auto_193954 ) ) ( not ( = ?auto_193950 ?auto_193955 ) ) ( not ( = ?auto_193950 ?auto_193956 ) ) ( not ( = ?auto_193950 ?auto_193957 ) ) ( not ( = ?auto_193950 ?auto_193958 ) ) ( not ( = ?auto_193950 ?auto_193959 ) ) ( not ( = ?auto_193950 ?auto_193960 ) ) ( not ( = ?auto_193950 ?auto_193961 ) ) ( not ( = ?auto_193950 ?auto_193962 ) ) ( not ( = ?auto_193951 ?auto_193952 ) ) ( not ( = ?auto_193951 ?auto_193953 ) ) ( not ( = ?auto_193951 ?auto_193954 ) ) ( not ( = ?auto_193951 ?auto_193955 ) ) ( not ( = ?auto_193951 ?auto_193956 ) ) ( not ( = ?auto_193951 ?auto_193957 ) ) ( not ( = ?auto_193951 ?auto_193958 ) ) ( not ( = ?auto_193951 ?auto_193959 ) ) ( not ( = ?auto_193951 ?auto_193960 ) ) ( not ( = ?auto_193951 ?auto_193961 ) ) ( not ( = ?auto_193951 ?auto_193962 ) ) ( not ( = ?auto_193952 ?auto_193953 ) ) ( not ( = ?auto_193952 ?auto_193954 ) ) ( not ( = ?auto_193952 ?auto_193955 ) ) ( not ( = ?auto_193952 ?auto_193956 ) ) ( not ( = ?auto_193952 ?auto_193957 ) ) ( not ( = ?auto_193952 ?auto_193958 ) ) ( not ( = ?auto_193952 ?auto_193959 ) ) ( not ( = ?auto_193952 ?auto_193960 ) ) ( not ( = ?auto_193952 ?auto_193961 ) ) ( not ( = ?auto_193952 ?auto_193962 ) ) ( not ( = ?auto_193953 ?auto_193954 ) ) ( not ( = ?auto_193953 ?auto_193955 ) ) ( not ( = ?auto_193953 ?auto_193956 ) ) ( not ( = ?auto_193953 ?auto_193957 ) ) ( not ( = ?auto_193953 ?auto_193958 ) ) ( not ( = ?auto_193953 ?auto_193959 ) ) ( not ( = ?auto_193953 ?auto_193960 ) ) ( not ( = ?auto_193953 ?auto_193961 ) ) ( not ( = ?auto_193953 ?auto_193962 ) ) ( not ( = ?auto_193954 ?auto_193955 ) ) ( not ( = ?auto_193954 ?auto_193956 ) ) ( not ( = ?auto_193954 ?auto_193957 ) ) ( not ( = ?auto_193954 ?auto_193958 ) ) ( not ( = ?auto_193954 ?auto_193959 ) ) ( not ( = ?auto_193954 ?auto_193960 ) ) ( not ( = ?auto_193954 ?auto_193961 ) ) ( not ( = ?auto_193954 ?auto_193962 ) ) ( not ( = ?auto_193955 ?auto_193956 ) ) ( not ( = ?auto_193955 ?auto_193957 ) ) ( not ( = ?auto_193955 ?auto_193958 ) ) ( not ( = ?auto_193955 ?auto_193959 ) ) ( not ( = ?auto_193955 ?auto_193960 ) ) ( not ( = ?auto_193955 ?auto_193961 ) ) ( not ( = ?auto_193955 ?auto_193962 ) ) ( not ( = ?auto_193956 ?auto_193957 ) ) ( not ( = ?auto_193956 ?auto_193958 ) ) ( not ( = ?auto_193956 ?auto_193959 ) ) ( not ( = ?auto_193956 ?auto_193960 ) ) ( not ( = ?auto_193956 ?auto_193961 ) ) ( not ( = ?auto_193956 ?auto_193962 ) ) ( not ( = ?auto_193957 ?auto_193958 ) ) ( not ( = ?auto_193957 ?auto_193959 ) ) ( not ( = ?auto_193957 ?auto_193960 ) ) ( not ( = ?auto_193957 ?auto_193961 ) ) ( not ( = ?auto_193957 ?auto_193962 ) ) ( not ( = ?auto_193958 ?auto_193959 ) ) ( not ( = ?auto_193958 ?auto_193960 ) ) ( not ( = ?auto_193958 ?auto_193961 ) ) ( not ( = ?auto_193958 ?auto_193962 ) ) ( not ( = ?auto_193959 ?auto_193960 ) ) ( not ( = ?auto_193959 ?auto_193961 ) ) ( not ( = ?auto_193959 ?auto_193962 ) ) ( not ( = ?auto_193960 ?auto_193961 ) ) ( not ( = ?auto_193960 ?auto_193962 ) ) ( not ( = ?auto_193961 ?auto_193962 ) ) ( ON ?auto_193960 ?auto_193961 ) ( ON ?auto_193959 ?auto_193960 ) ( CLEAR ?auto_193957 ) ( ON ?auto_193958 ?auto_193959 ) ( CLEAR ?auto_193958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_193950 ?auto_193951 ?auto_193952 ?auto_193953 ?auto_193954 ?auto_193955 ?auto_193956 ?auto_193957 ?auto_193958 )
      ( MAKE-12PILE ?auto_193950 ?auto_193951 ?auto_193952 ?auto_193953 ?auto_193954 ?auto_193955 ?auto_193956 ?auto_193957 ?auto_193958 ?auto_193959 ?auto_193960 ?auto_193961 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_193975 - BLOCK
      ?auto_193976 - BLOCK
      ?auto_193977 - BLOCK
      ?auto_193978 - BLOCK
      ?auto_193979 - BLOCK
      ?auto_193980 - BLOCK
      ?auto_193981 - BLOCK
      ?auto_193982 - BLOCK
      ?auto_193983 - BLOCK
      ?auto_193984 - BLOCK
      ?auto_193985 - BLOCK
      ?auto_193986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193986 ) ( ON-TABLE ?auto_193975 ) ( ON ?auto_193976 ?auto_193975 ) ( ON ?auto_193977 ?auto_193976 ) ( ON ?auto_193978 ?auto_193977 ) ( ON ?auto_193979 ?auto_193978 ) ( ON ?auto_193980 ?auto_193979 ) ( ON ?auto_193981 ?auto_193980 ) ( ON ?auto_193982 ?auto_193981 ) ( not ( = ?auto_193975 ?auto_193976 ) ) ( not ( = ?auto_193975 ?auto_193977 ) ) ( not ( = ?auto_193975 ?auto_193978 ) ) ( not ( = ?auto_193975 ?auto_193979 ) ) ( not ( = ?auto_193975 ?auto_193980 ) ) ( not ( = ?auto_193975 ?auto_193981 ) ) ( not ( = ?auto_193975 ?auto_193982 ) ) ( not ( = ?auto_193975 ?auto_193983 ) ) ( not ( = ?auto_193975 ?auto_193984 ) ) ( not ( = ?auto_193975 ?auto_193985 ) ) ( not ( = ?auto_193975 ?auto_193986 ) ) ( not ( = ?auto_193976 ?auto_193977 ) ) ( not ( = ?auto_193976 ?auto_193978 ) ) ( not ( = ?auto_193976 ?auto_193979 ) ) ( not ( = ?auto_193976 ?auto_193980 ) ) ( not ( = ?auto_193976 ?auto_193981 ) ) ( not ( = ?auto_193976 ?auto_193982 ) ) ( not ( = ?auto_193976 ?auto_193983 ) ) ( not ( = ?auto_193976 ?auto_193984 ) ) ( not ( = ?auto_193976 ?auto_193985 ) ) ( not ( = ?auto_193976 ?auto_193986 ) ) ( not ( = ?auto_193977 ?auto_193978 ) ) ( not ( = ?auto_193977 ?auto_193979 ) ) ( not ( = ?auto_193977 ?auto_193980 ) ) ( not ( = ?auto_193977 ?auto_193981 ) ) ( not ( = ?auto_193977 ?auto_193982 ) ) ( not ( = ?auto_193977 ?auto_193983 ) ) ( not ( = ?auto_193977 ?auto_193984 ) ) ( not ( = ?auto_193977 ?auto_193985 ) ) ( not ( = ?auto_193977 ?auto_193986 ) ) ( not ( = ?auto_193978 ?auto_193979 ) ) ( not ( = ?auto_193978 ?auto_193980 ) ) ( not ( = ?auto_193978 ?auto_193981 ) ) ( not ( = ?auto_193978 ?auto_193982 ) ) ( not ( = ?auto_193978 ?auto_193983 ) ) ( not ( = ?auto_193978 ?auto_193984 ) ) ( not ( = ?auto_193978 ?auto_193985 ) ) ( not ( = ?auto_193978 ?auto_193986 ) ) ( not ( = ?auto_193979 ?auto_193980 ) ) ( not ( = ?auto_193979 ?auto_193981 ) ) ( not ( = ?auto_193979 ?auto_193982 ) ) ( not ( = ?auto_193979 ?auto_193983 ) ) ( not ( = ?auto_193979 ?auto_193984 ) ) ( not ( = ?auto_193979 ?auto_193985 ) ) ( not ( = ?auto_193979 ?auto_193986 ) ) ( not ( = ?auto_193980 ?auto_193981 ) ) ( not ( = ?auto_193980 ?auto_193982 ) ) ( not ( = ?auto_193980 ?auto_193983 ) ) ( not ( = ?auto_193980 ?auto_193984 ) ) ( not ( = ?auto_193980 ?auto_193985 ) ) ( not ( = ?auto_193980 ?auto_193986 ) ) ( not ( = ?auto_193981 ?auto_193982 ) ) ( not ( = ?auto_193981 ?auto_193983 ) ) ( not ( = ?auto_193981 ?auto_193984 ) ) ( not ( = ?auto_193981 ?auto_193985 ) ) ( not ( = ?auto_193981 ?auto_193986 ) ) ( not ( = ?auto_193982 ?auto_193983 ) ) ( not ( = ?auto_193982 ?auto_193984 ) ) ( not ( = ?auto_193982 ?auto_193985 ) ) ( not ( = ?auto_193982 ?auto_193986 ) ) ( not ( = ?auto_193983 ?auto_193984 ) ) ( not ( = ?auto_193983 ?auto_193985 ) ) ( not ( = ?auto_193983 ?auto_193986 ) ) ( not ( = ?auto_193984 ?auto_193985 ) ) ( not ( = ?auto_193984 ?auto_193986 ) ) ( not ( = ?auto_193985 ?auto_193986 ) ) ( ON ?auto_193985 ?auto_193986 ) ( ON ?auto_193984 ?auto_193985 ) ( CLEAR ?auto_193982 ) ( ON ?auto_193983 ?auto_193984 ) ( CLEAR ?auto_193983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_193975 ?auto_193976 ?auto_193977 ?auto_193978 ?auto_193979 ?auto_193980 ?auto_193981 ?auto_193982 ?auto_193983 )
      ( MAKE-12PILE ?auto_193975 ?auto_193976 ?auto_193977 ?auto_193978 ?auto_193979 ?auto_193980 ?auto_193981 ?auto_193982 ?auto_193983 ?auto_193984 ?auto_193985 ?auto_193986 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_193999 - BLOCK
      ?auto_194000 - BLOCK
      ?auto_194001 - BLOCK
      ?auto_194002 - BLOCK
      ?auto_194003 - BLOCK
      ?auto_194004 - BLOCK
      ?auto_194005 - BLOCK
      ?auto_194006 - BLOCK
      ?auto_194007 - BLOCK
      ?auto_194008 - BLOCK
      ?auto_194009 - BLOCK
      ?auto_194010 - BLOCK
    )
    :vars
    (
      ?auto_194011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194010 ?auto_194011 ) ( ON-TABLE ?auto_193999 ) ( ON ?auto_194000 ?auto_193999 ) ( ON ?auto_194001 ?auto_194000 ) ( ON ?auto_194002 ?auto_194001 ) ( ON ?auto_194003 ?auto_194002 ) ( ON ?auto_194004 ?auto_194003 ) ( ON ?auto_194005 ?auto_194004 ) ( not ( = ?auto_193999 ?auto_194000 ) ) ( not ( = ?auto_193999 ?auto_194001 ) ) ( not ( = ?auto_193999 ?auto_194002 ) ) ( not ( = ?auto_193999 ?auto_194003 ) ) ( not ( = ?auto_193999 ?auto_194004 ) ) ( not ( = ?auto_193999 ?auto_194005 ) ) ( not ( = ?auto_193999 ?auto_194006 ) ) ( not ( = ?auto_193999 ?auto_194007 ) ) ( not ( = ?auto_193999 ?auto_194008 ) ) ( not ( = ?auto_193999 ?auto_194009 ) ) ( not ( = ?auto_193999 ?auto_194010 ) ) ( not ( = ?auto_193999 ?auto_194011 ) ) ( not ( = ?auto_194000 ?auto_194001 ) ) ( not ( = ?auto_194000 ?auto_194002 ) ) ( not ( = ?auto_194000 ?auto_194003 ) ) ( not ( = ?auto_194000 ?auto_194004 ) ) ( not ( = ?auto_194000 ?auto_194005 ) ) ( not ( = ?auto_194000 ?auto_194006 ) ) ( not ( = ?auto_194000 ?auto_194007 ) ) ( not ( = ?auto_194000 ?auto_194008 ) ) ( not ( = ?auto_194000 ?auto_194009 ) ) ( not ( = ?auto_194000 ?auto_194010 ) ) ( not ( = ?auto_194000 ?auto_194011 ) ) ( not ( = ?auto_194001 ?auto_194002 ) ) ( not ( = ?auto_194001 ?auto_194003 ) ) ( not ( = ?auto_194001 ?auto_194004 ) ) ( not ( = ?auto_194001 ?auto_194005 ) ) ( not ( = ?auto_194001 ?auto_194006 ) ) ( not ( = ?auto_194001 ?auto_194007 ) ) ( not ( = ?auto_194001 ?auto_194008 ) ) ( not ( = ?auto_194001 ?auto_194009 ) ) ( not ( = ?auto_194001 ?auto_194010 ) ) ( not ( = ?auto_194001 ?auto_194011 ) ) ( not ( = ?auto_194002 ?auto_194003 ) ) ( not ( = ?auto_194002 ?auto_194004 ) ) ( not ( = ?auto_194002 ?auto_194005 ) ) ( not ( = ?auto_194002 ?auto_194006 ) ) ( not ( = ?auto_194002 ?auto_194007 ) ) ( not ( = ?auto_194002 ?auto_194008 ) ) ( not ( = ?auto_194002 ?auto_194009 ) ) ( not ( = ?auto_194002 ?auto_194010 ) ) ( not ( = ?auto_194002 ?auto_194011 ) ) ( not ( = ?auto_194003 ?auto_194004 ) ) ( not ( = ?auto_194003 ?auto_194005 ) ) ( not ( = ?auto_194003 ?auto_194006 ) ) ( not ( = ?auto_194003 ?auto_194007 ) ) ( not ( = ?auto_194003 ?auto_194008 ) ) ( not ( = ?auto_194003 ?auto_194009 ) ) ( not ( = ?auto_194003 ?auto_194010 ) ) ( not ( = ?auto_194003 ?auto_194011 ) ) ( not ( = ?auto_194004 ?auto_194005 ) ) ( not ( = ?auto_194004 ?auto_194006 ) ) ( not ( = ?auto_194004 ?auto_194007 ) ) ( not ( = ?auto_194004 ?auto_194008 ) ) ( not ( = ?auto_194004 ?auto_194009 ) ) ( not ( = ?auto_194004 ?auto_194010 ) ) ( not ( = ?auto_194004 ?auto_194011 ) ) ( not ( = ?auto_194005 ?auto_194006 ) ) ( not ( = ?auto_194005 ?auto_194007 ) ) ( not ( = ?auto_194005 ?auto_194008 ) ) ( not ( = ?auto_194005 ?auto_194009 ) ) ( not ( = ?auto_194005 ?auto_194010 ) ) ( not ( = ?auto_194005 ?auto_194011 ) ) ( not ( = ?auto_194006 ?auto_194007 ) ) ( not ( = ?auto_194006 ?auto_194008 ) ) ( not ( = ?auto_194006 ?auto_194009 ) ) ( not ( = ?auto_194006 ?auto_194010 ) ) ( not ( = ?auto_194006 ?auto_194011 ) ) ( not ( = ?auto_194007 ?auto_194008 ) ) ( not ( = ?auto_194007 ?auto_194009 ) ) ( not ( = ?auto_194007 ?auto_194010 ) ) ( not ( = ?auto_194007 ?auto_194011 ) ) ( not ( = ?auto_194008 ?auto_194009 ) ) ( not ( = ?auto_194008 ?auto_194010 ) ) ( not ( = ?auto_194008 ?auto_194011 ) ) ( not ( = ?auto_194009 ?auto_194010 ) ) ( not ( = ?auto_194009 ?auto_194011 ) ) ( not ( = ?auto_194010 ?auto_194011 ) ) ( ON ?auto_194009 ?auto_194010 ) ( ON ?auto_194008 ?auto_194009 ) ( ON ?auto_194007 ?auto_194008 ) ( CLEAR ?auto_194005 ) ( ON ?auto_194006 ?auto_194007 ) ( CLEAR ?auto_194006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_193999 ?auto_194000 ?auto_194001 ?auto_194002 ?auto_194003 ?auto_194004 ?auto_194005 ?auto_194006 )
      ( MAKE-12PILE ?auto_193999 ?auto_194000 ?auto_194001 ?auto_194002 ?auto_194003 ?auto_194004 ?auto_194005 ?auto_194006 ?auto_194007 ?auto_194008 ?auto_194009 ?auto_194010 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194024 - BLOCK
      ?auto_194025 - BLOCK
      ?auto_194026 - BLOCK
      ?auto_194027 - BLOCK
      ?auto_194028 - BLOCK
      ?auto_194029 - BLOCK
      ?auto_194030 - BLOCK
      ?auto_194031 - BLOCK
      ?auto_194032 - BLOCK
      ?auto_194033 - BLOCK
      ?auto_194034 - BLOCK
      ?auto_194035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194035 ) ( ON-TABLE ?auto_194024 ) ( ON ?auto_194025 ?auto_194024 ) ( ON ?auto_194026 ?auto_194025 ) ( ON ?auto_194027 ?auto_194026 ) ( ON ?auto_194028 ?auto_194027 ) ( ON ?auto_194029 ?auto_194028 ) ( ON ?auto_194030 ?auto_194029 ) ( not ( = ?auto_194024 ?auto_194025 ) ) ( not ( = ?auto_194024 ?auto_194026 ) ) ( not ( = ?auto_194024 ?auto_194027 ) ) ( not ( = ?auto_194024 ?auto_194028 ) ) ( not ( = ?auto_194024 ?auto_194029 ) ) ( not ( = ?auto_194024 ?auto_194030 ) ) ( not ( = ?auto_194024 ?auto_194031 ) ) ( not ( = ?auto_194024 ?auto_194032 ) ) ( not ( = ?auto_194024 ?auto_194033 ) ) ( not ( = ?auto_194024 ?auto_194034 ) ) ( not ( = ?auto_194024 ?auto_194035 ) ) ( not ( = ?auto_194025 ?auto_194026 ) ) ( not ( = ?auto_194025 ?auto_194027 ) ) ( not ( = ?auto_194025 ?auto_194028 ) ) ( not ( = ?auto_194025 ?auto_194029 ) ) ( not ( = ?auto_194025 ?auto_194030 ) ) ( not ( = ?auto_194025 ?auto_194031 ) ) ( not ( = ?auto_194025 ?auto_194032 ) ) ( not ( = ?auto_194025 ?auto_194033 ) ) ( not ( = ?auto_194025 ?auto_194034 ) ) ( not ( = ?auto_194025 ?auto_194035 ) ) ( not ( = ?auto_194026 ?auto_194027 ) ) ( not ( = ?auto_194026 ?auto_194028 ) ) ( not ( = ?auto_194026 ?auto_194029 ) ) ( not ( = ?auto_194026 ?auto_194030 ) ) ( not ( = ?auto_194026 ?auto_194031 ) ) ( not ( = ?auto_194026 ?auto_194032 ) ) ( not ( = ?auto_194026 ?auto_194033 ) ) ( not ( = ?auto_194026 ?auto_194034 ) ) ( not ( = ?auto_194026 ?auto_194035 ) ) ( not ( = ?auto_194027 ?auto_194028 ) ) ( not ( = ?auto_194027 ?auto_194029 ) ) ( not ( = ?auto_194027 ?auto_194030 ) ) ( not ( = ?auto_194027 ?auto_194031 ) ) ( not ( = ?auto_194027 ?auto_194032 ) ) ( not ( = ?auto_194027 ?auto_194033 ) ) ( not ( = ?auto_194027 ?auto_194034 ) ) ( not ( = ?auto_194027 ?auto_194035 ) ) ( not ( = ?auto_194028 ?auto_194029 ) ) ( not ( = ?auto_194028 ?auto_194030 ) ) ( not ( = ?auto_194028 ?auto_194031 ) ) ( not ( = ?auto_194028 ?auto_194032 ) ) ( not ( = ?auto_194028 ?auto_194033 ) ) ( not ( = ?auto_194028 ?auto_194034 ) ) ( not ( = ?auto_194028 ?auto_194035 ) ) ( not ( = ?auto_194029 ?auto_194030 ) ) ( not ( = ?auto_194029 ?auto_194031 ) ) ( not ( = ?auto_194029 ?auto_194032 ) ) ( not ( = ?auto_194029 ?auto_194033 ) ) ( not ( = ?auto_194029 ?auto_194034 ) ) ( not ( = ?auto_194029 ?auto_194035 ) ) ( not ( = ?auto_194030 ?auto_194031 ) ) ( not ( = ?auto_194030 ?auto_194032 ) ) ( not ( = ?auto_194030 ?auto_194033 ) ) ( not ( = ?auto_194030 ?auto_194034 ) ) ( not ( = ?auto_194030 ?auto_194035 ) ) ( not ( = ?auto_194031 ?auto_194032 ) ) ( not ( = ?auto_194031 ?auto_194033 ) ) ( not ( = ?auto_194031 ?auto_194034 ) ) ( not ( = ?auto_194031 ?auto_194035 ) ) ( not ( = ?auto_194032 ?auto_194033 ) ) ( not ( = ?auto_194032 ?auto_194034 ) ) ( not ( = ?auto_194032 ?auto_194035 ) ) ( not ( = ?auto_194033 ?auto_194034 ) ) ( not ( = ?auto_194033 ?auto_194035 ) ) ( not ( = ?auto_194034 ?auto_194035 ) ) ( ON ?auto_194034 ?auto_194035 ) ( ON ?auto_194033 ?auto_194034 ) ( ON ?auto_194032 ?auto_194033 ) ( CLEAR ?auto_194030 ) ( ON ?auto_194031 ?auto_194032 ) ( CLEAR ?auto_194031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_194024 ?auto_194025 ?auto_194026 ?auto_194027 ?auto_194028 ?auto_194029 ?auto_194030 ?auto_194031 )
      ( MAKE-12PILE ?auto_194024 ?auto_194025 ?auto_194026 ?auto_194027 ?auto_194028 ?auto_194029 ?auto_194030 ?auto_194031 ?auto_194032 ?auto_194033 ?auto_194034 ?auto_194035 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194048 - BLOCK
      ?auto_194049 - BLOCK
      ?auto_194050 - BLOCK
      ?auto_194051 - BLOCK
      ?auto_194052 - BLOCK
      ?auto_194053 - BLOCK
      ?auto_194054 - BLOCK
      ?auto_194055 - BLOCK
      ?auto_194056 - BLOCK
      ?auto_194057 - BLOCK
      ?auto_194058 - BLOCK
      ?auto_194059 - BLOCK
    )
    :vars
    (
      ?auto_194060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194059 ?auto_194060 ) ( ON-TABLE ?auto_194048 ) ( ON ?auto_194049 ?auto_194048 ) ( ON ?auto_194050 ?auto_194049 ) ( ON ?auto_194051 ?auto_194050 ) ( ON ?auto_194052 ?auto_194051 ) ( ON ?auto_194053 ?auto_194052 ) ( not ( = ?auto_194048 ?auto_194049 ) ) ( not ( = ?auto_194048 ?auto_194050 ) ) ( not ( = ?auto_194048 ?auto_194051 ) ) ( not ( = ?auto_194048 ?auto_194052 ) ) ( not ( = ?auto_194048 ?auto_194053 ) ) ( not ( = ?auto_194048 ?auto_194054 ) ) ( not ( = ?auto_194048 ?auto_194055 ) ) ( not ( = ?auto_194048 ?auto_194056 ) ) ( not ( = ?auto_194048 ?auto_194057 ) ) ( not ( = ?auto_194048 ?auto_194058 ) ) ( not ( = ?auto_194048 ?auto_194059 ) ) ( not ( = ?auto_194048 ?auto_194060 ) ) ( not ( = ?auto_194049 ?auto_194050 ) ) ( not ( = ?auto_194049 ?auto_194051 ) ) ( not ( = ?auto_194049 ?auto_194052 ) ) ( not ( = ?auto_194049 ?auto_194053 ) ) ( not ( = ?auto_194049 ?auto_194054 ) ) ( not ( = ?auto_194049 ?auto_194055 ) ) ( not ( = ?auto_194049 ?auto_194056 ) ) ( not ( = ?auto_194049 ?auto_194057 ) ) ( not ( = ?auto_194049 ?auto_194058 ) ) ( not ( = ?auto_194049 ?auto_194059 ) ) ( not ( = ?auto_194049 ?auto_194060 ) ) ( not ( = ?auto_194050 ?auto_194051 ) ) ( not ( = ?auto_194050 ?auto_194052 ) ) ( not ( = ?auto_194050 ?auto_194053 ) ) ( not ( = ?auto_194050 ?auto_194054 ) ) ( not ( = ?auto_194050 ?auto_194055 ) ) ( not ( = ?auto_194050 ?auto_194056 ) ) ( not ( = ?auto_194050 ?auto_194057 ) ) ( not ( = ?auto_194050 ?auto_194058 ) ) ( not ( = ?auto_194050 ?auto_194059 ) ) ( not ( = ?auto_194050 ?auto_194060 ) ) ( not ( = ?auto_194051 ?auto_194052 ) ) ( not ( = ?auto_194051 ?auto_194053 ) ) ( not ( = ?auto_194051 ?auto_194054 ) ) ( not ( = ?auto_194051 ?auto_194055 ) ) ( not ( = ?auto_194051 ?auto_194056 ) ) ( not ( = ?auto_194051 ?auto_194057 ) ) ( not ( = ?auto_194051 ?auto_194058 ) ) ( not ( = ?auto_194051 ?auto_194059 ) ) ( not ( = ?auto_194051 ?auto_194060 ) ) ( not ( = ?auto_194052 ?auto_194053 ) ) ( not ( = ?auto_194052 ?auto_194054 ) ) ( not ( = ?auto_194052 ?auto_194055 ) ) ( not ( = ?auto_194052 ?auto_194056 ) ) ( not ( = ?auto_194052 ?auto_194057 ) ) ( not ( = ?auto_194052 ?auto_194058 ) ) ( not ( = ?auto_194052 ?auto_194059 ) ) ( not ( = ?auto_194052 ?auto_194060 ) ) ( not ( = ?auto_194053 ?auto_194054 ) ) ( not ( = ?auto_194053 ?auto_194055 ) ) ( not ( = ?auto_194053 ?auto_194056 ) ) ( not ( = ?auto_194053 ?auto_194057 ) ) ( not ( = ?auto_194053 ?auto_194058 ) ) ( not ( = ?auto_194053 ?auto_194059 ) ) ( not ( = ?auto_194053 ?auto_194060 ) ) ( not ( = ?auto_194054 ?auto_194055 ) ) ( not ( = ?auto_194054 ?auto_194056 ) ) ( not ( = ?auto_194054 ?auto_194057 ) ) ( not ( = ?auto_194054 ?auto_194058 ) ) ( not ( = ?auto_194054 ?auto_194059 ) ) ( not ( = ?auto_194054 ?auto_194060 ) ) ( not ( = ?auto_194055 ?auto_194056 ) ) ( not ( = ?auto_194055 ?auto_194057 ) ) ( not ( = ?auto_194055 ?auto_194058 ) ) ( not ( = ?auto_194055 ?auto_194059 ) ) ( not ( = ?auto_194055 ?auto_194060 ) ) ( not ( = ?auto_194056 ?auto_194057 ) ) ( not ( = ?auto_194056 ?auto_194058 ) ) ( not ( = ?auto_194056 ?auto_194059 ) ) ( not ( = ?auto_194056 ?auto_194060 ) ) ( not ( = ?auto_194057 ?auto_194058 ) ) ( not ( = ?auto_194057 ?auto_194059 ) ) ( not ( = ?auto_194057 ?auto_194060 ) ) ( not ( = ?auto_194058 ?auto_194059 ) ) ( not ( = ?auto_194058 ?auto_194060 ) ) ( not ( = ?auto_194059 ?auto_194060 ) ) ( ON ?auto_194058 ?auto_194059 ) ( ON ?auto_194057 ?auto_194058 ) ( ON ?auto_194056 ?auto_194057 ) ( ON ?auto_194055 ?auto_194056 ) ( CLEAR ?auto_194053 ) ( ON ?auto_194054 ?auto_194055 ) ( CLEAR ?auto_194054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194048 ?auto_194049 ?auto_194050 ?auto_194051 ?auto_194052 ?auto_194053 ?auto_194054 )
      ( MAKE-12PILE ?auto_194048 ?auto_194049 ?auto_194050 ?auto_194051 ?auto_194052 ?auto_194053 ?auto_194054 ?auto_194055 ?auto_194056 ?auto_194057 ?auto_194058 ?auto_194059 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194073 - BLOCK
      ?auto_194074 - BLOCK
      ?auto_194075 - BLOCK
      ?auto_194076 - BLOCK
      ?auto_194077 - BLOCK
      ?auto_194078 - BLOCK
      ?auto_194079 - BLOCK
      ?auto_194080 - BLOCK
      ?auto_194081 - BLOCK
      ?auto_194082 - BLOCK
      ?auto_194083 - BLOCK
      ?auto_194084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194084 ) ( ON-TABLE ?auto_194073 ) ( ON ?auto_194074 ?auto_194073 ) ( ON ?auto_194075 ?auto_194074 ) ( ON ?auto_194076 ?auto_194075 ) ( ON ?auto_194077 ?auto_194076 ) ( ON ?auto_194078 ?auto_194077 ) ( not ( = ?auto_194073 ?auto_194074 ) ) ( not ( = ?auto_194073 ?auto_194075 ) ) ( not ( = ?auto_194073 ?auto_194076 ) ) ( not ( = ?auto_194073 ?auto_194077 ) ) ( not ( = ?auto_194073 ?auto_194078 ) ) ( not ( = ?auto_194073 ?auto_194079 ) ) ( not ( = ?auto_194073 ?auto_194080 ) ) ( not ( = ?auto_194073 ?auto_194081 ) ) ( not ( = ?auto_194073 ?auto_194082 ) ) ( not ( = ?auto_194073 ?auto_194083 ) ) ( not ( = ?auto_194073 ?auto_194084 ) ) ( not ( = ?auto_194074 ?auto_194075 ) ) ( not ( = ?auto_194074 ?auto_194076 ) ) ( not ( = ?auto_194074 ?auto_194077 ) ) ( not ( = ?auto_194074 ?auto_194078 ) ) ( not ( = ?auto_194074 ?auto_194079 ) ) ( not ( = ?auto_194074 ?auto_194080 ) ) ( not ( = ?auto_194074 ?auto_194081 ) ) ( not ( = ?auto_194074 ?auto_194082 ) ) ( not ( = ?auto_194074 ?auto_194083 ) ) ( not ( = ?auto_194074 ?auto_194084 ) ) ( not ( = ?auto_194075 ?auto_194076 ) ) ( not ( = ?auto_194075 ?auto_194077 ) ) ( not ( = ?auto_194075 ?auto_194078 ) ) ( not ( = ?auto_194075 ?auto_194079 ) ) ( not ( = ?auto_194075 ?auto_194080 ) ) ( not ( = ?auto_194075 ?auto_194081 ) ) ( not ( = ?auto_194075 ?auto_194082 ) ) ( not ( = ?auto_194075 ?auto_194083 ) ) ( not ( = ?auto_194075 ?auto_194084 ) ) ( not ( = ?auto_194076 ?auto_194077 ) ) ( not ( = ?auto_194076 ?auto_194078 ) ) ( not ( = ?auto_194076 ?auto_194079 ) ) ( not ( = ?auto_194076 ?auto_194080 ) ) ( not ( = ?auto_194076 ?auto_194081 ) ) ( not ( = ?auto_194076 ?auto_194082 ) ) ( not ( = ?auto_194076 ?auto_194083 ) ) ( not ( = ?auto_194076 ?auto_194084 ) ) ( not ( = ?auto_194077 ?auto_194078 ) ) ( not ( = ?auto_194077 ?auto_194079 ) ) ( not ( = ?auto_194077 ?auto_194080 ) ) ( not ( = ?auto_194077 ?auto_194081 ) ) ( not ( = ?auto_194077 ?auto_194082 ) ) ( not ( = ?auto_194077 ?auto_194083 ) ) ( not ( = ?auto_194077 ?auto_194084 ) ) ( not ( = ?auto_194078 ?auto_194079 ) ) ( not ( = ?auto_194078 ?auto_194080 ) ) ( not ( = ?auto_194078 ?auto_194081 ) ) ( not ( = ?auto_194078 ?auto_194082 ) ) ( not ( = ?auto_194078 ?auto_194083 ) ) ( not ( = ?auto_194078 ?auto_194084 ) ) ( not ( = ?auto_194079 ?auto_194080 ) ) ( not ( = ?auto_194079 ?auto_194081 ) ) ( not ( = ?auto_194079 ?auto_194082 ) ) ( not ( = ?auto_194079 ?auto_194083 ) ) ( not ( = ?auto_194079 ?auto_194084 ) ) ( not ( = ?auto_194080 ?auto_194081 ) ) ( not ( = ?auto_194080 ?auto_194082 ) ) ( not ( = ?auto_194080 ?auto_194083 ) ) ( not ( = ?auto_194080 ?auto_194084 ) ) ( not ( = ?auto_194081 ?auto_194082 ) ) ( not ( = ?auto_194081 ?auto_194083 ) ) ( not ( = ?auto_194081 ?auto_194084 ) ) ( not ( = ?auto_194082 ?auto_194083 ) ) ( not ( = ?auto_194082 ?auto_194084 ) ) ( not ( = ?auto_194083 ?auto_194084 ) ) ( ON ?auto_194083 ?auto_194084 ) ( ON ?auto_194082 ?auto_194083 ) ( ON ?auto_194081 ?auto_194082 ) ( ON ?auto_194080 ?auto_194081 ) ( CLEAR ?auto_194078 ) ( ON ?auto_194079 ?auto_194080 ) ( CLEAR ?auto_194079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194073 ?auto_194074 ?auto_194075 ?auto_194076 ?auto_194077 ?auto_194078 ?auto_194079 )
      ( MAKE-12PILE ?auto_194073 ?auto_194074 ?auto_194075 ?auto_194076 ?auto_194077 ?auto_194078 ?auto_194079 ?auto_194080 ?auto_194081 ?auto_194082 ?auto_194083 ?auto_194084 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194097 - BLOCK
      ?auto_194098 - BLOCK
      ?auto_194099 - BLOCK
      ?auto_194100 - BLOCK
      ?auto_194101 - BLOCK
      ?auto_194102 - BLOCK
      ?auto_194103 - BLOCK
      ?auto_194104 - BLOCK
      ?auto_194105 - BLOCK
      ?auto_194106 - BLOCK
      ?auto_194107 - BLOCK
      ?auto_194108 - BLOCK
    )
    :vars
    (
      ?auto_194109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194108 ?auto_194109 ) ( ON-TABLE ?auto_194097 ) ( ON ?auto_194098 ?auto_194097 ) ( ON ?auto_194099 ?auto_194098 ) ( ON ?auto_194100 ?auto_194099 ) ( ON ?auto_194101 ?auto_194100 ) ( not ( = ?auto_194097 ?auto_194098 ) ) ( not ( = ?auto_194097 ?auto_194099 ) ) ( not ( = ?auto_194097 ?auto_194100 ) ) ( not ( = ?auto_194097 ?auto_194101 ) ) ( not ( = ?auto_194097 ?auto_194102 ) ) ( not ( = ?auto_194097 ?auto_194103 ) ) ( not ( = ?auto_194097 ?auto_194104 ) ) ( not ( = ?auto_194097 ?auto_194105 ) ) ( not ( = ?auto_194097 ?auto_194106 ) ) ( not ( = ?auto_194097 ?auto_194107 ) ) ( not ( = ?auto_194097 ?auto_194108 ) ) ( not ( = ?auto_194097 ?auto_194109 ) ) ( not ( = ?auto_194098 ?auto_194099 ) ) ( not ( = ?auto_194098 ?auto_194100 ) ) ( not ( = ?auto_194098 ?auto_194101 ) ) ( not ( = ?auto_194098 ?auto_194102 ) ) ( not ( = ?auto_194098 ?auto_194103 ) ) ( not ( = ?auto_194098 ?auto_194104 ) ) ( not ( = ?auto_194098 ?auto_194105 ) ) ( not ( = ?auto_194098 ?auto_194106 ) ) ( not ( = ?auto_194098 ?auto_194107 ) ) ( not ( = ?auto_194098 ?auto_194108 ) ) ( not ( = ?auto_194098 ?auto_194109 ) ) ( not ( = ?auto_194099 ?auto_194100 ) ) ( not ( = ?auto_194099 ?auto_194101 ) ) ( not ( = ?auto_194099 ?auto_194102 ) ) ( not ( = ?auto_194099 ?auto_194103 ) ) ( not ( = ?auto_194099 ?auto_194104 ) ) ( not ( = ?auto_194099 ?auto_194105 ) ) ( not ( = ?auto_194099 ?auto_194106 ) ) ( not ( = ?auto_194099 ?auto_194107 ) ) ( not ( = ?auto_194099 ?auto_194108 ) ) ( not ( = ?auto_194099 ?auto_194109 ) ) ( not ( = ?auto_194100 ?auto_194101 ) ) ( not ( = ?auto_194100 ?auto_194102 ) ) ( not ( = ?auto_194100 ?auto_194103 ) ) ( not ( = ?auto_194100 ?auto_194104 ) ) ( not ( = ?auto_194100 ?auto_194105 ) ) ( not ( = ?auto_194100 ?auto_194106 ) ) ( not ( = ?auto_194100 ?auto_194107 ) ) ( not ( = ?auto_194100 ?auto_194108 ) ) ( not ( = ?auto_194100 ?auto_194109 ) ) ( not ( = ?auto_194101 ?auto_194102 ) ) ( not ( = ?auto_194101 ?auto_194103 ) ) ( not ( = ?auto_194101 ?auto_194104 ) ) ( not ( = ?auto_194101 ?auto_194105 ) ) ( not ( = ?auto_194101 ?auto_194106 ) ) ( not ( = ?auto_194101 ?auto_194107 ) ) ( not ( = ?auto_194101 ?auto_194108 ) ) ( not ( = ?auto_194101 ?auto_194109 ) ) ( not ( = ?auto_194102 ?auto_194103 ) ) ( not ( = ?auto_194102 ?auto_194104 ) ) ( not ( = ?auto_194102 ?auto_194105 ) ) ( not ( = ?auto_194102 ?auto_194106 ) ) ( not ( = ?auto_194102 ?auto_194107 ) ) ( not ( = ?auto_194102 ?auto_194108 ) ) ( not ( = ?auto_194102 ?auto_194109 ) ) ( not ( = ?auto_194103 ?auto_194104 ) ) ( not ( = ?auto_194103 ?auto_194105 ) ) ( not ( = ?auto_194103 ?auto_194106 ) ) ( not ( = ?auto_194103 ?auto_194107 ) ) ( not ( = ?auto_194103 ?auto_194108 ) ) ( not ( = ?auto_194103 ?auto_194109 ) ) ( not ( = ?auto_194104 ?auto_194105 ) ) ( not ( = ?auto_194104 ?auto_194106 ) ) ( not ( = ?auto_194104 ?auto_194107 ) ) ( not ( = ?auto_194104 ?auto_194108 ) ) ( not ( = ?auto_194104 ?auto_194109 ) ) ( not ( = ?auto_194105 ?auto_194106 ) ) ( not ( = ?auto_194105 ?auto_194107 ) ) ( not ( = ?auto_194105 ?auto_194108 ) ) ( not ( = ?auto_194105 ?auto_194109 ) ) ( not ( = ?auto_194106 ?auto_194107 ) ) ( not ( = ?auto_194106 ?auto_194108 ) ) ( not ( = ?auto_194106 ?auto_194109 ) ) ( not ( = ?auto_194107 ?auto_194108 ) ) ( not ( = ?auto_194107 ?auto_194109 ) ) ( not ( = ?auto_194108 ?auto_194109 ) ) ( ON ?auto_194107 ?auto_194108 ) ( ON ?auto_194106 ?auto_194107 ) ( ON ?auto_194105 ?auto_194106 ) ( ON ?auto_194104 ?auto_194105 ) ( ON ?auto_194103 ?auto_194104 ) ( CLEAR ?auto_194101 ) ( ON ?auto_194102 ?auto_194103 ) ( CLEAR ?auto_194102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194097 ?auto_194098 ?auto_194099 ?auto_194100 ?auto_194101 ?auto_194102 )
      ( MAKE-12PILE ?auto_194097 ?auto_194098 ?auto_194099 ?auto_194100 ?auto_194101 ?auto_194102 ?auto_194103 ?auto_194104 ?auto_194105 ?auto_194106 ?auto_194107 ?auto_194108 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194122 - BLOCK
      ?auto_194123 - BLOCK
      ?auto_194124 - BLOCK
      ?auto_194125 - BLOCK
      ?auto_194126 - BLOCK
      ?auto_194127 - BLOCK
      ?auto_194128 - BLOCK
      ?auto_194129 - BLOCK
      ?auto_194130 - BLOCK
      ?auto_194131 - BLOCK
      ?auto_194132 - BLOCK
      ?auto_194133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194133 ) ( ON-TABLE ?auto_194122 ) ( ON ?auto_194123 ?auto_194122 ) ( ON ?auto_194124 ?auto_194123 ) ( ON ?auto_194125 ?auto_194124 ) ( ON ?auto_194126 ?auto_194125 ) ( not ( = ?auto_194122 ?auto_194123 ) ) ( not ( = ?auto_194122 ?auto_194124 ) ) ( not ( = ?auto_194122 ?auto_194125 ) ) ( not ( = ?auto_194122 ?auto_194126 ) ) ( not ( = ?auto_194122 ?auto_194127 ) ) ( not ( = ?auto_194122 ?auto_194128 ) ) ( not ( = ?auto_194122 ?auto_194129 ) ) ( not ( = ?auto_194122 ?auto_194130 ) ) ( not ( = ?auto_194122 ?auto_194131 ) ) ( not ( = ?auto_194122 ?auto_194132 ) ) ( not ( = ?auto_194122 ?auto_194133 ) ) ( not ( = ?auto_194123 ?auto_194124 ) ) ( not ( = ?auto_194123 ?auto_194125 ) ) ( not ( = ?auto_194123 ?auto_194126 ) ) ( not ( = ?auto_194123 ?auto_194127 ) ) ( not ( = ?auto_194123 ?auto_194128 ) ) ( not ( = ?auto_194123 ?auto_194129 ) ) ( not ( = ?auto_194123 ?auto_194130 ) ) ( not ( = ?auto_194123 ?auto_194131 ) ) ( not ( = ?auto_194123 ?auto_194132 ) ) ( not ( = ?auto_194123 ?auto_194133 ) ) ( not ( = ?auto_194124 ?auto_194125 ) ) ( not ( = ?auto_194124 ?auto_194126 ) ) ( not ( = ?auto_194124 ?auto_194127 ) ) ( not ( = ?auto_194124 ?auto_194128 ) ) ( not ( = ?auto_194124 ?auto_194129 ) ) ( not ( = ?auto_194124 ?auto_194130 ) ) ( not ( = ?auto_194124 ?auto_194131 ) ) ( not ( = ?auto_194124 ?auto_194132 ) ) ( not ( = ?auto_194124 ?auto_194133 ) ) ( not ( = ?auto_194125 ?auto_194126 ) ) ( not ( = ?auto_194125 ?auto_194127 ) ) ( not ( = ?auto_194125 ?auto_194128 ) ) ( not ( = ?auto_194125 ?auto_194129 ) ) ( not ( = ?auto_194125 ?auto_194130 ) ) ( not ( = ?auto_194125 ?auto_194131 ) ) ( not ( = ?auto_194125 ?auto_194132 ) ) ( not ( = ?auto_194125 ?auto_194133 ) ) ( not ( = ?auto_194126 ?auto_194127 ) ) ( not ( = ?auto_194126 ?auto_194128 ) ) ( not ( = ?auto_194126 ?auto_194129 ) ) ( not ( = ?auto_194126 ?auto_194130 ) ) ( not ( = ?auto_194126 ?auto_194131 ) ) ( not ( = ?auto_194126 ?auto_194132 ) ) ( not ( = ?auto_194126 ?auto_194133 ) ) ( not ( = ?auto_194127 ?auto_194128 ) ) ( not ( = ?auto_194127 ?auto_194129 ) ) ( not ( = ?auto_194127 ?auto_194130 ) ) ( not ( = ?auto_194127 ?auto_194131 ) ) ( not ( = ?auto_194127 ?auto_194132 ) ) ( not ( = ?auto_194127 ?auto_194133 ) ) ( not ( = ?auto_194128 ?auto_194129 ) ) ( not ( = ?auto_194128 ?auto_194130 ) ) ( not ( = ?auto_194128 ?auto_194131 ) ) ( not ( = ?auto_194128 ?auto_194132 ) ) ( not ( = ?auto_194128 ?auto_194133 ) ) ( not ( = ?auto_194129 ?auto_194130 ) ) ( not ( = ?auto_194129 ?auto_194131 ) ) ( not ( = ?auto_194129 ?auto_194132 ) ) ( not ( = ?auto_194129 ?auto_194133 ) ) ( not ( = ?auto_194130 ?auto_194131 ) ) ( not ( = ?auto_194130 ?auto_194132 ) ) ( not ( = ?auto_194130 ?auto_194133 ) ) ( not ( = ?auto_194131 ?auto_194132 ) ) ( not ( = ?auto_194131 ?auto_194133 ) ) ( not ( = ?auto_194132 ?auto_194133 ) ) ( ON ?auto_194132 ?auto_194133 ) ( ON ?auto_194131 ?auto_194132 ) ( ON ?auto_194130 ?auto_194131 ) ( ON ?auto_194129 ?auto_194130 ) ( ON ?auto_194128 ?auto_194129 ) ( CLEAR ?auto_194126 ) ( ON ?auto_194127 ?auto_194128 ) ( CLEAR ?auto_194127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194122 ?auto_194123 ?auto_194124 ?auto_194125 ?auto_194126 ?auto_194127 )
      ( MAKE-12PILE ?auto_194122 ?auto_194123 ?auto_194124 ?auto_194125 ?auto_194126 ?auto_194127 ?auto_194128 ?auto_194129 ?auto_194130 ?auto_194131 ?auto_194132 ?auto_194133 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194146 - BLOCK
      ?auto_194147 - BLOCK
      ?auto_194148 - BLOCK
      ?auto_194149 - BLOCK
      ?auto_194150 - BLOCK
      ?auto_194151 - BLOCK
      ?auto_194152 - BLOCK
      ?auto_194153 - BLOCK
      ?auto_194154 - BLOCK
      ?auto_194155 - BLOCK
      ?auto_194156 - BLOCK
      ?auto_194157 - BLOCK
    )
    :vars
    (
      ?auto_194158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194157 ?auto_194158 ) ( ON-TABLE ?auto_194146 ) ( ON ?auto_194147 ?auto_194146 ) ( ON ?auto_194148 ?auto_194147 ) ( ON ?auto_194149 ?auto_194148 ) ( not ( = ?auto_194146 ?auto_194147 ) ) ( not ( = ?auto_194146 ?auto_194148 ) ) ( not ( = ?auto_194146 ?auto_194149 ) ) ( not ( = ?auto_194146 ?auto_194150 ) ) ( not ( = ?auto_194146 ?auto_194151 ) ) ( not ( = ?auto_194146 ?auto_194152 ) ) ( not ( = ?auto_194146 ?auto_194153 ) ) ( not ( = ?auto_194146 ?auto_194154 ) ) ( not ( = ?auto_194146 ?auto_194155 ) ) ( not ( = ?auto_194146 ?auto_194156 ) ) ( not ( = ?auto_194146 ?auto_194157 ) ) ( not ( = ?auto_194146 ?auto_194158 ) ) ( not ( = ?auto_194147 ?auto_194148 ) ) ( not ( = ?auto_194147 ?auto_194149 ) ) ( not ( = ?auto_194147 ?auto_194150 ) ) ( not ( = ?auto_194147 ?auto_194151 ) ) ( not ( = ?auto_194147 ?auto_194152 ) ) ( not ( = ?auto_194147 ?auto_194153 ) ) ( not ( = ?auto_194147 ?auto_194154 ) ) ( not ( = ?auto_194147 ?auto_194155 ) ) ( not ( = ?auto_194147 ?auto_194156 ) ) ( not ( = ?auto_194147 ?auto_194157 ) ) ( not ( = ?auto_194147 ?auto_194158 ) ) ( not ( = ?auto_194148 ?auto_194149 ) ) ( not ( = ?auto_194148 ?auto_194150 ) ) ( not ( = ?auto_194148 ?auto_194151 ) ) ( not ( = ?auto_194148 ?auto_194152 ) ) ( not ( = ?auto_194148 ?auto_194153 ) ) ( not ( = ?auto_194148 ?auto_194154 ) ) ( not ( = ?auto_194148 ?auto_194155 ) ) ( not ( = ?auto_194148 ?auto_194156 ) ) ( not ( = ?auto_194148 ?auto_194157 ) ) ( not ( = ?auto_194148 ?auto_194158 ) ) ( not ( = ?auto_194149 ?auto_194150 ) ) ( not ( = ?auto_194149 ?auto_194151 ) ) ( not ( = ?auto_194149 ?auto_194152 ) ) ( not ( = ?auto_194149 ?auto_194153 ) ) ( not ( = ?auto_194149 ?auto_194154 ) ) ( not ( = ?auto_194149 ?auto_194155 ) ) ( not ( = ?auto_194149 ?auto_194156 ) ) ( not ( = ?auto_194149 ?auto_194157 ) ) ( not ( = ?auto_194149 ?auto_194158 ) ) ( not ( = ?auto_194150 ?auto_194151 ) ) ( not ( = ?auto_194150 ?auto_194152 ) ) ( not ( = ?auto_194150 ?auto_194153 ) ) ( not ( = ?auto_194150 ?auto_194154 ) ) ( not ( = ?auto_194150 ?auto_194155 ) ) ( not ( = ?auto_194150 ?auto_194156 ) ) ( not ( = ?auto_194150 ?auto_194157 ) ) ( not ( = ?auto_194150 ?auto_194158 ) ) ( not ( = ?auto_194151 ?auto_194152 ) ) ( not ( = ?auto_194151 ?auto_194153 ) ) ( not ( = ?auto_194151 ?auto_194154 ) ) ( not ( = ?auto_194151 ?auto_194155 ) ) ( not ( = ?auto_194151 ?auto_194156 ) ) ( not ( = ?auto_194151 ?auto_194157 ) ) ( not ( = ?auto_194151 ?auto_194158 ) ) ( not ( = ?auto_194152 ?auto_194153 ) ) ( not ( = ?auto_194152 ?auto_194154 ) ) ( not ( = ?auto_194152 ?auto_194155 ) ) ( not ( = ?auto_194152 ?auto_194156 ) ) ( not ( = ?auto_194152 ?auto_194157 ) ) ( not ( = ?auto_194152 ?auto_194158 ) ) ( not ( = ?auto_194153 ?auto_194154 ) ) ( not ( = ?auto_194153 ?auto_194155 ) ) ( not ( = ?auto_194153 ?auto_194156 ) ) ( not ( = ?auto_194153 ?auto_194157 ) ) ( not ( = ?auto_194153 ?auto_194158 ) ) ( not ( = ?auto_194154 ?auto_194155 ) ) ( not ( = ?auto_194154 ?auto_194156 ) ) ( not ( = ?auto_194154 ?auto_194157 ) ) ( not ( = ?auto_194154 ?auto_194158 ) ) ( not ( = ?auto_194155 ?auto_194156 ) ) ( not ( = ?auto_194155 ?auto_194157 ) ) ( not ( = ?auto_194155 ?auto_194158 ) ) ( not ( = ?auto_194156 ?auto_194157 ) ) ( not ( = ?auto_194156 ?auto_194158 ) ) ( not ( = ?auto_194157 ?auto_194158 ) ) ( ON ?auto_194156 ?auto_194157 ) ( ON ?auto_194155 ?auto_194156 ) ( ON ?auto_194154 ?auto_194155 ) ( ON ?auto_194153 ?auto_194154 ) ( ON ?auto_194152 ?auto_194153 ) ( ON ?auto_194151 ?auto_194152 ) ( CLEAR ?auto_194149 ) ( ON ?auto_194150 ?auto_194151 ) ( CLEAR ?auto_194150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194146 ?auto_194147 ?auto_194148 ?auto_194149 ?auto_194150 )
      ( MAKE-12PILE ?auto_194146 ?auto_194147 ?auto_194148 ?auto_194149 ?auto_194150 ?auto_194151 ?auto_194152 ?auto_194153 ?auto_194154 ?auto_194155 ?auto_194156 ?auto_194157 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194171 - BLOCK
      ?auto_194172 - BLOCK
      ?auto_194173 - BLOCK
      ?auto_194174 - BLOCK
      ?auto_194175 - BLOCK
      ?auto_194176 - BLOCK
      ?auto_194177 - BLOCK
      ?auto_194178 - BLOCK
      ?auto_194179 - BLOCK
      ?auto_194180 - BLOCK
      ?auto_194181 - BLOCK
      ?auto_194182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194182 ) ( ON-TABLE ?auto_194171 ) ( ON ?auto_194172 ?auto_194171 ) ( ON ?auto_194173 ?auto_194172 ) ( ON ?auto_194174 ?auto_194173 ) ( not ( = ?auto_194171 ?auto_194172 ) ) ( not ( = ?auto_194171 ?auto_194173 ) ) ( not ( = ?auto_194171 ?auto_194174 ) ) ( not ( = ?auto_194171 ?auto_194175 ) ) ( not ( = ?auto_194171 ?auto_194176 ) ) ( not ( = ?auto_194171 ?auto_194177 ) ) ( not ( = ?auto_194171 ?auto_194178 ) ) ( not ( = ?auto_194171 ?auto_194179 ) ) ( not ( = ?auto_194171 ?auto_194180 ) ) ( not ( = ?auto_194171 ?auto_194181 ) ) ( not ( = ?auto_194171 ?auto_194182 ) ) ( not ( = ?auto_194172 ?auto_194173 ) ) ( not ( = ?auto_194172 ?auto_194174 ) ) ( not ( = ?auto_194172 ?auto_194175 ) ) ( not ( = ?auto_194172 ?auto_194176 ) ) ( not ( = ?auto_194172 ?auto_194177 ) ) ( not ( = ?auto_194172 ?auto_194178 ) ) ( not ( = ?auto_194172 ?auto_194179 ) ) ( not ( = ?auto_194172 ?auto_194180 ) ) ( not ( = ?auto_194172 ?auto_194181 ) ) ( not ( = ?auto_194172 ?auto_194182 ) ) ( not ( = ?auto_194173 ?auto_194174 ) ) ( not ( = ?auto_194173 ?auto_194175 ) ) ( not ( = ?auto_194173 ?auto_194176 ) ) ( not ( = ?auto_194173 ?auto_194177 ) ) ( not ( = ?auto_194173 ?auto_194178 ) ) ( not ( = ?auto_194173 ?auto_194179 ) ) ( not ( = ?auto_194173 ?auto_194180 ) ) ( not ( = ?auto_194173 ?auto_194181 ) ) ( not ( = ?auto_194173 ?auto_194182 ) ) ( not ( = ?auto_194174 ?auto_194175 ) ) ( not ( = ?auto_194174 ?auto_194176 ) ) ( not ( = ?auto_194174 ?auto_194177 ) ) ( not ( = ?auto_194174 ?auto_194178 ) ) ( not ( = ?auto_194174 ?auto_194179 ) ) ( not ( = ?auto_194174 ?auto_194180 ) ) ( not ( = ?auto_194174 ?auto_194181 ) ) ( not ( = ?auto_194174 ?auto_194182 ) ) ( not ( = ?auto_194175 ?auto_194176 ) ) ( not ( = ?auto_194175 ?auto_194177 ) ) ( not ( = ?auto_194175 ?auto_194178 ) ) ( not ( = ?auto_194175 ?auto_194179 ) ) ( not ( = ?auto_194175 ?auto_194180 ) ) ( not ( = ?auto_194175 ?auto_194181 ) ) ( not ( = ?auto_194175 ?auto_194182 ) ) ( not ( = ?auto_194176 ?auto_194177 ) ) ( not ( = ?auto_194176 ?auto_194178 ) ) ( not ( = ?auto_194176 ?auto_194179 ) ) ( not ( = ?auto_194176 ?auto_194180 ) ) ( not ( = ?auto_194176 ?auto_194181 ) ) ( not ( = ?auto_194176 ?auto_194182 ) ) ( not ( = ?auto_194177 ?auto_194178 ) ) ( not ( = ?auto_194177 ?auto_194179 ) ) ( not ( = ?auto_194177 ?auto_194180 ) ) ( not ( = ?auto_194177 ?auto_194181 ) ) ( not ( = ?auto_194177 ?auto_194182 ) ) ( not ( = ?auto_194178 ?auto_194179 ) ) ( not ( = ?auto_194178 ?auto_194180 ) ) ( not ( = ?auto_194178 ?auto_194181 ) ) ( not ( = ?auto_194178 ?auto_194182 ) ) ( not ( = ?auto_194179 ?auto_194180 ) ) ( not ( = ?auto_194179 ?auto_194181 ) ) ( not ( = ?auto_194179 ?auto_194182 ) ) ( not ( = ?auto_194180 ?auto_194181 ) ) ( not ( = ?auto_194180 ?auto_194182 ) ) ( not ( = ?auto_194181 ?auto_194182 ) ) ( ON ?auto_194181 ?auto_194182 ) ( ON ?auto_194180 ?auto_194181 ) ( ON ?auto_194179 ?auto_194180 ) ( ON ?auto_194178 ?auto_194179 ) ( ON ?auto_194177 ?auto_194178 ) ( ON ?auto_194176 ?auto_194177 ) ( CLEAR ?auto_194174 ) ( ON ?auto_194175 ?auto_194176 ) ( CLEAR ?auto_194175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194171 ?auto_194172 ?auto_194173 ?auto_194174 ?auto_194175 )
      ( MAKE-12PILE ?auto_194171 ?auto_194172 ?auto_194173 ?auto_194174 ?auto_194175 ?auto_194176 ?auto_194177 ?auto_194178 ?auto_194179 ?auto_194180 ?auto_194181 ?auto_194182 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194195 - BLOCK
      ?auto_194196 - BLOCK
      ?auto_194197 - BLOCK
      ?auto_194198 - BLOCK
      ?auto_194199 - BLOCK
      ?auto_194200 - BLOCK
      ?auto_194201 - BLOCK
      ?auto_194202 - BLOCK
      ?auto_194203 - BLOCK
      ?auto_194204 - BLOCK
      ?auto_194205 - BLOCK
      ?auto_194206 - BLOCK
    )
    :vars
    (
      ?auto_194207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194206 ?auto_194207 ) ( ON-TABLE ?auto_194195 ) ( ON ?auto_194196 ?auto_194195 ) ( ON ?auto_194197 ?auto_194196 ) ( not ( = ?auto_194195 ?auto_194196 ) ) ( not ( = ?auto_194195 ?auto_194197 ) ) ( not ( = ?auto_194195 ?auto_194198 ) ) ( not ( = ?auto_194195 ?auto_194199 ) ) ( not ( = ?auto_194195 ?auto_194200 ) ) ( not ( = ?auto_194195 ?auto_194201 ) ) ( not ( = ?auto_194195 ?auto_194202 ) ) ( not ( = ?auto_194195 ?auto_194203 ) ) ( not ( = ?auto_194195 ?auto_194204 ) ) ( not ( = ?auto_194195 ?auto_194205 ) ) ( not ( = ?auto_194195 ?auto_194206 ) ) ( not ( = ?auto_194195 ?auto_194207 ) ) ( not ( = ?auto_194196 ?auto_194197 ) ) ( not ( = ?auto_194196 ?auto_194198 ) ) ( not ( = ?auto_194196 ?auto_194199 ) ) ( not ( = ?auto_194196 ?auto_194200 ) ) ( not ( = ?auto_194196 ?auto_194201 ) ) ( not ( = ?auto_194196 ?auto_194202 ) ) ( not ( = ?auto_194196 ?auto_194203 ) ) ( not ( = ?auto_194196 ?auto_194204 ) ) ( not ( = ?auto_194196 ?auto_194205 ) ) ( not ( = ?auto_194196 ?auto_194206 ) ) ( not ( = ?auto_194196 ?auto_194207 ) ) ( not ( = ?auto_194197 ?auto_194198 ) ) ( not ( = ?auto_194197 ?auto_194199 ) ) ( not ( = ?auto_194197 ?auto_194200 ) ) ( not ( = ?auto_194197 ?auto_194201 ) ) ( not ( = ?auto_194197 ?auto_194202 ) ) ( not ( = ?auto_194197 ?auto_194203 ) ) ( not ( = ?auto_194197 ?auto_194204 ) ) ( not ( = ?auto_194197 ?auto_194205 ) ) ( not ( = ?auto_194197 ?auto_194206 ) ) ( not ( = ?auto_194197 ?auto_194207 ) ) ( not ( = ?auto_194198 ?auto_194199 ) ) ( not ( = ?auto_194198 ?auto_194200 ) ) ( not ( = ?auto_194198 ?auto_194201 ) ) ( not ( = ?auto_194198 ?auto_194202 ) ) ( not ( = ?auto_194198 ?auto_194203 ) ) ( not ( = ?auto_194198 ?auto_194204 ) ) ( not ( = ?auto_194198 ?auto_194205 ) ) ( not ( = ?auto_194198 ?auto_194206 ) ) ( not ( = ?auto_194198 ?auto_194207 ) ) ( not ( = ?auto_194199 ?auto_194200 ) ) ( not ( = ?auto_194199 ?auto_194201 ) ) ( not ( = ?auto_194199 ?auto_194202 ) ) ( not ( = ?auto_194199 ?auto_194203 ) ) ( not ( = ?auto_194199 ?auto_194204 ) ) ( not ( = ?auto_194199 ?auto_194205 ) ) ( not ( = ?auto_194199 ?auto_194206 ) ) ( not ( = ?auto_194199 ?auto_194207 ) ) ( not ( = ?auto_194200 ?auto_194201 ) ) ( not ( = ?auto_194200 ?auto_194202 ) ) ( not ( = ?auto_194200 ?auto_194203 ) ) ( not ( = ?auto_194200 ?auto_194204 ) ) ( not ( = ?auto_194200 ?auto_194205 ) ) ( not ( = ?auto_194200 ?auto_194206 ) ) ( not ( = ?auto_194200 ?auto_194207 ) ) ( not ( = ?auto_194201 ?auto_194202 ) ) ( not ( = ?auto_194201 ?auto_194203 ) ) ( not ( = ?auto_194201 ?auto_194204 ) ) ( not ( = ?auto_194201 ?auto_194205 ) ) ( not ( = ?auto_194201 ?auto_194206 ) ) ( not ( = ?auto_194201 ?auto_194207 ) ) ( not ( = ?auto_194202 ?auto_194203 ) ) ( not ( = ?auto_194202 ?auto_194204 ) ) ( not ( = ?auto_194202 ?auto_194205 ) ) ( not ( = ?auto_194202 ?auto_194206 ) ) ( not ( = ?auto_194202 ?auto_194207 ) ) ( not ( = ?auto_194203 ?auto_194204 ) ) ( not ( = ?auto_194203 ?auto_194205 ) ) ( not ( = ?auto_194203 ?auto_194206 ) ) ( not ( = ?auto_194203 ?auto_194207 ) ) ( not ( = ?auto_194204 ?auto_194205 ) ) ( not ( = ?auto_194204 ?auto_194206 ) ) ( not ( = ?auto_194204 ?auto_194207 ) ) ( not ( = ?auto_194205 ?auto_194206 ) ) ( not ( = ?auto_194205 ?auto_194207 ) ) ( not ( = ?auto_194206 ?auto_194207 ) ) ( ON ?auto_194205 ?auto_194206 ) ( ON ?auto_194204 ?auto_194205 ) ( ON ?auto_194203 ?auto_194204 ) ( ON ?auto_194202 ?auto_194203 ) ( ON ?auto_194201 ?auto_194202 ) ( ON ?auto_194200 ?auto_194201 ) ( ON ?auto_194199 ?auto_194200 ) ( CLEAR ?auto_194197 ) ( ON ?auto_194198 ?auto_194199 ) ( CLEAR ?auto_194198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194195 ?auto_194196 ?auto_194197 ?auto_194198 )
      ( MAKE-12PILE ?auto_194195 ?auto_194196 ?auto_194197 ?auto_194198 ?auto_194199 ?auto_194200 ?auto_194201 ?auto_194202 ?auto_194203 ?auto_194204 ?auto_194205 ?auto_194206 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194220 - BLOCK
      ?auto_194221 - BLOCK
      ?auto_194222 - BLOCK
      ?auto_194223 - BLOCK
      ?auto_194224 - BLOCK
      ?auto_194225 - BLOCK
      ?auto_194226 - BLOCK
      ?auto_194227 - BLOCK
      ?auto_194228 - BLOCK
      ?auto_194229 - BLOCK
      ?auto_194230 - BLOCK
      ?auto_194231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194231 ) ( ON-TABLE ?auto_194220 ) ( ON ?auto_194221 ?auto_194220 ) ( ON ?auto_194222 ?auto_194221 ) ( not ( = ?auto_194220 ?auto_194221 ) ) ( not ( = ?auto_194220 ?auto_194222 ) ) ( not ( = ?auto_194220 ?auto_194223 ) ) ( not ( = ?auto_194220 ?auto_194224 ) ) ( not ( = ?auto_194220 ?auto_194225 ) ) ( not ( = ?auto_194220 ?auto_194226 ) ) ( not ( = ?auto_194220 ?auto_194227 ) ) ( not ( = ?auto_194220 ?auto_194228 ) ) ( not ( = ?auto_194220 ?auto_194229 ) ) ( not ( = ?auto_194220 ?auto_194230 ) ) ( not ( = ?auto_194220 ?auto_194231 ) ) ( not ( = ?auto_194221 ?auto_194222 ) ) ( not ( = ?auto_194221 ?auto_194223 ) ) ( not ( = ?auto_194221 ?auto_194224 ) ) ( not ( = ?auto_194221 ?auto_194225 ) ) ( not ( = ?auto_194221 ?auto_194226 ) ) ( not ( = ?auto_194221 ?auto_194227 ) ) ( not ( = ?auto_194221 ?auto_194228 ) ) ( not ( = ?auto_194221 ?auto_194229 ) ) ( not ( = ?auto_194221 ?auto_194230 ) ) ( not ( = ?auto_194221 ?auto_194231 ) ) ( not ( = ?auto_194222 ?auto_194223 ) ) ( not ( = ?auto_194222 ?auto_194224 ) ) ( not ( = ?auto_194222 ?auto_194225 ) ) ( not ( = ?auto_194222 ?auto_194226 ) ) ( not ( = ?auto_194222 ?auto_194227 ) ) ( not ( = ?auto_194222 ?auto_194228 ) ) ( not ( = ?auto_194222 ?auto_194229 ) ) ( not ( = ?auto_194222 ?auto_194230 ) ) ( not ( = ?auto_194222 ?auto_194231 ) ) ( not ( = ?auto_194223 ?auto_194224 ) ) ( not ( = ?auto_194223 ?auto_194225 ) ) ( not ( = ?auto_194223 ?auto_194226 ) ) ( not ( = ?auto_194223 ?auto_194227 ) ) ( not ( = ?auto_194223 ?auto_194228 ) ) ( not ( = ?auto_194223 ?auto_194229 ) ) ( not ( = ?auto_194223 ?auto_194230 ) ) ( not ( = ?auto_194223 ?auto_194231 ) ) ( not ( = ?auto_194224 ?auto_194225 ) ) ( not ( = ?auto_194224 ?auto_194226 ) ) ( not ( = ?auto_194224 ?auto_194227 ) ) ( not ( = ?auto_194224 ?auto_194228 ) ) ( not ( = ?auto_194224 ?auto_194229 ) ) ( not ( = ?auto_194224 ?auto_194230 ) ) ( not ( = ?auto_194224 ?auto_194231 ) ) ( not ( = ?auto_194225 ?auto_194226 ) ) ( not ( = ?auto_194225 ?auto_194227 ) ) ( not ( = ?auto_194225 ?auto_194228 ) ) ( not ( = ?auto_194225 ?auto_194229 ) ) ( not ( = ?auto_194225 ?auto_194230 ) ) ( not ( = ?auto_194225 ?auto_194231 ) ) ( not ( = ?auto_194226 ?auto_194227 ) ) ( not ( = ?auto_194226 ?auto_194228 ) ) ( not ( = ?auto_194226 ?auto_194229 ) ) ( not ( = ?auto_194226 ?auto_194230 ) ) ( not ( = ?auto_194226 ?auto_194231 ) ) ( not ( = ?auto_194227 ?auto_194228 ) ) ( not ( = ?auto_194227 ?auto_194229 ) ) ( not ( = ?auto_194227 ?auto_194230 ) ) ( not ( = ?auto_194227 ?auto_194231 ) ) ( not ( = ?auto_194228 ?auto_194229 ) ) ( not ( = ?auto_194228 ?auto_194230 ) ) ( not ( = ?auto_194228 ?auto_194231 ) ) ( not ( = ?auto_194229 ?auto_194230 ) ) ( not ( = ?auto_194229 ?auto_194231 ) ) ( not ( = ?auto_194230 ?auto_194231 ) ) ( ON ?auto_194230 ?auto_194231 ) ( ON ?auto_194229 ?auto_194230 ) ( ON ?auto_194228 ?auto_194229 ) ( ON ?auto_194227 ?auto_194228 ) ( ON ?auto_194226 ?auto_194227 ) ( ON ?auto_194225 ?auto_194226 ) ( ON ?auto_194224 ?auto_194225 ) ( CLEAR ?auto_194222 ) ( ON ?auto_194223 ?auto_194224 ) ( CLEAR ?auto_194223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194220 ?auto_194221 ?auto_194222 ?auto_194223 )
      ( MAKE-12PILE ?auto_194220 ?auto_194221 ?auto_194222 ?auto_194223 ?auto_194224 ?auto_194225 ?auto_194226 ?auto_194227 ?auto_194228 ?auto_194229 ?auto_194230 ?auto_194231 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194244 - BLOCK
      ?auto_194245 - BLOCK
      ?auto_194246 - BLOCK
      ?auto_194247 - BLOCK
      ?auto_194248 - BLOCK
      ?auto_194249 - BLOCK
      ?auto_194250 - BLOCK
      ?auto_194251 - BLOCK
      ?auto_194252 - BLOCK
      ?auto_194253 - BLOCK
      ?auto_194254 - BLOCK
      ?auto_194255 - BLOCK
    )
    :vars
    (
      ?auto_194256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194255 ?auto_194256 ) ( ON-TABLE ?auto_194244 ) ( ON ?auto_194245 ?auto_194244 ) ( not ( = ?auto_194244 ?auto_194245 ) ) ( not ( = ?auto_194244 ?auto_194246 ) ) ( not ( = ?auto_194244 ?auto_194247 ) ) ( not ( = ?auto_194244 ?auto_194248 ) ) ( not ( = ?auto_194244 ?auto_194249 ) ) ( not ( = ?auto_194244 ?auto_194250 ) ) ( not ( = ?auto_194244 ?auto_194251 ) ) ( not ( = ?auto_194244 ?auto_194252 ) ) ( not ( = ?auto_194244 ?auto_194253 ) ) ( not ( = ?auto_194244 ?auto_194254 ) ) ( not ( = ?auto_194244 ?auto_194255 ) ) ( not ( = ?auto_194244 ?auto_194256 ) ) ( not ( = ?auto_194245 ?auto_194246 ) ) ( not ( = ?auto_194245 ?auto_194247 ) ) ( not ( = ?auto_194245 ?auto_194248 ) ) ( not ( = ?auto_194245 ?auto_194249 ) ) ( not ( = ?auto_194245 ?auto_194250 ) ) ( not ( = ?auto_194245 ?auto_194251 ) ) ( not ( = ?auto_194245 ?auto_194252 ) ) ( not ( = ?auto_194245 ?auto_194253 ) ) ( not ( = ?auto_194245 ?auto_194254 ) ) ( not ( = ?auto_194245 ?auto_194255 ) ) ( not ( = ?auto_194245 ?auto_194256 ) ) ( not ( = ?auto_194246 ?auto_194247 ) ) ( not ( = ?auto_194246 ?auto_194248 ) ) ( not ( = ?auto_194246 ?auto_194249 ) ) ( not ( = ?auto_194246 ?auto_194250 ) ) ( not ( = ?auto_194246 ?auto_194251 ) ) ( not ( = ?auto_194246 ?auto_194252 ) ) ( not ( = ?auto_194246 ?auto_194253 ) ) ( not ( = ?auto_194246 ?auto_194254 ) ) ( not ( = ?auto_194246 ?auto_194255 ) ) ( not ( = ?auto_194246 ?auto_194256 ) ) ( not ( = ?auto_194247 ?auto_194248 ) ) ( not ( = ?auto_194247 ?auto_194249 ) ) ( not ( = ?auto_194247 ?auto_194250 ) ) ( not ( = ?auto_194247 ?auto_194251 ) ) ( not ( = ?auto_194247 ?auto_194252 ) ) ( not ( = ?auto_194247 ?auto_194253 ) ) ( not ( = ?auto_194247 ?auto_194254 ) ) ( not ( = ?auto_194247 ?auto_194255 ) ) ( not ( = ?auto_194247 ?auto_194256 ) ) ( not ( = ?auto_194248 ?auto_194249 ) ) ( not ( = ?auto_194248 ?auto_194250 ) ) ( not ( = ?auto_194248 ?auto_194251 ) ) ( not ( = ?auto_194248 ?auto_194252 ) ) ( not ( = ?auto_194248 ?auto_194253 ) ) ( not ( = ?auto_194248 ?auto_194254 ) ) ( not ( = ?auto_194248 ?auto_194255 ) ) ( not ( = ?auto_194248 ?auto_194256 ) ) ( not ( = ?auto_194249 ?auto_194250 ) ) ( not ( = ?auto_194249 ?auto_194251 ) ) ( not ( = ?auto_194249 ?auto_194252 ) ) ( not ( = ?auto_194249 ?auto_194253 ) ) ( not ( = ?auto_194249 ?auto_194254 ) ) ( not ( = ?auto_194249 ?auto_194255 ) ) ( not ( = ?auto_194249 ?auto_194256 ) ) ( not ( = ?auto_194250 ?auto_194251 ) ) ( not ( = ?auto_194250 ?auto_194252 ) ) ( not ( = ?auto_194250 ?auto_194253 ) ) ( not ( = ?auto_194250 ?auto_194254 ) ) ( not ( = ?auto_194250 ?auto_194255 ) ) ( not ( = ?auto_194250 ?auto_194256 ) ) ( not ( = ?auto_194251 ?auto_194252 ) ) ( not ( = ?auto_194251 ?auto_194253 ) ) ( not ( = ?auto_194251 ?auto_194254 ) ) ( not ( = ?auto_194251 ?auto_194255 ) ) ( not ( = ?auto_194251 ?auto_194256 ) ) ( not ( = ?auto_194252 ?auto_194253 ) ) ( not ( = ?auto_194252 ?auto_194254 ) ) ( not ( = ?auto_194252 ?auto_194255 ) ) ( not ( = ?auto_194252 ?auto_194256 ) ) ( not ( = ?auto_194253 ?auto_194254 ) ) ( not ( = ?auto_194253 ?auto_194255 ) ) ( not ( = ?auto_194253 ?auto_194256 ) ) ( not ( = ?auto_194254 ?auto_194255 ) ) ( not ( = ?auto_194254 ?auto_194256 ) ) ( not ( = ?auto_194255 ?auto_194256 ) ) ( ON ?auto_194254 ?auto_194255 ) ( ON ?auto_194253 ?auto_194254 ) ( ON ?auto_194252 ?auto_194253 ) ( ON ?auto_194251 ?auto_194252 ) ( ON ?auto_194250 ?auto_194251 ) ( ON ?auto_194249 ?auto_194250 ) ( ON ?auto_194248 ?auto_194249 ) ( ON ?auto_194247 ?auto_194248 ) ( CLEAR ?auto_194245 ) ( ON ?auto_194246 ?auto_194247 ) ( CLEAR ?auto_194246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194244 ?auto_194245 ?auto_194246 )
      ( MAKE-12PILE ?auto_194244 ?auto_194245 ?auto_194246 ?auto_194247 ?auto_194248 ?auto_194249 ?auto_194250 ?auto_194251 ?auto_194252 ?auto_194253 ?auto_194254 ?auto_194255 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194269 - BLOCK
      ?auto_194270 - BLOCK
      ?auto_194271 - BLOCK
      ?auto_194272 - BLOCK
      ?auto_194273 - BLOCK
      ?auto_194274 - BLOCK
      ?auto_194275 - BLOCK
      ?auto_194276 - BLOCK
      ?auto_194277 - BLOCK
      ?auto_194278 - BLOCK
      ?auto_194279 - BLOCK
      ?auto_194280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194280 ) ( ON-TABLE ?auto_194269 ) ( ON ?auto_194270 ?auto_194269 ) ( not ( = ?auto_194269 ?auto_194270 ) ) ( not ( = ?auto_194269 ?auto_194271 ) ) ( not ( = ?auto_194269 ?auto_194272 ) ) ( not ( = ?auto_194269 ?auto_194273 ) ) ( not ( = ?auto_194269 ?auto_194274 ) ) ( not ( = ?auto_194269 ?auto_194275 ) ) ( not ( = ?auto_194269 ?auto_194276 ) ) ( not ( = ?auto_194269 ?auto_194277 ) ) ( not ( = ?auto_194269 ?auto_194278 ) ) ( not ( = ?auto_194269 ?auto_194279 ) ) ( not ( = ?auto_194269 ?auto_194280 ) ) ( not ( = ?auto_194270 ?auto_194271 ) ) ( not ( = ?auto_194270 ?auto_194272 ) ) ( not ( = ?auto_194270 ?auto_194273 ) ) ( not ( = ?auto_194270 ?auto_194274 ) ) ( not ( = ?auto_194270 ?auto_194275 ) ) ( not ( = ?auto_194270 ?auto_194276 ) ) ( not ( = ?auto_194270 ?auto_194277 ) ) ( not ( = ?auto_194270 ?auto_194278 ) ) ( not ( = ?auto_194270 ?auto_194279 ) ) ( not ( = ?auto_194270 ?auto_194280 ) ) ( not ( = ?auto_194271 ?auto_194272 ) ) ( not ( = ?auto_194271 ?auto_194273 ) ) ( not ( = ?auto_194271 ?auto_194274 ) ) ( not ( = ?auto_194271 ?auto_194275 ) ) ( not ( = ?auto_194271 ?auto_194276 ) ) ( not ( = ?auto_194271 ?auto_194277 ) ) ( not ( = ?auto_194271 ?auto_194278 ) ) ( not ( = ?auto_194271 ?auto_194279 ) ) ( not ( = ?auto_194271 ?auto_194280 ) ) ( not ( = ?auto_194272 ?auto_194273 ) ) ( not ( = ?auto_194272 ?auto_194274 ) ) ( not ( = ?auto_194272 ?auto_194275 ) ) ( not ( = ?auto_194272 ?auto_194276 ) ) ( not ( = ?auto_194272 ?auto_194277 ) ) ( not ( = ?auto_194272 ?auto_194278 ) ) ( not ( = ?auto_194272 ?auto_194279 ) ) ( not ( = ?auto_194272 ?auto_194280 ) ) ( not ( = ?auto_194273 ?auto_194274 ) ) ( not ( = ?auto_194273 ?auto_194275 ) ) ( not ( = ?auto_194273 ?auto_194276 ) ) ( not ( = ?auto_194273 ?auto_194277 ) ) ( not ( = ?auto_194273 ?auto_194278 ) ) ( not ( = ?auto_194273 ?auto_194279 ) ) ( not ( = ?auto_194273 ?auto_194280 ) ) ( not ( = ?auto_194274 ?auto_194275 ) ) ( not ( = ?auto_194274 ?auto_194276 ) ) ( not ( = ?auto_194274 ?auto_194277 ) ) ( not ( = ?auto_194274 ?auto_194278 ) ) ( not ( = ?auto_194274 ?auto_194279 ) ) ( not ( = ?auto_194274 ?auto_194280 ) ) ( not ( = ?auto_194275 ?auto_194276 ) ) ( not ( = ?auto_194275 ?auto_194277 ) ) ( not ( = ?auto_194275 ?auto_194278 ) ) ( not ( = ?auto_194275 ?auto_194279 ) ) ( not ( = ?auto_194275 ?auto_194280 ) ) ( not ( = ?auto_194276 ?auto_194277 ) ) ( not ( = ?auto_194276 ?auto_194278 ) ) ( not ( = ?auto_194276 ?auto_194279 ) ) ( not ( = ?auto_194276 ?auto_194280 ) ) ( not ( = ?auto_194277 ?auto_194278 ) ) ( not ( = ?auto_194277 ?auto_194279 ) ) ( not ( = ?auto_194277 ?auto_194280 ) ) ( not ( = ?auto_194278 ?auto_194279 ) ) ( not ( = ?auto_194278 ?auto_194280 ) ) ( not ( = ?auto_194279 ?auto_194280 ) ) ( ON ?auto_194279 ?auto_194280 ) ( ON ?auto_194278 ?auto_194279 ) ( ON ?auto_194277 ?auto_194278 ) ( ON ?auto_194276 ?auto_194277 ) ( ON ?auto_194275 ?auto_194276 ) ( ON ?auto_194274 ?auto_194275 ) ( ON ?auto_194273 ?auto_194274 ) ( ON ?auto_194272 ?auto_194273 ) ( CLEAR ?auto_194270 ) ( ON ?auto_194271 ?auto_194272 ) ( CLEAR ?auto_194271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194269 ?auto_194270 ?auto_194271 )
      ( MAKE-12PILE ?auto_194269 ?auto_194270 ?auto_194271 ?auto_194272 ?auto_194273 ?auto_194274 ?auto_194275 ?auto_194276 ?auto_194277 ?auto_194278 ?auto_194279 ?auto_194280 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194293 - BLOCK
      ?auto_194294 - BLOCK
      ?auto_194295 - BLOCK
      ?auto_194296 - BLOCK
      ?auto_194297 - BLOCK
      ?auto_194298 - BLOCK
      ?auto_194299 - BLOCK
      ?auto_194300 - BLOCK
      ?auto_194301 - BLOCK
      ?auto_194302 - BLOCK
      ?auto_194303 - BLOCK
      ?auto_194304 - BLOCK
    )
    :vars
    (
      ?auto_194305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194304 ?auto_194305 ) ( ON-TABLE ?auto_194293 ) ( not ( = ?auto_194293 ?auto_194294 ) ) ( not ( = ?auto_194293 ?auto_194295 ) ) ( not ( = ?auto_194293 ?auto_194296 ) ) ( not ( = ?auto_194293 ?auto_194297 ) ) ( not ( = ?auto_194293 ?auto_194298 ) ) ( not ( = ?auto_194293 ?auto_194299 ) ) ( not ( = ?auto_194293 ?auto_194300 ) ) ( not ( = ?auto_194293 ?auto_194301 ) ) ( not ( = ?auto_194293 ?auto_194302 ) ) ( not ( = ?auto_194293 ?auto_194303 ) ) ( not ( = ?auto_194293 ?auto_194304 ) ) ( not ( = ?auto_194293 ?auto_194305 ) ) ( not ( = ?auto_194294 ?auto_194295 ) ) ( not ( = ?auto_194294 ?auto_194296 ) ) ( not ( = ?auto_194294 ?auto_194297 ) ) ( not ( = ?auto_194294 ?auto_194298 ) ) ( not ( = ?auto_194294 ?auto_194299 ) ) ( not ( = ?auto_194294 ?auto_194300 ) ) ( not ( = ?auto_194294 ?auto_194301 ) ) ( not ( = ?auto_194294 ?auto_194302 ) ) ( not ( = ?auto_194294 ?auto_194303 ) ) ( not ( = ?auto_194294 ?auto_194304 ) ) ( not ( = ?auto_194294 ?auto_194305 ) ) ( not ( = ?auto_194295 ?auto_194296 ) ) ( not ( = ?auto_194295 ?auto_194297 ) ) ( not ( = ?auto_194295 ?auto_194298 ) ) ( not ( = ?auto_194295 ?auto_194299 ) ) ( not ( = ?auto_194295 ?auto_194300 ) ) ( not ( = ?auto_194295 ?auto_194301 ) ) ( not ( = ?auto_194295 ?auto_194302 ) ) ( not ( = ?auto_194295 ?auto_194303 ) ) ( not ( = ?auto_194295 ?auto_194304 ) ) ( not ( = ?auto_194295 ?auto_194305 ) ) ( not ( = ?auto_194296 ?auto_194297 ) ) ( not ( = ?auto_194296 ?auto_194298 ) ) ( not ( = ?auto_194296 ?auto_194299 ) ) ( not ( = ?auto_194296 ?auto_194300 ) ) ( not ( = ?auto_194296 ?auto_194301 ) ) ( not ( = ?auto_194296 ?auto_194302 ) ) ( not ( = ?auto_194296 ?auto_194303 ) ) ( not ( = ?auto_194296 ?auto_194304 ) ) ( not ( = ?auto_194296 ?auto_194305 ) ) ( not ( = ?auto_194297 ?auto_194298 ) ) ( not ( = ?auto_194297 ?auto_194299 ) ) ( not ( = ?auto_194297 ?auto_194300 ) ) ( not ( = ?auto_194297 ?auto_194301 ) ) ( not ( = ?auto_194297 ?auto_194302 ) ) ( not ( = ?auto_194297 ?auto_194303 ) ) ( not ( = ?auto_194297 ?auto_194304 ) ) ( not ( = ?auto_194297 ?auto_194305 ) ) ( not ( = ?auto_194298 ?auto_194299 ) ) ( not ( = ?auto_194298 ?auto_194300 ) ) ( not ( = ?auto_194298 ?auto_194301 ) ) ( not ( = ?auto_194298 ?auto_194302 ) ) ( not ( = ?auto_194298 ?auto_194303 ) ) ( not ( = ?auto_194298 ?auto_194304 ) ) ( not ( = ?auto_194298 ?auto_194305 ) ) ( not ( = ?auto_194299 ?auto_194300 ) ) ( not ( = ?auto_194299 ?auto_194301 ) ) ( not ( = ?auto_194299 ?auto_194302 ) ) ( not ( = ?auto_194299 ?auto_194303 ) ) ( not ( = ?auto_194299 ?auto_194304 ) ) ( not ( = ?auto_194299 ?auto_194305 ) ) ( not ( = ?auto_194300 ?auto_194301 ) ) ( not ( = ?auto_194300 ?auto_194302 ) ) ( not ( = ?auto_194300 ?auto_194303 ) ) ( not ( = ?auto_194300 ?auto_194304 ) ) ( not ( = ?auto_194300 ?auto_194305 ) ) ( not ( = ?auto_194301 ?auto_194302 ) ) ( not ( = ?auto_194301 ?auto_194303 ) ) ( not ( = ?auto_194301 ?auto_194304 ) ) ( not ( = ?auto_194301 ?auto_194305 ) ) ( not ( = ?auto_194302 ?auto_194303 ) ) ( not ( = ?auto_194302 ?auto_194304 ) ) ( not ( = ?auto_194302 ?auto_194305 ) ) ( not ( = ?auto_194303 ?auto_194304 ) ) ( not ( = ?auto_194303 ?auto_194305 ) ) ( not ( = ?auto_194304 ?auto_194305 ) ) ( ON ?auto_194303 ?auto_194304 ) ( ON ?auto_194302 ?auto_194303 ) ( ON ?auto_194301 ?auto_194302 ) ( ON ?auto_194300 ?auto_194301 ) ( ON ?auto_194299 ?auto_194300 ) ( ON ?auto_194298 ?auto_194299 ) ( ON ?auto_194297 ?auto_194298 ) ( ON ?auto_194296 ?auto_194297 ) ( ON ?auto_194295 ?auto_194296 ) ( CLEAR ?auto_194293 ) ( ON ?auto_194294 ?auto_194295 ) ( CLEAR ?auto_194294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194293 ?auto_194294 )
      ( MAKE-12PILE ?auto_194293 ?auto_194294 ?auto_194295 ?auto_194296 ?auto_194297 ?auto_194298 ?auto_194299 ?auto_194300 ?auto_194301 ?auto_194302 ?auto_194303 ?auto_194304 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194318 - BLOCK
      ?auto_194319 - BLOCK
      ?auto_194320 - BLOCK
      ?auto_194321 - BLOCK
      ?auto_194322 - BLOCK
      ?auto_194323 - BLOCK
      ?auto_194324 - BLOCK
      ?auto_194325 - BLOCK
      ?auto_194326 - BLOCK
      ?auto_194327 - BLOCK
      ?auto_194328 - BLOCK
      ?auto_194329 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194329 ) ( ON-TABLE ?auto_194318 ) ( not ( = ?auto_194318 ?auto_194319 ) ) ( not ( = ?auto_194318 ?auto_194320 ) ) ( not ( = ?auto_194318 ?auto_194321 ) ) ( not ( = ?auto_194318 ?auto_194322 ) ) ( not ( = ?auto_194318 ?auto_194323 ) ) ( not ( = ?auto_194318 ?auto_194324 ) ) ( not ( = ?auto_194318 ?auto_194325 ) ) ( not ( = ?auto_194318 ?auto_194326 ) ) ( not ( = ?auto_194318 ?auto_194327 ) ) ( not ( = ?auto_194318 ?auto_194328 ) ) ( not ( = ?auto_194318 ?auto_194329 ) ) ( not ( = ?auto_194319 ?auto_194320 ) ) ( not ( = ?auto_194319 ?auto_194321 ) ) ( not ( = ?auto_194319 ?auto_194322 ) ) ( not ( = ?auto_194319 ?auto_194323 ) ) ( not ( = ?auto_194319 ?auto_194324 ) ) ( not ( = ?auto_194319 ?auto_194325 ) ) ( not ( = ?auto_194319 ?auto_194326 ) ) ( not ( = ?auto_194319 ?auto_194327 ) ) ( not ( = ?auto_194319 ?auto_194328 ) ) ( not ( = ?auto_194319 ?auto_194329 ) ) ( not ( = ?auto_194320 ?auto_194321 ) ) ( not ( = ?auto_194320 ?auto_194322 ) ) ( not ( = ?auto_194320 ?auto_194323 ) ) ( not ( = ?auto_194320 ?auto_194324 ) ) ( not ( = ?auto_194320 ?auto_194325 ) ) ( not ( = ?auto_194320 ?auto_194326 ) ) ( not ( = ?auto_194320 ?auto_194327 ) ) ( not ( = ?auto_194320 ?auto_194328 ) ) ( not ( = ?auto_194320 ?auto_194329 ) ) ( not ( = ?auto_194321 ?auto_194322 ) ) ( not ( = ?auto_194321 ?auto_194323 ) ) ( not ( = ?auto_194321 ?auto_194324 ) ) ( not ( = ?auto_194321 ?auto_194325 ) ) ( not ( = ?auto_194321 ?auto_194326 ) ) ( not ( = ?auto_194321 ?auto_194327 ) ) ( not ( = ?auto_194321 ?auto_194328 ) ) ( not ( = ?auto_194321 ?auto_194329 ) ) ( not ( = ?auto_194322 ?auto_194323 ) ) ( not ( = ?auto_194322 ?auto_194324 ) ) ( not ( = ?auto_194322 ?auto_194325 ) ) ( not ( = ?auto_194322 ?auto_194326 ) ) ( not ( = ?auto_194322 ?auto_194327 ) ) ( not ( = ?auto_194322 ?auto_194328 ) ) ( not ( = ?auto_194322 ?auto_194329 ) ) ( not ( = ?auto_194323 ?auto_194324 ) ) ( not ( = ?auto_194323 ?auto_194325 ) ) ( not ( = ?auto_194323 ?auto_194326 ) ) ( not ( = ?auto_194323 ?auto_194327 ) ) ( not ( = ?auto_194323 ?auto_194328 ) ) ( not ( = ?auto_194323 ?auto_194329 ) ) ( not ( = ?auto_194324 ?auto_194325 ) ) ( not ( = ?auto_194324 ?auto_194326 ) ) ( not ( = ?auto_194324 ?auto_194327 ) ) ( not ( = ?auto_194324 ?auto_194328 ) ) ( not ( = ?auto_194324 ?auto_194329 ) ) ( not ( = ?auto_194325 ?auto_194326 ) ) ( not ( = ?auto_194325 ?auto_194327 ) ) ( not ( = ?auto_194325 ?auto_194328 ) ) ( not ( = ?auto_194325 ?auto_194329 ) ) ( not ( = ?auto_194326 ?auto_194327 ) ) ( not ( = ?auto_194326 ?auto_194328 ) ) ( not ( = ?auto_194326 ?auto_194329 ) ) ( not ( = ?auto_194327 ?auto_194328 ) ) ( not ( = ?auto_194327 ?auto_194329 ) ) ( not ( = ?auto_194328 ?auto_194329 ) ) ( ON ?auto_194328 ?auto_194329 ) ( ON ?auto_194327 ?auto_194328 ) ( ON ?auto_194326 ?auto_194327 ) ( ON ?auto_194325 ?auto_194326 ) ( ON ?auto_194324 ?auto_194325 ) ( ON ?auto_194323 ?auto_194324 ) ( ON ?auto_194322 ?auto_194323 ) ( ON ?auto_194321 ?auto_194322 ) ( ON ?auto_194320 ?auto_194321 ) ( CLEAR ?auto_194318 ) ( ON ?auto_194319 ?auto_194320 ) ( CLEAR ?auto_194319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194318 ?auto_194319 )
      ( MAKE-12PILE ?auto_194318 ?auto_194319 ?auto_194320 ?auto_194321 ?auto_194322 ?auto_194323 ?auto_194324 ?auto_194325 ?auto_194326 ?auto_194327 ?auto_194328 ?auto_194329 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194342 - BLOCK
      ?auto_194343 - BLOCK
      ?auto_194344 - BLOCK
      ?auto_194345 - BLOCK
      ?auto_194346 - BLOCK
      ?auto_194347 - BLOCK
      ?auto_194348 - BLOCK
      ?auto_194349 - BLOCK
      ?auto_194350 - BLOCK
      ?auto_194351 - BLOCK
      ?auto_194352 - BLOCK
      ?auto_194353 - BLOCK
    )
    :vars
    (
      ?auto_194354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194353 ?auto_194354 ) ( not ( = ?auto_194342 ?auto_194343 ) ) ( not ( = ?auto_194342 ?auto_194344 ) ) ( not ( = ?auto_194342 ?auto_194345 ) ) ( not ( = ?auto_194342 ?auto_194346 ) ) ( not ( = ?auto_194342 ?auto_194347 ) ) ( not ( = ?auto_194342 ?auto_194348 ) ) ( not ( = ?auto_194342 ?auto_194349 ) ) ( not ( = ?auto_194342 ?auto_194350 ) ) ( not ( = ?auto_194342 ?auto_194351 ) ) ( not ( = ?auto_194342 ?auto_194352 ) ) ( not ( = ?auto_194342 ?auto_194353 ) ) ( not ( = ?auto_194342 ?auto_194354 ) ) ( not ( = ?auto_194343 ?auto_194344 ) ) ( not ( = ?auto_194343 ?auto_194345 ) ) ( not ( = ?auto_194343 ?auto_194346 ) ) ( not ( = ?auto_194343 ?auto_194347 ) ) ( not ( = ?auto_194343 ?auto_194348 ) ) ( not ( = ?auto_194343 ?auto_194349 ) ) ( not ( = ?auto_194343 ?auto_194350 ) ) ( not ( = ?auto_194343 ?auto_194351 ) ) ( not ( = ?auto_194343 ?auto_194352 ) ) ( not ( = ?auto_194343 ?auto_194353 ) ) ( not ( = ?auto_194343 ?auto_194354 ) ) ( not ( = ?auto_194344 ?auto_194345 ) ) ( not ( = ?auto_194344 ?auto_194346 ) ) ( not ( = ?auto_194344 ?auto_194347 ) ) ( not ( = ?auto_194344 ?auto_194348 ) ) ( not ( = ?auto_194344 ?auto_194349 ) ) ( not ( = ?auto_194344 ?auto_194350 ) ) ( not ( = ?auto_194344 ?auto_194351 ) ) ( not ( = ?auto_194344 ?auto_194352 ) ) ( not ( = ?auto_194344 ?auto_194353 ) ) ( not ( = ?auto_194344 ?auto_194354 ) ) ( not ( = ?auto_194345 ?auto_194346 ) ) ( not ( = ?auto_194345 ?auto_194347 ) ) ( not ( = ?auto_194345 ?auto_194348 ) ) ( not ( = ?auto_194345 ?auto_194349 ) ) ( not ( = ?auto_194345 ?auto_194350 ) ) ( not ( = ?auto_194345 ?auto_194351 ) ) ( not ( = ?auto_194345 ?auto_194352 ) ) ( not ( = ?auto_194345 ?auto_194353 ) ) ( not ( = ?auto_194345 ?auto_194354 ) ) ( not ( = ?auto_194346 ?auto_194347 ) ) ( not ( = ?auto_194346 ?auto_194348 ) ) ( not ( = ?auto_194346 ?auto_194349 ) ) ( not ( = ?auto_194346 ?auto_194350 ) ) ( not ( = ?auto_194346 ?auto_194351 ) ) ( not ( = ?auto_194346 ?auto_194352 ) ) ( not ( = ?auto_194346 ?auto_194353 ) ) ( not ( = ?auto_194346 ?auto_194354 ) ) ( not ( = ?auto_194347 ?auto_194348 ) ) ( not ( = ?auto_194347 ?auto_194349 ) ) ( not ( = ?auto_194347 ?auto_194350 ) ) ( not ( = ?auto_194347 ?auto_194351 ) ) ( not ( = ?auto_194347 ?auto_194352 ) ) ( not ( = ?auto_194347 ?auto_194353 ) ) ( not ( = ?auto_194347 ?auto_194354 ) ) ( not ( = ?auto_194348 ?auto_194349 ) ) ( not ( = ?auto_194348 ?auto_194350 ) ) ( not ( = ?auto_194348 ?auto_194351 ) ) ( not ( = ?auto_194348 ?auto_194352 ) ) ( not ( = ?auto_194348 ?auto_194353 ) ) ( not ( = ?auto_194348 ?auto_194354 ) ) ( not ( = ?auto_194349 ?auto_194350 ) ) ( not ( = ?auto_194349 ?auto_194351 ) ) ( not ( = ?auto_194349 ?auto_194352 ) ) ( not ( = ?auto_194349 ?auto_194353 ) ) ( not ( = ?auto_194349 ?auto_194354 ) ) ( not ( = ?auto_194350 ?auto_194351 ) ) ( not ( = ?auto_194350 ?auto_194352 ) ) ( not ( = ?auto_194350 ?auto_194353 ) ) ( not ( = ?auto_194350 ?auto_194354 ) ) ( not ( = ?auto_194351 ?auto_194352 ) ) ( not ( = ?auto_194351 ?auto_194353 ) ) ( not ( = ?auto_194351 ?auto_194354 ) ) ( not ( = ?auto_194352 ?auto_194353 ) ) ( not ( = ?auto_194352 ?auto_194354 ) ) ( not ( = ?auto_194353 ?auto_194354 ) ) ( ON ?auto_194352 ?auto_194353 ) ( ON ?auto_194351 ?auto_194352 ) ( ON ?auto_194350 ?auto_194351 ) ( ON ?auto_194349 ?auto_194350 ) ( ON ?auto_194348 ?auto_194349 ) ( ON ?auto_194347 ?auto_194348 ) ( ON ?auto_194346 ?auto_194347 ) ( ON ?auto_194345 ?auto_194346 ) ( ON ?auto_194344 ?auto_194345 ) ( ON ?auto_194343 ?auto_194344 ) ( ON ?auto_194342 ?auto_194343 ) ( CLEAR ?auto_194342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194342 )
      ( MAKE-12PILE ?auto_194342 ?auto_194343 ?auto_194344 ?auto_194345 ?auto_194346 ?auto_194347 ?auto_194348 ?auto_194349 ?auto_194350 ?auto_194351 ?auto_194352 ?auto_194353 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194367 - BLOCK
      ?auto_194368 - BLOCK
      ?auto_194369 - BLOCK
      ?auto_194370 - BLOCK
      ?auto_194371 - BLOCK
      ?auto_194372 - BLOCK
      ?auto_194373 - BLOCK
      ?auto_194374 - BLOCK
      ?auto_194375 - BLOCK
      ?auto_194376 - BLOCK
      ?auto_194377 - BLOCK
      ?auto_194378 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194378 ) ( not ( = ?auto_194367 ?auto_194368 ) ) ( not ( = ?auto_194367 ?auto_194369 ) ) ( not ( = ?auto_194367 ?auto_194370 ) ) ( not ( = ?auto_194367 ?auto_194371 ) ) ( not ( = ?auto_194367 ?auto_194372 ) ) ( not ( = ?auto_194367 ?auto_194373 ) ) ( not ( = ?auto_194367 ?auto_194374 ) ) ( not ( = ?auto_194367 ?auto_194375 ) ) ( not ( = ?auto_194367 ?auto_194376 ) ) ( not ( = ?auto_194367 ?auto_194377 ) ) ( not ( = ?auto_194367 ?auto_194378 ) ) ( not ( = ?auto_194368 ?auto_194369 ) ) ( not ( = ?auto_194368 ?auto_194370 ) ) ( not ( = ?auto_194368 ?auto_194371 ) ) ( not ( = ?auto_194368 ?auto_194372 ) ) ( not ( = ?auto_194368 ?auto_194373 ) ) ( not ( = ?auto_194368 ?auto_194374 ) ) ( not ( = ?auto_194368 ?auto_194375 ) ) ( not ( = ?auto_194368 ?auto_194376 ) ) ( not ( = ?auto_194368 ?auto_194377 ) ) ( not ( = ?auto_194368 ?auto_194378 ) ) ( not ( = ?auto_194369 ?auto_194370 ) ) ( not ( = ?auto_194369 ?auto_194371 ) ) ( not ( = ?auto_194369 ?auto_194372 ) ) ( not ( = ?auto_194369 ?auto_194373 ) ) ( not ( = ?auto_194369 ?auto_194374 ) ) ( not ( = ?auto_194369 ?auto_194375 ) ) ( not ( = ?auto_194369 ?auto_194376 ) ) ( not ( = ?auto_194369 ?auto_194377 ) ) ( not ( = ?auto_194369 ?auto_194378 ) ) ( not ( = ?auto_194370 ?auto_194371 ) ) ( not ( = ?auto_194370 ?auto_194372 ) ) ( not ( = ?auto_194370 ?auto_194373 ) ) ( not ( = ?auto_194370 ?auto_194374 ) ) ( not ( = ?auto_194370 ?auto_194375 ) ) ( not ( = ?auto_194370 ?auto_194376 ) ) ( not ( = ?auto_194370 ?auto_194377 ) ) ( not ( = ?auto_194370 ?auto_194378 ) ) ( not ( = ?auto_194371 ?auto_194372 ) ) ( not ( = ?auto_194371 ?auto_194373 ) ) ( not ( = ?auto_194371 ?auto_194374 ) ) ( not ( = ?auto_194371 ?auto_194375 ) ) ( not ( = ?auto_194371 ?auto_194376 ) ) ( not ( = ?auto_194371 ?auto_194377 ) ) ( not ( = ?auto_194371 ?auto_194378 ) ) ( not ( = ?auto_194372 ?auto_194373 ) ) ( not ( = ?auto_194372 ?auto_194374 ) ) ( not ( = ?auto_194372 ?auto_194375 ) ) ( not ( = ?auto_194372 ?auto_194376 ) ) ( not ( = ?auto_194372 ?auto_194377 ) ) ( not ( = ?auto_194372 ?auto_194378 ) ) ( not ( = ?auto_194373 ?auto_194374 ) ) ( not ( = ?auto_194373 ?auto_194375 ) ) ( not ( = ?auto_194373 ?auto_194376 ) ) ( not ( = ?auto_194373 ?auto_194377 ) ) ( not ( = ?auto_194373 ?auto_194378 ) ) ( not ( = ?auto_194374 ?auto_194375 ) ) ( not ( = ?auto_194374 ?auto_194376 ) ) ( not ( = ?auto_194374 ?auto_194377 ) ) ( not ( = ?auto_194374 ?auto_194378 ) ) ( not ( = ?auto_194375 ?auto_194376 ) ) ( not ( = ?auto_194375 ?auto_194377 ) ) ( not ( = ?auto_194375 ?auto_194378 ) ) ( not ( = ?auto_194376 ?auto_194377 ) ) ( not ( = ?auto_194376 ?auto_194378 ) ) ( not ( = ?auto_194377 ?auto_194378 ) ) ( ON ?auto_194377 ?auto_194378 ) ( ON ?auto_194376 ?auto_194377 ) ( ON ?auto_194375 ?auto_194376 ) ( ON ?auto_194374 ?auto_194375 ) ( ON ?auto_194373 ?auto_194374 ) ( ON ?auto_194372 ?auto_194373 ) ( ON ?auto_194371 ?auto_194372 ) ( ON ?auto_194370 ?auto_194371 ) ( ON ?auto_194369 ?auto_194370 ) ( ON ?auto_194368 ?auto_194369 ) ( ON ?auto_194367 ?auto_194368 ) ( CLEAR ?auto_194367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194367 )
      ( MAKE-12PILE ?auto_194367 ?auto_194368 ?auto_194369 ?auto_194370 ?auto_194371 ?auto_194372 ?auto_194373 ?auto_194374 ?auto_194375 ?auto_194376 ?auto_194377 ?auto_194378 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_194391 - BLOCK
      ?auto_194392 - BLOCK
      ?auto_194393 - BLOCK
      ?auto_194394 - BLOCK
      ?auto_194395 - BLOCK
      ?auto_194396 - BLOCK
      ?auto_194397 - BLOCK
      ?auto_194398 - BLOCK
      ?auto_194399 - BLOCK
      ?auto_194400 - BLOCK
      ?auto_194401 - BLOCK
      ?auto_194402 - BLOCK
    )
    :vars
    (
      ?auto_194403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194391 ?auto_194392 ) ) ( not ( = ?auto_194391 ?auto_194393 ) ) ( not ( = ?auto_194391 ?auto_194394 ) ) ( not ( = ?auto_194391 ?auto_194395 ) ) ( not ( = ?auto_194391 ?auto_194396 ) ) ( not ( = ?auto_194391 ?auto_194397 ) ) ( not ( = ?auto_194391 ?auto_194398 ) ) ( not ( = ?auto_194391 ?auto_194399 ) ) ( not ( = ?auto_194391 ?auto_194400 ) ) ( not ( = ?auto_194391 ?auto_194401 ) ) ( not ( = ?auto_194391 ?auto_194402 ) ) ( not ( = ?auto_194392 ?auto_194393 ) ) ( not ( = ?auto_194392 ?auto_194394 ) ) ( not ( = ?auto_194392 ?auto_194395 ) ) ( not ( = ?auto_194392 ?auto_194396 ) ) ( not ( = ?auto_194392 ?auto_194397 ) ) ( not ( = ?auto_194392 ?auto_194398 ) ) ( not ( = ?auto_194392 ?auto_194399 ) ) ( not ( = ?auto_194392 ?auto_194400 ) ) ( not ( = ?auto_194392 ?auto_194401 ) ) ( not ( = ?auto_194392 ?auto_194402 ) ) ( not ( = ?auto_194393 ?auto_194394 ) ) ( not ( = ?auto_194393 ?auto_194395 ) ) ( not ( = ?auto_194393 ?auto_194396 ) ) ( not ( = ?auto_194393 ?auto_194397 ) ) ( not ( = ?auto_194393 ?auto_194398 ) ) ( not ( = ?auto_194393 ?auto_194399 ) ) ( not ( = ?auto_194393 ?auto_194400 ) ) ( not ( = ?auto_194393 ?auto_194401 ) ) ( not ( = ?auto_194393 ?auto_194402 ) ) ( not ( = ?auto_194394 ?auto_194395 ) ) ( not ( = ?auto_194394 ?auto_194396 ) ) ( not ( = ?auto_194394 ?auto_194397 ) ) ( not ( = ?auto_194394 ?auto_194398 ) ) ( not ( = ?auto_194394 ?auto_194399 ) ) ( not ( = ?auto_194394 ?auto_194400 ) ) ( not ( = ?auto_194394 ?auto_194401 ) ) ( not ( = ?auto_194394 ?auto_194402 ) ) ( not ( = ?auto_194395 ?auto_194396 ) ) ( not ( = ?auto_194395 ?auto_194397 ) ) ( not ( = ?auto_194395 ?auto_194398 ) ) ( not ( = ?auto_194395 ?auto_194399 ) ) ( not ( = ?auto_194395 ?auto_194400 ) ) ( not ( = ?auto_194395 ?auto_194401 ) ) ( not ( = ?auto_194395 ?auto_194402 ) ) ( not ( = ?auto_194396 ?auto_194397 ) ) ( not ( = ?auto_194396 ?auto_194398 ) ) ( not ( = ?auto_194396 ?auto_194399 ) ) ( not ( = ?auto_194396 ?auto_194400 ) ) ( not ( = ?auto_194396 ?auto_194401 ) ) ( not ( = ?auto_194396 ?auto_194402 ) ) ( not ( = ?auto_194397 ?auto_194398 ) ) ( not ( = ?auto_194397 ?auto_194399 ) ) ( not ( = ?auto_194397 ?auto_194400 ) ) ( not ( = ?auto_194397 ?auto_194401 ) ) ( not ( = ?auto_194397 ?auto_194402 ) ) ( not ( = ?auto_194398 ?auto_194399 ) ) ( not ( = ?auto_194398 ?auto_194400 ) ) ( not ( = ?auto_194398 ?auto_194401 ) ) ( not ( = ?auto_194398 ?auto_194402 ) ) ( not ( = ?auto_194399 ?auto_194400 ) ) ( not ( = ?auto_194399 ?auto_194401 ) ) ( not ( = ?auto_194399 ?auto_194402 ) ) ( not ( = ?auto_194400 ?auto_194401 ) ) ( not ( = ?auto_194400 ?auto_194402 ) ) ( not ( = ?auto_194401 ?auto_194402 ) ) ( ON ?auto_194391 ?auto_194403 ) ( not ( = ?auto_194402 ?auto_194403 ) ) ( not ( = ?auto_194401 ?auto_194403 ) ) ( not ( = ?auto_194400 ?auto_194403 ) ) ( not ( = ?auto_194399 ?auto_194403 ) ) ( not ( = ?auto_194398 ?auto_194403 ) ) ( not ( = ?auto_194397 ?auto_194403 ) ) ( not ( = ?auto_194396 ?auto_194403 ) ) ( not ( = ?auto_194395 ?auto_194403 ) ) ( not ( = ?auto_194394 ?auto_194403 ) ) ( not ( = ?auto_194393 ?auto_194403 ) ) ( not ( = ?auto_194392 ?auto_194403 ) ) ( not ( = ?auto_194391 ?auto_194403 ) ) ( ON ?auto_194392 ?auto_194391 ) ( ON ?auto_194393 ?auto_194392 ) ( ON ?auto_194394 ?auto_194393 ) ( ON ?auto_194395 ?auto_194394 ) ( ON ?auto_194396 ?auto_194395 ) ( ON ?auto_194397 ?auto_194396 ) ( ON ?auto_194398 ?auto_194397 ) ( ON ?auto_194399 ?auto_194398 ) ( ON ?auto_194400 ?auto_194399 ) ( ON ?auto_194401 ?auto_194400 ) ( ON ?auto_194402 ?auto_194401 ) ( CLEAR ?auto_194402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_194402 ?auto_194401 ?auto_194400 ?auto_194399 ?auto_194398 ?auto_194397 ?auto_194396 ?auto_194395 ?auto_194394 ?auto_194393 ?auto_194392 ?auto_194391 )
      ( MAKE-12PILE ?auto_194391 ?auto_194392 ?auto_194393 ?auto_194394 ?auto_194395 ?auto_194396 ?auto_194397 ?auto_194398 ?auto_194399 ?auto_194400 ?auto_194401 ?auto_194402 ) )
  )

)
