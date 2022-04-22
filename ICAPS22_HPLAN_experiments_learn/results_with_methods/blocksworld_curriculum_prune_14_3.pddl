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
      ?auto_287776 - BLOCK
    )
    :vars
    (
      ?auto_287777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287776 ?auto_287777 ) ( CLEAR ?auto_287776 ) ( HAND-EMPTY ) ( not ( = ?auto_287776 ?auto_287777 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287776 ?auto_287777 )
      ( !PUTDOWN ?auto_287776 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_287783 - BLOCK
      ?auto_287784 - BLOCK
    )
    :vars
    (
      ?auto_287785 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_287783 ) ( ON ?auto_287784 ?auto_287785 ) ( CLEAR ?auto_287784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_287783 ) ( not ( = ?auto_287783 ?auto_287784 ) ) ( not ( = ?auto_287783 ?auto_287785 ) ) ( not ( = ?auto_287784 ?auto_287785 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287784 ?auto_287785 )
      ( !STACK ?auto_287784 ?auto_287783 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_287793 - BLOCK
      ?auto_287794 - BLOCK
    )
    :vars
    (
      ?auto_287795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287794 ?auto_287795 ) ( not ( = ?auto_287793 ?auto_287794 ) ) ( not ( = ?auto_287793 ?auto_287795 ) ) ( not ( = ?auto_287794 ?auto_287795 ) ) ( ON ?auto_287793 ?auto_287794 ) ( CLEAR ?auto_287793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_287793 )
      ( MAKE-2PILE ?auto_287793 ?auto_287794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_287804 - BLOCK
      ?auto_287805 - BLOCK
      ?auto_287806 - BLOCK
    )
    :vars
    (
      ?auto_287807 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_287805 ) ( ON ?auto_287806 ?auto_287807 ) ( CLEAR ?auto_287806 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_287804 ) ( ON ?auto_287805 ?auto_287804 ) ( not ( = ?auto_287804 ?auto_287805 ) ) ( not ( = ?auto_287804 ?auto_287806 ) ) ( not ( = ?auto_287804 ?auto_287807 ) ) ( not ( = ?auto_287805 ?auto_287806 ) ) ( not ( = ?auto_287805 ?auto_287807 ) ) ( not ( = ?auto_287806 ?auto_287807 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287806 ?auto_287807 )
      ( !STACK ?auto_287806 ?auto_287805 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_287818 - BLOCK
      ?auto_287819 - BLOCK
      ?auto_287820 - BLOCK
    )
    :vars
    (
      ?auto_287821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287820 ?auto_287821 ) ( ON-TABLE ?auto_287818 ) ( not ( = ?auto_287818 ?auto_287819 ) ) ( not ( = ?auto_287818 ?auto_287820 ) ) ( not ( = ?auto_287818 ?auto_287821 ) ) ( not ( = ?auto_287819 ?auto_287820 ) ) ( not ( = ?auto_287819 ?auto_287821 ) ) ( not ( = ?auto_287820 ?auto_287821 ) ) ( CLEAR ?auto_287818 ) ( ON ?auto_287819 ?auto_287820 ) ( CLEAR ?auto_287819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_287818 ?auto_287819 )
      ( MAKE-3PILE ?auto_287818 ?auto_287819 ?auto_287820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_287832 - BLOCK
      ?auto_287833 - BLOCK
      ?auto_287834 - BLOCK
    )
    :vars
    (
      ?auto_287835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287834 ?auto_287835 ) ( not ( = ?auto_287832 ?auto_287833 ) ) ( not ( = ?auto_287832 ?auto_287834 ) ) ( not ( = ?auto_287832 ?auto_287835 ) ) ( not ( = ?auto_287833 ?auto_287834 ) ) ( not ( = ?auto_287833 ?auto_287835 ) ) ( not ( = ?auto_287834 ?auto_287835 ) ) ( ON ?auto_287833 ?auto_287834 ) ( ON ?auto_287832 ?auto_287833 ) ( CLEAR ?auto_287832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_287832 )
      ( MAKE-3PILE ?auto_287832 ?auto_287833 ?auto_287834 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_287847 - BLOCK
      ?auto_287848 - BLOCK
      ?auto_287849 - BLOCK
      ?auto_287850 - BLOCK
    )
    :vars
    (
      ?auto_287851 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_287849 ) ( ON ?auto_287850 ?auto_287851 ) ( CLEAR ?auto_287850 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_287847 ) ( ON ?auto_287848 ?auto_287847 ) ( ON ?auto_287849 ?auto_287848 ) ( not ( = ?auto_287847 ?auto_287848 ) ) ( not ( = ?auto_287847 ?auto_287849 ) ) ( not ( = ?auto_287847 ?auto_287850 ) ) ( not ( = ?auto_287847 ?auto_287851 ) ) ( not ( = ?auto_287848 ?auto_287849 ) ) ( not ( = ?auto_287848 ?auto_287850 ) ) ( not ( = ?auto_287848 ?auto_287851 ) ) ( not ( = ?auto_287849 ?auto_287850 ) ) ( not ( = ?auto_287849 ?auto_287851 ) ) ( not ( = ?auto_287850 ?auto_287851 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287850 ?auto_287851 )
      ( !STACK ?auto_287850 ?auto_287849 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_287865 - BLOCK
      ?auto_287866 - BLOCK
      ?auto_287867 - BLOCK
      ?auto_287868 - BLOCK
    )
    :vars
    (
      ?auto_287869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287868 ?auto_287869 ) ( ON-TABLE ?auto_287865 ) ( ON ?auto_287866 ?auto_287865 ) ( not ( = ?auto_287865 ?auto_287866 ) ) ( not ( = ?auto_287865 ?auto_287867 ) ) ( not ( = ?auto_287865 ?auto_287868 ) ) ( not ( = ?auto_287865 ?auto_287869 ) ) ( not ( = ?auto_287866 ?auto_287867 ) ) ( not ( = ?auto_287866 ?auto_287868 ) ) ( not ( = ?auto_287866 ?auto_287869 ) ) ( not ( = ?auto_287867 ?auto_287868 ) ) ( not ( = ?auto_287867 ?auto_287869 ) ) ( not ( = ?auto_287868 ?auto_287869 ) ) ( CLEAR ?auto_287866 ) ( ON ?auto_287867 ?auto_287868 ) ( CLEAR ?auto_287867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_287865 ?auto_287866 ?auto_287867 )
      ( MAKE-4PILE ?auto_287865 ?auto_287866 ?auto_287867 ?auto_287868 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_287883 - BLOCK
      ?auto_287884 - BLOCK
      ?auto_287885 - BLOCK
      ?auto_287886 - BLOCK
    )
    :vars
    (
      ?auto_287887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287886 ?auto_287887 ) ( ON-TABLE ?auto_287883 ) ( not ( = ?auto_287883 ?auto_287884 ) ) ( not ( = ?auto_287883 ?auto_287885 ) ) ( not ( = ?auto_287883 ?auto_287886 ) ) ( not ( = ?auto_287883 ?auto_287887 ) ) ( not ( = ?auto_287884 ?auto_287885 ) ) ( not ( = ?auto_287884 ?auto_287886 ) ) ( not ( = ?auto_287884 ?auto_287887 ) ) ( not ( = ?auto_287885 ?auto_287886 ) ) ( not ( = ?auto_287885 ?auto_287887 ) ) ( not ( = ?auto_287886 ?auto_287887 ) ) ( ON ?auto_287885 ?auto_287886 ) ( CLEAR ?auto_287883 ) ( ON ?auto_287884 ?auto_287885 ) ( CLEAR ?auto_287884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_287883 ?auto_287884 )
      ( MAKE-4PILE ?auto_287883 ?auto_287884 ?auto_287885 ?auto_287886 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_287901 - BLOCK
      ?auto_287902 - BLOCK
      ?auto_287903 - BLOCK
      ?auto_287904 - BLOCK
    )
    :vars
    (
      ?auto_287905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287904 ?auto_287905 ) ( not ( = ?auto_287901 ?auto_287902 ) ) ( not ( = ?auto_287901 ?auto_287903 ) ) ( not ( = ?auto_287901 ?auto_287904 ) ) ( not ( = ?auto_287901 ?auto_287905 ) ) ( not ( = ?auto_287902 ?auto_287903 ) ) ( not ( = ?auto_287902 ?auto_287904 ) ) ( not ( = ?auto_287902 ?auto_287905 ) ) ( not ( = ?auto_287903 ?auto_287904 ) ) ( not ( = ?auto_287903 ?auto_287905 ) ) ( not ( = ?auto_287904 ?auto_287905 ) ) ( ON ?auto_287903 ?auto_287904 ) ( ON ?auto_287902 ?auto_287903 ) ( ON ?auto_287901 ?auto_287902 ) ( CLEAR ?auto_287901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_287901 )
      ( MAKE-4PILE ?auto_287901 ?auto_287902 ?auto_287903 ?auto_287904 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_287920 - BLOCK
      ?auto_287921 - BLOCK
      ?auto_287922 - BLOCK
      ?auto_287923 - BLOCK
      ?auto_287924 - BLOCK
    )
    :vars
    (
      ?auto_287925 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_287923 ) ( ON ?auto_287924 ?auto_287925 ) ( CLEAR ?auto_287924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_287920 ) ( ON ?auto_287921 ?auto_287920 ) ( ON ?auto_287922 ?auto_287921 ) ( ON ?auto_287923 ?auto_287922 ) ( not ( = ?auto_287920 ?auto_287921 ) ) ( not ( = ?auto_287920 ?auto_287922 ) ) ( not ( = ?auto_287920 ?auto_287923 ) ) ( not ( = ?auto_287920 ?auto_287924 ) ) ( not ( = ?auto_287920 ?auto_287925 ) ) ( not ( = ?auto_287921 ?auto_287922 ) ) ( not ( = ?auto_287921 ?auto_287923 ) ) ( not ( = ?auto_287921 ?auto_287924 ) ) ( not ( = ?auto_287921 ?auto_287925 ) ) ( not ( = ?auto_287922 ?auto_287923 ) ) ( not ( = ?auto_287922 ?auto_287924 ) ) ( not ( = ?auto_287922 ?auto_287925 ) ) ( not ( = ?auto_287923 ?auto_287924 ) ) ( not ( = ?auto_287923 ?auto_287925 ) ) ( not ( = ?auto_287924 ?auto_287925 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287924 ?auto_287925 )
      ( !STACK ?auto_287924 ?auto_287923 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_287942 - BLOCK
      ?auto_287943 - BLOCK
      ?auto_287944 - BLOCK
      ?auto_287945 - BLOCK
      ?auto_287946 - BLOCK
    )
    :vars
    (
      ?auto_287947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287946 ?auto_287947 ) ( ON-TABLE ?auto_287942 ) ( ON ?auto_287943 ?auto_287942 ) ( ON ?auto_287944 ?auto_287943 ) ( not ( = ?auto_287942 ?auto_287943 ) ) ( not ( = ?auto_287942 ?auto_287944 ) ) ( not ( = ?auto_287942 ?auto_287945 ) ) ( not ( = ?auto_287942 ?auto_287946 ) ) ( not ( = ?auto_287942 ?auto_287947 ) ) ( not ( = ?auto_287943 ?auto_287944 ) ) ( not ( = ?auto_287943 ?auto_287945 ) ) ( not ( = ?auto_287943 ?auto_287946 ) ) ( not ( = ?auto_287943 ?auto_287947 ) ) ( not ( = ?auto_287944 ?auto_287945 ) ) ( not ( = ?auto_287944 ?auto_287946 ) ) ( not ( = ?auto_287944 ?auto_287947 ) ) ( not ( = ?auto_287945 ?auto_287946 ) ) ( not ( = ?auto_287945 ?auto_287947 ) ) ( not ( = ?auto_287946 ?auto_287947 ) ) ( CLEAR ?auto_287944 ) ( ON ?auto_287945 ?auto_287946 ) ( CLEAR ?auto_287945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_287942 ?auto_287943 ?auto_287944 ?auto_287945 )
      ( MAKE-5PILE ?auto_287942 ?auto_287943 ?auto_287944 ?auto_287945 ?auto_287946 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_287964 - BLOCK
      ?auto_287965 - BLOCK
      ?auto_287966 - BLOCK
      ?auto_287967 - BLOCK
      ?auto_287968 - BLOCK
    )
    :vars
    (
      ?auto_287969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287968 ?auto_287969 ) ( ON-TABLE ?auto_287964 ) ( ON ?auto_287965 ?auto_287964 ) ( not ( = ?auto_287964 ?auto_287965 ) ) ( not ( = ?auto_287964 ?auto_287966 ) ) ( not ( = ?auto_287964 ?auto_287967 ) ) ( not ( = ?auto_287964 ?auto_287968 ) ) ( not ( = ?auto_287964 ?auto_287969 ) ) ( not ( = ?auto_287965 ?auto_287966 ) ) ( not ( = ?auto_287965 ?auto_287967 ) ) ( not ( = ?auto_287965 ?auto_287968 ) ) ( not ( = ?auto_287965 ?auto_287969 ) ) ( not ( = ?auto_287966 ?auto_287967 ) ) ( not ( = ?auto_287966 ?auto_287968 ) ) ( not ( = ?auto_287966 ?auto_287969 ) ) ( not ( = ?auto_287967 ?auto_287968 ) ) ( not ( = ?auto_287967 ?auto_287969 ) ) ( not ( = ?auto_287968 ?auto_287969 ) ) ( ON ?auto_287967 ?auto_287968 ) ( CLEAR ?auto_287965 ) ( ON ?auto_287966 ?auto_287967 ) ( CLEAR ?auto_287966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_287964 ?auto_287965 ?auto_287966 )
      ( MAKE-5PILE ?auto_287964 ?auto_287965 ?auto_287966 ?auto_287967 ?auto_287968 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_287986 - BLOCK
      ?auto_287987 - BLOCK
      ?auto_287988 - BLOCK
      ?auto_287989 - BLOCK
      ?auto_287990 - BLOCK
    )
    :vars
    (
      ?auto_287991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_287990 ?auto_287991 ) ( ON-TABLE ?auto_287986 ) ( not ( = ?auto_287986 ?auto_287987 ) ) ( not ( = ?auto_287986 ?auto_287988 ) ) ( not ( = ?auto_287986 ?auto_287989 ) ) ( not ( = ?auto_287986 ?auto_287990 ) ) ( not ( = ?auto_287986 ?auto_287991 ) ) ( not ( = ?auto_287987 ?auto_287988 ) ) ( not ( = ?auto_287987 ?auto_287989 ) ) ( not ( = ?auto_287987 ?auto_287990 ) ) ( not ( = ?auto_287987 ?auto_287991 ) ) ( not ( = ?auto_287988 ?auto_287989 ) ) ( not ( = ?auto_287988 ?auto_287990 ) ) ( not ( = ?auto_287988 ?auto_287991 ) ) ( not ( = ?auto_287989 ?auto_287990 ) ) ( not ( = ?auto_287989 ?auto_287991 ) ) ( not ( = ?auto_287990 ?auto_287991 ) ) ( ON ?auto_287989 ?auto_287990 ) ( ON ?auto_287988 ?auto_287989 ) ( CLEAR ?auto_287986 ) ( ON ?auto_287987 ?auto_287988 ) ( CLEAR ?auto_287987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_287986 ?auto_287987 )
      ( MAKE-5PILE ?auto_287986 ?auto_287987 ?auto_287988 ?auto_287989 ?auto_287990 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_288008 - BLOCK
      ?auto_288009 - BLOCK
      ?auto_288010 - BLOCK
      ?auto_288011 - BLOCK
      ?auto_288012 - BLOCK
    )
    :vars
    (
      ?auto_288013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288012 ?auto_288013 ) ( not ( = ?auto_288008 ?auto_288009 ) ) ( not ( = ?auto_288008 ?auto_288010 ) ) ( not ( = ?auto_288008 ?auto_288011 ) ) ( not ( = ?auto_288008 ?auto_288012 ) ) ( not ( = ?auto_288008 ?auto_288013 ) ) ( not ( = ?auto_288009 ?auto_288010 ) ) ( not ( = ?auto_288009 ?auto_288011 ) ) ( not ( = ?auto_288009 ?auto_288012 ) ) ( not ( = ?auto_288009 ?auto_288013 ) ) ( not ( = ?auto_288010 ?auto_288011 ) ) ( not ( = ?auto_288010 ?auto_288012 ) ) ( not ( = ?auto_288010 ?auto_288013 ) ) ( not ( = ?auto_288011 ?auto_288012 ) ) ( not ( = ?auto_288011 ?auto_288013 ) ) ( not ( = ?auto_288012 ?auto_288013 ) ) ( ON ?auto_288011 ?auto_288012 ) ( ON ?auto_288010 ?auto_288011 ) ( ON ?auto_288009 ?auto_288010 ) ( ON ?auto_288008 ?auto_288009 ) ( CLEAR ?auto_288008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288008 )
      ( MAKE-5PILE ?auto_288008 ?auto_288009 ?auto_288010 ?auto_288011 ?auto_288012 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288031 - BLOCK
      ?auto_288032 - BLOCK
      ?auto_288033 - BLOCK
      ?auto_288034 - BLOCK
      ?auto_288035 - BLOCK
      ?auto_288036 - BLOCK
    )
    :vars
    (
      ?auto_288037 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_288035 ) ( ON ?auto_288036 ?auto_288037 ) ( CLEAR ?auto_288036 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_288031 ) ( ON ?auto_288032 ?auto_288031 ) ( ON ?auto_288033 ?auto_288032 ) ( ON ?auto_288034 ?auto_288033 ) ( ON ?auto_288035 ?auto_288034 ) ( not ( = ?auto_288031 ?auto_288032 ) ) ( not ( = ?auto_288031 ?auto_288033 ) ) ( not ( = ?auto_288031 ?auto_288034 ) ) ( not ( = ?auto_288031 ?auto_288035 ) ) ( not ( = ?auto_288031 ?auto_288036 ) ) ( not ( = ?auto_288031 ?auto_288037 ) ) ( not ( = ?auto_288032 ?auto_288033 ) ) ( not ( = ?auto_288032 ?auto_288034 ) ) ( not ( = ?auto_288032 ?auto_288035 ) ) ( not ( = ?auto_288032 ?auto_288036 ) ) ( not ( = ?auto_288032 ?auto_288037 ) ) ( not ( = ?auto_288033 ?auto_288034 ) ) ( not ( = ?auto_288033 ?auto_288035 ) ) ( not ( = ?auto_288033 ?auto_288036 ) ) ( not ( = ?auto_288033 ?auto_288037 ) ) ( not ( = ?auto_288034 ?auto_288035 ) ) ( not ( = ?auto_288034 ?auto_288036 ) ) ( not ( = ?auto_288034 ?auto_288037 ) ) ( not ( = ?auto_288035 ?auto_288036 ) ) ( not ( = ?auto_288035 ?auto_288037 ) ) ( not ( = ?auto_288036 ?auto_288037 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_288036 ?auto_288037 )
      ( !STACK ?auto_288036 ?auto_288035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288057 - BLOCK
      ?auto_288058 - BLOCK
      ?auto_288059 - BLOCK
      ?auto_288060 - BLOCK
      ?auto_288061 - BLOCK
      ?auto_288062 - BLOCK
    )
    :vars
    (
      ?auto_288063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288062 ?auto_288063 ) ( ON-TABLE ?auto_288057 ) ( ON ?auto_288058 ?auto_288057 ) ( ON ?auto_288059 ?auto_288058 ) ( ON ?auto_288060 ?auto_288059 ) ( not ( = ?auto_288057 ?auto_288058 ) ) ( not ( = ?auto_288057 ?auto_288059 ) ) ( not ( = ?auto_288057 ?auto_288060 ) ) ( not ( = ?auto_288057 ?auto_288061 ) ) ( not ( = ?auto_288057 ?auto_288062 ) ) ( not ( = ?auto_288057 ?auto_288063 ) ) ( not ( = ?auto_288058 ?auto_288059 ) ) ( not ( = ?auto_288058 ?auto_288060 ) ) ( not ( = ?auto_288058 ?auto_288061 ) ) ( not ( = ?auto_288058 ?auto_288062 ) ) ( not ( = ?auto_288058 ?auto_288063 ) ) ( not ( = ?auto_288059 ?auto_288060 ) ) ( not ( = ?auto_288059 ?auto_288061 ) ) ( not ( = ?auto_288059 ?auto_288062 ) ) ( not ( = ?auto_288059 ?auto_288063 ) ) ( not ( = ?auto_288060 ?auto_288061 ) ) ( not ( = ?auto_288060 ?auto_288062 ) ) ( not ( = ?auto_288060 ?auto_288063 ) ) ( not ( = ?auto_288061 ?auto_288062 ) ) ( not ( = ?auto_288061 ?auto_288063 ) ) ( not ( = ?auto_288062 ?auto_288063 ) ) ( CLEAR ?auto_288060 ) ( ON ?auto_288061 ?auto_288062 ) ( CLEAR ?auto_288061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_288057 ?auto_288058 ?auto_288059 ?auto_288060 ?auto_288061 )
      ( MAKE-6PILE ?auto_288057 ?auto_288058 ?auto_288059 ?auto_288060 ?auto_288061 ?auto_288062 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288083 - BLOCK
      ?auto_288084 - BLOCK
      ?auto_288085 - BLOCK
      ?auto_288086 - BLOCK
      ?auto_288087 - BLOCK
      ?auto_288088 - BLOCK
    )
    :vars
    (
      ?auto_288089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288088 ?auto_288089 ) ( ON-TABLE ?auto_288083 ) ( ON ?auto_288084 ?auto_288083 ) ( ON ?auto_288085 ?auto_288084 ) ( not ( = ?auto_288083 ?auto_288084 ) ) ( not ( = ?auto_288083 ?auto_288085 ) ) ( not ( = ?auto_288083 ?auto_288086 ) ) ( not ( = ?auto_288083 ?auto_288087 ) ) ( not ( = ?auto_288083 ?auto_288088 ) ) ( not ( = ?auto_288083 ?auto_288089 ) ) ( not ( = ?auto_288084 ?auto_288085 ) ) ( not ( = ?auto_288084 ?auto_288086 ) ) ( not ( = ?auto_288084 ?auto_288087 ) ) ( not ( = ?auto_288084 ?auto_288088 ) ) ( not ( = ?auto_288084 ?auto_288089 ) ) ( not ( = ?auto_288085 ?auto_288086 ) ) ( not ( = ?auto_288085 ?auto_288087 ) ) ( not ( = ?auto_288085 ?auto_288088 ) ) ( not ( = ?auto_288085 ?auto_288089 ) ) ( not ( = ?auto_288086 ?auto_288087 ) ) ( not ( = ?auto_288086 ?auto_288088 ) ) ( not ( = ?auto_288086 ?auto_288089 ) ) ( not ( = ?auto_288087 ?auto_288088 ) ) ( not ( = ?auto_288087 ?auto_288089 ) ) ( not ( = ?auto_288088 ?auto_288089 ) ) ( ON ?auto_288087 ?auto_288088 ) ( CLEAR ?auto_288085 ) ( ON ?auto_288086 ?auto_288087 ) ( CLEAR ?auto_288086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_288083 ?auto_288084 ?auto_288085 ?auto_288086 )
      ( MAKE-6PILE ?auto_288083 ?auto_288084 ?auto_288085 ?auto_288086 ?auto_288087 ?auto_288088 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288109 - BLOCK
      ?auto_288110 - BLOCK
      ?auto_288111 - BLOCK
      ?auto_288112 - BLOCK
      ?auto_288113 - BLOCK
      ?auto_288114 - BLOCK
    )
    :vars
    (
      ?auto_288115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288114 ?auto_288115 ) ( ON-TABLE ?auto_288109 ) ( ON ?auto_288110 ?auto_288109 ) ( not ( = ?auto_288109 ?auto_288110 ) ) ( not ( = ?auto_288109 ?auto_288111 ) ) ( not ( = ?auto_288109 ?auto_288112 ) ) ( not ( = ?auto_288109 ?auto_288113 ) ) ( not ( = ?auto_288109 ?auto_288114 ) ) ( not ( = ?auto_288109 ?auto_288115 ) ) ( not ( = ?auto_288110 ?auto_288111 ) ) ( not ( = ?auto_288110 ?auto_288112 ) ) ( not ( = ?auto_288110 ?auto_288113 ) ) ( not ( = ?auto_288110 ?auto_288114 ) ) ( not ( = ?auto_288110 ?auto_288115 ) ) ( not ( = ?auto_288111 ?auto_288112 ) ) ( not ( = ?auto_288111 ?auto_288113 ) ) ( not ( = ?auto_288111 ?auto_288114 ) ) ( not ( = ?auto_288111 ?auto_288115 ) ) ( not ( = ?auto_288112 ?auto_288113 ) ) ( not ( = ?auto_288112 ?auto_288114 ) ) ( not ( = ?auto_288112 ?auto_288115 ) ) ( not ( = ?auto_288113 ?auto_288114 ) ) ( not ( = ?auto_288113 ?auto_288115 ) ) ( not ( = ?auto_288114 ?auto_288115 ) ) ( ON ?auto_288113 ?auto_288114 ) ( ON ?auto_288112 ?auto_288113 ) ( CLEAR ?auto_288110 ) ( ON ?auto_288111 ?auto_288112 ) ( CLEAR ?auto_288111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_288109 ?auto_288110 ?auto_288111 )
      ( MAKE-6PILE ?auto_288109 ?auto_288110 ?auto_288111 ?auto_288112 ?auto_288113 ?auto_288114 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288135 - BLOCK
      ?auto_288136 - BLOCK
      ?auto_288137 - BLOCK
      ?auto_288138 - BLOCK
      ?auto_288139 - BLOCK
      ?auto_288140 - BLOCK
    )
    :vars
    (
      ?auto_288141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288140 ?auto_288141 ) ( ON-TABLE ?auto_288135 ) ( not ( = ?auto_288135 ?auto_288136 ) ) ( not ( = ?auto_288135 ?auto_288137 ) ) ( not ( = ?auto_288135 ?auto_288138 ) ) ( not ( = ?auto_288135 ?auto_288139 ) ) ( not ( = ?auto_288135 ?auto_288140 ) ) ( not ( = ?auto_288135 ?auto_288141 ) ) ( not ( = ?auto_288136 ?auto_288137 ) ) ( not ( = ?auto_288136 ?auto_288138 ) ) ( not ( = ?auto_288136 ?auto_288139 ) ) ( not ( = ?auto_288136 ?auto_288140 ) ) ( not ( = ?auto_288136 ?auto_288141 ) ) ( not ( = ?auto_288137 ?auto_288138 ) ) ( not ( = ?auto_288137 ?auto_288139 ) ) ( not ( = ?auto_288137 ?auto_288140 ) ) ( not ( = ?auto_288137 ?auto_288141 ) ) ( not ( = ?auto_288138 ?auto_288139 ) ) ( not ( = ?auto_288138 ?auto_288140 ) ) ( not ( = ?auto_288138 ?auto_288141 ) ) ( not ( = ?auto_288139 ?auto_288140 ) ) ( not ( = ?auto_288139 ?auto_288141 ) ) ( not ( = ?auto_288140 ?auto_288141 ) ) ( ON ?auto_288139 ?auto_288140 ) ( ON ?auto_288138 ?auto_288139 ) ( ON ?auto_288137 ?auto_288138 ) ( CLEAR ?auto_288135 ) ( ON ?auto_288136 ?auto_288137 ) ( CLEAR ?auto_288136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_288135 ?auto_288136 )
      ( MAKE-6PILE ?auto_288135 ?auto_288136 ?auto_288137 ?auto_288138 ?auto_288139 ?auto_288140 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_288161 - BLOCK
      ?auto_288162 - BLOCK
      ?auto_288163 - BLOCK
      ?auto_288164 - BLOCK
      ?auto_288165 - BLOCK
      ?auto_288166 - BLOCK
    )
    :vars
    (
      ?auto_288167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288166 ?auto_288167 ) ( not ( = ?auto_288161 ?auto_288162 ) ) ( not ( = ?auto_288161 ?auto_288163 ) ) ( not ( = ?auto_288161 ?auto_288164 ) ) ( not ( = ?auto_288161 ?auto_288165 ) ) ( not ( = ?auto_288161 ?auto_288166 ) ) ( not ( = ?auto_288161 ?auto_288167 ) ) ( not ( = ?auto_288162 ?auto_288163 ) ) ( not ( = ?auto_288162 ?auto_288164 ) ) ( not ( = ?auto_288162 ?auto_288165 ) ) ( not ( = ?auto_288162 ?auto_288166 ) ) ( not ( = ?auto_288162 ?auto_288167 ) ) ( not ( = ?auto_288163 ?auto_288164 ) ) ( not ( = ?auto_288163 ?auto_288165 ) ) ( not ( = ?auto_288163 ?auto_288166 ) ) ( not ( = ?auto_288163 ?auto_288167 ) ) ( not ( = ?auto_288164 ?auto_288165 ) ) ( not ( = ?auto_288164 ?auto_288166 ) ) ( not ( = ?auto_288164 ?auto_288167 ) ) ( not ( = ?auto_288165 ?auto_288166 ) ) ( not ( = ?auto_288165 ?auto_288167 ) ) ( not ( = ?auto_288166 ?auto_288167 ) ) ( ON ?auto_288165 ?auto_288166 ) ( ON ?auto_288164 ?auto_288165 ) ( ON ?auto_288163 ?auto_288164 ) ( ON ?auto_288162 ?auto_288163 ) ( ON ?auto_288161 ?auto_288162 ) ( CLEAR ?auto_288161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288161 )
      ( MAKE-6PILE ?auto_288161 ?auto_288162 ?auto_288163 ?auto_288164 ?auto_288165 ?auto_288166 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288188 - BLOCK
      ?auto_288189 - BLOCK
      ?auto_288190 - BLOCK
      ?auto_288191 - BLOCK
      ?auto_288192 - BLOCK
      ?auto_288193 - BLOCK
      ?auto_288194 - BLOCK
    )
    :vars
    (
      ?auto_288195 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_288193 ) ( ON ?auto_288194 ?auto_288195 ) ( CLEAR ?auto_288194 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_288188 ) ( ON ?auto_288189 ?auto_288188 ) ( ON ?auto_288190 ?auto_288189 ) ( ON ?auto_288191 ?auto_288190 ) ( ON ?auto_288192 ?auto_288191 ) ( ON ?auto_288193 ?auto_288192 ) ( not ( = ?auto_288188 ?auto_288189 ) ) ( not ( = ?auto_288188 ?auto_288190 ) ) ( not ( = ?auto_288188 ?auto_288191 ) ) ( not ( = ?auto_288188 ?auto_288192 ) ) ( not ( = ?auto_288188 ?auto_288193 ) ) ( not ( = ?auto_288188 ?auto_288194 ) ) ( not ( = ?auto_288188 ?auto_288195 ) ) ( not ( = ?auto_288189 ?auto_288190 ) ) ( not ( = ?auto_288189 ?auto_288191 ) ) ( not ( = ?auto_288189 ?auto_288192 ) ) ( not ( = ?auto_288189 ?auto_288193 ) ) ( not ( = ?auto_288189 ?auto_288194 ) ) ( not ( = ?auto_288189 ?auto_288195 ) ) ( not ( = ?auto_288190 ?auto_288191 ) ) ( not ( = ?auto_288190 ?auto_288192 ) ) ( not ( = ?auto_288190 ?auto_288193 ) ) ( not ( = ?auto_288190 ?auto_288194 ) ) ( not ( = ?auto_288190 ?auto_288195 ) ) ( not ( = ?auto_288191 ?auto_288192 ) ) ( not ( = ?auto_288191 ?auto_288193 ) ) ( not ( = ?auto_288191 ?auto_288194 ) ) ( not ( = ?auto_288191 ?auto_288195 ) ) ( not ( = ?auto_288192 ?auto_288193 ) ) ( not ( = ?auto_288192 ?auto_288194 ) ) ( not ( = ?auto_288192 ?auto_288195 ) ) ( not ( = ?auto_288193 ?auto_288194 ) ) ( not ( = ?auto_288193 ?auto_288195 ) ) ( not ( = ?auto_288194 ?auto_288195 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_288194 ?auto_288195 )
      ( !STACK ?auto_288194 ?auto_288193 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288218 - BLOCK
      ?auto_288219 - BLOCK
      ?auto_288220 - BLOCK
      ?auto_288221 - BLOCK
      ?auto_288222 - BLOCK
      ?auto_288223 - BLOCK
      ?auto_288224 - BLOCK
    )
    :vars
    (
      ?auto_288225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288224 ?auto_288225 ) ( ON-TABLE ?auto_288218 ) ( ON ?auto_288219 ?auto_288218 ) ( ON ?auto_288220 ?auto_288219 ) ( ON ?auto_288221 ?auto_288220 ) ( ON ?auto_288222 ?auto_288221 ) ( not ( = ?auto_288218 ?auto_288219 ) ) ( not ( = ?auto_288218 ?auto_288220 ) ) ( not ( = ?auto_288218 ?auto_288221 ) ) ( not ( = ?auto_288218 ?auto_288222 ) ) ( not ( = ?auto_288218 ?auto_288223 ) ) ( not ( = ?auto_288218 ?auto_288224 ) ) ( not ( = ?auto_288218 ?auto_288225 ) ) ( not ( = ?auto_288219 ?auto_288220 ) ) ( not ( = ?auto_288219 ?auto_288221 ) ) ( not ( = ?auto_288219 ?auto_288222 ) ) ( not ( = ?auto_288219 ?auto_288223 ) ) ( not ( = ?auto_288219 ?auto_288224 ) ) ( not ( = ?auto_288219 ?auto_288225 ) ) ( not ( = ?auto_288220 ?auto_288221 ) ) ( not ( = ?auto_288220 ?auto_288222 ) ) ( not ( = ?auto_288220 ?auto_288223 ) ) ( not ( = ?auto_288220 ?auto_288224 ) ) ( not ( = ?auto_288220 ?auto_288225 ) ) ( not ( = ?auto_288221 ?auto_288222 ) ) ( not ( = ?auto_288221 ?auto_288223 ) ) ( not ( = ?auto_288221 ?auto_288224 ) ) ( not ( = ?auto_288221 ?auto_288225 ) ) ( not ( = ?auto_288222 ?auto_288223 ) ) ( not ( = ?auto_288222 ?auto_288224 ) ) ( not ( = ?auto_288222 ?auto_288225 ) ) ( not ( = ?auto_288223 ?auto_288224 ) ) ( not ( = ?auto_288223 ?auto_288225 ) ) ( not ( = ?auto_288224 ?auto_288225 ) ) ( CLEAR ?auto_288222 ) ( ON ?auto_288223 ?auto_288224 ) ( CLEAR ?auto_288223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_288218 ?auto_288219 ?auto_288220 ?auto_288221 ?auto_288222 ?auto_288223 )
      ( MAKE-7PILE ?auto_288218 ?auto_288219 ?auto_288220 ?auto_288221 ?auto_288222 ?auto_288223 ?auto_288224 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288248 - BLOCK
      ?auto_288249 - BLOCK
      ?auto_288250 - BLOCK
      ?auto_288251 - BLOCK
      ?auto_288252 - BLOCK
      ?auto_288253 - BLOCK
      ?auto_288254 - BLOCK
    )
    :vars
    (
      ?auto_288255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288254 ?auto_288255 ) ( ON-TABLE ?auto_288248 ) ( ON ?auto_288249 ?auto_288248 ) ( ON ?auto_288250 ?auto_288249 ) ( ON ?auto_288251 ?auto_288250 ) ( not ( = ?auto_288248 ?auto_288249 ) ) ( not ( = ?auto_288248 ?auto_288250 ) ) ( not ( = ?auto_288248 ?auto_288251 ) ) ( not ( = ?auto_288248 ?auto_288252 ) ) ( not ( = ?auto_288248 ?auto_288253 ) ) ( not ( = ?auto_288248 ?auto_288254 ) ) ( not ( = ?auto_288248 ?auto_288255 ) ) ( not ( = ?auto_288249 ?auto_288250 ) ) ( not ( = ?auto_288249 ?auto_288251 ) ) ( not ( = ?auto_288249 ?auto_288252 ) ) ( not ( = ?auto_288249 ?auto_288253 ) ) ( not ( = ?auto_288249 ?auto_288254 ) ) ( not ( = ?auto_288249 ?auto_288255 ) ) ( not ( = ?auto_288250 ?auto_288251 ) ) ( not ( = ?auto_288250 ?auto_288252 ) ) ( not ( = ?auto_288250 ?auto_288253 ) ) ( not ( = ?auto_288250 ?auto_288254 ) ) ( not ( = ?auto_288250 ?auto_288255 ) ) ( not ( = ?auto_288251 ?auto_288252 ) ) ( not ( = ?auto_288251 ?auto_288253 ) ) ( not ( = ?auto_288251 ?auto_288254 ) ) ( not ( = ?auto_288251 ?auto_288255 ) ) ( not ( = ?auto_288252 ?auto_288253 ) ) ( not ( = ?auto_288252 ?auto_288254 ) ) ( not ( = ?auto_288252 ?auto_288255 ) ) ( not ( = ?auto_288253 ?auto_288254 ) ) ( not ( = ?auto_288253 ?auto_288255 ) ) ( not ( = ?auto_288254 ?auto_288255 ) ) ( ON ?auto_288253 ?auto_288254 ) ( CLEAR ?auto_288251 ) ( ON ?auto_288252 ?auto_288253 ) ( CLEAR ?auto_288252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_288248 ?auto_288249 ?auto_288250 ?auto_288251 ?auto_288252 )
      ( MAKE-7PILE ?auto_288248 ?auto_288249 ?auto_288250 ?auto_288251 ?auto_288252 ?auto_288253 ?auto_288254 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288278 - BLOCK
      ?auto_288279 - BLOCK
      ?auto_288280 - BLOCK
      ?auto_288281 - BLOCK
      ?auto_288282 - BLOCK
      ?auto_288283 - BLOCK
      ?auto_288284 - BLOCK
    )
    :vars
    (
      ?auto_288285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288284 ?auto_288285 ) ( ON-TABLE ?auto_288278 ) ( ON ?auto_288279 ?auto_288278 ) ( ON ?auto_288280 ?auto_288279 ) ( not ( = ?auto_288278 ?auto_288279 ) ) ( not ( = ?auto_288278 ?auto_288280 ) ) ( not ( = ?auto_288278 ?auto_288281 ) ) ( not ( = ?auto_288278 ?auto_288282 ) ) ( not ( = ?auto_288278 ?auto_288283 ) ) ( not ( = ?auto_288278 ?auto_288284 ) ) ( not ( = ?auto_288278 ?auto_288285 ) ) ( not ( = ?auto_288279 ?auto_288280 ) ) ( not ( = ?auto_288279 ?auto_288281 ) ) ( not ( = ?auto_288279 ?auto_288282 ) ) ( not ( = ?auto_288279 ?auto_288283 ) ) ( not ( = ?auto_288279 ?auto_288284 ) ) ( not ( = ?auto_288279 ?auto_288285 ) ) ( not ( = ?auto_288280 ?auto_288281 ) ) ( not ( = ?auto_288280 ?auto_288282 ) ) ( not ( = ?auto_288280 ?auto_288283 ) ) ( not ( = ?auto_288280 ?auto_288284 ) ) ( not ( = ?auto_288280 ?auto_288285 ) ) ( not ( = ?auto_288281 ?auto_288282 ) ) ( not ( = ?auto_288281 ?auto_288283 ) ) ( not ( = ?auto_288281 ?auto_288284 ) ) ( not ( = ?auto_288281 ?auto_288285 ) ) ( not ( = ?auto_288282 ?auto_288283 ) ) ( not ( = ?auto_288282 ?auto_288284 ) ) ( not ( = ?auto_288282 ?auto_288285 ) ) ( not ( = ?auto_288283 ?auto_288284 ) ) ( not ( = ?auto_288283 ?auto_288285 ) ) ( not ( = ?auto_288284 ?auto_288285 ) ) ( ON ?auto_288283 ?auto_288284 ) ( ON ?auto_288282 ?auto_288283 ) ( CLEAR ?auto_288280 ) ( ON ?auto_288281 ?auto_288282 ) ( CLEAR ?auto_288281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_288278 ?auto_288279 ?auto_288280 ?auto_288281 )
      ( MAKE-7PILE ?auto_288278 ?auto_288279 ?auto_288280 ?auto_288281 ?auto_288282 ?auto_288283 ?auto_288284 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288308 - BLOCK
      ?auto_288309 - BLOCK
      ?auto_288310 - BLOCK
      ?auto_288311 - BLOCK
      ?auto_288312 - BLOCK
      ?auto_288313 - BLOCK
      ?auto_288314 - BLOCK
    )
    :vars
    (
      ?auto_288315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288314 ?auto_288315 ) ( ON-TABLE ?auto_288308 ) ( ON ?auto_288309 ?auto_288308 ) ( not ( = ?auto_288308 ?auto_288309 ) ) ( not ( = ?auto_288308 ?auto_288310 ) ) ( not ( = ?auto_288308 ?auto_288311 ) ) ( not ( = ?auto_288308 ?auto_288312 ) ) ( not ( = ?auto_288308 ?auto_288313 ) ) ( not ( = ?auto_288308 ?auto_288314 ) ) ( not ( = ?auto_288308 ?auto_288315 ) ) ( not ( = ?auto_288309 ?auto_288310 ) ) ( not ( = ?auto_288309 ?auto_288311 ) ) ( not ( = ?auto_288309 ?auto_288312 ) ) ( not ( = ?auto_288309 ?auto_288313 ) ) ( not ( = ?auto_288309 ?auto_288314 ) ) ( not ( = ?auto_288309 ?auto_288315 ) ) ( not ( = ?auto_288310 ?auto_288311 ) ) ( not ( = ?auto_288310 ?auto_288312 ) ) ( not ( = ?auto_288310 ?auto_288313 ) ) ( not ( = ?auto_288310 ?auto_288314 ) ) ( not ( = ?auto_288310 ?auto_288315 ) ) ( not ( = ?auto_288311 ?auto_288312 ) ) ( not ( = ?auto_288311 ?auto_288313 ) ) ( not ( = ?auto_288311 ?auto_288314 ) ) ( not ( = ?auto_288311 ?auto_288315 ) ) ( not ( = ?auto_288312 ?auto_288313 ) ) ( not ( = ?auto_288312 ?auto_288314 ) ) ( not ( = ?auto_288312 ?auto_288315 ) ) ( not ( = ?auto_288313 ?auto_288314 ) ) ( not ( = ?auto_288313 ?auto_288315 ) ) ( not ( = ?auto_288314 ?auto_288315 ) ) ( ON ?auto_288313 ?auto_288314 ) ( ON ?auto_288312 ?auto_288313 ) ( ON ?auto_288311 ?auto_288312 ) ( CLEAR ?auto_288309 ) ( ON ?auto_288310 ?auto_288311 ) ( CLEAR ?auto_288310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_288308 ?auto_288309 ?auto_288310 )
      ( MAKE-7PILE ?auto_288308 ?auto_288309 ?auto_288310 ?auto_288311 ?auto_288312 ?auto_288313 ?auto_288314 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288338 - BLOCK
      ?auto_288339 - BLOCK
      ?auto_288340 - BLOCK
      ?auto_288341 - BLOCK
      ?auto_288342 - BLOCK
      ?auto_288343 - BLOCK
      ?auto_288344 - BLOCK
    )
    :vars
    (
      ?auto_288345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288344 ?auto_288345 ) ( ON-TABLE ?auto_288338 ) ( not ( = ?auto_288338 ?auto_288339 ) ) ( not ( = ?auto_288338 ?auto_288340 ) ) ( not ( = ?auto_288338 ?auto_288341 ) ) ( not ( = ?auto_288338 ?auto_288342 ) ) ( not ( = ?auto_288338 ?auto_288343 ) ) ( not ( = ?auto_288338 ?auto_288344 ) ) ( not ( = ?auto_288338 ?auto_288345 ) ) ( not ( = ?auto_288339 ?auto_288340 ) ) ( not ( = ?auto_288339 ?auto_288341 ) ) ( not ( = ?auto_288339 ?auto_288342 ) ) ( not ( = ?auto_288339 ?auto_288343 ) ) ( not ( = ?auto_288339 ?auto_288344 ) ) ( not ( = ?auto_288339 ?auto_288345 ) ) ( not ( = ?auto_288340 ?auto_288341 ) ) ( not ( = ?auto_288340 ?auto_288342 ) ) ( not ( = ?auto_288340 ?auto_288343 ) ) ( not ( = ?auto_288340 ?auto_288344 ) ) ( not ( = ?auto_288340 ?auto_288345 ) ) ( not ( = ?auto_288341 ?auto_288342 ) ) ( not ( = ?auto_288341 ?auto_288343 ) ) ( not ( = ?auto_288341 ?auto_288344 ) ) ( not ( = ?auto_288341 ?auto_288345 ) ) ( not ( = ?auto_288342 ?auto_288343 ) ) ( not ( = ?auto_288342 ?auto_288344 ) ) ( not ( = ?auto_288342 ?auto_288345 ) ) ( not ( = ?auto_288343 ?auto_288344 ) ) ( not ( = ?auto_288343 ?auto_288345 ) ) ( not ( = ?auto_288344 ?auto_288345 ) ) ( ON ?auto_288343 ?auto_288344 ) ( ON ?auto_288342 ?auto_288343 ) ( ON ?auto_288341 ?auto_288342 ) ( ON ?auto_288340 ?auto_288341 ) ( CLEAR ?auto_288338 ) ( ON ?auto_288339 ?auto_288340 ) ( CLEAR ?auto_288339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_288338 ?auto_288339 )
      ( MAKE-7PILE ?auto_288338 ?auto_288339 ?auto_288340 ?auto_288341 ?auto_288342 ?auto_288343 ?auto_288344 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_288368 - BLOCK
      ?auto_288369 - BLOCK
      ?auto_288370 - BLOCK
      ?auto_288371 - BLOCK
      ?auto_288372 - BLOCK
      ?auto_288373 - BLOCK
      ?auto_288374 - BLOCK
    )
    :vars
    (
      ?auto_288375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288374 ?auto_288375 ) ( not ( = ?auto_288368 ?auto_288369 ) ) ( not ( = ?auto_288368 ?auto_288370 ) ) ( not ( = ?auto_288368 ?auto_288371 ) ) ( not ( = ?auto_288368 ?auto_288372 ) ) ( not ( = ?auto_288368 ?auto_288373 ) ) ( not ( = ?auto_288368 ?auto_288374 ) ) ( not ( = ?auto_288368 ?auto_288375 ) ) ( not ( = ?auto_288369 ?auto_288370 ) ) ( not ( = ?auto_288369 ?auto_288371 ) ) ( not ( = ?auto_288369 ?auto_288372 ) ) ( not ( = ?auto_288369 ?auto_288373 ) ) ( not ( = ?auto_288369 ?auto_288374 ) ) ( not ( = ?auto_288369 ?auto_288375 ) ) ( not ( = ?auto_288370 ?auto_288371 ) ) ( not ( = ?auto_288370 ?auto_288372 ) ) ( not ( = ?auto_288370 ?auto_288373 ) ) ( not ( = ?auto_288370 ?auto_288374 ) ) ( not ( = ?auto_288370 ?auto_288375 ) ) ( not ( = ?auto_288371 ?auto_288372 ) ) ( not ( = ?auto_288371 ?auto_288373 ) ) ( not ( = ?auto_288371 ?auto_288374 ) ) ( not ( = ?auto_288371 ?auto_288375 ) ) ( not ( = ?auto_288372 ?auto_288373 ) ) ( not ( = ?auto_288372 ?auto_288374 ) ) ( not ( = ?auto_288372 ?auto_288375 ) ) ( not ( = ?auto_288373 ?auto_288374 ) ) ( not ( = ?auto_288373 ?auto_288375 ) ) ( not ( = ?auto_288374 ?auto_288375 ) ) ( ON ?auto_288373 ?auto_288374 ) ( ON ?auto_288372 ?auto_288373 ) ( ON ?auto_288371 ?auto_288372 ) ( ON ?auto_288370 ?auto_288371 ) ( ON ?auto_288369 ?auto_288370 ) ( ON ?auto_288368 ?auto_288369 ) ( CLEAR ?auto_288368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288368 )
      ( MAKE-7PILE ?auto_288368 ?auto_288369 ?auto_288370 ?auto_288371 ?auto_288372 ?auto_288373 ?auto_288374 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288399 - BLOCK
      ?auto_288400 - BLOCK
      ?auto_288401 - BLOCK
      ?auto_288402 - BLOCK
      ?auto_288403 - BLOCK
      ?auto_288404 - BLOCK
      ?auto_288405 - BLOCK
      ?auto_288406 - BLOCK
    )
    :vars
    (
      ?auto_288407 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_288405 ) ( ON ?auto_288406 ?auto_288407 ) ( CLEAR ?auto_288406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_288399 ) ( ON ?auto_288400 ?auto_288399 ) ( ON ?auto_288401 ?auto_288400 ) ( ON ?auto_288402 ?auto_288401 ) ( ON ?auto_288403 ?auto_288402 ) ( ON ?auto_288404 ?auto_288403 ) ( ON ?auto_288405 ?auto_288404 ) ( not ( = ?auto_288399 ?auto_288400 ) ) ( not ( = ?auto_288399 ?auto_288401 ) ) ( not ( = ?auto_288399 ?auto_288402 ) ) ( not ( = ?auto_288399 ?auto_288403 ) ) ( not ( = ?auto_288399 ?auto_288404 ) ) ( not ( = ?auto_288399 ?auto_288405 ) ) ( not ( = ?auto_288399 ?auto_288406 ) ) ( not ( = ?auto_288399 ?auto_288407 ) ) ( not ( = ?auto_288400 ?auto_288401 ) ) ( not ( = ?auto_288400 ?auto_288402 ) ) ( not ( = ?auto_288400 ?auto_288403 ) ) ( not ( = ?auto_288400 ?auto_288404 ) ) ( not ( = ?auto_288400 ?auto_288405 ) ) ( not ( = ?auto_288400 ?auto_288406 ) ) ( not ( = ?auto_288400 ?auto_288407 ) ) ( not ( = ?auto_288401 ?auto_288402 ) ) ( not ( = ?auto_288401 ?auto_288403 ) ) ( not ( = ?auto_288401 ?auto_288404 ) ) ( not ( = ?auto_288401 ?auto_288405 ) ) ( not ( = ?auto_288401 ?auto_288406 ) ) ( not ( = ?auto_288401 ?auto_288407 ) ) ( not ( = ?auto_288402 ?auto_288403 ) ) ( not ( = ?auto_288402 ?auto_288404 ) ) ( not ( = ?auto_288402 ?auto_288405 ) ) ( not ( = ?auto_288402 ?auto_288406 ) ) ( not ( = ?auto_288402 ?auto_288407 ) ) ( not ( = ?auto_288403 ?auto_288404 ) ) ( not ( = ?auto_288403 ?auto_288405 ) ) ( not ( = ?auto_288403 ?auto_288406 ) ) ( not ( = ?auto_288403 ?auto_288407 ) ) ( not ( = ?auto_288404 ?auto_288405 ) ) ( not ( = ?auto_288404 ?auto_288406 ) ) ( not ( = ?auto_288404 ?auto_288407 ) ) ( not ( = ?auto_288405 ?auto_288406 ) ) ( not ( = ?auto_288405 ?auto_288407 ) ) ( not ( = ?auto_288406 ?auto_288407 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_288406 ?auto_288407 )
      ( !STACK ?auto_288406 ?auto_288405 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288433 - BLOCK
      ?auto_288434 - BLOCK
      ?auto_288435 - BLOCK
      ?auto_288436 - BLOCK
      ?auto_288437 - BLOCK
      ?auto_288438 - BLOCK
      ?auto_288439 - BLOCK
      ?auto_288440 - BLOCK
    )
    :vars
    (
      ?auto_288441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288440 ?auto_288441 ) ( ON-TABLE ?auto_288433 ) ( ON ?auto_288434 ?auto_288433 ) ( ON ?auto_288435 ?auto_288434 ) ( ON ?auto_288436 ?auto_288435 ) ( ON ?auto_288437 ?auto_288436 ) ( ON ?auto_288438 ?auto_288437 ) ( not ( = ?auto_288433 ?auto_288434 ) ) ( not ( = ?auto_288433 ?auto_288435 ) ) ( not ( = ?auto_288433 ?auto_288436 ) ) ( not ( = ?auto_288433 ?auto_288437 ) ) ( not ( = ?auto_288433 ?auto_288438 ) ) ( not ( = ?auto_288433 ?auto_288439 ) ) ( not ( = ?auto_288433 ?auto_288440 ) ) ( not ( = ?auto_288433 ?auto_288441 ) ) ( not ( = ?auto_288434 ?auto_288435 ) ) ( not ( = ?auto_288434 ?auto_288436 ) ) ( not ( = ?auto_288434 ?auto_288437 ) ) ( not ( = ?auto_288434 ?auto_288438 ) ) ( not ( = ?auto_288434 ?auto_288439 ) ) ( not ( = ?auto_288434 ?auto_288440 ) ) ( not ( = ?auto_288434 ?auto_288441 ) ) ( not ( = ?auto_288435 ?auto_288436 ) ) ( not ( = ?auto_288435 ?auto_288437 ) ) ( not ( = ?auto_288435 ?auto_288438 ) ) ( not ( = ?auto_288435 ?auto_288439 ) ) ( not ( = ?auto_288435 ?auto_288440 ) ) ( not ( = ?auto_288435 ?auto_288441 ) ) ( not ( = ?auto_288436 ?auto_288437 ) ) ( not ( = ?auto_288436 ?auto_288438 ) ) ( not ( = ?auto_288436 ?auto_288439 ) ) ( not ( = ?auto_288436 ?auto_288440 ) ) ( not ( = ?auto_288436 ?auto_288441 ) ) ( not ( = ?auto_288437 ?auto_288438 ) ) ( not ( = ?auto_288437 ?auto_288439 ) ) ( not ( = ?auto_288437 ?auto_288440 ) ) ( not ( = ?auto_288437 ?auto_288441 ) ) ( not ( = ?auto_288438 ?auto_288439 ) ) ( not ( = ?auto_288438 ?auto_288440 ) ) ( not ( = ?auto_288438 ?auto_288441 ) ) ( not ( = ?auto_288439 ?auto_288440 ) ) ( not ( = ?auto_288439 ?auto_288441 ) ) ( not ( = ?auto_288440 ?auto_288441 ) ) ( CLEAR ?auto_288438 ) ( ON ?auto_288439 ?auto_288440 ) ( CLEAR ?auto_288439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_288433 ?auto_288434 ?auto_288435 ?auto_288436 ?auto_288437 ?auto_288438 ?auto_288439 )
      ( MAKE-8PILE ?auto_288433 ?auto_288434 ?auto_288435 ?auto_288436 ?auto_288437 ?auto_288438 ?auto_288439 ?auto_288440 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288467 - BLOCK
      ?auto_288468 - BLOCK
      ?auto_288469 - BLOCK
      ?auto_288470 - BLOCK
      ?auto_288471 - BLOCK
      ?auto_288472 - BLOCK
      ?auto_288473 - BLOCK
      ?auto_288474 - BLOCK
    )
    :vars
    (
      ?auto_288475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288474 ?auto_288475 ) ( ON-TABLE ?auto_288467 ) ( ON ?auto_288468 ?auto_288467 ) ( ON ?auto_288469 ?auto_288468 ) ( ON ?auto_288470 ?auto_288469 ) ( ON ?auto_288471 ?auto_288470 ) ( not ( = ?auto_288467 ?auto_288468 ) ) ( not ( = ?auto_288467 ?auto_288469 ) ) ( not ( = ?auto_288467 ?auto_288470 ) ) ( not ( = ?auto_288467 ?auto_288471 ) ) ( not ( = ?auto_288467 ?auto_288472 ) ) ( not ( = ?auto_288467 ?auto_288473 ) ) ( not ( = ?auto_288467 ?auto_288474 ) ) ( not ( = ?auto_288467 ?auto_288475 ) ) ( not ( = ?auto_288468 ?auto_288469 ) ) ( not ( = ?auto_288468 ?auto_288470 ) ) ( not ( = ?auto_288468 ?auto_288471 ) ) ( not ( = ?auto_288468 ?auto_288472 ) ) ( not ( = ?auto_288468 ?auto_288473 ) ) ( not ( = ?auto_288468 ?auto_288474 ) ) ( not ( = ?auto_288468 ?auto_288475 ) ) ( not ( = ?auto_288469 ?auto_288470 ) ) ( not ( = ?auto_288469 ?auto_288471 ) ) ( not ( = ?auto_288469 ?auto_288472 ) ) ( not ( = ?auto_288469 ?auto_288473 ) ) ( not ( = ?auto_288469 ?auto_288474 ) ) ( not ( = ?auto_288469 ?auto_288475 ) ) ( not ( = ?auto_288470 ?auto_288471 ) ) ( not ( = ?auto_288470 ?auto_288472 ) ) ( not ( = ?auto_288470 ?auto_288473 ) ) ( not ( = ?auto_288470 ?auto_288474 ) ) ( not ( = ?auto_288470 ?auto_288475 ) ) ( not ( = ?auto_288471 ?auto_288472 ) ) ( not ( = ?auto_288471 ?auto_288473 ) ) ( not ( = ?auto_288471 ?auto_288474 ) ) ( not ( = ?auto_288471 ?auto_288475 ) ) ( not ( = ?auto_288472 ?auto_288473 ) ) ( not ( = ?auto_288472 ?auto_288474 ) ) ( not ( = ?auto_288472 ?auto_288475 ) ) ( not ( = ?auto_288473 ?auto_288474 ) ) ( not ( = ?auto_288473 ?auto_288475 ) ) ( not ( = ?auto_288474 ?auto_288475 ) ) ( ON ?auto_288473 ?auto_288474 ) ( CLEAR ?auto_288471 ) ( ON ?auto_288472 ?auto_288473 ) ( CLEAR ?auto_288472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_288467 ?auto_288468 ?auto_288469 ?auto_288470 ?auto_288471 ?auto_288472 )
      ( MAKE-8PILE ?auto_288467 ?auto_288468 ?auto_288469 ?auto_288470 ?auto_288471 ?auto_288472 ?auto_288473 ?auto_288474 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288501 - BLOCK
      ?auto_288502 - BLOCK
      ?auto_288503 - BLOCK
      ?auto_288504 - BLOCK
      ?auto_288505 - BLOCK
      ?auto_288506 - BLOCK
      ?auto_288507 - BLOCK
      ?auto_288508 - BLOCK
    )
    :vars
    (
      ?auto_288509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288508 ?auto_288509 ) ( ON-TABLE ?auto_288501 ) ( ON ?auto_288502 ?auto_288501 ) ( ON ?auto_288503 ?auto_288502 ) ( ON ?auto_288504 ?auto_288503 ) ( not ( = ?auto_288501 ?auto_288502 ) ) ( not ( = ?auto_288501 ?auto_288503 ) ) ( not ( = ?auto_288501 ?auto_288504 ) ) ( not ( = ?auto_288501 ?auto_288505 ) ) ( not ( = ?auto_288501 ?auto_288506 ) ) ( not ( = ?auto_288501 ?auto_288507 ) ) ( not ( = ?auto_288501 ?auto_288508 ) ) ( not ( = ?auto_288501 ?auto_288509 ) ) ( not ( = ?auto_288502 ?auto_288503 ) ) ( not ( = ?auto_288502 ?auto_288504 ) ) ( not ( = ?auto_288502 ?auto_288505 ) ) ( not ( = ?auto_288502 ?auto_288506 ) ) ( not ( = ?auto_288502 ?auto_288507 ) ) ( not ( = ?auto_288502 ?auto_288508 ) ) ( not ( = ?auto_288502 ?auto_288509 ) ) ( not ( = ?auto_288503 ?auto_288504 ) ) ( not ( = ?auto_288503 ?auto_288505 ) ) ( not ( = ?auto_288503 ?auto_288506 ) ) ( not ( = ?auto_288503 ?auto_288507 ) ) ( not ( = ?auto_288503 ?auto_288508 ) ) ( not ( = ?auto_288503 ?auto_288509 ) ) ( not ( = ?auto_288504 ?auto_288505 ) ) ( not ( = ?auto_288504 ?auto_288506 ) ) ( not ( = ?auto_288504 ?auto_288507 ) ) ( not ( = ?auto_288504 ?auto_288508 ) ) ( not ( = ?auto_288504 ?auto_288509 ) ) ( not ( = ?auto_288505 ?auto_288506 ) ) ( not ( = ?auto_288505 ?auto_288507 ) ) ( not ( = ?auto_288505 ?auto_288508 ) ) ( not ( = ?auto_288505 ?auto_288509 ) ) ( not ( = ?auto_288506 ?auto_288507 ) ) ( not ( = ?auto_288506 ?auto_288508 ) ) ( not ( = ?auto_288506 ?auto_288509 ) ) ( not ( = ?auto_288507 ?auto_288508 ) ) ( not ( = ?auto_288507 ?auto_288509 ) ) ( not ( = ?auto_288508 ?auto_288509 ) ) ( ON ?auto_288507 ?auto_288508 ) ( ON ?auto_288506 ?auto_288507 ) ( CLEAR ?auto_288504 ) ( ON ?auto_288505 ?auto_288506 ) ( CLEAR ?auto_288505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_288501 ?auto_288502 ?auto_288503 ?auto_288504 ?auto_288505 )
      ( MAKE-8PILE ?auto_288501 ?auto_288502 ?auto_288503 ?auto_288504 ?auto_288505 ?auto_288506 ?auto_288507 ?auto_288508 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288535 - BLOCK
      ?auto_288536 - BLOCK
      ?auto_288537 - BLOCK
      ?auto_288538 - BLOCK
      ?auto_288539 - BLOCK
      ?auto_288540 - BLOCK
      ?auto_288541 - BLOCK
      ?auto_288542 - BLOCK
    )
    :vars
    (
      ?auto_288543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288542 ?auto_288543 ) ( ON-TABLE ?auto_288535 ) ( ON ?auto_288536 ?auto_288535 ) ( ON ?auto_288537 ?auto_288536 ) ( not ( = ?auto_288535 ?auto_288536 ) ) ( not ( = ?auto_288535 ?auto_288537 ) ) ( not ( = ?auto_288535 ?auto_288538 ) ) ( not ( = ?auto_288535 ?auto_288539 ) ) ( not ( = ?auto_288535 ?auto_288540 ) ) ( not ( = ?auto_288535 ?auto_288541 ) ) ( not ( = ?auto_288535 ?auto_288542 ) ) ( not ( = ?auto_288535 ?auto_288543 ) ) ( not ( = ?auto_288536 ?auto_288537 ) ) ( not ( = ?auto_288536 ?auto_288538 ) ) ( not ( = ?auto_288536 ?auto_288539 ) ) ( not ( = ?auto_288536 ?auto_288540 ) ) ( not ( = ?auto_288536 ?auto_288541 ) ) ( not ( = ?auto_288536 ?auto_288542 ) ) ( not ( = ?auto_288536 ?auto_288543 ) ) ( not ( = ?auto_288537 ?auto_288538 ) ) ( not ( = ?auto_288537 ?auto_288539 ) ) ( not ( = ?auto_288537 ?auto_288540 ) ) ( not ( = ?auto_288537 ?auto_288541 ) ) ( not ( = ?auto_288537 ?auto_288542 ) ) ( not ( = ?auto_288537 ?auto_288543 ) ) ( not ( = ?auto_288538 ?auto_288539 ) ) ( not ( = ?auto_288538 ?auto_288540 ) ) ( not ( = ?auto_288538 ?auto_288541 ) ) ( not ( = ?auto_288538 ?auto_288542 ) ) ( not ( = ?auto_288538 ?auto_288543 ) ) ( not ( = ?auto_288539 ?auto_288540 ) ) ( not ( = ?auto_288539 ?auto_288541 ) ) ( not ( = ?auto_288539 ?auto_288542 ) ) ( not ( = ?auto_288539 ?auto_288543 ) ) ( not ( = ?auto_288540 ?auto_288541 ) ) ( not ( = ?auto_288540 ?auto_288542 ) ) ( not ( = ?auto_288540 ?auto_288543 ) ) ( not ( = ?auto_288541 ?auto_288542 ) ) ( not ( = ?auto_288541 ?auto_288543 ) ) ( not ( = ?auto_288542 ?auto_288543 ) ) ( ON ?auto_288541 ?auto_288542 ) ( ON ?auto_288540 ?auto_288541 ) ( ON ?auto_288539 ?auto_288540 ) ( CLEAR ?auto_288537 ) ( ON ?auto_288538 ?auto_288539 ) ( CLEAR ?auto_288538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_288535 ?auto_288536 ?auto_288537 ?auto_288538 )
      ( MAKE-8PILE ?auto_288535 ?auto_288536 ?auto_288537 ?auto_288538 ?auto_288539 ?auto_288540 ?auto_288541 ?auto_288542 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288569 - BLOCK
      ?auto_288570 - BLOCK
      ?auto_288571 - BLOCK
      ?auto_288572 - BLOCK
      ?auto_288573 - BLOCK
      ?auto_288574 - BLOCK
      ?auto_288575 - BLOCK
      ?auto_288576 - BLOCK
    )
    :vars
    (
      ?auto_288577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288576 ?auto_288577 ) ( ON-TABLE ?auto_288569 ) ( ON ?auto_288570 ?auto_288569 ) ( not ( = ?auto_288569 ?auto_288570 ) ) ( not ( = ?auto_288569 ?auto_288571 ) ) ( not ( = ?auto_288569 ?auto_288572 ) ) ( not ( = ?auto_288569 ?auto_288573 ) ) ( not ( = ?auto_288569 ?auto_288574 ) ) ( not ( = ?auto_288569 ?auto_288575 ) ) ( not ( = ?auto_288569 ?auto_288576 ) ) ( not ( = ?auto_288569 ?auto_288577 ) ) ( not ( = ?auto_288570 ?auto_288571 ) ) ( not ( = ?auto_288570 ?auto_288572 ) ) ( not ( = ?auto_288570 ?auto_288573 ) ) ( not ( = ?auto_288570 ?auto_288574 ) ) ( not ( = ?auto_288570 ?auto_288575 ) ) ( not ( = ?auto_288570 ?auto_288576 ) ) ( not ( = ?auto_288570 ?auto_288577 ) ) ( not ( = ?auto_288571 ?auto_288572 ) ) ( not ( = ?auto_288571 ?auto_288573 ) ) ( not ( = ?auto_288571 ?auto_288574 ) ) ( not ( = ?auto_288571 ?auto_288575 ) ) ( not ( = ?auto_288571 ?auto_288576 ) ) ( not ( = ?auto_288571 ?auto_288577 ) ) ( not ( = ?auto_288572 ?auto_288573 ) ) ( not ( = ?auto_288572 ?auto_288574 ) ) ( not ( = ?auto_288572 ?auto_288575 ) ) ( not ( = ?auto_288572 ?auto_288576 ) ) ( not ( = ?auto_288572 ?auto_288577 ) ) ( not ( = ?auto_288573 ?auto_288574 ) ) ( not ( = ?auto_288573 ?auto_288575 ) ) ( not ( = ?auto_288573 ?auto_288576 ) ) ( not ( = ?auto_288573 ?auto_288577 ) ) ( not ( = ?auto_288574 ?auto_288575 ) ) ( not ( = ?auto_288574 ?auto_288576 ) ) ( not ( = ?auto_288574 ?auto_288577 ) ) ( not ( = ?auto_288575 ?auto_288576 ) ) ( not ( = ?auto_288575 ?auto_288577 ) ) ( not ( = ?auto_288576 ?auto_288577 ) ) ( ON ?auto_288575 ?auto_288576 ) ( ON ?auto_288574 ?auto_288575 ) ( ON ?auto_288573 ?auto_288574 ) ( ON ?auto_288572 ?auto_288573 ) ( CLEAR ?auto_288570 ) ( ON ?auto_288571 ?auto_288572 ) ( CLEAR ?auto_288571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_288569 ?auto_288570 ?auto_288571 )
      ( MAKE-8PILE ?auto_288569 ?auto_288570 ?auto_288571 ?auto_288572 ?auto_288573 ?auto_288574 ?auto_288575 ?auto_288576 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288603 - BLOCK
      ?auto_288604 - BLOCK
      ?auto_288605 - BLOCK
      ?auto_288606 - BLOCK
      ?auto_288607 - BLOCK
      ?auto_288608 - BLOCK
      ?auto_288609 - BLOCK
      ?auto_288610 - BLOCK
    )
    :vars
    (
      ?auto_288611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288610 ?auto_288611 ) ( ON-TABLE ?auto_288603 ) ( not ( = ?auto_288603 ?auto_288604 ) ) ( not ( = ?auto_288603 ?auto_288605 ) ) ( not ( = ?auto_288603 ?auto_288606 ) ) ( not ( = ?auto_288603 ?auto_288607 ) ) ( not ( = ?auto_288603 ?auto_288608 ) ) ( not ( = ?auto_288603 ?auto_288609 ) ) ( not ( = ?auto_288603 ?auto_288610 ) ) ( not ( = ?auto_288603 ?auto_288611 ) ) ( not ( = ?auto_288604 ?auto_288605 ) ) ( not ( = ?auto_288604 ?auto_288606 ) ) ( not ( = ?auto_288604 ?auto_288607 ) ) ( not ( = ?auto_288604 ?auto_288608 ) ) ( not ( = ?auto_288604 ?auto_288609 ) ) ( not ( = ?auto_288604 ?auto_288610 ) ) ( not ( = ?auto_288604 ?auto_288611 ) ) ( not ( = ?auto_288605 ?auto_288606 ) ) ( not ( = ?auto_288605 ?auto_288607 ) ) ( not ( = ?auto_288605 ?auto_288608 ) ) ( not ( = ?auto_288605 ?auto_288609 ) ) ( not ( = ?auto_288605 ?auto_288610 ) ) ( not ( = ?auto_288605 ?auto_288611 ) ) ( not ( = ?auto_288606 ?auto_288607 ) ) ( not ( = ?auto_288606 ?auto_288608 ) ) ( not ( = ?auto_288606 ?auto_288609 ) ) ( not ( = ?auto_288606 ?auto_288610 ) ) ( not ( = ?auto_288606 ?auto_288611 ) ) ( not ( = ?auto_288607 ?auto_288608 ) ) ( not ( = ?auto_288607 ?auto_288609 ) ) ( not ( = ?auto_288607 ?auto_288610 ) ) ( not ( = ?auto_288607 ?auto_288611 ) ) ( not ( = ?auto_288608 ?auto_288609 ) ) ( not ( = ?auto_288608 ?auto_288610 ) ) ( not ( = ?auto_288608 ?auto_288611 ) ) ( not ( = ?auto_288609 ?auto_288610 ) ) ( not ( = ?auto_288609 ?auto_288611 ) ) ( not ( = ?auto_288610 ?auto_288611 ) ) ( ON ?auto_288609 ?auto_288610 ) ( ON ?auto_288608 ?auto_288609 ) ( ON ?auto_288607 ?auto_288608 ) ( ON ?auto_288606 ?auto_288607 ) ( ON ?auto_288605 ?auto_288606 ) ( CLEAR ?auto_288603 ) ( ON ?auto_288604 ?auto_288605 ) ( CLEAR ?auto_288604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_288603 ?auto_288604 )
      ( MAKE-8PILE ?auto_288603 ?auto_288604 ?auto_288605 ?auto_288606 ?auto_288607 ?auto_288608 ?auto_288609 ?auto_288610 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_288637 - BLOCK
      ?auto_288638 - BLOCK
      ?auto_288639 - BLOCK
      ?auto_288640 - BLOCK
      ?auto_288641 - BLOCK
      ?auto_288642 - BLOCK
      ?auto_288643 - BLOCK
      ?auto_288644 - BLOCK
    )
    :vars
    (
      ?auto_288645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288644 ?auto_288645 ) ( not ( = ?auto_288637 ?auto_288638 ) ) ( not ( = ?auto_288637 ?auto_288639 ) ) ( not ( = ?auto_288637 ?auto_288640 ) ) ( not ( = ?auto_288637 ?auto_288641 ) ) ( not ( = ?auto_288637 ?auto_288642 ) ) ( not ( = ?auto_288637 ?auto_288643 ) ) ( not ( = ?auto_288637 ?auto_288644 ) ) ( not ( = ?auto_288637 ?auto_288645 ) ) ( not ( = ?auto_288638 ?auto_288639 ) ) ( not ( = ?auto_288638 ?auto_288640 ) ) ( not ( = ?auto_288638 ?auto_288641 ) ) ( not ( = ?auto_288638 ?auto_288642 ) ) ( not ( = ?auto_288638 ?auto_288643 ) ) ( not ( = ?auto_288638 ?auto_288644 ) ) ( not ( = ?auto_288638 ?auto_288645 ) ) ( not ( = ?auto_288639 ?auto_288640 ) ) ( not ( = ?auto_288639 ?auto_288641 ) ) ( not ( = ?auto_288639 ?auto_288642 ) ) ( not ( = ?auto_288639 ?auto_288643 ) ) ( not ( = ?auto_288639 ?auto_288644 ) ) ( not ( = ?auto_288639 ?auto_288645 ) ) ( not ( = ?auto_288640 ?auto_288641 ) ) ( not ( = ?auto_288640 ?auto_288642 ) ) ( not ( = ?auto_288640 ?auto_288643 ) ) ( not ( = ?auto_288640 ?auto_288644 ) ) ( not ( = ?auto_288640 ?auto_288645 ) ) ( not ( = ?auto_288641 ?auto_288642 ) ) ( not ( = ?auto_288641 ?auto_288643 ) ) ( not ( = ?auto_288641 ?auto_288644 ) ) ( not ( = ?auto_288641 ?auto_288645 ) ) ( not ( = ?auto_288642 ?auto_288643 ) ) ( not ( = ?auto_288642 ?auto_288644 ) ) ( not ( = ?auto_288642 ?auto_288645 ) ) ( not ( = ?auto_288643 ?auto_288644 ) ) ( not ( = ?auto_288643 ?auto_288645 ) ) ( not ( = ?auto_288644 ?auto_288645 ) ) ( ON ?auto_288643 ?auto_288644 ) ( ON ?auto_288642 ?auto_288643 ) ( ON ?auto_288641 ?auto_288642 ) ( ON ?auto_288640 ?auto_288641 ) ( ON ?auto_288639 ?auto_288640 ) ( ON ?auto_288638 ?auto_288639 ) ( ON ?auto_288637 ?auto_288638 ) ( CLEAR ?auto_288637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288637 )
      ( MAKE-8PILE ?auto_288637 ?auto_288638 ?auto_288639 ?auto_288640 ?auto_288641 ?auto_288642 ?auto_288643 ?auto_288644 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288672 - BLOCK
      ?auto_288673 - BLOCK
      ?auto_288674 - BLOCK
      ?auto_288675 - BLOCK
      ?auto_288676 - BLOCK
      ?auto_288677 - BLOCK
      ?auto_288678 - BLOCK
      ?auto_288679 - BLOCK
      ?auto_288680 - BLOCK
    )
    :vars
    (
      ?auto_288681 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_288679 ) ( ON ?auto_288680 ?auto_288681 ) ( CLEAR ?auto_288680 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_288672 ) ( ON ?auto_288673 ?auto_288672 ) ( ON ?auto_288674 ?auto_288673 ) ( ON ?auto_288675 ?auto_288674 ) ( ON ?auto_288676 ?auto_288675 ) ( ON ?auto_288677 ?auto_288676 ) ( ON ?auto_288678 ?auto_288677 ) ( ON ?auto_288679 ?auto_288678 ) ( not ( = ?auto_288672 ?auto_288673 ) ) ( not ( = ?auto_288672 ?auto_288674 ) ) ( not ( = ?auto_288672 ?auto_288675 ) ) ( not ( = ?auto_288672 ?auto_288676 ) ) ( not ( = ?auto_288672 ?auto_288677 ) ) ( not ( = ?auto_288672 ?auto_288678 ) ) ( not ( = ?auto_288672 ?auto_288679 ) ) ( not ( = ?auto_288672 ?auto_288680 ) ) ( not ( = ?auto_288672 ?auto_288681 ) ) ( not ( = ?auto_288673 ?auto_288674 ) ) ( not ( = ?auto_288673 ?auto_288675 ) ) ( not ( = ?auto_288673 ?auto_288676 ) ) ( not ( = ?auto_288673 ?auto_288677 ) ) ( not ( = ?auto_288673 ?auto_288678 ) ) ( not ( = ?auto_288673 ?auto_288679 ) ) ( not ( = ?auto_288673 ?auto_288680 ) ) ( not ( = ?auto_288673 ?auto_288681 ) ) ( not ( = ?auto_288674 ?auto_288675 ) ) ( not ( = ?auto_288674 ?auto_288676 ) ) ( not ( = ?auto_288674 ?auto_288677 ) ) ( not ( = ?auto_288674 ?auto_288678 ) ) ( not ( = ?auto_288674 ?auto_288679 ) ) ( not ( = ?auto_288674 ?auto_288680 ) ) ( not ( = ?auto_288674 ?auto_288681 ) ) ( not ( = ?auto_288675 ?auto_288676 ) ) ( not ( = ?auto_288675 ?auto_288677 ) ) ( not ( = ?auto_288675 ?auto_288678 ) ) ( not ( = ?auto_288675 ?auto_288679 ) ) ( not ( = ?auto_288675 ?auto_288680 ) ) ( not ( = ?auto_288675 ?auto_288681 ) ) ( not ( = ?auto_288676 ?auto_288677 ) ) ( not ( = ?auto_288676 ?auto_288678 ) ) ( not ( = ?auto_288676 ?auto_288679 ) ) ( not ( = ?auto_288676 ?auto_288680 ) ) ( not ( = ?auto_288676 ?auto_288681 ) ) ( not ( = ?auto_288677 ?auto_288678 ) ) ( not ( = ?auto_288677 ?auto_288679 ) ) ( not ( = ?auto_288677 ?auto_288680 ) ) ( not ( = ?auto_288677 ?auto_288681 ) ) ( not ( = ?auto_288678 ?auto_288679 ) ) ( not ( = ?auto_288678 ?auto_288680 ) ) ( not ( = ?auto_288678 ?auto_288681 ) ) ( not ( = ?auto_288679 ?auto_288680 ) ) ( not ( = ?auto_288679 ?auto_288681 ) ) ( not ( = ?auto_288680 ?auto_288681 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_288680 ?auto_288681 )
      ( !STACK ?auto_288680 ?auto_288679 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288710 - BLOCK
      ?auto_288711 - BLOCK
      ?auto_288712 - BLOCK
      ?auto_288713 - BLOCK
      ?auto_288714 - BLOCK
      ?auto_288715 - BLOCK
      ?auto_288716 - BLOCK
      ?auto_288717 - BLOCK
      ?auto_288718 - BLOCK
    )
    :vars
    (
      ?auto_288719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288718 ?auto_288719 ) ( ON-TABLE ?auto_288710 ) ( ON ?auto_288711 ?auto_288710 ) ( ON ?auto_288712 ?auto_288711 ) ( ON ?auto_288713 ?auto_288712 ) ( ON ?auto_288714 ?auto_288713 ) ( ON ?auto_288715 ?auto_288714 ) ( ON ?auto_288716 ?auto_288715 ) ( not ( = ?auto_288710 ?auto_288711 ) ) ( not ( = ?auto_288710 ?auto_288712 ) ) ( not ( = ?auto_288710 ?auto_288713 ) ) ( not ( = ?auto_288710 ?auto_288714 ) ) ( not ( = ?auto_288710 ?auto_288715 ) ) ( not ( = ?auto_288710 ?auto_288716 ) ) ( not ( = ?auto_288710 ?auto_288717 ) ) ( not ( = ?auto_288710 ?auto_288718 ) ) ( not ( = ?auto_288710 ?auto_288719 ) ) ( not ( = ?auto_288711 ?auto_288712 ) ) ( not ( = ?auto_288711 ?auto_288713 ) ) ( not ( = ?auto_288711 ?auto_288714 ) ) ( not ( = ?auto_288711 ?auto_288715 ) ) ( not ( = ?auto_288711 ?auto_288716 ) ) ( not ( = ?auto_288711 ?auto_288717 ) ) ( not ( = ?auto_288711 ?auto_288718 ) ) ( not ( = ?auto_288711 ?auto_288719 ) ) ( not ( = ?auto_288712 ?auto_288713 ) ) ( not ( = ?auto_288712 ?auto_288714 ) ) ( not ( = ?auto_288712 ?auto_288715 ) ) ( not ( = ?auto_288712 ?auto_288716 ) ) ( not ( = ?auto_288712 ?auto_288717 ) ) ( not ( = ?auto_288712 ?auto_288718 ) ) ( not ( = ?auto_288712 ?auto_288719 ) ) ( not ( = ?auto_288713 ?auto_288714 ) ) ( not ( = ?auto_288713 ?auto_288715 ) ) ( not ( = ?auto_288713 ?auto_288716 ) ) ( not ( = ?auto_288713 ?auto_288717 ) ) ( not ( = ?auto_288713 ?auto_288718 ) ) ( not ( = ?auto_288713 ?auto_288719 ) ) ( not ( = ?auto_288714 ?auto_288715 ) ) ( not ( = ?auto_288714 ?auto_288716 ) ) ( not ( = ?auto_288714 ?auto_288717 ) ) ( not ( = ?auto_288714 ?auto_288718 ) ) ( not ( = ?auto_288714 ?auto_288719 ) ) ( not ( = ?auto_288715 ?auto_288716 ) ) ( not ( = ?auto_288715 ?auto_288717 ) ) ( not ( = ?auto_288715 ?auto_288718 ) ) ( not ( = ?auto_288715 ?auto_288719 ) ) ( not ( = ?auto_288716 ?auto_288717 ) ) ( not ( = ?auto_288716 ?auto_288718 ) ) ( not ( = ?auto_288716 ?auto_288719 ) ) ( not ( = ?auto_288717 ?auto_288718 ) ) ( not ( = ?auto_288717 ?auto_288719 ) ) ( not ( = ?auto_288718 ?auto_288719 ) ) ( CLEAR ?auto_288716 ) ( ON ?auto_288717 ?auto_288718 ) ( CLEAR ?auto_288717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_288710 ?auto_288711 ?auto_288712 ?auto_288713 ?auto_288714 ?auto_288715 ?auto_288716 ?auto_288717 )
      ( MAKE-9PILE ?auto_288710 ?auto_288711 ?auto_288712 ?auto_288713 ?auto_288714 ?auto_288715 ?auto_288716 ?auto_288717 ?auto_288718 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288748 - BLOCK
      ?auto_288749 - BLOCK
      ?auto_288750 - BLOCK
      ?auto_288751 - BLOCK
      ?auto_288752 - BLOCK
      ?auto_288753 - BLOCK
      ?auto_288754 - BLOCK
      ?auto_288755 - BLOCK
      ?auto_288756 - BLOCK
    )
    :vars
    (
      ?auto_288757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288756 ?auto_288757 ) ( ON-TABLE ?auto_288748 ) ( ON ?auto_288749 ?auto_288748 ) ( ON ?auto_288750 ?auto_288749 ) ( ON ?auto_288751 ?auto_288750 ) ( ON ?auto_288752 ?auto_288751 ) ( ON ?auto_288753 ?auto_288752 ) ( not ( = ?auto_288748 ?auto_288749 ) ) ( not ( = ?auto_288748 ?auto_288750 ) ) ( not ( = ?auto_288748 ?auto_288751 ) ) ( not ( = ?auto_288748 ?auto_288752 ) ) ( not ( = ?auto_288748 ?auto_288753 ) ) ( not ( = ?auto_288748 ?auto_288754 ) ) ( not ( = ?auto_288748 ?auto_288755 ) ) ( not ( = ?auto_288748 ?auto_288756 ) ) ( not ( = ?auto_288748 ?auto_288757 ) ) ( not ( = ?auto_288749 ?auto_288750 ) ) ( not ( = ?auto_288749 ?auto_288751 ) ) ( not ( = ?auto_288749 ?auto_288752 ) ) ( not ( = ?auto_288749 ?auto_288753 ) ) ( not ( = ?auto_288749 ?auto_288754 ) ) ( not ( = ?auto_288749 ?auto_288755 ) ) ( not ( = ?auto_288749 ?auto_288756 ) ) ( not ( = ?auto_288749 ?auto_288757 ) ) ( not ( = ?auto_288750 ?auto_288751 ) ) ( not ( = ?auto_288750 ?auto_288752 ) ) ( not ( = ?auto_288750 ?auto_288753 ) ) ( not ( = ?auto_288750 ?auto_288754 ) ) ( not ( = ?auto_288750 ?auto_288755 ) ) ( not ( = ?auto_288750 ?auto_288756 ) ) ( not ( = ?auto_288750 ?auto_288757 ) ) ( not ( = ?auto_288751 ?auto_288752 ) ) ( not ( = ?auto_288751 ?auto_288753 ) ) ( not ( = ?auto_288751 ?auto_288754 ) ) ( not ( = ?auto_288751 ?auto_288755 ) ) ( not ( = ?auto_288751 ?auto_288756 ) ) ( not ( = ?auto_288751 ?auto_288757 ) ) ( not ( = ?auto_288752 ?auto_288753 ) ) ( not ( = ?auto_288752 ?auto_288754 ) ) ( not ( = ?auto_288752 ?auto_288755 ) ) ( not ( = ?auto_288752 ?auto_288756 ) ) ( not ( = ?auto_288752 ?auto_288757 ) ) ( not ( = ?auto_288753 ?auto_288754 ) ) ( not ( = ?auto_288753 ?auto_288755 ) ) ( not ( = ?auto_288753 ?auto_288756 ) ) ( not ( = ?auto_288753 ?auto_288757 ) ) ( not ( = ?auto_288754 ?auto_288755 ) ) ( not ( = ?auto_288754 ?auto_288756 ) ) ( not ( = ?auto_288754 ?auto_288757 ) ) ( not ( = ?auto_288755 ?auto_288756 ) ) ( not ( = ?auto_288755 ?auto_288757 ) ) ( not ( = ?auto_288756 ?auto_288757 ) ) ( ON ?auto_288755 ?auto_288756 ) ( CLEAR ?auto_288753 ) ( ON ?auto_288754 ?auto_288755 ) ( CLEAR ?auto_288754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_288748 ?auto_288749 ?auto_288750 ?auto_288751 ?auto_288752 ?auto_288753 ?auto_288754 )
      ( MAKE-9PILE ?auto_288748 ?auto_288749 ?auto_288750 ?auto_288751 ?auto_288752 ?auto_288753 ?auto_288754 ?auto_288755 ?auto_288756 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288786 - BLOCK
      ?auto_288787 - BLOCK
      ?auto_288788 - BLOCK
      ?auto_288789 - BLOCK
      ?auto_288790 - BLOCK
      ?auto_288791 - BLOCK
      ?auto_288792 - BLOCK
      ?auto_288793 - BLOCK
      ?auto_288794 - BLOCK
    )
    :vars
    (
      ?auto_288795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288794 ?auto_288795 ) ( ON-TABLE ?auto_288786 ) ( ON ?auto_288787 ?auto_288786 ) ( ON ?auto_288788 ?auto_288787 ) ( ON ?auto_288789 ?auto_288788 ) ( ON ?auto_288790 ?auto_288789 ) ( not ( = ?auto_288786 ?auto_288787 ) ) ( not ( = ?auto_288786 ?auto_288788 ) ) ( not ( = ?auto_288786 ?auto_288789 ) ) ( not ( = ?auto_288786 ?auto_288790 ) ) ( not ( = ?auto_288786 ?auto_288791 ) ) ( not ( = ?auto_288786 ?auto_288792 ) ) ( not ( = ?auto_288786 ?auto_288793 ) ) ( not ( = ?auto_288786 ?auto_288794 ) ) ( not ( = ?auto_288786 ?auto_288795 ) ) ( not ( = ?auto_288787 ?auto_288788 ) ) ( not ( = ?auto_288787 ?auto_288789 ) ) ( not ( = ?auto_288787 ?auto_288790 ) ) ( not ( = ?auto_288787 ?auto_288791 ) ) ( not ( = ?auto_288787 ?auto_288792 ) ) ( not ( = ?auto_288787 ?auto_288793 ) ) ( not ( = ?auto_288787 ?auto_288794 ) ) ( not ( = ?auto_288787 ?auto_288795 ) ) ( not ( = ?auto_288788 ?auto_288789 ) ) ( not ( = ?auto_288788 ?auto_288790 ) ) ( not ( = ?auto_288788 ?auto_288791 ) ) ( not ( = ?auto_288788 ?auto_288792 ) ) ( not ( = ?auto_288788 ?auto_288793 ) ) ( not ( = ?auto_288788 ?auto_288794 ) ) ( not ( = ?auto_288788 ?auto_288795 ) ) ( not ( = ?auto_288789 ?auto_288790 ) ) ( not ( = ?auto_288789 ?auto_288791 ) ) ( not ( = ?auto_288789 ?auto_288792 ) ) ( not ( = ?auto_288789 ?auto_288793 ) ) ( not ( = ?auto_288789 ?auto_288794 ) ) ( not ( = ?auto_288789 ?auto_288795 ) ) ( not ( = ?auto_288790 ?auto_288791 ) ) ( not ( = ?auto_288790 ?auto_288792 ) ) ( not ( = ?auto_288790 ?auto_288793 ) ) ( not ( = ?auto_288790 ?auto_288794 ) ) ( not ( = ?auto_288790 ?auto_288795 ) ) ( not ( = ?auto_288791 ?auto_288792 ) ) ( not ( = ?auto_288791 ?auto_288793 ) ) ( not ( = ?auto_288791 ?auto_288794 ) ) ( not ( = ?auto_288791 ?auto_288795 ) ) ( not ( = ?auto_288792 ?auto_288793 ) ) ( not ( = ?auto_288792 ?auto_288794 ) ) ( not ( = ?auto_288792 ?auto_288795 ) ) ( not ( = ?auto_288793 ?auto_288794 ) ) ( not ( = ?auto_288793 ?auto_288795 ) ) ( not ( = ?auto_288794 ?auto_288795 ) ) ( ON ?auto_288793 ?auto_288794 ) ( ON ?auto_288792 ?auto_288793 ) ( CLEAR ?auto_288790 ) ( ON ?auto_288791 ?auto_288792 ) ( CLEAR ?auto_288791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_288786 ?auto_288787 ?auto_288788 ?auto_288789 ?auto_288790 ?auto_288791 )
      ( MAKE-9PILE ?auto_288786 ?auto_288787 ?auto_288788 ?auto_288789 ?auto_288790 ?auto_288791 ?auto_288792 ?auto_288793 ?auto_288794 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288824 - BLOCK
      ?auto_288825 - BLOCK
      ?auto_288826 - BLOCK
      ?auto_288827 - BLOCK
      ?auto_288828 - BLOCK
      ?auto_288829 - BLOCK
      ?auto_288830 - BLOCK
      ?auto_288831 - BLOCK
      ?auto_288832 - BLOCK
    )
    :vars
    (
      ?auto_288833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288832 ?auto_288833 ) ( ON-TABLE ?auto_288824 ) ( ON ?auto_288825 ?auto_288824 ) ( ON ?auto_288826 ?auto_288825 ) ( ON ?auto_288827 ?auto_288826 ) ( not ( = ?auto_288824 ?auto_288825 ) ) ( not ( = ?auto_288824 ?auto_288826 ) ) ( not ( = ?auto_288824 ?auto_288827 ) ) ( not ( = ?auto_288824 ?auto_288828 ) ) ( not ( = ?auto_288824 ?auto_288829 ) ) ( not ( = ?auto_288824 ?auto_288830 ) ) ( not ( = ?auto_288824 ?auto_288831 ) ) ( not ( = ?auto_288824 ?auto_288832 ) ) ( not ( = ?auto_288824 ?auto_288833 ) ) ( not ( = ?auto_288825 ?auto_288826 ) ) ( not ( = ?auto_288825 ?auto_288827 ) ) ( not ( = ?auto_288825 ?auto_288828 ) ) ( not ( = ?auto_288825 ?auto_288829 ) ) ( not ( = ?auto_288825 ?auto_288830 ) ) ( not ( = ?auto_288825 ?auto_288831 ) ) ( not ( = ?auto_288825 ?auto_288832 ) ) ( not ( = ?auto_288825 ?auto_288833 ) ) ( not ( = ?auto_288826 ?auto_288827 ) ) ( not ( = ?auto_288826 ?auto_288828 ) ) ( not ( = ?auto_288826 ?auto_288829 ) ) ( not ( = ?auto_288826 ?auto_288830 ) ) ( not ( = ?auto_288826 ?auto_288831 ) ) ( not ( = ?auto_288826 ?auto_288832 ) ) ( not ( = ?auto_288826 ?auto_288833 ) ) ( not ( = ?auto_288827 ?auto_288828 ) ) ( not ( = ?auto_288827 ?auto_288829 ) ) ( not ( = ?auto_288827 ?auto_288830 ) ) ( not ( = ?auto_288827 ?auto_288831 ) ) ( not ( = ?auto_288827 ?auto_288832 ) ) ( not ( = ?auto_288827 ?auto_288833 ) ) ( not ( = ?auto_288828 ?auto_288829 ) ) ( not ( = ?auto_288828 ?auto_288830 ) ) ( not ( = ?auto_288828 ?auto_288831 ) ) ( not ( = ?auto_288828 ?auto_288832 ) ) ( not ( = ?auto_288828 ?auto_288833 ) ) ( not ( = ?auto_288829 ?auto_288830 ) ) ( not ( = ?auto_288829 ?auto_288831 ) ) ( not ( = ?auto_288829 ?auto_288832 ) ) ( not ( = ?auto_288829 ?auto_288833 ) ) ( not ( = ?auto_288830 ?auto_288831 ) ) ( not ( = ?auto_288830 ?auto_288832 ) ) ( not ( = ?auto_288830 ?auto_288833 ) ) ( not ( = ?auto_288831 ?auto_288832 ) ) ( not ( = ?auto_288831 ?auto_288833 ) ) ( not ( = ?auto_288832 ?auto_288833 ) ) ( ON ?auto_288831 ?auto_288832 ) ( ON ?auto_288830 ?auto_288831 ) ( ON ?auto_288829 ?auto_288830 ) ( CLEAR ?auto_288827 ) ( ON ?auto_288828 ?auto_288829 ) ( CLEAR ?auto_288828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_288824 ?auto_288825 ?auto_288826 ?auto_288827 ?auto_288828 )
      ( MAKE-9PILE ?auto_288824 ?auto_288825 ?auto_288826 ?auto_288827 ?auto_288828 ?auto_288829 ?auto_288830 ?auto_288831 ?auto_288832 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288862 - BLOCK
      ?auto_288863 - BLOCK
      ?auto_288864 - BLOCK
      ?auto_288865 - BLOCK
      ?auto_288866 - BLOCK
      ?auto_288867 - BLOCK
      ?auto_288868 - BLOCK
      ?auto_288869 - BLOCK
      ?auto_288870 - BLOCK
    )
    :vars
    (
      ?auto_288871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288870 ?auto_288871 ) ( ON-TABLE ?auto_288862 ) ( ON ?auto_288863 ?auto_288862 ) ( ON ?auto_288864 ?auto_288863 ) ( not ( = ?auto_288862 ?auto_288863 ) ) ( not ( = ?auto_288862 ?auto_288864 ) ) ( not ( = ?auto_288862 ?auto_288865 ) ) ( not ( = ?auto_288862 ?auto_288866 ) ) ( not ( = ?auto_288862 ?auto_288867 ) ) ( not ( = ?auto_288862 ?auto_288868 ) ) ( not ( = ?auto_288862 ?auto_288869 ) ) ( not ( = ?auto_288862 ?auto_288870 ) ) ( not ( = ?auto_288862 ?auto_288871 ) ) ( not ( = ?auto_288863 ?auto_288864 ) ) ( not ( = ?auto_288863 ?auto_288865 ) ) ( not ( = ?auto_288863 ?auto_288866 ) ) ( not ( = ?auto_288863 ?auto_288867 ) ) ( not ( = ?auto_288863 ?auto_288868 ) ) ( not ( = ?auto_288863 ?auto_288869 ) ) ( not ( = ?auto_288863 ?auto_288870 ) ) ( not ( = ?auto_288863 ?auto_288871 ) ) ( not ( = ?auto_288864 ?auto_288865 ) ) ( not ( = ?auto_288864 ?auto_288866 ) ) ( not ( = ?auto_288864 ?auto_288867 ) ) ( not ( = ?auto_288864 ?auto_288868 ) ) ( not ( = ?auto_288864 ?auto_288869 ) ) ( not ( = ?auto_288864 ?auto_288870 ) ) ( not ( = ?auto_288864 ?auto_288871 ) ) ( not ( = ?auto_288865 ?auto_288866 ) ) ( not ( = ?auto_288865 ?auto_288867 ) ) ( not ( = ?auto_288865 ?auto_288868 ) ) ( not ( = ?auto_288865 ?auto_288869 ) ) ( not ( = ?auto_288865 ?auto_288870 ) ) ( not ( = ?auto_288865 ?auto_288871 ) ) ( not ( = ?auto_288866 ?auto_288867 ) ) ( not ( = ?auto_288866 ?auto_288868 ) ) ( not ( = ?auto_288866 ?auto_288869 ) ) ( not ( = ?auto_288866 ?auto_288870 ) ) ( not ( = ?auto_288866 ?auto_288871 ) ) ( not ( = ?auto_288867 ?auto_288868 ) ) ( not ( = ?auto_288867 ?auto_288869 ) ) ( not ( = ?auto_288867 ?auto_288870 ) ) ( not ( = ?auto_288867 ?auto_288871 ) ) ( not ( = ?auto_288868 ?auto_288869 ) ) ( not ( = ?auto_288868 ?auto_288870 ) ) ( not ( = ?auto_288868 ?auto_288871 ) ) ( not ( = ?auto_288869 ?auto_288870 ) ) ( not ( = ?auto_288869 ?auto_288871 ) ) ( not ( = ?auto_288870 ?auto_288871 ) ) ( ON ?auto_288869 ?auto_288870 ) ( ON ?auto_288868 ?auto_288869 ) ( ON ?auto_288867 ?auto_288868 ) ( ON ?auto_288866 ?auto_288867 ) ( CLEAR ?auto_288864 ) ( ON ?auto_288865 ?auto_288866 ) ( CLEAR ?auto_288865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_288862 ?auto_288863 ?auto_288864 ?auto_288865 )
      ( MAKE-9PILE ?auto_288862 ?auto_288863 ?auto_288864 ?auto_288865 ?auto_288866 ?auto_288867 ?auto_288868 ?auto_288869 ?auto_288870 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288900 - BLOCK
      ?auto_288901 - BLOCK
      ?auto_288902 - BLOCK
      ?auto_288903 - BLOCK
      ?auto_288904 - BLOCK
      ?auto_288905 - BLOCK
      ?auto_288906 - BLOCK
      ?auto_288907 - BLOCK
      ?auto_288908 - BLOCK
    )
    :vars
    (
      ?auto_288909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288908 ?auto_288909 ) ( ON-TABLE ?auto_288900 ) ( ON ?auto_288901 ?auto_288900 ) ( not ( = ?auto_288900 ?auto_288901 ) ) ( not ( = ?auto_288900 ?auto_288902 ) ) ( not ( = ?auto_288900 ?auto_288903 ) ) ( not ( = ?auto_288900 ?auto_288904 ) ) ( not ( = ?auto_288900 ?auto_288905 ) ) ( not ( = ?auto_288900 ?auto_288906 ) ) ( not ( = ?auto_288900 ?auto_288907 ) ) ( not ( = ?auto_288900 ?auto_288908 ) ) ( not ( = ?auto_288900 ?auto_288909 ) ) ( not ( = ?auto_288901 ?auto_288902 ) ) ( not ( = ?auto_288901 ?auto_288903 ) ) ( not ( = ?auto_288901 ?auto_288904 ) ) ( not ( = ?auto_288901 ?auto_288905 ) ) ( not ( = ?auto_288901 ?auto_288906 ) ) ( not ( = ?auto_288901 ?auto_288907 ) ) ( not ( = ?auto_288901 ?auto_288908 ) ) ( not ( = ?auto_288901 ?auto_288909 ) ) ( not ( = ?auto_288902 ?auto_288903 ) ) ( not ( = ?auto_288902 ?auto_288904 ) ) ( not ( = ?auto_288902 ?auto_288905 ) ) ( not ( = ?auto_288902 ?auto_288906 ) ) ( not ( = ?auto_288902 ?auto_288907 ) ) ( not ( = ?auto_288902 ?auto_288908 ) ) ( not ( = ?auto_288902 ?auto_288909 ) ) ( not ( = ?auto_288903 ?auto_288904 ) ) ( not ( = ?auto_288903 ?auto_288905 ) ) ( not ( = ?auto_288903 ?auto_288906 ) ) ( not ( = ?auto_288903 ?auto_288907 ) ) ( not ( = ?auto_288903 ?auto_288908 ) ) ( not ( = ?auto_288903 ?auto_288909 ) ) ( not ( = ?auto_288904 ?auto_288905 ) ) ( not ( = ?auto_288904 ?auto_288906 ) ) ( not ( = ?auto_288904 ?auto_288907 ) ) ( not ( = ?auto_288904 ?auto_288908 ) ) ( not ( = ?auto_288904 ?auto_288909 ) ) ( not ( = ?auto_288905 ?auto_288906 ) ) ( not ( = ?auto_288905 ?auto_288907 ) ) ( not ( = ?auto_288905 ?auto_288908 ) ) ( not ( = ?auto_288905 ?auto_288909 ) ) ( not ( = ?auto_288906 ?auto_288907 ) ) ( not ( = ?auto_288906 ?auto_288908 ) ) ( not ( = ?auto_288906 ?auto_288909 ) ) ( not ( = ?auto_288907 ?auto_288908 ) ) ( not ( = ?auto_288907 ?auto_288909 ) ) ( not ( = ?auto_288908 ?auto_288909 ) ) ( ON ?auto_288907 ?auto_288908 ) ( ON ?auto_288906 ?auto_288907 ) ( ON ?auto_288905 ?auto_288906 ) ( ON ?auto_288904 ?auto_288905 ) ( ON ?auto_288903 ?auto_288904 ) ( CLEAR ?auto_288901 ) ( ON ?auto_288902 ?auto_288903 ) ( CLEAR ?auto_288902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_288900 ?auto_288901 ?auto_288902 )
      ( MAKE-9PILE ?auto_288900 ?auto_288901 ?auto_288902 ?auto_288903 ?auto_288904 ?auto_288905 ?auto_288906 ?auto_288907 ?auto_288908 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288938 - BLOCK
      ?auto_288939 - BLOCK
      ?auto_288940 - BLOCK
      ?auto_288941 - BLOCK
      ?auto_288942 - BLOCK
      ?auto_288943 - BLOCK
      ?auto_288944 - BLOCK
      ?auto_288945 - BLOCK
      ?auto_288946 - BLOCK
    )
    :vars
    (
      ?auto_288947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288946 ?auto_288947 ) ( ON-TABLE ?auto_288938 ) ( not ( = ?auto_288938 ?auto_288939 ) ) ( not ( = ?auto_288938 ?auto_288940 ) ) ( not ( = ?auto_288938 ?auto_288941 ) ) ( not ( = ?auto_288938 ?auto_288942 ) ) ( not ( = ?auto_288938 ?auto_288943 ) ) ( not ( = ?auto_288938 ?auto_288944 ) ) ( not ( = ?auto_288938 ?auto_288945 ) ) ( not ( = ?auto_288938 ?auto_288946 ) ) ( not ( = ?auto_288938 ?auto_288947 ) ) ( not ( = ?auto_288939 ?auto_288940 ) ) ( not ( = ?auto_288939 ?auto_288941 ) ) ( not ( = ?auto_288939 ?auto_288942 ) ) ( not ( = ?auto_288939 ?auto_288943 ) ) ( not ( = ?auto_288939 ?auto_288944 ) ) ( not ( = ?auto_288939 ?auto_288945 ) ) ( not ( = ?auto_288939 ?auto_288946 ) ) ( not ( = ?auto_288939 ?auto_288947 ) ) ( not ( = ?auto_288940 ?auto_288941 ) ) ( not ( = ?auto_288940 ?auto_288942 ) ) ( not ( = ?auto_288940 ?auto_288943 ) ) ( not ( = ?auto_288940 ?auto_288944 ) ) ( not ( = ?auto_288940 ?auto_288945 ) ) ( not ( = ?auto_288940 ?auto_288946 ) ) ( not ( = ?auto_288940 ?auto_288947 ) ) ( not ( = ?auto_288941 ?auto_288942 ) ) ( not ( = ?auto_288941 ?auto_288943 ) ) ( not ( = ?auto_288941 ?auto_288944 ) ) ( not ( = ?auto_288941 ?auto_288945 ) ) ( not ( = ?auto_288941 ?auto_288946 ) ) ( not ( = ?auto_288941 ?auto_288947 ) ) ( not ( = ?auto_288942 ?auto_288943 ) ) ( not ( = ?auto_288942 ?auto_288944 ) ) ( not ( = ?auto_288942 ?auto_288945 ) ) ( not ( = ?auto_288942 ?auto_288946 ) ) ( not ( = ?auto_288942 ?auto_288947 ) ) ( not ( = ?auto_288943 ?auto_288944 ) ) ( not ( = ?auto_288943 ?auto_288945 ) ) ( not ( = ?auto_288943 ?auto_288946 ) ) ( not ( = ?auto_288943 ?auto_288947 ) ) ( not ( = ?auto_288944 ?auto_288945 ) ) ( not ( = ?auto_288944 ?auto_288946 ) ) ( not ( = ?auto_288944 ?auto_288947 ) ) ( not ( = ?auto_288945 ?auto_288946 ) ) ( not ( = ?auto_288945 ?auto_288947 ) ) ( not ( = ?auto_288946 ?auto_288947 ) ) ( ON ?auto_288945 ?auto_288946 ) ( ON ?auto_288944 ?auto_288945 ) ( ON ?auto_288943 ?auto_288944 ) ( ON ?auto_288942 ?auto_288943 ) ( ON ?auto_288941 ?auto_288942 ) ( ON ?auto_288940 ?auto_288941 ) ( CLEAR ?auto_288938 ) ( ON ?auto_288939 ?auto_288940 ) ( CLEAR ?auto_288939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_288938 ?auto_288939 )
      ( MAKE-9PILE ?auto_288938 ?auto_288939 ?auto_288940 ?auto_288941 ?auto_288942 ?auto_288943 ?auto_288944 ?auto_288945 ?auto_288946 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_288976 - BLOCK
      ?auto_288977 - BLOCK
      ?auto_288978 - BLOCK
      ?auto_288979 - BLOCK
      ?auto_288980 - BLOCK
      ?auto_288981 - BLOCK
      ?auto_288982 - BLOCK
      ?auto_288983 - BLOCK
      ?auto_288984 - BLOCK
    )
    :vars
    (
      ?auto_288985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_288984 ?auto_288985 ) ( not ( = ?auto_288976 ?auto_288977 ) ) ( not ( = ?auto_288976 ?auto_288978 ) ) ( not ( = ?auto_288976 ?auto_288979 ) ) ( not ( = ?auto_288976 ?auto_288980 ) ) ( not ( = ?auto_288976 ?auto_288981 ) ) ( not ( = ?auto_288976 ?auto_288982 ) ) ( not ( = ?auto_288976 ?auto_288983 ) ) ( not ( = ?auto_288976 ?auto_288984 ) ) ( not ( = ?auto_288976 ?auto_288985 ) ) ( not ( = ?auto_288977 ?auto_288978 ) ) ( not ( = ?auto_288977 ?auto_288979 ) ) ( not ( = ?auto_288977 ?auto_288980 ) ) ( not ( = ?auto_288977 ?auto_288981 ) ) ( not ( = ?auto_288977 ?auto_288982 ) ) ( not ( = ?auto_288977 ?auto_288983 ) ) ( not ( = ?auto_288977 ?auto_288984 ) ) ( not ( = ?auto_288977 ?auto_288985 ) ) ( not ( = ?auto_288978 ?auto_288979 ) ) ( not ( = ?auto_288978 ?auto_288980 ) ) ( not ( = ?auto_288978 ?auto_288981 ) ) ( not ( = ?auto_288978 ?auto_288982 ) ) ( not ( = ?auto_288978 ?auto_288983 ) ) ( not ( = ?auto_288978 ?auto_288984 ) ) ( not ( = ?auto_288978 ?auto_288985 ) ) ( not ( = ?auto_288979 ?auto_288980 ) ) ( not ( = ?auto_288979 ?auto_288981 ) ) ( not ( = ?auto_288979 ?auto_288982 ) ) ( not ( = ?auto_288979 ?auto_288983 ) ) ( not ( = ?auto_288979 ?auto_288984 ) ) ( not ( = ?auto_288979 ?auto_288985 ) ) ( not ( = ?auto_288980 ?auto_288981 ) ) ( not ( = ?auto_288980 ?auto_288982 ) ) ( not ( = ?auto_288980 ?auto_288983 ) ) ( not ( = ?auto_288980 ?auto_288984 ) ) ( not ( = ?auto_288980 ?auto_288985 ) ) ( not ( = ?auto_288981 ?auto_288982 ) ) ( not ( = ?auto_288981 ?auto_288983 ) ) ( not ( = ?auto_288981 ?auto_288984 ) ) ( not ( = ?auto_288981 ?auto_288985 ) ) ( not ( = ?auto_288982 ?auto_288983 ) ) ( not ( = ?auto_288982 ?auto_288984 ) ) ( not ( = ?auto_288982 ?auto_288985 ) ) ( not ( = ?auto_288983 ?auto_288984 ) ) ( not ( = ?auto_288983 ?auto_288985 ) ) ( not ( = ?auto_288984 ?auto_288985 ) ) ( ON ?auto_288983 ?auto_288984 ) ( ON ?auto_288982 ?auto_288983 ) ( ON ?auto_288981 ?auto_288982 ) ( ON ?auto_288980 ?auto_288981 ) ( ON ?auto_288979 ?auto_288980 ) ( ON ?auto_288978 ?auto_288979 ) ( ON ?auto_288977 ?auto_288978 ) ( ON ?auto_288976 ?auto_288977 ) ( CLEAR ?auto_288976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_288976 )
      ( MAKE-9PILE ?auto_288976 ?auto_288977 ?auto_288978 ?auto_288979 ?auto_288980 ?auto_288981 ?auto_288982 ?auto_288983 ?auto_288984 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289015 - BLOCK
      ?auto_289016 - BLOCK
      ?auto_289017 - BLOCK
      ?auto_289018 - BLOCK
      ?auto_289019 - BLOCK
      ?auto_289020 - BLOCK
      ?auto_289021 - BLOCK
      ?auto_289022 - BLOCK
      ?auto_289023 - BLOCK
      ?auto_289024 - BLOCK
    )
    :vars
    (
      ?auto_289025 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_289023 ) ( ON ?auto_289024 ?auto_289025 ) ( CLEAR ?auto_289024 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_289015 ) ( ON ?auto_289016 ?auto_289015 ) ( ON ?auto_289017 ?auto_289016 ) ( ON ?auto_289018 ?auto_289017 ) ( ON ?auto_289019 ?auto_289018 ) ( ON ?auto_289020 ?auto_289019 ) ( ON ?auto_289021 ?auto_289020 ) ( ON ?auto_289022 ?auto_289021 ) ( ON ?auto_289023 ?auto_289022 ) ( not ( = ?auto_289015 ?auto_289016 ) ) ( not ( = ?auto_289015 ?auto_289017 ) ) ( not ( = ?auto_289015 ?auto_289018 ) ) ( not ( = ?auto_289015 ?auto_289019 ) ) ( not ( = ?auto_289015 ?auto_289020 ) ) ( not ( = ?auto_289015 ?auto_289021 ) ) ( not ( = ?auto_289015 ?auto_289022 ) ) ( not ( = ?auto_289015 ?auto_289023 ) ) ( not ( = ?auto_289015 ?auto_289024 ) ) ( not ( = ?auto_289015 ?auto_289025 ) ) ( not ( = ?auto_289016 ?auto_289017 ) ) ( not ( = ?auto_289016 ?auto_289018 ) ) ( not ( = ?auto_289016 ?auto_289019 ) ) ( not ( = ?auto_289016 ?auto_289020 ) ) ( not ( = ?auto_289016 ?auto_289021 ) ) ( not ( = ?auto_289016 ?auto_289022 ) ) ( not ( = ?auto_289016 ?auto_289023 ) ) ( not ( = ?auto_289016 ?auto_289024 ) ) ( not ( = ?auto_289016 ?auto_289025 ) ) ( not ( = ?auto_289017 ?auto_289018 ) ) ( not ( = ?auto_289017 ?auto_289019 ) ) ( not ( = ?auto_289017 ?auto_289020 ) ) ( not ( = ?auto_289017 ?auto_289021 ) ) ( not ( = ?auto_289017 ?auto_289022 ) ) ( not ( = ?auto_289017 ?auto_289023 ) ) ( not ( = ?auto_289017 ?auto_289024 ) ) ( not ( = ?auto_289017 ?auto_289025 ) ) ( not ( = ?auto_289018 ?auto_289019 ) ) ( not ( = ?auto_289018 ?auto_289020 ) ) ( not ( = ?auto_289018 ?auto_289021 ) ) ( not ( = ?auto_289018 ?auto_289022 ) ) ( not ( = ?auto_289018 ?auto_289023 ) ) ( not ( = ?auto_289018 ?auto_289024 ) ) ( not ( = ?auto_289018 ?auto_289025 ) ) ( not ( = ?auto_289019 ?auto_289020 ) ) ( not ( = ?auto_289019 ?auto_289021 ) ) ( not ( = ?auto_289019 ?auto_289022 ) ) ( not ( = ?auto_289019 ?auto_289023 ) ) ( not ( = ?auto_289019 ?auto_289024 ) ) ( not ( = ?auto_289019 ?auto_289025 ) ) ( not ( = ?auto_289020 ?auto_289021 ) ) ( not ( = ?auto_289020 ?auto_289022 ) ) ( not ( = ?auto_289020 ?auto_289023 ) ) ( not ( = ?auto_289020 ?auto_289024 ) ) ( not ( = ?auto_289020 ?auto_289025 ) ) ( not ( = ?auto_289021 ?auto_289022 ) ) ( not ( = ?auto_289021 ?auto_289023 ) ) ( not ( = ?auto_289021 ?auto_289024 ) ) ( not ( = ?auto_289021 ?auto_289025 ) ) ( not ( = ?auto_289022 ?auto_289023 ) ) ( not ( = ?auto_289022 ?auto_289024 ) ) ( not ( = ?auto_289022 ?auto_289025 ) ) ( not ( = ?auto_289023 ?auto_289024 ) ) ( not ( = ?auto_289023 ?auto_289025 ) ) ( not ( = ?auto_289024 ?auto_289025 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_289024 ?auto_289025 )
      ( !STACK ?auto_289024 ?auto_289023 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289057 - BLOCK
      ?auto_289058 - BLOCK
      ?auto_289059 - BLOCK
      ?auto_289060 - BLOCK
      ?auto_289061 - BLOCK
      ?auto_289062 - BLOCK
      ?auto_289063 - BLOCK
      ?auto_289064 - BLOCK
      ?auto_289065 - BLOCK
      ?auto_289066 - BLOCK
    )
    :vars
    (
      ?auto_289067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289066 ?auto_289067 ) ( ON-TABLE ?auto_289057 ) ( ON ?auto_289058 ?auto_289057 ) ( ON ?auto_289059 ?auto_289058 ) ( ON ?auto_289060 ?auto_289059 ) ( ON ?auto_289061 ?auto_289060 ) ( ON ?auto_289062 ?auto_289061 ) ( ON ?auto_289063 ?auto_289062 ) ( ON ?auto_289064 ?auto_289063 ) ( not ( = ?auto_289057 ?auto_289058 ) ) ( not ( = ?auto_289057 ?auto_289059 ) ) ( not ( = ?auto_289057 ?auto_289060 ) ) ( not ( = ?auto_289057 ?auto_289061 ) ) ( not ( = ?auto_289057 ?auto_289062 ) ) ( not ( = ?auto_289057 ?auto_289063 ) ) ( not ( = ?auto_289057 ?auto_289064 ) ) ( not ( = ?auto_289057 ?auto_289065 ) ) ( not ( = ?auto_289057 ?auto_289066 ) ) ( not ( = ?auto_289057 ?auto_289067 ) ) ( not ( = ?auto_289058 ?auto_289059 ) ) ( not ( = ?auto_289058 ?auto_289060 ) ) ( not ( = ?auto_289058 ?auto_289061 ) ) ( not ( = ?auto_289058 ?auto_289062 ) ) ( not ( = ?auto_289058 ?auto_289063 ) ) ( not ( = ?auto_289058 ?auto_289064 ) ) ( not ( = ?auto_289058 ?auto_289065 ) ) ( not ( = ?auto_289058 ?auto_289066 ) ) ( not ( = ?auto_289058 ?auto_289067 ) ) ( not ( = ?auto_289059 ?auto_289060 ) ) ( not ( = ?auto_289059 ?auto_289061 ) ) ( not ( = ?auto_289059 ?auto_289062 ) ) ( not ( = ?auto_289059 ?auto_289063 ) ) ( not ( = ?auto_289059 ?auto_289064 ) ) ( not ( = ?auto_289059 ?auto_289065 ) ) ( not ( = ?auto_289059 ?auto_289066 ) ) ( not ( = ?auto_289059 ?auto_289067 ) ) ( not ( = ?auto_289060 ?auto_289061 ) ) ( not ( = ?auto_289060 ?auto_289062 ) ) ( not ( = ?auto_289060 ?auto_289063 ) ) ( not ( = ?auto_289060 ?auto_289064 ) ) ( not ( = ?auto_289060 ?auto_289065 ) ) ( not ( = ?auto_289060 ?auto_289066 ) ) ( not ( = ?auto_289060 ?auto_289067 ) ) ( not ( = ?auto_289061 ?auto_289062 ) ) ( not ( = ?auto_289061 ?auto_289063 ) ) ( not ( = ?auto_289061 ?auto_289064 ) ) ( not ( = ?auto_289061 ?auto_289065 ) ) ( not ( = ?auto_289061 ?auto_289066 ) ) ( not ( = ?auto_289061 ?auto_289067 ) ) ( not ( = ?auto_289062 ?auto_289063 ) ) ( not ( = ?auto_289062 ?auto_289064 ) ) ( not ( = ?auto_289062 ?auto_289065 ) ) ( not ( = ?auto_289062 ?auto_289066 ) ) ( not ( = ?auto_289062 ?auto_289067 ) ) ( not ( = ?auto_289063 ?auto_289064 ) ) ( not ( = ?auto_289063 ?auto_289065 ) ) ( not ( = ?auto_289063 ?auto_289066 ) ) ( not ( = ?auto_289063 ?auto_289067 ) ) ( not ( = ?auto_289064 ?auto_289065 ) ) ( not ( = ?auto_289064 ?auto_289066 ) ) ( not ( = ?auto_289064 ?auto_289067 ) ) ( not ( = ?auto_289065 ?auto_289066 ) ) ( not ( = ?auto_289065 ?auto_289067 ) ) ( not ( = ?auto_289066 ?auto_289067 ) ) ( CLEAR ?auto_289064 ) ( ON ?auto_289065 ?auto_289066 ) ( CLEAR ?auto_289065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_289057 ?auto_289058 ?auto_289059 ?auto_289060 ?auto_289061 ?auto_289062 ?auto_289063 ?auto_289064 ?auto_289065 )
      ( MAKE-10PILE ?auto_289057 ?auto_289058 ?auto_289059 ?auto_289060 ?auto_289061 ?auto_289062 ?auto_289063 ?auto_289064 ?auto_289065 ?auto_289066 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289099 - BLOCK
      ?auto_289100 - BLOCK
      ?auto_289101 - BLOCK
      ?auto_289102 - BLOCK
      ?auto_289103 - BLOCK
      ?auto_289104 - BLOCK
      ?auto_289105 - BLOCK
      ?auto_289106 - BLOCK
      ?auto_289107 - BLOCK
      ?auto_289108 - BLOCK
    )
    :vars
    (
      ?auto_289109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289108 ?auto_289109 ) ( ON-TABLE ?auto_289099 ) ( ON ?auto_289100 ?auto_289099 ) ( ON ?auto_289101 ?auto_289100 ) ( ON ?auto_289102 ?auto_289101 ) ( ON ?auto_289103 ?auto_289102 ) ( ON ?auto_289104 ?auto_289103 ) ( ON ?auto_289105 ?auto_289104 ) ( not ( = ?auto_289099 ?auto_289100 ) ) ( not ( = ?auto_289099 ?auto_289101 ) ) ( not ( = ?auto_289099 ?auto_289102 ) ) ( not ( = ?auto_289099 ?auto_289103 ) ) ( not ( = ?auto_289099 ?auto_289104 ) ) ( not ( = ?auto_289099 ?auto_289105 ) ) ( not ( = ?auto_289099 ?auto_289106 ) ) ( not ( = ?auto_289099 ?auto_289107 ) ) ( not ( = ?auto_289099 ?auto_289108 ) ) ( not ( = ?auto_289099 ?auto_289109 ) ) ( not ( = ?auto_289100 ?auto_289101 ) ) ( not ( = ?auto_289100 ?auto_289102 ) ) ( not ( = ?auto_289100 ?auto_289103 ) ) ( not ( = ?auto_289100 ?auto_289104 ) ) ( not ( = ?auto_289100 ?auto_289105 ) ) ( not ( = ?auto_289100 ?auto_289106 ) ) ( not ( = ?auto_289100 ?auto_289107 ) ) ( not ( = ?auto_289100 ?auto_289108 ) ) ( not ( = ?auto_289100 ?auto_289109 ) ) ( not ( = ?auto_289101 ?auto_289102 ) ) ( not ( = ?auto_289101 ?auto_289103 ) ) ( not ( = ?auto_289101 ?auto_289104 ) ) ( not ( = ?auto_289101 ?auto_289105 ) ) ( not ( = ?auto_289101 ?auto_289106 ) ) ( not ( = ?auto_289101 ?auto_289107 ) ) ( not ( = ?auto_289101 ?auto_289108 ) ) ( not ( = ?auto_289101 ?auto_289109 ) ) ( not ( = ?auto_289102 ?auto_289103 ) ) ( not ( = ?auto_289102 ?auto_289104 ) ) ( not ( = ?auto_289102 ?auto_289105 ) ) ( not ( = ?auto_289102 ?auto_289106 ) ) ( not ( = ?auto_289102 ?auto_289107 ) ) ( not ( = ?auto_289102 ?auto_289108 ) ) ( not ( = ?auto_289102 ?auto_289109 ) ) ( not ( = ?auto_289103 ?auto_289104 ) ) ( not ( = ?auto_289103 ?auto_289105 ) ) ( not ( = ?auto_289103 ?auto_289106 ) ) ( not ( = ?auto_289103 ?auto_289107 ) ) ( not ( = ?auto_289103 ?auto_289108 ) ) ( not ( = ?auto_289103 ?auto_289109 ) ) ( not ( = ?auto_289104 ?auto_289105 ) ) ( not ( = ?auto_289104 ?auto_289106 ) ) ( not ( = ?auto_289104 ?auto_289107 ) ) ( not ( = ?auto_289104 ?auto_289108 ) ) ( not ( = ?auto_289104 ?auto_289109 ) ) ( not ( = ?auto_289105 ?auto_289106 ) ) ( not ( = ?auto_289105 ?auto_289107 ) ) ( not ( = ?auto_289105 ?auto_289108 ) ) ( not ( = ?auto_289105 ?auto_289109 ) ) ( not ( = ?auto_289106 ?auto_289107 ) ) ( not ( = ?auto_289106 ?auto_289108 ) ) ( not ( = ?auto_289106 ?auto_289109 ) ) ( not ( = ?auto_289107 ?auto_289108 ) ) ( not ( = ?auto_289107 ?auto_289109 ) ) ( not ( = ?auto_289108 ?auto_289109 ) ) ( ON ?auto_289107 ?auto_289108 ) ( CLEAR ?auto_289105 ) ( ON ?auto_289106 ?auto_289107 ) ( CLEAR ?auto_289106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_289099 ?auto_289100 ?auto_289101 ?auto_289102 ?auto_289103 ?auto_289104 ?auto_289105 ?auto_289106 )
      ( MAKE-10PILE ?auto_289099 ?auto_289100 ?auto_289101 ?auto_289102 ?auto_289103 ?auto_289104 ?auto_289105 ?auto_289106 ?auto_289107 ?auto_289108 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289141 - BLOCK
      ?auto_289142 - BLOCK
      ?auto_289143 - BLOCK
      ?auto_289144 - BLOCK
      ?auto_289145 - BLOCK
      ?auto_289146 - BLOCK
      ?auto_289147 - BLOCK
      ?auto_289148 - BLOCK
      ?auto_289149 - BLOCK
      ?auto_289150 - BLOCK
    )
    :vars
    (
      ?auto_289151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289150 ?auto_289151 ) ( ON-TABLE ?auto_289141 ) ( ON ?auto_289142 ?auto_289141 ) ( ON ?auto_289143 ?auto_289142 ) ( ON ?auto_289144 ?auto_289143 ) ( ON ?auto_289145 ?auto_289144 ) ( ON ?auto_289146 ?auto_289145 ) ( not ( = ?auto_289141 ?auto_289142 ) ) ( not ( = ?auto_289141 ?auto_289143 ) ) ( not ( = ?auto_289141 ?auto_289144 ) ) ( not ( = ?auto_289141 ?auto_289145 ) ) ( not ( = ?auto_289141 ?auto_289146 ) ) ( not ( = ?auto_289141 ?auto_289147 ) ) ( not ( = ?auto_289141 ?auto_289148 ) ) ( not ( = ?auto_289141 ?auto_289149 ) ) ( not ( = ?auto_289141 ?auto_289150 ) ) ( not ( = ?auto_289141 ?auto_289151 ) ) ( not ( = ?auto_289142 ?auto_289143 ) ) ( not ( = ?auto_289142 ?auto_289144 ) ) ( not ( = ?auto_289142 ?auto_289145 ) ) ( not ( = ?auto_289142 ?auto_289146 ) ) ( not ( = ?auto_289142 ?auto_289147 ) ) ( not ( = ?auto_289142 ?auto_289148 ) ) ( not ( = ?auto_289142 ?auto_289149 ) ) ( not ( = ?auto_289142 ?auto_289150 ) ) ( not ( = ?auto_289142 ?auto_289151 ) ) ( not ( = ?auto_289143 ?auto_289144 ) ) ( not ( = ?auto_289143 ?auto_289145 ) ) ( not ( = ?auto_289143 ?auto_289146 ) ) ( not ( = ?auto_289143 ?auto_289147 ) ) ( not ( = ?auto_289143 ?auto_289148 ) ) ( not ( = ?auto_289143 ?auto_289149 ) ) ( not ( = ?auto_289143 ?auto_289150 ) ) ( not ( = ?auto_289143 ?auto_289151 ) ) ( not ( = ?auto_289144 ?auto_289145 ) ) ( not ( = ?auto_289144 ?auto_289146 ) ) ( not ( = ?auto_289144 ?auto_289147 ) ) ( not ( = ?auto_289144 ?auto_289148 ) ) ( not ( = ?auto_289144 ?auto_289149 ) ) ( not ( = ?auto_289144 ?auto_289150 ) ) ( not ( = ?auto_289144 ?auto_289151 ) ) ( not ( = ?auto_289145 ?auto_289146 ) ) ( not ( = ?auto_289145 ?auto_289147 ) ) ( not ( = ?auto_289145 ?auto_289148 ) ) ( not ( = ?auto_289145 ?auto_289149 ) ) ( not ( = ?auto_289145 ?auto_289150 ) ) ( not ( = ?auto_289145 ?auto_289151 ) ) ( not ( = ?auto_289146 ?auto_289147 ) ) ( not ( = ?auto_289146 ?auto_289148 ) ) ( not ( = ?auto_289146 ?auto_289149 ) ) ( not ( = ?auto_289146 ?auto_289150 ) ) ( not ( = ?auto_289146 ?auto_289151 ) ) ( not ( = ?auto_289147 ?auto_289148 ) ) ( not ( = ?auto_289147 ?auto_289149 ) ) ( not ( = ?auto_289147 ?auto_289150 ) ) ( not ( = ?auto_289147 ?auto_289151 ) ) ( not ( = ?auto_289148 ?auto_289149 ) ) ( not ( = ?auto_289148 ?auto_289150 ) ) ( not ( = ?auto_289148 ?auto_289151 ) ) ( not ( = ?auto_289149 ?auto_289150 ) ) ( not ( = ?auto_289149 ?auto_289151 ) ) ( not ( = ?auto_289150 ?auto_289151 ) ) ( ON ?auto_289149 ?auto_289150 ) ( ON ?auto_289148 ?auto_289149 ) ( CLEAR ?auto_289146 ) ( ON ?auto_289147 ?auto_289148 ) ( CLEAR ?auto_289147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_289141 ?auto_289142 ?auto_289143 ?auto_289144 ?auto_289145 ?auto_289146 ?auto_289147 )
      ( MAKE-10PILE ?auto_289141 ?auto_289142 ?auto_289143 ?auto_289144 ?auto_289145 ?auto_289146 ?auto_289147 ?auto_289148 ?auto_289149 ?auto_289150 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289183 - BLOCK
      ?auto_289184 - BLOCK
      ?auto_289185 - BLOCK
      ?auto_289186 - BLOCK
      ?auto_289187 - BLOCK
      ?auto_289188 - BLOCK
      ?auto_289189 - BLOCK
      ?auto_289190 - BLOCK
      ?auto_289191 - BLOCK
      ?auto_289192 - BLOCK
    )
    :vars
    (
      ?auto_289193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289192 ?auto_289193 ) ( ON-TABLE ?auto_289183 ) ( ON ?auto_289184 ?auto_289183 ) ( ON ?auto_289185 ?auto_289184 ) ( ON ?auto_289186 ?auto_289185 ) ( ON ?auto_289187 ?auto_289186 ) ( not ( = ?auto_289183 ?auto_289184 ) ) ( not ( = ?auto_289183 ?auto_289185 ) ) ( not ( = ?auto_289183 ?auto_289186 ) ) ( not ( = ?auto_289183 ?auto_289187 ) ) ( not ( = ?auto_289183 ?auto_289188 ) ) ( not ( = ?auto_289183 ?auto_289189 ) ) ( not ( = ?auto_289183 ?auto_289190 ) ) ( not ( = ?auto_289183 ?auto_289191 ) ) ( not ( = ?auto_289183 ?auto_289192 ) ) ( not ( = ?auto_289183 ?auto_289193 ) ) ( not ( = ?auto_289184 ?auto_289185 ) ) ( not ( = ?auto_289184 ?auto_289186 ) ) ( not ( = ?auto_289184 ?auto_289187 ) ) ( not ( = ?auto_289184 ?auto_289188 ) ) ( not ( = ?auto_289184 ?auto_289189 ) ) ( not ( = ?auto_289184 ?auto_289190 ) ) ( not ( = ?auto_289184 ?auto_289191 ) ) ( not ( = ?auto_289184 ?auto_289192 ) ) ( not ( = ?auto_289184 ?auto_289193 ) ) ( not ( = ?auto_289185 ?auto_289186 ) ) ( not ( = ?auto_289185 ?auto_289187 ) ) ( not ( = ?auto_289185 ?auto_289188 ) ) ( not ( = ?auto_289185 ?auto_289189 ) ) ( not ( = ?auto_289185 ?auto_289190 ) ) ( not ( = ?auto_289185 ?auto_289191 ) ) ( not ( = ?auto_289185 ?auto_289192 ) ) ( not ( = ?auto_289185 ?auto_289193 ) ) ( not ( = ?auto_289186 ?auto_289187 ) ) ( not ( = ?auto_289186 ?auto_289188 ) ) ( not ( = ?auto_289186 ?auto_289189 ) ) ( not ( = ?auto_289186 ?auto_289190 ) ) ( not ( = ?auto_289186 ?auto_289191 ) ) ( not ( = ?auto_289186 ?auto_289192 ) ) ( not ( = ?auto_289186 ?auto_289193 ) ) ( not ( = ?auto_289187 ?auto_289188 ) ) ( not ( = ?auto_289187 ?auto_289189 ) ) ( not ( = ?auto_289187 ?auto_289190 ) ) ( not ( = ?auto_289187 ?auto_289191 ) ) ( not ( = ?auto_289187 ?auto_289192 ) ) ( not ( = ?auto_289187 ?auto_289193 ) ) ( not ( = ?auto_289188 ?auto_289189 ) ) ( not ( = ?auto_289188 ?auto_289190 ) ) ( not ( = ?auto_289188 ?auto_289191 ) ) ( not ( = ?auto_289188 ?auto_289192 ) ) ( not ( = ?auto_289188 ?auto_289193 ) ) ( not ( = ?auto_289189 ?auto_289190 ) ) ( not ( = ?auto_289189 ?auto_289191 ) ) ( not ( = ?auto_289189 ?auto_289192 ) ) ( not ( = ?auto_289189 ?auto_289193 ) ) ( not ( = ?auto_289190 ?auto_289191 ) ) ( not ( = ?auto_289190 ?auto_289192 ) ) ( not ( = ?auto_289190 ?auto_289193 ) ) ( not ( = ?auto_289191 ?auto_289192 ) ) ( not ( = ?auto_289191 ?auto_289193 ) ) ( not ( = ?auto_289192 ?auto_289193 ) ) ( ON ?auto_289191 ?auto_289192 ) ( ON ?auto_289190 ?auto_289191 ) ( ON ?auto_289189 ?auto_289190 ) ( CLEAR ?auto_289187 ) ( ON ?auto_289188 ?auto_289189 ) ( CLEAR ?auto_289188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_289183 ?auto_289184 ?auto_289185 ?auto_289186 ?auto_289187 ?auto_289188 )
      ( MAKE-10PILE ?auto_289183 ?auto_289184 ?auto_289185 ?auto_289186 ?auto_289187 ?auto_289188 ?auto_289189 ?auto_289190 ?auto_289191 ?auto_289192 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289225 - BLOCK
      ?auto_289226 - BLOCK
      ?auto_289227 - BLOCK
      ?auto_289228 - BLOCK
      ?auto_289229 - BLOCK
      ?auto_289230 - BLOCK
      ?auto_289231 - BLOCK
      ?auto_289232 - BLOCK
      ?auto_289233 - BLOCK
      ?auto_289234 - BLOCK
    )
    :vars
    (
      ?auto_289235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289234 ?auto_289235 ) ( ON-TABLE ?auto_289225 ) ( ON ?auto_289226 ?auto_289225 ) ( ON ?auto_289227 ?auto_289226 ) ( ON ?auto_289228 ?auto_289227 ) ( not ( = ?auto_289225 ?auto_289226 ) ) ( not ( = ?auto_289225 ?auto_289227 ) ) ( not ( = ?auto_289225 ?auto_289228 ) ) ( not ( = ?auto_289225 ?auto_289229 ) ) ( not ( = ?auto_289225 ?auto_289230 ) ) ( not ( = ?auto_289225 ?auto_289231 ) ) ( not ( = ?auto_289225 ?auto_289232 ) ) ( not ( = ?auto_289225 ?auto_289233 ) ) ( not ( = ?auto_289225 ?auto_289234 ) ) ( not ( = ?auto_289225 ?auto_289235 ) ) ( not ( = ?auto_289226 ?auto_289227 ) ) ( not ( = ?auto_289226 ?auto_289228 ) ) ( not ( = ?auto_289226 ?auto_289229 ) ) ( not ( = ?auto_289226 ?auto_289230 ) ) ( not ( = ?auto_289226 ?auto_289231 ) ) ( not ( = ?auto_289226 ?auto_289232 ) ) ( not ( = ?auto_289226 ?auto_289233 ) ) ( not ( = ?auto_289226 ?auto_289234 ) ) ( not ( = ?auto_289226 ?auto_289235 ) ) ( not ( = ?auto_289227 ?auto_289228 ) ) ( not ( = ?auto_289227 ?auto_289229 ) ) ( not ( = ?auto_289227 ?auto_289230 ) ) ( not ( = ?auto_289227 ?auto_289231 ) ) ( not ( = ?auto_289227 ?auto_289232 ) ) ( not ( = ?auto_289227 ?auto_289233 ) ) ( not ( = ?auto_289227 ?auto_289234 ) ) ( not ( = ?auto_289227 ?auto_289235 ) ) ( not ( = ?auto_289228 ?auto_289229 ) ) ( not ( = ?auto_289228 ?auto_289230 ) ) ( not ( = ?auto_289228 ?auto_289231 ) ) ( not ( = ?auto_289228 ?auto_289232 ) ) ( not ( = ?auto_289228 ?auto_289233 ) ) ( not ( = ?auto_289228 ?auto_289234 ) ) ( not ( = ?auto_289228 ?auto_289235 ) ) ( not ( = ?auto_289229 ?auto_289230 ) ) ( not ( = ?auto_289229 ?auto_289231 ) ) ( not ( = ?auto_289229 ?auto_289232 ) ) ( not ( = ?auto_289229 ?auto_289233 ) ) ( not ( = ?auto_289229 ?auto_289234 ) ) ( not ( = ?auto_289229 ?auto_289235 ) ) ( not ( = ?auto_289230 ?auto_289231 ) ) ( not ( = ?auto_289230 ?auto_289232 ) ) ( not ( = ?auto_289230 ?auto_289233 ) ) ( not ( = ?auto_289230 ?auto_289234 ) ) ( not ( = ?auto_289230 ?auto_289235 ) ) ( not ( = ?auto_289231 ?auto_289232 ) ) ( not ( = ?auto_289231 ?auto_289233 ) ) ( not ( = ?auto_289231 ?auto_289234 ) ) ( not ( = ?auto_289231 ?auto_289235 ) ) ( not ( = ?auto_289232 ?auto_289233 ) ) ( not ( = ?auto_289232 ?auto_289234 ) ) ( not ( = ?auto_289232 ?auto_289235 ) ) ( not ( = ?auto_289233 ?auto_289234 ) ) ( not ( = ?auto_289233 ?auto_289235 ) ) ( not ( = ?auto_289234 ?auto_289235 ) ) ( ON ?auto_289233 ?auto_289234 ) ( ON ?auto_289232 ?auto_289233 ) ( ON ?auto_289231 ?auto_289232 ) ( ON ?auto_289230 ?auto_289231 ) ( CLEAR ?auto_289228 ) ( ON ?auto_289229 ?auto_289230 ) ( CLEAR ?auto_289229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_289225 ?auto_289226 ?auto_289227 ?auto_289228 ?auto_289229 )
      ( MAKE-10PILE ?auto_289225 ?auto_289226 ?auto_289227 ?auto_289228 ?auto_289229 ?auto_289230 ?auto_289231 ?auto_289232 ?auto_289233 ?auto_289234 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289267 - BLOCK
      ?auto_289268 - BLOCK
      ?auto_289269 - BLOCK
      ?auto_289270 - BLOCK
      ?auto_289271 - BLOCK
      ?auto_289272 - BLOCK
      ?auto_289273 - BLOCK
      ?auto_289274 - BLOCK
      ?auto_289275 - BLOCK
      ?auto_289276 - BLOCK
    )
    :vars
    (
      ?auto_289277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289276 ?auto_289277 ) ( ON-TABLE ?auto_289267 ) ( ON ?auto_289268 ?auto_289267 ) ( ON ?auto_289269 ?auto_289268 ) ( not ( = ?auto_289267 ?auto_289268 ) ) ( not ( = ?auto_289267 ?auto_289269 ) ) ( not ( = ?auto_289267 ?auto_289270 ) ) ( not ( = ?auto_289267 ?auto_289271 ) ) ( not ( = ?auto_289267 ?auto_289272 ) ) ( not ( = ?auto_289267 ?auto_289273 ) ) ( not ( = ?auto_289267 ?auto_289274 ) ) ( not ( = ?auto_289267 ?auto_289275 ) ) ( not ( = ?auto_289267 ?auto_289276 ) ) ( not ( = ?auto_289267 ?auto_289277 ) ) ( not ( = ?auto_289268 ?auto_289269 ) ) ( not ( = ?auto_289268 ?auto_289270 ) ) ( not ( = ?auto_289268 ?auto_289271 ) ) ( not ( = ?auto_289268 ?auto_289272 ) ) ( not ( = ?auto_289268 ?auto_289273 ) ) ( not ( = ?auto_289268 ?auto_289274 ) ) ( not ( = ?auto_289268 ?auto_289275 ) ) ( not ( = ?auto_289268 ?auto_289276 ) ) ( not ( = ?auto_289268 ?auto_289277 ) ) ( not ( = ?auto_289269 ?auto_289270 ) ) ( not ( = ?auto_289269 ?auto_289271 ) ) ( not ( = ?auto_289269 ?auto_289272 ) ) ( not ( = ?auto_289269 ?auto_289273 ) ) ( not ( = ?auto_289269 ?auto_289274 ) ) ( not ( = ?auto_289269 ?auto_289275 ) ) ( not ( = ?auto_289269 ?auto_289276 ) ) ( not ( = ?auto_289269 ?auto_289277 ) ) ( not ( = ?auto_289270 ?auto_289271 ) ) ( not ( = ?auto_289270 ?auto_289272 ) ) ( not ( = ?auto_289270 ?auto_289273 ) ) ( not ( = ?auto_289270 ?auto_289274 ) ) ( not ( = ?auto_289270 ?auto_289275 ) ) ( not ( = ?auto_289270 ?auto_289276 ) ) ( not ( = ?auto_289270 ?auto_289277 ) ) ( not ( = ?auto_289271 ?auto_289272 ) ) ( not ( = ?auto_289271 ?auto_289273 ) ) ( not ( = ?auto_289271 ?auto_289274 ) ) ( not ( = ?auto_289271 ?auto_289275 ) ) ( not ( = ?auto_289271 ?auto_289276 ) ) ( not ( = ?auto_289271 ?auto_289277 ) ) ( not ( = ?auto_289272 ?auto_289273 ) ) ( not ( = ?auto_289272 ?auto_289274 ) ) ( not ( = ?auto_289272 ?auto_289275 ) ) ( not ( = ?auto_289272 ?auto_289276 ) ) ( not ( = ?auto_289272 ?auto_289277 ) ) ( not ( = ?auto_289273 ?auto_289274 ) ) ( not ( = ?auto_289273 ?auto_289275 ) ) ( not ( = ?auto_289273 ?auto_289276 ) ) ( not ( = ?auto_289273 ?auto_289277 ) ) ( not ( = ?auto_289274 ?auto_289275 ) ) ( not ( = ?auto_289274 ?auto_289276 ) ) ( not ( = ?auto_289274 ?auto_289277 ) ) ( not ( = ?auto_289275 ?auto_289276 ) ) ( not ( = ?auto_289275 ?auto_289277 ) ) ( not ( = ?auto_289276 ?auto_289277 ) ) ( ON ?auto_289275 ?auto_289276 ) ( ON ?auto_289274 ?auto_289275 ) ( ON ?auto_289273 ?auto_289274 ) ( ON ?auto_289272 ?auto_289273 ) ( ON ?auto_289271 ?auto_289272 ) ( CLEAR ?auto_289269 ) ( ON ?auto_289270 ?auto_289271 ) ( CLEAR ?auto_289270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_289267 ?auto_289268 ?auto_289269 ?auto_289270 )
      ( MAKE-10PILE ?auto_289267 ?auto_289268 ?auto_289269 ?auto_289270 ?auto_289271 ?auto_289272 ?auto_289273 ?auto_289274 ?auto_289275 ?auto_289276 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289309 - BLOCK
      ?auto_289310 - BLOCK
      ?auto_289311 - BLOCK
      ?auto_289312 - BLOCK
      ?auto_289313 - BLOCK
      ?auto_289314 - BLOCK
      ?auto_289315 - BLOCK
      ?auto_289316 - BLOCK
      ?auto_289317 - BLOCK
      ?auto_289318 - BLOCK
    )
    :vars
    (
      ?auto_289319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289318 ?auto_289319 ) ( ON-TABLE ?auto_289309 ) ( ON ?auto_289310 ?auto_289309 ) ( not ( = ?auto_289309 ?auto_289310 ) ) ( not ( = ?auto_289309 ?auto_289311 ) ) ( not ( = ?auto_289309 ?auto_289312 ) ) ( not ( = ?auto_289309 ?auto_289313 ) ) ( not ( = ?auto_289309 ?auto_289314 ) ) ( not ( = ?auto_289309 ?auto_289315 ) ) ( not ( = ?auto_289309 ?auto_289316 ) ) ( not ( = ?auto_289309 ?auto_289317 ) ) ( not ( = ?auto_289309 ?auto_289318 ) ) ( not ( = ?auto_289309 ?auto_289319 ) ) ( not ( = ?auto_289310 ?auto_289311 ) ) ( not ( = ?auto_289310 ?auto_289312 ) ) ( not ( = ?auto_289310 ?auto_289313 ) ) ( not ( = ?auto_289310 ?auto_289314 ) ) ( not ( = ?auto_289310 ?auto_289315 ) ) ( not ( = ?auto_289310 ?auto_289316 ) ) ( not ( = ?auto_289310 ?auto_289317 ) ) ( not ( = ?auto_289310 ?auto_289318 ) ) ( not ( = ?auto_289310 ?auto_289319 ) ) ( not ( = ?auto_289311 ?auto_289312 ) ) ( not ( = ?auto_289311 ?auto_289313 ) ) ( not ( = ?auto_289311 ?auto_289314 ) ) ( not ( = ?auto_289311 ?auto_289315 ) ) ( not ( = ?auto_289311 ?auto_289316 ) ) ( not ( = ?auto_289311 ?auto_289317 ) ) ( not ( = ?auto_289311 ?auto_289318 ) ) ( not ( = ?auto_289311 ?auto_289319 ) ) ( not ( = ?auto_289312 ?auto_289313 ) ) ( not ( = ?auto_289312 ?auto_289314 ) ) ( not ( = ?auto_289312 ?auto_289315 ) ) ( not ( = ?auto_289312 ?auto_289316 ) ) ( not ( = ?auto_289312 ?auto_289317 ) ) ( not ( = ?auto_289312 ?auto_289318 ) ) ( not ( = ?auto_289312 ?auto_289319 ) ) ( not ( = ?auto_289313 ?auto_289314 ) ) ( not ( = ?auto_289313 ?auto_289315 ) ) ( not ( = ?auto_289313 ?auto_289316 ) ) ( not ( = ?auto_289313 ?auto_289317 ) ) ( not ( = ?auto_289313 ?auto_289318 ) ) ( not ( = ?auto_289313 ?auto_289319 ) ) ( not ( = ?auto_289314 ?auto_289315 ) ) ( not ( = ?auto_289314 ?auto_289316 ) ) ( not ( = ?auto_289314 ?auto_289317 ) ) ( not ( = ?auto_289314 ?auto_289318 ) ) ( not ( = ?auto_289314 ?auto_289319 ) ) ( not ( = ?auto_289315 ?auto_289316 ) ) ( not ( = ?auto_289315 ?auto_289317 ) ) ( not ( = ?auto_289315 ?auto_289318 ) ) ( not ( = ?auto_289315 ?auto_289319 ) ) ( not ( = ?auto_289316 ?auto_289317 ) ) ( not ( = ?auto_289316 ?auto_289318 ) ) ( not ( = ?auto_289316 ?auto_289319 ) ) ( not ( = ?auto_289317 ?auto_289318 ) ) ( not ( = ?auto_289317 ?auto_289319 ) ) ( not ( = ?auto_289318 ?auto_289319 ) ) ( ON ?auto_289317 ?auto_289318 ) ( ON ?auto_289316 ?auto_289317 ) ( ON ?auto_289315 ?auto_289316 ) ( ON ?auto_289314 ?auto_289315 ) ( ON ?auto_289313 ?auto_289314 ) ( ON ?auto_289312 ?auto_289313 ) ( CLEAR ?auto_289310 ) ( ON ?auto_289311 ?auto_289312 ) ( CLEAR ?auto_289311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_289309 ?auto_289310 ?auto_289311 )
      ( MAKE-10PILE ?auto_289309 ?auto_289310 ?auto_289311 ?auto_289312 ?auto_289313 ?auto_289314 ?auto_289315 ?auto_289316 ?auto_289317 ?auto_289318 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289351 - BLOCK
      ?auto_289352 - BLOCK
      ?auto_289353 - BLOCK
      ?auto_289354 - BLOCK
      ?auto_289355 - BLOCK
      ?auto_289356 - BLOCK
      ?auto_289357 - BLOCK
      ?auto_289358 - BLOCK
      ?auto_289359 - BLOCK
      ?auto_289360 - BLOCK
    )
    :vars
    (
      ?auto_289361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289360 ?auto_289361 ) ( ON-TABLE ?auto_289351 ) ( not ( = ?auto_289351 ?auto_289352 ) ) ( not ( = ?auto_289351 ?auto_289353 ) ) ( not ( = ?auto_289351 ?auto_289354 ) ) ( not ( = ?auto_289351 ?auto_289355 ) ) ( not ( = ?auto_289351 ?auto_289356 ) ) ( not ( = ?auto_289351 ?auto_289357 ) ) ( not ( = ?auto_289351 ?auto_289358 ) ) ( not ( = ?auto_289351 ?auto_289359 ) ) ( not ( = ?auto_289351 ?auto_289360 ) ) ( not ( = ?auto_289351 ?auto_289361 ) ) ( not ( = ?auto_289352 ?auto_289353 ) ) ( not ( = ?auto_289352 ?auto_289354 ) ) ( not ( = ?auto_289352 ?auto_289355 ) ) ( not ( = ?auto_289352 ?auto_289356 ) ) ( not ( = ?auto_289352 ?auto_289357 ) ) ( not ( = ?auto_289352 ?auto_289358 ) ) ( not ( = ?auto_289352 ?auto_289359 ) ) ( not ( = ?auto_289352 ?auto_289360 ) ) ( not ( = ?auto_289352 ?auto_289361 ) ) ( not ( = ?auto_289353 ?auto_289354 ) ) ( not ( = ?auto_289353 ?auto_289355 ) ) ( not ( = ?auto_289353 ?auto_289356 ) ) ( not ( = ?auto_289353 ?auto_289357 ) ) ( not ( = ?auto_289353 ?auto_289358 ) ) ( not ( = ?auto_289353 ?auto_289359 ) ) ( not ( = ?auto_289353 ?auto_289360 ) ) ( not ( = ?auto_289353 ?auto_289361 ) ) ( not ( = ?auto_289354 ?auto_289355 ) ) ( not ( = ?auto_289354 ?auto_289356 ) ) ( not ( = ?auto_289354 ?auto_289357 ) ) ( not ( = ?auto_289354 ?auto_289358 ) ) ( not ( = ?auto_289354 ?auto_289359 ) ) ( not ( = ?auto_289354 ?auto_289360 ) ) ( not ( = ?auto_289354 ?auto_289361 ) ) ( not ( = ?auto_289355 ?auto_289356 ) ) ( not ( = ?auto_289355 ?auto_289357 ) ) ( not ( = ?auto_289355 ?auto_289358 ) ) ( not ( = ?auto_289355 ?auto_289359 ) ) ( not ( = ?auto_289355 ?auto_289360 ) ) ( not ( = ?auto_289355 ?auto_289361 ) ) ( not ( = ?auto_289356 ?auto_289357 ) ) ( not ( = ?auto_289356 ?auto_289358 ) ) ( not ( = ?auto_289356 ?auto_289359 ) ) ( not ( = ?auto_289356 ?auto_289360 ) ) ( not ( = ?auto_289356 ?auto_289361 ) ) ( not ( = ?auto_289357 ?auto_289358 ) ) ( not ( = ?auto_289357 ?auto_289359 ) ) ( not ( = ?auto_289357 ?auto_289360 ) ) ( not ( = ?auto_289357 ?auto_289361 ) ) ( not ( = ?auto_289358 ?auto_289359 ) ) ( not ( = ?auto_289358 ?auto_289360 ) ) ( not ( = ?auto_289358 ?auto_289361 ) ) ( not ( = ?auto_289359 ?auto_289360 ) ) ( not ( = ?auto_289359 ?auto_289361 ) ) ( not ( = ?auto_289360 ?auto_289361 ) ) ( ON ?auto_289359 ?auto_289360 ) ( ON ?auto_289358 ?auto_289359 ) ( ON ?auto_289357 ?auto_289358 ) ( ON ?auto_289356 ?auto_289357 ) ( ON ?auto_289355 ?auto_289356 ) ( ON ?auto_289354 ?auto_289355 ) ( ON ?auto_289353 ?auto_289354 ) ( CLEAR ?auto_289351 ) ( ON ?auto_289352 ?auto_289353 ) ( CLEAR ?auto_289352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_289351 ?auto_289352 )
      ( MAKE-10PILE ?auto_289351 ?auto_289352 ?auto_289353 ?auto_289354 ?auto_289355 ?auto_289356 ?auto_289357 ?auto_289358 ?auto_289359 ?auto_289360 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_289393 - BLOCK
      ?auto_289394 - BLOCK
      ?auto_289395 - BLOCK
      ?auto_289396 - BLOCK
      ?auto_289397 - BLOCK
      ?auto_289398 - BLOCK
      ?auto_289399 - BLOCK
      ?auto_289400 - BLOCK
      ?auto_289401 - BLOCK
      ?auto_289402 - BLOCK
    )
    :vars
    (
      ?auto_289403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289402 ?auto_289403 ) ( not ( = ?auto_289393 ?auto_289394 ) ) ( not ( = ?auto_289393 ?auto_289395 ) ) ( not ( = ?auto_289393 ?auto_289396 ) ) ( not ( = ?auto_289393 ?auto_289397 ) ) ( not ( = ?auto_289393 ?auto_289398 ) ) ( not ( = ?auto_289393 ?auto_289399 ) ) ( not ( = ?auto_289393 ?auto_289400 ) ) ( not ( = ?auto_289393 ?auto_289401 ) ) ( not ( = ?auto_289393 ?auto_289402 ) ) ( not ( = ?auto_289393 ?auto_289403 ) ) ( not ( = ?auto_289394 ?auto_289395 ) ) ( not ( = ?auto_289394 ?auto_289396 ) ) ( not ( = ?auto_289394 ?auto_289397 ) ) ( not ( = ?auto_289394 ?auto_289398 ) ) ( not ( = ?auto_289394 ?auto_289399 ) ) ( not ( = ?auto_289394 ?auto_289400 ) ) ( not ( = ?auto_289394 ?auto_289401 ) ) ( not ( = ?auto_289394 ?auto_289402 ) ) ( not ( = ?auto_289394 ?auto_289403 ) ) ( not ( = ?auto_289395 ?auto_289396 ) ) ( not ( = ?auto_289395 ?auto_289397 ) ) ( not ( = ?auto_289395 ?auto_289398 ) ) ( not ( = ?auto_289395 ?auto_289399 ) ) ( not ( = ?auto_289395 ?auto_289400 ) ) ( not ( = ?auto_289395 ?auto_289401 ) ) ( not ( = ?auto_289395 ?auto_289402 ) ) ( not ( = ?auto_289395 ?auto_289403 ) ) ( not ( = ?auto_289396 ?auto_289397 ) ) ( not ( = ?auto_289396 ?auto_289398 ) ) ( not ( = ?auto_289396 ?auto_289399 ) ) ( not ( = ?auto_289396 ?auto_289400 ) ) ( not ( = ?auto_289396 ?auto_289401 ) ) ( not ( = ?auto_289396 ?auto_289402 ) ) ( not ( = ?auto_289396 ?auto_289403 ) ) ( not ( = ?auto_289397 ?auto_289398 ) ) ( not ( = ?auto_289397 ?auto_289399 ) ) ( not ( = ?auto_289397 ?auto_289400 ) ) ( not ( = ?auto_289397 ?auto_289401 ) ) ( not ( = ?auto_289397 ?auto_289402 ) ) ( not ( = ?auto_289397 ?auto_289403 ) ) ( not ( = ?auto_289398 ?auto_289399 ) ) ( not ( = ?auto_289398 ?auto_289400 ) ) ( not ( = ?auto_289398 ?auto_289401 ) ) ( not ( = ?auto_289398 ?auto_289402 ) ) ( not ( = ?auto_289398 ?auto_289403 ) ) ( not ( = ?auto_289399 ?auto_289400 ) ) ( not ( = ?auto_289399 ?auto_289401 ) ) ( not ( = ?auto_289399 ?auto_289402 ) ) ( not ( = ?auto_289399 ?auto_289403 ) ) ( not ( = ?auto_289400 ?auto_289401 ) ) ( not ( = ?auto_289400 ?auto_289402 ) ) ( not ( = ?auto_289400 ?auto_289403 ) ) ( not ( = ?auto_289401 ?auto_289402 ) ) ( not ( = ?auto_289401 ?auto_289403 ) ) ( not ( = ?auto_289402 ?auto_289403 ) ) ( ON ?auto_289401 ?auto_289402 ) ( ON ?auto_289400 ?auto_289401 ) ( ON ?auto_289399 ?auto_289400 ) ( ON ?auto_289398 ?auto_289399 ) ( ON ?auto_289397 ?auto_289398 ) ( ON ?auto_289396 ?auto_289397 ) ( ON ?auto_289395 ?auto_289396 ) ( ON ?auto_289394 ?auto_289395 ) ( ON ?auto_289393 ?auto_289394 ) ( CLEAR ?auto_289393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_289393 )
      ( MAKE-10PILE ?auto_289393 ?auto_289394 ?auto_289395 ?auto_289396 ?auto_289397 ?auto_289398 ?auto_289399 ?auto_289400 ?auto_289401 ?auto_289402 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289436 - BLOCK
      ?auto_289437 - BLOCK
      ?auto_289438 - BLOCK
      ?auto_289439 - BLOCK
      ?auto_289440 - BLOCK
      ?auto_289441 - BLOCK
      ?auto_289442 - BLOCK
      ?auto_289443 - BLOCK
      ?auto_289444 - BLOCK
      ?auto_289445 - BLOCK
      ?auto_289446 - BLOCK
    )
    :vars
    (
      ?auto_289447 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_289445 ) ( ON ?auto_289446 ?auto_289447 ) ( CLEAR ?auto_289446 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_289436 ) ( ON ?auto_289437 ?auto_289436 ) ( ON ?auto_289438 ?auto_289437 ) ( ON ?auto_289439 ?auto_289438 ) ( ON ?auto_289440 ?auto_289439 ) ( ON ?auto_289441 ?auto_289440 ) ( ON ?auto_289442 ?auto_289441 ) ( ON ?auto_289443 ?auto_289442 ) ( ON ?auto_289444 ?auto_289443 ) ( ON ?auto_289445 ?auto_289444 ) ( not ( = ?auto_289436 ?auto_289437 ) ) ( not ( = ?auto_289436 ?auto_289438 ) ) ( not ( = ?auto_289436 ?auto_289439 ) ) ( not ( = ?auto_289436 ?auto_289440 ) ) ( not ( = ?auto_289436 ?auto_289441 ) ) ( not ( = ?auto_289436 ?auto_289442 ) ) ( not ( = ?auto_289436 ?auto_289443 ) ) ( not ( = ?auto_289436 ?auto_289444 ) ) ( not ( = ?auto_289436 ?auto_289445 ) ) ( not ( = ?auto_289436 ?auto_289446 ) ) ( not ( = ?auto_289436 ?auto_289447 ) ) ( not ( = ?auto_289437 ?auto_289438 ) ) ( not ( = ?auto_289437 ?auto_289439 ) ) ( not ( = ?auto_289437 ?auto_289440 ) ) ( not ( = ?auto_289437 ?auto_289441 ) ) ( not ( = ?auto_289437 ?auto_289442 ) ) ( not ( = ?auto_289437 ?auto_289443 ) ) ( not ( = ?auto_289437 ?auto_289444 ) ) ( not ( = ?auto_289437 ?auto_289445 ) ) ( not ( = ?auto_289437 ?auto_289446 ) ) ( not ( = ?auto_289437 ?auto_289447 ) ) ( not ( = ?auto_289438 ?auto_289439 ) ) ( not ( = ?auto_289438 ?auto_289440 ) ) ( not ( = ?auto_289438 ?auto_289441 ) ) ( not ( = ?auto_289438 ?auto_289442 ) ) ( not ( = ?auto_289438 ?auto_289443 ) ) ( not ( = ?auto_289438 ?auto_289444 ) ) ( not ( = ?auto_289438 ?auto_289445 ) ) ( not ( = ?auto_289438 ?auto_289446 ) ) ( not ( = ?auto_289438 ?auto_289447 ) ) ( not ( = ?auto_289439 ?auto_289440 ) ) ( not ( = ?auto_289439 ?auto_289441 ) ) ( not ( = ?auto_289439 ?auto_289442 ) ) ( not ( = ?auto_289439 ?auto_289443 ) ) ( not ( = ?auto_289439 ?auto_289444 ) ) ( not ( = ?auto_289439 ?auto_289445 ) ) ( not ( = ?auto_289439 ?auto_289446 ) ) ( not ( = ?auto_289439 ?auto_289447 ) ) ( not ( = ?auto_289440 ?auto_289441 ) ) ( not ( = ?auto_289440 ?auto_289442 ) ) ( not ( = ?auto_289440 ?auto_289443 ) ) ( not ( = ?auto_289440 ?auto_289444 ) ) ( not ( = ?auto_289440 ?auto_289445 ) ) ( not ( = ?auto_289440 ?auto_289446 ) ) ( not ( = ?auto_289440 ?auto_289447 ) ) ( not ( = ?auto_289441 ?auto_289442 ) ) ( not ( = ?auto_289441 ?auto_289443 ) ) ( not ( = ?auto_289441 ?auto_289444 ) ) ( not ( = ?auto_289441 ?auto_289445 ) ) ( not ( = ?auto_289441 ?auto_289446 ) ) ( not ( = ?auto_289441 ?auto_289447 ) ) ( not ( = ?auto_289442 ?auto_289443 ) ) ( not ( = ?auto_289442 ?auto_289444 ) ) ( not ( = ?auto_289442 ?auto_289445 ) ) ( not ( = ?auto_289442 ?auto_289446 ) ) ( not ( = ?auto_289442 ?auto_289447 ) ) ( not ( = ?auto_289443 ?auto_289444 ) ) ( not ( = ?auto_289443 ?auto_289445 ) ) ( not ( = ?auto_289443 ?auto_289446 ) ) ( not ( = ?auto_289443 ?auto_289447 ) ) ( not ( = ?auto_289444 ?auto_289445 ) ) ( not ( = ?auto_289444 ?auto_289446 ) ) ( not ( = ?auto_289444 ?auto_289447 ) ) ( not ( = ?auto_289445 ?auto_289446 ) ) ( not ( = ?auto_289445 ?auto_289447 ) ) ( not ( = ?auto_289446 ?auto_289447 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_289446 ?auto_289447 )
      ( !STACK ?auto_289446 ?auto_289445 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289482 - BLOCK
      ?auto_289483 - BLOCK
      ?auto_289484 - BLOCK
      ?auto_289485 - BLOCK
      ?auto_289486 - BLOCK
      ?auto_289487 - BLOCK
      ?auto_289488 - BLOCK
      ?auto_289489 - BLOCK
      ?auto_289490 - BLOCK
      ?auto_289491 - BLOCK
      ?auto_289492 - BLOCK
    )
    :vars
    (
      ?auto_289493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289492 ?auto_289493 ) ( ON-TABLE ?auto_289482 ) ( ON ?auto_289483 ?auto_289482 ) ( ON ?auto_289484 ?auto_289483 ) ( ON ?auto_289485 ?auto_289484 ) ( ON ?auto_289486 ?auto_289485 ) ( ON ?auto_289487 ?auto_289486 ) ( ON ?auto_289488 ?auto_289487 ) ( ON ?auto_289489 ?auto_289488 ) ( ON ?auto_289490 ?auto_289489 ) ( not ( = ?auto_289482 ?auto_289483 ) ) ( not ( = ?auto_289482 ?auto_289484 ) ) ( not ( = ?auto_289482 ?auto_289485 ) ) ( not ( = ?auto_289482 ?auto_289486 ) ) ( not ( = ?auto_289482 ?auto_289487 ) ) ( not ( = ?auto_289482 ?auto_289488 ) ) ( not ( = ?auto_289482 ?auto_289489 ) ) ( not ( = ?auto_289482 ?auto_289490 ) ) ( not ( = ?auto_289482 ?auto_289491 ) ) ( not ( = ?auto_289482 ?auto_289492 ) ) ( not ( = ?auto_289482 ?auto_289493 ) ) ( not ( = ?auto_289483 ?auto_289484 ) ) ( not ( = ?auto_289483 ?auto_289485 ) ) ( not ( = ?auto_289483 ?auto_289486 ) ) ( not ( = ?auto_289483 ?auto_289487 ) ) ( not ( = ?auto_289483 ?auto_289488 ) ) ( not ( = ?auto_289483 ?auto_289489 ) ) ( not ( = ?auto_289483 ?auto_289490 ) ) ( not ( = ?auto_289483 ?auto_289491 ) ) ( not ( = ?auto_289483 ?auto_289492 ) ) ( not ( = ?auto_289483 ?auto_289493 ) ) ( not ( = ?auto_289484 ?auto_289485 ) ) ( not ( = ?auto_289484 ?auto_289486 ) ) ( not ( = ?auto_289484 ?auto_289487 ) ) ( not ( = ?auto_289484 ?auto_289488 ) ) ( not ( = ?auto_289484 ?auto_289489 ) ) ( not ( = ?auto_289484 ?auto_289490 ) ) ( not ( = ?auto_289484 ?auto_289491 ) ) ( not ( = ?auto_289484 ?auto_289492 ) ) ( not ( = ?auto_289484 ?auto_289493 ) ) ( not ( = ?auto_289485 ?auto_289486 ) ) ( not ( = ?auto_289485 ?auto_289487 ) ) ( not ( = ?auto_289485 ?auto_289488 ) ) ( not ( = ?auto_289485 ?auto_289489 ) ) ( not ( = ?auto_289485 ?auto_289490 ) ) ( not ( = ?auto_289485 ?auto_289491 ) ) ( not ( = ?auto_289485 ?auto_289492 ) ) ( not ( = ?auto_289485 ?auto_289493 ) ) ( not ( = ?auto_289486 ?auto_289487 ) ) ( not ( = ?auto_289486 ?auto_289488 ) ) ( not ( = ?auto_289486 ?auto_289489 ) ) ( not ( = ?auto_289486 ?auto_289490 ) ) ( not ( = ?auto_289486 ?auto_289491 ) ) ( not ( = ?auto_289486 ?auto_289492 ) ) ( not ( = ?auto_289486 ?auto_289493 ) ) ( not ( = ?auto_289487 ?auto_289488 ) ) ( not ( = ?auto_289487 ?auto_289489 ) ) ( not ( = ?auto_289487 ?auto_289490 ) ) ( not ( = ?auto_289487 ?auto_289491 ) ) ( not ( = ?auto_289487 ?auto_289492 ) ) ( not ( = ?auto_289487 ?auto_289493 ) ) ( not ( = ?auto_289488 ?auto_289489 ) ) ( not ( = ?auto_289488 ?auto_289490 ) ) ( not ( = ?auto_289488 ?auto_289491 ) ) ( not ( = ?auto_289488 ?auto_289492 ) ) ( not ( = ?auto_289488 ?auto_289493 ) ) ( not ( = ?auto_289489 ?auto_289490 ) ) ( not ( = ?auto_289489 ?auto_289491 ) ) ( not ( = ?auto_289489 ?auto_289492 ) ) ( not ( = ?auto_289489 ?auto_289493 ) ) ( not ( = ?auto_289490 ?auto_289491 ) ) ( not ( = ?auto_289490 ?auto_289492 ) ) ( not ( = ?auto_289490 ?auto_289493 ) ) ( not ( = ?auto_289491 ?auto_289492 ) ) ( not ( = ?auto_289491 ?auto_289493 ) ) ( not ( = ?auto_289492 ?auto_289493 ) ) ( CLEAR ?auto_289490 ) ( ON ?auto_289491 ?auto_289492 ) ( CLEAR ?auto_289491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_289482 ?auto_289483 ?auto_289484 ?auto_289485 ?auto_289486 ?auto_289487 ?auto_289488 ?auto_289489 ?auto_289490 ?auto_289491 )
      ( MAKE-11PILE ?auto_289482 ?auto_289483 ?auto_289484 ?auto_289485 ?auto_289486 ?auto_289487 ?auto_289488 ?auto_289489 ?auto_289490 ?auto_289491 ?auto_289492 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289528 - BLOCK
      ?auto_289529 - BLOCK
      ?auto_289530 - BLOCK
      ?auto_289531 - BLOCK
      ?auto_289532 - BLOCK
      ?auto_289533 - BLOCK
      ?auto_289534 - BLOCK
      ?auto_289535 - BLOCK
      ?auto_289536 - BLOCK
      ?auto_289537 - BLOCK
      ?auto_289538 - BLOCK
    )
    :vars
    (
      ?auto_289539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289538 ?auto_289539 ) ( ON-TABLE ?auto_289528 ) ( ON ?auto_289529 ?auto_289528 ) ( ON ?auto_289530 ?auto_289529 ) ( ON ?auto_289531 ?auto_289530 ) ( ON ?auto_289532 ?auto_289531 ) ( ON ?auto_289533 ?auto_289532 ) ( ON ?auto_289534 ?auto_289533 ) ( ON ?auto_289535 ?auto_289534 ) ( not ( = ?auto_289528 ?auto_289529 ) ) ( not ( = ?auto_289528 ?auto_289530 ) ) ( not ( = ?auto_289528 ?auto_289531 ) ) ( not ( = ?auto_289528 ?auto_289532 ) ) ( not ( = ?auto_289528 ?auto_289533 ) ) ( not ( = ?auto_289528 ?auto_289534 ) ) ( not ( = ?auto_289528 ?auto_289535 ) ) ( not ( = ?auto_289528 ?auto_289536 ) ) ( not ( = ?auto_289528 ?auto_289537 ) ) ( not ( = ?auto_289528 ?auto_289538 ) ) ( not ( = ?auto_289528 ?auto_289539 ) ) ( not ( = ?auto_289529 ?auto_289530 ) ) ( not ( = ?auto_289529 ?auto_289531 ) ) ( not ( = ?auto_289529 ?auto_289532 ) ) ( not ( = ?auto_289529 ?auto_289533 ) ) ( not ( = ?auto_289529 ?auto_289534 ) ) ( not ( = ?auto_289529 ?auto_289535 ) ) ( not ( = ?auto_289529 ?auto_289536 ) ) ( not ( = ?auto_289529 ?auto_289537 ) ) ( not ( = ?auto_289529 ?auto_289538 ) ) ( not ( = ?auto_289529 ?auto_289539 ) ) ( not ( = ?auto_289530 ?auto_289531 ) ) ( not ( = ?auto_289530 ?auto_289532 ) ) ( not ( = ?auto_289530 ?auto_289533 ) ) ( not ( = ?auto_289530 ?auto_289534 ) ) ( not ( = ?auto_289530 ?auto_289535 ) ) ( not ( = ?auto_289530 ?auto_289536 ) ) ( not ( = ?auto_289530 ?auto_289537 ) ) ( not ( = ?auto_289530 ?auto_289538 ) ) ( not ( = ?auto_289530 ?auto_289539 ) ) ( not ( = ?auto_289531 ?auto_289532 ) ) ( not ( = ?auto_289531 ?auto_289533 ) ) ( not ( = ?auto_289531 ?auto_289534 ) ) ( not ( = ?auto_289531 ?auto_289535 ) ) ( not ( = ?auto_289531 ?auto_289536 ) ) ( not ( = ?auto_289531 ?auto_289537 ) ) ( not ( = ?auto_289531 ?auto_289538 ) ) ( not ( = ?auto_289531 ?auto_289539 ) ) ( not ( = ?auto_289532 ?auto_289533 ) ) ( not ( = ?auto_289532 ?auto_289534 ) ) ( not ( = ?auto_289532 ?auto_289535 ) ) ( not ( = ?auto_289532 ?auto_289536 ) ) ( not ( = ?auto_289532 ?auto_289537 ) ) ( not ( = ?auto_289532 ?auto_289538 ) ) ( not ( = ?auto_289532 ?auto_289539 ) ) ( not ( = ?auto_289533 ?auto_289534 ) ) ( not ( = ?auto_289533 ?auto_289535 ) ) ( not ( = ?auto_289533 ?auto_289536 ) ) ( not ( = ?auto_289533 ?auto_289537 ) ) ( not ( = ?auto_289533 ?auto_289538 ) ) ( not ( = ?auto_289533 ?auto_289539 ) ) ( not ( = ?auto_289534 ?auto_289535 ) ) ( not ( = ?auto_289534 ?auto_289536 ) ) ( not ( = ?auto_289534 ?auto_289537 ) ) ( not ( = ?auto_289534 ?auto_289538 ) ) ( not ( = ?auto_289534 ?auto_289539 ) ) ( not ( = ?auto_289535 ?auto_289536 ) ) ( not ( = ?auto_289535 ?auto_289537 ) ) ( not ( = ?auto_289535 ?auto_289538 ) ) ( not ( = ?auto_289535 ?auto_289539 ) ) ( not ( = ?auto_289536 ?auto_289537 ) ) ( not ( = ?auto_289536 ?auto_289538 ) ) ( not ( = ?auto_289536 ?auto_289539 ) ) ( not ( = ?auto_289537 ?auto_289538 ) ) ( not ( = ?auto_289537 ?auto_289539 ) ) ( not ( = ?auto_289538 ?auto_289539 ) ) ( ON ?auto_289537 ?auto_289538 ) ( CLEAR ?auto_289535 ) ( ON ?auto_289536 ?auto_289537 ) ( CLEAR ?auto_289536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_289528 ?auto_289529 ?auto_289530 ?auto_289531 ?auto_289532 ?auto_289533 ?auto_289534 ?auto_289535 ?auto_289536 )
      ( MAKE-11PILE ?auto_289528 ?auto_289529 ?auto_289530 ?auto_289531 ?auto_289532 ?auto_289533 ?auto_289534 ?auto_289535 ?auto_289536 ?auto_289537 ?auto_289538 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289574 - BLOCK
      ?auto_289575 - BLOCK
      ?auto_289576 - BLOCK
      ?auto_289577 - BLOCK
      ?auto_289578 - BLOCK
      ?auto_289579 - BLOCK
      ?auto_289580 - BLOCK
      ?auto_289581 - BLOCK
      ?auto_289582 - BLOCK
      ?auto_289583 - BLOCK
      ?auto_289584 - BLOCK
    )
    :vars
    (
      ?auto_289585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289584 ?auto_289585 ) ( ON-TABLE ?auto_289574 ) ( ON ?auto_289575 ?auto_289574 ) ( ON ?auto_289576 ?auto_289575 ) ( ON ?auto_289577 ?auto_289576 ) ( ON ?auto_289578 ?auto_289577 ) ( ON ?auto_289579 ?auto_289578 ) ( ON ?auto_289580 ?auto_289579 ) ( not ( = ?auto_289574 ?auto_289575 ) ) ( not ( = ?auto_289574 ?auto_289576 ) ) ( not ( = ?auto_289574 ?auto_289577 ) ) ( not ( = ?auto_289574 ?auto_289578 ) ) ( not ( = ?auto_289574 ?auto_289579 ) ) ( not ( = ?auto_289574 ?auto_289580 ) ) ( not ( = ?auto_289574 ?auto_289581 ) ) ( not ( = ?auto_289574 ?auto_289582 ) ) ( not ( = ?auto_289574 ?auto_289583 ) ) ( not ( = ?auto_289574 ?auto_289584 ) ) ( not ( = ?auto_289574 ?auto_289585 ) ) ( not ( = ?auto_289575 ?auto_289576 ) ) ( not ( = ?auto_289575 ?auto_289577 ) ) ( not ( = ?auto_289575 ?auto_289578 ) ) ( not ( = ?auto_289575 ?auto_289579 ) ) ( not ( = ?auto_289575 ?auto_289580 ) ) ( not ( = ?auto_289575 ?auto_289581 ) ) ( not ( = ?auto_289575 ?auto_289582 ) ) ( not ( = ?auto_289575 ?auto_289583 ) ) ( not ( = ?auto_289575 ?auto_289584 ) ) ( not ( = ?auto_289575 ?auto_289585 ) ) ( not ( = ?auto_289576 ?auto_289577 ) ) ( not ( = ?auto_289576 ?auto_289578 ) ) ( not ( = ?auto_289576 ?auto_289579 ) ) ( not ( = ?auto_289576 ?auto_289580 ) ) ( not ( = ?auto_289576 ?auto_289581 ) ) ( not ( = ?auto_289576 ?auto_289582 ) ) ( not ( = ?auto_289576 ?auto_289583 ) ) ( not ( = ?auto_289576 ?auto_289584 ) ) ( not ( = ?auto_289576 ?auto_289585 ) ) ( not ( = ?auto_289577 ?auto_289578 ) ) ( not ( = ?auto_289577 ?auto_289579 ) ) ( not ( = ?auto_289577 ?auto_289580 ) ) ( not ( = ?auto_289577 ?auto_289581 ) ) ( not ( = ?auto_289577 ?auto_289582 ) ) ( not ( = ?auto_289577 ?auto_289583 ) ) ( not ( = ?auto_289577 ?auto_289584 ) ) ( not ( = ?auto_289577 ?auto_289585 ) ) ( not ( = ?auto_289578 ?auto_289579 ) ) ( not ( = ?auto_289578 ?auto_289580 ) ) ( not ( = ?auto_289578 ?auto_289581 ) ) ( not ( = ?auto_289578 ?auto_289582 ) ) ( not ( = ?auto_289578 ?auto_289583 ) ) ( not ( = ?auto_289578 ?auto_289584 ) ) ( not ( = ?auto_289578 ?auto_289585 ) ) ( not ( = ?auto_289579 ?auto_289580 ) ) ( not ( = ?auto_289579 ?auto_289581 ) ) ( not ( = ?auto_289579 ?auto_289582 ) ) ( not ( = ?auto_289579 ?auto_289583 ) ) ( not ( = ?auto_289579 ?auto_289584 ) ) ( not ( = ?auto_289579 ?auto_289585 ) ) ( not ( = ?auto_289580 ?auto_289581 ) ) ( not ( = ?auto_289580 ?auto_289582 ) ) ( not ( = ?auto_289580 ?auto_289583 ) ) ( not ( = ?auto_289580 ?auto_289584 ) ) ( not ( = ?auto_289580 ?auto_289585 ) ) ( not ( = ?auto_289581 ?auto_289582 ) ) ( not ( = ?auto_289581 ?auto_289583 ) ) ( not ( = ?auto_289581 ?auto_289584 ) ) ( not ( = ?auto_289581 ?auto_289585 ) ) ( not ( = ?auto_289582 ?auto_289583 ) ) ( not ( = ?auto_289582 ?auto_289584 ) ) ( not ( = ?auto_289582 ?auto_289585 ) ) ( not ( = ?auto_289583 ?auto_289584 ) ) ( not ( = ?auto_289583 ?auto_289585 ) ) ( not ( = ?auto_289584 ?auto_289585 ) ) ( ON ?auto_289583 ?auto_289584 ) ( ON ?auto_289582 ?auto_289583 ) ( CLEAR ?auto_289580 ) ( ON ?auto_289581 ?auto_289582 ) ( CLEAR ?auto_289581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_289574 ?auto_289575 ?auto_289576 ?auto_289577 ?auto_289578 ?auto_289579 ?auto_289580 ?auto_289581 )
      ( MAKE-11PILE ?auto_289574 ?auto_289575 ?auto_289576 ?auto_289577 ?auto_289578 ?auto_289579 ?auto_289580 ?auto_289581 ?auto_289582 ?auto_289583 ?auto_289584 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289620 - BLOCK
      ?auto_289621 - BLOCK
      ?auto_289622 - BLOCK
      ?auto_289623 - BLOCK
      ?auto_289624 - BLOCK
      ?auto_289625 - BLOCK
      ?auto_289626 - BLOCK
      ?auto_289627 - BLOCK
      ?auto_289628 - BLOCK
      ?auto_289629 - BLOCK
      ?auto_289630 - BLOCK
    )
    :vars
    (
      ?auto_289631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289630 ?auto_289631 ) ( ON-TABLE ?auto_289620 ) ( ON ?auto_289621 ?auto_289620 ) ( ON ?auto_289622 ?auto_289621 ) ( ON ?auto_289623 ?auto_289622 ) ( ON ?auto_289624 ?auto_289623 ) ( ON ?auto_289625 ?auto_289624 ) ( not ( = ?auto_289620 ?auto_289621 ) ) ( not ( = ?auto_289620 ?auto_289622 ) ) ( not ( = ?auto_289620 ?auto_289623 ) ) ( not ( = ?auto_289620 ?auto_289624 ) ) ( not ( = ?auto_289620 ?auto_289625 ) ) ( not ( = ?auto_289620 ?auto_289626 ) ) ( not ( = ?auto_289620 ?auto_289627 ) ) ( not ( = ?auto_289620 ?auto_289628 ) ) ( not ( = ?auto_289620 ?auto_289629 ) ) ( not ( = ?auto_289620 ?auto_289630 ) ) ( not ( = ?auto_289620 ?auto_289631 ) ) ( not ( = ?auto_289621 ?auto_289622 ) ) ( not ( = ?auto_289621 ?auto_289623 ) ) ( not ( = ?auto_289621 ?auto_289624 ) ) ( not ( = ?auto_289621 ?auto_289625 ) ) ( not ( = ?auto_289621 ?auto_289626 ) ) ( not ( = ?auto_289621 ?auto_289627 ) ) ( not ( = ?auto_289621 ?auto_289628 ) ) ( not ( = ?auto_289621 ?auto_289629 ) ) ( not ( = ?auto_289621 ?auto_289630 ) ) ( not ( = ?auto_289621 ?auto_289631 ) ) ( not ( = ?auto_289622 ?auto_289623 ) ) ( not ( = ?auto_289622 ?auto_289624 ) ) ( not ( = ?auto_289622 ?auto_289625 ) ) ( not ( = ?auto_289622 ?auto_289626 ) ) ( not ( = ?auto_289622 ?auto_289627 ) ) ( not ( = ?auto_289622 ?auto_289628 ) ) ( not ( = ?auto_289622 ?auto_289629 ) ) ( not ( = ?auto_289622 ?auto_289630 ) ) ( not ( = ?auto_289622 ?auto_289631 ) ) ( not ( = ?auto_289623 ?auto_289624 ) ) ( not ( = ?auto_289623 ?auto_289625 ) ) ( not ( = ?auto_289623 ?auto_289626 ) ) ( not ( = ?auto_289623 ?auto_289627 ) ) ( not ( = ?auto_289623 ?auto_289628 ) ) ( not ( = ?auto_289623 ?auto_289629 ) ) ( not ( = ?auto_289623 ?auto_289630 ) ) ( not ( = ?auto_289623 ?auto_289631 ) ) ( not ( = ?auto_289624 ?auto_289625 ) ) ( not ( = ?auto_289624 ?auto_289626 ) ) ( not ( = ?auto_289624 ?auto_289627 ) ) ( not ( = ?auto_289624 ?auto_289628 ) ) ( not ( = ?auto_289624 ?auto_289629 ) ) ( not ( = ?auto_289624 ?auto_289630 ) ) ( not ( = ?auto_289624 ?auto_289631 ) ) ( not ( = ?auto_289625 ?auto_289626 ) ) ( not ( = ?auto_289625 ?auto_289627 ) ) ( not ( = ?auto_289625 ?auto_289628 ) ) ( not ( = ?auto_289625 ?auto_289629 ) ) ( not ( = ?auto_289625 ?auto_289630 ) ) ( not ( = ?auto_289625 ?auto_289631 ) ) ( not ( = ?auto_289626 ?auto_289627 ) ) ( not ( = ?auto_289626 ?auto_289628 ) ) ( not ( = ?auto_289626 ?auto_289629 ) ) ( not ( = ?auto_289626 ?auto_289630 ) ) ( not ( = ?auto_289626 ?auto_289631 ) ) ( not ( = ?auto_289627 ?auto_289628 ) ) ( not ( = ?auto_289627 ?auto_289629 ) ) ( not ( = ?auto_289627 ?auto_289630 ) ) ( not ( = ?auto_289627 ?auto_289631 ) ) ( not ( = ?auto_289628 ?auto_289629 ) ) ( not ( = ?auto_289628 ?auto_289630 ) ) ( not ( = ?auto_289628 ?auto_289631 ) ) ( not ( = ?auto_289629 ?auto_289630 ) ) ( not ( = ?auto_289629 ?auto_289631 ) ) ( not ( = ?auto_289630 ?auto_289631 ) ) ( ON ?auto_289629 ?auto_289630 ) ( ON ?auto_289628 ?auto_289629 ) ( ON ?auto_289627 ?auto_289628 ) ( CLEAR ?auto_289625 ) ( ON ?auto_289626 ?auto_289627 ) ( CLEAR ?auto_289626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_289620 ?auto_289621 ?auto_289622 ?auto_289623 ?auto_289624 ?auto_289625 ?auto_289626 )
      ( MAKE-11PILE ?auto_289620 ?auto_289621 ?auto_289622 ?auto_289623 ?auto_289624 ?auto_289625 ?auto_289626 ?auto_289627 ?auto_289628 ?auto_289629 ?auto_289630 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289666 - BLOCK
      ?auto_289667 - BLOCK
      ?auto_289668 - BLOCK
      ?auto_289669 - BLOCK
      ?auto_289670 - BLOCK
      ?auto_289671 - BLOCK
      ?auto_289672 - BLOCK
      ?auto_289673 - BLOCK
      ?auto_289674 - BLOCK
      ?auto_289675 - BLOCK
      ?auto_289676 - BLOCK
    )
    :vars
    (
      ?auto_289677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289676 ?auto_289677 ) ( ON-TABLE ?auto_289666 ) ( ON ?auto_289667 ?auto_289666 ) ( ON ?auto_289668 ?auto_289667 ) ( ON ?auto_289669 ?auto_289668 ) ( ON ?auto_289670 ?auto_289669 ) ( not ( = ?auto_289666 ?auto_289667 ) ) ( not ( = ?auto_289666 ?auto_289668 ) ) ( not ( = ?auto_289666 ?auto_289669 ) ) ( not ( = ?auto_289666 ?auto_289670 ) ) ( not ( = ?auto_289666 ?auto_289671 ) ) ( not ( = ?auto_289666 ?auto_289672 ) ) ( not ( = ?auto_289666 ?auto_289673 ) ) ( not ( = ?auto_289666 ?auto_289674 ) ) ( not ( = ?auto_289666 ?auto_289675 ) ) ( not ( = ?auto_289666 ?auto_289676 ) ) ( not ( = ?auto_289666 ?auto_289677 ) ) ( not ( = ?auto_289667 ?auto_289668 ) ) ( not ( = ?auto_289667 ?auto_289669 ) ) ( not ( = ?auto_289667 ?auto_289670 ) ) ( not ( = ?auto_289667 ?auto_289671 ) ) ( not ( = ?auto_289667 ?auto_289672 ) ) ( not ( = ?auto_289667 ?auto_289673 ) ) ( not ( = ?auto_289667 ?auto_289674 ) ) ( not ( = ?auto_289667 ?auto_289675 ) ) ( not ( = ?auto_289667 ?auto_289676 ) ) ( not ( = ?auto_289667 ?auto_289677 ) ) ( not ( = ?auto_289668 ?auto_289669 ) ) ( not ( = ?auto_289668 ?auto_289670 ) ) ( not ( = ?auto_289668 ?auto_289671 ) ) ( not ( = ?auto_289668 ?auto_289672 ) ) ( not ( = ?auto_289668 ?auto_289673 ) ) ( not ( = ?auto_289668 ?auto_289674 ) ) ( not ( = ?auto_289668 ?auto_289675 ) ) ( not ( = ?auto_289668 ?auto_289676 ) ) ( not ( = ?auto_289668 ?auto_289677 ) ) ( not ( = ?auto_289669 ?auto_289670 ) ) ( not ( = ?auto_289669 ?auto_289671 ) ) ( not ( = ?auto_289669 ?auto_289672 ) ) ( not ( = ?auto_289669 ?auto_289673 ) ) ( not ( = ?auto_289669 ?auto_289674 ) ) ( not ( = ?auto_289669 ?auto_289675 ) ) ( not ( = ?auto_289669 ?auto_289676 ) ) ( not ( = ?auto_289669 ?auto_289677 ) ) ( not ( = ?auto_289670 ?auto_289671 ) ) ( not ( = ?auto_289670 ?auto_289672 ) ) ( not ( = ?auto_289670 ?auto_289673 ) ) ( not ( = ?auto_289670 ?auto_289674 ) ) ( not ( = ?auto_289670 ?auto_289675 ) ) ( not ( = ?auto_289670 ?auto_289676 ) ) ( not ( = ?auto_289670 ?auto_289677 ) ) ( not ( = ?auto_289671 ?auto_289672 ) ) ( not ( = ?auto_289671 ?auto_289673 ) ) ( not ( = ?auto_289671 ?auto_289674 ) ) ( not ( = ?auto_289671 ?auto_289675 ) ) ( not ( = ?auto_289671 ?auto_289676 ) ) ( not ( = ?auto_289671 ?auto_289677 ) ) ( not ( = ?auto_289672 ?auto_289673 ) ) ( not ( = ?auto_289672 ?auto_289674 ) ) ( not ( = ?auto_289672 ?auto_289675 ) ) ( not ( = ?auto_289672 ?auto_289676 ) ) ( not ( = ?auto_289672 ?auto_289677 ) ) ( not ( = ?auto_289673 ?auto_289674 ) ) ( not ( = ?auto_289673 ?auto_289675 ) ) ( not ( = ?auto_289673 ?auto_289676 ) ) ( not ( = ?auto_289673 ?auto_289677 ) ) ( not ( = ?auto_289674 ?auto_289675 ) ) ( not ( = ?auto_289674 ?auto_289676 ) ) ( not ( = ?auto_289674 ?auto_289677 ) ) ( not ( = ?auto_289675 ?auto_289676 ) ) ( not ( = ?auto_289675 ?auto_289677 ) ) ( not ( = ?auto_289676 ?auto_289677 ) ) ( ON ?auto_289675 ?auto_289676 ) ( ON ?auto_289674 ?auto_289675 ) ( ON ?auto_289673 ?auto_289674 ) ( ON ?auto_289672 ?auto_289673 ) ( CLEAR ?auto_289670 ) ( ON ?auto_289671 ?auto_289672 ) ( CLEAR ?auto_289671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_289666 ?auto_289667 ?auto_289668 ?auto_289669 ?auto_289670 ?auto_289671 )
      ( MAKE-11PILE ?auto_289666 ?auto_289667 ?auto_289668 ?auto_289669 ?auto_289670 ?auto_289671 ?auto_289672 ?auto_289673 ?auto_289674 ?auto_289675 ?auto_289676 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289712 - BLOCK
      ?auto_289713 - BLOCK
      ?auto_289714 - BLOCK
      ?auto_289715 - BLOCK
      ?auto_289716 - BLOCK
      ?auto_289717 - BLOCK
      ?auto_289718 - BLOCK
      ?auto_289719 - BLOCK
      ?auto_289720 - BLOCK
      ?auto_289721 - BLOCK
      ?auto_289722 - BLOCK
    )
    :vars
    (
      ?auto_289723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289722 ?auto_289723 ) ( ON-TABLE ?auto_289712 ) ( ON ?auto_289713 ?auto_289712 ) ( ON ?auto_289714 ?auto_289713 ) ( ON ?auto_289715 ?auto_289714 ) ( not ( = ?auto_289712 ?auto_289713 ) ) ( not ( = ?auto_289712 ?auto_289714 ) ) ( not ( = ?auto_289712 ?auto_289715 ) ) ( not ( = ?auto_289712 ?auto_289716 ) ) ( not ( = ?auto_289712 ?auto_289717 ) ) ( not ( = ?auto_289712 ?auto_289718 ) ) ( not ( = ?auto_289712 ?auto_289719 ) ) ( not ( = ?auto_289712 ?auto_289720 ) ) ( not ( = ?auto_289712 ?auto_289721 ) ) ( not ( = ?auto_289712 ?auto_289722 ) ) ( not ( = ?auto_289712 ?auto_289723 ) ) ( not ( = ?auto_289713 ?auto_289714 ) ) ( not ( = ?auto_289713 ?auto_289715 ) ) ( not ( = ?auto_289713 ?auto_289716 ) ) ( not ( = ?auto_289713 ?auto_289717 ) ) ( not ( = ?auto_289713 ?auto_289718 ) ) ( not ( = ?auto_289713 ?auto_289719 ) ) ( not ( = ?auto_289713 ?auto_289720 ) ) ( not ( = ?auto_289713 ?auto_289721 ) ) ( not ( = ?auto_289713 ?auto_289722 ) ) ( not ( = ?auto_289713 ?auto_289723 ) ) ( not ( = ?auto_289714 ?auto_289715 ) ) ( not ( = ?auto_289714 ?auto_289716 ) ) ( not ( = ?auto_289714 ?auto_289717 ) ) ( not ( = ?auto_289714 ?auto_289718 ) ) ( not ( = ?auto_289714 ?auto_289719 ) ) ( not ( = ?auto_289714 ?auto_289720 ) ) ( not ( = ?auto_289714 ?auto_289721 ) ) ( not ( = ?auto_289714 ?auto_289722 ) ) ( not ( = ?auto_289714 ?auto_289723 ) ) ( not ( = ?auto_289715 ?auto_289716 ) ) ( not ( = ?auto_289715 ?auto_289717 ) ) ( not ( = ?auto_289715 ?auto_289718 ) ) ( not ( = ?auto_289715 ?auto_289719 ) ) ( not ( = ?auto_289715 ?auto_289720 ) ) ( not ( = ?auto_289715 ?auto_289721 ) ) ( not ( = ?auto_289715 ?auto_289722 ) ) ( not ( = ?auto_289715 ?auto_289723 ) ) ( not ( = ?auto_289716 ?auto_289717 ) ) ( not ( = ?auto_289716 ?auto_289718 ) ) ( not ( = ?auto_289716 ?auto_289719 ) ) ( not ( = ?auto_289716 ?auto_289720 ) ) ( not ( = ?auto_289716 ?auto_289721 ) ) ( not ( = ?auto_289716 ?auto_289722 ) ) ( not ( = ?auto_289716 ?auto_289723 ) ) ( not ( = ?auto_289717 ?auto_289718 ) ) ( not ( = ?auto_289717 ?auto_289719 ) ) ( not ( = ?auto_289717 ?auto_289720 ) ) ( not ( = ?auto_289717 ?auto_289721 ) ) ( not ( = ?auto_289717 ?auto_289722 ) ) ( not ( = ?auto_289717 ?auto_289723 ) ) ( not ( = ?auto_289718 ?auto_289719 ) ) ( not ( = ?auto_289718 ?auto_289720 ) ) ( not ( = ?auto_289718 ?auto_289721 ) ) ( not ( = ?auto_289718 ?auto_289722 ) ) ( not ( = ?auto_289718 ?auto_289723 ) ) ( not ( = ?auto_289719 ?auto_289720 ) ) ( not ( = ?auto_289719 ?auto_289721 ) ) ( not ( = ?auto_289719 ?auto_289722 ) ) ( not ( = ?auto_289719 ?auto_289723 ) ) ( not ( = ?auto_289720 ?auto_289721 ) ) ( not ( = ?auto_289720 ?auto_289722 ) ) ( not ( = ?auto_289720 ?auto_289723 ) ) ( not ( = ?auto_289721 ?auto_289722 ) ) ( not ( = ?auto_289721 ?auto_289723 ) ) ( not ( = ?auto_289722 ?auto_289723 ) ) ( ON ?auto_289721 ?auto_289722 ) ( ON ?auto_289720 ?auto_289721 ) ( ON ?auto_289719 ?auto_289720 ) ( ON ?auto_289718 ?auto_289719 ) ( ON ?auto_289717 ?auto_289718 ) ( CLEAR ?auto_289715 ) ( ON ?auto_289716 ?auto_289717 ) ( CLEAR ?auto_289716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_289712 ?auto_289713 ?auto_289714 ?auto_289715 ?auto_289716 )
      ( MAKE-11PILE ?auto_289712 ?auto_289713 ?auto_289714 ?auto_289715 ?auto_289716 ?auto_289717 ?auto_289718 ?auto_289719 ?auto_289720 ?auto_289721 ?auto_289722 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289758 - BLOCK
      ?auto_289759 - BLOCK
      ?auto_289760 - BLOCK
      ?auto_289761 - BLOCK
      ?auto_289762 - BLOCK
      ?auto_289763 - BLOCK
      ?auto_289764 - BLOCK
      ?auto_289765 - BLOCK
      ?auto_289766 - BLOCK
      ?auto_289767 - BLOCK
      ?auto_289768 - BLOCK
    )
    :vars
    (
      ?auto_289769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289768 ?auto_289769 ) ( ON-TABLE ?auto_289758 ) ( ON ?auto_289759 ?auto_289758 ) ( ON ?auto_289760 ?auto_289759 ) ( not ( = ?auto_289758 ?auto_289759 ) ) ( not ( = ?auto_289758 ?auto_289760 ) ) ( not ( = ?auto_289758 ?auto_289761 ) ) ( not ( = ?auto_289758 ?auto_289762 ) ) ( not ( = ?auto_289758 ?auto_289763 ) ) ( not ( = ?auto_289758 ?auto_289764 ) ) ( not ( = ?auto_289758 ?auto_289765 ) ) ( not ( = ?auto_289758 ?auto_289766 ) ) ( not ( = ?auto_289758 ?auto_289767 ) ) ( not ( = ?auto_289758 ?auto_289768 ) ) ( not ( = ?auto_289758 ?auto_289769 ) ) ( not ( = ?auto_289759 ?auto_289760 ) ) ( not ( = ?auto_289759 ?auto_289761 ) ) ( not ( = ?auto_289759 ?auto_289762 ) ) ( not ( = ?auto_289759 ?auto_289763 ) ) ( not ( = ?auto_289759 ?auto_289764 ) ) ( not ( = ?auto_289759 ?auto_289765 ) ) ( not ( = ?auto_289759 ?auto_289766 ) ) ( not ( = ?auto_289759 ?auto_289767 ) ) ( not ( = ?auto_289759 ?auto_289768 ) ) ( not ( = ?auto_289759 ?auto_289769 ) ) ( not ( = ?auto_289760 ?auto_289761 ) ) ( not ( = ?auto_289760 ?auto_289762 ) ) ( not ( = ?auto_289760 ?auto_289763 ) ) ( not ( = ?auto_289760 ?auto_289764 ) ) ( not ( = ?auto_289760 ?auto_289765 ) ) ( not ( = ?auto_289760 ?auto_289766 ) ) ( not ( = ?auto_289760 ?auto_289767 ) ) ( not ( = ?auto_289760 ?auto_289768 ) ) ( not ( = ?auto_289760 ?auto_289769 ) ) ( not ( = ?auto_289761 ?auto_289762 ) ) ( not ( = ?auto_289761 ?auto_289763 ) ) ( not ( = ?auto_289761 ?auto_289764 ) ) ( not ( = ?auto_289761 ?auto_289765 ) ) ( not ( = ?auto_289761 ?auto_289766 ) ) ( not ( = ?auto_289761 ?auto_289767 ) ) ( not ( = ?auto_289761 ?auto_289768 ) ) ( not ( = ?auto_289761 ?auto_289769 ) ) ( not ( = ?auto_289762 ?auto_289763 ) ) ( not ( = ?auto_289762 ?auto_289764 ) ) ( not ( = ?auto_289762 ?auto_289765 ) ) ( not ( = ?auto_289762 ?auto_289766 ) ) ( not ( = ?auto_289762 ?auto_289767 ) ) ( not ( = ?auto_289762 ?auto_289768 ) ) ( not ( = ?auto_289762 ?auto_289769 ) ) ( not ( = ?auto_289763 ?auto_289764 ) ) ( not ( = ?auto_289763 ?auto_289765 ) ) ( not ( = ?auto_289763 ?auto_289766 ) ) ( not ( = ?auto_289763 ?auto_289767 ) ) ( not ( = ?auto_289763 ?auto_289768 ) ) ( not ( = ?auto_289763 ?auto_289769 ) ) ( not ( = ?auto_289764 ?auto_289765 ) ) ( not ( = ?auto_289764 ?auto_289766 ) ) ( not ( = ?auto_289764 ?auto_289767 ) ) ( not ( = ?auto_289764 ?auto_289768 ) ) ( not ( = ?auto_289764 ?auto_289769 ) ) ( not ( = ?auto_289765 ?auto_289766 ) ) ( not ( = ?auto_289765 ?auto_289767 ) ) ( not ( = ?auto_289765 ?auto_289768 ) ) ( not ( = ?auto_289765 ?auto_289769 ) ) ( not ( = ?auto_289766 ?auto_289767 ) ) ( not ( = ?auto_289766 ?auto_289768 ) ) ( not ( = ?auto_289766 ?auto_289769 ) ) ( not ( = ?auto_289767 ?auto_289768 ) ) ( not ( = ?auto_289767 ?auto_289769 ) ) ( not ( = ?auto_289768 ?auto_289769 ) ) ( ON ?auto_289767 ?auto_289768 ) ( ON ?auto_289766 ?auto_289767 ) ( ON ?auto_289765 ?auto_289766 ) ( ON ?auto_289764 ?auto_289765 ) ( ON ?auto_289763 ?auto_289764 ) ( ON ?auto_289762 ?auto_289763 ) ( CLEAR ?auto_289760 ) ( ON ?auto_289761 ?auto_289762 ) ( CLEAR ?auto_289761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_289758 ?auto_289759 ?auto_289760 ?auto_289761 )
      ( MAKE-11PILE ?auto_289758 ?auto_289759 ?auto_289760 ?auto_289761 ?auto_289762 ?auto_289763 ?auto_289764 ?auto_289765 ?auto_289766 ?auto_289767 ?auto_289768 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289804 - BLOCK
      ?auto_289805 - BLOCK
      ?auto_289806 - BLOCK
      ?auto_289807 - BLOCK
      ?auto_289808 - BLOCK
      ?auto_289809 - BLOCK
      ?auto_289810 - BLOCK
      ?auto_289811 - BLOCK
      ?auto_289812 - BLOCK
      ?auto_289813 - BLOCK
      ?auto_289814 - BLOCK
    )
    :vars
    (
      ?auto_289815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289814 ?auto_289815 ) ( ON-TABLE ?auto_289804 ) ( ON ?auto_289805 ?auto_289804 ) ( not ( = ?auto_289804 ?auto_289805 ) ) ( not ( = ?auto_289804 ?auto_289806 ) ) ( not ( = ?auto_289804 ?auto_289807 ) ) ( not ( = ?auto_289804 ?auto_289808 ) ) ( not ( = ?auto_289804 ?auto_289809 ) ) ( not ( = ?auto_289804 ?auto_289810 ) ) ( not ( = ?auto_289804 ?auto_289811 ) ) ( not ( = ?auto_289804 ?auto_289812 ) ) ( not ( = ?auto_289804 ?auto_289813 ) ) ( not ( = ?auto_289804 ?auto_289814 ) ) ( not ( = ?auto_289804 ?auto_289815 ) ) ( not ( = ?auto_289805 ?auto_289806 ) ) ( not ( = ?auto_289805 ?auto_289807 ) ) ( not ( = ?auto_289805 ?auto_289808 ) ) ( not ( = ?auto_289805 ?auto_289809 ) ) ( not ( = ?auto_289805 ?auto_289810 ) ) ( not ( = ?auto_289805 ?auto_289811 ) ) ( not ( = ?auto_289805 ?auto_289812 ) ) ( not ( = ?auto_289805 ?auto_289813 ) ) ( not ( = ?auto_289805 ?auto_289814 ) ) ( not ( = ?auto_289805 ?auto_289815 ) ) ( not ( = ?auto_289806 ?auto_289807 ) ) ( not ( = ?auto_289806 ?auto_289808 ) ) ( not ( = ?auto_289806 ?auto_289809 ) ) ( not ( = ?auto_289806 ?auto_289810 ) ) ( not ( = ?auto_289806 ?auto_289811 ) ) ( not ( = ?auto_289806 ?auto_289812 ) ) ( not ( = ?auto_289806 ?auto_289813 ) ) ( not ( = ?auto_289806 ?auto_289814 ) ) ( not ( = ?auto_289806 ?auto_289815 ) ) ( not ( = ?auto_289807 ?auto_289808 ) ) ( not ( = ?auto_289807 ?auto_289809 ) ) ( not ( = ?auto_289807 ?auto_289810 ) ) ( not ( = ?auto_289807 ?auto_289811 ) ) ( not ( = ?auto_289807 ?auto_289812 ) ) ( not ( = ?auto_289807 ?auto_289813 ) ) ( not ( = ?auto_289807 ?auto_289814 ) ) ( not ( = ?auto_289807 ?auto_289815 ) ) ( not ( = ?auto_289808 ?auto_289809 ) ) ( not ( = ?auto_289808 ?auto_289810 ) ) ( not ( = ?auto_289808 ?auto_289811 ) ) ( not ( = ?auto_289808 ?auto_289812 ) ) ( not ( = ?auto_289808 ?auto_289813 ) ) ( not ( = ?auto_289808 ?auto_289814 ) ) ( not ( = ?auto_289808 ?auto_289815 ) ) ( not ( = ?auto_289809 ?auto_289810 ) ) ( not ( = ?auto_289809 ?auto_289811 ) ) ( not ( = ?auto_289809 ?auto_289812 ) ) ( not ( = ?auto_289809 ?auto_289813 ) ) ( not ( = ?auto_289809 ?auto_289814 ) ) ( not ( = ?auto_289809 ?auto_289815 ) ) ( not ( = ?auto_289810 ?auto_289811 ) ) ( not ( = ?auto_289810 ?auto_289812 ) ) ( not ( = ?auto_289810 ?auto_289813 ) ) ( not ( = ?auto_289810 ?auto_289814 ) ) ( not ( = ?auto_289810 ?auto_289815 ) ) ( not ( = ?auto_289811 ?auto_289812 ) ) ( not ( = ?auto_289811 ?auto_289813 ) ) ( not ( = ?auto_289811 ?auto_289814 ) ) ( not ( = ?auto_289811 ?auto_289815 ) ) ( not ( = ?auto_289812 ?auto_289813 ) ) ( not ( = ?auto_289812 ?auto_289814 ) ) ( not ( = ?auto_289812 ?auto_289815 ) ) ( not ( = ?auto_289813 ?auto_289814 ) ) ( not ( = ?auto_289813 ?auto_289815 ) ) ( not ( = ?auto_289814 ?auto_289815 ) ) ( ON ?auto_289813 ?auto_289814 ) ( ON ?auto_289812 ?auto_289813 ) ( ON ?auto_289811 ?auto_289812 ) ( ON ?auto_289810 ?auto_289811 ) ( ON ?auto_289809 ?auto_289810 ) ( ON ?auto_289808 ?auto_289809 ) ( ON ?auto_289807 ?auto_289808 ) ( CLEAR ?auto_289805 ) ( ON ?auto_289806 ?auto_289807 ) ( CLEAR ?auto_289806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_289804 ?auto_289805 ?auto_289806 )
      ( MAKE-11PILE ?auto_289804 ?auto_289805 ?auto_289806 ?auto_289807 ?auto_289808 ?auto_289809 ?auto_289810 ?auto_289811 ?auto_289812 ?auto_289813 ?auto_289814 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289850 - BLOCK
      ?auto_289851 - BLOCK
      ?auto_289852 - BLOCK
      ?auto_289853 - BLOCK
      ?auto_289854 - BLOCK
      ?auto_289855 - BLOCK
      ?auto_289856 - BLOCK
      ?auto_289857 - BLOCK
      ?auto_289858 - BLOCK
      ?auto_289859 - BLOCK
      ?auto_289860 - BLOCK
    )
    :vars
    (
      ?auto_289861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289860 ?auto_289861 ) ( ON-TABLE ?auto_289850 ) ( not ( = ?auto_289850 ?auto_289851 ) ) ( not ( = ?auto_289850 ?auto_289852 ) ) ( not ( = ?auto_289850 ?auto_289853 ) ) ( not ( = ?auto_289850 ?auto_289854 ) ) ( not ( = ?auto_289850 ?auto_289855 ) ) ( not ( = ?auto_289850 ?auto_289856 ) ) ( not ( = ?auto_289850 ?auto_289857 ) ) ( not ( = ?auto_289850 ?auto_289858 ) ) ( not ( = ?auto_289850 ?auto_289859 ) ) ( not ( = ?auto_289850 ?auto_289860 ) ) ( not ( = ?auto_289850 ?auto_289861 ) ) ( not ( = ?auto_289851 ?auto_289852 ) ) ( not ( = ?auto_289851 ?auto_289853 ) ) ( not ( = ?auto_289851 ?auto_289854 ) ) ( not ( = ?auto_289851 ?auto_289855 ) ) ( not ( = ?auto_289851 ?auto_289856 ) ) ( not ( = ?auto_289851 ?auto_289857 ) ) ( not ( = ?auto_289851 ?auto_289858 ) ) ( not ( = ?auto_289851 ?auto_289859 ) ) ( not ( = ?auto_289851 ?auto_289860 ) ) ( not ( = ?auto_289851 ?auto_289861 ) ) ( not ( = ?auto_289852 ?auto_289853 ) ) ( not ( = ?auto_289852 ?auto_289854 ) ) ( not ( = ?auto_289852 ?auto_289855 ) ) ( not ( = ?auto_289852 ?auto_289856 ) ) ( not ( = ?auto_289852 ?auto_289857 ) ) ( not ( = ?auto_289852 ?auto_289858 ) ) ( not ( = ?auto_289852 ?auto_289859 ) ) ( not ( = ?auto_289852 ?auto_289860 ) ) ( not ( = ?auto_289852 ?auto_289861 ) ) ( not ( = ?auto_289853 ?auto_289854 ) ) ( not ( = ?auto_289853 ?auto_289855 ) ) ( not ( = ?auto_289853 ?auto_289856 ) ) ( not ( = ?auto_289853 ?auto_289857 ) ) ( not ( = ?auto_289853 ?auto_289858 ) ) ( not ( = ?auto_289853 ?auto_289859 ) ) ( not ( = ?auto_289853 ?auto_289860 ) ) ( not ( = ?auto_289853 ?auto_289861 ) ) ( not ( = ?auto_289854 ?auto_289855 ) ) ( not ( = ?auto_289854 ?auto_289856 ) ) ( not ( = ?auto_289854 ?auto_289857 ) ) ( not ( = ?auto_289854 ?auto_289858 ) ) ( not ( = ?auto_289854 ?auto_289859 ) ) ( not ( = ?auto_289854 ?auto_289860 ) ) ( not ( = ?auto_289854 ?auto_289861 ) ) ( not ( = ?auto_289855 ?auto_289856 ) ) ( not ( = ?auto_289855 ?auto_289857 ) ) ( not ( = ?auto_289855 ?auto_289858 ) ) ( not ( = ?auto_289855 ?auto_289859 ) ) ( not ( = ?auto_289855 ?auto_289860 ) ) ( not ( = ?auto_289855 ?auto_289861 ) ) ( not ( = ?auto_289856 ?auto_289857 ) ) ( not ( = ?auto_289856 ?auto_289858 ) ) ( not ( = ?auto_289856 ?auto_289859 ) ) ( not ( = ?auto_289856 ?auto_289860 ) ) ( not ( = ?auto_289856 ?auto_289861 ) ) ( not ( = ?auto_289857 ?auto_289858 ) ) ( not ( = ?auto_289857 ?auto_289859 ) ) ( not ( = ?auto_289857 ?auto_289860 ) ) ( not ( = ?auto_289857 ?auto_289861 ) ) ( not ( = ?auto_289858 ?auto_289859 ) ) ( not ( = ?auto_289858 ?auto_289860 ) ) ( not ( = ?auto_289858 ?auto_289861 ) ) ( not ( = ?auto_289859 ?auto_289860 ) ) ( not ( = ?auto_289859 ?auto_289861 ) ) ( not ( = ?auto_289860 ?auto_289861 ) ) ( ON ?auto_289859 ?auto_289860 ) ( ON ?auto_289858 ?auto_289859 ) ( ON ?auto_289857 ?auto_289858 ) ( ON ?auto_289856 ?auto_289857 ) ( ON ?auto_289855 ?auto_289856 ) ( ON ?auto_289854 ?auto_289855 ) ( ON ?auto_289853 ?auto_289854 ) ( ON ?auto_289852 ?auto_289853 ) ( CLEAR ?auto_289850 ) ( ON ?auto_289851 ?auto_289852 ) ( CLEAR ?auto_289851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_289850 ?auto_289851 )
      ( MAKE-11PILE ?auto_289850 ?auto_289851 ?auto_289852 ?auto_289853 ?auto_289854 ?auto_289855 ?auto_289856 ?auto_289857 ?auto_289858 ?auto_289859 ?auto_289860 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_289896 - BLOCK
      ?auto_289897 - BLOCK
      ?auto_289898 - BLOCK
      ?auto_289899 - BLOCK
      ?auto_289900 - BLOCK
      ?auto_289901 - BLOCK
      ?auto_289902 - BLOCK
      ?auto_289903 - BLOCK
      ?auto_289904 - BLOCK
      ?auto_289905 - BLOCK
      ?auto_289906 - BLOCK
    )
    :vars
    (
      ?auto_289907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_289906 ?auto_289907 ) ( not ( = ?auto_289896 ?auto_289897 ) ) ( not ( = ?auto_289896 ?auto_289898 ) ) ( not ( = ?auto_289896 ?auto_289899 ) ) ( not ( = ?auto_289896 ?auto_289900 ) ) ( not ( = ?auto_289896 ?auto_289901 ) ) ( not ( = ?auto_289896 ?auto_289902 ) ) ( not ( = ?auto_289896 ?auto_289903 ) ) ( not ( = ?auto_289896 ?auto_289904 ) ) ( not ( = ?auto_289896 ?auto_289905 ) ) ( not ( = ?auto_289896 ?auto_289906 ) ) ( not ( = ?auto_289896 ?auto_289907 ) ) ( not ( = ?auto_289897 ?auto_289898 ) ) ( not ( = ?auto_289897 ?auto_289899 ) ) ( not ( = ?auto_289897 ?auto_289900 ) ) ( not ( = ?auto_289897 ?auto_289901 ) ) ( not ( = ?auto_289897 ?auto_289902 ) ) ( not ( = ?auto_289897 ?auto_289903 ) ) ( not ( = ?auto_289897 ?auto_289904 ) ) ( not ( = ?auto_289897 ?auto_289905 ) ) ( not ( = ?auto_289897 ?auto_289906 ) ) ( not ( = ?auto_289897 ?auto_289907 ) ) ( not ( = ?auto_289898 ?auto_289899 ) ) ( not ( = ?auto_289898 ?auto_289900 ) ) ( not ( = ?auto_289898 ?auto_289901 ) ) ( not ( = ?auto_289898 ?auto_289902 ) ) ( not ( = ?auto_289898 ?auto_289903 ) ) ( not ( = ?auto_289898 ?auto_289904 ) ) ( not ( = ?auto_289898 ?auto_289905 ) ) ( not ( = ?auto_289898 ?auto_289906 ) ) ( not ( = ?auto_289898 ?auto_289907 ) ) ( not ( = ?auto_289899 ?auto_289900 ) ) ( not ( = ?auto_289899 ?auto_289901 ) ) ( not ( = ?auto_289899 ?auto_289902 ) ) ( not ( = ?auto_289899 ?auto_289903 ) ) ( not ( = ?auto_289899 ?auto_289904 ) ) ( not ( = ?auto_289899 ?auto_289905 ) ) ( not ( = ?auto_289899 ?auto_289906 ) ) ( not ( = ?auto_289899 ?auto_289907 ) ) ( not ( = ?auto_289900 ?auto_289901 ) ) ( not ( = ?auto_289900 ?auto_289902 ) ) ( not ( = ?auto_289900 ?auto_289903 ) ) ( not ( = ?auto_289900 ?auto_289904 ) ) ( not ( = ?auto_289900 ?auto_289905 ) ) ( not ( = ?auto_289900 ?auto_289906 ) ) ( not ( = ?auto_289900 ?auto_289907 ) ) ( not ( = ?auto_289901 ?auto_289902 ) ) ( not ( = ?auto_289901 ?auto_289903 ) ) ( not ( = ?auto_289901 ?auto_289904 ) ) ( not ( = ?auto_289901 ?auto_289905 ) ) ( not ( = ?auto_289901 ?auto_289906 ) ) ( not ( = ?auto_289901 ?auto_289907 ) ) ( not ( = ?auto_289902 ?auto_289903 ) ) ( not ( = ?auto_289902 ?auto_289904 ) ) ( not ( = ?auto_289902 ?auto_289905 ) ) ( not ( = ?auto_289902 ?auto_289906 ) ) ( not ( = ?auto_289902 ?auto_289907 ) ) ( not ( = ?auto_289903 ?auto_289904 ) ) ( not ( = ?auto_289903 ?auto_289905 ) ) ( not ( = ?auto_289903 ?auto_289906 ) ) ( not ( = ?auto_289903 ?auto_289907 ) ) ( not ( = ?auto_289904 ?auto_289905 ) ) ( not ( = ?auto_289904 ?auto_289906 ) ) ( not ( = ?auto_289904 ?auto_289907 ) ) ( not ( = ?auto_289905 ?auto_289906 ) ) ( not ( = ?auto_289905 ?auto_289907 ) ) ( not ( = ?auto_289906 ?auto_289907 ) ) ( ON ?auto_289905 ?auto_289906 ) ( ON ?auto_289904 ?auto_289905 ) ( ON ?auto_289903 ?auto_289904 ) ( ON ?auto_289902 ?auto_289903 ) ( ON ?auto_289901 ?auto_289902 ) ( ON ?auto_289900 ?auto_289901 ) ( ON ?auto_289899 ?auto_289900 ) ( ON ?auto_289898 ?auto_289899 ) ( ON ?auto_289897 ?auto_289898 ) ( ON ?auto_289896 ?auto_289897 ) ( CLEAR ?auto_289896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_289896 )
      ( MAKE-11PILE ?auto_289896 ?auto_289897 ?auto_289898 ?auto_289899 ?auto_289900 ?auto_289901 ?auto_289902 ?auto_289903 ?auto_289904 ?auto_289905 ?auto_289906 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_289943 - BLOCK
      ?auto_289944 - BLOCK
      ?auto_289945 - BLOCK
      ?auto_289946 - BLOCK
      ?auto_289947 - BLOCK
      ?auto_289948 - BLOCK
      ?auto_289949 - BLOCK
      ?auto_289950 - BLOCK
      ?auto_289951 - BLOCK
      ?auto_289952 - BLOCK
      ?auto_289953 - BLOCK
      ?auto_289954 - BLOCK
    )
    :vars
    (
      ?auto_289955 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_289953 ) ( ON ?auto_289954 ?auto_289955 ) ( CLEAR ?auto_289954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_289943 ) ( ON ?auto_289944 ?auto_289943 ) ( ON ?auto_289945 ?auto_289944 ) ( ON ?auto_289946 ?auto_289945 ) ( ON ?auto_289947 ?auto_289946 ) ( ON ?auto_289948 ?auto_289947 ) ( ON ?auto_289949 ?auto_289948 ) ( ON ?auto_289950 ?auto_289949 ) ( ON ?auto_289951 ?auto_289950 ) ( ON ?auto_289952 ?auto_289951 ) ( ON ?auto_289953 ?auto_289952 ) ( not ( = ?auto_289943 ?auto_289944 ) ) ( not ( = ?auto_289943 ?auto_289945 ) ) ( not ( = ?auto_289943 ?auto_289946 ) ) ( not ( = ?auto_289943 ?auto_289947 ) ) ( not ( = ?auto_289943 ?auto_289948 ) ) ( not ( = ?auto_289943 ?auto_289949 ) ) ( not ( = ?auto_289943 ?auto_289950 ) ) ( not ( = ?auto_289943 ?auto_289951 ) ) ( not ( = ?auto_289943 ?auto_289952 ) ) ( not ( = ?auto_289943 ?auto_289953 ) ) ( not ( = ?auto_289943 ?auto_289954 ) ) ( not ( = ?auto_289943 ?auto_289955 ) ) ( not ( = ?auto_289944 ?auto_289945 ) ) ( not ( = ?auto_289944 ?auto_289946 ) ) ( not ( = ?auto_289944 ?auto_289947 ) ) ( not ( = ?auto_289944 ?auto_289948 ) ) ( not ( = ?auto_289944 ?auto_289949 ) ) ( not ( = ?auto_289944 ?auto_289950 ) ) ( not ( = ?auto_289944 ?auto_289951 ) ) ( not ( = ?auto_289944 ?auto_289952 ) ) ( not ( = ?auto_289944 ?auto_289953 ) ) ( not ( = ?auto_289944 ?auto_289954 ) ) ( not ( = ?auto_289944 ?auto_289955 ) ) ( not ( = ?auto_289945 ?auto_289946 ) ) ( not ( = ?auto_289945 ?auto_289947 ) ) ( not ( = ?auto_289945 ?auto_289948 ) ) ( not ( = ?auto_289945 ?auto_289949 ) ) ( not ( = ?auto_289945 ?auto_289950 ) ) ( not ( = ?auto_289945 ?auto_289951 ) ) ( not ( = ?auto_289945 ?auto_289952 ) ) ( not ( = ?auto_289945 ?auto_289953 ) ) ( not ( = ?auto_289945 ?auto_289954 ) ) ( not ( = ?auto_289945 ?auto_289955 ) ) ( not ( = ?auto_289946 ?auto_289947 ) ) ( not ( = ?auto_289946 ?auto_289948 ) ) ( not ( = ?auto_289946 ?auto_289949 ) ) ( not ( = ?auto_289946 ?auto_289950 ) ) ( not ( = ?auto_289946 ?auto_289951 ) ) ( not ( = ?auto_289946 ?auto_289952 ) ) ( not ( = ?auto_289946 ?auto_289953 ) ) ( not ( = ?auto_289946 ?auto_289954 ) ) ( not ( = ?auto_289946 ?auto_289955 ) ) ( not ( = ?auto_289947 ?auto_289948 ) ) ( not ( = ?auto_289947 ?auto_289949 ) ) ( not ( = ?auto_289947 ?auto_289950 ) ) ( not ( = ?auto_289947 ?auto_289951 ) ) ( not ( = ?auto_289947 ?auto_289952 ) ) ( not ( = ?auto_289947 ?auto_289953 ) ) ( not ( = ?auto_289947 ?auto_289954 ) ) ( not ( = ?auto_289947 ?auto_289955 ) ) ( not ( = ?auto_289948 ?auto_289949 ) ) ( not ( = ?auto_289948 ?auto_289950 ) ) ( not ( = ?auto_289948 ?auto_289951 ) ) ( not ( = ?auto_289948 ?auto_289952 ) ) ( not ( = ?auto_289948 ?auto_289953 ) ) ( not ( = ?auto_289948 ?auto_289954 ) ) ( not ( = ?auto_289948 ?auto_289955 ) ) ( not ( = ?auto_289949 ?auto_289950 ) ) ( not ( = ?auto_289949 ?auto_289951 ) ) ( not ( = ?auto_289949 ?auto_289952 ) ) ( not ( = ?auto_289949 ?auto_289953 ) ) ( not ( = ?auto_289949 ?auto_289954 ) ) ( not ( = ?auto_289949 ?auto_289955 ) ) ( not ( = ?auto_289950 ?auto_289951 ) ) ( not ( = ?auto_289950 ?auto_289952 ) ) ( not ( = ?auto_289950 ?auto_289953 ) ) ( not ( = ?auto_289950 ?auto_289954 ) ) ( not ( = ?auto_289950 ?auto_289955 ) ) ( not ( = ?auto_289951 ?auto_289952 ) ) ( not ( = ?auto_289951 ?auto_289953 ) ) ( not ( = ?auto_289951 ?auto_289954 ) ) ( not ( = ?auto_289951 ?auto_289955 ) ) ( not ( = ?auto_289952 ?auto_289953 ) ) ( not ( = ?auto_289952 ?auto_289954 ) ) ( not ( = ?auto_289952 ?auto_289955 ) ) ( not ( = ?auto_289953 ?auto_289954 ) ) ( not ( = ?auto_289953 ?auto_289955 ) ) ( not ( = ?auto_289954 ?auto_289955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_289954 ?auto_289955 )
      ( !STACK ?auto_289954 ?auto_289953 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_289993 - BLOCK
      ?auto_289994 - BLOCK
      ?auto_289995 - BLOCK
      ?auto_289996 - BLOCK
      ?auto_289997 - BLOCK
      ?auto_289998 - BLOCK
      ?auto_289999 - BLOCK
      ?auto_290000 - BLOCK
      ?auto_290001 - BLOCK
      ?auto_290002 - BLOCK
      ?auto_290003 - BLOCK
      ?auto_290004 - BLOCK
    )
    :vars
    (
      ?auto_290005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290004 ?auto_290005 ) ( ON-TABLE ?auto_289993 ) ( ON ?auto_289994 ?auto_289993 ) ( ON ?auto_289995 ?auto_289994 ) ( ON ?auto_289996 ?auto_289995 ) ( ON ?auto_289997 ?auto_289996 ) ( ON ?auto_289998 ?auto_289997 ) ( ON ?auto_289999 ?auto_289998 ) ( ON ?auto_290000 ?auto_289999 ) ( ON ?auto_290001 ?auto_290000 ) ( ON ?auto_290002 ?auto_290001 ) ( not ( = ?auto_289993 ?auto_289994 ) ) ( not ( = ?auto_289993 ?auto_289995 ) ) ( not ( = ?auto_289993 ?auto_289996 ) ) ( not ( = ?auto_289993 ?auto_289997 ) ) ( not ( = ?auto_289993 ?auto_289998 ) ) ( not ( = ?auto_289993 ?auto_289999 ) ) ( not ( = ?auto_289993 ?auto_290000 ) ) ( not ( = ?auto_289993 ?auto_290001 ) ) ( not ( = ?auto_289993 ?auto_290002 ) ) ( not ( = ?auto_289993 ?auto_290003 ) ) ( not ( = ?auto_289993 ?auto_290004 ) ) ( not ( = ?auto_289993 ?auto_290005 ) ) ( not ( = ?auto_289994 ?auto_289995 ) ) ( not ( = ?auto_289994 ?auto_289996 ) ) ( not ( = ?auto_289994 ?auto_289997 ) ) ( not ( = ?auto_289994 ?auto_289998 ) ) ( not ( = ?auto_289994 ?auto_289999 ) ) ( not ( = ?auto_289994 ?auto_290000 ) ) ( not ( = ?auto_289994 ?auto_290001 ) ) ( not ( = ?auto_289994 ?auto_290002 ) ) ( not ( = ?auto_289994 ?auto_290003 ) ) ( not ( = ?auto_289994 ?auto_290004 ) ) ( not ( = ?auto_289994 ?auto_290005 ) ) ( not ( = ?auto_289995 ?auto_289996 ) ) ( not ( = ?auto_289995 ?auto_289997 ) ) ( not ( = ?auto_289995 ?auto_289998 ) ) ( not ( = ?auto_289995 ?auto_289999 ) ) ( not ( = ?auto_289995 ?auto_290000 ) ) ( not ( = ?auto_289995 ?auto_290001 ) ) ( not ( = ?auto_289995 ?auto_290002 ) ) ( not ( = ?auto_289995 ?auto_290003 ) ) ( not ( = ?auto_289995 ?auto_290004 ) ) ( not ( = ?auto_289995 ?auto_290005 ) ) ( not ( = ?auto_289996 ?auto_289997 ) ) ( not ( = ?auto_289996 ?auto_289998 ) ) ( not ( = ?auto_289996 ?auto_289999 ) ) ( not ( = ?auto_289996 ?auto_290000 ) ) ( not ( = ?auto_289996 ?auto_290001 ) ) ( not ( = ?auto_289996 ?auto_290002 ) ) ( not ( = ?auto_289996 ?auto_290003 ) ) ( not ( = ?auto_289996 ?auto_290004 ) ) ( not ( = ?auto_289996 ?auto_290005 ) ) ( not ( = ?auto_289997 ?auto_289998 ) ) ( not ( = ?auto_289997 ?auto_289999 ) ) ( not ( = ?auto_289997 ?auto_290000 ) ) ( not ( = ?auto_289997 ?auto_290001 ) ) ( not ( = ?auto_289997 ?auto_290002 ) ) ( not ( = ?auto_289997 ?auto_290003 ) ) ( not ( = ?auto_289997 ?auto_290004 ) ) ( not ( = ?auto_289997 ?auto_290005 ) ) ( not ( = ?auto_289998 ?auto_289999 ) ) ( not ( = ?auto_289998 ?auto_290000 ) ) ( not ( = ?auto_289998 ?auto_290001 ) ) ( not ( = ?auto_289998 ?auto_290002 ) ) ( not ( = ?auto_289998 ?auto_290003 ) ) ( not ( = ?auto_289998 ?auto_290004 ) ) ( not ( = ?auto_289998 ?auto_290005 ) ) ( not ( = ?auto_289999 ?auto_290000 ) ) ( not ( = ?auto_289999 ?auto_290001 ) ) ( not ( = ?auto_289999 ?auto_290002 ) ) ( not ( = ?auto_289999 ?auto_290003 ) ) ( not ( = ?auto_289999 ?auto_290004 ) ) ( not ( = ?auto_289999 ?auto_290005 ) ) ( not ( = ?auto_290000 ?auto_290001 ) ) ( not ( = ?auto_290000 ?auto_290002 ) ) ( not ( = ?auto_290000 ?auto_290003 ) ) ( not ( = ?auto_290000 ?auto_290004 ) ) ( not ( = ?auto_290000 ?auto_290005 ) ) ( not ( = ?auto_290001 ?auto_290002 ) ) ( not ( = ?auto_290001 ?auto_290003 ) ) ( not ( = ?auto_290001 ?auto_290004 ) ) ( not ( = ?auto_290001 ?auto_290005 ) ) ( not ( = ?auto_290002 ?auto_290003 ) ) ( not ( = ?auto_290002 ?auto_290004 ) ) ( not ( = ?auto_290002 ?auto_290005 ) ) ( not ( = ?auto_290003 ?auto_290004 ) ) ( not ( = ?auto_290003 ?auto_290005 ) ) ( not ( = ?auto_290004 ?auto_290005 ) ) ( CLEAR ?auto_290002 ) ( ON ?auto_290003 ?auto_290004 ) ( CLEAR ?auto_290003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_289993 ?auto_289994 ?auto_289995 ?auto_289996 ?auto_289997 ?auto_289998 ?auto_289999 ?auto_290000 ?auto_290001 ?auto_290002 ?auto_290003 )
      ( MAKE-12PILE ?auto_289993 ?auto_289994 ?auto_289995 ?auto_289996 ?auto_289997 ?auto_289998 ?auto_289999 ?auto_290000 ?auto_290001 ?auto_290002 ?auto_290003 ?auto_290004 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290043 - BLOCK
      ?auto_290044 - BLOCK
      ?auto_290045 - BLOCK
      ?auto_290046 - BLOCK
      ?auto_290047 - BLOCK
      ?auto_290048 - BLOCK
      ?auto_290049 - BLOCK
      ?auto_290050 - BLOCK
      ?auto_290051 - BLOCK
      ?auto_290052 - BLOCK
      ?auto_290053 - BLOCK
      ?auto_290054 - BLOCK
    )
    :vars
    (
      ?auto_290055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290054 ?auto_290055 ) ( ON-TABLE ?auto_290043 ) ( ON ?auto_290044 ?auto_290043 ) ( ON ?auto_290045 ?auto_290044 ) ( ON ?auto_290046 ?auto_290045 ) ( ON ?auto_290047 ?auto_290046 ) ( ON ?auto_290048 ?auto_290047 ) ( ON ?auto_290049 ?auto_290048 ) ( ON ?auto_290050 ?auto_290049 ) ( ON ?auto_290051 ?auto_290050 ) ( not ( = ?auto_290043 ?auto_290044 ) ) ( not ( = ?auto_290043 ?auto_290045 ) ) ( not ( = ?auto_290043 ?auto_290046 ) ) ( not ( = ?auto_290043 ?auto_290047 ) ) ( not ( = ?auto_290043 ?auto_290048 ) ) ( not ( = ?auto_290043 ?auto_290049 ) ) ( not ( = ?auto_290043 ?auto_290050 ) ) ( not ( = ?auto_290043 ?auto_290051 ) ) ( not ( = ?auto_290043 ?auto_290052 ) ) ( not ( = ?auto_290043 ?auto_290053 ) ) ( not ( = ?auto_290043 ?auto_290054 ) ) ( not ( = ?auto_290043 ?auto_290055 ) ) ( not ( = ?auto_290044 ?auto_290045 ) ) ( not ( = ?auto_290044 ?auto_290046 ) ) ( not ( = ?auto_290044 ?auto_290047 ) ) ( not ( = ?auto_290044 ?auto_290048 ) ) ( not ( = ?auto_290044 ?auto_290049 ) ) ( not ( = ?auto_290044 ?auto_290050 ) ) ( not ( = ?auto_290044 ?auto_290051 ) ) ( not ( = ?auto_290044 ?auto_290052 ) ) ( not ( = ?auto_290044 ?auto_290053 ) ) ( not ( = ?auto_290044 ?auto_290054 ) ) ( not ( = ?auto_290044 ?auto_290055 ) ) ( not ( = ?auto_290045 ?auto_290046 ) ) ( not ( = ?auto_290045 ?auto_290047 ) ) ( not ( = ?auto_290045 ?auto_290048 ) ) ( not ( = ?auto_290045 ?auto_290049 ) ) ( not ( = ?auto_290045 ?auto_290050 ) ) ( not ( = ?auto_290045 ?auto_290051 ) ) ( not ( = ?auto_290045 ?auto_290052 ) ) ( not ( = ?auto_290045 ?auto_290053 ) ) ( not ( = ?auto_290045 ?auto_290054 ) ) ( not ( = ?auto_290045 ?auto_290055 ) ) ( not ( = ?auto_290046 ?auto_290047 ) ) ( not ( = ?auto_290046 ?auto_290048 ) ) ( not ( = ?auto_290046 ?auto_290049 ) ) ( not ( = ?auto_290046 ?auto_290050 ) ) ( not ( = ?auto_290046 ?auto_290051 ) ) ( not ( = ?auto_290046 ?auto_290052 ) ) ( not ( = ?auto_290046 ?auto_290053 ) ) ( not ( = ?auto_290046 ?auto_290054 ) ) ( not ( = ?auto_290046 ?auto_290055 ) ) ( not ( = ?auto_290047 ?auto_290048 ) ) ( not ( = ?auto_290047 ?auto_290049 ) ) ( not ( = ?auto_290047 ?auto_290050 ) ) ( not ( = ?auto_290047 ?auto_290051 ) ) ( not ( = ?auto_290047 ?auto_290052 ) ) ( not ( = ?auto_290047 ?auto_290053 ) ) ( not ( = ?auto_290047 ?auto_290054 ) ) ( not ( = ?auto_290047 ?auto_290055 ) ) ( not ( = ?auto_290048 ?auto_290049 ) ) ( not ( = ?auto_290048 ?auto_290050 ) ) ( not ( = ?auto_290048 ?auto_290051 ) ) ( not ( = ?auto_290048 ?auto_290052 ) ) ( not ( = ?auto_290048 ?auto_290053 ) ) ( not ( = ?auto_290048 ?auto_290054 ) ) ( not ( = ?auto_290048 ?auto_290055 ) ) ( not ( = ?auto_290049 ?auto_290050 ) ) ( not ( = ?auto_290049 ?auto_290051 ) ) ( not ( = ?auto_290049 ?auto_290052 ) ) ( not ( = ?auto_290049 ?auto_290053 ) ) ( not ( = ?auto_290049 ?auto_290054 ) ) ( not ( = ?auto_290049 ?auto_290055 ) ) ( not ( = ?auto_290050 ?auto_290051 ) ) ( not ( = ?auto_290050 ?auto_290052 ) ) ( not ( = ?auto_290050 ?auto_290053 ) ) ( not ( = ?auto_290050 ?auto_290054 ) ) ( not ( = ?auto_290050 ?auto_290055 ) ) ( not ( = ?auto_290051 ?auto_290052 ) ) ( not ( = ?auto_290051 ?auto_290053 ) ) ( not ( = ?auto_290051 ?auto_290054 ) ) ( not ( = ?auto_290051 ?auto_290055 ) ) ( not ( = ?auto_290052 ?auto_290053 ) ) ( not ( = ?auto_290052 ?auto_290054 ) ) ( not ( = ?auto_290052 ?auto_290055 ) ) ( not ( = ?auto_290053 ?auto_290054 ) ) ( not ( = ?auto_290053 ?auto_290055 ) ) ( not ( = ?auto_290054 ?auto_290055 ) ) ( ON ?auto_290053 ?auto_290054 ) ( CLEAR ?auto_290051 ) ( ON ?auto_290052 ?auto_290053 ) ( CLEAR ?auto_290052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_290043 ?auto_290044 ?auto_290045 ?auto_290046 ?auto_290047 ?auto_290048 ?auto_290049 ?auto_290050 ?auto_290051 ?auto_290052 )
      ( MAKE-12PILE ?auto_290043 ?auto_290044 ?auto_290045 ?auto_290046 ?auto_290047 ?auto_290048 ?auto_290049 ?auto_290050 ?auto_290051 ?auto_290052 ?auto_290053 ?auto_290054 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290093 - BLOCK
      ?auto_290094 - BLOCK
      ?auto_290095 - BLOCK
      ?auto_290096 - BLOCK
      ?auto_290097 - BLOCK
      ?auto_290098 - BLOCK
      ?auto_290099 - BLOCK
      ?auto_290100 - BLOCK
      ?auto_290101 - BLOCK
      ?auto_290102 - BLOCK
      ?auto_290103 - BLOCK
      ?auto_290104 - BLOCK
    )
    :vars
    (
      ?auto_290105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290104 ?auto_290105 ) ( ON-TABLE ?auto_290093 ) ( ON ?auto_290094 ?auto_290093 ) ( ON ?auto_290095 ?auto_290094 ) ( ON ?auto_290096 ?auto_290095 ) ( ON ?auto_290097 ?auto_290096 ) ( ON ?auto_290098 ?auto_290097 ) ( ON ?auto_290099 ?auto_290098 ) ( ON ?auto_290100 ?auto_290099 ) ( not ( = ?auto_290093 ?auto_290094 ) ) ( not ( = ?auto_290093 ?auto_290095 ) ) ( not ( = ?auto_290093 ?auto_290096 ) ) ( not ( = ?auto_290093 ?auto_290097 ) ) ( not ( = ?auto_290093 ?auto_290098 ) ) ( not ( = ?auto_290093 ?auto_290099 ) ) ( not ( = ?auto_290093 ?auto_290100 ) ) ( not ( = ?auto_290093 ?auto_290101 ) ) ( not ( = ?auto_290093 ?auto_290102 ) ) ( not ( = ?auto_290093 ?auto_290103 ) ) ( not ( = ?auto_290093 ?auto_290104 ) ) ( not ( = ?auto_290093 ?auto_290105 ) ) ( not ( = ?auto_290094 ?auto_290095 ) ) ( not ( = ?auto_290094 ?auto_290096 ) ) ( not ( = ?auto_290094 ?auto_290097 ) ) ( not ( = ?auto_290094 ?auto_290098 ) ) ( not ( = ?auto_290094 ?auto_290099 ) ) ( not ( = ?auto_290094 ?auto_290100 ) ) ( not ( = ?auto_290094 ?auto_290101 ) ) ( not ( = ?auto_290094 ?auto_290102 ) ) ( not ( = ?auto_290094 ?auto_290103 ) ) ( not ( = ?auto_290094 ?auto_290104 ) ) ( not ( = ?auto_290094 ?auto_290105 ) ) ( not ( = ?auto_290095 ?auto_290096 ) ) ( not ( = ?auto_290095 ?auto_290097 ) ) ( not ( = ?auto_290095 ?auto_290098 ) ) ( not ( = ?auto_290095 ?auto_290099 ) ) ( not ( = ?auto_290095 ?auto_290100 ) ) ( not ( = ?auto_290095 ?auto_290101 ) ) ( not ( = ?auto_290095 ?auto_290102 ) ) ( not ( = ?auto_290095 ?auto_290103 ) ) ( not ( = ?auto_290095 ?auto_290104 ) ) ( not ( = ?auto_290095 ?auto_290105 ) ) ( not ( = ?auto_290096 ?auto_290097 ) ) ( not ( = ?auto_290096 ?auto_290098 ) ) ( not ( = ?auto_290096 ?auto_290099 ) ) ( not ( = ?auto_290096 ?auto_290100 ) ) ( not ( = ?auto_290096 ?auto_290101 ) ) ( not ( = ?auto_290096 ?auto_290102 ) ) ( not ( = ?auto_290096 ?auto_290103 ) ) ( not ( = ?auto_290096 ?auto_290104 ) ) ( not ( = ?auto_290096 ?auto_290105 ) ) ( not ( = ?auto_290097 ?auto_290098 ) ) ( not ( = ?auto_290097 ?auto_290099 ) ) ( not ( = ?auto_290097 ?auto_290100 ) ) ( not ( = ?auto_290097 ?auto_290101 ) ) ( not ( = ?auto_290097 ?auto_290102 ) ) ( not ( = ?auto_290097 ?auto_290103 ) ) ( not ( = ?auto_290097 ?auto_290104 ) ) ( not ( = ?auto_290097 ?auto_290105 ) ) ( not ( = ?auto_290098 ?auto_290099 ) ) ( not ( = ?auto_290098 ?auto_290100 ) ) ( not ( = ?auto_290098 ?auto_290101 ) ) ( not ( = ?auto_290098 ?auto_290102 ) ) ( not ( = ?auto_290098 ?auto_290103 ) ) ( not ( = ?auto_290098 ?auto_290104 ) ) ( not ( = ?auto_290098 ?auto_290105 ) ) ( not ( = ?auto_290099 ?auto_290100 ) ) ( not ( = ?auto_290099 ?auto_290101 ) ) ( not ( = ?auto_290099 ?auto_290102 ) ) ( not ( = ?auto_290099 ?auto_290103 ) ) ( not ( = ?auto_290099 ?auto_290104 ) ) ( not ( = ?auto_290099 ?auto_290105 ) ) ( not ( = ?auto_290100 ?auto_290101 ) ) ( not ( = ?auto_290100 ?auto_290102 ) ) ( not ( = ?auto_290100 ?auto_290103 ) ) ( not ( = ?auto_290100 ?auto_290104 ) ) ( not ( = ?auto_290100 ?auto_290105 ) ) ( not ( = ?auto_290101 ?auto_290102 ) ) ( not ( = ?auto_290101 ?auto_290103 ) ) ( not ( = ?auto_290101 ?auto_290104 ) ) ( not ( = ?auto_290101 ?auto_290105 ) ) ( not ( = ?auto_290102 ?auto_290103 ) ) ( not ( = ?auto_290102 ?auto_290104 ) ) ( not ( = ?auto_290102 ?auto_290105 ) ) ( not ( = ?auto_290103 ?auto_290104 ) ) ( not ( = ?auto_290103 ?auto_290105 ) ) ( not ( = ?auto_290104 ?auto_290105 ) ) ( ON ?auto_290103 ?auto_290104 ) ( ON ?auto_290102 ?auto_290103 ) ( CLEAR ?auto_290100 ) ( ON ?auto_290101 ?auto_290102 ) ( CLEAR ?auto_290101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_290093 ?auto_290094 ?auto_290095 ?auto_290096 ?auto_290097 ?auto_290098 ?auto_290099 ?auto_290100 ?auto_290101 )
      ( MAKE-12PILE ?auto_290093 ?auto_290094 ?auto_290095 ?auto_290096 ?auto_290097 ?auto_290098 ?auto_290099 ?auto_290100 ?auto_290101 ?auto_290102 ?auto_290103 ?auto_290104 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290143 - BLOCK
      ?auto_290144 - BLOCK
      ?auto_290145 - BLOCK
      ?auto_290146 - BLOCK
      ?auto_290147 - BLOCK
      ?auto_290148 - BLOCK
      ?auto_290149 - BLOCK
      ?auto_290150 - BLOCK
      ?auto_290151 - BLOCK
      ?auto_290152 - BLOCK
      ?auto_290153 - BLOCK
      ?auto_290154 - BLOCK
    )
    :vars
    (
      ?auto_290155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290154 ?auto_290155 ) ( ON-TABLE ?auto_290143 ) ( ON ?auto_290144 ?auto_290143 ) ( ON ?auto_290145 ?auto_290144 ) ( ON ?auto_290146 ?auto_290145 ) ( ON ?auto_290147 ?auto_290146 ) ( ON ?auto_290148 ?auto_290147 ) ( ON ?auto_290149 ?auto_290148 ) ( not ( = ?auto_290143 ?auto_290144 ) ) ( not ( = ?auto_290143 ?auto_290145 ) ) ( not ( = ?auto_290143 ?auto_290146 ) ) ( not ( = ?auto_290143 ?auto_290147 ) ) ( not ( = ?auto_290143 ?auto_290148 ) ) ( not ( = ?auto_290143 ?auto_290149 ) ) ( not ( = ?auto_290143 ?auto_290150 ) ) ( not ( = ?auto_290143 ?auto_290151 ) ) ( not ( = ?auto_290143 ?auto_290152 ) ) ( not ( = ?auto_290143 ?auto_290153 ) ) ( not ( = ?auto_290143 ?auto_290154 ) ) ( not ( = ?auto_290143 ?auto_290155 ) ) ( not ( = ?auto_290144 ?auto_290145 ) ) ( not ( = ?auto_290144 ?auto_290146 ) ) ( not ( = ?auto_290144 ?auto_290147 ) ) ( not ( = ?auto_290144 ?auto_290148 ) ) ( not ( = ?auto_290144 ?auto_290149 ) ) ( not ( = ?auto_290144 ?auto_290150 ) ) ( not ( = ?auto_290144 ?auto_290151 ) ) ( not ( = ?auto_290144 ?auto_290152 ) ) ( not ( = ?auto_290144 ?auto_290153 ) ) ( not ( = ?auto_290144 ?auto_290154 ) ) ( not ( = ?auto_290144 ?auto_290155 ) ) ( not ( = ?auto_290145 ?auto_290146 ) ) ( not ( = ?auto_290145 ?auto_290147 ) ) ( not ( = ?auto_290145 ?auto_290148 ) ) ( not ( = ?auto_290145 ?auto_290149 ) ) ( not ( = ?auto_290145 ?auto_290150 ) ) ( not ( = ?auto_290145 ?auto_290151 ) ) ( not ( = ?auto_290145 ?auto_290152 ) ) ( not ( = ?auto_290145 ?auto_290153 ) ) ( not ( = ?auto_290145 ?auto_290154 ) ) ( not ( = ?auto_290145 ?auto_290155 ) ) ( not ( = ?auto_290146 ?auto_290147 ) ) ( not ( = ?auto_290146 ?auto_290148 ) ) ( not ( = ?auto_290146 ?auto_290149 ) ) ( not ( = ?auto_290146 ?auto_290150 ) ) ( not ( = ?auto_290146 ?auto_290151 ) ) ( not ( = ?auto_290146 ?auto_290152 ) ) ( not ( = ?auto_290146 ?auto_290153 ) ) ( not ( = ?auto_290146 ?auto_290154 ) ) ( not ( = ?auto_290146 ?auto_290155 ) ) ( not ( = ?auto_290147 ?auto_290148 ) ) ( not ( = ?auto_290147 ?auto_290149 ) ) ( not ( = ?auto_290147 ?auto_290150 ) ) ( not ( = ?auto_290147 ?auto_290151 ) ) ( not ( = ?auto_290147 ?auto_290152 ) ) ( not ( = ?auto_290147 ?auto_290153 ) ) ( not ( = ?auto_290147 ?auto_290154 ) ) ( not ( = ?auto_290147 ?auto_290155 ) ) ( not ( = ?auto_290148 ?auto_290149 ) ) ( not ( = ?auto_290148 ?auto_290150 ) ) ( not ( = ?auto_290148 ?auto_290151 ) ) ( not ( = ?auto_290148 ?auto_290152 ) ) ( not ( = ?auto_290148 ?auto_290153 ) ) ( not ( = ?auto_290148 ?auto_290154 ) ) ( not ( = ?auto_290148 ?auto_290155 ) ) ( not ( = ?auto_290149 ?auto_290150 ) ) ( not ( = ?auto_290149 ?auto_290151 ) ) ( not ( = ?auto_290149 ?auto_290152 ) ) ( not ( = ?auto_290149 ?auto_290153 ) ) ( not ( = ?auto_290149 ?auto_290154 ) ) ( not ( = ?auto_290149 ?auto_290155 ) ) ( not ( = ?auto_290150 ?auto_290151 ) ) ( not ( = ?auto_290150 ?auto_290152 ) ) ( not ( = ?auto_290150 ?auto_290153 ) ) ( not ( = ?auto_290150 ?auto_290154 ) ) ( not ( = ?auto_290150 ?auto_290155 ) ) ( not ( = ?auto_290151 ?auto_290152 ) ) ( not ( = ?auto_290151 ?auto_290153 ) ) ( not ( = ?auto_290151 ?auto_290154 ) ) ( not ( = ?auto_290151 ?auto_290155 ) ) ( not ( = ?auto_290152 ?auto_290153 ) ) ( not ( = ?auto_290152 ?auto_290154 ) ) ( not ( = ?auto_290152 ?auto_290155 ) ) ( not ( = ?auto_290153 ?auto_290154 ) ) ( not ( = ?auto_290153 ?auto_290155 ) ) ( not ( = ?auto_290154 ?auto_290155 ) ) ( ON ?auto_290153 ?auto_290154 ) ( ON ?auto_290152 ?auto_290153 ) ( ON ?auto_290151 ?auto_290152 ) ( CLEAR ?auto_290149 ) ( ON ?auto_290150 ?auto_290151 ) ( CLEAR ?auto_290150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_290143 ?auto_290144 ?auto_290145 ?auto_290146 ?auto_290147 ?auto_290148 ?auto_290149 ?auto_290150 )
      ( MAKE-12PILE ?auto_290143 ?auto_290144 ?auto_290145 ?auto_290146 ?auto_290147 ?auto_290148 ?auto_290149 ?auto_290150 ?auto_290151 ?auto_290152 ?auto_290153 ?auto_290154 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290193 - BLOCK
      ?auto_290194 - BLOCK
      ?auto_290195 - BLOCK
      ?auto_290196 - BLOCK
      ?auto_290197 - BLOCK
      ?auto_290198 - BLOCK
      ?auto_290199 - BLOCK
      ?auto_290200 - BLOCK
      ?auto_290201 - BLOCK
      ?auto_290202 - BLOCK
      ?auto_290203 - BLOCK
      ?auto_290204 - BLOCK
    )
    :vars
    (
      ?auto_290205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290204 ?auto_290205 ) ( ON-TABLE ?auto_290193 ) ( ON ?auto_290194 ?auto_290193 ) ( ON ?auto_290195 ?auto_290194 ) ( ON ?auto_290196 ?auto_290195 ) ( ON ?auto_290197 ?auto_290196 ) ( ON ?auto_290198 ?auto_290197 ) ( not ( = ?auto_290193 ?auto_290194 ) ) ( not ( = ?auto_290193 ?auto_290195 ) ) ( not ( = ?auto_290193 ?auto_290196 ) ) ( not ( = ?auto_290193 ?auto_290197 ) ) ( not ( = ?auto_290193 ?auto_290198 ) ) ( not ( = ?auto_290193 ?auto_290199 ) ) ( not ( = ?auto_290193 ?auto_290200 ) ) ( not ( = ?auto_290193 ?auto_290201 ) ) ( not ( = ?auto_290193 ?auto_290202 ) ) ( not ( = ?auto_290193 ?auto_290203 ) ) ( not ( = ?auto_290193 ?auto_290204 ) ) ( not ( = ?auto_290193 ?auto_290205 ) ) ( not ( = ?auto_290194 ?auto_290195 ) ) ( not ( = ?auto_290194 ?auto_290196 ) ) ( not ( = ?auto_290194 ?auto_290197 ) ) ( not ( = ?auto_290194 ?auto_290198 ) ) ( not ( = ?auto_290194 ?auto_290199 ) ) ( not ( = ?auto_290194 ?auto_290200 ) ) ( not ( = ?auto_290194 ?auto_290201 ) ) ( not ( = ?auto_290194 ?auto_290202 ) ) ( not ( = ?auto_290194 ?auto_290203 ) ) ( not ( = ?auto_290194 ?auto_290204 ) ) ( not ( = ?auto_290194 ?auto_290205 ) ) ( not ( = ?auto_290195 ?auto_290196 ) ) ( not ( = ?auto_290195 ?auto_290197 ) ) ( not ( = ?auto_290195 ?auto_290198 ) ) ( not ( = ?auto_290195 ?auto_290199 ) ) ( not ( = ?auto_290195 ?auto_290200 ) ) ( not ( = ?auto_290195 ?auto_290201 ) ) ( not ( = ?auto_290195 ?auto_290202 ) ) ( not ( = ?auto_290195 ?auto_290203 ) ) ( not ( = ?auto_290195 ?auto_290204 ) ) ( not ( = ?auto_290195 ?auto_290205 ) ) ( not ( = ?auto_290196 ?auto_290197 ) ) ( not ( = ?auto_290196 ?auto_290198 ) ) ( not ( = ?auto_290196 ?auto_290199 ) ) ( not ( = ?auto_290196 ?auto_290200 ) ) ( not ( = ?auto_290196 ?auto_290201 ) ) ( not ( = ?auto_290196 ?auto_290202 ) ) ( not ( = ?auto_290196 ?auto_290203 ) ) ( not ( = ?auto_290196 ?auto_290204 ) ) ( not ( = ?auto_290196 ?auto_290205 ) ) ( not ( = ?auto_290197 ?auto_290198 ) ) ( not ( = ?auto_290197 ?auto_290199 ) ) ( not ( = ?auto_290197 ?auto_290200 ) ) ( not ( = ?auto_290197 ?auto_290201 ) ) ( not ( = ?auto_290197 ?auto_290202 ) ) ( not ( = ?auto_290197 ?auto_290203 ) ) ( not ( = ?auto_290197 ?auto_290204 ) ) ( not ( = ?auto_290197 ?auto_290205 ) ) ( not ( = ?auto_290198 ?auto_290199 ) ) ( not ( = ?auto_290198 ?auto_290200 ) ) ( not ( = ?auto_290198 ?auto_290201 ) ) ( not ( = ?auto_290198 ?auto_290202 ) ) ( not ( = ?auto_290198 ?auto_290203 ) ) ( not ( = ?auto_290198 ?auto_290204 ) ) ( not ( = ?auto_290198 ?auto_290205 ) ) ( not ( = ?auto_290199 ?auto_290200 ) ) ( not ( = ?auto_290199 ?auto_290201 ) ) ( not ( = ?auto_290199 ?auto_290202 ) ) ( not ( = ?auto_290199 ?auto_290203 ) ) ( not ( = ?auto_290199 ?auto_290204 ) ) ( not ( = ?auto_290199 ?auto_290205 ) ) ( not ( = ?auto_290200 ?auto_290201 ) ) ( not ( = ?auto_290200 ?auto_290202 ) ) ( not ( = ?auto_290200 ?auto_290203 ) ) ( not ( = ?auto_290200 ?auto_290204 ) ) ( not ( = ?auto_290200 ?auto_290205 ) ) ( not ( = ?auto_290201 ?auto_290202 ) ) ( not ( = ?auto_290201 ?auto_290203 ) ) ( not ( = ?auto_290201 ?auto_290204 ) ) ( not ( = ?auto_290201 ?auto_290205 ) ) ( not ( = ?auto_290202 ?auto_290203 ) ) ( not ( = ?auto_290202 ?auto_290204 ) ) ( not ( = ?auto_290202 ?auto_290205 ) ) ( not ( = ?auto_290203 ?auto_290204 ) ) ( not ( = ?auto_290203 ?auto_290205 ) ) ( not ( = ?auto_290204 ?auto_290205 ) ) ( ON ?auto_290203 ?auto_290204 ) ( ON ?auto_290202 ?auto_290203 ) ( ON ?auto_290201 ?auto_290202 ) ( ON ?auto_290200 ?auto_290201 ) ( CLEAR ?auto_290198 ) ( ON ?auto_290199 ?auto_290200 ) ( CLEAR ?auto_290199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_290193 ?auto_290194 ?auto_290195 ?auto_290196 ?auto_290197 ?auto_290198 ?auto_290199 )
      ( MAKE-12PILE ?auto_290193 ?auto_290194 ?auto_290195 ?auto_290196 ?auto_290197 ?auto_290198 ?auto_290199 ?auto_290200 ?auto_290201 ?auto_290202 ?auto_290203 ?auto_290204 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290243 - BLOCK
      ?auto_290244 - BLOCK
      ?auto_290245 - BLOCK
      ?auto_290246 - BLOCK
      ?auto_290247 - BLOCK
      ?auto_290248 - BLOCK
      ?auto_290249 - BLOCK
      ?auto_290250 - BLOCK
      ?auto_290251 - BLOCK
      ?auto_290252 - BLOCK
      ?auto_290253 - BLOCK
      ?auto_290254 - BLOCK
    )
    :vars
    (
      ?auto_290255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290254 ?auto_290255 ) ( ON-TABLE ?auto_290243 ) ( ON ?auto_290244 ?auto_290243 ) ( ON ?auto_290245 ?auto_290244 ) ( ON ?auto_290246 ?auto_290245 ) ( ON ?auto_290247 ?auto_290246 ) ( not ( = ?auto_290243 ?auto_290244 ) ) ( not ( = ?auto_290243 ?auto_290245 ) ) ( not ( = ?auto_290243 ?auto_290246 ) ) ( not ( = ?auto_290243 ?auto_290247 ) ) ( not ( = ?auto_290243 ?auto_290248 ) ) ( not ( = ?auto_290243 ?auto_290249 ) ) ( not ( = ?auto_290243 ?auto_290250 ) ) ( not ( = ?auto_290243 ?auto_290251 ) ) ( not ( = ?auto_290243 ?auto_290252 ) ) ( not ( = ?auto_290243 ?auto_290253 ) ) ( not ( = ?auto_290243 ?auto_290254 ) ) ( not ( = ?auto_290243 ?auto_290255 ) ) ( not ( = ?auto_290244 ?auto_290245 ) ) ( not ( = ?auto_290244 ?auto_290246 ) ) ( not ( = ?auto_290244 ?auto_290247 ) ) ( not ( = ?auto_290244 ?auto_290248 ) ) ( not ( = ?auto_290244 ?auto_290249 ) ) ( not ( = ?auto_290244 ?auto_290250 ) ) ( not ( = ?auto_290244 ?auto_290251 ) ) ( not ( = ?auto_290244 ?auto_290252 ) ) ( not ( = ?auto_290244 ?auto_290253 ) ) ( not ( = ?auto_290244 ?auto_290254 ) ) ( not ( = ?auto_290244 ?auto_290255 ) ) ( not ( = ?auto_290245 ?auto_290246 ) ) ( not ( = ?auto_290245 ?auto_290247 ) ) ( not ( = ?auto_290245 ?auto_290248 ) ) ( not ( = ?auto_290245 ?auto_290249 ) ) ( not ( = ?auto_290245 ?auto_290250 ) ) ( not ( = ?auto_290245 ?auto_290251 ) ) ( not ( = ?auto_290245 ?auto_290252 ) ) ( not ( = ?auto_290245 ?auto_290253 ) ) ( not ( = ?auto_290245 ?auto_290254 ) ) ( not ( = ?auto_290245 ?auto_290255 ) ) ( not ( = ?auto_290246 ?auto_290247 ) ) ( not ( = ?auto_290246 ?auto_290248 ) ) ( not ( = ?auto_290246 ?auto_290249 ) ) ( not ( = ?auto_290246 ?auto_290250 ) ) ( not ( = ?auto_290246 ?auto_290251 ) ) ( not ( = ?auto_290246 ?auto_290252 ) ) ( not ( = ?auto_290246 ?auto_290253 ) ) ( not ( = ?auto_290246 ?auto_290254 ) ) ( not ( = ?auto_290246 ?auto_290255 ) ) ( not ( = ?auto_290247 ?auto_290248 ) ) ( not ( = ?auto_290247 ?auto_290249 ) ) ( not ( = ?auto_290247 ?auto_290250 ) ) ( not ( = ?auto_290247 ?auto_290251 ) ) ( not ( = ?auto_290247 ?auto_290252 ) ) ( not ( = ?auto_290247 ?auto_290253 ) ) ( not ( = ?auto_290247 ?auto_290254 ) ) ( not ( = ?auto_290247 ?auto_290255 ) ) ( not ( = ?auto_290248 ?auto_290249 ) ) ( not ( = ?auto_290248 ?auto_290250 ) ) ( not ( = ?auto_290248 ?auto_290251 ) ) ( not ( = ?auto_290248 ?auto_290252 ) ) ( not ( = ?auto_290248 ?auto_290253 ) ) ( not ( = ?auto_290248 ?auto_290254 ) ) ( not ( = ?auto_290248 ?auto_290255 ) ) ( not ( = ?auto_290249 ?auto_290250 ) ) ( not ( = ?auto_290249 ?auto_290251 ) ) ( not ( = ?auto_290249 ?auto_290252 ) ) ( not ( = ?auto_290249 ?auto_290253 ) ) ( not ( = ?auto_290249 ?auto_290254 ) ) ( not ( = ?auto_290249 ?auto_290255 ) ) ( not ( = ?auto_290250 ?auto_290251 ) ) ( not ( = ?auto_290250 ?auto_290252 ) ) ( not ( = ?auto_290250 ?auto_290253 ) ) ( not ( = ?auto_290250 ?auto_290254 ) ) ( not ( = ?auto_290250 ?auto_290255 ) ) ( not ( = ?auto_290251 ?auto_290252 ) ) ( not ( = ?auto_290251 ?auto_290253 ) ) ( not ( = ?auto_290251 ?auto_290254 ) ) ( not ( = ?auto_290251 ?auto_290255 ) ) ( not ( = ?auto_290252 ?auto_290253 ) ) ( not ( = ?auto_290252 ?auto_290254 ) ) ( not ( = ?auto_290252 ?auto_290255 ) ) ( not ( = ?auto_290253 ?auto_290254 ) ) ( not ( = ?auto_290253 ?auto_290255 ) ) ( not ( = ?auto_290254 ?auto_290255 ) ) ( ON ?auto_290253 ?auto_290254 ) ( ON ?auto_290252 ?auto_290253 ) ( ON ?auto_290251 ?auto_290252 ) ( ON ?auto_290250 ?auto_290251 ) ( ON ?auto_290249 ?auto_290250 ) ( CLEAR ?auto_290247 ) ( ON ?auto_290248 ?auto_290249 ) ( CLEAR ?auto_290248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_290243 ?auto_290244 ?auto_290245 ?auto_290246 ?auto_290247 ?auto_290248 )
      ( MAKE-12PILE ?auto_290243 ?auto_290244 ?auto_290245 ?auto_290246 ?auto_290247 ?auto_290248 ?auto_290249 ?auto_290250 ?auto_290251 ?auto_290252 ?auto_290253 ?auto_290254 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290293 - BLOCK
      ?auto_290294 - BLOCK
      ?auto_290295 - BLOCK
      ?auto_290296 - BLOCK
      ?auto_290297 - BLOCK
      ?auto_290298 - BLOCK
      ?auto_290299 - BLOCK
      ?auto_290300 - BLOCK
      ?auto_290301 - BLOCK
      ?auto_290302 - BLOCK
      ?auto_290303 - BLOCK
      ?auto_290304 - BLOCK
    )
    :vars
    (
      ?auto_290305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290304 ?auto_290305 ) ( ON-TABLE ?auto_290293 ) ( ON ?auto_290294 ?auto_290293 ) ( ON ?auto_290295 ?auto_290294 ) ( ON ?auto_290296 ?auto_290295 ) ( not ( = ?auto_290293 ?auto_290294 ) ) ( not ( = ?auto_290293 ?auto_290295 ) ) ( not ( = ?auto_290293 ?auto_290296 ) ) ( not ( = ?auto_290293 ?auto_290297 ) ) ( not ( = ?auto_290293 ?auto_290298 ) ) ( not ( = ?auto_290293 ?auto_290299 ) ) ( not ( = ?auto_290293 ?auto_290300 ) ) ( not ( = ?auto_290293 ?auto_290301 ) ) ( not ( = ?auto_290293 ?auto_290302 ) ) ( not ( = ?auto_290293 ?auto_290303 ) ) ( not ( = ?auto_290293 ?auto_290304 ) ) ( not ( = ?auto_290293 ?auto_290305 ) ) ( not ( = ?auto_290294 ?auto_290295 ) ) ( not ( = ?auto_290294 ?auto_290296 ) ) ( not ( = ?auto_290294 ?auto_290297 ) ) ( not ( = ?auto_290294 ?auto_290298 ) ) ( not ( = ?auto_290294 ?auto_290299 ) ) ( not ( = ?auto_290294 ?auto_290300 ) ) ( not ( = ?auto_290294 ?auto_290301 ) ) ( not ( = ?auto_290294 ?auto_290302 ) ) ( not ( = ?auto_290294 ?auto_290303 ) ) ( not ( = ?auto_290294 ?auto_290304 ) ) ( not ( = ?auto_290294 ?auto_290305 ) ) ( not ( = ?auto_290295 ?auto_290296 ) ) ( not ( = ?auto_290295 ?auto_290297 ) ) ( not ( = ?auto_290295 ?auto_290298 ) ) ( not ( = ?auto_290295 ?auto_290299 ) ) ( not ( = ?auto_290295 ?auto_290300 ) ) ( not ( = ?auto_290295 ?auto_290301 ) ) ( not ( = ?auto_290295 ?auto_290302 ) ) ( not ( = ?auto_290295 ?auto_290303 ) ) ( not ( = ?auto_290295 ?auto_290304 ) ) ( not ( = ?auto_290295 ?auto_290305 ) ) ( not ( = ?auto_290296 ?auto_290297 ) ) ( not ( = ?auto_290296 ?auto_290298 ) ) ( not ( = ?auto_290296 ?auto_290299 ) ) ( not ( = ?auto_290296 ?auto_290300 ) ) ( not ( = ?auto_290296 ?auto_290301 ) ) ( not ( = ?auto_290296 ?auto_290302 ) ) ( not ( = ?auto_290296 ?auto_290303 ) ) ( not ( = ?auto_290296 ?auto_290304 ) ) ( not ( = ?auto_290296 ?auto_290305 ) ) ( not ( = ?auto_290297 ?auto_290298 ) ) ( not ( = ?auto_290297 ?auto_290299 ) ) ( not ( = ?auto_290297 ?auto_290300 ) ) ( not ( = ?auto_290297 ?auto_290301 ) ) ( not ( = ?auto_290297 ?auto_290302 ) ) ( not ( = ?auto_290297 ?auto_290303 ) ) ( not ( = ?auto_290297 ?auto_290304 ) ) ( not ( = ?auto_290297 ?auto_290305 ) ) ( not ( = ?auto_290298 ?auto_290299 ) ) ( not ( = ?auto_290298 ?auto_290300 ) ) ( not ( = ?auto_290298 ?auto_290301 ) ) ( not ( = ?auto_290298 ?auto_290302 ) ) ( not ( = ?auto_290298 ?auto_290303 ) ) ( not ( = ?auto_290298 ?auto_290304 ) ) ( not ( = ?auto_290298 ?auto_290305 ) ) ( not ( = ?auto_290299 ?auto_290300 ) ) ( not ( = ?auto_290299 ?auto_290301 ) ) ( not ( = ?auto_290299 ?auto_290302 ) ) ( not ( = ?auto_290299 ?auto_290303 ) ) ( not ( = ?auto_290299 ?auto_290304 ) ) ( not ( = ?auto_290299 ?auto_290305 ) ) ( not ( = ?auto_290300 ?auto_290301 ) ) ( not ( = ?auto_290300 ?auto_290302 ) ) ( not ( = ?auto_290300 ?auto_290303 ) ) ( not ( = ?auto_290300 ?auto_290304 ) ) ( not ( = ?auto_290300 ?auto_290305 ) ) ( not ( = ?auto_290301 ?auto_290302 ) ) ( not ( = ?auto_290301 ?auto_290303 ) ) ( not ( = ?auto_290301 ?auto_290304 ) ) ( not ( = ?auto_290301 ?auto_290305 ) ) ( not ( = ?auto_290302 ?auto_290303 ) ) ( not ( = ?auto_290302 ?auto_290304 ) ) ( not ( = ?auto_290302 ?auto_290305 ) ) ( not ( = ?auto_290303 ?auto_290304 ) ) ( not ( = ?auto_290303 ?auto_290305 ) ) ( not ( = ?auto_290304 ?auto_290305 ) ) ( ON ?auto_290303 ?auto_290304 ) ( ON ?auto_290302 ?auto_290303 ) ( ON ?auto_290301 ?auto_290302 ) ( ON ?auto_290300 ?auto_290301 ) ( ON ?auto_290299 ?auto_290300 ) ( ON ?auto_290298 ?auto_290299 ) ( CLEAR ?auto_290296 ) ( ON ?auto_290297 ?auto_290298 ) ( CLEAR ?auto_290297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_290293 ?auto_290294 ?auto_290295 ?auto_290296 ?auto_290297 )
      ( MAKE-12PILE ?auto_290293 ?auto_290294 ?auto_290295 ?auto_290296 ?auto_290297 ?auto_290298 ?auto_290299 ?auto_290300 ?auto_290301 ?auto_290302 ?auto_290303 ?auto_290304 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290343 - BLOCK
      ?auto_290344 - BLOCK
      ?auto_290345 - BLOCK
      ?auto_290346 - BLOCK
      ?auto_290347 - BLOCK
      ?auto_290348 - BLOCK
      ?auto_290349 - BLOCK
      ?auto_290350 - BLOCK
      ?auto_290351 - BLOCK
      ?auto_290352 - BLOCK
      ?auto_290353 - BLOCK
      ?auto_290354 - BLOCK
    )
    :vars
    (
      ?auto_290355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290354 ?auto_290355 ) ( ON-TABLE ?auto_290343 ) ( ON ?auto_290344 ?auto_290343 ) ( ON ?auto_290345 ?auto_290344 ) ( not ( = ?auto_290343 ?auto_290344 ) ) ( not ( = ?auto_290343 ?auto_290345 ) ) ( not ( = ?auto_290343 ?auto_290346 ) ) ( not ( = ?auto_290343 ?auto_290347 ) ) ( not ( = ?auto_290343 ?auto_290348 ) ) ( not ( = ?auto_290343 ?auto_290349 ) ) ( not ( = ?auto_290343 ?auto_290350 ) ) ( not ( = ?auto_290343 ?auto_290351 ) ) ( not ( = ?auto_290343 ?auto_290352 ) ) ( not ( = ?auto_290343 ?auto_290353 ) ) ( not ( = ?auto_290343 ?auto_290354 ) ) ( not ( = ?auto_290343 ?auto_290355 ) ) ( not ( = ?auto_290344 ?auto_290345 ) ) ( not ( = ?auto_290344 ?auto_290346 ) ) ( not ( = ?auto_290344 ?auto_290347 ) ) ( not ( = ?auto_290344 ?auto_290348 ) ) ( not ( = ?auto_290344 ?auto_290349 ) ) ( not ( = ?auto_290344 ?auto_290350 ) ) ( not ( = ?auto_290344 ?auto_290351 ) ) ( not ( = ?auto_290344 ?auto_290352 ) ) ( not ( = ?auto_290344 ?auto_290353 ) ) ( not ( = ?auto_290344 ?auto_290354 ) ) ( not ( = ?auto_290344 ?auto_290355 ) ) ( not ( = ?auto_290345 ?auto_290346 ) ) ( not ( = ?auto_290345 ?auto_290347 ) ) ( not ( = ?auto_290345 ?auto_290348 ) ) ( not ( = ?auto_290345 ?auto_290349 ) ) ( not ( = ?auto_290345 ?auto_290350 ) ) ( not ( = ?auto_290345 ?auto_290351 ) ) ( not ( = ?auto_290345 ?auto_290352 ) ) ( not ( = ?auto_290345 ?auto_290353 ) ) ( not ( = ?auto_290345 ?auto_290354 ) ) ( not ( = ?auto_290345 ?auto_290355 ) ) ( not ( = ?auto_290346 ?auto_290347 ) ) ( not ( = ?auto_290346 ?auto_290348 ) ) ( not ( = ?auto_290346 ?auto_290349 ) ) ( not ( = ?auto_290346 ?auto_290350 ) ) ( not ( = ?auto_290346 ?auto_290351 ) ) ( not ( = ?auto_290346 ?auto_290352 ) ) ( not ( = ?auto_290346 ?auto_290353 ) ) ( not ( = ?auto_290346 ?auto_290354 ) ) ( not ( = ?auto_290346 ?auto_290355 ) ) ( not ( = ?auto_290347 ?auto_290348 ) ) ( not ( = ?auto_290347 ?auto_290349 ) ) ( not ( = ?auto_290347 ?auto_290350 ) ) ( not ( = ?auto_290347 ?auto_290351 ) ) ( not ( = ?auto_290347 ?auto_290352 ) ) ( not ( = ?auto_290347 ?auto_290353 ) ) ( not ( = ?auto_290347 ?auto_290354 ) ) ( not ( = ?auto_290347 ?auto_290355 ) ) ( not ( = ?auto_290348 ?auto_290349 ) ) ( not ( = ?auto_290348 ?auto_290350 ) ) ( not ( = ?auto_290348 ?auto_290351 ) ) ( not ( = ?auto_290348 ?auto_290352 ) ) ( not ( = ?auto_290348 ?auto_290353 ) ) ( not ( = ?auto_290348 ?auto_290354 ) ) ( not ( = ?auto_290348 ?auto_290355 ) ) ( not ( = ?auto_290349 ?auto_290350 ) ) ( not ( = ?auto_290349 ?auto_290351 ) ) ( not ( = ?auto_290349 ?auto_290352 ) ) ( not ( = ?auto_290349 ?auto_290353 ) ) ( not ( = ?auto_290349 ?auto_290354 ) ) ( not ( = ?auto_290349 ?auto_290355 ) ) ( not ( = ?auto_290350 ?auto_290351 ) ) ( not ( = ?auto_290350 ?auto_290352 ) ) ( not ( = ?auto_290350 ?auto_290353 ) ) ( not ( = ?auto_290350 ?auto_290354 ) ) ( not ( = ?auto_290350 ?auto_290355 ) ) ( not ( = ?auto_290351 ?auto_290352 ) ) ( not ( = ?auto_290351 ?auto_290353 ) ) ( not ( = ?auto_290351 ?auto_290354 ) ) ( not ( = ?auto_290351 ?auto_290355 ) ) ( not ( = ?auto_290352 ?auto_290353 ) ) ( not ( = ?auto_290352 ?auto_290354 ) ) ( not ( = ?auto_290352 ?auto_290355 ) ) ( not ( = ?auto_290353 ?auto_290354 ) ) ( not ( = ?auto_290353 ?auto_290355 ) ) ( not ( = ?auto_290354 ?auto_290355 ) ) ( ON ?auto_290353 ?auto_290354 ) ( ON ?auto_290352 ?auto_290353 ) ( ON ?auto_290351 ?auto_290352 ) ( ON ?auto_290350 ?auto_290351 ) ( ON ?auto_290349 ?auto_290350 ) ( ON ?auto_290348 ?auto_290349 ) ( ON ?auto_290347 ?auto_290348 ) ( CLEAR ?auto_290345 ) ( ON ?auto_290346 ?auto_290347 ) ( CLEAR ?auto_290346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_290343 ?auto_290344 ?auto_290345 ?auto_290346 )
      ( MAKE-12PILE ?auto_290343 ?auto_290344 ?auto_290345 ?auto_290346 ?auto_290347 ?auto_290348 ?auto_290349 ?auto_290350 ?auto_290351 ?auto_290352 ?auto_290353 ?auto_290354 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290393 - BLOCK
      ?auto_290394 - BLOCK
      ?auto_290395 - BLOCK
      ?auto_290396 - BLOCK
      ?auto_290397 - BLOCK
      ?auto_290398 - BLOCK
      ?auto_290399 - BLOCK
      ?auto_290400 - BLOCK
      ?auto_290401 - BLOCK
      ?auto_290402 - BLOCK
      ?auto_290403 - BLOCK
      ?auto_290404 - BLOCK
    )
    :vars
    (
      ?auto_290405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290404 ?auto_290405 ) ( ON-TABLE ?auto_290393 ) ( ON ?auto_290394 ?auto_290393 ) ( not ( = ?auto_290393 ?auto_290394 ) ) ( not ( = ?auto_290393 ?auto_290395 ) ) ( not ( = ?auto_290393 ?auto_290396 ) ) ( not ( = ?auto_290393 ?auto_290397 ) ) ( not ( = ?auto_290393 ?auto_290398 ) ) ( not ( = ?auto_290393 ?auto_290399 ) ) ( not ( = ?auto_290393 ?auto_290400 ) ) ( not ( = ?auto_290393 ?auto_290401 ) ) ( not ( = ?auto_290393 ?auto_290402 ) ) ( not ( = ?auto_290393 ?auto_290403 ) ) ( not ( = ?auto_290393 ?auto_290404 ) ) ( not ( = ?auto_290393 ?auto_290405 ) ) ( not ( = ?auto_290394 ?auto_290395 ) ) ( not ( = ?auto_290394 ?auto_290396 ) ) ( not ( = ?auto_290394 ?auto_290397 ) ) ( not ( = ?auto_290394 ?auto_290398 ) ) ( not ( = ?auto_290394 ?auto_290399 ) ) ( not ( = ?auto_290394 ?auto_290400 ) ) ( not ( = ?auto_290394 ?auto_290401 ) ) ( not ( = ?auto_290394 ?auto_290402 ) ) ( not ( = ?auto_290394 ?auto_290403 ) ) ( not ( = ?auto_290394 ?auto_290404 ) ) ( not ( = ?auto_290394 ?auto_290405 ) ) ( not ( = ?auto_290395 ?auto_290396 ) ) ( not ( = ?auto_290395 ?auto_290397 ) ) ( not ( = ?auto_290395 ?auto_290398 ) ) ( not ( = ?auto_290395 ?auto_290399 ) ) ( not ( = ?auto_290395 ?auto_290400 ) ) ( not ( = ?auto_290395 ?auto_290401 ) ) ( not ( = ?auto_290395 ?auto_290402 ) ) ( not ( = ?auto_290395 ?auto_290403 ) ) ( not ( = ?auto_290395 ?auto_290404 ) ) ( not ( = ?auto_290395 ?auto_290405 ) ) ( not ( = ?auto_290396 ?auto_290397 ) ) ( not ( = ?auto_290396 ?auto_290398 ) ) ( not ( = ?auto_290396 ?auto_290399 ) ) ( not ( = ?auto_290396 ?auto_290400 ) ) ( not ( = ?auto_290396 ?auto_290401 ) ) ( not ( = ?auto_290396 ?auto_290402 ) ) ( not ( = ?auto_290396 ?auto_290403 ) ) ( not ( = ?auto_290396 ?auto_290404 ) ) ( not ( = ?auto_290396 ?auto_290405 ) ) ( not ( = ?auto_290397 ?auto_290398 ) ) ( not ( = ?auto_290397 ?auto_290399 ) ) ( not ( = ?auto_290397 ?auto_290400 ) ) ( not ( = ?auto_290397 ?auto_290401 ) ) ( not ( = ?auto_290397 ?auto_290402 ) ) ( not ( = ?auto_290397 ?auto_290403 ) ) ( not ( = ?auto_290397 ?auto_290404 ) ) ( not ( = ?auto_290397 ?auto_290405 ) ) ( not ( = ?auto_290398 ?auto_290399 ) ) ( not ( = ?auto_290398 ?auto_290400 ) ) ( not ( = ?auto_290398 ?auto_290401 ) ) ( not ( = ?auto_290398 ?auto_290402 ) ) ( not ( = ?auto_290398 ?auto_290403 ) ) ( not ( = ?auto_290398 ?auto_290404 ) ) ( not ( = ?auto_290398 ?auto_290405 ) ) ( not ( = ?auto_290399 ?auto_290400 ) ) ( not ( = ?auto_290399 ?auto_290401 ) ) ( not ( = ?auto_290399 ?auto_290402 ) ) ( not ( = ?auto_290399 ?auto_290403 ) ) ( not ( = ?auto_290399 ?auto_290404 ) ) ( not ( = ?auto_290399 ?auto_290405 ) ) ( not ( = ?auto_290400 ?auto_290401 ) ) ( not ( = ?auto_290400 ?auto_290402 ) ) ( not ( = ?auto_290400 ?auto_290403 ) ) ( not ( = ?auto_290400 ?auto_290404 ) ) ( not ( = ?auto_290400 ?auto_290405 ) ) ( not ( = ?auto_290401 ?auto_290402 ) ) ( not ( = ?auto_290401 ?auto_290403 ) ) ( not ( = ?auto_290401 ?auto_290404 ) ) ( not ( = ?auto_290401 ?auto_290405 ) ) ( not ( = ?auto_290402 ?auto_290403 ) ) ( not ( = ?auto_290402 ?auto_290404 ) ) ( not ( = ?auto_290402 ?auto_290405 ) ) ( not ( = ?auto_290403 ?auto_290404 ) ) ( not ( = ?auto_290403 ?auto_290405 ) ) ( not ( = ?auto_290404 ?auto_290405 ) ) ( ON ?auto_290403 ?auto_290404 ) ( ON ?auto_290402 ?auto_290403 ) ( ON ?auto_290401 ?auto_290402 ) ( ON ?auto_290400 ?auto_290401 ) ( ON ?auto_290399 ?auto_290400 ) ( ON ?auto_290398 ?auto_290399 ) ( ON ?auto_290397 ?auto_290398 ) ( ON ?auto_290396 ?auto_290397 ) ( CLEAR ?auto_290394 ) ( ON ?auto_290395 ?auto_290396 ) ( CLEAR ?auto_290395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_290393 ?auto_290394 ?auto_290395 )
      ( MAKE-12PILE ?auto_290393 ?auto_290394 ?auto_290395 ?auto_290396 ?auto_290397 ?auto_290398 ?auto_290399 ?auto_290400 ?auto_290401 ?auto_290402 ?auto_290403 ?auto_290404 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290443 - BLOCK
      ?auto_290444 - BLOCK
      ?auto_290445 - BLOCK
      ?auto_290446 - BLOCK
      ?auto_290447 - BLOCK
      ?auto_290448 - BLOCK
      ?auto_290449 - BLOCK
      ?auto_290450 - BLOCK
      ?auto_290451 - BLOCK
      ?auto_290452 - BLOCK
      ?auto_290453 - BLOCK
      ?auto_290454 - BLOCK
    )
    :vars
    (
      ?auto_290455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290454 ?auto_290455 ) ( ON-TABLE ?auto_290443 ) ( not ( = ?auto_290443 ?auto_290444 ) ) ( not ( = ?auto_290443 ?auto_290445 ) ) ( not ( = ?auto_290443 ?auto_290446 ) ) ( not ( = ?auto_290443 ?auto_290447 ) ) ( not ( = ?auto_290443 ?auto_290448 ) ) ( not ( = ?auto_290443 ?auto_290449 ) ) ( not ( = ?auto_290443 ?auto_290450 ) ) ( not ( = ?auto_290443 ?auto_290451 ) ) ( not ( = ?auto_290443 ?auto_290452 ) ) ( not ( = ?auto_290443 ?auto_290453 ) ) ( not ( = ?auto_290443 ?auto_290454 ) ) ( not ( = ?auto_290443 ?auto_290455 ) ) ( not ( = ?auto_290444 ?auto_290445 ) ) ( not ( = ?auto_290444 ?auto_290446 ) ) ( not ( = ?auto_290444 ?auto_290447 ) ) ( not ( = ?auto_290444 ?auto_290448 ) ) ( not ( = ?auto_290444 ?auto_290449 ) ) ( not ( = ?auto_290444 ?auto_290450 ) ) ( not ( = ?auto_290444 ?auto_290451 ) ) ( not ( = ?auto_290444 ?auto_290452 ) ) ( not ( = ?auto_290444 ?auto_290453 ) ) ( not ( = ?auto_290444 ?auto_290454 ) ) ( not ( = ?auto_290444 ?auto_290455 ) ) ( not ( = ?auto_290445 ?auto_290446 ) ) ( not ( = ?auto_290445 ?auto_290447 ) ) ( not ( = ?auto_290445 ?auto_290448 ) ) ( not ( = ?auto_290445 ?auto_290449 ) ) ( not ( = ?auto_290445 ?auto_290450 ) ) ( not ( = ?auto_290445 ?auto_290451 ) ) ( not ( = ?auto_290445 ?auto_290452 ) ) ( not ( = ?auto_290445 ?auto_290453 ) ) ( not ( = ?auto_290445 ?auto_290454 ) ) ( not ( = ?auto_290445 ?auto_290455 ) ) ( not ( = ?auto_290446 ?auto_290447 ) ) ( not ( = ?auto_290446 ?auto_290448 ) ) ( not ( = ?auto_290446 ?auto_290449 ) ) ( not ( = ?auto_290446 ?auto_290450 ) ) ( not ( = ?auto_290446 ?auto_290451 ) ) ( not ( = ?auto_290446 ?auto_290452 ) ) ( not ( = ?auto_290446 ?auto_290453 ) ) ( not ( = ?auto_290446 ?auto_290454 ) ) ( not ( = ?auto_290446 ?auto_290455 ) ) ( not ( = ?auto_290447 ?auto_290448 ) ) ( not ( = ?auto_290447 ?auto_290449 ) ) ( not ( = ?auto_290447 ?auto_290450 ) ) ( not ( = ?auto_290447 ?auto_290451 ) ) ( not ( = ?auto_290447 ?auto_290452 ) ) ( not ( = ?auto_290447 ?auto_290453 ) ) ( not ( = ?auto_290447 ?auto_290454 ) ) ( not ( = ?auto_290447 ?auto_290455 ) ) ( not ( = ?auto_290448 ?auto_290449 ) ) ( not ( = ?auto_290448 ?auto_290450 ) ) ( not ( = ?auto_290448 ?auto_290451 ) ) ( not ( = ?auto_290448 ?auto_290452 ) ) ( not ( = ?auto_290448 ?auto_290453 ) ) ( not ( = ?auto_290448 ?auto_290454 ) ) ( not ( = ?auto_290448 ?auto_290455 ) ) ( not ( = ?auto_290449 ?auto_290450 ) ) ( not ( = ?auto_290449 ?auto_290451 ) ) ( not ( = ?auto_290449 ?auto_290452 ) ) ( not ( = ?auto_290449 ?auto_290453 ) ) ( not ( = ?auto_290449 ?auto_290454 ) ) ( not ( = ?auto_290449 ?auto_290455 ) ) ( not ( = ?auto_290450 ?auto_290451 ) ) ( not ( = ?auto_290450 ?auto_290452 ) ) ( not ( = ?auto_290450 ?auto_290453 ) ) ( not ( = ?auto_290450 ?auto_290454 ) ) ( not ( = ?auto_290450 ?auto_290455 ) ) ( not ( = ?auto_290451 ?auto_290452 ) ) ( not ( = ?auto_290451 ?auto_290453 ) ) ( not ( = ?auto_290451 ?auto_290454 ) ) ( not ( = ?auto_290451 ?auto_290455 ) ) ( not ( = ?auto_290452 ?auto_290453 ) ) ( not ( = ?auto_290452 ?auto_290454 ) ) ( not ( = ?auto_290452 ?auto_290455 ) ) ( not ( = ?auto_290453 ?auto_290454 ) ) ( not ( = ?auto_290453 ?auto_290455 ) ) ( not ( = ?auto_290454 ?auto_290455 ) ) ( ON ?auto_290453 ?auto_290454 ) ( ON ?auto_290452 ?auto_290453 ) ( ON ?auto_290451 ?auto_290452 ) ( ON ?auto_290450 ?auto_290451 ) ( ON ?auto_290449 ?auto_290450 ) ( ON ?auto_290448 ?auto_290449 ) ( ON ?auto_290447 ?auto_290448 ) ( ON ?auto_290446 ?auto_290447 ) ( ON ?auto_290445 ?auto_290446 ) ( CLEAR ?auto_290443 ) ( ON ?auto_290444 ?auto_290445 ) ( CLEAR ?auto_290444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_290443 ?auto_290444 )
      ( MAKE-12PILE ?auto_290443 ?auto_290444 ?auto_290445 ?auto_290446 ?auto_290447 ?auto_290448 ?auto_290449 ?auto_290450 ?auto_290451 ?auto_290452 ?auto_290453 ?auto_290454 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_290493 - BLOCK
      ?auto_290494 - BLOCK
      ?auto_290495 - BLOCK
      ?auto_290496 - BLOCK
      ?auto_290497 - BLOCK
      ?auto_290498 - BLOCK
      ?auto_290499 - BLOCK
      ?auto_290500 - BLOCK
      ?auto_290501 - BLOCK
      ?auto_290502 - BLOCK
      ?auto_290503 - BLOCK
      ?auto_290504 - BLOCK
    )
    :vars
    (
      ?auto_290505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290504 ?auto_290505 ) ( not ( = ?auto_290493 ?auto_290494 ) ) ( not ( = ?auto_290493 ?auto_290495 ) ) ( not ( = ?auto_290493 ?auto_290496 ) ) ( not ( = ?auto_290493 ?auto_290497 ) ) ( not ( = ?auto_290493 ?auto_290498 ) ) ( not ( = ?auto_290493 ?auto_290499 ) ) ( not ( = ?auto_290493 ?auto_290500 ) ) ( not ( = ?auto_290493 ?auto_290501 ) ) ( not ( = ?auto_290493 ?auto_290502 ) ) ( not ( = ?auto_290493 ?auto_290503 ) ) ( not ( = ?auto_290493 ?auto_290504 ) ) ( not ( = ?auto_290493 ?auto_290505 ) ) ( not ( = ?auto_290494 ?auto_290495 ) ) ( not ( = ?auto_290494 ?auto_290496 ) ) ( not ( = ?auto_290494 ?auto_290497 ) ) ( not ( = ?auto_290494 ?auto_290498 ) ) ( not ( = ?auto_290494 ?auto_290499 ) ) ( not ( = ?auto_290494 ?auto_290500 ) ) ( not ( = ?auto_290494 ?auto_290501 ) ) ( not ( = ?auto_290494 ?auto_290502 ) ) ( not ( = ?auto_290494 ?auto_290503 ) ) ( not ( = ?auto_290494 ?auto_290504 ) ) ( not ( = ?auto_290494 ?auto_290505 ) ) ( not ( = ?auto_290495 ?auto_290496 ) ) ( not ( = ?auto_290495 ?auto_290497 ) ) ( not ( = ?auto_290495 ?auto_290498 ) ) ( not ( = ?auto_290495 ?auto_290499 ) ) ( not ( = ?auto_290495 ?auto_290500 ) ) ( not ( = ?auto_290495 ?auto_290501 ) ) ( not ( = ?auto_290495 ?auto_290502 ) ) ( not ( = ?auto_290495 ?auto_290503 ) ) ( not ( = ?auto_290495 ?auto_290504 ) ) ( not ( = ?auto_290495 ?auto_290505 ) ) ( not ( = ?auto_290496 ?auto_290497 ) ) ( not ( = ?auto_290496 ?auto_290498 ) ) ( not ( = ?auto_290496 ?auto_290499 ) ) ( not ( = ?auto_290496 ?auto_290500 ) ) ( not ( = ?auto_290496 ?auto_290501 ) ) ( not ( = ?auto_290496 ?auto_290502 ) ) ( not ( = ?auto_290496 ?auto_290503 ) ) ( not ( = ?auto_290496 ?auto_290504 ) ) ( not ( = ?auto_290496 ?auto_290505 ) ) ( not ( = ?auto_290497 ?auto_290498 ) ) ( not ( = ?auto_290497 ?auto_290499 ) ) ( not ( = ?auto_290497 ?auto_290500 ) ) ( not ( = ?auto_290497 ?auto_290501 ) ) ( not ( = ?auto_290497 ?auto_290502 ) ) ( not ( = ?auto_290497 ?auto_290503 ) ) ( not ( = ?auto_290497 ?auto_290504 ) ) ( not ( = ?auto_290497 ?auto_290505 ) ) ( not ( = ?auto_290498 ?auto_290499 ) ) ( not ( = ?auto_290498 ?auto_290500 ) ) ( not ( = ?auto_290498 ?auto_290501 ) ) ( not ( = ?auto_290498 ?auto_290502 ) ) ( not ( = ?auto_290498 ?auto_290503 ) ) ( not ( = ?auto_290498 ?auto_290504 ) ) ( not ( = ?auto_290498 ?auto_290505 ) ) ( not ( = ?auto_290499 ?auto_290500 ) ) ( not ( = ?auto_290499 ?auto_290501 ) ) ( not ( = ?auto_290499 ?auto_290502 ) ) ( not ( = ?auto_290499 ?auto_290503 ) ) ( not ( = ?auto_290499 ?auto_290504 ) ) ( not ( = ?auto_290499 ?auto_290505 ) ) ( not ( = ?auto_290500 ?auto_290501 ) ) ( not ( = ?auto_290500 ?auto_290502 ) ) ( not ( = ?auto_290500 ?auto_290503 ) ) ( not ( = ?auto_290500 ?auto_290504 ) ) ( not ( = ?auto_290500 ?auto_290505 ) ) ( not ( = ?auto_290501 ?auto_290502 ) ) ( not ( = ?auto_290501 ?auto_290503 ) ) ( not ( = ?auto_290501 ?auto_290504 ) ) ( not ( = ?auto_290501 ?auto_290505 ) ) ( not ( = ?auto_290502 ?auto_290503 ) ) ( not ( = ?auto_290502 ?auto_290504 ) ) ( not ( = ?auto_290502 ?auto_290505 ) ) ( not ( = ?auto_290503 ?auto_290504 ) ) ( not ( = ?auto_290503 ?auto_290505 ) ) ( not ( = ?auto_290504 ?auto_290505 ) ) ( ON ?auto_290503 ?auto_290504 ) ( ON ?auto_290502 ?auto_290503 ) ( ON ?auto_290501 ?auto_290502 ) ( ON ?auto_290500 ?auto_290501 ) ( ON ?auto_290499 ?auto_290500 ) ( ON ?auto_290498 ?auto_290499 ) ( ON ?auto_290497 ?auto_290498 ) ( ON ?auto_290496 ?auto_290497 ) ( ON ?auto_290495 ?auto_290496 ) ( ON ?auto_290494 ?auto_290495 ) ( ON ?auto_290493 ?auto_290494 ) ( CLEAR ?auto_290493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_290493 )
      ( MAKE-12PILE ?auto_290493 ?auto_290494 ?auto_290495 ?auto_290496 ?auto_290497 ?auto_290498 ?auto_290499 ?auto_290500 ?auto_290501 ?auto_290502 ?auto_290503 ?auto_290504 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290544 - BLOCK
      ?auto_290545 - BLOCK
      ?auto_290546 - BLOCK
      ?auto_290547 - BLOCK
      ?auto_290548 - BLOCK
      ?auto_290549 - BLOCK
      ?auto_290550 - BLOCK
      ?auto_290551 - BLOCK
      ?auto_290552 - BLOCK
      ?auto_290553 - BLOCK
      ?auto_290554 - BLOCK
      ?auto_290555 - BLOCK
      ?auto_290556 - BLOCK
    )
    :vars
    (
      ?auto_290557 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_290555 ) ( ON ?auto_290556 ?auto_290557 ) ( CLEAR ?auto_290556 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_290544 ) ( ON ?auto_290545 ?auto_290544 ) ( ON ?auto_290546 ?auto_290545 ) ( ON ?auto_290547 ?auto_290546 ) ( ON ?auto_290548 ?auto_290547 ) ( ON ?auto_290549 ?auto_290548 ) ( ON ?auto_290550 ?auto_290549 ) ( ON ?auto_290551 ?auto_290550 ) ( ON ?auto_290552 ?auto_290551 ) ( ON ?auto_290553 ?auto_290552 ) ( ON ?auto_290554 ?auto_290553 ) ( ON ?auto_290555 ?auto_290554 ) ( not ( = ?auto_290544 ?auto_290545 ) ) ( not ( = ?auto_290544 ?auto_290546 ) ) ( not ( = ?auto_290544 ?auto_290547 ) ) ( not ( = ?auto_290544 ?auto_290548 ) ) ( not ( = ?auto_290544 ?auto_290549 ) ) ( not ( = ?auto_290544 ?auto_290550 ) ) ( not ( = ?auto_290544 ?auto_290551 ) ) ( not ( = ?auto_290544 ?auto_290552 ) ) ( not ( = ?auto_290544 ?auto_290553 ) ) ( not ( = ?auto_290544 ?auto_290554 ) ) ( not ( = ?auto_290544 ?auto_290555 ) ) ( not ( = ?auto_290544 ?auto_290556 ) ) ( not ( = ?auto_290544 ?auto_290557 ) ) ( not ( = ?auto_290545 ?auto_290546 ) ) ( not ( = ?auto_290545 ?auto_290547 ) ) ( not ( = ?auto_290545 ?auto_290548 ) ) ( not ( = ?auto_290545 ?auto_290549 ) ) ( not ( = ?auto_290545 ?auto_290550 ) ) ( not ( = ?auto_290545 ?auto_290551 ) ) ( not ( = ?auto_290545 ?auto_290552 ) ) ( not ( = ?auto_290545 ?auto_290553 ) ) ( not ( = ?auto_290545 ?auto_290554 ) ) ( not ( = ?auto_290545 ?auto_290555 ) ) ( not ( = ?auto_290545 ?auto_290556 ) ) ( not ( = ?auto_290545 ?auto_290557 ) ) ( not ( = ?auto_290546 ?auto_290547 ) ) ( not ( = ?auto_290546 ?auto_290548 ) ) ( not ( = ?auto_290546 ?auto_290549 ) ) ( not ( = ?auto_290546 ?auto_290550 ) ) ( not ( = ?auto_290546 ?auto_290551 ) ) ( not ( = ?auto_290546 ?auto_290552 ) ) ( not ( = ?auto_290546 ?auto_290553 ) ) ( not ( = ?auto_290546 ?auto_290554 ) ) ( not ( = ?auto_290546 ?auto_290555 ) ) ( not ( = ?auto_290546 ?auto_290556 ) ) ( not ( = ?auto_290546 ?auto_290557 ) ) ( not ( = ?auto_290547 ?auto_290548 ) ) ( not ( = ?auto_290547 ?auto_290549 ) ) ( not ( = ?auto_290547 ?auto_290550 ) ) ( not ( = ?auto_290547 ?auto_290551 ) ) ( not ( = ?auto_290547 ?auto_290552 ) ) ( not ( = ?auto_290547 ?auto_290553 ) ) ( not ( = ?auto_290547 ?auto_290554 ) ) ( not ( = ?auto_290547 ?auto_290555 ) ) ( not ( = ?auto_290547 ?auto_290556 ) ) ( not ( = ?auto_290547 ?auto_290557 ) ) ( not ( = ?auto_290548 ?auto_290549 ) ) ( not ( = ?auto_290548 ?auto_290550 ) ) ( not ( = ?auto_290548 ?auto_290551 ) ) ( not ( = ?auto_290548 ?auto_290552 ) ) ( not ( = ?auto_290548 ?auto_290553 ) ) ( not ( = ?auto_290548 ?auto_290554 ) ) ( not ( = ?auto_290548 ?auto_290555 ) ) ( not ( = ?auto_290548 ?auto_290556 ) ) ( not ( = ?auto_290548 ?auto_290557 ) ) ( not ( = ?auto_290549 ?auto_290550 ) ) ( not ( = ?auto_290549 ?auto_290551 ) ) ( not ( = ?auto_290549 ?auto_290552 ) ) ( not ( = ?auto_290549 ?auto_290553 ) ) ( not ( = ?auto_290549 ?auto_290554 ) ) ( not ( = ?auto_290549 ?auto_290555 ) ) ( not ( = ?auto_290549 ?auto_290556 ) ) ( not ( = ?auto_290549 ?auto_290557 ) ) ( not ( = ?auto_290550 ?auto_290551 ) ) ( not ( = ?auto_290550 ?auto_290552 ) ) ( not ( = ?auto_290550 ?auto_290553 ) ) ( not ( = ?auto_290550 ?auto_290554 ) ) ( not ( = ?auto_290550 ?auto_290555 ) ) ( not ( = ?auto_290550 ?auto_290556 ) ) ( not ( = ?auto_290550 ?auto_290557 ) ) ( not ( = ?auto_290551 ?auto_290552 ) ) ( not ( = ?auto_290551 ?auto_290553 ) ) ( not ( = ?auto_290551 ?auto_290554 ) ) ( not ( = ?auto_290551 ?auto_290555 ) ) ( not ( = ?auto_290551 ?auto_290556 ) ) ( not ( = ?auto_290551 ?auto_290557 ) ) ( not ( = ?auto_290552 ?auto_290553 ) ) ( not ( = ?auto_290552 ?auto_290554 ) ) ( not ( = ?auto_290552 ?auto_290555 ) ) ( not ( = ?auto_290552 ?auto_290556 ) ) ( not ( = ?auto_290552 ?auto_290557 ) ) ( not ( = ?auto_290553 ?auto_290554 ) ) ( not ( = ?auto_290553 ?auto_290555 ) ) ( not ( = ?auto_290553 ?auto_290556 ) ) ( not ( = ?auto_290553 ?auto_290557 ) ) ( not ( = ?auto_290554 ?auto_290555 ) ) ( not ( = ?auto_290554 ?auto_290556 ) ) ( not ( = ?auto_290554 ?auto_290557 ) ) ( not ( = ?auto_290555 ?auto_290556 ) ) ( not ( = ?auto_290555 ?auto_290557 ) ) ( not ( = ?auto_290556 ?auto_290557 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_290556 ?auto_290557 )
      ( !STACK ?auto_290556 ?auto_290555 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290598 - BLOCK
      ?auto_290599 - BLOCK
      ?auto_290600 - BLOCK
      ?auto_290601 - BLOCK
      ?auto_290602 - BLOCK
      ?auto_290603 - BLOCK
      ?auto_290604 - BLOCK
      ?auto_290605 - BLOCK
      ?auto_290606 - BLOCK
      ?auto_290607 - BLOCK
      ?auto_290608 - BLOCK
      ?auto_290609 - BLOCK
      ?auto_290610 - BLOCK
    )
    :vars
    (
      ?auto_290611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290610 ?auto_290611 ) ( ON-TABLE ?auto_290598 ) ( ON ?auto_290599 ?auto_290598 ) ( ON ?auto_290600 ?auto_290599 ) ( ON ?auto_290601 ?auto_290600 ) ( ON ?auto_290602 ?auto_290601 ) ( ON ?auto_290603 ?auto_290602 ) ( ON ?auto_290604 ?auto_290603 ) ( ON ?auto_290605 ?auto_290604 ) ( ON ?auto_290606 ?auto_290605 ) ( ON ?auto_290607 ?auto_290606 ) ( ON ?auto_290608 ?auto_290607 ) ( not ( = ?auto_290598 ?auto_290599 ) ) ( not ( = ?auto_290598 ?auto_290600 ) ) ( not ( = ?auto_290598 ?auto_290601 ) ) ( not ( = ?auto_290598 ?auto_290602 ) ) ( not ( = ?auto_290598 ?auto_290603 ) ) ( not ( = ?auto_290598 ?auto_290604 ) ) ( not ( = ?auto_290598 ?auto_290605 ) ) ( not ( = ?auto_290598 ?auto_290606 ) ) ( not ( = ?auto_290598 ?auto_290607 ) ) ( not ( = ?auto_290598 ?auto_290608 ) ) ( not ( = ?auto_290598 ?auto_290609 ) ) ( not ( = ?auto_290598 ?auto_290610 ) ) ( not ( = ?auto_290598 ?auto_290611 ) ) ( not ( = ?auto_290599 ?auto_290600 ) ) ( not ( = ?auto_290599 ?auto_290601 ) ) ( not ( = ?auto_290599 ?auto_290602 ) ) ( not ( = ?auto_290599 ?auto_290603 ) ) ( not ( = ?auto_290599 ?auto_290604 ) ) ( not ( = ?auto_290599 ?auto_290605 ) ) ( not ( = ?auto_290599 ?auto_290606 ) ) ( not ( = ?auto_290599 ?auto_290607 ) ) ( not ( = ?auto_290599 ?auto_290608 ) ) ( not ( = ?auto_290599 ?auto_290609 ) ) ( not ( = ?auto_290599 ?auto_290610 ) ) ( not ( = ?auto_290599 ?auto_290611 ) ) ( not ( = ?auto_290600 ?auto_290601 ) ) ( not ( = ?auto_290600 ?auto_290602 ) ) ( not ( = ?auto_290600 ?auto_290603 ) ) ( not ( = ?auto_290600 ?auto_290604 ) ) ( not ( = ?auto_290600 ?auto_290605 ) ) ( not ( = ?auto_290600 ?auto_290606 ) ) ( not ( = ?auto_290600 ?auto_290607 ) ) ( not ( = ?auto_290600 ?auto_290608 ) ) ( not ( = ?auto_290600 ?auto_290609 ) ) ( not ( = ?auto_290600 ?auto_290610 ) ) ( not ( = ?auto_290600 ?auto_290611 ) ) ( not ( = ?auto_290601 ?auto_290602 ) ) ( not ( = ?auto_290601 ?auto_290603 ) ) ( not ( = ?auto_290601 ?auto_290604 ) ) ( not ( = ?auto_290601 ?auto_290605 ) ) ( not ( = ?auto_290601 ?auto_290606 ) ) ( not ( = ?auto_290601 ?auto_290607 ) ) ( not ( = ?auto_290601 ?auto_290608 ) ) ( not ( = ?auto_290601 ?auto_290609 ) ) ( not ( = ?auto_290601 ?auto_290610 ) ) ( not ( = ?auto_290601 ?auto_290611 ) ) ( not ( = ?auto_290602 ?auto_290603 ) ) ( not ( = ?auto_290602 ?auto_290604 ) ) ( not ( = ?auto_290602 ?auto_290605 ) ) ( not ( = ?auto_290602 ?auto_290606 ) ) ( not ( = ?auto_290602 ?auto_290607 ) ) ( not ( = ?auto_290602 ?auto_290608 ) ) ( not ( = ?auto_290602 ?auto_290609 ) ) ( not ( = ?auto_290602 ?auto_290610 ) ) ( not ( = ?auto_290602 ?auto_290611 ) ) ( not ( = ?auto_290603 ?auto_290604 ) ) ( not ( = ?auto_290603 ?auto_290605 ) ) ( not ( = ?auto_290603 ?auto_290606 ) ) ( not ( = ?auto_290603 ?auto_290607 ) ) ( not ( = ?auto_290603 ?auto_290608 ) ) ( not ( = ?auto_290603 ?auto_290609 ) ) ( not ( = ?auto_290603 ?auto_290610 ) ) ( not ( = ?auto_290603 ?auto_290611 ) ) ( not ( = ?auto_290604 ?auto_290605 ) ) ( not ( = ?auto_290604 ?auto_290606 ) ) ( not ( = ?auto_290604 ?auto_290607 ) ) ( not ( = ?auto_290604 ?auto_290608 ) ) ( not ( = ?auto_290604 ?auto_290609 ) ) ( not ( = ?auto_290604 ?auto_290610 ) ) ( not ( = ?auto_290604 ?auto_290611 ) ) ( not ( = ?auto_290605 ?auto_290606 ) ) ( not ( = ?auto_290605 ?auto_290607 ) ) ( not ( = ?auto_290605 ?auto_290608 ) ) ( not ( = ?auto_290605 ?auto_290609 ) ) ( not ( = ?auto_290605 ?auto_290610 ) ) ( not ( = ?auto_290605 ?auto_290611 ) ) ( not ( = ?auto_290606 ?auto_290607 ) ) ( not ( = ?auto_290606 ?auto_290608 ) ) ( not ( = ?auto_290606 ?auto_290609 ) ) ( not ( = ?auto_290606 ?auto_290610 ) ) ( not ( = ?auto_290606 ?auto_290611 ) ) ( not ( = ?auto_290607 ?auto_290608 ) ) ( not ( = ?auto_290607 ?auto_290609 ) ) ( not ( = ?auto_290607 ?auto_290610 ) ) ( not ( = ?auto_290607 ?auto_290611 ) ) ( not ( = ?auto_290608 ?auto_290609 ) ) ( not ( = ?auto_290608 ?auto_290610 ) ) ( not ( = ?auto_290608 ?auto_290611 ) ) ( not ( = ?auto_290609 ?auto_290610 ) ) ( not ( = ?auto_290609 ?auto_290611 ) ) ( not ( = ?auto_290610 ?auto_290611 ) ) ( CLEAR ?auto_290608 ) ( ON ?auto_290609 ?auto_290610 ) ( CLEAR ?auto_290609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_290598 ?auto_290599 ?auto_290600 ?auto_290601 ?auto_290602 ?auto_290603 ?auto_290604 ?auto_290605 ?auto_290606 ?auto_290607 ?auto_290608 ?auto_290609 )
      ( MAKE-13PILE ?auto_290598 ?auto_290599 ?auto_290600 ?auto_290601 ?auto_290602 ?auto_290603 ?auto_290604 ?auto_290605 ?auto_290606 ?auto_290607 ?auto_290608 ?auto_290609 ?auto_290610 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290652 - BLOCK
      ?auto_290653 - BLOCK
      ?auto_290654 - BLOCK
      ?auto_290655 - BLOCK
      ?auto_290656 - BLOCK
      ?auto_290657 - BLOCK
      ?auto_290658 - BLOCK
      ?auto_290659 - BLOCK
      ?auto_290660 - BLOCK
      ?auto_290661 - BLOCK
      ?auto_290662 - BLOCK
      ?auto_290663 - BLOCK
      ?auto_290664 - BLOCK
    )
    :vars
    (
      ?auto_290665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290664 ?auto_290665 ) ( ON-TABLE ?auto_290652 ) ( ON ?auto_290653 ?auto_290652 ) ( ON ?auto_290654 ?auto_290653 ) ( ON ?auto_290655 ?auto_290654 ) ( ON ?auto_290656 ?auto_290655 ) ( ON ?auto_290657 ?auto_290656 ) ( ON ?auto_290658 ?auto_290657 ) ( ON ?auto_290659 ?auto_290658 ) ( ON ?auto_290660 ?auto_290659 ) ( ON ?auto_290661 ?auto_290660 ) ( not ( = ?auto_290652 ?auto_290653 ) ) ( not ( = ?auto_290652 ?auto_290654 ) ) ( not ( = ?auto_290652 ?auto_290655 ) ) ( not ( = ?auto_290652 ?auto_290656 ) ) ( not ( = ?auto_290652 ?auto_290657 ) ) ( not ( = ?auto_290652 ?auto_290658 ) ) ( not ( = ?auto_290652 ?auto_290659 ) ) ( not ( = ?auto_290652 ?auto_290660 ) ) ( not ( = ?auto_290652 ?auto_290661 ) ) ( not ( = ?auto_290652 ?auto_290662 ) ) ( not ( = ?auto_290652 ?auto_290663 ) ) ( not ( = ?auto_290652 ?auto_290664 ) ) ( not ( = ?auto_290652 ?auto_290665 ) ) ( not ( = ?auto_290653 ?auto_290654 ) ) ( not ( = ?auto_290653 ?auto_290655 ) ) ( not ( = ?auto_290653 ?auto_290656 ) ) ( not ( = ?auto_290653 ?auto_290657 ) ) ( not ( = ?auto_290653 ?auto_290658 ) ) ( not ( = ?auto_290653 ?auto_290659 ) ) ( not ( = ?auto_290653 ?auto_290660 ) ) ( not ( = ?auto_290653 ?auto_290661 ) ) ( not ( = ?auto_290653 ?auto_290662 ) ) ( not ( = ?auto_290653 ?auto_290663 ) ) ( not ( = ?auto_290653 ?auto_290664 ) ) ( not ( = ?auto_290653 ?auto_290665 ) ) ( not ( = ?auto_290654 ?auto_290655 ) ) ( not ( = ?auto_290654 ?auto_290656 ) ) ( not ( = ?auto_290654 ?auto_290657 ) ) ( not ( = ?auto_290654 ?auto_290658 ) ) ( not ( = ?auto_290654 ?auto_290659 ) ) ( not ( = ?auto_290654 ?auto_290660 ) ) ( not ( = ?auto_290654 ?auto_290661 ) ) ( not ( = ?auto_290654 ?auto_290662 ) ) ( not ( = ?auto_290654 ?auto_290663 ) ) ( not ( = ?auto_290654 ?auto_290664 ) ) ( not ( = ?auto_290654 ?auto_290665 ) ) ( not ( = ?auto_290655 ?auto_290656 ) ) ( not ( = ?auto_290655 ?auto_290657 ) ) ( not ( = ?auto_290655 ?auto_290658 ) ) ( not ( = ?auto_290655 ?auto_290659 ) ) ( not ( = ?auto_290655 ?auto_290660 ) ) ( not ( = ?auto_290655 ?auto_290661 ) ) ( not ( = ?auto_290655 ?auto_290662 ) ) ( not ( = ?auto_290655 ?auto_290663 ) ) ( not ( = ?auto_290655 ?auto_290664 ) ) ( not ( = ?auto_290655 ?auto_290665 ) ) ( not ( = ?auto_290656 ?auto_290657 ) ) ( not ( = ?auto_290656 ?auto_290658 ) ) ( not ( = ?auto_290656 ?auto_290659 ) ) ( not ( = ?auto_290656 ?auto_290660 ) ) ( not ( = ?auto_290656 ?auto_290661 ) ) ( not ( = ?auto_290656 ?auto_290662 ) ) ( not ( = ?auto_290656 ?auto_290663 ) ) ( not ( = ?auto_290656 ?auto_290664 ) ) ( not ( = ?auto_290656 ?auto_290665 ) ) ( not ( = ?auto_290657 ?auto_290658 ) ) ( not ( = ?auto_290657 ?auto_290659 ) ) ( not ( = ?auto_290657 ?auto_290660 ) ) ( not ( = ?auto_290657 ?auto_290661 ) ) ( not ( = ?auto_290657 ?auto_290662 ) ) ( not ( = ?auto_290657 ?auto_290663 ) ) ( not ( = ?auto_290657 ?auto_290664 ) ) ( not ( = ?auto_290657 ?auto_290665 ) ) ( not ( = ?auto_290658 ?auto_290659 ) ) ( not ( = ?auto_290658 ?auto_290660 ) ) ( not ( = ?auto_290658 ?auto_290661 ) ) ( not ( = ?auto_290658 ?auto_290662 ) ) ( not ( = ?auto_290658 ?auto_290663 ) ) ( not ( = ?auto_290658 ?auto_290664 ) ) ( not ( = ?auto_290658 ?auto_290665 ) ) ( not ( = ?auto_290659 ?auto_290660 ) ) ( not ( = ?auto_290659 ?auto_290661 ) ) ( not ( = ?auto_290659 ?auto_290662 ) ) ( not ( = ?auto_290659 ?auto_290663 ) ) ( not ( = ?auto_290659 ?auto_290664 ) ) ( not ( = ?auto_290659 ?auto_290665 ) ) ( not ( = ?auto_290660 ?auto_290661 ) ) ( not ( = ?auto_290660 ?auto_290662 ) ) ( not ( = ?auto_290660 ?auto_290663 ) ) ( not ( = ?auto_290660 ?auto_290664 ) ) ( not ( = ?auto_290660 ?auto_290665 ) ) ( not ( = ?auto_290661 ?auto_290662 ) ) ( not ( = ?auto_290661 ?auto_290663 ) ) ( not ( = ?auto_290661 ?auto_290664 ) ) ( not ( = ?auto_290661 ?auto_290665 ) ) ( not ( = ?auto_290662 ?auto_290663 ) ) ( not ( = ?auto_290662 ?auto_290664 ) ) ( not ( = ?auto_290662 ?auto_290665 ) ) ( not ( = ?auto_290663 ?auto_290664 ) ) ( not ( = ?auto_290663 ?auto_290665 ) ) ( not ( = ?auto_290664 ?auto_290665 ) ) ( ON ?auto_290663 ?auto_290664 ) ( CLEAR ?auto_290661 ) ( ON ?auto_290662 ?auto_290663 ) ( CLEAR ?auto_290662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_290652 ?auto_290653 ?auto_290654 ?auto_290655 ?auto_290656 ?auto_290657 ?auto_290658 ?auto_290659 ?auto_290660 ?auto_290661 ?auto_290662 )
      ( MAKE-13PILE ?auto_290652 ?auto_290653 ?auto_290654 ?auto_290655 ?auto_290656 ?auto_290657 ?auto_290658 ?auto_290659 ?auto_290660 ?auto_290661 ?auto_290662 ?auto_290663 ?auto_290664 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290706 - BLOCK
      ?auto_290707 - BLOCK
      ?auto_290708 - BLOCK
      ?auto_290709 - BLOCK
      ?auto_290710 - BLOCK
      ?auto_290711 - BLOCK
      ?auto_290712 - BLOCK
      ?auto_290713 - BLOCK
      ?auto_290714 - BLOCK
      ?auto_290715 - BLOCK
      ?auto_290716 - BLOCK
      ?auto_290717 - BLOCK
      ?auto_290718 - BLOCK
    )
    :vars
    (
      ?auto_290719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290718 ?auto_290719 ) ( ON-TABLE ?auto_290706 ) ( ON ?auto_290707 ?auto_290706 ) ( ON ?auto_290708 ?auto_290707 ) ( ON ?auto_290709 ?auto_290708 ) ( ON ?auto_290710 ?auto_290709 ) ( ON ?auto_290711 ?auto_290710 ) ( ON ?auto_290712 ?auto_290711 ) ( ON ?auto_290713 ?auto_290712 ) ( ON ?auto_290714 ?auto_290713 ) ( not ( = ?auto_290706 ?auto_290707 ) ) ( not ( = ?auto_290706 ?auto_290708 ) ) ( not ( = ?auto_290706 ?auto_290709 ) ) ( not ( = ?auto_290706 ?auto_290710 ) ) ( not ( = ?auto_290706 ?auto_290711 ) ) ( not ( = ?auto_290706 ?auto_290712 ) ) ( not ( = ?auto_290706 ?auto_290713 ) ) ( not ( = ?auto_290706 ?auto_290714 ) ) ( not ( = ?auto_290706 ?auto_290715 ) ) ( not ( = ?auto_290706 ?auto_290716 ) ) ( not ( = ?auto_290706 ?auto_290717 ) ) ( not ( = ?auto_290706 ?auto_290718 ) ) ( not ( = ?auto_290706 ?auto_290719 ) ) ( not ( = ?auto_290707 ?auto_290708 ) ) ( not ( = ?auto_290707 ?auto_290709 ) ) ( not ( = ?auto_290707 ?auto_290710 ) ) ( not ( = ?auto_290707 ?auto_290711 ) ) ( not ( = ?auto_290707 ?auto_290712 ) ) ( not ( = ?auto_290707 ?auto_290713 ) ) ( not ( = ?auto_290707 ?auto_290714 ) ) ( not ( = ?auto_290707 ?auto_290715 ) ) ( not ( = ?auto_290707 ?auto_290716 ) ) ( not ( = ?auto_290707 ?auto_290717 ) ) ( not ( = ?auto_290707 ?auto_290718 ) ) ( not ( = ?auto_290707 ?auto_290719 ) ) ( not ( = ?auto_290708 ?auto_290709 ) ) ( not ( = ?auto_290708 ?auto_290710 ) ) ( not ( = ?auto_290708 ?auto_290711 ) ) ( not ( = ?auto_290708 ?auto_290712 ) ) ( not ( = ?auto_290708 ?auto_290713 ) ) ( not ( = ?auto_290708 ?auto_290714 ) ) ( not ( = ?auto_290708 ?auto_290715 ) ) ( not ( = ?auto_290708 ?auto_290716 ) ) ( not ( = ?auto_290708 ?auto_290717 ) ) ( not ( = ?auto_290708 ?auto_290718 ) ) ( not ( = ?auto_290708 ?auto_290719 ) ) ( not ( = ?auto_290709 ?auto_290710 ) ) ( not ( = ?auto_290709 ?auto_290711 ) ) ( not ( = ?auto_290709 ?auto_290712 ) ) ( not ( = ?auto_290709 ?auto_290713 ) ) ( not ( = ?auto_290709 ?auto_290714 ) ) ( not ( = ?auto_290709 ?auto_290715 ) ) ( not ( = ?auto_290709 ?auto_290716 ) ) ( not ( = ?auto_290709 ?auto_290717 ) ) ( not ( = ?auto_290709 ?auto_290718 ) ) ( not ( = ?auto_290709 ?auto_290719 ) ) ( not ( = ?auto_290710 ?auto_290711 ) ) ( not ( = ?auto_290710 ?auto_290712 ) ) ( not ( = ?auto_290710 ?auto_290713 ) ) ( not ( = ?auto_290710 ?auto_290714 ) ) ( not ( = ?auto_290710 ?auto_290715 ) ) ( not ( = ?auto_290710 ?auto_290716 ) ) ( not ( = ?auto_290710 ?auto_290717 ) ) ( not ( = ?auto_290710 ?auto_290718 ) ) ( not ( = ?auto_290710 ?auto_290719 ) ) ( not ( = ?auto_290711 ?auto_290712 ) ) ( not ( = ?auto_290711 ?auto_290713 ) ) ( not ( = ?auto_290711 ?auto_290714 ) ) ( not ( = ?auto_290711 ?auto_290715 ) ) ( not ( = ?auto_290711 ?auto_290716 ) ) ( not ( = ?auto_290711 ?auto_290717 ) ) ( not ( = ?auto_290711 ?auto_290718 ) ) ( not ( = ?auto_290711 ?auto_290719 ) ) ( not ( = ?auto_290712 ?auto_290713 ) ) ( not ( = ?auto_290712 ?auto_290714 ) ) ( not ( = ?auto_290712 ?auto_290715 ) ) ( not ( = ?auto_290712 ?auto_290716 ) ) ( not ( = ?auto_290712 ?auto_290717 ) ) ( not ( = ?auto_290712 ?auto_290718 ) ) ( not ( = ?auto_290712 ?auto_290719 ) ) ( not ( = ?auto_290713 ?auto_290714 ) ) ( not ( = ?auto_290713 ?auto_290715 ) ) ( not ( = ?auto_290713 ?auto_290716 ) ) ( not ( = ?auto_290713 ?auto_290717 ) ) ( not ( = ?auto_290713 ?auto_290718 ) ) ( not ( = ?auto_290713 ?auto_290719 ) ) ( not ( = ?auto_290714 ?auto_290715 ) ) ( not ( = ?auto_290714 ?auto_290716 ) ) ( not ( = ?auto_290714 ?auto_290717 ) ) ( not ( = ?auto_290714 ?auto_290718 ) ) ( not ( = ?auto_290714 ?auto_290719 ) ) ( not ( = ?auto_290715 ?auto_290716 ) ) ( not ( = ?auto_290715 ?auto_290717 ) ) ( not ( = ?auto_290715 ?auto_290718 ) ) ( not ( = ?auto_290715 ?auto_290719 ) ) ( not ( = ?auto_290716 ?auto_290717 ) ) ( not ( = ?auto_290716 ?auto_290718 ) ) ( not ( = ?auto_290716 ?auto_290719 ) ) ( not ( = ?auto_290717 ?auto_290718 ) ) ( not ( = ?auto_290717 ?auto_290719 ) ) ( not ( = ?auto_290718 ?auto_290719 ) ) ( ON ?auto_290717 ?auto_290718 ) ( ON ?auto_290716 ?auto_290717 ) ( CLEAR ?auto_290714 ) ( ON ?auto_290715 ?auto_290716 ) ( CLEAR ?auto_290715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_290706 ?auto_290707 ?auto_290708 ?auto_290709 ?auto_290710 ?auto_290711 ?auto_290712 ?auto_290713 ?auto_290714 ?auto_290715 )
      ( MAKE-13PILE ?auto_290706 ?auto_290707 ?auto_290708 ?auto_290709 ?auto_290710 ?auto_290711 ?auto_290712 ?auto_290713 ?auto_290714 ?auto_290715 ?auto_290716 ?auto_290717 ?auto_290718 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290760 - BLOCK
      ?auto_290761 - BLOCK
      ?auto_290762 - BLOCK
      ?auto_290763 - BLOCK
      ?auto_290764 - BLOCK
      ?auto_290765 - BLOCK
      ?auto_290766 - BLOCK
      ?auto_290767 - BLOCK
      ?auto_290768 - BLOCK
      ?auto_290769 - BLOCK
      ?auto_290770 - BLOCK
      ?auto_290771 - BLOCK
      ?auto_290772 - BLOCK
    )
    :vars
    (
      ?auto_290773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290772 ?auto_290773 ) ( ON-TABLE ?auto_290760 ) ( ON ?auto_290761 ?auto_290760 ) ( ON ?auto_290762 ?auto_290761 ) ( ON ?auto_290763 ?auto_290762 ) ( ON ?auto_290764 ?auto_290763 ) ( ON ?auto_290765 ?auto_290764 ) ( ON ?auto_290766 ?auto_290765 ) ( ON ?auto_290767 ?auto_290766 ) ( not ( = ?auto_290760 ?auto_290761 ) ) ( not ( = ?auto_290760 ?auto_290762 ) ) ( not ( = ?auto_290760 ?auto_290763 ) ) ( not ( = ?auto_290760 ?auto_290764 ) ) ( not ( = ?auto_290760 ?auto_290765 ) ) ( not ( = ?auto_290760 ?auto_290766 ) ) ( not ( = ?auto_290760 ?auto_290767 ) ) ( not ( = ?auto_290760 ?auto_290768 ) ) ( not ( = ?auto_290760 ?auto_290769 ) ) ( not ( = ?auto_290760 ?auto_290770 ) ) ( not ( = ?auto_290760 ?auto_290771 ) ) ( not ( = ?auto_290760 ?auto_290772 ) ) ( not ( = ?auto_290760 ?auto_290773 ) ) ( not ( = ?auto_290761 ?auto_290762 ) ) ( not ( = ?auto_290761 ?auto_290763 ) ) ( not ( = ?auto_290761 ?auto_290764 ) ) ( not ( = ?auto_290761 ?auto_290765 ) ) ( not ( = ?auto_290761 ?auto_290766 ) ) ( not ( = ?auto_290761 ?auto_290767 ) ) ( not ( = ?auto_290761 ?auto_290768 ) ) ( not ( = ?auto_290761 ?auto_290769 ) ) ( not ( = ?auto_290761 ?auto_290770 ) ) ( not ( = ?auto_290761 ?auto_290771 ) ) ( not ( = ?auto_290761 ?auto_290772 ) ) ( not ( = ?auto_290761 ?auto_290773 ) ) ( not ( = ?auto_290762 ?auto_290763 ) ) ( not ( = ?auto_290762 ?auto_290764 ) ) ( not ( = ?auto_290762 ?auto_290765 ) ) ( not ( = ?auto_290762 ?auto_290766 ) ) ( not ( = ?auto_290762 ?auto_290767 ) ) ( not ( = ?auto_290762 ?auto_290768 ) ) ( not ( = ?auto_290762 ?auto_290769 ) ) ( not ( = ?auto_290762 ?auto_290770 ) ) ( not ( = ?auto_290762 ?auto_290771 ) ) ( not ( = ?auto_290762 ?auto_290772 ) ) ( not ( = ?auto_290762 ?auto_290773 ) ) ( not ( = ?auto_290763 ?auto_290764 ) ) ( not ( = ?auto_290763 ?auto_290765 ) ) ( not ( = ?auto_290763 ?auto_290766 ) ) ( not ( = ?auto_290763 ?auto_290767 ) ) ( not ( = ?auto_290763 ?auto_290768 ) ) ( not ( = ?auto_290763 ?auto_290769 ) ) ( not ( = ?auto_290763 ?auto_290770 ) ) ( not ( = ?auto_290763 ?auto_290771 ) ) ( not ( = ?auto_290763 ?auto_290772 ) ) ( not ( = ?auto_290763 ?auto_290773 ) ) ( not ( = ?auto_290764 ?auto_290765 ) ) ( not ( = ?auto_290764 ?auto_290766 ) ) ( not ( = ?auto_290764 ?auto_290767 ) ) ( not ( = ?auto_290764 ?auto_290768 ) ) ( not ( = ?auto_290764 ?auto_290769 ) ) ( not ( = ?auto_290764 ?auto_290770 ) ) ( not ( = ?auto_290764 ?auto_290771 ) ) ( not ( = ?auto_290764 ?auto_290772 ) ) ( not ( = ?auto_290764 ?auto_290773 ) ) ( not ( = ?auto_290765 ?auto_290766 ) ) ( not ( = ?auto_290765 ?auto_290767 ) ) ( not ( = ?auto_290765 ?auto_290768 ) ) ( not ( = ?auto_290765 ?auto_290769 ) ) ( not ( = ?auto_290765 ?auto_290770 ) ) ( not ( = ?auto_290765 ?auto_290771 ) ) ( not ( = ?auto_290765 ?auto_290772 ) ) ( not ( = ?auto_290765 ?auto_290773 ) ) ( not ( = ?auto_290766 ?auto_290767 ) ) ( not ( = ?auto_290766 ?auto_290768 ) ) ( not ( = ?auto_290766 ?auto_290769 ) ) ( not ( = ?auto_290766 ?auto_290770 ) ) ( not ( = ?auto_290766 ?auto_290771 ) ) ( not ( = ?auto_290766 ?auto_290772 ) ) ( not ( = ?auto_290766 ?auto_290773 ) ) ( not ( = ?auto_290767 ?auto_290768 ) ) ( not ( = ?auto_290767 ?auto_290769 ) ) ( not ( = ?auto_290767 ?auto_290770 ) ) ( not ( = ?auto_290767 ?auto_290771 ) ) ( not ( = ?auto_290767 ?auto_290772 ) ) ( not ( = ?auto_290767 ?auto_290773 ) ) ( not ( = ?auto_290768 ?auto_290769 ) ) ( not ( = ?auto_290768 ?auto_290770 ) ) ( not ( = ?auto_290768 ?auto_290771 ) ) ( not ( = ?auto_290768 ?auto_290772 ) ) ( not ( = ?auto_290768 ?auto_290773 ) ) ( not ( = ?auto_290769 ?auto_290770 ) ) ( not ( = ?auto_290769 ?auto_290771 ) ) ( not ( = ?auto_290769 ?auto_290772 ) ) ( not ( = ?auto_290769 ?auto_290773 ) ) ( not ( = ?auto_290770 ?auto_290771 ) ) ( not ( = ?auto_290770 ?auto_290772 ) ) ( not ( = ?auto_290770 ?auto_290773 ) ) ( not ( = ?auto_290771 ?auto_290772 ) ) ( not ( = ?auto_290771 ?auto_290773 ) ) ( not ( = ?auto_290772 ?auto_290773 ) ) ( ON ?auto_290771 ?auto_290772 ) ( ON ?auto_290770 ?auto_290771 ) ( ON ?auto_290769 ?auto_290770 ) ( CLEAR ?auto_290767 ) ( ON ?auto_290768 ?auto_290769 ) ( CLEAR ?auto_290768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_290760 ?auto_290761 ?auto_290762 ?auto_290763 ?auto_290764 ?auto_290765 ?auto_290766 ?auto_290767 ?auto_290768 )
      ( MAKE-13PILE ?auto_290760 ?auto_290761 ?auto_290762 ?auto_290763 ?auto_290764 ?auto_290765 ?auto_290766 ?auto_290767 ?auto_290768 ?auto_290769 ?auto_290770 ?auto_290771 ?auto_290772 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290814 - BLOCK
      ?auto_290815 - BLOCK
      ?auto_290816 - BLOCK
      ?auto_290817 - BLOCK
      ?auto_290818 - BLOCK
      ?auto_290819 - BLOCK
      ?auto_290820 - BLOCK
      ?auto_290821 - BLOCK
      ?auto_290822 - BLOCK
      ?auto_290823 - BLOCK
      ?auto_290824 - BLOCK
      ?auto_290825 - BLOCK
      ?auto_290826 - BLOCK
    )
    :vars
    (
      ?auto_290827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290826 ?auto_290827 ) ( ON-TABLE ?auto_290814 ) ( ON ?auto_290815 ?auto_290814 ) ( ON ?auto_290816 ?auto_290815 ) ( ON ?auto_290817 ?auto_290816 ) ( ON ?auto_290818 ?auto_290817 ) ( ON ?auto_290819 ?auto_290818 ) ( ON ?auto_290820 ?auto_290819 ) ( not ( = ?auto_290814 ?auto_290815 ) ) ( not ( = ?auto_290814 ?auto_290816 ) ) ( not ( = ?auto_290814 ?auto_290817 ) ) ( not ( = ?auto_290814 ?auto_290818 ) ) ( not ( = ?auto_290814 ?auto_290819 ) ) ( not ( = ?auto_290814 ?auto_290820 ) ) ( not ( = ?auto_290814 ?auto_290821 ) ) ( not ( = ?auto_290814 ?auto_290822 ) ) ( not ( = ?auto_290814 ?auto_290823 ) ) ( not ( = ?auto_290814 ?auto_290824 ) ) ( not ( = ?auto_290814 ?auto_290825 ) ) ( not ( = ?auto_290814 ?auto_290826 ) ) ( not ( = ?auto_290814 ?auto_290827 ) ) ( not ( = ?auto_290815 ?auto_290816 ) ) ( not ( = ?auto_290815 ?auto_290817 ) ) ( not ( = ?auto_290815 ?auto_290818 ) ) ( not ( = ?auto_290815 ?auto_290819 ) ) ( not ( = ?auto_290815 ?auto_290820 ) ) ( not ( = ?auto_290815 ?auto_290821 ) ) ( not ( = ?auto_290815 ?auto_290822 ) ) ( not ( = ?auto_290815 ?auto_290823 ) ) ( not ( = ?auto_290815 ?auto_290824 ) ) ( not ( = ?auto_290815 ?auto_290825 ) ) ( not ( = ?auto_290815 ?auto_290826 ) ) ( not ( = ?auto_290815 ?auto_290827 ) ) ( not ( = ?auto_290816 ?auto_290817 ) ) ( not ( = ?auto_290816 ?auto_290818 ) ) ( not ( = ?auto_290816 ?auto_290819 ) ) ( not ( = ?auto_290816 ?auto_290820 ) ) ( not ( = ?auto_290816 ?auto_290821 ) ) ( not ( = ?auto_290816 ?auto_290822 ) ) ( not ( = ?auto_290816 ?auto_290823 ) ) ( not ( = ?auto_290816 ?auto_290824 ) ) ( not ( = ?auto_290816 ?auto_290825 ) ) ( not ( = ?auto_290816 ?auto_290826 ) ) ( not ( = ?auto_290816 ?auto_290827 ) ) ( not ( = ?auto_290817 ?auto_290818 ) ) ( not ( = ?auto_290817 ?auto_290819 ) ) ( not ( = ?auto_290817 ?auto_290820 ) ) ( not ( = ?auto_290817 ?auto_290821 ) ) ( not ( = ?auto_290817 ?auto_290822 ) ) ( not ( = ?auto_290817 ?auto_290823 ) ) ( not ( = ?auto_290817 ?auto_290824 ) ) ( not ( = ?auto_290817 ?auto_290825 ) ) ( not ( = ?auto_290817 ?auto_290826 ) ) ( not ( = ?auto_290817 ?auto_290827 ) ) ( not ( = ?auto_290818 ?auto_290819 ) ) ( not ( = ?auto_290818 ?auto_290820 ) ) ( not ( = ?auto_290818 ?auto_290821 ) ) ( not ( = ?auto_290818 ?auto_290822 ) ) ( not ( = ?auto_290818 ?auto_290823 ) ) ( not ( = ?auto_290818 ?auto_290824 ) ) ( not ( = ?auto_290818 ?auto_290825 ) ) ( not ( = ?auto_290818 ?auto_290826 ) ) ( not ( = ?auto_290818 ?auto_290827 ) ) ( not ( = ?auto_290819 ?auto_290820 ) ) ( not ( = ?auto_290819 ?auto_290821 ) ) ( not ( = ?auto_290819 ?auto_290822 ) ) ( not ( = ?auto_290819 ?auto_290823 ) ) ( not ( = ?auto_290819 ?auto_290824 ) ) ( not ( = ?auto_290819 ?auto_290825 ) ) ( not ( = ?auto_290819 ?auto_290826 ) ) ( not ( = ?auto_290819 ?auto_290827 ) ) ( not ( = ?auto_290820 ?auto_290821 ) ) ( not ( = ?auto_290820 ?auto_290822 ) ) ( not ( = ?auto_290820 ?auto_290823 ) ) ( not ( = ?auto_290820 ?auto_290824 ) ) ( not ( = ?auto_290820 ?auto_290825 ) ) ( not ( = ?auto_290820 ?auto_290826 ) ) ( not ( = ?auto_290820 ?auto_290827 ) ) ( not ( = ?auto_290821 ?auto_290822 ) ) ( not ( = ?auto_290821 ?auto_290823 ) ) ( not ( = ?auto_290821 ?auto_290824 ) ) ( not ( = ?auto_290821 ?auto_290825 ) ) ( not ( = ?auto_290821 ?auto_290826 ) ) ( not ( = ?auto_290821 ?auto_290827 ) ) ( not ( = ?auto_290822 ?auto_290823 ) ) ( not ( = ?auto_290822 ?auto_290824 ) ) ( not ( = ?auto_290822 ?auto_290825 ) ) ( not ( = ?auto_290822 ?auto_290826 ) ) ( not ( = ?auto_290822 ?auto_290827 ) ) ( not ( = ?auto_290823 ?auto_290824 ) ) ( not ( = ?auto_290823 ?auto_290825 ) ) ( not ( = ?auto_290823 ?auto_290826 ) ) ( not ( = ?auto_290823 ?auto_290827 ) ) ( not ( = ?auto_290824 ?auto_290825 ) ) ( not ( = ?auto_290824 ?auto_290826 ) ) ( not ( = ?auto_290824 ?auto_290827 ) ) ( not ( = ?auto_290825 ?auto_290826 ) ) ( not ( = ?auto_290825 ?auto_290827 ) ) ( not ( = ?auto_290826 ?auto_290827 ) ) ( ON ?auto_290825 ?auto_290826 ) ( ON ?auto_290824 ?auto_290825 ) ( ON ?auto_290823 ?auto_290824 ) ( ON ?auto_290822 ?auto_290823 ) ( CLEAR ?auto_290820 ) ( ON ?auto_290821 ?auto_290822 ) ( CLEAR ?auto_290821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_290814 ?auto_290815 ?auto_290816 ?auto_290817 ?auto_290818 ?auto_290819 ?auto_290820 ?auto_290821 )
      ( MAKE-13PILE ?auto_290814 ?auto_290815 ?auto_290816 ?auto_290817 ?auto_290818 ?auto_290819 ?auto_290820 ?auto_290821 ?auto_290822 ?auto_290823 ?auto_290824 ?auto_290825 ?auto_290826 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290868 - BLOCK
      ?auto_290869 - BLOCK
      ?auto_290870 - BLOCK
      ?auto_290871 - BLOCK
      ?auto_290872 - BLOCK
      ?auto_290873 - BLOCK
      ?auto_290874 - BLOCK
      ?auto_290875 - BLOCK
      ?auto_290876 - BLOCK
      ?auto_290877 - BLOCK
      ?auto_290878 - BLOCK
      ?auto_290879 - BLOCK
      ?auto_290880 - BLOCK
    )
    :vars
    (
      ?auto_290881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290880 ?auto_290881 ) ( ON-TABLE ?auto_290868 ) ( ON ?auto_290869 ?auto_290868 ) ( ON ?auto_290870 ?auto_290869 ) ( ON ?auto_290871 ?auto_290870 ) ( ON ?auto_290872 ?auto_290871 ) ( ON ?auto_290873 ?auto_290872 ) ( not ( = ?auto_290868 ?auto_290869 ) ) ( not ( = ?auto_290868 ?auto_290870 ) ) ( not ( = ?auto_290868 ?auto_290871 ) ) ( not ( = ?auto_290868 ?auto_290872 ) ) ( not ( = ?auto_290868 ?auto_290873 ) ) ( not ( = ?auto_290868 ?auto_290874 ) ) ( not ( = ?auto_290868 ?auto_290875 ) ) ( not ( = ?auto_290868 ?auto_290876 ) ) ( not ( = ?auto_290868 ?auto_290877 ) ) ( not ( = ?auto_290868 ?auto_290878 ) ) ( not ( = ?auto_290868 ?auto_290879 ) ) ( not ( = ?auto_290868 ?auto_290880 ) ) ( not ( = ?auto_290868 ?auto_290881 ) ) ( not ( = ?auto_290869 ?auto_290870 ) ) ( not ( = ?auto_290869 ?auto_290871 ) ) ( not ( = ?auto_290869 ?auto_290872 ) ) ( not ( = ?auto_290869 ?auto_290873 ) ) ( not ( = ?auto_290869 ?auto_290874 ) ) ( not ( = ?auto_290869 ?auto_290875 ) ) ( not ( = ?auto_290869 ?auto_290876 ) ) ( not ( = ?auto_290869 ?auto_290877 ) ) ( not ( = ?auto_290869 ?auto_290878 ) ) ( not ( = ?auto_290869 ?auto_290879 ) ) ( not ( = ?auto_290869 ?auto_290880 ) ) ( not ( = ?auto_290869 ?auto_290881 ) ) ( not ( = ?auto_290870 ?auto_290871 ) ) ( not ( = ?auto_290870 ?auto_290872 ) ) ( not ( = ?auto_290870 ?auto_290873 ) ) ( not ( = ?auto_290870 ?auto_290874 ) ) ( not ( = ?auto_290870 ?auto_290875 ) ) ( not ( = ?auto_290870 ?auto_290876 ) ) ( not ( = ?auto_290870 ?auto_290877 ) ) ( not ( = ?auto_290870 ?auto_290878 ) ) ( not ( = ?auto_290870 ?auto_290879 ) ) ( not ( = ?auto_290870 ?auto_290880 ) ) ( not ( = ?auto_290870 ?auto_290881 ) ) ( not ( = ?auto_290871 ?auto_290872 ) ) ( not ( = ?auto_290871 ?auto_290873 ) ) ( not ( = ?auto_290871 ?auto_290874 ) ) ( not ( = ?auto_290871 ?auto_290875 ) ) ( not ( = ?auto_290871 ?auto_290876 ) ) ( not ( = ?auto_290871 ?auto_290877 ) ) ( not ( = ?auto_290871 ?auto_290878 ) ) ( not ( = ?auto_290871 ?auto_290879 ) ) ( not ( = ?auto_290871 ?auto_290880 ) ) ( not ( = ?auto_290871 ?auto_290881 ) ) ( not ( = ?auto_290872 ?auto_290873 ) ) ( not ( = ?auto_290872 ?auto_290874 ) ) ( not ( = ?auto_290872 ?auto_290875 ) ) ( not ( = ?auto_290872 ?auto_290876 ) ) ( not ( = ?auto_290872 ?auto_290877 ) ) ( not ( = ?auto_290872 ?auto_290878 ) ) ( not ( = ?auto_290872 ?auto_290879 ) ) ( not ( = ?auto_290872 ?auto_290880 ) ) ( not ( = ?auto_290872 ?auto_290881 ) ) ( not ( = ?auto_290873 ?auto_290874 ) ) ( not ( = ?auto_290873 ?auto_290875 ) ) ( not ( = ?auto_290873 ?auto_290876 ) ) ( not ( = ?auto_290873 ?auto_290877 ) ) ( not ( = ?auto_290873 ?auto_290878 ) ) ( not ( = ?auto_290873 ?auto_290879 ) ) ( not ( = ?auto_290873 ?auto_290880 ) ) ( not ( = ?auto_290873 ?auto_290881 ) ) ( not ( = ?auto_290874 ?auto_290875 ) ) ( not ( = ?auto_290874 ?auto_290876 ) ) ( not ( = ?auto_290874 ?auto_290877 ) ) ( not ( = ?auto_290874 ?auto_290878 ) ) ( not ( = ?auto_290874 ?auto_290879 ) ) ( not ( = ?auto_290874 ?auto_290880 ) ) ( not ( = ?auto_290874 ?auto_290881 ) ) ( not ( = ?auto_290875 ?auto_290876 ) ) ( not ( = ?auto_290875 ?auto_290877 ) ) ( not ( = ?auto_290875 ?auto_290878 ) ) ( not ( = ?auto_290875 ?auto_290879 ) ) ( not ( = ?auto_290875 ?auto_290880 ) ) ( not ( = ?auto_290875 ?auto_290881 ) ) ( not ( = ?auto_290876 ?auto_290877 ) ) ( not ( = ?auto_290876 ?auto_290878 ) ) ( not ( = ?auto_290876 ?auto_290879 ) ) ( not ( = ?auto_290876 ?auto_290880 ) ) ( not ( = ?auto_290876 ?auto_290881 ) ) ( not ( = ?auto_290877 ?auto_290878 ) ) ( not ( = ?auto_290877 ?auto_290879 ) ) ( not ( = ?auto_290877 ?auto_290880 ) ) ( not ( = ?auto_290877 ?auto_290881 ) ) ( not ( = ?auto_290878 ?auto_290879 ) ) ( not ( = ?auto_290878 ?auto_290880 ) ) ( not ( = ?auto_290878 ?auto_290881 ) ) ( not ( = ?auto_290879 ?auto_290880 ) ) ( not ( = ?auto_290879 ?auto_290881 ) ) ( not ( = ?auto_290880 ?auto_290881 ) ) ( ON ?auto_290879 ?auto_290880 ) ( ON ?auto_290878 ?auto_290879 ) ( ON ?auto_290877 ?auto_290878 ) ( ON ?auto_290876 ?auto_290877 ) ( ON ?auto_290875 ?auto_290876 ) ( CLEAR ?auto_290873 ) ( ON ?auto_290874 ?auto_290875 ) ( CLEAR ?auto_290874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_290868 ?auto_290869 ?auto_290870 ?auto_290871 ?auto_290872 ?auto_290873 ?auto_290874 )
      ( MAKE-13PILE ?auto_290868 ?auto_290869 ?auto_290870 ?auto_290871 ?auto_290872 ?auto_290873 ?auto_290874 ?auto_290875 ?auto_290876 ?auto_290877 ?auto_290878 ?auto_290879 ?auto_290880 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290922 - BLOCK
      ?auto_290923 - BLOCK
      ?auto_290924 - BLOCK
      ?auto_290925 - BLOCK
      ?auto_290926 - BLOCK
      ?auto_290927 - BLOCK
      ?auto_290928 - BLOCK
      ?auto_290929 - BLOCK
      ?auto_290930 - BLOCK
      ?auto_290931 - BLOCK
      ?auto_290932 - BLOCK
      ?auto_290933 - BLOCK
      ?auto_290934 - BLOCK
    )
    :vars
    (
      ?auto_290935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290934 ?auto_290935 ) ( ON-TABLE ?auto_290922 ) ( ON ?auto_290923 ?auto_290922 ) ( ON ?auto_290924 ?auto_290923 ) ( ON ?auto_290925 ?auto_290924 ) ( ON ?auto_290926 ?auto_290925 ) ( not ( = ?auto_290922 ?auto_290923 ) ) ( not ( = ?auto_290922 ?auto_290924 ) ) ( not ( = ?auto_290922 ?auto_290925 ) ) ( not ( = ?auto_290922 ?auto_290926 ) ) ( not ( = ?auto_290922 ?auto_290927 ) ) ( not ( = ?auto_290922 ?auto_290928 ) ) ( not ( = ?auto_290922 ?auto_290929 ) ) ( not ( = ?auto_290922 ?auto_290930 ) ) ( not ( = ?auto_290922 ?auto_290931 ) ) ( not ( = ?auto_290922 ?auto_290932 ) ) ( not ( = ?auto_290922 ?auto_290933 ) ) ( not ( = ?auto_290922 ?auto_290934 ) ) ( not ( = ?auto_290922 ?auto_290935 ) ) ( not ( = ?auto_290923 ?auto_290924 ) ) ( not ( = ?auto_290923 ?auto_290925 ) ) ( not ( = ?auto_290923 ?auto_290926 ) ) ( not ( = ?auto_290923 ?auto_290927 ) ) ( not ( = ?auto_290923 ?auto_290928 ) ) ( not ( = ?auto_290923 ?auto_290929 ) ) ( not ( = ?auto_290923 ?auto_290930 ) ) ( not ( = ?auto_290923 ?auto_290931 ) ) ( not ( = ?auto_290923 ?auto_290932 ) ) ( not ( = ?auto_290923 ?auto_290933 ) ) ( not ( = ?auto_290923 ?auto_290934 ) ) ( not ( = ?auto_290923 ?auto_290935 ) ) ( not ( = ?auto_290924 ?auto_290925 ) ) ( not ( = ?auto_290924 ?auto_290926 ) ) ( not ( = ?auto_290924 ?auto_290927 ) ) ( not ( = ?auto_290924 ?auto_290928 ) ) ( not ( = ?auto_290924 ?auto_290929 ) ) ( not ( = ?auto_290924 ?auto_290930 ) ) ( not ( = ?auto_290924 ?auto_290931 ) ) ( not ( = ?auto_290924 ?auto_290932 ) ) ( not ( = ?auto_290924 ?auto_290933 ) ) ( not ( = ?auto_290924 ?auto_290934 ) ) ( not ( = ?auto_290924 ?auto_290935 ) ) ( not ( = ?auto_290925 ?auto_290926 ) ) ( not ( = ?auto_290925 ?auto_290927 ) ) ( not ( = ?auto_290925 ?auto_290928 ) ) ( not ( = ?auto_290925 ?auto_290929 ) ) ( not ( = ?auto_290925 ?auto_290930 ) ) ( not ( = ?auto_290925 ?auto_290931 ) ) ( not ( = ?auto_290925 ?auto_290932 ) ) ( not ( = ?auto_290925 ?auto_290933 ) ) ( not ( = ?auto_290925 ?auto_290934 ) ) ( not ( = ?auto_290925 ?auto_290935 ) ) ( not ( = ?auto_290926 ?auto_290927 ) ) ( not ( = ?auto_290926 ?auto_290928 ) ) ( not ( = ?auto_290926 ?auto_290929 ) ) ( not ( = ?auto_290926 ?auto_290930 ) ) ( not ( = ?auto_290926 ?auto_290931 ) ) ( not ( = ?auto_290926 ?auto_290932 ) ) ( not ( = ?auto_290926 ?auto_290933 ) ) ( not ( = ?auto_290926 ?auto_290934 ) ) ( not ( = ?auto_290926 ?auto_290935 ) ) ( not ( = ?auto_290927 ?auto_290928 ) ) ( not ( = ?auto_290927 ?auto_290929 ) ) ( not ( = ?auto_290927 ?auto_290930 ) ) ( not ( = ?auto_290927 ?auto_290931 ) ) ( not ( = ?auto_290927 ?auto_290932 ) ) ( not ( = ?auto_290927 ?auto_290933 ) ) ( not ( = ?auto_290927 ?auto_290934 ) ) ( not ( = ?auto_290927 ?auto_290935 ) ) ( not ( = ?auto_290928 ?auto_290929 ) ) ( not ( = ?auto_290928 ?auto_290930 ) ) ( not ( = ?auto_290928 ?auto_290931 ) ) ( not ( = ?auto_290928 ?auto_290932 ) ) ( not ( = ?auto_290928 ?auto_290933 ) ) ( not ( = ?auto_290928 ?auto_290934 ) ) ( not ( = ?auto_290928 ?auto_290935 ) ) ( not ( = ?auto_290929 ?auto_290930 ) ) ( not ( = ?auto_290929 ?auto_290931 ) ) ( not ( = ?auto_290929 ?auto_290932 ) ) ( not ( = ?auto_290929 ?auto_290933 ) ) ( not ( = ?auto_290929 ?auto_290934 ) ) ( not ( = ?auto_290929 ?auto_290935 ) ) ( not ( = ?auto_290930 ?auto_290931 ) ) ( not ( = ?auto_290930 ?auto_290932 ) ) ( not ( = ?auto_290930 ?auto_290933 ) ) ( not ( = ?auto_290930 ?auto_290934 ) ) ( not ( = ?auto_290930 ?auto_290935 ) ) ( not ( = ?auto_290931 ?auto_290932 ) ) ( not ( = ?auto_290931 ?auto_290933 ) ) ( not ( = ?auto_290931 ?auto_290934 ) ) ( not ( = ?auto_290931 ?auto_290935 ) ) ( not ( = ?auto_290932 ?auto_290933 ) ) ( not ( = ?auto_290932 ?auto_290934 ) ) ( not ( = ?auto_290932 ?auto_290935 ) ) ( not ( = ?auto_290933 ?auto_290934 ) ) ( not ( = ?auto_290933 ?auto_290935 ) ) ( not ( = ?auto_290934 ?auto_290935 ) ) ( ON ?auto_290933 ?auto_290934 ) ( ON ?auto_290932 ?auto_290933 ) ( ON ?auto_290931 ?auto_290932 ) ( ON ?auto_290930 ?auto_290931 ) ( ON ?auto_290929 ?auto_290930 ) ( ON ?auto_290928 ?auto_290929 ) ( CLEAR ?auto_290926 ) ( ON ?auto_290927 ?auto_290928 ) ( CLEAR ?auto_290927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_290922 ?auto_290923 ?auto_290924 ?auto_290925 ?auto_290926 ?auto_290927 )
      ( MAKE-13PILE ?auto_290922 ?auto_290923 ?auto_290924 ?auto_290925 ?auto_290926 ?auto_290927 ?auto_290928 ?auto_290929 ?auto_290930 ?auto_290931 ?auto_290932 ?auto_290933 ?auto_290934 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_290976 - BLOCK
      ?auto_290977 - BLOCK
      ?auto_290978 - BLOCK
      ?auto_290979 - BLOCK
      ?auto_290980 - BLOCK
      ?auto_290981 - BLOCK
      ?auto_290982 - BLOCK
      ?auto_290983 - BLOCK
      ?auto_290984 - BLOCK
      ?auto_290985 - BLOCK
      ?auto_290986 - BLOCK
      ?auto_290987 - BLOCK
      ?auto_290988 - BLOCK
    )
    :vars
    (
      ?auto_290989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290988 ?auto_290989 ) ( ON-TABLE ?auto_290976 ) ( ON ?auto_290977 ?auto_290976 ) ( ON ?auto_290978 ?auto_290977 ) ( ON ?auto_290979 ?auto_290978 ) ( not ( = ?auto_290976 ?auto_290977 ) ) ( not ( = ?auto_290976 ?auto_290978 ) ) ( not ( = ?auto_290976 ?auto_290979 ) ) ( not ( = ?auto_290976 ?auto_290980 ) ) ( not ( = ?auto_290976 ?auto_290981 ) ) ( not ( = ?auto_290976 ?auto_290982 ) ) ( not ( = ?auto_290976 ?auto_290983 ) ) ( not ( = ?auto_290976 ?auto_290984 ) ) ( not ( = ?auto_290976 ?auto_290985 ) ) ( not ( = ?auto_290976 ?auto_290986 ) ) ( not ( = ?auto_290976 ?auto_290987 ) ) ( not ( = ?auto_290976 ?auto_290988 ) ) ( not ( = ?auto_290976 ?auto_290989 ) ) ( not ( = ?auto_290977 ?auto_290978 ) ) ( not ( = ?auto_290977 ?auto_290979 ) ) ( not ( = ?auto_290977 ?auto_290980 ) ) ( not ( = ?auto_290977 ?auto_290981 ) ) ( not ( = ?auto_290977 ?auto_290982 ) ) ( not ( = ?auto_290977 ?auto_290983 ) ) ( not ( = ?auto_290977 ?auto_290984 ) ) ( not ( = ?auto_290977 ?auto_290985 ) ) ( not ( = ?auto_290977 ?auto_290986 ) ) ( not ( = ?auto_290977 ?auto_290987 ) ) ( not ( = ?auto_290977 ?auto_290988 ) ) ( not ( = ?auto_290977 ?auto_290989 ) ) ( not ( = ?auto_290978 ?auto_290979 ) ) ( not ( = ?auto_290978 ?auto_290980 ) ) ( not ( = ?auto_290978 ?auto_290981 ) ) ( not ( = ?auto_290978 ?auto_290982 ) ) ( not ( = ?auto_290978 ?auto_290983 ) ) ( not ( = ?auto_290978 ?auto_290984 ) ) ( not ( = ?auto_290978 ?auto_290985 ) ) ( not ( = ?auto_290978 ?auto_290986 ) ) ( not ( = ?auto_290978 ?auto_290987 ) ) ( not ( = ?auto_290978 ?auto_290988 ) ) ( not ( = ?auto_290978 ?auto_290989 ) ) ( not ( = ?auto_290979 ?auto_290980 ) ) ( not ( = ?auto_290979 ?auto_290981 ) ) ( not ( = ?auto_290979 ?auto_290982 ) ) ( not ( = ?auto_290979 ?auto_290983 ) ) ( not ( = ?auto_290979 ?auto_290984 ) ) ( not ( = ?auto_290979 ?auto_290985 ) ) ( not ( = ?auto_290979 ?auto_290986 ) ) ( not ( = ?auto_290979 ?auto_290987 ) ) ( not ( = ?auto_290979 ?auto_290988 ) ) ( not ( = ?auto_290979 ?auto_290989 ) ) ( not ( = ?auto_290980 ?auto_290981 ) ) ( not ( = ?auto_290980 ?auto_290982 ) ) ( not ( = ?auto_290980 ?auto_290983 ) ) ( not ( = ?auto_290980 ?auto_290984 ) ) ( not ( = ?auto_290980 ?auto_290985 ) ) ( not ( = ?auto_290980 ?auto_290986 ) ) ( not ( = ?auto_290980 ?auto_290987 ) ) ( not ( = ?auto_290980 ?auto_290988 ) ) ( not ( = ?auto_290980 ?auto_290989 ) ) ( not ( = ?auto_290981 ?auto_290982 ) ) ( not ( = ?auto_290981 ?auto_290983 ) ) ( not ( = ?auto_290981 ?auto_290984 ) ) ( not ( = ?auto_290981 ?auto_290985 ) ) ( not ( = ?auto_290981 ?auto_290986 ) ) ( not ( = ?auto_290981 ?auto_290987 ) ) ( not ( = ?auto_290981 ?auto_290988 ) ) ( not ( = ?auto_290981 ?auto_290989 ) ) ( not ( = ?auto_290982 ?auto_290983 ) ) ( not ( = ?auto_290982 ?auto_290984 ) ) ( not ( = ?auto_290982 ?auto_290985 ) ) ( not ( = ?auto_290982 ?auto_290986 ) ) ( not ( = ?auto_290982 ?auto_290987 ) ) ( not ( = ?auto_290982 ?auto_290988 ) ) ( not ( = ?auto_290982 ?auto_290989 ) ) ( not ( = ?auto_290983 ?auto_290984 ) ) ( not ( = ?auto_290983 ?auto_290985 ) ) ( not ( = ?auto_290983 ?auto_290986 ) ) ( not ( = ?auto_290983 ?auto_290987 ) ) ( not ( = ?auto_290983 ?auto_290988 ) ) ( not ( = ?auto_290983 ?auto_290989 ) ) ( not ( = ?auto_290984 ?auto_290985 ) ) ( not ( = ?auto_290984 ?auto_290986 ) ) ( not ( = ?auto_290984 ?auto_290987 ) ) ( not ( = ?auto_290984 ?auto_290988 ) ) ( not ( = ?auto_290984 ?auto_290989 ) ) ( not ( = ?auto_290985 ?auto_290986 ) ) ( not ( = ?auto_290985 ?auto_290987 ) ) ( not ( = ?auto_290985 ?auto_290988 ) ) ( not ( = ?auto_290985 ?auto_290989 ) ) ( not ( = ?auto_290986 ?auto_290987 ) ) ( not ( = ?auto_290986 ?auto_290988 ) ) ( not ( = ?auto_290986 ?auto_290989 ) ) ( not ( = ?auto_290987 ?auto_290988 ) ) ( not ( = ?auto_290987 ?auto_290989 ) ) ( not ( = ?auto_290988 ?auto_290989 ) ) ( ON ?auto_290987 ?auto_290988 ) ( ON ?auto_290986 ?auto_290987 ) ( ON ?auto_290985 ?auto_290986 ) ( ON ?auto_290984 ?auto_290985 ) ( ON ?auto_290983 ?auto_290984 ) ( ON ?auto_290982 ?auto_290983 ) ( ON ?auto_290981 ?auto_290982 ) ( CLEAR ?auto_290979 ) ( ON ?auto_290980 ?auto_290981 ) ( CLEAR ?auto_290980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_290976 ?auto_290977 ?auto_290978 ?auto_290979 ?auto_290980 )
      ( MAKE-13PILE ?auto_290976 ?auto_290977 ?auto_290978 ?auto_290979 ?auto_290980 ?auto_290981 ?auto_290982 ?auto_290983 ?auto_290984 ?auto_290985 ?auto_290986 ?auto_290987 ?auto_290988 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_291030 - BLOCK
      ?auto_291031 - BLOCK
      ?auto_291032 - BLOCK
      ?auto_291033 - BLOCK
      ?auto_291034 - BLOCK
      ?auto_291035 - BLOCK
      ?auto_291036 - BLOCK
      ?auto_291037 - BLOCK
      ?auto_291038 - BLOCK
      ?auto_291039 - BLOCK
      ?auto_291040 - BLOCK
      ?auto_291041 - BLOCK
      ?auto_291042 - BLOCK
    )
    :vars
    (
      ?auto_291043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291042 ?auto_291043 ) ( ON-TABLE ?auto_291030 ) ( ON ?auto_291031 ?auto_291030 ) ( ON ?auto_291032 ?auto_291031 ) ( not ( = ?auto_291030 ?auto_291031 ) ) ( not ( = ?auto_291030 ?auto_291032 ) ) ( not ( = ?auto_291030 ?auto_291033 ) ) ( not ( = ?auto_291030 ?auto_291034 ) ) ( not ( = ?auto_291030 ?auto_291035 ) ) ( not ( = ?auto_291030 ?auto_291036 ) ) ( not ( = ?auto_291030 ?auto_291037 ) ) ( not ( = ?auto_291030 ?auto_291038 ) ) ( not ( = ?auto_291030 ?auto_291039 ) ) ( not ( = ?auto_291030 ?auto_291040 ) ) ( not ( = ?auto_291030 ?auto_291041 ) ) ( not ( = ?auto_291030 ?auto_291042 ) ) ( not ( = ?auto_291030 ?auto_291043 ) ) ( not ( = ?auto_291031 ?auto_291032 ) ) ( not ( = ?auto_291031 ?auto_291033 ) ) ( not ( = ?auto_291031 ?auto_291034 ) ) ( not ( = ?auto_291031 ?auto_291035 ) ) ( not ( = ?auto_291031 ?auto_291036 ) ) ( not ( = ?auto_291031 ?auto_291037 ) ) ( not ( = ?auto_291031 ?auto_291038 ) ) ( not ( = ?auto_291031 ?auto_291039 ) ) ( not ( = ?auto_291031 ?auto_291040 ) ) ( not ( = ?auto_291031 ?auto_291041 ) ) ( not ( = ?auto_291031 ?auto_291042 ) ) ( not ( = ?auto_291031 ?auto_291043 ) ) ( not ( = ?auto_291032 ?auto_291033 ) ) ( not ( = ?auto_291032 ?auto_291034 ) ) ( not ( = ?auto_291032 ?auto_291035 ) ) ( not ( = ?auto_291032 ?auto_291036 ) ) ( not ( = ?auto_291032 ?auto_291037 ) ) ( not ( = ?auto_291032 ?auto_291038 ) ) ( not ( = ?auto_291032 ?auto_291039 ) ) ( not ( = ?auto_291032 ?auto_291040 ) ) ( not ( = ?auto_291032 ?auto_291041 ) ) ( not ( = ?auto_291032 ?auto_291042 ) ) ( not ( = ?auto_291032 ?auto_291043 ) ) ( not ( = ?auto_291033 ?auto_291034 ) ) ( not ( = ?auto_291033 ?auto_291035 ) ) ( not ( = ?auto_291033 ?auto_291036 ) ) ( not ( = ?auto_291033 ?auto_291037 ) ) ( not ( = ?auto_291033 ?auto_291038 ) ) ( not ( = ?auto_291033 ?auto_291039 ) ) ( not ( = ?auto_291033 ?auto_291040 ) ) ( not ( = ?auto_291033 ?auto_291041 ) ) ( not ( = ?auto_291033 ?auto_291042 ) ) ( not ( = ?auto_291033 ?auto_291043 ) ) ( not ( = ?auto_291034 ?auto_291035 ) ) ( not ( = ?auto_291034 ?auto_291036 ) ) ( not ( = ?auto_291034 ?auto_291037 ) ) ( not ( = ?auto_291034 ?auto_291038 ) ) ( not ( = ?auto_291034 ?auto_291039 ) ) ( not ( = ?auto_291034 ?auto_291040 ) ) ( not ( = ?auto_291034 ?auto_291041 ) ) ( not ( = ?auto_291034 ?auto_291042 ) ) ( not ( = ?auto_291034 ?auto_291043 ) ) ( not ( = ?auto_291035 ?auto_291036 ) ) ( not ( = ?auto_291035 ?auto_291037 ) ) ( not ( = ?auto_291035 ?auto_291038 ) ) ( not ( = ?auto_291035 ?auto_291039 ) ) ( not ( = ?auto_291035 ?auto_291040 ) ) ( not ( = ?auto_291035 ?auto_291041 ) ) ( not ( = ?auto_291035 ?auto_291042 ) ) ( not ( = ?auto_291035 ?auto_291043 ) ) ( not ( = ?auto_291036 ?auto_291037 ) ) ( not ( = ?auto_291036 ?auto_291038 ) ) ( not ( = ?auto_291036 ?auto_291039 ) ) ( not ( = ?auto_291036 ?auto_291040 ) ) ( not ( = ?auto_291036 ?auto_291041 ) ) ( not ( = ?auto_291036 ?auto_291042 ) ) ( not ( = ?auto_291036 ?auto_291043 ) ) ( not ( = ?auto_291037 ?auto_291038 ) ) ( not ( = ?auto_291037 ?auto_291039 ) ) ( not ( = ?auto_291037 ?auto_291040 ) ) ( not ( = ?auto_291037 ?auto_291041 ) ) ( not ( = ?auto_291037 ?auto_291042 ) ) ( not ( = ?auto_291037 ?auto_291043 ) ) ( not ( = ?auto_291038 ?auto_291039 ) ) ( not ( = ?auto_291038 ?auto_291040 ) ) ( not ( = ?auto_291038 ?auto_291041 ) ) ( not ( = ?auto_291038 ?auto_291042 ) ) ( not ( = ?auto_291038 ?auto_291043 ) ) ( not ( = ?auto_291039 ?auto_291040 ) ) ( not ( = ?auto_291039 ?auto_291041 ) ) ( not ( = ?auto_291039 ?auto_291042 ) ) ( not ( = ?auto_291039 ?auto_291043 ) ) ( not ( = ?auto_291040 ?auto_291041 ) ) ( not ( = ?auto_291040 ?auto_291042 ) ) ( not ( = ?auto_291040 ?auto_291043 ) ) ( not ( = ?auto_291041 ?auto_291042 ) ) ( not ( = ?auto_291041 ?auto_291043 ) ) ( not ( = ?auto_291042 ?auto_291043 ) ) ( ON ?auto_291041 ?auto_291042 ) ( ON ?auto_291040 ?auto_291041 ) ( ON ?auto_291039 ?auto_291040 ) ( ON ?auto_291038 ?auto_291039 ) ( ON ?auto_291037 ?auto_291038 ) ( ON ?auto_291036 ?auto_291037 ) ( ON ?auto_291035 ?auto_291036 ) ( ON ?auto_291034 ?auto_291035 ) ( CLEAR ?auto_291032 ) ( ON ?auto_291033 ?auto_291034 ) ( CLEAR ?auto_291033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_291030 ?auto_291031 ?auto_291032 ?auto_291033 )
      ( MAKE-13PILE ?auto_291030 ?auto_291031 ?auto_291032 ?auto_291033 ?auto_291034 ?auto_291035 ?auto_291036 ?auto_291037 ?auto_291038 ?auto_291039 ?auto_291040 ?auto_291041 ?auto_291042 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_291084 - BLOCK
      ?auto_291085 - BLOCK
      ?auto_291086 - BLOCK
      ?auto_291087 - BLOCK
      ?auto_291088 - BLOCK
      ?auto_291089 - BLOCK
      ?auto_291090 - BLOCK
      ?auto_291091 - BLOCK
      ?auto_291092 - BLOCK
      ?auto_291093 - BLOCK
      ?auto_291094 - BLOCK
      ?auto_291095 - BLOCK
      ?auto_291096 - BLOCK
    )
    :vars
    (
      ?auto_291097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291096 ?auto_291097 ) ( ON-TABLE ?auto_291084 ) ( ON ?auto_291085 ?auto_291084 ) ( not ( = ?auto_291084 ?auto_291085 ) ) ( not ( = ?auto_291084 ?auto_291086 ) ) ( not ( = ?auto_291084 ?auto_291087 ) ) ( not ( = ?auto_291084 ?auto_291088 ) ) ( not ( = ?auto_291084 ?auto_291089 ) ) ( not ( = ?auto_291084 ?auto_291090 ) ) ( not ( = ?auto_291084 ?auto_291091 ) ) ( not ( = ?auto_291084 ?auto_291092 ) ) ( not ( = ?auto_291084 ?auto_291093 ) ) ( not ( = ?auto_291084 ?auto_291094 ) ) ( not ( = ?auto_291084 ?auto_291095 ) ) ( not ( = ?auto_291084 ?auto_291096 ) ) ( not ( = ?auto_291084 ?auto_291097 ) ) ( not ( = ?auto_291085 ?auto_291086 ) ) ( not ( = ?auto_291085 ?auto_291087 ) ) ( not ( = ?auto_291085 ?auto_291088 ) ) ( not ( = ?auto_291085 ?auto_291089 ) ) ( not ( = ?auto_291085 ?auto_291090 ) ) ( not ( = ?auto_291085 ?auto_291091 ) ) ( not ( = ?auto_291085 ?auto_291092 ) ) ( not ( = ?auto_291085 ?auto_291093 ) ) ( not ( = ?auto_291085 ?auto_291094 ) ) ( not ( = ?auto_291085 ?auto_291095 ) ) ( not ( = ?auto_291085 ?auto_291096 ) ) ( not ( = ?auto_291085 ?auto_291097 ) ) ( not ( = ?auto_291086 ?auto_291087 ) ) ( not ( = ?auto_291086 ?auto_291088 ) ) ( not ( = ?auto_291086 ?auto_291089 ) ) ( not ( = ?auto_291086 ?auto_291090 ) ) ( not ( = ?auto_291086 ?auto_291091 ) ) ( not ( = ?auto_291086 ?auto_291092 ) ) ( not ( = ?auto_291086 ?auto_291093 ) ) ( not ( = ?auto_291086 ?auto_291094 ) ) ( not ( = ?auto_291086 ?auto_291095 ) ) ( not ( = ?auto_291086 ?auto_291096 ) ) ( not ( = ?auto_291086 ?auto_291097 ) ) ( not ( = ?auto_291087 ?auto_291088 ) ) ( not ( = ?auto_291087 ?auto_291089 ) ) ( not ( = ?auto_291087 ?auto_291090 ) ) ( not ( = ?auto_291087 ?auto_291091 ) ) ( not ( = ?auto_291087 ?auto_291092 ) ) ( not ( = ?auto_291087 ?auto_291093 ) ) ( not ( = ?auto_291087 ?auto_291094 ) ) ( not ( = ?auto_291087 ?auto_291095 ) ) ( not ( = ?auto_291087 ?auto_291096 ) ) ( not ( = ?auto_291087 ?auto_291097 ) ) ( not ( = ?auto_291088 ?auto_291089 ) ) ( not ( = ?auto_291088 ?auto_291090 ) ) ( not ( = ?auto_291088 ?auto_291091 ) ) ( not ( = ?auto_291088 ?auto_291092 ) ) ( not ( = ?auto_291088 ?auto_291093 ) ) ( not ( = ?auto_291088 ?auto_291094 ) ) ( not ( = ?auto_291088 ?auto_291095 ) ) ( not ( = ?auto_291088 ?auto_291096 ) ) ( not ( = ?auto_291088 ?auto_291097 ) ) ( not ( = ?auto_291089 ?auto_291090 ) ) ( not ( = ?auto_291089 ?auto_291091 ) ) ( not ( = ?auto_291089 ?auto_291092 ) ) ( not ( = ?auto_291089 ?auto_291093 ) ) ( not ( = ?auto_291089 ?auto_291094 ) ) ( not ( = ?auto_291089 ?auto_291095 ) ) ( not ( = ?auto_291089 ?auto_291096 ) ) ( not ( = ?auto_291089 ?auto_291097 ) ) ( not ( = ?auto_291090 ?auto_291091 ) ) ( not ( = ?auto_291090 ?auto_291092 ) ) ( not ( = ?auto_291090 ?auto_291093 ) ) ( not ( = ?auto_291090 ?auto_291094 ) ) ( not ( = ?auto_291090 ?auto_291095 ) ) ( not ( = ?auto_291090 ?auto_291096 ) ) ( not ( = ?auto_291090 ?auto_291097 ) ) ( not ( = ?auto_291091 ?auto_291092 ) ) ( not ( = ?auto_291091 ?auto_291093 ) ) ( not ( = ?auto_291091 ?auto_291094 ) ) ( not ( = ?auto_291091 ?auto_291095 ) ) ( not ( = ?auto_291091 ?auto_291096 ) ) ( not ( = ?auto_291091 ?auto_291097 ) ) ( not ( = ?auto_291092 ?auto_291093 ) ) ( not ( = ?auto_291092 ?auto_291094 ) ) ( not ( = ?auto_291092 ?auto_291095 ) ) ( not ( = ?auto_291092 ?auto_291096 ) ) ( not ( = ?auto_291092 ?auto_291097 ) ) ( not ( = ?auto_291093 ?auto_291094 ) ) ( not ( = ?auto_291093 ?auto_291095 ) ) ( not ( = ?auto_291093 ?auto_291096 ) ) ( not ( = ?auto_291093 ?auto_291097 ) ) ( not ( = ?auto_291094 ?auto_291095 ) ) ( not ( = ?auto_291094 ?auto_291096 ) ) ( not ( = ?auto_291094 ?auto_291097 ) ) ( not ( = ?auto_291095 ?auto_291096 ) ) ( not ( = ?auto_291095 ?auto_291097 ) ) ( not ( = ?auto_291096 ?auto_291097 ) ) ( ON ?auto_291095 ?auto_291096 ) ( ON ?auto_291094 ?auto_291095 ) ( ON ?auto_291093 ?auto_291094 ) ( ON ?auto_291092 ?auto_291093 ) ( ON ?auto_291091 ?auto_291092 ) ( ON ?auto_291090 ?auto_291091 ) ( ON ?auto_291089 ?auto_291090 ) ( ON ?auto_291088 ?auto_291089 ) ( ON ?auto_291087 ?auto_291088 ) ( CLEAR ?auto_291085 ) ( ON ?auto_291086 ?auto_291087 ) ( CLEAR ?auto_291086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_291084 ?auto_291085 ?auto_291086 )
      ( MAKE-13PILE ?auto_291084 ?auto_291085 ?auto_291086 ?auto_291087 ?auto_291088 ?auto_291089 ?auto_291090 ?auto_291091 ?auto_291092 ?auto_291093 ?auto_291094 ?auto_291095 ?auto_291096 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_291138 - BLOCK
      ?auto_291139 - BLOCK
      ?auto_291140 - BLOCK
      ?auto_291141 - BLOCK
      ?auto_291142 - BLOCK
      ?auto_291143 - BLOCK
      ?auto_291144 - BLOCK
      ?auto_291145 - BLOCK
      ?auto_291146 - BLOCK
      ?auto_291147 - BLOCK
      ?auto_291148 - BLOCK
      ?auto_291149 - BLOCK
      ?auto_291150 - BLOCK
    )
    :vars
    (
      ?auto_291151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291150 ?auto_291151 ) ( ON-TABLE ?auto_291138 ) ( not ( = ?auto_291138 ?auto_291139 ) ) ( not ( = ?auto_291138 ?auto_291140 ) ) ( not ( = ?auto_291138 ?auto_291141 ) ) ( not ( = ?auto_291138 ?auto_291142 ) ) ( not ( = ?auto_291138 ?auto_291143 ) ) ( not ( = ?auto_291138 ?auto_291144 ) ) ( not ( = ?auto_291138 ?auto_291145 ) ) ( not ( = ?auto_291138 ?auto_291146 ) ) ( not ( = ?auto_291138 ?auto_291147 ) ) ( not ( = ?auto_291138 ?auto_291148 ) ) ( not ( = ?auto_291138 ?auto_291149 ) ) ( not ( = ?auto_291138 ?auto_291150 ) ) ( not ( = ?auto_291138 ?auto_291151 ) ) ( not ( = ?auto_291139 ?auto_291140 ) ) ( not ( = ?auto_291139 ?auto_291141 ) ) ( not ( = ?auto_291139 ?auto_291142 ) ) ( not ( = ?auto_291139 ?auto_291143 ) ) ( not ( = ?auto_291139 ?auto_291144 ) ) ( not ( = ?auto_291139 ?auto_291145 ) ) ( not ( = ?auto_291139 ?auto_291146 ) ) ( not ( = ?auto_291139 ?auto_291147 ) ) ( not ( = ?auto_291139 ?auto_291148 ) ) ( not ( = ?auto_291139 ?auto_291149 ) ) ( not ( = ?auto_291139 ?auto_291150 ) ) ( not ( = ?auto_291139 ?auto_291151 ) ) ( not ( = ?auto_291140 ?auto_291141 ) ) ( not ( = ?auto_291140 ?auto_291142 ) ) ( not ( = ?auto_291140 ?auto_291143 ) ) ( not ( = ?auto_291140 ?auto_291144 ) ) ( not ( = ?auto_291140 ?auto_291145 ) ) ( not ( = ?auto_291140 ?auto_291146 ) ) ( not ( = ?auto_291140 ?auto_291147 ) ) ( not ( = ?auto_291140 ?auto_291148 ) ) ( not ( = ?auto_291140 ?auto_291149 ) ) ( not ( = ?auto_291140 ?auto_291150 ) ) ( not ( = ?auto_291140 ?auto_291151 ) ) ( not ( = ?auto_291141 ?auto_291142 ) ) ( not ( = ?auto_291141 ?auto_291143 ) ) ( not ( = ?auto_291141 ?auto_291144 ) ) ( not ( = ?auto_291141 ?auto_291145 ) ) ( not ( = ?auto_291141 ?auto_291146 ) ) ( not ( = ?auto_291141 ?auto_291147 ) ) ( not ( = ?auto_291141 ?auto_291148 ) ) ( not ( = ?auto_291141 ?auto_291149 ) ) ( not ( = ?auto_291141 ?auto_291150 ) ) ( not ( = ?auto_291141 ?auto_291151 ) ) ( not ( = ?auto_291142 ?auto_291143 ) ) ( not ( = ?auto_291142 ?auto_291144 ) ) ( not ( = ?auto_291142 ?auto_291145 ) ) ( not ( = ?auto_291142 ?auto_291146 ) ) ( not ( = ?auto_291142 ?auto_291147 ) ) ( not ( = ?auto_291142 ?auto_291148 ) ) ( not ( = ?auto_291142 ?auto_291149 ) ) ( not ( = ?auto_291142 ?auto_291150 ) ) ( not ( = ?auto_291142 ?auto_291151 ) ) ( not ( = ?auto_291143 ?auto_291144 ) ) ( not ( = ?auto_291143 ?auto_291145 ) ) ( not ( = ?auto_291143 ?auto_291146 ) ) ( not ( = ?auto_291143 ?auto_291147 ) ) ( not ( = ?auto_291143 ?auto_291148 ) ) ( not ( = ?auto_291143 ?auto_291149 ) ) ( not ( = ?auto_291143 ?auto_291150 ) ) ( not ( = ?auto_291143 ?auto_291151 ) ) ( not ( = ?auto_291144 ?auto_291145 ) ) ( not ( = ?auto_291144 ?auto_291146 ) ) ( not ( = ?auto_291144 ?auto_291147 ) ) ( not ( = ?auto_291144 ?auto_291148 ) ) ( not ( = ?auto_291144 ?auto_291149 ) ) ( not ( = ?auto_291144 ?auto_291150 ) ) ( not ( = ?auto_291144 ?auto_291151 ) ) ( not ( = ?auto_291145 ?auto_291146 ) ) ( not ( = ?auto_291145 ?auto_291147 ) ) ( not ( = ?auto_291145 ?auto_291148 ) ) ( not ( = ?auto_291145 ?auto_291149 ) ) ( not ( = ?auto_291145 ?auto_291150 ) ) ( not ( = ?auto_291145 ?auto_291151 ) ) ( not ( = ?auto_291146 ?auto_291147 ) ) ( not ( = ?auto_291146 ?auto_291148 ) ) ( not ( = ?auto_291146 ?auto_291149 ) ) ( not ( = ?auto_291146 ?auto_291150 ) ) ( not ( = ?auto_291146 ?auto_291151 ) ) ( not ( = ?auto_291147 ?auto_291148 ) ) ( not ( = ?auto_291147 ?auto_291149 ) ) ( not ( = ?auto_291147 ?auto_291150 ) ) ( not ( = ?auto_291147 ?auto_291151 ) ) ( not ( = ?auto_291148 ?auto_291149 ) ) ( not ( = ?auto_291148 ?auto_291150 ) ) ( not ( = ?auto_291148 ?auto_291151 ) ) ( not ( = ?auto_291149 ?auto_291150 ) ) ( not ( = ?auto_291149 ?auto_291151 ) ) ( not ( = ?auto_291150 ?auto_291151 ) ) ( ON ?auto_291149 ?auto_291150 ) ( ON ?auto_291148 ?auto_291149 ) ( ON ?auto_291147 ?auto_291148 ) ( ON ?auto_291146 ?auto_291147 ) ( ON ?auto_291145 ?auto_291146 ) ( ON ?auto_291144 ?auto_291145 ) ( ON ?auto_291143 ?auto_291144 ) ( ON ?auto_291142 ?auto_291143 ) ( ON ?auto_291141 ?auto_291142 ) ( ON ?auto_291140 ?auto_291141 ) ( CLEAR ?auto_291138 ) ( ON ?auto_291139 ?auto_291140 ) ( CLEAR ?auto_291139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_291138 ?auto_291139 )
      ( MAKE-13PILE ?auto_291138 ?auto_291139 ?auto_291140 ?auto_291141 ?auto_291142 ?auto_291143 ?auto_291144 ?auto_291145 ?auto_291146 ?auto_291147 ?auto_291148 ?auto_291149 ?auto_291150 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_291192 - BLOCK
      ?auto_291193 - BLOCK
      ?auto_291194 - BLOCK
      ?auto_291195 - BLOCK
      ?auto_291196 - BLOCK
      ?auto_291197 - BLOCK
      ?auto_291198 - BLOCK
      ?auto_291199 - BLOCK
      ?auto_291200 - BLOCK
      ?auto_291201 - BLOCK
      ?auto_291202 - BLOCK
      ?auto_291203 - BLOCK
      ?auto_291204 - BLOCK
    )
    :vars
    (
      ?auto_291205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291204 ?auto_291205 ) ( not ( = ?auto_291192 ?auto_291193 ) ) ( not ( = ?auto_291192 ?auto_291194 ) ) ( not ( = ?auto_291192 ?auto_291195 ) ) ( not ( = ?auto_291192 ?auto_291196 ) ) ( not ( = ?auto_291192 ?auto_291197 ) ) ( not ( = ?auto_291192 ?auto_291198 ) ) ( not ( = ?auto_291192 ?auto_291199 ) ) ( not ( = ?auto_291192 ?auto_291200 ) ) ( not ( = ?auto_291192 ?auto_291201 ) ) ( not ( = ?auto_291192 ?auto_291202 ) ) ( not ( = ?auto_291192 ?auto_291203 ) ) ( not ( = ?auto_291192 ?auto_291204 ) ) ( not ( = ?auto_291192 ?auto_291205 ) ) ( not ( = ?auto_291193 ?auto_291194 ) ) ( not ( = ?auto_291193 ?auto_291195 ) ) ( not ( = ?auto_291193 ?auto_291196 ) ) ( not ( = ?auto_291193 ?auto_291197 ) ) ( not ( = ?auto_291193 ?auto_291198 ) ) ( not ( = ?auto_291193 ?auto_291199 ) ) ( not ( = ?auto_291193 ?auto_291200 ) ) ( not ( = ?auto_291193 ?auto_291201 ) ) ( not ( = ?auto_291193 ?auto_291202 ) ) ( not ( = ?auto_291193 ?auto_291203 ) ) ( not ( = ?auto_291193 ?auto_291204 ) ) ( not ( = ?auto_291193 ?auto_291205 ) ) ( not ( = ?auto_291194 ?auto_291195 ) ) ( not ( = ?auto_291194 ?auto_291196 ) ) ( not ( = ?auto_291194 ?auto_291197 ) ) ( not ( = ?auto_291194 ?auto_291198 ) ) ( not ( = ?auto_291194 ?auto_291199 ) ) ( not ( = ?auto_291194 ?auto_291200 ) ) ( not ( = ?auto_291194 ?auto_291201 ) ) ( not ( = ?auto_291194 ?auto_291202 ) ) ( not ( = ?auto_291194 ?auto_291203 ) ) ( not ( = ?auto_291194 ?auto_291204 ) ) ( not ( = ?auto_291194 ?auto_291205 ) ) ( not ( = ?auto_291195 ?auto_291196 ) ) ( not ( = ?auto_291195 ?auto_291197 ) ) ( not ( = ?auto_291195 ?auto_291198 ) ) ( not ( = ?auto_291195 ?auto_291199 ) ) ( not ( = ?auto_291195 ?auto_291200 ) ) ( not ( = ?auto_291195 ?auto_291201 ) ) ( not ( = ?auto_291195 ?auto_291202 ) ) ( not ( = ?auto_291195 ?auto_291203 ) ) ( not ( = ?auto_291195 ?auto_291204 ) ) ( not ( = ?auto_291195 ?auto_291205 ) ) ( not ( = ?auto_291196 ?auto_291197 ) ) ( not ( = ?auto_291196 ?auto_291198 ) ) ( not ( = ?auto_291196 ?auto_291199 ) ) ( not ( = ?auto_291196 ?auto_291200 ) ) ( not ( = ?auto_291196 ?auto_291201 ) ) ( not ( = ?auto_291196 ?auto_291202 ) ) ( not ( = ?auto_291196 ?auto_291203 ) ) ( not ( = ?auto_291196 ?auto_291204 ) ) ( not ( = ?auto_291196 ?auto_291205 ) ) ( not ( = ?auto_291197 ?auto_291198 ) ) ( not ( = ?auto_291197 ?auto_291199 ) ) ( not ( = ?auto_291197 ?auto_291200 ) ) ( not ( = ?auto_291197 ?auto_291201 ) ) ( not ( = ?auto_291197 ?auto_291202 ) ) ( not ( = ?auto_291197 ?auto_291203 ) ) ( not ( = ?auto_291197 ?auto_291204 ) ) ( not ( = ?auto_291197 ?auto_291205 ) ) ( not ( = ?auto_291198 ?auto_291199 ) ) ( not ( = ?auto_291198 ?auto_291200 ) ) ( not ( = ?auto_291198 ?auto_291201 ) ) ( not ( = ?auto_291198 ?auto_291202 ) ) ( not ( = ?auto_291198 ?auto_291203 ) ) ( not ( = ?auto_291198 ?auto_291204 ) ) ( not ( = ?auto_291198 ?auto_291205 ) ) ( not ( = ?auto_291199 ?auto_291200 ) ) ( not ( = ?auto_291199 ?auto_291201 ) ) ( not ( = ?auto_291199 ?auto_291202 ) ) ( not ( = ?auto_291199 ?auto_291203 ) ) ( not ( = ?auto_291199 ?auto_291204 ) ) ( not ( = ?auto_291199 ?auto_291205 ) ) ( not ( = ?auto_291200 ?auto_291201 ) ) ( not ( = ?auto_291200 ?auto_291202 ) ) ( not ( = ?auto_291200 ?auto_291203 ) ) ( not ( = ?auto_291200 ?auto_291204 ) ) ( not ( = ?auto_291200 ?auto_291205 ) ) ( not ( = ?auto_291201 ?auto_291202 ) ) ( not ( = ?auto_291201 ?auto_291203 ) ) ( not ( = ?auto_291201 ?auto_291204 ) ) ( not ( = ?auto_291201 ?auto_291205 ) ) ( not ( = ?auto_291202 ?auto_291203 ) ) ( not ( = ?auto_291202 ?auto_291204 ) ) ( not ( = ?auto_291202 ?auto_291205 ) ) ( not ( = ?auto_291203 ?auto_291204 ) ) ( not ( = ?auto_291203 ?auto_291205 ) ) ( not ( = ?auto_291204 ?auto_291205 ) ) ( ON ?auto_291203 ?auto_291204 ) ( ON ?auto_291202 ?auto_291203 ) ( ON ?auto_291201 ?auto_291202 ) ( ON ?auto_291200 ?auto_291201 ) ( ON ?auto_291199 ?auto_291200 ) ( ON ?auto_291198 ?auto_291199 ) ( ON ?auto_291197 ?auto_291198 ) ( ON ?auto_291196 ?auto_291197 ) ( ON ?auto_291195 ?auto_291196 ) ( ON ?auto_291194 ?auto_291195 ) ( ON ?auto_291193 ?auto_291194 ) ( ON ?auto_291192 ?auto_291193 ) ( CLEAR ?auto_291192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_291192 )
      ( MAKE-13PILE ?auto_291192 ?auto_291193 ?auto_291194 ?auto_291195 ?auto_291196 ?auto_291197 ?auto_291198 ?auto_291199 ?auto_291200 ?auto_291201 ?auto_291202 ?auto_291203 ?auto_291204 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291247 - BLOCK
      ?auto_291248 - BLOCK
      ?auto_291249 - BLOCK
      ?auto_291250 - BLOCK
      ?auto_291251 - BLOCK
      ?auto_291252 - BLOCK
      ?auto_291253 - BLOCK
      ?auto_291254 - BLOCK
      ?auto_291255 - BLOCK
      ?auto_291256 - BLOCK
      ?auto_291257 - BLOCK
      ?auto_291258 - BLOCK
      ?auto_291259 - BLOCK
      ?auto_291260 - BLOCK
    )
    :vars
    (
      ?auto_291261 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_291259 ) ( ON ?auto_291260 ?auto_291261 ) ( CLEAR ?auto_291260 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_291247 ) ( ON ?auto_291248 ?auto_291247 ) ( ON ?auto_291249 ?auto_291248 ) ( ON ?auto_291250 ?auto_291249 ) ( ON ?auto_291251 ?auto_291250 ) ( ON ?auto_291252 ?auto_291251 ) ( ON ?auto_291253 ?auto_291252 ) ( ON ?auto_291254 ?auto_291253 ) ( ON ?auto_291255 ?auto_291254 ) ( ON ?auto_291256 ?auto_291255 ) ( ON ?auto_291257 ?auto_291256 ) ( ON ?auto_291258 ?auto_291257 ) ( ON ?auto_291259 ?auto_291258 ) ( not ( = ?auto_291247 ?auto_291248 ) ) ( not ( = ?auto_291247 ?auto_291249 ) ) ( not ( = ?auto_291247 ?auto_291250 ) ) ( not ( = ?auto_291247 ?auto_291251 ) ) ( not ( = ?auto_291247 ?auto_291252 ) ) ( not ( = ?auto_291247 ?auto_291253 ) ) ( not ( = ?auto_291247 ?auto_291254 ) ) ( not ( = ?auto_291247 ?auto_291255 ) ) ( not ( = ?auto_291247 ?auto_291256 ) ) ( not ( = ?auto_291247 ?auto_291257 ) ) ( not ( = ?auto_291247 ?auto_291258 ) ) ( not ( = ?auto_291247 ?auto_291259 ) ) ( not ( = ?auto_291247 ?auto_291260 ) ) ( not ( = ?auto_291247 ?auto_291261 ) ) ( not ( = ?auto_291248 ?auto_291249 ) ) ( not ( = ?auto_291248 ?auto_291250 ) ) ( not ( = ?auto_291248 ?auto_291251 ) ) ( not ( = ?auto_291248 ?auto_291252 ) ) ( not ( = ?auto_291248 ?auto_291253 ) ) ( not ( = ?auto_291248 ?auto_291254 ) ) ( not ( = ?auto_291248 ?auto_291255 ) ) ( not ( = ?auto_291248 ?auto_291256 ) ) ( not ( = ?auto_291248 ?auto_291257 ) ) ( not ( = ?auto_291248 ?auto_291258 ) ) ( not ( = ?auto_291248 ?auto_291259 ) ) ( not ( = ?auto_291248 ?auto_291260 ) ) ( not ( = ?auto_291248 ?auto_291261 ) ) ( not ( = ?auto_291249 ?auto_291250 ) ) ( not ( = ?auto_291249 ?auto_291251 ) ) ( not ( = ?auto_291249 ?auto_291252 ) ) ( not ( = ?auto_291249 ?auto_291253 ) ) ( not ( = ?auto_291249 ?auto_291254 ) ) ( not ( = ?auto_291249 ?auto_291255 ) ) ( not ( = ?auto_291249 ?auto_291256 ) ) ( not ( = ?auto_291249 ?auto_291257 ) ) ( not ( = ?auto_291249 ?auto_291258 ) ) ( not ( = ?auto_291249 ?auto_291259 ) ) ( not ( = ?auto_291249 ?auto_291260 ) ) ( not ( = ?auto_291249 ?auto_291261 ) ) ( not ( = ?auto_291250 ?auto_291251 ) ) ( not ( = ?auto_291250 ?auto_291252 ) ) ( not ( = ?auto_291250 ?auto_291253 ) ) ( not ( = ?auto_291250 ?auto_291254 ) ) ( not ( = ?auto_291250 ?auto_291255 ) ) ( not ( = ?auto_291250 ?auto_291256 ) ) ( not ( = ?auto_291250 ?auto_291257 ) ) ( not ( = ?auto_291250 ?auto_291258 ) ) ( not ( = ?auto_291250 ?auto_291259 ) ) ( not ( = ?auto_291250 ?auto_291260 ) ) ( not ( = ?auto_291250 ?auto_291261 ) ) ( not ( = ?auto_291251 ?auto_291252 ) ) ( not ( = ?auto_291251 ?auto_291253 ) ) ( not ( = ?auto_291251 ?auto_291254 ) ) ( not ( = ?auto_291251 ?auto_291255 ) ) ( not ( = ?auto_291251 ?auto_291256 ) ) ( not ( = ?auto_291251 ?auto_291257 ) ) ( not ( = ?auto_291251 ?auto_291258 ) ) ( not ( = ?auto_291251 ?auto_291259 ) ) ( not ( = ?auto_291251 ?auto_291260 ) ) ( not ( = ?auto_291251 ?auto_291261 ) ) ( not ( = ?auto_291252 ?auto_291253 ) ) ( not ( = ?auto_291252 ?auto_291254 ) ) ( not ( = ?auto_291252 ?auto_291255 ) ) ( not ( = ?auto_291252 ?auto_291256 ) ) ( not ( = ?auto_291252 ?auto_291257 ) ) ( not ( = ?auto_291252 ?auto_291258 ) ) ( not ( = ?auto_291252 ?auto_291259 ) ) ( not ( = ?auto_291252 ?auto_291260 ) ) ( not ( = ?auto_291252 ?auto_291261 ) ) ( not ( = ?auto_291253 ?auto_291254 ) ) ( not ( = ?auto_291253 ?auto_291255 ) ) ( not ( = ?auto_291253 ?auto_291256 ) ) ( not ( = ?auto_291253 ?auto_291257 ) ) ( not ( = ?auto_291253 ?auto_291258 ) ) ( not ( = ?auto_291253 ?auto_291259 ) ) ( not ( = ?auto_291253 ?auto_291260 ) ) ( not ( = ?auto_291253 ?auto_291261 ) ) ( not ( = ?auto_291254 ?auto_291255 ) ) ( not ( = ?auto_291254 ?auto_291256 ) ) ( not ( = ?auto_291254 ?auto_291257 ) ) ( not ( = ?auto_291254 ?auto_291258 ) ) ( not ( = ?auto_291254 ?auto_291259 ) ) ( not ( = ?auto_291254 ?auto_291260 ) ) ( not ( = ?auto_291254 ?auto_291261 ) ) ( not ( = ?auto_291255 ?auto_291256 ) ) ( not ( = ?auto_291255 ?auto_291257 ) ) ( not ( = ?auto_291255 ?auto_291258 ) ) ( not ( = ?auto_291255 ?auto_291259 ) ) ( not ( = ?auto_291255 ?auto_291260 ) ) ( not ( = ?auto_291255 ?auto_291261 ) ) ( not ( = ?auto_291256 ?auto_291257 ) ) ( not ( = ?auto_291256 ?auto_291258 ) ) ( not ( = ?auto_291256 ?auto_291259 ) ) ( not ( = ?auto_291256 ?auto_291260 ) ) ( not ( = ?auto_291256 ?auto_291261 ) ) ( not ( = ?auto_291257 ?auto_291258 ) ) ( not ( = ?auto_291257 ?auto_291259 ) ) ( not ( = ?auto_291257 ?auto_291260 ) ) ( not ( = ?auto_291257 ?auto_291261 ) ) ( not ( = ?auto_291258 ?auto_291259 ) ) ( not ( = ?auto_291258 ?auto_291260 ) ) ( not ( = ?auto_291258 ?auto_291261 ) ) ( not ( = ?auto_291259 ?auto_291260 ) ) ( not ( = ?auto_291259 ?auto_291261 ) ) ( not ( = ?auto_291260 ?auto_291261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_291260 ?auto_291261 )
      ( !STACK ?auto_291260 ?auto_291259 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291276 - BLOCK
      ?auto_291277 - BLOCK
      ?auto_291278 - BLOCK
      ?auto_291279 - BLOCK
      ?auto_291280 - BLOCK
      ?auto_291281 - BLOCK
      ?auto_291282 - BLOCK
      ?auto_291283 - BLOCK
      ?auto_291284 - BLOCK
      ?auto_291285 - BLOCK
      ?auto_291286 - BLOCK
      ?auto_291287 - BLOCK
      ?auto_291288 - BLOCK
      ?auto_291289 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_291288 ) ( ON-TABLE ?auto_291289 ) ( CLEAR ?auto_291289 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_291276 ) ( ON ?auto_291277 ?auto_291276 ) ( ON ?auto_291278 ?auto_291277 ) ( ON ?auto_291279 ?auto_291278 ) ( ON ?auto_291280 ?auto_291279 ) ( ON ?auto_291281 ?auto_291280 ) ( ON ?auto_291282 ?auto_291281 ) ( ON ?auto_291283 ?auto_291282 ) ( ON ?auto_291284 ?auto_291283 ) ( ON ?auto_291285 ?auto_291284 ) ( ON ?auto_291286 ?auto_291285 ) ( ON ?auto_291287 ?auto_291286 ) ( ON ?auto_291288 ?auto_291287 ) ( not ( = ?auto_291276 ?auto_291277 ) ) ( not ( = ?auto_291276 ?auto_291278 ) ) ( not ( = ?auto_291276 ?auto_291279 ) ) ( not ( = ?auto_291276 ?auto_291280 ) ) ( not ( = ?auto_291276 ?auto_291281 ) ) ( not ( = ?auto_291276 ?auto_291282 ) ) ( not ( = ?auto_291276 ?auto_291283 ) ) ( not ( = ?auto_291276 ?auto_291284 ) ) ( not ( = ?auto_291276 ?auto_291285 ) ) ( not ( = ?auto_291276 ?auto_291286 ) ) ( not ( = ?auto_291276 ?auto_291287 ) ) ( not ( = ?auto_291276 ?auto_291288 ) ) ( not ( = ?auto_291276 ?auto_291289 ) ) ( not ( = ?auto_291277 ?auto_291278 ) ) ( not ( = ?auto_291277 ?auto_291279 ) ) ( not ( = ?auto_291277 ?auto_291280 ) ) ( not ( = ?auto_291277 ?auto_291281 ) ) ( not ( = ?auto_291277 ?auto_291282 ) ) ( not ( = ?auto_291277 ?auto_291283 ) ) ( not ( = ?auto_291277 ?auto_291284 ) ) ( not ( = ?auto_291277 ?auto_291285 ) ) ( not ( = ?auto_291277 ?auto_291286 ) ) ( not ( = ?auto_291277 ?auto_291287 ) ) ( not ( = ?auto_291277 ?auto_291288 ) ) ( not ( = ?auto_291277 ?auto_291289 ) ) ( not ( = ?auto_291278 ?auto_291279 ) ) ( not ( = ?auto_291278 ?auto_291280 ) ) ( not ( = ?auto_291278 ?auto_291281 ) ) ( not ( = ?auto_291278 ?auto_291282 ) ) ( not ( = ?auto_291278 ?auto_291283 ) ) ( not ( = ?auto_291278 ?auto_291284 ) ) ( not ( = ?auto_291278 ?auto_291285 ) ) ( not ( = ?auto_291278 ?auto_291286 ) ) ( not ( = ?auto_291278 ?auto_291287 ) ) ( not ( = ?auto_291278 ?auto_291288 ) ) ( not ( = ?auto_291278 ?auto_291289 ) ) ( not ( = ?auto_291279 ?auto_291280 ) ) ( not ( = ?auto_291279 ?auto_291281 ) ) ( not ( = ?auto_291279 ?auto_291282 ) ) ( not ( = ?auto_291279 ?auto_291283 ) ) ( not ( = ?auto_291279 ?auto_291284 ) ) ( not ( = ?auto_291279 ?auto_291285 ) ) ( not ( = ?auto_291279 ?auto_291286 ) ) ( not ( = ?auto_291279 ?auto_291287 ) ) ( not ( = ?auto_291279 ?auto_291288 ) ) ( not ( = ?auto_291279 ?auto_291289 ) ) ( not ( = ?auto_291280 ?auto_291281 ) ) ( not ( = ?auto_291280 ?auto_291282 ) ) ( not ( = ?auto_291280 ?auto_291283 ) ) ( not ( = ?auto_291280 ?auto_291284 ) ) ( not ( = ?auto_291280 ?auto_291285 ) ) ( not ( = ?auto_291280 ?auto_291286 ) ) ( not ( = ?auto_291280 ?auto_291287 ) ) ( not ( = ?auto_291280 ?auto_291288 ) ) ( not ( = ?auto_291280 ?auto_291289 ) ) ( not ( = ?auto_291281 ?auto_291282 ) ) ( not ( = ?auto_291281 ?auto_291283 ) ) ( not ( = ?auto_291281 ?auto_291284 ) ) ( not ( = ?auto_291281 ?auto_291285 ) ) ( not ( = ?auto_291281 ?auto_291286 ) ) ( not ( = ?auto_291281 ?auto_291287 ) ) ( not ( = ?auto_291281 ?auto_291288 ) ) ( not ( = ?auto_291281 ?auto_291289 ) ) ( not ( = ?auto_291282 ?auto_291283 ) ) ( not ( = ?auto_291282 ?auto_291284 ) ) ( not ( = ?auto_291282 ?auto_291285 ) ) ( not ( = ?auto_291282 ?auto_291286 ) ) ( not ( = ?auto_291282 ?auto_291287 ) ) ( not ( = ?auto_291282 ?auto_291288 ) ) ( not ( = ?auto_291282 ?auto_291289 ) ) ( not ( = ?auto_291283 ?auto_291284 ) ) ( not ( = ?auto_291283 ?auto_291285 ) ) ( not ( = ?auto_291283 ?auto_291286 ) ) ( not ( = ?auto_291283 ?auto_291287 ) ) ( not ( = ?auto_291283 ?auto_291288 ) ) ( not ( = ?auto_291283 ?auto_291289 ) ) ( not ( = ?auto_291284 ?auto_291285 ) ) ( not ( = ?auto_291284 ?auto_291286 ) ) ( not ( = ?auto_291284 ?auto_291287 ) ) ( not ( = ?auto_291284 ?auto_291288 ) ) ( not ( = ?auto_291284 ?auto_291289 ) ) ( not ( = ?auto_291285 ?auto_291286 ) ) ( not ( = ?auto_291285 ?auto_291287 ) ) ( not ( = ?auto_291285 ?auto_291288 ) ) ( not ( = ?auto_291285 ?auto_291289 ) ) ( not ( = ?auto_291286 ?auto_291287 ) ) ( not ( = ?auto_291286 ?auto_291288 ) ) ( not ( = ?auto_291286 ?auto_291289 ) ) ( not ( = ?auto_291287 ?auto_291288 ) ) ( not ( = ?auto_291287 ?auto_291289 ) ) ( not ( = ?auto_291288 ?auto_291289 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_291289 )
      ( !STACK ?auto_291289 ?auto_291288 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291304 - BLOCK
      ?auto_291305 - BLOCK
      ?auto_291306 - BLOCK
      ?auto_291307 - BLOCK
      ?auto_291308 - BLOCK
      ?auto_291309 - BLOCK
      ?auto_291310 - BLOCK
      ?auto_291311 - BLOCK
      ?auto_291312 - BLOCK
      ?auto_291313 - BLOCK
      ?auto_291314 - BLOCK
      ?auto_291315 - BLOCK
      ?auto_291316 - BLOCK
      ?auto_291317 - BLOCK
    )
    :vars
    (
      ?auto_291318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291317 ?auto_291318 ) ( ON-TABLE ?auto_291304 ) ( ON ?auto_291305 ?auto_291304 ) ( ON ?auto_291306 ?auto_291305 ) ( ON ?auto_291307 ?auto_291306 ) ( ON ?auto_291308 ?auto_291307 ) ( ON ?auto_291309 ?auto_291308 ) ( ON ?auto_291310 ?auto_291309 ) ( ON ?auto_291311 ?auto_291310 ) ( ON ?auto_291312 ?auto_291311 ) ( ON ?auto_291313 ?auto_291312 ) ( ON ?auto_291314 ?auto_291313 ) ( ON ?auto_291315 ?auto_291314 ) ( not ( = ?auto_291304 ?auto_291305 ) ) ( not ( = ?auto_291304 ?auto_291306 ) ) ( not ( = ?auto_291304 ?auto_291307 ) ) ( not ( = ?auto_291304 ?auto_291308 ) ) ( not ( = ?auto_291304 ?auto_291309 ) ) ( not ( = ?auto_291304 ?auto_291310 ) ) ( not ( = ?auto_291304 ?auto_291311 ) ) ( not ( = ?auto_291304 ?auto_291312 ) ) ( not ( = ?auto_291304 ?auto_291313 ) ) ( not ( = ?auto_291304 ?auto_291314 ) ) ( not ( = ?auto_291304 ?auto_291315 ) ) ( not ( = ?auto_291304 ?auto_291316 ) ) ( not ( = ?auto_291304 ?auto_291317 ) ) ( not ( = ?auto_291304 ?auto_291318 ) ) ( not ( = ?auto_291305 ?auto_291306 ) ) ( not ( = ?auto_291305 ?auto_291307 ) ) ( not ( = ?auto_291305 ?auto_291308 ) ) ( not ( = ?auto_291305 ?auto_291309 ) ) ( not ( = ?auto_291305 ?auto_291310 ) ) ( not ( = ?auto_291305 ?auto_291311 ) ) ( not ( = ?auto_291305 ?auto_291312 ) ) ( not ( = ?auto_291305 ?auto_291313 ) ) ( not ( = ?auto_291305 ?auto_291314 ) ) ( not ( = ?auto_291305 ?auto_291315 ) ) ( not ( = ?auto_291305 ?auto_291316 ) ) ( not ( = ?auto_291305 ?auto_291317 ) ) ( not ( = ?auto_291305 ?auto_291318 ) ) ( not ( = ?auto_291306 ?auto_291307 ) ) ( not ( = ?auto_291306 ?auto_291308 ) ) ( not ( = ?auto_291306 ?auto_291309 ) ) ( not ( = ?auto_291306 ?auto_291310 ) ) ( not ( = ?auto_291306 ?auto_291311 ) ) ( not ( = ?auto_291306 ?auto_291312 ) ) ( not ( = ?auto_291306 ?auto_291313 ) ) ( not ( = ?auto_291306 ?auto_291314 ) ) ( not ( = ?auto_291306 ?auto_291315 ) ) ( not ( = ?auto_291306 ?auto_291316 ) ) ( not ( = ?auto_291306 ?auto_291317 ) ) ( not ( = ?auto_291306 ?auto_291318 ) ) ( not ( = ?auto_291307 ?auto_291308 ) ) ( not ( = ?auto_291307 ?auto_291309 ) ) ( not ( = ?auto_291307 ?auto_291310 ) ) ( not ( = ?auto_291307 ?auto_291311 ) ) ( not ( = ?auto_291307 ?auto_291312 ) ) ( not ( = ?auto_291307 ?auto_291313 ) ) ( not ( = ?auto_291307 ?auto_291314 ) ) ( not ( = ?auto_291307 ?auto_291315 ) ) ( not ( = ?auto_291307 ?auto_291316 ) ) ( not ( = ?auto_291307 ?auto_291317 ) ) ( not ( = ?auto_291307 ?auto_291318 ) ) ( not ( = ?auto_291308 ?auto_291309 ) ) ( not ( = ?auto_291308 ?auto_291310 ) ) ( not ( = ?auto_291308 ?auto_291311 ) ) ( not ( = ?auto_291308 ?auto_291312 ) ) ( not ( = ?auto_291308 ?auto_291313 ) ) ( not ( = ?auto_291308 ?auto_291314 ) ) ( not ( = ?auto_291308 ?auto_291315 ) ) ( not ( = ?auto_291308 ?auto_291316 ) ) ( not ( = ?auto_291308 ?auto_291317 ) ) ( not ( = ?auto_291308 ?auto_291318 ) ) ( not ( = ?auto_291309 ?auto_291310 ) ) ( not ( = ?auto_291309 ?auto_291311 ) ) ( not ( = ?auto_291309 ?auto_291312 ) ) ( not ( = ?auto_291309 ?auto_291313 ) ) ( not ( = ?auto_291309 ?auto_291314 ) ) ( not ( = ?auto_291309 ?auto_291315 ) ) ( not ( = ?auto_291309 ?auto_291316 ) ) ( not ( = ?auto_291309 ?auto_291317 ) ) ( not ( = ?auto_291309 ?auto_291318 ) ) ( not ( = ?auto_291310 ?auto_291311 ) ) ( not ( = ?auto_291310 ?auto_291312 ) ) ( not ( = ?auto_291310 ?auto_291313 ) ) ( not ( = ?auto_291310 ?auto_291314 ) ) ( not ( = ?auto_291310 ?auto_291315 ) ) ( not ( = ?auto_291310 ?auto_291316 ) ) ( not ( = ?auto_291310 ?auto_291317 ) ) ( not ( = ?auto_291310 ?auto_291318 ) ) ( not ( = ?auto_291311 ?auto_291312 ) ) ( not ( = ?auto_291311 ?auto_291313 ) ) ( not ( = ?auto_291311 ?auto_291314 ) ) ( not ( = ?auto_291311 ?auto_291315 ) ) ( not ( = ?auto_291311 ?auto_291316 ) ) ( not ( = ?auto_291311 ?auto_291317 ) ) ( not ( = ?auto_291311 ?auto_291318 ) ) ( not ( = ?auto_291312 ?auto_291313 ) ) ( not ( = ?auto_291312 ?auto_291314 ) ) ( not ( = ?auto_291312 ?auto_291315 ) ) ( not ( = ?auto_291312 ?auto_291316 ) ) ( not ( = ?auto_291312 ?auto_291317 ) ) ( not ( = ?auto_291312 ?auto_291318 ) ) ( not ( = ?auto_291313 ?auto_291314 ) ) ( not ( = ?auto_291313 ?auto_291315 ) ) ( not ( = ?auto_291313 ?auto_291316 ) ) ( not ( = ?auto_291313 ?auto_291317 ) ) ( not ( = ?auto_291313 ?auto_291318 ) ) ( not ( = ?auto_291314 ?auto_291315 ) ) ( not ( = ?auto_291314 ?auto_291316 ) ) ( not ( = ?auto_291314 ?auto_291317 ) ) ( not ( = ?auto_291314 ?auto_291318 ) ) ( not ( = ?auto_291315 ?auto_291316 ) ) ( not ( = ?auto_291315 ?auto_291317 ) ) ( not ( = ?auto_291315 ?auto_291318 ) ) ( not ( = ?auto_291316 ?auto_291317 ) ) ( not ( = ?auto_291316 ?auto_291318 ) ) ( not ( = ?auto_291317 ?auto_291318 ) ) ( CLEAR ?auto_291315 ) ( ON ?auto_291316 ?auto_291317 ) ( CLEAR ?auto_291316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_291304 ?auto_291305 ?auto_291306 ?auto_291307 ?auto_291308 ?auto_291309 ?auto_291310 ?auto_291311 ?auto_291312 ?auto_291313 ?auto_291314 ?auto_291315 ?auto_291316 )
      ( MAKE-14PILE ?auto_291304 ?auto_291305 ?auto_291306 ?auto_291307 ?auto_291308 ?auto_291309 ?auto_291310 ?auto_291311 ?auto_291312 ?auto_291313 ?auto_291314 ?auto_291315 ?auto_291316 ?auto_291317 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291333 - BLOCK
      ?auto_291334 - BLOCK
      ?auto_291335 - BLOCK
      ?auto_291336 - BLOCK
      ?auto_291337 - BLOCK
      ?auto_291338 - BLOCK
      ?auto_291339 - BLOCK
      ?auto_291340 - BLOCK
      ?auto_291341 - BLOCK
      ?auto_291342 - BLOCK
      ?auto_291343 - BLOCK
      ?auto_291344 - BLOCK
      ?auto_291345 - BLOCK
      ?auto_291346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291346 ) ( ON-TABLE ?auto_291333 ) ( ON ?auto_291334 ?auto_291333 ) ( ON ?auto_291335 ?auto_291334 ) ( ON ?auto_291336 ?auto_291335 ) ( ON ?auto_291337 ?auto_291336 ) ( ON ?auto_291338 ?auto_291337 ) ( ON ?auto_291339 ?auto_291338 ) ( ON ?auto_291340 ?auto_291339 ) ( ON ?auto_291341 ?auto_291340 ) ( ON ?auto_291342 ?auto_291341 ) ( ON ?auto_291343 ?auto_291342 ) ( ON ?auto_291344 ?auto_291343 ) ( not ( = ?auto_291333 ?auto_291334 ) ) ( not ( = ?auto_291333 ?auto_291335 ) ) ( not ( = ?auto_291333 ?auto_291336 ) ) ( not ( = ?auto_291333 ?auto_291337 ) ) ( not ( = ?auto_291333 ?auto_291338 ) ) ( not ( = ?auto_291333 ?auto_291339 ) ) ( not ( = ?auto_291333 ?auto_291340 ) ) ( not ( = ?auto_291333 ?auto_291341 ) ) ( not ( = ?auto_291333 ?auto_291342 ) ) ( not ( = ?auto_291333 ?auto_291343 ) ) ( not ( = ?auto_291333 ?auto_291344 ) ) ( not ( = ?auto_291333 ?auto_291345 ) ) ( not ( = ?auto_291333 ?auto_291346 ) ) ( not ( = ?auto_291334 ?auto_291335 ) ) ( not ( = ?auto_291334 ?auto_291336 ) ) ( not ( = ?auto_291334 ?auto_291337 ) ) ( not ( = ?auto_291334 ?auto_291338 ) ) ( not ( = ?auto_291334 ?auto_291339 ) ) ( not ( = ?auto_291334 ?auto_291340 ) ) ( not ( = ?auto_291334 ?auto_291341 ) ) ( not ( = ?auto_291334 ?auto_291342 ) ) ( not ( = ?auto_291334 ?auto_291343 ) ) ( not ( = ?auto_291334 ?auto_291344 ) ) ( not ( = ?auto_291334 ?auto_291345 ) ) ( not ( = ?auto_291334 ?auto_291346 ) ) ( not ( = ?auto_291335 ?auto_291336 ) ) ( not ( = ?auto_291335 ?auto_291337 ) ) ( not ( = ?auto_291335 ?auto_291338 ) ) ( not ( = ?auto_291335 ?auto_291339 ) ) ( not ( = ?auto_291335 ?auto_291340 ) ) ( not ( = ?auto_291335 ?auto_291341 ) ) ( not ( = ?auto_291335 ?auto_291342 ) ) ( not ( = ?auto_291335 ?auto_291343 ) ) ( not ( = ?auto_291335 ?auto_291344 ) ) ( not ( = ?auto_291335 ?auto_291345 ) ) ( not ( = ?auto_291335 ?auto_291346 ) ) ( not ( = ?auto_291336 ?auto_291337 ) ) ( not ( = ?auto_291336 ?auto_291338 ) ) ( not ( = ?auto_291336 ?auto_291339 ) ) ( not ( = ?auto_291336 ?auto_291340 ) ) ( not ( = ?auto_291336 ?auto_291341 ) ) ( not ( = ?auto_291336 ?auto_291342 ) ) ( not ( = ?auto_291336 ?auto_291343 ) ) ( not ( = ?auto_291336 ?auto_291344 ) ) ( not ( = ?auto_291336 ?auto_291345 ) ) ( not ( = ?auto_291336 ?auto_291346 ) ) ( not ( = ?auto_291337 ?auto_291338 ) ) ( not ( = ?auto_291337 ?auto_291339 ) ) ( not ( = ?auto_291337 ?auto_291340 ) ) ( not ( = ?auto_291337 ?auto_291341 ) ) ( not ( = ?auto_291337 ?auto_291342 ) ) ( not ( = ?auto_291337 ?auto_291343 ) ) ( not ( = ?auto_291337 ?auto_291344 ) ) ( not ( = ?auto_291337 ?auto_291345 ) ) ( not ( = ?auto_291337 ?auto_291346 ) ) ( not ( = ?auto_291338 ?auto_291339 ) ) ( not ( = ?auto_291338 ?auto_291340 ) ) ( not ( = ?auto_291338 ?auto_291341 ) ) ( not ( = ?auto_291338 ?auto_291342 ) ) ( not ( = ?auto_291338 ?auto_291343 ) ) ( not ( = ?auto_291338 ?auto_291344 ) ) ( not ( = ?auto_291338 ?auto_291345 ) ) ( not ( = ?auto_291338 ?auto_291346 ) ) ( not ( = ?auto_291339 ?auto_291340 ) ) ( not ( = ?auto_291339 ?auto_291341 ) ) ( not ( = ?auto_291339 ?auto_291342 ) ) ( not ( = ?auto_291339 ?auto_291343 ) ) ( not ( = ?auto_291339 ?auto_291344 ) ) ( not ( = ?auto_291339 ?auto_291345 ) ) ( not ( = ?auto_291339 ?auto_291346 ) ) ( not ( = ?auto_291340 ?auto_291341 ) ) ( not ( = ?auto_291340 ?auto_291342 ) ) ( not ( = ?auto_291340 ?auto_291343 ) ) ( not ( = ?auto_291340 ?auto_291344 ) ) ( not ( = ?auto_291340 ?auto_291345 ) ) ( not ( = ?auto_291340 ?auto_291346 ) ) ( not ( = ?auto_291341 ?auto_291342 ) ) ( not ( = ?auto_291341 ?auto_291343 ) ) ( not ( = ?auto_291341 ?auto_291344 ) ) ( not ( = ?auto_291341 ?auto_291345 ) ) ( not ( = ?auto_291341 ?auto_291346 ) ) ( not ( = ?auto_291342 ?auto_291343 ) ) ( not ( = ?auto_291342 ?auto_291344 ) ) ( not ( = ?auto_291342 ?auto_291345 ) ) ( not ( = ?auto_291342 ?auto_291346 ) ) ( not ( = ?auto_291343 ?auto_291344 ) ) ( not ( = ?auto_291343 ?auto_291345 ) ) ( not ( = ?auto_291343 ?auto_291346 ) ) ( not ( = ?auto_291344 ?auto_291345 ) ) ( not ( = ?auto_291344 ?auto_291346 ) ) ( not ( = ?auto_291345 ?auto_291346 ) ) ( CLEAR ?auto_291344 ) ( ON ?auto_291345 ?auto_291346 ) ( CLEAR ?auto_291345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_291333 ?auto_291334 ?auto_291335 ?auto_291336 ?auto_291337 ?auto_291338 ?auto_291339 ?auto_291340 ?auto_291341 ?auto_291342 ?auto_291343 ?auto_291344 ?auto_291345 )
      ( MAKE-14PILE ?auto_291333 ?auto_291334 ?auto_291335 ?auto_291336 ?auto_291337 ?auto_291338 ?auto_291339 ?auto_291340 ?auto_291341 ?auto_291342 ?auto_291343 ?auto_291344 ?auto_291345 ?auto_291346 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291361 - BLOCK
      ?auto_291362 - BLOCK
      ?auto_291363 - BLOCK
      ?auto_291364 - BLOCK
      ?auto_291365 - BLOCK
      ?auto_291366 - BLOCK
      ?auto_291367 - BLOCK
      ?auto_291368 - BLOCK
      ?auto_291369 - BLOCK
      ?auto_291370 - BLOCK
      ?auto_291371 - BLOCK
      ?auto_291372 - BLOCK
      ?auto_291373 - BLOCK
      ?auto_291374 - BLOCK
    )
    :vars
    (
      ?auto_291375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291374 ?auto_291375 ) ( ON-TABLE ?auto_291361 ) ( ON ?auto_291362 ?auto_291361 ) ( ON ?auto_291363 ?auto_291362 ) ( ON ?auto_291364 ?auto_291363 ) ( ON ?auto_291365 ?auto_291364 ) ( ON ?auto_291366 ?auto_291365 ) ( ON ?auto_291367 ?auto_291366 ) ( ON ?auto_291368 ?auto_291367 ) ( ON ?auto_291369 ?auto_291368 ) ( ON ?auto_291370 ?auto_291369 ) ( ON ?auto_291371 ?auto_291370 ) ( not ( = ?auto_291361 ?auto_291362 ) ) ( not ( = ?auto_291361 ?auto_291363 ) ) ( not ( = ?auto_291361 ?auto_291364 ) ) ( not ( = ?auto_291361 ?auto_291365 ) ) ( not ( = ?auto_291361 ?auto_291366 ) ) ( not ( = ?auto_291361 ?auto_291367 ) ) ( not ( = ?auto_291361 ?auto_291368 ) ) ( not ( = ?auto_291361 ?auto_291369 ) ) ( not ( = ?auto_291361 ?auto_291370 ) ) ( not ( = ?auto_291361 ?auto_291371 ) ) ( not ( = ?auto_291361 ?auto_291372 ) ) ( not ( = ?auto_291361 ?auto_291373 ) ) ( not ( = ?auto_291361 ?auto_291374 ) ) ( not ( = ?auto_291361 ?auto_291375 ) ) ( not ( = ?auto_291362 ?auto_291363 ) ) ( not ( = ?auto_291362 ?auto_291364 ) ) ( not ( = ?auto_291362 ?auto_291365 ) ) ( not ( = ?auto_291362 ?auto_291366 ) ) ( not ( = ?auto_291362 ?auto_291367 ) ) ( not ( = ?auto_291362 ?auto_291368 ) ) ( not ( = ?auto_291362 ?auto_291369 ) ) ( not ( = ?auto_291362 ?auto_291370 ) ) ( not ( = ?auto_291362 ?auto_291371 ) ) ( not ( = ?auto_291362 ?auto_291372 ) ) ( not ( = ?auto_291362 ?auto_291373 ) ) ( not ( = ?auto_291362 ?auto_291374 ) ) ( not ( = ?auto_291362 ?auto_291375 ) ) ( not ( = ?auto_291363 ?auto_291364 ) ) ( not ( = ?auto_291363 ?auto_291365 ) ) ( not ( = ?auto_291363 ?auto_291366 ) ) ( not ( = ?auto_291363 ?auto_291367 ) ) ( not ( = ?auto_291363 ?auto_291368 ) ) ( not ( = ?auto_291363 ?auto_291369 ) ) ( not ( = ?auto_291363 ?auto_291370 ) ) ( not ( = ?auto_291363 ?auto_291371 ) ) ( not ( = ?auto_291363 ?auto_291372 ) ) ( not ( = ?auto_291363 ?auto_291373 ) ) ( not ( = ?auto_291363 ?auto_291374 ) ) ( not ( = ?auto_291363 ?auto_291375 ) ) ( not ( = ?auto_291364 ?auto_291365 ) ) ( not ( = ?auto_291364 ?auto_291366 ) ) ( not ( = ?auto_291364 ?auto_291367 ) ) ( not ( = ?auto_291364 ?auto_291368 ) ) ( not ( = ?auto_291364 ?auto_291369 ) ) ( not ( = ?auto_291364 ?auto_291370 ) ) ( not ( = ?auto_291364 ?auto_291371 ) ) ( not ( = ?auto_291364 ?auto_291372 ) ) ( not ( = ?auto_291364 ?auto_291373 ) ) ( not ( = ?auto_291364 ?auto_291374 ) ) ( not ( = ?auto_291364 ?auto_291375 ) ) ( not ( = ?auto_291365 ?auto_291366 ) ) ( not ( = ?auto_291365 ?auto_291367 ) ) ( not ( = ?auto_291365 ?auto_291368 ) ) ( not ( = ?auto_291365 ?auto_291369 ) ) ( not ( = ?auto_291365 ?auto_291370 ) ) ( not ( = ?auto_291365 ?auto_291371 ) ) ( not ( = ?auto_291365 ?auto_291372 ) ) ( not ( = ?auto_291365 ?auto_291373 ) ) ( not ( = ?auto_291365 ?auto_291374 ) ) ( not ( = ?auto_291365 ?auto_291375 ) ) ( not ( = ?auto_291366 ?auto_291367 ) ) ( not ( = ?auto_291366 ?auto_291368 ) ) ( not ( = ?auto_291366 ?auto_291369 ) ) ( not ( = ?auto_291366 ?auto_291370 ) ) ( not ( = ?auto_291366 ?auto_291371 ) ) ( not ( = ?auto_291366 ?auto_291372 ) ) ( not ( = ?auto_291366 ?auto_291373 ) ) ( not ( = ?auto_291366 ?auto_291374 ) ) ( not ( = ?auto_291366 ?auto_291375 ) ) ( not ( = ?auto_291367 ?auto_291368 ) ) ( not ( = ?auto_291367 ?auto_291369 ) ) ( not ( = ?auto_291367 ?auto_291370 ) ) ( not ( = ?auto_291367 ?auto_291371 ) ) ( not ( = ?auto_291367 ?auto_291372 ) ) ( not ( = ?auto_291367 ?auto_291373 ) ) ( not ( = ?auto_291367 ?auto_291374 ) ) ( not ( = ?auto_291367 ?auto_291375 ) ) ( not ( = ?auto_291368 ?auto_291369 ) ) ( not ( = ?auto_291368 ?auto_291370 ) ) ( not ( = ?auto_291368 ?auto_291371 ) ) ( not ( = ?auto_291368 ?auto_291372 ) ) ( not ( = ?auto_291368 ?auto_291373 ) ) ( not ( = ?auto_291368 ?auto_291374 ) ) ( not ( = ?auto_291368 ?auto_291375 ) ) ( not ( = ?auto_291369 ?auto_291370 ) ) ( not ( = ?auto_291369 ?auto_291371 ) ) ( not ( = ?auto_291369 ?auto_291372 ) ) ( not ( = ?auto_291369 ?auto_291373 ) ) ( not ( = ?auto_291369 ?auto_291374 ) ) ( not ( = ?auto_291369 ?auto_291375 ) ) ( not ( = ?auto_291370 ?auto_291371 ) ) ( not ( = ?auto_291370 ?auto_291372 ) ) ( not ( = ?auto_291370 ?auto_291373 ) ) ( not ( = ?auto_291370 ?auto_291374 ) ) ( not ( = ?auto_291370 ?auto_291375 ) ) ( not ( = ?auto_291371 ?auto_291372 ) ) ( not ( = ?auto_291371 ?auto_291373 ) ) ( not ( = ?auto_291371 ?auto_291374 ) ) ( not ( = ?auto_291371 ?auto_291375 ) ) ( not ( = ?auto_291372 ?auto_291373 ) ) ( not ( = ?auto_291372 ?auto_291374 ) ) ( not ( = ?auto_291372 ?auto_291375 ) ) ( not ( = ?auto_291373 ?auto_291374 ) ) ( not ( = ?auto_291373 ?auto_291375 ) ) ( not ( = ?auto_291374 ?auto_291375 ) ) ( ON ?auto_291373 ?auto_291374 ) ( CLEAR ?auto_291371 ) ( ON ?auto_291372 ?auto_291373 ) ( CLEAR ?auto_291372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_291361 ?auto_291362 ?auto_291363 ?auto_291364 ?auto_291365 ?auto_291366 ?auto_291367 ?auto_291368 ?auto_291369 ?auto_291370 ?auto_291371 ?auto_291372 )
      ( MAKE-14PILE ?auto_291361 ?auto_291362 ?auto_291363 ?auto_291364 ?auto_291365 ?auto_291366 ?auto_291367 ?auto_291368 ?auto_291369 ?auto_291370 ?auto_291371 ?auto_291372 ?auto_291373 ?auto_291374 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291390 - BLOCK
      ?auto_291391 - BLOCK
      ?auto_291392 - BLOCK
      ?auto_291393 - BLOCK
      ?auto_291394 - BLOCK
      ?auto_291395 - BLOCK
      ?auto_291396 - BLOCK
      ?auto_291397 - BLOCK
      ?auto_291398 - BLOCK
      ?auto_291399 - BLOCK
      ?auto_291400 - BLOCK
      ?auto_291401 - BLOCK
      ?auto_291402 - BLOCK
      ?auto_291403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291403 ) ( ON-TABLE ?auto_291390 ) ( ON ?auto_291391 ?auto_291390 ) ( ON ?auto_291392 ?auto_291391 ) ( ON ?auto_291393 ?auto_291392 ) ( ON ?auto_291394 ?auto_291393 ) ( ON ?auto_291395 ?auto_291394 ) ( ON ?auto_291396 ?auto_291395 ) ( ON ?auto_291397 ?auto_291396 ) ( ON ?auto_291398 ?auto_291397 ) ( ON ?auto_291399 ?auto_291398 ) ( ON ?auto_291400 ?auto_291399 ) ( not ( = ?auto_291390 ?auto_291391 ) ) ( not ( = ?auto_291390 ?auto_291392 ) ) ( not ( = ?auto_291390 ?auto_291393 ) ) ( not ( = ?auto_291390 ?auto_291394 ) ) ( not ( = ?auto_291390 ?auto_291395 ) ) ( not ( = ?auto_291390 ?auto_291396 ) ) ( not ( = ?auto_291390 ?auto_291397 ) ) ( not ( = ?auto_291390 ?auto_291398 ) ) ( not ( = ?auto_291390 ?auto_291399 ) ) ( not ( = ?auto_291390 ?auto_291400 ) ) ( not ( = ?auto_291390 ?auto_291401 ) ) ( not ( = ?auto_291390 ?auto_291402 ) ) ( not ( = ?auto_291390 ?auto_291403 ) ) ( not ( = ?auto_291391 ?auto_291392 ) ) ( not ( = ?auto_291391 ?auto_291393 ) ) ( not ( = ?auto_291391 ?auto_291394 ) ) ( not ( = ?auto_291391 ?auto_291395 ) ) ( not ( = ?auto_291391 ?auto_291396 ) ) ( not ( = ?auto_291391 ?auto_291397 ) ) ( not ( = ?auto_291391 ?auto_291398 ) ) ( not ( = ?auto_291391 ?auto_291399 ) ) ( not ( = ?auto_291391 ?auto_291400 ) ) ( not ( = ?auto_291391 ?auto_291401 ) ) ( not ( = ?auto_291391 ?auto_291402 ) ) ( not ( = ?auto_291391 ?auto_291403 ) ) ( not ( = ?auto_291392 ?auto_291393 ) ) ( not ( = ?auto_291392 ?auto_291394 ) ) ( not ( = ?auto_291392 ?auto_291395 ) ) ( not ( = ?auto_291392 ?auto_291396 ) ) ( not ( = ?auto_291392 ?auto_291397 ) ) ( not ( = ?auto_291392 ?auto_291398 ) ) ( not ( = ?auto_291392 ?auto_291399 ) ) ( not ( = ?auto_291392 ?auto_291400 ) ) ( not ( = ?auto_291392 ?auto_291401 ) ) ( not ( = ?auto_291392 ?auto_291402 ) ) ( not ( = ?auto_291392 ?auto_291403 ) ) ( not ( = ?auto_291393 ?auto_291394 ) ) ( not ( = ?auto_291393 ?auto_291395 ) ) ( not ( = ?auto_291393 ?auto_291396 ) ) ( not ( = ?auto_291393 ?auto_291397 ) ) ( not ( = ?auto_291393 ?auto_291398 ) ) ( not ( = ?auto_291393 ?auto_291399 ) ) ( not ( = ?auto_291393 ?auto_291400 ) ) ( not ( = ?auto_291393 ?auto_291401 ) ) ( not ( = ?auto_291393 ?auto_291402 ) ) ( not ( = ?auto_291393 ?auto_291403 ) ) ( not ( = ?auto_291394 ?auto_291395 ) ) ( not ( = ?auto_291394 ?auto_291396 ) ) ( not ( = ?auto_291394 ?auto_291397 ) ) ( not ( = ?auto_291394 ?auto_291398 ) ) ( not ( = ?auto_291394 ?auto_291399 ) ) ( not ( = ?auto_291394 ?auto_291400 ) ) ( not ( = ?auto_291394 ?auto_291401 ) ) ( not ( = ?auto_291394 ?auto_291402 ) ) ( not ( = ?auto_291394 ?auto_291403 ) ) ( not ( = ?auto_291395 ?auto_291396 ) ) ( not ( = ?auto_291395 ?auto_291397 ) ) ( not ( = ?auto_291395 ?auto_291398 ) ) ( not ( = ?auto_291395 ?auto_291399 ) ) ( not ( = ?auto_291395 ?auto_291400 ) ) ( not ( = ?auto_291395 ?auto_291401 ) ) ( not ( = ?auto_291395 ?auto_291402 ) ) ( not ( = ?auto_291395 ?auto_291403 ) ) ( not ( = ?auto_291396 ?auto_291397 ) ) ( not ( = ?auto_291396 ?auto_291398 ) ) ( not ( = ?auto_291396 ?auto_291399 ) ) ( not ( = ?auto_291396 ?auto_291400 ) ) ( not ( = ?auto_291396 ?auto_291401 ) ) ( not ( = ?auto_291396 ?auto_291402 ) ) ( not ( = ?auto_291396 ?auto_291403 ) ) ( not ( = ?auto_291397 ?auto_291398 ) ) ( not ( = ?auto_291397 ?auto_291399 ) ) ( not ( = ?auto_291397 ?auto_291400 ) ) ( not ( = ?auto_291397 ?auto_291401 ) ) ( not ( = ?auto_291397 ?auto_291402 ) ) ( not ( = ?auto_291397 ?auto_291403 ) ) ( not ( = ?auto_291398 ?auto_291399 ) ) ( not ( = ?auto_291398 ?auto_291400 ) ) ( not ( = ?auto_291398 ?auto_291401 ) ) ( not ( = ?auto_291398 ?auto_291402 ) ) ( not ( = ?auto_291398 ?auto_291403 ) ) ( not ( = ?auto_291399 ?auto_291400 ) ) ( not ( = ?auto_291399 ?auto_291401 ) ) ( not ( = ?auto_291399 ?auto_291402 ) ) ( not ( = ?auto_291399 ?auto_291403 ) ) ( not ( = ?auto_291400 ?auto_291401 ) ) ( not ( = ?auto_291400 ?auto_291402 ) ) ( not ( = ?auto_291400 ?auto_291403 ) ) ( not ( = ?auto_291401 ?auto_291402 ) ) ( not ( = ?auto_291401 ?auto_291403 ) ) ( not ( = ?auto_291402 ?auto_291403 ) ) ( ON ?auto_291402 ?auto_291403 ) ( CLEAR ?auto_291400 ) ( ON ?auto_291401 ?auto_291402 ) ( CLEAR ?auto_291401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_291390 ?auto_291391 ?auto_291392 ?auto_291393 ?auto_291394 ?auto_291395 ?auto_291396 ?auto_291397 ?auto_291398 ?auto_291399 ?auto_291400 ?auto_291401 )
      ( MAKE-14PILE ?auto_291390 ?auto_291391 ?auto_291392 ?auto_291393 ?auto_291394 ?auto_291395 ?auto_291396 ?auto_291397 ?auto_291398 ?auto_291399 ?auto_291400 ?auto_291401 ?auto_291402 ?auto_291403 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291418 - BLOCK
      ?auto_291419 - BLOCK
      ?auto_291420 - BLOCK
      ?auto_291421 - BLOCK
      ?auto_291422 - BLOCK
      ?auto_291423 - BLOCK
      ?auto_291424 - BLOCK
      ?auto_291425 - BLOCK
      ?auto_291426 - BLOCK
      ?auto_291427 - BLOCK
      ?auto_291428 - BLOCK
      ?auto_291429 - BLOCK
      ?auto_291430 - BLOCK
      ?auto_291431 - BLOCK
    )
    :vars
    (
      ?auto_291432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291431 ?auto_291432 ) ( ON-TABLE ?auto_291418 ) ( ON ?auto_291419 ?auto_291418 ) ( ON ?auto_291420 ?auto_291419 ) ( ON ?auto_291421 ?auto_291420 ) ( ON ?auto_291422 ?auto_291421 ) ( ON ?auto_291423 ?auto_291422 ) ( ON ?auto_291424 ?auto_291423 ) ( ON ?auto_291425 ?auto_291424 ) ( ON ?auto_291426 ?auto_291425 ) ( ON ?auto_291427 ?auto_291426 ) ( not ( = ?auto_291418 ?auto_291419 ) ) ( not ( = ?auto_291418 ?auto_291420 ) ) ( not ( = ?auto_291418 ?auto_291421 ) ) ( not ( = ?auto_291418 ?auto_291422 ) ) ( not ( = ?auto_291418 ?auto_291423 ) ) ( not ( = ?auto_291418 ?auto_291424 ) ) ( not ( = ?auto_291418 ?auto_291425 ) ) ( not ( = ?auto_291418 ?auto_291426 ) ) ( not ( = ?auto_291418 ?auto_291427 ) ) ( not ( = ?auto_291418 ?auto_291428 ) ) ( not ( = ?auto_291418 ?auto_291429 ) ) ( not ( = ?auto_291418 ?auto_291430 ) ) ( not ( = ?auto_291418 ?auto_291431 ) ) ( not ( = ?auto_291418 ?auto_291432 ) ) ( not ( = ?auto_291419 ?auto_291420 ) ) ( not ( = ?auto_291419 ?auto_291421 ) ) ( not ( = ?auto_291419 ?auto_291422 ) ) ( not ( = ?auto_291419 ?auto_291423 ) ) ( not ( = ?auto_291419 ?auto_291424 ) ) ( not ( = ?auto_291419 ?auto_291425 ) ) ( not ( = ?auto_291419 ?auto_291426 ) ) ( not ( = ?auto_291419 ?auto_291427 ) ) ( not ( = ?auto_291419 ?auto_291428 ) ) ( not ( = ?auto_291419 ?auto_291429 ) ) ( not ( = ?auto_291419 ?auto_291430 ) ) ( not ( = ?auto_291419 ?auto_291431 ) ) ( not ( = ?auto_291419 ?auto_291432 ) ) ( not ( = ?auto_291420 ?auto_291421 ) ) ( not ( = ?auto_291420 ?auto_291422 ) ) ( not ( = ?auto_291420 ?auto_291423 ) ) ( not ( = ?auto_291420 ?auto_291424 ) ) ( not ( = ?auto_291420 ?auto_291425 ) ) ( not ( = ?auto_291420 ?auto_291426 ) ) ( not ( = ?auto_291420 ?auto_291427 ) ) ( not ( = ?auto_291420 ?auto_291428 ) ) ( not ( = ?auto_291420 ?auto_291429 ) ) ( not ( = ?auto_291420 ?auto_291430 ) ) ( not ( = ?auto_291420 ?auto_291431 ) ) ( not ( = ?auto_291420 ?auto_291432 ) ) ( not ( = ?auto_291421 ?auto_291422 ) ) ( not ( = ?auto_291421 ?auto_291423 ) ) ( not ( = ?auto_291421 ?auto_291424 ) ) ( not ( = ?auto_291421 ?auto_291425 ) ) ( not ( = ?auto_291421 ?auto_291426 ) ) ( not ( = ?auto_291421 ?auto_291427 ) ) ( not ( = ?auto_291421 ?auto_291428 ) ) ( not ( = ?auto_291421 ?auto_291429 ) ) ( not ( = ?auto_291421 ?auto_291430 ) ) ( not ( = ?auto_291421 ?auto_291431 ) ) ( not ( = ?auto_291421 ?auto_291432 ) ) ( not ( = ?auto_291422 ?auto_291423 ) ) ( not ( = ?auto_291422 ?auto_291424 ) ) ( not ( = ?auto_291422 ?auto_291425 ) ) ( not ( = ?auto_291422 ?auto_291426 ) ) ( not ( = ?auto_291422 ?auto_291427 ) ) ( not ( = ?auto_291422 ?auto_291428 ) ) ( not ( = ?auto_291422 ?auto_291429 ) ) ( not ( = ?auto_291422 ?auto_291430 ) ) ( not ( = ?auto_291422 ?auto_291431 ) ) ( not ( = ?auto_291422 ?auto_291432 ) ) ( not ( = ?auto_291423 ?auto_291424 ) ) ( not ( = ?auto_291423 ?auto_291425 ) ) ( not ( = ?auto_291423 ?auto_291426 ) ) ( not ( = ?auto_291423 ?auto_291427 ) ) ( not ( = ?auto_291423 ?auto_291428 ) ) ( not ( = ?auto_291423 ?auto_291429 ) ) ( not ( = ?auto_291423 ?auto_291430 ) ) ( not ( = ?auto_291423 ?auto_291431 ) ) ( not ( = ?auto_291423 ?auto_291432 ) ) ( not ( = ?auto_291424 ?auto_291425 ) ) ( not ( = ?auto_291424 ?auto_291426 ) ) ( not ( = ?auto_291424 ?auto_291427 ) ) ( not ( = ?auto_291424 ?auto_291428 ) ) ( not ( = ?auto_291424 ?auto_291429 ) ) ( not ( = ?auto_291424 ?auto_291430 ) ) ( not ( = ?auto_291424 ?auto_291431 ) ) ( not ( = ?auto_291424 ?auto_291432 ) ) ( not ( = ?auto_291425 ?auto_291426 ) ) ( not ( = ?auto_291425 ?auto_291427 ) ) ( not ( = ?auto_291425 ?auto_291428 ) ) ( not ( = ?auto_291425 ?auto_291429 ) ) ( not ( = ?auto_291425 ?auto_291430 ) ) ( not ( = ?auto_291425 ?auto_291431 ) ) ( not ( = ?auto_291425 ?auto_291432 ) ) ( not ( = ?auto_291426 ?auto_291427 ) ) ( not ( = ?auto_291426 ?auto_291428 ) ) ( not ( = ?auto_291426 ?auto_291429 ) ) ( not ( = ?auto_291426 ?auto_291430 ) ) ( not ( = ?auto_291426 ?auto_291431 ) ) ( not ( = ?auto_291426 ?auto_291432 ) ) ( not ( = ?auto_291427 ?auto_291428 ) ) ( not ( = ?auto_291427 ?auto_291429 ) ) ( not ( = ?auto_291427 ?auto_291430 ) ) ( not ( = ?auto_291427 ?auto_291431 ) ) ( not ( = ?auto_291427 ?auto_291432 ) ) ( not ( = ?auto_291428 ?auto_291429 ) ) ( not ( = ?auto_291428 ?auto_291430 ) ) ( not ( = ?auto_291428 ?auto_291431 ) ) ( not ( = ?auto_291428 ?auto_291432 ) ) ( not ( = ?auto_291429 ?auto_291430 ) ) ( not ( = ?auto_291429 ?auto_291431 ) ) ( not ( = ?auto_291429 ?auto_291432 ) ) ( not ( = ?auto_291430 ?auto_291431 ) ) ( not ( = ?auto_291430 ?auto_291432 ) ) ( not ( = ?auto_291431 ?auto_291432 ) ) ( ON ?auto_291430 ?auto_291431 ) ( ON ?auto_291429 ?auto_291430 ) ( CLEAR ?auto_291427 ) ( ON ?auto_291428 ?auto_291429 ) ( CLEAR ?auto_291428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_291418 ?auto_291419 ?auto_291420 ?auto_291421 ?auto_291422 ?auto_291423 ?auto_291424 ?auto_291425 ?auto_291426 ?auto_291427 ?auto_291428 )
      ( MAKE-14PILE ?auto_291418 ?auto_291419 ?auto_291420 ?auto_291421 ?auto_291422 ?auto_291423 ?auto_291424 ?auto_291425 ?auto_291426 ?auto_291427 ?auto_291428 ?auto_291429 ?auto_291430 ?auto_291431 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291447 - BLOCK
      ?auto_291448 - BLOCK
      ?auto_291449 - BLOCK
      ?auto_291450 - BLOCK
      ?auto_291451 - BLOCK
      ?auto_291452 - BLOCK
      ?auto_291453 - BLOCK
      ?auto_291454 - BLOCK
      ?auto_291455 - BLOCK
      ?auto_291456 - BLOCK
      ?auto_291457 - BLOCK
      ?auto_291458 - BLOCK
      ?auto_291459 - BLOCK
      ?auto_291460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291460 ) ( ON-TABLE ?auto_291447 ) ( ON ?auto_291448 ?auto_291447 ) ( ON ?auto_291449 ?auto_291448 ) ( ON ?auto_291450 ?auto_291449 ) ( ON ?auto_291451 ?auto_291450 ) ( ON ?auto_291452 ?auto_291451 ) ( ON ?auto_291453 ?auto_291452 ) ( ON ?auto_291454 ?auto_291453 ) ( ON ?auto_291455 ?auto_291454 ) ( ON ?auto_291456 ?auto_291455 ) ( not ( = ?auto_291447 ?auto_291448 ) ) ( not ( = ?auto_291447 ?auto_291449 ) ) ( not ( = ?auto_291447 ?auto_291450 ) ) ( not ( = ?auto_291447 ?auto_291451 ) ) ( not ( = ?auto_291447 ?auto_291452 ) ) ( not ( = ?auto_291447 ?auto_291453 ) ) ( not ( = ?auto_291447 ?auto_291454 ) ) ( not ( = ?auto_291447 ?auto_291455 ) ) ( not ( = ?auto_291447 ?auto_291456 ) ) ( not ( = ?auto_291447 ?auto_291457 ) ) ( not ( = ?auto_291447 ?auto_291458 ) ) ( not ( = ?auto_291447 ?auto_291459 ) ) ( not ( = ?auto_291447 ?auto_291460 ) ) ( not ( = ?auto_291448 ?auto_291449 ) ) ( not ( = ?auto_291448 ?auto_291450 ) ) ( not ( = ?auto_291448 ?auto_291451 ) ) ( not ( = ?auto_291448 ?auto_291452 ) ) ( not ( = ?auto_291448 ?auto_291453 ) ) ( not ( = ?auto_291448 ?auto_291454 ) ) ( not ( = ?auto_291448 ?auto_291455 ) ) ( not ( = ?auto_291448 ?auto_291456 ) ) ( not ( = ?auto_291448 ?auto_291457 ) ) ( not ( = ?auto_291448 ?auto_291458 ) ) ( not ( = ?auto_291448 ?auto_291459 ) ) ( not ( = ?auto_291448 ?auto_291460 ) ) ( not ( = ?auto_291449 ?auto_291450 ) ) ( not ( = ?auto_291449 ?auto_291451 ) ) ( not ( = ?auto_291449 ?auto_291452 ) ) ( not ( = ?auto_291449 ?auto_291453 ) ) ( not ( = ?auto_291449 ?auto_291454 ) ) ( not ( = ?auto_291449 ?auto_291455 ) ) ( not ( = ?auto_291449 ?auto_291456 ) ) ( not ( = ?auto_291449 ?auto_291457 ) ) ( not ( = ?auto_291449 ?auto_291458 ) ) ( not ( = ?auto_291449 ?auto_291459 ) ) ( not ( = ?auto_291449 ?auto_291460 ) ) ( not ( = ?auto_291450 ?auto_291451 ) ) ( not ( = ?auto_291450 ?auto_291452 ) ) ( not ( = ?auto_291450 ?auto_291453 ) ) ( not ( = ?auto_291450 ?auto_291454 ) ) ( not ( = ?auto_291450 ?auto_291455 ) ) ( not ( = ?auto_291450 ?auto_291456 ) ) ( not ( = ?auto_291450 ?auto_291457 ) ) ( not ( = ?auto_291450 ?auto_291458 ) ) ( not ( = ?auto_291450 ?auto_291459 ) ) ( not ( = ?auto_291450 ?auto_291460 ) ) ( not ( = ?auto_291451 ?auto_291452 ) ) ( not ( = ?auto_291451 ?auto_291453 ) ) ( not ( = ?auto_291451 ?auto_291454 ) ) ( not ( = ?auto_291451 ?auto_291455 ) ) ( not ( = ?auto_291451 ?auto_291456 ) ) ( not ( = ?auto_291451 ?auto_291457 ) ) ( not ( = ?auto_291451 ?auto_291458 ) ) ( not ( = ?auto_291451 ?auto_291459 ) ) ( not ( = ?auto_291451 ?auto_291460 ) ) ( not ( = ?auto_291452 ?auto_291453 ) ) ( not ( = ?auto_291452 ?auto_291454 ) ) ( not ( = ?auto_291452 ?auto_291455 ) ) ( not ( = ?auto_291452 ?auto_291456 ) ) ( not ( = ?auto_291452 ?auto_291457 ) ) ( not ( = ?auto_291452 ?auto_291458 ) ) ( not ( = ?auto_291452 ?auto_291459 ) ) ( not ( = ?auto_291452 ?auto_291460 ) ) ( not ( = ?auto_291453 ?auto_291454 ) ) ( not ( = ?auto_291453 ?auto_291455 ) ) ( not ( = ?auto_291453 ?auto_291456 ) ) ( not ( = ?auto_291453 ?auto_291457 ) ) ( not ( = ?auto_291453 ?auto_291458 ) ) ( not ( = ?auto_291453 ?auto_291459 ) ) ( not ( = ?auto_291453 ?auto_291460 ) ) ( not ( = ?auto_291454 ?auto_291455 ) ) ( not ( = ?auto_291454 ?auto_291456 ) ) ( not ( = ?auto_291454 ?auto_291457 ) ) ( not ( = ?auto_291454 ?auto_291458 ) ) ( not ( = ?auto_291454 ?auto_291459 ) ) ( not ( = ?auto_291454 ?auto_291460 ) ) ( not ( = ?auto_291455 ?auto_291456 ) ) ( not ( = ?auto_291455 ?auto_291457 ) ) ( not ( = ?auto_291455 ?auto_291458 ) ) ( not ( = ?auto_291455 ?auto_291459 ) ) ( not ( = ?auto_291455 ?auto_291460 ) ) ( not ( = ?auto_291456 ?auto_291457 ) ) ( not ( = ?auto_291456 ?auto_291458 ) ) ( not ( = ?auto_291456 ?auto_291459 ) ) ( not ( = ?auto_291456 ?auto_291460 ) ) ( not ( = ?auto_291457 ?auto_291458 ) ) ( not ( = ?auto_291457 ?auto_291459 ) ) ( not ( = ?auto_291457 ?auto_291460 ) ) ( not ( = ?auto_291458 ?auto_291459 ) ) ( not ( = ?auto_291458 ?auto_291460 ) ) ( not ( = ?auto_291459 ?auto_291460 ) ) ( ON ?auto_291459 ?auto_291460 ) ( ON ?auto_291458 ?auto_291459 ) ( CLEAR ?auto_291456 ) ( ON ?auto_291457 ?auto_291458 ) ( CLEAR ?auto_291457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_291447 ?auto_291448 ?auto_291449 ?auto_291450 ?auto_291451 ?auto_291452 ?auto_291453 ?auto_291454 ?auto_291455 ?auto_291456 ?auto_291457 )
      ( MAKE-14PILE ?auto_291447 ?auto_291448 ?auto_291449 ?auto_291450 ?auto_291451 ?auto_291452 ?auto_291453 ?auto_291454 ?auto_291455 ?auto_291456 ?auto_291457 ?auto_291458 ?auto_291459 ?auto_291460 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291475 - BLOCK
      ?auto_291476 - BLOCK
      ?auto_291477 - BLOCK
      ?auto_291478 - BLOCK
      ?auto_291479 - BLOCK
      ?auto_291480 - BLOCK
      ?auto_291481 - BLOCK
      ?auto_291482 - BLOCK
      ?auto_291483 - BLOCK
      ?auto_291484 - BLOCK
      ?auto_291485 - BLOCK
      ?auto_291486 - BLOCK
      ?auto_291487 - BLOCK
      ?auto_291488 - BLOCK
    )
    :vars
    (
      ?auto_291489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291488 ?auto_291489 ) ( ON-TABLE ?auto_291475 ) ( ON ?auto_291476 ?auto_291475 ) ( ON ?auto_291477 ?auto_291476 ) ( ON ?auto_291478 ?auto_291477 ) ( ON ?auto_291479 ?auto_291478 ) ( ON ?auto_291480 ?auto_291479 ) ( ON ?auto_291481 ?auto_291480 ) ( ON ?auto_291482 ?auto_291481 ) ( ON ?auto_291483 ?auto_291482 ) ( not ( = ?auto_291475 ?auto_291476 ) ) ( not ( = ?auto_291475 ?auto_291477 ) ) ( not ( = ?auto_291475 ?auto_291478 ) ) ( not ( = ?auto_291475 ?auto_291479 ) ) ( not ( = ?auto_291475 ?auto_291480 ) ) ( not ( = ?auto_291475 ?auto_291481 ) ) ( not ( = ?auto_291475 ?auto_291482 ) ) ( not ( = ?auto_291475 ?auto_291483 ) ) ( not ( = ?auto_291475 ?auto_291484 ) ) ( not ( = ?auto_291475 ?auto_291485 ) ) ( not ( = ?auto_291475 ?auto_291486 ) ) ( not ( = ?auto_291475 ?auto_291487 ) ) ( not ( = ?auto_291475 ?auto_291488 ) ) ( not ( = ?auto_291475 ?auto_291489 ) ) ( not ( = ?auto_291476 ?auto_291477 ) ) ( not ( = ?auto_291476 ?auto_291478 ) ) ( not ( = ?auto_291476 ?auto_291479 ) ) ( not ( = ?auto_291476 ?auto_291480 ) ) ( not ( = ?auto_291476 ?auto_291481 ) ) ( not ( = ?auto_291476 ?auto_291482 ) ) ( not ( = ?auto_291476 ?auto_291483 ) ) ( not ( = ?auto_291476 ?auto_291484 ) ) ( not ( = ?auto_291476 ?auto_291485 ) ) ( not ( = ?auto_291476 ?auto_291486 ) ) ( not ( = ?auto_291476 ?auto_291487 ) ) ( not ( = ?auto_291476 ?auto_291488 ) ) ( not ( = ?auto_291476 ?auto_291489 ) ) ( not ( = ?auto_291477 ?auto_291478 ) ) ( not ( = ?auto_291477 ?auto_291479 ) ) ( not ( = ?auto_291477 ?auto_291480 ) ) ( not ( = ?auto_291477 ?auto_291481 ) ) ( not ( = ?auto_291477 ?auto_291482 ) ) ( not ( = ?auto_291477 ?auto_291483 ) ) ( not ( = ?auto_291477 ?auto_291484 ) ) ( not ( = ?auto_291477 ?auto_291485 ) ) ( not ( = ?auto_291477 ?auto_291486 ) ) ( not ( = ?auto_291477 ?auto_291487 ) ) ( not ( = ?auto_291477 ?auto_291488 ) ) ( not ( = ?auto_291477 ?auto_291489 ) ) ( not ( = ?auto_291478 ?auto_291479 ) ) ( not ( = ?auto_291478 ?auto_291480 ) ) ( not ( = ?auto_291478 ?auto_291481 ) ) ( not ( = ?auto_291478 ?auto_291482 ) ) ( not ( = ?auto_291478 ?auto_291483 ) ) ( not ( = ?auto_291478 ?auto_291484 ) ) ( not ( = ?auto_291478 ?auto_291485 ) ) ( not ( = ?auto_291478 ?auto_291486 ) ) ( not ( = ?auto_291478 ?auto_291487 ) ) ( not ( = ?auto_291478 ?auto_291488 ) ) ( not ( = ?auto_291478 ?auto_291489 ) ) ( not ( = ?auto_291479 ?auto_291480 ) ) ( not ( = ?auto_291479 ?auto_291481 ) ) ( not ( = ?auto_291479 ?auto_291482 ) ) ( not ( = ?auto_291479 ?auto_291483 ) ) ( not ( = ?auto_291479 ?auto_291484 ) ) ( not ( = ?auto_291479 ?auto_291485 ) ) ( not ( = ?auto_291479 ?auto_291486 ) ) ( not ( = ?auto_291479 ?auto_291487 ) ) ( not ( = ?auto_291479 ?auto_291488 ) ) ( not ( = ?auto_291479 ?auto_291489 ) ) ( not ( = ?auto_291480 ?auto_291481 ) ) ( not ( = ?auto_291480 ?auto_291482 ) ) ( not ( = ?auto_291480 ?auto_291483 ) ) ( not ( = ?auto_291480 ?auto_291484 ) ) ( not ( = ?auto_291480 ?auto_291485 ) ) ( not ( = ?auto_291480 ?auto_291486 ) ) ( not ( = ?auto_291480 ?auto_291487 ) ) ( not ( = ?auto_291480 ?auto_291488 ) ) ( not ( = ?auto_291480 ?auto_291489 ) ) ( not ( = ?auto_291481 ?auto_291482 ) ) ( not ( = ?auto_291481 ?auto_291483 ) ) ( not ( = ?auto_291481 ?auto_291484 ) ) ( not ( = ?auto_291481 ?auto_291485 ) ) ( not ( = ?auto_291481 ?auto_291486 ) ) ( not ( = ?auto_291481 ?auto_291487 ) ) ( not ( = ?auto_291481 ?auto_291488 ) ) ( not ( = ?auto_291481 ?auto_291489 ) ) ( not ( = ?auto_291482 ?auto_291483 ) ) ( not ( = ?auto_291482 ?auto_291484 ) ) ( not ( = ?auto_291482 ?auto_291485 ) ) ( not ( = ?auto_291482 ?auto_291486 ) ) ( not ( = ?auto_291482 ?auto_291487 ) ) ( not ( = ?auto_291482 ?auto_291488 ) ) ( not ( = ?auto_291482 ?auto_291489 ) ) ( not ( = ?auto_291483 ?auto_291484 ) ) ( not ( = ?auto_291483 ?auto_291485 ) ) ( not ( = ?auto_291483 ?auto_291486 ) ) ( not ( = ?auto_291483 ?auto_291487 ) ) ( not ( = ?auto_291483 ?auto_291488 ) ) ( not ( = ?auto_291483 ?auto_291489 ) ) ( not ( = ?auto_291484 ?auto_291485 ) ) ( not ( = ?auto_291484 ?auto_291486 ) ) ( not ( = ?auto_291484 ?auto_291487 ) ) ( not ( = ?auto_291484 ?auto_291488 ) ) ( not ( = ?auto_291484 ?auto_291489 ) ) ( not ( = ?auto_291485 ?auto_291486 ) ) ( not ( = ?auto_291485 ?auto_291487 ) ) ( not ( = ?auto_291485 ?auto_291488 ) ) ( not ( = ?auto_291485 ?auto_291489 ) ) ( not ( = ?auto_291486 ?auto_291487 ) ) ( not ( = ?auto_291486 ?auto_291488 ) ) ( not ( = ?auto_291486 ?auto_291489 ) ) ( not ( = ?auto_291487 ?auto_291488 ) ) ( not ( = ?auto_291487 ?auto_291489 ) ) ( not ( = ?auto_291488 ?auto_291489 ) ) ( ON ?auto_291487 ?auto_291488 ) ( ON ?auto_291486 ?auto_291487 ) ( ON ?auto_291485 ?auto_291486 ) ( CLEAR ?auto_291483 ) ( ON ?auto_291484 ?auto_291485 ) ( CLEAR ?auto_291484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_291475 ?auto_291476 ?auto_291477 ?auto_291478 ?auto_291479 ?auto_291480 ?auto_291481 ?auto_291482 ?auto_291483 ?auto_291484 )
      ( MAKE-14PILE ?auto_291475 ?auto_291476 ?auto_291477 ?auto_291478 ?auto_291479 ?auto_291480 ?auto_291481 ?auto_291482 ?auto_291483 ?auto_291484 ?auto_291485 ?auto_291486 ?auto_291487 ?auto_291488 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291504 - BLOCK
      ?auto_291505 - BLOCK
      ?auto_291506 - BLOCK
      ?auto_291507 - BLOCK
      ?auto_291508 - BLOCK
      ?auto_291509 - BLOCK
      ?auto_291510 - BLOCK
      ?auto_291511 - BLOCK
      ?auto_291512 - BLOCK
      ?auto_291513 - BLOCK
      ?auto_291514 - BLOCK
      ?auto_291515 - BLOCK
      ?auto_291516 - BLOCK
      ?auto_291517 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291517 ) ( ON-TABLE ?auto_291504 ) ( ON ?auto_291505 ?auto_291504 ) ( ON ?auto_291506 ?auto_291505 ) ( ON ?auto_291507 ?auto_291506 ) ( ON ?auto_291508 ?auto_291507 ) ( ON ?auto_291509 ?auto_291508 ) ( ON ?auto_291510 ?auto_291509 ) ( ON ?auto_291511 ?auto_291510 ) ( ON ?auto_291512 ?auto_291511 ) ( not ( = ?auto_291504 ?auto_291505 ) ) ( not ( = ?auto_291504 ?auto_291506 ) ) ( not ( = ?auto_291504 ?auto_291507 ) ) ( not ( = ?auto_291504 ?auto_291508 ) ) ( not ( = ?auto_291504 ?auto_291509 ) ) ( not ( = ?auto_291504 ?auto_291510 ) ) ( not ( = ?auto_291504 ?auto_291511 ) ) ( not ( = ?auto_291504 ?auto_291512 ) ) ( not ( = ?auto_291504 ?auto_291513 ) ) ( not ( = ?auto_291504 ?auto_291514 ) ) ( not ( = ?auto_291504 ?auto_291515 ) ) ( not ( = ?auto_291504 ?auto_291516 ) ) ( not ( = ?auto_291504 ?auto_291517 ) ) ( not ( = ?auto_291505 ?auto_291506 ) ) ( not ( = ?auto_291505 ?auto_291507 ) ) ( not ( = ?auto_291505 ?auto_291508 ) ) ( not ( = ?auto_291505 ?auto_291509 ) ) ( not ( = ?auto_291505 ?auto_291510 ) ) ( not ( = ?auto_291505 ?auto_291511 ) ) ( not ( = ?auto_291505 ?auto_291512 ) ) ( not ( = ?auto_291505 ?auto_291513 ) ) ( not ( = ?auto_291505 ?auto_291514 ) ) ( not ( = ?auto_291505 ?auto_291515 ) ) ( not ( = ?auto_291505 ?auto_291516 ) ) ( not ( = ?auto_291505 ?auto_291517 ) ) ( not ( = ?auto_291506 ?auto_291507 ) ) ( not ( = ?auto_291506 ?auto_291508 ) ) ( not ( = ?auto_291506 ?auto_291509 ) ) ( not ( = ?auto_291506 ?auto_291510 ) ) ( not ( = ?auto_291506 ?auto_291511 ) ) ( not ( = ?auto_291506 ?auto_291512 ) ) ( not ( = ?auto_291506 ?auto_291513 ) ) ( not ( = ?auto_291506 ?auto_291514 ) ) ( not ( = ?auto_291506 ?auto_291515 ) ) ( not ( = ?auto_291506 ?auto_291516 ) ) ( not ( = ?auto_291506 ?auto_291517 ) ) ( not ( = ?auto_291507 ?auto_291508 ) ) ( not ( = ?auto_291507 ?auto_291509 ) ) ( not ( = ?auto_291507 ?auto_291510 ) ) ( not ( = ?auto_291507 ?auto_291511 ) ) ( not ( = ?auto_291507 ?auto_291512 ) ) ( not ( = ?auto_291507 ?auto_291513 ) ) ( not ( = ?auto_291507 ?auto_291514 ) ) ( not ( = ?auto_291507 ?auto_291515 ) ) ( not ( = ?auto_291507 ?auto_291516 ) ) ( not ( = ?auto_291507 ?auto_291517 ) ) ( not ( = ?auto_291508 ?auto_291509 ) ) ( not ( = ?auto_291508 ?auto_291510 ) ) ( not ( = ?auto_291508 ?auto_291511 ) ) ( not ( = ?auto_291508 ?auto_291512 ) ) ( not ( = ?auto_291508 ?auto_291513 ) ) ( not ( = ?auto_291508 ?auto_291514 ) ) ( not ( = ?auto_291508 ?auto_291515 ) ) ( not ( = ?auto_291508 ?auto_291516 ) ) ( not ( = ?auto_291508 ?auto_291517 ) ) ( not ( = ?auto_291509 ?auto_291510 ) ) ( not ( = ?auto_291509 ?auto_291511 ) ) ( not ( = ?auto_291509 ?auto_291512 ) ) ( not ( = ?auto_291509 ?auto_291513 ) ) ( not ( = ?auto_291509 ?auto_291514 ) ) ( not ( = ?auto_291509 ?auto_291515 ) ) ( not ( = ?auto_291509 ?auto_291516 ) ) ( not ( = ?auto_291509 ?auto_291517 ) ) ( not ( = ?auto_291510 ?auto_291511 ) ) ( not ( = ?auto_291510 ?auto_291512 ) ) ( not ( = ?auto_291510 ?auto_291513 ) ) ( not ( = ?auto_291510 ?auto_291514 ) ) ( not ( = ?auto_291510 ?auto_291515 ) ) ( not ( = ?auto_291510 ?auto_291516 ) ) ( not ( = ?auto_291510 ?auto_291517 ) ) ( not ( = ?auto_291511 ?auto_291512 ) ) ( not ( = ?auto_291511 ?auto_291513 ) ) ( not ( = ?auto_291511 ?auto_291514 ) ) ( not ( = ?auto_291511 ?auto_291515 ) ) ( not ( = ?auto_291511 ?auto_291516 ) ) ( not ( = ?auto_291511 ?auto_291517 ) ) ( not ( = ?auto_291512 ?auto_291513 ) ) ( not ( = ?auto_291512 ?auto_291514 ) ) ( not ( = ?auto_291512 ?auto_291515 ) ) ( not ( = ?auto_291512 ?auto_291516 ) ) ( not ( = ?auto_291512 ?auto_291517 ) ) ( not ( = ?auto_291513 ?auto_291514 ) ) ( not ( = ?auto_291513 ?auto_291515 ) ) ( not ( = ?auto_291513 ?auto_291516 ) ) ( not ( = ?auto_291513 ?auto_291517 ) ) ( not ( = ?auto_291514 ?auto_291515 ) ) ( not ( = ?auto_291514 ?auto_291516 ) ) ( not ( = ?auto_291514 ?auto_291517 ) ) ( not ( = ?auto_291515 ?auto_291516 ) ) ( not ( = ?auto_291515 ?auto_291517 ) ) ( not ( = ?auto_291516 ?auto_291517 ) ) ( ON ?auto_291516 ?auto_291517 ) ( ON ?auto_291515 ?auto_291516 ) ( ON ?auto_291514 ?auto_291515 ) ( CLEAR ?auto_291512 ) ( ON ?auto_291513 ?auto_291514 ) ( CLEAR ?auto_291513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_291504 ?auto_291505 ?auto_291506 ?auto_291507 ?auto_291508 ?auto_291509 ?auto_291510 ?auto_291511 ?auto_291512 ?auto_291513 )
      ( MAKE-14PILE ?auto_291504 ?auto_291505 ?auto_291506 ?auto_291507 ?auto_291508 ?auto_291509 ?auto_291510 ?auto_291511 ?auto_291512 ?auto_291513 ?auto_291514 ?auto_291515 ?auto_291516 ?auto_291517 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291532 - BLOCK
      ?auto_291533 - BLOCK
      ?auto_291534 - BLOCK
      ?auto_291535 - BLOCK
      ?auto_291536 - BLOCK
      ?auto_291537 - BLOCK
      ?auto_291538 - BLOCK
      ?auto_291539 - BLOCK
      ?auto_291540 - BLOCK
      ?auto_291541 - BLOCK
      ?auto_291542 - BLOCK
      ?auto_291543 - BLOCK
      ?auto_291544 - BLOCK
      ?auto_291545 - BLOCK
    )
    :vars
    (
      ?auto_291546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291545 ?auto_291546 ) ( ON-TABLE ?auto_291532 ) ( ON ?auto_291533 ?auto_291532 ) ( ON ?auto_291534 ?auto_291533 ) ( ON ?auto_291535 ?auto_291534 ) ( ON ?auto_291536 ?auto_291535 ) ( ON ?auto_291537 ?auto_291536 ) ( ON ?auto_291538 ?auto_291537 ) ( ON ?auto_291539 ?auto_291538 ) ( not ( = ?auto_291532 ?auto_291533 ) ) ( not ( = ?auto_291532 ?auto_291534 ) ) ( not ( = ?auto_291532 ?auto_291535 ) ) ( not ( = ?auto_291532 ?auto_291536 ) ) ( not ( = ?auto_291532 ?auto_291537 ) ) ( not ( = ?auto_291532 ?auto_291538 ) ) ( not ( = ?auto_291532 ?auto_291539 ) ) ( not ( = ?auto_291532 ?auto_291540 ) ) ( not ( = ?auto_291532 ?auto_291541 ) ) ( not ( = ?auto_291532 ?auto_291542 ) ) ( not ( = ?auto_291532 ?auto_291543 ) ) ( not ( = ?auto_291532 ?auto_291544 ) ) ( not ( = ?auto_291532 ?auto_291545 ) ) ( not ( = ?auto_291532 ?auto_291546 ) ) ( not ( = ?auto_291533 ?auto_291534 ) ) ( not ( = ?auto_291533 ?auto_291535 ) ) ( not ( = ?auto_291533 ?auto_291536 ) ) ( not ( = ?auto_291533 ?auto_291537 ) ) ( not ( = ?auto_291533 ?auto_291538 ) ) ( not ( = ?auto_291533 ?auto_291539 ) ) ( not ( = ?auto_291533 ?auto_291540 ) ) ( not ( = ?auto_291533 ?auto_291541 ) ) ( not ( = ?auto_291533 ?auto_291542 ) ) ( not ( = ?auto_291533 ?auto_291543 ) ) ( not ( = ?auto_291533 ?auto_291544 ) ) ( not ( = ?auto_291533 ?auto_291545 ) ) ( not ( = ?auto_291533 ?auto_291546 ) ) ( not ( = ?auto_291534 ?auto_291535 ) ) ( not ( = ?auto_291534 ?auto_291536 ) ) ( not ( = ?auto_291534 ?auto_291537 ) ) ( not ( = ?auto_291534 ?auto_291538 ) ) ( not ( = ?auto_291534 ?auto_291539 ) ) ( not ( = ?auto_291534 ?auto_291540 ) ) ( not ( = ?auto_291534 ?auto_291541 ) ) ( not ( = ?auto_291534 ?auto_291542 ) ) ( not ( = ?auto_291534 ?auto_291543 ) ) ( not ( = ?auto_291534 ?auto_291544 ) ) ( not ( = ?auto_291534 ?auto_291545 ) ) ( not ( = ?auto_291534 ?auto_291546 ) ) ( not ( = ?auto_291535 ?auto_291536 ) ) ( not ( = ?auto_291535 ?auto_291537 ) ) ( not ( = ?auto_291535 ?auto_291538 ) ) ( not ( = ?auto_291535 ?auto_291539 ) ) ( not ( = ?auto_291535 ?auto_291540 ) ) ( not ( = ?auto_291535 ?auto_291541 ) ) ( not ( = ?auto_291535 ?auto_291542 ) ) ( not ( = ?auto_291535 ?auto_291543 ) ) ( not ( = ?auto_291535 ?auto_291544 ) ) ( not ( = ?auto_291535 ?auto_291545 ) ) ( not ( = ?auto_291535 ?auto_291546 ) ) ( not ( = ?auto_291536 ?auto_291537 ) ) ( not ( = ?auto_291536 ?auto_291538 ) ) ( not ( = ?auto_291536 ?auto_291539 ) ) ( not ( = ?auto_291536 ?auto_291540 ) ) ( not ( = ?auto_291536 ?auto_291541 ) ) ( not ( = ?auto_291536 ?auto_291542 ) ) ( not ( = ?auto_291536 ?auto_291543 ) ) ( not ( = ?auto_291536 ?auto_291544 ) ) ( not ( = ?auto_291536 ?auto_291545 ) ) ( not ( = ?auto_291536 ?auto_291546 ) ) ( not ( = ?auto_291537 ?auto_291538 ) ) ( not ( = ?auto_291537 ?auto_291539 ) ) ( not ( = ?auto_291537 ?auto_291540 ) ) ( not ( = ?auto_291537 ?auto_291541 ) ) ( not ( = ?auto_291537 ?auto_291542 ) ) ( not ( = ?auto_291537 ?auto_291543 ) ) ( not ( = ?auto_291537 ?auto_291544 ) ) ( not ( = ?auto_291537 ?auto_291545 ) ) ( not ( = ?auto_291537 ?auto_291546 ) ) ( not ( = ?auto_291538 ?auto_291539 ) ) ( not ( = ?auto_291538 ?auto_291540 ) ) ( not ( = ?auto_291538 ?auto_291541 ) ) ( not ( = ?auto_291538 ?auto_291542 ) ) ( not ( = ?auto_291538 ?auto_291543 ) ) ( not ( = ?auto_291538 ?auto_291544 ) ) ( not ( = ?auto_291538 ?auto_291545 ) ) ( not ( = ?auto_291538 ?auto_291546 ) ) ( not ( = ?auto_291539 ?auto_291540 ) ) ( not ( = ?auto_291539 ?auto_291541 ) ) ( not ( = ?auto_291539 ?auto_291542 ) ) ( not ( = ?auto_291539 ?auto_291543 ) ) ( not ( = ?auto_291539 ?auto_291544 ) ) ( not ( = ?auto_291539 ?auto_291545 ) ) ( not ( = ?auto_291539 ?auto_291546 ) ) ( not ( = ?auto_291540 ?auto_291541 ) ) ( not ( = ?auto_291540 ?auto_291542 ) ) ( not ( = ?auto_291540 ?auto_291543 ) ) ( not ( = ?auto_291540 ?auto_291544 ) ) ( not ( = ?auto_291540 ?auto_291545 ) ) ( not ( = ?auto_291540 ?auto_291546 ) ) ( not ( = ?auto_291541 ?auto_291542 ) ) ( not ( = ?auto_291541 ?auto_291543 ) ) ( not ( = ?auto_291541 ?auto_291544 ) ) ( not ( = ?auto_291541 ?auto_291545 ) ) ( not ( = ?auto_291541 ?auto_291546 ) ) ( not ( = ?auto_291542 ?auto_291543 ) ) ( not ( = ?auto_291542 ?auto_291544 ) ) ( not ( = ?auto_291542 ?auto_291545 ) ) ( not ( = ?auto_291542 ?auto_291546 ) ) ( not ( = ?auto_291543 ?auto_291544 ) ) ( not ( = ?auto_291543 ?auto_291545 ) ) ( not ( = ?auto_291543 ?auto_291546 ) ) ( not ( = ?auto_291544 ?auto_291545 ) ) ( not ( = ?auto_291544 ?auto_291546 ) ) ( not ( = ?auto_291545 ?auto_291546 ) ) ( ON ?auto_291544 ?auto_291545 ) ( ON ?auto_291543 ?auto_291544 ) ( ON ?auto_291542 ?auto_291543 ) ( ON ?auto_291541 ?auto_291542 ) ( CLEAR ?auto_291539 ) ( ON ?auto_291540 ?auto_291541 ) ( CLEAR ?auto_291540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_291532 ?auto_291533 ?auto_291534 ?auto_291535 ?auto_291536 ?auto_291537 ?auto_291538 ?auto_291539 ?auto_291540 )
      ( MAKE-14PILE ?auto_291532 ?auto_291533 ?auto_291534 ?auto_291535 ?auto_291536 ?auto_291537 ?auto_291538 ?auto_291539 ?auto_291540 ?auto_291541 ?auto_291542 ?auto_291543 ?auto_291544 ?auto_291545 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291561 - BLOCK
      ?auto_291562 - BLOCK
      ?auto_291563 - BLOCK
      ?auto_291564 - BLOCK
      ?auto_291565 - BLOCK
      ?auto_291566 - BLOCK
      ?auto_291567 - BLOCK
      ?auto_291568 - BLOCK
      ?auto_291569 - BLOCK
      ?auto_291570 - BLOCK
      ?auto_291571 - BLOCK
      ?auto_291572 - BLOCK
      ?auto_291573 - BLOCK
      ?auto_291574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291574 ) ( ON-TABLE ?auto_291561 ) ( ON ?auto_291562 ?auto_291561 ) ( ON ?auto_291563 ?auto_291562 ) ( ON ?auto_291564 ?auto_291563 ) ( ON ?auto_291565 ?auto_291564 ) ( ON ?auto_291566 ?auto_291565 ) ( ON ?auto_291567 ?auto_291566 ) ( ON ?auto_291568 ?auto_291567 ) ( not ( = ?auto_291561 ?auto_291562 ) ) ( not ( = ?auto_291561 ?auto_291563 ) ) ( not ( = ?auto_291561 ?auto_291564 ) ) ( not ( = ?auto_291561 ?auto_291565 ) ) ( not ( = ?auto_291561 ?auto_291566 ) ) ( not ( = ?auto_291561 ?auto_291567 ) ) ( not ( = ?auto_291561 ?auto_291568 ) ) ( not ( = ?auto_291561 ?auto_291569 ) ) ( not ( = ?auto_291561 ?auto_291570 ) ) ( not ( = ?auto_291561 ?auto_291571 ) ) ( not ( = ?auto_291561 ?auto_291572 ) ) ( not ( = ?auto_291561 ?auto_291573 ) ) ( not ( = ?auto_291561 ?auto_291574 ) ) ( not ( = ?auto_291562 ?auto_291563 ) ) ( not ( = ?auto_291562 ?auto_291564 ) ) ( not ( = ?auto_291562 ?auto_291565 ) ) ( not ( = ?auto_291562 ?auto_291566 ) ) ( not ( = ?auto_291562 ?auto_291567 ) ) ( not ( = ?auto_291562 ?auto_291568 ) ) ( not ( = ?auto_291562 ?auto_291569 ) ) ( not ( = ?auto_291562 ?auto_291570 ) ) ( not ( = ?auto_291562 ?auto_291571 ) ) ( not ( = ?auto_291562 ?auto_291572 ) ) ( not ( = ?auto_291562 ?auto_291573 ) ) ( not ( = ?auto_291562 ?auto_291574 ) ) ( not ( = ?auto_291563 ?auto_291564 ) ) ( not ( = ?auto_291563 ?auto_291565 ) ) ( not ( = ?auto_291563 ?auto_291566 ) ) ( not ( = ?auto_291563 ?auto_291567 ) ) ( not ( = ?auto_291563 ?auto_291568 ) ) ( not ( = ?auto_291563 ?auto_291569 ) ) ( not ( = ?auto_291563 ?auto_291570 ) ) ( not ( = ?auto_291563 ?auto_291571 ) ) ( not ( = ?auto_291563 ?auto_291572 ) ) ( not ( = ?auto_291563 ?auto_291573 ) ) ( not ( = ?auto_291563 ?auto_291574 ) ) ( not ( = ?auto_291564 ?auto_291565 ) ) ( not ( = ?auto_291564 ?auto_291566 ) ) ( not ( = ?auto_291564 ?auto_291567 ) ) ( not ( = ?auto_291564 ?auto_291568 ) ) ( not ( = ?auto_291564 ?auto_291569 ) ) ( not ( = ?auto_291564 ?auto_291570 ) ) ( not ( = ?auto_291564 ?auto_291571 ) ) ( not ( = ?auto_291564 ?auto_291572 ) ) ( not ( = ?auto_291564 ?auto_291573 ) ) ( not ( = ?auto_291564 ?auto_291574 ) ) ( not ( = ?auto_291565 ?auto_291566 ) ) ( not ( = ?auto_291565 ?auto_291567 ) ) ( not ( = ?auto_291565 ?auto_291568 ) ) ( not ( = ?auto_291565 ?auto_291569 ) ) ( not ( = ?auto_291565 ?auto_291570 ) ) ( not ( = ?auto_291565 ?auto_291571 ) ) ( not ( = ?auto_291565 ?auto_291572 ) ) ( not ( = ?auto_291565 ?auto_291573 ) ) ( not ( = ?auto_291565 ?auto_291574 ) ) ( not ( = ?auto_291566 ?auto_291567 ) ) ( not ( = ?auto_291566 ?auto_291568 ) ) ( not ( = ?auto_291566 ?auto_291569 ) ) ( not ( = ?auto_291566 ?auto_291570 ) ) ( not ( = ?auto_291566 ?auto_291571 ) ) ( not ( = ?auto_291566 ?auto_291572 ) ) ( not ( = ?auto_291566 ?auto_291573 ) ) ( not ( = ?auto_291566 ?auto_291574 ) ) ( not ( = ?auto_291567 ?auto_291568 ) ) ( not ( = ?auto_291567 ?auto_291569 ) ) ( not ( = ?auto_291567 ?auto_291570 ) ) ( not ( = ?auto_291567 ?auto_291571 ) ) ( not ( = ?auto_291567 ?auto_291572 ) ) ( not ( = ?auto_291567 ?auto_291573 ) ) ( not ( = ?auto_291567 ?auto_291574 ) ) ( not ( = ?auto_291568 ?auto_291569 ) ) ( not ( = ?auto_291568 ?auto_291570 ) ) ( not ( = ?auto_291568 ?auto_291571 ) ) ( not ( = ?auto_291568 ?auto_291572 ) ) ( not ( = ?auto_291568 ?auto_291573 ) ) ( not ( = ?auto_291568 ?auto_291574 ) ) ( not ( = ?auto_291569 ?auto_291570 ) ) ( not ( = ?auto_291569 ?auto_291571 ) ) ( not ( = ?auto_291569 ?auto_291572 ) ) ( not ( = ?auto_291569 ?auto_291573 ) ) ( not ( = ?auto_291569 ?auto_291574 ) ) ( not ( = ?auto_291570 ?auto_291571 ) ) ( not ( = ?auto_291570 ?auto_291572 ) ) ( not ( = ?auto_291570 ?auto_291573 ) ) ( not ( = ?auto_291570 ?auto_291574 ) ) ( not ( = ?auto_291571 ?auto_291572 ) ) ( not ( = ?auto_291571 ?auto_291573 ) ) ( not ( = ?auto_291571 ?auto_291574 ) ) ( not ( = ?auto_291572 ?auto_291573 ) ) ( not ( = ?auto_291572 ?auto_291574 ) ) ( not ( = ?auto_291573 ?auto_291574 ) ) ( ON ?auto_291573 ?auto_291574 ) ( ON ?auto_291572 ?auto_291573 ) ( ON ?auto_291571 ?auto_291572 ) ( ON ?auto_291570 ?auto_291571 ) ( CLEAR ?auto_291568 ) ( ON ?auto_291569 ?auto_291570 ) ( CLEAR ?auto_291569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_291561 ?auto_291562 ?auto_291563 ?auto_291564 ?auto_291565 ?auto_291566 ?auto_291567 ?auto_291568 ?auto_291569 )
      ( MAKE-14PILE ?auto_291561 ?auto_291562 ?auto_291563 ?auto_291564 ?auto_291565 ?auto_291566 ?auto_291567 ?auto_291568 ?auto_291569 ?auto_291570 ?auto_291571 ?auto_291572 ?auto_291573 ?auto_291574 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291589 - BLOCK
      ?auto_291590 - BLOCK
      ?auto_291591 - BLOCK
      ?auto_291592 - BLOCK
      ?auto_291593 - BLOCK
      ?auto_291594 - BLOCK
      ?auto_291595 - BLOCK
      ?auto_291596 - BLOCK
      ?auto_291597 - BLOCK
      ?auto_291598 - BLOCK
      ?auto_291599 - BLOCK
      ?auto_291600 - BLOCK
      ?auto_291601 - BLOCK
      ?auto_291602 - BLOCK
    )
    :vars
    (
      ?auto_291603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291602 ?auto_291603 ) ( ON-TABLE ?auto_291589 ) ( ON ?auto_291590 ?auto_291589 ) ( ON ?auto_291591 ?auto_291590 ) ( ON ?auto_291592 ?auto_291591 ) ( ON ?auto_291593 ?auto_291592 ) ( ON ?auto_291594 ?auto_291593 ) ( ON ?auto_291595 ?auto_291594 ) ( not ( = ?auto_291589 ?auto_291590 ) ) ( not ( = ?auto_291589 ?auto_291591 ) ) ( not ( = ?auto_291589 ?auto_291592 ) ) ( not ( = ?auto_291589 ?auto_291593 ) ) ( not ( = ?auto_291589 ?auto_291594 ) ) ( not ( = ?auto_291589 ?auto_291595 ) ) ( not ( = ?auto_291589 ?auto_291596 ) ) ( not ( = ?auto_291589 ?auto_291597 ) ) ( not ( = ?auto_291589 ?auto_291598 ) ) ( not ( = ?auto_291589 ?auto_291599 ) ) ( not ( = ?auto_291589 ?auto_291600 ) ) ( not ( = ?auto_291589 ?auto_291601 ) ) ( not ( = ?auto_291589 ?auto_291602 ) ) ( not ( = ?auto_291589 ?auto_291603 ) ) ( not ( = ?auto_291590 ?auto_291591 ) ) ( not ( = ?auto_291590 ?auto_291592 ) ) ( not ( = ?auto_291590 ?auto_291593 ) ) ( not ( = ?auto_291590 ?auto_291594 ) ) ( not ( = ?auto_291590 ?auto_291595 ) ) ( not ( = ?auto_291590 ?auto_291596 ) ) ( not ( = ?auto_291590 ?auto_291597 ) ) ( not ( = ?auto_291590 ?auto_291598 ) ) ( not ( = ?auto_291590 ?auto_291599 ) ) ( not ( = ?auto_291590 ?auto_291600 ) ) ( not ( = ?auto_291590 ?auto_291601 ) ) ( not ( = ?auto_291590 ?auto_291602 ) ) ( not ( = ?auto_291590 ?auto_291603 ) ) ( not ( = ?auto_291591 ?auto_291592 ) ) ( not ( = ?auto_291591 ?auto_291593 ) ) ( not ( = ?auto_291591 ?auto_291594 ) ) ( not ( = ?auto_291591 ?auto_291595 ) ) ( not ( = ?auto_291591 ?auto_291596 ) ) ( not ( = ?auto_291591 ?auto_291597 ) ) ( not ( = ?auto_291591 ?auto_291598 ) ) ( not ( = ?auto_291591 ?auto_291599 ) ) ( not ( = ?auto_291591 ?auto_291600 ) ) ( not ( = ?auto_291591 ?auto_291601 ) ) ( not ( = ?auto_291591 ?auto_291602 ) ) ( not ( = ?auto_291591 ?auto_291603 ) ) ( not ( = ?auto_291592 ?auto_291593 ) ) ( not ( = ?auto_291592 ?auto_291594 ) ) ( not ( = ?auto_291592 ?auto_291595 ) ) ( not ( = ?auto_291592 ?auto_291596 ) ) ( not ( = ?auto_291592 ?auto_291597 ) ) ( not ( = ?auto_291592 ?auto_291598 ) ) ( not ( = ?auto_291592 ?auto_291599 ) ) ( not ( = ?auto_291592 ?auto_291600 ) ) ( not ( = ?auto_291592 ?auto_291601 ) ) ( not ( = ?auto_291592 ?auto_291602 ) ) ( not ( = ?auto_291592 ?auto_291603 ) ) ( not ( = ?auto_291593 ?auto_291594 ) ) ( not ( = ?auto_291593 ?auto_291595 ) ) ( not ( = ?auto_291593 ?auto_291596 ) ) ( not ( = ?auto_291593 ?auto_291597 ) ) ( not ( = ?auto_291593 ?auto_291598 ) ) ( not ( = ?auto_291593 ?auto_291599 ) ) ( not ( = ?auto_291593 ?auto_291600 ) ) ( not ( = ?auto_291593 ?auto_291601 ) ) ( not ( = ?auto_291593 ?auto_291602 ) ) ( not ( = ?auto_291593 ?auto_291603 ) ) ( not ( = ?auto_291594 ?auto_291595 ) ) ( not ( = ?auto_291594 ?auto_291596 ) ) ( not ( = ?auto_291594 ?auto_291597 ) ) ( not ( = ?auto_291594 ?auto_291598 ) ) ( not ( = ?auto_291594 ?auto_291599 ) ) ( not ( = ?auto_291594 ?auto_291600 ) ) ( not ( = ?auto_291594 ?auto_291601 ) ) ( not ( = ?auto_291594 ?auto_291602 ) ) ( not ( = ?auto_291594 ?auto_291603 ) ) ( not ( = ?auto_291595 ?auto_291596 ) ) ( not ( = ?auto_291595 ?auto_291597 ) ) ( not ( = ?auto_291595 ?auto_291598 ) ) ( not ( = ?auto_291595 ?auto_291599 ) ) ( not ( = ?auto_291595 ?auto_291600 ) ) ( not ( = ?auto_291595 ?auto_291601 ) ) ( not ( = ?auto_291595 ?auto_291602 ) ) ( not ( = ?auto_291595 ?auto_291603 ) ) ( not ( = ?auto_291596 ?auto_291597 ) ) ( not ( = ?auto_291596 ?auto_291598 ) ) ( not ( = ?auto_291596 ?auto_291599 ) ) ( not ( = ?auto_291596 ?auto_291600 ) ) ( not ( = ?auto_291596 ?auto_291601 ) ) ( not ( = ?auto_291596 ?auto_291602 ) ) ( not ( = ?auto_291596 ?auto_291603 ) ) ( not ( = ?auto_291597 ?auto_291598 ) ) ( not ( = ?auto_291597 ?auto_291599 ) ) ( not ( = ?auto_291597 ?auto_291600 ) ) ( not ( = ?auto_291597 ?auto_291601 ) ) ( not ( = ?auto_291597 ?auto_291602 ) ) ( not ( = ?auto_291597 ?auto_291603 ) ) ( not ( = ?auto_291598 ?auto_291599 ) ) ( not ( = ?auto_291598 ?auto_291600 ) ) ( not ( = ?auto_291598 ?auto_291601 ) ) ( not ( = ?auto_291598 ?auto_291602 ) ) ( not ( = ?auto_291598 ?auto_291603 ) ) ( not ( = ?auto_291599 ?auto_291600 ) ) ( not ( = ?auto_291599 ?auto_291601 ) ) ( not ( = ?auto_291599 ?auto_291602 ) ) ( not ( = ?auto_291599 ?auto_291603 ) ) ( not ( = ?auto_291600 ?auto_291601 ) ) ( not ( = ?auto_291600 ?auto_291602 ) ) ( not ( = ?auto_291600 ?auto_291603 ) ) ( not ( = ?auto_291601 ?auto_291602 ) ) ( not ( = ?auto_291601 ?auto_291603 ) ) ( not ( = ?auto_291602 ?auto_291603 ) ) ( ON ?auto_291601 ?auto_291602 ) ( ON ?auto_291600 ?auto_291601 ) ( ON ?auto_291599 ?auto_291600 ) ( ON ?auto_291598 ?auto_291599 ) ( ON ?auto_291597 ?auto_291598 ) ( CLEAR ?auto_291595 ) ( ON ?auto_291596 ?auto_291597 ) ( CLEAR ?auto_291596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_291589 ?auto_291590 ?auto_291591 ?auto_291592 ?auto_291593 ?auto_291594 ?auto_291595 ?auto_291596 )
      ( MAKE-14PILE ?auto_291589 ?auto_291590 ?auto_291591 ?auto_291592 ?auto_291593 ?auto_291594 ?auto_291595 ?auto_291596 ?auto_291597 ?auto_291598 ?auto_291599 ?auto_291600 ?auto_291601 ?auto_291602 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291618 - BLOCK
      ?auto_291619 - BLOCK
      ?auto_291620 - BLOCK
      ?auto_291621 - BLOCK
      ?auto_291622 - BLOCK
      ?auto_291623 - BLOCK
      ?auto_291624 - BLOCK
      ?auto_291625 - BLOCK
      ?auto_291626 - BLOCK
      ?auto_291627 - BLOCK
      ?auto_291628 - BLOCK
      ?auto_291629 - BLOCK
      ?auto_291630 - BLOCK
      ?auto_291631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291631 ) ( ON-TABLE ?auto_291618 ) ( ON ?auto_291619 ?auto_291618 ) ( ON ?auto_291620 ?auto_291619 ) ( ON ?auto_291621 ?auto_291620 ) ( ON ?auto_291622 ?auto_291621 ) ( ON ?auto_291623 ?auto_291622 ) ( ON ?auto_291624 ?auto_291623 ) ( not ( = ?auto_291618 ?auto_291619 ) ) ( not ( = ?auto_291618 ?auto_291620 ) ) ( not ( = ?auto_291618 ?auto_291621 ) ) ( not ( = ?auto_291618 ?auto_291622 ) ) ( not ( = ?auto_291618 ?auto_291623 ) ) ( not ( = ?auto_291618 ?auto_291624 ) ) ( not ( = ?auto_291618 ?auto_291625 ) ) ( not ( = ?auto_291618 ?auto_291626 ) ) ( not ( = ?auto_291618 ?auto_291627 ) ) ( not ( = ?auto_291618 ?auto_291628 ) ) ( not ( = ?auto_291618 ?auto_291629 ) ) ( not ( = ?auto_291618 ?auto_291630 ) ) ( not ( = ?auto_291618 ?auto_291631 ) ) ( not ( = ?auto_291619 ?auto_291620 ) ) ( not ( = ?auto_291619 ?auto_291621 ) ) ( not ( = ?auto_291619 ?auto_291622 ) ) ( not ( = ?auto_291619 ?auto_291623 ) ) ( not ( = ?auto_291619 ?auto_291624 ) ) ( not ( = ?auto_291619 ?auto_291625 ) ) ( not ( = ?auto_291619 ?auto_291626 ) ) ( not ( = ?auto_291619 ?auto_291627 ) ) ( not ( = ?auto_291619 ?auto_291628 ) ) ( not ( = ?auto_291619 ?auto_291629 ) ) ( not ( = ?auto_291619 ?auto_291630 ) ) ( not ( = ?auto_291619 ?auto_291631 ) ) ( not ( = ?auto_291620 ?auto_291621 ) ) ( not ( = ?auto_291620 ?auto_291622 ) ) ( not ( = ?auto_291620 ?auto_291623 ) ) ( not ( = ?auto_291620 ?auto_291624 ) ) ( not ( = ?auto_291620 ?auto_291625 ) ) ( not ( = ?auto_291620 ?auto_291626 ) ) ( not ( = ?auto_291620 ?auto_291627 ) ) ( not ( = ?auto_291620 ?auto_291628 ) ) ( not ( = ?auto_291620 ?auto_291629 ) ) ( not ( = ?auto_291620 ?auto_291630 ) ) ( not ( = ?auto_291620 ?auto_291631 ) ) ( not ( = ?auto_291621 ?auto_291622 ) ) ( not ( = ?auto_291621 ?auto_291623 ) ) ( not ( = ?auto_291621 ?auto_291624 ) ) ( not ( = ?auto_291621 ?auto_291625 ) ) ( not ( = ?auto_291621 ?auto_291626 ) ) ( not ( = ?auto_291621 ?auto_291627 ) ) ( not ( = ?auto_291621 ?auto_291628 ) ) ( not ( = ?auto_291621 ?auto_291629 ) ) ( not ( = ?auto_291621 ?auto_291630 ) ) ( not ( = ?auto_291621 ?auto_291631 ) ) ( not ( = ?auto_291622 ?auto_291623 ) ) ( not ( = ?auto_291622 ?auto_291624 ) ) ( not ( = ?auto_291622 ?auto_291625 ) ) ( not ( = ?auto_291622 ?auto_291626 ) ) ( not ( = ?auto_291622 ?auto_291627 ) ) ( not ( = ?auto_291622 ?auto_291628 ) ) ( not ( = ?auto_291622 ?auto_291629 ) ) ( not ( = ?auto_291622 ?auto_291630 ) ) ( not ( = ?auto_291622 ?auto_291631 ) ) ( not ( = ?auto_291623 ?auto_291624 ) ) ( not ( = ?auto_291623 ?auto_291625 ) ) ( not ( = ?auto_291623 ?auto_291626 ) ) ( not ( = ?auto_291623 ?auto_291627 ) ) ( not ( = ?auto_291623 ?auto_291628 ) ) ( not ( = ?auto_291623 ?auto_291629 ) ) ( not ( = ?auto_291623 ?auto_291630 ) ) ( not ( = ?auto_291623 ?auto_291631 ) ) ( not ( = ?auto_291624 ?auto_291625 ) ) ( not ( = ?auto_291624 ?auto_291626 ) ) ( not ( = ?auto_291624 ?auto_291627 ) ) ( not ( = ?auto_291624 ?auto_291628 ) ) ( not ( = ?auto_291624 ?auto_291629 ) ) ( not ( = ?auto_291624 ?auto_291630 ) ) ( not ( = ?auto_291624 ?auto_291631 ) ) ( not ( = ?auto_291625 ?auto_291626 ) ) ( not ( = ?auto_291625 ?auto_291627 ) ) ( not ( = ?auto_291625 ?auto_291628 ) ) ( not ( = ?auto_291625 ?auto_291629 ) ) ( not ( = ?auto_291625 ?auto_291630 ) ) ( not ( = ?auto_291625 ?auto_291631 ) ) ( not ( = ?auto_291626 ?auto_291627 ) ) ( not ( = ?auto_291626 ?auto_291628 ) ) ( not ( = ?auto_291626 ?auto_291629 ) ) ( not ( = ?auto_291626 ?auto_291630 ) ) ( not ( = ?auto_291626 ?auto_291631 ) ) ( not ( = ?auto_291627 ?auto_291628 ) ) ( not ( = ?auto_291627 ?auto_291629 ) ) ( not ( = ?auto_291627 ?auto_291630 ) ) ( not ( = ?auto_291627 ?auto_291631 ) ) ( not ( = ?auto_291628 ?auto_291629 ) ) ( not ( = ?auto_291628 ?auto_291630 ) ) ( not ( = ?auto_291628 ?auto_291631 ) ) ( not ( = ?auto_291629 ?auto_291630 ) ) ( not ( = ?auto_291629 ?auto_291631 ) ) ( not ( = ?auto_291630 ?auto_291631 ) ) ( ON ?auto_291630 ?auto_291631 ) ( ON ?auto_291629 ?auto_291630 ) ( ON ?auto_291628 ?auto_291629 ) ( ON ?auto_291627 ?auto_291628 ) ( ON ?auto_291626 ?auto_291627 ) ( CLEAR ?auto_291624 ) ( ON ?auto_291625 ?auto_291626 ) ( CLEAR ?auto_291625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_291618 ?auto_291619 ?auto_291620 ?auto_291621 ?auto_291622 ?auto_291623 ?auto_291624 ?auto_291625 )
      ( MAKE-14PILE ?auto_291618 ?auto_291619 ?auto_291620 ?auto_291621 ?auto_291622 ?auto_291623 ?auto_291624 ?auto_291625 ?auto_291626 ?auto_291627 ?auto_291628 ?auto_291629 ?auto_291630 ?auto_291631 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291646 - BLOCK
      ?auto_291647 - BLOCK
      ?auto_291648 - BLOCK
      ?auto_291649 - BLOCK
      ?auto_291650 - BLOCK
      ?auto_291651 - BLOCK
      ?auto_291652 - BLOCK
      ?auto_291653 - BLOCK
      ?auto_291654 - BLOCK
      ?auto_291655 - BLOCK
      ?auto_291656 - BLOCK
      ?auto_291657 - BLOCK
      ?auto_291658 - BLOCK
      ?auto_291659 - BLOCK
    )
    :vars
    (
      ?auto_291660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291659 ?auto_291660 ) ( ON-TABLE ?auto_291646 ) ( ON ?auto_291647 ?auto_291646 ) ( ON ?auto_291648 ?auto_291647 ) ( ON ?auto_291649 ?auto_291648 ) ( ON ?auto_291650 ?auto_291649 ) ( ON ?auto_291651 ?auto_291650 ) ( not ( = ?auto_291646 ?auto_291647 ) ) ( not ( = ?auto_291646 ?auto_291648 ) ) ( not ( = ?auto_291646 ?auto_291649 ) ) ( not ( = ?auto_291646 ?auto_291650 ) ) ( not ( = ?auto_291646 ?auto_291651 ) ) ( not ( = ?auto_291646 ?auto_291652 ) ) ( not ( = ?auto_291646 ?auto_291653 ) ) ( not ( = ?auto_291646 ?auto_291654 ) ) ( not ( = ?auto_291646 ?auto_291655 ) ) ( not ( = ?auto_291646 ?auto_291656 ) ) ( not ( = ?auto_291646 ?auto_291657 ) ) ( not ( = ?auto_291646 ?auto_291658 ) ) ( not ( = ?auto_291646 ?auto_291659 ) ) ( not ( = ?auto_291646 ?auto_291660 ) ) ( not ( = ?auto_291647 ?auto_291648 ) ) ( not ( = ?auto_291647 ?auto_291649 ) ) ( not ( = ?auto_291647 ?auto_291650 ) ) ( not ( = ?auto_291647 ?auto_291651 ) ) ( not ( = ?auto_291647 ?auto_291652 ) ) ( not ( = ?auto_291647 ?auto_291653 ) ) ( not ( = ?auto_291647 ?auto_291654 ) ) ( not ( = ?auto_291647 ?auto_291655 ) ) ( not ( = ?auto_291647 ?auto_291656 ) ) ( not ( = ?auto_291647 ?auto_291657 ) ) ( not ( = ?auto_291647 ?auto_291658 ) ) ( not ( = ?auto_291647 ?auto_291659 ) ) ( not ( = ?auto_291647 ?auto_291660 ) ) ( not ( = ?auto_291648 ?auto_291649 ) ) ( not ( = ?auto_291648 ?auto_291650 ) ) ( not ( = ?auto_291648 ?auto_291651 ) ) ( not ( = ?auto_291648 ?auto_291652 ) ) ( not ( = ?auto_291648 ?auto_291653 ) ) ( not ( = ?auto_291648 ?auto_291654 ) ) ( not ( = ?auto_291648 ?auto_291655 ) ) ( not ( = ?auto_291648 ?auto_291656 ) ) ( not ( = ?auto_291648 ?auto_291657 ) ) ( not ( = ?auto_291648 ?auto_291658 ) ) ( not ( = ?auto_291648 ?auto_291659 ) ) ( not ( = ?auto_291648 ?auto_291660 ) ) ( not ( = ?auto_291649 ?auto_291650 ) ) ( not ( = ?auto_291649 ?auto_291651 ) ) ( not ( = ?auto_291649 ?auto_291652 ) ) ( not ( = ?auto_291649 ?auto_291653 ) ) ( not ( = ?auto_291649 ?auto_291654 ) ) ( not ( = ?auto_291649 ?auto_291655 ) ) ( not ( = ?auto_291649 ?auto_291656 ) ) ( not ( = ?auto_291649 ?auto_291657 ) ) ( not ( = ?auto_291649 ?auto_291658 ) ) ( not ( = ?auto_291649 ?auto_291659 ) ) ( not ( = ?auto_291649 ?auto_291660 ) ) ( not ( = ?auto_291650 ?auto_291651 ) ) ( not ( = ?auto_291650 ?auto_291652 ) ) ( not ( = ?auto_291650 ?auto_291653 ) ) ( not ( = ?auto_291650 ?auto_291654 ) ) ( not ( = ?auto_291650 ?auto_291655 ) ) ( not ( = ?auto_291650 ?auto_291656 ) ) ( not ( = ?auto_291650 ?auto_291657 ) ) ( not ( = ?auto_291650 ?auto_291658 ) ) ( not ( = ?auto_291650 ?auto_291659 ) ) ( not ( = ?auto_291650 ?auto_291660 ) ) ( not ( = ?auto_291651 ?auto_291652 ) ) ( not ( = ?auto_291651 ?auto_291653 ) ) ( not ( = ?auto_291651 ?auto_291654 ) ) ( not ( = ?auto_291651 ?auto_291655 ) ) ( not ( = ?auto_291651 ?auto_291656 ) ) ( not ( = ?auto_291651 ?auto_291657 ) ) ( not ( = ?auto_291651 ?auto_291658 ) ) ( not ( = ?auto_291651 ?auto_291659 ) ) ( not ( = ?auto_291651 ?auto_291660 ) ) ( not ( = ?auto_291652 ?auto_291653 ) ) ( not ( = ?auto_291652 ?auto_291654 ) ) ( not ( = ?auto_291652 ?auto_291655 ) ) ( not ( = ?auto_291652 ?auto_291656 ) ) ( not ( = ?auto_291652 ?auto_291657 ) ) ( not ( = ?auto_291652 ?auto_291658 ) ) ( not ( = ?auto_291652 ?auto_291659 ) ) ( not ( = ?auto_291652 ?auto_291660 ) ) ( not ( = ?auto_291653 ?auto_291654 ) ) ( not ( = ?auto_291653 ?auto_291655 ) ) ( not ( = ?auto_291653 ?auto_291656 ) ) ( not ( = ?auto_291653 ?auto_291657 ) ) ( not ( = ?auto_291653 ?auto_291658 ) ) ( not ( = ?auto_291653 ?auto_291659 ) ) ( not ( = ?auto_291653 ?auto_291660 ) ) ( not ( = ?auto_291654 ?auto_291655 ) ) ( not ( = ?auto_291654 ?auto_291656 ) ) ( not ( = ?auto_291654 ?auto_291657 ) ) ( not ( = ?auto_291654 ?auto_291658 ) ) ( not ( = ?auto_291654 ?auto_291659 ) ) ( not ( = ?auto_291654 ?auto_291660 ) ) ( not ( = ?auto_291655 ?auto_291656 ) ) ( not ( = ?auto_291655 ?auto_291657 ) ) ( not ( = ?auto_291655 ?auto_291658 ) ) ( not ( = ?auto_291655 ?auto_291659 ) ) ( not ( = ?auto_291655 ?auto_291660 ) ) ( not ( = ?auto_291656 ?auto_291657 ) ) ( not ( = ?auto_291656 ?auto_291658 ) ) ( not ( = ?auto_291656 ?auto_291659 ) ) ( not ( = ?auto_291656 ?auto_291660 ) ) ( not ( = ?auto_291657 ?auto_291658 ) ) ( not ( = ?auto_291657 ?auto_291659 ) ) ( not ( = ?auto_291657 ?auto_291660 ) ) ( not ( = ?auto_291658 ?auto_291659 ) ) ( not ( = ?auto_291658 ?auto_291660 ) ) ( not ( = ?auto_291659 ?auto_291660 ) ) ( ON ?auto_291658 ?auto_291659 ) ( ON ?auto_291657 ?auto_291658 ) ( ON ?auto_291656 ?auto_291657 ) ( ON ?auto_291655 ?auto_291656 ) ( ON ?auto_291654 ?auto_291655 ) ( ON ?auto_291653 ?auto_291654 ) ( CLEAR ?auto_291651 ) ( ON ?auto_291652 ?auto_291653 ) ( CLEAR ?auto_291652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_291646 ?auto_291647 ?auto_291648 ?auto_291649 ?auto_291650 ?auto_291651 ?auto_291652 )
      ( MAKE-14PILE ?auto_291646 ?auto_291647 ?auto_291648 ?auto_291649 ?auto_291650 ?auto_291651 ?auto_291652 ?auto_291653 ?auto_291654 ?auto_291655 ?auto_291656 ?auto_291657 ?auto_291658 ?auto_291659 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291675 - BLOCK
      ?auto_291676 - BLOCK
      ?auto_291677 - BLOCK
      ?auto_291678 - BLOCK
      ?auto_291679 - BLOCK
      ?auto_291680 - BLOCK
      ?auto_291681 - BLOCK
      ?auto_291682 - BLOCK
      ?auto_291683 - BLOCK
      ?auto_291684 - BLOCK
      ?auto_291685 - BLOCK
      ?auto_291686 - BLOCK
      ?auto_291687 - BLOCK
      ?auto_291688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291688 ) ( ON-TABLE ?auto_291675 ) ( ON ?auto_291676 ?auto_291675 ) ( ON ?auto_291677 ?auto_291676 ) ( ON ?auto_291678 ?auto_291677 ) ( ON ?auto_291679 ?auto_291678 ) ( ON ?auto_291680 ?auto_291679 ) ( not ( = ?auto_291675 ?auto_291676 ) ) ( not ( = ?auto_291675 ?auto_291677 ) ) ( not ( = ?auto_291675 ?auto_291678 ) ) ( not ( = ?auto_291675 ?auto_291679 ) ) ( not ( = ?auto_291675 ?auto_291680 ) ) ( not ( = ?auto_291675 ?auto_291681 ) ) ( not ( = ?auto_291675 ?auto_291682 ) ) ( not ( = ?auto_291675 ?auto_291683 ) ) ( not ( = ?auto_291675 ?auto_291684 ) ) ( not ( = ?auto_291675 ?auto_291685 ) ) ( not ( = ?auto_291675 ?auto_291686 ) ) ( not ( = ?auto_291675 ?auto_291687 ) ) ( not ( = ?auto_291675 ?auto_291688 ) ) ( not ( = ?auto_291676 ?auto_291677 ) ) ( not ( = ?auto_291676 ?auto_291678 ) ) ( not ( = ?auto_291676 ?auto_291679 ) ) ( not ( = ?auto_291676 ?auto_291680 ) ) ( not ( = ?auto_291676 ?auto_291681 ) ) ( not ( = ?auto_291676 ?auto_291682 ) ) ( not ( = ?auto_291676 ?auto_291683 ) ) ( not ( = ?auto_291676 ?auto_291684 ) ) ( not ( = ?auto_291676 ?auto_291685 ) ) ( not ( = ?auto_291676 ?auto_291686 ) ) ( not ( = ?auto_291676 ?auto_291687 ) ) ( not ( = ?auto_291676 ?auto_291688 ) ) ( not ( = ?auto_291677 ?auto_291678 ) ) ( not ( = ?auto_291677 ?auto_291679 ) ) ( not ( = ?auto_291677 ?auto_291680 ) ) ( not ( = ?auto_291677 ?auto_291681 ) ) ( not ( = ?auto_291677 ?auto_291682 ) ) ( not ( = ?auto_291677 ?auto_291683 ) ) ( not ( = ?auto_291677 ?auto_291684 ) ) ( not ( = ?auto_291677 ?auto_291685 ) ) ( not ( = ?auto_291677 ?auto_291686 ) ) ( not ( = ?auto_291677 ?auto_291687 ) ) ( not ( = ?auto_291677 ?auto_291688 ) ) ( not ( = ?auto_291678 ?auto_291679 ) ) ( not ( = ?auto_291678 ?auto_291680 ) ) ( not ( = ?auto_291678 ?auto_291681 ) ) ( not ( = ?auto_291678 ?auto_291682 ) ) ( not ( = ?auto_291678 ?auto_291683 ) ) ( not ( = ?auto_291678 ?auto_291684 ) ) ( not ( = ?auto_291678 ?auto_291685 ) ) ( not ( = ?auto_291678 ?auto_291686 ) ) ( not ( = ?auto_291678 ?auto_291687 ) ) ( not ( = ?auto_291678 ?auto_291688 ) ) ( not ( = ?auto_291679 ?auto_291680 ) ) ( not ( = ?auto_291679 ?auto_291681 ) ) ( not ( = ?auto_291679 ?auto_291682 ) ) ( not ( = ?auto_291679 ?auto_291683 ) ) ( not ( = ?auto_291679 ?auto_291684 ) ) ( not ( = ?auto_291679 ?auto_291685 ) ) ( not ( = ?auto_291679 ?auto_291686 ) ) ( not ( = ?auto_291679 ?auto_291687 ) ) ( not ( = ?auto_291679 ?auto_291688 ) ) ( not ( = ?auto_291680 ?auto_291681 ) ) ( not ( = ?auto_291680 ?auto_291682 ) ) ( not ( = ?auto_291680 ?auto_291683 ) ) ( not ( = ?auto_291680 ?auto_291684 ) ) ( not ( = ?auto_291680 ?auto_291685 ) ) ( not ( = ?auto_291680 ?auto_291686 ) ) ( not ( = ?auto_291680 ?auto_291687 ) ) ( not ( = ?auto_291680 ?auto_291688 ) ) ( not ( = ?auto_291681 ?auto_291682 ) ) ( not ( = ?auto_291681 ?auto_291683 ) ) ( not ( = ?auto_291681 ?auto_291684 ) ) ( not ( = ?auto_291681 ?auto_291685 ) ) ( not ( = ?auto_291681 ?auto_291686 ) ) ( not ( = ?auto_291681 ?auto_291687 ) ) ( not ( = ?auto_291681 ?auto_291688 ) ) ( not ( = ?auto_291682 ?auto_291683 ) ) ( not ( = ?auto_291682 ?auto_291684 ) ) ( not ( = ?auto_291682 ?auto_291685 ) ) ( not ( = ?auto_291682 ?auto_291686 ) ) ( not ( = ?auto_291682 ?auto_291687 ) ) ( not ( = ?auto_291682 ?auto_291688 ) ) ( not ( = ?auto_291683 ?auto_291684 ) ) ( not ( = ?auto_291683 ?auto_291685 ) ) ( not ( = ?auto_291683 ?auto_291686 ) ) ( not ( = ?auto_291683 ?auto_291687 ) ) ( not ( = ?auto_291683 ?auto_291688 ) ) ( not ( = ?auto_291684 ?auto_291685 ) ) ( not ( = ?auto_291684 ?auto_291686 ) ) ( not ( = ?auto_291684 ?auto_291687 ) ) ( not ( = ?auto_291684 ?auto_291688 ) ) ( not ( = ?auto_291685 ?auto_291686 ) ) ( not ( = ?auto_291685 ?auto_291687 ) ) ( not ( = ?auto_291685 ?auto_291688 ) ) ( not ( = ?auto_291686 ?auto_291687 ) ) ( not ( = ?auto_291686 ?auto_291688 ) ) ( not ( = ?auto_291687 ?auto_291688 ) ) ( ON ?auto_291687 ?auto_291688 ) ( ON ?auto_291686 ?auto_291687 ) ( ON ?auto_291685 ?auto_291686 ) ( ON ?auto_291684 ?auto_291685 ) ( ON ?auto_291683 ?auto_291684 ) ( ON ?auto_291682 ?auto_291683 ) ( CLEAR ?auto_291680 ) ( ON ?auto_291681 ?auto_291682 ) ( CLEAR ?auto_291681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_291675 ?auto_291676 ?auto_291677 ?auto_291678 ?auto_291679 ?auto_291680 ?auto_291681 )
      ( MAKE-14PILE ?auto_291675 ?auto_291676 ?auto_291677 ?auto_291678 ?auto_291679 ?auto_291680 ?auto_291681 ?auto_291682 ?auto_291683 ?auto_291684 ?auto_291685 ?auto_291686 ?auto_291687 ?auto_291688 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291703 - BLOCK
      ?auto_291704 - BLOCK
      ?auto_291705 - BLOCK
      ?auto_291706 - BLOCK
      ?auto_291707 - BLOCK
      ?auto_291708 - BLOCK
      ?auto_291709 - BLOCK
      ?auto_291710 - BLOCK
      ?auto_291711 - BLOCK
      ?auto_291712 - BLOCK
      ?auto_291713 - BLOCK
      ?auto_291714 - BLOCK
      ?auto_291715 - BLOCK
      ?auto_291716 - BLOCK
    )
    :vars
    (
      ?auto_291717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291716 ?auto_291717 ) ( ON-TABLE ?auto_291703 ) ( ON ?auto_291704 ?auto_291703 ) ( ON ?auto_291705 ?auto_291704 ) ( ON ?auto_291706 ?auto_291705 ) ( ON ?auto_291707 ?auto_291706 ) ( not ( = ?auto_291703 ?auto_291704 ) ) ( not ( = ?auto_291703 ?auto_291705 ) ) ( not ( = ?auto_291703 ?auto_291706 ) ) ( not ( = ?auto_291703 ?auto_291707 ) ) ( not ( = ?auto_291703 ?auto_291708 ) ) ( not ( = ?auto_291703 ?auto_291709 ) ) ( not ( = ?auto_291703 ?auto_291710 ) ) ( not ( = ?auto_291703 ?auto_291711 ) ) ( not ( = ?auto_291703 ?auto_291712 ) ) ( not ( = ?auto_291703 ?auto_291713 ) ) ( not ( = ?auto_291703 ?auto_291714 ) ) ( not ( = ?auto_291703 ?auto_291715 ) ) ( not ( = ?auto_291703 ?auto_291716 ) ) ( not ( = ?auto_291703 ?auto_291717 ) ) ( not ( = ?auto_291704 ?auto_291705 ) ) ( not ( = ?auto_291704 ?auto_291706 ) ) ( not ( = ?auto_291704 ?auto_291707 ) ) ( not ( = ?auto_291704 ?auto_291708 ) ) ( not ( = ?auto_291704 ?auto_291709 ) ) ( not ( = ?auto_291704 ?auto_291710 ) ) ( not ( = ?auto_291704 ?auto_291711 ) ) ( not ( = ?auto_291704 ?auto_291712 ) ) ( not ( = ?auto_291704 ?auto_291713 ) ) ( not ( = ?auto_291704 ?auto_291714 ) ) ( not ( = ?auto_291704 ?auto_291715 ) ) ( not ( = ?auto_291704 ?auto_291716 ) ) ( not ( = ?auto_291704 ?auto_291717 ) ) ( not ( = ?auto_291705 ?auto_291706 ) ) ( not ( = ?auto_291705 ?auto_291707 ) ) ( not ( = ?auto_291705 ?auto_291708 ) ) ( not ( = ?auto_291705 ?auto_291709 ) ) ( not ( = ?auto_291705 ?auto_291710 ) ) ( not ( = ?auto_291705 ?auto_291711 ) ) ( not ( = ?auto_291705 ?auto_291712 ) ) ( not ( = ?auto_291705 ?auto_291713 ) ) ( not ( = ?auto_291705 ?auto_291714 ) ) ( not ( = ?auto_291705 ?auto_291715 ) ) ( not ( = ?auto_291705 ?auto_291716 ) ) ( not ( = ?auto_291705 ?auto_291717 ) ) ( not ( = ?auto_291706 ?auto_291707 ) ) ( not ( = ?auto_291706 ?auto_291708 ) ) ( not ( = ?auto_291706 ?auto_291709 ) ) ( not ( = ?auto_291706 ?auto_291710 ) ) ( not ( = ?auto_291706 ?auto_291711 ) ) ( not ( = ?auto_291706 ?auto_291712 ) ) ( not ( = ?auto_291706 ?auto_291713 ) ) ( not ( = ?auto_291706 ?auto_291714 ) ) ( not ( = ?auto_291706 ?auto_291715 ) ) ( not ( = ?auto_291706 ?auto_291716 ) ) ( not ( = ?auto_291706 ?auto_291717 ) ) ( not ( = ?auto_291707 ?auto_291708 ) ) ( not ( = ?auto_291707 ?auto_291709 ) ) ( not ( = ?auto_291707 ?auto_291710 ) ) ( not ( = ?auto_291707 ?auto_291711 ) ) ( not ( = ?auto_291707 ?auto_291712 ) ) ( not ( = ?auto_291707 ?auto_291713 ) ) ( not ( = ?auto_291707 ?auto_291714 ) ) ( not ( = ?auto_291707 ?auto_291715 ) ) ( not ( = ?auto_291707 ?auto_291716 ) ) ( not ( = ?auto_291707 ?auto_291717 ) ) ( not ( = ?auto_291708 ?auto_291709 ) ) ( not ( = ?auto_291708 ?auto_291710 ) ) ( not ( = ?auto_291708 ?auto_291711 ) ) ( not ( = ?auto_291708 ?auto_291712 ) ) ( not ( = ?auto_291708 ?auto_291713 ) ) ( not ( = ?auto_291708 ?auto_291714 ) ) ( not ( = ?auto_291708 ?auto_291715 ) ) ( not ( = ?auto_291708 ?auto_291716 ) ) ( not ( = ?auto_291708 ?auto_291717 ) ) ( not ( = ?auto_291709 ?auto_291710 ) ) ( not ( = ?auto_291709 ?auto_291711 ) ) ( not ( = ?auto_291709 ?auto_291712 ) ) ( not ( = ?auto_291709 ?auto_291713 ) ) ( not ( = ?auto_291709 ?auto_291714 ) ) ( not ( = ?auto_291709 ?auto_291715 ) ) ( not ( = ?auto_291709 ?auto_291716 ) ) ( not ( = ?auto_291709 ?auto_291717 ) ) ( not ( = ?auto_291710 ?auto_291711 ) ) ( not ( = ?auto_291710 ?auto_291712 ) ) ( not ( = ?auto_291710 ?auto_291713 ) ) ( not ( = ?auto_291710 ?auto_291714 ) ) ( not ( = ?auto_291710 ?auto_291715 ) ) ( not ( = ?auto_291710 ?auto_291716 ) ) ( not ( = ?auto_291710 ?auto_291717 ) ) ( not ( = ?auto_291711 ?auto_291712 ) ) ( not ( = ?auto_291711 ?auto_291713 ) ) ( not ( = ?auto_291711 ?auto_291714 ) ) ( not ( = ?auto_291711 ?auto_291715 ) ) ( not ( = ?auto_291711 ?auto_291716 ) ) ( not ( = ?auto_291711 ?auto_291717 ) ) ( not ( = ?auto_291712 ?auto_291713 ) ) ( not ( = ?auto_291712 ?auto_291714 ) ) ( not ( = ?auto_291712 ?auto_291715 ) ) ( not ( = ?auto_291712 ?auto_291716 ) ) ( not ( = ?auto_291712 ?auto_291717 ) ) ( not ( = ?auto_291713 ?auto_291714 ) ) ( not ( = ?auto_291713 ?auto_291715 ) ) ( not ( = ?auto_291713 ?auto_291716 ) ) ( not ( = ?auto_291713 ?auto_291717 ) ) ( not ( = ?auto_291714 ?auto_291715 ) ) ( not ( = ?auto_291714 ?auto_291716 ) ) ( not ( = ?auto_291714 ?auto_291717 ) ) ( not ( = ?auto_291715 ?auto_291716 ) ) ( not ( = ?auto_291715 ?auto_291717 ) ) ( not ( = ?auto_291716 ?auto_291717 ) ) ( ON ?auto_291715 ?auto_291716 ) ( ON ?auto_291714 ?auto_291715 ) ( ON ?auto_291713 ?auto_291714 ) ( ON ?auto_291712 ?auto_291713 ) ( ON ?auto_291711 ?auto_291712 ) ( ON ?auto_291710 ?auto_291711 ) ( ON ?auto_291709 ?auto_291710 ) ( CLEAR ?auto_291707 ) ( ON ?auto_291708 ?auto_291709 ) ( CLEAR ?auto_291708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_291703 ?auto_291704 ?auto_291705 ?auto_291706 ?auto_291707 ?auto_291708 )
      ( MAKE-14PILE ?auto_291703 ?auto_291704 ?auto_291705 ?auto_291706 ?auto_291707 ?auto_291708 ?auto_291709 ?auto_291710 ?auto_291711 ?auto_291712 ?auto_291713 ?auto_291714 ?auto_291715 ?auto_291716 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291732 - BLOCK
      ?auto_291733 - BLOCK
      ?auto_291734 - BLOCK
      ?auto_291735 - BLOCK
      ?auto_291736 - BLOCK
      ?auto_291737 - BLOCK
      ?auto_291738 - BLOCK
      ?auto_291739 - BLOCK
      ?auto_291740 - BLOCK
      ?auto_291741 - BLOCK
      ?auto_291742 - BLOCK
      ?auto_291743 - BLOCK
      ?auto_291744 - BLOCK
      ?auto_291745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291745 ) ( ON-TABLE ?auto_291732 ) ( ON ?auto_291733 ?auto_291732 ) ( ON ?auto_291734 ?auto_291733 ) ( ON ?auto_291735 ?auto_291734 ) ( ON ?auto_291736 ?auto_291735 ) ( not ( = ?auto_291732 ?auto_291733 ) ) ( not ( = ?auto_291732 ?auto_291734 ) ) ( not ( = ?auto_291732 ?auto_291735 ) ) ( not ( = ?auto_291732 ?auto_291736 ) ) ( not ( = ?auto_291732 ?auto_291737 ) ) ( not ( = ?auto_291732 ?auto_291738 ) ) ( not ( = ?auto_291732 ?auto_291739 ) ) ( not ( = ?auto_291732 ?auto_291740 ) ) ( not ( = ?auto_291732 ?auto_291741 ) ) ( not ( = ?auto_291732 ?auto_291742 ) ) ( not ( = ?auto_291732 ?auto_291743 ) ) ( not ( = ?auto_291732 ?auto_291744 ) ) ( not ( = ?auto_291732 ?auto_291745 ) ) ( not ( = ?auto_291733 ?auto_291734 ) ) ( not ( = ?auto_291733 ?auto_291735 ) ) ( not ( = ?auto_291733 ?auto_291736 ) ) ( not ( = ?auto_291733 ?auto_291737 ) ) ( not ( = ?auto_291733 ?auto_291738 ) ) ( not ( = ?auto_291733 ?auto_291739 ) ) ( not ( = ?auto_291733 ?auto_291740 ) ) ( not ( = ?auto_291733 ?auto_291741 ) ) ( not ( = ?auto_291733 ?auto_291742 ) ) ( not ( = ?auto_291733 ?auto_291743 ) ) ( not ( = ?auto_291733 ?auto_291744 ) ) ( not ( = ?auto_291733 ?auto_291745 ) ) ( not ( = ?auto_291734 ?auto_291735 ) ) ( not ( = ?auto_291734 ?auto_291736 ) ) ( not ( = ?auto_291734 ?auto_291737 ) ) ( not ( = ?auto_291734 ?auto_291738 ) ) ( not ( = ?auto_291734 ?auto_291739 ) ) ( not ( = ?auto_291734 ?auto_291740 ) ) ( not ( = ?auto_291734 ?auto_291741 ) ) ( not ( = ?auto_291734 ?auto_291742 ) ) ( not ( = ?auto_291734 ?auto_291743 ) ) ( not ( = ?auto_291734 ?auto_291744 ) ) ( not ( = ?auto_291734 ?auto_291745 ) ) ( not ( = ?auto_291735 ?auto_291736 ) ) ( not ( = ?auto_291735 ?auto_291737 ) ) ( not ( = ?auto_291735 ?auto_291738 ) ) ( not ( = ?auto_291735 ?auto_291739 ) ) ( not ( = ?auto_291735 ?auto_291740 ) ) ( not ( = ?auto_291735 ?auto_291741 ) ) ( not ( = ?auto_291735 ?auto_291742 ) ) ( not ( = ?auto_291735 ?auto_291743 ) ) ( not ( = ?auto_291735 ?auto_291744 ) ) ( not ( = ?auto_291735 ?auto_291745 ) ) ( not ( = ?auto_291736 ?auto_291737 ) ) ( not ( = ?auto_291736 ?auto_291738 ) ) ( not ( = ?auto_291736 ?auto_291739 ) ) ( not ( = ?auto_291736 ?auto_291740 ) ) ( not ( = ?auto_291736 ?auto_291741 ) ) ( not ( = ?auto_291736 ?auto_291742 ) ) ( not ( = ?auto_291736 ?auto_291743 ) ) ( not ( = ?auto_291736 ?auto_291744 ) ) ( not ( = ?auto_291736 ?auto_291745 ) ) ( not ( = ?auto_291737 ?auto_291738 ) ) ( not ( = ?auto_291737 ?auto_291739 ) ) ( not ( = ?auto_291737 ?auto_291740 ) ) ( not ( = ?auto_291737 ?auto_291741 ) ) ( not ( = ?auto_291737 ?auto_291742 ) ) ( not ( = ?auto_291737 ?auto_291743 ) ) ( not ( = ?auto_291737 ?auto_291744 ) ) ( not ( = ?auto_291737 ?auto_291745 ) ) ( not ( = ?auto_291738 ?auto_291739 ) ) ( not ( = ?auto_291738 ?auto_291740 ) ) ( not ( = ?auto_291738 ?auto_291741 ) ) ( not ( = ?auto_291738 ?auto_291742 ) ) ( not ( = ?auto_291738 ?auto_291743 ) ) ( not ( = ?auto_291738 ?auto_291744 ) ) ( not ( = ?auto_291738 ?auto_291745 ) ) ( not ( = ?auto_291739 ?auto_291740 ) ) ( not ( = ?auto_291739 ?auto_291741 ) ) ( not ( = ?auto_291739 ?auto_291742 ) ) ( not ( = ?auto_291739 ?auto_291743 ) ) ( not ( = ?auto_291739 ?auto_291744 ) ) ( not ( = ?auto_291739 ?auto_291745 ) ) ( not ( = ?auto_291740 ?auto_291741 ) ) ( not ( = ?auto_291740 ?auto_291742 ) ) ( not ( = ?auto_291740 ?auto_291743 ) ) ( not ( = ?auto_291740 ?auto_291744 ) ) ( not ( = ?auto_291740 ?auto_291745 ) ) ( not ( = ?auto_291741 ?auto_291742 ) ) ( not ( = ?auto_291741 ?auto_291743 ) ) ( not ( = ?auto_291741 ?auto_291744 ) ) ( not ( = ?auto_291741 ?auto_291745 ) ) ( not ( = ?auto_291742 ?auto_291743 ) ) ( not ( = ?auto_291742 ?auto_291744 ) ) ( not ( = ?auto_291742 ?auto_291745 ) ) ( not ( = ?auto_291743 ?auto_291744 ) ) ( not ( = ?auto_291743 ?auto_291745 ) ) ( not ( = ?auto_291744 ?auto_291745 ) ) ( ON ?auto_291744 ?auto_291745 ) ( ON ?auto_291743 ?auto_291744 ) ( ON ?auto_291742 ?auto_291743 ) ( ON ?auto_291741 ?auto_291742 ) ( ON ?auto_291740 ?auto_291741 ) ( ON ?auto_291739 ?auto_291740 ) ( ON ?auto_291738 ?auto_291739 ) ( CLEAR ?auto_291736 ) ( ON ?auto_291737 ?auto_291738 ) ( CLEAR ?auto_291737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_291732 ?auto_291733 ?auto_291734 ?auto_291735 ?auto_291736 ?auto_291737 )
      ( MAKE-14PILE ?auto_291732 ?auto_291733 ?auto_291734 ?auto_291735 ?auto_291736 ?auto_291737 ?auto_291738 ?auto_291739 ?auto_291740 ?auto_291741 ?auto_291742 ?auto_291743 ?auto_291744 ?auto_291745 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291760 - BLOCK
      ?auto_291761 - BLOCK
      ?auto_291762 - BLOCK
      ?auto_291763 - BLOCK
      ?auto_291764 - BLOCK
      ?auto_291765 - BLOCK
      ?auto_291766 - BLOCK
      ?auto_291767 - BLOCK
      ?auto_291768 - BLOCK
      ?auto_291769 - BLOCK
      ?auto_291770 - BLOCK
      ?auto_291771 - BLOCK
      ?auto_291772 - BLOCK
      ?auto_291773 - BLOCK
    )
    :vars
    (
      ?auto_291774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291773 ?auto_291774 ) ( ON-TABLE ?auto_291760 ) ( ON ?auto_291761 ?auto_291760 ) ( ON ?auto_291762 ?auto_291761 ) ( ON ?auto_291763 ?auto_291762 ) ( not ( = ?auto_291760 ?auto_291761 ) ) ( not ( = ?auto_291760 ?auto_291762 ) ) ( not ( = ?auto_291760 ?auto_291763 ) ) ( not ( = ?auto_291760 ?auto_291764 ) ) ( not ( = ?auto_291760 ?auto_291765 ) ) ( not ( = ?auto_291760 ?auto_291766 ) ) ( not ( = ?auto_291760 ?auto_291767 ) ) ( not ( = ?auto_291760 ?auto_291768 ) ) ( not ( = ?auto_291760 ?auto_291769 ) ) ( not ( = ?auto_291760 ?auto_291770 ) ) ( not ( = ?auto_291760 ?auto_291771 ) ) ( not ( = ?auto_291760 ?auto_291772 ) ) ( not ( = ?auto_291760 ?auto_291773 ) ) ( not ( = ?auto_291760 ?auto_291774 ) ) ( not ( = ?auto_291761 ?auto_291762 ) ) ( not ( = ?auto_291761 ?auto_291763 ) ) ( not ( = ?auto_291761 ?auto_291764 ) ) ( not ( = ?auto_291761 ?auto_291765 ) ) ( not ( = ?auto_291761 ?auto_291766 ) ) ( not ( = ?auto_291761 ?auto_291767 ) ) ( not ( = ?auto_291761 ?auto_291768 ) ) ( not ( = ?auto_291761 ?auto_291769 ) ) ( not ( = ?auto_291761 ?auto_291770 ) ) ( not ( = ?auto_291761 ?auto_291771 ) ) ( not ( = ?auto_291761 ?auto_291772 ) ) ( not ( = ?auto_291761 ?auto_291773 ) ) ( not ( = ?auto_291761 ?auto_291774 ) ) ( not ( = ?auto_291762 ?auto_291763 ) ) ( not ( = ?auto_291762 ?auto_291764 ) ) ( not ( = ?auto_291762 ?auto_291765 ) ) ( not ( = ?auto_291762 ?auto_291766 ) ) ( not ( = ?auto_291762 ?auto_291767 ) ) ( not ( = ?auto_291762 ?auto_291768 ) ) ( not ( = ?auto_291762 ?auto_291769 ) ) ( not ( = ?auto_291762 ?auto_291770 ) ) ( not ( = ?auto_291762 ?auto_291771 ) ) ( not ( = ?auto_291762 ?auto_291772 ) ) ( not ( = ?auto_291762 ?auto_291773 ) ) ( not ( = ?auto_291762 ?auto_291774 ) ) ( not ( = ?auto_291763 ?auto_291764 ) ) ( not ( = ?auto_291763 ?auto_291765 ) ) ( not ( = ?auto_291763 ?auto_291766 ) ) ( not ( = ?auto_291763 ?auto_291767 ) ) ( not ( = ?auto_291763 ?auto_291768 ) ) ( not ( = ?auto_291763 ?auto_291769 ) ) ( not ( = ?auto_291763 ?auto_291770 ) ) ( not ( = ?auto_291763 ?auto_291771 ) ) ( not ( = ?auto_291763 ?auto_291772 ) ) ( not ( = ?auto_291763 ?auto_291773 ) ) ( not ( = ?auto_291763 ?auto_291774 ) ) ( not ( = ?auto_291764 ?auto_291765 ) ) ( not ( = ?auto_291764 ?auto_291766 ) ) ( not ( = ?auto_291764 ?auto_291767 ) ) ( not ( = ?auto_291764 ?auto_291768 ) ) ( not ( = ?auto_291764 ?auto_291769 ) ) ( not ( = ?auto_291764 ?auto_291770 ) ) ( not ( = ?auto_291764 ?auto_291771 ) ) ( not ( = ?auto_291764 ?auto_291772 ) ) ( not ( = ?auto_291764 ?auto_291773 ) ) ( not ( = ?auto_291764 ?auto_291774 ) ) ( not ( = ?auto_291765 ?auto_291766 ) ) ( not ( = ?auto_291765 ?auto_291767 ) ) ( not ( = ?auto_291765 ?auto_291768 ) ) ( not ( = ?auto_291765 ?auto_291769 ) ) ( not ( = ?auto_291765 ?auto_291770 ) ) ( not ( = ?auto_291765 ?auto_291771 ) ) ( not ( = ?auto_291765 ?auto_291772 ) ) ( not ( = ?auto_291765 ?auto_291773 ) ) ( not ( = ?auto_291765 ?auto_291774 ) ) ( not ( = ?auto_291766 ?auto_291767 ) ) ( not ( = ?auto_291766 ?auto_291768 ) ) ( not ( = ?auto_291766 ?auto_291769 ) ) ( not ( = ?auto_291766 ?auto_291770 ) ) ( not ( = ?auto_291766 ?auto_291771 ) ) ( not ( = ?auto_291766 ?auto_291772 ) ) ( not ( = ?auto_291766 ?auto_291773 ) ) ( not ( = ?auto_291766 ?auto_291774 ) ) ( not ( = ?auto_291767 ?auto_291768 ) ) ( not ( = ?auto_291767 ?auto_291769 ) ) ( not ( = ?auto_291767 ?auto_291770 ) ) ( not ( = ?auto_291767 ?auto_291771 ) ) ( not ( = ?auto_291767 ?auto_291772 ) ) ( not ( = ?auto_291767 ?auto_291773 ) ) ( not ( = ?auto_291767 ?auto_291774 ) ) ( not ( = ?auto_291768 ?auto_291769 ) ) ( not ( = ?auto_291768 ?auto_291770 ) ) ( not ( = ?auto_291768 ?auto_291771 ) ) ( not ( = ?auto_291768 ?auto_291772 ) ) ( not ( = ?auto_291768 ?auto_291773 ) ) ( not ( = ?auto_291768 ?auto_291774 ) ) ( not ( = ?auto_291769 ?auto_291770 ) ) ( not ( = ?auto_291769 ?auto_291771 ) ) ( not ( = ?auto_291769 ?auto_291772 ) ) ( not ( = ?auto_291769 ?auto_291773 ) ) ( not ( = ?auto_291769 ?auto_291774 ) ) ( not ( = ?auto_291770 ?auto_291771 ) ) ( not ( = ?auto_291770 ?auto_291772 ) ) ( not ( = ?auto_291770 ?auto_291773 ) ) ( not ( = ?auto_291770 ?auto_291774 ) ) ( not ( = ?auto_291771 ?auto_291772 ) ) ( not ( = ?auto_291771 ?auto_291773 ) ) ( not ( = ?auto_291771 ?auto_291774 ) ) ( not ( = ?auto_291772 ?auto_291773 ) ) ( not ( = ?auto_291772 ?auto_291774 ) ) ( not ( = ?auto_291773 ?auto_291774 ) ) ( ON ?auto_291772 ?auto_291773 ) ( ON ?auto_291771 ?auto_291772 ) ( ON ?auto_291770 ?auto_291771 ) ( ON ?auto_291769 ?auto_291770 ) ( ON ?auto_291768 ?auto_291769 ) ( ON ?auto_291767 ?auto_291768 ) ( ON ?auto_291766 ?auto_291767 ) ( ON ?auto_291765 ?auto_291766 ) ( CLEAR ?auto_291763 ) ( ON ?auto_291764 ?auto_291765 ) ( CLEAR ?auto_291764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_291760 ?auto_291761 ?auto_291762 ?auto_291763 ?auto_291764 )
      ( MAKE-14PILE ?auto_291760 ?auto_291761 ?auto_291762 ?auto_291763 ?auto_291764 ?auto_291765 ?auto_291766 ?auto_291767 ?auto_291768 ?auto_291769 ?auto_291770 ?auto_291771 ?auto_291772 ?auto_291773 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291789 - BLOCK
      ?auto_291790 - BLOCK
      ?auto_291791 - BLOCK
      ?auto_291792 - BLOCK
      ?auto_291793 - BLOCK
      ?auto_291794 - BLOCK
      ?auto_291795 - BLOCK
      ?auto_291796 - BLOCK
      ?auto_291797 - BLOCK
      ?auto_291798 - BLOCK
      ?auto_291799 - BLOCK
      ?auto_291800 - BLOCK
      ?auto_291801 - BLOCK
      ?auto_291802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291802 ) ( ON-TABLE ?auto_291789 ) ( ON ?auto_291790 ?auto_291789 ) ( ON ?auto_291791 ?auto_291790 ) ( ON ?auto_291792 ?auto_291791 ) ( not ( = ?auto_291789 ?auto_291790 ) ) ( not ( = ?auto_291789 ?auto_291791 ) ) ( not ( = ?auto_291789 ?auto_291792 ) ) ( not ( = ?auto_291789 ?auto_291793 ) ) ( not ( = ?auto_291789 ?auto_291794 ) ) ( not ( = ?auto_291789 ?auto_291795 ) ) ( not ( = ?auto_291789 ?auto_291796 ) ) ( not ( = ?auto_291789 ?auto_291797 ) ) ( not ( = ?auto_291789 ?auto_291798 ) ) ( not ( = ?auto_291789 ?auto_291799 ) ) ( not ( = ?auto_291789 ?auto_291800 ) ) ( not ( = ?auto_291789 ?auto_291801 ) ) ( not ( = ?auto_291789 ?auto_291802 ) ) ( not ( = ?auto_291790 ?auto_291791 ) ) ( not ( = ?auto_291790 ?auto_291792 ) ) ( not ( = ?auto_291790 ?auto_291793 ) ) ( not ( = ?auto_291790 ?auto_291794 ) ) ( not ( = ?auto_291790 ?auto_291795 ) ) ( not ( = ?auto_291790 ?auto_291796 ) ) ( not ( = ?auto_291790 ?auto_291797 ) ) ( not ( = ?auto_291790 ?auto_291798 ) ) ( not ( = ?auto_291790 ?auto_291799 ) ) ( not ( = ?auto_291790 ?auto_291800 ) ) ( not ( = ?auto_291790 ?auto_291801 ) ) ( not ( = ?auto_291790 ?auto_291802 ) ) ( not ( = ?auto_291791 ?auto_291792 ) ) ( not ( = ?auto_291791 ?auto_291793 ) ) ( not ( = ?auto_291791 ?auto_291794 ) ) ( not ( = ?auto_291791 ?auto_291795 ) ) ( not ( = ?auto_291791 ?auto_291796 ) ) ( not ( = ?auto_291791 ?auto_291797 ) ) ( not ( = ?auto_291791 ?auto_291798 ) ) ( not ( = ?auto_291791 ?auto_291799 ) ) ( not ( = ?auto_291791 ?auto_291800 ) ) ( not ( = ?auto_291791 ?auto_291801 ) ) ( not ( = ?auto_291791 ?auto_291802 ) ) ( not ( = ?auto_291792 ?auto_291793 ) ) ( not ( = ?auto_291792 ?auto_291794 ) ) ( not ( = ?auto_291792 ?auto_291795 ) ) ( not ( = ?auto_291792 ?auto_291796 ) ) ( not ( = ?auto_291792 ?auto_291797 ) ) ( not ( = ?auto_291792 ?auto_291798 ) ) ( not ( = ?auto_291792 ?auto_291799 ) ) ( not ( = ?auto_291792 ?auto_291800 ) ) ( not ( = ?auto_291792 ?auto_291801 ) ) ( not ( = ?auto_291792 ?auto_291802 ) ) ( not ( = ?auto_291793 ?auto_291794 ) ) ( not ( = ?auto_291793 ?auto_291795 ) ) ( not ( = ?auto_291793 ?auto_291796 ) ) ( not ( = ?auto_291793 ?auto_291797 ) ) ( not ( = ?auto_291793 ?auto_291798 ) ) ( not ( = ?auto_291793 ?auto_291799 ) ) ( not ( = ?auto_291793 ?auto_291800 ) ) ( not ( = ?auto_291793 ?auto_291801 ) ) ( not ( = ?auto_291793 ?auto_291802 ) ) ( not ( = ?auto_291794 ?auto_291795 ) ) ( not ( = ?auto_291794 ?auto_291796 ) ) ( not ( = ?auto_291794 ?auto_291797 ) ) ( not ( = ?auto_291794 ?auto_291798 ) ) ( not ( = ?auto_291794 ?auto_291799 ) ) ( not ( = ?auto_291794 ?auto_291800 ) ) ( not ( = ?auto_291794 ?auto_291801 ) ) ( not ( = ?auto_291794 ?auto_291802 ) ) ( not ( = ?auto_291795 ?auto_291796 ) ) ( not ( = ?auto_291795 ?auto_291797 ) ) ( not ( = ?auto_291795 ?auto_291798 ) ) ( not ( = ?auto_291795 ?auto_291799 ) ) ( not ( = ?auto_291795 ?auto_291800 ) ) ( not ( = ?auto_291795 ?auto_291801 ) ) ( not ( = ?auto_291795 ?auto_291802 ) ) ( not ( = ?auto_291796 ?auto_291797 ) ) ( not ( = ?auto_291796 ?auto_291798 ) ) ( not ( = ?auto_291796 ?auto_291799 ) ) ( not ( = ?auto_291796 ?auto_291800 ) ) ( not ( = ?auto_291796 ?auto_291801 ) ) ( not ( = ?auto_291796 ?auto_291802 ) ) ( not ( = ?auto_291797 ?auto_291798 ) ) ( not ( = ?auto_291797 ?auto_291799 ) ) ( not ( = ?auto_291797 ?auto_291800 ) ) ( not ( = ?auto_291797 ?auto_291801 ) ) ( not ( = ?auto_291797 ?auto_291802 ) ) ( not ( = ?auto_291798 ?auto_291799 ) ) ( not ( = ?auto_291798 ?auto_291800 ) ) ( not ( = ?auto_291798 ?auto_291801 ) ) ( not ( = ?auto_291798 ?auto_291802 ) ) ( not ( = ?auto_291799 ?auto_291800 ) ) ( not ( = ?auto_291799 ?auto_291801 ) ) ( not ( = ?auto_291799 ?auto_291802 ) ) ( not ( = ?auto_291800 ?auto_291801 ) ) ( not ( = ?auto_291800 ?auto_291802 ) ) ( not ( = ?auto_291801 ?auto_291802 ) ) ( ON ?auto_291801 ?auto_291802 ) ( ON ?auto_291800 ?auto_291801 ) ( ON ?auto_291799 ?auto_291800 ) ( ON ?auto_291798 ?auto_291799 ) ( ON ?auto_291797 ?auto_291798 ) ( ON ?auto_291796 ?auto_291797 ) ( ON ?auto_291795 ?auto_291796 ) ( ON ?auto_291794 ?auto_291795 ) ( CLEAR ?auto_291792 ) ( ON ?auto_291793 ?auto_291794 ) ( CLEAR ?auto_291793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_291789 ?auto_291790 ?auto_291791 ?auto_291792 ?auto_291793 )
      ( MAKE-14PILE ?auto_291789 ?auto_291790 ?auto_291791 ?auto_291792 ?auto_291793 ?auto_291794 ?auto_291795 ?auto_291796 ?auto_291797 ?auto_291798 ?auto_291799 ?auto_291800 ?auto_291801 ?auto_291802 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291817 - BLOCK
      ?auto_291818 - BLOCK
      ?auto_291819 - BLOCK
      ?auto_291820 - BLOCK
      ?auto_291821 - BLOCK
      ?auto_291822 - BLOCK
      ?auto_291823 - BLOCK
      ?auto_291824 - BLOCK
      ?auto_291825 - BLOCK
      ?auto_291826 - BLOCK
      ?auto_291827 - BLOCK
      ?auto_291828 - BLOCK
      ?auto_291829 - BLOCK
      ?auto_291830 - BLOCK
    )
    :vars
    (
      ?auto_291831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291830 ?auto_291831 ) ( ON-TABLE ?auto_291817 ) ( ON ?auto_291818 ?auto_291817 ) ( ON ?auto_291819 ?auto_291818 ) ( not ( = ?auto_291817 ?auto_291818 ) ) ( not ( = ?auto_291817 ?auto_291819 ) ) ( not ( = ?auto_291817 ?auto_291820 ) ) ( not ( = ?auto_291817 ?auto_291821 ) ) ( not ( = ?auto_291817 ?auto_291822 ) ) ( not ( = ?auto_291817 ?auto_291823 ) ) ( not ( = ?auto_291817 ?auto_291824 ) ) ( not ( = ?auto_291817 ?auto_291825 ) ) ( not ( = ?auto_291817 ?auto_291826 ) ) ( not ( = ?auto_291817 ?auto_291827 ) ) ( not ( = ?auto_291817 ?auto_291828 ) ) ( not ( = ?auto_291817 ?auto_291829 ) ) ( not ( = ?auto_291817 ?auto_291830 ) ) ( not ( = ?auto_291817 ?auto_291831 ) ) ( not ( = ?auto_291818 ?auto_291819 ) ) ( not ( = ?auto_291818 ?auto_291820 ) ) ( not ( = ?auto_291818 ?auto_291821 ) ) ( not ( = ?auto_291818 ?auto_291822 ) ) ( not ( = ?auto_291818 ?auto_291823 ) ) ( not ( = ?auto_291818 ?auto_291824 ) ) ( not ( = ?auto_291818 ?auto_291825 ) ) ( not ( = ?auto_291818 ?auto_291826 ) ) ( not ( = ?auto_291818 ?auto_291827 ) ) ( not ( = ?auto_291818 ?auto_291828 ) ) ( not ( = ?auto_291818 ?auto_291829 ) ) ( not ( = ?auto_291818 ?auto_291830 ) ) ( not ( = ?auto_291818 ?auto_291831 ) ) ( not ( = ?auto_291819 ?auto_291820 ) ) ( not ( = ?auto_291819 ?auto_291821 ) ) ( not ( = ?auto_291819 ?auto_291822 ) ) ( not ( = ?auto_291819 ?auto_291823 ) ) ( not ( = ?auto_291819 ?auto_291824 ) ) ( not ( = ?auto_291819 ?auto_291825 ) ) ( not ( = ?auto_291819 ?auto_291826 ) ) ( not ( = ?auto_291819 ?auto_291827 ) ) ( not ( = ?auto_291819 ?auto_291828 ) ) ( not ( = ?auto_291819 ?auto_291829 ) ) ( not ( = ?auto_291819 ?auto_291830 ) ) ( not ( = ?auto_291819 ?auto_291831 ) ) ( not ( = ?auto_291820 ?auto_291821 ) ) ( not ( = ?auto_291820 ?auto_291822 ) ) ( not ( = ?auto_291820 ?auto_291823 ) ) ( not ( = ?auto_291820 ?auto_291824 ) ) ( not ( = ?auto_291820 ?auto_291825 ) ) ( not ( = ?auto_291820 ?auto_291826 ) ) ( not ( = ?auto_291820 ?auto_291827 ) ) ( not ( = ?auto_291820 ?auto_291828 ) ) ( not ( = ?auto_291820 ?auto_291829 ) ) ( not ( = ?auto_291820 ?auto_291830 ) ) ( not ( = ?auto_291820 ?auto_291831 ) ) ( not ( = ?auto_291821 ?auto_291822 ) ) ( not ( = ?auto_291821 ?auto_291823 ) ) ( not ( = ?auto_291821 ?auto_291824 ) ) ( not ( = ?auto_291821 ?auto_291825 ) ) ( not ( = ?auto_291821 ?auto_291826 ) ) ( not ( = ?auto_291821 ?auto_291827 ) ) ( not ( = ?auto_291821 ?auto_291828 ) ) ( not ( = ?auto_291821 ?auto_291829 ) ) ( not ( = ?auto_291821 ?auto_291830 ) ) ( not ( = ?auto_291821 ?auto_291831 ) ) ( not ( = ?auto_291822 ?auto_291823 ) ) ( not ( = ?auto_291822 ?auto_291824 ) ) ( not ( = ?auto_291822 ?auto_291825 ) ) ( not ( = ?auto_291822 ?auto_291826 ) ) ( not ( = ?auto_291822 ?auto_291827 ) ) ( not ( = ?auto_291822 ?auto_291828 ) ) ( not ( = ?auto_291822 ?auto_291829 ) ) ( not ( = ?auto_291822 ?auto_291830 ) ) ( not ( = ?auto_291822 ?auto_291831 ) ) ( not ( = ?auto_291823 ?auto_291824 ) ) ( not ( = ?auto_291823 ?auto_291825 ) ) ( not ( = ?auto_291823 ?auto_291826 ) ) ( not ( = ?auto_291823 ?auto_291827 ) ) ( not ( = ?auto_291823 ?auto_291828 ) ) ( not ( = ?auto_291823 ?auto_291829 ) ) ( not ( = ?auto_291823 ?auto_291830 ) ) ( not ( = ?auto_291823 ?auto_291831 ) ) ( not ( = ?auto_291824 ?auto_291825 ) ) ( not ( = ?auto_291824 ?auto_291826 ) ) ( not ( = ?auto_291824 ?auto_291827 ) ) ( not ( = ?auto_291824 ?auto_291828 ) ) ( not ( = ?auto_291824 ?auto_291829 ) ) ( not ( = ?auto_291824 ?auto_291830 ) ) ( not ( = ?auto_291824 ?auto_291831 ) ) ( not ( = ?auto_291825 ?auto_291826 ) ) ( not ( = ?auto_291825 ?auto_291827 ) ) ( not ( = ?auto_291825 ?auto_291828 ) ) ( not ( = ?auto_291825 ?auto_291829 ) ) ( not ( = ?auto_291825 ?auto_291830 ) ) ( not ( = ?auto_291825 ?auto_291831 ) ) ( not ( = ?auto_291826 ?auto_291827 ) ) ( not ( = ?auto_291826 ?auto_291828 ) ) ( not ( = ?auto_291826 ?auto_291829 ) ) ( not ( = ?auto_291826 ?auto_291830 ) ) ( not ( = ?auto_291826 ?auto_291831 ) ) ( not ( = ?auto_291827 ?auto_291828 ) ) ( not ( = ?auto_291827 ?auto_291829 ) ) ( not ( = ?auto_291827 ?auto_291830 ) ) ( not ( = ?auto_291827 ?auto_291831 ) ) ( not ( = ?auto_291828 ?auto_291829 ) ) ( not ( = ?auto_291828 ?auto_291830 ) ) ( not ( = ?auto_291828 ?auto_291831 ) ) ( not ( = ?auto_291829 ?auto_291830 ) ) ( not ( = ?auto_291829 ?auto_291831 ) ) ( not ( = ?auto_291830 ?auto_291831 ) ) ( ON ?auto_291829 ?auto_291830 ) ( ON ?auto_291828 ?auto_291829 ) ( ON ?auto_291827 ?auto_291828 ) ( ON ?auto_291826 ?auto_291827 ) ( ON ?auto_291825 ?auto_291826 ) ( ON ?auto_291824 ?auto_291825 ) ( ON ?auto_291823 ?auto_291824 ) ( ON ?auto_291822 ?auto_291823 ) ( ON ?auto_291821 ?auto_291822 ) ( CLEAR ?auto_291819 ) ( ON ?auto_291820 ?auto_291821 ) ( CLEAR ?auto_291820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_291817 ?auto_291818 ?auto_291819 ?auto_291820 )
      ( MAKE-14PILE ?auto_291817 ?auto_291818 ?auto_291819 ?auto_291820 ?auto_291821 ?auto_291822 ?auto_291823 ?auto_291824 ?auto_291825 ?auto_291826 ?auto_291827 ?auto_291828 ?auto_291829 ?auto_291830 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291846 - BLOCK
      ?auto_291847 - BLOCK
      ?auto_291848 - BLOCK
      ?auto_291849 - BLOCK
      ?auto_291850 - BLOCK
      ?auto_291851 - BLOCK
      ?auto_291852 - BLOCK
      ?auto_291853 - BLOCK
      ?auto_291854 - BLOCK
      ?auto_291855 - BLOCK
      ?auto_291856 - BLOCK
      ?auto_291857 - BLOCK
      ?auto_291858 - BLOCK
      ?auto_291859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291859 ) ( ON-TABLE ?auto_291846 ) ( ON ?auto_291847 ?auto_291846 ) ( ON ?auto_291848 ?auto_291847 ) ( not ( = ?auto_291846 ?auto_291847 ) ) ( not ( = ?auto_291846 ?auto_291848 ) ) ( not ( = ?auto_291846 ?auto_291849 ) ) ( not ( = ?auto_291846 ?auto_291850 ) ) ( not ( = ?auto_291846 ?auto_291851 ) ) ( not ( = ?auto_291846 ?auto_291852 ) ) ( not ( = ?auto_291846 ?auto_291853 ) ) ( not ( = ?auto_291846 ?auto_291854 ) ) ( not ( = ?auto_291846 ?auto_291855 ) ) ( not ( = ?auto_291846 ?auto_291856 ) ) ( not ( = ?auto_291846 ?auto_291857 ) ) ( not ( = ?auto_291846 ?auto_291858 ) ) ( not ( = ?auto_291846 ?auto_291859 ) ) ( not ( = ?auto_291847 ?auto_291848 ) ) ( not ( = ?auto_291847 ?auto_291849 ) ) ( not ( = ?auto_291847 ?auto_291850 ) ) ( not ( = ?auto_291847 ?auto_291851 ) ) ( not ( = ?auto_291847 ?auto_291852 ) ) ( not ( = ?auto_291847 ?auto_291853 ) ) ( not ( = ?auto_291847 ?auto_291854 ) ) ( not ( = ?auto_291847 ?auto_291855 ) ) ( not ( = ?auto_291847 ?auto_291856 ) ) ( not ( = ?auto_291847 ?auto_291857 ) ) ( not ( = ?auto_291847 ?auto_291858 ) ) ( not ( = ?auto_291847 ?auto_291859 ) ) ( not ( = ?auto_291848 ?auto_291849 ) ) ( not ( = ?auto_291848 ?auto_291850 ) ) ( not ( = ?auto_291848 ?auto_291851 ) ) ( not ( = ?auto_291848 ?auto_291852 ) ) ( not ( = ?auto_291848 ?auto_291853 ) ) ( not ( = ?auto_291848 ?auto_291854 ) ) ( not ( = ?auto_291848 ?auto_291855 ) ) ( not ( = ?auto_291848 ?auto_291856 ) ) ( not ( = ?auto_291848 ?auto_291857 ) ) ( not ( = ?auto_291848 ?auto_291858 ) ) ( not ( = ?auto_291848 ?auto_291859 ) ) ( not ( = ?auto_291849 ?auto_291850 ) ) ( not ( = ?auto_291849 ?auto_291851 ) ) ( not ( = ?auto_291849 ?auto_291852 ) ) ( not ( = ?auto_291849 ?auto_291853 ) ) ( not ( = ?auto_291849 ?auto_291854 ) ) ( not ( = ?auto_291849 ?auto_291855 ) ) ( not ( = ?auto_291849 ?auto_291856 ) ) ( not ( = ?auto_291849 ?auto_291857 ) ) ( not ( = ?auto_291849 ?auto_291858 ) ) ( not ( = ?auto_291849 ?auto_291859 ) ) ( not ( = ?auto_291850 ?auto_291851 ) ) ( not ( = ?auto_291850 ?auto_291852 ) ) ( not ( = ?auto_291850 ?auto_291853 ) ) ( not ( = ?auto_291850 ?auto_291854 ) ) ( not ( = ?auto_291850 ?auto_291855 ) ) ( not ( = ?auto_291850 ?auto_291856 ) ) ( not ( = ?auto_291850 ?auto_291857 ) ) ( not ( = ?auto_291850 ?auto_291858 ) ) ( not ( = ?auto_291850 ?auto_291859 ) ) ( not ( = ?auto_291851 ?auto_291852 ) ) ( not ( = ?auto_291851 ?auto_291853 ) ) ( not ( = ?auto_291851 ?auto_291854 ) ) ( not ( = ?auto_291851 ?auto_291855 ) ) ( not ( = ?auto_291851 ?auto_291856 ) ) ( not ( = ?auto_291851 ?auto_291857 ) ) ( not ( = ?auto_291851 ?auto_291858 ) ) ( not ( = ?auto_291851 ?auto_291859 ) ) ( not ( = ?auto_291852 ?auto_291853 ) ) ( not ( = ?auto_291852 ?auto_291854 ) ) ( not ( = ?auto_291852 ?auto_291855 ) ) ( not ( = ?auto_291852 ?auto_291856 ) ) ( not ( = ?auto_291852 ?auto_291857 ) ) ( not ( = ?auto_291852 ?auto_291858 ) ) ( not ( = ?auto_291852 ?auto_291859 ) ) ( not ( = ?auto_291853 ?auto_291854 ) ) ( not ( = ?auto_291853 ?auto_291855 ) ) ( not ( = ?auto_291853 ?auto_291856 ) ) ( not ( = ?auto_291853 ?auto_291857 ) ) ( not ( = ?auto_291853 ?auto_291858 ) ) ( not ( = ?auto_291853 ?auto_291859 ) ) ( not ( = ?auto_291854 ?auto_291855 ) ) ( not ( = ?auto_291854 ?auto_291856 ) ) ( not ( = ?auto_291854 ?auto_291857 ) ) ( not ( = ?auto_291854 ?auto_291858 ) ) ( not ( = ?auto_291854 ?auto_291859 ) ) ( not ( = ?auto_291855 ?auto_291856 ) ) ( not ( = ?auto_291855 ?auto_291857 ) ) ( not ( = ?auto_291855 ?auto_291858 ) ) ( not ( = ?auto_291855 ?auto_291859 ) ) ( not ( = ?auto_291856 ?auto_291857 ) ) ( not ( = ?auto_291856 ?auto_291858 ) ) ( not ( = ?auto_291856 ?auto_291859 ) ) ( not ( = ?auto_291857 ?auto_291858 ) ) ( not ( = ?auto_291857 ?auto_291859 ) ) ( not ( = ?auto_291858 ?auto_291859 ) ) ( ON ?auto_291858 ?auto_291859 ) ( ON ?auto_291857 ?auto_291858 ) ( ON ?auto_291856 ?auto_291857 ) ( ON ?auto_291855 ?auto_291856 ) ( ON ?auto_291854 ?auto_291855 ) ( ON ?auto_291853 ?auto_291854 ) ( ON ?auto_291852 ?auto_291853 ) ( ON ?auto_291851 ?auto_291852 ) ( ON ?auto_291850 ?auto_291851 ) ( CLEAR ?auto_291848 ) ( ON ?auto_291849 ?auto_291850 ) ( CLEAR ?auto_291849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_291846 ?auto_291847 ?auto_291848 ?auto_291849 )
      ( MAKE-14PILE ?auto_291846 ?auto_291847 ?auto_291848 ?auto_291849 ?auto_291850 ?auto_291851 ?auto_291852 ?auto_291853 ?auto_291854 ?auto_291855 ?auto_291856 ?auto_291857 ?auto_291858 ?auto_291859 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291874 - BLOCK
      ?auto_291875 - BLOCK
      ?auto_291876 - BLOCK
      ?auto_291877 - BLOCK
      ?auto_291878 - BLOCK
      ?auto_291879 - BLOCK
      ?auto_291880 - BLOCK
      ?auto_291881 - BLOCK
      ?auto_291882 - BLOCK
      ?auto_291883 - BLOCK
      ?auto_291884 - BLOCK
      ?auto_291885 - BLOCK
      ?auto_291886 - BLOCK
      ?auto_291887 - BLOCK
    )
    :vars
    (
      ?auto_291888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291887 ?auto_291888 ) ( ON-TABLE ?auto_291874 ) ( ON ?auto_291875 ?auto_291874 ) ( not ( = ?auto_291874 ?auto_291875 ) ) ( not ( = ?auto_291874 ?auto_291876 ) ) ( not ( = ?auto_291874 ?auto_291877 ) ) ( not ( = ?auto_291874 ?auto_291878 ) ) ( not ( = ?auto_291874 ?auto_291879 ) ) ( not ( = ?auto_291874 ?auto_291880 ) ) ( not ( = ?auto_291874 ?auto_291881 ) ) ( not ( = ?auto_291874 ?auto_291882 ) ) ( not ( = ?auto_291874 ?auto_291883 ) ) ( not ( = ?auto_291874 ?auto_291884 ) ) ( not ( = ?auto_291874 ?auto_291885 ) ) ( not ( = ?auto_291874 ?auto_291886 ) ) ( not ( = ?auto_291874 ?auto_291887 ) ) ( not ( = ?auto_291874 ?auto_291888 ) ) ( not ( = ?auto_291875 ?auto_291876 ) ) ( not ( = ?auto_291875 ?auto_291877 ) ) ( not ( = ?auto_291875 ?auto_291878 ) ) ( not ( = ?auto_291875 ?auto_291879 ) ) ( not ( = ?auto_291875 ?auto_291880 ) ) ( not ( = ?auto_291875 ?auto_291881 ) ) ( not ( = ?auto_291875 ?auto_291882 ) ) ( not ( = ?auto_291875 ?auto_291883 ) ) ( not ( = ?auto_291875 ?auto_291884 ) ) ( not ( = ?auto_291875 ?auto_291885 ) ) ( not ( = ?auto_291875 ?auto_291886 ) ) ( not ( = ?auto_291875 ?auto_291887 ) ) ( not ( = ?auto_291875 ?auto_291888 ) ) ( not ( = ?auto_291876 ?auto_291877 ) ) ( not ( = ?auto_291876 ?auto_291878 ) ) ( not ( = ?auto_291876 ?auto_291879 ) ) ( not ( = ?auto_291876 ?auto_291880 ) ) ( not ( = ?auto_291876 ?auto_291881 ) ) ( not ( = ?auto_291876 ?auto_291882 ) ) ( not ( = ?auto_291876 ?auto_291883 ) ) ( not ( = ?auto_291876 ?auto_291884 ) ) ( not ( = ?auto_291876 ?auto_291885 ) ) ( not ( = ?auto_291876 ?auto_291886 ) ) ( not ( = ?auto_291876 ?auto_291887 ) ) ( not ( = ?auto_291876 ?auto_291888 ) ) ( not ( = ?auto_291877 ?auto_291878 ) ) ( not ( = ?auto_291877 ?auto_291879 ) ) ( not ( = ?auto_291877 ?auto_291880 ) ) ( not ( = ?auto_291877 ?auto_291881 ) ) ( not ( = ?auto_291877 ?auto_291882 ) ) ( not ( = ?auto_291877 ?auto_291883 ) ) ( not ( = ?auto_291877 ?auto_291884 ) ) ( not ( = ?auto_291877 ?auto_291885 ) ) ( not ( = ?auto_291877 ?auto_291886 ) ) ( not ( = ?auto_291877 ?auto_291887 ) ) ( not ( = ?auto_291877 ?auto_291888 ) ) ( not ( = ?auto_291878 ?auto_291879 ) ) ( not ( = ?auto_291878 ?auto_291880 ) ) ( not ( = ?auto_291878 ?auto_291881 ) ) ( not ( = ?auto_291878 ?auto_291882 ) ) ( not ( = ?auto_291878 ?auto_291883 ) ) ( not ( = ?auto_291878 ?auto_291884 ) ) ( not ( = ?auto_291878 ?auto_291885 ) ) ( not ( = ?auto_291878 ?auto_291886 ) ) ( not ( = ?auto_291878 ?auto_291887 ) ) ( not ( = ?auto_291878 ?auto_291888 ) ) ( not ( = ?auto_291879 ?auto_291880 ) ) ( not ( = ?auto_291879 ?auto_291881 ) ) ( not ( = ?auto_291879 ?auto_291882 ) ) ( not ( = ?auto_291879 ?auto_291883 ) ) ( not ( = ?auto_291879 ?auto_291884 ) ) ( not ( = ?auto_291879 ?auto_291885 ) ) ( not ( = ?auto_291879 ?auto_291886 ) ) ( not ( = ?auto_291879 ?auto_291887 ) ) ( not ( = ?auto_291879 ?auto_291888 ) ) ( not ( = ?auto_291880 ?auto_291881 ) ) ( not ( = ?auto_291880 ?auto_291882 ) ) ( not ( = ?auto_291880 ?auto_291883 ) ) ( not ( = ?auto_291880 ?auto_291884 ) ) ( not ( = ?auto_291880 ?auto_291885 ) ) ( not ( = ?auto_291880 ?auto_291886 ) ) ( not ( = ?auto_291880 ?auto_291887 ) ) ( not ( = ?auto_291880 ?auto_291888 ) ) ( not ( = ?auto_291881 ?auto_291882 ) ) ( not ( = ?auto_291881 ?auto_291883 ) ) ( not ( = ?auto_291881 ?auto_291884 ) ) ( not ( = ?auto_291881 ?auto_291885 ) ) ( not ( = ?auto_291881 ?auto_291886 ) ) ( not ( = ?auto_291881 ?auto_291887 ) ) ( not ( = ?auto_291881 ?auto_291888 ) ) ( not ( = ?auto_291882 ?auto_291883 ) ) ( not ( = ?auto_291882 ?auto_291884 ) ) ( not ( = ?auto_291882 ?auto_291885 ) ) ( not ( = ?auto_291882 ?auto_291886 ) ) ( not ( = ?auto_291882 ?auto_291887 ) ) ( not ( = ?auto_291882 ?auto_291888 ) ) ( not ( = ?auto_291883 ?auto_291884 ) ) ( not ( = ?auto_291883 ?auto_291885 ) ) ( not ( = ?auto_291883 ?auto_291886 ) ) ( not ( = ?auto_291883 ?auto_291887 ) ) ( not ( = ?auto_291883 ?auto_291888 ) ) ( not ( = ?auto_291884 ?auto_291885 ) ) ( not ( = ?auto_291884 ?auto_291886 ) ) ( not ( = ?auto_291884 ?auto_291887 ) ) ( not ( = ?auto_291884 ?auto_291888 ) ) ( not ( = ?auto_291885 ?auto_291886 ) ) ( not ( = ?auto_291885 ?auto_291887 ) ) ( not ( = ?auto_291885 ?auto_291888 ) ) ( not ( = ?auto_291886 ?auto_291887 ) ) ( not ( = ?auto_291886 ?auto_291888 ) ) ( not ( = ?auto_291887 ?auto_291888 ) ) ( ON ?auto_291886 ?auto_291887 ) ( ON ?auto_291885 ?auto_291886 ) ( ON ?auto_291884 ?auto_291885 ) ( ON ?auto_291883 ?auto_291884 ) ( ON ?auto_291882 ?auto_291883 ) ( ON ?auto_291881 ?auto_291882 ) ( ON ?auto_291880 ?auto_291881 ) ( ON ?auto_291879 ?auto_291880 ) ( ON ?auto_291878 ?auto_291879 ) ( ON ?auto_291877 ?auto_291878 ) ( CLEAR ?auto_291875 ) ( ON ?auto_291876 ?auto_291877 ) ( CLEAR ?auto_291876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_291874 ?auto_291875 ?auto_291876 )
      ( MAKE-14PILE ?auto_291874 ?auto_291875 ?auto_291876 ?auto_291877 ?auto_291878 ?auto_291879 ?auto_291880 ?auto_291881 ?auto_291882 ?auto_291883 ?auto_291884 ?auto_291885 ?auto_291886 ?auto_291887 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291903 - BLOCK
      ?auto_291904 - BLOCK
      ?auto_291905 - BLOCK
      ?auto_291906 - BLOCK
      ?auto_291907 - BLOCK
      ?auto_291908 - BLOCK
      ?auto_291909 - BLOCK
      ?auto_291910 - BLOCK
      ?auto_291911 - BLOCK
      ?auto_291912 - BLOCK
      ?auto_291913 - BLOCK
      ?auto_291914 - BLOCK
      ?auto_291915 - BLOCK
      ?auto_291916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291916 ) ( ON-TABLE ?auto_291903 ) ( ON ?auto_291904 ?auto_291903 ) ( not ( = ?auto_291903 ?auto_291904 ) ) ( not ( = ?auto_291903 ?auto_291905 ) ) ( not ( = ?auto_291903 ?auto_291906 ) ) ( not ( = ?auto_291903 ?auto_291907 ) ) ( not ( = ?auto_291903 ?auto_291908 ) ) ( not ( = ?auto_291903 ?auto_291909 ) ) ( not ( = ?auto_291903 ?auto_291910 ) ) ( not ( = ?auto_291903 ?auto_291911 ) ) ( not ( = ?auto_291903 ?auto_291912 ) ) ( not ( = ?auto_291903 ?auto_291913 ) ) ( not ( = ?auto_291903 ?auto_291914 ) ) ( not ( = ?auto_291903 ?auto_291915 ) ) ( not ( = ?auto_291903 ?auto_291916 ) ) ( not ( = ?auto_291904 ?auto_291905 ) ) ( not ( = ?auto_291904 ?auto_291906 ) ) ( not ( = ?auto_291904 ?auto_291907 ) ) ( not ( = ?auto_291904 ?auto_291908 ) ) ( not ( = ?auto_291904 ?auto_291909 ) ) ( not ( = ?auto_291904 ?auto_291910 ) ) ( not ( = ?auto_291904 ?auto_291911 ) ) ( not ( = ?auto_291904 ?auto_291912 ) ) ( not ( = ?auto_291904 ?auto_291913 ) ) ( not ( = ?auto_291904 ?auto_291914 ) ) ( not ( = ?auto_291904 ?auto_291915 ) ) ( not ( = ?auto_291904 ?auto_291916 ) ) ( not ( = ?auto_291905 ?auto_291906 ) ) ( not ( = ?auto_291905 ?auto_291907 ) ) ( not ( = ?auto_291905 ?auto_291908 ) ) ( not ( = ?auto_291905 ?auto_291909 ) ) ( not ( = ?auto_291905 ?auto_291910 ) ) ( not ( = ?auto_291905 ?auto_291911 ) ) ( not ( = ?auto_291905 ?auto_291912 ) ) ( not ( = ?auto_291905 ?auto_291913 ) ) ( not ( = ?auto_291905 ?auto_291914 ) ) ( not ( = ?auto_291905 ?auto_291915 ) ) ( not ( = ?auto_291905 ?auto_291916 ) ) ( not ( = ?auto_291906 ?auto_291907 ) ) ( not ( = ?auto_291906 ?auto_291908 ) ) ( not ( = ?auto_291906 ?auto_291909 ) ) ( not ( = ?auto_291906 ?auto_291910 ) ) ( not ( = ?auto_291906 ?auto_291911 ) ) ( not ( = ?auto_291906 ?auto_291912 ) ) ( not ( = ?auto_291906 ?auto_291913 ) ) ( not ( = ?auto_291906 ?auto_291914 ) ) ( not ( = ?auto_291906 ?auto_291915 ) ) ( not ( = ?auto_291906 ?auto_291916 ) ) ( not ( = ?auto_291907 ?auto_291908 ) ) ( not ( = ?auto_291907 ?auto_291909 ) ) ( not ( = ?auto_291907 ?auto_291910 ) ) ( not ( = ?auto_291907 ?auto_291911 ) ) ( not ( = ?auto_291907 ?auto_291912 ) ) ( not ( = ?auto_291907 ?auto_291913 ) ) ( not ( = ?auto_291907 ?auto_291914 ) ) ( not ( = ?auto_291907 ?auto_291915 ) ) ( not ( = ?auto_291907 ?auto_291916 ) ) ( not ( = ?auto_291908 ?auto_291909 ) ) ( not ( = ?auto_291908 ?auto_291910 ) ) ( not ( = ?auto_291908 ?auto_291911 ) ) ( not ( = ?auto_291908 ?auto_291912 ) ) ( not ( = ?auto_291908 ?auto_291913 ) ) ( not ( = ?auto_291908 ?auto_291914 ) ) ( not ( = ?auto_291908 ?auto_291915 ) ) ( not ( = ?auto_291908 ?auto_291916 ) ) ( not ( = ?auto_291909 ?auto_291910 ) ) ( not ( = ?auto_291909 ?auto_291911 ) ) ( not ( = ?auto_291909 ?auto_291912 ) ) ( not ( = ?auto_291909 ?auto_291913 ) ) ( not ( = ?auto_291909 ?auto_291914 ) ) ( not ( = ?auto_291909 ?auto_291915 ) ) ( not ( = ?auto_291909 ?auto_291916 ) ) ( not ( = ?auto_291910 ?auto_291911 ) ) ( not ( = ?auto_291910 ?auto_291912 ) ) ( not ( = ?auto_291910 ?auto_291913 ) ) ( not ( = ?auto_291910 ?auto_291914 ) ) ( not ( = ?auto_291910 ?auto_291915 ) ) ( not ( = ?auto_291910 ?auto_291916 ) ) ( not ( = ?auto_291911 ?auto_291912 ) ) ( not ( = ?auto_291911 ?auto_291913 ) ) ( not ( = ?auto_291911 ?auto_291914 ) ) ( not ( = ?auto_291911 ?auto_291915 ) ) ( not ( = ?auto_291911 ?auto_291916 ) ) ( not ( = ?auto_291912 ?auto_291913 ) ) ( not ( = ?auto_291912 ?auto_291914 ) ) ( not ( = ?auto_291912 ?auto_291915 ) ) ( not ( = ?auto_291912 ?auto_291916 ) ) ( not ( = ?auto_291913 ?auto_291914 ) ) ( not ( = ?auto_291913 ?auto_291915 ) ) ( not ( = ?auto_291913 ?auto_291916 ) ) ( not ( = ?auto_291914 ?auto_291915 ) ) ( not ( = ?auto_291914 ?auto_291916 ) ) ( not ( = ?auto_291915 ?auto_291916 ) ) ( ON ?auto_291915 ?auto_291916 ) ( ON ?auto_291914 ?auto_291915 ) ( ON ?auto_291913 ?auto_291914 ) ( ON ?auto_291912 ?auto_291913 ) ( ON ?auto_291911 ?auto_291912 ) ( ON ?auto_291910 ?auto_291911 ) ( ON ?auto_291909 ?auto_291910 ) ( ON ?auto_291908 ?auto_291909 ) ( ON ?auto_291907 ?auto_291908 ) ( ON ?auto_291906 ?auto_291907 ) ( CLEAR ?auto_291904 ) ( ON ?auto_291905 ?auto_291906 ) ( CLEAR ?auto_291905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_291903 ?auto_291904 ?auto_291905 )
      ( MAKE-14PILE ?auto_291903 ?auto_291904 ?auto_291905 ?auto_291906 ?auto_291907 ?auto_291908 ?auto_291909 ?auto_291910 ?auto_291911 ?auto_291912 ?auto_291913 ?auto_291914 ?auto_291915 ?auto_291916 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291931 - BLOCK
      ?auto_291932 - BLOCK
      ?auto_291933 - BLOCK
      ?auto_291934 - BLOCK
      ?auto_291935 - BLOCK
      ?auto_291936 - BLOCK
      ?auto_291937 - BLOCK
      ?auto_291938 - BLOCK
      ?auto_291939 - BLOCK
      ?auto_291940 - BLOCK
      ?auto_291941 - BLOCK
      ?auto_291942 - BLOCK
      ?auto_291943 - BLOCK
      ?auto_291944 - BLOCK
    )
    :vars
    (
      ?auto_291945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_291944 ?auto_291945 ) ( ON-TABLE ?auto_291931 ) ( not ( = ?auto_291931 ?auto_291932 ) ) ( not ( = ?auto_291931 ?auto_291933 ) ) ( not ( = ?auto_291931 ?auto_291934 ) ) ( not ( = ?auto_291931 ?auto_291935 ) ) ( not ( = ?auto_291931 ?auto_291936 ) ) ( not ( = ?auto_291931 ?auto_291937 ) ) ( not ( = ?auto_291931 ?auto_291938 ) ) ( not ( = ?auto_291931 ?auto_291939 ) ) ( not ( = ?auto_291931 ?auto_291940 ) ) ( not ( = ?auto_291931 ?auto_291941 ) ) ( not ( = ?auto_291931 ?auto_291942 ) ) ( not ( = ?auto_291931 ?auto_291943 ) ) ( not ( = ?auto_291931 ?auto_291944 ) ) ( not ( = ?auto_291931 ?auto_291945 ) ) ( not ( = ?auto_291932 ?auto_291933 ) ) ( not ( = ?auto_291932 ?auto_291934 ) ) ( not ( = ?auto_291932 ?auto_291935 ) ) ( not ( = ?auto_291932 ?auto_291936 ) ) ( not ( = ?auto_291932 ?auto_291937 ) ) ( not ( = ?auto_291932 ?auto_291938 ) ) ( not ( = ?auto_291932 ?auto_291939 ) ) ( not ( = ?auto_291932 ?auto_291940 ) ) ( not ( = ?auto_291932 ?auto_291941 ) ) ( not ( = ?auto_291932 ?auto_291942 ) ) ( not ( = ?auto_291932 ?auto_291943 ) ) ( not ( = ?auto_291932 ?auto_291944 ) ) ( not ( = ?auto_291932 ?auto_291945 ) ) ( not ( = ?auto_291933 ?auto_291934 ) ) ( not ( = ?auto_291933 ?auto_291935 ) ) ( not ( = ?auto_291933 ?auto_291936 ) ) ( not ( = ?auto_291933 ?auto_291937 ) ) ( not ( = ?auto_291933 ?auto_291938 ) ) ( not ( = ?auto_291933 ?auto_291939 ) ) ( not ( = ?auto_291933 ?auto_291940 ) ) ( not ( = ?auto_291933 ?auto_291941 ) ) ( not ( = ?auto_291933 ?auto_291942 ) ) ( not ( = ?auto_291933 ?auto_291943 ) ) ( not ( = ?auto_291933 ?auto_291944 ) ) ( not ( = ?auto_291933 ?auto_291945 ) ) ( not ( = ?auto_291934 ?auto_291935 ) ) ( not ( = ?auto_291934 ?auto_291936 ) ) ( not ( = ?auto_291934 ?auto_291937 ) ) ( not ( = ?auto_291934 ?auto_291938 ) ) ( not ( = ?auto_291934 ?auto_291939 ) ) ( not ( = ?auto_291934 ?auto_291940 ) ) ( not ( = ?auto_291934 ?auto_291941 ) ) ( not ( = ?auto_291934 ?auto_291942 ) ) ( not ( = ?auto_291934 ?auto_291943 ) ) ( not ( = ?auto_291934 ?auto_291944 ) ) ( not ( = ?auto_291934 ?auto_291945 ) ) ( not ( = ?auto_291935 ?auto_291936 ) ) ( not ( = ?auto_291935 ?auto_291937 ) ) ( not ( = ?auto_291935 ?auto_291938 ) ) ( not ( = ?auto_291935 ?auto_291939 ) ) ( not ( = ?auto_291935 ?auto_291940 ) ) ( not ( = ?auto_291935 ?auto_291941 ) ) ( not ( = ?auto_291935 ?auto_291942 ) ) ( not ( = ?auto_291935 ?auto_291943 ) ) ( not ( = ?auto_291935 ?auto_291944 ) ) ( not ( = ?auto_291935 ?auto_291945 ) ) ( not ( = ?auto_291936 ?auto_291937 ) ) ( not ( = ?auto_291936 ?auto_291938 ) ) ( not ( = ?auto_291936 ?auto_291939 ) ) ( not ( = ?auto_291936 ?auto_291940 ) ) ( not ( = ?auto_291936 ?auto_291941 ) ) ( not ( = ?auto_291936 ?auto_291942 ) ) ( not ( = ?auto_291936 ?auto_291943 ) ) ( not ( = ?auto_291936 ?auto_291944 ) ) ( not ( = ?auto_291936 ?auto_291945 ) ) ( not ( = ?auto_291937 ?auto_291938 ) ) ( not ( = ?auto_291937 ?auto_291939 ) ) ( not ( = ?auto_291937 ?auto_291940 ) ) ( not ( = ?auto_291937 ?auto_291941 ) ) ( not ( = ?auto_291937 ?auto_291942 ) ) ( not ( = ?auto_291937 ?auto_291943 ) ) ( not ( = ?auto_291937 ?auto_291944 ) ) ( not ( = ?auto_291937 ?auto_291945 ) ) ( not ( = ?auto_291938 ?auto_291939 ) ) ( not ( = ?auto_291938 ?auto_291940 ) ) ( not ( = ?auto_291938 ?auto_291941 ) ) ( not ( = ?auto_291938 ?auto_291942 ) ) ( not ( = ?auto_291938 ?auto_291943 ) ) ( not ( = ?auto_291938 ?auto_291944 ) ) ( not ( = ?auto_291938 ?auto_291945 ) ) ( not ( = ?auto_291939 ?auto_291940 ) ) ( not ( = ?auto_291939 ?auto_291941 ) ) ( not ( = ?auto_291939 ?auto_291942 ) ) ( not ( = ?auto_291939 ?auto_291943 ) ) ( not ( = ?auto_291939 ?auto_291944 ) ) ( not ( = ?auto_291939 ?auto_291945 ) ) ( not ( = ?auto_291940 ?auto_291941 ) ) ( not ( = ?auto_291940 ?auto_291942 ) ) ( not ( = ?auto_291940 ?auto_291943 ) ) ( not ( = ?auto_291940 ?auto_291944 ) ) ( not ( = ?auto_291940 ?auto_291945 ) ) ( not ( = ?auto_291941 ?auto_291942 ) ) ( not ( = ?auto_291941 ?auto_291943 ) ) ( not ( = ?auto_291941 ?auto_291944 ) ) ( not ( = ?auto_291941 ?auto_291945 ) ) ( not ( = ?auto_291942 ?auto_291943 ) ) ( not ( = ?auto_291942 ?auto_291944 ) ) ( not ( = ?auto_291942 ?auto_291945 ) ) ( not ( = ?auto_291943 ?auto_291944 ) ) ( not ( = ?auto_291943 ?auto_291945 ) ) ( not ( = ?auto_291944 ?auto_291945 ) ) ( ON ?auto_291943 ?auto_291944 ) ( ON ?auto_291942 ?auto_291943 ) ( ON ?auto_291941 ?auto_291942 ) ( ON ?auto_291940 ?auto_291941 ) ( ON ?auto_291939 ?auto_291940 ) ( ON ?auto_291938 ?auto_291939 ) ( ON ?auto_291937 ?auto_291938 ) ( ON ?auto_291936 ?auto_291937 ) ( ON ?auto_291935 ?auto_291936 ) ( ON ?auto_291934 ?auto_291935 ) ( ON ?auto_291933 ?auto_291934 ) ( CLEAR ?auto_291931 ) ( ON ?auto_291932 ?auto_291933 ) ( CLEAR ?auto_291932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_291931 ?auto_291932 )
      ( MAKE-14PILE ?auto_291931 ?auto_291932 ?auto_291933 ?auto_291934 ?auto_291935 ?auto_291936 ?auto_291937 ?auto_291938 ?auto_291939 ?auto_291940 ?auto_291941 ?auto_291942 ?auto_291943 ?auto_291944 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291960 - BLOCK
      ?auto_291961 - BLOCK
      ?auto_291962 - BLOCK
      ?auto_291963 - BLOCK
      ?auto_291964 - BLOCK
      ?auto_291965 - BLOCK
      ?auto_291966 - BLOCK
      ?auto_291967 - BLOCK
      ?auto_291968 - BLOCK
      ?auto_291969 - BLOCK
      ?auto_291970 - BLOCK
      ?auto_291971 - BLOCK
      ?auto_291972 - BLOCK
      ?auto_291973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_291973 ) ( ON-TABLE ?auto_291960 ) ( not ( = ?auto_291960 ?auto_291961 ) ) ( not ( = ?auto_291960 ?auto_291962 ) ) ( not ( = ?auto_291960 ?auto_291963 ) ) ( not ( = ?auto_291960 ?auto_291964 ) ) ( not ( = ?auto_291960 ?auto_291965 ) ) ( not ( = ?auto_291960 ?auto_291966 ) ) ( not ( = ?auto_291960 ?auto_291967 ) ) ( not ( = ?auto_291960 ?auto_291968 ) ) ( not ( = ?auto_291960 ?auto_291969 ) ) ( not ( = ?auto_291960 ?auto_291970 ) ) ( not ( = ?auto_291960 ?auto_291971 ) ) ( not ( = ?auto_291960 ?auto_291972 ) ) ( not ( = ?auto_291960 ?auto_291973 ) ) ( not ( = ?auto_291961 ?auto_291962 ) ) ( not ( = ?auto_291961 ?auto_291963 ) ) ( not ( = ?auto_291961 ?auto_291964 ) ) ( not ( = ?auto_291961 ?auto_291965 ) ) ( not ( = ?auto_291961 ?auto_291966 ) ) ( not ( = ?auto_291961 ?auto_291967 ) ) ( not ( = ?auto_291961 ?auto_291968 ) ) ( not ( = ?auto_291961 ?auto_291969 ) ) ( not ( = ?auto_291961 ?auto_291970 ) ) ( not ( = ?auto_291961 ?auto_291971 ) ) ( not ( = ?auto_291961 ?auto_291972 ) ) ( not ( = ?auto_291961 ?auto_291973 ) ) ( not ( = ?auto_291962 ?auto_291963 ) ) ( not ( = ?auto_291962 ?auto_291964 ) ) ( not ( = ?auto_291962 ?auto_291965 ) ) ( not ( = ?auto_291962 ?auto_291966 ) ) ( not ( = ?auto_291962 ?auto_291967 ) ) ( not ( = ?auto_291962 ?auto_291968 ) ) ( not ( = ?auto_291962 ?auto_291969 ) ) ( not ( = ?auto_291962 ?auto_291970 ) ) ( not ( = ?auto_291962 ?auto_291971 ) ) ( not ( = ?auto_291962 ?auto_291972 ) ) ( not ( = ?auto_291962 ?auto_291973 ) ) ( not ( = ?auto_291963 ?auto_291964 ) ) ( not ( = ?auto_291963 ?auto_291965 ) ) ( not ( = ?auto_291963 ?auto_291966 ) ) ( not ( = ?auto_291963 ?auto_291967 ) ) ( not ( = ?auto_291963 ?auto_291968 ) ) ( not ( = ?auto_291963 ?auto_291969 ) ) ( not ( = ?auto_291963 ?auto_291970 ) ) ( not ( = ?auto_291963 ?auto_291971 ) ) ( not ( = ?auto_291963 ?auto_291972 ) ) ( not ( = ?auto_291963 ?auto_291973 ) ) ( not ( = ?auto_291964 ?auto_291965 ) ) ( not ( = ?auto_291964 ?auto_291966 ) ) ( not ( = ?auto_291964 ?auto_291967 ) ) ( not ( = ?auto_291964 ?auto_291968 ) ) ( not ( = ?auto_291964 ?auto_291969 ) ) ( not ( = ?auto_291964 ?auto_291970 ) ) ( not ( = ?auto_291964 ?auto_291971 ) ) ( not ( = ?auto_291964 ?auto_291972 ) ) ( not ( = ?auto_291964 ?auto_291973 ) ) ( not ( = ?auto_291965 ?auto_291966 ) ) ( not ( = ?auto_291965 ?auto_291967 ) ) ( not ( = ?auto_291965 ?auto_291968 ) ) ( not ( = ?auto_291965 ?auto_291969 ) ) ( not ( = ?auto_291965 ?auto_291970 ) ) ( not ( = ?auto_291965 ?auto_291971 ) ) ( not ( = ?auto_291965 ?auto_291972 ) ) ( not ( = ?auto_291965 ?auto_291973 ) ) ( not ( = ?auto_291966 ?auto_291967 ) ) ( not ( = ?auto_291966 ?auto_291968 ) ) ( not ( = ?auto_291966 ?auto_291969 ) ) ( not ( = ?auto_291966 ?auto_291970 ) ) ( not ( = ?auto_291966 ?auto_291971 ) ) ( not ( = ?auto_291966 ?auto_291972 ) ) ( not ( = ?auto_291966 ?auto_291973 ) ) ( not ( = ?auto_291967 ?auto_291968 ) ) ( not ( = ?auto_291967 ?auto_291969 ) ) ( not ( = ?auto_291967 ?auto_291970 ) ) ( not ( = ?auto_291967 ?auto_291971 ) ) ( not ( = ?auto_291967 ?auto_291972 ) ) ( not ( = ?auto_291967 ?auto_291973 ) ) ( not ( = ?auto_291968 ?auto_291969 ) ) ( not ( = ?auto_291968 ?auto_291970 ) ) ( not ( = ?auto_291968 ?auto_291971 ) ) ( not ( = ?auto_291968 ?auto_291972 ) ) ( not ( = ?auto_291968 ?auto_291973 ) ) ( not ( = ?auto_291969 ?auto_291970 ) ) ( not ( = ?auto_291969 ?auto_291971 ) ) ( not ( = ?auto_291969 ?auto_291972 ) ) ( not ( = ?auto_291969 ?auto_291973 ) ) ( not ( = ?auto_291970 ?auto_291971 ) ) ( not ( = ?auto_291970 ?auto_291972 ) ) ( not ( = ?auto_291970 ?auto_291973 ) ) ( not ( = ?auto_291971 ?auto_291972 ) ) ( not ( = ?auto_291971 ?auto_291973 ) ) ( not ( = ?auto_291972 ?auto_291973 ) ) ( ON ?auto_291972 ?auto_291973 ) ( ON ?auto_291971 ?auto_291972 ) ( ON ?auto_291970 ?auto_291971 ) ( ON ?auto_291969 ?auto_291970 ) ( ON ?auto_291968 ?auto_291969 ) ( ON ?auto_291967 ?auto_291968 ) ( ON ?auto_291966 ?auto_291967 ) ( ON ?auto_291965 ?auto_291966 ) ( ON ?auto_291964 ?auto_291965 ) ( ON ?auto_291963 ?auto_291964 ) ( ON ?auto_291962 ?auto_291963 ) ( CLEAR ?auto_291960 ) ( ON ?auto_291961 ?auto_291962 ) ( CLEAR ?auto_291961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_291960 ?auto_291961 )
      ( MAKE-14PILE ?auto_291960 ?auto_291961 ?auto_291962 ?auto_291963 ?auto_291964 ?auto_291965 ?auto_291966 ?auto_291967 ?auto_291968 ?auto_291969 ?auto_291970 ?auto_291971 ?auto_291972 ?auto_291973 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_291988 - BLOCK
      ?auto_291989 - BLOCK
      ?auto_291990 - BLOCK
      ?auto_291991 - BLOCK
      ?auto_291992 - BLOCK
      ?auto_291993 - BLOCK
      ?auto_291994 - BLOCK
      ?auto_291995 - BLOCK
      ?auto_291996 - BLOCK
      ?auto_291997 - BLOCK
      ?auto_291998 - BLOCK
      ?auto_291999 - BLOCK
      ?auto_292000 - BLOCK
      ?auto_292001 - BLOCK
    )
    :vars
    (
      ?auto_292002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_292001 ?auto_292002 ) ( not ( = ?auto_291988 ?auto_291989 ) ) ( not ( = ?auto_291988 ?auto_291990 ) ) ( not ( = ?auto_291988 ?auto_291991 ) ) ( not ( = ?auto_291988 ?auto_291992 ) ) ( not ( = ?auto_291988 ?auto_291993 ) ) ( not ( = ?auto_291988 ?auto_291994 ) ) ( not ( = ?auto_291988 ?auto_291995 ) ) ( not ( = ?auto_291988 ?auto_291996 ) ) ( not ( = ?auto_291988 ?auto_291997 ) ) ( not ( = ?auto_291988 ?auto_291998 ) ) ( not ( = ?auto_291988 ?auto_291999 ) ) ( not ( = ?auto_291988 ?auto_292000 ) ) ( not ( = ?auto_291988 ?auto_292001 ) ) ( not ( = ?auto_291988 ?auto_292002 ) ) ( not ( = ?auto_291989 ?auto_291990 ) ) ( not ( = ?auto_291989 ?auto_291991 ) ) ( not ( = ?auto_291989 ?auto_291992 ) ) ( not ( = ?auto_291989 ?auto_291993 ) ) ( not ( = ?auto_291989 ?auto_291994 ) ) ( not ( = ?auto_291989 ?auto_291995 ) ) ( not ( = ?auto_291989 ?auto_291996 ) ) ( not ( = ?auto_291989 ?auto_291997 ) ) ( not ( = ?auto_291989 ?auto_291998 ) ) ( not ( = ?auto_291989 ?auto_291999 ) ) ( not ( = ?auto_291989 ?auto_292000 ) ) ( not ( = ?auto_291989 ?auto_292001 ) ) ( not ( = ?auto_291989 ?auto_292002 ) ) ( not ( = ?auto_291990 ?auto_291991 ) ) ( not ( = ?auto_291990 ?auto_291992 ) ) ( not ( = ?auto_291990 ?auto_291993 ) ) ( not ( = ?auto_291990 ?auto_291994 ) ) ( not ( = ?auto_291990 ?auto_291995 ) ) ( not ( = ?auto_291990 ?auto_291996 ) ) ( not ( = ?auto_291990 ?auto_291997 ) ) ( not ( = ?auto_291990 ?auto_291998 ) ) ( not ( = ?auto_291990 ?auto_291999 ) ) ( not ( = ?auto_291990 ?auto_292000 ) ) ( not ( = ?auto_291990 ?auto_292001 ) ) ( not ( = ?auto_291990 ?auto_292002 ) ) ( not ( = ?auto_291991 ?auto_291992 ) ) ( not ( = ?auto_291991 ?auto_291993 ) ) ( not ( = ?auto_291991 ?auto_291994 ) ) ( not ( = ?auto_291991 ?auto_291995 ) ) ( not ( = ?auto_291991 ?auto_291996 ) ) ( not ( = ?auto_291991 ?auto_291997 ) ) ( not ( = ?auto_291991 ?auto_291998 ) ) ( not ( = ?auto_291991 ?auto_291999 ) ) ( not ( = ?auto_291991 ?auto_292000 ) ) ( not ( = ?auto_291991 ?auto_292001 ) ) ( not ( = ?auto_291991 ?auto_292002 ) ) ( not ( = ?auto_291992 ?auto_291993 ) ) ( not ( = ?auto_291992 ?auto_291994 ) ) ( not ( = ?auto_291992 ?auto_291995 ) ) ( not ( = ?auto_291992 ?auto_291996 ) ) ( not ( = ?auto_291992 ?auto_291997 ) ) ( not ( = ?auto_291992 ?auto_291998 ) ) ( not ( = ?auto_291992 ?auto_291999 ) ) ( not ( = ?auto_291992 ?auto_292000 ) ) ( not ( = ?auto_291992 ?auto_292001 ) ) ( not ( = ?auto_291992 ?auto_292002 ) ) ( not ( = ?auto_291993 ?auto_291994 ) ) ( not ( = ?auto_291993 ?auto_291995 ) ) ( not ( = ?auto_291993 ?auto_291996 ) ) ( not ( = ?auto_291993 ?auto_291997 ) ) ( not ( = ?auto_291993 ?auto_291998 ) ) ( not ( = ?auto_291993 ?auto_291999 ) ) ( not ( = ?auto_291993 ?auto_292000 ) ) ( not ( = ?auto_291993 ?auto_292001 ) ) ( not ( = ?auto_291993 ?auto_292002 ) ) ( not ( = ?auto_291994 ?auto_291995 ) ) ( not ( = ?auto_291994 ?auto_291996 ) ) ( not ( = ?auto_291994 ?auto_291997 ) ) ( not ( = ?auto_291994 ?auto_291998 ) ) ( not ( = ?auto_291994 ?auto_291999 ) ) ( not ( = ?auto_291994 ?auto_292000 ) ) ( not ( = ?auto_291994 ?auto_292001 ) ) ( not ( = ?auto_291994 ?auto_292002 ) ) ( not ( = ?auto_291995 ?auto_291996 ) ) ( not ( = ?auto_291995 ?auto_291997 ) ) ( not ( = ?auto_291995 ?auto_291998 ) ) ( not ( = ?auto_291995 ?auto_291999 ) ) ( not ( = ?auto_291995 ?auto_292000 ) ) ( not ( = ?auto_291995 ?auto_292001 ) ) ( not ( = ?auto_291995 ?auto_292002 ) ) ( not ( = ?auto_291996 ?auto_291997 ) ) ( not ( = ?auto_291996 ?auto_291998 ) ) ( not ( = ?auto_291996 ?auto_291999 ) ) ( not ( = ?auto_291996 ?auto_292000 ) ) ( not ( = ?auto_291996 ?auto_292001 ) ) ( not ( = ?auto_291996 ?auto_292002 ) ) ( not ( = ?auto_291997 ?auto_291998 ) ) ( not ( = ?auto_291997 ?auto_291999 ) ) ( not ( = ?auto_291997 ?auto_292000 ) ) ( not ( = ?auto_291997 ?auto_292001 ) ) ( not ( = ?auto_291997 ?auto_292002 ) ) ( not ( = ?auto_291998 ?auto_291999 ) ) ( not ( = ?auto_291998 ?auto_292000 ) ) ( not ( = ?auto_291998 ?auto_292001 ) ) ( not ( = ?auto_291998 ?auto_292002 ) ) ( not ( = ?auto_291999 ?auto_292000 ) ) ( not ( = ?auto_291999 ?auto_292001 ) ) ( not ( = ?auto_291999 ?auto_292002 ) ) ( not ( = ?auto_292000 ?auto_292001 ) ) ( not ( = ?auto_292000 ?auto_292002 ) ) ( not ( = ?auto_292001 ?auto_292002 ) ) ( ON ?auto_292000 ?auto_292001 ) ( ON ?auto_291999 ?auto_292000 ) ( ON ?auto_291998 ?auto_291999 ) ( ON ?auto_291997 ?auto_291998 ) ( ON ?auto_291996 ?auto_291997 ) ( ON ?auto_291995 ?auto_291996 ) ( ON ?auto_291994 ?auto_291995 ) ( ON ?auto_291993 ?auto_291994 ) ( ON ?auto_291992 ?auto_291993 ) ( ON ?auto_291991 ?auto_291992 ) ( ON ?auto_291990 ?auto_291991 ) ( ON ?auto_291989 ?auto_291990 ) ( ON ?auto_291988 ?auto_291989 ) ( CLEAR ?auto_291988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_291988 )
      ( MAKE-14PILE ?auto_291988 ?auto_291989 ?auto_291990 ?auto_291991 ?auto_291992 ?auto_291993 ?auto_291994 ?auto_291995 ?auto_291996 ?auto_291997 ?auto_291998 ?auto_291999 ?auto_292000 ?auto_292001 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_292017 - BLOCK
      ?auto_292018 - BLOCK
      ?auto_292019 - BLOCK
      ?auto_292020 - BLOCK
      ?auto_292021 - BLOCK
      ?auto_292022 - BLOCK
      ?auto_292023 - BLOCK
      ?auto_292024 - BLOCK
      ?auto_292025 - BLOCK
      ?auto_292026 - BLOCK
      ?auto_292027 - BLOCK
      ?auto_292028 - BLOCK
      ?auto_292029 - BLOCK
      ?auto_292030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_292030 ) ( not ( = ?auto_292017 ?auto_292018 ) ) ( not ( = ?auto_292017 ?auto_292019 ) ) ( not ( = ?auto_292017 ?auto_292020 ) ) ( not ( = ?auto_292017 ?auto_292021 ) ) ( not ( = ?auto_292017 ?auto_292022 ) ) ( not ( = ?auto_292017 ?auto_292023 ) ) ( not ( = ?auto_292017 ?auto_292024 ) ) ( not ( = ?auto_292017 ?auto_292025 ) ) ( not ( = ?auto_292017 ?auto_292026 ) ) ( not ( = ?auto_292017 ?auto_292027 ) ) ( not ( = ?auto_292017 ?auto_292028 ) ) ( not ( = ?auto_292017 ?auto_292029 ) ) ( not ( = ?auto_292017 ?auto_292030 ) ) ( not ( = ?auto_292018 ?auto_292019 ) ) ( not ( = ?auto_292018 ?auto_292020 ) ) ( not ( = ?auto_292018 ?auto_292021 ) ) ( not ( = ?auto_292018 ?auto_292022 ) ) ( not ( = ?auto_292018 ?auto_292023 ) ) ( not ( = ?auto_292018 ?auto_292024 ) ) ( not ( = ?auto_292018 ?auto_292025 ) ) ( not ( = ?auto_292018 ?auto_292026 ) ) ( not ( = ?auto_292018 ?auto_292027 ) ) ( not ( = ?auto_292018 ?auto_292028 ) ) ( not ( = ?auto_292018 ?auto_292029 ) ) ( not ( = ?auto_292018 ?auto_292030 ) ) ( not ( = ?auto_292019 ?auto_292020 ) ) ( not ( = ?auto_292019 ?auto_292021 ) ) ( not ( = ?auto_292019 ?auto_292022 ) ) ( not ( = ?auto_292019 ?auto_292023 ) ) ( not ( = ?auto_292019 ?auto_292024 ) ) ( not ( = ?auto_292019 ?auto_292025 ) ) ( not ( = ?auto_292019 ?auto_292026 ) ) ( not ( = ?auto_292019 ?auto_292027 ) ) ( not ( = ?auto_292019 ?auto_292028 ) ) ( not ( = ?auto_292019 ?auto_292029 ) ) ( not ( = ?auto_292019 ?auto_292030 ) ) ( not ( = ?auto_292020 ?auto_292021 ) ) ( not ( = ?auto_292020 ?auto_292022 ) ) ( not ( = ?auto_292020 ?auto_292023 ) ) ( not ( = ?auto_292020 ?auto_292024 ) ) ( not ( = ?auto_292020 ?auto_292025 ) ) ( not ( = ?auto_292020 ?auto_292026 ) ) ( not ( = ?auto_292020 ?auto_292027 ) ) ( not ( = ?auto_292020 ?auto_292028 ) ) ( not ( = ?auto_292020 ?auto_292029 ) ) ( not ( = ?auto_292020 ?auto_292030 ) ) ( not ( = ?auto_292021 ?auto_292022 ) ) ( not ( = ?auto_292021 ?auto_292023 ) ) ( not ( = ?auto_292021 ?auto_292024 ) ) ( not ( = ?auto_292021 ?auto_292025 ) ) ( not ( = ?auto_292021 ?auto_292026 ) ) ( not ( = ?auto_292021 ?auto_292027 ) ) ( not ( = ?auto_292021 ?auto_292028 ) ) ( not ( = ?auto_292021 ?auto_292029 ) ) ( not ( = ?auto_292021 ?auto_292030 ) ) ( not ( = ?auto_292022 ?auto_292023 ) ) ( not ( = ?auto_292022 ?auto_292024 ) ) ( not ( = ?auto_292022 ?auto_292025 ) ) ( not ( = ?auto_292022 ?auto_292026 ) ) ( not ( = ?auto_292022 ?auto_292027 ) ) ( not ( = ?auto_292022 ?auto_292028 ) ) ( not ( = ?auto_292022 ?auto_292029 ) ) ( not ( = ?auto_292022 ?auto_292030 ) ) ( not ( = ?auto_292023 ?auto_292024 ) ) ( not ( = ?auto_292023 ?auto_292025 ) ) ( not ( = ?auto_292023 ?auto_292026 ) ) ( not ( = ?auto_292023 ?auto_292027 ) ) ( not ( = ?auto_292023 ?auto_292028 ) ) ( not ( = ?auto_292023 ?auto_292029 ) ) ( not ( = ?auto_292023 ?auto_292030 ) ) ( not ( = ?auto_292024 ?auto_292025 ) ) ( not ( = ?auto_292024 ?auto_292026 ) ) ( not ( = ?auto_292024 ?auto_292027 ) ) ( not ( = ?auto_292024 ?auto_292028 ) ) ( not ( = ?auto_292024 ?auto_292029 ) ) ( not ( = ?auto_292024 ?auto_292030 ) ) ( not ( = ?auto_292025 ?auto_292026 ) ) ( not ( = ?auto_292025 ?auto_292027 ) ) ( not ( = ?auto_292025 ?auto_292028 ) ) ( not ( = ?auto_292025 ?auto_292029 ) ) ( not ( = ?auto_292025 ?auto_292030 ) ) ( not ( = ?auto_292026 ?auto_292027 ) ) ( not ( = ?auto_292026 ?auto_292028 ) ) ( not ( = ?auto_292026 ?auto_292029 ) ) ( not ( = ?auto_292026 ?auto_292030 ) ) ( not ( = ?auto_292027 ?auto_292028 ) ) ( not ( = ?auto_292027 ?auto_292029 ) ) ( not ( = ?auto_292027 ?auto_292030 ) ) ( not ( = ?auto_292028 ?auto_292029 ) ) ( not ( = ?auto_292028 ?auto_292030 ) ) ( not ( = ?auto_292029 ?auto_292030 ) ) ( ON ?auto_292029 ?auto_292030 ) ( ON ?auto_292028 ?auto_292029 ) ( ON ?auto_292027 ?auto_292028 ) ( ON ?auto_292026 ?auto_292027 ) ( ON ?auto_292025 ?auto_292026 ) ( ON ?auto_292024 ?auto_292025 ) ( ON ?auto_292023 ?auto_292024 ) ( ON ?auto_292022 ?auto_292023 ) ( ON ?auto_292021 ?auto_292022 ) ( ON ?auto_292020 ?auto_292021 ) ( ON ?auto_292019 ?auto_292020 ) ( ON ?auto_292018 ?auto_292019 ) ( ON ?auto_292017 ?auto_292018 ) ( CLEAR ?auto_292017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_292017 )
      ( MAKE-14PILE ?auto_292017 ?auto_292018 ?auto_292019 ?auto_292020 ?auto_292021 ?auto_292022 ?auto_292023 ?auto_292024 ?auto_292025 ?auto_292026 ?auto_292027 ?auto_292028 ?auto_292029 ?auto_292030 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_292045 - BLOCK
      ?auto_292046 - BLOCK
      ?auto_292047 - BLOCK
      ?auto_292048 - BLOCK
      ?auto_292049 - BLOCK
      ?auto_292050 - BLOCK
      ?auto_292051 - BLOCK
      ?auto_292052 - BLOCK
      ?auto_292053 - BLOCK
      ?auto_292054 - BLOCK
      ?auto_292055 - BLOCK
      ?auto_292056 - BLOCK
      ?auto_292057 - BLOCK
      ?auto_292058 - BLOCK
    )
    :vars
    (
      ?auto_292059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_292045 ?auto_292046 ) ) ( not ( = ?auto_292045 ?auto_292047 ) ) ( not ( = ?auto_292045 ?auto_292048 ) ) ( not ( = ?auto_292045 ?auto_292049 ) ) ( not ( = ?auto_292045 ?auto_292050 ) ) ( not ( = ?auto_292045 ?auto_292051 ) ) ( not ( = ?auto_292045 ?auto_292052 ) ) ( not ( = ?auto_292045 ?auto_292053 ) ) ( not ( = ?auto_292045 ?auto_292054 ) ) ( not ( = ?auto_292045 ?auto_292055 ) ) ( not ( = ?auto_292045 ?auto_292056 ) ) ( not ( = ?auto_292045 ?auto_292057 ) ) ( not ( = ?auto_292045 ?auto_292058 ) ) ( not ( = ?auto_292046 ?auto_292047 ) ) ( not ( = ?auto_292046 ?auto_292048 ) ) ( not ( = ?auto_292046 ?auto_292049 ) ) ( not ( = ?auto_292046 ?auto_292050 ) ) ( not ( = ?auto_292046 ?auto_292051 ) ) ( not ( = ?auto_292046 ?auto_292052 ) ) ( not ( = ?auto_292046 ?auto_292053 ) ) ( not ( = ?auto_292046 ?auto_292054 ) ) ( not ( = ?auto_292046 ?auto_292055 ) ) ( not ( = ?auto_292046 ?auto_292056 ) ) ( not ( = ?auto_292046 ?auto_292057 ) ) ( not ( = ?auto_292046 ?auto_292058 ) ) ( not ( = ?auto_292047 ?auto_292048 ) ) ( not ( = ?auto_292047 ?auto_292049 ) ) ( not ( = ?auto_292047 ?auto_292050 ) ) ( not ( = ?auto_292047 ?auto_292051 ) ) ( not ( = ?auto_292047 ?auto_292052 ) ) ( not ( = ?auto_292047 ?auto_292053 ) ) ( not ( = ?auto_292047 ?auto_292054 ) ) ( not ( = ?auto_292047 ?auto_292055 ) ) ( not ( = ?auto_292047 ?auto_292056 ) ) ( not ( = ?auto_292047 ?auto_292057 ) ) ( not ( = ?auto_292047 ?auto_292058 ) ) ( not ( = ?auto_292048 ?auto_292049 ) ) ( not ( = ?auto_292048 ?auto_292050 ) ) ( not ( = ?auto_292048 ?auto_292051 ) ) ( not ( = ?auto_292048 ?auto_292052 ) ) ( not ( = ?auto_292048 ?auto_292053 ) ) ( not ( = ?auto_292048 ?auto_292054 ) ) ( not ( = ?auto_292048 ?auto_292055 ) ) ( not ( = ?auto_292048 ?auto_292056 ) ) ( not ( = ?auto_292048 ?auto_292057 ) ) ( not ( = ?auto_292048 ?auto_292058 ) ) ( not ( = ?auto_292049 ?auto_292050 ) ) ( not ( = ?auto_292049 ?auto_292051 ) ) ( not ( = ?auto_292049 ?auto_292052 ) ) ( not ( = ?auto_292049 ?auto_292053 ) ) ( not ( = ?auto_292049 ?auto_292054 ) ) ( not ( = ?auto_292049 ?auto_292055 ) ) ( not ( = ?auto_292049 ?auto_292056 ) ) ( not ( = ?auto_292049 ?auto_292057 ) ) ( not ( = ?auto_292049 ?auto_292058 ) ) ( not ( = ?auto_292050 ?auto_292051 ) ) ( not ( = ?auto_292050 ?auto_292052 ) ) ( not ( = ?auto_292050 ?auto_292053 ) ) ( not ( = ?auto_292050 ?auto_292054 ) ) ( not ( = ?auto_292050 ?auto_292055 ) ) ( not ( = ?auto_292050 ?auto_292056 ) ) ( not ( = ?auto_292050 ?auto_292057 ) ) ( not ( = ?auto_292050 ?auto_292058 ) ) ( not ( = ?auto_292051 ?auto_292052 ) ) ( not ( = ?auto_292051 ?auto_292053 ) ) ( not ( = ?auto_292051 ?auto_292054 ) ) ( not ( = ?auto_292051 ?auto_292055 ) ) ( not ( = ?auto_292051 ?auto_292056 ) ) ( not ( = ?auto_292051 ?auto_292057 ) ) ( not ( = ?auto_292051 ?auto_292058 ) ) ( not ( = ?auto_292052 ?auto_292053 ) ) ( not ( = ?auto_292052 ?auto_292054 ) ) ( not ( = ?auto_292052 ?auto_292055 ) ) ( not ( = ?auto_292052 ?auto_292056 ) ) ( not ( = ?auto_292052 ?auto_292057 ) ) ( not ( = ?auto_292052 ?auto_292058 ) ) ( not ( = ?auto_292053 ?auto_292054 ) ) ( not ( = ?auto_292053 ?auto_292055 ) ) ( not ( = ?auto_292053 ?auto_292056 ) ) ( not ( = ?auto_292053 ?auto_292057 ) ) ( not ( = ?auto_292053 ?auto_292058 ) ) ( not ( = ?auto_292054 ?auto_292055 ) ) ( not ( = ?auto_292054 ?auto_292056 ) ) ( not ( = ?auto_292054 ?auto_292057 ) ) ( not ( = ?auto_292054 ?auto_292058 ) ) ( not ( = ?auto_292055 ?auto_292056 ) ) ( not ( = ?auto_292055 ?auto_292057 ) ) ( not ( = ?auto_292055 ?auto_292058 ) ) ( not ( = ?auto_292056 ?auto_292057 ) ) ( not ( = ?auto_292056 ?auto_292058 ) ) ( not ( = ?auto_292057 ?auto_292058 ) ) ( ON ?auto_292045 ?auto_292059 ) ( not ( = ?auto_292058 ?auto_292059 ) ) ( not ( = ?auto_292057 ?auto_292059 ) ) ( not ( = ?auto_292056 ?auto_292059 ) ) ( not ( = ?auto_292055 ?auto_292059 ) ) ( not ( = ?auto_292054 ?auto_292059 ) ) ( not ( = ?auto_292053 ?auto_292059 ) ) ( not ( = ?auto_292052 ?auto_292059 ) ) ( not ( = ?auto_292051 ?auto_292059 ) ) ( not ( = ?auto_292050 ?auto_292059 ) ) ( not ( = ?auto_292049 ?auto_292059 ) ) ( not ( = ?auto_292048 ?auto_292059 ) ) ( not ( = ?auto_292047 ?auto_292059 ) ) ( not ( = ?auto_292046 ?auto_292059 ) ) ( not ( = ?auto_292045 ?auto_292059 ) ) ( ON ?auto_292046 ?auto_292045 ) ( ON ?auto_292047 ?auto_292046 ) ( ON ?auto_292048 ?auto_292047 ) ( ON ?auto_292049 ?auto_292048 ) ( ON ?auto_292050 ?auto_292049 ) ( ON ?auto_292051 ?auto_292050 ) ( ON ?auto_292052 ?auto_292051 ) ( ON ?auto_292053 ?auto_292052 ) ( ON ?auto_292054 ?auto_292053 ) ( ON ?auto_292055 ?auto_292054 ) ( ON ?auto_292056 ?auto_292055 ) ( ON ?auto_292057 ?auto_292056 ) ( ON ?auto_292058 ?auto_292057 ) ( CLEAR ?auto_292058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_292058 ?auto_292057 ?auto_292056 ?auto_292055 ?auto_292054 ?auto_292053 ?auto_292052 ?auto_292051 ?auto_292050 ?auto_292049 ?auto_292048 ?auto_292047 ?auto_292046 ?auto_292045 )
      ( MAKE-14PILE ?auto_292045 ?auto_292046 ?auto_292047 ?auto_292048 ?auto_292049 ?auto_292050 ?auto_292051 ?auto_292052 ?auto_292053 ?auto_292054 ?auto_292055 ?auto_292056 ?auto_292057 ?auto_292058 ) )
  )

)

