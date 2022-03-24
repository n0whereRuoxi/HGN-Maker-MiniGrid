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
      ?auto_101758 - BLOCK
    )
    :vars
    (
      ?auto_101759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101758 ?auto_101759 ) ( CLEAR ?auto_101758 ) ( HAND-EMPTY ) ( not ( = ?auto_101758 ?auto_101759 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101758 ?auto_101759 )
      ( !PUTDOWN ?auto_101758 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101765 - BLOCK
      ?auto_101766 - BLOCK
    )
    :vars
    (
      ?auto_101767 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101765 ) ( ON ?auto_101766 ?auto_101767 ) ( CLEAR ?auto_101766 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101765 ) ( not ( = ?auto_101765 ?auto_101766 ) ) ( not ( = ?auto_101765 ?auto_101767 ) ) ( not ( = ?auto_101766 ?auto_101767 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101766 ?auto_101767 )
      ( !STACK ?auto_101766 ?auto_101765 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101775 - BLOCK
      ?auto_101776 - BLOCK
    )
    :vars
    (
      ?auto_101777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101776 ?auto_101777 ) ( not ( = ?auto_101775 ?auto_101776 ) ) ( not ( = ?auto_101775 ?auto_101777 ) ) ( not ( = ?auto_101776 ?auto_101777 ) ) ( ON ?auto_101775 ?auto_101776 ) ( CLEAR ?auto_101775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101775 )
      ( MAKE-2PILE ?auto_101775 ?auto_101776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101786 - BLOCK
      ?auto_101787 - BLOCK
      ?auto_101788 - BLOCK
    )
    :vars
    (
      ?auto_101789 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101787 ) ( ON ?auto_101788 ?auto_101789 ) ( CLEAR ?auto_101788 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101786 ) ( ON ?auto_101787 ?auto_101786 ) ( not ( = ?auto_101786 ?auto_101787 ) ) ( not ( = ?auto_101786 ?auto_101788 ) ) ( not ( = ?auto_101786 ?auto_101789 ) ) ( not ( = ?auto_101787 ?auto_101788 ) ) ( not ( = ?auto_101787 ?auto_101789 ) ) ( not ( = ?auto_101788 ?auto_101789 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101788 ?auto_101789 )
      ( !STACK ?auto_101788 ?auto_101787 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101800 - BLOCK
      ?auto_101801 - BLOCK
      ?auto_101802 - BLOCK
    )
    :vars
    (
      ?auto_101803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101802 ?auto_101803 ) ( ON-TABLE ?auto_101800 ) ( not ( = ?auto_101800 ?auto_101801 ) ) ( not ( = ?auto_101800 ?auto_101802 ) ) ( not ( = ?auto_101800 ?auto_101803 ) ) ( not ( = ?auto_101801 ?auto_101802 ) ) ( not ( = ?auto_101801 ?auto_101803 ) ) ( not ( = ?auto_101802 ?auto_101803 ) ) ( CLEAR ?auto_101800 ) ( ON ?auto_101801 ?auto_101802 ) ( CLEAR ?auto_101801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101800 ?auto_101801 )
      ( MAKE-3PILE ?auto_101800 ?auto_101801 ?auto_101802 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101814 - BLOCK
      ?auto_101815 - BLOCK
      ?auto_101816 - BLOCK
    )
    :vars
    (
      ?auto_101817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101816 ?auto_101817 ) ( not ( = ?auto_101814 ?auto_101815 ) ) ( not ( = ?auto_101814 ?auto_101816 ) ) ( not ( = ?auto_101814 ?auto_101817 ) ) ( not ( = ?auto_101815 ?auto_101816 ) ) ( not ( = ?auto_101815 ?auto_101817 ) ) ( not ( = ?auto_101816 ?auto_101817 ) ) ( ON ?auto_101815 ?auto_101816 ) ( ON ?auto_101814 ?auto_101815 ) ( CLEAR ?auto_101814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101814 )
      ( MAKE-3PILE ?auto_101814 ?auto_101815 ?auto_101816 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101829 - BLOCK
      ?auto_101830 - BLOCK
      ?auto_101831 - BLOCK
      ?auto_101832 - BLOCK
    )
    :vars
    (
      ?auto_101833 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101831 ) ( ON ?auto_101832 ?auto_101833 ) ( CLEAR ?auto_101832 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101829 ) ( ON ?auto_101830 ?auto_101829 ) ( ON ?auto_101831 ?auto_101830 ) ( not ( = ?auto_101829 ?auto_101830 ) ) ( not ( = ?auto_101829 ?auto_101831 ) ) ( not ( = ?auto_101829 ?auto_101832 ) ) ( not ( = ?auto_101829 ?auto_101833 ) ) ( not ( = ?auto_101830 ?auto_101831 ) ) ( not ( = ?auto_101830 ?auto_101832 ) ) ( not ( = ?auto_101830 ?auto_101833 ) ) ( not ( = ?auto_101831 ?auto_101832 ) ) ( not ( = ?auto_101831 ?auto_101833 ) ) ( not ( = ?auto_101832 ?auto_101833 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101832 ?auto_101833 )
      ( !STACK ?auto_101832 ?auto_101831 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101847 - BLOCK
      ?auto_101848 - BLOCK
      ?auto_101849 - BLOCK
      ?auto_101850 - BLOCK
    )
    :vars
    (
      ?auto_101851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101850 ?auto_101851 ) ( ON-TABLE ?auto_101847 ) ( ON ?auto_101848 ?auto_101847 ) ( not ( = ?auto_101847 ?auto_101848 ) ) ( not ( = ?auto_101847 ?auto_101849 ) ) ( not ( = ?auto_101847 ?auto_101850 ) ) ( not ( = ?auto_101847 ?auto_101851 ) ) ( not ( = ?auto_101848 ?auto_101849 ) ) ( not ( = ?auto_101848 ?auto_101850 ) ) ( not ( = ?auto_101848 ?auto_101851 ) ) ( not ( = ?auto_101849 ?auto_101850 ) ) ( not ( = ?auto_101849 ?auto_101851 ) ) ( not ( = ?auto_101850 ?auto_101851 ) ) ( CLEAR ?auto_101848 ) ( ON ?auto_101849 ?auto_101850 ) ( CLEAR ?auto_101849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101847 ?auto_101848 ?auto_101849 )
      ( MAKE-4PILE ?auto_101847 ?auto_101848 ?auto_101849 ?auto_101850 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101865 - BLOCK
      ?auto_101866 - BLOCK
      ?auto_101867 - BLOCK
      ?auto_101868 - BLOCK
    )
    :vars
    (
      ?auto_101869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101868 ?auto_101869 ) ( ON-TABLE ?auto_101865 ) ( not ( = ?auto_101865 ?auto_101866 ) ) ( not ( = ?auto_101865 ?auto_101867 ) ) ( not ( = ?auto_101865 ?auto_101868 ) ) ( not ( = ?auto_101865 ?auto_101869 ) ) ( not ( = ?auto_101866 ?auto_101867 ) ) ( not ( = ?auto_101866 ?auto_101868 ) ) ( not ( = ?auto_101866 ?auto_101869 ) ) ( not ( = ?auto_101867 ?auto_101868 ) ) ( not ( = ?auto_101867 ?auto_101869 ) ) ( not ( = ?auto_101868 ?auto_101869 ) ) ( ON ?auto_101867 ?auto_101868 ) ( CLEAR ?auto_101865 ) ( ON ?auto_101866 ?auto_101867 ) ( CLEAR ?auto_101866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101865 ?auto_101866 )
      ( MAKE-4PILE ?auto_101865 ?auto_101866 ?auto_101867 ?auto_101868 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101883 - BLOCK
      ?auto_101884 - BLOCK
      ?auto_101885 - BLOCK
      ?auto_101886 - BLOCK
    )
    :vars
    (
      ?auto_101887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101886 ?auto_101887 ) ( not ( = ?auto_101883 ?auto_101884 ) ) ( not ( = ?auto_101883 ?auto_101885 ) ) ( not ( = ?auto_101883 ?auto_101886 ) ) ( not ( = ?auto_101883 ?auto_101887 ) ) ( not ( = ?auto_101884 ?auto_101885 ) ) ( not ( = ?auto_101884 ?auto_101886 ) ) ( not ( = ?auto_101884 ?auto_101887 ) ) ( not ( = ?auto_101885 ?auto_101886 ) ) ( not ( = ?auto_101885 ?auto_101887 ) ) ( not ( = ?auto_101886 ?auto_101887 ) ) ( ON ?auto_101885 ?auto_101886 ) ( ON ?auto_101884 ?auto_101885 ) ( ON ?auto_101883 ?auto_101884 ) ( CLEAR ?auto_101883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101883 )
      ( MAKE-4PILE ?auto_101883 ?auto_101884 ?auto_101885 ?auto_101886 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101902 - BLOCK
      ?auto_101903 - BLOCK
      ?auto_101904 - BLOCK
      ?auto_101905 - BLOCK
      ?auto_101906 - BLOCK
    )
    :vars
    (
      ?auto_101907 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101905 ) ( ON ?auto_101906 ?auto_101907 ) ( CLEAR ?auto_101906 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101902 ) ( ON ?auto_101903 ?auto_101902 ) ( ON ?auto_101904 ?auto_101903 ) ( ON ?auto_101905 ?auto_101904 ) ( not ( = ?auto_101902 ?auto_101903 ) ) ( not ( = ?auto_101902 ?auto_101904 ) ) ( not ( = ?auto_101902 ?auto_101905 ) ) ( not ( = ?auto_101902 ?auto_101906 ) ) ( not ( = ?auto_101902 ?auto_101907 ) ) ( not ( = ?auto_101903 ?auto_101904 ) ) ( not ( = ?auto_101903 ?auto_101905 ) ) ( not ( = ?auto_101903 ?auto_101906 ) ) ( not ( = ?auto_101903 ?auto_101907 ) ) ( not ( = ?auto_101904 ?auto_101905 ) ) ( not ( = ?auto_101904 ?auto_101906 ) ) ( not ( = ?auto_101904 ?auto_101907 ) ) ( not ( = ?auto_101905 ?auto_101906 ) ) ( not ( = ?auto_101905 ?auto_101907 ) ) ( not ( = ?auto_101906 ?auto_101907 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101906 ?auto_101907 )
      ( !STACK ?auto_101906 ?auto_101905 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101924 - BLOCK
      ?auto_101925 - BLOCK
      ?auto_101926 - BLOCK
      ?auto_101927 - BLOCK
      ?auto_101928 - BLOCK
    )
    :vars
    (
      ?auto_101929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101928 ?auto_101929 ) ( ON-TABLE ?auto_101924 ) ( ON ?auto_101925 ?auto_101924 ) ( ON ?auto_101926 ?auto_101925 ) ( not ( = ?auto_101924 ?auto_101925 ) ) ( not ( = ?auto_101924 ?auto_101926 ) ) ( not ( = ?auto_101924 ?auto_101927 ) ) ( not ( = ?auto_101924 ?auto_101928 ) ) ( not ( = ?auto_101924 ?auto_101929 ) ) ( not ( = ?auto_101925 ?auto_101926 ) ) ( not ( = ?auto_101925 ?auto_101927 ) ) ( not ( = ?auto_101925 ?auto_101928 ) ) ( not ( = ?auto_101925 ?auto_101929 ) ) ( not ( = ?auto_101926 ?auto_101927 ) ) ( not ( = ?auto_101926 ?auto_101928 ) ) ( not ( = ?auto_101926 ?auto_101929 ) ) ( not ( = ?auto_101927 ?auto_101928 ) ) ( not ( = ?auto_101927 ?auto_101929 ) ) ( not ( = ?auto_101928 ?auto_101929 ) ) ( CLEAR ?auto_101926 ) ( ON ?auto_101927 ?auto_101928 ) ( CLEAR ?auto_101927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101924 ?auto_101925 ?auto_101926 ?auto_101927 )
      ( MAKE-5PILE ?auto_101924 ?auto_101925 ?auto_101926 ?auto_101927 ?auto_101928 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101946 - BLOCK
      ?auto_101947 - BLOCK
      ?auto_101948 - BLOCK
      ?auto_101949 - BLOCK
      ?auto_101950 - BLOCK
    )
    :vars
    (
      ?auto_101951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101950 ?auto_101951 ) ( ON-TABLE ?auto_101946 ) ( ON ?auto_101947 ?auto_101946 ) ( not ( = ?auto_101946 ?auto_101947 ) ) ( not ( = ?auto_101946 ?auto_101948 ) ) ( not ( = ?auto_101946 ?auto_101949 ) ) ( not ( = ?auto_101946 ?auto_101950 ) ) ( not ( = ?auto_101946 ?auto_101951 ) ) ( not ( = ?auto_101947 ?auto_101948 ) ) ( not ( = ?auto_101947 ?auto_101949 ) ) ( not ( = ?auto_101947 ?auto_101950 ) ) ( not ( = ?auto_101947 ?auto_101951 ) ) ( not ( = ?auto_101948 ?auto_101949 ) ) ( not ( = ?auto_101948 ?auto_101950 ) ) ( not ( = ?auto_101948 ?auto_101951 ) ) ( not ( = ?auto_101949 ?auto_101950 ) ) ( not ( = ?auto_101949 ?auto_101951 ) ) ( not ( = ?auto_101950 ?auto_101951 ) ) ( ON ?auto_101949 ?auto_101950 ) ( CLEAR ?auto_101947 ) ( ON ?auto_101948 ?auto_101949 ) ( CLEAR ?auto_101948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101946 ?auto_101947 ?auto_101948 )
      ( MAKE-5PILE ?auto_101946 ?auto_101947 ?auto_101948 ?auto_101949 ?auto_101950 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101968 - BLOCK
      ?auto_101969 - BLOCK
      ?auto_101970 - BLOCK
      ?auto_101971 - BLOCK
      ?auto_101972 - BLOCK
    )
    :vars
    (
      ?auto_101973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101972 ?auto_101973 ) ( ON-TABLE ?auto_101968 ) ( not ( = ?auto_101968 ?auto_101969 ) ) ( not ( = ?auto_101968 ?auto_101970 ) ) ( not ( = ?auto_101968 ?auto_101971 ) ) ( not ( = ?auto_101968 ?auto_101972 ) ) ( not ( = ?auto_101968 ?auto_101973 ) ) ( not ( = ?auto_101969 ?auto_101970 ) ) ( not ( = ?auto_101969 ?auto_101971 ) ) ( not ( = ?auto_101969 ?auto_101972 ) ) ( not ( = ?auto_101969 ?auto_101973 ) ) ( not ( = ?auto_101970 ?auto_101971 ) ) ( not ( = ?auto_101970 ?auto_101972 ) ) ( not ( = ?auto_101970 ?auto_101973 ) ) ( not ( = ?auto_101971 ?auto_101972 ) ) ( not ( = ?auto_101971 ?auto_101973 ) ) ( not ( = ?auto_101972 ?auto_101973 ) ) ( ON ?auto_101971 ?auto_101972 ) ( ON ?auto_101970 ?auto_101971 ) ( CLEAR ?auto_101968 ) ( ON ?auto_101969 ?auto_101970 ) ( CLEAR ?auto_101969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101968 ?auto_101969 )
      ( MAKE-5PILE ?auto_101968 ?auto_101969 ?auto_101970 ?auto_101971 ?auto_101972 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101990 - BLOCK
      ?auto_101991 - BLOCK
      ?auto_101992 - BLOCK
      ?auto_101993 - BLOCK
      ?auto_101994 - BLOCK
    )
    :vars
    (
      ?auto_101995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101994 ?auto_101995 ) ( not ( = ?auto_101990 ?auto_101991 ) ) ( not ( = ?auto_101990 ?auto_101992 ) ) ( not ( = ?auto_101990 ?auto_101993 ) ) ( not ( = ?auto_101990 ?auto_101994 ) ) ( not ( = ?auto_101990 ?auto_101995 ) ) ( not ( = ?auto_101991 ?auto_101992 ) ) ( not ( = ?auto_101991 ?auto_101993 ) ) ( not ( = ?auto_101991 ?auto_101994 ) ) ( not ( = ?auto_101991 ?auto_101995 ) ) ( not ( = ?auto_101992 ?auto_101993 ) ) ( not ( = ?auto_101992 ?auto_101994 ) ) ( not ( = ?auto_101992 ?auto_101995 ) ) ( not ( = ?auto_101993 ?auto_101994 ) ) ( not ( = ?auto_101993 ?auto_101995 ) ) ( not ( = ?auto_101994 ?auto_101995 ) ) ( ON ?auto_101993 ?auto_101994 ) ( ON ?auto_101992 ?auto_101993 ) ( ON ?auto_101991 ?auto_101992 ) ( ON ?auto_101990 ?auto_101991 ) ( CLEAR ?auto_101990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101990 )
      ( MAKE-5PILE ?auto_101990 ?auto_101991 ?auto_101992 ?auto_101993 ?auto_101994 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102013 - BLOCK
      ?auto_102014 - BLOCK
      ?auto_102015 - BLOCK
      ?auto_102016 - BLOCK
      ?auto_102017 - BLOCK
      ?auto_102018 - BLOCK
    )
    :vars
    (
      ?auto_102019 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_102017 ) ( ON ?auto_102018 ?auto_102019 ) ( CLEAR ?auto_102018 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102013 ) ( ON ?auto_102014 ?auto_102013 ) ( ON ?auto_102015 ?auto_102014 ) ( ON ?auto_102016 ?auto_102015 ) ( ON ?auto_102017 ?auto_102016 ) ( not ( = ?auto_102013 ?auto_102014 ) ) ( not ( = ?auto_102013 ?auto_102015 ) ) ( not ( = ?auto_102013 ?auto_102016 ) ) ( not ( = ?auto_102013 ?auto_102017 ) ) ( not ( = ?auto_102013 ?auto_102018 ) ) ( not ( = ?auto_102013 ?auto_102019 ) ) ( not ( = ?auto_102014 ?auto_102015 ) ) ( not ( = ?auto_102014 ?auto_102016 ) ) ( not ( = ?auto_102014 ?auto_102017 ) ) ( not ( = ?auto_102014 ?auto_102018 ) ) ( not ( = ?auto_102014 ?auto_102019 ) ) ( not ( = ?auto_102015 ?auto_102016 ) ) ( not ( = ?auto_102015 ?auto_102017 ) ) ( not ( = ?auto_102015 ?auto_102018 ) ) ( not ( = ?auto_102015 ?auto_102019 ) ) ( not ( = ?auto_102016 ?auto_102017 ) ) ( not ( = ?auto_102016 ?auto_102018 ) ) ( not ( = ?auto_102016 ?auto_102019 ) ) ( not ( = ?auto_102017 ?auto_102018 ) ) ( not ( = ?auto_102017 ?auto_102019 ) ) ( not ( = ?auto_102018 ?auto_102019 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102018 ?auto_102019 )
      ( !STACK ?auto_102018 ?auto_102017 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102039 - BLOCK
      ?auto_102040 - BLOCK
      ?auto_102041 - BLOCK
      ?auto_102042 - BLOCK
      ?auto_102043 - BLOCK
      ?auto_102044 - BLOCK
    )
    :vars
    (
      ?auto_102045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102044 ?auto_102045 ) ( ON-TABLE ?auto_102039 ) ( ON ?auto_102040 ?auto_102039 ) ( ON ?auto_102041 ?auto_102040 ) ( ON ?auto_102042 ?auto_102041 ) ( not ( = ?auto_102039 ?auto_102040 ) ) ( not ( = ?auto_102039 ?auto_102041 ) ) ( not ( = ?auto_102039 ?auto_102042 ) ) ( not ( = ?auto_102039 ?auto_102043 ) ) ( not ( = ?auto_102039 ?auto_102044 ) ) ( not ( = ?auto_102039 ?auto_102045 ) ) ( not ( = ?auto_102040 ?auto_102041 ) ) ( not ( = ?auto_102040 ?auto_102042 ) ) ( not ( = ?auto_102040 ?auto_102043 ) ) ( not ( = ?auto_102040 ?auto_102044 ) ) ( not ( = ?auto_102040 ?auto_102045 ) ) ( not ( = ?auto_102041 ?auto_102042 ) ) ( not ( = ?auto_102041 ?auto_102043 ) ) ( not ( = ?auto_102041 ?auto_102044 ) ) ( not ( = ?auto_102041 ?auto_102045 ) ) ( not ( = ?auto_102042 ?auto_102043 ) ) ( not ( = ?auto_102042 ?auto_102044 ) ) ( not ( = ?auto_102042 ?auto_102045 ) ) ( not ( = ?auto_102043 ?auto_102044 ) ) ( not ( = ?auto_102043 ?auto_102045 ) ) ( not ( = ?auto_102044 ?auto_102045 ) ) ( CLEAR ?auto_102042 ) ( ON ?auto_102043 ?auto_102044 ) ( CLEAR ?auto_102043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102039 ?auto_102040 ?auto_102041 ?auto_102042 ?auto_102043 )
      ( MAKE-6PILE ?auto_102039 ?auto_102040 ?auto_102041 ?auto_102042 ?auto_102043 ?auto_102044 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102065 - BLOCK
      ?auto_102066 - BLOCK
      ?auto_102067 - BLOCK
      ?auto_102068 - BLOCK
      ?auto_102069 - BLOCK
      ?auto_102070 - BLOCK
    )
    :vars
    (
      ?auto_102071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102070 ?auto_102071 ) ( ON-TABLE ?auto_102065 ) ( ON ?auto_102066 ?auto_102065 ) ( ON ?auto_102067 ?auto_102066 ) ( not ( = ?auto_102065 ?auto_102066 ) ) ( not ( = ?auto_102065 ?auto_102067 ) ) ( not ( = ?auto_102065 ?auto_102068 ) ) ( not ( = ?auto_102065 ?auto_102069 ) ) ( not ( = ?auto_102065 ?auto_102070 ) ) ( not ( = ?auto_102065 ?auto_102071 ) ) ( not ( = ?auto_102066 ?auto_102067 ) ) ( not ( = ?auto_102066 ?auto_102068 ) ) ( not ( = ?auto_102066 ?auto_102069 ) ) ( not ( = ?auto_102066 ?auto_102070 ) ) ( not ( = ?auto_102066 ?auto_102071 ) ) ( not ( = ?auto_102067 ?auto_102068 ) ) ( not ( = ?auto_102067 ?auto_102069 ) ) ( not ( = ?auto_102067 ?auto_102070 ) ) ( not ( = ?auto_102067 ?auto_102071 ) ) ( not ( = ?auto_102068 ?auto_102069 ) ) ( not ( = ?auto_102068 ?auto_102070 ) ) ( not ( = ?auto_102068 ?auto_102071 ) ) ( not ( = ?auto_102069 ?auto_102070 ) ) ( not ( = ?auto_102069 ?auto_102071 ) ) ( not ( = ?auto_102070 ?auto_102071 ) ) ( ON ?auto_102069 ?auto_102070 ) ( CLEAR ?auto_102067 ) ( ON ?auto_102068 ?auto_102069 ) ( CLEAR ?auto_102068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102065 ?auto_102066 ?auto_102067 ?auto_102068 )
      ( MAKE-6PILE ?auto_102065 ?auto_102066 ?auto_102067 ?auto_102068 ?auto_102069 ?auto_102070 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102091 - BLOCK
      ?auto_102092 - BLOCK
      ?auto_102093 - BLOCK
      ?auto_102094 - BLOCK
      ?auto_102095 - BLOCK
      ?auto_102096 - BLOCK
    )
    :vars
    (
      ?auto_102097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102096 ?auto_102097 ) ( ON-TABLE ?auto_102091 ) ( ON ?auto_102092 ?auto_102091 ) ( not ( = ?auto_102091 ?auto_102092 ) ) ( not ( = ?auto_102091 ?auto_102093 ) ) ( not ( = ?auto_102091 ?auto_102094 ) ) ( not ( = ?auto_102091 ?auto_102095 ) ) ( not ( = ?auto_102091 ?auto_102096 ) ) ( not ( = ?auto_102091 ?auto_102097 ) ) ( not ( = ?auto_102092 ?auto_102093 ) ) ( not ( = ?auto_102092 ?auto_102094 ) ) ( not ( = ?auto_102092 ?auto_102095 ) ) ( not ( = ?auto_102092 ?auto_102096 ) ) ( not ( = ?auto_102092 ?auto_102097 ) ) ( not ( = ?auto_102093 ?auto_102094 ) ) ( not ( = ?auto_102093 ?auto_102095 ) ) ( not ( = ?auto_102093 ?auto_102096 ) ) ( not ( = ?auto_102093 ?auto_102097 ) ) ( not ( = ?auto_102094 ?auto_102095 ) ) ( not ( = ?auto_102094 ?auto_102096 ) ) ( not ( = ?auto_102094 ?auto_102097 ) ) ( not ( = ?auto_102095 ?auto_102096 ) ) ( not ( = ?auto_102095 ?auto_102097 ) ) ( not ( = ?auto_102096 ?auto_102097 ) ) ( ON ?auto_102095 ?auto_102096 ) ( ON ?auto_102094 ?auto_102095 ) ( CLEAR ?auto_102092 ) ( ON ?auto_102093 ?auto_102094 ) ( CLEAR ?auto_102093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102091 ?auto_102092 ?auto_102093 )
      ( MAKE-6PILE ?auto_102091 ?auto_102092 ?auto_102093 ?auto_102094 ?auto_102095 ?auto_102096 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102117 - BLOCK
      ?auto_102118 - BLOCK
      ?auto_102119 - BLOCK
      ?auto_102120 - BLOCK
      ?auto_102121 - BLOCK
      ?auto_102122 - BLOCK
    )
    :vars
    (
      ?auto_102123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102122 ?auto_102123 ) ( ON-TABLE ?auto_102117 ) ( not ( = ?auto_102117 ?auto_102118 ) ) ( not ( = ?auto_102117 ?auto_102119 ) ) ( not ( = ?auto_102117 ?auto_102120 ) ) ( not ( = ?auto_102117 ?auto_102121 ) ) ( not ( = ?auto_102117 ?auto_102122 ) ) ( not ( = ?auto_102117 ?auto_102123 ) ) ( not ( = ?auto_102118 ?auto_102119 ) ) ( not ( = ?auto_102118 ?auto_102120 ) ) ( not ( = ?auto_102118 ?auto_102121 ) ) ( not ( = ?auto_102118 ?auto_102122 ) ) ( not ( = ?auto_102118 ?auto_102123 ) ) ( not ( = ?auto_102119 ?auto_102120 ) ) ( not ( = ?auto_102119 ?auto_102121 ) ) ( not ( = ?auto_102119 ?auto_102122 ) ) ( not ( = ?auto_102119 ?auto_102123 ) ) ( not ( = ?auto_102120 ?auto_102121 ) ) ( not ( = ?auto_102120 ?auto_102122 ) ) ( not ( = ?auto_102120 ?auto_102123 ) ) ( not ( = ?auto_102121 ?auto_102122 ) ) ( not ( = ?auto_102121 ?auto_102123 ) ) ( not ( = ?auto_102122 ?auto_102123 ) ) ( ON ?auto_102121 ?auto_102122 ) ( ON ?auto_102120 ?auto_102121 ) ( ON ?auto_102119 ?auto_102120 ) ( CLEAR ?auto_102117 ) ( ON ?auto_102118 ?auto_102119 ) ( CLEAR ?auto_102118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102117 ?auto_102118 )
      ( MAKE-6PILE ?auto_102117 ?auto_102118 ?auto_102119 ?auto_102120 ?auto_102121 ?auto_102122 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102143 - BLOCK
      ?auto_102144 - BLOCK
      ?auto_102145 - BLOCK
      ?auto_102146 - BLOCK
      ?auto_102147 - BLOCK
      ?auto_102148 - BLOCK
    )
    :vars
    (
      ?auto_102149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102148 ?auto_102149 ) ( not ( = ?auto_102143 ?auto_102144 ) ) ( not ( = ?auto_102143 ?auto_102145 ) ) ( not ( = ?auto_102143 ?auto_102146 ) ) ( not ( = ?auto_102143 ?auto_102147 ) ) ( not ( = ?auto_102143 ?auto_102148 ) ) ( not ( = ?auto_102143 ?auto_102149 ) ) ( not ( = ?auto_102144 ?auto_102145 ) ) ( not ( = ?auto_102144 ?auto_102146 ) ) ( not ( = ?auto_102144 ?auto_102147 ) ) ( not ( = ?auto_102144 ?auto_102148 ) ) ( not ( = ?auto_102144 ?auto_102149 ) ) ( not ( = ?auto_102145 ?auto_102146 ) ) ( not ( = ?auto_102145 ?auto_102147 ) ) ( not ( = ?auto_102145 ?auto_102148 ) ) ( not ( = ?auto_102145 ?auto_102149 ) ) ( not ( = ?auto_102146 ?auto_102147 ) ) ( not ( = ?auto_102146 ?auto_102148 ) ) ( not ( = ?auto_102146 ?auto_102149 ) ) ( not ( = ?auto_102147 ?auto_102148 ) ) ( not ( = ?auto_102147 ?auto_102149 ) ) ( not ( = ?auto_102148 ?auto_102149 ) ) ( ON ?auto_102147 ?auto_102148 ) ( ON ?auto_102146 ?auto_102147 ) ( ON ?auto_102145 ?auto_102146 ) ( ON ?auto_102144 ?auto_102145 ) ( ON ?auto_102143 ?auto_102144 ) ( CLEAR ?auto_102143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102143 )
      ( MAKE-6PILE ?auto_102143 ?auto_102144 ?auto_102145 ?auto_102146 ?auto_102147 ?auto_102148 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102170 - BLOCK
      ?auto_102171 - BLOCK
      ?auto_102172 - BLOCK
      ?auto_102173 - BLOCK
      ?auto_102174 - BLOCK
      ?auto_102175 - BLOCK
      ?auto_102176 - BLOCK
    )
    :vars
    (
      ?auto_102177 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_102175 ) ( ON ?auto_102176 ?auto_102177 ) ( CLEAR ?auto_102176 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102170 ) ( ON ?auto_102171 ?auto_102170 ) ( ON ?auto_102172 ?auto_102171 ) ( ON ?auto_102173 ?auto_102172 ) ( ON ?auto_102174 ?auto_102173 ) ( ON ?auto_102175 ?auto_102174 ) ( not ( = ?auto_102170 ?auto_102171 ) ) ( not ( = ?auto_102170 ?auto_102172 ) ) ( not ( = ?auto_102170 ?auto_102173 ) ) ( not ( = ?auto_102170 ?auto_102174 ) ) ( not ( = ?auto_102170 ?auto_102175 ) ) ( not ( = ?auto_102170 ?auto_102176 ) ) ( not ( = ?auto_102170 ?auto_102177 ) ) ( not ( = ?auto_102171 ?auto_102172 ) ) ( not ( = ?auto_102171 ?auto_102173 ) ) ( not ( = ?auto_102171 ?auto_102174 ) ) ( not ( = ?auto_102171 ?auto_102175 ) ) ( not ( = ?auto_102171 ?auto_102176 ) ) ( not ( = ?auto_102171 ?auto_102177 ) ) ( not ( = ?auto_102172 ?auto_102173 ) ) ( not ( = ?auto_102172 ?auto_102174 ) ) ( not ( = ?auto_102172 ?auto_102175 ) ) ( not ( = ?auto_102172 ?auto_102176 ) ) ( not ( = ?auto_102172 ?auto_102177 ) ) ( not ( = ?auto_102173 ?auto_102174 ) ) ( not ( = ?auto_102173 ?auto_102175 ) ) ( not ( = ?auto_102173 ?auto_102176 ) ) ( not ( = ?auto_102173 ?auto_102177 ) ) ( not ( = ?auto_102174 ?auto_102175 ) ) ( not ( = ?auto_102174 ?auto_102176 ) ) ( not ( = ?auto_102174 ?auto_102177 ) ) ( not ( = ?auto_102175 ?auto_102176 ) ) ( not ( = ?auto_102175 ?auto_102177 ) ) ( not ( = ?auto_102176 ?auto_102177 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102176 ?auto_102177 )
      ( !STACK ?auto_102176 ?auto_102175 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102200 - BLOCK
      ?auto_102201 - BLOCK
      ?auto_102202 - BLOCK
      ?auto_102203 - BLOCK
      ?auto_102204 - BLOCK
      ?auto_102205 - BLOCK
      ?auto_102206 - BLOCK
    )
    :vars
    (
      ?auto_102207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102206 ?auto_102207 ) ( ON-TABLE ?auto_102200 ) ( ON ?auto_102201 ?auto_102200 ) ( ON ?auto_102202 ?auto_102201 ) ( ON ?auto_102203 ?auto_102202 ) ( ON ?auto_102204 ?auto_102203 ) ( not ( = ?auto_102200 ?auto_102201 ) ) ( not ( = ?auto_102200 ?auto_102202 ) ) ( not ( = ?auto_102200 ?auto_102203 ) ) ( not ( = ?auto_102200 ?auto_102204 ) ) ( not ( = ?auto_102200 ?auto_102205 ) ) ( not ( = ?auto_102200 ?auto_102206 ) ) ( not ( = ?auto_102200 ?auto_102207 ) ) ( not ( = ?auto_102201 ?auto_102202 ) ) ( not ( = ?auto_102201 ?auto_102203 ) ) ( not ( = ?auto_102201 ?auto_102204 ) ) ( not ( = ?auto_102201 ?auto_102205 ) ) ( not ( = ?auto_102201 ?auto_102206 ) ) ( not ( = ?auto_102201 ?auto_102207 ) ) ( not ( = ?auto_102202 ?auto_102203 ) ) ( not ( = ?auto_102202 ?auto_102204 ) ) ( not ( = ?auto_102202 ?auto_102205 ) ) ( not ( = ?auto_102202 ?auto_102206 ) ) ( not ( = ?auto_102202 ?auto_102207 ) ) ( not ( = ?auto_102203 ?auto_102204 ) ) ( not ( = ?auto_102203 ?auto_102205 ) ) ( not ( = ?auto_102203 ?auto_102206 ) ) ( not ( = ?auto_102203 ?auto_102207 ) ) ( not ( = ?auto_102204 ?auto_102205 ) ) ( not ( = ?auto_102204 ?auto_102206 ) ) ( not ( = ?auto_102204 ?auto_102207 ) ) ( not ( = ?auto_102205 ?auto_102206 ) ) ( not ( = ?auto_102205 ?auto_102207 ) ) ( not ( = ?auto_102206 ?auto_102207 ) ) ( CLEAR ?auto_102204 ) ( ON ?auto_102205 ?auto_102206 ) ( CLEAR ?auto_102205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102200 ?auto_102201 ?auto_102202 ?auto_102203 ?auto_102204 ?auto_102205 )
      ( MAKE-7PILE ?auto_102200 ?auto_102201 ?auto_102202 ?auto_102203 ?auto_102204 ?auto_102205 ?auto_102206 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102230 - BLOCK
      ?auto_102231 - BLOCK
      ?auto_102232 - BLOCK
      ?auto_102233 - BLOCK
      ?auto_102234 - BLOCK
      ?auto_102235 - BLOCK
      ?auto_102236 - BLOCK
    )
    :vars
    (
      ?auto_102237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102236 ?auto_102237 ) ( ON-TABLE ?auto_102230 ) ( ON ?auto_102231 ?auto_102230 ) ( ON ?auto_102232 ?auto_102231 ) ( ON ?auto_102233 ?auto_102232 ) ( not ( = ?auto_102230 ?auto_102231 ) ) ( not ( = ?auto_102230 ?auto_102232 ) ) ( not ( = ?auto_102230 ?auto_102233 ) ) ( not ( = ?auto_102230 ?auto_102234 ) ) ( not ( = ?auto_102230 ?auto_102235 ) ) ( not ( = ?auto_102230 ?auto_102236 ) ) ( not ( = ?auto_102230 ?auto_102237 ) ) ( not ( = ?auto_102231 ?auto_102232 ) ) ( not ( = ?auto_102231 ?auto_102233 ) ) ( not ( = ?auto_102231 ?auto_102234 ) ) ( not ( = ?auto_102231 ?auto_102235 ) ) ( not ( = ?auto_102231 ?auto_102236 ) ) ( not ( = ?auto_102231 ?auto_102237 ) ) ( not ( = ?auto_102232 ?auto_102233 ) ) ( not ( = ?auto_102232 ?auto_102234 ) ) ( not ( = ?auto_102232 ?auto_102235 ) ) ( not ( = ?auto_102232 ?auto_102236 ) ) ( not ( = ?auto_102232 ?auto_102237 ) ) ( not ( = ?auto_102233 ?auto_102234 ) ) ( not ( = ?auto_102233 ?auto_102235 ) ) ( not ( = ?auto_102233 ?auto_102236 ) ) ( not ( = ?auto_102233 ?auto_102237 ) ) ( not ( = ?auto_102234 ?auto_102235 ) ) ( not ( = ?auto_102234 ?auto_102236 ) ) ( not ( = ?auto_102234 ?auto_102237 ) ) ( not ( = ?auto_102235 ?auto_102236 ) ) ( not ( = ?auto_102235 ?auto_102237 ) ) ( not ( = ?auto_102236 ?auto_102237 ) ) ( ON ?auto_102235 ?auto_102236 ) ( CLEAR ?auto_102233 ) ( ON ?auto_102234 ?auto_102235 ) ( CLEAR ?auto_102234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102230 ?auto_102231 ?auto_102232 ?auto_102233 ?auto_102234 )
      ( MAKE-7PILE ?auto_102230 ?auto_102231 ?auto_102232 ?auto_102233 ?auto_102234 ?auto_102235 ?auto_102236 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102260 - BLOCK
      ?auto_102261 - BLOCK
      ?auto_102262 - BLOCK
      ?auto_102263 - BLOCK
      ?auto_102264 - BLOCK
      ?auto_102265 - BLOCK
      ?auto_102266 - BLOCK
    )
    :vars
    (
      ?auto_102267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102266 ?auto_102267 ) ( ON-TABLE ?auto_102260 ) ( ON ?auto_102261 ?auto_102260 ) ( ON ?auto_102262 ?auto_102261 ) ( not ( = ?auto_102260 ?auto_102261 ) ) ( not ( = ?auto_102260 ?auto_102262 ) ) ( not ( = ?auto_102260 ?auto_102263 ) ) ( not ( = ?auto_102260 ?auto_102264 ) ) ( not ( = ?auto_102260 ?auto_102265 ) ) ( not ( = ?auto_102260 ?auto_102266 ) ) ( not ( = ?auto_102260 ?auto_102267 ) ) ( not ( = ?auto_102261 ?auto_102262 ) ) ( not ( = ?auto_102261 ?auto_102263 ) ) ( not ( = ?auto_102261 ?auto_102264 ) ) ( not ( = ?auto_102261 ?auto_102265 ) ) ( not ( = ?auto_102261 ?auto_102266 ) ) ( not ( = ?auto_102261 ?auto_102267 ) ) ( not ( = ?auto_102262 ?auto_102263 ) ) ( not ( = ?auto_102262 ?auto_102264 ) ) ( not ( = ?auto_102262 ?auto_102265 ) ) ( not ( = ?auto_102262 ?auto_102266 ) ) ( not ( = ?auto_102262 ?auto_102267 ) ) ( not ( = ?auto_102263 ?auto_102264 ) ) ( not ( = ?auto_102263 ?auto_102265 ) ) ( not ( = ?auto_102263 ?auto_102266 ) ) ( not ( = ?auto_102263 ?auto_102267 ) ) ( not ( = ?auto_102264 ?auto_102265 ) ) ( not ( = ?auto_102264 ?auto_102266 ) ) ( not ( = ?auto_102264 ?auto_102267 ) ) ( not ( = ?auto_102265 ?auto_102266 ) ) ( not ( = ?auto_102265 ?auto_102267 ) ) ( not ( = ?auto_102266 ?auto_102267 ) ) ( ON ?auto_102265 ?auto_102266 ) ( ON ?auto_102264 ?auto_102265 ) ( CLEAR ?auto_102262 ) ( ON ?auto_102263 ?auto_102264 ) ( CLEAR ?auto_102263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102260 ?auto_102261 ?auto_102262 ?auto_102263 )
      ( MAKE-7PILE ?auto_102260 ?auto_102261 ?auto_102262 ?auto_102263 ?auto_102264 ?auto_102265 ?auto_102266 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102290 - BLOCK
      ?auto_102291 - BLOCK
      ?auto_102292 - BLOCK
      ?auto_102293 - BLOCK
      ?auto_102294 - BLOCK
      ?auto_102295 - BLOCK
      ?auto_102296 - BLOCK
    )
    :vars
    (
      ?auto_102297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102296 ?auto_102297 ) ( ON-TABLE ?auto_102290 ) ( ON ?auto_102291 ?auto_102290 ) ( not ( = ?auto_102290 ?auto_102291 ) ) ( not ( = ?auto_102290 ?auto_102292 ) ) ( not ( = ?auto_102290 ?auto_102293 ) ) ( not ( = ?auto_102290 ?auto_102294 ) ) ( not ( = ?auto_102290 ?auto_102295 ) ) ( not ( = ?auto_102290 ?auto_102296 ) ) ( not ( = ?auto_102290 ?auto_102297 ) ) ( not ( = ?auto_102291 ?auto_102292 ) ) ( not ( = ?auto_102291 ?auto_102293 ) ) ( not ( = ?auto_102291 ?auto_102294 ) ) ( not ( = ?auto_102291 ?auto_102295 ) ) ( not ( = ?auto_102291 ?auto_102296 ) ) ( not ( = ?auto_102291 ?auto_102297 ) ) ( not ( = ?auto_102292 ?auto_102293 ) ) ( not ( = ?auto_102292 ?auto_102294 ) ) ( not ( = ?auto_102292 ?auto_102295 ) ) ( not ( = ?auto_102292 ?auto_102296 ) ) ( not ( = ?auto_102292 ?auto_102297 ) ) ( not ( = ?auto_102293 ?auto_102294 ) ) ( not ( = ?auto_102293 ?auto_102295 ) ) ( not ( = ?auto_102293 ?auto_102296 ) ) ( not ( = ?auto_102293 ?auto_102297 ) ) ( not ( = ?auto_102294 ?auto_102295 ) ) ( not ( = ?auto_102294 ?auto_102296 ) ) ( not ( = ?auto_102294 ?auto_102297 ) ) ( not ( = ?auto_102295 ?auto_102296 ) ) ( not ( = ?auto_102295 ?auto_102297 ) ) ( not ( = ?auto_102296 ?auto_102297 ) ) ( ON ?auto_102295 ?auto_102296 ) ( ON ?auto_102294 ?auto_102295 ) ( ON ?auto_102293 ?auto_102294 ) ( CLEAR ?auto_102291 ) ( ON ?auto_102292 ?auto_102293 ) ( CLEAR ?auto_102292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102290 ?auto_102291 ?auto_102292 )
      ( MAKE-7PILE ?auto_102290 ?auto_102291 ?auto_102292 ?auto_102293 ?auto_102294 ?auto_102295 ?auto_102296 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102320 - BLOCK
      ?auto_102321 - BLOCK
      ?auto_102322 - BLOCK
      ?auto_102323 - BLOCK
      ?auto_102324 - BLOCK
      ?auto_102325 - BLOCK
      ?auto_102326 - BLOCK
    )
    :vars
    (
      ?auto_102327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102326 ?auto_102327 ) ( ON-TABLE ?auto_102320 ) ( not ( = ?auto_102320 ?auto_102321 ) ) ( not ( = ?auto_102320 ?auto_102322 ) ) ( not ( = ?auto_102320 ?auto_102323 ) ) ( not ( = ?auto_102320 ?auto_102324 ) ) ( not ( = ?auto_102320 ?auto_102325 ) ) ( not ( = ?auto_102320 ?auto_102326 ) ) ( not ( = ?auto_102320 ?auto_102327 ) ) ( not ( = ?auto_102321 ?auto_102322 ) ) ( not ( = ?auto_102321 ?auto_102323 ) ) ( not ( = ?auto_102321 ?auto_102324 ) ) ( not ( = ?auto_102321 ?auto_102325 ) ) ( not ( = ?auto_102321 ?auto_102326 ) ) ( not ( = ?auto_102321 ?auto_102327 ) ) ( not ( = ?auto_102322 ?auto_102323 ) ) ( not ( = ?auto_102322 ?auto_102324 ) ) ( not ( = ?auto_102322 ?auto_102325 ) ) ( not ( = ?auto_102322 ?auto_102326 ) ) ( not ( = ?auto_102322 ?auto_102327 ) ) ( not ( = ?auto_102323 ?auto_102324 ) ) ( not ( = ?auto_102323 ?auto_102325 ) ) ( not ( = ?auto_102323 ?auto_102326 ) ) ( not ( = ?auto_102323 ?auto_102327 ) ) ( not ( = ?auto_102324 ?auto_102325 ) ) ( not ( = ?auto_102324 ?auto_102326 ) ) ( not ( = ?auto_102324 ?auto_102327 ) ) ( not ( = ?auto_102325 ?auto_102326 ) ) ( not ( = ?auto_102325 ?auto_102327 ) ) ( not ( = ?auto_102326 ?auto_102327 ) ) ( ON ?auto_102325 ?auto_102326 ) ( ON ?auto_102324 ?auto_102325 ) ( ON ?auto_102323 ?auto_102324 ) ( ON ?auto_102322 ?auto_102323 ) ( CLEAR ?auto_102320 ) ( ON ?auto_102321 ?auto_102322 ) ( CLEAR ?auto_102321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102320 ?auto_102321 )
      ( MAKE-7PILE ?auto_102320 ?auto_102321 ?auto_102322 ?auto_102323 ?auto_102324 ?auto_102325 ?auto_102326 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102350 - BLOCK
      ?auto_102351 - BLOCK
      ?auto_102352 - BLOCK
      ?auto_102353 - BLOCK
      ?auto_102354 - BLOCK
      ?auto_102355 - BLOCK
      ?auto_102356 - BLOCK
    )
    :vars
    (
      ?auto_102357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102356 ?auto_102357 ) ( not ( = ?auto_102350 ?auto_102351 ) ) ( not ( = ?auto_102350 ?auto_102352 ) ) ( not ( = ?auto_102350 ?auto_102353 ) ) ( not ( = ?auto_102350 ?auto_102354 ) ) ( not ( = ?auto_102350 ?auto_102355 ) ) ( not ( = ?auto_102350 ?auto_102356 ) ) ( not ( = ?auto_102350 ?auto_102357 ) ) ( not ( = ?auto_102351 ?auto_102352 ) ) ( not ( = ?auto_102351 ?auto_102353 ) ) ( not ( = ?auto_102351 ?auto_102354 ) ) ( not ( = ?auto_102351 ?auto_102355 ) ) ( not ( = ?auto_102351 ?auto_102356 ) ) ( not ( = ?auto_102351 ?auto_102357 ) ) ( not ( = ?auto_102352 ?auto_102353 ) ) ( not ( = ?auto_102352 ?auto_102354 ) ) ( not ( = ?auto_102352 ?auto_102355 ) ) ( not ( = ?auto_102352 ?auto_102356 ) ) ( not ( = ?auto_102352 ?auto_102357 ) ) ( not ( = ?auto_102353 ?auto_102354 ) ) ( not ( = ?auto_102353 ?auto_102355 ) ) ( not ( = ?auto_102353 ?auto_102356 ) ) ( not ( = ?auto_102353 ?auto_102357 ) ) ( not ( = ?auto_102354 ?auto_102355 ) ) ( not ( = ?auto_102354 ?auto_102356 ) ) ( not ( = ?auto_102354 ?auto_102357 ) ) ( not ( = ?auto_102355 ?auto_102356 ) ) ( not ( = ?auto_102355 ?auto_102357 ) ) ( not ( = ?auto_102356 ?auto_102357 ) ) ( ON ?auto_102355 ?auto_102356 ) ( ON ?auto_102354 ?auto_102355 ) ( ON ?auto_102353 ?auto_102354 ) ( ON ?auto_102352 ?auto_102353 ) ( ON ?auto_102351 ?auto_102352 ) ( ON ?auto_102350 ?auto_102351 ) ( CLEAR ?auto_102350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102350 )
      ( MAKE-7PILE ?auto_102350 ?auto_102351 ?auto_102352 ?auto_102353 ?auto_102354 ?auto_102355 ?auto_102356 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_102381 - BLOCK
      ?auto_102382 - BLOCK
      ?auto_102383 - BLOCK
      ?auto_102384 - BLOCK
      ?auto_102385 - BLOCK
      ?auto_102386 - BLOCK
      ?auto_102387 - BLOCK
      ?auto_102388 - BLOCK
    )
    :vars
    (
      ?auto_102389 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_102387 ) ( ON ?auto_102388 ?auto_102389 ) ( CLEAR ?auto_102388 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102381 ) ( ON ?auto_102382 ?auto_102381 ) ( ON ?auto_102383 ?auto_102382 ) ( ON ?auto_102384 ?auto_102383 ) ( ON ?auto_102385 ?auto_102384 ) ( ON ?auto_102386 ?auto_102385 ) ( ON ?auto_102387 ?auto_102386 ) ( not ( = ?auto_102381 ?auto_102382 ) ) ( not ( = ?auto_102381 ?auto_102383 ) ) ( not ( = ?auto_102381 ?auto_102384 ) ) ( not ( = ?auto_102381 ?auto_102385 ) ) ( not ( = ?auto_102381 ?auto_102386 ) ) ( not ( = ?auto_102381 ?auto_102387 ) ) ( not ( = ?auto_102381 ?auto_102388 ) ) ( not ( = ?auto_102381 ?auto_102389 ) ) ( not ( = ?auto_102382 ?auto_102383 ) ) ( not ( = ?auto_102382 ?auto_102384 ) ) ( not ( = ?auto_102382 ?auto_102385 ) ) ( not ( = ?auto_102382 ?auto_102386 ) ) ( not ( = ?auto_102382 ?auto_102387 ) ) ( not ( = ?auto_102382 ?auto_102388 ) ) ( not ( = ?auto_102382 ?auto_102389 ) ) ( not ( = ?auto_102383 ?auto_102384 ) ) ( not ( = ?auto_102383 ?auto_102385 ) ) ( not ( = ?auto_102383 ?auto_102386 ) ) ( not ( = ?auto_102383 ?auto_102387 ) ) ( not ( = ?auto_102383 ?auto_102388 ) ) ( not ( = ?auto_102383 ?auto_102389 ) ) ( not ( = ?auto_102384 ?auto_102385 ) ) ( not ( = ?auto_102384 ?auto_102386 ) ) ( not ( = ?auto_102384 ?auto_102387 ) ) ( not ( = ?auto_102384 ?auto_102388 ) ) ( not ( = ?auto_102384 ?auto_102389 ) ) ( not ( = ?auto_102385 ?auto_102386 ) ) ( not ( = ?auto_102385 ?auto_102387 ) ) ( not ( = ?auto_102385 ?auto_102388 ) ) ( not ( = ?auto_102385 ?auto_102389 ) ) ( not ( = ?auto_102386 ?auto_102387 ) ) ( not ( = ?auto_102386 ?auto_102388 ) ) ( not ( = ?auto_102386 ?auto_102389 ) ) ( not ( = ?auto_102387 ?auto_102388 ) ) ( not ( = ?auto_102387 ?auto_102389 ) ) ( not ( = ?auto_102388 ?auto_102389 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102388 ?auto_102389 )
      ( !STACK ?auto_102388 ?auto_102387 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_102415 - BLOCK
      ?auto_102416 - BLOCK
      ?auto_102417 - BLOCK
      ?auto_102418 - BLOCK
      ?auto_102419 - BLOCK
      ?auto_102420 - BLOCK
      ?auto_102421 - BLOCK
      ?auto_102422 - BLOCK
    )
    :vars
    (
      ?auto_102423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102422 ?auto_102423 ) ( ON-TABLE ?auto_102415 ) ( ON ?auto_102416 ?auto_102415 ) ( ON ?auto_102417 ?auto_102416 ) ( ON ?auto_102418 ?auto_102417 ) ( ON ?auto_102419 ?auto_102418 ) ( ON ?auto_102420 ?auto_102419 ) ( not ( = ?auto_102415 ?auto_102416 ) ) ( not ( = ?auto_102415 ?auto_102417 ) ) ( not ( = ?auto_102415 ?auto_102418 ) ) ( not ( = ?auto_102415 ?auto_102419 ) ) ( not ( = ?auto_102415 ?auto_102420 ) ) ( not ( = ?auto_102415 ?auto_102421 ) ) ( not ( = ?auto_102415 ?auto_102422 ) ) ( not ( = ?auto_102415 ?auto_102423 ) ) ( not ( = ?auto_102416 ?auto_102417 ) ) ( not ( = ?auto_102416 ?auto_102418 ) ) ( not ( = ?auto_102416 ?auto_102419 ) ) ( not ( = ?auto_102416 ?auto_102420 ) ) ( not ( = ?auto_102416 ?auto_102421 ) ) ( not ( = ?auto_102416 ?auto_102422 ) ) ( not ( = ?auto_102416 ?auto_102423 ) ) ( not ( = ?auto_102417 ?auto_102418 ) ) ( not ( = ?auto_102417 ?auto_102419 ) ) ( not ( = ?auto_102417 ?auto_102420 ) ) ( not ( = ?auto_102417 ?auto_102421 ) ) ( not ( = ?auto_102417 ?auto_102422 ) ) ( not ( = ?auto_102417 ?auto_102423 ) ) ( not ( = ?auto_102418 ?auto_102419 ) ) ( not ( = ?auto_102418 ?auto_102420 ) ) ( not ( = ?auto_102418 ?auto_102421 ) ) ( not ( = ?auto_102418 ?auto_102422 ) ) ( not ( = ?auto_102418 ?auto_102423 ) ) ( not ( = ?auto_102419 ?auto_102420 ) ) ( not ( = ?auto_102419 ?auto_102421 ) ) ( not ( = ?auto_102419 ?auto_102422 ) ) ( not ( = ?auto_102419 ?auto_102423 ) ) ( not ( = ?auto_102420 ?auto_102421 ) ) ( not ( = ?auto_102420 ?auto_102422 ) ) ( not ( = ?auto_102420 ?auto_102423 ) ) ( not ( = ?auto_102421 ?auto_102422 ) ) ( not ( = ?auto_102421 ?auto_102423 ) ) ( not ( = ?auto_102422 ?auto_102423 ) ) ( CLEAR ?auto_102420 ) ( ON ?auto_102421 ?auto_102422 ) ( CLEAR ?auto_102421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102415 ?auto_102416 ?auto_102417 ?auto_102418 ?auto_102419 ?auto_102420 ?auto_102421 )
      ( MAKE-8PILE ?auto_102415 ?auto_102416 ?auto_102417 ?auto_102418 ?auto_102419 ?auto_102420 ?auto_102421 ?auto_102422 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_102449 - BLOCK
      ?auto_102450 - BLOCK
      ?auto_102451 - BLOCK
      ?auto_102452 - BLOCK
      ?auto_102453 - BLOCK
      ?auto_102454 - BLOCK
      ?auto_102455 - BLOCK
      ?auto_102456 - BLOCK
    )
    :vars
    (
      ?auto_102457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102456 ?auto_102457 ) ( ON-TABLE ?auto_102449 ) ( ON ?auto_102450 ?auto_102449 ) ( ON ?auto_102451 ?auto_102450 ) ( ON ?auto_102452 ?auto_102451 ) ( ON ?auto_102453 ?auto_102452 ) ( not ( = ?auto_102449 ?auto_102450 ) ) ( not ( = ?auto_102449 ?auto_102451 ) ) ( not ( = ?auto_102449 ?auto_102452 ) ) ( not ( = ?auto_102449 ?auto_102453 ) ) ( not ( = ?auto_102449 ?auto_102454 ) ) ( not ( = ?auto_102449 ?auto_102455 ) ) ( not ( = ?auto_102449 ?auto_102456 ) ) ( not ( = ?auto_102449 ?auto_102457 ) ) ( not ( = ?auto_102450 ?auto_102451 ) ) ( not ( = ?auto_102450 ?auto_102452 ) ) ( not ( = ?auto_102450 ?auto_102453 ) ) ( not ( = ?auto_102450 ?auto_102454 ) ) ( not ( = ?auto_102450 ?auto_102455 ) ) ( not ( = ?auto_102450 ?auto_102456 ) ) ( not ( = ?auto_102450 ?auto_102457 ) ) ( not ( = ?auto_102451 ?auto_102452 ) ) ( not ( = ?auto_102451 ?auto_102453 ) ) ( not ( = ?auto_102451 ?auto_102454 ) ) ( not ( = ?auto_102451 ?auto_102455 ) ) ( not ( = ?auto_102451 ?auto_102456 ) ) ( not ( = ?auto_102451 ?auto_102457 ) ) ( not ( = ?auto_102452 ?auto_102453 ) ) ( not ( = ?auto_102452 ?auto_102454 ) ) ( not ( = ?auto_102452 ?auto_102455 ) ) ( not ( = ?auto_102452 ?auto_102456 ) ) ( not ( = ?auto_102452 ?auto_102457 ) ) ( not ( = ?auto_102453 ?auto_102454 ) ) ( not ( = ?auto_102453 ?auto_102455 ) ) ( not ( = ?auto_102453 ?auto_102456 ) ) ( not ( = ?auto_102453 ?auto_102457 ) ) ( not ( = ?auto_102454 ?auto_102455 ) ) ( not ( = ?auto_102454 ?auto_102456 ) ) ( not ( = ?auto_102454 ?auto_102457 ) ) ( not ( = ?auto_102455 ?auto_102456 ) ) ( not ( = ?auto_102455 ?auto_102457 ) ) ( not ( = ?auto_102456 ?auto_102457 ) ) ( ON ?auto_102455 ?auto_102456 ) ( CLEAR ?auto_102453 ) ( ON ?auto_102454 ?auto_102455 ) ( CLEAR ?auto_102454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102449 ?auto_102450 ?auto_102451 ?auto_102452 ?auto_102453 ?auto_102454 )
      ( MAKE-8PILE ?auto_102449 ?auto_102450 ?auto_102451 ?auto_102452 ?auto_102453 ?auto_102454 ?auto_102455 ?auto_102456 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_102483 - BLOCK
      ?auto_102484 - BLOCK
      ?auto_102485 - BLOCK
      ?auto_102486 - BLOCK
      ?auto_102487 - BLOCK
      ?auto_102488 - BLOCK
      ?auto_102489 - BLOCK
      ?auto_102490 - BLOCK
    )
    :vars
    (
      ?auto_102491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102490 ?auto_102491 ) ( ON-TABLE ?auto_102483 ) ( ON ?auto_102484 ?auto_102483 ) ( ON ?auto_102485 ?auto_102484 ) ( ON ?auto_102486 ?auto_102485 ) ( not ( = ?auto_102483 ?auto_102484 ) ) ( not ( = ?auto_102483 ?auto_102485 ) ) ( not ( = ?auto_102483 ?auto_102486 ) ) ( not ( = ?auto_102483 ?auto_102487 ) ) ( not ( = ?auto_102483 ?auto_102488 ) ) ( not ( = ?auto_102483 ?auto_102489 ) ) ( not ( = ?auto_102483 ?auto_102490 ) ) ( not ( = ?auto_102483 ?auto_102491 ) ) ( not ( = ?auto_102484 ?auto_102485 ) ) ( not ( = ?auto_102484 ?auto_102486 ) ) ( not ( = ?auto_102484 ?auto_102487 ) ) ( not ( = ?auto_102484 ?auto_102488 ) ) ( not ( = ?auto_102484 ?auto_102489 ) ) ( not ( = ?auto_102484 ?auto_102490 ) ) ( not ( = ?auto_102484 ?auto_102491 ) ) ( not ( = ?auto_102485 ?auto_102486 ) ) ( not ( = ?auto_102485 ?auto_102487 ) ) ( not ( = ?auto_102485 ?auto_102488 ) ) ( not ( = ?auto_102485 ?auto_102489 ) ) ( not ( = ?auto_102485 ?auto_102490 ) ) ( not ( = ?auto_102485 ?auto_102491 ) ) ( not ( = ?auto_102486 ?auto_102487 ) ) ( not ( = ?auto_102486 ?auto_102488 ) ) ( not ( = ?auto_102486 ?auto_102489 ) ) ( not ( = ?auto_102486 ?auto_102490 ) ) ( not ( = ?auto_102486 ?auto_102491 ) ) ( not ( = ?auto_102487 ?auto_102488 ) ) ( not ( = ?auto_102487 ?auto_102489 ) ) ( not ( = ?auto_102487 ?auto_102490 ) ) ( not ( = ?auto_102487 ?auto_102491 ) ) ( not ( = ?auto_102488 ?auto_102489 ) ) ( not ( = ?auto_102488 ?auto_102490 ) ) ( not ( = ?auto_102488 ?auto_102491 ) ) ( not ( = ?auto_102489 ?auto_102490 ) ) ( not ( = ?auto_102489 ?auto_102491 ) ) ( not ( = ?auto_102490 ?auto_102491 ) ) ( ON ?auto_102489 ?auto_102490 ) ( ON ?auto_102488 ?auto_102489 ) ( CLEAR ?auto_102486 ) ( ON ?auto_102487 ?auto_102488 ) ( CLEAR ?auto_102487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102483 ?auto_102484 ?auto_102485 ?auto_102486 ?auto_102487 )
      ( MAKE-8PILE ?auto_102483 ?auto_102484 ?auto_102485 ?auto_102486 ?auto_102487 ?auto_102488 ?auto_102489 ?auto_102490 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_102517 - BLOCK
      ?auto_102518 - BLOCK
      ?auto_102519 - BLOCK
      ?auto_102520 - BLOCK
      ?auto_102521 - BLOCK
      ?auto_102522 - BLOCK
      ?auto_102523 - BLOCK
      ?auto_102524 - BLOCK
    )
    :vars
    (
      ?auto_102525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102524 ?auto_102525 ) ( ON-TABLE ?auto_102517 ) ( ON ?auto_102518 ?auto_102517 ) ( ON ?auto_102519 ?auto_102518 ) ( not ( = ?auto_102517 ?auto_102518 ) ) ( not ( = ?auto_102517 ?auto_102519 ) ) ( not ( = ?auto_102517 ?auto_102520 ) ) ( not ( = ?auto_102517 ?auto_102521 ) ) ( not ( = ?auto_102517 ?auto_102522 ) ) ( not ( = ?auto_102517 ?auto_102523 ) ) ( not ( = ?auto_102517 ?auto_102524 ) ) ( not ( = ?auto_102517 ?auto_102525 ) ) ( not ( = ?auto_102518 ?auto_102519 ) ) ( not ( = ?auto_102518 ?auto_102520 ) ) ( not ( = ?auto_102518 ?auto_102521 ) ) ( not ( = ?auto_102518 ?auto_102522 ) ) ( not ( = ?auto_102518 ?auto_102523 ) ) ( not ( = ?auto_102518 ?auto_102524 ) ) ( not ( = ?auto_102518 ?auto_102525 ) ) ( not ( = ?auto_102519 ?auto_102520 ) ) ( not ( = ?auto_102519 ?auto_102521 ) ) ( not ( = ?auto_102519 ?auto_102522 ) ) ( not ( = ?auto_102519 ?auto_102523 ) ) ( not ( = ?auto_102519 ?auto_102524 ) ) ( not ( = ?auto_102519 ?auto_102525 ) ) ( not ( = ?auto_102520 ?auto_102521 ) ) ( not ( = ?auto_102520 ?auto_102522 ) ) ( not ( = ?auto_102520 ?auto_102523 ) ) ( not ( = ?auto_102520 ?auto_102524 ) ) ( not ( = ?auto_102520 ?auto_102525 ) ) ( not ( = ?auto_102521 ?auto_102522 ) ) ( not ( = ?auto_102521 ?auto_102523 ) ) ( not ( = ?auto_102521 ?auto_102524 ) ) ( not ( = ?auto_102521 ?auto_102525 ) ) ( not ( = ?auto_102522 ?auto_102523 ) ) ( not ( = ?auto_102522 ?auto_102524 ) ) ( not ( = ?auto_102522 ?auto_102525 ) ) ( not ( = ?auto_102523 ?auto_102524 ) ) ( not ( = ?auto_102523 ?auto_102525 ) ) ( not ( = ?auto_102524 ?auto_102525 ) ) ( ON ?auto_102523 ?auto_102524 ) ( ON ?auto_102522 ?auto_102523 ) ( ON ?auto_102521 ?auto_102522 ) ( CLEAR ?auto_102519 ) ( ON ?auto_102520 ?auto_102521 ) ( CLEAR ?auto_102520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102517 ?auto_102518 ?auto_102519 ?auto_102520 )
      ( MAKE-8PILE ?auto_102517 ?auto_102518 ?auto_102519 ?auto_102520 ?auto_102521 ?auto_102522 ?auto_102523 ?auto_102524 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_102551 - BLOCK
      ?auto_102552 - BLOCK
      ?auto_102553 - BLOCK
      ?auto_102554 - BLOCK
      ?auto_102555 - BLOCK
      ?auto_102556 - BLOCK
      ?auto_102557 - BLOCK
      ?auto_102558 - BLOCK
    )
    :vars
    (
      ?auto_102559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102558 ?auto_102559 ) ( ON-TABLE ?auto_102551 ) ( ON ?auto_102552 ?auto_102551 ) ( not ( = ?auto_102551 ?auto_102552 ) ) ( not ( = ?auto_102551 ?auto_102553 ) ) ( not ( = ?auto_102551 ?auto_102554 ) ) ( not ( = ?auto_102551 ?auto_102555 ) ) ( not ( = ?auto_102551 ?auto_102556 ) ) ( not ( = ?auto_102551 ?auto_102557 ) ) ( not ( = ?auto_102551 ?auto_102558 ) ) ( not ( = ?auto_102551 ?auto_102559 ) ) ( not ( = ?auto_102552 ?auto_102553 ) ) ( not ( = ?auto_102552 ?auto_102554 ) ) ( not ( = ?auto_102552 ?auto_102555 ) ) ( not ( = ?auto_102552 ?auto_102556 ) ) ( not ( = ?auto_102552 ?auto_102557 ) ) ( not ( = ?auto_102552 ?auto_102558 ) ) ( not ( = ?auto_102552 ?auto_102559 ) ) ( not ( = ?auto_102553 ?auto_102554 ) ) ( not ( = ?auto_102553 ?auto_102555 ) ) ( not ( = ?auto_102553 ?auto_102556 ) ) ( not ( = ?auto_102553 ?auto_102557 ) ) ( not ( = ?auto_102553 ?auto_102558 ) ) ( not ( = ?auto_102553 ?auto_102559 ) ) ( not ( = ?auto_102554 ?auto_102555 ) ) ( not ( = ?auto_102554 ?auto_102556 ) ) ( not ( = ?auto_102554 ?auto_102557 ) ) ( not ( = ?auto_102554 ?auto_102558 ) ) ( not ( = ?auto_102554 ?auto_102559 ) ) ( not ( = ?auto_102555 ?auto_102556 ) ) ( not ( = ?auto_102555 ?auto_102557 ) ) ( not ( = ?auto_102555 ?auto_102558 ) ) ( not ( = ?auto_102555 ?auto_102559 ) ) ( not ( = ?auto_102556 ?auto_102557 ) ) ( not ( = ?auto_102556 ?auto_102558 ) ) ( not ( = ?auto_102556 ?auto_102559 ) ) ( not ( = ?auto_102557 ?auto_102558 ) ) ( not ( = ?auto_102557 ?auto_102559 ) ) ( not ( = ?auto_102558 ?auto_102559 ) ) ( ON ?auto_102557 ?auto_102558 ) ( ON ?auto_102556 ?auto_102557 ) ( ON ?auto_102555 ?auto_102556 ) ( ON ?auto_102554 ?auto_102555 ) ( CLEAR ?auto_102552 ) ( ON ?auto_102553 ?auto_102554 ) ( CLEAR ?auto_102553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102551 ?auto_102552 ?auto_102553 )
      ( MAKE-8PILE ?auto_102551 ?auto_102552 ?auto_102553 ?auto_102554 ?auto_102555 ?auto_102556 ?auto_102557 ?auto_102558 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_102585 - BLOCK
      ?auto_102586 - BLOCK
      ?auto_102587 - BLOCK
      ?auto_102588 - BLOCK
      ?auto_102589 - BLOCK
      ?auto_102590 - BLOCK
      ?auto_102591 - BLOCK
      ?auto_102592 - BLOCK
    )
    :vars
    (
      ?auto_102593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102592 ?auto_102593 ) ( ON-TABLE ?auto_102585 ) ( not ( = ?auto_102585 ?auto_102586 ) ) ( not ( = ?auto_102585 ?auto_102587 ) ) ( not ( = ?auto_102585 ?auto_102588 ) ) ( not ( = ?auto_102585 ?auto_102589 ) ) ( not ( = ?auto_102585 ?auto_102590 ) ) ( not ( = ?auto_102585 ?auto_102591 ) ) ( not ( = ?auto_102585 ?auto_102592 ) ) ( not ( = ?auto_102585 ?auto_102593 ) ) ( not ( = ?auto_102586 ?auto_102587 ) ) ( not ( = ?auto_102586 ?auto_102588 ) ) ( not ( = ?auto_102586 ?auto_102589 ) ) ( not ( = ?auto_102586 ?auto_102590 ) ) ( not ( = ?auto_102586 ?auto_102591 ) ) ( not ( = ?auto_102586 ?auto_102592 ) ) ( not ( = ?auto_102586 ?auto_102593 ) ) ( not ( = ?auto_102587 ?auto_102588 ) ) ( not ( = ?auto_102587 ?auto_102589 ) ) ( not ( = ?auto_102587 ?auto_102590 ) ) ( not ( = ?auto_102587 ?auto_102591 ) ) ( not ( = ?auto_102587 ?auto_102592 ) ) ( not ( = ?auto_102587 ?auto_102593 ) ) ( not ( = ?auto_102588 ?auto_102589 ) ) ( not ( = ?auto_102588 ?auto_102590 ) ) ( not ( = ?auto_102588 ?auto_102591 ) ) ( not ( = ?auto_102588 ?auto_102592 ) ) ( not ( = ?auto_102588 ?auto_102593 ) ) ( not ( = ?auto_102589 ?auto_102590 ) ) ( not ( = ?auto_102589 ?auto_102591 ) ) ( not ( = ?auto_102589 ?auto_102592 ) ) ( not ( = ?auto_102589 ?auto_102593 ) ) ( not ( = ?auto_102590 ?auto_102591 ) ) ( not ( = ?auto_102590 ?auto_102592 ) ) ( not ( = ?auto_102590 ?auto_102593 ) ) ( not ( = ?auto_102591 ?auto_102592 ) ) ( not ( = ?auto_102591 ?auto_102593 ) ) ( not ( = ?auto_102592 ?auto_102593 ) ) ( ON ?auto_102591 ?auto_102592 ) ( ON ?auto_102590 ?auto_102591 ) ( ON ?auto_102589 ?auto_102590 ) ( ON ?auto_102588 ?auto_102589 ) ( ON ?auto_102587 ?auto_102588 ) ( CLEAR ?auto_102585 ) ( ON ?auto_102586 ?auto_102587 ) ( CLEAR ?auto_102586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102585 ?auto_102586 )
      ( MAKE-8PILE ?auto_102585 ?auto_102586 ?auto_102587 ?auto_102588 ?auto_102589 ?auto_102590 ?auto_102591 ?auto_102592 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_102619 - BLOCK
      ?auto_102620 - BLOCK
      ?auto_102621 - BLOCK
      ?auto_102622 - BLOCK
      ?auto_102623 - BLOCK
      ?auto_102624 - BLOCK
      ?auto_102625 - BLOCK
      ?auto_102626 - BLOCK
    )
    :vars
    (
      ?auto_102627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102626 ?auto_102627 ) ( not ( = ?auto_102619 ?auto_102620 ) ) ( not ( = ?auto_102619 ?auto_102621 ) ) ( not ( = ?auto_102619 ?auto_102622 ) ) ( not ( = ?auto_102619 ?auto_102623 ) ) ( not ( = ?auto_102619 ?auto_102624 ) ) ( not ( = ?auto_102619 ?auto_102625 ) ) ( not ( = ?auto_102619 ?auto_102626 ) ) ( not ( = ?auto_102619 ?auto_102627 ) ) ( not ( = ?auto_102620 ?auto_102621 ) ) ( not ( = ?auto_102620 ?auto_102622 ) ) ( not ( = ?auto_102620 ?auto_102623 ) ) ( not ( = ?auto_102620 ?auto_102624 ) ) ( not ( = ?auto_102620 ?auto_102625 ) ) ( not ( = ?auto_102620 ?auto_102626 ) ) ( not ( = ?auto_102620 ?auto_102627 ) ) ( not ( = ?auto_102621 ?auto_102622 ) ) ( not ( = ?auto_102621 ?auto_102623 ) ) ( not ( = ?auto_102621 ?auto_102624 ) ) ( not ( = ?auto_102621 ?auto_102625 ) ) ( not ( = ?auto_102621 ?auto_102626 ) ) ( not ( = ?auto_102621 ?auto_102627 ) ) ( not ( = ?auto_102622 ?auto_102623 ) ) ( not ( = ?auto_102622 ?auto_102624 ) ) ( not ( = ?auto_102622 ?auto_102625 ) ) ( not ( = ?auto_102622 ?auto_102626 ) ) ( not ( = ?auto_102622 ?auto_102627 ) ) ( not ( = ?auto_102623 ?auto_102624 ) ) ( not ( = ?auto_102623 ?auto_102625 ) ) ( not ( = ?auto_102623 ?auto_102626 ) ) ( not ( = ?auto_102623 ?auto_102627 ) ) ( not ( = ?auto_102624 ?auto_102625 ) ) ( not ( = ?auto_102624 ?auto_102626 ) ) ( not ( = ?auto_102624 ?auto_102627 ) ) ( not ( = ?auto_102625 ?auto_102626 ) ) ( not ( = ?auto_102625 ?auto_102627 ) ) ( not ( = ?auto_102626 ?auto_102627 ) ) ( ON ?auto_102625 ?auto_102626 ) ( ON ?auto_102624 ?auto_102625 ) ( ON ?auto_102623 ?auto_102624 ) ( ON ?auto_102622 ?auto_102623 ) ( ON ?auto_102621 ?auto_102622 ) ( ON ?auto_102620 ?auto_102621 ) ( ON ?auto_102619 ?auto_102620 ) ( CLEAR ?auto_102619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102619 )
      ( MAKE-8PILE ?auto_102619 ?auto_102620 ?auto_102621 ?auto_102622 ?auto_102623 ?auto_102624 ?auto_102625 ?auto_102626 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_102654 - BLOCK
      ?auto_102655 - BLOCK
      ?auto_102656 - BLOCK
      ?auto_102657 - BLOCK
      ?auto_102658 - BLOCK
      ?auto_102659 - BLOCK
      ?auto_102660 - BLOCK
      ?auto_102661 - BLOCK
      ?auto_102662 - BLOCK
    )
    :vars
    (
      ?auto_102663 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_102661 ) ( ON ?auto_102662 ?auto_102663 ) ( CLEAR ?auto_102662 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102654 ) ( ON ?auto_102655 ?auto_102654 ) ( ON ?auto_102656 ?auto_102655 ) ( ON ?auto_102657 ?auto_102656 ) ( ON ?auto_102658 ?auto_102657 ) ( ON ?auto_102659 ?auto_102658 ) ( ON ?auto_102660 ?auto_102659 ) ( ON ?auto_102661 ?auto_102660 ) ( not ( = ?auto_102654 ?auto_102655 ) ) ( not ( = ?auto_102654 ?auto_102656 ) ) ( not ( = ?auto_102654 ?auto_102657 ) ) ( not ( = ?auto_102654 ?auto_102658 ) ) ( not ( = ?auto_102654 ?auto_102659 ) ) ( not ( = ?auto_102654 ?auto_102660 ) ) ( not ( = ?auto_102654 ?auto_102661 ) ) ( not ( = ?auto_102654 ?auto_102662 ) ) ( not ( = ?auto_102654 ?auto_102663 ) ) ( not ( = ?auto_102655 ?auto_102656 ) ) ( not ( = ?auto_102655 ?auto_102657 ) ) ( not ( = ?auto_102655 ?auto_102658 ) ) ( not ( = ?auto_102655 ?auto_102659 ) ) ( not ( = ?auto_102655 ?auto_102660 ) ) ( not ( = ?auto_102655 ?auto_102661 ) ) ( not ( = ?auto_102655 ?auto_102662 ) ) ( not ( = ?auto_102655 ?auto_102663 ) ) ( not ( = ?auto_102656 ?auto_102657 ) ) ( not ( = ?auto_102656 ?auto_102658 ) ) ( not ( = ?auto_102656 ?auto_102659 ) ) ( not ( = ?auto_102656 ?auto_102660 ) ) ( not ( = ?auto_102656 ?auto_102661 ) ) ( not ( = ?auto_102656 ?auto_102662 ) ) ( not ( = ?auto_102656 ?auto_102663 ) ) ( not ( = ?auto_102657 ?auto_102658 ) ) ( not ( = ?auto_102657 ?auto_102659 ) ) ( not ( = ?auto_102657 ?auto_102660 ) ) ( not ( = ?auto_102657 ?auto_102661 ) ) ( not ( = ?auto_102657 ?auto_102662 ) ) ( not ( = ?auto_102657 ?auto_102663 ) ) ( not ( = ?auto_102658 ?auto_102659 ) ) ( not ( = ?auto_102658 ?auto_102660 ) ) ( not ( = ?auto_102658 ?auto_102661 ) ) ( not ( = ?auto_102658 ?auto_102662 ) ) ( not ( = ?auto_102658 ?auto_102663 ) ) ( not ( = ?auto_102659 ?auto_102660 ) ) ( not ( = ?auto_102659 ?auto_102661 ) ) ( not ( = ?auto_102659 ?auto_102662 ) ) ( not ( = ?auto_102659 ?auto_102663 ) ) ( not ( = ?auto_102660 ?auto_102661 ) ) ( not ( = ?auto_102660 ?auto_102662 ) ) ( not ( = ?auto_102660 ?auto_102663 ) ) ( not ( = ?auto_102661 ?auto_102662 ) ) ( not ( = ?auto_102661 ?auto_102663 ) ) ( not ( = ?auto_102662 ?auto_102663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102662 ?auto_102663 )
      ( !STACK ?auto_102662 ?auto_102661 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_102692 - BLOCK
      ?auto_102693 - BLOCK
      ?auto_102694 - BLOCK
      ?auto_102695 - BLOCK
      ?auto_102696 - BLOCK
      ?auto_102697 - BLOCK
      ?auto_102698 - BLOCK
      ?auto_102699 - BLOCK
      ?auto_102700 - BLOCK
    )
    :vars
    (
      ?auto_102701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102700 ?auto_102701 ) ( ON-TABLE ?auto_102692 ) ( ON ?auto_102693 ?auto_102692 ) ( ON ?auto_102694 ?auto_102693 ) ( ON ?auto_102695 ?auto_102694 ) ( ON ?auto_102696 ?auto_102695 ) ( ON ?auto_102697 ?auto_102696 ) ( ON ?auto_102698 ?auto_102697 ) ( not ( = ?auto_102692 ?auto_102693 ) ) ( not ( = ?auto_102692 ?auto_102694 ) ) ( not ( = ?auto_102692 ?auto_102695 ) ) ( not ( = ?auto_102692 ?auto_102696 ) ) ( not ( = ?auto_102692 ?auto_102697 ) ) ( not ( = ?auto_102692 ?auto_102698 ) ) ( not ( = ?auto_102692 ?auto_102699 ) ) ( not ( = ?auto_102692 ?auto_102700 ) ) ( not ( = ?auto_102692 ?auto_102701 ) ) ( not ( = ?auto_102693 ?auto_102694 ) ) ( not ( = ?auto_102693 ?auto_102695 ) ) ( not ( = ?auto_102693 ?auto_102696 ) ) ( not ( = ?auto_102693 ?auto_102697 ) ) ( not ( = ?auto_102693 ?auto_102698 ) ) ( not ( = ?auto_102693 ?auto_102699 ) ) ( not ( = ?auto_102693 ?auto_102700 ) ) ( not ( = ?auto_102693 ?auto_102701 ) ) ( not ( = ?auto_102694 ?auto_102695 ) ) ( not ( = ?auto_102694 ?auto_102696 ) ) ( not ( = ?auto_102694 ?auto_102697 ) ) ( not ( = ?auto_102694 ?auto_102698 ) ) ( not ( = ?auto_102694 ?auto_102699 ) ) ( not ( = ?auto_102694 ?auto_102700 ) ) ( not ( = ?auto_102694 ?auto_102701 ) ) ( not ( = ?auto_102695 ?auto_102696 ) ) ( not ( = ?auto_102695 ?auto_102697 ) ) ( not ( = ?auto_102695 ?auto_102698 ) ) ( not ( = ?auto_102695 ?auto_102699 ) ) ( not ( = ?auto_102695 ?auto_102700 ) ) ( not ( = ?auto_102695 ?auto_102701 ) ) ( not ( = ?auto_102696 ?auto_102697 ) ) ( not ( = ?auto_102696 ?auto_102698 ) ) ( not ( = ?auto_102696 ?auto_102699 ) ) ( not ( = ?auto_102696 ?auto_102700 ) ) ( not ( = ?auto_102696 ?auto_102701 ) ) ( not ( = ?auto_102697 ?auto_102698 ) ) ( not ( = ?auto_102697 ?auto_102699 ) ) ( not ( = ?auto_102697 ?auto_102700 ) ) ( not ( = ?auto_102697 ?auto_102701 ) ) ( not ( = ?auto_102698 ?auto_102699 ) ) ( not ( = ?auto_102698 ?auto_102700 ) ) ( not ( = ?auto_102698 ?auto_102701 ) ) ( not ( = ?auto_102699 ?auto_102700 ) ) ( not ( = ?auto_102699 ?auto_102701 ) ) ( not ( = ?auto_102700 ?auto_102701 ) ) ( CLEAR ?auto_102698 ) ( ON ?auto_102699 ?auto_102700 ) ( CLEAR ?auto_102699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_102692 ?auto_102693 ?auto_102694 ?auto_102695 ?auto_102696 ?auto_102697 ?auto_102698 ?auto_102699 )
      ( MAKE-9PILE ?auto_102692 ?auto_102693 ?auto_102694 ?auto_102695 ?auto_102696 ?auto_102697 ?auto_102698 ?auto_102699 ?auto_102700 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_102730 - BLOCK
      ?auto_102731 - BLOCK
      ?auto_102732 - BLOCK
      ?auto_102733 - BLOCK
      ?auto_102734 - BLOCK
      ?auto_102735 - BLOCK
      ?auto_102736 - BLOCK
      ?auto_102737 - BLOCK
      ?auto_102738 - BLOCK
    )
    :vars
    (
      ?auto_102739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102738 ?auto_102739 ) ( ON-TABLE ?auto_102730 ) ( ON ?auto_102731 ?auto_102730 ) ( ON ?auto_102732 ?auto_102731 ) ( ON ?auto_102733 ?auto_102732 ) ( ON ?auto_102734 ?auto_102733 ) ( ON ?auto_102735 ?auto_102734 ) ( not ( = ?auto_102730 ?auto_102731 ) ) ( not ( = ?auto_102730 ?auto_102732 ) ) ( not ( = ?auto_102730 ?auto_102733 ) ) ( not ( = ?auto_102730 ?auto_102734 ) ) ( not ( = ?auto_102730 ?auto_102735 ) ) ( not ( = ?auto_102730 ?auto_102736 ) ) ( not ( = ?auto_102730 ?auto_102737 ) ) ( not ( = ?auto_102730 ?auto_102738 ) ) ( not ( = ?auto_102730 ?auto_102739 ) ) ( not ( = ?auto_102731 ?auto_102732 ) ) ( not ( = ?auto_102731 ?auto_102733 ) ) ( not ( = ?auto_102731 ?auto_102734 ) ) ( not ( = ?auto_102731 ?auto_102735 ) ) ( not ( = ?auto_102731 ?auto_102736 ) ) ( not ( = ?auto_102731 ?auto_102737 ) ) ( not ( = ?auto_102731 ?auto_102738 ) ) ( not ( = ?auto_102731 ?auto_102739 ) ) ( not ( = ?auto_102732 ?auto_102733 ) ) ( not ( = ?auto_102732 ?auto_102734 ) ) ( not ( = ?auto_102732 ?auto_102735 ) ) ( not ( = ?auto_102732 ?auto_102736 ) ) ( not ( = ?auto_102732 ?auto_102737 ) ) ( not ( = ?auto_102732 ?auto_102738 ) ) ( not ( = ?auto_102732 ?auto_102739 ) ) ( not ( = ?auto_102733 ?auto_102734 ) ) ( not ( = ?auto_102733 ?auto_102735 ) ) ( not ( = ?auto_102733 ?auto_102736 ) ) ( not ( = ?auto_102733 ?auto_102737 ) ) ( not ( = ?auto_102733 ?auto_102738 ) ) ( not ( = ?auto_102733 ?auto_102739 ) ) ( not ( = ?auto_102734 ?auto_102735 ) ) ( not ( = ?auto_102734 ?auto_102736 ) ) ( not ( = ?auto_102734 ?auto_102737 ) ) ( not ( = ?auto_102734 ?auto_102738 ) ) ( not ( = ?auto_102734 ?auto_102739 ) ) ( not ( = ?auto_102735 ?auto_102736 ) ) ( not ( = ?auto_102735 ?auto_102737 ) ) ( not ( = ?auto_102735 ?auto_102738 ) ) ( not ( = ?auto_102735 ?auto_102739 ) ) ( not ( = ?auto_102736 ?auto_102737 ) ) ( not ( = ?auto_102736 ?auto_102738 ) ) ( not ( = ?auto_102736 ?auto_102739 ) ) ( not ( = ?auto_102737 ?auto_102738 ) ) ( not ( = ?auto_102737 ?auto_102739 ) ) ( not ( = ?auto_102738 ?auto_102739 ) ) ( ON ?auto_102737 ?auto_102738 ) ( CLEAR ?auto_102735 ) ( ON ?auto_102736 ?auto_102737 ) ( CLEAR ?auto_102736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102730 ?auto_102731 ?auto_102732 ?auto_102733 ?auto_102734 ?auto_102735 ?auto_102736 )
      ( MAKE-9PILE ?auto_102730 ?auto_102731 ?auto_102732 ?auto_102733 ?auto_102734 ?auto_102735 ?auto_102736 ?auto_102737 ?auto_102738 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_102768 - BLOCK
      ?auto_102769 - BLOCK
      ?auto_102770 - BLOCK
      ?auto_102771 - BLOCK
      ?auto_102772 - BLOCK
      ?auto_102773 - BLOCK
      ?auto_102774 - BLOCK
      ?auto_102775 - BLOCK
      ?auto_102776 - BLOCK
    )
    :vars
    (
      ?auto_102777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102776 ?auto_102777 ) ( ON-TABLE ?auto_102768 ) ( ON ?auto_102769 ?auto_102768 ) ( ON ?auto_102770 ?auto_102769 ) ( ON ?auto_102771 ?auto_102770 ) ( ON ?auto_102772 ?auto_102771 ) ( not ( = ?auto_102768 ?auto_102769 ) ) ( not ( = ?auto_102768 ?auto_102770 ) ) ( not ( = ?auto_102768 ?auto_102771 ) ) ( not ( = ?auto_102768 ?auto_102772 ) ) ( not ( = ?auto_102768 ?auto_102773 ) ) ( not ( = ?auto_102768 ?auto_102774 ) ) ( not ( = ?auto_102768 ?auto_102775 ) ) ( not ( = ?auto_102768 ?auto_102776 ) ) ( not ( = ?auto_102768 ?auto_102777 ) ) ( not ( = ?auto_102769 ?auto_102770 ) ) ( not ( = ?auto_102769 ?auto_102771 ) ) ( not ( = ?auto_102769 ?auto_102772 ) ) ( not ( = ?auto_102769 ?auto_102773 ) ) ( not ( = ?auto_102769 ?auto_102774 ) ) ( not ( = ?auto_102769 ?auto_102775 ) ) ( not ( = ?auto_102769 ?auto_102776 ) ) ( not ( = ?auto_102769 ?auto_102777 ) ) ( not ( = ?auto_102770 ?auto_102771 ) ) ( not ( = ?auto_102770 ?auto_102772 ) ) ( not ( = ?auto_102770 ?auto_102773 ) ) ( not ( = ?auto_102770 ?auto_102774 ) ) ( not ( = ?auto_102770 ?auto_102775 ) ) ( not ( = ?auto_102770 ?auto_102776 ) ) ( not ( = ?auto_102770 ?auto_102777 ) ) ( not ( = ?auto_102771 ?auto_102772 ) ) ( not ( = ?auto_102771 ?auto_102773 ) ) ( not ( = ?auto_102771 ?auto_102774 ) ) ( not ( = ?auto_102771 ?auto_102775 ) ) ( not ( = ?auto_102771 ?auto_102776 ) ) ( not ( = ?auto_102771 ?auto_102777 ) ) ( not ( = ?auto_102772 ?auto_102773 ) ) ( not ( = ?auto_102772 ?auto_102774 ) ) ( not ( = ?auto_102772 ?auto_102775 ) ) ( not ( = ?auto_102772 ?auto_102776 ) ) ( not ( = ?auto_102772 ?auto_102777 ) ) ( not ( = ?auto_102773 ?auto_102774 ) ) ( not ( = ?auto_102773 ?auto_102775 ) ) ( not ( = ?auto_102773 ?auto_102776 ) ) ( not ( = ?auto_102773 ?auto_102777 ) ) ( not ( = ?auto_102774 ?auto_102775 ) ) ( not ( = ?auto_102774 ?auto_102776 ) ) ( not ( = ?auto_102774 ?auto_102777 ) ) ( not ( = ?auto_102775 ?auto_102776 ) ) ( not ( = ?auto_102775 ?auto_102777 ) ) ( not ( = ?auto_102776 ?auto_102777 ) ) ( ON ?auto_102775 ?auto_102776 ) ( ON ?auto_102774 ?auto_102775 ) ( CLEAR ?auto_102772 ) ( ON ?auto_102773 ?auto_102774 ) ( CLEAR ?auto_102773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102768 ?auto_102769 ?auto_102770 ?auto_102771 ?auto_102772 ?auto_102773 )
      ( MAKE-9PILE ?auto_102768 ?auto_102769 ?auto_102770 ?auto_102771 ?auto_102772 ?auto_102773 ?auto_102774 ?auto_102775 ?auto_102776 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_102806 - BLOCK
      ?auto_102807 - BLOCK
      ?auto_102808 - BLOCK
      ?auto_102809 - BLOCK
      ?auto_102810 - BLOCK
      ?auto_102811 - BLOCK
      ?auto_102812 - BLOCK
      ?auto_102813 - BLOCK
      ?auto_102814 - BLOCK
    )
    :vars
    (
      ?auto_102815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102814 ?auto_102815 ) ( ON-TABLE ?auto_102806 ) ( ON ?auto_102807 ?auto_102806 ) ( ON ?auto_102808 ?auto_102807 ) ( ON ?auto_102809 ?auto_102808 ) ( not ( = ?auto_102806 ?auto_102807 ) ) ( not ( = ?auto_102806 ?auto_102808 ) ) ( not ( = ?auto_102806 ?auto_102809 ) ) ( not ( = ?auto_102806 ?auto_102810 ) ) ( not ( = ?auto_102806 ?auto_102811 ) ) ( not ( = ?auto_102806 ?auto_102812 ) ) ( not ( = ?auto_102806 ?auto_102813 ) ) ( not ( = ?auto_102806 ?auto_102814 ) ) ( not ( = ?auto_102806 ?auto_102815 ) ) ( not ( = ?auto_102807 ?auto_102808 ) ) ( not ( = ?auto_102807 ?auto_102809 ) ) ( not ( = ?auto_102807 ?auto_102810 ) ) ( not ( = ?auto_102807 ?auto_102811 ) ) ( not ( = ?auto_102807 ?auto_102812 ) ) ( not ( = ?auto_102807 ?auto_102813 ) ) ( not ( = ?auto_102807 ?auto_102814 ) ) ( not ( = ?auto_102807 ?auto_102815 ) ) ( not ( = ?auto_102808 ?auto_102809 ) ) ( not ( = ?auto_102808 ?auto_102810 ) ) ( not ( = ?auto_102808 ?auto_102811 ) ) ( not ( = ?auto_102808 ?auto_102812 ) ) ( not ( = ?auto_102808 ?auto_102813 ) ) ( not ( = ?auto_102808 ?auto_102814 ) ) ( not ( = ?auto_102808 ?auto_102815 ) ) ( not ( = ?auto_102809 ?auto_102810 ) ) ( not ( = ?auto_102809 ?auto_102811 ) ) ( not ( = ?auto_102809 ?auto_102812 ) ) ( not ( = ?auto_102809 ?auto_102813 ) ) ( not ( = ?auto_102809 ?auto_102814 ) ) ( not ( = ?auto_102809 ?auto_102815 ) ) ( not ( = ?auto_102810 ?auto_102811 ) ) ( not ( = ?auto_102810 ?auto_102812 ) ) ( not ( = ?auto_102810 ?auto_102813 ) ) ( not ( = ?auto_102810 ?auto_102814 ) ) ( not ( = ?auto_102810 ?auto_102815 ) ) ( not ( = ?auto_102811 ?auto_102812 ) ) ( not ( = ?auto_102811 ?auto_102813 ) ) ( not ( = ?auto_102811 ?auto_102814 ) ) ( not ( = ?auto_102811 ?auto_102815 ) ) ( not ( = ?auto_102812 ?auto_102813 ) ) ( not ( = ?auto_102812 ?auto_102814 ) ) ( not ( = ?auto_102812 ?auto_102815 ) ) ( not ( = ?auto_102813 ?auto_102814 ) ) ( not ( = ?auto_102813 ?auto_102815 ) ) ( not ( = ?auto_102814 ?auto_102815 ) ) ( ON ?auto_102813 ?auto_102814 ) ( ON ?auto_102812 ?auto_102813 ) ( ON ?auto_102811 ?auto_102812 ) ( CLEAR ?auto_102809 ) ( ON ?auto_102810 ?auto_102811 ) ( CLEAR ?auto_102810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102806 ?auto_102807 ?auto_102808 ?auto_102809 ?auto_102810 )
      ( MAKE-9PILE ?auto_102806 ?auto_102807 ?auto_102808 ?auto_102809 ?auto_102810 ?auto_102811 ?auto_102812 ?auto_102813 ?auto_102814 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_102844 - BLOCK
      ?auto_102845 - BLOCK
      ?auto_102846 - BLOCK
      ?auto_102847 - BLOCK
      ?auto_102848 - BLOCK
      ?auto_102849 - BLOCK
      ?auto_102850 - BLOCK
      ?auto_102851 - BLOCK
      ?auto_102852 - BLOCK
    )
    :vars
    (
      ?auto_102853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102852 ?auto_102853 ) ( ON-TABLE ?auto_102844 ) ( ON ?auto_102845 ?auto_102844 ) ( ON ?auto_102846 ?auto_102845 ) ( not ( = ?auto_102844 ?auto_102845 ) ) ( not ( = ?auto_102844 ?auto_102846 ) ) ( not ( = ?auto_102844 ?auto_102847 ) ) ( not ( = ?auto_102844 ?auto_102848 ) ) ( not ( = ?auto_102844 ?auto_102849 ) ) ( not ( = ?auto_102844 ?auto_102850 ) ) ( not ( = ?auto_102844 ?auto_102851 ) ) ( not ( = ?auto_102844 ?auto_102852 ) ) ( not ( = ?auto_102844 ?auto_102853 ) ) ( not ( = ?auto_102845 ?auto_102846 ) ) ( not ( = ?auto_102845 ?auto_102847 ) ) ( not ( = ?auto_102845 ?auto_102848 ) ) ( not ( = ?auto_102845 ?auto_102849 ) ) ( not ( = ?auto_102845 ?auto_102850 ) ) ( not ( = ?auto_102845 ?auto_102851 ) ) ( not ( = ?auto_102845 ?auto_102852 ) ) ( not ( = ?auto_102845 ?auto_102853 ) ) ( not ( = ?auto_102846 ?auto_102847 ) ) ( not ( = ?auto_102846 ?auto_102848 ) ) ( not ( = ?auto_102846 ?auto_102849 ) ) ( not ( = ?auto_102846 ?auto_102850 ) ) ( not ( = ?auto_102846 ?auto_102851 ) ) ( not ( = ?auto_102846 ?auto_102852 ) ) ( not ( = ?auto_102846 ?auto_102853 ) ) ( not ( = ?auto_102847 ?auto_102848 ) ) ( not ( = ?auto_102847 ?auto_102849 ) ) ( not ( = ?auto_102847 ?auto_102850 ) ) ( not ( = ?auto_102847 ?auto_102851 ) ) ( not ( = ?auto_102847 ?auto_102852 ) ) ( not ( = ?auto_102847 ?auto_102853 ) ) ( not ( = ?auto_102848 ?auto_102849 ) ) ( not ( = ?auto_102848 ?auto_102850 ) ) ( not ( = ?auto_102848 ?auto_102851 ) ) ( not ( = ?auto_102848 ?auto_102852 ) ) ( not ( = ?auto_102848 ?auto_102853 ) ) ( not ( = ?auto_102849 ?auto_102850 ) ) ( not ( = ?auto_102849 ?auto_102851 ) ) ( not ( = ?auto_102849 ?auto_102852 ) ) ( not ( = ?auto_102849 ?auto_102853 ) ) ( not ( = ?auto_102850 ?auto_102851 ) ) ( not ( = ?auto_102850 ?auto_102852 ) ) ( not ( = ?auto_102850 ?auto_102853 ) ) ( not ( = ?auto_102851 ?auto_102852 ) ) ( not ( = ?auto_102851 ?auto_102853 ) ) ( not ( = ?auto_102852 ?auto_102853 ) ) ( ON ?auto_102851 ?auto_102852 ) ( ON ?auto_102850 ?auto_102851 ) ( ON ?auto_102849 ?auto_102850 ) ( ON ?auto_102848 ?auto_102849 ) ( CLEAR ?auto_102846 ) ( ON ?auto_102847 ?auto_102848 ) ( CLEAR ?auto_102847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102844 ?auto_102845 ?auto_102846 ?auto_102847 )
      ( MAKE-9PILE ?auto_102844 ?auto_102845 ?auto_102846 ?auto_102847 ?auto_102848 ?auto_102849 ?auto_102850 ?auto_102851 ?auto_102852 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_102882 - BLOCK
      ?auto_102883 - BLOCK
      ?auto_102884 - BLOCK
      ?auto_102885 - BLOCK
      ?auto_102886 - BLOCK
      ?auto_102887 - BLOCK
      ?auto_102888 - BLOCK
      ?auto_102889 - BLOCK
      ?auto_102890 - BLOCK
    )
    :vars
    (
      ?auto_102891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102890 ?auto_102891 ) ( ON-TABLE ?auto_102882 ) ( ON ?auto_102883 ?auto_102882 ) ( not ( = ?auto_102882 ?auto_102883 ) ) ( not ( = ?auto_102882 ?auto_102884 ) ) ( not ( = ?auto_102882 ?auto_102885 ) ) ( not ( = ?auto_102882 ?auto_102886 ) ) ( not ( = ?auto_102882 ?auto_102887 ) ) ( not ( = ?auto_102882 ?auto_102888 ) ) ( not ( = ?auto_102882 ?auto_102889 ) ) ( not ( = ?auto_102882 ?auto_102890 ) ) ( not ( = ?auto_102882 ?auto_102891 ) ) ( not ( = ?auto_102883 ?auto_102884 ) ) ( not ( = ?auto_102883 ?auto_102885 ) ) ( not ( = ?auto_102883 ?auto_102886 ) ) ( not ( = ?auto_102883 ?auto_102887 ) ) ( not ( = ?auto_102883 ?auto_102888 ) ) ( not ( = ?auto_102883 ?auto_102889 ) ) ( not ( = ?auto_102883 ?auto_102890 ) ) ( not ( = ?auto_102883 ?auto_102891 ) ) ( not ( = ?auto_102884 ?auto_102885 ) ) ( not ( = ?auto_102884 ?auto_102886 ) ) ( not ( = ?auto_102884 ?auto_102887 ) ) ( not ( = ?auto_102884 ?auto_102888 ) ) ( not ( = ?auto_102884 ?auto_102889 ) ) ( not ( = ?auto_102884 ?auto_102890 ) ) ( not ( = ?auto_102884 ?auto_102891 ) ) ( not ( = ?auto_102885 ?auto_102886 ) ) ( not ( = ?auto_102885 ?auto_102887 ) ) ( not ( = ?auto_102885 ?auto_102888 ) ) ( not ( = ?auto_102885 ?auto_102889 ) ) ( not ( = ?auto_102885 ?auto_102890 ) ) ( not ( = ?auto_102885 ?auto_102891 ) ) ( not ( = ?auto_102886 ?auto_102887 ) ) ( not ( = ?auto_102886 ?auto_102888 ) ) ( not ( = ?auto_102886 ?auto_102889 ) ) ( not ( = ?auto_102886 ?auto_102890 ) ) ( not ( = ?auto_102886 ?auto_102891 ) ) ( not ( = ?auto_102887 ?auto_102888 ) ) ( not ( = ?auto_102887 ?auto_102889 ) ) ( not ( = ?auto_102887 ?auto_102890 ) ) ( not ( = ?auto_102887 ?auto_102891 ) ) ( not ( = ?auto_102888 ?auto_102889 ) ) ( not ( = ?auto_102888 ?auto_102890 ) ) ( not ( = ?auto_102888 ?auto_102891 ) ) ( not ( = ?auto_102889 ?auto_102890 ) ) ( not ( = ?auto_102889 ?auto_102891 ) ) ( not ( = ?auto_102890 ?auto_102891 ) ) ( ON ?auto_102889 ?auto_102890 ) ( ON ?auto_102888 ?auto_102889 ) ( ON ?auto_102887 ?auto_102888 ) ( ON ?auto_102886 ?auto_102887 ) ( ON ?auto_102885 ?auto_102886 ) ( CLEAR ?auto_102883 ) ( ON ?auto_102884 ?auto_102885 ) ( CLEAR ?auto_102884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102882 ?auto_102883 ?auto_102884 )
      ( MAKE-9PILE ?auto_102882 ?auto_102883 ?auto_102884 ?auto_102885 ?auto_102886 ?auto_102887 ?auto_102888 ?auto_102889 ?auto_102890 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_102920 - BLOCK
      ?auto_102921 - BLOCK
      ?auto_102922 - BLOCK
      ?auto_102923 - BLOCK
      ?auto_102924 - BLOCK
      ?auto_102925 - BLOCK
      ?auto_102926 - BLOCK
      ?auto_102927 - BLOCK
      ?auto_102928 - BLOCK
    )
    :vars
    (
      ?auto_102929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102928 ?auto_102929 ) ( ON-TABLE ?auto_102920 ) ( not ( = ?auto_102920 ?auto_102921 ) ) ( not ( = ?auto_102920 ?auto_102922 ) ) ( not ( = ?auto_102920 ?auto_102923 ) ) ( not ( = ?auto_102920 ?auto_102924 ) ) ( not ( = ?auto_102920 ?auto_102925 ) ) ( not ( = ?auto_102920 ?auto_102926 ) ) ( not ( = ?auto_102920 ?auto_102927 ) ) ( not ( = ?auto_102920 ?auto_102928 ) ) ( not ( = ?auto_102920 ?auto_102929 ) ) ( not ( = ?auto_102921 ?auto_102922 ) ) ( not ( = ?auto_102921 ?auto_102923 ) ) ( not ( = ?auto_102921 ?auto_102924 ) ) ( not ( = ?auto_102921 ?auto_102925 ) ) ( not ( = ?auto_102921 ?auto_102926 ) ) ( not ( = ?auto_102921 ?auto_102927 ) ) ( not ( = ?auto_102921 ?auto_102928 ) ) ( not ( = ?auto_102921 ?auto_102929 ) ) ( not ( = ?auto_102922 ?auto_102923 ) ) ( not ( = ?auto_102922 ?auto_102924 ) ) ( not ( = ?auto_102922 ?auto_102925 ) ) ( not ( = ?auto_102922 ?auto_102926 ) ) ( not ( = ?auto_102922 ?auto_102927 ) ) ( not ( = ?auto_102922 ?auto_102928 ) ) ( not ( = ?auto_102922 ?auto_102929 ) ) ( not ( = ?auto_102923 ?auto_102924 ) ) ( not ( = ?auto_102923 ?auto_102925 ) ) ( not ( = ?auto_102923 ?auto_102926 ) ) ( not ( = ?auto_102923 ?auto_102927 ) ) ( not ( = ?auto_102923 ?auto_102928 ) ) ( not ( = ?auto_102923 ?auto_102929 ) ) ( not ( = ?auto_102924 ?auto_102925 ) ) ( not ( = ?auto_102924 ?auto_102926 ) ) ( not ( = ?auto_102924 ?auto_102927 ) ) ( not ( = ?auto_102924 ?auto_102928 ) ) ( not ( = ?auto_102924 ?auto_102929 ) ) ( not ( = ?auto_102925 ?auto_102926 ) ) ( not ( = ?auto_102925 ?auto_102927 ) ) ( not ( = ?auto_102925 ?auto_102928 ) ) ( not ( = ?auto_102925 ?auto_102929 ) ) ( not ( = ?auto_102926 ?auto_102927 ) ) ( not ( = ?auto_102926 ?auto_102928 ) ) ( not ( = ?auto_102926 ?auto_102929 ) ) ( not ( = ?auto_102927 ?auto_102928 ) ) ( not ( = ?auto_102927 ?auto_102929 ) ) ( not ( = ?auto_102928 ?auto_102929 ) ) ( ON ?auto_102927 ?auto_102928 ) ( ON ?auto_102926 ?auto_102927 ) ( ON ?auto_102925 ?auto_102926 ) ( ON ?auto_102924 ?auto_102925 ) ( ON ?auto_102923 ?auto_102924 ) ( ON ?auto_102922 ?auto_102923 ) ( CLEAR ?auto_102920 ) ( ON ?auto_102921 ?auto_102922 ) ( CLEAR ?auto_102921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102920 ?auto_102921 )
      ( MAKE-9PILE ?auto_102920 ?auto_102921 ?auto_102922 ?auto_102923 ?auto_102924 ?auto_102925 ?auto_102926 ?auto_102927 ?auto_102928 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_102958 - BLOCK
      ?auto_102959 - BLOCK
      ?auto_102960 - BLOCK
      ?auto_102961 - BLOCK
      ?auto_102962 - BLOCK
      ?auto_102963 - BLOCK
      ?auto_102964 - BLOCK
      ?auto_102965 - BLOCK
      ?auto_102966 - BLOCK
    )
    :vars
    (
      ?auto_102967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102966 ?auto_102967 ) ( not ( = ?auto_102958 ?auto_102959 ) ) ( not ( = ?auto_102958 ?auto_102960 ) ) ( not ( = ?auto_102958 ?auto_102961 ) ) ( not ( = ?auto_102958 ?auto_102962 ) ) ( not ( = ?auto_102958 ?auto_102963 ) ) ( not ( = ?auto_102958 ?auto_102964 ) ) ( not ( = ?auto_102958 ?auto_102965 ) ) ( not ( = ?auto_102958 ?auto_102966 ) ) ( not ( = ?auto_102958 ?auto_102967 ) ) ( not ( = ?auto_102959 ?auto_102960 ) ) ( not ( = ?auto_102959 ?auto_102961 ) ) ( not ( = ?auto_102959 ?auto_102962 ) ) ( not ( = ?auto_102959 ?auto_102963 ) ) ( not ( = ?auto_102959 ?auto_102964 ) ) ( not ( = ?auto_102959 ?auto_102965 ) ) ( not ( = ?auto_102959 ?auto_102966 ) ) ( not ( = ?auto_102959 ?auto_102967 ) ) ( not ( = ?auto_102960 ?auto_102961 ) ) ( not ( = ?auto_102960 ?auto_102962 ) ) ( not ( = ?auto_102960 ?auto_102963 ) ) ( not ( = ?auto_102960 ?auto_102964 ) ) ( not ( = ?auto_102960 ?auto_102965 ) ) ( not ( = ?auto_102960 ?auto_102966 ) ) ( not ( = ?auto_102960 ?auto_102967 ) ) ( not ( = ?auto_102961 ?auto_102962 ) ) ( not ( = ?auto_102961 ?auto_102963 ) ) ( not ( = ?auto_102961 ?auto_102964 ) ) ( not ( = ?auto_102961 ?auto_102965 ) ) ( not ( = ?auto_102961 ?auto_102966 ) ) ( not ( = ?auto_102961 ?auto_102967 ) ) ( not ( = ?auto_102962 ?auto_102963 ) ) ( not ( = ?auto_102962 ?auto_102964 ) ) ( not ( = ?auto_102962 ?auto_102965 ) ) ( not ( = ?auto_102962 ?auto_102966 ) ) ( not ( = ?auto_102962 ?auto_102967 ) ) ( not ( = ?auto_102963 ?auto_102964 ) ) ( not ( = ?auto_102963 ?auto_102965 ) ) ( not ( = ?auto_102963 ?auto_102966 ) ) ( not ( = ?auto_102963 ?auto_102967 ) ) ( not ( = ?auto_102964 ?auto_102965 ) ) ( not ( = ?auto_102964 ?auto_102966 ) ) ( not ( = ?auto_102964 ?auto_102967 ) ) ( not ( = ?auto_102965 ?auto_102966 ) ) ( not ( = ?auto_102965 ?auto_102967 ) ) ( not ( = ?auto_102966 ?auto_102967 ) ) ( ON ?auto_102965 ?auto_102966 ) ( ON ?auto_102964 ?auto_102965 ) ( ON ?auto_102963 ?auto_102964 ) ( ON ?auto_102962 ?auto_102963 ) ( ON ?auto_102961 ?auto_102962 ) ( ON ?auto_102960 ?auto_102961 ) ( ON ?auto_102959 ?auto_102960 ) ( ON ?auto_102958 ?auto_102959 ) ( CLEAR ?auto_102958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102958 )
      ( MAKE-9PILE ?auto_102958 ?auto_102959 ?auto_102960 ?auto_102961 ?auto_102962 ?auto_102963 ?auto_102964 ?auto_102965 ?auto_102966 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_102997 - BLOCK
      ?auto_102998 - BLOCK
      ?auto_102999 - BLOCK
      ?auto_103000 - BLOCK
      ?auto_103001 - BLOCK
      ?auto_103002 - BLOCK
      ?auto_103003 - BLOCK
      ?auto_103004 - BLOCK
      ?auto_103005 - BLOCK
      ?auto_103006 - BLOCK
    )
    :vars
    (
      ?auto_103007 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103005 ) ( ON ?auto_103006 ?auto_103007 ) ( CLEAR ?auto_103006 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102997 ) ( ON ?auto_102998 ?auto_102997 ) ( ON ?auto_102999 ?auto_102998 ) ( ON ?auto_103000 ?auto_102999 ) ( ON ?auto_103001 ?auto_103000 ) ( ON ?auto_103002 ?auto_103001 ) ( ON ?auto_103003 ?auto_103002 ) ( ON ?auto_103004 ?auto_103003 ) ( ON ?auto_103005 ?auto_103004 ) ( not ( = ?auto_102997 ?auto_102998 ) ) ( not ( = ?auto_102997 ?auto_102999 ) ) ( not ( = ?auto_102997 ?auto_103000 ) ) ( not ( = ?auto_102997 ?auto_103001 ) ) ( not ( = ?auto_102997 ?auto_103002 ) ) ( not ( = ?auto_102997 ?auto_103003 ) ) ( not ( = ?auto_102997 ?auto_103004 ) ) ( not ( = ?auto_102997 ?auto_103005 ) ) ( not ( = ?auto_102997 ?auto_103006 ) ) ( not ( = ?auto_102997 ?auto_103007 ) ) ( not ( = ?auto_102998 ?auto_102999 ) ) ( not ( = ?auto_102998 ?auto_103000 ) ) ( not ( = ?auto_102998 ?auto_103001 ) ) ( not ( = ?auto_102998 ?auto_103002 ) ) ( not ( = ?auto_102998 ?auto_103003 ) ) ( not ( = ?auto_102998 ?auto_103004 ) ) ( not ( = ?auto_102998 ?auto_103005 ) ) ( not ( = ?auto_102998 ?auto_103006 ) ) ( not ( = ?auto_102998 ?auto_103007 ) ) ( not ( = ?auto_102999 ?auto_103000 ) ) ( not ( = ?auto_102999 ?auto_103001 ) ) ( not ( = ?auto_102999 ?auto_103002 ) ) ( not ( = ?auto_102999 ?auto_103003 ) ) ( not ( = ?auto_102999 ?auto_103004 ) ) ( not ( = ?auto_102999 ?auto_103005 ) ) ( not ( = ?auto_102999 ?auto_103006 ) ) ( not ( = ?auto_102999 ?auto_103007 ) ) ( not ( = ?auto_103000 ?auto_103001 ) ) ( not ( = ?auto_103000 ?auto_103002 ) ) ( not ( = ?auto_103000 ?auto_103003 ) ) ( not ( = ?auto_103000 ?auto_103004 ) ) ( not ( = ?auto_103000 ?auto_103005 ) ) ( not ( = ?auto_103000 ?auto_103006 ) ) ( not ( = ?auto_103000 ?auto_103007 ) ) ( not ( = ?auto_103001 ?auto_103002 ) ) ( not ( = ?auto_103001 ?auto_103003 ) ) ( not ( = ?auto_103001 ?auto_103004 ) ) ( not ( = ?auto_103001 ?auto_103005 ) ) ( not ( = ?auto_103001 ?auto_103006 ) ) ( not ( = ?auto_103001 ?auto_103007 ) ) ( not ( = ?auto_103002 ?auto_103003 ) ) ( not ( = ?auto_103002 ?auto_103004 ) ) ( not ( = ?auto_103002 ?auto_103005 ) ) ( not ( = ?auto_103002 ?auto_103006 ) ) ( not ( = ?auto_103002 ?auto_103007 ) ) ( not ( = ?auto_103003 ?auto_103004 ) ) ( not ( = ?auto_103003 ?auto_103005 ) ) ( not ( = ?auto_103003 ?auto_103006 ) ) ( not ( = ?auto_103003 ?auto_103007 ) ) ( not ( = ?auto_103004 ?auto_103005 ) ) ( not ( = ?auto_103004 ?auto_103006 ) ) ( not ( = ?auto_103004 ?auto_103007 ) ) ( not ( = ?auto_103005 ?auto_103006 ) ) ( not ( = ?auto_103005 ?auto_103007 ) ) ( not ( = ?auto_103006 ?auto_103007 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103006 ?auto_103007 )
      ( !STACK ?auto_103006 ?auto_103005 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103018 - BLOCK
      ?auto_103019 - BLOCK
      ?auto_103020 - BLOCK
      ?auto_103021 - BLOCK
      ?auto_103022 - BLOCK
      ?auto_103023 - BLOCK
      ?auto_103024 - BLOCK
      ?auto_103025 - BLOCK
      ?auto_103026 - BLOCK
      ?auto_103027 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103026 ) ( ON-TABLE ?auto_103027 ) ( CLEAR ?auto_103027 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103018 ) ( ON ?auto_103019 ?auto_103018 ) ( ON ?auto_103020 ?auto_103019 ) ( ON ?auto_103021 ?auto_103020 ) ( ON ?auto_103022 ?auto_103021 ) ( ON ?auto_103023 ?auto_103022 ) ( ON ?auto_103024 ?auto_103023 ) ( ON ?auto_103025 ?auto_103024 ) ( ON ?auto_103026 ?auto_103025 ) ( not ( = ?auto_103018 ?auto_103019 ) ) ( not ( = ?auto_103018 ?auto_103020 ) ) ( not ( = ?auto_103018 ?auto_103021 ) ) ( not ( = ?auto_103018 ?auto_103022 ) ) ( not ( = ?auto_103018 ?auto_103023 ) ) ( not ( = ?auto_103018 ?auto_103024 ) ) ( not ( = ?auto_103018 ?auto_103025 ) ) ( not ( = ?auto_103018 ?auto_103026 ) ) ( not ( = ?auto_103018 ?auto_103027 ) ) ( not ( = ?auto_103019 ?auto_103020 ) ) ( not ( = ?auto_103019 ?auto_103021 ) ) ( not ( = ?auto_103019 ?auto_103022 ) ) ( not ( = ?auto_103019 ?auto_103023 ) ) ( not ( = ?auto_103019 ?auto_103024 ) ) ( not ( = ?auto_103019 ?auto_103025 ) ) ( not ( = ?auto_103019 ?auto_103026 ) ) ( not ( = ?auto_103019 ?auto_103027 ) ) ( not ( = ?auto_103020 ?auto_103021 ) ) ( not ( = ?auto_103020 ?auto_103022 ) ) ( not ( = ?auto_103020 ?auto_103023 ) ) ( not ( = ?auto_103020 ?auto_103024 ) ) ( not ( = ?auto_103020 ?auto_103025 ) ) ( not ( = ?auto_103020 ?auto_103026 ) ) ( not ( = ?auto_103020 ?auto_103027 ) ) ( not ( = ?auto_103021 ?auto_103022 ) ) ( not ( = ?auto_103021 ?auto_103023 ) ) ( not ( = ?auto_103021 ?auto_103024 ) ) ( not ( = ?auto_103021 ?auto_103025 ) ) ( not ( = ?auto_103021 ?auto_103026 ) ) ( not ( = ?auto_103021 ?auto_103027 ) ) ( not ( = ?auto_103022 ?auto_103023 ) ) ( not ( = ?auto_103022 ?auto_103024 ) ) ( not ( = ?auto_103022 ?auto_103025 ) ) ( not ( = ?auto_103022 ?auto_103026 ) ) ( not ( = ?auto_103022 ?auto_103027 ) ) ( not ( = ?auto_103023 ?auto_103024 ) ) ( not ( = ?auto_103023 ?auto_103025 ) ) ( not ( = ?auto_103023 ?auto_103026 ) ) ( not ( = ?auto_103023 ?auto_103027 ) ) ( not ( = ?auto_103024 ?auto_103025 ) ) ( not ( = ?auto_103024 ?auto_103026 ) ) ( not ( = ?auto_103024 ?auto_103027 ) ) ( not ( = ?auto_103025 ?auto_103026 ) ) ( not ( = ?auto_103025 ?auto_103027 ) ) ( not ( = ?auto_103026 ?auto_103027 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_103027 )
      ( !STACK ?auto_103027 ?auto_103026 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103038 - BLOCK
      ?auto_103039 - BLOCK
      ?auto_103040 - BLOCK
      ?auto_103041 - BLOCK
      ?auto_103042 - BLOCK
      ?auto_103043 - BLOCK
      ?auto_103044 - BLOCK
      ?auto_103045 - BLOCK
      ?auto_103046 - BLOCK
      ?auto_103047 - BLOCK
    )
    :vars
    (
      ?auto_103048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103047 ?auto_103048 ) ( ON-TABLE ?auto_103038 ) ( ON ?auto_103039 ?auto_103038 ) ( ON ?auto_103040 ?auto_103039 ) ( ON ?auto_103041 ?auto_103040 ) ( ON ?auto_103042 ?auto_103041 ) ( ON ?auto_103043 ?auto_103042 ) ( ON ?auto_103044 ?auto_103043 ) ( ON ?auto_103045 ?auto_103044 ) ( not ( = ?auto_103038 ?auto_103039 ) ) ( not ( = ?auto_103038 ?auto_103040 ) ) ( not ( = ?auto_103038 ?auto_103041 ) ) ( not ( = ?auto_103038 ?auto_103042 ) ) ( not ( = ?auto_103038 ?auto_103043 ) ) ( not ( = ?auto_103038 ?auto_103044 ) ) ( not ( = ?auto_103038 ?auto_103045 ) ) ( not ( = ?auto_103038 ?auto_103046 ) ) ( not ( = ?auto_103038 ?auto_103047 ) ) ( not ( = ?auto_103038 ?auto_103048 ) ) ( not ( = ?auto_103039 ?auto_103040 ) ) ( not ( = ?auto_103039 ?auto_103041 ) ) ( not ( = ?auto_103039 ?auto_103042 ) ) ( not ( = ?auto_103039 ?auto_103043 ) ) ( not ( = ?auto_103039 ?auto_103044 ) ) ( not ( = ?auto_103039 ?auto_103045 ) ) ( not ( = ?auto_103039 ?auto_103046 ) ) ( not ( = ?auto_103039 ?auto_103047 ) ) ( not ( = ?auto_103039 ?auto_103048 ) ) ( not ( = ?auto_103040 ?auto_103041 ) ) ( not ( = ?auto_103040 ?auto_103042 ) ) ( not ( = ?auto_103040 ?auto_103043 ) ) ( not ( = ?auto_103040 ?auto_103044 ) ) ( not ( = ?auto_103040 ?auto_103045 ) ) ( not ( = ?auto_103040 ?auto_103046 ) ) ( not ( = ?auto_103040 ?auto_103047 ) ) ( not ( = ?auto_103040 ?auto_103048 ) ) ( not ( = ?auto_103041 ?auto_103042 ) ) ( not ( = ?auto_103041 ?auto_103043 ) ) ( not ( = ?auto_103041 ?auto_103044 ) ) ( not ( = ?auto_103041 ?auto_103045 ) ) ( not ( = ?auto_103041 ?auto_103046 ) ) ( not ( = ?auto_103041 ?auto_103047 ) ) ( not ( = ?auto_103041 ?auto_103048 ) ) ( not ( = ?auto_103042 ?auto_103043 ) ) ( not ( = ?auto_103042 ?auto_103044 ) ) ( not ( = ?auto_103042 ?auto_103045 ) ) ( not ( = ?auto_103042 ?auto_103046 ) ) ( not ( = ?auto_103042 ?auto_103047 ) ) ( not ( = ?auto_103042 ?auto_103048 ) ) ( not ( = ?auto_103043 ?auto_103044 ) ) ( not ( = ?auto_103043 ?auto_103045 ) ) ( not ( = ?auto_103043 ?auto_103046 ) ) ( not ( = ?auto_103043 ?auto_103047 ) ) ( not ( = ?auto_103043 ?auto_103048 ) ) ( not ( = ?auto_103044 ?auto_103045 ) ) ( not ( = ?auto_103044 ?auto_103046 ) ) ( not ( = ?auto_103044 ?auto_103047 ) ) ( not ( = ?auto_103044 ?auto_103048 ) ) ( not ( = ?auto_103045 ?auto_103046 ) ) ( not ( = ?auto_103045 ?auto_103047 ) ) ( not ( = ?auto_103045 ?auto_103048 ) ) ( not ( = ?auto_103046 ?auto_103047 ) ) ( not ( = ?auto_103046 ?auto_103048 ) ) ( not ( = ?auto_103047 ?auto_103048 ) ) ( CLEAR ?auto_103045 ) ( ON ?auto_103046 ?auto_103047 ) ( CLEAR ?auto_103046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_103038 ?auto_103039 ?auto_103040 ?auto_103041 ?auto_103042 ?auto_103043 ?auto_103044 ?auto_103045 ?auto_103046 )
      ( MAKE-10PILE ?auto_103038 ?auto_103039 ?auto_103040 ?auto_103041 ?auto_103042 ?auto_103043 ?auto_103044 ?auto_103045 ?auto_103046 ?auto_103047 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103059 - BLOCK
      ?auto_103060 - BLOCK
      ?auto_103061 - BLOCK
      ?auto_103062 - BLOCK
      ?auto_103063 - BLOCK
      ?auto_103064 - BLOCK
      ?auto_103065 - BLOCK
      ?auto_103066 - BLOCK
      ?auto_103067 - BLOCK
      ?auto_103068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103068 ) ( ON-TABLE ?auto_103059 ) ( ON ?auto_103060 ?auto_103059 ) ( ON ?auto_103061 ?auto_103060 ) ( ON ?auto_103062 ?auto_103061 ) ( ON ?auto_103063 ?auto_103062 ) ( ON ?auto_103064 ?auto_103063 ) ( ON ?auto_103065 ?auto_103064 ) ( ON ?auto_103066 ?auto_103065 ) ( not ( = ?auto_103059 ?auto_103060 ) ) ( not ( = ?auto_103059 ?auto_103061 ) ) ( not ( = ?auto_103059 ?auto_103062 ) ) ( not ( = ?auto_103059 ?auto_103063 ) ) ( not ( = ?auto_103059 ?auto_103064 ) ) ( not ( = ?auto_103059 ?auto_103065 ) ) ( not ( = ?auto_103059 ?auto_103066 ) ) ( not ( = ?auto_103059 ?auto_103067 ) ) ( not ( = ?auto_103059 ?auto_103068 ) ) ( not ( = ?auto_103060 ?auto_103061 ) ) ( not ( = ?auto_103060 ?auto_103062 ) ) ( not ( = ?auto_103060 ?auto_103063 ) ) ( not ( = ?auto_103060 ?auto_103064 ) ) ( not ( = ?auto_103060 ?auto_103065 ) ) ( not ( = ?auto_103060 ?auto_103066 ) ) ( not ( = ?auto_103060 ?auto_103067 ) ) ( not ( = ?auto_103060 ?auto_103068 ) ) ( not ( = ?auto_103061 ?auto_103062 ) ) ( not ( = ?auto_103061 ?auto_103063 ) ) ( not ( = ?auto_103061 ?auto_103064 ) ) ( not ( = ?auto_103061 ?auto_103065 ) ) ( not ( = ?auto_103061 ?auto_103066 ) ) ( not ( = ?auto_103061 ?auto_103067 ) ) ( not ( = ?auto_103061 ?auto_103068 ) ) ( not ( = ?auto_103062 ?auto_103063 ) ) ( not ( = ?auto_103062 ?auto_103064 ) ) ( not ( = ?auto_103062 ?auto_103065 ) ) ( not ( = ?auto_103062 ?auto_103066 ) ) ( not ( = ?auto_103062 ?auto_103067 ) ) ( not ( = ?auto_103062 ?auto_103068 ) ) ( not ( = ?auto_103063 ?auto_103064 ) ) ( not ( = ?auto_103063 ?auto_103065 ) ) ( not ( = ?auto_103063 ?auto_103066 ) ) ( not ( = ?auto_103063 ?auto_103067 ) ) ( not ( = ?auto_103063 ?auto_103068 ) ) ( not ( = ?auto_103064 ?auto_103065 ) ) ( not ( = ?auto_103064 ?auto_103066 ) ) ( not ( = ?auto_103064 ?auto_103067 ) ) ( not ( = ?auto_103064 ?auto_103068 ) ) ( not ( = ?auto_103065 ?auto_103066 ) ) ( not ( = ?auto_103065 ?auto_103067 ) ) ( not ( = ?auto_103065 ?auto_103068 ) ) ( not ( = ?auto_103066 ?auto_103067 ) ) ( not ( = ?auto_103066 ?auto_103068 ) ) ( not ( = ?auto_103067 ?auto_103068 ) ) ( CLEAR ?auto_103066 ) ( ON ?auto_103067 ?auto_103068 ) ( CLEAR ?auto_103067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_103059 ?auto_103060 ?auto_103061 ?auto_103062 ?auto_103063 ?auto_103064 ?auto_103065 ?auto_103066 ?auto_103067 )
      ( MAKE-10PILE ?auto_103059 ?auto_103060 ?auto_103061 ?auto_103062 ?auto_103063 ?auto_103064 ?auto_103065 ?auto_103066 ?auto_103067 ?auto_103068 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103079 - BLOCK
      ?auto_103080 - BLOCK
      ?auto_103081 - BLOCK
      ?auto_103082 - BLOCK
      ?auto_103083 - BLOCK
      ?auto_103084 - BLOCK
      ?auto_103085 - BLOCK
      ?auto_103086 - BLOCK
      ?auto_103087 - BLOCK
      ?auto_103088 - BLOCK
    )
    :vars
    (
      ?auto_103089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103088 ?auto_103089 ) ( ON-TABLE ?auto_103079 ) ( ON ?auto_103080 ?auto_103079 ) ( ON ?auto_103081 ?auto_103080 ) ( ON ?auto_103082 ?auto_103081 ) ( ON ?auto_103083 ?auto_103082 ) ( ON ?auto_103084 ?auto_103083 ) ( ON ?auto_103085 ?auto_103084 ) ( not ( = ?auto_103079 ?auto_103080 ) ) ( not ( = ?auto_103079 ?auto_103081 ) ) ( not ( = ?auto_103079 ?auto_103082 ) ) ( not ( = ?auto_103079 ?auto_103083 ) ) ( not ( = ?auto_103079 ?auto_103084 ) ) ( not ( = ?auto_103079 ?auto_103085 ) ) ( not ( = ?auto_103079 ?auto_103086 ) ) ( not ( = ?auto_103079 ?auto_103087 ) ) ( not ( = ?auto_103079 ?auto_103088 ) ) ( not ( = ?auto_103079 ?auto_103089 ) ) ( not ( = ?auto_103080 ?auto_103081 ) ) ( not ( = ?auto_103080 ?auto_103082 ) ) ( not ( = ?auto_103080 ?auto_103083 ) ) ( not ( = ?auto_103080 ?auto_103084 ) ) ( not ( = ?auto_103080 ?auto_103085 ) ) ( not ( = ?auto_103080 ?auto_103086 ) ) ( not ( = ?auto_103080 ?auto_103087 ) ) ( not ( = ?auto_103080 ?auto_103088 ) ) ( not ( = ?auto_103080 ?auto_103089 ) ) ( not ( = ?auto_103081 ?auto_103082 ) ) ( not ( = ?auto_103081 ?auto_103083 ) ) ( not ( = ?auto_103081 ?auto_103084 ) ) ( not ( = ?auto_103081 ?auto_103085 ) ) ( not ( = ?auto_103081 ?auto_103086 ) ) ( not ( = ?auto_103081 ?auto_103087 ) ) ( not ( = ?auto_103081 ?auto_103088 ) ) ( not ( = ?auto_103081 ?auto_103089 ) ) ( not ( = ?auto_103082 ?auto_103083 ) ) ( not ( = ?auto_103082 ?auto_103084 ) ) ( not ( = ?auto_103082 ?auto_103085 ) ) ( not ( = ?auto_103082 ?auto_103086 ) ) ( not ( = ?auto_103082 ?auto_103087 ) ) ( not ( = ?auto_103082 ?auto_103088 ) ) ( not ( = ?auto_103082 ?auto_103089 ) ) ( not ( = ?auto_103083 ?auto_103084 ) ) ( not ( = ?auto_103083 ?auto_103085 ) ) ( not ( = ?auto_103083 ?auto_103086 ) ) ( not ( = ?auto_103083 ?auto_103087 ) ) ( not ( = ?auto_103083 ?auto_103088 ) ) ( not ( = ?auto_103083 ?auto_103089 ) ) ( not ( = ?auto_103084 ?auto_103085 ) ) ( not ( = ?auto_103084 ?auto_103086 ) ) ( not ( = ?auto_103084 ?auto_103087 ) ) ( not ( = ?auto_103084 ?auto_103088 ) ) ( not ( = ?auto_103084 ?auto_103089 ) ) ( not ( = ?auto_103085 ?auto_103086 ) ) ( not ( = ?auto_103085 ?auto_103087 ) ) ( not ( = ?auto_103085 ?auto_103088 ) ) ( not ( = ?auto_103085 ?auto_103089 ) ) ( not ( = ?auto_103086 ?auto_103087 ) ) ( not ( = ?auto_103086 ?auto_103088 ) ) ( not ( = ?auto_103086 ?auto_103089 ) ) ( not ( = ?auto_103087 ?auto_103088 ) ) ( not ( = ?auto_103087 ?auto_103089 ) ) ( not ( = ?auto_103088 ?auto_103089 ) ) ( ON ?auto_103087 ?auto_103088 ) ( CLEAR ?auto_103085 ) ( ON ?auto_103086 ?auto_103087 ) ( CLEAR ?auto_103086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_103079 ?auto_103080 ?auto_103081 ?auto_103082 ?auto_103083 ?auto_103084 ?auto_103085 ?auto_103086 )
      ( MAKE-10PILE ?auto_103079 ?auto_103080 ?auto_103081 ?auto_103082 ?auto_103083 ?auto_103084 ?auto_103085 ?auto_103086 ?auto_103087 ?auto_103088 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103100 - BLOCK
      ?auto_103101 - BLOCK
      ?auto_103102 - BLOCK
      ?auto_103103 - BLOCK
      ?auto_103104 - BLOCK
      ?auto_103105 - BLOCK
      ?auto_103106 - BLOCK
      ?auto_103107 - BLOCK
      ?auto_103108 - BLOCK
      ?auto_103109 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103109 ) ( ON-TABLE ?auto_103100 ) ( ON ?auto_103101 ?auto_103100 ) ( ON ?auto_103102 ?auto_103101 ) ( ON ?auto_103103 ?auto_103102 ) ( ON ?auto_103104 ?auto_103103 ) ( ON ?auto_103105 ?auto_103104 ) ( ON ?auto_103106 ?auto_103105 ) ( not ( = ?auto_103100 ?auto_103101 ) ) ( not ( = ?auto_103100 ?auto_103102 ) ) ( not ( = ?auto_103100 ?auto_103103 ) ) ( not ( = ?auto_103100 ?auto_103104 ) ) ( not ( = ?auto_103100 ?auto_103105 ) ) ( not ( = ?auto_103100 ?auto_103106 ) ) ( not ( = ?auto_103100 ?auto_103107 ) ) ( not ( = ?auto_103100 ?auto_103108 ) ) ( not ( = ?auto_103100 ?auto_103109 ) ) ( not ( = ?auto_103101 ?auto_103102 ) ) ( not ( = ?auto_103101 ?auto_103103 ) ) ( not ( = ?auto_103101 ?auto_103104 ) ) ( not ( = ?auto_103101 ?auto_103105 ) ) ( not ( = ?auto_103101 ?auto_103106 ) ) ( not ( = ?auto_103101 ?auto_103107 ) ) ( not ( = ?auto_103101 ?auto_103108 ) ) ( not ( = ?auto_103101 ?auto_103109 ) ) ( not ( = ?auto_103102 ?auto_103103 ) ) ( not ( = ?auto_103102 ?auto_103104 ) ) ( not ( = ?auto_103102 ?auto_103105 ) ) ( not ( = ?auto_103102 ?auto_103106 ) ) ( not ( = ?auto_103102 ?auto_103107 ) ) ( not ( = ?auto_103102 ?auto_103108 ) ) ( not ( = ?auto_103102 ?auto_103109 ) ) ( not ( = ?auto_103103 ?auto_103104 ) ) ( not ( = ?auto_103103 ?auto_103105 ) ) ( not ( = ?auto_103103 ?auto_103106 ) ) ( not ( = ?auto_103103 ?auto_103107 ) ) ( not ( = ?auto_103103 ?auto_103108 ) ) ( not ( = ?auto_103103 ?auto_103109 ) ) ( not ( = ?auto_103104 ?auto_103105 ) ) ( not ( = ?auto_103104 ?auto_103106 ) ) ( not ( = ?auto_103104 ?auto_103107 ) ) ( not ( = ?auto_103104 ?auto_103108 ) ) ( not ( = ?auto_103104 ?auto_103109 ) ) ( not ( = ?auto_103105 ?auto_103106 ) ) ( not ( = ?auto_103105 ?auto_103107 ) ) ( not ( = ?auto_103105 ?auto_103108 ) ) ( not ( = ?auto_103105 ?auto_103109 ) ) ( not ( = ?auto_103106 ?auto_103107 ) ) ( not ( = ?auto_103106 ?auto_103108 ) ) ( not ( = ?auto_103106 ?auto_103109 ) ) ( not ( = ?auto_103107 ?auto_103108 ) ) ( not ( = ?auto_103107 ?auto_103109 ) ) ( not ( = ?auto_103108 ?auto_103109 ) ) ( ON ?auto_103108 ?auto_103109 ) ( CLEAR ?auto_103106 ) ( ON ?auto_103107 ?auto_103108 ) ( CLEAR ?auto_103107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_103100 ?auto_103101 ?auto_103102 ?auto_103103 ?auto_103104 ?auto_103105 ?auto_103106 ?auto_103107 )
      ( MAKE-10PILE ?auto_103100 ?auto_103101 ?auto_103102 ?auto_103103 ?auto_103104 ?auto_103105 ?auto_103106 ?auto_103107 ?auto_103108 ?auto_103109 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103120 - BLOCK
      ?auto_103121 - BLOCK
      ?auto_103122 - BLOCK
      ?auto_103123 - BLOCK
      ?auto_103124 - BLOCK
      ?auto_103125 - BLOCK
      ?auto_103126 - BLOCK
      ?auto_103127 - BLOCK
      ?auto_103128 - BLOCK
      ?auto_103129 - BLOCK
    )
    :vars
    (
      ?auto_103130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103129 ?auto_103130 ) ( ON-TABLE ?auto_103120 ) ( ON ?auto_103121 ?auto_103120 ) ( ON ?auto_103122 ?auto_103121 ) ( ON ?auto_103123 ?auto_103122 ) ( ON ?auto_103124 ?auto_103123 ) ( ON ?auto_103125 ?auto_103124 ) ( not ( = ?auto_103120 ?auto_103121 ) ) ( not ( = ?auto_103120 ?auto_103122 ) ) ( not ( = ?auto_103120 ?auto_103123 ) ) ( not ( = ?auto_103120 ?auto_103124 ) ) ( not ( = ?auto_103120 ?auto_103125 ) ) ( not ( = ?auto_103120 ?auto_103126 ) ) ( not ( = ?auto_103120 ?auto_103127 ) ) ( not ( = ?auto_103120 ?auto_103128 ) ) ( not ( = ?auto_103120 ?auto_103129 ) ) ( not ( = ?auto_103120 ?auto_103130 ) ) ( not ( = ?auto_103121 ?auto_103122 ) ) ( not ( = ?auto_103121 ?auto_103123 ) ) ( not ( = ?auto_103121 ?auto_103124 ) ) ( not ( = ?auto_103121 ?auto_103125 ) ) ( not ( = ?auto_103121 ?auto_103126 ) ) ( not ( = ?auto_103121 ?auto_103127 ) ) ( not ( = ?auto_103121 ?auto_103128 ) ) ( not ( = ?auto_103121 ?auto_103129 ) ) ( not ( = ?auto_103121 ?auto_103130 ) ) ( not ( = ?auto_103122 ?auto_103123 ) ) ( not ( = ?auto_103122 ?auto_103124 ) ) ( not ( = ?auto_103122 ?auto_103125 ) ) ( not ( = ?auto_103122 ?auto_103126 ) ) ( not ( = ?auto_103122 ?auto_103127 ) ) ( not ( = ?auto_103122 ?auto_103128 ) ) ( not ( = ?auto_103122 ?auto_103129 ) ) ( not ( = ?auto_103122 ?auto_103130 ) ) ( not ( = ?auto_103123 ?auto_103124 ) ) ( not ( = ?auto_103123 ?auto_103125 ) ) ( not ( = ?auto_103123 ?auto_103126 ) ) ( not ( = ?auto_103123 ?auto_103127 ) ) ( not ( = ?auto_103123 ?auto_103128 ) ) ( not ( = ?auto_103123 ?auto_103129 ) ) ( not ( = ?auto_103123 ?auto_103130 ) ) ( not ( = ?auto_103124 ?auto_103125 ) ) ( not ( = ?auto_103124 ?auto_103126 ) ) ( not ( = ?auto_103124 ?auto_103127 ) ) ( not ( = ?auto_103124 ?auto_103128 ) ) ( not ( = ?auto_103124 ?auto_103129 ) ) ( not ( = ?auto_103124 ?auto_103130 ) ) ( not ( = ?auto_103125 ?auto_103126 ) ) ( not ( = ?auto_103125 ?auto_103127 ) ) ( not ( = ?auto_103125 ?auto_103128 ) ) ( not ( = ?auto_103125 ?auto_103129 ) ) ( not ( = ?auto_103125 ?auto_103130 ) ) ( not ( = ?auto_103126 ?auto_103127 ) ) ( not ( = ?auto_103126 ?auto_103128 ) ) ( not ( = ?auto_103126 ?auto_103129 ) ) ( not ( = ?auto_103126 ?auto_103130 ) ) ( not ( = ?auto_103127 ?auto_103128 ) ) ( not ( = ?auto_103127 ?auto_103129 ) ) ( not ( = ?auto_103127 ?auto_103130 ) ) ( not ( = ?auto_103128 ?auto_103129 ) ) ( not ( = ?auto_103128 ?auto_103130 ) ) ( not ( = ?auto_103129 ?auto_103130 ) ) ( ON ?auto_103128 ?auto_103129 ) ( ON ?auto_103127 ?auto_103128 ) ( CLEAR ?auto_103125 ) ( ON ?auto_103126 ?auto_103127 ) ( CLEAR ?auto_103126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103120 ?auto_103121 ?auto_103122 ?auto_103123 ?auto_103124 ?auto_103125 ?auto_103126 )
      ( MAKE-10PILE ?auto_103120 ?auto_103121 ?auto_103122 ?auto_103123 ?auto_103124 ?auto_103125 ?auto_103126 ?auto_103127 ?auto_103128 ?auto_103129 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103141 - BLOCK
      ?auto_103142 - BLOCK
      ?auto_103143 - BLOCK
      ?auto_103144 - BLOCK
      ?auto_103145 - BLOCK
      ?auto_103146 - BLOCK
      ?auto_103147 - BLOCK
      ?auto_103148 - BLOCK
      ?auto_103149 - BLOCK
      ?auto_103150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103150 ) ( ON-TABLE ?auto_103141 ) ( ON ?auto_103142 ?auto_103141 ) ( ON ?auto_103143 ?auto_103142 ) ( ON ?auto_103144 ?auto_103143 ) ( ON ?auto_103145 ?auto_103144 ) ( ON ?auto_103146 ?auto_103145 ) ( not ( = ?auto_103141 ?auto_103142 ) ) ( not ( = ?auto_103141 ?auto_103143 ) ) ( not ( = ?auto_103141 ?auto_103144 ) ) ( not ( = ?auto_103141 ?auto_103145 ) ) ( not ( = ?auto_103141 ?auto_103146 ) ) ( not ( = ?auto_103141 ?auto_103147 ) ) ( not ( = ?auto_103141 ?auto_103148 ) ) ( not ( = ?auto_103141 ?auto_103149 ) ) ( not ( = ?auto_103141 ?auto_103150 ) ) ( not ( = ?auto_103142 ?auto_103143 ) ) ( not ( = ?auto_103142 ?auto_103144 ) ) ( not ( = ?auto_103142 ?auto_103145 ) ) ( not ( = ?auto_103142 ?auto_103146 ) ) ( not ( = ?auto_103142 ?auto_103147 ) ) ( not ( = ?auto_103142 ?auto_103148 ) ) ( not ( = ?auto_103142 ?auto_103149 ) ) ( not ( = ?auto_103142 ?auto_103150 ) ) ( not ( = ?auto_103143 ?auto_103144 ) ) ( not ( = ?auto_103143 ?auto_103145 ) ) ( not ( = ?auto_103143 ?auto_103146 ) ) ( not ( = ?auto_103143 ?auto_103147 ) ) ( not ( = ?auto_103143 ?auto_103148 ) ) ( not ( = ?auto_103143 ?auto_103149 ) ) ( not ( = ?auto_103143 ?auto_103150 ) ) ( not ( = ?auto_103144 ?auto_103145 ) ) ( not ( = ?auto_103144 ?auto_103146 ) ) ( not ( = ?auto_103144 ?auto_103147 ) ) ( not ( = ?auto_103144 ?auto_103148 ) ) ( not ( = ?auto_103144 ?auto_103149 ) ) ( not ( = ?auto_103144 ?auto_103150 ) ) ( not ( = ?auto_103145 ?auto_103146 ) ) ( not ( = ?auto_103145 ?auto_103147 ) ) ( not ( = ?auto_103145 ?auto_103148 ) ) ( not ( = ?auto_103145 ?auto_103149 ) ) ( not ( = ?auto_103145 ?auto_103150 ) ) ( not ( = ?auto_103146 ?auto_103147 ) ) ( not ( = ?auto_103146 ?auto_103148 ) ) ( not ( = ?auto_103146 ?auto_103149 ) ) ( not ( = ?auto_103146 ?auto_103150 ) ) ( not ( = ?auto_103147 ?auto_103148 ) ) ( not ( = ?auto_103147 ?auto_103149 ) ) ( not ( = ?auto_103147 ?auto_103150 ) ) ( not ( = ?auto_103148 ?auto_103149 ) ) ( not ( = ?auto_103148 ?auto_103150 ) ) ( not ( = ?auto_103149 ?auto_103150 ) ) ( ON ?auto_103149 ?auto_103150 ) ( ON ?auto_103148 ?auto_103149 ) ( CLEAR ?auto_103146 ) ( ON ?auto_103147 ?auto_103148 ) ( CLEAR ?auto_103147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103141 ?auto_103142 ?auto_103143 ?auto_103144 ?auto_103145 ?auto_103146 ?auto_103147 )
      ( MAKE-10PILE ?auto_103141 ?auto_103142 ?auto_103143 ?auto_103144 ?auto_103145 ?auto_103146 ?auto_103147 ?auto_103148 ?auto_103149 ?auto_103150 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103161 - BLOCK
      ?auto_103162 - BLOCK
      ?auto_103163 - BLOCK
      ?auto_103164 - BLOCK
      ?auto_103165 - BLOCK
      ?auto_103166 - BLOCK
      ?auto_103167 - BLOCK
      ?auto_103168 - BLOCK
      ?auto_103169 - BLOCK
      ?auto_103170 - BLOCK
    )
    :vars
    (
      ?auto_103171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103170 ?auto_103171 ) ( ON-TABLE ?auto_103161 ) ( ON ?auto_103162 ?auto_103161 ) ( ON ?auto_103163 ?auto_103162 ) ( ON ?auto_103164 ?auto_103163 ) ( ON ?auto_103165 ?auto_103164 ) ( not ( = ?auto_103161 ?auto_103162 ) ) ( not ( = ?auto_103161 ?auto_103163 ) ) ( not ( = ?auto_103161 ?auto_103164 ) ) ( not ( = ?auto_103161 ?auto_103165 ) ) ( not ( = ?auto_103161 ?auto_103166 ) ) ( not ( = ?auto_103161 ?auto_103167 ) ) ( not ( = ?auto_103161 ?auto_103168 ) ) ( not ( = ?auto_103161 ?auto_103169 ) ) ( not ( = ?auto_103161 ?auto_103170 ) ) ( not ( = ?auto_103161 ?auto_103171 ) ) ( not ( = ?auto_103162 ?auto_103163 ) ) ( not ( = ?auto_103162 ?auto_103164 ) ) ( not ( = ?auto_103162 ?auto_103165 ) ) ( not ( = ?auto_103162 ?auto_103166 ) ) ( not ( = ?auto_103162 ?auto_103167 ) ) ( not ( = ?auto_103162 ?auto_103168 ) ) ( not ( = ?auto_103162 ?auto_103169 ) ) ( not ( = ?auto_103162 ?auto_103170 ) ) ( not ( = ?auto_103162 ?auto_103171 ) ) ( not ( = ?auto_103163 ?auto_103164 ) ) ( not ( = ?auto_103163 ?auto_103165 ) ) ( not ( = ?auto_103163 ?auto_103166 ) ) ( not ( = ?auto_103163 ?auto_103167 ) ) ( not ( = ?auto_103163 ?auto_103168 ) ) ( not ( = ?auto_103163 ?auto_103169 ) ) ( not ( = ?auto_103163 ?auto_103170 ) ) ( not ( = ?auto_103163 ?auto_103171 ) ) ( not ( = ?auto_103164 ?auto_103165 ) ) ( not ( = ?auto_103164 ?auto_103166 ) ) ( not ( = ?auto_103164 ?auto_103167 ) ) ( not ( = ?auto_103164 ?auto_103168 ) ) ( not ( = ?auto_103164 ?auto_103169 ) ) ( not ( = ?auto_103164 ?auto_103170 ) ) ( not ( = ?auto_103164 ?auto_103171 ) ) ( not ( = ?auto_103165 ?auto_103166 ) ) ( not ( = ?auto_103165 ?auto_103167 ) ) ( not ( = ?auto_103165 ?auto_103168 ) ) ( not ( = ?auto_103165 ?auto_103169 ) ) ( not ( = ?auto_103165 ?auto_103170 ) ) ( not ( = ?auto_103165 ?auto_103171 ) ) ( not ( = ?auto_103166 ?auto_103167 ) ) ( not ( = ?auto_103166 ?auto_103168 ) ) ( not ( = ?auto_103166 ?auto_103169 ) ) ( not ( = ?auto_103166 ?auto_103170 ) ) ( not ( = ?auto_103166 ?auto_103171 ) ) ( not ( = ?auto_103167 ?auto_103168 ) ) ( not ( = ?auto_103167 ?auto_103169 ) ) ( not ( = ?auto_103167 ?auto_103170 ) ) ( not ( = ?auto_103167 ?auto_103171 ) ) ( not ( = ?auto_103168 ?auto_103169 ) ) ( not ( = ?auto_103168 ?auto_103170 ) ) ( not ( = ?auto_103168 ?auto_103171 ) ) ( not ( = ?auto_103169 ?auto_103170 ) ) ( not ( = ?auto_103169 ?auto_103171 ) ) ( not ( = ?auto_103170 ?auto_103171 ) ) ( ON ?auto_103169 ?auto_103170 ) ( ON ?auto_103168 ?auto_103169 ) ( ON ?auto_103167 ?auto_103168 ) ( CLEAR ?auto_103165 ) ( ON ?auto_103166 ?auto_103167 ) ( CLEAR ?auto_103166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103161 ?auto_103162 ?auto_103163 ?auto_103164 ?auto_103165 ?auto_103166 )
      ( MAKE-10PILE ?auto_103161 ?auto_103162 ?auto_103163 ?auto_103164 ?auto_103165 ?auto_103166 ?auto_103167 ?auto_103168 ?auto_103169 ?auto_103170 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103182 - BLOCK
      ?auto_103183 - BLOCK
      ?auto_103184 - BLOCK
      ?auto_103185 - BLOCK
      ?auto_103186 - BLOCK
      ?auto_103187 - BLOCK
      ?auto_103188 - BLOCK
      ?auto_103189 - BLOCK
      ?auto_103190 - BLOCK
      ?auto_103191 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103191 ) ( ON-TABLE ?auto_103182 ) ( ON ?auto_103183 ?auto_103182 ) ( ON ?auto_103184 ?auto_103183 ) ( ON ?auto_103185 ?auto_103184 ) ( ON ?auto_103186 ?auto_103185 ) ( not ( = ?auto_103182 ?auto_103183 ) ) ( not ( = ?auto_103182 ?auto_103184 ) ) ( not ( = ?auto_103182 ?auto_103185 ) ) ( not ( = ?auto_103182 ?auto_103186 ) ) ( not ( = ?auto_103182 ?auto_103187 ) ) ( not ( = ?auto_103182 ?auto_103188 ) ) ( not ( = ?auto_103182 ?auto_103189 ) ) ( not ( = ?auto_103182 ?auto_103190 ) ) ( not ( = ?auto_103182 ?auto_103191 ) ) ( not ( = ?auto_103183 ?auto_103184 ) ) ( not ( = ?auto_103183 ?auto_103185 ) ) ( not ( = ?auto_103183 ?auto_103186 ) ) ( not ( = ?auto_103183 ?auto_103187 ) ) ( not ( = ?auto_103183 ?auto_103188 ) ) ( not ( = ?auto_103183 ?auto_103189 ) ) ( not ( = ?auto_103183 ?auto_103190 ) ) ( not ( = ?auto_103183 ?auto_103191 ) ) ( not ( = ?auto_103184 ?auto_103185 ) ) ( not ( = ?auto_103184 ?auto_103186 ) ) ( not ( = ?auto_103184 ?auto_103187 ) ) ( not ( = ?auto_103184 ?auto_103188 ) ) ( not ( = ?auto_103184 ?auto_103189 ) ) ( not ( = ?auto_103184 ?auto_103190 ) ) ( not ( = ?auto_103184 ?auto_103191 ) ) ( not ( = ?auto_103185 ?auto_103186 ) ) ( not ( = ?auto_103185 ?auto_103187 ) ) ( not ( = ?auto_103185 ?auto_103188 ) ) ( not ( = ?auto_103185 ?auto_103189 ) ) ( not ( = ?auto_103185 ?auto_103190 ) ) ( not ( = ?auto_103185 ?auto_103191 ) ) ( not ( = ?auto_103186 ?auto_103187 ) ) ( not ( = ?auto_103186 ?auto_103188 ) ) ( not ( = ?auto_103186 ?auto_103189 ) ) ( not ( = ?auto_103186 ?auto_103190 ) ) ( not ( = ?auto_103186 ?auto_103191 ) ) ( not ( = ?auto_103187 ?auto_103188 ) ) ( not ( = ?auto_103187 ?auto_103189 ) ) ( not ( = ?auto_103187 ?auto_103190 ) ) ( not ( = ?auto_103187 ?auto_103191 ) ) ( not ( = ?auto_103188 ?auto_103189 ) ) ( not ( = ?auto_103188 ?auto_103190 ) ) ( not ( = ?auto_103188 ?auto_103191 ) ) ( not ( = ?auto_103189 ?auto_103190 ) ) ( not ( = ?auto_103189 ?auto_103191 ) ) ( not ( = ?auto_103190 ?auto_103191 ) ) ( ON ?auto_103190 ?auto_103191 ) ( ON ?auto_103189 ?auto_103190 ) ( ON ?auto_103188 ?auto_103189 ) ( CLEAR ?auto_103186 ) ( ON ?auto_103187 ?auto_103188 ) ( CLEAR ?auto_103187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103182 ?auto_103183 ?auto_103184 ?auto_103185 ?auto_103186 ?auto_103187 )
      ( MAKE-10PILE ?auto_103182 ?auto_103183 ?auto_103184 ?auto_103185 ?auto_103186 ?auto_103187 ?auto_103188 ?auto_103189 ?auto_103190 ?auto_103191 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103202 - BLOCK
      ?auto_103203 - BLOCK
      ?auto_103204 - BLOCK
      ?auto_103205 - BLOCK
      ?auto_103206 - BLOCK
      ?auto_103207 - BLOCK
      ?auto_103208 - BLOCK
      ?auto_103209 - BLOCK
      ?auto_103210 - BLOCK
      ?auto_103211 - BLOCK
    )
    :vars
    (
      ?auto_103212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103211 ?auto_103212 ) ( ON-TABLE ?auto_103202 ) ( ON ?auto_103203 ?auto_103202 ) ( ON ?auto_103204 ?auto_103203 ) ( ON ?auto_103205 ?auto_103204 ) ( not ( = ?auto_103202 ?auto_103203 ) ) ( not ( = ?auto_103202 ?auto_103204 ) ) ( not ( = ?auto_103202 ?auto_103205 ) ) ( not ( = ?auto_103202 ?auto_103206 ) ) ( not ( = ?auto_103202 ?auto_103207 ) ) ( not ( = ?auto_103202 ?auto_103208 ) ) ( not ( = ?auto_103202 ?auto_103209 ) ) ( not ( = ?auto_103202 ?auto_103210 ) ) ( not ( = ?auto_103202 ?auto_103211 ) ) ( not ( = ?auto_103202 ?auto_103212 ) ) ( not ( = ?auto_103203 ?auto_103204 ) ) ( not ( = ?auto_103203 ?auto_103205 ) ) ( not ( = ?auto_103203 ?auto_103206 ) ) ( not ( = ?auto_103203 ?auto_103207 ) ) ( not ( = ?auto_103203 ?auto_103208 ) ) ( not ( = ?auto_103203 ?auto_103209 ) ) ( not ( = ?auto_103203 ?auto_103210 ) ) ( not ( = ?auto_103203 ?auto_103211 ) ) ( not ( = ?auto_103203 ?auto_103212 ) ) ( not ( = ?auto_103204 ?auto_103205 ) ) ( not ( = ?auto_103204 ?auto_103206 ) ) ( not ( = ?auto_103204 ?auto_103207 ) ) ( not ( = ?auto_103204 ?auto_103208 ) ) ( not ( = ?auto_103204 ?auto_103209 ) ) ( not ( = ?auto_103204 ?auto_103210 ) ) ( not ( = ?auto_103204 ?auto_103211 ) ) ( not ( = ?auto_103204 ?auto_103212 ) ) ( not ( = ?auto_103205 ?auto_103206 ) ) ( not ( = ?auto_103205 ?auto_103207 ) ) ( not ( = ?auto_103205 ?auto_103208 ) ) ( not ( = ?auto_103205 ?auto_103209 ) ) ( not ( = ?auto_103205 ?auto_103210 ) ) ( not ( = ?auto_103205 ?auto_103211 ) ) ( not ( = ?auto_103205 ?auto_103212 ) ) ( not ( = ?auto_103206 ?auto_103207 ) ) ( not ( = ?auto_103206 ?auto_103208 ) ) ( not ( = ?auto_103206 ?auto_103209 ) ) ( not ( = ?auto_103206 ?auto_103210 ) ) ( not ( = ?auto_103206 ?auto_103211 ) ) ( not ( = ?auto_103206 ?auto_103212 ) ) ( not ( = ?auto_103207 ?auto_103208 ) ) ( not ( = ?auto_103207 ?auto_103209 ) ) ( not ( = ?auto_103207 ?auto_103210 ) ) ( not ( = ?auto_103207 ?auto_103211 ) ) ( not ( = ?auto_103207 ?auto_103212 ) ) ( not ( = ?auto_103208 ?auto_103209 ) ) ( not ( = ?auto_103208 ?auto_103210 ) ) ( not ( = ?auto_103208 ?auto_103211 ) ) ( not ( = ?auto_103208 ?auto_103212 ) ) ( not ( = ?auto_103209 ?auto_103210 ) ) ( not ( = ?auto_103209 ?auto_103211 ) ) ( not ( = ?auto_103209 ?auto_103212 ) ) ( not ( = ?auto_103210 ?auto_103211 ) ) ( not ( = ?auto_103210 ?auto_103212 ) ) ( not ( = ?auto_103211 ?auto_103212 ) ) ( ON ?auto_103210 ?auto_103211 ) ( ON ?auto_103209 ?auto_103210 ) ( ON ?auto_103208 ?auto_103209 ) ( ON ?auto_103207 ?auto_103208 ) ( CLEAR ?auto_103205 ) ( ON ?auto_103206 ?auto_103207 ) ( CLEAR ?auto_103206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103202 ?auto_103203 ?auto_103204 ?auto_103205 ?auto_103206 )
      ( MAKE-10PILE ?auto_103202 ?auto_103203 ?auto_103204 ?auto_103205 ?auto_103206 ?auto_103207 ?auto_103208 ?auto_103209 ?auto_103210 ?auto_103211 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103223 - BLOCK
      ?auto_103224 - BLOCK
      ?auto_103225 - BLOCK
      ?auto_103226 - BLOCK
      ?auto_103227 - BLOCK
      ?auto_103228 - BLOCK
      ?auto_103229 - BLOCK
      ?auto_103230 - BLOCK
      ?auto_103231 - BLOCK
      ?auto_103232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103232 ) ( ON-TABLE ?auto_103223 ) ( ON ?auto_103224 ?auto_103223 ) ( ON ?auto_103225 ?auto_103224 ) ( ON ?auto_103226 ?auto_103225 ) ( not ( = ?auto_103223 ?auto_103224 ) ) ( not ( = ?auto_103223 ?auto_103225 ) ) ( not ( = ?auto_103223 ?auto_103226 ) ) ( not ( = ?auto_103223 ?auto_103227 ) ) ( not ( = ?auto_103223 ?auto_103228 ) ) ( not ( = ?auto_103223 ?auto_103229 ) ) ( not ( = ?auto_103223 ?auto_103230 ) ) ( not ( = ?auto_103223 ?auto_103231 ) ) ( not ( = ?auto_103223 ?auto_103232 ) ) ( not ( = ?auto_103224 ?auto_103225 ) ) ( not ( = ?auto_103224 ?auto_103226 ) ) ( not ( = ?auto_103224 ?auto_103227 ) ) ( not ( = ?auto_103224 ?auto_103228 ) ) ( not ( = ?auto_103224 ?auto_103229 ) ) ( not ( = ?auto_103224 ?auto_103230 ) ) ( not ( = ?auto_103224 ?auto_103231 ) ) ( not ( = ?auto_103224 ?auto_103232 ) ) ( not ( = ?auto_103225 ?auto_103226 ) ) ( not ( = ?auto_103225 ?auto_103227 ) ) ( not ( = ?auto_103225 ?auto_103228 ) ) ( not ( = ?auto_103225 ?auto_103229 ) ) ( not ( = ?auto_103225 ?auto_103230 ) ) ( not ( = ?auto_103225 ?auto_103231 ) ) ( not ( = ?auto_103225 ?auto_103232 ) ) ( not ( = ?auto_103226 ?auto_103227 ) ) ( not ( = ?auto_103226 ?auto_103228 ) ) ( not ( = ?auto_103226 ?auto_103229 ) ) ( not ( = ?auto_103226 ?auto_103230 ) ) ( not ( = ?auto_103226 ?auto_103231 ) ) ( not ( = ?auto_103226 ?auto_103232 ) ) ( not ( = ?auto_103227 ?auto_103228 ) ) ( not ( = ?auto_103227 ?auto_103229 ) ) ( not ( = ?auto_103227 ?auto_103230 ) ) ( not ( = ?auto_103227 ?auto_103231 ) ) ( not ( = ?auto_103227 ?auto_103232 ) ) ( not ( = ?auto_103228 ?auto_103229 ) ) ( not ( = ?auto_103228 ?auto_103230 ) ) ( not ( = ?auto_103228 ?auto_103231 ) ) ( not ( = ?auto_103228 ?auto_103232 ) ) ( not ( = ?auto_103229 ?auto_103230 ) ) ( not ( = ?auto_103229 ?auto_103231 ) ) ( not ( = ?auto_103229 ?auto_103232 ) ) ( not ( = ?auto_103230 ?auto_103231 ) ) ( not ( = ?auto_103230 ?auto_103232 ) ) ( not ( = ?auto_103231 ?auto_103232 ) ) ( ON ?auto_103231 ?auto_103232 ) ( ON ?auto_103230 ?auto_103231 ) ( ON ?auto_103229 ?auto_103230 ) ( ON ?auto_103228 ?auto_103229 ) ( CLEAR ?auto_103226 ) ( ON ?auto_103227 ?auto_103228 ) ( CLEAR ?auto_103227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103223 ?auto_103224 ?auto_103225 ?auto_103226 ?auto_103227 )
      ( MAKE-10PILE ?auto_103223 ?auto_103224 ?auto_103225 ?auto_103226 ?auto_103227 ?auto_103228 ?auto_103229 ?auto_103230 ?auto_103231 ?auto_103232 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103243 - BLOCK
      ?auto_103244 - BLOCK
      ?auto_103245 - BLOCK
      ?auto_103246 - BLOCK
      ?auto_103247 - BLOCK
      ?auto_103248 - BLOCK
      ?auto_103249 - BLOCK
      ?auto_103250 - BLOCK
      ?auto_103251 - BLOCK
      ?auto_103252 - BLOCK
    )
    :vars
    (
      ?auto_103253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103252 ?auto_103253 ) ( ON-TABLE ?auto_103243 ) ( ON ?auto_103244 ?auto_103243 ) ( ON ?auto_103245 ?auto_103244 ) ( not ( = ?auto_103243 ?auto_103244 ) ) ( not ( = ?auto_103243 ?auto_103245 ) ) ( not ( = ?auto_103243 ?auto_103246 ) ) ( not ( = ?auto_103243 ?auto_103247 ) ) ( not ( = ?auto_103243 ?auto_103248 ) ) ( not ( = ?auto_103243 ?auto_103249 ) ) ( not ( = ?auto_103243 ?auto_103250 ) ) ( not ( = ?auto_103243 ?auto_103251 ) ) ( not ( = ?auto_103243 ?auto_103252 ) ) ( not ( = ?auto_103243 ?auto_103253 ) ) ( not ( = ?auto_103244 ?auto_103245 ) ) ( not ( = ?auto_103244 ?auto_103246 ) ) ( not ( = ?auto_103244 ?auto_103247 ) ) ( not ( = ?auto_103244 ?auto_103248 ) ) ( not ( = ?auto_103244 ?auto_103249 ) ) ( not ( = ?auto_103244 ?auto_103250 ) ) ( not ( = ?auto_103244 ?auto_103251 ) ) ( not ( = ?auto_103244 ?auto_103252 ) ) ( not ( = ?auto_103244 ?auto_103253 ) ) ( not ( = ?auto_103245 ?auto_103246 ) ) ( not ( = ?auto_103245 ?auto_103247 ) ) ( not ( = ?auto_103245 ?auto_103248 ) ) ( not ( = ?auto_103245 ?auto_103249 ) ) ( not ( = ?auto_103245 ?auto_103250 ) ) ( not ( = ?auto_103245 ?auto_103251 ) ) ( not ( = ?auto_103245 ?auto_103252 ) ) ( not ( = ?auto_103245 ?auto_103253 ) ) ( not ( = ?auto_103246 ?auto_103247 ) ) ( not ( = ?auto_103246 ?auto_103248 ) ) ( not ( = ?auto_103246 ?auto_103249 ) ) ( not ( = ?auto_103246 ?auto_103250 ) ) ( not ( = ?auto_103246 ?auto_103251 ) ) ( not ( = ?auto_103246 ?auto_103252 ) ) ( not ( = ?auto_103246 ?auto_103253 ) ) ( not ( = ?auto_103247 ?auto_103248 ) ) ( not ( = ?auto_103247 ?auto_103249 ) ) ( not ( = ?auto_103247 ?auto_103250 ) ) ( not ( = ?auto_103247 ?auto_103251 ) ) ( not ( = ?auto_103247 ?auto_103252 ) ) ( not ( = ?auto_103247 ?auto_103253 ) ) ( not ( = ?auto_103248 ?auto_103249 ) ) ( not ( = ?auto_103248 ?auto_103250 ) ) ( not ( = ?auto_103248 ?auto_103251 ) ) ( not ( = ?auto_103248 ?auto_103252 ) ) ( not ( = ?auto_103248 ?auto_103253 ) ) ( not ( = ?auto_103249 ?auto_103250 ) ) ( not ( = ?auto_103249 ?auto_103251 ) ) ( not ( = ?auto_103249 ?auto_103252 ) ) ( not ( = ?auto_103249 ?auto_103253 ) ) ( not ( = ?auto_103250 ?auto_103251 ) ) ( not ( = ?auto_103250 ?auto_103252 ) ) ( not ( = ?auto_103250 ?auto_103253 ) ) ( not ( = ?auto_103251 ?auto_103252 ) ) ( not ( = ?auto_103251 ?auto_103253 ) ) ( not ( = ?auto_103252 ?auto_103253 ) ) ( ON ?auto_103251 ?auto_103252 ) ( ON ?auto_103250 ?auto_103251 ) ( ON ?auto_103249 ?auto_103250 ) ( ON ?auto_103248 ?auto_103249 ) ( ON ?auto_103247 ?auto_103248 ) ( CLEAR ?auto_103245 ) ( ON ?auto_103246 ?auto_103247 ) ( CLEAR ?auto_103246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103243 ?auto_103244 ?auto_103245 ?auto_103246 )
      ( MAKE-10PILE ?auto_103243 ?auto_103244 ?auto_103245 ?auto_103246 ?auto_103247 ?auto_103248 ?auto_103249 ?auto_103250 ?auto_103251 ?auto_103252 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103264 - BLOCK
      ?auto_103265 - BLOCK
      ?auto_103266 - BLOCK
      ?auto_103267 - BLOCK
      ?auto_103268 - BLOCK
      ?auto_103269 - BLOCK
      ?auto_103270 - BLOCK
      ?auto_103271 - BLOCK
      ?auto_103272 - BLOCK
      ?auto_103273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103273 ) ( ON-TABLE ?auto_103264 ) ( ON ?auto_103265 ?auto_103264 ) ( ON ?auto_103266 ?auto_103265 ) ( not ( = ?auto_103264 ?auto_103265 ) ) ( not ( = ?auto_103264 ?auto_103266 ) ) ( not ( = ?auto_103264 ?auto_103267 ) ) ( not ( = ?auto_103264 ?auto_103268 ) ) ( not ( = ?auto_103264 ?auto_103269 ) ) ( not ( = ?auto_103264 ?auto_103270 ) ) ( not ( = ?auto_103264 ?auto_103271 ) ) ( not ( = ?auto_103264 ?auto_103272 ) ) ( not ( = ?auto_103264 ?auto_103273 ) ) ( not ( = ?auto_103265 ?auto_103266 ) ) ( not ( = ?auto_103265 ?auto_103267 ) ) ( not ( = ?auto_103265 ?auto_103268 ) ) ( not ( = ?auto_103265 ?auto_103269 ) ) ( not ( = ?auto_103265 ?auto_103270 ) ) ( not ( = ?auto_103265 ?auto_103271 ) ) ( not ( = ?auto_103265 ?auto_103272 ) ) ( not ( = ?auto_103265 ?auto_103273 ) ) ( not ( = ?auto_103266 ?auto_103267 ) ) ( not ( = ?auto_103266 ?auto_103268 ) ) ( not ( = ?auto_103266 ?auto_103269 ) ) ( not ( = ?auto_103266 ?auto_103270 ) ) ( not ( = ?auto_103266 ?auto_103271 ) ) ( not ( = ?auto_103266 ?auto_103272 ) ) ( not ( = ?auto_103266 ?auto_103273 ) ) ( not ( = ?auto_103267 ?auto_103268 ) ) ( not ( = ?auto_103267 ?auto_103269 ) ) ( not ( = ?auto_103267 ?auto_103270 ) ) ( not ( = ?auto_103267 ?auto_103271 ) ) ( not ( = ?auto_103267 ?auto_103272 ) ) ( not ( = ?auto_103267 ?auto_103273 ) ) ( not ( = ?auto_103268 ?auto_103269 ) ) ( not ( = ?auto_103268 ?auto_103270 ) ) ( not ( = ?auto_103268 ?auto_103271 ) ) ( not ( = ?auto_103268 ?auto_103272 ) ) ( not ( = ?auto_103268 ?auto_103273 ) ) ( not ( = ?auto_103269 ?auto_103270 ) ) ( not ( = ?auto_103269 ?auto_103271 ) ) ( not ( = ?auto_103269 ?auto_103272 ) ) ( not ( = ?auto_103269 ?auto_103273 ) ) ( not ( = ?auto_103270 ?auto_103271 ) ) ( not ( = ?auto_103270 ?auto_103272 ) ) ( not ( = ?auto_103270 ?auto_103273 ) ) ( not ( = ?auto_103271 ?auto_103272 ) ) ( not ( = ?auto_103271 ?auto_103273 ) ) ( not ( = ?auto_103272 ?auto_103273 ) ) ( ON ?auto_103272 ?auto_103273 ) ( ON ?auto_103271 ?auto_103272 ) ( ON ?auto_103270 ?auto_103271 ) ( ON ?auto_103269 ?auto_103270 ) ( ON ?auto_103268 ?auto_103269 ) ( CLEAR ?auto_103266 ) ( ON ?auto_103267 ?auto_103268 ) ( CLEAR ?auto_103267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103264 ?auto_103265 ?auto_103266 ?auto_103267 )
      ( MAKE-10PILE ?auto_103264 ?auto_103265 ?auto_103266 ?auto_103267 ?auto_103268 ?auto_103269 ?auto_103270 ?auto_103271 ?auto_103272 ?auto_103273 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103284 - BLOCK
      ?auto_103285 - BLOCK
      ?auto_103286 - BLOCK
      ?auto_103287 - BLOCK
      ?auto_103288 - BLOCK
      ?auto_103289 - BLOCK
      ?auto_103290 - BLOCK
      ?auto_103291 - BLOCK
      ?auto_103292 - BLOCK
      ?auto_103293 - BLOCK
    )
    :vars
    (
      ?auto_103294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103293 ?auto_103294 ) ( ON-TABLE ?auto_103284 ) ( ON ?auto_103285 ?auto_103284 ) ( not ( = ?auto_103284 ?auto_103285 ) ) ( not ( = ?auto_103284 ?auto_103286 ) ) ( not ( = ?auto_103284 ?auto_103287 ) ) ( not ( = ?auto_103284 ?auto_103288 ) ) ( not ( = ?auto_103284 ?auto_103289 ) ) ( not ( = ?auto_103284 ?auto_103290 ) ) ( not ( = ?auto_103284 ?auto_103291 ) ) ( not ( = ?auto_103284 ?auto_103292 ) ) ( not ( = ?auto_103284 ?auto_103293 ) ) ( not ( = ?auto_103284 ?auto_103294 ) ) ( not ( = ?auto_103285 ?auto_103286 ) ) ( not ( = ?auto_103285 ?auto_103287 ) ) ( not ( = ?auto_103285 ?auto_103288 ) ) ( not ( = ?auto_103285 ?auto_103289 ) ) ( not ( = ?auto_103285 ?auto_103290 ) ) ( not ( = ?auto_103285 ?auto_103291 ) ) ( not ( = ?auto_103285 ?auto_103292 ) ) ( not ( = ?auto_103285 ?auto_103293 ) ) ( not ( = ?auto_103285 ?auto_103294 ) ) ( not ( = ?auto_103286 ?auto_103287 ) ) ( not ( = ?auto_103286 ?auto_103288 ) ) ( not ( = ?auto_103286 ?auto_103289 ) ) ( not ( = ?auto_103286 ?auto_103290 ) ) ( not ( = ?auto_103286 ?auto_103291 ) ) ( not ( = ?auto_103286 ?auto_103292 ) ) ( not ( = ?auto_103286 ?auto_103293 ) ) ( not ( = ?auto_103286 ?auto_103294 ) ) ( not ( = ?auto_103287 ?auto_103288 ) ) ( not ( = ?auto_103287 ?auto_103289 ) ) ( not ( = ?auto_103287 ?auto_103290 ) ) ( not ( = ?auto_103287 ?auto_103291 ) ) ( not ( = ?auto_103287 ?auto_103292 ) ) ( not ( = ?auto_103287 ?auto_103293 ) ) ( not ( = ?auto_103287 ?auto_103294 ) ) ( not ( = ?auto_103288 ?auto_103289 ) ) ( not ( = ?auto_103288 ?auto_103290 ) ) ( not ( = ?auto_103288 ?auto_103291 ) ) ( not ( = ?auto_103288 ?auto_103292 ) ) ( not ( = ?auto_103288 ?auto_103293 ) ) ( not ( = ?auto_103288 ?auto_103294 ) ) ( not ( = ?auto_103289 ?auto_103290 ) ) ( not ( = ?auto_103289 ?auto_103291 ) ) ( not ( = ?auto_103289 ?auto_103292 ) ) ( not ( = ?auto_103289 ?auto_103293 ) ) ( not ( = ?auto_103289 ?auto_103294 ) ) ( not ( = ?auto_103290 ?auto_103291 ) ) ( not ( = ?auto_103290 ?auto_103292 ) ) ( not ( = ?auto_103290 ?auto_103293 ) ) ( not ( = ?auto_103290 ?auto_103294 ) ) ( not ( = ?auto_103291 ?auto_103292 ) ) ( not ( = ?auto_103291 ?auto_103293 ) ) ( not ( = ?auto_103291 ?auto_103294 ) ) ( not ( = ?auto_103292 ?auto_103293 ) ) ( not ( = ?auto_103292 ?auto_103294 ) ) ( not ( = ?auto_103293 ?auto_103294 ) ) ( ON ?auto_103292 ?auto_103293 ) ( ON ?auto_103291 ?auto_103292 ) ( ON ?auto_103290 ?auto_103291 ) ( ON ?auto_103289 ?auto_103290 ) ( ON ?auto_103288 ?auto_103289 ) ( ON ?auto_103287 ?auto_103288 ) ( CLEAR ?auto_103285 ) ( ON ?auto_103286 ?auto_103287 ) ( CLEAR ?auto_103286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103284 ?auto_103285 ?auto_103286 )
      ( MAKE-10PILE ?auto_103284 ?auto_103285 ?auto_103286 ?auto_103287 ?auto_103288 ?auto_103289 ?auto_103290 ?auto_103291 ?auto_103292 ?auto_103293 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103305 - BLOCK
      ?auto_103306 - BLOCK
      ?auto_103307 - BLOCK
      ?auto_103308 - BLOCK
      ?auto_103309 - BLOCK
      ?auto_103310 - BLOCK
      ?auto_103311 - BLOCK
      ?auto_103312 - BLOCK
      ?auto_103313 - BLOCK
      ?auto_103314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103314 ) ( ON-TABLE ?auto_103305 ) ( ON ?auto_103306 ?auto_103305 ) ( not ( = ?auto_103305 ?auto_103306 ) ) ( not ( = ?auto_103305 ?auto_103307 ) ) ( not ( = ?auto_103305 ?auto_103308 ) ) ( not ( = ?auto_103305 ?auto_103309 ) ) ( not ( = ?auto_103305 ?auto_103310 ) ) ( not ( = ?auto_103305 ?auto_103311 ) ) ( not ( = ?auto_103305 ?auto_103312 ) ) ( not ( = ?auto_103305 ?auto_103313 ) ) ( not ( = ?auto_103305 ?auto_103314 ) ) ( not ( = ?auto_103306 ?auto_103307 ) ) ( not ( = ?auto_103306 ?auto_103308 ) ) ( not ( = ?auto_103306 ?auto_103309 ) ) ( not ( = ?auto_103306 ?auto_103310 ) ) ( not ( = ?auto_103306 ?auto_103311 ) ) ( not ( = ?auto_103306 ?auto_103312 ) ) ( not ( = ?auto_103306 ?auto_103313 ) ) ( not ( = ?auto_103306 ?auto_103314 ) ) ( not ( = ?auto_103307 ?auto_103308 ) ) ( not ( = ?auto_103307 ?auto_103309 ) ) ( not ( = ?auto_103307 ?auto_103310 ) ) ( not ( = ?auto_103307 ?auto_103311 ) ) ( not ( = ?auto_103307 ?auto_103312 ) ) ( not ( = ?auto_103307 ?auto_103313 ) ) ( not ( = ?auto_103307 ?auto_103314 ) ) ( not ( = ?auto_103308 ?auto_103309 ) ) ( not ( = ?auto_103308 ?auto_103310 ) ) ( not ( = ?auto_103308 ?auto_103311 ) ) ( not ( = ?auto_103308 ?auto_103312 ) ) ( not ( = ?auto_103308 ?auto_103313 ) ) ( not ( = ?auto_103308 ?auto_103314 ) ) ( not ( = ?auto_103309 ?auto_103310 ) ) ( not ( = ?auto_103309 ?auto_103311 ) ) ( not ( = ?auto_103309 ?auto_103312 ) ) ( not ( = ?auto_103309 ?auto_103313 ) ) ( not ( = ?auto_103309 ?auto_103314 ) ) ( not ( = ?auto_103310 ?auto_103311 ) ) ( not ( = ?auto_103310 ?auto_103312 ) ) ( not ( = ?auto_103310 ?auto_103313 ) ) ( not ( = ?auto_103310 ?auto_103314 ) ) ( not ( = ?auto_103311 ?auto_103312 ) ) ( not ( = ?auto_103311 ?auto_103313 ) ) ( not ( = ?auto_103311 ?auto_103314 ) ) ( not ( = ?auto_103312 ?auto_103313 ) ) ( not ( = ?auto_103312 ?auto_103314 ) ) ( not ( = ?auto_103313 ?auto_103314 ) ) ( ON ?auto_103313 ?auto_103314 ) ( ON ?auto_103312 ?auto_103313 ) ( ON ?auto_103311 ?auto_103312 ) ( ON ?auto_103310 ?auto_103311 ) ( ON ?auto_103309 ?auto_103310 ) ( ON ?auto_103308 ?auto_103309 ) ( CLEAR ?auto_103306 ) ( ON ?auto_103307 ?auto_103308 ) ( CLEAR ?auto_103307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103305 ?auto_103306 ?auto_103307 )
      ( MAKE-10PILE ?auto_103305 ?auto_103306 ?auto_103307 ?auto_103308 ?auto_103309 ?auto_103310 ?auto_103311 ?auto_103312 ?auto_103313 ?auto_103314 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103325 - BLOCK
      ?auto_103326 - BLOCK
      ?auto_103327 - BLOCK
      ?auto_103328 - BLOCK
      ?auto_103329 - BLOCK
      ?auto_103330 - BLOCK
      ?auto_103331 - BLOCK
      ?auto_103332 - BLOCK
      ?auto_103333 - BLOCK
      ?auto_103334 - BLOCK
    )
    :vars
    (
      ?auto_103335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103334 ?auto_103335 ) ( ON-TABLE ?auto_103325 ) ( not ( = ?auto_103325 ?auto_103326 ) ) ( not ( = ?auto_103325 ?auto_103327 ) ) ( not ( = ?auto_103325 ?auto_103328 ) ) ( not ( = ?auto_103325 ?auto_103329 ) ) ( not ( = ?auto_103325 ?auto_103330 ) ) ( not ( = ?auto_103325 ?auto_103331 ) ) ( not ( = ?auto_103325 ?auto_103332 ) ) ( not ( = ?auto_103325 ?auto_103333 ) ) ( not ( = ?auto_103325 ?auto_103334 ) ) ( not ( = ?auto_103325 ?auto_103335 ) ) ( not ( = ?auto_103326 ?auto_103327 ) ) ( not ( = ?auto_103326 ?auto_103328 ) ) ( not ( = ?auto_103326 ?auto_103329 ) ) ( not ( = ?auto_103326 ?auto_103330 ) ) ( not ( = ?auto_103326 ?auto_103331 ) ) ( not ( = ?auto_103326 ?auto_103332 ) ) ( not ( = ?auto_103326 ?auto_103333 ) ) ( not ( = ?auto_103326 ?auto_103334 ) ) ( not ( = ?auto_103326 ?auto_103335 ) ) ( not ( = ?auto_103327 ?auto_103328 ) ) ( not ( = ?auto_103327 ?auto_103329 ) ) ( not ( = ?auto_103327 ?auto_103330 ) ) ( not ( = ?auto_103327 ?auto_103331 ) ) ( not ( = ?auto_103327 ?auto_103332 ) ) ( not ( = ?auto_103327 ?auto_103333 ) ) ( not ( = ?auto_103327 ?auto_103334 ) ) ( not ( = ?auto_103327 ?auto_103335 ) ) ( not ( = ?auto_103328 ?auto_103329 ) ) ( not ( = ?auto_103328 ?auto_103330 ) ) ( not ( = ?auto_103328 ?auto_103331 ) ) ( not ( = ?auto_103328 ?auto_103332 ) ) ( not ( = ?auto_103328 ?auto_103333 ) ) ( not ( = ?auto_103328 ?auto_103334 ) ) ( not ( = ?auto_103328 ?auto_103335 ) ) ( not ( = ?auto_103329 ?auto_103330 ) ) ( not ( = ?auto_103329 ?auto_103331 ) ) ( not ( = ?auto_103329 ?auto_103332 ) ) ( not ( = ?auto_103329 ?auto_103333 ) ) ( not ( = ?auto_103329 ?auto_103334 ) ) ( not ( = ?auto_103329 ?auto_103335 ) ) ( not ( = ?auto_103330 ?auto_103331 ) ) ( not ( = ?auto_103330 ?auto_103332 ) ) ( not ( = ?auto_103330 ?auto_103333 ) ) ( not ( = ?auto_103330 ?auto_103334 ) ) ( not ( = ?auto_103330 ?auto_103335 ) ) ( not ( = ?auto_103331 ?auto_103332 ) ) ( not ( = ?auto_103331 ?auto_103333 ) ) ( not ( = ?auto_103331 ?auto_103334 ) ) ( not ( = ?auto_103331 ?auto_103335 ) ) ( not ( = ?auto_103332 ?auto_103333 ) ) ( not ( = ?auto_103332 ?auto_103334 ) ) ( not ( = ?auto_103332 ?auto_103335 ) ) ( not ( = ?auto_103333 ?auto_103334 ) ) ( not ( = ?auto_103333 ?auto_103335 ) ) ( not ( = ?auto_103334 ?auto_103335 ) ) ( ON ?auto_103333 ?auto_103334 ) ( ON ?auto_103332 ?auto_103333 ) ( ON ?auto_103331 ?auto_103332 ) ( ON ?auto_103330 ?auto_103331 ) ( ON ?auto_103329 ?auto_103330 ) ( ON ?auto_103328 ?auto_103329 ) ( ON ?auto_103327 ?auto_103328 ) ( CLEAR ?auto_103325 ) ( ON ?auto_103326 ?auto_103327 ) ( CLEAR ?auto_103326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103325 ?auto_103326 )
      ( MAKE-10PILE ?auto_103325 ?auto_103326 ?auto_103327 ?auto_103328 ?auto_103329 ?auto_103330 ?auto_103331 ?auto_103332 ?auto_103333 ?auto_103334 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103346 - BLOCK
      ?auto_103347 - BLOCK
      ?auto_103348 - BLOCK
      ?auto_103349 - BLOCK
      ?auto_103350 - BLOCK
      ?auto_103351 - BLOCK
      ?auto_103352 - BLOCK
      ?auto_103353 - BLOCK
      ?auto_103354 - BLOCK
      ?auto_103355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103355 ) ( ON-TABLE ?auto_103346 ) ( not ( = ?auto_103346 ?auto_103347 ) ) ( not ( = ?auto_103346 ?auto_103348 ) ) ( not ( = ?auto_103346 ?auto_103349 ) ) ( not ( = ?auto_103346 ?auto_103350 ) ) ( not ( = ?auto_103346 ?auto_103351 ) ) ( not ( = ?auto_103346 ?auto_103352 ) ) ( not ( = ?auto_103346 ?auto_103353 ) ) ( not ( = ?auto_103346 ?auto_103354 ) ) ( not ( = ?auto_103346 ?auto_103355 ) ) ( not ( = ?auto_103347 ?auto_103348 ) ) ( not ( = ?auto_103347 ?auto_103349 ) ) ( not ( = ?auto_103347 ?auto_103350 ) ) ( not ( = ?auto_103347 ?auto_103351 ) ) ( not ( = ?auto_103347 ?auto_103352 ) ) ( not ( = ?auto_103347 ?auto_103353 ) ) ( not ( = ?auto_103347 ?auto_103354 ) ) ( not ( = ?auto_103347 ?auto_103355 ) ) ( not ( = ?auto_103348 ?auto_103349 ) ) ( not ( = ?auto_103348 ?auto_103350 ) ) ( not ( = ?auto_103348 ?auto_103351 ) ) ( not ( = ?auto_103348 ?auto_103352 ) ) ( not ( = ?auto_103348 ?auto_103353 ) ) ( not ( = ?auto_103348 ?auto_103354 ) ) ( not ( = ?auto_103348 ?auto_103355 ) ) ( not ( = ?auto_103349 ?auto_103350 ) ) ( not ( = ?auto_103349 ?auto_103351 ) ) ( not ( = ?auto_103349 ?auto_103352 ) ) ( not ( = ?auto_103349 ?auto_103353 ) ) ( not ( = ?auto_103349 ?auto_103354 ) ) ( not ( = ?auto_103349 ?auto_103355 ) ) ( not ( = ?auto_103350 ?auto_103351 ) ) ( not ( = ?auto_103350 ?auto_103352 ) ) ( not ( = ?auto_103350 ?auto_103353 ) ) ( not ( = ?auto_103350 ?auto_103354 ) ) ( not ( = ?auto_103350 ?auto_103355 ) ) ( not ( = ?auto_103351 ?auto_103352 ) ) ( not ( = ?auto_103351 ?auto_103353 ) ) ( not ( = ?auto_103351 ?auto_103354 ) ) ( not ( = ?auto_103351 ?auto_103355 ) ) ( not ( = ?auto_103352 ?auto_103353 ) ) ( not ( = ?auto_103352 ?auto_103354 ) ) ( not ( = ?auto_103352 ?auto_103355 ) ) ( not ( = ?auto_103353 ?auto_103354 ) ) ( not ( = ?auto_103353 ?auto_103355 ) ) ( not ( = ?auto_103354 ?auto_103355 ) ) ( ON ?auto_103354 ?auto_103355 ) ( ON ?auto_103353 ?auto_103354 ) ( ON ?auto_103352 ?auto_103353 ) ( ON ?auto_103351 ?auto_103352 ) ( ON ?auto_103350 ?auto_103351 ) ( ON ?auto_103349 ?auto_103350 ) ( ON ?auto_103348 ?auto_103349 ) ( CLEAR ?auto_103346 ) ( ON ?auto_103347 ?auto_103348 ) ( CLEAR ?auto_103347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103346 ?auto_103347 )
      ( MAKE-10PILE ?auto_103346 ?auto_103347 ?auto_103348 ?auto_103349 ?auto_103350 ?auto_103351 ?auto_103352 ?auto_103353 ?auto_103354 ?auto_103355 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103366 - BLOCK
      ?auto_103367 - BLOCK
      ?auto_103368 - BLOCK
      ?auto_103369 - BLOCK
      ?auto_103370 - BLOCK
      ?auto_103371 - BLOCK
      ?auto_103372 - BLOCK
      ?auto_103373 - BLOCK
      ?auto_103374 - BLOCK
      ?auto_103375 - BLOCK
    )
    :vars
    (
      ?auto_103376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103375 ?auto_103376 ) ( not ( = ?auto_103366 ?auto_103367 ) ) ( not ( = ?auto_103366 ?auto_103368 ) ) ( not ( = ?auto_103366 ?auto_103369 ) ) ( not ( = ?auto_103366 ?auto_103370 ) ) ( not ( = ?auto_103366 ?auto_103371 ) ) ( not ( = ?auto_103366 ?auto_103372 ) ) ( not ( = ?auto_103366 ?auto_103373 ) ) ( not ( = ?auto_103366 ?auto_103374 ) ) ( not ( = ?auto_103366 ?auto_103375 ) ) ( not ( = ?auto_103366 ?auto_103376 ) ) ( not ( = ?auto_103367 ?auto_103368 ) ) ( not ( = ?auto_103367 ?auto_103369 ) ) ( not ( = ?auto_103367 ?auto_103370 ) ) ( not ( = ?auto_103367 ?auto_103371 ) ) ( not ( = ?auto_103367 ?auto_103372 ) ) ( not ( = ?auto_103367 ?auto_103373 ) ) ( not ( = ?auto_103367 ?auto_103374 ) ) ( not ( = ?auto_103367 ?auto_103375 ) ) ( not ( = ?auto_103367 ?auto_103376 ) ) ( not ( = ?auto_103368 ?auto_103369 ) ) ( not ( = ?auto_103368 ?auto_103370 ) ) ( not ( = ?auto_103368 ?auto_103371 ) ) ( not ( = ?auto_103368 ?auto_103372 ) ) ( not ( = ?auto_103368 ?auto_103373 ) ) ( not ( = ?auto_103368 ?auto_103374 ) ) ( not ( = ?auto_103368 ?auto_103375 ) ) ( not ( = ?auto_103368 ?auto_103376 ) ) ( not ( = ?auto_103369 ?auto_103370 ) ) ( not ( = ?auto_103369 ?auto_103371 ) ) ( not ( = ?auto_103369 ?auto_103372 ) ) ( not ( = ?auto_103369 ?auto_103373 ) ) ( not ( = ?auto_103369 ?auto_103374 ) ) ( not ( = ?auto_103369 ?auto_103375 ) ) ( not ( = ?auto_103369 ?auto_103376 ) ) ( not ( = ?auto_103370 ?auto_103371 ) ) ( not ( = ?auto_103370 ?auto_103372 ) ) ( not ( = ?auto_103370 ?auto_103373 ) ) ( not ( = ?auto_103370 ?auto_103374 ) ) ( not ( = ?auto_103370 ?auto_103375 ) ) ( not ( = ?auto_103370 ?auto_103376 ) ) ( not ( = ?auto_103371 ?auto_103372 ) ) ( not ( = ?auto_103371 ?auto_103373 ) ) ( not ( = ?auto_103371 ?auto_103374 ) ) ( not ( = ?auto_103371 ?auto_103375 ) ) ( not ( = ?auto_103371 ?auto_103376 ) ) ( not ( = ?auto_103372 ?auto_103373 ) ) ( not ( = ?auto_103372 ?auto_103374 ) ) ( not ( = ?auto_103372 ?auto_103375 ) ) ( not ( = ?auto_103372 ?auto_103376 ) ) ( not ( = ?auto_103373 ?auto_103374 ) ) ( not ( = ?auto_103373 ?auto_103375 ) ) ( not ( = ?auto_103373 ?auto_103376 ) ) ( not ( = ?auto_103374 ?auto_103375 ) ) ( not ( = ?auto_103374 ?auto_103376 ) ) ( not ( = ?auto_103375 ?auto_103376 ) ) ( ON ?auto_103374 ?auto_103375 ) ( ON ?auto_103373 ?auto_103374 ) ( ON ?auto_103372 ?auto_103373 ) ( ON ?auto_103371 ?auto_103372 ) ( ON ?auto_103370 ?auto_103371 ) ( ON ?auto_103369 ?auto_103370 ) ( ON ?auto_103368 ?auto_103369 ) ( ON ?auto_103367 ?auto_103368 ) ( ON ?auto_103366 ?auto_103367 ) ( CLEAR ?auto_103366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103366 )
      ( MAKE-10PILE ?auto_103366 ?auto_103367 ?auto_103368 ?auto_103369 ?auto_103370 ?auto_103371 ?auto_103372 ?auto_103373 ?auto_103374 ?auto_103375 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103387 - BLOCK
      ?auto_103388 - BLOCK
      ?auto_103389 - BLOCK
      ?auto_103390 - BLOCK
      ?auto_103391 - BLOCK
      ?auto_103392 - BLOCK
      ?auto_103393 - BLOCK
      ?auto_103394 - BLOCK
      ?auto_103395 - BLOCK
      ?auto_103396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103396 ) ( not ( = ?auto_103387 ?auto_103388 ) ) ( not ( = ?auto_103387 ?auto_103389 ) ) ( not ( = ?auto_103387 ?auto_103390 ) ) ( not ( = ?auto_103387 ?auto_103391 ) ) ( not ( = ?auto_103387 ?auto_103392 ) ) ( not ( = ?auto_103387 ?auto_103393 ) ) ( not ( = ?auto_103387 ?auto_103394 ) ) ( not ( = ?auto_103387 ?auto_103395 ) ) ( not ( = ?auto_103387 ?auto_103396 ) ) ( not ( = ?auto_103388 ?auto_103389 ) ) ( not ( = ?auto_103388 ?auto_103390 ) ) ( not ( = ?auto_103388 ?auto_103391 ) ) ( not ( = ?auto_103388 ?auto_103392 ) ) ( not ( = ?auto_103388 ?auto_103393 ) ) ( not ( = ?auto_103388 ?auto_103394 ) ) ( not ( = ?auto_103388 ?auto_103395 ) ) ( not ( = ?auto_103388 ?auto_103396 ) ) ( not ( = ?auto_103389 ?auto_103390 ) ) ( not ( = ?auto_103389 ?auto_103391 ) ) ( not ( = ?auto_103389 ?auto_103392 ) ) ( not ( = ?auto_103389 ?auto_103393 ) ) ( not ( = ?auto_103389 ?auto_103394 ) ) ( not ( = ?auto_103389 ?auto_103395 ) ) ( not ( = ?auto_103389 ?auto_103396 ) ) ( not ( = ?auto_103390 ?auto_103391 ) ) ( not ( = ?auto_103390 ?auto_103392 ) ) ( not ( = ?auto_103390 ?auto_103393 ) ) ( not ( = ?auto_103390 ?auto_103394 ) ) ( not ( = ?auto_103390 ?auto_103395 ) ) ( not ( = ?auto_103390 ?auto_103396 ) ) ( not ( = ?auto_103391 ?auto_103392 ) ) ( not ( = ?auto_103391 ?auto_103393 ) ) ( not ( = ?auto_103391 ?auto_103394 ) ) ( not ( = ?auto_103391 ?auto_103395 ) ) ( not ( = ?auto_103391 ?auto_103396 ) ) ( not ( = ?auto_103392 ?auto_103393 ) ) ( not ( = ?auto_103392 ?auto_103394 ) ) ( not ( = ?auto_103392 ?auto_103395 ) ) ( not ( = ?auto_103392 ?auto_103396 ) ) ( not ( = ?auto_103393 ?auto_103394 ) ) ( not ( = ?auto_103393 ?auto_103395 ) ) ( not ( = ?auto_103393 ?auto_103396 ) ) ( not ( = ?auto_103394 ?auto_103395 ) ) ( not ( = ?auto_103394 ?auto_103396 ) ) ( not ( = ?auto_103395 ?auto_103396 ) ) ( ON ?auto_103395 ?auto_103396 ) ( ON ?auto_103394 ?auto_103395 ) ( ON ?auto_103393 ?auto_103394 ) ( ON ?auto_103392 ?auto_103393 ) ( ON ?auto_103391 ?auto_103392 ) ( ON ?auto_103390 ?auto_103391 ) ( ON ?auto_103389 ?auto_103390 ) ( ON ?auto_103388 ?auto_103389 ) ( ON ?auto_103387 ?auto_103388 ) ( CLEAR ?auto_103387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103387 )
      ( MAKE-10PILE ?auto_103387 ?auto_103388 ?auto_103389 ?auto_103390 ?auto_103391 ?auto_103392 ?auto_103393 ?auto_103394 ?auto_103395 ?auto_103396 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_103407 - BLOCK
      ?auto_103408 - BLOCK
      ?auto_103409 - BLOCK
      ?auto_103410 - BLOCK
      ?auto_103411 - BLOCK
      ?auto_103412 - BLOCK
      ?auto_103413 - BLOCK
      ?auto_103414 - BLOCK
      ?auto_103415 - BLOCK
      ?auto_103416 - BLOCK
    )
    :vars
    (
      ?auto_103417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103407 ?auto_103408 ) ) ( not ( = ?auto_103407 ?auto_103409 ) ) ( not ( = ?auto_103407 ?auto_103410 ) ) ( not ( = ?auto_103407 ?auto_103411 ) ) ( not ( = ?auto_103407 ?auto_103412 ) ) ( not ( = ?auto_103407 ?auto_103413 ) ) ( not ( = ?auto_103407 ?auto_103414 ) ) ( not ( = ?auto_103407 ?auto_103415 ) ) ( not ( = ?auto_103407 ?auto_103416 ) ) ( not ( = ?auto_103408 ?auto_103409 ) ) ( not ( = ?auto_103408 ?auto_103410 ) ) ( not ( = ?auto_103408 ?auto_103411 ) ) ( not ( = ?auto_103408 ?auto_103412 ) ) ( not ( = ?auto_103408 ?auto_103413 ) ) ( not ( = ?auto_103408 ?auto_103414 ) ) ( not ( = ?auto_103408 ?auto_103415 ) ) ( not ( = ?auto_103408 ?auto_103416 ) ) ( not ( = ?auto_103409 ?auto_103410 ) ) ( not ( = ?auto_103409 ?auto_103411 ) ) ( not ( = ?auto_103409 ?auto_103412 ) ) ( not ( = ?auto_103409 ?auto_103413 ) ) ( not ( = ?auto_103409 ?auto_103414 ) ) ( not ( = ?auto_103409 ?auto_103415 ) ) ( not ( = ?auto_103409 ?auto_103416 ) ) ( not ( = ?auto_103410 ?auto_103411 ) ) ( not ( = ?auto_103410 ?auto_103412 ) ) ( not ( = ?auto_103410 ?auto_103413 ) ) ( not ( = ?auto_103410 ?auto_103414 ) ) ( not ( = ?auto_103410 ?auto_103415 ) ) ( not ( = ?auto_103410 ?auto_103416 ) ) ( not ( = ?auto_103411 ?auto_103412 ) ) ( not ( = ?auto_103411 ?auto_103413 ) ) ( not ( = ?auto_103411 ?auto_103414 ) ) ( not ( = ?auto_103411 ?auto_103415 ) ) ( not ( = ?auto_103411 ?auto_103416 ) ) ( not ( = ?auto_103412 ?auto_103413 ) ) ( not ( = ?auto_103412 ?auto_103414 ) ) ( not ( = ?auto_103412 ?auto_103415 ) ) ( not ( = ?auto_103412 ?auto_103416 ) ) ( not ( = ?auto_103413 ?auto_103414 ) ) ( not ( = ?auto_103413 ?auto_103415 ) ) ( not ( = ?auto_103413 ?auto_103416 ) ) ( not ( = ?auto_103414 ?auto_103415 ) ) ( not ( = ?auto_103414 ?auto_103416 ) ) ( not ( = ?auto_103415 ?auto_103416 ) ) ( ON ?auto_103407 ?auto_103417 ) ( not ( = ?auto_103416 ?auto_103417 ) ) ( not ( = ?auto_103415 ?auto_103417 ) ) ( not ( = ?auto_103414 ?auto_103417 ) ) ( not ( = ?auto_103413 ?auto_103417 ) ) ( not ( = ?auto_103412 ?auto_103417 ) ) ( not ( = ?auto_103411 ?auto_103417 ) ) ( not ( = ?auto_103410 ?auto_103417 ) ) ( not ( = ?auto_103409 ?auto_103417 ) ) ( not ( = ?auto_103408 ?auto_103417 ) ) ( not ( = ?auto_103407 ?auto_103417 ) ) ( ON ?auto_103408 ?auto_103407 ) ( ON ?auto_103409 ?auto_103408 ) ( ON ?auto_103410 ?auto_103409 ) ( ON ?auto_103411 ?auto_103410 ) ( ON ?auto_103412 ?auto_103411 ) ( ON ?auto_103413 ?auto_103412 ) ( ON ?auto_103414 ?auto_103413 ) ( ON ?auto_103415 ?auto_103414 ) ( ON ?auto_103416 ?auto_103415 ) ( CLEAR ?auto_103416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_103416 ?auto_103415 ?auto_103414 ?auto_103413 ?auto_103412 ?auto_103411 ?auto_103410 ?auto_103409 ?auto_103408 ?auto_103407 )
      ( MAKE-10PILE ?auto_103407 ?auto_103408 ?auto_103409 ?auto_103410 ?auto_103411 ?auto_103412 ?auto_103413 ?auto_103414 ?auto_103415 ?auto_103416 ) )
  )

)

