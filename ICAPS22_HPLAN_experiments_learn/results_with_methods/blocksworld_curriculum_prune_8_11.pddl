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
      ?auto_40648 - BLOCK
    )
    :vars
    (
      ?auto_40649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40648 ?auto_40649 ) ( CLEAR ?auto_40648 ) ( HAND-EMPTY ) ( not ( = ?auto_40648 ?auto_40649 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40648 ?auto_40649 )
      ( !PUTDOWN ?auto_40648 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40655 - BLOCK
      ?auto_40656 - BLOCK
    )
    :vars
    (
      ?auto_40657 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40655 ) ( ON ?auto_40656 ?auto_40657 ) ( CLEAR ?auto_40656 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40655 ) ( not ( = ?auto_40655 ?auto_40656 ) ) ( not ( = ?auto_40655 ?auto_40657 ) ) ( not ( = ?auto_40656 ?auto_40657 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40656 ?auto_40657 )
      ( !STACK ?auto_40656 ?auto_40655 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40665 - BLOCK
      ?auto_40666 - BLOCK
    )
    :vars
    (
      ?auto_40667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40666 ?auto_40667 ) ( not ( = ?auto_40665 ?auto_40666 ) ) ( not ( = ?auto_40665 ?auto_40667 ) ) ( not ( = ?auto_40666 ?auto_40667 ) ) ( ON ?auto_40665 ?auto_40666 ) ( CLEAR ?auto_40665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40665 )
      ( MAKE-2PILE ?auto_40665 ?auto_40666 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40676 - BLOCK
      ?auto_40677 - BLOCK
      ?auto_40678 - BLOCK
    )
    :vars
    (
      ?auto_40679 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40677 ) ( ON ?auto_40678 ?auto_40679 ) ( CLEAR ?auto_40678 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40676 ) ( ON ?auto_40677 ?auto_40676 ) ( not ( = ?auto_40676 ?auto_40677 ) ) ( not ( = ?auto_40676 ?auto_40678 ) ) ( not ( = ?auto_40676 ?auto_40679 ) ) ( not ( = ?auto_40677 ?auto_40678 ) ) ( not ( = ?auto_40677 ?auto_40679 ) ) ( not ( = ?auto_40678 ?auto_40679 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40678 ?auto_40679 )
      ( !STACK ?auto_40678 ?auto_40677 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40690 - BLOCK
      ?auto_40691 - BLOCK
      ?auto_40692 - BLOCK
    )
    :vars
    (
      ?auto_40693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40692 ?auto_40693 ) ( ON-TABLE ?auto_40690 ) ( not ( = ?auto_40690 ?auto_40691 ) ) ( not ( = ?auto_40690 ?auto_40692 ) ) ( not ( = ?auto_40690 ?auto_40693 ) ) ( not ( = ?auto_40691 ?auto_40692 ) ) ( not ( = ?auto_40691 ?auto_40693 ) ) ( not ( = ?auto_40692 ?auto_40693 ) ) ( CLEAR ?auto_40690 ) ( ON ?auto_40691 ?auto_40692 ) ( CLEAR ?auto_40691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40690 ?auto_40691 )
      ( MAKE-3PILE ?auto_40690 ?auto_40691 ?auto_40692 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40704 - BLOCK
      ?auto_40705 - BLOCK
      ?auto_40706 - BLOCK
    )
    :vars
    (
      ?auto_40707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40706 ?auto_40707 ) ( not ( = ?auto_40704 ?auto_40705 ) ) ( not ( = ?auto_40704 ?auto_40706 ) ) ( not ( = ?auto_40704 ?auto_40707 ) ) ( not ( = ?auto_40705 ?auto_40706 ) ) ( not ( = ?auto_40705 ?auto_40707 ) ) ( not ( = ?auto_40706 ?auto_40707 ) ) ( ON ?auto_40705 ?auto_40706 ) ( ON ?auto_40704 ?auto_40705 ) ( CLEAR ?auto_40704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40704 )
      ( MAKE-3PILE ?auto_40704 ?auto_40705 ?auto_40706 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40719 - BLOCK
      ?auto_40720 - BLOCK
      ?auto_40721 - BLOCK
      ?auto_40722 - BLOCK
    )
    :vars
    (
      ?auto_40723 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40721 ) ( ON ?auto_40722 ?auto_40723 ) ( CLEAR ?auto_40722 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40719 ) ( ON ?auto_40720 ?auto_40719 ) ( ON ?auto_40721 ?auto_40720 ) ( not ( = ?auto_40719 ?auto_40720 ) ) ( not ( = ?auto_40719 ?auto_40721 ) ) ( not ( = ?auto_40719 ?auto_40722 ) ) ( not ( = ?auto_40719 ?auto_40723 ) ) ( not ( = ?auto_40720 ?auto_40721 ) ) ( not ( = ?auto_40720 ?auto_40722 ) ) ( not ( = ?auto_40720 ?auto_40723 ) ) ( not ( = ?auto_40721 ?auto_40722 ) ) ( not ( = ?auto_40721 ?auto_40723 ) ) ( not ( = ?auto_40722 ?auto_40723 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40722 ?auto_40723 )
      ( !STACK ?auto_40722 ?auto_40721 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40737 - BLOCK
      ?auto_40738 - BLOCK
      ?auto_40739 - BLOCK
      ?auto_40740 - BLOCK
    )
    :vars
    (
      ?auto_40741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40740 ?auto_40741 ) ( ON-TABLE ?auto_40737 ) ( ON ?auto_40738 ?auto_40737 ) ( not ( = ?auto_40737 ?auto_40738 ) ) ( not ( = ?auto_40737 ?auto_40739 ) ) ( not ( = ?auto_40737 ?auto_40740 ) ) ( not ( = ?auto_40737 ?auto_40741 ) ) ( not ( = ?auto_40738 ?auto_40739 ) ) ( not ( = ?auto_40738 ?auto_40740 ) ) ( not ( = ?auto_40738 ?auto_40741 ) ) ( not ( = ?auto_40739 ?auto_40740 ) ) ( not ( = ?auto_40739 ?auto_40741 ) ) ( not ( = ?auto_40740 ?auto_40741 ) ) ( CLEAR ?auto_40738 ) ( ON ?auto_40739 ?auto_40740 ) ( CLEAR ?auto_40739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40737 ?auto_40738 ?auto_40739 )
      ( MAKE-4PILE ?auto_40737 ?auto_40738 ?auto_40739 ?auto_40740 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40755 - BLOCK
      ?auto_40756 - BLOCK
      ?auto_40757 - BLOCK
      ?auto_40758 - BLOCK
    )
    :vars
    (
      ?auto_40759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40758 ?auto_40759 ) ( ON-TABLE ?auto_40755 ) ( not ( = ?auto_40755 ?auto_40756 ) ) ( not ( = ?auto_40755 ?auto_40757 ) ) ( not ( = ?auto_40755 ?auto_40758 ) ) ( not ( = ?auto_40755 ?auto_40759 ) ) ( not ( = ?auto_40756 ?auto_40757 ) ) ( not ( = ?auto_40756 ?auto_40758 ) ) ( not ( = ?auto_40756 ?auto_40759 ) ) ( not ( = ?auto_40757 ?auto_40758 ) ) ( not ( = ?auto_40757 ?auto_40759 ) ) ( not ( = ?auto_40758 ?auto_40759 ) ) ( ON ?auto_40757 ?auto_40758 ) ( CLEAR ?auto_40755 ) ( ON ?auto_40756 ?auto_40757 ) ( CLEAR ?auto_40756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40755 ?auto_40756 )
      ( MAKE-4PILE ?auto_40755 ?auto_40756 ?auto_40757 ?auto_40758 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40773 - BLOCK
      ?auto_40774 - BLOCK
      ?auto_40775 - BLOCK
      ?auto_40776 - BLOCK
    )
    :vars
    (
      ?auto_40777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40776 ?auto_40777 ) ( not ( = ?auto_40773 ?auto_40774 ) ) ( not ( = ?auto_40773 ?auto_40775 ) ) ( not ( = ?auto_40773 ?auto_40776 ) ) ( not ( = ?auto_40773 ?auto_40777 ) ) ( not ( = ?auto_40774 ?auto_40775 ) ) ( not ( = ?auto_40774 ?auto_40776 ) ) ( not ( = ?auto_40774 ?auto_40777 ) ) ( not ( = ?auto_40775 ?auto_40776 ) ) ( not ( = ?auto_40775 ?auto_40777 ) ) ( not ( = ?auto_40776 ?auto_40777 ) ) ( ON ?auto_40775 ?auto_40776 ) ( ON ?auto_40774 ?auto_40775 ) ( ON ?auto_40773 ?auto_40774 ) ( CLEAR ?auto_40773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40773 )
      ( MAKE-4PILE ?auto_40773 ?auto_40774 ?auto_40775 ?auto_40776 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40792 - BLOCK
      ?auto_40793 - BLOCK
      ?auto_40794 - BLOCK
      ?auto_40795 - BLOCK
      ?auto_40796 - BLOCK
    )
    :vars
    (
      ?auto_40797 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40795 ) ( ON ?auto_40796 ?auto_40797 ) ( CLEAR ?auto_40796 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40792 ) ( ON ?auto_40793 ?auto_40792 ) ( ON ?auto_40794 ?auto_40793 ) ( ON ?auto_40795 ?auto_40794 ) ( not ( = ?auto_40792 ?auto_40793 ) ) ( not ( = ?auto_40792 ?auto_40794 ) ) ( not ( = ?auto_40792 ?auto_40795 ) ) ( not ( = ?auto_40792 ?auto_40796 ) ) ( not ( = ?auto_40792 ?auto_40797 ) ) ( not ( = ?auto_40793 ?auto_40794 ) ) ( not ( = ?auto_40793 ?auto_40795 ) ) ( not ( = ?auto_40793 ?auto_40796 ) ) ( not ( = ?auto_40793 ?auto_40797 ) ) ( not ( = ?auto_40794 ?auto_40795 ) ) ( not ( = ?auto_40794 ?auto_40796 ) ) ( not ( = ?auto_40794 ?auto_40797 ) ) ( not ( = ?auto_40795 ?auto_40796 ) ) ( not ( = ?auto_40795 ?auto_40797 ) ) ( not ( = ?auto_40796 ?auto_40797 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40796 ?auto_40797 )
      ( !STACK ?auto_40796 ?auto_40795 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40814 - BLOCK
      ?auto_40815 - BLOCK
      ?auto_40816 - BLOCK
      ?auto_40817 - BLOCK
      ?auto_40818 - BLOCK
    )
    :vars
    (
      ?auto_40819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40818 ?auto_40819 ) ( ON-TABLE ?auto_40814 ) ( ON ?auto_40815 ?auto_40814 ) ( ON ?auto_40816 ?auto_40815 ) ( not ( = ?auto_40814 ?auto_40815 ) ) ( not ( = ?auto_40814 ?auto_40816 ) ) ( not ( = ?auto_40814 ?auto_40817 ) ) ( not ( = ?auto_40814 ?auto_40818 ) ) ( not ( = ?auto_40814 ?auto_40819 ) ) ( not ( = ?auto_40815 ?auto_40816 ) ) ( not ( = ?auto_40815 ?auto_40817 ) ) ( not ( = ?auto_40815 ?auto_40818 ) ) ( not ( = ?auto_40815 ?auto_40819 ) ) ( not ( = ?auto_40816 ?auto_40817 ) ) ( not ( = ?auto_40816 ?auto_40818 ) ) ( not ( = ?auto_40816 ?auto_40819 ) ) ( not ( = ?auto_40817 ?auto_40818 ) ) ( not ( = ?auto_40817 ?auto_40819 ) ) ( not ( = ?auto_40818 ?auto_40819 ) ) ( CLEAR ?auto_40816 ) ( ON ?auto_40817 ?auto_40818 ) ( CLEAR ?auto_40817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40814 ?auto_40815 ?auto_40816 ?auto_40817 )
      ( MAKE-5PILE ?auto_40814 ?auto_40815 ?auto_40816 ?auto_40817 ?auto_40818 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40836 - BLOCK
      ?auto_40837 - BLOCK
      ?auto_40838 - BLOCK
      ?auto_40839 - BLOCK
      ?auto_40840 - BLOCK
    )
    :vars
    (
      ?auto_40841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40840 ?auto_40841 ) ( ON-TABLE ?auto_40836 ) ( ON ?auto_40837 ?auto_40836 ) ( not ( = ?auto_40836 ?auto_40837 ) ) ( not ( = ?auto_40836 ?auto_40838 ) ) ( not ( = ?auto_40836 ?auto_40839 ) ) ( not ( = ?auto_40836 ?auto_40840 ) ) ( not ( = ?auto_40836 ?auto_40841 ) ) ( not ( = ?auto_40837 ?auto_40838 ) ) ( not ( = ?auto_40837 ?auto_40839 ) ) ( not ( = ?auto_40837 ?auto_40840 ) ) ( not ( = ?auto_40837 ?auto_40841 ) ) ( not ( = ?auto_40838 ?auto_40839 ) ) ( not ( = ?auto_40838 ?auto_40840 ) ) ( not ( = ?auto_40838 ?auto_40841 ) ) ( not ( = ?auto_40839 ?auto_40840 ) ) ( not ( = ?auto_40839 ?auto_40841 ) ) ( not ( = ?auto_40840 ?auto_40841 ) ) ( ON ?auto_40839 ?auto_40840 ) ( CLEAR ?auto_40837 ) ( ON ?auto_40838 ?auto_40839 ) ( CLEAR ?auto_40838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40836 ?auto_40837 ?auto_40838 )
      ( MAKE-5PILE ?auto_40836 ?auto_40837 ?auto_40838 ?auto_40839 ?auto_40840 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40858 - BLOCK
      ?auto_40859 - BLOCK
      ?auto_40860 - BLOCK
      ?auto_40861 - BLOCK
      ?auto_40862 - BLOCK
    )
    :vars
    (
      ?auto_40863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40862 ?auto_40863 ) ( ON-TABLE ?auto_40858 ) ( not ( = ?auto_40858 ?auto_40859 ) ) ( not ( = ?auto_40858 ?auto_40860 ) ) ( not ( = ?auto_40858 ?auto_40861 ) ) ( not ( = ?auto_40858 ?auto_40862 ) ) ( not ( = ?auto_40858 ?auto_40863 ) ) ( not ( = ?auto_40859 ?auto_40860 ) ) ( not ( = ?auto_40859 ?auto_40861 ) ) ( not ( = ?auto_40859 ?auto_40862 ) ) ( not ( = ?auto_40859 ?auto_40863 ) ) ( not ( = ?auto_40860 ?auto_40861 ) ) ( not ( = ?auto_40860 ?auto_40862 ) ) ( not ( = ?auto_40860 ?auto_40863 ) ) ( not ( = ?auto_40861 ?auto_40862 ) ) ( not ( = ?auto_40861 ?auto_40863 ) ) ( not ( = ?auto_40862 ?auto_40863 ) ) ( ON ?auto_40861 ?auto_40862 ) ( ON ?auto_40860 ?auto_40861 ) ( CLEAR ?auto_40858 ) ( ON ?auto_40859 ?auto_40860 ) ( CLEAR ?auto_40859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40858 ?auto_40859 )
      ( MAKE-5PILE ?auto_40858 ?auto_40859 ?auto_40860 ?auto_40861 ?auto_40862 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40880 - BLOCK
      ?auto_40881 - BLOCK
      ?auto_40882 - BLOCK
      ?auto_40883 - BLOCK
      ?auto_40884 - BLOCK
    )
    :vars
    (
      ?auto_40885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40884 ?auto_40885 ) ( not ( = ?auto_40880 ?auto_40881 ) ) ( not ( = ?auto_40880 ?auto_40882 ) ) ( not ( = ?auto_40880 ?auto_40883 ) ) ( not ( = ?auto_40880 ?auto_40884 ) ) ( not ( = ?auto_40880 ?auto_40885 ) ) ( not ( = ?auto_40881 ?auto_40882 ) ) ( not ( = ?auto_40881 ?auto_40883 ) ) ( not ( = ?auto_40881 ?auto_40884 ) ) ( not ( = ?auto_40881 ?auto_40885 ) ) ( not ( = ?auto_40882 ?auto_40883 ) ) ( not ( = ?auto_40882 ?auto_40884 ) ) ( not ( = ?auto_40882 ?auto_40885 ) ) ( not ( = ?auto_40883 ?auto_40884 ) ) ( not ( = ?auto_40883 ?auto_40885 ) ) ( not ( = ?auto_40884 ?auto_40885 ) ) ( ON ?auto_40883 ?auto_40884 ) ( ON ?auto_40882 ?auto_40883 ) ( ON ?auto_40881 ?auto_40882 ) ( ON ?auto_40880 ?auto_40881 ) ( CLEAR ?auto_40880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40880 )
      ( MAKE-5PILE ?auto_40880 ?auto_40881 ?auto_40882 ?auto_40883 ?auto_40884 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40903 - BLOCK
      ?auto_40904 - BLOCK
      ?auto_40905 - BLOCK
      ?auto_40906 - BLOCK
      ?auto_40907 - BLOCK
      ?auto_40908 - BLOCK
    )
    :vars
    (
      ?auto_40909 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40907 ) ( ON ?auto_40908 ?auto_40909 ) ( CLEAR ?auto_40908 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40903 ) ( ON ?auto_40904 ?auto_40903 ) ( ON ?auto_40905 ?auto_40904 ) ( ON ?auto_40906 ?auto_40905 ) ( ON ?auto_40907 ?auto_40906 ) ( not ( = ?auto_40903 ?auto_40904 ) ) ( not ( = ?auto_40903 ?auto_40905 ) ) ( not ( = ?auto_40903 ?auto_40906 ) ) ( not ( = ?auto_40903 ?auto_40907 ) ) ( not ( = ?auto_40903 ?auto_40908 ) ) ( not ( = ?auto_40903 ?auto_40909 ) ) ( not ( = ?auto_40904 ?auto_40905 ) ) ( not ( = ?auto_40904 ?auto_40906 ) ) ( not ( = ?auto_40904 ?auto_40907 ) ) ( not ( = ?auto_40904 ?auto_40908 ) ) ( not ( = ?auto_40904 ?auto_40909 ) ) ( not ( = ?auto_40905 ?auto_40906 ) ) ( not ( = ?auto_40905 ?auto_40907 ) ) ( not ( = ?auto_40905 ?auto_40908 ) ) ( not ( = ?auto_40905 ?auto_40909 ) ) ( not ( = ?auto_40906 ?auto_40907 ) ) ( not ( = ?auto_40906 ?auto_40908 ) ) ( not ( = ?auto_40906 ?auto_40909 ) ) ( not ( = ?auto_40907 ?auto_40908 ) ) ( not ( = ?auto_40907 ?auto_40909 ) ) ( not ( = ?auto_40908 ?auto_40909 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40908 ?auto_40909 )
      ( !STACK ?auto_40908 ?auto_40907 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40929 - BLOCK
      ?auto_40930 - BLOCK
      ?auto_40931 - BLOCK
      ?auto_40932 - BLOCK
      ?auto_40933 - BLOCK
      ?auto_40934 - BLOCK
    )
    :vars
    (
      ?auto_40935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40934 ?auto_40935 ) ( ON-TABLE ?auto_40929 ) ( ON ?auto_40930 ?auto_40929 ) ( ON ?auto_40931 ?auto_40930 ) ( ON ?auto_40932 ?auto_40931 ) ( not ( = ?auto_40929 ?auto_40930 ) ) ( not ( = ?auto_40929 ?auto_40931 ) ) ( not ( = ?auto_40929 ?auto_40932 ) ) ( not ( = ?auto_40929 ?auto_40933 ) ) ( not ( = ?auto_40929 ?auto_40934 ) ) ( not ( = ?auto_40929 ?auto_40935 ) ) ( not ( = ?auto_40930 ?auto_40931 ) ) ( not ( = ?auto_40930 ?auto_40932 ) ) ( not ( = ?auto_40930 ?auto_40933 ) ) ( not ( = ?auto_40930 ?auto_40934 ) ) ( not ( = ?auto_40930 ?auto_40935 ) ) ( not ( = ?auto_40931 ?auto_40932 ) ) ( not ( = ?auto_40931 ?auto_40933 ) ) ( not ( = ?auto_40931 ?auto_40934 ) ) ( not ( = ?auto_40931 ?auto_40935 ) ) ( not ( = ?auto_40932 ?auto_40933 ) ) ( not ( = ?auto_40932 ?auto_40934 ) ) ( not ( = ?auto_40932 ?auto_40935 ) ) ( not ( = ?auto_40933 ?auto_40934 ) ) ( not ( = ?auto_40933 ?auto_40935 ) ) ( not ( = ?auto_40934 ?auto_40935 ) ) ( CLEAR ?auto_40932 ) ( ON ?auto_40933 ?auto_40934 ) ( CLEAR ?auto_40933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40929 ?auto_40930 ?auto_40931 ?auto_40932 ?auto_40933 )
      ( MAKE-6PILE ?auto_40929 ?auto_40930 ?auto_40931 ?auto_40932 ?auto_40933 ?auto_40934 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40955 - BLOCK
      ?auto_40956 - BLOCK
      ?auto_40957 - BLOCK
      ?auto_40958 - BLOCK
      ?auto_40959 - BLOCK
      ?auto_40960 - BLOCK
    )
    :vars
    (
      ?auto_40961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40960 ?auto_40961 ) ( ON-TABLE ?auto_40955 ) ( ON ?auto_40956 ?auto_40955 ) ( ON ?auto_40957 ?auto_40956 ) ( not ( = ?auto_40955 ?auto_40956 ) ) ( not ( = ?auto_40955 ?auto_40957 ) ) ( not ( = ?auto_40955 ?auto_40958 ) ) ( not ( = ?auto_40955 ?auto_40959 ) ) ( not ( = ?auto_40955 ?auto_40960 ) ) ( not ( = ?auto_40955 ?auto_40961 ) ) ( not ( = ?auto_40956 ?auto_40957 ) ) ( not ( = ?auto_40956 ?auto_40958 ) ) ( not ( = ?auto_40956 ?auto_40959 ) ) ( not ( = ?auto_40956 ?auto_40960 ) ) ( not ( = ?auto_40956 ?auto_40961 ) ) ( not ( = ?auto_40957 ?auto_40958 ) ) ( not ( = ?auto_40957 ?auto_40959 ) ) ( not ( = ?auto_40957 ?auto_40960 ) ) ( not ( = ?auto_40957 ?auto_40961 ) ) ( not ( = ?auto_40958 ?auto_40959 ) ) ( not ( = ?auto_40958 ?auto_40960 ) ) ( not ( = ?auto_40958 ?auto_40961 ) ) ( not ( = ?auto_40959 ?auto_40960 ) ) ( not ( = ?auto_40959 ?auto_40961 ) ) ( not ( = ?auto_40960 ?auto_40961 ) ) ( ON ?auto_40959 ?auto_40960 ) ( CLEAR ?auto_40957 ) ( ON ?auto_40958 ?auto_40959 ) ( CLEAR ?auto_40958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40955 ?auto_40956 ?auto_40957 ?auto_40958 )
      ( MAKE-6PILE ?auto_40955 ?auto_40956 ?auto_40957 ?auto_40958 ?auto_40959 ?auto_40960 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40981 - BLOCK
      ?auto_40982 - BLOCK
      ?auto_40983 - BLOCK
      ?auto_40984 - BLOCK
      ?auto_40985 - BLOCK
      ?auto_40986 - BLOCK
    )
    :vars
    (
      ?auto_40987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40986 ?auto_40987 ) ( ON-TABLE ?auto_40981 ) ( ON ?auto_40982 ?auto_40981 ) ( not ( = ?auto_40981 ?auto_40982 ) ) ( not ( = ?auto_40981 ?auto_40983 ) ) ( not ( = ?auto_40981 ?auto_40984 ) ) ( not ( = ?auto_40981 ?auto_40985 ) ) ( not ( = ?auto_40981 ?auto_40986 ) ) ( not ( = ?auto_40981 ?auto_40987 ) ) ( not ( = ?auto_40982 ?auto_40983 ) ) ( not ( = ?auto_40982 ?auto_40984 ) ) ( not ( = ?auto_40982 ?auto_40985 ) ) ( not ( = ?auto_40982 ?auto_40986 ) ) ( not ( = ?auto_40982 ?auto_40987 ) ) ( not ( = ?auto_40983 ?auto_40984 ) ) ( not ( = ?auto_40983 ?auto_40985 ) ) ( not ( = ?auto_40983 ?auto_40986 ) ) ( not ( = ?auto_40983 ?auto_40987 ) ) ( not ( = ?auto_40984 ?auto_40985 ) ) ( not ( = ?auto_40984 ?auto_40986 ) ) ( not ( = ?auto_40984 ?auto_40987 ) ) ( not ( = ?auto_40985 ?auto_40986 ) ) ( not ( = ?auto_40985 ?auto_40987 ) ) ( not ( = ?auto_40986 ?auto_40987 ) ) ( ON ?auto_40985 ?auto_40986 ) ( ON ?auto_40984 ?auto_40985 ) ( CLEAR ?auto_40982 ) ( ON ?auto_40983 ?auto_40984 ) ( CLEAR ?auto_40983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40981 ?auto_40982 ?auto_40983 )
      ( MAKE-6PILE ?auto_40981 ?auto_40982 ?auto_40983 ?auto_40984 ?auto_40985 ?auto_40986 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41007 - BLOCK
      ?auto_41008 - BLOCK
      ?auto_41009 - BLOCK
      ?auto_41010 - BLOCK
      ?auto_41011 - BLOCK
      ?auto_41012 - BLOCK
    )
    :vars
    (
      ?auto_41013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41012 ?auto_41013 ) ( ON-TABLE ?auto_41007 ) ( not ( = ?auto_41007 ?auto_41008 ) ) ( not ( = ?auto_41007 ?auto_41009 ) ) ( not ( = ?auto_41007 ?auto_41010 ) ) ( not ( = ?auto_41007 ?auto_41011 ) ) ( not ( = ?auto_41007 ?auto_41012 ) ) ( not ( = ?auto_41007 ?auto_41013 ) ) ( not ( = ?auto_41008 ?auto_41009 ) ) ( not ( = ?auto_41008 ?auto_41010 ) ) ( not ( = ?auto_41008 ?auto_41011 ) ) ( not ( = ?auto_41008 ?auto_41012 ) ) ( not ( = ?auto_41008 ?auto_41013 ) ) ( not ( = ?auto_41009 ?auto_41010 ) ) ( not ( = ?auto_41009 ?auto_41011 ) ) ( not ( = ?auto_41009 ?auto_41012 ) ) ( not ( = ?auto_41009 ?auto_41013 ) ) ( not ( = ?auto_41010 ?auto_41011 ) ) ( not ( = ?auto_41010 ?auto_41012 ) ) ( not ( = ?auto_41010 ?auto_41013 ) ) ( not ( = ?auto_41011 ?auto_41012 ) ) ( not ( = ?auto_41011 ?auto_41013 ) ) ( not ( = ?auto_41012 ?auto_41013 ) ) ( ON ?auto_41011 ?auto_41012 ) ( ON ?auto_41010 ?auto_41011 ) ( ON ?auto_41009 ?auto_41010 ) ( CLEAR ?auto_41007 ) ( ON ?auto_41008 ?auto_41009 ) ( CLEAR ?auto_41008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41007 ?auto_41008 )
      ( MAKE-6PILE ?auto_41007 ?auto_41008 ?auto_41009 ?auto_41010 ?auto_41011 ?auto_41012 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41033 - BLOCK
      ?auto_41034 - BLOCK
      ?auto_41035 - BLOCK
      ?auto_41036 - BLOCK
      ?auto_41037 - BLOCK
      ?auto_41038 - BLOCK
    )
    :vars
    (
      ?auto_41039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41038 ?auto_41039 ) ( not ( = ?auto_41033 ?auto_41034 ) ) ( not ( = ?auto_41033 ?auto_41035 ) ) ( not ( = ?auto_41033 ?auto_41036 ) ) ( not ( = ?auto_41033 ?auto_41037 ) ) ( not ( = ?auto_41033 ?auto_41038 ) ) ( not ( = ?auto_41033 ?auto_41039 ) ) ( not ( = ?auto_41034 ?auto_41035 ) ) ( not ( = ?auto_41034 ?auto_41036 ) ) ( not ( = ?auto_41034 ?auto_41037 ) ) ( not ( = ?auto_41034 ?auto_41038 ) ) ( not ( = ?auto_41034 ?auto_41039 ) ) ( not ( = ?auto_41035 ?auto_41036 ) ) ( not ( = ?auto_41035 ?auto_41037 ) ) ( not ( = ?auto_41035 ?auto_41038 ) ) ( not ( = ?auto_41035 ?auto_41039 ) ) ( not ( = ?auto_41036 ?auto_41037 ) ) ( not ( = ?auto_41036 ?auto_41038 ) ) ( not ( = ?auto_41036 ?auto_41039 ) ) ( not ( = ?auto_41037 ?auto_41038 ) ) ( not ( = ?auto_41037 ?auto_41039 ) ) ( not ( = ?auto_41038 ?auto_41039 ) ) ( ON ?auto_41037 ?auto_41038 ) ( ON ?auto_41036 ?auto_41037 ) ( ON ?auto_41035 ?auto_41036 ) ( ON ?auto_41034 ?auto_41035 ) ( ON ?auto_41033 ?auto_41034 ) ( CLEAR ?auto_41033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41033 )
      ( MAKE-6PILE ?auto_41033 ?auto_41034 ?auto_41035 ?auto_41036 ?auto_41037 ?auto_41038 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_41060 - BLOCK
      ?auto_41061 - BLOCK
      ?auto_41062 - BLOCK
      ?auto_41063 - BLOCK
      ?auto_41064 - BLOCK
      ?auto_41065 - BLOCK
      ?auto_41066 - BLOCK
    )
    :vars
    (
      ?auto_41067 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41065 ) ( ON ?auto_41066 ?auto_41067 ) ( CLEAR ?auto_41066 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41060 ) ( ON ?auto_41061 ?auto_41060 ) ( ON ?auto_41062 ?auto_41061 ) ( ON ?auto_41063 ?auto_41062 ) ( ON ?auto_41064 ?auto_41063 ) ( ON ?auto_41065 ?auto_41064 ) ( not ( = ?auto_41060 ?auto_41061 ) ) ( not ( = ?auto_41060 ?auto_41062 ) ) ( not ( = ?auto_41060 ?auto_41063 ) ) ( not ( = ?auto_41060 ?auto_41064 ) ) ( not ( = ?auto_41060 ?auto_41065 ) ) ( not ( = ?auto_41060 ?auto_41066 ) ) ( not ( = ?auto_41060 ?auto_41067 ) ) ( not ( = ?auto_41061 ?auto_41062 ) ) ( not ( = ?auto_41061 ?auto_41063 ) ) ( not ( = ?auto_41061 ?auto_41064 ) ) ( not ( = ?auto_41061 ?auto_41065 ) ) ( not ( = ?auto_41061 ?auto_41066 ) ) ( not ( = ?auto_41061 ?auto_41067 ) ) ( not ( = ?auto_41062 ?auto_41063 ) ) ( not ( = ?auto_41062 ?auto_41064 ) ) ( not ( = ?auto_41062 ?auto_41065 ) ) ( not ( = ?auto_41062 ?auto_41066 ) ) ( not ( = ?auto_41062 ?auto_41067 ) ) ( not ( = ?auto_41063 ?auto_41064 ) ) ( not ( = ?auto_41063 ?auto_41065 ) ) ( not ( = ?auto_41063 ?auto_41066 ) ) ( not ( = ?auto_41063 ?auto_41067 ) ) ( not ( = ?auto_41064 ?auto_41065 ) ) ( not ( = ?auto_41064 ?auto_41066 ) ) ( not ( = ?auto_41064 ?auto_41067 ) ) ( not ( = ?auto_41065 ?auto_41066 ) ) ( not ( = ?auto_41065 ?auto_41067 ) ) ( not ( = ?auto_41066 ?auto_41067 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41066 ?auto_41067 )
      ( !STACK ?auto_41066 ?auto_41065 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_41090 - BLOCK
      ?auto_41091 - BLOCK
      ?auto_41092 - BLOCK
      ?auto_41093 - BLOCK
      ?auto_41094 - BLOCK
      ?auto_41095 - BLOCK
      ?auto_41096 - BLOCK
    )
    :vars
    (
      ?auto_41097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41096 ?auto_41097 ) ( ON-TABLE ?auto_41090 ) ( ON ?auto_41091 ?auto_41090 ) ( ON ?auto_41092 ?auto_41091 ) ( ON ?auto_41093 ?auto_41092 ) ( ON ?auto_41094 ?auto_41093 ) ( not ( = ?auto_41090 ?auto_41091 ) ) ( not ( = ?auto_41090 ?auto_41092 ) ) ( not ( = ?auto_41090 ?auto_41093 ) ) ( not ( = ?auto_41090 ?auto_41094 ) ) ( not ( = ?auto_41090 ?auto_41095 ) ) ( not ( = ?auto_41090 ?auto_41096 ) ) ( not ( = ?auto_41090 ?auto_41097 ) ) ( not ( = ?auto_41091 ?auto_41092 ) ) ( not ( = ?auto_41091 ?auto_41093 ) ) ( not ( = ?auto_41091 ?auto_41094 ) ) ( not ( = ?auto_41091 ?auto_41095 ) ) ( not ( = ?auto_41091 ?auto_41096 ) ) ( not ( = ?auto_41091 ?auto_41097 ) ) ( not ( = ?auto_41092 ?auto_41093 ) ) ( not ( = ?auto_41092 ?auto_41094 ) ) ( not ( = ?auto_41092 ?auto_41095 ) ) ( not ( = ?auto_41092 ?auto_41096 ) ) ( not ( = ?auto_41092 ?auto_41097 ) ) ( not ( = ?auto_41093 ?auto_41094 ) ) ( not ( = ?auto_41093 ?auto_41095 ) ) ( not ( = ?auto_41093 ?auto_41096 ) ) ( not ( = ?auto_41093 ?auto_41097 ) ) ( not ( = ?auto_41094 ?auto_41095 ) ) ( not ( = ?auto_41094 ?auto_41096 ) ) ( not ( = ?auto_41094 ?auto_41097 ) ) ( not ( = ?auto_41095 ?auto_41096 ) ) ( not ( = ?auto_41095 ?auto_41097 ) ) ( not ( = ?auto_41096 ?auto_41097 ) ) ( CLEAR ?auto_41094 ) ( ON ?auto_41095 ?auto_41096 ) ( CLEAR ?auto_41095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41090 ?auto_41091 ?auto_41092 ?auto_41093 ?auto_41094 ?auto_41095 )
      ( MAKE-7PILE ?auto_41090 ?auto_41091 ?auto_41092 ?auto_41093 ?auto_41094 ?auto_41095 ?auto_41096 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_41120 - BLOCK
      ?auto_41121 - BLOCK
      ?auto_41122 - BLOCK
      ?auto_41123 - BLOCK
      ?auto_41124 - BLOCK
      ?auto_41125 - BLOCK
      ?auto_41126 - BLOCK
    )
    :vars
    (
      ?auto_41127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41126 ?auto_41127 ) ( ON-TABLE ?auto_41120 ) ( ON ?auto_41121 ?auto_41120 ) ( ON ?auto_41122 ?auto_41121 ) ( ON ?auto_41123 ?auto_41122 ) ( not ( = ?auto_41120 ?auto_41121 ) ) ( not ( = ?auto_41120 ?auto_41122 ) ) ( not ( = ?auto_41120 ?auto_41123 ) ) ( not ( = ?auto_41120 ?auto_41124 ) ) ( not ( = ?auto_41120 ?auto_41125 ) ) ( not ( = ?auto_41120 ?auto_41126 ) ) ( not ( = ?auto_41120 ?auto_41127 ) ) ( not ( = ?auto_41121 ?auto_41122 ) ) ( not ( = ?auto_41121 ?auto_41123 ) ) ( not ( = ?auto_41121 ?auto_41124 ) ) ( not ( = ?auto_41121 ?auto_41125 ) ) ( not ( = ?auto_41121 ?auto_41126 ) ) ( not ( = ?auto_41121 ?auto_41127 ) ) ( not ( = ?auto_41122 ?auto_41123 ) ) ( not ( = ?auto_41122 ?auto_41124 ) ) ( not ( = ?auto_41122 ?auto_41125 ) ) ( not ( = ?auto_41122 ?auto_41126 ) ) ( not ( = ?auto_41122 ?auto_41127 ) ) ( not ( = ?auto_41123 ?auto_41124 ) ) ( not ( = ?auto_41123 ?auto_41125 ) ) ( not ( = ?auto_41123 ?auto_41126 ) ) ( not ( = ?auto_41123 ?auto_41127 ) ) ( not ( = ?auto_41124 ?auto_41125 ) ) ( not ( = ?auto_41124 ?auto_41126 ) ) ( not ( = ?auto_41124 ?auto_41127 ) ) ( not ( = ?auto_41125 ?auto_41126 ) ) ( not ( = ?auto_41125 ?auto_41127 ) ) ( not ( = ?auto_41126 ?auto_41127 ) ) ( ON ?auto_41125 ?auto_41126 ) ( CLEAR ?auto_41123 ) ( ON ?auto_41124 ?auto_41125 ) ( CLEAR ?auto_41124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41120 ?auto_41121 ?auto_41122 ?auto_41123 ?auto_41124 )
      ( MAKE-7PILE ?auto_41120 ?auto_41121 ?auto_41122 ?auto_41123 ?auto_41124 ?auto_41125 ?auto_41126 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_41150 - BLOCK
      ?auto_41151 - BLOCK
      ?auto_41152 - BLOCK
      ?auto_41153 - BLOCK
      ?auto_41154 - BLOCK
      ?auto_41155 - BLOCK
      ?auto_41156 - BLOCK
    )
    :vars
    (
      ?auto_41157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41156 ?auto_41157 ) ( ON-TABLE ?auto_41150 ) ( ON ?auto_41151 ?auto_41150 ) ( ON ?auto_41152 ?auto_41151 ) ( not ( = ?auto_41150 ?auto_41151 ) ) ( not ( = ?auto_41150 ?auto_41152 ) ) ( not ( = ?auto_41150 ?auto_41153 ) ) ( not ( = ?auto_41150 ?auto_41154 ) ) ( not ( = ?auto_41150 ?auto_41155 ) ) ( not ( = ?auto_41150 ?auto_41156 ) ) ( not ( = ?auto_41150 ?auto_41157 ) ) ( not ( = ?auto_41151 ?auto_41152 ) ) ( not ( = ?auto_41151 ?auto_41153 ) ) ( not ( = ?auto_41151 ?auto_41154 ) ) ( not ( = ?auto_41151 ?auto_41155 ) ) ( not ( = ?auto_41151 ?auto_41156 ) ) ( not ( = ?auto_41151 ?auto_41157 ) ) ( not ( = ?auto_41152 ?auto_41153 ) ) ( not ( = ?auto_41152 ?auto_41154 ) ) ( not ( = ?auto_41152 ?auto_41155 ) ) ( not ( = ?auto_41152 ?auto_41156 ) ) ( not ( = ?auto_41152 ?auto_41157 ) ) ( not ( = ?auto_41153 ?auto_41154 ) ) ( not ( = ?auto_41153 ?auto_41155 ) ) ( not ( = ?auto_41153 ?auto_41156 ) ) ( not ( = ?auto_41153 ?auto_41157 ) ) ( not ( = ?auto_41154 ?auto_41155 ) ) ( not ( = ?auto_41154 ?auto_41156 ) ) ( not ( = ?auto_41154 ?auto_41157 ) ) ( not ( = ?auto_41155 ?auto_41156 ) ) ( not ( = ?auto_41155 ?auto_41157 ) ) ( not ( = ?auto_41156 ?auto_41157 ) ) ( ON ?auto_41155 ?auto_41156 ) ( ON ?auto_41154 ?auto_41155 ) ( CLEAR ?auto_41152 ) ( ON ?auto_41153 ?auto_41154 ) ( CLEAR ?auto_41153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41150 ?auto_41151 ?auto_41152 ?auto_41153 )
      ( MAKE-7PILE ?auto_41150 ?auto_41151 ?auto_41152 ?auto_41153 ?auto_41154 ?auto_41155 ?auto_41156 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_41180 - BLOCK
      ?auto_41181 - BLOCK
      ?auto_41182 - BLOCK
      ?auto_41183 - BLOCK
      ?auto_41184 - BLOCK
      ?auto_41185 - BLOCK
      ?auto_41186 - BLOCK
    )
    :vars
    (
      ?auto_41187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41186 ?auto_41187 ) ( ON-TABLE ?auto_41180 ) ( ON ?auto_41181 ?auto_41180 ) ( not ( = ?auto_41180 ?auto_41181 ) ) ( not ( = ?auto_41180 ?auto_41182 ) ) ( not ( = ?auto_41180 ?auto_41183 ) ) ( not ( = ?auto_41180 ?auto_41184 ) ) ( not ( = ?auto_41180 ?auto_41185 ) ) ( not ( = ?auto_41180 ?auto_41186 ) ) ( not ( = ?auto_41180 ?auto_41187 ) ) ( not ( = ?auto_41181 ?auto_41182 ) ) ( not ( = ?auto_41181 ?auto_41183 ) ) ( not ( = ?auto_41181 ?auto_41184 ) ) ( not ( = ?auto_41181 ?auto_41185 ) ) ( not ( = ?auto_41181 ?auto_41186 ) ) ( not ( = ?auto_41181 ?auto_41187 ) ) ( not ( = ?auto_41182 ?auto_41183 ) ) ( not ( = ?auto_41182 ?auto_41184 ) ) ( not ( = ?auto_41182 ?auto_41185 ) ) ( not ( = ?auto_41182 ?auto_41186 ) ) ( not ( = ?auto_41182 ?auto_41187 ) ) ( not ( = ?auto_41183 ?auto_41184 ) ) ( not ( = ?auto_41183 ?auto_41185 ) ) ( not ( = ?auto_41183 ?auto_41186 ) ) ( not ( = ?auto_41183 ?auto_41187 ) ) ( not ( = ?auto_41184 ?auto_41185 ) ) ( not ( = ?auto_41184 ?auto_41186 ) ) ( not ( = ?auto_41184 ?auto_41187 ) ) ( not ( = ?auto_41185 ?auto_41186 ) ) ( not ( = ?auto_41185 ?auto_41187 ) ) ( not ( = ?auto_41186 ?auto_41187 ) ) ( ON ?auto_41185 ?auto_41186 ) ( ON ?auto_41184 ?auto_41185 ) ( ON ?auto_41183 ?auto_41184 ) ( CLEAR ?auto_41181 ) ( ON ?auto_41182 ?auto_41183 ) ( CLEAR ?auto_41182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41180 ?auto_41181 ?auto_41182 )
      ( MAKE-7PILE ?auto_41180 ?auto_41181 ?auto_41182 ?auto_41183 ?auto_41184 ?auto_41185 ?auto_41186 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_41210 - BLOCK
      ?auto_41211 - BLOCK
      ?auto_41212 - BLOCK
      ?auto_41213 - BLOCK
      ?auto_41214 - BLOCK
      ?auto_41215 - BLOCK
      ?auto_41216 - BLOCK
    )
    :vars
    (
      ?auto_41217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41216 ?auto_41217 ) ( ON-TABLE ?auto_41210 ) ( not ( = ?auto_41210 ?auto_41211 ) ) ( not ( = ?auto_41210 ?auto_41212 ) ) ( not ( = ?auto_41210 ?auto_41213 ) ) ( not ( = ?auto_41210 ?auto_41214 ) ) ( not ( = ?auto_41210 ?auto_41215 ) ) ( not ( = ?auto_41210 ?auto_41216 ) ) ( not ( = ?auto_41210 ?auto_41217 ) ) ( not ( = ?auto_41211 ?auto_41212 ) ) ( not ( = ?auto_41211 ?auto_41213 ) ) ( not ( = ?auto_41211 ?auto_41214 ) ) ( not ( = ?auto_41211 ?auto_41215 ) ) ( not ( = ?auto_41211 ?auto_41216 ) ) ( not ( = ?auto_41211 ?auto_41217 ) ) ( not ( = ?auto_41212 ?auto_41213 ) ) ( not ( = ?auto_41212 ?auto_41214 ) ) ( not ( = ?auto_41212 ?auto_41215 ) ) ( not ( = ?auto_41212 ?auto_41216 ) ) ( not ( = ?auto_41212 ?auto_41217 ) ) ( not ( = ?auto_41213 ?auto_41214 ) ) ( not ( = ?auto_41213 ?auto_41215 ) ) ( not ( = ?auto_41213 ?auto_41216 ) ) ( not ( = ?auto_41213 ?auto_41217 ) ) ( not ( = ?auto_41214 ?auto_41215 ) ) ( not ( = ?auto_41214 ?auto_41216 ) ) ( not ( = ?auto_41214 ?auto_41217 ) ) ( not ( = ?auto_41215 ?auto_41216 ) ) ( not ( = ?auto_41215 ?auto_41217 ) ) ( not ( = ?auto_41216 ?auto_41217 ) ) ( ON ?auto_41215 ?auto_41216 ) ( ON ?auto_41214 ?auto_41215 ) ( ON ?auto_41213 ?auto_41214 ) ( ON ?auto_41212 ?auto_41213 ) ( CLEAR ?auto_41210 ) ( ON ?auto_41211 ?auto_41212 ) ( CLEAR ?auto_41211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41210 ?auto_41211 )
      ( MAKE-7PILE ?auto_41210 ?auto_41211 ?auto_41212 ?auto_41213 ?auto_41214 ?auto_41215 ?auto_41216 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_41240 - BLOCK
      ?auto_41241 - BLOCK
      ?auto_41242 - BLOCK
      ?auto_41243 - BLOCK
      ?auto_41244 - BLOCK
      ?auto_41245 - BLOCK
      ?auto_41246 - BLOCK
    )
    :vars
    (
      ?auto_41247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41246 ?auto_41247 ) ( not ( = ?auto_41240 ?auto_41241 ) ) ( not ( = ?auto_41240 ?auto_41242 ) ) ( not ( = ?auto_41240 ?auto_41243 ) ) ( not ( = ?auto_41240 ?auto_41244 ) ) ( not ( = ?auto_41240 ?auto_41245 ) ) ( not ( = ?auto_41240 ?auto_41246 ) ) ( not ( = ?auto_41240 ?auto_41247 ) ) ( not ( = ?auto_41241 ?auto_41242 ) ) ( not ( = ?auto_41241 ?auto_41243 ) ) ( not ( = ?auto_41241 ?auto_41244 ) ) ( not ( = ?auto_41241 ?auto_41245 ) ) ( not ( = ?auto_41241 ?auto_41246 ) ) ( not ( = ?auto_41241 ?auto_41247 ) ) ( not ( = ?auto_41242 ?auto_41243 ) ) ( not ( = ?auto_41242 ?auto_41244 ) ) ( not ( = ?auto_41242 ?auto_41245 ) ) ( not ( = ?auto_41242 ?auto_41246 ) ) ( not ( = ?auto_41242 ?auto_41247 ) ) ( not ( = ?auto_41243 ?auto_41244 ) ) ( not ( = ?auto_41243 ?auto_41245 ) ) ( not ( = ?auto_41243 ?auto_41246 ) ) ( not ( = ?auto_41243 ?auto_41247 ) ) ( not ( = ?auto_41244 ?auto_41245 ) ) ( not ( = ?auto_41244 ?auto_41246 ) ) ( not ( = ?auto_41244 ?auto_41247 ) ) ( not ( = ?auto_41245 ?auto_41246 ) ) ( not ( = ?auto_41245 ?auto_41247 ) ) ( not ( = ?auto_41246 ?auto_41247 ) ) ( ON ?auto_41245 ?auto_41246 ) ( ON ?auto_41244 ?auto_41245 ) ( ON ?auto_41243 ?auto_41244 ) ( ON ?auto_41242 ?auto_41243 ) ( ON ?auto_41241 ?auto_41242 ) ( ON ?auto_41240 ?auto_41241 ) ( CLEAR ?auto_41240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41240 )
      ( MAKE-7PILE ?auto_41240 ?auto_41241 ?auto_41242 ?auto_41243 ?auto_41244 ?auto_41245 ?auto_41246 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41271 - BLOCK
      ?auto_41272 - BLOCK
      ?auto_41273 - BLOCK
      ?auto_41274 - BLOCK
      ?auto_41275 - BLOCK
      ?auto_41276 - BLOCK
      ?auto_41277 - BLOCK
      ?auto_41278 - BLOCK
    )
    :vars
    (
      ?auto_41279 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41277 ) ( ON ?auto_41278 ?auto_41279 ) ( CLEAR ?auto_41278 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41271 ) ( ON ?auto_41272 ?auto_41271 ) ( ON ?auto_41273 ?auto_41272 ) ( ON ?auto_41274 ?auto_41273 ) ( ON ?auto_41275 ?auto_41274 ) ( ON ?auto_41276 ?auto_41275 ) ( ON ?auto_41277 ?auto_41276 ) ( not ( = ?auto_41271 ?auto_41272 ) ) ( not ( = ?auto_41271 ?auto_41273 ) ) ( not ( = ?auto_41271 ?auto_41274 ) ) ( not ( = ?auto_41271 ?auto_41275 ) ) ( not ( = ?auto_41271 ?auto_41276 ) ) ( not ( = ?auto_41271 ?auto_41277 ) ) ( not ( = ?auto_41271 ?auto_41278 ) ) ( not ( = ?auto_41271 ?auto_41279 ) ) ( not ( = ?auto_41272 ?auto_41273 ) ) ( not ( = ?auto_41272 ?auto_41274 ) ) ( not ( = ?auto_41272 ?auto_41275 ) ) ( not ( = ?auto_41272 ?auto_41276 ) ) ( not ( = ?auto_41272 ?auto_41277 ) ) ( not ( = ?auto_41272 ?auto_41278 ) ) ( not ( = ?auto_41272 ?auto_41279 ) ) ( not ( = ?auto_41273 ?auto_41274 ) ) ( not ( = ?auto_41273 ?auto_41275 ) ) ( not ( = ?auto_41273 ?auto_41276 ) ) ( not ( = ?auto_41273 ?auto_41277 ) ) ( not ( = ?auto_41273 ?auto_41278 ) ) ( not ( = ?auto_41273 ?auto_41279 ) ) ( not ( = ?auto_41274 ?auto_41275 ) ) ( not ( = ?auto_41274 ?auto_41276 ) ) ( not ( = ?auto_41274 ?auto_41277 ) ) ( not ( = ?auto_41274 ?auto_41278 ) ) ( not ( = ?auto_41274 ?auto_41279 ) ) ( not ( = ?auto_41275 ?auto_41276 ) ) ( not ( = ?auto_41275 ?auto_41277 ) ) ( not ( = ?auto_41275 ?auto_41278 ) ) ( not ( = ?auto_41275 ?auto_41279 ) ) ( not ( = ?auto_41276 ?auto_41277 ) ) ( not ( = ?auto_41276 ?auto_41278 ) ) ( not ( = ?auto_41276 ?auto_41279 ) ) ( not ( = ?auto_41277 ?auto_41278 ) ) ( not ( = ?auto_41277 ?auto_41279 ) ) ( not ( = ?auto_41278 ?auto_41279 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41278 ?auto_41279 )
      ( !STACK ?auto_41278 ?auto_41277 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41288 - BLOCK
      ?auto_41289 - BLOCK
      ?auto_41290 - BLOCK
      ?auto_41291 - BLOCK
      ?auto_41292 - BLOCK
      ?auto_41293 - BLOCK
      ?auto_41294 - BLOCK
      ?auto_41295 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41294 ) ( ON-TABLE ?auto_41295 ) ( CLEAR ?auto_41295 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41288 ) ( ON ?auto_41289 ?auto_41288 ) ( ON ?auto_41290 ?auto_41289 ) ( ON ?auto_41291 ?auto_41290 ) ( ON ?auto_41292 ?auto_41291 ) ( ON ?auto_41293 ?auto_41292 ) ( ON ?auto_41294 ?auto_41293 ) ( not ( = ?auto_41288 ?auto_41289 ) ) ( not ( = ?auto_41288 ?auto_41290 ) ) ( not ( = ?auto_41288 ?auto_41291 ) ) ( not ( = ?auto_41288 ?auto_41292 ) ) ( not ( = ?auto_41288 ?auto_41293 ) ) ( not ( = ?auto_41288 ?auto_41294 ) ) ( not ( = ?auto_41288 ?auto_41295 ) ) ( not ( = ?auto_41289 ?auto_41290 ) ) ( not ( = ?auto_41289 ?auto_41291 ) ) ( not ( = ?auto_41289 ?auto_41292 ) ) ( not ( = ?auto_41289 ?auto_41293 ) ) ( not ( = ?auto_41289 ?auto_41294 ) ) ( not ( = ?auto_41289 ?auto_41295 ) ) ( not ( = ?auto_41290 ?auto_41291 ) ) ( not ( = ?auto_41290 ?auto_41292 ) ) ( not ( = ?auto_41290 ?auto_41293 ) ) ( not ( = ?auto_41290 ?auto_41294 ) ) ( not ( = ?auto_41290 ?auto_41295 ) ) ( not ( = ?auto_41291 ?auto_41292 ) ) ( not ( = ?auto_41291 ?auto_41293 ) ) ( not ( = ?auto_41291 ?auto_41294 ) ) ( not ( = ?auto_41291 ?auto_41295 ) ) ( not ( = ?auto_41292 ?auto_41293 ) ) ( not ( = ?auto_41292 ?auto_41294 ) ) ( not ( = ?auto_41292 ?auto_41295 ) ) ( not ( = ?auto_41293 ?auto_41294 ) ) ( not ( = ?auto_41293 ?auto_41295 ) ) ( not ( = ?auto_41294 ?auto_41295 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_41295 )
      ( !STACK ?auto_41295 ?auto_41294 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41304 - BLOCK
      ?auto_41305 - BLOCK
      ?auto_41306 - BLOCK
      ?auto_41307 - BLOCK
      ?auto_41308 - BLOCK
      ?auto_41309 - BLOCK
      ?auto_41310 - BLOCK
      ?auto_41311 - BLOCK
    )
    :vars
    (
      ?auto_41312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41311 ?auto_41312 ) ( ON-TABLE ?auto_41304 ) ( ON ?auto_41305 ?auto_41304 ) ( ON ?auto_41306 ?auto_41305 ) ( ON ?auto_41307 ?auto_41306 ) ( ON ?auto_41308 ?auto_41307 ) ( ON ?auto_41309 ?auto_41308 ) ( not ( = ?auto_41304 ?auto_41305 ) ) ( not ( = ?auto_41304 ?auto_41306 ) ) ( not ( = ?auto_41304 ?auto_41307 ) ) ( not ( = ?auto_41304 ?auto_41308 ) ) ( not ( = ?auto_41304 ?auto_41309 ) ) ( not ( = ?auto_41304 ?auto_41310 ) ) ( not ( = ?auto_41304 ?auto_41311 ) ) ( not ( = ?auto_41304 ?auto_41312 ) ) ( not ( = ?auto_41305 ?auto_41306 ) ) ( not ( = ?auto_41305 ?auto_41307 ) ) ( not ( = ?auto_41305 ?auto_41308 ) ) ( not ( = ?auto_41305 ?auto_41309 ) ) ( not ( = ?auto_41305 ?auto_41310 ) ) ( not ( = ?auto_41305 ?auto_41311 ) ) ( not ( = ?auto_41305 ?auto_41312 ) ) ( not ( = ?auto_41306 ?auto_41307 ) ) ( not ( = ?auto_41306 ?auto_41308 ) ) ( not ( = ?auto_41306 ?auto_41309 ) ) ( not ( = ?auto_41306 ?auto_41310 ) ) ( not ( = ?auto_41306 ?auto_41311 ) ) ( not ( = ?auto_41306 ?auto_41312 ) ) ( not ( = ?auto_41307 ?auto_41308 ) ) ( not ( = ?auto_41307 ?auto_41309 ) ) ( not ( = ?auto_41307 ?auto_41310 ) ) ( not ( = ?auto_41307 ?auto_41311 ) ) ( not ( = ?auto_41307 ?auto_41312 ) ) ( not ( = ?auto_41308 ?auto_41309 ) ) ( not ( = ?auto_41308 ?auto_41310 ) ) ( not ( = ?auto_41308 ?auto_41311 ) ) ( not ( = ?auto_41308 ?auto_41312 ) ) ( not ( = ?auto_41309 ?auto_41310 ) ) ( not ( = ?auto_41309 ?auto_41311 ) ) ( not ( = ?auto_41309 ?auto_41312 ) ) ( not ( = ?auto_41310 ?auto_41311 ) ) ( not ( = ?auto_41310 ?auto_41312 ) ) ( not ( = ?auto_41311 ?auto_41312 ) ) ( CLEAR ?auto_41309 ) ( ON ?auto_41310 ?auto_41311 ) ( CLEAR ?auto_41310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_41304 ?auto_41305 ?auto_41306 ?auto_41307 ?auto_41308 ?auto_41309 ?auto_41310 )
      ( MAKE-8PILE ?auto_41304 ?auto_41305 ?auto_41306 ?auto_41307 ?auto_41308 ?auto_41309 ?auto_41310 ?auto_41311 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41321 - BLOCK
      ?auto_41322 - BLOCK
      ?auto_41323 - BLOCK
      ?auto_41324 - BLOCK
      ?auto_41325 - BLOCK
      ?auto_41326 - BLOCK
      ?auto_41327 - BLOCK
      ?auto_41328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41328 ) ( ON-TABLE ?auto_41321 ) ( ON ?auto_41322 ?auto_41321 ) ( ON ?auto_41323 ?auto_41322 ) ( ON ?auto_41324 ?auto_41323 ) ( ON ?auto_41325 ?auto_41324 ) ( ON ?auto_41326 ?auto_41325 ) ( not ( = ?auto_41321 ?auto_41322 ) ) ( not ( = ?auto_41321 ?auto_41323 ) ) ( not ( = ?auto_41321 ?auto_41324 ) ) ( not ( = ?auto_41321 ?auto_41325 ) ) ( not ( = ?auto_41321 ?auto_41326 ) ) ( not ( = ?auto_41321 ?auto_41327 ) ) ( not ( = ?auto_41321 ?auto_41328 ) ) ( not ( = ?auto_41322 ?auto_41323 ) ) ( not ( = ?auto_41322 ?auto_41324 ) ) ( not ( = ?auto_41322 ?auto_41325 ) ) ( not ( = ?auto_41322 ?auto_41326 ) ) ( not ( = ?auto_41322 ?auto_41327 ) ) ( not ( = ?auto_41322 ?auto_41328 ) ) ( not ( = ?auto_41323 ?auto_41324 ) ) ( not ( = ?auto_41323 ?auto_41325 ) ) ( not ( = ?auto_41323 ?auto_41326 ) ) ( not ( = ?auto_41323 ?auto_41327 ) ) ( not ( = ?auto_41323 ?auto_41328 ) ) ( not ( = ?auto_41324 ?auto_41325 ) ) ( not ( = ?auto_41324 ?auto_41326 ) ) ( not ( = ?auto_41324 ?auto_41327 ) ) ( not ( = ?auto_41324 ?auto_41328 ) ) ( not ( = ?auto_41325 ?auto_41326 ) ) ( not ( = ?auto_41325 ?auto_41327 ) ) ( not ( = ?auto_41325 ?auto_41328 ) ) ( not ( = ?auto_41326 ?auto_41327 ) ) ( not ( = ?auto_41326 ?auto_41328 ) ) ( not ( = ?auto_41327 ?auto_41328 ) ) ( CLEAR ?auto_41326 ) ( ON ?auto_41327 ?auto_41328 ) ( CLEAR ?auto_41327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_41321 ?auto_41322 ?auto_41323 ?auto_41324 ?auto_41325 ?auto_41326 ?auto_41327 )
      ( MAKE-8PILE ?auto_41321 ?auto_41322 ?auto_41323 ?auto_41324 ?auto_41325 ?auto_41326 ?auto_41327 ?auto_41328 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41337 - BLOCK
      ?auto_41338 - BLOCK
      ?auto_41339 - BLOCK
      ?auto_41340 - BLOCK
      ?auto_41341 - BLOCK
      ?auto_41342 - BLOCK
      ?auto_41343 - BLOCK
      ?auto_41344 - BLOCK
    )
    :vars
    (
      ?auto_41345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41344 ?auto_41345 ) ( ON-TABLE ?auto_41337 ) ( ON ?auto_41338 ?auto_41337 ) ( ON ?auto_41339 ?auto_41338 ) ( ON ?auto_41340 ?auto_41339 ) ( ON ?auto_41341 ?auto_41340 ) ( not ( = ?auto_41337 ?auto_41338 ) ) ( not ( = ?auto_41337 ?auto_41339 ) ) ( not ( = ?auto_41337 ?auto_41340 ) ) ( not ( = ?auto_41337 ?auto_41341 ) ) ( not ( = ?auto_41337 ?auto_41342 ) ) ( not ( = ?auto_41337 ?auto_41343 ) ) ( not ( = ?auto_41337 ?auto_41344 ) ) ( not ( = ?auto_41337 ?auto_41345 ) ) ( not ( = ?auto_41338 ?auto_41339 ) ) ( not ( = ?auto_41338 ?auto_41340 ) ) ( not ( = ?auto_41338 ?auto_41341 ) ) ( not ( = ?auto_41338 ?auto_41342 ) ) ( not ( = ?auto_41338 ?auto_41343 ) ) ( not ( = ?auto_41338 ?auto_41344 ) ) ( not ( = ?auto_41338 ?auto_41345 ) ) ( not ( = ?auto_41339 ?auto_41340 ) ) ( not ( = ?auto_41339 ?auto_41341 ) ) ( not ( = ?auto_41339 ?auto_41342 ) ) ( not ( = ?auto_41339 ?auto_41343 ) ) ( not ( = ?auto_41339 ?auto_41344 ) ) ( not ( = ?auto_41339 ?auto_41345 ) ) ( not ( = ?auto_41340 ?auto_41341 ) ) ( not ( = ?auto_41340 ?auto_41342 ) ) ( not ( = ?auto_41340 ?auto_41343 ) ) ( not ( = ?auto_41340 ?auto_41344 ) ) ( not ( = ?auto_41340 ?auto_41345 ) ) ( not ( = ?auto_41341 ?auto_41342 ) ) ( not ( = ?auto_41341 ?auto_41343 ) ) ( not ( = ?auto_41341 ?auto_41344 ) ) ( not ( = ?auto_41341 ?auto_41345 ) ) ( not ( = ?auto_41342 ?auto_41343 ) ) ( not ( = ?auto_41342 ?auto_41344 ) ) ( not ( = ?auto_41342 ?auto_41345 ) ) ( not ( = ?auto_41343 ?auto_41344 ) ) ( not ( = ?auto_41343 ?auto_41345 ) ) ( not ( = ?auto_41344 ?auto_41345 ) ) ( ON ?auto_41343 ?auto_41344 ) ( CLEAR ?auto_41341 ) ( ON ?auto_41342 ?auto_41343 ) ( CLEAR ?auto_41342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41337 ?auto_41338 ?auto_41339 ?auto_41340 ?auto_41341 ?auto_41342 )
      ( MAKE-8PILE ?auto_41337 ?auto_41338 ?auto_41339 ?auto_41340 ?auto_41341 ?auto_41342 ?auto_41343 ?auto_41344 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41354 - BLOCK
      ?auto_41355 - BLOCK
      ?auto_41356 - BLOCK
      ?auto_41357 - BLOCK
      ?auto_41358 - BLOCK
      ?auto_41359 - BLOCK
      ?auto_41360 - BLOCK
      ?auto_41361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41361 ) ( ON-TABLE ?auto_41354 ) ( ON ?auto_41355 ?auto_41354 ) ( ON ?auto_41356 ?auto_41355 ) ( ON ?auto_41357 ?auto_41356 ) ( ON ?auto_41358 ?auto_41357 ) ( not ( = ?auto_41354 ?auto_41355 ) ) ( not ( = ?auto_41354 ?auto_41356 ) ) ( not ( = ?auto_41354 ?auto_41357 ) ) ( not ( = ?auto_41354 ?auto_41358 ) ) ( not ( = ?auto_41354 ?auto_41359 ) ) ( not ( = ?auto_41354 ?auto_41360 ) ) ( not ( = ?auto_41354 ?auto_41361 ) ) ( not ( = ?auto_41355 ?auto_41356 ) ) ( not ( = ?auto_41355 ?auto_41357 ) ) ( not ( = ?auto_41355 ?auto_41358 ) ) ( not ( = ?auto_41355 ?auto_41359 ) ) ( not ( = ?auto_41355 ?auto_41360 ) ) ( not ( = ?auto_41355 ?auto_41361 ) ) ( not ( = ?auto_41356 ?auto_41357 ) ) ( not ( = ?auto_41356 ?auto_41358 ) ) ( not ( = ?auto_41356 ?auto_41359 ) ) ( not ( = ?auto_41356 ?auto_41360 ) ) ( not ( = ?auto_41356 ?auto_41361 ) ) ( not ( = ?auto_41357 ?auto_41358 ) ) ( not ( = ?auto_41357 ?auto_41359 ) ) ( not ( = ?auto_41357 ?auto_41360 ) ) ( not ( = ?auto_41357 ?auto_41361 ) ) ( not ( = ?auto_41358 ?auto_41359 ) ) ( not ( = ?auto_41358 ?auto_41360 ) ) ( not ( = ?auto_41358 ?auto_41361 ) ) ( not ( = ?auto_41359 ?auto_41360 ) ) ( not ( = ?auto_41359 ?auto_41361 ) ) ( not ( = ?auto_41360 ?auto_41361 ) ) ( ON ?auto_41360 ?auto_41361 ) ( CLEAR ?auto_41358 ) ( ON ?auto_41359 ?auto_41360 ) ( CLEAR ?auto_41359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41354 ?auto_41355 ?auto_41356 ?auto_41357 ?auto_41358 ?auto_41359 )
      ( MAKE-8PILE ?auto_41354 ?auto_41355 ?auto_41356 ?auto_41357 ?auto_41358 ?auto_41359 ?auto_41360 ?auto_41361 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41370 - BLOCK
      ?auto_41371 - BLOCK
      ?auto_41372 - BLOCK
      ?auto_41373 - BLOCK
      ?auto_41374 - BLOCK
      ?auto_41375 - BLOCK
      ?auto_41376 - BLOCK
      ?auto_41377 - BLOCK
    )
    :vars
    (
      ?auto_41378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41377 ?auto_41378 ) ( ON-TABLE ?auto_41370 ) ( ON ?auto_41371 ?auto_41370 ) ( ON ?auto_41372 ?auto_41371 ) ( ON ?auto_41373 ?auto_41372 ) ( not ( = ?auto_41370 ?auto_41371 ) ) ( not ( = ?auto_41370 ?auto_41372 ) ) ( not ( = ?auto_41370 ?auto_41373 ) ) ( not ( = ?auto_41370 ?auto_41374 ) ) ( not ( = ?auto_41370 ?auto_41375 ) ) ( not ( = ?auto_41370 ?auto_41376 ) ) ( not ( = ?auto_41370 ?auto_41377 ) ) ( not ( = ?auto_41370 ?auto_41378 ) ) ( not ( = ?auto_41371 ?auto_41372 ) ) ( not ( = ?auto_41371 ?auto_41373 ) ) ( not ( = ?auto_41371 ?auto_41374 ) ) ( not ( = ?auto_41371 ?auto_41375 ) ) ( not ( = ?auto_41371 ?auto_41376 ) ) ( not ( = ?auto_41371 ?auto_41377 ) ) ( not ( = ?auto_41371 ?auto_41378 ) ) ( not ( = ?auto_41372 ?auto_41373 ) ) ( not ( = ?auto_41372 ?auto_41374 ) ) ( not ( = ?auto_41372 ?auto_41375 ) ) ( not ( = ?auto_41372 ?auto_41376 ) ) ( not ( = ?auto_41372 ?auto_41377 ) ) ( not ( = ?auto_41372 ?auto_41378 ) ) ( not ( = ?auto_41373 ?auto_41374 ) ) ( not ( = ?auto_41373 ?auto_41375 ) ) ( not ( = ?auto_41373 ?auto_41376 ) ) ( not ( = ?auto_41373 ?auto_41377 ) ) ( not ( = ?auto_41373 ?auto_41378 ) ) ( not ( = ?auto_41374 ?auto_41375 ) ) ( not ( = ?auto_41374 ?auto_41376 ) ) ( not ( = ?auto_41374 ?auto_41377 ) ) ( not ( = ?auto_41374 ?auto_41378 ) ) ( not ( = ?auto_41375 ?auto_41376 ) ) ( not ( = ?auto_41375 ?auto_41377 ) ) ( not ( = ?auto_41375 ?auto_41378 ) ) ( not ( = ?auto_41376 ?auto_41377 ) ) ( not ( = ?auto_41376 ?auto_41378 ) ) ( not ( = ?auto_41377 ?auto_41378 ) ) ( ON ?auto_41376 ?auto_41377 ) ( ON ?auto_41375 ?auto_41376 ) ( CLEAR ?auto_41373 ) ( ON ?auto_41374 ?auto_41375 ) ( CLEAR ?auto_41374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41370 ?auto_41371 ?auto_41372 ?auto_41373 ?auto_41374 )
      ( MAKE-8PILE ?auto_41370 ?auto_41371 ?auto_41372 ?auto_41373 ?auto_41374 ?auto_41375 ?auto_41376 ?auto_41377 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41387 - BLOCK
      ?auto_41388 - BLOCK
      ?auto_41389 - BLOCK
      ?auto_41390 - BLOCK
      ?auto_41391 - BLOCK
      ?auto_41392 - BLOCK
      ?auto_41393 - BLOCK
      ?auto_41394 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41394 ) ( ON-TABLE ?auto_41387 ) ( ON ?auto_41388 ?auto_41387 ) ( ON ?auto_41389 ?auto_41388 ) ( ON ?auto_41390 ?auto_41389 ) ( not ( = ?auto_41387 ?auto_41388 ) ) ( not ( = ?auto_41387 ?auto_41389 ) ) ( not ( = ?auto_41387 ?auto_41390 ) ) ( not ( = ?auto_41387 ?auto_41391 ) ) ( not ( = ?auto_41387 ?auto_41392 ) ) ( not ( = ?auto_41387 ?auto_41393 ) ) ( not ( = ?auto_41387 ?auto_41394 ) ) ( not ( = ?auto_41388 ?auto_41389 ) ) ( not ( = ?auto_41388 ?auto_41390 ) ) ( not ( = ?auto_41388 ?auto_41391 ) ) ( not ( = ?auto_41388 ?auto_41392 ) ) ( not ( = ?auto_41388 ?auto_41393 ) ) ( not ( = ?auto_41388 ?auto_41394 ) ) ( not ( = ?auto_41389 ?auto_41390 ) ) ( not ( = ?auto_41389 ?auto_41391 ) ) ( not ( = ?auto_41389 ?auto_41392 ) ) ( not ( = ?auto_41389 ?auto_41393 ) ) ( not ( = ?auto_41389 ?auto_41394 ) ) ( not ( = ?auto_41390 ?auto_41391 ) ) ( not ( = ?auto_41390 ?auto_41392 ) ) ( not ( = ?auto_41390 ?auto_41393 ) ) ( not ( = ?auto_41390 ?auto_41394 ) ) ( not ( = ?auto_41391 ?auto_41392 ) ) ( not ( = ?auto_41391 ?auto_41393 ) ) ( not ( = ?auto_41391 ?auto_41394 ) ) ( not ( = ?auto_41392 ?auto_41393 ) ) ( not ( = ?auto_41392 ?auto_41394 ) ) ( not ( = ?auto_41393 ?auto_41394 ) ) ( ON ?auto_41393 ?auto_41394 ) ( ON ?auto_41392 ?auto_41393 ) ( CLEAR ?auto_41390 ) ( ON ?auto_41391 ?auto_41392 ) ( CLEAR ?auto_41391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41387 ?auto_41388 ?auto_41389 ?auto_41390 ?auto_41391 )
      ( MAKE-8PILE ?auto_41387 ?auto_41388 ?auto_41389 ?auto_41390 ?auto_41391 ?auto_41392 ?auto_41393 ?auto_41394 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41403 - BLOCK
      ?auto_41404 - BLOCK
      ?auto_41405 - BLOCK
      ?auto_41406 - BLOCK
      ?auto_41407 - BLOCK
      ?auto_41408 - BLOCK
      ?auto_41409 - BLOCK
      ?auto_41410 - BLOCK
    )
    :vars
    (
      ?auto_41411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41410 ?auto_41411 ) ( ON-TABLE ?auto_41403 ) ( ON ?auto_41404 ?auto_41403 ) ( ON ?auto_41405 ?auto_41404 ) ( not ( = ?auto_41403 ?auto_41404 ) ) ( not ( = ?auto_41403 ?auto_41405 ) ) ( not ( = ?auto_41403 ?auto_41406 ) ) ( not ( = ?auto_41403 ?auto_41407 ) ) ( not ( = ?auto_41403 ?auto_41408 ) ) ( not ( = ?auto_41403 ?auto_41409 ) ) ( not ( = ?auto_41403 ?auto_41410 ) ) ( not ( = ?auto_41403 ?auto_41411 ) ) ( not ( = ?auto_41404 ?auto_41405 ) ) ( not ( = ?auto_41404 ?auto_41406 ) ) ( not ( = ?auto_41404 ?auto_41407 ) ) ( not ( = ?auto_41404 ?auto_41408 ) ) ( not ( = ?auto_41404 ?auto_41409 ) ) ( not ( = ?auto_41404 ?auto_41410 ) ) ( not ( = ?auto_41404 ?auto_41411 ) ) ( not ( = ?auto_41405 ?auto_41406 ) ) ( not ( = ?auto_41405 ?auto_41407 ) ) ( not ( = ?auto_41405 ?auto_41408 ) ) ( not ( = ?auto_41405 ?auto_41409 ) ) ( not ( = ?auto_41405 ?auto_41410 ) ) ( not ( = ?auto_41405 ?auto_41411 ) ) ( not ( = ?auto_41406 ?auto_41407 ) ) ( not ( = ?auto_41406 ?auto_41408 ) ) ( not ( = ?auto_41406 ?auto_41409 ) ) ( not ( = ?auto_41406 ?auto_41410 ) ) ( not ( = ?auto_41406 ?auto_41411 ) ) ( not ( = ?auto_41407 ?auto_41408 ) ) ( not ( = ?auto_41407 ?auto_41409 ) ) ( not ( = ?auto_41407 ?auto_41410 ) ) ( not ( = ?auto_41407 ?auto_41411 ) ) ( not ( = ?auto_41408 ?auto_41409 ) ) ( not ( = ?auto_41408 ?auto_41410 ) ) ( not ( = ?auto_41408 ?auto_41411 ) ) ( not ( = ?auto_41409 ?auto_41410 ) ) ( not ( = ?auto_41409 ?auto_41411 ) ) ( not ( = ?auto_41410 ?auto_41411 ) ) ( ON ?auto_41409 ?auto_41410 ) ( ON ?auto_41408 ?auto_41409 ) ( ON ?auto_41407 ?auto_41408 ) ( CLEAR ?auto_41405 ) ( ON ?auto_41406 ?auto_41407 ) ( CLEAR ?auto_41406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41403 ?auto_41404 ?auto_41405 ?auto_41406 )
      ( MAKE-8PILE ?auto_41403 ?auto_41404 ?auto_41405 ?auto_41406 ?auto_41407 ?auto_41408 ?auto_41409 ?auto_41410 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41420 - BLOCK
      ?auto_41421 - BLOCK
      ?auto_41422 - BLOCK
      ?auto_41423 - BLOCK
      ?auto_41424 - BLOCK
      ?auto_41425 - BLOCK
      ?auto_41426 - BLOCK
      ?auto_41427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41427 ) ( ON-TABLE ?auto_41420 ) ( ON ?auto_41421 ?auto_41420 ) ( ON ?auto_41422 ?auto_41421 ) ( not ( = ?auto_41420 ?auto_41421 ) ) ( not ( = ?auto_41420 ?auto_41422 ) ) ( not ( = ?auto_41420 ?auto_41423 ) ) ( not ( = ?auto_41420 ?auto_41424 ) ) ( not ( = ?auto_41420 ?auto_41425 ) ) ( not ( = ?auto_41420 ?auto_41426 ) ) ( not ( = ?auto_41420 ?auto_41427 ) ) ( not ( = ?auto_41421 ?auto_41422 ) ) ( not ( = ?auto_41421 ?auto_41423 ) ) ( not ( = ?auto_41421 ?auto_41424 ) ) ( not ( = ?auto_41421 ?auto_41425 ) ) ( not ( = ?auto_41421 ?auto_41426 ) ) ( not ( = ?auto_41421 ?auto_41427 ) ) ( not ( = ?auto_41422 ?auto_41423 ) ) ( not ( = ?auto_41422 ?auto_41424 ) ) ( not ( = ?auto_41422 ?auto_41425 ) ) ( not ( = ?auto_41422 ?auto_41426 ) ) ( not ( = ?auto_41422 ?auto_41427 ) ) ( not ( = ?auto_41423 ?auto_41424 ) ) ( not ( = ?auto_41423 ?auto_41425 ) ) ( not ( = ?auto_41423 ?auto_41426 ) ) ( not ( = ?auto_41423 ?auto_41427 ) ) ( not ( = ?auto_41424 ?auto_41425 ) ) ( not ( = ?auto_41424 ?auto_41426 ) ) ( not ( = ?auto_41424 ?auto_41427 ) ) ( not ( = ?auto_41425 ?auto_41426 ) ) ( not ( = ?auto_41425 ?auto_41427 ) ) ( not ( = ?auto_41426 ?auto_41427 ) ) ( ON ?auto_41426 ?auto_41427 ) ( ON ?auto_41425 ?auto_41426 ) ( ON ?auto_41424 ?auto_41425 ) ( CLEAR ?auto_41422 ) ( ON ?auto_41423 ?auto_41424 ) ( CLEAR ?auto_41423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41420 ?auto_41421 ?auto_41422 ?auto_41423 )
      ( MAKE-8PILE ?auto_41420 ?auto_41421 ?auto_41422 ?auto_41423 ?auto_41424 ?auto_41425 ?auto_41426 ?auto_41427 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41436 - BLOCK
      ?auto_41437 - BLOCK
      ?auto_41438 - BLOCK
      ?auto_41439 - BLOCK
      ?auto_41440 - BLOCK
      ?auto_41441 - BLOCK
      ?auto_41442 - BLOCK
      ?auto_41443 - BLOCK
    )
    :vars
    (
      ?auto_41444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41443 ?auto_41444 ) ( ON-TABLE ?auto_41436 ) ( ON ?auto_41437 ?auto_41436 ) ( not ( = ?auto_41436 ?auto_41437 ) ) ( not ( = ?auto_41436 ?auto_41438 ) ) ( not ( = ?auto_41436 ?auto_41439 ) ) ( not ( = ?auto_41436 ?auto_41440 ) ) ( not ( = ?auto_41436 ?auto_41441 ) ) ( not ( = ?auto_41436 ?auto_41442 ) ) ( not ( = ?auto_41436 ?auto_41443 ) ) ( not ( = ?auto_41436 ?auto_41444 ) ) ( not ( = ?auto_41437 ?auto_41438 ) ) ( not ( = ?auto_41437 ?auto_41439 ) ) ( not ( = ?auto_41437 ?auto_41440 ) ) ( not ( = ?auto_41437 ?auto_41441 ) ) ( not ( = ?auto_41437 ?auto_41442 ) ) ( not ( = ?auto_41437 ?auto_41443 ) ) ( not ( = ?auto_41437 ?auto_41444 ) ) ( not ( = ?auto_41438 ?auto_41439 ) ) ( not ( = ?auto_41438 ?auto_41440 ) ) ( not ( = ?auto_41438 ?auto_41441 ) ) ( not ( = ?auto_41438 ?auto_41442 ) ) ( not ( = ?auto_41438 ?auto_41443 ) ) ( not ( = ?auto_41438 ?auto_41444 ) ) ( not ( = ?auto_41439 ?auto_41440 ) ) ( not ( = ?auto_41439 ?auto_41441 ) ) ( not ( = ?auto_41439 ?auto_41442 ) ) ( not ( = ?auto_41439 ?auto_41443 ) ) ( not ( = ?auto_41439 ?auto_41444 ) ) ( not ( = ?auto_41440 ?auto_41441 ) ) ( not ( = ?auto_41440 ?auto_41442 ) ) ( not ( = ?auto_41440 ?auto_41443 ) ) ( not ( = ?auto_41440 ?auto_41444 ) ) ( not ( = ?auto_41441 ?auto_41442 ) ) ( not ( = ?auto_41441 ?auto_41443 ) ) ( not ( = ?auto_41441 ?auto_41444 ) ) ( not ( = ?auto_41442 ?auto_41443 ) ) ( not ( = ?auto_41442 ?auto_41444 ) ) ( not ( = ?auto_41443 ?auto_41444 ) ) ( ON ?auto_41442 ?auto_41443 ) ( ON ?auto_41441 ?auto_41442 ) ( ON ?auto_41440 ?auto_41441 ) ( ON ?auto_41439 ?auto_41440 ) ( CLEAR ?auto_41437 ) ( ON ?auto_41438 ?auto_41439 ) ( CLEAR ?auto_41438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41436 ?auto_41437 ?auto_41438 )
      ( MAKE-8PILE ?auto_41436 ?auto_41437 ?auto_41438 ?auto_41439 ?auto_41440 ?auto_41441 ?auto_41442 ?auto_41443 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41453 - BLOCK
      ?auto_41454 - BLOCK
      ?auto_41455 - BLOCK
      ?auto_41456 - BLOCK
      ?auto_41457 - BLOCK
      ?auto_41458 - BLOCK
      ?auto_41459 - BLOCK
      ?auto_41460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41460 ) ( ON-TABLE ?auto_41453 ) ( ON ?auto_41454 ?auto_41453 ) ( not ( = ?auto_41453 ?auto_41454 ) ) ( not ( = ?auto_41453 ?auto_41455 ) ) ( not ( = ?auto_41453 ?auto_41456 ) ) ( not ( = ?auto_41453 ?auto_41457 ) ) ( not ( = ?auto_41453 ?auto_41458 ) ) ( not ( = ?auto_41453 ?auto_41459 ) ) ( not ( = ?auto_41453 ?auto_41460 ) ) ( not ( = ?auto_41454 ?auto_41455 ) ) ( not ( = ?auto_41454 ?auto_41456 ) ) ( not ( = ?auto_41454 ?auto_41457 ) ) ( not ( = ?auto_41454 ?auto_41458 ) ) ( not ( = ?auto_41454 ?auto_41459 ) ) ( not ( = ?auto_41454 ?auto_41460 ) ) ( not ( = ?auto_41455 ?auto_41456 ) ) ( not ( = ?auto_41455 ?auto_41457 ) ) ( not ( = ?auto_41455 ?auto_41458 ) ) ( not ( = ?auto_41455 ?auto_41459 ) ) ( not ( = ?auto_41455 ?auto_41460 ) ) ( not ( = ?auto_41456 ?auto_41457 ) ) ( not ( = ?auto_41456 ?auto_41458 ) ) ( not ( = ?auto_41456 ?auto_41459 ) ) ( not ( = ?auto_41456 ?auto_41460 ) ) ( not ( = ?auto_41457 ?auto_41458 ) ) ( not ( = ?auto_41457 ?auto_41459 ) ) ( not ( = ?auto_41457 ?auto_41460 ) ) ( not ( = ?auto_41458 ?auto_41459 ) ) ( not ( = ?auto_41458 ?auto_41460 ) ) ( not ( = ?auto_41459 ?auto_41460 ) ) ( ON ?auto_41459 ?auto_41460 ) ( ON ?auto_41458 ?auto_41459 ) ( ON ?auto_41457 ?auto_41458 ) ( ON ?auto_41456 ?auto_41457 ) ( CLEAR ?auto_41454 ) ( ON ?auto_41455 ?auto_41456 ) ( CLEAR ?auto_41455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41453 ?auto_41454 ?auto_41455 )
      ( MAKE-8PILE ?auto_41453 ?auto_41454 ?auto_41455 ?auto_41456 ?auto_41457 ?auto_41458 ?auto_41459 ?auto_41460 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41469 - BLOCK
      ?auto_41470 - BLOCK
      ?auto_41471 - BLOCK
      ?auto_41472 - BLOCK
      ?auto_41473 - BLOCK
      ?auto_41474 - BLOCK
      ?auto_41475 - BLOCK
      ?auto_41476 - BLOCK
    )
    :vars
    (
      ?auto_41477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41476 ?auto_41477 ) ( ON-TABLE ?auto_41469 ) ( not ( = ?auto_41469 ?auto_41470 ) ) ( not ( = ?auto_41469 ?auto_41471 ) ) ( not ( = ?auto_41469 ?auto_41472 ) ) ( not ( = ?auto_41469 ?auto_41473 ) ) ( not ( = ?auto_41469 ?auto_41474 ) ) ( not ( = ?auto_41469 ?auto_41475 ) ) ( not ( = ?auto_41469 ?auto_41476 ) ) ( not ( = ?auto_41469 ?auto_41477 ) ) ( not ( = ?auto_41470 ?auto_41471 ) ) ( not ( = ?auto_41470 ?auto_41472 ) ) ( not ( = ?auto_41470 ?auto_41473 ) ) ( not ( = ?auto_41470 ?auto_41474 ) ) ( not ( = ?auto_41470 ?auto_41475 ) ) ( not ( = ?auto_41470 ?auto_41476 ) ) ( not ( = ?auto_41470 ?auto_41477 ) ) ( not ( = ?auto_41471 ?auto_41472 ) ) ( not ( = ?auto_41471 ?auto_41473 ) ) ( not ( = ?auto_41471 ?auto_41474 ) ) ( not ( = ?auto_41471 ?auto_41475 ) ) ( not ( = ?auto_41471 ?auto_41476 ) ) ( not ( = ?auto_41471 ?auto_41477 ) ) ( not ( = ?auto_41472 ?auto_41473 ) ) ( not ( = ?auto_41472 ?auto_41474 ) ) ( not ( = ?auto_41472 ?auto_41475 ) ) ( not ( = ?auto_41472 ?auto_41476 ) ) ( not ( = ?auto_41472 ?auto_41477 ) ) ( not ( = ?auto_41473 ?auto_41474 ) ) ( not ( = ?auto_41473 ?auto_41475 ) ) ( not ( = ?auto_41473 ?auto_41476 ) ) ( not ( = ?auto_41473 ?auto_41477 ) ) ( not ( = ?auto_41474 ?auto_41475 ) ) ( not ( = ?auto_41474 ?auto_41476 ) ) ( not ( = ?auto_41474 ?auto_41477 ) ) ( not ( = ?auto_41475 ?auto_41476 ) ) ( not ( = ?auto_41475 ?auto_41477 ) ) ( not ( = ?auto_41476 ?auto_41477 ) ) ( ON ?auto_41475 ?auto_41476 ) ( ON ?auto_41474 ?auto_41475 ) ( ON ?auto_41473 ?auto_41474 ) ( ON ?auto_41472 ?auto_41473 ) ( ON ?auto_41471 ?auto_41472 ) ( CLEAR ?auto_41469 ) ( ON ?auto_41470 ?auto_41471 ) ( CLEAR ?auto_41470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41469 ?auto_41470 )
      ( MAKE-8PILE ?auto_41469 ?auto_41470 ?auto_41471 ?auto_41472 ?auto_41473 ?auto_41474 ?auto_41475 ?auto_41476 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41486 - BLOCK
      ?auto_41487 - BLOCK
      ?auto_41488 - BLOCK
      ?auto_41489 - BLOCK
      ?auto_41490 - BLOCK
      ?auto_41491 - BLOCK
      ?auto_41492 - BLOCK
      ?auto_41493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41493 ) ( ON-TABLE ?auto_41486 ) ( not ( = ?auto_41486 ?auto_41487 ) ) ( not ( = ?auto_41486 ?auto_41488 ) ) ( not ( = ?auto_41486 ?auto_41489 ) ) ( not ( = ?auto_41486 ?auto_41490 ) ) ( not ( = ?auto_41486 ?auto_41491 ) ) ( not ( = ?auto_41486 ?auto_41492 ) ) ( not ( = ?auto_41486 ?auto_41493 ) ) ( not ( = ?auto_41487 ?auto_41488 ) ) ( not ( = ?auto_41487 ?auto_41489 ) ) ( not ( = ?auto_41487 ?auto_41490 ) ) ( not ( = ?auto_41487 ?auto_41491 ) ) ( not ( = ?auto_41487 ?auto_41492 ) ) ( not ( = ?auto_41487 ?auto_41493 ) ) ( not ( = ?auto_41488 ?auto_41489 ) ) ( not ( = ?auto_41488 ?auto_41490 ) ) ( not ( = ?auto_41488 ?auto_41491 ) ) ( not ( = ?auto_41488 ?auto_41492 ) ) ( not ( = ?auto_41488 ?auto_41493 ) ) ( not ( = ?auto_41489 ?auto_41490 ) ) ( not ( = ?auto_41489 ?auto_41491 ) ) ( not ( = ?auto_41489 ?auto_41492 ) ) ( not ( = ?auto_41489 ?auto_41493 ) ) ( not ( = ?auto_41490 ?auto_41491 ) ) ( not ( = ?auto_41490 ?auto_41492 ) ) ( not ( = ?auto_41490 ?auto_41493 ) ) ( not ( = ?auto_41491 ?auto_41492 ) ) ( not ( = ?auto_41491 ?auto_41493 ) ) ( not ( = ?auto_41492 ?auto_41493 ) ) ( ON ?auto_41492 ?auto_41493 ) ( ON ?auto_41491 ?auto_41492 ) ( ON ?auto_41490 ?auto_41491 ) ( ON ?auto_41489 ?auto_41490 ) ( ON ?auto_41488 ?auto_41489 ) ( CLEAR ?auto_41486 ) ( ON ?auto_41487 ?auto_41488 ) ( CLEAR ?auto_41487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41486 ?auto_41487 )
      ( MAKE-8PILE ?auto_41486 ?auto_41487 ?auto_41488 ?auto_41489 ?auto_41490 ?auto_41491 ?auto_41492 ?auto_41493 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41502 - BLOCK
      ?auto_41503 - BLOCK
      ?auto_41504 - BLOCK
      ?auto_41505 - BLOCK
      ?auto_41506 - BLOCK
      ?auto_41507 - BLOCK
      ?auto_41508 - BLOCK
      ?auto_41509 - BLOCK
    )
    :vars
    (
      ?auto_41510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41509 ?auto_41510 ) ( not ( = ?auto_41502 ?auto_41503 ) ) ( not ( = ?auto_41502 ?auto_41504 ) ) ( not ( = ?auto_41502 ?auto_41505 ) ) ( not ( = ?auto_41502 ?auto_41506 ) ) ( not ( = ?auto_41502 ?auto_41507 ) ) ( not ( = ?auto_41502 ?auto_41508 ) ) ( not ( = ?auto_41502 ?auto_41509 ) ) ( not ( = ?auto_41502 ?auto_41510 ) ) ( not ( = ?auto_41503 ?auto_41504 ) ) ( not ( = ?auto_41503 ?auto_41505 ) ) ( not ( = ?auto_41503 ?auto_41506 ) ) ( not ( = ?auto_41503 ?auto_41507 ) ) ( not ( = ?auto_41503 ?auto_41508 ) ) ( not ( = ?auto_41503 ?auto_41509 ) ) ( not ( = ?auto_41503 ?auto_41510 ) ) ( not ( = ?auto_41504 ?auto_41505 ) ) ( not ( = ?auto_41504 ?auto_41506 ) ) ( not ( = ?auto_41504 ?auto_41507 ) ) ( not ( = ?auto_41504 ?auto_41508 ) ) ( not ( = ?auto_41504 ?auto_41509 ) ) ( not ( = ?auto_41504 ?auto_41510 ) ) ( not ( = ?auto_41505 ?auto_41506 ) ) ( not ( = ?auto_41505 ?auto_41507 ) ) ( not ( = ?auto_41505 ?auto_41508 ) ) ( not ( = ?auto_41505 ?auto_41509 ) ) ( not ( = ?auto_41505 ?auto_41510 ) ) ( not ( = ?auto_41506 ?auto_41507 ) ) ( not ( = ?auto_41506 ?auto_41508 ) ) ( not ( = ?auto_41506 ?auto_41509 ) ) ( not ( = ?auto_41506 ?auto_41510 ) ) ( not ( = ?auto_41507 ?auto_41508 ) ) ( not ( = ?auto_41507 ?auto_41509 ) ) ( not ( = ?auto_41507 ?auto_41510 ) ) ( not ( = ?auto_41508 ?auto_41509 ) ) ( not ( = ?auto_41508 ?auto_41510 ) ) ( not ( = ?auto_41509 ?auto_41510 ) ) ( ON ?auto_41508 ?auto_41509 ) ( ON ?auto_41507 ?auto_41508 ) ( ON ?auto_41506 ?auto_41507 ) ( ON ?auto_41505 ?auto_41506 ) ( ON ?auto_41504 ?auto_41505 ) ( ON ?auto_41503 ?auto_41504 ) ( ON ?auto_41502 ?auto_41503 ) ( CLEAR ?auto_41502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41502 )
      ( MAKE-8PILE ?auto_41502 ?auto_41503 ?auto_41504 ?auto_41505 ?auto_41506 ?auto_41507 ?auto_41508 ?auto_41509 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41519 - BLOCK
      ?auto_41520 - BLOCK
      ?auto_41521 - BLOCK
      ?auto_41522 - BLOCK
      ?auto_41523 - BLOCK
      ?auto_41524 - BLOCK
      ?auto_41525 - BLOCK
      ?auto_41526 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41526 ) ( not ( = ?auto_41519 ?auto_41520 ) ) ( not ( = ?auto_41519 ?auto_41521 ) ) ( not ( = ?auto_41519 ?auto_41522 ) ) ( not ( = ?auto_41519 ?auto_41523 ) ) ( not ( = ?auto_41519 ?auto_41524 ) ) ( not ( = ?auto_41519 ?auto_41525 ) ) ( not ( = ?auto_41519 ?auto_41526 ) ) ( not ( = ?auto_41520 ?auto_41521 ) ) ( not ( = ?auto_41520 ?auto_41522 ) ) ( not ( = ?auto_41520 ?auto_41523 ) ) ( not ( = ?auto_41520 ?auto_41524 ) ) ( not ( = ?auto_41520 ?auto_41525 ) ) ( not ( = ?auto_41520 ?auto_41526 ) ) ( not ( = ?auto_41521 ?auto_41522 ) ) ( not ( = ?auto_41521 ?auto_41523 ) ) ( not ( = ?auto_41521 ?auto_41524 ) ) ( not ( = ?auto_41521 ?auto_41525 ) ) ( not ( = ?auto_41521 ?auto_41526 ) ) ( not ( = ?auto_41522 ?auto_41523 ) ) ( not ( = ?auto_41522 ?auto_41524 ) ) ( not ( = ?auto_41522 ?auto_41525 ) ) ( not ( = ?auto_41522 ?auto_41526 ) ) ( not ( = ?auto_41523 ?auto_41524 ) ) ( not ( = ?auto_41523 ?auto_41525 ) ) ( not ( = ?auto_41523 ?auto_41526 ) ) ( not ( = ?auto_41524 ?auto_41525 ) ) ( not ( = ?auto_41524 ?auto_41526 ) ) ( not ( = ?auto_41525 ?auto_41526 ) ) ( ON ?auto_41525 ?auto_41526 ) ( ON ?auto_41524 ?auto_41525 ) ( ON ?auto_41523 ?auto_41524 ) ( ON ?auto_41522 ?auto_41523 ) ( ON ?auto_41521 ?auto_41522 ) ( ON ?auto_41520 ?auto_41521 ) ( ON ?auto_41519 ?auto_41520 ) ( CLEAR ?auto_41519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41519 )
      ( MAKE-8PILE ?auto_41519 ?auto_41520 ?auto_41521 ?auto_41522 ?auto_41523 ?auto_41524 ?auto_41525 ?auto_41526 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_41535 - BLOCK
      ?auto_41536 - BLOCK
      ?auto_41537 - BLOCK
      ?auto_41538 - BLOCK
      ?auto_41539 - BLOCK
      ?auto_41540 - BLOCK
      ?auto_41541 - BLOCK
      ?auto_41542 - BLOCK
    )
    :vars
    (
      ?auto_41543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41535 ?auto_41536 ) ) ( not ( = ?auto_41535 ?auto_41537 ) ) ( not ( = ?auto_41535 ?auto_41538 ) ) ( not ( = ?auto_41535 ?auto_41539 ) ) ( not ( = ?auto_41535 ?auto_41540 ) ) ( not ( = ?auto_41535 ?auto_41541 ) ) ( not ( = ?auto_41535 ?auto_41542 ) ) ( not ( = ?auto_41536 ?auto_41537 ) ) ( not ( = ?auto_41536 ?auto_41538 ) ) ( not ( = ?auto_41536 ?auto_41539 ) ) ( not ( = ?auto_41536 ?auto_41540 ) ) ( not ( = ?auto_41536 ?auto_41541 ) ) ( not ( = ?auto_41536 ?auto_41542 ) ) ( not ( = ?auto_41537 ?auto_41538 ) ) ( not ( = ?auto_41537 ?auto_41539 ) ) ( not ( = ?auto_41537 ?auto_41540 ) ) ( not ( = ?auto_41537 ?auto_41541 ) ) ( not ( = ?auto_41537 ?auto_41542 ) ) ( not ( = ?auto_41538 ?auto_41539 ) ) ( not ( = ?auto_41538 ?auto_41540 ) ) ( not ( = ?auto_41538 ?auto_41541 ) ) ( not ( = ?auto_41538 ?auto_41542 ) ) ( not ( = ?auto_41539 ?auto_41540 ) ) ( not ( = ?auto_41539 ?auto_41541 ) ) ( not ( = ?auto_41539 ?auto_41542 ) ) ( not ( = ?auto_41540 ?auto_41541 ) ) ( not ( = ?auto_41540 ?auto_41542 ) ) ( not ( = ?auto_41541 ?auto_41542 ) ) ( ON ?auto_41535 ?auto_41543 ) ( not ( = ?auto_41542 ?auto_41543 ) ) ( not ( = ?auto_41541 ?auto_41543 ) ) ( not ( = ?auto_41540 ?auto_41543 ) ) ( not ( = ?auto_41539 ?auto_41543 ) ) ( not ( = ?auto_41538 ?auto_41543 ) ) ( not ( = ?auto_41537 ?auto_41543 ) ) ( not ( = ?auto_41536 ?auto_41543 ) ) ( not ( = ?auto_41535 ?auto_41543 ) ) ( ON ?auto_41536 ?auto_41535 ) ( ON ?auto_41537 ?auto_41536 ) ( ON ?auto_41538 ?auto_41537 ) ( ON ?auto_41539 ?auto_41538 ) ( ON ?auto_41540 ?auto_41539 ) ( ON ?auto_41541 ?auto_41540 ) ( ON ?auto_41542 ?auto_41541 ) ( CLEAR ?auto_41542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_41542 ?auto_41541 ?auto_41540 ?auto_41539 ?auto_41538 ?auto_41537 ?auto_41536 ?auto_41535 )
      ( MAKE-8PILE ?auto_41535 ?auto_41536 ?auto_41537 ?auto_41538 ?auto_41539 ?auto_41540 ?auto_41541 ?auto_41542 ) )
  )

)

