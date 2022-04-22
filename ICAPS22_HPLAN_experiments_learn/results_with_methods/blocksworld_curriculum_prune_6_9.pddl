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
      ?auto_13758 - BLOCK
    )
    :vars
    (
      ?auto_13759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13758 ?auto_13759 ) ( CLEAR ?auto_13758 ) ( HAND-EMPTY ) ( not ( = ?auto_13758 ?auto_13759 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13758 ?auto_13759 )
      ( !PUTDOWN ?auto_13758 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13765 - BLOCK
      ?auto_13766 - BLOCK
    )
    :vars
    (
      ?auto_13767 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13765 ) ( ON ?auto_13766 ?auto_13767 ) ( CLEAR ?auto_13766 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13765 ) ( not ( = ?auto_13765 ?auto_13766 ) ) ( not ( = ?auto_13765 ?auto_13767 ) ) ( not ( = ?auto_13766 ?auto_13767 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13766 ?auto_13767 )
      ( !STACK ?auto_13766 ?auto_13765 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13775 - BLOCK
      ?auto_13776 - BLOCK
    )
    :vars
    (
      ?auto_13777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13776 ?auto_13777 ) ( not ( = ?auto_13775 ?auto_13776 ) ) ( not ( = ?auto_13775 ?auto_13777 ) ) ( not ( = ?auto_13776 ?auto_13777 ) ) ( ON ?auto_13775 ?auto_13776 ) ( CLEAR ?auto_13775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13775 )
      ( MAKE-2PILE ?auto_13775 ?auto_13776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13786 - BLOCK
      ?auto_13787 - BLOCK
      ?auto_13788 - BLOCK
    )
    :vars
    (
      ?auto_13789 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13787 ) ( ON ?auto_13788 ?auto_13789 ) ( CLEAR ?auto_13788 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13786 ) ( ON ?auto_13787 ?auto_13786 ) ( not ( = ?auto_13786 ?auto_13787 ) ) ( not ( = ?auto_13786 ?auto_13788 ) ) ( not ( = ?auto_13786 ?auto_13789 ) ) ( not ( = ?auto_13787 ?auto_13788 ) ) ( not ( = ?auto_13787 ?auto_13789 ) ) ( not ( = ?auto_13788 ?auto_13789 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13788 ?auto_13789 )
      ( !STACK ?auto_13788 ?auto_13787 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13800 - BLOCK
      ?auto_13801 - BLOCK
      ?auto_13802 - BLOCK
    )
    :vars
    (
      ?auto_13803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13802 ?auto_13803 ) ( ON-TABLE ?auto_13800 ) ( not ( = ?auto_13800 ?auto_13801 ) ) ( not ( = ?auto_13800 ?auto_13802 ) ) ( not ( = ?auto_13800 ?auto_13803 ) ) ( not ( = ?auto_13801 ?auto_13802 ) ) ( not ( = ?auto_13801 ?auto_13803 ) ) ( not ( = ?auto_13802 ?auto_13803 ) ) ( CLEAR ?auto_13800 ) ( ON ?auto_13801 ?auto_13802 ) ( CLEAR ?auto_13801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13800 ?auto_13801 )
      ( MAKE-3PILE ?auto_13800 ?auto_13801 ?auto_13802 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13814 - BLOCK
      ?auto_13815 - BLOCK
      ?auto_13816 - BLOCK
    )
    :vars
    (
      ?auto_13817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13816 ?auto_13817 ) ( not ( = ?auto_13814 ?auto_13815 ) ) ( not ( = ?auto_13814 ?auto_13816 ) ) ( not ( = ?auto_13814 ?auto_13817 ) ) ( not ( = ?auto_13815 ?auto_13816 ) ) ( not ( = ?auto_13815 ?auto_13817 ) ) ( not ( = ?auto_13816 ?auto_13817 ) ) ( ON ?auto_13815 ?auto_13816 ) ( ON ?auto_13814 ?auto_13815 ) ( CLEAR ?auto_13814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13814 )
      ( MAKE-3PILE ?auto_13814 ?auto_13815 ?auto_13816 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13829 - BLOCK
      ?auto_13830 - BLOCK
      ?auto_13831 - BLOCK
      ?auto_13832 - BLOCK
    )
    :vars
    (
      ?auto_13833 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13831 ) ( ON ?auto_13832 ?auto_13833 ) ( CLEAR ?auto_13832 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13829 ) ( ON ?auto_13830 ?auto_13829 ) ( ON ?auto_13831 ?auto_13830 ) ( not ( = ?auto_13829 ?auto_13830 ) ) ( not ( = ?auto_13829 ?auto_13831 ) ) ( not ( = ?auto_13829 ?auto_13832 ) ) ( not ( = ?auto_13829 ?auto_13833 ) ) ( not ( = ?auto_13830 ?auto_13831 ) ) ( not ( = ?auto_13830 ?auto_13832 ) ) ( not ( = ?auto_13830 ?auto_13833 ) ) ( not ( = ?auto_13831 ?auto_13832 ) ) ( not ( = ?auto_13831 ?auto_13833 ) ) ( not ( = ?auto_13832 ?auto_13833 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13832 ?auto_13833 )
      ( !STACK ?auto_13832 ?auto_13831 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13847 - BLOCK
      ?auto_13848 - BLOCK
      ?auto_13849 - BLOCK
      ?auto_13850 - BLOCK
    )
    :vars
    (
      ?auto_13851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13850 ?auto_13851 ) ( ON-TABLE ?auto_13847 ) ( ON ?auto_13848 ?auto_13847 ) ( not ( = ?auto_13847 ?auto_13848 ) ) ( not ( = ?auto_13847 ?auto_13849 ) ) ( not ( = ?auto_13847 ?auto_13850 ) ) ( not ( = ?auto_13847 ?auto_13851 ) ) ( not ( = ?auto_13848 ?auto_13849 ) ) ( not ( = ?auto_13848 ?auto_13850 ) ) ( not ( = ?auto_13848 ?auto_13851 ) ) ( not ( = ?auto_13849 ?auto_13850 ) ) ( not ( = ?auto_13849 ?auto_13851 ) ) ( not ( = ?auto_13850 ?auto_13851 ) ) ( CLEAR ?auto_13848 ) ( ON ?auto_13849 ?auto_13850 ) ( CLEAR ?auto_13849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13847 ?auto_13848 ?auto_13849 )
      ( MAKE-4PILE ?auto_13847 ?auto_13848 ?auto_13849 ?auto_13850 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13865 - BLOCK
      ?auto_13866 - BLOCK
      ?auto_13867 - BLOCK
      ?auto_13868 - BLOCK
    )
    :vars
    (
      ?auto_13869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13868 ?auto_13869 ) ( ON-TABLE ?auto_13865 ) ( not ( = ?auto_13865 ?auto_13866 ) ) ( not ( = ?auto_13865 ?auto_13867 ) ) ( not ( = ?auto_13865 ?auto_13868 ) ) ( not ( = ?auto_13865 ?auto_13869 ) ) ( not ( = ?auto_13866 ?auto_13867 ) ) ( not ( = ?auto_13866 ?auto_13868 ) ) ( not ( = ?auto_13866 ?auto_13869 ) ) ( not ( = ?auto_13867 ?auto_13868 ) ) ( not ( = ?auto_13867 ?auto_13869 ) ) ( not ( = ?auto_13868 ?auto_13869 ) ) ( ON ?auto_13867 ?auto_13868 ) ( CLEAR ?auto_13865 ) ( ON ?auto_13866 ?auto_13867 ) ( CLEAR ?auto_13866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13865 ?auto_13866 )
      ( MAKE-4PILE ?auto_13865 ?auto_13866 ?auto_13867 ?auto_13868 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13883 - BLOCK
      ?auto_13884 - BLOCK
      ?auto_13885 - BLOCK
      ?auto_13886 - BLOCK
    )
    :vars
    (
      ?auto_13887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13886 ?auto_13887 ) ( not ( = ?auto_13883 ?auto_13884 ) ) ( not ( = ?auto_13883 ?auto_13885 ) ) ( not ( = ?auto_13883 ?auto_13886 ) ) ( not ( = ?auto_13883 ?auto_13887 ) ) ( not ( = ?auto_13884 ?auto_13885 ) ) ( not ( = ?auto_13884 ?auto_13886 ) ) ( not ( = ?auto_13884 ?auto_13887 ) ) ( not ( = ?auto_13885 ?auto_13886 ) ) ( not ( = ?auto_13885 ?auto_13887 ) ) ( not ( = ?auto_13886 ?auto_13887 ) ) ( ON ?auto_13885 ?auto_13886 ) ( ON ?auto_13884 ?auto_13885 ) ( ON ?auto_13883 ?auto_13884 ) ( CLEAR ?auto_13883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13883 )
      ( MAKE-4PILE ?auto_13883 ?auto_13884 ?auto_13885 ?auto_13886 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13902 - BLOCK
      ?auto_13903 - BLOCK
      ?auto_13904 - BLOCK
      ?auto_13905 - BLOCK
      ?auto_13906 - BLOCK
    )
    :vars
    (
      ?auto_13907 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13905 ) ( ON ?auto_13906 ?auto_13907 ) ( CLEAR ?auto_13906 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13902 ) ( ON ?auto_13903 ?auto_13902 ) ( ON ?auto_13904 ?auto_13903 ) ( ON ?auto_13905 ?auto_13904 ) ( not ( = ?auto_13902 ?auto_13903 ) ) ( not ( = ?auto_13902 ?auto_13904 ) ) ( not ( = ?auto_13902 ?auto_13905 ) ) ( not ( = ?auto_13902 ?auto_13906 ) ) ( not ( = ?auto_13902 ?auto_13907 ) ) ( not ( = ?auto_13903 ?auto_13904 ) ) ( not ( = ?auto_13903 ?auto_13905 ) ) ( not ( = ?auto_13903 ?auto_13906 ) ) ( not ( = ?auto_13903 ?auto_13907 ) ) ( not ( = ?auto_13904 ?auto_13905 ) ) ( not ( = ?auto_13904 ?auto_13906 ) ) ( not ( = ?auto_13904 ?auto_13907 ) ) ( not ( = ?auto_13905 ?auto_13906 ) ) ( not ( = ?auto_13905 ?auto_13907 ) ) ( not ( = ?auto_13906 ?auto_13907 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13906 ?auto_13907 )
      ( !STACK ?auto_13906 ?auto_13905 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13924 - BLOCK
      ?auto_13925 - BLOCK
      ?auto_13926 - BLOCK
      ?auto_13927 - BLOCK
      ?auto_13928 - BLOCK
    )
    :vars
    (
      ?auto_13929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13928 ?auto_13929 ) ( ON-TABLE ?auto_13924 ) ( ON ?auto_13925 ?auto_13924 ) ( ON ?auto_13926 ?auto_13925 ) ( not ( = ?auto_13924 ?auto_13925 ) ) ( not ( = ?auto_13924 ?auto_13926 ) ) ( not ( = ?auto_13924 ?auto_13927 ) ) ( not ( = ?auto_13924 ?auto_13928 ) ) ( not ( = ?auto_13924 ?auto_13929 ) ) ( not ( = ?auto_13925 ?auto_13926 ) ) ( not ( = ?auto_13925 ?auto_13927 ) ) ( not ( = ?auto_13925 ?auto_13928 ) ) ( not ( = ?auto_13925 ?auto_13929 ) ) ( not ( = ?auto_13926 ?auto_13927 ) ) ( not ( = ?auto_13926 ?auto_13928 ) ) ( not ( = ?auto_13926 ?auto_13929 ) ) ( not ( = ?auto_13927 ?auto_13928 ) ) ( not ( = ?auto_13927 ?auto_13929 ) ) ( not ( = ?auto_13928 ?auto_13929 ) ) ( CLEAR ?auto_13926 ) ( ON ?auto_13927 ?auto_13928 ) ( CLEAR ?auto_13927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13924 ?auto_13925 ?auto_13926 ?auto_13927 )
      ( MAKE-5PILE ?auto_13924 ?auto_13925 ?auto_13926 ?auto_13927 ?auto_13928 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13946 - BLOCK
      ?auto_13947 - BLOCK
      ?auto_13948 - BLOCK
      ?auto_13949 - BLOCK
      ?auto_13950 - BLOCK
    )
    :vars
    (
      ?auto_13951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13950 ?auto_13951 ) ( ON-TABLE ?auto_13946 ) ( ON ?auto_13947 ?auto_13946 ) ( not ( = ?auto_13946 ?auto_13947 ) ) ( not ( = ?auto_13946 ?auto_13948 ) ) ( not ( = ?auto_13946 ?auto_13949 ) ) ( not ( = ?auto_13946 ?auto_13950 ) ) ( not ( = ?auto_13946 ?auto_13951 ) ) ( not ( = ?auto_13947 ?auto_13948 ) ) ( not ( = ?auto_13947 ?auto_13949 ) ) ( not ( = ?auto_13947 ?auto_13950 ) ) ( not ( = ?auto_13947 ?auto_13951 ) ) ( not ( = ?auto_13948 ?auto_13949 ) ) ( not ( = ?auto_13948 ?auto_13950 ) ) ( not ( = ?auto_13948 ?auto_13951 ) ) ( not ( = ?auto_13949 ?auto_13950 ) ) ( not ( = ?auto_13949 ?auto_13951 ) ) ( not ( = ?auto_13950 ?auto_13951 ) ) ( ON ?auto_13949 ?auto_13950 ) ( CLEAR ?auto_13947 ) ( ON ?auto_13948 ?auto_13949 ) ( CLEAR ?auto_13948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13946 ?auto_13947 ?auto_13948 )
      ( MAKE-5PILE ?auto_13946 ?auto_13947 ?auto_13948 ?auto_13949 ?auto_13950 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13968 - BLOCK
      ?auto_13969 - BLOCK
      ?auto_13970 - BLOCK
      ?auto_13971 - BLOCK
      ?auto_13972 - BLOCK
    )
    :vars
    (
      ?auto_13973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13972 ?auto_13973 ) ( ON-TABLE ?auto_13968 ) ( not ( = ?auto_13968 ?auto_13969 ) ) ( not ( = ?auto_13968 ?auto_13970 ) ) ( not ( = ?auto_13968 ?auto_13971 ) ) ( not ( = ?auto_13968 ?auto_13972 ) ) ( not ( = ?auto_13968 ?auto_13973 ) ) ( not ( = ?auto_13969 ?auto_13970 ) ) ( not ( = ?auto_13969 ?auto_13971 ) ) ( not ( = ?auto_13969 ?auto_13972 ) ) ( not ( = ?auto_13969 ?auto_13973 ) ) ( not ( = ?auto_13970 ?auto_13971 ) ) ( not ( = ?auto_13970 ?auto_13972 ) ) ( not ( = ?auto_13970 ?auto_13973 ) ) ( not ( = ?auto_13971 ?auto_13972 ) ) ( not ( = ?auto_13971 ?auto_13973 ) ) ( not ( = ?auto_13972 ?auto_13973 ) ) ( ON ?auto_13971 ?auto_13972 ) ( ON ?auto_13970 ?auto_13971 ) ( CLEAR ?auto_13968 ) ( ON ?auto_13969 ?auto_13970 ) ( CLEAR ?auto_13969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13968 ?auto_13969 )
      ( MAKE-5PILE ?auto_13968 ?auto_13969 ?auto_13970 ?auto_13971 ?auto_13972 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13990 - BLOCK
      ?auto_13991 - BLOCK
      ?auto_13992 - BLOCK
      ?auto_13993 - BLOCK
      ?auto_13994 - BLOCK
    )
    :vars
    (
      ?auto_13995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13994 ?auto_13995 ) ( not ( = ?auto_13990 ?auto_13991 ) ) ( not ( = ?auto_13990 ?auto_13992 ) ) ( not ( = ?auto_13990 ?auto_13993 ) ) ( not ( = ?auto_13990 ?auto_13994 ) ) ( not ( = ?auto_13990 ?auto_13995 ) ) ( not ( = ?auto_13991 ?auto_13992 ) ) ( not ( = ?auto_13991 ?auto_13993 ) ) ( not ( = ?auto_13991 ?auto_13994 ) ) ( not ( = ?auto_13991 ?auto_13995 ) ) ( not ( = ?auto_13992 ?auto_13993 ) ) ( not ( = ?auto_13992 ?auto_13994 ) ) ( not ( = ?auto_13992 ?auto_13995 ) ) ( not ( = ?auto_13993 ?auto_13994 ) ) ( not ( = ?auto_13993 ?auto_13995 ) ) ( not ( = ?auto_13994 ?auto_13995 ) ) ( ON ?auto_13993 ?auto_13994 ) ( ON ?auto_13992 ?auto_13993 ) ( ON ?auto_13991 ?auto_13992 ) ( ON ?auto_13990 ?auto_13991 ) ( CLEAR ?auto_13990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13990 )
      ( MAKE-5PILE ?auto_13990 ?auto_13991 ?auto_13992 ?auto_13993 ?auto_13994 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14013 - BLOCK
      ?auto_14014 - BLOCK
      ?auto_14015 - BLOCK
      ?auto_14016 - BLOCK
      ?auto_14017 - BLOCK
      ?auto_14018 - BLOCK
    )
    :vars
    (
      ?auto_14019 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14017 ) ( ON ?auto_14018 ?auto_14019 ) ( CLEAR ?auto_14018 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14013 ) ( ON ?auto_14014 ?auto_14013 ) ( ON ?auto_14015 ?auto_14014 ) ( ON ?auto_14016 ?auto_14015 ) ( ON ?auto_14017 ?auto_14016 ) ( not ( = ?auto_14013 ?auto_14014 ) ) ( not ( = ?auto_14013 ?auto_14015 ) ) ( not ( = ?auto_14013 ?auto_14016 ) ) ( not ( = ?auto_14013 ?auto_14017 ) ) ( not ( = ?auto_14013 ?auto_14018 ) ) ( not ( = ?auto_14013 ?auto_14019 ) ) ( not ( = ?auto_14014 ?auto_14015 ) ) ( not ( = ?auto_14014 ?auto_14016 ) ) ( not ( = ?auto_14014 ?auto_14017 ) ) ( not ( = ?auto_14014 ?auto_14018 ) ) ( not ( = ?auto_14014 ?auto_14019 ) ) ( not ( = ?auto_14015 ?auto_14016 ) ) ( not ( = ?auto_14015 ?auto_14017 ) ) ( not ( = ?auto_14015 ?auto_14018 ) ) ( not ( = ?auto_14015 ?auto_14019 ) ) ( not ( = ?auto_14016 ?auto_14017 ) ) ( not ( = ?auto_14016 ?auto_14018 ) ) ( not ( = ?auto_14016 ?auto_14019 ) ) ( not ( = ?auto_14017 ?auto_14018 ) ) ( not ( = ?auto_14017 ?auto_14019 ) ) ( not ( = ?auto_14018 ?auto_14019 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14018 ?auto_14019 )
      ( !STACK ?auto_14018 ?auto_14017 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14026 - BLOCK
      ?auto_14027 - BLOCK
      ?auto_14028 - BLOCK
      ?auto_14029 - BLOCK
      ?auto_14030 - BLOCK
      ?auto_14031 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14030 ) ( ON-TABLE ?auto_14031 ) ( CLEAR ?auto_14031 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14026 ) ( ON ?auto_14027 ?auto_14026 ) ( ON ?auto_14028 ?auto_14027 ) ( ON ?auto_14029 ?auto_14028 ) ( ON ?auto_14030 ?auto_14029 ) ( not ( = ?auto_14026 ?auto_14027 ) ) ( not ( = ?auto_14026 ?auto_14028 ) ) ( not ( = ?auto_14026 ?auto_14029 ) ) ( not ( = ?auto_14026 ?auto_14030 ) ) ( not ( = ?auto_14026 ?auto_14031 ) ) ( not ( = ?auto_14027 ?auto_14028 ) ) ( not ( = ?auto_14027 ?auto_14029 ) ) ( not ( = ?auto_14027 ?auto_14030 ) ) ( not ( = ?auto_14027 ?auto_14031 ) ) ( not ( = ?auto_14028 ?auto_14029 ) ) ( not ( = ?auto_14028 ?auto_14030 ) ) ( not ( = ?auto_14028 ?auto_14031 ) ) ( not ( = ?auto_14029 ?auto_14030 ) ) ( not ( = ?auto_14029 ?auto_14031 ) ) ( not ( = ?auto_14030 ?auto_14031 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_14031 )
      ( !STACK ?auto_14031 ?auto_14030 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14038 - BLOCK
      ?auto_14039 - BLOCK
      ?auto_14040 - BLOCK
      ?auto_14041 - BLOCK
      ?auto_14042 - BLOCK
      ?auto_14043 - BLOCK
    )
    :vars
    (
      ?auto_14044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14043 ?auto_14044 ) ( ON-TABLE ?auto_14038 ) ( ON ?auto_14039 ?auto_14038 ) ( ON ?auto_14040 ?auto_14039 ) ( ON ?auto_14041 ?auto_14040 ) ( not ( = ?auto_14038 ?auto_14039 ) ) ( not ( = ?auto_14038 ?auto_14040 ) ) ( not ( = ?auto_14038 ?auto_14041 ) ) ( not ( = ?auto_14038 ?auto_14042 ) ) ( not ( = ?auto_14038 ?auto_14043 ) ) ( not ( = ?auto_14038 ?auto_14044 ) ) ( not ( = ?auto_14039 ?auto_14040 ) ) ( not ( = ?auto_14039 ?auto_14041 ) ) ( not ( = ?auto_14039 ?auto_14042 ) ) ( not ( = ?auto_14039 ?auto_14043 ) ) ( not ( = ?auto_14039 ?auto_14044 ) ) ( not ( = ?auto_14040 ?auto_14041 ) ) ( not ( = ?auto_14040 ?auto_14042 ) ) ( not ( = ?auto_14040 ?auto_14043 ) ) ( not ( = ?auto_14040 ?auto_14044 ) ) ( not ( = ?auto_14041 ?auto_14042 ) ) ( not ( = ?auto_14041 ?auto_14043 ) ) ( not ( = ?auto_14041 ?auto_14044 ) ) ( not ( = ?auto_14042 ?auto_14043 ) ) ( not ( = ?auto_14042 ?auto_14044 ) ) ( not ( = ?auto_14043 ?auto_14044 ) ) ( CLEAR ?auto_14041 ) ( ON ?auto_14042 ?auto_14043 ) ( CLEAR ?auto_14042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_14038 ?auto_14039 ?auto_14040 ?auto_14041 ?auto_14042 )
      ( MAKE-6PILE ?auto_14038 ?auto_14039 ?auto_14040 ?auto_14041 ?auto_14042 ?auto_14043 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14051 - BLOCK
      ?auto_14052 - BLOCK
      ?auto_14053 - BLOCK
      ?auto_14054 - BLOCK
      ?auto_14055 - BLOCK
      ?auto_14056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14056 ) ( ON-TABLE ?auto_14051 ) ( ON ?auto_14052 ?auto_14051 ) ( ON ?auto_14053 ?auto_14052 ) ( ON ?auto_14054 ?auto_14053 ) ( not ( = ?auto_14051 ?auto_14052 ) ) ( not ( = ?auto_14051 ?auto_14053 ) ) ( not ( = ?auto_14051 ?auto_14054 ) ) ( not ( = ?auto_14051 ?auto_14055 ) ) ( not ( = ?auto_14051 ?auto_14056 ) ) ( not ( = ?auto_14052 ?auto_14053 ) ) ( not ( = ?auto_14052 ?auto_14054 ) ) ( not ( = ?auto_14052 ?auto_14055 ) ) ( not ( = ?auto_14052 ?auto_14056 ) ) ( not ( = ?auto_14053 ?auto_14054 ) ) ( not ( = ?auto_14053 ?auto_14055 ) ) ( not ( = ?auto_14053 ?auto_14056 ) ) ( not ( = ?auto_14054 ?auto_14055 ) ) ( not ( = ?auto_14054 ?auto_14056 ) ) ( not ( = ?auto_14055 ?auto_14056 ) ) ( CLEAR ?auto_14054 ) ( ON ?auto_14055 ?auto_14056 ) ( CLEAR ?auto_14055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_14051 ?auto_14052 ?auto_14053 ?auto_14054 ?auto_14055 )
      ( MAKE-6PILE ?auto_14051 ?auto_14052 ?auto_14053 ?auto_14054 ?auto_14055 ?auto_14056 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14063 - BLOCK
      ?auto_14064 - BLOCK
      ?auto_14065 - BLOCK
      ?auto_14066 - BLOCK
      ?auto_14067 - BLOCK
      ?auto_14068 - BLOCK
    )
    :vars
    (
      ?auto_14069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14068 ?auto_14069 ) ( ON-TABLE ?auto_14063 ) ( ON ?auto_14064 ?auto_14063 ) ( ON ?auto_14065 ?auto_14064 ) ( not ( = ?auto_14063 ?auto_14064 ) ) ( not ( = ?auto_14063 ?auto_14065 ) ) ( not ( = ?auto_14063 ?auto_14066 ) ) ( not ( = ?auto_14063 ?auto_14067 ) ) ( not ( = ?auto_14063 ?auto_14068 ) ) ( not ( = ?auto_14063 ?auto_14069 ) ) ( not ( = ?auto_14064 ?auto_14065 ) ) ( not ( = ?auto_14064 ?auto_14066 ) ) ( not ( = ?auto_14064 ?auto_14067 ) ) ( not ( = ?auto_14064 ?auto_14068 ) ) ( not ( = ?auto_14064 ?auto_14069 ) ) ( not ( = ?auto_14065 ?auto_14066 ) ) ( not ( = ?auto_14065 ?auto_14067 ) ) ( not ( = ?auto_14065 ?auto_14068 ) ) ( not ( = ?auto_14065 ?auto_14069 ) ) ( not ( = ?auto_14066 ?auto_14067 ) ) ( not ( = ?auto_14066 ?auto_14068 ) ) ( not ( = ?auto_14066 ?auto_14069 ) ) ( not ( = ?auto_14067 ?auto_14068 ) ) ( not ( = ?auto_14067 ?auto_14069 ) ) ( not ( = ?auto_14068 ?auto_14069 ) ) ( ON ?auto_14067 ?auto_14068 ) ( CLEAR ?auto_14065 ) ( ON ?auto_14066 ?auto_14067 ) ( CLEAR ?auto_14066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14063 ?auto_14064 ?auto_14065 ?auto_14066 )
      ( MAKE-6PILE ?auto_14063 ?auto_14064 ?auto_14065 ?auto_14066 ?auto_14067 ?auto_14068 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14076 - BLOCK
      ?auto_14077 - BLOCK
      ?auto_14078 - BLOCK
      ?auto_14079 - BLOCK
      ?auto_14080 - BLOCK
      ?auto_14081 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14081 ) ( ON-TABLE ?auto_14076 ) ( ON ?auto_14077 ?auto_14076 ) ( ON ?auto_14078 ?auto_14077 ) ( not ( = ?auto_14076 ?auto_14077 ) ) ( not ( = ?auto_14076 ?auto_14078 ) ) ( not ( = ?auto_14076 ?auto_14079 ) ) ( not ( = ?auto_14076 ?auto_14080 ) ) ( not ( = ?auto_14076 ?auto_14081 ) ) ( not ( = ?auto_14077 ?auto_14078 ) ) ( not ( = ?auto_14077 ?auto_14079 ) ) ( not ( = ?auto_14077 ?auto_14080 ) ) ( not ( = ?auto_14077 ?auto_14081 ) ) ( not ( = ?auto_14078 ?auto_14079 ) ) ( not ( = ?auto_14078 ?auto_14080 ) ) ( not ( = ?auto_14078 ?auto_14081 ) ) ( not ( = ?auto_14079 ?auto_14080 ) ) ( not ( = ?auto_14079 ?auto_14081 ) ) ( not ( = ?auto_14080 ?auto_14081 ) ) ( ON ?auto_14080 ?auto_14081 ) ( CLEAR ?auto_14078 ) ( ON ?auto_14079 ?auto_14080 ) ( CLEAR ?auto_14079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14076 ?auto_14077 ?auto_14078 ?auto_14079 )
      ( MAKE-6PILE ?auto_14076 ?auto_14077 ?auto_14078 ?auto_14079 ?auto_14080 ?auto_14081 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14088 - BLOCK
      ?auto_14089 - BLOCK
      ?auto_14090 - BLOCK
      ?auto_14091 - BLOCK
      ?auto_14092 - BLOCK
      ?auto_14093 - BLOCK
    )
    :vars
    (
      ?auto_14094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14093 ?auto_14094 ) ( ON-TABLE ?auto_14088 ) ( ON ?auto_14089 ?auto_14088 ) ( not ( = ?auto_14088 ?auto_14089 ) ) ( not ( = ?auto_14088 ?auto_14090 ) ) ( not ( = ?auto_14088 ?auto_14091 ) ) ( not ( = ?auto_14088 ?auto_14092 ) ) ( not ( = ?auto_14088 ?auto_14093 ) ) ( not ( = ?auto_14088 ?auto_14094 ) ) ( not ( = ?auto_14089 ?auto_14090 ) ) ( not ( = ?auto_14089 ?auto_14091 ) ) ( not ( = ?auto_14089 ?auto_14092 ) ) ( not ( = ?auto_14089 ?auto_14093 ) ) ( not ( = ?auto_14089 ?auto_14094 ) ) ( not ( = ?auto_14090 ?auto_14091 ) ) ( not ( = ?auto_14090 ?auto_14092 ) ) ( not ( = ?auto_14090 ?auto_14093 ) ) ( not ( = ?auto_14090 ?auto_14094 ) ) ( not ( = ?auto_14091 ?auto_14092 ) ) ( not ( = ?auto_14091 ?auto_14093 ) ) ( not ( = ?auto_14091 ?auto_14094 ) ) ( not ( = ?auto_14092 ?auto_14093 ) ) ( not ( = ?auto_14092 ?auto_14094 ) ) ( not ( = ?auto_14093 ?auto_14094 ) ) ( ON ?auto_14092 ?auto_14093 ) ( ON ?auto_14091 ?auto_14092 ) ( CLEAR ?auto_14089 ) ( ON ?auto_14090 ?auto_14091 ) ( CLEAR ?auto_14090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14088 ?auto_14089 ?auto_14090 )
      ( MAKE-6PILE ?auto_14088 ?auto_14089 ?auto_14090 ?auto_14091 ?auto_14092 ?auto_14093 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14101 - BLOCK
      ?auto_14102 - BLOCK
      ?auto_14103 - BLOCK
      ?auto_14104 - BLOCK
      ?auto_14105 - BLOCK
      ?auto_14106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14106 ) ( ON-TABLE ?auto_14101 ) ( ON ?auto_14102 ?auto_14101 ) ( not ( = ?auto_14101 ?auto_14102 ) ) ( not ( = ?auto_14101 ?auto_14103 ) ) ( not ( = ?auto_14101 ?auto_14104 ) ) ( not ( = ?auto_14101 ?auto_14105 ) ) ( not ( = ?auto_14101 ?auto_14106 ) ) ( not ( = ?auto_14102 ?auto_14103 ) ) ( not ( = ?auto_14102 ?auto_14104 ) ) ( not ( = ?auto_14102 ?auto_14105 ) ) ( not ( = ?auto_14102 ?auto_14106 ) ) ( not ( = ?auto_14103 ?auto_14104 ) ) ( not ( = ?auto_14103 ?auto_14105 ) ) ( not ( = ?auto_14103 ?auto_14106 ) ) ( not ( = ?auto_14104 ?auto_14105 ) ) ( not ( = ?auto_14104 ?auto_14106 ) ) ( not ( = ?auto_14105 ?auto_14106 ) ) ( ON ?auto_14105 ?auto_14106 ) ( ON ?auto_14104 ?auto_14105 ) ( CLEAR ?auto_14102 ) ( ON ?auto_14103 ?auto_14104 ) ( CLEAR ?auto_14103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14101 ?auto_14102 ?auto_14103 )
      ( MAKE-6PILE ?auto_14101 ?auto_14102 ?auto_14103 ?auto_14104 ?auto_14105 ?auto_14106 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14113 - BLOCK
      ?auto_14114 - BLOCK
      ?auto_14115 - BLOCK
      ?auto_14116 - BLOCK
      ?auto_14117 - BLOCK
      ?auto_14118 - BLOCK
    )
    :vars
    (
      ?auto_14119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14118 ?auto_14119 ) ( ON-TABLE ?auto_14113 ) ( not ( = ?auto_14113 ?auto_14114 ) ) ( not ( = ?auto_14113 ?auto_14115 ) ) ( not ( = ?auto_14113 ?auto_14116 ) ) ( not ( = ?auto_14113 ?auto_14117 ) ) ( not ( = ?auto_14113 ?auto_14118 ) ) ( not ( = ?auto_14113 ?auto_14119 ) ) ( not ( = ?auto_14114 ?auto_14115 ) ) ( not ( = ?auto_14114 ?auto_14116 ) ) ( not ( = ?auto_14114 ?auto_14117 ) ) ( not ( = ?auto_14114 ?auto_14118 ) ) ( not ( = ?auto_14114 ?auto_14119 ) ) ( not ( = ?auto_14115 ?auto_14116 ) ) ( not ( = ?auto_14115 ?auto_14117 ) ) ( not ( = ?auto_14115 ?auto_14118 ) ) ( not ( = ?auto_14115 ?auto_14119 ) ) ( not ( = ?auto_14116 ?auto_14117 ) ) ( not ( = ?auto_14116 ?auto_14118 ) ) ( not ( = ?auto_14116 ?auto_14119 ) ) ( not ( = ?auto_14117 ?auto_14118 ) ) ( not ( = ?auto_14117 ?auto_14119 ) ) ( not ( = ?auto_14118 ?auto_14119 ) ) ( ON ?auto_14117 ?auto_14118 ) ( ON ?auto_14116 ?auto_14117 ) ( ON ?auto_14115 ?auto_14116 ) ( CLEAR ?auto_14113 ) ( ON ?auto_14114 ?auto_14115 ) ( CLEAR ?auto_14114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14113 ?auto_14114 )
      ( MAKE-6PILE ?auto_14113 ?auto_14114 ?auto_14115 ?auto_14116 ?auto_14117 ?auto_14118 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14126 - BLOCK
      ?auto_14127 - BLOCK
      ?auto_14128 - BLOCK
      ?auto_14129 - BLOCK
      ?auto_14130 - BLOCK
      ?auto_14131 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14131 ) ( ON-TABLE ?auto_14126 ) ( not ( = ?auto_14126 ?auto_14127 ) ) ( not ( = ?auto_14126 ?auto_14128 ) ) ( not ( = ?auto_14126 ?auto_14129 ) ) ( not ( = ?auto_14126 ?auto_14130 ) ) ( not ( = ?auto_14126 ?auto_14131 ) ) ( not ( = ?auto_14127 ?auto_14128 ) ) ( not ( = ?auto_14127 ?auto_14129 ) ) ( not ( = ?auto_14127 ?auto_14130 ) ) ( not ( = ?auto_14127 ?auto_14131 ) ) ( not ( = ?auto_14128 ?auto_14129 ) ) ( not ( = ?auto_14128 ?auto_14130 ) ) ( not ( = ?auto_14128 ?auto_14131 ) ) ( not ( = ?auto_14129 ?auto_14130 ) ) ( not ( = ?auto_14129 ?auto_14131 ) ) ( not ( = ?auto_14130 ?auto_14131 ) ) ( ON ?auto_14130 ?auto_14131 ) ( ON ?auto_14129 ?auto_14130 ) ( ON ?auto_14128 ?auto_14129 ) ( CLEAR ?auto_14126 ) ( ON ?auto_14127 ?auto_14128 ) ( CLEAR ?auto_14127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14126 ?auto_14127 )
      ( MAKE-6PILE ?auto_14126 ?auto_14127 ?auto_14128 ?auto_14129 ?auto_14130 ?auto_14131 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14138 - BLOCK
      ?auto_14139 - BLOCK
      ?auto_14140 - BLOCK
      ?auto_14141 - BLOCK
      ?auto_14142 - BLOCK
      ?auto_14143 - BLOCK
    )
    :vars
    (
      ?auto_14144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14143 ?auto_14144 ) ( not ( = ?auto_14138 ?auto_14139 ) ) ( not ( = ?auto_14138 ?auto_14140 ) ) ( not ( = ?auto_14138 ?auto_14141 ) ) ( not ( = ?auto_14138 ?auto_14142 ) ) ( not ( = ?auto_14138 ?auto_14143 ) ) ( not ( = ?auto_14138 ?auto_14144 ) ) ( not ( = ?auto_14139 ?auto_14140 ) ) ( not ( = ?auto_14139 ?auto_14141 ) ) ( not ( = ?auto_14139 ?auto_14142 ) ) ( not ( = ?auto_14139 ?auto_14143 ) ) ( not ( = ?auto_14139 ?auto_14144 ) ) ( not ( = ?auto_14140 ?auto_14141 ) ) ( not ( = ?auto_14140 ?auto_14142 ) ) ( not ( = ?auto_14140 ?auto_14143 ) ) ( not ( = ?auto_14140 ?auto_14144 ) ) ( not ( = ?auto_14141 ?auto_14142 ) ) ( not ( = ?auto_14141 ?auto_14143 ) ) ( not ( = ?auto_14141 ?auto_14144 ) ) ( not ( = ?auto_14142 ?auto_14143 ) ) ( not ( = ?auto_14142 ?auto_14144 ) ) ( not ( = ?auto_14143 ?auto_14144 ) ) ( ON ?auto_14142 ?auto_14143 ) ( ON ?auto_14141 ?auto_14142 ) ( ON ?auto_14140 ?auto_14141 ) ( ON ?auto_14139 ?auto_14140 ) ( ON ?auto_14138 ?auto_14139 ) ( CLEAR ?auto_14138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14138 )
      ( MAKE-6PILE ?auto_14138 ?auto_14139 ?auto_14140 ?auto_14141 ?auto_14142 ?auto_14143 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14151 - BLOCK
      ?auto_14152 - BLOCK
      ?auto_14153 - BLOCK
      ?auto_14154 - BLOCK
      ?auto_14155 - BLOCK
      ?auto_14156 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14156 ) ( not ( = ?auto_14151 ?auto_14152 ) ) ( not ( = ?auto_14151 ?auto_14153 ) ) ( not ( = ?auto_14151 ?auto_14154 ) ) ( not ( = ?auto_14151 ?auto_14155 ) ) ( not ( = ?auto_14151 ?auto_14156 ) ) ( not ( = ?auto_14152 ?auto_14153 ) ) ( not ( = ?auto_14152 ?auto_14154 ) ) ( not ( = ?auto_14152 ?auto_14155 ) ) ( not ( = ?auto_14152 ?auto_14156 ) ) ( not ( = ?auto_14153 ?auto_14154 ) ) ( not ( = ?auto_14153 ?auto_14155 ) ) ( not ( = ?auto_14153 ?auto_14156 ) ) ( not ( = ?auto_14154 ?auto_14155 ) ) ( not ( = ?auto_14154 ?auto_14156 ) ) ( not ( = ?auto_14155 ?auto_14156 ) ) ( ON ?auto_14155 ?auto_14156 ) ( ON ?auto_14154 ?auto_14155 ) ( ON ?auto_14153 ?auto_14154 ) ( ON ?auto_14152 ?auto_14153 ) ( ON ?auto_14151 ?auto_14152 ) ( CLEAR ?auto_14151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14151 )
      ( MAKE-6PILE ?auto_14151 ?auto_14152 ?auto_14153 ?auto_14154 ?auto_14155 ?auto_14156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14163 - BLOCK
      ?auto_14164 - BLOCK
      ?auto_14165 - BLOCK
      ?auto_14166 - BLOCK
      ?auto_14167 - BLOCK
      ?auto_14168 - BLOCK
    )
    :vars
    (
      ?auto_14169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14163 ?auto_14164 ) ) ( not ( = ?auto_14163 ?auto_14165 ) ) ( not ( = ?auto_14163 ?auto_14166 ) ) ( not ( = ?auto_14163 ?auto_14167 ) ) ( not ( = ?auto_14163 ?auto_14168 ) ) ( not ( = ?auto_14164 ?auto_14165 ) ) ( not ( = ?auto_14164 ?auto_14166 ) ) ( not ( = ?auto_14164 ?auto_14167 ) ) ( not ( = ?auto_14164 ?auto_14168 ) ) ( not ( = ?auto_14165 ?auto_14166 ) ) ( not ( = ?auto_14165 ?auto_14167 ) ) ( not ( = ?auto_14165 ?auto_14168 ) ) ( not ( = ?auto_14166 ?auto_14167 ) ) ( not ( = ?auto_14166 ?auto_14168 ) ) ( not ( = ?auto_14167 ?auto_14168 ) ) ( ON ?auto_14163 ?auto_14169 ) ( not ( = ?auto_14168 ?auto_14169 ) ) ( not ( = ?auto_14167 ?auto_14169 ) ) ( not ( = ?auto_14166 ?auto_14169 ) ) ( not ( = ?auto_14165 ?auto_14169 ) ) ( not ( = ?auto_14164 ?auto_14169 ) ) ( not ( = ?auto_14163 ?auto_14169 ) ) ( ON ?auto_14164 ?auto_14163 ) ( ON ?auto_14165 ?auto_14164 ) ( ON ?auto_14166 ?auto_14165 ) ( ON ?auto_14167 ?auto_14166 ) ( ON ?auto_14168 ?auto_14167 ) ( CLEAR ?auto_14168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_14168 ?auto_14167 ?auto_14166 ?auto_14165 ?auto_14164 ?auto_14163 )
      ( MAKE-6PILE ?auto_14163 ?auto_14164 ?auto_14165 ?auto_14166 ?auto_14167 ?auto_14168 ) )
  )

)

