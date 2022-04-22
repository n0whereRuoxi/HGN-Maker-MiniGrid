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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53918 - BLOCK
      ?auto_53919 - BLOCK
      ?auto_53920 - BLOCK
      ?auto_53921 - BLOCK
      ?auto_53922 - BLOCK
      ?auto_53923 - BLOCK
    )
    :vars
    (
      ?auto_53924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53924 ?auto_53923 ) ( CLEAR ?auto_53924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53918 ) ( ON ?auto_53919 ?auto_53918 ) ( ON ?auto_53920 ?auto_53919 ) ( ON ?auto_53921 ?auto_53920 ) ( ON ?auto_53922 ?auto_53921 ) ( ON ?auto_53923 ?auto_53922 ) ( not ( = ?auto_53918 ?auto_53919 ) ) ( not ( = ?auto_53918 ?auto_53920 ) ) ( not ( = ?auto_53918 ?auto_53921 ) ) ( not ( = ?auto_53918 ?auto_53922 ) ) ( not ( = ?auto_53918 ?auto_53923 ) ) ( not ( = ?auto_53918 ?auto_53924 ) ) ( not ( = ?auto_53919 ?auto_53920 ) ) ( not ( = ?auto_53919 ?auto_53921 ) ) ( not ( = ?auto_53919 ?auto_53922 ) ) ( not ( = ?auto_53919 ?auto_53923 ) ) ( not ( = ?auto_53919 ?auto_53924 ) ) ( not ( = ?auto_53920 ?auto_53921 ) ) ( not ( = ?auto_53920 ?auto_53922 ) ) ( not ( = ?auto_53920 ?auto_53923 ) ) ( not ( = ?auto_53920 ?auto_53924 ) ) ( not ( = ?auto_53921 ?auto_53922 ) ) ( not ( = ?auto_53921 ?auto_53923 ) ) ( not ( = ?auto_53921 ?auto_53924 ) ) ( not ( = ?auto_53922 ?auto_53923 ) ) ( not ( = ?auto_53922 ?auto_53924 ) ) ( not ( = ?auto_53923 ?auto_53924 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53924 ?auto_53923 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53926 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_53926 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_53926 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53927 - BLOCK
    )
    :vars
    (
      ?auto_53928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53927 ?auto_53928 ) ( CLEAR ?auto_53927 ) ( HAND-EMPTY ) ( not ( = ?auto_53927 ?auto_53928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53927 ?auto_53928 )
      ( MAKE-1PILE ?auto_53927 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53934 - BLOCK
      ?auto_53935 - BLOCK
      ?auto_53936 - BLOCK
      ?auto_53937 - BLOCK
      ?auto_53938 - BLOCK
    )
    :vars
    (
      ?auto_53939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53939 ?auto_53938 ) ( CLEAR ?auto_53939 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53934 ) ( ON ?auto_53935 ?auto_53934 ) ( ON ?auto_53936 ?auto_53935 ) ( ON ?auto_53937 ?auto_53936 ) ( ON ?auto_53938 ?auto_53937 ) ( not ( = ?auto_53934 ?auto_53935 ) ) ( not ( = ?auto_53934 ?auto_53936 ) ) ( not ( = ?auto_53934 ?auto_53937 ) ) ( not ( = ?auto_53934 ?auto_53938 ) ) ( not ( = ?auto_53934 ?auto_53939 ) ) ( not ( = ?auto_53935 ?auto_53936 ) ) ( not ( = ?auto_53935 ?auto_53937 ) ) ( not ( = ?auto_53935 ?auto_53938 ) ) ( not ( = ?auto_53935 ?auto_53939 ) ) ( not ( = ?auto_53936 ?auto_53937 ) ) ( not ( = ?auto_53936 ?auto_53938 ) ) ( not ( = ?auto_53936 ?auto_53939 ) ) ( not ( = ?auto_53937 ?auto_53938 ) ) ( not ( = ?auto_53937 ?auto_53939 ) ) ( not ( = ?auto_53938 ?auto_53939 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53939 ?auto_53938 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53940 - BLOCK
      ?auto_53941 - BLOCK
      ?auto_53942 - BLOCK
      ?auto_53943 - BLOCK
      ?auto_53944 - BLOCK
    )
    :vars
    (
      ?auto_53945 - BLOCK
      ?auto_53946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53945 ?auto_53944 ) ( CLEAR ?auto_53945 ) ( ON-TABLE ?auto_53940 ) ( ON ?auto_53941 ?auto_53940 ) ( ON ?auto_53942 ?auto_53941 ) ( ON ?auto_53943 ?auto_53942 ) ( ON ?auto_53944 ?auto_53943 ) ( not ( = ?auto_53940 ?auto_53941 ) ) ( not ( = ?auto_53940 ?auto_53942 ) ) ( not ( = ?auto_53940 ?auto_53943 ) ) ( not ( = ?auto_53940 ?auto_53944 ) ) ( not ( = ?auto_53940 ?auto_53945 ) ) ( not ( = ?auto_53941 ?auto_53942 ) ) ( not ( = ?auto_53941 ?auto_53943 ) ) ( not ( = ?auto_53941 ?auto_53944 ) ) ( not ( = ?auto_53941 ?auto_53945 ) ) ( not ( = ?auto_53942 ?auto_53943 ) ) ( not ( = ?auto_53942 ?auto_53944 ) ) ( not ( = ?auto_53942 ?auto_53945 ) ) ( not ( = ?auto_53943 ?auto_53944 ) ) ( not ( = ?auto_53943 ?auto_53945 ) ) ( not ( = ?auto_53944 ?auto_53945 ) ) ( HOLDING ?auto_53946 ) ( not ( = ?auto_53940 ?auto_53946 ) ) ( not ( = ?auto_53941 ?auto_53946 ) ) ( not ( = ?auto_53942 ?auto_53946 ) ) ( not ( = ?auto_53943 ?auto_53946 ) ) ( not ( = ?auto_53944 ?auto_53946 ) ) ( not ( = ?auto_53945 ?auto_53946 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_53946 )
      ( MAKE-5PILE ?auto_53940 ?auto_53941 ?auto_53942 ?auto_53943 ?auto_53944 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53947 - BLOCK
      ?auto_53948 - BLOCK
      ?auto_53949 - BLOCK
      ?auto_53950 - BLOCK
      ?auto_53951 - BLOCK
    )
    :vars
    (
      ?auto_53952 - BLOCK
      ?auto_53953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53952 ?auto_53951 ) ( ON-TABLE ?auto_53947 ) ( ON ?auto_53948 ?auto_53947 ) ( ON ?auto_53949 ?auto_53948 ) ( ON ?auto_53950 ?auto_53949 ) ( ON ?auto_53951 ?auto_53950 ) ( not ( = ?auto_53947 ?auto_53948 ) ) ( not ( = ?auto_53947 ?auto_53949 ) ) ( not ( = ?auto_53947 ?auto_53950 ) ) ( not ( = ?auto_53947 ?auto_53951 ) ) ( not ( = ?auto_53947 ?auto_53952 ) ) ( not ( = ?auto_53948 ?auto_53949 ) ) ( not ( = ?auto_53948 ?auto_53950 ) ) ( not ( = ?auto_53948 ?auto_53951 ) ) ( not ( = ?auto_53948 ?auto_53952 ) ) ( not ( = ?auto_53949 ?auto_53950 ) ) ( not ( = ?auto_53949 ?auto_53951 ) ) ( not ( = ?auto_53949 ?auto_53952 ) ) ( not ( = ?auto_53950 ?auto_53951 ) ) ( not ( = ?auto_53950 ?auto_53952 ) ) ( not ( = ?auto_53951 ?auto_53952 ) ) ( not ( = ?auto_53947 ?auto_53953 ) ) ( not ( = ?auto_53948 ?auto_53953 ) ) ( not ( = ?auto_53949 ?auto_53953 ) ) ( not ( = ?auto_53950 ?auto_53953 ) ) ( not ( = ?auto_53951 ?auto_53953 ) ) ( not ( = ?auto_53952 ?auto_53953 ) ) ( ON ?auto_53953 ?auto_53952 ) ( CLEAR ?auto_53953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53947 ?auto_53948 ?auto_53949 ?auto_53950 ?auto_53951 ?auto_53952 )
      ( MAKE-5PILE ?auto_53947 ?auto_53948 ?auto_53949 ?auto_53950 ?auto_53951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53956 - BLOCK
      ?auto_53957 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_53957 ) ( CLEAR ?auto_53956 ) ( ON-TABLE ?auto_53956 ) ( not ( = ?auto_53956 ?auto_53957 ) ) )
    :subtasks
    ( ( !STACK ?auto_53957 ?auto_53956 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53958 - BLOCK
      ?auto_53959 - BLOCK
    )
    :vars
    (
      ?auto_53960 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53958 ) ( ON-TABLE ?auto_53958 ) ( not ( = ?auto_53958 ?auto_53959 ) ) ( ON ?auto_53959 ?auto_53960 ) ( CLEAR ?auto_53959 ) ( HAND-EMPTY ) ( not ( = ?auto_53958 ?auto_53960 ) ) ( not ( = ?auto_53959 ?auto_53960 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53959 ?auto_53960 )
      ( MAKE-2PILE ?auto_53958 ?auto_53959 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53961 - BLOCK
      ?auto_53962 - BLOCK
    )
    :vars
    (
      ?auto_53963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53961 ?auto_53962 ) ) ( ON ?auto_53962 ?auto_53963 ) ( CLEAR ?auto_53962 ) ( not ( = ?auto_53961 ?auto_53963 ) ) ( not ( = ?auto_53962 ?auto_53963 ) ) ( HOLDING ?auto_53961 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53961 )
      ( MAKE-2PILE ?auto_53961 ?auto_53962 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53964 - BLOCK
      ?auto_53965 - BLOCK
    )
    :vars
    (
      ?auto_53966 - BLOCK
      ?auto_53970 - BLOCK
      ?auto_53967 - BLOCK
      ?auto_53969 - BLOCK
      ?auto_53968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53964 ?auto_53965 ) ) ( ON ?auto_53965 ?auto_53966 ) ( not ( = ?auto_53964 ?auto_53966 ) ) ( not ( = ?auto_53965 ?auto_53966 ) ) ( ON ?auto_53964 ?auto_53965 ) ( CLEAR ?auto_53964 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53970 ) ( ON ?auto_53967 ?auto_53970 ) ( ON ?auto_53969 ?auto_53967 ) ( ON ?auto_53968 ?auto_53969 ) ( ON ?auto_53966 ?auto_53968 ) ( not ( = ?auto_53970 ?auto_53967 ) ) ( not ( = ?auto_53970 ?auto_53969 ) ) ( not ( = ?auto_53970 ?auto_53968 ) ) ( not ( = ?auto_53970 ?auto_53966 ) ) ( not ( = ?auto_53970 ?auto_53965 ) ) ( not ( = ?auto_53970 ?auto_53964 ) ) ( not ( = ?auto_53967 ?auto_53969 ) ) ( not ( = ?auto_53967 ?auto_53968 ) ) ( not ( = ?auto_53967 ?auto_53966 ) ) ( not ( = ?auto_53967 ?auto_53965 ) ) ( not ( = ?auto_53967 ?auto_53964 ) ) ( not ( = ?auto_53969 ?auto_53968 ) ) ( not ( = ?auto_53969 ?auto_53966 ) ) ( not ( = ?auto_53969 ?auto_53965 ) ) ( not ( = ?auto_53969 ?auto_53964 ) ) ( not ( = ?auto_53968 ?auto_53966 ) ) ( not ( = ?auto_53968 ?auto_53965 ) ) ( not ( = ?auto_53968 ?auto_53964 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53970 ?auto_53967 ?auto_53969 ?auto_53968 ?auto_53966 ?auto_53965 )
      ( MAKE-2PILE ?auto_53964 ?auto_53965 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53975 - BLOCK
      ?auto_53976 - BLOCK
      ?auto_53977 - BLOCK
      ?auto_53978 - BLOCK
    )
    :vars
    (
      ?auto_53979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53979 ?auto_53978 ) ( CLEAR ?auto_53979 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53975 ) ( ON ?auto_53976 ?auto_53975 ) ( ON ?auto_53977 ?auto_53976 ) ( ON ?auto_53978 ?auto_53977 ) ( not ( = ?auto_53975 ?auto_53976 ) ) ( not ( = ?auto_53975 ?auto_53977 ) ) ( not ( = ?auto_53975 ?auto_53978 ) ) ( not ( = ?auto_53975 ?auto_53979 ) ) ( not ( = ?auto_53976 ?auto_53977 ) ) ( not ( = ?auto_53976 ?auto_53978 ) ) ( not ( = ?auto_53976 ?auto_53979 ) ) ( not ( = ?auto_53977 ?auto_53978 ) ) ( not ( = ?auto_53977 ?auto_53979 ) ) ( not ( = ?auto_53978 ?auto_53979 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53979 ?auto_53978 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53980 - BLOCK
      ?auto_53981 - BLOCK
      ?auto_53982 - BLOCK
      ?auto_53983 - BLOCK
    )
    :vars
    (
      ?auto_53984 - BLOCK
      ?auto_53985 - BLOCK
      ?auto_53986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53984 ?auto_53983 ) ( CLEAR ?auto_53984 ) ( ON-TABLE ?auto_53980 ) ( ON ?auto_53981 ?auto_53980 ) ( ON ?auto_53982 ?auto_53981 ) ( ON ?auto_53983 ?auto_53982 ) ( not ( = ?auto_53980 ?auto_53981 ) ) ( not ( = ?auto_53980 ?auto_53982 ) ) ( not ( = ?auto_53980 ?auto_53983 ) ) ( not ( = ?auto_53980 ?auto_53984 ) ) ( not ( = ?auto_53981 ?auto_53982 ) ) ( not ( = ?auto_53981 ?auto_53983 ) ) ( not ( = ?auto_53981 ?auto_53984 ) ) ( not ( = ?auto_53982 ?auto_53983 ) ) ( not ( = ?auto_53982 ?auto_53984 ) ) ( not ( = ?auto_53983 ?auto_53984 ) ) ( HOLDING ?auto_53985 ) ( CLEAR ?auto_53986 ) ( not ( = ?auto_53980 ?auto_53985 ) ) ( not ( = ?auto_53980 ?auto_53986 ) ) ( not ( = ?auto_53981 ?auto_53985 ) ) ( not ( = ?auto_53981 ?auto_53986 ) ) ( not ( = ?auto_53982 ?auto_53985 ) ) ( not ( = ?auto_53982 ?auto_53986 ) ) ( not ( = ?auto_53983 ?auto_53985 ) ) ( not ( = ?auto_53983 ?auto_53986 ) ) ( not ( = ?auto_53984 ?auto_53985 ) ) ( not ( = ?auto_53984 ?auto_53986 ) ) ( not ( = ?auto_53985 ?auto_53986 ) ) )
    :subtasks
    ( ( !STACK ?auto_53985 ?auto_53986 )
      ( MAKE-4PILE ?auto_53980 ?auto_53981 ?auto_53982 ?auto_53983 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53987 - BLOCK
      ?auto_53988 - BLOCK
      ?auto_53989 - BLOCK
      ?auto_53990 - BLOCK
    )
    :vars
    (
      ?auto_53992 - BLOCK
      ?auto_53993 - BLOCK
      ?auto_53991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53992 ?auto_53990 ) ( ON-TABLE ?auto_53987 ) ( ON ?auto_53988 ?auto_53987 ) ( ON ?auto_53989 ?auto_53988 ) ( ON ?auto_53990 ?auto_53989 ) ( not ( = ?auto_53987 ?auto_53988 ) ) ( not ( = ?auto_53987 ?auto_53989 ) ) ( not ( = ?auto_53987 ?auto_53990 ) ) ( not ( = ?auto_53987 ?auto_53992 ) ) ( not ( = ?auto_53988 ?auto_53989 ) ) ( not ( = ?auto_53988 ?auto_53990 ) ) ( not ( = ?auto_53988 ?auto_53992 ) ) ( not ( = ?auto_53989 ?auto_53990 ) ) ( not ( = ?auto_53989 ?auto_53992 ) ) ( not ( = ?auto_53990 ?auto_53992 ) ) ( CLEAR ?auto_53993 ) ( not ( = ?auto_53987 ?auto_53991 ) ) ( not ( = ?auto_53987 ?auto_53993 ) ) ( not ( = ?auto_53988 ?auto_53991 ) ) ( not ( = ?auto_53988 ?auto_53993 ) ) ( not ( = ?auto_53989 ?auto_53991 ) ) ( not ( = ?auto_53989 ?auto_53993 ) ) ( not ( = ?auto_53990 ?auto_53991 ) ) ( not ( = ?auto_53990 ?auto_53993 ) ) ( not ( = ?auto_53992 ?auto_53991 ) ) ( not ( = ?auto_53992 ?auto_53993 ) ) ( not ( = ?auto_53991 ?auto_53993 ) ) ( ON ?auto_53991 ?auto_53992 ) ( CLEAR ?auto_53991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53987 ?auto_53988 ?auto_53989 ?auto_53990 ?auto_53992 )
      ( MAKE-4PILE ?auto_53987 ?auto_53988 ?auto_53989 ?auto_53990 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53994 - BLOCK
      ?auto_53995 - BLOCK
      ?auto_53996 - BLOCK
      ?auto_53997 - BLOCK
    )
    :vars
    (
      ?auto_53999 - BLOCK
      ?auto_54000 - BLOCK
      ?auto_53998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53999 ?auto_53997 ) ( ON-TABLE ?auto_53994 ) ( ON ?auto_53995 ?auto_53994 ) ( ON ?auto_53996 ?auto_53995 ) ( ON ?auto_53997 ?auto_53996 ) ( not ( = ?auto_53994 ?auto_53995 ) ) ( not ( = ?auto_53994 ?auto_53996 ) ) ( not ( = ?auto_53994 ?auto_53997 ) ) ( not ( = ?auto_53994 ?auto_53999 ) ) ( not ( = ?auto_53995 ?auto_53996 ) ) ( not ( = ?auto_53995 ?auto_53997 ) ) ( not ( = ?auto_53995 ?auto_53999 ) ) ( not ( = ?auto_53996 ?auto_53997 ) ) ( not ( = ?auto_53996 ?auto_53999 ) ) ( not ( = ?auto_53997 ?auto_53999 ) ) ( not ( = ?auto_53994 ?auto_54000 ) ) ( not ( = ?auto_53994 ?auto_53998 ) ) ( not ( = ?auto_53995 ?auto_54000 ) ) ( not ( = ?auto_53995 ?auto_53998 ) ) ( not ( = ?auto_53996 ?auto_54000 ) ) ( not ( = ?auto_53996 ?auto_53998 ) ) ( not ( = ?auto_53997 ?auto_54000 ) ) ( not ( = ?auto_53997 ?auto_53998 ) ) ( not ( = ?auto_53999 ?auto_54000 ) ) ( not ( = ?auto_53999 ?auto_53998 ) ) ( not ( = ?auto_54000 ?auto_53998 ) ) ( ON ?auto_54000 ?auto_53999 ) ( CLEAR ?auto_54000 ) ( HOLDING ?auto_53998 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53998 )
      ( MAKE-4PILE ?auto_53994 ?auto_53995 ?auto_53996 ?auto_53997 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54001 - BLOCK
      ?auto_54002 - BLOCK
      ?auto_54003 - BLOCK
      ?auto_54004 - BLOCK
    )
    :vars
    (
      ?auto_54007 - BLOCK
      ?auto_54005 - BLOCK
      ?auto_54006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54007 ?auto_54004 ) ( ON-TABLE ?auto_54001 ) ( ON ?auto_54002 ?auto_54001 ) ( ON ?auto_54003 ?auto_54002 ) ( ON ?auto_54004 ?auto_54003 ) ( not ( = ?auto_54001 ?auto_54002 ) ) ( not ( = ?auto_54001 ?auto_54003 ) ) ( not ( = ?auto_54001 ?auto_54004 ) ) ( not ( = ?auto_54001 ?auto_54007 ) ) ( not ( = ?auto_54002 ?auto_54003 ) ) ( not ( = ?auto_54002 ?auto_54004 ) ) ( not ( = ?auto_54002 ?auto_54007 ) ) ( not ( = ?auto_54003 ?auto_54004 ) ) ( not ( = ?auto_54003 ?auto_54007 ) ) ( not ( = ?auto_54004 ?auto_54007 ) ) ( not ( = ?auto_54001 ?auto_54005 ) ) ( not ( = ?auto_54001 ?auto_54006 ) ) ( not ( = ?auto_54002 ?auto_54005 ) ) ( not ( = ?auto_54002 ?auto_54006 ) ) ( not ( = ?auto_54003 ?auto_54005 ) ) ( not ( = ?auto_54003 ?auto_54006 ) ) ( not ( = ?auto_54004 ?auto_54005 ) ) ( not ( = ?auto_54004 ?auto_54006 ) ) ( not ( = ?auto_54007 ?auto_54005 ) ) ( not ( = ?auto_54007 ?auto_54006 ) ) ( not ( = ?auto_54005 ?auto_54006 ) ) ( ON ?auto_54005 ?auto_54007 ) ( ON ?auto_54006 ?auto_54005 ) ( CLEAR ?auto_54006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54001 ?auto_54002 ?auto_54003 ?auto_54004 ?auto_54007 ?auto_54005 )
      ( MAKE-4PILE ?auto_54001 ?auto_54002 ?auto_54003 ?auto_54004 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54011 - BLOCK
      ?auto_54012 - BLOCK
      ?auto_54013 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_54013 ) ( CLEAR ?auto_54012 ) ( ON-TABLE ?auto_54011 ) ( ON ?auto_54012 ?auto_54011 ) ( not ( = ?auto_54011 ?auto_54012 ) ) ( not ( = ?auto_54011 ?auto_54013 ) ) ( not ( = ?auto_54012 ?auto_54013 ) ) )
    :subtasks
    ( ( !STACK ?auto_54013 ?auto_54012 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54014 - BLOCK
      ?auto_54015 - BLOCK
      ?auto_54016 - BLOCK
    )
    :vars
    (
      ?auto_54017 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54015 ) ( ON-TABLE ?auto_54014 ) ( ON ?auto_54015 ?auto_54014 ) ( not ( = ?auto_54014 ?auto_54015 ) ) ( not ( = ?auto_54014 ?auto_54016 ) ) ( not ( = ?auto_54015 ?auto_54016 ) ) ( ON ?auto_54016 ?auto_54017 ) ( CLEAR ?auto_54016 ) ( HAND-EMPTY ) ( not ( = ?auto_54014 ?auto_54017 ) ) ( not ( = ?auto_54015 ?auto_54017 ) ) ( not ( = ?auto_54016 ?auto_54017 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54016 ?auto_54017 )
      ( MAKE-3PILE ?auto_54014 ?auto_54015 ?auto_54016 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54018 - BLOCK
      ?auto_54019 - BLOCK
      ?auto_54020 - BLOCK
    )
    :vars
    (
      ?auto_54021 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54018 ) ( not ( = ?auto_54018 ?auto_54019 ) ) ( not ( = ?auto_54018 ?auto_54020 ) ) ( not ( = ?auto_54019 ?auto_54020 ) ) ( ON ?auto_54020 ?auto_54021 ) ( CLEAR ?auto_54020 ) ( not ( = ?auto_54018 ?auto_54021 ) ) ( not ( = ?auto_54019 ?auto_54021 ) ) ( not ( = ?auto_54020 ?auto_54021 ) ) ( HOLDING ?auto_54019 ) ( CLEAR ?auto_54018 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54018 ?auto_54019 )
      ( MAKE-3PILE ?auto_54018 ?auto_54019 ?auto_54020 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54022 - BLOCK
      ?auto_54023 - BLOCK
      ?auto_54024 - BLOCK
    )
    :vars
    (
      ?auto_54025 - BLOCK
      ?auto_54028 - BLOCK
      ?auto_54027 - BLOCK
      ?auto_54026 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54022 ) ( not ( = ?auto_54022 ?auto_54023 ) ) ( not ( = ?auto_54022 ?auto_54024 ) ) ( not ( = ?auto_54023 ?auto_54024 ) ) ( ON ?auto_54024 ?auto_54025 ) ( not ( = ?auto_54022 ?auto_54025 ) ) ( not ( = ?auto_54023 ?auto_54025 ) ) ( not ( = ?auto_54024 ?auto_54025 ) ) ( CLEAR ?auto_54022 ) ( ON ?auto_54023 ?auto_54024 ) ( CLEAR ?auto_54023 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54028 ) ( ON ?auto_54027 ?auto_54028 ) ( ON ?auto_54026 ?auto_54027 ) ( ON ?auto_54025 ?auto_54026 ) ( not ( = ?auto_54028 ?auto_54027 ) ) ( not ( = ?auto_54028 ?auto_54026 ) ) ( not ( = ?auto_54028 ?auto_54025 ) ) ( not ( = ?auto_54028 ?auto_54024 ) ) ( not ( = ?auto_54028 ?auto_54023 ) ) ( not ( = ?auto_54027 ?auto_54026 ) ) ( not ( = ?auto_54027 ?auto_54025 ) ) ( not ( = ?auto_54027 ?auto_54024 ) ) ( not ( = ?auto_54027 ?auto_54023 ) ) ( not ( = ?auto_54026 ?auto_54025 ) ) ( not ( = ?auto_54026 ?auto_54024 ) ) ( not ( = ?auto_54026 ?auto_54023 ) ) ( not ( = ?auto_54022 ?auto_54028 ) ) ( not ( = ?auto_54022 ?auto_54027 ) ) ( not ( = ?auto_54022 ?auto_54026 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54028 ?auto_54027 ?auto_54026 ?auto_54025 ?auto_54024 )
      ( MAKE-3PILE ?auto_54022 ?auto_54023 ?auto_54024 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54029 - BLOCK
      ?auto_54030 - BLOCK
      ?auto_54031 - BLOCK
    )
    :vars
    (
      ?auto_54034 - BLOCK
      ?auto_54035 - BLOCK
      ?auto_54032 - BLOCK
      ?auto_54033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54029 ?auto_54030 ) ) ( not ( = ?auto_54029 ?auto_54031 ) ) ( not ( = ?auto_54030 ?auto_54031 ) ) ( ON ?auto_54031 ?auto_54034 ) ( not ( = ?auto_54029 ?auto_54034 ) ) ( not ( = ?auto_54030 ?auto_54034 ) ) ( not ( = ?auto_54031 ?auto_54034 ) ) ( ON ?auto_54030 ?auto_54031 ) ( CLEAR ?auto_54030 ) ( ON-TABLE ?auto_54035 ) ( ON ?auto_54032 ?auto_54035 ) ( ON ?auto_54033 ?auto_54032 ) ( ON ?auto_54034 ?auto_54033 ) ( not ( = ?auto_54035 ?auto_54032 ) ) ( not ( = ?auto_54035 ?auto_54033 ) ) ( not ( = ?auto_54035 ?auto_54034 ) ) ( not ( = ?auto_54035 ?auto_54031 ) ) ( not ( = ?auto_54035 ?auto_54030 ) ) ( not ( = ?auto_54032 ?auto_54033 ) ) ( not ( = ?auto_54032 ?auto_54034 ) ) ( not ( = ?auto_54032 ?auto_54031 ) ) ( not ( = ?auto_54032 ?auto_54030 ) ) ( not ( = ?auto_54033 ?auto_54034 ) ) ( not ( = ?auto_54033 ?auto_54031 ) ) ( not ( = ?auto_54033 ?auto_54030 ) ) ( not ( = ?auto_54029 ?auto_54035 ) ) ( not ( = ?auto_54029 ?auto_54032 ) ) ( not ( = ?auto_54029 ?auto_54033 ) ) ( HOLDING ?auto_54029 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54029 )
      ( MAKE-3PILE ?auto_54029 ?auto_54030 ?auto_54031 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54036 - BLOCK
      ?auto_54037 - BLOCK
      ?auto_54038 - BLOCK
    )
    :vars
    (
      ?auto_54040 - BLOCK
      ?auto_54039 - BLOCK
      ?auto_54041 - BLOCK
      ?auto_54042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54036 ?auto_54037 ) ) ( not ( = ?auto_54036 ?auto_54038 ) ) ( not ( = ?auto_54037 ?auto_54038 ) ) ( ON ?auto_54038 ?auto_54040 ) ( not ( = ?auto_54036 ?auto_54040 ) ) ( not ( = ?auto_54037 ?auto_54040 ) ) ( not ( = ?auto_54038 ?auto_54040 ) ) ( ON ?auto_54037 ?auto_54038 ) ( ON-TABLE ?auto_54039 ) ( ON ?auto_54041 ?auto_54039 ) ( ON ?auto_54042 ?auto_54041 ) ( ON ?auto_54040 ?auto_54042 ) ( not ( = ?auto_54039 ?auto_54041 ) ) ( not ( = ?auto_54039 ?auto_54042 ) ) ( not ( = ?auto_54039 ?auto_54040 ) ) ( not ( = ?auto_54039 ?auto_54038 ) ) ( not ( = ?auto_54039 ?auto_54037 ) ) ( not ( = ?auto_54041 ?auto_54042 ) ) ( not ( = ?auto_54041 ?auto_54040 ) ) ( not ( = ?auto_54041 ?auto_54038 ) ) ( not ( = ?auto_54041 ?auto_54037 ) ) ( not ( = ?auto_54042 ?auto_54040 ) ) ( not ( = ?auto_54042 ?auto_54038 ) ) ( not ( = ?auto_54042 ?auto_54037 ) ) ( not ( = ?auto_54036 ?auto_54039 ) ) ( not ( = ?auto_54036 ?auto_54041 ) ) ( not ( = ?auto_54036 ?auto_54042 ) ) ( ON ?auto_54036 ?auto_54037 ) ( CLEAR ?auto_54036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54039 ?auto_54041 ?auto_54042 ?auto_54040 ?auto_54038 ?auto_54037 )
      ( MAKE-3PILE ?auto_54036 ?auto_54037 ?auto_54038 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54046 - BLOCK
      ?auto_54047 - BLOCK
      ?auto_54048 - BLOCK
    )
    :vars
    (
      ?auto_54049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54049 ?auto_54048 ) ( CLEAR ?auto_54049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54046 ) ( ON ?auto_54047 ?auto_54046 ) ( ON ?auto_54048 ?auto_54047 ) ( not ( = ?auto_54046 ?auto_54047 ) ) ( not ( = ?auto_54046 ?auto_54048 ) ) ( not ( = ?auto_54046 ?auto_54049 ) ) ( not ( = ?auto_54047 ?auto_54048 ) ) ( not ( = ?auto_54047 ?auto_54049 ) ) ( not ( = ?auto_54048 ?auto_54049 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54049 ?auto_54048 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54050 - BLOCK
      ?auto_54051 - BLOCK
      ?auto_54052 - BLOCK
    )
    :vars
    (
      ?auto_54053 - BLOCK
      ?auto_54054 - BLOCK
      ?auto_54055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54053 ?auto_54052 ) ( CLEAR ?auto_54053 ) ( ON-TABLE ?auto_54050 ) ( ON ?auto_54051 ?auto_54050 ) ( ON ?auto_54052 ?auto_54051 ) ( not ( = ?auto_54050 ?auto_54051 ) ) ( not ( = ?auto_54050 ?auto_54052 ) ) ( not ( = ?auto_54050 ?auto_54053 ) ) ( not ( = ?auto_54051 ?auto_54052 ) ) ( not ( = ?auto_54051 ?auto_54053 ) ) ( not ( = ?auto_54052 ?auto_54053 ) ) ( HOLDING ?auto_54054 ) ( CLEAR ?auto_54055 ) ( not ( = ?auto_54050 ?auto_54054 ) ) ( not ( = ?auto_54050 ?auto_54055 ) ) ( not ( = ?auto_54051 ?auto_54054 ) ) ( not ( = ?auto_54051 ?auto_54055 ) ) ( not ( = ?auto_54052 ?auto_54054 ) ) ( not ( = ?auto_54052 ?auto_54055 ) ) ( not ( = ?auto_54053 ?auto_54054 ) ) ( not ( = ?auto_54053 ?auto_54055 ) ) ( not ( = ?auto_54054 ?auto_54055 ) ) )
    :subtasks
    ( ( !STACK ?auto_54054 ?auto_54055 )
      ( MAKE-3PILE ?auto_54050 ?auto_54051 ?auto_54052 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54056 - BLOCK
      ?auto_54057 - BLOCK
      ?auto_54058 - BLOCK
    )
    :vars
    (
      ?auto_54061 - BLOCK
      ?auto_54059 - BLOCK
      ?auto_54060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54061 ?auto_54058 ) ( ON-TABLE ?auto_54056 ) ( ON ?auto_54057 ?auto_54056 ) ( ON ?auto_54058 ?auto_54057 ) ( not ( = ?auto_54056 ?auto_54057 ) ) ( not ( = ?auto_54056 ?auto_54058 ) ) ( not ( = ?auto_54056 ?auto_54061 ) ) ( not ( = ?auto_54057 ?auto_54058 ) ) ( not ( = ?auto_54057 ?auto_54061 ) ) ( not ( = ?auto_54058 ?auto_54061 ) ) ( CLEAR ?auto_54059 ) ( not ( = ?auto_54056 ?auto_54060 ) ) ( not ( = ?auto_54056 ?auto_54059 ) ) ( not ( = ?auto_54057 ?auto_54060 ) ) ( not ( = ?auto_54057 ?auto_54059 ) ) ( not ( = ?auto_54058 ?auto_54060 ) ) ( not ( = ?auto_54058 ?auto_54059 ) ) ( not ( = ?auto_54061 ?auto_54060 ) ) ( not ( = ?auto_54061 ?auto_54059 ) ) ( not ( = ?auto_54060 ?auto_54059 ) ) ( ON ?auto_54060 ?auto_54061 ) ( CLEAR ?auto_54060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54056 ?auto_54057 ?auto_54058 ?auto_54061 )
      ( MAKE-3PILE ?auto_54056 ?auto_54057 ?auto_54058 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54062 - BLOCK
      ?auto_54063 - BLOCK
      ?auto_54064 - BLOCK
    )
    :vars
    (
      ?auto_54066 - BLOCK
      ?auto_54065 - BLOCK
      ?auto_54067 - BLOCK
      ?auto_54068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54066 ?auto_54064 ) ( ON-TABLE ?auto_54062 ) ( ON ?auto_54063 ?auto_54062 ) ( ON ?auto_54064 ?auto_54063 ) ( not ( = ?auto_54062 ?auto_54063 ) ) ( not ( = ?auto_54062 ?auto_54064 ) ) ( not ( = ?auto_54062 ?auto_54066 ) ) ( not ( = ?auto_54063 ?auto_54064 ) ) ( not ( = ?auto_54063 ?auto_54066 ) ) ( not ( = ?auto_54064 ?auto_54066 ) ) ( not ( = ?auto_54062 ?auto_54065 ) ) ( not ( = ?auto_54062 ?auto_54067 ) ) ( not ( = ?auto_54063 ?auto_54065 ) ) ( not ( = ?auto_54063 ?auto_54067 ) ) ( not ( = ?auto_54064 ?auto_54065 ) ) ( not ( = ?auto_54064 ?auto_54067 ) ) ( not ( = ?auto_54066 ?auto_54065 ) ) ( not ( = ?auto_54066 ?auto_54067 ) ) ( not ( = ?auto_54065 ?auto_54067 ) ) ( ON ?auto_54065 ?auto_54066 ) ( CLEAR ?auto_54065 ) ( HOLDING ?auto_54067 ) ( CLEAR ?auto_54068 ) ( ON-TABLE ?auto_54068 ) ( not ( = ?auto_54068 ?auto_54067 ) ) ( not ( = ?auto_54062 ?auto_54068 ) ) ( not ( = ?auto_54063 ?auto_54068 ) ) ( not ( = ?auto_54064 ?auto_54068 ) ) ( not ( = ?auto_54066 ?auto_54068 ) ) ( not ( = ?auto_54065 ?auto_54068 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54068 ?auto_54067 )
      ( MAKE-3PILE ?auto_54062 ?auto_54063 ?auto_54064 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54069 - BLOCK
      ?auto_54070 - BLOCK
      ?auto_54071 - BLOCK
    )
    :vars
    (
      ?auto_54073 - BLOCK
      ?auto_54074 - BLOCK
      ?auto_54075 - BLOCK
      ?auto_54072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54073 ?auto_54071 ) ( ON-TABLE ?auto_54069 ) ( ON ?auto_54070 ?auto_54069 ) ( ON ?auto_54071 ?auto_54070 ) ( not ( = ?auto_54069 ?auto_54070 ) ) ( not ( = ?auto_54069 ?auto_54071 ) ) ( not ( = ?auto_54069 ?auto_54073 ) ) ( not ( = ?auto_54070 ?auto_54071 ) ) ( not ( = ?auto_54070 ?auto_54073 ) ) ( not ( = ?auto_54071 ?auto_54073 ) ) ( not ( = ?auto_54069 ?auto_54074 ) ) ( not ( = ?auto_54069 ?auto_54075 ) ) ( not ( = ?auto_54070 ?auto_54074 ) ) ( not ( = ?auto_54070 ?auto_54075 ) ) ( not ( = ?auto_54071 ?auto_54074 ) ) ( not ( = ?auto_54071 ?auto_54075 ) ) ( not ( = ?auto_54073 ?auto_54074 ) ) ( not ( = ?auto_54073 ?auto_54075 ) ) ( not ( = ?auto_54074 ?auto_54075 ) ) ( ON ?auto_54074 ?auto_54073 ) ( CLEAR ?auto_54072 ) ( ON-TABLE ?auto_54072 ) ( not ( = ?auto_54072 ?auto_54075 ) ) ( not ( = ?auto_54069 ?auto_54072 ) ) ( not ( = ?auto_54070 ?auto_54072 ) ) ( not ( = ?auto_54071 ?auto_54072 ) ) ( not ( = ?auto_54073 ?auto_54072 ) ) ( not ( = ?auto_54074 ?auto_54072 ) ) ( ON ?auto_54075 ?auto_54074 ) ( CLEAR ?auto_54075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54069 ?auto_54070 ?auto_54071 ?auto_54073 ?auto_54074 )
      ( MAKE-3PILE ?auto_54069 ?auto_54070 ?auto_54071 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54076 - BLOCK
      ?auto_54077 - BLOCK
      ?auto_54078 - BLOCK
    )
    :vars
    (
      ?auto_54081 - BLOCK
      ?auto_54080 - BLOCK
      ?auto_54079 - BLOCK
      ?auto_54082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54081 ?auto_54078 ) ( ON-TABLE ?auto_54076 ) ( ON ?auto_54077 ?auto_54076 ) ( ON ?auto_54078 ?auto_54077 ) ( not ( = ?auto_54076 ?auto_54077 ) ) ( not ( = ?auto_54076 ?auto_54078 ) ) ( not ( = ?auto_54076 ?auto_54081 ) ) ( not ( = ?auto_54077 ?auto_54078 ) ) ( not ( = ?auto_54077 ?auto_54081 ) ) ( not ( = ?auto_54078 ?auto_54081 ) ) ( not ( = ?auto_54076 ?auto_54080 ) ) ( not ( = ?auto_54076 ?auto_54079 ) ) ( not ( = ?auto_54077 ?auto_54080 ) ) ( not ( = ?auto_54077 ?auto_54079 ) ) ( not ( = ?auto_54078 ?auto_54080 ) ) ( not ( = ?auto_54078 ?auto_54079 ) ) ( not ( = ?auto_54081 ?auto_54080 ) ) ( not ( = ?auto_54081 ?auto_54079 ) ) ( not ( = ?auto_54080 ?auto_54079 ) ) ( ON ?auto_54080 ?auto_54081 ) ( not ( = ?auto_54082 ?auto_54079 ) ) ( not ( = ?auto_54076 ?auto_54082 ) ) ( not ( = ?auto_54077 ?auto_54082 ) ) ( not ( = ?auto_54078 ?auto_54082 ) ) ( not ( = ?auto_54081 ?auto_54082 ) ) ( not ( = ?auto_54080 ?auto_54082 ) ) ( ON ?auto_54079 ?auto_54080 ) ( CLEAR ?auto_54079 ) ( HOLDING ?auto_54082 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54082 )
      ( MAKE-3PILE ?auto_54076 ?auto_54077 ?auto_54078 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54083 - BLOCK
      ?auto_54084 - BLOCK
      ?auto_54085 - BLOCK
    )
    :vars
    (
      ?auto_54088 - BLOCK
      ?auto_54086 - BLOCK
      ?auto_54087 - BLOCK
      ?auto_54089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54088 ?auto_54085 ) ( ON-TABLE ?auto_54083 ) ( ON ?auto_54084 ?auto_54083 ) ( ON ?auto_54085 ?auto_54084 ) ( not ( = ?auto_54083 ?auto_54084 ) ) ( not ( = ?auto_54083 ?auto_54085 ) ) ( not ( = ?auto_54083 ?auto_54088 ) ) ( not ( = ?auto_54084 ?auto_54085 ) ) ( not ( = ?auto_54084 ?auto_54088 ) ) ( not ( = ?auto_54085 ?auto_54088 ) ) ( not ( = ?auto_54083 ?auto_54086 ) ) ( not ( = ?auto_54083 ?auto_54087 ) ) ( not ( = ?auto_54084 ?auto_54086 ) ) ( not ( = ?auto_54084 ?auto_54087 ) ) ( not ( = ?auto_54085 ?auto_54086 ) ) ( not ( = ?auto_54085 ?auto_54087 ) ) ( not ( = ?auto_54088 ?auto_54086 ) ) ( not ( = ?auto_54088 ?auto_54087 ) ) ( not ( = ?auto_54086 ?auto_54087 ) ) ( ON ?auto_54086 ?auto_54088 ) ( not ( = ?auto_54089 ?auto_54087 ) ) ( not ( = ?auto_54083 ?auto_54089 ) ) ( not ( = ?auto_54084 ?auto_54089 ) ) ( not ( = ?auto_54085 ?auto_54089 ) ) ( not ( = ?auto_54088 ?auto_54089 ) ) ( not ( = ?auto_54086 ?auto_54089 ) ) ( ON ?auto_54087 ?auto_54086 ) ( ON ?auto_54089 ?auto_54087 ) ( CLEAR ?auto_54089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54083 ?auto_54084 ?auto_54085 ?auto_54088 ?auto_54086 ?auto_54087 )
      ( MAKE-3PILE ?auto_54083 ?auto_54084 ?auto_54085 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54094 - BLOCK
      ?auto_54095 - BLOCK
      ?auto_54096 - BLOCK
      ?auto_54097 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_54097 ) ( CLEAR ?auto_54096 ) ( ON-TABLE ?auto_54094 ) ( ON ?auto_54095 ?auto_54094 ) ( ON ?auto_54096 ?auto_54095 ) ( not ( = ?auto_54094 ?auto_54095 ) ) ( not ( = ?auto_54094 ?auto_54096 ) ) ( not ( = ?auto_54094 ?auto_54097 ) ) ( not ( = ?auto_54095 ?auto_54096 ) ) ( not ( = ?auto_54095 ?auto_54097 ) ) ( not ( = ?auto_54096 ?auto_54097 ) ) )
    :subtasks
    ( ( !STACK ?auto_54097 ?auto_54096 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54098 - BLOCK
      ?auto_54099 - BLOCK
      ?auto_54100 - BLOCK
      ?auto_54101 - BLOCK
    )
    :vars
    (
      ?auto_54102 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54100 ) ( ON-TABLE ?auto_54098 ) ( ON ?auto_54099 ?auto_54098 ) ( ON ?auto_54100 ?auto_54099 ) ( not ( = ?auto_54098 ?auto_54099 ) ) ( not ( = ?auto_54098 ?auto_54100 ) ) ( not ( = ?auto_54098 ?auto_54101 ) ) ( not ( = ?auto_54099 ?auto_54100 ) ) ( not ( = ?auto_54099 ?auto_54101 ) ) ( not ( = ?auto_54100 ?auto_54101 ) ) ( ON ?auto_54101 ?auto_54102 ) ( CLEAR ?auto_54101 ) ( HAND-EMPTY ) ( not ( = ?auto_54098 ?auto_54102 ) ) ( not ( = ?auto_54099 ?auto_54102 ) ) ( not ( = ?auto_54100 ?auto_54102 ) ) ( not ( = ?auto_54101 ?auto_54102 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54101 ?auto_54102 )
      ( MAKE-4PILE ?auto_54098 ?auto_54099 ?auto_54100 ?auto_54101 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54103 - BLOCK
      ?auto_54104 - BLOCK
      ?auto_54105 - BLOCK
      ?auto_54106 - BLOCK
    )
    :vars
    (
      ?auto_54107 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54103 ) ( ON ?auto_54104 ?auto_54103 ) ( not ( = ?auto_54103 ?auto_54104 ) ) ( not ( = ?auto_54103 ?auto_54105 ) ) ( not ( = ?auto_54103 ?auto_54106 ) ) ( not ( = ?auto_54104 ?auto_54105 ) ) ( not ( = ?auto_54104 ?auto_54106 ) ) ( not ( = ?auto_54105 ?auto_54106 ) ) ( ON ?auto_54106 ?auto_54107 ) ( CLEAR ?auto_54106 ) ( not ( = ?auto_54103 ?auto_54107 ) ) ( not ( = ?auto_54104 ?auto_54107 ) ) ( not ( = ?auto_54105 ?auto_54107 ) ) ( not ( = ?auto_54106 ?auto_54107 ) ) ( HOLDING ?auto_54105 ) ( CLEAR ?auto_54104 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54103 ?auto_54104 ?auto_54105 )
      ( MAKE-4PILE ?auto_54103 ?auto_54104 ?auto_54105 ?auto_54106 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54108 - BLOCK
      ?auto_54109 - BLOCK
      ?auto_54110 - BLOCK
      ?auto_54111 - BLOCK
    )
    :vars
    (
      ?auto_54112 - BLOCK
      ?auto_54113 - BLOCK
      ?auto_54114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54108 ) ( ON ?auto_54109 ?auto_54108 ) ( not ( = ?auto_54108 ?auto_54109 ) ) ( not ( = ?auto_54108 ?auto_54110 ) ) ( not ( = ?auto_54108 ?auto_54111 ) ) ( not ( = ?auto_54109 ?auto_54110 ) ) ( not ( = ?auto_54109 ?auto_54111 ) ) ( not ( = ?auto_54110 ?auto_54111 ) ) ( ON ?auto_54111 ?auto_54112 ) ( not ( = ?auto_54108 ?auto_54112 ) ) ( not ( = ?auto_54109 ?auto_54112 ) ) ( not ( = ?auto_54110 ?auto_54112 ) ) ( not ( = ?auto_54111 ?auto_54112 ) ) ( CLEAR ?auto_54109 ) ( ON ?auto_54110 ?auto_54111 ) ( CLEAR ?auto_54110 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54113 ) ( ON ?auto_54114 ?auto_54113 ) ( ON ?auto_54112 ?auto_54114 ) ( not ( = ?auto_54113 ?auto_54114 ) ) ( not ( = ?auto_54113 ?auto_54112 ) ) ( not ( = ?auto_54113 ?auto_54111 ) ) ( not ( = ?auto_54113 ?auto_54110 ) ) ( not ( = ?auto_54114 ?auto_54112 ) ) ( not ( = ?auto_54114 ?auto_54111 ) ) ( not ( = ?auto_54114 ?auto_54110 ) ) ( not ( = ?auto_54108 ?auto_54113 ) ) ( not ( = ?auto_54108 ?auto_54114 ) ) ( not ( = ?auto_54109 ?auto_54113 ) ) ( not ( = ?auto_54109 ?auto_54114 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54113 ?auto_54114 ?auto_54112 ?auto_54111 )
      ( MAKE-4PILE ?auto_54108 ?auto_54109 ?auto_54110 ?auto_54111 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54115 - BLOCK
      ?auto_54116 - BLOCK
      ?auto_54117 - BLOCK
      ?auto_54118 - BLOCK
    )
    :vars
    (
      ?auto_54121 - BLOCK
      ?auto_54119 - BLOCK
      ?auto_54120 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54115 ) ( not ( = ?auto_54115 ?auto_54116 ) ) ( not ( = ?auto_54115 ?auto_54117 ) ) ( not ( = ?auto_54115 ?auto_54118 ) ) ( not ( = ?auto_54116 ?auto_54117 ) ) ( not ( = ?auto_54116 ?auto_54118 ) ) ( not ( = ?auto_54117 ?auto_54118 ) ) ( ON ?auto_54118 ?auto_54121 ) ( not ( = ?auto_54115 ?auto_54121 ) ) ( not ( = ?auto_54116 ?auto_54121 ) ) ( not ( = ?auto_54117 ?auto_54121 ) ) ( not ( = ?auto_54118 ?auto_54121 ) ) ( ON ?auto_54117 ?auto_54118 ) ( CLEAR ?auto_54117 ) ( ON-TABLE ?auto_54119 ) ( ON ?auto_54120 ?auto_54119 ) ( ON ?auto_54121 ?auto_54120 ) ( not ( = ?auto_54119 ?auto_54120 ) ) ( not ( = ?auto_54119 ?auto_54121 ) ) ( not ( = ?auto_54119 ?auto_54118 ) ) ( not ( = ?auto_54119 ?auto_54117 ) ) ( not ( = ?auto_54120 ?auto_54121 ) ) ( not ( = ?auto_54120 ?auto_54118 ) ) ( not ( = ?auto_54120 ?auto_54117 ) ) ( not ( = ?auto_54115 ?auto_54119 ) ) ( not ( = ?auto_54115 ?auto_54120 ) ) ( not ( = ?auto_54116 ?auto_54119 ) ) ( not ( = ?auto_54116 ?auto_54120 ) ) ( HOLDING ?auto_54116 ) ( CLEAR ?auto_54115 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54115 ?auto_54116 )
      ( MAKE-4PILE ?auto_54115 ?auto_54116 ?auto_54117 ?auto_54118 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54122 - BLOCK
      ?auto_54123 - BLOCK
      ?auto_54124 - BLOCK
      ?auto_54125 - BLOCK
    )
    :vars
    (
      ?auto_54127 - BLOCK
      ?auto_54128 - BLOCK
      ?auto_54126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54122 ) ( not ( = ?auto_54122 ?auto_54123 ) ) ( not ( = ?auto_54122 ?auto_54124 ) ) ( not ( = ?auto_54122 ?auto_54125 ) ) ( not ( = ?auto_54123 ?auto_54124 ) ) ( not ( = ?auto_54123 ?auto_54125 ) ) ( not ( = ?auto_54124 ?auto_54125 ) ) ( ON ?auto_54125 ?auto_54127 ) ( not ( = ?auto_54122 ?auto_54127 ) ) ( not ( = ?auto_54123 ?auto_54127 ) ) ( not ( = ?auto_54124 ?auto_54127 ) ) ( not ( = ?auto_54125 ?auto_54127 ) ) ( ON ?auto_54124 ?auto_54125 ) ( ON-TABLE ?auto_54128 ) ( ON ?auto_54126 ?auto_54128 ) ( ON ?auto_54127 ?auto_54126 ) ( not ( = ?auto_54128 ?auto_54126 ) ) ( not ( = ?auto_54128 ?auto_54127 ) ) ( not ( = ?auto_54128 ?auto_54125 ) ) ( not ( = ?auto_54128 ?auto_54124 ) ) ( not ( = ?auto_54126 ?auto_54127 ) ) ( not ( = ?auto_54126 ?auto_54125 ) ) ( not ( = ?auto_54126 ?auto_54124 ) ) ( not ( = ?auto_54122 ?auto_54128 ) ) ( not ( = ?auto_54122 ?auto_54126 ) ) ( not ( = ?auto_54123 ?auto_54128 ) ) ( not ( = ?auto_54123 ?auto_54126 ) ) ( CLEAR ?auto_54122 ) ( ON ?auto_54123 ?auto_54124 ) ( CLEAR ?auto_54123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54128 ?auto_54126 ?auto_54127 ?auto_54125 ?auto_54124 )
      ( MAKE-4PILE ?auto_54122 ?auto_54123 ?auto_54124 ?auto_54125 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54129 - BLOCK
      ?auto_54130 - BLOCK
      ?auto_54131 - BLOCK
      ?auto_54132 - BLOCK
    )
    :vars
    (
      ?auto_54133 - BLOCK
      ?auto_54135 - BLOCK
      ?auto_54134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54129 ?auto_54130 ) ) ( not ( = ?auto_54129 ?auto_54131 ) ) ( not ( = ?auto_54129 ?auto_54132 ) ) ( not ( = ?auto_54130 ?auto_54131 ) ) ( not ( = ?auto_54130 ?auto_54132 ) ) ( not ( = ?auto_54131 ?auto_54132 ) ) ( ON ?auto_54132 ?auto_54133 ) ( not ( = ?auto_54129 ?auto_54133 ) ) ( not ( = ?auto_54130 ?auto_54133 ) ) ( not ( = ?auto_54131 ?auto_54133 ) ) ( not ( = ?auto_54132 ?auto_54133 ) ) ( ON ?auto_54131 ?auto_54132 ) ( ON-TABLE ?auto_54135 ) ( ON ?auto_54134 ?auto_54135 ) ( ON ?auto_54133 ?auto_54134 ) ( not ( = ?auto_54135 ?auto_54134 ) ) ( not ( = ?auto_54135 ?auto_54133 ) ) ( not ( = ?auto_54135 ?auto_54132 ) ) ( not ( = ?auto_54135 ?auto_54131 ) ) ( not ( = ?auto_54134 ?auto_54133 ) ) ( not ( = ?auto_54134 ?auto_54132 ) ) ( not ( = ?auto_54134 ?auto_54131 ) ) ( not ( = ?auto_54129 ?auto_54135 ) ) ( not ( = ?auto_54129 ?auto_54134 ) ) ( not ( = ?auto_54130 ?auto_54135 ) ) ( not ( = ?auto_54130 ?auto_54134 ) ) ( ON ?auto_54130 ?auto_54131 ) ( CLEAR ?auto_54130 ) ( HOLDING ?auto_54129 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54129 )
      ( MAKE-4PILE ?auto_54129 ?auto_54130 ?auto_54131 ?auto_54132 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54136 - BLOCK
      ?auto_54137 - BLOCK
      ?auto_54138 - BLOCK
      ?auto_54139 - BLOCK
    )
    :vars
    (
      ?auto_54140 - BLOCK
      ?auto_54142 - BLOCK
      ?auto_54141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54136 ?auto_54137 ) ) ( not ( = ?auto_54136 ?auto_54138 ) ) ( not ( = ?auto_54136 ?auto_54139 ) ) ( not ( = ?auto_54137 ?auto_54138 ) ) ( not ( = ?auto_54137 ?auto_54139 ) ) ( not ( = ?auto_54138 ?auto_54139 ) ) ( ON ?auto_54139 ?auto_54140 ) ( not ( = ?auto_54136 ?auto_54140 ) ) ( not ( = ?auto_54137 ?auto_54140 ) ) ( not ( = ?auto_54138 ?auto_54140 ) ) ( not ( = ?auto_54139 ?auto_54140 ) ) ( ON ?auto_54138 ?auto_54139 ) ( ON-TABLE ?auto_54142 ) ( ON ?auto_54141 ?auto_54142 ) ( ON ?auto_54140 ?auto_54141 ) ( not ( = ?auto_54142 ?auto_54141 ) ) ( not ( = ?auto_54142 ?auto_54140 ) ) ( not ( = ?auto_54142 ?auto_54139 ) ) ( not ( = ?auto_54142 ?auto_54138 ) ) ( not ( = ?auto_54141 ?auto_54140 ) ) ( not ( = ?auto_54141 ?auto_54139 ) ) ( not ( = ?auto_54141 ?auto_54138 ) ) ( not ( = ?auto_54136 ?auto_54142 ) ) ( not ( = ?auto_54136 ?auto_54141 ) ) ( not ( = ?auto_54137 ?auto_54142 ) ) ( not ( = ?auto_54137 ?auto_54141 ) ) ( ON ?auto_54137 ?auto_54138 ) ( ON ?auto_54136 ?auto_54137 ) ( CLEAR ?auto_54136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54142 ?auto_54141 ?auto_54140 ?auto_54139 ?auto_54138 ?auto_54137 )
      ( MAKE-4PILE ?auto_54136 ?auto_54137 ?auto_54138 ?auto_54139 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54145 - BLOCK
      ?auto_54146 - BLOCK
    )
    :vars
    (
      ?auto_54147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54147 ?auto_54146 ) ( CLEAR ?auto_54147 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54145 ) ( ON ?auto_54146 ?auto_54145 ) ( not ( = ?auto_54145 ?auto_54146 ) ) ( not ( = ?auto_54145 ?auto_54147 ) ) ( not ( = ?auto_54146 ?auto_54147 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54147 ?auto_54146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54148 - BLOCK
      ?auto_54149 - BLOCK
    )
    :vars
    (
      ?auto_54150 - BLOCK
      ?auto_54151 - BLOCK
      ?auto_54152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54150 ?auto_54149 ) ( CLEAR ?auto_54150 ) ( ON-TABLE ?auto_54148 ) ( ON ?auto_54149 ?auto_54148 ) ( not ( = ?auto_54148 ?auto_54149 ) ) ( not ( = ?auto_54148 ?auto_54150 ) ) ( not ( = ?auto_54149 ?auto_54150 ) ) ( HOLDING ?auto_54151 ) ( CLEAR ?auto_54152 ) ( not ( = ?auto_54148 ?auto_54151 ) ) ( not ( = ?auto_54148 ?auto_54152 ) ) ( not ( = ?auto_54149 ?auto_54151 ) ) ( not ( = ?auto_54149 ?auto_54152 ) ) ( not ( = ?auto_54150 ?auto_54151 ) ) ( not ( = ?auto_54150 ?auto_54152 ) ) ( not ( = ?auto_54151 ?auto_54152 ) ) )
    :subtasks
    ( ( !STACK ?auto_54151 ?auto_54152 )
      ( MAKE-2PILE ?auto_54148 ?auto_54149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54153 - BLOCK
      ?auto_54154 - BLOCK
    )
    :vars
    (
      ?auto_54156 - BLOCK
      ?auto_54157 - BLOCK
      ?auto_54155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54156 ?auto_54154 ) ( ON-TABLE ?auto_54153 ) ( ON ?auto_54154 ?auto_54153 ) ( not ( = ?auto_54153 ?auto_54154 ) ) ( not ( = ?auto_54153 ?auto_54156 ) ) ( not ( = ?auto_54154 ?auto_54156 ) ) ( CLEAR ?auto_54157 ) ( not ( = ?auto_54153 ?auto_54155 ) ) ( not ( = ?auto_54153 ?auto_54157 ) ) ( not ( = ?auto_54154 ?auto_54155 ) ) ( not ( = ?auto_54154 ?auto_54157 ) ) ( not ( = ?auto_54156 ?auto_54155 ) ) ( not ( = ?auto_54156 ?auto_54157 ) ) ( not ( = ?auto_54155 ?auto_54157 ) ) ( ON ?auto_54155 ?auto_54156 ) ( CLEAR ?auto_54155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54153 ?auto_54154 ?auto_54156 )
      ( MAKE-2PILE ?auto_54153 ?auto_54154 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54158 - BLOCK
      ?auto_54159 - BLOCK
    )
    :vars
    (
      ?auto_54162 - BLOCK
      ?auto_54160 - BLOCK
      ?auto_54161 - BLOCK
      ?auto_54164 - BLOCK
      ?auto_54163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54162 ?auto_54159 ) ( ON-TABLE ?auto_54158 ) ( ON ?auto_54159 ?auto_54158 ) ( not ( = ?auto_54158 ?auto_54159 ) ) ( not ( = ?auto_54158 ?auto_54162 ) ) ( not ( = ?auto_54159 ?auto_54162 ) ) ( not ( = ?auto_54158 ?auto_54160 ) ) ( not ( = ?auto_54158 ?auto_54161 ) ) ( not ( = ?auto_54159 ?auto_54160 ) ) ( not ( = ?auto_54159 ?auto_54161 ) ) ( not ( = ?auto_54162 ?auto_54160 ) ) ( not ( = ?auto_54162 ?auto_54161 ) ) ( not ( = ?auto_54160 ?auto_54161 ) ) ( ON ?auto_54160 ?auto_54162 ) ( CLEAR ?auto_54160 ) ( HOLDING ?auto_54161 ) ( CLEAR ?auto_54164 ) ( ON-TABLE ?auto_54163 ) ( ON ?auto_54164 ?auto_54163 ) ( not ( = ?auto_54163 ?auto_54164 ) ) ( not ( = ?auto_54163 ?auto_54161 ) ) ( not ( = ?auto_54164 ?auto_54161 ) ) ( not ( = ?auto_54158 ?auto_54164 ) ) ( not ( = ?auto_54158 ?auto_54163 ) ) ( not ( = ?auto_54159 ?auto_54164 ) ) ( not ( = ?auto_54159 ?auto_54163 ) ) ( not ( = ?auto_54162 ?auto_54164 ) ) ( not ( = ?auto_54162 ?auto_54163 ) ) ( not ( = ?auto_54160 ?auto_54164 ) ) ( not ( = ?auto_54160 ?auto_54163 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54163 ?auto_54164 ?auto_54161 )
      ( MAKE-2PILE ?auto_54158 ?auto_54159 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54165 - BLOCK
      ?auto_54166 - BLOCK
    )
    :vars
    (
      ?auto_54170 - BLOCK
      ?auto_54169 - BLOCK
      ?auto_54171 - BLOCK
      ?auto_54168 - BLOCK
      ?auto_54167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54170 ?auto_54166 ) ( ON-TABLE ?auto_54165 ) ( ON ?auto_54166 ?auto_54165 ) ( not ( = ?auto_54165 ?auto_54166 ) ) ( not ( = ?auto_54165 ?auto_54170 ) ) ( not ( = ?auto_54166 ?auto_54170 ) ) ( not ( = ?auto_54165 ?auto_54169 ) ) ( not ( = ?auto_54165 ?auto_54171 ) ) ( not ( = ?auto_54166 ?auto_54169 ) ) ( not ( = ?auto_54166 ?auto_54171 ) ) ( not ( = ?auto_54170 ?auto_54169 ) ) ( not ( = ?auto_54170 ?auto_54171 ) ) ( not ( = ?auto_54169 ?auto_54171 ) ) ( ON ?auto_54169 ?auto_54170 ) ( CLEAR ?auto_54168 ) ( ON-TABLE ?auto_54167 ) ( ON ?auto_54168 ?auto_54167 ) ( not ( = ?auto_54167 ?auto_54168 ) ) ( not ( = ?auto_54167 ?auto_54171 ) ) ( not ( = ?auto_54168 ?auto_54171 ) ) ( not ( = ?auto_54165 ?auto_54168 ) ) ( not ( = ?auto_54165 ?auto_54167 ) ) ( not ( = ?auto_54166 ?auto_54168 ) ) ( not ( = ?auto_54166 ?auto_54167 ) ) ( not ( = ?auto_54170 ?auto_54168 ) ) ( not ( = ?auto_54170 ?auto_54167 ) ) ( not ( = ?auto_54169 ?auto_54168 ) ) ( not ( = ?auto_54169 ?auto_54167 ) ) ( ON ?auto_54171 ?auto_54169 ) ( CLEAR ?auto_54171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54165 ?auto_54166 ?auto_54170 ?auto_54169 )
      ( MAKE-2PILE ?auto_54165 ?auto_54166 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54172 - BLOCK
      ?auto_54173 - BLOCK
    )
    :vars
    (
      ?auto_54175 - BLOCK
      ?auto_54176 - BLOCK
      ?auto_54178 - BLOCK
      ?auto_54177 - BLOCK
      ?auto_54174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54175 ?auto_54173 ) ( ON-TABLE ?auto_54172 ) ( ON ?auto_54173 ?auto_54172 ) ( not ( = ?auto_54172 ?auto_54173 ) ) ( not ( = ?auto_54172 ?auto_54175 ) ) ( not ( = ?auto_54173 ?auto_54175 ) ) ( not ( = ?auto_54172 ?auto_54176 ) ) ( not ( = ?auto_54172 ?auto_54178 ) ) ( not ( = ?auto_54173 ?auto_54176 ) ) ( not ( = ?auto_54173 ?auto_54178 ) ) ( not ( = ?auto_54175 ?auto_54176 ) ) ( not ( = ?auto_54175 ?auto_54178 ) ) ( not ( = ?auto_54176 ?auto_54178 ) ) ( ON ?auto_54176 ?auto_54175 ) ( ON-TABLE ?auto_54177 ) ( not ( = ?auto_54177 ?auto_54174 ) ) ( not ( = ?auto_54177 ?auto_54178 ) ) ( not ( = ?auto_54174 ?auto_54178 ) ) ( not ( = ?auto_54172 ?auto_54174 ) ) ( not ( = ?auto_54172 ?auto_54177 ) ) ( not ( = ?auto_54173 ?auto_54174 ) ) ( not ( = ?auto_54173 ?auto_54177 ) ) ( not ( = ?auto_54175 ?auto_54174 ) ) ( not ( = ?auto_54175 ?auto_54177 ) ) ( not ( = ?auto_54176 ?auto_54174 ) ) ( not ( = ?auto_54176 ?auto_54177 ) ) ( ON ?auto_54178 ?auto_54176 ) ( CLEAR ?auto_54178 ) ( HOLDING ?auto_54174 ) ( CLEAR ?auto_54177 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54177 ?auto_54174 )
      ( MAKE-2PILE ?auto_54172 ?auto_54173 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54179 - BLOCK
      ?auto_54180 - BLOCK
    )
    :vars
    (
      ?auto_54182 - BLOCK
      ?auto_54181 - BLOCK
      ?auto_54185 - BLOCK
      ?auto_54184 - BLOCK
      ?auto_54183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54182 ?auto_54180 ) ( ON-TABLE ?auto_54179 ) ( ON ?auto_54180 ?auto_54179 ) ( not ( = ?auto_54179 ?auto_54180 ) ) ( not ( = ?auto_54179 ?auto_54182 ) ) ( not ( = ?auto_54180 ?auto_54182 ) ) ( not ( = ?auto_54179 ?auto_54181 ) ) ( not ( = ?auto_54179 ?auto_54185 ) ) ( not ( = ?auto_54180 ?auto_54181 ) ) ( not ( = ?auto_54180 ?auto_54185 ) ) ( not ( = ?auto_54182 ?auto_54181 ) ) ( not ( = ?auto_54182 ?auto_54185 ) ) ( not ( = ?auto_54181 ?auto_54185 ) ) ( ON ?auto_54181 ?auto_54182 ) ( ON-TABLE ?auto_54184 ) ( not ( = ?auto_54184 ?auto_54183 ) ) ( not ( = ?auto_54184 ?auto_54185 ) ) ( not ( = ?auto_54183 ?auto_54185 ) ) ( not ( = ?auto_54179 ?auto_54183 ) ) ( not ( = ?auto_54179 ?auto_54184 ) ) ( not ( = ?auto_54180 ?auto_54183 ) ) ( not ( = ?auto_54180 ?auto_54184 ) ) ( not ( = ?auto_54182 ?auto_54183 ) ) ( not ( = ?auto_54182 ?auto_54184 ) ) ( not ( = ?auto_54181 ?auto_54183 ) ) ( not ( = ?auto_54181 ?auto_54184 ) ) ( ON ?auto_54185 ?auto_54181 ) ( CLEAR ?auto_54184 ) ( ON ?auto_54183 ?auto_54185 ) ( CLEAR ?auto_54183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54179 ?auto_54180 ?auto_54182 ?auto_54181 ?auto_54185 )
      ( MAKE-2PILE ?auto_54179 ?auto_54180 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54186 - BLOCK
      ?auto_54187 - BLOCK
    )
    :vars
    (
      ?auto_54189 - BLOCK
      ?auto_54192 - BLOCK
      ?auto_54188 - BLOCK
      ?auto_54190 - BLOCK
      ?auto_54191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54189 ?auto_54187 ) ( ON-TABLE ?auto_54186 ) ( ON ?auto_54187 ?auto_54186 ) ( not ( = ?auto_54186 ?auto_54187 ) ) ( not ( = ?auto_54186 ?auto_54189 ) ) ( not ( = ?auto_54187 ?auto_54189 ) ) ( not ( = ?auto_54186 ?auto_54192 ) ) ( not ( = ?auto_54186 ?auto_54188 ) ) ( not ( = ?auto_54187 ?auto_54192 ) ) ( not ( = ?auto_54187 ?auto_54188 ) ) ( not ( = ?auto_54189 ?auto_54192 ) ) ( not ( = ?auto_54189 ?auto_54188 ) ) ( not ( = ?auto_54192 ?auto_54188 ) ) ( ON ?auto_54192 ?auto_54189 ) ( not ( = ?auto_54190 ?auto_54191 ) ) ( not ( = ?auto_54190 ?auto_54188 ) ) ( not ( = ?auto_54191 ?auto_54188 ) ) ( not ( = ?auto_54186 ?auto_54191 ) ) ( not ( = ?auto_54186 ?auto_54190 ) ) ( not ( = ?auto_54187 ?auto_54191 ) ) ( not ( = ?auto_54187 ?auto_54190 ) ) ( not ( = ?auto_54189 ?auto_54191 ) ) ( not ( = ?auto_54189 ?auto_54190 ) ) ( not ( = ?auto_54192 ?auto_54191 ) ) ( not ( = ?auto_54192 ?auto_54190 ) ) ( ON ?auto_54188 ?auto_54192 ) ( ON ?auto_54191 ?auto_54188 ) ( CLEAR ?auto_54191 ) ( HOLDING ?auto_54190 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54190 )
      ( MAKE-2PILE ?auto_54186 ?auto_54187 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54193 - BLOCK
      ?auto_54194 - BLOCK
    )
    :vars
    (
      ?auto_54196 - BLOCK
      ?auto_54199 - BLOCK
      ?auto_54198 - BLOCK
      ?auto_54197 - BLOCK
      ?auto_54195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54196 ?auto_54194 ) ( ON-TABLE ?auto_54193 ) ( ON ?auto_54194 ?auto_54193 ) ( not ( = ?auto_54193 ?auto_54194 ) ) ( not ( = ?auto_54193 ?auto_54196 ) ) ( not ( = ?auto_54194 ?auto_54196 ) ) ( not ( = ?auto_54193 ?auto_54199 ) ) ( not ( = ?auto_54193 ?auto_54198 ) ) ( not ( = ?auto_54194 ?auto_54199 ) ) ( not ( = ?auto_54194 ?auto_54198 ) ) ( not ( = ?auto_54196 ?auto_54199 ) ) ( not ( = ?auto_54196 ?auto_54198 ) ) ( not ( = ?auto_54199 ?auto_54198 ) ) ( ON ?auto_54199 ?auto_54196 ) ( not ( = ?auto_54197 ?auto_54195 ) ) ( not ( = ?auto_54197 ?auto_54198 ) ) ( not ( = ?auto_54195 ?auto_54198 ) ) ( not ( = ?auto_54193 ?auto_54195 ) ) ( not ( = ?auto_54193 ?auto_54197 ) ) ( not ( = ?auto_54194 ?auto_54195 ) ) ( not ( = ?auto_54194 ?auto_54197 ) ) ( not ( = ?auto_54196 ?auto_54195 ) ) ( not ( = ?auto_54196 ?auto_54197 ) ) ( not ( = ?auto_54199 ?auto_54195 ) ) ( not ( = ?auto_54199 ?auto_54197 ) ) ( ON ?auto_54198 ?auto_54199 ) ( ON ?auto_54195 ?auto_54198 ) ( ON ?auto_54197 ?auto_54195 ) ( CLEAR ?auto_54197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54193 ?auto_54194 ?auto_54196 ?auto_54199 ?auto_54198 ?auto_54195 )
      ( MAKE-2PILE ?auto_54193 ?auto_54194 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54205 - BLOCK
      ?auto_54206 - BLOCK
      ?auto_54207 - BLOCK
      ?auto_54208 - BLOCK
      ?auto_54209 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_54209 ) ( CLEAR ?auto_54208 ) ( ON-TABLE ?auto_54205 ) ( ON ?auto_54206 ?auto_54205 ) ( ON ?auto_54207 ?auto_54206 ) ( ON ?auto_54208 ?auto_54207 ) ( not ( = ?auto_54205 ?auto_54206 ) ) ( not ( = ?auto_54205 ?auto_54207 ) ) ( not ( = ?auto_54205 ?auto_54208 ) ) ( not ( = ?auto_54205 ?auto_54209 ) ) ( not ( = ?auto_54206 ?auto_54207 ) ) ( not ( = ?auto_54206 ?auto_54208 ) ) ( not ( = ?auto_54206 ?auto_54209 ) ) ( not ( = ?auto_54207 ?auto_54208 ) ) ( not ( = ?auto_54207 ?auto_54209 ) ) ( not ( = ?auto_54208 ?auto_54209 ) ) )
    :subtasks
    ( ( !STACK ?auto_54209 ?auto_54208 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54210 - BLOCK
      ?auto_54211 - BLOCK
      ?auto_54212 - BLOCK
      ?auto_54213 - BLOCK
      ?auto_54214 - BLOCK
    )
    :vars
    (
      ?auto_54215 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54213 ) ( ON-TABLE ?auto_54210 ) ( ON ?auto_54211 ?auto_54210 ) ( ON ?auto_54212 ?auto_54211 ) ( ON ?auto_54213 ?auto_54212 ) ( not ( = ?auto_54210 ?auto_54211 ) ) ( not ( = ?auto_54210 ?auto_54212 ) ) ( not ( = ?auto_54210 ?auto_54213 ) ) ( not ( = ?auto_54210 ?auto_54214 ) ) ( not ( = ?auto_54211 ?auto_54212 ) ) ( not ( = ?auto_54211 ?auto_54213 ) ) ( not ( = ?auto_54211 ?auto_54214 ) ) ( not ( = ?auto_54212 ?auto_54213 ) ) ( not ( = ?auto_54212 ?auto_54214 ) ) ( not ( = ?auto_54213 ?auto_54214 ) ) ( ON ?auto_54214 ?auto_54215 ) ( CLEAR ?auto_54214 ) ( HAND-EMPTY ) ( not ( = ?auto_54210 ?auto_54215 ) ) ( not ( = ?auto_54211 ?auto_54215 ) ) ( not ( = ?auto_54212 ?auto_54215 ) ) ( not ( = ?auto_54213 ?auto_54215 ) ) ( not ( = ?auto_54214 ?auto_54215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54214 ?auto_54215 )
      ( MAKE-5PILE ?auto_54210 ?auto_54211 ?auto_54212 ?auto_54213 ?auto_54214 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54216 - BLOCK
      ?auto_54217 - BLOCK
      ?auto_54218 - BLOCK
      ?auto_54219 - BLOCK
      ?auto_54220 - BLOCK
    )
    :vars
    (
      ?auto_54221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54216 ) ( ON ?auto_54217 ?auto_54216 ) ( ON ?auto_54218 ?auto_54217 ) ( not ( = ?auto_54216 ?auto_54217 ) ) ( not ( = ?auto_54216 ?auto_54218 ) ) ( not ( = ?auto_54216 ?auto_54219 ) ) ( not ( = ?auto_54216 ?auto_54220 ) ) ( not ( = ?auto_54217 ?auto_54218 ) ) ( not ( = ?auto_54217 ?auto_54219 ) ) ( not ( = ?auto_54217 ?auto_54220 ) ) ( not ( = ?auto_54218 ?auto_54219 ) ) ( not ( = ?auto_54218 ?auto_54220 ) ) ( not ( = ?auto_54219 ?auto_54220 ) ) ( ON ?auto_54220 ?auto_54221 ) ( CLEAR ?auto_54220 ) ( not ( = ?auto_54216 ?auto_54221 ) ) ( not ( = ?auto_54217 ?auto_54221 ) ) ( not ( = ?auto_54218 ?auto_54221 ) ) ( not ( = ?auto_54219 ?auto_54221 ) ) ( not ( = ?auto_54220 ?auto_54221 ) ) ( HOLDING ?auto_54219 ) ( CLEAR ?auto_54218 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54216 ?auto_54217 ?auto_54218 ?auto_54219 )
      ( MAKE-5PILE ?auto_54216 ?auto_54217 ?auto_54218 ?auto_54219 ?auto_54220 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54222 - BLOCK
      ?auto_54223 - BLOCK
      ?auto_54224 - BLOCK
      ?auto_54225 - BLOCK
      ?auto_54226 - BLOCK
    )
    :vars
    (
      ?auto_54227 - BLOCK
      ?auto_54228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54222 ) ( ON ?auto_54223 ?auto_54222 ) ( ON ?auto_54224 ?auto_54223 ) ( not ( = ?auto_54222 ?auto_54223 ) ) ( not ( = ?auto_54222 ?auto_54224 ) ) ( not ( = ?auto_54222 ?auto_54225 ) ) ( not ( = ?auto_54222 ?auto_54226 ) ) ( not ( = ?auto_54223 ?auto_54224 ) ) ( not ( = ?auto_54223 ?auto_54225 ) ) ( not ( = ?auto_54223 ?auto_54226 ) ) ( not ( = ?auto_54224 ?auto_54225 ) ) ( not ( = ?auto_54224 ?auto_54226 ) ) ( not ( = ?auto_54225 ?auto_54226 ) ) ( ON ?auto_54226 ?auto_54227 ) ( not ( = ?auto_54222 ?auto_54227 ) ) ( not ( = ?auto_54223 ?auto_54227 ) ) ( not ( = ?auto_54224 ?auto_54227 ) ) ( not ( = ?auto_54225 ?auto_54227 ) ) ( not ( = ?auto_54226 ?auto_54227 ) ) ( CLEAR ?auto_54224 ) ( ON ?auto_54225 ?auto_54226 ) ( CLEAR ?auto_54225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54228 ) ( ON ?auto_54227 ?auto_54228 ) ( not ( = ?auto_54228 ?auto_54227 ) ) ( not ( = ?auto_54228 ?auto_54226 ) ) ( not ( = ?auto_54228 ?auto_54225 ) ) ( not ( = ?auto_54222 ?auto_54228 ) ) ( not ( = ?auto_54223 ?auto_54228 ) ) ( not ( = ?auto_54224 ?auto_54228 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54228 ?auto_54227 ?auto_54226 )
      ( MAKE-5PILE ?auto_54222 ?auto_54223 ?auto_54224 ?auto_54225 ?auto_54226 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54229 - BLOCK
      ?auto_54230 - BLOCK
      ?auto_54231 - BLOCK
      ?auto_54232 - BLOCK
      ?auto_54233 - BLOCK
    )
    :vars
    (
      ?auto_54235 - BLOCK
      ?auto_54234 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54229 ) ( ON ?auto_54230 ?auto_54229 ) ( not ( = ?auto_54229 ?auto_54230 ) ) ( not ( = ?auto_54229 ?auto_54231 ) ) ( not ( = ?auto_54229 ?auto_54232 ) ) ( not ( = ?auto_54229 ?auto_54233 ) ) ( not ( = ?auto_54230 ?auto_54231 ) ) ( not ( = ?auto_54230 ?auto_54232 ) ) ( not ( = ?auto_54230 ?auto_54233 ) ) ( not ( = ?auto_54231 ?auto_54232 ) ) ( not ( = ?auto_54231 ?auto_54233 ) ) ( not ( = ?auto_54232 ?auto_54233 ) ) ( ON ?auto_54233 ?auto_54235 ) ( not ( = ?auto_54229 ?auto_54235 ) ) ( not ( = ?auto_54230 ?auto_54235 ) ) ( not ( = ?auto_54231 ?auto_54235 ) ) ( not ( = ?auto_54232 ?auto_54235 ) ) ( not ( = ?auto_54233 ?auto_54235 ) ) ( ON ?auto_54232 ?auto_54233 ) ( CLEAR ?auto_54232 ) ( ON-TABLE ?auto_54234 ) ( ON ?auto_54235 ?auto_54234 ) ( not ( = ?auto_54234 ?auto_54235 ) ) ( not ( = ?auto_54234 ?auto_54233 ) ) ( not ( = ?auto_54234 ?auto_54232 ) ) ( not ( = ?auto_54229 ?auto_54234 ) ) ( not ( = ?auto_54230 ?auto_54234 ) ) ( not ( = ?auto_54231 ?auto_54234 ) ) ( HOLDING ?auto_54231 ) ( CLEAR ?auto_54230 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54229 ?auto_54230 ?auto_54231 )
      ( MAKE-5PILE ?auto_54229 ?auto_54230 ?auto_54231 ?auto_54232 ?auto_54233 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54236 - BLOCK
      ?auto_54237 - BLOCK
      ?auto_54238 - BLOCK
      ?auto_54239 - BLOCK
      ?auto_54240 - BLOCK
    )
    :vars
    (
      ?auto_54242 - BLOCK
      ?auto_54241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54236 ) ( ON ?auto_54237 ?auto_54236 ) ( not ( = ?auto_54236 ?auto_54237 ) ) ( not ( = ?auto_54236 ?auto_54238 ) ) ( not ( = ?auto_54236 ?auto_54239 ) ) ( not ( = ?auto_54236 ?auto_54240 ) ) ( not ( = ?auto_54237 ?auto_54238 ) ) ( not ( = ?auto_54237 ?auto_54239 ) ) ( not ( = ?auto_54237 ?auto_54240 ) ) ( not ( = ?auto_54238 ?auto_54239 ) ) ( not ( = ?auto_54238 ?auto_54240 ) ) ( not ( = ?auto_54239 ?auto_54240 ) ) ( ON ?auto_54240 ?auto_54242 ) ( not ( = ?auto_54236 ?auto_54242 ) ) ( not ( = ?auto_54237 ?auto_54242 ) ) ( not ( = ?auto_54238 ?auto_54242 ) ) ( not ( = ?auto_54239 ?auto_54242 ) ) ( not ( = ?auto_54240 ?auto_54242 ) ) ( ON ?auto_54239 ?auto_54240 ) ( ON-TABLE ?auto_54241 ) ( ON ?auto_54242 ?auto_54241 ) ( not ( = ?auto_54241 ?auto_54242 ) ) ( not ( = ?auto_54241 ?auto_54240 ) ) ( not ( = ?auto_54241 ?auto_54239 ) ) ( not ( = ?auto_54236 ?auto_54241 ) ) ( not ( = ?auto_54237 ?auto_54241 ) ) ( not ( = ?auto_54238 ?auto_54241 ) ) ( CLEAR ?auto_54237 ) ( ON ?auto_54238 ?auto_54239 ) ( CLEAR ?auto_54238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54241 ?auto_54242 ?auto_54240 ?auto_54239 )
      ( MAKE-5PILE ?auto_54236 ?auto_54237 ?auto_54238 ?auto_54239 ?auto_54240 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54243 - BLOCK
      ?auto_54244 - BLOCK
      ?auto_54245 - BLOCK
      ?auto_54246 - BLOCK
      ?auto_54247 - BLOCK
    )
    :vars
    (
      ?auto_54249 - BLOCK
      ?auto_54248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54243 ) ( not ( = ?auto_54243 ?auto_54244 ) ) ( not ( = ?auto_54243 ?auto_54245 ) ) ( not ( = ?auto_54243 ?auto_54246 ) ) ( not ( = ?auto_54243 ?auto_54247 ) ) ( not ( = ?auto_54244 ?auto_54245 ) ) ( not ( = ?auto_54244 ?auto_54246 ) ) ( not ( = ?auto_54244 ?auto_54247 ) ) ( not ( = ?auto_54245 ?auto_54246 ) ) ( not ( = ?auto_54245 ?auto_54247 ) ) ( not ( = ?auto_54246 ?auto_54247 ) ) ( ON ?auto_54247 ?auto_54249 ) ( not ( = ?auto_54243 ?auto_54249 ) ) ( not ( = ?auto_54244 ?auto_54249 ) ) ( not ( = ?auto_54245 ?auto_54249 ) ) ( not ( = ?auto_54246 ?auto_54249 ) ) ( not ( = ?auto_54247 ?auto_54249 ) ) ( ON ?auto_54246 ?auto_54247 ) ( ON-TABLE ?auto_54248 ) ( ON ?auto_54249 ?auto_54248 ) ( not ( = ?auto_54248 ?auto_54249 ) ) ( not ( = ?auto_54248 ?auto_54247 ) ) ( not ( = ?auto_54248 ?auto_54246 ) ) ( not ( = ?auto_54243 ?auto_54248 ) ) ( not ( = ?auto_54244 ?auto_54248 ) ) ( not ( = ?auto_54245 ?auto_54248 ) ) ( ON ?auto_54245 ?auto_54246 ) ( CLEAR ?auto_54245 ) ( HOLDING ?auto_54244 ) ( CLEAR ?auto_54243 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54243 ?auto_54244 )
      ( MAKE-5PILE ?auto_54243 ?auto_54244 ?auto_54245 ?auto_54246 ?auto_54247 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54250 - BLOCK
      ?auto_54251 - BLOCK
      ?auto_54252 - BLOCK
      ?auto_54253 - BLOCK
      ?auto_54254 - BLOCK
    )
    :vars
    (
      ?auto_54255 - BLOCK
      ?auto_54256 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54250 ) ( not ( = ?auto_54250 ?auto_54251 ) ) ( not ( = ?auto_54250 ?auto_54252 ) ) ( not ( = ?auto_54250 ?auto_54253 ) ) ( not ( = ?auto_54250 ?auto_54254 ) ) ( not ( = ?auto_54251 ?auto_54252 ) ) ( not ( = ?auto_54251 ?auto_54253 ) ) ( not ( = ?auto_54251 ?auto_54254 ) ) ( not ( = ?auto_54252 ?auto_54253 ) ) ( not ( = ?auto_54252 ?auto_54254 ) ) ( not ( = ?auto_54253 ?auto_54254 ) ) ( ON ?auto_54254 ?auto_54255 ) ( not ( = ?auto_54250 ?auto_54255 ) ) ( not ( = ?auto_54251 ?auto_54255 ) ) ( not ( = ?auto_54252 ?auto_54255 ) ) ( not ( = ?auto_54253 ?auto_54255 ) ) ( not ( = ?auto_54254 ?auto_54255 ) ) ( ON ?auto_54253 ?auto_54254 ) ( ON-TABLE ?auto_54256 ) ( ON ?auto_54255 ?auto_54256 ) ( not ( = ?auto_54256 ?auto_54255 ) ) ( not ( = ?auto_54256 ?auto_54254 ) ) ( not ( = ?auto_54256 ?auto_54253 ) ) ( not ( = ?auto_54250 ?auto_54256 ) ) ( not ( = ?auto_54251 ?auto_54256 ) ) ( not ( = ?auto_54252 ?auto_54256 ) ) ( ON ?auto_54252 ?auto_54253 ) ( CLEAR ?auto_54250 ) ( ON ?auto_54251 ?auto_54252 ) ( CLEAR ?auto_54251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54256 ?auto_54255 ?auto_54254 ?auto_54253 ?auto_54252 )
      ( MAKE-5PILE ?auto_54250 ?auto_54251 ?auto_54252 ?auto_54253 ?auto_54254 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54257 - BLOCK
      ?auto_54258 - BLOCK
      ?auto_54259 - BLOCK
      ?auto_54260 - BLOCK
      ?auto_54261 - BLOCK
    )
    :vars
    (
      ?auto_54263 - BLOCK
      ?auto_54262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54257 ?auto_54258 ) ) ( not ( = ?auto_54257 ?auto_54259 ) ) ( not ( = ?auto_54257 ?auto_54260 ) ) ( not ( = ?auto_54257 ?auto_54261 ) ) ( not ( = ?auto_54258 ?auto_54259 ) ) ( not ( = ?auto_54258 ?auto_54260 ) ) ( not ( = ?auto_54258 ?auto_54261 ) ) ( not ( = ?auto_54259 ?auto_54260 ) ) ( not ( = ?auto_54259 ?auto_54261 ) ) ( not ( = ?auto_54260 ?auto_54261 ) ) ( ON ?auto_54261 ?auto_54263 ) ( not ( = ?auto_54257 ?auto_54263 ) ) ( not ( = ?auto_54258 ?auto_54263 ) ) ( not ( = ?auto_54259 ?auto_54263 ) ) ( not ( = ?auto_54260 ?auto_54263 ) ) ( not ( = ?auto_54261 ?auto_54263 ) ) ( ON ?auto_54260 ?auto_54261 ) ( ON-TABLE ?auto_54262 ) ( ON ?auto_54263 ?auto_54262 ) ( not ( = ?auto_54262 ?auto_54263 ) ) ( not ( = ?auto_54262 ?auto_54261 ) ) ( not ( = ?auto_54262 ?auto_54260 ) ) ( not ( = ?auto_54257 ?auto_54262 ) ) ( not ( = ?auto_54258 ?auto_54262 ) ) ( not ( = ?auto_54259 ?auto_54262 ) ) ( ON ?auto_54259 ?auto_54260 ) ( ON ?auto_54258 ?auto_54259 ) ( CLEAR ?auto_54258 ) ( HOLDING ?auto_54257 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54257 )
      ( MAKE-5PILE ?auto_54257 ?auto_54258 ?auto_54259 ?auto_54260 ?auto_54261 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54264 - BLOCK
      ?auto_54265 - BLOCK
      ?auto_54266 - BLOCK
      ?auto_54267 - BLOCK
      ?auto_54268 - BLOCK
    )
    :vars
    (
      ?auto_54270 - BLOCK
      ?auto_54269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54264 ?auto_54265 ) ) ( not ( = ?auto_54264 ?auto_54266 ) ) ( not ( = ?auto_54264 ?auto_54267 ) ) ( not ( = ?auto_54264 ?auto_54268 ) ) ( not ( = ?auto_54265 ?auto_54266 ) ) ( not ( = ?auto_54265 ?auto_54267 ) ) ( not ( = ?auto_54265 ?auto_54268 ) ) ( not ( = ?auto_54266 ?auto_54267 ) ) ( not ( = ?auto_54266 ?auto_54268 ) ) ( not ( = ?auto_54267 ?auto_54268 ) ) ( ON ?auto_54268 ?auto_54270 ) ( not ( = ?auto_54264 ?auto_54270 ) ) ( not ( = ?auto_54265 ?auto_54270 ) ) ( not ( = ?auto_54266 ?auto_54270 ) ) ( not ( = ?auto_54267 ?auto_54270 ) ) ( not ( = ?auto_54268 ?auto_54270 ) ) ( ON ?auto_54267 ?auto_54268 ) ( ON-TABLE ?auto_54269 ) ( ON ?auto_54270 ?auto_54269 ) ( not ( = ?auto_54269 ?auto_54270 ) ) ( not ( = ?auto_54269 ?auto_54268 ) ) ( not ( = ?auto_54269 ?auto_54267 ) ) ( not ( = ?auto_54264 ?auto_54269 ) ) ( not ( = ?auto_54265 ?auto_54269 ) ) ( not ( = ?auto_54266 ?auto_54269 ) ) ( ON ?auto_54266 ?auto_54267 ) ( ON ?auto_54265 ?auto_54266 ) ( ON ?auto_54264 ?auto_54265 ) ( CLEAR ?auto_54264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54269 ?auto_54270 ?auto_54268 ?auto_54267 ?auto_54266 ?auto_54265 )
      ( MAKE-5PILE ?auto_54264 ?auto_54265 ?auto_54266 ?auto_54267 ?auto_54268 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54272 - BLOCK
    )
    :vars
    (
      ?auto_54273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54273 ?auto_54272 ) ( CLEAR ?auto_54273 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54272 ) ( not ( = ?auto_54272 ?auto_54273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54273 ?auto_54272 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54274 - BLOCK
    )
    :vars
    (
      ?auto_54275 - BLOCK
      ?auto_54276 - BLOCK
      ?auto_54277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54275 ?auto_54274 ) ( CLEAR ?auto_54275 ) ( ON-TABLE ?auto_54274 ) ( not ( = ?auto_54274 ?auto_54275 ) ) ( HOLDING ?auto_54276 ) ( CLEAR ?auto_54277 ) ( not ( = ?auto_54274 ?auto_54276 ) ) ( not ( = ?auto_54274 ?auto_54277 ) ) ( not ( = ?auto_54275 ?auto_54276 ) ) ( not ( = ?auto_54275 ?auto_54277 ) ) ( not ( = ?auto_54276 ?auto_54277 ) ) )
    :subtasks
    ( ( !STACK ?auto_54276 ?auto_54277 )
      ( MAKE-1PILE ?auto_54274 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54278 - BLOCK
    )
    :vars
    (
      ?auto_54279 - BLOCK
      ?auto_54280 - BLOCK
      ?auto_54281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54279 ?auto_54278 ) ( ON-TABLE ?auto_54278 ) ( not ( = ?auto_54278 ?auto_54279 ) ) ( CLEAR ?auto_54280 ) ( not ( = ?auto_54278 ?auto_54281 ) ) ( not ( = ?auto_54278 ?auto_54280 ) ) ( not ( = ?auto_54279 ?auto_54281 ) ) ( not ( = ?auto_54279 ?auto_54280 ) ) ( not ( = ?auto_54281 ?auto_54280 ) ) ( ON ?auto_54281 ?auto_54279 ) ( CLEAR ?auto_54281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54278 ?auto_54279 )
      ( MAKE-1PILE ?auto_54278 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54282 - BLOCK
    )
    :vars
    (
      ?auto_54284 - BLOCK
      ?auto_54283 - BLOCK
      ?auto_54285 - BLOCK
      ?auto_54287 - BLOCK
      ?auto_54286 - BLOCK
      ?auto_54288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54284 ?auto_54282 ) ( ON-TABLE ?auto_54282 ) ( not ( = ?auto_54282 ?auto_54284 ) ) ( not ( = ?auto_54282 ?auto_54283 ) ) ( not ( = ?auto_54282 ?auto_54285 ) ) ( not ( = ?auto_54284 ?auto_54283 ) ) ( not ( = ?auto_54284 ?auto_54285 ) ) ( not ( = ?auto_54283 ?auto_54285 ) ) ( ON ?auto_54283 ?auto_54284 ) ( CLEAR ?auto_54283 ) ( HOLDING ?auto_54285 ) ( CLEAR ?auto_54287 ) ( ON-TABLE ?auto_54286 ) ( ON ?auto_54288 ?auto_54286 ) ( ON ?auto_54287 ?auto_54288 ) ( not ( = ?auto_54286 ?auto_54288 ) ) ( not ( = ?auto_54286 ?auto_54287 ) ) ( not ( = ?auto_54286 ?auto_54285 ) ) ( not ( = ?auto_54288 ?auto_54287 ) ) ( not ( = ?auto_54288 ?auto_54285 ) ) ( not ( = ?auto_54287 ?auto_54285 ) ) ( not ( = ?auto_54282 ?auto_54287 ) ) ( not ( = ?auto_54282 ?auto_54286 ) ) ( not ( = ?auto_54282 ?auto_54288 ) ) ( not ( = ?auto_54284 ?auto_54287 ) ) ( not ( = ?auto_54284 ?auto_54286 ) ) ( not ( = ?auto_54284 ?auto_54288 ) ) ( not ( = ?auto_54283 ?auto_54287 ) ) ( not ( = ?auto_54283 ?auto_54286 ) ) ( not ( = ?auto_54283 ?auto_54288 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54286 ?auto_54288 ?auto_54287 ?auto_54285 )
      ( MAKE-1PILE ?auto_54282 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54289 - BLOCK
    )
    :vars
    (
      ?auto_54291 - BLOCK
      ?auto_54292 - BLOCK
      ?auto_54294 - BLOCK
      ?auto_54290 - BLOCK
      ?auto_54295 - BLOCK
      ?auto_54293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54291 ?auto_54289 ) ( ON-TABLE ?auto_54289 ) ( not ( = ?auto_54289 ?auto_54291 ) ) ( not ( = ?auto_54289 ?auto_54292 ) ) ( not ( = ?auto_54289 ?auto_54294 ) ) ( not ( = ?auto_54291 ?auto_54292 ) ) ( not ( = ?auto_54291 ?auto_54294 ) ) ( not ( = ?auto_54292 ?auto_54294 ) ) ( ON ?auto_54292 ?auto_54291 ) ( CLEAR ?auto_54290 ) ( ON-TABLE ?auto_54295 ) ( ON ?auto_54293 ?auto_54295 ) ( ON ?auto_54290 ?auto_54293 ) ( not ( = ?auto_54295 ?auto_54293 ) ) ( not ( = ?auto_54295 ?auto_54290 ) ) ( not ( = ?auto_54295 ?auto_54294 ) ) ( not ( = ?auto_54293 ?auto_54290 ) ) ( not ( = ?auto_54293 ?auto_54294 ) ) ( not ( = ?auto_54290 ?auto_54294 ) ) ( not ( = ?auto_54289 ?auto_54290 ) ) ( not ( = ?auto_54289 ?auto_54295 ) ) ( not ( = ?auto_54289 ?auto_54293 ) ) ( not ( = ?auto_54291 ?auto_54290 ) ) ( not ( = ?auto_54291 ?auto_54295 ) ) ( not ( = ?auto_54291 ?auto_54293 ) ) ( not ( = ?auto_54292 ?auto_54290 ) ) ( not ( = ?auto_54292 ?auto_54295 ) ) ( not ( = ?auto_54292 ?auto_54293 ) ) ( ON ?auto_54294 ?auto_54292 ) ( CLEAR ?auto_54294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54289 ?auto_54291 ?auto_54292 )
      ( MAKE-1PILE ?auto_54289 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54296 - BLOCK
    )
    :vars
    (
      ?auto_54299 - BLOCK
      ?auto_54297 - BLOCK
      ?auto_54300 - BLOCK
      ?auto_54302 - BLOCK
      ?auto_54301 - BLOCK
      ?auto_54298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54299 ?auto_54296 ) ( ON-TABLE ?auto_54296 ) ( not ( = ?auto_54296 ?auto_54299 ) ) ( not ( = ?auto_54296 ?auto_54297 ) ) ( not ( = ?auto_54296 ?auto_54300 ) ) ( not ( = ?auto_54299 ?auto_54297 ) ) ( not ( = ?auto_54299 ?auto_54300 ) ) ( not ( = ?auto_54297 ?auto_54300 ) ) ( ON ?auto_54297 ?auto_54299 ) ( ON-TABLE ?auto_54302 ) ( ON ?auto_54301 ?auto_54302 ) ( not ( = ?auto_54302 ?auto_54301 ) ) ( not ( = ?auto_54302 ?auto_54298 ) ) ( not ( = ?auto_54302 ?auto_54300 ) ) ( not ( = ?auto_54301 ?auto_54298 ) ) ( not ( = ?auto_54301 ?auto_54300 ) ) ( not ( = ?auto_54298 ?auto_54300 ) ) ( not ( = ?auto_54296 ?auto_54298 ) ) ( not ( = ?auto_54296 ?auto_54302 ) ) ( not ( = ?auto_54296 ?auto_54301 ) ) ( not ( = ?auto_54299 ?auto_54298 ) ) ( not ( = ?auto_54299 ?auto_54302 ) ) ( not ( = ?auto_54299 ?auto_54301 ) ) ( not ( = ?auto_54297 ?auto_54298 ) ) ( not ( = ?auto_54297 ?auto_54302 ) ) ( not ( = ?auto_54297 ?auto_54301 ) ) ( ON ?auto_54300 ?auto_54297 ) ( CLEAR ?auto_54300 ) ( HOLDING ?auto_54298 ) ( CLEAR ?auto_54301 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54302 ?auto_54301 ?auto_54298 )
      ( MAKE-1PILE ?auto_54296 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54303 - BLOCK
    )
    :vars
    (
      ?auto_54306 - BLOCK
      ?auto_54304 - BLOCK
      ?auto_54308 - BLOCK
      ?auto_54305 - BLOCK
      ?auto_54309 - BLOCK
      ?auto_54307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54306 ?auto_54303 ) ( ON-TABLE ?auto_54303 ) ( not ( = ?auto_54303 ?auto_54306 ) ) ( not ( = ?auto_54303 ?auto_54304 ) ) ( not ( = ?auto_54303 ?auto_54308 ) ) ( not ( = ?auto_54306 ?auto_54304 ) ) ( not ( = ?auto_54306 ?auto_54308 ) ) ( not ( = ?auto_54304 ?auto_54308 ) ) ( ON ?auto_54304 ?auto_54306 ) ( ON-TABLE ?auto_54305 ) ( ON ?auto_54309 ?auto_54305 ) ( not ( = ?auto_54305 ?auto_54309 ) ) ( not ( = ?auto_54305 ?auto_54307 ) ) ( not ( = ?auto_54305 ?auto_54308 ) ) ( not ( = ?auto_54309 ?auto_54307 ) ) ( not ( = ?auto_54309 ?auto_54308 ) ) ( not ( = ?auto_54307 ?auto_54308 ) ) ( not ( = ?auto_54303 ?auto_54307 ) ) ( not ( = ?auto_54303 ?auto_54305 ) ) ( not ( = ?auto_54303 ?auto_54309 ) ) ( not ( = ?auto_54306 ?auto_54307 ) ) ( not ( = ?auto_54306 ?auto_54305 ) ) ( not ( = ?auto_54306 ?auto_54309 ) ) ( not ( = ?auto_54304 ?auto_54307 ) ) ( not ( = ?auto_54304 ?auto_54305 ) ) ( not ( = ?auto_54304 ?auto_54309 ) ) ( ON ?auto_54308 ?auto_54304 ) ( CLEAR ?auto_54309 ) ( ON ?auto_54307 ?auto_54308 ) ( CLEAR ?auto_54307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54303 ?auto_54306 ?auto_54304 ?auto_54308 )
      ( MAKE-1PILE ?auto_54303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54310 - BLOCK
    )
    :vars
    (
      ?auto_54315 - BLOCK
      ?auto_54312 - BLOCK
      ?auto_54316 - BLOCK
      ?auto_54311 - BLOCK
      ?auto_54313 - BLOCK
      ?auto_54314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54315 ?auto_54310 ) ( ON-TABLE ?auto_54310 ) ( not ( = ?auto_54310 ?auto_54315 ) ) ( not ( = ?auto_54310 ?auto_54312 ) ) ( not ( = ?auto_54310 ?auto_54316 ) ) ( not ( = ?auto_54315 ?auto_54312 ) ) ( not ( = ?auto_54315 ?auto_54316 ) ) ( not ( = ?auto_54312 ?auto_54316 ) ) ( ON ?auto_54312 ?auto_54315 ) ( ON-TABLE ?auto_54311 ) ( not ( = ?auto_54311 ?auto_54313 ) ) ( not ( = ?auto_54311 ?auto_54314 ) ) ( not ( = ?auto_54311 ?auto_54316 ) ) ( not ( = ?auto_54313 ?auto_54314 ) ) ( not ( = ?auto_54313 ?auto_54316 ) ) ( not ( = ?auto_54314 ?auto_54316 ) ) ( not ( = ?auto_54310 ?auto_54314 ) ) ( not ( = ?auto_54310 ?auto_54311 ) ) ( not ( = ?auto_54310 ?auto_54313 ) ) ( not ( = ?auto_54315 ?auto_54314 ) ) ( not ( = ?auto_54315 ?auto_54311 ) ) ( not ( = ?auto_54315 ?auto_54313 ) ) ( not ( = ?auto_54312 ?auto_54314 ) ) ( not ( = ?auto_54312 ?auto_54311 ) ) ( not ( = ?auto_54312 ?auto_54313 ) ) ( ON ?auto_54316 ?auto_54312 ) ( ON ?auto_54314 ?auto_54316 ) ( CLEAR ?auto_54314 ) ( HOLDING ?auto_54313 ) ( CLEAR ?auto_54311 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54311 ?auto_54313 )
      ( MAKE-1PILE ?auto_54310 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54317 - BLOCK
    )
    :vars
    (
      ?auto_54320 - BLOCK
      ?auto_54323 - BLOCK
      ?auto_54318 - BLOCK
      ?auto_54319 - BLOCK
      ?auto_54322 - BLOCK
      ?auto_54321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54320 ?auto_54317 ) ( ON-TABLE ?auto_54317 ) ( not ( = ?auto_54317 ?auto_54320 ) ) ( not ( = ?auto_54317 ?auto_54323 ) ) ( not ( = ?auto_54317 ?auto_54318 ) ) ( not ( = ?auto_54320 ?auto_54323 ) ) ( not ( = ?auto_54320 ?auto_54318 ) ) ( not ( = ?auto_54323 ?auto_54318 ) ) ( ON ?auto_54323 ?auto_54320 ) ( ON-TABLE ?auto_54319 ) ( not ( = ?auto_54319 ?auto_54322 ) ) ( not ( = ?auto_54319 ?auto_54321 ) ) ( not ( = ?auto_54319 ?auto_54318 ) ) ( not ( = ?auto_54322 ?auto_54321 ) ) ( not ( = ?auto_54322 ?auto_54318 ) ) ( not ( = ?auto_54321 ?auto_54318 ) ) ( not ( = ?auto_54317 ?auto_54321 ) ) ( not ( = ?auto_54317 ?auto_54319 ) ) ( not ( = ?auto_54317 ?auto_54322 ) ) ( not ( = ?auto_54320 ?auto_54321 ) ) ( not ( = ?auto_54320 ?auto_54319 ) ) ( not ( = ?auto_54320 ?auto_54322 ) ) ( not ( = ?auto_54323 ?auto_54321 ) ) ( not ( = ?auto_54323 ?auto_54319 ) ) ( not ( = ?auto_54323 ?auto_54322 ) ) ( ON ?auto_54318 ?auto_54323 ) ( ON ?auto_54321 ?auto_54318 ) ( CLEAR ?auto_54319 ) ( ON ?auto_54322 ?auto_54321 ) ( CLEAR ?auto_54322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54317 ?auto_54320 ?auto_54323 ?auto_54318 ?auto_54321 )
      ( MAKE-1PILE ?auto_54317 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54324 - BLOCK
    )
    :vars
    (
      ?auto_54329 - BLOCK
      ?auto_54330 - BLOCK
      ?auto_54327 - BLOCK
      ?auto_54325 - BLOCK
      ?auto_54326 - BLOCK
      ?auto_54328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54329 ?auto_54324 ) ( ON-TABLE ?auto_54324 ) ( not ( = ?auto_54324 ?auto_54329 ) ) ( not ( = ?auto_54324 ?auto_54330 ) ) ( not ( = ?auto_54324 ?auto_54327 ) ) ( not ( = ?auto_54329 ?auto_54330 ) ) ( not ( = ?auto_54329 ?auto_54327 ) ) ( not ( = ?auto_54330 ?auto_54327 ) ) ( ON ?auto_54330 ?auto_54329 ) ( not ( = ?auto_54325 ?auto_54326 ) ) ( not ( = ?auto_54325 ?auto_54328 ) ) ( not ( = ?auto_54325 ?auto_54327 ) ) ( not ( = ?auto_54326 ?auto_54328 ) ) ( not ( = ?auto_54326 ?auto_54327 ) ) ( not ( = ?auto_54328 ?auto_54327 ) ) ( not ( = ?auto_54324 ?auto_54328 ) ) ( not ( = ?auto_54324 ?auto_54325 ) ) ( not ( = ?auto_54324 ?auto_54326 ) ) ( not ( = ?auto_54329 ?auto_54328 ) ) ( not ( = ?auto_54329 ?auto_54325 ) ) ( not ( = ?auto_54329 ?auto_54326 ) ) ( not ( = ?auto_54330 ?auto_54328 ) ) ( not ( = ?auto_54330 ?auto_54325 ) ) ( not ( = ?auto_54330 ?auto_54326 ) ) ( ON ?auto_54327 ?auto_54330 ) ( ON ?auto_54328 ?auto_54327 ) ( ON ?auto_54326 ?auto_54328 ) ( CLEAR ?auto_54326 ) ( HOLDING ?auto_54325 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54325 )
      ( MAKE-1PILE ?auto_54324 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54331 - BLOCK
    )
    :vars
    (
      ?auto_54335 - BLOCK
      ?auto_54336 - BLOCK
      ?auto_54334 - BLOCK
      ?auto_54333 - BLOCK
      ?auto_54337 - BLOCK
      ?auto_54332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54335 ?auto_54331 ) ( ON-TABLE ?auto_54331 ) ( not ( = ?auto_54331 ?auto_54335 ) ) ( not ( = ?auto_54331 ?auto_54336 ) ) ( not ( = ?auto_54331 ?auto_54334 ) ) ( not ( = ?auto_54335 ?auto_54336 ) ) ( not ( = ?auto_54335 ?auto_54334 ) ) ( not ( = ?auto_54336 ?auto_54334 ) ) ( ON ?auto_54336 ?auto_54335 ) ( not ( = ?auto_54333 ?auto_54337 ) ) ( not ( = ?auto_54333 ?auto_54332 ) ) ( not ( = ?auto_54333 ?auto_54334 ) ) ( not ( = ?auto_54337 ?auto_54332 ) ) ( not ( = ?auto_54337 ?auto_54334 ) ) ( not ( = ?auto_54332 ?auto_54334 ) ) ( not ( = ?auto_54331 ?auto_54332 ) ) ( not ( = ?auto_54331 ?auto_54333 ) ) ( not ( = ?auto_54331 ?auto_54337 ) ) ( not ( = ?auto_54335 ?auto_54332 ) ) ( not ( = ?auto_54335 ?auto_54333 ) ) ( not ( = ?auto_54335 ?auto_54337 ) ) ( not ( = ?auto_54336 ?auto_54332 ) ) ( not ( = ?auto_54336 ?auto_54333 ) ) ( not ( = ?auto_54336 ?auto_54337 ) ) ( ON ?auto_54334 ?auto_54336 ) ( ON ?auto_54332 ?auto_54334 ) ( ON ?auto_54337 ?auto_54332 ) ( ON ?auto_54333 ?auto_54337 ) ( CLEAR ?auto_54333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54331 ?auto_54335 ?auto_54336 ?auto_54334 ?auto_54332 ?auto_54337 )
      ( MAKE-1PILE ?auto_54331 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54344 - BLOCK
      ?auto_54345 - BLOCK
      ?auto_54346 - BLOCK
      ?auto_54347 - BLOCK
      ?auto_54348 - BLOCK
      ?auto_54349 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_54349 ) ( CLEAR ?auto_54348 ) ( ON-TABLE ?auto_54344 ) ( ON ?auto_54345 ?auto_54344 ) ( ON ?auto_54346 ?auto_54345 ) ( ON ?auto_54347 ?auto_54346 ) ( ON ?auto_54348 ?auto_54347 ) ( not ( = ?auto_54344 ?auto_54345 ) ) ( not ( = ?auto_54344 ?auto_54346 ) ) ( not ( = ?auto_54344 ?auto_54347 ) ) ( not ( = ?auto_54344 ?auto_54348 ) ) ( not ( = ?auto_54344 ?auto_54349 ) ) ( not ( = ?auto_54345 ?auto_54346 ) ) ( not ( = ?auto_54345 ?auto_54347 ) ) ( not ( = ?auto_54345 ?auto_54348 ) ) ( not ( = ?auto_54345 ?auto_54349 ) ) ( not ( = ?auto_54346 ?auto_54347 ) ) ( not ( = ?auto_54346 ?auto_54348 ) ) ( not ( = ?auto_54346 ?auto_54349 ) ) ( not ( = ?auto_54347 ?auto_54348 ) ) ( not ( = ?auto_54347 ?auto_54349 ) ) ( not ( = ?auto_54348 ?auto_54349 ) ) )
    :subtasks
    ( ( !STACK ?auto_54349 ?auto_54348 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54350 - BLOCK
      ?auto_54351 - BLOCK
      ?auto_54352 - BLOCK
      ?auto_54353 - BLOCK
      ?auto_54354 - BLOCK
      ?auto_54355 - BLOCK
    )
    :vars
    (
      ?auto_54356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54354 ) ( ON-TABLE ?auto_54350 ) ( ON ?auto_54351 ?auto_54350 ) ( ON ?auto_54352 ?auto_54351 ) ( ON ?auto_54353 ?auto_54352 ) ( ON ?auto_54354 ?auto_54353 ) ( not ( = ?auto_54350 ?auto_54351 ) ) ( not ( = ?auto_54350 ?auto_54352 ) ) ( not ( = ?auto_54350 ?auto_54353 ) ) ( not ( = ?auto_54350 ?auto_54354 ) ) ( not ( = ?auto_54350 ?auto_54355 ) ) ( not ( = ?auto_54351 ?auto_54352 ) ) ( not ( = ?auto_54351 ?auto_54353 ) ) ( not ( = ?auto_54351 ?auto_54354 ) ) ( not ( = ?auto_54351 ?auto_54355 ) ) ( not ( = ?auto_54352 ?auto_54353 ) ) ( not ( = ?auto_54352 ?auto_54354 ) ) ( not ( = ?auto_54352 ?auto_54355 ) ) ( not ( = ?auto_54353 ?auto_54354 ) ) ( not ( = ?auto_54353 ?auto_54355 ) ) ( not ( = ?auto_54354 ?auto_54355 ) ) ( ON ?auto_54355 ?auto_54356 ) ( CLEAR ?auto_54355 ) ( HAND-EMPTY ) ( not ( = ?auto_54350 ?auto_54356 ) ) ( not ( = ?auto_54351 ?auto_54356 ) ) ( not ( = ?auto_54352 ?auto_54356 ) ) ( not ( = ?auto_54353 ?auto_54356 ) ) ( not ( = ?auto_54354 ?auto_54356 ) ) ( not ( = ?auto_54355 ?auto_54356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54355 ?auto_54356 )
      ( MAKE-6PILE ?auto_54350 ?auto_54351 ?auto_54352 ?auto_54353 ?auto_54354 ?auto_54355 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54357 - BLOCK
      ?auto_54358 - BLOCK
      ?auto_54359 - BLOCK
      ?auto_54360 - BLOCK
      ?auto_54361 - BLOCK
      ?auto_54362 - BLOCK
    )
    :vars
    (
      ?auto_54363 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54357 ) ( ON ?auto_54358 ?auto_54357 ) ( ON ?auto_54359 ?auto_54358 ) ( ON ?auto_54360 ?auto_54359 ) ( not ( = ?auto_54357 ?auto_54358 ) ) ( not ( = ?auto_54357 ?auto_54359 ) ) ( not ( = ?auto_54357 ?auto_54360 ) ) ( not ( = ?auto_54357 ?auto_54361 ) ) ( not ( = ?auto_54357 ?auto_54362 ) ) ( not ( = ?auto_54358 ?auto_54359 ) ) ( not ( = ?auto_54358 ?auto_54360 ) ) ( not ( = ?auto_54358 ?auto_54361 ) ) ( not ( = ?auto_54358 ?auto_54362 ) ) ( not ( = ?auto_54359 ?auto_54360 ) ) ( not ( = ?auto_54359 ?auto_54361 ) ) ( not ( = ?auto_54359 ?auto_54362 ) ) ( not ( = ?auto_54360 ?auto_54361 ) ) ( not ( = ?auto_54360 ?auto_54362 ) ) ( not ( = ?auto_54361 ?auto_54362 ) ) ( ON ?auto_54362 ?auto_54363 ) ( CLEAR ?auto_54362 ) ( not ( = ?auto_54357 ?auto_54363 ) ) ( not ( = ?auto_54358 ?auto_54363 ) ) ( not ( = ?auto_54359 ?auto_54363 ) ) ( not ( = ?auto_54360 ?auto_54363 ) ) ( not ( = ?auto_54361 ?auto_54363 ) ) ( not ( = ?auto_54362 ?auto_54363 ) ) ( HOLDING ?auto_54361 ) ( CLEAR ?auto_54360 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54357 ?auto_54358 ?auto_54359 ?auto_54360 ?auto_54361 )
      ( MAKE-6PILE ?auto_54357 ?auto_54358 ?auto_54359 ?auto_54360 ?auto_54361 ?auto_54362 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54364 - BLOCK
      ?auto_54365 - BLOCK
      ?auto_54366 - BLOCK
      ?auto_54367 - BLOCK
      ?auto_54368 - BLOCK
      ?auto_54369 - BLOCK
    )
    :vars
    (
      ?auto_54370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54364 ) ( ON ?auto_54365 ?auto_54364 ) ( ON ?auto_54366 ?auto_54365 ) ( ON ?auto_54367 ?auto_54366 ) ( not ( = ?auto_54364 ?auto_54365 ) ) ( not ( = ?auto_54364 ?auto_54366 ) ) ( not ( = ?auto_54364 ?auto_54367 ) ) ( not ( = ?auto_54364 ?auto_54368 ) ) ( not ( = ?auto_54364 ?auto_54369 ) ) ( not ( = ?auto_54365 ?auto_54366 ) ) ( not ( = ?auto_54365 ?auto_54367 ) ) ( not ( = ?auto_54365 ?auto_54368 ) ) ( not ( = ?auto_54365 ?auto_54369 ) ) ( not ( = ?auto_54366 ?auto_54367 ) ) ( not ( = ?auto_54366 ?auto_54368 ) ) ( not ( = ?auto_54366 ?auto_54369 ) ) ( not ( = ?auto_54367 ?auto_54368 ) ) ( not ( = ?auto_54367 ?auto_54369 ) ) ( not ( = ?auto_54368 ?auto_54369 ) ) ( ON ?auto_54369 ?auto_54370 ) ( not ( = ?auto_54364 ?auto_54370 ) ) ( not ( = ?auto_54365 ?auto_54370 ) ) ( not ( = ?auto_54366 ?auto_54370 ) ) ( not ( = ?auto_54367 ?auto_54370 ) ) ( not ( = ?auto_54368 ?auto_54370 ) ) ( not ( = ?auto_54369 ?auto_54370 ) ) ( CLEAR ?auto_54367 ) ( ON ?auto_54368 ?auto_54369 ) ( CLEAR ?auto_54368 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54370 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54370 ?auto_54369 )
      ( MAKE-6PILE ?auto_54364 ?auto_54365 ?auto_54366 ?auto_54367 ?auto_54368 ?auto_54369 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54371 - BLOCK
      ?auto_54372 - BLOCK
      ?auto_54373 - BLOCK
      ?auto_54374 - BLOCK
      ?auto_54375 - BLOCK
      ?auto_54376 - BLOCK
    )
    :vars
    (
      ?auto_54377 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54371 ) ( ON ?auto_54372 ?auto_54371 ) ( ON ?auto_54373 ?auto_54372 ) ( not ( = ?auto_54371 ?auto_54372 ) ) ( not ( = ?auto_54371 ?auto_54373 ) ) ( not ( = ?auto_54371 ?auto_54374 ) ) ( not ( = ?auto_54371 ?auto_54375 ) ) ( not ( = ?auto_54371 ?auto_54376 ) ) ( not ( = ?auto_54372 ?auto_54373 ) ) ( not ( = ?auto_54372 ?auto_54374 ) ) ( not ( = ?auto_54372 ?auto_54375 ) ) ( not ( = ?auto_54372 ?auto_54376 ) ) ( not ( = ?auto_54373 ?auto_54374 ) ) ( not ( = ?auto_54373 ?auto_54375 ) ) ( not ( = ?auto_54373 ?auto_54376 ) ) ( not ( = ?auto_54374 ?auto_54375 ) ) ( not ( = ?auto_54374 ?auto_54376 ) ) ( not ( = ?auto_54375 ?auto_54376 ) ) ( ON ?auto_54376 ?auto_54377 ) ( not ( = ?auto_54371 ?auto_54377 ) ) ( not ( = ?auto_54372 ?auto_54377 ) ) ( not ( = ?auto_54373 ?auto_54377 ) ) ( not ( = ?auto_54374 ?auto_54377 ) ) ( not ( = ?auto_54375 ?auto_54377 ) ) ( not ( = ?auto_54376 ?auto_54377 ) ) ( ON ?auto_54375 ?auto_54376 ) ( CLEAR ?auto_54375 ) ( ON-TABLE ?auto_54377 ) ( HOLDING ?auto_54374 ) ( CLEAR ?auto_54373 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54371 ?auto_54372 ?auto_54373 ?auto_54374 )
      ( MAKE-6PILE ?auto_54371 ?auto_54372 ?auto_54373 ?auto_54374 ?auto_54375 ?auto_54376 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54378 - BLOCK
      ?auto_54379 - BLOCK
      ?auto_54380 - BLOCK
      ?auto_54381 - BLOCK
      ?auto_54382 - BLOCK
      ?auto_54383 - BLOCK
    )
    :vars
    (
      ?auto_54384 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54378 ) ( ON ?auto_54379 ?auto_54378 ) ( ON ?auto_54380 ?auto_54379 ) ( not ( = ?auto_54378 ?auto_54379 ) ) ( not ( = ?auto_54378 ?auto_54380 ) ) ( not ( = ?auto_54378 ?auto_54381 ) ) ( not ( = ?auto_54378 ?auto_54382 ) ) ( not ( = ?auto_54378 ?auto_54383 ) ) ( not ( = ?auto_54379 ?auto_54380 ) ) ( not ( = ?auto_54379 ?auto_54381 ) ) ( not ( = ?auto_54379 ?auto_54382 ) ) ( not ( = ?auto_54379 ?auto_54383 ) ) ( not ( = ?auto_54380 ?auto_54381 ) ) ( not ( = ?auto_54380 ?auto_54382 ) ) ( not ( = ?auto_54380 ?auto_54383 ) ) ( not ( = ?auto_54381 ?auto_54382 ) ) ( not ( = ?auto_54381 ?auto_54383 ) ) ( not ( = ?auto_54382 ?auto_54383 ) ) ( ON ?auto_54383 ?auto_54384 ) ( not ( = ?auto_54378 ?auto_54384 ) ) ( not ( = ?auto_54379 ?auto_54384 ) ) ( not ( = ?auto_54380 ?auto_54384 ) ) ( not ( = ?auto_54381 ?auto_54384 ) ) ( not ( = ?auto_54382 ?auto_54384 ) ) ( not ( = ?auto_54383 ?auto_54384 ) ) ( ON ?auto_54382 ?auto_54383 ) ( ON-TABLE ?auto_54384 ) ( CLEAR ?auto_54380 ) ( ON ?auto_54381 ?auto_54382 ) ( CLEAR ?auto_54381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54384 ?auto_54383 ?auto_54382 )
      ( MAKE-6PILE ?auto_54378 ?auto_54379 ?auto_54380 ?auto_54381 ?auto_54382 ?auto_54383 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54385 - BLOCK
      ?auto_54386 - BLOCK
      ?auto_54387 - BLOCK
      ?auto_54388 - BLOCK
      ?auto_54389 - BLOCK
      ?auto_54390 - BLOCK
    )
    :vars
    (
      ?auto_54391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54385 ) ( ON ?auto_54386 ?auto_54385 ) ( not ( = ?auto_54385 ?auto_54386 ) ) ( not ( = ?auto_54385 ?auto_54387 ) ) ( not ( = ?auto_54385 ?auto_54388 ) ) ( not ( = ?auto_54385 ?auto_54389 ) ) ( not ( = ?auto_54385 ?auto_54390 ) ) ( not ( = ?auto_54386 ?auto_54387 ) ) ( not ( = ?auto_54386 ?auto_54388 ) ) ( not ( = ?auto_54386 ?auto_54389 ) ) ( not ( = ?auto_54386 ?auto_54390 ) ) ( not ( = ?auto_54387 ?auto_54388 ) ) ( not ( = ?auto_54387 ?auto_54389 ) ) ( not ( = ?auto_54387 ?auto_54390 ) ) ( not ( = ?auto_54388 ?auto_54389 ) ) ( not ( = ?auto_54388 ?auto_54390 ) ) ( not ( = ?auto_54389 ?auto_54390 ) ) ( ON ?auto_54390 ?auto_54391 ) ( not ( = ?auto_54385 ?auto_54391 ) ) ( not ( = ?auto_54386 ?auto_54391 ) ) ( not ( = ?auto_54387 ?auto_54391 ) ) ( not ( = ?auto_54388 ?auto_54391 ) ) ( not ( = ?auto_54389 ?auto_54391 ) ) ( not ( = ?auto_54390 ?auto_54391 ) ) ( ON ?auto_54389 ?auto_54390 ) ( ON-TABLE ?auto_54391 ) ( ON ?auto_54388 ?auto_54389 ) ( CLEAR ?auto_54388 ) ( HOLDING ?auto_54387 ) ( CLEAR ?auto_54386 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54385 ?auto_54386 ?auto_54387 )
      ( MAKE-6PILE ?auto_54385 ?auto_54386 ?auto_54387 ?auto_54388 ?auto_54389 ?auto_54390 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54392 - BLOCK
      ?auto_54393 - BLOCK
      ?auto_54394 - BLOCK
      ?auto_54395 - BLOCK
      ?auto_54396 - BLOCK
      ?auto_54397 - BLOCK
    )
    :vars
    (
      ?auto_54398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54392 ) ( ON ?auto_54393 ?auto_54392 ) ( not ( = ?auto_54392 ?auto_54393 ) ) ( not ( = ?auto_54392 ?auto_54394 ) ) ( not ( = ?auto_54392 ?auto_54395 ) ) ( not ( = ?auto_54392 ?auto_54396 ) ) ( not ( = ?auto_54392 ?auto_54397 ) ) ( not ( = ?auto_54393 ?auto_54394 ) ) ( not ( = ?auto_54393 ?auto_54395 ) ) ( not ( = ?auto_54393 ?auto_54396 ) ) ( not ( = ?auto_54393 ?auto_54397 ) ) ( not ( = ?auto_54394 ?auto_54395 ) ) ( not ( = ?auto_54394 ?auto_54396 ) ) ( not ( = ?auto_54394 ?auto_54397 ) ) ( not ( = ?auto_54395 ?auto_54396 ) ) ( not ( = ?auto_54395 ?auto_54397 ) ) ( not ( = ?auto_54396 ?auto_54397 ) ) ( ON ?auto_54397 ?auto_54398 ) ( not ( = ?auto_54392 ?auto_54398 ) ) ( not ( = ?auto_54393 ?auto_54398 ) ) ( not ( = ?auto_54394 ?auto_54398 ) ) ( not ( = ?auto_54395 ?auto_54398 ) ) ( not ( = ?auto_54396 ?auto_54398 ) ) ( not ( = ?auto_54397 ?auto_54398 ) ) ( ON ?auto_54396 ?auto_54397 ) ( ON-TABLE ?auto_54398 ) ( ON ?auto_54395 ?auto_54396 ) ( CLEAR ?auto_54393 ) ( ON ?auto_54394 ?auto_54395 ) ( CLEAR ?auto_54394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54398 ?auto_54397 ?auto_54396 ?auto_54395 )
      ( MAKE-6PILE ?auto_54392 ?auto_54393 ?auto_54394 ?auto_54395 ?auto_54396 ?auto_54397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54399 - BLOCK
      ?auto_54400 - BLOCK
      ?auto_54401 - BLOCK
      ?auto_54402 - BLOCK
      ?auto_54403 - BLOCK
      ?auto_54404 - BLOCK
    )
    :vars
    (
      ?auto_54405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54399 ) ( not ( = ?auto_54399 ?auto_54400 ) ) ( not ( = ?auto_54399 ?auto_54401 ) ) ( not ( = ?auto_54399 ?auto_54402 ) ) ( not ( = ?auto_54399 ?auto_54403 ) ) ( not ( = ?auto_54399 ?auto_54404 ) ) ( not ( = ?auto_54400 ?auto_54401 ) ) ( not ( = ?auto_54400 ?auto_54402 ) ) ( not ( = ?auto_54400 ?auto_54403 ) ) ( not ( = ?auto_54400 ?auto_54404 ) ) ( not ( = ?auto_54401 ?auto_54402 ) ) ( not ( = ?auto_54401 ?auto_54403 ) ) ( not ( = ?auto_54401 ?auto_54404 ) ) ( not ( = ?auto_54402 ?auto_54403 ) ) ( not ( = ?auto_54402 ?auto_54404 ) ) ( not ( = ?auto_54403 ?auto_54404 ) ) ( ON ?auto_54404 ?auto_54405 ) ( not ( = ?auto_54399 ?auto_54405 ) ) ( not ( = ?auto_54400 ?auto_54405 ) ) ( not ( = ?auto_54401 ?auto_54405 ) ) ( not ( = ?auto_54402 ?auto_54405 ) ) ( not ( = ?auto_54403 ?auto_54405 ) ) ( not ( = ?auto_54404 ?auto_54405 ) ) ( ON ?auto_54403 ?auto_54404 ) ( ON-TABLE ?auto_54405 ) ( ON ?auto_54402 ?auto_54403 ) ( ON ?auto_54401 ?auto_54402 ) ( CLEAR ?auto_54401 ) ( HOLDING ?auto_54400 ) ( CLEAR ?auto_54399 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54399 ?auto_54400 )
      ( MAKE-6PILE ?auto_54399 ?auto_54400 ?auto_54401 ?auto_54402 ?auto_54403 ?auto_54404 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54406 - BLOCK
      ?auto_54407 - BLOCK
      ?auto_54408 - BLOCK
      ?auto_54409 - BLOCK
      ?auto_54410 - BLOCK
      ?auto_54411 - BLOCK
    )
    :vars
    (
      ?auto_54412 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54406 ) ( not ( = ?auto_54406 ?auto_54407 ) ) ( not ( = ?auto_54406 ?auto_54408 ) ) ( not ( = ?auto_54406 ?auto_54409 ) ) ( not ( = ?auto_54406 ?auto_54410 ) ) ( not ( = ?auto_54406 ?auto_54411 ) ) ( not ( = ?auto_54407 ?auto_54408 ) ) ( not ( = ?auto_54407 ?auto_54409 ) ) ( not ( = ?auto_54407 ?auto_54410 ) ) ( not ( = ?auto_54407 ?auto_54411 ) ) ( not ( = ?auto_54408 ?auto_54409 ) ) ( not ( = ?auto_54408 ?auto_54410 ) ) ( not ( = ?auto_54408 ?auto_54411 ) ) ( not ( = ?auto_54409 ?auto_54410 ) ) ( not ( = ?auto_54409 ?auto_54411 ) ) ( not ( = ?auto_54410 ?auto_54411 ) ) ( ON ?auto_54411 ?auto_54412 ) ( not ( = ?auto_54406 ?auto_54412 ) ) ( not ( = ?auto_54407 ?auto_54412 ) ) ( not ( = ?auto_54408 ?auto_54412 ) ) ( not ( = ?auto_54409 ?auto_54412 ) ) ( not ( = ?auto_54410 ?auto_54412 ) ) ( not ( = ?auto_54411 ?auto_54412 ) ) ( ON ?auto_54410 ?auto_54411 ) ( ON-TABLE ?auto_54412 ) ( ON ?auto_54409 ?auto_54410 ) ( ON ?auto_54408 ?auto_54409 ) ( CLEAR ?auto_54406 ) ( ON ?auto_54407 ?auto_54408 ) ( CLEAR ?auto_54407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54412 ?auto_54411 ?auto_54410 ?auto_54409 ?auto_54408 )
      ( MAKE-6PILE ?auto_54406 ?auto_54407 ?auto_54408 ?auto_54409 ?auto_54410 ?auto_54411 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54413 - BLOCK
      ?auto_54414 - BLOCK
      ?auto_54415 - BLOCK
      ?auto_54416 - BLOCK
      ?auto_54417 - BLOCK
      ?auto_54418 - BLOCK
    )
    :vars
    (
      ?auto_54419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54413 ?auto_54414 ) ) ( not ( = ?auto_54413 ?auto_54415 ) ) ( not ( = ?auto_54413 ?auto_54416 ) ) ( not ( = ?auto_54413 ?auto_54417 ) ) ( not ( = ?auto_54413 ?auto_54418 ) ) ( not ( = ?auto_54414 ?auto_54415 ) ) ( not ( = ?auto_54414 ?auto_54416 ) ) ( not ( = ?auto_54414 ?auto_54417 ) ) ( not ( = ?auto_54414 ?auto_54418 ) ) ( not ( = ?auto_54415 ?auto_54416 ) ) ( not ( = ?auto_54415 ?auto_54417 ) ) ( not ( = ?auto_54415 ?auto_54418 ) ) ( not ( = ?auto_54416 ?auto_54417 ) ) ( not ( = ?auto_54416 ?auto_54418 ) ) ( not ( = ?auto_54417 ?auto_54418 ) ) ( ON ?auto_54418 ?auto_54419 ) ( not ( = ?auto_54413 ?auto_54419 ) ) ( not ( = ?auto_54414 ?auto_54419 ) ) ( not ( = ?auto_54415 ?auto_54419 ) ) ( not ( = ?auto_54416 ?auto_54419 ) ) ( not ( = ?auto_54417 ?auto_54419 ) ) ( not ( = ?auto_54418 ?auto_54419 ) ) ( ON ?auto_54417 ?auto_54418 ) ( ON-TABLE ?auto_54419 ) ( ON ?auto_54416 ?auto_54417 ) ( ON ?auto_54415 ?auto_54416 ) ( ON ?auto_54414 ?auto_54415 ) ( CLEAR ?auto_54414 ) ( HOLDING ?auto_54413 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54413 )
      ( MAKE-6PILE ?auto_54413 ?auto_54414 ?auto_54415 ?auto_54416 ?auto_54417 ?auto_54418 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54420 - BLOCK
      ?auto_54421 - BLOCK
      ?auto_54422 - BLOCK
      ?auto_54423 - BLOCK
      ?auto_54424 - BLOCK
      ?auto_54425 - BLOCK
    )
    :vars
    (
      ?auto_54426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54420 ?auto_54421 ) ) ( not ( = ?auto_54420 ?auto_54422 ) ) ( not ( = ?auto_54420 ?auto_54423 ) ) ( not ( = ?auto_54420 ?auto_54424 ) ) ( not ( = ?auto_54420 ?auto_54425 ) ) ( not ( = ?auto_54421 ?auto_54422 ) ) ( not ( = ?auto_54421 ?auto_54423 ) ) ( not ( = ?auto_54421 ?auto_54424 ) ) ( not ( = ?auto_54421 ?auto_54425 ) ) ( not ( = ?auto_54422 ?auto_54423 ) ) ( not ( = ?auto_54422 ?auto_54424 ) ) ( not ( = ?auto_54422 ?auto_54425 ) ) ( not ( = ?auto_54423 ?auto_54424 ) ) ( not ( = ?auto_54423 ?auto_54425 ) ) ( not ( = ?auto_54424 ?auto_54425 ) ) ( ON ?auto_54425 ?auto_54426 ) ( not ( = ?auto_54420 ?auto_54426 ) ) ( not ( = ?auto_54421 ?auto_54426 ) ) ( not ( = ?auto_54422 ?auto_54426 ) ) ( not ( = ?auto_54423 ?auto_54426 ) ) ( not ( = ?auto_54424 ?auto_54426 ) ) ( not ( = ?auto_54425 ?auto_54426 ) ) ( ON ?auto_54424 ?auto_54425 ) ( ON-TABLE ?auto_54426 ) ( ON ?auto_54423 ?auto_54424 ) ( ON ?auto_54422 ?auto_54423 ) ( ON ?auto_54421 ?auto_54422 ) ( ON ?auto_54420 ?auto_54421 ) ( CLEAR ?auto_54420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54426 ?auto_54425 ?auto_54424 ?auto_54423 ?auto_54422 ?auto_54421 )
      ( MAKE-6PILE ?auto_54420 ?auto_54421 ?auto_54422 ?auto_54423 ?auto_54424 ?auto_54425 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54432 - BLOCK
      ?auto_54433 - BLOCK
      ?auto_54434 - BLOCK
      ?auto_54435 - BLOCK
      ?auto_54436 - BLOCK
    )
    :vars
    (
      ?auto_54437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54437 ?auto_54436 ) ( CLEAR ?auto_54437 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54432 ) ( ON ?auto_54433 ?auto_54432 ) ( ON ?auto_54434 ?auto_54433 ) ( ON ?auto_54435 ?auto_54434 ) ( ON ?auto_54436 ?auto_54435 ) ( not ( = ?auto_54432 ?auto_54433 ) ) ( not ( = ?auto_54432 ?auto_54434 ) ) ( not ( = ?auto_54432 ?auto_54435 ) ) ( not ( = ?auto_54432 ?auto_54436 ) ) ( not ( = ?auto_54432 ?auto_54437 ) ) ( not ( = ?auto_54433 ?auto_54434 ) ) ( not ( = ?auto_54433 ?auto_54435 ) ) ( not ( = ?auto_54433 ?auto_54436 ) ) ( not ( = ?auto_54433 ?auto_54437 ) ) ( not ( = ?auto_54434 ?auto_54435 ) ) ( not ( = ?auto_54434 ?auto_54436 ) ) ( not ( = ?auto_54434 ?auto_54437 ) ) ( not ( = ?auto_54435 ?auto_54436 ) ) ( not ( = ?auto_54435 ?auto_54437 ) ) ( not ( = ?auto_54436 ?auto_54437 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54437 ?auto_54436 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54451 - BLOCK
      ?auto_54452 - BLOCK
      ?auto_54453 - BLOCK
      ?auto_54454 - BLOCK
      ?auto_54455 - BLOCK
    )
    :vars
    (
      ?auto_54456 - BLOCK
      ?auto_54457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54451 ) ( ON ?auto_54452 ?auto_54451 ) ( ON ?auto_54453 ?auto_54452 ) ( ON ?auto_54454 ?auto_54453 ) ( not ( = ?auto_54451 ?auto_54452 ) ) ( not ( = ?auto_54451 ?auto_54453 ) ) ( not ( = ?auto_54451 ?auto_54454 ) ) ( not ( = ?auto_54451 ?auto_54455 ) ) ( not ( = ?auto_54451 ?auto_54456 ) ) ( not ( = ?auto_54452 ?auto_54453 ) ) ( not ( = ?auto_54452 ?auto_54454 ) ) ( not ( = ?auto_54452 ?auto_54455 ) ) ( not ( = ?auto_54452 ?auto_54456 ) ) ( not ( = ?auto_54453 ?auto_54454 ) ) ( not ( = ?auto_54453 ?auto_54455 ) ) ( not ( = ?auto_54453 ?auto_54456 ) ) ( not ( = ?auto_54454 ?auto_54455 ) ) ( not ( = ?auto_54454 ?auto_54456 ) ) ( not ( = ?auto_54455 ?auto_54456 ) ) ( ON ?auto_54456 ?auto_54457 ) ( CLEAR ?auto_54456 ) ( not ( = ?auto_54451 ?auto_54457 ) ) ( not ( = ?auto_54452 ?auto_54457 ) ) ( not ( = ?auto_54453 ?auto_54457 ) ) ( not ( = ?auto_54454 ?auto_54457 ) ) ( not ( = ?auto_54455 ?auto_54457 ) ) ( not ( = ?auto_54456 ?auto_54457 ) ) ( HOLDING ?auto_54455 ) ( CLEAR ?auto_54454 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54451 ?auto_54452 ?auto_54453 ?auto_54454 ?auto_54455 ?auto_54456 )
      ( MAKE-5PILE ?auto_54451 ?auto_54452 ?auto_54453 ?auto_54454 ?auto_54455 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54458 - BLOCK
      ?auto_54459 - BLOCK
      ?auto_54460 - BLOCK
      ?auto_54461 - BLOCK
      ?auto_54462 - BLOCK
    )
    :vars
    (
      ?auto_54463 - BLOCK
      ?auto_54464 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54458 ) ( ON ?auto_54459 ?auto_54458 ) ( ON ?auto_54460 ?auto_54459 ) ( ON ?auto_54461 ?auto_54460 ) ( not ( = ?auto_54458 ?auto_54459 ) ) ( not ( = ?auto_54458 ?auto_54460 ) ) ( not ( = ?auto_54458 ?auto_54461 ) ) ( not ( = ?auto_54458 ?auto_54462 ) ) ( not ( = ?auto_54458 ?auto_54463 ) ) ( not ( = ?auto_54459 ?auto_54460 ) ) ( not ( = ?auto_54459 ?auto_54461 ) ) ( not ( = ?auto_54459 ?auto_54462 ) ) ( not ( = ?auto_54459 ?auto_54463 ) ) ( not ( = ?auto_54460 ?auto_54461 ) ) ( not ( = ?auto_54460 ?auto_54462 ) ) ( not ( = ?auto_54460 ?auto_54463 ) ) ( not ( = ?auto_54461 ?auto_54462 ) ) ( not ( = ?auto_54461 ?auto_54463 ) ) ( not ( = ?auto_54462 ?auto_54463 ) ) ( ON ?auto_54463 ?auto_54464 ) ( not ( = ?auto_54458 ?auto_54464 ) ) ( not ( = ?auto_54459 ?auto_54464 ) ) ( not ( = ?auto_54460 ?auto_54464 ) ) ( not ( = ?auto_54461 ?auto_54464 ) ) ( not ( = ?auto_54462 ?auto_54464 ) ) ( not ( = ?auto_54463 ?auto_54464 ) ) ( CLEAR ?auto_54461 ) ( ON ?auto_54462 ?auto_54463 ) ( CLEAR ?auto_54462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54464 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54464 ?auto_54463 )
      ( MAKE-5PILE ?auto_54458 ?auto_54459 ?auto_54460 ?auto_54461 ?auto_54462 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54465 - BLOCK
      ?auto_54466 - BLOCK
      ?auto_54467 - BLOCK
      ?auto_54468 - BLOCK
      ?auto_54469 - BLOCK
    )
    :vars
    (
      ?auto_54471 - BLOCK
      ?auto_54470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54465 ) ( ON ?auto_54466 ?auto_54465 ) ( ON ?auto_54467 ?auto_54466 ) ( not ( = ?auto_54465 ?auto_54466 ) ) ( not ( = ?auto_54465 ?auto_54467 ) ) ( not ( = ?auto_54465 ?auto_54468 ) ) ( not ( = ?auto_54465 ?auto_54469 ) ) ( not ( = ?auto_54465 ?auto_54471 ) ) ( not ( = ?auto_54466 ?auto_54467 ) ) ( not ( = ?auto_54466 ?auto_54468 ) ) ( not ( = ?auto_54466 ?auto_54469 ) ) ( not ( = ?auto_54466 ?auto_54471 ) ) ( not ( = ?auto_54467 ?auto_54468 ) ) ( not ( = ?auto_54467 ?auto_54469 ) ) ( not ( = ?auto_54467 ?auto_54471 ) ) ( not ( = ?auto_54468 ?auto_54469 ) ) ( not ( = ?auto_54468 ?auto_54471 ) ) ( not ( = ?auto_54469 ?auto_54471 ) ) ( ON ?auto_54471 ?auto_54470 ) ( not ( = ?auto_54465 ?auto_54470 ) ) ( not ( = ?auto_54466 ?auto_54470 ) ) ( not ( = ?auto_54467 ?auto_54470 ) ) ( not ( = ?auto_54468 ?auto_54470 ) ) ( not ( = ?auto_54469 ?auto_54470 ) ) ( not ( = ?auto_54471 ?auto_54470 ) ) ( ON ?auto_54469 ?auto_54471 ) ( CLEAR ?auto_54469 ) ( ON-TABLE ?auto_54470 ) ( HOLDING ?auto_54468 ) ( CLEAR ?auto_54467 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54465 ?auto_54466 ?auto_54467 ?auto_54468 )
      ( MAKE-5PILE ?auto_54465 ?auto_54466 ?auto_54467 ?auto_54468 ?auto_54469 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54472 - BLOCK
      ?auto_54473 - BLOCK
      ?auto_54474 - BLOCK
      ?auto_54475 - BLOCK
      ?auto_54476 - BLOCK
    )
    :vars
    (
      ?auto_54478 - BLOCK
      ?auto_54477 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54472 ) ( ON ?auto_54473 ?auto_54472 ) ( ON ?auto_54474 ?auto_54473 ) ( not ( = ?auto_54472 ?auto_54473 ) ) ( not ( = ?auto_54472 ?auto_54474 ) ) ( not ( = ?auto_54472 ?auto_54475 ) ) ( not ( = ?auto_54472 ?auto_54476 ) ) ( not ( = ?auto_54472 ?auto_54478 ) ) ( not ( = ?auto_54473 ?auto_54474 ) ) ( not ( = ?auto_54473 ?auto_54475 ) ) ( not ( = ?auto_54473 ?auto_54476 ) ) ( not ( = ?auto_54473 ?auto_54478 ) ) ( not ( = ?auto_54474 ?auto_54475 ) ) ( not ( = ?auto_54474 ?auto_54476 ) ) ( not ( = ?auto_54474 ?auto_54478 ) ) ( not ( = ?auto_54475 ?auto_54476 ) ) ( not ( = ?auto_54475 ?auto_54478 ) ) ( not ( = ?auto_54476 ?auto_54478 ) ) ( ON ?auto_54478 ?auto_54477 ) ( not ( = ?auto_54472 ?auto_54477 ) ) ( not ( = ?auto_54473 ?auto_54477 ) ) ( not ( = ?auto_54474 ?auto_54477 ) ) ( not ( = ?auto_54475 ?auto_54477 ) ) ( not ( = ?auto_54476 ?auto_54477 ) ) ( not ( = ?auto_54478 ?auto_54477 ) ) ( ON ?auto_54476 ?auto_54478 ) ( ON-TABLE ?auto_54477 ) ( CLEAR ?auto_54474 ) ( ON ?auto_54475 ?auto_54476 ) ( CLEAR ?auto_54475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54477 ?auto_54478 ?auto_54476 )
      ( MAKE-5PILE ?auto_54472 ?auto_54473 ?auto_54474 ?auto_54475 ?auto_54476 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54479 - BLOCK
      ?auto_54480 - BLOCK
      ?auto_54481 - BLOCK
      ?auto_54482 - BLOCK
      ?auto_54483 - BLOCK
    )
    :vars
    (
      ?auto_54484 - BLOCK
      ?auto_54485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54479 ) ( ON ?auto_54480 ?auto_54479 ) ( not ( = ?auto_54479 ?auto_54480 ) ) ( not ( = ?auto_54479 ?auto_54481 ) ) ( not ( = ?auto_54479 ?auto_54482 ) ) ( not ( = ?auto_54479 ?auto_54483 ) ) ( not ( = ?auto_54479 ?auto_54484 ) ) ( not ( = ?auto_54480 ?auto_54481 ) ) ( not ( = ?auto_54480 ?auto_54482 ) ) ( not ( = ?auto_54480 ?auto_54483 ) ) ( not ( = ?auto_54480 ?auto_54484 ) ) ( not ( = ?auto_54481 ?auto_54482 ) ) ( not ( = ?auto_54481 ?auto_54483 ) ) ( not ( = ?auto_54481 ?auto_54484 ) ) ( not ( = ?auto_54482 ?auto_54483 ) ) ( not ( = ?auto_54482 ?auto_54484 ) ) ( not ( = ?auto_54483 ?auto_54484 ) ) ( ON ?auto_54484 ?auto_54485 ) ( not ( = ?auto_54479 ?auto_54485 ) ) ( not ( = ?auto_54480 ?auto_54485 ) ) ( not ( = ?auto_54481 ?auto_54485 ) ) ( not ( = ?auto_54482 ?auto_54485 ) ) ( not ( = ?auto_54483 ?auto_54485 ) ) ( not ( = ?auto_54484 ?auto_54485 ) ) ( ON ?auto_54483 ?auto_54484 ) ( ON-TABLE ?auto_54485 ) ( ON ?auto_54482 ?auto_54483 ) ( CLEAR ?auto_54482 ) ( HOLDING ?auto_54481 ) ( CLEAR ?auto_54480 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54479 ?auto_54480 ?auto_54481 )
      ( MAKE-5PILE ?auto_54479 ?auto_54480 ?auto_54481 ?auto_54482 ?auto_54483 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54486 - BLOCK
      ?auto_54487 - BLOCK
      ?auto_54488 - BLOCK
      ?auto_54489 - BLOCK
      ?auto_54490 - BLOCK
    )
    :vars
    (
      ?auto_54491 - BLOCK
      ?auto_54492 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54486 ) ( ON ?auto_54487 ?auto_54486 ) ( not ( = ?auto_54486 ?auto_54487 ) ) ( not ( = ?auto_54486 ?auto_54488 ) ) ( not ( = ?auto_54486 ?auto_54489 ) ) ( not ( = ?auto_54486 ?auto_54490 ) ) ( not ( = ?auto_54486 ?auto_54491 ) ) ( not ( = ?auto_54487 ?auto_54488 ) ) ( not ( = ?auto_54487 ?auto_54489 ) ) ( not ( = ?auto_54487 ?auto_54490 ) ) ( not ( = ?auto_54487 ?auto_54491 ) ) ( not ( = ?auto_54488 ?auto_54489 ) ) ( not ( = ?auto_54488 ?auto_54490 ) ) ( not ( = ?auto_54488 ?auto_54491 ) ) ( not ( = ?auto_54489 ?auto_54490 ) ) ( not ( = ?auto_54489 ?auto_54491 ) ) ( not ( = ?auto_54490 ?auto_54491 ) ) ( ON ?auto_54491 ?auto_54492 ) ( not ( = ?auto_54486 ?auto_54492 ) ) ( not ( = ?auto_54487 ?auto_54492 ) ) ( not ( = ?auto_54488 ?auto_54492 ) ) ( not ( = ?auto_54489 ?auto_54492 ) ) ( not ( = ?auto_54490 ?auto_54492 ) ) ( not ( = ?auto_54491 ?auto_54492 ) ) ( ON ?auto_54490 ?auto_54491 ) ( ON-TABLE ?auto_54492 ) ( ON ?auto_54489 ?auto_54490 ) ( CLEAR ?auto_54487 ) ( ON ?auto_54488 ?auto_54489 ) ( CLEAR ?auto_54488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54492 ?auto_54491 ?auto_54490 ?auto_54489 )
      ( MAKE-5PILE ?auto_54486 ?auto_54487 ?auto_54488 ?auto_54489 ?auto_54490 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54493 - BLOCK
      ?auto_54494 - BLOCK
      ?auto_54495 - BLOCK
      ?auto_54496 - BLOCK
      ?auto_54497 - BLOCK
    )
    :vars
    (
      ?auto_54498 - BLOCK
      ?auto_54499 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54493 ) ( not ( = ?auto_54493 ?auto_54494 ) ) ( not ( = ?auto_54493 ?auto_54495 ) ) ( not ( = ?auto_54493 ?auto_54496 ) ) ( not ( = ?auto_54493 ?auto_54497 ) ) ( not ( = ?auto_54493 ?auto_54498 ) ) ( not ( = ?auto_54494 ?auto_54495 ) ) ( not ( = ?auto_54494 ?auto_54496 ) ) ( not ( = ?auto_54494 ?auto_54497 ) ) ( not ( = ?auto_54494 ?auto_54498 ) ) ( not ( = ?auto_54495 ?auto_54496 ) ) ( not ( = ?auto_54495 ?auto_54497 ) ) ( not ( = ?auto_54495 ?auto_54498 ) ) ( not ( = ?auto_54496 ?auto_54497 ) ) ( not ( = ?auto_54496 ?auto_54498 ) ) ( not ( = ?auto_54497 ?auto_54498 ) ) ( ON ?auto_54498 ?auto_54499 ) ( not ( = ?auto_54493 ?auto_54499 ) ) ( not ( = ?auto_54494 ?auto_54499 ) ) ( not ( = ?auto_54495 ?auto_54499 ) ) ( not ( = ?auto_54496 ?auto_54499 ) ) ( not ( = ?auto_54497 ?auto_54499 ) ) ( not ( = ?auto_54498 ?auto_54499 ) ) ( ON ?auto_54497 ?auto_54498 ) ( ON-TABLE ?auto_54499 ) ( ON ?auto_54496 ?auto_54497 ) ( ON ?auto_54495 ?auto_54496 ) ( CLEAR ?auto_54495 ) ( HOLDING ?auto_54494 ) ( CLEAR ?auto_54493 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54493 ?auto_54494 )
      ( MAKE-5PILE ?auto_54493 ?auto_54494 ?auto_54495 ?auto_54496 ?auto_54497 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54500 - BLOCK
      ?auto_54501 - BLOCK
      ?auto_54502 - BLOCK
      ?auto_54503 - BLOCK
      ?auto_54504 - BLOCK
    )
    :vars
    (
      ?auto_54505 - BLOCK
      ?auto_54506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54500 ) ( not ( = ?auto_54500 ?auto_54501 ) ) ( not ( = ?auto_54500 ?auto_54502 ) ) ( not ( = ?auto_54500 ?auto_54503 ) ) ( not ( = ?auto_54500 ?auto_54504 ) ) ( not ( = ?auto_54500 ?auto_54505 ) ) ( not ( = ?auto_54501 ?auto_54502 ) ) ( not ( = ?auto_54501 ?auto_54503 ) ) ( not ( = ?auto_54501 ?auto_54504 ) ) ( not ( = ?auto_54501 ?auto_54505 ) ) ( not ( = ?auto_54502 ?auto_54503 ) ) ( not ( = ?auto_54502 ?auto_54504 ) ) ( not ( = ?auto_54502 ?auto_54505 ) ) ( not ( = ?auto_54503 ?auto_54504 ) ) ( not ( = ?auto_54503 ?auto_54505 ) ) ( not ( = ?auto_54504 ?auto_54505 ) ) ( ON ?auto_54505 ?auto_54506 ) ( not ( = ?auto_54500 ?auto_54506 ) ) ( not ( = ?auto_54501 ?auto_54506 ) ) ( not ( = ?auto_54502 ?auto_54506 ) ) ( not ( = ?auto_54503 ?auto_54506 ) ) ( not ( = ?auto_54504 ?auto_54506 ) ) ( not ( = ?auto_54505 ?auto_54506 ) ) ( ON ?auto_54504 ?auto_54505 ) ( ON-TABLE ?auto_54506 ) ( ON ?auto_54503 ?auto_54504 ) ( ON ?auto_54502 ?auto_54503 ) ( CLEAR ?auto_54500 ) ( ON ?auto_54501 ?auto_54502 ) ( CLEAR ?auto_54501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54506 ?auto_54505 ?auto_54504 ?auto_54503 ?auto_54502 )
      ( MAKE-5PILE ?auto_54500 ?auto_54501 ?auto_54502 ?auto_54503 ?auto_54504 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54507 - BLOCK
      ?auto_54508 - BLOCK
      ?auto_54509 - BLOCK
      ?auto_54510 - BLOCK
      ?auto_54511 - BLOCK
    )
    :vars
    (
      ?auto_54513 - BLOCK
      ?auto_54512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54507 ?auto_54508 ) ) ( not ( = ?auto_54507 ?auto_54509 ) ) ( not ( = ?auto_54507 ?auto_54510 ) ) ( not ( = ?auto_54507 ?auto_54511 ) ) ( not ( = ?auto_54507 ?auto_54513 ) ) ( not ( = ?auto_54508 ?auto_54509 ) ) ( not ( = ?auto_54508 ?auto_54510 ) ) ( not ( = ?auto_54508 ?auto_54511 ) ) ( not ( = ?auto_54508 ?auto_54513 ) ) ( not ( = ?auto_54509 ?auto_54510 ) ) ( not ( = ?auto_54509 ?auto_54511 ) ) ( not ( = ?auto_54509 ?auto_54513 ) ) ( not ( = ?auto_54510 ?auto_54511 ) ) ( not ( = ?auto_54510 ?auto_54513 ) ) ( not ( = ?auto_54511 ?auto_54513 ) ) ( ON ?auto_54513 ?auto_54512 ) ( not ( = ?auto_54507 ?auto_54512 ) ) ( not ( = ?auto_54508 ?auto_54512 ) ) ( not ( = ?auto_54509 ?auto_54512 ) ) ( not ( = ?auto_54510 ?auto_54512 ) ) ( not ( = ?auto_54511 ?auto_54512 ) ) ( not ( = ?auto_54513 ?auto_54512 ) ) ( ON ?auto_54511 ?auto_54513 ) ( ON-TABLE ?auto_54512 ) ( ON ?auto_54510 ?auto_54511 ) ( ON ?auto_54509 ?auto_54510 ) ( ON ?auto_54508 ?auto_54509 ) ( CLEAR ?auto_54508 ) ( HOLDING ?auto_54507 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54507 )
      ( MAKE-5PILE ?auto_54507 ?auto_54508 ?auto_54509 ?auto_54510 ?auto_54511 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_54514 - BLOCK
      ?auto_54515 - BLOCK
      ?auto_54516 - BLOCK
      ?auto_54517 - BLOCK
      ?auto_54518 - BLOCK
    )
    :vars
    (
      ?auto_54519 - BLOCK
      ?auto_54520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54514 ?auto_54515 ) ) ( not ( = ?auto_54514 ?auto_54516 ) ) ( not ( = ?auto_54514 ?auto_54517 ) ) ( not ( = ?auto_54514 ?auto_54518 ) ) ( not ( = ?auto_54514 ?auto_54519 ) ) ( not ( = ?auto_54515 ?auto_54516 ) ) ( not ( = ?auto_54515 ?auto_54517 ) ) ( not ( = ?auto_54515 ?auto_54518 ) ) ( not ( = ?auto_54515 ?auto_54519 ) ) ( not ( = ?auto_54516 ?auto_54517 ) ) ( not ( = ?auto_54516 ?auto_54518 ) ) ( not ( = ?auto_54516 ?auto_54519 ) ) ( not ( = ?auto_54517 ?auto_54518 ) ) ( not ( = ?auto_54517 ?auto_54519 ) ) ( not ( = ?auto_54518 ?auto_54519 ) ) ( ON ?auto_54519 ?auto_54520 ) ( not ( = ?auto_54514 ?auto_54520 ) ) ( not ( = ?auto_54515 ?auto_54520 ) ) ( not ( = ?auto_54516 ?auto_54520 ) ) ( not ( = ?auto_54517 ?auto_54520 ) ) ( not ( = ?auto_54518 ?auto_54520 ) ) ( not ( = ?auto_54519 ?auto_54520 ) ) ( ON ?auto_54518 ?auto_54519 ) ( ON-TABLE ?auto_54520 ) ( ON ?auto_54517 ?auto_54518 ) ( ON ?auto_54516 ?auto_54517 ) ( ON ?auto_54515 ?auto_54516 ) ( ON ?auto_54514 ?auto_54515 ) ( CLEAR ?auto_54514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54520 ?auto_54519 ?auto_54518 ?auto_54517 ?auto_54516 ?auto_54515 )
      ( MAKE-5PILE ?auto_54514 ?auto_54515 ?auto_54516 ?auto_54517 ?auto_54518 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54522 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_54522 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_54522 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54523 - BLOCK
    )
    :vars
    (
      ?auto_54524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54523 ?auto_54524 ) ( CLEAR ?auto_54523 ) ( HAND-EMPTY ) ( not ( = ?auto_54523 ?auto_54524 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54523 ?auto_54524 )
      ( MAKE-1PILE ?auto_54523 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54525 - BLOCK
    )
    :vars
    (
      ?auto_54526 - BLOCK
      ?auto_54530 - BLOCK
      ?auto_54527 - BLOCK
      ?auto_54529 - BLOCK
      ?auto_54528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54525 ?auto_54526 ) ) ( HOLDING ?auto_54525 ) ( CLEAR ?auto_54526 ) ( ON-TABLE ?auto_54530 ) ( ON ?auto_54527 ?auto_54530 ) ( ON ?auto_54529 ?auto_54527 ) ( ON ?auto_54528 ?auto_54529 ) ( ON ?auto_54526 ?auto_54528 ) ( not ( = ?auto_54530 ?auto_54527 ) ) ( not ( = ?auto_54530 ?auto_54529 ) ) ( not ( = ?auto_54530 ?auto_54528 ) ) ( not ( = ?auto_54530 ?auto_54526 ) ) ( not ( = ?auto_54530 ?auto_54525 ) ) ( not ( = ?auto_54527 ?auto_54529 ) ) ( not ( = ?auto_54527 ?auto_54528 ) ) ( not ( = ?auto_54527 ?auto_54526 ) ) ( not ( = ?auto_54527 ?auto_54525 ) ) ( not ( = ?auto_54529 ?auto_54528 ) ) ( not ( = ?auto_54529 ?auto_54526 ) ) ( not ( = ?auto_54529 ?auto_54525 ) ) ( not ( = ?auto_54528 ?auto_54526 ) ) ( not ( = ?auto_54528 ?auto_54525 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54530 ?auto_54527 ?auto_54529 ?auto_54528 ?auto_54526 ?auto_54525 )
      ( MAKE-1PILE ?auto_54525 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54531 - BLOCK
    )
    :vars
    (
      ?auto_54532 - BLOCK
      ?auto_54534 - BLOCK
      ?auto_54533 - BLOCK
      ?auto_54536 - BLOCK
      ?auto_54535 - BLOCK
      ?auto_54537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54531 ?auto_54532 ) ) ( CLEAR ?auto_54532 ) ( ON-TABLE ?auto_54534 ) ( ON ?auto_54533 ?auto_54534 ) ( ON ?auto_54536 ?auto_54533 ) ( ON ?auto_54535 ?auto_54536 ) ( ON ?auto_54532 ?auto_54535 ) ( not ( = ?auto_54534 ?auto_54533 ) ) ( not ( = ?auto_54534 ?auto_54536 ) ) ( not ( = ?auto_54534 ?auto_54535 ) ) ( not ( = ?auto_54534 ?auto_54532 ) ) ( not ( = ?auto_54534 ?auto_54531 ) ) ( not ( = ?auto_54533 ?auto_54536 ) ) ( not ( = ?auto_54533 ?auto_54535 ) ) ( not ( = ?auto_54533 ?auto_54532 ) ) ( not ( = ?auto_54533 ?auto_54531 ) ) ( not ( = ?auto_54536 ?auto_54535 ) ) ( not ( = ?auto_54536 ?auto_54532 ) ) ( not ( = ?auto_54536 ?auto_54531 ) ) ( not ( = ?auto_54535 ?auto_54532 ) ) ( not ( = ?auto_54535 ?auto_54531 ) ) ( ON ?auto_54531 ?auto_54537 ) ( CLEAR ?auto_54531 ) ( HAND-EMPTY ) ( not ( = ?auto_54531 ?auto_54537 ) ) ( not ( = ?auto_54532 ?auto_54537 ) ) ( not ( = ?auto_54534 ?auto_54537 ) ) ( not ( = ?auto_54533 ?auto_54537 ) ) ( not ( = ?auto_54536 ?auto_54537 ) ) ( not ( = ?auto_54535 ?auto_54537 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54531 ?auto_54537 )
      ( MAKE-1PILE ?auto_54531 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54538 - BLOCK
    )
    :vars
    (
      ?auto_54540 - BLOCK
      ?auto_54541 - BLOCK
      ?auto_54539 - BLOCK
      ?auto_54543 - BLOCK
      ?auto_54542 - BLOCK
      ?auto_54544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54538 ?auto_54540 ) ) ( ON-TABLE ?auto_54541 ) ( ON ?auto_54539 ?auto_54541 ) ( ON ?auto_54543 ?auto_54539 ) ( ON ?auto_54542 ?auto_54543 ) ( not ( = ?auto_54541 ?auto_54539 ) ) ( not ( = ?auto_54541 ?auto_54543 ) ) ( not ( = ?auto_54541 ?auto_54542 ) ) ( not ( = ?auto_54541 ?auto_54540 ) ) ( not ( = ?auto_54541 ?auto_54538 ) ) ( not ( = ?auto_54539 ?auto_54543 ) ) ( not ( = ?auto_54539 ?auto_54542 ) ) ( not ( = ?auto_54539 ?auto_54540 ) ) ( not ( = ?auto_54539 ?auto_54538 ) ) ( not ( = ?auto_54543 ?auto_54542 ) ) ( not ( = ?auto_54543 ?auto_54540 ) ) ( not ( = ?auto_54543 ?auto_54538 ) ) ( not ( = ?auto_54542 ?auto_54540 ) ) ( not ( = ?auto_54542 ?auto_54538 ) ) ( ON ?auto_54538 ?auto_54544 ) ( CLEAR ?auto_54538 ) ( not ( = ?auto_54538 ?auto_54544 ) ) ( not ( = ?auto_54540 ?auto_54544 ) ) ( not ( = ?auto_54541 ?auto_54544 ) ) ( not ( = ?auto_54539 ?auto_54544 ) ) ( not ( = ?auto_54543 ?auto_54544 ) ) ( not ( = ?auto_54542 ?auto_54544 ) ) ( HOLDING ?auto_54540 ) ( CLEAR ?auto_54542 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54541 ?auto_54539 ?auto_54543 ?auto_54542 ?auto_54540 )
      ( MAKE-1PILE ?auto_54538 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54545 - BLOCK
    )
    :vars
    (
      ?auto_54548 - BLOCK
      ?auto_54551 - BLOCK
      ?auto_54549 - BLOCK
      ?auto_54547 - BLOCK
      ?auto_54546 - BLOCK
      ?auto_54550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54545 ?auto_54548 ) ) ( ON-TABLE ?auto_54551 ) ( ON ?auto_54549 ?auto_54551 ) ( ON ?auto_54547 ?auto_54549 ) ( ON ?auto_54546 ?auto_54547 ) ( not ( = ?auto_54551 ?auto_54549 ) ) ( not ( = ?auto_54551 ?auto_54547 ) ) ( not ( = ?auto_54551 ?auto_54546 ) ) ( not ( = ?auto_54551 ?auto_54548 ) ) ( not ( = ?auto_54551 ?auto_54545 ) ) ( not ( = ?auto_54549 ?auto_54547 ) ) ( not ( = ?auto_54549 ?auto_54546 ) ) ( not ( = ?auto_54549 ?auto_54548 ) ) ( not ( = ?auto_54549 ?auto_54545 ) ) ( not ( = ?auto_54547 ?auto_54546 ) ) ( not ( = ?auto_54547 ?auto_54548 ) ) ( not ( = ?auto_54547 ?auto_54545 ) ) ( not ( = ?auto_54546 ?auto_54548 ) ) ( not ( = ?auto_54546 ?auto_54545 ) ) ( ON ?auto_54545 ?auto_54550 ) ( not ( = ?auto_54545 ?auto_54550 ) ) ( not ( = ?auto_54548 ?auto_54550 ) ) ( not ( = ?auto_54551 ?auto_54550 ) ) ( not ( = ?auto_54549 ?auto_54550 ) ) ( not ( = ?auto_54547 ?auto_54550 ) ) ( not ( = ?auto_54546 ?auto_54550 ) ) ( CLEAR ?auto_54546 ) ( ON ?auto_54548 ?auto_54545 ) ( CLEAR ?auto_54548 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54550 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54550 ?auto_54545 )
      ( MAKE-1PILE ?auto_54545 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54552 - BLOCK
    )
    :vars
    (
      ?auto_54557 - BLOCK
      ?auto_54554 - BLOCK
      ?auto_54558 - BLOCK
      ?auto_54556 - BLOCK
      ?auto_54555 - BLOCK
      ?auto_54553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54552 ?auto_54557 ) ) ( ON-TABLE ?auto_54554 ) ( ON ?auto_54558 ?auto_54554 ) ( ON ?auto_54556 ?auto_54558 ) ( not ( = ?auto_54554 ?auto_54558 ) ) ( not ( = ?auto_54554 ?auto_54556 ) ) ( not ( = ?auto_54554 ?auto_54555 ) ) ( not ( = ?auto_54554 ?auto_54557 ) ) ( not ( = ?auto_54554 ?auto_54552 ) ) ( not ( = ?auto_54558 ?auto_54556 ) ) ( not ( = ?auto_54558 ?auto_54555 ) ) ( not ( = ?auto_54558 ?auto_54557 ) ) ( not ( = ?auto_54558 ?auto_54552 ) ) ( not ( = ?auto_54556 ?auto_54555 ) ) ( not ( = ?auto_54556 ?auto_54557 ) ) ( not ( = ?auto_54556 ?auto_54552 ) ) ( not ( = ?auto_54555 ?auto_54557 ) ) ( not ( = ?auto_54555 ?auto_54552 ) ) ( ON ?auto_54552 ?auto_54553 ) ( not ( = ?auto_54552 ?auto_54553 ) ) ( not ( = ?auto_54557 ?auto_54553 ) ) ( not ( = ?auto_54554 ?auto_54553 ) ) ( not ( = ?auto_54558 ?auto_54553 ) ) ( not ( = ?auto_54556 ?auto_54553 ) ) ( not ( = ?auto_54555 ?auto_54553 ) ) ( ON ?auto_54557 ?auto_54552 ) ( CLEAR ?auto_54557 ) ( ON-TABLE ?auto_54553 ) ( HOLDING ?auto_54555 ) ( CLEAR ?auto_54556 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54554 ?auto_54558 ?auto_54556 ?auto_54555 )
      ( MAKE-1PILE ?auto_54552 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54559 - BLOCK
    )
    :vars
    (
      ?auto_54563 - BLOCK
      ?auto_54562 - BLOCK
      ?auto_54560 - BLOCK
      ?auto_54561 - BLOCK
      ?auto_54565 - BLOCK
      ?auto_54564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54559 ?auto_54563 ) ) ( ON-TABLE ?auto_54562 ) ( ON ?auto_54560 ?auto_54562 ) ( ON ?auto_54561 ?auto_54560 ) ( not ( = ?auto_54562 ?auto_54560 ) ) ( not ( = ?auto_54562 ?auto_54561 ) ) ( not ( = ?auto_54562 ?auto_54565 ) ) ( not ( = ?auto_54562 ?auto_54563 ) ) ( not ( = ?auto_54562 ?auto_54559 ) ) ( not ( = ?auto_54560 ?auto_54561 ) ) ( not ( = ?auto_54560 ?auto_54565 ) ) ( not ( = ?auto_54560 ?auto_54563 ) ) ( not ( = ?auto_54560 ?auto_54559 ) ) ( not ( = ?auto_54561 ?auto_54565 ) ) ( not ( = ?auto_54561 ?auto_54563 ) ) ( not ( = ?auto_54561 ?auto_54559 ) ) ( not ( = ?auto_54565 ?auto_54563 ) ) ( not ( = ?auto_54565 ?auto_54559 ) ) ( ON ?auto_54559 ?auto_54564 ) ( not ( = ?auto_54559 ?auto_54564 ) ) ( not ( = ?auto_54563 ?auto_54564 ) ) ( not ( = ?auto_54562 ?auto_54564 ) ) ( not ( = ?auto_54560 ?auto_54564 ) ) ( not ( = ?auto_54561 ?auto_54564 ) ) ( not ( = ?auto_54565 ?auto_54564 ) ) ( ON ?auto_54563 ?auto_54559 ) ( ON-TABLE ?auto_54564 ) ( CLEAR ?auto_54561 ) ( ON ?auto_54565 ?auto_54563 ) ( CLEAR ?auto_54565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54564 ?auto_54559 ?auto_54563 )
      ( MAKE-1PILE ?auto_54559 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54566 - BLOCK
    )
    :vars
    (
      ?auto_54567 - BLOCK
      ?auto_54572 - BLOCK
      ?auto_54571 - BLOCK
      ?auto_54568 - BLOCK
      ?auto_54569 - BLOCK
      ?auto_54570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54566 ?auto_54567 ) ) ( ON-TABLE ?auto_54572 ) ( ON ?auto_54571 ?auto_54572 ) ( not ( = ?auto_54572 ?auto_54571 ) ) ( not ( = ?auto_54572 ?auto_54568 ) ) ( not ( = ?auto_54572 ?auto_54569 ) ) ( not ( = ?auto_54572 ?auto_54567 ) ) ( not ( = ?auto_54572 ?auto_54566 ) ) ( not ( = ?auto_54571 ?auto_54568 ) ) ( not ( = ?auto_54571 ?auto_54569 ) ) ( not ( = ?auto_54571 ?auto_54567 ) ) ( not ( = ?auto_54571 ?auto_54566 ) ) ( not ( = ?auto_54568 ?auto_54569 ) ) ( not ( = ?auto_54568 ?auto_54567 ) ) ( not ( = ?auto_54568 ?auto_54566 ) ) ( not ( = ?auto_54569 ?auto_54567 ) ) ( not ( = ?auto_54569 ?auto_54566 ) ) ( ON ?auto_54566 ?auto_54570 ) ( not ( = ?auto_54566 ?auto_54570 ) ) ( not ( = ?auto_54567 ?auto_54570 ) ) ( not ( = ?auto_54572 ?auto_54570 ) ) ( not ( = ?auto_54571 ?auto_54570 ) ) ( not ( = ?auto_54568 ?auto_54570 ) ) ( not ( = ?auto_54569 ?auto_54570 ) ) ( ON ?auto_54567 ?auto_54566 ) ( ON-TABLE ?auto_54570 ) ( ON ?auto_54569 ?auto_54567 ) ( CLEAR ?auto_54569 ) ( HOLDING ?auto_54568 ) ( CLEAR ?auto_54571 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54572 ?auto_54571 ?auto_54568 )
      ( MAKE-1PILE ?auto_54566 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54573 - BLOCK
    )
    :vars
    (
      ?auto_54579 - BLOCK
      ?auto_54576 - BLOCK
      ?auto_54577 - BLOCK
      ?auto_54575 - BLOCK
      ?auto_54574 - BLOCK
      ?auto_54578 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54573 ?auto_54579 ) ) ( ON-TABLE ?auto_54576 ) ( ON ?auto_54577 ?auto_54576 ) ( not ( = ?auto_54576 ?auto_54577 ) ) ( not ( = ?auto_54576 ?auto_54575 ) ) ( not ( = ?auto_54576 ?auto_54574 ) ) ( not ( = ?auto_54576 ?auto_54579 ) ) ( not ( = ?auto_54576 ?auto_54573 ) ) ( not ( = ?auto_54577 ?auto_54575 ) ) ( not ( = ?auto_54577 ?auto_54574 ) ) ( not ( = ?auto_54577 ?auto_54579 ) ) ( not ( = ?auto_54577 ?auto_54573 ) ) ( not ( = ?auto_54575 ?auto_54574 ) ) ( not ( = ?auto_54575 ?auto_54579 ) ) ( not ( = ?auto_54575 ?auto_54573 ) ) ( not ( = ?auto_54574 ?auto_54579 ) ) ( not ( = ?auto_54574 ?auto_54573 ) ) ( ON ?auto_54573 ?auto_54578 ) ( not ( = ?auto_54573 ?auto_54578 ) ) ( not ( = ?auto_54579 ?auto_54578 ) ) ( not ( = ?auto_54576 ?auto_54578 ) ) ( not ( = ?auto_54577 ?auto_54578 ) ) ( not ( = ?auto_54575 ?auto_54578 ) ) ( not ( = ?auto_54574 ?auto_54578 ) ) ( ON ?auto_54579 ?auto_54573 ) ( ON-TABLE ?auto_54578 ) ( ON ?auto_54574 ?auto_54579 ) ( CLEAR ?auto_54577 ) ( ON ?auto_54575 ?auto_54574 ) ( CLEAR ?auto_54575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54578 ?auto_54573 ?auto_54579 ?auto_54574 )
      ( MAKE-1PILE ?auto_54573 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54580 - BLOCK
    )
    :vars
    (
      ?auto_54586 - BLOCK
      ?auto_54584 - BLOCK
      ?auto_54582 - BLOCK
      ?auto_54583 - BLOCK
      ?auto_54581 - BLOCK
      ?auto_54585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54580 ?auto_54586 ) ) ( ON-TABLE ?auto_54584 ) ( not ( = ?auto_54584 ?auto_54582 ) ) ( not ( = ?auto_54584 ?auto_54583 ) ) ( not ( = ?auto_54584 ?auto_54581 ) ) ( not ( = ?auto_54584 ?auto_54586 ) ) ( not ( = ?auto_54584 ?auto_54580 ) ) ( not ( = ?auto_54582 ?auto_54583 ) ) ( not ( = ?auto_54582 ?auto_54581 ) ) ( not ( = ?auto_54582 ?auto_54586 ) ) ( not ( = ?auto_54582 ?auto_54580 ) ) ( not ( = ?auto_54583 ?auto_54581 ) ) ( not ( = ?auto_54583 ?auto_54586 ) ) ( not ( = ?auto_54583 ?auto_54580 ) ) ( not ( = ?auto_54581 ?auto_54586 ) ) ( not ( = ?auto_54581 ?auto_54580 ) ) ( ON ?auto_54580 ?auto_54585 ) ( not ( = ?auto_54580 ?auto_54585 ) ) ( not ( = ?auto_54586 ?auto_54585 ) ) ( not ( = ?auto_54584 ?auto_54585 ) ) ( not ( = ?auto_54582 ?auto_54585 ) ) ( not ( = ?auto_54583 ?auto_54585 ) ) ( not ( = ?auto_54581 ?auto_54585 ) ) ( ON ?auto_54586 ?auto_54580 ) ( ON-TABLE ?auto_54585 ) ( ON ?auto_54581 ?auto_54586 ) ( ON ?auto_54583 ?auto_54581 ) ( CLEAR ?auto_54583 ) ( HOLDING ?auto_54582 ) ( CLEAR ?auto_54584 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54584 ?auto_54582 )
      ( MAKE-1PILE ?auto_54580 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54587 - BLOCK
    )
    :vars
    (
      ?auto_54593 - BLOCK
      ?auto_54589 - BLOCK
      ?auto_54592 - BLOCK
      ?auto_54590 - BLOCK
      ?auto_54588 - BLOCK
      ?auto_54591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54587 ?auto_54593 ) ) ( ON-TABLE ?auto_54589 ) ( not ( = ?auto_54589 ?auto_54592 ) ) ( not ( = ?auto_54589 ?auto_54590 ) ) ( not ( = ?auto_54589 ?auto_54588 ) ) ( not ( = ?auto_54589 ?auto_54593 ) ) ( not ( = ?auto_54589 ?auto_54587 ) ) ( not ( = ?auto_54592 ?auto_54590 ) ) ( not ( = ?auto_54592 ?auto_54588 ) ) ( not ( = ?auto_54592 ?auto_54593 ) ) ( not ( = ?auto_54592 ?auto_54587 ) ) ( not ( = ?auto_54590 ?auto_54588 ) ) ( not ( = ?auto_54590 ?auto_54593 ) ) ( not ( = ?auto_54590 ?auto_54587 ) ) ( not ( = ?auto_54588 ?auto_54593 ) ) ( not ( = ?auto_54588 ?auto_54587 ) ) ( ON ?auto_54587 ?auto_54591 ) ( not ( = ?auto_54587 ?auto_54591 ) ) ( not ( = ?auto_54593 ?auto_54591 ) ) ( not ( = ?auto_54589 ?auto_54591 ) ) ( not ( = ?auto_54592 ?auto_54591 ) ) ( not ( = ?auto_54590 ?auto_54591 ) ) ( not ( = ?auto_54588 ?auto_54591 ) ) ( ON ?auto_54593 ?auto_54587 ) ( ON-TABLE ?auto_54591 ) ( ON ?auto_54588 ?auto_54593 ) ( ON ?auto_54590 ?auto_54588 ) ( CLEAR ?auto_54589 ) ( ON ?auto_54592 ?auto_54590 ) ( CLEAR ?auto_54592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54591 ?auto_54587 ?auto_54593 ?auto_54588 ?auto_54590 )
      ( MAKE-1PILE ?auto_54587 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54594 - BLOCK
    )
    :vars
    (
      ?auto_54595 - BLOCK
      ?auto_54597 - BLOCK
      ?auto_54599 - BLOCK
      ?auto_54598 - BLOCK
      ?auto_54600 - BLOCK
      ?auto_54596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54594 ?auto_54595 ) ) ( not ( = ?auto_54597 ?auto_54599 ) ) ( not ( = ?auto_54597 ?auto_54598 ) ) ( not ( = ?auto_54597 ?auto_54600 ) ) ( not ( = ?auto_54597 ?auto_54595 ) ) ( not ( = ?auto_54597 ?auto_54594 ) ) ( not ( = ?auto_54599 ?auto_54598 ) ) ( not ( = ?auto_54599 ?auto_54600 ) ) ( not ( = ?auto_54599 ?auto_54595 ) ) ( not ( = ?auto_54599 ?auto_54594 ) ) ( not ( = ?auto_54598 ?auto_54600 ) ) ( not ( = ?auto_54598 ?auto_54595 ) ) ( not ( = ?auto_54598 ?auto_54594 ) ) ( not ( = ?auto_54600 ?auto_54595 ) ) ( not ( = ?auto_54600 ?auto_54594 ) ) ( ON ?auto_54594 ?auto_54596 ) ( not ( = ?auto_54594 ?auto_54596 ) ) ( not ( = ?auto_54595 ?auto_54596 ) ) ( not ( = ?auto_54597 ?auto_54596 ) ) ( not ( = ?auto_54599 ?auto_54596 ) ) ( not ( = ?auto_54598 ?auto_54596 ) ) ( not ( = ?auto_54600 ?auto_54596 ) ) ( ON ?auto_54595 ?auto_54594 ) ( ON-TABLE ?auto_54596 ) ( ON ?auto_54600 ?auto_54595 ) ( ON ?auto_54598 ?auto_54600 ) ( ON ?auto_54599 ?auto_54598 ) ( CLEAR ?auto_54599 ) ( HOLDING ?auto_54597 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54597 )
      ( MAKE-1PILE ?auto_54594 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54601 - BLOCK
    )
    :vars
    (
      ?auto_54607 - BLOCK
      ?auto_54605 - BLOCK
      ?auto_54606 - BLOCK
      ?auto_54603 - BLOCK
      ?auto_54604 - BLOCK
      ?auto_54602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54601 ?auto_54607 ) ) ( not ( = ?auto_54605 ?auto_54606 ) ) ( not ( = ?auto_54605 ?auto_54603 ) ) ( not ( = ?auto_54605 ?auto_54604 ) ) ( not ( = ?auto_54605 ?auto_54607 ) ) ( not ( = ?auto_54605 ?auto_54601 ) ) ( not ( = ?auto_54606 ?auto_54603 ) ) ( not ( = ?auto_54606 ?auto_54604 ) ) ( not ( = ?auto_54606 ?auto_54607 ) ) ( not ( = ?auto_54606 ?auto_54601 ) ) ( not ( = ?auto_54603 ?auto_54604 ) ) ( not ( = ?auto_54603 ?auto_54607 ) ) ( not ( = ?auto_54603 ?auto_54601 ) ) ( not ( = ?auto_54604 ?auto_54607 ) ) ( not ( = ?auto_54604 ?auto_54601 ) ) ( ON ?auto_54601 ?auto_54602 ) ( not ( = ?auto_54601 ?auto_54602 ) ) ( not ( = ?auto_54607 ?auto_54602 ) ) ( not ( = ?auto_54605 ?auto_54602 ) ) ( not ( = ?auto_54606 ?auto_54602 ) ) ( not ( = ?auto_54603 ?auto_54602 ) ) ( not ( = ?auto_54604 ?auto_54602 ) ) ( ON ?auto_54607 ?auto_54601 ) ( ON-TABLE ?auto_54602 ) ( ON ?auto_54604 ?auto_54607 ) ( ON ?auto_54603 ?auto_54604 ) ( ON ?auto_54606 ?auto_54603 ) ( ON ?auto_54605 ?auto_54606 ) ( CLEAR ?auto_54605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54602 ?auto_54601 ?auto_54607 ?auto_54604 ?auto_54603 ?auto_54606 )
      ( MAKE-1PILE ?auto_54601 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54612 - BLOCK
      ?auto_54613 - BLOCK
      ?auto_54614 - BLOCK
      ?auto_54615 - BLOCK
    )
    :vars
    (
      ?auto_54616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54616 ?auto_54615 ) ( CLEAR ?auto_54616 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54612 ) ( ON ?auto_54613 ?auto_54612 ) ( ON ?auto_54614 ?auto_54613 ) ( ON ?auto_54615 ?auto_54614 ) ( not ( = ?auto_54612 ?auto_54613 ) ) ( not ( = ?auto_54612 ?auto_54614 ) ) ( not ( = ?auto_54612 ?auto_54615 ) ) ( not ( = ?auto_54612 ?auto_54616 ) ) ( not ( = ?auto_54613 ?auto_54614 ) ) ( not ( = ?auto_54613 ?auto_54615 ) ) ( not ( = ?auto_54613 ?auto_54616 ) ) ( not ( = ?auto_54614 ?auto_54615 ) ) ( not ( = ?auto_54614 ?auto_54616 ) ) ( not ( = ?auto_54615 ?auto_54616 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54616 ?auto_54615 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54617 - BLOCK
      ?auto_54618 - BLOCK
      ?auto_54619 - BLOCK
      ?auto_54620 - BLOCK
    )
    :vars
    (
      ?auto_54621 - BLOCK
      ?auto_54622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54621 ?auto_54620 ) ( CLEAR ?auto_54621 ) ( ON-TABLE ?auto_54617 ) ( ON ?auto_54618 ?auto_54617 ) ( ON ?auto_54619 ?auto_54618 ) ( ON ?auto_54620 ?auto_54619 ) ( not ( = ?auto_54617 ?auto_54618 ) ) ( not ( = ?auto_54617 ?auto_54619 ) ) ( not ( = ?auto_54617 ?auto_54620 ) ) ( not ( = ?auto_54617 ?auto_54621 ) ) ( not ( = ?auto_54618 ?auto_54619 ) ) ( not ( = ?auto_54618 ?auto_54620 ) ) ( not ( = ?auto_54618 ?auto_54621 ) ) ( not ( = ?auto_54619 ?auto_54620 ) ) ( not ( = ?auto_54619 ?auto_54621 ) ) ( not ( = ?auto_54620 ?auto_54621 ) ) ( HOLDING ?auto_54622 ) ( not ( = ?auto_54617 ?auto_54622 ) ) ( not ( = ?auto_54618 ?auto_54622 ) ) ( not ( = ?auto_54619 ?auto_54622 ) ) ( not ( = ?auto_54620 ?auto_54622 ) ) ( not ( = ?auto_54621 ?auto_54622 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_54622 )
      ( MAKE-4PILE ?auto_54617 ?auto_54618 ?auto_54619 ?auto_54620 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54623 - BLOCK
      ?auto_54624 - BLOCK
      ?auto_54625 - BLOCK
      ?auto_54626 - BLOCK
    )
    :vars
    (
      ?auto_54628 - BLOCK
      ?auto_54627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54628 ?auto_54626 ) ( ON-TABLE ?auto_54623 ) ( ON ?auto_54624 ?auto_54623 ) ( ON ?auto_54625 ?auto_54624 ) ( ON ?auto_54626 ?auto_54625 ) ( not ( = ?auto_54623 ?auto_54624 ) ) ( not ( = ?auto_54623 ?auto_54625 ) ) ( not ( = ?auto_54623 ?auto_54626 ) ) ( not ( = ?auto_54623 ?auto_54628 ) ) ( not ( = ?auto_54624 ?auto_54625 ) ) ( not ( = ?auto_54624 ?auto_54626 ) ) ( not ( = ?auto_54624 ?auto_54628 ) ) ( not ( = ?auto_54625 ?auto_54626 ) ) ( not ( = ?auto_54625 ?auto_54628 ) ) ( not ( = ?auto_54626 ?auto_54628 ) ) ( not ( = ?auto_54623 ?auto_54627 ) ) ( not ( = ?auto_54624 ?auto_54627 ) ) ( not ( = ?auto_54625 ?auto_54627 ) ) ( not ( = ?auto_54626 ?auto_54627 ) ) ( not ( = ?auto_54628 ?auto_54627 ) ) ( ON ?auto_54627 ?auto_54628 ) ( CLEAR ?auto_54627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54623 ?auto_54624 ?auto_54625 ?auto_54626 ?auto_54628 )
      ( MAKE-4PILE ?auto_54623 ?auto_54624 ?auto_54625 ?auto_54626 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54629 - BLOCK
      ?auto_54630 - BLOCK
      ?auto_54631 - BLOCK
      ?auto_54632 - BLOCK
    )
    :vars
    (
      ?auto_54633 - BLOCK
      ?auto_54634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54633 ?auto_54632 ) ( ON-TABLE ?auto_54629 ) ( ON ?auto_54630 ?auto_54629 ) ( ON ?auto_54631 ?auto_54630 ) ( ON ?auto_54632 ?auto_54631 ) ( not ( = ?auto_54629 ?auto_54630 ) ) ( not ( = ?auto_54629 ?auto_54631 ) ) ( not ( = ?auto_54629 ?auto_54632 ) ) ( not ( = ?auto_54629 ?auto_54633 ) ) ( not ( = ?auto_54630 ?auto_54631 ) ) ( not ( = ?auto_54630 ?auto_54632 ) ) ( not ( = ?auto_54630 ?auto_54633 ) ) ( not ( = ?auto_54631 ?auto_54632 ) ) ( not ( = ?auto_54631 ?auto_54633 ) ) ( not ( = ?auto_54632 ?auto_54633 ) ) ( not ( = ?auto_54629 ?auto_54634 ) ) ( not ( = ?auto_54630 ?auto_54634 ) ) ( not ( = ?auto_54631 ?auto_54634 ) ) ( not ( = ?auto_54632 ?auto_54634 ) ) ( not ( = ?auto_54633 ?auto_54634 ) ) ( HOLDING ?auto_54634 ) ( CLEAR ?auto_54633 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54629 ?auto_54630 ?auto_54631 ?auto_54632 ?auto_54633 ?auto_54634 )
      ( MAKE-4PILE ?auto_54629 ?auto_54630 ?auto_54631 ?auto_54632 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54635 - BLOCK
      ?auto_54636 - BLOCK
      ?auto_54637 - BLOCK
      ?auto_54638 - BLOCK
    )
    :vars
    (
      ?auto_54639 - BLOCK
      ?auto_54640 - BLOCK
      ?auto_54641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54639 ?auto_54638 ) ( ON-TABLE ?auto_54635 ) ( ON ?auto_54636 ?auto_54635 ) ( ON ?auto_54637 ?auto_54636 ) ( ON ?auto_54638 ?auto_54637 ) ( not ( = ?auto_54635 ?auto_54636 ) ) ( not ( = ?auto_54635 ?auto_54637 ) ) ( not ( = ?auto_54635 ?auto_54638 ) ) ( not ( = ?auto_54635 ?auto_54639 ) ) ( not ( = ?auto_54636 ?auto_54637 ) ) ( not ( = ?auto_54636 ?auto_54638 ) ) ( not ( = ?auto_54636 ?auto_54639 ) ) ( not ( = ?auto_54637 ?auto_54638 ) ) ( not ( = ?auto_54637 ?auto_54639 ) ) ( not ( = ?auto_54638 ?auto_54639 ) ) ( not ( = ?auto_54635 ?auto_54640 ) ) ( not ( = ?auto_54636 ?auto_54640 ) ) ( not ( = ?auto_54637 ?auto_54640 ) ) ( not ( = ?auto_54638 ?auto_54640 ) ) ( not ( = ?auto_54639 ?auto_54640 ) ) ( CLEAR ?auto_54639 ) ( ON ?auto_54640 ?auto_54641 ) ( CLEAR ?auto_54640 ) ( HAND-EMPTY ) ( not ( = ?auto_54635 ?auto_54641 ) ) ( not ( = ?auto_54636 ?auto_54641 ) ) ( not ( = ?auto_54637 ?auto_54641 ) ) ( not ( = ?auto_54638 ?auto_54641 ) ) ( not ( = ?auto_54639 ?auto_54641 ) ) ( not ( = ?auto_54640 ?auto_54641 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54640 ?auto_54641 )
      ( MAKE-4PILE ?auto_54635 ?auto_54636 ?auto_54637 ?auto_54638 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54656 - BLOCK
      ?auto_54657 - BLOCK
      ?auto_54658 - BLOCK
      ?auto_54659 - BLOCK
    )
    :vars
    (
      ?auto_54661 - BLOCK
      ?auto_54660 - BLOCK
      ?auto_54662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54656 ) ( ON ?auto_54657 ?auto_54656 ) ( ON ?auto_54658 ?auto_54657 ) ( not ( = ?auto_54656 ?auto_54657 ) ) ( not ( = ?auto_54656 ?auto_54658 ) ) ( not ( = ?auto_54656 ?auto_54659 ) ) ( not ( = ?auto_54656 ?auto_54661 ) ) ( not ( = ?auto_54657 ?auto_54658 ) ) ( not ( = ?auto_54657 ?auto_54659 ) ) ( not ( = ?auto_54657 ?auto_54661 ) ) ( not ( = ?auto_54658 ?auto_54659 ) ) ( not ( = ?auto_54658 ?auto_54661 ) ) ( not ( = ?auto_54659 ?auto_54661 ) ) ( not ( = ?auto_54656 ?auto_54660 ) ) ( not ( = ?auto_54657 ?auto_54660 ) ) ( not ( = ?auto_54658 ?auto_54660 ) ) ( not ( = ?auto_54659 ?auto_54660 ) ) ( not ( = ?auto_54661 ?auto_54660 ) ) ( ON ?auto_54660 ?auto_54662 ) ( not ( = ?auto_54656 ?auto_54662 ) ) ( not ( = ?auto_54657 ?auto_54662 ) ) ( not ( = ?auto_54658 ?auto_54662 ) ) ( not ( = ?auto_54659 ?auto_54662 ) ) ( not ( = ?auto_54661 ?auto_54662 ) ) ( not ( = ?auto_54660 ?auto_54662 ) ) ( ON ?auto_54661 ?auto_54660 ) ( CLEAR ?auto_54661 ) ( HOLDING ?auto_54659 ) ( CLEAR ?auto_54658 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54656 ?auto_54657 ?auto_54658 ?auto_54659 ?auto_54661 )
      ( MAKE-4PILE ?auto_54656 ?auto_54657 ?auto_54658 ?auto_54659 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54663 - BLOCK
      ?auto_54664 - BLOCK
      ?auto_54665 - BLOCK
      ?auto_54666 - BLOCK
    )
    :vars
    (
      ?auto_54667 - BLOCK
      ?auto_54669 - BLOCK
      ?auto_54668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54663 ) ( ON ?auto_54664 ?auto_54663 ) ( ON ?auto_54665 ?auto_54664 ) ( not ( = ?auto_54663 ?auto_54664 ) ) ( not ( = ?auto_54663 ?auto_54665 ) ) ( not ( = ?auto_54663 ?auto_54666 ) ) ( not ( = ?auto_54663 ?auto_54667 ) ) ( not ( = ?auto_54664 ?auto_54665 ) ) ( not ( = ?auto_54664 ?auto_54666 ) ) ( not ( = ?auto_54664 ?auto_54667 ) ) ( not ( = ?auto_54665 ?auto_54666 ) ) ( not ( = ?auto_54665 ?auto_54667 ) ) ( not ( = ?auto_54666 ?auto_54667 ) ) ( not ( = ?auto_54663 ?auto_54669 ) ) ( not ( = ?auto_54664 ?auto_54669 ) ) ( not ( = ?auto_54665 ?auto_54669 ) ) ( not ( = ?auto_54666 ?auto_54669 ) ) ( not ( = ?auto_54667 ?auto_54669 ) ) ( ON ?auto_54669 ?auto_54668 ) ( not ( = ?auto_54663 ?auto_54668 ) ) ( not ( = ?auto_54664 ?auto_54668 ) ) ( not ( = ?auto_54665 ?auto_54668 ) ) ( not ( = ?auto_54666 ?auto_54668 ) ) ( not ( = ?auto_54667 ?auto_54668 ) ) ( not ( = ?auto_54669 ?auto_54668 ) ) ( ON ?auto_54667 ?auto_54669 ) ( CLEAR ?auto_54665 ) ( ON ?auto_54666 ?auto_54667 ) ( CLEAR ?auto_54666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54668 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54668 ?auto_54669 ?auto_54667 )
      ( MAKE-4PILE ?auto_54663 ?auto_54664 ?auto_54665 ?auto_54666 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54670 - BLOCK
      ?auto_54671 - BLOCK
      ?auto_54672 - BLOCK
      ?auto_54673 - BLOCK
    )
    :vars
    (
      ?auto_54676 - BLOCK
      ?auto_54674 - BLOCK
      ?auto_54675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54670 ) ( ON ?auto_54671 ?auto_54670 ) ( not ( = ?auto_54670 ?auto_54671 ) ) ( not ( = ?auto_54670 ?auto_54672 ) ) ( not ( = ?auto_54670 ?auto_54673 ) ) ( not ( = ?auto_54670 ?auto_54676 ) ) ( not ( = ?auto_54671 ?auto_54672 ) ) ( not ( = ?auto_54671 ?auto_54673 ) ) ( not ( = ?auto_54671 ?auto_54676 ) ) ( not ( = ?auto_54672 ?auto_54673 ) ) ( not ( = ?auto_54672 ?auto_54676 ) ) ( not ( = ?auto_54673 ?auto_54676 ) ) ( not ( = ?auto_54670 ?auto_54674 ) ) ( not ( = ?auto_54671 ?auto_54674 ) ) ( not ( = ?auto_54672 ?auto_54674 ) ) ( not ( = ?auto_54673 ?auto_54674 ) ) ( not ( = ?auto_54676 ?auto_54674 ) ) ( ON ?auto_54674 ?auto_54675 ) ( not ( = ?auto_54670 ?auto_54675 ) ) ( not ( = ?auto_54671 ?auto_54675 ) ) ( not ( = ?auto_54672 ?auto_54675 ) ) ( not ( = ?auto_54673 ?auto_54675 ) ) ( not ( = ?auto_54676 ?auto_54675 ) ) ( not ( = ?auto_54674 ?auto_54675 ) ) ( ON ?auto_54676 ?auto_54674 ) ( ON ?auto_54673 ?auto_54676 ) ( CLEAR ?auto_54673 ) ( ON-TABLE ?auto_54675 ) ( HOLDING ?auto_54672 ) ( CLEAR ?auto_54671 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54670 ?auto_54671 ?auto_54672 )
      ( MAKE-4PILE ?auto_54670 ?auto_54671 ?auto_54672 ?auto_54673 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54677 - BLOCK
      ?auto_54678 - BLOCK
      ?auto_54679 - BLOCK
      ?auto_54680 - BLOCK
    )
    :vars
    (
      ?auto_54681 - BLOCK
      ?auto_54682 - BLOCK
      ?auto_54683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54677 ) ( ON ?auto_54678 ?auto_54677 ) ( not ( = ?auto_54677 ?auto_54678 ) ) ( not ( = ?auto_54677 ?auto_54679 ) ) ( not ( = ?auto_54677 ?auto_54680 ) ) ( not ( = ?auto_54677 ?auto_54681 ) ) ( not ( = ?auto_54678 ?auto_54679 ) ) ( not ( = ?auto_54678 ?auto_54680 ) ) ( not ( = ?auto_54678 ?auto_54681 ) ) ( not ( = ?auto_54679 ?auto_54680 ) ) ( not ( = ?auto_54679 ?auto_54681 ) ) ( not ( = ?auto_54680 ?auto_54681 ) ) ( not ( = ?auto_54677 ?auto_54682 ) ) ( not ( = ?auto_54678 ?auto_54682 ) ) ( not ( = ?auto_54679 ?auto_54682 ) ) ( not ( = ?auto_54680 ?auto_54682 ) ) ( not ( = ?auto_54681 ?auto_54682 ) ) ( ON ?auto_54682 ?auto_54683 ) ( not ( = ?auto_54677 ?auto_54683 ) ) ( not ( = ?auto_54678 ?auto_54683 ) ) ( not ( = ?auto_54679 ?auto_54683 ) ) ( not ( = ?auto_54680 ?auto_54683 ) ) ( not ( = ?auto_54681 ?auto_54683 ) ) ( not ( = ?auto_54682 ?auto_54683 ) ) ( ON ?auto_54681 ?auto_54682 ) ( ON ?auto_54680 ?auto_54681 ) ( ON-TABLE ?auto_54683 ) ( CLEAR ?auto_54678 ) ( ON ?auto_54679 ?auto_54680 ) ( CLEAR ?auto_54679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54683 ?auto_54682 ?auto_54681 ?auto_54680 )
      ( MAKE-4PILE ?auto_54677 ?auto_54678 ?auto_54679 ?auto_54680 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54684 - BLOCK
      ?auto_54685 - BLOCK
      ?auto_54686 - BLOCK
      ?auto_54687 - BLOCK
    )
    :vars
    (
      ?auto_54690 - BLOCK
      ?auto_54688 - BLOCK
      ?auto_54689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54684 ) ( not ( = ?auto_54684 ?auto_54685 ) ) ( not ( = ?auto_54684 ?auto_54686 ) ) ( not ( = ?auto_54684 ?auto_54687 ) ) ( not ( = ?auto_54684 ?auto_54690 ) ) ( not ( = ?auto_54685 ?auto_54686 ) ) ( not ( = ?auto_54685 ?auto_54687 ) ) ( not ( = ?auto_54685 ?auto_54690 ) ) ( not ( = ?auto_54686 ?auto_54687 ) ) ( not ( = ?auto_54686 ?auto_54690 ) ) ( not ( = ?auto_54687 ?auto_54690 ) ) ( not ( = ?auto_54684 ?auto_54688 ) ) ( not ( = ?auto_54685 ?auto_54688 ) ) ( not ( = ?auto_54686 ?auto_54688 ) ) ( not ( = ?auto_54687 ?auto_54688 ) ) ( not ( = ?auto_54690 ?auto_54688 ) ) ( ON ?auto_54688 ?auto_54689 ) ( not ( = ?auto_54684 ?auto_54689 ) ) ( not ( = ?auto_54685 ?auto_54689 ) ) ( not ( = ?auto_54686 ?auto_54689 ) ) ( not ( = ?auto_54687 ?auto_54689 ) ) ( not ( = ?auto_54690 ?auto_54689 ) ) ( not ( = ?auto_54688 ?auto_54689 ) ) ( ON ?auto_54690 ?auto_54688 ) ( ON ?auto_54687 ?auto_54690 ) ( ON-TABLE ?auto_54689 ) ( ON ?auto_54686 ?auto_54687 ) ( CLEAR ?auto_54686 ) ( HOLDING ?auto_54685 ) ( CLEAR ?auto_54684 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54684 ?auto_54685 )
      ( MAKE-4PILE ?auto_54684 ?auto_54685 ?auto_54686 ?auto_54687 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54691 - BLOCK
      ?auto_54692 - BLOCK
      ?auto_54693 - BLOCK
      ?auto_54694 - BLOCK
    )
    :vars
    (
      ?auto_54696 - BLOCK
      ?auto_54695 - BLOCK
      ?auto_54697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54691 ) ( not ( = ?auto_54691 ?auto_54692 ) ) ( not ( = ?auto_54691 ?auto_54693 ) ) ( not ( = ?auto_54691 ?auto_54694 ) ) ( not ( = ?auto_54691 ?auto_54696 ) ) ( not ( = ?auto_54692 ?auto_54693 ) ) ( not ( = ?auto_54692 ?auto_54694 ) ) ( not ( = ?auto_54692 ?auto_54696 ) ) ( not ( = ?auto_54693 ?auto_54694 ) ) ( not ( = ?auto_54693 ?auto_54696 ) ) ( not ( = ?auto_54694 ?auto_54696 ) ) ( not ( = ?auto_54691 ?auto_54695 ) ) ( not ( = ?auto_54692 ?auto_54695 ) ) ( not ( = ?auto_54693 ?auto_54695 ) ) ( not ( = ?auto_54694 ?auto_54695 ) ) ( not ( = ?auto_54696 ?auto_54695 ) ) ( ON ?auto_54695 ?auto_54697 ) ( not ( = ?auto_54691 ?auto_54697 ) ) ( not ( = ?auto_54692 ?auto_54697 ) ) ( not ( = ?auto_54693 ?auto_54697 ) ) ( not ( = ?auto_54694 ?auto_54697 ) ) ( not ( = ?auto_54696 ?auto_54697 ) ) ( not ( = ?auto_54695 ?auto_54697 ) ) ( ON ?auto_54696 ?auto_54695 ) ( ON ?auto_54694 ?auto_54696 ) ( ON-TABLE ?auto_54697 ) ( ON ?auto_54693 ?auto_54694 ) ( CLEAR ?auto_54691 ) ( ON ?auto_54692 ?auto_54693 ) ( CLEAR ?auto_54692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54697 ?auto_54695 ?auto_54696 ?auto_54694 ?auto_54693 )
      ( MAKE-4PILE ?auto_54691 ?auto_54692 ?auto_54693 ?auto_54694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54698 - BLOCK
      ?auto_54699 - BLOCK
      ?auto_54700 - BLOCK
      ?auto_54701 - BLOCK
    )
    :vars
    (
      ?auto_54703 - BLOCK
      ?auto_54702 - BLOCK
      ?auto_54704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54698 ?auto_54699 ) ) ( not ( = ?auto_54698 ?auto_54700 ) ) ( not ( = ?auto_54698 ?auto_54701 ) ) ( not ( = ?auto_54698 ?auto_54703 ) ) ( not ( = ?auto_54699 ?auto_54700 ) ) ( not ( = ?auto_54699 ?auto_54701 ) ) ( not ( = ?auto_54699 ?auto_54703 ) ) ( not ( = ?auto_54700 ?auto_54701 ) ) ( not ( = ?auto_54700 ?auto_54703 ) ) ( not ( = ?auto_54701 ?auto_54703 ) ) ( not ( = ?auto_54698 ?auto_54702 ) ) ( not ( = ?auto_54699 ?auto_54702 ) ) ( not ( = ?auto_54700 ?auto_54702 ) ) ( not ( = ?auto_54701 ?auto_54702 ) ) ( not ( = ?auto_54703 ?auto_54702 ) ) ( ON ?auto_54702 ?auto_54704 ) ( not ( = ?auto_54698 ?auto_54704 ) ) ( not ( = ?auto_54699 ?auto_54704 ) ) ( not ( = ?auto_54700 ?auto_54704 ) ) ( not ( = ?auto_54701 ?auto_54704 ) ) ( not ( = ?auto_54703 ?auto_54704 ) ) ( not ( = ?auto_54702 ?auto_54704 ) ) ( ON ?auto_54703 ?auto_54702 ) ( ON ?auto_54701 ?auto_54703 ) ( ON-TABLE ?auto_54704 ) ( ON ?auto_54700 ?auto_54701 ) ( ON ?auto_54699 ?auto_54700 ) ( CLEAR ?auto_54699 ) ( HOLDING ?auto_54698 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54698 )
      ( MAKE-4PILE ?auto_54698 ?auto_54699 ?auto_54700 ?auto_54701 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54705 - BLOCK
      ?auto_54706 - BLOCK
      ?auto_54707 - BLOCK
      ?auto_54708 - BLOCK
    )
    :vars
    (
      ?auto_54711 - BLOCK
      ?auto_54710 - BLOCK
      ?auto_54709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54705 ?auto_54706 ) ) ( not ( = ?auto_54705 ?auto_54707 ) ) ( not ( = ?auto_54705 ?auto_54708 ) ) ( not ( = ?auto_54705 ?auto_54711 ) ) ( not ( = ?auto_54706 ?auto_54707 ) ) ( not ( = ?auto_54706 ?auto_54708 ) ) ( not ( = ?auto_54706 ?auto_54711 ) ) ( not ( = ?auto_54707 ?auto_54708 ) ) ( not ( = ?auto_54707 ?auto_54711 ) ) ( not ( = ?auto_54708 ?auto_54711 ) ) ( not ( = ?auto_54705 ?auto_54710 ) ) ( not ( = ?auto_54706 ?auto_54710 ) ) ( not ( = ?auto_54707 ?auto_54710 ) ) ( not ( = ?auto_54708 ?auto_54710 ) ) ( not ( = ?auto_54711 ?auto_54710 ) ) ( ON ?auto_54710 ?auto_54709 ) ( not ( = ?auto_54705 ?auto_54709 ) ) ( not ( = ?auto_54706 ?auto_54709 ) ) ( not ( = ?auto_54707 ?auto_54709 ) ) ( not ( = ?auto_54708 ?auto_54709 ) ) ( not ( = ?auto_54711 ?auto_54709 ) ) ( not ( = ?auto_54710 ?auto_54709 ) ) ( ON ?auto_54711 ?auto_54710 ) ( ON ?auto_54708 ?auto_54711 ) ( ON-TABLE ?auto_54709 ) ( ON ?auto_54707 ?auto_54708 ) ( ON ?auto_54706 ?auto_54707 ) ( ON ?auto_54705 ?auto_54706 ) ( CLEAR ?auto_54705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54709 ?auto_54710 ?auto_54711 ?auto_54708 ?auto_54707 ?auto_54706 )
      ( MAKE-4PILE ?auto_54705 ?auto_54706 ?auto_54707 ?auto_54708 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54714 - BLOCK
      ?auto_54715 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_54715 ) ( CLEAR ?auto_54714 ) ( ON-TABLE ?auto_54714 ) ( not ( = ?auto_54714 ?auto_54715 ) ) )
    :subtasks
    ( ( !STACK ?auto_54715 ?auto_54714 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54716 - BLOCK
      ?auto_54717 - BLOCK
    )
    :vars
    (
      ?auto_54718 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54716 ) ( ON-TABLE ?auto_54716 ) ( not ( = ?auto_54716 ?auto_54717 ) ) ( ON ?auto_54717 ?auto_54718 ) ( CLEAR ?auto_54717 ) ( HAND-EMPTY ) ( not ( = ?auto_54716 ?auto_54718 ) ) ( not ( = ?auto_54717 ?auto_54718 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54717 ?auto_54718 )
      ( MAKE-2PILE ?auto_54716 ?auto_54717 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54719 - BLOCK
      ?auto_54720 - BLOCK
    )
    :vars
    (
      ?auto_54721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54719 ?auto_54720 ) ) ( ON ?auto_54720 ?auto_54721 ) ( CLEAR ?auto_54720 ) ( not ( = ?auto_54719 ?auto_54721 ) ) ( not ( = ?auto_54720 ?auto_54721 ) ) ( HOLDING ?auto_54719 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54719 )
      ( MAKE-2PILE ?auto_54719 ?auto_54720 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54722 - BLOCK
      ?auto_54723 - BLOCK
    )
    :vars
    (
      ?auto_54724 - BLOCK
      ?auto_54726 - BLOCK
      ?auto_54725 - BLOCK
      ?auto_54727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54722 ?auto_54723 ) ) ( ON ?auto_54723 ?auto_54724 ) ( not ( = ?auto_54722 ?auto_54724 ) ) ( not ( = ?auto_54723 ?auto_54724 ) ) ( ON ?auto_54722 ?auto_54723 ) ( CLEAR ?auto_54722 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54726 ) ( ON ?auto_54725 ?auto_54726 ) ( ON ?auto_54727 ?auto_54725 ) ( ON ?auto_54724 ?auto_54727 ) ( not ( = ?auto_54726 ?auto_54725 ) ) ( not ( = ?auto_54726 ?auto_54727 ) ) ( not ( = ?auto_54726 ?auto_54724 ) ) ( not ( = ?auto_54726 ?auto_54723 ) ) ( not ( = ?auto_54726 ?auto_54722 ) ) ( not ( = ?auto_54725 ?auto_54727 ) ) ( not ( = ?auto_54725 ?auto_54724 ) ) ( not ( = ?auto_54725 ?auto_54723 ) ) ( not ( = ?auto_54725 ?auto_54722 ) ) ( not ( = ?auto_54727 ?auto_54724 ) ) ( not ( = ?auto_54727 ?auto_54723 ) ) ( not ( = ?auto_54727 ?auto_54722 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54726 ?auto_54725 ?auto_54727 ?auto_54724 ?auto_54723 )
      ( MAKE-2PILE ?auto_54722 ?auto_54723 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54728 - BLOCK
      ?auto_54729 - BLOCK
    )
    :vars
    (
      ?auto_54733 - BLOCK
      ?auto_54731 - BLOCK
      ?auto_54732 - BLOCK
      ?auto_54730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54728 ?auto_54729 ) ) ( ON ?auto_54729 ?auto_54733 ) ( not ( = ?auto_54728 ?auto_54733 ) ) ( not ( = ?auto_54729 ?auto_54733 ) ) ( ON-TABLE ?auto_54731 ) ( ON ?auto_54732 ?auto_54731 ) ( ON ?auto_54730 ?auto_54732 ) ( ON ?auto_54733 ?auto_54730 ) ( not ( = ?auto_54731 ?auto_54732 ) ) ( not ( = ?auto_54731 ?auto_54730 ) ) ( not ( = ?auto_54731 ?auto_54733 ) ) ( not ( = ?auto_54731 ?auto_54729 ) ) ( not ( = ?auto_54731 ?auto_54728 ) ) ( not ( = ?auto_54732 ?auto_54730 ) ) ( not ( = ?auto_54732 ?auto_54733 ) ) ( not ( = ?auto_54732 ?auto_54729 ) ) ( not ( = ?auto_54732 ?auto_54728 ) ) ( not ( = ?auto_54730 ?auto_54733 ) ) ( not ( = ?auto_54730 ?auto_54729 ) ) ( not ( = ?auto_54730 ?auto_54728 ) ) ( HOLDING ?auto_54728 ) ( CLEAR ?auto_54729 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54731 ?auto_54732 ?auto_54730 ?auto_54733 ?auto_54729 ?auto_54728 )
      ( MAKE-2PILE ?auto_54728 ?auto_54729 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54734 - BLOCK
      ?auto_54735 - BLOCK
    )
    :vars
    (
      ?auto_54736 - BLOCK
      ?auto_54737 - BLOCK
      ?auto_54738 - BLOCK
      ?auto_54739 - BLOCK
      ?auto_54740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54734 ?auto_54735 ) ) ( ON ?auto_54735 ?auto_54736 ) ( not ( = ?auto_54734 ?auto_54736 ) ) ( not ( = ?auto_54735 ?auto_54736 ) ) ( ON-TABLE ?auto_54737 ) ( ON ?auto_54738 ?auto_54737 ) ( ON ?auto_54739 ?auto_54738 ) ( ON ?auto_54736 ?auto_54739 ) ( not ( = ?auto_54737 ?auto_54738 ) ) ( not ( = ?auto_54737 ?auto_54739 ) ) ( not ( = ?auto_54737 ?auto_54736 ) ) ( not ( = ?auto_54737 ?auto_54735 ) ) ( not ( = ?auto_54737 ?auto_54734 ) ) ( not ( = ?auto_54738 ?auto_54739 ) ) ( not ( = ?auto_54738 ?auto_54736 ) ) ( not ( = ?auto_54738 ?auto_54735 ) ) ( not ( = ?auto_54738 ?auto_54734 ) ) ( not ( = ?auto_54739 ?auto_54736 ) ) ( not ( = ?auto_54739 ?auto_54735 ) ) ( not ( = ?auto_54739 ?auto_54734 ) ) ( CLEAR ?auto_54735 ) ( ON ?auto_54734 ?auto_54740 ) ( CLEAR ?auto_54734 ) ( HAND-EMPTY ) ( not ( = ?auto_54734 ?auto_54740 ) ) ( not ( = ?auto_54735 ?auto_54740 ) ) ( not ( = ?auto_54736 ?auto_54740 ) ) ( not ( = ?auto_54737 ?auto_54740 ) ) ( not ( = ?auto_54738 ?auto_54740 ) ) ( not ( = ?auto_54739 ?auto_54740 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54734 ?auto_54740 )
      ( MAKE-2PILE ?auto_54734 ?auto_54735 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54741 - BLOCK
      ?auto_54742 - BLOCK
    )
    :vars
    (
      ?auto_54744 - BLOCK
      ?auto_54745 - BLOCK
      ?auto_54747 - BLOCK
      ?auto_54743 - BLOCK
      ?auto_54746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54741 ?auto_54742 ) ) ( not ( = ?auto_54741 ?auto_54744 ) ) ( not ( = ?auto_54742 ?auto_54744 ) ) ( ON-TABLE ?auto_54745 ) ( ON ?auto_54747 ?auto_54745 ) ( ON ?auto_54743 ?auto_54747 ) ( ON ?auto_54744 ?auto_54743 ) ( not ( = ?auto_54745 ?auto_54747 ) ) ( not ( = ?auto_54745 ?auto_54743 ) ) ( not ( = ?auto_54745 ?auto_54744 ) ) ( not ( = ?auto_54745 ?auto_54742 ) ) ( not ( = ?auto_54745 ?auto_54741 ) ) ( not ( = ?auto_54747 ?auto_54743 ) ) ( not ( = ?auto_54747 ?auto_54744 ) ) ( not ( = ?auto_54747 ?auto_54742 ) ) ( not ( = ?auto_54747 ?auto_54741 ) ) ( not ( = ?auto_54743 ?auto_54744 ) ) ( not ( = ?auto_54743 ?auto_54742 ) ) ( not ( = ?auto_54743 ?auto_54741 ) ) ( ON ?auto_54741 ?auto_54746 ) ( CLEAR ?auto_54741 ) ( not ( = ?auto_54741 ?auto_54746 ) ) ( not ( = ?auto_54742 ?auto_54746 ) ) ( not ( = ?auto_54744 ?auto_54746 ) ) ( not ( = ?auto_54745 ?auto_54746 ) ) ( not ( = ?auto_54747 ?auto_54746 ) ) ( not ( = ?auto_54743 ?auto_54746 ) ) ( HOLDING ?auto_54742 ) ( CLEAR ?auto_54744 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54745 ?auto_54747 ?auto_54743 ?auto_54744 ?auto_54742 )
      ( MAKE-2PILE ?auto_54741 ?auto_54742 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54748 - BLOCK
      ?auto_54749 - BLOCK
    )
    :vars
    (
      ?auto_54750 - BLOCK
      ?auto_54751 - BLOCK
      ?auto_54754 - BLOCK
      ?auto_54753 - BLOCK
      ?auto_54752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54748 ?auto_54749 ) ) ( not ( = ?auto_54748 ?auto_54750 ) ) ( not ( = ?auto_54749 ?auto_54750 ) ) ( ON-TABLE ?auto_54751 ) ( ON ?auto_54754 ?auto_54751 ) ( ON ?auto_54753 ?auto_54754 ) ( ON ?auto_54750 ?auto_54753 ) ( not ( = ?auto_54751 ?auto_54754 ) ) ( not ( = ?auto_54751 ?auto_54753 ) ) ( not ( = ?auto_54751 ?auto_54750 ) ) ( not ( = ?auto_54751 ?auto_54749 ) ) ( not ( = ?auto_54751 ?auto_54748 ) ) ( not ( = ?auto_54754 ?auto_54753 ) ) ( not ( = ?auto_54754 ?auto_54750 ) ) ( not ( = ?auto_54754 ?auto_54749 ) ) ( not ( = ?auto_54754 ?auto_54748 ) ) ( not ( = ?auto_54753 ?auto_54750 ) ) ( not ( = ?auto_54753 ?auto_54749 ) ) ( not ( = ?auto_54753 ?auto_54748 ) ) ( ON ?auto_54748 ?auto_54752 ) ( not ( = ?auto_54748 ?auto_54752 ) ) ( not ( = ?auto_54749 ?auto_54752 ) ) ( not ( = ?auto_54750 ?auto_54752 ) ) ( not ( = ?auto_54751 ?auto_54752 ) ) ( not ( = ?auto_54754 ?auto_54752 ) ) ( not ( = ?auto_54753 ?auto_54752 ) ) ( CLEAR ?auto_54750 ) ( ON ?auto_54749 ?auto_54748 ) ( CLEAR ?auto_54749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54752 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54752 ?auto_54748 )
      ( MAKE-2PILE ?auto_54748 ?auto_54749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54755 - BLOCK
      ?auto_54756 - BLOCK
    )
    :vars
    (
      ?auto_54759 - BLOCK
      ?auto_54760 - BLOCK
      ?auto_54761 - BLOCK
      ?auto_54758 - BLOCK
      ?auto_54757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54755 ?auto_54756 ) ) ( not ( = ?auto_54755 ?auto_54759 ) ) ( not ( = ?auto_54756 ?auto_54759 ) ) ( ON-TABLE ?auto_54760 ) ( ON ?auto_54761 ?auto_54760 ) ( ON ?auto_54758 ?auto_54761 ) ( not ( = ?auto_54760 ?auto_54761 ) ) ( not ( = ?auto_54760 ?auto_54758 ) ) ( not ( = ?auto_54760 ?auto_54759 ) ) ( not ( = ?auto_54760 ?auto_54756 ) ) ( not ( = ?auto_54760 ?auto_54755 ) ) ( not ( = ?auto_54761 ?auto_54758 ) ) ( not ( = ?auto_54761 ?auto_54759 ) ) ( not ( = ?auto_54761 ?auto_54756 ) ) ( not ( = ?auto_54761 ?auto_54755 ) ) ( not ( = ?auto_54758 ?auto_54759 ) ) ( not ( = ?auto_54758 ?auto_54756 ) ) ( not ( = ?auto_54758 ?auto_54755 ) ) ( ON ?auto_54755 ?auto_54757 ) ( not ( = ?auto_54755 ?auto_54757 ) ) ( not ( = ?auto_54756 ?auto_54757 ) ) ( not ( = ?auto_54759 ?auto_54757 ) ) ( not ( = ?auto_54760 ?auto_54757 ) ) ( not ( = ?auto_54761 ?auto_54757 ) ) ( not ( = ?auto_54758 ?auto_54757 ) ) ( ON ?auto_54756 ?auto_54755 ) ( CLEAR ?auto_54756 ) ( ON-TABLE ?auto_54757 ) ( HOLDING ?auto_54759 ) ( CLEAR ?auto_54758 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54760 ?auto_54761 ?auto_54758 ?auto_54759 )
      ( MAKE-2PILE ?auto_54755 ?auto_54756 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54762 - BLOCK
      ?auto_54763 - BLOCK
    )
    :vars
    (
      ?auto_54766 - BLOCK
      ?auto_54764 - BLOCK
      ?auto_54765 - BLOCK
      ?auto_54768 - BLOCK
      ?auto_54767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54762 ?auto_54763 ) ) ( not ( = ?auto_54762 ?auto_54766 ) ) ( not ( = ?auto_54763 ?auto_54766 ) ) ( ON-TABLE ?auto_54764 ) ( ON ?auto_54765 ?auto_54764 ) ( ON ?auto_54768 ?auto_54765 ) ( not ( = ?auto_54764 ?auto_54765 ) ) ( not ( = ?auto_54764 ?auto_54768 ) ) ( not ( = ?auto_54764 ?auto_54766 ) ) ( not ( = ?auto_54764 ?auto_54763 ) ) ( not ( = ?auto_54764 ?auto_54762 ) ) ( not ( = ?auto_54765 ?auto_54768 ) ) ( not ( = ?auto_54765 ?auto_54766 ) ) ( not ( = ?auto_54765 ?auto_54763 ) ) ( not ( = ?auto_54765 ?auto_54762 ) ) ( not ( = ?auto_54768 ?auto_54766 ) ) ( not ( = ?auto_54768 ?auto_54763 ) ) ( not ( = ?auto_54768 ?auto_54762 ) ) ( ON ?auto_54762 ?auto_54767 ) ( not ( = ?auto_54762 ?auto_54767 ) ) ( not ( = ?auto_54763 ?auto_54767 ) ) ( not ( = ?auto_54766 ?auto_54767 ) ) ( not ( = ?auto_54764 ?auto_54767 ) ) ( not ( = ?auto_54765 ?auto_54767 ) ) ( not ( = ?auto_54768 ?auto_54767 ) ) ( ON ?auto_54763 ?auto_54762 ) ( ON-TABLE ?auto_54767 ) ( CLEAR ?auto_54768 ) ( ON ?auto_54766 ?auto_54763 ) ( CLEAR ?auto_54766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54767 ?auto_54762 ?auto_54763 )
      ( MAKE-2PILE ?auto_54762 ?auto_54763 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54769 - BLOCK
      ?auto_54770 - BLOCK
    )
    :vars
    (
      ?auto_54772 - BLOCK
      ?auto_54773 - BLOCK
      ?auto_54771 - BLOCK
      ?auto_54775 - BLOCK
      ?auto_54774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54769 ?auto_54770 ) ) ( not ( = ?auto_54769 ?auto_54772 ) ) ( not ( = ?auto_54770 ?auto_54772 ) ) ( ON-TABLE ?auto_54773 ) ( ON ?auto_54771 ?auto_54773 ) ( not ( = ?auto_54773 ?auto_54771 ) ) ( not ( = ?auto_54773 ?auto_54775 ) ) ( not ( = ?auto_54773 ?auto_54772 ) ) ( not ( = ?auto_54773 ?auto_54770 ) ) ( not ( = ?auto_54773 ?auto_54769 ) ) ( not ( = ?auto_54771 ?auto_54775 ) ) ( not ( = ?auto_54771 ?auto_54772 ) ) ( not ( = ?auto_54771 ?auto_54770 ) ) ( not ( = ?auto_54771 ?auto_54769 ) ) ( not ( = ?auto_54775 ?auto_54772 ) ) ( not ( = ?auto_54775 ?auto_54770 ) ) ( not ( = ?auto_54775 ?auto_54769 ) ) ( ON ?auto_54769 ?auto_54774 ) ( not ( = ?auto_54769 ?auto_54774 ) ) ( not ( = ?auto_54770 ?auto_54774 ) ) ( not ( = ?auto_54772 ?auto_54774 ) ) ( not ( = ?auto_54773 ?auto_54774 ) ) ( not ( = ?auto_54771 ?auto_54774 ) ) ( not ( = ?auto_54775 ?auto_54774 ) ) ( ON ?auto_54770 ?auto_54769 ) ( ON-TABLE ?auto_54774 ) ( ON ?auto_54772 ?auto_54770 ) ( CLEAR ?auto_54772 ) ( HOLDING ?auto_54775 ) ( CLEAR ?auto_54771 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54773 ?auto_54771 ?auto_54775 )
      ( MAKE-2PILE ?auto_54769 ?auto_54770 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54776 - BLOCK
      ?auto_54777 - BLOCK
    )
    :vars
    (
      ?auto_54782 - BLOCK
      ?auto_54779 - BLOCK
      ?auto_54780 - BLOCK
      ?auto_54778 - BLOCK
      ?auto_54781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54776 ?auto_54777 ) ) ( not ( = ?auto_54776 ?auto_54782 ) ) ( not ( = ?auto_54777 ?auto_54782 ) ) ( ON-TABLE ?auto_54779 ) ( ON ?auto_54780 ?auto_54779 ) ( not ( = ?auto_54779 ?auto_54780 ) ) ( not ( = ?auto_54779 ?auto_54778 ) ) ( not ( = ?auto_54779 ?auto_54782 ) ) ( not ( = ?auto_54779 ?auto_54777 ) ) ( not ( = ?auto_54779 ?auto_54776 ) ) ( not ( = ?auto_54780 ?auto_54778 ) ) ( not ( = ?auto_54780 ?auto_54782 ) ) ( not ( = ?auto_54780 ?auto_54777 ) ) ( not ( = ?auto_54780 ?auto_54776 ) ) ( not ( = ?auto_54778 ?auto_54782 ) ) ( not ( = ?auto_54778 ?auto_54777 ) ) ( not ( = ?auto_54778 ?auto_54776 ) ) ( ON ?auto_54776 ?auto_54781 ) ( not ( = ?auto_54776 ?auto_54781 ) ) ( not ( = ?auto_54777 ?auto_54781 ) ) ( not ( = ?auto_54782 ?auto_54781 ) ) ( not ( = ?auto_54779 ?auto_54781 ) ) ( not ( = ?auto_54780 ?auto_54781 ) ) ( not ( = ?auto_54778 ?auto_54781 ) ) ( ON ?auto_54777 ?auto_54776 ) ( ON-TABLE ?auto_54781 ) ( ON ?auto_54782 ?auto_54777 ) ( CLEAR ?auto_54780 ) ( ON ?auto_54778 ?auto_54782 ) ( CLEAR ?auto_54778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54781 ?auto_54776 ?auto_54777 ?auto_54782 )
      ( MAKE-2PILE ?auto_54776 ?auto_54777 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54783 - BLOCK
      ?auto_54784 - BLOCK
    )
    :vars
    (
      ?auto_54787 - BLOCK
      ?auto_54785 - BLOCK
      ?auto_54788 - BLOCK
      ?auto_54789 - BLOCK
      ?auto_54786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54783 ?auto_54784 ) ) ( not ( = ?auto_54783 ?auto_54787 ) ) ( not ( = ?auto_54784 ?auto_54787 ) ) ( ON-TABLE ?auto_54785 ) ( not ( = ?auto_54785 ?auto_54788 ) ) ( not ( = ?auto_54785 ?auto_54789 ) ) ( not ( = ?auto_54785 ?auto_54787 ) ) ( not ( = ?auto_54785 ?auto_54784 ) ) ( not ( = ?auto_54785 ?auto_54783 ) ) ( not ( = ?auto_54788 ?auto_54789 ) ) ( not ( = ?auto_54788 ?auto_54787 ) ) ( not ( = ?auto_54788 ?auto_54784 ) ) ( not ( = ?auto_54788 ?auto_54783 ) ) ( not ( = ?auto_54789 ?auto_54787 ) ) ( not ( = ?auto_54789 ?auto_54784 ) ) ( not ( = ?auto_54789 ?auto_54783 ) ) ( ON ?auto_54783 ?auto_54786 ) ( not ( = ?auto_54783 ?auto_54786 ) ) ( not ( = ?auto_54784 ?auto_54786 ) ) ( not ( = ?auto_54787 ?auto_54786 ) ) ( not ( = ?auto_54785 ?auto_54786 ) ) ( not ( = ?auto_54788 ?auto_54786 ) ) ( not ( = ?auto_54789 ?auto_54786 ) ) ( ON ?auto_54784 ?auto_54783 ) ( ON-TABLE ?auto_54786 ) ( ON ?auto_54787 ?auto_54784 ) ( ON ?auto_54789 ?auto_54787 ) ( CLEAR ?auto_54789 ) ( HOLDING ?auto_54788 ) ( CLEAR ?auto_54785 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54785 ?auto_54788 )
      ( MAKE-2PILE ?auto_54783 ?auto_54784 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54790 - BLOCK
      ?auto_54791 - BLOCK
    )
    :vars
    (
      ?auto_54794 - BLOCK
      ?auto_54792 - BLOCK
      ?auto_54796 - BLOCK
      ?auto_54795 - BLOCK
      ?auto_54793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54790 ?auto_54791 ) ) ( not ( = ?auto_54790 ?auto_54794 ) ) ( not ( = ?auto_54791 ?auto_54794 ) ) ( ON-TABLE ?auto_54792 ) ( not ( = ?auto_54792 ?auto_54796 ) ) ( not ( = ?auto_54792 ?auto_54795 ) ) ( not ( = ?auto_54792 ?auto_54794 ) ) ( not ( = ?auto_54792 ?auto_54791 ) ) ( not ( = ?auto_54792 ?auto_54790 ) ) ( not ( = ?auto_54796 ?auto_54795 ) ) ( not ( = ?auto_54796 ?auto_54794 ) ) ( not ( = ?auto_54796 ?auto_54791 ) ) ( not ( = ?auto_54796 ?auto_54790 ) ) ( not ( = ?auto_54795 ?auto_54794 ) ) ( not ( = ?auto_54795 ?auto_54791 ) ) ( not ( = ?auto_54795 ?auto_54790 ) ) ( ON ?auto_54790 ?auto_54793 ) ( not ( = ?auto_54790 ?auto_54793 ) ) ( not ( = ?auto_54791 ?auto_54793 ) ) ( not ( = ?auto_54794 ?auto_54793 ) ) ( not ( = ?auto_54792 ?auto_54793 ) ) ( not ( = ?auto_54796 ?auto_54793 ) ) ( not ( = ?auto_54795 ?auto_54793 ) ) ( ON ?auto_54791 ?auto_54790 ) ( ON-TABLE ?auto_54793 ) ( ON ?auto_54794 ?auto_54791 ) ( ON ?auto_54795 ?auto_54794 ) ( CLEAR ?auto_54792 ) ( ON ?auto_54796 ?auto_54795 ) ( CLEAR ?auto_54796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54793 ?auto_54790 ?auto_54791 ?auto_54794 ?auto_54795 )
      ( MAKE-2PILE ?auto_54790 ?auto_54791 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54797 - BLOCK
      ?auto_54798 - BLOCK
    )
    :vars
    (
      ?auto_54803 - BLOCK
      ?auto_54799 - BLOCK
      ?auto_54802 - BLOCK
      ?auto_54800 - BLOCK
      ?auto_54801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54797 ?auto_54798 ) ) ( not ( = ?auto_54797 ?auto_54803 ) ) ( not ( = ?auto_54798 ?auto_54803 ) ) ( not ( = ?auto_54799 ?auto_54802 ) ) ( not ( = ?auto_54799 ?auto_54800 ) ) ( not ( = ?auto_54799 ?auto_54803 ) ) ( not ( = ?auto_54799 ?auto_54798 ) ) ( not ( = ?auto_54799 ?auto_54797 ) ) ( not ( = ?auto_54802 ?auto_54800 ) ) ( not ( = ?auto_54802 ?auto_54803 ) ) ( not ( = ?auto_54802 ?auto_54798 ) ) ( not ( = ?auto_54802 ?auto_54797 ) ) ( not ( = ?auto_54800 ?auto_54803 ) ) ( not ( = ?auto_54800 ?auto_54798 ) ) ( not ( = ?auto_54800 ?auto_54797 ) ) ( ON ?auto_54797 ?auto_54801 ) ( not ( = ?auto_54797 ?auto_54801 ) ) ( not ( = ?auto_54798 ?auto_54801 ) ) ( not ( = ?auto_54803 ?auto_54801 ) ) ( not ( = ?auto_54799 ?auto_54801 ) ) ( not ( = ?auto_54802 ?auto_54801 ) ) ( not ( = ?auto_54800 ?auto_54801 ) ) ( ON ?auto_54798 ?auto_54797 ) ( ON-TABLE ?auto_54801 ) ( ON ?auto_54803 ?auto_54798 ) ( ON ?auto_54800 ?auto_54803 ) ( ON ?auto_54802 ?auto_54800 ) ( CLEAR ?auto_54802 ) ( HOLDING ?auto_54799 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54799 )
      ( MAKE-2PILE ?auto_54797 ?auto_54798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54804 - BLOCK
      ?auto_54805 - BLOCK
    )
    :vars
    (
      ?auto_54810 - BLOCK
      ?auto_54807 - BLOCK
      ?auto_54808 - BLOCK
      ?auto_54809 - BLOCK
      ?auto_54806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54804 ?auto_54805 ) ) ( not ( = ?auto_54804 ?auto_54810 ) ) ( not ( = ?auto_54805 ?auto_54810 ) ) ( not ( = ?auto_54807 ?auto_54808 ) ) ( not ( = ?auto_54807 ?auto_54809 ) ) ( not ( = ?auto_54807 ?auto_54810 ) ) ( not ( = ?auto_54807 ?auto_54805 ) ) ( not ( = ?auto_54807 ?auto_54804 ) ) ( not ( = ?auto_54808 ?auto_54809 ) ) ( not ( = ?auto_54808 ?auto_54810 ) ) ( not ( = ?auto_54808 ?auto_54805 ) ) ( not ( = ?auto_54808 ?auto_54804 ) ) ( not ( = ?auto_54809 ?auto_54810 ) ) ( not ( = ?auto_54809 ?auto_54805 ) ) ( not ( = ?auto_54809 ?auto_54804 ) ) ( ON ?auto_54804 ?auto_54806 ) ( not ( = ?auto_54804 ?auto_54806 ) ) ( not ( = ?auto_54805 ?auto_54806 ) ) ( not ( = ?auto_54810 ?auto_54806 ) ) ( not ( = ?auto_54807 ?auto_54806 ) ) ( not ( = ?auto_54808 ?auto_54806 ) ) ( not ( = ?auto_54809 ?auto_54806 ) ) ( ON ?auto_54805 ?auto_54804 ) ( ON-TABLE ?auto_54806 ) ( ON ?auto_54810 ?auto_54805 ) ( ON ?auto_54809 ?auto_54810 ) ( ON ?auto_54808 ?auto_54809 ) ( ON ?auto_54807 ?auto_54808 ) ( CLEAR ?auto_54807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54806 ?auto_54804 ?auto_54805 ?auto_54810 ?auto_54809 ?auto_54808 )
      ( MAKE-2PILE ?auto_54804 ?auto_54805 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54814 - BLOCK
      ?auto_54815 - BLOCK
      ?auto_54816 - BLOCK
    )
    :vars
    (
      ?auto_54817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54817 ?auto_54816 ) ( CLEAR ?auto_54817 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54814 ) ( ON ?auto_54815 ?auto_54814 ) ( ON ?auto_54816 ?auto_54815 ) ( not ( = ?auto_54814 ?auto_54815 ) ) ( not ( = ?auto_54814 ?auto_54816 ) ) ( not ( = ?auto_54814 ?auto_54817 ) ) ( not ( = ?auto_54815 ?auto_54816 ) ) ( not ( = ?auto_54815 ?auto_54817 ) ) ( not ( = ?auto_54816 ?auto_54817 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54817 ?auto_54816 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54818 - BLOCK
      ?auto_54819 - BLOCK
      ?auto_54820 - BLOCK
    )
    :vars
    (
      ?auto_54821 - BLOCK
      ?auto_54822 - BLOCK
      ?auto_54823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54821 ?auto_54820 ) ( CLEAR ?auto_54821 ) ( ON-TABLE ?auto_54818 ) ( ON ?auto_54819 ?auto_54818 ) ( ON ?auto_54820 ?auto_54819 ) ( not ( = ?auto_54818 ?auto_54819 ) ) ( not ( = ?auto_54818 ?auto_54820 ) ) ( not ( = ?auto_54818 ?auto_54821 ) ) ( not ( = ?auto_54819 ?auto_54820 ) ) ( not ( = ?auto_54819 ?auto_54821 ) ) ( not ( = ?auto_54820 ?auto_54821 ) ) ( HOLDING ?auto_54822 ) ( CLEAR ?auto_54823 ) ( not ( = ?auto_54818 ?auto_54822 ) ) ( not ( = ?auto_54818 ?auto_54823 ) ) ( not ( = ?auto_54819 ?auto_54822 ) ) ( not ( = ?auto_54819 ?auto_54823 ) ) ( not ( = ?auto_54820 ?auto_54822 ) ) ( not ( = ?auto_54820 ?auto_54823 ) ) ( not ( = ?auto_54821 ?auto_54822 ) ) ( not ( = ?auto_54821 ?auto_54823 ) ) ( not ( = ?auto_54822 ?auto_54823 ) ) )
    :subtasks
    ( ( !STACK ?auto_54822 ?auto_54823 )
      ( MAKE-3PILE ?auto_54818 ?auto_54819 ?auto_54820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54824 - BLOCK
      ?auto_54825 - BLOCK
      ?auto_54826 - BLOCK
    )
    :vars
    (
      ?auto_54829 - BLOCK
      ?auto_54827 - BLOCK
      ?auto_54828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54829 ?auto_54826 ) ( ON-TABLE ?auto_54824 ) ( ON ?auto_54825 ?auto_54824 ) ( ON ?auto_54826 ?auto_54825 ) ( not ( = ?auto_54824 ?auto_54825 ) ) ( not ( = ?auto_54824 ?auto_54826 ) ) ( not ( = ?auto_54824 ?auto_54829 ) ) ( not ( = ?auto_54825 ?auto_54826 ) ) ( not ( = ?auto_54825 ?auto_54829 ) ) ( not ( = ?auto_54826 ?auto_54829 ) ) ( CLEAR ?auto_54827 ) ( not ( = ?auto_54824 ?auto_54828 ) ) ( not ( = ?auto_54824 ?auto_54827 ) ) ( not ( = ?auto_54825 ?auto_54828 ) ) ( not ( = ?auto_54825 ?auto_54827 ) ) ( not ( = ?auto_54826 ?auto_54828 ) ) ( not ( = ?auto_54826 ?auto_54827 ) ) ( not ( = ?auto_54829 ?auto_54828 ) ) ( not ( = ?auto_54829 ?auto_54827 ) ) ( not ( = ?auto_54828 ?auto_54827 ) ) ( ON ?auto_54828 ?auto_54829 ) ( CLEAR ?auto_54828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54824 ?auto_54825 ?auto_54826 ?auto_54829 )
      ( MAKE-3PILE ?auto_54824 ?auto_54825 ?auto_54826 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54830 - BLOCK
      ?auto_54831 - BLOCK
      ?auto_54832 - BLOCK
    )
    :vars
    (
      ?auto_54834 - BLOCK
      ?auto_54833 - BLOCK
      ?auto_54835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54834 ?auto_54832 ) ( ON-TABLE ?auto_54830 ) ( ON ?auto_54831 ?auto_54830 ) ( ON ?auto_54832 ?auto_54831 ) ( not ( = ?auto_54830 ?auto_54831 ) ) ( not ( = ?auto_54830 ?auto_54832 ) ) ( not ( = ?auto_54830 ?auto_54834 ) ) ( not ( = ?auto_54831 ?auto_54832 ) ) ( not ( = ?auto_54831 ?auto_54834 ) ) ( not ( = ?auto_54832 ?auto_54834 ) ) ( not ( = ?auto_54830 ?auto_54833 ) ) ( not ( = ?auto_54830 ?auto_54835 ) ) ( not ( = ?auto_54831 ?auto_54833 ) ) ( not ( = ?auto_54831 ?auto_54835 ) ) ( not ( = ?auto_54832 ?auto_54833 ) ) ( not ( = ?auto_54832 ?auto_54835 ) ) ( not ( = ?auto_54834 ?auto_54833 ) ) ( not ( = ?auto_54834 ?auto_54835 ) ) ( not ( = ?auto_54833 ?auto_54835 ) ) ( ON ?auto_54833 ?auto_54834 ) ( CLEAR ?auto_54833 ) ( HOLDING ?auto_54835 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54835 )
      ( MAKE-3PILE ?auto_54830 ?auto_54831 ?auto_54832 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54836 - BLOCK
      ?auto_54837 - BLOCK
      ?auto_54838 - BLOCK
    )
    :vars
    (
      ?auto_54841 - BLOCK
      ?auto_54839 - BLOCK
      ?auto_54840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54841 ?auto_54838 ) ( ON-TABLE ?auto_54836 ) ( ON ?auto_54837 ?auto_54836 ) ( ON ?auto_54838 ?auto_54837 ) ( not ( = ?auto_54836 ?auto_54837 ) ) ( not ( = ?auto_54836 ?auto_54838 ) ) ( not ( = ?auto_54836 ?auto_54841 ) ) ( not ( = ?auto_54837 ?auto_54838 ) ) ( not ( = ?auto_54837 ?auto_54841 ) ) ( not ( = ?auto_54838 ?auto_54841 ) ) ( not ( = ?auto_54836 ?auto_54839 ) ) ( not ( = ?auto_54836 ?auto_54840 ) ) ( not ( = ?auto_54837 ?auto_54839 ) ) ( not ( = ?auto_54837 ?auto_54840 ) ) ( not ( = ?auto_54838 ?auto_54839 ) ) ( not ( = ?auto_54838 ?auto_54840 ) ) ( not ( = ?auto_54841 ?auto_54839 ) ) ( not ( = ?auto_54841 ?auto_54840 ) ) ( not ( = ?auto_54839 ?auto_54840 ) ) ( ON ?auto_54839 ?auto_54841 ) ( ON ?auto_54840 ?auto_54839 ) ( CLEAR ?auto_54840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54836 ?auto_54837 ?auto_54838 ?auto_54841 ?auto_54839 )
      ( MAKE-3PILE ?auto_54836 ?auto_54837 ?auto_54838 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54842 - BLOCK
      ?auto_54843 - BLOCK
      ?auto_54844 - BLOCK
    )
    :vars
    (
      ?auto_54845 - BLOCK
      ?auto_54846 - BLOCK
      ?auto_54847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54845 ?auto_54844 ) ( ON-TABLE ?auto_54842 ) ( ON ?auto_54843 ?auto_54842 ) ( ON ?auto_54844 ?auto_54843 ) ( not ( = ?auto_54842 ?auto_54843 ) ) ( not ( = ?auto_54842 ?auto_54844 ) ) ( not ( = ?auto_54842 ?auto_54845 ) ) ( not ( = ?auto_54843 ?auto_54844 ) ) ( not ( = ?auto_54843 ?auto_54845 ) ) ( not ( = ?auto_54844 ?auto_54845 ) ) ( not ( = ?auto_54842 ?auto_54846 ) ) ( not ( = ?auto_54842 ?auto_54847 ) ) ( not ( = ?auto_54843 ?auto_54846 ) ) ( not ( = ?auto_54843 ?auto_54847 ) ) ( not ( = ?auto_54844 ?auto_54846 ) ) ( not ( = ?auto_54844 ?auto_54847 ) ) ( not ( = ?auto_54845 ?auto_54846 ) ) ( not ( = ?auto_54845 ?auto_54847 ) ) ( not ( = ?auto_54846 ?auto_54847 ) ) ( ON ?auto_54846 ?auto_54845 ) ( HOLDING ?auto_54847 ) ( CLEAR ?auto_54846 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54842 ?auto_54843 ?auto_54844 ?auto_54845 ?auto_54846 ?auto_54847 )
      ( MAKE-3PILE ?auto_54842 ?auto_54843 ?auto_54844 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54848 - BLOCK
      ?auto_54849 - BLOCK
      ?auto_54850 - BLOCK
    )
    :vars
    (
      ?auto_54851 - BLOCK
      ?auto_54852 - BLOCK
      ?auto_54853 - BLOCK
      ?auto_54854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54851 ?auto_54850 ) ( ON-TABLE ?auto_54848 ) ( ON ?auto_54849 ?auto_54848 ) ( ON ?auto_54850 ?auto_54849 ) ( not ( = ?auto_54848 ?auto_54849 ) ) ( not ( = ?auto_54848 ?auto_54850 ) ) ( not ( = ?auto_54848 ?auto_54851 ) ) ( not ( = ?auto_54849 ?auto_54850 ) ) ( not ( = ?auto_54849 ?auto_54851 ) ) ( not ( = ?auto_54850 ?auto_54851 ) ) ( not ( = ?auto_54848 ?auto_54852 ) ) ( not ( = ?auto_54848 ?auto_54853 ) ) ( not ( = ?auto_54849 ?auto_54852 ) ) ( not ( = ?auto_54849 ?auto_54853 ) ) ( not ( = ?auto_54850 ?auto_54852 ) ) ( not ( = ?auto_54850 ?auto_54853 ) ) ( not ( = ?auto_54851 ?auto_54852 ) ) ( not ( = ?auto_54851 ?auto_54853 ) ) ( not ( = ?auto_54852 ?auto_54853 ) ) ( ON ?auto_54852 ?auto_54851 ) ( CLEAR ?auto_54852 ) ( ON ?auto_54853 ?auto_54854 ) ( CLEAR ?auto_54853 ) ( HAND-EMPTY ) ( not ( = ?auto_54848 ?auto_54854 ) ) ( not ( = ?auto_54849 ?auto_54854 ) ) ( not ( = ?auto_54850 ?auto_54854 ) ) ( not ( = ?auto_54851 ?auto_54854 ) ) ( not ( = ?auto_54852 ?auto_54854 ) ) ( not ( = ?auto_54853 ?auto_54854 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54853 ?auto_54854 )
      ( MAKE-3PILE ?auto_54848 ?auto_54849 ?auto_54850 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54855 - BLOCK
      ?auto_54856 - BLOCK
      ?auto_54857 - BLOCK
    )
    :vars
    (
      ?auto_54858 - BLOCK
      ?auto_54861 - BLOCK
      ?auto_54859 - BLOCK
      ?auto_54860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54858 ?auto_54857 ) ( ON-TABLE ?auto_54855 ) ( ON ?auto_54856 ?auto_54855 ) ( ON ?auto_54857 ?auto_54856 ) ( not ( = ?auto_54855 ?auto_54856 ) ) ( not ( = ?auto_54855 ?auto_54857 ) ) ( not ( = ?auto_54855 ?auto_54858 ) ) ( not ( = ?auto_54856 ?auto_54857 ) ) ( not ( = ?auto_54856 ?auto_54858 ) ) ( not ( = ?auto_54857 ?auto_54858 ) ) ( not ( = ?auto_54855 ?auto_54861 ) ) ( not ( = ?auto_54855 ?auto_54859 ) ) ( not ( = ?auto_54856 ?auto_54861 ) ) ( not ( = ?auto_54856 ?auto_54859 ) ) ( not ( = ?auto_54857 ?auto_54861 ) ) ( not ( = ?auto_54857 ?auto_54859 ) ) ( not ( = ?auto_54858 ?auto_54861 ) ) ( not ( = ?auto_54858 ?auto_54859 ) ) ( not ( = ?auto_54861 ?auto_54859 ) ) ( ON ?auto_54859 ?auto_54860 ) ( CLEAR ?auto_54859 ) ( not ( = ?auto_54855 ?auto_54860 ) ) ( not ( = ?auto_54856 ?auto_54860 ) ) ( not ( = ?auto_54857 ?auto_54860 ) ) ( not ( = ?auto_54858 ?auto_54860 ) ) ( not ( = ?auto_54861 ?auto_54860 ) ) ( not ( = ?auto_54859 ?auto_54860 ) ) ( HOLDING ?auto_54861 ) ( CLEAR ?auto_54858 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54855 ?auto_54856 ?auto_54857 ?auto_54858 ?auto_54861 )
      ( MAKE-3PILE ?auto_54855 ?auto_54856 ?auto_54857 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54862 - BLOCK
      ?auto_54863 - BLOCK
      ?auto_54864 - BLOCK
    )
    :vars
    (
      ?auto_54865 - BLOCK
      ?auto_54866 - BLOCK
      ?auto_54867 - BLOCK
      ?auto_54868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54865 ?auto_54864 ) ( ON-TABLE ?auto_54862 ) ( ON ?auto_54863 ?auto_54862 ) ( ON ?auto_54864 ?auto_54863 ) ( not ( = ?auto_54862 ?auto_54863 ) ) ( not ( = ?auto_54862 ?auto_54864 ) ) ( not ( = ?auto_54862 ?auto_54865 ) ) ( not ( = ?auto_54863 ?auto_54864 ) ) ( not ( = ?auto_54863 ?auto_54865 ) ) ( not ( = ?auto_54864 ?auto_54865 ) ) ( not ( = ?auto_54862 ?auto_54866 ) ) ( not ( = ?auto_54862 ?auto_54867 ) ) ( not ( = ?auto_54863 ?auto_54866 ) ) ( not ( = ?auto_54863 ?auto_54867 ) ) ( not ( = ?auto_54864 ?auto_54866 ) ) ( not ( = ?auto_54864 ?auto_54867 ) ) ( not ( = ?auto_54865 ?auto_54866 ) ) ( not ( = ?auto_54865 ?auto_54867 ) ) ( not ( = ?auto_54866 ?auto_54867 ) ) ( ON ?auto_54867 ?auto_54868 ) ( not ( = ?auto_54862 ?auto_54868 ) ) ( not ( = ?auto_54863 ?auto_54868 ) ) ( not ( = ?auto_54864 ?auto_54868 ) ) ( not ( = ?auto_54865 ?auto_54868 ) ) ( not ( = ?auto_54866 ?auto_54868 ) ) ( not ( = ?auto_54867 ?auto_54868 ) ) ( CLEAR ?auto_54865 ) ( ON ?auto_54866 ?auto_54867 ) ( CLEAR ?auto_54866 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54868 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54868 ?auto_54867 )
      ( MAKE-3PILE ?auto_54862 ?auto_54863 ?auto_54864 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54883 - BLOCK
      ?auto_54884 - BLOCK
      ?auto_54885 - BLOCK
    )
    :vars
    (
      ?auto_54886 - BLOCK
      ?auto_54887 - BLOCK
      ?auto_54888 - BLOCK
      ?auto_54889 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54883 ) ( ON ?auto_54884 ?auto_54883 ) ( not ( = ?auto_54883 ?auto_54884 ) ) ( not ( = ?auto_54883 ?auto_54885 ) ) ( not ( = ?auto_54883 ?auto_54886 ) ) ( not ( = ?auto_54884 ?auto_54885 ) ) ( not ( = ?auto_54884 ?auto_54886 ) ) ( not ( = ?auto_54885 ?auto_54886 ) ) ( not ( = ?auto_54883 ?auto_54887 ) ) ( not ( = ?auto_54883 ?auto_54888 ) ) ( not ( = ?auto_54884 ?auto_54887 ) ) ( not ( = ?auto_54884 ?auto_54888 ) ) ( not ( = ?auto_54885 ?auto_54887 ) ) ( not ( = ?auto_54885 ?auto_54888 ) ) ( not ( = ?auto_54886 ?auto_54887 ) ) ( not ( = ?auto_54886 ?auto_54888 ) ) ( not ( = ?auto_54887 ?auto_54888 ) ) ( ON ?auto_54888 ?auto_54889 ) ( not ( = ?auto_54883 ?auto_54889 ) ) ( not ( = ?auto_54884 ?auto_54889 ) ) ( not ( = ?auto_54885 ?auto_54889 ) ) ( not ( = ?auto_54886 ?auto_54889 ) ) ( not ( = ?auto_54887 ?auto_54889 ) ) ( not ( = ?auto_54888 ?auto_54889 ) ) ( ON ?auto_54887 ?auto_54888 ) ( ON-TABLE ?auto_54889 ) ( ON ?auto_54886 ?auto_54887 ) ( CLEAR ?auto_54886 ) ( HOLDING ?auto_54885 ) ( CLEAR ?auto_54884 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54883 ?auto_54884 ?auto_54885 ?auto_54886 )
      ( MAKE-3PILE ?auto_54883 ?auto_54884 ?auto_54885 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54890 - BLOCK
      ?auto_54891 - BLOCK
      ?auto_54892 - BLOCK
    )
    :vars
    (
      ?auto_54895 - BLOCK
      ?auto_54893 - BLOCK
      ?auto_54894 - BLOCK
      ?auto_54896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54890 ) ( ON ?auto_54891 ?auto_54890 ) ( not ( = ?auto_54890 ?auto_54891 ) ) ( not ( = ?auto_54890 ?auto_54892 ) ) ( not ( = ?auto_54890 ?auto_54895 ) ) ( not ( = ?auto_54891 ?auto_54892 ) ) ( not ( = ?auto_54891 ?auto_54895 ) ) ( not ( = ?auto_54892 ?auto_54895 ) ) ( not ( = ?auto_54890 ?auto_54893 ) ) ( not ( = ?auto_54890 ?auto_54894 ) ) ( not ( = ?auto_54891 ?auto_54893 ) ) ( not ( = ?auto_54891 ?auto_54894 ) ) ( not ( = ?auto_54892 ?auto_54893 ) ) ( not ( = ?auto_54892 ?auto_54894 ) ) ( not ( = ?auto_54895 ?auto_54893 ) ) ( not ( = ?auto_54895 ?auto_54894 ) ) ( not ( = ?auto_54893 ?auto_54894 ) ) ( ON ?auto_54894 ?auto_54896 ) ( not ( = ?auto_54890 ?auto_54896 ) ) ( not ( = ?auto_54891 ?auto_54896 ) ) ( not ( = ?auto_54892 ?auto_54896 ) ) ( not ( = ?auto_54895 ?auto_54896 ) ) ( not ( = ?auto_54893 ?auto_54896 ) ) ( not ( = ?auto_54894 ?auto_54896 ) ) ( ON ?auto_54893 ?auto_54894 ) ( ON-TABLE ?auto_54896 ) ( ON ?auto_54895 ?auto_54893 ) ( CLEAR ?auto_54891 ) ( ON ?auto_54892 ?auto_54895 ) ( CLEAR ?auto_54892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54896 ?auto_54894 ?auto_54893 ?auto_54895 )
      ( MAKE-3PILE ?auto_54890 ?auto_54891 ?auto_54892 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54897 - BLOCK
      ?auto_54898 - BLOCK
      ?auto_54899 - BLOCK
    )
    :vars
    (
      ?auto_54903 - BLOCK
      ?auto_54901 - BLOCK
      ?auto_54902 - BLOCK
      ?auto_54900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54897 ) ( not ( = ?auto_54897 ?auto_54898 ) ) ( not ( = ?auto_54897 ?auto_54899 ) ) ( not ( = ?auto_54897 ?auto_54903 ) ) ( not ( = ?auto_54898 ?auto_54899 ) ) ( not ( = ?auto_54898 ?auto_54903 ) ) ( not ( = ?auto_54899 ?auto_54903 ) ) ( not ( = ?auto_54897 ?auto_54901 ) ) ( not ( = ?auto_54897 ?auto_54902 ) ) ( not ( = ?auto_54898 ?auto_54901 ) ) ( not ( = ?auto_54898 ?auto_54902 ) ) ( not ( = ?auto_54899 ?auto_54901 ) ) ( not ( = ?auto_54899 ?auto_54902 ) ) ( not ( = ?auto_54903 ?auto_54901 ) ) ( not ( = ?auto_54903 ?auto_54902 ) ) ( not ( = ?auto_54901 ?auto_54902 ) ) ( ON ?auto_54902 ?auto_54900 ) ( not ( = ?auto_54897 ?auto_54900 ) ) ( not ( = ?auto_54898 ?auto_54900 ) ) ( not ( = ?auto_54899 ?auto_54900 ) ) ( not ( = ?auto_54903 ?auto_54900 ) ) ( not ( = ?auto_54901 ?auto_54900 ) ) ( not ( = ?auto_54902 ?auto_54900 ) ) ( ON ?auto_54901 ?auto_54902 ) ( ON-TABLE ?auto_54900 ) ( ON ?auto_54903 ?auto_54901 ) ( ON ?auto_54899 ?auto_54903 ) ( CLEAR ?auto_54899 ) ( HOLDING ?auto_54898 ) ( CLEAR ?auto_54897 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54897 ?auto_54898 )
      ( MAKE-3PILE ?auto_54897 ?auto_54898 ?auto_54899 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54904 - BLOCK
      ?auto_54905 - BLOCK
      ?auto_54906 - BLOCK
    )
    :vars
    (
      ?auto_54907 - BLOCK
      ?auto_54908 - BLOCK
      ?auto_54910 - BLOCK
      ?auto_54909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54904 ) ( not ( = ?auto_54904 ?auto_54905 ) ) ( not ( = ?auto_54904 ?auto_54906 ) ) ( not ( = ?auto_54904 ?auto_54907 ) ) ( not ( = ?auto_54905 ?auto_54906 ) ) ( not ( = ?auto_54905 ?auto_54907 ) ) ( not ( = ?auto_54906 ?auto_54907 ) ) ( not ( = ?auto_54904 ?auto_54908 ) ) ( not ( = ?auto_54904 ?auto_54910 ) ) ( not ( = ?auto_54905 ?auto_54908 ) ) ( not ( = ?auto_54905 ?auto_54910 ) ) ( not ( = ?auto_54906 ?auto_54908 ) ) ( not ( = ?auto_54906 ?auto_54910 ) ) ( not ( = ?auto_54907 ?auto_54908 ) ) ( not ( = ?auto_54907 ?auto_54910 ) ) ( not ( = ?auto_54908 ?auto_54910 ) ) ( ON ?auto_54910 ?auto_54909 ) ( not ( = ?auto_54904 ?auto_54909 ) ) ( not ( = ?auto_54905 ?auto_54909 ) ) ( not ( = ?auto_54906 ?auto_54909 ) ) ( not ( = ?auto_54907 ?auto_54909 ) ) ( not ( = ?auto_54908 ?auto_54909 ) ) ( not ( = ?auto_54910 ?auto_54909 ) ) ( ON ?auto_54908 ?auto_54910 ) ( ON-TABLE ?auto_54909 ) ( ON ?auto_54907 ?auto_54908 ) ( ON ?auto_54906 ?auto_54907 ) ( CLEAR ?auto_54904 ) ( ON ?auto_54905 ?auto_54906 ) ( CLEAR ?auto_54905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54909 ?auto_54910 ?auto_54908 ?auto_54907 ?auto_54906 )
      ( MAKE-3PILE ?auto_54904 ?auto_54905 ?auto_54906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54911 - BLOCK
      ?auto_54912 - BLOCK
      ?auto_54913 - BLOCK
    )
    :vars
    (
      ?auto_54916 - BLOCK
      ?auto_54915 - BLOCK
      ?auto_54917 - BLOCK
      ?auto_54914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54911 ?auto_54912 ) ) ( not ( = ?auto_54911 ?auto_54913 ) ) ( not ( = ?auto_54911 ?auto_54916 ) ) ( not ( = ?auto_54912 ?auto_54913 ) ) ( not ( = ?auto_54912 ?auto_54916 ) ) ( not ( = ?auto_54913 ?auto_54916 ) ) ( not ( = ?auto_54911 ?auto_54915 ) ) ( not ( = ?auto_54911 ?auto_54917 ) ) ( not ( = ?auto_54912 ?auto_54915 ) ) ( not ( = ?auto_54912 ?auto_54917 ) ) ( not ( = ?auto_54913 ?auto_54915 ) ) ( not ( = ?auto_54913 ?auto_54917 ) ) ( not ( = ?auto_54916 ?auto_54915 ) ) ( not ( = ?auto_54916 ?auto_54917 ) ) ( not ( = ?auto_54915 ?auto_54917 ) ) ( ON ?auto_54917 ?auto_54914 ) ( not ( = ?auto_54911 ?auto_54914 ) ) ( not ( = ?auto_54912 ?auto_54914 ) ) ( not ( = ?auto_54913 ?auto_54914 ) ) ( not ( = ?auto_54916 ?auto_54914 ) ) ( not ( = ?auto_54915 ?auto_54914 ) ) ( not ( = ?auto_54917 ?auto_54914 ) ) ( ON ?auto_54915 ?auto_54917 ) ( ON-TABLE ?auto_54914 ) ( ON ?auto_54916 ?auto_54915 ) ( ON ?auto_54913 ?auto_54916 ) ( ON ?auto_54912 ?auto_54913 ) ( CLEAR ?auto_54912 ) ( HOLDING ?auto_54911 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54911 )
      ( MAKE-3PILE ?auto_54911 ?auto_54912 ?auto_54913 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54918 - BLOCK
      ?auto_54919 - BLOCK
      ?auto_54920 - BLOCK
    )
    :vars
    (
      ?auto_54922 - BLOCK
      ?auto_54921 - BLOCK
      ?auto_54924 - BLOCK
      ?auto_54923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54918 ?auto_54919 ) ) ( not ( = ?auto_54918 ?auto_54920 ) ) ( not ( = ?auto_54918 ?auto_54922 ) ) ( not ( = ?auto_54919 ?auto_54920 ) ) ( not ( = ?auto_54919 ?auto_54922 ) ) ( not ( = ?auto_54920 ?auto_54922 ) ) ( not ( = ?auto_54918 ?auto_54921 ) ) ( not ( = ?auto_54918 ?auto_54924 ) ) ( not ( = ?auto_54919 ?auto_54921 ) ) ( not ( = ?auto_54919 ?auto_54924 ) ) ( not ( = ?auto_54920 ?auto_54921 ) ) ( not ( = ?auto_54920 ?auto_54924 ) ) ( not ( = ?auto_54922 ?auto_54921 ) ) ( not ( = ?auto_54922 ?auto_54924 ) ) ( not ( = ?auto_54921 ?auto_54924 ) ) ( ON ?auto_54924 ?auto_54923 ) ( not ( = ?auto_54918 ?auto_54923 ) ) ( not ( = ?auto_54919 ?auto_54923 ) ) ( not ( = ?auto_54920 ?auto_54923 ) ) ( not ( = ?auto_54922 ?auto_54923 ) ) ( not ( = ?auto_54921 ?auto_54923 ) ) ( not ( = ?auto_54924 ?auto_54923 ) ) ( ON ?auto_54921 ?auto_54924 ) ( ON-TABLE ?auto_54923 ) ( ON ?auto_54922 ?auto_54921 ) ( ON ?auto_54920 ?auto_54922 ) ( ON ?auto_54919 ?auto_54920 ) ( ON ?auto_54918 ?auto_54919 ) ( CLEAR ?auto_54918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54923 ?auto_54924 ?auto_54921 ?auto_54922 ?auto_54920 ?auto_54919 )
      ( MAKE-3PILE ?auto_54918 ?auto_54919 ?auto_54920 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54928 - BLOCK
      ?auto_54929 - BLOCK
      ?auto_54930 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_54930 ) ( CLEAR ?auto_54929 ) ( ON-TABLE ?auto_54928 ) ( ON ?auto_54929 ?auto_54928 ) ( not ( = ?auto_54928 ?auto_54929 ) ) ( not ( = ?auto_54928 ?auto_54930 ) ) ( not ( = ?auto_54929 ?auto_54930 ) ) )
    :subtasks
    ( ( !STACK ?auto_54930 ?auto_54929 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54931 - BLOCK
      ?auto_54932 - BLOCK
      ?auto_54933 - BLOCK
    )
    :vars
    (
      ?auto_54934 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54932 ) ( ON-TABLE ?auto_54931 ) ( ON ?auto_54932 ?auto_54931 ) ( not ( = ?auto_54931 ?auto_54932 ) ) ( not ( = ?auto_54931 ?auto_54933 ) ) ( not ( = ?auto_54932 ?auto_54933 ) ) ( ON ?auto_54933 ?auto_54934 ) ( CLEAR ?auto_54933 ) ( HAND-EMPTY ) ( not ( = ?auto_54931 ?auto_54934 ) ) ( not ( = ?auto_54932 ?auto_54934 ) ) ( not ( = ?auto_54933 ?auto_54934 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54933 ?auto_54934 )
      ( MAKE-3PILE ?auto_54931 ?auto_54932 ?auto_54933 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54935 - BLOCK
      ?auto_54936 - BLOCK
      ?auto_54937 - BLOCK
    )
    :vars
    (
      ?auto_54938 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54935 ) ( not ( = ?auto_54935 ?auto_54936 ) ) ( not ( = ?auto_54935 ?auto_54937 ) ) ( not ( = ?auto_54936 ?auto_54937 ) ) ( ON ?auto_54937 ?auto_54938 ) ( CLEAR ?auto_54937 ) ( not ( = ?auto_54935 ?auto_54938 ) ) ( not ( = ?auto_54936 ?auto_54938 ) ) ( not ( = ?auto_54937 ?auto_54938 ) ) ( HOLDING ?auto_54936 ) ( CLEAR ?auto_54935 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54935 ?auto_54936 )
      ( MAKE-3PILE ?auto_54935 ?auto_54936 ?auto_54937 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54939 - BLOCK
      ?auto_54940 - BLOCK
      ?auto_54941 - BLOCK
    )
    :vars
    (
      ?auto_54942 - BLOCK
      ?auto_54943 - BLOCK
      ?auto_54944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54939 ) ( not ( = ?auto_54939 ?auto_54940 ) ) ( not ( = ?auto_54939 ?auto_54941 ) ) ( not ( = ?auto_54940 ?auto_54941 ) ) ( ON ?auto_54941 ?auto_54942 ) ( not ( = ?auto_54939 ?auto_54942 ) ) ( not ( = ?auto_54940 ?auto_54942 ) ) ( not ( = ?auto_54941 ?auto_54942 ) ) ( CLEAR ?auto_54939 ) ( ON ?auto_54940 ?auto_54941 ) ( CLEAR ?auto_54940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54943 ) ( ON ?auto_54944 ?auto_54943 ) ( ON ?auto_54942 ?auto_54944 ) ( not ( = ?auto_54943 ?auto_54944 ) ) ( not ( = ?auto_54943 ?auto_54942 ) ) ( not ( = ?auto_54943 ?auto_54941 ) ) ( not ( = ?auto_54943 ?auto_54940 ) ) ( not ( = ?auto_54944 ?auto_54942 ) ) ( not ( = ?auto_54944 ?auto_54941 ) ) ( not ( = ?auto_54944 ?auto_54940 ) ) ( not ( = ?auto_54939 ?auto_54943 ) ) ( not ( = ?auto_54939 ?auto_54944 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54943 ?auto_54944 ?auto_54942 ?auto_54941 )
      ( MAKE-3PILE ?auto_54939 ?auto_54940 ?auto_54941 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54945 - BLOCK
      ?auto_54946 - BLOCK
      ?auto_54947 - BLOCK
    )
    :vars
    (
      ?auto_54948 - BLOCK
      ?auto_54949 - BLOCK
      ?auto_54950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54945 ?auto_54946 ) ) ( not ( = ?auto_54945 ?auto_54947 ) ) ( not ( = ?auto_54946 ?auto_54947 ) ) ( ON ?auto_54947 ?auto_54948 ) ( not ( = ?auto_54945 ?auto_54948 ) ) ( not ( = ?auto_54946 ?auto_54948 ) ) ( not ( = ?auto_54947 ?auto_54948 ) ) ( ON ?auto_54946 ?auto_54947 ) ( CLEAR ?auto_54946 ) ( ON-TABLE ?auto_54949 ) ( ON ?auto_54950 ?auto_54949 ) ( ON ?auto_54948 ?auto_54950 ) ( not ( = ?auto_54949 ?auto_54950 ) ) ( not ( = ?auto_54949 ?auto_54948 ) ) ( not ( = ?auto_54949 ?auto_54947 ) ) ( not ( = ?auto_54949 ?auto_54946 ) ) ( not ( = ?auto_54950 ?auto_54948 ) ) ( not ( = ?auto_54950 ?auto_54947 ) ) ( not ( = ?auto_54950 ?auto_54946 ) ) ( not ( = ?auto_54945 ?auto_54949 ) ) ( not ( = ?auto_54945 ?auto_54950 ) ) ( HOLDING ?auto_54945 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54945 )
      ( MAKE-3PILE ?auto_54945 ?auto_54946 ?auto_54947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54951 - BLOCK
      ?auto_54952 - BLOCK
      ?auto_54953 - BLOCK
    )
    :vars
    (
      ?auto_54954 - BLOCK
      ?auto_54956 - BLOCK
      ?auto_54955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54951 ?auto_54952 ) ) ( not ( = ?auto_54951 ?auto_54953 ) ) ( not ( = ?auto_54952 ?auto_54953 ) ) ( ON ?auto_54953 ?auto_54954 ) ( not ( = ?auto_54951 ?auto_54954 ) ) ( not ( = ?auto_54952 ?auto_54954 ) ) ( not ( = ?auto_54953 ?auto_54954 ) ) ( ON ?auto_54952 ?auto_54953 ) ( ON-TABLE ?auto_54956 ) ( ON ?auto_54955 ?auto_54956 ) ( ON ?auto_54954 ?auto_54955 ) ( not ( = ?auto_54956 ?auto_54955 ) ) ( not ( = ?auto_54956 ?auto_54954 ) ) ( not ( = ?auto_54956 ?auto_54953 ) ) ( not ( = ?auto_54956 ?auto_54952 ) ) ( not ( = ?auto_54955 ?auto_54954 ) ) ( not ( = ?auto_54955 ?auto_54953 ) ) ( not ( = ?auto_54955 ?auto_54952 ) ) ( not ( = ?auto_54951 ?auto_54956 ) ) ( not ( = ?auto_54951 ?auto_54955 ) ) ( ON ?auto_54951 ?auto_54952 ) ( CLEAR ?auto_54951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54956 ?auto_54955 ?auto_54954 ?auto_54953 ?auto_54952 )
      ( MAKE-3PILE ?auto_54951 ?auto_54952 ?auto_54953 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54957 - BLOCK
      ?auto_54958 - BLOCK
      ?auto_54959 - BLOCK
    )
    :vars
    (
      ?auto_54960 - BLOCK
      ?auto_54961 - BLOCK
      ?auto_54962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54957 ?auto_54958 ) ) ( not ( = ?auto_54957 ?auto_54959 ) ) ( not ( = ?auto_54958 ?auto_54959 ) ) ( ON ?auto_54959 ?auto_54960 ) ( not ( = ?auto_54957 ?auto_54960 ) ) ( not ( = ?auto_54958 ?auto_54960 ) ) ( not ( = ?auto_54959 ?auto_54960 ) ) ( ON ?auto_54958 ?auto_54959 ) ( ON-TABLE ?auto_54961 ) ( ON ?auto_54962 ?auto_54961 ) ( ON ?auto_54960 ?auto_54962 ) ( not ( = ?auto_54961 ?auto_54962 ) ) ( not ( = ?auto_54961 ?auto_54960 ) ) ( not ( = ?auto_54961 ?auto_54959 ) ) ( not ( = ?auto_54961 ?auto_54958 ) ) ( not ( = ?auto_54962 ?auto_54960 ) ) ( not ( = ?auto_54962 ?auto_54959 ) ) ( not ( = ?auto_54962 ?auto_54958 ) ) ( not ( = ?auto_54957 ?auto_54961 ) ) ( not ( = ?auto_54957 ?auto_54962 ) ) ( HOLDING ?auto_54957 ) ( CLEAR ?auto_54958 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54961 ?auto_54962 ?auto_54960 ?auto_54959 ?auto_54958 ?auto_54957 )
      ( MAKE-3PILE ?auto_54957 ?auto_54958 ?auto_54959 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54963 - BLOCK
      ?auto_54964 - BLOCK
      ?auto_54965 - BLOCK
    )
    :vars
    (
      ?auto_54966 - BLOCK
      ?auto_54968 - BLOCK
      ?auto_54967 - BLOCK
      ?auto_54969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54963 ?auto_54964 ) ) ( not ( = ?auto_54963 ?auto_54965 ) ) ( not ( = ?auto_54964 ?auto_54965 ) ) ( ON ?auto_54965 ?auto_54966 ) ( not ( = ?auto_54963 ?auto_54966 ) ) ( not ( = ?auto_54964 ?auto_54966 ) ) ( not ( = ?auto_54965 ?auto_54966 ) ) ( ON ?auto_54964 ?auto_54965 ) ( ON-TABLE ?auto_54968 ) ( ON ?auto_54967 ?auto_54968 ) ( ON ?auto_54966 ?auto_54967 ) ( not ( = ?auto_54968 ?auto_54967 ) ) ( not ( = ?auto_54968 ?auto_54966 ) ) ( not ( = ?auto_54968 ?auto_54965 ) ) ( not ( = ?auto_54968 ?auto_54964 ) ) ( not ( = ?auto_54967 ?auto_54966 ) ) ( not ( = ?auto_54967 ?auto_54965 ) ) ( not ( = ?auto_54967 ?auto_54964 ) ) ( not ( = ?auto_54963 ?auto_54968 ) ) ( not ( = ?auto_54963 ?auto_54967 ) ) ( CLEAR ?auto_54964 ) ( ON ?auto_54963 ?auto_54969 ) ( CLEAR ?auto_54963 ) ( HAND-EMPTY ) ( not ( = ?auto_54963 ?auto_54969 ) ) ( not ( = ?auto_54964 ?auto_54969 ) ) ( not ( = ?auto_54965 ?auto_54969 ) ) ( not ( = ?auto_54966 ?auto_54969 ) ) ( not ( = ?auto_54968 ?auto_54969 ) ) ( not ( = ?auto_54967 ?auto_54969 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54963 ?auto_54969 )
      ( MAKE-3PILE ?auto_54963 ?auto_54964 ?auto_54965 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54970 - BLOCK
      ?auto_54971 - BLOCK
      ?auto_54972 - BLOCK
    )
    :vars
    (
      ?auto_54976 - BLOCK
      ?auto_54975 - BLOCK
      ?auto_54974 - BLOCK
      ?auto_54973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54970 ?auto_54971 ) ) ( not ( = ?auto_54970 ?auto_54972 ) ) ( not ( = ?auto_54971 ?auto_54972 ) ) ( ON ?auto_54972 ?auto_54976 ) ( not ( = ?auto_54970 ?auto_54976 ) ) ( not ( = ?auto_54971 ?auto_54976 ) ) ( not ( = ?auto_54972 ?auto_54976 ) ) ( ON-TABLE ?auto_54975 ) ( ON ?auto_54974 ?auto_54975 ) ( ON ?auto_54976 ?auto_54974 ) ( not ( = ?auto_54975 ?auto_54974 ) ) ( not ( = ?auto_54975 ?auto_54976 ) ) ( not ( = ?auto_54975 ?auto_54972 ) ) ( not ( = ?auto_54975 ?auto_54971 ) ) ( not ( = ?auto_54974 ?auto_54976 ) ) ( not ( = ?auto_54974 ?auto_54972 ) ) ( not ( = ?auto_54974 ?auto_54971 ) ) ( not ( = ?auto_54970 ?auto_54975 ) ) ( not ( = ?auto_54970 ?auto_54974 ) ) ( ON ?auto_54970 ?auto_54973 ) ( CLEAR ?auto_54970 ) ( not ( = ?auto_54970 ?auto_54973 ) ) ( not ( = ?auto_54971 ?auto_54973 ) ) ( not ( = ?auto_54972 ?auto_54973 ) ) ( not ( = ?auto_54976 ?auto_54973 ) ) ( not ( = ?auto_54975 ?auto_54973 ) ) ( not ( = ?auto_54974 ?auto_54973 ) ) ( HOLDING ?auto_54971 ) ( CLEAR ?auto_54972 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54975 ?auto_54974 ?auto_54976 ?auto_54972 ?auto_54971 )
      ( MAKE-3PILE ?auto_54970 ?auto_54971 ?auto_54972 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54977 - BLOCK
      ?auto_54978 - BLOCK
      ?auto_54979 - BLOCK
    )
    :vars
    (
      ?auto_54982 - BLOCK
      ?auto_54980 - BLOCK
      ?auto_54983 - BLOCK
      ?auto_54981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54977 ?auto_54978 ) ) ( not ( = ?auto_54977 ?auto_54979 ) ) ( not ( = ?auto_54978 ?auto_54979 ) ) ( ON ?auto_54979 ?auto_54982 ) ( not ( = ?auto_54977 ?auto_54982 ) ) ( not ( = ?auto_54978 ?auto_54982 ) ) ( not ( = ?auto_54979 ?auto_54982 ) ) ( ON-TABLE ?auto_54980 ) ( ON ?auto_54983 ?auto_54980 ) ( ON ?auto_54982 ?auto_54983 ) ( not ( = ?auto_54980 ?auto_54983 ) ) ( not ( = ?auto_54980 ?auto_54982 ) ) ( not ( = ?auto_54980 ?auto_54979 ) ) ( not ( = ?auto_54980 ?auto_54978 ) ) ( not ( = ?auto_54983 ?auto_54982 ) ) ( not ( = ?auto_54983 ?auto_54979 ) ) ( not ( = ?auto_54983 ?auto_54978 ) ) ( not ( = ?auto_54977 ?auto_54980 ) ) ( not ( = ?auto_54977 ?auto_54983 ) ) ( ON ?auto_54977 ?auto_54981 ) ( not ( = ?auto_54977 ?auto_54981 ) ) ( not ( = ?auto_54978 ?auto_54981 ) ) ( not ( = ?auto_54979 ?auto_54981 ) ) ( not ( = ?auto_54982 ?auto_54981 ) ) ( not ( = ?auto_54980 ?auto_54981 ) ) ( not ( = ?auto_54983 ?auto_54981 ) ) ( CLEAR ?auto_54979 ) ( ON ?auto_54978 ?auto_54977 ) ( CLEAR ?auto_54978 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54981 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54981 ?auto_54977 )
      ( MAKE-3PILE ?auto_54977 ?auto_54978 ?auto_54979 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54984 - BLOCK
      ?auto_54985 - BLOCK
      ?auto_54986 - BLOCK
    )
    :vars
    (
      ?auto_54987 - BLOCK
      ?auto_54990 - BLOCK
      ?auto_54989 - BLOCK
      ?auto_54988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54984 ?auto_54985 ) ) ( not ( = ?auto_54984 ?auto_54986 ) ) ( not ( = ?auto_54985 ?auto_54986 ) ) ( not ( = ?auto_54984 ?auto_54987 ) ) ( not ( = ?auto_54985 ?auto_54987 ) ) ( not ( = ?auto_54986 ?auto_54987 ) ) ( ON-TABLE ?auto_54990 ) ( ON ?auto_54989 ?auto_54990 ) ( ON ?auto_54987 ?auto_54989 ) ( not ( = ?auto_54990 ?auto_54989 ) ) ( not ( = ?auto_54990 ?auto_54987 ) ) ( not ( = ?auto_54990 ?auto_54986 ) ) ( not ( = ?auto_54990 ?auto_54985 ) ) ( not ( = ?auto_54989 ?auto_54987 ) ) ( not ( = ?auto_54989 ?auto_54986 ) ) ( not ( = ?auto_54989 ?auto_54985 ) ) ( not ( = ?auto_54984 ?auto_54990 ) ) ( not ( = ?auto_54984 ?auto_54989 ) ) ( ON ?auto_54984 ?auto_54988 ) ( not ( = ?auto_54984 ?auto_54988 ) ) ( not ( = ?auto_54985 ?auto_54988 ) ) ( not ( = ?auto_54986 ?auto_54988 ) ) ( not ( = ?auto_54987 ?auto_54988 ) ) ( not ( = ?auto_54990 ?auto_54988 ) ) ( not ( = ?auto_54989 ?auto_54988 ) ) ( ON ?auto_54985 ?auto_54984 ) ( CLEAR ?auto_54985 ) ( ON-TABLE ?auto_54988 ) ( HOLDING ?auto_54986 ) ( CLEAR ?auto_54987 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54990 ?auto_54989 ?auto_54987 ?auto_54986 )
      ( MAKE-3PILE ?auto_54984 ?auto_54985 ?auto_54986 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54991 - BLOCK
      ?auto_54992 - BLOCK
      ?auto_54993 - BLOCK
    )
    :vars
    (
      ?auto_54994 - BLOCK
      ?auto_54995 - BLOCK
      ?auto_54997 - BLOCK
      ?auto_54996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54991 ?auto_54992 ) ) ( not ( = ?auto_54991 ?auto_54993 ) ) ( not ( = ?auto_54992 ?auto_54993 ) ) ( not ( = ?auto_54991 ?auto_54994 ) ) ( not ( = ?auto_54992 ?auto_54994 ) ) ( not ( = ?auto_54993 ?auto_54994 ) ) ( ON-TABLE ?auto_54995 ) ( ON ?auto_54997 ?auto_54995 ) ( ON ?auto_54994 ?auto_54997 ) ( not ( = ?auto_54995 ?auto_54997 ) ) ( not ( = ?auto_54995 ?auto_54994 ) ) ( not ( = ?auto_54995 ?auto_54993 ) ) ( not ( = ?auto_54995 ?auto_54992 ) ) ( not ( = ?auto_54997 ?auto_54994 ) ) ( not ( = ?auto_54997 ?auto_54993 ) ) ( not ( = ?auto_54997 ?auto_54992 ) ) ( not ( = ?auto_54991 ?auto_54995 ) ) ( not ( = ?auto_54991 ?auto_54997 ) ) ( ON ?auto_54991 ?auto_54996 ) ( not ( = ?auto_54991 ?auto_54996 ) ) ( not ( = ?auto_54992 ?auto_54996 ) ) ( not ( = ?auto_54993 ?auto_54996 ) ) ( not ( = ?auto_54994 ?auto_54996 ) ) ( not ( = ?auto_54995 ?auto_54996 ) ) ( not ( = ?auto_54997 ?auto_54996 ) ) ( ON ?auto_54992 ?auto_54991 ) ( ON-TABLE ?auto_54996 ) ( CLEAR ?auto_54994 ) ( ON ?auto_54993 ?auto_54992 ) ( CLEAR ?auto_54993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54996 ?auto_54991 ?auto_54992 )
      ( MAKE-3PILE ?auto_54991 ?auto_54992 ?auto_54993 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54998 - BLOCK
      ?auto_54999 - BLOCK
      ?auto_55000 - BLOCK
    )
    :vars
    (
      ?auto_55004 - BLOCK
      ?auto_55001 - BLOCK
      ?auto_55002 - BLOCK
      ?auto_55003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54998 ?auto_54999 ) ) ( not ( = ?auto_54998 ?auto_55000 ) ) ( not ( = ?auto_54999 ?auto_55000 ) ) ( not ( = ?auto_54998 ?auto_55004 ) ) ( not ( = ?auto_54999 ?auto_55004 ) ) ( not ( = ?auto_55000 ?auto_55004 ) ) ( ON-TABLE ?auto_55001 ) ( ON ?auto_55002 ?auto_55001 ) ( not ( = ?auto_55001 ?auto_55002 ) ) ( not ( = ?auto_55001 ?auto_55004 ) ) ( not ( = ?auto_55001 ?auto_55000 ) ) ( not ( = ?auto_55001 ?auto_54999 ) ) ( not ( = ?auto_55002 ?auto_55004 ) ) ( not ( = ?auto_55002 ?auto_55000 ) ) ( not ( = ?auto_55002 ?auto_54999 ) ) ( not ( = ?auto_54998 ?auto_55001 ) ) ( not ( = ?auto_54998 ?auto_55002 ) ) ( ON ?auto_54998 ?auto_55003 ) ( not ( = ?auto_54998 ?auto_55003 ) ) ( not ( = ?auto_54999 ?auto_55003 ) ) ( not ( = ?auto_55000 ?auto_55003 ) ) ( not ( = ?auto_55004 ?auto_55003 ) ) ( not ( = ?auto_55001 ?auto_55003 ) ) ( not ( = ?auto_55002 ?auto_55003 ) ) ( ON ?auto_54999 ?auto_54998 ) ( ON-TABLE ?auto_55003 ) ( ON ?auto_55000 ?auto_54999 ) ( CLEAR ?auto_55000 ) ( HOLDING ?auto_55004 ) ( CLEAR ?auto_55002 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55001 ?auto_55002 ?auto_55004 )
      ( MAKE-3PILE ?auto_54998 ?auto_54999 ?auto_55000 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55005 - BLOCK
      ?auto_55006 - BLOCK
      ?auto_55007 - BLOCK
    )
    :vars
    (
      ?auto_55009 - BLOCK
      ?auto_55010 - BLOCK
      ?auto_55008 - BLOCK
      ?auto_55011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55005 ?auto_55006 ) ) ( not ( = ?auto_55005 ?auto_55007 ) ) ( not ( = ?auto_55006 ?auto_55007 ) ) ( not ( = ?auto_55005 ?auto_55009 ) ) ( not ( = ?auto_55006 ?auto_55009 ) ) ( not ( = ?auto_55007 ?auto_55009 ) ) ( ON-TABLE ?auto_55010 ) ( ON ?auto_55008 ?auto_55010 ) ( not ( = ?auto_55010 ?auto_55008 ) ) ( not ( = ?auto_55010 ?auto_55009 ) ) ( not ( = ?auto_55010 ?auto_55007 ) ) ( not ( = ?auto_55010 ?auto_55006 ) ) ( not ( = ?auto_55008 ?auto_55009 ) ) ( not ( = ?auto_55008 ?auto_55007 ) ) ( not ( = ?auto_55008 ?auto_55006 ) ) ( not ( = ?auto_55005 ?auto_55010 ) ) ( not ( = ?auto_55005 ?auto_55008 ) ) ( ON ?auto_55005 ?auto_55011 ) ( not ( = ?auto_55005 ?auto_55011 ) ) ( not ( = ?auto_55006 ?auto_55011 ) ) ( not ( = ?auto_55007 ?auto_55011 ) ) ( not ( = ?auto_55009 ?auto_55011 ) ) ( not ( = ?auto_55010 ?auto_55011 ) ) ( not ( = ?auto_55008 ?auto_55011 ) ) ( ON ?auto_55006 ?auto_55005 ) ( ON-TABLE ?auto_55011 ) ( ON ?auto_55007 ?auto_55006 ) ( CLEAR ?auto_55008 ) ( ON ?auto_55009 ?auto_55007 ) ( CLEAR ?auto_55009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55011 ?auto_55005 ?auto_55006 ?auto_55007 )
      ( MAKE-3PILE ?auto_55005 ?auto_55006 ?auto_55007 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55012 - BLOCK
      ?auto_55013 - BLOCK
      ?auto_55014 - BLOCK
    )
    :vars
    (
      ?auto_55016 - BLOCK
      ?auto_55018 - BLOCK
      ?auto_55017 - BLOCK
      ?auto_55015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55012 ?auto_55013 ) ) ( not ( = ?auto_55012 ?auto_55014 ) ) ( not ( = ?auto_55013 ?auto_55014 ) ) ( not ( = ?auto_55012 ?auto_55016 ) ) ( not ( = ?auto_55013 ?auto_55016 ) ) ( not ( = ?auto_55014 ?auto_55016 ) ) ( ON-TABLE ?auto_55018 ) ( not ( = ?auto_55018 ?auto_55017 ) ) ( not ( = ?auto_55018 ?auto_55016 ) ) ( not ( = ?auto_55018 ?auto_55014 ) ) ( not ( = ?auto_55018 ?auto_55013 ) ) ( not ( = ?auto_55017 ?auto_55016 ) ) ( not ( = ?auto_55017 ?auto_55014 ) ) ( not ( = ?auto_55017 ?auto_55013 ) ) ( not ( = ?auto_55012 ?auto_55018 ) ) ( not ( = ?auto_55012 ?auto_55017 ) ) ( ON ?auto_55012 ?auto_55015 ) ( not ( = ?auto_55012 ?auto_55015 ) ) ( not ( = ?auto_55013 ?auto_55015 ) ) ( not ( = ?auto_55014 ?auto_55015 ) ) ( not ( = ?auto_55016 ?auto_55015 ) ) ( not ( = ?auto_55018 ?auto_55015 ) ) ( not ( = ?auto_55017 ?auto_55015 ) ) ( ON ?auto_55013 ?auto_55012 ) ( ON-TABLE ?auto_55015 ) ( ON ?auto_55014 ?auto_55013 ) ( ON ?auto_55016 ?auto_55014 ) ( CLEAR ?auto_55016 ) ( HOLDING ?auto_55017 ) ( CLEAR ?auto_55018 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55018 ?auto_55017 )
      ( MAKE-3PILE ?auto_55012 ?auto_55013 ?auto_55014 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55019 - BLOCK
      ?auto_55020 - BLOCK
      ?auto_55021 - BLOCK
    )
    :vars
    (
      ?auto_55024 - BLOCK
      ?auto_55023 - BLOCK
      ?auto_55025 - BLOCK
      ?auto_55022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55019 ?auto_55020 ) ) ( not ( = ?auto_55019 ?auto_55021 ) ) ( not ( = ?auto_55020 ?auto_55021 ) ) ( not ( = ?auto_55019 ?auto_55024 ) ) ( not ( = ?auto_55020 ?auto_55024 ) ) ( not ( = ?auto_55021 ?auto_55024 ) ) ( ON-TABLE ?auto_55023 ) ( not ( = ?auto_55023 ?auto_55025 ) ) ( not ( = ?auto_55023 ?auto_55024 ) ) ( not ( = ?auto_55023 ?auto_55021 ) ) ( not ( = ?auto_55023 ?auto_55020 ) ) ( not ( = ?auto_55025 ?auto_55024 ) ) ( not ( = ?auto_55025 ?auto_55021 ) ) ( not ( = ?auto_55025 ?auto_55020 ) ) ( not ( = ?auto_55019 ?auto_55023 ) ) ( not ( = ?auto_55019 ?auto_55025 ) ) ( ON ?auto_55019 ?auto_55022 ) ( not ( = ?auto_55019 ?auto_55022 ) ) ( not ( = ?auto_55020 ?auto_55022 ) ) ( not ( = ?auto_55021 ?auto_55022 ) ) ( not ( = ?auto_55024 ?auto_55022 ) ) ( not ( = ?auto_55023 ?auto_55022 ) ) ( not ( = ?auto_55025 ?auto_55022 ) ) ( ON ?auto_55020 ?auto_55019 ) ( ON-TABLE ?auto_55022 ) ( ON ?auto_55021 ?auto_55020 ) ( ON ?auto_55024 ?auto_55021 ) ( CLEAR ?auto_55023 ) ( ON ?auto_55025 ?auto_55024 ) ( CLEAR ?auto_55025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55022 ?auto_55019 ?auto_55020 ?auto_55021 ?auto_55024 )
      ( MAKE-3PILE ?auto_55019 ?auto_55020 ?auto_55021 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55026 - BLOCK
      ?auto_55027 - BLOCK
      ?auto_55028 - BLOCK
    )
    :vars
    (
      ?auto_55032 - BLOCK
      ?auto_55030 - BLOCK
      ?auto_55031 - BLOCK
      ?auto_55029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55026 ?auto_55027 ) ) ( not ( = ?auto_55026 ?auto_55028 ) ) ( not ( = ?auto_55027 ?auto_55028 ) ) ( not ( = ?auto_55026 ?auto_55032 ) ) ( not ( = ?auto_55027 ?auto_55032 ) ) ( not ( = ?auto_55028 ?auto_55032 ) ) ( not ( = ?auto_55030 ?auto_55031 ) ) ( not ( = ?auto_55030 ?auto_55032 ) ) ( not ( = ?auto_55030 ?auto_55028 ) ) ( not ( = ?auto_55030 ?auto_55027 ) ) ( not ( = ?auto_55031 ?auto_55032 ) ) ( not ( = ?auto_55031 ?auto_55028 ) ) ( not ( = ?auto_55031 ?auto_55027 ) ) ( not ( = ?auto_55026 ?auto_55030 ) ) ( not ( = ?auto_55026 ?auto_55031 ) ) ( ON ?auto_55026 ?auto_55029 ) ( not ( = ?auto_55026 ?auto_55029 ) ) ( not ( = ?auto_55027 ?auto_55029 ) ) ( not ( = ?auto_55028 ?auto_55029 ) ) ( not ( = ?auto_55032 ?auto_55029 ) ) ( not ( = ?auto_55030 ?auto_55029 ) ) ( not ( = ?auto_55031 ?auto_55029 ) ) ( ON ?auto_55027 ?auto_55026 ) ( ON-TABLE ?auto_55029 ) ( ON ?auto_55028 ?auto_55027 ) ( ON ?auto_55032 ?auto_55028 ) ( ON ?auto_55031 ?auto_55032 ) ( CLEAR ?auto_55031 ) ( HOLDING ?auto_55030 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55030 )
      ( MAKE-3PILE ?auto_55026 ?auto_55027 ?auto_55028 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_55033 - BLOCK
      ?auto_55034 - BLOCK
      ?auto_55035 - BLOCK
    )
    :vars
    (
      ?auto_55036 - BLOCK
      ?auto_55039 - BLOCK
      ?auto_55037 - BLOCK
      ?auto_55038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55033 ?auto_55034 ) ) ( not ( = ?auto_55033 ?auto_55035 ) ) ( not ( = ?auto_55034 ?auto_55035 ) ) ( not ( = ?auto_55033 ?auto_55036 ) ) ( not ( = ?auto_55034 ?auto_55036 ) ) ( not ( = ?auto_55035 ?auto_55036 ) ) ( not ( = ?auto_55039 ?auto_55037 ) ) ( not ( = ?auto_55039 ?auto_55036 ) ) ( not ( = ?auto_55039 ?auto_55035 ) ) ( not ( = ?auto_55039 ?auto_55034 ) ) ( not ( = ?auto_55037 ?auto_55036 ) ) ( not ( = ?auto_55037 ?auto_55035 ) ) ( not ( = ?auto_55037 ?auto_55034 ) ) ( not ( = ?auto_55033 ?auto_55039 ) ) ( not ( = ?auto_55033 ?auto_55037 ) ) ( ON ?auto_55033 ?auto_55038 ) ( not ( = ?auto_55033 ?auto_55038 ) ) ( not ( = ?auto_55034 ?auto_55038 ) ) ( not ( = ?auto_55035 ?auto_55038 ) ) ( not ( = ?auto_55036 ?auto_55038 ) ) ( not ( = ?auto_55039 ?auto_55038 ) ) ( not ( = ?auto_55037 ?auto_55038 ) ) ( ON ?auto_55034 ?auto_55033 ) ( ON-TABLE ?auto_55038 ) ( ON ?auto_55035 ?auto_55034 ) ( ON ?auto_55036 ?auto_55035 ) ( ON ?auto_55037 ?auto_55036 ) ( ON ?auto_55039 ?auto_55037 ) ( CLEAR ?auto_55039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55038 ?auto_55033 ?auto_55034 ?auto_55035 ?auto_55036 ?auto_55037 )
      ( MAKE-3PILE ?auto_55033 ?auto_55034 ?auto_55035 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55042 - BLOCK
      ?auto_55043 - BLOCK
    )
    :vars
    (
      ?auto_55044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55044 ?auto_55043 ) ( CLEAR ?auto_55044 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55042 ) ( ON ?auto_55043 ?auto_55042 ) ( not ( = ?auto_55042 ?auto_55043 ) ) ( not ( = ?auto_55042 ?auto_55044 ) ) ( not ( = ?auto_55043 ?auto_55044 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55044 ?auto_55043 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55045 - BLOCK
      ?auto_55046 - BLOCK
    )
    :vars
    (
      ?auto_55047 - BLOCK
      ?auto_55048 - BLOCK
      ?auto_55049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55047 ?auto_55046 ) ( CLEAR ?auto_55047 ) ( ON-TABLE ?auto_55045 ) ( ON ?auto_55046 ?auto_55045 ) ( not ( = ?auto_55045 ?auto_55046 ) ) ( not ( = ?auto_55045 ?auto_55047 ) ) ( not ( = ?auto_55046 ?auto_55047 ) ) ( HOLDING ?auto_55048 ) ( CLEAR ?auto_55049 ) ( not ( = ?auto_55045 ?auto_55048 ) ) ( not ( = ?auto_55045 ?auto_55049 ) ) ( not ( = ?auto_55046 ?auto_55048 ) ) ( not ( = ?auto_55046 ?auto_55049 ) ) ( not ( = ?auto_55047 ?auto_55048 ) ) ( not ( = ?auto_55047 ?auto_55049 ) ) ( not ( = ?auto_55048 ?auto_55049 ) ) )
    :subtasks
    ( ( !STACK ?auto_55048 ?auto_55049 )
      ( MAKE-2PILE ?auto_55045 ?auto_55046 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55050 - BLOCK
      ?auto_55051 - BLOCK
    )
    :vars
    (
      ?auto_55052 - BLOCK
      ?auto_55054 - BLOCK
      ?auto_55053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55052 ?auto_55051 ) ( ON-TABLE ?auto_55050 ) ( ON ?auto_55051 ?auto_55050 ) ( not ( = ?auto_55050 ?auto_55051 ) ) ( not ( = ?auto_55050 ?auto_55052 ) ) ( not ( = ?auto_55051 ?auto_55052 ) ) ( CLEAR ?auto_55054 ) ( not ( = ?auto_55050 ?auto_55053 ) ) ( not ( = ?auto_55050 ?auto_55054 ) ) ( not ( = ?auto_55051 ?auto_55053 ) ) ( not ( = ?auto_55051 ?auto_55054 ) ) ( not ( = ?auto_55052 ?auto_55053 ) ) ( not ( = ?auto_55052 ?auto_55054 ) ) ( not ( = ?auto_55053 ?auto_55054 ) ) ( ON ?auto_55053 ?auto_55052 ) ( CLEAR ?auto_55053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55050 ?auto_55051 ?auto_55052 )
      ( MAKE-2PILE ?auto_55050 ?auto_55051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55055 - BLOCK
      ?auto_55056 - BLOCK
    )
    :vars
    (
      ?auto_55057 - BLOCK
      ?auto_55059 - BLOCK
      ?auto_55058 - BLOCK
      ?auto_55060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55057 ?auto_55056 ) ( ON-TABLE ?auto_55055 ) ( ON ?auto_55056 ?auto_55055 ) ( not ( = ?auto_55055 ?auto_55056 ) ) ( not ( = ?auto_55055 ?auto_55057 ) ) ( not ( = ?auto_55056 ?auto_55057 ) ) ( not ( = ?auto_55055 ?auto_55059 ) ) ( not ( = ?auto_55055 ?auto_55058 ) ) ( not ( = ?auto_55056 ?auto_55059 ) ) ( not ( = ?auto_55056 ?auto_55058 ) ) ( not ( = ?auto_55057 ?auto_55059 ) ) ( not ( = ?auto_55057 ?auto_55058 ) ) ( not ( = ?auto_55059 ?auto_55058 ) ) ( ON ?auto_55059 ?auto_55057 ) ( CLEAR ?auto_55059 ) ( HOLDING ?auto_55058 ) ( CLEAR ?auto_55060 ) ( ON-TABLE ?auto_55060 ) ( not ( = ?auto_55060 ?auto_55058 ) ) ( not ( = ?auto_55055 ?auto_55060 ) ) ( not ( = ?auto_55056 ?auto_55060 ) ) ( not ( = ?auto_55057 ?auto_55060 ) ) ( not ( = ?auto_55059 ?auto_55060 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55060 ?auto_55058 )
      ( MAKE-2PILE ?auto_55055 ?auto_55056 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55061 - BLOCK
      ?auto_55062 - BLOCK
    )
    :vars
    (
      ?auto_55063 - BLOCK
      ?auto_55066 - BLOCK
      ?auto_55064 - BLOCK
      ?auto_55065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55063 ?auto_55062 ) ( ON-TABLE ?auto_55061 ) ( ON ?auto_55062 ?auto_55061 ) ( not ( = ?auto_55061 ?auto_55062 ) ) ( not ( = ?auto_55061 ?auto_55063 ) ) ( not ( = ?auto_55062 ?auto_55063 ) ) ( not ( = ?auto_55061 ?auto_55066 ) ) ( not ( = ?auto_55061 ?auto_55064 ) ) ( not ( = ?auto_55062 ?auto_55066 ) ) ( not ( = ?auto_55062 ?auto_55064 ) ) ( not ( = ?auto_55063 ?auto_55066 ) ) ( not ( = ?auto_55063 ?auto_55064 ) ) ( not ( = ?auto_55066 ?auto_55064 ) ) ( ON ?auto_55066 ?auto_55063 ) ( CLEAR ?auto_55065 ) ( ON-TABLE ?auto_55065 ) ( not ( = ?auto_55065 ?auto_55064 ) ) ( not ( = ?auto_55061 ?auto_55065 ) ) ( not ( = ?auto_55062 ?auto_55065 ) ) ( not ( = ?auto_55063 ?auto_55065 ) ) ( not ( = ?auto_55066 ?auto_55065 ) ) ( ON ?auto_55064 ?auto_55066 ) ( CLEAR ?auto_55064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55061 ?auto_55062 ?auto_55063 ?auto_55066 )
      ( MAKE-2PILE ?auto_55061 ?auto_55062 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55067 - BLOCK
      ?auto_55068 - BLOCK
    )
    :vars
    (
      ?auto_55069 - BLOCK
      ?auto_55071 - BLOCK
      ?auto_55070 - BLOCK
      ?auto_55072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55069 ?auto_55068 ) ( ON-TABLE ?auto_55067 ) ( ON ?auto_55068 ?auto_55067 ) ( not ( = ?auto_55067 ?auto_55068 ) ) ( not ( = ?auto_55067 ?auto_55069 ) ) ( not ( = ?auto_55068 ?auto_55069 ) ) ( not ( = ?auto_55067 ?auto_55071 ) ) ( not ( = ?auto_55067 ?auto_55070 ) ) ( not ( = ?auto_55068 ?auto_55071 ) ) ( not ( = ?auto_55068 ?auto_55070 ) ) ( not ( = ?auto_55069 ?auto_55071 ) ) ( not ( = ?auto_55069 ?auto_55070 ) ) ( not ( = ?auto_55071 ?auto_55070 ) ) ( ON ?auto_55071 ?auto_55069 ) ( not ( = ?auto_55072 ?auto_55070 ) ) ( not ( = ?auto_55067 ?auto_55072 ) ) ( not ( = ?auto_55068 ?auto_55072 ) ) ( not ( = ?auto_55069 ?auto_55072 ) ) ( not ( = ?auto_55071 ?auto_55072 ) ) ( ON ?auto_55070 ?auto_55071 ) ( CLEAR ?auto_55070 ) ( HOLDING ?auto_55072 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55072 )
      ( MAKE-2PILE ?auto_55067 ?auto_55068 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55073 - BLOCK
      ?auto_55074 - BLOCK
    )
    :vars
    (
      ?auto_55078 - BLOCK
      ?auto_55076 - BLOCK
      ?auto_55077 - BLOCK
      ?auto_55075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55078 ?auto_55074 ) ( ON-TABLE ?auto_55073 ) ( ON ?auto_55074 ?auto_55073 ) ( not ( = ?auto_55073 ?auto_55074 ) ) ( not ( = ?auto_55073 ?auto_55078 ) ) ( not ( = ?auto_55074 ?auto_55078 ) ) ( not ( = ?auto_55073 ?auto_55076 ) ) ( not ( = ?auto_55073 ?auto_55077 ) ) ( not ( = ?auto_55074 ?auto_55076 ) ) ( not ( = ?auto_55074 ?auto_55077 ) ) ( not ( = ?auto_55078 ?auto_55076 ) ) ( not ( = ?auto_55078 ?auto_55077 ) ) ( not ( = ?auto_55076 ?auto_55077 ) ) ( ON ?auto_55076 ?auto_55078 ) ( not ( = ?auto_55075 ?auto_55077 ) ) ( not ( = ?auto_55073 ?auto_55075 ) ) ( not ( = ?auto_55074 ?auto_55075 ) ) ( not ( = ?auto_55078 ?auto_55075 ) ) ( not ( = ?auto_55076 ?auto_55075 ) ) ( ON ?auto_55077 ?auto_55076 ) ( ON ?auto_55075 ?auto_55077 ) ( CLEAR ?auto_55075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55073 ?auto_55074 ?auto_55078 ?auto_55076 ?auto_55077 )
      ( MAKE-2PILE ?auto_55073 ?auto_55074 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55079 - BLOCK
      ?auto_55080 - BLOCK
    )
    :vars
    (
      ?auto_55083 - BLOCK
      ?auto_55084 - BLOCK
      ?auto_55082 - BLOCK
      ?auto_55081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55083 ?auto_55080 ) ( ON-TABLE ?auto_55079 ) ( ON ?auto_55080 ?auto_55079 ) ( not ( = ?auto_55079 ?auto_55080 ) ) ( not ( = ?auto_55079 ?auto_55083 ) ) ( not ( = ?auto_55080 ?auto_55083 ) ) ( not ( = ?auto_55079 ?auto_55084 ) ) ( not ( = ?auto_55079 ?auto_55082 ) ) ( not ( = ?auto_55080 ?auto_55084 ) ) ( not ( = ?auto_55080 ?auto_55082 ) ) ( not ( = ?auto_55083 ?auto_55084 ) ) ( not ( = ?auto_55083 ?auto_55082 ) ) ( not ( = ?auto_55084 ?auto_55082 ) ) ( ON ?auto_55084 ?auto_55083 ) ( not ( = ?auto_55081 ?auto_55082 ) ) ( not ( = ?auto_55079 ?auto_55081 ) ) ( not ( = ?auto_55080 ?auto_55081 ) ) ( not ( = ?auto_55083 ?auto_55081 ) ) ( not ( = ?auto_55084 ?auto_55081 ) ) ( ON ?auto_55082 ?auto_55084 ) ( HOLDING ?auto_55081 ) ( CLEAR ?auto_55082 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55079 ?auto_55080 ?auto_55083 ?auto_55084 ?auto_55082 ?auto_55081 )
      ( MAKE-2PILE ?auto_55079 ?auto_55080 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55085 - BLOCK
      ?auto_55086 - BLOCK
    )
    :vars
    (
      ?auto_55089 - BLOCK
      ?auto_55088 - BLOCK
      ?auto_55090 - BLOCK
      ?auto_55087 - BLOCK
      ?auto_55091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55089 ?auto_55086 ) ( ON-TABLE ?auto_55085 ) ( ON ?auto_55086 ?auto_55085 ) ( not ( = ?auto_55085 ?auto_55086 ) ) ( not ( = ?auto_55085 ?auto_55089 ) ) ( not ( = ?auto_55086 ?auto_55089 ) ) ( not ( = ?auto_55085 ?auto_55088 ) ) ( not ( = ?auto_55085 ?auto_55090 ) ) ( not ( = ?auto_55086 ?auto_55088 ) ) ( not ( = ?auto_55086 ?auto_55090 ) ) ( not ( = ?auto_55089 ?auto_55088 ) ) ( not ( = ?auto_55089 ?auto_55090 ) ) ( not ( = ?auto_55088 ?auto_55090 ) ) ( ON ?auto_55088 ?auto_55089 ) ( not ( = ?auto_55087 ?auto_55090 ) ) ( not ( = ?auto_55085 ?auto_55087 ) ) ( not ( = ?auto_55086 ?auto_55087 ) ) ( not ( = ?auto_55089 ?auto_55087 ) ) ( not ( = ?auto_55088 ?auto_55087 ) ) ( ON ?auto_55090 ?auto_55088 ) ( CLEAR ?auto_55090 ) ( ON ?auto_55087 ?auto_55091 ) ( CLEAR ?auto_55087 ) ( HAND-EMPTY ) ( not ( = ?auto_55085 ?auto_55091 ) ) ( not ( = ?auto_55086 ?auto_55091 ) ) ( not ( = ?auto_55089 ?auto_55091 ) ) ( not ( = ?auto_55088 ?auto_55091 ) ) ( not ( = ?auto_55090 ?auto_55091 ) ) ( not ( = ?auto_55087 ?auto_55091 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55087 ?auto_55091 )
      ( MAKE-2PILE ?auto_55085 ?auto_55086 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55092 - BLOCK
      ?auto_55093 - BLOCK
    )
    :vars
    (
      ?auto_55097 - BLOCK
      ?auto_55098 - BLOCK
      ?auto_55096 - BLOCK
      ?auto_55095 - BLOCK
      ?auto_55094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55097 ?auto_55093 ) ( ON-TABLE ?auto_55092 ) ( ON ?auto_55093 ?auto_55092 ) ( not ( = ?auto_55092 ?auto_55093 ) ) ( not ( = ?auto_55092 ?auto_55097 ) ) ( not ( = ?auto_55093 ?auto_55097 ) ) ( not ( = ?auto_55092 ?auto_55098 ) ) ( not ( = ?auto_55092 ?auto_55096 ) ) ( not ( = ?auto_55093 ?auto_55098 ) ) ( not ( = ?auto_55093 ?auto_55096 ) ) ( not ( = ?auto_55097 ?auto_55098 ) ) ( not ( = ?auto_55097 ?auto_55096 ) ) ( not ( = ?auto_55098 ?auto_55096 ) ) ( ON ?auto_55098 ?auto_55097 ) ( not ( = ?auto_55095 ?auto_55096 ) ) ( not ( = ?auto_55092 ?auto_55095 ) ) ( not ( = ?auto_55093 ?auto_55095 ) ) ( not ( = ?auto_55097 ?auto_55095 ) ) ( not ( = ?auto_55098 ?auto_55095 ) ) ( ON ?auto_55095 ?auto_55094 ) ( CLEAR ?auto_55095 ) ( not ( = ?auto_55092 ?auto_55094 ) ) ( not ( = ?auto_55093 ?auto_55094 ) ) ( not ( = ?auto_55097 ?auto_55094 ) ) ( not ( = ?auto_55098 ?auto_55094 ) ) ( not ( = ?auto_55096 ?auto_55094 ) ) ( not ( = ?auto_55095 ?auto_55094 ) ) ( HOLDING ?auto_55096 ) ( CLEAR ?auto_55098 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55092 ?auto_55093 ?auto_55097 ?auto_55098 ?auto_55096 )
      ( MAKE-2PILE ?auto_55092 ?auto_55093 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55099 - BLOCK
      ?auto_55100 - BLOCK
    )
    :vars
    (
      ?auto_55102 - BLOCK
      ?auto_55101 - BLOCK
      ?auto_55104 - BLOCK
      ?auto_55103 - BLOCK
      ?auto_55105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55102 ?auto_55100 ) ( ON-TABLE ?auto_55099 ) ( ON ?auto_55100 ?auto_55099 ) ( not ( = ?auto_55099 ?auto_55100 ) ) ( not ( = ?auto_55099 ?auto_55102 ) ) ( not ( = ?auto_55100 ?auto_55102 ) ) ( not ( = ?auto_55099 ?auto_55101 ) ) ( not ( = ?auto_55099 ?auto_55104 ) ) ( not ( = ?auto_55100 ?auto_55101 ) ) ( not ( = ?auto_55100 ?auto_55104 ) ) ( not ( = ?auto_55102 ?auto_55101 ) ) ( not ( = ?auto_55102 ?auto_55104 ) ) ( not ( = ?auto_55101 ?auto_55104 ) ) ( ON ?auto_55101 ?auto_55102 ) ( not ( = ?auto_55103 ?auto_55104 ) ) ( not ( = ?auto_55099 ?auto_55103 ) ) ( not ( = ?auto_55100 ?auto_55103 ) ) ( not ( = ?auto_55102 ?auto_55103 ) ) ( not ( = ?auto_55101 ?auto_55103 ) ) ( ON ?auto_55103 ?auto_55105 ) ( not ( = ?auto_55099 ?auto_55105 ) ) ( not ( = ?auto_55100 ?auto_55105 ) ) ( not ( = ?auto_55102 ?auto_55105 ) ) ( not ( = ?auto_55101 ?auto_55105 ) ) ( not ( = ?auto_55104 ?auto_55105 ) ) ( not ( = ?auto_55103 ?auto_55105 ) ) ( CLEAR ?auto_55101 ) ( ON ?auto_55104 ?auto_55103 ) ( CLEAR ?auto_55104 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55105 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55105 ?auto_55103 )
      ( MAKE-2PILE ?auto_55099 ?auto_55100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55106 - BLOCK
      ?auto_55107 - BLOCK
    )
    :vars
    (
      ?auto_55108 - BLOCK
      ?auto_55111 - BLOCK
      ?auto_55112 - BLOCK
      ?auto_55109 - BLOCK
      ?auto_55110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55108 ?auto_55107 ) ( ON-TABLE ?auto_55106 ) ( ON ?auto_55107 ?auto_55106 ) ( not ( = ?auto_55106 ?auto_55107 ) ) ( not ( = ?auto_55106 ?auto_55108 ) ) ( not ( = ?auto_55107 ?auto_55108 ) ) ( not ( = ?auto_55106 ?auto_55111 ) ) ( not ( = ?auto_55106 ?auto_55112 ) ) ( not ( = ?auto_55107 ?auto_55111 ) ) ( not ( = ?auto_55107 ?auto_55112 ) ) ( not ( = ?auto_55108 ?auto_55111 ) ) ( not ( = ?auto_55108 ?auto_55112 ) ) ( not ( = ?auto_55111 ?auto_55112 ) ) ( not ( = ?auto_55109 ?auto_55112 ) ) ( not ( = ?auto_55106 ?auto_55109 ) ) ( not ( = ?auto_55107 ?auto_55109 ) ) ( not ( = ?auto_55108 ?auto_55109 ) ) ( not ( = ?auto_55111 ?auto_55109 ) ) ( ON ?auto_55109 ?auto_55110 ) ( not ( = ?auto_55106 ?auto_55110 ) ) ( not ( = ?auto_55107 ?auto_55110 ) ) ( not ( = ?auto_55108 ?auto_55110 ) ) ( not ( = ?auto_55111 ?auto_55110 ) ) ( not ( = ?auto_55112 ?auto_55110 ) ) ( not ( = ?auto_55109 ?auto_55110 ) ) ( ON ?auto_55112 ?auto_55109 ) ( CLEAR ?auto_55112 ) ( ON-TABLE ?auto_55110 ) ( HOLDING ?auto_55111 ) ( CLEAR ?auto_55108 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55106 ?auto_55107 ?auto_55108 ?auto_55111 )
      ( MAKE-2PILE ?auto_55106 ?auto_55107 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55113 - BLOCK
      ?auto_55114 - BLOCK
    )
    :vars
    (
      ?auto_55118 - BLOCK
      ?auto_55115 - BLOCK
      ?auto_55117 - BLOCK
      ?auto_55116 - BLOCK
      ?auto_55119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55118 ?auto_55114 ) ( ON-TABLE ?auto_55113 ) ( ON ?auto_55114 ?auto_55113 ) ( not ( = ?auto_55113 ?auto_55114 ) ) ( not ( = ?auto_55113 ?auto_55118 ) ) ( not ( = ?auto_55114 ?auto_55118 ) ) ( not ( = ?auto_55113 ?auto_55115 ) ) ( not ( = ?auto_55113 ?auto_55117 ) ) ( not ( = ?auto_55114 ?auto_55115 ) ) ( not ( = ?auto_55114 ?auto_55117 ) ) ( not ( = ?auto_55118 ?auto_55115 ) ) ( not ( = ?auto_55118 ?auto_55117 ) ) ( not ( = ?auto_55115 ?auto_55117 ) ) ( not ( = ?auto_55116 ?auto_55117 ) ) ( not ( = ?auto_55113 ?auto_55116 ) ) ( not ( = ?auto_55114 ?auto_55116 ) ) ( not ( = ?auto_55118 ?auto_55116 ) ) ( not ( = ?auto_55115 ?auto_55116 ) ) ( ON ?auto_55116 ?auto_55119 ) ( not ( = ?auto_55113 ?auto_55119 ) ) ( not ( = ?auto_55114 ?auto_55119 ) ) ( not ( = ?auto_55118 ?auto_55119 ) ) ( not ( = ?auto_55115 ?auto_55119 ) ) ( not ( = ?auto_55117 ?auto_55119 ) ) ( not ( = ?auto_55116 ?auto_55119 ) ) ( ON ?auto_55117 ?auto_55116 ) ( ON-TABLE ?auto_55119 ) ( CLEAR ?auto_55118 ) ( ON ?auto_55115 ?auto_55117 ) ( CLEAR ?auto_55115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55119 ?auto_55116 ?auto_55117 )
      ( MAKE-2PILE ?auto_55113 ?auto_55114 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55134 - BLOCK
      ?auto_55135 - BLOCK
    )
    :vars
    (
      ?auto_55137 - BLOCK
      ?auto_55140 - BLOCK
      ?auto_55139 - BLOCK
      ?auto_55136 - BLOCK
      ?auto_55138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55134 ) ( not ( = ?auto_55134 ?auto_55135 ) ) ( not ( = ?auto_55134 ?auto_55137 ) ) ( not ( = ?auto_55135 ?auto_55137 ) ) ( not ( = ?auto_55134 ?auto_55140 ) ) ( not ( = ?auto_55134 ?auto_55139 ) ) ( not ( = ?auto_55135 ?auto_55140 ) ) ( not ( = ?auto_55135 ?auto_55139 ) ) ( not ( = ?auto_55137 ?auto_55140 ) ) ( not ( = ?auto_55137 ?auto_55139 ) ) ( not ( = ?auto_55140 ?auto_55139 ) ) ( not ( = ?auto_55136 ?auto_55139 ) ) ( not ( = ?auto_55134 ?auto_55136 ) ) ( not ( = ?auto_55135 ?auto_55136 ) ) ( not ( = ?auto_55137 ?auto_55136 ) ) ( not ( = ?auto_55140 ?auto_55136 ) ) ( ON ?auto_55136 ?auto_55138 ) ( not ( = ?auto_55134 ?auto_55138 ) ) ( not ( = ?auto_55135 ?auto_55138 ) ) ( not ( = ?auto_55137 ?auto_55138 ) ) ( not ( = ?auto_55140 ?auto_55138 ) ) ( not ( = ?auto_55139 ?auto_55138 ) ) ( not ( = ?auto_55136 ?auto_55138 ) ) ( ON ?auto_55139 ?auto_55136 ) ( ON-TABLE ?auto_55138 ) ( ON ?auto_55140 ?auto_55139 ) ( ON ?auto_55137 ?auto_55140 ) ( CLEAR ?auto_55137 ) ( HOLDING ?auto_55135 ) ( CLEAR ?auto_55134 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55134 ?auto_55135 ?auto_55137 )
      ( MAKE-2PILE ?auto_55134 ?auto_55135 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55141 - BLOCK
      ?auto_55142 - BLOCK
    )
    :vars
    (
      ?auto_55144 - BLOCK
      ?auto_55146 - BLOCK
      ?auto_55143 - BLOCK
      ?auto_55145 - BLOCK
      ?auto_55147 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55141 ) ( not ( = ?auto_55141 ?auto_55142 ) ) ( not ( = ?auto_55141 ?auto_55144 ) ) ( not ( = ?auto_55142 ?auto_55144 ) ) ( not ( = ?auto_55141 ?auto_55146 ) ) ( not ( = ?auto_55141 ?auto_55143 ) ) ( not ( = ?auto_55142 ?auto_55146 ) ) ( not ( = ?auto_55142 ?auto_55143 ) ) ( not ( = ?auto_55144 ?auto_55146 ) ) ( not ( = ?auto_55144 ?auto_55143 ) ) ( not ( = ?auto_55146 ?auto_55143 ) ) ( not ( = ?auto_55145 ?auto_55143 ) ) ( not ( = ?auto_55141 ?auto_55145 ) ) ( not ( = ?auto_55142 ?auto_55145 ) ) ( not ( = ?auto_55144 ?auto_55145 ) ) ( not ( = ?auto_55146 ?auto_55145 ) ) ( ON ?auto_55145 ?auto_55147 ) ( not ( = ?auto_55141 ?auto_55147 ) ) ( not ( = ?auto_55142 ?auto_55147 ) ) ( not ( = ?auto_55144 ?auto_55147 ) ) ( not ( = ?auto_55146 ?auto_55147 ) ) ( not ( = ?auto_55143 ?auto_55147 ) ) ( not ( = ?auto_55145 ?auto_55147 ) ) ( ON ?auto_55143 ?auto_55145 ) ( ON-TABLE ?auto_55147 ) ( ON ?auto_55146 ?auto_55143 ) ( ON ?auto_55144 ?auto_55146 ) ( CLEAR ?auto_55141 ) ( ON ?auto_55142 ?auto_55144 ) ( CLEAR ?auto_55142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55147 ?auto_55145 ?auto_55143 ?auto_55146 ?auto_55144 )
      ( MAKE-2PILE ?auto_55141 ?auto_55142 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55148 - BLOCK
      ?auto_55149 - BLOCK
    )
    :vars
    (
      ?auto_55151 - BLOCK
      ?auto_55154 - BLOCK
      ?auto_55153 - BLOCK
      ?auto_55152 - BLOCK
      ?auto_55150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55148 ?auto_55149 ) ) ( not ( = ?auto_55148 ?auto_55151 ) ) ( not ( = ?auto_55149 ?auto_55151 ) ) ( not ( = ?auto_55148 ?auto_55154 ) ) ( not ( = ?auto_55148 ?auto_55153 ) ) ( not ( = ?auto_55149 ?auto_55154 ) ) ( not ( = ?auto_55149 ?auto_55153 ) ) ( not ( = ?auto_55151 ?auto_55154 ) ) ( not ( = ?auto_55151 ?auto_55153 ) ) ( not ( = ?auto_55154 ?auto_55153 ) ) ( not ( = ?auto_55152 ?auto_55153 ) ) ( not ( = ?auto_55148 ?auto_55152 ) ) ( not ( = ?auto_55149 ?auto_55152 ) ) ( not ( = ?auto_55151 ?auto_55152 ) ) ( not ( = ?auto_55154 ?auto_55152 ) ) ( ON ?auto_55152 ?auto_55150 ) ( not ( = ?auto_55148 ?auto_55150 ) ) ( not ( = ?auto_55149 ?auto_55150 ) ) ( not ( = ?auto_55151 ?auto_55150 ) ) ( not ( = ?auto_55154 ?auto_55150 ) ) ( not ( = ?auto_55153 ?auto_55150 ) ) ( not ( = ?auto_55152 ?auto_55150 ) ) ( ON ?auto_55153 ?auto_55152 ) ( ON-TABLE ?auto_55150 ) ( ON ?auto_55154 ?auto_55153 ) ( ON ?auto_55151 ?auto_55154 ) ( ON ?auto_55149 ?auto_55151 ) ( CLEAR ?auto_55149 ) ( HOLDING ?auto_55148 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55148 )
      ( MAKE-2PILE ?auto_55148 ?auto_55149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55155 - BLOCK
      ?auto_55156 - BLOCK
    )
    :vars
    (
      ?auto_55160 - BLOCK
      ?auto_55158 - BLOCK
      ?auto_55161 - BLOCK
      ?auto_55157 - BLOCK
      ?auto_55159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55155 ?auto_55156 ) ) ( not ( = ?auto_55155 ?auto_55160 ) ) ( not ( = ?auto_55156 ?auto_55160 ) ) ( not ( = ?auto_55155 ?auto_55158 ) ) ( not ( = ?auto_55155 ?auto_55161 ) ) ( not ( = ?auto_55156 ?auto_55158 ) ) ( not ( = ?auto_55156 ?auto_55161 ) ) ( not ( = ?auto_55160 ?auto_55158 ) ) ( not ( = ?auto_55160 ?auto_55161 ) ) ( not ( = ?auto_55158 ?auto_55161 ) ) ( not ( = ?auto_55157 ?auto_55161 ) ) ( not ( = ?auto_55155 ?auto_55157 ) ) ( not ( = ?auto_55156 ?auto_55157 ) ) ( not ( = ?auto_55160 ?auto_55157 ) ) ( not ( = ?auto_55158 ?auto_55157 ) ) ( ON ?auto_55157 ?auto_55159 ) ( not ( = ?auto_55155 ?auto_55159 ) ) ( not ( = ?auto_55156 ?auto_55159 ) ) ( not ( = ?auto_55160 ?auto_55159 ) ) ( not ( = ?auto_55158 ?auto_55159 ) ) ( not ( = ?auto_55161 ?auto_55159 ) ) ( not ( = ?auto_55157 ?auto_55159 ) ) ( ON ?auto_55161 ?auto_55157 ) ( ON-TABLE ?auto_55159 ) ( ON ?auto_55158 ?auto_55161 ) ( ON ?auto_55160 ?auto_55158 ) ( ON ?auto_55156 ?auto_55160 ) ( ON ?auto_55155 ?auto_55156 ) ( CLEAR ?auto_55155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55159 ?auto_55157 ?auto_55161 ?auto_55158 ?auto_55160 ?auto_55156 )
      ( MAKE-2PILE ?auto_55155 ?auto_55156 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55166 - BLOCK
      ?auto_55167 - BLOCK
      ?auto_55168 - BLOCK
      ?auto_55169 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_55169 ) ( CLEAR ?auto_55168 ) ( ON-TABLE ?auto_55166 ) ( ON ?auto_55167 ?auto_55166 ) ( ON ?auto_55168 ?auto_55167 ) ( not ( = ?auto_55166 ?auto_55167 ) ) ( not ( = ?auto_55166 ?auto_55168 ) ) ( not ( = ?auto_55166 ?auto_55169 ) ) ( not ( = ?auto_55167 ?auto_55168 ) ) ( not ( = ?auto_55167 ?auto_55169 ) ) ( not ( = ?auto_55168 ?auto_55169 ) ) )
    :subtasks
    ( ( !STACK ?auto_55169 ?auto_55168 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55170 - BLOCK
      ?auto_55171 - BLOCK
      ?auto_55172 - BLOCK
      ?auto_55173 - BLOCK
    )
    :vars
    (
      ?auto_55174 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55172 ) ( ON-TABLE ?auto_55170 ) ( ON ?auto_55171 ?auto_55170 ) ( ON ?auto_55172 ?auto_55171 ) ( not ( = ?auto_55170 ?auto_55171 ) ) ( not ( = ?auto_55170 ?auto_55172 ) ) ( not ( = ?auto_55170 ?auto_55173 ) ) ( not ( = ?auto_55171 ?auto_55172 ) ) ( not ( = ?auto_55171 ?auto_55173 ) ) ( not ( = ?auto_55172 ?auto_55173 ) ) ( ON ?auto_55173 ?auto_55174 ) ( CLEAR ?auto_55173 ) ( HAND-EMPTY ) ( not ( = ?auto_55170 ?auto_55174 ) ) ( not ( = ?auto_55171 ?auto_55174 ) ) ( not ( = ?auto_55172 ?auto_55174 ) ) ( not ( = ?auto_55173 ?auto_55174 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55173 ?auto_55174 )
      ( MAKE-4PILE ?auto_55170 ?auto_55171 ?auto_55172 ?auto_55173 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55175 - BLOCK
      ?auto_55176 - BLOCK
      ?auto_55177 - BLOCK
      ?auto_55178 - BLOCK
    )
    :vars
    (
      ?auto_55179 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55175 ) ( ON ?auto_55176 ?auto_55175 ) ( not ( = ?auto_55175 ?auto_55176 ) ) ( not ( = ?auto_55175 ?auto_55177 ) ) ( not ( = ?auto_55175 ?auto_55178 ) ) ( not ( = ?auto_55176 ?auto_55177 ) ) ( not ( = ?auto_55176 ?auto_55178 ) ) ( not ( = ?auto_55177 ?auto_55178 ) ) ( ON ?auto_55178 ?auto_55179 ) ( CLEAR ?auto_55178 ) ( not ( = ?auto_55175 ?auto_55179 ) ) ( not ( = ?auto_55176 ?auto_55179 ) ) ( not ( = ?auto_55177 ?auto_55179 ) ) ( not ( = ?auto_55178 ?auto_55179 ) ) ( HOLDING ?auto_55177 ) ( CLEAR ?auto_55176 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55175 ?auto_55176 ?auto_55177 )
      ( MAKE-4PILE ?auto_55175 ?auto_55176 ?auto_55177 ?auto_55178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55180 - BLOCK
      ?auto_55181 - BLOCK
      ?auto_55182 - BLOCK
      ?auto_55183 - BLOCK
    )
    :vars
    (
      ?auto_55184 - BLOCK
      ?auto_55185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55180 ) ( ON ?auto_55181 ?auto_55180 ) ( not ( = ?auto_55180 ?auto_55181 ) ) ( not ( = ?auto_55180 ?auto_55182 ) ) ( not ( = ?auto_55180 ?auto_55183 ) ) ( not ( = ?auto_55181 ?auto_55182 ) ) ( not ( = ?auto_55181 ?auto_55183 ) ) ( not ( = ?auto_55182 ?auto_55183 ) ) ( ON ?auto_55183 ?auto_55184 ) ( not ( = ?auto_55180 ?auto_55184 ) ) ( not ( = ?auto_55181 ?auto_55184 ) ) ( not ( = ?auto_55182 ?auto_55184 ) ) ( not ( = ?auto_55183 ?auto_55184 ) ) ( CLEAR ?auto_55181 ) ( ON ?auto_55182 ?auto_55183 ) ( CLEAR ?auto_55182 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55185 ) ( ON ?auto_55184 ?auto_55185 ) ( not ( = ?auto_55185 ?auto_55184 ) ) ( not ( = ?auto_55185 ?auto_55183 ) ) ( not ( = ?auto_55185 ?auto_55182 ) ) ( not ( = ?auto_55180 ?auto_55185 ) ) ( not ( = ?auto_55181 ?auto_55185 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55185 ?auto_55184 ?auto_55183 )
      ( MAKE-4PILE ?auto_55180 ?auto_55181 ?auto_55182 ?auto_55183 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55186 - BLOCK
      ?auto_55187 - BLOCK
      ?auto_55188 - BLOCK
      ?auto_55189 - BLOCK
    )
    :vars
    (
      ?auto_55190 - BLOCK
      ?auto_55191 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55186 ) ( not ( = ?auto_55186 ?auto_55187 ) ) ( not ( = ?auto_55186 ?auto_55188 ) ) ( not ( = ?auto_55186 ?auto_55189 ) ) ( not ( = ?auto_55187 ?auto_55188 ) ) ( not ( = ?auto_55187 ?auto_55189 ) ) ( not ( = ?auto_55188 ?auto_55189 ) ) ( ON ?auto_55189 ?auto_55190 ) ( not ( = ?auto_55186 ?auto_55190 ) ) ( not ( = ?auto_55187 ?auto_55190 ) ) ( not ( = ?auto_55188 ?auto_55190 ) ) ( not ( = ?auto_55189 ?auto_55190 ) ) ( ON ?auto_55188 ?auto_55189 ) ( CLEAR ?auto_55188 ) ( ON-TABLE ?auto_55191 ) ( ON ?auto_55190 ?auto_55191 ) ( not ( = ?auto_55191 ?auto_55190 ) ) ( not ( = ?auto_55191 ?auto_55189 ) ) ( not ( = ?auto_55191 ?auto_55188 ) ) ( not ( = ?auto_55186 ?auto_55191 ) ) ( not ( = ?auto_55187 ?auto_55191 ) ) ( HOLDING ?auto_55187 ) ( CLEAR ?auto_55186 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55186 ?auto_55187 )
      ( MAKE-4PILE ?auto_55186 ?auto_55187 ?auto_55188 ?auto_55189 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55192 - BLOCK
      ?auto_55193 - BLOCK
      ?auto_55194 - BLOCK
      ?auto_55195 - BLOCK
    )
    :vars
    (
      ?auto_55196 - BLOCK
      ?auto_55197 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55192 ) ( not ( = ?auto_55192 ?auto_55193 ) ) ( not ( = ?auto_55192 ?auto_55194 ) ) ( not ( = ?auto_55192 ?auto_55195 ) ) ( not ( = ?auto_55193 ?auto_55194 ) ) ( not ( = ?auto_55193 ?auto_55195 ) ) ( not ( = ?auto_55194 ?auto_55195 ) ) ( ON ?auto_55195 ?auto_55196 ) ( not ( = ?auto_55192 ?auto_55196 ) ) ( not ( = ?auto_55193 ?auto_55196 ) ) ( not ( = ?auto_55194 ?auto_55196 ) ) ( not ( = ?auto_55195 ?auto_55196 ) ) ( ON ?auto_55194 ?auto_55195 ) ( ON-TABLE ?auto_55197 ) ( ON ?auto_55196 ?auto_55197 ) ( not ( = ?auto_55197 ?auto_55196 ) ) ( not ( = ?auto_55197 ?auto_55195 ) ) ( not ( = ?auto_55197 ?auto_55194 ) ) ( not ( = ?auto_55192 ?auto_55197 ) ) ( not ( = ?auto_55193 ?auto_55197 ) ) ( CLEAR ?auto_55192 ) ( ON ?auto_55193 ?auto_55194 ) ( CLEAR ?auto_55193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55197 ?auto_55196 ?auto_55195 ?auto_55194 )
      ( MAKE-4PILE ?auto_55192 ?auto_55193 ?auto_55194 ?auto_55195 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55198 - BLOCK
      ?auto_55199 - BLOCK
      ?auto_55200 - BLOCK
      ?auto_55201 - BLOCK
    )
    :vars
    (
      ?auto_55202 - BLOCK
      ?auto_55203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55198 ?auto_55199 ) ) ( not ( = ?auto_55198 ?auto_55200 ) ) ( not ( = ?auto_55198 ?auto_55201 ) ) ( not ( = ?auto_55199 ?auto_55200 ) ) ( not ( = ?auto_55199 ?auto_55201 ) ) ( not ( = ?auto_55200 ?auto_55201 ) ) ( ON ?auto_55201 ?auto_55202 ) ( not ( = ?auto_55198 ?auto_55202 ) ) ( not ( = ?auto_55199 ?auto_55202 ) ) ( not ( = ?auto_55200 ?auto_55202 ) ) ( not ( = ?auto_55201 ?auto_55202 ) ) ( ON ?auto_55200 ?auto_55201 ) ( ON-TABLE ?auto_55203 ) ( ON ?auto_55202 ?auto_55203 ) ( not ( = ?auto_55203 ?auto_55202 ) ) ( not ( = ?auto_55203 ?auto_55201 ) ) ( not ( = ?auto_55203 ?auto_55200 ) ) ( not ( = ?auto_55198 ?auto_55203 ) ) ( not ( = ?auto_55199 ?auto_55203 ) ) ( ON ?auto_55199 ?auto_55200 ) ( CLEAR ?auto_55199 ) ( HOLDING ?auto_55198 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55198 )
      ( MAKE-4PILE ?auto_55198 ?auto_55199 ?auto_55200 ?auto_55201 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55204 - BLOCK
      ?auto_55205 - BLOCK
      ?auto_55206 - BLOCK
      ?auto_55207 - BLOCK
    )
    :vars
    (
      ?auto_55209 - BLOCK
      ?auto_55208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55204 ?auto_55205 ) ) ( not ( = ?auto_55204 ?auto_55206 ) ) ( not ( = ?auto_55204 ?auto_55207 ) ) ( not ( = ?auto_55205 ?auto_55206 ) ) ( not ( = ?auto_55205 ?auto_55207 ) ) ( not ( = ?auto_55206 ?auto_55207 ) ) ( ON ?auto_55207 ?auto_55209 ) ( not ( = ?auto_55204 ?auto_55209 ) ) ( not ( = ?auto_55205 ?auto_55209 ) ) ( not ( = ?auto_55206 ?auto_55209 ) ) ( not ( = ?auto_55207 ?auto_55209 ) ) ( ON ?auto_55206 ?auto_55207 ) ( ON-TABLE ?auto_55208 ) ( ON ?auto_55209 ?auto_55208 ) ( not ( = ?auto_55208 ?auto_55209 ) ) ( not ( = ?auto_55208 ?auto_55207 ) ) ( not ( = ?auto_55208 ?auto_55206 ) ) ( not ( = ?auto_55204 ?auto_55208 ) ) ( not ( = ?auto_55205 ?auto_55208 ) ) ( ON ?auto_55205 ?auto_55206 ) ( ON ?auto_55204 ?auto_55205 ) ( CLEAR ?auto_55204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55208 ?auto_55209 ?auto_55207 ?auto_55206 ?auto_55205 )
      ( MAKE-4PILE ?auto_55204 ?auto_55205 ?auto_55206 ?auto_55207 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55210 - BLOCK
      ?auto_55211 - BLOCK
      ?auto_55212 - BLOCK
      ?auto_55213 - BLOCK
    )
    :vars
    (
      ?auto_55215 - BLOCK
      ?auto_55214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55210 ?auto_55211 ) ) ( not ( = ?auto_55210 ?auto_55212 ) ) ( not ( = ?auto_55210 ?auto_55213 ) ) ( not ( = ?auto_55211 ?auto_55212 ) ) ( not ( = ?auto_55211 ?auto_55213 ) ) ( not ( = ?auto_55212 ?auto_55213 ) ) ( ON ?auto_55213 ?auto_55215 ) ( not ( = ?auto_55210 ?auto_55215 ) ) ( not ( = ?auto_55211 ?auto_55215 ) ) ( not ( = ?auto_55212 ?auto_55215 ) ) ( not ( = ?auto_55213 ?auto_55215 ) ) ( ON ?auto_55212 ?auto_55213 ) ( ON-TABLE ?auto_55214 ) ( ON ?auto_55215 ?auto_55214 ) ( not ( = ?auto_55214 ?auto_55215 ) ) ( not ( = ?auto_55214 ?auto_55213 ) ) ( not ( = ?auto_55214 ?auto_55212 ) ) ( not ( = ?auto_55210 ?auto_55214 ) ) ( not ( = ?auto_55211 ?auto_55214 ) ) ( ON ?auto_55211 ?auto_55212 ) ( HOLDING ?auto_55210 ) ( CLEAR ?auto_55211 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55214 ?auto_55215 ?auto_55213 ?auto_55212 ?auto_55211 ?auto_55210 )
      ( MAKE-4PILE ?auto_55210 ?auto_55211 ?auto_55212 ?auto_55213 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55216 - BLOCK
      ?auto_55217 - BLOCK
      ?auto_55218 - BLOCK
      ?auto_55219 - BLOCK
    )
    :vars
    (
      ?auto_55220 - BLOCK
      ?auto_55221 - BLOCK
      ?auto_55222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55216 ?auto_55217 ) ) ( not ( = ?auto_55216 ?auto_55218 ) ) ( not ( = ?auto_55216 ?auto_55219 ) ) ( not ( = ?auto_55217 ?auto_55218 ) ) ( not ( = ?auto_55217 ?auto_55219 ) ) ( not ( = ?auto_55218 ?auto_55219 ) ) ( ON ?auto_55219 ?auto_55220 ) ( not ( = ?auto_55216 ?auto_55220 ) ) ( not ( = ?auto_55217 ?auto_55220 ) ) ( not ( = ?auto_55218 ?auto_55220 ) ) ( not ( = ?auto_55219 ?auto_55220 ) ) ( ON ?auto_55218 ?auto_55219 ) ( ON-TABLE ?auto_55221 ) ( ON ?auto_55220 ?auto_55221 ) ( not ( = ?auto_55221 ?auto_55220 ) ) ( not ( = ?auto_55221 ?auto_55219 ) ) ( not ( = ?auto_55221 ?auto_55218 ) ) ( not ( = ?auto_55216 ?auto_55221 ) ) ( not ( = ?auto_55217 ?auto_55221 ) ) ( ON ?auto_55217 ?auto_55218 ) ( CLEAR ?auto_55217 ) ( ON ?auto_55216 ?auto_55222 ) ( CLEAR ?auto_55216 ) ( HAND-EMPTY ) ( not ( = ?auto_55216 ?auto_55222 ) ) ( not ( = ?auto_55217 ?auto_55222 ) ) ( not ( = ?auto_55218 ?auto_55222 ) ) ( not ( = ?auto_55219 ?auto_55222 ) ) ( not ( = ?auto_55220 ?auto_55222 ) ) ( not ( = ?auto_55221 ?auto_55222 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55216 ?auto_55222 )
      ( MAKE-4PILE ?auto_55216 ?auto_55217 ?auto_55218 ?auto_55219 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55223 - BLOCK
      ?auto_55224 - BLOCK
      ?auto_55225 - BLOCK
      ?auto_55226 - BLOCK
    )
    :vars
    (
      ?auto_55228 - BLOCK
      ?auto_55229 - BLOCK
      ?auto_55227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55223 ?auto_55224 ) ) ( not ( = ?auto_55223 ?auto_55225 ) ) ( not ( = ?auto_55223 ?auto_55226 ) ) ( not ( = ?auto_55224 ?auto_55225 ) ) ( not ( = ?auto_55224 ?auto_55226 ) ) ( not ( = ?auto_55225 ?auto_55226 ) ) ( ON ?auto_55226 ?auto_55228 ) ( not ( = ?auto_55223 ?auto_55228 ) ) ( not ( = ?auto_55224 ?auto_55228 ) ) ( not ( = ?auto_55225 ?auto_55228 ) ) ( not ( = ?auto_55226 ?auto_55228 ) ) ( ON ?auto_55225 ?auto_55226 ) ( ON-TABLE ?auto_55229 ) ( ON ?auto_55228 ?auto_55229 ) ( not ( = ?auto_55229 ?auto_55228 ) ) ( not ( = ?auto_55229 ?auto_55226 ) ) ( not ( = ?auto_55229 ?auto_55225 ) ) ( not ( = ?auto_55223 ?auto_55229 ) ) ( not ( = ?auto_55224 ?auto_55229 ) ) ( ON ?auto_55223 ?auto_55227 ) ( CLEAR ?auto_55223 ) ( not ( = ?auto_55223 ?auto_55227 ) ) ( not ( = ?auto_55224 ?auto_55227 ) ) ( not ( = ?auto_55225 ?auto_55227 ) ) ( not ( = ?auto_55226 ?auto_55227 ) ) ( not ( = ?auto_55228 ?auto_55227 ) ) ( not ( = ?auto_55229 ?auto_55227 ) ) ( HOLDING ?auto_55224 ) ( CLEAR ?auto_55225 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55229 ?auto_55228 ?auto_55226 ?auto_55225 ?auto_55224 )
      ( MAKE-4PILE ?auto_55223 ?auto_55224 ?auto_55225 ?auto_55226 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55230 - BLOCK
      ?auto_55231 - BLOCK
      ?auto_55232 - BLOCK
      ?auto_55233 - BLOCK
    )
    :vars
    (
      ?auto_55234 - BLOCK
      ?auto_55235 - BLOCK
      ?auto_55236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55230 ?auto_55231 ) ) ( not ( = ?auto_55230 ?auto_55232 ) ) ( not ( = ?auto_55230 ?auto_55233 ) ) ( not ( = ?auto_55231 ?auto_55232 ) ) ( not ( = ?auto_55231 ?auto_55233 ) ) ( not ( = ?auto_55232 ?auto_55233 ) ) ( ON ?auto_55233 ?auto_55234 ) ( not ( = ?auto_55230 ?auto_55234 ) ) ( not ( = ?auto_55231 ?auto_55234 ) ) ( not ( = ?auto_55232 ?auto_55234 ) ) ( not ( = ?auto_55233 ?auto_55234 ) ) ( ON ?auto_55232 ?auto_55233 ) ( ON-TABLE ?auto_55235 ) ( ON ?auto_55234 ?auto_55235 ) ( not ( = ?auto_55235 ?auto_55234 ) ) ( not ( = ?auto_55235 ?auto_55233 ) ) ( not ( = ?auto_55235 ?auto_55232 ) ) ( not ( = ?auto_55230 ?auto_55235 ) ) ( not ( = ?auto_55231 ?auto_55235 ) ) ( ON ?auto_55230 ?auto_55236 ) ( not ( = ?auto_55230 ?auto_55236 ) ) ( not ( = ?auto_55231 ?auto_55236 ) ) ( not ( = ?auto_55232 ?auto_55236 ) ) ( not ( = ?auto_55233 ?auto_55236 ) ) ( not ( = ?auto_55234 ?auto_55236 ) ) ( not ( = ?auto_55235 ?auto_55236 ) ) ( CLEAR ?auto_55232 ) ( ON ?auto_55231 ?auto_55230 ) ( CLEAR ?auto_55231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55236 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55236 ?auto_55230 )
      ( MAKE-4PILE ?auto_55230 ?auto_55231 ?auto_55232 ?auto_55233 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55237 - BLOCK
      ?auto_55238 - BLOCK
      ?auto_55239 - BLOCK
      ?auto_55240 - BLOCK
    )
    :vars
    (
      ?auto_55241 - BLOCK
      ?auto_55242 - BLOCK
      ?auto_55243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55237 ?auto_55238 ) ) ( not ( = ?auto_55237 ?auto_55239 ) ) ( not ( = ?auto_55237 ?auto_55240 ) ) ( not ( = ?auto_55238 ?auto_55239 ) ) ( not ( = ?auto_55238 ?auto_55240 ) ) ( not ( = ?auto_55239 ?auto_55240 ) ) ( ON ?auto_55240 ?auto_55241 ) ( not ( = ?auto_55237 ?auto_55241 ) ) ( not ( = ?auto_55238 ?auto_55241 ) ) ( not ( = ?auto_55239 ?auto_55241 ) ) ( not ( = ?auto_55240 ?auto_55241 ) ) ( ON-TABLE ?auto_55242 ) ( ON ?auto_55241 ?auto_55242 ) ( not ( = ?auto_55242 ?auto_55241 ) ) ( not ( = ?auto_55242 ?auto_55240 ) ) ( not ( = ?auto_55242 ?auto_55239 ) ) ( not ( = ?auto_55237 ?auto_55242 ) ) ( not ( = ?auto_55238 ?auto_55242 ) ) ( ON ?auto_55237 ?auto_55243 ) ( not ( = ?auto_55237 ?auto_55243 ) ) ( not ( = ?auto_55238 ?auto_55243 ) ) ( not ( = ?auto_55239 ?auto_55243 ) ) ( not ( = ?auto_55240 ?auto_55243 ) ) ( not ( = ?auto_55241 ?auto_55243 ) ) ( not ( = ?auto_55242 ?auto_55243 ) ) ( ON ?auto_55238 ?auto_55237 ) ( CLEAR ?auto_55238 ) ( ON-TABLE ?auto_55243 ) ( HOLDING ?auto_55239 ) ( CLEAR ?auto_55240 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55242 ?auto_55241 ?auto_55240 ?auto_55239 )
      ( MAKE-4PILE ?auto_55237 ?auto_55238 ?auto_55239 ?auto_55240 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55244 - BLOCK
      ?auto_55245 - BLOCK
      ?auto_55246 - BLOCK
      ?auto_55247 - BLOCK
    )
    :vars
    (
      ?auto_55248 - BLOCK
      ?auto_55250 - BLOCK
      ?auto_55249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55244 ?auto_55245 ) ) ( not ( = ?auto_55244 ?auto_55246 ) ) ( not ( = ?auto_55244 ?auto_55247 ) ) ( not ( = ?auto_55245 ?auto_55246 ) ) ( not ( = ?auto_55245 ?auto_55247 ) ) ( not ( = ?auto_55246 ?auto_55247 ) ) ( ON ?auto_55247 ?auto_55248 ) ( not ( = ?auto_55244 ?auto_55248 ) ) ( not ( = ?auto_55245 ?auto_55248 ) ) ( not ( = ?auto_55246 ?auto_55248 ) ) ( not ( = ?auto_55247 ?auto_55248 ) ) ( ON-TABLE ?auto_55250 ) ( ON ?auto_55248 ?auto_55250 ) ( not ( = ?auto_55250 ?auto_55248 ) ) ( not ( = ?auto_55250 ?auto_55247 ) ) ( not ( = ?auto_55250 ?auto_55246 ) ) ( not ( = ?auto_55244 ?auto_55250 ) ) ( not ( = ?auto_55245 ?auto_55250 ) ) ( ON ?auto_55244 ?auto_55249 ) ( not ( = ?auto_55244 ?auto_55249 ) ) ( not ( = ?auto_55245 ?auto_55249 ) ) ( not ( = ?auto_55246 ?auto_55249 ) ) ( not ( = ?auto_55247 ?auto_55249 ) ) ( not ( = ?auto_55248 ?auto_55249 ) ) ( not ( = ?auto_55250 ?auto_55249 ) ) ( ON ?auto_55245 ?auto_55244 ) ( ON-TABLE ?auto_55249 ) ( CLEAR ?auto_55247 ) ( ON ?auto_55246 ?auto_55245 ) ( CLEAR ?auto_55246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55249 ?auto_55244 ?auto_55245 )
      ( MAKE-4PILE ?auto_55244 ?auto_55245 ?auto_55246 ?auto_55247 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55251 - BLOCK
      ?auto_55252 - BLOCK
      ?auto_55253 - BLOCK
      ?auto_55254 - BLOCK
    )
    :vars
    (
      ?auto_55257 - BLOCK
      ?auto_55256 - BLOCK
      ?auto_55255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55251 ?auto_55252 ) ) ( not ( = ?auto_55251 ?auto_55253 ) ) ( not ( = ?auto_55251 ?auto_55254 ) ) ( not ( = ?auto_55252 ?auto_55253 ) ) ( not ( = ?auto_55252 ?auto_55254 ) ) ( not ( = ?auto_55253 ?auto_55254 ) ) ( not ( = ?auto_55251 ?auto_55257 ) ) ( not ( = ?auto_55252 ?auto_55257 ) ) ( not ( = ?auto_55253 ?auto_55257 ) ) ( not ( = ?auto_55254 ?auto_55257 ) ) ( ON-TABLE ?auto_55256 ) ( ON ?auto_55257 ?auto_55256 ) ( not ( = ?auto_55256 ?auto_55257 ) ) ( not ( = ?auto_55256 ?auto_55254 ) ) ( not ( = ?auto_55256 ?auto_55253 ) ) ( not ( = ?auto_55251 ?auto_55256 ) ) ( not ( = ?auto_55252 ?auto_55256 ) ) ( ON ?auto_55251 ?auto_55255 ) ( not ( = ?auto_55251 ?auto_55255 ) ) ( not ( = ?auto_55252 ?auto_55255 ) ) ( not ( = ?auto_55253 ?auto_55255 ) ) ( not ( = ?auto_55254 ?auto_55255 ) ) ( not ( = ?auto_55257 ?auto_55255 ) ) ( not ( = ?auto_55256 ?auto_55255 ) ) ( ON ?auto_55252 ?auto_55251 ) ( ON-TABLE ?auto_55255 ) ( ON ?auto_55253 ?auto_55252 ) ( CLEAR ?auto_55253 ) ( HOLDING ?auto_55254 ) ( CLEAR ?auto_55257 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55256 ?auto_55257 ?auto_55254 )
      ( MAKE-4PILE ?auto_55251 ?auto_55252 ?auto_55253 ?auto_55254 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55258 - BLOCK
      ?auto_55259 - BLOCK
      ?auto_55260 - BLOCK
      ?auto_55261 - BLOCK
    )
    :vars
    (
      ?auto_55264 - BLOCK
      ?auto_55262 - BLOCK
      ?auto_55263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55258 ?auto_55259 ) ) ( not ( = ?auto_55258 ?auto_55260 ) ) ( not ( = ?auto_55258 ?auto_55261 ) ) ( not ( = ?auto_55259 ?auto_55260 ) ) ( not ( = ?auto_55259 ?auto_55261 ) ) ( not ( = ?auto_55260 ?auto_55261 ) ) ( not ( = ?auto_55258 ?auto_55264 ) ) ( not ( = ?auto_55259 ?auto_55264 ) ) ( not ( = ?auto_55260 ?auto_55264 ) ) ( not ( = ?auto_55261 ?auto_55264 ) ) ( ON-TABLE ?auto_55262 ) ( ON ?auto_55264 ?auto_55262 ) ( not ( = ?auto_55262 ?auto_55264 ) ) ( not ( = ?auto_55262 ?auto_55261 ) ) ( not ( = ?auto_55262 ?auto_55260 ) ) ( not ( = ?auto_55258 ?auto_55262 ) ) ( not ( = ?auto_55259 ?auto_55262 ) ) ( ON ?auto_55258 ?auto_55263 ) ( not ( = ?auto_55258 ?auto_55263 ) ) ( not ( = ?auto_55259 ?auto_55263 ) ) ( not ( = ?auto_55260 ?auto_55263 ) ) ( not ( = ?auto_55261 ?auto_55263 ) ) ( not ( = ?auto_55264 ?auto_55263 ) ) ( not ( = ?auto_55262 ?auto_55263 ) ) ( ON ?auto_55259 ?auto_55258 ) ( ON-TABLE ?auto_55263 ) ( ON ?auto_55260 ?auto_55259 ) ( CLEAR ?auto_55264 ) ( ON ?auto_55261 ?auto_55260 ) ( CLEAR ?auto_55261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55263 ?auto_55258 ?auto_55259 ?auto_55260 )
      ( MAKE-4PILE ?auto_55258 ?auto_55259 ?auto_55260 ?auto_55261 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55265 - BLOCK
      ?auto_55266 - BLOCK
      ?auto_55267 - BLOCK
      ?auto_55268 - BLOCK
    )
    :vars
    (
      ?auto_55270 - BLOCK
      ?auto_55271 - BLOCK
      ?auto_55269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55265 ?auto_55266 ) ) ( not ( = ?auto_55265 ?auto_55267 ) ) ( not ( = ?auto_55265 ?auto_55268 ) ) ( not ( = ?auto_55266 ?auto_55267 ) ) ( not ( = ?auto_55266 ?auto_55268 ) ) ( not ( = ?auto_55267 ?auto_55268 ) ) ( not ( = ?auto_55265 ?auto_55270 ) ) ( not ( = ?auto_55266 ?auto_55270 ) ) ( not ( = ?auto_55267 ?auto_55270 ) ) ( not ( = ?auto_55268 ?auto_55270 ) ) ( ON-TABLE ?auto_55271 ) ( not ( = ?auto_55271 ?auto_55270 ) ) ( not ( = ?auto_55271 ?auto_55268 ) ) ( not ( = ?auto_55271 ?auto_55267 ) ) ( not ( = ?auto_55265 ?auto_55271 ) ) ( not ( = ?auto_55266 ?auto_55271 ) ) ( ON ?auto_55265 ?auto_55269 ) ( not ( = ?auto_55265 ?auto_55269 ) ) ( not ( = ?auto_55266 ?auto_55269 ) ) ( not ( = ?auto_55267 ?auto_55269 ) ) ( not ( = ?auto_55268 ?auto_55269 ) ) ( not ( = ?auto_55270 ?auto_55269 ) ) ( not ( = ?auto_55271 ?auto_55269 ) ) ( ON ?auto_55266 ?auto_55265 ) ( ON-TABLE ?auto_55269 ) ( ON ?auto_55267 ?auto_55266 ) ( ON ?auto_55268 ?auto_55267 ) ( CLEAR ?auto_55268 ) ( HOLDING ?auto_55270 ) ( CLEAR ?auto_55271 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55271 ?auto_55270 )
      ( MAKE-4PILE ?auto_55265 ?auto_55266 ?auto_55267 ?auto_55268 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55272 - BLOCK
      ?auto_55273 - BLOCK
      ?auto_55274 - BLOCK
      ?auto_55275 - BLOCK
    )
    :vars
    (
      ?auto_55277 - BLOCK
      ?auto_55278 - BLOCK
      ?auto_55276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55272 ?auto_55273 ) ) ( not ( = ?auto_55272 ?auto_55274 ) ) ( not ( = ?auto_55272 ?auto_55275 ) ) ( not ( = ?auto_55273 ?auto_55274 ) ) ( not ( = ?auto_55273 ?auto_55275 ) ) ( not ( = ?auto_55274 ?auto_55275 ) ) ( not ( = ?auto_55272 ?auto_55277 ) ) ( not ( = ?auto_55273 ?auto_55277 ) ) ( not ( = ?auto_55274 ?auto_55277 ) ) ( not ( = ?auto_55275 ?auto_55277 ) ) ( ON-TABLE ?auto_55278 ) ( not ( = ?auto_55278 ?auto_55277 ) ) ( not ( = ?auto_55278 ?auto_55275 ) ) ( not ( = ?auto_55278 ?auto_55274 ) ) ( not ( = ?auto_55272 ?auto_55278 ) ) ( not ( = ?auto_55273 ?auto_55278 ) ) ( ON ?auto_55272 ?auto_55276 ) ( not ( = ?auto_55272 ?auto_55276 ) ) ( not ( = ?auto_55273 ?auto_55276 ) ) ( not ( = ?auto_55274 ?auto_55276 ) ) ( not ( = ?auto_55275 ?auto_55276 ) ) ( not ( = ?auto_55277 ?auto_55276 ) ) ( not ( = ?auto_55278 ?auto_55276 ) ) ( ON ?auto_55273 ?auto_55272 ) ( ON-TABLE ?auto_55276 ) ( ON ?auto_55274 ?auto_55273 ) ( ON ?auto_55275 ?auto_55274 ) ( CLEAR ?auto_55278 ) ( ON ?auto_55277 ?auto_55275 ) ( CLEAR ?auto_55277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55276 ?auto_55272 ?auto_55273 ?auto_55274 ?auto_55275 )
      ( MAKE-4PILE ?auto_55272 ?auto_55273 ?auto_55274 ?auto_55275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55279 - BLOCK
      ?auto_55280 - BLOCK
      ?auto_55281 - BLOCK
      ?auto_55282 - BLOCK
    )
    :vars
    (
      ?auto_55284 - BLOCK
      ?auto_55283 - BLOCK
      ?auto_55285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55279 ?auto_55280 ) ) ( not ( = ?auto_55279 ?auto_55281 ) ) ( not ( = ?auto_55279 ?auto_55282 ) ) ( not ( = ?auto_55280 ?auto_55281 ) ) ( not ( = ?auto_55280 ?auto_55282 ) ) ( not ( = ?auto_55281 ?auto_55282 ) ) ( not ( = ?auto_55279 ?auto_55284 ) ) ( not ( = ?auto_55280 ?auto_55284 ) ) ( not ( = ?auto_55281 ?auto_55284 ) ) ( not ( = ?auto_55282 ?auto_55284 ) ) ( not ( = ?auto_55283 ?auto_55284 ) ) ( not ( = ?auto_55283 ?auto_55282 ) ) ( not ( = ?auto_55283 ?auto_55281 ) ) ( not ( = ?auto_55279 ?auto_55283 ) ) ( not ( = ?auto_55280 ?auto_55283 ) ) ( ON ?auto_55279 ?auto_55285 ) ( not ( = ?auto_55279 ?auto_55285 ) ) ( not ( = ?auto_55280 ?auto_55285 ) ) ( not ( = ?auto_55281 ?auto_55285 ) ) ( not ( = ?auto_55282 ?auto_55285 ) ) ( not ( = ?auto_55284 ?auto_55285 ) ) ( not ( = ?auto_55283 ?auto_55285 ) ) ( ON ?auto_55280 ?auto_55279 ) ( ON-TABLE ?auto_55285 ) ( ON ?auto_55281 ?auto_55280 ) ( ON ?auto_55282 ?auto_55281 ) ( ON ?auto_55284 ?auto_55282 ) ( CLEAR ?auto_55284 ) ( HOLDING ?auto_55283 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55283 )
      ( MAKE-4PILE ?auto_55279 ?auto_55280 ?auto_55281 ?auto_55282 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55286 - BLOCK
      ?auto_55287 - BLOCK
      ?auto_55288 - BLOCK
      ?auto_55289 - BLOCK
    )
    :vars
    (
      ?auto_55290 - BLOCK
      ?auto_55291 - BLOCK
      ?auto_55292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55286 ?auto_55287 ) ) ( not ( = ?auto_55286 ?auto_55288 ) ) ( not ( = ?auto_55286 ?auto_55289 ) ) ( not ( = ?auto_55287 ?auto_55288 ) ) ( not ( = ?auto_55287 ?auto_55289 ) ) ( not ( = ?auto_55288 ?auto_55289 ) ) ( not ( = ?auto_55286 ?auto_55290 ) ) ( not ( = ?auto_55287 ?auto_55290 ) ) ( not ( = ?auto_55288 ?auto_55290 ) ) ( not ( = ?auto_55289 ?auto_55290 ) ) ( not ( = ?auto_55291 ?auto_55290 ) ) ( not ( = ?auto_55291 ?auto_55289 ) ) ( not ( = ?auto_55291 ?auto_55288 ) ) ( not ( = ?auto_55286 ?auto_55291 ) ) ( not ( = ?auto_55287 ?auto_55291 ) ) ( ON ?auto_55286 ?auto_55292 ) ( not ( = ?auto_55286 ?auto_55292 ) ) ( not ( = ?auto_55287 ?auto_55292 ) ) ( not ( = ?auto_55288 ?auto_55292 ) ) ( not ( = ?auto_55289 ?auto_55292 ) ) ( not ( = ?auto_55290 ?auto_55292 ) ) ( not ( = ?auto_55291 ?auto_55292 ) ) ( ON ?auto_55287 ?auto_55286 ) ( ON-TABLE ?auto_55292 ) ( ON ?auto_55288 ?auto_55287 ) ( ON ?auto_55289 ?auto_55288 ) ( ON ?auto_55290 ?auto_55289 ) ( ON ?auto_55291 ?auto_55290 ) ( CLEAR ?auto_55291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55292 ?auto_55286 ?auto_55287 ?auto_55288 ?auto_55289 ?auto_55290 )
      ( MAKE-4PILE ?auto_55286 ?auto_55287 ?auto_55288 ?auto_55289 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55294 - BLOCK
    )
    :vars
    (
      ?auto_55295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55295 ?auto_55294 ) ( CLEAR ?auto_55295 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55294 ) ( not ( = ?auto_55294 ?auto_55295 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55295 ?auto_55294 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55296 - BLOCK
    )
    :vars
    (
      ?auto_55297 - BLOCK
      ?auto_55298 - BLOCK
      ?auto_55299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55297 ?auto_55296 ) ( CLEAR ?auto_55297 ) ( ON-TABLE ?auto_55296 ) ( not ( = ?auto_55296 ?auto_55297 ) ) ( HOLDING ?auto_55298 ) ( CLEAR ?auto_55299 ) ( not ( = ?auto_55296 ?auto_55298 ) ) ( not ( = ?auto_55296 ?auto_55299 ) ) ( not ( = ?auto_55297 ?auto_55298 ) ) ( not ( = ?auto_55297 ?auto_55299 ) ) ( not ( = ?auto_55298 ?auto_55299 ) ) )
    :subtasks
    ( ( !STACK ?auto_55298 ?auto_55299 )
      ( MAKE-1PILE ?auto_55296 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55300 - BLOCK
    )
    :vars
    (
      ?auto_55303 - BLOCK
      ?auto_55301 - BLOCK
      ?auto_55302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55303 ?auto_55300 ) ( ON-TABLE ?auto_55300 ) ( not ( = ?auto_55300 ?auto_55303 ) ) ( CLEAR ?auto_55301 ) ( not ( = ?auto_55300 ?auto_55302 ) ) ( not ( = ?auto_55300 ?auto_55301 ) ) ( not ( = ?auto_55303 ?auto_55302 ) ) ( not ( = ?auto_55303 ?auto_55301 ) ) ( not ( = ?auto_55302 ?auto_55301 ) ) ( ON ?auto_55302 ?auto_55303 ) ( CLEAR ?auto_55302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55300 ?auto_55303 )
      ( MAKE-1PILE ?auto_55300 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55304 - BLOCK
    )
    :vars
    (
      ?auto_55307 - BLOCK
      ?auto_55305 - BLOCK
      ?auto_55306 - BLOCK
      ?auto_55308 - BLOCK
      ?auto_55309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55307 ?auto_55304 ) ( ON-TABLE ?auto_55304 ) ( not ( = ?auto_55304 ?auto_55307 ) ) ( not ( = ?auto_55304 ?auto_55305 ) ) ( not ( = ?auto_55304 ?auto_55306 ) ) ( not ( = ?auto_55307 ?auto_55305 ) ) ( not ( = ?auto_55307 ?auto_55306 ) ) ( not ( = ?auto_55305 ?auto_55306 ) ) ( ON ?auto_55305 ?auto_55307 ) ( CLEAR ?auto_55305 ) ( HOLDING ?auto_55306 ) ( CLEAR ?auto_55308 ) ( ON-TABLE ?auto_55309 ) ( ON ?auto_55308 ?auto_55309 ) ( not ( = ?auto_55309 ?auto_55308 ) ) ( not ( = ?auto_55309 ?auto_55306 ) ) ( not ( = ?auto_55308 ?auto_55306 ) ) ( not ( = ?auto_55304 ?auto_55308 ) ) ( not ( = ?auto_55304 ?auto_55309 ) ) ( not ( = ?auto_55307 ?auto_55308 ) ) ( not ( = ?auto_55307 ?auto_55309 ) ) ( not ( = ?auto_55305 ?auto_55308 ) ) ( not ( = ?auto_55305 ?auto_55309 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55309 ?auto_55308 ?auto_55306 )
      ( MAKE-1PILE ?auto_55304 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55310 - BLOCK
    )
    :vars
    (
      ?auto_55314 - BLOCK
      ?auto_55315 - BLOCK
      ?auto_55313 - BLOCK
      ?auto_55312 - BLOCK
      ?auto_55311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55314 ?auto_55310 ) ( ON-TABLE ?auto_55310 ) ( not ( = ?auto_55310 ?auto_55314 ) ) ( not ( = ?auto_55310 ?auto_55315 ) ) ( not ( = ?auto_55310 ?auto_55313 ) ) ( not ( = ?auto_55314 ?auto_55315 ) ) ( not ( = ?auto_55314 ?auto_55313 ) ) ( not ( = ?auto_55315 ?auto_55313 ) ) ( ON ?auto_55315 ?auto_55314 ) ( CLEAR ?auto_55312 ) ( ON-TABLE ?auto_55311 ) ( ON ?auto_55312 ?auto_55311 ) ( not ( = ?auto_55311 ?auto_55312 ) ) ( not ( = ?auto_55311 ?auto_55313 ) ) ( not ( = ?auto_55312 ?auto_55313 ) ) ( not ( = ?auto_55310 ?auto_55312 ) ) ( not ( = ?auto_55310 ?auto_55311 ) ) ( not ( = ?auto_55314 ?auto_55312 ) ) ( not ( = ?auto_55314 ?auto_55311 ) ) ( not ( = ?auto_55315 ?auto_55312 ) ) ( not ( = ?auto_55315 ?auto_55311 ) ) ( ON ?auto_55313 ?auto_55315 ) ( CLEAR ?auto_55313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55310 ?auto_55314 ?auto_55315 )
      ( MAKE-1PILE ?auto_55310 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55316 - BLOCK
    )
    :vars
    (
      ?auto_55319 - BLOCK
      ?auto_55318 - BLOCK
      ?auto_55320 - BLOCK
      ?auto_55321 - BLOCK
      ?auto_55317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55319 ?auto_55316 ) ( ON-TABLE ?auto_55316 ) ( not ( = ?auto_55316 ?auto_55319 ) ) ( not ( = ?auto_55316 ?auto_55318 ) ) ( not ( = ?auto_55316 ?auto_55320 ) ) ( not ( = ?auto_55319 ?auto_55318 ) ) ( not ( = ?auto_55319 ?auto_55320 ) ) ( not ( = ?auto_55318 ?auto_55320 ) ) ( ON ?auto_55318 ?auto_55319 ) ( ON-TABLE ?auto_55321 ) ( not ( = ?auto_55321 ?auto_55317 ) ) ( not ( = ?auto_55321 ?auto_55320 ) ) ( not ( = ?auto_55317 ?auto_55320 ) ) ( not ( = ?auto_55316 ?auto_55317 ) ) ( not ( = ?auto_55316 ?auto_55321 ) ) ( not ( = ?auto_55319 ?auto_55317 ) ) ( not ( = ?auto_55319 ?auto_55321 ) ) ( not ( = ?auto_55318 ?auto_55317 ) ) ( not ( = ?auto_55318 ?auto_55321 ) ) ( ON ?auto_55320 ?auto_55318 ) ( CLEAR ?auto_55320 ) ( HOLDING ?auto_55317 ) ( CLEAR ?auto_55321 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55321 ?auto_55317 )
      ( MAKE-1PILE ?auto_55316 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55322 - BLOCK
    )
    :vars
    (
      ?auto_55323 - BLOCK
      ?auto_55326 - BLOCK
      ?auto_55324 - BLOCK
      ?auto_55325 - BLOCK
      ?auto_55327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55323 ?auto_55322 ) ( ON-TABLE ?auto_55322 ) ( not ( = ?auto_55322 ?auto_55323 ) ) ( not ( = ?auto_55322 ?auto_55326 ) ) ( not ( = ?auto_55322 ?auto_55324 ) ) ( not ( = ?auto_55323 ?auto_55326 ) ) ( not ( = ?auto_55323 ?auto_55324 ) ) ( not ( = ?auto_55326 ?auto_55324 ) ) ( ON ?auto_55326 ?auto_55323 ) ( ON-TABLE ?auto_55325 ) ( not ( = ?auto_55325 ?auto_55327 ) ) ( not ( = ?auto_55325 ?auto_55324 ) ) ( not ( = ?auto_55327 ?auto_55324 ) ) ( not ( = ?auto_55322 ?auto_55327 ) ) ( not ( = ?auto_55322 ?auto_55325 ) ) ( not ( = ?auto_55323 ?auto_55327 ) ) ( not ( = ?auto_55323 ?auto_55325 ) ) ( not ( = ?auto_55326 ?auto_55327 ) ) ( not ( = ?auto_55326 ?auto_55325 ) ) ( ON ?auto_55324 ?auto_55326 ) ( CLEAR ?auto_55325 ) ( ON ?auto_55327 ?auto_55324 ) ( CLEAR ?auto_55327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55322 ?auto_55323 ?auto_55326 ?auto_55324 )
      ( MAKE-1PILE ?auto_55322 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55328 - BLOCK
    )
    :vars
    (
      ?auto_55329 - BLOCK
      ?auto_55333 - BLOCK
      ?auto_55330 - BLOCK
      ?auto_55332 - BLOCK
      ?auto_55331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55329 ?auto_55328 ) ( ON-TABLE ?auto_55328 ) ( not ( = ?auto_55328 ?auto_55329 ) ) ( not ( = ?auto_55328 ?auto_55333 ) ) ( not ( = ?auto_55328 ?auto_55330 ) ) ( not ( = ?auto_55329 ?auto_55333 ) ) ( not ( = ?auto_55329 ?auto_55330 ) ) ( not ( = ?auto_55333 ?auto_55330 ) ) ( ON ?auto_55333 ?auto_55329 ) ( not ( = ?auto_55332 ?auto_55331 ) ) ( not ( = ?auto_55332 ?auto_55330 ) ) ( not ( = ?auto_55331 ?auto_55330 ) ) ( not ( = ?auto_55328 ?auto_55331 ) ) ( not ( = ?auto_55328 ?auto_55332 ) ) ( not ( = ?auto_55329 ?auto_55331 ) ) ( not ( = ?auto_55329 ?auto_55332 ) ) ( not ( = ?auto_55333 ?auto_55331 ) ) ( not ( = ?auto_55333 ?auto_55332 ) ) ( ON ?auto_55330 ?auto_55333 ) ( ON ?auto_55331 ?auto_55330 ) ( CLEAR ?auto_55331 ) ( HOLDING ?auto_55332 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55332 )
      ( MAKE-1PILE ?auto_55328 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55334 - BLOCK
    )
    :vars
    (
      ?auto_55336 - BLOCK
      ?auto_55337 - BLOCK
      ?auto_55339 - BLOCK
      ?auto_55338 - BLOCK
      ?auto_55335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55336 ?auto_55334 ) ( ON-TABLE ?auto_55334 ) ( not ( = ?auto_55334 ?auto_55336 ) ) ( not ( = ?auto_55334 ?auto_55337 ) ) ( not ( = ?auto_55334 ?auto_55339 ) ) ( not ( = ?auto_55336 ?auto_55337 ) ) ( not ( = ?auto_55336 ?auto_55339 ) ) ( not ( = ?auto_55337 ?auto_55339 ) ) ( ON ?auto_55337 ?auto_55336 ) ( not ( = ?auto_55338 ?auto_55335 ) ) ( not ( = ?auto_55338 ?auto_55339 ) ) ( not ( = ?auto_55335 ?auto_55339 ) ) ( not ( = ?auto_55334 ?auto_55335 ) ) ( not ( = ?auto_55334 ?auto_55338 ) ) ( not ( = ?auto_55336 ?auto_55335 ) ) ( not ( = ?auto_55336 ?auto_55338 ) ) ( not ( = ?auto_55337 ?auto_55335 ) ) ( not ( = ?auto_55337 ?auto_55338 ) ) ( ON ?auto_55339 ?auto_55337 ) ( ON ?auto_55335 ?auto_55339 ) ( ON ?auto_55338 ?auto_55335 ) ( CLEAR ?auto_55338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55334 ?auto_55336 ?auto_55337 ?auto_55339 ?auto_55335 )
      ( MAKE-1PILE ?auto_55334 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55340 - BLOCK
    )
    :vars
    (
      ?auto_55342 - BLOCK
      ?auto_55345 - BLOCK
      ?auto_55344 - BLOCK
      ?auto_55341 - BLOCK
      ?auto_55343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55342 ?auto_55340 ) ( ON-TABLE ?auto_55340 ) ( not ( = ?auto_55340 ?auto_55342 ) ) ( not ( = ?auto_55340 ?auto_55345 ) ) ( not ( = ?auto_55340 ?auto_55344 ) ) ( not ( = ?auto_55342 ?auto_55345 ) ) ( not ( = ?auto_55342 ?auto_55344 ) ) ( not ( = ?auto_55345 ?auto_55344 ) ) ( ON ?auto_55345 ?auto_55342 ) ( not ( = ?auto_55341 ?auto_55343 ) ) ( not ( = ?auto_55341 ?auto_55344 ) ) ( not ( = ?auto_55343 ?auto_55344 ) ) ( not ( = ?auto_55340 ?auto_55343 ) ) ( not ( = ?auto_55340 ?auto_55341 ) ) ( not ( = ?auto_55342 ?auto_55343 ) ) ( not ( = ?auto_55342 ?auto_55341 ) ) ( not ( = ?auto_55345 ?auto_55343 ) ) ( not ( = ?auto_55345 ?auto_55341 ) ) ( ON ?auto_55344 ?auto_55345 ) ( ON ?auto_55343 ?auto_55344 ) ( HOLDING ?auto_55341 ) ( CLEAR ?auto_55343 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55340 ?auto_55342 ?auto_55345 ?auto_55344 ?auto_55343 ?auto_55341 )
      ( MAKE-1PILE ?auto_55340 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55346 - BLOCK
    )
    :vars
    (
      ?auto_55348 - BLOCK
      ?auto_55349 - BLOCK
      ?auto_55347 - BLOCK
      ?auto_55350 - BLOCK
      ?auto_55351 - BLOCK
      ?auto_55352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55348 ?auto_55346 ) ( ON-TABLE ?auto_55346 ) ( not ( = ?auto_55346 ?auto_55348 ) ) ( not ( = ?auto_55346 ?auto_55349 ) ) ( not ( = ?auto_55346 ?auto_55347 ) ) ( not ( = ?auto_55348 ?auto_55349 ) ) ( not ( = ?auto_55348 ?auto_55347 ) ) ( not ( = ?auto_55349 ?auto_55347 ) ) ( ON ?auto_55349 ?auto_55348 ) ( not ( = ?auto_55350 ?auto_55351 ) ) ( not ( = ?auto_55350 ?auto_55347 ) ) ( not ( = ?auto_55351 ?auto_55347 ) ) ( not ( = ?auto_55346 ?auto_55351 ) ) ( not ( = ?auto_55346 ?auto_55350 ) ) ( not ( = ?auto_55348 ?auto_55351 ) ) ( not ( = ?auto_55348 ?auto_55350 ) ) ( not ( = ?auto_55349 ?auto_55351 ) ) ( not ( = ?auto_55349 ?auto_55350 ) ) ( ON ?auto_55347 ?auto_55349 ) ( ON ?auto_55351 ?auto_55347 ) ( CLEAR ?auto_55351 ) ( ON ?auto_55350 ?auto_55352 ) ( CLEAR ?auto_55350 ) ( HAND-EMPTY ) ( not ( = ?auto_55346 ?auto_55352 ) ) ( not ( = ?auto_55348 ?auto_55352 ) ) ( not ( = ?auto_55349 ?auto_55352 ) ) ( not ( = ?auto_55347 ?auto_55352 ) ) ( not ( = ?auto_55350 ?auto_55352 ) ) ( not ( = ?auto_55351 ?auto_55352 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55350 ?auto_55352 )
      ( MAKE-1PILE ?auto_55346 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55353 - BLOCK
    )
    :vars
    (
      ?auto_55359 - BLOCK
      ?auto_55358 - BLOCK
      ?auto_55356 - BLOCK
      ?auto_55354 - BLOCK
      ?auto_55355 - BLOCK
      ?auto_55357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55359 ?auto_55353 ) ( ON-TABLE ?auto_55353 ) ( not ( = ?auto_55353 ?auto_55359 ) ) ( not ( = ?auto_55353 ?auto_55358 ) ) ( not ( = ?auto_55353 ?auto_55356 ) ) ( not ( = ?auto_55359 ?auto_55358 ) ) ( not ( = ?auto_55359 ?auto_55356 ) ) ( not ( = ?auto_55358 ?auto_55356 ) ) ( ON ?auto_55358 ?auto_55359 ) ( not ( = ?auto_55354 ?auto_55355 ) ) ( not ( = ?auto_55354 ?auto_55356 ) ) ( not ( = ?auto_55355 ?auto_55356 ) ) ( not ( = ?auto_55353 ?auto_55355 ) ) ( not ( = ?auto_55353 ?auto_55354 ) ) ( not ( = ?auto_55359 ?auto_55355 ) ) ( not ( = ?auto_55359 ?auto_55354 ) ) ( not ( = ?auto_55358 ?auto_55355 ) ) ( not ( = ?auto_55358 ?auto_55354 ) ) ( ON ?auto_55356 ?auto_55358 ) ( ON ?auto_55354 ?auto_55357 ) ( CLEAR ?auto_55354 ) ( not ( = ?auto_55353 ?auto_55357 ) ) ( not ( = ?auto_55359 ?auto_55357 ) ) ( not ( = ?auto_55358 ?auto_55357 ) ) ( not ( = ?auto_55356 ?auto_55357 ) ) ( not ( = ?auto_55354 ?auto_55357 ) ) ( not ( = ?auto_55355 ?auto_55357 ) ) ( HOLDING ?auto_55355 ) ( CLEAR ?auto_55356 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55353 ?auto_55359 ?auto_55358 ?auto_55356 ?auto_55355 )
      ( MAKE-1PILE ?auto_55353 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55360 - BLOCK
    )
    :vars
    (
      ?auto_55363 - BLOCK
      ?auto_55366 - BLOCK
      ?auto_55364 - BLOCK
      ?auto_55361 - BLOCK
      ?auto_55362 - BLOCK
      ?auto_55365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55363 ?auto_55360 ) ( ON-TABLE ?auto_55360 ) ( not ( = ?auto_55360 ?auto_55363 ) ) ( not ( = ?auto_55360 ?auto_55366 ) ) ( not ( = ?auto_55360 ?auto_55364 ) ) ( not ( = ?auto_55363 ?auto_55366 ) ) ( not ( = ?auto_55363 ?auto_55364 ) ) ( not ( = ?auto_55366 ?auto_55364 ) ) ( ON ?auto_55366 ?auto_55363 ) ( not ( = ?auto_55361 ?auto_55362 ) ) ( not ( = ?auto_55361 ?auto_55364 ) ) ( not ( = ?auto_55362 ?auto_55364 ) ) ( not ( = ?auto_55360 ?auto_55362 ) ) ( not ( = ?auto_55360 ?auto_55361 ) ) ( not ( = ?auto_55363 ?auto_55362 ) ) ( not ( = ?auto_55363 ?auto_55361 ) ) ( not ( = ?auto_55366 ?auto_55362 ) ) ( not ( = ?auto_55366 ?auto_55361 ) ) ( ON ?auto_55364 ?auto_55366 ) ( ON ?auto_55361 ?auto_55365 ) ( not ( = ?auto_55360 ?auto_55365 ) ) ( not ( = ?auto_55363 ?auto_55365 ) ) ( not ( = ?auto_55366 ?auto_55365 ) ) ( not ( = ?auto_55364 ?auto_55365 ) ) ( not ( = ?auto_55361 ?auto_55365 ) ) ( not ( = ?auto_55362 ?auto_55365 ) ) ( CLEAR ?auto_55364 ) ( ON ?auto_55362 ?auto_55361 ) ( CLEAR ?auto_55362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55365 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55365 ?auto_55361 )
      ( MAKE-1PILE ?auto_55360 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55367 - BLOCK
    )
    :vars
    (
      ?auto_55368 - BLOCK
      ?auto_55372 - BLOCK
      ?auto_55370 - BLOCK
      ?auto_55371 - BLOCK
      ?auto_55369 - BLOCK
      ?auto_55373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55368 ?auto_55367 ) ( ON-TABLE ?auto_55367 ) ( not ( = ?auto_55367 ?auto_55368 ) ) ( not ( = ?auto_55367 ?auto_55372 ) ) ( not ( = ?auto_55367 ?auto_55370 ) ) ( not ( = ?auto_55368 ?auto_55372 ) ) ( not ( = ?auto_55368 ?auto_55370 ) ) ( not ( = ?auto_55372 ?auto_55370 ) ) ( ON ?auto_55372 ?auto_55368 ) ( not ( = ?auto_55371 ?auto_55369 ) ) ( not ( = ?auto_55371 ?auto_55370 ) ) ( not ( = ?auto_55369 ?auto_55370 ) ) ( not ( = ?auto_55367 ?auto_55369 ) ) ( not ( = ?auto_55367 ?auto_55371 ) ) ( not ( = ?auto_55368 ?auto_55369 ) ) ( not ( = ?auto_55368 ?auto_55371 ) ) ( not ( = ?auto_55372 ?auto_55369 ) ) ( not ( = ?auto_55372 ?auto_55371 ) ) ( ON ?auto_55371 ?auto_55373 ) ( not ( = ?auto_55367 ?auto_55373 ) ) ( not ( = ?auto_55368 ?auto_55373 ) ) ( not ( = ?auto_55372 ?auto_55373 ) ) ( not ( = ?auto_55370 ?auto_55373 ) ) ( not ( = ?auto_55371 ?auto_55373 ) ) ( not ( = ?auto_55369 ?auto_55373 ) ) ( ON ?auto_55369 ?auto_55371 ) ( CLEAR ?auto_55369 ) ( ON-TABLE ?auto_55373 ) ( HOLDING ?auto_55370 ) ( CLEAR ?auto_55372 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55367 ?auto_55368 ?auto_55372 ?auto_55370 )
      ( MAKE-1PILE ?auto_55367 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55374 - BLOCK
    )
    :vars
    (
      ?auto_55378 - BLOCK
      ?auto_55379 - BLOCK
      ?auto_55376 - BLOCK
      ?auto_55377 - BLOCK
      ?auto_55375 - BLOCK
      ?auto_55380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55378 ?auto_55374 ) ( ON-TABLE ?auto_55374 ) ( not ( = ?auto_55374 ?auto_55378 ) ) ( not ( = ?auto_55374 ?auto_55379 ) ) ( not ( = ?auto_55374 ?auto_55376 ) ) ( not ( = ?auto_55378 ?auto_55379 ) ) ( not ( = ?auto_55378 ?auto_55376 ) ) ( not ( = ?auto_55379 ?auto_55376 ) ) ( ON ?auto_55379 ?auto_55378 ) ( not ( = ?auto_55377 ?auto_55375 ) ) ( not ( = ?auto_55377 ?auto_55376 ) ) ( not ( = ?auto_55375 ?auto_55376 ) ) ( not ( = ?auto_55374 ?auto_55375 ) ) ( not ( = ?auto_55374 ?auto_55377 ) ) ( not ( = ?auto_55378 ?auto_55375 ) ) ( not ( = ?auto_55378 ?auto_55377 ) ) ( not ( = ?auto_55379 ?auto_55375 ) ) ( not ( = ?auto_55379 ?auto_55377 ) ) ( ON ?auto_55377 ?auto_55380 ) ( not ( = ?auto_55374 ?auto_55380 ) ) ( not ( = ?auto_55378 ?auto_55380 ) ) ( not ( = ?auto_55379 ?auto_55380 ) ) ( not ( = ?auto_55376 ?auto_55380 ) ) ( not ( = ?auto_55377 ?auto_55380 ) ) ( not ( = ?auto_55375 ?auto_55380 ) ) ( ON ?auto_55375 ?auto_55377 ) ( ON-TABLE ?auto_55380 ) ( CLEAR ?auto_55379 ) ( ON ?auto_55376 ?auto_55375 ) ( CLEAR ?auto_55376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55380 ?auto_55377 ?auto_55375 )
      ( MAKE-1PILE ?auto_55374 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55381 - BLOCK
    )
    :vars
    (
      ?auto_55385 - BLOCK
      ?auto_55383 - BLOCK
      ?auto_55384 - BLOCK
      ?auto_55382 - BLOCK
      ?auto_55387 - BLOCK
      ?auto_55386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55385 ?auto_55381 ) ( ON-TABLE ?auto_55381 ) ( not ( = ?auto_55381 ?auto_55385 ) ) ( not ( = ?auto_55381 ?auto_55383 ) ) ( not ( = ?auto_55381 ?auto_55384 ) ) ( not ( = ?auto_55385 ?auto_55383 ) ) ( not ( = ?auto_55385 ?auto_55384 ) ) ( not ( = ?auto_55383 ?auto_55384 ) ) ( not ( = ?auto_55382 ?auto_55387 ) ) ( not ( = ?auto_55382 ?auto_55384 ) ) ( not ( = ?auto_55387 ?auto_55384 ) ) ( not ( = ?auto_55381 ?auto_55387 ) ) ( not ( = ?auto_55381 ?auto_55382 ) ) ( not ( = ?auto_55385 ?auto_55387 ) ) ( not ( = ?auto_55385 ?auto_55382 ) ) ( not ( = ?auto_55383 ?auto_55387 ) ) ( not ( = ?auto_55383 ?auto_55382 ) ) ( ON ?auto_55382 ?auto_55386 ) ( not ( = ?auto_55381 ?auto_55386 ) ) ( not ( = ?auto_55385 ?auto_55386 ) ) ( not ( = ?auto_55383 ?auto_55386 ) ) ( not ( = ?auto_55384 ?auto_55386 ) ) ( not ( = ?auto_55382 ?auto_55386 ) ) ( not ( = ?auto_55387 ?auto_55386 ) ) ( ON ?auto_55387 ?auto_55382 ) ( ON-TABLE ?auto_55386 ) ( ON ?auto_55384 ?auto_55387 ) ( CLEAR ?auto_55384 ) ( HOLDING ?auto_55383 ) ( CLEAR ?auto_55385 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55381 ?auto_55385 ?auto_55383 )
      ( MAKE-1PILE ?auto_55381 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55388 - BLOCK
    )
    :vars
    (
      ?auto_55393 - BLOCK
      ?auto_55392 - BLOCK
      ?auto_55391 - BLOCK
      ?auto_55389 - BLOCK
      ?auto_55390 - BLOCK
      ?auto_55394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55393 ?auto_55388 ) ( ON-TABLE ?auto_55388 ) ( not ( = ?auto_55388 ?auto_55393 ) ) ( not ( = ?auto_55388 ?auto_55392 ) ) ( not ( = ?auto_55388 ?auto_55391 ) ) ( not ( = ?auto_55393 ?auto_55392 ) ) ( not ( = ?auto_55393 ?auto_55391 ) ) ( not ( = ?auto_55392 ?auto_55391 ) ) ( not ( = ?auto_55389 ?auto_55390 ) ) ( not ( = ?auto_55389 ?auto_55391 ) ) ( not ( = ?auto_55390 ?auto_55391 ) ) ( not ( = ?auto_55388 ?auto_55390 ) ) ( not ( = ?auto_55388 ?auto_55389 ) ) ( not ( = ?auto_55393 ?auto_55390 ) ) ( not ( = ?auto_55393 ?auto_55389 ) ) ( not ( = ?auto_55392 ?auto_55390 ) ) ( not ( = ?auto_55392 ?auto_55389 ) ) ( ON ?auto_55389 ?auto_55394 ) ( not ( = ?auto_55388 ?auto_55394 ) ) ( not ( = ?auto_55393 ?auto_55394 ) ) ( not ( = ?auto_55392 ?auto_55394 ) ) ( not ( = ?auto_55391 ?auto_55394 ) ) ( not ( = ?auto_55389 ?auto_55394 ) ) ( not ( = ?auto_55390 ?auto_55394 ) ) ( ON ?auto_55390 ?auto_55389 ) ( ON-TABLE ?auto_55394 ) ( ON ?auto_55391 ?auto_55390 ) ( CLEAR ?auto_55393 ) ( ON ?auto_55392 ?auto_55391 ) ( CLEAR ?auto_55392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55394 ?auto_55389 ?auto_55390 ?auto_55391 )
      ( MAKE-1PILE ?auto_55388 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55409 - BLOCK
    )
    :vars
    (
      ?auto_55413 - BLOCK
      ?auto_55415 - BLOCK
      ?auto_55412 - BLOCK
      ?auto_55410 - BLOCK
      ?auto_55414 - BLOCK
      ?auto_55411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55409 ?auto_55413 ) ) ( not ( = ?auto_55409 ?auto_55415 ) ) ( not ( = ?auto_55409 ?auto_55412 ) ) ( not ( = ?auto_55413 ?auto_55415 ) ) ( not ( = ?auto_55413 ?auto_55412 ) ) ( not ( = ?auto_55415 ?auto_55412 ) ) ( not ( = ?auto_55410 ?auto_55414 ) ) ( not ( = ?auto_55410 ?auto_55412 ) ) ( not ( = ?auto_55414 ?auto_55412 ) ) ( not ( = ?auto_55409 ?auto_55414 ) ) ( not ( = ?auto_55409 ?auto_55410 ) ) ( not ( = ?auto_55413 ?auto_55414 ) ) ( not ( = ?auto_55413 ?auto_55410 ) ) ( not ( = ?auto_55415 ?auto_55414 ) ) ( not ( = ?auto_55415 ?auto_55410 ) ) ( ON ?auto_55410 ?auto_55411 ) ( not ( = ?auto_55409 ?auto_55411 ) ) ( not ( = ?auto_55413 ?auto_55411 ) ) ( not ( = ?auto_55415 ?auto_55411 ) ) ( not ( = ?auto_55412 ?auto_55411 ) ) ( not ( = ?auto_55410 ?auto_55411 ) ) ( not ( = ?auto_55414 ?auto_55411 ) ) ( ON ?auto_55414 ?auto_55410 ) ( ON-TABLE ?auto_55411 ) ( ON ?auto_55412 ?auto_55414 ) ( ON ?auto_55415 ?auto_55412 ) ( ON ?auto_55413 ?auto_55415 ) ( CLEAR ?auto_55413 ) ( HOLDING ?auto_55409 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55409 ?auto_55413 )
      ( MAKE-1PILE ?auto_55409 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_55416 - BLOCK
    )
    :vars
    (
      ?auto_55420 - BLOCK
      ?auto_55421 - BLOCK
      ?auto_55422 - BLOCK
      ?auto_55418 - BLOCK
      ?auto_55417 - BLOCK
      ?auto_55419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55416 ?auto_55420 ) ) ( not ( = ?auto_55416 ?auto_55421 ) ) ( not ( = ?auto_55416 ?auto_55422 ) ) ( not ( = ?auto_55420 ?auto_55421 ) ) ( not ( = ?auto_55420 ?auto_55422 ) ) ( not ( = ?auto_55421 ?auto_55422 ) ) ( not ( = ?auto_55418 ?auto_55417 ) ) ( not ( = ?auto_55418 ?auto_55422 ) ) ( not ( = ?auto_55417 ?auto_55422 ) ) ( not ( = ?auto_55416 ?auto_55417 ) ) ( not ( = ?auto_55416 ?auto_55418 ) ) ( not ( = ?auto_55420 ?auto_55417 ) ) ( not ( = ?auto_55420 ?auto_55418 ) ) ( not ( = ?auto_55421 ?auto_55417 ) ) ( not ( = ?auto_55421 ?auto_55418 ) ) ( ON ?auto_55418 ?auto_55419 ) ( not ( = ?auto_55416 ?auto_55419 ) ) ( not ( = ?auto_55420 ?auto_55419 ) ) ( not ( = ?auto_55421 ?auto_55419 ) ) ( not ( = ?auto_55422 ?auto_55419 ) ) ( not ( = ?auto_55418 ?auto_55419 ) ) ( not ( = ?auto_55417 ?auto_55419 ) ) ( ON ?auto_55417 ?auto_55418 ) ( ON-TABLE ?auto_55419 ) ( ON ?auto_55422 ?auto_55417 ) ( ON ?auto_55421 ?auto_55422 ) ( ON ?auto_55420 ?auto_55421 ) ( ON ?auto_55416 ?auto_55420 ) ( CLEAR ?auto_55416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55419 ?auto_55418 ?auto_55417 ?auto_55422 ?auto_55421 ?auto_55420 )
      ( MAKE-1PILE ?auto_55416 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55428 - BLOCK
      ?auto_55429 - BLOCK
      ?auto_55430 - BLOCK
      ?auto_55431 - BLOCK
      ?auto_55432 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_55432 ) ( CLEAR ?auto_55431 ) ( ON-TABLE ?auto_55428 ) ( ON ?auto_55429 ?auto_55428 ) ( ON ?auto_55430 ?auto_55429 ) ( ON ?auto_55431 ?auto_55430 ) ( not ( = ?auto_55428 ?auto_55429 ) ) ( not ( = ?auto_55428 ?auto_55430 ) ) ( not ( = ?auto_55428 ?auto_55431 ) ) ( not ( = ?auto_55428 ?auto_55432 ) ) ( not ( = ?auto_55429 ?auto_55430 ) ) ( not ( = ?auto_55429 ?auto_55431 ) ) ( not ( = ?auto_55429 ?auto_55432 ) ) ( not ( = ?auto_55430 ?auto_55431 ) ) ( not ( = ?auto_55430 ?auto_55432 ) ) ( not ( = ?auto_55431 ?auto_55432 ) ) )
    :subtasks
    ( ( !STACK ?auto_55432 ?auto_55431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55433 - BLOCK
      ?auto_55434 - BLOCK
      ?auto_55435 - BLOCK
      ?auto_55436 - BLOCK
      ?auto_55437 - BLOCK
    )
    :vars
    (
      ?auto_55438 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55436 ) ( ON-TABLE ?auto_55433 ) ( ON ?auto_55434 ?auto_55433 ) ( ON ?auto_55435 ?auto_55434 ) ( ON ?auto_55436 ?auto_55435 ) ( not ( = ?auto_55433 ?auto_55434 ) ) ( not ( = ?auto_55433 ?auto_55435 ) ) ( not ( = ?auto_55433 ?auto_55436 ) ) ( not ( = ?auto_55433 ?auto_55437 ) ) ( not ( = ?auto_55434 ?auto_55435 ) ) ( not ( = ?auto_55434 ?auto_55436 ) ) ( not ( = ?auto_55434 ?auto_55437 ) ) ( not ( = ?auto_55435 ?auto_55436 ) ) ( not ( = ?auto_55435 ?auto_55437 ) ) ( not ( = ?auto_55436 ?auto_55437 ) ) ( ON ?auto_55437 ?auto_55438 ) ( CLEAR ?auto_55437 ) ( HAND-EMPTY ) ( not ( = ?auto_55433 ?auto_55438 ) ) ( not ( = ?auto_55434 ?auto_55438 ) ) ( not ( = ?auto_55435 ?auto_55438 ) ) ( not ( = ?auto_55436 ?auto_55438 ) ) ( not ( = ?auto_55437 ?auto_55438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55437 ?auto_55438 )
      ( MAKE-5PILE ?auto_55433 ?auto_55434 ?auto_55435 ?auto_55436 ?auto_55437 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55439 - BLOCK
      ?auto_55440 - BLOCK
      ?auto_55441 - BLOCK
      ?auto_55442 - BLOCK
      ?auto_55443 - BLOCK
    )
    :vars
    (
      ?auto_55444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55439 ) ( ON ?auto_55440 ?auto_55439 ) ( ON ?auto_55441 ?auto_55440 ) ( not ( = ?auto_55439 ?auto_55440 ) ) ( not ( = ?auto_55439 ?auto_55441 ) ) ( not ( = ?auto_55439 ?auto_55442 ) ) ( not ( = ?auto_55439 ?auto_55443 ) ) ( not ( = ?auto_55440 ?auto_55441 ) ) ( not ( = ?auto_55440 ?auto_55442 ) ) ( not ( = ?auto_55440 ?auto_55443 ) ) ( not ( = ?auto_55441 ?auto_55442 ) ) ( not ( = ?auto_55441 ?auto_55443 ) ) ( not ( = ?auto_55442 ?auto_55443 ) ) ( ON ?auto_55443 ?auto_55444 ) ( CLEAR ?auto_55443 ) ( not ( = ?auto_55439 ?auto_55444 ) ) ( not ( = ?auto_55440 ?auto_55444 ) ) ( not ( = ?auto_55441 ?auto_55444 ) ) ( not ( = ?auto_55442 ?auto_55444 ) ) ( not ( = ?auto_55443 ?auto_55444 ) ) ( HOLDING ?auto_55442 ) ( CLEAR ?auto_55441 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55439 ?auto_55440 ?auto_55441 ?auto_55442 )
      ( MAKE-5PILE ?auto_55439 ?auto_55440 ?auto_55441 ?auto_55442 ?auto_55443 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55445 - BLOCK
      ?auto_55446 - BLOCK
      ?auto_55447 - BLOCK
      ?auto_55448 - BLOCK
      ?auto_55449 - BLOCK
    )
    :vars
    (
      ?auto_55450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55445 ) ( ON ?auto_55446 ?auto_55445 ) ( ON ?auto_55447 ?auto_55446 ) ( not ( = ?auto_55445 ?auto_55446 ) ) ( not ( = ?auto_55445 ?auto_55447 ) ) ( not ( = ?auto_55445 ?auto_55448 ) ) ( not ( = ?auto_55445 ?auto_55449 ) ) ( not ( = ?auto_55446 ?auto_55447 ) ) ( not ( = ?auto_55446 ?auto_55448 ) ) ( not ( = ?auto_55446 ?auto_55449 ) ) ( not ( = ?auto_55447 ?auto_55448 ) ) ( not ( = ?auto_55447 ?auto_55449 ) ) ( not ( = ?auto_55448 ?auto_55449 ) ) ( ON ?auto_55449 ?auto_55450 ) ( not ( = ?auto_55445 ?auto_55450 ) ) ( not ( = ?auto_55446 ?auto_55450 ) ) ( not ( = ?auto_55447 ?auto_55450 ) ) ( not ( = ?auto_55448 ?auto_55450 ) ) ( not ( = ?auto_55449 ?auto_55450 ) ) ( CLEAR ?auto_55447 ) ( ON ?auto_55448 ?auto_55449 ) ( CLEAR ?auto_55448 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55450 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55450 ?auto_55449 )
      ( MAKE-5PILE ?auto_55445 ?auto_55446 ?auto_55447 ?auto_55448 ?auto_55449 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55451 - BLOCK
      ?auto_55452 - BLOCK
      ?auto_55453 - BLOCK
      ?auto_55454 - BLOCK
      ?auto_55455 - BLOCK
    )
    :vars
    (
      ?auto_55456 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55451 ) ( ON ?auto_55452 ?auto_55451 ) ( not ( = ?auto_55451 ?auto_55452 ) ) ( not ( = ?auto_55451 ?auto_55453 ) ) ( not ( = ?auto_55451 ?auto_55454 ) ) ( not ( = ?auto_55451 ?auto_55455 ) ) ( not ( = ?auto_55452 ?auto_55453 ) ) ( not ( = ?auto_55452 ?auto_55454 ) ) ( not ( = ?auto_55452 ?auto_55455 ) ) ( not ( = ?auto_55453 ?auto_55454 ) ) ( not ( = ?auto_55453 ?auto_55455 ) ) ( not ( = ?auto_55454 ?auto_55455 ) ) ( ON ?auto_55455 ?auto_55456 ) ( not ( = ?auto_55451 ?auto_55456 ) ) ( not ( = ?auto_55452 ?auto_55456 ) ) ( not ( = ?auto_55453 ?auto_55456 ) ) ( not ( = ?auto_55454 ?auto_55456 ) ) ( not ( = ?auto_55455 ?auto_55456 ) ) ( ON ?auto_55454 ?auto_55455 ) ( CLEAR ?auto_55454 ) ( ON-TABLE ?auto_55456 ) ( HOLDING ?auto_55453 ) ( CLEAR ?auto_55452 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55451 ?auto_55452 ?auto_55453 )
      ( MAKE-5PILE ?auto_55451 ?auto_55452 ?auto_55453 ?auto_55454 ?auto_55455 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55457 - BLOCK
      ?auto_55458 - BLOCK
      ?auto_55459 - BLOCK
      ?auto_55460 - BLOCK
      ?auto_55461 - BLOCK
    )
    :vars
    (
      ?auto_55462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55457 ) ( ON ?auto_55458 ?auto_55457 ) ( not ( = ?auto_55457 ?auto_55458 ) ) ( not ( = ?auto_55457 ?auto_55459 ) ) ( not ( = ?auto_55457 ?auto_55460 ) ) ( not ( = ?auto_55457 ?auto_55461 ) ) ( not ( = ?auto_55458 ?auto_55459 ) ) ( not ( = ?auto_55458 ?auto_55460 ) ) ( not ( = ?auto_55458 ?auto_55461 ) ) ( not ( = ?auto_55459 ?auto_55460 ) ) ( not ( = ?auto_55459 ?auto_55461 ) ) ( not ( = ?auto_55460 ?auto_55461 ) ) ( ON ?auto_55461 ?auto_55462 ) ( not ( = ?auto_55457 ?auto_55462 ) ) ( not ( = ?auto_55458 ?auto_55462 ) ) ( not ( = ?auto_55459 ?auto_55462 ) ) ( not ( = ?auto_55460 ?auto_55462 ) ) ( not ( = ?auto_55461 ?auto_55462 ) ) ( ON ?auto_55460 ?auto_55461 ) ( ON-TABLE ?auto_55462 ) ( CLEAR ?auto_55458 ) ( ON ?auto_55459 ?auto_55460 ) ( CLEAR ?auto_55459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55462 ?auto_55461 ?auto_55460 )
      ( MAKE-5PILE ?auto_55457 ?auto_55458 ?auto_55459 ?auto_55460 ?auto_55461 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55463 - BLOCK
      ?auto_55464 - BLOCK
      ?auto_55465 - BLOCK
      ?auto_55466 - BLOCK
      ?auto_55467 - BLOCK
    )
    :vars
    (
      ?auto_55468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55463 ) ( not ( = ?auto_55463 ?auto_55464 ) ) ( not ( = ?auto_55463 ?auto_55465 ) ) ( not ( = ?auto_55463 ?auto_55466 ) ) ( not ( = ?auto_55463 ?auto_55467 ) ) ( not ( = ?auto_55464 ?auto_55465 ) ) ( not ( = ?auto_55464 ?auto_55466 ) ) ( not ( = ?auto_55464 ?auto_55467 ) ) ( not ( = ?auto_55465 ?auto_55466 ) ) ( not ( = ?auto_55465 ?auto_55467 ) ) ( not ( = ?auto_55466 ?auto_55467 ) ) ( ON ?auto_55467 ?auto_55468 ) ( not ( = ?auto_55463 ?auto_55468 ) ) ( not ( = ?auto_55464 ?auto_55468 ) ) ( not ( = ?auto_55465 ?auto_55468 ) ) ( not ( = ?auto_55466 ?auto_55468 ) ) ( not ( = ?auto_55467 ?auto_55468 ) ) ( ON ?auto_55466 ?auto_55467 ) ( ON-TABLE ?auto_55468 ) ( ON ?auto_55465 ?auto_55466 ) ( CLEAR ?auto_55465 ) ( HOLDING ?auto_55464 ) ( CLEAR ?auto_55463 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55463 ?auto_55464 )
      ( MAKE-5PILE ?auto_55463 ?auto_55464 ?auto_55465 ?auto_55466 ?auto_55467 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55469 - BLOCK
      ?auto_55470 - BLOCK
      ?auto_55471 - BLOCK
      ?auto_55472 - BLOCK
      ?auto_55473 - BLOCK
    )
    :vars
    (
      ?auto_55474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55469 ) ( not ( = ?auto_55469 ?auto_55470 ) ) ( not ( = ?auto_55469 ?auto_55471 ) ) ( not ( = ?auto_55469 ?auto_55472 ) ) ( not ( = ?auto_55469 ?auto_55473 ) ) ( not ( = ?auto_55470 ?auto_55471 ) ) ( not ( = ?auto_55470 ?auto_55472 ) ) ( not ( = ?auto_55470 ?auto_55473 ) ) ( not ( = ?auto_55471 ?auto_55472 ) ) ( not ( = ?auto_55471 ?auto_55473 ) ) ( not ( = ?auto_55472 ?auto_55473 ) ) ( ON ?auto_55473 ?auto_55474 ) ( not ( = ?auto_55469 ?auto_55474 ) ) ( not ( = ?auto_55470 ?auto_55474 ) ) ( not ( = ?auto_55471 ?auto_55474 ) ) ( not ( = ?auto_55472 ?auto_55474 ) ) ( not ( = ?auto_55473 ?auto_55474 ) ) ( ON ?auto_55472 ?auto_55473 ) ( ON-TABLE ?auto_55474 ) ( ON ?auto_55471 ?auto_55472 ) ( CLEAR ?auto_55469 ) ( ON ?auto_55470 ?auto_55471 ) ( CLEAR ?auto_55470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55474 ?auto_55473 ?auto_55472 ?auto_55471 )
      ( MAKE-5PILE ?auto_55469 ?auto_55470 ?auto_55471 ?auto_55472 ?auto_55473 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55475 - BLOCK
      ?auto_55476 - BLOCK
      ?auto_55477 - BLOCK
      ?auto_55478 - BLOCK
      ?auto_55479 - BLOCK
    )
    :vars
    (
      ?auto_55480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55475 ?auto_55476 ) ) ( not ( = ?auto_55475 ?auto_55477 ) ) ( not ( = ?auto_55475 ?auto_55478 ) ) ( not ( = ?auto_55475 ?auto_55479 ) ) ( not ( = ?auto_55476 ?auto_55477 ) ) ( not ( = ?auto_55476 ?auto_55478 ) ) ( not ( = ?auto_55476 ?auto_55479 ) ) ( not ( = ?auto_55477 ?auto_55478 ) ) ( not ( = ?auto_55477 ?auto_55479 ) ) ( not ( = ?auto_55478 ?auto_55479 ) ) ( ON ?auto_55479 ?auto_55480 ) ( not ( = ?auto_55475 ?auto_55480 ) ) ( not ( = ?auto_55476 ?auto_55480 ) ) ( not ( = ?auto_55477 ?auto_55480 ) ) ( not ( = ?auto_55478 ?auto_55480 ) ) ( not ( = ?auto_55479 ?auto_55480 ) ) ( ON ?auto_55478 ?auto_55479 ) ( ON-TABLE ?auto_55480 ) ( ON ?auto_55477 ?auto_55478 ) ( ON ?auto_55476 ?auto_55477 ) ( CLEAR ?auto_55476 ) ( HOLDING ?auto_55475 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55475 )
      ( MAKE-5PILE ?auto_55475 ?auto_55476 ?auto_55477 ?auto_55478 ?auto_55479 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55481 - BLOCK
      ?auto_55482 - BLOCK
      ?auto_55483 - BLOCK
      ?auto_55484 - BLOCK
      ?auto_55485 - BLOCK
    )
    :vars
    (
      ?auto_55486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55481 ?auto_55482 ) ) ( not ( = ?auto_55481 ?auto_55483 ) ) ( not ( = ?auto_55481 ?auto_55484 ) ) ( not ( = ?auto_55481 ?auto_55485 ) ) ( not ( = ?auto_55482 ?auto_55483 ) ) ( not ( = ?auto_55482 ?auto_55484 ) ) ( not ( = ?auto_55482 ?auto_55485 ) ) ( not ( = ?auto_55483 ?auto_55484 ) ) ( not ( = ?auto_55483 ?auto_55485 ) ) ( not ( = ?auto_55484 ?auto_55485 ) ) ( ON ?auto_55485 ?auto_55486 ) ( not ( = ?auto_55481 ?auto_55486 ) ) ( not ( = ?auto_55482 ?auto_55486 ) ) ( not ( = ?auto_55483 ?auto_55486 ) ) ( not ( = ?auto_55484 ?auto_55486 ) ) ( not ( = ?auto_55485 ?auto_55486 ) ) ( ON ?auto_55484 ?auto_55485 ) ( ON-TABLE ?auto_55486 ) ( ON ?auto_55483 ?auto_55484 ) ( ON ?auto_55482 ?auto_55483 ) ( ON ?auto_55481 ?auto_55482 ) ( CLEAR ?auto_55481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55486 ?auto_55485 ?auto_55484 ?auto_55483 ?auto_55482 )
      ( MAKE-5PILE ?auto_55481 ?auto_55482 ?auto_55483 ?auto_55484 ?auto_55485 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55487 - BLOCK
      ?auto_55488 - BLOCK
      ?auto_55489 - BLOCK
      ?auto_55490 - BLOCK
      ?auto_55491 - BLOCK
    )
    :vars
    (
      ?auto_55492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55487 ?auto_55488 ) ) ( not ( = ?auto_55487 ?auto_55489 ) ) ( not ( = ?auto_55487 ?auto_55490 ) ) ( not ( = ?auto_55487 ?auto_55491 ) ) ( not ( = ?auto_55488 ?auto_55489 ) ) ( not ( = ?auto_55488 ?auto_55490 ) ) ( not ( = ?auto_55488 ?auto_55491 ) ) ( not ( = ?auto_55489 ?auto_55490 ) ) ( not ( = ?auto_55489 ?auto_55491 ) ) ( not ( = ?auto_55490 ?auto_55491 ) ) ( ON ?auto_55491 ?auto_55492 ) ( not ( = ?auto_55487 ?auto_55492 ) ) ( not ( = ?auto_55488 ?auto_55492 ) ) ( not ( = ?auto_55489 ?auto_55492 ) ) ( not ( = ?auto_55490 ?auto_55492 ) ) ( not ( = ?auto_55491 ?auto_55492 ) ) ( ON ?auto_55490 ?auto_55491 ) ( ON-TABLE ?auto_55492 ) ( ON ?auto_55489 ?auto_55490 ) ( ON ?auto_55488 ?auto_55489 ) ( HOLDING ?auto_55487 ) ( CLEAR ?auto_55488 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55492 ?auto_55491 ?auto_55490 ?auto_55489 ?auto_55488 ?auto_55487 )
      ( MAKE-5PILE ?auto_55487 ?auto_55488 ?auto_55489 ?auto_55490 ?auto_55491 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55493 - BLOCK
      ?auto_55494 - BLOCK
      ?auto_55495 - BLOCK
      ?auto_55496 - BLOCK
      ?auto_55497 - BLOCK
    )
    :vars
    (
      ?auto_55498 - BLOCK
      ?auto_55499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55493 ?auto_55494 ) ) ( not ( = ?auto_55493 ?auto_55495 ) ) ( not ( = ?auto_55493 ?auto_55496 ) ) ( not ( = ?auto_55493 ?auto_55497 ) ) ( not ( = ?auto_55494 ?auto_55495 ) ) ( not ( = ?auto_55494 ?auto_55496 ) ) ( not ( = ?auto_55494 ?auto_55497 ) ) ( not ( = ?auto_55495 ?auto_55496 ) ) ( not ( = ?auto_55495 ?auto_55497 ) ) ( not ( = ?auto_55496 ?auto_55497 ) ) ( ON ?auto_55497 ?auto_55498 ) ( not ( = ?auto_55493 ?auto_55498 ) ) ( not ( = ?auto_55494 ?auto_55498 ) ) ( not ( = ?auto_55495 ?auto_55498 ) ) ( not ( = ?auto_55496 ?auto_55498 ) ) ( not ( = ?auto_55497 ?auto_55498 ) ) ( ON ?auto_55496 ?auto_55497 ) ( ON-TABLE ?auto_55498 ) ( ON ?auto_55495 ?auto_55496 ) ( ON ?auto_55494 ?auto_55495 ) ( CLEAR ?auto_55494 ) ( ON ?auto_55493 ?auto_55499 ) ( CLEAR ?auto_55493 ) ( HAND-EMPTY ) ( not ( = ?auto_55493 ?auto_55499 ) ) ( not ( = ?auto_55494 ?auto_55499 ) ) ( not ( = ?auto_55495 ?auto_55499 ) ) ( not ( = ?auto_55496 ?auto_55499 ) ) ( not ( = ?auto_55497 ?auto_55499 ) ) ( not ( = ?auto_55498 ?auto_55499 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55493 ?auto_55499 )
      ( MAKE-5PILE ?auto_55493 ?auto_55494 ?auto_55495 ?auto_55496 ?auto_55497 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55500 - BLOCK
      ?auto_55501 - BLOCK
      ?auto_55502 - BLOCK
      ?auto_55503 - BLOCK
      ?auto_55504 - BLOCK
    )
    :vars
    (
      ?auto_55506 - BLOCK
      ?auto_55505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55500 ?auto_55501 ) ) ( not ( = ?auto_55500 ?auto_55502 ) ) ( not ( = ?auto_55500 ?auto_55503 ) ) ( not ( = ?auto_55500 ?auto_55504 ) ) ( not ( = ?auto_55501 ?auto_55502 ) ) ( not ( = ?auto_55501 ?auto_55503 ) ) ( not ( = ?auto_55501 ?auto_55504 ) ) ( not ( = ?auto_55502 ?auto_55503 ) ) ( not ( = ?auto_55502 ?auto_55504 ) ) ( not ( = ?auto_55503 ?auto_55504 ) ) ( ON ?auto_55504 ?auto_55506 ) ( not ( = ?auto_55500 ?auto_55506 ) ) ( not ( = ?auto_55501 ?auto_55506 ) ) ( not ( = ?auto_55502 ?auto_55506 ) ) ( not ( = ?auto_55503 ?auto_55506 ) ) ( not ( = ?auto_55504 ?auto_55506 ) ) ( ON ?auto_55503 ?auto_55504 ) ( ON-TABLE ?auto_55506 ) ( ON ?auto_55502 ?auto_55503 ) ( ON ?auto_55500 ?auto_55505 ) ( CLEAR ?auto_55500 ) ( not ( = ?auto_55500 ?auto_55505 ) ) ( not ( = ?auto_55501 ?auto_55505 ) ) ( not ( = ?auto_55502 ?auto_55505 ) ) ( not ( = ?auto_55503 ?auto_55505 ) ) ( not ( = ?auto_55504 ?auto_55505 ) ) ( not ( = ?auto_55506 ?auto_55505 ) ) ( HOLDING ?auto_55501 ) ( CLEAR ?auto_55502 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55506 ?auto_55504 ?auto_55503 ?auto_55502 ?auto_55501 )
      ( MAKE-5PILE ?auto_55500 ?auto_55501 ?auto_55502 ?auto_55503 ?auto_55504 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55507 - BLOCK
      ?auto_55508 - BLOCK
      ?auto_55509 - BLOCK
      ?auto_55510 - BLOCK
      ?auto_55511 - BLOCK
    )
    :vars
    (
      ?auto_55513 - BLOCK
      ?auto_55512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55507 ?auto_55508 ) ) ( not ( = ?auto_55507 ?auto_55509 ) ) ( not ( = ?auto_55507 ?auto_55510 ) ) ( not ( = ?auto_55507 ?auto_55511 ) ) ( not ( = ?auto_55508 ?auto_55509 ) ) ( not ( = ?auto_55508 ?auto_55510 ) ) ( not ( = ?auto_55508 ?auto_55511 ) ) ( not ( = ?auto_55509 ?auto_55510 ) ) ( not ( = ?auto_55509 ?auto_55511 ) ) ( not ( = ?auto_55510 ?auto_55511 ) ) ( ON ?auto_55511 ?auto_55513 ) ( not ( = ?auto_55507 ?auto_55513 ) ) ( not ( = ?auto_55508 ?auto_55513 ) ) ( not ( = ?auto_55509 ?auto_55513 ) ) ( not ( = ?auto_55510 ?auto_55513 ) ) ( not ( = ?auto_55511 ?auto_55513 ) ) ( ON ?auto_55510 ?auto_55511 ) ( ON-TABLE ?auto_55513 ) ( ON ?auto_55509 ?auto_55510 ) ( ON ?auto_55507 ?auto_55512 ) ( not ( = ?auto_55507 ?auto_55512 ) ) ( not ( = ?auto_55508 ?auto_55512 ) ) ( not ( = ?auto_55509 ?auto_55512 ) ) ( not ( = ?auto_55510 ?auto_55512 ) ) ( not ( = ?auto_55511 ?auto_55512 ) ) ( not ( = ?auto_55513 ?auto_55512 ) ) ( CLEAR ?auto_55509 ) ( ON ?auto_55508 ?auto_55507 ) ( CLEAR ?auto_55508 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55512 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55512 ?auto_55507 )
      ( MAKE-5PILE ?auto_55507 ?auto_55508 ?auto_55509 ?auto_55510 ?auto_55511 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55514 - BLOCK
      ?auto_55515 - BLOCK
      ?auto_55516 - BLOCK
      ?auto_55517 - BLOCK
      ?auto_55518 - BLOCK
    )
    :vars
    (
      ?auto_55520 - BLOCK
      ?auto_55519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55514 ?auto_55515 ) ) ( not ( = ?auto_55514 ?auto_55516 ) ) ( not ( = ?auto_55514 ?auto_55517 ) ) ( not ( = ?auto_55514 ?auto_55518 ) ) ( not ( = ?auto_55515 ?auto_55516 ) ) ( not ( = ?auto_55515 ?auto_55517 ) ) ( not ( = ?auto_55515 ?auto_55518 ) ) ( not ( = ?auto_55516 ?auto_55517 ) ) ( not ( = ?auto_55516 ?auto_55518 ) ) ( not ( = ?auto_55517 ?auto_55518 ) ) ( ON ?auto_55518 ?auto_55520 ) ( not ( = ?auto_55514 ?auto_55520 ) ) ( not ( = ?auto_55515 ?auto_55520 ) ) ( not ( = ?auto_55516 ?auto_55520 ) ) ( not ( = ?auto_55517 ?auto_55520 ) ) ( not ( = ?auto_55518 ?auto_55520 ) ) ( ON ?auto_55517 ?auto_55518 ) ( ON-TABLE ?auto_55520 ) ( ON ?auto_55514 ?auto_55519 ) ( not ( = ?auto_55514 ?auto_55519 ) ) ( not ( = ?auto_55515 ?auto_55519 ) ) ( not ( = ?auto_55516 ?auto_55519 ) ) ( not ( = ?auto_55517 ?auto_55519 ) ) ( not ( = ?auto_55518 ?auto_55519 ) ) ( not ( = ?auto_55520 ?auto_55519 ) ) ( ON ?auto_55515 ?auto_55514 ) ( CLEAR ?auto_55515 ) ( ON-TABLE ?auto_55519 ) ( HOLDING ?auto_55516 ) ( CLEAR ?auto_55517 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55520 ?auto_55518 ?auto_55517 ?auto_55516 )
      ( MAKE-5PILE ?auto_55514 ?auto_55515 ?auto_55516 ?auto_55517 ?auto_55518 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55521 - BLOCK
      ?auto_55522 - BLOCK
      ?auto_55523 - BLOCK
      ?auto_55524 - BLOCK
      ?auto_55525 - BLOCK
    )
    :vars
    (
      ?auto_55527 - BLOCK
      ?auto_55526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55521 ?auto_55522 ) ) ( not ( = ?auto_55521 ?auto_55523 ) ) ( not ( = ?auto_55521 ?auto_55524 ) ) ( not ( = ?auto_55521 ?auto_55525 ) ) ( not ( = ?auto_55522 ?auto_55523 ) ) ( not ( = ?auto_55522 ?auto_55524 ) ) ( not ( = ?auto_55522 ?auto_55525 ) ) ( not ( = ?auto_55523 ?auto_55524 ) ) ( not ( = ?auto_55523 ?auto_55525 ) ) ( not ( = ?auto_55524 ?auto_55525 ) ) ( ON ?auto_55525 ?auto_55527 ) ( not ( = ?auto_55521 ?auto_55527 ) ) ( not ( = ?auto_55522 ?auto_55527 ) ) ( not ( = ?auto_55523 ?auto_55527 ) ) ( not ( = ?auto_55524 ?auto_55527 ) ) ( not ( = ?auto_55525 ?auto_55527 ) ) ( ON ?auto_55524 ?auto_55525 ) ( ON-TABLE ?auto_55527 ) ( ON ?auto_55521 ?auto_55526 ) ( not ( = ?auto_55521 ?auto_55526 ) ) ( not ( = ?auto_55522 ?auto_55526 ) ) ( not ( = ?auto_55523 ?auto_55526 ) ) ( not ( = ?auto_55524 ?auto_55526 ) ) ( not ( = ?auto_55525 ?auto_55526 ) ) ( not ( = ?auto_55527 ?auto_55526 ) ) ( ON ?auto_55522 ?auto_55521 ) ( ON-TABLE ?auto_55526 ) ( CLEAR ?auto_55524 ) ( ON ?auto_55523 ?auto_55522 ) ( CLEAR ?auto_55523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55526 ?auto_55521 ?auto_55522 )
      ( MAKE-5PILE ?auto_55521 ?auto_55522 ?auto_55523 ?auto_55524 ?auto_55525 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55528 - BLOCK
      ?auto_55529 - BLOCK
      ?auto_55530 - BLOCK
      ?auto_55531 - BLOCK
      ?auto_55532 - BLOCK
    )
    :vars
    (
      ?auto_55533 - BLOCK
      ?auto_55534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55528 ?auto_55529 ) ) ( not ( = ?auto_55528 ?auto_55530 ) ) ( not ( = ?auto_55528 ?auto_55531 ) ) ( not ( = ?auto_55528 ?auto_55532 ) ) ( not ( = ?auto_55529 ?auto_55530 ) ) ( not ( = ?auto_55529 ?auto_55531 ) ) ( not ( = ?auto_55529 ?auto_55532 ) ) ( not ( = ?auto_55530 ?auto_55531 ) ) ( not ( = ?auto_55530 ?auto_55532 ) ) ( not ( = ?auto_55531 ?auto_55532 ) ) ( ON ?auto_55532 ?auto_55533 ) ( not ( = ?auto_55528 ?auto_55533 ) ) ( not ( = ?auto_55529 ?auto_55533 ) ) ( not ( = ?auto_55530 ?auto_55533 ) ) ( not ( = ?auto_55531 ?auto_55533 ) ) ( not ( = ?auto_55532 ?auto_55533 ) ) ( ON-TABLE ?auto_55533 ) ( ON ?auto_55528 ?auto_55534 ) ( not ( = ?auto_55528 ?auto_55534 ) ) ( not ( = ?auto_55529 ?auto_55534 ) ) ( not ( = ?auto_55530 ?auto_55534 ) ) ( not ( = ?auto_55531 ?auto_55534 ) ) ( not ( = ?auto_55532 ?auto_55534 ) ) ( not ( = ?auto_55533 ?auto_55534 ) ) ( ON ?auto_55529 ?auto_55528 ) ( ON-TABLE ?auto_55534 ) ( ON ?auto_55530 ?auto_55529 ) ( CLEAR ?auto_55530 ) ( HOLDING ?auto_55531 ) ( CLEAR ?auto_55532 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55533 ?auto_55532 ?auto_55531 )
      ( MAKE-5PILE ?auto_55528 ?auto_55529 ?auto_55530 ?auto_55531 ?auto_55532 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55535 - BLOCK
      ?auto_55536 - BLOCK
      ?auto_55537 - BLOCK
      ?auto_55538 - BLOCK
      ?auto_55539 - BLOCK
    )
    :vars
    (
      ?auto_55541 - BLOCK
      ?auto_55540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55535 ?auto_55536 ) ) ( not ( = ?auto_55535 ?auto_55537 ) ) ( not ( = ?auto_55535 ?auto_55538 ) ) ( not ( = ?auto_55535 ?auto_55539 ) ) ( not ( = ?auto_55536 ?auto_55537 ) ) ( not ( = ?auto_55536 ?auto_55538 ) ) ( not ( = ?auto_55536 ?auto_55539 ) ) ( not ( = ?auto_55537 ?auto_55538 ) ) ( not ( = ?auto_55537 ?auto_55539 ) ) ( not ( = ?auto_55538 ?auto_55539 ) ) ( ON ?auto_55539 ?auto_55541 ) ( not ( = ?auto_55535 ?auto_55541 ) ) ( not ( = ?auto_55536 ?auto_55541 ) ) ( not ( = ?auto_55537 ?auto_55541 ) ) ( not ( = ?auto_55538 ?auto_55541 ) ) ( not ( = ?auto_55539 ?auto_55541 ) ) ( ON-TABLE ?auto_55541 ) ( ON ?auto_55535 ?auto_55540 ) ( not ( = ?auto_55535 ?auto_55540 ) ) ( not ( = ?auto_55536 ?auto_55540 ) ) ( not ( = ?auto_55537 ?auto_55540 ) ) ( not ( = ?auto_55538 ?auto_55540 ) ) ( not ( = ?auto_55539 ?auto_55540 ) ) ( not ( = ?auto_55541 ?auto_55540 ) ) ( ON ?auto_55536 ?auto_55535 ) ( ON-TABLE ?auto_55540 ) ( ON ?auto_55537 ?auto_55536 ) ( CLEAR ?auto_55539 ) ( ON ?auto_55538 ?auto_55537 ) ( CLEAR ?auto_55538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55540 ?auto_55535 ?auto_55536 ?auto_55537 )
      ( MAKE-5PILE ?auto_55535 ?auto_55536 ?auto_55537 ?auto_55538 ?auto_55539 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55542 - BLOCK
      ?auto_55543 - BLOCK
      ?auto_55544 - BLOCK
      ?auto_55545 - BLOCK
      ?auto_55546 - BLOCK
    )
    :vars
    (
      ?auto_55547 - BLOCK
      ?auto_55548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55542 ?auto_55543 ) ) ( not ( = ?auto_55542 ?auto_55544 ) ) ( not ( = ?auto_55542 ?auto_55545 ) ) ( not ( = ?auto_55542 ?auto_55546 ) ) ( not ( = ?auto_55543 ?auto_55544 ) ) ( not ( = ?auto_55543 ?auto_55545 ) ) ( not ( = ?auto_55543 ?auto_55546 ) ) ( not ( = ?auto_55544 ?auto_55545 ) ) ( not ( = ?auto_55544 ?auto_55546 ) ) ( not ( = ?auto_55545 ?auto_55546 ) ) ( not ( = ?auto_55542 ?auto_55547 ) ) ( not ( = ?auto_55543 ?auto_55547 ) ) ( not ( = ?auto_55544 ?auto_55547 ) ) ( not ( = ?auto_55545 ?auto_55547 ) ) ( not ( = ?auto_55546 ?auto_55547 ) ) ( ON-TABLE ?auto_55547 ) ( ON ?auto_55542 ?auto_55548 ) ( not ( = ?auto_55542 ?auto_55548 ) ) ( not ( = ?auto_55543 ?auto_55548 ) ) ( not ( = ?auto_55544 ?auto_55548 ) ) ( not ( = ?auto_55545 ?auto_55548 ) ) ( not ( = ?auto_55546 ?auto_55548 ) ) ( not ( = ?auto_55547 ?auto_55548 ) ) ( ON ?auto_55543 ?auto_55542 ) ( ON-TABLE ?auto_55548 ) ( ON ?auto_55544 ?auto_55543 ) ( ON ?auto_55545 ?auto_55544 ) ( CLEAR ?auto_55545 ) ( HOLDING ?auto_55546 ) ( CLEAR ?auto_55547 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55547 ?auto_55546 )
      ( MAKE-5PILE ?auto_55542 ?auto_55543 ?auto_55544 ?auto_55545 ?auto_55546 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55549 - BLOCK
      ?auto_55550 - BLOCK
      ?auto_55551 - BLOCK
      ?auto_55552 - BLOCK
      ?auto_55553 - BLOCK
    )
    :vars
    (
      ?auto_55554 - BLOCK
      ?auto_55555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55549 ?auto_55550 ) ) ( not ( = ?auto_55549 ?auto_55551 ) ) ( not ( = ?auto_55549 ?auto_55552 ) ) ( not ( = ?auto_55549 ?auto_55553 ) ) ( not ( = ?auto_55550 ?auto_55551 ) ) ( not ( = ?auto_55550 ?auto_55552 ) ) ( not ( = ?auto_55550 ?auto_55553 ) ) ( not ( = ?auto_55551 ?auto_55552 ) ) ( not ( = ?auto_55551 ?auto_55553 ) ) ( not ( = ?auto_55552 ?auto_55553 ) ) ( not ( = ?auto_55549 ?auto_55554 ) ) ( not ( = ?auto_55550 ?auto_55554 ) ) ( not ( = ?auto_55551 ?auto_55554 ) ) ( not ( = ?auto_55552 ?auto_55554 ) ) ( not ( = ?auto_55553 ?auto_55554 ) ) ( ON-TABLE ?auto_55554 ) ( ON ?auto_55549 ?auto_55555 ) ( not ( = ?auto_55549 ?auto_55555 ) ) ( not ( = ?auto_55550 ?auto_55555 ) ) ( not ( = ?auto_55551 ?auto_55555 ) ) ( not ( = ?auto_55552 ?auto_55555 ) ) ( not ( = ?auto_55553 ?auto_55555 ) ) ( not ( = ?auto_55554 ?auto_55555 ) ) ( ON ?auto_55550 ?auto_55549 ) ( ON-TABLE ?auto_55555 ) ( ON ?auto_55551 ?auto_55550 ) ( ON ?auto_55552 ?auto_55551 ) ( CLEAR ?auto_55554 ) ( ON ?auto_55553 ?auto_55552 ) ( CLEAR ?auto_55553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55555 ?auto_55549 ?auto_55550 ?auto_55551 ?auto_55552 )
      ( MAKE-5PILE ?auto_55549 ?auto_55550 ?auto_55551 ?auto_55552 ?auto_55553 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55556 - BLOCK
      ?auto_55557 - BLOCK
      ?auto_55558 - BLOCK
      ?auto_55559 - BLOCK
      ?auto_55560 - BLOCK
    )
    :vars
    (
      ?auto_55562 - BLOCK
      ?auto_55561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55556 ?auto_55557 ) ) ( not ( = ?auto_55556 ?auto_55558 ) ) ( not ( = ?auto_55556 ?auto_55559 ) ) ( not ( = ?auto_55556 ?auto_55560 ) ) ( not ( = ?auto_55557 ?auto_55558 ) ) ( not ( = ?auto_55557 ?auto_55559 ) ) ( not ( = ?auto_55557 ?auto_55560 ) ) ( not ( = ?auto_55558 ?auto_55559 ) ) ( not ( = ?auto_55558 ?auto_55560 ) ) ( not ( = ?auto_55559 ?auto_55560 ) ) ( not ( = ?auto_55556 ?auto_55562 ) ) ( not ( = ?auto_55557 ?auto_55562 ) ) ( not ( = ?auto_55558 ?auto_55562 ) ) ( not ( = ?auto_55559 ?auto_55562 ) ) ( not ( = ?auto_55560 ?auto_55562 ) ) ( ON ?auto_55556 ?auto_55561 ) ( not ( = ?auto_55556 ?auto_55561 ) ) ( not ( = ?auto_55557 ?auto_55561 ) ) ( not ( = ?auto_55558 ?auto_55561 ) ) ( not ( = ?auto_55559 ?auto_55561 ) ) ( not ( = ?auto_55560 ?auto_55561 ) ) ( not ( = ?auto_55562 ?auto_55561 ) ) ( ON ?auto_55557 ?auto_55556 ) ( ON-TABLE ?auto_55561 ) ( ON ?auto_55558 ?auto_55557 ) ( ON ?auto_55559 ?auto_55558 ) ( ON ?auto_55560 ?auto_55559 ) ( CLEAR ?auto_55560 ) ( HOLDING ?auto_55562 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55562 )
      ( MAKE-5PILE ?auto_55556 ?auto_55557 ?auto_55558 ?auto_55559 ?auto_55560 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55563 - BLOCK
      ?auto_55564 - BLOCK
      ?auto_55565 - BLOCK
      ?auto_55566 - BLOCK
      ?auto_55567 - BLOCK
    )
    :vars
    (
      ?auto_55569 - BLOCK
      ?auto_55568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55563 ?auto_55564 ) ) ( not ( = ?auto_55563 ?auto_55565 ) ) ( not ( = ?auto_55563 ?auto_55566 ) ) ( not ( = ?auto_55563 ?auto_55567 ) ) ( not ( = ?auto_55564 ?auto_55565 ) ) ( not ( = ?auto_55564 ?auto_55566 ) ) ( not ( = ?auto_55564 ?auto_55567 ) ) ( not ( = ?auto_55565 ?auto_55566 ) ) ( not ( = ?auto_55565 ?auto_55567 ) ) ( not ( = ?auto_55566 ?auto_55567 ) ) ( not ( = ?auto_55563 ?auto_55569 ) ) ( not ( = ?auto_55564 ?auto_55569 ) ) ( not ( = ?auto_55565 ?auto_55569 ) ) ( not ( = ?auto_55566 ?auto_55569 ) ) ( not ( = ?auto_55567 ?auto_55569 ) ) ( ON ?auto_55563 ?auto_55568 ) ( not ( = ?auto_55563 ?auto_55568 ) ) ( not ( = ?auto_55564 ?auto_55568 ) ) ( not ( = ?auto_55565 ?auto_55568 ) ) ( not ( = ?auto_55566 ?auto_55568 ) ) ( not ( = ?auto_55567 ?auto_55568 ) ) ( not ( = ?auto_55569 ?auto_55568 ) ) ( ON ?auto_55564 ?auto_55563 ) ( ON-TABLE ?auto_55568 ) ( ON ?auto_55565 ?auto_55564 ) ( ON ?auto_55566 ?auto_55565 ) ( ON ?auto_55567 ?auto_55566 ) ( ON ?auto_55569 ?auto_55567 ) ( CLEAR ?auto_55569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55568 ?auto_55563 ?auto_55564 ?auto_55565 ?auto_55566 ?auto_55567 )
      ( MAKE-5PILE ?auto_55563 ?auto_55564 ?auto_55565 ?auto_55566 ?auto_55567 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55576 - BLOCK
      ?auto_55577 - BLOCK
      ?auto_55578 - BLOCK
      ?auto_55579 - BLOCK
      ?auto_55580 - BLOCK
      ?auto_55581 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_55581 ) ( CLEAR ?auto_55580 ) ( ON-TABLE ?auto_55576 ) ( ON ?auto_55577 ?auto_55576 ) ( ON ?auto_55578 ?auto_55577 ) ( ON ?auto_55579 ?auto_55578 ) ( ON ?auto_55580 ?auto_55579 ) ( not ( = ?auto_55576 ?auto_55577 ) ) ( not ( = ?auto_55576 ?auto_55578 ) ) ( not ( = ?auto_55576 ?auto_55579 ) ) ( not ( = ?auto_55576 ?auto_55580 ) ) ( not ( = ?auto_55576 ?auto_55581 ) ) ( not ( = ?auto_55577 ?auto_55578 ) ) ( not ( = ?auto_55577 ?auto_55579 ) ) ( not ( = ?auto_55577 ?auto_55580 ) ) ( not ( = ?auto_55577 ?auto_55581 ) ) ( not ( = ?auto_55578 ?auto_55579 ) ) ( not ( = ?auto_55578 ?auto_55580 ) ) ( not ( = ?auto_55578 ?auto_55581 ) ) ( not ( = ?auto_55579 ?auto_55580 ) ) ( not ( = ?auto_55579 ?auto_55581 ) ) ( not ( = ?auto_55580 ?auto_55581 ) ) )
    :subtasks
    ( ( !STACK ?auto_55581 ?auto_55580 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55582 - BLOCK
      ?auto_55583 - BLOCK
      ?auto_55584 - BLOCK
      ?auto_55585 - BLOCK
      ?auto_55586 - BLOCK
      ?auto_55587 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55586 ) ( ON-TABLE ?auto_55582 ) ( ON ?auto_55583 ?auto_55582 ) ( ON ?auto_55584 ?auto_55583 ) ( ON ?auto_55585 ?auto_55584 ) ( ON ?auto_55586 ?auto_55585 ) ( not ( = ?auto_55582 ?auto_55583 ) ) ( not ( = ?auto_55582 ?auto_55584 ) ) ( not ( = ?auto_55582 ?auto_55585 ) ) ( not ( = ?auto_55582 ?auto_55586 ) ) ( not ( = ?auto_55582 ?auto_55587 ) ) ( not ( = ?auto_55583 ?auto_55584 ) ) ( not ( = ?auto_55583 ?auto_55585 ) ) ( not ( = ?auto_55583 ?auto_55586 ) ) ( not ( = ?auto_55583 ?auto_55587 ) ) ( not ( = ?auto_55584 ?auto_55585 ) ) ( not ( = ?auto_55584 ?auto_55586 ) ) ( not ( = ?auto_55584 ?auto_55587 ) ) ( not ( = ?auto_55585 ?auto_55586 ) ) ( not ( = ?auto_55585 ?auto_55587 ) ) ( not ( = ?auto_55586 ?auto_55587 ) ) ( ON-TABLE ?auto_55587 ) ( CLEAR ?auto_55587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_55587 )
      ( MAKE-6PILE ?auto_55582 ?auto_55583 ?auto_55584 ?auto_55585 ?auto_55586 ?auto_55587 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55588 - BLOCK
      ?auto_55589 - BLOCK
      ?auto_55590 - BLOCK
      ?auto_55591 - BLOCK
      ?auto_55592 - BLOCK
      ?auto_55593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55588 ) ( ON ?auto_55589 ?auto_55588 ) ( ON ?auto_55590 ?auto_55589 ) ( ON ?auto_55591 ?auto_55590 ) ( not ( = ?auto_55588 ?auto_55589 ) ) ( not ( = ?auto_55588 ?auto_55590 ) ) ( not ( = ?auto_55588 ?auto_55591 ) ) ( not ( = ?auto_55588 ?auto_55592 ) ) ( not ( = ?auto_55588 ?auto_55593 ) ) ( not ( = ?auto_55589 ?auto_55590 ) ) ( not ( = ?auto_55589 ?auto_55591 ) ) ( not ( = ?auto_55589 ?auto_55592 ) ) ( not ( = ?auto_55589 ?auto_55593 ) ) ( not ( = ?auto_55590 ?auto_55591 ) ) ( not ( = ?auto_55590 ?auto_55592 ) ) ( not ( = ?auto_55590 ?auto_55593 ) ) ( not ( = ?auto_55591 ?auto_55592 ) ) ( not ( = ?auto_55591 ?auto_55593 ) ) ( not ( = ?auto_55592 ?auto_55593 ) ) ( ON-TABLE ?auto_55593 ) ( CLEAR ?auto_55593 ) ( HOLDING ?auto_55592 ) ( CLEAR ?auto_55591 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55588 ?auto_55589 ?auto_55590 ?auto_55591 ?auto_55592 )
      ( MAKE-6PILE ?auto_55588 ?auto_55589 ?auto_55590 ?auto_55591 ?auto_55592 ?auto_55593 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55594 - BLOCK
      ?auto_55595 - BLOCK
      ?auto_55596 - BLOCK
      ?auto_55597 - BLOCK
      ?auto_55598 - BLOCK
      ?auto_55599 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55594 ) ( ON ?auto_55595 ?auto_55594 ) ( ON ?auto_55596 ?auto_55595 ) ( ON ?auto_55597 ?auto_55596 ) ( not ( = ?auto_55594 ?auto_55595 ) ) ( not ( = ?auto_55594 ?auto_55596 ) ) ( not ( = ?auto_55594 ?auto_55597 ) ) ( not ( = ?auto_55594 ?auto_55598 ) ) ( not ( = ?auto_55594 ?auto_55599 ) ) ( not ( = ?auto_55595 ?auto_55596 ) ) ( not ( = ?auto_55595 ?auto_55597 ) ) ( not ( = ?auto_55595 ?auto_55598 ) ) ( not ( = ?auto_55595 ?auto_55599 ) ) ( not ( = ?auto_55596 ?auto_55597 ) ) ( not ( = ?auto_55596 ?auto_55598 ) ) ( not ( = ?auto_55596 ?auto_55599 ) ) ( not ( = ?auto_55597 ?auto_55598 ) ) ( not ( = ?auto_55597 ?auto_55599 ) ) ( not ( = ?auto_55598 ?auto_55599 ) ) ( ON-TABLE ?auto_55599 ) ( CLEAR ?auto_55597 ) ( ON ?auto_55598 ?auto_55599 ) ( CLEAR ?auto_55598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55599 )
      ( MAKE-6PILE ?auto_55594 ?auto_55595 ?auto_55596 ?auto_55597 ?auto_55598 ?auto_55599 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55600 - BLOCK
      ?auto_55601 - BLOCK
      ?auto_55602 - BLOCK
      ?auto_55603 - BLOCK
      ?auto_55604 - BLOCK
      ?auto_55605 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55600 ) ( ON ?auto_55601 ?auto_55600 ) ( ON ?auto_55602 ?auto_55601 ) ( not ( = ?auto_55600 ?auto_55601 ) ) ( not ( = ?auto_55600 ?auto_55602 ) ) ( not ( = ?auto_55600 ?auto_55603 ) ) ( not ( = ?auto_55600 ?auto_55604 ) ) ( not ( = ?auto_55600 ?auto_55605 ) ) ( not ( = ?auto_55601 ?auto_55602 ) ) ( not ( = ?auto_55601 ?auto_55603 ) ) ( not ( = ?auto_55601 ?auto_55604 ) ) ( not ( = ?auto_55601 ?auto_55605 ) ) ( not ( = ?auto_55602 ?auto_55603 ) ) ( not ( = ?auto_55602 ?auto_55604 ) ) ( not ( = ?auto_55602 ?auto_55605 ) ) ( not ( = ?auto_55603 ?auto_55604 ) ) ( not ( = ?auto_55603 ?auto_55605 ) ) ( not ( = ?auto_55604 ?auto_55605 ) ) ( ON-TABLE ?auto_55605 ) ( ON ?auto_55604 ?auto_55605 ) ( CLEAR ?auto_55604 ) ( HOLDING ?auto_55603 ) ( CLEAR ?auto_55602 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55600 ?auto_55601 ?auto_55602 ?auto_55603 )
      ( MAKE-6PILE ?auto_55600 ?auto_55601 ?auto_55602 ?auto_55603 ?auto_55604 ?auto_55605 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55606 - BLOCK
      ?auto_55607 - BLOCK
      ?auto_55608 - BLOCK
      ?auto_55609 - BLOCK
      ?auto_55610 - BLOCK
      ?auto_55611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55606 ) ( ON ?auto_55607 ?auto_55606 ) ( ON ?auto_55608 ?auto_55607 ) ( not ( = ?auto_55606 ?auto_55607 ) ) ( not ( = ?auto_55606 ?auto_55608 ) ) ( not ( = ?auto_55606 ?auto_55609 ) ) ( not ( = ?auto_55606 ?auto_55610 ) ) ( not ( = ?auto_55606 ?auto_55611 ) ) ( not ( = ?auto_55607 ?auto_55608 ) ) ( not ( = ?auto_55607 ?auto_55609 ) ) ( not ( = ?auto_55607 ?auto_55610 ) ) ( not ( = ?auto_55607 ?auto_55611 ) ) ( not ( = ?auto_55608 ?auto_55609 ) ) ( not ( = ?auto_55608 ?auto_55610 ) ) ( not ( = ?auto_55608 ?auto_55611 ) ) ( not ( = ?auto_55609 ?auto_55610 ) ) ( not ( = ?auto_55609 ?auto_55611 ) ) ( not ( = ?auto_55610 ?auto_55611 ) ) ( ON-TABLE ?auto_55611 ) ( ON ?auto_55610 ?auto_55611 ) ( CLEAR ?auto_55608 ) ( ON ?auto_55609 ?auto_55610 ) ( CLEAR ?auto_55609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55611 ?auto_55610 )
      ( MAKE-6PILE ?auto_55606 ?auto_55607 ?auto_55608 ?auto_55609 ?auto_55610 ?auto_55611 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55612 - BLOCK
      ?auto_55613 - BLOCK
      ?auto_55614 - BLOCK
      ?auto_55615 - BLOCK
      ?auto_55616 - BLOCK
      ?auto_55617 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55612 ) ( ON ?auto_55613 ?auto_55612 ) ( not ( = ?auto_55612 ?auto_55613 ) ) ( not ( = ?auto_55612 ?auto_55614 ) ) ( not ( = ?auto_55612 ?auto_55615 ) ) ( not ( = ?auto_55612 ?auto_55616 ) ) ( not ( = ?auto_55612 ?auto_55617 ) ) ( not ( = ?auto_55613 ?auto_55614 ) ) ( not ( = ?auto_55613 ?auto_55615 ) ) ( not ( = ?auto_55613 ?auto_55616 ) ) ( not ( = ?auto_55613 ?auto_55617 ) ) ( not ( = ?auto_55614 ?auto_55615 ) ) ( not ( = ?auto_55614 ?auto_55616 ) ) ( not ( = ?auto_55614 ?auto_55617 ) ) ( not ( = ?auto_55615 ?auto_55616 ) ) ( not ( = ?auto_55615 ?auto_55617 ) ) ( not ( = ?auto_55616 ?auto_55617 ) ) ( ON-TABLE ?auto_55617 ) ( ON ?auto_55616 ?auto_55617 ) ( ON ?auto_55615 ?auto_55616 ) ( CLEAR ?auto_55615 ) ( HOLDING ?auto_55614 ) ( CLEAR ?auto_55613 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55612 ?auto_55613 ?auto_55614 )
      ( MAKE-6PILE ?auto_55612 ?auto_55613 ?auto_55614 ?auto_55615 ?auto_55616 ?auto_55617 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55618 - BLOCK
      ?auto_55619 - BLOCK
      ?auto_55620 - BLOCK
      ?auto_55621 - BLOCK
      ?auto_55622 - BLOCK
      ?auto_55623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55618 ) ( ON ?auto_55619 ?auto_55618 ) ( not ( = ?auto_55618 ?auto_55619 ) ) ( not ( = ?auto_55618 ?auto_55620 ) ) ( not ( = ?auto_55618 ?auto_55621 ) ) ( not ( = ?auto_55618 ?auto_55622 ) ) ( not ( = ?auto_55618 ?auto_55623 ) ) ( not ( = ?auto_55619 ?auto_55620 ) ) ( not ( = ?auto_55619 ?auto_55621 ) ) ( not ( = ?auto_55619 ?auto_55622 ) ) ( not ( = ?auto_55619 ?auto_55623 ) ) ( not ( = ?auto_55620 ?auto_55621 ) ) ( not ( = ?auto_55620 ?auto_55622 ) ) ( not ( = ?auto_55620 ?auto_55623 ) ) ( not ( = ?auto_55621 ?auto_55622 ) ) ( not ( = ?auto_55621 ?auto_55623 ) ) ( not ( = ?auto_55622 ?auto_55623 ) ) ( ON-TABLE ?auto_55623 ) ( ON ?auto_55622 ?auto_55623 ) ( ON ?auto_55621 ?auto_55622 ) ( CLEAR ?auto_55619 ) ( ON ?auto_55620 ?auto_55621 ) ( CLEAR ?auto_55620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55623 ?auto_55622 ?auto_55621 )
      ( MAKE-6PILE ?auto_55618 ?auto_55619 ?auto_55620 ?auto_55621 ?auto_55622 ?auto_55623 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55624 - BLOCK
      ?auto_55625 - BLOCK
      ?auto_55626 - BLOCK
      ?auto_55627 - BLOCK
      ?auto_55628 - BLOCK
      ?auto_55629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55624 ) ( not ( = ?auto_55624 ?auto_55625 ) ) ( not ( = ?auto_55624 ?auto_55626 ) ) ( not ( = ?auto_55624 ?auto_55627 ) ) ( not ( = ?auto_55624 ?auto_55628 ) ) ( not ( = ?auto_55624 ?auto_55629 ) ) ( not ( = ?auto_55625 ?auto_55626 ) ) ( not ( = ?auto_55625 ?auto_55627 ) ) ( not ( = ?auto_55625 ?auto_55628 ) ) ( not ( = ?auto_55625 ?auto_55629 ) ) ( not ( = ?auto_55626 ?auto_55627 ) ) ( not ( = ?auto_55626 ?auto_55628 ) ) ( not ( = ?auto_55626 ?auto_55629 ) ) ( not ( = ?auto_55627 ?auto_55628 ) ) ( not ( = ?auto_55627 ?auto_55629 ) ) ( not ( = ?auto_55628 ?auto_55629 ) ) ( ON-TABLE ?auto_55629 ) ( ON ?auto_55628 ?auto_55629 ) ( ON ?auto_55627 ?auto_55628 ) ( ON ?auto_55626 ?auto_55627 ) ( CLEAR ?auto_55626 ) ( HOLDING ?auto_55625 ) ( CLEAR ?auto_55624 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55624 ?auto_55625 )
      ( MAKE-6PILE ?auto_55624 ?auto_55625 ?auto_55626 ?auto_55627 ?auto_55628 ?auto_55629 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55630 - BLOCK
      ?auto_55631 - BLOCK
      ?auto_55632 - BLOCK
      ?auto_55633 - BLOCK
      ?auto_55634 - BLOCK
      ?auto_55635 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55630 ) ( not ( = ?auto_55630 ?auto_55631 ) ) ( not ( = ?auto_55630 ?auto_55632 ) ) ( not ( = ?auto_55630 ?auto_55633 ) ) ( not ( = ?auto_55630 ?auto_55634 ) ) ( not ( = ?auto_55630 ?auto_55635 ) ) ( not ( = ?auto_55631 ?auto_55632 ) ) ( not ( = ?auto_55631 ?auto_55633 ) ) ( not ( = ?auto_55631 ?auto_55634 ) ) ( not ( = ?auto_55631 ?auto_55635 ) ) ( not ( = ?auto_55632 ?auto_55633 ) ) ( not ( = ?auto_55632 ?auto_55634 ) ) ( not ( = ?auto_55632 ?auto_55635 ) ) ( not ( = ?auto_55633 ?auto_55634 ) ) ( not ( = ?auto_55633 ?auto_55635 ) ) ( not ( = ?auto_55634 ?auto_55635 ) ) ( ON-TABLE ?auto_55635 ) ( ON ?auto_55634 ?auto_55635 ) ( ON ?auto_55633 ?auto_55634 ) ( ON ?auto_55632 ?auto_55633 ) ( CLEAR ?auto_55630 ) ( ON ?auto_55631 ?auto_55632 ) ( CLEAR ?auto_55631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55635 ?auto_55634 ?auto_55633 ?auto_55632 )
      ( MAKE-6PILE ?auto_55630 ?auto_55631 ?auto_55632 ?auto_55633 ?auto_55634 ?auto_55635 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55636 - BLOCK
      ?auto_55637 - BLOCK
      ?auto_55638 - BLOCK
      ?auto_55639 - BLOCK
      ?auto_55640 - BLOCK
      ?auto_55641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55636 ?auto_55637 ) ) ( not ( = ?auto_55636 ?auto_55638 ) ) ( not ( = ?auto_55636 ?auto_55639 ) ) ( not ( = ?auto_55636 ?auto_55640 ) ) ( not ( = ?auto_55636 ?auto_55641 ) ) ( not ( = ?auto_55637 ?auto_55638 ) ) ( not ( = ?auto_55637 ?auto_55639 ) ) ( not ( = ?auto_55637 ?auto_55640 ) ) ( not ( = ?auto_55637 ?auto_55641 ) ) ( not ( = ?auto_55638 ?auto_55639 ) ) ( not ( = ?auto_55638 ?auto_55640 ) ) ( not ( = ?auto_55638 ?auto_55641 ) ) ( not ( = ?auto_55639 ?auto_55640 ) ) ( not ( = ?auto_55639 ?auto_55641 ) ) ( not ( = ?auto_55640 ?auto_55641 ) ) ( ON-TABLE ?auto_55641 ) ( ON ?auto_55640 ?auto_55641 ) ( ON ?auto_55639 ?auto_55640 ) ( ON ?auto_55638 ?auto_55639 ) ( ON ?auto_55637 ?auto_55638 ) ( CLEAR ?auto_55637 ) ( HOLDING ?auto_55636 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55636 )
      ( MAKE-6PILE ?auto_55636 ?auto_55637 ?auto_55638 ?auto_55639 ?auto_55640 ?auto_55641 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55642 - BLOCK
      ?auto_55643 - BLOCK
      ?auto_55644 - BLOCK
      ?auto_55645 - BLOCK
      ?auto_55646 - BLOCK
      ?auto_55647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55642 ?auto_55643 ) ) ( not ( = ?auto_55642 ?auto_55644 ) ) ( not ( = ?auto_55642 ?auto_55645 ) ) ( not ( = ?auto_55642 ?auto_55646 ) ) ( not ( = ?auto_55642 ?auto_55647 ) ) ( not ( = ?auto_55643 ?auto_55644 ) ) ( not ( = ?auto_55643 ?auto_55645 ) ) ( not ( = ?auto_55643 ?auto_55646 ) ) ( not ( = ?auto_55643 ?auto_55647 ) ) ( not ( = ?auto_55644 ?auto_55645 ) ) ( not ( = ?auto_55644 ?auto_55646 ) ) ( not ( = ?auto_55644 ?auto_55647 ) ) ( not ( = ?auto_55645 ?auto_55646 ) ) ( not ( = ?auto_55645 ?auto_55647 ) ) ( not ( = ?auto_55646 ?auto_55647 ) ) ( ON-TABLE ?auto_55647 ) ( ON ?auto_55646 ?auto_55647 ) ( ON ?auto_55645 ?auto_55646 ) ( ON ?auto_55644 ?auto_55645 ) ( ON ?auto_55643 ?auto_55644 ) ( ON ?auto_55642 ?auto_55643 ) ( CLEAR ?auto_55642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55647 ?auto_55646 ?auto_55645 ?auto_55644 ?auto_55643 )
      ( MAKE-6PILE ?auto_55642 ?auto_55643 ?auto_55644 ?auto_55645 ?auto_55646 ?auto_55647 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55648 - BLOCK
      ?auto_55649 - BLOCK
      ?auto_55650 - BLOCK
      ?auto_55651 - BLOCK
      ?auto_55652 - BLOCK
      ?auto_55653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55648 ?auto_55649 ) ) ( not ( = ?auto_55648 ?auto_55650 ) ) ( not ( = ?auto_55648 ?auto_55651 ) ) ( not ( = ?auto_55648 ?auto_55652 ) ) ( not ( = ?auto_55648 ?auto_55653 ) ) ( not ( = ?auto_55649 ?auto_55650 ) ) ( not ( = ?auto_55649 ?auto_55651 ) ) ( not ( = ?auto_55649 ?auto_55652 ) ) ( not ( = ?auto_55649 ?auto_55653 ) ) ( not ( = ?auto_55650 ?auto_55651 ) ) ( not ( = ?auto_55650 ?auto_55652 ) ) ( not ( = ?auto_55650 ?auto_55653 ) ) ( not ( = ?auto_55651 ?auto_55652 ) ) ( not ( = ?auto_55651 ?auto_55653 ) ) ( not ( = ?auto_55652 ?auto_55653 ) ) ( ON-TABLE ?auto_55653 ) ( ON ?auto_55652 ?auto_55653 ) ( ON ?auto_55651 ?auto_55652 ) ( ON ?auto_55650 ?auto_55651 ) ( ON ?auto_55649 ?auto_55650 ) ( HOLDING ?auto_55648 ) ( CLEAR ?auto_55649 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55653 ?auto_55652 ?auto_55651 ?auto_55650 ?auto_55649 ?auto_55648 )
      ( MAKE-6PILE ?auto_55648 ?auto_55649 ?auto_55650 ?auto_55651 ?auto_55652 ?auto_55653 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55654 - BLOCK
      ?auto_55655 - BLOCK
      ?auto_55656 - BLOCK
      ?auto_55657 - BLOCK
      ?auto_55658 - BLOCK
      ?auto_55659 - BLOCK
    )
    :vars
    (
      ?auto_55660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55654 ?auto_55655 ) ) ( not ( = ?auto_55654 ?auto_55656 ) ) ( not ( = ?auto_55654 ?auto_55657 ) ) ( not ( = ?auto_55654 ?auto_55658 ) ) ( not ( = ?auto_55654 ?auto_55659 ) ) ( not ( = ?auto_55655 ?auto_55656 ) ) ( not ( = ?auto_55655 ?auto_55657 ) ) ( not ( = ?auto_55655 ?auto_55658 ) ) ( not ( = ?auto_55655 ?auto_55659 ) ) ( not ( = ?auto_55656 ?auto_55657 ) ) ( not ( = ?auto_55656 ?auto_55658 ) ) ( not ( = ?auto_55656 ?auto_55659 ) ) ( not ( = ?auto_55657 ?auto_55658 ) ) ( not ( = ?auto_55657 ?auto_55659 ) ) ( not ( = ?auto_55658 ?auto_55659 ) ) ( ON-TABLE ?auto_55659 ) ( ON ?auto_55658 ?auto_55659 ) ( ON ?auto_55657 ?auto_55658 ) ( ON ?auto_55656 ?auto_55657 ) ( ON ?auto_55655 ?auto_55656 ) ( CLEAR ?auto_55655 ) ( ON ?auto_55654 ?auto_55660 ) ( CLEAR ?auto_55654 ) ( HAND-EMPTY ) ( not ( = ?auto_55654 ?auto_55660 ) ) ( not ( = ?auto_55655 ?auto_55660 ) ) ( not ( = ?auto_55656 ?auto_55660 ) ) ( not ( = ?auto_55657 ?auto_55660 ) ) ( not ( = ?auto_55658 ?auto_55660 ) ) ( not ( = ?auto_55659 ?auto_55660 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55654 ?auto_55660 )
      ( MAKE-6PILE ?auto_55654 ?auto_55655 ?auto_55656 ?auto_55657 ?auto_55658 ?auto_55659 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55661 - BLOCK
      ?auto_55662 - BLOCK
      ?auto_55663 - BLOCK
      ?auto_55664 - BLOCK
      ?auto_55665 - BLOCK
      ?auto_55666 - BLOCK
    )
    :vars
    (
      ?auto_55667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55661 ?auto_55662 ) ) ( not ( = ?auto_55661 ?auto_55663 ) ) ( not ( = ?auto_55661 ?auto_55664 ) ) ( not ( = ?auto_55661 ?auto_55665 ) ) ( not ( = ?auto_55661 ?auto_55666 ) ) ( not ( = ?auto_55662 ?auto_55663 ) ) ( not ( = ?auto_55662 ?auto_55664 ) ) ( not ( = ?auto_55662 ?auto_55665 ) ) ( not ( = ?auto_55662 ?auto_55666 ) ) ( not ( = ?auto_55663 ?auto_55664 ) ) ( not ( = ?auto_55663 ?auto_55665 ) ) ( not ( = ?auto_55663 ?auto_55666 ) ) ( not ( = ?auto_55664 ?auto_55665 ) ) ( not ( = ?auto_55664 ?auto_55666 ) ) ( not ( = ?auto_55665 ?auto_55666 ) ) ( ON-TABLE ?auto_55666 ) ( ON ?auto_55665 ?auto_55666 ) ( ON ?auto_55664 ?auto_55665 ) ( ON ?auto_55663 ?auto_55664 ) ( ON ?auto_55661 ?auto_55667 ) ( CLEAR ?auto_55661 ) ( not ( = ?auto_55661 ?auto_55667 ) ) ( not ( = ?auto_55662 ?auto_55667 ) ) ( not ( = ?auto_55663 ?auto_55667 ) ) ( not ( = ?auto_55664 ?auto_55667 ) ) ( not ( = ?auto_55665 ?auto_55667 ) ) ( not ( = ?auto_55666 ?auto_55667 ) ) ( HOLDING ?auto_55662 ) ( CLEAR ?auto_55663 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55666 ?auto_55665 ?auto_55664 ?auto_55663 ?auto_55662 )
      ( MAKE-6PILE ?auto_55661 ?auto_55662 ?auto_55663 ?auto_55664 ?auto_55665 ?auto_55666 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55668 - BLOCK
      ?auto_55669 - BLOCK
      ?auto_55670 - BLOCK
      ?auto_55671 - BLOCK
      ?auto_55672 - BLOCK
      ?auto_55673 - BLOCK
    )
    :vars
    (
      ?auto_55674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55668 ?auto_55669 ) ) ( not ( = ?auto_55668 ?auto_55670 ) ) ( not ( = ?auto_55668 ?auto_55671 ) ) ( not ( = ?auto_55668 ?auto_55672 ) ) ( not ( = ?auto_55668 ?auto_55673 ) ) ( not ( = ?auto_55669 ?auto_55670 ) ) ( not ( = ?auto_55669 ?auto_55671 ) ) ( not ( = ?auto_55669 ?auto_55672 ) ) ( not ( = ?auto_55669 ?auto_55673 ) ) ( not ( = ?auto_55670 ?auto_55671 ) ) ( not ( = ?auto_55670 ?auto_55672 ) ) ( not ( = ?auto_55670 ?auto_55673 ) ) ( not ( = ?auto_55671 ?auto_55672 ) ) ( not ( = ?auto_55671 ?auto_55673 ) ) ( not ( = ?auto_55672 ?auto_55673 ) ) ( ON-TABLE ?auto_55673 ) ( ON ?auto_55672 ?auto_55673 ) ( ON ?auto_55671 ?auto_55672 ) ( ON ?auto_55670 ?auto_55671 ) ( ON ?auto_55668 ?auto_55674 ) ( not ( = ?auto_55668 ?auto_55674 ) ) ( not ( = ?auto_55669 ?auto_55674 ) ) ( not ( = ?auto_55670 ?auto_55674 ) ) ( not ( = ?auto_55671 ?auto_55674 ) ) ( not ( = ?auto_55672 ?auto_55674 ) ) ( not ( = ?auto_55673 ?auto_55674 ) ) ( CLEAR ?auto_55670 ) ( ON ?auto_55669 ?auto_55668 ) ( CLEAR ?auto_55669 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55674 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55674 ?auto_55668 )
      ( MAKE-6PILE ?auto_55668 ?auto_55669 ?auto_55670 ?auto_55671 ?auto_55672 ?auto_55673 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55675 - BLOCK
      ?auto_55676 - BLOCK
      ?auto_55677 - BLOCK
      ?auto_55678 - BLOCK
      ?auto_55679 - BLOCK
      ?auto_55680 - BLOCK
    )
    :vars
    (
      ?auto_55681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55675 ?auto_55676 ) ) ( not ( = ?auto_55675 ?auto_55677 ) ) ( not ( = ?auto_55675 ?auto_55678 ) ) ( not ( = ?auto_55675 ?auto_55679 ) ) ( not ( = ?auto_55675 ?auto_55680 ) ) ( not ( = ?auto_55676 ?auto_55677 ) ) ( not ( = ?auto_55676 ?auto_55678 ) ) ( not ( = ?auto_55676 ?auto_55679 ) ) ( not ( = ?auto_55676 ?auto_55680 ) ) ( not ( = ?auto_55677 ?auto_55678 ) ) ( not ( = ?auto_55677 ?auto_55679 ) ) ( not ( = ?auto_55677 ?auto_55680 ) ) ( not ( = ?auto_55678 ?auto_55679 ) ) ( not ( = ?auto_55678 ?auto_55680 ) ) ( not ( = ?auto_55679 ?auto_55680 ) ) ( ON-TABLE ?auto_55680 ) ( ON ?auto_55679 ?auto_55680 ) ( ON ?auto_55678 ?auto_55679 ) ( ON ?auto_55675 ?auto_55681 ) ( not ( = ?auto_55675 ?auto_55681 ) ) ( not ( = ?auto_55676 ?auto_55681 ) ) ( not ( = ?auto_55677 ?auto_55681 ) ) ( not ( = ?auto_55678 ?auto_55681 ) ) ( not ( = ?auto_55679 ?auto_55681 ) ) ( not ( = ?auto_55680 ?auto_55681 ) ) ( ON ?auto_55676 ?auto_55675 ) ( CLEAR ?auto_55676 ) ( ON-TABLE ?auto_55681 ) ( HOLDING ?auto_55677 ) ( CLEAR ?auto_55678 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55680 ?auto_55679 ?auto_55678 ?auto_55677 )
      ( MAKE-6PILE ?auto_55675 ?auto_55676 ?auto_55677 ?auto_55678 ?auto_55679 ?auto_55680 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55682 - BLOCK
      ?auto_55683 - BLOCK
      ?auto_55684 - BLOCK
      ?auto_55685 - BLOCK
      ?auto_55686 - BLOCK
      ?auto_55687 - BLOCK
    )
    :vars
    (
      ?auto_55688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55682 ?auto_55683 ) ) ( not ( = ?auto_55682 ?auto_55684 ) ) ( not ( = ?auto_55682 ?auto_55685 ) ) ( not ( = ?auto_55682 ?auto_55686 ) ) ( not ( = ?auto_55682 ?auto_55687 ) ) ( not ( = ?auto_55683 ?auto_55684 ) ) ( not ( = ?auto_55683 ?auto_55685 ) ) ( not ( = ?auto_55683 ?auto_55686 ) ) ( not ( = ?auto_55683 ?auto_55687 ) ) ( not ( = ?auto_55684 ?auto_55685 ) ) ( not ( = ?auto_55684 ?auto_55686 ) ) ( not ( = ?auto_55684 ?auto_55687 ) ) ( not ( = ?auto_55685 ?auto_55686 ) ) ( not ( = ?auto_55685 ?auto_55687 ) ) ( not ( = ?auto_55686 ?auto_55687 ) ) ( ON-TABLE ?auto_55687 ) ( ON ?auto_55686 ?auto_55687 ) ( ON ?auto_55685 ?auto_55686 ) ( ON ?auto_55682 ?auto_55688 ) ( not ( = ?auto_55682 ?auto_55688 ) ) ( not ( = ?auto_55683 ?auto_55688 ) ) ( not ( = ?auto_55684 ?auto_55688 ) ) ( not ( = ?auto_55685 ?auto_55688 ) ) ( not ( = ?auto_55686 ?auto_55688 ) ) ( not ( = ?auto_55687 ?auto_55688 ) ) ( ON ?auto_55683 ?auto_55682 ) ( ON-TABLE ?auto_55688 ) ( CLEAR ?auto_55685 ) ( ON ?auto_55684 ?auto_55683 ) ( CLEAR ?auto_55684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55688 ?auto_55682 ?auto_55683 )
      ( MAKE-6PILE ?auto_55682 ?auto_55683 ?auto_55684 ?auto_55685 ?auto_55686 ?auto_55687 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55689 - BLOCK
      ?auto_55690 - BLOCK
      ?auto_55691 - BLOCK
      ?auto_55692 - BLOCK
      ?auto_55693 - BLOCK
      ?auto_55694 - BLOCK
    )
    :vars
    (
      ?auto_55695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55689 ?auto_55690 ) ) ( not ( = ?auto_55689 ?auto_55691 ) ) ( not ( = ?auto_55689 ?auto_55692 ) ) ( not ( = ?auto_55689 ?auto_55693 ) ) ( not ( = ?auto_55689 ?auto_55694 ) ) ( not ( = ?auto_55690 ?auto_55691 ) ) ( not ( = ?auto_55690 ?auto_55692 ) ) ( not ( = ?auto_55690 ?auto_55693 ) ) ( not ( = ?auto_55690 ?auto_55694 ) ) ( not ( = ?auto_55691 ?auto_55692 ) ) ( not ( = ?auto_55691 ?auto_55693 ) ) ( not ( = ?auto_55691 ?auto_55694 ) ) ( not ( = ?auto_55692 ?auto_55693 ) ) ( not ( = ?auto_55692 ?auto_55694 ) ) ( not ( = ?auto_55693 ?auto_55694 ) ) ( ON-TABLE ?auto_55694 ) ( ON ?auto_55693 ?auto_55694 ) ( ON ?auto_55689 ?auto_55695 ) ( not ( = ?auto_55689 ?auto_55695 ) ) ( not ( = ?auto_55690 ?auto_55695 ) ) ( not ( = ?auto_55691 ?auto_55695 ) ) ( not ( = ?auto_55692 ?auto_55695 ) ) ( not ( = ?auto_55693 ?auto_55695 ) ) ( not ( = ?auto_55694 ?auto_55695 ) ) ( ON ?auto_55690 ?auto_55689 ) ( ON-TABLE ?auto_55695 ) ( ON ?auto_55691 ?auto_55690 ) ( CLEAR ?auto_55691 ) ( HOLDING ?auto_55692 ) ( CLEAR ?auto_55693 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55694 ?auto_55693 ?auto_55692 )
      ( MAKE-6PILE ?auto_55689 ?auto_55690 ?auto_55691 ?auto_55692 ?auto_55693 ?auto_55694 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55696 - BLOCK
      ?auto_55697 - BLOCK
      ?auto_55698 - BLOCK
      ?auto_55699 - BLOCK
      ?auto_55700 - BLOCK
      ?auto_55701 - BLOCK
    )
    :vars
    (
      ?auto_55702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55696 ?auto_55697 ) ) ( not ( = ?auto_55696 ?auto_55698 ) ) ( not ( = ?auto_55696 ?auto_55699 ) ) ( not ( = ?auto_55696 ?auto_55700 ) ) ( not ( = ?auto_55696 ?auto_55701 ) ) ( not ( = ?auto_55697 ?auto_55698 ) ) ( not ( = ?auto_55697 ?auto_55699 ) ) ( not ( = ?auto_55697 ?auto_55700 ) ) ( not ( = ?auto_55697 ?auto_55701 ) ) ( not ( = ?auto_55698 ?auto_55699 ) ) ( not ( = ?auto_55698 ?auto_55700 ) ) ( not ( = ?auto_55698 ?auto_55701 ) ) ( not ( = ?auto_55699 ?auto_55700 ) ) ( not ( = ?auto_55699 ?auto_55701 ) ) ( not ( = ?auto_55700 ?auto_55701 ) ) ( ON-TABLE ?auto_55701 ) ( ON ?auto_55700 ?auto_55701 ) ( ON ?auto_55696 ?auto_55702 ) ( not ( = ?auto_55696 ?auto_55702 ) ) ( not ( = ?auto_55697 ?auto_55702 ) ) ( not ( = ?auto_55698 ?auto_55702 ) ) ( not ( = ?auto_55699 ?auto_55702 ) ) ( not ( = ?auto_55700 ?auto_55702 ) ) ( not ( = ?auto_55701 ?auto_55702 ) ) ( ON ?auto_55697 ?auto_55696 ) ( ON-TABLE ?auto_55702 ) ( ON ?auto_55698 ?auto_55697 ) ( CLEAR ?auto_55700 ) ( ON ?auto_55699 ?auto_55698 ) ( CLEAR ?auto_55699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55702 ?auto_55696 ?auto_55697 ?auto_55698 )
      ( MAKE-6PILE ?auto_55696 ?auto_55697 ?auto_55698 ?auto_55699 ?auto_55700 ?auto_55701 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55703 - BLOCK
      ?auto_55704 - BLOCK
      ?auto_55705 - BLOCK
      ?auto_55706 - BLOCK
      ?auto_55707 - BLOCK
      ?auto_55708 - BLOCK
    )
    :vars
    (
      ?auto_55709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55703 ?auto_55704 ) ) ( not ( = ?auto_55703 ?auto_55705 ) ) ( not ( = ?auto_55703 ?auto_55706 ) ) ( not ( = ?auto_55703 ?auto_55707 ) ) ( not ( = ?auto_55703 ?auto_55708 ) ) ( not ( = ?auto_55704 ?auto_55705 ) ) ( not ( = ?auto_55704 ?auto_55706 ) ) ( not ( = ?auto_55704 ?auto_55707 ) ) ( not ( = ?auto_55704 ?auto_55708 ) ) ( not ( = ?auto_55705 ?auto_55706 ) ) ( not ( = ?auto_55705 ?auto_55707 ) ) ( not ( = ?auto_55705 ?auto_55708 ) ) ( not ( = ?auto_55706 ?auto_55707 ) ) ( not ( = ?auto_55706 ?auto_55708 ) ) ( not ( = ?auto_55707 ?auto_55708 ) ) ( ON-TABLE ?auto_55708 ) ( ON ?auto_55703 ?auto_55709 ) ( not ( = ?auto_55703 ?auto_55709 ) ) ( not ( = ?auto_55704 ?auto_55709 ) ) ( not ( = ?auto_55705 ?auto_55709 ) ) ( not ( = ?auto_55706 ?auto_55709 ) ) ( not ( = ?auto_55707 ?auto_55709 ) ) ( not ( = ?auto_55708 ?auto_55709 ) ) ( ON ?auto_55704 ?auto_55703 ) ( ON-TABLE ?auto_55709 ) ( ON ?auto_55705 ?auto_55704 ) ( ON ?auto_55706 ?auto_55705 ) ( CLEAR ?auto_55706 ) ( HOLDING ?auto_55707 ) ( CLEAR ?auto_55708 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55708 ?auto_55707 )
      ( MAKE-6PILE ?auto_55703 ?auto_55704 ?auto_55705 ?auto_55706 ?auto_55707 ?auto_55708 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55710 - BLOCK
      ?auto_55711 - BLOCK
      ?auto_55712 - BLOCK
      ?auto_55713 - BLOCK
      ?auto_55714 - BLOCK
      ?auto_55715 - BLOCK
    )
    :vars
    (
      ?auto_55716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55710 ?auto_55711 ) ) ( not ( = ?auto_55710 ?auto_55712 ) ) ( not ( = ?auto_55710 ?auto_55713 ) ) ( not ( = ?auto_55710 ?auto_55714 ) ) ( not ( = ?auto_55710 ?auto_55715 ) ) ( not ( = ?auto_55711 ?auto_55712 ) ) ( not ( = ?auto_55711 ?auto_55713 ) ) ( not ( = ?auto_55711 ?auto_55714 ) ) ( not ( = ?auto_55711 ?auto_55715 ) ) ( not ( = ?auto_55712 ?auto_55713 ) ) ( not ( = ?auto_55712 ?auto_55714 ) ) ( not ( = ?auto_55712 ?auto_55715 ) ) ( not ( = ?auto_55713 ?auto_55714 ) ) ( not ( = ?auto_55713 ?auto_55715 ) ) ( not ( = ?auto_55714 ?auto_55715 ) ) ( ON-TABLE ?auto_55715 ) ( ON ?auto_55710 ?auto_55716 ) ( not ( = ?auto_55710 ?auto_55716 ) ) ( not ( = ?auto_55711 ?auto_55716 ) ) ( not ( = ?auto_55712 ?auto_55716 ) ) ( not ( = ?auto_55713 ?auto_55716 ) ) ( not ( = ?auto_55714 ?auto_55716 ) ) ( not ( = ?auto_55715 ?auto_55716 ) ) ( ON ?auto_55711 ?auto_55710 ) ( ON-TABLE ?auto_55716 ) ( ON ?auto_55712 ?auto_55711 ) ( ON ?auto_55713 ?auto_55712 ) ( CLEAR ?auto_55715 ) ( ON ?auto_55714 ?auto_55713 ) ( CLEAR ?auto_55714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55716 ?auto_55710 ?auto_55711 ?auto_55712 ?auto_55713 )
      ( MAKE-6PILE ?auto_55710 ?auto_55711 ?auto_55712 ?auto_55713 ?auto_55714 ?auto_55715 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55717 - BLOCK
      ?auto_55718 - BLOCK
      ?auto_55719 - BLOCK
      ?auto_55720 - BLOCK
      ?auto_55721 - BLOCK
      ?auto_55722 - BLOCK
    )
    :vars
    (
      ?auto_55723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55717 ?auto_55718 ) ) ( not ( = ?auto_55717 ?auto_55719 ) ) ( not ( = ?auto_55717 ?auto_55720 ) ) ( not ( = ?auto_55717 ?auto_55721 ) ) ( not ( = ?auto_55717 ?auto_55722 ) ) ( not ( = ?auto_55718 ?auto_55719 ) ) ( not ( = ?auto_55718 ?auto_55720 ) ) ( not ( = ?auto_55718 ?auto_55721 ) ) ( not ( = ?auto_55718 ?auto_55722 ) ) ( not ( = ?auto_55719 ?auto_55720 ) ) ( not ( = ?auto_55719 ?auto_55721 ) ) ( not ( = ?auto_55719 ?auto_55722 ) ) ( not ( = ?auto_55720 ?auto_55721 ) ) ( not ( = ?auto_55720 ?auto_55722 ) ) ( not ( = ?auto_55721 ?auto_55722 ) ) ( ON ?auto_55717 ?auto_55723 ) ( not ( = ?auto_55717 ?auto_55723 ) ) ( not ( = ?auto_55718 ?auto_55723 ) ) ( not ( = ?auto_55719 ?auto_55723 ) ) ( not ( = ?auto_55720 ?auto_55723 ) ) ( not ( = ?auto_55721 ?auto_55723 ) ) ( not ( = ?auto_55722 ?auto_55723 ) ) ( ON ?auto_55718 ?auto_55717 ) ( ON-TABLE ?auto_55723 ) ( ON ?auto_55719 ?auto_55718 ) ( ON ?auto_55720 ?auto_55719 ) ( ON ?auto_55721 ?auto_55720 ) ( CLEAR ?auto_55721 ) ( HOLDING ?auto_55722 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55722 )
      ( MAKE-6PILE ?auto_55717 ?auto_55718 ?auto_55719 ?auto_55720 ?auto_55721 ?auto_55722 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55724 - BLOCK
      ?auto_55725 - BLOCK
      ?auto_55726 - BLOCK
      ?auto_55727 - BLOCK
      ?auto_55728 - BLOCK
      ?auto_55729 - BLOCK
    )
    :vars
    (
      ?auto_55730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55724 ?auto_55725 ) ) ( not ( = ?auto_55724 ?auto_55726 ) ) ( not ( = ?auto_55724 ?auto_55727 ) ) ( not ( = ?auto_55724 ?auto_55728 ) ) ( not ( = ?auto_55724 ?auto_55729 ) ) ( not ( = ?auto_55725 ?auto_55726 ) ) ( not ( = ?auto_55725 ?auto_55727 ) ) ( not ( = ?auto_55725 ?auto_55728 ) ) ( not ( = ?auto_55725 ?auto_55729 ) ) ( not ( = ?auto_55726 ?auto_55727 ) ) ( not ( = ?auto_55726 ?auto_55728 ) ) ( not ( = ?auto_55726 ?auto_55729 ) ) ( not ( = ?auto_55727 ?auto_55728 ) ) ( not ( = ?auto_55727 ?auto_55729 ) ) ( not ( = ?auto_55728 ?auto_55729 ) ) ( ON ?auto_55724 ?auto_55730 ) ( not ( = ?auto_55724 ?auto_55730 ) ) ( not ( = ?auto_55725 ?auto_55730 ) ) ( not ( = ?auto_55726 ?auto_55730 ) ) ( not ( = ?auto_55727 ?auto_55730 ) ) ( not ( = ?auto_55728 ?auto_55730 ) ) ( not ( = ?auto_55729 ?auto_55730 ) ) ( ON ?auto_55725 ?auto_55724 ) ( ON-TABLE ?auto_55730 ) ( ON ?auto_55726 ?auto_55725 ) ( ON ?auto_55727 ?auto_55726 ) ( ON ?auto_55728 ?auto_55727 ) ( ON ?auto_55729 ?auto_55728 ) ( CLEAR ?auto_55729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55730 ?auto_55724 ?auto_55725 ?auto_55726 ?auto_55727 ?auto_55728 )
      ( MAKE-6PILE ?auto_55724 ?auto_55725 ?auto_55726 ?auto_55727 ?auto_55728 ?auto_55729 ) )
  )

)

